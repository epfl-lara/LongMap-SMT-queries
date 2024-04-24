; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98830 () Bool)

(assert start!98830)

(declare-fun b_free!24199 () Bool)

(declare-fun b_next!24199 () Bool)

(assert (=> start!98830 (= b_free!24199 (not b_next!24199))))

(declare-fun tp!85307 () Bool)

(declare-fun b_and!39249 () Bool)

(assert (=> start!98830 (= tp!85307 b_and!39249)))

(declare-fun bm!51992 () Bool)

(declare-datatypes ((Unit!37533 0))(
  ( (Unit!37534) )
))
(declare-fun call!51998 () Unit!37533)

(declare-fun call!52002 () Unit!37533)

(assert (=> bm!51992 (= call!51998 call!52002)))

(declare-datatypes ((V!43433 0))(
  ( (V!43434 (val!14421 Int)) )
))
(declare-fun zeroValue!944 () V!43433)

(declare-fun bm!51993 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!18276 0))(
  ( (tuple2!18277 (_1!9149 (_ BitVec 64)) (_2!9149 V!43433)) )
))
(declare-datatypes ((List!25032 0))(
  ( (Nil!25029) (Cons!25028 (h!26246 tuple2!18276) (t!36215 List!25032)) )
))
(declare-datatypes ((ListLongMap!16253 0))(
  ( (ListLongMap!16254 (toList!8142 List!25032)) )
))
(declare-fun call!51995 () ListLongMap!16253)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43433)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13655 0))(
  ( (ValueCellFull!13655 (v!17054 V!43433)) (EmptyCell!13655) )
))
(declare-datatypes ((array!74357 0))(
  ( (array!74358 (arr!35823 (Array (_ BitVec 32) ValueCell!13655)) (size!36360 (_ BitVec 32))) )
))
(declare-fun lt!510952 () array!74357)

(declare-datatypes ((array!74359 0))(
  ( (array!74360 (arr!35824 (Array (_ BitVec 32) (_ BitVec 64))) (size!36361 (_ BitVec 32))) )
))
(declare-fun lt!510950 () array!74359)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4647 (array!74359 array!74357 (_ BitVec 32) (_ BitVec 32) V!43433 V!43433 (_ BitVec 32) Int) ListLongMap!16253)

(assert (=> bm!51993 (= call!51995 (getCurrentListMapNoExtraKeys!4647 lt!510950 lt!510952 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44918 () Bool)

(declare-fun mapRes!44918 () Bool)

(declare-fun tp!85308 () Bool)

(declare-fun e!651693 () Bool)

(assert (=> mapNonEmpty!44918 (= mapRes!44918 (and tp!85308 e!651693))))

(declare-fun mapValue!44918 () ValueCell!13655)

(declare-fun mapRest!44918 () (Array (_ BitVec 32) ValueCell!13655))

(declare-fun mapKey!44918 () (_ BitVec 32))

(declare-fun _values!996 () array!74357)

(assert (=> mapNonEmpty!44918 (= (arr!35823 _values!996) (store mapRest!44918 mapKey!44918 mapValue!44918))))

(declare-fun b!1145455 () Bool)

(declare-fun e!651691 () Bool)

(declare-fun e!651698 () Bool)

(assert (=> b!1145455 (= e!651691 e!651698)))

(declare-fun res!762658 () Bool)

(assert (=> b!1145455 (=> (not res!762658) (not e!651698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74359 (_ BitVec 32)) Bool)

(assert (=> b!1145455 (= res!762658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510950 mask!1564))))

(declare-fun _keys!1208 () array!74359)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145455 (= lt!510950 (array!74360 (store (arr!35824 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36361 _keys!1208)))))

(declare-fun b!1145456 () Bool)

(declare-fun e!651692 () Unit!37533)

(declare-fun e!651696 () Unit!37533)

(assert (=> b!1145456 (= e!651692 e!651696)))

(declare-fun c!113052 () Bool)

(declare-fun lt!510948 () Bool)

(assert (=> b!1145456 (= c!113052 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510948))))

(declare-fun b!1145457 () Bool)

(declare-fun tp_is_empty!28729 () Bool)

(assert (=> b!1145457 (= e!651693 tp_is_empty!28729)))

(declare-fun b!1145458 () Bool)

(declare-fun c!113051 () Bool)

(assert (=> b!1145458 (= c!113051 (and (not lt!510948) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!651703 () Unit!37533)

(assert (=> b!1145458 (= e!651703 e!651692)))

(declare-fun b!1145459 () Bool)

(declare-fun call!52001 () Bool)

(assert (=> b!1145459 call!52001))

(declare-fun lt!510958 () Unit!37533)

(assert (=> b!1145459 (= lt!510958 call!51998)))

(assert (=> b!1145459 (= e!651696 lt!510958)))

(declare-fun bm!51994 () Bool)

(declare-fun call!51999 () ListLongMap!16253)

(declare-fun call!51997 () ListLongMap!16253)

(assert (=> bm!51994 (= call!51999 call!51997)))

(declare-fun c!113047 () Bool)

(declare-fun bm!51995 () Bool)

(declare-fun lt!510963 () ListLongMap!16253)

(declare-fun +!3586 (ListLongMap!16253 tuple2!18276) ListLongMap!16253)

(assert (=> bm!51995 (= call!51997 (+!3586 lt!510963 (ite (or c!113047 c!113051) (tuple2!18277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1145460 () Bool)

(declare-fun e!651700 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145460 (= e!651700 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145461 () Bool)

(declare-fun res!762657 () Bool)

(assert (=> b!1145461 (=> (not res!762657) (not e!651691))))

(declare-datatypes ((List!25033 0))(
  ( (Nil!25030) (Cons!25029 (h!26247 (_ BitVec 64)) (t!36216 List!25033)) )
))
(declare-fun arrayNoDuplicates!0 (array!74359 (_ BitVec 32) List!25033) Bool)

(assert (=> b!1145461 (= res!762657 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25030))))

(declare-fun b!1145462 () Bool)

(declare-fun res!762655 () Bool)

(assert (=> b!1145462 (=> (not res!762655) (not e!651691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145462 (= res!762655 (validMask!0 mask!1564))))

(declare-fun bm!51996 () Bool)

(declare-fun call!51996 () Bool)

(declare-fun lt!510954 () ListLongMap!16253)

(declare-fun contains!6685 (ListLongMap!16253 (_ BitVec 64)) Bool)

(assert (=> bm!51996 (= call!51996 (contains!6685 (ite c!113047 lt!510954 call!51999) k0!934))))

(declare-fun b!1145463 () Bool)

(declare-fun e!651705 () Bool)

(declare-fun e!651701 () Bool)

(assert (=> b!1145463 (= e!651705 e!651701)))

(declare-fun res!762652 () Bool)

(assert (=> b!1145463 (=> res!762652 e!651701)))

(assert (=> b!1145463 (= res!762652 (not (= (select (arr!35824 _keys!1208) from!1455) k0!934)))))

(declare-fun e!651695 () Bool)

(assert (=> b!1145463 e!651695))

(declare-fun c!113048 () Bool)

(assert (=> b!1145463 (= c!113048 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510947 () Unit!37533)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!520 (array!74359 array!74357 (_ BitVec 32) (_ BitVec 32) V!43433 V!43433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37533)

(assert (=> b!1145463 (= lt!510947 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145464 () Bool)

(declare-fun res!762664 () Bool)

(assert (=> b!1145464 (=> (not res!762664) (not e!651691))))

(assert (=> b!1145464 (= res!762664 (= (select (arr!35824 _keys!1208) i!673) k0!934))))

(declare-fun b!1145465 () Bool)

(declare-fun e!651706 () Unit!37533)

(declare-fun Unit!37535 () Unit!37533)

(assert (=> b!1145465 (= e!651706 Unit!37535)))

(assert (=> b!1145465 (= lt!510948 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1145465 (= c!113047 (and (not lt!510948) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510949 () Unit!37533)

(assert (=> b!1145465 (= lt!510949 e!651703)))

(declare-fun lt!510946 () Unit!37533)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!410 (array!74359 array!74357 (_ BitVec 32) (_ BitVec 32) V!43433 V!43433 (_ BitVec 64) (_ BitVec 32) Int) Unit!37533)

(assert (=> b!1145465 (= lt!510946 (lemmaListMapContainsThenArrayContainsFrom!410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113049 () Bool)

(assert (=> b!1145465 (= c!113049 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762656 () Bool)

(assert (=> b!1145465 (= res!762656 e!651700)))

(declare-fun e!651690 () Bool)

(assert (=> b!1145465 (=> (not res!762656) (not e!651690))))

(assert (=> b!1145465 e!651690))

(declare-fun lt!510951 () Unit!37533)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74359 (_ BitVec 32) (_ BitVec 32)) Unit!37533)

(assert (=> b!1145465 (= lt!510951 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1145465 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25030)))

(declare-fun lt!510956 () Unit!37533)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74359 (_ BitVec 64) (_ BitVec 32) List!25033) Unit!37533)

(assert (=> b!1145465 (= lt!510956 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25030))))

(assert (=> b!1145465 false))

(declare-fun call!52000 () ListLongMap!16253)

(declare-fun b!1145466 () Bool)

(declare-fun -!1271 (ListLongMap!16253 (_ BitVec 64)) ListLongMap!16253)

(assert (=> b!1145466 (= e!651695 (= call!51995 (-!1271 call!52000 k0!934)))))

(declare-fun b!1145467 () Bool)

(declare-fun e!651694 () Bool)

(assert (=> b!1145467 (= e!651694 e!651705)))

(declare-fun res!762654 () Bool)

(assert (=> b!1145467 (=> res!762654 e!651705)))

(assert (=> b!1145467 (= res!762654 (not (= from!1455 i!673)))))

(declare-fun lt!510957 () ListLongMap!16253)

(assert (=> b!1145467 (= lt!510957 (getCurrentListMapNoExtraKeys!4647 lt!510950 lt!510952 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!510961 () V!43433)

(assert (=> b!1145467 (= lt!510952 (array!74358 (store (arr!35823 _values!996) i!673 (ValueCellFull!13655 lt!510961)) (size!36360 _values!996)))))

(declare-fun dynLambda!2679 (Int (_ BitVec 64)) V!43433)

(assert (=> b!1145467 (= lt!510961 (dynLambda!2679 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510962 () ListLongMap!16253)

(assert (=> b!1145467 (= lt!510962 (getCurrentListMapNoExtraKeys!4647 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1145468 () Bool)

(assert (=> b!1145468 (= e!651698 (not e!651694))))

(declare-fun res!762660 () Bool)

(assert (=> b!1145468 (=> res!762660 e!651694)))

(assert (=> b!1145468 (= res!762660 (bvsgt from!1455 i!673))))

(assert (=> b!1145468 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510960 () Unit!37533)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74359 (_ BitVec 64) (_ BitVec 32)) Unit!37533)

(assert (=> b!1145468 (= lt!510960 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1145469 () Bool)

(declare-fun Unit!37536 () Unit!37533)

(assert (=> b!1145469 (= e!651706 Unit!37536)))

(declare-fun bm!51997 () Bool)

(assert (=> bm!51997 (= call!52000 (getCurrentListMapNoExtraKeys!4647 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145470 () Bool)

(declare-fun res!762661 () Bool)

(assert (=> b!1145470 (=> (not res!762661) (not e!651691))))

(assert (=> b!1145470 (= res!762661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1145471 () Bool)

(declare-fun res!762663 () Bool)

(assert (=> b!1145471 (=> (not res!762663) (not e!651691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145471 (= res!762663 (validKeyInArray!0 k0!934))))

(declare-fun b!1145472 () Bool)

(declare-fun Unit!37537 () Unit!37533)

(assert (=> b!1145472 (= e!651696 Unit!37537)))

(declare-fun b!1145473 () Bool)

(assert (=> b!1145473 (= e!651701 true)))

(declare-fun e!651697 () Bool)

(assert (=> b!1145473 e!651697))

(declare-fun res!762665 () Bool)

(assert (=> b!1145473 (=> (not res!762665) (not e!651697))))

(declare-fun lt!510955 () V!43433)

(assert (=> b!1145473 (= res!762665 (= (-!1271 (+!3586 lt!510963 (tuple2!18277 (select (arr!35824 _keys!1208) from!1455) lt!510955)) (select (arr!35824 _keys!1208) from!1455)) lt!510963))))

(declare-fun lt!510964 () Unit!37533)

(declare-fun addThenRemoveForNewKeyIsSame!127 (ListLongMap!16253 (_ BitVec 64) V!43433) Unit!37533)

(assert (=> b!1145473 (= lt!510964 (addThenRemoveForNewKeyIsSame!127 lt!510963 (select (arr!35824 _keys!1208) from!1455) lt!510955))))

(declare-fun get!18238 (ValueCell!13655 V!43433) V!43433)

(assert (=> b!1145473 (= lt!510955 (get!18238 (select (arr!35823 _values!996) from!1455) lt!510961))))

(declare-fun lt!510959 () Unit!37533)

(assert (=> b!1145473 (= lt!510959 e!651706)))

(declare-fun c!113050 () Bool)

(assert (=> b!1145473 (= c!113050 (contains!6685 lt!510963 k0!934))))

(assert (=> b!1145473 (= lt!510963 (getCurrentListMapNoExtraKeys!4647 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145474 () Bool)

(declare-fun res!762666 () Bool)

(assert (=> b!1145474 (=> (not res!762666) (not e!651691))))

(assert (=> b!1145474 (= res!762666 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36361 _keys!1208))))))

(declare-fun b!1145475 () Bool)

(assert (=> b!1145475 (= e!651695 (= call!51995 call!52000))))

(declare-fun b!1145476 () Bool)

(assert (=> b!1145476 (= e!651700 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510948) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1145477 () Bool)

(declare-fun res!762662 () Bool)

(assert (=> b!1145477 (=> (not res!762662) (not e!651698))))

(assert (=> b!1145477 (= res!762662 (arrayNoDuplicates!0 lt!510950 #b00000000000000000000000000000000 Nil!25030))))

(declare-fun res!762653 () Bool)

(assert (=> start!98830 (=> (not res!762653) (not e!651691))))

(assert (=> start!98830 (= res!762653 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36361 _keys!1208))))))

(assert (=> start!98830 e!651691))

(assert (=> start!98830 tp_is_empty!28729))

(declare-fun array_inv!27496 (array!74359) Bool)

(assert (=> start!98830 (array_inv!27496 _keys!1208)))

(assert (=> start!98830 true))

(assert (=> start!98830 tp!85307))

(declare-fun e!651702 () Bool)

(declare-fun array_inv!27497 (array!74357) Bool)

(assert (=> start!98830 (and (array_inv!27497 _values!996) e!651702)))

(declare-fun b!1145478 () Bool)

(declare-fun res!762659 () Bool)

(assert (=> b!1145478 (=> (not res!762659) (not e!651691))))

(assert (=> b!1145478 (= res!762659 (and (= (size!36360 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36361 _keys!1208) (size!36360 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145479 () Bool)

(declare-fun lt!510945 () Unit!37533)

(assert (=> b!1145479 (= e!651692 lt!510945)))

(assert (=> b!1145479 (= lt!510945 call!51998)))

(assert (=> b!1145479 call!52001))

(declare-fun bm!51998 () Bool)

(assert (=> bm!51998 (= call!52001 call!51996)))

(declare-fun bm!51999 () Bool)

(declare-fun addStillContains!813 (ListLongMap!16253 (_ BitVec 64) V!43433 (_ BitVec 64)) Unit!37533)

(assert (=> bm!51999 (= call!52002 (addStillContains!813 lt!510963 (ite (or c!113047 c!113051) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113047 c!113051) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapIsEmpty!44918 () Bool)

(assert (=> mapIsEmpty!44918 mapRes!44918))

(declare-fun b!1145480 () Bool)

(assert (=> b!1145480 (contains!6685 (+!3586 lt!510954 (tuple2!18277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!510944 () Unit!37533)

(assert (=> b!1145480 (= lt!510944 (addStillContains!813 lt!510954 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1145480 call!51996))

(assert (=> b!1145480 (= lt!510954 call!51997)))

(declare-fun lt!510953 () Unit!37533)

(assert (=> b!1145480 (= lt!510953 call!52002)))

(assert (=> b!1145480 (= e!651703 lt!510944)))

(declare-fun b!1145481 () Bool)

(declare-fun e!651699 () Bool)

(assert (=> b!1145481 (= e!651702 (and e!651699 mapRes!44918))))

(declare-fun condMapEmpty!44918 () Bool)

(declare-fun mapDefault!44918 () ValueCell!13655)

(assert (=> b!1145481 (= condMapEmpty!44918 (= (arr!35823 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13655)) mapDefault!44918)))))

(declare-fun b!1145482 () Bool)

(assert (=> b!1145482 (= e!651699 tp_is_empty!28729)))

(declare-fun b!1145483 () Bool)

(assert (=> b!1145483 (= e!651697 (= (-!1271 lt!510962 k0!934) lt!510963))))

(declare-fun b!1145484 () Bool)

(assert (=> b!1145484 (= e!651690 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98830 res!762653) b!1145462))

(assert (= (and b!1145462 res!762655) b!1145478))

(assert (= (and b!1145478 res!762659) b!1145470))

(assert (= (and b!1145470 res!762661) b!1145461))

(assert (= (and b!1145461 res!762657) b!1145474))

(assert (= (and b!1145474 res!762666) b!1145471))

(assert (= (and b!1145471 res!762663) b!1145464))

(assert (= (and b!1145464 res!762664) b!1145455))

(assert (= (and b!1145455 res!762658) b!1145477))

(assert (= (and b!1145477 res!762662) b!1145468))

(assert (= (and b!1145468 (not res!762660)) b!1145467))

(assert (= (and b!1145467 (not res!762654)) b!1145463))

(assert (= (and b!1145463 c!113048) b!1145466))

(assert (= (and b!1145463 (not c!113048)) b!1145475))

(assert (= (or b!1145466 b!1145475) bm!51997))

(assert (= (or b!1145466 b!1145475) bm!51993))

(assert (= (and b!1145463 (not res!762652)) b!1145473))

(assert (= (and b!1145473 c!113050) b!1145465))

(assert (= (and b!1145473 (not c!113050)) b!1145469))

(assert (= (and b!1145465 c!113047) b!1145480))

(assert (= (and b!1145465 (not c!113047)) b!1145458))

(assert (= (and b!1145458 c!113051) b!1145479))

(assert (= (and b!1145458 (not c!113051)) b!1145456))

(assert (= (and b!1145456 c!113052) b!1145459))

(assert (= (and b!1145456 (not c!113052)) b!1145472))

(assert (= (or b!1145479 b!1145459) bm!51992))

(assert (= (or b!1145479 b!1145459) bm!51994))

(assert (= (or b!1145479 b!1145459) bm!51998))

(assert (= (or b!1145480 bm!51998) bm!51996))

(assert (= (or b!1145480 bm!51992) bm!51999))

(assert (= (or b!1145480 bm!51994) bm!51995))

(assert (= (and b!1145465 c!113049) b!1145460))

(assert (= (and b!1145465 (not c!113049)) b!1145476))

(assert (= (and b!1145465 res!762656) b!1145484))

(assert (= (and b!1145473 res!762665) b!1145483))

(assert (= (and b!1145481 condMapEmpty!44918) mapIsEmpty!44918))

(assert (= (and b!1145481 (not condMapEmpty!44918)) mapNonEmpty!44918))

(get-info :version)

(assert (= (and mapNonEmpty!44918 ((_ is ValueCellFull!13655) mapValue!44918)) b!1145457))

(assert (= (and b!1145481 ((_ is ValueCellFull!13655) mapDefault!44918)) b!1145482))

(assert (= start!98830 b!1145481))

(declare-fun b_lambda!19299 () Bool)

(assert (=> (not b_lambda!19299) (not b!1145467)))

(declare-fun t!36214 () Bool)

(declare-fun tb!9003 () Bool)

(assert (=> (and start!98830 (= defaultEntry!1004 defaultEntry!1004) t!36214) tb!9003))

(declare-fun result!18579 () Bool)

(assert (=> tb!9003 (= result!18579 tp_is_empty!28729)))

(assert (=> b!1145467 t!36214))

(declare-fun b_and!39251 () Bool)

(assert (= b_and!39249 (and (=> t!36214 result!18579) b_and!39251)))

(declare-fun m!1056791 () Bool)

(assert (=> b!1145473 m!1056791))

(declare-fun m!1056793 () Bool)

(assert (=> b!1145473 m!1056793))

(declare-fun m!1056795 () Bool)

(assert (=> b!1145473 m!1056795))

(declare-fun m!1056797 () Bool)

(assert (=> b!1145473 m!1056797))

(declare-fun m!1056799 () Bool)

(assert (=> b!1145473 m!1056799))

(assert (=> b!1145473 m!1056793))

(declare-fun m!1056801 () Bool)

(assert (=> b!1145473 m!1056801))

(declare-fun m!1056803 () Bool)

(assert (=> b!1145473 m!1056803))

(assert (=> b!1145473 m!1056803))

(assert (=> b!1145473 m!1056797))

(declare-fun m!1056805 () Bool)

(assert (=> b!1145473 m!1056805))

(assert (=> b!1145473 m!1056797))

(declare-fun m!1056807 () Bool)

(assert (=> b!1145483 m!1056807))

(assert (=> bm!51997 m!1056791))

(declare-fun m!1056809 () Bool)

(assert (=> b!1145480 m!1056809))

(assert (=> b!1145480 m!1056809))

(declare-fun m!1056811 () Bool)

(assert (=> b!1145480 m!1056811))

(declare-fun m!1056813 () Bool)

(assert (=> b!1145480 m!1056813))

(declare-fun m!1056815 () Bool)

(assert (=> bm!51996 m!1056815))

(declare-fun m!1056817 () Bool)

(assert (=> b!1145455 m!1056817))

(declare-fun m!1056819 () Bool)

(assert (=> b!1145455 m!1056819))

(declare-fun m!1056821 () Bool)

(assert (=> b!1145462 m!1056821))

(declare-fun m!1056823 () Bool)

(assert (=> b!1145465 m!1056823))

(declare-fun m!1056825 () Bool)

(assert (=> b!1145465 m!1056825))

(declare-fun m!1056827 () Bool)

(assert (=> b!1145465 m!1056827))

(declare-fun m!1056829 () Bool)

(assert (=> b!1145465 m!1056829))

(declare-fun m!1056831 () Bool)

(assert (=> b!1145468 m!1056831))

(declare-fun m!1056833 () Bool)

(assert (=> b!1145468 m!1056833))

(declare-fun m!1056835 () Bool)

(assert (=> bm!51995 m!1056835))

(declare-fun m!1056837 () Bool)

(assert (=> start!98830 m!1056837))

(declare-fun m!1056839 () Bool)

(assert (=> start!98830 m!1056839))

(declare-fun m!1056841 () Bool)

(assert (=> b!1145467 m!1056841))

(declare-fun m!1056843 () Bool)

(assert (=> b!1145467 m!1056843))

(declare-fun m!1056845 () Bool)

(assert (=> b!1145467 m!1056845))

(declare-fun m!1056847 () Bool)

(assert (=> b!1145467 m!1056847))

(declare-fun m!1056849 () Bool)

(assert (=> b!1145484 m!1056849))

(declare-fun m!1056851 () Bool)

(assert (=> b!1145477 m!1056851))

(assert (=> b!1145463 m!1056797))

(declare-fun m!1056853 () Bool)

(assert (=> b!1145463 m!1056853))

(declare-fun m!1056855 () Bool)

(assert (=> b!1145466 m!1056855))

(declare-fun m!1056857 () Bool)

(assert (=> bm!51993 m!1056857))

(declare-fun m!1056859 () Bool)

(assert (=> b!1145471 m!1056859))

(declare-fun m!1056861 () Bool)

(assert (=> mapNonEmpty!44918 m!1056861))

(declare-fun m!1056863 () Bool)

(assert (=> b!1145464 m!1056863))

(assert (=> b!1145460 m!1056849))

(declare-fun m!1056865 () Bool)

(assert (=> b!1145461 m!1056865))

(declare-fun m!1056867 () Bool)

(assert (=> b!1145470 m!1056867))

(declare-fun m!1056869 () Bool)

(assert (=> bm!51999 m!1056869))

(check-sat (not b!1145460) (not b!1145461) (not bm!51997) (not bm!51995) (not b!1145466) tp_is_empty!28729 (not b_lambda!19299) (not mapNonEmpty!44918) (not bm!51993) (not start!98830) (not b!1145480) (not bm!51996) (not b!1145455) (not b!1145484) (not b!1145477) b_and!39251 (not b_next!24199) (not b!1145471) (not b!1145462) (not b!1145465) (not b!1145473) (not b!1145467) (not b!1145468) (not bm!51999) (not b!1145483) (not b!1145463) (not b!1145470))
(check-sat b_and!39251 (not b_next!24199))
