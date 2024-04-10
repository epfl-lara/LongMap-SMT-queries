; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98574 () Bool)

(assert start!98574)

(declare-fun b_free!24179 () Bool)

(declare-fun b_next!24179 () Bool)

(assert (=> start!98574 (= b_free!24179 (not b_next!24179))))

(declare-fun tp!85248 () Bool)

(declare-fun b_and!39207 () Bool)

(assert (=> start!98574 (= tp!85248 b_and!39207)))

(declare-fun b!1143274 () Bool)

(declare-datatypes ((Unit!37514 0))(
  ( (Unit!37515) )
))
(declare-fun e!650381 () Unit!37514)

(declare-fun Unit!37516 () Unit!37514)

(assert (=> b!1143274 (= e!650381 Unit!37516)))

(declare-fun lt!509845 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1143274 (= lt!509845 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112474 () Bool)

(assert (=> b!1143274 (= c!112474 (and (not lt!509845) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509832 () Unit!37514)

(declare-fun e!650387 () Unit!37514)

(assert (=> b!1143274 (= lt!509832 e!650387)))

(declare-datatypes ((V!43405 0))(
  ( (V!43406 (val!14411 Int)) )
))
(declare-fun zeroValue!944 () V!43405)

(declare-datatypes ((array!74271 0))(
  ( (array!74272 (arr!35786 (Array (_ BitVec 32) (_ BitVec 64))) (size!36322 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74271)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13645 0))(
  ( (ValueCellFull!13645 (v!17048 V!43405)) (EmptyCell!13645) )
))
(declare-datatypes ((array!74273 0))(
  ( (array!74274 (arr!35787 (Array (_ BitVec 32) ValueCell!13645)) (size!36323 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74273)

(declare-fun lt!509849 () Unit!37514)

(declare-fun minValue!944 () V!43405)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!400 (array!74271 array!74273 (_ BitVec 32) (_ BitVec 32) V!43405 V!43405 (_ BitVec 64) (_ BitVec 32) Int) Unit!37514)

(assert (=> b!1143274 (= lt!509849 (lemmaListMapContainsThenArrayContainsFrom!400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112470 () Bool)

(assert (=> b!1143274 (= c!112470 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761725 () Bool)

(declare-fun e!650378 () Bool)

(assert (=> b!1143274 (= res!761725 e!650378)))

(declare-fun e!650390 () Bool)

(assert (=> b!1143274 (=> (not res!761725) (not e!650390))))

(assert (=> b!1143274 e!650390))

(declare-fun lt!509842 () Unit!37514)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74271 (_ BitVec 32) (_ BitVec 32)) Unit!37514)

(assert (=> b!1143274 (= lt!509842 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24995 0))(
  ( (Nil!24992) (Cons!24991 (h!26200 (_ BitVec 64)) (t!36166 List!24995)) )
))
(declare-fun arrayNoDuplicates!0 (array!74271 (_ BitVec 32) List!24995) Bool)

(assert (=> b!1143274 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24992)))

(declare-fun lt!509846 () Unit!37514)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74271 (_ BitVec 64) (_ BitVec 32) List!24995) Unit!37514)

(assert (=> b!1143274 (= lt!509846 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24992))))

(assert (=> b!1143274 false))

(declare-fun b!1143275 () Bool)

(declare-fun e!650386 () Bool)

(declare-fun e!650389 () Bool)

(assert (=> b!1143275 (= e!650386 e!650389)))

(declare-fun res!761730 () Bool)

(assert (=> b!1143275 (=> res!761730 e!650389)))

(assert (=> b!1143275 (= res!761730 (not (= (select (arr!35786 _keys!1208) from!1455) k!934)))))

(declare-fun e!650384 () Bool)

(assert (=> b!1143275 e!650384))

(declare-fun c!112469 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143275 (= c!112469 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509834 () Unit!37514)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!509 (array!74271 array!74273 (_ BitVec 32) (_ BitVec 32) V!43405 V!43405 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37514)

(assert (=> b!1143275 (= lt!509834 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143276 () Bool)

(declare-fun res!761722 () Bool)

(declare-fun e!650382 () Bool)

(assert (=> b!1143276 (=> (not res!761722) (not e!650382))))

(declare-fun lt!509844 () array!74271)

(assert (=> b!1143276 (= res!761722 (arrayNoDuplicates!0 lt!509844 #b00000000000000000000000000000000 Nil!24992))))

(declare-fun b!1143277 () Bool)

(declare-fun Unit!37517 () Unit!37514)

(assert (=> b!1143277 (= e!650381 Unit!37517)))

(declare-fun b!1143278 () Bool)

(declare-fun arrayContainsKey!0 (array!74271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143278 (= e!650390 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143279 () Bool)

(declare-fun e!650391 () Bool)

(assert (=> b!1143279 (= e!650382 (not e!650391))))

(declare-fun res!761733 () Bool)

(assert (=> b!1143279 (=> res!761733 e!650391)))

(assert (=> b!1143279 (= res!761733 (bvsgt from!1455 i!673))))

(assert (=> b!1143279 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!509833 () Unit!37514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74271 (_ BitVec 64) (_ BitVec 32)) Unit!37514)

(assert (=> b!1143279 (= lt!509833 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1143280 () Bool)

(declare-fun e!650380 () Unit!37514)

(declare-fun e!650383 () Unit!37514)

(assert (=> b!1143280 (= e!650380 e!650383)))

(declare-fun c!112473 () Bool)

(assert (=> b!1143280 (= c!112473 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509845))))

(declare-datatypes ((tuple2!18242 0))(
  ( (tuple2!18243 (_1!9132 (_ BitVec 64)) (_2!9132 V!43405)) )
))
(declare-datatypes ((List!24996 0))(
  ( (Nil!24993) (Cons!24992 (h!26201 tuple2!18242) (t!36167 List!24996)) )
))
(declare-datatypes ((ListLongMap!16211 0))(
  ( (ListLongMap!16212 (toList!8121 List!24996)) )
))
(declare-fun call!51690 () ListLongMap!16211)

(declare-fun bm!51687 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4601 (array!74271 array!74273 (_ BitVec 32) (_ BitVec 32) V!43405 V!43405 (_ BitVec 32) Int) ListLongMap!16211)

(assert (=> bm!51687 (= call!51690 (getCurrentListMapNoExtraKeys!4601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143281 () Bool)

(declare-fun call!51696 () Bool)

(assert (=> b!1143281 call!51696))

(declare-fun lt!509847 () Unit!37514)

(declare-fun call!51694 () Unit!37514)

(assert (=> b!1143281 (= lt!509847 call!51694)))

(assert (=> b!1143281 (= e!650383 lt!509847)))

(declare-fun b!1143282 () Bool)

(declare-fun res!761735 () Bool)

(declare-fun e!650379 () Bool)

(assert (=> b!1143282 (=> (not res!761735) (not e!650379))))

(assert (=> b!1143282 (= res!761735 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36322 _keys!1208))))))

(declare-fun mapIsEmpty!44888 () Bool)

(declare-fun mapRes!44888 () Bool)

(assert (=> mapIsEmpty!44888 mapRes!44888))

(declare-fun b!1143283 () Bool)

(declare-fun res!761731 () Bool)

(assert (=> b!1143283 (=> (not res!761731) (not e!650379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143283 (= res!761731 (validMask!0 mask!1564))))

(declare-fun bm!51688 () Bool)

(declare-fun call!51693 () ListLongMap!16211)

(declare-fun call!51697 () Bool)

(declare-fun lt!509831 () ListLongMap!16211)

(declare-fun contains!6653 (ListLongMap!16211 (_ BitVec 64)) Bool)

(assert (=> bm!51688 (= call!51697 (contains!6653 (ite c!112474 lt!509831 call!51693) k!934))))

(declare-fun b!1143284 () Bool)

(declare-fun call!51691 () ListLongMap!16211)

(declare-fun -!1267 (ListLongMap!16211 (_ BitVec 64)) ListLongMap!16211)

(assert (=> b!1143284 (= e!650384 (= call!51691 (-!1267 call!51690 k!934)))))

(declare-fun lt!509838 () array!74273)

(declare-fun bm!51689 () Bool)

(assert (=> bm!51689 (= call!51691 (getCurrentListMapNoExtraKeys!4601 lt!509844 lt!509838 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112472 () Bool)

(declare-fun bm!51690 () Bool)

(declare-fun call!51695 () Unit!37514)

(declare-fun lt!509843 () ListLongMap!16211)

(declare-fun addStillContains!806 (ListLongMap!16211 (_ BitVec 64) V!43405 (_ BitVec 64)) Unit!37514)

(assert (=> bm!51690 (= call!51695 (addStillContains!806 (ite c!112474 lt!509831 lt!509843) (ite c!112474 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112472 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112474 minValue!944 (ite c!112472 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1143285 () Bool)

(assert (=> b!1143285 (= e!650378 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509845) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!51692 () ListLongMap!16211)

(declare-fun bm!51691 () Bool)

(declare-fun +!3550 (ListLongMap!16211 tuple2!18242) ListLongMap!16211)

(assert (=> bm!51691 (= call!51692 (+!3550 lt!509843 (ite (or c!112474 c!112472) (tuple2!18243 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18243 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1143286 () Bool)

(assert (=> b!1143286 (= e!650379 e!650382)))

(declare-fun res!761728 () Bool)

(assert (=> b!1143286 (=> (not res!761728) (not e!650382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74271 (_ BitVec 32)) Bool)

(assert (=> b!1143286 (= res!761728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509844 mask!1564))))

(assert (=> b!1143286 (= lt!509844 (array!74272 (store (arr!35786 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36322 _keys!1208)))))

(declare-fun b!1143287 () Bool)

(assert (=> b!1143287 (= e!650389 true)))

(declare-fun lt!509841 () V!43405)

(assert (=> b!1143287 (= (-!1267 (+!3550 lt!509843 (tuple2!18243 (select (arr!35786 _keys!1208) from!1455) lt!509841)) (select (arr!35786 _keys!1208) from!1455)) lt!509843)))

(declare-fun lt!509850 () Unit!37514)

(declare-fun addThenRemoveForNewKeyIsSame!119 (ListLongMap!16211 (_ BitVec 64) V!43405) Unit!37514)

(assert (=> b!1143287 (= lt!509850 (addThenRemoveForNewKeyIsSame!119 lt!509843 (select (arr!35786 _keys!1208) from!1455) lt!509841))))

(declare-fun lt!509836 () V!43405)

(declare-fun get!18191 (ValueCell!13645 V!43405) V!43405)

(assert (=> b!1143287 (= lt!509841 (get!18191 (select (arr!35787 _values!996) from!1455) lt!509836))))

(declare-fun lt!509835 () Unit!37514)

(assert (=> b!1143287 (= lt!509835 e!650381)))

(declare-fun c!112471 () Bool)

(assert (=> b!1143287 (= c!112471 (contains!6653 lt!509843 k!934))))

(assert (=> b!1143287 (= lt!509843 (getCurrentListMapNoExtraKeys!4601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51692 () Bool)

(assert (=> bm!51692 (= call!51693 call!51692)))

(declare-fun b!1143288 () Bool)

(declare-fun Unit!37518 () Unit!37514)

(assert (=> b!1143288 (= e!650383 Unit!37518)))

(declare-fun b!1143289 () Bool)

(assert (=> b!1143289 (= e!650384 (= call!51691 call!51690))))

(declare-fun b!1143290 () Bool)

(assert (=> b!1143290 (contains!6653 (+!3550 lt!509831 (tuple2!18243 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!509839 () Unit!37514)

(assert (=> b!1143290 (= lt!509839 call!51695)))

(assert (=> b!1143290 call!51697))

(assert (=> b!1143290 (= lt!509831 call!51692)))

(declare-fun lt!509837 () Unit!37514)

(assert (=> b!1143290 (= lt!509837 (addStillContains!806 lt!509843 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1143290 (= e!650387 lt!509839)))

(declare-fun b!1143291 () Bool)

(declare-fun res!761726 () Bool)

(assert (=> b!1143291 (=> (not res!761726) (not e!650379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143291 (= res!761726 (validKeyInArray!0 k!934))))

(declare-fun b!1143292 () Bool)

(declare-fun res!761727 () Bool)

(assert (=> b!1143292 (=> (not res!761727) (not e!650379))))

(assert (=> b!1143292 (= res!761727 (= (select (arr!35786 _keys!1208) i!673) k!934))))

(declare-fun b!1143293 () Bool)

(declare-fun res!761723 () Bool)

(assert (=> b!1143293 (=> (not res!761723) (not e!650379))))

(assert (=> b!1143293 (= res!761723 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24992))))

(declare-fun b!1143294 () Bool)

(declare-fun e!650388 () Bool)

(declare-fun tp_is_empty!28709 () Bool)

(assert (=> b!1143294 (= e!650388 tp_is_empty!28709)))

(declare-fun b!1143295 () Bool)

(declare-fun res!761734 () Bool)

(assert (=> b!1143295 (=> (not res!761734) (not e!650379))))

(assert (=> b!1143295 (= res!761734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143296 () Bool)

(declare-fun res!761729 () Bool)

(assert (=> b!1143296 (=> (not res!761729) (not e!650379))))

(assert (=> b!1143296 (= res!761729 (and (= (size!36323 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36322 _keys!1208) (size!36323 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44888 () Bool)

(declare-fun tp!85247 () Bool)

(declare-fun e!650385 () Bool)

(assert (=> mapNonEmpty!44888 (= mapRes!44888 (and tp!85247 e!650385))))

(declare-fun mapKey!44888 () (_ BitVec 32))

(declare-fun mapRest!44888 () (Array (_ BitVec 32) ValueCell!13645))

(declare-fun mapValue!44888 () ValueCell!13645)

(assert (=> mapNonEmpty!44888 (= (arr!35787 _values!996) (store mapRest!44888 mapKey!44888 mapValue!44888))))

(declare-fun b!1143297 () Bool)

(assert (=> b!1143297 (= c!112472 (and (not lt!509845) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1143297 (= e!650387 e!650380)))

(declare-fun bm!51693 () Bool)

(assert (=> bm!51693 (= call!51694 call!51695)))

(declare-fun b!1143298 () Bool)

(assert (=> b!1143298 (= e!650385 tp_is_empty!28709)))

(declare-fun res!761732 () Bool)

(assert (=> start!98574 (=> (not res!761732) (not e!650379))))

(assert (=> start!98574 (= res!761732 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36322 _keys!1208))))))

(assert (=> start!98574 e!650379))

(assert (=> start!98574 tp_is_empty!28709))

(declare-fun array_inv!27422 (array!74271) Bool)

(assert (=> start!98574 (array_inv!27422 _keys!1208)))

(assert (=> start!98574 true))

(assert (=> start!98574 tp!85248))

(declare-fun e!650377 () Bool)

(declare-fun array_inv!27423 (array!74273) Bool)

(assert (=> start!98574 (and (array_inv!27423 _values!996) e!650377)))

(declare-fun b!1143299 () Bool)

(assert (=> b!1143299 (= e!650377 (and e!650388 mapRes!44888))))

(declare-fun condMapEmpty!44888 () Bool)

(declare-fun mapDefault!44888 () ValueCell!13645)

