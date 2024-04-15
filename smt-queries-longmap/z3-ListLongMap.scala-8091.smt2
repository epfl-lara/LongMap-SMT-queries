; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99406 () Bool)

(assert start!99406)

(declare-fun b_free!24991 () Bool)

(declare-fun b_next!24991 () Bool)

(assert (=> start!99406 (= b_free!24991 (not b_next!24991))))

(declare-fun tp!87686 () Bool)

(declare-fun b_and!40827 () Bool)

(assert (=> start!99406 (= tp!87686 b_and!40827)))

(declare-fun b!1173541 () Bool)

(declare-fun e!667037 () Bool)

(declare-fun tp_is_empty!29521 () Bool)

(assert (=> b!1173541 (= e!667037 tp_is_empty!29521)))

(declare-fun b!1173542 () Bool)

(declare-fun e!667044 () Bool)

(declare-fun e!667041 () Bool)

(assert (=> b!1173542 (= e!667044 (not e!667041))))

(declare-fun res!779300 () Bool)

(assert (=> b!1173542 (=> res!779300 e!667041)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173542 (= res!779300 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75784 0))(
  ( (array!75785 (arr!36542 (Array (_ BitVec 32) (_ BitVec 64))) (size!37080 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75784)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173542 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38532 0))(
  ( (Unit!38533) )
))
(declare-fun lt!528899 () Unit!38532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75784 (_ BitVec 64) (_ BitVec 32)) Unit!38532)

(assert (=> b!1173542 (= lt!528899 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173543 () Bool)

(declare-fun e!667046 () Bool)

(assert (=> b!1173543 (= e!667046 tp_is_empty!29521)))

(declare-fun b!1173544 () Bool)

(declare-fun e!667042 () Bool)

(declare-fun mapRes!46109 () Bool)

(assert (=> b!1173544 (= e!667042 (and e!667037 mapRes!46109))))

(declare-fun condMapEmpty!46109 () Bool)

(declare-datatypes ((V!44489 0))(
  ( (V!44490 (val!14817 Int)) )
))
(declare-datatypes ((ValueCell!14051 0))(
  ( (ValueCellFull!14051 (v!17454 V!44489)) (EmptyCell!14051) )
))
(declare-datatypes ((array!75786 0))(
  ( (array!75787 (arr!36543 (Array (_ BitVec 32) ValueCell!14051)) (size!37081 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75786)

(declare-fun mapDefault!46109 () ValueCell!14051)

(assert (=> b!1173544 (= condMapEmpty!46109 (= (arr!36543 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14051)) mapDefault!46109)))))

(declare-fun b!1173545 () Bool)

(declare-fun res!779295 () Bool)

(declare-fun e!667040 () Bool)

(assert (=> b!1173545 (=> (not res!779295) (not e!667040))))

(declare-datatypes ((List!25748 0))(
  ( (Nil!25745) (Cons!25744 (h!26953 (_ BitVec 64)) (t!37722 List!25748)) )
))
(declare-fun arrayNoDuplicates!0 (array!75784 (_ BitVec 32) List!25748) Bool)

(assert (=> b!1173545 (= res!779295 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25745))))

(declare-fun b!1173546 () Bool)

(declare-fun e!667038 () Unit!38532)

(declare-fun Unit!38534 () Unit!38532)

(assert (=> b!1173546 (= e!667038 Unit!38534)))

(declare-fun lt!528900 () Unit!38532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75784 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38532)

(assert (=> b!1173546 (= lt!528900 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1173546 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528895 () Unit!38532)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75784 (_ BitVec 32) (_ BitVec 32)) Unit!38532)

(assert (=> b!1173546 (= lt!528895 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173546 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25745)))

(declare-fun lt!528891 () Unit!38532)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75784 (_ BitVec 64) (_ BitVec 32) List!25748) Unit!38532)

(assert (=> b!1173546 (= lt!528891 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25745))))

(assert (=> b!1173546 false))

(declare-fun b!1173547 () Bool)

(declare-fun res!779296 () Bool)

(assert (=> b!1173547 (=> (not res!779296) (not e!667040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173547 (= res!779296 (validKeyInArray!0 k0!934))))

(declare-fun b!1173548 () Bool)

(declare-fun e!667048 () Bool)

(assert (=> b!1173548 (= e!667041 e!667048)))

(declare-fun res!779297 () Bool)

(assert (=> b!1173548 (=> res!779297 e!667048)))

(assert (=> b!1173548 (= res!779297 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44489)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!528890 () array!75786)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44489)

(declare-datatypes ((tuple2!19032 0))(
  ( (tuple2!19033 (_1!9527 (_ BitVec 64)) (_2!9527 V!44489)) )
))
(declare-datatypes ((List!25749 0))(
  ( (Nil!25746) (Cons!25745 (h!26954 tuple2!19032) (t!37723 List!25749)) )
))
(declare-datatypes ((ListLongMap!17001 0))(
  ( (ListLongMap!17002 (toList!8516 List!25749)) )
))
(declare-fun lt!528897 () ListLongMap!17001)

(declare-fun lt!528894 () array!75784)

(declare-fun getCurrentListMapNoExtraKeys!4989 (array!75784 array!75786 (_ BitVec 32) (_ BitVec 32) V!44489 V!44489 (_ BitVec 32) Int) ListLongMap!17001)

(assert (=> b!1173548 (= lt!528897 (getCurrentListMapNoExtraKeys!4989 lt!528894 lt!528890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528896 () V!44489)

(assert (=> b!1173548 (= lt!528890 (array!75787 (store (arr!36543 _values!996) i!673 (ValueCellFull!14051 lt!528896)) (size!37081 _values!996)))))

(declare-fun dynLambda!2913 (Int (_ BitVec 64)) V!44489)

(assert (=> b!1173548 (= lt!528896 (dynLambda!2913 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528889 () ListLongMap!17001)

(assert (=> b!1173548 (= lt!528889 (getCurrentListMapNoExtraKeys!4989 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!667043 () Bool)

(declare-fun b!1173549 () Bool)

(assert (=> b!1173549 (= e!667043 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46109 () Bool)

(declare-fun tp!87687 () Bool)

(assert (=> mapNonEmpty!46109 (= mapRes!46109 (and tp!87687 e!667046))))

(declare-fun mapValue!46109 () ValueCell!14051)

(declare-fun mapRest!46109 () (Array (_ BitVec 32) ValueCell!14051))

(declare-fun mapKey!46109 () (_ BitVec 32))

(assert (=> mapNonEmpty!46109 (= (arr!36543 _values!996) (store mapRest!46109 mapKey!46109 mapValue!46109))))

(declare-fun b!1173550 () Bool)

(declare-fun res!779302 () Bool)

(assert (=> b!1173550 (=> (not res!779302) (not e!667040))))

(assert (=> b!1173550 (= res!779302 (and (= (size!37081 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37080 _keys!1208) (size!37081 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173551 () Bool)

(declare-fun e!667039 () Bool)

(assert (=> b!1173551 (= e!667039 e!667043)))

(declare-fun res!779298 () Bool)

(assert (=> b!1173551 (=> res!779298 e!667043)))

(assert (=> b!1173551 (= res!779298 (not (= (select (arr!36542 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173552 () Bool)

(declare-fun e!667045 () Bool)

(assert (=> b!1173552 (= e!667045 true)))

(assert (=> b!1173552 (not (= (select (arr!36542 _keys!1208) from!1455) k0!934))))

(declare-fun lt!528888 () Unit!38532)

(assert (=> b!1173552 (= lt!528888 e!667038)))

(declare-fun c!116584 () Bool)

(assert (=> b!1173552 (= c!116584 (= (select (arr!36542 _keys!1208) from!1455) k0!934))))

(assert (=> b!1173552 e!667039))

(declare-fun res!779294 () Bool)

(assert (=> b!1173552 (=> (not res!779294) (not e!667039))))

(declare-fun lt!528898 () ListLongMap!17001)

(declare-fun +!3828 (ListLongMap!17001 tuple2!19032) ListLongMap!17001)

(declare-fun get!18658 (ValueCell!14051 V!44489) V!44489)

(assert (=> b!1173552 (= res!779294 (= lt!528897 (+!3828 lt!528898 (tuple2!19033 (select (arr!36542 _keys!1208) from!1455) (get!18658 (select (arr!36543 _values!996) from!1455) lt!528896)))))))

(declare-fun b!1173553 () Bool)

(declare-fun Unit!38535 () Unit!38532)

(assert (=> b!1173553 (= e!667038 Unit!38535)))

(declare-fun mapIsEmpty!46109 () Bool)

(assert (=> mapIsEmpty!46109 mapRes!46109))

(declare-fun b!1173554 () Bool)

(declare-fun res!779292 () Bool)

(assert (=> b!1173554 (=> (not res!779292) (not e!667044))))

(assert (=> b!1173554 (= res!779292 (arrayNoDuplicates!0 lt!528894 #b00000000000000000000000000000000 Nil!25745))))

(declare-fun res!779291 () Bool)

(assert (=> start!99406 (=> (not res!779291) (not e!667040))))

(assert (=> start!99406 (= res!779291 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37080 _keys!1208))))))

(assert (=> start!99406 e!667040))

(assert (=> start!99406 tp_is_empty!29521))

(declare-fun array_inv!28026 (array!75784) Bool)

(assert (=> start!99406 (array_inv!28026 _keys!1208)))

(assert (=> start!99406 true))

(assert (=> start!99406 tp!87686))

(declare-fun array_inv!28027 (array!75786) Bool)

(assert (=> start!99406 (and (array_inv!28027 _values!996) e!667042)))

(declare-fun b!1173555 () Bool)

(declare-fun res!779301 () Bool)

(assert (=> b!1173555 (=> (not res!779301) (not e!667040))))

(assert (=> b!1173555 (= res!779301 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37080 _keys!1208))))))

(declare-fun b!1173556 () Bool)

(assert (=> b!1173556 (= e!667048 e!667045)))

(declare-fun res!779305 () Bool)

(assert (=> b!1173556 (=> res!779305 e!667045)))

(assert (=> b!1173556 (= res!779305 (not (validKeyInArray!0 (select (arr!36542 _keys!1208) from!1455))))))

(declare-fun lt!528893 () ListLongMap!17001)

(assert (=> b!1173556 (= lt!528893 lt!528898)))

(declare-fun lt!528892 () ListLongMap!17001)

(declare-fun -!1503 (ListLongMap!17001 (_ BitVec 64)) ListLongMap!17001)

(assert (=> b!1173556 (= lt!528898 (-!1503 lt!528892 k0!934))))

(assert (=> b!1173556 (= lt!528893 (getCurrentListMapNoExtraKeys!4989 lt!528894 lt!528890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173556 (= lt!528892 (getCurrentListMapNoExtraKeys!4989 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528887 () Unit!38532)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!767 (array!75784 array!75786 (_ BitVec 32) (_ BitVec 32) V!44489 V!44489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38532)

(assert (=> b!1173556 (= lt!528887 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!767 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173557 () Bool)

(declare-fun res!779303 () Bool)

(assert (=> b!1173557 (=> (not res!779303) (not e!667040))))

(assert (=> b!1173557 (= res!779303 (= (select (arr!36542 _keys!1208) i!673) k0!934))))

(declare-fun b!1173558 () Bool)

(declare-fun res!779304 () Bool)

(assert (=> b!1173558 (=> (not res!779304) (not e!667040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173558 (= res!779304 (validMask!0 mask!1564))))

(declare-fun b!1173559 () Bool)

(assert (=> b!1173559 (= e!667040 e!667044)))

(declare-fun res!779293 () Bool)

(assert (=> b!1173559 (=> (not res!779293) (not e!667044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75784 (_ BitVec 32)) Bool)

(assert (=> b!1173559 (= res!779293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528894 mask!1564))))

(assert (=> b!1173559 (= lt!528894 (array!75785 (store (arr!36542 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37080 _keys!1208)))))

(declare-fun b!1173560 () Bool)

(declare-fun res!779299 () Bool)

(assert (=> b!1173560 (=> (not res!779299) (not e!667040))))

(assert (=> b!1173560 (= res!779299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99406 res!779291) b!1173558))

(assert (= (and b!1173558 res!779304) b!1173550))

(assert (= (and b!1173550 res!779302) b!1173560))

(assert (= (and b!1173560 res!779299) b!1173545))

(assert (= (and b!1173545 res!779295) b!1173555))

(assert (= (and b!1173555 res!779301) b!1173547))

(assert (= (and b!1173547 res!779296) b!1173557))

(assert (= (and b!1173557 res!779303) b!1173559))

(assert (= (and b!1173559 res!779293) b!1173554))

(assert (= (and b!1173554 res!779292) b!1173542))

(assert (= (and b!1173542 (not res!779300)) b!1173548))

(assert (= (and b!1173548 (not res!779297)) b!1173556))

(assert (= (and b!1173556 (not res!779305)) b!1173552))

(assert (= (and b!1173552 res!779294) b!1173551))

(assert (= (and b!1173551 (not res!779298)) b!1173549))

(assert (= (and b!1173552 c!116584) b!1173546))

(assert (= (and b!1173552 (not c!116584)) b!1173553))

(assert (= (and b!1173544 condMapEmpty!46109) mapIsEmpty!46109))

(assert (= (and b!1173544 (not condMapEmpty!46109)) mapNonEmpty!46109))

(get-info :version)

(assert (= (and mapNonEmpty!46109 ((_ is ValueCellFull!14051) mapValue!46109)) b!1173543))

(assert (= (and b!1173544 ((_ is ValueCellFull!14051) mapDefault!46109)) b!1173541))

(assert (= start!99406 b!1173544))

(declare-fun b_lambda!20117 () Bool)

(assert (=> (not b_lambda!20117) (not b!1173548)))

(declare-fun t!37721 () Bool)

(declare-fun tb!9795 () Bool)

(assert (=> (and start!99406 (= defaultEntry!1004 defaultEntry!1004) t!37721) tb!9795))

(declare-fun result!20165 () Bool)

(assert (=> tb!9795 (= result!20165 tp_is_empty!29521)))

(assert (=> b!1173548 t!37721))

(declare-fun b_and!40829 () Bool)

(assert (= b_and!40827 (and (=> t!37721 result!20165) b_and!40829)))

(declare-fun m!1080905 () Bool)

(assert (=> b!1173551 m!1080905))

(declare-fun m!1080907 () Bool)

(assert (=> b!1173547 m!1080907))

(declare-fun m!1080909 () Bool)

(assert (=> b!1173558 m!1080909))

(declare-fun m!1080911 () Bool)

(assert (=> b!1173556 m!1080911))

(declare-fun m!1080913 () Bool)

(assert (=> b!1173556 m!1080913))

(declare-fun m!1080915 () Bool)

(assert (=> b!1173556 m!1080915))

(assert (=> b!1173556 m!1080905))

(declare-fun m!1080917 () Bool)

(assert (=> b!1173556 m!1080917))

(assert (=> b!1173556 m!1080905))

(declare-fun m!1080919 () Bool)

(assert (=> b!1173556 m!1080919))

(declare-fun m!1080921 () Bool)

(assert (=> b!1173559 m!1080921))

(declare-fun m!1080923 () Bool)

(assert (=> b!1173559 m!1080923))

(declare-fun m!1080925 () Bool)

(assert (=> b!1173542 m!1080925))

(declare-fun m!1080927 () Bool)

(assert (=> b!1173542 m!1080927))

(declare-fun m!1080929 () Bool)

(assert (=> b!1173560 m!1080929))

(declare-fun m!1080931 () Bool)

(assert (=> b!1173554 m!1080931))

(declare-fun m!1080933 () Bool)

(assert (=> b!1173557 m!1080933))

(assert (=> b!1173552 m!1080905))

(declare-fun m!1080935 () Bool)

(assert (=> b!1173552 m!1080935))

(assert (=> b!1173552 m!1080935))

(declare-fun m!1080937 () Bool)

(assert (=> b!1173552 m!1080937))

(declare-fun m!1080939 () Bool)

(assert (=> b!1173552 m!1080939))

(declare-fun m!1080941 () Bool)

(assert (=> b!1173548 m!1080941))

(declare-fun m!1080943 () Bool)

(assert (=> b!1173548 m!1080943))

(declare-fun m!1080945 () Bool)

(assert (=> b!1173548 m!1080945))

(declare-fun m!1080947 () Bool)

(assert (=> b!1173548 m!1080947))

(declare-fun m!1080949 () Bool)

(assert (=> start!99406 m!1080949))

(declare-fun m!1080951 () Bool)

(assert (=> start!99406 m!1080951))

(declare-fun m!1080953 () Bool)

(assert (=> b!1173545 m!1080953))

(declare-fun m!1080955 () Bool)

(assert (=> b!1173546 m!1080955))

(declare-fun m!1080957 () Bool)

(assert (=> b!1173546 m!1080957))

(declare-fun m!1080959 () Bool)

(assert (=> b!1173546 m!1080959))

(declare-fun m!1080961 () Bool)

(assert (=> b!1173546 m!1080961))

(declare-fun m!1080963 () Bool)

(assert (=> b!1173546 m!1080963))

(declare-fun m!1080965 () Bool)

(assert (=> b!1173549 m!1080965))

(declare-fun m!1080967 () Bool)

(assert (=> mapNonEmpty!46109 m!1080967))

(check-sat (not b!1173556) (not b!1173560) (not b_lambda!20117) (not b!1173558) (not b!1173554) (not b!1173545) (not b!1173546) (not b!1173552) (not b_next!24991) tp_is_empty!29521 (not b!1173559) (not mapNonEmpty!46109) (not b!1173542) b_and!40829 (not b!1173548) (not start!99406) (not b!1173549) (not b!1173547))
(check-sat b_and!40829 (not b_next!24991))
