; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98870 () Bool)

(assert start!98870)

(declare-fun b_free!24481 () Bool)

(declare-fun b_next!24481 () Bool)

(assert (=> start!98870 (= b_free!24481 (not b_next!24481))))

(declare-fun tp!86153 () Bool)

(declare-fun b_and!39789 () Bool)

(assert (=> start!98870 (= tp!86153 b_and!39789)))

(declare-datatypes ((array!74784 0))(
  ( (array!74785 (arr!36043 (Array (_ BitVec 32) (_ BitVec 64))) (size!36581 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74784)

(declare-fun b!1157014 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!657977 () Bool)

(declare-fun arrayContainsKey!0 (array!74784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157014 (= e!657977 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157015 () Bool)

(declare-datatypes ((Unit!37963 0))(
  ( (Unit!37964) )
))
(declare-fun e!657986 () Unit!37963)

(declare-fun Unit!37965 () Unit!37963)

(assert (=> b!1157015 (= e!657986 Unit!37965)))

(declare-fun b!1157016 () Bool)

(declare-fun res!768428 () Bool)

(declare-fun e!657973 () Bool)

(assert (=> b!1157016 (=> (not res!768428) (not e!657973))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157016 (= res!768428 (validMask!0 mask!1564))))

(declare-fun b!1157017 () Bool)

(declare-fun call!55291 () Bool)

(assert (=> b!1157017 call!55291))

(declare-fun lt!519431 () Unit!37963)

(declare-fun call!55293 () Unit!37963)

(assert (=> b!1157017 (= lt!519431 call!55293)))

(declare-fun e!657982 () Unit!37963)

(assert (=> b!1157017 (= e!657982 lt!519431)))

(declare-fun b!1157018 () Bool)

(declare-fun res!768427 () Bool)

(assert (=> b!1157018 (=> (not res!768427) (not e!657973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74784 (_ BitVec 32)) Bool)

(assert (=> b!1157018 (= res!768427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!55288 () Bool)

(declare-fun call!55297 () Unit!37963)

(assert (=> bm!55288 (= call!55293 call!55297)))

(declare-fun b!1157019 () Bool)

(declare-fun Unit!37966 () Unit!37963)

(assert (=> b!1157019 (= e!657982 Unit!37966)))

(declare-fun b!1157020 () Bool)

(declare-fun e!657975 () Bool)

(assert (=> b!1157020 (= e!657975 true)))

(declare-fun e!657981 () Bool)

(assert (=> b!1157020 e!657981))

(declare-fun res!768437 () Bool)

(assert (=> b!1157020 (=> (not res!768437) (not e!657981))))

(declare-datatypes ((V!43809 0))(
  ( (V!43810 (val!14562 Int)) )
))
(declare-datatypes ((tuple2!18608 0))(
  ( (tuple2!18609 (_1!9315 (_ BitVec 64)) (_2!9315 V!43809)) )
))
(declare-datatypes ((List!25336 0))(
  ( (Nil!25333) (Cons!25332 (h!26541 tuple2!18608) (t!36800 List!25336)) )
))
(declare-datatypes ((ListLongMap!16577 0))(
  ( (ListLongMap!16578 (toList!8304 List!25336)) )
))
(declare-fun lt!519415 () ListLongMap!16577)

(declare-fun lt!519418 () ListLongMap!16577)

(assert (=> b!1157020 (= res!768437 (= lt!519415 lt!519418))))

(declare-fun lt!519419 () ListLongMap!16577)

(declare-fun -!1361 (ListLongMap!16577 (_ BitVec 64)) ListLongMap!16577)

(assert (=> b!1157020 (= lt!519415 (-!1361 lt!519419 k0!934))))

(declare-fun lt!519427 () V!43809)

(declare-fun +!3713 (ListLongMap!16577 tuple2!18608) ListLongMap!16577)

(assert (=> b!1157020 (= (-!1361 (+!3713 lt!519418 (tuple2!18609 (select (arr!36043 _keys!1208) from!1455) lt!519427)) (select (arr!36043 _keys!1208) from!1455)) lt!519418)))

(declare-fun lt!519432 () Unit!37963)

(declare-fun addThenRemoveForNewKeyIsSame!214 (ListLongMap!16577 (_ BitVec 64) V!43809) Unit!37963)

(assert (=> b!1157020 (= lt!519432 (addThenRemoveForNewKeyIsSame!214 lt!519418 (select (arr!36043 _keys!1208) from!1455) lt!519427))))

(declare-datatypes ((ValueCell!13796 0))(
  ( (ValueCellFull!13796 (v!17198 V!43809)) (EmptyCell!13796) )
))
(declare-datatypes ((array!74786 0))(
  ( (array!74787 (arr!36044 (Array (_ BitVec 32) ValueCell!13796)) (size!36582 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74786)

(declare-fun lt!519425 () V!43809)

(declare-fun get!18388 (ValueCell!13796 V!43809) V!43809)

(assert (=> b!1157020 (= lt!519427 (get!18388 (select (arr!36044 _values!996) from!1455) lt!519425))))

(declare-fun lt!519420 () Unit!37963)

(assert (=> b!1157020 (= lt!519420 e!657986)))

(declare-fun c!115166 () Bool)

(declare-fun contains!6756 (ListLongMap!16577 (_ BitVec 64)) Bool)

(assert (=> b!1157020 (= c!115166 (contains!6756 lt!519418 k0!934))))

(declare-fun zeroValue!944 () V!43809)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43809)

(declare-fun getCurrentListMapNoExtraKeys!4784 (array!74784 array!74786 (_ BitVec 32) (_ BitVec 32) V!43809 V!43809 (_ BitVec 32) Int) ListLongMap!16577)

(assert (=> b!1157020 (= lt!519418 (getCurrentListMapNoExtraKeys!4784 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55289 () Bool)

(declare-fun call!55295 () Bool)

(assert (=> bm!55289 (= call!55291 call!55295)))

(declare-fun b!1157021 () Bool)

(declare-fun res!768429 () Bool)

(assert (=> b!1157021 (=> (not res!768429) (not e!657973))))

(assert (=> b!1157021 (= res!768429 (and (= (size!36582 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36581 _keys!1208) (size!36582 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157022 () Bool)

(declare-fun e!657984 () Bool)

(declare-fun e!657987 () Bool)

(assert (=> b!1157022 (= e!657984 e!657987)))

(declare-fun res!768436 () Bool)

(assert (=> b!1157022 (=> res!768436 e!657987)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157022 (= res!768436 (not (= from!1455 i!673)))))

(declare-fun lt!519428 () array!74784)

(declare-fun lt!519414 () ListLongMap!16577)

(declare-fun lt!519430 () array!74786)

(assert (=> b!1157022 (= lt!519414 (getCurrentListMapNoExtraKeys!4784 lt!519428 lt!519430 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1157022 (= lt!519430 (array!74787 (store (arr!36044 _values!996) i!673 (ValueCellFull!13796 lt!519425)) (size!36582 _values!996)))))

(declare-fun dynLambda!2739 (Int (_ BitVec 64)) V!43809)

(assert (=> b!1157022 (= lt!519425 (dynLambda!2739 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1157022 (= lt!519419 (getCurrentListMapNoExtraKeys!4784 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1157023 () Bool)

(declare-fun c!115165 () Bool)

(declare-fun lt!519423 () Bool)

(assert (=> b!1157023 (= c!115165 (and (not lt!519423) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657972 () Unit!37963)

(declare-fun e!657979 () Unit!37963)

(assert (=> b!1157023 (= e!657972 e!657979)))

(declare-fun call!55294 () ListLongMap!16577)

(declare-fun call!55292 () ListLongMap!16577)

(declare-fun b!1157024 () Bool)

(declare-fun e!657985 () Bool)

(assert (=> b!1157024 (= e!657985 (= call!55294 (-!1361 call!55292 k0!934)))))

(declare-fun res!768433 () Bool)

(assert (=> start!98870 (=> (not res!768433) (not e!657973))))

(assert (=> start!98870 (= res!768433 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36581 _keys!1208))))))

(assert (=> start!98870 e!657973))

(declare-fun tp_is_empty!29011 () Bool)

(assert (=> start!98870 tp_is_empty!29011))

(declare-fun array_inv!27698 (array!74784) Bool)

(assert (=> start!98870 (array_inv!27698 _keys!1208)))

(assert (=> start!98870 true))

(assert (=> start!98870 tp!86153))

(declare-fun e!657983 () Bool)

(declare-fun array_inv!27699 (array!74786) Bool)

(assert (=> start!98870 (and (array_inv!27699 _values!996) e!657983)))

(declare-fun b!1157025 () Bool)

(declare-fun e!657980 () Bool)

(declare-fun mapRes!45341 () Bool)

(assert (=> b!1157025 (= e!657983 (and e!657980 mapRes!45341))))

(declare-fun condMapEmpty!45341 () Bool)

(declare-fun mapDefault!45341 () ValueCell!13796)

(assert (=> b!1157025 (= condMapEmpty!45341 (= (arr!36044 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13796)) mapDefault!45341)))))

(declare-fun b!1157026 () Bool)

(declare-fun e!657974 () Bool)

(assert (=> b!1157026 (= e!657973 e!657974)))

(declare-fun res!768424 () Bool)

(assert (=> b!1157026 (=> (not res!768424) (not e!657974))))

(assert (=> b!1157026 (= res!768424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519428 mask!1564))))

(assert (=> b!1157026 (= lt!519428 (array!74785 (store (arr!36043 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36581 _keys!1208)))))

(declare-fun b!1157027 () Bool)

(declare-fun e!657978 () Bool)

(assert (=> b!1157027 (= e!657978 tp_is_empty!29011)))

(declare-fun b!1157028 () Bool)

(assert (=> b!1157028 (= e!657974 (not e!657984))))

(declare-fun res!768432 () Bool)

(assert (=> b!1157028 (=> res!768432 e!657984)))

(assert (=> b!1157028 (= res!768432 (bvsgt from!1455 i!673))))

(assert (=> b!1157028 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519417 () Unit!37963)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74784 (_ BitVec 64) (_ BitVec 32)) Unit!37963)

(assert (=> b!1157028 (= lt!519417 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!55290 () Bool)

(assert (=> bm!55290 (= call!55292 (getCurrentListMapNoExtraKeys!4784 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!657976 () Bool)

(declare-fun b!1157029 () Bool)

(assert (=> b!1157029 (= e!657976 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519423) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1157030 () Bool)

(assert (=> b!1157030 (= e!657985 (= call!55294 call!55292))))

(declare-fun b!1157031 () Bool)

(assert (=> b!1157031 (= e!657976 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157032 () Bool)

(declare-fun Unit!37967 () Unit!37963)

(assert (=> b!1157032 (= e!657986 Unit!37967)))

(assert (=> b!1157032 (= lt!519423 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115163 () Bool)

(assert (=> b!1157032 (= c!115163 (and (not lt!519423) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519416 () Unit!37963)

(assert (=> b!1157032 (= lt!519416 e!657972)))

(declare-fun lt!519421 () Unit!37963)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!506 (array!74784 array!74786 (_ BitVec 32) (_ BitVec 32) V!43809 V!43809 (_ BitVec 64) (_ BitVec 32) Int) Unit!37963)

(assert (=> b!1157032 (= lt!519421 (lemmaListMapContainsThenArrayContainsFrom!506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115162 () Bool)

(assert (=> b!1157032 (= c!115162 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768435 () Bool)

(assert (=> b!1157032 (= res!768435 e!657976)))

(assert (=> b!1157032 (=> (not res!768435) (not e!657977))))

(assert (=> b!1157032 e!657977))

(declare-fun lt!519426 () Unit!37963)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74784 (_ BitVec 32) (_ BitVec 32)) Unit!37963)

(assert (=> b!1157032 (= lt!519426 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25337 0))(
  ( (Nil!25334) (Cons!25333 (h!26542 (_ BitVec 64)) (t!36801 List!25337)) )
))
(declare-fun arrayNoDuplicates!0 (array!74784 (_ BitVec 32) List!25337) Bool)

(assert (=> b!1157032 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25334)))

(declare-fun lt!519433 () Unit!37963)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74784 (_ BitVec 64) (_ BitVec 32) List!25337) Unit!37963)

(assert (=> b!1157032 (= lt!519433 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25334))))

(assert (=> b!1157032 false))

(declare-fun mapNonEmpty!45341 () Bool)

(declare-fun tp!86154 () Bool)

(assert (=> mapNonEmpty!45341 (= mapRes!45341 (and tp!86154 e!657978))))

(declare-fun mapValue!45341 () ValueCell!13796)

(declare-fun mapRest!45341 () (Array (_ BitVec 32) ValueCell!13796))

(declare-fun mapKey!45341 () (_ BitVec 32))

(assert (=> mapNonEmpty!45341 (= (arr!36044 _values!996) (store mapRest!45341 mapKey!45341 mapValue!45341))))

(declare-fun b!1157033 () Bool)

(assert (=> b!1157033 (= e!657987 e!657975)))

(declare-fun res!768434 () Bool)

(assert (=> b!1157033 (=> res!768434 e!657975)))

(assert (=> b!1157033 (= res!768434 (not (= (select (arr!36043 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1157033 e!657985))

(declare-fun c!115161 () Bool)

(assert (=> b!1157033 (= c!115161 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519435 () Unit!37963)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!633 (array!74784 array!74786 (_ BitVec 32) (_ BitVec 32) V!43809 V!43809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37963)

(assert (=> b!1157033 (= lt!519435 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!633 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157034 () Bool)

(assert (=> b!1157034 (= e!657980 tp_is_empty!29011)))

(declare-fun bm!55291 () Bool)

(declare-fun call!55296 () ListLongMap!16577)

(declare-fun call!55298 () ListLongMap!16577)

(assert (=> bm!55291 (= call!55296 call!55298)))

(declare-fun b!1157035 () Bool)

(assert (=> b!1157035 (= e!657979 e!657982)))

(declare-fun c!115164 () Bool)

(assert (=> b!1157035 (= c!115164 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519423))))

(declare-fun bm!55292 () Bool)

(assert (=> bm!55292 (= call!55294 (getCurrentListMapNoExtraKeys!4784 lt!519428 lt!519430 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157036 () Bool)

(declare-fun res!768423 () Bool)

(assert (=> b!1157036 (=> (not res!768423) (not e!657973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157036 (= res!768423 (validKeyInArray!0 k0!934))))

(declare-fun b!1157037 () Bool)

(declare-fun res!768430 () Bool)

(assert (=> b!1157037 (=> (not res!768430) (not e!657973))))

(assert (=> b!1157037 (= res!768430 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36581 _keys!1208))))))

(declare-fun b!1157038 () Bool)

(assert (=> b!1157038 (= e!657981 (= lt!519415 (getCurrentListMapNoExtraKeys!4784 lt!519428 lt!519430 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun lt!519424 () ListLongMap!16577)

(declare-fun bm!55293 () Bool)

(assert (=> bm!55293 (= call!55298 (+!3713 (ite c!115163 lt!519424 lt!519418) (ite c!115163 (tuple2!18609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115165 (tuple2!18609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1157039 () Bool)

(declare-fun res!768426 () Bool)

(assert (=> b!1157039 (=> (not res!768426) (not e!657974))))

(assert (=> b!1157039 (= res!768426 (arrayNoDuplicates!0 lt!519428 #b00000000000000000000000000000000 Nil!25334))))

(declare-fun mapIsEmpty!45341 () Bool)

(assert (=> mapIsEmpty!45341 mapRes!45341))

(declare-fun bm!55294 () Bool)

(assert (=> bm!55294 (= call!55295 (contains!6756 (ite c!115163 lt!519424 call!55296) k0!934))))

(declare-fun b!1157040 () Bool)

(declare-fun res!768431 () Bool)

(assert (=> b!1157040 (=> (not res!768431) (not e!657973))))

(assert (=> b!1157040 (= res!768431 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25334))))

(declare-fun b!1157041 () Bool)

(declare-fun res!768425 () Bool)

(assert (=> b!1157041 (=> (not res!768425) (not e!657973))))

(assert (=> b!1157041 (= res!768425 (= (select (arr!36043 _keys!1208) i!673) k0!934))))

(declare-fun b!1157042 () Bool)

(assert (=> b!1157042 (contains!6756 call!55298 k0!934)))

(declare-fun lt!519422 () Unit!37963)

(assert (=> b!1157042 (= lt!519422 call!55297)))

(assert (=> b!1157042 call!55295))

(assert (=> b!1157042 (= lt!519424 (+!3713 lt!519418 (tuple2!18609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!519434 () Unit!37963)

(declare-fun addStillContains!923 (ListLongMap!16577 (_ BitVec 64) V!43809 (_ BitVec 64)) Unit!37963)

(assert (=> b!1157042 (= lt!519434 (addStillContains!923 lt!519418 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1157042 (= e!657972 lt!519422)))

(declare-fun bm!55295 () Bool)

(assert (=> bm!55295 (= call!55297 (addStillContains!923 (ite c!115163 lt!519424 lt!519418) (ite c!115163 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115165 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115163 minValue!944 (ite c!115165 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1157043 () Bool)

(declare-fun lt!519429 () Unit!37963)

(assert (=> b!1157043 (= e!657979 lt!519429)))

(assert (=> b!1157043 (= lt!519429 call!55293)))

(assert (=> b!1157043 call!55291))

(assert (= (and start!98870 res!768433) b!1157016))

(assert (= (and b!1157016 res!768428) b!1157021))

(assert (= (and b!1157021 res!768429) b!1157018))

(assert (= (and b!1157018 res!768427) b!1157040))

(assert (= (and b!1157040 res!768431) b!1157037))

(assert (= (and b!1157037 res!768430) b!1157036))

(assert (= (and b!1157036 res!768423) b!1157041))

(assert (= (and b!1157041 res!768425) b!1157026))

(assert (= (and b!1157026 res!768424) b!1157039))

(assert (= (and b!1157039 res!768426) b!1157028))

(assert (= (and b!1157028 (not res!768432)) b!1157022))

(assert (= (and b!1157022 (not res!768436)) b!1157033))

(assert (= (and b!1157033 c!115161) b!1157024))

(assert (= (and b!1157033 (not c!115161)) b!1157030))

(assert (= (or b!1157024 b!1157030) bm!55292))

(assert (= (or b!1157024 b!1157030) bm!55290))

(assert (= (and b!1157033 (not res!768434)) b!1157020))

(assert (= (and b!1157020 c!115166) b!1157032))

(assert (= (and b!1157020 (not c!115166)) b!1157015))

(assert (= (and b!1157032 c!115163) b!1157042))

(assert (= (and b!1157032 (not c!115163)) b!1157023))

(assert (= (and b!1157023 c!115165) b!1157043))

(assert (= (and b!1157023 (not c!115165)) b!1157035))

(assert (= (and b!1157035 c!115164) b!1157017))

(assert (= (and b!1157035 (not c!115164)) b!1157019))

(assert (= (or b!1157043 b!1157017) bm!55288))

(assert (= (or b!1157043 b!1157017) bm!55291))

(assert (= (or b!1157043 b!1157017) bm!55289))

(assert (= (or b!1157042 bm!55289) bm!55294))

(assert (= (or b!1157042 bm!55288) bm!55295))

(assert (= (or b!1157042 bm!55291) bm!55293))

(assert (= (and b!1157032 c!115162) b!1157031))

(assert (= (and b!1157032 (not c!115162)) b!1157029))

(assert (= (and b!1157032 res!768435) b!1157014))

(assert (= (and b!1157020 res!768437) b!1157038))

(assert (= (and b!1157025 condMapEmpty!45341) mapIsEmpty!45341))

(assert (= (and b!1157025 (not condMapEmpty!45341)) mapNonEmpty!45341))

(get-info :version)

(assert (= (and mapNonEmpty!45341 ((_ is ValueCellFull!13796) mapValue!45341)) b!1157027))

(assert (= (and b!1157025 ((_ is ValueCellFull!13796) mapDefault!45341)) b!1157034))

(assert (= start!98870 b!1157025))

(declare-fun b_lambda!19569 () Bool)

(assert (=> (not b_lambda!19569) (not b!1157022)))

(declare-fun t!36799 () Bool)

(declare-fun tb!9285 () Bool)

(assert (=> (and start!98870 (= defaultEntry!1004 defaultEntry!1004) t!36799) tb!9285))

(declare-fun result!19143 () Bool)

(assert (=> tb!9285 (= result!19143 tp_is_empty!29011)))

(assert (=> b!1157022 t!36799))

(declare-fun b_and!39791 () Bool)

(assert (= b_and!39789 (and (=> t!36799 result!19143) b_and!39791)))

(declare-fun m!1065915 () Bool)

(assert (=> b!1157028 m!1065915))

(declare-fun m!1065917 () Bool)

(assert (=> b!1157028 m!1065917))

(declare-fun m!1065919 () Bool)

(assert (=> bm!55290 m!1065919))

(declare-fun m!1065921 () Bool)

(assert (=> b!1157016 m!1065921))

(declare-fun m!1065923 () Bool)

(assert (=> b!1157033 m!1065923))

(declare-fun m!1065925 () Bool)

(assert (=> b!1157033 m!1065925))

(declare-fun m!1065927 () Bool)

(assert (=> b!1157022 m!1065927))

(declare-fun m!1065929 () Bool)

(assert (=> b!1157022 m!1065929))

(declare-fun m!1065931 () Bool)

(assert (=> b!1157022 m!1065931))

(declare-fun m!1065933 () Bool)

(assert (=> b!1157022 m!1065933))

(declare-fun m!1065935 () Bool)

(assert (=> mapNonEmpty!45341 m!1065935))

(assert (=> b!1157020 m!1065919))

(declare-fun m!1065937 () Bool)

(assert (=> b!1157020 m!1065937))

(declare-fun m!1065939 () Bool)

(assert (=> b!1157020 m!1065939))

(assert (=> b!1157020 m!1065923))

(declare-fun m!1065941 () Bool)

(assert (=> b!1157020 m!1065941))

(declare-fun m!1065943 () Bool)

(assert (=> b!1157020 m!1065943))

(assert (=> b!1157020 m!1065937))

(declare-fun m!1065945 () Bool)

(assert (=> b!1157020 m!1065945))

(assert (=> b!1157020 m!1065939))

(assert (=> b!1157020 m!1065923))

(declare-fun m!1065947 () Bool)

(assert (=> b!1157020 m!1065947))

(assert (=> b!1157020 m!1065923))

(declare-fun m!1065949 () Bool)

(assert (=> b!1157020 m!1065949))

(declare-fun m!1065951 () Bool)

(assert (=> b!1157031 m!1065951))

(declare-fun m!1065953 () Bool)

(assert (=> bm!55294 m!1065953))

(assert (=> b!1157014 m!1065951))

(declare-fun m!1065955 () Bool)

(assert (=> start!98870 m!1065955))

(declare-fun m!1065957 () Bool)

(assert (=> start!98870 m!1065957))

(declare-fun m!1065959 () Bool)

(assert (=> b!1157024 m!1065959))

(declare-fun m!1065961 () Bool)

(assert (=> b!1157018 m!1065961))

(declare-fun m!1065963 () Bool)

(assert (=> b!1157032 m!1065963))

(declare-fun m!1065965 () Bool)

(assert (=> b!1157032 m!1065965))

(declare-fun m!1065967 () Bool)

(assert (=> b!1157032 m!1065967))

(declare-fun m!1065969 () Bool)

(assert (=> b!1157032 m!1065969))

(declare-fun m!1065971 () Bool)

(assert (=> b!1157040 m!1065971))

(declare-fun m!1065973 () Bool)

(assert (=> b!1157041 m!1065973))

(declare-fun m!1065975 () Bool)

(assert (=> bm!55292 m!1065975))

(declare-fun m!1065977 () Bool)

(assert (=> bm!55295 m!1065977))

(declare-fun m!1065979 () Bool)

(assert (=> bm!55293 m!1065979))

(assert (=> b!1157038 m!1065975))

(declare-fun m!1065981 () Bool)

(assert (=> b!1157039 m!1065981))

(declare-fun m!1065983 () Bool)

(assert (=> b!1157026 m!1065983))

(declare-fun m!1065985 () Bool)

(assert (=> b!1157026 m!1065985))

(declare-fun m!1065987 () Bool)

(assert (=> b!1157042 m!1065987))

(declare-fun m!1065989 () Bool)

(assert (=> b!1157042 m!1065989))

(declare-fun m!1065991 () Bool)

(assert (=> b!1157042 m!1065991))

(declare-fun m!1065993 () Bool)

(assert (=> b!1157036 m!1065993))

(check-sat (not b!1157038) (not b!1157042) (not b!1157036) (not b!1157028) (not b!1157031) (not b!1157022) (not b_lambda!19569) tp_is_empty!29011 (not b!1157033) (not b!1157040) (not bm!55295) b_and!39791 (not b!1157018) (not mapNonEmpty!45341) (not b!1157032) (not b!1157039) (not b!1157026) (not bm!55290) (not b!1157016) (not b!1157014) (not b_next!24481) (not bm!55294) (not start!98870) (not b!1157020) (not b!1157024) (not bm!55292) (not bm!55293))
(check-sat b_and!39791 (not b_next!24481))
