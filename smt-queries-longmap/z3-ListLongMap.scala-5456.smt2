; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72502 () Bool)

(assert start!72502)

(declare-fun b_free!13705 () Bool)

(declare-fun b_next!13705 () Bool)

(assert (=> start!72502 (= b_free!13705 (not b_next!13705))))

(declare-fun tp!48215 () Bool)

(declare-fun b_and!22765 () Bool)

(assert (=> start!72502 (= tp!48215 b_and!22765)))

(declare-fun b!841320 () Bool)

(declare-fun e!469311 () Bool)

(declare-fun e!469309 () Bool)

(declare-fun mapRes!24956 () Bool)

(assert (=> b!841320 (= e!469311 (and e!469309 mapRes!24956))))

(declare-fun condMapEmpty!24956 () Bool)

(declare-datatypes ((V!25809 0))(
  ( (V!25810 (val!7833 Int)) )
))
(declare-datatypes ((ValueCell!7346 0))(
  ( (ValueCellFull!7346 (v!10252 V!25809)) (EmptyCell!7346) )
))
(declare-datatypes ((array!47395 0))(
  ( (array!47396 (arr!22729 (Array (_ BitVec 32) ValueCell!7346)) (size!23171 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47395)

(declare-fun mapDefault!24956 () ValueCell!7346)

(assert (=> b!841320 (= condMapEmpty!24956 (= (arr!22729 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7346)) mapDefault!24956)))))

(declare-fun b!841321 () Bool)

(declare-fun res!571947 () Bool)

(declare-fun e!469313 () Bool)

(assert (=> b!841321 (=> (not res!571947) (not e!469313))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47397 0))(
  ( (array!47398 (arr!22730 (Array (_ BitVec 32) (_ BitVec 64))) (size!23172 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47397)

(assert (=> b!841321 (= res!571947 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23172 _keys!868))))))

(declare-fun b!841322 () Bool)

(declare-fun e!469314 () Bool)

(declare-fun tp_is_empty!15571 () Bool)

(assert (=> b!841322 (= e!469314 tp_is_empty!15571)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10414 0))(
  ( (tuple2!10415 (_1!5218 (_ BitVec 64)) (_2!5218 V!25809)) )
))
(declare-datatypes ((List!16185 0))(
  ( (Nil!16182) (Cons!16181 (h!17312 tuple2!10414) (t!22547 List!16185)) )
))
(declare-datatypes ((ListLongMap!9173 0))(
  ( (ListLongMap!9174 (toList!4602 List!16185)) )
))
(declare-fun call!37322 () ListLongMap!9173)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25809)

(declare-fun zeroValue!654 () V!25809)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!37319 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2618 (array!47397 array!47395 (_ BitVec 32) (_ BitVec 32) V!25809 V!25809 (_ BitVec 32) Int) ListLongMap!9173)

(assert (=> bm!37319 (= call!37322 (getCurrentListMapNoExtraKeys!2618 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841323 () Bool)

(declare-fun res!571944 () Bool)

(assert (=> b!841323 (=> (not res!571944) (not e!469313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47397 (_ BitVec 32)) Bool)

(assert (=> b!841323 (= res!571944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun v!557 () V!25809)

(declare-fun call!37323 () ListLongMap!9173)

(declare-fun bm!37320 () Bool)

(assert (=> bm!37320 (= call!37323 (getCurrentListMapNoExtraKeys!2618 _keys!868 (array!47396 (store (arr!22729 _values!688) i!612 (ValueCellFull!7346 v!557)) (size!23171 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841324 () Bool)

(declare-fun res!571941 () Bool)

(assert (=> b!841324 (=> (not res!571941) (not e!469313))))

(assert (=> b!841324 (= res!571941 (and (= (size!23171 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23172 _keys!868) (size!23171 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841325 () Bool)

(declare-fun res!571945 () Bool)

(assert (=> b!841325 (=> (not res!571945) (not e!469313))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841325 (= res!571945 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!24956 () Bool)

(assert (=> mapIsEmpty!24956 mapRes!24956))

(declare-fun b!841327 () Bool)

(declare-fun e!469312 () Bool)

(declare-fun +!2084 (ListLongMap!9173 tuple2!10414) ListLongMap!9173)

(assert (=> b!841327 (= e!469312 (= call!37323 (+!2084 call!37322 (tuple2!10415 k0!854 v!557))))))

(declare-fun b!841328 () Bool)

(declare-fun res!571943 () Bool)

(assert (=> b!841328 (=> (not res!571943) (not e!469313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841328 (= res!571943 (validMask!0 mask!1196))))

(declare-fun b!841329 () Bool)

(declare-fun res!571946 () Bool)

(assert (=> b!841329 (=> (not res!571946) (not e!469313))))

(assert (=> b!841329 (= res!571946 (and (= (select (arr!22730 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23172 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841330 () Bool)

(declare-fun res!571942 () Bool)

(assert (=> b!841330 (=> (not res!571942) (not e!469313))))

(declare-datatypes ((List!16186 0))(
  ( (Nil!16183) (Cons!16182 (h!17313 (_ BitVec 64)) (t!22548 List!16186)) )
))
(declare-fun arrayNoDuplicates!0 (array!47397 (_ BitVec 32) List!16186) Bool)

(assert (=> b!841330 (= res!571942 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16183))))

(declare-fun mapNonEmpty!24956 () Bool)

(declare-fun tp!48214 () Bool)

(assert (=> mapNonEmpty!24956 (= mapRes!24956 (and tp!48214 e!469314))))

(declare-fun mapRest!24956 () (Array (_ BitVec 32) ValueCell!7346))

(declare-fun mapKey!24956 () (_ BitVec 32))

(declare-fun mapValue!24956 () ValueCell!7346)

(assert (=> mapNonEmpty!24956 (= (arr!22729 _values!688) (store mapRest!24956 mapKey!24956 mapValue!24956))))

(declare-fun b!841331 () Bool)

(assert (=> b!841331 (= e!469312 (= call!37323 call!37322))))

(declare-fun b!841332 () Bool)

(assert (=> b!841332 (= e!469309 tp_is_empty!15571)))

(declare-fun b!841326 () Bool)

(assert (=> b!841326 (= e!469313 (not true))))

(assert (=> b!841326 e!469312))

(declare-fun c!91352 () Bool)

(assert (=> b!841326 (= c!91352 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28849 0))(
  ( (Unit!28850) )
))
(declare-fun lt!380687 () Unit!28849)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!299 (array!47397 array!47395 (_ BitVec 32) (_ BitVec 32) V!25809 V!25809 (_ BitVec 32) (_ BitVec 64) V!25809 (_ BitVec 32) Int) Unit!28849)

(assert (=> b!841326 (= lt!380687 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!299 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!571940 () Bool)

(assert (=> start!72502 (=> (not res!571940) (not e!469313))))

(assert (=> start!72502 (= res!571940 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23172 _keys!868))))))

(assert (=> start!72502 e!469313))

(assert (=> start!72502 tp_is_empty!15571))

(assert (=> start!72502 true))

(assert (=> start!72502 tp!48215))

(declare-fun array_inv!18164 (array!47397) Bool)

(assert (=> start!72502 (array_inv!18164 _keys!868)))

(declare-fun array_inv!18165 (array!47395) Bool)

(assert (=> start!72502 (and (array_inv!18165 _values!688) e!469311)))

(assert (= (and start!72502 res!571940) b!841328))

(assert (= (and b!841328 res!571943) b!841324))

(assert (= (and b!841324 res!571941) b!841323))

(assert (= (and b!841323 res!571944) b!841330))

(assert (= (and b!841330 res!571942) b!841321))

(assert (= (and b!841321 res!571947) b!841325))

(assert (= (and b!841325 res!571945) b!841329))

(assert (= (and b!841329 res!571946) b!841326))

(assert (= (and b!841326 c!91352) b!841327))

(assert (= (and b!841326 (not c!91352)) b!841331))

(assert (= (or b!841327 b!841331) bm!37320))

(assert (= (or b!841327 b!841331) bm!37319))

(assert (= (and b!841320 condMapEmpty!24956) mapIsEmpty!24956))

(assert (= (and b!841320 (not condMapEmpty!24956)) mapNonEmpty!24956))

(get-info :version)

(assert (= (and mapNonEmpty!24956 ((_ is ValueCellFull!7346) mapValue!24956)) b!841322))

(assert (= (and b!841320 ((_ is ValueCellFull!7346) mapDefault!24956)) b!841332))

(assert (= start!72502 b!841320))

(declare-fun m!784205 () Bool)

(assert (=> b!841326 m!784205))

(declare-fun m!784207 () Bool)

(assert (=> mapNonEmpty!24956 m!784207))

(declare-fun m!784209 () Bool)

(assert (=> b!841328 m!784209))

(declare-fun m!784211 () Bool)

(assert (=> start!72502 m!784211))

(declare-fun m!784213 () Bool)

(assert (=> start!72502 m!784213))

(declare-fun m!784215 () Bool)

(assert (=> bm!37319 m!784215))

(declare-fun m!784217 () Bool)

(assert (=> b!841325 m!784217))

(declare-fun m!784219 () Bool)

(assert (=> bm!37320 m!784219))

(declare-fun m!784221 () Bool)

(assert (=> bm!37320 m!784221))

(declare-fun m!784223 () Bool)

(assert (=> b!841329 m!784223))

(declare-fun m!784225 () Bool)

(assert (=> b!841323 m!784225))

(declare-fun m!784227 () Bool)

(assert (=> b!841330 m!784227))

(declare-fun m!784229 () Bool)

(assert (=> b!841327 m!784229))

(check-sat (not b!841326) (not bm!37319) tp_is_empty!15571 (not b!841325) (not b!841323) b_and!22765 (not b_next!13705) (not start!72502) (not bm!37320) (not b!841328) (not b!841330) (not mapNonEmpty!24956) (not b!841327))
(check-sat b_and!22765 (not b_next!13705))
