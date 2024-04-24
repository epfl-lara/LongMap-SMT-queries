; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99130 () Bool)

(assert start!99130)

(declare-fun b_free!24499 () Bool)

(declare-fun b_next!24499 () Bool)

(assert (=> start!99130 (= b_free!24499 (not b_next!24499))))

(declare-fun tp!86208 () Bool)

(declare-fun b_and!39849 () Bool)

(assert (=> start!99130 (= tp!86208 b_and!39849)))

(declare-fun b!1159255 () Bool)

(declare-datatypes ((V!43833 0))(
  ( (V!43834 (val!14571 Int)) )
))
(declare-datatypes ((tuple2!18568 0))(
  ( (tuple2!18569 (_1!9295 (_ BitVec 64)) (_2!9295 V!43833)) )
))
(declare-datatypes ((List!25310 0))(
  ( (Nil!25307) (Cons!25306 (h!26524 tuple2!18568) (t!36793 List!25310)) )
))
(declare-datatypes ((ListLongMap!16545 0))(
  ( (ListLongMap!16546 (toList!8288 List!25310)) )
))
(declare-fun lt!520703 () ListLongMap!16545)

(declare-fun minValue!944 () V!43833)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6811 (ListLongMap!16545 (_ BitVec 64)) Bool)

(declare-fun +!3710 (ListLongMap!16545 tuple2!18568) ListLongMap!16545)

(assert (=> b!1159255 (contains!6811 (+!3710 lt!520703 (tuple2!18569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-datatypes ((Unit!38146 0))(
  ( (Unit!38147) )
))
(declare-fun lt!520691 () Unit!38146)

(declare-fun call!55601 () Unit!38146)

(assert (=> b!1159255 (= lt!520691 call!55601)))

(declare-fun call!55600 () Bool)

(assert (=> b!1159255 call!55600))

(declare-fun call!55596 () ListLongMap!16545)

(assert (=> b!1159255 (= lt!520703 call!55596)))

(declare-fun zeroValue!944 () V!43833)

(declare-fun lt!520702 () ListLongMap!16545)

(declare-fun lt!520689 () Unit!38146)

(declare-fun addStillContains!932 (ListLongMap!16545 (_ BitVec 64) V!43833 (_ BitVec 64)) Unit!38146)

(assert (=> b!1159255 (= lt!520689 (addStillContains!932 lt!520702 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!659340 () Unit!38146)

(assert (=> b!1159255 (= e!659340 lt!520691)))

(declare-fun bm!55592 () Bool)

(declare-fun call!55602 () ListLongMap!16545)

(assert (=> bm!55592 (= call!55602 call!55596)))

(declare-fun b!1159256 () Bool)

(declare-fun e!659353 () Bool)

(assert (=> b!1159256 (= e!659353 true)))

(declare-fun e!659342 () Bool)

(assert (=> b!1159256 e!659342))

(declare-fun res!769416 () Bool)

(assert (=> b!1159256 (=> (not res!769416) (not e!659342))))

(declare-fun lt!520694 () ListLongMap!16545)

(assert (=> b!1159256 (= res!769416 (= lt!520694 lt!520702))))

(declare-fun lt!520705 () ListLongMap!16545)

(declare-fun -!1390 (ListLongMap!16545 (_ BitVec 64)) ListLongMap!16545)

(assert (=> b!1159256 (= lt!520694 (-!1390 lt!520705 k0!934))))

(declare-datatypes ((array!74949 0))(
  ( (array!74950 (arr!36119 (Array (_ BitVec 32) (_ BitVec 64))) (size!36656 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74949)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!520686 () V!43833)

(assert (=> b!1159256 (= (-!1390 (+!3710 lt!520702 (tuple2!18569 (select (arr!36119 _keys!1208) from!1455) lt!520686)) (select (arr!36119 _keys!1208) from!1455)) lt!520702)))

(declare-fun lt!520687 () Unit!38146)

(declare-fun addThenRemoveForNewKeyIsSame!225 (ListLongMap!16545 (_ BitVec 64) V!43833) Unit!38146)

(assert (=> b!1159256 (= lt!520687 (addThenRemoveForNewKeyIsSame!225 lt!520702 (select (arr!36119 _keys!1208) from!1455) lt!520686))))

(declare-datatypes ((ValueCell!13805 0))(
  ( (ValueCellFull!13805 (v!17204 V!43833)) (EmptyCell!13805) )
))
(declare-datatypes ((array!74951 0))(
  ( (array!74952 (arr!36120 (Array (_ BitVec 32) ValueCell!13805)) (size!36657 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74951)

(declare-fun lt!520697 () V!43833)

(declare-fun get!18436 (ValueCell!13805 V!43833) V!43833)

(assert (=> b!1159256 (= lt!520686 (get!18436 (select (arr!36120 _values!996) from!1455) lt!520697))))

(declare-fun lt!520690 () Unit!38146)

(declare-fun e!659351 () Unit!38146)

(assert (=> b!1159256 (= lt!520690 e!659351)))

(declare-fun c!115751 () Bool)

(assert (=> b!1159256 (= c!115751 (contains!6811 lt!520702 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4781 (array!74949 array!74951 (_ BitVec 32) (_ BitVec 32) V!43833 V!43833 (_ BitVec 32) Int) ListLongMap!16545)

(assert (=> b!1159256 (= lt!520702 (getCurrentListMapNoExtraKeys!4781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159257 () Bool)

(declare-fun res!769412 () Bool)

(declare-fun e!659350 () Bool)

(assert (=> b!1159257 (=> (not res!769412) (not e!659350))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159257 (= res!769412 (= (select (arr!36119 _keys!1208) i!673) k0!934))))

(declare-fun c!115748 () Bool)

(declare-fun bm!55593 () Bool)

(assert (=> bm!55593 (= call!55600 (contains!6811 (ite c!115748 lt!520703 call!55602) k0!934))))

(declare-fun b!1159258 () Bool)

(declare-fun e!659341 () Unit!38146)

(declare-fun Unit!38148 () Unit!38146)

(assert (=> b!1159258 (= e!659341 Unit!38148)))

(declare-fun res!769402 () Bool)

(assert (=> start!99130 (=> (not res!769402) (not e!659350))))

(assert (=> start!99130 (= res!769402 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36656 _keys!1208))))))

(assert (=> start!99130 e!659350))

(declare-fun tp_is_empty!29029 () Bool)

(assert (=> start!99130 tp_is_empty!29029))

(declare-fun array_inv!27710 (array!74949) Bool)

(assert (=> start!99130 (array_inv!27710 _keys!1208)))

(assert (=> start!99130 true))

(assert (=> start!99130 tp!86208))

(declare-fun e!659346 () Bool)

(declare-fun array_inv!27711 (array!74951) Bool)

(assert (=> start!99130 (and (array_inv!27711 _values!996) e!659346)))

(declare-fun bm!55594 () Bool)

(declare-fun c!115747 () Bool)

(assert (=> bm!55594 (= call!55596 (+!3710 lt!520702 (ite (or c!115748 c!115747) (tuple2!18569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun call!55598 () ListLongMap!16545)

(declare-fun e!659354 () Bool)

(declare-fun call!55599 () ListLongMap!16545)

(declare-fun b!1159259 () Bool)

(assert (=> b!1159259 (= e!659354 (= call!55599 (-!1390 call!55598 k0!934)))))

(declare-fun bm!55595 () Bool)

(declare-fun call!55595 () Bool)

(assert (=> bm!55595 (= call!55595 call!55600)))

(declare-fun bm!55596 () Bool)

(declare-fun call!55597 () Unit!38146)

(assert (=> bm!55596 (= call!55597 call!55601)))

(declare-fun b!1159260 () Bool)

(declare-fun e!659348 () Bool)

(declare-fun arrayContainsKey!0 (array!74949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159260 (= e!659348 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159261 () Bool)

(declare-fun e!659343 () Bool)

(declare-fun mapRes!45368 () Bool)

(assert (=> b!1159261 (= e!659346 (and e!659343 mapRes!45368))))

(declare-fun condMapEmpty!45368 () Bool)

(declare-fun mapDefault!45368 () ValueCell!13805)

(assert (=> b!1159261 (= condMapEmpty!45368 (= (arr!36120 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13805)) mapDefault!45368)))))

(declare-fun b!1159262 () Bool)

(declare-fun e!659352 () Bool)

(declare-fun e!659344 () Bool)

(assert (=> b!1159262 (= e!659352 e!659344)))

(declare-fun res!769411 () Bool)

(assert (=> b!1159262 (=> res!769411 e!659344)))

(assert (=> b!1159262 (= res!769411 (not (= from!1455 i!673)))))

(declare-fun lt!520698 () array!74949)

(declare-fun lt!520684 () ListLongMap!16545)

(declare-fun lt!520693 () array!74951)

(assert (=> b!1159262 (= lt!520684 (getCurrentListMapNoExtraKeys!4781 lt!520698 lt!520693 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1159262 (= lt!520693 (array!74952 (store (arr!36120 _values!996) i!673 (ValueCellFull!13805 lt!520697)) (size!36657 _values!996)))))

(declare-fun dynLambda!2794 (Int (_ BitVec 64)) V!43833)

(assert (=> b!1159262 (= lt!520697 (dynLambda!2794 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1159262 (= lt!520705 (getCurrentListMapNoExtraKeys!4781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1159263 () Bool)

(declare-fun lt!520695 () Bool)

(assert (=> b!1159263 (= e!659348 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520695) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1159264 () Bool)

(assert (=> b!1159264 (= e!659343 tp_is_empty!29029)))

(declare-fun b!1159265 () Bool)

(declare-fun Unit!38149 () Unit!38146)

(assert (=> b!1159265 (= e!659351 Unit!38149)))

(declare-fun bm!55597 () Bool)

(assert (=> bm!55597 (= call!55601 (addStillContains!932 (ite c!115748 lt!520703 lt!520702) (ite c!115748 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115748 minValue!944 (ite c!115747 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1159266 () Bool)

(declare-fun e!659355 () Bool)

(assert (=> b!1159266 (= e!659355 tp_is_empty!29029)))

(declare-fun b!1159267 () Bool)

(declare-fun e!659356 () Unit!38146)

(assert (=> b!1159267 (= e!659356 e!659341)))

(declare-fun c!115752 () Bool)

(assert (=> b!1159267 (= c!115752 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520695))))

(declare-fun b!1159268 () Bool)

(declare-fun res!769407 () Bool)

(assert (=> b!1159268 (=> (not res!769407) (not e!659350))))

(assert (=> b!1159268 (= res!769407 (and (= (size!36657 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36656 _keys!1208) (size!36657 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159269 () Bool)

(assert (=> b!1159269 (= e!659344 e!659353)))

(declare-fun res!769408 () Bool)

(assert (=> b!1159269 (=> res!769408 e!659353)))

(assert (=> b!1159269 (= res!769408 (not (= (select (arr!36119 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1159269 e!659354))

(declare-fun c!115750 () Bool)

(assert (=> b!1159269 (= c!115750 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520692 () Unit!38146)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!629 (array!74949 array!74951 (_ BitVec 32) (_ BitVec 32) V!43833 V!43833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38146)

(assert (=> b!1159269 (= lt!520692 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!629 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159270 () Bool)

(assert (=> b!1159270 call!55595))

(declare-fun lt!520696 () Unit!38146)

(assert (=> b!1159270 (= lt!520696 call!55597)))

(assert (=> b!1159270 (= e!659341 lt!520696)))

(declare-fun b!1159271 () Bool)

(declare-fun e!659347 () Bool)

(assert (=> b!1159271 (= e!659347 (not e!659352))))

(declare-fun res!769410 () Bool)

(assert (=> b!1159271 (=> res!769410 e!659352)))

(assert (=> b!1159271 (= res!769410 (bvsgt from!1455 i!673))))

(assert (=> b!1159271 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520701 () Unit!38146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74949 (_ BitVec 64) (_ BitVec 32)) Unit!38146)

(assert (=> b!1159271 (= lt!520701 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1159272 () Bool)

(declare-fun res!769403 () Bool)

(assert (=> b!1159272 (=> (not res!769403) (not e!659350))))

(assert (=> b!1159272 (= res!769403 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36656 _keys!1208))))))

(declare-fun mapNonEmpty!45368 () Bool)

(declare-fun tp!86207 () Bool)

(assert (=> mapNonEmpty!45368 (= mapRes!45368 (and tp!86207 e!659355))))

(declare-fun mapValue!45368 () ValueCell!13805)

(declare-fun mapRest!45368 () (Array (_ BitVec 32) ValueCell!13805))

(declare-fun mapKey!45368 () (_ BitVec 32))

(assert (=> mapNonEmpty!45368 (= (arr!36120 _values!996) (store mapRest!45368 mapKey!45368 mapValue!45368))))

(declare-fun b!1159273 () Bool)

(declare-fun lt!520699 () Unit!38146)

(assert (=> b!1159273 (= e!659356 lt!520699)))

(assert (=> b!1159273 (= lt!520699 call!55597)))

(assert (=> b!1159273 call!55595))

(declare-fun b!1159274 () Bool)

(assert (=> b!1159274 (= e!659354 (= call!55598 call!55599))))

(declare-fun b!1159275 () Bool)

(assert (=> b!1159275 (= e!659350 e!659347)))

(declare-fun res!769409 () Bool)

(assert (=> b!1159275 (=> (not res!769409) (not e!659347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74949 (_ BitVec 32)) Bool)

(assert (=> b!1159275 (= res!769409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520698 mask!1564))))

(assert (=> b!1159275 (= lt!520698 (array!74950 (store (arr!36119 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36656 _keys!1208)))))

(declare-fun bm!55598 () Bool)

(assert (=> bm!55598 (= call!55598 (getCurrentListMapNoExtraKeys!4781 (ite c!115750 _keys!1208 lt!520698) (ite c!115750 _values!996 lt!520693) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159276 () Bool)

(declare-fun res!769405 () Bool)

(assert (=> b!1159276 (=> (not res!769405) (not e!659350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159276 (= res!769405 (validMask!0 mask!1564))))

(declare-fun b!1159277 () Bool)

(declare-fun res!769413 () Bool)

(assert (=> b!1159277 (=> (not res!769413) (not e!659347))))

(declare-datatypes ((List!25311 0))(
  ( (Nil!25308) (Cons!25307 (h!26525 (_ BitVec 64)) (t!36794 List!25311)) )
))
(declare-fun arrayNoDuplicates!0 (array!74949 (_ BitVec 32) List!25311) Bool)

(assert (=> b!1159277 (= res!769413 (arrayNoDuplicates!0 lt!520698 #b00000000000000000000000000000000 Nil!25308))))

(declare-fun b!1159278 () Bool)

(declare-fun res!769406 () Bool)

(assert (=> b!1159278 (=> (not res!769406) (not e!659350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159278 (= res!769406 (validKeyInArray!0 k0!934))))

(declare-fun e!659349 () Bool)

(declare-fun b!1159279 () Bool)

(assert (=> b!1159279 (= e!659349 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159280 () Bool)

(assert (=> b!1159280 (= e!659342 (= lt!520694 (getCurrentListMapNoExtraKeys!4781 lt!520698 lt!520693 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1159281 () Bool)

(declare-fun res!769404 () Bool)

(assert (=> b!1159281 (=> (not res!769404) (not e!659350))))

(assert (=> b!1159281 (= res!769404 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25308))))

(declare-fun bm!55599 () Bool)

(assert (=> bm!55599 (= call!55599 (getCurrentListMapNoExtraKeys!4781 (ite c!115750 lt!520698 _keys!1208) (ite c!115750 lt!520693 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159282 () Bool)

(assert (=> b!1159282 (= c!115747 (and (not lt!520695) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1159282 (= e!659340 e!659356)))

(declare-fun b!1159283 () Bool)

(declare-fun res!769414 () Bool)

(assert (=> b!1159283 (=> (not res!769414) (not e!659350))))

(assert (=> b!1159283 (= res!769414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45368 () Bool)

(assert (=> mapIsEmpty!45368 mapRes!45368))

(declare-fun b!1159284 () Bool)

(declare-fun Unit!38150 () Unit!38146)

(assert (=> b!1159284 (= e!659351 Unit!38150)))

(assert (=> b!1159284 (= lt!520695 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1159284 (= c!115748 (and (not lt!520695) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520685 () Unit!38146)

(assert (=> b!1159284 (= lt!520685 e!659340)))

(declare-fun lt!520688 () Unit!38146)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!520 (array!74949 array!74951 (_ BitVec 32) (_ BitVec 32) V!43833 V!43833 (_ BitVec 64) (_ BitVec 32) Int) Unit!38146)

(assert (=> b!1159284 (= lt!520688 (lemmaListMapContainsThenArrayContainsFrom!520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115749 () Bool)

(assert (=> b!1159284 (= c!115749 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769415 () Bool)

(assert (=> b!1159284 (= res!769415 e!659348)))

(assert (=> b!1159284 (=> (not res!769415) (not e!659349))))

(assert (=> b!1159284 e!659349))

(declare-fun lt!520704 () Unit!38146)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74949 (_ BitVec 32) (_ BitVec 32)) Unit!38146)

(assert (=> b!1159284 (= lt!520704 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1159284 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25308)))

(declare-fun lt!520700 () Unit!38146)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74949 (_ BitVec 64) (_ BitVec 32) List!25311) Unit!38146)

(assert (=> b!1159284 (= lt!520700 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25308))))

(assert (=> b!1159284 false))

(assert (= (and start!99130 res!769402) b!1159276))

(assert (= (and b!1159276 res!769405) b!1159268))

(assert (= (and b!1159268 res!769407) b!1159283))

(assert (= (and b!1159283 res!769414) b!1159281))

(assert (= (and b!1159281 res!769404) b!1159272))

(assert (= (and b!1159272 res!769403) b!1159278))

(assert (= (and b!1159278 res!769406) b!1159257))

(assert (= (and b!1159257 res!769412) b!1159275))

(assert (= (and b!1159275 res!769409) b!1159277))

(assert (= (and b!1159277 res!769413) b!1159271))

(assert (= (and b!1159271 (not res!769410)) b!1159262))

(assert (= (and b!1159262 (not res!769411)) b!1159269))

(assert (= (and b!1159269 c!115750) b!1159259))

(assert (= (and b!1159269 (not c!115750)) b!1159274))

(assert (= (or b!1159259 b!1159274) bm!55598))

(assert (= (or b!1159259 b!1159274) bm!55599))

(assert (= (and b!1159269 (not res!769408)) b!1159256))

(assert (= (and b!1159256 c!115751) b!1159284))

(assert (= (and b!1159256 (not c!115751)) b!1159265))

(assert (= (and b!1159284 c!115748) b!1159255))

(assert (= (and b!1159284 (not c!115748)) b!1159282))

(assert (= (and b!1159282 c!115747) b!1159273))

(assert (= (and b!1159282 (not c!115747)) b!1159267))

(assert (= (and b!1159267 c!115752) b!1159270))

(assert (= (and b!1159267 (not c!115752)) b!1159258))

(assert (= (or b!1159273 b!1159270) bm!55596))

(assert (= (or b!1159273 b!1159270) bm!55592))

(assert (= (or b!1159273 b!1159270) bm!55595))

(assert (= (or b!1159255 bm!55595) bm!55593))

(assert (= (or b!1159255 bm!55596) bm!55597))

(assert (= (or b!1159255 bm!55592) bm!55594))

(assert (= (and b!1159284 c!115749) b!1159260))

(assert (= (and b!1159284 (not c!115749)) b!1159263))

(assert (= (and b!1159284 res!769415) b!1159279))

(assert (= (and b!1159256 res!769416) b!1159280))

(assert (= (and b!1159261 condMapEmpty!45368) mapIsEmpty!45368))

(assert (= (and b!1159261 (not condMapEmpty!45368)) mapNonEmpty!45368))

(get-info :version)

(assert (= (and mapNonEmpty!45368 ((_ is ValueCellFull!13805) mapValue!45368)) b!1159266))

(assert (= (and b!1159261 ((_ is ValueCellFull!13805) mapDefault!45368)) b!1159264))

(assert (= start!99130 b!1159261))

(declare-fun b_lambda!19599 () Bool)

(assert (=> (not b_lambda!19599) (not b!1159262)))

(declare-fun t!36792 () Bool)

(declare-fun tb!9303 () Bool)

(assert (=> (and start!99130 (= defaultEntry!1004 defaultEntry!1004) t!36792) tb!9303))

(declare-fun result!19179 () Bool)

(assert (=> tb!9303 (= result!19179 tp_is_empty!29029)))

(assert (=> b!1159262 t!36792))

(declare-fun b_and!39851 () Bool)

(assert (= b_and!39849 (and (=> t!36792 result!19179) b_and!39851)))

(declare-fun m!1068797 () Bool)

(assert (=> b!1159259 m!1068797))

(declare-fun m!1068799 () Bool)

(assert (=> b!1159276 m!1068799))

(declare-fun m!1068801 () Bool)

(assert (=> b!1159269 m!1068801))

(declare-fun m!1068803 () Bool)

(assert (=> b!1159269 m!1068803))

(declare-fun m!1068805 () Bool)

(assert (=> b!1159255 m!1068805))

(assert (=> b!1159255 m!1068805))

(declare-fun m!1068807 () Bool)

(assert (=> b!1159255 m!1068807))

(declare-fun m!1068809 () Bool)

(assert (=> b!1159255 m!1068809))

(declare-fun m!1068811 () Bool)

(assert (=> b!1159277 m!1068811))

(declare-fun m!1068813 () Bool)

(assert (=> start!99130 m!1068813))

(declare-fun m!1068815 () Bool)

(assert (=> start!99130 m!1068815))

(declare-fun m!1068817 () Bool)

(assert (=> bm!55598 m!1068817))

(declare-fun m!1068819 () Bool)

(assert (=> b!1159260 m!1068819))

(declare-fun m!1068821 () Bool)

(assert (=> b!1159275 m!1068821))

(declare-fun m!1068823 () Bool)

(assert (=> b!1159275 m!1068823))

(assert (=> b!1159279 m!1068819))

(declare-fun m!1068825 () Bool)

(assert (=> bm!55597 m!1068825))

(declare-fun m!1068827 () Bool)

(assert (=> b!1159280 m!1068827))

(declare-fun m!1068829 () Bool)

(assert (=> bm!55594 m!1068829))

(declare-fun m!1068831 () Bool)

(assert (=> bm!55593 m!1068831))

(declare-fun m!1068833 () Bool)

(assert (=> b!1159271 m!1068833))

(declare-fun m!1068835 () Bool)

(assert (=> b!1159271 m!1068835))

(declare-fun m!1068837 () Bool)

(assert (=> b!1159257 m!1068837))

(declare-fun m!1068839 () Bool)

(assert (=> b!1159284 m!1068839))

(declare-fun m!1068841 () Bool)

(assert (=> b!1159284 m!1068841))

(declare-fun m!1068843 () Bool)

(assert (=> b!1159284 m!1068843))

(declare-fun m!1068845 () Bool)

(assert (=> b!1159284 m!1068845))

(declare-fun m!1068847 () Bool)

(assert (=> b!1159281 m!1068847))

(declare-fun m!1068849 () Bool)

(assert (=> b!1159278 m!1068849))

(declare-fun m!1068851 () Bool)

(assert (=> mapNonEmpty!45368 m!1068851))

(declare-fun m!1068853 () Bool)

(assert (=> bm!55599 m!1068853))

(declare-fun m!1068855 () Bool)

(assert (=> b!1159283 m!1068855))

(declare-fun m!1068857 () Bool)

(assert (=> b!1159256 m!1068857))

(declare-fun m!1068859 () Bool)

(assert (=> b!1159256 m!1068859))

(assert (=> b!1159256 m!1068801))

(declare-fun m!1068861 () Bool)

(assert (=> b!1159256 m!1068861))

(declare-fun m!1068863 () Bool)

(assert (=> b!1159256 m!1068863))

(assert (=> b!1159256 m!1068801))

(declare-fun m!1068865 () Bool)

(assert (=> b!1159256 m!1068865))

(declare-fun m!1068867 () Bool)

(assert (=> b!1159256 m!1068867))

(assert (=> b!1159256 m!1068865))

(declare-fun m!1068869 () Bool)

(assert (=> b!1159256 m!1068869))

(assert (=> b!1159256 m!1068859))

(assert (=> b!1159256 m!1068801))

(declare-fun m!1068871 () Bool)

(assert (=> b!1159256 m!1068871))

(declare-fun m!1068873 () Bool)

(assert (=> b!1159262 m!1068873))

(declare-fun m!1068875 () Bool)

(assert (=> b!1159262 m!1068875))

(declare-fun m!1068877 () Bool)

(assert (=> b!1159262 m!1068877))

(declare-fun m!1068879 () Bool)

(assert (=> b!1159262 m!1068879))

(check-sat (not b!1159277) (not b!1159276) (not start!99130) (not b!1159278) (not bm!55594) (not b_lambda!19599) (not b!1159255) (not b!1159284) (not b!1159256) (not b!1159281) (not b!1159269) (not b!1159283) (not b!1159262) (not b!1159271) (not bm!55593) tp_is_empty!29029 (not bm!55597) (not b!1159279) (not b_next!24499) (not b!1159260) (not b!1159275) b_and!39851 (not mapNonEmpty!45368) (not b!1159280) (not bm!55599) (not b!1159259) (not bm!55598))
(check-sat b_and!39851 (not b_next!24499))
