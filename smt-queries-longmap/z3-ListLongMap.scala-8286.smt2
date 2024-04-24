; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101224 () Bool)

(assert start!101224)

(declare-fun b_free!25987 () Bool)

(declare-fun b_next!25987 () Bool)

(assert (=> start!101224 (= b_free!25987 (not b_next!25987))))

(declare-fun tp!90977 () Bool)

(declare-fun b_and!43057 () Bool)

(assert (=> start!101224 (= tp!90977 b_and!43057)))

(declare-fun b!1210410 () Bool)

(declare-fun res!804143 () Bool)

(declare-fun e!687564 () Bool)

(assert (=> b!1210410 (=> (not res!804143) (not e!687564))))

(declare-datatypes ((array!78201 0))(
  ( (array!78202 (arr!37731 (Array (_ BitVec 32) (_ BitVec 64))) (size!38268 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78201)

(declare-datatypes ((List!26591 0))(
  ( (Nil!26588) (Cons!26587 (h!27805 (_ BitVec 64)) (t!39550 List!26591)) )
))
(declare-fun arrayNoDuplicates!0 (array!78201 (_ BitVec 32) List!26591) Bool)

(assert (=> b!1210410 (= res!804143 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26588))))

(declare-datatypes ((V!46049 0))(
  ( (V!46050 (val!15402 Int)) )
))
(declare-fun zeroValue!944 () V!46049)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!59347 () Bool)

(declare-datatypes ((ValueCell!14636 0))(
  ( (ValueCellFull!14636 (v!18049 V!46049)) (EmptyCell!14636) )
))
(declare-datatypes ((array!78203 0))(
  ( (array!78204 (arr!37732 (Array (_ BitVec 32) ValueCell!14636)) (size!38269 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78203)

(declare-fun minValue!944 () V!46049)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19784 0))(
  ( (tuple2!19785 (_1!9903 (_ BitVec 64)) (_2!9903 V!46049)) )
))
(declare-datatypes ((List!26592 0))(
  ( (Nil!26589) (Cons!26588 (h!27806 tuple2!19784) (t!39551 List!26592)) )
))
(declare-datatypes ((ListLongMap!17761 0))(
  ( (ListLongMap!17762 (toList!8896 List!26592)) )
))
(declare-fun call!59352 () ListLongMap!17761)

(declare-fun getCurrentListMapNoExtraKeys!5358 (array!78201 array!78203 (_ BitVec 32) (_ BitVec 32) V!46049 V!46049 (_ BitVec 32) Int) ListLongMap!17761)

(assert (=> bm!59347 (= call!59352 (getCurrentListMapNoExtraKeys!5358 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210411 () Bool)

(declare-fun e!687562 () Bool)

(assert (=> b!1210411 (= e!687564 e!687562)))

(declare-fun res!804135 () Bool)

(assert (=> b!1210411 (=> (not res!804135) (not e!687562))))

(declare-fun lt!549298 () array!78201)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78201 (_ BitVec 32)) Bool)

(assert (=> b!1210411 (= res!804135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549298 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210411 (= lt!549298 (array!78202 (store (arr!37731 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38268 _keys!1208)))))

(declare-fun b!1210413 () Bool)

(declare-fun e!687554 () Bool)

(declare-fun e!687558 () Bool)

(assert (=> b!1210413 (= e!687554 e!687558)))

(declare-fun res!804149 () Bool)

(assert (=> b!1210413 (=> res!804149 e!687558)))

(assert (=> b!1210413 (= res!804149 (not (= from!1455 i!673)))))

(declare-fun lt!549300 () array!78203)

(declare-fun lt!549307 () ListLongMap!17761)

(assert (=> b!1210413 (= lt!549307 (getCurrentListMapNoExtraKeys!5358 lt!549298 lt!549300 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3277 (Int (_ BitVec 64)) V!46049)

(assert (=> b!1210413 (= lt!549300 (array!78204 (store (arr!37732 _values!996) i!673 (ValueCellFull!14636 (dynLambda!3277 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38269 _values!996)))))

(declare-fun lt!549296 () ListLongMap!17761)

(assert (=> b!1210413 (= lt!549296 (getCurrentListMapNoExtraKeys!5358 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1210414 () Bool)

(declare-fun e!687565 () Bool)

(declare-fun e!687566 () Bool)

(declare-fun mapRes!47905 () Bool)

(assert (=> b!1210414 (= e!687565 (and e!687566 mapRes!47905))))

(declare-fun condMapEmpty!47905 () Bool)

(declare-fun mapDefault!47905 () ValueCell!14636)

(assert (=> b!1210414 (= condMapEmpty!47905 (= (arr!37732 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14636)) mapDefault!47905)))))

(declare-fun b!1210415 () Bool)

(declare-fun e!687552 () Bool)

(declare-fun call!59351 () ListLongMap!17761)

(assert (=> b!1210415 (= e!687552 (= call!59351 call!59352))))

(declare-fun b!1210416 () Bool)

(declare-fun tp_is_empty!30691 () Bool)

(assert (=> b!1210416 (= e!687566 tp_is_empty!30691)))

(declare-fun b!1210417 () Bool)

(declare-fun res!804144 () Bool)

(assert (=> b!1210417 (=> (not res!804144) (not e!687564))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1210417 (= res!804144 (= (select (arr!37731 _keys!1208) i!673) k0!934))))

(declare-fun bm!59348 () Bool)

(declare-fun call!59353 () ListLongMap!17761)

(declare-fun call!59356 () ListLongMap!17761)

(assert (=> bm!59348 (= call!59353 call!59356)))

(declare-fun b!1210418 () Bool)

(declare-fun e!687550 () Bool)

(assert (=> b!1210418 (= e!687550 true)))

(declare-fun lt!549304 () Bool)

(declare-fun contains!6985 (List!26591 (_ BitVec 64)) Bool)

(assert (=> b!1210418 (= lt!549304 (contains!6985 Nil!26588 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1210419 () Bool)

(declare-fun c!119421 () Bool)

(declare-fun lt!549292 () Bool)

(assert (=> b!1210419 (= c!119421 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549292))))

(declare-datatypes ((Unit!40032 0))(
  ( (Unit!40033) )
))
(declare-fun e!687559 () Unit!40032)

(declare-fun e!687557 () Unit!40032)

(assert (=> b!1210419 (= e!687559 e!687557)))

(declare-fun call!59354 () Bool)

(declare-fun lt!549297 () ListLongMap!17761)

(declare-fun bm!59349 () Bool)

(declare-fun c!119420 () Bool)

(declare-fun contains!6986 (ListLongMap!17761 (_ BitVec 64)) Bool)

(assert (=> bm!59349 (= call!59354 (contains!6986 (ite c!119420 lt!549297 call!59353) k0!934))))

(declare-fun bm!59350 () Bool)

(declare-fun call!59357 () Bool)

(assert (=> bm!59350 (= call!59357 call!59354)))

(declare-fun b!1210420 () Bool)

(assert (=> b!1210420 call!59357))

(declare-fun lt!549305 () Unit!40032)

(declare-fun call!59355 () Unit!40032)

(assert (=> b!1210420 (= lt!549305 call!59355)))

(assert (=> b!1210420 (= e!687559 lt!549305)))

(declare-fun mapIsEmpty!47905 () Bool)

(assert (=> mapIsEmpty!47905 mapRes!47905))

(declare-fun bm!59351 () Bool)

(declare-fun c!119418 () Bool)

(declare-fun lt!549306 () ListLongMap!17761)

(declare-fun +!4058 (ListLongMap!17761 tuple2!19784) ListLongMap!17761)

(assert (=> bm!59351 (= call!59356 (+!4058 lt!549306 (ite (or c!119420 c!119418) (tuple2!19785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1210421 () Bool)

(declare-fun -!1829 (ListLongMap!17761 (_ BitVec 64)) ListLongMap!17761)

(assert (=> b!1210421 (= e!687552 (= call!59351 (-!1829 call!59352 k0!934)))))

(declare-fun b!1210422 () Bool)

(declare-fun res!804132 () Bool)

(assert (=> b!1210422 (=> (not res!804132) (not e!687562))))

(assert (=> b!1210422 (= res!804132 (arrayNoDuplicates!0 lt!549298 #b00000000000000000000000000000000 Nil!26588))))

(declare-fun b!1210423 () Bool)

(declare-fun lt!549301 () Unit!40032)

(assert (=> b!1210423 (= e!687557 lt!549301)))

(assert (=> b!1210423 (= lt!549301 call!59355)))

(assert (=> b!1210423 call!59357))

(declare-fun b!1210424 () Bool)

(declare-fun e!687556 () Unit!40032)

(declare-fun lt!549291 () Unit!40032)

(assert (=> b!1210424 (= e!687556 lt!549291)))

(declare-fun lt!549293 () Unit!40032)

(declare-fun addStillContains!1041 (ListLongMap!17761 (_ BitVec 64) V!46049 (_ BitVec 64)) Unit!40032)

(assert (=> b!1210424 (= lt!549293 (addStillContains!1041 lt!549306 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1210424 (= lt!549297 call!59356)))

(assert (=> b!1210424 call!59354))

(declare-fun call!59350 () Unit!40032)

(assert (=> b!1210424 (= lt!549291 call!59350)))

(assert (=> b!1210424 (contains!6986 (+!4058 lt!549297 (tuple2!19785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1210425 () Bool)

(declare-fun e!687563 () Bool)

(assert (=> b!1210425 (= e!687558 e!687563)))

(declare-fun res!804137 () Bool)

(assert (=> b!1210425 (=> res!804137 e!687563)))

(assert (=> b!1210425 (= res!804137 (not (= (select (arr!37731 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1210425 e!687552))

(declare-fun c!119419 () Bool)

(assert (=> b!1210425 (= c!119419 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549299 () Unit!40032)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1047 (array!78201 array!78203 (_ BitVec 32) (_ BitVec 32) V!46049 V!46049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40032)

(assert (=> b!1210425 (= lt!549299 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1047 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210426 () Bool)

(declare-fun res!804133 () Bool)

(assert (=> b!1210426 (=> (not res!804133) (not e!687564))))

(assert (=> b!1210426 (= res!804133 (and (= (size!38269 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38268 _keys!1208) (size!38269 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1210427 () Bool)

(declare-fun e!687561 () Bool)

(assert (=> b!1210427 (= e!687563 e!687561)))

(declare-fun res!804136 () Bool)

(assert (=> b!1210427 (=> res!804136 e!687561)))

(assert (=> b!1210427 (= res!804136 (not (contains!6986 lt!549306 k0!934)))))

(assert (=> b!1210427 (= lt!549306 (getCurrentListMapNoExtraKeys!5358 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210428 () Bool)

(declare-fun e!687560 () Bool)

(declare-fun arrayContainsKey!0 (array!78201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210428 (= e!687560 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210412 () Bool)

(declare-fun res!804147 () Bool)

(assert (=> b!1210412 (=> (not res!804147) (not e!687564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210412 (= res!804147 (validKeyInArray!0 k0!934))))

(declare-fun res!804145 () Bool)

(assert (=> start!101224 (=> (not res!804145) (not e!687564))))

(assert (=> start!101224 (= res!804145 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38268 _keys!1208))))))

(assert (=> start!101224 e!687564))

(assert (=> start!101224 tp_is_empty!30691))

(declare-fun array_inv!28804 (array!78201) Bool)

(assert (=> start!101224 (array_inv!28804 _keys!1208)))

(assert (=> start!101224 true))

(assert (=> start!101224 tp!90977))

(declare-fun array_inv!28805 (array!78203) Bool)

(assert (=> start!101224 (and (array_inv!28805 _values!996) e!687565)))

(declare-fun b!1210429 () Bool)

(declare-fun e!687553 () Bool)

(assert (=> b!1210429 (= e!687553 tp_is_empty!30691)))

(declare-fun bm!59352 () Bool)

(assert (=> bm!59352 (= call!59350 (addStillContains!1041 (ite c!119420 lt!549297 lt!549306) (ite c!119420 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119418 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119420 minValue!944 (ite c!119418 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapNonEmpty!47905 () Bool)

(declare-fun tp!90976 () Bool)

(assert (=> mapNonEmpty!47905 (= mapRes!47905 (and tp!90976 e!687553))))

(declare-fun mapValue!47905 () ValueCell!14636)

(declare-fun mapKey!47905 () (_ BitVec 32))

(declare-fun mapRest!47905 () (Array (_ BitVec 32) ValueCell!14636))

(assert (=> mapNonEmpty!47905 (= (arr!37732 _values!996) (store mapRest!47905 mapKey!47905 mapValue!47905))))

(declare-fun b!1210430 () Bool)

(assert (=> b!1210430 (= e!687561 e!687550)))

(declare-fun res!804146 () Bool)

(assert (=> b!1210430 (=> res!804146 e!687550)))

(assert (=> b!1210430 (= res!804146 (or (bvsge (size!38268 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38268 _keys!1208)) (bvsge from!1455 (size!38268 _keys!1208))))))

(assert (=> b!1210430 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26588)))

(declare-fun lt!549295 () Unit!40032)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78201 (_ BitVec 32) (_ BitVec 32)) Unit!40032)

(assert (=> b!1210430 (= lt!549295 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!687555 () Bool)

(assert (=> b!1210430 e!687555))

(declare-fun res!804142 () Bool)

(assert (=> b!1210430 (=> (not res!804142) (not e!687555))))

(assert (=> b!1210430 (= res!804142 e!687560)))

(declare-fun c!119422 () Bool)

(assert (=> b!1210430 (= c!119422 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!549303 () Unit!40032)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!593 (array!78201 array!78203 (_ BitVec 32) (_ BitVec 32) V!46049 V!46049 (_ BitVec 64) (_ BitVec 32) Int) Unit!40032)

(assert (=> b!1210430 (= lt!549303 (lemmaListMapContainsThenArrayContainsFrom!593 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!549302 () Unit!40032)

(assert (=> b!1210430 (= lt!549302 e!687556)))

(assert (=> b!1210430 (= c!119420 (and (not lt!549292) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1210430 (= lt!549292 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!59353 () Bool)

(assert (=> bm!59353 (= call!59351 (getCurrentListMapNoExtraKeys!5358 lt!549298 lt!549300 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210431 () Bool)

(declare-fun res!804140 () Bool)

(assert (=> b!1210431 (=> (not res!804140) (not e!687564))))

(assert (=> b!1210431 (= res!804140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1210432 () Bool)

(declare-fun res!804134 () Bool)

(assert (=> b!1210432 (=> res!804134 e!687550)))

(declare-fun noDuplicate!1644 (List!26591) Bool)

(assert (=> b!1210432 (= res!804134 (not (noDuplicate!1644 Nil!26588)))))

(declare-fun bm!59354 () Bool)

(assert (=> bm!59354 (= call!59355 call!59350)))

(declare-fun b!1210433 () Bool)

(assert (=> b!1210433 (= e!687560 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549292) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1210434 () Bool)

(declare-fun res!804141 () Bool)

(assert (=> b!1210434 (=> (not res!804141) (not e!687564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210434 (= res!804141 (validMask!0 mask!1564))))

(declare-fun b!1210435 () Bool)

(declare-fun res!804148 () Bool)

(assert (=> b!1210435 (=> (not res!804148) (not e!687564))))

(assert (=> b!1210435 (= res!804148 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38268 _keys!1208))))))

(declare-fun b!1210436 () Bool)

(declare-fun Unit!40034 () Unit!40032)

(assert (=> b!1210436 (= e!687557 Unit!40034)))

(declare-fun b!1210437 () Bool)

(assert (=> b!1210437 (= e!687562 (not e!687554))))

(declare-fun res!804139 () Bool)

(assert (=> b!1210437 (=> res!804139 e!687554)))

(assert (=> b!1210437 (= res!804139 (bvsgt from!1455 i!673))))

(assert (=> b!1210437 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549294 () Unit!40032)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78201 (_ BitVec 64) (_ BitVec 32)) Unit!40032)

(assert (=> b!1210437 (= lt!549294 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1210438 () Bool)

(assert (=> b!1210438 (= e!687555 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210439 () Bool)

(assert (=> b!1210439 (= e!687556 e!687559)))

(assert (=> b!1210439 (= c!119418 (and (not lt!549292) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1210440 () Bool)

(declare-fun res!804138 () Bool)

(assert (=> b!1210440 (=> res!804138 e!687550)))

(assert (=> b!1210440 (= res!804138 (contains!6985 Nil!26588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!101224 res!804145) b!1210434))

(assert (= (and b!1210434 res!804141) b!1210426))

(assert (= (and b!1210426 res!804133) b!1210431))

(assert (= (and b!1210431 res!804140) b!1210410))

(assert (= (and b!1210410 res!804143) b!1210435))

(assert (= (and b!1210435 res!804148) b!1210412))

(assert (= (and b!1210412 res!804147) b!1210417))

(assert (= (and b!1210417 res!804144) b!1210411))

(assert (= (and b!1210411 res!804135) b!1210422))

(assert (= (and b!1210422 res!804132) b!1210437))

(assert (= (and b!1210437 (not res!804139)) b!1210413))

(assert (= (and b!1210413 (not res!804149)) b!1210425))

(assert (= (and b!1210425 c!119419) b!1210421))

(assert (= (and b!1210425 (not c!119419)) b!1210415))

(assert (= (or b!1210421 b!1210415) bm!59353))

(assert (= (or b!1210421 b!1210415) bm!59347))

(assert (= (and b!1210425 (not res!804137)) b!1210427))

(assert (= (and b!1210427 (not res!804136)) b!1210430))

(assert (= (and b!1210430 c!119420) b!1210424))

(assert (= (and b!1210430 (not c!119420)) b!1210439))

(assert (= (and b!1210439 c!119418) b!1210420))

(assert (= (and b!1210439 (not c!119418)) b!1210419))

(assert (= (and b!1210419 c!119421) b!1210423))

(assert (= (and b!1210419 (not c!119421)) b!1210436))

(assert (= (or b!1210420 b!1210423) bm!59354))

(assert (= (or b!1210420 b!1210423) bm!59348))

(assert (= (or b!1210420 b!1210423) bm!59350))

(assert (= (or b!1210424 bm!59350) bm!59349))

(assert (= (or b!1210424 bm!59354) bm!59352))

(assert (= (or b!1210424 bm!59348) bm!59351))

(assert (= (and b!1210430 c!119422) b!1210428))

(assert (= (and b!1210430 (not c!119422)) b!1210433))

(assert (= (and b!1210430 res!804142) b!1210438))

(assert (= (and b!1210430 (not res!804146)) b!1210432))

(assert (= (and b!1210432 (not res!804134)) b!1210440))

(assert (= (and b!1210440 (not res!804138)) b!1210418))

(assert (= (and b!1210414 condMapEmpty!47905) mapIsEmpty!47905))

(assert (= (and b!1210414 (not condMapEmpty!47905)) mapNonEmpty!47905))

(get-info :version)

(assert (= (and mapNonEmpty!47905 ((_ is ValueCellFull!14636) mapValue!47905)) b!1210429))

(assert (= (and b!1210414 ((_ is ValueCellFull!14636) mapDefault!47905)) b!1210416))

(assert (= start!101224 b!1210414))

(declare-fun b_lambda!21581 () Bool)

(assert (=> (not b_lambda!21581) (not b!1210413)))

(declare-fun t!39549 () Bool)

(declare-fun tb!10779 () Bool)

(assert (=> (and start!101224 (= defaultEntry!1004 defaultEntry!1004) t!39549) tb!10779))

(declare-fun result!22159 () Bool)

(assert (=> tb!10779 (= result!22159 tp_is_empty!30691)))

(assert (=> b!1210413 t!39549))

(declare-fun b_and!43059 () Bool)

(assert (= b_and!43057 (and (=> t!39549 result!22159) b_and!43059)))

(declare-fun m!1116501 () Bool)

(assert (=> b!1210411 m!1116501))

(declare-fun m!1116503 () Bool)

(assert (=> b!1210411 m!1116503))

(declare-fun m!1116505 () Bool)

(assert (=> b!1210412 m!1116505))

(declare-fun m!1116507 () Bool)

(assert (=> b!1210430 m!1116507))

(declare-fun m!1116509 () Bool)

(assert (=> b!1210430 m!1116509))

(declare-fun m!1116511 () Bool)

(assert (=> b!1210430 m!1116511))

(declare-fun m!1116513 () Bool)

(assert (=> bm!59347 m!1116513))

(declare-fun m!1116515 () Bool)

(assert (=> b!1210425 m!1116515))

(declare-fun m!1116517 () Bool)

(assert (=> b!1210425 m!1116517))

(declare-fun m!1116519 () Bool)

(assert (=> bm!59352 m!1116519))

(declare-fun m!1116521 () Bool)

(assert (=> b!1210431 m!1116521))

(declare-fun m!1116523 () Bool)

(assert (=> b!1210434 m!1116523))

(declare-fun m!1116525 () Bool)

(assert (=> bm!59349 m!1116525))

(declare-fun m!1116527 () Bool)

(assert (=> b!1210410 m!1116527))

(declare-fun m!1116529 () Bool)

(assert (=> b!1210438 m!1116529))

(declare-fun m!1116531 () Bool)

(assert (=> b!1210417 m!1116531))

(declare-fun m!1116533 () Bool)

(assert (=> bm!59351 m!1116533))

(declare-fun m!1116535 () Bool)

(assert (=> b!1210424 m!1116535))

(declare-fun m!1116537 () Bool)

(assert (=> b!1210424 m!1116537))

(assert (=> b!1210424 m!1116537))

(declare-fun m!1116539 () Bool)

(assert (=> b!1210424 m!1116539))

(declare-fun m!1116541 () Bool)

(assert (=> b!1210427 m!1116541))

(assert (=> b!1210427 m!1116513))

(declare-fun m!1116543 () Bool)

(assert (=> bm!59353 m!1116543))

(declare-fun m!1116545 () Bool)

(assert (=> b!1210440 m!1116545))

(declare-fun m!1116547 () Bool)

(assert (=> start!101224 m!1116547))

(declare-fun m!1116549 () Bool)

(assert (=> start!101224 m!1116549))

(declare-fun m!1116551 () Bool)

(assert (=> b!1210421 m!1116551))

(declare-fun m!1116553 () Bool)

(assert (=> mapNonEmpty!47905 m!1116553))

(declare-fun m!1116555 () Bool)

(assert (=> b!1210413 m!1116555))

(declare-fun m!1116557 () Bool)

(assert (=> b!1210413 m!1116557))

(declare-fun m!1116559 () Bool)

(assert (=> b!1210413 m!1116559))

(declare-fun m!1116561 () Bool)

(assert (=> b!1210413 m!1116561))

(declare-fun m!1116563 () Bool)

(assert (=> b!1210422 m!1116563))

(declare-fun m!1116565 () Bool)

(assert (=> b!1210418 m!1116565))

(declare-fun m!1116567 () Bool)

(assert (=> b!1210432 m!1116567))

(declare-fun m!1116569 () Bool)

(assert (=> b!1210437 m!1116569))

(declare-fun m!1116571 () Bool)

(assert (=> b!1210437 m!1116571))

(assert (=> b!1210428 m!1116529))

(check-sat (not bm!59349) (not b!1210434) (not b!1210418) (not b!1210427) (not start!101224) b_and!43059 (not b!1210424) (not b_lambda!21581) (not b!1210413) (not bm!59347) (not b!1210422) (not b!1210440) (not b!1210438) (not b!1210431) (not bm!59351) (not b!1210412) (not b_next!25987) (not b!1210411) (not bm!59352) (not b!1210430) (not b!1210410) (not bm!59353) (not b!1210421) (not b!1210425) tp_is_empty!30691 (not b!1210432) (not mapNonEmpty!47905) (not b!1210428) (not b!1210437))
(check-sat b_and!43059 (not b_next!25987))
