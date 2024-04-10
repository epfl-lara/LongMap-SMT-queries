; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98456 () Bool)

(assert start!98456)

(declare-fun b_free!24061 () Bool)

(declare-fun b_next!24061 () Bool)

(assert (=> start!98456 (= b_free!24061 (not b_next!24061))))

(declare-fun tp!84893 () Bool)

(declare-fun b_and!38971 () Bool)

(assert (=> start!98456 (= tp!84893 b_and!38971)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!647559 () Bool)

(declare-fun b!1138023 () Bool)

(declare-fun lt!506240 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1138023 (= e!647559 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506240) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!43249 0))(
  ( (V!43250 (val!14352 Int)) )
))
(declare-fun zeroValue!944 () V!43249)

(declare-datatypes ((tuple2!18130 0))(
  ( (tuple2!18131 (_1!9076 (_ BitVec 64)) (_2!9076 V!43249)) )
))
(declare-datatypes ((List!24887 0))(
  ( (Nil!24884) (Cons!24883 (h!26092 tuple2!18130) (t!35940 List!24887)) )
))
(declare-datatypes ((ListLongMap!16099 0))(
  ( (ListLongMap!16100 (toList!8065 List!24887)) )
))
(declare-fun call!50281 () ListLongMap!16099)

(declare-datatypes ((array!74041 0))(
  ( (array!74042 (arr!35671 (Array (_ BitVec 32) (_ BitVec 64))) (size!36207 (_ BitVec 32))) )
))
(declare-fun lt!506250 () array!74041)

(declare-datatypes ((ValueCell!13586 0))(
  ( (ValueCellFull!13586 (v!16989 V!43249)) (EmptyCell!13586) )
))
(declare-datatypes ((array!74043 0))(
  ( (array!74044 (arr!35672 (Array (_ BitVec 32) ValueCell!13586)) (size!36208 (_ BitVec 32))) )
))
(declare-fun lt!506235 () array!74043)

(declare-fun bm!50271 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43249)

(declare-fun getCurrentListMapNoExtraKeys!4549 (array!74041 array!74043 (_ BitVec 32) (_ BitVec 32) V!43249 V!43249 (_ BitVec 32) Int) ListLongMap!16099)

(assert (=> bm!50271 (= call!50281 (getCurrentListMapNoExtraKeys!4549 lt!506250 lt!506235 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138024 () Bool)

(declare-fun res!759256 () Bool)

(declare-fun e!647556 () Bool)

(assert (=> b!1138024 (=> (not res!759256) (not e!647556))))

(declare-fun _keys!1208 () array!74041)

(declare-fun _values!996 () array!74043)

(assert (=> b!1138024 (= res!759256 (and (= (size!36208 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36207 _keys!1208) (size!36208 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138025 () Bool)

(declare-datatypes ((Unit!37280 0))(
  ( (Unit!37281) )
))
(declare-fun e!647555 () Unit!37280)

(declare-fun e!647547 () Unit!37280)

(assert (=> b!1138025 (= e!647555 e!647547)))

(declare-fun c!111408 () Bool)

(assert (=> b!1138025 (= c!111408 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506240))))

(declare-fun b!1138026 () Bool)

(declare-fun e!647551 () Bool)

(declare-fun e!647545 () Bool)

(assert (=> b!1138026 (= e!647551 (not e!647545))))

(declare-fun res!759248 () Bool)

(assert (=> b!1138026 (=> res!759248 e!647545)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138026 (= res!759248 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138026 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!506233 () Unit!37280)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74041 (_ BitVec 64) (_ BitVec 32)) Unit!37280)

(assert (=> b!1138026 (= lt!506233 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1138027 () Bool)

(declare-fun res!759246 () Bool)

(assert (=> b!1138027 (=> (not res!759246) (not e!647556))))

(assert (=> b!1138027 (= res!759246 (= (select (arr!35671 _keys!1208) i!673) k!934))))

(declare-fun b!1138028 () Bool)

(declare-fun Unit!37282 () Unit!37280)

(assert (=> b!1138028 (= e!647547 Unit!37282)))

(declare-fun lt!506246 () ListLongMap!16099)

(declare-fun bm!50272 () Bool)

(declare-fun call!50274 () ListLongMap!16099)

(declare-fun c!111407 () Bool)

(declare-fun c!111409 () Bool)

(declare-fun lt!506234 () ListLongMap!16099)

(declare-fun +!3500 (ListLongMap!16099 tuple2!18130) ListLongMap!16099)

(assert (=> bm!50272 (= call!50274 (+!3500 (ite c!111407 lt!506234 lt!506246) (ite c!111407 (tuple2!18131 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111409 (tuple2!18131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18131 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1138029 () Bool)

(declare-fun e!647544 () Unit!37280)

(declare-fun Unit!37283 () Unit!37280)

(assert (=> b!1138029 (= e!647544 Unit!37283)))

(assert (=> b!1138029 (= lt!506240 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1138029 (= c!111407 (and (not lt!506240) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506236 () Unit!37280)

(declare-fun e!647557 () Unit!37280)

(assert (=> b!1138029 (= lt!506236 e!647557)))

(declare-fun lt!506242 () Unit!37280)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!362 (array!74041 array!74043 (_ BitVec 32) (_ BitVec 32) V!43249 V!43249 (_ BitVec 64) (_ BitVec 32) Int) Unit!37280)

(assert (=> b!1138029 (= lt!506242 (lemmaListMapContainsThenArrayContainsFrom!362 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111411 () Bool)

(assert (=> b!1138029 (= c!111411 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759251 () Bool)

(assert (=> b!1138029 (= res!759251 e!647559)))

(declare-fun e!647558 () Bool)

(assert (=> b!1138029 (=> (not res!759251) (not e!647558))))

(assert (=> b!1138029 e!647558))

(declare-fun lt!506243 () Unit!37280)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74041 (_ BitVec 32) (_ BitVec 32)) Unit!37280)

(assert (=> b!1138029 (= lt!506243 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24888 0))(
  ( (Nil!24885) (Cons!24884 (h!26093 (_ BitVec 64)) (t!35941 List!24888)) )
))
(declare-fun arrayNoDuplicates!0 (array!74041 (_ BitVec 32) List!24888) Bool)

(assert (=> b!1138029 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24885)))

(declare-fun lt!506248 () Unit!37280)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74041 (_ BitVec 64) (_ BitVec 32) List!24888) Unit!37280)

(assert (=> b!1138029 (= lt!506248 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24885))))

(assert (=> b!1138029 false))

(declare-fun bm!50273 () Bool)

(declare-fun call!50279 () Unit!37280)

(declare-fun addStillContains!759 (ListLongMap!16099 (_ BitVec 64) V!43249 (_ BitVec 64)) Unit!37280)

(assert (=> bm!50273 (= call!50279 (addStillContains!759 (ite c!111407 lt!506234 lt!506246) (ite c!111407 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111409 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111407 minValue!944 (ite c!111409 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1138030 () Bool)

(declare-fun e!647553 () Bool)

(declare-fun tp_is_empty!28591 () Bool)

(assert (=> b!1138030 (= e!647553 tp_is_empty!28591)))

(declare-fun b!1138031 () Bool)

(declare-fun call!50275 () Bool)

(assert (=> b!1138031 call!50275))

(declare-fun lt!506241 () Unit!37280)

(declare-fun call!50278 () Unit!37280)

(assert (=> b!1138031 (= lt!506241 call!50278)))

(assert (=> b!1138031 (= e!647547 lt!506241)))

(declare-fun b!1138032 () Bool)

(declare-fun lt!506249 () Unit!37280)

(assert (=> b!1138032 (= e!647555 lt!506249)))

(assert (=> b!1138032 (= lt!506249 call!50278)))

(assert (=> b!1138032 call!50275))

(declare-fun call!50277 () ListLongMap!16099)

(declare-fun bm!50274 () Bool)

(assert (=> bm!50274 (= call!50277 (getCurrentListMapNoExtraKeys!4549 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138033 () Bool)

(declare-fun res!759244 () Bool)

(assert (=> b!1138033 (=> (not res!759244) (not e!647551))))

(assert (=> b!1138033 (= res!759244 (arrayNoDuplicates!0 lt!506250 #b00000000000000000000000000000000 Nil!24885))))

(declare-fun b!1138034 () Bool)

(assert (=> b!1138034 (= e!647556 e!647551)))

(declare-fun res!759252 () Bool)

(assert (=> b!1138034 (=> (not res!759252) (not e!647551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74041 (_ BitVec 32)) Bool)

(assert (=> b!1138034 (= res!759252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506250 mask!1564))))

(assert (=> b!1138034 (= lt!506250 (array!74042 (store (arr!35671 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36207 _keys!1208)))))

(declare-fun b!1138035 () Bool)

(declare-fun res!759253 () Bool)

(assert (=> b!1138035 (=> (not res!759253) (not e!647556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138035 (= res!759253 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!44711 () Bool)

(declare-fun mapRes!44711 () Bool)

(declare-fun tp!84894 () Bool)

(assert (=> mapNonEmpty!44711 (= mapRes!44711 (and tp!84894 e!647553))))

(declare-fun mapValue!44711 () ValueCell!13586)

(declare-fun mapRest!44711 () (Array (_ BitVec 32) ValueCell!13586))

(declare-fun mapKey!44711 () (_ BitVec 32))

(assert (=> mapNonEmpty!44711 (= (arr!35672 _values!996) (store mapRest!44711 mapKey!44711 mapValue!44711))))

(declare-fun b!1138036 () Bool)

(declare-fun res!759257 () Bool)

(assert (=> b!1138036 (=> (not res!759257) (not e!647556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138036 (= res!759257 (validMask!0 mask!1564))))

(declare-fun b!1138037 () Bool)

(declare-fun e!647550 () Bool)

(declare-fun e!647546 () Bool)

(assert (=> b!1138037 (= e!647550 e!647546)))

(declare-fun res!759247 () Bool)

(assert (=> b!1138037 (=> res!759247 e!647546)))

(assert (=> b!1138037 (= res!759247 (not (= (select (arr!35671 _keys!1208) from!1455) k!934)))))

(declare-fun e!647549 () Bool)

(assert (=> b!1138037 e!647549))

(declare-fun c!111410 () Bool)

(assert (=> b!1138037 (= c!111410 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506237 () Unit!37280)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!468 (array!74041 array!74043 (_ BitVec 32) (_ BitVec 32) V!43249 V!43249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37280)

(assert (=> b!1138037 (= lt!506237 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138038 () Bool)

(declare-fun Unit!37284 () Unit!37280)

(assert (=> b!1138038 (= e!647544 Unit!37284)))

(declare-fun b!1138039 () Bool)

(assert (=> b!1138039 (= e!647549 (= call!50281 call!50277))))

(declare-fun b!1138040 () Bool)

(assert (=> b!1138040 (= e!647559 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50275 () Bool)

(assert (=> bm!50275 (= call!50278 call!50279)))

(declare-fun b!1138041 () Bool)

(declare-fun -!1219 (ListLongMap!16099 (_ BitVec 64)) ListLongMap!16099)

(assert (=> b!1138041 (= e!647549 (= call!50281 (-!1219 call!50277 k!934)))))

(declare-fun b!1138042 () Bool)

(declare-fun res!759249 () Bool)

(assert (=> b!1138042 (=> (not res!759249) (not e!647556))))

(assert (=> b!1138042 (= res!759249 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24885))))

(declare-fun b!1138043 () Bool)

(declare-fun contains!6603 (ListLongMap!16099 (_ BitVec 64)) Bool)

(assert (=> b!1138043 (contains!6603 call!50274 k!934)))

(declare-fun lt!506244 () Unit!37280)

(assert (=> b!1138043 (= lt!506244 call!50279)))

(declare-fun call!50280 () Bool)

(assert (=> b!1138043 call!50280))

(assert (=> b!1138043 (= lt!506234 (+!3500 lt!506246 (tuple2!18131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506245 () Unit!37280)

(assert (=> b!1138043 (= lt!506245 (addStillContains!759 lt!506246 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1138043 (= e!647557 lt!506244)))

(declare-fun b!1138044 () Bool)

(declare-fun e!647548 () Bool)

(assert (=> b!1138044 (= e!647548 tp_is_empty!28591)))

(declare-fun b!1138045 () Bool)

(declare-fun res!759255 () Bool)

(assert (=> b!1138045 (=> (not res!759255) (not e!647556))))

(assert (=> b!1138045 (= res!759255 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36207 _keys!1208))))))

(declare-fun bm!50276 () Bool)

(assert (=> bm!50276 (= call!50275 call!50280)))

(declare-fun b!1138046 () Bool)

(assert (=> b!1138046 (= e!647545 e!647550)))

(declare-fun res!759250 () Bool)

(assert (=> b!1138046 (=> res!759250 e!647550)))

(assert (=> b!1138046 (= res!759250 (not (= from!1455 i!673)))))

(declare-fun lt!506239 () ListLongMap!16099)

(assert (=> b!1138046 (= lt!506239 (getCurrentListMapNoExtraKeys!4549 lt!506250 lt!506235 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2602 (Int (_ BitVec 64)) V!43249)

(assert (=> b!1138046 (= lt!506235 (array!74044 (store (arr!35672 _values!996) i!673 (ValueCellFull!13586 (dynLambda!2602 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36208 _values!996)))))

(declare-fun lt!506238 () ListLongMap!16099)

(assert (=> b!1138046 (= lt!506238 (getCurrentListMapNoExtraKeys!4549 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!50276 () ListLongMap!16099)

(declare-fun bm!50277 () Bool)

(assert (=> bm!50277 (= call!50280 (contains!6603 (ite c!111407 lt!506234 call!50276) k!934))))

(declare-fun b!1138047 () Bool)

(declare-fun res!759254 () Bool)

(assert (=> b!1138047 (=> (not res!759254) (not e!647556))))

(assert (=> b!1138047 (= res!759254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!759245 () Bool)

(assert (=> start!98456 (=> (not res!759245) (not e!647556))))

(assert (=> start!98456 (= res!759245 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36207 _keys!1208))))))

(assert (=> start!98456 e!647556))

(assert (=> start!98456 tp_is_empty!28591))

(declare-fun array_inv!27348 (array!74041) Bool)

(assert (=> start!98456 (array_inv!27348 _keys!1208)))

(assert (=> start!98456 true))

(assert (=> start!98456 tp!84893))

(declare-fun e!647554 () Bool)

(declare-fun array_inv!27349 (array!74043) Bool)

(assert (=> start!98456 (and (array_inv!27349 _values!996) e!647554)))

(declare-fun b!1138048 () Bool)

(assert (=> b!1138048 (= e!647546 true)))

(declare-fun lt!506247 () Unit!37280)

(assert (=> b!1138048 (= lt!506247 e!647544)))

(declare-fun c!111412 () Bool)

(assert (=> b!1138048 (= c!111412 (contains!6603 lt!506246 k!934))))

(assert (=> b!1138048 (= lt!506246 (getCurrentListMapNoExtraKeys!4549 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138049 () Bool)

(assert (=> b!1138049 (= c!111409 (and (not lt!506240) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1138049 (= e!647557 e!647555)))

(declare-fun bm!50278 () Bool)

(assert (=> bm!50278 (= call!50276 call!50274)))

(declare-fun mapIsEmpty!44711 () Bool)

(assert (=> mapIsEmpty!44711 mapRes!44711))

(declare-fun b!1138050 () Bool)

(assert (=> b!1138050 (= e!647558 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138051 () Bool)

(assert (=> b!1138051 (= e!647554 (and e!647548 mapRes!44711))))

(declare-fun condMapEmpty!44711 () Bool)

(declare-fun mapDefault!44711 () ValueCell!13586)

