; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73824 () Bool)

(assert start!73824)

(declare-fun b_free!14739 () Bool)

(declare-fun b_next!14739 () Bool)

(assert (=> start!73824 (= b_free!14739 (not b_next!14739))))

(declare-fun tp!51721 () Bool)

(declare-fun b_and!24457 () Bool)

(assert (=> start!73824 (= tp!51721 b_and!24457)))

(declare-fun b!866725 () Bool)

(declare-fun e!482809 () Bool)

(assert (=> b!866725 (= e!482809 true)))

(declare-datatypes ((V!27547 0))(
  ( (V!27548 (val!8485 Int)) )
))
(declare-datatypes ((tuple2!11252 0))(
  ( (tuple2!11253 (_1!5637 (_ BitVec 64)) (_2!5637 V!27547)) )
))
(declare-fun lt!393388 () tuple2!11252)

(declare-datatypes ((List!17052 0))(
  ( (Nil!17049) (Cons!17048 (h!18179 tuple2!11252) (t!24057 List!17052)) )
))
(declare-datatypes ((ListLongMap!10021 0))(
  ( (ListLongMap!10022 (toList!5026 List!17052)) )
))
(declare-fun lt!393389 () ListLongMap!10021)

(declare-fun lt!393400 () tuple2!11252)

(declare-fun lt!393397 () ListLongMap!10021)

(declare-fun +!2372 (ListLongMap!10021 tuple2!11252) ListLongMap!10021)

(assert (=> b!866725 (= lt!393389 (+!2372 (+!2372 lt!393397 lt!393388) lt!393400))))

(declare-datatypes ((Unit!29711 0))(
  ( (Unit!29712) )
))
(declare-fun lt!393392 () Unit!29711)

(declare-fun v!557 () V!27547)

(declare-fun lt!393399 () V!27547)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49910 0))(
  ( (array!49911 (arr!23986 (Array (_ BitVec 32) (_ BitVec 64))) (size!24426 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49910)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!540 (ListLongMap!10021 (_ BitVec 64) V!27547 (_ BitVec 64) V!27547) Unit!29711)

(assert (=> b!866725 (= lt!393392 (addCommutativeForDiffKeys!540 lt!393397 k0!854 v!557 (select (arr!23986 _keys!868) from!1053) lt!393399))))

(declare-fun b!866726 () Bool)

(declare-fun res!588896 () Bool)

(declare-fun e!482804 () Bool)

(assert (=> b!866726 (=> (not res!588896) (not e!482804))))

(declare-datatypes ((List!17053 0))(
  ( (Nil!17050) (Cons!17049 (h!18180 (_ BitVec 64)) (t!24058 List!17053)) )
))
(declare-fun arrayNoDuplicates!0 (array!49910 (_ BitVec 32) List!17053) Bool)

(assert (=> b!866726 (= res!588896 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17050))))

(declare-fun b!866727 () Bool)

(declare-fun res!588892 () Bool)

(assert (=> b!866727 (=> (not res!588892) (not e!482804))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7998 0))(
  ( (ValueCellFull!7998 (v!10910 V!27547)) (EmptyCell!7998) )
))
(declare-datatypes ((array!49912 0))(
  ( (array!49913 (arr!23987 (Array (_ BitVec 32) ValueCell!7998)) (size!24427 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49912)

(assert (=> b!866727 (= res!588892 (and (= (size!24427 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24426 _keys!868) (size!24427 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866728 () Bool)

(declare-fun e!482808 () Unit!29711)

(declare-fun Unit!29713 () Unit!29711)

(assert (=> b!866728 (= e!482808 Unit!29713)))

(declare-fun lt!393387 () Unit!29711)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49910 (_ BitVec 32) (_ BitVec 32)) Unit!29711)

(assert (=> b!866728 (= lt!393387 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866728 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17050)))

(declare-fun lt!393396 () Unit!29711)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49910 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29711)

(assert (=> b!866728 (= lt!393396 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866728 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393385 () Unit!29711)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49910 (_ BitVec 64) (_ BitVec 32) List!17053) Unit!29711)

(assert (=> b!866728 (= lt!393385 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17050))))

(assert (=> b!866728 false))

(declare-fun b!866729 () Bool)

(declare-fun res!588897 () Bool)

(assert (=> b!866729 (=> (not res!588897) (not e!482804))))

(assert (=> b!866729 (= res!588897 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24426 _keys!868))))))

(declare-fun res!588900 () Bool)

(assert (=> start!73824 (=> (not res!588900) (not e!482804))))

(assert (=> start!73824 (= res!588900 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24426 _keys!868))))))

(assert (=> start!73824 e!482804))

(declare-fun tp_is_empty!16875 () Bool)

(assert (=> start!73824 tp_is_empty!16875))

(assert (=> start!73824 true))

(assert (=> start!73824 tp!51721))

(declare-fun array_inv!18956 (array!49910) Bool)

(assert (=> start!73824 (array_inv!18956 _keys!868)))

(declare-fun e!482801 () Bool)

(declare-fun array_inv!18957 (array!49912) Bool)

(assert (=> start!73824 (and (array_inv!18957 _values!688) e!482801)))

(declare-fun mapIsEmpty!26912 () Bool)

(declare-fun mapRes!26912 () Bool)

(assert (=> mapIsEmpty!26912 mapRes!26912))

(declare-fun b!866730 () Bool)

(declare-fun res!588895 () Bool)

(assert (=> b!866730 (=> (not res!588895) (not e!482804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866730 (= res!588895 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26912 () Bool)

(declare-fun tp!51720 () Bool)

(declare-fun e!482802 () Bool)

(assert (=> mapNonEmpty!26912 (= mapRes!26912 (and tp!51720 e!482802))))

(declare-fun mapValue!26912 () ValueCell!7998)

(declare-fun mapRest!26912 () (Array (_ BitVec 32) ValueCell!7998))

(declare-fun mapKey!26912 () (_ BitVec 32))

(assert (=> mapNonEmpty!26912 (= (arr!23987 _values!688) (store mapRest!26912 mapKey!26912 mapValue!26912))))

(declare-fun b!866731 () Bool)

(declare-fun res!588901 () Bool)

(assert (=> b!866731 (=> (not res!588901) (not e!482804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49910 (_ BitVec 32)) Bool)

(assert (=> b!866731 (= res!588901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866732 () Bool)

(declare-fun Unit!29714 () Unit!29711)

(assert (=> b!866732 (= e!482808 Unit!29714)))

(declare-fun b!866733 () Bool)

(declare-fun res!588893 () Bool)

(assert (=> b!866733 (=> (not res!588893) (not e!482804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866733 (= res!588893 (validMask!0 mask!1196))))

(declare-fun b!866734 () Bool)

(declare-fun e!482806 () Bool)

(assert (=> b!866734 (= e!482804 e!482806)))

(declare-fun res!588899 () Bool)

(assert (=> b!866734 (=> (not res!588899) (not e!482806))))

(assert (=> b!866734 (= res!588899 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!393393 () array!49912)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!393395 () ListLongMap!10021)

(declare-fun minValue!654 () V!27547)

(declare-fun zeroValue!654 () V!27547)

(declare-fun getCurrentListMapNoExtraKeys!2996 (array!49910 array!49912 (_ BitVec 32) (_ BitVec 32) V!27547 V!27547 (_ BitVec 32) Int) ListLongMap!10021)

(assert (=> b!866734 (= lt!393395 (getCurrentListMapNoExtraKeys!2996 _keys!868 lt!393393 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866734 (= lt!393393 (array!49913 (store (arr!23987 _values!688) i!612 (ValueCellFull!7998 v!557)) (size!24427 _values!688)))))

(declare-fun lt!393390 () ListLongMap!10021)

(assert (=> b!866734 (= lt!393390 (getCurrentListMapNoExtraKeys!2996 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866735 () Bool)

(declare-fun e!482803 () Bool)

(assert (=> b!866735 (= e!482803 tp_is_empty!16875)))

(declare-fun b!866736 () Bool)

(assert (=> b!866736 (= e!482801 (and e!482803 mapRes!26912))))

(declare-fun condMapEmpty!26912 () Bool)

(declare-fun mapDefault!26912 () ValueCell!7998)

(assert (=> b!866736 (= condMapEmpty!26912 (= (arr!23987 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7998)) mapDefault!26912)))))

(declare-fun b!866737 () Bool)

(declare-fun res!588898 () Bool)

(assert (=> b!866737 (=> (not res!588898) (not e!482804))))

(assert (=> b!866737 (= res!588898 (and (= (select (arr!23986 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866738 () Bool)

(declare-fun e!482807 () Bool)

(assert (=> b!866738 (= e!482807 e!482809)))

(declare-fun res!588902 () Bool)

(assert (=> b!866738 (=> res!588902 e!482809)))

(assert (=> b!866738 (= res!588902 (= k0!854 (select (arr!23986 _keys!868) from!1053)))))

(assert (=> b!866738 (not (= (select (arr!23986 _keys!868) from!1053) k0!854))))

(declare-fun lt!393386 () Unit!29711)

(assert (=> b!866738 (= lt!393386 e!482808)))

(declare-fun c!92329 () Bool)

(assert (=> b!866738 (= c!92329 (= (select (arr!23986 _keys!868) from!1053) k0!854))))

(assert (=> b!866738 (= lt!393395 lt!393389)))

(declare-fun lt!393391 () ListLongMap!10021)

(assert (=> b!866738 (= lt!393389 (+!2372 lt!393391 lt!393388))))

(assert (=> b!866738 (= lt!393388 (tuple2!11253 (select (arr!23986 _keys!868) from!1053) lt!393399))))

(declare-fun get!12682 (ValueCell!7998 V!27547) V!27547)

(declare-fun dynLambda!1192 (Int (_ BitVec 64)) V!27547)

(assert (=> b!866738 (= lt!393399 (get!12682 (select (arr!23987 _values!688) from!1053) (dynLambda!1192 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866739 () Bool)

(assert (=> b!866739 (= e!482806 (not e!482807))))

(declare-fun res!588894 () Bool)

(assert (=> b!866739 (=> res!588894 e!482807)))

(assert (=> b!866739 (= res!588894 (not (validKeyInArray!0 (select (arr!23986 _keys!868) from!1053))))))

(declare-fun lt!393394 () ListLongMap!10021)

(assert (=> b!866739 (= lt!393394 lt!393391)))

(assert (=> b!866739 (= lt!393391 (+!2372 lt!393397 lt!393400))))

(assert (=> b!866739 (= lt!393394 (getCurrentListMapNoExtraKeys!2996 _keys!868 lt!393393 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866739 (= lt!393400 (tuple2!11253 k0!854 v!557))))

(assert (=> b!866739 (= lt!393397 (getCurrentListMapNoExtraKeys!2996 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393398 () Unit!29711)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!570 (array!49910 array!49912 (_ BitVec 32) (_ BitVec 32) V!27547 V!27547 (_ BitVec 32) (_ BitVec 64) V!27547 (_ BitVec 32) Int) Unit!29711)

(assert (=> b!866739 (= lt!393398 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!570 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866740 () Bool)

(assert (=> b!866740 (= e!482802 tp_is_empty!16875)))

(assert (= (and start!73824 res!588900) b!866733))

(assert (= (and b!866733 res!588893) b!866727))

(assert (= (and b!866727 res!588892) b!866731))

(assert (= (and b!866731 res!588901) b!866726))

(assert (= (and b!866726 res!588896) b!866729))

(assert (= (and b!866729 res!588897) b!866730))

(assert (= (and b!866730 res!588895) b!866737))

(assert (= (and b!866737 res!588898) b!866734))

(assert (= (and b!866734 res!588899) b!866739))

(assert (= (and b!866739 (not res!588894)) b!866738))

(assert (= (and b!866738 c!92329) b!866728))

(assert (= (and b!866738 (not c!92329)) b!866732))

(assert (= (and b!866738 (not res!588902)) b!866725))

(assert (= (and b!866736 condMapEmpty!26912) mapIsEmpty!26912))

(assert (= (and b!866736 (not condMapEmpty!26912)) mapNonEmpty!26912))

(get-info :version)

(assert (= (and mapNonEmpty!26912 ((_ is ValueCellFull!7998) mapValue!26912)) b!866740))

(assert (= (and b!866736 ((_ is ValueCellFull!7998) mapDefault!26912)) b!866735))

(assert (= start!73824 b!866736))

(declare-fun b_lambda!12091 () Bool)

(assert (=> (not b_lambda!12091) (not b!866738)))

(declare-fun t!24056 () Bool)

(declare-fun tb!4861 () Bool)

(assert (=> (and start!73824 (= defaultEntry!696 defaultEntry!696) t!24056) tb!4861))

(declare-fun result!9333 () Bool)

(assert (=> tb!4861 (= result!9333 tp_is_empty!16875)))

(assert (=> b!866738 t!24056))

(declare-fun b_and!24459 () Bool)

(assert (= b_and!24457 (and (=> t!24056 result!9333) b_and!24459)))

(declare-fun m!808431 () Bool)

(assert (=> b!866734 m!808431))

(declare-fun m!808433 () Bool)

(assert (=> b!866734 m!808433))

(declare-fun m!808435 () Bool)

(assert (=> b!866734 m!808435))

(declare-fun m!808437 () Bool)

(assert (=> b!866733 m!808437))

(declare-fun m!808439 () Bool)

(assert (=> b!866731 m!808439))

(declare-fun m!808441 () Bool)

(assert (=> b!866726 m!808441))

(declare-fun m!808443 () Bool)

(assert (=> b!866728 m!808443))

(declare-fun m!808445 () Bool)

(assert (=> b!866728 m!808445))

(declare-fun m!808447 () Bool)

(assert (=> b!866728 m!808447))

(declare-fun m!808449 () Bool)

(assert (=> b!866728 m!808449))

(declare-fun m!808451 () Bool)

(assert (=> b!866728 m!808451))

(declare-fun m!808453 () Bool)

(assert (=> start!73824 m!808453))

(declare-fun m!808455 () Bool)

(assert (=> start!73824 m!808455))

(declare-fun m!808457 () Bool)

(assert (=> b!866730 m!808457))

(declare-fun m!808459 () Bool)

(assert (=> b!866737 m!808459))

(declare-fun m!808461 () Bool)

(assert (=> b!866725 m!808461))

(assert (=> b!866725 m!808461))

(declare-fun m!808463 () Bool)

(assert (=> b!866725 m!808463))

(declare-fun m!808465 () Bool)

(assert (=> b!866725 m!808465))

(assert (=> b!866725 m!808465))

(declare-fun m!808467 () Bool)

(assert (=> b!866725 m!808467))

(declare-fun m!808469 () Bool)

(assert (=> mapNonEmpty!26912 m!808469))

(declare-fun m!808471 () Bool)

(assert (=> b!866739 m!808471))

(declare-fun m!808473 () Bool)

(assert (=> b!866739 m!808473))

(assert (=> b!866739 m!808465))

(declare-fun m!808475 () Bool)

(assert (=> b!866739 m!808475))

(assert (=> b!866739 m!808465))

(declare-fun m!808477 () Bool)

(assert (=> b!866739 m!808477))

(declare-fun m!808479 () Bool)

(assert (=> b!866739 m!808479))

(declare-fun m!808481 () Bool)

(assert (=> b!866738 m!808481))

(declare-fun m!808483 () Bool)

(assert (=> b!866738 m!808483))

(declare-fun m!808485 () Bool)

(assert (=> b!866738 m!808485))

(assert (=> b!866738 m!808481))

(declare-fun m!808487 () Bool)

(assert (=> b!866738 m!808487))

(assert (=> b!866738 m!808465))

(assert (=> b!866738 m!808483))

(check-sat (not mapNonEmpty!26912) (not b!866738) (not b!866739) (not b!866728) (not b_next!14739) (not b!866733) (not start!73824) (not b!866725) (not b!866730) (not b_lambda!12091) (not b!866731) tp_is_empty!16875 (not b!866734) (not b!866726) b_and!24459)
(check-sat b_and!24459 (not b_next!14739))
