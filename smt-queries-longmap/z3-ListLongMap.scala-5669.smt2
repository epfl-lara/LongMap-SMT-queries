; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73966 () Bool)

(assert start!73966)

(declare-fun b_free!14713 () Bool)

(declare-fun b_next!14713 () Bool)

(assert (=> start!73966 (= b_free!14713 (not b_next!14713))))

(declare-fun tp!51644 () Bool)

(declare-fun b_and!24415 () Bool)

(assert (=> start!73966 (= tp!51644 b_and!24415)))

(declare-fun b!866978 () Bool)

(declare-fun e!483035 () Bool)

(declare-fun e!483032 () Bool)

(assert (=> b!866978 (= e!483035 (not e!483032))))

(declare-fun res!588811 () Bool)

(assert (=> b!866978 (=> res!588811 e!483032)))

(declare-datatypes ((array!49909 0))(
  ( (array!49910 (arr!23981 (Array (_ BitVec 32) (_ BitVec 64))) (size!24422 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49909)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866978 (= res!588811 (not (validKeyInArray!0 (select (arr!23981 _keys!868) from!1053))))))

(declare-datatypes ((V!27513 0))(
  ( (V!27514 (val!8472 Int)) )
))
(declare-datatypes ((tuple2!11156 0))(
  ( (tuple2!11157 (_1!5589 (_ BitVec 64)) (_2!5589 V!27513)) )
))
(declare-datatypes ((List!16985 0))(
  ( (Nil!16982) (Cons!16981 (h!18118 tuple2!11156) (t!23956 List!16985)) )
))
(declare-datatypes ((ListLongMap!9927 0))(
  ( (ListLongMap!9928 (toList!4979 List!16985)) )
))
(declare-fun lt!393132 () ListLongMap!9927)

(declare-fun lt!393127 () ListLongMap!9927)

(assert (=> b!866978 (= lt!393132 lt!393127)))

(declare-fun lt!393125 () ListLongMap!9927)

(declare-fun lt!393136 () tuple2!11156)

(declare-fun +!2382 (ListLongMap!9927 tuple2!11156) ListLongMap!9927)

(assert (=> b!866978 (= lt!393127 (+!2382 lt!393125 lt!393136))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7985 0))(
  ( (ValueCellFull!7985 (v!10897 V!27513)) (EmptyCell!7985) )
))
(declare-datatypes ((array!49911 0))(
  ( (array!49912 (arr!23982 (Array (_ BitVec 32) ValueCell!7985)) (size!24423 (_ BitVec 32))) )
))
(declare-fun lt!393134 () array!49911)

(declare-fun minValue!654 () V!27513)

(declare-fun zeroValue!654 () V!27513)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3026 (array!49909 array!49911 (_ BitVec 32) (_ BitVec 32) V!27513 V!27513 (_ BitVec 32) Int) ListLongMap!9927)

(assert (=> b!866978 (= lt!393132 (getCurrentListMapNoExtraKeys!3026 _keys!868 lt!393134 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27513)

(assert (=> b!866978 (= lt!393136 (tuple2!11157 k0!854 v!557))))

(declare-fun _values!688 () array!49911)

(assert (=> b!866978 (= lt!393125 (getCurrentListMapNoExtraKeys!3026 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29670 0))(
  ( (Unit!29671) )
))
(declare-fun lt!393135 () Unit!29670)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!560 (array!49909 array!49911 (_ BitVec 32) (_ BitVec 32) V!27513 V!27513 (_ BitVec 32) (_ BitVec 64) V!27513 (_ BitVec 32) Int) Unit!29670)

(assert (=> b!866978 (= lt!393135 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!560 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!588817 () Bool)

(declare-fun e!483034 () Bool)

(assert (=> start!73966 (=> (not res!588817) (not e!483034))))

(assert (=> start!73966 (= res!588817 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24422 _keys!868))))))

(assert (=> start!73966 e!483034))

(declare-fun tp_is_empty!16849 () Bool)

(assert (=> start!73966 tp_is_empty!16849))

(assert (=> start!73966 true))

(assert (=> start!73966 tp!51644))

(declare-fun array_inv!19012 (array!49909) Bool)

(assert (=> start!73966 (array_inv!19012 _keys!868)))

(declare-fun e!483039 () Bool)

(declare-fun array_inv!19013 (array!49911) Bool)

(assert (=> start!73966 (and (array_inv!19013 _values!688) e!483039)))

(declare-fun b!866979 () Bool)

(declare-fun e!483033 () Bool)

(declare-fun mapRes!26873 () Bool)

(assert (=> b!866979 (= e!483039 (and e!483033 mapRes!26873))))

(declare-fun condMapEmpty!26873 () Bool)

(declare-fun mapDefault!26873 () ValueCell!7985)

(assert (=> b!866979 (= condMapEmpty!26873 (= (arr!23982 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7985)) mapDefault!26873)))))

(declare-fun b!866980 () Bool)

(declare-fun e!483036 () Unit!29670)

(declare-fun Unit!29672 () Unit!29670)

(assert (=> b!866980 (= e!483036 Unit!29672)))

(declare-fun lt!393130 () Unit!29670)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49909 (_ BitVec 32) (_ BitVec 32)) Unit!29670)

(assert (=> b!866980 (= lt!393130 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16986 0))(
  ( (Nil!16983) (Cons!16982 (h!18119 (_ BitVec 64)) (t!23957 List!16986)) )
))
(declare-fun arrayNoDuplicates!0 (array!49909 (_ BitVec 32) List!16986) Bool)

(assert (=> b!866980 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16983)))

(declare-fun lt!393137 () Unit!29670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49909 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29670)

(assert (=> b!866980 (= lt!393137 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866980 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393123 () Unit!29670)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49909 (_ BitVec 64) (_ BitVec 32) List!16986) Unit!29670)

(assert (=> b!866980 (= lt!393123 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16983))))

(assert (=> b!866980 false))

(declare-fun b!866981 () Bool)

(declare-fun res!588808 () Bool)

(assert (=> b!866981 (=> (not res!588808) (not e!483034))))

(assert (=> b!866981 (= res!588808 (validKeyInArray!0 k0!854))))

(declare-fun b!866982 () Bool)

(declare-fun res!588807 () Bool)

(assert (=> b!866982 (=> (not res!588807) (not e!483034))))

(assert (=> b!866982 (= res!588807 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24422 _keys!868))))))

(declare-fun b!866983 () Bool)

(declare-fun res!588813 () Bool)

(assert (=> b!866983 (=> (not res!588813) (not e!483034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866983 (= res!588813 (validMask!0 mask!1196))))

(declare-fun b!866984 () Bool)

(declare-fun e!483037 () Bool)

(assert (=> b!866984 (= e!483037 tp_is_empty!16849)))

(declare-fun mapNonEmpty!26873 () Bool)

(declare-fun tp!51643 () Bool)

(assert (=> mapNonEmpty!26873 (= mapRes!26873 (and tp!51643 e!483037))))

(declare-fun mapValue!26873 () ValueCell!7985)

(declare-fun mapKey!26873 () (_ BitVec 32))

(declare-fun mapRest!26873 () (Array (_ BitVec 32) ValueCell!7985))

(assert (=> mapNonEmpty!26873 (= (arr!23982 _values!688) (store mapRest!26873 mapKey!26873 mapValue!26873))))

(declare-fun b!866985 () Bool)

(declare-fun e!483038 () Bool)

(assert (=> b!866985 (= e!483038 true)))

(declare-fun lt!393133 () ListLongMap!9927)

(declare-fun lt!393129 () tuple2!11156)

(assert (=> b!866985 (= lt!393133 (+!2382 (+!2382 lt!393125 lt!393129) lt!393136))))

(declare-fun lt!393128 () V!27513)

(declare-fun lt!393126 () Unit!29670)

(declare-fun addCommutativeForDiffKeys!526 (ListLongMap!9927 (_ BitVec 64) V!27513 (_ BitVec 64) V!27513) Unit!29670)

(assert (=> b!866985 (= lt!393126 (addCommutativeForDiffKeys!526 lt!393125 k0!854 v!557 (select (arr!23981 _keys!868) from!1053) lt!393128))))

(declare-fun b!866986 () Bool)

(assert (=> b!866986 (= e!483032 e!483038)))

(declare-fun res!588810 () Bool)

(assert (=> b!866986 (=> res!588810 e!483038)))

(assert (=> b!866986 (= res!588810 (= k0!854 (select (arr!23981 _keys!868) from!1053)))))

(assert (=> b!866986 (not (= (select (arr!23981 _keys!868) from!1053) k0!854))))

(declare-fun lt!393131 () Unit!29670)

(assert (=> b!866986 (= lt!393131 e!483036)))

(declare-fun c!92572 () Bool)

(assert (=> b!866986 (= c!92572 (= (select (arr!23981 _keys!868) from!1053) k0!854))))

(declare-fun lt!393124 () ListLongMap!9927)

(assert (=> b!866986 (= lt!393124 lt!393133)))

(assert (=> b!866986 (= lt!393133 (+!2382 lt!393127 lt!393129))))

(assert (=> b!866986 (= lt!393129 (tuple2!11157 (select (arr!23981 _keys!868) from!1053) lt!393128))))

(declare-fun get!12691 (ValueCell!7985 V!27513) V!27513)

(declare-fun dynLambda!1203 (Int (_ BitVec 64)) V!27513)

(assert (=> b!866986 (= lt!393128 (get!12691 (select (arr!23982 _values!688) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866987 () Bool)

(declare-fun res!588815 () Bool)

(assert (=> b!866987 (=> (not res!588815) (not e!483034))))

(assert (=> b!866987 (= res!588815 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16983))))

(declare-fun b!866988 () Bool)

(declare-fun res!588809 () Bool)

(assert (=> b!866988 (=> (not res!588809) (not e!483034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49909 (_ BitVec 32)) Bool)

(assert (=> b!866988 (= res!588809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866989 () Bool)

(declare-fun res!588812 () Bool)

(assert (=> b!866989 (=> (not res!588812) (not e!483034))))

(assert (=> b!866989 (= res!588812 (and (= (select (arr!23981 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866990 () Bool)

(declare-fun res!588816 () Bool)

(assert (=> b!866990 (=> (not res!588816) (not e!483034))))

(assert (=> b!866990 (= res!588816 (and (= (size!24423 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24422 _keys!868) (size!24423 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866991 () Bool)

(assert (=> b!866991 (= e!483033 tp_is_empty!16849)))

(declare-fun mapIsEmpty!26873 () Bool)

(assert (=> mapIsEmpty!26873 mapRes!26873))

(declare-fun b!866992 () Bool)

(assert (=> b!866992 (= e!483034 e!483035)))

(declare-fun res!588814 () Bool)

(assert (=> b!866992 (=> (not res!588814) (not e!483035))))

(assert (=> b!866992 (= res!588814 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866992 (= lt!393124 (getCurrentListMapNoExtraKeys!3026 _keys!868 lt!393134 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866992 (= lt!393134 (array!49912 (store (arr!23982 _values!688) i!612 (ValueCellFull!7985 v!557)) (size!24423 _values!688)))))

(declare-fun lt!393122 () ListLongMap!9927)

(assert (=> b!866992 (= lt!393122 (getCurrentListMapNoExtraKeys!3026 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866993 () Bool)

(declare-fun Unit!29673 () Unit!29670)

(assert (=> b!866993 (= e!483036 Unit!29673)))

(assert (= (and start!73966 res!588817) b!866983))

(assert (= (and b!866983 res!588813) b!866990))

(assert (= (and b!866990 res!588816) b!866988))

(assert (= (and b!866988 res!588809) b!866987))

(assert (= (and b!866987 res!588815) b!866982))

(assert (= (and b!866982 res!588807) b!866981))

(assert (= (and b!866981 res!588808) b!866989))

(assert (= (and b!866989 res!588812) b!866992))

(assert (= (and b!866992 res!588814) b!866978))

(assert (= (and b!866978 (not res!588811)) b!866986))

(assert (= (and b!866986 c!92572) b!866980))

(assert (= (and b!866986 (not c!92572)) b!866993))

(assert (= (and b!866986 (not res!588810)) b!866985))

(assert (= (and b!866979 condMapEmpty!26873) mapIsEmpty!26873))

(assert (= (and b!866979 (not condMapEmpty!26873)) mapNonEmpty!26873))

(get-info :version)

(assert (= (and mapNonEmpty!26873 ((_ is ValueCellFull!7985) mapValue!26873)) b!866984))

(assert (= (and b!866979 ((_ is ValueCellFull!7985) mapDefault!26873)) b!866991))

(assert (= start!73966 b!866979))

(declare-fun b_lambda!12079 () Bool)

(assert (=> (not b_lambda!12079) (not b!866986)))

(declare-fun t!23955 () Bool)

(declare-fun tb!4827 () Bool)

(assert (=> (and start!73966 (= defaultEntry!696 defaultEntry!696) t!23955) tb!4827))

(declare-fun result!9273 () Bool)

(assert (=> tb!4827 (= result!9273 tp_is_empty!16849)))

(assert (=> b!866986 t!23955))

(declare-fun b_and!24417 () Bool)

(assert (= b_and!24415 (and (=> t!23955 result!9273) b_and!24417)))

(declare-fun m!808967 () Bool)

(assert (=> mapNonEmpty!26873 m!808967))

(declare-fun m!808969 () Bool)

(assert (=> b!866983 m!808969))

(declare-fun m!808971 () Bool)

(assert (=> b!866978 m!808971))

(declare-fun m!808973 () Bool)

(assert (=> b!866978 m!808973))

(declare-fun m!808975 () Bool)

(assert (=> b!866978 m!808975))

(declare-fun m!808977 () Bool)

(assert (=> b!866978 m!808977))

(assert (=> b!866978 m!808975))

(declare-fun m!808979 () Bool)

(assert (=> b!866978 m!808979))

(declare-fun m!808981 () Bool)

(assert (=> b!866978 m!808981))

(declare-fun m!808983 () Bool)

(assert (=> b!866980 m!808983))

(declare-fun m!808985 () Bool)

(assert (=> b!866980 m!808985))

(declare-fun m!808987 () Bool)

(assert (=> b!866980 m!808987))

(declare-fun m!808989 () Bool)

(assert (=> b!866980 m!808989))

(declare-fun m!808991 () Bool)

(assert (=> b!866980 m!808991))

(declare-fun m!808993 () Bool)

(assert (=> b!866992 m!808993))

(declare-fun m!808995 () Bool)

(assert (=> b!866992 m!808995))

(declare-fun m!808997 () Bool)

(assert (=> b!866992 m!808997))

(declare-fun m!808999 () Bool)

(assert (=> b!866987 m!808999))

(declare-fun m!809001 () Bool)

(assert (=> b!866986 m!809001))

(declare-fun m!809003 () Bool)

(assert (=> b!866986 m!809003))

(declare-fun m!809005 () Bool)

(assert (=> b!866986 m!809005))

(declare-fun m!809007 () Bool)

(assert (=> b!866986 m!809007))

(assert (=> b!866986 m!809003))

(assert (=> b!866986 m!808975))

(assert (=> b!866986 m!809005))

(declare-fun m!809009 () Bool)

(assert (=> b!866988 m!809009))

(declare-fun m!809011 () Bool)

(assert (=> start!73966 m!809011))

(declare-fun m!809013 () Bool)

(assert (=> start!73966 m!809013))

(declare-fun m!809015 () Bool)

(assert (=> b!866989 m!809015))

(declare-fun m!809017 () Bool)

(assert (=> b!866981 m!809017))

(declare-fun m!809019 () Bool)

(assert (=> b!866985 m!809019))

(assert (=> b!866985 m!809019))

(declare-fun m!809021 () Bool)

(assert (=> b!866985 m!809021))

(assert (=> b!866985 m!808975))

(assert (=> b!866985 m!808975))

(declare-fun m!809023 () Bool)

(assert (=> b!866985 m!809023))

(check-sat (not b_next!14713) (not b!866978) tp_is_empty!16849 (not b!866988) (not b!866985) (not b_lambda!12079) (not mapNonEmpty!26873) (not b!866981) (not b!866987) (not b!866980) (not b!866986) (not b!866983) b_and!24417 (not start!73966) (not b!866992))
(check-sat b_and!24417 (not b_next!14713))
