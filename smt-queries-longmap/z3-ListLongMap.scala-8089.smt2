; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99402 () Bool)

(assert start!99402)

(declare-fun b_free!24981 () Bool)

(declare-fun b_next!24981 () Bool)

(assert (=> start!99402 (= b_free!24981 (not b_next!24981))))

(declare-fun tp!87656 () Bool)

(declare-fun b_and!40829 () Bool)

(assert (=> start!99402 (= tp!87656 b_and!40829)))

(declare-fun b!1173355 () Bool)

(declare-fun e!666938 () Bool)

(declare-fun e!666941 () Bool)

(assert (=> b!1173355 (= e!666938 e!666941)))

(declare-fun res!779146 () Bool)

(assert (=> b!1173355 (=> res!779146 e!666941)))

(declare-datatypes ((array!75833 0))(
  ( (array!75834 (arr!36566 (Array (_ BitVec 32) (_ BitVec 64))) (size!37102 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75833)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1173355 (= res!779146 (not (= (select (arr!36566 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!46094 () Bool)

(declare-fun mapRes!46094 () Bool)

(declare-fun tp!87657 () Bool)

(declare-fun e!666946 () Bool)

(assert (=> mapNonEmpty!46094 (= mapRes!46094 (and tp!87657 e!666946))))

(declare-fun mapKey!46094 () (_ BitVec 32))

(declare-datatypes ((V!44475 0))(
  ( (V!44476 (val!14812 Int)) )
))
(declare-datatypes ((ValueCell!14046 0))(
  ( (ValueCellFull!14046 (v!17450 V!44475)) (EmptyCell!14046) )
))
(declare-datatypes ((array!75835 0))(
  ( (array!75836 (arr!36567 (Array (_ BitVec 32) ValueCell!14046)) (size!37103 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75835)

(declare-fun mapRest!46094 () (Array (_ BitVec 32) ValueCell!14046))

(declare-fun mapValue!46094 () ValueCell!14046)

(assert (=> mapNonEmpty!46094 (= (arr!36567 _values!996) (store mapRest!46094 mapKey!46094 mapValue!46094))))

(declare-fun b!1173356 () Bool)

(declare-datatypes ((Unit!38696 0))(
  ( (Unit!38697) )
))
(declare-fun e!666945 () Unit!38696)

(declare-fun Unit!38698 () Unit!38696)

(assert (=> b!1173356 (= e!666945 Unit!38698)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!528869 () Unit!38696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75833 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38696)

(assert (=> b!1173356 (= lt!528869 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173356 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528876 () Unit!38696)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75833 (_ BitVec 32) (_ BitVec 32)) Unit!38696)

(assert (=> b!1173356 (= lt!528876 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25667 0))(
  ( (Nil!25664) (Cons!25663 (h!26872 (_ BitVec 64)) (t!37640 List!25667)) )
))
(declare-fun arrayNoDuplicates!0 (array!75833 (_ BitVec 32) List!25667) Bool)

(assert (=> b!1173356 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25664)))

(declare-fun lt!528870 () Unit!38696)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75833 (_ BitVec 64) (_ BitVec 32) List!25667) Unit!38696)

(assert (=> b!1173356 (= lt!528870 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25664))))

(assert (=> b!1173356 false))

(declare-fun b!1173357 () Bool)

(declare-fun e!666943 () Bool)

(assert (=> b!1173357 (= e!666943 true)))

(assert (=> b!1173357 (not (= (select (arr!36566 _keys!1208) from!1455) k0!934))))

(declare-fun lt!528874 () Unit!38696)

(assert (=> b!1173357 (= lt!528874 e!666945)))

(declare-fun c!116595 () Bool)

(assert (=> b!1173357 (= c!116595 (= (select (arr!36566 _keys!1208) from!1455) k0!934))))

(assert (=> b!1173357 e!666938))

(declare-fun res!779134 () Bool)

(assert (=> b!1173357 (=> (not res!779134) (not e!666938))))

(declare-datatypes ((tuple2!18928 0))(
  ( (tuple2!18929 (_1!9475 (_ BitVec 64)) (_2!9475 V!44475)) )
))
(declare-datatypes ((List!25668 0))(
  ( (Nil!25665) (Cons!25664 (h!26873 tuple2!18928) (t!37641 List!25668)) )
))
(declare-datatypes ((ListLongMap!16897 0))(
  ( (ListLongMap!16898 (toList!8464 List!25668)) )
))
(declare-fun lt!528882 () ListLongMap!16897)

(declare-fun lt!528880 () ListLongMap!16897)

(declare-fun lt!528877 () V!44475)

(declare-fun +!3783 (ListLongMap!16897 tuple2!18928) ListLongMap!16897)

(declare-fun get!18657 (ValueCell!14046 V!44475) V!44475)

(assert (=> b!1173357 (= res!779134 (= lt!528882 (+!3783 lt!528880 (tuple2!18929 (select (arr!36566 _keys!1208) from!1455) (get!18657 (select (arr!36567 _values!996) from!1455) lt!528877)))))))

(declare-fun b!1173358 () Bool)

(declare-fun tp_is_empty!29511 () Bool)

(assert (=> b!1173358 (= e!666946 tp_is_empty!29511)))

(declare-fun b!1173359 () Bool)

(declare-fun res!779143 () Bool)

(declare-fun e!666940 () Bool)

(assert (=> b!1173359 (=> (not res!779143) (not e!666940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173359 (= res!779143 (validKeyInArray!0 k0!934))))

(declare-fun b!1173360 () Bool)

(declare-fun res!779136 () Bool)

(assert (=> b!1173360 (=> (not res!779136) (not e!666940))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1173360 (= res!779136 (and (= (size!37103 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37102 _keys!1208) (size!37103 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173361 () Bool)

(declare-fun res!779140 () Bool)

(assert (=> b!1173361 (=> (not res!779140) (not e!666940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75833 (_ BitVec 32)) Bool)

(assert (=> b!1173361 (= res!779140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173363 () Bool)

(declare-fun Unit!38699 () Unit!38696)

(assert (=> b!1173363 (= e!666945 Unit!38699)))

(declare-fun b!1173364 () Bool)

(declare-fun res!779139 () Bool)

(assert (=> b!1173364 (=> (not res!779139) (not e!666940))))

(assert (=> b!1173364 (= res!779139 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37102 _keys!1208))))))

(declare-fun b!1173365 () Bool)

(declare-fun res!779133 () Bool)

(assert (=> b!1173365 (=> (not res!779133) (not e!666940))))

(assert (=> b!1173365 (= res!779133 (= (select (arr!36566 _keys!1208) i!673) k0!934))))

(declare-fun b!1173366 () Bool)

(declare-fun res!779138 () Bool)

(assert (=> b!1173366 (=> (not res!779138) (not e!666940))))

(assert (=> b!1173366 (= res!779138 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25664))))

(declare-fun b!1173367 () Bool)

(declare-fun e!666935 () Bool)

(assert (=> b!1173367 (= e!666935 e!666943)))

(declare-fun res!779135 () Bool)

(assert (=> b!1173367 (=> res!779135 e!666943)))

(assert (=> b!1173367 (= res!779135 (not (validKeyInArray!0 (select (arr!36566 _keys!1208) from!1455))))))

(declare-fun lt!528871 () ListLongMap!16897)

(assert (=> b!1173367 (= lt!528871 lt!528880)))

(declare-fun lt!528872 () ListLongMap!16897)

(declare-fun -!1528 (ListLongMap!16897 (_ BitVec 64)) ListLongMap!16897)

(assert (=> b!1173367 (= lt!528880 (-!1528 lt!528872 k0!934))))

(declare-fun zeroValue!944 () V!44475)

(declare-fun lt!528879 () array!75833)

(declare-fun lt!528875 () array!75835)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44475)

(declare-fun getCurrentListMapNoExtraKeys!4927 (array!75833 array!75835 (_ BitVec 32) (_ BitVec 32) V!44475 V!44475 (_ BitVec 32) Int) ListLongMap!16897)

(assert (=> b!1173367 (= lt!528871 (getCurrentListMapNoExtraKeys!4927 lt!528879 lt!528875 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173367 (= lt!528872 (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528881 () Unit!38696)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!755 (array!75833 array!75835 (_ BitVec 32) (_ BitVec 32) V!44475 V!44475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38696)

(assert (=> b!1173367 (= lt!528881 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!755 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46094 () Bool)

(assert (=> mapIsEmpty!46094 mapRes!46094))

(declare-fun b!1173368 () Bool)

(declare-fun e!666942 () Bool)

(assert (=> b!1173368 (= e!666942 e!666935)))

(declare-fun res!779145 () Bool)

(assert (=> b!1173368 (=> res!779145 e!666935)))

(assert (=> b!1173368 (= res!779145 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1173368 (= lt!528882 (getCurrentListMapNoExtraKeys!4927 lt!528879 lt!528875 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1173368 (= lt!528875 (array!75836 (store (arr!36567 _values!996) i!673 (ValueCellFull!14046 lt!528877)) (size!37103 _values!996)))))

(declare-fun dynLambda!2898 (Int (_ BitVec 64)) V!44475)

(assert (=> b!1173368 (= lt!528877 (dynLambda!2898 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528873 () ListLongMap!16897)

(assert (=> b!1173368 (= lt!528873 (getCurrentListMapNoExtraKeys!4927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173369 () Bool)

(declare-fun res!779132 () Bool)

(assert (=> b!1173369 (=> (not res!779132) (not e!666940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173369 (= res!779132 (validMask!0 mask!1564))))

(declare-fun b!1173370 () Bool)

(assert (=> b!1173370 (= e!666941 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173371 () Bool)

(declare-fun e!666937 () Bool)

(assert (=> b!1173371 (= e!666940 e!666937)))

(declare-fun res!779142 () Bool)

(assert (=> b!1173371 (=> (not res!779142) (not e!666937))))

(assert (=> b!1173371 (= res!779142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528879 mask!1564))))

(assert (=> b!1173371 (= lt!528879 (array!75834 (store (arr!36566 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37102 _keys!1208)))))

(declare-fun b!1173372 () Bool)

(declare-fun res!779144 () Bool)

(assert (=> b!1173372 (=> (not res!779144) (not e!666937))))

(assert (=> b!1173372 (= res!779144 (arrayNoDuplicates!0 lt!528879 #b00000000000000000000000000000000 Nil!25664))))

(declare-fun b!1173373 () Bool)

(assert (=> b!1173373 (= e!666937 (not e!666942))))

(declare-fun res!779137 () Bool)

(assert (=> b!1173373 (=> res!779137 e!666942)))

(assert (=> b!1173373 (= res!779137 (bvsgt from!1455 i!673))))

(assert (=> b!1173373 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528878 () Unit!38696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75833 (_ BitVec 64) (_ BitVec 32)) Unit!38696)

(assert (=> b!1173373 (= lt!528878 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173374 () Bool)

(declare-fun e!666936 () Bool)

(declare-fun e!666939 () Bool)

(assert (=> b!1173374 (= e!666936 (and e!666939 mapRes!46094))))

(declare-fun condMapEmpty!46094 () Bool)

(declare-fun mapDefault!46094 () ValueCell!14046)

(assert (=> b!1173374 (= condMapEmpty!46094 (= (arr!36567 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14046)) mapDefault!46094)))))

(declare-fun res!779141 () Bool)

(assert (=> start!99402 (=> (not res!779141) (not e!666940))))

(assert (=> start!99402 (= res!779141 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37102 _keys!1208))))))

(assert (=> start!99402 e!666940))

(assert (=> start!99402 tp_is_empty!29511))

(declare-fun array_inv!27936 (array!75833) Bool)

(assert (=> start!99402 (array_inv!27936 _keys!1208)))

(assert (=> start!99402 true))

(assert (=> start!99402 tp!87656))

(declare-fun array_inv!27937 (array!75835) Bool)

(assert (=> start!99402 (and (array_inv!27937 _values!996) e!666936)))

(declare-fun b!1173362 () Bool)

(assert (=> b!1173362 (= e!666939 tp_is_empty!29511)))

(assert (= (and start!99402 res!779141) b!1173369))

(assert (= (and b!1173369 res!779132) b!1173360))

(assert (= (and b!1173360 res!779136) b!1173361))

(assert (= (and b!1173361 res!779140) b!1173366))

(assert (= (and b!1173366 res!779138) b!1173364))

(assert (= (and b!1173364 res!779139) b!1173359))

(assert (= (and b!1173359 res!779143) b!1173365))

(assert (= (and b!1173365 res!779133) b!1173371))

(assert (= (and b!1173371 res!779142) b!1173372))

(assert (= (and b!1173372 res!779144) b!1173373))

(assert (= (and b!1173373 (not res!779137)) b!1173368))

(assert (= (and b!1173368 (not res!779145)) b!1173367))

(assert (= (and b!1173367 (not res!779135)) b!1173357))

(assert (= (and b!1173357 res!779134) b!1173355))

(assert (= (and b!1173355 (not res!779146)) b!1173370))

(assert (= (and b!1173357 c!116595) b!1173356))

(assert (= (and b!1173357 (not c!116595)) b!1173363))

(assert (= (and b!1173374 condMapEmpty!46094) mapIsEmpty!46094))

(assert (= (and b!1173374 (not condMapEmpty!46094)) mapNonEmpty!46094))

(get-info :version)

(assert (= (and mapNonEmpty!46094 ((_ is ValueCellFull!14046) mapValue!46094)) b!1173358))

(assert (= (and b!1173374 ((_ is ValueCellFull!14046) mapDefault!46094)) b!1173362))

(assert (= start!99402 b!1173374))

(declare-fun b_lambda!20125 () Bool)

(assert (=> (not b_lambda!20125) (not b!1173368)))

(declare-fun t!37639 () Bool)

(declare-fun tb!9793 () Bool)

(assert (=> (and start!99402 (= defaultEntry!1004 defaultEntry!1004) t!37639) tb!9793))

(declare-fun result!20153 () Bool)

(assert (=> tb!9793 (= result!20153 tp_is_empty!29511)))

(assert (=> b!1173368 t!37639))

(declare-fun b_and!40831 () Bool)

(assert (= b_and!40829 (and (=> t!37639 result!20153) b_and!40831)))

(declare-fun m!1081195 () Bool)

(assert (=> b!1173373 m!1081195))

(declare-fun m!1081197 () Bool)

(assert (=> b!1173373 m!1081197))

(declare-fun m!1081199 () Bool)

(assert (=> mapNonEmpty!46094 m!1081199))

(declare-fun m!1081201 () Bool)

(assert (=> b!1173365 m!1081201))

(declare-fun m!1081203 () Bool)

(assert (=> b!1173366 m!1081203))

(declare-fun m!1081205 () Bool)

(assert (=> b!1173359 m!1081205))

(declare-fun m!1081207 () Bool)

(assert (=> start!99402 m!1081207))

(declare-fun m!1081209 () Bool)

(assert (=> start!99402 m!1081209))

(declare-fun m!1081211 () Bool)

(assert (=> b!1173355 m!1081211))

(declare-fun m!1081213 () Bool)

(assert (=> b!1173367 m!1081213))

(assert (=> b!1173367 m!1081211))

(declare-fun m!1081215 () Bool)

(assert (=> b!1173367 m!1081215))

(declare-fun m!1081217 () Bool)

(assert (=> b!1173367 m!1081217))

(assert (=> b!1173367 m!1081211))

(declare-fun m!1081219 () Bool)

(assert (=> b!1173367 m!1081219))

(declare-fun m!1081221 () Bool)

(assert (=> b!1173367 m!1081221))

(declare-fun m!1081223 () Bool)

(assert (=> b!1173368 m!1081223))

(declare-fun m!1081225 () Bool)

(assert (=> b!1173368 m!1081225))

(declare-fun m!1081227 () Bool)

(assert (=> b!1173368 m!1081227))

(declare-fun m!1081229 () Bool)

(assert (=> b!1173368 m!1081229))

(declare-fun m!1081231 () Bool)

(assert (=> b!1173372 m!1081231))

(declare-fun m!1081233 () Bool)

(assert (=> b!1173361 m!1081233))

(declare-fun m!1081235 () Bool)

(assert (=> b!1173369 m!1081235))

(declare-fun m!1081237 () Bool)

(assert (=> b!1173370 m!1081237))

(assert (=> b!1173357 m!1081211))

(declare-fun m!1081239 () Bool)

(assert (=> b!1173357 m!1081239))

(assert (=> b!1173357 m!1081239))

(declare-fun m!1081241 () Bool)

(assert (=> b!1173357 m!1081241))

(declare-fun m!1081243 () Bool)

(assert (=> b!1173357 m!1081243))

(declare-fun m!1081245 () Bool)

(assert (=> b!1173371 m!1081245))

(declare-fun m!1081247 () Bool)

(assert (=> b!1173371 m!1081247))

(declare-fun m!1081249 () Bool)

(assert (=> b!1173356 m!1081249))

(declare-fun m!1081251 () Bool)

(assert (=> b!1173356 m!1081251))

(declare-fun m!1081253 () Bool)

(assert (=> b!1173356 m!1081253))

(declare-fun m!1081255 () Bool)

(assert (=> b!1173356 m!1081255))

(declare-fun m!1081257 () Bool)

(assert (=> b!1173356 m!1081257))

(check-sat (not b_next!24981) (not b!1173356) (not b!1173369) (not b!1173361) (not b!1173359) (not b!1173371) (not b!1173370) (not b_lambda!20125) (not b!1173366) (not b!1173357) (not b!1173372) (not start!99402) (not b!1173373) tp_is_empty!29511 (not mapNonEmpty!46094) (not b!1173367) (not b!1173368) b_and!40831)
(check-sat b_and!40831 (not b_next!24981))
