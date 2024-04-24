; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98980 () Bool)

(assert start!98980)

(declare-fun b_free!24349 () Bool)

(declare-fun b_next!24349 () Bool)

(assert (=> start!98980 (= b_free!24349 (not b_next!24349))))

(declare-fun tp!85757 () Bool)

(declare-fun b_and!39549 () Bool)

(assert (=> start!98980 (= tp!85757 b_and!39549)))

(declare-fun b!1152355 () Bool)

(declare-datatypes ((Unit!37840 0))(
  ( (Unit!37841) )
))
(declare-fun e!655516 () Unit!37840)

(declare-fun Unit!37842 () Unit!37840)

(assert (=> b!1152355 (= e!655516 Unit!37842)))

(declare-datatypes ((array!74651 0))(
  ( (array!74652 (arr!35970 (Array (_ BitVec 32) (_ BitVec 64))) (size!36507 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74651)

(declare-fun b!1152356 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!655530 () Bool)

(declare-fun arrayContainsKey!0 (array!74651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152356 (= e!655530 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53792 () Bool)

(declare-fun call!53802 () Bool)

(declare-datatypes ((V!43633 0))(
  ( (V!43634 (val!14496 Int)) )
))
(declare-datatypes ((tuple2!18418 0))(
  ( (tuple2!18419 (_1!9220 (_ BitVec 64)) (_2!9220 V!43633)) )
))
(declare-datatypes ((List!25171 0))(
  ( (Nil!25168) (Cons!25167 (h!26385 tuple2!18418) (t!36504 List!25171)) )
))
(declare-datatypes ((ListLongMap!16395 0))(
  ( (ListLongMap!16396 (toList!8213 List!25171)) )
))
(declare-fun call!53797 () ListLongMap!16395)

(declare-fun lt!515745 () ListLongMap!16395)

(declare-fun c!114401 () Bool)

(declare-fun contains!6748 (ListLongMap!16395 (_ BitVec 64)) Bool)

(assert (=> bm!53792 (= call!53802 (contains!6748 (ite c!114401 lt!515745 call!53797) k0!934))))

(declare-fun mapIsEmpty!45143 () Bool)

(declare-fun mapRes!45143 () Bool)

(assert (=> mapIsEmpty!45143 mapRes!45143))

(declare-fun b!1152357 () Bool)

(declare-fun e!655517 () Bool)

(declare-fun call!53800 () ListLongMap!16395)

(declare-fun call!53795 () ListLongMap!16395)

(assert (=> b!1152357 (= e!655517 (= call!53800 call!53795))))

(declare-fun b!1152358 () Bool)

(declare-fun e!655523 () Bool)

(declare-fun e!655528 () Bool)

(assert (=> b!1152358 (= e!655523 e!655528)))

(declare-fun res!766041 () Bool)

(assert (=> b!1152358 (=> (not res!766041) (not e!655528))))

(declare-fun lt!515743 () array!74651)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74651 (_ BitVec 32)) Bool)

(assert (=> b!1152358 (= res!766041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515743 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152358 (= lt!515743 (array!74652 (store (arr!35970 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36507 _keys!1208)))))

(declare-fun b!1152359 () Bool)

(declare-fun c!114398 () Bool)

(declare-fun lt!515747 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1152359 (= c!114398 (and (not lt!515747) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655531 () Unit!37840)

(declare-fun e!655519 () Unit!37840)

(assert (=> b!1152359 (= e!655531 e!655519)))

(declare-fun b!1152360 () Bool)

(declare-fun Unit!37843 () Unit!37840)

(assert (=> b!1152360 (= e!655516 Unit!37843)))

(assert (=> b!1152360 (= lt!515747 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152360 (= c!114401 (and (not lt!515747) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515740 () Unit!37840)

(assert (=> b!1152360 (= lt!515740 e!655531)))

(declare-fun zeroValue!944 () V!43633)

(declare-fun lt!515748 () Unit!37840)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13730 0))(
  ( (ValueCellFull!13730 (v!17129 V!43633)) (EmptyCell!13730) )
))
(declare-datatypes ((array!74653 0))(
  ( (array!74654 (arr!35971 (Array (_ BitVec 32) ValueCell!13730)) (size!36508 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74653)

(declare-fun minValue!944 () V!43633)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!468 (array!74651 array!74653 (_ BitVec 32) (_ BitVec 32) V!43633 V!43633 (_ BitVec 64) (_ BitVec 32) Int) Unit!37840)

(assert (=> b!1152360 (= lt!515748 (lemmaListMapContainsThenArrayContainsFrom!468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114399 () Bool)

(assert (=> b!1152360 (= c!114399 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766038 () Bool)

(assert (=> b!1152360 (= res!766038 e!655530)))

(declare-fun e!655522 () Bool)

(assert (=> b!1152360 (=> (not res!766038) (not e!655522))))

(assert (=> b!1152360 e!655522))

(declare-fun lt!515752 () Unit!37840)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74651 (_ BitVec 32) (_ BitVec 32)) Unit!37840)

(assert (=> b!1152360 (= lt!515752 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25172 0))(
  ( (Nil!25169) (Cons!25168 (h!26386 (_ BitVec 64)) (t!36505 List!25172)) )
))
(declare-fun arrayNoDuplicates!0 (array!74651 (_ BitVec 32) List!25172) Bool)

(assert (=> b!1152360 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25169)))

(declare-fun lt!515735 () Unit!37840)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74651 (_ BitVec 64) (_ BitVec 32) List!25172) Unit!37840)

(assert (=> b!1152360 (= lt!515735 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25169))))

(assert (=> b!1152360 false))

(declare-fun bm!53793 () Bool)

(declare-fun call!53796 () Unit!37840)

(declare-fun call!53798 () Unit!37840)

(assert (=> bm!53793 (= call!53796 call!53798)))

(declare-fun b!1152361 () Bool)

(declare-fun e!655524 () Bool)

(declare-fun tp_is_empty!28879 () Bool)

(assert (=> b!1152361 (= e!655524 tp_is_empty!28879)))

(declare-fun lt!515753 () ListLongMap!16395)

(declare-fun lt!515741 () array!74653)

(declare-fun b!1152362 () Bool)

(declare-fun e!655521 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4713 (array!74651 array!74653 (_ BitVec 32) (_ BitVec 32) V!43633 V!43633 (_ BitVec 32) Int) ListLongMap!16395)

(assert (=> b!1152362 (= e!655521 (= lt!515753 (getCurrentListMapNoExtraKeys!4713 lt!515743 lt!515741 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53794 () Bool)

(assert (=> bm!53794 (= call!53800 (getCurrentListMapNoExtraKeys!4713 lt!515743 lt!515741 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152364 () Bool)

(declare-fun res!766037 () Bool)

(assert (=> b!1152364 (=> (not res!766037) (not e!655523))))

(assert (=> b!1152364 (= res!766037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!515755 () ListLongMap!16395)

(declare-fun call!53799 () ListLongMap!16395)

(declare-fun bm!53795 () Bool)

(declare-fun +!3651 (ListLongMap!16395 tuple2!18418) ListLongMap!16395)

(assert (=> bm!53795 (= call!53799 (+!3651 (ite c!114401 lt!515745 lt!515755) (ite c!114401 (tuple2!18419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114398 (tuple2!18419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1152365 () Bool)

(declare-fun call!53801 () Bool)

(assert (=> b!1152365 call!53801))

(declare-fun lt!515736 () Unit!37840)

(assert (=> b!1152365 (= lt!515736 call!53796)))

(declare-fun e!655527 () Unit!37840)

(assert (=> b!1152365 (= e!655527 lt!515736)))

(declare-fun b!1152366 () Bool)

(declare-fun e!655529 () Bool)

(assert (=> b!1152366 (= e!655529 true)))

(assert (=> b!1152366 e!655521))

(declare-fun res!766034 () Bool)

(assert (=> b!1152366 (=> (not res!766034) (not e!655521))))

(assert (=> b!1152366 (= res!766034 (= lt!515753 lt!515755))))

(declare-fun lt!515737 () ListLongMap!16395)

(declare-fun -!1333 (ListLongMap!16395 (_ BitVec 64)) ListLongMap!16395)

(assert (=> b!1152366 (= lt!515753 (-!1333 lt!515737 k0!934))))

(declare-fun lt!515749 () V!43633)

(assert (=> b!1152366 (= (-!1333 (+!3651 lt!515755 (tuple2!18419 (select (arr!35970 _keys!1208) from!1455) lt!515749)) (select (arr!35970 _keys!1208) from!1455)) lt!515755)))

(declare-fun lt!515751 () Unit!37840)

(declare-fun addThenRemoveForNewKeyIsSame!180 (ListLongMap!16395 (_ BitVec 64) V!43633) Unit!37840)

(assert (=> b!1152366 (= lt!515751 (addThenRemoveForNewKeyIsSame!180 lt!515755 (select (arr!35970 _keys!1208) from!1455) lt!515749))))

(declare-fun lt!515746 () V!43633)

(declare-fun get!18341 (ValueCell!13730 V!43633) V!43633)

(assert (=> b!1152366 (= lt!515749 (get!18341 (select (arr!35971 _values!996) from!1455) lt!515746))))

(declare-fun lt!515738 () Unit!37840)

(assert (=> b!1152366 (= lt!515738 e!655516)))

(declare-fun c!114397 () Bool)

(assert (=> b!1152366 (= c!114397 (contains!6748 lt!515755 k0!934))))

(assert (=> b!1152366 (= lt!515755 (getCurrentListMapNoExtraKeys!4713 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53796 () Bool)

(declare-fun addStillContains!875 (ListLongMap!16395 (_ BitVec 64) V!43633 (_ BitVec 64)) Unit!37840)

(assert (=> bm!53796 (= call!53798 (addStillContains!875 lt!515755 (ite (or c!114401 c!114398) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114401 c!114398) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1152367 () Bool)

(assert (=> b!1152367 (= e!655530 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515747) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1152368 () Bool)

(declare-fun res!766031 () Bool)

(assert (=> b!1152368 (=> (not res!766031) (not e!655528))))

(assert (=> b!1152368 (= res!766031 (arrayNoDuplicates!0 lt!515743 #b00000000000000000000000000000000 Nil!25169))))

(declare-fun b!1152369 () Bool)

(assert (=> b!1152369 (= e!655517 (= call!53800 (-!1333 call!53795 k0!934)))))

(declare-fun b!1152370 () Bool)

(declare-fun res!766039 () Bool)

(assert (=> b!1152370 (=> (not res!766039) (not e!655523))))

(assert (=> b!1152370 (= res!766039 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25169))))

(declare-fun bm!53797 () Bool)

(assert (=> bm!53797 (= call!53801 call!53802)))

(declare-fun b!1152371 () Bool)

(declare-fun res!766030 () Bool)

(assert (=> b!1152371 (=> (not res!766030) (not e!655523))))

(assert (=> b!1152371 (= res!766030 (and (= (size!36508 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36507 _keys!1208) (size!36508 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!53798 () Bool)

(assert (=> bm!53798 (= call!53797 call!53799)))

(declare-fun b!1152372 () Bool)

(assert (=> b!1152372 (contains!6748 call!53799 k0!934)))

(declare-fun lt!515744 () Unit!37840)

(assert (=> b!1152372 (= lt!515744 (addStillContains!875 lt!515745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1152372 call!53802))

(assert (=> b!1152372 (= lt!515745 (+!3651 lt!515755 (tuple2!18419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!515750 () Unit!37840)

(assert (=> b!1152372 (= lt!515750 call!53798)))

(assert (=> b!1152372 (= e!655531 lt!515744)))

(declare-fun b!1152373 () Bool)

(assert (=> b!1152373 (= e!655519 e!655527)))

(declare-fun c!114400 () Bool)

(assert (=> b!1152373 (= c!114400 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515747))))

(declare-fun mapNonEmpty!45143 () Bool)

(declare-fun tp!85758 () Bool)

(assert (=> mapNonEmpty!45143 (= mapRes!45143 (and tp!85758 e!655524))))

(declare-fun mapKey!45143 () (_ BitVec 32))

(declare-fun mapRest!45143 () (Array (_ BitVec 32) ValueCell!13730))

(declare-fun mapValue!45143 () ValueCell!13730)

(assert (=> mapNonEmpty!45143 (= (arr!35971 _values!996) (store mapRest!45143 mapKey!45143 mapValue!45143))))

(declare-fun b!1152374 () Bool)

(declare-fun e!655526 () Bool)

(assert (=> b!1152374 (= e!655526 tp_is_empty!28879)))

(declare-fun b!1152375 () Bool)

(declare-fun Unit!37844 () Unit!37840)

(assert (=> b!1152375 (= e!655527 Unit!37844)))

(declare-fun b!1152376 () Bool)

(declare-fun res!766027 () Bool)

(assert (=> b!1152376 (=> (not res!766027) (not e!655523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152376 (= res!766027 (validKeyInArray!0 k0!934))))

(declare-fun b!1152377 () Bool)

(declare-fun res!766033 () Bool)

(assert (=> b!1152377 (=> (not res!766033) (not e!655523))))

(assert (=> b!1152377 (= res!766033 (= (select (arr!35970 _keys!1208) i!673) k0!934))))

(declare-fun bm!53799 () Bool)

(assert (=> bm!53799 (= call!53795 (getCurrentListMapNoExtraKeys!4713 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152378 () Bool)

(declare-fun res!766029 () Bool)

(assert (=> b!1152378 (=> (not res!766029) (not e!655523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152378 (= res!766029 (validMask!0 mask!1564))))

(declare-fun b!1152379 () Bool)

(declare-fun e!655518 () Bool)

(assert (=> b!1152379 (= e!655518 (and e!655526 mapRes!45143))))

(declare-fun condMapEmpty!45143 () Bool)

(declare-fun mapDefault!45143 () ValueCell!13730)

(assert (=> b!1152379 (= condMapEmpty!45143 (= (arr!35971 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13730)) mapDefault!45143)))))

(declare-fun b!1152380 () Bool)

(declare-fun e!655520 () Bool)

(declare-fun e!655515 () Bool)

(assert (=> b!1152380 (= e!655520 e!655515)))

(declare-fun res!766028 () Bool)

(assert (=> b!1152380 (=> res!766028 e!655515)))

(assert (=> b!1152380 (= res!766028 (not (= from!1455 i!673)))))

(declare-fun lt!515739 () ListLongMap!16395)

(assert (=> b!1152380 (= lt!515739 (getCurrentListMapNoExtraKeys!4713 lt!515743 lt!515741 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1152380 (= lt!515741 (array!74654 (store (arr!35971 _values!996) i!673 (ValueCellFull!13730 lt!515746)) (size!36508 _values!996)))))

(declare-fun dynLambda!2736 (Int (_ BitVec 64)) V!43633)

(assert (=> b!1152380 (= lt!515746 (dynLambda!2736 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1152380 (= lt!515737 (getCurrentListMapNoExtraKeys!4713 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1152381 () Bool)

(declare-fun res!766040 () Bool)

(assert (=> b!1152381 (=> (not res!766040) (not e!655523))))

(assert (=> b!1152381 (= res!766040 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36507 _keys!1208))))))

(declare-fun b!1152382 () Bool)

(assert (=> b!1152382 (= e!655515 e!655529)))

(declare-fun res!766036 () Bool)

(assert (=> b!1152382 (=> res!766036 e!655529)))

(assert (=> b!1152382 (= res!766036 (not (= (select (arr!35970 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1152382 e!655517))

(declare-fun c!114402 () Bool)

(assert (=> b!1152382 (= c!114402 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515734 () Unit!37840)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!577 (array!74651 array!74653 (_ BitVec 32) (_ BitVec 32) V!43633 V!43633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37840)

(assert (=> b!1152382 (= lt!515734 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!577 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152383 () Bool)

(assert (=> b!1152383 (= e!655522 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152384 () Bool)

(declare-fun lt!515742 () Unit!37840)

(assert (=> b!1152384 (= e!655519 lt!515742)))

(assert (=> b!1152384 (= lt!515742 call!53796)))

(assert (=> b!1152384 call!53801))

(declare-fun res!766035 () Bool)

(assert (=> start!98980 (=> (not res!766035) (not e!655523))))

(assert (=> start!98980 (= res!766035 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36507 _keys!1208))))))

(assert (=> start!98980 e!655523))

(assert (=> start!98980 tp_is_empty!28879))

(declare-fun array_inv!27600 (array!74651) Bool)

(assert (=> start!98980 (array_inv!27600 _keys!1208)))

(assert (=> start!98980 true))

(assert (=> start!98980 tp!85757))

(declare-fun array_inv!27601 (array!74653) Bool)

(assert (=> start!98980 (and (array_inv!27601 _values!996) e!655518)))

(declare-fun b!1152363 () Bool)

(assert (=> b!1152363 (= e!655528 (not e!655520))))

(declare-fun res!766032 () Bool)

(assert (=> b!1152363 (=> res!766032 e!655520)))

(assert (=> b!1152363 (= res!766032 (bvsgt from!1455 i!673))))

(assert (=> b!1152363 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515754 () Unit!37840)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74651 (_ BitVec 64) (_ BitVec 32)) Unit!37840)

(assert (=> b!1152363 (= lt!515754 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98980 res!766035) b!1152378))

(assert (= (and b!1152378 res!766029) b!1152371))

(assert (= (and b!1152371 res!766030) b!1152364))

(assert (= (and b!1152364 res!766037) b!1152370))

(assert (= (and b!1152370 res!766039) b!1152381))

(assert (= (and b!1152381 res!766040) b!1152376))

(assert (= (and b!1152376 res!766027) b!1152377))

(assert (= (and b!1152377 res!766033) b!1152358))

(assert (= (and b!1152358 res!766041) b!1152368))

(assert (= (and b!1152368 res!766031) b!1152363))

(assert (= (and b!1152363 (not res!766032)) b!1152380))

(assert (= (and b!1152380 (not res!766028)) b!1152382))

(assert (= (and b!1152382 c!114402) b!1152369))

(assert (= (and b!1152382 (not c!114402)) b!1152357))

(assert (= (or b!1152369 b!1152357) bm!53794))

(assert (= (or b!1152369 b!1152357) bm!53799))

(assert (= (and b!1152382 (not res!766036)) b!1152366))

(assert (= (and b!1152366 c!114397) b!1152360))

(assert (= (and b!1152366 (not c!114397)) b!1152355))

(assert (= (and b!1152360 c!114401) b!1152372))

(assert (= (and b!1152360 (not c!114401)) b!1152359))

(assert (= (and b!1152359 c!114398) b!1152384))

(assert (= (and b!1152359 (not c!114398)) b!1152373))

(assert (= (and b!1152373 c!114400) b!1152365))

(assert (= (and b!1152373 (not c!114400)) b!1152375))

(assert (= (or b!1152384 b!1152365) bm!53793))

(assert (= (or b!1152384 b!1152365) bm!53798))

(assert (= (or b!1152384 b!1152365) bm!53797))

(assert (= (or b!1152372 bm!53797) bm!53792))

(assert (= (or b!1152372 bm!53793) bm!53796))

(assert (= (or b!1152372 bm!53798) bm!53795))

(assert (= (and b!1152360 c!114399) b!1152356))

(assert (= (and b!1152360 (not c!114399)) b!1152367))

(assert (= (and b!1152360 res!766038) b!1152383))

(assert (= (and b!1152366 res!766034) b!1152362))

(assert (= (and b!1152379 condMapEmpty!45143) mapIsEmpty!45143))

(assert (= (and b!1152379 (not condMapEmpty!45143)) mapNonEmpty!45143))

(get-info :version)

(assert (= (and mapNonEmpty!45143 ((_ is ValueCellFull!13730) mapValue!45143)) b!1152361))

(assert (= (and b!1152379 ((_ is ValueCellFull!13730) mapDefault!45143)) b!1152374))

(assert (= start!98980 b!1152379))

(declare-fun b_lambda!19449 () Bool)

(assert (=> (not b_lambda!19449) (not b!1152380)))

(declare-fun t!36503 () Bool)

(declare-fun tb!9153 () Bool)

(assert (=> (and start!98980 (= defaultEntry!1004 defaultEntry!1004) t!36503) tb!9153))

(declare-fun result!18879 () Bool)

(assert (=> tb!9153 (= result!18879 tp_is_empty!28879)))

(assert (=> b!1152380 t!36503))

(declare-fun b_and!39551 () Bool)

(assert (= b_and!39549 (and (=> t!36503 result!18879) b_and!39551)))

(declare-fun m!1062793 () Bool)

(assert (=> b!1152370 m!1062793))

(declare-fun m!1062795 () Bool)

(assert (=> b!1152366 m!1062795))

(declare-fun m!1062797 () Bool)

(assert (=> b!1152366 m!1062797))

(declare-fun m!1062799 () Bool)

(assert (=> b!1152366 m!1062799))

(declare-fun m!1062801 () Bool)

(assert (=> b!1152366 m!1062801))

(declare-fun m!1062803 () Bool)

(assert (=> b!1152366 m!1062803))

(declare-fun m!1062805 () Bool)

(assert (=> b!1152366 m!1062805))

(declare-fun m!1062807 () Bool)

(assert (=> b!1152366 m!1062807))

(assert (=> b!1152366 m!1062799))

(declare-fun m!1062809 () Bool)

(assert (=> b!1152366 m!1062809))

(assert (=> b!1152366 m!1062803))

(assert (=> b!1152366 m!1062805))

(assert (=> b!1152366 m!1062805))

(declare-fun m!1062811 () Bool)

(assert (=> b!1152366 m!1062811))

(declare-fun m!1062813 () Bool)

(assert (=> b!1152358 m!1062813))

(declare-fun m!1062815 () Bool)

(assert (=> b!1152358 m!1062815))

(declare-fun m!1062817 () Bool)

(assert (=> b!1152378 m!1062817))

(declare-fun m!1062819 () Bool)

(assert (=> mapNonEmpty!45143 m!1062819))

(declare-fun m!1062821 () Bool)

(assert (=> bm!53792 m!1062821))

(declare-fun m!1062823 () Bool)

(assert (=> b!1152369 m!1062823))

(declare-fun m!1062825 () Bool)

(assert (=> b!1152380 m!1062825))

(declare-fun m!1062827 () Bool)

(assert (=> b!1152380 m!1062827))

(declare-fun m!1062829 () Bool)

(assert (=> b!1152380 m!1062829))

(declare-fun m!1062831 () Bool)

(assert (=> b!1152380 m!1062831))

(declare-fun m!1062833 () Bool)

(assert (=> b!1152363 m!1062833))

(declare-fun m!1062835 () Bool)

(assert (=> b!1152363 m!1062835))

(assert (=> bm!53799 m!1062797))

(declare-fun m!1062837 () Bool)

(assert (=> start!98980 m!1062837))

(declare-fun m!1062839 () Bool)

(assert (=> start!98980 m!1062839))

(declare-fun m!1062841 () Bool)

(assert (=> b!1152364 m!1062841))

(assert (=> b!1152382 m!1062805))

(declare-fun m!1062843 () Bool)

(assert (=> b!1152382 m!1062843))

(declare-fun m!1062845 () Bool)

(assert (=> b!1152377 m!1062845))

(declare-fun m!1062847 () Bool)

(assert (=> b!1152376 m!1062847))

(declare-fun m!1062849 () Bool)

(assert (=> bm!53795 m!1062849))

(declare-fun m!1062851 () Bool)

(assert (=> b!1152368 m!1062851))

(declare-fun m!1062853 () Bool)

(assert (=> bm!53794 m!1062853))

(declare-fun m!1062855 () Bool)

(assert (=> b!1152356 m!1062855))

(declare-fun m!1062857 () Bool)

(assert (=> b!1152360 m!1062857))

(declare-fun m!1062859 () Bool)

(assert (=> b!1152360 m!1062859))

(declare-fun m!1062861 () Bool)

(assert (=> b!1152360 m!1062861))

(declare-fun m!1062863 () Bool)

(assert (=> b!1152360 m!1062863))

(assert (=> b!1152362 m!1062853))

(assert (=> b!1152383 m!1062855))

(declare-fun m!1062865 () Bool)

(assert (=> b!1152372 m!1062865))

(declare-fun m!1062867 () Bool)

(assert (=> b!1152372 m!1062867))

(declare-fun m!1062869 () Bool)

(assert (=> b!1152372 m!1062869))

(declare-fun m!1062871 () Bool)

(assert (=> bm!53796 m!1062871))

(check-sat (not mapNonEmpty!45143) (not b!1152368) (not b!1152363) tp_is_empty!28879 (not b_lambda!19449) (not b!1152376) (not start!98980) (not b!1152380) (not bm!53794) (not bm!53796) (not b!1152366) (not b!1152369) (not b!1152362) b_and!39551 (not b!1152378) (not b_next!24349) (not b!1152370) (not bm!53799) (not b!1152364) (not b!1152360) (not b!1152358) (not b!1152356) (not b!1152382) (not bm!53795) (not bm!53792) (not b!1152372) (not b!1152383))
(check-sat b_and!39551 (not b_next!24349))
