; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98204 () Bool)

(assert start!98204)

(declare-fun b_free!23905 () Bool)

(declare-fun b_next!23905 () Bool)

(assert (=> start!98204 (= b_free!23905 (not b_next!23905))))

(declare-fun tp!84418 () Bool)

(declare-fun b_and!38593 () Bool)

(assert (=> start!98204 (= tp!84418 b_and!38593)))

(declare-datatypes ((V!43041 0))(
  ( (V!43042 (val!14274 Int)) )
))
(declare-datatypes ((tuple2!17982 0))(
  ( (tuple2!17983 (_1!9002 (_ BitVec 64)) (_2!9002 V!43041)) )
))
(declare-datatypes ((List!24746 0))(
  ( (Nil!24743) (Cons!24742 (h!25951 tuple2!17982) (t!35643 List!24746)) )
))
(declare-datatypes ((ListLongMap!15951 0))(
  ( (ListLongMap!15952 (toList!7991 List!24746)) )
))
(declare-fun call!48333 () ListLongMap!15951)

(declare-fun b!1130396 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!643328 () Bool)

(declare-fun call!48339 () ListLongMap!15951)

(declare-fun -!1170 (ListLongMap!15951 (_ BitVec 64)) ListLongMap!15951)

(assert (=> b!1130396 (= e!643328 (= call!48339 (-!1170 call!48333 k!934)))))

(declare-fun b!1130397 () Bool)

(declare-fun e!643330 () Bool)

(assert (=> b!1130397 (= e!643330 true)))

(declare-fun zeroValue!944 () V!43041)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13508 0))(
  ( (ValueCellFull!13508 (v!16907 V!43041)) (EmptyCell!13508) )
))
(declare-datatypes ((array!73727 0))(
  ( (array!73728 (arr!35516 (Array (_ BitVec 32) ValueCell!13508)) (size!36052 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73727)

(declare-fun minValue!944 () V!43041)

(declare-datatypes ((array!73729 0))(
  ( (array!73730 (arr!35517 (Array (_ BitVec 32) (_ BitVec 64))) (size!36053 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73729)

(declare-fun lt!501970 () Bool)

(declare-fun contains!6514 (ListLongMap!15951 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4424 (array!73729 array!73727 (_ BitVec 32) (_ BitVec 32) V!43041 V!43041 (_ BitVec 32) Int) ListLongMap!15951)

(assert (=> b!1130397 (= lt!501970 (contains!6514 (getCurrentListMap!4424 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1130398 () Bool)

(declare-fun res!755279 () Bool)

(declare-fun e!643324 () Bool)

(assert (=> b!1130398 (=> (not res!755279) (not e!643324))))

(declare-fun lt!501972 () array!73729)

(declare-datatypes ((List!24747 0))(
  ( (Nil!24744) (Cons!24743 (h!25952 (_ BitVec 64)) (t!35644 List!24747)) )
))
(declare-fun arrayNoDuplicates!0 (array!73729 (_ BitVec 32) List!24747) Bool)

(assert (=> b!1130398 (= res!755279 (arrayNoDuplicates!0 lt!501972 #b00000000000000000000000000000000 Nil!24744))))

(declare-fun bm!48330 () Bool)

(declare-fun call!48336 () ListLongMap!15951)

(declare-fun call!48340 () ListLongMap!15951)

(assert (=> bm!48330 (= call!48336 call!48340)))

(declare-fun bm!48331 () Bool)

(declare-fun c!110019 () Bool)

(declare-datatypes ((Unit!37031 0))(
  ( (Unit!37032) )
))
(declare-fun call!48335 () Unit!37031)

(declare-fun c!110017 () Bool)

(declare-fun lt!501971 () ListLongMap!15951)

(declare-fun addStillContains!703 (ListLongMap!15951 (_ BitVec 64) V!43041 (_ BitVec 64)) Unit!37031)

(assert (=> bm!48331 (= call!48335 (addStillContains!703 lt!501971 (ite (or c!110019 c!110017) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110019 c!110017) zeroValue!944 minValue!944) k!934))))

(declare-fun bm!48332 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4478 (array!73729 array!73727 (_ BitVec 32) (_ BitVec 32) V!43041 V!43041 (_ BitVec 32) Int) ListLongMap!15951)

(assert (=> bm!48332 (= call!48333 (getCurrentListMapNoExtraKeys!4478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130400 () Bool)

(declare-fun e!643322 () Unit!37031)

(declare-fun lt!501967 () Unit!37031)

(assert (=> b!1130400 (= e!643322 lt!501967)))

(declare-fun lt!501969 () Unit!37031)

(assert (=> b!1130400 (= lt!501969 call!48335)))

(declare-fun lt!501976 () ListLongMap!15951)

(assert (=> b!1130400 (= lt!501976 call!48340)))

(declare-fun call!48338 () Bool)

(assert (=> b!1130400 call!48338))

(assert (=> b!1130400 (= lt!501967 (addStillContains!703 lt!501976 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun +!3441 (ListLongMap!15951 tuple2!17982) ListLongMap!15951)

(assert (=> b!1130400 (contains!6514 (+!3441 lt!501976 (tuple2!17983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1130401 () Bool)

(assert (=> b!1130401 (= e!643328 (= call!48339 call!48333))))

(declare-fun b!1130402 () Bool)

(declare-fun e!643327 () Bool)

(assert (=> b!1130402 (= e!643327 e!643330)))

(declare-fun res!755293 () Bool)

(assert (=> b!1130402 (=> res!755293 e!643330)))

(assert (=> b!1130402 (= res!755293 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36053 _keys!1208))))))

(declare-fun lt!501964 () Unit!37031)

(assert (=> b!1130402 (= lt!501964 e!643322)))

(declare-fun lt!501963 () Bool)

(assert (=> b!1130402 (= c!110019 (and (not lt!501963) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130402 (= lt!501963 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130403 () Bool)

(declare-fun e!643321 () Unit!37031)

(declare-fun Unit!37033 () Unit!37031)

(assert (=> b!1130403 (= e!643321 Unit!37033)))

(declare-fun b!1130404 () Bool)

(declare-fun e!643326 () Bool)

(assert (=> b!1130404 (= e!643326 e!643324)))

(declare-fun res!755285 () Bool)

(assert (=> b!1130404 (=> (not res!755285) (not e!643324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73729 (_ BitVec 32)) Bool)

(assert (=> b!1130404 (= res!755285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501972 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130404 (= lt!501972 (array!73730 (store (arr!35517 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36053 _keys!1208)))))

(declare-fun b!1130405 () Bool)

(declare-fun res!755281 () Bool)

(assert (=> b!1130405 (=> (not res!755281) (not e!643326))))

(assert (=> b!1130405 (= res!755281 (= (select (arr!35517 _keys!1208) i!673) k!934))))

(declare-fun b!1130406 () Bool)

(declare-fun e!643331 () Bool)

(declare-fun tp_is_empty!28435 () Bool)

(assert (=> b!1130406 (= e!643331 tp_is_empty!28435)))

(declare-fun b!1130407 () Bool)

(declare-fun res!755284 () Bool)

(assert (=> b!1130407 (=> (not res!755284) (not e!643326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130407 (= res!755284 (validMask!0 mask!1564))))

(declare-fun b!1130408 () Bool)

(declare-fun res!755280 () Bool)

(assert (=> b!1130408 (=> (not res!755280) (not e!643326))))

(assert (=> b!1130408 (= res!755280 (and (= (size!36052 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36053 _keys!1208) (size!36052 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130409 () Bool)

(declare-fun call!48334 () Bool)

(assert (=> b!1130409 call!48334))

(declare-fun lt!501966 () Unit!37031)

(declare-fun call!48337 () Unit!37031)

(assert (=> b!1130409 (= lt!501966 call!48337)))

(declare-fun e!643319 () Unit!37031)

(assert (=> b!1130409 (= e!643319 lt!501966)))

(declare-fun bm!48333 () Bool)

(assert (=> bm!48333 (= call!48340 (+!3441 lt!501971 (ite (or c!110019 c!110017) (tuple2!17983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapNonEmpty!44470 () Bool)

(declare-fun mapRes!44470 () Bool)

(declare-fun tp!84419 () Bool)

(assert (=> mapNonEmpty!44470 (= mapRes!44470 (and tp!84419 e!643331))))

(declare-fun mapKey!44470 () (_ BitVec 32))

(declare-fun mapRest!44470 () (Array (_ BitVec 32) ValueCell!13508))

(declare-fun mapValue!44470 () ValueCell!13508)

(assert (=> mapNonEmpty!44470 (= (arr!35516 _values!996) (store mapRest!44470 mapKey!44470 mapValue!44470))))

(declare-fun b!1130410 () Bool)

(declare-fun res!755289 () Bool)

(assert (=> b!1130410 (=> (not res!755289) (not e!643326))))

(assert (=> b!1130410 (= res!755289 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36053 _keys!1208))))))

(declare-fun b!1130411 () Bool)

(assert (=> b!1130411 (= e!643322 e!643319)))

(assert (=> b!1130411 (= c!110017 (and (not lt!501963) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1130399 () Bool)

(declare-fun c!110016 () Bool)

(assert (=> b!1130399 (= c!110016 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501963))))

(assert (=> b!1130399 (= e!643319 e!643321)))

(declare-fun res!755292 () Bool)

(assert (=> start!98204 (=> (not res!755292) (not e!643326))))

(assert (=> start!98204 (= res!755292 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36053 _keys!1208))))))

(assert (=> start!98204 e!643326))

(assert (=> start!98204 tp_is_empty!28435))

(declare-fun array_inv!27246 (array!73729) Bool)

(assert (=> start!98204 (array_inv!27246 _keys!1208)))

(assert (=> start!98204 true))

(assert (=> start!98204 tp!84418))

(declare-fun e!643320 () Bool)

(declare-fun array_inv!27247 (array!73727) Bool)

(assert (=> start!98204 (and (array_inv!27247 _values!996) e!643320)))

(declare-fun lt!501973 () array!73727)

(declare-fun bm!48334 () Bool)

(assert (=> bm!48334 (= call!48339 (getCurrentListMapNoExtraKeys!4478 lt!501972 lt!501973 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48335 () Bool)

(assert (=> bm!48335 (= call!48337 call!48335)))

(declare-fun b!1130412 () Bool)

(declare-fun e!643329 () Bool)

(declare-fun e!643332 () Bool)

(assert (=> b!1130412 (= e!643329 e!643332)))

(declare-fun res!755287 () Bool)

(assert (=> b!1130412 (=> res!755287 e!643332)))

(assert (=> b!1130412 (= res!755287 (not (= from!1455 i!673)))))

(declare-fun lt!501975 () ListLongMap!15951)

(assert (=> b!1130412 (= lt!501975 (getCurrentListMapNoExtraKeys!4478 lt!501972 lt!501973 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2554 (Int (_ BitVec 64)) V!43041)

(assert (=> b!1130412 (= lt!501973 (array!73728 (store (arr!35516 _values!996) i!673 (ValueCellFull!13508 (dynLambda!2554 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36052 _values!996)))))

(declare-fun lt!501974 () ListLongMap!15951)

(assert (=> b!1130412 (= lt!501974 (getCurrentListMapNoExtraKeys!4478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130413 () Bool)

(declare-fun res!755290 () Bool)

(assert (=> b!1130413 (=> (not res!755290) (not e!643326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130413 (= res!755290 (validKeyInArray!0 k!934))))

(declare-fun bm!48336 () Bool)

(assert (=> bm!48336 (= call!48334 call!48338)))

(declare-fun b!1130414 () Bool)

(declare-fun res!755283 () Bool)

(assert (=> b!1130414 (=> (not res!755283) (not e!643326))))

(assert (=> b!1130414 (= res!755283 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24744))))

(declare-fun bm!48337 () Bool)

(assert (=> bm!48337 (= call!48338 (contains!6514 (ite c!110019 lt!501976 call!48336) k!934))))

(declare-fun b!1130415 () Bool)

(declare-fun lt!501968 () Unit!37031)

(assert (=> b!1130415 (= e!643321 lt!501968)))

(assert (=> b!1130415 (= lt!501968 call!48337)))

(assert (=> b!1130415 call!48334))

(declare-fun b!1130416 () Bool)

(declare-fun res!755286 () Bool)

(assert (=> b!1130416 (=> (not res!755286) (not e!643326))))

(assert (=> b!1130416 (= res!755286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130417 () Bool)

(assert (=> b!1130417 (= e!643324 (not e!643329))))

(declare-fun res!755282 () Bool)

(assert (=> b!1130417 (=> res!755282 e!643329)))

(assert (=> b!1130417 (= res!755282 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130417 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501977 () Unit!37031)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73729 (_ BitVec 64) (_ BitVec 32)) Unit!37031)

(assert (=> b!1130417 (= lt!501977 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1130418 () Bool)

(declare-fun e!643325 () Bool)

(assert (=> b!1130418 (= e!643325 e!643327)))

(declare-fun res!755288 () Bool)

(assert (=> b!1130418 (=> res!755288 e!643327)))

(assert (=> b!1130418 (= res!755288 (not (contains!6514 lt!501971 k!934)))))

(assert (=> b!1130418 (= lt!501971 (getCurrentListMapNoExtraKeys!4478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130419 () Bool)

(assert (=> b!1130419 (= e!643332 e!643325)))

(declare-fun res!755291 () Bool)

(assert (=> b!1130419 (=> res!755291 e!643325)))

(assert (=> b!1130419 (= res!755291 (not (= (select (arr!35517 _keys!1208) from!1455) k!934)))))

(assert (=> b!1130419 e!643328))

(declare-fun c!110018 () Bool)

(assert (=> b!1130419 (= c!110018 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501965 () Unit!37031)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!423 (array!73729 array!73727 (_ BitVec 32) (_ BitVec 32) V!43041 V!43041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37031)

(assert (=> b!1130419 (= lt!501965 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44470 () Bool)

(assert (=> mapIsEmpty!44470 mapRes!44470))

(declare-fun b!1130420 () Bool)

(declare-fun e!643323 () Bool)

(assert (=> b!1130420 (= e!643320 (and e!643323 mapRes!44470))))

(declare-fun condMapEmpty!44470 () Bool)

(declare-fun mapDefault!44470 () ValueCell!13508)

