; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98770 () Bool)

(assert start!98770)

(declare-fun b_free!24375 () Bool)

(declare-fun b_next!24375 () Bool)

(assert (=> start!98770 (= b_free!24375 (not b_next!24375))))

(declare-fun tp!85836 () Bool)

(declare-fun b_and!39599 () Bool)

(assert (=> start!98770 (= tp!85836 b_and!39599)))

(declare-fun mapNonEmpty!45182 () Bool)

(declare-fun mapRes!45182 () Bool)

(declare-fun tp!85835 () Bool)

(declare-fun e!655347 () Bool)

(assert (=> mapNonEmpty!45182 (= mapRes!45182 (and tp!85835 e!655347))))

(declare-datatypes ((V!43667 0))(
  ( (V!43668 (val!14509 Int)) )
))
(declare-datatypes ((ValueCell!13743 0))(
  ( (ValueCellFull!13743 (v!17146 V!43667)) (EmptyCell!13743) )
))
(declare-fun mapValue!45182 () ValueCell!13743)

(declare-datatypes ((array!74657 0))(
  ( (array!74658 (arr!35979 (Array (_ BitVec 32) ValueCell!13743)) (size!36515 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74657)

(declare-fun mapRest!45182 () (Array (_ BitVec 32) ValueCell!13743))

(declare-fun mapKey!45182 () (_ BitVec 32))

(assert (=> mapNonEmpty!45182 (= (arr!35979 _values!996) (store mapRest!45182 mapKey!45182 mapValue!45182))))

(declare-fun zeroValue!944 () V!43667)

(declare-datatypes ((tuple2!18426 0))(
  ( (tuple2!18427 (_1!9224 (_ BitVec 64)) (_2!9224 V!43667)) )
))
(declare-datatypes ((List!25174 0))(
  ( (Nil!25171) (Cons!25170 (h!26379 tuple2!18426) (t!36541 List!25174)) )
))
(declare-datatypes ((ListLongMap!16395 0))(
  ( (ListLongMap!16396 (toList!8213 List!25174)) )
))
(declare-fun call!54047 () ListLongMap!16395)

(declare-fun c!114233 () Bool)

(declare-fun lt!516114 () ListLongMap!16395)

(declare-fun c!114237 () Bool)

(declare-fun minValue!944 () V!43667)

(declare-fun bm!54039 () Bool)

(declare-fun +!3631 (ListLongMap!16395 tuple2!18426) ListLongMap!16395)

(assert (=> bm!54039 (= call!54047 (+!3631 lt!516114 (ite (or c!114233 c!114237) (tuple2!18427 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1152262 () Bool)

(declare-fun call!54049 () ListLongMap!16395)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!54043 () ListLongMap!16395)

(declare-fun e!655354 () Bool)

(declare-fun -!1344 (ListLongMap!16395 (_ BitVec 64)) ListLongMap!16395)

(assert (=> b!1152262 (= e!655354 (= call!54049 (-!1344 call!54043 k0!934)))))

(declare-fun b!1152263 () Bool)

(declare-datatypes ((Unit!37914 0))(
  ( (Unit!37915) )
))
(declare-fun e!655359 () Unit!37914)

(declare-fun e!655360 () Unit!37914)

(assert (=> b!1152263 (= e!655359 e!655360)))

(declare-fun c!114235 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!516122 () Bool)

(assert (=> b!1152263 (= c!114235 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516122))))

(declare-fun b!1152264 () Bool)

(assert (=> b!1152264 (= e!655354 (= call!54049 call!54043))))

(declare-fun bm!54040 () Bool)

(declare-fun call!54044 () Unit!37914)

(declare-fun call!54048 () Unit!37914)

(assert (=> bm!54040 (= call!54044 call!54048)))

(declare-fun b!1152265 () Bool)

(declare-fun res!766111 () Bool)

(declare-fun e!655358 () Bool)

(assert (=> b!1152265 (=> (not res!766111) (not e!655358))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152265 (= res!766111 (validMask!0 mask!1564))))

(declare-fun b!1152266 () Bool)

(declare-fun e!655357 () Bool)

(declare-fun tp_is_empty!28905 () Bool)

(assert (=> b!1152266 (= e!655357 tp_is_empty!28905)))

(declare-fun res!766104 () Bool)

(assert (=> start!98770 (=> (not res!766104) (not e!655358))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74659 0))(
  ( (array!74660 (arr!35980 (Array (_ BitVec 32) (_ BitVec 64))) (size!36516 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74659)

(assert (=> start!98770 (= res!766104 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36516 _keys!1208))))))

(assert (=> start!98770 e!655358))

(assert (=> start!98770 tp_is_empty!28905))

(declare-fun array_inv!27552 (array!74659) Bool)

(assert (=> start!98770 (array_inv!27552 _keys!1208)))

(assert (=> start!98770 true))

(assert (=> start!98770 tp!85836))

(declare-fun e!655348 () Bool)

(declare-fun array_inv!27553 (array!74657) Bool)

(assert (=> start!98770 (and (array_inv!27553 _values!996) e!655348)))

(declare-fun b!1152267 () Bool)

(declare-fun e!655353 () Bool)

(declare-fun e!655352 () Bool)

(assert (=> b!1152267 (= e!655353 e!655352)))

(declare-fun res!766114 () Bool)

(assert (=> b!1152267 (=> res!766114 e!655352)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152267 (= res!766114 (not (= from!1455 i!673)))))

(declare-fun lt!516121 () ListLongMap!16395)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!516108 () array!74659)

(declare-fun lt!516119 () array!74657)

(declare-fun getCurrentListMapNoExtraKeys!4685 (array!74659 array!74657 (_ BitVec 32) (_ BitVec 32) V!43667 V!43667 (_ BitVec 32) Int) ListLongMap!16395)

(assert (=> b!1152267 (= lt!516121 (getCurrentListMapNoExtraKeys!4685 lt!516108 lt!516119 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!516117 () V!43667)

(assert (=> b!1152267 (= lt!516119 (array!74658 (store (arr!35979 _values!996) i!673 (ValueCellFull!13743 lt!516117)) (size!36515 _values!996)))))

(declare-fun dynLambda!2706 (Int (_ BitVec 64)) V!43667)

(assert (=> b!1152267 (= lt!516117 (dynLambda!2706 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!516126 () ListLongMap!16395)

(assert (=> b!1152267 (= lt!516126 (getCurrentListMapNoExtraKeys!4685 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1152268 () Bool)

(declare-fun res!766109 () Bool)

(assert (=> b!1152268 (=> (not res!766109) (not e!655358))))

(assert (=> b!1152268 (= res!766109 (= (select (arr!35980 _keys!1208) i!673) k0!934))))

(declare-fun b!1152269 () Bool)

(declare-fun e!655355 () Bool)

(assert (=> b!1152269 (= e!655355 (not e!655353))))

(declare-fun res!766107 () Bool)

(assert (=> b!1152269 (=> res!766107 e!655353)))

(assert (=> b!1152269 (= res!766107 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152269 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516118 () Unit!37914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74659 (_ BitVec 64) (_ BitVec 32)) Unit!37914)

(assert (=> b!1152269 (= lt!516118 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!655351 () Bool)

(declare-fun b!1152270 () Bool)

(assert (=> b!1152270 (= e!655351 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152271 () Bool)

(assert (=> b!1152271 (= e!655347 tp_is_empty!28905)))

(declare-fun e!655356 () Bool)

(declare-fun b!1152272 () Bool)

(declare-fun lt!516115 () ListLongMap!16395)

(assert (=> b!1152272 (= e!655356 (= lt!516115 (getCurrentListMapNoExtraKeys!4685 lt!516108 lt!516119 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1152273 () Bool)

(assert (=> b!1152273 (= e!655351 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516122) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1152274 () Bool)

(declare-fun res!766116 () Bool)

(assert (=> b!1152274 (=> (not res!766116) (not e!655358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152274 (= res!766116 (validKeyInArray!0 k0!934))))

(declare-fun bm!54041 () Bool)

(declare-fun call!54046 () ListLongMap!16395)

(declare-fun lt!516128 () ListLongMap!16395)

(declare-fun call!54042 () Bool)

(declare-fun contains!6731 (ListLongMap!16395 (_ BitVec 64)) Bool)

(assert (=> bm!54041 (= call!54042 (contains!6731 (ite c!114233 lt!516128 call!54046) k0!934))))

(declare-fun b!1152275 () Bool)

(declare-fun lt!516112 () Unit!37914)

(assert (=> b!1152275 (= e!655359 lt!516112)))

(assert (=> b!1152275 (= lt!516112 call!54044)))

(declare-fun call!54045 () Bool)

(assert (=> b!1152275 call!54045))

(declare-fun bm!54042 () Bool)

(assert (=> bm!54042 (= call!54045 call!54042)))

(declare-fun b!1152276 () Bool)

(declare-fun res!766115 () Bool)

(assert (=> b!1152276 (=> (not res!766115) (not e!655355))))

(declare-datatypes ((List!25175 0))(
  ( (Nil!25172) (Cons!25171 (h!26380 (_ BitVec 64)) (t!36542 List!25175)) )
))
(declare-fun arrayNoDuplicates!0 (array!74659 (_ BitVec 32) List!25175) Bool)

(assert (=> b!1152276 (= res!766115 (arrayNoDuplicates!0 lt!516108 #b00000000000000000000000000000000 Nil!25172))))

(declare-fun b!1152277 () Bool)

(declare-fun e!655362 () Bool)

(assert (=> b!1152277 (= e!655362 true)))

(assert (=> b!1152277 e!655356))

(declare-fun res!766106 () Bool)

(assert (=> b!1152277 (=> (not res!766106) (not e!655356))))

(assert (=> b!1152277 (= res!766106 (= lt!516115 lt!516114))))

(assert (=> b!1152277 (= lt!516115 (-!1344 lt!516126 k0!934))))

(declare-fun lt!516111 () V!43667)

(assert (=> b!1152277 (= (-!1344 (+!3631 lt!516114 (tuple2!18427 (select (arr!35980 _keys!1208) from!1455) lt!516111)) (select (arr!35980 _keys!1208) from!1455)) lt!516114)))

(declare-fun lt!516123 () Unit!37914)

(declare-fun addThenRemoveForNewKeyIsSame!186 (ListLongMap!16395 (_ BitVec 64) V!43667) Unit!37914)

(assert (=> b!1152277 (= lt!516123 (addThenRemoveForNewKeyIsSame!186 lt!516114 (select (arr!35980 _keys!1208) from!1455) lt!516111))))

(declare-fun get!18324 (ValueCell!13743 V!43667) V!43667)

(assert (=> b!1152277 (= lt!516111 (get!18324 (select (arr!35979 _values!996) from!1455) lt!516117))))

(declare-fun lt!516110 () Unit!37914)

(declare-fun e!655346 () Unit!37914)

(assert (=> b!1152277 (= lt!516110 e!655346)))

(declare-fun c!114238 () Bool)

(assert (=> b!1152277 (= c!114238 (contains!6731 lt!516114 k0!934))))

(assert (=> b!1152277 (= lt!516114 (getCurrentListMapNoExtraKeys!4685 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152278 () Bool)

(assert (=> b!1152278 (= e!655358 e!655355)))

(declare-fun res!766110 () Bool)

(assert (=> b!1152278 (=> (not res!766110) (not e!655355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74659 (_ BitVec 32)) Bool)

(assert (=> b!1152278 (= res!766110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516108 mask!1564))))

(assert (=> b!1152278 (= lt!516108 (array!74660 (store (arr!35980 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36516 _keys!1208)))))

(declare-fun b!1152279 () Bool)

(declare-fun Unit!37916 () Unit!37914)

(assert (=> b!1152279 (= e!655346 Unit!37916)))

(assert (=> b!1152279 (= lt!516122 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152279 (= c!114233 (and (not lt!516122) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516113 () Unit!37914)

(declare-fun e!655361 () Unit!37914)

(assert (=> b!1152279 (= lt!516113 e!655361)))

(declare-fun lt!516109 () Unit!37914)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!472 (array!74659 array!74657 (_ BitVec 32) (_ BitVec 32) V!43667 V!43667 (_ BitVec 64) (_ BitVec 32) Int) Unit!37914)

(assert (=> b!1152279 (= lt!516109 (lemmaListMapContainsThenArrayContainsFrom!472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114236 () Bool)

(assert (=> b!1152279 (= c!114236 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766108 () Bool)

(assert (=> b!1152279 (= res!766108 e!655351)))

(declare-fun e!655349 () Bool)

(assert (=> b!1152279 (=> (not res!766108) (not e!655349))))

(assert (=> b!1152279 e!655349))

(declare-fun lt!516129 () Unit!37914)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74659 (_ BitVec 32) (_ BitVec 32)) Unit!37914)

(assert (=> b!1152279 (= lt!516129 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1152279 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25172)))

(declare-fun lt!516120 () Unit!37914)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74659 (_ BitVec 64) (_ BitVec 32) List!25175) Unit!37914)

(assert (=> b!1152279 (= lt!516120 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25172))))

(assert (=> b!1152279 false))

(declare-fun b!1152280 () Bool)

(assert (=> b!1152280 (= c!114237 (and (not lt!516122) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1152280 (= e!655361 e!655359)))

(declare-fun b!1152281 () Bool)

(assert (=> b!1152281 (= e!655348 (and e!655357 mapRes!45182))))

(declare-fun condMapEmpty!45182 () Bool)

(declare-fun mapDefault!45182 () ValueCell!13743)

(assert (=> b!1152281 (= condMapEmpty!45182 (= (arr!35979 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13743)) mapDefault!45182)))))

(declare-fun mapIsEmpty!45182 () Bool)

(assert (=> mapIsEmpty!45182 mapRes!45182))

(declare-fun b!1152282 () Bool)

(declare-fun res!766105 () Bool)

(assert (=> b!1152282 (=> (not res!766105) (not e!655358))))

(assert (=> b!1152282 (= res!766105 (and (= (size!36515 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36516 _keys!1208) (size!36515 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1152283 () Bool)

(declare-fun res!766117 () Bool)

(assert (=> b!1152283 (=> (not res!766117) (not e!655358))))

(assert (=> b!1152283 (= res!766117 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36516 _keys!1208))))))

(declare-fun b!1152284 () Bool)

(assert (=> b!1152284 call!54045))

(declare-fun lt!516116 () Unit!37914)

(assert (=> b!1152284 (= lt!516116 call!54044)))

(assert (=> b!1152284 (= e!655360 lt!516116)))

(declare-fun b!1152285 () Bool)

(declare-fun res!766112 () Bool)

(assert (=> b!1152285 (=> (not res!766112) (not e!655358))))

(assert (=> b!1152285 (= res!766112 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25172))))

(declare-fun bm!54043 () Bool)

(assert (=> bm!54043 (= call!54049 (getCurrentListMapNoExtraKeys!4685 lt!516108 lt!516119 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152286 () Bool)

(declare-fun res!766113 () Bool)

(assert (=> b!1152286 (=> (not res!766113) (not e!655358))))

(assert (=> b!1152286 (= res!766113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1152287 () Bool)

(assert (=> b!1152287 (contains!6731 (+!3631 lt!516128 (tuple2!18427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!516124 () Unit!37914)

(declare-fun addStillContains!879 (ListLongMap!16395 (_ BitVec 64) V!43667 (_ BitVec 64)) Unit!37914)

(assert (=> b!1152287 (= lt!516124 (addStillContains!879 lt!516128 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1152287 call!54042))

(assert (=> b!1152287 (= lt!516128 call!54047)))

(declare-fun lt!516127 () Unit!37914)

(assert (=> b!1152287 (= lt!516127 call!54048)))

(assert (=> b!1152287 (= e!655361 lt!516124)))

(declare-fun b!1152288 () Bool)

(declare-fun Unit!37917 () Unit!37914)

(assert (=> b!1152288 (= e!655360 Unit!37917)))

(declare-fun b!1152289 () Bool)

(assert (=> b!1152289 (= e!655349 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152290 () Bool)

(assert (=> b!1152290 (= e!655352 e!655362)))

(declare-fun res!766118 () Bool)

(assert (=> b!1152290 (=> res!766118 e!655362)))

(assert (=> b!1152290 (= res!766118 (not (= (select (arr!35980 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1152290 e!655354))

(declare-fun c!114234 () Bool)

(assert (=> b!1152290 (= c!114234 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516125 () Unit!37914)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!579 (array!74659 array!74657 (_ BitVec 32) (_ BitVec 32) V!43667 V!43667 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37914)

(assert (=> b!1152290 (= lt!516125 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!579 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54044 () Bool)

(assert (=> bm!54044 (= call!54048 (addStillContains!879 lt!516114 (ite (or c!114233 c!114237) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114233 c!114237) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!54045 () Bool)

(assert (=> bm!54045 (= call!54043 (getCurrentListMapNoExtraKeys!4685 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54046 () Bool)

(assert (=> bm!54046 (= call!54046 call!54047)))

(declare-fun b!1152291 () Bool)

(declare-fun Unit!37918 () Unit!37914)

(assert (=> b!1152291 (= e!655346 Unit!37918)))

(assert (= (and start!98770 res!766104) b!1152265))

(assert (= (and b!1152265 res!766111) b!1152282))

(assert (= (and b!1152282 res!766105) b!1152286))

(assert (= (and b!1152286 res!766113) b!1152285))

(assert (= (and b!1152285 res!766112) b!1152283))

(assert (= (and b!1152283 res!766117) b!1152274))

(assert (= (and b!1152274 res!766116) b!1152268))

(assert (= (and b!1152268 res!766109) b!1152278))

(assert (= (and b!1152278 res!766110) b!1152276))

(assert (= (and b!1152276 res!766115) b!1152269))

(assert (= (and b!1152269 (not res!766107)) b!1152267))

(assert (= (and b!1152267 (not res!766114)) b!1152290))

(assert (= (and b!1152290 c!114234) b!1152262))

(assert (= (and b!1152290 (not c!114234)) b!1152264))

(assert (= (or b!1152262 b!1152264) bm!54043))

(assert (= (or b!1152262 b!1152264) bm!54045))

(assert (= (and b!1152290 (not res!766118)) b!1152277))

(assert (= (and b!1152277 c!114238) b!1152279))

(assert (= (and b!1152277 (not c!114238)) b!1152291))

(assert (= (and b!1152279 c!114233) b!1152287))

(assert (= (and b!1152279 (not c!114233)) b!1152280))

(assert (= (and b!1152280 c!114237) b!1152275))

(assert (= (and b!1152280 (not c!114237)) b!1152263))

(assert (= (and b!1152263 c!114235) b!1152284))

(assert (= (and b!1152263 (not c!114235)) b!1152288))

(assert (= (or b!1152275 b!1152284) bm!54040))

(assert (= (or b!1152275 b!1152284) bm!54046))

(assert (= (or b!1152275 b!1152284) bm!54042))

(assert (= (or b!1152287 bm!54042) bm!54041))

(assert (= (or b!1152287 bm!54040) bm!54044))

(assert (= (or b!1152287 bm!54046) bm!54039))

(assert (= (and b!1152279 c!114236) b!1152270))

(assert (= (and b!1152279 (not c!114236)) b!1152273))

(assert (= (and b!1152279 res!766108) b!1152289))

(assert (= (and b!1152277 res!766106) b!1152272))

(assert (= (and b!1152281 condMapEmpty!45182) mapIsEmpty!45182))

(assert (= (and b!1152281 (not condMapEmpty!45182)) mapNonEmpty!45182))

(get-info :version)

(assert (= (and mapNonEmpty!45182 ((_ is ValueCellFull!13743) mapValue!45182)) b!1152271))

(assert (= (and b!1152281 ((_ is ValueCellFull!13743) mapDefault!45182)) b!1152266))

(assert (= start!98770 b!1152281))

(declare-fun b_lambda!19481 () Bool)

(assert (=> (not b_lambda!19481) (not b!1152267)))

(declare-fun t!36540 () Bool)

(declare-fun tb!9187 () Bool)

(assert (=> (and start!98770 (= defaultEntry!1004 defaultEntry!1004) t!36540) tb!9187))

(declare-fun result!18939 () Bool)

(assert (=> tb!9187 (= result!18939 tp_is_empty!28905)))

(assert (=> b!1152267 t!36540))

(declare-fun b_and!39601 () Bool)

(assert (= b_and!39599 (and (=> t!36540 result!18939) b_and!39601)))

(declare-fun m!1062265 () Bool)

(assert (=> b!1152274 m!1062265))

(declare-fun m!1062267 () Bool)

(assert (=> b!1152286 m!1062267))

(declare-fun m!1062269 () Bool)

(assert (=> bm!54045 m!1062269))

(declare-fun m!1062271 () Bool)

(assert (=> start!98770 m!1062271))

(declare-fun m!1062273 () Bool)

(assert (=> start!98770 m!1062273))

(declare-fun m!1062275 () Bool)

(assert (=> b!1152279 m!1062275))

(declare-fun m!1062277 () Bool)

(assert (=> b!1152279 m!1062277))

(declare-fun m!1062279 () Bool)

(assert (=> b!1152279 m!1062279))

(declare-fun m!1062281 () Bool)

(assert (=> b!1152279 m!1062281))

(declare-fun m!1062283 () Bool)

(assert (=> b!1152272 m!1062283))

(declare-fun m!1062285 () Bool)

(assert (=> b!1152290 m!1062285))

(declare-fun m!1062287 () Bool)

(assert (=> b!1152290 m!1062287))

(declare-fun m!1062289 () Bool)

(assert (=> b!1152278 m!1062289))

(declare-fun m!1062291 () Bool)

(assert (=> b!1152278 m!1062291))

(declare-fun m!1062293 () Bool)

(assert (=> b!1152289 m!1062293))

(declare-fun m!1062295 () Bool)

(assert (=> b!1152267 m!1062295))

(declare-fun m!1062297 () Bool)

(assert (=> b!1152267 m!1062297))

(declare-fun m!1062299 () Bool)

(assert (=> b!1152267 m!1062299))

(declare-fun m!1062301 () Bool)

(assert (=> b!1152267 m!1062301))

(assert (=> b!1152277 m!1062269))

(declare-fun m!1062303 () Bool)

(assert (=> b!1152277 m!1062303))

(declare-fun m!1062305 () Bool)

(assert (=> b!1152277 m!1062305))

(declare-fun m!1062307 () Bool)

(assert (=> b!1152277 m!1062307))

(assert (=> b!1152277 m!1062285))

(declare-fun m!1062309 () Bool)

(assert (=> b!1152277 m!1062309))

(assert (=> b!1152277 m!1062305))

(declare-fun m!1062311 () Bool)

(assert (=> b!1152277 m!1062311))

(assert (=> b!1152277 m!1062307))

(assert (=> b!1152277 m!1062285))

(declare-fun m!1062313 () Bool)

(assert (=> b!1152277 m!1062313))

(declare-fun m!1062315 () Bool)

(assert (=> b!1152277 m!1062315))

(assert (=> b!1152277 m!1062285))

(declare-fun m!1062317 () Bool)

(assert (=> bm!54041 m!1062317))

(assert (=> bm!54043 m!1062283))

(declare-fun m!1062319 () Bool)

(assert (=> b!1152269 m!1062319))

(declare-fun m!1062321 () Bool)

(assert (=> b!1152269 m!1062321))

(declare-fun m!1062323 () Bool)

(assert (=> bm!54044 m!1062323))

(declare-fun m!1062325 () Bool)

(assert (=> b!1152287 m!1062325))

(assert (=> b!1152287 m!1062325))

(declare-fun m!1062327 () Bool)

(assert (=> b!1152287 m!1062327))

(declare-fun m!1062329 () Bool)

(assert (=> b!1152287 m!1062329))

(declare-fun m!1062331 () Bool)

(assert (=> b!1152276 m!1062331))

(declare-fun m!1062333 () Bool)

(assert (=> b!1152268 m!1062333))

(declare-fun m!1062335 () Bool)

(assert (=> b!1152285 m!1062335))

(declare-fun m!1062337 () Bool)

(assert (=> bm!54039 m!1062337))

(declare-fun m!1062339 () Bool)

(assert (=> mapNonEmpty!45182 m!1062339))

(declare-fun m!1062341 () Bool)

(assert (=> b!1152262 m!1062341))

(assert (=> b!1152270 m!1062293))

(declare-fun m!1062343 () Bool)

(assert (=> b!1152265 m!1062343))

(check-sat (not b!1152267) (not b!1152289) (not b!1152272) (not b!1152274) (not b!1152262) (not b!1152276) (not b!1152285) b_and!39601 (not b!1152287) (not b!1152277) (not bm!54041) (not bm!54044) (not bm!54039) (not b!1152270) tp_is_empty!28905 (not b!1152269) (not b!1152278) (not bm!54045) (not bm!54043) (not b_lambda!19481) (not mapNonEmpty!45182) (not b!1152286) (not b_next!24375) (not b!1152265) (not b!1152290) (not start!98770) (not b!1152279))
(check-sat b_and!39601 (not b_next!24375))
