; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98938 () Bool)

(assert start!98938)

(declare-fun b_free!24307 () Bool)

(declare-fun b_next!24307 () Bool)

(assert (=> start!98938 (= b_free!24307 (not b_next!24307))))

(declare-fun tp!85632 () Bool)

(declare-fun b_and!39465 () Bool)

(assert (=> start!98938 (= tp!85632 b_and!39465)))

(declare-datatypes ((V!43577 0))(
  ( (V!43578 (val!14475 Int)) )
))
(declare-datatypes ((tuple2!18376 0))(
  ( (tuple2!18377 (_1!9199 (_ BitVec 64)) (_2!9199 V!43577)) )
))
(declare-datatypes ((List!25131 0))(
  ( (Nil!25128) (Cons!25127 (h!26345 tuple2!18376) (t!36422 List!25131)) )
))
(declare-datatypes ((ListLongMap!16353 0))(
  ( (ListLongMap!16354 (toList!8192 List!25131)) )
))
(declare-fun call!53291 () ListLongMap!16353)

(declare-fun call!53296 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!514366 () ListLongMap!16353)

(declare-fun c!114023 () Bool)

(declare-fun bm!53288 () Bool)

(declare-fun contains!6729 (ListLongMap!16353 (_ BitVec 64)) Bool)

(assert (=> bm!53288 (= call!53296 (contains!6729 (ite c!114023 lt!514366 call!53291) k0!934))))

(declare-fun zeroValue!944 () V!43577)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun call!53295 () ListLongMap!16353)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13709 0))(
  ( (ValueCellFull!13709 (v!17108 V!43577)) (EmptyCell!13709) )
))
(declare-datatypes ((array!74569 0))(
  ( (array!74570 (arr!35929 (Array (_ BitVec 32) ValueCell!13709)) (size!36466 (_ BitVec 32))) )
))
(declare-fun lt!514349 () array!74569)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74571 0))(
  ( (array!74572 (arr!35930 (Array (_ BitVec 32) (_ BitVec 64))) (size!36467 (_ BitVec 32))) )
))
(declare-fun lt!514359 () array!74571)

(declare-fun minValue!944 () V!43577)

(declare-fun bm!53289 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4693 (array!74571 array!74569 (_ BitVec 32) (_ BitVec 32) V!43577 V!43577 (_ BitVec 32) Int) ListLongMap!16353)

(assert (=> bm!53289 (= call!53295 (getCurrentListMapNoExtraKeys!4693 lt!514359 lt!514349 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150423 () Bool)

(declare-fun res!765095 () Bool)

(declare-fun e!654447 () Bool)

(assert (=> b!1150423 (=> (not res!765095) (not e!654447))))

(declare-fun _keys!1208 () array!74571)

(declare-datatypes ((List!25132 0))(
  ( (Nil!25129) (Cons!25128 (h!26346 (_ BitVec 64)) (t!36423 List!25132)) )
))
(declare-fun arrayNoDuplicates!0 (array!74571 (_ BitVec 32) List!25132) Bool)

(assert (=> b!1150423 (= res!765095 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25129))))

(declare-fun b!1150424 () Bool)

(declare-fun e!654450 () Bool)

(declare-fun e!654455 () Bool)

(assert (=> b!1150424 (= e!654450 e!654455)))

(declare-fun res!765082 () Bool)

(assert (=> b!1150424 (=> res!765082 e!654455)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150424 (= res!765082 (not (= from!1455 i!673)))))

(declare-fun lt!514362 () ListLongMap!16353)

(assert (=> b!1150424 (= lt!514362 (getCurrentListMapNoExtraKeys!4693 lt!514359 lt!514349 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74569)

(declare-fun lt!514356 () V!43577)

(assert (=> b!1150424 (= lt!514349 (array!74570 (store (arr!35929 _values!996) i!673 (ValueCellFull!13709 lt!514356)) (size!36466 _values!996)))))

(declare-fun dynLambda!2717 (Int (_ BitVec 64)) V!43577)

(assert (=> b!1150424 (= lt!514356 (dynLambda!2717 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!514367 () ListLongMap!16353)

(assert (=> b!1150424 (= lt!514367 (getCurrentListMapNoExtraKeys!4693 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1150425 () Bool)

(declare-fun e!654448 () Bool)

(assert (=> b!1150425 (= e!654447 e!654448)))

(declare-fun res!765089 () Bool)

(assert (=> b!1150425 (=> (not res!765089) (not e!654448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74571 (_ BitVec 32)) Bool)

(assert (=> b!1150425 (= res!765089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514359 mask!1564))))

(assert (=> b!1150425 (= lt!514359 (array!74572 (store (arr!35930 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36467 _keys!1208)))))

(declare-fun b!1150426 () Bool)

(declare-fun res!765096 () Bool)

(assert (=> b!1150426 (=> (not res!765096) (not e!654447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150426 (= res!765096 (validMask!0 mask!1564))))

(declare-fun b!1150427 () Bool)

(declare-fun e!654451 () Bool)

(declare-fun e!654445 () Bool)

(declare-fun mapRes!45080 () Bool)

(assert (=> b!1150427 (= e!654451 (and e!654445 mapRes!45080))))

(declare-fun condMapEmpty!45080 () Bool)

(declare-fun mapDefault!45080 () ValueCell!13709)

(assert (=> b!1150427 (= condMapEmpty!45080 (= (arr!35929 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13709)) mapDefault!45080)))))

(declare-fun b!1150428 () Bool)

(declare-fun e!654449 () Bool)

(declare-fun arrayContainsKey!0 (array!74571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150428 (= e!654449 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150429 () Bool)

(declare-fun e!654453 () Bool)

(assert (=> b!1150429 (= e!654455 e!654453)))

(declare-fun res!765091 () Bool)

(assert (=> b!1150429 (=> res!765091 e!654453)))

(assert (=> b!1150429 (= res!765091 (not (= (select (arr!35930 _keys!1208) from!1455) k0!934)))))

(declare-fun e!654456 () Bool)

(assert (=> b!1150429 e!654456))

(declare-fun c!114022 () Bool)

(assert (=> b!1150429 (= c!114022 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!37751 0))(
  ( (Unit!37752) )
))
(declare-fun lt!514365 () Unit!37751)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!560 (array!74571 array!74569 (_ BitVec 32) (_ BitVec 32) V!43577 V!43577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37751)

(assert (=> b!1150429 (= lt!514365 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!560 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150430 () Bool)

(declare-fun res!765093 () Bool)

(assert (=> b!1150430 (=> (not res!765093) (not e!654448))))

(assert (=> b!1150430 (= res!765093 (arrayNoDuplicates!0 lt!514359 #b00000000000000000000000000000000 Nil!25129))))

(declare-fun mapIsEmpty!45080 () Bool)

(assert (=> mapIsEmpty!45080 mapRes!45080))

(declare-fun b!1150431 () Bool)

(declare-fun call!53294 () Bool)

(assert (=> b!1150431 call!53294))

(declare-fun lt!514358 () Unit!37751)

(declare-fun call!53293 () Unit!37751)

(assert (=> b!1150431 (= lt!514358 call!53293)))

(declare-fun e!654452 () Unit!37751)

(assert (=> b!1150431 (= e!654452 lt!514358)))

(declare-fun b!1150432 () Bool)

(declare-fun res!765087 () Bool)

(assert (=> b!1150432 (=> (not res!765087) (not e!654447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150432 (= res!765087 (validKeyInArray!0 k0!934))))

(declare-fun call!53297 () ListLongMap!16353)

(declare-fun bm!53290 () Bool)

(assert (=> bm!53290 (= call!53297 (getCurrentListMapNoExtraKeys!4693 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150433 () Bool)

(declare-fun Unit!37753 () Unit!37751)

(assert (=> b!1150433 (= e!654452 Unit!37753)))

(declare-fun b!1150434 () Bool)

(declare-fun tp_is_empty!28837 () Bool)

(assert (=> b!1150434 (= e!654445 tp_is_empty!28837)))

(declare-fun b!1150435 () Bool)

(declare-fun e!654459 () Bool)

(assert (=> b!1150435 (= e!654459 tp_is_empty!28837)))

(declare-fun c!114019 () Bool)

(declare-fun lt!514361 () ListLongMap!16353)

(declare-fun call!53298 () ListLongMap!16353)

(declare-fun bm!53291 () Bool)

(declare-fun +!3631 (ListLongMap!16353 tuple2!18376) ListLongMap!16353)

(assert (=> bm!53291 (= call!53298 (+!3631 (ite c!114023 lt!514366 lt!514361) (ite c!114023 (tuple2!18377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114019 (tuple2!18377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!514368 () Bool)

(declare-fun b!1150436 () Bool)

(assert (=> b!1150436 (= e!654449 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514368) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150437 () Bool)

(declare-fun res!765084 () Bool)

(assert (=> b!1150437 (=> (not res!765084) (not e!654447))))

(assert (=> b!1150437 (= res!765084 (and (= (size!36466 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36467 _keys!1208) (size!36466 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1150438 () Bool)

(assert (=> b!1150438 (= e!654448 (not e!654450))))

(declare-fun res!765094 () Bool)

(assert (=> b!1150438 (=> res!765094 e!654450)))

(assert (=> b!1150438 (= res!765094 (bvsgt from!1455 i!673))))

(assert (=> b!1150438 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514351 () Unit!37751)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74571 (_ BitVec 64) (_ BitVec 32)) Unit!37751)

(assert (=> b!1150438 (= lt!514351 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1150439 () Bool)

(declare-fun res!765088 () Bool)

(assert (=> b!1150439 (=> (not res!765088) (not e!654447))))

(assert (=> b!1150439 (= res!765088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150440 () Bool)

(declare-fun res!765085 () Bool)

(assert (=> b!1150440 (=> (not res!765085) (not e!654447))))

(assert (=> b!1150440 (= res!765085 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36467 _keys!1208))))))

(declare-fun b!1150441 () Bool)

(assert (=> b!1150441 (= c!114019 (and (not lt!514368) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654460 () Unit!37751)

(declare-fun e!654446 () Unit!37751)

(assert (=> b!1150441 (= e!654460 e!654446)))

(declare-fun bm!53292 () Bool)

(declare-fun call!53292 () Unit!37751)

(assert (=> bm!53292 (= call!53293 call!53292)))

(declare-fun b!1150442 () Bool)

(assert (=> b!1150442 (= e!654456 (= call!53295 call!53297))))

(declare-fun bm!53293 () Bool)

(assert (=> bm!53293 (= call!53294 call!53296)))

(declare-fun res!765090 () Bool)

(assert (=> start!98938 (=> (not res!765090) (not e!654447))))

(assert (=> start!98938 (= res!765090 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36467 _keys!1208))))))

(assert (=> start!98938 e!654447))

(assert (=> start!98938 tp_is_empty!28837))

(declare-fun array_inv!27572 (array!74571) Bool)

(assert (=> start!98938 (array_inv!27572 _keys!1208)))

(assert (=> start!98938 true))

(assert (=> start!98938 tp!85632))

(declare-fun array_inv!27573 (array!74569) Bool)

(assert (=> start!98938 (and (array_inv!27573 _values!996) e!654451)))

(declare-fun b!1150443 () Bool)

(declare-fun lt!514353 () Unit!37751)

(assert (=> b!1150443 (= e!654446 lt!514353)))

(assert (=> b!1150443 (= lt!514353 call!53293)))

(assert (=> b!1150443 call!53294))

(declare-fun bm!53294 () Bool)

(assert (=> bm!53294 (= call!53291 call!53298)))

(declare-fun b!1150444 () Bool)

(declare-fun res!765083 () Bool)

(assert (=> b!1150444 (=> (not res!765083) (not e!654447))))

(assert (=> b!1150444 (= res!765083 (= (select (arr!35930 _keys!1208) i!673) k0!934))))

(declare-fun b!1150445 () Bool)

(assert (=> b!1150445 (contains!6729 call!53298 k0!934)))

(declare-fun lt!514360 () Unit!37751)

(assert (=> b!1150445 (= lt!514360 call!53292)))

(assert (=> b!1150445 call!53296))

(assert (=> b!1150445 (= lt!514366 (+!3631 lt!514361 (tuple2!18377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!514369 () Unit!37751)

(declare-fun addStillContains!857 (ListLongMap!16353 (_ BitVec 64) V!43577 (_ BitVec 64)) Unit!37751)

(assert (=> b!1150445 (= lt!514369 (addStillContains!857 lt!514361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1150445 (= e!654460 lt!514360)))

(declare-fun b!1150446 () Bool)

(declare-fun -!1315 (ListLongMap!16353 (_ BitVec 64)) ListLongMap!16353)

(assert (=> b!1150446 (= e!654456 (= call!53295 (-!1315 call!53297 k0!934)))))

(declare-fun b!1150447 () Bool)

(assert (=> b!1150447 (= e!654446 e!654452)))

(declare-fun c!114021 () Bool)

(assert (=> b!1150447 (= c!114021 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514368))))

(declare-fun b!1150448 () Bool)

(assert (=> b!1150448 (= e!654453 true)))

(declare-fun e!654458 () Bool)

(assert (=> b!1150448 e!654458))

(declare-fun res!765092 () Bool)

(assert (=> b!1150448 (=> (not res!765092) (not e!654458))))

(declare-fun lt!514350 () ListLongMap!16353)

(assert (=> b!1150448 (= res!765092 (= lt!514350 lt!514361))))

(assert (=> b!1150448 (= lt!514350 (-!1315 lt!514367 k0!934))))

(declare-fun lt!514364 () V!43577)

(assert (=> b!1150448 (= (-!1315 (+!3631 lt!514361 (tuple2!18377 (select (arr!35930 _keys!1208) from!1455) lt!514364)) (select (arr!35930 _keys!1208) from!1455)) lt!514361)))

(declare-fun lt!514354 () Unit!37751)

(declare-fun addThenRemoveForNewKeyIsSame!163 (ListLongMap!16353 (_ BitVec 64) V!43577) Unit!37751)

(assert (=> b!1150448 (= lt!514354 (addThenRemoveForNewKeyIsSame!163 lt!514361 (select (arr!35930 _keys!1208) from!1455) lt!514364))))

(declare-fun get!18310 (ValueCell!13709 V!43577) V!43577)

(assert (=> b!1150448 (= lt!514364 (get!18310 (select (arr!35929 _values!996) from!1455) lt!514356))))

(declare-fun lt!514357 () Unit!37751)

(declare-fun e!654444 () Unit!37751)

(assert (=> b!1150448 (= lt!514357 e!654444)))

(declare-fun c!114024 () Bool)

(assert (=> b!1150448 (= c!114024 (contains!6729 lt!514361 k0!934))))

(assert (=> b!1150448 (= lt!514361 (getCurrentListMapNoExtraKeys!4693 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!654457 () Bool)

(declare-fun b!1150449 () Bool)

(assert (=> b!1150449 (= e!654457 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150450 () Bool)

(assert (=> b!1150450 (= e!654458 (= lt!514350 (getCurrentListMapNoExtraKeys!4693 lt!514359 lt!514349 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53295 () Bool)

(assert (=> bm!53295 (= call!53292 (addStillContains!857 (ite c!114023 lt!514366 lt!514361) (ite c!114023 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114019 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114023 minValue!944 (ite c!114019 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1150451 () Bool)

(declare-fun Unit!37754 () Unit!37751)

(assert (=> b!1150451 (= e!654444 Unit!37754)))

(declare-fun b!1150452 () Bool)

(declare-fun Unit!37755 () Unit!37751)

(assert (=> b!1150452 (= e!654444 Unit!37755)))

(assert (=> b!1150452 (= lt!514368 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1150452 (= c!114023 (and (not lt!514368) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514363 () Unit!37751)

(assert (=> b!1150452 (= lt!514363 e!654460)))

(declare-fun lt!514348 () Unit!37751)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!451 (array!74571 array!74569 (_ BitVec 32) (_ BitVec 32) V!43577 V!43577 (_ BitVec 64) (_ BitVec 32) Int) Unit!37751)

(assert (=> b!1150452 (= lt!514348 (lemmaListMapContainsThenArrayContainsFrom!451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114020 () Bool)

(assert (=> b!1150452 (= c!114020 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765086 () Bool)

(assert (=> b!1150452 (= res!765086 e!654449)))

(assert (=> b!1150452 (=> (not res!765086) (not e!654457))))

(assert (=> b!1150452 e!654457))

(declare-fun lt!514355 () Unit!37751)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74571 (_ BitVec 32) (_ BitVec 32)) Unit!37751)

(assert (=> b!1150452 (= lt!514355 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150452 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25129)))

(declare-fun lt!514352 () Unit!37751)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74571 (_ BitVec 64) (_ BitVec 32) List!25132) Unit!37751)

(assert (=> b!1150452 (= lt!514352 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25129))))

(assert (=> b!1150452 false))

(declare-fun mapNonEmpty!45080 () Bool)

(declare-fun tp!85631 () Bool)

(assert (=> mapNonEmpty!45080 (= mapRes!45080 (and tp!85631 e!654459))))

(declare-fun mapRest!45080 () (Array (_ BitVec 32) ValueCell!13709))

(declare-fun mapKey!45080 () (_ BitVec 32))

(declare-fun mapValue!45080 () ValueCell!13709)

(assert (=> mapNonEmpty!45080 (= (arr!35929 _values!996) (store mapRest!45080 mapKey!45080 mapValue!45080))))

(assert (= (and start!98938 res!765090) b!1150426))

(assert (= (and b!1150426 res!765096) b!1150437))

(assert (= (and b!1150437 res!765084) b!1150439))

(assert (= (and b!1150439 res!765088) b!1150423))

(assert (= (and b!1150423 res!765095) b!1150440))

(assert (= (and b!1150440 res!765085) b!1150432))

(assert (= (and b!1150432 res!765087) b!1150444))

(assert (= (and b!1150444 res!765083) b!1150425))

(assert (= (and b!1150425 res!765089) b!1150430))

(assert (= (and b!1150430 res!765093) b!1150438))

(assert (= (and b!1150438 (not res!765094)) b!1150424))

(assert (= (and b!1150424 (not res!765082)) b!1150429))

(assert (= (and b!1150429 c!114022) b!1150446))

(assert (= (and b!1150429 (not c!114022)) b!1150442))

(assert (= (or b!1150446 b!1150442) bm!53289))

(assert (= (or b!1150446 b!1150442) bm!53290))

(assert (= (and b!1150429 (not res!765091)) b!1150448))

(assert (= (and b!1150448 c!114024) b!1150452))

(assert (= (and b!1150448 (not c!114024)) b!1150451))

(assert (= (and b!1150452 c!114023) b!1150445))

(assert (= (and b!1150452 (not c!114023)) b!1150441))

(assert (= (and b!1150441 c!114019) b!1150443))

(assert (= (and b!1150441 (not c!114019)) b!1150447))

(assert (= (and b!1150447 c!114021) b!1150431))

(assert (= (and b!1150447 (not c!114021)) b!1150433))

(assert (= (or b!1150443 b!1150431) bm!53292))

(assert (= (or b!1150443 b!1150431) bm!53294))

(assert (= (or b!1150443 b!1150431) bm!53293))

(assert (= (or b!1150445 bm!53293) bm!53288))

(assert (= (or b!1150445 bm!53292) bm!53295))

(assert (= (or b!1150445 bm!53294) bm!53291))

(assert (= (and b!1150452 c!114020) b!1150428))

(assert (= (and b!1150452 (not c!114020)) b!1150436))

(assert (= (and b!1150452 res!765086) b!1150449))

(assert (= (and b!1150448 res!765092) b!1150450))

(assert (= (and b!1150427 condMapEmpty!45080) mapIsEmpty!45080))

(assert (= (and b!1150427 (not condMapEmpty!45080)) mapNonEmpty!45080))

(get-info :version)

(assert (= (and mapNonEmpty!45080 ((_ is ValueCellFull!13709) mapValue!45080)) b!1150435))

(assert (= (and b!1150427 ((_ is ValueCellFull!13709) mapDefault!45080)) b!1150434))

(assert (= start!98938 b!1150427))

(declare-fun b_lambda!19407 () Bool)

(assert (=> (not b_lambda!19407) (not b!1150424)))

(declare-fun t!36421 () Bool)

(declare-fun tb!9111 () Bool)

(assert (=> (and start!98938 (= defaultEntry!1004 defaultEntry!1004) t!36421) tb!9111))

(declare-fun result!18795 () Bool)

(assert (=> tb!9111 (= result!18795 tp_is_empty!28837)))

(assert (=> b!1150424 t!36421))

(declare-fun b_and!39467 () Bool)

(assert (= b_and!39465 (and (=> t!36421 result!18795) b_and!39467)))

(declare-fun m!1061113 () Bool)

(assert (=> bm!53288 m!1061113))

(declare-fun m!1061115 () Bool)

(assert (=> b!1150445 m!1061115))

(declare-fun m!1061117 () Bool)

(assert (=> b!1150445 m!1061117))

(declare-fun m!1061119 () Bool)

(assert (=> b!1150445 m!1061119))

(declare-fun m!1061121 () Bool)

(assert (=> b!1150452 m!1061121))

(declare-fun m!1061123 () Bool)

(assert (=> b!1150452 m!1061123))

(declare-fun m!1061125 () Bool)

(assert (=> b!1150452 m!1061125))

(declare-fun m!1061127 () Bool)

(assert (=> b!1150452 m!1061127))

(declare-fun m!1061129 () Bool)

(assert (=> b!1150439 m!1061129))

(declare-fun m!1061131 () Bool)

(assert (=> b!1150432 m!1061131))

(declare-fun m!1061133 () Bool)

(assert (=> b!1150444 m!1061133))

(declare-fun m!1061135 () Bool)

(assert (=> b!1150448 m!1061135))

(declare-fun m!1061137 () Bool)

(assert (=> b!1150448 m!1061137))

(declare-fun m!1061139 () Bool)

(assert (=> b!1150448 m!1061139))

(declare-fun m!1061141 () Bool)

(assert (=> b!1150448 m!1061141))

(assert (=> b!1150448 m!1061139))

(declare-fun m!1061143 () Bool)

(assert (=> b!1150448 m!1061143))

(declare-fun m!1061145 () Bool)

(assert (=> b!1150448 m!1061145))

(declare-fun m!1061147 () Bool)

(assert (=> b!1150448 m!1061147))

(assert (=> b!1150448 m!1061137))

(declare-fun m!1061149 () Bool)

(assert (=> b!1150448 m!1061149))

(assert (=> b!1150448 m!1061143))

(declare-fun m!1061151 () Bool)

(assert (=> b!1150448 m!1061151))

(assert (=> b!1150448 m!1061143))

(declare-fun m!1061153 () Bool)

(assert (=> b!1150438 m!1061153))

(declare-fun m!1061155 () Bool)

(assert (=> b!1150438 m!1061155))

(declare-fun m!1061157 () Bool)

(assert (=> b!1150449 m!1061157))

(declare-fun m!1061159 () Bool)

(assert (=> b!1150425 m!1061159))

(declare-fun m!1061161 () Bool)

(assert (=> b!1150425 m!1061161))

(declare-fun m!1061163 () Bool)

(assert (=> b!1150450 m!1061163))

(declare-fun m!1061165 () Bool)

(assert (=> start!98938 m!1061165))

(declare-fun m!1061167 () Bool)

(assert (=> start!98938 m!1061167))

(declare-fun m!1061169 () Bool)

(assert (=> mapNonEmpty!45080 m!1061169))

(declare-fun m!1061171 () Bool)

(assert (=> b!1150423 m!1061171))

(assert (=> bm!53289 m!1061163))

(assert (=> b!1150428 m!1061157))

(assert (=> b!1150429 m!1061143))

(declare-fun m!1061173 () Bool)

(assert (=> b!1150429 m!1061173))

(declare-fun m!1061175 () Bool)

(assert (=> bm!53295 m!1061175))

(declare-fun m!1061177 () Bool)

(assert (=> b!1150426 m!1061177))

(declare-fun m!1061179 () Bool)

(assert (=> bm!53291 m!1061179))

(assert (=> bm!53290 m!1061135))

(declare-fun m!1061181 () Bool)

(assert (=> b!1150446 m!1061181))

(declare-fun m!1061183 () Bool)

(assert (=> b!1150424 m!1061183))

(declare-fun m!1061185 () Bool)

(assert (=> b!1150424 m!1061185))

(declare-fun m!1061187 () Bool)

(assert (=> b!1150424 m!1061187))

(declare-fun m!1061189 () Bool)

(assert (=> b!1150424 m!1061189))

(declare-fun m!1061191 () Bool)

(assert (=> b!1150430 m!1061191))

(check-sat (not mapNonEmpty!45080) (not b!1150438) (not b!1150425) (not b_next!24307) (not b!1150429) (not b!1150426) (not bm!53289) tp_is_empty!28837 (not b!1150450) (not b_lambda!19407) (not bm!53288) (not b!1150423) (not bm!53290) (not bm!53295) (not start!98938) (not bm!53291) (not b!1150446) (not b!1150424) (not b!1150452) (not b!1150428) b_and!39467 (not b!1150445) (not b!1150439) (not b!1150430) (not b!1150448) (not b!1150432) (not b!1150449))
(check-sat b_and!39467 (not b_next!24307))
