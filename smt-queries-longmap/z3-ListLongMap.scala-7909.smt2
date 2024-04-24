; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98434 () Bool)

(assert start!98434)

(declare-fun b_free!23899 () Bool)

(declare-fun b_next!23899 () Bool)

(assert (=> start!98434 (= b_free!23899 (not b_next!23899))))

(declare-fun tp!84400 () Bool)

(declare-fun b_and!38591 () Bool)

(assert (=> start!98434 (= tp!84400 b_and!38591)))

(declare-fun mapIsEmpty!44461 () Bool)

(declare-fun mapRes!44461 () Bool)

(assert (=> mapIsEmpty!44461 mapRes!44461))

(declare-fun bm!48325 () Bool)

(declare-fun call!48332 () Bool)

(declare-fun call!48331 () Bool)

(assert (=> bm!48325 (= call!48332 call!48331)))

(declare-datatypes ((V!43033 0))(
  ( (V!43034 (val!14271 Int)) )
))
(declare-fun zeroValue!944 () V!43033)

(declare-fun c!110391 () Bool)

(declare-fun bm!48326 () Bool)

(declare-datatypes ((Unit!37002 0))(
  ( (Unit!37003) )
))
(declare-fun call!48335 () Unit!37002)

(declare-datatypes ((tuple2!17990 0))(
  ( (tuple2!17991 (_1!9006 (_ BitVec 64)) (_2!9006 V!43033)) )
))
(declare-datatypes ((List!24768 0))(
  ( (Nil!24765) (Cons!24764 (h!25982 tuple2!17990) (t!35651 List!24768)) )
))
(declare-datatypes ((ListLongMap!15967 0))(
  ( (ListLongMap!15968 (toList!7999 List!24768)) )
))
(declare-fun lt!502350 () ListLongMap!15967)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!502346 () ListLongMap!15967)

(declare-fun c!110392 () Bool)

(declare-fun minValue!944 () V!43033)

(declare-fun addStillContains!692 (ListLongMap!15967 (_ BitVec 64) V!43033 (_ BitVec 64)) Unit!37002)

(assert (=> bm!48326 (= call!48335 (addStillContains!692 (ite c!110392 lt!502350 lt!502346) (ite c!110392 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110391 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110392 minValue!944 (ite c!110391 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1131483 () Bool)

(declare-fun e!644051 () Bool)

(declare-fun e!644041 () Bool)

(assert (=> b!1131483 (= e!644051 e!644041)))

(declare-fun res!755674 () Bool)

(assert (=> b!1131483 (=> res!755674 e!644041)))

(declare-datatypes ((array!73761 0))(
  ( (array!73762 (arr!35527 (Array (_ BitVec 32) (_ BitVec 64))) (size!36064 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73761)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1131483 (= res!755674 (not (= (select (arr!35527 _keys!1208) from!1455) k0!934)))))

(declare-fun e!644039 () Bool)

(assert (=> b!1131483 e!644039))

(declare-fun c!110390 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131483 (= c!110390 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13505 0))(
  ( (ValueCellFull!13505 (v!16900 V!43033)) (EmptyCell!13505) )
))
(declare-datatypes ((array!73763 0))(
  ( (array!73764 (arr!35528 (Array (_ BitVec 32) ValueCell!13505)) (size!36065 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73763)

(declare-fun lt!502354 () Unit!37002)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!421 (array!73761 array!73763 (_ BitVec 32) (_ BitVec 32) V!43033 V!43033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37002)

(assert (=> b!1131483 (= lt!502354 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48327 () Bool)

(declare-fun call!48329 () ListLongMap!15967)

(declare-fun getCurrentListMapNoExtraKeys!4518 (array!73761 array!73763 (_ BitVec 32) (_ BitVec 32) V!43033 V!43033 (_ BitVec 32) Int) ListLongMap!15967)

(assert (=> bm!48327 (= call!48329 (getCurrentListMapNoExtraKeys!4518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131484 () Bool)

(declare-fun res!755666 () Bool)

(declare-fun e!644043 () Bool)

(assert (=> b!1131484 (=> (not res!755666) (not e!644043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131484 (= res!755666 (validMask!0 mask!1564))))

(declare-fun b!1131485 () Bool)

(declare-fun e!644052 () Bool)

(declare-fun e!644048 () Bool)

(assert (=> b!1131485 (= e!644052 (not e!644048))))

(declare-fun res!755671 () Bool)

(assert (=> b!1131485 (=> res!755671 e!644048)))

(assert (=> b!1131485 (= res!755671 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131485 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502351 () Unit!37002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73761 (_ BitVec 64) (_ BitVec 32)) Unit!37002)

(assert (=> b!1131485 (= lt!502351 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun call!48330 () ListLongMap!15967)

(declare-fun bm!48328 () Bool)

(declare-fun +!3466 (ListLongMap!15967 tuple2!17990) ListLongMap!15967)

(assert (=> bm!48328 (= call!48330 (+!3466 (ite c!110392 lt!502350 lt!502346) (ite c!110392 (tuple2!17991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110391 (tuple2!17991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!48329 () Bool)

(declare-fun call!48334 () Unit!37002)

(assert (=> bm!48329 (= call!48334 call!48335)))

(declare-fun b!1131486 () Bool)

(declare-fun e!644038 () Bool)

(declare-fun tp_is_empty!28429 () Bool)

(assert (=> b!1131486 (= e!644038 tp_is_empty!28429)))

(declare-fun b!1131487 () Bool)

(declare-fun res!755678 () Bool)

(assert (=> b!1131487 (=> (not res!755678) (not e!644043))))

(declare-datatypes ((List!24769 0))(
  ( (Nil!24766) (Cons!24765 (h!25983 (_ BitVec 64)) (t!35652 List!24769)) )
))
(declare-fun arrayNoDuplicates!0 (array!73761 (_ BitVec 32) List!24769) Bool)

(assert (=> b!1131487 (= res!755678 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24766))))

(declare-fun b!1131488 () Bool)

(declare-fun call!48328 () ListLongMap!15967)

(declare-fun -!1162 (ListLongMap!15967 (_ BitVec 64)) ListLongMap!15967)

(assert (=> b!1131488 (= e!644039 (= call!48328 (-!1162 call!48329 k0!934)))))

(declare-fun b!1131489 () Bool)

(assert (=> b!1131489 (= e!644043 e!644052)))

(declare-fun res!755679 () Bool)

(assert (=> b!1131489 (=> (not res!755679) (not e!644052))))

(declare-fun lt!502347 () array!73761)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73761 (_ BitVec 32)) Bool)

(assert (=> b!1131489 (= res!755679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502347 mask!1564))))

(assert (=> b!1131489 (= lt!502347 (array!73762 (store (arr!35527 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36064 _keys!1208)))))

(declare-fun b!1131490 () Bool)

(declare-fun c!110393 () Bool)

(declare-fun lt!502352 () Bool)

(assert (=> b!1131490 (= c!110393 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502352))))

(declare-fun e!644042 () Unit!37002)

(declare-fun e!644050 () Unit!37002)

(assert (=> b!1131490 (= e!644042 e!644050)))

(declare-fun b!1131491 () Bool)

(declare-fun e!644045 () Bool)

(assert (=> b!1131491 (= e!644045 true)))

(declare-fun lt!502344 () Bool)

(declare-fun contains!6534 (ListLongMap!15967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4430 (array!73761 array!73763 (_ BitVec 32) (_ BitVec 32) V!43033 V!43033 (_ BitVec 32) Int) ListLongMap!15967)

(assert (=> b!1131491 (= lt!502344 (contains!6534 (getCurrentListMap!4430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1131492 () Bool)

(declare-fun res!755669 () Bool)

(assert (=> b!1131492 (=> (not res!755669) (not e!644043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131492 (= res!755669 (validKeyInArray!0 k0!934))))

(declare-fun b!1131493 () Bool)

(declare-fun res!755673 () Bool)

(assert (=> b!1131493 (=> (not res!755673) (not e!644043))))

(assert (=> b!1131493 (= res!755673 (= (select (arr!35527 _keys!1208) i!673) k0!934))))

(declare-fun bm!48330 () Bool)

(declare-fun call!48333 () ListLongMap!15967)

(assert (=> bm!48330 (= call!48333 call!48330)))

(declare-fun res!755670 () Bool)

(assert (=> start!98434 (=> (not res!755670) (not e!644043))))

(assert (=> start!98434 (= res!755670 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36064 _keys!1208))))))

(assert (=> start!98434 e!644043))

(assert (=> start!98434 tp_is_empty!28429))

(declare-fun array_inv!27312 (array!73761) Bool)

(assert (=> start!98434 (array_inv!27312 _keys!1208)))

(assert (=> start!98434 true))

(assert (=> start!98434 tp!84400))

(declare-fun e!644046 () Bool)

(declare-fun array_inv!27313 (array!73763) Bool)

(assert (=> start!98434 (and (array_inv!27313 _values!996) e!644046)))

(declare-fun b!1131494 () Bool)

(declare-fun res!755667 () Bool)

(assert (=> b!1131494 (=> (not res!755667) (not e!644043))))

(assert (=> b!1131494 (= res!755667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1131495 () Bool)

(declare-fun res!755668 () Bool)

(assert (=> b!1131495 (=> (not res!755668) (not e!644043))))

(assert (=> b!1131495 (= res!755668 (and (= (size!36065 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36064 _keys!1208) (size!36065 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1131496 () Bool)

(assert (=> b!1131496 (= e!644039 (= call!48328 call!48329))))

(declare-fun mapNonEmpty!44461 () Bool)

(declare-fun tp!84401 () Bool)

(declare-fun e!644047 () Bool)

(assert (=> mapNonEmpty!44461 (= mapRes!44461 (and tp!84401 e!644047))))

(declare-fun mapKey!44461 () (_ BitVec 32))

(declare-fun mapRest!44461 () (Array (_ BitVec 32) ValueCell!13505))

(declare-fun mapValue!44461 () ValueCell!13505)

(assert (=> mapNonEmpty!44461 (= (arr!35528 _values!996) (store mapRest!44461 mapKey!44461 mapValue!44461))))

(declare-fun b!1131497 () Bool)

(declare-fun res!755672 () Bool)

(assert (=> b!1131497 (=> (not res!755672) (not e!644052))))

(assert (=> b!1131497 (= res!755672 (arrayNoDuplicates!0 lt!502347 #b00000000000000000000000000000000 Nil!24766))))

(declare-fun b!1131498 () Bool)

(assert (=> b!1131498 (= e!644047 tp_is_empty!28429)))

(declare-fun b!1131499 () Bool)

(declare-fun e!644049 () Unit!37002)

(declare-fun lt!502349 () Unit!37002)

(assert (=> b!1131499 (= e!644049 lt!502349)))

(declare-fun lt!502355 () Unit!37002)

(assert (=> b!1131499 (= lt!502355 (addStillContains!692 lt!502346 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1131499 (= lt!502350 (+!3466 lt!502346 (tuple2!17991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1131499 call!48331))

(assert (=> b!1131499 (= lt!502349 call!48335)))

(assert (=> b!1131499 (contains!6534 call!48330 k0!934)))

(declare-fun b!1131500 () Bool)

(assert (=> b!1131500 call!48332))

(declare-fun lt!502345 () Unit!37002)

(assert (=> b!1131500 (= lt!502345 call!48334)))

(assert (=> b!1131500 (= e!644042 lt!502345)))

(declare-fun bm!48331 () Bool)

(declare-fun lt!502353 () array!73763)

(assert (=> bm!48331 (= call!48328 (getCurrentListMapNoExtraKeys!4518 lt!502347 lt!502353 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131501 () Bool)

(declare-fun res!755677 () Bool)

(assert (=> b!1131501 (=> (not res!755677) (not e!644043))))

(assert (=> b!1131501 (= res!755677 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36064 _keys!1208))))))

(declare-fun b!1131502 () Bool)

(assert (=> b!1131502 (= e!644049 e!644042)))

(assert (=> b!1131502 (= c!110391 (and (not lt!502352) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!48332 () Bool)

(assert (=> bm!48332 (= call!48331 (contains!6534 (ite c!110392 lt!502350 call!48333) k0!934))))

(declare-fun b!1131503 () Bool)

(assert (=> b!1131503 (= e!644048 e!644051)))

(declare-fun res!755676 () Bool)

(assert (=> b!1131503 (=> res!755676 e!644051)))

(assert (=> b!1131503 (= res!755676 (not (= from!1455 i!673)))))

(declare-fun lt!502357 () ListLongMap!15967)

(assert (=> b!1131503 (= lt!502357 (getCurrentListMapNoExtraKeys!4518 lt!502347 lt!502353 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2579 (Int (_ BitVec 64)) V!43033)

(assert (=> b!1131503 (= lt!502353 (array!73764 (store (arr!35528 _values!996) i!673 (ValueCellFull!13505 (dynLambda!2579 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36065 _values!996)))))

(declare-fun lt!502348 () ListLongMap!15967)

(assert (=> b!1131503 (= lt!502348 (getCurrentListMapNoExtraKeys!4518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1131504 () Bool)

(declare-fun e!644040 () Bool)

(assert (=> b!1131504 (= e!644040 e!644045)))

(declare-fun res!755680 () Bool)

(assert (=> b!1131504 (=> res!755680 e!644045)))

(assert (=> b!1131504 (= res!755680 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36064 _keys!1208))))))

(declare-fun lt!502356 () Unit!37002)

(assert (=> b!1131504 (= lt!502356 e!644049)))

(assert (=> b!1131504 (= c!110392 (and (not lt!502352) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131504 (= lt!502352 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1131505 () Bool)

(assert (=> b!1131505 (= e!644041 e!644040)))

(declare-fun res!755675 () Bool)

(assert (=> b!1131505 (=> res!755675 e!644040)))

(assert (=> b!1131505 (= res!755675 (not (contains!6534 lt!502346 k0!934)))))

(assert (=> b!1131505 (= lt!502346 (getCurrentListMapNoExtraKeys!4518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131506 () Bool)

(assert (=> b!1131506 (= e!644046 (and e!644038 mapRes!44461))))

(declare-fun condMapEmpty!44461 () Bool)

(declare-fun mapDefault!44461 () ValueCell!13505)

(assert (=> b!1131506 (= condMapEmpty!44461 (= (arr!35528 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13505)) mapDefault!44461)))))

(declare-fun b!1131507 () Bool)

(declare-fun lt!502343 () Unit!37002)

(assert (=> b!1131507 (= e!644050 lt!502343)))

(assert (=> b!1131507 (= lt!502343 call!48334)))

(assert (=> b!1131507 call!48332))

(declare-fun b!1131508 () Bool)

(declare-fun Unit!37004 () Unit!37002)

(assert (=> b!1131508 (= e!644050 Unit!37004)))

(assert (= (and start!98434 res!755670) b!1131484))

(assert (= (and b!1131484 res!755666) b!1131495))

(assert (= (and b!1131495 res!755668) b!1131494))

(assert (= (and b!1131494 res!755667) b!1131487))

(assert (= (and b!1131487 res!755678) b!1131501))

(assert (= (and b!1131501 res!755677) b!1131492))

(assert (= (and b!1131492 res!755669) b!1131493))

(assert (= (and b!1131493 res!755673) b!1131489))

(assert (= (and b!1131489 res!755679) b!1131497))

(assert (= (and b!1131497 res!755672) b!1131485))

(assert (= (and b!1131485 (not res!755671)) b!1131503))

(assert (= (and b!1131503 (not res!755676)) b!1131483))

(assert (= (and b!1131483 c!110390) b!1131488))

(assert (= (and b!1131483 (not c!110390)) b!1131496))

(assert (= (or b!1131488 b!1131496) bm!48331))

(assert (= (or b!1131488 b!1131496) bm!48327))

(assert (= (and b!1131483 (not res!755674)) b!1131505))

(assert (= (and b!1131505 (not res!755675)) b!1131504))

(assert (= (and b!1131504 c!110392) b!1131499))

(assert (= (and b!1131504 (not c!110392)) b!1131502))

(assert (= (and b!1131502 c!110391) b!1131500))

(assert (= (and b!1131502 (not c!110391)) b!1131490))

(assert (= (and b!1131490 c!110393) b!1131507))

(assert (= (and b!1131490 (not c!110393)) b!1131508))

(assert (= (or b!1131500 b!1131507) bm!48329))

(assert (= (or b!1131500 b!1131507) bm!48330))

(assert (= (or b!1131500 b!1131507) bm!48325))

(assert (= (or b!1131499 bm!48325) bm!48332))

(assert (= (or b!1131499 bm!48329) bm!48326))

(assert (= (or b!1131499 bm!48330) bm!48328))

(assert (= (and b!1131504 (not res!755680)) b!1131491))

(assert (= (and b!1131506 condMapEmpty!44461) mapIsEmpty!44461))

(assert (= (and b!1131506 (not condMapEmpty!44461)) mapNonEmpty!44461))

(get-info :version)

(assert (= (and mapNonEmpty!44461 ((_ is ValueCellFull!13505) mapValue!44461)) b!1131498))

(assert (= (and b!1131506 ((_ is ValueCellFull!13505) mapDefault!44461)) b!1131486))

(assert (= start!98434 b!1131506))

(declare-fun b_lambda!18879 () Bool)

(assert (=> (not b_lambda!18879) (not b!1131503)))

(declare-fun t!35650 () Bool)

(declare-fun tb!8703 () Bool)

(assert (=> (and start!98434 (= defaultEntry!1004 defaultEntry!1004) t!35650) tb!8703))

(declare-fun result!17975 () Bool)

(assert (=> tb!8703 (= result!17975 tp_is_empty!28429)))

(assert (=> b!1131503 t!35650))

(declare-fun b_and!38593 () Bool)

(assert (= b_and!38591 (and (=> t!35650 result!17975) b_and!38593)))

(declare-fun m!1045053 () Bool)

(assert (=> bm!48331 m!1045053))

(declare-fun m!1045055 () Bool)

(assert (=> b!1131491 m!1045055))

(assert (=> b!1131491 m!1045055))

(declare-fun m!1045057 () Bool)

(assert (=> b!1131491 m!1045057))

(declare-fun m!1045059 () Bool)

(assert (=> b!1131488 m!1045059))

(declare-fun m!1045061 () Bool)

(assert (=> b!1131499 m!1045061))

(declare-fun m!1045063 () Bool)

(assert (=> b!1131499 m!1045063))

(declare-fun m!1045065 () Bool)

(assert (=> b!1131499 m!1045065))

(declare-fun m!1045067 () Bool)

(assert (=> bm!48332 m!1045067))

(declare-fun m!1045069 () Bool)

(assert (=> mapNonEmpty!44461 m!1045069))

(declare-fun m!1045071 () Bool)

(assert (=> bm!48327 m!1045071))

(declare-fun m!1045073 () Bool)

(assert (=> start!98434 m!1045073))

(declare-fun m!1045075 () Bool)

(assert (=> start!98434 m!1045075))

(declare-fun m!1045077 () Bool)

(assert (=> b!1131485 m!1045077))

(declare-fun m!1045079 () Bool)

(assert (=> b!1131485 m!1045079))

(declare-fun m!1045081 () Bool)

(assert (=> b!1131503 m!1045081))

(declare-fun m!1045083 () Bool)

(assert (=> b!1131503 m!1045083))

(declare-fun m!1045085 () Bool)

(assert (=> b!1131503 m!1045085))

(declare-fun m!1045087 () Bool)

(assert (=> b!1131503 m!1045087))

(declare-fun m!1045089 () Bool)

(assert (=> b!1131493 m!1045089))

(declare-fun m!1045091 () Bool)

(assert (=> b!1131497 m!1045091))

(declare-fun m!1045093 () Bool)

(assert (=> b!1131505 m!1045093))

(assert (=> b!1131505 m!1045071))

(declare-fun m!1045095 () Bool)

(assert (=> bm!48328 m!1045095))

(declare-fun m!1045097 () Bool)

(assert (=> b!1131484 m!1045097))

(declare-fun m!1045099 () Bool)

(assert (=> b!1131489 m!1045099))

(declare-fun m!1045101 () Bool)

(assert (=> b!1131489 m!1045101))

(declare-fun m!1045103 () Bool)

(assert (=> b!1131487 m!1045103))

(declare-fun m!1045105 () Bool)

(assert (=> bm!48326 m!1045105))

(declare-fun m!1045107 () Bool)

(assert (=> b!1131492 m!1045107))

(declare-fun m!1045109 () Bool)

(assert (=> b!1131483 m!1045109))

(declare-fun m!1045111 () Bool)

(assert (=> b!1131483 m!1045111))

(declare-fun m!1045113 () Bool)

(assert (=> b!1131494 m!1045113))

(check-sat (not bm!48331) (not b!1131488) (not b!1131505) (not b!1131489) tp_is_empty!28429 (not b!1131503) (not start!98434) (not b!1131483) (not bm!48326) (not bm!48328) (not bm!48327) (not b!1131484) (not b!1131487) (not b_next!23899) (not b!1131497) (not bm!48332) b_and!38593 (not b!1131494) (not b!1131492) (not mapNonEmpty!44461) (not b!1131485) (not b!1131491) (not b!1131499) (not b_lambda!18879))
(check-sat b_and!38593 (not b_next!23899))
