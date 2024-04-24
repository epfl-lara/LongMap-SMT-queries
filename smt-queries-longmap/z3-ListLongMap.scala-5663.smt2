; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73930 () Bool)

(assert start!73930)

(declare-fun b_free!14677 () Bool)

(declare-fun b_next!14677 () Bool)

(assert (=> start!73930 (= b_free!14677 (not b_next!14677))))

(declare-fun tp!51535 () Bool)

(declare-fun b_and!24343 () Bool)

(assert (=> start!73930 (= tp!51535 b_and!24343)))

(declare-fun b!866078 () Bool)

(declare-fun res!588216 () Bool)

(declare-fun e!482547 () Bool)

(assert (=> b!866078 (=> (not res!588216) (not e!482547))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49837 0))(
  ( (array!49838 (arr!23945 (Array (_ BitVec 32) (_ BitVec 64))) (size!24386 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49837)

(declare-datatypes ((V!27465 0))(
  ( (V!27466 (val!8454 Int)) )
))
(declare-datatypes ((ValueCell!7967 0))(
  ( (ValueCellFull!7967 (v!10879 V!27465)) (EmptyCell!7967) )
))
(declare-datatypes ((array!49839 0))(
  ( (array!49840 (arr!23946 (Array (_ BitVec 32) ValueCell!7967)) (size!24387 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49839)

(assert (=> b!866078 (= res!588216 (and (= (size!24387 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24386 _keys!868) (size!24387 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866079 () Bool)

(declare-fun res!588213 () Bool)

(assert (=> b!866079 (=> (not res!588213) (not e!482547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866079 (= res!588213 (validMask!0 mask!1196))))

(declare-fun b!866080 () Bool)

(declare-fun res!588223 () Bool)

(assert (=> b!866080 (=> (not res!588223) (not e!482547))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!866080 (= res!588223 (and (= (select (arr!23945 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866081 () Bool)

(declare-fun res!588214 () Bool)

(assert (=> b!866081 (=> (not res!588214) (not e!482547))))

(declare-datatypes ((List!16953 0))(
  ( (Nil!16950) (Cons!16949 (h!18086 (_ BitVec 64)) (t!23888 List!16953)) )
))
(declare-fun arrayNoDuplicates!0 (array!49837 (_ BitVec 32) List!16953) Bool)

(assert (=> b!866081 (= res!588214 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16950))))

(declare-fun b!866082 () Bool)

(declare-datatypes ((Unit!29610 0))(
  ( (Unit!29611) )
))
(declare-fun e!482552 () Unit!29610)

(declare-fun Unit!29612 () Unit!29610)

(assert (=> b!866082 (= e!482552 Unit!29612)))

(declare-fun b!866083 () Bool)

(declare-fun res!588220 () Bool)

(assert (=> b!866083 (=> (not res!588220) (not e!482547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866083 (= res!588220 (validKeyInArray!0 k0!854))))

(declare-fun b!866084 () Bool)

(declare-fun e!482554 () Bool)

(declare-fun e!482550 () Bool)

(declare-fun mapRes!26819 () Bool)

(assert (=> b!866084 (= e!482554 (and e!482550 mapRes!26819))))

(declare-fun condMapEmpty!26819 () Bool)

(declare-fun mapDefault!26819 () ValueCell!7967)

(assert (=> b!866084 (= condMapEmpty!26819 (= (arr!23946 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7967)) mapDefault!26819)))))

(declare-fun res!588219 () Bool)

(assert (=> start!73930 (=> (not res!588219) (not e!482547))))

(assert (=> start!73930 (= res!588219 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24386 _keys!868))))))

(assert (=> start!73930 e!482547))

(declare-fun tp_is_empty!16813 () Bool)

(assert (=> start!73930 tp_is_empty!16813))

(assert (=> start!73930 true))

(assert (=> start!73930 tp!51535))

(declare-fun array_inv!18986 (array!49837) Bool)

(assert (=> start!73930 (array_inv!18986 _keys!868)))

(declare-fun array_inv!18987 (array!49839) Bool)

(assert (=> start!73930 (and (array_inv!18987 _values!688) e!482554)))

(declare-fun b!866085 () Bool)

(declare-fun e!482551 () Bool)

(assert (=> b!866085 (= e!482551 true)))

(declare-datatypes ((tuple2!11124 0))(
  ( (tuple2!11125 (_1!5573 (_ BitVec 64)) (_2!5573 V!27465)) )
))
(declare-fun lt!392272 () tuple2!11124)

(declare-fun lt!392259 () tuple2!11124)

(declare-datatypes ((List!16954 0))(
  ( (Nil!16951) (Cons!16950 (h!18087 tuple2!11124) (t!23889 List!16954)) )
))
(declare-datatypes ((ListLongMap!9895 0))(
  ( (ListLongMap!9896 (toList!4963 List!16954)) )
))
(declare-fun lt!392268 () ListLongMap!9895)

(declare-fun lt!392271 () ListLongMap!9895)

(declare-fun +!2366 (ListLongMap!9895 tuple2!11124) ListLongMap!9895)

(assert (=> b!866085 (= lt!392271 (+!2366 (+!2366 lt!392268 lt!392259) lt!392272))))

(declare-fun lt!392273 () Unit!29610)

(declare-fun v!557 () V!27465)

(declare-fun lt!392266 () V!27465)

(declare-fun addCommutativeForDiffKeys!514 (ListLongMap!9895 (_ BitVec 64) V!27465 (_ BitVec 64) V!27465) Unit!29610)

(assert (=> b!866085 (= lt!392273 (addCommutativeForDiffKeys!514 lt!392268 k0!854 v!557 (select (arr!23945 _keys!868) from!1053) lt!392266))))

(declare-fun mapNonEmpty!26819 () Bool)

(declare-fun tp!51536 () Bool)

(declare-fun e!482548 () Bool)

(assert (=> mapNonEmpty!26819 (= mapRes!26819 (and tp!51536 e!482548))))

(declare-fun mapValue!26819 () ValueCell!7967)

(declare-fun mapRest!26819 () (Array (_ BitVec 32) ValueCell!7967))

(declare-fun mapKey!26819 () (_ BitVec 32))

(assert (=> mapNonEmpty!26819 (= (arr!23946 _values!688) (store mapRest!26819 mapKey!26819 mapValue!26819))))

(declare-fun b!866086 () Bool)

(declare-fun e!482549 () Bool)

(assert (=> b!866086 (= e!482547 e!482549)))

(declare-fun res!588221 () Bool)

(assert (=> b!866086 (=> (not res!588221) (not e!482549))))

(assert (=> b!866086 (= res!588221 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392260 () array!49839)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27465)

(declare-fun zeroValue!654 () V!27465)

(declare-fun lt!392258 () ListLongMap!9895)

(declare-fun getCurrentListMapNoExtraKeys!3013 (array!49837 array!49839 (_ BitVec 32) (_ BitVec 32) V!27465 V!27465 (_ BitVec 32) Int) ListLongMap!9895)

(assert (=> b!866086 (= lt!392258 (getCurrentListMapNoExtraKeys!3013 _keys!868 lt!392260 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866086 (= lt!392260 (array!49840 (store (arr!23946 _values!688) i!612 (ValueCellFull!7967 v!557)) (size!24387 _values!688)))))

(declare-fun lt!392262 () ListLongMap!9895)

(assert (=> b!866086 (= lt!392262 (getCurrentListMapNoExtraKeys!3013 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866087 () Bool)

(declare-fun res!588218 () Bool)

(assert (=> b!866087 (=> (not res!588218) (not e!482547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49837 (_ BitVec 32)) Bool)

(assert (=> b!866087 (= res!588218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866088 () Bool)

(declare-fun e!482553 () Bool)

(assert (=> b!866088 (= e!482553 e!482551)))

(declare-fun res!588217 () Bool)

(assert (=> b!866088 (=> res!588217 e!482551)))

(assert (=> b!866088 (= res!588217 (= k0!854 (select (arr!23945 _keys!868) from!1053)))))

(assert (=> b!866088 (not (= (select (arr!23945 _keys!868) from!1053) k0!854))))

(declare-fun lt!392264 () Unit!29610)

(assert (=> b!866088 (= lt!392264 e!482552)))

(declare-fun c!92518 () Bool)

(assert (=> b!866088 (= c!92518 (= (select (arr!23945 _keys!868) from!1053) k0!854))))

(assert (=> b!866088 (= lt!392258 lt!392271)))

(declare-fun lt!392263 () ListLongMap!9895)

(assert (=> b!866088 (= lt!392271 (+!2366 lt!392263 lt!392259))))

(assert (=> b!866088 (= lt!392259 (tuple2!11125 (select (arr!23945 _keys!868) from!1053) lt!392266))))

(declare-fun get!12664 (ValueCell!7967 V!27465) V!27465)

(declare-fun dynLambda!1188 (Int (_ BitVec 64)) V!27465)

(assert (=> b!866088 (= lt!392266 (get!12664 (select (arr!23946 _values!688) from!1053) (dynLambda!1188 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866089 () Bool)

(assert (=> b!866089 (= e!482549 (not e!482553))))

(declare-fun res!588215 () Bool)

(assert (=> b!866089 (=> res!588215 e!482553)))

(assert (=> b!866089 (= res!588215 (not (validKeyInArray!0 (select (arr!23945 _keys!868) from!1053))))))

(declare-fun lt!392270 () ListLongMap!9895)

(assert (=> b!866089 (= lt!392270 lt!392263)))

(assert (=> b!866089 (= lt!392263 (+!2366 lt!392268 lt!392272))))

(assert (=> b!866089 (= lt!392270 (getCurrentListMapNoExtraKeys!3013 _keys!868 lt!392260 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866089 (= lt!392272 (tuple2!11125 k0!854 v!557))))

(assert (=> b!866089 (= lt!392268 (getCurrentListMapNoExtraKeys!3013 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392261 () Unit!29610)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!548 (array!49837 array!49839 (_ BitVec 32) (_ BitVec 32) V!27465 V!27465 (_ BitVec 32) (_ BitVec 64) V!27465 (_ BitVec 32) Int) Unit!29610)

(assert (=> b!866089 (= lt!392261 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!548 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866090 () Bool)

(declare-fun res!588222 () Bool)

(assert (=> b!866090 (=> (not res!588222) (not e!482547))))

(assert (=> b!866090 (= res!588222 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24386 _keys!868))))))

(declare-fun b!866091 () Bool)

(declare-fun Unit!29613 () Unit!29610)

(assert (=> b!866091 (= e!482552 Unit!29613)))

(declare-fun lt!392267 () Unit!29610)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49837 (_ BitVec 32) (_ BitVec 32)) Unit!29610)

(assert (=> b!866091 (= lt!392267 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866091 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16950)))

(declare-fun lt!392265 () Unit!29610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49837 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29610)

(assert (=> b!866091 (= lt!392265 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866091 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392269 () Unit!29610)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49837 (_ BitVec 64) (_ BitVec 32) List!16953) Unit!29610)

(assert (=> b!866091 (= lt!392269 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16950))))

(assert (=> b!866091 false))

(declare-fun b!866092 () Bool)

(assert (=> b!866092 (= e!482548 tp_is_empty!16813)))

(declare-fun mapIsEmpty!26819 () Bool)

(assert (=> mapIsEmpty!26819 mapRes!26819))

(declare-fun b!866093 () Bool)

(assert (=> b!866093 (= e!482550 tp_is_empty!16813)))

(assert (= (and start!73930 res!588219) b!866079))

(assert (= (and b!866079 res!588213) b!866078))

(assert (= (and b!866078 res!588216) b!866087))

(assert (= (and b!866087 res!588218) b!866081))

(assert (= (and b!866081 res!588214) b!866090))

(assert (= (and b!866090 res!588222) b!866083))

(assert (= (and b!866083 res!588220) b!866080))

(assert (= (and b!866080 res!588223) b!866086))

(assert (= (and b!866086 res!588221) b!866089))

(assert (= (and b!866089 (not res!588215)) b!866088))

(assert (= (and b!866088 c!92518) b!866091))

(assert (= (and b!866088 (not c!92518)) b!866082))

(assert (= (and b!866088 (not res!588217)) b!866085))

(assert (= (and b!866084 condMapEmpty!26819) mapIsEmpty!26819))

(assert (= (and b!866084 (not condMapEmpty!26819)) mapNonEmpty!26819))

(get-info :version)

(assert (= (and mapNonEmpty!26819 ((_ is ValueCellFull!7967) mapValue!26819)) b!866092))

(assert (= (and b!866084 ((_ is ValueCellFull!7967) mapDefault!26819)) b!866093))

(assert (= start!73930 b!866084))

(declare-fun b_lambda!12043 () Bool)

(assert (=> (not b_lambda!12043) (not b!866088)))

(declare-fun t!23887 () Bool)

(declare-fun tb!4791 () Bool)

(assert (=> (and start!73930 (= defaultEntry!696 defaultEntry!696) t!23887) tb!4791))

(declare-fun result!9201 () Bool)

(assert (=> tb!4791 (= result!9201 tp_is_empty!16813)))

(assert (=> b!866088 t!23887))

(declare-fun b_and!24345 () Bool)

(assert (= b_and!24343 (and (=> t!23887 result!9201) b_and!24345)))

(declare-fun m!807923 () Bool)

(assert (=> b!866081 m!807923))

(declare-fun m!807925 () Bool)

(assert (=> b!866089 m!807925))

(declare-fun m!807927 () Bool)

(assert (=> b!866089 m!807927))

(declare-fun m!807929 () Bool)

(assert (=> b!866089 m!807929))

(declare-fun m!807931 () Bool)

(assert (=> b!866089 m!807931))

(declare-fun m!807933 () Bool)

(assert (=> b!866089 m!807933))

(assert (=> b!866089 m!807931))

(declare-fun m!807935 () Bool)

(assert (=> b!866089 m!807935))

(declare-fun m!807937 () Bool)

(assert (=> mapNonEmpty!26819 m!807937))

(declare-fun m!807939 () Bool)

(assert (=> b!866087 m!807939))

(declare-fun m!807941 () Bool)

(assert (=> b!866080 m!807941))

(declare-fun m!807943 () Bool)

(assert (=> b!866079 m!807943))

(declare-fun m!807945 () Bool)

(assert (=> b!866091 m!807945))

(declare-fun m!807947 () Bool)

(assert (=> b!866091 m!807947))

(declare-fun m!807949 () Bool)

(assert (=> b!866091 m!807949))

(declare-fun m!807951 () Bool)

(assert (=> b!866091 m!807951))

(declare-fun m!807953 () Bool)

(assert (=> b!866091 m!807953))

(declare-fun m!807955 () Bool)

(assert (=> b!866086 m!807955))

(declare-fun m!807957 () Bool)

(assert (=> b!866086 m!807957))

(declare-fun m!807959 () Bool)

(assert (=> b!866086 m!807959))

(declare-fun m!807961 () Bool)

(assert (=> b!866085 m!807961))

(assert (=> b!866085 m!807961))

(declare-fun m!807963 () Bool)

(assert (=> b!866085 m!807963))

(assert (=> b!866085 m!807931))

(assert (=> b!866085 m!807931))

(declare-fun m!807965 () Bool)

(assert (=> b!866085 m!807965))

(declare-fun m!807967 () Bool)

(assert (=> start!73930 m!807967))

(declare-fun m!807969 () Bool)

(assert (=> start!73930 m!807969))

(declare-fun m!807971 () Bool)

(assert (=> b!866088 m!807971))

(declare-fun m!807973 () Bool)

(assert (=> b!866088 m!807973))

(declare-fun m!807975 () Bool)

(assert (=> b!866088 m!807975))

(assert (=> b!866088 m!807971))

(declare-fun m!807977 () Bool)

(assert (=> b!866088 m!807977))

(assert (=> b!866088 m!807931))

(assert (=> b!866088 m!807973))

(declare-fun m!807979 () Bool)

(assert (=> b!866083 m!807979))

(check-sat (not b!866079) (not mapNonEmpty!26819) (not b!866083) (not b!866087) (not b_next!14677) (not b_lambda!12043) (not start!73930) (not b!866085) (not b!866088) (not b!866091) (not b!866081) tp_is_empty!16813 (not b!866086) (not b!866089) b_and!24345)
(check-sat b_and!24345 (not b_next!14677))
