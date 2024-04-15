; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98558 () Bool)

(assert start!98558)

(declare-fun b_free!24169 () Bool)

(declare-fun b_next!24169 () Bool)

(assert (=> start!98558 (= b_free!24169 (not b_next!24169))))

(declare-fun tp!85218 () Bool)

(declare-fun b_and!39165 () Bool)

(assert (=> start!98558 (= tp!85218 b_and!39165)))

(declare-datatypes ((V!43393 0))(
  ( (V!43394 (val!14406 Int)) )
))
(declare-fun zeroValue!944 () V!43393)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!51544 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74178 0))(
  ( (array!74179 (arr!35740 (Array (_ BitVec 32) (_ BitVec 64))) (size!36278 (_ BitVec 32))) )
))
(declare-fun lt!509336 () array!74178)

(declare-fun minValue!944 () V!43393)

(declare-datatypes ((ValueCell!13640 0))(
  ( (ValueCellFull!13640 (v!17042 V!43393)) (EmptyCell!13640) )
))
(declare-datatypes ((array!74180 0))(
  ( (array!74181 (arr!35741 (Array (_ BitVec 32) ValueCell!13640)) (size!36279 (_ BitVec 32))) )
))
(declare-fun lt!509343 () array!74180)

(declare-datatypes ((tuple2!18322 0))(
  ( (tuple2!18323 (_1!9172 (_ BitVec 64)) (_2!9172 V!43393)) )
))
(declare-datatypes ((List!25060 0))(
  ( (Nil!25057) (Cons!25056 (h!26265 tuple2!18322) (t!36212 List!25060)) )
))
(declare-datatypes ((ListLongMap!16291 0))(
  ( (ListLongMap!16292 (toList!8161 List!25060)) )
))
(declare-fun call!51552 () ListLongMap!16291)

(declare-fun getCurrentListMapNoExtraKeys!4651 (array!74178 array!74180 (_ BitVec 32) (_ BitVec 32) V!43393 V!43393 (_ BitVec 32) Int) ListLongMap!16291)

(assert (=> bm!51544 (= call!51552 (getCurrentListMapNoExtraKeys!4651 lt!509336 lt!509343 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _keys!1208 () array!74178)

(declare-fun b!1142705 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!650070 () Bool)

(declare-fun arrayContainsKey!0 (array!74178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142705 (= e!650070 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142706 () Bool)

(declare-fun e!650063 () Bool)

(assert (=> b!1142706 (= e!650063 true)))

(declare-fun lt!509342 () ListLongMap!16291)

(declare-fun lt!509340 () V!43393)

(declare-fun -!1241 (ListLongMap!16291 (_ BitVec 64)) ListLongMap!16291)

(declare-fun +!3585 (ListLongMap!16291 tuple2!18322) ListLongMap!16291)

(assert (=> b!1142706 (= (-!1241 (+!3585 lt!509342 (tuple2!18323 (select (arr!35740 _keys!1208) from!1455) lt!509340)) (select (arr!35740 _keys!1208) from!1455)) lt!509342)))

(declare-datatypes ((Unit!37354 0))(
  ( (Unit!37355) )
))
(declare-fun lt!509323 () Unit!37354)

(declare-fun addThenRemoveForNewKeyIsSame!107 (ListLongMap!16291 (_ BitVec 64) V!43393) Unit!37354)

(assert (=> b!1142706 (= lt!509323 (addThenRemoveForNewKeyIsSame!107 lt!509342 (select (arr!35740 _keys!1208) from!1455) lt!509340))))

(declare-fun lt!509325 () V!43393)

(declare-fun _values!996 () array!74180)

(declare-fun get!18177 (ValueCell!13640 V!43393) V!43393)

(assert (=> b!1142706 (= lt!509340 (get!18177 (select (arr!35741 _values!996) from!1455) lt!509325))))

(declare-fun lt!509324 () Unit!37354)

(declare-fun e!650067 () Unit!37354)

(assert (=> b!1142706 (= lt!509324 e!650067)))

(declare-fun c!112356 () Bool)

(declare-fun contains!6630 (ListLongMap!16291 (_ BitVec 64)) Bool)

(assert (=> b!1142706 (= c!112356 (contains!6630 lt!509342 k0!934))))

(assert (=> b!1142706 (= lt!509342 (getCurrentListMapNoExtraKeys!4651 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142707 () Bool)

(declare-fun e!650059 () Unit!37354)

(declare-fun Unit!37356 () Unit!37354)

(assert (=> b!1142707 (= e!650059 Unit!37356)))

(declare-fun b!1142708 () Bool)

(declare-fun res!761449 () Bool)

(declare-fun e!650069 () Bool)

(assert (=> b!1142708 (=> (not res!761449) (not e!650069))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142708 (= res!761449 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36278 _keys!1208))))))

(declare-fun b!1142709 () Bool)

(declare-fun e!650058 () Bool)

(declare-fun e!650061 () Bool)

(declare-fun mapRes!44873 () Bool)

(assert (=> b!1142709 (= e!650058 (and e!650061 mapRes!44873))))

(declare-fun condMapEmpty!44873 () Bool)

(declare-fun mapDefault!44873 () ValueCell!13640)

(assert (=> b!1142709 (= condMapEmpty!44873 (= (arr!35741 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13640)) mapDefault!44873)))))

(declare-fun b!1142710 () Bool)

(declare-fun call!51554 () ListLongMap!16291)

(assert (=> b!1142710 (contains!6630 call!51554 k0!934)))

(declare-fun lt!509334 () Unit!37354)

(declare-fun call!51553 () Unit!37354)

(assert (=> b!1142710 (= lt!509334 call!51553)))

(declare-fun call!51547 () Bool)

(assert (=> b!1142710 call!51547))

(declare-fun lt!509333 () ListLongMap!16291)

(assert (=> b!1142710 (= lt!509333 (+!3585 lt!509342 (tuple2!18323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!509338 () Unit!37354)

(declare-fun addStillContains!800 (ListLongMap!16291 (_ BitVec 64) V!43393 (_ BitVec 64)) Unit!37354)

(assert (=> b!1142710 (= lt!509338 (addStillContains!800 lt!509342 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!650071 () Unit!37354)

(assert (=> b!1142710 (= e!650071 lt!509334)))

(declare-fun mapIsEmpty!44873 () Bool)

(assert (=> mapIsEmpty!44873 mapRes!44873))

(declare-fun b!1142711 () Bool)

(declare-fun res!761451 () Bool)

(assert (=> b!1142711 (=> (not res!761451) (not e!650069))))

(assert (=> b!1142711 (= res!761451 (= (select (arr!35740 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!44873 () Bool)

(declare-fun tp!85217 () Bool)

(declare-fun e!650062 () Bool)

(assert (=> mapNonEmpty!44873 (= mapRes!44873 (and tp!85217 e!650062))))

(declare-fun mapValue!44873 () ValueCell!13640)

(declare-fun mapKey!44873 () (_ BitVec 32))

(declare-fun mapRest!44873 () (Array (_ BitVec 32) ValueCell!13640))

(assert (=> mapNonEmpty!44873 (= (arr!35741 _values!996) (store mapRest!44873 mapKey!44873 mapValue!44873))))

(declare-fun b!1142712 () Bool)

(declare-fun res!761455 () Bool)

(assert (=> b!1142712 (=> (not res!761455) (not e!650069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74178 (_ BitVec 32)) Bool)

(assert (=> b!1142712 (= res!761455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1142713 () Bool)

(declare-fun tp_is_empty!28699 () Bool)

(assert (=> b!1142713 (= e!650062 tp_is_empty!28699)))

(declare-fun b!1142714 () Bool)

(declare-fun e!650068 () Bool)

(declare-fun e!650064 () Bool)

(assert (=> b!1142714 (= e!650068 (not e!650064))))

(declare-fun res!761459 () Bool)

(assert (=> b!1142714 (=> res!761459 e!650064)))

(assert (=> b!1142714 (= res!761459 (bvsgt from!1455 i!673))))

(assert (=> b!1142714 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509335 () Unit!37354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74178 (_ BitVec 64) (_ BitVec 32)) Unit!37354)

(assert (=> b!1142714 (= lt!509335 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!761456 () Bool)

(assert (=> start!98558 (=> (not res!761456) (not e!650069))))

(assert (=> start!98558 (= res!761456 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36278 _keys!1208))))))

(assert (=> start!98558 e!650069))

(assert (=> start!98558 tp_is_empty!28699))

(declare-fun array_inv!27466 (array!74178) Bool)

(assert (=> start!98558 (array_inv!27466 _keys!1208)))

(assert (=> start!98558 true))

(assert (=> start!98558 tp!85218))

(declare-fun array_inv!27467 (array!74180) Bool)

(assert (=> start!98558 (and (array_inv!27467 _values!996) e!650058)))

(declare-fun b!1142715 () Bool)

(declare-fun e!650073 () Bool)

(declare-fun call!51550 () ListLongMap!16291)

(assert (=> b!1142715 (= e!650073 (= call!51552 call!51550))))

(declare-fun b!1142716 () Bool)

(assert (=> b!1142716 (= e!650069 e!650068)))

(declare-fun res!761458 () Bool)

(assert (=> b!1142716 (=> (not res!761458) (not e!650068))))

(assert (=> b!1142716 (= res!761458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509336 mask!1564))))

(assert (=> b!1142716 (= lt!509336 (array!74179 (store (arr!35740 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36278 _keys!1208)))))

(declare-fun b!1142717 () Bool)

(declare-fun res!761454 () Bool)

(assert (=> b!1142717 (=> (not res!761454) (not e!650069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142717 (= res!761454 (validMask!0 mask!1564))))

(declare-fun b!1142718 () Bool)

(assert (=> b!1142718 (= e!650073 (= call!51552 (-!1241 call!51550 k0!934)))))

(declare-fun b!1142719 () Bool)

(declare-fun e!650060 () Bool)

(assert (=> b!1142719 (= e!650060 e!650063)))

(declare-fun res!761446 () Bool)

(assert (=> b!1142719 (=> res!761446 e!650063)))

(assert (=> b!1142719 (= res!761446 (not (= (select (arr!35740 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1142719 e!650073))

(declare-fun c!112358 () Bool)

(assert (=> b!1142719 (= c!112358 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509331 () Unit!37354)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!522 (array!74178 array!74180 (_ BitVec 32) (_ BitVec 32) V!43393 V!43393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37354)

(assert (=> b!1142719 (= lt!509331 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!522 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!650066 () Bool)

(declare-fun b!1142720 () Bool)

(assert (=> b!1142720 (= e!650066 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51545 () Bool)

(declare-fun call!51551 () Unit!37354)

(assert (=> bm!51545 (= call!51551 call!51553)))

(declare-fun call!51548 () ListLongMap!16291)

(declare-fun c!112357 () Bool)

(declare-fun bm!51546 () Bool)

(assert (=> bm!51546 (= call!51547 (contains!6630 (ite c!112357 lt!509333 call!51548) k0!934))))

(declare-fun b!1142721 () Bool)

(declare-fun call!51549 () Bool)

(assert (=> b!1142721 call!51549))

(declare-fun lt!509326 () Unit!37354)

(assert (=> b!1142721 (= lt!509326 call!51551)))

(assert (=> b!1142721 (= e!650059 lt!509326)))

(declare-fun b!1142722 () Bool)

(declare-fun c!112355 () Bool)

(declare-fun lt!509339 () Bool)

(assert (=> b!1142722 (= c!112355 (and (not lt!509339) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650065 () Unit!37354)

(assert (=> b!1142722 (= e!650071 e!650065)))

(declare-fun b!1142723 () Bool)

(declare-fun res!761453 () Bool)

(assert (=> b!1142723 (=> (not res!761453) (not e!650069))))

(assert (=> b!1142723 (= res!761453 (and (= (size!36279 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36278 _keys!1208) (size!36279 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1142724 () Bool)

(assert (=> b!1142724 (= e!650064 e!650060)))

(declare-fun res!761447 () Bool)

(assert (=> b!1142724 (=> res!761447 e!650060)))

(assert (=> b!1142724 (= res!761447 (not (= from!1455 i!673)))))

(declare-fun lt!509337 () ListLongMap!16291)

(assert (=> b!1142724 (= lt!509337 (getCurrentListMapNoExtraKeys!4651 lt!509336 lt!509343 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1142724 (= lt!509343 (array!74181 (store (arr!35741 _values!996) i!673 (ValueCellFull!13640 lt!509325)) (size!36279 _values!996)))))

(declare-fun dynLambda!2630 (Int (_ BitVec 64)) V!43393)

(assert (=> b!1142724 (= lt!509325 (dynLambda!2630 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509329 () ListLongMap!16291)

(assert (=> b!1142724 (= lt!509329 (getCurrentListMapNoExtraKeys!4651 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1142725 () Bool)

(assert (=> b!1142725 (= e!650065 e!650059)))

(declare-fun c!112353 () Bool)

(assert (=> b!1142725 (= c!112353 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509339))))

(declare-fun b!1142726 () Bool)

(assert (=> b!1142726 (= e!650070 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509339) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1142727 () Bool)

(declare-fun res!761452 () Bool)

(assert (=> b!1142727 (=> (not res!761452) (not e!650068))))

(declare-datatypes ((List!25061 0))(
  ( (Nil!25058) (Cons!25057 (h!26266 (_ BitVec 64)) (t!36213 List!25061)) )
))
(declare-fun arrayNoDuplicates!0 (array!74178 (_ BitVec 32) List!25061) Bool)

(assert (=> b!1142727 (= res!761452 (arrayNoDuplicates!0 lt!509336 #b00000000000000000000000000000000 Nil!25058))))

(declare-fun b!1142728 () Bool)

(declare-fun res!761457 () Bool)

(assert (=> b!1142728 (=> (not res!761457) (not e!650069))))

(assert (=> b!1142728 (= res!761457 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25058))))

(declare-fun b!1142729 () Bool)

(declare-fun res!761448 () Bool)

(assert (=> b!1142729 (=> (not res!761448) (not e!650069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142729 (= res!761448 (validKeyInArray!0 k0!934))))

(declare-fun bm!51547 () Bool)

(assert (=> bm!51547 (= call!51548 call!51554)))

(declare-fun b!1142730 () Bool)

(declare-fun Unit!37357 () Unit!37354)

(assert (=> b!1142730 (= e!650067 Unit!37357)))

(assert (=> b!1142730 (= lt!509339 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1142730 (= c!112357 (and (not lt!509339) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509330 () Unit!37354)

(assert (=> b!1142730 (= lt!509330 e!650071)))

(declare-fun lt!509328 () Unit!37354)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!399 (array!74178 array!74180 (_ BitVec 32) (_ BitVec 32) V!43393 V!43393 (_ BitVec 64) (_ BitVec 32) Int) Unit!37354)

(assert (=> b!1142730 (= lt!509328 (lemmaListMapContainsThenArrayContainsFrom!399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112354 () Bool)

(assert (=> b!1142730 (= c!112354 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761450 () Bool)

(assert (=> b!1142730 (= res!761450 e!650070)))

(assert (=> b!1142730 (=> (not res!761450) (not e!650066))))

(assert (=> b!1142730 e!650066))

(declare-fun lt!509327 () Unit!37354)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74178 (_ BitVec 32) (_ BitVec 32)) Unit!37354)

(assert (=> b!1142730 (= lt!509327 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1142730 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25058)))

(declare-fun lt!509341 () Unit!37354)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74178 (_ BitVec 64) (_ BitVec 32) List!25061) Unit!37354)

(assert (=> b!1142730 (= lt!509341 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25058))))

(assert (=> b!1142730 false))

(declare-fun b!1142731 () Bool)

(declare-fun lt!509332 () Unit!37354)

(assert (=> b!1142731 (= e!650065 lt!509332)))

(assert (=> b!1142731 (= lt!509332 call!51551)))

(assert (=> b!1142731 call!51549))

(declare-fun b!1142732 () Bool)

(declare-fun Unit!37358 () Unit!37354)

(assert (=> b!1142732 (= e!650067 Unit!37358)))

(declare-fun bm!51548 () Bool)

(assert (=> bm!51548 (= call!51550 (getCurrentListMapNoExtraKeys!4651 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51549 () Bool)

(assert (=> bm!51549 (= call!51554 (+!3585 (ite c!112357 lt!509333 lt!509342) (ite c!112357 (tuple2!18323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112355 (tuple2!18323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!51550 () Bool)

(assert (=> bm!51550 (= call!51553 (addStillContains!800 (ite c!112357 lt!509333 lt!509342) (ite c!112357 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112355 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112357 minValue!944 (ite c!112355 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1142733 () Bool)

(assert (=> b!1142733 (= e!650061 tp_is_empty!28699)))

(declare-fun bm!51551 () Bool)

(assert (=> bm!51551 (= call!51549 call!51547)))

(assert (= (and start!98558 res!761456) b!1142717))

(assert (= (and b!1142717 res!761454) b!1142723))

(assert (= (and b!1142723 res!761453) b!1142712))

(assert (= (and b!1142712 res!761455) b!1142728))

(assert (= (and b!1142728 res!761457) b!1142708))

(assert (= (and b!1142708 res!761449) b!1142729))

(assert (= (and b!1142729 res!761448) b!1142711))

(assert (= (and b!1142711 res!761451) b!1142716))

(assert (= (and b!1142716 res!761458) b!1142727))

(assert (= (and b!1142727 res!761452) b!1142714))

(assert (= (and b!1142714 (not res!761459)) b!1142724))

(assert (= (and b!1142724 (not res!761447)) b!1142719))

(assert (= (and b!1142719 c!112358) b!1142718))

(assert (= (and b!1142719 (not c!112358)) b!1142715))

(assert (= (or b!1142718 b!1142715) bm!51544))

(assert (= (or b!1142718 b!1142715) bm!51548))

(assert (= (and b!1142719 (not res!761446)) b!1142706))

(assert (= (and b!1142706 c!112356) b!1142730))

(assert (= (and b!1142706 (not c!112356)) b!1142732))

(assert (= (and b!1142730 c!112357) b!1142710))

(assert (= (and b!1142730 (not c!112357)) b!1142722))

(assert (= (and b!1142722 c!112355) b!1142731))

(assert (= (and b!1142722 (not c!112355)) b!1142725))

(assert (= (and b!1142725 c!112353) b!1142721))

(assert (= (and b!1142725 (not c!112353)) b!1142707))

(assert (= (or b!1142731 b!1142721) bm!51545))

(assert (= (or b!1142731 b!1142721) bm!51547))

(assert (= (or b!1142731 b!1142721) bm!51551))

(assert (= (or b!1142710 bm!51551) bm!51546))

(assert (= (or b!1142710 bm!51545) bm!51550))

(assert (= (or b!1142710 bm!51547) bm!51549))

(assert (= (and b!1142730 c!112354) b!1142705))

(assert (= (and b!1142730 (not c!112354)) b!1142726))

(assert (= (and b!1142730 res!761450) b!1142720))

(assert (= (and b!1142709 condMapEmpty!44873) mapIsEmpty!44873))

(assert (= (and b!1142709 (not condMapEmpty!44873)) mapNonEmpty!44873))

(get-info :version)

(assert (= (and mapNonEmpty!44873 ((_ is ValueCellFull!13640) mapValue!44873)) b!1142713))

(assert (= (and b!1142709 ((_ is ValueCellFull!13640) mapDefault!44873)) b!1142733))

(assert (= start!98558 b!1142709))

(declare-fun b_lambda!19257 () Bool)

(assert (=> (not b_lambda!19257) (not b!1142724)))

(declare-fun t!36211 () Bool)

(declare-fun tb!8973 () Bool)

(assert (=> (and start!98558 (= defaultEntry!1004 defaultEntry!1004) t!36211) tb!8973))

(declare-fun result!18519 () Bool)

(assert (=> tb!8973 (= result!18519 tp_is_empty!28699)))

(assert (=> b!1142724 t!36211))

(declare-fun b_and!39167 () Bool)

(assert (= b_and!39165 (and (=> t!36211 result!18519) b_and!39167)))

(declare-fun m!1053447 () Bool)

(assert (=> b!1142712 m!1053447))

(declare-fun m!1053449 () Bool)

(assert (=> b!1142729 m!1053449))

(declare-fun m!1053451 () Bool)

(assert (=> b!1142710 m!1053451))

(declare-fun m!1053453 () Bool)

(assert (=> b!1142710 m!1053453))

(declare-fun m!1053455 () Bool)

(assert (=> b!1142710 m!1053455))

(declare-fun m!1053457 () Bool)

(assert (=> b!1142720 m!1053457))

(assert (=> b!1142705 m!1053457))

(declare-fun m!1053459 () Bool)

(assert (=> b!1142711 m!1053459))

(declare-fun m!1053461 () Bool)

(assert (=> b!1142714 m!1053461))

(declare-fun m!1053463 () Bool)

(assert (=> b!1142714 m!1053463))

(declare-fun m!1053465 () Bool)

(assert (=> bm!51550 m!1053465))

(declare-fun m!1053467 () Bool)

(assert (=> b!1142717 m!1053467))

(declare-fun m!1053469 () Bool)

(assert (=> b!1142730 m!1053469))

(declare-fun m!1053471 () Bool)

(assert (=> b!1142730 m!1053471))

(declare-fun m!1053473 () Bool)

(assert (=> b!1142730 m!1053473))

(declare-fun m!1053475 () Bool)

(assert (=> b!1142730 m!1053475))

(declare-fun m!1053477 () Bool)

(assert (=> b!1142727 m!1053477))

(declare-fun m!1053479 () Bool)

(assert (=> bm!51548 m!1053479))

(declare-fun m!1053481 () Bool)

(assert (=> mapNonEmpty!44873 m!1053481))

(declare-fun m!1053483 () Bool)

(assert (=> bm!51544 m!1053483))

(declare-fun m!1053485 () Bool)

(assert (=> bm!51549 m!1053485))

(declare-fun m!1053487 () Bool)

(assert (=> b!1142719 m!1053487))

(declare-fun m!1053489 () Bool)

(assert (=> b!1142719 m!1053489))

(declare-fun m!1053491 () Bool)

(assert (=> b!1142716 m!1053491))

(declare-fun m!1053493 () Bool)

(assert (=> b!1142716 m!1053493))

(declare-fun m!1053495 () Bool)

(assert (=> b!1142728 m!1053495))

(declare-fun m!1053497 () Bool)

(assert (=> b!1142724 m!1053497))

(declare-fun m!1053499 () Bool)

(assert (=> b!1142724 m!1053499))

(declare-fun m!1053501 () Bool)

(assert (=> b!1142724 m!1053501))

(declare-fun m!1053503 () Bool)

(assert (=> b!1142724 m!1053503))

(declare-fun m!1053505 () Bool)

(assert (=> bm!51546 m!1053505))

(assert (=> b!1142706 m!1053479))

(declare-fun m!1053507 () Bool)

(assert (=> b!1142706 m!1053507))

(declare-fun m!1053509 () Bool)

(assert (=> b!1142706 m!1053509))

(assert (=> b!1142706 m!1053507))

(declare-fun m!1053511 () Bool)

(assert (=> b!1142706 m!1053511))

(assert (=> b!1142706 m!1053487))

(declare-fun m!1053513 () Bool)

(assert (=> b!1142706 m!1053513))

(assert (=> b!1142706 m!1053511))

(assert (=> b!1142706 m!1053487))

(declare-fun m!1053515 () Bool)

(assert (=> b!1142706 m!1053515))

(declare-fun m!1053517 () Bool)

(assert (=> b!1142706 m!1053517))

(assert (=> b!1142706 m!1053487))

(declare-fun m!1053519 () Bool)

(assert (=> start!98558 m!1053519))

(declare-fun m!1053521 () Bool)

(assert (=> start!98558 m!1053521))

(declare-fun m!1053523 () Bool)

(assert (=> b!1142718 m!1053523))

(check-sat (not b!1142717) (not b!1142728) (not b!1142724) b_and!39167 (not mapNonEmpty!44873) (not b!1142720) (not b_lambda!19257) (not b!1142705) (not b!1142730) (not b!1142718) tp_is_empty!28699 (not b!1142710) (not b!1142727) (not b!1142706) (not b!1142714) (not bm!51544) (not b!1142716) (not b!1142712) (not start!98558) (not b!1142719) (not bm!51548) (not b!1142729) (not bm!51546) (not b_next!24169) (not bm!51550) (not bm!51549))
(check-sat b_and!39167 (not b_next!24169))
