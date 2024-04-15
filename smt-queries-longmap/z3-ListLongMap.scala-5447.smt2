; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72448 () Bool)

(assert start!72448)

(declare-fun b_free!13651 () Bool)

(declare-fun b_next!13651 () Bool)

(assert (=> start!72448 (= b_free!13651 (not b_next!13651))))

(declare-fun tp!48053 () Bool)

(declare-fun b_and!22711 () Bool)

(assert (=> start!72448 (= tp!48053 b_and!22711)))

(declare-datatypes ((V!25737 0))(
  ( (V!25738 (val!7806 Int)) )
))
(declare-fun v!557 () V!25737)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47289 0))(
  ( (array!47290 (arr!22676 (Array (_ BitVec 32) (_ BitVec 64))) (size!23118 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47289)

(declare-datatypes ((ValueCell!7319 0))(
  ( (ValueCellFull!7319 (v!10225 V!25737)) (EmptyCell!7319) )
))
(declare-datatypes ((array!47291 0))(
  ( (array!47292 (arr!22677 (Array (_ BitVec 32) ValueCell!7319)) (size!23119 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47291)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun bm!37157 () Bool)

(declare-datatypes ((tuple2!10362 0))(
  ( (tuple2!10363 (_1!5192 (_ BitVec 64)) (_2!5192 V!25737)) )
))
(declare-datatypes ((List!16141 0))(
  ( (Nil!16138) (Cons!16137 (h!17268 tuple2!10362) (t!22503 List!16141)) )
))
(declare-datatypes ((ListLongMap!9121 0))(
  ( (ListLongMap!9122 (toList!4576 List!16141)) )
))
(declare-fun call!37161 () ListLongMap!9121)

(declare-fun minValue!654 () V!25737)

(declare-fun zeroValue!654 () V!25737)

(declare-fun getCurrentListMapNoExtraKeys!2595 (array!47289 array!47291 (_ BitVec 32) (_ BitVec 32) V!25737 V!25737 (_ BitVec 32) Int) ListLongMap!9121)

(assert (=> bm!37157 (= call!37161 (getCurrentListMapNoExtraKeys!2595 _keys!868 (array!47292 (store (arr!22677 _values!688) i!612 (ValueCellFull!7319 v!557)) (size!23119 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37160 () ListLongMap!9121)

(declare-fun bm!37158 () Bool)

(assert (=> bm!37158 (= call!37160 (getCurrentListMapNoExtraKeys!2595 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!571297 () Bool)

(declare-fun e!468824 () Bool)

(assert (=> start!72448 (=> (not res!571297) (not e!468824))))

(assert (=> start!72448 (= res!571297 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23118 _keys!868))))))

(assert (=> start!72448 e!468824))

(declare-fun tp_is_empty!15517 () Bool)

(assert (=> start!72448 tp_is_empty!15517))

(assert (=> start!72448 true))

(assert (=> start!72448 tp!48053))

(declare-fun array_inv!18128 (array!47289) Bool)

(assert (=> start!72448 (array_inv!18128 _keys!868)))

(declare-fun e!468825 () Bool)

(declare-fun array_inv!18129 (array!47291) Bool)

(assert (=> start!72448 (and (array_inv!18129 _values!688) e!468825)))

(declare-fun b!840267 () Bool)

(declare-fun e!468827 () Bool)

(assert (=> b!840267 (= e!468827 tp_is_empty!15517)))

(declare-fun b!840268 () Bool)

(declare-fun e!468823 () Bool)

(assert (=> b!840268 (= e!468823 (= call!37161 call!37160))))

(declare-fun b!840269 () Bool)

(declare-fun res!571292 () Bool)

(assert (=> b!840269 (=> (not res!571292) (not e!468824))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840269 (= res!571292 (validKeyInArray!0 k0!854))))

(declare-fun b!840270 () Bool)

(declare-fun res!571299 () Bool)

(assert (=> b!840270 (=> (not res!571299) (not e!468824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840270 (= res!571299 (validMask!0 mask!1196))))

(declare-fun b!840271 () Bool)

(declare-fun res!571294 () Bool)

(assert (=> b!840271 (=> (not res!571294) (not e!468824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47289 (_ BitVec 32)) Bool)

(assert (=> b!840271 (= res!571294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840272 () Bool)

(declare-fun e!468826 () Bool)

(assert (=> b!840272 (= e!468826 tp_is_empty!15517)))

(declare-fun b!840273 () Bool)

(declare-fun +!2064 (ListLongMap!9121 tuple2!10362) ListLongMap!9121)

(assert (=> b!840273 (= e!468823 (= call!37161 (+!2064 call!37160 (tuple2!10363 k0!854 v!557))))))

(declare-fun b!840274 () Bool)

(declare-fun res!571296 () Bool)

(assert (=> b!840274 (=> (not res!571296) (not e!468824))))

(declare-datatypes ((List!16142 0))(
  ( (Nil!16139) (Cons!16138 (h!17269 (_ BitVec 64)) (t!22504 List!16142)) )
))
(declare-fun arrayNoDuplicates!0 (array!47289 (_ BitVec 32) List!16142) Bool)

(assert (=> b!840274 (= res!571296 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16139))))

(declare-fun b!840275 () Bool)

(declare-fun mapRes!24875 () Bool)

(assert (=> b!840275 (= e!468825 (and e!468827 mapRes!24875))))

(declare-fun condMapEmpty!24875 () Bool)

(declare-fun mapDefault!24875 () ValueCell!7319)

(assert (=> b!840275 (= condMapEmpty!24875 (= (arr!22677 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7319)) mapDefault!24875)))))

(declare-fun b!840276 () Bool)

(assert (=> b!840276 (= e!468824 (not true))))

(assert (=> b!840276 e!468823))

(declare-fun c!91271 () Bool)

(assert (=> b!840276 (= c!91271 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28813 0))(
  ( (Unit!28814) )
))
(declare-fun lt!380606 () Unit!28813)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!281 (array!47289 array!47291 (_ BitVec 32) (_ BitVec 32) V!25737 V!25737 (_ BitVec 32) (_ BitVec 64) V!25737 (_ BitVec 32) Int) Unit!28813)

(assert (=> b!840276 (= lt!380606 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24875 () Bool)

(declare-fun tp!48052 () Bool)

(assert (=> mapNonEmpty!24875 (= mapRes!24875 (and tp!48052 e!468826))))

(declare-fun mapValue!24875 () ValueCell!7319)

(declare-fun mapRest!24875 () (Array (_ BitVec 32) ValueCell!7319))

(declare-fun mapKey!24875 () (_ BitVec 32))

(assert (=> mapNonEmpty!24875 (= (arr!22677 _values!688) (store mapRest!24875 mapKey!24875 mapValue!24875))))

(declare-fun mapIsEmpty!24875 () Bool)

(assert (=> mapIsEmpty!24875 mapRes!24875))

(declare-fun b!840277 () Bool)

(declare-fun res!571293 () Bool)

(assert (=> b!840277 (=> (not res!571293) (not e!468824))))

(assert (=> b!840277 (= res!571293 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23118 _keys!868))))))

(declare-fun b!840278 () Bool)

(declare-fun res!571298 () Bool)

(assert (=> b!840278 (=> (not res!571298) (not e!468824))))

(assert (=> b!840278 (= res!571298 (and (= (size!23119 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23118 _keys!868) (size!23119 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840279 () Bool)

(declare-fun res!571295 () Bool)

(assert (=> b!840279 (=> (not res!571295) (not e!468824))))

(assert (=> b!840279 (= res!571295 (and (= (select (arr!22676 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23118 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(assert (= (and start!72448 res!571297) b!840270))

(assert (= (and b!840270 res!571299) b!840278))

(assert (= (and b!840278 res!571298) b!840271))

(assert (= (and b!840271 res!571294) b!840274))

(assert (= (and b!840274 res!571296) b!840277))

(assert (= (and b!840277 res!571293) b!840269))

(assert (= (and b!840269 res!571292) b!840279))

(assert (= (and b!840279 res!571295) b!840276))

(assert (= (and b!840276 c!91271) b!840273))

(assert (= (and b!840276 (not c!91271)) b!840268))

(assert (= (or b!840273 b!840268) bm!37157))

(assert (= (or b!840273 b!840268) bm!37158))

(assert (= (and b!840275 condMapEmpty!24875) mapIsEmpty!24875))

(assert (= (and b!840275 (not condMapEmpty!24875)) mapNonEmpty!24875))

(get-info :version)

(assert (= (and mapNonEmpty!24875 ((_ is ValueCellFull!7319) mapValue!24875)) b!840272))

(assert (= (and b!840275 ((_ is ValueCellFull!7319) mapDefault!24875)) b!840267))

(assert (= start!72448 b!840275))

(declare-fun m!783503 () Bool)

(assert (=> b!840274 m!783503))

(declare-fun m!783505 () Bool)

(assert (=> bm!37158 m!783505))

(declare-fun m!783507 () Bool)

(assert (=> mapNonEmpty!24875 m!783507))

(declare-fun m!783509 () Bool)

(assert (=> start!72448 m!783509))

(declare-fun m!783511 () Bool)

(assert (=> start!72448 m!783511))

(declare-fun m!783513 () Bool)

(assert (=> b!840269 m!783513))

(declare-fun m!783515 () Bool)

(assert (=> b!840271 m!783515))

(declare-fun m!783517 () Bool)

(assert (=> bm!37157 m!783517))

(declare-fun m!783519 () Bool)

(assert (=> bm!37157 m!783519))

(declare-fun m!783521 () Bool)

(assert (=> b!840273 m!783521))

(declare-fun m!783523 () Bool)

(assert (=> b!840276 m!783523))

(declare-fun m!783525 () Bool)

(assert (=> b!840279 m!783525))

(declare-fun m!783527 () Bool)

(assert (=> b!840270 m!783527))

(check-sat (not b!840270) (not bm!37158) (not b!840269) (not b!840271) (not mapNonEmpty!24875) (not b!840273) (not b_next!13651) (not start!72448) (not b!840276) (not b!840274) tp_is_empty!15517 (not bm!37157) b_and!22711)
(check-sat b_and!22711 (not b_next!13651))
