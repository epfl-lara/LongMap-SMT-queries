; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73948 () Bool)

(assert start!73948)

(declare-fun b_free!14695 () Bool)

(declare-fun b_next!14695 () Bool)

(assert (=> start!73948 (= b_free!14695 (not b_next!14695))))

(declare-fun tp!51589 () Bool)

(declare-fun b_and!24379 () Bool)

(assert (=> start!73948 (= tp!51589 b_and!24379)))

(declare-fun b!866528 () Bool)

(declare-fun res!588516 () Bool)

(declare-fun e!482793 () Bool)

(assert (=> b!866528 (=> (not res!588516) (not e!482793))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866528 (= res!588516 (validMask!0 mask!1196))))

(declare-fun b!866529 () Bool)

(declare-datatypes ((Unit!29639 0))(
  ( (Unit!29640) )
))
(declare-fun e!482791 () Unit!29639)

(declare-fun Unit!29641 () Unit!29639)

(assert (=> b!866529 (= e!482791 Unit!29641)))

(declare-fun lt!392694 () Unit!29639)

(declare-datatypes ((array!49873 0))(
  ( (array!49874 (arr!23963 (Array (_ BitVec 32) (_ BitVec 64))) (size!24404 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49873)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49873 (_ BitVec 32) (_ BitVec 32)) Unit!29639)

(assert (=> b!866529 (= lt!392694 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16968 0))(
  ( (Nil!16965) (Cons!16964 (h!18101 (_ BitVec 64)) (t!23921 List!16968)) )
))
(declare-fun arrayNoDuplicates!0 (array!49873 (_ BitVec 32) List!16968) Bool)

(assert (=> b!866529 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16965)))

(declare-fun lt!392704 () Unit!29639)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49873 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29639)

(assert (=> b!866529 (= lt!392704 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866529 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392702 () Unit!29639)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49873 (_ BitVec 64) (_ BitVec 32) List!16968) Unit!29639)

(assert (=> b!866529 (= lt!392702 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16965))))

(assert (=> b!866529 false))

(declare-fun b!866530 () Bool)

(declare-fun res!588513 () Bool)

(assert (=> b!866530 (=> (not res!588513) (not e!482793))))

(assert (=> b!866530 (= res!588513 (and (= (select (arr!23963 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866531 () Bool)

(declare-fun e!482790 () Bool)

(declare-fun tp_is_empty!16831 () Bool)

(assert (=> b!866531 (= e!482790 tp_is_empty!16831)))

(declare-fun b!866532 () Bool)

(declare-fun e!482789 () Bool)

(assert (=> b!866532 (= e!482789 tp_is_empty!16831)))

(declare-fun b!866533 () Bool)

(declare-fun res!588519 () Bool)

(assert (=> b!866533 (=> (not res!588519) (not e!482793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866533 (= res!588519 (validKeyInArray!0 k0!854))))

(declare-fun b!866534 () Bool)

(declare-fun res!588518 () Bool)

(assert (=> b!866534 (=> (not res!588518) (not e!482793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49873 (_ BitVec 32)) Bool)

(assert (=> b!866534 (= res!588518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26846 () Bool)

(declare-fun mapRes!26846 () Bool)

(assert (=> mapIsEmpty!26846 mapRes!26846))

(declare-fun b!866535 () Bool)

(declare-fun e!482796 () Bool)

(assert (=> b!866535 (= e!482793 e!482796)))

(declare-fun res!588517 () Bool)

(assert (=> b!866535 (=> (not res!588517) (not e!482796))))

(assert (=> b!866535 (= res!588517 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27489 0))(
  ( (V!27490 (val!8463 Int)) )
))
(declare-fun minValue!654 () V!27489)

(declare-datatypes ((ValueCell!7976 0))(
  ( (ValueCellFull!7976 (v!10888 V!27489)) (EmptyCell!7976) )
))
(declare-datatypes ((array!49875 0))(
  ( (array!49876 (arr!23964 (Array (_ BitVec 32) ValueCell!7976)) (size!24405 (_ BitVec 32))) )
))
(declare-fun lt!392693 () array!49875)

(declare-fun zeroValue!654 () V!27489)

(declare-datatypes ((tuple2!11138 0))(
  ( (tuple2!11139 (_1!5580 (_ BitVec 64)) (_2!5580 V!27489)) )
))
(declare-datatypes ((List!16969 0))(
  ( (Nil!16966) (Cons!16965 (h!18102 tuple2!11138) (t!23922 List!16969)) )
))
(declare-datatypes ((ListLongMap!9909 0))(
  ( (ListLongMap!9910 (toList!4970 List!16969)) )
))
(declare-fun lt!392699 () ListLongMap!9909)

(declare-fun getCurrentListMapNoExtraKeys!3019 (array!49873 array!49875 (_ BitVec 32) (_ BitVec 32) V!27489 V!27489 (_ BitVec 32) Int) ListLongMap!9909)

(assert (=> b!866535 (= lt!392699 (getCurrentListMapNoExtraKeys!3019 _keys!868 lt!392693 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27489)

(declare-fun _values!688 () array!49875)

(assert (=> b!866535 (= lt!392693 (array!49876 (store (arr!23964 _values!688) i!612 (ValueCellFull!7976 v!557)) (size!24405 _values!688)))))

(declare-fun lt!392695 () ListLongMap!9909)

(assert (=> b!866535 (= lt!392695 (getCurrentListMapNoExtraKeys!3019 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!588510 () Bool)

(assert (=> start!73948 (=> (not res!588510) (not e!482793))))

(assert (=> start!73948 (= res!588510 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24404 _keys!868))))))

(assert (=> start!73948 e!482793))

(assert (=> start!73948 tp_is_empty!16831))

(assert (=> start!73948 true))

(assert (=> start!73948 tp!51589))

(declare-fun array_inv!19000 (array!49873) Bool)

(assert (=> start!73948 (array_inv!19000 _keys!868)))

(declare-fun e!482792 () Bool)

(declare-fun array_inv!19001 (array!49875) Bool)

(assert (=> start!73948 (and (array_inv!19001 _values!688) e!482792)))

(declare-fun b!866536 () Bool)

(declare-fun Unit!29642 () Unit!29639)

(assert (=> b!866536 (= e!482791 Unit!29642)))

(declare-fun b!866537 () Bool)

(declare-fun e!482797 () Bool)

(assert (=> b!866537 (= e!482797 true)))

(declare-fun lt!392698 () ListLongMap!9909)

(declare-fun lt!392696 () tuple2!11138)

(declare-fun lt!392692 () ListLongMap!9909)

(declare-fun lt!392705 () tuple2!11138)

(declare-fun +!2373 (ListLongMap!9909 tuple2!11138) ListLongMap!9909)

(assert (=> b!866537 (= lt!392698 (+!2373 (+!2373 lt!392692 lt!392705) lt!392696))))

(declare-fun lt!392690 () V!27489)

(declare-fun lt!392691 () Unit!29639)

(declare-fun addCommutativeForDiffKeys!519 (ListLongMap!9909 (_ BitVec 64) V!27489 (_ BitVec 64) V!27489) Unit!29639)

(assert (=> b!866537 (= lt!392691 (addCommutativeForDiffKeys!519 lt!392692 k0!854 v!557 (select (arr!23963 _keys!868) from!1053) lt!392690))))

(declare-fun b!866538 () Bool)

(declare-fun res!588520 () Bool)

(assert (=> b!866538 (=> (not res!588520) (not e!482793))))

(assert (=> b!866538 (= res!588520 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24404 _keys!868))))))

(declare-fun b!866539 () Bool)

(declare-fun res!588515 () Bool)

(assert (=> b!866539 (=> (not res!588515) (not e!482793))))

(assert (=> b!866539 (= res!588515 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16965))))

(declare-fun mapNonEmpty!26846 () Bool)

(declare-fun tp!51590 () Bool)

(assert (=> mapNonEmpty!26846 (= mapRes!26846 (and tp!51590 e!482790))))

(declare-fun mapKey!26846 () (_ BitVec 32))

(declare-fun mapValue!26846 () ValueCell!7976)

(declare-fun mapRest!26846 () (Array (_ BitVec 32) ValueCell!7976))

(assert (=> mapNonEmpty!26846 (= (arr!23964 _values!688) (store mapRest!26846 mapKey!26846 mapValue!26846))))

(declare-fun b!866540 () Bool)

(assert (=> b!866540 (= e!482792 (and e!482789 mapRes!26846))))

(declare-fun condMapEmpty!26846 () Bool)

(declare-fun mapDefault!26846 () ValueCell!7976)

(assert (=> b!866540 (= condMapEmpty!26846 (= (arr!23964 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7976)) mapDefault!26846)))))

(declare-fun b!866541 () Bool)

(declare-fun e!482794 () Bool)

(assert (=> b!866541 (= e!482794 e!482797)))

(declare-fun res!588512 () Bool)

(assert (=> b!866541 (=> res!588512 e!482797)))

(assert (=> b!866541 (= res!588512 (= k0!854 (select (arr!23963 _keys!868) from!1053)))))

(assert (=> b!866541 (not (= (select (arr!23963 _keys!868) from!1053) k0!854))))

(declare-fun lt!392703 () Unit!29639)

(assert (=> b!866541 (= lt!392703 e!482791)))

(declare-fun c!92545 () Bool)

(assert (=> b!866541 (= c!92545 (= (select (arr!23963 _keys!868) from!1053) k0!854))))

(assert (=> b!866541 (= lt!392699 lt!392698)))

(declare-fun lt!392697 () ListLongMap!9909)

(assert (=> b!866541 (= lt!392698 (+!2373 lt!392697 lt!392705))))

(assert (=> b!866541 (= lt!392705 (tuple2!11139 (select (arr!23963 _keys!868) from!1053) lt!392690))))

(declare-fun get!12676 (ValueCell!7976 V!27489) V!27489)

(declare-fun dynLambda!1194 (Int (_ BitVec 64)) V!27489)

(assert (=> b!866541 (= lt!392690 (get!12676 (select (arr!23964 _values!688) from!1053) (dynLambda!1194 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866542 () Bool)

(assert (=> b!866542 (= e!482796 (not e!482794))))

(declare-fun res!588511 () Bool)

(assert (=> b!866542 (=> res!588511 e!482794)))

(assert (=> b!866542 (= res!588511 (not (validKeyInArray!0 (select (arr!23963 _keys!868) from!1053))))))

(declare-fun lt!392700 () ListLongMap!9909)

(assert (=> b!866542 (= lt!392700 lt!392697)))

(assert (=> b!866542 (= lt!392697 (+!2373 lt!392692 lt!392696))))

(assert (=> b!866542 (= lt!392700 (getCurrentListMapNoExtraKeys!3019 _keys!868 lt!392693 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866542 (= lt!392696 (tuple2!11139 k0!854 v!557))))

(assert (=> b!866542 (= lt!392692 (getCurrentListMapNoExtraKeys!3019 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392701 () Unit!29639)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!554 (array!49873 array!49875 (_ BitVec 32) (_ BitVec 32) V!27489 V!27489 (_ BitVec 32) (_ BitVec 64) V!27489 (_ BitVec 32) Int) Unit!29639)

(assert (=> b!866542 (= lt!392701 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!554 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866543 () Bool)

(declare-fun res!588514 () Bool)

(assert (=> b!866543 (=> (not res!588514) (not e!482793))))

(assert (=> b!866543 (= res!588514 (and (= (size!24405 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24404 _keys!868) (size!24405 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73948 res!588510) b!866528))

(assert (= (and b!866528 res!588516) b!866543))

(assert (= (and b!866543 res!588514) b!866534))

(assert (= (and b!866534 res!588518) b!866539))

(assert (= (and b!866539 res!588515) b!866538))

(assert (= (and b!866538 res!588520) b!866533))

(assert (= (and b!866533 res!588519) b!866530))

(assert (= (and b!866530 res!588513) b!866535))

(assert (= (and b!866535 res!588517) b!866542))

(assert (= (and b!866542 (not res!588511)) b!866541))

(assert (= (and b!866541 c!92545) b!866529))

(assert (= (and b!866541 (not c!92545)) b!866536))

(assert (= (and b!866541 (not res!588512)) b!866537))

(assert (= (and b!866540 condMapEmpty!26846) mapIsEmpty!26846))

(assert (= (and b!866540 (not condMapEmpty!26846)) mapNonEmpty!26846))

(get-info :version)

(assert (= (and mapNonEmpty!26846 ((_ is ValueCellFull!7976) mapValue!26846)) b!866531))

(assert (= (and b!866540 ((_ is ValueCellFull!7976) mapDefault!26846)) b!866532))

(assert (= start!73948 b!866540))

(declare-fun b_lambda!12061 () Bool)

(assert (=> (not b_lambda!12061) (not b!866541)))

(declare-fun t!23920 () Bool)

(declare-fun tb!4809 () Bool)

(assert (=> (and start!73948 (= defaultEntry!696 defaultEntry!696) t!23920) tb!4809))

(declare-fun result!9237 () Bool)

(assert (=> tb!4809 (= result!9237 tp_is_empty!16831)))

(assert (=> b!866541 t!23920))

(declare-fun b_and!24381 () Bool)

(assert (= b_and!24379 (and (=> t!23920 result!9237) b_and!24381)))

(declare-fun m!808445 () Bool)

(assert (=> b!866530 m!808445))

(declare-fun m!808447 () Bool)

(assert (=> b!866542 m!808447))

(declare-fun m!808449 () Bool)

(assert (=> b!866542 m!808449))

(declare-fun m!808451 () Bool)

(assert (=> b!866542 m!808451))

(declare-fun m!808453 () Bool)

(assert (=> b!866542 m!808453))

(assert (=> b!866542 m!808451))

(declare-fun m!808455 () Bool)

(assert (=> b!866542 m!808455))

(declare-fun m!808457 () Bool)

(assert (=> b!866542 m!808457))

(declare-fun m!808459 () Bool)

(assert (=> b!866539 m!808459))

(declare-fun m!808461 () Bool)

(assert (=> b!866537 m!808461))

(assert (=> b!866537 m!808461))

(declare-fun m!808463 () Bool)

(assert (=> b!866537 m!808463))

(assert (=> b!866537 m!808451))

(assert (=> b!866537 m!808451))

(declare-fun m!808465 () Bool)

(assert (=> b!866537 m!808465))

(declare-fun m!808467 () Bool)

(assert (=> b!866528 m!808467))

(declare-fun m!808469 () Bool)

(assert (=> b!866541 m!808469))

(declare-fun m!808471 () Bool)

(assert (=> b!866541 m!808471))

(declare-fun m!808473 () Bool)

(assert (=> b!866541 m!808473))

(declare-fun m!808475 () Bool)

(assert (=> b!866541 m!808475))

(assert (=> b!866541 m!808471))

(assert (=> b!866541 m!808451))

(assert (=> b!866541 m!808473))

(declare-fun m!808477 () Bool)

(assert (=> b!866533 m!808477))

(declare-fun m!808479 () Bool)

(assert (=> mapNonEmpty!26846 m!808479))

(declare-fun m!808481 () Bool)

(assert (=> start!73948 m!808481))

(declare-fun m!808483 () Bool)

(assert (=> start!73948 m!808483))

(declare-fun m!808485 () Bool)

(assert (=> b!866535 m!808485))

(declare-fun m!808487 () Bool)

(assert (=> b!866535 m!808487))

(declare-fun m!808489 () Bool)

(assert (=> b!866535 m!808489))

(declare-fun m!808491 () Bool)

(assert (=> b!866529 m!808491))

(declare-fun m!808493 () Bool)

(assert (=> b!866529 m!808493))

(declare-fun m!808495 () Bool)

(assert (=> b!866529 m!808495))

(declare-fun m!808497 () Bool)

(assert (=> b!866529 m!808497))

(declare-fun m!808499 () Bool)

(assert (=> b!866529 m!808499))

(declare-fun m!808501 () Bool)

(assert (=> b!866534 m!808501))

(check-sat (not b!866542) (not mapNonEmpty!26846) (not b!866541) (not b!866529) (not b_lambda!12061) b_and!24381 (not start!73948) (not b!866528) (not b!866535) (not b!866534) (not b!866537) tp_is_empty!16831 (not b!866539) (not b!866533) (not b_next!14695))
(check-sat b_and!24381 (not b_next!14695))
