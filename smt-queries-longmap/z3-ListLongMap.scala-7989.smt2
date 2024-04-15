; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98768 () Bool)

(assert start!98768)

(declare-fun b_free!24379 () Bool)

(declare-fun b_next!24379 () Bool)

(assert (=> start!98768 (= b_free!24379 (not b_next!24379))))

(declare-fun tp!85847 () Bool)

(declare-fun b_and!39585 () Bool)

(assert (=> start!98768 (= tp!85847 b_and!39585)))

(declare-fun b!1152322 () Bool)

(declare-fun res!766133 () Bool)

(declare-fun e!655373 () Bool)

(assert (=> b!1152322 (=> (not res!766133) (not e!655373))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74582 0))(
  ( (array!74583 (arr!35942 (Array (_ BitVec 32) (_ BitVec 64))) (size!36480 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74582)

(assert (=> b!1152322 (= res!766133 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36480 _keys!1208))))))

(declare-fun e!655383 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1152323 () Bool)

(declare-fun arrayContainsKey!0 (array!74582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152323 (= e!655383 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152324 () Bool)

(declare-datatypes ((Unit!37746 0))(
  ( (Unit!37747) )
))
(declare-fun e!655384 () Unit!37746)

(declare-fun e!655386 () Unit!37746)

(assert (=> b!1152324 (= e!655384 e!655386)))

(declare-fun c!114247 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!516060 () Bool)

(assert (=> b!1152324 (= c!114247 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516060))))

(declare-fun b!1152325 () Bool)

(declare-fun res!766130 () Bool)

(assert (=> b!1152325 (=> (not res!766130) (not e!655373))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152325 (= res!766130 (validMask!0 mask!1564))))

(declare-fun b!1152326 () Bool)

(declare-fun res!766135 () Bool)

(assert (=> b!1152326 (=> (not res!766135) (not e!655373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152326 (= res!766135 (validKeyInArray!0 k0!934))))

(declare-fun b!1152327 () Bool)

(declare-fun Unit!37748 () Unit!37746)

(assert (=> b!1152327 (= e!655386 Unit!37748)))

(declare-fun b!1152328 () Bool)

(declare-fun e!655370 () Unit!37746)

(declare-fun Unit!37749 () Unit!37746)

(assert (=> b!1152328 (= e!655370 Unit!37749)))

(declare-fun bm!54064 () Bool)

(declare-fun call!54072 () Bool)

(declare-fun call!54074 () Bool)

(assert (=> bm!54064 (= call!54072 call!54074)))

(declare-fun b!1152329 () Bool)

(declare-fun e!655374 () Bool)

(declare-fun e!655382 () Bool)

(assert (=> b!1152329 (= e!655374 (not e!655382))))

(declare-fun res!766141 () Bool)

(assert (=> b!1152329 (=> res!766141 e!655382)))

(assert (=> b!1152329 (= res!766141 (bvsgt from!1455 i!673))))

(assert (=> b!1152329 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516053 () Unit!37746)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74582 (_ BitVec 64) (_ BitVec 32)) Unit!37746)

(assert (=> b!1152329 (= lt!516053 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1152330 () Bool)

(declare-fun c!114245 () Bool)

(assert (=> b!1152330 (= c!114245 (and (not lt!516060) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655378 () Unit!37746)

(assert (=> b!1152330 (= e!655378 e!655384)))

(declare-fun bm!54065 () Bool)

(declare-fun call!54069 () Unit!37746)

(declare-fun call!54067 () Unit!37746)

(assert (=> bm!54065 (= call!54069 call!54067)))

(declare-fun mapNonEmpty!45188 () Bool)

(declare-fun mapRes!45188 () Bool)

(declare-fun tp!85848 () Bool)

(declare-fun e!655385 () Bool)

(assert (=> mapNonEmpty!45188 (= mapRes!45188 (and tp!85848 e!655385))))

(declare-datatypes ((V!43673 0))(
  ( (V!43674 (val!14511 Int)) )
))
(declare-datatypes ((ValueCell!13745 0))(
  ( (ValueCellFull!13745 (v!17147 V!43673)) (EmptyCell!13745) )
))
(declare-fun mapValue!45188 () ValueCell!13745)

(declare-fun mapRest!45188 () (Array (_ BitVec 32) ValueCell!13745))

(declare-datatypes ((array!74584 0))(
  ( (array!74585 (arr!35943 (Array (_ BitVec 32) ValueCell!13745)) (size!36481 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74584)

(declare-fun mapKey!45188 () (_ BitVec 32))

(assert (=> mapNonEmpty!45188 (= (arr!35943 _values!996) (store mapRest!45188 mapKey!45188 mapValue!45188))))

(declare-fun b!1152331 () Bool)

(assert (=> b!1152331 (= e!655373 e!655374)))

(declare-fun res!766129 () Bool)

(assert (=> b!1152331 (=> (not res!766129) (not e!655374))))

(declare-fun lt!516068 () array!74582)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74582 (_ BitVec 32)) Bool)

(assert (=> b!1152331 (= res!766129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516068 mask!1564))))

(assert (=> b!1152331 (= lt!516068 (array!74583 (store (arr!35942 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36480 _keys!1208)))))

(declare-fun zeroValue!944 () V!43673)

(declare-datatypes ((tuple2!18506 0))(
  ( (tuple2!18507 (_1!9264 (_ BitVec 64)) (_2!9264 V!43673)) )
))
(declare-datatypes ((List!25238 0))(
  ( (Nil!25235) (Cons!25234 (h!26443 tuple2!18506) (t!36600 List!25238)) )
))
(declare-datatypes ((ListLongMap!16475 0))(
  ( (ListLongMap!16476 (toList!8253 List!25238)) )
))
(declare-fun lt!516055 () ListLongMap!16475)

(declare-fun bm!54066 () Bool)

(declare-fun minValue!944 () V!43673)

(declare-fun c!114246 () Bool)

(declare-fun addStillContains!877 (ListLongMap!16475 (_ BitVec 64) V!43673 (_ BitVec 64)) Unit!37746)

(assert (=> bm!54066 (= call!54067 (addStillContains!877 lt!516055 (ite (or c!114246 c!114245) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114246 c!114245) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1152332 () Bool)

(declare-fun res!766134 () Bool)

(assert (=> b!1152332 (=> (not res!766134) (not e!655374))))

(declare-datatypes ((List!25239 0))(
  ( (Nil!25236) (Cons!25235 (h!26444 (_ BitVec 64)) (t!36601 List!25239)) )
))
(declare-fun arrayNoDuplicates!0 (array!74582 (_ BitVec 32) List!25239) Bool)

(assert (=> b!1152332 (= res!766134 (arrayNoDuplicates!0 lt!516068 #b00000000000000000000000000000000 Nil!25236))))

(declare-fun b!1152333 () Bool)

(declare-fun res!766132 () Bool)

(assert (=> b!1152333 (=> (not res!766132) (not e!655373))))

(assert (=> b!1152333 (= res!766132 (and (= (size!36481 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36480 _keys!1208) (size!36481 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!655380 () Bool)

(declare-fun call!54071 () ListLongMap!16475)

(declare-fun b!1152334 () Bool)

(declare-fun call!54068 () ListLongMap!16475)

(declare-fun -!1316 (ListLongMap!16475 (_ BitVec 64)) ListLongMap!16475)

(assert (=> b!1152334 (= e!655380 (= call!54068 (-!1316 call!54071 k0!934)))))

(declare-fun e!655381 () Bool)

(declare-fun b!1152335 () Bool)

(assert (=> b!1152335 (= e!655381 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516060) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!54067 () Bool)

(declare-fun call!54073 () ListLongMap!16475)

(declare-fun call!54070 () ListLongMap!16475)

(assert (=> bm!54067 (= call!54073 call!54070)))

(declare-fun b!1152336 () Bool)

(declare-fun tp_is_empty!28909 () Bool)

(assert (=> b!1152336 (= e!655385 tp_is_empty!28909)))

(declare-fun b!1152337 () Bool)

(declare-fun e!655379 () Bool)

(assert (=> b!1152337 (= e!655379 tp_is_empty!28909)))

(declare-fun res!766137 () Bool)

(assert (=> start!98768 (=> (not res!766137) (not e!655373))))

(assert (=> start!98768 (= res!766137 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36480 _keys!1208))))))

(assert (=> start!98768 e!655373))

(assert (=> start!98768 tp_is_empty!28909))

(declare-fun array_inv!27616 (array!74582) Bool)

(assert (=> start!98768 (array_inv!27616 _keys!1208)))

(assert (=> start!98768 true))

(assert (=> start!98768 tp!85847))

(declare-fun e!655372 () Bool)

(declare-fun array_inv!27617 (array!74584) Bool)

(assert (=> start!98768 (and (array_inv!27617 _values!996) e!655372)))

(declare-fun b!1152338 () Bool)

(declare-fun e!655375 () Bool)

(declare-fun e!655377 () Bool)

(assert (=> b!1152338 (= e!655375 e!655377)))

(declare-fun res!766140 () Bool)

(assert (=> b!1152338 (=> res!766140 e!655377)))

(assert (=> b!1152338 (= res!766140 (not (= (select (arr!35942 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1152338 e!655380))

(declare-fun c!114244 () Bool)

(assert (=> b!1152338 (= c!114244 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516059 () Unit!37746)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!591 (array!74582 array!74584 (_ BitVec 32) (_ BitVec 32) V!43673 V!43673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37746)

(assert (=> b!1152338 (= lt!516059 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!516065 () ListLongMap!16475)

(declare-fun bm!54068 () Bool)

(declare-fun contains!6707 (ListLongMap!16475 (_ BitVec 64)) Bool)

(assert (=> bm!54068 (= call!54074 (contains!6707 (ite c!114246 lt!516065 call!54073) k0!934))))

(declare-fun b!1152339 () Bool)

(assert (=> b!1152339 (= e!655381 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152340 () Bool)

(declare-fun res!766138 () Bool)

(assert (=> b!1152340 (=> (not res!766138) (not e!655373))))

(assert (=> b!1152340 (= res!766138 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25236))))

(declare-fun b!1152341 () Bool)

(assert (=> b!1152341 (= e!655382 e!655375)))

(declare-fun res!766128 () Bool)

(assert (=> b!1152341 (=> res!766128 e!655375)))

(assert (=> b!1152341 (= res!766128 (not (= from!1455 i!673)))))

(declare-fun lt!516057 () array!74584)

(declare-fun lt!516056 () ListLongMap!16475)

(declare-fun getCurrentListMapNoExtraKeys!4736 (array!74582 array!74584 (_ BitVec 32) (_ BitVec 32) V!43673 V!43673 (_ BitVec 32) Int) ListLongMap!16475)

(assert (=> b!1152341 (= lt!516056 (getCurrentListMapNoExtraKeys!4736 lt!516068 lt!516057 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!516069 () V!43673)

(assert (=> b!1152341 (= lt!516057 (array!74585 (store (arr!35943 _values!996) i!673 (ValueCellFull!13745 lt!516069)) (size!36481 _values!996)))))

(declare-fun dynLambda!2698 (Int (_ BitVec 64)) V!43673)

(assert (=> b!1152341 (= lt!516069 (dynLambda!2698 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!516061 () ListLongMap!16475)

(assert (=> b!1152341 (= lt!516061 (getCurrentListMapNoExtraKeys!4736 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1152342 () Bool)

(declare-fun res!766136 () Bool)

(assert (=> b!1152342 (=> (not res!766136) (not e!655373))))

(assert (=> b!1152342 (= res!766136 (= (select (arr!35942 _keys!1208) i!673) k0!934))))

(declare-fun bm!54069 () Bool)

(assert (=> bm!54069 (= call!54071 (getCurrentListMapNoExtraKeys!4736 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152343 () Bool)

(assert (=> b!1152343 (= e!655372 (and e!655379 mapRes!45188))))

(declare-fun condMapEmpty!45188 () Bool)

(declare-fun mapDefault!45188 () ValueCell!13745)

(assert (=> b!1152343 (= condMapEmpty!45188 (= (arr!35943 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13745)) mapDefault!45188)))))

(declare-fun bm!54070 () Bool)

(assert (=> bm!54070 (= call!54068 (getCurrentListMapNoExtraKeys!4736 lt!516068 lt!516057 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152344 () Bool)

(declare-fun res!766131 () Bool)

(assert (=> b!1152344 (=> (not res!766131) (not e!655373))))

(assert (=> b!1152344 (= res!766131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1152345 () Bool)

(declare-fun +!3667 (ListLongMap!16475 tuple2!18506) ListLongMap!16475)

(assert (=> b!1152345 (contains!6707 (+!3667 lt!516065 (tuple2!18507 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!516062 () Unit!37746)

(assert (=> b!1152345 (= lt!516062 (addStillContains!877 lt!516065 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1152345 call!54074))

(assert (=> b!1152345 (= lt!516065 call!54070)))

(declare-fun lt!516050 () Unit!37746)

(assert (=> b!1152345 (= lt!516050 call!54067)))

(assert (=> b!1152345 (= e!655378 lt!516062)))

(declare-fun b!1152346 () Bool)

(declare-fun Unit!37750 () Unit!37746)

(assert (=> b!1152346 (= e!655370 Unit!37750)))

(assert (=> b!1152346 (= lt!516060 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152346 (= c!114246 (and (not lt!516060) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516051 () Unit!37746)

(assert (=> b!1152346 (= lt!516051 e!655378)))

(declare-fun lt!516058 () Unit!37746)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!467 (array!74582 array!74584 (_ BitVec 32) (_ BitVec 32) V!43673 V!43673 (_ BitVec 64) (_ BitVec 32) Int) Unit!37746)

(assert (=> b!1152346 (= lt!516058 (lemmaListMapContainsThenArrayContainsFrom!467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114243 () Bool)

(assert (=> b!1152346 (= c!114243 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766139 () Bool)

(assert (=> b!1152346 (= res!766139 e!655381)))

(assert (=> b!1152346 (=> (not res!766139) (not e!655383))))

(assert (=> b!1152346 e!655383))

(declare-fun lt!516048 () Unit!37746)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74582 (_ BitVec 32) (_ BitVec 32)) Unit!37746)

(assert (=> b!1152346 (= lt!516048 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1152346 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25236)))

(declare-fun lt!516049 () Unit!37746)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74582 (_ BitVec 64) (_ BitVec 32) List!25239) Unit!37746)

(assert (=> b!1152346 (= lt!516049 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25236))))

(assert (=> b!1152346 false))

(declare-fun b!1152347 () Bool)

(assert (=> b!1152347 (= e!655377 true)))

(declare-fun e!655371 () Bool)

(assert (=> b!1152347 e!655371))

(declare-fun res!766142 () Bool)

(assert (=> b!1152347 (=> (not res!766142) (not e!655371))))

(declare-fun lt!516052 () ListLongMap!16475)

(assert (=> b!1152347 (= res!766142 (= lt!516052 lt!516055))))

(assert (=> b!1152347 (= lt!516052 (-!1316 lt!516061 k0!934))))

(declare-fun lt!516063 () V!43673)

(assert (=> b!1152347 (= (-!1316 (+!3667 lt!516055 (tuple2!18507 (select (arr!35942 _keys!1208) from!1455) lt!516063)) (select (arr!35942 _keys!1208) from!1455)) lt!516055)))

(declare-fun lt!516054 () Unit!37746)

(declare-fun addThenRemoveForNewKeyIsSame!172 (ListLongMap!16475 (_ BitVec 64) V!43673) Unit!37746)

(assert (=> b!1152347 (= lt!516054 (addThenRemoveForNewKeyIsSame!172 lt!516055 (select (arr!35942 _keys!1208) from!1455) lt!516063))))

(declare-fun get!18312 (ValueCell!13745 V!43673) V!43673)

(assert (=> b!1152347 (= lt!516063 (get!18312 (select (arr!35943 _values!996) from!1455) lt!516069))))

(declare-fun lt!516064 () Unit!37746)

(assert (=> b!1152347 (= lt!516064 e!655370)))

(declare-fun c!114248 () Bool)

(assert (=> b!1152347 (= c!114248 (contains!6707 lt!516055 k0!934))))

(assert (=> b!1152347 (= lt!516055 (getCurrentListMapNoExtraKeys!4736 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45188 () Bool)

(assert (=> mapIsEmpty!45188 mapRes!45188))

(declare-fun b!1152348 () Bool)

(declare-fun lt!516067 () Unit!37746)

(assert (=> b!1152348 (= e!655384 lt!516067)))

(assert (=> b!1152348 (= lt!516067 call!54069)))

(assert (=> b!1152348 call!54072))

(declare-fun b!1152349 () Bool)

(assert (=> b!1152349 call!54072))

(declare-fun lt!516066 () Unit!37746)

(assert (=> b!1152349 (= lt!516066 call!54069)))

(assert (=> b!1152349 (= e!655386 lt!516066)))

(declare-fun b!1152350 () Bool)

(assert (=> b!1152350 (= e!655380 (= call!54068 call!54071))))

(declare-fun bm!54071 () Bool)

(assert (=> bm!54071 (= call!54070 (+!3667 lt!516055 (ite (or c!114246 c!114245) (tuple2!18507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18507 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1152351 () Bool)

(assert (=> b!1152351 (= e!655371 (= lt!516052 (getCurrentListMapNoExtraKeys!4736 lt!516068 lt!516057 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (= (and start!98768 res!766137) b!1152325))

(assert (= (and b!1152325 res!766130) b!1152333))

(assert (= (and b!1152333 res!766132) b!1152344))

(assert (= (and b!1152344 res!766131) b!1152340))

(assert (= (and b!1152340 res!766138) b!1152322))

(assert (= (and b!1152322 res!766133) b!1152326))

(assert (= (and b!1152326 res!766135) b!1152342))

(assert (= (and b!1152342 res!766136) b!1152331))

(assert (= (and b!1152331 res!766129) b!1152332))

(assert (= (and b!1152332 res!766134) b!1152329))

(assert (= (and b!1152329 (not res!766141)) b!1152341))

(assert (= (and b!1152341 (not res!766128)) b!1152338))

(assert (= (and b!1152338 c!114244) b!1152334))

(assert (= (and b!1152338 (not c!114244)) b!1152350))

(assert (= (or b!1152334 b!1152350) bm!54070))

(assert (= (or b!1152334 b!1152350) bm!54069))

(assert (= (and b!1152338 (not res!766140)) b!1152347))

(assert (= (and b!1152347 c!114248) b!1152346))

(assert (= (and b!1152347 (not c!114248)) b!1152328))

(assert (= (and b!1152346 c!114246) b!1152345))

(assert (= (and b!1152346 (not c!114246)) b!1152330))

(assert (= (and b!1152330 c!114245) b!1152348))

(assert (= (and b!1152330 (not c!114245)) b!1152324))

(assert (= (and b!1152324 c!114247) b!1152349))

(assert (= (and b!1152324 (not c!114247)) b!1152327))

(assert (= (or b!1152348 b!1152349) bm!54065))

(assert (= (or b!1152348 b!1152349) bm!54067))

(assert (= (or b!1152348 b!1152349) bm!54064))

(assert (= (or b!1152345 bm!54064) bm!54068))

(assert (= (or b!1152345 bm!54065) bm!54066))

(assert (= (or b!1152345 bm!54067) bm!54071))

(assert (= (and b!1152346 c!114243) b!1152339))

(assert (= (and b!1152346 (not c!114243)) b!1152335))

(assert (= (and b!1152346 res!766139) b!1152323))

(assert (= (and b!1152347 res!766142) b!1152351))

(assert (= (and b!1152343 condMapEmpty!45188) mapIsEmpty!45188))

(assert (= (and b!1152343 (not condMapEmpty!45188)) mapNonEmpty!45188))

(get-info :version)

(assert (= (and mapNonEmpty!45188 ((_ is ValueCellFull!13745) mapValue!45188)) b!1152336))

(assert (= (and b!1152343 ((_ is ValueCellFull!13745) mapDefault!45188)) b!1152337))

(assert (= start!98768 b!1152343))

(declare-fun b_lambda!19467 () Bool)

(assert (=> (not b_lambda!19467) (not b!1152341)))

(declare-fun t!36599 () Bool)

(declare-fun tb!9183 () Bool)

(assert (=> (and start!98768 (= defaultEntry!1004 defaultEntry!1004) t!36599) tb!9183))

(declare-fun result!18939 () Bool)

(assert (=> tb!9183 (= result!18939 tp_is_empty!28909)))

(assert (=> b!1152341 t!36599))

(declare-fun b_and!39587 () Bool)

(assert (= b_and!39585 (and (=> t!36599 result!18939) b_and!39587)))

(declare-fun m!1061823 () Bool)

(assert (=> b!1152347 m!1061823))

(declare-fun m!1061825 () Bool)

(assert (=> b!1152347 m!1061825))

(declare-fun m!1061827 () Bool)

(assert (=> b!1152347 m!1061827))

(declare-fun m!1061829 () Bool)

(assert (=> b!1152347 m!1061829))

(declare-fun m!1061831 () Bool)

(assert (=> b!1152347 m!1061831))

(declare-fun m!1061833 () Bool)

(assert (=> b!1152347 m!1061833))

(declare-fun m!1061835 () Bool)

(assert (=> b!1152347 m!1061835))

(assert (=> b!1152347 m!1061833))

(declare-fun m!1061837 () Bool)

(assert (=> b!1152347 m!1061837))

(declare-fun m!1061839 () Bool)

(assert (=> b!1152347 m!1061839))

(assert (=> b!1152347 m!1061833))

(assert (=> b!1152347 m!1061827))

(assert (=> b!1152347 m!1061831))

(declare-fun m!1061841 () Bool)

(assert (=> b!1152334 m!1061841))

(assert (=> b!1152338 m!1061833))

(declare-fun m!1061843 () Bool)

(assert (=> b!1152338 m!1061843))

(declare-fun m!1061845 () Bool)

(assert (=> b!1152332 m!1061845))

(declare-fun m!1061847 () Bool)

(assert (=> b!1152325 m!1061847))

(declare-fun m!1061849 () Bool)

(assert (=> bm!54068 m!1061849))

(declare-fun m!1061851 () Bool)

(assert (=> b!1152351 m!1061851))

(declare-fun m!1061853 () Bool)

(assert (=> b!1152331 m!1061853))

(declare-fun m!1061855 () Bool)

(assert (=> b!1152331 m!1061855))

(declare-fun m!1061857 () Bool)

(assert (=> b!1152341 m!1061857))

(declare-fun m!1061859 () Bool)

(assert (=> b!1152341 m!1061859))

(declare-fun m!1061861 () Bool)

(assert (=> b!1152341 m!1061861))

(declare-fun m!1061863 () Bool)

(assert (=> b!1152341 m!1061863))

(declare-fun m!1061865 () Bool)

(assert (=> b!1152345 m!1061865))

(assert (=> b!1152345 m!1061865))

(declare-fun m!1061867 () Bool)

(assert (=> b!1152345 m!1061867))

(declare-fun m!1061869 () Bool)

(assert (=> b!1152345 m!1061869))

(declare-fun m!1061871 () Bool)

(assert (=> mapNonEmpty!45188 m!1061871))

(declare-fun m!1061873 () Bool)

(assert (=> b!1152323 m!1061873))

(assert (=> b!1152339 m!1061873))

(declare-fun m!1061875 () Bool)

(assert (=> b!1152346 m!1061875))

(declare-fun m!1061877 () Bool)

(assert (=> b!1152346 m!1061877))

(declare-fun m!1061879 () Bool)

(assert (=> b!1152346 m!1061879))

(declare-fun m!1061881 () Bool)

(assert (=> b!1152346 m!1061881))

(declare-fun m!1061883 () Bool)

(assert (=> b!1152326 m!1061883))

(assert (=> bm!54070 m!1061851))

(declare-fun m!1061885 () Bool)

(assert (=> b!1152344 m!1061885))

(declare-fun m!1061887 () Bool)

(assert (=> b!1152342 m!1061887))

(declare-fun m!1061889 () Bool)

(assert (=> bm!54071 m!1061889))

(declare-fun m!1061891 () Bool)

(assert (=> b!1152329 m!1061891))

(declare-fun m!1061893 () Bool)

(assert (=> b!1152329 m!1061893))

(declare-fun m!1061895 () Bool)

(assert (=> b!1152340 m!1061895))

(assert (=> bm!54069 m!1061823))

(declare-fun m!1061897 () Bool)

(assert (=> start!98768 m!1061897))

(declare-fun m!1061899 () Bool)

(assert (=> start!98768 m!1061899))

(declare-fun m!1061901 () Bool)

(assert (=> bm!54066 m!1061901))

(check-sat (not b!1152331) (not bm!54068) (not b!1152323) (not b!1152341) (not b!1152346) (not b_lambda!19467) (not b!1152329) (not b!1152332) (not mapNonEmpty!45188) (not b!1152338) (not bm!54071) (not b!1152351) (not b_next!24379) (not start!98768) (not bm!54069) (not b!1152347) (not bm!54070) (not b!1152325) (not b!1152344) (not b!1152345) tp_is_empty!28909 b_and!39587 (not b!1152339) (not b!1152334) (not b!1152326) (not b!1152340) (not bm!54066))
(check-sat b_and!39587 (not b_next!24379))
