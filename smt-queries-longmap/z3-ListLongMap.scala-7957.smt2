; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98818 () Bool)

(assert start!98818)

(declare-fun b_free!24187 () Bool)

(declare-fun b_next!24187 () Bool)

(assert (=> start!98818 (= b_free!24187 (not b_next!24187))))

(declare-fun tp!85272 () Bool)

(declare-fun b_and!39225 () Bool)

(assert (=> start!98818 (= tp!85272 b_and!39225)))

(declare-fun b!1144919 () Bool)

(declare-datatypes ((Unit!37508 0))(
  ( (Unit!37509) )
))
(declare-fun e!651401 () Unit!37508)

(declare-fun Unit!37510 () Unit!37508)

(assert (=> b!1144919 (= e!651401 Unit!37510)))

(declare-fun lt!510568 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1144919 (= lt!510568 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112939 () Bool)

(assert (=> b!1144919 (= c!112939 (and (not lt!510568) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510585 () Unit!37508)

(declare-fun e!651413 () Unit!37508)

(assert (=> b!1144919 (= lt!510585 e!651413)))

(declare-datatypes ((V!43417 0))(
  ( (V!43418 (val!14415 Int)) )
))
(declare-fun zeroValue!944 () V!43417)

(declare-datatypes ((array!74333 0))(
  ( (array!74334 (arr!35811 (Array (_ BitVec 32) (_ BitVec 64))) (size!36348 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74333)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13649 0))(
  ( (ValueCellFull!13649 (v!17048 V!43417)) (EmptyCell!13649) )
))
(declare-datatypes ((array!74335 0))(
  ( (array!74336 (arr!35812 (Array (_ BitVec 32) ValueCell!13649)) (size!36349 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74335)

(declare-fun lt!510575 () Unit!37508)

(declare-fun minValue!944 () V!43417)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!406 (array!74333 array!74335 (_ BitVec 32) (_ BitVec 32) V!43417 V!43417 (_ BitVec 64) (_ BitVec 32) Int) Unit!37508)

(assert (=> b!1144919 (= lt!510575 (lemmaListMapContainsThenArrayContainsFrom!406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112943 () Bool)

(assert (=> b!1144919 (= c!112943 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762409 () Bool)

(declare-fun e!651405 () Bool)

(assert (=> b!1144919 (= res!762409 e!651405)))

(declare-fun e!651404 () Bool)

(assert (=> b!1144919 (=> (not res!762409) (not e!651404))))

(assert (=> b!1144919 e!651404))

(declare-fun lt!510571 () Unit!37508)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74333 (_ BitVec 32) (_ BitVec 32)) Unit!37508)

(assert (=> b!1144919 (= lt!510571 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25020 0))(
  ( (Nil!25017) (Cons!25016 (h!26234 (_ BitVec 64)) (t!36191 List!25020)) )
))
(declare-fun arrayNoDuplicates!0 (array!74333 (_ BitVec 32) List!25020) Bool)

(assert (=> b!1144919 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25017)))

(declare-fun lt!510574 () Unit!37508)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74333 (_ BitVec 64) (_ BitVec 32) List!25020) Unit!37508)

(assert (=> b!1144919 (= lt!510574 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25017))))

(assert (=> b!1144919 false))

(declare-fun b!1144920 () Bool)

(declare-fun e!651402 () Bool)

(declare-datatypes ((tuple2!18264 0))(
  ( (tuple2!18265 (_1!9143 (_ BitVec 64)) (_2!9143 V!43417)) )
))
(declare-datatypes ((List!25021 0))(
  ( (Nil!25018) (Cons!25017 (h!26235 tuple2!18264) (t!36192 List!25021)) )
))
(declare-datatypes ((ListLongMap!16241 0))(
  ( (ListLongMap!16242 (toList!8136 List!25021)) )
))
(declare-fun call!51854 () ListLongMap!16241)

(declare-fun call!51857 () ListLongMap!16241)

(declare-fun -!1265 (ListLongMap!16241 (_ BitVec 64)) ListLongMap!16241)

(assert (=> b!1144920 (= e!651402 (= call!51857 (-!1265 call!51854 k0!934)))))

(declare-fun b!1144921 () Bool)

(assert (=> b!1144921 (= e!651402 (= call!51857 call!51854))))

(declare-fun bm!51848 () Bool)

(declare-fun lt!510566 () ListLongMap!16241)

(declare-fun call!51855 () Unit!37508)

(declare-fun c!112941 () Bool)

(declare-fun addStillContains!808 (ListLongMap!16241 (_ BitVec 64) V!43417 (_ BitVec 64)) Unit!37508)

(assert (=> bm!51848 (= call!51855 (addStillContains!808 lt!510566 (ite (or c!112939 c!112941) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112939 c!112941) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1144922 () Bool)

(declare-fun res!762410 () Bool)

(declare-fun e!651406 () Bool)

(assert (=> b!1144922 (=> (not res!762410) (not e!651406))))

(assert (=> b!1144922 (= res!762410 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25017))))

(declare-fun b!1144923 () Bool)

(declare-fun e!651411 () Bool)

(declare-fun tp_is_empty!28717 () Bool)

(assert (=> b!1144923 (= e!651411 tp_is_empty!28717)))

(declare-fun b!1144924 () Bool)

(declare-fun e!651400 () Unit!37508)

(declare-fun lt!510582 () Unit!37508)

(assert (=> b!1144924 (= e!651400 lt!510582)))

(declare-fun call!51856 () Unit!37508)

(assert (=> b!1144924 (= lt!510582 call!51856)))

(declare-fun call!51852 () Bool)

(assert (=> b!1144924 call!51852))

(declare-fun b!1144925 () Bool)

(declare-fun e!651410 () Bool)

(assert (=> b!1144925 (= e!651410 true)))

(declare-fun lt!510573 () V!43417)

(declare-fun +!3581 (ListLongMap!16241 tuple2!18264) ListLongMap!16241)

(assert (=> b!1144925 (= (-!1265 (+!3581 lt!510566 (tuple2!18265 (select (arr!35811 _keys!1208) from!1455) lt!510573)) (select (arr!35811 _keys!1208) from!1455)) lt!510566)))

(declare-fun lt!510578 () Unit!37508)

(declare-fun addThenRemoveForNewKeyIsSame!122 (ListLongMap!16241 (_ BitVec 64) V!43417) Unit!37508)

(assert (=> b!1144925 (= lt!510578 (addThenRemoveForNewKeyIsSame!122 lt!510566 (select (arr!35811 _keys!1208) from!1455) lt!510573))))

(declare-fun lt!510583 () V!43417)

(declare-fun get!18229 (ValueCell!13649 V!43417) V!43417)

(assert (=> b!1144925 (= lt!510573 (get!18229 (select (arr!35812 _values!996) from!1455) lt!510583))))

(declare-fun lt!510580 () Unit!37508)

(assert (=> b!1144925 (= lt!510580 e!651401)))

(declare-fun c!112940 () Bool)

(declare-fun contains!6680 (ListLongMap!16241 (_ BitVec 64)) Bool)

(assert (=> b!1144925 (= c!112940 (contains!6680 lt!510566 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4641 (array!74333 array!74335 (_ BitVec 32) (_ BitVec 32) V!43417 V!43417 (_ BitVec 32) Int) ListLongMap!16241)

(assert (=> b!1144925 (= lt!510566 (getCurrentListMapNoExtraKeys!4641 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!51858 () ListLongMap!16241)

(declare-fun bm!51849 () Bool)

(assert (=> bm!51849 (= call!51858 (+!3581 lt!510566 (ite (or c!112939 c!112941) (tuple2!18265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!51850 () Bool)

(declare-fun call!51853 () Bool)

(assert (=> bm!51850 (= call!51852 call!51853)))

(declare-fun b!1144926 () Bool)

(declare-fun arrayContainsKey!0 (array!74333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144926 (= e!651404 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51851 () Bool)

(assert (=> bm!51851 (= call!51856 call!51855)))

(declare-fun bm!51852 () Bool)

(declare-fun call!51851 () ListLongMap!16241)

(assert (=> bm!51852 (= call!51851 call!51858)))

(declare-fun b!1144927 () Bool)

(declare-fun res!762408 () Bool)

(assert (=> b!1144927 (=> (not res!762408) (not e!651406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74333 (_ BitVec 32)) Bool)

(assert (=> b!1144927 (= res!762408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1144928 () Bool)

(declare-fun e!651407 () Bool)

(assert (=> b!1144928 (= e!651407 e!651410)))

(declare-fun res!762400 () Bool)

(assert (=> b!1144928 (=> res!762400 e!651410)))

(assert (=> b!1144928 (= res!762400 (not (= (select (arr!35811 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1144928 e!651402))

(declare-fun c!112944 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144928 (= c!112944 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510586 () Unit!37508)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!515 (array!74333 array!74335 (_ BitVec 32) (_ BitVec 32) V!43417 V!43417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37508)

(assert (=> b!1144928 (= lt!510586 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44900 () Bool)

(declare-fun mapRes!44900 () Bool)

(declare-fun tp!85271 () Bool)

(assert (=> mapNonEmpty!44900 (= mapRes!44900 (and tp!85271 e!651411))))

(declare-fun mapKey!44900 () (_ BitVec 32))

(declare-fun mapValue!44900 () ValueCell!13649)

(declare-fun mapRest!44900 () (Array (_ BitVec 32) ValueCell!13649))

(assert (=> mapNonEmpty!44900 (= (arr!35812 _values!996) (store mapRest!44900 mapKey!44900 mapValue!44900))))

(declare-fun lt!510572 () array!74333)

(declare-fun lt!510576 () array!74335)

(declare-fun bm!51853 () Bool)

(assert (=> bm!51853 (= call!51857 (getCurrentListMapNoExtraKeys!4641 lt!510572 lt!510576 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144929 () Bool)

(assert (=> b!1144929 (= e!651405 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144930 () Bool)

(declare-fun e!651415 () Bool)

(assert (=> b!1144930 (= e!651406 e!651415)))

(declare-fun res!762399 () Bool)

(assert (=> b!1144930 (=> (not res!762399) (not e!651415))))

(assert (=> b!1144930 (= res!762399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510572 mask!1564))))

(assert (=> b!1144930 (= lt!510572 (array!74334 (store (arr!35811 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36348 _keys!1208)))))

(declare-fun b!1144931 () Bool)

(assert (=> b!1144931 (= c!112941 (and (not lt!510568) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1144931 (= e!651413 e!651400)))

(declare-fun res!762406 () Bool)

(assert (=> start!98818 (=> (not res!762406) (not e!651406))))

(assert (=> start!98818 (= res!762406 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36348 _keys!1208))))))

(assert (=> start!98818 e!651406))

(assert (=> start!98818 tp_is_empty!28717))

(declare-fun array_inv!27488 (array!74333) Bool)

(assert (=> start!98818 (array_inv!27488 _keys!1208)))

(assert (=> start!98818 true))

(assert (=> start!98818 tp!85272))

(declare-fun e!651414 () Bool)

(declare-fun array_inv!27489 (array!74335) Bool)

(assert (=> start!98818 (and (array_inv!27489 _values!996) e!651414)))

(declare-fun b!1144932 () Bool)

(declare-fun Unit!37511 () Unit!37508)

(assert (=> b!1144932 (= e!651401 Unit!37511)))

(declare-fun b!1144933 () Bool)

(declare-fun res!762401 () Bool)

(assert (=> b!1144933 (=> (not res!762401) (not e!651406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144933 (= res!762401 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44900 () Bool)

(assert (=> mapIsEmpty!44900 mapRes!44900))

(declare-fun bm!51854 () Bool)

(declare-fun lt!510577 () ListLongMap!16241)

(assert (=> bm!51854 (= call!51853 (contains!6680 (ite c!112939 lt!510577 call!51851) k0!934))))

(declare-fun b!1144934 () Bool)

(declare-fun e!651412 () Unit!37508)

(declare-fun Unit!37512 () Unit!37508)

(assert (=> b!1144934 (= e!651412 Unit!37512)))

(declare-fun b!1144935 () Bool)

(declare-fun res!762407 () Bool)

(assert (=> b!1144935 (=> (not res!762407) (not e!651415))))

(assert (=> b!1144935 (= res!762407 (arrayNoDuplicates!0 lt!510572 #b00000000000000000000000000000000 Nil!25017))))

(declare-fun bm!51855 () Bool)

(assert (=> bm!51855 (= call!51854 (getCurrentListMapNoExtraKeys!4641 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144936 () Bool)

(declare-fun res!762405 () Bool)

(assert (=> b!1144936 (=> (not res!762405) (not e!651406))))

(assert (=> b!1144936 (= res!762405 (= (select (arr!35811 _keys!1208) i!673) k0!934))))

(declare-fun b!1144937 () Bool)

(declare-fun res!762403 () Bool)

(assert (=> b!1144937 (=> (not res!762403) (not e!651406))))

(assert (=> b!1144937 (= res!762403 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36348 _keys!1208))))))

(declare-fun b!1144938 () Bool)

(assert (=> b!1144938 (= e!651405 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510568) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1144939 () Bool)

(declare-fun e!651409 () Bool)

(assert (=> b!1144939 (= e!651415 (not e!651409))))

(declare-fun res!762411 () Bool)

(assert (=> b!1144939 (=> res!762411 e!651409)))

(assert (=> b!1144939 (= res!762411 (bvsgt from!1455 i!673))))

(assert (=> b!1144939 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510569 () Unit!37508)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74333 (_ BitVec 64) (_ BitVec 32)) Unit!37508)

(assert (=> b!1144939 (= lt!510569 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1144940 () Bool)

(declare-fun e!651408 () Bool)

(assert (=> b!1144940 (= e!651408 tp_is_empty!28717)))

(declare-fun b!1144941 () Bool)

(assert (=> b!1144941 (contains!6680 (+!3581 lt!510577 (tuple2!18265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!510581 () Unit!37508)

(assert (=> b!1144941 (= lt!510581 (addStillContains!808 lt!510577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1144941 call!51853))

(assert (=> b!1144941 (= lt!510577 call!51858)))

(declare-fun lt!510570 () Unit!37508)

(assert (=> b!1144941 (= lt!510570 call!51855)))

(assert (=> b!1144941 (= e!651413 lt!510581)))

(declare-fun b!1144942 () Bool)

(assert (=> b!1144942 (= e!651409 e!651407)))

(declare-fun res!762402 () Bool)

(assert (=> b!1144942 (=> res!762402 e!651407)))

(assert (=> b!1144942 (= res!762402 (not (= from!1455 i!673)))))

(declare-fun lt!510584 () ListLongMap!16241)

(assert (=> b!1144942 (= lt!510584 (getCurrentListMapNoExtraKeys!4641 lt!510572 lt!510576 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1144942 (= lt!510576 (array!74336 (store (arr!35812 _values!996) i!673 (ValueCellFull!13649 lt!510583)) (size!36349 _values!996)))))

(declare-fun dynLambda!2674 (Int (_ BitVec 64)) V!43417)

(assert (=> b!1144942 (= lt!510583 (dynLambda!2674 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510567 () ListLongMap!16241)

(assert (=> b!1144942 (= lt!510567 (getCurrentListMapNoExtraKeys!4641 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1144943 () Bool)

(assert (=> b!1144943 call!51852))

(declare-fun lt!510579 () Unit!37508)

(assert (=> b!1144943 (= lt!510579 call!51856)))

(assert (=> b!1144943 (= e!651412 lt!510579)))

(declare-fun b!1144944 () Bool)

(assert (=> b!1144944 (= e!651400 e!651412)))

(declare-fun c!112942 () Bool)

(assert (=> b!1144944 (= c!112942 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510568))))

(declare-fun b!1144945 () Bool)

(assert (=> b!1144945 (= e!651414 (and e!651408 mapRes!44900))))

(declare-fun condMapEmpty!44900 () Bool)

(declare-fun mapDefault!44900 () ValueCell!13649)

(assert (=> b!1144945 (= condMapEmpty!44900 (= (arr!35812 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13649)) mapDefault!44900)))))

(declare-fun b!1144946 () Bool)

(declare-fun res!762398 () Bool)

(assert (=> b!1144946 (=> (not res!762398) (not e!651406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144946 (= res!762398 (validMask!0 mask!1564))))

(declare-fun b!1144947 () Bool)

(declare-fun res!762404 () Bool)

(assert (=> b!1144947 (=> (not res!762404) (not e!651406))))

(assert (=> b!1144947 (= res!762404 (and (= (size!36349 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36348 _keys!1208) (size!36349 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98818 res!762406) b!1144946))

(assert (= (and b!1144946 res!762398) b!1144947))

(assert (= (and b!1144947 res!762404) b!1144927))

(assert (= (and b!1144927 res!762408) b!1144922))

(assert (= (and b!1144922 res!762410) b!1144937))

(assert (= (and b!1144937 res!762403) b!1144933))

(assert (= (and b!1144933 res!762401) b!1144936))

(assert (= (and b!1144936 res!762405) b!1144930))

(assert (= (and b!1144930 res!762399) b!1144935))

(assert (= (and b!1144935 res!762407) b!1144939))

(assert (= (and b!1144939 (not res!762411)) b!1144942))

(assert (= (and b!1144942 (not res!762402)) b!1144928))

(assert (= (and b!1144928 c!112944) b!1144920))

(assert (= (and b!1144928 (not c!112944)) b!1144921))

(assert (= (or b!1144920 b!1144921) bm!51853))

(assert (= (or b!1144920 b!1144921) bm!51855))

(assert (= (and b!1144928 (not res!762400)) b!1144925))

(assert (= (and b!1144925 c!112940) b!1144919))

(assert (= (and b!1144925 (not c!112940)) b!1144932))

(assert (= (and b!1144919 c!112939) b!1144941))

(assert (= (and b!1144919 (not c!112939)) b!1144931))

(assert (= (and b!1144931 c!112941) b!1144924))

(assert (= (and b!1144931 (not c!112941)) b!1144944))

(assert (= (and b!1144944 c!112942) b!1144943))

(assert (= (and b!1144944 (not c!112942)) b!1144934))

(assert (= (or b!1144924 b!1144943) bm!51851))

(assert (= (or b!1144924 b!1144943) bm!51852))

(assert (= (or b!1144924 b!1144943) bm!51850))

(assert (= (or b!1144941 bm!51850) bm!51854))

(assert (= (or b!1144941 bm!51851) bm!51848))

(assert (= (or b!1144941 bm!51852) bm!51849))

(assert (= (and b!1144919 c!112943) b!1144929))

(assert (= (and b!1144919 (not c!112943)) b!1144938))

(assert (= (and b!1144919 res!762409) b!1144926))

(assert (= (and b!1144945 condMapEmpty!44900) mapIsEmpty!44900))

(assert (= (and b!1144945 (not condMapEmpty!44900)) mapNonEmpty!44900))

(get-info :version)

(assert (= (and mapNonEmpty!44900 ((_ is ValueCellFull!13649) mapValue!44900)) b!1144923))

(assert (= (and b!1144945 ((_ is ValueCellFull!13649) mapDefault!44900)) b!1144940))

(assert (= start!98818 b!1144945))

(declare-fun b_lambda!19287 () Bool)

(assert (=> (not b_lambda!19287) (not b!1144942)))

(declare-fun t!36190 () Bool)

(declare-fun tb!8991 () Bool)

(assert (=> (and start!98818 (= defaultEntry!1004 defaultEntry!1004) t!36190) tb!8991))

(declare-fun result!18555 () Bool)

(assert (=> tb!8991 (= result!18555 tp_is_empty!28717)))

(assert (=> b!1144942 t!36190))

(declare-fun b_and!39227 () Bool)

(assert (= b_and!39225 (and (=> t!36190 result!18555) b_and!39227)))

(declare-fun m!1056323 () Bool)

(assert (=> bm!51855 m!1056323))

(declare-fun m!1056325 () Bool)

(assert (=> start!98818 m!1056325))

(declare-fun m!1056327 () Bool)

(assert (=> start!98818 m!1056327))

(declare-fun m!1056329 () Bool)

(assert (=> b!1144925 m!1056329))

(assert (=> b!1144925 m!1056323))

(declare-fun m!1056331 () Bool)

(assert (=> b!1144925 m!1056331))

(declare-fun m!1056333 () Bool)

(assert (=> b!1144925 m!1056333))

(assert (=> b!1144925 m!1056331))

(declare-fun m!1056335 () Bool)

(assert (=> b!1144925 m!1056335))

(assert (=> b!1144925 m!1056329))

(declare-fun m!1056337 () Bool)

(assert (=> b!1144925 m!1056337))

(declare-fun m!1056339 () Bool)

(assert (=> b!1144925 m!1056339))

(assert (=> b!1144925 m!1056337))

(declare-fun m!1056341 () Bool)

(assert (=> b!1144925 m!1056341))

(assert (=> b!1144925 m!1056337))

(declare-fun m!1056343 () Bool)

(assert (=> b!1144919 m!1056343))

(declare-fun m!1056345 () Bool)

(assert (=> b!1144919 m!1056345))

(declare-fun m!1056347 () Bool)

(assert (=> b!1144919 m!1056347))

(declare-fun m!1056349 () Bool)

(assert (=> b!1144919 m!1056349))

(declare-fun m!1056351 () Bool)

(assert (=> b!1144935 m!1056351))

(declare-fun m!1056353 () Bool)

(assert (=> b!1144942 m!1056353))

(declare-fun m!1056355 () Bool)

(assert (=> b!1144942 m!1056355))

(declare-fun m!1056357 () Bool)

(assert (=> b!1144942 m!1056357))

(declare-fun m!1056359 () Bool)

(assert (=> b!1144942 m!1056359))

(declare-fun m!1056361 () Bool)

(assert (=> b!1144926 m!1056361))

(declare-fun m!1056363 () Bool)

(assert (=> bm!51849 m!1056363))

(declare-fun m!1056365 () Bool)

(assert (=> bm!51848 m!1056365))

(declare-fun m!1056367 () Bool)

(assert (=> b!1144936 m!1056367))

(declare-fun m!1056369 () Bool)

(assert (=> b!1144939 m!1056369))

(declare-fun m!1056371 () Bool)

(assert (=> b!1144939 m!1056371))

(declare-fun m!1056373 () Bool)

(assert (=> b!1144941 m!1056373))

(assert (=> b!1144941 m!1056373))

(declare-fun m!1056375 () Bool)

(assert (=> b!1144941 m!1056375))

(declare-fun m!1056377 () Bool)

(assert (=> b!1144941 m!1056377))

(declare-fun m!1056379 () Bool)

(assert (=> bm!51854 m!1056379))

(assert (=> b!1144929 m!1056361))

(declare-fun m!1056381 () Bool)

(assert (=> b!1144930 m!1056381))

(declare-fun m!1056383 () Bool)

(assert (=> b!1144930 m!1056383))

(declare-fun m!1056385 () Bool)

(assert (=> b!1144933 m!1056385))

(assert (=> b!1144928 m!1056337))

(declare-fun m!1056387 () Bool)

(assert (=> b!1144928 m!1056387))

(declare-fun m!1056389 () Bool)

(assert (=> bm!51853 m!1056389))

(declare-fun m!1056391 () Bool)

(assert (=> b!1144927 m!1056391))

(declare-fun m!1056393 () Bool)

(assert (=> b!1144922 m!1056393))

(declare-fun m!1056395 () Bool)

(assert (=> b!1144920 m!1056395))

(declare-fun m!1056397 () Bool)

(assert (=> mapNonEmpty!44900 m!1056397))

(declare-fun m!1056399 () Bool)

(assert (=> b!1144946 m!1056399))

(check-sat (not bm!51853) (not b!1144935) (not bm!51854) (not bm!51848) (not b!1144926) (not b!1144942) (not b_lambda!19287) (not b!1144920) (not b_next!24187) (not b!1144939) (not b!1144919) (not b!1144922) (not b!1144941) (not b!1144925) b_and!39227 (not b!1144933) (not b!1144929) (not b!1144930) (not b!1144927) (not b!1144946) (not start!98818) (not bm!51855) (not bm!51849) (not b!1144928) tp_is_empty!28717 (not mapNonEmpty!44900))
(check-sat b_and!39227 (not b_next!24187))
