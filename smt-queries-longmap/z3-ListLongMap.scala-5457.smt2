; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72694 () Bool)

(assert start!72694)

(declare-fun b_free!13711 () Bool)

(declare-fun b_next!13711 () Bool)

(assert (=> start!72694 (= b_free!13711 (not b_next!13711))))

(declare-fun tp!48232 () Bool)

(declare-fun b_and!22807 () Bool)

(assert (=> start!72694 (= tp!48232 b_and!22807)))

(declare-fun b!842579 () Bool)

(declare-fun e!470096 () Bool)

(declare-datatypes ((V!25817 0))(
  ( (V!25818 (val!7836 Int)) )
))
(declare-datatypes ((tuple2!10328 0))(
  ( (tuple2!10329 (_1!5175 (_ BitVec 64)) (_2!5175 V!25817)) )
))
(declare-datatypes ((List!16100 0))(
  ( (Nil!16097) (Cons!16096 (h!17233 tuple2!10328) (t!22463 List!16100)) )
))
(declare-datatypes ((ListLongMap!9099 0))(
  ( (ListLongMap!9100 (toList!4565 List!16100)) )
))
(declare-fun call!37411 () ListLongMap!9099)

(declare-fun call!37412 () ListLongMap!9099)

(assert (=> b!842579 (= e!470096 (= call!37411 call!37412))))

(declare-fun b!842580 () Bool)

(declare-fun e!470093 () Bool)

(assert (=> b!842580 (= e!470093 (not true))))

(assert (=> b!842580 e!470096))

(declare-fun c!91708 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!842580 (= c!91708 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25817)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((Unit!28926 0))(
  ( (Unit!28927) )
))
(declare-fun lt!381293 () Unit!28926)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47447 0))(
  ( (array!47448 (arr!22750 (Array (_ BitVec 32) (_ BitVec 64))) (size!23191 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47447)

(declare-fun minValue!654 () V!25817)

(declare-fun zeroValue!654 () V!25817)

(declare-datatypes ((ValueCell!7349 0))(
  ( (ValueCellFull!7349 (v!10261 V!25817)) (EmptyCell!7349) )
))
(declare-datatypes ((array!47449 0))(
  ( (array!47450 (arr!22751 (Array (_ BitVec 32) ValueCell!7349)) (size!23192 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47449)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!299 (array!47447 array!47449 (_ BitVec 32) (_ BitVec 32) V!25817 V!25817 (_ BitVec 32) (_ BitVec 64) V!25817 (_ BitVec 32) Int) Unit!28926)

(assert (=> b!842580 (= lt!381293 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!299 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842581 () Bool)

(declare-fun res!572470 () Bool)

(assert (=> b!842581 (=> (not res!572470) (not e!470093))))

(assert (=> b!842581 (= res!572470 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23191 _keys!868))))))

(declare-fun mapIsEmpty!24965 () Bool)

(declare-fun mapRes!24965 () Bool)

(assert (=> mapIsEmpty!24965 mapRes!24965))

(declare-fun b!842582 () Bool)

(declare-fun e!470098 () Bool)

(declare-fun e!470097 () Bool)

(assert (=> b!842582 (= e!470098 (and e!470097 mapRes!24965))))

(declare-fun condMapEmpty!24965 () Bool)

(declare-fun mapDefault!24965 () ValueCell!7349)

(assert (=> b!842582 (= condMapEmpty!24965 (= (arr!22751 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7349)) mapDefault!24965)))))

(declare-fun res!572471 () Bool)

(assert (=> start!72694 (=> (not res!572471) (not e!470093))))

(assert (=> start!72694 (= res!572471 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23191 _keys!868))))))

(assert (=> start!72694 e!470093))

(declare-fun tp_is_empty!15577 () Bool)

(assert (=> start!72694 tp_is_empty!15577))

(assert (=> start!72694 true))

(assert (=> start!72694 tp!48232))

(declare-fun array_inv!18152 (array!47447) Bool)

(assert (=> start!72694 (array_inv!18152 _keys!868)))

(declare-fun array_inv!18153 (array!47449) Bool)

(assert (=> start!72694 (and (array_inv!18153 _values!688) e!470098)))

(declare-fun b!842583 () Bool)

(declare-fun res!572469 () Bool)

(assert (=> b!842583 (=> (not res!572469) (not e!470093))))

(declare-datatypes ((List!16101 0))(
  ( (Nil!16098) (Cons!16097 (h!17234 (_ BitVec 64)) (t!22464 List!16101)) )
))
(declare-fun arrayNoDuplicates!0 (array!47447 (_ BitVec 32) List!16101) Bool)

(assert (=> b!842583 (= res!572469 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16098))))

(declare-fun b!842584 () Bool)

(declare-fun res!572467 () Bool)

(assert (=> b!842584 (=> (not res!572467) (not e!470093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47447 (_ BitVec 32)) Bool)

(assert (=> b!842584 (= res!572467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842585 () Bool)

(declare-fun +!2070 (ListLongMap!9099 tuple2!10328) ListLongMap!9099)

(assert (=> b!842585 (= e!470096 (= call!37411 (+!2070 call!37412 (tuple2!10329 k0!854 v!557))))))

(declare-fun bm!37408 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2624 (array!47447 array!47449 (_ BitVec 32) (_ BitVec 32) V!25817 V!25817 (_ BitVec 32) Int) ListLongMap!9099)

(assert (=> bm!37408 (= call!37412 (getCurrentListMapNoExtraKeys!2624 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842586 () Bool)

(declare-fun res!572472 () Bool)

(assert (=> b!842586 (=> (not res!572472) (not e!470093))))

(assert (=> b!842586 (= res!572472 (and (= (size!23192 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23191 _keys!868) (size!23192 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842587 () Bool)

(declare-fun res!572466 () Bool)

(assert (=> b!842587 (=> (not res!572466) (not e!470093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842587 (= res!572466 (validMask!0 mask!1196))))

(declare-fun b!842588 () Bool)

(declare-fun res!572468 () Bool)

(assert (=> b!842588 (=> (not res!572468) (not e!470093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842588 (= res!572468 (validKeyInArray!0 k0!854))))

(declare-fun bm!37409 () Bool)

(assert (=> bm!37409 (= call!37411 (getCurrentListMapNoExtraKeys!2624 _keys!868 (array!47450 (store (arr!22751 _values!688) i!612 (ValueCellFull!7349 v!557)) (size!23192 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842589 () Bool)

(assert (=> b!842589 (= e!470097 tp_is_empty!15577)))

(declare-fun mapNonEmpty!24965 () Bool)

(declare-fun tp!48233 () Bool)

(declare-fun e!470094 () Bool)

(assert (=> mapNonEmpty!24965 (= mapRes!24965 (and tp!48233 e!470094))))

(declare-fun mapRest!24965 () (Array (_ BitVec 32) ValueCell!7349))

(declare-fun mapKey!24965 () (_ BitVec 32))

(declare-fun mapValue!24965 () ValueCell!7349)

(assert (=> mapNonEmpty!24965 (= (arr!22751 _values!688) (store mapRest!24965 mapKey!24965 mapValue!24965))))

(declare-fun b!842590 () Bool)

(declare-fun res!572473 () Bool)

(assert (=> b!842590 (=> (not res!572473) (not e!470093))))

(assert (=> b!842590 (= res!572473 (and (= (select (arr!22750 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23191 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!842591 () Bool)

(assert (=> b!842591 (= e!470094 tp_is_empty!15577)))

(assert (= (and start!72694 res!572471) b!842587))

(assert (= (and b!842587 res!572466) b!842586))

(assert (= (and b!842586 res!572472) b!842584))

(assert (= (and b!842584 res!572467) b!842583))

(assert (= (and b!842583 res!572469) b!842581))

(assert (= (and b!842581 res!572470) b!842588))

(assert (= (and b!842588 res!572468) b!842590))

(assert (= (and b!842590 res!572473) b!842580))

(assert (= (and b!842580 c!91708) b!842585))

(assert (= (and b!842580 (not c!91708)) b!842579))

(assert (= (or b!842585 b!842579) bm!37409))

(assert (= (or b!842585 b!842579) bm!37408))

(assert (= (and b!842582 condMapEmpty!24965) mapIsEmpty!24965))

(assert (= (and b!842582 (not condMapEmpty!24965)) mapNonEmpty!24965))

(get-info :version)

(assert (= (and mapNonEmpty!24965 ((_ is ValueCellFull!7349) mapValue!24965)) b!842591))

(assert (= (and b!842582 ((_ is ValueCellFull!7349) mapDefault!24965)) b!842589))

(assert (= start!72694 b!842582))

(declare-fun m!786329 () Bool)

(assert (=> b!842583 m!786329))

(declare-fun m!786331 () Bool)

(assert (=> mapNonEmpty!24965 m!786331))

(declare-fun m!786333 () Bool)

(assert (=> b!842580 m!786333))

(declare-fun m!786335 () Bool)

(assert (=> start!72694 m!786335))

(declare-fun m!786337 () Bool)

(assert (=> start!72694 m!786337))

(declare-fun m!786339 () Bool)

(assert (=> bm!37408 m!786339))

(declare-fun m!786341 () Bool)

(assert (=> b!842584 m!786341))

(declare-fun m!786343 () Bool)

(assert (=> b!842590 m!786343))

(declare-fun m!786345 () Bool)

(assert (=> bm!37409 m!786345))

(declare-fun m!786347 () Bool)

(assert (=> bm!37409 m!786347))

(declare-fun m!786349 () Bool)

(assert (=> b!842588 m!786349))

(declare-fun m!786351 () Bool)

(assert (=> b!842585 m!786351))

(declare-fun m!786353 () Bool)

(assert (=> b!842587 m!786353))

(check-sat b_and!22807 (not b!842583) (not b!842588) (not b!842580) (not bm!37408) (not b!842587) (not bm!37409) (not b_next!13711) (not mapNonEmpty!24965) (not b!842585) (not b!842584) (not start!72694) tp_is_empty!15577)
(check-sat b_and!22807 (not b_next!13711))
