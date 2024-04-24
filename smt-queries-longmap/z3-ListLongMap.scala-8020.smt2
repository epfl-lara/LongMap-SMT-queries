; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99196 () Bool)

(assert start!99196)

(declare-fun b_free!24565 () Bool)

(declare-fun b_next!24565 () Bool)

(assert (=> start!99196 (= b_free!24565 (not b_next!24565))))

(declare-fun tp!86405 () Bool)

(declare-fun b_and!39981 () Bool)

(assert (=> start!99196 (= tp!86405 b_and!39981)))

(declare-datatypes ((V!43921 0))(
  ( (V!43922 (val!14604 Int)) )
))
(declare-datatypes ((tuple2!18632 0))(
  ( (tuple2!18633 (_1!9327 (_ BitVec 64)) (_2!9327 V!43921)) )
))
(declare-datatypes ((List!25368 0))(
  ( (Nil!25365) (Cons!25364 (h!26582 tuple2!18632) (t!36917 List!25368)) )
))
(declare-datatypes ((ListLongMap!16609 0))(
  ( (ListLongMap!16610 (toList!8320 List!25368)) )
))
(declare-fun lt!522866 () ListLongMap!16609)

(declare-fun c!116343 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!56387 () Bool)

(declare-fun bm!56384 () Bool)

(declare-fun call!56388 () ListLongMap!16609)

(declare-fun contains!6838 (ListLongMap!16609 (_ BitVec 64)) Bool)

(assert (=> bm!56384 (= call!56387 (contains!6838 (ite c!116343 lt!522866 call!56388) k0!934))))

(declare-fun b!1162291 () Bool)

(declare-fun e!661023 () Bool)

(declare-fun tp_is_empty!29095 () Bool)

(assert (=> b!1162291 (= e!661023 tp_is_empty!29095)))

(declare-fun b!1162292 () Bool)

(declare-fun e!661026 () Bool)

(assert (=> b!1162292 (= e!661026 true)))

(declare-fun e!661039 () Bool)

(assert (=> b!1162292 e!661039))

(declare-fun res!770892 () Bool)

(assert (=> b!1162292 (=> (not res!770892) (not e!661039))))

(declare-fun lt!522863 () ListLongMap!16609)

(declare-fun lt!522870 () ListLongMap!16609)

(assert (=> b!1162292 (= res!770892 (= lt!522863 lt!522870))))

(declare-fun lt!522864 () ListLongMap!16609)

(declare-fun -!1416 (ListLongMap!16609 (_ BitVec 64)) ListLongMap!16609)

(assert (=> b!1162292 (= lt!522863 (-!1416 lt!522864 k0!934))))

(declare-datatypes ((array!75079 0))(
  ( (array!75080 (arr!36184 (Array (_ BitVec 32) (_ BitVec 64))) (size!36721 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75079)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!522877 () V!43921)

(declare-fun +!3737 (ListLongMap!16609 tuple2!18632) ListLongMap!16609)

(assert (=> b!1162292 (= (-!1416 (+!3737 lt!522870 (tuple2!18633 (select (arr!36184 _keys!1208) from!1455) lt!522877)) (select (arr!36184 _keys!1208) from!1455)) lt!522870)))

(declare-datatypes ((Unit!38269 0))(
  ( (Unit!38270) )
))
(declare-fun lt!522875 () Unit!38269)

(declare-fun addThenRemoveForNewKeyIsSame!245 (ListLongMap!16609 (_ BitVec 64) V!43921) Unit!38269)

(assert (=> b!1162292 (= lt!522875 (addThenRemoveForNewKeyIsSame!245 lt!522870 (select (arr!36184 _keys!1208) from!1455) lt!522877))))

(declare-fun lt!522873 () V!43921)

(declare-datatypes ((ValueCell!13838 0))(
  ( (ValueCellFull!13838 (v!17237 V!43921)) (EmptyCell!13838) )
))
(declare-datatypes ((array!75081 0))(
  ( (array!75082 (arr!36185 (Array (_ BitVec 32) ValueCell!13838)) (size!36722 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75081)

(declare-fun get!18478 (ValueCell!13838 V!43921) V!43921)

(assert (=> b!1162292 (= lt!522877 (get!18478 (select (arr!36185 _values!996) from!1455) lt!522873))))

(declare-fun lt!522871 () Unit!38269)

(declare-fun e!661029 () Unit!38269)

(assert (=> b!1162292 (= lt!522871 e!661029)))

(declare-fun c!116346 () Bool)

(assert (=> b!1162292 (= c!116346 (contains!6838 lt!522870 k0!934))))

(declare-fun zeroValue!944 () V!43921)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43921)

(declare-fun getCurrentListMapNoExtraKeys!4812 (array!75079 array!75081 (_ BitVec 32) (_ BitVec 32) V!43921 V!43921 (_ BitVec 32) Int) ListLongMap!16609)

(assert (=> b!1162292 (= lt!522870 (getCurrentListMapNoExtraKeys!4812 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!770887 () Bool)

(declare-fun e!661027 () Bool)

(assert (=> start!99196 (=> (not res!770887) (not e!661027))))

(assert (=> start!99196 (= res!770887 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36721 _keys!1208))))))

(assert (=> start!99196 e!661027))

(assert (=> start!99196 tp_is_empty!29095))

(declare-fun array_inv!27752 (array!75079) Bool)

(assert (=> start!99196 (array_inv!27752 _keys!1208)))

(assert (=> start!99196 true))

(assert (=> start!99196 tp!86405))

(declare-fun e!661036 () Bool)

(declare-fun array_inv!27753 (array!75081) Bool)

(assert (=> start!99196 (and (array_inv!27753 _values!996) e!661036)))

(declare-fun b!1162293 () Bool)

(declare-fun e!661028 () Bool)

(declare-fun e!661024 () Bool)

(assert (=> b!1162293 (= e!661028 (not e!661024))))

(declare-fun res!770899 () Bool)

(assert (=> b!1162293 (=> res!770899 e!661024)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162293 (= res!770899 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162293 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522876 () Unit!38269)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75079 (_ BitVec 64) (_ BitVec 32)) Unit!38269)

(assert (=> b!1162293 (= lt!522876 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1162294 () Bool)

(declare-fun lt!522862 () array!75081)

(declare-fun lt!522869 () array!75079)

(assert (=> b!1162294 (= e!661039 (= lt!522863 (getCurrentListMapNoExtraKeys!4812 lt!522869 lt!522862 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1162295 () Bool)

(declare-fun res!770888 () Bool)

(assert (=> b!1162295 (=> (not res!770888) (not e!661027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75079 (_ BitVec 32)) Bool)

(assert (=> b!1162295 (= res!770888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1162296 () Bool)

(declare-fun call!56391 () ListLongMap!16609)

(declare-fun e!661032 () Bool)

(declare-fun call!56393 () ListLongMap!16609)

(assert (=> b!1162296 (= e!661032 (= call!56391 (-!1416 call!56393 k0!934)))))

(declare-fun b!1162297 () Bool)

(declare-fun e!661030 () Bool)

(assert (=> b!1162297 (= e!661030 e!661026)))

(declare-fun res!770895 () Bool)

(assert (=> b!1162297 (=> res!770895 e!661026)))

(assert (=> b!1162297 (= res!770895 (not (= (select (arr!36184 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1162297 e!661032))

(declare-fun c!116341 () Bool)

(assert (=> b!1162297 (= c!116341 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522868 () Unit!38269)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!646 (array!75079 array!75081 (_ BitVec 32) (_ BitVec 32) V!43921 V!43921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38269)

(assert (=> b!1162297 (= lt!522868 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!646 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162298 () Bool)

(declare-fun e!661037 () Bool)

(assert (=> b!1162298 (= e!661037 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162299 () Bool)

(assert (=> b!1162299 (= e!661024 e!661030)))

(declare-fun res!770889 () Bool)

(assert (=> b!1162299 (=> res!770889 e!661030)))

(assert (=> b!1162299 (= res!770889 (not (= from!1455 i!673)))))

(declare-fun lt!522879 () ListLongMap!16609)

(assert (=> b!1162299 (= lt!522879 (getCurrentListMapNoExtraKeys!4812 lt!522869 lt!522862 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1162299 (= lt!522862 (array!75082 (store (arr!36185 _values!996) i!673 (ValueCellFull!13838 lt!522873)) (size!36722 _values!996)))))

(declare-fun dynLambda!2810 (Int (_ BitVec 64)) V!43921)

(assert (=> b!1162299 (= lt!522873 (dynLambda!2810 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1162299 (= lt!522864 (getCurrentListMapNoExtraKeys!4812 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162300 () Bool)

(assert (=> b!1162300 (contains!6838 (+!3737 lt!522866 (tuple2!18633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!522880 () Unit!38269)

(declare-fun addStillContains!956 (ListLongMap!16609 (_ BitVec 64) V!43921 (_ BitVec 64)) Unit!38269)

(assert (=> b!1162300 (= lt!522880 (addStillContains!956 lt!522866 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1162300 call!56387))

(declare-fun call!56394 () ListLongMap!16609)

(assert (=> b!1162300 (= lt!522866 call!56394)))

(declare-fun lt!522881 () Unit!38269)

(declare-fun call!56389 () Unit!38269)

(assert (=> b!1162300 (= lt!522881 call!56389)))

(declare-fun e!661031 () Unit!38269)

(assert (=> b!1162300 (= e!661031 lt!522880)))

(declare-fun b!1162301 () Bool)

(declare-fun res!770900 () Bool)

(assert (=> b!1162301 (=> (not res!770900) (not e!661027))))

(assert (=> b!1162301 (= res!770900 (and (= (size!36722 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36721 _keys!1208) (size!36722 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162302 () Bool)

(declare-fun e!661025 () Unit!38269)

(declare-fun Unit!38271 () Unit!38269)

(assert (=> b!1162302 (= e!661025 Unit!38271)))

(declare-fun b!1162303 () Bool)

(declare-fun res!770891 () Bool)

(assert (=> b!1162303 (=> (not res!770891) (not e!661028))))

(declare-datatypes ((List!25369 0))(
  ( (Nil!25366) (Cons!25365 (h!26583 (_ BitVec 64)) (t!36918 List!25369)) )
))
(declare-fun arrayNoDuplicates!0 (array!75079 (_ BitVec 32) List!25369) Bool)

(assert (=> b!1162303 (= res!770891 (arrayNoDuplicates!0 lt!522869 #b00000000000000000000000000000000 Nil!25366))))

(declare-fun e!661033 () Bool)

(declare-fun b!1162304 () Bool)

(assert (=> b!1162304 (= e!661033 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162305 () Bool)

(declare-fun res!770894 () Bool)

(assert (=> b!1162305 (=> (not res!770894) (not e!661027))))

(assert (=> b!1162305 (= res!770894 (= (select (arr!36184 _keys!1208) i!673) k0!934))))

(declare-fun bm!56385 () Bool)

(assert (=> bm!56385 (= call!56391 (getCurrentListMapNoExtraKeys!4812 lt!522869 lt!522862 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162306 () Bool)

(declare-fun Unit!38272 () Unit!38269)

(assert (=> b!1162306 (= e!661029 Unit!38272)))

(declare-fun b!1162307 () Bool)

(assert (=> b!1162307 (= e!661027 e!661028)))

(declare-fun res!770896 () Bool)

(assert (=> b!1162307 (=> (not res!770896) (not e!661028))))

(assert (=> b!1162307 (= res!770896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522869 mask!1564))))

(assert (=> b!1162307 (= lt!522869 (array!75080 (store (arr!36184 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36721 _keys!1208)))))

(declare-fun b!1162308 () Bool)

(declare-fun c!116344 () Bool)

(declare-fun lt!522867 () Bool)

(assert (=> b!1162308 (= c!116344 (and (not lt!522867) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661038 () Unit!38269)

(assert (=> b!1162308 (= e!661031 e!661038)))

(declare-fun b!1162309 () Bool)

(declare-fun res!770890 () Bool)

(assert (=> b!1162309 (=> (not res!770890) (not e!661027))))

(assert (=> b!1162309 (= res!770890 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25366))))

(declare-fun bm!56386 () Bool)

(declare-fun call!56390 () Bool)

(assert (=> bm!56386 (= call!56390 call!56387)))

(declare-fun bm!56387 () Bool)

(assert (=> bm!56387 (= call!56394 (+!3737 lt!522870 (ite (or c!116343 c!116344) (tuple2!18633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1162310 () Bool)

(assert (=> b!1162310 call!56390))

(declare-fun lt!522882 () Unit!38269)

(declare-fun call!56392 () Unit!38269)

(assert (=> b!1162310 (= lt!522882 call!56392)))

(assert (=> b!1162310 (= e!661025 lt!522882)))

(declare-fun b!1162311 () Bool)

(assert (=> b!1162311 (= e!661037 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522867) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162312 () Bool)

(declare-fun Unit!38273 () Unit!38269)

(assert (=> b!1162312 (= e!661029 Unit!38273)))

(assert (=> b!1162312 (= lt!522867 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1162312 (= c!116343 (and (not lt!522867) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522883 () Unit!38269)

(assert (=> b!1162312 (= lt!522883 e!661031)))

(declare-fun lt!522878 () Unit!38269)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!542 (array!75079 array!75081 (_ BitVec 32) (_ BitVec 32) V!43921 V!43921 (_ BitVec 64) (_ BitVec 32) Int) Unit!38269)

(assert (=> b!1162312 (= lt!522878 (lemmaListMapContainsThenArrayContainsFrom!542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116342 () Bool)

(assert (=> b!1162312 (= c!116342 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770897 () Bool)

(assert (=> b!1162312 (= res!770897 e!661037)))

(assert (=> b!1162312 (=> (not res!770897) (not e!661033))))

(assert (=> b!1162312 e!661033))

(declare-fun lt!522865 () Unit!38269)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75079 (_ BitVec 32) (_ BitVec 32)) Unit!38269)

(assert (=> b!1162312 (= lt!522865 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1162312 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25366)))

(declare-fun lt!522872 () Unit!38269)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75079 (_ BitVec 64) (_ BitVec 32) List!25369) Unit!38269)

(assert (=> b!1162312 (= lt!522872 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25366))))

(assert (=> b!1162312 false))

(declare-fun b!1162313 () Bool)

(declare-fun res!770893 () Bool)

(assert (=> b!1162313 (=> (not res!770893) (not e!661027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162313 (= res!770893 (validMask!0 mask!1564))))

(declare-fun b!1162314 () Bool)

(assert (=> b!1162314 (= e!661032 (= call!56391 call!56393))))

(declare-fun b!1162315 () Bool)

(declare-fun lt!522874 () Unit!38269)

(assert (=> b!1162315 (= e!661038 lt!522874)))

(assert (=> b!1162315 (= lt!522874 call!56392)))

(assert (=> b!1162315 call!56390))

(declare-fun b!1162316 () Bool)

(declare-fun res!770898 () Bool)

(assert (=> b!1162316 (=> (not res!770898) (not e!661027))))

(assert (=> b!1162316 (= res!770898 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36721 _keys!1208))))))

(declare-fun mapIsEmpty!45467 () Bool)

(declare-fun mapRes!45467 () Bool)

(assert (=> mapIsEmpty!45467 mapRes!45467))

(declare-fun bm!56388 () Bool)

(assert (=> bm!56388 (= call!56388 call!56394)))

(declare-fun mapNonEmpty!45467 () Bool)

(declare-fun tp!86406 () Bool)

(assert (=> mapNonEmpty!45467 (= mapRes!45467 (and tp!86406 e!661023))))

(declare-fun mapKey!45467 () (_ BitVec 32))

(declare-fun mapValue!45467 () ValueCell!13838)

(declare-fun mapRest!45467 () (Array (_ BitVec 32) ValueCell!13838))

(assert (=> mapNonEmpty!45467 (= (arr!36185 _values!996) (store mapRest!45467 mapKey!45467 mapValue!45467))))

(declare-fun bm!56389 () Bool)

(assert (=> bm!56389 (= call!56389 (addStillContains!956 lt!522870 (ite (or c!116343 c!116344) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116343 c!116344) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1162317 () Bool)

(assert (=> b!1162317 (= e!661038 e!661025)))

(declare-fun c!116345 () Bool)

(assert (=> b!1162317 (= c!116345 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522867))))

(declare-fun bm!56390 () Bool)

(assert (=> bm!56390 (= call!56393 (getCurrentListMapNoExtraKeys!4812 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56391 () Bool)

(assert (=> bm!56391 (= call!56392 call!56389)))

(declare-fun b!1162318 () Bool)

(declare-fun e!661034 () Bool)

(assert (=> b!1162318 (= e!661034 tp_is_empty!29095)))

(declare-fun b!1162319 () Bool)

(declare-fun res!770901 () Bool)

(assert (=> b!1162319 (=> (not res!770901) (not e!661027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162319 (= res!770901 (validKeyInArray!0 k0!934))))

(declare-fun b!1162320 () Bool)

(assert (=> b!1162320 (= e!661036 (and e!661034 mapRes!45467))))

(declare-fun condMapEmpty!45467 () Bool)

(declare-fun mapDefault!45467 () ValueCell!13838)

(assert (=> b!1162320 (= condMapEmpty!45467 (= (arr!36185 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13838)) mapDefault!45467)))))

(assert (= (and start!99196 res!770887) b!1162313))

(assert (= (and b!1162313 res!770893) b!1162301))

(assert (= (and b!1162301 res!770900) b!1162295))

(assert (= (and b!1162295 res!770888) b!1162309))

(assert (= (and b!1162309 res!770890) b!1162316))

(assert (= (and b!1162316 res!770898) b!1162319))

(assert (= (and b!1162319 res!770901) b!1162305))

(assert (= (and b!1162305 res!770894) b!1162307))

(assert (= (and b!1162307 res!770896) b!1162303))

(assert (= (and b!1162303 res!770891) b!1162293))

(assert (= (and b!1162293 (not res!770899)) b!1162299))

(assert (= (and b!1162299 (not res!770889)) b!1162297))

(assert (= (and b!1162297 c!116341) b!1162296))

(assert (= (and b!1162297 (not c!116341)) b!1162314))

(assert (= (or b!1162296 b!1162314) bm!56385))

(assert (= (or b!1162296 b!1162314) bm!56390))

(assert (= (and b!1162297 (not res!770895)) b!1162292))

(assert (= (and b!1162292 c!116346) b!1162312))

(assert (= (and b!1162292 (not c!116346)) b!1162306))

(assert (= (and b!1162312 c!116343) b!1162300))

(assert (= (and b!1162312 (not c!116343)) b!1162308))

(assert (= (and b!1162308 c!116344) b!1162315))

(assert (= (and b!1162308 (not c!116344)) b!1162317))

(assert (= (and b!1162317 c!116345) b!1162310))

(assert (= (and b!1162317 (not c!116345)) b!1162302))

(assert (= (or b!1162315 b!1162310) bm!56391))

(assert (= (or b!1162315 b!1162310) bm!56388))

(assert (= (or b!1162315 b!1162310) bm!56386))

(assert (= (or b!1162300 bm!56386) bm!56384))

(assert (= (or b!1162300 bm!56391) bm!56389))

(assert (= (or b!1162300 bm!56388) bm!56387))

(assert (= (and b!1162312 c!116342) b!1162298))

(assert (= (and b!1162312 (not c!116342)) b!1162311))

(assert (= (and b!1162312 res!770897) b!1162304))

(assert (= (and b!1162292 res!770892) b!1162294))

(assert (= (and b!1162320 condMapEmpty!45467) mapIsEmpty!45467))

(assert (= (and b!1162320 (not condMapEmpty!45467)) mapNonEmpty!45467))

(get-info :version)

(assert (= (and mapNonEmpty!45467 ((_ is ValueCellFull!13838) mapValue!45467)) b!1162291))

(assert (= (and b!1162320 ((_ is ValueCellFull!13838) mapDefault!45467)) b!1162318))

(assert (= start!99196 b!1162320))

(declare-fun b_lambda!19665 () Bool)

(assert (=> (not b_lambda!19665) (not b!1162299)))

(declare-fun t!36916 () Bool)

(declare-fun tb!9369 () Bool)

(assert (=> (and start!99196 (= defaultEntry!1004 defaultEntry!1004) t!36916) tb!9369))

(declare-fun result!19311 () Bool)

(assert (=> tb!9369 (= result!19311 tp_is_empty!29095)))

(assert (=> b!1162299 t!36916))

(declare-fun b_and!39983 () Bool)

(assert (= b_and!39981 (and (=> t!36916 result!19311) b_and!39983)))

(declare-fun m!1071449 () Bool)

(assert (=> b!1162295 m!1071449))

(declare-fun m!1071451 () Bool)

(assert (=> bm!56384 m!1071451))

(declare-fun m!1071453 () Bool)

(assert (=> b!1162309 m!1071453))

(declare-fun m!1071455 () Bool)

(assert (=> b!1162299 m!1071455))

(declare-fun m!1071457 () Bool)

(assert (=> b!1162299 m!1071457))

(declare-fun m!1071459 () Bool)

(assert (=> b!1162299 m!1071459))

(declare-fun m!1071461 () Bool)

(assert (=> b!1162299 m!1071461))

(declare-fun m!1071463 () Bool)

(assert (=> start!99196 m!1071463))

(declare-fun m!1071465 () Bool)

(assert (=> start!99196 m!1071465))

(declare-fun m!1071467 () Bool)

(assert (=> bm!56387 m!1071467))

(declare-fun m!1071469 () Bool)

(assert (=> b!1162319 m!1071469))

(declare-fun m!1071471 () Bool)

(assert (=> bm!56390 m!1071471))

(declare-fun m!1071473 () Bool)

(assert (=> bm!56389 m!1071473))

(declare-fun m!1071475 () Bool)

(assert (=> mapNonEmpty!45467 m!1071475))

(assert (=> b!1162292 m!1071471))

(declare-fun m!1071477 () Bool)

(assert (=> b!1162292 m!1071477))

(declare-fun m!1071479 () Bool)

(assert (=> b!1162292 m!1071479))

(declare-fun m!1071481 () Bool)

(assert (=> b!1162292 m!1071481))

(declare-fun m!1071483 () Bool)

(assert (=> b!1162292 m!1071483))

(assert (=> b!1162292 m!1071477))

(assert (=> b!1162292 m!1071483))

(declare-fun m!1071485 () Bool)

(assert (=> b!1162292 m!1071485))

(assert (=> b!1162292 m!1071479))

(declare-fun m!1071487 () Bool)

(assert (=> b!1162292 m!1071487))

(declare-fun m!1071489 () Bool)

(assert (=> b!1162292 m!1071489))

(assert (=> b!1162292 m!1071479))

(declare-fun m!1071491 () Bool)

(assert (=> b!1162292 m!1071491))

(assert (=> b!1162297 m!1071479))

(declare-fun m!1071493 () Bool)

(assert (=> b!1162297 m!1071493))

(declare-fun m!1071495 () Bool)

(assert (=> b!1162294 m!1071495))

(assert (=> bm!56385 m!1071495))

(declare-fun m!1071497 () Bool)

(assert (=> b!1162312 m!1071497))

(declare-fun m!1071499 () Bool)

(assert (=> b!1162312 m!1071499))

(declare-fun m!1071501 () Bool)

(assert (=> b!1162312 m!1071501))

(declare-fun m!1071503 () Bool)

(assert (=> b!1162312 m!1071503))

(declare-fun m!1071505 () Bool)

(assert (=> b!1162300 m!1071505))

(assert (=> b!1162300 m!1071505))

(declare-fun m!1071507 () Bool)

(assert (=> b!1162300 m!1071507))

(declare-fun m!1071509 () Bool)

(assert (=> b!1162300 m!1071509))

(declare-fun m!1071511 () Bool)

(assert (=> b!1162304 m!1071511))

(declare-fun m!1071513 () Bool)

(assert (=> b!1162296 m!1071513))

(declare-fun m!1071515 () Bool)

(assert (=> b!1162303 m!1071515))

(declare-fun m!1071517 () Bool)

(assert (=> b!1162313 m!1071517))

(declare-fun m!1071519 () Bool)

(assert (=> b!1162307 m!1071519))

(declare-fun m!1071521 () Bool)

(assert (=> b!1162307 m!1071521))

(declare-fun m!1071523 () Bool)

(assert (=> b!1162305 m!1071523))

(declare-fun m!1071525 () Bool)

(assert (=> b!1162293 m!1071525))

(declare-fun m!1071527 () Bool)

(assert (=> b!1162293 m!1071527))

(assert (=> b!1162298 m!1071511))

(check-sat (not b!1162300) (not bm!56385) (not b!1162313) (not b_lambda!19665) (not start!99196) (not bm!56389) (not b!1162293) tp_is_empty!29095 (not b!1162299) b_and!39983 (not b!1162312) (not bm!56384) (not b!1162319) (not b!1162309) (not b!1162304) (not b!1162303) (not b!1162307) (not b!1162297) (not b_next!24565) (not b!1162298) (not b!1162295) (not bm!56390) (not b!1162296) (not b!1162292) (not bm!56387) (not b!1162294) (not mapNonEmpty!45467))
(check-sat b_and!39983 (not b_next!24565))
