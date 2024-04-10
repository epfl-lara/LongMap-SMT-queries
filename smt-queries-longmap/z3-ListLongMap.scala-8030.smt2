; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99022 () Bool)

(assert start!99022)

(declare-fun b_free!24627 () Bool)

(declare-fun b_next!24627 () Bool)

(assert (=> start!99022 (= b_free!24627 (not b_next!24627))))

(declare-fun tp!86592 () Bool)

(declare-fun b_and!40103 () Bool)

(assert (=> start!99022 (= tp!86592 b_and!40103)))

(declare-fun b!1163854 () Bool)

(declare-fun e!661786 () Bool)

(declare-fun e!661779 () Bool)

(declare-fun mapRes!45560 () Bool)

(assert (=> b!1163854 (= e!661786 (and e!661779 mapRes!45560))))

(declare-fun condMapEmpty!45560 () Bool)

(declare-datatypes ((V!44003 0))(
  ( (V!44004 (val!14635 Int)) )
))
(declare-datatypes ((ValueCell!13869 0))(
  ( (ValueCellFull!13869 (v!17272 V!44003)) (EmptyCell!13869) )
))
(declare-datatypes ((array!75153 0))(
  ( (array!75154 (arr!36227 (Array (_ BitVec 32) ValueCell!13869)) (size!36763 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75153)

(declare-fun mapDefault!45560 () ValueCell!13869)

(assert (=> b!1163854 (= condMapEmpty!45560 (= (arr!36227 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13869)) mapDefault!45560)))))

(declare-fun b!1163855 () Bool)

(declare-datatypes ((Unit!38411 0))(
  ( (Unit!38412) )
))
(declare-fun e!661774 () Unit!38411)

(declare-fun Unit!38413 () Unit!38411)

(assert (=> b!1163855 (= e!661774 Unit!38413)))

(declare-fun lt!524432 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1163855 (= lt!524432 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116502 () Bool)

(assert (=> b!1163855 (= c!116502 (and (not lt!524432) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524429 () Unit!38411)

(declare-fun e!661787 () Unit!38411)

(assert (=> b!1163855 (= lt!524429 e!661787)))

(declare-fun zeroValue!944 () V!44003)

(declare-datatypes ((array!75155 0))(
  ( (array!75156 (arr!36228 (Array (_ BitVec 32) (_ BitVec 64))) (size!36764 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75155)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!44003)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!524442 () Unit!38411)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!559 (array!75155 array!75153 (_ BitVec 32) (_ BitVec 32) V!44003 V!44003 (_ BitVec 64) (_ BitVec 32) Int) Unit!38411)

(assert (=> b!1163855 (= lt!524442 (lemmaListMapContainsThenArrayContainsFrom!559 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116501 () Bool)

(assert (=> b!1163855 (= c!116501 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771777 () Bool)

(declare-fun e!661778 () Bool)

(assert (=> b!1163855 (= res!771777 e!661778)))

(declare-fun e!661772 () Bool)

(assert (=> b!1163855 (=> (not res!771777) (not e!661772))))

(assert (=> b!1163855 e!661772))

(declare-fun lt!524431 () Unit!38411)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75155 (_ BitVec 32) (_ BitVec 32)) Unit!38411)

(assert (=> b!1163855 (= lt!524431 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25398 0))(
  ( (Nil!25395) (Cons!25394 (h!26603 (_ BitVec 64)) (t!37017 List!25398)) )
))
(declare-fun arrayNoDuplicates!0 (array!75155 (_ BitVec 32) List!25398) Bool)

(assert (=> b!1163855 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25395)))

(declare-fun lt!524425 () Unit!38411)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75155 (_ BitVec 64) (_ BitVec 32) List!25398) Unit!38411)

(assert (=> b!1163855 (= lt!524425 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25395))))

(assert (=> b!1163855 false))

(declare-fun b!1163856 () Bool)

(declare-fun arrayContainsKey!0 (array!75155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163856 (= e!661772 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163857 () Bool)

(assert (=> b!1163857 (= e!661778 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!524432) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun c!116504 () Bool)

(declare-datatypes ((tuple2!18666 0))(
  ( (tuple2!18667 (_1!9344 (_ BitVec 64)) (_2!9344 V!44003)) )
))
(declare-datatypes ((List!25399 0))(
  ( (Nil!25396) (Cons!25395 (h!26604 tuple2!18666) (t!37018 List!25399)) )
))
(declare-datatypes ((ListLongMap!16635 0))(
  ( (ListLongMap!16636 (toList!8333 List!25399)) )
))
(declare-fun lt!524430 () ListLongMap!16635)

(declare-fun lt!524440 () ListLongMap!16635)

(declare-fun bm!57063 () Bool)

(declare-fun call!57067 () Unit!38411)

(declare-fun addStillContains!974 (ListLongMap!16635 (_ BitVec 64) V!44003 (_ BitVec 64)) Unit!38411)

(assert (=> bm!57063 (= call!57067 (addStillContains!974 (ite c!116502 lt!524430 lt!524440) (ite c!116502 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116504 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116502 minValue!944 (ite c!116504 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1163858 () Bool)

(declare-fun e!661783 () Bool)

(declare-fun e!661781 () Bool)

(assert (=> b!1163858 (= e!661783 e!661781)))

(declare-fun res!771776 () Bool)

(assert (=> b!1163858 (=> res!771776 e!661781)))

(assert (=> b!1163858 (= res!771776 (not (= (select (arr!36228 _keys!1208) from!1455) k0!934)))))

(declare-fun e!661775 () Bool)

(assert (=> b!1163858 e!661775))

(declare-fun c!116506 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163858 (= c!116506 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!524445 () Unit!38411)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!663 (array!75155 array!75153 (_ BitVec 32) (_ BitVec 32) V!44003 V!44003 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38411)

(assert (=> b!1163858 (= lt!524445 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!663 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163859 () Bool)

(declare-fun res!771781 () Bool)

(declare-fun e!661784 () Bool)

(assert (=> b!1163859 (=> (not res!771781) (not e!661784))))

(declare-fun lt!524434 () array!75155)

(assert (=> b!1163859 (= res!771781 (arrayNoDuplicates!0 lt!524434 #b00000000000000000000000000000000 Nil!25395))))

(declare-fun b!1163860 () Bool)

(declare-fun res!771783 () Bool)

(declare-fun e!661788 () Bool)

(assert (=> b!1163860 (=> (not res!771783) (not e!661788))))

(assert (=> b!1163860 (= res!771783 (= (select (arr!36228 _keys!1208) i!673) k0!934))))

(declare-fun call!57072 () ListLongMap!16635)

(declare-fun b!1163861 () Bool)

(declare-fun call!57071 () ListLongMap!16635)

(declare-fun -!1436 (ListLongMap!16635 (_ BitVec 64)) ListLongMap!16635)

(assert (=> b!1163861 (= e!661775 (= call!57072 (-!1436 call!57071 k0!934)))))

(declare-fun b!1163862 () Bool)

(assert (=> b!1163862 (= c!116504 (and (not lt!524432) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661780 () Unit!38411)

(assert (=> b!1163862 (= e!661787 e!661780)))

(declare-fun lt!524443 () array!75153)

(declare-fun bm!57064 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4797 (array!75155 array!75153 (_ BitVec 32) (_ BitVec 32) V!44003 V!44003 (_ BitVec 32) Int) ListLongMap!16635)

(assert (=> bm!57064 (= call!57072 (getCurrentListMapNoExtraKeys!4797 lt!524434 lt!524443 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163863 () Bool)

(declare-fun e!661777 () Bool)

(assert (=> b!1163863 (= e!661784 (not e!661777))))

(declare-fun res!771780 () Bool)

(assert (=> b!1163863 (=> res!771780 e!661777)))

(assert (=> b!1163863 (= res!771780 (bvsgt from!1455 i!673))))

(assert (=> b!1163863 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!524426 () Unit!38411)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75155 (_ BitVec 64) (_ BitVec 32)) Unit!38411)

(assert (=> b!1163863 (= lt!524426 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1163864 () Bool)

(assert (=> b!1163864 (= e!661775 (= call!57072 call!57071))))

(declare-fun b!1163865 () Bool)

(declare-fun e!661785 () Unit!38411)

(declare-fun Unit!38414 () Unit!38411)

(assert (=> b!1163865 (= e!661785 Unit!38414)))

(declare-fun b!1163866 () Bool)

(declare-fun res!771775 () Bool)

(assert (=> b!1163866 (=> (not res!771775) (not e!661788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163866 (= res!771775 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45560 () Bool)

(declare-fun tp!86591 () Bool)

(declare-fun e!661773 () Bool)

(assert (=> mapNonEmpty!45560 (= mapRes!45560 (and tp!86591 e!661773))))

(declare-fun mapRest!45560 () (Array (_ BitVec 32) ValueCell!13869))

(declare-fun mapValue!45560 () ValueCell!13869)

(declare-fun mapKey!45560 () (_ BitVec 32))

(assert (=> mapNonEmpty!45560 (= (arr!36227 _values!996) (store mapRest!45560 mapKey!45560 mapValue!45560))))

(declare-fun lt!524441 () ListLongMap!16635)

(declare-fun e!661782 () Bool)

(declare-fun b!1163867 () Bool)

(assert (=> b!1163867 (= e!661782 (= lt!524441 (getCurrentListMapNoExtraKeys!4797 lt!524434 lt!524443 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!57065 () Bool)

(declare-fun call!57066 () ListLongMap!16635)

(declare-fun +!3735 (ListLongMap!16635 tuple2!18666) ListLongMap!16635)

(assert (=> bm!57065 (= call!57066 (+!3735 lt!524440 (ite (or c!116502 c!116504) (tuple2!18667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1163868 () Bool)

(assert (=> b!1163868 (= e!661780 e!661785)))

(declare-fun c!116503 () Bool)

(assert (=> b!1163868 (= c!116503 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!524432))))

(declare-fun mapIsEmpty!45560 () Bool)

(assert (=> mapIsEmpty!45560 mapRes!45560))

(declare-fun b!1163869 () Bool)

(declare-fun Unit!38415 () Unit!38411)

(assert (=> b!1163869 (= e!661774 Unit!38415)))

(declare-fun res!771779 () Bool)

(assert (=> start!99022 (=> (not res!771779) (not e!661788))))

(assert (=> start!99022 (= res!771779 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36764 _keys!1208))))))

(assert (=> start!99022 e!661788))

(declare-fun tp_is_empty!29157 () Bool)

(assert (=> start!99022 tp_is_empty!29157))

(declare-fun array_inv!27720 (array!75155) Bool)

(assert (=> start!99022 (array_inv!27720 _keys!1208)))

(assert (=> start!99022 true))

(assert (=> start!99022 tp!86592))

(declare-fun array_inv!27721 (array!75153) Bool)

(assert (=> start!99022 (and (array_inv!27721 _values!996) e!661786)))

(declare-fun bm!57066 () Bool)

(declare-fun call!57073 () ListLongMap!16635)

(assert (=> bm!57066 (= call!57073 call!57066)))

(declare-fun b!1163870 () Bool)

(declare-fun res!771787 () Bool)

(assert (=> b!1163870 (=> (not res!771787) (not e!661788))))

(assert (=> b!1163870 (= res!771787 (and (= (size!36763 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36764 _keys!1208) (size!36763 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1163871 () Bool)

(declare-fun call!57070 () Bool)

(assert (=> b!1163871 call!57070))

(declare-fun lt!524439 () Unit!38411)

(declare-fun call!57068 () Unit!38411)

(assert (=> b!1163871 (= lt!524439 call!57068)))

(assert (=> b!1163871 (= e!661785 lt!524439)))

(declare-fun b!1163872 () Bool)

(declare-fun res!771774 () Bool)

(assert (=> b!1163872 (=> (not res!771774) (not e!661788))))

(assert (=> b!1163872 (= res!771774 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25395))))

(declare-fun bm!57067 () Bool)

(assert (=> bm!57067 (= call!57071 (getCurrentListMapNoExtraKeys!4797 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163873 () Bool)

(declare-fun res!771785 () Bool)

(assert (=> b!1163873 (=> (not res!771785) (not e!661788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163873 (= res!771785 (validMask!0 mask!1564))))

(declare-fun bm!57068 () Bool)

(assert (=> bm!57068 (= call!57068 call!57067)))

(declare-fun b!1163874 () Bool)

(assert (=> b!1163874 (= e!661773 tp_is_empty!29157)))

(declare-fun b!1163875 () Bool)

(assert (=> b!1163875 (= e!661781 true)))

(assert (=> b!1163875 e!661782))

(declare-fun res!771782 () Bool)

(assert (=> b!1163875 (=> (not res!771782) (not e!661782))))

(assert (=> b!1163875 (= res!771782 (= lt!524441 lt!524440))))

(declare-fun lt!524435 () ListLongMap!16635)

(assert (=> b!1163875 (= lt!524441 (-!1436 lt!524435 k0!934))))

(declare-fun lt!524444 () V!44003)

(assert (=> b!1163875 (= (-!1436 (+!3735 lt!524440 (tuple2!18667 (select (arr!36228 _keys!1208) from!1455) lt!524444)) (select (arr!36228 _keys!1208) from!1455)) lt!524440)))

(declare-fun lt!524428 () Unit!38411)

(declare-fun addThenRemoveForNewKeyIsSame!268 (ListLongMap!16635 (_ BitVec 64) V!44003) Unit!38411)

(assert (=> b!1163875 (= lt!524428 (addThenRemoveForNewKeyIsSame!268 lt!524440 (select (arr!36228 _keys!1208) from!1455) lt!524444))))

(declare-fun lt!524427 () V!44003)

(declare-fun get!18490 (ValueCell!13869 V!44003) V!44003)

(assert (=> b!1163875 (= lt!524444 (get!18490 (select (arr!36227 _values!996) from!1455) lt!524427))))

(declare-fun lt!524438 () Unit!38411)

(assert (=> b!1163875 (= lt!524438 e!661774)))

(declare-fun c!116505 () Bool)

(declare-fun contains!6836 (ListLongMap!16635 (_ BitVec 64)) Bool)

(assert (=> b!1163875 (= c!116505 (contains!6836 lt!524440 k0!934))))

(assert (=> b!1163875 (= lt!524440 (getCurrentListMapNoExtraKeys!4797 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163876 () Bool)

(assert (=> b!1163876 (= e!661779 tp_is_empty!29157)))

(declare-fun b!1163877 () Bool)

(declare-fun lt!524433 () Unit!38411)

(assert (=> b!1163877 (= e!661780 lt!524433)))

(assert (=> b!1163877 (= lt!524433 call!57068)))

(assert (=> b!1163877 call!57070))

(declare-fun b!1163878 () Bool)

(declare-fun res!771784 () Bool)

(assert (=> b!1163878 (=> (not res!771784) (not e!661788))))

(assert (=> b!1163878 (= res!771784 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36764 _keys!1208))))))

(declare-fun b!1163879 () Bool)

(assert (=> b!1163879 (= e!661778 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!57069 () Bool)

(declare-fun bm!57069 () Bool)

(assert (=> bm!57069 (= call!57069 (contains!6836 (ite c!116502 lt!524430 call!57073) k0!934))))

(declare-fun b!1163880 () Bool)

(assert (=> b!1163880 (= e!661788 e!661784)))

(declare-fun res!771788 () Bool)

(assert (=> b!1163880 (=> (not res!771788) (not e!661784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75155 (_ BitVec 32)) Bool)

(assert (=> b!1163880 (= res!771788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524434 mask!1564))))

(assert (=> b!1163880 (= lt!524434 (array!75156 (store (arr!36228 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36764 _keys!1208)))))

(declare-fun bm!57070 () Bool)

(assert (=> bm!57070 (= call!57070 call!57069)))

(declare-fun b!1163881 () Bool)

(assert (=> b!1163881 (= e!661777 e!661783)))

(declare-fun res!771786 () Bool)

(assert (=> b!1163881 (=> res!771786 e!661783)))

(assert (=> b!1163881 (= res!771786 (not (= from!1455 i!673)))))

(declare-fun lt!524437 () ListLongMap!16635)

(assert (=> b!1163881 (= lt!524437 (getCurrentListMapNoExtraKeys!4797 lt!524434 lt!524443 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1163881 (= lt!524443 (array!75154 (store (arr!36227 _values!996) i!673 (ValueCellFull!13869 lt!524427)) (size!36763 _values!996)))))

(declare-fun dynLambda!2788 (Int (_ BitVec 64)) V!44003)

(assert (=> b!1163881 (= lt!524427 (dynLambda!2788 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1163881 (= lt!524435 (getCurrentListMapNoExtraKeys!4797 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163882 () Bool)

(declare-fun res!771778 () Bool)

(assert (=> b!1163882 (=> (not res!771778) (not e!661788))))

(assert (=> b!1163882 (= res!771778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1163883 () Bool)

(assert (=> b!1163883 (contains!6836 (+!3735 lt!524430 (tuple2!18667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!524436 () Unit!38411)

(assert (=> b!1163883 (= lt!524436 call!57067)))

(assert (=> b!1163883 call!57069))

(assert (=> b!1163883 (= lt!524430 call!57066)))

(declare-fun lt!524424 () Unit!38411)

(assert (=> b!1163883 (= lt!524424 (addStillContains!974 lt!524440 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1163883 (= e!661787 lt!524436)))

(assert (= (and start!99022 res!771779) b!1163873))

(assert (= (and b!1163873 res!771785) b!1163870))

(assert (= (and b!1163870 res!771787) b!1163882))

(assert (= (and b!1163882 res!771778) b!1163872))

(assert (= (and b!1163872 res!771774) b!1163878))

(assert (= (and b!1163878 res!771784) b!1163866))

(assert (= (and b!1163866 res!771775) b!1163860))

(assert (= (and b!1163860 res!771783) b!1163880))

(assert (= (and b!1163880 res!771788) b!1163859))

(assert (= (and b!1163859 res!771781) b!1163863))

(assert (= (and b!1163863 (not res!771780)) b!1163881))

(assert (= (and b!1163881 (not res!771786)) b!1163858))

(assert (= (and b!1163858 c!116506) b!1163861))

(assert (= (and b!1163858 (not c!116506)) b!1163864))

(assert (= (or b!1163861 b!1163864) bm!57064))

(assert (= (or b!1163861 b!1163864) bm!57067))

(assert (= (and b!1163858 (not res!771776)) b!1163875))

(assert (= (and b!1163875 c!116505) b!1163855))

(assert (= (and b!1163875 (not c!116505)) b!1163869))

(assert (= (and b!1163855 c!116502) b!1163883))

(assert (= (and b!1163855 (not c!116502)) b!1163862))

(assert (= (and b!1163862 c!116504) b!1163877))

(assert (= (and b!1163862 (not c!116504)) b!1163868))

(assert (= (and b!1163868 c!116503) b!1163871))

(assert (= (and b!1163868 (not c!116503)) b!1163865))

(assert (= (or b!1163877 b!1163871) bm!57068))

(assert (= (or b!1163877 b!1163871) bm!57066))

(assert (= (or b!1163877 b!1163871) bm!57070))

(assert (= (or b!1163883 bm!57070) bm!57069))

(assert (= (or b!1163883 bm!57068) bm!57063))

(assert (= (or b!1163883 bm!57066) bm!57065))

(assert (= (and b!1163855 c!116501) b!1163879))

(assert (= (and b!1163855 (not c!116501)) b!1163857))

(assert (= (and b!1163855 res!771777) b!1163856))

(assert (= (and b!1163875 res!771782) b!1163867))

(assert (= (and b!1163854 condMapEmpty!45560) mapIsEmpty!45560))

(assert (= (and b!1163854 (not condMapEmpty!45560)) mapNonEmpty!45560))

(get-info :version)

(assert (= (and mapNonEmpty!45560 ((_ is ValueCellFull!13869) mapValue!45560)) b!1163874))

(assert (= (and b!1163854 ((_ is ValueCellFull!13869) mapDefault!45560)) b!1163876))

(assert (= start!99022 b!1163854))

(declare-fun b_lambda!19733 () Bool)

(assert (=> (not b_lambda!19733) (not b!1163881)))

(declare-fun t!37016 () Bool)

(declare-fun tb!9439 () Bool)

(assert (=> (and start!99022 (= defaultEntry!1004 defaultEntry!1004) t!37016) tb!9439))

(declare-fun result!19443 () Bool)

(assert (=> tb!9439 (= result!19443 tp_is_empty!29157)))

(assert (=> b!1163881 t!37016))

(declare-fun b_and!40105 () Bool)

(assert (= b_and!40103 (and (=> t!37016 result!19443) b_and!40105)))

(declare-fun m!1072369 () Bool)

(assert (=> b!1163881 m!1072369))

(declare-fun m!1072371 () Bool)

(assert (=> b!1163881 m!1072371))

(declare-fun m!1072373 () Bool)

(assert (=> b!1163881 m!1072373))

(declare-fun m!1072375 () Bool)

(assert (=> b!1163881 m!1072375))

(declare-fun m!1072377 () Bool)

(assert (=> b!1163866 m!1072377))

(declare-fun m!1072379 () Bool)

(assert (=> bm!57067 m!1072379))

(declare-fun m!1072381 () Bool)

(assert (=> b!1163859 m!1072381))

(declare-fun m!1072383 () Bool)

(assert (=> b!1163858 m!1072383))

(declare-fun m!1072385 () Bool)

(assert (=> b!1163858 m!1072385))

(declare-fun m!1072387 () Bool)

(assert (=> bm!57064 m!1072387))

(declare-fun m!1072389 () Bool)

(assert (=> b!1163880 m!1072389))

(declare-fun m!1072391 () Bool)

(assert (=> b!1163880 m!1072391))

(declare-fun m!1072393 () Bool)

(assert (=> b!1163875 m!1072393))

(assert (=> b!1163875 m!1072379))

(declare-fun m!1072395 () Bool)

(assert (=> b!1163875 m!1072395))

(declare-fun m!1072397 () Bool)

(assert (=> b!1163875 m!1072397))

(assert (=> b!1163875 m!1072383))

(declare-fun m!1072399 () Bool)

(assert (=> b!1163875 m!1072399))

(assert (=> b!1163875 m!1072397))

(assert (=> b!1163875 m!1072383))

(declare-fun m!1072401 () Bool)

(assert (=> b!1163875 m!1072401))

(declare-fun m!1072403 () Bool)

(assert (=> b!1163875 m!1072403))

(assert (=> b!1163875 m!1072383))

(assert (=> b!1163875 m!1072395))

(declare-fun m!1072405 () Bool)

(assert (=> b!1163875 m!1072405))

(declare-fun m!1072407 () Bool)

(assert (=> b!1163856 m!1072407))

(declare-fun m!1072409 () Bool)

(assert (=> b!1163863 m!1072409))

(declare-fun m!1072411 () Bool)

(assert (=> b!1163863 m!1072411))

(declare-fun m!1072413 () Bool)

(assert (=> b!1163860 m!1072413))

(declare-fun m!1072415 () Bool)

(assert (=> mapNonEmpty!45560 m!1072415))

(declare-fun m!1072417 () Bool)

(assert (=> b!1163872 m!1072417))

(assert (=> b!1163879 m!1072407))

(declare-fun m!1072419 () Bool)

(assert (=> bm!57063 m!1072419))

(declare-fun m!1072421 () Bool)

(assert (=> b!1163882 m!1072421))

(declare-fun m!1072423 () Bool)

(assert (=> b!1163861 m!1072423))

(declare-fun m!1072425 () Bool)

(assert (=> b!1163855 m!1072425))

(declare-fun m!1072427 () Bool)

(assert (=> b!1163855 m!1072427))

(declare-fun m!1072429 () Bool)

(assert (=> b!1163855 m!1072429))

(declare-fun m!1072431 () Bool)

(assert (=> b!1163855 m!1072431))

(declare-fun m!1072433 () Bool)

(assert (=> b!1163873 m!1072433))

(declare-fun m!1072435 () Bool)

(assert (=> bm!57069 m!1072435))

(declare-fun m!1072437 () Bool)

(assert (=> start!99022 m!1072437))

(declare-fun m!1072439 () Bool)

(assert (=> start!99022 m!1072439))

(declare-fun m!1072441 () Bool)

(assert (=> b!1163883 m!1072441))

(assert (=> b!1163883 m!1072441))

(declare-fun m!1072443 () Bool)

(assert (=> b!1163883 m!1072443))

(declare-fun m!1072445 () Bool)

(assert (=> b!1163883 m!1072445))

(declare-fun m!1072447 () Bool)

(assert (=> bm!57065 m!1072447))

(assert (=> b!1163867 m!1072387))

(check-sat (not bm!57067) (not b!1163875) (not b!1163861) (not b!1163855) tp_is_empty!29157 (not b_next!24627) (not b!1163882) b_and!40105 (not bm!57065) (not b!1163881) (not b!1163867) (not b!1163879) (not mapNonEmpty!45560) (not bm!57064) (not bm!57069) (not b!1163863) (not b!1163873) (not bm!57063) (not b!1163872) (not b!1163856) (not b!1163883) (not b!1163859) (not start!99022) (not b!1163880) (not b!1163858) (not b!1163866) (not b_lambda!19733))
(check-sat b_and!40105 (not b_next!24627))
