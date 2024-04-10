; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98926 () Bool)

(assert start!98926)

(declare-fun b_free!24531 () Bool)

(declare-fun b_next!24531 () Bool)

(assert (=> start!98926 (= b_free!24531 (not b_next!24531))))

(declare-fun tp!86303 () Bool)

(declare-fun b_and!39911 () Bool)

(assert (=> start!98926 (= tp!86303 b_and!39911)))

(declare-fun b!1159438 () Bool)

(declare-fun e!659337 () Bool)

(declare-datatypes ((V!43875 0))(
  ( (V!43876 (val!14587 Int)) )
))
(declare-datatypes ((tuple2!18572 0))(
  ( (tuple2!18573 (_1!9297 (_ BitVec 64)) (_2!9297 V!43875)) )
))
(declare-datatypes ((List!25310 0))(
  ( (Nil!25307) (Cons!25306 (h!26515 tuple2!18572) (t!36833 List!25310)) )
))
(declare-datatypes ((ListLongMap!16541 0))(
  ( (ListLongMap!16542 (toList!8286 List!25310)) )
))
(declare-fun call!55920 () ListLongMap!16541)

(declare-fun call!55918 () ListLongMap!16541)

(assert (=> b!1159438 (= e!659337 (= call!55920 call!55918))))

(declare-fun b!1159439 () Bool)

(declare-fun e!659328 () Bool)

(declare-fun tp_is_empty!29061 () Bool)

(assert (=> b!1159439 (= e!659328 tp_is_empty!29061)))

(declare-fun zeroValue!944 () V!43875)

(declare-datatypes ((array!74963 0))(
  ( (array!74964 (arr!36132 (Array (_ BitVec 32) (_ BitVec 64))) (size!36668 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74963)

(declare-datatypes ((ValueCell!13821 0))(
  ( (ValueCellFull!13821 (v!17224 V!43875)) (EmptyCell!13821) )
))
(declare-datatypes ((array!74965 0))(
  ( (array!74966 (arr!36133 (Array (_ BitVec 32) ValueCell!13821)) (size!36669 (_ BitVec 32))) )
))
(declare-fun lt!521267 () array!74965)

(declare-fun lt!521263 () array!74963)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!74965)

(declare-fun bm!55911 () Bool)

(declare-fun minValue!944 () V!43875)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun c!115638 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4750 (array!74963 array!74965 (_ BitVec 32) (_ BitVec 32) V!43875 V!43875 (_ BitVec 32) Int) ListLongMap!16541)

(assert (=> bm!55911 (= call!55920 (getCurrentListMapNoExtraKeys!4750 (ite c!115638 _keys!1208 lt!521263) (ite c!115638 _values!996 lt!521267) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159440 () Bool)

(declare-datatypes ((Unit!38211 0))(
  ( (Unit!38212) )
))
(declare-fun e!659329 () Unit!38211)

(declare-fun Unit!38213 () Unit!38211)

(assert (=> b!1159440 (= e!659329 Unit!38213)))

(declare-fun lt!521277 () Bool)

(assert (=> b!1159440 (= lt!521277 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115642 () Bool)

(assert (=> b!1159440 (= c!115642 (and (not lt!521277) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521275 () Unit!38211)

(declare-fun e!659324 () Unit!38211)

(assert (=> b!1159440 (= lt!521275 e!659324)))

(declare-fun lt!521274 () Unit!38211)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!521 (array!74963 array!74965 (_ BitVec 32) (_ BitVec 32) V!43875 V!43875 (_ BitVec 64) (_ BitVec 32) Int) Unit!38211)

(assert (=> b!1159440 (= lt!521274 (lemmaListMapContainsThenArrayContainsFrom!521 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115637 () Bool)

(assert (=> b!1159440 (= c!115637 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769623 () Bool)

(declare-fun e!659325 () Bool)

(assert (=> b!1159440 (= res!769623 e!659325)))

(declare-fun e!659330 () Bool)

(assert (=> b!1159440 (=> (not res!769623) (not e!659330))))

(assert (=> b!1159440 e!659330))

(declare-fun lt!521268 () Unit!38211)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74963 (_ BitVec 32) (_ BitVec 32)) Unit!38211)

(assert (=> b!1159440 (= lt!521268 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25311 0))(
  ( (Nil!25308) (Cons!25307 (h!26516 (_ BitVec 64)) (t!36834 List!25311)) )
))
(declare-fun arrayNoDuplicates!0 (array!74963 (_ BitVec 32) List!25311) Bool)

(assert (=> b!1159440 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25308)))

(declare-fun lt!521271 () Unit!38211)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74963 (_ BitVec 64) (_ BitVec 32) List!25311) Unit!38211)

(assert (=> b!1159440 (= lt!521271 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25308))))

(assert (=> b!1159440 false))

(declare-fun b!1159441 () Bool)

(declare-fun res!769622 () Bool)

(declare-fun e!659333 () Bool)

(assert (=> b!1159441 (=> (not res!769622) (not e!659333))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159441 (= res!769622 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36668 _keys!1208))))))

(declare-fun b!1159442 () Bool)

(declare-fun e!659326 () Bool)

(assert (=> b!1159442 (= e!659333 e!659326)))

(declare-fun res!769624 () Bool)

(assert (=> b!1159442 (=> (not res!769624) (not e!659326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74963 (_ BitVec 32)) Bool)

(assert (=> b!1159442 (= res!769624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521263 mask!1564))))

(assert (=> b!1159442 (= lt!521263 (array!74964 (store (arr!36132 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36668 _keys!1208)))))

(declare-fun b!1159443 () Bool)

(declare-fun -!1396 (ListLongMap!16541 (_ BitVec 64)) ListLongMap!16541)

(assert (=> b!1159443 (= e!659337 (= call!55918 (-!1396 call!55920 k0!934)))))

(declare-fun b!1159444 () Bool)

(declare-fun arrayContainsKey!0 (array!74963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159444 (= e!659330 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159445 () Bool)

(declare-fun e!659338 () Bool)

(declare-fun e!659340 () Bool)

(assert (=> b!1159445 (= e!659338 e!659340)))

(declare-fun res!769627 () Bool)

(assert (=> b!1159445 (=> res!769627 e!659340)))

(assert (=> b!1159445 (= res!769627 (not (= (select (arr!36132 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1159445 e!659337))

(assert (=> b!1159445 (= c!115638 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521260 () Unit!38211)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!627 (array!74963 array!74965 (_ BitVec 32) (_ BitVec 32) V!43875 V!43875 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38211)

(assert (=> b!1159445 (= lt!521260 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!627 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159446 () Bool)

(assert (=> b!1159446 (= e!659340 true)))

(declare-fun e!659336 () Bool)

(assert (=> b!1159446 e!659336))

(declare-fun res!769618 () Bool)

(assert (=> b!1159446 (=> (not res!769618) (not e!659336))))

(declare-fun lt!521256 () ListLongMap!16541)

(declare-fun lt!521276 () ListLongMap!16541)

(assert (=> b!1159446 (= res!769618 (= lt!521256 lt!521276))))

(declare-fun lt!521257 () ListLongMap!16541)

(assert (=> b!1159446 (= lt!521256 (-!1396 lt!521257 k0!934))))

(declare-fun lt!521262 () V!43875)

(declare-fun +!3693 (ListLongMap!16541 tuple2!18572) ListLongMap!16541)

(assert (=> b!1159446 (= (-!1396 (+!3693 lt!521276 (tuple2!18573 (select (arr!36132 _keys!1208) from!1455) lt!521262)) (select (arr!36132 _keys!1208) from!1455)) lt!521276)))

(declare-fun lt!521273 () Unit!38211)

(declare-fun addThenRemoveForNewKeyIsSame!232 (ListLongMap!16541 (_ BitVec 64) V!43875) Unit!38211)

(assert (=> b!1159446 (= lt!521273 (addThenRemoveForNewKeyIsSame!232 lt!521276 (select (arr!36132 _keys!1208) from!1455) lt!521262))))

(declare-fun lt!521259 () V!43875)

(declare-fun get!18422 (ValueCell!13821 V!43875) V!43875)

(assert (=> b!1159446 (= lt!521262 (get!18422 (select (arr!36133 _values!996) from!1455) lt!521259))))

(declare-fun lt!521272 () Unit!38211)

(assert (=> b!1159446 (= lt!521272 e!659329)))

(declare-fun c!115639 () Bool)

(declare-fun contains!6794 (ListLongMap!16541 (_ BitVec 64)) Bool)

(assert (=> b!1159446 (= c!115639 (contains!6794 lt!521276 k0!934))))

(assert (=> b!1159446 (= lt!521276 (getCurrentListMapNoExtraKeys!4750 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55912 () Bool)

(declare-fun call!55914 () ListLongMap!16541)

(declare-fun call!55917 () ListLongMap!16541)

(assert (=> bm!55912 (= call!55914 call!55917)))

(declare-fun b!1159447 () Bool)

(assert (=> b!1159447 (= e!659336 (= lt!521256 (getCurrentListMapNoExtraKeys!4750 lt!521263 lt!521267 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1159448 () Bool)

(declare-fun lt!521265 () ListLongMap!16541)

(assert (=> b!1159448 (contains!6794 (+!3693 lt!521265 (tuple2!18573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!521261 () Unit!38211)

(declare-fun call!55921 () Unit!38211)

(assert (=> b!1159448 (= lt!521261 call!55921)))

(declare-fun call!55919 () Bool)

(assert (=> b!1159448 call!55919))

(assert (=> b!1159448 (= lt!521265 call!55917)))

(declare-fun lt!521266 () Unit!38211)

(declare-fun addStillContains!935 (ListLongMap!16541 (_ BitVec 64) V!43875 (_ BitVec 64)) Unit!38211)

(assert (=> b!1159448 (= lt!521266 (addStillContains!935 lt!521276 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1159448 (= e!659324 lt!521261)))

(declare-fun b!1159449 () Bool)

(declare-fun res!769628 () Bool)

(assert (=> b!1159449 (=> (not res!769628) (not e!659333))))

(assert (=> b!1159449 (= res!769628 (= (select (arr!36132 _keys!1208) i!673) k0!934))))

(declare-fun b!1159450 () Bool)

(declare-fun e!659334 () Unit!38211)

(declare-fun Unit!38214 () Unit!38211)

(assert (=> b!1159450 (= e!659334 Unit!38214)))

(declare-fun b!1159451 () Bool)

(declare-fun res!769616 () Bool)

(assert (=> b!1159451 (=> (not res!769616) (not e!659333))))

(assert (=> b!1159451 (= res!769616 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25308))))

(declare-fun b!1159452 () Bool)

(declare-fun e!659332 () Bool)

(assert (=> b!1159452 (= e!659332 tp_is_empty!29061)))

(declare-fun b!1159453 () Bool)

(assert (=> b!1159453 (= e!659325 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521277) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1159454 () Bool)

(declare-fun Unit!38215 () Unit!38211)

(assert (=> b!1159454 (= e!659329 Unit!38215)))

(declare-fun b!1159455 () Bool)

(declare-fun res!769621 () Bool)

(assert (=> b!1159455 (=> (not res!769621) (not e!659333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159455 (= res!769621 (validMask!0 mask!1564))))

(declare-fun b!1159456 () Bool)

(declare-fun res!769619 () Bool)

(assert (=> b!1159456 (=> (not res!769619) (not e!659333))))

(assert (=> b!1159456 (= res!769619 (and (= (size!36669 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36668 _keys!1208) (size!36669 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159457 () Bool)

(declare-fun res!769626 () Bool)

(assert (=> b!1159457 (=> (not res!769626) (not e!659333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159457 (= res!769626 (validKeyInArray!0 k0!934))))

(declare-fun b!1159458 () Bool)

(declare-fun res!769614 () Bool)

(assert (=> b!1159458 (=> (not res!769614) (not e!659326))))

(assert (=> b!1159458 (= res!769614 (arrayNoDuplicates!0 lt!521263 #b00000000000000000000000000000000 Nil!25308))))

(declare-fun c!115640 () Bool)

(declare-fun bm!55913 () Bool)

(assert (=> bm!55913 (= call!55921 (addStillContains!935 (ite c!115642 lt!521265 lt!521276) (ite c!115642 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115640 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115642 minValue!944 (ite c!115640 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1159459 () Bool)

(declare-fun e!659335 () Bool)

(declare-fun mapRes!45416 () Bool)

(assert (=> b!1159459 (= e!659335 (and e!659328 mapRes!45416))))

(declare-fun condMapEmpty!45416 () Bool)

(declare-fun mapDefault!45416 () ValueCell!13821)

(assert (=> b!1159459 (= condMapEmpty!45416 (= (arr!36133 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13821)) mapDefault!45416)))))

(declare-fun res!769615 () Bool)

(assert (=> start!98926 (=> (not res!769615) (not e!659333))))

(assert (=> start!98926 (= res!769615 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36668 _keys!1208))))))

(assert (=> start!98926 e!659333))

(assert (=> start!98926 tp_is_empty!29061))

(declare-fun array_inv!27648 (array!74963) Bool)

(assert (=> start!98926 (array_inv!27648 _keys!1208)))

(assert (=> start!98926 true))

(assert (=> start!98926 tp!86303))

(declare-fun array_inv!27649 (array!74965) Bool)

(assert (=> start!98926 (and (array_inv!27649 _values!996) e!659335)))

(declare-fun b!1159460 () Bool)

(declare-fun e!659339 () Bool)

(assert (=> b!1159460 (= e!659339 e!659338)))

(declare-fun res!769617 () Bool)

(assert (=> b!1159460 (=> res!769617 e!659338)))

(assert (=> b!1159460 (= res!769617 (not (= from!1455 i!673)))))

(declare-fun lt!521264 () ListLongMap!16541)

(assert (=> b!1159460 (= lt!521264 (getCurrentListMapNoExtraKeys!4750 lt!521263 lt!521267 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1159460 (= lt!521267 (array!74966 (store (arr!36133 _values!996) i!673 (ValueCellFull!13821 lt!521259)) (size!36669 _values!996)))))

(declare-fun dynLambda!2753 (Int (_ BitVec 64)) V!43875)

(assert (=> b!1159460 (= lt!521259 (dynLambda!2753 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1159460 (= lt!521257 (getCurrentListMapNoExtraKeys!4750 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1159461 () Bool)

(declare-fun e!659331 () Unit!38211)

(assert (=> b!1159461 (= e!659331 e!659334)))

(declare-fun c!115641 () Bool)

(assert (=> b!1159461 (= c!115641 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521277))))

(declare-fun b!1159462 () Bool)

(declare-fun lt!521269 () Unit!38211)

(assert (=> b!1159462 (= e!659331 lt!521269)))

(declare-fun call!55916 () Unit!38211)

(assert (=> b!1159462 (= lt!521269 call!55916)))

(declare-fun call!55915 () Bool)

(assert (=> b!1159462 call!55915))

(declare-fun bm!55914 () Bool)

(assert (=> bm!55914 (= call!55916 call!55921)))

(declare-fun mapNonEmpty!45416 () Bool)

(declare-fun tp!86304 () Bool)

(assert (=> mapNonEmpty!45416 (= mapRes!45416 (and tp!86304 e!659332))))

(declare-fun mapValue!45416 () ValueCell!13821)

(declare-fun mapRest!45416 () (Array (_ BitVec 32) ValueCell!13821))

(declare-fun mapKey!45416 () (_ BitVec 32))

(assert (=> mapNonEmpty!45416 (= (arr!36133 _values!996) (store mapRest!45416 mapKey!45416 mapValue!45416))))

(declare-fun bm!55915 () Bool)

(assert (=> bm!55915 (= call!55918 (getCurrentListMapNoExtraKeys!4750 (ite c!115638 lt!521263 _keys!1208) (ite c!115638 lt!521267 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159463 () Bool)

(assert (=> b!1159463 (= e!659325 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!55916 () Bool)

(assert (=> bm!55916 (= call!55919 (contains!6794 (ite c!115642 lt!521265 call!55914) k0!934))))

(declare-fun b!1159464 () Bool)

(assert (=> b!1159464 call!55915))

(declare-fun lt!521270 () Unit!38211)

(assert (=> b!1159464 (= lt!521270 call!55916)))

(assert (=> b!1159464 (= e!659334 lt!521270)))

(declare-fun bm!55917 () Bool)

(assert (=> bm!55917 (= call!55915 call!55919)))

(declare-fun b!1159465 () Bool)

(assert (=> b!1159465 (= c!115640 (and (not lt!521277) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1159465 (= e!659324 e!659331)))

(declare-fun b!1159466 () Bool)

(assert (=> b!1159466 (= e!659326 (not e!659339))))

(declare-fun res!769625 () Bool)

(assert (=> b!1159466 (=> res!769625 e!659339)))

(assert (=> b!1159466 (= res!769625 (bvsgt from!1455 i!673))))

(assert (=> b!1159466 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521258 () Unit!38211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74963 (_ BitVec 64) (_ BitVec 32)) Unit!38211)

(assert (=> b!1159466 (= lt!521258 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1159467 () Bool)

(declare-fun res!769620 () Bool)

(assert (=> b!1159467 (=> (not res!769620) (not e!659333))))

(assert (=> b!1159467 (= res!769620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45416 () Bool)

(assert (=> mapIsEmpty!45416 mapRes!45416))

(declare-fun bm!55918 () Bool)

(assert (=> bm!55918 (= call!55917 (+!3693 lt!521276 (ite (or c!115642 c!115640) (tuple2!18573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and start!98926 res!769615) b!1159455))

(assert (= (and b!1159455 res!769621) b!1159456))

(assert (= (and b!1159456 res!769619) b!1159467))

(assert (= (and b!1159467 res!769620) b!1159451))

(assert (= (and b!1159451 res!769616) b!1159441))

(assert (= (and b!1159441 res!769622) b!1159457))

(assert (= (and b!1159457 res!769626) b!1159449))

(assert (= (and b!1159449 res!769628) b!1159442))

(assert (= (and b!1159442 res!769624) b!1159458))

(assert (= (and b!1159458 res!769614) b!1159466))

(assert (= (and b!1159466 (not res!769625)) b!1159460))

(assert (= (and b!1159460 (not res!769617)) b!1159445))

(assert (= (and b!1159445 c!115638) b!1159443))

(assert (= (and b!1159445 (not c!115638)) b!1159438))

(assert (= (or b!1159443 b!1159438) bm!55911))

(assert (= (or b!1159443 b!1159438) bm!55915))

(assert (= (and b!1159445 (not res!769627)) b!1159446))

(assert (= (and b!1159446 c!115639) b!1159440))

(assert (= (and b!1159446 (not c!115639)) b!1159454))

(assert (= (and b!1159440 c!115642) b!1159448))

(assert (= (and b!1159440 (not c!115642)) b!1159465))

(assert (= (and b!1159465 c!115640) b!1159462))

(assert (= (and b!1159465 (not c!115640)) b!1159461))

(assert (= (and b!1159461 c!115641) b!1159464))

(assert (= (and b!1159461 (not c!115641)) b!1159450))

(assert (= (or b!1159462 b!1159464) bm!55914))

(assert (= (or b!1159462 b!1159464) bm!55912))

(assert (= (or b!1159462 b!1159464) bm!55917))

(assert (= (or b!1159448 bm!55917) bm!55916))

(assert (= (or b!1159448 bm!55914) bm!55913))

(assert (= (or b!1159448 bm!55912) bm!55918))

(assert (= (and b!1159440 c!115637) b!1159463))

(assert (= (and b!1159440 (not c!115637)) b!1159453))

(assert (= (and b!1159440 res!769623) b!1159444))

(assert (= (and b!1159446 res!769618) b!1159447))

(assert (= (and b!1159459 condMapEmpty!45416) mapIsEmpty!45416))

(assert (= (and b!1159459 (not condMapEmpty!45416)) mapNonEmpty!45416))

(get-info :version)

(assert (= (and mapNonEmpty!45416 ((_ is ValueCellFull!13821) mapValue!45416)) b!1159452))

(assert (= (and b!1159459 ((_ is ValueCellFull!13821) mapDefault!45416)) b!1159439))

(assert (= start!98926 b!1159459))

(declare-fun b_lambda!19637 () Bool)

(assert (=> (not b_lambda!19637) (not b!1159460)))

(declare-fun t!36832 () Bool)

(declare-fun tb!9343 () Bool)

(assert (=> (and start!98926 (= defaultEntry!1004 defaultEntry!1004) t!36832) tb!9343))

(declare-fun result!19251 () Bool)

(assert (=> tb!9343 (= result!19251 tp_is_empty!29061)))

(assert (=> b!1159460 t!36832))

(declare-fun b_and!39913 () Bool)

(assert (= b_and!39911 (and (=> t!36832 result!19251) b_and!39913)))

(declare-fun m!1068509 () Bool)

(assert (=> b!1159446 m!1068509))

(declare-fun m!1068511 () Bool)

(assert (=> b!1159446 m!1068511))

(declare-fun m!1068513 () Bool)

(assert (=> b!1159446 m!1068513))

(declare-fun m!1068515 () Bool)

(assert (=> b!1159446 m!1068515))

(declare-fun m!1068517 () Bool)

(assert (=> b!1159446 m!1068517))

(declare-fun m!1068519 () Bool)

(assert (=> b!1159446 m!1068519))

(assert (=> b!1159446 m!1068509))

(declare-fun m!1068521 () Bool)

(assert (=> b!1159446 m!1068521))

(assert (=> b!1159446 m!1068515))

(declare-fun m!1068523 () Bool)

(assert (=> b!1159446 m!1068523))

(declare-fun m!1068525 () Bool)

(assert (=> b!1159446 m!1068525))

(assert (=> b!1159446 m!1068509))

(assert (=> b!1159446 m!1068519))

(declare-fun m!1068527 () Bool)

(assert (=> b!1159458 m!1068527))

(assert (=> b!1159445 m!1068509))

(declare-fun m!1068529 () Bool)

(assert (=> b!1159445 m!1068529))

(declare-fun m!1068531 () Bool)

(assert (=> bm!55911 m!1068531))

(declare-fun m!1068533 () Bool)

(assert (=> b!1159460 m!1068533))

(declare-fun m!1068535 () Bool)

(assert (=> b!1159460 m!1068535))

(declare-fun m!1068537 () Bool)

(assert (=> b!1159460 m!1068537))

(declare-fun m!1068539 () Bool)

(assert (=> b!1159460 m!1068539))

(declare-fun m!1068541 () Bool)

(assert (=> b!1159457 m!1068541))

(declare-fun m!1068543 () Bool)

(assert (=> bm!55918 m!1068543))

(declare-fun m!1068545 () Bool)

(assert (=> b!1159455 m!1068545))

(declare-fun m!1068547 () Bool)

(assert (=> start!98926 m!1068547))

(declare-fun m!1068549 () Bool)

(assert (=> start!98926 m!1068549))

(declare-fun m!1068551 () Bool)

(assert (=> b!1159449 m!1068551))

(declare-fun m!1068553 () Bool)

(assert (=> b!1159444 m!1068553))

(declare-fun m!1068555 () Bool)

(assert (=> b!1159467 m!1068555))

(declare-fun m!1068557 () Bool)

(assert (=> b!1159447 m!1068557))

(declare-fun m!1068559 () Bool)

(assert (=> mapNonEmpty!45416 m!1068559))

(assert (=> b!1159463 m!1068553))

(declare-fun m!1068561 () Bool)

(assert (=> b!1159448 m!1068561))

(assert (=> b!1159448 m!1068561))

(declare-fun m!1068563 () Bool)

(assert (=> b!1159448 m!1068563))

(declare-fun m!1068565 () Bool)

(assert (=> b!1159448 m!1068565))

(declare-fun m!1068567 () Bool)

(assert (=> bm!55915 m!1068567))

(declare-fun m!1068569 () Bool)

(assert (=> bm!55913 m!1068569))

(declare-fun m!1068571 () Bool)

(assert (=> b!1159442 m!1068571))

(declare-fun m!1068573 () Bool)

(assert (=> b!1159442 m!1068573))

(declare-fun m!1068575 () Bool)

(assert (=> b!1159440 m!1068575))

(declare-fun m!1068577 () Bool)

(assert (=> b!1159440 m!1068577))

(declare-fun m!1068579 () Bool)

(assert (=> b!1159440 m!1068579))

(declare-fun m!1068581 () Bool)

(assert (=> b!1159440 m!1068581))

(declare-fun m!1068583 () Bool)

(assert (=> b!1159443 m!1068583))

(declare-fun m!1068585 () Bool)

(assert (=> b!1159451 m!1068585))

(declare-fun m!1068587 () Bool)

(assert (=> b!1159466 m!1068587))

(declare-fun m!1068589 () Bool)

(assert (=> b!1159466 m!1068589))

(declare-fun m!1068591 () Bool)

(assert (=> bm!55916 m!1068591))

(check-sat b_and!39913 (not b!1159447) (not b!1159440) (not b!1159445) (not b!1159463) (not b!1159442) (not b!1159457) tp_is_empty!29061 (not b!1159460) (not b_lambda!19637) (not b!1159451) (not b!1159444) (not bm!55915) (not bm!55918) (not bm!55913) (not bm!55911) (not b!1159448) (not b_next!24531) (not bm!55916) (not mapNonEmpty!45416) (not b!1159443) (not b!1159466) (not b!1159446) (not start!98926) (not b!1159458) (not b!1159467) (not b!1159455))
(check-sat b_and!39913 (not b_next!24531))
