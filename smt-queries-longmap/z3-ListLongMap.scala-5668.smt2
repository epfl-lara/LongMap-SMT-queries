; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73794 () Bool)

(assert start!73794)

(declare-fun b_free!14709 () Bool)

(declare-fun b_next!14709 () Bool)

(assert (=> start!73794 (= b_free!14709 (not b_next!14709))))

(declare-fun tp!51631 () Bool)

(declare-fun b_and!24397 () Bool)

(assert (=> start!73794 (= tp!51631 b_and!24397)))

(declare-fun b!865975 () Bool)

(declare-datatypes ((Unit!29674 0))(
  ( (Unit!29675) )
))
(declare-fun e!482399 () Unit!29674)

(declare-fun Unit!29676 () Unit!29674)

(assert (=> b!865975 (= e!482399 Unit!29676)))

(declare-fun lt!392665 () Unit!29674)

(declare-datatypes ((array!49850 0))(
  ( (array!49851 (arr!23956 (Array (_ BitVec 32) (_ BitVec 64))) (size!24396 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49850)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49850 (_ BitVec 32) (_ BitVec 32)) Unit!29674)

(assert (=> b!865975 (= lt!392665 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17031 0))(
  ( (Nil!17028) (Cons!17027 (h!18158 (_ BitVec 64)) (t!24006 List!17031)) )
))
(declare-fun arrayNoDuplicates!0 (array!49850 (_ BitVec 32) List!17031) Bool)

(assert (=> b!865975 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17028)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!392677 () Unit!29674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49850 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29674)

(assert (=> b!865975 (= lt!392677 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865975 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392675 () Unit!29674)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49850 (_ BitVec 64) (_ BitVec 32) List!17031) Unit!29674)

(assert (=> b!865975 (= lt!392675 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17028))))

(assert (=> b!865975 false))

(declare-fun b!865976 () Bool)

(declare-fun e!482402 () Bool)

(declare-fun e!482401 () Bool)

(declare-fun mapRes!26867 () Bool)

(assert (=> b!865976 (= e!482402 (and e!482401 mapRes!26867))))

(declare-fun condMapEmpty!26867 () Bool)

(declare-datatypes ((V!27507 0))(
  ( (V!27508 (val!8470 Int)) )
))
(declare-datatypes ((ValueCell!7983 0))(
  ( (ValueCellFull!7983 (v!10895 V!27507)) (EmptyCell!7983) )
))
(declare-datatypes ((array!49852 0))(
  ( (array!49853 (arr!23957 (Array (_ BitVec 32) ValueCell!7983)) (size!24397 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49852)

(declare-fun mapDefault!26867 () ValueCell!7983)

(assert (=> b!865976 (= condMapEmpty!26867 (= (arr!23957 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7983)) mapDefault!26867)))))

(declare-fun b!865977 () Bool)

(declare-fun e!482397 () Bool)

(assert (=> b!865977 (= e!482397 true)))

(declare-datatypes ((tuple2!11230 0))(
  ( (tuple2!11231 (_1!5626 (_ BitVec 64)) (_2!5626 V!27507)) )
))
(declare-fun lt!392672 () tuple2!11230)

(declare-datatypes ((List!17032 0))(
  ( (Nil!17029) (Cons!17028 (h!18159 tuple2!11230) (t!24007 List!17032)) )
))
(declare-datatypes ((ListLongMap!9999 0))(
  ( (ListLongMap!10000 (toList!5015 List!17032)) )
))
(declare-fun lt!392678 () ListLongMap!9999)

(declare-fun lt!392674 () ListLongMap!9999)

(declare-fun lt!392676 () tuple2!11230)

(declare-fun +!2363 (ListLongMap!9999 tuple2!11230) ListLongMap!9999)

(assert (=> b!865977 (= lt!392678 (+!2363 (+!2363 lt!392674 lt!392672) lt!392676))))

(declare-fun lt!392670 () V!27507)

(declare-fun v!557 () V!27507)

(declare-fun lt!392679 () Unit!29674)

(declare-fun addCommutativeForDiffKeys!531 (ListLongMap!9999 (_ BitVec 64) V!27507 (_ BitVec 64) V!27507) Unit!29674)

(assert (=> b!865977 (= lt!392679 (addCommutativeForDiffKeys!531 lt!392674 k0!854 v!557 (select (arr!23956 _keys!868) from!1053) lt!392670))))

(declare-fun b!865978 () Bool)

(declare-fun e!482404 () Bool)

(assert (=> b!865978 (= e!482404 e!482397)))

(declare-fun res!588407 () Bool)

(assert (=> b!865978 (=> res!588407 e!482397)))

(assert (=> b!865978 (= res!588407 (= k0!854 (select (arr!23956 _keys!868) from!1053)))))

(assert (=> b!865978 (not (= (select (arr!23956 _keys!868) from!1053) k0!854))))

(declare-fun lt!392673 () Unit!29674)

(assert (=> b!865978 (= lt!392673 e!482399)))

(declare-fun c!92284 () Bool)

(assert (=> b!865978 (= c!92284 (= (select (arr!23956 _keys!868) from!1053) k0!854))))

(declare-fun lt!392671 () ListLongMap!9999)

(assert (=> b!865978 (= lt!392671 lt!392678)))

(declare-fun lt!392666 () ListLongMap!9999)

(assert (=> b!865978 (= lt!392678 (+!2363 lt!392666 lt!392672))))

(assert (=> b!865978 (= lt!392672 (tuple2!11231 (select (arr!23956 _keys!868) from!1053) lt!392670))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12664 (ValueCell!7983 V!27507) V!27507)

(declare-fun dynLambda!1184 (Int (_ BitVec 64)) V!27507)

(assert (=> b!865978 (= lt!392670 (get!12664 (select (arr!23957 _values!688) from!1053) (dynLambda!1184 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865979 () Bool)

(declare-fun res!588399 () Bool)

(declare-fun e!482400 () Bool)

(assert (=> b!865979 (=> (not res!588399) (not e!482400))))

(assert (=> b!865979 (= res!588399 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17028))))

(declare-fun b!865980 () Bool)

(declare-fun res!588403 () Bool)

(assert (=> b!865980 (=> (not res!588403) (not e!482400))))

(assert (=> b!865980 (= res!588403 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24396 _keys!868))))))

(declare-fun b!865981 () Bool)

(declare-fun res!588402 () Bool)

(assert (=> b!865981 (=> (not res!588402) (not e!482400))))

(assert (=> b!865981 (= res!588402 (and (= (select (arr!23956 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865982 () Bool)

(declare-fun e!482403 () Bool)

(assert (=> b!865982 (= e!482403 (not e!482404))))

(declare-fun res!588406 () Bool)

(assert (=> b!865982 (=> res!588406 e!482404)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865982 (= res!588406 (not (validKeyInArray!0 (select (arr!23956 _keys!868) from!1053))))))

(declare-fun lt!392668 () ListLongMap!9999)

(assert (=> b!865982 (= lt!392668 lt!392666)))

(assert (=> b!865982 (= lt!392666 (+!2363 lt!392674 lt!392676))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!392667 () array!49852)

(declare-fun minValue!654 () V!27507)

(declare-fun zeroValue!654 () V!27507)

(declare-fun getCurrentListMapNoExtraKeys!2986 (array!49850 array!49852 (_ BitVec 32) (_ BitVec 32) V!27507 V!27507 (_ BitVec 32) Int) ListLongMap!9999)

(assert (=> b!865982 (= lt!392668 (getCurrentListMapNoExtraKeys!2986 _keys!868 lt!392667 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865982 (= lt!392676 (tuple2!11231 k0!854 v!557))))

(assert (=> b!865982 (= lt!392674 (getCurrentListMapNoExtraKeys!2986 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392669 () Unit!29674)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!562 (array!49850 array!49852 (_ BitVec 32) (_ BitVec 32) V!27507 V!27507 (_ BitVec 32) (_ BitVec 64) V!27507 (_ BitVec 32) Int) Unit!29674)

(assert (=> b!865982 (= lt!392669 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!562 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865983 () Bool)

(declare-fun res!588398 () Bool)

(assert (=> b!865983 (=> (not res!588398) (not e!482400))))

(assert (=> b!865983 (= res!588398 (and (= (size!24397 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24396 _keys!868) (size!24397 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865984 () Bool)

(declare-fun res!588400 () Bool)

(assert (=> b!865984 (=> (not res!588400) (not e!482400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49850 (_ BitVec 32)) Bool)

(assert (=> b!865984 (= res!588400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865985 () Bool)

(declare-fun e!482396 () Bool)

(declare-fun tp_is_empty!16845 () Bool)

(assert (=> b!865985 (= e!482396 tp_is_empty!16845)))

(declare-fun res!588404 () Bool)

(assert (=> start!73794 (=> (not res!588404) (not e!482400))))

(assert (=> start!73794 (= res!588404 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24396 _keys!868))))))

(assert (=> start!73794 e!482400))

(assert (=> start!73794 tp_is_empty!16845))

(assert (=> start!73794 true))

(assert (=> start!73794 tp!51631))

(declare-fun array_inv!18936 (array!49850) Bool)

(assert (=> start!73794 (array_inv!18936 _keys!868)))

(declare-fun array_inv!18937 (array!49852) Bool)

(assert (=> start!73794 (and (array_inv!18937 _values!688) e!482402)))

(declare-fun mapNonEmpty!26867 () Bool)

(declare-fun tp!51630 () Bool)

(assert (=> mapNonEmpty!26867 (= mapRes!26867 (and tp!51630 e!482396))))

(declare-fun mapValue!26867 () ValueCell!7983)

(declare-fun mapKey!26867 () (_ BitVec 32))

(declare-fun mapRest!26867 () (Array (_ BitVec 32) ValueCell!7983))

(assert (=> mapNonEmpty!26867 (= (arr!23957 _values!688) (store mapRest!26867 mapKey!26867 mapValue!26867))))

(declare-fun b!865986 () Bool)

(declare-fun res!588401 () Bool)

(assert (=> b!865986 (=> (not res!588401) (not e!482400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865986 (= res!588401 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26867 () Bool)

(assert (=> mapIsEmpty!26867 mapRes!26867))

(declare-fun b!865987 () Bool)

(declare-fun Unit!29677 () Unit!29674)

(assert (=> b!865987 (= e!482399 Unit!29677)))

(declare-fun b!865988 () Bool)

(assert (=> b!865988 (= e!482401 tp_is_empty!16845)))

(declare-fun b!865989 () Bool)

(assert (=> b!865989 (= e!482400 e!482403)))

(declare-fun res!588405 () Bool)

(assert (=> b!865989 (=> (not res!588405) (not e!482403))))

(assert (=> b!865989 (= res!588405 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!865989 (= lt!392671 (getCurrentListMapNoExtraKeys!2986 _keys!868 lt!392667 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865989 (= lt!392667 (array!49853 (store (arr!23957 _values!688) i!612 (ValueCellFull!7983 v!557)) (size!24397 _values!688)))))

(declare-fun lt!392680 () ListLongMap!9999)

(assert (=> b!865989 (= lt!392680 (getCurrentListMapNoExtraKeys!2986 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865990 () Bool)

(declare-fun res!588397 () Bool)

(assert (=> b!865990 (=> (not res!588397) (not e!482400))))

(assert (=> b!865990 (= res!588397 (validKeyInArray!0 k0!854))))

(assert (= (and start!73794 res!588404) b!865986))

(assert (= (and b!865986 res!588401) b!865983))

(assert (= (and b!865983 res!588398) b!865984))

(assert (= (and b!865984 res!588400) b!865979))

(assert (= (and b!865979 res!588399) b!865980))

(assert (= (and b!865980 res!588403) b!865990))

(assert (= (and b!865990 res!588397) b!865981))

(assert (= (and b!865981 res!588402) b!865989))

(assert (= (and b!865989 res!588405) b!865982))

(assert (= (and b!865982 (not res!588406)) b!865978))

(assert (= (and b!865978 c!92284) b!865975))

(assert (= (and b!865978 (not c!92284)) b!865987))

(assert (= (and b!865978 (not res!588407)) b!865977))

(assert (= (and b!865976 condMapEmpty!26867) mapIsEmpty!26867))

(assert (= (and b!865976 (not condMapEmpty!26867)) mapNonEmpty!26867))

(get-info :version)

(assert (= (and mapNonEmpty!26867 ((_ is ValueCellFull!7983) mapValue!26867)) b!865985))

(assert (= (and b!865976 ((_ is ValueCellFull!7983) mapDefault!26867)) b!865988))

(assert (= start!73794 b!865976))

(declare-fun b_lambda!12061 () Bool)

(assert (=> (not b_lambda!12061) (not b!865978)))

(declare-fun t!24005 () Bool)

(declare-fun tb!4831 () Bool)

(assert (=> (and start!73794 (= defaultEntry!696 defaultEntry!696) t!24005) tb!4831))

(declare-fun result!9273 () Bool)

(assert (=> tb!4831 (= result!9273 tp_is_empty!16845)))

(assert (=> b!865978 t!24005))

(declare-fun b_and!24399 () Bool)

(assert (= b_and!24397 (and (=> t!24005 result!9273) b_and!24399)))

(declare-fun m!807561 () Bool)

(assert (=> b!865981 m!807561))

(declare-fun m!807563 () Bool)

(assert (=> b!865989 m!807563))

(declare-fun m!807565 () Bool)

(assert (=> b!865989 m!807565))

(declare-fun m!807567 () Bool)

(assert (=> b!865989 m!807567))

(declare-fun m!807569 () Bool)

(assert (=> b!865979 m!807569))

(declare-fun m!807571 () Bool)

(assert (=> b!865982 m!807571))

(declare-fun m!807573 () Bool)

(assert (=> b!865982 m!807573))

(declare-fun m!807575 () Bool)

(assert (=> b!865982 m!807575))

(assert (=> b!865982 m!807573))

(declare-fun m!807577 () Bool)

(assert (=> b!865982 m!807577))

(declare-fun m!807579 () Bool)

(assert (=> b!865982 m!807579))

(declare-fun m!807581 () Bool)

(assert (=> b!865982 m!807581))

(declare-fun m!807583 () Bool)

(assert (=> b!865977 m!807583))

(assert (=> b!865977 m!807583))

(declare-fun m!807585 () Bool)

(assert (=> b!865977 m!807585))

(assert (=> b!865977 m!807573))

(assert (=> b!865977 m!807573))

(declare-fun m!807587 () Bool)

(assert (=> b!865977 m!807587))

(declare-fun m!807589 () Bool)

(assert (=> b!865975 m!807589))

(declare-fun m!807591 () Bool)

(assert (=> b!865975 m!807591))

(declare-fun m!807593 () Bool)

(assert (=> b!865975 m!807593))

(declare-fun m!807595 () Bool)

(assert (=> b!865975 m!807595))

(declare-fun m!807597 () Bool)

(assert (=> b!865975 m!807597))

(declare-fun m!807599 () Bool)

(assert (=> mapNonEmpty!26867 m!807599))

(declare-fun m!807601 () Bool)

(assert (=> b!865984 m!807601))

(declare-fun m!807603 () Bool)

(assert (=> start!73794 m!807603))

(declare-fun m!807605 () Bool)

(assert (=> start!73794 m!807605))

(declare-fun m!807607 () Bool)

(assert (=> b!865990 m!807607))

(declare-fun m!807609 () Bool)

(assert (=> b!865986 m!807609))

(declare-fun m!807611 () Bool)

(assert (=> b!865978 m!807611))

(declare-fun m!807613 () Bool)

(assert (=> b!865978 m!807613))

(declare-fun m!807615 () Bool)

(assert (=> b!865978 m!807615))

(assert (=> b!865978 m!807611))

(declare-fun m!807617 () Bool)

(assert (=> b!865978 m!807617))

(assert (=> b!865978 m!807573))

(assert (=> b!865978 m!807613))

(check-sat (not b_lambda!12061) (not b!865986) (not start!73794) (not b!865979) (not b!865982) (not b!865975) tp_is_empty!16845 (not b!865977) (not b!865989) (not b!865984) (not mapNonEmpty!26867) (not b_next!14709) (not b!865978) b_and!24399 (not b!865990))
(check-sat b_and!24399 (not b_next!14709))
