; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101942 () Bool)

(assert start!101942)

(declare-fun b_free!26395 () Bool)

(declare-fun b_next!26395 () Bool)

(assert (=> start!101942 (= b_free!26395 (not b_next!26395))))

(declare-fun tp!92230 () Bool)

(declare-fun b_and!44053 () Bool)

(assert (=> start!101942 (= tp!92230 b_and!44053)))

(declare-fun b!1224924 () Bool)

(declare-fun res!813549 () Bool)

(declare-fun e!695792 () Bool)

(assert (=> b!1224924 (=> (not res!813549) (not e!695792))))

(declare-datatypes ((array!79019 0))(
  ( (array!79020 (arr!38130 (Array (_ BitVec 32) (_ BitVec 64))) (size!38667 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79019)

(declare-datatypes ((List!26929 0))(
  ( (Nil!26926) (Cons!26925 (h!28143 (_ BitVec 64)) (t!40296 List!26929)) )
))
(declare-fun arrayNoDuplicates!0 (array!79019 (_ BitVec 32) List!26929) Bool)

(assert (=> b!1224924 (= res!813549 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26926))))

(declare-fun b!1224925 () Bool)

(declare-fun res!813536 () Bool)

(assert (=> b!1224925 (=> (not res!813536) (not e!695792))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79019 (_ BitVec 32)) Bool)

(assert (=> b!1224925 (= res!813536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!46593 0))(
  ( (V!46594 (val!15606 Int)) )
))
(declare-datatypes ((tuple2!20114 0))(
  ( (tuple2!20115 (_1!10068 (_ BitVec 64)) (_2!10068 V!46593)) )
))
(declare-fun lt!557467 () tuple2!20114)

(declare-fun e!695786 () Bool)

(declare-datatypes ((List!26930 0))(
  ( (Nil!26927) (Cons!26926 (h!28144 tuple2!20114) (t!40297 List!26930)) )
))
(declare-datatypes ((ListLongMap!18091 0))(
  ( (ListLongMap!18092 (toList!9061 List!26930)) )
))
(declare-fun lt!557457 () ListLongMap!18091)

(declare-fun b!1224926 () Bool)

(declare-fun lt!557471 () ListLongMap!18091)

(declare-fun +!4163 (ListLongMap!18091 tuple2!20114) ListLongMap!18091)

(assert (=> b!1224926 (= e!695786 (= lt!557457 (+!4163 lt!557471 lt!557467)))))

(declare-fun b!1224928 () Bool)

(declare-datatypes ((Unit!40502 0))(
  ( (Unit!40503) )
))
(declare-fun e!695796 () Unit!40502)

(declare-fun Unit!40504 () Unit!40502)

(assert (=> b!1224928 (= e!695796 Unit!40504)))

(declare-fun b!1224929 () Bool)

(declare-fun res!813545 () Bool)

(assert (=> b!1224929 (=> (not res!813545) (not e!695792))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1224929 (= res!813545 (= (select (arr!38130 _keys!1208) i!673) k0!934))))

(declare-fun b!1224930 () Bool)

(declare-fun res!813537 () Bool)

(assert (=> b!1224930 (=> (not res!813537) (not e!695792))))

(assert (=> b!1224930 (= res!813537 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38667 _keys!1208))))))

(declare-fun b!1224931 () Bool)

(declare-fun e!695788 () Bool)

(declare-fun e!695787 () Bool)

(assert (=> b!1224931 (= e!695788 e!695787)))

(declare-fun res!813541 () Bool)

(assert (=> b!1224931 (=> res!813541 e!695787)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1224931 (= res!813541 (not (= (select (arr!38130 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224932 () Bool)

(declare-fun e!695797 () Bool)

(declare-fun e!695791 () Bool)

(assert (=> b!1224932 (= e!695797 e!695791)))

(declare-fun res!813546 () Bool)

(assert (=> b!1224932 (=> res!813546 e!695791)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224932 (= res!813546 (not (validKeyInArray!0 (select (arr!38130 _keys!1208) from!1455))))))

(declare-fun lt!557460 () ListLongMap!18091)

(declare-fun lt!557469 () ListLongMap!18091)

(assert (=> b!1224932 (= lt!557460 lt!557469)))

(declare-fun -!1939 (ListLongMap!18091 (_ BitVec 64)) ListLongMap!18091)

(assert (=> b!1224932 (= lt!557469 (-!1939 lt!557471 k0!934))))

(declare-fun zeroValue!944 () V!46593)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!557466 () array!79019)

(declare-datatypes ((ValueCell!14840 0))(
  ( (ValueCellFull!14840 (v!18264 V!46593)) (EmptyCell!14840) )
))
(declare-datatypes ((array!79021 0))(
  ( (array!79022 (arr!38131 (Array (_ BitVec 32) ValueCell!14840)) (size!38668 (_ BitVec 32))) )
))
(declare-fun lt!557470 () array!79021)

(declare-fun minValue!944 () V!46593)

(declare-fun getCurrentListMapNoExtraKeys!5513 (array!79019 array!79021 (_ BitVec 32) (_ BitVec 32) V!46593 V!46593 (_ BitVec 32) Int) ListLongMap!18091)

(assert (=> b!1224932 (= lt!557460 (getCurrentListMapNoExtraKeys!5513 lt!557466 lt!557470 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!79021)

(assert (=> b!1224932 (= lt!557471 (getCurrentListMapNoExtraKeys!5513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557458 () Unit!40502)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1154 (array!79019 array!79021 (_ BitVec 32) (_ BitVec 32) V!46593 V!46593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40502)

(assert (=> b!1224932 (= lt!557458 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1154 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!48547 () Bool)

(declare-fun mapRes!48547 () Bool)

(declare-fun tp!92231 () Bool)

(declare-fun e!695785 () Bool)

(assert (=> mapNonEmpty!48547 (= mapRes!48547 (and tp!92231 e!695785))))

(declare-fun mapRest!48547 () (Array (_ BitVec 32) ValueCell!14840))

(declare-fun mapValue!48547 () ValueCell!14840)

(declare-fun mapKey!48547 () (_ BitVec 32))

(assert (=> mapNonEmpty!48547 (= (arr!38131 _values!996) (store mapRest!48547 mapKey!48547 mapValue!48547))))

(declare-fun mapIsEmpty!48547 () Bool)

(assert (=> mapIsEmpty!48547 mapRes!48547))

(declare-fun b!1224933 () Bool)

(declare-fun Unit!40505 () Unit!40502)

(assert (=> b!1224933 (= e!695796 Unit!40505)))

(declare-fun lt!557462 () Unit!40502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79019 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40502)

(assert (=> b!1224933 (= lt!557462 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!79019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224933 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557468 () Unit!40502)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79019 (_ BitVec 32) (_ BitVec 32)) Unit!40502)

(assert (=> b!1224933 (= lt!557468 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224933 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26926)))

(declare-fun lt!557464 () Unit!40502)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79019 (_ BitVec 64) (_ BitVec 32) List!26929) Unit!40502)

(assert (=> b!1224933 (= lt!557464 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26926))))

(assert (=> b!1224933 false))

(declare-fun b!1224934 () Bool)

(declare-fun res!813540 () Bool)

(assert (=> b!1224934 (=> (not res!813540) (not e!695792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224934 (= res!813540 (validMask!0 mask!1564))))

(declare-fun b!1224935 () Bool)

(declare-fun e!695790 () Bool)

(assert (=> b!1224935 (= e!695792 e!695790)))

(declare-fun res!813534 () Bool)

(assert (=> b!1224935 (=> (not res!813534) (not e!695790))))

(assert (=> b!1224935 (= res!813534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557466 mask!1564))))

(assert (=> b!1224935 (= lt!557466 (array!79020 (store (arr!38130 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38667 _keys!1208)))))

(declare-fun b!1224936 () Bool)

(declare-fun e!695795 () Bool)

(declare-fun tp_is_empty!31099 () Bool)

(assert (=> b!1224936 (= e!695795 tp_is_empty!31099)))

(declare-fun res!813544 () Bool)

(assert (=> start!101942 (=> (not res!813544) (not e!695792))))

(assert (=> start!101942 (= res!813544 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38667 _keys!1208))))))

(assert (=> start!101942 e!695792))

(assert (=> start!101942 tp_is_empty!31099))

(declare-fun array_inv!29088 (array!79019) Bool)

(assert (=> start!101942 (array_inv!29088 _keys!1208)))

(assert (=> start!101942 true))

(assert (=> start!101942 tp!92230))

(declare-fun e!695794 () Bool)

(declare-fun array_inv!29089 (array!79021) Bool)

(assert (=> start!101942 (and (array_inv!29089 _values!996) e!695794)))

(declare-fun b!1224927 () Bool)

(declare-fun res!813547 () Bool)

(assert (=> b!1224927 (=> (not res!813547) (not e!695790))))

(assert (=> b!1224927 (= res!813547 (arrayNoDuplicates!0 lt!557466 #b00000000000000000000000000000000 Nil!26926))))

(declare-fun b!1224937 () Bool)

(declare-fun e!695789 () Bool)

(assert (=> b!1224937 (= e!695789 e!695797)))

(declare-fun res!813539 () Bool)

(assert (=> b!1224937 (=> res!813539 e!695797)))

(assert (=> b!1224937 (= res!813539 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!557463 () ListLongMap!18091)

(assert (=> b!1224937 (= lt!557463 (getCurrentListMapNoExtraKeys!5513 lt!557466 lt!557470 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!557461 () V!46593)

(assert (=> b!1224937 (= lt!557470 (array!79022 (store (arr!38131 _values!996) i!673 (ValueCellFull!14840 lt!557461)) (size!38668 _values!996)))))

(declare-fun dynLambda!3412 (Int (_ BitVec 64)) V!46593)

(assert (=> b!1224937 (= lt!557461 (dynLambda!3412 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1224937 (= lt!557457 (getCurrentListMapNoExtraKeys!5513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224938 () Bool)

(declare-fun res!813535 () Bool)

(assert (=> b!1224938 (=> (not res!813535) (not e!695792))))

(assert (=> b!1224938 (= res!813535 (validKeyInArray!0 k0!934))))

(declare-fun b!1224939 () Bool)

(assert (=> b!1224939 (= e!695794 (and e!695795 mapRes!48547))))

(declare-fun condMapEmpty!48547 () Bool)

(declare-fun mapDefault!48547 () ValueCell!14840)

(assert (=> b!1224939 (= condMapEmpty!48547 (= (arr!38131 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14840)) mapDefault!48547)))))

(declare-fun b!1224940 () Bool)

(declare-fun res!813542 () Bool)

(assert (=> b!1224940 (=> (not res!813542) (not e!695792))))

(assert (=> b!1224940 (= res!813542 (and (= (size!38668 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38667 _keys!1208) (size!38668 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224941 () Bool)

(assert (=> b!1224941 (= e!695785 tp_is_empty!31099)))

(declare-fun b!1224942 () Bool)

(assert (=> b!1224942 (= e!695791 (bvslt i!673 (size!38668 _values!996)))))

(assert (=> b!1224942 e!695786))

(declare-fun res!813543 () Bool)

(assert (=> b!1224942 (=> (not res!813543) (not e!695786))))

(assert (=> b!1224942 (= res!813543 (not (= (select (arr!38130 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557465 () Unit!40502)

(assert (=> b!1224942 (= lt!557465 e!695796)))

(declare-fun c!120811 () Bool)

(assert (=> b!1224942 (= c!120811 (= (select (arr!38130 _keys!1208) from!1455) k0!934))))

(assert (=> b!1224942 e!695788))

(declare-fun res!813538 () Bool)

(assert (=> b!1224942 (=> (not res!813538) (not e!695788))))

(assert (=> b!1224942 (= res!813538 (= lt!557463 (+!4163 lt!557469 lt!557467)))))

(declare-fun get!19514 (ValueCell!14840 V!46593) V!46593)

(assert (=> b!1224942 (= lt!557467 (tuple2!20115 (select (arr!38130 _keys!1208) from!1455) (get!19514 (select (arr!38131 _values!996) from!1455) lt!557461)))))

(declare-fun b!1224943 () Bool)

(assert (=> b!1224943 (= e!695787 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224944 () Bool)

(assert (=> b!1224944 (= e!695790 (not e!695789))))

(declare-fun res!813548 () Bool)

(assert (=> b!1224944 (=> res!813548 e!695789)))

(assert (=> b!1224944 (= res!813548 (bvsgt from!1455 i!673))))

(assert (=> b!1224944 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557459 () Unit!40502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79019 (_ BitVec 64) (_ BitVec 32)) Unit!40502)

(assert (=> b!1224944 (= lt!557459 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101942 res!813544) b!1224934))

(assert (= (and b!1224934 res!813540) b!1224940))

(assert (= (and b!1224940 res!813542) b!1224925))

(assert (= (and b!1224925 res!813536) b!1224924))

(assert (= (and b!1224924 res!813549) b!1224930))

(assert (= (and b!1224930 res!813537) b!1224938))

(assert (= (and b!1224938 res!813535) b!1224929))

(assert (= (and b!1224929 res!813545) b!1224935))

(assert (= (and b!1224935 res!813534) b!1224927))

(assert (= (and b!1224927 res!813547) b!1224944))

(assert (= (and b!1224944 (not res!813548)) b!1224937))

(assert (= (and b!1224937 (not res!813539)) b!1224932))

(assert (= (and b!1224932 (not res!813546)) b!1224942))

(assert (= (and b!1224942 res!813538) b!1224931))

(assert (= (and b!1224931 (not res!813541)) b!1224943))

(assert (= (and b!1224942 c!120811) b!1224933))

(assert (= (and b!1224942 (not c!120811)) b!1224928))

(assert (= (and b!1224942 res!813543) b!1224926))

(assert (= (and b!1224939 condMapEmpty!48547) mapIsEmpty!48547))

(assert (= (and b!1224939 (not condMapEmpty!48547)) mapNonEmpty!48547))

(get-info :version)

(assert (= (and mapNonEmpty!48547 ((_ is ValueCellFull!14840) mapValue!48547)) b!1224941))

(assert (= (and b!1224939 ((_ is ValueCellFull!14840) mapDefault!48547)) b!1224936))

(assert (= start!101942 b!1224939))

(declare-fun b_lambda!22369 () Bool)

(assert (=> (not b_lambda!22369) (not b!1224937)))

(declare-fun t!40295 () Bool)

(declare-fun tb!11187 () Bool)

(assert (=> (and start!101942 (= defaultEntry!1004 defaultEntry!1004) t!40295) tb!11187))

(declare-fun result!22995 () Bool)

(assert (=> tb!11187 (= result!22995 tp_is_empty!31099)))

(assert (=> b!1224937 t!40295))

(declare-fun b_and!44055 () Bool)

(assert (= b_and!44053 (and (=> t!40295 result!22995) b_and!44055)))

(declare-fun m!1130237 () Bool)

(assert (=> b!1224935 m!1130237))

(declare-fun m!1130239 () Bool)

(assert (=> b!1224935 m!1130239))

(declare-fun m!1130241 () Bool)

(assert (=> b!1224924 m!1130241))

(declare-fun m!1130243 () Bool)

(assert (=> b!1224944 m!1130243))

(declare-fun m!1130245 () Bool)

(assert (=> b!1224944 m!1130245))

(declare-fun m!1130247 () Bool)

(assert (=> b!1224927 m!1130247))

(declare-fun m!1130249 () Bool)

(assert (=> b!1224929 m!1130249))

(declare-fun m!1130251 () Bool)

(assert (=> b!1224933 m!1130251))

(declare-fun m!1130253 () Bool)

(assert (=> b!1224933 m!1130253))

(declare-fun m!1130255 () Bool)

(assert (=> b!1224933 m!1130255))

(declare-fun m!1130257 () Bool)

(assert (=> b!1224933 m!1130257))

(declare-fun m!1130259 () Bool)

(assert (=> b!1224933 m!1130259))

(declare-fun m!1130261 () Bool)

(assert (=> b!1224937 m!1130261))

(declare-fun m!1130263 () Bool)

(assert (=> b!1224937 m!1130263))

(declare-fun m!1130265 () Bool)

(assert (=> b!1224937 m!1130265))

(declare-fun m!1130267 () Bool)

(assert (=> b!1224937 m!1130267))

(declare-fun m!1130269 () Bool)

(assert (=> b!1224938 m!1130269))

(declare-fun m!1130271 () Bool)

(assert (=> b!1224926 m!1130271))

(declare-fun m!1130273 () Bool)

(assert (=> b!1224925 m!1130273))

(declare-fun m!1130275 () Bool)

(assert (=> b!1224932 m!1130275))

(declare-fun m!1130277 () Bool)

(assert (=> b!1224932 m!1130277))

(declare-fun m!1130279 () Bool)

(assert (=> b!1224932 m!1130279))

(declare-fun m!1130281 () Bool)

(assert (=> b!1224932 m!1130281))

(assert (=> b!1224932 m!1130279))

(declare-fun m!1130283 () Bool)

(assert (=> b!1224932 m!1130283))

(declare-fun m!1130285 () Bool)

(assert (=> b!1224932 m!1130285))

(declare-fun m!1130287 () Bool)

(assert (=> start!101942 m!1130287))

(declare-fun m!1130289 () Bool)

(assert (=> start!101942 m!1130289))

(declare-fun m!1130291 () Bool)

(assert (=> b!1224943 m!1130291))

(assert (=> b!1224931 m!1130279))

(declare-fun m!1130293 () Bool)

(assert (=> mapNonEmpty!48547 m!1130293))

(declare-fun m!1130295 () Bool)

(assert (=> b!1224934 m!1130295))

(assert (=> b!1224942 m!1130279))

(declare-fun m!1130297 () Bool)

(assert (=> b!1224942 m!1130297))

(declare-fun m!1130299 () Bool)

(assert (=> b!1224942 m!1130299))

(assert (=> b!1224942 m!1130299))

(declare-fun m!1130301 () Bool)

(assert (=> b!1224942 m!1130301))

(check-sat (not start!101942) (not b!1224932) (not b!1224925) (not b!1224943) (not b_lambda!22369) (not b!1224942) (not mapNonEmpty!48547) (not b!1224944) b_and!44055 (not b!1224937) (not b!1224933) (not b!1224927) (not b!1224938) (not b!1224926) (not b!1224934) tp_is_empty!31099 (not b!1224924) (not b!1224935) (not b_next!26395))
(check-sat b_and!44055 (not b_next!26395))
