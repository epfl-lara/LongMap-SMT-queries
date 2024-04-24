; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98686 () Bool)

(assert start!98686)

(declare-fun b_free!24055 () Bool)

(declare-fun b_next!24055 () Bool)

(assert (=> start!98686 (= b_free!24055 (not b_next!24055))))

(declare-fun tp!84876 () Bool)

(declare-fun b_and!38961 () Bool)

(assert (=> start!98686 (= tp!84876 b_and!38961)))

(declare-fun b!1139045 () Bool)

(declare-fun res!759629 () Bool)

(declare-fun e!648234 () Bool)

(assert (=> b!1139045 (=> (not res!759629) (not e!648234))))

(declare-datatypes ((array!74071 0))(
  ( (array!74072 (arr!35680 (Array (_ BitVec 32) (_ BitVec 64))) (size!36217 (_ BitVec 32))) )
))
(declare-fun lt!506563 () array!74071)

(declare-datatypes ((List!24901 0))(
  ( (Nil!24898) (Cons!24897 (h!26115 (_ BitVec 64)) (t!35940 List!24901)) )
))
(declare-fun arrayNoDuplicates!0 (array!74071 (_ BitVec 32) List!24901) Bool)

(assert (=> b!1139045 (= res!759629 (arrayNoDuplicates!0 lt!506563 #b00000000000000000000000000000000 Nil!24898))))

(declare-fun b!1139046 () Bool)

(declare-fun e!648233 () Bool)

(declare-fun e!648240 () Bool)

(assert (=> b!1139046 (= e!648233 e!648240)))

(declare-fun res!759635 () Bool)

(assert (=> b!1139046 (=> res!759635 e!648240)))

(declare-fun _keys!1208 () array!74071)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1139046 (= res!759635 (not (= (select (arr!35680 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648236 () Bool)

(assert (=> b!1139046 e!648236))

(declare-fun c!111756 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139046 (= c!111756 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43241 0))(
  ( (V!43242 (val!14349 Int)) )
))
(declare-fun zeroValue!944 () V!43241)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!37250 0))(
  ( (Unit!37251) )
))
(declare-fun lt!506559 () Unit!37250)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13583 0))(
  ( (ValueCellFull!13583 (v!16982 V!43241)) (EmptyCell!13583) )
))
(declare-datatypes ((array!74073 0))(
  ( (array!74074 (arr!35681 (Array (_ BitVec 32) ValueCell!13583)) (size!36218 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74073)

(declare-fun minValue!944 () V!43241)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!471 (array!74071 array!74073 (_ BitVec 32) (_ BitVec 32) V!43241 V!43241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37250)

(assert (=> b!1139046 (= lt!506559 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139047 () Bool)

(declare-fun res!759627 () Bool)

(declare-fun e!648238 () Bool)

(assert (=> b!1139047 (=> (not res!759627) (not e!648238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139047 (= res!759627 (validKeyInArray!0 k0!934))))

(declare-fun e!648237 () Bool)

(declare-fun b!1139048 () Bool)

(declare-fun lt!506571 () Bool)

(assert (=> b!1139048 (= e!648237 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506571) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun c!111752 () Bool)

(declare-fun bm!50264 () Bool)

(declare-datatypes ((tuple2!18136 0))(
  ( (tuple2!18137 (_1!9079 (_ BitVec 64)) (_2!9079 V!43241)) )
))
(declare-datatypes ((List!24902 0))(
  ( (Nil!24899) (Cons!24898 (h!26116 tuple2!18136) (t!35941 List!24902)) )
))
(declare-datatypes ((ListLongMap!16113 0))(
  ( (ListLongMap!16114 (toList!8072 List!24902)) )
))
(declare-fun call!50274 () ListLongMap!16113)

(declare-fun lt!506565 () ListLongMap!16113)

(declare-fun c!111753 () Bool)

(declare-fun +!3525 (ListLongMap!16113 tuple2!18136) ListLongMap!16113)

(assert (=> bm!50264 (= call!50274 (+!3525 lt!506565 (ite (or c!111752 c!111753) (tuple2!18137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1139049 () Bool)

(assert (=> b!1139049 (= c!111753 (and (not lt!506571) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!648245 () Unit!37250)

(declare-fun e!648241 () Unit!37250)

(assert (=> b!1139049 (= e!648245 e!648241)))

(declare-fun mapIsEmpty!44702 () Bool)

(declare-fun mapRes!44702 () Bool)

(assert (=> mapIsEmpty!44702 mapRes!44702))

(declare-fun lt!506572 () ListLongMap!16113)

(declare-fun call!50268 () Bool)

(declare-fun call!50269 () ListLongMap!16113)

(declare-fun bm!50265 () Bool)

(declare-fun contains!6623 (ListLongMap!16113 (_ BitVec 64)) Bool)

(assert (=> bm!50265 (= call!50268 (contains!6623 (ite c!111752 lt!506572 call!50269) k0!934))))

(declare-fun b!1139050 () Bool)

(declare-fun lt!506564 () Unit!37250)

(assert (=> b!1139050 (= e!648241 lt!506564)))

(declare-fun call!50271 () Unit!37250)

(assert (=> b!1139050 (= lt!506564 call!50271)))

(declare-fun call!50273 () Bool)

(assert (=> b!1139050 call!50273))

(declare-fun bm!50266 () Bool)

(assert (=> bm!50266 (= call!50273 call!50268)))

(declare-fun bm!50267 () Bool)

(declare-fun call!50272 () Unit!37250)

(assert (=> bm!50267 (= call!50271 call!50272)))

(declare-fun b!1139051 () Bool)

(declare-fun res!759634 () Bool)

(assert (=> b!1139051 (=> (not res!759634) (not e!648238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139051 (= res!759634 (validMask!0 mask!1564))))

(declare-fun bm!50268 () Bool)

(declare-fun call!50267 () ListLongMap!16113)

(declare-fun lt!506568 () array!74073)

(declare-fun getCurrentListMapNoExtraKeys!4582 (array!74071 array!74073 (_ BitVec 32) (_ BitVec 32) V!43241 V!43241 (_ BitVec 32) Int) ListLongMap!16113)

(assert (=> bm!50268 (= call!50267 (getCurrentListMapNoExtraKeys!4582 lt!506563 lt!506568 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!50270 () ListLongMap!16113)

(declare-fun b!1139052 () Bool)

(declare-fun -!1212 (ListLongMap!16113 (_ BitVec 64)) ListLongMap!16113)

(assert (=> b!1139052 (= e!648236 (= call!50267 (-!1212 call!50270 k0!934)))))

(declare-fun b!1139053 () Bool)

(declare-fun res!759638 () Bool)

(assert (=> b!1139053 (=> (not res!759638) (not e!648238))))

(assert (=> b!1139053 (= res!759638 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24898))))

(declare-fun b!1139054 () Bool)

(declare-fun e!648239 () Unit!37250)

(declare-fun Unit!37252 () Unit!37250)

(assert (=> b!1139054 (= e!648239 Unit!37252)))

(assert (=> b!1139054 (= lt!506571 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139054 (= c!111752 (and (not lt!506571) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506558 () Unit!37250)

(assert (=> b!1139054 (= lt!506558 e!648245)))

(declare-fun lt!506560 () Unit!37250)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!360 (array!74071 array!74073 (_ BitVec 32) (_ BitVec 32) V!43241 V!43241 (_ BitVec 64) (_ BitVec 32) Int) Unit!37250)

(assert (=> b!1139054 (= lt!506560 (lemmaListMapContainsThenArrayContainsFrom!360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111754 () Bool)

(assert (=> b!1139054 (= c!111754 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759636 () Bool)

(assert (=> b!1139054 (= res!759636 e!648237)))

(declare-fun e!648244 () Bool)

(assert (=> b!1139054 (=> (not res!759636) (not e!648244))))

(assert (=> b!1139054 e!648244))

(declare-fun lt!506557 () Unit!37250)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74071 (_ BitVec 32) (_ BitVec 32)) Unit!37250)

(assert (=> b!1139054 (= lt!506557 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1139054 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24898)))

(declare-fun lt!506566 () Unit!37250)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74071 (_ BitVec 64) (_ BitVec 32) List!24901) Unit!37250)

(assert (=> b!1139054 (= lt!506566 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24898))))

(assert (=> b!1139054 false))

(declare-fun mapNonEmpty!44702 () Bool)

(declare-fun tp!84875 () Bool)

(declare-fun e!648235 () Bool)

(assert (=> mapNonEmpty!44702 (= mapRes!44702 (and tp!84875 e!648235))))

(declare-fun mapValue!44702 () ValueCell!13583)

(declare-fun mapRest!44702 () (Array (_ BitVec 32) ValueCell!13583))

(declare-fun mapKey!44702 () (_ BitVec 32))

(assert (=> mapNonEmpty!44702 (= (arr!35681 _values!996) (store mapRest!44702 mapKey!44702 mapValue!44702))))

(declare-fun b!1139055 () Bool)

(assert (=> b!1139055 (= e!648236 (= call!50267 call!50270))))

(declare-fun b!1139056 () Bool)

(declare-fun res!759631 () Bool)

(assert (=> b!1139056 (=> (not res!759631) (not e!648238))))

(assert (=> b!1139056 (= res!759631 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36217 _keys!1208))))))

(declare-fun b!1139057 () Bool)

(declare-fun tp_is_empty!28585 () Bool)

(assert (=> b!1139057 (= e!648235 tp_is_empty!28585)))

(declare-fun bm!50269 () Bool)

(declare-fun addStillContains!752 (ListLongMap!16113 (_ BitVec 64) V!43241 (_ BitVec 64)) Unit!37250)

(assert (=> bm!50269 (= call!50272 (addStillContains!752 (ite c!111752 lt!506572 lt!506565) (ite c!111752 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111753 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111752 minValue!944 (ite c!111753 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!50270 () Bool)

(assert (=> bm!50270 (= call!50269 call!50274)))

(declare-fun b!1139058 () Bool)

(declare-fun e!648232 () Unit!37250)

(declare-fun Unit!37253 () Unit!37250)

(assert (=> b!1139058 (= e!648232 Unit!37253)))

(declare-fun b!1139059 () Bool)

(declare-fun arrayContainsKey!0 (array!74071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139059 (= e!648237 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139060 () Bool)

(declare-fun res!759633 () Bool)

(assert (=> b!1139060 (=> (not res!759633) (not e!648238))))

(assert (=> b!1139060 (= res!759633 (= (select (arr!35680 _keys!1208) i!673) k0!934))))

(declare-fun b!1139061 () Bool)

(declare-fun res!759626 () Bool)

(assert (=> b!1139061 (=> (not res!759626) (not e!648238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74071 (_ BitVec 32)) Bool)

(assert (=> b!1139061 (= res!759626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!759637 () Bool)

(assert (=> start!98686 (=> (not res!759637) (not e!648238))))

(assert (=> start!98686 (= res!759637 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36217 _keys!1208))))))

(assert (=> start!98686 e!648238))

(assert (=> start!98686 tp_is_empty!28585))

(declare-fun array_inv!27404 (array!74071) Bool)

(assert (=> start!98686 (array_inv!27404 _keys!1208)))

(assert (=> start!98686 true))

(assert (=> start!98686 tp!84876))

(declare-fun e!648246 () Bool)

(declare-fun array_inv!27405 (array!74073) Bool)

(assert (=> start!98686 (and (array_inv!27405 _values!996) e!648246)))

(declare-fun b!1139062 () Bool)

(assert (=> b!1139062 (contains!6623 (+!3525 lt!506572 (tuple2!18137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!506569 () Unit!37250)

(assert (=> b!1139062 (= lt!506569 call!50272)))

(assert (=> b!1139062 call!50268))

(assert (=> b!1139062 (= lt!506572 call!50274)))

(declare-fun lt!506561 () Unit!37250)

(assert (=> b!1139062 (= lt!506561 (addStillContains!752 lt!506565 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1139062 (= e!648245 lt!506569)))

(declare-fun b!1139063 () Bool)

(assert (=> b!1139063 (= e!648238 e!648234)))

(declare-fun res!759639 () Bool)

(assert (=> b!1139063 (=> (not res!759639) (not e!648234))))

(assert (=> b!1139063 (= res!759639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506563 mask!1564))))

(assert (=> b!1139063 (= lt!506563 (array!74072 (store (arr!35680 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36217 _keys!1208)))))

(declare-fun b!1139064 () Bool)

(declare-fun e!648247 () Bool)

(assert (=> b!1139064 (= e!648246 (and e!648247 mapRes!44702))))

(declare-fun condMapEmpty!44702 () Bool)

(declare-fun mapDefault!44702 () ValueCell!13583)

(assert (=> b!1139064 (= condMapEmpty!44702 (= (arr!35681 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13583)) mapDefault!44702)))))

(declare-fun b!1139065 () Bool)

(assert (=> b!1139065 call!50273))

(declare-fun lt!506562 () Unit!37250)

(assert (=> b!1139065 (= lt!506562 call!50271)))

(assert (=> b!1139065 (= e!648232 lt!506562)))

(declare-fun b!1139066 () Bool)

(assert (=> b!1139066 (= e!648240 true)))

(declare-fun lt!506570 () Unit!37250)

(assert (=> b!1139066 (= lt!506570 e!648239)))

(declare-fun c!111755 () Bool)

(assert (=> b!1139066 (= c!111755 (contains!6623 lt!506565 k0!934))))

(assert (=> b!1139066 (= lt!506565 (getCurrentListMapNoExtraKeys!4582 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50271 () Bool)

(assert (=> bm!50271 (= call!50270 (getCurrentListMapNoExtraKeys!4582 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139067 () Bool)

(assert (=> b!1139067 (= e!648247 tp_is_empty!28585)))

(declare-fun b!1139068 () Bool)

(assert (=> b!1139068 (= e!648244 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139069 () Bool)

(assert (=> b!1139069 (= e!648241 e!648232)))

(declare-fun c!111751 () Bool)

(assert (=> b!1139069 (= c!111751 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506571))))

(declare-fun b!1139070 () Bool)

(declare-fun Unit!37254 () Unit!37250)

(assert (=> b!1139070 (= e!648239 Unit!37254)))

(declare-fun b!1139071 () Bool)

(declare-fun e!648243 () Bool)

(assert (=> b!1139071 (= e!648234 (not e!648243))))

(declare-fun res!759630 () Bool)

(assert (=> b!1139071 (=> res!759630 e!648243)))

(assert (=> b!1139071 (= res!759630 (bvsgt from!1455 i!673))))

(assert (=> b!1139071 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506556 () Unit!37250)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74071 (_ BitVec 64) (_ BitVec 32)) Unit!37250)

(assert (=> b!1139071 (= lt!506556 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1139072 () Bool)

(declare-fun res!759628 () Bool)

(assert (=> b!1139072 (=> (not res!759628) (not e!648238))))

(assert (=> b!1139072 (= res!759628 (and (= (size!36218 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36217 _keys!1208) (size!36218 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1139073 () Bool)

(assert (=> b!1139073 (= e!648243 e!648233)))

(declare-fun res!759632 () Bool)

(assert (=> b!1139073 (=> res!759632 e!648233)))

(assert (=> b!1139073 (= res!759632 (not (= from!1455 i!673)))))

(declare-fun lt!506567 () ListLongMap!16113)

(assert (=> b!1139073 (= lt!506567 (getCurrentListMapNoExtraKeys!4582 lt!506563 lt!506568 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2630 (Int (_ BitVec 64)) V!43241)

(assert (=> b!1139073 (= lt!506568 (array!74074 (store (arr!35681 _values!996) i!673 (ValueCellFull!13583 (dynLambda!2630 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36218 _values!996)))))

(declare-fun lt!506555 () ListLongMap!16113)

(assert (=> b!1139073 (= lt!506555 (getCurrentListMapNoExtraKeys!4582 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98686 res!759637) b!1139051))

(assert (= (and b!1139051 res!759634) b!1139072))

(assert (= (and b!1139072 res!759628) b!1139061))

(assert (= (and b!1139061 res!759626) b!1139053))

(assert (= (and b!1139053 res!759638) b!1139056))

(assert (= (and b!1139056 res!759631) b!1139047))

(assert (= (and b!1139047 res!759627) b!1139060))

(assert (= (and b!1139060 res!759633) b!1139063))

(assert (= (and b!1139063 res!759639) b!1139045))

(assert (= (and b!1139045 res!759629) b!1139071))

(assert (= (and b!1139071 (not res!759630)) b!1139073))

(assert (= (and b!1139073 (not res!759632)) b!1139046))

(assert (= (and b!1139046 c!111756) b!1139052))

(assert (= (and b!1139046 (not c!111756)) b!1139055))

(assert (= (or b!1139052 b!1139055) bm!50268))

(assert (= (or b!1139052 b!1139055) bm!50271))

(assert (= (and b!1139046 (not res!759635)) b!1139066))

(assert (= (and b!1139066 c!111755) b!1139054))

(assert (= (and b!1139066 (not c!111755)) b!1139070))

(assert (= (and b!1139054 c!111752) b!1139062))

(assert (= (and b!1139054 (not c!111752)) b!1139049))

(assert (= (and b!1139049 c!111753) b!1139050))

(assert (= (and b!1139049 (not c!111753)) b!1139069))

(assert (= (and b!1139069 c!111751) b!1139065))

(assert (= (and b!1139069 (not c!111751)) b!1139058))

(assert (= (or b!1139050 b!1139065) bm!50267))

(assert (= (or b!1139050 b!1139065) bm!50270))

(assert (= (or b!1139050 b!1139065) bm!50266))

(assert (= (or b!1139062 bm!50266) bm!50265))

(assert (= (or b!1139062 bm!50267) bm!50269))

(assert (= (or b!1139062 bm!50270) bm!50264))

(assert (= (and b!1139054 c!111754) b!1139059))

(assert (= (and b!1139054 (not c!111754)) b!1139048))

(assert (= (and b!1139054 res!759636) b!1139068))

(assert (= (and b!1139064 condMapEmpty!44702) mapIsEmpty!44702))

(assert (= (and b!1139064 (not condMapEmpty!44702)) mapNonEmpty!44702))

(get-info :version)

(assert (= (and mapNonEmpty!44702 ((_ is ValueCellFull!13583) mapValue!44702)) b!1139057))

(assert (= (and b!1139064 ((_ is ValueCellFull!13583) mapDefault!44702)) b!1139067))

(assert (= start!98686 b!1139064))

(declare-fun b_lambda!19155 () Bool)

(assert (=> (not b_lambda!19155) (not b!1139073)))

(declare-fun t!35939 () Bool)

(declare-fun tb!8859 () Bool)

(assert (=> (and start!98686 (= defaultEntry!1004 defaultEntry!1004) t!35939) tb!8859))

(declare-fun result!18291 () Bool)

(assert (=> tb!8859 (= result!18291 tp_is_empty!28585)))

(assert (=> b!1139073 t!35939))

(declare-fun b_and!38963 () Bool)

(assert (= b_and!38961 (and (=> t!35939 result!18291) b_and!38963)))

(declare-fun m!1051347 () Bool)

(assert (=> b!1139063 m!1051347))

(declare-fun m!1051349 () Bool)

(assert (=> b!1139063 m!1051349))

(declare-fun m!1051351 () Bool)

(assert (=> b!1139061 m!1051351))

(declare-fun m!1051353 () Bool)

(assert (=> bm!50271 m!1051353))

(declare-fun m!1051355 () Bool)

(assert (=> b!1139045 m!1051355))

(declare-fun m!1051357 () Bool)

(assert (=> b!1139052 m!1051357))

(declare-fun m!1051359 () Bool)

(assert (=> b!1139068 m!1051359))

(declare-fun m!1051361 () Bool)

(assert (=> bm!50268 m!1051361))

(declare-fun m!1051363 () Bool)

(assert (=> bm!50264 m!1051363))

(declare-fun m!1051365 () Bool)

(assert (=> b!1139066 m!1051365))

(assert (=> b!1139066 m!1051353))

(declare-fun m!1051367 () Bool)

(assert (=> b!1139073 m!1051367))

(declare-fun m!1051369 () Bool)

(assert (=> b!1139073 m!1051369))

(declare-fun m!1051371 () Bool)

(assert (=> b!1139073 m!1051371))

(declare-fun m!1051373 () Bool)

(assert (=> b!1139073 m!1051373))

(declare-fun m!1051375 () Bool)

(assert (=> start!98686 m!1051375))

(declare-fun m!1051377 () Bool)

(assert (=> start!98686 m!1051377))

(declare-fun m!1051379 () Bool)

(assert (=> b!1139062 m!1051379))

(assert (=> b!1139062 m!1051379))

(declare-fun m!1051381 () Bool)

(assert (=> b!1139062 m!1051381))

(declare-fun m!1051383 () Bool)

(assert (=> b!1139062 m!1051383))

(declare-fun m!1051385 () Bool)

(assert (=> b!1139053 m!1051385))

(declare-fun m!1051387 () Bool)

(assert (=> bm!50265 m!1051387))

(assert (=> b!1139059 m!1051359))

(declare-fun m!1051389 () Bool)

(assert (=> b!1139047 m!1051389))

(declare-fun m!1051391 () Bool)

(assert (=> b!1139054 m!1051391))

(declare-fun m!1051393 () Bool)

(assert (=> b!1139054 m!1051393))

(declare-fun m!1051395 () Bool)

(assert (=> b!1139054 m!1051395))

(declare-fun m!1051397 () Bool)

(assert (=> b!1139054 m!1051397))

(declare-fun m!1051399 () Bool)

(assert (=> b!1139071 m!1051399))

(declare-fun m!1051401 () Bool)

(assert (=> b!1139071 m!1051401))

(declare-fun m!1051403 () Bool)

(assert (=> mapNonEmpty!44702 m!1051403))

(declare-fun m!1051405 () Bool)

(assert (=> bm!50269 m!1051405))

(declare-fun m!1051407 () Bool)

(assert (=> b!1139060 m!1051407))

(declare-fun m!1051409 () Bool)

(assert (=> b!1139046 m!1051409))

(declare-fun m!1051411 () Bool)

(assert (=> b!1139046 m!1051411))

(declare-fun m!1051413 () Bool)

(assert (=> b!1139051 m!1051413))

(check-sat (not bm!50265) (not b!1139046) (not b!1139052) (not b_lambda!19155) (not bm!50268) (not mapNonEmpty!44702) (not b!1139071) (not b!1139045) (not b!1139051) (not b!1139047) (not b!1139053) (not b!1139063) (not bm!50264) (not b!1139054) (not b!1139068) (not b!1139066) tp_is_empty!28585 (not bm!50269) (not b_next!24055) (not b!1139061) (not b!1139059) (not bm!50271) b_and!38963 (not b!1139073) (not start!98686) (not b!1139062))
(check-sat b_and!38963 (not b_next!24055))
