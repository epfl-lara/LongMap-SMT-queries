; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73756 () Bool)

(assert start!73756)

(declare-fun b_free!14689 () Bool)

(declare-fun b_next!14689 () Bool)

(assert (=> start!73756 (= b_free!14689 (not b_next!14689))))

(declare-fun tp!51571 () Bool)

(declare-fun b_and!24331 () Bool)

(assert (=> start!73756 (= tp!51571 b_and!24331)))

(declare-fun b!865236 () Bool)

(declare-fun e!481984 () Bool)

(declare-fun e!481986 () Bool)

(assert (=> b!865236 (= e!481984 e!481986)))

(declare-fun res!587959 () Bool)

(assert (=> b!865236 (=> (not res!587959) (not e!481986))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865236 (= res!587959 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27481 0))(
  ( (V!27482 (val!8460 Int)) )
))
(declare-datatypes ((ValueCell!7973 0))(
  ( (ValueCellFull!7973 (v!10879 V!27481)) (EmptyCell!7973) )
))
(declare-datatypes ((array!49803 0))(
  ( (array!49804 (arr!23933 (Array (_ BitVec 32) ValueCell!7973)) (size!24375 (_ BitVec 32))) )
))
(declare-fun lt!391956 () array!49803)

(declare-datatypes ((tuple2!11230 0))(
  ( (tuple2!11231 (_1!5626 (_ BitVec 64)) (_2!5626 V!27481)) )
))
(declare-datatypes ((List!17020 0))(
  ( (Nil!17017) (Cons!17016 (h!18147 tuple2!11230) (t!23966 List!17020)) )
))
(declare-datatypes ((ListLongMap!9989 0))(
  ( (ListLongMap!9990 (toList!5010 List!17020)) )
))
(declare-fun lt!391963 () ListLongMap!9989)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49805 0))(
  ( (array!49806 (arr!23934 (Array (_ BitVec 32) (_ BitVec 64))) (size!24376 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49805)

(declare-fun minValue!654 () V!27481)

(declare-fun zeroValue!654 () V!27481)

(declare-fun getCurrentListMapNoExtraKeys!3007 (array!49805 array!49803 (_ BitVec 32) (_ BitVec 32) V!27481 V!27481 (_ BitVec 32) Int) ListLongMap!9989)

(assert (=> b!865236 (= lt!391963 (getCurrentListMapNoExtraKeys!3007 _keys!868 lt!391956 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27481)

(declare-fun _values!688 () array!49803)

(assert (=> b!865236 (= lt!391956 (array!49804 (store (arr!23933 _values!688) i!612 (ValueCellFull!7973 v!557)) (size!24375 _values!688)))))

(declare-fun lt!391958 () ListLongMap!9989)

(assert (=> b!865236 (= lt!391958 (getCurrentListMapNoExtraKeys!3007 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865237 () Bool)

(declare-fun e!481979 () Bool)

(assert (=> b!865237 (= e!481979 true)))

(declare-fun lt!391964 () tuple2!11230)

(declare-fun lt!391960 () ListLongMap!9989)

(declare-fun lt!391952 () ListLongMap!9989)

(declare-fun lt!391950 () tuple2!11230)

(declare-fun +!2378 (ListLongMap!9989 tuple2!11230) ListLongMap!9989)

(assert (=> b!865237 (= lt!391960 (+!2378 (+!2378 lt!391952 lt!391950) lt!391964))))

(declare-datatypes ((Unit!29567 0))(
  ( (Unit!29568) )
))
(declare-fun lt!391961 () Unit!29567)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!391962 () V!27481)

(declare-fun addCommutativeForDiffKeys!518 (ListLongMap!9989 (_ BitVec 64) V!27481 (_ BitVec 64) V!27481) Unit!29567)

(assert (=> b!865237 (= lt!391961 (addCommutativeForDiffKeys!518 lt!391952 k0!854 v!557 (select (arr!23934 _keys!868) from!1053) lt!391962))))

(declare-fun b!865238 () Bool)

(declare-fun e!481981 () Bool)

(declare-fun tp_is_empty!16825 () Bool)

(assert (=> b!865238 (= e!481981 tp_is_empty!16825)))

(declare-fun b!865239 () Bool)

(declare-fun e!481982 () Bool)

(assert (=> b!865239 (= e!481982 e!481979)))

(declare-fun res!587966 () Bool)

(assert (=> b!865239 (=> res!587966 e!481979)))

(assert (=> b!865239 (= res!587966 (= k0!854 (select (arr!23934 _keys!868) from!1053)))))

(assert (=> b!865239 (not (= (select (arr!23934 _keys!868) from!1053) k0!854))))

(declare-fun lt!391954 () Unit!29567)

(declare-fun e!481985 () Unit!29567)

(assert (=> b!865239 (= lt!391954 e!481985)))

(declare-fun c!92189 () Bool)

(assert (=> b!865239 (= c!92189 (= (select (arr!23934 _keys!868) from!1053) k0!854))))

(assert (=> b!865239 (= lt!391963 lt!391960)))

(declare-fun lt!391953 () ListLongMap!9989)

(assert (=> b!865239 (= lt!391960 (+!2378 lt!391953 lt!391950))))

(assert (=> b!865239 (= lt!391950 (tuple2!11231 (select (arr!23934 _keys!868) from!1053) lt!391962))))

(declare-fun get!12652 (ValueCell!7973 V!27481) V!27481)

(declare-fun dynLambda!1175 (Int (_ BitVec 64)) V!27481)

(assert (=> b!865239 (= lt!391962 (get!12652 (select (arr!23933 _values!688) from!1053) (dynLambda!1175 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865240 () Bool)

(declare-fun res!587963 () Bool)

(assert (=> b!865240 (=> (not res!587963) (not e!481984))))

(assert (=> b!865240 (= res!587963 (and (= (select (arr!23934 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865241 () Bool)

(declare-fun Unit!29569 () Unit!29567)

(assert (=> b!865241 (= e!481985 Unit!29569)))

(declare-fun lt!391957 () Unit!29567)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49805 (_ BitVec 32) (_ BitVec 32)) Unit!29567)

(assert (=> b!865241 (= lt!391957 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17021 0))(
  ( (Nil!17018) (Cons!17017 (h!18148 (_ BitVec 64)) (t!23967 List!17021)) )
))
(declare-fun arrayNoDuplicates!0 (array!49805 (_ BitVec 32) List!17021) Bool)

(assert (=> b!865241 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17018)))

(declare-fun lt!391955 () Unit!29567)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49805 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29567)

(assert (=> b!865241 (= lt!391955 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865241 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391951 () Unit!29567)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49805 (_ BitVec 64) (_ BitVec 32) List!17021) Unit!29567)

(assert (=> b!865241 (= lt!391951 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17018))))

(assert (=> b!865241 false))

(declare-fun b!865242 () Bool)

(declare-fun e!481980 () Bool)

(declare-fun mapRes!26837 () Bool)

(assert (=> b!865242 (= e!481980 (and e!481981 mapRes!26837))))

(declare-fun condMapEmpty!26837 () Bool)

(declare-fun mapDefault!26837 () ValueCell!7973)

(assert (=> b!865242 (= condMapEmpty!26837 (= (arr!23933 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7973)) mapDefault!26837)))))

(declare-fun b!865243 () Bool)

(declare-fun res!587962 () Bool)

(assert (=> b!865243 (=> (not res!587962) (not e!481984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49805 (_ BitVec 32)) Bool)

(assert (=> b!865243 (= res!587962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865244 () Bool)

(declare-fun res!587965 () Bool)

(assert (=> b!865244 (=> (not res!587965) (not e!481984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865244 (= res!587965 (validMask!0 mask!1196))))

(declare-fun b!865245 () Bool)

(declare-fun res!587958 () Bool)

(assert (=> b!865245 (=> (not res!587958) (not e!481984))))

(assert (=> b!865245 (= res!587958 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24376 _keys!868))))))

(declare-fun b!865246 () Bool)

(declare-fun res!587964 () Bool)

(assert (=> b!865246 (=> (not res!587964) (not e!481984))))

(assert (=> b!865246 (= res!587964 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17018))))

(declare-fun mapIsEmpty!26837 () Bool)

(assert (=> mapIsEmpty!26837 mapRes!26837))

(declare-fun b!865247 () Bool)

(assert (=> b!865247 (= e!481986 (not e!481982))))

(declare-fun res!587960 () Bool)

(assert (=> b!865247 (=> res!587960 e!481982)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865247 (= res!587960 (not (validKeyInArray!0 (select (arr!23934 _keys!868) from!1053))))))

(declare-fun lt!391959 () ListLongMap!9989)

(assert (=> b!865247 (= lt!391959 lt!391953)))

(assert (=> b!865247 (= lt!391953 (+!2378 lt!391952 lt!391964))))

(assert (=> b!865247 (= lt!391959 (getCurrentListMapNoExtraKeys!3007 _keys!868 lt!391956 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865247 (= lt!391964 (tuple2!11231 k0!854 v!557))))

(assert (=> b!865247 (= lt!391952 (getCurrentListMapNoExtraKeys!3007 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391949 () Unit!29567)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!553 (array!49805 array!49803 (_ BitVec 32) (_ BitVec 32) V!27481 V!27481 (_ BitVec 32) (_ BitVec 64) V!27481 (_ BitVec 32) Int) Unit!29567)

(assert (=> b!865247 (= lt!391949 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!553 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865248 () Bool)

(declare-fun res!587961 () Bool)

(assert (=> b!865248 (=> (not res!587961) (not e!481984))))

(assert (=> b!865248 (= res!587961 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26837 () Bool)

(declare-fun tp!51572 () Bool)

(declare-fun e!481983 () Bool)

(assert (=> mapNonEmpty!26837 (= mapRes!26837 (and tp!51572 e!481983))))

(declare-fun mapRest!26837 () (Array (_ BitVec 32) ValueCell!7973))

(declare-fun mapValue!26837 () ValueCell!7973)

(declare-fun mapKey!26837 () (_ BitVec 32))

(assert (=> mapNonEmpty!26837 (= (arr!23933 _values!688) (store mapRest!26837 mapKey!26837 mapValue!26837))))

(declare-fun b!865249 () Bool)

(declare-fun Unit!29570 () Unit!29567)

(assert (=> b!865249 (= e!481985 Unit!29570)))

(declare-fun b!865250 () Bool)

(declare-fun res!587957 () Bool)

(assert (=> b!865250 (=> (not res!587957) (not e!481984))))

(assert (=> b!865250 (= res!587957 (and (= (size!24375 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24376 _keys!868) (size!24375 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!587967 () Bool)

(assert (=> start!73756 (=> (not res!587967) (not e!481984))))

(assert (=> start!73756 (= res!587967 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24376 _keys!868))))))

(assert (=> start!73756 e!481984))

(assert (=> start!73756 tp_is_empty!16825))

(assert (=> start!73756 true))

(assert (=> start!73756 tp!51571))

(declare-fun array_inv!18994 (array!49805) Bool)

(assert (=> start!73756 (array_inv!18994 _keys!868)))

(declare-fun array_inv!18995 (array!49803) Bool)

(assert (=> start!73756 (and (array_inv!18995 _values!688) e!481980)))

(declare-fun b!865251 () Bool)

(assert (=> b!865251 (= e!481983 tp_is_empty!16825)))

(assert (= (and start!73756 res!587967) b!865244))

(assert (= (and b!865244 res!587965) b!865250))

(assert (= (and b!865250 res!587957) b!865243))

(assert (= (and b!865243 res!587962) b!865246))

(assert (= (and b!865246 res!587964) b!865245))

(assert (= (and b!865245 res!587958) b!865248))

(assert (= (and b!865248 res!587961) b!865240))

(assert (= (and b!865240 res!587963) b!865236))

(assert (= (and b!865236 res!587959) b!865247))

(assert (= (and b!865247 (not res!587960)) b!865239))

(assert (= (and b!865239 c!92189) b!865241))

(assert (= (and b!865239 (not c!92189)) b!865249))

(assert (= (and b!865239 (not res!587966)) b!865237))

(assert (= (and b!865242 condMapEmpty!26837) mapIsEmpty!26837))

(assert (= (and b!865242 (not condMapEmpty!26837)) mapNonEmpty!26837))

(get-info :version)

(assert (= (and mapNonEmpty!26837 ((_ is ValueCellFull!7973) mapValue!26837)) b!865251))

(assert (= (and b!865242 ((_ is ValueCellFull!7973) mapDefault!26837)) b!865238))

(assert (= start!73756 b!865242))

(declare-fun b_lambda!12023 () Bool)

(assert (=> (not b_lambda!12023) (not b!865239)))

(declare-fun t!23965 () Bool)

(declare-fun tb!4803 () Bool)

(assert (=> (and start!73756 (= defaultEntry!696 defaultEntry!696) t!23965) tb!4803))

(declare-fun result!9225 () Bool)

(assert (=> tb!4803 (= result!9225 tp_is_empty!16825)))

(assert (=> b!865239 t!23965))

(declare-fun b_and!24333 () Bool)

(assert (= b_and!24331 (and (=> t!23965 result!9225) b_and!24333)))

(declare-fun m!806223 () Bool)

(assert (=> mapNonEmpty!26837 m!806223))

(declare-fun m!806225 () Bool)

(assert (=> b!865237 m!806225))

(assert (=> b!865237 m!806225))

(declare-fun m!806227 () Bool)

(assert (=> b!865237 m!806227))

(declare-fun m!806229 () Bool)

(assert (=> b!865237 m!806229))

(assert (=> b!865237 m!806229))

(declare-fun m!806231 () Bool)

(assert (=> b!865237 m!806231))

(declare-fun m!806233 () Bool)

(assert (=> b!865246 m!806233))

(declare-fun m!806235 () Bool)

(assert (=> b!865240 m!806235))

(declare-fun m!806237 () Bool)

(assert (=> b!865244 m!806237))

(declare-fun m!806239 () Bool)

(assert (=> b!865248 m!806239))

(declare-fun m!806241 () Bool)

(assert (=> b!865236 m!806241))

(declare-fun m!806243 () Bool)

(assert (=> b!865236 m!806243))

(declare-fun m!806245 () Bool)

(assert (=> b!865236 m!806245))

(declare-fun m!806247 () Bool)

(assert (=> b!865247 m!806247))

(declare-fun m!806249 () Bool)

(assert (=> b!865247 m!806249))

(assert (=> b!865247 m!806229))

(declare-fun m!806251 () Bool)

(assert (=> b!865247 m!806251))

(assert (=> b!865247 m!806229))

(declare-fun m!806253 () Bool)

(assert (=> b!865247 m!806253))

(declare-fun m!806255 () Bool)

(assert (=> b!865247 m!806255))

(declare-fun m!806257 () Bool)

(assert (=> b!865239 m!806257))

(declare-fun m!806259 () Bool)

(assert (=> b!865239 m!806259))

(declare-fun m!806261 () Bool)

(assert (=> b!865239 m!806261))

(assert (=> b!865239 m!806257))

(declare-fun m!806263 () Bool)

(assert (=> b!865239 m!806263))

(assert (=> b!865239 m!806229))

(assert (=> b!865239 m!806259))

(declare-fun m!806265 () Bool)

(assert (=> start!73756 m!806265))

(declare-fun m!806267 () Bool)

(assert (=> start!73756 m!806267))

(declare-fun m!806269 () Bool)

(assert (=> b!865241 m!806269))

(declare-fun m!806271 () Bool)

(assert (=> b!865241 m!806271))

(declare-fun m!806273 () Bool)

(assert (=> b!865241 m!806273))

(declare-fun m!806275 () Bool)

(assert (=> b!865241 m!806275))

(declare-fun m!806277 () Bool)

(assert (=> b!865241 m!806277))

(declare-fun m!806279 () Bool)

(assert (=> b!865243 m!806279))

(check-sat (not b!865246) (not b_next!14689) (not b!865241) (not b!865243) (not b!865247) (not start!73756) (not b!865236) tp_is_empty!16825 b_and!24333 (not b_lambda!12023) (not b!865248) (not b!865237) (not b!865244) (not b!865239) (not mapNonEmpty!26837))
(check-sat b_and!24333 (not b_next!14689))
