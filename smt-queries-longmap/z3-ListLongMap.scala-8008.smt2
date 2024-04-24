; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99124 () Bool)

(assert start!99124)

(declare-fun b_free!24493 () Bool)

(declare-fun b_next!24493 () Bool)

(assert (=> start!99124 (= b_free!24493 (not b_next!24493))))

(declare-fun tp!86190 () Bool)

(declare-fun b_and!39837 () Bool)

(assert (=> start!99124 (= tp!86190 b_and!39837)))

(declare-fun b!1158979 () Bool)

(declare-fun e!659188 () Bool)

(declare-fun e!659197 () Bool)

(assert (=> b!1158979 (= e!659188 e!659197)))

(declare-fun res!769280 () Bool)

(assert (=> b!1158979 (=> (not res!769280) (not e!659197))))

(declare-datatypes ((array!74937 0))(
  ( (array!74938 (arr!36113 (Array (_ BitVec 32) (_ BitVec 64))) (size!36650 (_ BitVec 32))) )
))
(declare-fun lt!520503 () array!74937)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74937 (_ BitVec 32)) Bool)

(assert (=> b!1158979 (= res!769280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520503 mask!1564))))

(declare-fun _keys!1208 () array!74937)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158979 (= lt!520503 (array!74938 (store (arr!36113 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36650 _keys!1208)))))

(declare-fun b!1158980 () Bool)

(declare-fun e!659198 () Bool)

(declare-fun e!659196 () Bool)

(declare-fun mapRes!45359 () Bool)

(assert (=> b!1158980 (= e!659198 (and e!659196 mapRes!45359))))

(declare-fun condMapEmpty!45359 () Bool)

(declare-datatypes ((V!43825 0))(
  ( (V!43826 (val!14568 Int)) )
))
(declare-datatypes ((ValueCell!13802 0))(
  ( (ValueCellFull!13802 (v!17201 V!43825)) (EmptyCell!13802) )
))
(declare-datatypes ((array!74939 0))(
  ( (array!74940 (arr!36114 (Array (_ BitVec 32) ValueCell!13802)) (size!36651 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74939)

(declare-fun mapDefault!45359 () ValueCell!13802)

(assert (=> b!1158980 (= condMapEmpty!45359 (= (arr!36114 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13802)) mapDefault!45359)))))

(declare-fun b!1158981 () Bool)

(declare-fun c!115694 () Bool)

(declare-fun lt!520487 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1158981 (= c!115694 (and (not lt!520487) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38131 0))(
  ( (Unit!38132) )
))
(declare-fun e!659200 () Unit!38131)

(declare-fun e!659202 () Unit!38131)

(assert (=> b!1158981 (= e!659200 e!659202)))

(declare-fun zeroValue!944 () V!43825)

(declare-datatypes ((tuple2!18562 0))(
  ( (tuple2!18563 (_1!9292 (_ BitVec 64)) (_2!9292 V!43825)) )
))
(declare-datatypes ((List!25304 0))(
  ( (Nil!25301) (Cons!25300 (h!26518 tuple2!18562) (t!36781 List!25304)) )
))
(declare-datatypes ((ListLongMap!16539 0))(
  ( (ListLongMap!16540 (toList!8285 List!25304)) )
))
(declare-fun lt!520494 () ListLongMap!16539)

(declare-fun call!55529 () Unit!38131)

(declare-fun bm!55520 () Bool)

(declare-fun c!115698 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!43825)

(declare-fun addStillContains!929 (ListLongMap!16539 (_ BitVec 64) V!43825 (_ BitVec 64)) Unit!38131)

(assert (=> bm!55520 (= call!55529 (addStillContains!929 lt!520494 (ite (or c!115698 c!115694) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115698 c!115694) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1158982 () Bool)

(declare-fun e!659203 () Unit!38131)

(declare-fun Unit!38133 () Unit!38131)

(assert (=> b!1158982 (= e!659203 Unit!38133)))

(declare-fun bm!55521 () Bool)

(declare-fun call!55524 () ListLongMap!16539)

(declare-fun call!55530 () ListLongMap!16539)

(assert (=> bm!55521 (= call!55524 call!55530)))

(declare-fun bm!55522 () Bool)

(declare-fun call!55525 () Bool)

(declare-fun call!55528 () Bool)

(assert (=> bm!55522 (= call!55525 call!55528)))

(declare-fun call!55527 () ListLongMap!16539)

(declare-fun lt!520501 () array!74939)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!55523 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4778 (array!74937 array!74939 (_ BitVec 32) (_ BitVec 32) V!43825 V!43825 (_ BitVec 32) Int) ListLongMap!16539)

(assert (=> bm!55523 (= call!55527 (getCurrentListMapNoExtraKeys!4778 lt!520503 lt!520501 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158983 () Bool)

(declare-fun lt!520490 () Unit!38131)

(assert (=> b!1158983 (= e!659202 lt!520490)))

(declare-fun call!55523 () Unit!38131)

(assert (=> b!1158983 (= lt!520490 call!55523)))

(assert (=> b!1158983 call!55525))

(declare-fun b!1158984 () Bool)

(declare-fun res!769276 () Bool)

(assert (=> b!1158984 (=> (not res!769276) (not e!659188))))

(assert (=> b!1158984 (= res!769276 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36650 _keys!1208))))))

(declare-fun b!1158985 () Bool)

(declare-fun res!769278 () Bool)

(assert (=> b!1158985 (=> (not res!769278) (not e!659188))))

(declare-datatypes ((List!25305 0))(
  ( (Nil!25302) (Cons!25301 (h!26519 (_ BitVec 64)) (t!36782 List!25305)) )
))
(declare-fun arrayNoDuplicates!0 (array!74937 (_ BitVec 32) List!25305) Bool)

(assert (=> b!1158985 (= res!769278 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25302))))

(declare-fun b!1158986 () Bool)

(declare-fun res!769275 () Bool)

(assert (=> b!1158986 (=> (not res!769275) (not e!659188))))

(assert (=> b!1158986 (= res!769275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!520505 () ListLongMap!16539)

(declare-fun b!1158987 () Bool)

(declare-fun e!659194 () Bool)

(assert (=> b!1158987 (= e!659194 (= lt!520505 (getCurrentListMapNoExtraKeys!4778 lt!520503 lt!520501 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158988 () Bool)

(declare-fun res!769271 () Bool)

(assert (=> b!1158988 (=> (not res!769271) (not e!659197))))

(assert (=> b!1158988 (= res!769271 (arrayNoDuplicates!0 lt!520503 #b00000000000000000000000000000000 Nil!25302))))

(declare-fun b!1158989 () Bool)

(declare-fun e!659187 () Unit!38131)

(assert (=> b!1158989 (= e!659202 e!659187)))

(declare-fun c!115695 () Bool)

(assert (=> b!1158989 (= c!115695 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520487))))

(declare-fun b!1158990 () Bool)

(declare-fun res!769281 () Bool)

(assert (=> b!1158990 (=> (not res!769281) (not e!659188))))

(assert (=> b!1158990 (= res!769281 (= (select (arr!36113 _keys!1208) i!673) k0!934))))

(declare-fun b!1158991 () Bool)

(declare-fun res!769274 () Bool)

(assert (=> b!1158991 (=> (not res!769274) (not e!659188))))

(assert (=> b!1158991 (= res!769274 (and (= (size!36651 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36650 _keys!1208) (size!36651 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!55524 () Bool)

(declare-fun call!55526 () ListLongMap!16539)

(assert (=> bm!55524 (= call!55526 (getCurrentListMapNoExtraKeys!4778 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158992 () Bool)

(declare-fun e!659199 () Bool)

(assert (=> b!1158992 (= e!659197 (not e!659199))))

(declare-fun res!769272 () Bool)

(assert (=> b!1158992 (=> res!769272 e!659199)))

(assert (=> b!1158992 (= res!769272 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158992 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520496 () Unit!38131)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74937 (_ BitVec 64) (_ BitVec 32)) Unit!38131)

(assert (=> b!1158992 (= lt!520496 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1158993 () Bool)

(declare-fun e!659195 () Bool)

(assert (=> b!1158993 (= e!659195 (= call!55527 call!55526))))

(declare-fun b!1158994 () Bool)

(declare-fun res!769273 () Bool)

(assert (=> b!1158994 (=> (not res!769273) (not e!659188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158994 (= res!769273 (validMask!0 mask!1564))))

(declare-fun b!1158995 () Bool)

(declare-fun e!659191 () Bool)

(assert (=> b!1158995 (= e!659199 e!659191)))

(declare-fun res!769267 () Bool)

(assert (=> b!1158995 (=> res!769267 e!659191)))

(assert (=> b!1158995 (= res!769267 (not (= from!1455 i!673)))))

(declare-fun lt!520507 () ListLongMap!16539)

(assert (=> b!1158995 (= lt!520507 (getCurrentListMapNoExtraKeys!4778 lt!520503 lt!520501 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520493 () V!43825)

(assert (=> b!1158995 (= lt!520501 (array!74940 (store (arr!36114 _values!996) i!673 (ValueCellFull!13802 lt!520493)) (size!36651 _values!996)))))

(declare-fun dynLambda!2791 (Int (_ BitVec 64)) V!43825)

(assert (=> b!1158995 (= lt!520493 (dynLambda!2791 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!520491 () ListLongMap!16539)

(assert (=> b!1158995 (= lt!520491 (getCurrentListMapNoExtraKeys!4778 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1158996 () Bool)

(declare-fun res!769277 () Bool)

(assert (=> b!1158996 (=> (not res!769277) (not e!659188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158996 (= res!769277 (validKeyInArray!0 k0!934))))

(declare-fun b!1158997 () Bool)

(declare-fun e!659190 () Bool)

(assert (=> b!1158997 (= e!659191 e!659190)))

(declare-fun res!769268 () Bool)

(assert (=> b!1158997 (=> res!769268 e!659190)))

(assert (=> b!1158997 (= res!769268 (not (= (select (arr!36113 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1158997 e!659195))

(declare-fun c!115693 () Bool)

(assert (=> b!1158997 (= c!115693 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520489 () Unit!38131)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!627 (array!74937 array!74939 (_ BitVec 32) (_ BitVec 32) V!43825 V!43825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38131)

(assert (=> b!1158997 (= lt!520489 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!627 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45359 () Bool)

(declare-fun tp!86189 () Bool)

(declare-fun e!659189 () Bool)

(assert (=> mapNonEmpty!45359 (= mapRes!45359 (and tp!86189 e!659189))))

(declare-fun mapValue!45359 () ValueCell!13802)

(declare-fun mapKey!45359 () (_ BitVec 32))

(declare-fun mapRest!45359 () (Array (_ BitVec 32) ValueCell!13802))

(assert (=> mapNonEmpty!45359 (= (arr!36114 _values!996) (store mapRest!45359 mapKey!45359 mapValue!45359))))

(declare-fun res!769269 () Bool)

(assert (=> start!99124 (=> (not res!769269) (not e!659188))))

(assert (=> start!99124 (= res!769269 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36650 _keys!1208))))))

(assert (=> start!99124 e!659188))

(declare-fun tp_is_empty!29023 () Bool)

(assert (=> start!99124 tp_is_empty!29023))

(declare-fun array_inv!27704 (array!74937) Bool)

(assert (=> start!99124 (array_inv!27704 _keys!1208)))

(assert (=> start!99124 true))

(assert (=> start!99124 tp!86190))

(declare-fun array_inv!27705 (array!74939) Bool)

(assert (=> start!99124 (and (array_inv!27705 _values!996) e!659198)))

(declare-fun mapIsEmpty!45359 () Bool)

(assert (=> mapIsEmpty!45359 mapRes!45359))

(declare-fun bm!55525 () Bool)

(assert (=> bm!55525 (= call!55523 call!55529)))

(declare-fun b!1158998 () Bool)

(assert (=> b!1158998 (= e!659196 tp_is_empty!29023)))

(declare-fun bm!55526 () Bool)

(declare-fun lt!520486 () ListLongMap!16539)

(declare-fun contains!6808 (ListLongMap!16539 (_ BitVec 64)) Bool)

(assert (=> bm!55526 (= call!55528 (contains!6808 (ite c!115698 lt!520486 call!55524) k0!934))))

(declare-fun b!1158999 () Bool)

(declare-fun -!1387 (ListLongMap!16539 (_ BitVec 64)) ListLongMap!16539)

(assert (=> b!1158999 (= e!659195 (= call!55527 (-!1387 call!55526 k0!934)))))

(declare-fun b!1159000 () Bool)

(declare-fun Unit!38134 () Unit!38131)

(assert (=> b!1159000 (= e!659187 Unit!38134)))

(declare-fun b!1159001 () Bool)

(declare-fun +!3707 (ListLongMap!16539 tuple2!18562) ListLongMap!16539)

(assert (=> b!1159001 (contains!6808 (+!3707 lt!520486 (tuple2!18563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!520495 () Unit!38131)

(assert (=> b!1159001 (= lt!520495 (addStillContains!929 lt!520486 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1159001 call!55528))

(assert (=> b!1159001 (= lt!520486 call!55530)))

(declare-fun lt!520506 () Unit!38131)

(assert (=> b!1159001 (= lt!520506 call!55529)))

(assert (=> b!1159001 (= e!659200 lt!520495)))

(declare-fun e!659192 () Bool)

(declare-fun b!1159002 () Bool)

(assert (=> b!1159002 (= e!659192 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159003 () Bool)

(assert (=> b!1159003 (= e!659190 true)))

(assert (=> b!1159003 e!659194))

(declare-fun res!769279 () Bool)

(assert (=> b!1159003 (=> (not res!769279) (not e!659194))))

(assert (=> b!1159003 (= res!769279 (= lt!520505 lt!520494))))

(assert (=> b!1159003 (= lt!520505 (-!1387 lt!520491 k0!934))))

(declare-fun lt!520500 () V!43825)

(assert (=> b!1159003 (= (-!1387 (+!3707 lt!520494 (tuple2!18563 (select (arr!36113 _keys!1208) from!1455) lt!520500)) (select (arr!36113 _keys!1208) from!1455)) lt!520494)))

(declare-fun lt!520488 () Unit!38131)

(declare-fun addThenRemoveForNewKeyIsSame!223 (ListLongMap!16539 (_ BitVec 64) V!43825) Unit!38131)

(assert (=> b!1159003 (= lt!520488 (addThenRemoveForNewKeyIsSame!223 lt!520494 (select (arr!36113 _keys!1208) from!1455) lt!520500))))

(declare-fun get!18432 (ValueCell!13802 V!43825) V!43825)

(assert (=> b!1159003 (= lt!520500 (get!18432 (select (arr!36114 _values!996) from!1455) lt!520493))))

(declare-fun lt!520504 () Unit!38131)

(assert (=> b!1159003 (= lt!520504 e!659203)))

(declare-fun c!115697 () Bool)

(assert (=> b!1159003 (= c!115697 (contains!6808 lt!520494 k0!934))))

(assert (=> b!1159003 (= lt!520494 (getCurrentListMapNoExtraKeys!4778 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159004 () Bool)

(declare-fun e!659193 () Bool)

(assert (=> b!1159004 (= e!659193 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520487) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1159005 () Bool)

(assert (=> b!1159005 (= e!659193 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!55527 () Bool)

(assert (=> bm!55527 (= call!55530 (+!3707 lt!520494 (ite (or c!115698 c!115694) (tuple2!18563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1159006 () Bool)

(declare-fun Unit!38135 () Unit!38131)

(assert (=> b!1159006 (= e!659203 Unit!38135)))

(assert (=> b!1159006 (= lt!520487 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1159006 (= c!115698 (and (not lt!520487) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520498 () Unit!38131)

(assert (=> b!1159006 (= lt!520498 e!659200)))

(declare-fun lt!520502 () Unit!38131)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!517 (array!74937 array!74939 (_ BitVec 32) (_ BitVec 32) V!43825 V!43825 (_ BitVec 64) (_ BitVec 32) Int) Unit!38131)

(assert (=> b!1159006 (= lt!520502 (lemmaListMapContainsThenArrayContainsFrom!517 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115696 () Bool)

(assert (=> b!1159006 (= c!115696 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769270 () Bool)

(assert (=> b!1159006 (= res!769270 e!659193)))

(assert (=> b!1159006 (=> (not res!769270) (not e!659192))))

(assert (=> b!1159006 e!659192))

(declare-fun lt!520499 () Unit!38131)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74937 (_ BitVec 32) (_ BitVec 32)) Unit!38131)

(assert (=> b!1159006 (= lt!520499 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1159006 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25302)))

(declare-fun lt!520497 () Unit!38131)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74937 (_ BitVec 64) (_ BitVec 32) List!25305) Unit!38131)

(assert (=> b!1159006 (= lt!520497 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25302))))

(assert (=> b!1159006 false))

(declare-fun b!1159007 () Bool)

(assert (=> b!1159007 call!55525))

(declare-fun lt!520492 () Unit!38131)

(assert (=> b!1159007 (= lt!520492 call!55523)))

(assert (=> b!1159007 (= e!659187 lt!520492)))

(declare-fun b!1159008 () Bool)

(assert (=> b!1159008 (= e!659189 tp_is_empty!29023)))

(assert (= (and start!99124 res!769269) b!1158994))

(assert (= (and b!1158994 res!769273) b!1158991))

(assert (= (and b!1158991 res!769274) b!1158986))

(assert (= (and b!1158986 res!769275) b!1158985))

(assert (= (and b!1158985 res!769278) b!1158984))

(assert (= (and b!1158984 res!769276) b!1158996))

(assert (= (and b!1158996 res!769277) b!1158990))

(assert (= (and b!1158990 res!769281) b!1158979))

(assert (= (and b!1158979 res!769280) b!1158988))

(assert (= (and b!1158988 res!769271) b!1158992))

(assert (= (and b!1158992 (not res!769272)) b!1158995))

(assert (= (and b!1158995 (not res!769267)) b!1158997))

(assert (= (and b!1158997 c!115693) b!1158999))

(assert (= (and b!1158997 (not c!115693)) b!1158993))

(assert (= (or b!1158999 b!1158993) bm!55523))

(assert (= (or b!1158999 b!1158993) bm!55524))

(assert (= (and b!1158997 (not res!769268)) b!1159003))

(assert (= (and b!1159003 c!115697) b!1159006))

(assert (= (and b!1159003 (not c!115697)) b!1158982))

(assert (= (and b!1159006 c!115698) b!1159001))

(assert (= (and b!1159006 (not c!115698)) b!1158981))

(assert (= (and b!1158981 c!115694) b!1158983))

(assert (= (and b!1158981 (not c!115694)) b!1158989))

(assert (= (and b!1158989 c!115695) b!1159007))

(assert (= (and b!1158989 (not c!115695)) b!1159000))

(assert (= (or b!1158983 b!1159007) bm!55525))

(assert (= (or b!1158983 b!1159007) bm!55521))

(assert (= (or b!1158983 b!1159007) bm!55522))

(assert (= (or b!1159001 bm!55522) bm!55526))

(assert (= (or b!1159001 bm!55525) bm!55520))

(assert (= (or b!1159001 bm!55521) bm!55527))

(assert (= (and b!1159006 c!115696) b!1159005))

(assert (= (and b!1159006 (not c!115696)) b!1159004))

(assert (= (and b!1159006 res!769270) b!1159002))

(assert (= (and b!1159003 res!769279) b!1158987))

(assert (= (and b!1158980 condMapEmpty!45359) mapIsEmpty!45359))

(assert (= (and b!1158980 (not condMapEmpty!45359)) mapNonEmpty!45359))

(get-info :version)

(assert (= (and mapNonEmpty!45359 ((_ is ValueCellFull!13802) mapValue!45359)) b!1159008))

(assert (= (and b!1158980 ((_ is ValueCellFull!13802) mapDefault!45359)) b!1158998))

(assert (= start!99124 b!1158980))

(declare-fun b_lambda!19593 () Bool)

(assert (=> (not b_lambda!19593) (not b!1158995)))

(declare-fun t!36780 () Bool)

(declare-fun tb!9297 () Bool)

(assert (=> (and start!99124 (= defaultEntry!1004 defaultEntry!1004) t!36780) tb!9297))

(declare-fun result!19167 () Bool)

(assert (=> tb!9297 (= result!19167 tp_is_empty!29023)))

(assert (=> b!1158995 t!36780))

(declare-fun b_and!39839 () Bool)

(assert (= b_and!39837 (and (=> t!36780 result!19167) b_and!39839)))

(declare-fun m!1068557 () Bool)

(assert (=> b!1158990 m!1068557))

(declare-fun m!1068559 () Bool)

(assert (=> b!1158999 m!1068559))

(declare-fun m!1068561 () Bool)

(assert (=> start!99124 m!1068561))

(declare-fun m!1068563 () Bool)

(assert (=> start!99124 m!1068563))

(declare-fun m!1068565 () Bool)

(assert (=> b!1158986 m!1068565))

(declare-fun m!1068567 () Bool)

(assert (=> bm!55523 m!1068567))

(assert (=> b!1158987 m!1068567))

(declare-fun m!1068569 () Bool)

(assert (=> b!1159002 m!1068569))

(declare-fun m!1068571 () Bool)

(assert (=> b!1158996 m!1068571))

(declare-fun m!1068573 () Bool)

(assert (=> bm!55527 m!1068573))

(declare-fun m!1068575 () Bool)

(assert (=> mapNonEmpty!45359 m!1068575))

(declare-fun m!1068577 () Bool)

(assert (=> bm!55524 m!1068577))

(declare-fun m!1068579 () Bool)

(assert (=> bm!55526 m!1068579))

(declare-fun m!1068581 () Bool)

(assert (=> b!1159006 m!1068581))

(declare-fun m!1068583 () Bool)

(assert (=> b!1159006 m!1068583))

(declare-fun m!1068585 () Bool)

(assert (=> b!1159006 m!1068585))

(declare-fun m!1068587 () Bool)

(assert (=> b!1159006 m!1068587))

(declare-fun m!1068589 () Bool)

(assert (=> b!1158985 m!1068589))

(assert (=> b!1159003 m!1068577))

(declare-fun m!1068591 () Bool)

(assert (=> b!1159003 m!1068591))

(declare-fun m!1068593 () Bool)

(assert (=> b!1159003 m!1068593))

(declare-fun m!1068595 () Bool)

(assert (=> b!1159003 m!1068595))

(declare-fun m!1068597 () Bool)

(assert (=> b!1159003 m!1068597))

(declare-fun m!1068599 () Bool)

(assert (=> b!1159003 m!1068599))

(assert (=> b!1159003 m!1068593))

(declare-fun m!1068601 () Bool)

(assert (=> b!1159003 m!1068601))

(assert (=> b!1159003 m!1068595))

(assert (=> b!1159003 m!1068595))

(declare-fun m!1068603 () Bool)

(assert (=> b!1159003 m!1068603))

(assert (=> b!1159003 m!1068591))

(declare-fun m!1068605 () Bool)

(assert (=> b!1159003 m!1068605))

(declare-fun m!1068607 () Bool)

(assert (=> bm!55520 m!1068607))

(declare-fun m!1068609 () Bool)

(assert (=> b!1158988 m!1068609))

(declare-fun m!1068611 () Bool)

(assert (=> b!1158992 m!1068611))

(declare-fun m!1068613 () Bool)

(assert (=> b!1158992 m!1068613))

(declare-fun m!1068615 () Bool)

(assert (=> b!1158995 m!1068615))

(declare-fun m!1068617 () Bool)

(assert (=> b!1158995 m!1068617))

(declare-fun m!1068619 () Bool)

(assert (=> b!1158995 m!1068619))

(declare-fun m!1068621 () Bool)

(assert (=> b!1158995 m!1068621))

(assert (=> b!1158997 m!1068595))

(declare-fun m!1068623 () Bool)

(assert (=> b!1158997 m!1068623))

(declare-fun m!1068625 () Bool)

(assert (=> b!1159001 m!1068625))

(assert (=> b!1159001 m!1068625))

(declare-fun m!1068627 () Bool)

(assert (=> b!1159001 m!1068627))

(declare-fun m!1068629 () Bool)

(assert (=> b!1159001 m!1068629))

(assert (=> b!1159005 m!1068569))

(declare-fun m!1068631 () Bool)

(assert (=> b!1158994 m!1068631))

(declare-fun m!1068633 () Bool)

(assert (=> b!1158979 m!1068633))

(declare-fun m!1068635 () Bool)

(assert (=> b!1158979 m!1068635))

(check-sat (not b!1158985) (not mapNonEmpty!45359) (not b!1158992) (not b!1158987) (not b!1158994) (not b!1158999) (not bm!55524) (not b!1159002) (not start!99124) (not bm!55523) (not b!1158988) (not b!1158996) (not bm!55527) (not bm!55526) (not b!1158997) (not b!1159001) (not b!1159003) (not b!1158995) (not b!1159006) (not bm!55520) (not b!1158986) b_and!39839 (not b_lambda!19593) tp_is_empty!29023 (not b_next!24493) (not b!1158979) (not b!1159005))
(check-sat b_and!39839 (not b_next!24493))
