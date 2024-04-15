; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98432 () Bool)

(assert start!98432)

(declare-fun b_free!24043 () Bool)

(declare-fun b_next!24043 () Bool)

(assert (=> start!98432 (= b_free!24043 (not b_next!24043))))

(declare-fun tp!84839 () Bool)

(declare-fun b_and!38913 () Bool)

(assert (=> start!98432 (= tp!84839 b_and!38913)))

(declare-fun b!1137098 () Bool)

(declare-fun c!111224 () Bool)

(declare-fun lt!505572 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1137098 (= c!111224 (and (not lt!505572) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37098 0))(
  ( (Unit!37099) )
))
(declare-fun e!647038 () Unit!37098)

(declare-fun e!647046 () Unit!37098)

(assert (=> b!1137098 (= e!647038 e!647046)))

(declare-fun b!1137099 () Bool)

(declare-fun e!647039 () Bool)

(declare-fun e!647036 () Bool)

(assert (=> b!1137099 (= e!647039 (not e!647036))))

(declare-fun res!758805 () Bool)

(assert (=> b!1137099 (=> res!758805 e!647036)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137099 (= res!758805 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73928 0))(
  ( (array!73929 (arr!35615 (Array (_ BitVec 32) (_ BitVec 64))) (size!36153 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73928)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137099 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505570 () Unit!37098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73928 (_ BitVec 64) (_ BitVec 32)) Unit!37098)

(assert (=> b!1137099 (= lt!505570 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1137100 () Bool)

(declare-fun e!647040 () Unit!37098)

(declare-fun Unit!37100 () Unit!37098)

(assert (=> b!1137100 (= e!647040 Unit!37100)))

(declare-fun b!1137101 () Bool)

(declare-fun lt!505562 () Unit!37098)

(assert (=> b!1137101 (= e!647046 lt!505562)))

(declare-fun call!50042 () Unit!37098)

(assert (=> b!1137101 (= lt!505562 call!50042)))

(declare-fun call!50039 () Bool)

(assert (=> b!1137101 call!50039))

(declare-fun e!647044 () Bool)

(declare-fun b!1137102 () Bool)

(assert (=> b!1137102 (= e!647044 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137103 () Bool)

(declare-fun res!758804 () Bool)

(declare-fun e!647045 () Bool)

(assert (=> b!1137103 (=> (not res!758804) (not e!647045))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73928 (_ BitVec 32)) Bool)

(assert (=> b!1137103 (= res!758804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1137104 () Bool)

(assert (=> b!1137104 (= e!647044 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505572) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1137105 () Bool)

(declare-fun e!647047 () Bool)

(assert (=> b!1137105 (= e!647047 true)))

(declare-fun lt!505564 () Unit!37098)

(declare-fun e!647041 () Unit!37098)

(assert (=> b!1137105 (= lt!505564 e!647041)))

(declare-fun c!111223 () Bool)

(declare-datatypes ((V!43225 0))(
  ( (V!43226 (val!14343 Int)) )
))
(declare-datatypes ((tuple2!18200 0))(
  ( (tuple2!18201 (_1!9111 (_ BitVec 64)) (_2!9111 V!43225)) )
))
(declare-datatypes ((List!24944 0))(
  ( (Nil!24941) (Cons!24940 (h!26149 tuple2!18200) (t!35970 List!24944)) )
))
(declare-datatypes ((ListLongMap!16169 0))(
  ( (ListLongMap!16170 (toList!8100 List!24944)) )
))
(declare-fun lt!505559 () ListLongMap!16169)

(declare-fun contains!6575 (ListLongMap!16169 (_ BitVec 64)) Bool)

(assert (=> b!1137105 (= c!111223 (contains!6575 lt!505559 k0!934))))

(declare-fun zeroValue!944 () V!43225)

(declare-fun minValue!944 () V!43225)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13577 0))(
  ( (ValueCellFull!13577 (v!16979 V!43225)) (EmptyCell!13577) )
))
(declare-datatypes ((array!73930 0))(
  ( (array!73931 (arr!35616 (Array (_ BitVec 32) ValueCell!13577)) (size!36154 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73930)

(declare-fun getCurrentListMapNoExtraKeys!4596 (array!73928 array!73930 (_ BitVec 32) (_ BitVec 32) V!43225 V!43225 (_ BitVec 32) Int) ListLongMap!16169)

(assert (=> b!1137105 (= lt!505559 (getCurrentListMapNoExtraKeys!4596 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137106 () Bool)

(declare-fun e!647037 () Bool)

(declare-fun e!647048 () Bool)

(declare-fun mapRes!44684 () Bool)

(assert (=> b!1137106 (= e!647037 (and e!647048 mapRes!44684))))

(declare-fun condMapEmpty!44684 () Bool)

(declare-fun mapDefault!44684 () ValueCell!13577)

(assert (=> b!1137106 (= condMapEmpty!44684 (= (arr!35616 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13577)) mapDefault!44684)))))

(declare-fun e!647034 () Bool)

(declare-fun call!50036 () ListLongMap!16169)

(declare-fun call!50037 () ListLongMap!16169)

(declare-fun b!1137107 () Bool)

(declare-fun -!1195 (ListLongMap!16169 (_ BitVec 64)) ListLongMap!16169)

(assert (=> b!1137107 (= e!647034 (= call!50036 (-!1195 call!50037 k0!934)))))

(declare-fun bm!50032 () Bool)

(declare-fun call!50040 () ListLongMap!16169)

(declare-fun call!50038 () ListLongMap!16169)

(assert (=> bm!50032 (= call!50040 call!50038)))

(declare-fun bm!50033 () Bool)

(assert (=> bm!50033 (= call!50037 (getCurrentListMapNoExtraKeys!4596 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137108 () Bool)

(declare-fun Unit!37101 () Unit!37098)

(assert (=> b!1137108 (= e!647041 Unit!37101)))

(declare-fun bm!50034 () Bool)

(declare-fun call!50035 () Bool)

(assert (=> bm!50034 (= call!50039 call!50035)))

(declare-fun b!1137109 () Bool)

(declare-fun e!647042 () Bool)

(assert (=> b!1137109 (= e!647042 e!647047)))

(declare-fun res!758812 () Bool)

(assert (=> b!1137109 (=> res!758812 e!647047)))

(assert (=> b!1137109 (= res!758812 (not (= (select (arr!35615 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1137109 e!647034))

(declare-fun c!111222 () Bool)

(assert (=> b!1137109 (= c!111222 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505571 () Unit!37098)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!478 (array!73928 array!73930 (_ BitVec 32) (_ BitVec 32) V!43225 V!43225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37098)

(assert (=> b!1137109 (= lt!505571 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137110 () Bool)

(declare-fun res!758800 () Bool)

(assert (=> b!1137110 (=> (not res!758800) (not e!647039))))

(declare-fun lt!505569 () array!73928)

(declare-datatypes ((List!24945 0))(
  ( (Nil!24942) (Cons!24941 (h!26150 (_ BitVec 64)) (t!35971 List!24945)) )
))
(declare-fun arrayNoDuplicates!0 (array!73928 (_ BitVec 32) List!24945) Bool)

(assert (=> b!1137110 (= res!758800 (arrayNoDuplicates!0 lt!505569 #b00000000000000000000000000000000 Nil!24942))))

(declare-fun e!647043 () Bool)

(declare-fun b!1137111 () Bool)

(assert (=> b!1137111 (= e!647043 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50035 () Bool)

(declare-fun call!50041 () Unit!37098)

(assert (=> bm!50035 (= call!50042 call!50041)))

(declare-fun b!1137112 () Bool)

(declare-fun res!758811 () Bool)

(assert (=> b!1137112 (=> (not res!758811) (not e!647045))))

(assert (=> b!1137112 (= res!758811 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36153 _keys!1208))))))

(declare-fun b!1137113 () Bool)

(declare-fun Unit!37102 () Unit!37098)

(assert (=> b!1137113 (= e!647041 Unit!37102)))

(assert (=> b!1137113 (= lt!505572 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111221 () Bool)

(assert (=> b!1137113 (= c!111221 (and (not lt!505572) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505560 () Unit!37098)

(assert (=> b!1137113 (= lt!505560 e!647038)))

(declare-fun lt!505555 () Unit!37098)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!358 (array!73928 array!73930 (_ BitVec 32) (_ BitVec 32) V!43225 V!43225 (_ BitVec 64) (_ BitVec 32) Int) Unit!37098)

(assert (=> b!1137113 (= lt!505555 (lemmaListMapContainsThenArrayContainsFrom!358 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111220 () Bool)

(assert (=> b!1137113 (= c!111220 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!758801 () Bool)

(assert (=> b!1137113 (= res!758801 e!647044)))

(assert (=> b!1137113 (=> (not res!758801) (not e!647043))))

(assert (=> b!1137113 e!647043))

(declare-fun lt!505557 () Unit!37098)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73928 (_ BitVec 32) (_ BitVec 32)) Unit!37098)

(assert (=> b!1137113 (= lt!505557 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1137113 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24942)))

(declare-fun lt!505568 () Unit!37098)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!73928 (_ BitVec 64) (_ BitVec 32) List!24945) Unit!37098)

(assert (=> b!1137113 (= lt!505568 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24942))))

(assert (=> b!1137113 false))

(declare-fun res!758803 () Bool)

(assert (=> start!98432 (=> (not res!758803) (not e!647045))))

(assert (=> start!98432 (= res!758803 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36153 _keys!1208))))))

(assert (=> start!98432 e!647045))

(declare-fun tp_is_empty!28573 () Bool)

(assert (=> start!98432 tp_is_empty!28573))

(declare-fun array_inv!27380 (array!73928) Bool)

(assert (=> start!98432 (array_inv!27380 _keys!1208)))

(assert (=> start!98432 true))

(assert (=> start!98432 tp!84839))

(declare-fun array_inv!27381 (array!73930) Bool)

(assert (=> start!98432 (and (array_inv!27381 _values!996) e!647037)))

(declare-fun b!1137114 () Bool)

(declare-fun res!758809 () Bool)

(assert (=> b!1137114 (=> (not res!758809) (not e!647045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137114 (= res!758809 (validKeyInArray!0 k0!934))))

(declare-fun b!1137115 () Bool)

(declare-fun res!758808 () Bool)

(assert (=> b!1137115 (=> (not res!758808) (not e!647045))))

(assert (=> b!1137115 (= res!758808 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24942))))

(declare-fun mapIsEmpty!44684 () Bool)

(assert (=> mapIsEmpty!44684 mapRes!44684))

(declare-fun b!1137116 () Bool)

(declare-fun lt!505561 () ListLongMap!16169)

(declare-fun +!3530 (ListLongMap!16169 tuple2!18200) ListLongMap!16169)

(assert (=> b!1137116 (contains!6575 (+!3530 lt!505561 (tuple2!18201 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!505563 () Unit!37098)

(assert (=> b!1137116 (= lt!505563 call!50041)))

(assert (=> b!1137116 call!50035))

(assert (=> b!1137116 (= lt!505561 call!50038)))

(declare-fun lt!505567 () Unit!37098)

(declare-fun addStillContains!749 (ListLongMap!16169 (_ BitVec 64) V!43225 (_ BitVec 64)) Unit!37098)

(assert (=> b!1137116 (= lt!505567 (addStillContains!749 lt!505559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1137116 (= e!647038 lt!505563)))

(declare-fun b!1137117 () Bool)

(declare-fun res!758807 () Bool)

(assert (=> b!1137117 (=> (not res!758807) (not e!647045))))

(assert (=> b!1137117 (= res!758807 (and (= (size!36154 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36153 _keys!1208) (size!36154 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44684 () Bool)

(declare-fun tp!84840 () Bool)

(declare-fun e!647049 () Bool)

(assert (=> mapNonEmpty!44684 (= mapRes!44684 (and tp!84840 e!647049))))

(declare-fun mapValue!44684 () ValueCell!13577)

(declare-fun mapKey!44684 () (_ BitVec 32))

(declare-fun mapRest!44684 () (Array (_ BitVec 32) ValueCell!13577))

(assert (=> mapNonEmpty!44684 (= (arr!35616 _values!996) (store mapRest!44684 mapKey!44684 mapValue!44684))))

(declare-fun lt!505558 () array!73930)

(declare-fun bm!50036 () Bool)

(assert (=> bm!50036 (= call!50036 (getCurrentListMapNoExtraKeys!4596 lt!505569 lt!505558 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137118 () Bool)

(assert (=> b!1137118 call!50039))

(declare-fun lt!505566 () Unit!37098)

(assert (=> b!1137118 (= lt!505566 call!50042)))

(assert (=> b!1137118 (= e!647040 lt!505566)))

(declare-fun b!1137119 () Bool)

(assert (=> b!1137119 (= e!647045 e!647039)))

(declare-fun res!758810 () Bool)

(assert (=> b!1137119 (=> (not res!758810) (not e!647039))))

(assert (=> b!1137119 (= res!758810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505569 mask!1564))))

(assert (=> b!1137119 (= lt!505569 (array!73929 (store (arr!35615 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36153 _keys!1208)))))

(declare-fun b!1137120 () Bool)

(assert (=> b!1137120 (= e!647048 tp_is_empty!28573)))

(declare-fun b!1137121 () Bool)

(assert (=> b!1137121 (= e!647034 (= call!50036 call!50037))))

(declare-fun bm!50037 () Bool)

(assert (=> bm!50037 (= call!50038 (+!3530 lt!505559 (ite (or c!111221 c!111224) (tuple2!18201 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18201 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1137122 () Bool)

(assert (=> b!1137122 (= e!647049 tp_is_empty!28573)))

(declare-fun b!1137123 () Bool)

(declare-fun res!758802 () Bool)

(assert (=> b!1137123 (=> (not res!758802) (not e!647045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137123 (= res!758802 (validMask!0 mask!1564))))

(declare-fun b!1137124 () Bool)

(declare-fun res!758806 () Bool)

(assert (=> b!1137124 (=> (not res!758806) (not e!647045))))

(assert (=> b!1137124 (= res!758806 (= (select (arr!35615 _keys!1208) i!673) k0!934))))

(declare-fun bm!50038 () Bool)

(assert (=> bm!50038 (= call!50035 (contains!6575 (ite c!111221 lt!505561 call!50040) k0!934))))

(declare-fun b!1137125 () Bool)

(assert (=> b!1137125 (= e!647036 e!647042)))

(declare-fun res!758813 () Bool)

(assert (=> b!1137125 (=> res!758813 e!647042)))

(assert (=> b!1137125 (= res!758813 (not (= from!1455 i!673)))))

(declare-fun lt!505565 () ListLongMap!16169)

(assert (=> b!1137125 (= lt!505565 (getCurrentListMapNoExtraKeys!4596 lt!505569 lt!505558 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2589 (Int (_ BitVec 64)) V!43225)

(assert (=> b!1137125 (= lt!505558 (array!73931 (store (arr!35616 _values!996) i!673 (ValueCellFull!13577 (dynLambda!2589 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36154 _values!996)))))

(declare-fun lt!505556 () ListLongMap!16169)

(assert (=> b!1137125 (= lt!505556 (getCurrentListMapNoExtraKeys!4596 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!50039 () Bool)

(assert (=> bm!50039 (= call!50041 (addStillContains!749 (ite c!111221 lt!505561 lt!505559) (ite c!111221 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111224 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111221 minValue!944 (ite c!111224 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1137126 () Bool)

(assert (=> b!1137126 (= e!647046 e!647040)))

(declare-fun c!111219 () Bool)

(assert (=> b!1137126 (= c!111219 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505572))))

(assert (= (and start!98432 res!758803) b!1137123))

(assert (= (and b!1137123 res!758802) b!1137117))

(assert (= (and b!1137117 res!758807) b!1137103))

(assert (= (and b!1137103 res!758804) b!1137115))

(assert (= (and b!1137115 res!758808) b!1137112))

(assert (= (and b!1137112 res!758811) b!1137114))

(assert (= (and b!1137114 res!758809) b!1137124))

(assert (= (and b!1137124 res!758806) b!1137119))

(assert (= (and b!1137119 res!758810) b!1137110))

(assert (= (and b!1137110 res!758800) b!1137099))

(assert (= (and b!1137099 (not res!758805)) b!1137125))

(assert (= (and b!1137125 (not res!758813)) b!1137109))

(assert (= (and b!1137109 c!111222) b!1137107))

(assert (= (and b!1137109 (not c!111222)) b!1137121))

(assert (= (or b!1137107 b!1137121) bm!50036))

(assert (= (or b!1137107 b!1137121) bm!50033))

(assert (= (and b!1137109 (not res!758812)) b!1137105))

(assert (= (and b!1137105 c!111223) b!1137113))

(assert (= (and b!1137105 (not c!111223)) b!1137108))

(assert (= (and b!1137113 c!111221) b!1137116))

(assert (= (and b!1137113 (not c!111221)) b!1137098))

(assert (= (and b!1137098 c!111224) b!1137101))

(assert (= (and b!1137098 (not c!111224)) b!1137126))

(assert (= (and b!1137126 c!111219) b!1137118))

(assert (= (and b!1137126 (not c!111219)) b!1137100))

(assert (= (or b!1137101 b!1137118) bm!50035))

(assert (= (or b!1137101 b!1137118) bm!50032))

(assert (= (or b!1137101 b!1137118) bm!50034))

(assert (= (or b!1137116 bm!50034) bm!50038))

(assert (= (or b!1137116 bm!50035) bm!50039))

(assert (= (or b!1137116 bm!50032) bm!50037))

(assert (= (and b!1137113 c!111220) b!1137102))

(assert (= (and b!1137113 (not c!111220)) b!1137104))

(assert (= (and b!1137113 res!758801) b!1137111))

(assert (= (and b!1137106 condMapEmpty!44684) mapIsEmpty!44684))

(assert (= (and b!1137106 (not condMapEmpty!44684)) mapNonEmpty!44684))

(get-info :version)

(assert (= (and mapNonEmpty!44684 ((_ is ValueCellFull!13577) mapValue!44684)) b!1137122))

(assert (= (and b!1137106 ((_ is ValueCellFull!13577) mapDefault!44684)) b!1137120))

(assert (= start!98432 b!1137106))

(declare-fun b_lambda!19131 () Bool)

(assert (=> (not b_lambda!19131) (not b!1137125)))

(declare-fun t!35969 () Bool)

(declare-fun tb!8847 () Bool)

(assert (=> (and start!98432 (= defaultEntry!1004 defaultEntry!1004) t!35969) tb!8847))

(declare-fun result!18267 () Bool)

(assert (=> tb!8847 (= result!18267 tp_is_empty!28573)))

(assert (=> b!1137125 t!35969))

(declare-fun b_and!38915 () Bool)

(assert (= b_and!38913 (and (=> t!35969 result!18267) b_and!38915)))

(declare-fun m!1048761 () Bool)

(assert (=> b!1137113 m!1048761))

(declare-fun m!1048763 () Bool)

(assert (=> b!1137113 m!1048763))

(declare-fun m!1048765 () Bool)

(assert (=> b!1137113 m!1048765))

(declare-fun m!1048767 () Bool)

(assert (=> b!1137113 m!1048767))

(declare-fun m!1048769 () Bool)

(assert (=> bm!50037 m!1048769))

(declare-fun m!1048771 () Bool)

(assert (=> bm!50039 m!1048771))

(declare-fun m!1048773 () Bool)

(assert (=> b!1137103 m!1048773))

(declare-fun m!1048775 () Bool)

(assert (=> b!1137125 m!1048775))

(declare-fun m!1048777 () Bool)

(assert (=> b!1137125 m!1048777))

(declare-fun m!1048779 () Bool)

(assert (=> b!1137125 m!1048779))

(declare-fun m!1048781 () Bool)

(assert (=> b!1137125 m!1048781))

(declare-fun m!1048783 () Bool)

(assert (=> b!1137102 m!1048783))

(declare-fun m!1048785 () Bool)

(assert (=> b!1137114 m!1048785))

(declare-fun m!1048787 () Bool)

(assert (=> mapNonEmpty!44684 m!1048787))

(assert (=> b!1137111 m!1048783))

(declare-fun m!1048789 () Bool)

(assert (=> b!1137109 m!1048789))

(declare-fun m!1048791 () Bool)

(assert (=> b!1137109 m!1048791))

(declare-fun m!1048793 () Bool)

(assert (=> b!1137105 m!1048793))

(declare-fun m!1048795 () Bool)

(assert (=> b!1137105 m!1048795))

(declare-fun m!1048797 () Bool)

(assert (=> b!1137116 m!1048797))

(assert (=> b!1137116 m!1048797))

(declare-fun m!1048799 () Bool)

(assert (=> b!1137116 m!1048799))

(declare-fun m!1048801 () Bool)

(assert (=> b!1137116 m!1048801))

(declare-fun m!1048803 () Bool)

(assert (=> bm!50036 m!1048803))

(declare-fun m!1048805 () Bool)

(assert (=> b!1137107 m!1048805))

(declare-fun m!1048807 () Bool)

(assert (=> b!1137115 m!1048807))

(declare-fun m!1048809 () Bool)

(assert (=> b!1137099 m!1048809))

(declare-fun m!1048811 () Bool)

(assert (=> b!1137099 m!1048811))

(declare-fun m!1048813 () Bool)

(assert (=> b!1137110 m!1048813))

(assert (=> bm!50033 m!1048795))

(declare-fun m!1048815 () Bool)

(assert (=> b!1137123 m!1048815))

(declare-fun m!1048817 () Bool)

(assert (=> start!98432 m!1048817))

(declare-fun m!1048819 () Bool)

(assert (=> start!98432 m!1048819))

(declare-fun m!1048821 () Bool)

(assert (=> b!1137124 m!1048821))

(declare-fun m!1048823 () Bool)

(assert (=> bm!50038 m!1048823))

(declare-fun m!1048825 () Bool)

(assert (=> b!1137119 m!1048825))

(declare-fun m!1048827 () Bool)

(assert (=> b!1137119 m!1048827))

(check-sat (not bm!50037) tp_is_empty!28573 (not b!1137107) (not b!1137125) (not b!1137115) (not b!1137103) (not b_next!24043) (not b!1137119) (not start!98432) (not b_lambda!19131) (not b!1137102) (not b!1137114) (not b!1137110) (not b!1137105) b_and!38915 (not bm!50039) (not b!1137111) (not bm!50036) (not mapNonEmpty!44684) (not bm!50038) (not bm!50033) (not b!1137116) (not b!1137099) (not b!1137113) (not b!1137109) (not b!1137123))
(check-sat b_and!38915 (not b_next!24043))
