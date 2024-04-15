; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73798 () Bool)

(assert start!73798)

(declare-fun b_free!14731 () Bool)

(declare-fun b_next!14731 () Bool)

(assert (=> start!73798 (= b_free!14731 (not b_next!14731))))

(declare-fun tp!51697 () Bool)

(declare-fun b_and!24415 () Bool)

(assert (=> start!73798 (= tp!51697 b_and!24415)))

(declare-fun b!866286 () Bool)

(declare-fun e!482545 () Bool)

(assert (=> b!866286 (= e!482545 true)))

(declare-datatypes ((V!27537 0))(
  ( (V!27538 (val!8481 Int)) )
))
(declare-datatypes ((tuple2!11268 0))(
  ( (tuple2!11269 (_1!5645 (_ BitVec 64)) (_2!5645 V!27537)) )
))
(declare-fun lt!392960 () tuple2!11268)

(declare-datatypes ((List!17056 0))(
  ( (Nil!17053) (Cons!17052 (h!18183 tuple2!11268) (t!24044 List!17056)) )
))
(declare-datatypes ((ListLongMap!10027 0))(
  ( (ListLongMap!10028 (toList!5029 List!17056)) )
))
(declare-fun lt!392963 () ListLongMap!10027)

(declare-fun lt!392972 () tuple2!11268)

(declare-fun lt!392966 () ListLongMap!10027)

(declare-fun +!2395 (ListLongMap!10027 tuple2!11268) ListLongMap!10027)

(assert (=> b!866286 (= lt!392963 (+!2395 (+!2395 lt!392966 lt!392972) lt!392960))))

(declare-datatypes ((Unit!29641 0))(
  ( (Unit!29642) )
))
(declare-fun lt!392961 () Unit!29641)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49885 0))(
  ( (array!49886 (arr!23974 (Array (_ BitVec 32) (_ BitVec 64))) (size!24416 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49885)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!392967 () V!27537)

(declare-fun v!557 () V!27537)

(declare-fun addCommutativeForDiffKeys!533 (ListLongMap!10027 (_ BitVec 64) V!27537 (_ BitVec 64) V!27537) Unit!29641)

(assert (=> b!866286 (= lt!392961 (addCommutativeForDiffKeys!533 lt!392966 k0!854 v!557 (select (arr!23974 _keys!868) from!1053) lt!392967))))

(declare-fun b!866287 () Bool)

(declare-fun res!588655 () Bool)

(declare-fun e!482553 () Bool)

(assert (=> b!866287 (=> (not res!588655) (not e!482553))))

(declare-datatypes ((List!17057 0))(
  ( (Nil!17054) (Cons!17053 (h!18184 (_ BitVec 64)) (t!24045 List!17057)) )
))
(declare-fun arrayNoDuplicates!0 (array!49885 (_ BitVec 32) List!17057) Bool)

(assert (=> b!866287 (= res!588655 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17054))))

(declare-fun b!866288 () Bool)

(declare-fun e!482548 () Bool)

(declare-fun tp_is_empty!16867 () Bool)

(assert (=> b!866288 (= e!482548 tp_is_empty!16867)))

(declare-fun mapNonEmpty!26900 () Bool)

(declare-fun mapRes!26900 () Bool)

(declare-fun tp!51698 () Bool)

(declare-fun e!482552 () Bool)

(assert (=> mapNonEmpty!26900 (= mapRes!26900 (and tp!51698 e!482552))))

(declare-datatypes ((ValueCell!7994 0))(
  ( (ValueCellFull!7994 (v!10900 V!27537)) (EmptyCell!7994) )
))
(declare-fun mapRest!26900 () (Array (_ BitVec 32) ValueCell!7994))

(declare-datatypes ((array!49887 0))(
  ( (array!49888 (arr!23975 (Array (_ BitVec 32) ValueCell!7994)) (size!24417 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49887)

(declare-fun mapKey!26900 () (_ BitVec 32))

(declare-fun mapValue!26900 () ValueCell!7994)

(assert (=> mapNonEmpty!26900 (= (arr!23975 _values!688) (store mapRest!26900 mapKey!26900 mapValue!26900))))

(declare-fun b!866289 () Bool)

(declare-fun e!482550 () Bool)

(assert (=> b!866289 (= e!482553 e!482550)))

(declare-fun res!588654 () Bool)

(assert (=> b!866289 (=> (not res!588654) (not e!482550))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!866289 (= res!588654 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!392964 () array!49887)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27537)

(declare-fun zeroValue!654 () V!27537)

(declare-fun lt!392958 () ListLongMap!10027)

(declare-fun getCurrentListMapNoExtraKeys!3024 (array!49885 array!49887 (_ BitVec 32) (_ BitVec 32) V!27537 V!27537 (_ BitVec 32) Int) ListLongMap!10027)

(assert (=> b!866289 (= lt!392958 (getCurrentListMapNoExtraKeys!3024 _keys!868 lt!392964 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866289 (= lt!392964 (array!49888 (store (arr!23975 _values!688) i!612 (ValueCellFull!7994 v!557)) (size!24417 _values!688)))))

(declare-fun lt!392965 () ListLongMap!10027)

(assert (=> b!866289 (= lt!392965 (getCurrentListMapNoExtraKeys!3024 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866290 () Bool)

(declare-fun e!482547 () Bool)

(assert (=> b!866290 (= e!482547 (and e!482548 mapRes!26900))))

(declare-fun condMapEmpty!26900 () Bool)

(declare-fun mapDefault!26900 () ValueCell!7994)

(assert (=> b!866290 (= condMapEmpty!26900 (= (arr!23975 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7994)) mapDefault!26900)))))

(declare-fun b!866291 () Bool)

(declare-fun res!588652 () Bool)

(assert (=> b!866291 (=> (not res!588652) (not e!482553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866291 (= res!588652 (validKeyInArray!0 k0!854))))

(declare-fun b!866292 () Bool)

(declare-fun res!588658 () Bool)

(assert (=> b!866292 (=> (not res!588658) (not e!482553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49885 (_ BitVec 32)) Bool)

(assert (=> b!866292 (= res!588658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26900 () Bool)

(assert (=> mapIsEmpty!26900 mapRes!26900))

(declare-fun b!866293 () Bool)

(declare-fun e!482551 () Bool)

(assert (=> b!866293 (= e!482550 (not e!482551))))

(declare-fun res!588657 () Bool)

(assert (=> b!866293 (=> res!588657 e!482551)))

(assert (=> b!866293 (= res!588657 (not (validKeyInArray!0 (select (arr!23974 _keys!868) from!1053))))))

(declare-fun lt!392968 () ListLongMap!10027)

(declare-fun lt!392962 () ListLongMap!10027)

(assert (=> b!866293 (= lt!392968 lt!392962)))

(assert (=> b!866293 (= lt!392962 (+!2395 lt!392966 lt!392960))))

(assert (=> b!866293 (= lt!392968 (getCurrentListMapNoExtraKeys!3024 _keys!868 lt!392964 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866293 (= lt!392960 (tuple2!11269 k0!854 v!557))))

(assert (=> b!866293 (= lt!392966 (getCurrentListMapNoExtraKeys!3024 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392959 () Unit!29641)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!566 (array!49885 array!49887 (_ BitVec 32) (_ BitVec 32) V!27537 V!27537 (_ BitVec 32) (_ BitVec 64) V!27537 (_ BitVec 32) Int) Unit!29641)

(assert (=> b!866293 (= lt!392959 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!566 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866294 () Bool)

(declare-fun res!588659 () Bool)

(assert (=> b!866294 (=> (not res!588659) (not e!482553))))

(assert (=> b!866294 (= res!588659 (and (= (select (arr!23974 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866295 () Bool)

(declare-fun e!482546 () Unit!29641)

(declare-fun Unit!29643 () Unit!29641)

(assert (=> b!866295 (= e!482546 Unit!29643)))

(declare-fun lt!392969 () Unit!29641)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49885 (_ BitVec 32) (_ BitVec 32)) Unit!29641)

(assert (=> b!866295 (= lt!392969 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866295 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17054)))

(declare-fun lt!392957 () Unit!29641)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49885 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29641)

(assert (=> b!866295 (= lt!392957 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866295 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392970 () Unit!29641)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49885 (_ BitVec 64) (_ BitVec 32) List!17057) Unit!29641)

(assert (=> b!866295 (= lt!392970 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17054))))

(assert (=> b!866295 false))

(declare-fun b!866296 () Bool)

(declare-fun Unit!29644 () Unit!29641)

(assert (=> b!866296 (= e!482546 Unit!29644)))

(declare-fun res!588660 () Bool)

(assert (=> start!73798 (=> (not res!588660) (not e!482553))))

(assert (=> start!73798 (= res!588660 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24416 _keys!868))))))

(assert (=> start!73798 e!482553))

(assert (=> start!73798 tp_is_empty!16867))

(assert (=> start!73798 true))

(assert (=> start!73798 tp!51697))

(declare-fun array_inv!19024 (array!49885) Bool)

(assert (=> start!73798 (array_inv!19024 _keys!868)))

(declare-fun array_inv!19025 (array!49887) Bool)

(assert (=> start!73798 (and (array_inv!19025 _values!688) e!482547)))

(declare-fun b!866297 () Bool)

(declare-fun res!588651 () Bool)

(assert (=> b!866297 (=> (not res!588651) (not e!482553))))

(assert (=> b!866297 (= res!588651 (and (= (size!24417 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24416 _keys!868) (size!24417 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866298 () Bool)

(declare-fun res!588653 () Bool)

(assert (=> b!866298 (=> (not res!588653) (not e!482553))))

(assert (=> b!866298 (= res!588653 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24416 _keys!868))))))

(declare-fun b!866299 () Bool)

(assert (=> b!866299 (= e!482552 tp_is_empty!16867)))

(declare-fun b!866300 () Bool)

(declare-fun res!588650 () Bool)

(assert (=> b!866300 (=> (not res!588650) (not e!482553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866300 (= res!588650 (validMask!0 mask!1196))))

(declare-fun b!866301 () Bool)

(assert (=> b!866301 (= e!482551 e!482545)))

(declare-fun res!588656 () Bool)

(assert (=> b!866301 (=> res!588656 e!482545)))

(assert (=> b!866301 (= res!588656 (= k0!854 (select (arr!23974 _keys!868) from!1053)))))

(assert (=> b!866301 (not (= (select (arr!23974 _keys!868) from!1053) k0!854))))

(declare-fun lt!392971 () Unit!29641)

(assert (=> b!866301 (= lt!392971 e!482546)))

(declare-fun c!92252 () Bool)

(assert (=> b!866301 (= c!92252 (= (select (arr!23974 _keys!868) from!1053) k0!854))))

(assert (=> b!866301 (= lt!392958 lt!392963)))

(assert (=> b!866301 (= lt!392963 (+!2395 lt!392962 lt!392972))))

(assert (=> b!866301 (= lt!392972 (tuple2!11269 (select (arr!23974 _keys!868) from!1053) lt!392967))))

(declare-fun get!12680 (ValueCell!7994 V!27537) V!27537)

(declare-fun dynLambda!1189 (Int (_ BitVec 64)) V!27537)

(assert (=> b!866301 (= lt!392967 (get!12680 (select (arr!23975 _values!688) from!1053) (dynLambda!1189 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!73798 res!588660) b!866300))

(assert (= (and b!866300 res!588650) b!866297))

(assert (= (and b!866297 res!588651) b!866292))

(assert (= (and b!866292 res!588658) b!866287))

(assert (= (and b!866287 res!588655) b!866298))

(assert (= (and b!866298 res!588653) b!866291))

(assert (= (and b!866291 res!588652) b!866294))

(assert (= (and b!866294 res!588659) b!866289))

(assert (= (and b!866289 res!588654) b!866293))

(assert (= (and b!866293 (not res!588657)) b!866301))

(assert (= (and b!866301 c!92252) b!866295))

(assert (= (and b!866301 (not c!92252)) b!866296))

(assert (= (and b!866301 (not res!588656)) b!866286))

(assert (= (and b!866290 condMapEmpty!26900) mapIsEmpty!26900))

(assert (= (and b!866290 (not condMapEmpty!26900)) mapNonEmpty!26900))

(get-info :version)

(assert (= (and mapNonEmpty!26900 ((_ is ValueCellFull!7994) mapValue!26900)) b!866299))

(assert (= (and b!866290 ((_ is ValueCellFull!7994) mapDefault!26900)) b!866288))

(assert (= start!73798 b!866290))

(declare-fun b_lambda!12065 () Bool)

(assert (=> (not b_lambda!12065) (not b!866301)))

(declare-fun t!24043 () Bool)

(declare-fun tb!4845 () Bool)

(assert (=> (and start!73798 (= defaultEntry!696 defaultEntry!696) t!24043) tb!4845))

(declare-fun result!9309 () Bool)

(assert (=> tb!4845 (= result!9309 tp_is_empty!16867)))

(assert (=> b!866301 t!24043))

(declare-fun b_and!24417 () Bool)

(assert (= b_and!24415 (and (=> t!24043 result!9309) b_and!24417)))

(declare-fun m!807441 () Bool)

(assert (=> b!866294 m!807441))

(declare-fun m!807443 () Bool)

(assert (=> start!73798 m!807443))

(declare-fun m!807445 () Bool)

(assert (=> start!73798 m!807445))

(declare-fun m!807447 () Bool)

(assert (=> b!866301 m!807447))

(declare-fun m!807449 () Bool)

(assert (=> b!866301 m!807449))

(declare-fun m!807451 () Bool)

(assert (=> b!866301 m!807451))

(declare-fun m!807453 () Bool)

(assert (=> b!866301 m!807453))

(assert (=> b!866301 m!807449))

(declare-fun m!807455 () Bool)

(assert (=> b!866301 m!807455))

(assert (=> b!866301 m!807451))

(declare-fun m!807457 () Bool)

(assert (=> mapNonEmpty!26900 m!807457))

(declare-fun m!807459 () Bool)

(assert (=> b!866295 m!807459))

(declare-fun m!807461 () Bool)

(assert (=> b!866295 m!807461))

(declare-fun m!807463 () Bool)

(assert (=> b!866295 m!807463))

(declare-fun m!807465 () Bool)

(assert (=> b!866295 m!807465))

(declare-fun m!807467 () Bool)

(assert (=> b!866295 m!807467))

(declare-fun m!807469 () Bool)

(assert (=> b!866286 m!807469))

(assert (=> b!866286 m!807469))

(declare-fun m!807471 () Bool)

(assert (=> b!866286 m!807471))

(assert (=> b!866286 m!807455))

(assert (=> b!866286 m!807455))

(declare-fun m!807473 () Bool)

(assert (=> b!866286 m!807473))

(declare-fun m!807475 () Bool)

(assert (=> b!866287 m!807475))

(declare-fun m!807477 () Bool)

(assert (=> b!866292 m!807477))

(declare-fun m!807479 () Bool)

(assert (=> b!866291 m!807479))

(declare-fun m!807481 () Bool)

(assert (=> b!866289 m!807481))

(declare-fun m!807483 () Bool)

(assert (=> b!866289 m!807483))

(declare-fun m!807485 () Bool)

(assert (=> b!866289 m!807485))

(declare-fun m!807487 () Bool)

(assert (=> b!866293 m!807487))

(declare-fun m!807489 () Bool)

(assert (=> b!866293 m!807489))

(assert (=> b!866293 m!807455))

(declare-fun m!807491 () Bool)

(assert (=> b!866293 m!807491))

(assert (=> b!866293 m!807455))

(declare-fun m!807493 () Bool)

(assert (=> b!866293 m!807493))

(declare-fun m!807495 () Bool)

(assert (=> b!866293 m!807495))

(declare-fun m!807497 () Bool)

(assert (=> b!866300 m!807497))

(check-sat (not b!866287) (not b!866286) (not b!866301) (not b!866300) (not b!866293) (not b!866295) (not mapNonEmpty!26900) tp_is_empty!16867 (not b_lambda!12065) (not b!866291) (not b_next!14731) (not b!866292) (not b!866289) (not start!73798) b_and!24417)
(check-sat b_and!24417 (not b_next!14731))
