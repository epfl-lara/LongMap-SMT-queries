; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98528 () Bool)

(assert start!98528)

(declare-fun b_free!24133 () Bool)

(declare-fun b_next!24133 () Bool)

(assert (=> start!98528 (= b_free!24133 (not b_next!24133))))

(declare-fun tp!85110 () Bool)

(declare-fun b_and!39115 () Bool)

(assert (=> start!98528 (= tp!85110 b_and!39115)))

(declare-datatypes ((V!43345 0))(
  ( (V!43346 (val!14388 Int)) )
))
(declare-fun zeroValue!944 () V!43345)

(declare-fun c!112058 () Bool)

(declare-datatypes ((tuple2!18200 0))(
  ( (tuple2!18201 (_1!9111 (_ BitVec 64)) (_2!9111 V!43345)) )
))
(declare-datatypes ((List!24955 0))(
  ( (Nil!24952) (Cons!24951 (h!26160 tuple2!18200) (t!36080 List!24955)) )
))
(declare-datatypes ((ListLongMap!16169 0))(
  ( (ListLongMap!16170 (toList!8100 List!24955)) )
))
(declare-fun lt!508400 () ListLongMap!16169)

(declare-datatypes ((Unit!37430 0))(
  ( (Unit!37431) )
))
(declare-fun call!51138 () Unit!37430)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!508395 () ListLongMap!16169)

(declare-fun c!112060 () Bool)

(declare-fun bm!51135 () Bool)

(declare-fun minValue!944 () V!43345)

(declare-fun addStillContains!788 (ListLongMap!16169 (_ BitVec 64) V!43345 (_ BitVec 64)) Unit!37430)

(assert (=> bm!51135 (= call!51138 (addStillContains!788 (ite c!112058 lt!508395 lt!508400) (ite c!112058 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112060 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112058 minValue!944 (ite c!112060 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1141228 () Bool)

(declare-fun e!649273 () Bool)

(declare-fun tp_is_empty!28663 () Bool)

(assert (=> b!1141228 (= e!649273 tp_is_empty!28663)))

(declare-fun b!1141229 () Bool)

(declare-fun res!760762 () Bool)

(declare-fun e!649286 () Bool)

(assert (=> b!1141229 (=> (not res!760762) (not e!649286))))

(declare-datatypes ((array!74183 0))(
  ( (array!74184 (arr!35742 (Array (_ BitVec 32) (_ BitVec 64))) (size!36278 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74183)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74183 (_ BitVec 32)) Bool)

(assert (=> b!1141229 (= res!760762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!51136 () Bool)

(declare-fun call!51139 () Unit!37430)

(assert (=> bm!51136 (= call!51139 call!51138)))

(declare-fun b!1141230 () Bool)

(declare-fun res!760760 () Bool)

(declare-fun e!649283 () Bool)

(assert (=> b!1141230 (=> (not res!760760) (not e!649283))))

(declare-fun lt!508396 () array!74183)

(declare-datatypes ((List!24956 0))(
  ( (Nil!24953) (Cons!24952 (h!26161 (_ BitVec 64)) (t!36081 List!24956)) )
))
(declare-fun arrayNoDuplicates!0 (array!74183 (_ BitVec 32) List!24956) Bool)

(assert (=> b!1141230 (= res!760760 (arrayNoDuplicates!0 lt!508396 #b00000000000000000000000000000000 Nil!24953))))

(declare-fun b!1141231 () Bool)

(declare-fun call!51142 () Bool)

(assert (=> b!1141231 call!51142))

(declare-fun lt!508385 () Unit!37430)

(assert (=> b!1141231 (= lt!508385 call!51139)))

(declare-fun e!649277 () Unit!37430)

(assert (=> b!1141231 (= e!649277 lt!508385)))

(declare-fun mapIsEmpty!44819 () Bool)

(declare-fun mapRes!44819 () Bool)

(assert (=> mapIsEmpty!44819 mapRes!44819))

(declare-fun e!649276 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1141232 () Bool)

(declare-fun arrayContainsKey!0 (array!74183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141232 (= e!649276 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51137 () Bool)

(declare-fun call!51143 () Bool)

(assert (=> bm!51137 (= call!51142 call!51143)))

(declare-fun bm!51138 () Bool)

(declare-fun call!51140 () ListLongMap!16169)

(declare-fun call!51141 () ListLongMap!16169)

(assert (=> bm!51138 (= call!51140 call!51141)))

(declare-fun b!1141233 () Bool)

(declare-fun e!649287 () Bool)

(assert (=> b!1141233 (= e!649287 tp_is_empty!28663)))

(declare-fun bm!51139 () Bool)

(declare-fun +!3531 (ListLongMap!16169 tuple2!18200) ListLongMap!16169)

(assert (=> bm!51139 (= call!51141 (+!3531 lt!508400 (ite (or c!112058 c!112060) (tuple2!18201 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18201 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1141234 () Bool)

(declare-fun e!649284 () Bool)

(declare-fun e!649282 () Bool)

(assert (=> b!1141234 (= e!649284 e!649282)))

(declare-fun res!760766 () Bool)

(assert (=> b!1141234 (=> res!760766 e!649282)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141234 (= res!760766 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!508386 () ListLongMap!16169)

(declare-datatypes ((ValueCell!13622 0))(
  ( (ValueCellFull!13622 (v!17025 V!43345)) (EmptyCell!13622) )
))
(declare-datatypes ((array!74185 0))(
  ( (array!74186 (arr!35743 (Array (_ BitVec 32) ValueCell!13622)) (size!36279 (_ BitVec 32))) )
))
(declare-fun lt!508384 () array!74185)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4582 (array!74183 array!74185 (_ BitVec 32) (_ BitVec 32) V!43345 V!43345 (_ BitVec 32) Int) ListLongMap!16169)

(assert (=> b!1141234 (= lt!508386 (getCurrentListMapNoExtraKeys!4582 lt!508396 lt!508384 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!508381 () V!43345)

(declare-fun _values!996 () array!74185)

(assert (=> b!1141234 (= lt!508384 (array!74186 (store (arr!35743 _values!996) i!673 (ValueCellFull!13622 lt!508381)) (size!36279 _values!996)))))

(declare-fun dynLambda!2626 (Int (_ BitVec 64)) V!43345)

(assert (=> b!1141234 (= lt!508381 (dynLambda!2626 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508394 () ListLongMap!16169)

(assert (=> b!1141234 (= lt!508394 (getCurrentListMapNoExtraKeys!4582 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141235 () Bool)

(declare-fun res!760759 () Bool)

(assert (=> b!1141235 (=> (not res!760759) (not e!649286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141235 (= res!760759 (validKeyInArray!0 k!934))))

(declare-fun b!1141236 () Bool)

(declare-fun e!649278 () Unit!37430)

(declare-fun Unit!37432 () Unit!37430)

(assert (=> b!1141236 (= e!649278 Unit!37432)))

(declare-fun b!1141237 () Bool)

(declare-fun e!649272 () Unit!37430)

(assert (=> b!1141237 (= e!649272 e!649277)))

(declare-fun c!112056 () Bool)

(declare-fun lt!508389 () Bool)

(assert (=> b!1141237 (= c!112056 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508389))))

(declare-fun b!1141238 () Bool)

(declare-fun lt!508398 () Unit!37430)

(assert (=> b!1141238 (= e!649272 lt!508398)))

(assert (=> b!1141238 (= lt!508398 call!51139)))

(assert (=> b!1141238 call!51142))

(declare-fun b!1141227 () Bool)

(declare-fun res!760756 () Bool)

(assert (=> b!1141227 (=> (not res!760756) (not e!649286))))

(assert (=> b!1141227 (= res!760756 (and (= (size!36279 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36278 _keys!1208) (size!36279 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!760757 () Bool)

(assert (=> start!98528 (=> (not res!760757) (not e!649286))))

(assert (=> start!98528 (= res!760757 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36278 _keys!1208))))))

(assert (=> start!98528 e!649286))

(assert (=> start!98528 tp_is_empty!28663))

(declare-fun array_inv!27396 (array!74183) Bool)

(assert (=> start!98528 (array_inv!27396 _keys!1208)))

(assert (=> start!98528 true))

(assert (=> start!98528 tp!85110))

(declare-fun e!649285 () Bool)

(declare-fun array_inv!27397 (array!74185) Bool)

(assert (=> start!98528 (and (array_inv!27397 _values!996) e!649285)))

(declare-fun b!1141239 () Bool)

(declare-fun e!649280 () Bool)

(assert (=> b!1141239 (= e!649282 e!649280)))

(declare-fun res!760758 () Bool)

(assert (=> b!1141239 (=> res!760758 e!649280)))

(assert (=> b!1141239 (= res!760758 (not (= (select (arr!35742 _keys!1208) from!1455) k!934)))))

(declare-fun e!649279 () Bool)

(assert (=> b!1141239 e!649279))

(declare-fun c!112055 () Bool)

(assert (=> b!1141239 (= c!112055 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508401 () Unit!37430)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!495 (array!74183 array!74185 (_ BitVec 32) (_ BitVec 32) V!43345 V!43345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37430)

(assert (=> b!1141239 (= lt!508401 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!495 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141240 () Bool)

(assert (=> b!1141240 (= e!649280 true)))

(declare-fun lt!508397 () V!43345)

(declare-fun -!1250 (ListLongMap!16169 (_ BitVec 64)) ListLongMap!16169)

(assert (=> b!1141240 (= (-!1250 (+!3531 lt!508400 (tuple2!18201 (select (arr!35742 _keys!1208) from!1455) lt!508397)) (select (arr!35742 _keys!1208) from!1455)) lt!508400)))

(declare-fun lt!508393 () Unit!37430)

(declare-fun addThenRemoveForNewKeyIsSame!103 (ListLongMap!16169 (_ BitVec 64) V!43345) Unit!37430)

(assert (=> b!1141240 (= lt!508393 (addThenRemoveForNewKeyIsSame!103 lt!508400 (select (arr!35742 _keys!1208) from!1455) lt!508397))))

(declare-fun get!18161 (ValueCell!13622 V!43345) V!43345)

(assert (=> b!1141240 (= lt!508397 (get!18161 (select (arr!35743 _values!996) from!1455) lt!508381))))

(declare-fun lt!508387 () Unit!37430)

(assert (=> b!1141240 (= lt!508387 e!649278)))

(declare-fun c!112059 () Bool)

(declare-fun contains!6635 (ListLongMap!16169 (_ BitVec 64)) Bool)

(assert (=> b!1141240 (= c!112059 (contains!6635 lt!508400 k!934))))

(assert (=> b!1141240 (= lt!508400 (getCurrentListMapNoExtraKeys!4582 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141241 () Bool)

(declare-fun e!649281 () Bool)

(assert (=> b!1141241 (= e!649281 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508389) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141242 () Bool)

(assert (=> b!1141242 (= e!649283 (not e!649284))))

(declare-fun res!760763 () Bool)

(assert (=> b!1141242 (=> res!760763 e!649284)))

(assert (=> b!1141242 (= res!760763 (bvsgt from!1455 i!673))))

(assert (=> b!1141242 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!508382 () Unit!37430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74183 (_ BitVec 64) (_ BitVec 32)) Unit!37430)

(assert (=> b!1141242 (= lt!508382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1141243 () Bool)

(assert (=> b!1141243 (= e!649281 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51140 () Bool)

(assert (=> bm!51140 (= call!51143 (contains!6635 (ite c!112058 lt!508395 call!51140) k!934))))

(declare-fun b!1141244 () Bool)

(declare-fun Unit!37433 () Unit!37430)

(assert (=> b!1141244 (= e!649278 Unit!37433)))

(assert (=> b!1141244 (= lt!508389 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1141244 (= c!112058 (and (not lt!508389) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508390 () Unit!37430)

(declare-fun e!649275 () Unit!37430)

(assert (=> b!1141244 (= lt!508390 e!649275)))

(declare-fun lt!508392 () Unit!37430)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!386 (array!74183 array!74185 (_ BitVec 32) (_ BitVec 32) V!43345 V!43345 (_ BitVec 64) (_ BitVec 32) Int) Unit!37430)

(assert (=> b!1141244 (= lt!508392 (lemmaListMapContainsThenArrayContainsFrom!386 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112057 () Bool)

(assert (=> b!1141244 (= c!112057 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760767 () Bool)

(assert (=> b!1141244 (= res!760767 e!649281)))

(assert (=> b!1141244 (=> (not res!760767) (not e!649276))))

(assert (=> b!1141244 e!649276))

(declare-fun lt!508388 () Unit!37430)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74183 (_ BitVec 32) (_ BitVec 32)) Unit!37430)

(assert (=> b!1141244 (= lt!508388 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1141244 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24953)))

(declare-fun lt!508399 () Unit!37430)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74183 (_ BitVec 64) (_ BitVec 32) List!24956) Unit!37430)

(assert (=> b!1141244 (= lt!508399 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24953))))

(assert (=> b!1141244 false))

(declare-fun b!1141245 () Bool)

(declare-fun res!760768 () Bool)

(assert (=> b!1141245 (=> (not res!760768) (not e!649286))))

(assert (=> b!1141245 (= res!760768 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24953))))

(declare-fun b!1141246 () Bool)

(declare-fun call!51145 () ListLongMap!16169)

(declare-fun call!51144 () ListLongMap!16169)

(assert (=> b!1141246 (= e!649279 (= call!51145 call!51144))))

(declare-fun b!1141247 () Bool)

(declare-fun res!760761 () Bool)

(assert (=> b!1141247 (=> (not res!760761) (not e!649286))))

(assert (=> b!1141247 (= res!760761 (= (select (arr!35742 _keys!1208) i!673) k!934))))

(declare-fun b!1141248 () Bool)

(assert (=> b!1141248 (contains!6635 (+!3531 lt!508395 (tuple2!18201 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!508391 () Unit!37430)

(assert (=> b!1141248 (= lt!508391 call!51138)))

(assert (=> b!1141248 call!51143))

(assert (=> b!1141248 (= lt!508395 call!51141)))

(declare-fun lt!508383 () Unit!37430)

(assert (=> b!1141248 (= lt!508383 (addStillContains!788 lt!508400 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1141248 (= e!649275 lt!508391)))

(declare-fun b!1141249 () Bool)

(assert (=> b!1141249 (= e!649286 e!649283)))

(declare-fun res!760769 () Bool)

(assert (=> b!1141249 (=> (not res!760769) (not e!649283))))

(assert (=> b!1141249 (= res!760769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508396 mask!1564))))

(assert (=> b!1141249 (= lt!508396 (array!74184 (store (arr!35742 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36278 _keys!1208)))))

(declare-fun bm!51141 () Bool)

(assert (=> bm!51141 (= call!51145 (getCurrentListMapNoExtraKeys!4582 lt!508396 lt!508384 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141250 () Bool)

(declare-fun Unit!37434 () Unit!37430)

(assert (=> b!1141250 (= e!649277 Unit!37434)))

(declare-fun bm!51142 () Bool)

(assert (=> bm!51142 (= call!51144 (getCurrentListMapNoExtraKeys!4582 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141251 () Bool)

(assert (=> b!1141251 (= e!649285 (and e!649287 mapRes!44819))))

(declare-fun condMapEmpty!44819 () Bool)

(declare-fun mapDefault!44819 () ValueCell!13622)

