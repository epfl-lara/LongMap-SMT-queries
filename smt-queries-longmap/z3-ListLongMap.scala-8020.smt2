; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98962 () Bool)

(assert start!98962)

(declare-fun b_free!24567 () Bool)

(declare-fun b_next!24567 () Bool)

(assert (=> start!98962 (= b_free!24567 (not b_next!24567))))

(declare-fun tp!86411 () Bool)

(declare-fun b_and!39983 () Bool)

(assert (=> start!98962 (= tp!86411 b_and!39983)))

(declare-fun b!1161094 () Bool)

(declare-datatypes ((Unit!38290 0))(
  ( (Unit!38291) )
))
(declare-fun e!660244 () Unit!38290)

(declare-fun Unit!38292 () Unit!38290)

(assert (=> b!1161094 (= e!660244 Unit!38292)))

(declare-datatypes ((V!43923 0))(
  ( (V!43924 (val!14605 Int)) )
))
(declare-fun zeroValue!944 () V!43923)

(declare-datatypes ((tuple2!18608 0))(
  ( (tuple2!18609 (_1!9315 (_ BitVec 64)) (_2!9315 V!43923)) )
))
(declare-datatypes ((List!25344 0))(
  ( (Nil!25341) (Cons!25340 (h!26549 tuple2!18608) (t!36903 List!25344)) )
))
(declare-datatypes ((ListLongMap!16577 0))(
  ( (ListLongMap!16578 (toList!8304 List!25344)) )
))
(declare-fun lt!522459 () ListLongMap!16577)

(declare-fun c!115962 () Bool)

(declare-fun call!56348 () ListLongMap!16577)

(declare-fun minValue!944 () V!43923)

(declare-fun c!115966 () Bool)

(declare-fun bm!56343 () Bool)

(declare-fun lt!522448 () ListLongMap!16577)

(declare-fun +!3709 (ListLongMap!16577 tuple2!18608) ListLongMap!16577)

(assert (=> bm!56343 (= call!56348 (+!3709 (ite c!115966 lt!522448 lt!522459) (ite c!115966 (tuple2!18609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115962 (tuple2!18609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1161095 () Bool)

(declare-fun e!660253 () Unit!38290)

(declare-fun Unit!38293 () Unit!38290)

(assert (=> b!1161095 (= e!660253 Unit!38293)))

(declare-fun lt!522465 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1161095 (= lt!522465 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1161095 (= c!115966 (and (not lt!522465) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522458 () Unit!38290)

(declare-fun e!660254 () Unit!38290)

(assert (=> b!1161095 (= lt!522458 e!660254)))

(declare-datatypes ((array!75035 0))(
  ( (array!75036 (arr!36168 (Array (_ BitVec 32) (_ BitVec 64))) (size!36704 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75035)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13839 0))(
  ( (ValueCellFull!13839 (v!17242 V!43923)) (EmptyCell!13839) )
))
(declare-datatypes ((array!75037 0))(
  ( (array!75038 (arr!36169 (Array (_ BitVec 32) ValueCell!13839)) (size!36705 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75037)

(declare-fun lt!522447 () Unit!38290)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!536 (array!75035 array!75037 (_ BitVec 32) (_ BitVec 32) V!43923 V!43923 (_ BitVec 64) (_ BitVec 32) Int) Unit!38290)

(assert (=> b!1161095 (= lt!522447 (lemmaListMapContainsThenArrayContainsFrom!536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115961 () Bool)

(assert (=> b!1161095 (= c!115961 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770438 () Bool)

(declare-fun e!660258 () Bool)

(assert (=> b!1161095 (= res!770438 e!660258)))

(declare-fun e!660251 () Bool)

(assert (=> b!1161095 (=> (not res!770438) (not e!660251))))

(assert (=> b!1161095 e!660251))

(declare-fun lt!522453 () Unit!38290)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75035 (_ BitVec 32) (_ BitVec 32)) Unit!38290)

(assert (=> b!1161095 (= lt!522453 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25345 0))(
  ( (Nil!25342) (Cons!25341 (h!26550 (_ BitVec 64)) (t!36904 List!25345)) )
))
(declare-fun arrayNoDuplicates!0 (array!75035 (_ BitVec 32) List!25345) Bool)

(assert (=> b!1161095 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25342)))

(declare-fun lt!522452 () Unit!38290)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75035 (_ BitVec 64) (_ BitVec 32) List!25345) Unit!38290)

(assert (=> b!1161095 (= lt!522452 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25342))))

(assert (=> b!1161095 false))

(declare-fun mapIsEmpty!45470 () Bool)

(declare-fun mapRes!45470 () Bool)

(assert (=> mapIsEmpty!45470 mapRes!45470))

(declare-fun b!1161096 () Bool)

(declare-fun e!660243 () Bool)

(declare-fun e!660250 () Bool)

(assert (=> b!1161096 (= e!660243 (not e!660250))))

(declare-fun res!770435 () Bool)

(assert (=> b!1161096 (=> res!770435 e!660250)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161096 (= res!770435 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161096 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522462 () Unit!38290)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75035 (_ BitVec 64) (_ BitVec 32)) Unit!38290)

(assert (=> b!1161096 (= lt!522462 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1161097 () Bool)

(declare-fun res!770429 () Bool)

(declare-fun e!660252 () Bool)

(assert (=> b!1161097 (=> (not res!770429) (not e!660252))))

(assert (=> b!1161097 (= res!770429 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25342))))

(declare-fun call!56352 () Unit!38290)

(declare-fun bm!56344 () Bool)

(declare-fun addStillContains!951 (ListLongMap!16577 (_ BitVec 64) V!43923 (_ BitVec 64)) Unit!38290)

(assert (=> bm!56344 (= call!56352 (addStillContains!951 lt!522459 (ite (or c!115966 c!115962) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115966 c!115962) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1161098 () Bool)

(declare-fun e!660255 () Bool)

(declare-fun call!56350 () ListLongMap!16577)

(declare-fun call!56347 () ListLongMap!16577)

(assert (=> b!1161098 (= e!660255 (= call!56350 call!56347))))

(declare-fun lt!522454 () array!75035)

(declare-fun e!660248 () Bool)

(declare-fun b!1161099 () Bool)

(declare-fun lt!522463 () ListLongMap!16577)

(declare-fun lt!522446 () array!75037)

(declare-fun getCurrentListMapNoExtraKeys!4768 (array!75035 array!75037 (_ BitVec 32) (_ BitVec 32) V!43923 V!43923 (_ BitVec 32) Int) ListLongMap!16577)

(assert (=> b!1161099 (= e!660248 (= lt!522463 (getCurrentListMapNoExtraKeys!4768 lt!522454 lt!522446 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1161100 () Bool)

(declare-fun Unit!38294 () Unit!38290)

(assert (=> b!1161100 (= e!660253 Unit!38294)))

(declare-fun b!1161101 () Bool)

(declare-fun res!770428 () Bool)

(assert (=> b!1161101 (=> (not res!770428) (not e!660252))))

(assert (=> b!1161101 (= res!770428 (and (= (size!36705 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36704 _keys!1208) (size!36705 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1161102 () Bool)

(declare-fun e!660246 () Bool)

(declare-fun tp_is_empty!29097 () Bool)

(assert (=> b!1161102 (= e!660246 tp_is_empty!29097)))

(declare-fun bm!56345 () Bool)

(declare-fun call!56349 () Bool)

(declare-fun call!56346 () Bool)

(assert (=> bm!56345 (= call!56349 call!56346)))

(declare-fun b!1161103 () Bool)

(declare-fun e!660256 () Bool)

(assert (=> b!1161103 (= e!660256 true)))

(assert (=> b!1161103 e!660248))

(declare-fun res!770433 () Bool)

(assert (=> b!1161103 (=> (not res!770433) (not e!660248))))

(assert (=> b!1161103 (= res!770433 (= lt!522463 lt!522459))))

(declare-fun lt!522464 () ListLongMap!16577)

(declare-fun -!1412 (ListLongMap!16577 (_ BitVec 64)) ListLongMap!16577)

(assert (=> b!1161103 (= lt!522463 (-!1412 lt!522464 k0!934))))

(declare-fun lt!522457 () V!43923)

(assert (=> b!1161103 (= (-!1412 (+!3709 lt!522459 (tuple2!18609 (select (arr!36168 _keys!1208) from!1455) lt!522457)) (select (arr!36168 _keys!1208) from!1455)) lt!522459)))

(declare-fun lt!522449 () Unit!38290)

(declare-fun addThenRemoveForNewKeyIsSame!246 (ListLongMap!16577 (_ BitVec 64) V!43923) Unit!38290)

(assert (=> b!1161103 (= lt!522449 (addThenRemoveForNewKeyIsSame!246 lt!522459 (select (arr!36168 _keys!1208) from!1455) lt!522457))))

(declare-fun lt!522444 () V!43923)

(declare-fun get!18448 (ValueCell!13839 V!43923) V!43923)

(assert (=> b!1161103 (= lt!522457 (get!18448 (select (arr!36169 _values!996) from!1455) lt!522444))))

(declare-fun lt!522451 () Unit!38290)

(assert (=> b!1161103 (= lt!522451 e!660253)))

(declare-fun c!115964 () Bool)

(declare-fun contains!6810 (ListLongMap!16577 (_ BitVec 64)) Bool)

(assert (=> b!1161103 (= c!115964 (contains!6810 lt!522459 k0!934))))

(assert (=> b!1161103 (= lt!522459 (getCurrentListMapNoExtraKeys!4768 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161104 () Bool)

(assert (=> b!1161104 call!56349))

(declare-fun lt!522445 () Unit!38290)

(declare-fun call!56351 () Unit!38290)

(assert (=> b!1161104 (= lt!522445 call!56351)))

(assert (=> b!1161104 (= e!660244 lt!522445)))

(declare-fun b!1161105 () Bool)

(declare-fun res!770434 () Bool)

(assert (=> b!1161105 (=> (not res!770434) (not e!660252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75035 (_ BitVec 32)) Bool)

(assert (=> b!1161105 (= res!770434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1161106 () Bool)

(assert (=> b!1161106 (= e!660258 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56346 () Bool)

(assert (=> bm!56346 (= call!56350 (getCurrentListMapNoExtraKeys!4768 lt!522454 lt!522446 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56347 () Bool)

(assert (=> bm!56347 (= call!56351 call!56352)))

(declare-fun b!1161107 () Bool)

(assert (=> b!1161107 (= c!115962 (and (not lt!522465) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660257 () Unit!38290)

(assert (=> b!1161107 (= e!660254 e!660257)))

(declare-fun b!1161108 () Bool)

(assert (=> b!1161108 (= e!660257 e!660244)))

(declare-fun c!115963 () Bool)

(assert (=> b!1161108 (= c!115963 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522465))))

(declare-fun b!1161109 () Bool)

(declare-fun res!770432 () Bool)

(assert (=> b!1161109 (=> (not res!770432) (not e!660252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161109 (= res!770432 (validMask!0 mask!1564))))

(declare-fun b!1161110 () Bool)

(declare-fun res!770426 () Bool)

(assert (=> b!1161110 (=> (not res!770426) (not e!660252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161110 (= res!770426 (validKeyInArray!0 k0!934))))

(declare-fun b!1161111 () Bool)

(assert (=> b!1161111 (contains!6810 call!56348 k0!934)))

(declare-fun lt!522461 () Unit!38290)

(assert (=> b!1161111 (= lt!522461 (addStillContains!951 lt!522448 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1161111 call!56346))

(assert (=> b!1161111 (= lt!522448 (+!3709 lt!522459 (tuple2!18609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!522450 () Unit!38290)

(assert (=> b!1161111 (= lt!522450 call!56352)))

(assert (=> b!1161111 (= e!660254 lt!522461)))

(declare-fun b!1161112 () Bool)

(assert (=> b!1161112 (= e!660255 (= call!56350 (-!1412 call!56347 k0!934)))))

(declare-fun b!1161113 () Bool)

(assert (=> b!1161113 (= e!660252 e!660243)))

(declare-fun res!770425 () Bool)

(assert (=> b!1161113 (=> (not res!770425) (not e!660243))))

(assert (=> b!1161113 (= res!770425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522454 mask!1564))))

(assert (=> b!1161113 (= lt!522454 (array!75036 (store (arr!36168 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36704 _keys!1208)))))

(declare-fun bm!56348 () Bool)

(declare-fun call!56353 () ListLongMap!16577)

(assert (=> bm!56348 (= call!56353 call!56348)))

(declare-fun b!1161114 () Bool)

(declare-fun res!770437 () Bool)

(assert (=> b!1161114 (=> (not res!770437) (not e!660243))))

(assert (=> b!1161114 (= res!770437 (arrayNoDuplicates!0 lt!522454 #b00000000000000000000000000000000 Nil!25342))))

(declare-fun bm!56349 () Bool)

(assert (=> bm!56349 (= call!56346 (contains!6810 (ite c!115966 lt!522448 call!56353) k0!934))))

(declare-fun mapNonEmpty!45470 () Bool)

(declare-fun tp!86412 () Bool)

(declare-fun e!660245 () Bool)

(assert (=> mapNonEmpty!45470 (= mapRes!45470 (and tp!86412 e!660245))))

(declare-fun mapRest!45470 () (Array (_ BitVec 32) ValueCell!13839))

(declare-fun mapKey!45470 () (_ BitVec 32))

(declare-fun mapValue!45470 () ValueCell!13839)

(assert (=> mapNonEmpty!45470 (= (arr!36169 _values!996) (store mapRest!45470 mapKey!45470 mapValue!45470))))

(declare-fun b!1161115 () Bool)

(declare-fun lt!522460 () Unit!38290)

(assert (=> b!1161115 (= e!660257 lt!522460)))

(assert (=> b!1161115 (= lt!522460 call!56351)))

(assert (=> b!1161115 call!56349))

(declare-fun b!1161116 () Bool)

(declare-fun e!660242 () Bool)

(assert (=> b!1161116 (= e!660242 (and e!660246 mapRes!45470))))

(declare-fun condMapEmpty!45470 () Bool)

(declare-fun mapDefault!45470 () ValueCell!13839)

(assert (=> b!1161116 (= condMapEmpty!45470 (= (arr!36169 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13839)) mapDefault!45470)))))

(declare-fun b!1161117 () Bool)

(assert (=> b!1161117 (= e!660251 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161118 () Bool)

(declare-fun e!660247 () Bool)

(assert (=> b!1161118 (= e!660250 e!660247)))

(declare-fun res!770427 () Bool)

(assert (=> b!1161118 (=> res!770427 e!660247)))

(assert (=> b!1161118 (= res!770427 (not (= from!1455 i!673)))))

(declare-fun lt!522455 () ListLongMap!16577)

(assert (=> b!1161118 (= lt!522455 (getCurrentListMapNoExtraKeys!4768 lt!522454 lt!522446 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1161118 (= lt!522446 (array!75038 (store (arr!36169 _values!996) i!673 (ValueCellFull!13839 lt!522444)) (size!36705 _values!996)))))

(declare-fun dynLambda!2766 (Int (_ BitVec 64)) V!43923)

(assert (=> b!1161118 (= lt!522444 (dynLambda!2766 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1161118 (= lt!522464 (getCurrentListMapNoExtraKeys!4768 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1161119 () Bool)

(declare-fun res!770424 () Bool)

(assert (=> b!1161119 (=> (not res!770424) (not e!660252))))

(assert (=> b!1161119 (= res!770424 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36704 _keys!1208))))))

(declare-fun b!1161120 () Bool)

(assert (=> b!1161120 (= e!660245 tp_is_empty!29097)))

(declare-fun res!770431 () Bool)

(assert (=> start!98962 (=> (not res!770431) (not e!660252))))

(assert (=> start!98962 (= res!770431 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36704 _keys!1208))))))

(assert (=> start!98962 e!660252))

(assert (=> start!98962 tp_is_empty!29097))

(declare-fun array_inv!27674 (array!75035) Bool)

(assert (=> start!98962 (array_inv!27674 _keys!1208)))

(assert (=> start!98962 true))

(assert (=> start!98962 tp!86411))

(declare-fun array_inv!27675 (array!75037) Bool)

(assert (=> start!98962 (and (array_inv!27675 _values!996) e!660242)))

(declare-fun b!1161121 () Bool)

(declare-fun res!770436 () Bool)

(assert (=> b!1161121 (=> (not res!770436) (not e!660252))))

(assert (=> b!1161121 (= res!770436 (= (select (arr!36168 _keys!1208) i!673) k0!934))))

(declare-fun b!1161122 () Bool)

(assert (=> b!1161122 (= e!660258 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522465) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161123 () Bool)

(assert (=> b!1161123 (= e!660247 e!660256)))

(declare-fun res!770430 () Bool)

(assert (=> b!1161123 (=> res!770430 e!660256)))

(assert (=> b!1161123 (= res!770430 (not (= (select (arr!36168 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1161123 e!660255))

(declare-fun c!115965 () Bool)

(assert (=> b!1161123 (= c!115965 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522456 () Unit!38290)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!641 (array!75035 array!75037 (_ BitVec 32) (_ BitVec 32) V!43923 V!43923 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38290)

(assert (=> b!1161123 (= lt!522456 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!641 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56350 () Bool)

(assert (=> bm!56350 (= call!56347 (getCurrentListMapNoExtraKeys!4768 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98962 res!770431) b!1161109))

(assert (= (and b!1161109 res!770432) b!1161101))

(assert (= (and b!1161101 res!770428) b!1161105))

(assert (= (and b!1161105 res!770434) b!1161097))

(assert (= (and b!1161097 res!770429) b!1161119))

(assert (= (and b!1161119 res!770424) b!1161110))

(assert (= (and b!1161110 res!770426) b!1161121))

(assert (= (and b!1161121 res!770436) b!1161113))

(assert (= (and b!1161113 res!770425) b!1161114))

(assert (= (and b!1161114 res!770437) b!1161096))

(assert (= (and b!1161096 (not res!770435)) b!1161118))

(assert (= (and b!1161118 (not res!770427)) b!1161123))

(assert (= (and b!1161123 c!115965) b!1161112))

(assert (= (and b!1161123 (not c!115965)) b!1161098))

(assert (= (or b!1161112 b!1161098) bm!56346))

(assert (= (or b!1161112 b!1161098) bm!56350))

(assert (= (and b!1161123 (not res!770430)) b!1161103))

(assert (= (and b!1161103 c!115964) b!1161095))

(assert (= (and b!1161103 (not c!115964)) b!1161100))

(assert (= (and b!1161095 c!115966) b!1161111))

(assert (= (and b!1161095 (not c!115966)) b!1161107))

(assert (= (and b!1161107 c!115962) b!1161115))

(assert (= (and b!1161107 (not c!115962)) b!1161108))

(assert (= (and b!1161108 c!115963) b!1161104))

(assert (= (and b!1161108 (not c!115963)) b!1161094))

(assert (= (or b!1161115 b!1161104) bm!56347))

(assert (= (or b!1161115 b!1161104) bm!56348))

(assert (= (or b!1161115 b!1161104) bm!56345))

(assert (= (or b!1161111 bm!56345) bm!56349))

(assert (= (or b!1161111 bm!56347) bm!56344))

(assert (= (or b!1161111 bm!56348) bm!56343))

(assert (= (and b!1161095 c!115961) b!1161106))

(assert (= (and b!1161095 (not c!115961)) b!1161122))

(assert (= (and b!1161095 res!770438) b!1161117))

(assert (= (and b!1161103 res!770433) b!1161099))

(assert (= (and b!1161116 condMapEmpty!45470) mapIsEmpty!45470))

(assert (= (and b!1161116 (not condMapEmpty!45470)) mapNonEmpty!45470))

(get-info :version)

(assert (= (and mapNonEmpty!45470 ((_ is ValueCellFull!13839) mapValue!45470)) b!1161120))

(assert (= (and b!1161116 ((_ is ValueCellFull!13839) mapDefault!45470)) b!1161102))

(assert (= start!98962 b!1161116))

(declare-fun b_lambda!19673 () Bool)

(assert (=> (not b_lambda!19673) (not b!1161118)))

(declare-fun t!36902 () Bool)

(declare-fun tb!9379 () Bool)

(assert (=> (and start!98962 (= defaultEntry!1004 defaultEntry!1004) t!36902) tb!9379))

(declare-fun result!19323 () Bool)

(assert (=> tb!9379 (= result!19323 tp_is_empty!29097)))

(assert (=> b!1161118 t!36902))

(declare-fun b_and!39985 () Bool)

(assert (= b_and!39983 (and (=> t!36902 result!19323) b_and!39985)))

(declare-fun m!1069961 () Bool)

(assert (=> bm!56349 m!1069961))

(declare-fun m!1069963 () Bool)

(assert (=> b!1161095 m!1069963))

(declare-fun m!1069965 () Bool)

(assert (=> b!1161095 m!1069965))

(declare-fun m!1069967 () Bool)

(assert (=> b!1161095 m!1069967))

(declare-fun m!1069969 () Bool)

(assert (=> b!1161095 m!1069969))

(declare-fun m!1069971 () Bool)

(assert (=> b!1161121 m!1069971))

(declare-fun m!1069973 () Bool)

(assert (=> b!1161106 m!1069973))

(declare-fun m!1069975 () Bool)

(assert (=> b!1161114 m!1069975))

(declare-fun m!1069977 () Bool)

(assert (=> bm!56346 m!1069977))

(declare-fun m!1069979 () Bool)

(assert (=> bm!56350 m!1069979))

(declare-fun m!1069981 () Bool)

(assert (=> b!1161112 m!1069981))

(declare-fun m!1069983 () Bool)

(assert (=> bm!56344 m!1069983))

(assert (=> b!1161099 m!1069977))

(declare-fun m!1069985 () Bool)

(assert (=> mapNonEmpty!45470 m!1069985))

(declare-fun m!1069987 () Bool)

(assert (=> b!1161103 m!1069987))

(assert (=> b!1161103 m!1069987))

(declare-fun m!1069989 () Bool)

(assert (=> b!1161103 m!1069989))

(declare-fun m!1069991 () Bool)

(assert (=> b!1161103 m!1069991))

(declare-fun m!1069993 () Bool)

(assert (=> b!1161103 m!1069993))

(declare-fun m!1069995 () Bool)

(assert (=> b!1161103 m!1069995))

(assert (=> b!1161103 m!1069979))

(assert (=> b!1161103 m!1069995))

(declare-fun m!1069997 () Bool)

(assert (=> b!1161103 m!1069997))

(declare-fun m!1069999 () Bool)

(assert (=> b!1161103 m!1069999))

(assert (=> b!1161103 m!1069993))

(assert (=> b!1161103 m!1069995))

(declare-fun m!1070001 () Bool)

(assert (=> b!1161103 m!1070001))

(declare-fun m!1070003 () Bool)

(assert (=> b!1161118 m!1070003))

(declare-fun m!1070005 () Bool)

(assert (=> b!1161118 m!1070005))

(declare-fun m!1070007 () Bool)

(assert (=> b!1161118 m!1070007))

(declare-fun m!1070009 () Bool)

(assert (=> b!1161118 m!1070009))

(declare-fun m!1070011 () Bool)

(assert (=> bm!56343 m!1070011))

(assert (=> b!1161123 m!1069995))

(declare-fun m!1070013 () Bool)

(assert (=> b!1161123 m!1070013))

(declare-fun m!1070015 () Bool)

(assert (=> b!1161110 m!1070015))

(declare-fun m!1070017 () Bool)

(assert (=> start!98962 m!1070017))

(declare-fun m!1070019 () Bool)

(assert (=> start!98962 m!1070019))

(declare-fun m!1070021 () Bool)

(assert (=> b!1161105 m!1070021))

(declare-fun m!1070023 () Bool)

(assert (=> b!1161111 m!1070023))

(declare-fun m!1070025 () Bool)

(assert (=> b!1161111 m!1070025))

(declare-fun m!1070027 () Bool)

(assert (=> b!1161111 m!1070027))

(declare-fun m!1070029 () Bool)

(assert (=> b!1161096 m!1070029))

(declare-fun m!1070031 () Bool)

(assert (=> b!1161096 m!1070031))

(declare-fun m!1070033 () Bool)

(assert (=> b!1161097 m!1070033))

(assert (=> b!1161117 m!1069973))

(declare-fun m!1070035 () Bool)

(assert (=> b!1161113 m!1070035))

(declare-fun m!1070037 () Bool)

(assert (=> b!1161113 m!1070037))

(declare-fun m!1070039 () Bool)

(assert (=> b!1161109 m!1070039))

(check-sat (not b!1161117) (not bm!56350) (not b!1161113) (not b!1161099) (not b!1161106) (not b!1161112) (not bm!56349) (not b_next!24567) (not b_lambda!19673) (not b!1161114) (not bm!56346) (not start!98962) tp_is_empty!29097 (not bm!56343) (not b!1161110) (not b!1161095) (not b!1161096) (not mapNonEmpty!45470) (not b!1161097) (not b!1161105) (not b!1161109) (not b!1161118) (not bm!56344) (not b!1161123) (not b!1161111) b_and!39985 (not b!1161103))
(check-sat b_and!39985 (not b_next!24567))
