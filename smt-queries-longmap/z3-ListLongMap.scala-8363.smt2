; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101754 () Bool)

(assert start!101754)

(declare-fun b_free!26449 () Bool)

(declare-fun b_next!26449 () Bool)

(assert (=> start!101754 (= b_free!26449 (not b_next!26449))))

(declare-fun tp!92393 () Bool)

(declare-fun b_and!44141 () Bool)

(assert (=> start!101754 (= tp!92393 b_and!44141)))

(declare-fun b!1225272 () Bool)

(declare-fun res!814259 () Bool)

(declare-fun e!695907 () Bool)

(assert (=> b!1225272 (=> (not res!814259) (not e!695907))))

(declare-datatypes ((array!79008 0))(
  ( (array!79009 (arr!38131 (Array (_ BitVec 32) (_ BitVec 64))) (size!38669 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79008)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1225272 (= res!814259 (= (select (arr!38131 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!48628 () Bool)

(declare-fun mapRes!48628 () Bool)

(assert (=> mapIsEmpty!48628 mapRes!48628))

(declare-fun b!1225273 () Bool)

(declare-fun e!695901 () Bool)

(assert (=> b!1225273 (= e!695907 e!695901)))

(declare-fun res!814257 () Bool)

(assert (=> b!1225273 (=> (not res!814257) (not e!695901))))

(declare-fun lt!558175 () array!79008)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79008 (_ BitVec 32)) Bool)

(assert (=> b!1225273 (= res!814257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558175 mask!1564))))

(assert (=> b!1225273 (= lt!558175 (array!79009 (store (arr!38131 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38669 _keys!1208)))))

(declare-fun b!1225274 () Bool)

(declare-fun e!695909 () Bool)

(declare-fun tp_is_empty!31153 () Bool)

(assert (=> b!1225274 (= e!695909 tp_is_empty!31153)))

(declare-fun b!1225275 () Bool)

(declare-fun e!695911 () Bool)

(declare-fun e!695910 () Bool)

(assert (=> b!1225275 (= e!695911 e!695910)))

(declare-fun res!814264 () Bool)

(assert (=> b!1225275 (=> res!814264 e!695910)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1225275 (= res!814264 (not (= (select (arr!38131 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!48628 () Bool)

(declare-fun tp!92392 () Bool)

(assert (=> mapNonEmpty!48628 (= mapRes!48628 (and tp!92392 e!695909))))

(declare-datatypes ((V!46665 0))(
  ( (V!46666 (val!15633 Int)) )
))
(declare-datatypes ((ValueCell!14867 0))(
  ( (ValueCellFull!14867 (v!18294 V!46665)) (EmptyCell!14867) )
))
(declare-fun mapValue!48628 () ValueCell!14867)

(declare-fun mapRest!48628 () (Array (_ BitVec 32) ValueCell!14867))

(declare-datatypes ((array!79010 0))(
  ( (array!79011 (arr!38132 (Array (_ BitVec 32) ValueCell!14867)) (size!38670 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79010)

(declare-fun mapKey!48628 () (_ BitVec 32))

(assert (=> mapNonEmpty!48628 (= (arr!38132 _values!996) (store mapRest!48628 mapKey!48628 mapValue!48628))))

(declare-fun b!1225276 () Bool)

(declare-fun e!695903 () Bool)

(declare-fun e!695904 () Bool)

(assert (=> b!1225276 (= e!695903 e!695904)))

(declare-fun res!814258 () Bool)

(assert (=> b!1225276 (=> res!814258 e!695904)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225276 (= res!814258 (not (validKeyInArray!0 (select (arr!38131 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20234 0))(
  ( (tuple2!20235 (_1!10128 (_ BitVec 64)) (_2!10128 V!46665)) )
))
(declare-datatypes ((List!27014 0))(
  ( (Nil!27011) (Cons!27010 (h!28219 tuple2!20234) (t!40434 List!27014)) )
))
(declare-datatypes ((ListLongMap!18203 0))(
  ( (ListLongMap!18204 (toList!9117 List!27014)) )
))
(declare-fun lt!558166 () ListLongMap!18203)

(declare-fun lt!558177 () ListLongMap!18203)

(assert (=> b!1225276 (= lt!558166 lt!558177)))

(declare-fun lt!558176 () ListLongMap!18203)

(declare-fun -!1934 (ListLongMap!18203 (_ BitVec 64)) ListLongMap!18203)

(assert (=> b!1225276 (= lt!558177 (-!1934 lt!558176 k0!934))))

(declare-fun zeroValue!944 () V!46665)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!558174 () array!79010)

(declare-fun minValue!944 () V!46665)

(declare-fun getCurrentListMapNoExtraKeys!5546 (array!79008 array!79010 (_ BitVec 32) (_ BitVec 32) V!46665 V!46665 (_ BitVec 32) Int) ListLongMap!18203)

(assert (=> b!1225276 (= lt!558166 (getCurrentListMapNoExtraKeys!5546 lt!558175 lt!558174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225276 (= lt!558176 (getCurrentListMapNoExtraKeys!5546 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40459 0))(
  ( (Unit!40460) )
))
(declare-fun lt!558179 () Unit!40459)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1166 (array!79008 array!79010 (_ BitVec 32) (_ BitVec 32) V!46665 V!46665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40459)

(assert (=> b!1225276 (= lt!558179 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1166 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225277 () Bool)

(declare-fun e!695908 () Unit!40459)

(declare-fun Unit!40461 () Unit!40459)

(assert (=> b!1225277 (= e!695908 Unit!40461)))

(declare-fun b!1225278 () Bool)

(declare-fun e!695900 () Bool)

(assert (=> b!1225278 (= e!695901 (not e!695900))))

(declare-fun res!814261 () Bool)

(assert (=> b!1225278 (=> res!814261 e!695900)))

(assert (=> b!1225278 (= res!814261 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225278 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558169 () Unit!40459)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79008 (_ BitVec 64) (_ BitVec 32)) Unit!40459)

(assert (=> b!1225278 (= lt!558169 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225279 () Bool)

(declare-fun res!814256 () Bool)

(assert (=> b!1225279 (=> (not res!814256) (not e!695907))))

(assert (=> b!1225279 (= res!814256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225280 () Bool)

(declare-fun res!814262 () Bool)

(assert (=> b!1225280 (=> (not res!814262) (not e!695907))))

(assert (=> b!1225280 (= res!814262 (and (= (size!38670 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38669 _keys!1208) (size!38670 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225281 () Bool)

(declare-fun e!695905 () Bool)

(declare-fun e!695902 () Bool)

(assert (=> b!1225281 (= e!695905 (and e!695902 mapRes!48628))))

(declare-fun condMapEmpty!48628 () Bool)

(declare-fun mapDefault!48628 () ValueCell!14867)

(assert (=> b!1225281 (= condMapEmpty!48628 (= (arr!38132 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14867)) mapDefault!48628)))))

(declare-fun res!814266 () Bool)

(assert (=> start!101754 (=> (not res!814266) (not e!695907))))

(assert (=> start!101754 (= res!814266 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38669 _keys!1208))))))

(assert (=> start!101754 e!695907))

(assert (=> start!101754 tp_is_empty!31153))

(declare-fun array_inv!29126 (array!79008) Bool)

(assert (=> start!101754 (array_inv!29126 _keys!1208)))

(assert (=> start!101754 true))

(assert (=> start!101754 tp!92393))

(declare-fun array_inv!29127 (array!79010) Bool)

(assert (=> start!101754 (and (array_inv!29127 _values!996) e!695905)))

(declare-fun b!1225282 () Bool)

(declare-fun res!814260 () Bool)

(assert (=> b!1225282 (=> (not res!814260) (not e!695907))))

(assert (=> b!1225282 (= res!814260 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38669 _keys!1208))))))

(declare-fun b!1225283 () Bool)

(assert (=> b!1225283 (= e!695910 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225284 () Bool)

(declare-fun Unit!40462 () Unit!40459)

(assert (=> b!1225284 (= e!695908 Unit!40462)))

(declare-fun lt!558165 () Unit!40459)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79008 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40459)

(assert (=> b!1225284 (= lt!558165 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1225284 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558180 () Unit!40459)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79008 (_ BitVec 32) (_ BitVec 32)) Unit!40459)

(assert (=> b!1225284 (= lt!558180 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!27015 0))(
  ( (Nil!27012) (Cons!27011 (h!28220 (_ BitVec 64)) (t!40435 List!27015)) )
))
(declare-fun arrayNoDuplicates!0 (array!79008 (_ BitVec 32) List!27015) Bool)

(assert (=> b!1225284 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!27012)))

(declare-fun lt!558168 () Unit!40459)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79008 (_ BitVec 64) (_ BitVec 32) List!27015) Unit!40459)

(assert (=> b!1225284 (= lt!558168 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!27012))))

(assert (=> b!1225284 false))

(declare-fun b!1225285 () Bool)

(declare-fun lt!558172 () ListLongMap!18203)

(declare-fun lt!558173 () ListLongMap!18203)

(assert (=> b!1225285 (= e!695904 (= lt!558173 (-!1934 lt!558172 k0!934)))))

(declare-fun lt!558181 () ListLongMap!18203)

(declare-fun lt!558171 () ListLongMap!18203)

(assert (=> b!1225285 (= (-!1934 lt!558181 k0!934) lt!558171)))

(declare-fun lt!558164 () V!46665)

(declare-fun lt!558167 () Unit!40459)

(declare-fun addRemoveCommutativeForDiffKeys!219 (ListLongMap!18203 (_ BitVec 64) V!46665 (_ BitVec 64)) Unit!40459)

(assert (=> b!1225285 (= lt!558167 (addRemoveCommutativeForDiffKeys!219 lt!558176 (select (arr!38131 _keys!1208) from!1455) lt!558164 k0!934))))

(assert (=> b!1225285 (and (= lt!558172 lt!558181) (= lt!558177 lt!558166))))

(declare-fun lt!558163 () tuple2!20234)

(declare-fun +!4177 (ListLongMap!18203 tuple2!20234) ListLongMap!18203)

(assert (=> b!1225285 (= lt!558181 (+!4177 lt!558176 lt!558163))))

(assert (=> b!1225285 (not (= (select (arr!38131 _keys!1208) from!1455) k0!934))))

(declare-fun lt!558178 () Unit!40459)

(assert (=> b!1225285 (= lt!558178 e!695908)))

(declare-fun c!120473 () Bool)

(assert (=> b!1225285 (= c!120473 (= (select (arr!38131 _keys!1208) from!1455) k0!934))))

(assert (=> b!1225285 e!695911))

(declare-fun res!814254 () Bool)

(assert (=> b!1225285 (=> (not res!814254) (not e!695911))))

(assert (=> b!1225285 (= res!814254 (= lt!558173 lt!558171))))

(assert (=> b!1225285 (= lt!558171 (+!4177 lt!558177 lt!558163))))

(assert (=> b!1225285 (= lt!558163 (tuple2!20235 (select (arr!38131 _keys!1208) from!1455) lt!558164))))

(declare-fun lt!558170 () V!46665)

(declare-fun get!19500 (ValueCell!14867 V!46665) V!46665)

(assert (=> b!1225285 (= lt!558164 (get!19500 (select (arr!38132 _values!996) from!1455) lt!558170))))

(declare-fun b!1225286 () Bool)

(assert (=> b!1225286 (= e!695902 tp_is_empty!31153)))

(declare-fun b!1225287 () Bool)

(declare-fun res!814252 () Bool)

(assert (=> b!1225287 (=> (not res!814252) (not e!695901))))

(assert (=> b!1225287 (= res!814252 (arrayNoDuplicates!0 lt!558175 #b00000000000000000000000000000000 Nil!27012))))

(declare-fun b!1225288 () Bool)

(assert (=> b!1225288 (= e!695900 e!695903)))

(declare-fun res!814265 () Bool)

(assert (=> b!1225288 (=> res!814265 e!695903)))

(assert (=> b!1225288 (= res!814265 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1225288 (= lt!558173 (getCurrentListMapNoExtraKeys!5546 lt!558175 lt!558174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1225288 (= lt!558174 (array!79011 (store (arr!38132 _values!996) i!673 (ValueCellFull!14867 lt!558170)) (size!38670 _values!996)))))

(declare-fun dynLambda!3391 (Int (_ BitVec 64)) V!46665)

(assert (=> b!1225288 (= lt!558170 (dynLambda!3391 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1225288 (= lt!558172 (getCurrentListMapNoExtraKeys!5546 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225289 () Bool)

(declare-fun res!814255 () Bool)

(assert (=> b!1225289 (=> (not res!814255) (not e!695907))))

(assert (=> b!1225289 (= res!814255 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!27012))))

(declare-fun b!1225290 () Bool)

(declare-fun res!814263 () Bool)

(assert (=> b!1225290 (=> (not res!814263) (not e!695907))))

(assert (=> b!1225290 (= res!814263 (validKeyInArray!0 k0!934))))

(declare-fun b!1225291 () Bool)

(declare-fun res!814253 () Bool)

(assert (=> b!1225291 (=> (not res!814253) (not e!695907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225291 (= res!814253 (validMask!0 mask!1564))))

(assert (= (and start!101754 res!814266) b!1225291))

(assert (= (and b!1225291 res!814253) b!1225280))

(assert (= (and b!1225280 res!814262) b!1225279))

(assert (= (and b!1225279 res!814256) b!1225289))

(assert (= (and b!1225289 res!814255) b!1225282))

(assert (= (and b!1225282 res!814260) b!1225290))

(assert (= (and b!1225290 res!814263) b!1225272))

(assert (= (and b!1225272 res!814259) b!1225273))

(assert (= (and b!1225273 res!814257) b!1225287))

(assert (= (and b!1225287 res!814252) b!1225278))

(assert (= (and b!1225278 (not res!814261)) b!1225288))

(assert (= (and b!1225288 (not res!814265)) b!1225276))

(assert (= (and b!1225276 (not res!814258)) b!1225285))

(assert (= (and b!1225285 res!814254) b!1225275))

(assert (= (and b!1225275 (not res!814264)) b!1225283))

(assert (= (and b!1225285 c!120473) b!1225284))

(assert (= (and b!1225285 (not c!120473)) b!1225277))

(assert (= (and b!1225281 condMapEmpty!48628) mapIsEmpty!48628))

(assert (= (and b!1225281 (not condMapEmpty!48628)) mapNonEmpty!48628))

(get-info :version)

(assert (= (and mapNonEmpty!48628 ((_ is ValueCellFull!14867) mapValue!48628)) b!1225274))

(assert (= (and b!1225281 ((_ is ValueCellFull!14867) mapDefault!48628)) b!1225286))

(assert (= start!101754 b!1225281))

(declare-fun b_lambda!22419 () Bool)

(assert (=> (not b_lambda!22419) (not b!1225288)))

(declare-fun t!40433 () Bool)

(declare-fun tb!11241 () Bool)

(assert (=> (and start!101754 (= defaultEntry!1004 defaultEntry!1004) t!40433) tb!11241))

(declare-fun result!23103 () Bool)

(assert (=> tb!11241 (= result!23103 tp_is_empty!31153)))

(assert (=> b!1225288 t!40433))

(declare-fun b_and!44143 () Bool)

(assert (= b_and!44141 (and (=> t!40433 result!23103) b_and!44143)))

(declare-fun m!1129913 () Bool)

(assert (=> b!1225276 m!1129913))

(declare-fun m!1129915 () Bool)

(assert (=> b!1225276 m!1129915))

(declare-fun m!1129917 () Bool)

(assert (=> b!1225276 m!1129917))

(declare-fun m!1129919 () Bool)

(assert (=> b!1225276 m!1129919))

(declare-fun m!1129921 () Bool)

(assert (=> b!1225276 m!1129921))

(declare-fun m!1129923 () Bool)

(assert (=> b!1225276 m!1129923))

(assert (=> b!1225276 m!1129921))

(declare-fun m!1129925 () Bool)

(assert (=> b!1225291 m!1129925))

(declare-fun m!1129927 () Bool)

(assert (=> b!1225290 m!1129927))

(declare-fun m!1129929 () Bool)

(assert (=> b!1225273 m!1129929))

(declare-fun m!1129931 () Bool)

(assert (=> b!1225273 m!1129931))

(declare-fun m!1129933 () Bool)

(assert (=> start!101754 m!1129933))

(declare-fun m!1129935 () Bool)

(assert (=> start!101754 m!1129935))

(declare-fun m!1129937 () Bool)

(assert (=> b!1225289 m!1129937))

(declare-fun m!1129939 () Bool)

(assert (=> b!1225283 m!1129939))

(declare-fun m!1129941 () Bool)

(assert (=> b!1225288 m!1129941))

(declare-fun m!1129943 () Bool)

(assert (=> b!1225288 m!1129943))

(declare-fun m!1129945 () Bool)

(assert (=> b!1225288 m!1129945))

(declare-fun m!1129947 () Bool)

(assert (=> b!1225288 m!1129947))

(declare-fun m!1129949 () Bool)

(assert (=> b!1225284 m!1129949))

(declare-fun m!1129951 () Bool)

(assert (=> b!1225284 m!1129951))

(declare-fun m!1129953 () Bool)

(assert (=> b!1225284 m!1129953))

(declare-fun m!1129955 () Bool)

(assert (=> b!1225284 m!1129955))

(declare-fun m!1129957 () Bool)

(assert (=> b!1225284 m!1129957))

(declare-fun m!1129959 () Bool)

(assert (=> b!1225285 m!1129959))

(declare-fun m!1129961 () Bool)

(assert (=> b!1225285 m!1129961))

(assert (=> b!1225285 m!1129959))

(declare-fun m!1129963 () Bool)

(assert (=> b!1225285 m!1129963))

(declare-fun m!1129965 () Bool)

(assert (=> b!1225285 m!1129965))

(declare-fun m!1129967 () Bool)

(assert (=> b!1225285 m!1129967))

(assert (=> b!1225285 m!1129921))

(declare-fun m!1129969 () Bool)

(assert (=> b!1225285 m!1129969))

(assert (=> b!1225285 m!1129921))

(declare-fun m!1129971 () Bool)

(assert (=> b!1225285 m!1129971))

(declare-fun m!1129973 () Bool)

(assert (=> b!1225279 m!1129973))

(declare-fun m!1129975 () Bool)

(assert (=> mapNonEmpty!48628 m!1129975))

(assert (=> b!1225275 m!1129921))

(declare-fun m!1129977 () Bool)

(assert (=> b!1225287 m!1129977))

(declare-fun m!1129979 () Bool)

(assert (=> b!1225272 m!1129979))

(declare-fun m!1129981 () Bool)

(assert (=> b!1225278 m!1129981))

(declare-fun m!1129983 () Bool)

(assert (=> b!1225278 m!1129983))

(check-sat (not b!1225290) (not b!1225291) b_and!44143 (not b!1225273) (not start!101754) (not b!1225284) (not b!1225285) (not b_next!26449) (not b_lambda!22419) (not b!1225279) (not b!1225287) (not mapNonEmpty!48628) (not b!1225283) (not b!1225289) (not b!1225278) (not b!1225288) tp_is_empty!31153 (not b!1225276))
(check-sat b_and!44143 (not b_next!26449))
