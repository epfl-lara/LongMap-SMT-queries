; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73972 () Bool)

(assert start!73972)

(declare-fun b_free!14719 () Bool)

(declare-fun b_next!14719 () Bool)

(assert (=> start!73972 (= b_free!14719 (not b_next!14719))))

(declare-fun tp!51661 () Bool)

(declare-fun b_and!24427 () Bool)

(assert (=> start!73972 (= tp!51661 b_and!24427)))

(declare-fun b!867128 () Bool)

(declare-fun e!483119 () Bool)

(declare-fun tp_is_empty!16855 () Bool)

(assert (=> b!867128 (= e!483119 tp_is_empty!16855)))

(declare-fun b!867129 () Bool)

(declare-fun e!483117 () Bool)

(assert (=> b!867129 (= e!483117 tp_is_empty!16855)))

(declare-fun b!867131 () Bool)

(declare-fun e!483114 () Bool)

(declare-fun e!483120 () Bool)

(assert (=> b!867131 (= e!483114 e!483120)))

(declare-fun res!588912 () Bool)

(assert (=> b!867131 (=> (not res!588912) (not e!483120))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!867131 (= res!588912 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27521 0))(
  ( (V!27522 (val!8475 Int)) )
))
(declare-datatypes ((tuple2!11162 0))(
  ( (tuple2!11163 (_1!5592 (_ BitVec 64)) (_2!5592 V!27521)) )
))
(declare-datatypes ((List!16990 0))(
  ( (Nil!16987) (Cons!16986 (h!18123 tuple2!11162) (t!23967 List!16990)) )
))
(declare-datatypes ((ListLongMap!9933 0))(
  ( (ListLongMap!9934 (toList!4982 List!16990)) )
))
(declare-fun lt!393272 () ListLongMap!9933)

(declare-datatypes ((ValueCell!7988 0))(
  ( (ValueCellFull!7988 (v!10900 V!27521)) (EmptyCell!7988) )
))
(declare-datatypes ((array!49921 0))(
  ( (array!49922 (arr!23987 (Array (_ BitVec 32) ValueCell!7988)) (size!24428 (_ BitVec 32))) )
))
(declare-fun lt!393267 () array!49921)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49923 0))(
  ( (array!49924 (arr!23988 (Array (_ BitVec 32) (_ BitVec 64))) (size!24429 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49923)

(declare-fun minValue!654 () V!27521)

(declare-fun zeroValue!654 () V!27521)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3028 (array!49923 array!49921 (_ BitVec 32) (_ BitVec 32) V!27521 V!27521 (_ BitVec 32) Int) ListLongMap!9933)

(assert (=> b!867131 (= lt!393272 (getCurrentListMapNoExtraKeys!3028 _keys!868 lt!393267 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27521)

(declare-fun _values!688 () array!49921)

(assert (=> b!867131 (= lt!393267 (array!49922 (store (arr!23987 _values!688) i!612 (ValueCellFull!7988 v!557)) (size!24428 _values!688)))))

(declare-fun lt!393276 () ListLongMap!9933)

(assert (=> b!867131 (= lt!393276 (getCurrentListMapNoExtraKeys!3028 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867132 () Bool)

(declare-fun res!588910 () Bool)

(assert (=> b!867132 (=> (not res!588910) (not e!483114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867132 (= res!588910 (validMask!0 mask!1196))))

(declare-fun b!867133 () Bool)

(declare-fun res!588914 () Bool)

(assert (=> b!867133 (=> (not res!588914) (not e!483114))))

(declare-datatypes ((List!16991 0))(
  ( (Nil!16988) (Cons!16987 (h!18124 (_ BitVec 64)) (t!23968 List!16991)) )
))
(declare-fun arrayNoDuplicates!0 (array!49923 (_ BitVec 32) List!16991) Bool)

(assert (=> b!867133 (= res!588914 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16988))))

(declare-fun b!867134 () Bool)

(declare-fun res!588911 () Bool)

(assert (=> b!867134 (=> (not res!588911) (not e!483114))))

(assert (=> b!867134 (= res!588911 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24429 _keys!868))))))

(declare-fun b!867135 () Bool)

(declare-datatypes ((Unit!29680 0))(
  ( (Unit!29681) )
))
(declare-fun e!483116 () Unit!29680)

(declare-fun Unit!29682 () Unit!29680)

(assert (=> b!867135 (= e!483116 Unit!29682)))

(declare-fun b!867136 () Bool)

(declare-fun res!588909 () Bool)

(assert (=> b!867136 (=> (not res!588909) (not e!483114))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867136 (= res!588909 (validKeyInArray!0 k0!854))))

(declare-fun b!867137 () Bool)

(declare-fun e!483121 () Bool)

(assert (=> b!867137 (= e!483120 (not e!483121))))

(declare-fun res!588916 () Bool)

(assert (=> b!867137 (=> res!588916 e!483121)))

(assert (=> b!867137 (= res!588916 (not (validKeyInArray!0 (select (arr!23988 _keys!868) from!1053))))))

(declare-fun lt!393271 () ListLongMap!9933)

(declare-fun lt!393277 () ListLongMap!9933)

(assert (=> b!867137 (= lt!393271 lt!393277)))

(declare-fun lt!393270 () ListLongMap!9933)

(declare-fun lt!393273 () tuple2!11162)

(declare-fun +!2385 (ListLongMap!9933 tuple2!11162) ListLongMap!9933)

(assert (=> b!867137 (= lt!393277 (+!2385 lt!393270 lt!393273))))

(assert (=> b!867137 (= lt!393271 (getCurrentListMapNoExtraKeys!3028 _keys!868 lt!393267 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!867137 (= lt!393273 (tuple2!11163 k0!854 v!557))))

(assert (=> b!867137 (= lt!393270 (getCurrentListMapNoExtraKeys!3028 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393268 () Unit!29680)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!562 (array!49923 array!49921 (_ BitVec 32) (_ BitVec 32) V!27521 V!27521 (_ BitVec 32) (_ BitVec 64) V!27521 (_ BitVec 32) Int) Unit!29680)

(assert (=> b!867137 (= lt!393268 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!562 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867138 () Bool)

(declare-fun res!588907 () Bool)

(assert (=> b!867138 (=> (not res!588907) (not e!483114))))

(assert (=> b!867138 (= res!588907 (and (= (select (arr!23988 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867139 () Bool)

(declare-fun e!483118 () Bool)

(declare-fun mapRes!26882 () Bool)

(assert (=> b!867139 (= e!483118 (and e!483117 mapRes!26882))))

(declare-fun condMapEmpty!26882 () Bool)

(declare-fun mapDefault!26882 () ValueCell!7988)

(assert (=> b!867139 (= condMapEmpty!26882 (= (arr!23987 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7988)) mapDefault!26882)))))

(declare-fun mapNonEmpty!26882 () Bool)

(declare-fun tp!51662 () Bool)

(assert (=> mapNonEmpty!26882 (= mapRes!26882 (and tp!51662 e!483119))))

(declare-fun mapRest!26882 () (Array (_ BitVec 32) ValueCell!7988))

(declare-fun mapValue!26882 () ValueCell!7988)

(declare-fun mapKey!26882 () (_ BitVec 32))

(assert (=> mapNonEmpty!26882 (= (arr!23987 _values!688) (store mapRest!26882 mapKey!26882 mapValue!26882))))

(declare-fun b!867140 () Bool)

(declare-fun e!483113 () Bool)

(assert (=> b!867140 (= e!483121 e!483113)))

(declare-fun res!588906 () Bool)

(assert (=> b!867140 (=> res!588906 e!483113)))

(assert (=> b!867140 (= res!588906 (= k0!854 (select (arr!23988 _keys!868) from!1053)))))

(assert (=> b!867140 (not (= (select (arr!23988 _keys!868) from!1053) k0!854))))

(declare-fun lt!393280 () Unit!29680)

(assert (=> b!867140 (= lt!393280 e!483116)))

(declare-fun c!92581 () Bool)

(assert (=> b!867140 (= c!92581 (= (select (arr!23988 _keys!868) from!1053) k0!854))))

(declare-fun lt!393266 () ListLongMap!9933)

(assert (=> b!867140 (= lt!393272 lt!393266)))

(declare-fun lt!393278 () tuple2!11162)

(assert (=> b!867140 (= lt!393266 (+!2385 lt!393277 lt!393278))))

(declare-fun lt!393281 () V!27521)

(assert (=> b!867140 (= lt!393278 (tuple2!11163 (select (arr!23988 _keys!868) from!1053) lt!393281))))

(declare-fun get!12696 (ValueCell!7988 V!27521) V!27521)

(declare-fun dynLambda!1206 (Int (_ BitVec 64)) V!27521)

(assert (=> b!867140 (= lt!393281 (get!12696 (select (arr!23987 _values!688) from!1053) (dynLambda!1206 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!588913 () Bool)

(assert (=> start!73972 (=> (not res!588913) (not e!483114))))

(assert (=> start!73972 (= res!588913 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24429 _keys!868))))))

(assert (=> start!73972 e!483114))

(assert (=> start!73972 tp_is_empty!16855))

(assert (=> start!73972 true))

(assert (=> start!73972 tp!51661))

(declare-fun array_inv!19016 (array!49923) Bool)

(assert (=> start!73972 (array_inv!19016 _keys!868)))

(declare-fun array_inv!19017 (array!49921) Bool)

(assert (=> start!73972 (and (array_inv!19017 _values!688) e!483118)))

(declare-fun b!867130 () Bool)

(declare-fun Unit!29683 () Unit!29680)

(assert (=> b!867130 (= e!483116 Unit!29683)))

(declare-fun lt!393274 () Unit!29680)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49923 (_ BitVec 32) (_ BitVec 32)) Unit!29680)

(assert (=> b!867130 (= lt!393274 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!867130 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16988)))

(declare-fun lt!393275 () Unit!29680)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49923 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29680)

(assert (=> b!867130 (= lt!393275 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867130 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393279 () Unit!29680)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49923 (_ BitVec 64) (_ BitVec 32) List!16991) Unit!29680)

(assert (=> b!867130 (= lt!393279 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16988))))

(assert (=> b!867130 false))

(declare-fun b!867141 () Bool)

(declare-fun res!588908 () Bool)

(assert (=> b!867141 (=> (not res!588908) (not e!483114))))

(assert (=> b!867141 (= res!588908 (and (= (size!24428 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24429 _keys!868) (size!24428 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26882 () Bool)

(assert (=> mapIsEmpty!26882 mapRes!26882))

(declare-fun b!867142 () Bool)

(declare-fun res!588915 () Bool)

(assert (=> b!867142 (=> (not res!588915) (not e!483114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49923 (_ BitVec 32)) Bool)

(assert (=> b!867142 (= res!588915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867143 () Bool)

(assert (=> b!867143 (= e!483113 true)))

(assert (=> b!867143 (= lt!393266 (+!2385 (+!2385 lt!393270 lt!393278) lt!393273))))

(declare-fun lt!393269 () Unit!29680)

(declare-fun addCommutativeForDiffKeys!528 (ListLongMap!9933 (_ BitVec 64) V!27521 (_ BitVec 64) V!27521) Unit!29680)

(assert (=> b!867143 (= lt!393269 (addCommutativeForDiffKeys!528 lt!393270 k0!854 v!557 (select (arr!23988 _keys!868) from!1053) lt!393281))))

(assert (= (and start!73972 res!588913) b!867132))

(assert (= (and b!867132 res!588910) b!867141))

(assert (= (and b!867141 res!588908) b!867142))

(assert (= (and b!867142 res!588915) b!867133))

(assert (= (and b!867133 res!588914) b!867134))

(assert (= (and b!867134 res!588911) b!867136))

(assert (= (and b!867136 res!588909) b!867138))

(assert (= (and b!867138 res!588907) b!867131))

(assert (= (and b!867131 res!588912) b!867137))

(assert (= (and b!867137 (not res!588916)) b!867140))

(assert (= (and b!867140 c!92581) b!867130))

(assert (= (and b!867140 (not c!92581)) b!867135))

(assert (= (and b!867140 (not res!588906)) b!867143))

(assert (= (and b!867139 condMapEmpty!26882) mapIsEmpty!26882))

(assert (= (and b!867139 (not condMapEmpty!26882)) mapNonEmpty!26882))

(get-info :version)

(assert (= (and mapNonEmpty!26882 ((_ is ValueCellFull!7988) mapValue!26882)) b!867128))

(assert (= (and b!867139 ((_ is ValueCellFull!7988) mapDefault!26882)) b!867129))

(assert (= start!73972 b!867139))

(declare-fun b_lambda!12085 () Bool)

(assert (=> (not b_lambda!12085) (not b!867140)))

(declare-fun t!23966 () Bool)

(declare-fun tb!4833 () Bool)

(assert (=> (and start!73972 (= defaultEntry!696 defaultEntry!696) t!23966) tb!4833))

(declare-fun result!9285 () Bool)

(assert (=> tb!4833 (= result!9285 tp_is_empty!16855)))

(assert (=> b!867140 t!23966))

(declare-fun b_and!24429 () Bool)

(assert (= b_and!24427 (and (=> t!23966 result!9285) b_and!24429)))

(declare-fun m!809141 () Bool)

(assert (=> b!867140 m!809141))

(declare-fun m!809143 () Bool)

(assert (=> b!867140 m!809143))

(declare-fun m!809145 () Bool)

(assert (=> b!867140 m!809145))

(declare-fun m!809147 () Bool)

(assert (=> b!867140 m!809147))

(assert (=> b!867140 m!809143))

(declare-fun m!809149 () Bool)

(assert (=> b!867140 m!809149))

(assert (=> b!867140 m!809145))

(declare-fun m!809151 () Bool)

(assert (=> b!867131 m!809151))

(declare-fun m!809153 () Bool)

(assert (=> b!867131 m!809153))

(declare-fun m!809155 () Bool)

(assert (=> b!867131 m!809155))

(declare-fun m!809157 () Bool)

(assert (=> mapNonEmpty!26882 m!809157))

(declare-fun m!809159 () Bool)

(assert (=> b!867142 m!809159))

(declare-fun m!809161 () Bool)

(assert (=> b!867143 m!809161))

(assert (=> b!867143 m!809161))

(declare-fun m!809163 () Bool)

(assert (=> b!867143 m!809163))

(assert (=> b!867143 m!809149))

(assert (=> b!867143 m!809149))

(declare-fun m!809165 () Bool)

(assert (=> b!867143 m!809165))

(declare-fun m!809167 () Bool)

(assert (=> b!867132 m!809167))

(declare-fun m!809169 () Bool)

(assert (=> b!867133 m!809169))

(declare-fun m!809171 () Bool)

(assert (=> b!867136 m!809171))

(declare-fun m!809173 () Bool)

(assert (=> b!867130 m!809173))

(declare-fun m!809175 () Bool)

(assert (=> b!867130 m!809175))

(declare-fun m!809177 () Bool)

(assert (=> b!867130 m!809177))

(declare-fun m!809179 () Bool)

(assert (=> b!867130 m!809179))

(declare-fun m!809181 () Bool)

(assert (=> b!867130 m!809181))

(declare-fun m!809183 () Bool)

(assert (=> b!867137 m!809183))

(assert (=> b!867137 m!809149))

(declare-fun m!809185 () Bool)

(assert (=> b!867137 m!809185))

(assert (=> b!867137 m!809149))

(declare-fun m!809187 () Bool)

(assert (=> b!867137 m!809187))

(declare-fun m!809189 () Bool)

(assert (=> b!867137 m!809189))

(declare-fun m!809191 () Bool)

(assert (=> b!867137 m!809191))

(declare-fun m!809193 () Bool)

(assert (=> b!867138 m!809193))

(declare-fun m!809195 () Bool)

(assert (=> start!73972 m!809195))

(declare-fun m!809197 () Bool)

(assert (=> start!73972 m!809197))

(check-sat tp_is_empty!16855 (not b!867132) (not b!867140) (not b_next!14719) (not b!867137) (not b_lambda!12085) (not start!73972) (not b!867143) (not b!867136) (not b!867133) (not b!867130) (not mapNonEmpty!26882) b_and!24429 (not b!867142) (not b!867131))
(check-sat b_and!24429 (not b_next!14719))
