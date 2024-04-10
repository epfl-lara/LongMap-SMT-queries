; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101720 () Bool)

(assert start!101720)

(declare-fun b_free!26409 () Bool)

(declare-fun b_next!26409 () Bool)

(assert (=> start!101720 (= b_free!26409 (not b_next!26409))))

(declare-fun tp!92272 () Bool)

(declare-fun b_and!44079 () Bool)

(assert (=> start!101720 (= tp!92272 b_and!44079)))

(declare-fun res!813381 () Bool)

(declare-fun e!695229 () Bool)

(assert (=> start!101720 (=> (not res!813381) (not e!695229))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!79009 0))(
  ( (array!79010 (arr!38131 (Array (_ BitVec 32) (_ BitVec 64))) (size!38667 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79009)

(assert (=> start!101720 (= res!813381 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38667 _keys!1208))))))

(assert (=> start!101720 e!695229))

(declare-fun tp_is_empty!31113 () Bool)

(assert (=> start!101720 tp_is_empty!31113))

(declare-fun array_inv!29008 (array!79009) Bool)

(assert (=> start!101720 (array_inv!29008 _keys!1208)))

(assert (=> start!101720 true))

(assert (=> start!101720 tp!92272))

(declare-datatypes ((V!46611 0))(
  ( (V!46612 (val!15613 Int)) )
))
(declare-datatypes ((ValueCell!14847 0))(
  ( (ValueCellFull!14847 (v!18275 V!46611)) (EmptyCell!14847) )
))
(declare-datatypes ((array!79011 0))(
  ( (array!79012 (arr!38132 (Array (_ BitVec 32) ValueCell!14847)) (size!38668 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79011)

(declare-fun e!695235 () Bool)

(declare-fun array_inv!29009 (array!79011) Bool)

(assert (=> start!101720 (and (array_inv!29009 _values!996) e!695235)))

(declare-fun mapIsEmpty!48568 () Bool)

(declare-fun mapRes!48568 () Bool)

(assert (=> mapIsEmpty!48568 mapRes!48568))

(declare-fun b!1224097 () Bool)

(declare-fun res!813371 () Bool)

(assert (=> b!1224097 (=> (not res!813371) (not e!695229))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79009 (_ BitVec 32)) Bool)

(assert (=> b!1224097 (= res!813371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224098 () Bool)

(declare-fun res!813378 () Bool)

(declare-fun e!695231 () Bool)

(assert (=> b!1224098 (=> (not res!813378) (not e!695231))))

(declare-datatypes ((tuple2!20122 0))(
  ( (tuple2!20123 (_1!10072 (_ BitVec 64)) (_2!10072 V!46611)) )
))
(declare-datatypes ((List!26922 0))(
  ( (Nil!26919) (Cons!26918 (h!28127 tuple2!20122) (t!40311 List!26922)) )
))
(declare-datatypes ((ListLongMap!18091 0))(
  ( (ListLongMap!18092 (toList!9061 List!26922)) )
))
(declare-fun lt!557300 () ListLongMap!18091)

(declare-fun lt!557295 () ListLongMap!18091)

(declare-fun lt!557305 () tuple2!20122)

(declare-fun +!4118 (ListLongMap!18091 tuple2!20122) ListLongMap!18091)

(assert (=> b!1224098 (= res!813378 (= lt!557300 (+!4118 lt!557295 lt!557305)))))

(declare-fun b!1224099 () Bool)

(declare-fun e!695234 () Bool)

(assert (=> b!1224099 (= e!695235 (and e!695234 mapRes!48568))))

(declare-fun condMapEmpty!48568 () Bool)

(declare-fun mapDefault!48568 () ValueCell!14847)

(assert (=> b!1224099 (= condMapEmpty!48568 (= (arr!38132 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14847)) mapDefault!48568)))))

(declare-fun b!1224100 () Bool)

(assert (=> b!1224100 (= e!695234 tp_is_empty!31113)))

(declare-fun b!1224101 () Bool)

(declare-fun e!695230 () Bool)

(assert (=> b!1224101 (= e!695229 e!695230)))

(declare-fun res!813373 () Bool)

(assert (=> b!1224101 (=> (not res!813373) (not e!695230))))

(declare-fun lt!557306 () array!79009)

(assert (=> b!1224101 (= res!813373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557306 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224101 (= lt!557306 (array!79010 (store (arr!38131 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38667 _keys!1208)))))

(declare-fun b!1224102 () Bool)

(declare-datatypes ((Unit!40561 0))(
  ( (Unit!40562) )
))
(declare-fun e!695236 () Unit!40561)

(declare-fun Unit!40563 () Unit!40561)

(assert (=> b!1224102 (= e!695236 Unit!40563)))

(declare-fun lt!557303 () Unit!40561)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79009 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40561)

(assert (=> b!1224102 (= lt!557303 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!79009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224102 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557292 () Unit!40561)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79009 (_ BitVec 32) (_ BitVec 32)) Unit!40561)

(assert (=> b!1224102 (= lt!557292 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26923 0))(
  ( (Nil!26920) (Cons!26919 (h!28128 (_ BitVec 64)) (t!40312 List!26923)) )
))
(declare-fun arrayNoDuplicates!0 (array!79009 (_ BitVec 32) List!26923) Bool)

(assert (=> b!1224102 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26920)))

(declare-fun lt!557299 () Unit!40561)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79009 (_ BitVec 64) (_ BitVec 32) List!26923) Unit!40561)

(assert (=> b!1224102 (= lt!557299 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26920))))

(assert (=> b!1224102 false))

(declare-fun b!1224103 () Bool)

(declare-fun res!813375 () Bool)

(assert (=> b!1224103 (=> (not res!813375) (not e!695230))))

(assert (=> b!1224103 (= res!813375 (arrayNoDuplicates!0 lt!557306 #b00000000000000000000000000000000 Nil!26920))))

(declare-fun b!1224104 () Bool)

(declare-fun e!695233 () Bool)

(assert (=> b!1224104 (= e!695233 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224105 () Bool)

(declare-fun e!695239 () Bool)

(assert (=> b!1224105 (= e!695239 (bvslt from!1455 (size!38667 _keys!1208)))))

(assert (=> b!1224105 e!695231))

(declare-fun res!813377 () Bool)

(assert (=> b!1224105 (=> (not res!813377) (not e!695231))))

(assert (=> b!1224105 (= res!813377 (not (= (select (arr!38131 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557293 () Unit!40561)

(assert (=> b!1224105 (= lt!557293 e!695236)))

(declare-fun c!120434 () Bool)

(assert (=> b!1224105 (= c!120434 (= (select (arr!38131 _keys!1208) from!1455) k0!934))))

(declare-fun e!695237 () Bool)

(assert (=> b!1224105 e!695237))

(declare-fun res!813383 () Bool)

(assert (=> b!1224105 (=> (not res!813383) (not e!695237))))

(declare-fun lt!557298 () ListLongMap!18091)

(declare-fun lt!557294 () ListLongMap!18091)

(assert (=> b!1224105 (= res!813383 (= lt!557298 (+!4118 lt!557294 lt!557305)))))

(declare-fun lt!557301 () V!46611)

(declare-fun get!19475 (ValueCell!14847 V!46611) V!46611)

(assert (=> b!1224105 (= lt!557305 (tuple2!20123 (select (arr!38131 _keys!1208) from!1455) (get!19475 (select (arr!38132 _values!996) from!1455) lt!557301)))))

(declare-fun b!1224106 () Bool)

(declare-fun e!695238 () Bool)

(assert (=> b!1224106 (= e!695230 (not e!695238))))

(declare-fun res!813369 () Bool)

(assert (=> b!1224106 (=> res!813369 e!695238)))

(assert (=> b!1224106 (= res!813369 (bvsgt from!1455 i!673))))

(assert (=> b!1224106 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557297 () Unit!40561)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79009 (_ BitVec 64) (_ BitVec 32)) Unit!40561)

(assert (=> b!1224106 (= lt!557297 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224107 () Bool)

(declare-fun Unit!40564 () Unit!40561)

(assert (=> b!1224107 (= e!695236 Unit!40564)))

(declare-fun b!1224108 () Bool)

(declare-fun res!813372 () Bool)

(assert (=> b!1224108 (=> (not res!813372) (not e!695229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224108 (= res!813372 (validMask!0 mask!1564))))

(declare-fun b!1224109 () Bool)

(declare-fun lt!557304 () ListLongMap!18091)

(assert (=> b!1224109 (= e!695231 (= lt!557294 lt!557304))))

(declare-fun b!1224110 () Bool)

(declare-fun res!813384 () Bool)

(assert (=> b!1224110 (=> (not res!813384) (not e!695229))))

(assert (=> b!1224110 (= res!813384 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38667 _keys!1208))))))

(declare-fun b!1224111 () Bool)

(assert (=> b!1224111 (= e!695237 e!695233)))

(declare-fun res!813382 () Bool)

(assert (=> b!1224111 (=> res!813382 e!695233)))

(assert (=> b!1224111 (= res!813382 (not (= (select (arr!38131 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224112 () Bool)

(declare-fun e!695227 () Bool)

(assert (=> b!1224112 (= e!695227 tp_is_empty!31113)))

(declare-fun b!1224113 () Bool)

(declare-fun e!695228 () Bool)

(assert (=> b!1224113 (= e!695228 e!695239)))

(declare-fun res!813385 () Bool)

(assert (=> b!1224113 (=> res!813385 e!695239)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224113 (= res!813385 (not (validKeyInArray!0 (select (arr!38131 _keys!1208) from!1455))))))

(assert (=> b!1224113 (= lt!557304 lt!557294)))

(declare-fun -!1963 (ListLongMap!18091 (_ BitVec 64)) ListLongMap!18091)

(assert (=> b!1224113 (= lt!557294 (-!1963 lt!557295 k0!934))))

(declare-fun zeroValue!944 () V!46611)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!557302 () array!79011)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46611)

(declare-fun getCurrentListMapNoExtraKeys!5483 (array!79009 array!79011 (_ BitVec 32) (_ BitVec 32) V!46611 V!46611 (_ BitVec 32) Int) ListLongMap!18091)

(assert (=> b!1224113 (= lt!557304 (getCurrentListMapNoExtraKeys!5483 lt!557306 lt!557302 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224113 (= lt!557295 (getCurrentListMapNoExtraKeys!5483 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557296 () Unit!40561)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1170 (array!79009 array!79011 (_ BitVec 32) (_ BitVec 32) V!46611 V!46611 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40561)

(assert (=> b!1224113 (= lt!557296 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1170 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224114 () Bool)

(declare-fun res!813379 () Bool)

(assert (=> b!1224114 (=> (not res!813379) (not e!695229))))

(assert (=> b!1224114 (= res!813379 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26920))))

(declare-fun mapNonEmpty!48568 () Bool)

(declare-fun tp!92273 () Bool)

(assert (=> mapNonEmpty!48568 (= mapRes!48568 (and tp!92273 e!695227))))

(declare-fun mapRest!48568 () (Array (_ BitVec 32) ValueCell!14847))

(declare-fun mapValue!48568 () ValueCell!14847)

(declare-fun mapKey!48568 () (_ BitVec 32))

(assert (=> mapNonEmpty!48568 (= (arr!38132 _values!996) (store mapRest!48568 mapKey!48568 mapValue!48568))))

(declare-fun b!1224115 () Bool)

(assert (=> b!1224115 (= e!695238 e!695228)))

(declare-fun res!813380 () Bool)

(assert (=> b!1224115 (=> res!813380 e!695228)))

(assert (=> b!1224115 (= res!813380 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1224115 (= lt!557298 (getCurrentListMapNoExtraKeys!5483 lt!557306 lt!557302 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1224115 (= lt!557302 (array!79012 (store (arr!38132 _values!996) i!673 (ValueCellFull!14847 lt!557301)) (size!38668 _values!996)))))

(declare-fun dynLambda!3356 (Int (_ BitVec 64)) V!46611)

(assert (=> b!1224115 (= lt!557301 (dynLambda!3356 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1224115 (= lt!557300 (getCurrentListMapNoExtraKeys!5483 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224116 () Bool)

(declare-fun res!813374 () Bool)

(assert (=> b!1224116 (=> (not res!813374) (not e!695229))))

(assert (=> b!1224116 (= res!813374 (= (select (arr!38131 _keys!1208) i!673) k0!934))))

(declare-fun b!1224117 () Bool)

(declare-fun res!813376 () Bool)

(assert (=> b!1224117 (=> (not res!813376) (not e!695229))))

(assert (=> b!1224117 (= res!813376 (and (= (size!38668 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38667 _keys!1208) (size!38668 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224118 () Bool)

(declare-fun res!813370 () Bool)

(assert (=> b!1224118 (=> (not res!813370) (not e!695229))))

(assert (=> b!1224118 (= res!813370 (validKeyInArray!0 k0!934))))

(assert (= (and start!101720 res!813381) b!1224108))

(assert (= (and b!1224108 res!813372) b!1224117))

(assert (= (and b!1224117 res!813376) b!1224097))

(assert (= (and b!1224097 res!813371) b!1224114))

(assert (= (and b!1224114 res!813379) b!1224110))

(assert (= (and b!1224110 res!813384) b!1224118))

(assert (= (and b!1224118 res!813370) b!1224116))

(assert (= (and b!1224116 res!813374) b!1224101))

(assert (= (and b!1224101 res!813373) b!1224103))

(assert (= (and b!1224103 res!813375) b!1224106))

(assert (= (and b!1224106 (not res!813369)) b!1224115))

(assert (= (and b!1224115 (not res!813380)) b!1224113))

(assert (= (and b!1224113 (not res!813385)) b!1224105))

(assert (= (and b!1224105 res!813383) b!1224111))

(assert (= (and b!1224111 (not res!813382)) b!1224104))

(assert (= (and b!1224105 c!120434) b!1224102))

(assert (= (and b!1224105 (not c!120434)) b!1224107))

(assert (= (and b!1224105 res!813377) b!1224098))

(assert (= (and b!1224098 res!813378) b!1224109))

(assert (= (and b!1224099 condMapEmpty!48568) mapIsEmpty!48568))

(assert (= (and b!1224099 (not condMapEmpty!48568)) mapNonEmpty!48568))

(get-info :version)

(assert (= (and mapNonEmpty!48568 ((_ is ValueCellFull!14847) mapValue!48568)) b!1224112))

(assert (= (and b!1224099 ((_ is ValueCellFull!14847) mapDefault!48568)) b!1224100))

(assert (= start!101720 b!1224099))

(declare-fun b_lambda!22389 () Bool)

(assert (=> (not b_lambda!22389) (not b!1224115)))

(declare-fun t!40310 () Bool)

(declare-fun tb!11209 () Bool)

(assert (=> (and start!101720 (= defaultEntry!1004 defaultEntry!1004) t!40310) tb!11209))

(declare-fun result!23031 () Bool)

(assert (=> tb!11209 (= result!23031 tp_is_empty!31113)))

(assert (=> b!1224115 t!40310))

(declare-fun b_and!44081 () Bool)

(assert (= b_and!44079 (and (=> t!40310 result!23031) b_and!44081)))

(declare-fun m!1129109 () Bool)

(assert (=> b!1224102 m!1129109))

(declare-fun m!1129111 () Bool)

(assert (=> b!1224102 m!1129111))

(declare-fun m!1129113 () Bool)

(assert (=> b!1224102 m!1129113))

(declare-fun m!1129115 () Bool)

(assert (=> b!1224102 m!1129115))

(declare-fun m!1129117 () Bool)

(assert (=> b!1224102 m!1129117))

(declare-fun m!1129119 () Bool)

(assert (=> b!1224105 m!1129119))

(declare-fun m!1129121 () Bool)

(assert (=> b!1224105 m!1129121))

(declare-fun m!1129123 () Bool)

(assert (=> b!1224105 m!1129123))

(assert (=> b!1224105 m!1129123))

(declare-fun m!1129125 () Bool)

(assert (=> b!1224105 m!1129125))

(declare-fun m!1129127 () Bool)

(assert (=> start!101720 m!1129127))

(declare-fun m!1129129 () Bool)

(assert (=> start!101720 m!1129129))

(declare-fun m!1129131 () Bool)

(assert (=> b!1224118 m!1129131))

(declare-fun m!1129133 () Bool)

(assert (=> b!1224106 m!1129133))

(declare-fun m!1129135 () Bool)

(assert (=> b!1224106 m!1129135))

(declare-fun m!1129137 () Bool)

(assert (=> b!1224101 m!1129137))

(declare-fun m!1129139 () Bool)

(assert (=> b!1224101 m!1129139))

(declare-fun m!1129141 () Bool)

(assert (=> b!1224115 m!1129141))

(declare-fun m!1129143 () Bool)

(assert (=> b!1224115 m!1129143))

(declare-fun m!1129145 () Bool)

(assert (=> b!1224115 m!1129145))

(declare-fun m!1129147 () Bool)

(assert (=> b!1224115 m!1129147))

(declare-fun m!1129149 () Bool)

(assert (=> b!1224113 m!1129149))

(declare-fun m!1129151 () Bool)

(assert (=> b!1224113 m!1129151))

(declare-fun m!1129153 () Bool)

(assert (=> b!1224113 m!1129153))

(declare-fun m!1129155 () Bool)

(assert (=> b!1224113 m!1129155))

(assert (=> b!1224113 m!1129119))

(declare-fun m!1129157 () Bool)

(assert (=> b!1224113 m!1129157))

(assert (=> b!1224113 m!1129119))

(declare-fun m!1129159 () Bool)

(assert (=> b!1224116 m!1129159))

(assert (=> b!1224111 m!1129119))

(declare-fun m!1129161 () Bool)

(assert (=> b!1224108 m!1129161))

(declare-fun m!1129163 () Bool)

(assert (=> b!1224104 m!1129163))

(declare-fun m!1129165 () Bool)

(assert (=> b!1224114 m!1129165))

(declare-fun m!1129167 () Bool)

(assert (=> b!1224098 m!1129167))

(declare-fun m!1129169 () Bool)

(assert (=> b!1224097 m!1129169))

(declare-fun m!1129171 () Bool)

(assert (=> b!1224103 m!1129171))

(declare-fun m!1129173 () Bool)

(assert (=> mapNonEmpty!48568 m!1129173))

(check-sat (not start!101720) (not b!1224108) (not b!1224101) (not b_lambda!22389) (not b!1224118) tp_is_empty!31113 (not mapNonEmpty!48568) (not b!1224098) (not b!1224102) (not b_next!26409) (not b!1224106) (not b!1224104) (not b!1224105) (not b!1224103) (not b!1224115) (not b!1224114) b_and!44081 (not b!1224097) (not b!1224113))
(check-sat b_and!44081 (not b_next!26409))
