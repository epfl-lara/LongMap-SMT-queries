; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74682 () Bool)

(assert start!74682)

(declare-fun b_free!15331 () Bool)

(declare-fun b_next!15331 () Bool)

(assert (=> start!74682 (= b_free!15331 (not b_next!15331))))

(declare-fun tp!53681 () Bool)

(declare-fun b_and!25281 () Bool)

(assert (=> start!74682 (= tp!53681 b_and!25281)))

(declare-fun b!880294 () Bool)

(declare-fun e!489877 () Bool)

(declare-fun tp_is_empty!17575 () Bool)

(assert (=> b!880294 (= e!489877 tp_is_empty!17575)))

(declare-fun b!880295 () Bool)

(declare-fun res!598071 () Bool)

(declare-fun e!489878 () Bool)

(assert (=> b!880295 (=> (not res!598071) (not e!489878))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51278 0))(
  ( (array!51279 (arr!24663 (Array (_ BitVec 32) (_ BitVec 64))) (size!25103 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51278)

(assert (=> b!880295 (= res!598071 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25103 _keys!868))))))

(declare-fun b!880296 () Bool)

(declare-fun res!598065 () Bool)

(assert (=> b!880296 (=> (not res!598065) (not e!489878))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51278 (_ BitVec 32)) Bool)

(assert (=> b!880296 (= res!598065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880297 () Bool)

(declare-fun e!489880 () Bool)

(assert (=> b!880297 (= e!489878 e!489880)))

(declare-fun res!598073 () Bool)

(assert (=> b!880297 (=> (not res!598073) (not e!489880))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880297 (= res!598073 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28481 0))(
  ( (V!28482 (val!8835 Int)) )
))
(declare-datatypes ((tuple2!11692 0))(
  ( (tuple2!11693 (_1!5857 (_ BitVec 64)) (_2!5857 V!28481)) )
))
(declare-datatypes ((List!17505 0))(
  ( (Nil!17502) (Cons!17501 (h!18632 tuple2!11692) (t!24638 List!17505)) )
))
(declare-datatypes ((ListLongMap!10461 0))(
  ( (ListLongMap!10462 (toList!5246 List!17505)) )
))
(declare-fun lt!398048 () ListLongMap!10461)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8348 0))(
  ( (ValueCellFull!8348 (v!11283 V!28481)) (EmptyCell!8348) )
))
(declare-datatypes ((array!51280 0))(
  ( (array!51281 (arr!24664 (Array (_ BitVec 32) ValueCell!8348)) (size!25104 (_ BitVec 32))) )
))
(declare-fun lt!398041 () array!51280)

(declare-fun minValue!654 () V!28481)

(declare-fun zeroValue!654 () V!28481)

(declare-fun getCurrentListMapNoExtraKeys!3209 (array!51278 array!51280 (_ BitVec 32) (_ BitVec 32) V!28481 V!28481 (_ BitVec 32) Int) ListLongMap!10461)

(assert (=> b!880297 (= lt!398048 (getCurrentListMapNoExtraKeys!3209 _keys!868 lt!398041 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28481)

(declare-fun _values!688 () array!51280)

(assert (=> b!880297 (= lt!398041 (array!51281 (store (arr!24664 _values!688) i!612 (ValueCellFull!8348 v!557)) (size!25104 _values!688)))))

(declare-fun lt!398045 () ListLongMap!10461)

(assert (=> b!880297 (= lt!398045 (getCurrentListMapNoExtraKeys!3209 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880298 () Bool)

(declare-fun e!489879 () Bool)

(assert (=> b!880298 (= e!489879 true)))

(declare-datatypes ((List!17506 0))(
  ( (Nil!17503) (Cons!17502 (h!18633 (_ BitVec 64)) (t!24639 List!17506)) )
))
(declare-fun arrayNoDuplicates!0 (array!51278 (_ BitVec 32) List!17506) Bool)

(assert (=> b!880298 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17503)))

(declare-datatypes ((Unit!30052 0))(
  ( (Unit!30053) )
))
(declare-fun lt!398046 () Unit!30052)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51278 (_ BitVec 32) (_ BitVec 32)) Unit!30052)

(assert (=> b!880298 (= lt!398046 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880299 () Bool)

(declare-fun res!598074 () Bool)

(assert (=> b!880299 (=> (not res!598074) (not e!489878))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!880299 (= res!598074 (and (= (select (arr!24663 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!598064 () Bool)

(assert (=> start!74682 (=> (not res!598064) (not e!489878))))

(assert (=> start!74682 (= res!598064 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25103 _keys!868))))))

(assert (=> start!74682 e!489878))

(assert (=> start!74682 tp_is_empty!17575))

(assert (=> start!74682 true))

(assert (=> start!74682 tp!53681))

(declare-fun array_inv!19424 (array!51278) Bool)

(assert (=> start!74682 (array_inv!19424 _keys!868)))

(declare-fun e!489881 () Bool)

(declare-fun array_inv!19425 (array!51280) Bool)

(assert (=> start!74682 (and (array_inv!19425 _values!688) e!489881)))

(declare-fun mapIsEmpty!27984 () Bool)

(declare-fun mapRes!27984 () Bool)

(assert (=> mapIsEmpty!27984 mapRes!27984))

(declare-fun b!880300 () Bool)

(declare-fun e!489882 () Bool)

(assert (=> b!880300 (= e!489882 e!489879)))

(declare-fun res!598072 () Bool)

(assert (=> b!880300 (=> res!598072 e!489879)))

(assert (=> b!880300 (= res!598072 (not (= (select (arr!24663 _keys!868) from!1053) k!854)))))

(declare-fun lt!398043 () ListLongMap!10461)

(declare-fun +!2518 (ListLongMap!10461 tuple2!11692) ListLongMap!10461)

(declare-fun get!12968 (ValueCell!8348 V!28481) V!28481)

(declare-fun dynLambda!1235 (Int (_ BitVec 64)) V!28481)

(assert (=> b!880300 (= lt!398048 (+!2518 lt!398043 (tuple2!11693 (select (arr!24663 _keys!868) from!1053) (get!12968 (select (arr!24664 _values!688) from!1053) (dynLambda!1235 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880301 () Bool)

(declare-fun e!489875 () Bool)

(assert (=> b!880301 (= e!489875 tp_is_empty!17575)))

(declare-fun b!880302 () Bool)

(declare-fun res!598068 () Bool)

(assert (=> b!880302 (=> (not res!598068) (not e!489878))))

(assert (=> b!880302 (= res!598068 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17503))))

(declare-fun b!880303 () Bool)

(declare-fun res!598069 () Bool)

(assert (=> b!880303 (=> (not res!598069) (not e!489878))))

(assert (=> b!880303 (= res!598069 (and (= (size!25104 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25103 _keys!868) (size!25104 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880304 () Bool)

(declare-fun res!598070 () Bool)

(assert (=> b!880304 (=> (not res!598070) (not e!489878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880304 (= res!598070 (validKeyInArray!0 k!854))))

(declare-fun b!880305 () Bool)

(assert (=> b!880305 (= e!489880 (not e!489882))))

(declare-fun res!598067 () Bool)

(assert (=> b!880305 (=> res!598067 e!489882)))

(assert (=> b!880305 (= res!598067 (not (validKeyInArray!0 (select (arr!24663 _keys!868) from!1053))))))

(declare-fun lt!398042 () ListLongMap!10461)

(assert (=> b!880305 (= lt!398042 lt!398043)))

(declare-fun lt!398044 () ListLongMap!10461)

(assert (=> b!880305 (= lt!398043 (+!2518 lt!398044 (tuple2!11693 k!854 v!557)))))

(assert (=> b!880305 (= lt!398042 (getCurrentListMapNoExtraKeys!3209 _keys!868 lt!398041 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880305 (= lt!398044 (getCurrentListMapNoExtraKeys!3209 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398047 () Unit!30052)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!708 (array!51278 array!51280 (_ BitVec 32) (_ BitVec 32) V!28481 V!28481 (_ BitVec 32) (_ BitVec 64) V!28481 (_ BitVec 32) Int) Unit!30052)

(assert (=> b!880305 (= lt!398047 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!708 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880306 () Bool)

(assert (=> b!880306 (= e!489881 (and e!489877 mapRes!27984))))

(declare-fun condMapEmpty!27984 () Bool)

(declare-fun mapDefault!27984 () ValueCell!8348)

