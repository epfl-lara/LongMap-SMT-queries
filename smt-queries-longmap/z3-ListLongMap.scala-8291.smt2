; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101012 () Bool)

(assert start!101012)

(declare-fun b_free!26017 () Bool)

(declare-fun b_next!26017 () Bool)

(assert (=> start!101012 (= b_free!26017 (not b_next!26017))))

(declare-fun tp!91066 () Bool)

(declare-fun b_and!43089 () Bool)

(assert (=> start!101012 (= tp!91066 b_and!43089)))

(declare-datatypes ((V!46089 0))(
  ( (V!46090 (val!15417 Int)) )
))
(declare-datatypes ((tuple2!19874 0))(
  ( (tuple2!19875 (_1!9948 (_ BitVec 64)) (_2!9948 V!46089)) )
))
(declare-datatypes ((List!26652 0))(
  ( (Nil!26649) (Cons!26648 (h!27857 tuple2!19874) (t!39640 List!26652)) )
))
(declare-datatypes ((ListLongMap!17843 0))(
  ( (ListLongMap!17844 (toList!8937 List!26652)) )
))
(declare-fun call!59622 () ListLongMap!17843)

(declare-fun b!1210348 () Bool)

(declare-fun call!59627 () ListLongMap!17843)

(declare-fun e!687385 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1816 (ListLongMap!17843 (_ BitVec 64)) ListLongMap!17843)

(assert (=> b!1210348 (= e!687385 (= call!59622 (-!1816 call!59627 k0!934)))))

(declare-fun b!1210349 () Bool)

(declare-fun e!687387 () Bool)

(declare-fun e!687380 () Bool)

(assert (=> b!1210349 (= e!687387 e!687380)))

(declare-fun res!804268 () Bool)

(assert (=> b!1210349 (=> res!804268 e!687380)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210349 (= res!804268 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46089)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14651 0))(
  ( (ValueCellFull!14651 (v!18067 V!46089)) (EmptyCell!14651) )
))
(declare-datatypes ((array!78140 0))(
  ( (array!78141 (arr!37707 (Array (_ BitVec 32) ValueCell!14651)) (size!38245 (_ BitVec 32))) )
))
(declare-fun lt!549407 () array!78140)

(declare-datatypes ((array!78142 0))(
  ( (array!78143 (arr!37708 (Array (_ BitVec 32) (_ BitVec 64))) (size!38246 (_ BitVec 32))) )
))
(declare-fun lt!549402 () array!78142)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!549411 () ListLongMap!17843)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46089)

(declare-fun getCurrentListMapNoExtraKeys!5379 (array!78142 array!78140 (_ BitVec 32) (_ BitVec 32) V!46089 V!46089 (_ BitVec 32) Int) ListLongMap!17843)

(assert (=> b!1210349 (= lt!549411 (getCurrentListMapNoExtraKeys!5379 lt!549402 lt!549407 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78140)

(declare-fun dynLambda!3239 (Int (_ BitVec 64)) V!46089)

(assert (=> b!1210349 (= lt!549407 (array!78141 (store (arr!37707 _values!996) i!673 (ValueCellFull!14651 (dynLambda!3239 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38245 _values!996)))))

(declare-fun _keys!1208 () array!78142)

(declare-fun lt!549416 () ListLongMap!17843)

(assert (=> b!1210349 (= lt!549416 (getCurrentListMapNoExtraKeys!5379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!687372 () Bool)

(declare-fun b!1210350 () Bool)

(declare-fun lt!549408 () Bool)

(assert (=> b!1210350 (= e!687372 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549408) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1210351 () Bool)

(declare-fun e!687374 () Bool)

(assert (=> b!1210351 (= e!687380 e!687374)))

(declare-fun res!804271 () Bool)

(assert (=> b!1210351 (=> res!804271 e!687374)))

(assert (=> b!1210351 (= res!804271 (not (= (select (arr!37708 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1210351 e!687385))

(declare-fun c!119241 () Bool)

(assert (=> b!1210351 (= c!119241 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39960 0))(
  ( (Unit!39961) )
))
(declare-fun lt!549401 () Unit!39960)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1059 (array!78142 array!78140 (_ BitVec 32) (_ BitVec 32) V!46089 V!46089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39960)

(assert (=> b!1210351 (= lt!549401 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1059 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47950 () Bool)

(declare-fun mapRes!47950 () Bool)

(declare-fun tp!91067 () Bool)

(declare-fun e!687386 () Bool)

(assert (=> mapNonEmpty!47950 (= mapRes!47950 (and tp!91067 e!687386))))

(declare-fun mapValue!47950 () ValueCell!14651)

(declare-fun mapRest!47950 () (Array (_ BitVec 32) ValueCell!14651))

(declare-fun mapKey!47950 () (_ BitVec 32))

(assert (=> mapNonEmpty!47950 (= (arr!37707 _values!996) (store mapRest!47950 mapKey!47950 mapValue!47950))))

(declare-fun b!1210353 () Bool)

(declare-fun lt!549415 () ListLongMap!17843)

(declare-fun contains!6945 (ListLongMap!17843 (_ BitVec 64)) Bool)

(assert (=> b!1210353 (= e!687374 (not (contains!6945 lt!549415 (select (arr!37708 _keys!1208) from!1455))))))

(declare-fun lt!549412 () Unit!39960)

(declare-fun e!687383 () Unit!39960)

(assert (=> b!1210353 (= lt!549412 e!687383)))

(declare-fun c!119240 () Bool)

(assert (=> b!1210353 (= c!119240 (contains!6945 lt!549415 k0!934))))

(assert (=> b!1210353 (= lt!549415 (getCurrentListMapNoExtraKeys!5379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59618 () Bool)

(assert (=> bm!59618 (= call!59622 (getCurrentListMapNoExtraKeys!5379 lt!549402 lt!549407 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59619 () Bool)

(declare-fun c!119237 () Bool)

(declare-fun call!59625 () ListLongMap!17843)

(declare-fun c!119239 () Bool)

(declare-fun +!4061 (ListLongMap!17843 tuple2!19874) ListLongMap!17843)

(assert (=> bm!59619 (= call!59625 (+!4061 lt!549415 (ite (or c!119239 c!119237) (tuple2!19875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1210354 () Bool)

(declare-fun e!687376 () Unit!39960)

(declare-fun e!687373 () Unit!39960)

(assert (=> b!1210354 (= e!687376 e!687373)))

(declare-fun c!119236 () Bool)

(assert (=> b!1210354 (= c!119236 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549408))))

(declare-fun b!1210355 () Bool)

(declare-fun arrayContainsKey!0 (array!78142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210355 (= e!687372 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210356 () Bool)

(declare-fun Unit!39962 () Unit!39960)

(assert (=> b!1210356 (= e!687383 Unit!39962)))

(assert (=> b!1210356 (= lt!549408 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1210356 (= c!119239 (and (not lt!549408) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549414 () Unit!39960)

(declare-fun e!687377 () Unit!39960)

(assert (=> b!1210356 (= lt!549414 e!687377)))

(declare-fun lt!549413 () Unit!39960)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!587 (array!78142 array!78140 (_ BitVec 32) (_ BitVec 32) V!46089 V!46089 (_ BitVec 64) (_ BitVec 32) Int) Unit!39960)

(assert (=> b!1210356 (= lt!549413 (lemmaListMapContainsThenArrayContainsFrom!587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119238 () Bool)

(assert (=> b!1210356 (= c!119238 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804260 () Bool)

(assert (=> b!1210356 (= res!804260 e!687372)))

(declare-fun e!687379 () Bool)

(assert (=> b!1210356 (=> (not res!804260) (not e!687379))))

(assert (=> b!1210356 e!687379))

(declare-fun lt!549410 () Unit!39960)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78142 (_ BitVec 32) (_ BitVec 32)) Unit!39960)

(assert (=> b!1210356 (= lt!549410 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26653 0))(
  ( (Nil!26650) (Cons!26649 (h!27858 (_ BitVec 64)) (t!39641 List!26653)) )
))
(declare-fun arrayNoDuplicates!0 (array!78142 (_ BitVec 32) List!26653) Bool)

(assert (=> b!1210356 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26650)))

(declare-fun lt!549418 () Unit!39960)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78142 (_ BitVec 64) (_ BitVec 32) List!26653) Unit!39960)

(assert (=> b!1210356 (= lt!549418 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26650))))

(assert (=> b!1210356 false))

(declare-fun b!1210357 () Bool)

(declare-fun tp_is_empty!30721 () Bool)

(assert (=> b!1210357 (= e!687386 tp_is_empty!30721)))

(declare-fun b!1210358 () Bool)

(declare-fun res!804263 () Bool)

(declare-fun e!687381 () Bool)

(assert (=> b!1210358 (=> (not res!804263) (not e!687381))))

(assert (=> b!1210358 (= res!804263 (= (select (arr!37708 _keys!1208) i!673) k0!934))))

(declare-fun b!1210359 () Bool)

(declare-fun e!687378 () Bool)

(declare-fun e!687382 () Bool)

(assert (=> b!1210359 (= e!687378 (and e!687382 mapRes!47950))))

(declare-fun condMapEmpty!47950 () Bool)

(declare-fun mapDefault!47950 () ValueCell!14651)

(assert (=> b!1210359 (= condMapEmpty!47950 (= (arr!37707 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14651)) mapDefault!47950)))))

(declare-fun mapIsEmpty!47950 () Bool)

(assert (=> mapIsEmpty!47950 mapRes!47950))

(declare-fun b!1210360 () Bool)

(declare-fun Unit!39963 () Unit!39960)

(assert (=> b!1210360 (= e!687383 Unit!39963)))

(declare-fun res!804262 () Bool)

(assert (=> start!101012 (=> (not res!804262) (not e!687381))))

(assert (=> start!101012 (= res!804262 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38246 _keys!1208))))))

(assert (=> start!101012 e!687381))

(assert (=> start!101012 tp_is_empty!30721))

(declare-fun array_inv!28832 (array!78142) Bool)

(assert (=> start!101012 (array_inv!28832 _keys!1208)))

(assert (=> start!101012 true))

(assert (=> start!101012 tp!91066))

(declare-fun array_inv!28833 (array!78140) Bool)

(assert (=> start!101012 (and (array_inv!28833 _values!996) e!687378)))

(declare-fun b!1210352 () Bool)

(assert (=> b!1210352 (= e!687385 (= call!59622 call!59627))))

(declare-fun b!1210361 () Bool)

(declare-fun res!804272 () Bool)

(assert (=> b!1210361 (=> (not res!804272) (not e!687381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210361 (= res!804272 (validKeyInArray!0 k0!934))))

(declare-fun bm!59620 () Bool)

(declare-fun call!59626 () ListLongMap!17843)

(assert (=> bm!59620 (= call!59626 call!59625)))

(declare-fun b!1210362 () Bool)

(declare-fun lt!549409 () Unit!39960)

(assert (=> b!1210362 (= e!687376 lt!549409)))

(declare-fun call!59623 () Unit!39960)

(assert (=> b!1210362 (= lt!549409 call!59623)))

(declare-fun call!59624 () Bool)

(assert (=> b!1210362 call!59624))

(declare-fun b!1210363 () Bool)

(declare-fun res!804265 () Bool)

(declare-fun e!687384 () Bool)

(assert (=> b!1210363 (=> (not res!804265) (not e!687384))))

(assert (=> b!1210363 (= res!804265 (arrayNoDuplicates!0 lt!549402 #b00000000000000000000000000000000 Nil!26650))))

(declare-fun b!1210364 () Bool)

(assert (=> b!1210364 (= c!119237 (and (not lt!549408) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1210364 (= e!687377 e!687376)))

(declare-fun b!1210365 () Bool)

(declare-fun res!804264 () Bool)

(assert (=> b!1210365 (=> (not res!804264) (not e!687381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210365 (= res!804264 (validMask!0 mask!1564))))

(declare-fun b!1210366 () Bool)

(assert (=> b!1210366 (= e!687381 e!687384)))

(declare-fun res!804261 () Bool)

(assert (=> b!1210366 (=> (not res!804261) (not e!687384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78142 (_ BitVec 32)) Bool)

(assert (=> b!1210366 (= res!804261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549402 mask!1564))))

(assert (=> b!1210366 (= lt!549402 (array!78143 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38246 _keys!1208)))))

(declare-fun bm!59621 () Bool)

(declare-fun call!59621 () Bool)

(assert (=> bm!59621 (= call!59624 call!59621)))

(declare-fun b!1210367 () Bool)

(assert (=> b!1210367 (= e!687382 tp_is_empty!30721)))

(declare-fun b!1210368 () Bool)

(assert (=> b!1210368 (= e!687384 (not e!687387))))

(declare-fun res!804273 () Bool)

(assert (=> b!1210368 (=> res!804273 e!687387)))

(assert (=> b!1210368 (= res!804273 (bvsgt from!1455 i!673))))

(assert (=> b!1210368 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549406 () Unit!39960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78142 (_ BitVec 64) (_ BitVec 32)) Unit!39960)

(assert (=> b!1210368 (= lt!549406 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!59622 () Bool)

(declare-fun call!59628 () Unit!39960)

(assert (=> bm!59622 (= call!59623 call!59628)))

(declare-fun b!1210369 () Bool)

(declare-fun res!804267 () Bool)

(assert (=> b!1210369 (=> (not res!804267) (not e!687381))))

(assert (=> b!1210369 (= res!804267 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26650))))

(declare-fun bm!59623 () Bool)

(declare-fun addStillContains!1044 (ListLongMap!17843 (_ BitVec 64) V!46089 (_ BitVec 64)) Unit!39960)

(assert (=> bm!59623 (= call!59628 (addStillContains!1044 lt!549415 (ite (or c!119239 c!119237) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119239 c!119237) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1210370 () Bool)

(declare-fun res!804266 () Bool)

(assert (=> b!1210370 (=> (not res!804266) (not e!687381))))

(assert (=> b!1210370 (= res!804266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1210371 () Bool)

(assert (=> b!1210371 (= e!687379 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210372 () Bool)

(declare-fun res!804270 () Bool)

(assert (=> b!1210372 (=> (not res!804270) (not e!687381))))

(assert (=> b!1210372 (= res!804270 (and (= (size!38245 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38246 _keys!1208) (size!38245 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1210373 () Bool)

(assert (=> b!1210373 call!59624))

(declare-fun lt!549403 () Unit!39960)

(assert (=> b!1210373 (= lt!549403 call!59623)))

(assert (=> b!1210373 (= e!687373 lt!549403)))

(declare-fun bm!59624 () Bool)

(assert (=> bm!59624 (= call!59627 (getCurrentListMapNoExtraKeys!5379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210374 () Bool)

(declare-fun Unit!39964 () Unit!39960)

(assert (=> b!1210374 (= e!687373 Unit!39964)))

(declare-fun bm!59625 () Bool)

(declare-fun lt!549404 () ListLongMap!17843)

(assert (=> bm!59625 (= call!59621 (contains!6945 (ite c!119239 lt!549404 call!59626) k0!934))))

(declare-fun b!1210375 () Bool)

(declare-fun res!804269 () Bool)

(assert (=> b!1210375 (=> (not res!804269) (not e!687381))))

(assert (=> b!1210375 (= res!804269 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38246 _keys!1208))))))

(declare-fun b!1210376 () Bool)

(assert (=> b!1210376 (contains!6945 (+!4061 lt!549404 (tuple2!19875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!549417 () Unit!39960)

(assert (=> b!1210376 (= lt!549417 (addStillContains!1044 lt!549404 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1210376 call!59621))

(assert (=> b!1210376 (= lt!549404 call!59625)))

(declare-fun lt!549405 () Unit!39960)

(assert (=> b!1210376 (= lt!549405 call!59628)))

(assert (=> b!1210376 (= e!687377 lt!549417)))

(assert (= (and start!101012 res!804262) b!1210365))

(assert (= (and b!1210365 res!804264) b!1210372))

(assert (= (and b!1210372 res!804270) b!1210370))

(assert (= (and b!1210370 res!804266) b!1210369))

(assert (= (and b!1210369 res!804267) b!1210375))

(assert (= (and b!1210375 res!804269) b!1210361))

(assert (= (and b!1210361 res!804272) b!1210358))

(assert (= (and b!1210358 res!804263) b!1210366))

(assert (= (and b!1210366 res!804261) b!1210363))

(assert (= (and b!1210363 res!804265) b!1210368))

(assert (= (and b!1210368 (not res!804273)) b!1210349))

(assert (= (and b!1210349 (not res!804268)) b!1210351))

(assert (= (and b!1210351 c!119241) b!1210348))

(assert (= (and b!1210351 (not c!119241)) b!1210352))

(assert (= (or b!1210348 b!1210352) bm!59618))

(assert (= (or b!1210348 b!1210352) bm!59624))

(assert (= (and b!1210351 (not res!804271)) b!1210353))

(assert (= (and b!1210353 c!119240) b!1210356))

(assert (= (and b!1210353 (not c!119240)) b!1210360))

(assert (= (and b!1210356 c!119239) b!1210376))

(assert (= (and b!1210356 (not c!119239)) b!1210364))

(assert (= (and b!1210364 c!119237) b!1210362))

(assert (= (and b!1210364 (not c!119237)) b!1210354))

(assert (= (and b!1210354 c!119236) b!1210373))

(assert (= (and b!1210354 (not c!119236)) b!1210374))

(assert (= (or b!1210362 b!1210373) bm!59622))

(assert (= (or b!1210362 b!1210373) bm!59620))

(assert (= (or b!1210362 b!1210373) bm!59621))

(assert (= (or b!1210376 bm!59621) bm!59625))

(assert (= (or b!1210376 bm!59622) bm!59623))

(assert (= (or b!1210376 bm!59620) bm!59619))

(assert (= (and b!1210356 c!119238) b!1210355))

(assert (= (and b!1210356 (not c!119238)) b!1210350))

(assert (= (and b!1210356 res!804260) b!1210371))

(assert (= (and b!1210359 condMapEmpty!47950) mapIsEmpty!47950))

(assert (= (and b!1210359 (not condMapEmpty!47950)) mapNonEmpty!47950))

(get-info :version)

(assert (= (and mapNonEmpty!47950 ((_ is ValueCellFull!14651) mapValue!47950)) b!1210357))

(assert (= (and b!1210359 ((_ is ValueCellFull!14651) mapDefault!47950)) b!1210367))

(assert (= start!101012 b!1210359))

(declare-fun b_lambda!21591 () Bool)

(assert (=> (not b_lambda!21591) (not b!1210349)))

(declare-fun t!39639 () Bool)

(declare-fun tb!10809 () Bool)

(assert (=> (and start!101012 (= defaultEntry!1004 defaultEntry!1004) t!39639) tb!10809))

(declare-fun result!22219 () Bool)

(assert (=> tb!10809 (= result!22219 tp_is_empty!30721)))

(assert (=> b!1210349 t!39639))

(declare-fun b_and!43091 () Bool)

(assert (= b_and!43089 (and (=> t!39639 result!22219) b_and!43091)))

(declare-fun m!1115343 () Bool)

(assert (=> b!1210358 m!1115343))

(declare-fun m!1115345 () Bool)

(assert (=> b!1210366 m!1115345))

(declare-fun m!1115347 () Bool)

(assert (=> b!1210366 m!1115347))

(declare-fun m!1115349 () Bool)

(assert (=> b!1210370 m!1115349))

(declare-fun m!1115351 () Bool)

(assert (=> bm!59625 m!1115351))

(declare-fun m!1115353 () Bool)

(assert (=> b!1210353 m!1115353))

(assert (=> b!1210353 m!1115353))

(declare-fun m!1115355 () Bool)

(assert (=> b!1210353 m!1115355))

(declare-fun m!1115357 () Bool)

(assert (=> b!1210353 m!1115357))

(declare-fun m!1115359 () Bool)

(assert (=> b!1210353 m!1115359))

(declare-fun m!1115361 () Bool)

(assert (=> b!1210371 m!1115361))

(assert (=> bm!59624 m!1115359))

(declare-fun m!1115363 () Bool)

(assert (=> bm!59619 m!1115363))

(declare-fun m!1115365 () Bool)

(assert (=> bm!59618 m!1115365))

(declare-fun m!1115367 () Bool)

(assert (=> bm!59623 m!1115367))

(declare-fun m!1115369 () Bool)

(assert (=> b!1210369 m!1115369))

(declare-fun m!1115371 () Bool)

(assert (=> b!1210348 m!1115371))

(assert (=> b!1210355 m!1115361))

(declare-fun m!1115373 () Bool)

(assert (=> start!101012 m!1115373))

(declare-fun m!1115375 () Bool)

(assert (=> start!101012 m!1115375))

(declare-fun m!1115377 () Bool)

(assert (=> b!1210363 m!1115377))

(declare-fun m!1115379 () Bool)

(assert (=> b!1210365 m!1115379))

(declare-fun m!1115381 () Bool)

(assert (=> mapNonEmpty!47950 m!1115381))

(declare-fun m!1115383 () Bool)

(assert (=> b!1210356 m!1115383))

(declare-fun m!1115385 () Bool)

(assert (=> b!1210356 m!1115385))

(declare-fun m!1115387 () Bool)

(assert (=> b!1210356 m!1115387))

(declare-fun m!1115389 () Bool)

(assert (=> b!1210356 m!1115389))

(declare-fun m!1115391 () Bool)

(assert (=> b!1210361 m!1115391))

(declare-fun m!1115393 () Bool)

(assert (=> b!1210349 m!1115393))

(declare-fun m!1115395 () Bool)

(assert (=> b!1210349 m!1115395))

(declare-fun m!1115397 () Bool)

(assert (=> b!1210349 m!1115397))

(declare-fun m!1115399 () Bool)

(assert (=> b!1210349 m!1115399))

(declare-fun m!1115401 () Bool)

(assert (=> b!1210376 m!1115401))

(assert (=> b!1210376 m!1115401))

(declare-fun m!1115403 () Bool)

(assert (=> b!1210376 m!1115403))

(declare-fun m!1115405 () Bool)

(assert (=> b!1210376 m!1115405))

(declare-fun m!1115407 () Bool)

(assert (=> b!1210368 m!1115407))

(declare-fun m!1115409 () Bool)

(assert (=> b!1210368 m!1115409))

(assert (=> b!1210351 m!1115353))

(declare-fun m!1115411 () Bool)

(assert (=> b!1210351 m!1115411))

(check-sat (not b!1210356) (not b!1210361) (not bm!59618) (not b!1210363) (not b_lambda!21591) (not b!1210376) b_and!43091 (not b!1210369) (not start!101012) (not b!1210355) (not b!1210348) (not b!1210370) (not b!1210366) (not bm!59624) (not b!1210365) (not bm!59625) (not b!1210351) (not b!1210353) (not bm!59619) (not b!1210349) (not bm!59623) (not b!1210371) (not b_next!26017) (not mapNonEmpty!47950) tp_is_empty!30721 (not b!1210368))
(check-sat b_and!43091 (not b_next!26017))
