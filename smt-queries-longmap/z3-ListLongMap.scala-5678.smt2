; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74020 () Bool)

(assert start!74020)

(declare-fun b_free!14767 () Bool)

(declare-fun b_next!14767 () Bool)

(assert (=> start!74020 (= b_free!14767 (not b_next!14767))))

(declare-fun tp!51806 () Bool)

(declare-fun b_and!24523 () Bool)

(assert (=> start!74020 (= tp!51806 b_and!24523)))

(declare-fun res!589702 () Bool)

(declare-fun e!483768 () Bool)

(assert (=> start!74020 (=> (not res!589702) (not e!483768))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50015 0))(
  ( (array!50016 (arr!24034 (Array (_ BitVec 32) (_ BitVec 64))) (size!24475 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50015)

(assert (=> start!74020 (= res!589702 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24475 _keys!868))))))

(assert (=> start!74020 e!483768))

(declare-fun tp_is_empty!16903 () Bool)

(assert (=> start!74020 tp_is_empty!16903))

(assert (=> start!74020 true))

(assert (=> start!74020 tp!51806))

(declare-fun array_inv!19046 (array!50015) Bool)

(assert (=> start!74020 (array_inv!19046 _keys!868)))

(declare-datatypes ((V!27585 0))(
  ( (V!27586 (val!8499 Int)) )
))
(declare-datatypes ((ValueCell!8012 0))(
  ( (ValueCellFull!8012 (v!10924 V!27585)) (EmptyCell!8012) )
))
(declare-datatypes ((array!50017 0))(
  ( (array!50018 (arr!24035 (Array (_ BitVec 32) ValueCell!8012)) (size!24476 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50017)

(declare-fun e!483762 () Bool)

(declare-fun array_inv!19047 (array!50017) Bool)

(assert (=> start!74020 (and (array_inv!19047 _values!688) e!483762)))

(declare-fun b!868328 () Bool)

(declare-fun res!589704 () Bool)

(assert (=> b!868328 (=> (not res!589704) (not e!483768))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868328 (= res!589704 (validKeyInArray!0 k0!854))))

(declare-fun b!868329 () Bool)

(declare-fun res!589706 () Bool)

(assert (=> b!868329 (=> (not res!589706) (not e!483768))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!868329 (= res!589706 (and (= (size!24476 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24475 _keys!868) (size!24476 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26954 () Bool)

(declare-fun mapRes!26954 () Bool)

(assert (=> mapIsEmpty!26954 mapRes!26954))

(declare-fun b!868330 () Bool)

(declare-fun e!483769 () Bool)

(assert (=> b!868330 (= e!483762 (and e!483769 mapRes!26954))))

(declare-fun condMapEmpty!26954 () Bool)

(declare-fun mapDefault!26954 () ValueCell!8012)

(assert (=> b!868330 (= condMapEmpty!26954 (= (arr!24035 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8012)) mapDefault!26954)))))

(declare-fun b!868331 () Bool)

(declare-fun res!589707 () Bool)

(assert (=> b!868331 (=> (not res!589707) (not e!483768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50015 (_ BitVec 32)) Bool)

(assert (=> b!868331 (= res!589707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26954 () Bool)

(declare-fun tp!51805 () Bool)

(declare-fun e!483765 () Bool)

(assert (=> mapNonEmpty!26954 (= mapRes!26954 (and tp!51805 e!483765))))

(declare-fun mapValue!26954 () ValueCell!8012)

(declare-fun mapRest!26954 () (Array (_ BitVec 32) ValueCell!8012))

(declare-fun mapKey!26954 () (_ BitVec 32))

(assert (=> mapNonEmpty!26954 (= (arr!24035 _values!688) (store mapRest!26954 mapKey!26954 mapValue!26954))))

(declare-fun b!868332 () Bool)

(declare-fun e!483767 () Bool)

(declare-fun e!483766 () Bool)

(assert (=> b!868332 (= e!483767 (not e!483766))))

(declare-fun res!589705 () Bool)

(assert (=> b!868332 (=> res!589705 e!483766)))

(assert (=> b!868332 (= res!589705 (not (validKeyInArray!0 (select (arr!24034 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11202 0))(
  ( (tuple2!11203 (_1!5612 (_ BitVec 64)) (_2!5612 V!27585)) )
))
(declare-datatypes ((List!17029 0))(
  ( (Nil!17026) (Cons!17025 (h!18162 tuple2!11202) (t!24054 List!17029)) )
))
(declare-datatypes ((ListLongMap!9973 0))(
  ( (ListLongMap!9974 (toList!5002 List!17029)) )
))
(declare-fun lt!394423 () ListLongMap!9973)

(declare-fun lt!394433 () ListLongMap!9973)

(assert (=> b!868332 (= lt!394423 lt!394433)))

(declare-fun lt!394427 () ListLongMap!9973)

(declare-fun lt!394424 () tuple2!11202)

(declare-fun +!2404 (ListLongMap!9973 tuple2!11202) ListLongMap!9973)

(assert (=> b!868332 (= lt!394433 (+!2404 lt!394427 lt!394424))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27585)

(declare-fun zeroValue!654 () V!27585)

(declare-fun lt!394430 () array!50017)

(declare-fun getCurrentListMapNoExtraKeys!3046 (array!50015 array!50017 (_ BitVec 32) (_ BitVec 32) V!27585 V!27585 (_ BitVec 32) Int) ListLongMap!9973)

(assert (=> b!868332 (= lt!394423 (getCurrentListMapNoExtraKeys!3046 _keys!868 lt!394430 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27585)

(assert (=> b!868332 (= lt!394424 (tuple2!11203 k0!854 v!557))))

(assert (=> b!868332 (= lt!394427 (getCurrentListMapNoExtraKeys!3046 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29752 0))(
  ( (Unit!29753) )
))
(declare-fun lt!394431 () Unit!29752)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!576 (array!50015 array!50017 (_ BitVec 32) (_ BitVec 32) V!27585 V!27585 (_ BitVec 32) (_ BitVec 64) V!27585 (_ BitVec 32) Int) Unit!29752)

(assert (=> b!868332 (= lt!394431 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!576 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868333 () Bool)

(declare-fun e!483763 () Bool)

(assert (=> b!868333 (= e!483766 e!483763)))

(declare-fun res!589708 () Bool)

(assert (=> b!868333 (=> res!589708 e!483763)))

(assert (=> b!868333 (= res!589708 (= k0!854 (select (arr!24034 _keys!868) from!1053)))))

(assert (=> b!868333 (not (= (select (arr!24034 _keys!868) from!1053) k0!854))))

(declare-fun lt!394425 () Unit!29752)

(declare-fun e!483761 () Unit!29752)

(assert (=> b!868333 (= lt!394425 e!483761)))

(declare-fun c!92653 () Bool)

(assert (=> b!868333 (= c!92653 (= (select (arr!24034 _keys!868) from!1053) k0!854))))

(declare-fun lt!394420 () ListLongMap!9973)

(declare-fun lt!394422 () ListLongMap!9973)

(assert (=> b!868333 (= lt!394420 lt!394422)))

(declare-fun lt!394426 () tuple2!11202)

(assert (=> b!868333 (= lt!394422 (+!2404 lt!394433 lt!394426))))

(declare-fun lt!394432 () V!27585)

(assert (=> b!868333 (= lt!394426 (tuple2!11203 (select (arr!24034 _keys!868) from!1053) lt!394432))))

(declare-fun get!12729 (ValueCell!8012 V!27585) V!27585)

(declare-fun dynLambda!1223 (Int (_ BitVec 64)) V!27585)

(assert (=> b!868333 (= lt!394432 (get!12729 (select (arr!24035 _values!688) from!1053) (dynLambda!1223 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!868334 () Bool)

(declare-fun res!589703 () Bool)

(assert (=> b!868334 (=> (not res!589703) (not e!483768))))

(declare-datatypes ((List!17030 0))(
  ( (Nil!17027) (Cons!17026 (h!18163 (_ BitVec 64)) (t!24055 List!17030)) )
))
(declare-fun arrayNoDuplicates!0 (array!50015 (_ BitVec 32) List!17030) Bool)

(assert (=> b!868334 (= res!589703 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17027))))

(declare-fun b!868335 () Bool)

(assert (=> b!868335 (= e!483765 tp_is_empty!16903)))

(declare-fun b!868336 () Bool)

(declare-fun res!589699 () Bool)

(assert (=> b!868336 (=> (not res!589699) (not e!483768))))

(assert (=> b!868336 (= res!589699 (and (= (select (arr!24034 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868337 () Bool)

(declare-fun Unit!29754 () Unit!29752)

(assert (=> b!868337 (= e!483761 Unit!29754)))

(declare-fun lt!394429 () Unit!29752)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!50015 (_ BitVec 32) (_ BitVec 32)) Unit!29752)

(assert (=> b!868337 (= lt!394429 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!868337 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17027)))

(declare-fun lt!394419 () Unit!29752)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!50015 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29752)

(assert (=> b!868337 (= lt!394419 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!50015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!868337 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!394428 () Unit!29752)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!50015 (_ BitVec 64) (_ BitVec 32) List!17030) Unit!29752)

(assert (=> b!868337 (= lt!394428 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17027))))

(assert (=> b!868337 false))

(declare-fun b!868338 () Bool)

(declare-fun res!589700 () Bool)

(assert (=> b!868338 (=> (not res!589700) (not e!483768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868338 (= res!589700 (validMask!0 mask!1196))))

(declare-fun b!868339 () Bool)

(assert (=> b!868339 (= e!483769 tp_is_empty!16903)))

(declare-fun b!868340 () Bool)

(declare-fun Unit!29755 () Unit!29752)

(assert (=> b!868340 (= e!483761 Unit!29755)))

(declare-fun b!868341 () Bool)

(assert (=> b!868341 (= e!483763 true)))

(assert (=> b!868341 (= lt!394422 (+!2404 (+!2404 lt!394427 lt!394426) lt!394424))))

(declare-fun lt!394421 () Unit!29752)

(declare-fun addCommutativeForDiffKeys!544 (ListLongMap!9973 (_ BitVec 64) V!27585 (_ BitVec 64) V!27585) Unit!29752)

(assert (=> b!868341 (= lt!394421 (addCommutativeForDiffKeys!544 lt!394427 k0!854 v!557 (select (arr!24034 _keys!868) from!1053) lt!394432))))

(declare-fun b!868342 () Bool)

(declare-fun res!589701 () Bool)

(assert (=> b!868342 (=> (not res!589701) (not e!483768))))

(assert (=> b!868342 (= res!589701 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24475 _keys!868))))))

(declare-fun b!868343 () Bool)

(assert (=> b!868343 (= e!483768 e!483767)))

(declare-fun res!589698 () Bool)

(assert (=> b!868343 (=> (not res!589698) (not e!483767))))

(assert (=> b!868343 (= res!589698 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!868343 (= lt!394420 (getCurrentListMapNoExtraKeys!3046 _keys!868 lt!394430 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868343 (= lt!394430 (array!50018 (store (arr!24035 _values!688) i!612 (ValueCellFull!8012 v!557)) (size!24476 _values!688)))))

(declare-fun lt!394418 () ListLongMap!9973)

(assert (=> b!868343 (= lt!394418 (getCurrentListMapNoExtraKeys!3046 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74020 res!589702) b!868338))

(assert (= (and b!868338 res!589700) b!868329))

(assert (= (and b!868329 res!589706) b!868331))

(assert (= (and b!868331 res!589707) b!868334))

(assert (= (and b!868334 res!589703) b!868342))

(assert (= (and b!868342 res!589701) b!868328))

(assert (= (and b!868328 res!589704) b!868336))

(assert (= (and b!868336 res!589699) b!868343))

(assert (= (and b!868343 res!589698) b!868332))

(assert (= (and b!868332 (not res!589705)) b!868333))

(assert (= (and b!868333 c!92653) b!868337))

(assert (= (and b!868333 (not c!92653)) b!868340))

(assert (= (and b!868333 (not res!589708)) b!868341))

(assert (= (and b!868330 condMapEmpty!26954) mapIsEmpty!26954))

(assert (= (and b!868330 (not condMapEmpty!26954)) mapNonEmpty!26954))

(get-info :version)

(assert (= (and mapNonEmpty!26954 ((_ is ValueCellFull!8012) mapValue!26954)) b!868335))

(assert (= (and b!868330 ((_ is ValueCellFull!8012) mapDefault!26954)) b!868339))

(assert (= start!74020 b!868330))

(declare-fun b_lambda!12133 () Bool)

(assert (=> (not b_lambda!12133) (not b!868333)))

(declare-fun t!24053 () Bool)

(declare-fun tb!4881 () Bool)

(assert (=> (and start!74020 (= defaultEntry!696 defaultEntry!696) t!24053) tb!4881))

(declare-fun result!9381 () Bool)

(assert (=> tb!4881 (= result!9381 tp_is_empty!16903)))

(assert (=> b!868333 t!24053))

(declare-fun b_and!24525 () Bool)

(assert (= b_and!24523 (and (=> t!24053 result!9381) b_and!24525)))

(declare-fun m!810533 () Bool)

(assert (=> b!868343 m!810533))

(declare-fun m!810535 () Bool)

(assert (=> b!868343 m!810535))

(declare-fun m!810537 () Bool)

(assert (=> b!868343 m!810537))

(declare-fun m!810539 () Bool)

(assert (=> b!868338 m!810539))

(declare-fun m!810541 () Bool)

(assert (=> b!868337 m!810541))

(declare-fun m!810543 () Bool)

(assert (=> b!868337 m!810543))

(declare-fun m!810545 () Bool)

(assert (=> b!868337 m!810545))

(declare-fun m!810547 () Bool)

(assert (=> b!868337 m!810547))

(declare-fun m!810549 () Bool)

(assert (=> b!868337 m!810549))

(declare-fun m!810551 () Bool)

(assert (=> start!74020 m!810551))

(declare-fun m!810553 () Bool)

(assert (=> start!74020 m!810553))

(declare-fun m!810555 () Bool)

(assert (=> b!868341 m!810555))

(assert (=> b!868341 m!810555))

(declare-fun m!810557 () Bool)

(assert (=> b!868341 m!810557))

(declare-fun m!810559 () Bool)

(assert (=> b!868341 m!810559))

(assert (=> b!868341 m!810559))

(declare-fun m!810561 () Bool)

(assert (=> b!868341 m!810561))

(declare-fun m!810563 () Bool)

(assert (=> b!868331 m!810563))

(declare-fun m!810565 () Bool)

(assert (=> b!868334 m!810565))

(declare-fun m!810567 () Bool)

(assert (=> b!868332 m!810567))

(declare-fun m!810569 () Bool)

(assert (=> b!868332 m!810569))

(assert (=> b!868332 m!810559))

(declare-fun m!810571 () Bool)

(assert (=> b!868332 m!810571))

(assert (=> b!868332 m!810559))

(declare-fun m!810573 () Bool)

(assert (=> b!868332 m!810573))

(declare-fun m!810575 () Bool)

(assert (=> b!868332 m!810575))

(declare-fun m!810577 () Bool)

(assert (=> mapNonEmpty!26954 m!810577))

(declare-fun m!810579 () Bool)

(assert (=> b!868333 m!810579))

(declare-fun m!810581 () Bool)

(assert (=> b!868333 m!810581))

(declare-fun m!810583 () Bool)

(assert (=> b!868333 m!810583))

(declare-fun m!810585 () Bool)

(assert (=> b!868333 m!810585))

(assert (=> b!868333 m!810581))

(assert (=> b!868333 m!810559))

(assert (=> b!868333 m!810583))

(declare-fun m!810587 () Bool)

(assert (=> b!868328 m!810587))

(declare-fun m!810589 () Bool)

(assert (=> b!868336 m!810589))

(check-sat (not start!74020) (not b!868328) (not b!868333) (not b_next!14767) (not b_lambda!12133) (not b!868334) tp_is_empty!16903 (not b!868338) (not b!868332) (not b!868331) (not b!868341) b_and!24525 (not b!868343) (not mapNonEmpty!26954) (not b!868337))
(check-sat b_and!24525 (not b_next!14767))
