; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98612 () Bool)

(assert start!98612)

(declare-fun b_free!24223 () Bool)

(declare-fun b_next!24223 () Bool)

(assert (=> start!98612 (= b_free!24223 (not b_next!24223))))

(declare-fun tp!85379 () Bool)

(declare-fun b_and!39273 () Bool)

(assert (=> start!98612 (= tp!85379 b_and!39273)))

(declare-fun bm!52192 () Bool)

(declare-datatypes ((V!43465 0))(
  ( (V!43466 (val!14433 Int)) )
))
(declare-datatypes ((tuple2!18368 0))(
  ( (tuple2!18369 (_1!9195 (_ BitVec 64)) (_2!9195 V!43465)) )
))
(declare-datatypes ((List!25105 0))(
  ( (Nil!25102) (Cons!25101 (h!26310 tuple2!18368) (t!36311 List!25105)) )
))
(declare-datatypes ((ListLongMap!16337 0))(
  ( (ListLongMap!16338 (toList!8184 List!25105)) )
))
(declare-fun call!52198 () ListLongMap!16337)

(declare-fun call!52196 () ListLongMap!16337)

(assert (=> bm!52192 (= call!52198 call!52196)))

(declare-fun b!1145146 () Bool)

(declare-datatypes ((Unit!37450 0))(
  ( (Unit!37451) )
))
(declare-fun e!651396 () Unit!37450)

(declare-fun lt!511035 () Unit!37450)

(assert (=> b!1145146 (= e!651396 lt!511035)))

(declare-fun call!52199 () Unit!37450)

(assert (=> b!1145146 (= lt!511035 call!52199)))

(declare-fun call!52202 () Bool)

(assert (=> b!1145146 call!52202))

(declare-fun b!1145147 () Bool)

(declare-fun e!651392 () Bool)

(assert (=> b!1145147 (= e!651392 true)))

(declare-fun e!651402 () Bool)

(assert (=> b!1145147 e!651402))

(declare-fun res!762621 () Bool)

(assert (=> b!1145147 (=> (not res!762621) (not e!651402))))

(declare-datatypes ((array!74278 0))(
  ( (array!74279 (arr!35790 (Array (_ BitVec 32) (_ BitVec 64))) (size!36328 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74278)

(declare-fun lt!511038 () V!43465)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!511032 () ListLongMap!16337)

(declare-fun -!1259 (ListLongMap!16337 (_ BitVec 64)) ListLongMap!16337)

(declare-fun +!3605 (ListLongMap!16337 tuple2!18368) ListLongMap!16337)

(assert (=> b!1145147 (= res!762621 (= (-!1259 (+!3605 lt!511032 (tuple2!18369 (select (arr!35790 _keys!1208) from!1455) lt!511038)) (select (arr!35790 _keys!1208) from!1455)) lt!511032))))

(declare-fun lt!511026 () Unit!37450)

(declare-fun addThenRemoveForNewKeyIsSame!122 (ListLongMap!16337 (_ BitVec 64) V!43465) Unit!37450)

(assert (=> b!1145147 (= lt!511026 (addThenRemoveForNewKeyIsSame!122 lt!511032 (select (arr!35790 _keys!1208) from!1455) lt!511038))))

(declare-fun lt!511037 () V!43465)

(declare-datatypes ((ValueCell!13667 0))(
  ( (ValueCellFull!13667 (v!17069 V!43465)) (EmptyCell!13667) )
))
(declare-datatypes ((array!74280 0))(
  ( (array!74281 (arr!35791 (Array (_ BitVec 32) ValueCell!13667)) (size!36329 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74280)

(declare-fun get!18210 (ValueCell!13667 V!43465) V!43465)

(assert (=> b!1145147 (= lt!511038 (get!18210 (select (arr!35791 _values!996) from!1455) lt!511037))))

(declare-fun lt!511033 () Unit!37450)

(declare-fun e!651407 () Unit!37450)

(assert (=> b!1145147 (= lt!511033 e!651407)))

(declare-fun c!112841 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6649 (ListLongMap!16337 (_ BitVec 64)) Bool)

(assert (=> b!1145147 (= c!112841 (contains!6649 lt!511032 k0!934))))

(declare-fun zeroValue!944 () V!43465)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43465)

(declare-fun getCurrentListMapNoExtraKeys!4670 (array!74278 array!74280 (_ BitVec 32) (_ BitVec 32) V!43465 V!43465 (_ BitVec 32) Int) ListLongMap!16337)

(assert (=> b!1145147 (= lt!511032 (getCurrentListMapNoExtraKeys!4670 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145148 () Bool)

(declare-fun e!651408 () Unit!37450)

(assert (=> b!1145148 (= e!651396 e!651408)))

(declare-fun c!112844 () Bool)

(declare-fun lt!511025 () Bool)

(assert (=> b!1145148 (= c!112844 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511025))))

(declare-fun mapIsEmpty!44954 () Bool)

(declare-fun mapRes!44954 () Bool)

(assert (=> mapIsEmpty!44954 mapRes!44954))

(declare-fun bm!52193 () Bool)

(declare-fun c!112840 () Bool)

(declare-fun c!112839 () Bool)

(assert (=> bm!52193 (= call!52196 (+!3605 lt!511032 (ite (or c!112840 c!112839) (tuple2!18369 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1145149 () Bool)

(declare-fun e!651399 () Bool)

(declare-fun e!651403 () Bool)

(assert (=> b!1145149 (= e!651399 (not e!651403))))

(declare-fun res!762625 () Bool)

(assert (=> b!1145149 (=> res!762625 e!651403)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145149 (= res!762625 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145149 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511041 () Unit!37450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74278 (_ BitVec 64) (_ BitVec 32)) Unit!37450)

(assert (=> b!1145149 (= lt!511041 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1145150 () Bool)

(declare-fun e!651406 () Bool)

(assert (=> b!1145150 (= e!651406 e!651392)))

(declare-fun res!762632 () Bool)

(assert (=> b!1145150 (=> res!762632 e!651392)))

(assert (=> b!1145150 (= res!762632 (not (= (select (arr!35790 _keys!1208) from!1455) k0!934)))))

(declare-fun e!651400 () Bool)

(assert (=> b!1145150 e!651400))

(declare-fun c!112843 () Bool)

(assert (=> b!1145150 (= c!112843 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511031 () Unit!37450)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!539 (array!74278 array!74280 (_ BitVec 32) (_ BitVec 32) V!43465 V!43465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37450)

(assert (=> b!1145150 (= lt!511031 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!539 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145151 () Bool)

(declare-fun e!651393 () Bool)

(assert (=> b!1145151 (= e!651393 e!651399)))

(declare-fun res!762627 () Bool)

(assert (=> b!1145151 (=> (not res!762627) (not e!651399))))

(declare-fun lt!511036 () array!74278)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74278 (_ BitVec 32)) Bool)

(assert (=> b!1145151 (= res!762627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511036 mask!1564))))

(assert (=> b!1145151 (= lt!511036 (array!74279 (store (arr!35790 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36328 _keys!1208)))))

(declare-fun b!1145152 () Bool)

(declare-fun Unit!37452 () Unit!37450)

(assert (=> b!1145152 (= e!651407 Unit!37452)))

(assert (=> b!1145152 (= lt!511025 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1145152 (= c!112840 (and (not lt!511025) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511042 () Unit!37450)

(declare-fun e!651405 () Unit!37450)

(assert (=> b!1145152 (= lt!511042 e!651405)))

(declare-fun lt!511024 () Unit!37450)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!415 (array!74278 array!74280 (_ BitVec 32) (_ BitVec 32) V!43465 V!43465 (_ BitVec 64) (_ BitVec 32) Int) Unit!37450)

(assert (=> b!1145152 (= lt!511024 (lemmaListMapContainsThenArrayContainsFrom!415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112842 () Bool)

(assert (=> b!1145152 (= c!112842 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762626 () Bool)

(declare-fun e!651395 () Bool)

(assert (=> b!1145152 (= res!762626 e!651395)))

(declare-fun e!651397 () Bool)

(assert (=> b!1145152 (=> (not res!762626) (not e!651397))))

(assert (=> b!1145152 e!651397))

(declare-fun lt!511028 () Unit!37450)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74278 (_ BitVec 32) (_ BitVec 32)) Unit!37450)

(assert (=> b!1145152 (= lt!511028 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25106 0))(
  ( (Nil!25103) (Cons!25102 (h!26311 (_ BitVec 64)) (t!36312 List!25106)) )
))
(declare-fun arrayNoDuplicates!0 (array!74278 (_ BitVec 32) List!25106) Bool)

(assert (=> b!1145152 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25103)))

(declare-fun lt!511039 () Unit!37450)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74278 (_ BitVec 64) (_ BitVec 32) List!25106) Unit!37450)

(assert (=> b!1145152 (= lt!511039 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25103))))

(assert (=> b!1145152 false))

(declare-fun b!1145153 () Bool)

(declare-fun res!762631 () Bool)

(assert (=> b!1145153 (=> (not res!762631) (not e!651393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145153 (= res!762631 (validKeyInArray!0 k0!934))))

(declare-fun b!1145154 () Bool)

(declare-fun res!762623 () Bool)

(assert (=> b!1145154 (=> (not res!762623) (not e!651393))))

(assert (=> b!1145154 (= res!762623 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25103))))

(declare-fun bm!52194 () Bool)

(declare-fun call!52195 () Unit!37450)

(assert (=> bm!52194 (= call!52199 call!52195)))

(declare-fun lt!511027 () ListLongMap!16337)

(declare-fun call!52197 () Bool)

(declare-fun bm!52195 () Bool)

(assert (=> bm!52195 (= call!52197 (contains!6649 (ite c!112840 lt!511027 call!52198) k0!934))))

(declare-fun b!1145155 () Bool)

(declare-fun res!762619 () Bool)

(assert (=> b!1145155 (=> (not res!762619) (not e!651399))))

(assert (=> b!1145155 (= res!762619 (arrayNoDuplicates!0 lt!511036 #b00000000000000000000000000000000 Nil!25103))))

(declare-fun b!1145156 () Bool)

(declare-fun res!762629 () Bool)

(assert (=> b!1145156 (=> (not res!762629) (not e!651393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145156 (= res!762629 (validMask!0 mask!1564))))

(declare-fun b!1145157 () Bool)

(assert (=> b!1145157 (= e!651395 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511025) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1145158 () Bool)

(declare-fun Unit!37453 () Unit!37450)

(assert (=> b!1145158 (= e!651407 Unit!37453)))

(declare-fun res!762624 () Bool)

(assert (=> start!98612 (=> (not res!762624) (not e!651393))))

(assert (=> start!98612 (= res!762624 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36328 _keys!1208))))))

(assert (=> start!98612 e!651393))

(declare-fun tp_is_empty!28753 () Bool)

(assert (=> start!98612 tp_is_empty!28753))

(declare-fun array_inv!27504 (array!74278) Bool)

(assert (=> start!98612 (array_inv!27504 _keys!1208)))

(assert (=> start!98612 true))

(assert (=> start!98612 tp!85379))

(declare-fun e!651398 () Bool)

(declare-fun array_inv!27505 (array!74280) Bool)

(assert (=> start!98612 (and (array_inv!27505 _values!996) e!651398)))

(declare-fun b!1145159 () Bool)

(declare-fun res!762618 () Bool)

(assert (=> b!1145159 (=> (not res!762618) (not e!651393))))

(assert (=> b!1145159 (= res!762618 (and (= (size!36329 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36328 _keys!1208) (size!36329 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145160 () Bool)

(declare-fun e!651394 () Bool)

(assert (=> b!1145160 (= e!651398 (and e!651394 mapRes!44954))))

(declare-fun condMapEmpty!44954 () Bool)

(declare-fun mapDefault!44954 () ValueCell!13667)

(assert (=> b!1145160 (= condMapEmpty!44954 (= (arr!35791 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13667)) mapDefault!44954)))))

(declare-fun b!1145161 () Bool)

(assert (=> b!1145161 (= e!651397 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145162 () Bool)

(declare-fun res!762622 () Bool)

(assert (=> b!1145162 (=> (not res!762622) (not e!651393))))

(assert (=> b!1145162 (= res!762622 (= (select (arr!35790 _keys!1208) i!673) k0!934))))

(declare-fun b!1145163 () Bool)

(assert (=> b!1145163 call!52202))

(declare-fun lt!511043 () Unit!37450)

(assert (=> b!1145163 (= lt!511043 call!52199)))

(assert (=> b!1145163 (= e!651408 lt!511043)))

(declare-fun b!1145164 () Bool)

(declare-fun Unit!37454 () Unit!37450)

(assert (=> b!1145164 (= e!651408 Unit!37454)))

(declare-fun bm!52196 () Bool)

(assert (=> bm!52196 (= call!52202 call!52197)))

(declare-fun call!52201 () ListLongMap!16337)

(declare-fun b!1145165 () Bool)

(declare-fun call!52200 () ListLongMap!16337)

(assert (=> b!1145165 (= e!651400 (= call!52201 (-!1259 call!52200 k0!934)))))

(declare-fun b!1145166 () Bool)

(declare-fun lt!511044 () ListLongMap!16337)

(assert (=> b!1145166 (= e!651402 (= (-!1259 lt!511044 k0!934) lt!511032))))

(declare-fun b!1145167 () Bool)

(declare-fun e!651404 () Bool)

(assert (=> b!1145167 (= e!651404 tp_is_empty!28753)))

(declare-fun b!1145168 () Bool)

(assert (=> b!1145168 (= e!651400 (= call!52201 call!52200))))

(declare-fun b!1145169 () Bool)

(declare-fun res!762628 () Bool)

(assert (=> b!1145169 (=> (not res!762628) (not e!651393))))

(assert (=> b!1145169 (= res!762628 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36328 _keys!1208))))))

(declare-fun b!1145170 () Bool)

(assert (=> b!1145170 (= e!651403 e!651406)))

(declare-fun res!762620 () Bool)

(assert (=> b!1145170 (=> res!762620 e!651406)))

(assert (=> b!1145170 (= res!762620 (not (= from!1455 i!673)))))

(declare-fun lt!511029 () array!74280)

(declare-fun lt!511030 () ListLongMap!16337)

(assert (=> b!1145170 (= lt!511030 (getCurrentListMapNoExtraKeys!4670 lt!511036 lt!511029 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1145170 (= lt!511029 (array!74281 (store (arr!35791 _values!996) i!673 (ValueCellFull!13667 lt!511037)) (size!36329 _values!996)))))

(declare-fun dynLambda!2644 (Int (_ BitVec 64)) V!43465)

(assert (=> b!1145170 (= lt!511037 (dynLambda!2644 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1145170 (= lt!511044 (getCurrentListMapNoExtraKeys!4670 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44954 () Bool)

(declare-fun tp!85380 () Bool)

(assert (=> mapNonEmpty!44954 (= mapRes!44954 (and tp!85380 e!651404))))

(declare-fun mapKey!44954 () (_ BitVec 32))

(declare-fun mapRest!44954 () (Array (_ BitVec 32) ValueCell!13667))

(declare-fun mapValue!44954 () ValueCell!13667)

(assert (=> mapNonEmpty!44954 (= (arr!35791 _values!996) (store mapRest!44954 mapKey!44954 mapValue!44954))))

(declare-fun b!1145171 () Bool)

(assert (=> b!1145171 (= e!651394 tp_is_empty!28753)))

(declare-fun b!1145172 () Bool)

(assert (=> b!1145172 (= e!651395 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145173 () Bool)

(assert (=> b!1145173 (= c!112839 (and (not lt!511025) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1145173 (= e!651405 e!651396)))

(declare-fun bm!52197 () Bool)

(assert (=> bm!52197 (= call!52201 (getCurrentListMapNoExtraKeys!4670 lt!511036 lt!511029 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145174 () Bool)

(assert (=> b!1145174 (contains!6649 (+!3605 lt!511027 (tuple2!18369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!511040 () Unit!37450)

(assert (=> b!1145174 (= lt!511040 call!52195)))

(assert (=> b!1145174 call!52197))

(assert (=> b!1145174 (= lt!511027 call!52196)))

(declare-fun lt!511034 () Unit!37450)

(declare-fun addStillContains!818 (ListLongMap!16337 (_ BitVec 64) V!43465 (_ BitVec 64)) Unit!37450)

(assert (=> b!1145174 (= lt!511034 (addStillContains!818 lt!511032 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1145174 (= e!651405 lt!511040)))

(declare-fun bm!52198 () Bool)

(assert (=> bm!52198 (= call!52200 (getCurrentListMapNoExtraKeys!4670 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145175 () Bool)

(declare-fun res!762630 () Bool)

(assert (=> b!1145175 (=> (not res!762630) (not e!651393))))

(assert (=> b!1145175 (= res!762630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52199 () Bool)

(assert (=> bm!52199 (= call!52195 (addStillContains!818 (ite c!112840 lt!511027 lt!511032) (ite c!112840 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112839 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112840 minValue!944 (ite c!112839 zeroValue!944 minValue!944)) k0!934))))

(assert (= (and start!98612 res!762624) b!1145156))

(assert (= (and b!1145156 res!762629) b!1145159))

(assert (= (and b!1145159 res!762618) b!1145175))

(assert (= (and b!1145175 res!762630) b!1145154))

(assert (= (and b!1145154 res!762623) b!1145169))

(assert (= (and b!1145169 res!762628) b!1145153))

(assert (= (and b!1145153 res!762631) b!1145162))

(assert (= (and b!1145162 res!762622) b!1145151))

(assert (= (and b!1145151 res!762627) b!1145155))

(assert (= (and b!1145155 res!762619) b!1145149))

(assert (= (and b!1145149 (not res!762625)) b!1145170))

(assert (= (and b!1145170 (not res!762620)) b!1145150))

(assert (= (and b!1145150 c!112843) b!1145165))

(assert (= (and b!1145150 (not c!112843)) b!1145168))

(assert (= (or b!1145165 b!1145168) bm!52198))

(assert (= (or b!1145165 b!1145168) bm!52197))

(assert (= (and b!1145150 (not res!762632)) b!1145147))

(assert (= (and b!1145147 c!112841) b!1145152))

(assert (= (and b!1145147 (not c!112841)) b!1145158))

(assert (= (and b!1145152 c!112840) b!1145174))

(assert (= (and b!1145152 (not c!112840)) b!1145173))

(assert (= (and b!1145173 c!112839) b!1145146))

(assert (= (and b!1145173 (not c!112839)) b!1145148))

(assert (= (and b!1145148 c!112844) b!1145163))

(assert (= (and b!1145148 (not c!112844)) b!1145164))

(assert (= (or b!1145146 b!1145163) bm!52194))

(assert (= (or b!1145146 b!1145163) bm!52192))

(assert (= (or b!1145146 b!1145163) bm!52196))

(assert (= (or b!1145174 bm!52196) bm!52195))

(assert (= (or b!1145174 bm!52194) bm!52199))

(assert (= (or b!1145174 bm!52192) bm!52193))

(assert (= (and b!1145152 c!112842) b!1145172))

(assert (= (and b!1145152 (not c!112842)) b!1145157))

(assert (= (and b!1145152 res!762626) b!1145161))

(assert (= (and b!1145147 res!762621) b!1145166))

(assert (= (and b!1145160 condMapEmpty!44954) mapIsEmpty!44954))

(assert (= (and b!1145160 (not condMapEmpty!44954)) mapNonEmpty!44954))

(get-info :version)

(assert (= (and mapNonEmpty!44954 ((_ is ValueCellFull!13667) mapValue!44954)) b!1145167))

(assert (= (and b!1145160 ((_ is ValueCellFull!13667) mapDefault!44954)) b!1145171))

(assert (= start!98612 b!1145160))

(declare-fun b_lambda!19311 () Bool)

(assert (=> (not b_lambda!19311) (not b!1145170)))

(declare-fun t!36310 () Bool)

(declare-fun tb!9027 () Bool)

(assert (=> (and start!98612 (= defaultEntry!1004 defaultEntry!1004) t!36310) tb!9027))

(declare-fun result!18627 () Bool)

(assert (=> tb!9027 (= result!18627 tp_is_empty!28753)))

(assert (=> b!1145170 t!36310))

(declare-fun b_and!39275 () Bool)

(assert (= b_and!39273 (and (=> t!36310 result!18627) b_and!39275)))

(declare-fun m!1055579 () Bool)

(assert (=> b!1145151 m!1055579))

(declare-fun m!1055581 () Bool)

(assert (=> b!1145151 m!1055581))

(declare-fun m!1055583 () Bool)

(assert (=> b!1145154 m!1055583))

(declare-fun m!1055585 () Bool)

(assert (=> bm!52193 m!1055585))

(declare-fun m!1055587 () Bool)

(assert (=> b!1145153 m!1055587))

(declare-fun m!1055589 () Bool)

(assert (=> b!1145155 m!1055589))

(declare-fun m!1055591 () Bool)

(assert (=> bm!52198 m!1055591))

(declare-fun m!1055593 () Bool)

(assert (=> start!98612 m!1055593))

(declare-fun m!1055595 () Bool)

(assert (=> start!98612 m!1055595))

(assert (=> b!1145147 m!1055591))

(declare-fun m!1055597 () Bool)

(assert (=> b!1145147 m!1055597))

(declare-fun m!1055599 () Bool)

(assert (=> b!1145147 m!1055599))

(declare-fun m!1055601 () Bool)

(assert (=> b!1145147 m!1055601))

(declare-fun m!1055603 () Bool)

(assert (=> b!1145147 m!1055603))

(declare-fun m!1055605 () Bool)

(assert (=> b!1145147 m!1055605))

(assert (=> b!1145147 m!1055599))

(declare-fun m!1055607 () Bool)

(assert (=> b!1145147 m!1055607))

(assert (=> b!1145147 m!1055605))

(assert (=> b!1145147 m!1055601))

(declare-fun m!1055609 () Bool)

(assert (=> b!1145147 m!1055609))

(assert (=> b!1145147 m!1055601))

(declare-fun m!1055611 () Bool)

(assert (=> b!1145166 m!1055611))

(declare-fun m!1055613 () Bool)

(assert (=> b!1145165 m!1055613))

(declare-fun m!1055615 () Bool)

(assert (=> b!1145172 m!1055615))

(declare-fun m!1055617 () Bool)

(assert (=> mapNonEmpty!44954 m!1055617))

(declare-fun m!1055619 () Bool)

(assert (=> bm!52197 m!1055619))

(assert (=> b!1145150 m!1055601))

(declare-fun m!1055621 () Bool)

(assert (=> b!1145150 m!1055621))

(declare-fun m!1055623 () Bool)

(assert (=> b!1145152 m!1055623))

(declare-fun m!1055625 () Bool)

(assert (=> b!1145152 m!1055625))

(declare-fun m!1055627 () Bool)

(assert (=> b!1145152 m!1055627))

(declare-fun m!1055629 () Bool)

(assert (=> b!1145152 m!1055629))

(declare-fun m!1055631 () Bool)

(assert (=> bm!52199 m!1055631))

(declare-fun m!1055633 () Bool)

(assert (=> b!1145175 m!1055633))

(declare-fun m!1055635 () Bool)

(assert (=> b!1145174 m!1055635))

(assert (=> b!1145174 m!1055635))

(declare-fun m!1055637 () Bool)

(assert (=> b!1145174 m!1055637))

(declare-fun m!1055639 () Bool)

(assert (=> b!1145174 m!1055639))

(declare-fun m!1055641 () Bool)

(assert (=> b!1145170 m!1055641))

(declare-fun m!1055643 () Bool)

(assert (=> b!1145170 m!1055643))

(declare-fun m!1055645 () Bool)

(assert (=> b!1145170 m!1055645))

(declare-fun m!1055647 () Bool)

(assert (=> b!1145170 m!1055647))

(declare-fun m!1055649 () Bool)

(assert (=> b!1145149 m!1055649))

(declare-fun m!1055651 () Bool)

(assert (=> b!1145149 m!1055651))

(assert (=> b!1145161 m!1055615))

(declare-fun m!1055653 () Bool)

(assert (=> b!1145162 m!1055653))

(declare-fun m!1055655 () Bool)

(assert (=> bm!52195 m!1055655))

(declare-fun m!1055657 () Bool)

(assert (=> b!1145156 m!1055657))

(check-sat (not b!1145156) b_and!39275 (not b!1145155) (not bm!52197) (not b!1145166) (not start!98612) (not b!1145172) (not b!1145153) (not b!1145152) (not b!1145149) (not b!1145165) (not b!1145147) (not b!1145175) (not b!1145161) (not bm!52193) (not mapNonEmpty!44954) (not bm!52195) (not b!1145174) (not b!1145154) (not b_lambda!19311) (not b!1145150) tp_is_empty!28753 (not b!1145170) (not b!1145151) (not bm!52198) (not bm!52199) (not b_next!24223))
(check-sat b_and!39275 (not b_next!24223))
