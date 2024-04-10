; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98614 () Bool)

(assert start!98614)

(declare-fun b_free!24219 () Bool)

(declare-fun b_next!24219 () Bool)

(assert (=> start!98614 (= b_free!24219 (not b_next!24219))))

(declare-fun tp!85368 () Bool)

(declare-fun b_and!39287 () Bool)

(assert (=> start!98614 (= tp!85368 b_and!39287)))

(declare-fun b!1145086 () Bool)

(declare-fun e!651375 () Bool)

(assert (=> b!1145086 (= e!651375 true)))

(declare-fun e!651372 () Bool)

(assert (=> b!1145086 e!651372))

(declare-fun res!762594 () Bool)

(assert (=> b!1145086 (=> (not res!762594) (not e!651372))))

(declare-datatypes ((array!74349 0))(
  ( (array!74350 (arr!35825 (Array (_ BitVec 32) (_ BitVec 64))) (size!36361 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74349)

(declare-datatypes ((V!43459 0))(
  ( (V!43460 (val!14431 Int)) )
))
(declare-datatypes ((tuple2!18276 0))(
  ( (tuple2!18277 (_1!9149 (_ BitVec 64)) (_2!9149 V!43459)) )
))
(declare-datatypes ((List!25029 0))(
  ( (Nil!25026) (Cons!25025 (h!26234 tuple2!18276) (t!36240 List!25029)) )
))
(declare-datatypes ((ListLongMap!16245 0))(
  ( (ListLongMap!16246 (toList!8138 List!25029)) )
))
(declare-fun lt!511110 () ListLongMap!16245)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!511105 () V!43459)

(declare-fun -!1280 (ListLongMap!16245 (_ BitVec 64)) ListLongMap!16245)

(declare-fun +!3564 (ListLongMap!16245 tuple2!18276) ListLongMap!16245)

(assert (=> b!1145086 (= res!762594 (= (-!1280 (+!3564 lt!511110 (tuple2!18277 (select (arr!35825 _keys!1208) from!1455) lt!511105)) (select (arr!35825 _keys!1208) from!1455)) lt!511110))))

(declare-datatypes ((Unit!37588 0))(
  ( (Unit!37589) )
))
(declare-fun lt!511104 () Unit!37588)

(declare-fun addThenRemoveForNewKeyIsSame!130 (ListLongMap!16245 (_ BitVec 64) V!43459) Unit!37588)

(assert (=> b!1145086 (= lt!511104 (addThenRemoveForNewKeyIsSame!130 lt!511110 (select (arr!35825 _keys!1208) from!1455) lt!511105))))

(declare-datatypes ((ValueCell!13665 0))(
  ( (ValueCellFull!13665 (v!17068 V!43459)) (EmptyCell!13665) )
))
(declare-datatypes ((array!74351 0))(
  ( (array!74352 (arr!35826 (Array (_ BitVec 32) ValueCell!13665)) (size!36362 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74351)

(declare-fun lt!511094 () V!43459)

(declare-fun get!18216 (ValueCell!13665 V!43459) V!43459)

(assert (=> b!1145086 (= lt!511105 (get!18216 (select (arr!35826 _values!996) from!1455) lt!511094))))

(declare-fun lt!511090 () Unit!37588)

(declare-fun e!651383 () Unit!37588)

(assert (=> b!1145086 (= lt!511090 e!651383)))

(declare-fun c!112831 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6667 (ListLongMap!16245 (_ BitVec 64)) Bool)

(assert (=> b!1145086 (= c!112831 (contains!6667 lt!511110 k0!934))))

(declare-fun zeroValue!944 () V!43459)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43459)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4615 (array!74349 array!74351 (_ BitVec 32) (_ BitVec 32) V!43459 V!43459 (_ BitVec 32) Int) ListLongMap!16245)

(assert (=> b!1145086 (= lt!511110 (getCurrentListMapNoExtraKeys!4615 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145087 () Bool)

(declare-fun res!762603 () Bool)

(declare-fun e!651376 () Bool)

(assert (=> b!1145087 (=> (not res!762603) (not e!651376))))

(assert (=> b!1145087 (= res!762603 (and (= (size!36362 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36361 _keys!1208) (size!36362 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145088 () Bool)

(declare-fun Unit!37590 () Unit!37588)

(assert (=> b!1145088 (= e!651383 Unit!37590)))

(declare-fun mapIsEmpty!44948 () Bool)

(declare-fun mapRes!44948 () Bool)

(assert (=> mapIsEmpty!44948 mapRes!44948))

(declare-fun b!1145089 () Bool)

(declare-fun lt!511103 () Bool)

(declare-fun e!651379 () Bool)

(assert (=> b!1145089 (= e!651379 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511103) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1145090 () Bool)

(declare-fun call!52173 () Bool)

(assert (=> b!1145090 call!52173))

(declare-fun lt!511096 () Unit!37588)

(declare-fun call!52175 () Unit!37588)

(assert (=> b!1145090 (= lt!511096 call!52175)))

(declare-fun e!651369 () Unit!37588)

(assert (=> b!1145090 (= e!651369 lt!511096)))

(declare-fun b!1145091 () Bool)

(declare-fun arrayContainsKey!0 (array!74349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145091 (= e!651379 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145092 () Bool)

(declare-fun Unit!37591 () Unit!37588)

(assert (=> b!1145092 (= e!651369 Unit!37591)))

(declare-fun b!1145093 () Bool)

(declare-fun e!651371 () Bool)

(declare-fun tp_is_empty!28749 () Bool)

(assert (=> b!1145093 (= e!651371 tp_is_empty!28749)))

(declare-fun bm!52167 () Bool)

(declare-fun call!52174 () ListLongMap!16245)

(assert (=> bm!52167 (= call!52174 (getCurrentListMapNoExtraKeys!4615 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52168 () Bool)

(declare-fun call!52172 () Unit!37588)

(assert (=> bm!52168 (= call!52175 call!52172)))

(declare-fun b!1145094 () Bool)

(declare-fun res!762608 () Bool)

(assert (=> b!1145094 (=> (not res!762608) (not e!651376))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145094 (= res!762608 (= (select (arr!35825 _keys!1208) i!673) k0!934))))

(declare-fun bm!52169 () Bool)

(declare-fun call!52177 () Bool)

(assert (=> bm!52169 (= call!52173 call!52177)))

(declare-fun b!1145095 () Bool)

(declare-fun c!112830 () Bool)

(assert (=> b!1145095 (= c!112830 (and (not lt!511103) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!651381 () Unit!37588)

(declare-fun e!651373 () Unit!37588)

(assert (=> b!1145095 (= e!651381 e!651373)))

(declare-fun b!1145096 () Bool)

(declare-fun e!651377 () Bool)

(declare-fun call!52176 () ListLongMap!16245)

(assert (=> b!1145096 (= e!651377 (= call!52176 call!52174))))

(declare-fun c!112829 () Bool)

(declare-fun bm!52170 () Bool)

(declare-fun lt!511099 () ListLongMap!16245)

(declare-fun call!52171 () ListLongMap!16245)

(assert (=> bm!52170 (= call!52171 (+!3564 (ite c!112829 lt!511099 lt!511110) (ite c!112829 (tuple2!18277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112830 (tuple2!18277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!762595 () Bool)

(assert (=> start!98614 (=> (not res!762595) (not e!651376))))

(assert (=> start!98614 (= res!762595 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36361 _keys!1208))))))

(assert (=> start!98614 e!651376))

(assert (=> start!98614 tp_is_empty!28749))

(declare-fun array_inv!27448 (array!74349) Bool)

(assert (=> start!98614 (array_inv!27448 _keys!1208)))

(assert (=> start!98614 true))

(assert (=> start!98614 tp!85368))

(declare-fun e!651382 () Bool)

(declare-fun array_inv!27449 (array!74351) Bool)

(assert (=> start!98614 (and (array_inv!27449 _values!996) e!651382)))

(declare-fun bm!52171 () Bool)

(declare-fun call!52170 () ListLongMap!16245)

(assert (=> bm!52171 (= call!52170 call!52171)))

(declare-fun b!1145097 () Bool)

(declare-fun lt!511106 () Unit!37588)

(assert (=> b!1145097 (= e!651373 lt!511106)))

(assert (=> b!1145097 (= lt!511106 call!52175)))

(assert (=> b!1145097 call!52173))

(declare-fun lt!511107 () array!74351)

(declare-fun lt!511102 () array!74349)

(declare-fun bm!52172 () Bool)

(assert (=> bm!52172 (= call!52176 (getCurrentListMapNoExtraKeys!4615 lt!511102 lt!511107 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145098 () Bool)

(declare-fun res!762598 () Bool)

(assert (=> b!1145098 (=> (not res!762598) (not e!651376))))

(declare-datatypes ((List!25030 0))(
  ( (Nil!25027) (Cons!25026 (h!26235 (_ BitVec 64)) (t!36241 List!25030)) )
))
(declare-fun arrayNoDuplicates!0 (array!74349 (_ BitVec 32) List!25030) Bool)

(assert (=> b!1145098 (= res!762598 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25027))))

(declare-fun b!1145099 () Bool)

(declare-fun lt!511092 () ListLongMap!16245)

(assert (=> b!1145099 (= e!651372 (= (-!1280 lt!511092 k0!934) lt!511110))))

(declare-fun mapNonEmpty!44948 () Bool)

(declare-fun tp!85367 () Bool)

(assert (=> mapNonEmpty!44948 (= mapRes!44948 (and tp!85367 e!651371))))

(declare-fun mapKey!44948 () (_ BitVec 32))

(declare-fun mapRest!44948 () (Array (_ BitVec 32) ValueCell!13665))

(declare-fun mapValue!44948 () ValueCell!13665)

(assert (=> mapNonEmpty!44948 (= (arr!35826 _values!996) (store mapRest!44948 mapKey!44948 mapValue!44948))))

(declare-fun b!1145100 () Bool)

(assert (=> b!1145100 (contains!6667 call!52171 k0!934)))

(declare-fun lt!511100 () Unit!37588)

(declare-fun addStillContains!819 (ListLongMap!16245 (_ BitVec 64) V!43459 (_ BitVec 64)) Unit!37588)

(assert (=> b!1145100 (= lt!511100 (addStillContains!819 lt!511099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1145100 call!52177))

(assert (=> b!1145100 (= lt!511099 (+!3564 lt!511110 (tuple2!18277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511109 () Unit!37588)

(assert (=> b!1145100 (= lt!511109 call!52172)))

(assert (=> b!1145100 (= e!651381 lt!511100)))

(declare-fun b!1145101 () Bool)

(assert (=> b!1145101 (= e!651377 (= call!52176 (-!1280 call!52174 k0!934)))))

(declare-fun bm!52173 () Bool)

(assert (=> bm!52173 (= call!52177 (contains!6667 (ite c!112829 lt!511099 call!52170) k0!934))))

(declare-fun bm!52174 () Bool)

(assert (=> bm!52174 (= call!52172 (addStillContains!819 lt!511110 (ite (or c!112829 c!112830) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112829 c!112830) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1145102 () Bool)

(declare-fun e!651370 () Bool)

(assert (=> b!1145102 (= e!651376 e!651370)))

(declare-fun res!762600 () Bool)

(assert (=> b!1145102 (=> (not res!762600) (not e!651370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74349 (_ BitVec 32)) Bool)

(assert (=> b!1145102 (= res!762600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511102 mask!1564))))

(assert (=> b!1145102 (= lt!511102 (array!74350 (store (arr!35825 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36361 _keys!1208)))))

(declare-fun b!1145103 () Bool)

(declare-fun res!762605 () Bool)

(assert (=> b!1145103 (=> (not res!762605) (not e!651376))))

(assert (=> b!1145103 (= res!762605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1145104 () Bool)

(declare-fun e!651384 () Bool)

(assert (=> b!1145104 (= e!651370 (not e!651384))))

(declare-fun res!762602 () Bool)

(assert (=> b!1145104 (=> res!762602 e!651384)))

(assert (=> b!1145104 (= res!762602 (bvsgt from!1455 i!673))))

(assert (=> b!1145104 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511091 () Unit!37588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74349 (_ BitVec 64) (_ BitVec 32)) Unit!37588)

(assert (=> b!1145104 (= lt!511091 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1145105 () Bool)

(declare-fun res!762607 () Bool)

(assert (=> b!1145105 (=> (not res!762607) (not e!651376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145105 (= res!762607 (validKeyInArray!0 k0!934))))

(declare-fun b!1145106 () Bool)

(declare-fun e!651380 () Bool)

(assert (=> b!1145106 (= e!651380 e!651375)))

(declare-fun res!762597 () Bool)

(assert (=> b!1145106 (=> res!762597 e!651375)))

(assert (=> b!1145106 (= res!762597 (not (= (select (arr!35825 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1145106 e!651377))

(declare-fun c!112832 () Bool)

(assert (=> b!1145106 (= c!112832 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511101 () Unit!37588)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!520 (array!74349 array!74351 (_ BitVec 32) (_ BitVec 32) V!43459 V!43459 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37588)

(assert (=> b!1145106 (= lt!511101 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145107 () Bool)

(declare-fun e!651378 () Bool)

(assert (=> b!1145107 (= e!651382 (and e!651378 mapRes!44948))))

(declare-fun condMapEmpty!44948 () Bool)

(declare-fun mapDefault!44948 () ValueCell!13665)

(assert (=> b!1145107 (= condMapEmpty!44948 (= (arr!35826 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13665)) mapDefault!44948)))))

(declare-fun b!1145108 () Bool)

(declare-fun res!762604 () Bool)

(assert (=> b!1145108 (=> (not res!762604) (not e!651376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145108 (= res!762604 (validMask!0 mask!1564))))

(declare-fun b!1145109 () Bool)

(declare-fun e!651368 () Bool)

(assert (=> b!1145109 (= e!651368 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145110 () Bool)

(assert (=> b!1145110 (= e!651384 e!651380)))

(declare-fun res!762601 () Bool)

(assert (=> b!1145110 (=> res!762601 e!651380)))

(assert (=> b!1145110 (= res!762601 (not (= from!1455 i!673)))))

(declare-fun lt!511108 () ListLongMap!16245)

(assert (=> b!1145110 (= lt!511108 (getCurrentListMapNoExtraKeys!4615 lt!511102 lt!511107 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1145110 (= lt!511107 (array!74352 (store (arr!35826 _values!996) i!673 (ValueCellFull!13665 lt!511094)) (size!36362 _values!996)))))

(declare-fun dynLambda!2651 (Int (_ BitVec 64)) V!43459)

(assert (=> b!1145110 (= lt!511094 (dynLambda!2651 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1145110 (= lt!511092 (getCurrentListMapNoExtraKeys!4615 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1145111 () Bool)

(declare-fun res!762606 () Bool)

(assert (=> b!1145111 (=> (not res!762606) (not e!651370))))

(assert (=> b!1145111 (= res!762606 (arrayNoDuplicates!0 lt!511102 #b00000000000000000000000000000000 Nil!25027))))

(declare-fun b!1145112 () Bool)

(declare-fun Unit!37592 () Unit!37588)

(assert (=> b!1145112 (= e!651383 Unit!37592)))

(assert (=> b!1145112 (= lt!511103 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1145112 (= c!112829 (and (not lt!511103) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511093 () Unit!37588)

(assert (=> b!1145112 (= lt!511093 e!651381)))

(declare-fun lt!511097 () Unit!37588)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!413 (array!74349 array!74351 (_ BitVec 32) (_ BitVec 32) V!43459 V!43459 (_ BitVec 64) (_ BitVec 32) Int) Unit!37588)

(assert (=> b!1145112 (= lt!511097 (lemmaListMapContainsThenArrayContainsFrom!413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112833 () Bool)

(assert (=> b!1145112 (= c!112833 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762596 () Bool)

(assert (=> b!1145112 (= res!762596 e!651379)))

(assert (=> b!1145112 (=> (not res!762596) (not e!651368))))

(assert (=> b!1145112 e!651368))

(declare-fun lt!511098 () Unit!37588)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74349 (_ BitVec 32) (_ BitVec 32)) Unit!37588)

(assert (=> b!1145112 (= lt!511098 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1145112 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25027)))

(declare-fun lt!511095 () Unit!37588)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74349 (_ BitVec 64) (_ BitVec 32) List!25030) Unit!37588)

(assert (=> b!1145112 (= lt!511095 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25027))))

(assert (=> b!1145112 false))

(declare-fun b!1145113 () Bool)

(declare-fun res!762599 () Bool)

(assert (=> b!1145113 (=> (not res!762599) (not e!651376))))

(assert (=> b!1145113 (= res!762599 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36361 _keys!1208))))))

(declare-fun b!1145114 () Bool)

(assert (=> b!1145114 (= e!651373 e!651369)))

(declare-fun c!112834 () Bool)

(assert (=> b!1145114 (= c!112834 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511103))))

(declare-fun b!1145115 () Bool)

(assert (=> b!1145115 (= e!651378 tp_is_empty!28749)))

(assert (= (and start!98614 res!762595) b!1145108))

(assert (= (and b!1145108 res!762604) b!1145087))

(assert (= (and b!1145087 res!762603) b!1145103))

(assert (= (and b!1145103 res!762605) b!1145098))

(assert (= (and b!1145098 res!762598) b!1145113))

(assert (= (and b!1145113 res!762599) b!1145105))

(assert (= (and b!1145105 res!762607) b!1145094))

(assert (= (and b!1145094 res!762608) b!1145102))

(assert (= (and b!1145102 res!762600) b!1145111))

(assert (= (and b!1145111 res!762606) b!1145104))

(assert (= (and b!1145104 (not res!762602)) b!1145110))

(assert (= (and b!1145110 (not res!762601)) b!1145106))

(assert (= (and b!1145106 c!112832) b!1145101))

(assert (= (and b!1145106 (not c!112832)) b!1145096))

(assert (= (or b!1145101 b!1145096) bm!52172))

(assert (= (or b!1145101 b!1145096) bm!52167))

(assert (= (and b!1145106 (not res!762597)) b!1145086))

(assert (= (and b!1145086 c!112831) b!1145112))

(assert (= (and b!1145086 (not c!112831)) b!1145088))

(assert (= (and b!1145112 c!112829) b!1145100))

(assert (= (and b!1145112 (not c!112829)) b!1145095))

(assert (= (and b!1145095 c!112830) b!1145097))

(assert (= (and b!1145095 (not c!112830)) b!1145114))

(assert (= (and b!1145114 c!112834) b!1145090))

(assert (= (and b!1145114 (not c!112834)) b!1145092))

(assert (= (or b!1145097 b!1145090) bm!52168))

(assert (= (or b!1145097 b!1145090) bm!52171))

(assert (= (or b!1145097 b!1145090) bm!52169))

(assert (= (or b!1145100 bm!52169) bm!52173))

(assert (= (or b!1145100 bm!52168) bm!52174))

(assert (= (or b!1145100 bm!52171) bm!52170))

(assert (= (and b!1145112 c!112833) b!1145091))

(assert (= (and b!1145112 (not c!112833)) b!1145089))

(assert (= (and b!1145112 res!762596) b!1145109))

(assert (= (and b!1145086 res!762594) b!1145099))

(assert (= (and b!1145107 condMapEmpty!44948) mapIsEmpty!44948))

(assert (= (and b!1145107 (not condMapEmpty!44948)) mapNonEmpty!44948))

(get-info :version)

(assert (= (and mapNonEmpty!44948 ((_ is ValueCellFull!13665) mapValue!44948)) b!1145093))

(assert (= (and b!1145107 ((_ is ValueCellFull!13665) mapDefault!44948)) b!1145115))

(assert (= start!98614 b!1145107))

(declare-fun b_lambda!19325 () Bool)

(assert (=> (not b_lambda!19325) (not b!1145110)))

(declare-fun t!36239 () Bool)

(declare-fun tb!9031 () Bool)

(assert (=> (and start!98614 (= defaultEntry!1004 defaultEntry!1004) t!36239) tb!9031))

(declare-fun result!18627 () Bool)

(assert (=> tb!9031 (= result!18627 tp_is_empty!28749)))

(assert (=> b!1145110 t!36239))

(declare-fun b_and!39289 () Bool)

(assert (= b_and!39287 (and (=> t!36239 result!18627) b_and!39289)))

(declare-fun m!1056019 () Bool)

(assert (=> b!1145098 m!1056019))

(declare-fun m!1056021 () Bool)

(assert (=> b!1145100 m!1056021))

(declare-fun m!1056023 () Bool)

(assert (=> b!1145100 m!1056023))

(declare-fun m!1056025 () Bool)

(assert (=> b!1145100 m!1056025))

(declare-fun m!1056027 () Bool)

(assert (=> b!1145106 m!1056027))

(declare-fun m!1056029 () Bool)

(assert (=> b!1145106 m!1056029))

(declare-fun m!1056031 () Bool)

(assert (=> b!1145104 m!1056031))

(declare-fun m!1056033 () Bool)

(assert (=> b!1145104 m!1056033))

(declare-fun m!1056035 () Bool)

(assert (=> b!1145109 m!1056035))

(declare-fun m!1056037 () Bool)

(assert (=> b!1145101 m!1056037))

(declare-fun m!1056039 () Bool)

(assert (=> bm!52173 m!1056039))

(declare-fun m!1056041 () Bool)

(assert (=> bm!52170 m!1056041))

(declare-fun m!1056043 () Bool)

(assert (=> start!98614 m!1056043))

(declare-fun m!1056045 () Bool)

(assert (=> start!98614 m!1056045))

(declare-fun m!1056047 () Bool)

(assert (=> b!1145112 m!1056047))

(declare-fun m!1056049 () Bool)

(assert (=> b!1145112 m!1056049))

(declare-fun m!1056051 () Bool)

(assert (=> b!1145112 m!1056051))

(declare-fun m!1056053 () Bool)

(assert (=> b!1145112 m!1056053))

(declare-fun m!1056055 () Bool)

(assert (=> b!1145111 m!1056055))

(declare-fun m!1056057 () Bool)

(assert (=> bm!52174 m!1056057))

(declare-fun m!1056059 () Bool)

(assert (=> mapNonEmpty!44948 m!1056059))

(declare-fun m!1056061 () Bool)

(assert (=> bm!52167 m!1056061))

(declare-fun m!1056063 () Bool)

(assert (=> b!1145110 m!1056063))

(declare-fun m!1056065 () Bool)

(assert (=> b!1145110 m!1056065))

(declare-fun m!1056067 () Bool)

(assert (=> b!1145110 m!1056067))

(declare-fun m!1056069 () Bool)

(assert (=> b!1145110 m!1056069))

(declare-fun m!1056071 () Bool)

(assert (=> b!1145108 m!1056071))

(declare-fun m!1056073 () Bool)

(assert (=> bm!52172 m!1056073))

(declare-fun m!1056075 () Bool)

(assert (=> b!1145102 m!1056075))

(declare-fun m!1056077 () Bool)

(assert (=> b!1145102 m!1056077))

(assert (=> b!1145091 m!1056035))

(declare-fun m!1056079 () Bool)

(assert (=> b!1145105 m!1056079))

(declare-fun m!1056081 () Bool)

(assert (=> b!1145086 m!1056081))

(declare-fun m!1056083 () Bool)

(assert (=> b!1145086 m!1056083))

(assert (=> b!1145086 m!1056027))

(declare-fun m!1056085 () Bool)

(assert (=> b!1145086 m!1056085))

(assert (=> b!1145086 m!1056027))

(assert (=> b!1145086 m!1056061))

(declare-fun m!1056087 () Bool)

(assert (=> b!1145086 m!1056087))

(assert (=> b!1145086 m!1056027))

(declare-fun m!1056089 () Bool)

(assert (=> b!1145086 m!1056089))

(assert (=> b!1145086 m!1056083))

(declare-fun m!1056091 () Bool)

(assert (=> b!1145086 m!1056091))

(assert (=> b!1145086 m!1056087))

(declare-fun m!1056093 () Bool)

(assert (=> b!1145103 m!1056093))

(declare-fun m!1056095 () Bool)

(assert (=> b!1145094 m!1056095))

(declare-fun m!1056097 () Bool)

(assert (=> b!1145099 m!1056097))

(check-sat (not bm!52173) (not b!1145098) b_and!39289 (not b!1145110) (not bm!52167) (not b!1145105) (not bm!52172) (not b!1145108) (not b!1145102) (not b!1145106) (not b!1145104) (not bm!52170) (not b!1145099) (not b!1145111) (not b_next!24219) (not b!1145086) (not b!1145103) (not b!1145112) tp_is_empty!28749 (not bm!52174) (not b!1145101) (not mapNonEmpty!44948) (not b_lambda!19325) (not start!98614) (not b!1145100) (not b!1145109) (not b!1145091))
(check-sat b_and!39289 (not b_next!24219))
