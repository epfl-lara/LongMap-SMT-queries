; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98588 () Bool)

(assert start!98588)

(declare-fun b_free!24199 () Bool)

(declare-fun b_next!24199 () Bool)

(assert (=> start!98588 (= b_free!24199 (not b_next!24199))))

(declare-fun tp!85307 () Bool)

(declare-fun b_and!39225 () Bool)

(assert (=> start!98588 (= tp!85307 b_and!39225)))

(declare-fun b!1144042 () Bool)

(declare-fun res!762084 () Bool)

(declare-fun e!650795 () Bool)

(assert (=> b!1144042 (=> (not res!762084) (not e!650795))))

(declare-datatypes ((array!74234 0))(
  ( (array!74235 (arr!35768 (Array (_ BitVec 32) (_ BitVec 64))) (size!36306 (_ BitVec 32))) )
))
(declare-fun lt!510273 () array!74234)

(declare-datatypes ((List!25086 0))(
  ( (Nil!25083) (Cons!25082 (h!26291 (_ BitVec 64)) (t!36268 List!25086)) )
))
(declare-fun arrayNoDuplicates!0 (array!74234 (_ BitVec 32) List!25086) Bool)

(assert (=> b!1144042 (= res!762084 (arrayNoDuplicates!0 lt!510273 #b00000000000000000000000000000000 Nil!25083))))

(declare-fun bm!51904 () Bool)

(declare-datatypes ((Unit!37406 0))(
  ( (Unit!37407) )
))
(declare-fun call!51908 () Unit!37406)

(declare-fun call!51907 () Unit!37406)

(assert (=> bm!51904 (= call!51908 call!51907)))

(declare-fun b!1144043 () Bool)

(declare-fun res!762083 () Bool)

(declare-fun e!650783 () Bool)

(assert (=> b!1144043 (=> (not res!762083) (not e!650783))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43433 0))(
  ( (V!43434 (val!14421 Int)) )
))
(declare-datatypes ((ValueCell!13655 0))(
  ( (ValueCellFull!13655 (v!17057 V!43433)) (EmptyCell!13655) )
))
(declare-datatypes ((array!74236 0))(
  ( (array!74237 (arr!35769 (Array (_ BitVec 32) ValueCell!13655)) (size!36307 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74236)

(declare-fun _keys!1208 () array!74234)

(assert (=> b!1144043 (= res!762083 (and (= (size!36307 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36306 _keys!1208) (size!36307 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!18350 0))(
  ( (tuple2!18351 (_1!9186 (_ BitVec 64)) (_2!9186 V!43433)) )
))
(declare-datatypes ((List!25087 0))(
  ( (Nil!25084) (Cons!25083 (h!26292 tuple2!18350) (t!36269 List!25087)) )
))
(declare-datatypes ((ListLongMap!16319 0))(
  ( (ListLongMap!16320 (toList!8175 List!25087)) )
))
(declare-fun lt!510276 () ListLongMap!16319)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1144045 () Bool)

(declare-fun e!650781 () Bool)

(declare-fun lt!510284 () ListLongMap!16319)

(declare-fun -!1251 (ListLongMap!16319 (_ BitVec 64)) ListLongMap!16319)

(assert (=> b!1144045 (= e!650781 (= (-!1251 lt!510284 k0!934) lt!510276))))

(declare-fun b!1144046 () Bool)

(declare-fun res!762090 () Bool)

(assert (=> b!1144046 (=> (not res!762090) (not e!650783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74234 (_ BitVec 32)) Bool)

(assert (=> b!1144046 (= res!762090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1144047 () Bool)

(declare-fun e!650793 () Bool)

(declare-fun tp_is_empty!28729 () Bool)

(assert (=> b!1144047 (= e!650793 tp_is_empty!28729)))

(declare-fun mapNonEmpty!44918 () Bool)

(declare-fun mapRes!44918 () Bool)

(declare-fun tp!85308 () Bool)

(declare-fun e!650780 () Bool)

(assert (=> mapNonEmpty!44918 (= mapRes!44918 (and tp!85308 e!650780))))

(declare-fun mapKey!44918 () (_ BitVec 32))

(declare-fun mapValue!44918 () ValueCell!13655)

(declare-fun mapRest!44918 () (Array (_ BitVec 32) ValueCell!13655))

(assert (=> mapNonEmpty!44918 (= (arr!35769 _values!996) (store mapRest!44918 mapKey!44918 mapValue!44918))))

(declare-fun c!112623 () Bool)

(declare-fun call!51910 () ListLongMap!16319)

(declare-fun lt!510282 () ListLongMap!16319)

(declare-fun bm!51905 () Bool)

(declare-fun call!51911 () Bool)

(declare-fun contains!6642 (ListLongMap!16319 (_ BitVec 64)) Bool)

(assert (=> bm!51905 (= call!51911 (contains!6642 (ite c!112623 lt!510282 call!51910) k0!934))))

(declare-fun b!1144048 () Bool)

(declare-fun call!51909 () ListLongMap!16319)

(assert (=> b!1144048 (contains!6642 call!51909 k0!934)))

(declare-fun lt!510288 () Unit!37406)

(assert (=> b!1144048 (= lt!510288 call!51907)))

(assert (=> b!1144048 call!51911))

(declare-fun zeroValue!944 () V!43433)

(declare-fun +!3597 (ListLongMap!16319 tuple2!18350) ListLongMap!16319)

(assert (=> b!1144048 (= lt!510282 (+!3597 lt!510276 (tuple2!18351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!510285 () Unit!37406)

(declare-fun addStillContains!811 (ListLongMap!16319 (_ BitVec 64) V!43433 (_ BitVec 64)) Unit!37406)

(assert (=> b!1144048 (= lt!510285 (addStillContains!811 lt!510276 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!650785 () Unit!37406)

(assert (=> b!1144048 (= e!650785 lt!510288)))

(declare-fun b!1144049 () Bool)

(declare-fun res!762086 () Bool)

(assert (=> b!1144049 (=> (not res!762086) (not e!650783))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144049 (= res!762086 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36306 _keys!1208))))))

(declare-fun mapIsEmpty!44918 () Bool)

(assert (=> mapIsEmpty!44918 mapRes!44918))

(declare-fun b!1144050 () Bool)

(assert (=> b!1144050 (= e!650783 e!650795)))

(declare-fun res!762085 () Bool)

(assert (=> b!1144050 (=> (not res!762085) (not e!650795))))

(assert (=> b!1144050 (= res!762085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510273 mask!1564))))

(assert (=> b!1144050 (= lt!510273 (array!74235 (store (arr!35768 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36306 _keys!1208)))))

(declare-fun b!1144051 () Bool)

(declare-fun e!650789 () Unit!37406)

(declare-fun Unit!37408 () Unit!37406)

(assert (=> b!1144051 (= e!650789 Unit!37408)))

(declare-fun b!1144052 () Bool)

(declare-fun e!650791 () Unit!37406)

(assert (=> b!1144052 (= e!650791 e!650789)))

(declare-fun c!112624 () Bool)

(declare-fun lt!510271 () Bool)

(assert (=> b!1144052 (= c!112624 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510271))))

(declare-fun call!51913 () ListLongMap!16319)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!51906 () Bool)

(declare-fun minValue!944 () V!43433)

(declare-fun lt!510283 () array!74236)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4664 (array!74234 array!74236 (_ BitVec 32) (_ BitVec 32) V!43433 V!43433 (_ BitVec 32) Int) ListLongMap!16319)

(assert (=> bm!51906 (= call!51913 (getCurrentListMapNoExtraKeys!4664 lt!510273 lt!510283 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144053 () Bool)

(declare-fun res!762089 () Bool)

(assert (=> b!1144053 (=> (not res!762089) (not e!650783))))

(assert (=> b!1144053 (= res!762089 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25083))))

(declare-fun b!1144054 () Bool)

(declare-fun res!762079 () Bool)

(assert (=> b!1144054 (=> (not res!762079) (not e!650783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144054 (= res!762079 (validMask!0 mask!1564))))

(declare-fun b!1144044 () Bool)

(declare-fun e!650788 () Bool)

(declare-fun e!650790 () Bool)

(assert (=> b!1144044 (= e!650788 e!650790)))

(declare-fun res!762081 () Bool)

(assert (=> b!1144044 (=> res!762081 e!650790)))

(assert (=> b!1144044 (= res!762081 (not (= (select (arr!35768 _keys!1208) from!1455) k0!934)))))

(declare-fun e!650787 () Bool)

(assert (=> b!1144044 e!650787))

(declare-fun c!112626 () Bool)

(assert (=> b!1144044 (= c!112626 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510268 () Unit!37406)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!531 (array!74234 array!74236 (_ BitVec 32) (_ BitVec 32) V!43433 V!43433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37406)

(assert (=> b!1144044 (= lt!510268 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!762087 () Bool)

(assert (=> start!98588 (=> (not res!762087) (not e!650783))))

(assert (=> start!98588 (= res!762087 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36306 _keys!1208))))))

(assert (=> start!98588 e!650783))

(assert (=> start!98588 tp_is_empty!28729))

(declare-fun array_inv!27484 (array!74234) Bool)

(assert (=> start!98588 (array_inv!27484 _keys!1208)))

(assert (=> start!98588 true))

(assert (=> start!98588 tp!85307))

(declare-fun e!650796 () Bool)

(declare-fun array_inv!27485 (array!74236) Bool)

(assert (=> start!98588 (and (array_inv!27485 _values!996) e!650796)))

(declare-fun b!1144055 () Bool)

(declare-fun e!650794 () Bool)

(assert (=> b!1144055 (= e!650795 (not e!650794))))

(declare-fun res!762078 () Bool)

(assert (=> b!1144055 (=> res!762078 e!650794)))

(assert (=> b!1144055 (= res!762078 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144055 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510287 () Unit!37406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74234 (_ BitVec 64) (_ BitVec 32)) Unit!37406)

(assert (=> b!1144055 (= lt!510287 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!51907 () Bool)

(declare-fun c!112625 () Bool)

(assert (=> bm!51907 (= call!51909 (+!3597 (ite c!112623 lt!510282 lt!510276) (ite c!112623 (tuple2!18351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112625 (tuple2!18351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1144056 () Bool)

(declare-fun e!650786 () Bool)

(assert (=> b!1144056 (= e!650786 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510271) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!51908 () Bool)

(declare-fun call!51912 () Bool)

(assert (=> bm!51908 (= call!51912 call!51911)))

(declare-fun b!1144057 () Bool)

(assert (=> b!1144057 (= e!650780 tp_is_empty!28729)))

(declare-fun b!1144058 () Bool)

(assert (=> b!1144058 (= e!650794 e!650788)))

(declare-fun res!762088 () Bool)

(assert (=> b!1144058 (=> res!762088 e!650788)))

(assert (=> b!1144058 (= res!762088 (not (= from!1455 i!673)))))

(declare-fun lt!510280 () ListLongMap!16319)

(assert (=> b!1144058 (= lt!510280 (getCurrentListMapNoExtraKeys!4664 lt!510273 lt!510283 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!510269 () V!43433)

(assert (=> b!1144058 (= lt!510283 (array!74237 (store (arr!35769 _values!996) i!673 (ValueCellFull!13655 lt!510269)) (size!36307 _values!996)))))

(declare-fun dynLambda!2639 (Int (_ BitVec 64)) V!43433)

(assert (=> b!1144058 (= lt!510269 (dynLambda!2639 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1144058 (= lt!510284 (getCurrentListMapNoExtraKeys!4664 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1144059 () Bool)

(assert (=> b!1144059 (= e!650790 true)))

(assert (=> b!1144059 e!650781))

(declare-fun res!762082 () Bool)

(assert (=> b!1144059 (=> (not res!762082) (not e!650781))))

(declare-fun lt!510278 () V!43433)

(assert (=> b!1144059 (= res!762082 (= (-!1251 (+!3597 lt!510276 (tuple2!18351 (select (arr!35768 _keys!1208) from!1455) lt!510278)) (select (arr!35768 _keys!1208) from!1455)) lt!510276))))

(declare-fun lt!510274 () Unit!37406)

(declare-fun addThenRemoveForNewKeyIsSame!117 (ListLongMap!16319 (_ BitVec 64) V!43433) Unit!37406)

(assert (=> b!1144059 (= lt!510274 (addThenRemoveForNewKeyIsSame!117 lt!510276 (select (arr!35768 _keys!1208) from!1455) lt!510278))))

(declare-fun get!18197 (ValueCell!13655 V!43433) V!43433)

(assert (=> b!1144059 (= lt!510278 (get!18197 (select (arr!35769 _values!996) from!1455) lt!510269))))

(declare-fun lt!510279 () Unit!37406)

(declare-fun e!650792 () Unit!37406)

(assert (=> b!1144059 (= lt!510279 e!650792)))

(declare-fun c!112627 () Bool)

(assert (=> b!1144059 (= c!112627 (contains!6642 lt!510276 k0!934))))

(assert (=> b!1144059 (= lt!510276 (getCurrentListMapNoExtraKeys!4664 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144060 () Bool)

(assert (=> b!1144060 (= e!650786 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144061 () Bool)

(declare-fun Unit!37409 () Unit!37406)

(assert (=> b!1144061 (= e!650792 Unit!37409)))

(assert (=> b!1144061 (= lt!510271 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1144061 (= c!112623 (and (not lt!510271) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510272 () Unit!37406)

(assert (=> b!1144061 (= lt!510272 e!650785)))

(declare-fun lt!510281 () Unit!37406)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!406 (array!74234 array!74236 (_ BitVec 32) (_ BitVec 32) V!43433 V!43433 (_ BitVec 64) (_ BitVec 32) Int) Unit!37406)

(assert (=> b!1144061 (= lt!510281 (lemmaListMapContainsThenArrayContainsFrom!406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112628 () Bool)

(assert (=> b!1144061 (= c!112628 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762091 () Bool)

(assert (=> b!1144061 (= res!762091 e!650786)))

(declare-fun e!650784 () Bool)

(assert (=> b!1144061 (=> (not res!762091) (not e!650784))))

(assert (=> b!1144061 e!650784))

(declare-fun lt!510275 () Unit!37406)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74234 (_ BitVec 32) (_ BitVec 32)) Unit!37406)

(assert (=> b!1144061 (= lt!510275 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1144061 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25083)))

(declare-fun lt!510270 () Unit!37406)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74234 (_ BitVec 64) (_ BitVec 32) List!25086) Unit!37406)

(assert (=> b!1144061 (= lt!510270 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25083))))

(assert (=> b!1144061 false))

(declare-fun bm!51909 () Bool)

(assert (=> bm!51909 (= call!51907 (addStillContains!811 (ite c!112623 lt!510282 lt!510276) (ite c!112623 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112623 minValue!944 (ite c!112625 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1144062 () Bool)

(declare-fun res!762080 () Bool)

(assert (=> b!1144062 (=> (not res!762080) (not e!650783))))

(assert (=> b!1144062 (= res!762080 (= (select (arr!35768 _keys!1208) i!673) k0!934))))

(declare-fun b!1144063 () Bool)

(declare-fun Unit!37410 () Unit!37406)

(assert (=> b!1144063 (= e!650792 Unit!37410)))

(declare-fun bm!51910 () Bool)

(assert (=> bm!51910 (= call!51910 call!51909)))

(declare-fun b!1144064 () Bool)

(assert (=> b!1144064 (= e!650796 (and e!650793 mapRes!44918))))

(declare-fun condMapEmpty!44918 () Bool)

(declare-fun mapDefault!44918 () ValueCell!13655)

(assert (=> b!1144064 (= condMapEmpty!44918 (= (arr!35769 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13655)) mapDefault!44918)))))

(declare-fun b!1144065 () Bool)

(declare-fun res!762092 () Bool)

(assert (=> b!1144065 (=> (not res!762092) (not e!650783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144065 (= res!762092 (validKeyInArray!0 k0!934))))

(declare-fun b!1144066 () Bool)

(declare-fun call!51914 () ListLongMap!16319)

(assert (=> b!1144066 (= e!650787 (= call!51913 call!51914))))

(declare-fun bm!51911 () Bool)

(assert (=> bm!51911 (= call!51914 (getCurrentListMapNoExtraKeys!4664 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144067 () Bool)

(assert (=> b!1144067 (= e!650784 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144068 () Bool)

(assert (=> b!1144068 call!51912))

(declare-fun lt!510286 () Unit!37406)

(assert (=> b!1144068 (= lt!510286 call!51908)))

(assert (=> b!1144068 (= e!650789 lt!510286)))

(declare-fun b!1144069 () Bool)

(declare-fun lt!510277 () Unit!37406)

(assert (=> b!1144069 (= e!650791 lt!510277)))

(assert (=> b!1144069 (= lt!510277 call!51908)))

(assert (=> b!1144069 call!51912))

(declare-fun b!1144070 () Bool)

(assert (=> b!1144070 (= e!650787 (= call!51913 (-!1251 call!51914 k0!934)))))

(declare-fun b!1144071 () Bool)

(assert (=> b!1144071 (= c!112625 (and (not lt!510271) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1144071 (= e!650785 e!650791)))

(assert (= (and start!98588 res!762087) b!1144054))

(assert (= (and b!1144054 res!762079) b!1144043))

(assert (= (and b!1144043 res!762083) b!1144046))

(assert (= (and b!1144046 res!762090) b!1144053))

(assert (= (and b!1144053 res!762089) b!1144049))

(assert (= (and b!1144049 res!762086) b!1144065))

(assert (= (and b!1144065 res!762092) b!1144062))

(assert (= (and b!1144062 res!762080) b!1144050))

(assert (= (and b!1144050 res!762085) b!1144042))

(assert (= (and b!1144042 res!762084) b!1144055))

(assert (= (and b!1144055 (not res!762078)) b!1144058))

(assert (= (and b!1144058 (not res!762088)) b!1144044))

(assert (= (and b!1144044 c!112626) b!1144070))

(assert (= (and b!1144044 (not c!112626)) b!1144066))

(assert (= (or b!1144070 b!1144066) bm!51906))

(assert (= (or b!1144070 b!1144066) bm!51911))

(assert (= (and b!1144044 (not res!762081)) b!1144059))

(assert (= (and b!1144059 c!112627) b!1144061))

(assert (= (and b!1144059 (not c!112627)) b!1144063))

(assert (= (and b!1144061 c!112623) b!1144048))

(assert (= (and b!1144061 (not c!112623)) b!1144071))

(assert (= (and b!1144071 c!112625) b!1144069))

(assert (= (and b!1144071 (not c!112625)) b!1144052))

(assert (= (and b!1144052 c!112624) b!1144068))

(assert (= (and b!1144052 (not c!112624)) b!1144051))

(assert (= (or b!1144069 b!1144068) bm!51904))

(assert (= (or b!1144069 b!1144068) bm!51910))

(assert (= (or b!1144069 b!1144068) bm!51908))

(assert (= (or b!1144048 bm!51908) bm!51905))

(assert (= (or b!1144048 bm!51904) bm!51909))

(assert (= (or b!1144048 bm!51910) bm!51907))

(assert (= (and b!1144061 c!112628) b!1144060))

(assert (= (and b!1144061 (not c!112628)) b!1144056))

(assert (= (and b!1144061 res!762091) b!1144067))

(assert (= (and b!1144059 res!762082) b!1144045))

(assert (= (and b!1144064 condMapEmpty!44918) mapIsEmpty!44918))

(assert (= (and b!1144064 (not condMapEmpty!44918)) mapNonEmpty!44918))

(get-info :version)

(assert (= (and mapNonEmpty!44918 ((_ is ValueCellFull!13655) mapValue!44918)) b!1144057))

(assert (= (and b!1144064 ((_ is ValueCellFull!13655) mapDefault!44918)) b!1144047))

(assert (= start!98588 b!1144064))

(declare-fun b_lambda!19287 () Bool)

(assert (=> (not b_lambda!19287) (not b!1144058)))

(declare-fun t!36267 () Bool)

(declare-fun tb!9003 () Bool)

(assert (=> (and start!98588 (= defaultEntry!1004 defaultEntry!1004) t!36267) tb!9003))

(declare-fun result!18579 () Bool)

(assert (=> tb!9003 (= result!18579 tp_is_empty!28729)))

(assert (=> b!1144058 t!36267))

(declare-fun b_and!39227 () Bool)

(assert (= b_and!39225 (and (=> t!36267 result!18579) b_and!39227)))

(declare-fun m!1054619 () Bool)

(assert (=> b!1144045 m!1054619))

(declare-fun m!1054621 () Bool)

(assert (=> b!1144062 m!1054621))

(declare-fun m!1054623 () Bool)

(assert (=> b!1144054 m!1054623))

(declare-fun m!1054625 () Bool)

(assert (=> b!1144044 m!1054625))

(declare-fun m!1054627 () Bool)

(assert (=> b!1144044 m!1054627))

(declare-fun m!1054629 () Bool)

(assert (=> b!1144046 m!1054629))

(declare-fun m!1054631 () Bool)

(assert (=> bm!51911 m!1054631))

(declare-fun m!1054633 () Bool)

(assert (=> b!1144042 m!1054633))

(declare-fun m!1054635 () Bool)

(assert (=> bm!51909 m!1054635))

(declare-fun m!1054637 () Bool)

(assert (=> b!1144050 m!1054637))

(declare-fun m!1054639 () Bool)

(assert (=> b!1144050 m!1054639))

(assert (=> b!1144059 m!1054631))

(declare-fun m!1054641 () Bool)

(assert (=> b!1144059 m!1054641))

(declare-fun m!1054643 () Bool)

(assert (=> b!1144059 m!1054643))

(assert (=> b!1144059 m!1054641))

(declare-fun m!1054645 () Bool)

(assert (=> b!1144059 m!1054645))

(assert (=> b!1144059 m!1054625))

(assert (=> b!1144059 m!1054645))

(assert (=> b!1144059 m!1054625))

(declare-fun m!1054647 () Bool)

(assert (=> b!1144059 m!1054647))

(assert (=> b!1144059 m!1054625))

(declare-fun m!1054649 () Bool)

(assert (=> b!1144059 m!1054649))

(declare-fun m!1054651 () Bool)

(assert (=> b!1144059 m!1054651))

(declare-fun m!1054653 () Bool)

(assert (=> b!1144048 m!1054653))

(declare-fun m!1054655 () Bool)

(assert (=> b!1144048 m!1054655))

(declare-fun m!1054657 () Bool)

(assert (=> b!1144048 m!1054657))

(declare-fun m!1054659 () Bool)

(assert (=> b!1144070 m!1054659))

(declare-fun m!1054661 () Bool)

(assert (=> b!1144067 m!1054661))

(declare-fun m!1054663 () Bool)

(assert (=> b!1144058 m!1054663))

(declare-fun m!1054665 () Bool)

(assert (=> b!1144058 m!1054665))

(declare-fun m!1054667 () Bool)

(assert (=> b!1144058 m!1054667))

(declare-fun m!1054669 () Bool)

(assert (=> b!1144058 m!1054669))

(declare-fun m!1054671 () Bool)

(assert (=> bm!51906 m!1054671))

(declare-fun m!1054673 () Bool)

(assert (=> start!98588 m!1054673))

(declare-fun m!1054675 () Bool)

(assert (=> start!98588 m!1054675))

(declare-fun m!1054677 () Bool)

(assert (=> b!1144061 m!1054677))

(declare-fun m!1054679 () Bool)

(assert (=> b!1144061 m!1054679))

(declare-fun m!1054681 () Bool)

(assert (=> b!1144061 m!1054681))

(declare-fun m!1054683 () Bool)

(assert (=> b!1144061 m!1054683))

(declare-fun m!1054685 () Bool)

(assert (=> b!1144055 m!1054685))

(declare-fun m!1054687 () Bool)

(assert (=> b!1144055 m!1054687))

(declare-fun m!1054689 () Bool)

(assert (=> b!1144065 m!1054689))

(declare-fun m!1054691 () Bool)

(assert (=> mapNonEmpty!44918 m!1054691))

(declare-fun m!1054693 () Bool)

(assert (=> bm!51905 m!1054693))

(declare-fun m!1054695 () Bool)

(assert (=> bm!51907 m!1054695))

(assert (=> b!1144060 m!1054661))

(declare-fun m!1054697 () Bool)

(assert (=> b!1144053 m!1054697))

(check-sat (not b!1144065) (not start!98588) (not b!1144059) tp_is_empty!28729 (not bm!51905) (not b!1144048) (not b!1144061) (not b!1144055) (not bm!51909) (not b_lambda!19287) (not b!1144060) (not b!1144042) b_and!39227 (not bm!51911) (not b!1144046) (not b!1144070) (not b!1144050) (not bm!51907) (not b!1144044) (not b!1144054) (not b!1144045) (not b!1144053) (not b_next!24199) (not b!1144067) (not mapNonEmpty!44918) (not bm!51906) (not b!1144058))
(check-sat b_and!39227 (not b_next!24199))
