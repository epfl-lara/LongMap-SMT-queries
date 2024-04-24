; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73774 () Bool)

(assert start!73774)

(declare-fun b_free!14521 () Bool)

(declare-fun b_next!14521 () Bool)

(assert (=> start!73774 (= b_free!14521 (not b_next!14521))))

(declare-fun tp!51067 () Bool)

(declare-fun b_and!24031 () Bool)

(assert (=> start!73774 (= tp!51067 b_and!24031)))

(declare-fun b!862230 () Bool)

(declare-fun res!585700 () Bool)

(declare-fun e!480495 () Bool)

(assert (=> b!862230 (=> (not res!585700) (not e!480495))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49537 0))(
  ( (array!49538 (arr!23795 (Array (_ BitVec 32) (_ BitVec 64))) (size!24236 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49537)

(declare-datatypes ((V!27257 0))(
  ( (V!27258 (val!8376 Int)) )
))
(declare-datatypes ((ValueCell!7889 0))(
  ( (ValueCellFull!7889 (v!10801 V!27257)) (EmptyCell!7889) )
))
(declare-datatypes ((array!49539 0))(
  ( (array!49540 (arr!23796 (Array (_ BitVec 32) ValueCell!7889)) (size!24237 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49539)

(assert (=> b!862230 (= res!585700 (and (= (size!24237 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24236 _keys!868) (size!24237 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862231 () Bool)

(declare-fun e!480498 () Bool)

(declare-fun e!480499 () Bool)

(declare-fun mapRes!26585 () Bool)

(assert (=> b!862231 (= e!480498 (and e!480499 mapRes!26585))))

(declare-fun condMapEmpty!26585 () Bool)

(declare-fun mapDefault!26585 () ValueCell!7889)

(assert (=> b!862231 (= condMapEmpty!26585 (= (arr!23796 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7889)) mapDefault!26585)))))

(declare-fun mapIsEmpty!26585 () Bool)

(assert (=> mapIsEmpty!26585 mapRes!26585))

(declare-fun b!862232 () Bool)

(declare-fun res!585699 () Bool)

(assert (=> b!862232 (=> (not res!585699) (not e!480495))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862232 (= res!585699 (validKeyInArray!0 k0!854))))

(declare-fun b!862233 () Bool)

(declare-fun res!585698 () Bool)

(assert (=> b!862233 (=> (not res!585698) (not e!480495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49537 (_ BitVec 32)) Bool)

(assert (=> b!862233 (= res!585698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862234 () Bool)

(declare-fun res!585695 () Bool)

(assert (=> b!862234 (=> (not res!585695) (not e!480495))))

(declare-datatypes ((List!16837 0))(
  ( (Nil!16834) (Cons!16833 (h!17970 (_ BitVec 64)) (t!23616 List!16837)) )
))
(declare-fun arrayNoDuplicates!0 (array!49537 (_ BitVec 32) List!16837) Bool)

(assert (=> b!862234 (= res!585695 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16834))))

(declare-fun b!862235 () Bool)

(declare-datatypes ((Unit!29377 0))(
  ( (Unit!29378) )
))
(declare-fun e!480493 () Unit!29377)

(declare-fun Unit!29379 () Unit!29377)

(assert (=> b!862235 (= e!480493 Unit!29379)))

(declare-fun lt!388774 () Unit!29377)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49537 (_ BitVec 32) (_ BitVec 32)) Unit!29377)

(assert (=> b!862235 (= lt!388774 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862235 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16834)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!388782 () Unit!29377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49537 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29377)

(assert (=> b!862235 (= lt!388782 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862235 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388779 () Unit!29377)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49537 (_ BitVec 64) (_ BitVec 32) List!16837) Unit!29377)

(assert (=> b!862235 (= lt!388779 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16834))))

(assert (=> b!862235 false))

(declare-fun b!862236 () Bool)

(declare-fun e!480492 () Bool)

(declare-fun e!480497 () Bool)

(assert (=> b!862236 (= e!480492 (not e!480497))))

(declare-fun res!585697 () Bool)

(assert (=> b!862236 (=> res!585697 e!480497)))

(assert (=> b!862236 (= res!585697 (not (validKeyInArray!0 (select (arr!23795 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!10998 0))(
  ( (tuple2!10999 (_1!5510 (_ BitVec 64)) (_2!5510 V!27257)) )
))
(declare-datatypes ((List!16838 0))(
  ( (Nil!16835) (Cons!16834 (h!17971 tuple2!10998) (t!23617 List!16838)) )
))
(declare-datatypes ((ListLongMap!9769 0))(
  ( (ListLongMap!9770 (toList!4900 List!16838)) )
))
(declare-fun lt!388784 () ListLongMap!9769)

(declare-fun lt!388781 () ListLongMap!9769)

(assert (=> b!862236 (= lt!388784 lt!388781)))

(declare-fun v!557 () V!27257)

(declare-fun lt!388776 () ListLongMap!9769)

(declare-fun +!2304 (ListLongMap!9769 tuple2!10998) ListLongMap!9769)

(assert (=> b!862236 (= lt!388781 (+!2304 lt!388776 (tuple2!10999 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27257)

(declare-fun zeroValue!654 () V!27257)

(declare-fun lt!388778 () array!49539)

(declare-fun getCurrentListMapNoExtraKeys!2952 (array!49537 array!49539 (_ BitVec 32) (_ BitVec 32) V!27257 V!27257 (_ BitVec 32) Int) ListLongMap!9769)

(assert (=> b!862236 (= lt!388784 (getCurrentListMapNoExtraKeys!2952 _keys!868 lt!388778 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862236 (= lt!388776 (getCurrentListMapNoExtraKeys!2952 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388783 () Unit!29377)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!493 (array!49537 array!49539 (_ BitVec 32) (_ BitVec 32) V!27257 V!27257 (_ BitVec 32) (_ BitVec 64) V!27257 (_ BitVec 32) Int) Unit!29377)

(assert (=> b!862236 (= lt!388783 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!493 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862237 () Bool)

(declare-fun e!480494 () Bool)

(declare-fun tp_is_empty!16657 () Bool)

(assert (=> b!862237 (= e!480494 tp_is_empty!16657)))

(declare-fun b!862238 () Bool)

(assert (=> b!862238 (= e!480497 true)))

(assert (=> b!862238 (not (= (select (arr!23795 _keys!868) from!1053) k0!854))))

(declare-fun lt!388780 () Unit!29377)

(assert (=> b!862238 (= lt!388780 e!480493)))

(declare-fun c!92284 () Bool)

(assert (=> b!862238 (= c!92284 (= (select (arr!23795 _keys!868) from!1053) k0!854))))

(declare-fun lt!388775 () ListLongMap!9769)

(declare-fun get!12556 (ValueCell!7889 V!27257) V!27257)

(declare-fun dynLambda!1132 (Int (_ BitVec 64)) V!27257)

(assert (=> b!862238 (= lt!388775 (+!2304 lt!388781 (tuple2!10999 (select (arr!23795 _keys!868) from!1053) (get!12556 (select (arr!23796 _values!688) from!1053) (dynLambda!1132 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!862239 () Bool)

(declare-fun res!585692 () Bool)

(assert (=> b!862239 (=> (not res!585692) (not e!480495))))

(assert (=> b!862239 (= res!585692 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24236 _keys!868))))))

(declare-fun b!862240 () Bool)

(declare-fun Unit!29380 () Unit!29377)

(assert (=> b!862240 (= e!480493 Unit!29380)))

(declare-fun b!862241 () Bool)

(assert (=> b!862241 (= e!480499 tp_is_empty!16657)))

(declare-fun b!862242 () Bool)

(declare-fun res!585693 () Bool)

(assert (=> b!862242 (=> (not res!585693) (not e!480495))))

(assert (=> b!862242 (= res!585693 (and (= (select (arr!23795 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862243 () Bool)

(declare-fun res!585696 () Bool)

(assert (=> b!862243 (=> (not res!585696) (not e!480495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862243 (= res!585696 (validMask!0 mask!1196))))

(declare-fun res!585691 () Bool)

(assert (=> start!73774 (=> (not res!585691) (not e!480495))))

(assert (=> start!73774 (= res!585691 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24236 _keys!868))))))

(assert (=> start!73774 e!480495))

(assert (=> start!73774 tp_is_empty!16657))

(assert (=> start!73774 true))

(assert (=> start!73774 tp!51067))

(declare-fun array_inv!18878 (array!49537) Bool)

(assert (=> start!73774 (array_inv!18878 _keys!868)))

(declare-fun array_inv!18879 (array!49539) Bool)

(assert (=> start!73774 (and (array_inv!18879 _values!688) e!480498)))

(declare-fun mapNonEmpty!26585 () Bool)

(declare-fun tp!51068 () Bool)

(assert (=> mapNonEmpty!26585 (= mapRes!26585 (and tp!51068 e!480494))))

(declare-fun mapKey!26585 () (_ BitVec 32))

(declare-fun mapValue!26585 () ValueCell!7889)

(declare-fun mapRest!26585 () (Array (_ BitVec 32) ValueCell!7889))

(assert (=> mapNonEmpty!26585 (= (arr!23796 _values!688) (store mapRest!26585 mapKey!26585 mapValue!26585))))

(declare-fun b!862244 () Bool)

(assert (=> b!862244 (= e!480495 e!480492)))

(declare-fun res!585694 () Bool)

(assert (=> b!862244 (=> (not res!585694) (not e!480492))))

(assert (=> b!862244 (= res!585694 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!862244 (= lt!388775 (getCurrentListMapNoExtraKeys!2952 _keys!868 lt!388778 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862244 (= lt!388778 (array!49540 (store (arr!23796 _values!688) i!612 (ValueCellFull!7889 v!557)) (size!24237 _values!688)))))

(declare-fun lt!388777 () ListLongMap!9769)

(assert (=> b!862244 (= lt!388777 (getCurrentListMapNoExtraKeys!2952 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73774 res!585691) b!862243))

(assert (= (and b!862243 res!585696) b!862230))

(assert (= (and b!862230 res!585700) b!862233))

(assert (= (and b!862233 res!585698) b!862234))

(assert (= (and b!862234 res!585695) b!862239))

(assert (= (and b!862239 res!585692) b!862232))

(assert (= (and b!862232 res!585699) b!862242))

(assert (= (and b!862242 res!585693) b!862244))

(assert (= (and b!862244 res!585694) b!862236))

(assert (= (and b!862236 (not res!585697)) b!862238))

(assert (= (and b!862238 c!92284) b!862235))

(assert (= (and b!862238 (not c!92284)) b!862240))

(assert (= (and b!862231 condMapEmpty!26585) mapIsEmpty!26585))

(assert (= (and b!862231 (not condMapEmpty!26585)) mapNonEmpty!26585))

(get-info :version)

(assert (= (and mapNonEmpty!26585 ((_ is ValueCellFull!7889) mapValue!26585)) b!862237))

(assert (= (and b!862231 ((_ is ValueCellFull!7889) mapDefault!26585)) b!862241))

(assert (= start!73774 b!862231))

(declare-fun b_lambda!11887 () Bool)

(assert (=> (not b_lambda!11887) (not b!862238)))

(declare-fun t!23615 () Bool)

(declare-fun tb!4635 () Bool)

(assert (=> (and start!73774 (= defaultEntry!696 defaultEntry!696) t!23615) tb!4635))

(declare-fun result!8889 () Bool)

(assert (=> tb!4635 (= result!8889 tp_is_empty!16657)))

(assert (=> b!862238 t!23615))

(declare-fun b_and!24033 () Bool)

(assert (= b_and!24031 (and (=> t!23615 result!8889) b_and!24033)))

(declare-fun m!803507 () Bool)

(assert (=> b!862243 m!803507))

(declare-fun m!803509 () Bool)

(assert (=> b!862234 m!803509))

(declare-fun m!803511 () Bool)

(assert (=> b!862232 m!803511))

(declare-fun m!803513 () Bool)

(assert (=> b!862242 m!803513))

(declare-fun m!803515 () Bool)

(assert (=> mapNonEmpty!26585 m!803515))

(declare-fun m!803517 () Bool)

(assert (=> start!73774 m!803517))

(declare-fun m!803519 () Bool)

(assert (=> start!73774 m!803519))

(declare-fun m!803521 () Bool)

(assert (=> b!862244 m!803521))

(declare-fun m!803523 () Bool)

(assert (=> b!862244 m!803523))

(declare-fun m!803525 () Bool)

(assert (=> b!862244 m!803525))

(declare-fun m!803527 () Bool)

(assert (=> b!862233 m!803527))

(declare-fun m!803529 () Bool)

(assert (=> b!862238 m!803529))

(declare-fun m!803531 () Bool)

(assert (=> b!862238 m!803531))

(declare-fun m!803533 () Bool)

(assert (=> b!862238 m!803533))

(declare-fun m!803535 () Bool)

(assert (=> b!862238 m!803535))

(assert (=> b!862238 m!803531))

(declare-fun m!803537 () Bool)

(assert (=> b!862238 m!803537))

(assert (=> b!862238 m!803533))

(declare-fun m!803539 () Bool)

(assert (=> b!862236 m!803539))

(declare-fun m!803541 () Bool)

(assert (=> b!862236 m!803541))

(assert (=> b!862236 m!803537))

(declare-fun m!803543 () Bool)

(assert (=> b!862236 m!803543))

(assert (=> b!862236 m!803537))

(declare-fun m!803545 () Bool)

(assert (=> b!862236 m!803545))

(declare-fun m!803547 () Bool)

(assert (=> b!862236 m!803547))

(declare-fun m!803549 () Bool)

(assert (=> b!862235 m!803549))

(declare-fun m!803551 () Bool)

(assert (=> b!862235 m!803551))

(declare-fun m!803553 () Bool)

(assert (=> b!862235 m!803553))

(declare-fun m!803555 () Bool)

(assert (=> b!862235 m!803555))

(declare-fun m!803557 () Bool)

(assert (=> b!862235 m!803557))

(check-sat (not b!862244) (not b!862232) (not mapNonEmpty!26585) tp_is_empty!16657 (not b!862236) (not b_next!14521) (not b!862235) (not b!862243) (not start!73774) b_and!24033 (not b!862234) (not b!862238) (not b!862233) (not b_lambda!11887))
(check-sat b_and!24033 (not b_next!14521))
