; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72688 () Bool)

(assert start!72688)

(declare-fun b_free!13705 () Bool)

(declare-fun b_next!13705 () Bool)

(assert (=> start!72688 (= b_free!13705 (not b_next!13705))))

(declare-fun tp!48215 () Bool)

(declare-fun b_and!22801 () Bool)

(assert (=> start!72688 (= tp!48215 b_and!22801)))

(declare-fun b!842462 () Bool)

(declare-fun res!572395 () Bool)

(declare-fun e!470042 () Bool)

(assert (=> b!842462 (=> (not res!572395) (not e!470042))))

(declare-datatypes ((array!47435 0))(
  ( (array!47436 (arr!22744 (Array (_ BitVec 32) (_ BitVec 64))) (size!23185 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47435)

(declare-datatypes ((List!16094 0))(
  ( (Nil!16091) (Cons!16090 (h!17227 (_ BitVec 64)) (t!22457 List!16094)) )
))
(declare-fun arrayNoDuplicates!0 (array!47435 (_ BitVec 32) List!16094) Bool)

(assert (=> b!842462 (= res!572395 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16091))))

(declare-fun mapIsEmpty!24956 () Bool)

(declare-fun mapRes!24956 () Bool)

(assert (=> mapIsEmpty!24956 mapRes!24956))

(declare-datatypes ((V!25809 0))(
  ( (V!25810 (val!7833 Int)) )
))
(declare-fun v!557 () V!25809)

(declare-fun b!842463 () Bool)

(declare-fun e!470044 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((tuple2!10322 0))(
  ( (tuple2!10323 (_1!5172 (_ BitVec 64)) (_2!5172 V!25809)) )
))
(declare-datatypes ((List!16095 0))(
  ( (Nil!16092) (Cons!16091 (h!17228 tuple2!10322) (t!22458 List!16095)) )
))
(declare-datatypes ((ListLongMap!9093 0))(
  ( (ListLongMap!9094 (toList!4562 List!16095)) )
))
(declare-fun call!37394 () ListLongMap!9093)

(declare-fun call!37393 () ListLongMap!9093)

(declare-fun +!2068 (ListLongMap!9093 tuple2!10322) ListLongMap!9093)

(assert (=> b!842463 (= e!470044 (= call!37393 (+!2068 call!37394 (tuple2!10323 k0!854 v!557))))))

(declare-fun b!842464 () Bool)

(declare-fun e!470043 () Bool)

(declare-fun e!470040 () Bool)

(assert (=> b!842464 (= e!470043 (and e!470040 mapRes!24956))))

(declare-fun condMapEmpty!24956 () Bool)

(declare-datatypes ((ValueCell!7346 0))(
  ( (ValueCellFull!7346 (v!10258 V!25809)) (EmptyCell!7346) )
))
(declare-datatypes ((array!47437 0))(
  ( (array!47438 (arr!22745 (Array (_ BitVec 32) ValueCell!7346)) (size!23186 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47437)

(declare-fun mapDefault!24956 () ValueCell!7346)

(assert (=> b!842464 (= condMapEmpty!24956 (= (arr!22745 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7346)) mapDefault!24956)))))

(declare-fun b!842465 () Bool)

(declare-fun res!572396 () Bool)

(assert (=> b!842465 (=> (not res!572396) (not e!470042))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47435 (_ BitVec 32)) Bool)

(assert (=> b!842465 (= res!572396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842466 () Bool)

(assert (=> b!842466 (= e!470044 (= call!37393 call!37394))))

(declare-fun b!842467 () Bool)

(declare-fun e!470041 () Bool)

(declare-fun tp_is_empty!15571 () Bool)

(assert (=> b!842467 (= e!470041 tp_is_empty!15571)))

(declare-fun b!842468 () Bool)

(declare-fun res!572401 () Bool)

(assert (=> b!842468 (=> (not res!572401) (not e!470042))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!842468 (= res!572401 (and (= (select (arr!22744 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23185 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!24956 () Bool)

(declare-fun tp!48214 () Bool)

(assert (=> mapNonEmpty!24956 (= mapRes!24956 (and tp!48214 e!470041))))

(declare-fun mapValue!24956 () ValueCell!7346)

(declare-fun mapKey!24956 () (_ BitVec 32))

(declare-fun mapRest!24956 () (Array (_ BitVec 32) ValueCell!7346))

(assert (=> mapNonEmpty!24956 (= (arr!22745 _values!688) (store mapRest!24956 mapKey!24956 mapValue!24956))))

(declare-fun b!842469 () Bool)

(declare-fun res!572400 () Bool)

(assert (=> b!842469 (=> (not res!572400) (not e!470042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842469 (= res!572400 (validKeyInArray!0 k0!854))))

(declare-fun bm!37391 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25809)

(declare-fun zeroValue!654 () V!25809)

(declare-fun getCurrentListMapNoExtraKeys!2621 (array!47435 array!47437 (_ BitVec 32) (_ BitVec 32) V!25809 V!25809 (_ BitVec 32) Int) ListLongMap!9093)

(assert (=> bm!37391 (= call!37393 (getCurrentListMapNoExtraKeys!2621 _keys!868 (array!47438 (store (arr!22745 _values!688) i!612 (ValueCellFull!7346 v!557)) (size!23186 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842470 () Bool)

(assert (=> b!842470 (= e!470042 (not true))))

(assert (=> b!842470 e!470044))

(declare-fun c!91699 () Bool)

(assert (=> b!842470 (= c!91699 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28922 0))(
  ( (Unit!28923) )
))
(declare-fun lt!381284 () Unit!28922)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!297 (array!47435 array!47437 (_ BitVec 32) (_ BitVec 32) V!25809 V!25809 (_ BitVec 32) (_ BitVec 64) V!25809 (_ BitVec 32) Int) Unit!28922)

(assert (=> b!842470 (= lt!381284 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842471 () Bool)

(assert (=> b!842471 (= e!470040 tp_is_empty!15571)))

(declare-fun b!842472 () Bool)

(declare-fun res!572397 () Bool)

(assert (=> b!842472 (=> (not res!572397) (not e!470042))))

(assert (=> b!842472 (= res!572397 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23185 _keys!868))))))

(declare-fun bm!37390 () Bool)

(assert (=> bm!37390 (= call!37394 (getCurrentListMapNoExtraKeys!2621 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!572399 () Bool)

(assert (=> start!72688 (=> (not res!572399) (not e!470042))))

(assert (=> start!72688 (= res!572399 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23185 _keys!868))))))

(assert (=> start!72688 e!470042))

(assert (=> start!72688 tp_is_empty!15571))

(assert (=> start!72688 true))

(assert (=> start!72688 tp!48215))

(declare-fun array_inv!18146 (array!47435) Bool)

(assert (=> start!72688 (array_inv!18146 _keys!868)))

(declare-fun array_inv!18147 (array!47437) Bool)

(assert (=> start!72688 (and (array_inv!18147 _values!688) e!470043)))

(declare-fun b!842473 () Bool)

(declare-fun res!572394 () Bool)

(assert (=> b!842473 (=> (not res!572394) (not e!470042))))

(assert (=> b!842473 (= res!572394 (and (= (size!23186 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23185 _keys!868) (size!23186 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842474 () Bool)

(declare-fun res!572398 () Bool)

(assert (=> b!842474 (=> (not res!572398) (not e!470042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842474 (= res!572398 (validMask!0 mask!1196))))

(assert (= (and start!72688 res!572399) b!842474))

(assert (= (and b!842474 res!572398) b!842473))

(assert (= (and b!842473 res!572394) b!842465))

(assert (= (and b!842465 res!572396) b!842462))

(assert (= (and b!842462 res!572395) b!842472))

(assert (= (and b!842472 res!572397) b!842469))

(assert (= (and b!842469 res!572400) b!842468))

(assert (= (and b!842468 res!572401) b!842470))

(assert (= (and b!842470 c!91699) b!842463))

(assert (= (and b!842470 (not c!91699)) b!842466))

(assert (= (or b!842463 b!842466) bm!37391))

(assert (= (or b!842463 b!842466) bm!37390))

(assert (= (and b!842464 condMapEmpty!24956) mapIsEmpty!24956))

(assert (= (and b!842464 (not condMapEmpty!24956)) mapNonEmpty!24956))

(get-info :version)

(assert (= (and mapNonEmpty!24956 ((_ is ValueCellFull!7346) mapValue!24956)) b!842467))

(assert (= (and b!842464 ((_ is ValueCellFull!7346) mapDefault!24956)) b!842471))

(assert (= start!72688 b!842464))

(declare-fun m!786251 () Bool)

(assert (=> b!842469 m!786251))

(declare-fun m!786253 () Bool)

(assert (=> b!842468 m!786253))

(declare-fun m!786255 () Bool)

(assert (=> b!842474 m!786255))

(declare-fun m!786257 () Bool)

(assert (=> mapNonEmpty!24956 m!786257))

(declare-fun m!786259 () Bool)

(assert (=> b!842470 m!786259))

(declare-fun m!786261 () Bool)

(assert (=> b!842463 m!786261))

(declare-fun m!786263 () Bool)

(assert (=> start!72688 m!786263))

(declare-fun m!786265 () Bool)

(assert (=> start!72688 m!786265))

(declare-fun m!786267 () Bool)

(assert (=> b!842462 m!786267))

(declare-fun m!786269 () Bool)

(assert (=> bm!37390 m!786269))

(declare-fun m!786271 () Bool)

(assert (=> bm!37391 m!786271))

(declare-fun m!786273 () Bool)

(assert (=> bm!37391 m!786273))

(declare-fun m!786275 () Bool)

(assert (=> b!842465 m!786275))

(check-sat (not start!72688) (not b_next!13705) (not b!842470) (not b!842463) (not b!842474) b_and!22801 (not mapNonEmpty!24956) (not b!842465) (not b!842469) tp_is_empty!15571 (not bm!37390) (not bm!37391) (not b!842462))
(check-sat b_and!22801 (not b_next!13705))
