; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99208 () Bool)

(assert start!99208)

(declare-fun b_free!24577 () Bool)

(declare-fun b_next!24577 () Bool)

(assert (=> start!99208 (= b_free!24577 (not b_next!24577))))

(declare-fun tp!86441 () Bool)

(declare-fun b_and!40005 () Bool)

(assert (=> start!99208 (= tp!86441 b_and!40005)))

(declare-fun b!1162843 () Bool)

(declare-datatypes ((Unit!38294 0))(
  ( (Unit!38295) )
))
(declare-fun e!661344 () Unit!38294)

(declare-fun Unit!38296 () Unit!38294)

(assert (=> b!1162843 (= e!661344 Unit!38296)))

(declare-datatypes ((array!75103 0))(
  ( (array!75104 (arr!36196 (Array (_ BitVec 32) (_ BitVec 64))) (size!36733 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75103)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1162844 () Bool)

(declare-fun e!661331 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!75103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162844 (= e!661331 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162845 () Bool)

(declare-fun Unit!38297 () Unit!38294)

(assert (=> b!1162845 (= e!661344 Unit!38297)))

(declare-fun lt!523270 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1162845 (= lt!523270 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116450 () Bool)

(assert (=> b!1162845 (= c!116450 (and (not lt!523270) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523259 () Unit!38294)

(declare-fun e!661343 () Unit!38294)

(assert (=> b!1162845 (= lt!523259 e!661343)))

(declare-datatypes ((V!43937 0))(
  ( (V!43938 (val!14610 Int)) )
))
(declare-fun zeroValue!944 () V!43937)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43937)

(declare-datatypes ((ValueCell!13844 0))(
  ( (ValueCellFull!13844 (v!17243 V!43937)) (EmptyCell!13844) )
))
(declare-datatypes ((array!75105 0))(
  ( (array!75106 (arr!36197 (Array (_ BitVec 32) ValueCell!13844)) (size!36734 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75105)

(declare-fun lt!523269 () Unit!38294)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!546 (array!75103 array!75105 (_ BitVec 32) (_ BitVec 32) V!43937 V!43937 (_ BitVec 64) (_ BitVec 32) Int) Unit!38294)

(assert (=> b!1162845 (= lt!523269 (lemmaListMapContainsThenArrayContainsFrom!546 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116452 () Bool)

(assert (=> b!1162845 (= c!116452 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771160 () Bool)

(assert (=> b!1162845 (= res!771160 e!661331)))

(declare-fun e!661339 () Bool)

(assert (=> b!1162845 (=> (not res!771160) (not e!661339))))

(assert (=> b!1162845 e!661339))

(declare-fun lt!523272 () Unit!38294)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75103 (_ BitVec 32) (_ BitVec 32)) Unit!38294)

(assert (=> b!1162845 (= lt!523272 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25380 0))(
  ( (Nil!25377) (Cons!25376 (h!26594 (_ BitVec 64)) (t!36941 List!25380)) )
))
(declare-fun arrayNoDuplicates!0 (array!75103 (_ BitVec 32) List!25380) Bool)

(assert (=> b!1162845 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25377)))

(declare-fun lt!523263 () Unit!38294)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75103 (_ BitVec 64) (_ BitVec 32) List!25380) Unit!38294)

(assert (=> b!1162845 (= lt!523263 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25377))))

(assert (=> b!1162845 false))

(declare-fun bm!56528 () Bool)

(declare-fun call!56536 () Bool)

(declare-fun call!56532 () Bool)

(assert (=> bm!56528 (= call!56536 call!56532)))

(declare-fun b!1162846 () Bool)

(assert (=> b!1162846 (= e!661339 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162847 () Bool)

(declare-fun e!661332 () Unit!38294)

(declare-fun lt!523274 () Unit!38294)

(assert (=> b!1162847 (= e!661332 lt!523274)))

(declare-fun call!56531 () Unit!38294)

(assert (=> b!1162847 (= lt!523274 call!56531)))

(assert (=> b!1162847 call!56536))

(declare-fun b!1162848 () Bool)

(declare-fun e!661336 () Bool)

(declare-fun tp_is_empty!29107 () Bool)

(assert (=> b!1162848 (= e!661336 tp_is_empty!29107)))

(declare-fun lt!523261 () array!75105)

(declare-fun lt!523273 () array!75103)

(declare-datatypes ((tuple2!18644 0))(
  ( (tuple2!18645 (_1!9333 (_ BitVec 64)) (_2!9333 V!43937)) )
))
(declare-datatypes ((List!25381 0))(
  ( (Nil!25378) (Cons!25377 (h!26595 tuple2!18644) (t!36942 List!25381)) )
))
(declare-datatypes ((ListLongMap!16621 0))(
  ( (ListLongMap!16622 (toList!8326 List!25381)) )
))
(declare-fun call!56533 () ListLongMap!16621)

(declare-fun bm!56529 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4818 (array!75103 array!75105 (_ BitVec 32) (_ BitVec 32) V!43937 V!43937 (_ BitVec 32) Int) ListLongMap!16621)

(assert (=> bm!56529 (= call!56533 (getCurrentListMapNoExtraKeys!4818 lt!523273 lt!523261 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!56538 () ListLongMap!16621)

(declare-fun bm!56530 () Bool)

(assert (=> bm!56530 (= call!56538 (getCurrentListMapNoExtraKeys!4818 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162849 () Bool)

(declare-fun e!661330 () Bool)

(declare-fun mapRes!45485 () Bool)

(assert (=> b!1162849 (= e!661330 (and e!661336 mapRes!45485))))

(declare-fun condMapEmpty!45485 () Bool)

(declare-fun mapDefault!45485 () ValueCell!13844)

(assert (=> b!1162849 (= condMapEmpty!45485 (= (arr!36197 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13844)) mapDefault!45485)))))

(declare-fun b!1162850 () Bool)

(declare-fun e!661342 () Bool)

(declare-fun -!1421 (ListLongMap!16621 (_ BitVec 64)) ListLongMap!16621)

(assert (=> b!1162850 (= e!661342 (= call!56533 (-!1421 call!56538 k0!934)))))

(declare-fun b!1162851 () Bool)

(declare-fun e!661335 () Bool)

(declare-fun e!661333 () Bool)

(assert (=> b!1162851 (= e!661335 e!661333)))

(declare-fun res!771167 () Bool)

(assert (=> b!1162851 (=> (not res!771167) (not e!661333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75103 (_ BitVec 32)) Bool)

(assert (=> b!1162851 (= res!771167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523273 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162851 (= lt!523273 (array!75104 (store (arr!36196 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36733 _keys!1208)))))

(declare-fun b!1162852 () Bool)

(declare-fun e!661338 () Unit!38294)

(declare-fun Unit!38298 () Unit!38294)

(assert (=> b!1162852 (= e!661338 Unit!38298)))

(declare-fun b!1162853 () Bool)

(declare-fun e!661329 () Bool)

(assert (=> b!1162853 (= e!661329 tp_is_empty!29107)))

(declare-fun lt!523275 () ListLongMap!16621)

(declare-fun call!56537 () ListLongMap!16621)

(declare-fun bm!56531 () Bool)

(declare-fun contains!6844 (ListLongMap!16621 (_ BitVec 64)) Bool)

(assert (=> bm!56531 (= call!56532 (contains!6844 (ite c!116450 lt!523275 call!56537) k0!934))))

(declare-fun b!1162854 () Bool)

(declare-fun e!661337 () Bool)

(declare-fun e!661340 () Bool)

(assert (=> b!1162854 (= e!661337 e!661340)))

(declare-fun res!771163 () Bool)

(assert (=> b!1162854 (=> res!771163 e!661340)))

(assert (=> b!1162854 (= res!771163 (not (= from!1455 i!673)))))

(declare-fun lt!523262 () ListLongMap!16621)

(assert (=> b!1162854 (= lt!523262 (getCurrentListMapNoExtraKeys!4818 lt!523273 lt!523261 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523267 () V!43937)

(assert (=> b!1162854 (= lt!523261 (array!75106 (store (arr!36197 _values!996) i!673 (ValueCellFull!13844 lt!523267)) (size!36734 _values!996)))))

(declare-fun dynLambda!2814 (Int (_ BitVec 64)) V!43937)

(assert (=> b!1162854 (= lt!523267 (dynLambda!2814 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523266 () ListLongMap!16621)

(assert (=> b!1162854 (= lt!523266 (getCurrentListMapNoExtraKeys!4818 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162855 () Bool)

(declare-fun e!661345 () Bool)

(declare-fun lt!523279 () ListLongMap!16621)

(assert (=> b!1162855 (= e!661345 (= lt!523279 (getCurrentListMapNoExtraKeys!4818 lt!523273 lt!523261 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1162856 () Bool)

(assert (=> b!1162856 (= e!661342 (= call!56533 call!56538))))

(declare-fun bm!56532 () Bool)

(declare-fun call!56534 () ListLongMap!16621)

(assert (=> bm!56532 (= call!56537 call!56534)))

(declare-fun b!1162857 () Bool)

(assert (=> b!1162857 call!56536))

(declare-fun lt!523268 () Unit!38294)

(assert (=> b!1162857 (= lt!523268 call!56531)))

(assert (=> b!1162857 (= e!661338 lt!523268)))

(declare-fun lt!523260 () ListLongMap!16621)

(declare-fun bm!56533 () Bool)

(declare-fun c!116454 () Bool)

(declare-fun +!3743 (ListLongMap!16621 tuple2!18644) ListLongMap!16621)

(assert (=> bm!56533 (= call!56534 (+!3743 (ite c!116450 lt!523275 lt!523260) (ite c!116450 (tuple2!18645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116454 (tuple2!18645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!771165 () Bool)

(assert (=> start!99208 (=> (not res!771165) (not e!661335))))

(assert (=> start!99208 (= res!771165 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36733 _keys!1208))))))

(assert (=> start!99208 e!661335))

(assert (=> start!99208 tp_is_empty!29107))

(declare-fun array_inv!27760 (array!75103) Bool)

(assert (=> start!99208 (array_inv!27760 _keys!1208)))

(assert (=> start!99208 true))

(assert (=> start!99208 tp!86441))

(declare-fun array_inv!27761 (array!75105) Bool)

(assert (=> start!99208 (and (array_inv!27761 _values!996) e!661330)))

(declare-fun b!1162858 () Bool)

(assert (=> b!1162858 (= e!661332 e!661338)))

(declare-fun c!116451 () Bool)

(assert (=> b!1162858 (= c!116451 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523270))))

(declare-fun b!1162859 () Bool)

(assert (=> b!1162859 (= e!661333 (not e!661337))))

(declare-fun res!771164 () Bool)

(assert (=> b!1162859 (=> res!771164 e!661337)))

(assert (=> b!1162859 (= res!771164 (bvsgt from!1455 i!673))))

(assert (=> b!1162859 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523265 () Unit!38294)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75103 (_ BitVec 64) (_ BitVec 32)) Unit!38294)

(assert (=> b!1162859 (= lt!523265 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1162860 () Bool)

(declare-fun res!771171 () Bool)

(assert (=> b!1162860 (=> (not res!771171) (not e!661335))))

(assert (=> b!1162860 (= res!771171 (and (= (size!36734 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36733 _keys!1208) (size!36734 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!56534 () Bool)

(declare-fun call!56535 () Unit!38294)

(assert (=> bm!56534 (= call!56531 call!56535)))

(declare-fun mapNonEmpty!45485 () Bool)

(declare-fun tp!86442 () Bool)

(assert (=> mapNonEmpty!45485 (= mapRes!45485 (and tp!86442 e!661329))))

(declare-fun mapRest!45485 () (Array (_ BitVec 32) ValueCell!13844))

(declare-fun mapKey!45485 () (_ BitVec 32))

(declare-fun mapValue!45485 () ValueCell!13844)

(assert (=> mapNonEmpty!45485 (= (arr!36197 _values!996) (store mapRest!45485 mapKey!45485 mapValue!45485))))

(declare-fun b!1162861 () Bool)

(declare-fun e!661341 () Bool)

(assert (=> b!1162861 (= e!661340 e!661341)))

(declare-fun res!771157 () Bool)

(assert (=> b!1162861 (=> res!771157 e!661341)))

(assert (=> b!1162861 (= res!771157 (not (= (select (arr!36196 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1162861 e!661342))

(declare-fun c!116453 () Bool)

(assert (=> b!1162861 (= c!116453 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523278 () Unit!38294)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!650 (array!75103 array!75105 (_ BitVec 32) (_ BitVec 32) V!43937 V!43937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38294)

(assert (=> b!1162861 (= lt!523278 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!650 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162862 () Bool)

(declare-fun res!771162 () Bool)

(assert (=> b!1162862 (=> (not res!771162) (not e!661335))))

(assert (=> b!1162862 (= res!771162 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36733 _keys!1208))))))

(declare-fun b!1162863 () Bool)

(assert (=> b!1162863 (= e!661341 true)))

(assert (=> b!1162863 e!661345))

(declare-fun res!771161 () Bool)

(assert (=> b!1162863 (=> (not res!771161) (not e!661345))))

(assert (=> b!1162863 (= res!771161 (= lt!523279 lt!523260))))

(assert (=> b!1162863 (= lt!523279 (-!1421 lt!523266 k0!934))))

(declare-fun lt!523258 () V!43937)

(assert (=> b!1162863 (= (-!1421 (+!3743 lt!523260 (tuple2!18645 (select (arr!36196 _keys!1208) from!1455) lt!523258)) (select (arr!36196 _keys!1208) from!1455)) lt!523260)))

(declare-fun lt!523276 () Unit!38294)

(declare-fun addThenRemoveForNewKeyIsSame!250 (ListLongMap!16621 (_ BitVec 64) V!43937) Unit!38294)

(assert (=> b!1162863 (= lt!523276 (addThenRemoveForNewKeyIsSame!250 lt!523260 (select (arr!36196 _keys!1208) from!1455) lt!523258))))

(declare-fun get!18487 (ValueCell!13844 V!43937) V!43937)

(assert (=> b!1162863 (= lt!523258 (get!18487 (select (arr!36197 _values!996) from!1455) lt!523267))))

(declare-fun lt!523271 () Unit!38294)

(assert (=> b!1162863 (= lt!523271 e!661344)))

(declare-fun c!116449 () Bool)

(assert (=> b!1162863 (= c!116449 (contains!6844 lt!523260 k0!934))))

(assert (=> b!1162863 (= lt!523260 (getCurrentListMapNoExtraKeys!4818 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162864 () Bool)

(declare-fun res!771159 () Bool)

(assert (=> b!1162864 (=> (not res!771159) (not e!661335))))

(assert (=> b!1162864 (= res!771159 (= (select (arr!36196 _keys!1208) i!673) k0!934))))

(declare-fun b!1162865 () Bool)

(declare-fun res!771166 () Bool)

(assert (=> b!1162865 (=> (not res!771166) (not e!661335))))

(assert (=> b!1162865 (= res!771166 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25377))))

(declare-fun mapIsEmpty!45485 () Bool)

(assert (=> mapIsEmpty!45485 mapRes!45485))

(declare-fun b!1162866 () Bool)

(assert (=> b!1162866 (contains!6844 call!56534 k0!934)))

(declare-fun lt!523264 () Unit!38294)

(declare-fun addStillContains!961 (ListLongMap!16621 (_ BitVec 64) V!43937 (_ BitVec 64)) Unit!38294)

(assert (=> b!1162866 (= lt!523264 (addStillContains!961 lt!523275 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1162866 call!56532))

(assert (=> b!1162866 (= lt!523275 (+!3743 lt!523260 (tuple2!18645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523277 () Unit!38294)

(assert (=> b!1162866 (= lt!523277 call!56535)))

(assert (=> b!1162866 (= e!661343 lt!523264)))

(declare-fun b!1162867 () Bool)

(declare-fun res!771169 () Bool)

(assert (=> b!1162867 (=> (not res!771169) (not e!661335))))

(assert (=> b!1162867 (= res!771169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1162868 () Bool)

(declare-fun res!771158 () Bool)

(assert (=> b!1162868 (=> (not res!771158) (not e!661335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162868 (= res!771158 (validKeyInArray!0 k0!934))))

(declare-fun b!1162869 () Bool)

(assert (=> b!1162869 (= e!661331 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523270) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162870 () Bool)

(declare-fun res!771170 () Bool)

(assert (=> b!1162870 (=> (not res!771170) (not e!661333))))

(assert (=> b!1162870 (= res!771170 (arrayNoDuplicates!0 lt!523273 #b00000000000000000000000000000000 Nil!25377))))

(declare-fun bm!56535 () Bool)

(assert (=> bm!56535 (= call!56535 (addStillContains!961 lt!523260 (ite (or c!116450 c!116454) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116450 c!116454) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1162871 () Bool)

(declare-fun res!771168 () Bool)

(assert (=> b!1162871 (=> (not res!771168) (not e!661335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162871 (= res!771168 (validMask!0 mask!1564))))

(declare-fun b!1162872 () Bool)

(assert (=> b!1162872 (= c!116454 (and (not lt!523270) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1162872 (= e!661343 e!661332)))

(assert (= (and start!99208 res!771165) b!1162871))

(assert (= (and b!1162871 res!771168) b!1162860))

(assert (= (and b!1162860 res!771171) b!1162867))

(assert (= (and b!1162867 res!771169) b!1162865))

(assert (= (and b!1162865 res!771166) b!1162862))

(assert (= (and b!1162862 res!771162) b!1162868))

(assert (= (and b!1162868 res!771158) b!1162864))

(assert (= (and b!1162864 res!771159) b!1162851))

(assert (= (and b!1162851 res!771167) b!1162870))

(assert (= (and b!1162870 res!771170) b!1162859))

(assert (= (and b!1162859 (not res!771164)) b!1162854))

(assert (= (and b!1162854 (not res!771163)) b!1162861))

(assert (= (and b!1162861 c!116453) b!1162850))

(assert (= (and b!1162861 (not c!116453)) b!1162856))

(assert (= (or b!1162850 b!1162856) bm!56529))

(assert (= (or b!1162850 b!1162856) bm!56530))

(assert (= (and b!1162861 (not res!771157)) b!1162863))

(assert (= (and b!1162863 c!116449) b!1162845))

(assert (= (and b!1162863 (not c!116449)) b!1162843))

(assert (= (and b!1162845 c!116450) b!1162866))

(assert (= (and b!1162845 (not c!116450)) b!1162872))

(assert (= (and b!1162872 c!116454) b!1162847))

(assert (= (and b!1162872 (not c!116454)) b!1162858))

(assert (= (and b!1162858 c!116451) b!1162857))

(assert (= (and b!1162858 (not c!116451)) b!1162852))

(assert (= (or b!1162847 b!1162857) bm!56534))

(assert (= (or b!1162847 b!1162857) bm!56532))

(assert (= (or b!1162847 b!1162857) bm!56528))

(assert (= (or b!1162866 bm!56528) bm!56531))

(assert (= (or b!1162866 bm!56534) bm!56535))

(assert (= (or b!1162866 bm!56532) bm!56533))

(assert (= (and b!1162845 c!116452) b!1162844))

(assert (= (and b!1162845 (not c!116452)) b!1162869))

(assert (= (and b!1162845 res!771160) b!1162846))

(assert (= (and b!1162863 res!771161) b!1162855))

(assert (= (and b!1162849 condMapEmpty!45485) mapIsEmpty!45485))

(assert (= (and b!1162849 (not condMapEmpty!45485)) mapNonEmpty!45485))

(get-info :version)

(assert (= (and mapNonEmpty!45485 ((_ is ValueCellFull!13844) mapValue!45485)) b!1162853))

(assert (= (and b!1162849 ((_ is ValueCellFull!13844) mapDefault!45485)) b!1162848))

(assert (= start!99208 b!1162849))

(declare-fun b_lambda!19677 () Bool)

(assert (=> (not b_lambda!19677) (not b!1162854)))

(declare-fun t!36940 () Bool)

(declare-fun tb!9381 () Bool)

(assert (=> (and start!99208 (= defaultEntry!1004 defaultEntry!1004) t!36940) tb!9381))

(declare-fun result!19335 () Bool)

(assert (=> tb!9381 (= result!19335 tp_is_empty!29107)))

(assert (=> b!1162854 t!36940))

(declare-fun b_and!40007 () Bool)

(assert (= b_and!40005 (and (=> t!36940 result!19335) b_and!40007)))

(declare-fun m!1071933 () Bool)

(assert (=> b!1162865 m!1071933))

(declare-fun m!1071935 () Bool)

(assert (=> bm!56530 m!1071935))

(declare-fun m!1071937 () Bool)

(assert (=> b!1162868 m!1071937))

(declare-fun m!1071939 () Bool)

(assert (=> b!1162859 m!1071939))

(declare-fun m!1071941 () Bool)

(assert (=> b!1162859 m!1071941))

(declare-fun m!1071943 () Bool)

(assert (=> b!1162871 m!1071943))

(declare-fun m!1071945 () Bool)

(assert (=> bm!56535 m!1071945))

(declare-fun m!1071947 () Bool)

(assert (=> b!1162864 m!1071947))

(declare-fun m!1071949 () Bool)

(assert (=> b!1162846 m!1071949))

(declare-fun m!1071951 () Bool)

(assert (=> bm!56529 m!1071951))

(declare-fun m!1071953 () Bool)

(assert (=> mapNonEmpty!45485 m!1071953))

(declare-fun m!1071955 () Bool)

(assert (=> b!1162845 m!1071955))

(declare-fun m!1071957 () Bool)

(assert (=> b!1162845 m!1071957))

(declare-fun m!1071959 () Bool)

(assert (=> b!1162845 m!1071959))

(declare-fun m!1071961 () Bool)

(assert (=> b!1162845 m!1071961))

(assert (=> b!1162863 m!1071935))

(declare-fun m!1071963 () Bool)

(assert (=> b!1162863 m!1071963))

(declare-fun m!1071965 () Bool)

(assert (=> b!1162863 m!1071965))

(assert (=> b!1162863 m!1071963))

(declare-fun m!1071967 () Bool)

(assert (=> b!1162863 m!1071967))

(declare-fun m!1071969 () Bool)

(assert (=> b!1162863 m!1071969))

(declare-fun m!1071971 () Bool)

(assert (=> b!1162863 m!1071971))

(assert (=> b!1162863 m!1071967))

(declare-fun m!1071973 () Bool)

(assert (=> b!1162863 m!1071973))

(declare-fun m!1071975 () Bool)

(assert (=> b!1162863 m!1071975))

(assert (=> b!1162863 m!1071965))

(declare-fun m!1071977 () Bool)

(assert (=> b!1162863 m!1071977))

(assert (=> b!1162863 m!1071967))

(declare-fun m!1071979 () Bool)

(assert (=> b!1162866 m!1071979))

(declare-fun m!1071981 () Bool)

(assert (=> b!1162866 m!1071981))

(declare-fun m!1071983 () Bool)

(assert (=> b!1162866 m!1071983))

(assert (=> b!1162855 m!1071951))

(declare-fun m!1071985 () Bool)

(assert (=> start!99208 m!1071985))

(declare-fun m!1071987 () Bool)

(assert (=> start!99208 m!1071987))

(declare-fun m!1071989 () Bool)

(assert (=> b!1162854 m!1071989))

(declare-fun m!1071991 () Bool)

(assert (=> b!1162854 m!1071991))

(declare-fun m!1071993 () Bool)

(assert (=> b!1162854 m!1071993))

(declare-fun m!1071995 () Bool)

(assert (=> b!1162854 m!1071995))

(assert (=> b!1162844 m!1071949))

(declare-fun m!1071997 () Bool)

(assert (=> bm!56533 m!1071997))

(declare-fun m!1071999 () Bool)

(assert (=> b!1162851 m!1071999))

(declare-fun m!1072001 () Bool)

(assert (=> b!1162851 m!1072001))

(declare-fun m!1072003 () Bool)

(assert (=> bm!56531 m!1072003))

(declare-fun m!1072005 () Bool)

(assert (=> b!1162867 m!1072005))

(declare-fun m!1072007 () Bool)

(assert (=> b!1162850 m!1072007))

(declare-fun m!1072009 () Bool)

(assert (=> b!1162870 m!1072009))

(assert (=> b!1162861 m!1071967))

(declare-fun m!1072011 () Bool)

(assert (=> b!1162861 m!1072011))

(check-sat (not b!1162871) (not b!1162851) (not bm!56530) (not b!1162845) (not mapNonEmpty!45485) (not start!99208) b_and!40007 (not b_lambda!19677) (not b!1162863) (not b!1162868) (not bm!56531) (not b!1162867) (not bm!56529) (not b_next!24577) (not b!1162865) (not b!1162850) (not b!1162861) (not b!1162870) (not b!1162855) (not b!1162866) (not bm!56533) (not b!1162859) (not bm!56535) (not b!1162854) (not b!1162846) tp_is_empty!29107 (not b!1162844))
(check-sat b_and!40007 (not b_next!24577))
