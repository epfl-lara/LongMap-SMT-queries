; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99010 () Bool)

(assert start!99010)

(declare-fun b_free!24615 () Bool)

(declare-fun b_next!24615 () Bool)

(assert (=> start!99010 (= b_free!24615 (not b_next!24615))))

(declare-fun tp!86555 () Bool)

(declare-fun b_and!40079 () Bool)

(assert (=> start!99010 (= tp!86555 b_and!40079)))

(declare-fun mapNonEmpty!45542 () Bool)

(declare-fun mapRes!45542 () Bool)

(declare-fun tp!86556 () Bool)

(declare-fun e!661481 () Bool)

(assert (=> mapNonEmpty!45542 (= mapRes!45542 (and tp!86556 e!661481))))

(declare-datatypes ((V!43987 0))(
  ( (V!43988 (val!14629 Int)) )
))
(declare-datatypes ((ValueCell!13863 0))(
  ( (ValueCellFull!13863 (v!17266 V!43987)) (EmptyCell!13863) )
))
(declare-fun mapRest!45542 () (Array (_ BitVec 32) ValueCell!13863))

(declare-fun mapValue!45542 () ValueCell!13863)

(declare-datatypes ((array!75129 0))(
  ( (array!75130 (arr!36215 (Array (_ BitVec 32) ValueCell!13863)) (size!36751 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75129)

(declare-fun mapKey!45542 () (_ BitVec 32))

(assert (=> mapNonEmpty!45542 (= (arr!36215 _values!996) (store mapRest!45542 mapKey!45542 mapValue!45542))))

(declare-fun b!1163302 () Bool)

(declare-fun e!661473 () Bool)

(declare-fun e!661468 () Bool)

(assert (=> b!1163302 (= e!661473 (and e!661468 mapRes!45542))))

(declare-fun condMapEmpty!45542 () Bool)

(declare-fun mapDefault!45542 () ValueCell!13863)

(assert (=> b!1163302 (= condMapEmpty!45542 (= (arr!36215 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13863)) mapDefault!45542)))))

(declare-fun b!1163303 () Bool)

(declare-fun e!661470 () Bool)

(declare-fun e!661474 () Bool)

(assert (=> b!1163303 (= e!661470 e!661474)))

(declare-fun res!771510 () Bool)

(assert (=> b!1163303 (=> res!771510 e!661474)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163303 (= res!771510 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43987)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!524039 () array!75129)

(declare-datatypes ((array!75131 0))(
  ( (array!75132 (arr!36216 (Array (_ BitVec 32) (_ BitVec 64))) (size!36752 (_ BitVec 32))) )
))
(declare-fun lt!524047 () array!75131)

(declare-fun minValue!944 () V!43987)

(declare-datatypes ((tuple2!18654 0))(
  ( (tuple2!18655 (_1!9338 (_ BitVec 64)) (_2!9338 V!43987)) )
))
(declare-datatypes ((List!25387 0))(
  ( (Nil!25384) (Cons!25383 (h!26592 tuple2!18654) (t!36994 List!25387)) )
))
(declare-datatypes ((ListLongMap!16623 0))(
  ( (ListLongMap!16624 (toList!8327 List!25387)) )
))
(declare-fun lt!524038 () ListLongMap!16623)

(declare-fun getCurrentListMapNoExtraKeys!4791 (array!75131 array!75129 (_ BitVec 32) (_ BitVec 32) V!43987 V!43987 (_ BitVec 32) Int) ListLongMap!16623)

(assert (=> b!1163303 (= lt!524038 (getCurrentListMapNoExtraKeys!4791 lt!524047 lt!524039 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524040 () V!43987)

(assert (=> b!1163303 (= lt!524039 (array!75130 (store (arr!36215 _values!996) i!673 (ValueCellFull!13863 lt!524040)) (size!36751 _values!996)))))

(declare-fun dynLambda!2784 (Int (_ BitVec 64)) V!43987)

(assert (=> b!1163303 (= lt!524040 (dynLambda!2784 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75131)

(declare-fun lt!524036 () ListLongMap!16623)

(assert (=> b!1163303 (= lt!524036 (getCurrentListMapNoExtraKeys!4791 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1163304 () Bool)

(declare-fun e!661467 () Bool)

(declare-fun arrayContainsKey!0 (array!75131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163304 (= e!661467 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163305 () Bool)

(declare-fun e!661475 () Bool)

(assert (=> b!1163305 (= e!661475 true)))

(declare-fun e!661480 () Bool)

(assert (=> b!1163305 e!661480))

(declare-fun res!771515 () Bool)

(assert (=> b!1163305 (=> (not res!771515) (not e!661480))))

(declare-fun lt!524029 () ListLongMap!16623)

(declare-fun lt!524043 () ListLongMap!16623)

(assert (=> b!1163305 (= res!771515 (= lt!524029 lt!524043))))

(declare-fun -!1431 (ListLongMap!16623 (_ BitVec 64)) ListLongMap!16623)

(assert (=> b!1163305 (= lt!524029 (-!1431 lt!524036 k0!934))))

(declare-fun lt!524035 () V!43987)

(declare-fun +!3730 (ListLongMap!16623 tuple2!18654) ListLongMap!16623)

(assert (=> b!1163305 (= (-!1431 (+!3730 lt!524043 (tuple2!18655 (select (arr!36216 _keys!1208) from!1455) lt!524035)) (select (arr!36216 _keys!1208) from!1455)) lt!524043)))

(declare-datatypes ((Unit!38390 0))(
  ( (Unit!38391) )
))
(declare-fun lt!524028 () Unit!38390)

(declare-fun addThenRemoveForNewKeyIsSame!264 (ListLongMap!16623 (_ BitVec 64) V!43987) Unit!38390)

(assert (=> b!1163305 (= lt!524028 (addThenRemoveForNewKeyIsSame!264 lt!524043 (select (arr!36216 _keys!1208) from!1455) lt!524035))))

(declare-fun get!18482 (ValueCell!13863 V!43987) V!43987)

(assert (=> b!1163305 (= lt!524035 (get!18482 (select (arr!36215 _values!996) from!1455) lt!524040))))

(declare-fun lt!524031 () Unit!38390)

(declare-fun e!661479 () Unit!38390)

(assert (=> b!1163305 (= lt!524031 e!661479)))

(declare-fun c!116397 () Bool)

(declare-fun contains!6831 (ListLongMap!16623 (_ BitVec 64)) Bool)

(assert (=> b!1163305 (= c!116397 (contains!6831 lt!524043 k0!934))))

(assert (=> b!1163305 (= lt!524043 (getCurrentListMapNoExtraKeys!4791 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163306 () Bool)

(declare-fun tp_is_empty!29145 () Bool)

(assert (=> b!1163306 (= e!661468 tp_is_empty!29145)))

(declare-fun b!1163307 () Bool)

(assert (=> b!1163307 (= e!661481 tp_is_empty!29145)))

(declare-fun b!1163308 () Bool)

(declare-fun e!661482 () Unit!38390)

(declare-fun lt!524048 () Unit!38390)

(assert (=> b!1163308 (= e!661482 lt!524048)))

(declare-fun call!56923 () Unit!38390)

(assert (=> b!1163308 (= lt!524048 call!56923)))

(declare-fun call!56926 () Bool)

(assert (=> b!1163308 call!56926))

(declare-fun b!1163309 () Bool)

(assert (=> b!1163309 (= e!661480 (= lt!524029 (getCurrentListMapNoExtraKeys!4791 lt!524047 lt!524039 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163310 () Bool)

(declare-fun c!116398 () Bool)

(declare-fun lt!524041 () Bool)

(assert (=> b!1163310 (= c!116398 (and (not lt!524041) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661476 () Unit!38390)

(assert (=> b!1163310 (= e!661476 e!661482)))

(declare-fun b!1163311 () Bool)

(declare-fun res!771505 () Bool)

(declare-fun e!661466 () Bool)

(assert (=> b!1163311 (=> (not res!771505) (not e!661466))))

(assert (=> b!1163311 (= res!771505 (and (= (size!36751 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36752 _keys!1208) (size!36751 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun c!116396 () Bool)

(declare-fun call!56925 () ListLongMap!16623)

(declare-fun bm!56920 () Bool)

(assert (=> bm!56920 (= call!56925 (+!3730 lt!524043 (ite (or c!116396 c!116398) (tuple2!18655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!56921 () Bool)

(declare-fun call!56928 () Unit!38390)

(assert (=> bm!56921 (= call!56923 call!56928)))

(declare-fun b!1163312 () Bool)

(declare-fun e!661472 () Bool)

(assert (=> b!1163312 (= e!661472 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!524041) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!56929 () ListLongMap!16623)

(declare-fun bm!56922 () Bool)

(assert (=> bm!56922 (= call!56929 (getCurrentListMapNoExtraKeys!4791 lt!524047 lt!524039 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163313 () Bool)

(declare-fun res!771506 () Bool)

(assert (=> b!1163313 (=> (not res!771506) (not e!661466))))

(assert (=> b!1163313 (= res!771506 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36752 _keys!1208))))))

(declare-fun b!1163314 () Bool)

(declare-fun res!771512 () Bool)

(declare-fun e!661478 () Bool)

(assert (=> b!1163314 (=> (not res!771512) (not e!661478))))

(declare-datatypes ((List!25388 0))(
  ( (Nil!25385) (Cons!25384 (h!26593 (_ BitVec 64)) (t!36995 List!25388)) )
))
(declare-fun arrayNoDuplicates!0 (array!75131 (_ BitVec 32) List!25388) Bool)

(assert (=> b!1163314 (= res!771512 (arrayNoDuplicates!0 lt!524047 #b00000000000000000000000000000000 Nil!25385))))

(declare-fun bm!56923 () Bool)

(declare-fun lt!524046 () ListLongMap!16623)

(declare-fun addStillContains!970 (ListLongMap!16623 (_ BitVec 64) V!43987 (_ BitVec 64)) Unit!38390)

(assert (=> bm!56923 (= call!56928 (addStillContains!970 (ite c!116396 lt!524046 lt!524043) (ite c!116396 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116398 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116396 minValue!944 (ite c!116398 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1163315 () Bool)

(declare-fun e!661469 () Unit!38390)

(assert (=> b!1163315 (= e!661482 e!661469)))

(declare-fun c!116394 () Bool)

(assert (=> b!1163315 (= c!116394 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!524041))))

(declare-fun b!1163316 () Bool)

(declare-fun res!771518 () Bool)

(assert (=> b!1163316 (=> (not res!771518) (not e!661466))))

(assert (=> b!1163316 (= res!771518 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25385))))

(declare-fun b!1163317 () Bool)

(declare-fun e!661477 () Bool)

(declare-fun call!56922 () ListLongMap!16623)

(assert (=> b!1163317 (= e!661477 (= call!56929 (-!1431 call!56922 k0!934)))))

(declare-fun b!1163318 () Bool)

(assert (=> b!1163318 (= e!661477 (= call!56929 call!56922))))

(declare-fun bm!56924 () Bool)

(assert (=> bm!56924 (= call!56922 (getCurrentListMapNoExtraKeys!4791 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!56927 () Bool)

(declare-fun bm!56925 () Bool)

(declare-fun call!56924 () ListLongMap!16623)

(assert (=> bm!56925 (= call!56927 (contains!6831 (ite c!116396 lt!524046 call!56924) k0!934))))

(declare-fun b!1163319 () Bool)

(declare-fun Unit!38392 () Unit!38390)

(assert (=> b!1163319 (= e!661479 Unit!38392)))

(assert (=> b!1163319 (= lt!524041 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1163319 (= c!116396 (and (not lt!524041) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524049 () Unit!38390)

(assert (=> b!1163319 (= lt!524049 e!661476)))

(declare-fun lt!524030 () Unit!38390)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!555 (array!75131 array!75129 (_ BitVec 32) (_ BitVec 32) V!43987 V!43987 (_ BitVec 64) (_ BitVec 32) Int) Unit!38390)

(assert (=> b!1163319 (= lt!524030 (lemmaListMapContainsThenArrayContainsFrom!555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116395 () Bool)

(assert (=> b!1163319 (= c!116395 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771508 () Bool)

(assert (=> b!1163319 (= res!771508 e!661472)))

(assert (=> b!1163319 (=> (not res!771508) (not e!661467))))

(assert (=> b!1163319 e!661467))

(declare-fun lt!524034 () Unit!38390)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75131 (_ BitVec 32) (_ BitVec 32)) Unit!38390)

(assert (=> b!1163319 (= lt!524034 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1163319 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25385)))

(declare-fun lt!524044 () Unit!38390)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75131 (_ BitVec 64) (_ BitVec 32) List!25388) Unit!38390)

(assert (=> b!1163319 (= lt!524044 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25385))))

(assert (=> b!1163319 false))

(declare-fun b!1163320 () Bool)

(assert (=> b!1163320 (= e!661472 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163321 () Bool)

(declare-fun res!771511 () Bool)

(assert (=> b!1163321 (=> (not res!771511) (not e!661466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163321 (= res!771511 (validKeyInArray!0 k0!934))))

(declare-fun bm!56919 () Bool)

(assert (=> bm!56919 (= call!56926 call!56927)))

(declare-fun res!771507 () Bool)

(assert (=> start!99010 (=> (not res!771507) (not e!661466))))

(assert (=> start!99010 (= res!771507 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36752 _keys!1208))))))

(assert (=> start!99010 e!661466))

(assert (=> start!99010 tp_is_empty!29145))

(declare-fun array_inv!27712 (array!75131) Bool)

(assert (=> start!99010 (array_inv!27712 _keys!1208)))

(assert (=> start!99010 true))

(assert (=> start!99010 tp!86555))

(declare-fun array_inv!27713 (array!75129) Bool)

(assert (=> start!99010 (and (array_inv!27713 _values!996) e!661473)))

(declare-fun b!1163322 () Bool)

(declare-fun res!771514 () Bool)

(assert (=> b!1163322 (=> (not res!771514) (not e!661466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75131 (_ BitVec 32)) Bool)

(assert (=> b!1163322 (= res!771514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45542 () Bool)

(assert (=> mapIsEmpty!45542 mapRes!45542))

(declare-fun b!1163323 () Bool)

(assert (=> b!1163323 (contains!6831 (+!3730 lt!524046 (tuple2!18655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!524042 () Unit!38390)

(assert (=> b!1163323 (= lt!524042 call!56928)))

(assert (=> b!1163323 call!56927))

(assert (=> b!1163323 (= lt!524046 call!56925)))

(declare-fun lt!524032 () Unit!38390)

(assert (=> b!1163323 (= lt!524032 (addStillContains!970 lt!524043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1163323 (= e!661476 lt!524042)))

(declare-fun b!1163324 () Bool)

(declare-fun Unit!38393 () Unit!38390)

(assert (=> b!1163324 (= e!661469 Unit!38393)))

(declare-fun b!1163325 () Bool)

(assert (=> b!1163325 (= e!661478 (not e!661470))))

(declare-fun res!771516 () Bool)

(assert (=> b!1163325 (=> res!771516 e!661470)))

(assert (=> b!1163325 (= res!771516 (bvsgt from!1455 i!673))))

(assert (=> b!1163325 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!524037 () Unit!38390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75131 (_ BitVec 64) (_ BitVec 32)) Unit!38390)

(assert (=> b!1163325 (= lt!524037 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1163326 () Bool)

(declare-fun res!771513 () Bool)

(assert (=> b!1163326 (=> (not res!771513) (not e!661466))))

(assert (=> b!1163326 (= res!771513 (= (select (arr!36216 _keys!1208) i!673) k0!934))))

(declare-fun b!1163327 () Bool)

(assert (=> b!1163327 (= e!661466 e!661478)))

(declare-fun res!771504 () Bool)

(assert (=> b!1163327 (=> (not res!771504) (not e!661478))))

(assert (=> b!1163327 (= res!771504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524047 mask!1564))))

(assert (=> b!1163327 (= lt!524047 (array!75132 (store (arr!36216 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36752 _keys!1208)))))

(declare-fun b!1163328 () Bool)

(assert (=> b!1163328 call!56926))

(declare-fun lt!524033 () Unit!38390)

(assert (=> b!1163328 (= lt!524033 call!56923)))

(assert (=> b!1163328 (= e!661469 lt!524033)))

(declare-fun b!1163329 () Bool)

(assert (=> b!1163329 (= e!661474 e!661475)))

(declare-fun res!771517 () Bool)

(assert (=> b!1163329 (=> res!771517 e!661475)))

(assert (=> b!1163329 (= res!771517 (not (= (select (arr!36216 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1163329 e!661477))

(declare-fun c!116393 () Bool)

(assert (=> b!1163329 (= c!116393 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!524045 () Unit!38390)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!659 (array!75131 array!75129 (_ BitVec 32) (_ BitVec 32) V!43987 V!43987 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38390)

(assert (=> b!1163329 (= lt!524045 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!659 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56926 () Bool)

(assert (=> bm!56926 (= call!56924 call!56925)))

(declare-fun b!1163330 () Bool)

(declare-fun res!771509 () Bool)

(assert (=> b!1163330 (=> (not res!771509) (not e!661466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163330 (= res!771509 (validMask!0 mask!1564))))

(declare-fun b!1163331 () Bool)

(declare-fun Unit!38394 () Unit!38390)

(assert (=> b!1163331 (= e!661479 Unit!38394)))

(assert (= (and start!99010 res!771507) b!1163330))

(assert (= (and b!1163330 res!771509) b!1163311))

(assert (= (and b!1163311 res!771505) b!1163322))

(assert (= (and b!1163322 res!771514) b!1163316))

(assert (= (and b!1163316 res!771518) b!1163313))

(assert (= (and b!1163313 res!771506) b!1163321))

(assert (= (and b!1163321 res!771511) b!1163326))

(assert (= (and b!1163326 res!771513) b!1163327))

(assert (= (and b!1163327 res!771504) b!1163314))

(assert (= (and b!1163314 res!771512) b!1163325))

(assert (= (and b!1163325 (not res!771516)) b!1163303))

(assert (= (and b!1163303 (not res!771510)) b!1163329))

(assert (= (and b!1163329 c!116393) b!1163317))

(assert (= (and b!1163329 (not c!116393)) b!1163318))

(assert (= (or b!1163317 b!1163318) bm!56922))

(assert (= (or b!1163317 b!1163318) bm!56924))

(assert (= (and b!1163329 (not res!771517)) b!1163305))

(assert (= (and b!1163305 c!116397) b!1163319))

(assert (= (and b!1163305 (not c!116397)) b!1163331))

(assert (= (and b!1163319 c!116396) b!1163323))

(assert (= (and b!1163319 (not c!116396)) b!1163310))

(assert (= (and b!1163310 c!116398) b!1163308))

(assert (= (and b!1163310 (not c!116398)) b!1163315))

(assert (= (and b!1163315 c!116394) b!1163328))

(assert (= (and b!1163315 (not c!116394)) b!1163324))

(assert (= (or b!1163308 b!1163328) bm!56921))

(assert (= (or b!1163308 b!1163328) bm!56926))

(assert (= (or b!1163308 b!1163328) bm!56919))

(assert (= (or b!1163323 bm!56919) bm!56925))

(assert (= (or b!1163323 bm!56921) bm!56923))

(assert (= (or b!1163323 bm!56926) bm!56920))

(assert (= (and b!1163319 c!116395) b!1163320))

(assert (= (and b!1163319 (not c!116395)) b!1163312))

(assert (= (and b!1163319 res!771508) b!1163304))

(assert (= (and b!1163305 res!771515) b!1163309))

(assert (= (and b!1163302 condMapEmpty!45542) mapIsEmpty!45542))

(assert (= (and b!1163302 (not condMapEmpty!45542)) mapNonEmpty!45542))

(get-info :version)

(assert (= (and mapNonEmpty!45542 ((_ is ValueCellFull!13863) mapValue!45542)) b!1163307))

(assert (= (and b!1163302 ((_ is ValueCellFull!13863) mapDefault!45542)) b!1163306))

(assert (= start!99010 b!1163302))

(declare-fun b_lambda!19721 () Bool)

(assert (=> (not b_lambda!19721) (not b!1163303)))

(declare-fun t!36993 () Bool)

(declare-fun tb!9427 () Bool)

(assert (=> (and start!99010 (= defaultEntry!1004 defaultEntry!1004) t!36993) tb!9427))

(declare-fun result!19419 () Bool)

(assert (=> tb!9427 (= result!19419 tp_is_empty!29145)))

(assert (=> b!1163303 t!36993))

(declare-fun b_and!40081 () Bool)

(assert (= b_and!40079 (and (=> t!36993 result!19419) b_and!40081)))

(declare-fun m!1071889 () Bool)

(assert (=> b!1163304 m!1071889))

(assert (=> b!1163320 m!1071889))

(declare-fun m!1071891 () Bool)

(assert (=> b!1163305 m!1071891))

(declare-fun m!1071893 () Bool)

(assert (=> b!1163305 m!1071893))

(declare-fun m!1071895 () Bool)

(assert (=> b!1163305 m!1071895))

(assert (=> b!1163305 m!1071893))

(declare-fun m!1071897 () Bool)

(assert (=> b!1163305 m!1071897))

(declare-fun m!1071899 () Bool)

(assert (=> b!1163305 m!1071899))

(declare-fun m!1071901 () Bool)

(assert (=> b!1163305 m!1071901))

(declare-fun m!1071903 () Bool)

(assert (=> b!1163305 m!1071903))

(declare-fun m!1071905 () Bool)

(assert (=> b!1163305 m!1071905))

(assert (=> b!1163305 m!1071897))

(assert (=> b!1163305 m!1071899))

(declare-fun m!1071907 () Bool)

(assert (=> b!1163305 m!1071907))

(assert (=> b!1163305 m!1071899))

(declare-fun m!1071909 () Bool)

(assert (=> b!1163326 m!1071909))

(declare-fun m!1071911 () Bool)

(assert (=> start!99010 m!1071911))

(declare-fun m!1071913 () Bool)

(assert (=> start!99010 m!1071913))

(declare-fun m!1071915 () Bool)

(assert (=> b!1163319 m!1071915))

(declare-fun m!1071917 () Bool)

(assert (=> b!1163319 m!1071917))

(declare-fun m!1071919 () Bool)

(assert (=> b!1163319 m!1071919))

(declare-fun m!1071921 () Bool)

(assert (=> b!1163319 m!1071921))

(declare-fun m!1071923 () Bool)

(assert (=> b!1163323 m!1071923))

(assert (=> b!1163323 m!1071923))

(declare-fun m!1071925 () Bool)

(assert (=> b!1163323 m!1071925))

(declare-fun m!1071927 () Bool)

(assert (=> b!1163323 m!1071927))

(declare-fun m!1071929 () Bool)

(assert (=> b!1163314 m!1071929))

(assert (=> bm!56924 m!1071891))

(declare-fun m!1071931 () Bool)

(assert (=> bm!56923 m!1071931))

(declare-fun m!1071933 () Bool)

(assert (=> b!1163303 m!1071933))

(declare-fun m!1071935 () Bool)

(assert (=> b!1163303 m!1071935))

(declare-fun m!1071937 () Bool)

(assert (=> b!1163303 m!1071937))

(declare-fun m!1071939 () Bool)

(assert (=> b!1163303 m!1071939))

(declare-fun m!1071941 () Bool)

(assert (=> bm!56920 m!1071941))

(declare-fun m!1071943 () Bool)

(assert (=> b!1163321 m!1071943))

(declare-fun m!1071945 () Bool)

(assert (=> bm!56922 m!1071945))

(declare-fun m!1071947 () Bool)

(assert (=> b!1163325 m!1071947))

(declare-fun m!1071949 () Bool)

(assert (=> b!1163325 m!1071949))

(declare-fun m!1071951 () Bool)

(assert (=> bm!56925 m!1071951))

(declare-fun m!1071953 () Bool)

(assert (=> mapNonEmpty!45542 m!1071953))

(declare-fun m!1071955 () Bool)

(assert (=> b!1163316 m!1071955))

(assert (=> b!1163329 m!1071899))

(declare-fun m!1071957 () Bool)

(assert (=> b!1163329 m!1071957))

(declare-fun m!1071959 () Bool)

(assert (=> b!1163322 m!1071959))

(declare-fun m!1071961 () Bool)

(assert (=> b!1163327 m!1071961))

(declare-fun m!1071963 () Bool)

(assert (=> b!1163327 m!1071963))

(declare-fun m!1071965 () Bool)

(assert (=> b!1163317 m!1071965))

(declare-fun m!1071967 () Bool)

(assert (=> b!1163330 m!1071967))

(assert (=> b!1163309 m!1071945))

(check-sat (not b!1163330) (not bm!56924) (not b!1163309) (not b!1163320) (not b!1163322) (not bm!56925) (not b!1163329) (not b_lambda!19721) (not b!1163325) tp_is_empty!29145 (not bm!56922) b_and!40081 (not bm!56920) (not b!1163323) (not b!1163316) (not start!99010) (not mapNonEmpty!45542) (not b!1163303) (not b!1163305) (not b!1163304) (not b!1163317) (not b!1163319) (not b_next!24615) (not b!1163327) (not b!1163314) (not b!1163321) (not bm!56923))
(check-sat b_and!40081 (not b_next!24615))
