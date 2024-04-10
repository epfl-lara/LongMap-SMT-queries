; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73674 () Bool)

(assert start!73674)

(declare-fun b_free!14589 () Bool)

(declare-fun b_next!14589 () Bool)

(assert (=> start!73674 (= b_free!14589 (not b_next!14589))))

(declare-fun tp!51271 () Bool)

(declare-fun b_and!24157 () Bool)

(assert (=> start!73674 (= tp!51271 b_and!24157)))

(declare-fun b!862975 () Bool)

(declare-fun res!586417 () Bool)

(declare-fun e!480781 () Bool)

(assert (=> b!862975 (=> (not res!586417) (not e!480781))))

(declare-datatypes ((array!49612 0))(
  ( (array!49613 (arr!23837 (Array (_ BitVec 32) (_ BitVec 64))) (size!24277 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49612)

(declare-datatypes ((List!16936 0))(
  ( (Nil!16933) (Cons!16932 (h!18063 (_ BitVec 64)) (t!23791 List!16936)) )
))
(declare-fun arrayNoDuplicates!0 (array!49612 (_ BitVec 32) List!16936) Bool)

(assert (=> b!862975 (= res!586417 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16933))))

(declare-fun res!586425 () Bool)

(assert (=> start!73674 (=> (not res!586425) (not e!480781))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73674 (= res!586425 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24277 _keys!868))))))

(assert (=> start!73674 e!480781))

(declare-fun tp_is_empty!16725 () Bool)

(assert (=> start!73674 tp_is_empty!16725))

(assert (=> start!73674 true))

(assert (=> start!73674 tp!51271))

(declare-fun array_inv!18858 (array!49612) Bool)

(assert (=> start!73674 (array_inv!18858 _keys!868)))

(declare-datatypes ((V!27347 0))(
  ( (V!27348 (val!8410 Int)) )
))
(declare-datatypes ((ValueCell!7923 0))(
  ( (ValueCellFull!7923 (v!10835 V!27347)) (EmptyCell!7923) )
))
(declare-datatypes ((array!49614 0))(
  ( (array!49615 (arr!23838 (Array (_ BitVec 32) ValueCell!7923)) (size!24278 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49614)

(declare-fun e!480780 () Bool)

(declare-fun array_inv!18859 (array!49614) Bool)

(assert (=> start!73674 (and (array_inv!18859 _values!688) e!480780)))

(declare-fun b!862976 () Bool)

(declare-fun res!586427 () Bool)

(assert (=> b!862976 (=> (not res!586427) (not e!480781))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862976 (= res!586427 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24277 _keys!868))))))

(declare-fun b!862977 () Bool)

(declare-fun e!480776 () Bool)

(assert (=> b!862977 (= e!480781 e!480776)))

(declare-fun res!586420 () Bool)

(assert (=> b!862977 (=> (not res!586420) (not e!480776))))

(assert (=> b!862977 (= res!586420 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389786 () array!49614)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27347)

(declare-fun zeroValue!654 () V!27347)

(declare-datatypes ((tuple2!11126 0))(
  ( (tuple2!11127 (_1!5574 (_ BitVec 64)) (_2!5574 V!27347)) )
))
(declare-datatypes ((List!16937 0))(
  ( (Nil!16934) (Cons!16933 (h!18064 tuple2!11126) (t!23792 List!16937)) )
))
(declare-datatypes ((ListLongMap!9895 0))(
  ( (ListLongMap!9896 (toList!4963 List!16937)) )
))
(declare-fun lt!389795 () ListLongMap!9895)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2939 (array!49612 array!49614 (_ BitVec 32) (_ BitVec 32) V!27347 V!27347 (_ BitVec 32) Int) ListLongMap!9895)

(assert (=> b!862977 (= lt!389795 (getCurrentListMapNoExtraKeys!2939 _keys!868 lt!389786 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27347)

(assert (=> b!862977 (= lt!389786 (array!49615 (store (arr!23838 _values!688) i!612 (ValueCellFull!7923 v!557)) (size!24278 _values!688)))))

(declare-fun lt!389785 () ListLongMap!9895)

(assert (=> b!862977 (= lt!389785 (getCurrentListMapNoExtraKeys!2939 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862978 () Bool)

(declare-fun e!480784 () Bool)

(assert (=> b!862978 (= e!480784 tp_is_empty!16725)))

(declare-fun b!862979 () Bool)

(declare-fun e!480779 () Bool)

(assert (=> b!862979 (= e!480779 tp_is_empty!16725)))

(declare-fun b!862980 () Bool)

(declare-fun e!480777 () Bool)

(declare-fun e!480782 () Bool)

(assert (=> b!862980 (= e!480777 e!480782)))

(declare-fun res!586422 () Bool)

(assert (=> b!862980 (=> res!586422 e!480782)))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!862980 (= res!586422 (= k0!854 (select (arr!23837 _keys!868) from!1053)))))

(assert (=> b!862980 (not (= (select (arr!23837 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29485 0))(
  ( (Unit!29486) )
))
(declare-fun lt!389792 () Unit!29485)

(declare-fun e!480783 () Unit!29485)

(assert (=> b!862980 (= lt!389792 e!480783)))

(declare-fun c!92104 () Bool)

(assert (=> b!862980 (= c!92104 (= (select (arr!23837 _keys!868) from!1053) k0!854))))

(declare-fun lt!389789 () ListLongMap!9895)

(assert (=> b!862980 (= lt!389795 lt!389789)))

(declare-fun lt!389794 () ListLongMap!9895)

(declare-fun lt!389797 () tuple2!11126)

(declare-fun +!2312 (ListLongMap!9895 tuple2!11126) ListLongMap!9895)

(assert (=> b!862980 (= lt!389789 (+!2312 lt!389794 lt!389797))))

(declare-fun lt!389798 () V!27347)

(assert (=> b!862980 (= lt!389797 (tuple2!11127 (select (arr!23837 _keys!868) from!1053) lt!389798))))

(declare-fun get!12583 (ValueCell!7923 V!27347) V!27347)

(declare-fun dynLambda!1143 (Int (_ BitVec 64)) V!27347)

(assert (=> b!862980 (= lt!389798 (get!12583 (select (arr!23838 _values!688) from!1053) (dynLambda!1143 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862981 () Bool)

(declare-fun res!586419 () Bool)

(assert (=> b!862981 (=> (not res!586419) (not e!480781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862981 (= res!586419 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26687 () Bool)

(declare-fun mapRes!26687 () Bool)

(declare-fun tp!51270 () Bool)

(assert (=> mapNonEmpty!26687 (= mapRes!26687 (and tp!51270 e!480779))))

(declare-fun mapValue!26687 () ValueCell!7923)

(declare-fun mapRest!26687 () (Array (_ BitVec 32) ValueCell!7923))

(declare-fun mapKey!26687 () (_ BitVec 32))

(assert (=> mapNonEmpty!26687 (= (arr!23838 _values!688) (store mapRest!26687 mapKey!26687 mapValue!26687))))

(declare-fun b!862982 () Bool)

(declare-fun res!586418 () Bool)

(assert (=> b!862982 (=> (not res!586418) (not e!480781))))

(assert (=> b!862982 (= res!586418 (and (= (select (arr!23837 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862983 () Bool)

(assert (=> b!862983 (= e!480782 true)))

(declare-fun lt!389788 () ListLongMap!9895)

(declare-fun lt!389791 () tuple2!11126)

(assert (=> b!862983 (= lt!389789 (+!2312 (+!2312 lt!389788 lt!389797) lt!389791))))

(declare-fun lt!389793 () Unit!29485)

(declare-fun addCommutativeForDiffKeys!487 (ListLongMap!9895 (_ BitVec 64) V!27347 (_ BitVec 64) V!27347) Unit!29485)

(assert (=> b!862983 (= lt!389793 (addCommutativeForDiffKeys!487 lt!389788 k0!854 v!557 (select (arr!23837 _keys!868) from!1053) lt!389798))))

(declare-fun b!862984 () Bool)

(declare-fun res!586426 () Bool)

(assert (=> b!862984 (=> (not res!586426) (not e!480781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49612 (_ BitVec 32)) Bool)

(assert (=> b!862984 (= res!586426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26687 () Bool)

(assert (=> mapIsEmpty!26687 mapRes!26687))

(declare-fun b!862985 () Bool)

(declare-fun res!586423 () Bool)

(assert (=> b!862985 (=> (not res!586423) (not e!480781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862985 (= res!586423 (validKeyInArray!0 k0!854))))

(declare-fun b!862986 () Bool)

(declare-fun Unit!29487 () Unit!29485)

(assert (=> b!862986 (= e!480783 Unit!29487)))

(declare-fun b!862987 () Bool)

(assert (=> b!862987 (= e!480776 (not e!480777))))

(declare-fun res!586424 () Bool)

(assert (=> b!862987 (=> res!586424 e!480777)))

(assert (=> b!862987 (= res!586424 (not (validKeyInArray!0 (select (arr!23837 _keys!868) from!1053))))))

(declare-fun lt!389800 () ListLongMap!9895)

(assert (=> b!862987 (= lt!389800 lt!389794)))

(assert (=> b!862987 (= lt!389794 (+!2312 lt!389788 lt!389791))))

(assert (=> b!862987 (= lt!389800 (getCurrentListMapNoExtraKeys!2939 _keys!868 lt!389786 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862987 (= lt!389791 (tuple2!11127 k0!854 v!557))))

(assert (=> b!862987 (= lt!389788 (getCurrentListMapNoExtraKeys!2939 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389799 () Unit!29485)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!521 (array!49612 array!49614 (_ BitVec 32) (_ BitVec 32) V!27347 V!27347 (_ BitVec 32) (_ BitVec 64) V!27347 (_ BitVec 32) Int) Unit!29485)

(assert (=> b!862987 (= lt!389799 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!521 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862988 () Bool)

(declare-fun res!586421 () Bool)

(assert (=> b!862988 (=> (not res!586421) (not e!480781))))

(assert (=> b!862988 (= res!586421 (and (= (size!24278 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24277 _keys!868) (size!24278 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862989 () Bool)

(assert (=> b!862989 (= e!480780 (and e!480784 mapRes!26687))))

(declare-fun condMapEmpty!26687 () Bool)

(declare-fun mapDefault!26687 () ValueCell!7923)

(assert (=> b!862989 (= condMapEmpty!26687 (= (arr!23838 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7923)) mapDefault!26687)))))

(declare-fun b!862990 () Bool)

(declare-fun Unit!29488 () Unit!29485)

(assert (=> b!862990 (= e!480783 Unit!29488)))

(declare-fun lt!389796 () Unit!29485)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49612 (_ BitVec 32) (_ BitVec 32)) Unit!29485)

(assert (=> b!862990 (= lt!389796 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862990 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16933)))

(declare-fun lt!389790 () Unit!29485)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49612 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29485)

(assert (=> b!862990 (= lt!389790 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862990 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389787 () Unit!29485)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49612 (_ BitVec 64) (_ BitVec 32) List!16936) Unit!29485)

(assert (=> b!862990 (= lt!389787 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16933))))

(assert (=> b!862990 false))

(assert (= (and start!73674 res!586425) b!862981))

(assert (= (and b!862981 res!586419) b!862988))

(assert (= (and b!862988 res!586421) b!862984))

(assert (= (and b!862984 res!586426) b!862975))

(assert (= (and b!862975 res!586417) b!862976))

(assert (= (and b!862976 res!586427) b!862985))

(assert (= (and b!862985 res!586423) b!862982))

(assert (= (and b!862982 res!586418) b!862977))

(assert (= (and b!862977 res!586420) b!862987))

(assert (= (and b!862987 (not res!586424)) b!862980))

(assert (= (and b!862980 c!92104) b!862990))

(assert (= (and b!862980 (not c!92104)) b!862986))

(assert (= (and b!862980 (not res!586422)) b!862983))

(assert (= (and b!862989 condMapEmpty!26687) mapIsEmpty!26687))

(assert (= (and b!862989 (not condMapEmpty!26687)) mapNonEmpty!26687))

(get-info :version)

(assert (= (and mapNonEmpty!26687 ((_ is ValueCellFull!7923) mapValue!26687)) b!862979))

(assert (= (and b!862989 ((_ is ValueCellFull!7923) mapDefault!26687)) b!862978))

(assert (= start!73674 b!862989))

(declare-fun b_lambda!11941 () Bool)

(assert (=> (not b_lambda!11941) (not b!862980)))

(declare-fun t!23790 () Bool)

(declare-fun tb!4711 () Bool)

(assert (=> (and start!73674 (= defaultEntry!696 defaultEntry!696) t!23790) tb!4711))

(declare-fun result!9033 () Bool)

(assert (=> tb!4711 (= result!9033 tp_is_empty!16725)))

(assert (=> b!862980 t!23790))

(declare-fun b_and!24159 () Bool)

(assert (= b_and!24157 (and (=> t!23790 result!9033) b_and!24159)))

(declare-fun m!804081 () Bool)

(assert (=> b!862981 m!804081))

(declare-fun m!804083 () Bool)

(assert (=> b!862975 m!804083))

(declare-fun m!804085 () Bool)

(assert (=> b!862980 m!804085))

(declare-fun m!804087 () Bool)

(assert (=> b!862980 m!804087))

(declare-fun m!804089 () Bool)

(assert (=> b!862980 m!804089))

(declare-fun m!804091 () Bool)

(assert (=> b!862980 m!804091))

(assert (=> b!862980 m!804087))

(declare-fun m!804093 () Bool)

(assert (=> b!862980 m!804093))

(assert (=> b!862980 m!804089))

(declare-fun m!804095 () Bool)

(assert (=> b!862990 m!804095))

(declare-fun m!804097 () Bool)

(assert (=> b!862990 m!804097))

(declare-fun m!804099 () Bool)

(assert (=> b!862990 m!804099))

(declare-fun m!804101 () Bool)

(assert (=> b!862990 m!804101))

(declare-fun m!804103 () Bool)

(assert (=> b!862990 m!804103))

(declare-fun m!804105 () Bool)

(assert (=> mapNonEmpty!26687 m!804105))

(declare-fun m!804107 () Bool)

(assert (=> b!862977 m!804107))

(declare-fun m!804109 () Bool)

(assert (=> b!862977 m!804109))

(declare-fun m!804111 () Bool)

(assert (=> b!862977 m!804111))

(declare-fun m!804113 () Bool)

(assert (=> start!73674 m!804113))

(declare-fun m!804115 () Bool)

(assert (=> start!73674 m!804115))

(declare-fun m!804117 () Bool)

(assert (=> b!862985 m!804117))

(declare-fun m!804119 () Bool)

(assert (=> b!862983 m!804119))

(assert (=> b!862983 m!804119))

(declare-fun m!804121 () Bool)

(assert (=> b!862983 m!804121))

(assert (=> b!862983 m!804093))

(assert (=> b!862983 m!804093))

(declare-fun m!804123 () Bool)

(assert (=> b!862983 m!804123))

(declare-fun m!804125 () Bool)

(assert (=> b!862982 m!804125))

(declare-fun m!804127 () Bool)

(assert (=> b!862987 m!804127))

(declare-fun m!804129 () Bool)

(assert (=> b!862987 m!804129))

(declare-fun m!804131 () Bool)

(assert (=> b!862987 m!804131))

(assert (=> b!862987 m!804093))

(declare-fun m!804133 () Bool)

(assert (=> b!862987 m!804133))

(assert (=> b!862987 m!804093))

(declare-fun m!804135 () Bool)

(assert (=> b!862987 m!804135))

(declare-fun m!804137 () Bool)

(assert (=> b!862984 m!804137))

(check-sat (not b!862983) b_and!24159 (not b!862980) tp_is_empty!16725 (not b_lambda!11941) (not b!862981) (not start!73674) (not b!862977) (not mapNonEmpty!26687) (not b!862975) (not b!862985) (not b_next!14589) (not b!862990) (not b!862984) (not b!862987))
(check-sat b_and!24159 (not b_next!14589))
