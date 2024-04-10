; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98532 () Bool)

(assert start!98532)

(declare-fun b_free!24137 () Bool)

(declare-fun b_next!24137 () Bool)

(assert (=> start!98532 (= b_free!24137 (not b_next!24137))))

(declare-fun tp!85122 () Bool)

(declare-fun b_and!39123 () Bool)

(assert (=> start!98532 (= tp!85122 b_and!39123)))

(declare-datatypes ((V!43349 0))(
  ( (V!43350 (val!14390 Int)) )
))
(declare-fun zeroValue!944 () V!43349)

(declare-datatypes ((array!74191 0))(
  ( (array!74192 (arr!35746 (Array (_ BitVec 32) (_ BitVec 64))) (size!36282 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74191)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18204 0))(
  ( (tuple2!18205 (_1!9113 (_ BitVec 64)) (_2!9113 V!43349)) )
))
(declare-datatypes ((List!24959 0))(
  ( (Nil!24956) (Cons!24955 (h!26164 tuple2!18204) (t!36088 List!24959)) )
))
(declare-datatypes ((ListLongMap!16173 0))(
  ( (ListLongMap!16174 (toList!8102 List!24959)) )
))
(declare-fun call!51192 () ListLongMap!16173)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!51183 () Bool)

(declare-datatypes ((ValueCell!13624 0))(
  ( (ValueCellFull!13624 (v!17027 V!43349)) (EmptyCell!13624) )
))
(declare-datatypes ((array!74193 0))(
  ( (array!74194 (arr!35747 (Array (_ BitVec 32) ValueCell!13624)) (size!36283 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74193)

(declare-fun minValue!944 () V!43349)

(declare-fun getCurrentListMapNoExtraKeys!4584 (array!74191 array!74193 (_ BitVec 32) (_ BitVec 32) V!43349 V!43349 (_ BitVec 32) Int) ListLongMap!16173)

(assert (=> bm!51183 (= call!51192 (getCurrentListMapNoExtraKeys!4584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!508524 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!649378 () Bool)

(declare-fun b!1141405 () Bool)

(assert (=> b!1141405 (= e!649378 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508524) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141407 () Bool)

(declare-fun e!649374 () Bool)

(declare-fun e!649376 () Bool)

(assert (=> b!1141407 (= e!649374 e!649376)))

(declare-fun res!760842 () Bool)

(assert (=> b!1141407 (=> res!760842 e!649376)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141407 (= res!760842 (not (= from!1455 i!673)))))

(declare-fun lt!508513 () ListLongMap!16173)

(declare-fun lt!508507 () array!74191)

(declare-fun lt!508510 () array!74193)

(assert (=> b!1141407 (= lt!508513 (getCurrentListMapNoExtraKeys!4584 lt!508507 lt!508510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!508509 () V!43349)

(assert (=> b!1141407 (= lt!508510 (array!74194 (store (arr!35747 _values!996) i!673 (ValueCellFull!13624 lt!508509)) (size!36283 _values!996)))))

(declare-fun dynLambda!2628 (Int (_ BitVec 64)) V!43349)

(assert (=> b!1141407 (= lt!508509 (dynLambda!2628 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508526 () ListLongMap!16173)

(assert (=> b!1141407 (= lt!508526 (getCurrentListMapNoExtraKeys!4584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141408 () Bool)

(declare-fun e!649375 () Bool)

(declare-fun arrayContainsKey!0 (array!74191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141408 (= e!649375 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141409 () Bool)

(declare-datatypes ((Unit!37440 0))(
  ( (Unit!37441) )
))
(declare-fun e!649379 () Unit!37440)

(declare-fun lt!508514 () Unit!37440)

(assert (=> b!1141409 (= e!649379 lt!508514)))

(declare-fun call!51189 () Unit!37440)

(assert (=> b!1141409 (= lt!508514 call!51189)))

(declare-fun call!51191 () Bool)

(assert (=> b!1141409 call!51191))

(declare-fun b!1141410 () Bool)

(declare-fun res!760851 () Bool)

(declare-fun e!649382 () Bool)

(assert (=> b!1141410 (=> (not res!760851) (not e!649382))))

(declare-datatypes ((List!24960 0))(
  ( (Nil!24957) (Cons!24956 (h!26165 (_ BitVec 64)) (t!36089 List!24960)) )
))
(declare-fun arrayNoDuplicates!0 (array!74191 (_ BitVec 32) List!24960) Bool)

(assert (=> b!1141410 (= res!760851 (arrayNoDuplicates!0 lt!508507 #b00000000000000000000000000000000 Nil!24957))))

(declare-fun b!1141411 () Bool)

(declare-fun e!649368 () Bool)

(assert (=> b!1141411 (= e!649376 e!649368)))

(declare-fun res!760840 () Bool)

(assert (=> b!1141411 (=> res!760840 e!649368)))

(assert (=> b!1141411 (= res!760840 (not (= (select (arr!35746 _keys!1208) from!1455) k!934)))))

(declare-fun e!649380 () Bool)

(assert (=> b!1141411 e!649380))

(declare-fun c!112091 () Bool)

(assert (=> b!1141411 (= c!112091 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508508 () Unit!37440)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!497 (array!74191 array!74193 (_ BitVec 32) (_ BitVec 32) V!43349 V!43349 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37440)

(assert (=> b!1141411 (= lt!508508 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141412 () Bool)

(declare-fun res!760841 () Bool)

(declare-fun e!649369 () Bool)

(assert (=> b!1141412 (=> (not res!760841) (not e!649369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141412 (= res!760841 (validMask!0 mask!1564))))

(declare-fun b!1141413 () Bool)

(declare-fun res!760844 () Bool)

(assert (=> b!1141413 (=> (not res!760844) (not e!649369))))

(assert (=> b!1141413 (= res!760844 (and (= (size!36283 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36282 _keys!1208) (size!36283 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1141414 () Bool)

(assert (=> b!1141414 (= e!649368 true)))

(declare-fun lt!508515 () ListLongMap!16173)

(declare-fun lt!508516 () V!43349)

(declare-fun -!1252 (ListLongMap!16173 (_ BitVec 64)) ListLongMap!16173)

(declare-fun +!3533 (ListLongMap!16173 tuple2!18204) ListLongMap!16173)

(assert (=> b!1141414 (= (-!1252 (+!3533 lt!508515 (tuple2!18205 (select (arr!35746 _keys!1208) from!1455) lt!508516)) (select (arr!35746 _keys!1208) from!1455)) lt!508515)))

(declare-fun lt!508511 () Unit!37440)

(declare-fun addThenRemoveForNewKeyIsSame!105 (ListLongMap!16173 (_ BitVec 64) V!43349) Unit!37440)

(assert (=> b!1141414 (= lt!508511 (addThenRemoveForNewKeyIsSame!105 lt!508515 (select (arr!35746 _keys!1208) from!1455) lt!508516))))

(declare-fun get!18163 (ValueCell!13624 V!43349) V!43349)

(assert (=> b!1141414 (= lt!508516 (get!18163 (select (arr!35747 _values!996) from!1455) lt!508509))))

(declare-fun lt!508519 () Unit!37440)

(declare-fun e!649383 () Unit!37440)

(assert (=> b!1141414 (= lt!508519 e!649383)))

(declare-fun c!112096 () Bool)

(declare-fun contains!6637 (ListLongMap!16173 (_ BitVec 64)) Bool)

(assert (=> b!1141414 (= c!112096 (contains!6637 lt!508515 k!934))))

(assert (=> b!1141414 (= lt!508515 (getCurrentListMapNoExtraKeys!4584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!51186 () ListLongMap!16173)

(declare-fun b!1141415 () Bool)

(assert (=> b!1141415 (= e!649380 (= call!51186 (-!1252 call!51192 k!934)))))

(declare-fun b!1141416 () Bool)

(assert (=> b!1141416 (= e!649369 e!649382)))

(declare-fun res!760848 () Bool)

(assert (=> b!1141416 (=> (not res!760848) (not e!649382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74191 (_ BitVec 32)) Bool)

(assert (=> b!1141416 (= res!760848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508507 mask!1564))))

(assert (=> b!1141416 (= lt!508507 (array!74192 (store (arr!35746 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36282 _keys!1208)))))

(declare-fun b!1141417 () Bool)

(assert (=> b!1141417 (= e!649380 (= call!51186 call!51192))))

(declare-fun lt!508518 () ListLongMap!16173)

(declare-fun bm!51184 () Bool)

(declare-fun call!51193 () ListLongMap!16173)

(declare-fun c!112092 () Bool)

(declare-fun c!112095 () Bool)

(assert (=> bm!51184 (= call!51193 (+!3533 (ite c!112095 lt!508518 lt!508515) (ite c!112095 (tuple2!18205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112092 (tuple2!18205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!51185 () Bool)

(declare-fun call!51187 () ListLongMap!16173)

(assert (=> bm!51185 (= call!51187 call!51193)))

(declare-fun b!1141406 () Bool)

(declare-fun res!760853 () Bool)

(assert (=> b!1141406 (=> (not res!760853) (not e!649369))))

(assert (=> b!1141406 (= res!760853 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36282 _keys!1208))))))

(declare-fun res!760849 () Bool)

(assert (=> start!98532 (=> (not res!760849) (not e!649369))))

(assert (=> start!98532 (= res!760849 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36282 _keys!1208))))))

(assert (=> start!98532 e!649369))

(declare-fun tp_is_empty!28667 () Bool)

(assert (=> start!98532 tp_is_empty!28667))

(declare-fun array_inv!27400 (array!74191) Bool)

(assert (=> start!98532 (array_inv!27400 _keys!1208)))

(assert (=> start!98532 true))

(assert (=> start!98532 tp!85122))

(declare-fun e!649377 () Bool)

(declare-fun array_inv!27401 (array!74193) Bool)

(assert (=> start!98532 (and (array_inv!27401 _values!996) e!649377)))

(declare-fun b!1141418 () Bool)

(assert (=> b!1141418 (= e!649382 (not e!649374))))

(declare-fun res!760843 () Bool)

(assert (=> b!1141418 (=> res!760843 e!649374)))

(assert (=> b!1141418 (= res!760843 (bvsgt from!1455 i!673))))

(assert (=> b!1141418 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!508525 () Unit!37440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74191 (_ BitVec 64) (_ BitVec 32)) Unit!37440)

(assert (=> b!1141418 (= lt!508525 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun call!51190 () Unit!37440)

(declare-fun bm!51186 () Bool)

(declare-fun addStillContains!790 (ListLongMap!16173 (_ BitVec 64) V!43349 (_ BitVec 64)) Unit!37440)

(assert (=> bm!51186 (= call!51190 (addStillContains!790 lt!508515 (ite (or c!112095 c!112092) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112095 c!112092) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1141419 () Bool)

(declare-fun e!649381 () Bool)

(assert (=> b!1141419 (= e!649381 tp_is_empty!28667)))

(declare-fun b!1141420 () Bool)

(declare-fun res!760847 () Bool)

(assert (=> b!1141420 (=> (not res!760847) (not e!649369))))

(assert (=> b!1141420 (= res!760847 (= (select (arr!35746 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!44825 () Bool)

(declare-fun mapRes!44825 () Bool)

(assert (=> mapIsEmpty!44825 mapRes!44825))

(declare-fun b!1141421 () Bool)

(assert (=> b!1141421 (= c!112092 (and (not lt!508524) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649372 () Unit!37440)

(assert (=> b!1141421 (= e!649372 e!649379)))

(declare-fun b!1141422 () Bool)

(assert (=> b!1141422 call!51191))

(declare-fun lt!508527 () Unit!37440)

(assert (=> b!1141422 (= lt!508527 call!51189)))

(declare-fun e!649371 () Unit!37440)

(assert (=> b!1141422 (= e!649371 lt!508527)))

(declare-fun bm!51187 () Bool)

(assert (=> bm!51187 (= call!51189 call!51190)))

(declare-fun b!1141423 () Bool)

(declare-fun res!760850 () Bool)

(assert (=> b!1141423 (=> (not res!760850) (not e!649369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141423 (= res!760850 (validKeyInArray!0 k!934))))

(declare-fun b!1141424 () Bool)

(declare-fun res!760846 () Bool)

(assert (=> b!1141424 (=> (not res!760846) (not e!649369))))

(assert (=> b!1141424 (= res!760846 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24957))))

(declare-fun b!1141425 () Bool)

(assert (=> b!1141425 (= e!649379 e!649371)))

(declare-fun c!112094 () Bool)

(assert (=> b!1141425 (= c!112094 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508524))))

(declare-fun call!51188 () Bool)

(declare-fun bm!51188 () Bool)

(assert (=> bm!51188 (= call!51188 (contains!6637 (ite c!112095 lt!508518 call!51187) k!934))))

(declare-fun b!1141426 () Bool)

(declare-fun Unit!37442 () Unit!37440)

(assert (=> b!1141426 (= e!649371 Unit!37442)))

(declare-fun b!1141427 () Bool)

(assert (=> b!1141427 (contains!6637 call!51193 k!934)))

(declare-fun lt!508517 () Unit!37440)

(assert (=> b!1141427 (= lt!508517 (addStillContains!790 lt!508518 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1141427 call!51188))

(assert (=> b!1141427 (= lt!508518 (+!3533 lt!508515 (tuple2!18205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508522 () Unit!37440)

(assert (=> b!1141427 (= lt!508522 call!51190)))

(assert (=> b!1141427 (= e!649372 lt!508517)))

(declare-fun b!1141428 () Bool)

(assert (=> b!1141428 (= e!649377 (and e!649381 mapRes!44825))))

(declare-fun condMapEmpty!44825 () Bool)

(declare-fun mapDefault!44825 () ValueCell!13624)

