; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73686 () Bool)

(assert start!73686)

(declare-fun b_free!14601 () Bool)

(declare-fun b_next!14601 () Bool)

(assert (=> start!73686 (= b_free!14601 (not b_next!14601))))

(declare-fun tp!51306 () Bool)

(declare-fun b_and!24181 () Bool)

(assert (=> start!73686 (= tp!51306 b_and!24181)))

(declare-fun b!863275 () Bool)

(declare-fun e!480946 () Bool)

(declare-fun e!480939 () Bool)

(declare-fun mapRes!26705 () Bool)

(assert (=> b!863275 (= e!480946 (and e!480939 mapRes!26705))))

(declare-fun condMapEmpty!26705 () Bool)

(declare-datatypes ((V!27363 0))(
  ( (V!27364 (val!8416 Int)) )
))
(declare-datatypes ((ValueCell!7929 0))(
  ( (ValueCellFull!7929 (v!10841 V!27363)) (EmptyCell!7929) )
))
(declare-datatypes ((array!49636 0))(
  ( (array!49637 (arr!23849 (Array (_ BitVec 32) ValueCell!7929)) (size!24289 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49636)

(declare-fun mapDefault!26705 () ValueCell!7929)

(assert (=> b!863275 (= condMapEmpty!26705 (= (arr!23849 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7929)) mapDefault!26705)))))

(declare-fun b!863276 () Bool)

(declare-fun e!480945 () Bool)

(declare-fun e!480941 () Bool)

(assert (=> b!863276 (= e!480945 e!480941)))

(declare-fun res!586624 () Bool)

(assert (=> b!863276 (=> (not res!586624) (not e!480941))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863276 (= res!586624 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!390077 () array!49636)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49638 0))(
  ( (array!49639 (arr!23850 (Array (_ BitVec 32) (_ BitVec 64))) (size!24290 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49638)

(declare-fun minValue!654 () V!27363)

(declare-fun zeroValue!654 () V!27363)

(declare-datatypes ((tuple2!11136 0))(
  ( (tuple2!11137 (_1!5579 (_ BitVec 64)) (_2!5579 V!27363)) )
))
(declare-datatypes ((List!16944 0))(
  ( (Nil!16941) (Cons!16940 (h!18071 tuple2!11136) (t!23811 List!16944)) )
))
(declare-datatypes ((ListLongMap!9905 0))(
  ( (ListLongMap!9906 (toList!4968 List!16944)) )
))
(declare-fun lt!390086 () ListLongMap!9905)

(declare-fun getCurrentListMapNoExtraKeys!2943 (array!49638 array!49636 (_ BitVec 32) (_ BitVec 32) V!27363 V!27363 (_ BitVec 32) Int) ListLongMap!9905)

(assert (=> b!863276 (= lt!390086 (getCurrentListMapNoExtraKeys!2943 _keys!868 lt!390077 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27363)

(assert (=> b!863276 (= lt!390077 (array!49637 (store (arr!23849 _values!688) i!612 (ValueCellFull!7929 v!557)) (size!24289 _values!688)))))

(declare-fun lt!390079 () ListLongMap!9905)

(assert (=> b!863276 (= lt!390079 (getCurrentListMapNoExtraKeys!2943 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863277 () Bool)

(declare-datatypes ((Unit!29502 0))(
  ( (Unit!29503) )
))
(declare-fun e!480938 () Unit!29502)

(declare-fun Unit!29504 () Unit!29502)

(assert (=> b!863277 (= e!480938 Unit!29504)))

(declare-fun lt!390080 () Unit!29502)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49638 (_ BitVec 32) (_ BitVec 32)) Unit!29502)

(assert (=> b!863277 (= lt!390080 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16945 0))(
  ( (Nil!16942) (Cons!16941 (h!18072 (_ BitVec 64)) (t!23812 List!16945)) )
))
(declare-fun arrayNoDuplicates!0 (array!49638 (_ BitVec 32) List!16945) Bool)

(assert (=> b!863277 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16942)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!390075 () Unit!29502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49638 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29502)

(assert (=> b!863277 (= lt!390075 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863277 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390084 () Unit!29502)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49638 (_ BitVec 64) (_ BitVec 32) List!16945) Unit!29502)

(assert (=> b!863277 (= lt!390084 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16942))))

(assert (=> b!863277 false))

(declare-fun b!863278 () Bool)

(declare-fun e!480944 () Bool)

(assert (=> b!863278 (= e!480941 (not e!480944))))

(declare-fun res!586619 () Bool)

(assert (=> b!863278 (=> res!586619 e!480944)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863278 (= res!586619 (not (validKeyInArray!0 (select (arr!23850 _keys!868) from!1053))))))

(declare-fun lt!390083 () ListLongMap!9905)

(declare-fun lt!390085 () ListLongMap!9905)

(assert (=> b!863278 (= lt!390083 lt!390085)))

(declare-fun lt!390073 () ListLongMap!9905)

(declare-fun lt!390081 () tuple2!11136)

(declare-fun +!2317 (ListLongMap!9905 tuple2!11136) ListLongMap!9905)

(assert (=> b!863278 (= lt!390085 (+!2317 lt!390073 lt!390081))))

(assert (=> b!863278 (= lt!390083 (getCurrentListMapNoExtraKeys!2943 _keys!868 lt!390077 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863278 (= lt!390081 (tuple2!11137 k0!854 v!557))))

(assert (=> b!863278 (= lt!390073 (getCurrentListMapNoExtraKeys!2943 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390078 () Unit!29502)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!525 (array!49638 array!49636 (_ BitVec 32) (_ BitVec 32) V!27363 V!27363 (_ BitVec 32) (_ BitVec 64) V!27363 (_ BitVec 32) Int) Unit!29502)

(assert (=> b!863278 (= lt!390078 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!525 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863279 () Bool)

(declare-fun res!586623 () Bool)

(assert (=> b!863279 (=> (not res!586623) (not e!480945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863279 (= res!586623 (validMask!0 mask!1196))))

(declare-fun res!586617 () Bool)

(assert (=> start!73686 (=> (not res!586617) (not e!480945))))

(assert (=> start!73686 (= res!586617 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24290 _keys!868))))))

(assert (=> start!73686 e!480945))

(declare-fun tp_is_empty!16737 () Bool)

(assert (=> start!73686 tp_is_empty!16737))

(assert (=> start!73686 true))

(assert (=> start!73686 tp!51306))

(declare-fun array_inv!18866 (array!49638) Bool)

(assert (=> start!73686 (array_inv!18866 _keys!868)))

(declare-fun array_inv!18867 (array!49636) Bool)

(assert (=> start!73686 (and (array_inv!18867 _values!688) e!480946)))

(declare-fun b!863280 () Bool)

(declare-fun res!586625 () Bool)

(assert (=> b!863280 (=> (not res!586625) (not e!480945))))

(assert (=> b!863280 (= res!586625 (validKeyInArray!0 k0!854))))

(declare-fun b!863281 () Bool)

(declare-fun res!586622 () Bool)

(assert (=> b!863281 (=> (not res!586622) (not e!480945))))

(assert (=> b!863281 (= res!586622 (and (= (size!24289 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24290 _keys!868) (size!24289 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863282 () Bool)

(declare-fun res!586620 () Bool)

(assert (=> b!863282 (=> (not res!586620) (not e!480945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49638 (_ BitVec 32)) Bool)

(assert (=> b!863282 (= res!586620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863283 () Bool)

(declare-fun e!480942 () Bool)

(assert (=> b!863283 (= e!480944 e!480942)))

(declare-fun res!586615 () Bool)

(assert (=> b!863283 (=> res!586615 e!480942)))

(assert (=> b!863283 (= res!586615 (= k0!854 (select (arr!23850 _keys!868) from!1053)))))

(assert (=> b!863283 (not (= (select (arr!23850 _keys!868) from!1053) k0!854))))

(declare-fun lt!390074 () Unit!29502)

(assert (=> b!863283 (= lt!390074 e!480938)))

(declare-fun c!92122 () Bool)

(assert (=> b!863283 (= c!92122 (= (select (arr!23850 _keys!868) from!1053) k0!854))))

(declare-fun lt!390087 () ListLongMap!9905)

(assert (=> b!863283 (= lt!390086 lt!390087)))

(declare-fun lt!390082 () tuple2!11136)

(assert (=> b!863283 (= lt!390087 (+!2317 lt!390085 lt!390082))))

(declare-fun lt!390088 () V!27363)

(assert (=> b!863283 (= lt!390082 (tuple2!11137 (select (arr!23850 _keys!868) from!1053) lt!390088))))

(declare-fun get!12592 (ValueCell!7929 V!27363) V!27363)

(declare-fun dynLambda!1148 (Int (_ BitVec 64)) V!27363)

(assert (=> b!863283 (= lt!390088 (get!12592 (select (arr!23849 _values!688) from!1053) (dynLambda!1148 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863284 () Bool)

(assert (=> b!863284 (= e!480939 tp_is_empty!16737)))

(declare-fun mapIsEmpty!26705 () Bool)

(assert (=> mapIsEmpty!26705 mapRes!26705))

(declare-fun b!863285 () Bool)

(declare-fun res!586618 () Bool)

(assert (=> b!863285 (=> (not res!586618) (not e!480945))))

(assert (=> b!863285 (= res!586618 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16942))))

(declare-fun b!863286 () Bool)

(declare-fun Unit!29505 () Unit!29502)

(assert (=> b!863286 (= e!480938 Unit!29505)))

(declare-fun b!863287 () Bool)

(declare-fun res!586616 () Bool)

(assert (=> b!863287 (=> (not res!586616) (not e!480945))))

(assert (=> b!863287 (= res!586616 (and (= (select (arr!23850 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863288 () Bool)

(declare-fun res!586621 () Bool)

(assert (=> b!863288 (=> (not res!586621) (not e!480945))))

(assert (=> b!863288 (= res!586621 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24290 _keys!868))))))

(declare-fun b!863289 () Bool)

(declare-fun e!480940 () Bool)

(assert (=> b!863289 (= e!480940 tp_is_empty!16737)))

(declare-fun b!863290 () Bool)

(assert (=> b!863290 (= e!480942 true)))

(assert (=> b!863290 (= lt!390087 (+!2317 (+!2317 lt!390073 lt!390082) lt!390081))))

(declare-fun lt!390076 () Unit!29502)

(declare-fun addCommutativeForDiffKeys!491 (ListLongMap!9905 (_ BitVec 64) V!27363 (_ BitVec 64) V!27363) Unit!29502)

(assert (=> b!863290 (= lt!390076 (addCommutativeForDiffKeys!491 lt!390073 k0!854 v!557 (select (arr!23850 _keys!868) from!1053) lt!390088))))

(declare-fun mapNonEmpty!26705 () Bool)

(declare-fun tp!51307 () Bool)

(assert (=> mapNonEmpty!26705 (= mapRes!26705 (and tp!51307 e!480940))))

(declare-fun mapKey!26705 () (_ BitVec 32))

(declare-fun mapValue!26705 () ValueCell!7929)

(declare-fun mapRest!26705 () (Array (_ BitVec 32) ValueCell!7929))

(assert (=> mapNonEmpty!26705 (= (arr!23849 _values!688) (store mapRest!26705 mapKey!26705 mapValue!26705))))

(assert (= (and start!73686 res!586617) b!863279))

(assert (= (and b!863279 res!586623) b!863281))

(assert (= (and b!863281 res!586622) b!863282))

(assert (= (and b!863282 res!586620) b!863285))

(assert (= (and b!863285 res!586618) b!863288))

(assert (= (and b!863288 res!586621) b!863280))

(assert (= (and b!863280 res!586625) b!863287))

(assert (= (and b!863287 res!586616) b!863276))

(assert (= (and b!863276 res!586624) b!863278))

(assert (= (and b!863278 (not res!586619)) b!863283))

(assert (= (and b!863283 c!92122) b!863277))

(assert (= (and b!863283 (not c!92122)) b!863286))

(assert (= (and b!863283 (not res!586615)) b!863290))

(assert (= (and b!863275 condMapEmpty!26705) mapIsEmpty!26705))

(assert (= (and b!863275 (not condMapEmpty!26705)) mapNonEmpty!26705))

(get-info :version)

(assert (= (and mapNonEmpty!26705 ((_ is ValueCellFull!7929) mapValue!26705)) b!863289))

(assert (= (and b!863275 ((_ is ValueCellFull!7929) mapDefault!26705)) b!863284))

(assert (= start!73686 b!863275))

(declare-fun b_lambda!11953 () Bool)

(assert (=> (not b_lambda!11953) (not b!863283)))

(declare-fun t!23810 () Bool)

(declare-fun tb!4723 () Bool)

(assert (=> (and start!73686 (= defaultEntry!696 defaultEntry!696) t!23810) tb!4723))

(declare-fun result!9057 () Bool)

(assert (=> tb!4723 (= result!9057 tp_is_empty!16737)))

(assert (=> b!863283 t!23810))

(declare-fun b_and!24183 () Bool)

(assert (= b_and!24181 (and (=> t!23810 result!9057) b_and!24183)))

(declare-fun m!804429 () Bool)

(assert (=> b!863285 m!804429))

(declare-fun m!804431 () Bool)

(assert (=> b!863278 m!804431))

(declare-fun m!804433 () Bool)

(assert (=> b!863278 m!804433))

(declare-fun m!804435 () Bool)

(assert (=> b!863278 m!804435))

(declare-fun m!804437 () Bool)

(assert (=> b!863278 m!804437))

(assert (=> b!863278 m!804435))

(declare-fun m!804439 () Bool)

(assert (=> b!863278 m!804439))

(declare-fun m!804441 () Bool)

(assert (=> b!863278 m!804441))

(declare-fun m!804443 () Bool)

(assert (=> b!863276 m!804443))

(declare-fun m!804445 () Bool)

(assert (=> b!863276 m!804445))

(declare-fun m!804447 () Bool)

(assert (=> b!863276 m!804447))

(declare-fun m!804449 () Bool)

(assert (=> mapNonEmpty!26705 m!804449))

(declare-fun m!804451 () Bool)

(assert (=> b!863282 m!804451))

(declare-fun m!804453 () Bool)

(assert (=> b!863277 m!804453))

(declare-fun m!804455 () Bool)

(assert (=> b!863277 m!804455))

(declare-fun m!804457 () Bool)

(assert (=> b!863277 m!804457))

(declare-fun m!804459 () Bool)

(assert (=> b!863277 m!804459))

(declare-fun m!804461 () Bool)

(assert (=> b!863277 m!804461))

(declare-fun m!804463 () Bool)

(assert (=> b!863287 m!804463))

(declare-fun m!804465 () Bool)

(assert (=> b!863283 m!804465))

(declare-fun m!804467 () Bool)

(assert (=> b!863283 m!804467))

(declare-fun m!804469 () Bool)

(assert (=> b!863283 m!804469))

(assert (=> b!863283 m!804465))

(declare-fun m!804471 () Bool)

(assert (=> b!863283 m!804471))

(assert (=> b!863283 m!804435))

(assert (=> b!863283 m!804467))

(declare-fun m!804473 () Bool)

(assert (=> b!863279 m!804473))

(declare-fun m!804475 () Bool)

(assert (=> start!73686 m!804475))

(declare-fun m!804477 () Bool)

(assert (=> start!73686 m!804477))

(declare-fun m!804479 () Bool)

(assert (=> b!863290 m!804479))

(assert (=> b!863290 m!804479))

(declare-fun m!804481 () Bool)

(assert (=> b!863290 m!804481))

(assert (=> b!863290 m!804435))

(assert (=> b!863290 m!804435))

(declare-fun m!804483 () Bool)

(assert (=> b!863290 m!804483))

(declare-fun m!804485 () Bool)

(assert (=> b!863280 m!804485))

(check-sat (not b!863276) tp_is_empty!16737 (not b!863285) (not b!863278) (not b_next!14601) (not b!863279) (not mapNonEmpty!26705) (not start!73686) b_and!24183 (not b_lambda!11953) (not b!863283) (not b!863290) (not b!863280) (not b!863277) (not b!863282))
(check-sat b_and!24183 (not b_next!14601))
