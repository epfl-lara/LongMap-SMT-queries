; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99366 () Bool)

(assert start!99366)

(declare-fun b_free!24945 () Bool)

(declare-fun b_next!24945 () Bool)

(assert (=> start!99366 (= b_free!24945 (not b_next!24945))))

(declare-fun tp!87548 () Bool)

(declare-fun b_and!40757 () Bool)

(assert (=> start!99366 (= tp!87548 b_and!40757)))

(declare-fun b!1172195 () Bool)

(declare-fun e!666272 () Bool)

(assert (=> b!1172195 (= e!666272 true)))

(declare-fun lt!528146 () Bool)

(declare-datatypes ((List!25636 0))(
  ( (Nil!25633) (Cons!25632 (h!26841 (_ BitVec 64)) (t!37573 List!25636)) )
))
(declare-fun contains!6854 (List!25636 (_ BitVec 64)) Bool)

(assert (=> b!1172195 (= lt!528146 (contains!6854 Nil!25633 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172196 () Bool)

(declare-fun e!666274 () Bool)

(declare-fun e!666271 () Bool)

(assert (=> b!1172196 (= e!666274 e!666271)))

(declare-fun res!778247 () Bool)

(assert (=> b!1172196 (=> res!778247 e!666271)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1172196 (= res!778247 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44427 0))(
  ( (V!44428 (val!14794 Int)) )
))
(declare-fun zeroValue!944 () V!44427)

(declare-datatypes ((ValueCell!14028 0))(
  ( (ValueCellFull!14028 (v!17432 V!44427)) (EmptyCell!14028) )
))
(declare-datatypes ((array!75763 0))(
  ( (array!75764 (arr!36531 (Array (_ BitVec 32) ValueCell!14028)) (size!37067 (_ BitVec 32))) )
))
(declare-fun lt!528139 () array!75763)

(declare-datatypes ((tuple2!18900 0))(
  ( (tuple2!18901 (_1!9461 (_ BitVec 64)) (_2!9461 V!44427)) )
))
(declare-datatypes ((List!25637 0))(
  ( (Nil!25634) (Cons!25633 (h!26842 tuple2!18900) (t!37574 List!25637)) )
))
(declare-datatypes ((ListLongMap!16869 0))(
  ( (ListLongMap!16870 (toList!8450 List!25637)) )
))
(declare-fun lt!528140 () ListLongMap!16869)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44427)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!75765 0))(
  ( (array!75766 (arr!36532 (Array (_ BitVec 32) (_ BitVec 64))) (size!37068 (_ BitVec 32))) )
))
(declare-fun lt!528135 () array!75765)

(declare-fun getCurrentListMapNoExtraKeys!4914 (array!75765 array!75763 (_ BitVec 32) (_ BitVec 32) V!44427 V!44427 (_ BitVec 32) Int) ListLongMap!16869)

(assert (=> b!1172196 (= lt!528140 (getCurrentListMapNoExtraKeys!4914 lt!528135 lt!528139 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528137 () V!44427)

(declare-fun _values!996 () array!75763)

(assert (=> b!1172196 (= lt!528139 (array!75764 (store (arr!36531 _values!996) i!673 (ValueCellFull!14028 lt!528137)) (size!37067 _values!996)))))

(declare-fun dynLambda!2886 (Int (_ BitVec 64)) V!44427)

(assert (=> b!1172196 (= lt!528137 (dynLambda!2886 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75765)

(declare-fun lt!528147 () ListLongMap!16869)

(assert (=> b!1172196 (= lt!528147 (getCurrentListMapNoExtraKeys!4914 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172197 () Bool)

(declare-fun res!778246 () Bool)

(declare-fun e!666266 () Bool)

(assert (=> b!1172197 (=> (not res!778246) (not e!666266))))

(assert (=> b!1172197 (= res!778246 (and (= (size!37067 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37068 _keys!1208) (size!37067 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172198 () Bool)

(declare-fun res!778238 () Bool)

(assert (=> b!1172198 (=> (not res!778238) (not e!666266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75765 (_ BitVec 32)) Bool)

(assert (=> b!1172198 (= res!778238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172199 () Bool)

(declare-fun e!666270 () Bool)

(declare-fun e!666275 () Bool)

(assert (=> b!1172199 (= e!666270 e!666275)))

(declare-fun res!778242 () Bool)

(assert (=> b!1172199 (=> res!778242 e!666275)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1172199 (= res!778242 (not (= (select (arr!36532 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1172201 () Bool)

(declare-fun e!666267 () Bool)

(assert (=> b!1172201 (= e!666267 e!666272)))

(declare-fun res!778237 () Bool)

(assert (=> b!1172201 (=> res!778237 e!666272)))

(assert (=> b!1172201 (= res!778237 (or (bvsge (size!37068 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37068 _keys!1208)) (bvsge from!1455 (size!37068 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!75765 (_ BitVec 32) List!25636) Bool)

(assert (=> b!1172201 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25633)))

(declare-datatypes ((Unit!38652 0))(
  ( (Unit!38653) )
))
(declare-fun lt!528143 () Unit!38652)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75765 (_ BitVec 32) (_ BitVec 32)) Unit!38652)

(assert (=> b!1172201 (= lt!528143 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172201 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528144 () Unit!38652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75765 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38652)

(assert (=> b!1172201 (= lt!528144 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!46040 () Bool)

(declare-fun mapRes!46040 () Bool)

(assert (=> mapIsEmpty!46040 mapRes!46040))

(declare-fun b!1172202 () Bool)

(declare-fun e!666265 () Bool)

(assert (=> b!1172202 (= e!666265 (not e!666274))))

(declare-fun res!778243 () Bool)

(assert (=> b!1172202 (=> res!778243 e!666274)))

(assert (=> b!1172202 (= res!778243 (bvsgt from!1455 i!673))))

(assert (=> b!1172202 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528136 () Unit!38652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75765 (_ BitVec 64) (_ BitVec 32)) Unit!38652)

(assert (=> b!1172202 (= lt!528136 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172203 () Bool)

(declare-fun e!666269 () Bool)

(assert (=> b!1172203 (= e!666271 e!666269)))

(declare-fun res!778248 () Bool)

(assert (=> b!1172203 (=> res!778248 e!666269)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172203 (= res!778248 (not (validKeyInArray!0 (select (arr!36532 _keys!1208) from!1455))))))

(declare-fun lt!528141 () ListLongMap!16869)

(declare-fun lt!528142 () ListLongMap!16869)

(assert (=> b!1172203 (= lt!528141 lt!528142)))

(declare-fun lt!528138 () ListLongMap!16869)

(declare-fun -!1518 (ListLongMap!16869 (_ BitVec 64)) ListLongMap!16869)

(assert (=> b!1172203 (= lt!528142 (-!1518 lt!528138 k0!934))))

(assert (=> b!1172203 (= lt!528141 (getCurrentListMapNoExtraKeys!4914 lt!528135 lt!528139 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172203 (= lt!528138 (getCurrentListMapNoExtraKeys!4914 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528145 () Unit!38652)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!745 (array!75765 array!75763 (_ BitVec 32) (_ BitVec 32) V!44427 V!44427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38652)

(assert (=> b!1172203 (= lt!528145 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!745 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172204 () Bool)

(declare-fun e!666277 () Bool)

(declare-fun tp_is_empty!29475 () Bool)

(assert (=> b!1172204 (= e!666277 tp_is_empty!29475)))

(declare-fun b!1172205 () Bool)

(declare-fun e!666268 () Bool)

(assert (=> b!1172205 (= e!666268 (and e!666277 mapRes!46040))))

(declare-fun condMapEmpty!46040 () Bool)

(declare-fun mapDefault!46040 () ValueCell!14028)

(assert (=> b!1172205 (= condMapEmpty!46040 (= (arr!36531 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14028)) mapDefault!46040)))))

(declare-fun b!1172206 () Bool)

(declare-fun res!778241 () Bool)

(assert (=> b!1172206 (=> (not res!778241) (not e!666266))))

(assert (=> b!1172206 (= res!778241 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46040 () Bool)

(declare-fun tp!87549 () Bool)

(declare-fun e!666273 () Bool)

(assert (=> mapNonEmpty!46040 (= mapRes!46040 (and tp!87549 e!666273))))

(declare-fun mapRest!46040 () (Array (_ BitVec 32) ValueCell!14028))

(declare-fun mapValue!46040 () ValueCell!14028)

(declare-fun mapKey!46040 () (_ BitVec 32))

(assert (=> mapNonEmpty!46040 (= (arr!36531 _values!996) (store mapRest!46040 mapKey!46040 mapValue!46040))))

(declare-fun b!1172200 () Bool)

(declare-fun res!778252 () Bool)

(assert (=> b!1172200 (=> res!778252 e!666272)))

(assert (=> b!1172200 (= res!778252 (contains!6854 Nil!25633 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!778245 () Bool)

(assert (=> start!99366 (=> (not res!778245) (not e!666266))))

(assert (=> start!99366 (= res!778245 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37068 _keys!1208))))))

(assert (=> start!99366 e!666266))

(assert (=> start!99366 tp_is_empty!29475))

(declare-fun array_inv!27914 (array!75765) Bool)

(assert (=> start!99366 (array_inv!27914 _keys!1208)))

(assert (=> start!99366 true))

(assert (=> start!99366 tp!87548))

(declare-fun array_inv!27915 (array!75763) Bool)

(assert (=> start!99366 (and (array_inv!27915 _values!996) e!666268)))

(declare-fun b!1172207 () Bool)

(assert (=> b!1172207 (= e!666266 e!666265)))

(declare-fun res!778240 () Bool)

(assert (=> b!1172207 (=> (not res!778240) (not e!666265))))

(assert (=> b!1172207 (= res!778240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528135 mask!1564))))

(assert (=> b!1172207 (= lt!528135 (array!75766 (store (arr!36532 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37068 _keys!1208)))))

(declare-fun b!1172208 () Bool)

(declare-fun res!778244 () Bool)

(assert (=> b!1172208 (=> (not res!778244) (not e!666266))))

(assert (=> b!1172208 (= res!778244 (= (select (arr!36532 _keys!1208) i!673) k0!934))))

(declare-fun b!1172209 () Bool)

(declare-fun res!778236 () Bool)

(assert (=> b!1172209 (=> (not res!778236) (not e!666265))))

(assert (=> b!1172209 (= res!778236 (arrayNoDuplicates!0 lt!528135 #b00000000000000000000000000000000 Nil!25633))))

(declare-fun b!1172210 () Bool)

(declare-fun res!778249 () Bool)

(assert (=> b!1172210 (=> (not res!778249) (not e!666266))))

(assert (=> b!1172210 (= res!778249 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25633))))

(declare-fun b!1172211 () Bool)

(assert (=> b!1172211 (= e!666275 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172212 () Bool)

(declare-fun res!778234 () Bool)

(assert (=> b!1172212 (=> (not res!778234) (not e!666266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172212 (= res!778234 (validMask!0 mask!1564))))

(declare-fun b!1172213 () Bool)

(declare-fun res!778251 () Bool)

(assert (=> b!1172213 (=> (not res!778251) (not e!666266))))

(assert (=> b!1172213 (= res!778251 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37068 _keys!1208))))))

(declare-fun b!1172214 () Bool)

(assert (=> b!1172214 (= e!666269 e!666267)))

(declare-fun res!778250 () Bool)

(assert (=> b!1172214 (=> res!778250 e!666267)))

(assert (=> b!1172214 (= res!778250 (not (= (select (arr!36532 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1172214 e!666270))

(declare-fun res!778239 () Bool)

(assert (=> b!1172214 (=> (not res!778239) (not e!666270))))

(declare-fun +!3773 (ListLongMap!16869 tuple2!18900) ListLongMap!16869)

(declare-fun get!18635 (ValueCell!14028 V!44427) V!44427)

(assert (=> b!1172214 (= res!778239 (= lt!528140 (+!3773 lt!528142 (tuple2!18901 (select (arr!36532 _keys!1208) from!1455) (get!18635 (select (arr!36531 _values!996) from!1455) lt!528137)))))))

(declare-fun b!1172215 () Bool)

(assert (=> b!1172215 (= e!666273 tp_is_empty!29475)))

(declare-fun b!1172216 () Bool)

(declare-fun res!778235 () Bool)

(assert (=> b!1172216 (=> res!778235 e!666272)))

(declare-fun noDuplicate!1615 (List!25636) Bool)

(assert (=> b!1172216 (= res!778235 (not (noDuplicate!1615 Nil!25633)))))

(assert (= (and start!99366 res!778245) b!1172212))

(assert (= (and b!1172212 res!778234) b!1172197))

(assert (= (and b!1172197 res!778246) b!1172198))

(assert (= (and b!1172198 res!778238) b!1172210))

(assert (= (and b!1172210 res!778249) b!1172213))

(assert (= (and b!1172213 res!778251) b!1172206))

(assert (= (and b!1172206 res!778241) b!1172208))

(assert (= (and b!1172208 res!778244) b!1172207))

(assert (= (and b!1172207 res!778240) b!1172209))

(assert (= (and b!1172209 res!778236) b!1172202))

(assert (= (and b!1172202 (not res!778243)) b!1172196))

(assert (= (and b!1172196 (not res!778247)) b!1172203))

(assert (= (and b!1172203 (not res!778248)) b!1172214))

(assert (= (and b!1172214 res!778239) b!1172199))

(assert (= (and b!1172199 (not res!778242)) b!1172211))

(assert (= (and b!1172214 (not res!778250)) b!1172201))

(assert (= (and b!1172201 (not res!778237)) b!1172216))

(assert (= (and b!1172216 (not res!778235)) b!1172200))

(assert (= (and b!1172200 (not res!778252)) b!1172195))

(assert (= (and b!1172205 condMapEmpty!46040) mapIsEmpty!46040))

(assert (= (and b!1172205 (not condMapEmpty!46040)) mapNonEmpty!46040))

(get-info :version)

(assert (= (and mapNonEmpty!46040 ((_ is ValueCellFull!14028) mapValue!46040)) b!1172215))

(assert (= (and b!1172205 ((_ is ValueCellFull!14028) mapDefault!46040)) b!1172204))

(assert (= start!99366 b!1172205))

(declare-fun b_lambda!20089 () Bool)

(assert (=> (not b_lambda!20089) (not b!1172196)))

(declare-fun t!37572 () Bool)

(declare-fun tb!9757 () Bool)

(assert (=> (and start!99366 (= defaultEntry!1004 defaultEntry!1004) t!37572) tb!9757))

(declare-fun result!20081 () Bool)

(assert (=> tb!9757 (= result!20081 tp_is_empty!29475)))

(assert (=> b!1172196 t!37572))

(declare-fun b_and!40759 () Bool)

(assert (= b_and!40757 (and (=> t!37572 result!20081) b_and!40759)))

(declare-fun m!1080011 () Bool)

(assert (=> b!1172203 m!1080011))

(declare-fun m!1080013 () Bool)

(assert (=> b!1172203 m!1080013))

(declare-fun m!1080015 () Bool)

(assert (=> b!1172203 m!1080015))

(declare-fun m!1080017 () Bool)

(assert (=> b!1172203 m!1080017))

(declare-fun m!1080019 () Bool)

(assert (=> b!1172203 m!1080019))

(declare-fun m!1080021 () Bool)

(assert (=> b!1172203 m!1080021))

(assert (=> b!1172203 m!1080019))

(declare-fun m!1080023 () Bool)

(assert (=> b!1172198 m!1080023))

(declare-fun m!1080025 () Bool)

(assert (=> b!1172196 m!1080025))

(declare-fun m!1080027 () Bool)

(assert (=> b!1172196 m!1080027))

(declare-fun m!1080029 () Bool)

(assert (=> b!1172196 m!1080029))

(declare-fun m!1080031 () Bool)

(assert (=> b!1172196 m!1080031))

(declare-fun m!1080033 () Bool)

(assert (=> b!1172207 m!1080033))

(declare-fun m!1080035 () Bool)

(assert (=> b!1172207 m!1080035))

(declare-fun m!1080037 () Bool)

(assert (=> b!1172211 m!1080037))

(declare-fun m!1080039 () Bool)

(assert (=> start!99366 m!1080039))

(declare-fun m!1080041 () Bool)

(assert (=> start!99366 m!1080041))

(declare-fun m!1080043 () Bool)

(assert (=> b!1172210 m!1080043))

(declare-fun m!1080045 () Bool)

(assert (=> b!1172208 m!1080045))

(declare-fun m!1080047 () Bool)

(assert (=> b!1172212 m!1080047))

(declare-fun m!1080049 () Bool)

(assert (=> mapNonEmpty!46040 m!1080049))

(assert (=> b!1172214 m!1080019))

(declare-fun m!1080051 () Bool)

(assert (=> b!1172214 m!1080051))

(assert (=> b!1172214 m!1080051))

(declare-fun m!1080053 () Bool)

(assert (=> b!1172214 m!1080053))

(declare-fun m!1080055 () Bool)

(assert (=> b!1172214 m!1080055))

(assert (=> b!1172199 m!1080019))

(declare-fun m!1080057 () Bool)

(assert (=> b!1172216 m!1080057))

(declare-fun m!1080059 () Bool)

(assert (=> b!1172206 m!1080059))

(declare-fun m!1080061 () Bool)

(assert (=> b!1172195 m!1080061))

(declare-fun m!1080063 () Bool)

(assert (=> b!1172201 m!1080063))

(declare-fun m!1080065 () Bool)

(assert (=> b!1172201 m!1080065))

(declare-fun m!1080067 () Bool)

(assert (=> b!1172201 m!1080067))

(declare-fun m!1080069 () Bool)

(assert (=> b!1172201 m!1080069))

(declare-fun m!1080071 () Bool)

(assert (=> b!1172200 m!1080071))

(declare-fun m!1080073 () Bool)

(assert (=> b!1172202 m!1080073))

(declare-fun m!1080075 () Bool)

(assert (=> b!1172202 m!1080075))

(declare-fun m!1080077 () Bool)

(assert (=> b!1172209 m!1080077))

(check-sat (not b!1172211) (not b!1172210) (not b!1172196) (not b!1172203) (not b!1172209) (not b!1172216) (not b!1172212) (not b_next!24945) tp_is_empty!29475 (not b!1172202) (not b!1172198) b_and!40759 (not mapNonEmpty!46040) (not b!1172200) (not b!1172214) (not b!1172201) (not start!99366) (not b_lambda!20089) (not b!1172207) (not b!1172206) (not b!1172195))
(check-sat b_and!40759 (not b_next!24945))
