; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74854 () Bool)

(assert start!74854)

(declare-fun b_free!15403 () Bool)

(declare-fun b_next!15403 () Bool)

(assert (=> start!74854 (= b_free!15403 (not b_next!15403))))

(declare-fun tp!53909 () Bool)

(declare-fun b_and!25489 () Bool)

(assert (=> start!74854 (= tp!53909 b_and!25489)))

(declare-fun b!882466 () Bool)

(declare-fun e!491131 () Bool)

(declare-fun tp_is_empty!17647 () Bool)

(assert (=> b!882466 (= e!491131 tp_is_empty!17647)))

(declare-fun b!882467 () Bool)

(declare-fun e!491134 () Bool)

(declare-fun e!491137 () Bool)

(assert (=> b!882467 (= e!491134 (not e!491137))))

(declare-fun res!599512 () Bool)

(assert (=> b!882467 (=> res!599512 e!491137)))

(declare-datatypes ((array!51422 0))(
  ( (array!51423 (arr!24731 (Array (_ BitVec 32) (_ BitVec 64))) (size!25171 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51422)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882467 (= res!599512 (not (validKeyInArray!0 (select (arr!24731 _keys!868) from!1053))))))

(declare-datatypes ((V!28577 0))(
  ( (V!28578 (val!8871 Int)) )
))
(declare-datatypes ((tuple2!11748 0))(
  ( (tuple2!11749 (_1!5885 (_ BitVec 64)) (_2!5885 V!28577)) )
))
(declare-datatypes ((List!17557 0))(
  ( (Nil!17554) (Cons!17553 (h!18684 tuple2!11748) (t!24762 List!17557)) )
))
(declare-datatypes ((ListLongMap!10517 0))(
  ( (ListLongMap!10518 (toList!5274 List!17557)) )
))
(declare-fun lt!399260 () ListLongMap!10517)

(declare-fun lt!399259 () ListLongMap!10517)

(assert (=> b!882467 (= lt!399260 lt!399259)))

(declare-fun v!557 () V!28577)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!399265 () ListLongMap!10517)

(declare-fun +!2544 (ListLongMap!10517 tuple2!11748) ListLongMap!10517)

(assert (=> b!882467 (= lt!399259 (+!2544 lt!399265 (tuple2!11749 k!854 v!557)))))

(declare-datatypes ((ValueCell!8384 0))(
  ( (ValueCellFull!8384 (v!11335 V!28577)) (EmptyCell!8384) )
))
(declare-datatypes ((array!51424 0))(
  ( (array!51425 (arr!24732 (Array (_ BitVec 32) ValueCell!8384)) (size!25172 (_ BitVec 32))) )
))
(declare-fun lt!399262 () array!51424)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28577)

(declare-fun zeroValue!654 () V!28577)

(declare-fun getCurrentListMapNoExtraKeys!3235 (array!51422 array!51424 (_ BitVec 32) (_ BitVec 32) V!28577 V!28577 (_ BitVec 32) Int) ListLongMap!10517)

(assert (=> b!882467 (= lt!399260 (getCurrentListMapNoExtraKeys!3235 _keys!868 lt!399262 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51424)

(assert (=> b!882467 (= lt!399265 (getCurrentListMapNoExtraKeys!3235 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30104 0))(
  ( (Unit!30105) )
))
(declare-fun lt!399267 () Unit!30104)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!731 (array!51422 array!51424 (_ BitVec 32) (_ BitVec 32) V!28577 V!28577 (_ BitVec 32) (_ BitVec 64) V!28577 (_ BitVec 32) Int) Unit!30104)

(assert (=> b!882467 (= lt!399267 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!731 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!28104 () Bool)

(declare-fun mapRes!28104 () Bool)

(assert (=> mapIsEmpty!28104 mapRes!28104))

(declare-fun b!882468 () Bool)

(declare-fun e!491138 () Bool)

(declare-fun e!491132 () Bool)

(assert (=> b!882468 (= e!491138 e!491132)))

(declare-fun res!599520 () Bool)

(assert (=> b!882468 (=> (not res!599520) (not e!491132))))

(declare-datatypes ((List!17558 0))(
  ( (Nil!17555) (Cons!17554 (h!18685 (_ BitVec 64)) (t!24763 List!17558)) )
))
(declare-fun contains!4269 (List!17558 (_ BitVec 64)) Bool)

(assert (=> b!882468 (= res!599520 (not (contains!4269 Nil!17555 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882469 () Bool)

(declare-fun res!599517 () Bool)

(declare-fun e!491133 () Bool)

(assert (=> b!882469 (=> (not res!599517) (not e!491133))))

(assert (=> b!882469 (= res!599517 (and (= (select (arr!24731 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!882470 () Bool)

(declare-fun e!491135 () Bool)

(assert (=> b!882470 (= e!491135 tp_is_empty!17647)))

(declare-fun b!882471 () Bool)

(declare-fun res!599521 () Bool)

(assert (=> b!882471 (=> (not res!599521) (not e!491133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51422 (_ BitVec 32)) Bool)

(assert (=> b!882471 (= res!599521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882472 () Bool)

(declare-fun res!599513 () Bool)

(assert (=> b!882472 (=> (not res!599513) (not e!491133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882472 (= res!599513 (validMask!0 mask!1196))))

(declare-fun b!882473 () Bool)

(declare-fun e!491129 () Bool)

(assert (=> b!882473 (= e!491137 e!491129)))

(declare-fun res!599515 () Bool)

(assert (=> b!882473 (=> res!599515 e!491129)))

(assert (=> b!882473 (= res!599515 (not (= (select (arr!24731 _keys!868) from!1053) k!854)))))

(declare-fun lt!399266 () ListLongMap!10517)

(declare-fun get!13022 (ValueCell!8384 V!28577) V!28577)

(declare-fun dynLambda!1257 (Int (_ BitVec 64)) V!28577)

(assert (=> b!882473 (= lt!399266 (+!2544 lt!399259 (tuple2!11749 (select (arr!24731 _keys!868) from!1053) (get!13022 (select (arr!24732 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!599519 () Bool)

(assert (=> start!74854 (=> (not res!599519) (not e!491133))))

(assert (=> start!74854 (= res!599519 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25171 _keys!868))))))

(assert (=> start!74854 e!491133))

(assert (=> start!74854 tp_is_empty!17647))

(assert (=> start!74854 true))

(assert (=> start!74854 tp!53909))

(declare-fun array_inv!19474 (array!51422) Bool)

(assert (=> start!74854 (array_inv!19474 _keys!868)))

(declare-fun e!491136 () Bool)

(declare-fun array_inv!19475 (array!51424) Bool)

(assert (=> start!74854 (and (array_inv!19475 _values!688) e!491136)))

(declare-fun b!882474 () Bool)

(declare-fun res!599523 () Bool)

(assert (=> b!882474 (=> (not res!599523) (not e!491133))))

(assert (=> b!882474 (= res!599523 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25171 _keys!868))))))

(declare-fun b!882475 () Bool)

(declare-fun res!599524 () Bool)

(assert (=> b!882475 (=> (not res!599524) (not e!491133))))

(assert (=> b!882475 (= res!599524 (and (= (size!25172 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25171 _keys!868) (size!25172 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882476 () Bool)

(assert (=> b!882476 (= e!491129 e!491138)))

(declare-fun res!599514 () Bool)

(assert (=> b!882476 (=> res!599514 e!491138)))

(assert (=> b!882476 (= res!599514 (or (bvsge (size!25171 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25171 _keys!868)) (bvsge from!1053 (size!25171 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882476 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399263 () Unit!30104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51422 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30104)

(assert (=> b!882476 (= lt!399263 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!51422 (_ BitVec 32) List!17558) Bool)

(assert (=> b!882476 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17555)))

(declare-fun lt!399261 () Unit!30104)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51422 (_ BitVec 32) (_ BitVec 32)) Unit!30104)

(assert (=> b!882476 (= lt!399261 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapNonEmpty!28104 () Bool)

(declare-fun tp!53908 () Bool)

(assert (=> mapNonEmpty!28104 (= mapRes!28104 (and tp!53908 e!491135))))

(declare-fun mapKey!28104 () (_ BitVec 32))

(declare-fun mapRest!28104 () (Array (_ BitVec 32) ValueCell!8384))

(declare-fun mapValue!28104 () ValueCell!8384)

(assert (=> mapNonEmpty!28104 (= (arr!24732 _values!688) (store mapRest!28104 mapKey!28104 mapValue!28104))))

(declare-fun b!882477 () Bool)

(assert (=> b!882477 (= e!491136 (and e!491131 mapRes!28104))))

(declare-fun condMapEmpty!28104 () Bool)

(declare-fun mapDefault!28104 () ValueCell!8384)

