; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98960 () Bool)

(assert start!98960)

(declare-fun b_free!24571 () Bool)

(declare-fun b_next!24571 () Bool)

(assert (=> start!98960 (= b_free!24571 (not b_next!24571))))

(declare-fun tp!86423 () Bool)

(declare-fun b_and!39969 () Bool)

(assert (=> start!98960 (= tp!86423 b_and!39969)))

(declare-fun b!1161154 () Bool)

(declare-fun e!660278 () Bool)

(declare-datatypes ((V!43929 0))(
  ( (V!43930 (val!14607 Int)) )
))
(declare-datatypes ((tuple2!18696 0))(
  ( (tuple2!18697 (_1!9359 (_ BitVec 64)) (_2!9359 V!43929)) )
))
(declare-datatypes ((List!25414 0))(
  ( (Nil!25411) (Cons!25410 (h!26619 tuple2!18696) (t!36968 List!25414)) )
))
(declare-datatypes ((ListLongMap!16665 0))(
  ( (ListLongMap!16666 (toList!8348 List!25414)) )
))
(declare-fun call!56378 () ListLongMap!16665)

(declare-fun call!56376 () ListLongMap!16665)

(assert (=> b!1161154 (= e!660278 (= call!56378 call!56376))))

(declare-fun zeroValue!944 () V!43929)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!74960 0))(
  ( (array!74961 (arr!36131 (Array (_ BitVec 32) (_ BitVec 64))) (size!36669 (_ BitVec 32))) )
))
(declare-fun lt!522400 () array!74960)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13841 0))(
  ( (ValueCellFull!13841 (v!17243 V!43929)) (EmptyCell!13841) )
))
(declare-datatypes ((array!74962 0))(
  ( (array!74963 (arr!36132 (Array (_ BitVec 32) ValueCell!13841)) (size!36670 (_ BitVec 32))) )
))
(declare-fun lt!522398 () array!74962)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43929)

(declare-fun bm!56368 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4826 (array!74960 array!74962 (_ BitVec 32) (_ BitVec 32) V!43929 V!43929 (_ BitVec 32) Int) ListLongMap!16665)

(assert (=> bm!56368 (= call!56378 (getCurrentListMapNoExtraKeys!4826 lt!522400 lt!522398 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161155 () Bool)

(declare-fun e!660268 () Bool)

(declare-fun e!660270 () Bool)

(assert (=> b!1161155 (= e!660268 e!660270)))

(declare-fun res!770459 () Bool)

(assert (=> b!1161155 (=> res!770459 e!660270)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161155 (= res!770459 (not (= from!1455 i!673)))))

(declare-fun lt!522394 () ListLongMap!16665)

(assert (=> b!1161155 (= lt!522394 (getCurrentListMapNoExtraKeys!4826 lt!522400 lt!522398 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74962)

(declare-fun lt!522386 () V!43929)

(assert (=> b!1161155 (= lt!522398 (array!74963 (store (arr!36132 _values!996) i!673 (ValueCellFull!13841 lt!522386)) (size!36670 _values!996)))))

(declare-fun dynLambda!2767 (Int (_ BitVec 64)) V!43929)

(assert (=> b!1161155 (= lt!522386 (dynLambda!2767 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74960)

(declare-fun lt!522401 () ListLongMap!16665)

(assert (=> b!1161155 (= lt!522401 (getCurrentListMapNoExtraKeys!4826 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1161156 () Bool)

(declare-fun res!770457 () Bool)

(declare-fun e!660273 () Bool)

(assert (=> b!1161156 (=> (not res!770457) (not e!660273))))

(assert (=> b!1161156 (= res!770457 (and (= (size!36670 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36669 _keys!1208) (size!36670 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1161157 () Bool)

(declare-fun e!660276 () Bool)

(assert (=> b!1161157 (= e!660276 (not e!660268))))

(declare-fun res!770450 () Bool)

(assert (=> b!1161157 (=> res!770450 e!660268)))

(assert (=> b!1161157 (= res!770450 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161157 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38131 0))(
  ( (Unit!38132) )
))
(declare-fun lt!522391 () Unit!38131)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74960 (_ BitVec 64) (_ BitVec 32)) Unit!38131)

(assert (=> b!1161157 (= lt!522391 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1161158 () Bool)

(declare-fun res!770461 () Bool)

(assert (=> b!1161158 (=> (not res!770461) (not e!660273))))

(assert (=> b!1161158 (= res!770461 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36669 _keys!1208))))))

(declare-fun e!660272 () Bool)

(declare-fun b!1161159 () Bool)

(assert (=> b!1161159 (= e!660272 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161160 () Bool)

(declare-fun lt!522385 () ListLongMap!16665)

(declare-fun e!660269 () Bool)

(assert (=> b!1161160 (= e!660269 (= lt!522385 (getCurrentListMapNoExtraKeys!4826 lt!522400 lt!522398 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!56370 () Bool)

(declare-fun call!56377 () Unit!38131)

(declare-fun call!56373 () Unit!38131)

(assert (=> bm!56370 (= call!56377 call!56373)))

(declare-fun b!1161161 () Bool)

(declare-fun res!770455 () Bool)

(assert (=> b!1161161 (=> (not res!770455) (not e!660273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161161 (= res!770455 (validKeyInArray!0 k0!934))))

(declare-fun b!1161162 () Bool)

(declare-fun e!660277 () Bool)

(assert (=> b!1161162 (= e!660277 true)))

(assert (=> b!1161162 e!660269))

(declare-fun res!770452 () Bool)

(assert (=> b!1161162 (=> (not res!770452) (not e!660269))))

(declare-fun lt!522404 () ListLongMap!16665)

(assert (=> b!1161162 (= res!770452 (= lt!522385 lt!522404))))

(declare-fun -!1397 (ListLongMap!16665 (_ BitVec 64)) ListLongMap!16665)

(assert (=> b!1161162 (= lt!522385 (-!1397 lt!522401 k0!934))))

(declare-fun lt!522392 () V!43929)

(declare-fun +!3752 (ListLongMap!16665 tuple2!18696) ListLongMap!16665)

(assert (=> b!1161162 (= (-!1397 (+!3752 lt!522404 (tuple2!18697 (select (arr!36131 _keys!1208) from!1455) lt!522392)) (select (arr!36131 _keys!1208) from!1455)) lt!522404)))

(declare-fun lt!522405 () Unit!38131)

(declare-fun addThenRemoveForNewKeyIsSame!241 (ListLongMap!16665 (_ BitVec 64) V!43929) Unit!38131)

(assert (=> b!1161162 (= lt!522405 (addThenRemoveForNewKeyIsSame!241 lt!522404 (select (arr!36131 _keys!1208) from!1455) lt!522392))))

(declare-fun get!18445 (ValueCell!13841 V!43929) V!43929)

(assert (=> b!1161162 (= lt!522392 (get!18445 (select (arr!36132 _values!996) from!1455) lt!522386))))

(declare-fun lt!522388 () Unit!38131)

(declare-fun e!660279 () Unit!38131)

(assert (=> b!1161162 (= lt!522388 e!660279)))

(declare-fun c!115974 () Bool)

(declare-fun contains!6794 (ListLongMap!16665 (_ BitVec 64)) Bool)

(assert (=> b!1161162 (= c!115974 (contains!6794 lt!522404 k0!934))))

(assert (=> b!1161162 (= lt!522404 (getCurrentListMapNoExtraKeys!4826 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161163 () Bool)

(assert (=> b!1161163 (= e!660278 (= call!56378 (-!1397 call!56376 k0!934)))))

(declare-fun b!1161164 () Bool)

(declare-fun lt!522390 () ListLongMap!16665)

(assert (=> b!1161164 (contains!6794 (+!3752 lt!522390 (tuple2!18697 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!522384 () Unit!38131)

(declare-fun addStillContains!960 (ListLongMap!16665 (_ BitVec 64) V!43929 (_ BitVec 64)) Unit!38131)

(assert (=> b!1161164 (= lt!522384 (addStillContains!960 lt!522390 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!56372 () Bool)

(assert (=> b!1161164 call!56372))

(declare-fun call!56375 () ListLongMap!16665)

(assert (=> b!1161164 (= lt!522390 call!56375)))

(declare-fun lt!522389 () Unit!38131)

(assert (=> b!1161164 (= lt!522389 call!56373)))

(declare-fun e!660267 () Unit!38131)

(assert (=> b!1161164 (= e!660267 lt!522384)))

(declare-fun call!56371 () ListLongMap!16665)

(declare-fun c!115976 () Bool)

(declare-fun bm!56371 () Bool)

(assert (=> bm!56371 (= call!56372 (contains!6794 (ite c!115976 lt!522390 call!56371) k0!934))))

(declare-fun b!1161165 () Bool)

(declare-fun lt!522395 () Bool)

(assert (=> b!1161165 (= e!660272 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522395) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161166 () Bool)

(declare-fun e!660280 () Unit!38131)

(declare-fun lt!522393 () Unit!38131)

(assert (=> b!1161166 (= e!660280 lt!522393)))

(assert (=> b!1161166 (= lt!522393 call!56377)))

(declare-fun call!56374 () Bool)

(assert (=> b!1161166 call!56374))

(declare-fun bm!56372 () Bool)

(declare-fun c!115975 () Bool)

(assert (=> bm!56372 (= call!56375 (+!3752 lt!522404 (ite (or c!115976 c!115975) (tuple2!18697 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18697 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapIsEmpty!45476 () Bool)

(declare-fun mapRes!45476 () Bool)

(assert (=> mapIsEmpty!45476 mapRes!45476))

(declare-fun b!1161167 () Bool)

(declare-fun e!660282 () Bool)

(declare-fun tp_is_empty!29101 () Bool)

(assert (=> b!1161167 (= e!660282 tp_is_empty!29101)))

(declare-fun b!1161168 () Bool)

(declare-fun e!660274 () Unit!38131)

(declare-fun Unit!38133 () Unit!38131)

(assert (=> b!1161168 (= e!660274 Unit!38133)))

(declare-fun b!1161169 () Bool)

(assert (=> b!1161169 (= c!115975 (and (not lt!522395) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1161169 (= e!660267 e!660280)))

(declare-fun b!1161170 () Bool)

(declare-fun Unit!38134 () Unit!38131)

(assert (=> b!1161170 (= e!660279 Unit!38134)))

(assert (=> b!1161170 (= lt!522395 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1161170 (= c!115976 (and (not lt!522395) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522403 () Unit!38131)

(assert (=> b!1161170 (= lt!522403 e!660267)))

(declare-fun lt!522396 () Unit!38131)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!533 (array!74960 array!74962 (_ BitVec 32) (_ BitVec 32) V!43929 V!43929 (_ BitVec 64) (_ BitVec 32) Int) Unit!38131)

(assert (=> b!1161170 (= lt!522396 (lemmaListMapContainsThenArrayContainsFrom!533 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115971 () Bool)

(assert (=> b!1161170 (= c!115971 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770458 () Bool)

(assert (=> b!1161170 (= res!770458 e!660272)))

(declare-fun e!660271 () Bool)

(assert (=> b!1161170 (=> (not res!770458) (not e!660271))))

(assert (=> b!1161170 e!660271))

(declare-fun lt!522402 () Unit!38131)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74960 (_ BitVec 32) (_ BitVec 32)) Unit!38131)

(assert (=> b!1161170 (= lt!522402 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25415 0))(
  ( (Nil!25412) (Cons!25411 (h!26620 (_ BitVec 64)) (t!36969 List!25415)) )
))
(declare-fun arrayNoDuplicates!0 (array!74960 (_ BitVec 32) List!25415) Bool)

(assert (=> b!1161170 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25412)))

(declare-fun lt!522397 () Unit!38131)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74960 (_ BitVec 64) (_ BitVec 32) List!25415) Unit!38131)

(assert (=> b!1161170 (= lt!522397 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25412))))

(assert (=> b!1161170 false))

(declare-fun res!770448 () Bool)

(assert (=> start!98960 (=> (not res!770448) (not e!660273))))

(assert (=> start!98960 (= res!770448 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36669 _keys!1208))))))

(assert (=> start!98960 e!660273))

(assert (=> start!98960 tp_is_empty!29101))

(declare-fun array_inv!27760 (array!74960) Bool)

(assert (=> start!98960 (array_inv!27760 _keys!1208)))

(assert (=> start!98960 true))

(assert (=> start!98960 tp!86423))

(declare-fun e!660266 () Bool)

(declare-fun array_inv!27761 (array!74962) Bool)

(assert (=> start!98960 (and (array_inv!27761 _values!996) e!660266)))

(declare-fun bm!56369 () Bool)

(assert (=> bm!56369 (= call!56373 (addStillContains!960 lt!522404 (ite (or c!115976 c!115975) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115976 c!115975) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1161171 () Bool)

(assert (=> b!1161171 call!56374))

(declare-fun lt!522399 () Unit!38131)

(assert (=> b!1161171 (= lt!522399 call!56377)))

(assert (=> b!1161171 (= e!660274 lt!522399)))

(declare-fun b!1161172 () Bool)

(assert (=> b!1161172 (= e!660270 e!660277)))

(declare-fun res!770451 () Bool)

(assert (=> b!1161172 (=> res!770451 e!660277)))

(assert (=> b!1161172 (= res!770451 (not (= (select (arr!36131 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1161172 e!660278))

(declare-fun c!115972 () Bool)

(assert (=> b!1161172 (= c!115972 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522387 () Unit!38131)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!665 (array!74960 array!74962 (_ BitVec 32) (_ BitVec 32) V!43929 V!43929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38131)

(assert (=> b!1161172 (= lt!522387 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!665 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56373 () Bool)

(assert (=> bm!56373 (= call!56374 call!56372)))

(declare-fun b!1161173 () Bool)

(assert (=> b!1161173 (= e!660280 e!660274)))

(declare-fun c!115973 () Bool)

(assert (=> b!1161173 (= c!115973 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522395))))

(declare-fun b!1161174 () Bool)

(assert (=> b!1161174 (= e!660271 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161175 () Bool)

(declare-fun Unit!38135 () Unit!38131)

(assert (=> b!1161175 (= e!660279 Unit!38135)))

(declare-fun b!1161176 () Bool)

(assert (=> b!1161176 (= e!660266 (and e!660282 mapRes!45476))))

(declare-fun condMapEmpty!45476 () Bool)

(declare-fun mapDefault!45476 () ValueCell!13841)

(assert (=> b!1161176 (= condMapEmpty!45476 (= (arr!36132 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13841)) mapDefault!45476)))))

(declare-fun bm!56374 () Bool)

(assert (=> bm!56374 (= call!56371 call!56375)))

(declare-fun b!1161177 () Bool)

(declare-fun res!770454 () Bool)

(assert (=> b!1161177 (=> (not res!770454) (not e!660273))))

(assert (=> b!1161177 (= res!770454 (= (select (arr!36131 _keys!1208) i!673) k0!934))))

(declare-fun b!1161178 () Bool)

(assert (=> b!1161178 (= e!660273 e!660276)))

(declare-fun res!770460 () Bool)

(assert (=> b!1161178 (=> (not res!770460) (not e!660276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74960 (_ BitVec 32)) Bool)

(assert (=> b!1161178 (= res!770460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522400 mask!1564))))

(assert (=> b!1161178 (= lt!522400 (array!74961 (store (arr!36131 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36669 _keys!1208)))))

(declare-fun mapNonEmpty!45476 () Bool)

(declare-fun tp!86424 () Bool)

(declare-fun e!660275 () Bool)

(assert (=> mapNonEmpty!45476 (= mapRes!45476 (and tp!86424 e!660275))))

(declare-fun mapKey!45476 () (_ BitVec 32))

(declare-fun mapValue!45476 () ValueCell!13841)

(declare-fun mapRest!45476 () (Array (_ BitVec 32) ValueCell!13841))

(assert (=> mapNonEmpty!45476 (= (arr!36132 _values!996) (store mapRest!45476 mapKey!45476 mapValue!45476))))

(declare-fun b!1161179 () Bool)

(declare-fun res!770456 () Bool)

(assert (=> b!1161179 (=> (not res!770456) (not e!660273))))

(assert (=> b!1161179 (= res!770456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1161180 () Bool)

(assert (=> b!1161180 (= e!660275 tp_is_empty!29101)))

(declare-fun b!1161181 () Bool)

(declare-fun res!770449 () Bool)

(assert (=> b!1161181 (=> (not res!770449) (not e!660273))))

(assert (=> b!1161181 (= res!770449 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25412))))

(declare-fun bm!56375 () Bool)

(assert (=> bm!56375 (= call!56376 (getCurrentListMapNoExtraKeys!4826 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161182 () Bool)

(declare-fun res!770462 () Bool)

(assert (=> b!1161182 (=> (not res!770462) (not e!660276))))

(assert (=> b!1161182 (= res!770462 (arrayNoDuplicates!0 lt!522400 #b00000000000000000000000000000000 Nil!25412))))

(declare-fun b!1161183 () Bool)

(declare-fun res!770453 () Bool)

(assert (=> b!1161183 (=> (not res!770453) (not e!660273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161183 (= res!770453 (validMask!0 mask!1564))))

(assert (= (and start!98960 res!770448) b!1161183))

(assert (= (and b!1161183 res!770453) b!1161156))

(assert (= (and b!1161156 res!770457) b!1161179))

(assert (= (and b!1161179 res!770456) b!1161181))

(assert (= (and b!1161181 res!770449) b!1161158))

(assert (= (and b!1161158 res!770461) b!1161161))

(assert (= (and b!1161161 res!770455) b!1161177))

(assert (= (and b!1161177 res!770454) b!1161178))

(assert (= (and b!1161178 res!770460) b!1161182))

(assert (= (and b!1161182 res!770462) b!1161157))

(assert (= (and b!1161157 (not res!770450)) b!1161155))

(assert (= (and b!1161155 (not res!770459)) b!1161172))

(assert (= (and b!1161172 c!115972) b!1161163))

(assert (= (and b!1161172 (not c!115972)) b!1161154))

(assert (= (or b!1161163 b!1161154) bm!56368))

(assert (= (or b!1161163 b!1161154) bm!56375))

(assert (= (and b!1161172 (not res!770451)) b!1161162))

(assert (= (and b!1161162 c!115974) b!1161170))

(assert (= (and b!1161162 (not c!115974)) b!1161175))

(assert (= (and b!1161170 c!115976) b!1161164))

(assert (= (and b!1161170 (not c!115976)) b!1161169))

(assert (= (and b!1161169 c!115975) b!1161166))

(assert (= (and b!1161169 (not c!115975)) b!1161173))

(assert (= (and b!1161173 c!115973) b!1161171))

(assert (= (and b!1161173 (not c!115973)) b!1161168))

(assert (= (or b!1161166 b!1161171) bm!56370))

(assert (= (or b!1161166 b!1161171) bm!56374))

(assert (= (or b!1161166 b!1161171) bm!56373))

(assert (= (or b!1161164 bm!56373) bm!56371))

(assert (= (or b!1161164 bm!56370) bm!56369))

(assert (= (or b!1161164 bm!56374) bm!56372))

(assert (= (and b!1161170 c!115971) b!1161159))

(assert (= (and b!1161170 (not c!115971)) b!1161165))

(assert (= (and b!1161170 res!770458) b!1161174))

(assert (= (and b!1161162 res!770452) b!1161160))

(assert (= (and b!1161176 condMapEmpty!45476) mapIsEmpty!45476))

(assert (= (and b!1161176 (not condMapEmpty!45476)) mapNonEmpty!45476))

(get-info :version)

(assert (= (and mapNonEmpty!45476 ((_ is ValueCellFull!13841) mapValue!45476)) b!1161180))

(assert (= (and b!1161176 ((_ is ValueCellFull!13841) mapDefault!45476)) b!1161167))

(assert (= start!98960 b!1161176))

(declare-fun b_lambda!19659 () Bool)

(assert (=> (not b_lambda!19659) (not b!1161155)))

(declare-fun t!36967 () Bool)

(declare-fun tb!9375 () Bool)

(assert (=> (and start!98960 (= defaultEntry!1004 defaultEntry!1004) t!36967) tb!9375))

(declare-fun result!19323 () Bool)

(assert (=> tb!9375 (= result!19323 tp_is_empty!29101)))

(assert (=> b!1161155 t!36967))

(declare-fun b_and!39971 () Bool)

(assert (= b_and!39969 (and (=> t!36967 result!19323) b_and!39971)))

(declare-fun m!1069515 () Bool)

(assert (=> b!1161155 m!1069515))

(declare-fun m!1069517 () Bool)

(assert (=> b!1161155 m!1069517))

(declare-fun m!1069519 () Bool)

(assert (=> b!1161155 m!1069519))

(declare-fun m!1069521 () Bool)

(assert (=> b!1161155 m!1069521))

(declare-fun m!1069523 () Bool)

(assert (=> b!1161181 m!1069523))

(declare-fun m!1069525 () Bool)

(assert (=> b!1161164 m!1069525))

(assert (=> b!1161164 m!1069525))

(declare-fun m!1069527 () Bool)

(assert (=> b!1161164 m!1069527))

(declare-fun m!1069529 () Bool)

(assert (=> b!1161164 m!1069529))

(declare-fun m!1069531 () Bool)

(assert (=> b!1161172 m!1069531))

(declare-fun m!1069533 () Bool)

(assert (=> b!1161172 m!1069533))

(declare-fun m!1069535 () Bool)

(assert (=> b!1161157 m!1069535))

(declare-fun m!1069537 () Bool)

(assert (=> b!1161157 m!1069537))

(declare-fun m!1069539 () Bool)

(assert (=> b!1161178 m!1069539))

(declare-fun m!1069541 () Bool)

(assert (=> b!1161178 m!1069541))

(declare-fun m!1069543 () Bool)

(assert (=> bm!56369 m!1069543))

(declare-fun m!1069545 () Bool)

(assert (=> b!1161159 m!1069545))

(declare-fun m!1069547 () Bool)

(assert (=> b!1161170 m!1069547))

(declare-fun m!1069549 () Bool)

(assert (=> b!1161170 m!1069549))

(declare-fun m!1069551 () Bool)

(assert (=> b!1161170 m!1069551))

(declare-fun m!1069553 () Bool)

(assert (=> b!1161170 m!1069553))

(declare-fun m!1069555 () Bool)

(assert (=> start!98960 m!1069555))

(declare-fun m!1069557 () Bool)

(assert (=> start!98960 m!1069557))

(declare-fun m!1069559 () Bool)

(assert (=> b!1161163 m!1069559))

(declare-fun m!1069561 () Bool)

(assert (=> b!1161182 m!1069561))

(assert (=> b!1161174 m!1069545))

(declare-fun m!1069563 () Bool)

(assert (=> b!1161179 m!1069563))

(declare-fun m!1069565 () Bool)

(assert (=> bm!56368 m!1069565))

(declare-fun m!1069567 () Bool)

(assert (=> bm!56375 m!1069567))

(declare-fun m!1069569 () Bool)

(assert (=> bm!56371 m!1069569))

(assert (=> b!1161160 m!1069565))

(declare-fun m!1069571 () Bool)

(assert (=> b!1161177 m!1069571))

(declare-fun m!1069573 () Bool)

(assert (=> b!1161183 m!1069573))

(declare-fun m!1069575 () Bool)

(assert (=> b!1161161 m!1069575))

(declare-fun m!1069577 () Bool)

(assert (=> bm!56372 m!1069577))

(assert (=> b!1161162 m!1069567))

(declare-fun m!1069579 () Bool)

(assert (=> b!1161162 m!1069579))

(declare-fun m!1069581 () Bool)

(assert (=> b!1161162 m!1069581))

(assert (=> b!1161162 m!1069579))

(declare-fun m!1069583 () Bool)

(assert (=> b!1161162 m!1069583))

(assert (=> b!1161162 m!1069581))

(assert (=> b!1161162 m!1069531))

(declare-fun m!1069585 () Bool)

(assert (=> b!1161162 m!1069585))

(assert (=> b!1161162 m!1069531))

(declare-fun m!1069587 () Bool)

(assert (=> b!1161162 m!1069587))

(declare-fun m!1069589 () Bool)

(assert (=> b!1161162 m!1069589))

(declare-fun m!1069591 () Bool)

(assert (=> b!1161162 m!1069591))

(assert (=> b!1161162 m!1069531))

(declare-fun m!1069593 () Bool)

(assert (=> mapNonEmpty!45476 m!1069593))

(check-sat tp_is_empty!29101 (not start!98960) (not b_lambda!19659) (not b!1161157) (not bm!56371) (not b!1161178) (not b!1161183) (not b!1161170) (not b!1161181) (not mapNonEmpty!45476) (not b!1161162) (not b!1161164) (not b!1161172) (not b!1161161) (not bm!56368) (not bm!56369) (not b!1161159) (not b_next!24571) (not b!1161160) (not bm!56375) (not b!1161174) (not bm!56372) b_and!39971 (not b!1161163) (not b!1161155) (not b!1161182) (not b!1161179))
(check-sat b_and!39971 (not b_next!24571))
