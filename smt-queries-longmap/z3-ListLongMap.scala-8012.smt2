; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99148 () Bool)

(assert start!99148)

(declare-fun b_free!24517 () Bool)

(declare-fun b_next!24517 () Bool)

(assert (=> start!99148 (= b_free!24517 (not b_next!24517))))

(declare-fun tp!86262 () Bool)

(declare-fun b_and!39885 () Bool)

(assert (=> start!99148 (= tp!86262 b_and!39885)))

(declare-fun b!1160083 () Bool)

(declare-fun e!659804 () Bool)

(declare-fun e!659799 () Bool)

(assert (=> b!1160083 (= e!659804 e!659799)))

(declare-fun res!769819 () Bool)

(assert (=> b!1160083 (=> (not res!769819) (not e!659799))))

(declare-datatypes ((array!74985 0))(
  ( (array!74986 (arr!36137 (Array (_ BitVec 32) (_ BitVec 64))) (size!36674 (_ BitVec 32))) )
))
(declare-fun lt!521299 () array!74985)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74985 (_ BitVec 32)) Bool)

(assert (=> b!1160083 (= res!769819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521299 mask!1564))))

(declare-fun _keys!1208 () array!74985)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160083 (= lt!521299 (array!74986 (store (arr!36137 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36674 _keys!1208)))))

(declare-fun b!1160084 () Bool)

(declare-fun e!659809 () Bool)

(declare-fun tp_is_empty!29047 () Bool)

(assert (=> b!1160084 (= e!659809 tp_is_empty!29047)))

(declare-fun b!1160085 () Bool)

(declare-fun e!659812 () Bool)

(declare-datatypes ((V!43857 0))(
  ( (V!43858 (val!14580 Int)) )
))
(declare-datatypes ((tuple2!18586 0))(
  ( (tuple2!18587 (_1!9304 (_ BitVec 64)) (_2!9304 V!43857)) )
))
(declare-datatypes ((List!25327 0))(
  ( (Nil!25324) (Cons!25323 (h!26541 tuple2!18586) (t!36828 List!25327)) )
))
(declare-datatypes ((ListLongMap!16563 0))(
  ( (ListLongMap!16564 (toList!8297 List!25327)) )
))
(declare-fun call!55814 () ListLongMap!16563)

(declare-fun call!55815 () ListLongMap!16563)

(assert (=> b!1160085 (= e!659812 (= call!55814 call!55815))))

(declare-fun res!769812 () Bool)

(assert (=> start!99148 (=> (not res!769812) (not e!659804))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99148 (= res!769812 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36674 _keys!1208))))))

(assert (=> start!99148 e!659804))

(assert (=> start!99148 tp_is_empty!29047))

(declare-fun array_inv!27720 (array!74985) Bool)

(assert (=> start!99148 (array_inv!27720 _keys!1208)))

(assert (=> start!99148 true))

(assert (=> start!99148 tp!86262))

(declare-datatypes ((ValueCell!13814 0))(
  ( (ValueCellFull!13814 (v!17213 V!43857)) (EmptyCell!13814) )
))
(declare-datatypes ((array!74987 0))(
  ( (array!74988 (arr!36138 (Array (_ BitVec 32) ValueCell!13814)) (size!36675 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74987)

(declare-fun e!659808 () Bool)

(declare-fun array_inv!27721 (array!74987) Bool)

(assert (=> start!99148 (and (array_inv!27721 _values!996) e!659808)))

(declare-fun lt!521296 () ListLongMap!16563)

(declare-fun bm!55808 () Bool)

(declare-fun c!115914 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!55812 () ListLongMap!16563)

(declare-fun call!55811 () Bool)

(declare-fun contains!6819 (ListLongMap!16563 (_ BitVec 64)) Bool)

(assert (=> bm!55808 (= call!55811 (contains!6819 (ite c!115914 lt!521296 call!55812) k0!934))))

(declare-fun b!1160086 () Bool)

(declare-datatypes ((Unit!38181 0))(
  ( (Unit!38182) )
))
(declare-fun e!659805 () Unit!38181)

(declare-fun Unit!38183 () Unit!38181)

(assert (=> b!1160086 (= e!659805 Unit!38183)))

(declare-fun lt!521283 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1160086 (= lt!521283 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160086 (= c!115914 (and (not lt!521283) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521278 () Unit!38181)

(declare-fun e!659802 () Unit!38181)

(assert (=> b!1160086 (= lt!521278 e!659802)))

(declare-fun zeroValue!944 () V!43857)

(declare-fun lt!521284 () Unit!38181)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43857)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!526 (array!74985 array!74987 (_ BitVec 32) (_ BitVec 32) V!43857 V!43857 (_ BitVec 64) (_ BitVec 32) Int) Unit!38181)

(assert (=> b!1160086 (= lt!521284 (lemmaListMapContainsThenArrayContainsFrom!526 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115911 () Bool)

(assert (=> b!1160086 (= c!115911 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769810 () Bool)

(declare-fun e!659815 () Bool)

(assert (=> b!1160086 (= res!769810 e!659815)))

(declare-fun e!659810 () Bool)

(assert (=> b!1160086 (=> (not res!769810) (not e!659810))))

(assert (=> b!1160086 e!659810))

(declare-fun lt!521295 () Unit!38181)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74985 (_ BitVec 32) (_ BitVec 32)) Unit!38181)

(assert (=> b!1160086 (= lt!521295 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25328 0))(
  ( (Nil!25325) (Cons!25324 (h!26542 (_ BitVec 64)) (t!36829 List!25328)) )
))
(declare-fun arrayNoDuplicates!0 (array!74985 (_ BitVec 32) List!25328) Bool)

(assert (=> b!1160086 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25325)))

(declare-fun lt!521291 () Unit!38181)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74985 (_ BitVec 64) (_ BitVec 32) List!25328) Unit!38181)

(assert (=> b!1160086 (= lt!521291 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25325))))

(assert (=> b!1160086 false))

(declare-fun bm!55809 () Bool)

(declare-fun call!55813 () Unit!38181)

(declare-fun call!55817 () Unit!38181)

(assert (=> bm!55809 (= call!55813 call!55817)))

(declare-fun bm!55810 () Bool)

(declare-fun lt!521279 () array!74987)

(declare-fun getCurrentListMapNoExtraKeys!4789 (array!74985 array!74987 (_ BitVec 32) (_ BitVec 32) V!43857 V!43857 (_ BitVec 32) Int) ListLongMap!16563)

(assert (=> bm!55810 (= call!55814 (getCurrentListMapNoExtraKeys!4789 lt!521299 lt!521279 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160087 () Bool)

(declare-fun e!659811 () Unit!38181)

(declare-fun e!659806 () Unit!38181)

(assert (=> b!1160087 (= e!659811 e!659806)))

(declare-fun c!115913 () Bool)

(assert (=> b!1160087 (= c!115913 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521283))))

(declare-fun b!1160088 () Bool)

(declare-fun mapRes!45395 () Bool)

(assert (=> b!1160088 (= e!659808 (and e!659809 mapRes!45395))))

(declare-fun condMapEmpty!45395 () Bool)

(declare-fun mapDefault!45395 () ValueCell!13814)

(assert (=> b!1160088 (= condMapEmpty!45395 (= (arr!36138 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13814)) mapDefault!45395)))))

(declare-fun b!1160089 () Bool)

(declare-fun c!115912 () Bool)

(assert (=> b!1160089 (= c!115912 (and (not lt!521283) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1160089 (= e!659802 e!659811)))

(declare-fun b!1160090 () Bool)

(declare-fun res!769820 () Bool)

(assert (=> b!1160090 (=> (not res!769820) (not e!659799))))

(assert (=> b!1160090 (= res!769820 (arrayNoDuplicates!0 lt!521299 #b00000000000000000000000000000000 Nil!25325))))

(declare-fun b!1160091 () Bool)

(declare-fun res!769813 () Bool)

(assert (=> b!1160091 (=> (not res!769813) (not e!659804))))

(assert (=> b!1160091 (= res!769813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160092 () Bool)

(declare-fun lt!521281 () Unit!38181)

(assert (=> b!1160092 (= e!659811 lt!521281)))

(assert (=> b!1160092 (= lt!521281 call!55813)))

(declare-fun call!55818 () Bool)

(assert (=> b!1160092 call!55818))

(declare-fun b!1160093 () Bool)

(declare-fun e!659813 () Bool)

(assert (=> b!1160093 (= e!659799 (not e!659813))))

(declare-fun res!769815 () Bool)

(assert (=> b!1160093 (=> res!769815 e!659813)))

(assert (=> b!1160093 (= res!769815 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160093 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521288 () Unit!38181)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74985 (_ BitVec 64) (_ BitVec 32)) Unit!38181)

(assert (=> b!1160093 (= lt!521288 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1160094 () Bool)

(declare-fun e!659800 () Bool)

(assert (=> b!1160094 (= e!659800 true)))

(declare-fun e!659803 () Bool)

(assert (=> b!1160094 e!659803))

(declare-fun res!769809 () Bool)

(assert (=> b!1160094 (=> (not res!769809) (not e!659803))))

(declare-fun lt!521298 () ListLongMap!16563)

(declare-fun lt!521280 () ListLongMap!16563)

(assert (=> b!1160094 (= res!769809 (= lt!521298 lt!521280))))

(declare-fun lt!521287 () ListLongMap!16563)

(declare-fun -!1398 (ListLongMap!16563 (_ BitVec 64)) ListLongMap!16563)

(assert (=> b!1160094 (= lt!521298 (-!1398 lt!521287 k0!934))))

(declare-fun lt!521285 () V!43857)

(declare-fun +!3717 (ListLongMap!16563 tuple2!18586) ListLongMap!16563)

(assert (=> b!1160094 (= (-!1398 (+!3717 lt!521280 (tuple2!18587 (select (arr!36137 _keys!1208) from!1455) lt!521285)) (select (arr!36137 _keys!1208) from!1455)) lt!521280)))

(declare-fun lt!521282 () Unit!38181)

(declare-fun addThenRemoveForNewKeyIsSame!230 (ListLongMap!16563 (_ BitVec 64) V!43857) Unit!38181)

(assert (=> b!1160094 (= lt!521282 (addThenRemoveForNewKeyIsSame!230 lt!521280 (select (arr!36137 _keys!1208) from!1455) lt!521285))))

(declare-fun lt!521292 () V!43857)

(declare-fun get!18447 (ValueCell!13814 V!43857) V!43857)

(assert (=> b!1160094 (= lt!521285 (get!18447 (select (arr!36138 _values!996) from!1455) lt!521292))))

(declare-fun lt!521289 () Unit!38181)

(assert (=> b!1160094 (= lt!521289 e!659805)))

(declare-fun c!115909 () Bool)

(assert (=> b!1160094 (= c!115909 (contains!6819 lt!521280 k0!934))))

(assert (=> b!1160094 (= lt!521280 (getCurrentListMapNoExtraKeys!4789 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160095 () Bool)

(declare-fun e!659814 () Bool)

(assert (=> b!1160095 (= e!659814 tp_is_empty!29047)))

(declare-fun b!1160096 () Bool)

(declare-fun res!769816 () Bool)

(assert (=> b!1160096 (=> (not res!769816) (not e!659804))))

(assert (=> b!1160096 (= res!769816 (= (select (arr!36137 _keys!1208) i!673) k0!934))))

(declare-fun b!1160097 () Bool)

(assert (=> b!1160097 (= e!659810 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160098 () Bool)

(declare-fun res!769817 () Bool)

(assert (=> b!1160098 (=> (not res!769817) (not e!659804))))

(assert (=> b!1160098 (= res!769817 (and (= (size!36675 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36674 _keys!1208) (size!36675 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!55811 () Bool)

(assert (=> bm!55811 (= call!55818 call!55811)))

(declare-fun b!1160099 () Bool)

(assert (=> b!1160099 (= e!659812 (= call!55814 (-!1398 call!55815 k0!934)))))

(declare-fun b!1160100 () Bool)

(declare-fun Unit!38184 () Unit!38181)

(assert (=> b!1160100 (= e!659805 Unit!38184)))

(declare-fun bm!55812 () Bool)

(assert (=> bm!55812 (= call!55815 (getCurrentListMapNoExtraKeys!4789 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55813 () Bool)

(declare-fun addStillContains!939 (ListLongMap!16563 (_ BitVec 64) V!43857 (_ BitVec 64)) Unit!38181)

(assert (=> bm!55813 (= call!55817 (addStillContains!939 lt!521280 (ite (or c!115914 c!115912) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115914 c!115912) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1160101 () Bool)

(declare-fun res!769808 () Bool)

(assert (=> b!1160101 (=> (not res!769808) (not e!659804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160101 (= res!769808 (validMask!0 mask!1564))))

(declare-fun b!1160102 () Bool)

(declare-fun call!55816 () ListLongMap!16563)

(assert (=> b!1160102 (contains!6819 call!55816 k0!934)))

(declare-fun lt!521297 () Unit!38181)

(assert (=> b!1160102 (= lt!521297 (addStillContains!939 lt!521296 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1160102 call!55811))

(assert (=> b!1160102 (= lt!521296 (+!3717 lt!521280 (tuple2!18587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!521290 () Unit!38181)

(assert (=> b!1160102 (= lt!521290 call!55817)))

(assert (=> b!1160102 (= e!659802 lt!521297)))

(declare-fun bm!55814 () Bool)

(assert (=> bm!55814 (= call!55812 call!55816)))

(declare-fun b!1160103 () Bool)

(declare-fun res!769807 () Bool)

(assert (=> b!1160103 (=> (not res!769807) (not e!659804))))

(assert (=> b!1160103 (= res!769807 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36674 _keys!1208))))))

(declare-fun b!1160104 () Bool)

(declare-fun e!659801 () Bool)

(assert (=> b!1160104 (= e!659801 e!659800)))

(declare-fun res!769821 () Bool)

(assert (=> b!1160104 (=> res!769821 e!659800)))

(assert (=> b!1160104 (= res!769821 (not (= (select (arr!36137 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1160104 e!659812))

(declare-fun c!115910 () Bool)

(assert (=> b!1160104 (= c!115910 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521294 () Unit!38181)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!633 (array!74985 array!74987 (_ BitVec 32) (_ BitVec 32) V!43857 V!43857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38181)

(assert (=> b!1160104 (= lt!521294 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!633 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55815 () Bool)

(assert (=> bm!55815 (= call!55816 (+!3717 (ite c!115914 lt!521296 lt!521280) (ite c!115914 (tuple2!18587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115912 (tuple2!18587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1160105 () Bool)

(assert (=> b!1160105 call!55818))

(declare-fun lt!521286 () Unit!38181)

(assert (=> b!1160105 (= lt!521286 call!55813)))

(assert (=> b!1160105 (= e!659806 lt!521286)))

(declare-fun b!1160106 () Bool)

(declare-fun res!769814 () Bool)

(assert (=> b!1160106 (=> (not res!769814) (not e!659804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160106 (= res!769814 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45395 () Bool)

(assert (=> mapIsEmpty!45395 mapRes!45395))

(declare-fun b!1160107 () Bool)

(assert (=> b!1160107 (= e!659815 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45395 () Bool)

(declare-fun tp!86261 () Bool)

(assert (=> mapNonEmpty!45395 (= mapRes!45395 (and tp!86261 e!659814))))

(declare-fun mapKey!45395 () (_ BitVec 32))

(declare-fun mapRest!45395 () (Array (_ BitVec 32) ValueCell!13814))

(declare-fun mapValue!45395 () ValueCell!13814)

(assert (=> mapNonEmpty!45395 (= (arr!36138 _values!996) (store mapRest!45395 mapKey!45395 mapValue!45395))))

(declare-fun b!1160108 () Bool)

(declare-fun res!769818 () Bool)

(assert (=> b!1160108 (=> (not res!769818) (not e!659804))))

(assert (=> b!1160108 (= res!769818 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25325))))

(declare-fun b!1160109 () Bool)

(assert (=> b!1160109 (= e!659813 e!659801)))

(declare-fun res!769811 () Bool)

(assert (=> b!1160109 (=> res!769811 e!659801)))

(assert (=> b!1160109 (= res!769811 (not (= from!1455 i!673)))))

(declare-fun lt!521293 () ListLongMap!16563)

(assert (=> b!1160109 (= lt!521293 (getCurrentListMapNoExtraKeys!4789 lt!521299 lt!521279 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1160109 (= lt!521279 (array!74988 (store (arr!36138 _values!996) i!673 (ValueCellFull!13814 lt!521292)) (size!36675 _values!996)))))

(declare-fun dynLambda!2799 (Int (_ BitVec 64)) V!43857)

(assert (=> b!1160109 (= lt!521292 (dynLambda!2799 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1160109 (= lt!521287 (getCurrentListMapNoExtraKeys!4789 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160110 () Bool)

(declare-fun Unit!38185 () Unit!38181)

(assert (=> b!1160110 (= e!659806 Unit!38185)))

(declare-fun b!1160111 () Bool)

(assert (=> b!1160111 (= e!659815 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521283) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160112 () Bool)

(assert (=> b!1160112 (= e!659803 (= lt!521298 (getCurrentListMapNoExtraKeys!4789 lt!521299 lt!521279 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (= (and start!99148 res!769812) b!1160101))

(assert (= (and b!1160101 res!769808) b!1160098))

(assert (= (and b!1160098 res!769817) b!1160091))

(assert (= (and b!1160091 res!769813) b!1160108))

(assert (= (and b!1160108 res!769818) b!1160103))

(assert (= (and b!1160103 res!769807) b!1160106))

(assert (= (and b!1160106 res!769814) b!1160096))

(assert (= (and b!1160096 res!769816) b!1160083))

(assert (= (and b!1160083 res!769819) b!1160090))

(assert (= (and b!1160090 res!769820) b!1160093))

(assert (= (and b!1160093 (not res!769815)) b!1160109))

(assert (= (and b!1160109 (not res!769811)) b!1160104))

(assert (= (and b!1160104 c!115910) b!1160099))

(assert (= (and b!1160104 (not c!115910)) b!1160085))

(assert (= (or b!1160099 b!1160085) bm!55812))

(assert (= (or b!1160099 b!1160085) bm!55810))

(assert (= (and b!1160104 (not res!769821)) b!1160094))

(assert (= (and b!1160094 c!115909) b!1160086))

(assert (= (and b!1160094 (not c!115909)) b!1160100))

(assert (= (and b!1160086 c!115914) b!1160102))

(assert (= (and b!1160086 (not c!115914)) b!1160089))

(assert (= (and b!1160089 c!115912) b!1160092))

(assert (= (and b!1160089 (not c!115912)) b!1160087))

(assert (= (and b!1160087 c!115913) b!1160105))

(assert (= (and b!1160087 (not c!115913)) b!1160110))

(assert (= (or b!1160092 b!1160105) bm!55809))

(assert (= (or b!1160092 b!1160105) bm!55814))

(assert (= (or b!1160092 b!1160105) bm!55811))

(assert (= (or b!1160102 bm!55811) bm!55808))

(assert (= (or b!1160102 bm!55809) bm!55813))

(assert (= (or b!1160102 bm!55814) bm!55815))

(assert (= (and b!1160086 c!115911) b!1160107))

(assert (= (and b!1160086 (not c!115911)) b!1160111))

(assert (= (and b!1160086 res!769810) b!1160097))

(assert (= (and b!1160094 res!769809) b!1160112))

(assert (= (and b!1160088 condMapEmpty!45395) mapIsEmpty!45395))

(assert (= (and b!1160088 (not condMapEmpty!45395)) mapNonEmpty!45395))

(get-info :version)

(assert (= (and mapNonEmpty!45395 ((_ is ValueCellFull!13814) mapValue!45395)) b!1160095))

(assert (= (and b!1160088 ((_ is ValueCellFull!13814) mapDefault!45395)) b!1160084))

(assert (= start!99148 b!1160088))

(declare-fun b_lambda!19617 () Bool)

(assert (=> (not b_lambda!19617) (not b!1160109)))

(declare-fun t!36827 () Bool)

(declare-fun tb!9321 () Bool)

(assert (=> (and start!99148 (= defaultEntry!1004 defaultEntry!1004) t!36827) tb!9321))

(declare-fun result!19215 () Bool)

(assert (=> tb!9321 (= result!19215 tp_is_empty!29047)))

(assert (=> b!1160109 t!36827))

(declare-fun b_and!39887 () Bool)

(assert (= b_and!39885 (and (=> t!36827 result!19215) b_and!39887)))

(declare-fun m!1069521 () Bool)

(assert (=> b!1160101 m!1069521))

(declare-fun m!1069523 () Bool)

(assert (=> b!1160086 m!1069523))

(declare-fun m!1069525 () Bool)

(assert (=> b!1160086 m!1069525))

(declare-fun m!1069527 () Bool)

(assert (=> b!1160086 m!1069527))

(declare-fun m!1069529 () Bool)

(assert (=> b!1160086 m!1069529))

(declare-fun m!1069531 () Bool)

(assert (=> b!1160107 m!1069531))

(declare-fun m!1069533 () Bool)

(assert (=> b!1160090 m!1069533))

(declare-fun m!1069535 () Bool)

(assert (=> bm!55813 m!1069535))

(declare-fun m!1069537 () Bool)

(assert (=> bm!55815 m!1069537))

(declare-fun m!1069539 () Bool)

(assert (=> b!1160102 m!1069539))

(declare-fun m!1069541 () Bool)

(assert (=> b!1160102 m!1069541))

(declare-fun m!1069543 () Bool)

(assert (=> b!1160102 m!1069543))

(declare-fun m!1069545 () Bool)

(assert (=> bm!55808 m!1069545))

(declare-fun m!1069547 () Bool)

(assert (=> b!1160106 m!1069547))

(declare-fun m!1069549 () Bool)

(assert (=> b!1160083 m!1069549))

(declare-fun m!1069551 () Bool)

(assert (=> b!1160083 m!1069551))

(declare-fun m!1069553 () Bool)

(assert (=> b!1160108 m!1069553))

(declare-fun m!1069555 () Bool)

(assert (=> bm!55810 m!1069555))

(assert (=> b!1160112 m!1069555))

(declare-fun m!1069557 () Bool)

(assert (=> b!1160096 m!1069557))

(declare-fun m!1069559 () Bool)

(assert (=> b!1160091 m!1069559))

(assert (=> b!1160097 m!1069531))

(declare-fun m!1069561 () Bool)

(assert (=> b!1160094 m!1069561))

(declare-fun m!1069563 () Bool)

(assert (=> b!1160094 m!1069563))

(assert (=> b!1160094 m!1069563))

(declare-fun m!1069565 () Bool)

(assert (=> b!1160094 m!1069565))

(declare-fun m!1069567 () Bool)

(assert (=> b!1160094 m!1069567))

(assert (=> b!1160094 m!1069567))

(declare-fun m!1069569 () Bool)

(assert (=> b!1160094 m!1069569))

(declare-fun m!1069571 () Bool)

(assert (=> b!1160094 m!1069571))

(declare-fun m!1069573 () Bool)

(assert (=> b!1160094 m!1069573))

(declare-fun m!1069575 () Bool)

(assert (=> b!1160094 m!1069575))

(assert (=> b!1160094 m!1069569))

(assert (=> b!1160094 m!1069569))

(declare-fun m!1069577 () Bool)

(assert (=> b!1160094 m!1069577))

(declare-fun m!1069579 () Bool)

(assert (=> start!99148 m!1069579))

(declare-fun m!1069581 () Bool)

(assert (=> start!99148 m!1069581))

(declare-fun m!1069583 () Bool)

(assert (=> b!1160099 m!1069583))

(assert (=> bm!55812 m!1069561))

(declare-fun m!1069585 () Bool)

(assert (=> mapNonEmpty!45395 m!1069585))

(declare-fun m!1069587 () Bool)

(assert (=> b!1160109 m!1069587))

(declare-fun m!1069589 () Bool)

(assert (=> b!1160109 m!1069589))

(declare-fun m!1069591 () Bool)

(assert (=> b!1160109 m!1069591))

(declare-fun m!1069593 () Bool)

(assert (=> b!1160109 m!1069593))

(assert (=> b!1160104 m!1069569))

(declare-fun m!1069595 () Bool)

(assert (=> b!1160104 m!1069595))

(declare-fun m!1069597 () Bool)

(assert (=> b!1160093 m!1069597))

(declare-fun m!1069599 () Bool)

(assert (=> b!1160093 m!1069599))

(check-sat tp_is_empty!29047 (not bm!55815) (not mapNonEmpty!45395) (not b_lambda!19617) (not bm!55812) (not b!1160099) (not b_next!24517) (not start!99148) (not b!1160106) (not b!1160083) (not b!1160104) (not bm!55810) (not bm!55813) (not b!1160086) (not bm!55808) (not b!1160108) (not b!1160107) (not b!1160097) (not b!1160101) (not b!1160102) (not b!1160112) b_and!39887 (not b!1160091) (not b!1160093) (not b!1160109) (not b!1160094) (not b!1160090))
(check-sat b_and!39887 (not b_next!24517))
