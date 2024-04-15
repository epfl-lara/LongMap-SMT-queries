; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98366 () Bool)

(assert start!98366)

(declare-fun b_free!23977 () Bool)

(declare-fun b_next!23977 () Bool)

(assert (=> start!98366 (= b_free!23977 (not b_next!23977))))

(declare-fun tp!84642 () Bool)

(declare-fun b_and!38781 () Bool)

(assert (=> start!98366 (= tp!84642 b_and!38781)))

(declare-fun b!1134003 () Bool)

(declare-fun e!645383 () Bool)

(declare-fun e!645386 () Bool)

(assert (=> b!1134003 (= e!645383 e!645386)))

(declare-fun res!757100 () Bool)

(assert (=> b!1134003 (=> res!757100 e!645386)))

(declare-datatypes ((array!73798 0))(
  ( (array!73799 (arr!35550 (Array (_ BitVec 32) (_ BitVec 64))) (size!36088 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73798)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1134003 (= res!757100 (not (= (select (arr!35550 _keys!1208) from!1455) k0!934)))))

(declare-fun e!645373 () Bool)

(assert (=> b!1134003 e!645373))

(declare-fun c!110705 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134003 (= c!110705 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43137 0))(
  ( (V!43138 (val!14310 Int)) )
))
(declare-fun zeroValue!944 () V!43137)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13544 0))(
  ( (ValueCellFull!13544 (v!16946 V!43137)) (EmptyCell!13544) )
))
(declare-datatypes ((array!73800 0))(
  ( (array!73801 (arr!35551 (Array (_ BitVec 32) ValueCell!13544)) (size!36089 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73800)

(declare-fun minValue!944 () V!43137)

(declare-datatypes ((Unit!36999 0))(
  ( (Unit!37000) )
))
(declare-fun lt!503859 () Unit!36999)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!453 (array!73798 array!73800 (_ BitVec 32) (_ BitVec 32) V!43137 V!43137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36999)

(assert (=> b!1134003 (= lt!503859 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!757111 () Bool)

(declare-fun e!645375 () Bool)

(assert (=> start!98366 (=> (not res!757111) (not e!645375))))

(assert (=> start!98366 (= res!757111 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36088 _keys!1208))))))

(assert (=> start!98366 e!645375))

(declare-fun tp_is_empty!28507 () Bool)

(assert (=> start!98366 tp_is_empty!28507))

(declare-fun array_inv!27338 (array!73798) Bool)

(assert (=> start!98366 (array_inv!27338 _keys!1208)))

(assert (=> start!98366 true))

(assert (=> start!98366 tp!84642))

(declare-fun e!645374 () Bool)

(declare-fun array_inv!27339 (array!73800) Bool)

(assert (=> start!98366 (and (array_inv!27339 _values!996) e!645374)))

(declare-fun bm!49240 () Bool)

(declare-fun call!49244 () Unit!36999)

(declare-fun call!49246 () Unit!36999)

(assert (=> bm!49240 (= call!49244 call!49246)))

(declare-fun b!1134004 () Bool)

(declare-fun res!757110 () Bool)

(declare-fun e!645384 () Bool)

(assert (=> b!1134004 (=> (not res!757110) (not e!645384))))

(declare-fun lt!503854 () array!73798)

(declare-datatypes ((List!24882 0))(
  ( (Nil!24879) (Cons!24878 (h!26087 (_ BitVec 64)) (t!35842 List!24882)) )
))
(declare-fun arrayNoDuplicates!0 (array!73798 (_ BitVec 32) List!24882) Bool)

(assert (=> b!1134004 (= res!757110 (arrayNoDuplicates!0 lt!503854 #b00000000000000000000000000000000 Nil!24879))))

(declare-fun b!1134005 () Bool)

(declare-fun e!645387 () Bool)

(assert (=> b!1134005 (= e!645387 tp_is_empty!28507)))

(declare-fun b!1134006 () Bool)

(declare-fun e!645378 () Unit!36999)

(declare-fun lt!503852 () Unit!36999)

(assert (=> b!1134006 (= e!645378 lt!503852)))

(declare-fun lt!503858 () Unit!36999)

(assert (=> b!1134006 (= lt!503858 call!49246)))

(declare-datatypes ((tuple2!18136 0))(
  ( (tuple2!18137 (_1!9079 (_ BitVec 64)) (_2!9079 V!43137)) )
))
(declare-datatypes ((List!24883 0))(
  ( (Nil!24880) (Cons!24879 (h!26088 tuple2!18136) (t!35843 List!24883)) )
))
(declare-datatypes ((ListLongMap!16105 0))(
  ( (ListLongMap!16106 (toList!8068 List!24883)) )
))
(declare-fun lt!503865 () ListLongMap!16105)

(declare-fun call!49245 () ListLongMap!16105)

(assert (=> b!1134006 (= lt!503865 call!49245)))

(declare-fun call!49250 () Bool)

(assert (=> b!1134006 call!49250))

(declare-fun addStillContains!720 (ListLongMap!16105 (_ BitVec 64) V!43137 (_ BitVec 64)) Unit!36999)

(assert (=> b!1134006 (= lt!503852 (addStillContains!720 lt!503865 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6522 (ListLongMap!16105 (_ BitVec 64)) Bool)

(declare-fun +!3502 (ListLongMap!16105 tuple2!18136) ListLongMap!16105)

(assert (=> b!1134006 (contains!6522 (+!3502 lt!503865 (tuple2!18137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1134007 () Bool)

(declare-fun e!645382 () Bool)

(declare-fun arrayContainsKey!0 (array!73798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134007 (= e!645382 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!503860 () Bool)

(declare-fun e!645371 () Bool)

(declare-fun b!1134008 () Bool)

(assert (=> b!1134008 (= e!645371 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503860) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!49241 () Bool)

(declare-fun call!49247 () ListLongMap!16105)

(declare-fun c!110706 () Bool)

(assert (=> bm!49241 (= call!49250 (contains!6522 (ite c!110706 lt!503865 call!49247) k0!934))))

(declare-fun b!1134009 () Bool)

(declare-fun e!645381 () Bool)

(declare-fun e!645385 () Bool)

(assert (=> b!1134009 (= e!645381 e!645385)))

(declare-fun res!757114 () Bool)

(assert (=> b!1134009 (=> res!757114 e!645385)))

(assert (=> b!1134009 (= res!757114 (or (bvsge (size!36088 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36088 _keys!1208)) (bvsge from!1455 (size!36088 _keys!1208))))))

(assert (=> b!1134009 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24879)))

(declare-fun lt!503853 () Unit!36999)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73798 (_ BitVec 32) (_ BitVec 32)) Unit!36999)

(assert (=> b!1134009 (= lt!503853 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1134009 e!645382))

(declare-fun res!757109 () Bool)

(assert (=> b!1134009 (=> (not res!757109) (not e!645382))))

(assert (=> b!1134009 (= res!757109 e!645371)))

(declare-fun c!110704 () Bool)

(assert (=> b!1134009 (= c!110704 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503868 () Unit!36999)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!334 (array!73798 array!73800 (_ BitVec 32) (_ BitVec 32) V!43137 V!43137 (_ BitVec 64) (_ BitVec 32) Int) Unit!36999)

(assert (=> b!1134009 (= lt!503868 (lemmaListMapContainsThenArrayContainsFrom!334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503862 () Unit!36999)

(assert (=> b!1134009 (= lt!503862 e!645378)))

(assert (=> b!1134009 (= c!110706 (and (not lt!503860) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134009 (= lt!503860 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1134010 () Bool)

(declare-fun c!110707 () Bool)

(assert (=> b!1134010 (= c!110707 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503860))))

(declare-fun e!645377 () Unit!36999)

(declare-fun e!645372 () Unit!36999)

(assert (=> b!1134010 (= e!645377 e!645372)))

(declare-fun call!49248 () ListLongMap!16105)

(declare-fun call!49243 () ListLongMap!16105)

(declare-fun b!1134011 () Bool)

(declare-fun -!1168 (ListLongMap!16105 (_ BitVec 64)) ListLongMap!16105)

(assert (=> b!1134011 (= e!645373 (= call!49248 (-!1168 call!49243 k0!934)))))

(declare-fun b!1134012 () Bool)

(declare-fun e!645379 () Bool)

(assert (=> b!1134012 (= e!645379 e!645383)))

(declare-fun res!757113 () Bool)

(assert (=> b!1134012 (=> res!757113 e!645383)))

(assert (=> b!1134012 (= res!757113 (not (= from!1455 i!673)))))

(declare-fun lt!503857 () ListLongMap!16105)

(declare-fun lt!503856 () array!73800)

(declare-fun getCurrentListMapNoExtraKeys!4566 (array!73798 array!73800 (_ BitVec 32) (_ BitVec 32) V!43137 V!43137 (_ BitVec 32) Int) ListLongMap!16105)

(assert (=> b!1134012 (= lt!503857 (getCurrentListMapNoExtraKeys!4566 lt!503854 lt!503856 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2565 (Int (_ BitVec 64)) V!43137)

(assert (=> b!1134012 (= lt!503856 (array!73801 (store (arr!35551 _values!996) i!673 (ValueCellFull!13544 (dynLambda!2565 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36089 _values!996)))))

(declare-fun lt!503867 () ListLongMap!16105)

(assert (=> b!1134012 (= lt!503867 (getCurrentListMapNoExtraKeys!4566 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1134013 () Bool)

(declare-fun res!757115 () Bool)

(assert (=> b!1134013 (=> (not res!757115) (not e!645375))))

(assert (=> b!1134013 (= res!757115 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24879))))

(declare-fun b!1134014 () Bool)

(declare-fun res!757098 () Bool)

(assert (=> b!1134014 (=> (not res!757098) (not e!645375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134014 (= res!757098 (validKeyInArray!0 k0!934))))

(declare-fun bm!49242 () Bool)

(declare-fun c!110708 () Bool)

(declare-fun lt!503866 () ListLongMap!16105)

(assert (=> bm!49242 (= call!49246 (addStillContains!720 lt!503866 (ite (or c!110706 c!110708) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110706 c!110708) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1134015 () Bool)

(assert (=> b!1134015 (= e!645384 (not e!645379))))

(declare-fun res!757106 () Bool)

(assert (=> b!1134015 (=> res!757106 e!645379)))

(assert (=> b!1134015 (= res!757106 (bvsgt from!1455 i!673))))

(assert (=> b!1134015 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503863 () Unit!36999)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73798 (_ BitVec 64) (_ BitVec 32)) Unit!36999)

(assert (=> b!1134015 (= lt!503863 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1134016 () Bool)

(declare-fun e!645376 () Bool)

(assert (=> b!1134016 (= e!645376 tp_is_empty!28507)))

(declare-fun b!1134017 () Bool)

(declare-fun res!757099 () Bool)

(assert (=> b!1134017 (=> res!757099 e!645385)))

(declare-fun contains!6523 (List!24882 (_ BitVec 64)) Bool)

(assert (=> b!1134017 (= res!757099 (contains!6523 Nil!24879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134018 () Bool)

(assert (=> b!1134018 (= e!645375 e!645384)))

(declare-fun res!757104 () Bool)

(assert (=> b!1134018 (=> (not res!757104) (not e!645384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73798 (_ BitVec 32)) Bool)

(assert (=> b!1134018 (= res!757104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503854 mask!1564))))

(assert (=> b!1134018 (= lt!503854 (array!73799 (store (arr!35550 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36088 _keys!1208)))))

(declare-fun bm!49243 () Bool)

(declare-fun call!49249 () Bool)

(assert (=> bm!49243 (= call!49249 call!49250)))

(declare-fun b!1134019 () Bool)

(declare-fun res!757105 () Bool)

(assert (=> b!1134019 (=> (not res!757105) (not e!645375))))

(assert (=> b!1134019 (= res!757105 (and (= (size!36089 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36088 _keys!1208) (size!36089 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1134020 () Bool)

(assert (=> b!1134020 (= e!645386 e!645381)))

(declare-fun res!757107 () Bool)

(assert (=> b!1134020 (=> res!757107 e!645381)))

(assert (=> b!1134020 (= res!757107 (not (contains!6522 lt!503866 k0!934)))))

(assert (=> b!1134020 (= lt!503866 (getCurrentListMapNoExtraKeys!4566 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134021 () Bool)

(assert (=> b!1134021 (= e!645385 true)))

(declare-fun lt!503855 () Bool)

(assert (=> b!1134021 (= lt!503855 (contains!6523 Nil!24879 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!49244 () Bool)

(assert (=> bm!49244 (= call!49245 (+!3502 lt!503866 (ite (or c!110706 c!110708) (tuple2!18137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1134022 () Bool)

(assert (=> b!1134022 (= e!645373 (= call!49248 call!49243))))

(declare-fun b!1134023 () Bool)

(assert (=> b!1134023 (= e!645371 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134024 () Bool)

(declare-fun mapRes!44585 () Bool)

(assert (=> b!1134024 (= e!645374 (and e!645387 mapRes!44585))))

(declare-fun condMapEmpty!44585 () Bool)

(declare-fun mapDefault!44585 () ValueCell!13544)

(assert (=> b!1134024 (= condMapEmpty!44585 (= (arr!35551 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13544)) mapDefault!44585)))))

(declare-fun bm!49245 () Bool)

(assert (=> bm!49245 (= call!49247 call!49245)))

(declare-fun b!1134025 () Bool)

(declare-fun res!757103 () Bool)

(assert (=> b!1134025 (=> res!757103 e!645385)))

(declare-fun noDuplicate!1600 (List!24882) Bool)

(assert (=> b!1134025 (= res!757103 (not (noDuplicate!1600 Nil!24879)))))

(declare-fun b!1134026 () Bool)

(declare-fun res!757108 () Bool)

(assert (=> b!1134026 (=> (not res!757108) (not e!645375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134026 (= res!757108 (validMask!0 mask!1564))))

(declare-fun b!1134027 () Bool)

(assert (=> b!1134027 call!49249))

(declare-fun lt!503861 () Unit!36999)

(assert (=> b!1134027 (= lt!503861 call!49244)))

(assert (=> b!1134027 (= e!645377 lt!503861)))

(declare-fun b!1134028 () Bool)

(declare-fun res!757101 () Bool)

(assert (=> b!1134028 (=> (not res!757101) (not e!645375))))

(assert (=> b!1134028 (= res!757101 (= (select (arr!35550 _keys!1208) i!673) k0!934))))

(declare-fun b!1134029 () Bool)

(declare-fun Unit!37001 () Unit!36999)

(assert (=> b!1134029 (= e!645372 Unit!37001)))

(declare-fun mapNonEmpty!44585 () Bool)

(declare-fun tp!84641 () Bool)

(assert (=> mapNonEmpty!44585 (= mapRes!44585 (and tp!84641 e!645376))))

(declare-fun mapKey!44585 () (_ BitVec 32))

(declare-fun mapValue!44585 () ValueCell!13544)

(declare-fun mapRest!44585 () (Array (_ BitVec 32) ValueCell!13544))

(assert (=> mapNonEmpty!44585 (= (arr!35551 _values!996) (store mapRest!44585 mapKey!44585 mapValue!44585))))

(declare-fun b!1134030 () Bool)

(declare-fun res!757102 () Bool)

(assert (=> b!1134030 (=> (not res!757102) (not e!645375))))

(assert (=> b!1134030 (= res!757102 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36088 _keys!1208))))))

(declare-fun mapIsEmpty!44585 () Bool)

(assert (=> mapIsEmpty!44585 mapRes!44585))

(declare-fun bm!49246 () Bool)

(assert (=> bm!49246 (= call!49243 (getCurrentListMapNoExtraKeys!4566 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134031 () Bool)

(declare-fun lt!503864 () Unit!36999)

(assert (=> b!1134031 (= e!645372 lt!503864)))

(assert (=> b!1134031 (= lt!503864 call!49244)))

(assert (=> b!1134031 call!49249))

(declare-fun b!1134032 () Bool)

(declare-fun res!757112 () Bool)

(assert (=> b!1134032 (=> (not res!757112) (not e!645375))))

(assert (=> b!1134032 (= res!757112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1134033 () Bool)

(assert (=> b!1134033 (= e!645378 e!645377)))

(assert (=> b!1134033 (= c!110708 (and (not lt!503860) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!49247 () Bool)

(assert (=> bm!49247 (= call!49248 (getCurrentListMapNoExtraKeys!4566 lt!503854 lt!503856 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98366 res!757111) b!1134026))

(assert (= (and b!1134026 res!757108) b!1134019))

(assert (= (and b!1134019 res!757105) b!1134032))

(assert (= (and b!1134032 res!757112) b!1134013))

(assert (= (and b!1134013 res!757115) b!1134030))

(assert (= (and b!1134030 res!757102) b!1134014))

(assert (= (and b!1134014 res!757098) b!1134028))

(assert (= (and b!1134028 res!757101) b!1134018))

(assert (= (and b!1134018 res!757104) b!1134004))

(assert (= (and b!1134004 res!757110) b!1134015))

(assert (= (and b!1134015 (not res!757106)) b!1134012))

(assert (= (and b!1134012 (not res!757113)) b!1134003))

(assert (= (and b!1134003 c!110705) b!1134011))

(assert (= (and b!1134003 (not c!110705)) b!1134022))

(assert (= (or b!1134011 b!1134022) bm!49247))

(assert (= (or b!1134011 b!1134022) bm!49246))

(assert (= (and b!1134003 (not res!757100)) b!1134020))

(assert (= (and b!1134020 (not res!757107)) b!1134009))

(assert (= (and b!1134009 c!110706) b!1134006))

(assert (= (and b!1134009 (not c!110706)) b!1134033))

(assert (= (and b!1134033 c!110708) b!1134027))

(assert (= (and b!1134033 (not c!110708)) b!1134010))

(assert (= (and b!1134010 c!110707) b!1134031))

(assert (= (and b!1134010 (not c!110707)) b!1134029))

(assert (= (or b!1134027 b!1134031) bm!49240))

(assert (= (or b!1134027 b!1134031) bm!49245))

(assert (= (or b!1134027 b!1134031) bm!49243))

(assert (= (or b!1134006 bm!49243) bm!49241))

(assert (= (or b!1134006 bm!49240) bm!49242))

(assert (= (or b!1134006 bm!49245) bm!49244))

(assert (= (and b!1134009 c!110704) b!1134023))

(assert (= (and b!1134009 (not c!110704)) b!1134008))

(assert (= (and b!1134009 res!757109) b!1134007))

(assert (= (and b!1134009 (not res!757114)) b!1134025))

(assert (= (and b!1134025 (not res!757103)) b!1134017))

(assert (= (and b!1134017 (not res!757099)) b!1134021))

(assert (= (and b!1134024 condMapEmpty!44585) mapIsEmpty!44585))

(assert (= (and b!1134024 (not condMapEmpty!44585)) mapNonEmpty!44585))

(get-info :version)

(assert (= (and mapNonEmpty!44585 ((_ is ValueCellFull!13544) mapValue!44585)) b!1134016))

(assert (= (and b!1134024 ((_ is ValueCellFull!13544) mapDefault!44585)) b!1134005))

(assert (= start!98366 b!1134024))

(declare-fun b_lambda!19065 () Bool)

(assert (=> (not b_lambda!19065) (not b!1134012)))

(declare-fun t!35841 () Bool)

(declare-fun tb!8781 () Bool)

(assert (=> (and start!98366 (= defaultEntry!1004 defaultEntry!1004) t!35841) tb!8781))

(declare-fun result!18135 () Bool)

(assert (=> tb!8781 (= result!18135 tp_is_empty!28507)))

(assert (=> b!1134012 t!35841))

(declare-fun b_and!38783 () Bool)

(assert (= b_and!38781 (and (=> t!35841 result!18135) b_and!38783)))

(declare-fun m!1046407 () Bool)

(assert (=> b!1134021 m!1046407))

(declare-fun m!1046409 () Bool)

(assert (=> b!1134007 m!1046409))

(declare-fun m!1046411 () Bool)

(assert (=> start!98366 m!1046411))

(declare-fun m!1046413 () Bool)

(assert (=> start!98366 m!1046413))

(declare-fun m!1046415 () Bool)

(assert (=> mapNonEmpty!44585 m!1046415))

(declare-fun m!1046417 () Bool)

(assert (=> bm!49247 m!1046417))

(declare-fun m!1046419 () Bool)

(assert (=> b!1134004 m!1046419))

(declare-fun m!1046421 () Bool)

(assert (=> b!1134020 m!1046421))

(declare-fun m!1046423 () Bool)

(assert (=> b!1134020 m!1046423))

(declare-fun m!1046425 () Bool)

(assert (=> b!1134013 m!1046425))

(declare-fun m!1046427 () Bool)

(assert (=> bm!49244 m!1046427))

(assert (=> b!1134023 m!1046409))

(declare-fun m!1046429 () Bool)

(assert (=> b!1134015 m!1046429))

(declare-fun m!1046431 () Bool)

(assert (=> b!1134015 m!1046431))

(declare-fun m!1046433 () Bool)

(assert (=> b!1134025 m!1046433))

(declare-fun m!1046435 () Bool)

(assert (=> b!1134018 m!1046435))

(declare-fun m!1046437 () Bool)

(assert (=> b!1134018 m!1046437))

(declare-fun m!1046439 () Bool)

(assert (=> b!1134026 m!1046439))

(declare-fun m!1046441 () Bool)

(assert (=> b!1134017 m!1046441))

(declare-fun m!1046443 () Bool)

(assert (=> b!1134014 m!1046443))

(declare-fun m!1046445 () Bool)

(assert (=> b!1134009 m!1046445))

(declare-fun m!1046447 () Bool)

(assert (=> b!1134009 m!1046447))

(declare-fun m!1046449 () Bool)

(assert (=> b!1134009 m!1046449))

(declare-fun m!1046451 () Bool)

(assert (=> b!1134032 m!1046451))

(declare-fun m!1046453 () Bool)

(assert (=> b!1134012 m!1046453))

(declare-fun m!1046455 () Bool)

(assert (=> b!1134012 m!1046455))

(declare-fun m!1046457 () Bool)

(assert (=> b!1134012 m!1046457))

(declare-fun m!1046459 () Bool)

(assert (=> b!1134012 m!1046459))

(declare-fun m!1046461 () Bool)

(assert (=> b!1134028 m!1046461))

(declare-fun m!1046463 () Bool)

(assert (=> bm!49241 m!1046463))

(declare-fun m!1046465 () Bool)

(assert (=> b!1134003 m!1046465))

(declare-fun m!1046467 () Bool)

(assert (=> b!1134003 m!1046467))

(declare-fun m!1046469 () Bool)

(assert (=> b!1134006 m!1046469))

(declare-fun m!1046471 () Bool)

(assert (=> b!1134006 m!1046471))

(assert (=> b!1134006 m!1046471))

(declare-fun m!1046473 () Bool)

(assert (=> b!1134006 m!1046473))

(declare-fun m!1046475 () Bool)

(assert (=> bm!49242 m!1046475))

(assert (=> bm!49246 m!1046423))

(declare-fun m!1046477 () Bool)

(assert (=> b!1134011 m!1046477))

(check-sat (not bm!49246) (not b!1134023) (not b!1134007) (not b!1134011) (not b!1134012) b_and!38783 (not b!1134004) (not b!1134017) (not b!1134006) (not b_next!23977) (not b!1134013) (not b_lambda!19065) (not bm!49242) tp_is_empty!28507 (not bm!49244) (not b!1134025) (not b!1134018) (not mapNonEmpty!44585) (not start!98366) (not b!1134021) (not b!1134032) (not b!1134014) (not b!1134026) (not b!1134015) (not bm!49247) (not bm!49241) (not b!1134003) (not b!1134009) (not b!1134020))
(check-sat b_and!38783 (not b_next!23977))
