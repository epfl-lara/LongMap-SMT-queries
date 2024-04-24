; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98764 () Bool)

(assert start!98764)

(declare-fun b_free!24133 () Bool)

(declare-fun b_next!24133 () Bool)

(assert (=> start!98764 (= b_free!24133 (not b_next!24133))))

(declare-fun tp!85109 () Bool)

(declare-fun b_and!39117 () Bool)

(assert (=> start!98764 (= tp!85109 b_and!39117)))

(declare-fun b!1142516 () Bool)

(declare-fun e!650105 () Bool)

(declare-fun e!650109 () Bool)

(assert (=> b!1142516 (= e!650105 (not e!650109))))

(declare-fun res!761275 () Bool)

(assert (=> b!1142516 (=> res!761275 e!650109)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142516 (= res!761275 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74227 0))(
  ( (array!74228 (arr!35758 (Array (_ BitVec 32) (_ BitVec 64))) (size!36295 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74227)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142516 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37410 0))(
  ( (Unit!37411) )
))
(declare-fun lt!508884 () Unit!37410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74227 (_ BitVec 64) (_ BitVec 32)) Unit!37410)

(assert (=> b!1142516 (= lt!508884 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44819 () Bool)

(declare-fun mapRes!44819 () Bool)

(declare-fun tp!85110 () Bool)

(declare-fun e!650117 () Bool)

(assert (=> mapNonEmpty!44819 (= mapRes!44819 (and tp!85110 e!650117))))

(declare-fun mapKey!44819 () (_ BitVec 32))

(declare-datatypes ((V!43345 0))(
  ( (V!43346 (val!14388 Int)) )
))
(declare-datatypes ((ValueCell!13622 0))(
  ( (ValueCellFull!13622 (v!17021 V!43345)) (EmptyCell!13622) )
))
(declare-fun mapValue!44819 () ValueCell!13622)

(declare-datatypes ((array!74229 0))(
  ( (array!74230 (arr!35759 (Array (_ BitVec 32) ValueCell!13622)) (size!36296 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74229)

(declare-fun mapRest!44819 () (Array (_ BitVec 32) ValueCell!13622))

(assert (=> mapNonEmpty!44819 (= (arr!35759 _values!996) (store mapRest!44819 mapKey!44819 mapValue!44819))))

(declare-fun b!1142517 () Bool)

(declare-fun res!761270 () Bool)

(declare-fun e!650110 () Bool)

(assert (=> b!1142517 (=> (not res!761270) (not e!650110))))

(assert (=> b!1142517 (= res!761270 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36295 _keys!1208))))))

(declare-fun bm!51200 () Bool)

(declare-datatypes ((tuple2!18214 0))(
  ( (tuple2!18215 (_1!9118 (_ BitVec 64)) (_2!9118 V!43345)) )
))
(declare-datatypes ((List!24975 0))(
  ( (Nil!24972) (Cons!24971 (h!26189 tuple2!18214) (t!36092 List!24975)) )
))
(declare-datatypes ((ListLongMap!16191 0))(
  ( (ListLongMap!16192 (toList!8111 List!24975)) )
))
(declare-fun call!51204 () ListLongMap!16191)

(declare-fun call!51207 () ListLongMap!16191)

(assert (=> bm!51200 (= call!51204 call!51207)))

(declare-fun b!1142518 () Bool)

(declare-fun call!51203 () Bool)

(assert (=> b!1142518 call!51203))

(declare-fun lt!508883 () Unit!37410)

(declare-fun call!51205 () Unit!37410)

(assert (=> b!1142518 (= lt!508883 call!51205)))

(declare-fun e!650107 () Unit!37410)

(assert (=> b!1142518 (= e!650107 lt!508883)))

(declare-fun b!1142519 () Bool)

(declare-fun res!761269 () Bool)

(assert (=> b!1142519 (=> (not res!761269) (not e!650110))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142519 (= res!761269 (validMask!0 mask!1564))))

(declare-fun b!1142520 () Bool)

(declare-fun res!761266 () Bool)

(assert (=> b!1142520 (=> (not res!761266) (not e!650110))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1142520 (= res!761266 (and (= (size!36296 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36295 _keys!1208) (size!36296 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1142521 () Bool)

(declare-fun e!650118 () Bool)

(assert (=> b!1142521 (= e!650118 true)))

(declare-fun lt!508878 () ListLongMap!16191)

(declare-fun lt!508869 () V!43345)

(declare-fun -!1243 (ListLongMap!16191 (_ BitVec 64)) ListLongMap!16191)

(declare-fun +!3559 (ListLongMap!16191 tuple2!18214) ListLongMap!16191)

(assert (=> b!1142521 (= (-!1243 (+!3559 lt!508878 (tuple2!18215 (select (arr!35758 _keys!1208) from!1455) lt!508869)) (select (arr!35758 _keys!1208) from!1455)) lt!508878)))

(declare-fun lt!508875 () Unit!37410)

(declare-fun addThenRemoveForNewKeyIsSame!103 (ListLongMap!16191 (_ BitVec 64) V!43345) Unit!37410)

(assert (=> b!1142521 (= lt!508875 (addThenRemoveForNewKeyIsSame!103 lt!508878 (select (arr!35758 _keys!1208) from!1455) lt!508869))))

(declare-fun lt!508868 () V!43345)

(declare-fun get!18192 (ValueCell!13622 V!43345) V!43345)

(assert (=> b!1142521 (= lt!508869 (get!18192 (select (arr!35759 _values!996) from!1455) lt!508868))))

(declare-fun lt!508874 () Unit!37410)

(declare-fun e!650116 () Unit!37410)

(assert (=> b!1142521 (= lt!508874 e!650116)))

(declare-fun c!112457 () Bool)

(declare-fun contains!6657 (ListLongMap!16191 (_ BitVec 64)) Bool)

(assert (=> b!1142521 (= c!112457 (contains!6657 lt!508878 k0!934))))

(declare-fun zeroValue!944 () V!43345)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43345)

(declare-fun getCurrentListMapNoExtraKeys!4619 (array!74227 array!74229 (_ BitVec 32) (_ BitVec 32) V!43345 V!43345 (_ BitVec 32) Int) ListLongMap!16191)

(assert (=> b!1142521 (= lt!508878 (getCurrentListMapNoExtraKeys!4619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142522 () Bool)

(declare-fun e!650115 () Bool)

(declare-fun call!51206 () ListLongMap!16191)

(declare-fun call!51208 () ListLongMap!16191)

(assert (=> b!1142522 (= e!650115 (= call!51206 call!51208))))

(declare-fun bm!51201 () Bool)

(declare-fun lt!508881 () array!74227)

(declare-fun lt!508877 () array!74229)

(assert (=> bm!51201 (= call!51206 (getCurrentListMapNoExtraKeys!4619 lt!508881 lt!508877 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142523 () Bool)

(declare-fun Unit!37412 () Unit!37410)

(assert (=> b!1142523 (= e!650116 Unit!37412)))

(declare-fun b!1142524 () Bool)

(declare-fun res!761277 () Bool)

(assert (=> b!1142524 (=> (not res!761277) (not e!650110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74227 (_ BitVec 32)) Bool)

(assert (=> b!1142524 (= res!761277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1142525 () Bool)

(declare-fun e!650108 () Bool)

(assert (=> b!1142525 (= e!650109 e!650108)))

(declare-fun res!761265 () Bool)

(assert (=> b!1142525 (=> res!761265 e!650108)))

(assert (=> b!1142525 (= res!761265 (not (= from!1455 i!673)))))

(declare-fun lt!508880 () ListLongMap!16191)

(assert (=> b!1142525 (= lt!508880 (getCurrentListMapNoExtraKeys!4619 lt!508881 lt!508877 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1142525 (= lt!508877 (array!74230 (store (arr!35759 _values!996) i!673 (ValueCellFull!13622 lt!508868)) (size!36296 _values!996)))))

(declare-fun dynLambda!2659 (Int (_ BitVec 64)) V!43345)

(assert (=> b!1142525 (= lt!508868 (dynLambda!2659 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508872 () ListLongMap!16191)

(assert (=> b!1142525 (= lt!508872 (getCurrentListMapNoExtraKeys!4619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1142526 () Bool)

(assert (=> b!1142526 (= e!650108 e!650118)))

(declare-fun res!761272 () Bool)

(assert (=> b!1142526 (=> res!761272 e!650118)))

(assert (=> b!1142526 (= res!761272 (not (= (select (arr!35758 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1142526 e!650115))

(declare-fun c!112458 () Bool)

(assert (=> b!1142526 (= c!112458 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508865 () Unit!37410)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!499 (array!74227 array!74229 (_ BitVec 32) (_ BitVec 32) V!43345 V!43345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37410)

(assert (=> b!1142526 (= lt!508865 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!499 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142527 () Bool)

(declare-fun e!650119 () Unit!37410)

(declare-fun lt!508876 () Unit!37410)

(assert (=> b!1142527 (= e!650119 lt!508876)))

(assert (=> b!1142527 (= lt!508876 call!51205)))

(assert (=> b!1142527 call!51203))

(declare-fun mapIsEmpty!44819 () Bool)

(assert (=> mapIsEmpty!44819 mapRes!44819))

(declare-fun call!51209 () Bool)

(declare-fun lt!508885 () ListLongMap!16191)

(declare-fun c!112455 () Bool)

(declare-fun bm!51202 () Bool)

(assert (=> bm!51202 (= call!51209 (contains!6657 (ite c!112455 lt!508885 call!51204) k0!934))))

(declare-fun lt!508871 () Bool)

(declare-fun e!650111 () Bool)

(declare-fun b!1142528 () Bool)

(assert (=> b!1142528 (= e!650111 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508871) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1142529 () Bool)

(declare-fun Unit!37413 () Unit!37410)

(assert (=> b!1142529 (= e!650116 Unit!37413)))

(assert (=> b!1142529 (= lt!508871 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1142529 (= c!112455 (and (not lt!508871) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508867 () Unit!37410)

(declare-fun e!650112 () Unit!37410)

(assert (=> b!1142529 (= lt!508867 e!650112)))

(declare-fun lt!508879 () Unit!37410)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!390 (array!74227 array!74229 (_ BitVec 32) (_ BitVec 32) V!43345 V!43345 (_ BitVec 64) (_ BitVec 32) Int) Unit!37410)

(assert (=> b!1142529 (= lt!508879 (lemmaListMapContainsThenArrayContainsFrom!390 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112453 () Bool)

(assert (=> b!1142529 (= c!112453 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761267 () Bool)

(assert (=> b!1142529 (= res!761267 e!650111)))

(declare-fun e!650106 () Bool)

(assert (=> b!1142529 (=> (not res!761267) (not e!650106))))

(assert (=> b!1142529 e!650106))

(declare-fun lt!508866 () Unit!37410)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74227 (_ BitVec 32) (_ BitVec 32)) Unit!37410)

(assert (=> b!1142529 (= lt!508866 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24976 0))(
  ( (Nil!24973) (Cons!24972 (h!26190 (_ BitVec 64)) (t!36093 List!24976)) )
))
(declare-fun arrayNoDuplicates!0 (array!74227 (_ BitVec 32) List!24976) Bool)

(assert (=> b!1142529 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24973)))

(declare-fun lt!508873 () Unit!37410)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74227 (_ BitVec 64) (_ BitVec 32) List!24976) Unit!37410)

(assert (=> b!1142529 (= lt!508873 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24973))))

(assert (=> b!1142529 false))

(declare-fun c!112454 () Bool)

(declare-fun bm!51203 () Bool)

(assert (=> bm!51203 (= call!51207 (+!3559 (ite c!112455 lt!508885 lt!508878) (ite c!112455 (tuple2!18215 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112454 (tuple2!18215 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18215 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!51204 () Bool)

(assert (=> bm!51204 (= call!51203 call!51209)))

(declare-fun b!1142530 () Bool)

(declare-fun e!650114 () Bool)

(declare-fun e!650113 () Bool)

(assert (=> b!1142530 (= e!650114 (and e!650113 mapRes!44819))))

(declare-fun condMapEmpty!44819 () Bool)

(declare-fun mapDefault!44819 () ValueCell!13622)

(assert (=> b!1142530 (= condMapEmpty!44819 (= (arr!35759 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13622)) mapDefault!44819)))))

(declare-fun b!1142531 () Bool)

(assert (=> b!1142531 (= e!650106 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142532 () Bool)

(declare-fun res!761273 () Bool)

(assert (=> b!1142532 (=> (not res!761273) (not e!650110))))

(assert (=> b!1142532 (= res!761273 (= (select (arr!35758 _keys!1208) i!673) k0!934))))

(declare-fun b!1142533 () Bool)

(assert (=> b!1142533 (contains!6657 call!51207 k0!934)))

(declare-fun lt!508882 () Unit!37410)

(declare-fun addStillContains!786 (ListLongMap!16191 (_ BitVec 64) V!43345 (_ BitVec 64)) Unit!37410)

(assert (=> b!1142533 (= lt!508882 (addStillContains!786 lt!508885 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1142533 call!51209))

(assert (=> b!1142533 (= lt!508885 (+!3559 lt!508878 (tuple2!18215 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508870 () Unit!37410)

(declare-fun call!51210 () Unit!37410)

(assert (=> b!1142533 (= lt!508870 call!51210)))

(assert (=> b!1142533 (= e!650112 lt!508882)))

(declare-fun b!1142534 () Bool)

(assert (=> b!1142534 (= c!112454 (and (not lt!508871) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1142534 (= e!650112 e!650119)))

(declare-fun b!1142535 () Bool)

(declare-fun Unit!37414 () Unit!37410)

(assert (=> b!1142535 (= e!650107 Unit!37414)))

(declare-fun b!1142536 () Bool)

(declare-fun res!761274 () Bool)

(assert (=> b!1142536 (=> (not res!761274) (not e!650105))))

(assert (=> b!1142536 (= res!761274 (arrayNoDuplicates!0 lt!508881 #b00000000000000000000000000000000 Nil!24973))))

(declare-fun bm!51205 () Bool)

(assert (=> bm!51205 (= call!51208 (getCurrentListMapNoExtraKeys!4619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142537 () Bool)

(declare-fun res!761268 () Bool)

(assert (=> b!1142537 (=> (not res!761268) (not e!650110))))

(assert (=> b!1142537 (= res!761268 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24973))))

(declare-fun b!1142538 () Bool)

(declare-fun tp_is_empty!28663 () Bool)

(assert (=> b!1142538 (= e!650117 tp_is_empty!28663)))

(declare-fun bm!51206 () Bool)

(assert (=> bm!51206 (= call!51210 (addStillContains!786 lt!508878 (ite (or c!112455 c!112454) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112455 c!112454) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1142539 () Bool)

(assert (=> b!1142539 (= e!650115 (= call!51206 (-!1243 call!51208 k0!934)))))

(declare-fun b!1142540 () Bool)

(declare-fun res!761271 () Bool)

(assert (=> b!1142540 (=> (not res!761271) (not e!650110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142540 (= res!761271 (validKeyInArray!0 k0!934))))

(declare-fun b!1142541 () Bool)

(assert (=> b!1142541 (= e!650113 tp_is_empty!28663)))

(declare-fun b!1142542 () Bool)

(assert (=> b!1142542 (= e!650111 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142543 () Bool)

(assert (=> b!1142543 (= e!650119 e!650107)))

(declare-fun c!112456 () Bool)

(assert (=> b!1142543 (= c!112456 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508871))))

(declare-fun b!1142544 () Bool)

(assert (=> b!1142544 (= e!650110 e!650105)))

(declare-fun res!761264 () Bool)

(assert (=> b!1142544 (=> (not res!761264) (not e!650105))))

(assert (=> b!1142544 (= res!761264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508881 mask!1564))))

(assert (=> b!1142544 (= lt!508881 (array!74228 (store (arr!35758 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36295 _keys!1208)))))

(declare-fun bm!51207 () Bool)

(assert (=> bm!51207 (= call!51205 call!51210)))

(declare-fun res!761276 () Bool)

(assert (=> start!98764 (=> (not res!761276) (not e!650110))))

(assert (=> start!98764 (= res!761276 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36295 _keys!1208))))))

(assert (=> start!98764 e!650110))

(assert (=> start!98764 tp_is_empty!28663))

(declare-fun array_inv!27456 (array!74227) Bool)

(assert (=> start!98764 (array_inv!27456 _keys!1208)))

(assert (=> start!98764 true))

(assert (=> start!98764 tp!85109))

(declare-fun array_inv!27457 (array!74229) Bool)

(assert (=> start!98764 (and (array_inv!27457 _values!996) e!650114)))

(assert (= (and start!98764 res!761276) b!1142519))

(assert (= (and b!1142519 res!761269) b!1142520))

(assert (= (and b!1142520 res!761266) b!1142524))

(assert (= (and b!1142524 res!761277) b!1142537))

(assert (= (and b!1142537 res!761268) b!1142517))

(assert (= (and b!1142517 res!761270) b!1142540))

(assert (= (and b!1142540 res!761271) b!1142532))

(assert (= (and b!1142532 res!761273) b!1142544))

(assert (= (and b!1142544 res!761264) b!1142536))

(assert (= (and b!1142536 res!761274) b!1142516))

(assert (= (and b!1142516 (not res!761275)) b!1142525))

(assert (= (and b!1142525 (not res!761265)) b!1142526))

(assert (= (and b!1142526 c!112458) b!1142539))

(assert (= (and b!1142526 (not c!112458)) b!1142522))

(assert (= (or b!1142539 b!1142522) bm!51201))

(assert (= (or b!1142539 b!1142522) bm!51205))

(assert (= (and b!1142526 (not res!761272)) b!1142521))

(assert (= (and b!1142521 c!112457) b!1142529))

(assert (= (and b!1142521 (not c!112457)) b!1142523))

(assert (= (and b!1142529 c!112455) b!1142533))

(assert (= (and b!1142529 (not c!112455)) b!1142534))

(assert (= (and b!1142534 c!112454) b!1142527))

(assert (= (and b!1142534 (not c!112454)) b!1142543))

(assert (= (and b!1142543 c!112456) b!1142518))

(assert (= (and b!1142543 (not c!112456)) b!1142535))

(assert (= (or b!1142527 b!1142518) bm!51207))

(assert (= (or b!1142527 b!1142518) bm!51200))

(assert (= (or b!1142527 b!1142518) bm!51204))

(assert (= (or b!1142533 bm!51204) bm!51202))

(assert (= (or b!1142533 bm!51207) bm!51206))

(assert (= (or b!1142533 bm!51200) bm!51203))

(assert (= (and b!1142529 c!112453) b!1142542))

(assert (= (and b!1142529 (not c!112453)) b!1142528))

(assert (= (and b!1142529 res!761267) b!1142531))

(assert (= (and b!1142530 condMapEmpty!44819) mapIsEmpty!44819))

(assert (= (and b!1142530 (not condMapEmpty!44819)) mapNonEmpty!44819))

(get-info :version)

(assert (= (and mapNonEmpty!44819 ((_ is ValueCellFull!13622) mapValue!44819)) b!1142538))

(assert (= (and b!1142530 ((_ is ValueCellFull!13622) mapDefault!44819)) b!1142541))

(assert (= start!98764 b!1142530))

(declare-fun b_lambda!19233 () Bool)

(assert (=> (not b_lambda!19233) (not b!1142525)))

(declare-fun t!36091 () Bool)

(declare-fun tb!8937 () Bool)

(assert (=> (and start!98764 (= defaultEntry!1004 defaultEntry!1004) t!36091) tb!8937))

(declare-fun result!18447 () Bool)

(assert (=> tb!8937 (= result!18447 tp_is_empty!28663)))

(assert (=> b!1142525 t!36091))

(declare-fun b_and!39119 () Bool)

(assert (= b_and!39117 (and (=> t!36091 result!18447) b_and!39119)))

(declare-fun m!1054217 () Bool)

(assert (=> b!1142537 m!1054217))

(declare-fun m!1054219 () Bool)

(assert (=> b!1142533 m!1054219))

(declare-fun m!1054221 () Bool)

(assert (=> b!1142533 m!1054221))

(declare-fun m!1054223 () Bool)

(assert (=> b!1142533 m!1054223))

(declare-fun m!1054225 () Bool)

(assert (=> b!1142526 m!1054225))

(declare-fun m!1054227 () Bool)

(assert (=> b!1142526 m!1054227))

(declare-fun m!1054229 () Bool)

(assert (=> bm!51205 m!1054229))

(declare-fun m!1054231 () Bool)

(assert (=> bm!51206 m!1054231))

(declare-fun m!1054233 () Bool)

(assert (=> bm!51203 m!1054233))

(declare-fun m!1054235 () Bool)

(assert (=> b!1142516 m!1054235))

(declare-fun m!1054237 () Bool)

(assert (=> b!1142516 m!1054237))

(declare-fun m!1054239 () Bool)

(assert (=> b!1142524 m!1054239))

(declare-fun m!1054241 () Bool)

(assert (=> b!1142531 m!1054241))

(assert (=> b!1142542 m!1054241))

(assert (=> b!1142521 m!1054229))

(declare-fun m!1054243 () Bool)

(assert (=> b!1142521 m!1054243))

(declare-fun m!1054245 () Bool)

(assert (=> b!1142521 m!1054245))

(assert (=> b!1142521 m!1054225))

(declare-fun m!1054247 () Bool)

(assert (=> b!1142521 m!1054247))

(declare-fun m!1054249 () Bool)

(assert (=> b!1142521 m!1054249))

(assert (=> b!1142521 m!1054225))

(assert (=> b!1142521 m!1054225))

(declare-fun m!1054251 () Bool)

(assert (=> b!1142521 m!1054251))

(assert (=> b!1142521 m!1054245))

(assert (=> b!1142521 m!1054243))

(declare-fun m!1054253 () Bool)

(assert (=> b!1142521 m!1054253))

(declare-fun m!1054255 () Bool)

(assert (=> mapNonEmpty!44819 m!1054255))

(declare-fun m!1054257 () Bool)

(assert (=> b!1142519 m!1054257))

(declare-fun m!1054259 () Bool)

(assert (=> start!98764 m!1054259))

(declare-fun m!1054261 () Bool)

(assert (=> start!98764 m!1054261))

(declare-fun m!1054263 () Bool)

(assert (=> b!1142540 m!1054263))

(declare-fun m!1054265 () Bool)

(assert (=> b!1142536 m!1054265))

(declare-fun m!1054267 () Bool)

(assert (=> bm!51201 m!1054267))

(declare-fun m!1054269 () Bool)

(assert (=> b!1142544 m!1054269))

(declare-fun m!1054271 () Bool)

(assert (=> b!1142544 m!1054271))

(declare-fun m!1054273 () Bool)

(assert (=> bm!51202 m!1054273))

(declare-fun m!1054275 () Bool)

(assert (=> b!1142539 m!1054275))

(declare-fun m!1054277 () Bool)

(assert (=> b!1142529 m!1054277))

(declare-fun m!1054279 () Bool)

(assert (=> b!1142529 m!1054279))

(declare-fun m!1054281 () Bool)

(assert (=> b!1142529 m!1054281))

(declare-fun m!1054283 () Bool)

(assert (=> b!1142529 m!1054283))

(declare-fun m!1054285 () Bool)

(assert (=> b!1142525 m!1054285))

(declare-fun m!1054287 () Bool)

(assert (=> b!1142525 m!1054287))

(declare-fun m!1054289 () Bool)

(assert (=> b!1142525 m!1054289))

(declare-fun m!1054291 () Bool)

(assert (=> b!1142525 m!1054291))

(declare-fun m!1054293 () Bool)

(assert (=> b!1142532 m!1054293))

(check-sat (not b!1142524) (not b!1142526) (not b!1142544) (not b!1142540) (not b!1142531) tp_is_empty!28663 (not b!1142536) (not b!1142537) (not mapNonEmpty!44819) (not b!1142521) (not b_next!24133) (not bm!51202) (not bm!51206) b_and!39119 (not start!98764) (not b!1142529) (not b!1142533) (not bm!51201) (not bm!51203) (not b!1142542) (not b!1142539) (not bm!51205) (not b!1142525) (not b_lambda!19233) (not b!1142516) (not b!1142519))
(check-sat b_and!39119 (not b_next!24133))
