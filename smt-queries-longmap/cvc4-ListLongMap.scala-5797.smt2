; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74800 () Bool)

(assert start!74800)

(declare-fun b_free!15377 () Bool)

(declare-fun b_next!15377 () Bool)

(assert (=> start!74800 (= b_free!15377 (not b_next!15377))))

(declare-fun tp!53827 () Bool)

(declare-fun b_and!25421 () Bool)

(assert (=> start!74800 (= tp!53827 b_and!25421)))

(declare-fun b!881732 () Bool)

(declare-fun e!490711 () Bool)

(declare-fun tp_is_empty!17621 () Bool)

(assert (=> b!881732 (= e!490711 tp_is_empty!17621)))

(declare-fun res!599013 () Bool)

(declare-fun e!490710 () Bool)

(assert (=> start!74800 (=> (not res!599013) (not e!490710))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51370 0))(
  ( (array!51371 (arr!24706 (Array (_ BitVec 32) (_ BitVec 64))) (size!25146 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51370)

(assert (=> start!74800 (= res!599013 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25146 _keys!868))))))

(assert (=> start!74800 e!490710))

(assert (=> start!74800 tp_is_empty!17621))

(assert (=> start!74800 true))

(assert (=> start!74800 tp!53827))

(declare-fun array_inv!19456 (array!51370) Bool)

(assert (=> start!74800 (array_inv!19456 _keys!868)))

(declare-datatypes ((V!28541 0))(
  ( (V!28542 (val!8858 Int)) )
))
(declare-datatypes ((ValueCell!8371 0))(
  ( (ValueCellFull!8371 (v!11318 V!28541)) (EmptyCell!8371) )
))
(declare-datatypes ((array!51372 0))(
  ( (array!51373 (arr!24707 (Array (_ BitVec 32) ValueCell!8371)) (size!25147 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51372)

(declare-fun e!490707 () Bool)

(declare-fun array_inv!19457 (array!51372) Bool)

(assert (=> start!74800 (and (array_inv!19457 _values!688) e!490707)))

(declare-fun b!881733 () Bool)

(declare-fun e!490709 () Bool)

(assert (=> b!881733 (= e!490709 tp_is_empty!17621)))

(declare-fun b!881734 () Bool)

(declare-fun res!599008 () Bool)

(assert (=> b!881734 (=> (not res!599008) (not e!490710))))

(declare-datatypes ((List!17539 0))(
  ( (Nil!17536) (Cons!17535 (h!18666 (_ BitVec 64)) (t!24718 List!17539)) )
))
(declare-fun arrayNoDuplicates!0 (array!51370 (_ BitVec 32) List!17539) Bool)

(assert (=> b!881734 (= res!599008 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17536))))

(declare-fun mapIsEmpty!28062 () Bool)

(declare-fun mapRes!28062 () Bool)

(assert (=> mapIsEmpty!28062 mapRes!28062))

(declare-fun mapNonEmpty!28062 () Bool)

(declare-fun tp!53828 () Bool)

(assert (=> mapNonEmpty!28062 (= mapRes!28062 (and tp!53828 e!490709))))

(declare-fun mapRest!28062 () (Array (_ BitVec 32) ValueCell!8371))

(declare-fun mapValue!28062 () ValueCell!8371)

(declare-fun mapKey!28062 () (_ BitVec 32))

(assert (=> mapNonEmpty!28062 (= (arr!24707 _values!688) (store mapRest!28062 mapKey!28062 mapValue!28062))))

(declare-fun b!881735 () Bool)

(declare-fun e!490713 () Bool)

(assert (=> b!881735 (= e!490713 true)))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!51370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881735 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30088 0))(
  ( (Unit!30089) )
))
(declare-fun lt!398832 () Unit!30088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30088)

(assert (=> b!881735 (= lt!398832 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881735 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17536)))

(declare-fun lt!398834 () Unit!30088)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51370 (_ BitVec 32) (_ BitVec 32)) Unit!30088)

(assert (=> b!881735 (= lt!398834 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881736 () Bool)

(declare-fun res!599009 () Bool)

(assert (=> b!881736 (=> (not res!599009) (not e!490710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881736 (= res!599009 (validKeyInArray!0 k!854))))

(declare-fun b!881737 () Bool)

(declare-fun res!599011 () Bool)

(assert (=> b!881737 (=> (not res!599011) (not e!490710))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51370 (_ BitVec 32)) Bool)

(assert (=> b!881737 (= res!599011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881738 () Bool)

(declare-fun e!490708 () Bool)

(assert (=> b!881738 (= e!490708 e!490713)))

(declare-fun res!599010 () Bool)

(assert (=> b!881738 (=> res!599010 e!490713)))

(assert (=> b!881738 (= res!599010 (not (= (select (arr!24706 _keys!868) from!1053) k!854)))))

(declare-datatypes ((tuple2!11726 0))(
  ( (tuple2!11727 (_1!5874 (_ BitVec 64)) (_2!5874 V!28541)) )
))
(declare-datatypes ((List!17540 0))(
  ( (Nil!17537) (Cons!17536 (h!18667 tuple2!11726) (t!24719 List!17540)) )
))
(declare-datatypes ((ListLongMap!10495 0))(
  ( (ListLongMap!10496 (toList!5263 List!17540)) )
))
(declare-fun lt!398835 () ListLongMap!10495)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398840 () ListLongMap!10495)

(declare-fun +!2535 (ListLongMap!10495 tuple2!11726) ListLongMap!10495)

(declare-fun get!13003 (ValueCell!8371 V!28541) V!28541)

(declare-fun dynLambda!1250 (Int (_ BitVec 64)) V!28541)

(assert (=> b!881738 (= lt!398835 (+!2535 lt!398840 (tuple2!11727 (select (arr!24706 _keys!868) from!1053) (get!13003 (select (arr!24707 _values!688) from!1053) (dynLambda!1250 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881739 () Bool)

(declare-fun e!490706 () Bool)

(assert (=> b!881739 (= e!490710 e!490706)))

(declare-fun res!599005 () Bool)

(assert (=> b!881739 (=> (not res!599005) (not e!490706))))

(assert (=> b!881739 (= res!599005 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398839 () array!51372)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28541)

(declare-fun zeroValue!654 () V!28541)

(declare-fun getCurrentListMapNoExtraKeys!3226 (array!51370 array!51372 (_ BitVec 32) (_ BitVec 32) V!28541 V!28541 (_ BitVec 32) Int) ListLongMap!10495)

(assert (=> b!881739 (= lt!398835 (getCurrentListMapNoExtraKeys!3226 _keys!868 lt!398839 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28541)

(assert (=> b!881739 (= lt!398839 (array!51373 (store (arr!24707 _values!688) i!612 (ValueCellFull!8371 v!557)) (size!25147 _values!688)))))

(declare-fun lt!398838 () ListLongMap!10495)

(assert (=> b!881739 (= lt!398838 (getCurrentListMapNoExtraKeys!3226 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881740 () Bool)

(assert (=> b!881740 (= e!490706 (not e!490708))))

(declare-fun res!599004 () Bool)

(assert (=> b!881740 (=> res!599004 e!490708)))

(assert (=> b!881740 (= res!599004 (not (validKeyInArray!0 (select (arr!24706 _keys!868) from!1053))))))

(declare-fun lt!398833 () ListLongMap!10495)

(assert (=> b!881740 (= lt!398833 lt!398840)))

(declare-fun lt!398837 () ListLongMap!10495)

(assert (=> b!881740 (= lt!398840 (+!2535 lt!398837 (tuple2!11727 k!854 v!557)))))

(assert (=> b!881740 (= lt!398833 (getCurrentListMapNoExtraKeys!3226 _keys!868 lt!398839 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881740 (= lt!398837 (getCurrentListMapNoExtraKeys!3226 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398836 () Unit!30088)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!724 (array!51370 array!51372 (_ BitVec 32) (_ BitVec 32) V!28541 V!28541 (_ BitVec 32) (_ BitVec 64) V!28541 (_ BitVec 32) Int) Unit!30088)

(assert (=> b!881740 (= lt!398836 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!724 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881741 () Bool)

(declare-fun res!599007 () Bool)

(assert (=> b!881741 (=> (not res!599007) (not e!490710))))

(assert (=> b!881741 (= res!599007 (and (= (size!25147 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25146 _keys!868) (size!25147 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881742 () Bool)

(declare-fun res!599003 () Bool)

(assert (=> b!881742 (=> (not res!599003) (not e!490710))))

(assert (=> b!881742 (= res!599003 (and (= (select (arr!24706 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!881743 () Bool)

(assert (=> b!881743 (= e!490707 (and e!490711 mapRes!28062))))

(declare-fun condMapEmpty!28062 () Bool)

(declare-fun mapDefault!28062 () ValueCell!8371)

