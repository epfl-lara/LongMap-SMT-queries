; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73984 () Bool)

(assert start!73984)

(declare-fun b_free!14731 () Bool)

(declare-fun b_next!14731 () Bool)

(assert (=> start!73984 (= b_free!14731 (not b_next!14731))))

(declare-fun tp!51697 () Bool)

(declare-fun b_and!24451 () Bool)

(assert (=> start!73984 (= tp!51697 b_and!24451)))

(declare-fun b!867428 () Bool)

(declare-fun res!589106 () Bool)

(declare-fun e!483277 () Bool)

(assert (=> b!867428 (=> (not res!589106) (not e!483277))))

(declare-datatypes ((array!49945 0))(
  ( (array!49946 (arr!23999 (Array (_ BitVec 32) (_ BitVec 64))) (size!24440 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49945)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49945 (_ BitVec 32)) Bool)

(assert (=> b!867428 (= res!589106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867429 () Bool)

(declare-fun res!589114 () Bool)

(assert (=> b!867429 (=> (not res!589114) (not e!483277))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867429 (= res!589114 (and (= (select (arr!23999 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867430 () Bool)

(declare-fun e!483280 () Bool)

(declare-fun tp_is_empty!16867 () Bool)

(assert (=> b!867430 (= e!483280 tp_is_empty!16867)))

(declare-fun b!867431 () Bool)

(declare-fun e!483279 () Bool)

(assert (=> b!867431 (= e!483279 true)))

(declare-datatypes ((V!27537 0))(
  ( (V!27538 (val!8481 Int)) )
))
(declare-datatypes ((tuple2!11172 0))(
  ( (tuple2!11173 (_1!5597 (_ BitVec 64)) (_2!5597 V!27537)) )
))
(declare-fun lt!393564 () tuple2!11172)

(declare-datatypes ((List!17000 0))(
  ( (Nil!16997) (Cons!16996 (h!18133 tuple2!11172) (t!23989 List!17000)) )
))
(declare-datatypes ((ListLongMap!9943 0))(
  ( (ListLongMap!9944 (toList!4987 List!17000)) )
))
(declare-fun lt!393555 () ListLongMap!9943)

(declare-fun lt!393567 () ListLongMap!9943)

(declare-fun lt!393559 () tuple2!11172)

(declare-fun +!2390 (ListLongMap!9943 tuple2!11172) ListLongMap!9943)

(assert (=> b!867431 (= lt!393567 (+!2390 (+!2390 lt!393555 lt!393564) lt!393559))))

(declare-fun lt!393558 () V!27537)

(declare-datatypes ((Unit!29700 0))(
  ( (Unit!29701) )
))
(declare-fun lt!393569 () Unit!29700)

(declare-fun v!557 () V!27537)

(declare-fun addCommutativeForDiffKeys!532 (ListLongMap!9943 (_ BitVec 64) V!27537 (_ BitVec 64) V!27537) Unit!29700)

(assert (=> b!867431 (= lt!393569 (addCommutativeForDiffKeys!532 lt!393555 k0!854 v!557 (select (arr!23999 _keys!868) from!1053) lt!393558))))

(declare-fun b!867432 () Bool)

(declare-fun res!589105 () Bool)

(assert (=> b!867432 (=> (not res!589105) (not e!483277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867432 (= res!589105 (validMask!0 mask!1196))))

(declare-fun b!867433 () Bool)

(declare-fun res!589111 () Bool)

(assert (=> b!867433 (=> (not res!589111) (not e!483277))))

(declare-datatypes ((List!17001 0))(
  ( (Nil!16998) (Cons!16997 (h!18134 (_ BitVec 64)) (t!23990 List!17001)) )
))
(declare-fun arrayNoDuplicates!0 (array!49945 (_ BitVec 32) List!17001) Bool)

(assert (=> b!867433 (= res!589111 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16998))))

(declare-fun b!867434 () Bool)

(declare-fun e!483281 () Unit!29700)

(declare-fun Unit!29702 () Unit!29700)

(assert (=> b!867434 (= e!483281 Unit!29702)))

(declare-fun lt!393566 () Unit!29700)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49945 (_ BitVec 32) (_ BitVec 32)) Unit!29700)

(assert (=> b!867434 (= lt!393566 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!867434 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16998)))

(declare-fun lt!393561 () Unit!29700)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49945 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29700)

(assert (=> b!867434 (= lt!393561 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867434 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393554 () Unit!29700)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49945 (_ BitVec 64) (_ BitVec 32) List!17001) Unit!29700)

(assert (=> b!867434 (= lt!393554 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16998))))

(assert (=> b!867434 false))

(declare-fun b!867435 () Bool)

(declare-fun Unit!29703 () Unit!29700)

(assert (=> b!867435 (= e!483281 Unit!29703)))

(declare-fun b!867436 () Bool)

(declare-fun e!483283 () Bool)

(assert (=> b!867436 (= e!483277 e!483283)))

(declare-fun res!589113 () Bool)

(assert (=> b!867436 (=> (not res!589113) (not e!483283))))

(assert (=> b!867436 (= res!589113 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!393562 () ListLongMap!9943)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7994 0))(
  ( (ValueCellFull!7994 (v!10906 V!27537)) (EmptyCell!7994) )
))
(declare-datatypes ((array!49947 0))(
  ( (array!49948 (arr!24000 (Array (_ BitVec 32) ValueCell!7994)) (size!24441 (_ BitVec 32))) )
))
(declare-fun lt!393565 () array!49947)

(declare-fun minValue!654 () V!27537)

(declare-fun zeroValue!654 () V!27537)

(declare-fun getCurrentListMapNoExtraKeys!3032 (array!49945 array!49947 (_ BitVec 32) (_ BitVec 32) V!27537 V!27537 (_ BitVec 32) Int) ListLongMap!9943)

(assert (=> b!867436 (= lt!393562 (getCurrentListMapNoExtraKeys!3032 _keys!868 lt!393565 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!49947)

(assert (=> b!867436 (= lt!393565 (array!49948 (store (arr!24000 _values!688) i!612 (ValueCellFull!7994 v!557)) (size!24441 _values!688)))))

(declare-fun lt!393556 () ListLongMap!9943)

(assert (=> b!867436 (= lt!393556 (getCurrentListMapNoExtraKeys!3032 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867437 () Bool)

(declare-fun e!483282 () Bool)

(assert (=> b!867437 (= e!483283 (not e!483282))))

(declare-fun res!589109 () Bool)

(assert (=> b!867437 (=> res!589109 e!483282)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867437 (= res!589109 (not (validKeyInArray!0 (select (arr!23999 _keys!868) from!1053))))))

(declare-fun lt!393557 () ListLongMap!9943)

(declare-fun lt!393563 () ListLongMap!9943)

(assert (=> b!867437 (= lt!393557 lt!393563)))

(assert (=> b!867437 (= lt!393563 (+!2390 lt!393555 lt!393559))))

(assert (=> b!867437 (= lt!393557 (getCurrentListMapNoExtraKeys!3032 _keys!868 lt!393565 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!867437 (= lt!393559 (tuple2!11173 k0!854 v!557))))

(assert (=> b!867437 (= lt!393555 (getCurrentListMapNoExtraKeys!3032 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393560 () Unit!29700)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!565 (array!49945 array!49947 (_ BitVec 32) (_ BitVec 32) V!27537 V!27537 (_ BitVec 32) (_ BitVec 64) V!27537 (_ BitVec 32) Int) Unit!29700)

(assert (=> b!867437 (= lt!393560 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!565 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26900 () Bool)

(declare-fun mapRes!26900 () Bool)

(assert (=> mapIsEmpty!26900 mapRes!26900))

(declare-fun b!867438 () Bool)

(declare-fun res!589108 () Bool)

(assert (=> b!867438 (=> (not res!589108) (not e!483277))))

(assert (=> b!867438 (= res!589108 (and (= (size!24441 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24440 _keys!868) (size!24441 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867439 () Bool)

(declare-fun e!483275 () Bool)

(assert (=> b!867439 (= e!483275 tp_is_empty!16867)))

(declare-fun b!867440 () Bool)

(declare-fun res!589107 () Bool)

(assert (=> b!867440 (=> (not res!589107) (not e!483277))))

(assert (=> b!867440 (= res!589107 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24440 _keys!868))))))

(declare-fun b!867441 () Bool)

(assert (=> b!867441 (= e!483282 e!483279)))

(declare-fun res!589112 () Bool)

(assert (=> b!867441 (=> res!589112 e!483279)))

(assert (=> b!867441 (= res!589112 (= k0!854 (select (arr!23999 _keys!868) from!1053)))))

(assert (=> b!867441 (not (= (select (arr!23999 _keys!868) from!1053) k0!854))))

(declare-fun lt!393568 () Unit!29700)

(assert (=> b!867441 (= lt!393568 e!483281)))

(declare-fun c!92599 () Bool)

(assert (=> b!867441 (= c!92599 (= (select (arr!23999 _keys!868) from!1053) k0!854))))

(assert (=> b!867441 (= lt!393562 lt!393567)))

(assert (=> b!867441 (= lt!393567 (+!2390 lt!393563 lt!393564))))

(assert (=> b!867441 (= lt!393564 (tuple2!11173 (select (arr!23999 _keys!868) from!1053) lt!393558))))

(declare-fun get!12705 (ValueCell!7994 V!27537) V!27537)

(declare-fun dynLambda!1211 (Int (_ BitVec 64)) V!27537)

(assert (=> b!867441 (= lt!393558 (get!12705 (select (arr!24000 _values!688) from!1053) (dynLambda!1211 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!867442 () Bool)

(declare-fun res!589110 () Bool)

(assert (=> b!867442 (=> (not res!589110) (not e!483277))))

(assert (=> b!867442 (= res!589110 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26900 () Bool)

(declare-fun tp!51698 () Bool)

(assert (=> mapNonEmpty!26900 (= mapRes!26900 (and tp!51698 e!483275))))

(declare-fun mapRest!26900 () (Array (_ BitVec 32) ValueCell!7994))

(declare-fun mapValue!26900 () ValueCell!7994)

(declare-fun mapKey!26900 () (_ BitVec 32))

(assert (=> mapNonEmpty!26900 (= (arr!24000 _values!688) (store mapRest!26900 mapKey!26900 mapValue!26900))))

(declare-fun b!867443 () Bool)

(declare-fun e!483278 () Bool)

(assert (=> b!867443 (= e!483278 (and e!483280 mapRes!26900))))

(declare-fun condMapEmpty!26900 () Bool)

(declare-fun mapDefault!26900 () ValueCell!7994)

(assert (=> b!867443 (= condMapEmpty!26900 (= (arr!24000 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7994)) mapDefault!26900)))))

(declare-fun res!589104 () Bool)

(assert (=> start!73984 (=> (not res!589104) (not e!483277))))

(assert (=> start!73984 (= res!589104 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24440 _keys!868))))))

(assert (=> start!73984 e!483277))

(assert (=> start!73984 tp_is_empty!16867))

(assert (=> start!73984 true))

(assert (=> start!73984 tp!51697))

(declare-fun array_inv!19022 (array!49945) Bool)

(assert (=> start!73984 (array_inv!19022 _keys!868)))

(declare-fun array_inv!19023 (array!49947) Bool)

(assert (=> start!73984 (and (array_inv!19023 _values!688) e!483278)))

(assert (= (and start!73984 res!589104) b!867432))

(assert (= (and b!867432 res!589105) b!867438))

(assert (= (and b!867438 res!589108) b!867428))

(assert (= (and b!867428 res!589106) b!867433))

(assert (= (and b!867433 res!589111) b!867440))

(assert (= (and b!867440 res!589107) b!867442))

(assert (= (and b!867442 res!589110) b!867429))

(assert (= (and b!867429 res!589114) b!867436))

(assert (= (and b!867436 res!589113) b!867437))

(assert (= (and b!867437 (not res!589109)) b!867441))

(assert (= (and b!867441 c!92599) b!867434))

(assert (= (and b!867441 (not c!92599)) b!867435))

(assert (= (and b!867441 (not res!589112)) b!867431))

(assert (= (and b!867443 condMapEmpty!26900) mapIsEmpty!26900))

(assert (= (and b!867443 (not condMapEmpty!26900)) mapNonEmpty!26900))

(get-info :version)

(assert (= (and mapNonEmpty!26900 ((_ is ValueCellFull!7994) mapValue!26900)) b!867439))

(assert (= (and b!867443 ((_ is ValueCellFull!7994) mapDefault!26900)) b!867430))

(assert (= start!73984 b!867443))

(declare-fun b_lambda!12097 () Bool)

(assert (=> (not b_lambda!12097) (not b!867441)))

(declare-fun t!23988 () Bool)

(declare-fun tb!4845 () Bool)

(assert (=> (and start!73984 (= defaultEntry!696 defaultEntry!696) t!23988) tb!4845))

(declare-fun result!9309 () Bool)

(assert (=> tb!4845 (= result!9309 tp_is_empty!16867)))

(assert (=> b!867441 t!23988))

(declare-fun b_and!24453 () Bool)

(assert (= b_and!24451 (and (=> t!23988 result!9309) b_and!24453)))

(declare-fun m!809489 () Bool)

(assert (=> b!867437 m!809489))

(declare-fun m!809491 () Bool)

(assert (=> b!867437 m!809491))

(declare-fun m!809493 () Bool)

(assert (=> b!867437 m!809493))

(declare-fun m!809495 () Bool)

(assert (=> b!867437 m!809495))

(assert (=> b!867437 m!809493))

(declare-fun m!809497 () Bool)

(assert (=> b!867437 m!809497))

(declare-fun m!809499 () Bool)

(assert (=> b!867437 m!809499))

(declare-fun m!809501 () Bool)

(assert (=> b!867441 m!809501))

(declare-fun m!809503 () Bool)

(assert (=> b!867441 m!809503))

(declare-fun m!809505 () Bool)

(assert (=> b!867441 m!809505))

(declare-fun m!809507 () Bool)

(assert (=> b!867441 m!809507))

(assert (=> b!867441 m!809503))

(assert (=> b!867441 m!809493))

(assert (=> b!867441 m!809505))

(declare-fun m!809509 () Bool)

(assert (=> b!867428 m!809509))

(declare-fun m!809511 () Bool)

(assert (=> mapNonEmpty!26900 m!809511))

(declare-fun m!809513 () Bool)

(assert (=> b!867429 m!809513))

(declare-fun m!809515 () Bool)

(assert (=> b!867442 m!809515))

(declare-fun m!809517 () Bool)

(assert (=> b!867434 m!809517))

(declare-fun m!809519 () Bool)

(assert (=> b!867434 m!809519))

(declare-fun m!809521 () Bool)

(assert (=> b!867434 m!809521))

(declare-fun m!809523 () Bool)

(assert (=> b!867434 m!809523))

(declare-fun m!809525 () Bool)

(assert (=> b!867434 m!809525))

(declare-fun m!809527 () Bool)

(assert (=> start!73984 m!809527))

(declare-fun m!809529 () Bool)

(assert (=> start!73984 m!809529))

(declare-fun m!809531 () Bool)

(assert (=> b!867436 m!809531))

(declare-fun m!809533 () Bool)

(assert (=> b!867436 m!809533))

(declare-fun m!809535 () Bool)

(assert (=> b!867436 m!809535))

(declare-fun m!809537 () Bool)

(assert (=> b!867431 m!809537))

(assert (=> b!867431 m!809537))

(declare-fun m!809539 () Bool)

(assert (=> b!867431 m!809539))

(assert (=> b!867431 m!809493))

(assert (=> b!867431 m!809493))

(declare-fun m!809541 () Bool)

(assert (=> b!867431 m!809541))

(declare-fun m!809543 () Bool)

(assert (=> b!867432 m!809543))

(declare-fun m!809545 () Bool)

(assert (=> b!867433 m!809545))

(check-sat (not b!867441) (not b_lambda!12097) (not start!73984) b_and!24453 tp_is_empty!16867 (not b!867433) (not b!867431) (not b!867434) (not b!867428) (not b!867432) (not mapNonEmpty!26900) (not b_next!14731) (not b!867436) (not b!867437) (not b!867442))
(check-sat b_and!24453 (not b_next!14731))
