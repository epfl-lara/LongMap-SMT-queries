; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101646 () Bool)

(assert start!101646)

(declare-fun b_free!26367 () Bool)

(declare-fun b_next!26367 () Bool)

(assert (=> start!101646 (= b_free!26367 (not b_next!26367))))

(declare-fun tp!92144 () Bool)

(declare-fun b_and!43977 () Bool)

(assert (=> start!101646 (= tp!92144 b_and!43977)))

(declare-fun b!1222604 () Bool)

(declare-fun res!812329 () Bool)

(declare-fun e!694337 () Bool)

(assert (=> b!1222604 (=> (not res!812329) (not e!694337))))

(declare-datatypes ((array!78925 0))(
  ( (array!78926 (arr!38090 (Array (_ BitVec 32) (_ BitVec 64))) (size!38626 (_ BitVec 32))) )
))
(declare-fun lt!556282 () array!78925)

(declare-datatypes ((List!26884 0))(
  ( (Nil!26881) (Cons!26880 (h!28089 (_ BitVec 64)) (t!40231 List!26884)) )
))
(declare-fun arrayNoDuplicates!0 (array!78925 (_ BitVec 32) List!26884) Bool)

(assert (=> b!1222604 (= res!812329 (arrayNoDuplicates!0 lt!556282 #b00000000000000000000000000000000 Nil!26881))))

(declare-fun b!1222605 () Bool)

(declare-fun e!694342 () Bool)

(declare-fun e!694344 () Bool)

(declare-fun mapRes!48502 () Bool)

(assert (=> b!1222605 (= e!694342 (and e!694344 mapRes!48502))))

(declare-fun condMapEmpty!48502 () Bool)

(declare-datatypes ((V!46555 0))(
  ( (V!46556 (val!15592 Int)) )
))
(declare-datatypes ((ValueCell!14826 0))(
  ( (ValueCellFull!14826 (v!18253 V!46555)) (EmptyCell!14826) )
))
(declare-datatypes ((array!78927 0))(
  ( (array!78928 (arr!38091 (Array (_ BitVec 32) ValueCell!14826)) (size!38627 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78927)

(declare-fun mapDefault!48502 () ValueCell!14826)

(assert (=> b!1222605 (= condMapEmpty!48502 (= (arr!38091 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14826)) mapDefault!48502)))))

(declare-fun b!1222606 () Bool)

(declare-fun e!694345 () Bool)

(declare-fun tp_is_empty!31071 () Bool)

(assert (=> b!1222606 (= e!694345 tp_is_empty!31071)))

(declare-fun b!1222607 () Bool)

(declare-fun res!812323 () Bool)

(declare-fun e!694347 () Bool)

(assert (=> b!1222607 (=> (not res!812323) (not e!694347))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222607 (= res!812323 (validMask!0 mask!1564))))

(declare-fun _keys!1208 () array!78925)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1222608 () Bool)

(declare-fun e!694338 () Bool)

(assert (=> b!1222608 (= e!694338 (not (= (select (arr!38090 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!40492 0))(
  ( (Unit!40493) )
))
(declare-fun lt!556285 () Unit!40492)

(declare-fun e!694341 () Unit!40492)

(assert (=> b!1222608 (= lt!556285 e!694341)))

(declare-fun c!120332 () Bool)

(assert (=> b!1222608 (= c!120332 (= (select (arr!38090 _keys!1208) from!1455) k0!934))))

(declare-fun e!694340 () Bool)

(assert (=> b!1222608 e!694340))

(declare-fun res!812320 () Bool)

(assert (=> b!1222608 (=> (not res!812320) (not e!694340))))

(declare-fun lt!556294 () V!46555)

(declare-datatypes ((tuple2!20084 0))(
  ( (tuple2!20085 (_1!10053 (_ BitVec 64)) (_2!10053 V!46555)) )
))
(declare-datatypes ((List!26885 0))(
  ( (Nil!26882) (Cons!26881 (h!28090 tuple2!20084) (t!40232 List!26885)) )
))
(declare-datatypes ((ListLongMap!18053 0))(
  ( (ListLongMap!18054 (toList!9042 List!26885)) )
))
(declare-fun lt!556292 () ListLongMap!18053)

(declare-fun lt!556287 () ListLongMap!18053)

(declare-fun +!4102 (ListLongMap!18053 tuple2!20084) ListLongMap!18053)

(declare-fun get!19445 (ValueCell!14826 V!46555) V!46555)

(assert (=> b!1222608 (= res!812320 (= lt!556292 (+!4102 lt!556287 (tuple2!20085 (select (arr!38090 _keys!1208) from!1455) (get!19445 (select (arr!38091 _values!996) from!1455) lt!556294)))))))

(declare-fun b!1222609 () Bool)

(declare-fun res!812330 () Bool)

(assert (=> b!1222609 (=> (not res!812330) (not e!694347))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1222609 (= res!812330 (= (select (arr!38090 _keys!1208) i!673) k0!934))))

(declare-fun b!1222610 () Bool)

(declare-fun Unit!40494 () Unit!40492)

(assert (=> b!1222610 (= e!694341 Unit!40494)))

(declare-fun res!812322 () Bool)

(assert (=> start!101646 (=> (not res!812322) (not e!694347))))

(assert (=> start!101646 (= res!812322 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38626 _keys!1208))))))

(assert (=> start!101646 e!694347))

(assert (=> start!101646 tp_is_empty!31071))

(declare-fun array_inv!28982 (array!78925) Bool)

(assert (=> start!101646 (array_inv!28982 _keys!1208)))

(assert (=> start!101646 true))

(assert (=> start!101646 tp!92144))

(declare-fun array_inv!28983 (array!78927) Bool)

(assert (=> start!101646 (and (array_inv!28983 _values!996) e!694342)))

(declare-fun b!1222611 () Bool)

(declare-fun res!812332 () Bool)

(assert (=> b!1222611 (=> (not res!812332) (not e!694347))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1222611 (= res!812332 (and (= (size!38627 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38626 _keys!1208) (size!38627 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222612 () Bool)

(declare-fun res!812321 () Bool)

(assert (=> b!1222612 (=> (not res!812321) (not e!694347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78925 (_ BitVec 32)) Bool)

(assert (=> b!1222612 (= res!812321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222613 () Bool)

(declare-fun res!812325 () Bool)

(assert (=> b!1222613 (=> (not res!812325) (not e!694347))))

(assert (=> b!1222613 (= res!812325 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26881))))

(declare-fun b!1222614 () Bool)

(declare-fun res!812327 () Bool)

(assert (=> b!1222614 (=> (not res!812327) (not e!694347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222614 (= res!812327 (validKeyInArray!0 k0!934))))

(declare-fun b!1222615 () Bool)

(assert (=> b!1222615 (= e!694344 tp_is_empty!31071)))

(declare-fun b!1222616 () Bool)

(declare-fun e!694343 () Bool)

(declare-fun arrayContainsKey!0 (array!78925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222616 (= e!694343 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222617 () Bool)

(declare-fun e!694336 () Bool)

(assert (=> b!1222617 (= e!694336 e!694338)))

(declare-fun res!812333 () Bool)

(assert (=> b!1222617 (=> res!812333 e!694338)))

(assert (=> b!1222617 (= res!812333 (not (validKeyInArray!0 (select (arr!38090 _keys!1208) from!1455))))))

(declare-fun lt!556286 () ListLongMap!18053)

(assert (=> b!1222617 (= lt!556286 lt!556287)))

(declare-fun lt!556291 () ListLongMap!18053)

(declare-fun -!1946 (ListLongMap!18053 (_ BitVec 64)) ListLongMap!18053)

(assert (=> b!1222617 (= lt!556287 (-!1946 lt!556291 k0!934))))

(declare-fun zeroValue!944 () V!46555)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46555)

(declare-fun lt!556290 () array!78927)

(declare-fun getCurrentListMapNoExtraKeys!5464 (array!78925 array!78927 (_ BitVec 32) (_ BitVec 32) V!46555 V!46555 (_ BitVec 32) Int) ListLongMap!18053)

(assert (=> b!1222617 (= lt!556286 (getCurrentListMapNoExtraKeys!5464 lt!556282 lt!556290 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222617 (= lt!556291 (getCurrentListMapNoExtraKeys!5464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556283 () Unit!40492)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1153 (array!78925 array!78927 (_ BitVec 32) (_ BitVec 32) V!46555 V!46555 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40492)

(assert (=> b!1222617 (= lt!556283 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1153 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222618 () Bool)

(assert (=> b!1222618 (= e!694347 e!694337)))

(declare-fun res!812324 () Bool)

(assert (=> b!1222618 (=> (not res!812324) (not e!694337))))

(assert (=> b!1222618 (= res!812324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556282 mask!1564))))

(assert (=> b!1222618 (= lt!556282 (array!78926 (store (arr!38090 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38626 _keys!1208)))))

(declare-fun b!1222619 () Bool)

(assert (=> b!1222619 (= e!694340 e!694343)))

(declare-fun res!812328 () Bool)

(assert (=> b!1222619 (=> res!812328 e!694343)))

(assert (=> b!1222619 (= res!812328 (not (= (select (arr!38090 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!48502 () Bool)

(assert (=> mapIsEmpty!48502 mapRes!48502))

(declare-fun b!1222620 () Bool)

(declare-fun e!694346 () Bool)

(assert (=> b!1222620 (= e!694337 (not e!694346))))

(declare-fun res!812319 () Bool)

(assert (=> b!1222620 (=> res!812319 e!694346)))

(assert (=> b!1222620 (= res!812319 (bvsgt from!1455 i!673))))

(assert (=> b!1222620 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556281 () Unit!40492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78925 (_ BitVec 64) (_ BitVec 32)) Unit!40492)

(assert (=> b!1222620 (= lt!556281 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222621 () Bool)

(declare-fun res!812331 () Bool)

(assert (=> b!1222621 (=> (not res!812331) (not e!694347))))

(assert (=> b!1222621 (= res!812331 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38626 _keys!1208))))))

(declare-fun mapNonEmpty!48502 () Bool)

(declare-fun tp!92143 () Bool)

(assert (=> mapNonEmpty!48502 (= mapRes!48502 (and tp!92143 e!694345))))

(declare-fun mapKey!48502 () (_ BitVec 32))

(declare-fun mapRest!48502 () (Array (_ BitVec 32) ValueCell!14826))

(declare-fun mapValue!48502 () ValueCell!14826)

(assert (=> mapNonEmpty!48502 (= (arr!38091 _values!996) (store mapRest!48502 mapKey!48502 mapValue!48502))))

(declare-fun b!1222622 () Bool)

(assert (=> b!1222622 (= e!694346 e!694336)))

(declare-fun res!812326 () Bool)

(assert (=> b!1222622 (=> res!812326 e!694336)))

(assert (=> b!1222622 (= res!812326 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1222622 (= lt!556292 (getCurrentListMapNoExtraKeys!5464 lt!556282 lt!556290 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222622 (= lt!556290 (array!78928 (store (arr!38091 _values!996) i!673 (ValueCellFull!14826 lt!556294)) (size!38627 _values!996)))))

(declare-fun dynLambda!3340 (Int (_ BitVec 64)) V!46555)

(assert (=> b!1222622 (= lt!556294 (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556288 () ListLongMap!18053)

(assert (=> b!1222622 (= lt!556288 (getCurrentListMapNoExtraKeys!5464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222623 () Bool)

(declare-fun Unit!40495 () Unit!40492)

(assert (=> b!1222623 (= e!694341 Unit!40495)))

(declare-fun lt!556289 () Unit!40492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78925 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40492)

(assert (=> b!1222623 (= lt!556289 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222623 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556284 () Unit!40492)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78925 (_ BitVec 32) (_ BitVec 32)) Unit!40492)

(assert (=> b!1222623 (= lt!556284 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1222623 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26881)))

(declare-fun lt!556293 () Unit!40492)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78925 (_ BitVec 64) (_ BitVec 32) List!26884) Unit!40492)

(assert (=> b!1222623 (= lt!556293 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26881))))

(assert (=> b!1222623 false))

(assert (= (and start!101646 res!812322) b!1222607))

(assert (= (and b!1222607 res!812323) b!1222611))

(assert (= (and b!1222611 res!812332) b!1222612))

(assert (= (and b!1222612 res!812321) b!1222613))

(assert (= (and b!1222613 res!812325) b!1222621))

(assert (= (and b!1222621 res!812331) b!1222614))

(assert (= (and b!1222614 res!812327) b!1222609))

(assert (= (and b!1222609 res!812330) b!1222618))

(assert (= (and b!1222618 res!812324) b!1222604))

(assert (= (and b!1222604 res!812329) b!1222620))

(assert (= (and b!1222620 (not res!812319)) b!1222622))

(assert (= (and b!1222622 (not res!812326)) b!1222617))

(assert (= (and b!1222617 (not res!812333)) b!1222608))

(assert (= (and b!1222608 res!812320) b!1222619))

(assert (= (and b!1222619 (not res!812328)) b!1222616))

(assert (= (and b!1222608 c!120332) b!1222623))

(assert (= (and b!1222608 (not c!120332)) b!1222610))

(assert (= (and b!1222605 condMapEmpty!48502) mapIsEmpty!48502))

(assert (= (and b!1222605 (not condMapEmpty!48502)) mapNonEmpty!48502))

(get-info :version)

(assert (= (and mapNonEmpty!48502 ((_ is ValueCellFull!14826) mapValue!48502)) b!1222606))

(assert (= (and b!1222605 ((_ is ValueCellFull!14826) mapDefault!48502)) b!1222615))

(assert (= start!101646 b!1222605))

(declare-fun b_lambda!22309 () Bool)

(assert (=> (not b_lambda!22309) (not b!1222622)))

(declare-fun t!40230 () Bool)

(declare-fun tb!11167 () Bool)

(assert (=> (and start!101646 (= defaultEntry!1004 defaultEntry!1004) t!40230) tb!11167))

(declare-fun result!22945 () Bool)

(assert (=> tb!11167 (= result!22945 tp_is_empty!31071)))

(assert (=> b!1222622 t!40230))

(declare-fun b_and!43979 () Bool)

(assert (= b_and!43977 (and (=> t!40230 result!22945) b_and!43979)))

(declare-fun m!1127541 () Bool)

(assert (=> b!1222620 m!1127541))

(declare-fun m!1127543 () Bool)

(assert (=> b!1222620 m!1127543))

(declare-fun m!1127545 () Bool)

(assert (=> b!1222619 m!1127545))

(declare-fun m!1127547 () Bool)

(assert (=> b!1222616 m!1127547))

(declare-fun m!1127549 () Bool)

(assert (=> b!1222623 m!1127549))

(declare-fun m!1127551 () Bool)

(assert (=> b!1222623 m!1127551))

(declare-fun m!1127553 () Bool)

(assert (=> b!1222623 m!1127553))

(declare-fun m!1127555 () Bool)

(assert (=> b!1222623 m!1127555))

(declare-fun m!1127557 () Bool)

(assert (=> b!1222623 m!1127557))

(declare-fun m!1127559 () Bool)

(assert (=> b!1222617 m!1127559))

(declare-fun m!1127561 () Bool)

(assert (=> b!1222617 m!1127561))

(declare-fun m!1127563 () Bool)

(assert (=> b!1222617 m!1127563))

(assert (=> b!1222617 m!1127545))

(assert (=> b!1222617 m!1127545))

(declare-fun m!1127565 () Bool)

(assert (=> b!1222617 m!1127565))

(declare-fun m!1127567 () Bool)

(assert (=> b!1222617 m!1127567))

(declare-fun m!1127569 () Bool)

(assert (=> b!1222609 m!1127569))

(declare-fun m!1127571 () Bool)

(assert (=> b!1222604 m!1127571))

(declare-fun m!1127573 () Bool)

(assert (=> b!1222613 m!1127573))

(declare-fun m!1127575 () Bool)

(assert (=> b!1222614 m!1127575))

(declare-fun m!1127577 () Bool)

(assert (=> mapNonEmpty!48502 m!1127577))

(declare-fun m!1127579 () Bool)

(assert (=> b!1222618 m!1127579))

(declare-fun m!1127581 () Bool)

(assert (=> b!1222618 m!1127581))

(declare-fun m!1127583 () Bool)

(assert (=> start!101646 m!1127583))

(declare-fun m!1127585 () Bool)

(assert (=> start!101646 m!1127585))

(declare-fun m!1127587 () Bool)

(assert (=> b!1222607 m!1127587))

(assert (=> b!1222608 m!1127545))

(declare-fun m!1127589 () Bool)

(assert (=> b!1222608 m!1127589))

(assert (=> b!1222608 m!1127589))

(declare-fun m!1127591 () Bool)

(assert (=> b!1222608 m!1127591))

(declare-fun m!1127593 () Bool)

(assert (=> b!1222608 m!1127593))

(declare-fun m!1127595 () Bool)

(assert (=> b!1222612 m!1127595))

(declare-fun m!1127597 () Bool)

(assert (=> b!1222622 m!1127597))

(declare-fun m!1127599 () Bool)

(assert (=> b!1222622 m!1127599))

(declare-fun m!1127601 () Bool)

(assert (=> b!1222622 m!1127601))

(declare-fun m!1127603 () Bool)

(assert (=> b!1222622 m!1127603))

(check-sat (not b!1222622) (not b!1222614) (not b_next!26367) (not b!1222608) (not b!1222616) (not b!1222620) b_and!43979 (not start!101646) (not b_lambda!22309) (not b!1222623) (not b!1222618) (not mapNonEmpty!48502) (not b!1222612) (not b!1222604) (not b!1222613) tp_is_empty!31071 (not b!1222607) (not b!1222617))
(check-sat b_and!43979 (not b_next!26367))
