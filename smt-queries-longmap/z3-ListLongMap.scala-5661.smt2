; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73918 () Bool)

(assert start!73918)

(declare-fun b_free!14665 () Bool)

(declare-fun b_next!14665 () Bool)

(assert (=> start!73918 (= b_free!14665 (not b_next!14665))))

(declare-fun tp!51499 () Bool)

(declare-fun b_and!24319 () Bool)

(assert (=> start!73918 (= tp!51499 b_and!24319)))

(declare-fun b!865778 () Bool)

(declare-fun res!588019 () Bool)

(declare-fun e!482389 () Bool)

(assert (=> b!865778 (=> (not res!588019) (not e!482389))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865778 (= res!588019 (validMask!0 mask!1196))))

(declare-fun b!865779 () Bool)

(declare-fun res!588016 () Bool)

(assert (=> b!865779 (=> (not res!588016) (not e!482389))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49813 0))(
  ( (array!49814 (arr!23933 (Array (_ BitVec 32) (_ BitVec 64))) (size!24374 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49813)

(declare-datatypes ((V!27449 0))(
  ( (V!27450 (val!8448 Int)) )
))
(declare-datatypes ((ValueCell!7961 0))(
  ( (ValueCellFull!7961 (v!10873 V!27449)) (EmptyCell!7961) )
))
(declare-datatypes ((array!49815 0))(
  ( (array!49816 (arr!23934 (Array (_ BitVec 32) ValueCell!7961)) (size!24375 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49815)

(assert (=> b!865779 (= res!588016 (and (= (size!24375 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24374 _keys!868) (size!24375 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865780 () Bool)

(declare-fun res!588023 () Bool)

(assert (=> b!865780 (=> (not res!588023) (not e!482389))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!865780 (= res!588023 (and (= (select (arr!23933 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865781 () Bool)

(declare-fun e!482387 () Bool)

(declare-fun tp_is_empty!16801 () Bool)

(assert (=> b!865781 (= e!482387 tp_is_empty!16801)))

(declare-fun b!865782 () Bool)

(declare-fun res!588017 () Bool)

(assert (=> b!865782 (=> (not res!588017) (not e!482389))))

(assert (=> b!865782 (= res!588017 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24374 _keys!868))))))

(declare-fun b!865784 () Bool)

(declare-fun res!588022 () Bool)

(assert (=> b!865784 (=> (not res!588022) (not e!482389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865784 (= res!588022 (validKeyInArray!0 k0!854))))

(declare-fun b!865785 () Bool)

(declare-datatypes ((Unit!29587 0))(
  ( (Unit!29588) )
))
(declare-fun e!482385 () Unit!29587)

(declare-fun Unit!29589 () Unit!29587)

(assert (=> b!865785 (= e!482385 Unit!29589)))

(declare-fun b!865786 () Bool)

(declare-fun e!482390 () Bool)

(assert (=> b!865786 (= e!482390 true)))

(declare-datatypes ((tuple2!11112 0))(
  ( (tuple2!11113 (_1!5567 (_ BitVec 64)) (_2!5567 V!27449)) )
))
(declare-datatypes ((List!16942 0))(
  ( (Nil!16939) (Cons!16938 (h!18075 tuple2!11112) (t!23865 List!16942)) )
))
(declare-datatypes ((ListLongMap!9883 0))(
  ( (ListLongMap!9884 (toList!4957 List!16942)) )
))
(declare-fun lt!391971 () ListLongMap!9883)

(declare-fun lt!391981 () tuple2!11112)

(declare-fun lt!391970 () ListLongMap!9883)

(declare-fun lt!391979 () tuple2!11112)

(declare-fun +!2360 (ListLongMap!9883 tuple2!11112) ListLongMap!9883)

(assert (=> b!865786 (= lt!391971 (+!2360 (+!2360 lt!391970 lt!391979) lt!391981))))

(declare-fun lt!391972 () Unit!29587)

(declare-fun v!557 () V!27449)

(declare-fun lt!391975 () V!27449)

(declare-fun addCommutativeForDiffKeys!509 (ListLongMap!9883 (_ BitVec 64) V!27449 (_ BitVec 64) V!27449) Unit!29587)

(assert (=> b!865786 (= lt!391972 (addCommutativeForDiffKeys!509 lt!391970 k0!854 v!557 (select (arr!23933 _keys!868) from!1053) lt!391975))))

(declare-fun b!865787 () Bool)

(declare-fun e!482386 () Bool)

(assert (=> b!865787 (= e!482386 e!482390)))

(declare-fun res!588018 () Bool)

(assert (=> b!865787 (=> res!588018 e!482390)))

(assert (=> b!865787 (= res!588018 (= k0!854 (select (arr!23933 _keys!868) from!1053)))))

(assert (=> b!865787 (not (= (select (arr!23933 _keys!868) from!1053) k0!854))))

(declare-fun lt!391985 () Unit!29587)

(assert (=> b!865787 (= lt!391985 e!482385)))

(declare-fun c!92500 () Bool)

(assert (=> b!865787 (= c!92500 (= (select (arr!23933 _keys!868) from!1053) k0!854))))

(declare-fun lt!391983 () ListLongMap!9883)

(assert (=> b!865787 (= lt!391983 lt!391971)))

(declare-fun lt!391984 () ListLongMap!9883)

(assert (=> b!865787 (= lt!391971 (+!2360 lt!391984 lt!391979))))

(assert (=> b!865787 (= lt!391979 (tuple2!11113 (select (arr!23933 _keys!868) from!1053) lt!391975))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12655 (ValueCell!7961 V!27449) V!27449)

(declare-fun dynLambda!1183 (Int (_ BitVec 64)) V!27449)

(assert (=> b!865787 (= lt!391975 (get!12655 (select (arr!23934 _values!688) from!1053) (dynLambda!1183 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865788 () Bool)

(declare-fun res!588020 () Bool)

(assert (=> b!865788 (=> (not res!588020) (not e!482389))))

(declare-datatypes ((List!16943 0))(
  ( (Nil!16940) (Cons!16939 (h!18076 (_ BitVec 64)) (t!23866 List!16943)) )
))
(declare-fun arrayNoDuplicates!0 (array!49813 (_ BitVec 32) List!16943) Bool)

(assert (=> b!865788 (= res!588020 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16940))))

(declare-fun b!865789 () Bool)

(declare-fun res!588015 () Bool)

(assert (=> b!865789 (=> (not res!588015) (not e!482389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49813 (_ BitVec 32)) Bool)

(assert (=> b!865789 (= res!588015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865790 () Bool)

(declare-fun Unit!29590 () Unit!29587)

(assert (=> b!865790 (= e!482385 Unit!29590)))

(declare-fun lt!391982 () Unit!29587)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49813 (_ BitVec 32) (_ BitVec 32)) Unit!29587)

(assert (=> b!865790 (= lt!391982 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865790 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16940)))

(declare-fun lt!391974 () Unit!29587)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49813 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29587)

(assert (=> b!865790 (= lt!391974 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865790 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391980 () Unit!29587)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49813 (_ BitVec 64) (_ BitVec 32) List!16943) Unit!29587)

(assert (=> b!865790 (= lt!391980 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16940))))

(assert (=> b!865790 false))

(declare-fun mapIsEmpty!26801 () Bool)

(declare-fun mapRes!26801 () Bool)

(assert (=> mapIsEmpty!26801 mapRes!26801))

(declare-fun mapNonEmpty!26801 () Bool)

(declare-fun tp!51500 () Bool)

(declare-fun e!482392 () Bool)

(assert (=> mapNonEmpty!26801 (= mapRes!26801 (and tp!51500 e!482392))))

(declare-fun mapKey!26801 () (_ BitVec 32))

(declare-fun mapValue!26801 () ValueCell!7961)

(declare-fun mapRest!26801 () (Array (_ BitVec 32) ValueCell!7961))

(assert (=> mapNonEmpty!26801 (= (arr!23934 _values!688) (store mapRest!26801 mapKey!26801 mapValue!26801))))

(declare-fun b!865791 () Bool)

(assert (=> b!865791 (= e!482392 tp_is_empty!16801)))

(declare-fun res!588024 () Bool)

(assert (=> start!73918 (=> (not res!588024) (not e!482389))))

(assert (=> start!73918 (= res!588024 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24374 _keys!868))))))

(assert (=> start!73918 e!482389))

(assert (=> start!73918 tp_is_empty!16801))

(assert (=> start!73918 true))

(assert (=> start!73918 tp!51499))

(declare-fun array_inv!18976 (array!49813) Bool)

(assert (=> start!73918 (array_inv!18976 _keys!868)))

(declare-fun e!482388 () Bool)

(declare-fun array_inv!18977 (array!49815) Bool)

(assert (=> start!73918 (and (array_inv!18977 _values!688) e!482388)))

(declare-fun b!865783 () Bool)

(declare-fun e!482391 () Bool)

(assert (=> b!865783 (= e!482389 e!482391)))

(declare-fun res!588021 () Bool)

(assert (=> b!865783 (=> (not res!588021) (not e!482391))))

(assert (=> b!865783 (= res!588021 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun minValue!654 () V!27449)

(declare-fun zeroValue!654 () V!27449)

(declare-fun lt!391978 () array!49815)

(declare-fun getCurrentListMapNoExtraKeys!3007 (array!49813 array!49815 (_ BitVec 32) (_ BitVec 32) V!27449 V!27449 (_ BitVec 32) Int) ListLongMap!9883)

(assert (=> b!865783 (= lt!391983 (getCurrentListMapNoExtraKeys!3007 _keys!868 lt!391978 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865783 (= lt!391978 (array!49816 (store (arr!23934 _values!688) i!612 (ValueCellFull!7961 v!557)) (size!24375 _values!688)))))

(declare-fun lt!391976 () ListLongMap!9883)

(assert (=> b!865783 (= lt!391976 (getCurrentListMapNoExtraKeys!3007 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865792 () Bool)

(assert (=> b!865792 (= e!482391 (not e!482386))))

(declare-fun res!588025 () Bool)

(assert (=> b!865792 (=> res!588025 e!482386)))

(assert (=> b!865792 (= res!588025 (not (validKeyInArray!0 (select (arr!23933 _keys!868) from!1053))))))

(declare-fun lt!391973 () ListLongMap!9883)

(assert (=> b!865792 (= lt!391973 lt!391984)))

(assert (=> b!865792 (= lt!391984 (+!2360 lt!391970 lt!391981))))

(assert (=> b!865792 (= lt!391973 (getCurrentListMapNoExtraKeys!3007 _keys!868 lt!391978 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865792 (= lt!391981 (tuple2!11113 k0!854 v!557))))

(assert (=> b!865792 (= lt!391970 (getCurrentListMapNoExtraKeys!3007 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391977 () Unit!29587)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!542 (array!49813 array!49815 (_ BitVec 32) (_ BitVec 32) V!27449 V!27449 (_ BitVec 32) (_ BitVec 64) V!27449 (_ BitVec 32) Int) Unit!29587)

(assert (=> b!865792 (= lt!391977 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!542 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865793 () Bool)

(assert (=> b!865793 (= e!482388 (and e!482387 mapRes!26801))))

(declare-fun condMapEmpty!26801 () Bool)

(declare-fun mapDefault!26801 () ValueCell!7961)

(assert (=> b!865793 (= condMapEmpty!26801 (= (arr!23934 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7961)) mapDefault!26801)))))

(assert (= (and start!73918 res!588024) b!865778))

(assert (= (and b!865778 res!588019) b!865779))

(assert (= (and b!865779 res!588016) b!865789))

(assert (= (and b!865789 res!588015) b!865788))

(assert (= (and b!865788 res!588020) b!865782))

(assert (= (and b!865782 res!588017) b!865784))

(assert (= (and b!865784 res!588022) b!865780))

(assert (= (and b!865780 res!588023) b!865783))

(assert (= (and b!865783 res!588021) b!865792))

(assert (= (and b!865792 (not res!588025)) b!865787))

(assert (= (and b!865787 c!92500) b!865790))

(assert (= (and b!865787 (not c!92500)) b!865785))

(assert (= (and b!865787 (not res!588018)) b!865786))

(assert (= (and b!865793 condMapEmpty!26801) mapIsEmpty!26801))

(assert (= (and b!865793 (not condMapEmpty!26801)) mapNonEmpty!26801))

(get-info :version)

(assert (= (and mapNonEmpty!26801 ((_ is ValueCellFull!7961) mapValue!26801)) b!865791))

(assert (= (and b!865793 ((_ is ValueCellFull!7961) mapDefault!26801)) b!865781))

(assert (= start!73918 b!865793))

(declare-fun b_lambda!12031 () Bool)

(assert (=> (not b_lambda!12031) (not b!865787)))

(declare-fun t!23864 () Bool)

(declare-fun tb!4779 () Bool)

(assert (=> (and start!73918 (= defaultEntry!696 defaultEntry!696) t!23864) tb!4779))

(declare-fun result!9177 () Bool)

(assert (=> tb!4779 (= result!9177 tp_is_empty!16801)))

(assert (=> b!865787 t!23864))

(declare-fun b_and!24321 () Bool)

(assert (= b_and!24319 (and (=> t!23864 result!9177) b_and!24321)))

(declare-fun m!807575 () Bool)

(assert (=> b!865787 m!807575))

(declare-fun m!807577 () Bool)

(assert (=> b!865787 m!807577))

(declare-fun m!807579 () Bool)

(assert (=> b!865787 m!807579))

(declare-fun m!807581 () Bool)

(assert (=> b!865787 m!807581))

(assert (=> b!865787 m!807577))

(declare-fun m!807583 () Bool)

(assert (=> b!865787 m!807583))

(assert (=> b!865787 m!807579))

(declare-fun m!807585 () Bool)

(assert (=> b!865786 m!807585))

(assert (=> b!865786 m!807585))

(declare-fun m!807587 () Bool)

(assert (=> b!865786 m!807587))

(assert (=> b!865786 m!807583))

(assert (=> b!865786 m!807583))

(declare-fun m!807589 () Bool)

(assert (=> b!865786 m!807589))

(declare-fun m!807591 () Bool)

(assert (=> b!865788 m!807591))

(declare-fun m!807593 () Bool)

(assert (=> b!865780 m!807593))

(declare-fun m!807595 () Bool)

(assert (=> mapNonEmpty!26801 m!807595))

(declare-fun m!807597 () Bool)

(assert (=> b!865792 m!807597))

(declare-fun m!807599 () Bool)

(assert (=> b!865792 m!807599))

(declare-fun m!807601 () Bool)

(assert (=> b!865792 m!807601))

(assert (=> b!865792 m!807583))

(declare-fun m!807603 () Bool)

(assert (=> b!865792 m!807603))

(assert (=> b!865792 m!807583))

(declare-fun m!807605 () Bool)

(assert (=> b!865792 m!807605))

(declare-fun m!807607 () Bool)

(assert (=> b!865784 m!807607))

(declare-fun m!807609 () Bool)

(assert (=> b!865790 m!807609))

(declare-fun m!807611 () Bool)

(assert (=> b!865790 m!807611))

(declare-fun m!807613 () Bool)

(assert (=> b!865790 m!807613))

(declare-fun m!807615 () Bool)

(assert (=> b!865790 m!807615))

(declare-fun m!807617 () Bool)

(assert (=> b!865790 m!807617))

(declare-fun m!807619 () Bool)

(assert (=> start!73918 m!807619))

(declare-fun m!807621 () Bool)

(assert (=> start!73918 m!807621))

(declare-fun m!807623 () Bool)

(assert (=> b!865778 m!807623))

(declare-fun m!807625 () Bool)

(assert (=> b!865789 m!807625))

(declare-fun m!807627 () Bool)

(assert (=> b!865783 m!807627))

(declare-fun m!807629 () Bool)

(assert (=> b!865783 m!807629))

(declare-fun m!807631 () Bool)

(assert (=> b!865783 m!807631))

(check-sat (not b_lambda!12031) (not b!865790) (not b!865792) (not b!865783) b_and!24321 (not b!865786) (not b!865778) (not b!865784) (not b!865788) (not start!73918) (not b_next!14665) (not b!865787) (not mapNonEmpty!26801) (not b!865789) tp_is_empty!16801)
(check-sat b_and!24321 (not b_next!14665))
