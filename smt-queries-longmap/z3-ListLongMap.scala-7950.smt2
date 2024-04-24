; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98776 () Bool)

(assert start!98776)

(declare-fun b_free!24145 () Bool)

(declare-fun b_next!24145 () Bool)

(assert (=> start!98776 (= b_free!24145 (not b_next!24145))))

(declare-fun tp!85145 () Bool)

(declare-fun b_and!39141 () Bool)

(assert (=> start!98776 (= tp!85145 b_and!39141)))

(declare-fun b!1143050 () Bool)

(declare-datatypes ((Unit!37431 0))(
  ( (Unit!37432) )
))
(declare-fun e!650397 () Unit!37431)

(declare-fun e!650396 () Unit!37431)

(assert (=> b!1143050 (= e!650397 e!650396)))

(declare-fun c!112564 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!509258 () Bool)

(assert (=> b!1143050 (= c!112564 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509258))))

(declare-fun b!1143051 () Bool)

(declare-fun res!761529 () Bool)

(declare-fun e!650407 () Bool)

(assert (=> b!1143051 (=> (not res!761529) (not e!650407))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143051 (= res!761529 (validKeyInArray!0 k0!934))))

(declare-fun bm!51344 () Bool)

(declare-fun call!51348 () Unit!37431)

(declare-fun call!51351 () Unit!37431)

(assert (=> bm!51344 (= call!51348 call!51351)))

(declare-fun b!1143052 () Bool)

(declare-fun res!761518 () Bool)

(assert (=> b!1143052 (=> (not res!761518) (not e!650407))))

(declare-datatypes ((array!74249 0))(
  ( (array!74250 (arr!35769 (Array (_ BitVec 32) (_ BitVec 64))) (size!36306 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74249)

(declare-datatypes ((List!24984 0))(
  ( (Nil!24981) (Cons!24980 (h!26198 (_ BitVec 64)) (t!36113 List!24984)) )
))
(declare-fun arrayNoDuplicates!0 (array!74249 (_ BitVec 32) List!24984) Bool)

(assert (=> b!1143052 (= res!761518 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24981))))

(declare-fun mapIsEmpty!44837 () Bool)

(declare-fun mapRes!44837 () Bool)

(assert (=> mapIsEmpty!44837 mapRes!44837))

(declare-fun c!112566 () Bool)

(declare-fun c!112563 () Bool)

(declare-fun bm!51345 () Bool)

(declare-datatypes ((V!43361 0))(
  ( (V!43362 (val!14394 Int)) )
))
(declare-datatypes ((tuple2!18224 0))(
  ( (tuple2!18225 (_1!9123 (_ BitVec 64)) (_2!9123 V!43361)) )
))
(declare-datatypes ((List!24985 0))(
  ( (Nil!24982) (Cons!24981 (h!26199 tuple2!18224) (t!36114 List!24985)) )
))
(declare-datatypes ((ListLongMap!16201 0))(
  ( (ListLongMap!16202 (toList!8116 List!24985)) )
))
(declare-fun lt!509255 () ListLongMap!16201)

(declare-fun lt!509248 () ListLongMap!16201)

(declare-fun minValue!944 () V!43361)

(declare-fun zeroValue!944 () V!43361)

(declare-fun addStillContains!790 (ListLongMap!16201 (_ BitVec 64) V!43361 (_ BitVec 64)) Unit!37431)

(assert (=> bm!51345 (= call!51351 (addStillContains!790 (ite c!112563 lt!509255 lt!509248) (ite c!112563 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112566 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112563 minValue!944 (ite c!112566 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!51346 () Bool)

(declare-fun call!51350 () ListLongMap!16201)

(declare-fun call!51349 () ListLongMap!16201)

(assert (=> bm!51346 (= call!51350 call!51349)))

(declare-fun b!1143053 () Bool)

(declare-fun res!761522 () Bool)

(assert (=> b!1143053 (=> (not res!761522) (not e!650407))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143053 (= res!761522 (= (select (arr!35769 _keys!1208) i!673) k0!934))))

(declare-fun b!1143054 () Bool)

(declare-fun e!650402 () Unit!37431)

(declare-fun Unit!37433 () Unit!37431)

(assert (=> b!1143054 (= e!650402 Unit!37433)))

(declare-fun b!1143055 () Bool)

(declare-fun e!650401 () Bool)

(declare-fun e!650392 () Bool)

(assert (=> b!1143055 (= e!650401 (not e!650392))))

(declare-fun res!761517 () Bool)

(assert (=> b!1143055 (=> res!761517 e!650392)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1143055 (= res!761517 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143055 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509257 () Unit!37431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74249 (_ BitVec 64) (_ BitVec 32)) Unit!37431)

(assert (=> b!1143055 (= lt!509257 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1143056 () Bool)

(declare-fun e!650406 () Bool)

(declare-fun tp_is_empty!28675 () Bool)

(assert (=> b!1143056 (= e!650406 tp_is_empty!28675)))

(declare-fun bm!51347 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!51354 () ListLongMap!16201)

(declare-datatypes ((ValueCell!13628 0))(
  ( (ValueCellFull!13628 (v!17027 V!43361)) (EmptyCell!13628) )
))
(declare-datatypes ((array!74251 0))(
  ( (array!74252 (arr!35770 (Array (_ BitVec 32) ValueCell!13628)) (size!36307 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74251)

(declare-fun getCurrentListMapNoExtraKeys!4624 (array!74249 array!74251 (_ BitVec 32) (_ BitVec 32) V!43361 V!43361 (_ BitVec 32) Int) ListLongMap!16201)

(assert (=> bm!51347 (= call!51354 (getCurrentListMapNoExtraKeys!4624 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143057 () Bool)

(declare-fun res!761528 () Bool)

(assert (=> b!1143057 (=> (not res!761528) (not e!650407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74249 (_ BitVec 32)) Bool)

(assert (=> b!1143057 (= res!761528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143058 () Bool)

(declare-fun e!650400 () Bool)

(assert (=> b!1143058 (= e!650400 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143059 () Bool)

(declare-fun res!761516 () Bool)

(assert (=> b!1143059 (=> (not res!761516) (not e!650407))))

(assert (=> b!1143059 (= res!761516 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36306 _keys!1208))))))

(declare-fun e!650394 () Bool)

(declare-fun call!51353 () ListLongMap!16201)

(declare-fun b!1143060 () Bool)

(declare-fun -!1247 (ListLongMap!16201 (_ BitVec 64)) ListLongMap!16201)

(assert (=> b!1143060 (= e!650394 (= call!51353 (-!1247 call!51354 k0!934)))))

(declare-fun b!1143061 () Bool)

(declare-fun Unit!37434 () Unit!37431)

(assert (=> b!1143061 (= e!650402 Unit!37434)))

(assert (=> b!1143061 (= lt!509258 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1143061 (= c!112563 (and (not lt!509258) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509263 () Unit!37431)

(declare-fun e!650403 () Unit!37431)

(assert (=> b!1143061 (= lt!509263 e!650403)))

(declare-fun lt!509260 () Unit!37431)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!394 (array!74249 array!74251 (_ BitVec 32) (_ BitVec 32) V!43361 V!43361 (_ BitVec 64) (_ BitVec 32) Int) Unit!37431)

(assert (=> b!1143061 (= lt!509260 (lemmaListMapContainsThenArrayContainsFrom!394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112561 () Bool)

(assert (=> b!1143061 (= c!112561 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761526 () Bool)

(declare-fun e!650395 () Bool)

(assert (=> b!1143061 (= res!761526 e!650395)))

(assert (=> b!1143061 (=> (not res!761526) (not e!650400))))

(assert (=> b!1143061 e!650400))

(declare-fun lt!509261 () Unit!37431)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74249 (_ BitVec 32) (_ BitVec 32)) Unit!37431)

(assert (=> b!1143061 (= lt!509261 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1143061 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24981)))

(declare-fun lt!509253 () Unit!37431)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74249 (_ BitVec 64) (_ BitVec 32) List!24984) Unit!37431)

(assert (=> b!1143061 (= lt!509253 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24981))))

(assert (=> b!1143061 false))

(declare-fun b!1143062 () Bool)

(declare-fun res!761527 () Bool)

(assert (=> b!1143062 (=> (not res!761527) (not e!650401))))

(declare-fun lt!509259 () array!74249)

(assert (=> b!1143062 (= res!761527 (arrayNoDuplicates!0 lt!509259 #b00000000000000000000000000000000 Nil!24981))))

(declare-fun b!1143063 () Bool)

(declare-fun res!761525 () Bool)

(assert (=> b!1143063 (=> (not res!761525) (not e!650407))))

(assert (=> b!1143063 (= res!761525 (and (= (size!36307 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36306 _keys!1208) (size!36307 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1143064 () Bool)

(declare-fun e!650399 () Bool)

(assert (=> b!1143064 (= e!650392 e!650399)))

(declare-fun res!761521 () Bool)

(assert (=> b!1143064 (=> res!761521 e!650399)))

(assert (=> b!1143064 (= res!761521 (not (= from!1455 i!673)))))

(declare-fun lt!509250 () array!74251)

(declare-fun lt!509262 () ListLongMap!16201)

(assert (=> b!1143064 (= lt!509262 (getCurrentListMapNoExtraKeys!4624 lt!509259 lt!509250 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!509249 () V!43361)

(assert (=> b!1143064 (= lt!509250 (array!74252 (store (arr!35770 _values!996) i!673 (ValueCellFull!13628 lt!509249)) (size!36307 _values!996)))))

(declare-fun dynLambda!2662 (Int (_ BitVec 64)) V!43361)

(assert (=> b!1143064 (= lt!509249 (dynLambda!2662 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509246 () ListLongMap!16201)

(assert (=> b!1143064 (= lt!509246 (getCurrentListMapNoExtraKeys!4624 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143065 () Bool)

(declare-fun Unit!37435 () Unit!37431)

(assert (=> b!1143065 (= e!650396 Unit!37435)))

(declare-fun b!1143066 () Bool)

(declare-fun e!650405 () Bool)

(declare-fun e!650398 () Bool)

(assert (=> b!1143066 (= e!650405 (and e!650398 mapRes!44837))))

(declare-fun condMapEmpty!44837 () Bool)

(declare-fun mapDefault!44837 () ValueCell!13628)

(assert (=> b!1143066 (= condMapEmpty!44837 (= (arr!35770 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13628)) mapDefault!44837)))))

(declare-fun b!1143067 () Bool)

(assert (=> b!1143067 (= c!112566 (and (not lt!509258) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1143067 (= e!650403 e!650397)))

(declare-fun bm!51348 () Bool)

(declare-fun call!51352 () Bool)

(declare-fun contains!6661 (ListLongMap!16201 (_ BitVec 64)) Bool)

(assert (=> bm!51348 (= call!51352 (contains!6661 (ite c!112563 lt!509255 call!51350) k0!934))))

(declare-fun b!1143068 () Bool)

(assert (=> b!1143068 (= e!650407 e!650401)))

(declare-fun res!761523 () Bool)

(assert (=> b!1143068 (=> (not res!761523) (not e!650401))))

(assert (=> b!1143068 (= res!761523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509259 mask!1564))))

(assert (=> b!1143068 (= lt!509259 (array!74250 (store (arr!35769 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36306 _keys!1208)))))

(declare-fun b!1143069 () Bool)

(assert (=> b!1143069 (= e!650395 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!761519 () Bool)

(assert (=> start!98776 (=> (not res!761519) (not e!650407))))

(assert (=> start!98776 (= res!761519 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36306 _keys!1208))))))

(assert (=> start!98776 e!650407))

(assert (=> start!98776 tp_is_empty!28675))

(declare-fun array_inv!27464 (array!74249) Bool)

(assert (=> start!98776 (array_inv!27464 _keys!1208)))

(assert (=> start!98776 true))

(assert (=> start!98776 tp!85145))

(declare-fun array_inv!27465 (array!74251) Bool)

(assert (=> start!98776 (and (array_inv!27465 _values!996) e!650405)))

(declare-fun b!1143070 () Bool)

(assert (=> b!1143070 (= e!650395 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509258) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!51349 () Bool)

(declare-fun +!3563 (ListLongMap!16201 tuple2!18224) ListLongMap!16201)

(assert (=> bm!51349 (= call!51349 (+!3563 (ite c!112563 lt!509255 lt!509248) (ite c!112563 (tuple2!18225 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112566 (tuple2!18225 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18225 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!51350 () Bool)

(assert (=> bm!51350 (= call!51353 (getCurrentListMapNoExtraKeys!4624 lt!509259 lt!509250 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143071 () Bool)

(assert (=> b!1143071 (contains!6661 call!51349 k0!934)))

(declare-fun lt!509251 () Unit!37431)

(assert (=> b!1143071 (= lt!509251 call!51351)))

(assert (=> b!1143071 call!51352))

(assert (=> b!1143071 (= lt!509255 (+!3563 lt!509248 (tuple2!18225 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!509256 () Unit!37431)

(assert (=> b!1143071 (= lt!509256 (addStillContains!790 lt!509248 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1143071 (= e!650403 lt!509251)))

(declare-fun b!1143072 () Bool)

(declare-fun call!51347 () Bool)

(assert (=> b!1143072 call!51347))

(declare-fun lt!509245 () Unit!37431)

(assert (=> b!1143072 (= lt!509245 call!51348)))

(assert (=> b!1143072 (= e!650396 lt!509245)))

(declare-fun b!1143073 () Bool)

(assert (=> b!1143073 (= e!650394 (= call!51353 call!51354))))

(declare-fun b!1143074 () Bool)

(declare-fun res!761520 () Bool)

(assert (=> b!1143074 (=> (not res!761520) (not e!650407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143074 (= res!761520 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44837 () Bool)

(declare-fun tp!85146 () Bool)

(assert (=> mapNonEmpty!44837 (= mapRes!44837 (and tp!85146 e!650406))))

(declare-fun mapRest!44837 () (Array (_ BitVec 32) ValueCell!13628))

(declare-fun mapKey!44837 () (_ BitVec 32))

(declare-fun mapValue!44837 () ValueCell!13628)

(assert (=> mapNonEmpty!44837 (= (arr!35770 _values!996) (store mapRest!44837 mapKey!44837 mapValue!44837))))

(declare-fun b!1143075 () Bool)

(assert (=> b!1143075 (= e!650398 tp_is_empty!28675)))

(declare-fun bm!51351 () Bool)

(assert (=> bm!51351 (= call!51347 call!51352)))

(declare-fun b!1143076 () Bool)

(declare-fun e!650404 () Bool)

(assert (=> b!1143076 (= e!650404 true)))

(declare-fun lt!509243 () V!43361)

(assert (=> b!1143076 (= (-!1247 (+!3563 lt!509248 (tuple2!18225 (select (arr!35769 _keys!1208) from!1455) lt!509243)) (select (arr!35769 _keys!1208) from!1455)) lt!509248)))

(declare-fun lt!509247 () Unit!37431)

(declare-fun addThenRemoveForNewKeyIsSame!106 (ListLongMap!16201 (_ BitVec 64) V!43361) Unit!37431)

(assert (=> b!1143076 (= lt!509247 (addThenRemoveForNewKeyIsSame!106 lt!509248 (select (arr!35769 _keys!1208) from!1455) lt!509243))))

(declare-fun get!18199 (ValueCell!13628 V!43361) V!43361)

(assert (=> b!1143076 (= lt!509243 (get!18199 (select (arr!35770 _values!996) from!1455) lt!509249))))

(declare-fun lt!509252 () Unit!37431)

(assert (=> b!1143076 (= lt!509252 e!650402)))

(declare-fun c!112565 () Bool)

(assert (=> b!1143076 (= c!112565 (contains!6661 lt!509248 k0!934))))

(assert (=> b!1143076 (= lt!509248 (getCurrentListMapNoExtraKeys!4624 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143077 () Bool)

(declare-fun lt!509244 () Unit!37431)

(assert (=> b!1143077 (= e!650397 lt!509244)))

(assert (=> b!1143077 (= lt!509244 call!51348)))

(assert (=> b!1143077 call!51347))

(declare-fun b!1143078 () Bool)

(assert (=> b!1143078 (= e!650399 e!650404)))

(declare-fun res!761524 () Bool)

(assert (=> b!1143078 (=> res!761524 e!650404)))

(assert (=> b!1143078 (= res!761524 (not (= (select (arr!35769 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1143078 e!650394))

(declare-fun c!112562 () Bool)

(assert (=> b!1143078 (= c!112562 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509254 () Unit!37431)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!502 (array!74249 array!74251 (_ BitVec 32) (_ BitVec 32) V!43361 V!43361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37431)

(assert (=> b!1143078 (= lt!509254 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98776 res!761519) b!1143074))

(assert (= (and b!1143074 res!761520) b!1143063))

(assert (= (and b!1143063 res!761525) b!1143057))

(assert (= (and b!1143057 res!761528) b!1143052))

(assert (= (and b!1143052 res!761518) b!1143059))

(assert (= (and b!1143059 res!761516) b!1143051))

(assert (= (and b!1143051 res!761529) b!1143053))

(assert (= (and b!1143053 res!761522) b!1143068))

(assert (= (and b!1143068 res!761523) b!1143062))

(assert (= (and b!1143062 res!761527) b!1143055))

(assert (= (and b!1143055 (not res!761517)) b!1143064))

(assert (= (and b!1143064 (not res!761521)) b!1143078))

(assert (= (and b!1143078 c!112562) b!1143060))

(assert (= (and b!1143078 (not c!112562)) b!1143073))

(assert (= (or b!1143060 b!1143073) bm!51350))

(assert (= (or b!1143060 b!1143073) bm!51347))

(assert (= (and b!1143078 (not res!761524)) b!1143076))

(assert (= (and b!1143076 c!112565) b!1143061))

(assert (= (and b!1143076 (not c!112565)) b!1143054))

(assert (= (and b!1143061 c!112563) b!1143071))

(assert (= (and b!1143061 (not c!112563)) b!1143067))

(assert (= (and b!1143067 c!112566) b!1143077))

(assert (= (and b!1143067 (not c!112566)) b!1143050))

(assert (= (and b!1143050 c!112564) b!1143072))

(assert (= (and b!1143050 (not c!112564)) b!1143065))

(assert (= (or b!1143077 b!1143072) bm!51344))

(assert (= (or b!1143077 b!1143072) bm!51346))

(assert (= (or b!1143077 b!1143072) bm!51351))

(assert (= (or b!1143071 bm!51351) bm!51348))

(assert (= (or b!1143071 bm!51344) bm!51345))

(assert (= (or b!1143071 bm!51346) bm!51349))

(assert (= (and b!1143061 c!112561) b!1143069))

(assert (= (and b!1143061 (not c!112561)) b!1143070))

(assert (= (and b!1143061 res!761526) b!1143058))

(assert (= (and b!1143066 condMapEmpty!44837) mapIsEmpty!44837))

(assert (= (and b!1143066 (not condMapEmpty!44837)) mapNonEmpty!44837))

(get-info :version)

(assert (= (and mapNonEmpty!44837 ((_ is ValueCellFull!13628) mapValue!44837)) b!1143056))

(assert (= (and b!1143066 ((_ is ValueCellFull!13628) mapDefault!44837)) b!1143075))

(assert (= start!98776 b!1143066))

(declare-fun b_lambda!19245 () Bool)

(assert (=> (not b_lambda!19245) (not b!1143064)))

(declare-fun t!36112 () Bool)

(declare-fun tb!8949 () Bool)

(assert (=> (and start!98776 (= defaultEntry!1004 defaultEntry!1004) t!36112) tb!8949))

(declare-fun result!18471 () Bool)

(assert (=> tb!8949 (= result!18471 tp_is_empty!28675)))

(assert (=> b!1143064 t!36112))

(declare-fun b_and!39143 () Bool)

(assert (= b_and!39141 (and (=> t!36112 result!18471) b_and!39143)))

(declare-fun m!1054685 () Bool)

(assert (=> bm!51350 m!1054685))

(declare-fun m!1054687 () Bool)

(assert (=> b!1143053 m!1054687))

(declare-fun m!1054689 () Bool)

(assert (=> b!1143074 m!1054689))

(declare-fun m!1054691 () Bool)

(assert (=> b!1143058 m!1054691))

(declare-fun m!1054693 () Bool)

(assert (=> b!1143061 m!1054693))

(declare-fun m!1054695 () Bool)

(assert (=> b!1143061 m!1054695))

(declare-fun m!1054697 () Bool)

(assert (=> b!1143061 m!1054697))

(declare-fun m!1054699 () Bool)

(assert (=> b!1143061 m!1054699))

(declare-fun m!1054701 () Bool)

(assert (=> bm!51347 m!1054701))

(declare-fun m!1054703 () Bool)

(assert (=> bm!51345 m!1054703))

(declare-fun m!1054705 () Bool)

(assert (=> b!1143052 m!1054705))

(declare-fun m!1054707 () Bool)

(assert (=> b!1143057 m!1054707))

(declare-fun m!1054709 () Bool)

(assert (=> b!1143064 m!1054709))

(declare-fun m!1054711 () Bool)

(assert (=> b!1143064 m!1054711))

(declare-fun m!1054713 () Bool)

(assert (=> b!1143064 m!1054713))

(declare-fun m!1054715 () Bool)

(assert (=> b!1143064 m!1054715))

(declare-fun m!1054717 () Bool)

(assert (=> b!1143055 m!1054717))

(declare-fun m!1054719 () Bool)

(assert (=> b!1143055 m!1054719))

(declare-fun m!1054721 () Bool)

(assert (=> bm!51349 m!1054721))

(declare-fun m!1054723 () Bool)

(assert (=> b!1143071 m!1054723))

(declare-fun m!1054725 () Bool)

(assert (=> b!1143071 m!1054725))

(declare-fun m!1054727 () Bool)

(assert (=> b!1143071 m!1054727))

(declare-fun m!1054729 () Bool)

(assert (=> b!1143078 m!1054729))

(declare-fun m!1054731 () Bool)

(assert (=> b!1143078 m!1054731))

(declare-fun m!1054733 () Bool)

(assert (=> b!1143068 m!1054733))

(declare-fun m!1054735 () Bool)

(assert (=> b!1143068 m!1054735))

(declare-fun m!1054737 () Bool)

(assert (=> b!1143060 m!1054737))

(declare-fun m!1054739 () Bool)

(assert (=> b!1143062 m!1054739))

(assert (=> b!1143069 m!1054691))

(assert (=> b!1143076 m!1054701))

(declare-fun m!1054741 () Bool)

(assert (=> b!1143076 m!1054741))

(assert (=> b!1143076 m!1054729))

(declare-fun m!1054743 () Bool)

(assert (=> b!1143076 m!1054743))

(declare-fun m!1054745 () Bool)

(assert (=> b!1143076 m!1054745))

(assert (=> b!1143076 m!1054729))

(declare-fun m!1054747 () Bool)

(assert (=> b!1143076 m!1054747))

(declare-fun m!1054749 () Bool)

(assert (=> b!1143076 m!1054749))

(assert (=> b!1143076 m!1054741))

(assert (=> b!1143076 m!1054729))

(assert (=> b!1143076 m!1054745))

(declare-fun m!1054751 () Bool)

(assert (=> b!1143076 m!1054751))

(declare-fun m!1054753 () Bool)

(assert (=> bm!51348 m!1054753))

(declare-fun m!1054755 () Bool)

(assert (=> b!1143051 m!1054755))

(declare-fun m!1054757 () Bool)

(assert (=> start!98776 m!1054757))

(declare-fun m!1054759 () Bool)

(assert (=> start!98776 m!1054759))

(declare-fun m!1054761 () Bool)

(assert (=> mapNonEmpty!44837 m!1054761))

(check-sat (not b_next!24145) (not b!1143052) (not b!1143071) (not b!1143064) (not mapNonEmpty!44837) (not bm!51345) (not bm!51348) (not b!1143074) (not bm!51349) (not start!98776) tp_is_empty!28675 (not b!1143057) (not b!1143058) (not bm!51347) (not b!1143051) (not b!1143062) (not bm!51350) (not b!1143061) (not b!1143076) (not b!1143060) b_and!39143 (not b!1143078) (not b_lambda!19245) (not b!1143055) (not b!1143069) (not b!1143068))
(check-sat b_and!39143 (not b_next!24145))
