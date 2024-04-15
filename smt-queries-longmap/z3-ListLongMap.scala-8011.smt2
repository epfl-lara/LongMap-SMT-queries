; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98900 () Bool)

(assert start!98900)

(declare-fun b_free!24511 () Bool)

(declare-fun b_next!24511 () Bool)

(assert (=> start!98900 (= b_free!24511 (not b_next!24511))))

(declare-fun tp!86243 () Bool)

(declare-fun b_and!39849 () Bool)

(assert (=> start!98900 (= tp!86243 b_and!39849)))

(declare-fun b!1158394 () Bool)

(declare-fun e!658751 () Bool)

(declare-datatypes ((V!43849 0))(
  ( (V!43850 (val!14577 Int)) )
))
(declare-datatypes ((tuple2!18638 0))(
  ( (tuple2!18639 (_1!9330 (_ BitVec 64)) (_2!9330 V!43849)) )
))
(declare-datatypes ((List!25362 0))(
  ( (Nil!25359) (Cons!25358 (h!26567 tuple2!18638) (t!36856 List!25362)) )
))
(declare-datatypes ((ListLongMap!16607 0))(
  ( (ListLongMap!16608 (toList!8319 List!25362)) )
))
(declare-fun call!55657 () ListLongMap!16607)

(declare-fun call!55655 () ListLongMap!16607)

(assert (=> b!1158394 (= e!658751 (= call!55657 call!55655))))

(declare-fun b!1158395 () Bool)

(declare-fun e!658748 () Bool)

(declare-fun e!658745 () Bool)

(assert (=> b!1158395 (= e!658748 e!658745)))

(declare-fun res!769111 () Bool)

(assert (=> b!1158395 (=> (not res!769111) (not e!658745))))

(declare-datatypes ((array!74844 0))(
  ( (array!74845 (arr!36073 (Array (_ BitVec 32) (_ BitVec 64))) (size!36611 (_ BitVec 32))) )
))
(declare-fun lt!520423 () array!74844)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74844 (_ BitVec 32)) Bool)

(assert (=> b!1158395 (= res!769111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520423 mask!1564))))

(declare-fun _keys!1208 () array!74844)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158395 (= lt!520423 (array!74845 (store (arr!36073 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36611 _keys!1208)))))

(declare-fun b!1158396 () Bool)

(declare-datatypes ((Unit!38021 0))(
  ( (Unit!38022) )
))
(declare-fun e!658742 () Unit!38021)

(declare-fun Unit!38023 () Unit!38021)

(assert (=> b!1158396 (= e!658742 Unit!38023)))

(declare-fun b!1158397 () Bool)

(declare-fun e!658740 () Bool)

(declare-fun e!658747 () Bool)

(declare-fun mapRes!45386 () Bool)

(assert (=> b!1158397 (= e!658740 (and e!658747 mapRes!45386))))

(declare-fun condMapEmpty!45386 () Bool)

(declare-datatypes ((ValueCell!13811 0))(
  ( (ValueCellFull!13811 (v!17213 V!43849)) (EmptyCell!13811) )
))
(declare-datatypes ((array!74846 0))(
  ( (array!74847 (arr!36074 (Array (_ BitVec 32) ValueCell!13811)) (size!36612 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74846)

(declare-fun mapDefault!45386 () ValueCell!13811)

(assert (=> b!1158397 (= condMapEmpty!45386 (= (arr!36074 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13811)) mapDefault!45386)))))

(declare-fun zeroValue!944 () V!43849)

(declare-fun bm!55648 () Bool)

(declare-fun c!115434 () Bool)

(declare-fun lt!520414 () ListLongMap!16607)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!115432 () Bool)

(declare-fun call!55653 () Unit!38021)

(declare-fun minValue!944 () V!43849)

(declare-fun addStillContains!935 (ListLongMap!16607 (_ BitVec 64) V!43849 (_ BitVec 64)) Unit!38021)

(assert (=> bm!55648 (= call!55653 (addStillContains!935 lt!520414 (ite (or c!115432 c!115434) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115432 c!115434) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!55649 () Bool)

(declare-fun call!55652 () ListLongMap!16607)

(declare-fun lt!520409 () ListLongMap!16607)

(declare-fun +!3727 (ListLongMap!16607 tuple2!18638) ListLongMap!16607)

(assert (=> bm!55649 (= call!55652 (+!3727 (ite c!115432 lt!520409 lt!520414) (ite c!115432 (tuple2!18639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115434 (tuple2!18639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!55650 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4799 (array!74844 array!74846 (_ BitVec 32) (_ BitVec 32) V!43849 V!43849 (_ BitVec 32) Int) ListLongMap!16607)

(assert (=> bm!55650 (= call!55655 (getCurrentListMapNoExtraKeys!4799 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158399 () Bool)

(declare-fun e!658749 () Bool)

(declare-fun e!658738 () Bool)

(assert (=> b!1158399 (= e!658749 e!658738)))

(declare-fun res!769103 () Bool)

(assert (=> b!1158399 (=> res!769103 e!658738)))

(assert (=> b!1158399 (= res!769103 (not (= (select (arr!36073 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1158399 e!658751))

(declare-fun c!115435 () Bool)

(assert (=> b!1158399 (= c!115435 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520417 () Unit!38021)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!644 (array!74844 array!74846 (_ BitVec 32) (_ BitVec 32) V!43849 V!43849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38021)

(assert (=> b!1158399 (= lt!520417 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!644 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158400 () Bool)

(declare-fun lt!520422 () Bool)

(assert (=> b!1158400 (= c!115434 (and (not lt!520422) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!658750 () Unit!38021)

(declare-fun e!658743 () Unit!38021)

(assert (=> b!1158400 (= e!658750 e!658743)))

(declare-fun bm!55651 () Bool)

(declare-fun call!55658 () ListLongMap!16607)

(assert (=> bm!55651 (= call!55658 call!55652)))

(declare-fun bm!55652 () Bool)

(declare-fun call!55651 () Bool)

(declare-fun call!55654 () Bool)

(assert (=> bm!55652 (= call!55651 call!55654)))

(declare-fun b!1158401 () Bool)

(declare-fun lt!520418 () Unit!38021)

(assert (=> b!1158401 (= e!658743 lt!520418)))

(declare-fun call!55656 () Unit!38021)

(assert (=> b!1158401 (= lt!520418 call!55656)))

(assert (=> b!1158401 call!55651))

(declare-fun e!658741 () Bool)

(declare-fun b!1158402 () Bool)

(assert (=> b!1158402 (= e!658741 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520422) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1158403 () Bool)

(declare-fun contains!6770 (ListLongMap!16607 (_ BitVec 64)) Bool)

(assert (=> b!1158403 (contains!6770 call!55652 k0!934)))

(declare-fun lt!520413 () Unit!38021)

(assert (=> b!1158403 (= lt!520413 (addStillContains!935 lt!520409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1158403 call!55654))

(assert (=> b!1158403 (= lt!520409 (+!3727 lt!520414 (tuple2!18639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!520419 () Unit!38021)

(assert (=> b!1158403 (= lt!520419 call!55653)))

(assert (=> b!1158403 (= e!658750 lt!520413)))

(declare-fun b!1158404 () Bool)

(declare-fun e!658744 () Bool)

(declare-fun arrayContainsKey!0 (array!74844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158404 (= e!658744 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!55653 () Bool)

(assert (=> bm!55653 (= call!55654 (contains!6770 (ite c!115432 lt!520409 call!55658) k0!934))))

(declare-fun mapIsEmpty!45386 () Bool)

(assert (=> mapIsEmpty!45386 mapRes!45386))

(declare-fun b!1158405 () Bool)

(declare-fun tp_is_empty!29041 () Bool)

(assert (=> b!1158405 (= e!658747 tp_is_empty!29041)))

(declare-fun bm!55654 () Bool)

(declare-fun lt!520407 () array!74846)

(assert (=> bm!55654 (= call!55657 (getCurrentListMapNoExtraKeys!4799 lt!520423 lt!520407 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158406 () Bool)

(assert (=> b!1158406 (= e!658741 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158407 () Bool)

(declare-fun res!769110 () Bool)

(assert (=> b!1158407 (=> (not res!769110) (not e!658748))))

(declare-datatypes ((List!25363 0))(
  ( (Nil!25360) (Cons!25359 (h!26568 (_ BitVec 64)) (t!36857 List!25363)) )
))
(declare-fun arrayNoDuplicates!0 (array!74844 (_ BitVec 32) List!25363) Bool)

(assert (=> b!1158407 (= res!769110 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25360))))

(declare-fun b!1158408 () Bool)

(declare-fun res!769108 () Bool)

(assert (=> b!1158408 (=> (not res!769108) (not e!658748))))

(assert (=> b!1158408 (= res!769108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1158409 () Bool)

(declare-fun e!658736 () Unit!38021)

(declare-fun Unit!38024 () Unit!38021)

(assert (=> b!1158409 (= e!658736 Unit!38024)))

(assert (=> b!1158409 (= lt!520422 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158409 (= c!115432 (and (not lt!520422) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520415 () Unit!38021)

(assert (=> b!1158409 (= lt!520415 e!658750)))

(declare-fun lt!520408 () Unit!38021)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!516 (array!74844 array!74846 (_ BitVec 32) (_ BitVec 32) V!43849 V!43849 (_ BitVec 64) (_ BitVec 32) Int) Unit!38021)

(assert (=> b!1158409 (= lt!520408 (lemmaListMapContainsThenArrayContainsFrom!516 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115431 () Bool)

(assert (=> b!1158409 (= c!115431 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769106 () Bool)

(assert (=> b!1158409 (= res!769106 e!658741)))

(assert (=> b!1158409 (=> (not res!769106) (not e!658744))))

(assert (=> b!1158409 e!658744))

(declare-fun lt!520411 () Unit!38021)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74844 (_ BitVec 32) (_ BitVec 32)) Unit!38021)

(assert (=> b!1158409 (= lt!520411 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1158409 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25360)))

(declare-fun lt!520421 () Unit!38021)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74844 (_ BitVec 64) (_ BitVec 32) List!25363) Unit!38021)

(assert (=> b!1158409 (= lt!520421 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25360))))

(assert (=> b!1158409 false))

(declare-fun b!1158410 () Bool)

(declare-fun res!769102 () Bool)

(assert (=> b!1158410 (=> (not res!769102) (not e!658748))))

(assert (=> b!1158410 (= res!769102 (and (= (size!36612 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36611 _keys!1208) (size!36612 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1158411 () Bool)

(assert (=> b!1158411 (= e!658743 e!658742)))

(declare-fun c!115433 () Bool)

(assert (=> b!1158411 (= c!115433 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520422))))

(declare-fun bm!55655 () Bool)

(assert (=> bm!55655 (= call!55656 call!55653)))

(declare-fun b!1158412 () Bool)

(declare-fun -!1374 (ListLongMap!16607 (_ BitVec 64)) ListLongMap!16607)

(assert (=> b!1158412 (= e!658751 (= call!55657 (-!1374 call!55655 k0!934)))))

(declare-fun b!1158413 () Bool)

(declare-fun e!658752 () Bool)

(declare-fun lt!520406 () ListLongMap!16607)

(assert (=> b!1158413 (= e!658752 (= lt!520406 (getCurrentListMapNoExtraKeys!4799 lt!520423 lt!520407 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158414 () Bool)

(declare-fun res!769104 () Bool)

(assert (=> b!1158414 (=> (not res!769104) (not e!658748))))

(assert (=> b!1158414 (= res!769104 (= (select (arr!36073 _keys!1208) i!673) k0!934))))

(declare-fun b!1158415 () Bool)

(declare-fun Unit!38025 () Unit!38021)

(assert (=> b!1158415 (= e!658736 Unit!38025)))

(declare-fun b!1158416 () Bool)

(declare-fun e!658739 () Bool)

(assert (=> b!1158416 (= e!658745 (not e!658739))))

(declare-fun res!769101 () Bool)

(assert (=> b!1158416 (=> res!769101 e!658739)))

(assert (=> b!1158416 (= res!769101 (bvsgt from!1455 i!673))))

(assert (=> b!1158416 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520412 () Unit!38021)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74844 (_ BitVec 64) (_ BitVec 32)) Unit!38021)

(assert (=> b!1158416 (= lt!520412 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1158417 () Bool)

(declare-fun res!769098 () Bool)

(assert (=> b!1158417 (=> (not res!769098) (not e!658745))))

(assert (=> b!1158417 (= res!769098 (arrayNoDuplicates!0 lt!520423 #b00000000000000000000000000000000 Nil!25360))))

(declare-fun mapNonEmpty!45386 () Bool)

(declare-fun tp!86244 () Bool)

(declare-fun e!658746 () Bool)

(assert (=> mapNonEmpty!45386 (= mapRes!45386 (and tp!86244 e!658746))))

(declare-fun mapRest!45386 () (Array (_ BitVec 32) ValueCell!13811))

(declare-fun mapKey!45386 () (_ BitVec 32))

(declare-fun mapValue!45386 () ValueCell!13811)

(assert (=> mapNonEmpty!45386 (= (arr!36074 _values!996) (store mapRest!45386 mapKey!45386 mapValue!45386))))

(declare-fun b!1158418 () Bool)

(assert (=> b!1158418 (= e!658739 e!658749)))

(declare-fun res!769109 () Bool)

(assert (=> b!1158418 (=> res!769109 e!658749)))

(assert (=> b!1158418 (= res!769109 (not (= from!1455 i!673)))))

(declare-fun lt!520425 () ListLongMap!16607)

(assert (=> b!1158418 (= lt!520425 (getCurrentListMapNoExtraKeys!4799 lt!520423 lt!520407 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520424 () V!43849)

(assert (=> b!1158418 (= lt!520407 (array!74847 (store (arr!36074 _values!996) i!673 (ValueCellFull!13811 lt!520424)) (size!36612 _values!996)))))

(declare-fun dynLambda!2748 (Int (_ BitVec 64)) V!43849)

(assert (=> b!1158418 (= lt!520424 (dynLambda!2748 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!520410 () ListLongMap!16607)

(assert (=> b!1158418 (= lt!520410 (getCurrentListMapNoExtraKeys!4799 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1158419 () Bool)

(declare-fun res!769112 () Bool)

(assert (=> b!1158419 (=> (not res!769112) (not e!658748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158419 (= res!769112 (validMask!0 mask!1564))))

(declare-fun b!1158420 () Bool)

(assert (=> b!1158420 call!55651))

(declare-fun lt!520405 () Unit!38021)

(assert (=> b!1158420 (= lt!520405 call!55656)))

(assert (=> b!1158420 (= e!658742 lt!520405)))

(declare-fun res!769105 () Bool)

(assert (=> start!98900 (=> (not res!769105) (not e!658748))))

(assert (=> start!98900 (= res!769105 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36611 _keys!1208))))))

(assert (=> start!98900 e!658748))

(assert (=> start!98900 tp_is_empty!29041))

(declare-fun array_inv!27716 (array!74844) Bool)

(assert (=> start!98900 (array_inv!27716 _keys!1208)))

(assert (=> start!98900 true))

(assert (=> start!98900 tp!86243))

(declare-fun array_inv!27717 (array!74846) Bool)

(assert (=> start!98900 (and (array_inv!27717 _values!996) e!658740)))

(declare-fun b!1158398 () Bool)

(declare-fun res!769099 () Bool)

(assert (=> b!1158398 (=> (not res!769099) (not e!658748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158398 (= res!769099 (validKeyInArray!0 k0!934))))

(declare-fun b!1158421 () Bool)

(assert (=> b!1158421 (= e!658746 tp_is_empty!29041)))

(declare-fun b!1158422 () Bool)

(assert (=> b!1158422 (= e!658738 true)))

(assert (=> b!1158422 e!658752))

(declare-fun res!769107 () Bool)

(assert (=> b!1158422 (=> (not res!769107) (not e!658752))))

(assert (=> b!1158422 (= res!769107 (= lt!520406 lt!520414))))

(assert (=> b!1158422 (= lt!520406 (-!1374 lt!520410 k0!934))))

(declare-fun lt!520420 () V!43849)

(assert (=> b!1158422 (= (-!1374 (+!3727 lt!520414 (tuple2!18639 (select (arr!36073 _keys!1208) from!1455) lt!520420)) (select (arr!36073 _keys!1208) from!1455)) lt!520414)))

(declare-fun lt!520404 () Unit!38021)

(declare-fun addThenRemoveForNewKeyIsSame!224 (ListLongMap!16607 (_ BitVec 64) V!43849) Unit!38021)

(assert (=> b!1158422 (= lt!520404 (addThenRemoveForNewKeyIsSame!224 lt!520414 (select (arr!36073 _keys!1208) from!1455) lt!520420))))

(declare-fun get!18408 (ValueCell!13811 V!43849) V!43849)

(assert (=> b!1158422 (= lt!520420 (get!18408 (select (arr!36074 _values!996) from!1455) lt!520424))))

(declare-fun lt!520416 () Unit!38021)

(assert (=> b!1158422 (= lt!520416 e!658736)))

(declare-fun c!115436 () Bool)

(assert (=> b!1158422 (= c!115436 (contains!6770 lt!520414 k0!934))))

(assert (=> b!1158422 (= lt!520414 (getCurrentListMapNoExtraKeys!4799 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158423 () Bool)

(declare-fun res!769100 () Bool)

(assert (=> b!1158423 (=> (not res!769100) (not e!658748))))

(assert (=> b!1158423 (= res!769100 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36611 _keys!1208))))))

(assert (= (and start!98900 res!769105) b!1158419))

(assert (= (and b!1158419 res!769112) b!1158410))

(assert (= (and b!1158410 res!769102) b!1158408))

(assert (= (and b!1158408 res!769108) b!1158407))

(assert (= (and b!1158407 res!769110) b!1158423))

(assert (= (and b!1158423 res!769100) b!1158398))

(assert (= (and b!1158398 res!769099) b!1158414))

(assert (= (and b!1158414 res!769104) b!1158395))

(assert (= (and b!1158395 res!769111) b!1158417))

(assert (= (and b!1158417 res!769098) b!1158416))

(assert (= (and b!1158416 (not res!769101)) b!1158418))

(assert (= (and b!1158418 (not res!769109)) b!1158399))

(assert (= (and b!1158399 c!115435) b!1158412))

(assert (= (and b!1158399 (not c!115435)) b!1158394))

(assert (= (or b!1158412 b!1158394) bm!55654))

(assert (= (or b!1158412 b!1158394) bm!55650))

(assert (= (and b!1158399 (not res!769103)) b!1158422))

(assert (= (and b!1158422 c!115436) b!1158409))

(assert (= (and b!1158422 (not c!115436)) b!1158415))

(assert (= (and b!1158409 c!115432) b!1158403))

(assert (= (and b!1158409 (not c!115432)) b!1158400))

(assert (= (and b!1158400 c!115434) b!1158401))

(assert (= (and b!1158400 (not c!115434)) b!1158411))

(assert (= (and b!1158411 c!115433) b!1158420))

(assert (= (and b!1158411 (not c!115433)) b!1158396))

(assert (= (or b!1158401 b!1158420) bm!55655))

(assert (= (or b!1158401 b!1158420) bm!55651))

(assert (= (or b!1158401 b!1158420) bm!55652))

(assert (= (or b!1158403 bm!55652) bm!55653))

(assert (= (or b!1158403 bm!55655) bm!55648))

(assert (= (or b!1158403 bm!55651) bm!55649))

(assert (= (and b!1158409 c!115431) b!1158406))

(assert (= (and b!1158409 (not c!115431)) b!1158402))

(assert (= (and b!1158409 res!769106) b!1158404))

(assert (= (and b!1158422 res!769107) b!1158413))

(assert (= (and b!1158397 condMapEmpty!45386) mapIsEmpty!45386))

(assert (= (and b!1158397 (not condMapEmpty!45386)) mapNonEmpty!45386))

(get-info :version)

(assert (= (and mapNonEmpty!45386 ((_ is ValueCellFull!13811) mapValue!45386)) b!1158421))

(assert (= (and b!1158397 ((_ is ValueCellFull!13811) mapDefault!45386)) b!1158405))

(assert (= start!98900 b!1158397))

(declare-fun b_lambda!19599 () Bool)

(assert (=> (not b_lambda!19599) (not b!1158418)))

(declare-fun t!36855 () Bool)

(declare-fun tb!9315 () Bool)

(assert (=> (and start!98900 (= defaultEntry!1004 defaultEntry!1004) t!36855) tb!9315))

(declare-fun result!19203 () Bool)

(assert (=> tb!9315 (= result!19203 tp_is_empty!29041)))

(assert (=> b!1158418 t!36855))

(declare-fun b_and!39851 () Bool)

(assert (= b_and!39849 (and (=> t!36855 result!19203) b_and!39851)))

(declare-fun m!1067115 () Bool)

(assert (=> b!1158406 m!1067115))

(declare-fun m!1067117 () Bool)

(assert (=> b!1158408 m!1067117))

(declare-fun m!1067119 () Bool)

(assert (=> b!1158419 m!1067119))

(declare-fun m!1067121 () Bool)

(assert (=> b!1158412 m!1067121))

(declare-fun m!1067123 () Bool)

(assert (=> bm!55649 m!1067123))

(declare-fun m!1067125 () Bool)

(assert (=> b!1158417 m!1067125))

(declare-fun m!1067127 () Bool)

(assert (=> b!1158409 m!1067127))

(declare-fun m!1067129 () Bool)

(assert (=> b!1158409 m!1067129))

(declare-fun m!1067131 () Bool)

(assert (=> b!1158409 m!1067131))

(declare-fun m!1067133 () Bool)

(assert (=> b!1158409 m!1067133))

(declare-fun m!1067135 () Bool)

(assert (=> b!1158407 m!1067135))

(declare-fun m!1067137 () Bool)

(assert (=> b!1158418 m!1067137))

(declare-fun m!1067139 () Bool)

(assert (=> b!1158418 m!1067139))

(declare-fun m!1067141 () Bool)

(assert (=> b!1158418 m!1067141))

(declare-fun m!1067143 () Bool)

(assert (=> b!1158418 m!1067143))

(declare-fun m!1067145 () Bool)

(assert (=> b!1158422 m!1067145))

(declare-fun m!1067147 () Bool)

(assert (=> b!1158422 m!1067147))

(declare-fun m!1067149 () Bool)

(assert (=> b!1158422 m!1067149))

(declare-fun m!1067151 () Bool)

(assert (=> b!1158422 m!1067151))

(declare-fun m!1067153 () Bool)

(assert (=> b!1158422 m!1067153))

(assert (=> b!1158422 m!1067153))

(assert (=> b!1158422 m!1067149))

(declare-fun m!1067155 () Bool)

(assert (=> b!1158422 m!1067155))

(declare-fun m!1067157 () Bool)

(assert (=> b!1158422 m!1067157))

(assert (=> b!1158422 m!1067147))

(declare-fun m!1067159 () Bool)

(assert (=> b!1158422 m!1067159))

(declare-fun m!1067161 () Bool)

(assert (=> b!1158422 m!1067161))

(assert (=> b!1158422 m!1067149))

(declare-fun m!1067163 () Bool)

(assert (=> b!1158414 m!1067163))

(declare-fun m!1067165 () Bool)

(assert (=> bm!55654 m!1067165))

(declare-fun m!1067167 () Bool)

(assert (=> bm!55648 m!1067167))

(declare-fun m!1067169 () Bool)

(assert (=> b!1158416 m!1067169))

(declare-fun m!1067171 () Bool)

(assert (=> b!1158416 m!1067171))

(declare-fun m!1067173 () Bool)

(assert (=> mapNonEmpty!45386 m!1067173))

(assert (=> b!1158413 m!1067165))

(assert (=> b!1158399 m!1067149))

(declare-fun m!1067175 () Bool)

(assert (=> b!1158399 m!1067175))

(assert (=> b!1158404 m!1067115))

(assert (=> bm!55650 m!1067145))

(declare-fun m!1067177 () Bool)

(assert (=> b!1158403 m!1067177))

(declare-fun m!1067179 () Bool)

(assert (=> b!1158403 m!1067179))

(declare-fun m!1067181 () Bool)

(assert (=> b!1158403 m!1067181))

(declare-fun m!1067183 () Bool)

(assert (=> b!1158395 m!1067183))

(declare-fun m!1067185 () Bool)

(assert (=> b!1158395 m!1067185))

(declare-fun m!1067187 () Bool)

(assert (=> start!98900 m!1067187))

(declare-fun m!1067189 () Bool)

(assert (=> start!98900 m!1067189))

(declare-fun m!1067191 () Bool)

(assert (=> bm!55653 m!1067191))

(declare-fun m!1067193 () Bool)

(assert (=> b!1158398 m!1067193))

(check-sat (not b_next!24511) (not bm!55648) (not bm!55650) (not b!1158416) b_and!39851 (not b!1158419) (not b!1158399) (not b!1158407) (not b!1158406) (not b!1158403) (not b!1158408) (not b!1158412) (not b!1158417) (not bm!55649) (not b_lambda!19599) (not b!1158395) (not mapNonEmpty!45386) (not start!98900) (not b!1158418) (not b!1158404) (not b!1158422) (not b!1158413) (not b!1158398) tp_is_empty!29041 (not bm!55654) (not b!1158409) (not bm!55653))
(check-sat b_and!39851 (not b_next!24511))
