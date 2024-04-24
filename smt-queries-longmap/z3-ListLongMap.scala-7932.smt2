; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98668 () Bool)

(assert start!98668)

(declare-fun b_free!24037 () Bool)

(declare-fun b_next!24037 () Bool)

(assert (=> start!98668 (= b_free!24037 (not b_next!24037))))

(declare-fun tp!84822 () Bool)

(declare-fun b_and!38925 () Bool)

(assert (=> start!98668 (= tp!84822 b_and!38925)))

(declare-fun b!1138244 () Bool)

(declare-fun c!111594 () Bool)

(declare-fun lt!506082 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1138244 (= c!111594 (and (not lt!506082) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37208 0))(
  ( (Unit!37209) )
))
(declare-fun e!647806 () Unit!37208)

(declare-fun e!647812 () Unit!37208)

(assert (=> b!1138244 (= e!647806 e!647812)))

(declare-datatypes ((V!43217 0))(
  ( (V!43218 (val!14340 Int)) )
))
(declare-fun zeroValue!944 () V!43217)

(declare-fun bm!50048 () Bool)

(declare-fun c!111593 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!43217)

(declare-datatypes ((tuple2!18118 0))(
  ( (tuple2!18119 (_1!9070 (_ BitVec 64)) (_2!9070 V!43217)) )
))
(declare-datatypes ((List!24883 0))(
  ( (Nil!24880) (Cons!24879 (h!26097 tuple2!18118) (t!35904 List!24883)) )
))
(declare-datatypes ((ListLongMap!16095 0))(
  ( (ListLongMap!16096 (toList!8063 List!24883)) )
))
(declare-fun lt!506079 () ListLongMap!16095)

(declare-fun call!50058 () Unit!37208)

(declare-fun addStillContains!743 (ListLongMap!16095 (_ BitVec 64) V!43217 (_ BitVec 64)) Unit!37208)

(assert (=> bm!50048 (= call!50058 (addStillContains!743 lt!506079 (ite (or c!111593 c!111594) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111593 c!111594) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!50049 () Bool)

(declare-fun call!50054 () Unit!37208)

(assert (=> bm!50049 (= call!50054 call!50058)))

(declare-fun b!1138245 () Bool)

(declare-fun e!647810 () Bool)

(declare-fun e!647803 () Bool)

(declare-fun mapRes!44675 () Bool)

(assert (=> b!1138245 (= e!647810 (and e!647803 mapRes!44675))))

(declare-fun condMapEmpty!44675 () Bool)

(declare-datatypes ((ValueCell!13574 0))(
  ( (ValueCellFull!13574 (v!16973 V!43217)) (EmptyCell!13574) )
))
(declare-datatypes ((array!74035 0))(
  ( (array!74036 (arr!35662 (Array (_ BitVec 32) ValueCell!13574)) (size!36199 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74035)

(declare-fun mapDefault!44675 () ValueCell!13574)

(assert (=> b!1138245 (= condMapEmpty!44675 (= (arr!35662 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13574)) mapDefault!44675)))))

(declare-fun b!1138246 () Bool)

(declare-fun res!759258 () Bool)

(declare-fun e!647815 () Bool)

(assert (=> b!1138246 (=> (not res!759258) (not e!647815))))

(declare-datatypes ((array!74037 0))(
  ( (array!74038 (arr!35663 (Array (_ BitVec 32) (_ BitVec 64))) (size!36200 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74037)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1138246 (= res!759258 (and (= (size!36199 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36200 _keys!1208) (size!36199 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138247 () Bool)

(declare-fun e!647809 () Bool)

(assert (=> b!1138247 (= e!647815 e!647809)))

(declare-fun res!759250 () Bool)

(assert (=> b!1138247 (=> (not res!759250) (not e!647809))))

(declare-fun lt!506073 () array!74037)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74037 (_ BitVec 32)) Bool)

(assert (=> b!1138247 (= res!759250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506073 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138247 (= lt!506073 (array!74038 (store (arr!35663 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36200 _keys!1208)))))

(declare-fun b!1138248 () Bool)

(declare-fun res!759249 () Bool)

(assert (=> b!1138248 (=> (not res!759249) (not e!647815))))

(assert (=> b!1138248 (= res!759249 (= (select (arr!35663 _keys!1208) i!673) k0!934))))

(declare-fun b!1138249 () Bool)

(declare-fun call!50057 () Bool)

(assert (=> b!1138249 call!50057))

(declare-fun lt!506070 () Unit!37208)

(assert (=> b!1138249 (= lt!506070 call!50054)))

(declare-fun e!647804 () Unit!37208)

(assert (=> b!1138249 (= e!647804 lt!506070)))

(declare-fun b!1138250 () Bool)

(declare-fun e!647813 () Unit!37208)

(declare-fun Unit!37210 () Unit!37208)

(assert (=> b!1138250 (= e!647813 Unit!37210)))

(declare-fun b!1138251 () Bool)

(declare-fun e!647802 () Bool)

(assert (=> b!1138251 (= e!647802 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506082) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1138252 () Bool)

(declare-fun res!759257 () Bool)

(assert (=> b!1138252 (=> (not res!759257) (not e!647815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138252 (= res!759257 (validKeyInArray!0 k0!934))))

(declare-fun bm!50050 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!506072 () array!74035)

(declare-fun call!50052 () ListLongMap!16095)

(declare-fun getCurrentListMapNoExtraKeys!4573 (array!74037 array!74035 (_ BitVec 32) (_ BitVec 32) V!43217 V!43217 (_ BitVec 32) Int) ListLongMap!16095)

(assert (=> bm!50050 (= call!50052 (getCurrentListMapNoExtraKeys!4573 lt!506073 lt!506072 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138253 () Bool)

(declare-fun tp_is_empty!28567 () Bool)

(assert (=> b!1138253 (= e!647803 tp_is_empty!28567)))

(declare-fun mapNonEmpty!44675 () Bool)

(declare-fun tp!84821 () Bool)

(declare-fun e!647801 () Bool)

(assert (=> mapNonEmpty!44675 (= mapRes!44675 (and tp!84821 e!647801))))

(declare-fun mapKey!44675 () (_ BitVec 32))

(declare-fun mapRest!44675 () (Array (_ BitVec 32) ValueCell!13574))

(declare-fun mapValue!44675 () ValueCell!13574)

(assert (=> mapNonEmpty!44675 (= (arr!35662 _values!996) (store mapRest!44675 mapKey!44675 mapValue!44675))))

(declare-fun bm!50051 () Bool)

(declare-fun call!50056 () Bool)

(assert (=> bm!50051 (= call!50057 call!50056)))

(declare-fun b!1138254 () Bool)

(declare-fun e!647805 () Bool)

(declare-fun arrayContainsKey!0 (array!74037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138254 (= e!647805 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50052 () Bool)

(declare-fun call!50053 () ListLongMap!16095)

(assert (=> bm!50052 (= call!50053 (getCurrentListMapNoExtraKeys!4573 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138255 () Bool)

(declare-fun e!647808 () Bool)

(assert (=> b!1138255 (= e!647809 (not e!647808))))

(declare-fun res!759252 () Bool)

(assert (=> b!1138255 (=> res!759252 e!647808)))

(assert (=> b!1138255 (= res!759252 (bvsgt from!1455 i!673))))

(assert (=> b!1138255 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506078 () Unit!37208)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74037 (_ BitVec 64) (_ BitVec 32)) Unit!37208)

(assert (=> b!1138255 (= lt!506078 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1138256 () Bool)

(declare-fun res!759253 () Bool)

(assert (=> b!1138256 (=> (not res!759253) (not e!647815))))

(assert (=> b!1138256 (= res!759253 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36200 _keys!1208))))))

(declare-fun lt!506085 () ListLongMap!16095)

(declare-fun call!50055 () ListLongMap!16095)

(declare-fun bm!50053 () Bool)

(declare-fun contains!6614 (ListLongMap!16095 (_ BitVec 64)) Bool)

(assert (=> bm!50053 (= call!50056 (contains!6614 (ite c!111593 lt!506085 call!50055) k0!934))))

(declare-fun b!1138257 () Bool)

(declare-fun lt!506069 () Unit!37208)

(assert (=> b!1138257 (= e!647812 lt!506069)))

(assert (=> b!1138257 (= lt!506069 call!50054)))

(assert (=> b!1138257 call!50057))

(declare-fun b!1138258 () Bool)

(declare-fun e!647811 () Bool)

(assert (=> b!1138258 (= e!647808 e!647811)))

(declare-fun res!759254 () Bool)

(assert (=> b!1138258 (=> res!759254 e!647811)))

(assert (=> b!1138258 (= res!759254 (not (= from!1455 i!673)))))

(declare-fun lt!506084 () ListLongMap!16095)

(assert (=> b!1138258 (= lt!506084 (getCurrentListMapNoExtraKeys!4573 lt!506073 lt!506072 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2623 (Int (_ BitVec 64)) V!43217)

(assert (=> b!1138258 (= lt!506072 (array!74036 (store (arr!35662 _values!996) i!673 (ValueCellFull!13574 (dynLambda!2623 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36199 _values!996)))))

(declare-fun lt!506074 () ListLongMap!16095)

(assert (=> b!1138258 (= lt!506074 (getCurrentListMapNoExtraKeys!4573 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138259 () Bool)

(declare-fun res!759259 () Bool)

(assert (=> b!1138259 (=> (not res!759259) (not e!647809))))

(declare-datatypes ((List!24884 0))(
  ( (Nil!24881) (Cons!24880 (h!26098 (_ BitVec 64)) (t!35905 List!24884)) )
))
(declare-fun arrayNoDuplicates!0 (array!74037 (_ BitVec 32) List!24884) Bool)

(assert (=> b!1138259 (= res!759259 (arrayNoDuplicates!0 lt!506073 #b00000000000000000000000000000000 Nil!24881))))

(declare-fun b!1138260 () Bool)

(declare-fun res!759255 () Bool)

(assert (=> b!1138260 (=> (not res!759255) (not e!647815))))

(assert (=> b!1138260 (= res!759255 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24881))))

(declare-fun b!1138261 () Bool)

(declare-fun Unit!37211 () Unit!37208)

(assert (=> b!1138261 (= e!647813 Unit!37211)))

(assert (=> b!1138261 (= lt!506082 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1138261 (= c!111593 (and (not lt!506082) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506075 () Unit!37208)

(assert (=> b!1138261 (= lt!506075 e!647806)))

(declare-fun lt!506071 () Unit!37208)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!351 (array!74037 array!74035 (_ BitVec 32) (_ BitVec 32) V!43217 V!43217 (_ BitVec 64) (_ BitVec 32) Int) Unit!37208)

(assert (=> b!1138261 (= lt!506071 (lemmaListMapContainsThenArrayContainsFrom!351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111590 () Bool)

(assert (=> b!1138261 (= c!111590 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759256 () Bool)

(assert (=> b!1138261 (= res!759256 e!647802)))

(assert (=> b!1138261 (=> (not res!759256) (not e!647805))))

(assert (=> b!1138261 e!647805))

(declare-fun lt!506077 () Unit!37208)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74037 (_ BitVec 32) (_ BitVec 32)) Unit!37208)

(assert (=> b!1138261 (= lt!506077 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1138261 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24881)))

(declare-fun lt!506083 () Unit!37208)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74037 (_ BitVec 64) (_ BitVec 32) List!24884) Unit!37208)

(assert (=> b!1138261 (= lt!506083 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24881))))

(assert (=> b!1138261 false))

(declare-fun b!1138262 () Bool)

(declare-fun e!647800 () Bool)

(assert (=> b!1138262 (= e!647811 e!647800)))

(declare-fun res!759261 () Bool)

(assert (=> b!1138262 (=> res!759261 e!647800)))

(assert (=> b!1138262 (= res!759261 (not (= (select (arr!35663 _keys!1208) from!1455) k0!934)))))

(declare-fun e!647814 () Bool)

(assert (=> b!1138262 e!647814))

(declare-fun c!111591 () Bool)

(assert (=> b!1138262 (= c!111591 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506080 () Unit!37208)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!463 (array!74037 array!74035 (_ BitVec 32) (_ BitVec 32) V!43217 V!43217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37208)

(assert (=> b!1138262 (= lt!506080 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138263 () Bool)

(assert (=> b!1138263 (= e!647802 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138264 () Bool)

(assert (=> b!1138264 (= e!647814 (= call!50052 call!50053))))

(declare-fun mapIsEmpty!44675 () Bool)

(assert (=> mapIsEmpty!44675 mapRes!44675))

(declare-fun b!1138265 () Bool)

(assert (=> b!1138265 (= e!647812 e!647804)))

(declare-fun c!111592 () Bool)

(assert (=> b!1138265 (= c!111592 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506082))))

(declare-fun b!1138266 () Bool)

(assert (=> b!1138266 (= e!647800 true)))

(declare-fun lt!506081 () Unit!37208)

(assert (=> b!1138266 (= lt!506081 e!647813)))

(declare-fun c!111589 () Bool)

(assert (=> b!1138266 (= c!111589 (contains!6614 lt!506079 k0!934))))

(assert (=> b!1138266 (= lt!506079 (getCurrentListMapNoExtraKeys!4573 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138267 () Bool)

(declare-fun res!759248 () Bool)

(assert (=> b!1138267 (=> (not res!759248) (not e!647815))))

(assert (=> b!1138267 (= res!759248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50054 () Bool)

(declare-fun call!50051 () ListLongMap!16095)

(declare-fun +!3516 (ListLongMap!16095 tuple2!18118) ListLongMap!16095)

(assert (=> bm!50054 (= call!50051 (+!3516 (ite c!111593 lt!506085 lt!506079) (ite c!111593 (tuple2!18119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111594 (tuple2!18119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!50055 () Bool)

(assert (=> bm!50055 (= call!50055 call!50051)))

(declare-fun b!1138268 () Bool)

(assert (=> b!1138268 (contains!6614 call!50051 k0!934)))

(declare-fun lt!506076 () Unit!37208)

(assert (=> b!1138268 (= lt!506076 (addStillContains!743 lt!506085 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1138268 call!50056))

(assert (=> b!1138268 (= lt!506085 (+!3516 lt!506079 (tuple2!18119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506086 () Unit!37208)

(assert (=> b!1138268 (= lt!506086 call!50058)))

(assert (=> b!1138268 (= e!647806 lt!506076)))

(declare-fun b!1138269 () Bool)

(declare-fun Unit!37212 () Unit!37208)

(assert (=> b!1138269 (= e!647804 Unit!37212)))

(declare-fun b!1138271 () Bool)

(declare-fun -!1205 (ListLongMap!16095 (_ BitVec 64)) ListLongMap!16095)

(assert (=> b!1138271 (= e!647814 (= call!50052 (-!1205 call!50053 k0!934)))))

(declare-fun b!1138272 () Bool)

(declare-fun res!759251 () Bool)

(assert (=> b!1138272 (=> (not res!759251) (not e!647815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138272 (= res!759251 (validMask!0 mask!1564))))

(declare-fun res!759260 () Bool)

(assert (=> start!98668 (=> (not res!759260) (not e!647815))))

(assert (=> start!98668 (= res!759260 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36200 _keys!1208))))))

(assert (=> start!98668 e!647815))

(assert (=> start!98668 tp_is_empty!28567))

(declare-fun array_inv!27392 (array!74037) Bool)

(assert (=> start!98668 (array_inv!27392 _keys!1208)))

(assert (=> start!98668 true))

(assert (=> start!98668 tp!84822))

(declare-fun array_inv!27393 (array!74035) Bool)

(assert (=> start!98668 (and (array_inv!27393 _values!996) e!647810)))

(declare-fun b!1138270 () Bool)

(assert (=> b!1138270 (= e!647801 tp_is_empty!28567)))

(assert (= (and start!98668 res!759260) b!1138272))

(assert (= (and b!1138272 res!759251) b!1138246))

(assert (= (and b!1138246 res!759258) b!1138267))

(assert (= (and b!1138267 res!759248) b!1138260))

(assert (= (and b!1138260 res!759255) b!1138256))

(assert (= (and b!1138256 res!759253) b!1138252))

(assert (= (and b!1138252 res!759257) b!1138248))

(assert (= (and b!1138248 res!759249) b!1138247))

(assert (= (and b!1138247 res!759250) b!1138259))

(assert (= (and b!1138259 res!759259) b!1138255))

(assert (= (and b!1138255 (not res!759252)) b!1138258))

(assert (= (and b!1138258 (not res!759254)) b!1138262))

(assert (= (and b!1138262 c!111591) b!1138271))

(assert (= (and b!1138262 (not c!111591)) b!1138264))

(assert (= (or b!1138271 b!1138264) bm!50050))

(assert (= (or b!1138271 b!1138264) bm!50052))

(assert (= (and b!1138262 (not res!759261)) b!1138266))

(assert (= (and b!1138266 c!111589) b!1138261))

(assert (= (and b!1138266 (not c!111589)) b!1138250))

(assert (= (and b!1138261 c!111593) b!1138268))

(assert (= (and b!1138261 (not c!111593)) b!1138244))

(assert (= (and b!1138244 c!111594) b!1138257))

(assert (= (and b!1138244 (not c!111594)) b!1138265))

(assert (= (and b!1138265 c!111592) b!1138249))

(assert (= (and b!1138265 (not c!111592)) b!1138269))

(assert (= (or b!1138257 b!1138249) bm!50049))

(assert (= (or b!1138257 b!1138249) bm!50055))

(assert (= (or b!1138257 b!1138249) bm!50051))

(assert (= (or b!1138268 bm!50051) bm!50053))

(assert (= (or b!1138268 bm!50049) bm!50048))

(assert (= (or b!1138268 bm!50055) bm!50054))

(assert (= (and b!1138261 c!111590) b!1138263))

(assert (= (and b!1138261 (not c!111590)) b!1138251))

(assert (= (and b!1138261 res!759256) b!1138254))

(assert (= (and b!1138245 condMapEmpty!44675) mapIsEmpty!44675))

(assert (= (and b!1138245 (not condMapEmpty!44675)) mapNonEmpty!44675))

(get-info :version)

(assert (= (and mapNonEmpty!44675 ((_ is ValueCellFull!13574) mapValue!44675)) b!1138270))

(assert (= (and b!1138245 ((_ is ValueCellFull!13574) mapDefault!44675)) b!1138253))

(assert (= start!98668 b!1138245))

(declare-fun b_lambda!19137 () Bool)

(assert (=> (not b_lambda!19137) (not b!1138258)))

(declare-fun t!35903 () Bool)

(declare-fun tb!8841 () Bool)

(assert (=> (and start!98668 (= defaultEntry!1004 defaultEntry!1004) t!35903) tb!8841))

(declare-fun result!18255 () Bool)

(assert (=> tb!8841 (= result!18255 tp_is_empty!28567)))

(assert (=> b!1138258 t!35903))

(declare-fun b_and!38927 () Bool)

(assert (= b_and!38925 (and (=> t!35903 result!18255) b_and!38927)))

(declare-fun m!1050735 () Bool)

(assert (=> start!98668 m!1050735))

(declare-fun m!1050737 () Bool)

(assert (=> start!98668 m!1050737))

(declare-fun m!1050739 () Bool)

(assert (=> mapNonEmpty!44675 m!1050739))

(declare-fun m!1050741 () Bool)

(assert (=> b!1138248 m!1050741))

(declare-fun m!1050743 () Bool)

(assert (=> b!1138266 m!1050743))

(declare-fun m!1050745 () Bool)

(assert (=> b!1138266 m!1050745))

(declare-fun m!1050747 () Bool)

(assert (=> b!1138262 m!1050747))

(declare-fun m!1050749 () Bool)

(assert (=> b!1138262 m!1050749))

(declare-fun m!1050751 () Bool)

(assert (=> b!1138255 m!1050751))

(declare-fun m!1050753 () Bool)

(assert (=> b!1138255 m!1050753))

(declare-fun m!1050755 () Bool)

(assert (=> b!1138267 m!1050755))

(declare-fun m!1050757 () Bool)

(assert (=> b!1138272 m!1050757))

(declare-fun m!1050759 () Bool)

(assert (=> b!1138247 m!1050759))

(declare-fun m!1050761 () Bool)

(assert (=> b!1138247 m!1050761))

(declare-fun m!1050763 () Bool)

(assert (=> b!1138259 m!1050763))

(declare-fun m!1050765 () Bool)

(assert (=> bm!50050 m!1050765))

(declare-fun m!1050767 () Bool)

(assert (=> bm!50054 m!1050767))

(declare-fun m!1050769 () Bool)

(assert (=> b!1138263 m!1050769))

(declare-fun m!1050771 () Bool)

(assert (=> b!1138271 m!1050771))

(declare-fun m!1050773 () Bool)

(assert (=> bm!50048 m!1050773))

(declare-fun m!1050775 () Bool)

(assert (=> b!1138260 m!1050775))

(declare-fun m!1050777 () Bool)

(assert (=> b!1138268 m!1050777))

(declare-fun m!1050779 () Bool)

(assert (=> b!1138268 m!1050779))

(declare-fun m!1050781 () Bool)

(assert (=> b!1138268 m!1050781))

(declare-fun m!1050783 () Bool)

(assert (=> bm!50053 m!1050783))

(declare-fun m!1050785 () Bool)

(assert (=> b!1138261 m!1050785))

(declare-fun m!1050787 () Bool)

(assert (=> b!1138261 m!1050787))

(declare-fun m!1050789 () Bool)

(assert (=> b!1138261 m!1050789))

(declare-fun m!1050791 () Bool)

(assert (=> b!1138261 m!1050791))

(assert (=> bm!50052 m!1050745))

(declare-fun m!1050793 () Bool)

(assert (=> b!1138252 m!1050793))

(assert (=> b!1138254 m!1050769))

(declare-fun m!1050795 () Bool)

(assert (=> b!1138258 m!1050795))

(declare-fun m!1050797 () Bool)

(assert (=> b!1138258 m!1050797))

(declare-fun m!1050799 () Bool)

(assert (=> b!1138258 m!1050799))

(declare-fun m!1050801 () Bool)

(assert (=> b!1138258 m!1050801))

(check-sat (not start!98668) (not bm!50050) (not b!1138258) (not b!1138272) (not b!1138271) (not b!1138266) (not b_next!24037) (not b!1138247) (not b!1138259) (not b!1138263) (not b!1138254) (not bm!50053) (not bm!50052) (not bm!50048) (not bm!50054) (not b!1138252) (not b!1138262) (not mapNonEmpty!44675) tp_is_empty!28567 (not b!1138255) (not b!1138261) (not b!1138267) b_and!38927 (not b_lambda!19137) (not b!1138268) (not b!1138260))
(check-sat b_and!38927 (not b_next!24037))
