; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99244 () Bool)

(assert start!99244)

(declare-fun b_free!24613 () Bool)

(declare-fun b_next!24613 () Bool)

(assert (=> start!99244 (= b_free!24613 (not b_next!24613))))

(declare-fun tp!86550 () Bool)

(declare-fun b_and!40077 () Bool)

(assert (=> start!99244 (= tp!86550 b_and!40077)))

(declare-fun b!1164499 () Bool)

(declare-fun res!771967 () Bool)

(declare-fun e!662263 () Bool)

(assert (=> b!1164499 (=> (not res!771967) (not e!662263))))

(declare-datatypes ((array!75173 0))(
  ( (array!75174 (arr!36231 (Array (_ BitVec 32) (_ BitVec 64))) (size!36768 (_ BitVec 32))) )
))
(declare-fun lt!524457 () array!75173)

(declare-datatypes ((List!25412 0))(
  ( (Nil!25409) (Cons!25408 (h!26626 (_ BitVec 64)) (t!37009 List!25412)) )
))
(declare-fun arrayNoDuplicates!0 (array!75173 (_ BitVec 32) List!25412) Bool)

(assert (=> b!1164499 (= res!771967 (arrayNoDuplicates!0 lt!524457 #b00000000000000000000000000000000 Nil!25409))))

(declare-fun b!1164500 () Bool)

(declare-fun e!662252 () Bool)

(assert (=> b!1164500 (= e!662263 (not e!662252))))

(declare-fun res!771978 () Bool)

(assert (=> b!1164500 (=> res!771978 e!662252)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164500 (= res!771978 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!75173)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164500 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38364 0))(
  ( (Unit!38365) )
))
(declare-fun lt!524462 () Unit!38364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75173 (_ BitVec 64) (_ BitVec 32)) Unit!38364)

(assert (=> b!1164500 (= lt!524462 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164501 () Bool)

(declare-fun res!771979 () Bool)

(declare-fun e!662248 () Bool)

(assert (=> b!1164501 (=> (not res!771979) (not e!662248))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43985 0))(
  ( (V!43986 (val!14628 Int)) )
))
(declare-datatypes ((ValueCell!13862 0))(
  ( (ValueCellFull!13862 (v!17261 V!43985)) (EmptyCell!13862) )
))
(declare-datatypes ((array!75175 0))(
  ( (array!75176 (arr!36232 (Array (_ BitVec 32) ValueCell!13862)) (size!36769 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75175)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1164501 (= res!771979 (and (= (size!36769 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36768 _keys!1208) (size!36769 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164502 () Bool)

(assert (=> b!1164502 (= e!662248 e!662263)))

(declare-fun res!771976 () Bool)

(assert (=> b!1164502 (=> (not res!771976) (not e!662263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75173 (_ BitVec 32)) Bool)

(assert (=> b!1164502 (= res!771976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524457 mask!1564))))

(assert (=> b!1164502 (= lt!524457 (array!75174 (store (arr!36231 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36768 _keys!1208)))))

(declare-fun b!1164503 () Bool)

(declare-fun e!662247 () Unit!38364)

(declare-fun lt!524455 () Unit!38364)

(assert (=> b!1164503 (= e!662247 lt!524455)))

(declare-fun call!56968 () Unit!38364)

(assert (=> b!1164503 (= lt!524455 call!56968)))

(declare-fun call!56966 () Bool)

(assert (=> b!1164503 call!56966))

(declare-fun mapIsEmpty!45539 () Bool)

(declare-fun mapRes!45539 () Bool)

(assert (=> mapIsEmpty!45539 mapRes!45539))

(declare-fun b!1164504 () Bool)

(declare-fun e!662254 () Bool)

(assert (=> b!1164504 (= e!662252 e!662254)))

(declare-fun res!771969 () Bool)

(assert (=> b!1164504 (=> res!771969 e!662254)))

(assert (=> b!1164504 (= res!771969 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43985)

(declare-datatypes ((tuple2!18678 0))(
  ( (tuple2!18679 (_1!9350 (_ BitVec 64)) (_2!9350 V!43985)) )
))
(declare-datatypes ((List!25413 0))(
  ( (Nil!25410) (Cons!25409 (h!26627 tuple2!18678) (t!37010 List!25413)) )
))
(declare-datatypes ((ListLongMap!16655 0))(
  ( (ListLongMap!16656 (toList!8343 List!25413)) )
))
(declare-fun lt!524450 () ListLongMap!16655)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43985)

(declare-fun lt!524466 () array!75175)

(declare-fun getCurrentListMapNoExtraKeys!4834 (array!75173 array!75175 (_ BitVec 32) (_ BitVec 32) V!43985 V!43985 (_ BitVec 32) Int) ListLongMap!16655)

(assert (=> b!1164504 (= lt!524450 (getCurrentListMapNoExtraKeys!4834 lt!524457 lt!524466 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524446 () V!43985)

(assert (=> b!1164504 (= lt!524466 (array!75176 (store (arr!36232 _values!996) i!673 (ValueCellFull!13862 lt!524446)) (size!36769 _values!996)))))

(declare-fun dynLambda!2825 (Int (_ BitVec 64)) V!43985)

(assert (=> b!1164504 (= lt!524446 (dynLambda!2825 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!524447 () ListLongMap!16655)

(assert (=> b!1164504 (= lt!524447 (getCurrentListMapNoExtraKeys!4834 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164505 () Bool)

(declare-fun e!662260 () Bool)

(declare-fun call!56970 () ListLongMap!16655)

(declare-fun call!56964 () ListLongMap!16655)

(assert (=> b!1164505 (= e!662260 (= call!56970 call!56964))))

(declare-fun b!1164506 () Bool)

(declare-fun res!771971 () Bool)

(assert (=> b!1164506 (=> (not res!771971) (not e!662248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164506 (= res!771971 (validMask!0 mask!1564))))

(declare-fun b!1164507 () Bool)

(declare-fun e!662255 () Bool)

(declare-fun e!662261 () Bool)

(assert (=> b!1164507 (= e!662255 (and e!662261 mapRes!45539))))

(declare-fun condMapEmpty!45539 () Bool)

(declare-fun mapDefault!45539 () ValueCell!13862)

(assert (=> b!1164507 (= condMapEmpty!45539 (= (arr!36232 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13862)) mapDefault!45539)))))

(declare-fun b!1164508 () Bool)

(declare-fun e!662249 () Unit!38364)

(declare-fun Unit!38366 () Unit!38364)

(assert (=> b!1164508 (= e!662249 Unit!38366)))

(declare-fun bm!56960 () Bool)

(assert (=> bm!56960 (= call!56970 (getCurrentListMapNoExtraKeys!4834 lt!524457 lt!524466 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1164509 () Bool)

(declare-fun Unit!38367 () Unit!38364)

(assert (=> b!1164509 (= e!662249 Unit!38367)))

(declare-fun lt!524449 () Bool)

(assert (=> b!1164509 (= lt!524449 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116774 () Bool)

(assert (=> b!1164509 (= c!116774 (and (not lt!524449) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524459 () Unit!38364)

(declare-fun e!662257 () Unit!38364)

(assert (=> b!1164509 (= lt!524459 e!662257)))

(declare-fun lt!524463 () Unit!38364)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!558 (array!75173 array!75175 (_ BitVec 32) (_ BitVec 32) V!43985 V!43985 (_ BitVec 64) (_ BitVec 32) Int) Unit!38364)

(assert (=> b!1164509 (= lt!524463 (lemmaListMapContainsThenArrayContainsFrom!558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116776 () Bool)

(assert (=> b!1164509 (= c!116776 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771977 () Bool)

(declare-fun e!662253 () Bool)

(assert (=> b!1164509 (= res!771977 e!662253)))

(declare-fun e!662258 () Bool)

(assert (=> b!1164509 (=> (not res!771977) (not e!662258))))

(assert (=> b!1164509 e!662258))

(declare-fun lt!524460 () Unit!38364)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75173 (_ BitVec 32) (_ BitVec 32)) Unit!38364)

(assert (=> b!1164509 (= lt!524460 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1164509 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25409)))

(declare-fun lt!524454 () Unit!38364)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75173 (_ BitVec 64) (_ BitVec 32) List!25412) Unit!38364)

(assert (=> b!1164509 (= lt!524454 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25409))))

(assert (=> b!1164509 false))

(declare-fun call!56965 () ListLongMap!16655)

(declare-fun lt!524451 () ListLongMap!16655)

(declare-fun c!116773 () Bool)

(declare-fun bm!56961 () Bool)

(declare-fun +!3758 (ListLongMap!16655 tuple2!18678) ListLongMap!16655)

(assert (=> bm!56961 (= call!56965 (+!3758 lt!524451 (ite (or c!116774 c!116773) (tuple2!18679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1164510 () Bool)

(declare-fun res!771970 () Bool)

(assert (=> b!1164510 (=> (not res!771970) (not e!662248))))

(assert (=> b!1164510 (= res!771970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!524452 () ListLongMap!16655)

(declare-fun b!1164511 () Bool)

(declare-fun e!662251 () Bool)

(assert (=> b!1164511 (= e!662251 (= lt!524452 (getCurrentListMapNoExtraKeys!4834 lt!524457 lt!524466 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1164512 () Bool)

(assert (=> b!1164512 (= e!662253 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!524449) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1164513 () Bool)

(declare-fun e!662256 () Bool)

(declare-fun tp_is_empty!29143 () Bool)

(assert (=> b!1164513 (= e!662256 tp_is_empty!29143)))

(declare-fun b!1164514 () Bool)

(declare-fun e!662262 () Unit!38364)

(assert (=> b!1164514 (= e!662247 e!662262)))

(declare-fun c!116778 () Bool)

(assert (=> b!1164514 (= c!116778 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!524449))))

(declare-fun b!1164515 () Bool)

(declare-fun Unit!38368 () Unit!38364)

(assert (=> b!1164515 (= e!662262 Unit!38368)))

(declare-fun bm!56962 () Bool)

(declare-fun call!56969 () Bool)

(assert (=> bm!56962 (= call!56966 call!56969)))

(declare-fun bm!56963 () Bool)

(declare-fun call!56967 () ListLongMap!16655)

(assert (=> bm!56963 (= call!56967 call!56965)))

(declare-fun b!1164516 () Bool)

(declare-fun res!771975 () Bool)

(assert (=> b!1164516 (=> (not res!771975) (not e!662248))))

(assert (=> b!1164516 (= res!771975 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25409))))

(declare-fun b!1164517 () Bool)

(declare-fun -!1437 (ListLongMap!16655 (_ BitVec 64)) ListLongMap!16655)

(assert (=> b!1164517 (= e!662260 (= call!56970 (-!1437 call!56964 k0!934)))))

(declare-fun mapNonEmpty!45539 () Bool)

(declare-fun tp!86549 () Bool)

(assert (=> mapNonEmpty!45539 (= mapRes!45539 (and tp!86549 e!662256))))

(declare-fun mapRest!45539 () (Array (_ BitVec 32) ValueCell!13862))

(declare-fun mapKey!45539 () (_ BitVec 32))

(declare-fun mapValue!45539 () ValueCell!13862)

(assert (=> mapNonEmpty!45539 (= (arr!36232 _values!996) (store mapRest!45539 mapKey!45539 mapValue!45539))))

(declare-fun b!1164518 () Bool)

(declare-fun lt!524467 () ListLongMap!16655)

(declare-fun contains!6859 (ListLongMap!16655 (_ BitVec 64)) Bool)

(assert (=> b!1164518 (contains!6859 (+!3758 lt!524467 (tuple2!18679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!524461 () Unit!38364)

(declare-fun call!56963 () Unit!38364)

(assert (=> b!1164518 (= lt!524461 call!56963)))

(assert (=> b!1164518 call!56969))

(assert (=> b!1164518 (= lt!524467 call!56965)))

(declare-fun lt!524453 () Unit!38364)

(declare-fun addStillContains!977 (ListLongMap!16655 (_ BitVec 64) V!43985 (_ BitVec 64)) Unit!38364)

(assert (=> b!1164518 (= lt!524453 (addStillContains!977 lt!524451 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1164518 (= e!662257 lt!524461)))

(declare-fun b!1164519 () Bool)

(assert (=> b!1164519 (= e!662253 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1164520 () Bool)

(declare-fun res!771973 () Bool)

(assert (=> b!1164520 (=> (not res!771973) (not e!662248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164520 (= res!771973 (validKeyInArray!0 k0!934))))

(declare-fun b!1164521 () Bool)

(assert (=> b!1164521 (= e!662258 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1164522 () Bool)

(declare-fun e!662259 () Bool)

(assert (=> b!1164522 (= e!662254 e!662259)))

(declare-fun res!771972 () Bool)

(assert (=> b!1164522 (=> res!771972 e!662259)))

(assert (=> b!1164522 (= res!771972 (not (= (select (arr!36231 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1164522 e!662260))

(declare-fun c!116775 () Bool)

(assert (=> b!1164522 (= c!116775 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!524458 () Unit!38364)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!663 (array!75173 array!75175 (_ BitVec 32) (_ BitVec 32) V!43985 V!43985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38364)

(assert (=> b!1164522 (= lt!524458 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!663 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1164523 () Bool)

(declare-fun res!771981 () Bool)

(assert (=> b!1164523 (=> (not res!771981) (not e!662248))))

(assert (=> b!1164523 (= res!771981 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36768 _keys!1208))))))

(declare-fun b!1164524 () Bool)

(assert (=> b!1164524 (= e!662259 true)))

(assert (=> b!1164524 e!662251))

(declare-fun res!771974 () Bool)

(assert (=> b!1164524 (=> (not res!771974) (not e!662251))))

(assert (=> b!1164524 (= res!771974 (= lt!524452 lt!524451))))

(assert (=> b!1164524 (= lt!524452 (-!1437 lt!524447 k0!934))))

(declare-fun lt!524464 () V!43985)

(assert (=> b!1164524 (= (-!1437 (+!3758 lt!524451 (tuple2!18679 (select (arr!36231 _keys!1208) from!1455) lt!524464)) (select (arr!36231 _keys!1208) from!1455)) lt!524451)))

(declare-fun lt!524456 () Unit!38364)

(declare-fun addThenRemoveForNewKeyIsSame!264 (ListLongMap!16655 (_ BitVec 64) V!43985) Unit!38364)

(assert (=> b!1164524 (= lt!524456 (addThenRemoveForNewKeyIsSame!264 lt!524451 (select (arr!36231 _keys!1208) from!1455) lt!524464))))

(declare-fun get!18513 (ValueCell!13862 V!43985) V!43985)

(assert (=> b!1164524 (= lt!524464 (get!18513 (select (arr!36232 _values!996) from!1455) lt!524446))))

(declare-fun lt!524448 () Unit!38364)

(assert (=> b!1164524 (= lt!524448 e!662249)))

(declare-fun c!116777 () Bool)

(assert (=> b!1164524 (= c!116777 (contains!6859 lt!524451 k0!934))))

(assert (=> b!1164524 (= lt!524451 (getCurrentListMapNoExtraKeys!4834 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1164525 () Bool)

(declare-fun res!771980 () Bool)

(assert (=> b!1164525 (=> (not res!771980) (not e!662248))))

(assert (=> b!1164525 (= res!771980 (= (select (arr!36231 _keys!1208) i!673) k0!934))))

(declare-fun bm!56964 () Bool)

(assert (=> bm!56964 (= call!56968 call!56963)))

(declare-fun bm!56965 () Bool)

(assert (=> bm!56965 (= call!56969 (contains!6859 (ite c!116774 lt!524467 call!56967) k0!934))))

(declare-fun bm!56966 () Bool)

(assert (=> bm!56966 (= call!56964 (getCurrentListMapNoExtraKeys!4834 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1164526 () Bool)

(assert (=> b!1164526 (= c!116773 (and (not lt!524449) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1164526 (= e!662257 e!662247)))

(declare-fun b!1164527 () Bool)

(assert (=> b!1164527 call!56966))

(declare-fun lt!524465 () Unit!38364)

(assert (=> b!1164527 (= lt!524465 call!56968)))

(assert (=> b!1164527 (= e!662262 lt!524465)))

(declare-fun bm!56967 () Bool)

(assert (=> bm!56967 (= call!56963 (addStillContains!977 (ite c!116774 lt!524467 lt!524451) (ite c!116774 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116773 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116774 minValue!944 (ite c!116773 zeroValue!944 minValue!944)) k0!934))))

(declare-fun res!771968 () Bool)

(assert (=> start!99244 (=> (not res!771968) (not e!662248))))

(assert (=> start!99244 (= res!771968 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36768 _keys!1208))))))

(assert (=> start!99244 e!662248))

(assert (=> start!99244 tp_is_empty!29143))

(declare-fun array_inv!27784 (array!75173) Bool)

(assert (=> start!99244 (array_inv!27784 _keys!1208)))

(assert (=> start!99244 true))

(assert (=> start!99244 tp!86550))

(declare-fun array_inv!27785 (array!75175) Bool)

(assert (=> start!99244 (and (array_inv!27785 _values!996) e!662255)))

(declare-fun b!1164528 () Bool)

(assert (=> b!1164528 (= e!662261 tp_is_empty!29143)))

(assert (= (and start!99244 res!771968) b!1164506))

(assert (= (and b!1164506 res!771971) b!1164501))

(assert (= (and b!1164501 res!771979) b!1164510))

(assert (= (and b!1164510 res!771970) b!1164516))

(assert (= (and b!1164516 res!771975) b!1164523))

(assert (= (and b!1164523 res!771981) b!1164520))

(assert (= (and b!1164520 res!771973) b!1164525))

(assert (= (and b!1164525 res!771980) b!1164502))

(assert (= (and b!1164502 res!771976) b!1164499))

(assert (= (and b!1164499 res!771967) b!1164500))

(assert (= (and b!1164500 (not res!771978)) b!1164504))

(assert (= (and b!1164504 (not res!771969)) b!1164522))

(assert (= (and b!1164522 c!116775) b!1164517))

(assert (= (and b!1164522 (not c!116775)) b!1164505))

(assert (= (or b!1164517 b!1164505) bm!56966))

(assert (= (or b!1164517 b!1164505) bm!56960))

(assert (= (and b!1164522 (not res!771972)) b!1164524))

(assert (= (and b!1164524 c!116777) b!1164509))

(assert (= (and b!1164524 (not c!116777)) b!1164508))

(assert (= (and b!1164509 c!116774) b!1164518))

(assert (= (and b!1164509 (not c!116774)) b!1164526))

(assert (= (and b!1164526 c!116773) b!1164503))

(assert (= (and b!1164526 (not c!116773)) b!1164514))

(assert (= (and b!1164514 c!116778) b!1164527))

(assert (= (and b!1164514 (not c!116778)) b!1164515))

(assert (= (or b!1164503 b!1164527) bm!56964))

(assert (= (or b!1164503 b!1164527) bm!56963))

(assert (= (or b!1164503 b!1164527) bm!56962))

(assert (= (or b!1164518 bm!56962) bm!56965))

(assert (= (or b!1164518 bm!56964) bm!56967))

(assert (= (or b!1164518 bm!56963) bm!56961))

(assert (= (and b!1164509 c!116776) b!1164519))

(assert (= (and b!1164509 (not c!116776)) b!1164512))

(assert (= (and b!1164509 res!771977) b!1164521))

(assert (= (and b!1164524 res!771974) b!1164511))

(assert (= (and b!1164507 condMapEmpty!45539) mapIsEmpty!45539))

(assert (= (and b!1164507 (not condMapEmpty!45539)) mapNonEmpty!45539))

(get-info :version)

(assert (= (and mapNonEmpty!45539 ((_ is ValueCellFull!13862) mapValue!45539)) b!1164513))

(assert (= (and b!1164507 ((_ is ValueCellFull!13862) mapDefault!45539)) b!1164528))

(assert (= start!99244 b!1164507))

(declare-fun b_lambda!19713 () Bool)

(assert (=> (not b_lambda!19713) (not b!1164504)))

(declare-fun t!37008 () Bool)

(declare-fun tb!9417 () Bool)

(assert (=> (and start!99244 (= defaultEntry!1004 defaultEntry!1004) t!37008) tb!9417))

(declare-fun result!19407 () Bool)

(assert (=> tb!9417 (= result!19407 tp_is_empty!29143)))

(assert (=> b!1164504 t!37008))

(declare-fun b_and!40079 () Bool)

(assert (= b_and!40077 (and (=> t!37008 result!19407) b_and!40079)))

(declare-fun m!1073381 () Bool)

(assert (=> b!1164516 m!1073381))

(declare-fun m!1073383 () Bool)

(assert (=> bm!56967 m!1073383))

(declare-fun m!1073385 () Bool)

(assert (=> b!1164521 m!1073385))

(declare-fun m!1073387 () Bool)

(assert (=> b!1164506 m!1073387))

(declare-fun m!1073389 () Bool)

(assert (=> b!1164518 m!1073389))

(assert (=> b!1164518 m!1073389))

(declare-fun m!1073391 () Bool)

(assert (=> b!1164518 m!1073391))

(declare-fun m!1073393 () Bool)

(assert (=> b!1164518 m!1073393))

(declare-fun m!1073395 () Bool)

(assert (=> b!1164517 m!1073395))

(declare-fun m!1073397 () Bool)

(assert (=> b!1164524 m!1073397))

(declare-fun m!1073399 () Bool)

(assert (=> b!1164524 m!1073399))

(declare-fun m!1073401 () Bool)

(assert (=> b!1164524 m!1073401))

(declare-fun m!1073403 () Bool)

(assert (=> b!1164524 m!1073403))

(declare-fun m!1073405 () Bool)

(assert (=> b!1164524 m!1073405))

(assert (=> b!1164524 m!1073401))

(declare-fun m!1073407 () Bool)

(assert (=> b!1164524 m!1073407))

(declare-fun m!1073409 () Bool)

(assert (=> b!1164524 m!1073409))

(assert (=> b!1164524 m!1073401))

(declare-fun m!1073411 () Bool)

(assert (=> b!1164524 m!1073411))

(declare-fun m!1073413 () Bool)

(assert (=> b!1164524 m!1073413))

(assert (=> b!1164524 m!1073397))

(assert (=> b!1164524 m!1073405))

(assert (=> bm!56966 m!1073411))

(declare-fun m!1073415 () Bool)

(assert (=> mapNonEmpty!45539 m!1073415))

(declare-fun m!1073417 () Bool)

(assert (=> b!1164525 m!1073417))

(declare-fun m!1073419 () Bool)

(assert (=> b!1164500 m!1073419))

(declare-fun m!1073421 () Bool)

(assert (=> b!1164500 m!1073421))

(declare-fun m!1073423 () Bool)

(assert (=> b!1164509 m!1073423))

(declare-fun m!1073425 () Bool)

(assert (=> b!1164509 m!1073425))

(declare-fun m!1073427 () Bool)

(assert (=> b!1164509 m!1073427))

(declare-fun m!1073429 () Bool)

(assert (=> b!1164509 m!1073429))

(declare-fun m!1073431 () Bool)

(assert (=> start!99244 m!1073431))

(declare-fun m!1073433 () Bool)

(assert (=> start!99244 m!1073433))

(declare-fun m!1073435 () Bool)

(assert (=> bm!56961 m!1073435))

(declare-fun m!1073437 () Bool)

(assert (=> bm!56960 m!1073437))

(declare-fun m!1073439 () Bool)

(assert (=> b!1164520 m!1073439))

(declare-fun m!1073441 () Bool)

(assert (=> bm!56965 m!1073441))

(assert (=> b!1164511 m!1073437))

(assert (=> b!1164519 m!1073385))

(declare-fun m!1073443 () Bool)

(assert (=> b!1164504 m!1073443))

(declare-fun m!1073445 () Bool)

(assert (=> b!1164504 m!1073445))

(declare-fun m!1073447 () Bool)

(assert (=> b!1164504 m!1073447))

(declare-fun m!1073449 () Bool)

(assert (=> b!1164504 m!1073449))

(declare-fun m!1073451 () Bool)

(assert (=> b!1164502 m!1073451))

(declare-fun m!1073453 () Bool)

(assert (=> b!1164502 m!1073453))

(declare-fun m!1073455 () Bool)

(assert (=> b!1164499 m!1073455))

(assert (=> b!1164522 m!1073401))

(declare-fun m!1073457 () Bool)

(assert (=> b!1164522 m!1073457))

(declare-fun m!1073459 () Bool)

(assert (=> b!1164510 m!1073459))

(check-sat (not bm!56961) (not b_next!24613) (not b!1164519) (not b!1164520) (not bm!56966) (not b!1164522) (not b!1164509) (not b!1164516) (not start!99244) (not b!1164500) (not b!1164510) (not b_lambda!19713) (not bm!56967) (not b!1164511) (not b!1164517) b_and!40079 (not b!1164499) (not b!1164504) (not mapNonEmpty!45539) (not b!1164524) (not b!1164502) (not bm!56965) tp_is_empty!29143 (not bm!56960) (not b!1164506) (not b!1164521) (not b!1164518))
(check-sat b_and!40079 (not b_next!24613))
