; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98594 () Bool)

(assert start!98594)

(declare-fun b_free!24205 () Bool)

(declare-fun b_next!24205 () Bool)

(assert (=> start!98594 (= b_free!24205 (not b_next!24205))))

(declare-fun tp!85325 () Bool)

(declare-fun b_and!39237 () Bool)

(assert (=> start!98594 (= tp!85325 b_and!39237)))

(declare-fun b!1144318 () Bool)

(declare-fun e!650935 () Bool)

(declare-fun e!650948 () Bool)

(assert (=> b!1144318 (= e!650935 (not e!650948))))

(declare-fun res!762224 () Bool)

(assert (=> b!1144318 (=> res!762224 e!650948)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144318 (= res!762224 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74242 0))(
  ( (array!74243 (arr!35772 (Array (_ BitVec 32) (_ BitVec 64))) (size!36310 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74242)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144318 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37413 0))(
  ( (Unit!37414) )
))
(declare-fun lt!510465 () Unit!37413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74242 (_ BitVec 64) (_ BitVec 32)) Unit!37413)

(assert (=> b!1144318 (= lt!510465 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!762220 () Bool)

(declare-fun e!650949 () Bool)

(assert (=> start!98594 (=> (not res!762220) (not e!650949))))

(assert (=> start!98594 (= res!762220 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36310 _keys!1208))))))

(assert (=> start!98594 e!650949))

(declare-fun tp_is_empty!28735 () Bool)

(assert (=> start!98594 tp_is_empty!28735))

(declare-fun array_inv!27486 (array!74242) Bool)

(assert (=> start!98594 (array_inv!27486 _keys!1208)))

(assert (=> start!98594 true))

(assert (=> start!98594 tp!85325))

(declare-datatypes ((V!43441 0))(
  ( (V!43442 (val!14424 Int)) )
))
(declare-datatypes ((ValueCell!13658 0))(
  ( (ValueCellFull!13658 (v!17060 V!43441)) (EmptyCell!13658) )
))
(declare-datatypes ((array!74244 0))(
  ( (array!74245 (arr!35773 (Array (_ BitVec 32) ValueCell!13658)) (size!36311 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74244)

(declare-fun e!650941 () Bool)

(declare-fun array_inv!27487 (array!74244) Bool)

(assert (=> start!98594 (and (array_inv!27487 _values!996) e!650941)))

(declare-fun b!1144319 () Bool)

(declare-datatypes ((tuple2!18354 0))(
  ( (tuple2!18355 (_1!9188 (_ BitVec 64)) (_2!9188 V!43441)) )
))
(declare-datatypes ((List!25089 0))(
  ( (Nil!25086) (Cons!25085 (h!26294 tuple2!18354) (t!36277 List!25089)) )
))
(declare-datatypes ((ListLongMap!16323 0))(
  ( (ListLongMap!16324 (toList!8177 List!25089)) )
))
(declare-fun lt!510460 () ListLongMap!16323)

(declare-fun minValue!944 () V!43441)

(declare-fun contains!6643 (ListLongMap!16323 (_ BitVec 64)) Bool)

(declare-fun +!3598 (ListLongMap!16323 tuple2!18354) ListLongMap!16323)

(assert (=> b!1144319 (contains!6643 (+!3598 lt!510460 (tuple2!18355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!510470 () Unit!37413)

(declare-fun addStillContains!812 (ListLongMap!16323 (_ BitVec 64) V!43441 (_ BitVec 64)) Unit!37413)

(assert (=> b!1144319 (= lt!510470 (addStillContains!812 lt!510460 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!51983 () Bool)

(assert (=> b!1144319 call!51983))

(declare-fun call!51979 () ListLongMap!16323)

(assert (=> b!1144319 (= lt!510460 call!51979)))

(declare-fun lt!510467 () Unit!37413)

(declare-fun call!51984 () Unit!37413)

(assert (=> b!1144319 (= lt!510467 call!51984)))

(declare-fun e!650946 () Unit!37413)

(assert (=> b!1144319 (= e!650946 lt!510470)))

(declare-fun b!1144320 () Bool)

(declare-fun e!650939 () Bool)

(assert (=> b!1144320 (= e!650948 e!650939)))

(declare-fun res!762223 () Bool)

(assert (=> b!1144320 (=> res!762223 e!650939)))

(assert (=> b!1144320 (= res!762223 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43441)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!510457 () ListLongMap!16323)

(declare-fun lt!510458 () array!74242)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!510475 () array!74244)

(declare-fun getCurrentListMapNoExtraKeys!4665 (array!74242 array!74244 (_ BitVec 32) (_ BitVec 32) V!43441 V!43441 (_ BitVec 32) Int) ListLongMap!16323)

(assert (=> b!1144320 (= lt!510457 (getCurrentListMapNoExtraKeys!4665 lt!510458 lt!510475 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!510468 () V!43441)

(assert (=> b!1144320 (= lt!510475 (array!74245 (store (arr!35773 _values!996) i!673 (ValueCellFull!13658 lt!510468)) (size!36311 _values!996)))))

(declare-fun dynLambda!2640 (Int (_ BitVec 64)) V!43441)

(assert (=> b!1144320 (= lt!510468 (dynLambda!2640 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510476 () ListLongMap!16323)

(assert (=> b!1144320 (= lt!510476 (getCurrentListMapNoExtraKeys!4665 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!51976 () Bool)

(declare-fun lt!510464 () ListLongMap!16323)

(declare-fun c!112682 () Bool)

(declare-fun c!112679 () Bool)

(assert (=> bm!51976 (= call!51979 (+!3598 lt!510464 (ite (or c!112679 c!112682) (tuple2!18355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!51977 () Bool)

(declare-fun call!51986 () ListLongMap!16323)

(assert (=> bm!51977 (= call!51986 call!51979)))

(declare-fun b!1144321 () Bool)

(declare-fun e!650938 () Bool)

(declare-fun call!51981 () ListLongMap!16323)

(declare-fun call!51982 () ListLongMap!16323)

(assert (=> b!1144321 (= e!650938 (= call!51981 call!51982))))

(declare-fun b!1144322 () Bool)

(declare-fun e!650937 () Bool)

(assert (=> b!1144322 (= e!650937 true)))

(declare-fun e!650944 () Bool)

(assert (=> b!1144322 e!650944))

(declare-fun res!762219 () Bool)

(assert (=> b!1144322 (=> (not res!762219) (not e!650944))))

(declare-fun lt!510471 () V!43441)

(declare-fun -!1253 (ListLongMap!16323 (_ BitVec 64)) ListLongMap!16323)

(assert (=> b!1144322 (= res!762219 (= (-!1253 (+!3598 lt!510464 (tuple2!18355 (select (arr!35772 _keys!1208) from!1455) lt!510471)) (select (arr!35772 _keys!1208) from!1455)) lt!510464))))

(declare-fun lt!510461 () Unit!37413)

(declare-fun addThenRemoveForNewKeyIsSame!118 (ListLongMap!16323 (_ BitVec 64) V!43441) Unit!37413)

(assert (=> b!1144322 (= lt!510461 (addThenRemoveForNewKeyIsSame!118 lt!510464 (select (arr!35772 _keys!1208) from!1455) lt!510471))))

(declare-fun get!18200 (ValueCell!13658 V!43441) V!43441)

(assert (=> b!1144322 (= lt!510471 (get!18200 (select (arr!35773 _values!996) from!1455) lt!510468))))

(declare-fun lt!510469 () Unit!37413)

(declare-fun e!650943 () Unit!37413)

(assert (=> b!1144322 (= lt!510469 e!650943)))

(declare-fun c!112681 () Bool)

(assert (=> b!1144322 (= c!112681 (contains!6643 lt!510464 k0!934))))

(assert (=> b!1144322 (= lt!510464 (getCurrentListMapNoExtraKeys!4665 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144323 () Bool)

(declare-fun res!762217 () Bool)

(assert (=> b!1144323 (=> (not res!762217) (not e!650949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144323 (= res!762217 (validKeyInArray!0 k0!934))))

(declare-fun bm!51978 () Bool)

(assert (=> bm!51978 (= call!51982 (getCurrentListMapNoExtraKeys!4665 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144324 () Bool)

(declare-fun res!762227 () Bool)

(assert (=> b!1144324 (=> (not res!762227) (not e!650949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74242 (_ BitVec 32)) Bool)

(assert (=> b!1144324 (= res!762227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1144325 () Bool)

(declare-fun e!650936 () Bool)

(assert (=> b!1144325 (= e!650936 tp_is_empty!28735)))

(declare-fun b!1144326 () Bool)

(declare-fun e!650945 () Unit!37413)

(declare-fun lt!510466 () Unit!37413)

(assert (=> b!1144326 (= e!650945 lt!510466)))

(declare-fun call!51985 () Unit!37413)

(assert (=> b!1144326 (= lt!510466 call!51985)))

(declare-fun call!51980 () Bool)

(assert (=> b!1144326 call!51980))

(declare-fun lt!510473 () Bool)

(declare-fun e!650947 () Bool)

(declare-fun b!1144327 () Bool)

(assert (=> b!1144327 (= e!650947 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510473) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1144328 () Bool)

(declare-fun e!650940 () Bool)

(assert (=> b!1144328 (= e!650940 tp_is_empty!28735)))

(declare-fun b!1144329 () Bool)

(declare-fun e!650933 () Unit!37413)

(assert (=> b!1144329 (= e!650945 e!650933)))

(declare-fun c!112680 () Bool)

(assert (=> b!1144329 (= c!112680 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510473))))

(declare-fun b!1144330 () Bool)

(declare-fun res!762213 () Bool)

(assert (=> b!1144330 (=> (not res!762213) (not e!650949))))

(assert (=> b!1144330 (= res!762213 (and (= (size!36311 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36310 _keys!1208) (size!36311 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!51979 () Bool)

(assert (=> bm!51979 (= call!51984 (addStillContains!812 lt!510464 (ite (or c!112679 c!112682) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112679 c!112682) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1144331 () Bool)

(declare-fun res!762215 () Bool)

(assert (=> b!1144331 (=> (not res!762215) (not e!650935))))

(declare-datatypes ((List!25090 0))(
  ( (Nil!25087) (Cons!25086 (h!26295 (_ BitVec 64)) (t!36278 List!25090)) )
))
(declare-fun arrayNoDuplicates!0 (array!74242 (_ BitVec 32) List!25090) Bool)

(assert (=> b!1144331 (= res!762215 (arrayNoDuplicates!0 lt!510458 #b00000000000000000000000000000000 Nil!25087))))

(declare-fun e!650942 () Bool)

(declare-fun b!1144332 () Bool)

(assert (=> b!1144332 (= e!650942 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144333 () Bool)

(assert (=> b!1144333 (= e!650949 e!650935)))

(declare-fun res!762226 () Bool)

(assert (=> b!1144333 (=> (not res!762226) (not e!650935))))

(assert (=> b!1144333 (= res!762226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510458 mask!1564))))

(assert (=> b!1144333 (= lt!510458 (array!74243 (store (arr!35772 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36310 _keys!1208)))))

(declare-fun b!1144334 () Bool)

(assert (=> b!1144334 (= e!650939 e!650937)))

(declare-fun res!762214 () Bool)

(assert (=> b!1144334 (=> res!762214 e!650937)))

(assert (=> b!1144334 (= res!762214 (not (= (select (arr!35772 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1144334 e!650938))

(declare-fun c!112678 () Bool)

(assert (=> b!1144334 (= c!112678 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510463 () Unit!37413)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!532 (array!74242 array!74244 (_ BitVec 32) (_ BitVec 32) V!43441 V!43441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37413)

(assert (=> b!1144334 (= lt!510463 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144335 () Bool)

(declare-fun res!762225 () Bool)

(assert (=> b!1144335 (=> (not res!762225) (not e!650949))))

(assert (=> b!1144335 (= res!762225 (= (select (arr!35772 _keys!1208) i!673) k0!934))))

(declare-fun b!1144336 () Bool)

(declare-fun mapRes!44927 () Bool)

(assert (=> b!1144336 (= e!650941 (and e!650936 mapRes!44927))))

(declare-fun condMapEmpty!44927 () Bool)

(declare-fun mapDefault!44927 () ValueCell!13658)

(assert (=> b!1144336 (= condMapEmpty!44927 (= (arr!35773 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13658)) mapDefault!44927)))))

(declare-fun bm!51980 () Bool)

(assert (=> bm!51980 (= call!51985 call!51984)))

(declare-fun bm!51981 () Bool)

(assert (=> bm!51981 (= call!51983 (contains!6643 (ite c!112679 lt!510460 call!51986) k0!934))))

(declare-fun b!1144337 () Bool)

(assert (=> b!1144337 (= c!112682 (and (not lt!510473) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1144337 (= e!650946 e!650945)))

(declare-fun mapNonEmpty!44927 () Bool)

(declare-fun tp!85326 () Bool)

(assert (=> mapNonEmpty!44927 (= mapRes!44927 (and tp!85326 e!650940))))

(declare-fun mapKey!44927 () (_ BitVec 32))

(declare-fun mapRest!44927 () (Array (_ BitVec 32) ValueCell!13658))

(declare-fun mapValue!44927 () ValueCell!13658)

(assert (=> mapNonEmpty!44927 (= (arr!35773 _values!996) (store mapRest!44927 mapKey!44927 mapValue!44927))))

(declare-fun mapIsEmpty!44927 () Bool)

(assert (=> mapIsEmpty!44927 mapRes!44927))

(declare-fun bm!51982 () Bool)

(assert (=> bm!51982 (= call!51981 (getCurrentListMapNoExtraKeys!4665 lt!510458 lt!510475 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51983 () Bool)

(assert (=> bm!51983 (= call!51980 call!51983)))

(declare-fun b!1144338 () Bool)

(declare-fun Unit!37415 () Unit!37413)

(assert (=> b!1144338 (= e!650933 Unit!37415)))

(declare-fun b!1144339 () Bool)

(assert (=> b!1144339 (= e!650944 (= (-!1253 lt!510476 k0!934) lt!510464))))

(declare-fun b!1144340 () Bool)

(declare-fun res!762216 () Bool)

(assert (=> b!1144340 (=> (not res!762216) (not e!650949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144340 (= res!762216 (validMask!0 mask!1564))))

(declare-fun b!1144341 () Bool)

(declare-fun res!762221 () Bool)

(assert (=> b!1144341 (=> (not res!762221) (not e!650949))))

(assert (=> b!1144341 (= res!762221 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25087))))

(declare-fun b!1144342 () Bool)

(assert (=> b!1144342 call!51980))

(declare-fun lt!510474 () Unit!37413)

(assert (=> b!1144342 (= lt!510474 call!51985)))

(assert (=> b!1144342 (= e!650933 lt!510474)))

(declare-fun b!1144343 () Bool)

(declare-fun Unit!37416 () Unit!37413)

(assert (=> b!1144343 (= e!650943 Unit!37416)))

(assert (=> b!1144343 (= lt!510473 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1144343 (= c!112679 (and (not lt!510473) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510462 () Unit!37413)

(assert (=> b!1144343 (= lt!510462 e!650946)))

(declare-fun lt!510459 () Unit!37413)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!407 (array!74242 array!74244 (_ BitVec 32) (_ BitVec 32) V!43441 V!43441 (_ BitVec 64) (_ BitVec 32) Int) Unit!37413)

(assert (=> b!1144343 (= lt!510459 (lemmaListMapContainsThenArrayContainsFrom!407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112677 () Bool)

(assert (=> b!1144343 (= c!112677 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762222 () Bool)

(assert (=> b!1144343 (= res!762222 e!650947)))

(assert (=> b!1144343 (=> (not res!762222) (not e!650942))))

(assert (=> b!1144343 e!650942))

(declare-fun lt!510477 () Unit!37413)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74242 (_ BitVec 32) (_ BitVec 32)) Unit!37413)

(assert (=> b!1144343 (= lt!510477 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1144343 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25087)))

(declare-fun lt!510472 () Unit!37413)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74242 (_ BitVec 64) (_ BitVec 32) List!25090) Unit!37413)

(assert (=> b!1144343 (= lt!510472 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25087))))

(assert (=> b!1144343 false))

(declare-fun b!1144344 () Bool)

(declare-fun res!762218 () Bool)

(assert (=> b!1144344 (=> (not res!762218) (not e!650949))))

(assert (=> b!1144344 (= res!762218 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36310 _keys!1208))))))

(declare-fun b!1144345 () Bool)

(assert (=> b!1144345 (= e!650938 (= call!51981 (-!1253 call!51982 k0!934)))))

(declare-fun b!1144346 () Bool)

(declare-fun Unit!37417 () Unit!37413)

(assert (=> b!1144346 (= e!650943 Unit!37417)))

(declare-fun b!1144347 () Bool)

(assert (=> b!1144347 (= e!650947 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98594 res!762220) b!1144340))

(assert (= (and b!1144340 res!762216) b!1144330))

(assert (= (and b!1144330 res!762213) b!1144324))

(assert (= (and b!1144324 res!762227) b!1144341))

(assert (= (and b!1144341 res!762221) b!1144344))

(assert (= (and b!1144344 res!762218) b!1144323))

(assert (= (and b!1144323 res!762217) b!1144335))

(assert (= (and b!1144335 res!762225) b!1144333))

(assert (= (and b!1144333 res!762226) b!1144331))

(assert (= (and b!1144331 res!762215) b!1144318))

(assert (= (and b!1144318 (not res!762224)) b!1144320))

(assert (= (and b!1144320 (not res!762223)) b!1144334))

(assert (= (and b!1144334 c!112678) b!1144345))

(assert (= (and b!1144334 (not c!112678)) b!1144321))

(assert (= (or b!1144345 b!1144321) bm!51982))

(assert (= (or b!1144345 b!1144321) bm!51978))

(assert (= (and b!1144334 (not res!762214)) b!1144322))

(assert (= (and b!1144322 c!112681) b!1144343))

(assert (= (and b!1144322 (not c!112681)) b!1144346))

(assert (= (and b!1144343 c!112679) b!1144319))

(assert (= (and b!1144343 (not c!112679)) b!1144337))

(assert (= (and b!1144337 c!112682) b!1144326))

(assert (= (and b!1144337 (not c!112682)) b!1144329))

(assert (= (and b!1144329 c!112680) b!1144342))

(assert (= (and b!1144329 (not c!112680)) b!1144338))

(assert (= (or b!1144326 b!1144342) bm!51980))

(assert (= (or b!1144326 b!1144342) bm!51977))

(assert (= (or b!1144326 b!1144342) bm!51983))

(assert (= (or b!1144319 bm!51983) bm!51981))

(assert (= (or b!1144319 bm!51980) bm!51979))

(assert (= (or b!1144319 bm!51977) bm!51976))

(assert (= (and b!1144343 c!112677) b!1144347))

(assert (= (and b!1144343 (not c!112677)) b!1144327))

(assert (= (and b!1144343 res!762222) b!1144332))

(assert (= (and b!1144322 res!762219) b!1144339))

(assert (= (and b!1144336 condMapEmpty!44927) mapIsEmpty!44927))

(assert (= (and b!1144336 (not condMapEmpty!44927)) mapNonEmpty!44927))

(get-info :version)

(assert (= (and mapNonEmpty!44927 ((_ is ValueCellFull!13658) mapValue!44927)) b!1144328))

(assert (= (and b!1144336 ((_ is ValueCellFull!13658) mapDefault!44927)) b!1144325))

(assert (= start!98594 b!1144336))

(declare-fun b_lambda!19293 () Bool)

(assert (=> (not b_lambda!19293) (not b!1144320)))

(declare-fun t!36276 () Bool)

(declare-fun tb!9009 () Bool)

(assert (=> (and start!98594 (= defaultEntry!1004 defaultEntry!1004) t!36276) tb!9009))

(declare-fun result!18591 () Bool)

(assert (=> tb!9009 (= result!18591 tp_is_empty!28735)))

(assert (=> b!1144320 t!36276))

(declare-fun b_and!39239 () Bool)

(assert (= b_and!39237 (and (=> t!36276 result!18591) b_and!39239)))

(declare-fun m!1054859 () Bool)

(assert (=> b!1144341 m!1054859))

(declare-fun m!1054861 () Bool)

(assert (=> b!1144334 m!1054861))

(declare-fun m!1054863 () Bool)

(assert (=> b!1144334 m!1054863))

(declare-fun m!1054865 () Bool)

(assert (=> bm!51976 m!1054865))

(declare-fun m!1054867 () Bool)

(assert (=> bm!51979 m!1054867))

(declare-fun m!1054869 () Bool)

(assert (=> b!1144333 m!1054869))

(declare-fun m!1054871 () Bool)

(assert (=> b!1144333 m!1054871))

(declare-fun m!1054873 () Bool)

(assert (=> b!1144320 m!1054873))

(declare-fun m!1054875 () Bool)

(assert (=> b!1144320 m!1054875))

(declare-fun m!1054877 () Bool)

(assert (=> b!1144320 m!1054877))

(declare-fun m!1054879 () Bool)

(assert (=> b!1144320 m!1054879))

(declare-fun m!1054881 () Bool)

(assert (=> mapNonEmpty!44927 m!1054881))

(declare-fun m!1054883 () Bool)

(assert (=> bm!51978 m!1054883))

(declare-fun m!1054885 () Bool)

(assert (=> b!1144343 m!1054885))

(declare-fun m!1054887 () Bool)

(assert (=> b!1144343 m!1054887))

(declare-fun m!1054889 () Bool)

(assert (=> b!1144343 m!1054889))

(declare-fun m!1054891 () Bool)

(assert (=> b!1144343 m!1054891))

(declare-fun m!1054893 () Bool)

(assert (=> bm!51982 m!1054893))

(declare-fun m!1054895 () Bool)

(assert (=> start!98594 m!1054895))

(declare-fun m!1054897 () Bool)

(assert (=> start!98594 m!1054897))

(declare-fun m!1054899 () Bool)

(assert (=> b!1144318 m!1054899))

(declare-fun m!1054901 () Bool)

(assert (=> b!1144318 m!1054901))

(declare-fun m!1054903 () Bool)

(assert (=> b!1144332 m!1054903))

(declare-fun m!1054905 () Bool)

(assert (=> bm!51981 m!1054905))

(assert (=> b!1144347 m!1054903))

(declare-fun m!1054907 () Bool)

(assert (=> b!1144331 m!1054907))

(declare-fun m!1054909 () Bool)

(assert (=> b!1144335 m!1054909))

(declare-fun m!1054911 () Bool)

(assert (=> b!1144322 m!1054911))

(assert (=> b!1144322 m!1054911))

(declare-fun m!1054913 () Bool)

(assert (=> b!1144322 m!1054913))

(declare-fun m!1054915 () Bool)

(assert (=> b!1144322 m!1054915))

(assert (=> b!1144322 m!1054861))

(declare-fun m!1054917 () Bool)

(assert (=> b!1144322 m!1054917))

(assert (=> b!1144322 m!1054861))

(assert (=> b!1144322 m!1054915))

(assert (=> b!1144322 m!1054883))

(declare-fun m!1054919 () Bool)

(assert (=> b!1144322 m!1054919))

(assert (=> b!1144322 m!1054861))

(declare-fun m!1054921 () Bool)

(assert (=> b!1144322 m!1054921))

(declare-fun m!1054923 () Bool)

(assert (=> b!1144319 m!1054923))

(assert (=> b!1144319 m!1054923))

(declare-fun m!1054925 () Bool)

(assert (=> b!1144319 m!1054925))

(declare-fun m!1054927 () Bool)

(assert (=> b!1144319 m!1054927))

(declare-fun m!1054929 () Bool)

(assert (=> b!1144340 m!1054929))

(declare-fun m!1054931 () Bool)

(assert (=> b!1144323 m!1054931))

(declare-fun m!1054933 () Bool)

(assert (=> b!1144324 m!1054933))

(declare-fun m!1054935 () Bool)

(assert (=> b!1144339 m!1054935))

(declare-fun m!1054937 () Bool)

(assert (=> b!1144345 m!1054937))

(check-sat (not b!1144318) b_and!39239 (not b!1144331) (not b!1144322) (not b!1144333) (not mapNonEmpty!44927) (not bm!51981) (not bm!51982) (not b!1144343) (not b!1144332) (not b!1144319) (not b!1144345) (not bm!51978) (not b!1144320) tp_is_empty!28735 (not bm!51979) (not start!98594) (not b!1144347) (not b!1144341) (not b!1144323) (not b!1144340) (not b!1144334) (not b!1144324) (not bm!51976) (not b_next!24205) (not b_lambda!19293) (not b!1144339))
(check-sat b_and!39239 (not b_next!24205))
