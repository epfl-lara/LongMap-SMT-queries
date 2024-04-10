; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98878 () Bool)

(assert start!98878)

(declare-fun b_free!24483 () Bool)

(declare-fun b_next!24483 () Bool)

(assert (=> start!98878 (= b_free!24483 (not b_next!24483))))

(declare-fun tp!86160 () Bool)

(declare-fun b_and!39815 () Bool)

(assert (=> start!98878 (= tp!86160 b_and!39815)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!658113 () Bool)

(declare-fun lt!519690 () Bool)

(declare-fun b!1157230 () Bool)

(assert (=> b!1157230 (= e!658113 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519690) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!43811 0))(
  ( (V!43812 (val!14563 Int)) )
))
(declare-fun zeroValue!944 () V!43811)

(declare-fun c!115209 () Bool)

(declare-fun c!115210 () Bool)

(declare-datatypes ((tuple2!18528 0))(
  ( (tuple2!18529 (_1!9275 (_ BitVec 64)) (_2!9275 V!43811)) )
))
(declare-datatypes ((List!25269 0))(
  ( (Nil!25266) (Cons!25265 (h!26474 tuple2!18528) (t!36744 List!25269)) )
))
(declare-datatypes ((ListLongMap!16497 0))(
  ( (ListLongMap!16498 (toList!8264 List!25269)) )
))
(declare-fun call!55341 () ListLongMap!16497)

(declare-fun bm!55335 () Bool)

(declare-fun lt!519683 () ListLongMap!16497)

(declare-fun minValue!944 () V!43811)

(declare-fun +!3675 (ListLongMap!16497 tuple2!18528) ListLongMap!16497)

(assert (=> bm!55335 (= call!55341 (+!3675 lt!519683 (ite (or c!115210 c!115209) (tuple2!18529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapIsEmpty!45344 () Bool)

(declare-fun mapRes!45344 () Bool)

(assert (=> mapIsEmpty!45344 mapRes!45344))

(declare-fun b!1157231 () Bool)

(declare-fun res!768534 () Bool)

(declare-fun e!658102 () Bool)

(assert (=> b!1157231 (=> (not res!768534) (not e!658102))))

(declare-datatypes ((array!74869 0))(
  ( (array!74870 (arr!36085 (Array (_ BitVec 32) (_ BitVec 64))) (size!36621 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74869)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13797 0))(
  ( (ValueCellFull!13797 (v!17200 V!43811)) (EmptyCell!13797) )
))
(declare-datatypes ((array!74871 0))(
  ( (array!74872 (arr!36086 (Array (_ BitVec 32) ValueCell!13797)) (size!36622 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74871)

(assert (=> b!1157231 (= res!768534 (and (= (size!36622 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36621 _keys!1208) (size!36622 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157232 () Bool)

(declare-fun call!55342 () ListLongMap!16497)

(declare-fun e!658104 () Bool)

(declare-fun call!55339 () ListLongMap!16497)

(declare-fun -!1378 (ListLongMap!16497 (_ BitVec 64)) ListLongMap!16497)

(assert (=> b!1157232 (= e!658104 (= call!55339 (-!1378 call!55342 k0!934)))))

(declare-fun b!1157233 () Bool)

(declare-fun call!55343 () Bool)

(assert (=> b!1157233 call!55343))

(declare-datatypes ((Unit!38120 0))(
  ( (Unit!38121) )
))
(declare-fun lt!519680 () Unit!38120)

(declare-fun call!55345 () Unit!38120)

(assert (=> b!1157233 (= lt!519680 call!55345)))

(declare-fun e!658114 () Unit!38120)

(assert (=> b!1157233 (= e!658114 lt!519680)))

(declare-fun b!1157234 () Bool)

(declare-fun e!658110 () Unit!38120)

(declare-fun lt!519685 () Unit!38120)

(assert (=> b!1157234 (= e!658110 lt!519685)))

(assert (=> b!1157234 (= lt!519685 call!55345)))

(assert (=> b!1157234 call!55343))

(declare-fun b!1157235 () Bool)

(declare-fun res!768548 () Bool)

(assert (=> b!1157235 (=> (not res!768548) (not e!658102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157235 (= res!768548 (validKeyInArray!0 k0!934))))

(declare-fun b!1157236 () Bool)

(declare-fun e!658101 () Unit!38120)

(declare-fun Unit!38122 () Unit!38120)

(assert (=> b!1157236 (= e!658101 Unit!38122)))

(declare-fun bm!55336 () Bool)

(declare-fun call!55340 () Unit!38120)

(assert (=> bm!55336 (= call!55345 call!55340)))

(declare-fun b!1157237 () Bool)

(declare-fun Unit!38123 () Unit!38120)

(assert (=> b!1157237 (= e!658101 Unit!38123)))

(assert (=> b!1157237 (= lt!519690 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1157237 (= c!115210 (and (not lt!519690) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519693 () Unit!38120)

(declare-fun e!658115 () Unit!38120)

(assert (=> b!1157237 (= lt!519693 e!658115)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!519688 () Unit!38120)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!505 (array!74869 array!74871 (_ BitVec 32) (_ BitVec 32) V!43811 V!43811 (_ BitVec 64) (_ BitVec 32) Int) Unit!38120)

(assert (=> b!1157237 (= lt!519688 (lemmaListMapContainsThenArrayContainsFrom!505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115205 () Bool)

(assert (=> b!1157237 (= c!115205 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768545 () Bool)

(assert (=> b!1157237 (= res!768545 e!658113)))

(declare-fun e!658112 () Bool)

(assert (=> b!1157237 (=> (not res!768545) (not e!658112))))

(assert (=> b!1157237 e!658112))

(declare-fun lt!519682 () Unit!38120)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74869 (_ BitVec 32) (_ BitVec 32)) Unit!38120)

(assert (=> b!1157237 (= lt!519682 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25270 0))(
  ( (Nil!25267) (Cons!25266 (h!26475 (_ BitVec 64)) (t!36745 List!25270)) )
))
(declare-fun arrayNoDuplicates!0 (array!74869 (_ BitVec 32) List!25270) Bool)

(assert (=> b!1157237 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25267)))

(declare-fun lt!519681 () Unit!38120)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74869 (_ BitVec 64) (_ BitVec 32) List!25270) Unit!38120)

(assert (=> b!1157237 (= lt!519681 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25267))))

(assert (=> b!1157237 false))

(declare-fun b!1157238 () Bool)

(declare-fun res!768538 () Bool)

(assert (=> b!1157238 (=> (not res!768538) (not e!658102))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157238 (= res!768538 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36621 _keys!1208))))))

(declare-fun b!1157239 () Bool)

(declare-fun res!768542 () Bool)

(assert (=> b!1157239 (=> (not res!768542) (not e!658102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157239 (= res!768542 (validMask!0 mask!1564))))

(declare-fun b!1157240 () Bool)

(declare-fun res!768537 () Bool)

(assert (=> b!1157240 (=> (not res!768537) (not e!658102))))

(assert (=> b!1157240 (= res!768537 (= (select (arr!36085 _keys!1208) i!673) k0!934))))

(declare-fun b!1157241 () Bool)

(assert (=> b!1157241 (= e!658104 (= call!55339 call!55342))))

(declare-fun lt!519691 () array!74871)

(declare-fun lt!519675 () array!74869)

(declare-fun bm!55337 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4731 (array!74869 array!74871 (_ BitVec 32) (_ BitVec 32) V!43811 V!43811 (_ BitVec 32) Int) ListLongMap!16497)

(assert (=> bm!55337 (= call!55339 (getCurrentListMapNoExtraKeys!4731 lt!519675 lt!519691 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157242 () Bool)

(assert (=> b!1157242 (= c!115209 (and (not lt!519690) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1157242 (= e!658115 e!658110)))

(declare-fun b!1157243 () Bool)

(declare-fun e!658103 () Bool)

(assert (=> b!1157243 (= e!658102 e!658103)))

(declare-fun res!768539 () Bool)

(assert (=> b!1157243 (=> (not res!768539) (not e!658103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74869 (_ BitVec 32)) Bool)

(assert (=> b!1157243 (= res!768539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519675 mask!1564))))

(assert (=> b!1157243 (= lt!519675 (array!74870 (store (arr!36085 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36621 _keys!1208)))))

(declare-fun b!1157244 () Bool)

(declare-fun lt!519676 () ListLongMap!16497)

(declare-fun contains!6775 (ListLongMap!16497 (_ BitVec 64)) Bool)

(assert (=> b!1157244 (contains!6775 (+!3675 lt!519676 (tuple2!18529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!519679 () Unit!38120)

(assert (=> b!1157244 (= lt!519679 call!55340)))

(declare-fun call!55338 () Bool)

(assert (=> b!1157244 call!55338))

(assert (=> b!1157244 (= lt!519676 call!55341)))

(declare-fun lt!519677 () Unit!38120)

(declare-fun addStillContains!917 (ListLongMap!16497 (_ BitVec 64) V!43811 (_ BitVec 64)) Unit!38120)

(assert (=> b!1157244 (= lt!519677 (addStillContains!917 lt!519683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1157244 (= e!658115 lt!519679)))

(declare-fun b!1157245 () Bool)

(assert (=> b!1157245 (= e!658110 e!658114)))

(declare-fun c!115207 () Bool)

(assert (=> b!1157245 (= c!115207 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519690))))

(declare-fun b!1157246 () Bool)

(declare-fun arrayContainsKey!0 (array!74869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157246 (= e!658113 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45344 () Bool)

(declare-fun tp!86159 () Bool)

(declare-fun e!658106 () Bool)

(assert (=> mapNonEmpty!45344 (= mapRes!45344 (and tp!86159 e!658106))))

(declare-fun mapValue!45344 () ValueCell!13797)

(declare-fun mapKey!45344 () (_ BitVec 32))

(declare-fun mapRest!45344 () (Array (_ BitVec 32) ValueCell!13797))

(assert (=> mapNonEmpty!45344 (= (arr!36086 _values!996) (store mapRest!45344 mapKey!45344 mapValue!45344))))

(declare-fun b!1157247 () Bool)

(declare-fun res!768535 () Bool)

(assert (=> b!1157247 (=> (not res!768535) (not e!658103))))

(assert (=> b!1157247 (= res!768535 (arrayNoDuplicates!0 lt!519675 #b00000000000000000000000000000000 Nil!25267))))

(declare-fun b!1157248 () Bool)

(declare-fun res!768543 () Bool)

(assert (=> b!1157248 (=> (not res!768543) (not e!658102))))

(assert (=> b!1157248 (= res!768543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1157249 () Bool)

(declare-fun e!658100 () Bool)

(declare-fun e!658111 () Bool)

(assert (=> b!1157249 (= e!658100 e!658111)))

(declare-fun res!768540 () Bool)

(assert (=> b!1157249 (=> res!768540 e!658111)))

(assert (=> b!1157249 (= res!768540 (not (= from!1455 i!673)))))

(declare-fun lt!519673 () ListLongMap!16497)

(assert (=> b!1157249 (= lt!519673 (getCurrentListMapNoExtraKeys!4731 lt!519675 lt!519691 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!519686 () V!43811)

(assert (=> b!1157249 (= lt!519691 (array!74872 (store (arr!36086 _values!996) i!673 (ValueCellFull!13797 lt!519686)) (size!36622 _values!996)))))

(declare-fun dynLambda!2738 (Int (_ BitVec 64)) V!43811)

(assert (=> b!1157249 (= lt!519686 (dynLambda!2738 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!519672 () ListLongMap!16497)

(assert (=> b!1157249 (= lt!519672 (getCurrentListMapNoExtraKeys!4731 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1157250 () Bool)

(declare-fun e!658108 () Bool)

(assert (=> b!1157250 (= e!658108 true)))

(declare-fun e!658116 () Bool)

(assert (=> b!1157250 e!658116))

(declare-fun res!768547 () Bool)

(assert (=> b!1157250 (=> (not res!768547) (not e!658116))))

(declare-fun lt!519674 () ListLongMap!16497)

(assert (=> b!1157250 (= res!768547 (= lt!519674 lt!519683))))

(assert (=> b!1157250 (= lt!519674 (-!1378 lt!519672 k0!934))))

(declare-fun lt!519684 () V!43811)

(assert (=> b!1157250 (= (-!1378 (+!3675 lt!519683 (tuple2!18529 (select (arr!36085 _keys!1208) from!1455) lt!519684)) (select (arr!36085 _keys!1208) from!1455)) lt!519683)))

(declare-fun lt!519678 () Unit!38120)

(declare-fun addThenRemoveForNewKeyIsSame!217 (ListLongMap!16497 (_ BitVec 64) V!43811) Unit!38120)

(assert (=> b!1157250 (= lt!519678 (addThenRemoveForNewKeyIsSame!217 lt!519683 (select (arr!36085 _keys!1208) from!1455) lt!519684))))

(declare-fun get!18391 (ValueCell!13797 V!43811) V!43811)

(assert (=> b!1157250 (= lt!519684 (get!18391 (select (arr!36086 _values!996) from!1455) lt!519686))))

(declare-fun lt!519692 () Unit!38120)

(assert (=> b!1157250 (= lt!519692 e!658101)))

(declare-fun c!115206 () Bool)

(assert (=> b!1157250 (= c!115206 (contains!6775 lt!519683 k0!934))))

(assert (=> b!1157250 (= lt!519683 (getCurrentListMapNoExtraKeys!4731 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157251 () Bool)

(assert (=> b!1157251 (= e!658112 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!55338 () Bool)

(declare-fun call!55344 () ListLongMap!16497)

(assert (=> bm!55338 (= call!55344 call!55341)))

(declare-fun b!1157252 () Bool)

(declare-fun Unit!38124 () Unit!38120)

(assert (=> b!1157252 (= e!658114 Unit!38124)))

(declare-fun b!1157253 () Bool)

(assert (=> b!1157253 (= e!658103 (not e!658100))))

(declare-fun res!768544 () Bool)

(assert (=> b!1157253 (=> res!768544 e!658100)))

(assert (=> b!1157253 (= res!768544 (bvsgt from!1455 i!673))))

(assert (=> b!1157253 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519689 () Unit!38120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74869 (_ BitVec 64) (_ BitVec 32)) Unit!38120)

(assert (=> b!1157253 (= lt!519689 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!55339 () Bool)

(assert (=> bm!55339 (= call!55343 call!55338)))

(declare-fun b!1157254 () Bool)

(declare-fun res!768546 () Bool)

(assert (=> b!1157254 (=> (not res!768546) (not e!658102))))

(assert (=> b!1157254 (= res!768546 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25267))))

(declare-fun bm!55340 () Bool)

(assert (=> bm!55340 (= call!55342 (getCurrentListMapNoExtraKeys!4731 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157255 () Bool)

(declare-fun e!658105 () Bool)

(declare-fun tp_is_empty!29013 () Bool)

(assert (=> b!1157255 (= e!658105 tp_is_empty!29013)))

(declare-fun b!1157256 () Bool)

(assert (=> b!1157256 (= e!658111 e!658108)))

(declare-fun res!768536 () Bool)

(assert (=> b!1157256 (=> res!768536 e!658108)))

(assert (=> b!1157256 (= res!768536 (not (= (select (arr!36085 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1157256 e!658104))

(declare-fun c!115208 () Bool)

(assert (=> b!1157256 (= c!115208 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519687 () Unit!38120)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!611 (array!74869 array!74871 (_ BitVec 32) (_ BitVec 32) V!43811 V!43811 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38120)

(assert (=> b!1157256 (= lt!519687 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!611 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157257 () Bool)

(assert (=> b!1157257 (= e!658106 tp_is_empty!29013)))

(declare-fun res!768541 () Bool)

(assert (=> start!98878 (=> (not res!768541) (not e!658102))))

(assert (=> start!98878 (= res!768541 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36621 _keys!1208))))))

(assert (=> start!98878 e!658102))

(assert (=> start!98878 tp_is_empty!29013))

(declare-fun array_inv!27616 (array!74869) Bool)

(assert (=> start!98878 (array_inv!27616 _keys!1208)))

(assert (=> start!98878 true))

(assert (=> start!98878 tp!86160))

(declare-fun e!658107 () Bool)

(declare-fun array_inv!27617 (array!74871) Bool)

(assert (=> start!98878 (and (array_inv!27617 _values!996) e!658107)))

(declare-fun b!1157258 () Bool)

(assert (=> b!1157258 (= e!658116 (= lt!519674 (getCurrentListMapNoExtraKeys!4731 lt!519675 lt!519691 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1157259 () Bool)

(assert (=> b!1157259 (= e!658107 (and e!658105 mapRes!45344))))

(declare-fun condMapEmpty!45344 () Bool)

(declare-fun mapDefault!45344 () ValueCell!13797)

(assert (=> b!1157259 (= condMapEmpty!45344 (= (arr!36086 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13797)) mapDefault!45344)))))

(declare-fun bm!55341 () Bool)

(assert (=> bm!55341 (= call!55340 (addStillContains!917 (ite c!115210 lt!519676 lt!519683) (ite c!115210 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115209 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115210 minValue!944 (ite c!115209 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!55342 () Bool)

(assert (=> bm!55342 (= call!55338 (contains!6775 (ite c!115210 lt!519676 call!55344) k0!934))))

(assert (= (and start!98878 res!768541) b!1157239))

(assert (= (and b!1157239 res!768542) b!1157231))

(assert (= (and b!1157231 res!768534) b!1157248))

(assert (= (and b!1157248 res!768543) b!1157254))

(assert (= (and b!1157254 res!768546) b!1157238))

(assert (= (and b!1157238 res!768538) b!1157235))

(assert (= (and b!1157235 res!768548) b!1157240))

(assert (= (and b!1157240 res!768537) b!1157243))

(assert (= (and b!1157243 res!768539) b!1157247))

(assert (= (and b!1157247 res!768535) b!1157253))

(assert (= (and b!1157253 (not res!768544)) b!1157249))

(assert (= (and b!1157249 (not res!768540)) b!1157256))

(assert (= (and b!1157256 c!115208) b!1157232))

(assert (= (and b!1157256 (not c!115208)) b!1157241))

(assert (= (or b!1157232 b!1157241) bm!55337))

(assert (= (or b!1157232 b!1157241) bm!55340))

(assert (= (and b!1157256 (not res!768536)) b!1157250))

(assert (= (and b!1157250 c!115206) b!1157237))

(assert (= (and b!1157250 (not c!115206)) b!1157236))

(assert (= (and b!1157237 c!115210) b!1157244))

(assert (= (and b!1157237 (not c!115210)) b!1157242))

(assert (= (and b!1157242 c!115209) b!1157234))

(assert (= (and b!1157242 (not c!115209)) b!1157245))

(assert (= (and b!1157245 c!115207) b!1157233))

(assert (= (and b!1157245 (not c!115207)) b!1157252))

(assert (= (or b!1157234 b!1157233) bm!55336))

(assert (= (or b!1157234 b!1157233) bm!55338))

(assert (= (or b!1157234 b!1157233) bm!55339))

(assert (= (or b!1157244 bm!55339) bm!55342))

(assert (= (or b!1157244 bm!55336) bm!55341))

(assert (= (or b!1157244 bm!55338) bm!55335))

(assert (= (and b!1157237 c!115205) b!1157246))

(assert (= (and b!1157237 (not c!115205)) b!1157230))

(assert (= (and b!1157237 res!768545) b!1157251))

(assert (= (and b!1157250 res!768547) b!1157258))

(assert (= (and b!1157259 condMapEmpty!45344) mapIsEmpty!45344))

(assert (= (and b!1157259 (not condMapEmpty!45344)) mapNonEmpty!45344))

(get-info :version)

(assert (= (and mapNonEmpty!45344 ((_ is ValueCellFull!13797) mapValue!45344)) b!1157257))

(assert (= (and b!1157259 ((_ is ValueCellFull!13797) mapDefault!45344)) b!1157255))

(assert (= start!98878 b!1157259))

(declare-fun b_lambda!19589 () Bool)

(assert (=> (not b_lambda!19589) (not b!1157249)))

(declare-fun t!36743 () Bool)

(declare-fun tb!9295 () Bool)

(assert (=> (and start!98878 (= defaultEntry!1004 defaultEntry!1004) t!36743) tb!9295))

(declare-fun result!19155 () Bool)

(assert (=> tb!9295 (= result!19155 tp_is_empty!29013)))

(assert (=> b!1157249 t!36743))

(declare-fun b_and!39817 () Bool)

(assert (= b_and!39815 (and (=> t!36743 result!19155) b_and!39817)))

(declare-fun m!1066589 () Bool)

(assert (=> start!98878 m!1066589))

(declare-fun m!1066591 () Bool)

(assert (=> start!98878 m!1066591))

(declare-fun m!1066593 () Bool)

(assert (=> mapNonEmpty!45344 m!1066593))

(declare-fun m!1066595 () Bool)

(assert (=> b!1157249 m!1066595))

(declare-fun m!1066597 () Bool)

(assert (=> b!1157249 m!1066597))

(declare-fun m!1066599 () Bool)

(assert (=> b!1157249 m!1066599))

(declare-fun m!1066601 () Bool)

(assert (=> b!1157249 m!1066601))

(declare-fun m!1066603 () Bool)

(assert (=> b!1157250 m!1066603))

(declare-fun m!1066605 () Bool)

(assert (=> b!1157250 m!1066605))

(declare-fun m!1066607 () Bool)

(assert (=> b!1157250 m!1066607))

(declare-fun m!1066609 () Bool)

(assert (=> b!1157250 m!1066609))

(declare-fun m!1066611 () Bool)

(assert (=> b!1157250 m!1066611))

(declare-fun m!1066613 () Bool)

(assert (=> b!1157250 m!1066613))

(assert (=> b!1157250 m!1066607))

(declare-fun m!1066615 () Bool)

(assert (=> b!1157250 m!1066615))

(declare-fun m!1066617 () Bool)

(assert (=> b!1157250 m!1066617))

(assert (=> b!1157250 m!1066609))

(assert (=> b!1157250 m!1066611))

(declare-fun m!1066619 () Bool)

(assert (=> b!1157250 m!1066619))

(assert (=> b!1157250 m!1066611))

(declare-fun m!1066621 () Bool)

(assert (=> b!1157251 m!1066621))

(declare-fun m!1066623 () Bool)

(assert (=> b!1157253 m!1066623))

(declare-fun m!1066625 () Bool)

(assert (=> b!1157253 m!1066625))

(declare-fun m!1066627 () Bool)

(assert (=> bm!55335 m!1066627))

(declare-fun m!1066629 () Bool)

(assert (=> bm!55341 m!1066629))

(declare-fun m!1066631 () Bool)

(assert (=> b!1157254 m!1066631))

(declare-fun m!1066633 () Bool)

(assert (=> b!1157247 m!1066633))

(declare-fun m!1066635 () Bool)

(assert (=> b!1157244 m!1066635))

(assert (=> b!1157244 m!1066635))

(declare-fun m!1066637 () Bool)

(assert (=> b!1157244 m!1066637))

(declare-fun m!1066639 () Bool)

(assert (=> b!1157244 m!1066639))

(declare-fun m!1066641 () Bool)

(assert (=> b!1157258 m!1066641))

(declare-fun m!1066643 () Bool)

(assert (=> b!1157235 m!1066643))

(assert (=> b!1157246 m!1066621))

(declare-fun m!1066645 () Bool)

(assert (=> b!1157248 m!1066645))

(assert (=> b!1157256 m!1066611))

(declare-fun m!1066647 () Bool)

(assert (=> b!1157256 m!1066647))

(declare-fun m!1066649 () Bool)

(assert (=> b!1157240 m!1066649))

(declare-fun m!1066651 () Bool)

(assert (=> b!1157239 m!1066651))

(assert (=> bm!55340 m!1066603))

(declare-fun m!1066653 () Bool)

(assert (=> b!1157237 m!1066653))

(declare-fun m!1066655 () Bool)

(assert (=> b!1157237 m!1066655))

(declare-fun m!1066657 () Bool)

(assert (=> b!1157237 m!1066657))

(declare-fun m!1066659 () Bool)

(assert (=> b!1157237 m!1066659))

(declare-fun m!1066661 () Bool)

(assert (=> b!1157243 m!1066661))

(declare-fun m!1066663 () Bool)

(assert (=> b!1157243 m!1066663))

(declare-fun m!1066665 () Bool)

(assert (=> bm!55342 m!1066665))

(declare-fun m!1066667 () Bool)

(assert (=> b!1157232 m!1066667))

(assert (=> bm!55337 m!1066641))

(check-sat (not bm!55342) b_and!39817 (not b!1157251) (not bm!55341) (not b!1157253) (not b_lambda!19589) (not b!1157239) (not mapNonEmpty!45344) (not b!1157254) (not b!1157256) (not b!1157248) (not bm!55337) (not b!1157249) (not b!1157244) (not start!98878) (not b!1157237) (not bm!55335) (not b!1157243) (not b!1157247) (not b_next!24483) (not b!1157235) (not bm!55340) (not b!1157232) (not b!1157250) tp_is_empty!29013 (not b!1157258) (not b!1157246))
(check-sat b_and!39817 (not b_next!24483))
