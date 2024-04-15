; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98702 () Bool)

(assert start!98702)

(declare-fun b_free!24313 () Bool)

(declare-fun b_next!24313 () Bool)

(assert (=> start!98702 (= b_free!24313 (not b_next!24313))))

(declare-fun tp!85649 () Bool)

(declare-fun b_and!39453 () Bool)

(assert (=> start!98702 (= tp!85649 b_and!39453)))

(declare-fun b!1149286 () Bool)

(declare-fun e!653689 () Bool)

(declare-fun e!653698 () Bool)

(assert (=> b!1149286 (= e!653689 (not e!653698))))

(declare-fun res!764653 () Bool)

(assert (=> b!1149286 (=> res!764653 e!653698)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149286 (= res!764653 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74454 0))(
  ( (array!74455 (arr!35878 (Array (_ BitVec 32) (_ BitVec 64))) (size!36416 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74454)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149286 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37620 0))(
  ( (Unit!37621) )
))
(declare-fun lt!513870 () Unit!37620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74454 (_ BitVec 64) (_ BitVec 32)) Unit!37620)

(assert (=> b!1149286 (= lt!513870 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1149287 () Bool)

(declare-fun e!653695 () Unit!37620)

(declare-fun Unit!37622 () Unit!37620)

(assert (=> b!1149287 (= e!653695 Unit!37622)))

(declare-fun b!1149288 () Bool)

(declare-fun e!653687 () Bool)

(declare-fun tp_is_empty!28843 () Bool)

(assert (=> b!1149288 (= e!653687 tp_is_empty!28843)))

(declare-fun res!764655 () Bool)

(declare-fun e!653694 () Bool)

(assert (=> start!98702 (=> (not res!764655) (not e!653694))))

(assert (=> start!98702 (= res!764655 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36416 _keys!1208))))))

(assert (=> start!98702 e!653694))

(assert (=> start!98702 tp_is_empty!28843))

(declare-fun array_inv!27572 (array!74454) Bool)

(assert (=> start!98702 (array_inv!27572 _keys!1208)))

(assert (=> start!98702 true))

(assert (=> start!98702 tp!85649))

(declare-datatypes ((V!43585 0))(
  ( (V!43586 (val!14478 Int)) )
))
(declare-datatypes ((ValueCell!13712 0))(
  ( (ValueCellFull!13712 (v!17114 V!43585)) (EmptyCell!13712) )
))
(declare-datatypes ((array!74456 0))(
  ( (array!74457 (arr!35879 (Array (_ BitVec 32) ValueCell!13712)) (size!36417 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74456)

(declare-fun e!653697 () Bool)

(declare-fun array_inv!27573 (array!74456) Bool)

(assert (=> start!98702 (and (array_inv!27573 _values!996) e!653697)))

(declare-fun bm!53272 () Bool)

(declare-fun call!53281 () Bool)

(declare-fun call!53278 () Bool)

(assert (=> bm!53272 (= call!53281 call!53278)))

(declare-fun zeroValue!944 () V!43585)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43585)

(declare-datatypes ((tuple2!18448 0))(
  ( (tuple2!18449 (_1!9235 (_ BitVec 64)) (_2!9235 V!43585)) )
))
(declare-datatypes ((List!25183 0))(
  ( (Nil!25180) (Cons!25179 (h!26388 tuple2!18448) (t!36479 List!25183)) )
))
(declare-datatypes ((ListLongMap!16417 0))(
  ( (ListLongMap!16418 (toList!8224 List!25183)) )
))
(declare-fun call!53276 () ListLongMap!16417)

(declare-fun bm!53273 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4708 (array!74454 array!74456 (_ BitVec 32) (_ BitVec 32) V!43585 V!43585 (_ BitVec 32) Int) ListLongMap!16417)

(assert (=> bm!53273 (= call!53276 (getCurrentListMapNoExtraKeys!4708 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149289 () Bool)

(declare-fun e!653700 () Bool)

(declare-fun e!653691 () Bool)

(assert (=> b!1149289 (= e!653700 e!653691)))

(declare-fun res!764646 () Bool)

(assert (=> b!1149289 (=> res!764646 e!653691)))

(assert (=> b!1149289 (= res!764646 (not (= (select (arr!35878 _keys!1208) from!1455) k0!934)))))

(declare-fun e!653702 () Bool)

(assert (=> b!1149289 e!653702))

(declare-fun c!113652 () Bool)

(assert (=> b!1149289 (= c!113652 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513891 () Unit!37620)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!569 (array!74454 array!74456 (_ BitVec 32) (_ BitVec 32) V!43585 V!43585 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37620)

(assert (=> b!1149289 (= lt!513891 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!53279 () ListLongMap!16417)

(declare-fun lt!513890 () array!74454)

(declare-fun lt!513875 () array!74456)

(declare-fun bm!53274 () Bool)

(assert (=> bm!53274 (= call!53279 (getCurrentListMapNoExtraKeys!4708 lt!513890 lt!513875 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149290 () Bool)

(declare-fun mapRes!45089 () Bool)

(assert (=> b!1149290 (= e!653697 (and e!653687 mapRes!45089))))

(declare-fun condMapEmpty!45089 () Bool)

(declare-fun mapDefault!45089 () ValueCell!13712)

(assert (=> b!1149290 (= condMapEmpty!45089 (= (arr!35879 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13712)) mapDefault!45089)))))

(declare-fun b!1149291 () Bool)

(declare-fun res!764654 () Bool)

(assert (=> b!1149291 (=> (not res!764654) (not e!653694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149291 (= res!764654 (validMask!0 mask!1564))))

(declare-fun b!1149292 () Bool)

(declare-fun e!653696 () Unit!37620)

(declare-fun lt!513874 () Unit!37620)

(assert (=> b!1149292 (= e!653696 lt!513874)))

(declare-fun call!53282 () Unit!37620)

(assert (=> b!1149292 (= lt!513874 call!53282)))

(assert (=> b!1149292 call!53281))

(declare-fun lt!513879 () ListLongMap!16417)

(declare-fun call!53277 () ListLongMap!16417)

(declare-fun bm!53275 () Bool)

(declare-fun lt!513886 () ListLongMap!16417)

(declare-fun c!113654 () Bool)

(declare-fun c!113650 () Bool)

(declare-fun +!3641 (ListLongMap!16417 tuple2!18448) ListLongMap!16417)

(assert (=> bm!53275 (= call!53277 (+!3641 (ite c!113654 lt!513886 lt!513879) (ite c!113654 (tuple2!18449 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113650 (tuple2!18449 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18449 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapIsEmpty!45089 () Bool)

(assert (=> mapIsEmpty!45089 mapRes!45089))

(declare-fun e!653690 () Bool)

(declare-fun b!1149293 () Bool)

(declare-fun lt!513887 () ListLongMap!16417)

(assert (=> b!1149293 (= e!653690 (= lt!513887 (getCurrentListMapNoExtraKeys!4708 lt!513890 lt!513875 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun lt!513880 () Bool)

(declare-fun b!1149294 () Bool)

(declare-fun e!653703 () Bool)

(assert (=> b!1149294 (= e!653703 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513880) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!45089 () Bool)

(declare-fun tp!85650 () Bool)

(declare-fun e!653693 () Bool)

(assert (=> mapNonEmpty!45089 (= mapRes!45089 (and tp!85650 e!653693))))

(declare-fun mapRest!45089 () (Array (_ BitVec 32) ValueCell!13712))

(declare-fun mapKey!45089 () (_ BitVec 32))

(declare-fun mapValue!45089 () ValueCell!13712)

(assert (=> mapNonEmpty!45089 (= (arr!35879 _values!996) (store mapRest!45089 mapKey!45089 mapValue!45089))))

(declare-fun b!1149295 () Bool)

(assert (=> b!1149295 (= e!653694 e!653689)))

(declare-fun res!764656 () Bool)

(assert (=> b!1149295 (=> (not res!764656) (not e!653689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74454 (_ BitVec 32)) Bool)

(assert (=> b!1149295 (= res!764656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513890 mask!1564))))

(assert (=> b!1149295 (= lt!513890 (array!74455 (store (arr!35878 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36416 _keys!1208)))))

(declare-fun b!1149296 () Bool)

(assert (=> b!1149296 (= e!653702 (= call!53279 call!53276))))

(declare-fun b!1149297 () Bool)

(assert (=> b!1149297 (= e!653691 true)))

(assert (=> b!1149297 e!653690))

(declare-fun res!764643 () Bool)

(assert (=> b!1149297 (=> (not res!764643) (not e!653690))))

(assert (=> b!1149297 (= res!764643 (= lt!513887 lt!513879))))

(declare-fun lt!513883 () ListLongMap!16417)

(declare-fun -!1293 (ListLongMap!16417 (_ BitVec 64)) ListLongMap!16417)

(assert (=> b!1149297 (= lt!513887 (-!1293 lt!513883 k0!934))))

(declare-fun lt!513877 () V!43585)

(assert (=> b!1149297 (= (-!1293 (+!3641 lt!513879 (tuple2!18449 (select (arr!35878 _keys!1208) from!1455) lt!513877)) (select (arr!35878 _keys!1208) from!1455)) lt!513879)))

(declare-fun lt!513888 () Unit!37620)

(declare-fun addThenRemoveForNewKeyIsSame!152 (ListLongMap!16417 (_ BitVec 64) V!43585) Unit!37620)

(assert (=> b!1149297 (= lt!513888 (addThenRemoveForNewKeyIsSame!152 lt!513879 (select (arr!35878 _keys!1208) from!1455) lt!513877))))

(declare-fun lt!513884 () V!43585)

(declare-fun get!18270 (ValueCell!13712 V!43585) V!43585)

(assert (=> b!1149297 (= lt!513877 (get!18270 (select (arr!35879 _values!996) from!1455) lt!513884))))

(declare-fun lt!513885 () Unit!37620)

(assert (=> b!1149297 (= lt!513885 e!653695)))

(declare-fun c!113653 () Bool)

(declare-fun contains!6682 (ListLongMap!16417 (_ BitVec 64)) Bool)

(assert (=> b!1149297 (= c!113653 (contains!6682 lt!513879 k0!934))))

(assert (=> b!1149297 (= lt!513879 (getCurrentListMapNoExtraKeys!4708 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53276 () Bool)

(declare-fun call!53275 () Unit!37620)

(assert (=> bm!53276 (= call!53282 call!53275)))

(declare-fun b!1149298 () Bool)

(declare-fun Unit!37623 () Unit!37620)

(assert (=> b!1149298 (= e!653695 Unit!37623)))

(assert (=> b!1149298 (= lt!513880 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149298 (= c!113654 (and (not lt!513880) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513873 () Unit!37620)

(declare-fun e!653701 () Unit!37620)

(assert (=> b!1149298 (= lt!513873 e!653701)))

(declare-fun lt!513876 () Unit!37620)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!444 (array!74454 array!74456 (_ BitVec 32) (_ BitVec 32) V!43585 V!43585 (_ BitVec 64) (_ BitVec 32) Int) Unit!37620)

(assert (=> b!1149298 (= lt!513876 (lemmaListMapContainsThenArrayContainsFrom!444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113651 () Bool)

(assert (=> b!1149298 (= c!113651 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764657 () Bool)

(assert (=> b!1149298 (= res!764657 e!653703)))

(declare-fun e!653688 () Bool)

(assert (=> b!1149298 (=> (not res!764657) (not e!653688))))

(assert (=> b!1149298 e!653688))

(declare-fun lt!513882 () Unit!37620)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74454 (_ BitVec 32) (_ BitVec 32)) Unit!37620)

(assert (=> b!1149298 (= lt!513882 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25184 0))(
  ( (Nil!25181) (Cons!25180 (h!26389 (_ BitVec 64)) (t!36480 List!25184)) )
))
(declare-fun arrayNoDuplicates!0 (array!74454 (_ BitVec 32) List!25184) Bool)

(assert (=> b!1149298 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25181)))

(declare-fun lt!513878 () Unit!37620)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74454 (_ BitVec 64) (_ BitVec 32) List!25184) Unit!37620)

(assert (=> b!1149298 (= lt!513878 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25181))))

(assert (=> b!1149298 false))

(declare-fun b!1149299 () Bool)

(declare-fun res!764645 () Bool)

(assert (=> b!1149299 (=> (not res!764645) (not e!653694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149299 (= res!764645 (validKeyInArray!0 k0!934))))

(declare-fun b!1149300 () Bool)

(declare-fun res!764652 () Bool)

(assert (=> b!1149300 (=> (not res!764652) (not e!653694))))

(assert (=> b!1149300 (= res!764652 (and (= (size!36417 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36416 _keys!1208) (size!36417 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!53280 () ListLongMap!16417)

(declare-fun bm!53277 () Bool)

(assert (=> bm!53277 (= call!53278 (contains!6682 (ite c!113654 lt!513886 call!53280) k0!934))))

(declare-fun b!1149301 () Bool)

(declare-fun res!764650 () Bool)

(assert (=> b!1149301 (=> (not res!764650) (not e!653689))))

(assert (=> b!1149301 (= res!764650 (arrayNoDuplicates!0 lt!513890 #b00000000000000000000000000000000 Nil!25181))))

(declare-fun b!1149302 () Bool)

(assert (=> b!1149302 call!53281))

(declare-fun lt!513872 () Unit!37620)

(assert (=> b!1149302 (= lt!513872 call!53282)))

(declare-fun e!653699 () Unit!37620)

(assert (=> b!1149302 (= e!653699 lt!513872)))

(declare-fun b!1149303 () Bool)

(declare-fun res!764644 () Bool)

(assert (=> b!1149303 (=> (not res!764644) (not e!653694))))

(assert (=> b!1149303 (= res!764644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1149304 () Bool)

(assert (=> b!1149304 (= c!113650 (and (not lt!513880) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149304 (= e!653701 e!653696)))

(declare-fun b!1149305 () Bool)

(assert (=> b!1149305 (= e!653696 e!653699)))

(declare-fun c!113649 () Bool)

(assert (=> b!1149305 (= c!113649 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513880))))

(declare-fun b!1149306 () Bool)

(assert (=> b!1149306 (= e!653703 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53278 () Bool)

(declare-fun addStillContains!852 (ListLongMap!16417 (_ BitVec 64) V!43585 (_ BitVec 64)) Unit!37620)

(assert (=> bm!53278 (= call!53275 (addStillContains!852 (ite c!113654 lt!513886 lt!513879) (ite c!113654 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113650 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113654 minValue!944 (ite c!113650 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1149307 () Bool)

(declare-fun Unit!37624 () Unit!37620)

(assert (=> b!1149307 (= e!653699 Unit!37624)))

(declare-fun b!1149308 () Bool)

(assert (=> b!1149308 (= e!653702 (= call!53279 (-!1293 call!53276 k0!934)))))

(declare-fun b!1149309 () Bool)

(assert (=> b!1149309 (= e!653688 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149310 () Bool)

(declare-fun res!764651 () Bool)

(assert (=> b!1149310 (=> (not res!764651) (not e!653694))))

(assert (=> b!1149310 (= res!764651 (= (select (arr!35878 _keys!1208) i!673) k0!934))))

(declare-fun b!1149311 () Bool)

(assert (=> b!1149311 (contains!6682 call!53277 k0!934)))

(declare-fun lt!513881 () Unit!37620)

(assert (=> b!1149311 (= lt!513881 call!53275)))

(assert (=> b!1149311 call!53278))

(assert (=> b!1149311 (= lt!513886 (+!3641 lt!513879 (tuple2!18449 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!513889 () Unit!37620)

(assert (=> b!1149311 (= lt!513889 (addStillContains!852 lt!513879 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1149311 (= e!653701 lt!513881)))

(declare-fun bm!53279 () Bool)

(assert (=> bm!53279 (= call!53280 call!53277)))

(declare-fun b!1149312 () Bool)

(declare-fun res!764648 () Bool)

(assert (=> b!1149312 (=> (not res!764648) (not e!653694))))

(assert (=> b!1149312 (= res!764648 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25181))))

(declare-fun b!1149313 () Bool)

(assert (=> b!1149313 (= e!653693 tp_is_empty!28843)))

(declare-fun b!1149314 () Bool)

(assert (=> b!1149314 (= e!653698 e!653700)))

(declare-fun res!764647 () Bool)

(assert (=> b!1149314 (=> res!764647 e!653700)))

(assert (=> b!1149314 (= res!764647 (not (= from!1455 i!673)))))

(declare-fun lt!513871 () ListLongMap!16417)

(assert (=> b!1149314 (= lt!513871 (getCurrentListMapNoExtraKeys!4708 lt!513890 lt!513875 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1149314 (= lt!513875 (array!74457 (store (arr!35879 _values!996) i!673 (ValueCellFull!13712 lt!513884)) (size!36417 _values!996)))))

(declare-fun dynLambda!2675 (Int (_ BitVec 64)) V!43585)

(assert (=> b!1149314 (= lt!513884 (dynLambda!2675 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1149314 (= lt!513883 (getCurrentListMapNoExtraKeys!4708 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1149315 () Bool)

(declare-fun res!764649 () Bool)

(assert (=> b!1149315 (=> (not res!764649) (not e!653694))))

(assert (=> b!1149315 (= res!764649 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36416 _keys!1208))))))

(assert (= (and start!98702 res!764655) b!1149291))

(assert (= (and b!1149291 res!764654) b!1149300))

(assert (= (and b!1149300 res!764652) b!1149303))

(assert (= (and b!1149303 res!764644) b!1149312))

(assert (= (and b!1149312 res!764648) b!1149315))

(assert (= (and b!1149315 res!764649) b!1149299))

(assert (= (and b!1149299 res!764645) b!1149310))

(assert (= (and b!1149310 res!764651) b!1149295))

(assert (= (and b!1149295 res!764656) b!1149301))

(assert (= (and b!1149301 res!764650) b!1149286))

(assert (= (and b!1149286 (not res!764653)) b!1149314))

(assert (= (and b!1149314 (not res!764647)) b!1149289))

(assert (= (and b!1149289 c!113652) b!1149308))

(assert (= (and b!1149289 (not c!113652)) b!1149296))

(assert (= (or b!1149308 b!1149296) bm!53274))

(assert (= (or b!1149308 b!1149296) bm!53273))

(assert (= (and b!1149289 (not res!764646)) b!1149297))

(assert (= (and b!1149297 c!113653) b!1149298))

(assert (= (and b!1149297 (not c!113653)) b!1149287))

(assert (= (and b!1149298 c!113654) b!1149311))

(assert (= (and b!1149298 (not c!113654)) b!1149304))

(assert (= (and b!1149304 c!113650) b!1149292))

(assert (= (and b!1149304 (not c!113650)) b!1149305))

(assert (= (and b!1149305 c!113649) b!1149302))

(assert (= (and b!1149305 (not c!113649)) b!1149307))

(assert (= (or b!1149292 b!1149302) bm!53276))

(assert (= (or b!1149292 b!1149302) bm!53279))

(assert (= (or b!1149292 b!1149302) bm!53272))

(assert (= (or b!1149311 bm!53272) bm!53277))

(assert (= (or b!1149311 bm!53276) bm!53278))

(assert (= (or b!1149311 bm!53279) bm!53275))

(assert (= (and b!1149298 c!113651) b!1149306))

(assert (= (and b!1149298 (not c!113651)) b!1149294))

(assert (= (and b!1149298 res!764657) b!1149309))

(assert (= (and b!1149297 res!764643) b!1149293))

(assert (= (and b!1149290 condMapEmpty!45089) mapIsEmpty!45089))

(assert (= (and b!1149290 (not condMapEmpty!45089)) mapNonEmpty!45089))

(get-info :version)

(assert (= (and mapNonEmpty!45089 ((_ is ValueCellFull!13712) mapValue!45089)) b!1149313))

(assert (= (and b!1149290 ((_ is ValueCellFull!13712) mapDefault!45089)) b!1149288))

(assert (= start!98702 b!1149290))

(declare-fun b_lambda!19401 () Bool)

(assert (=> (not b_lambda!19401) (not b!1149314)))

(declare-fun t!36478 () Bool)

(declare-fun tb!9117 () Bool)

(assert (=> (and start!98702 (= defaultEntry!1004 defaultEntry!1004) t!36478) tb!9117))

(declare-fun result!18807 () Bool)

(assert (=> tb!9117 (= result!18807 tp_is_empty!28843)))

(assert (=> b!1149314 t!36478))

(declare-fun b_and!39455 () Bool)

(assert (= b_and!39453 (and (=> t!36478 result!18807) b_and!39455)))

(declare-fun m!1059183 () Bool)

(assert (=> b!1149297 m!1059183))

(declare-fun m!1059185 () Bool)

(assert (=> b!1149297 m!1059185))

(declare-fun m!1059187 () Bool)

(assert (=> b!1149297 m!1059187))

(assert (=> b!1149297 m!1059187))

(declare-fun m!1059189 () Bool)

(assert (=> b!1149297 m!1059189))

(declare-fun m!1059191 () Bool)

(assert (=> b!1149297 m!1059191))

(declare-fun m!1059193 () Bool)

(assert (=> b!1149297 m!1059193))

(declare-fun m!1059195 () Bool)

(assert (=> b!1149297 m!1059195))

(assert (=> b!1149297 m!1059191))

(declare-fun m!1059197 () Bool)

(assert (=> b!1149297 m!1059197))

(assert (=> b!1149297 m!1059191))

(assert (=> b!1149297 m!1059195))

(declare-fun m!1059199 () Bool)

(assert (=> b!1149297 m!1059199))

(declare-fun m!1059201 () Bool)

(assert (=> b!1149298 m!1059201))

(declare-fun m!1059203 () Bool)

(assert (=> b!1149298 m!1059203))

(declare-fun m!1059205 () Bool)

(assert (=> b!1149298 m!1059205))

(declare-fun m!1059207 () Bool)

(assert (=> b!1149298 m!1059207))

(declare-fun m!1059209 () Bool)

(assert (=> bm!53274 m!1059209))

(declare-fun m!1059211 () Bool)

(assert (=> b!1149306 m!1059211))

(assert (=> b!1149309 m!1059211))

(declare-fun m!1059213 () Bool)

(assert (=> bm!53278 m!1059213))

(declare-fun m!1059215 () Bool)

(assert (=> b!1149291 m!1059215))

(declare-fun m!1059217 () Bool)

(assert (=> bm!53277 m!1059217))

(declare-fun m!1059219 () Bool)

(assert (=> b!1149299 m!1059219))

(declare-fun m!1059221 () Bool)

(assert (=> b!1149310 m!1059221))

(declare-fun m!1059223 () Bool)

(assert (=> b!1149312 m!1059223))

(declare-fun m!1059225 () Bool)

(assert (=> b!1149303 m!1059225))

(declare-fun m!1059227 () Bool)

(assert (=> start!98702 m!1059227))

(declare-fun m!1059229 () Bool)

(assert (=> start!98702 m!1059229))

(declare-fun m!1059231 () Bool)

(assert (=> b!1149311 m!1059231))

(declare-fun m!1059233 () Bool)

(assert (=> b!1149311 m!1059233))

(declare-fun m!1059235 () Bool)

(assert (=> b!1149311 m!1059235))

(declare-fun m!1059237 () Bool)

(assert (=> b!1149295 m!1059237))

(declare-fun m!1059239 () Bool)

(assert (=> b!1149295 m!1059239))

(declare-fun m!1059241 () Bool)

(assert (=> mapNonEmpty!45089 m!1059241))

(assert (=> bm!53273 m!1059185))

(declare-fun m!1059243 () Bool)

(assert (=> b!1149301 m!1059243))

(assert (=> b!1149289 m!1059191))

(declare-fun m!1059245 () Bool)

(assert (=> b!1149289 m!1059245))

(assert (=> b!1149293 m!1059209))

(declare-fun m!1059247 () Bool)

(assert (=> b!1149314 m!1059247))

(declare-fun m!1059249 () Bool)

(assert (=> b!1149314 m!1059249))

(declare-fun m!1059251 () Bool)

(assert (=> b!1149314 m!1059251))

(declare-fun m!1059253 () Bool)

(assert (=> b!1149314 m!1059253))

(declare-fun m!1059255 () Bool)

(assert (=> bm!53275 m!1059255))

(declare-fun m!1059257 () Bool)

(assert (=> b!1149286 m!1059257))

(declare-fun m!1059259 () Bool)

(assert (=> b!1149286 m!1059259))

(declare-fun m!1059261 () Bool)

(assert (=> b!1149308 m!1059261))

(check-sat (not start!98702) (not b!1149306) (not b!1149311) (not b!1149291) (not bm!53273) (not bm!53275) (not b!1149286) (not b!1149303) (not b!1149293) (not b_next!24313) (not b!1149289) tp_is_empty!28843 (not b!1149295) (not b!1149297) (not mapNonEmpty!45089) (not bm!53274) (not bm!53277) (not b!1149301) (not b!1149312) (not b_lambda!19401) (not b!1149299) b_and!39455 (not b!1149309) (not b!1149298) (not b!1149308) (not bm!53278) (not b!1149314))
(check-sat b_and!39455 (not b_next!24313))
