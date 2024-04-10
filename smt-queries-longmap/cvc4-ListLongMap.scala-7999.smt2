; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98838 () Bool)

(assert start!98838)

(declare-fun b_free!24443 () Bool)

(declare-fun b_next!24443 () Bool)

(assert (=> start!98838 (= b_free!24443 (not b_next!24443))))

(declare-fun tp!86039 () Bool)

(declare-fun b_and!39735 () Bool)

(assert (=> start!98838 (= tp!86039 b_and!39735)))

(declare-fun b!1155390 () Bool)

(declare-fun e!657082 () Bool)

(declare-datatypes ((V!43757 0))(
  ( (V!43758 (val!14543 Int)) )
))
(declare-datatypes ((tuple2!18494 0))(
  ( (tuple2!18495 (_1!9258 (_ BitVec 64)) (_2!9258 V!43757)) )
))
(declare-datatypes ((List!25237 0))(
  ( (Nil!25234) (Cons!25233 (h!26442 tuple2!18494) (t!36672 List!25237)) )
))
(declare-datatypes ((ListLongMap!16463 0))(
  ( (ListLongMap!16464 (toList!8247 List!25237)) )
))
(declare-fun call!54865 () ListLongMap!16463)

(declare-fun call!54858 () ListLongMap!16463)

(assert (=> b!1155390 (= e!657082 (= call!54865 call!54858))))

(declare-fun b!1155391 () Bool)

(declare-fun res!767640 () Bool)

(declare-fun e!657087 () Bool)

(assert (=> b!1155391 (=> (not res!767640) (not e!657087))))

(declare-datatypes ((array!74793 0))(
  ( (array!74794 (arr!36047 (Array (_ BitVec 32) (_ BitVec 64))) (size!36583 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74793)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1155391 (= res!767640 (= (select (arr!36047 _keys!1208) i!673) k!934))))

(declare-fun b!1155393 () Bool)

(declare-datatypes ((Unit!38045 0))(
  ( (Unit!38046) )
))
(declare-fun e!657095 () Unit!38045)

(declare-fun Unit!38047 () Unit!38045)

(assert (=> b!1155393 (= e!657095 Unit!38047)))

(declare-fun b!1155394 () Bool)

(declare-fun res!767644 () Bool)

(assert (=> b!1155394 (=> (not res!767644) (not e!657087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155394 (= res!767644 (validKeyInArray!0 k!934))))

(declare-fun e!657092 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1155395 () Bool)

(declare-fun arrayContainsKey!0 (array!74793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155395 (= e!657092 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54855 () Bool)

(declare-fun call!54864 () ListLongMap!16463)

(declare-fun call!54862 () ListLongMap!16463)

(assert (=> bm!54855 (= call!54864 call!54862)))

(declare-fun b!1155396 () Bool)

(declare-fun -!1367 (ListLongMap!16463 (_ BitVec 64)) ListLongMap!16463)

(assert (=> b!1155396 (= e!657082 (= call!54865 (-!1367 call!54858 k!934)))))

(declare-fun bm!54856 () Bool)

(declare-fun call!54860 () Unit!38045)

(declare-fun call!54863 () Unit!38045)

(assert (=> bm!54856 (= call!54860 call!54863)))

(declare-fun bm!54857 () Bool)

(declare-fun call!54861 () Bool)

(declare-fun call!54859 () Bool)

(assert (=> bm!54857 (= call!54861 call!54859)))

(declare-fun b!1155397 () Bool)

(assert (=> b!1155397 call!54861))

(declare-fun lt!518355 () Unit!38045)

(assert (=> b!1155397 (= lt!518355 call!54860)))

(assert (=> b!1155397 (= e!657095 lt!518355)))

(declare-fun c!114850 () Bool)

(declare-fun bm!54858 () Bool)

(declare-fun lt!518361 () ListLongMap!16463)

(declare-fun contains!6760 (ListLongMap!16463 (_ BitVec 64)) Bool)

(assert (=> bm!54858 (= call!54859 (contains!6760 (ite c!114850 lt!518361 call!54864) k!934))))

(declare-fun b!1155398 () Bool)

(declare-fun e!657096 () Unit!38045)

(declare-fun Unit!38048 () Unit!38045)

(assert (=> b!1155398 (= e!657096 Unit!38048)))

(declare-fun lt!518353 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1155398 (= lt!518353 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155398 (= c!114850 (and (not lt!518353) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518359 () Unit!38045)

(declare-fun e!657085 () Unit!38045)

(assert (=> b!1155398 (= lt!518359 e!657085)))

(declare-fun zeroValue!944 () V!43757)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13777 0))(
  ( (ValueCellFull!13777 (v!17180 V!43757)) (EmptyCell!13777) )
))
(declare-datatypes ((array!74795 0))(
  ( (array!74796 (arr!36048 (Array (_ BitVec 32) ValueCell!13777)) (size!36584 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74795)

(declare-fun minValue!944 () V!43757)

(declare-fun lt!518370 () Unit!38045)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!493 (array!74793 array!74795 (_ BitVec 32) (_ BitVec 32) V!43757 V!43757 (_ BitVec 64) (_ BitVec 32) Int) Unit!38045)

(assert (=> b!1155398 (= lt!518370 (lemmaListMapContainsThenArrayContainsFrom!493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114849 () Bool)

(assert (=> b!1155398 (= c!114849 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767647 () Bool)

(assert (=> b!1155398 (= res!767647 e!657092)))

(declare-fun e!657094 () Bool)

(assert (=> b!1155398 (=> (not res!767647) (not e!657094))))

(assert (=> b!1155398 e!657094))

(declare-fun lt!518366 () Unit!38045)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74793 (_ BitVec 32) (_ BitVec 32)) Unit!38045)

(assert (=> b!1155398 (= lt!518366 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25238 0))(
  ( (Nil!25235) (Cons!25234 (h!26443 (_ BitVec 64)) (t!36673 List!25238)) )
))
(declare-fun arrayNoDuplicates!0 (array!74793 (_ BitVec 32) List!25238) Bool)

(assert (=> b!1155398 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25235)))

(declare-fun lt!518356 () Unit!38045)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74793 (_ BitVec 64) (_ BitVec 32) List!25238) Unit!38045)

(assert (=> b!1155398 (= lt!518356 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25235))))

(assert (=> b!1155398 false))

(declare-fun b!1155399 () Bool)

(declare-fun res!767641 () Bool)

(assert (=> b!1155399 (=> (not res!767641) (not e!657087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155399 (= res!767641 (validMask!0 mask!1564))))

(declare-fun b!1155400 () Bool)

(assert (=> b!1155400 (= e!657092 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518353) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155392 () Bool)

(declare-fun e!657086 () Bool)

(declare-fun tp_is_empty!28973 () Bool)

(assert (=> b!1155392 (= e!657086 tp_is_empty!28973)))

(declare-fun res!767634 () Bool)

(assert (=> start!98838 (=> (not res!767634) (not e!657087))))

(assert (=> start!98838 (= res!767634 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36583 _keys!1208))))))

(assert (=> start!98838 e!657087))

(assert (=> start!98838 tp_is_empty!28973))

(declare-fun array_inv!27588 (array!74793) Bool)

(assert (=> start!98838 (array_inv!27588 _keys!1208)))

(assert (=> start!98838 true))

(assert (=> start!98838 tp!86039))

(declare-fun e!657083 () Bool)

(declare-fun array_inv!27589 (array!74795) Bool)

(assert (=> start!98838 (and (array_inv!27589 _values!996) e!657083)))

(declare-fun b!1155401 () Bool)

(declare-fun e!657089 () Bool)

(declare-fun e!657090 () Bool)

(assert (=> b!1155401 (= e!657089 (not e!657090))))

(declare-fun res!767648 () Bool)

(assert (=> b!1155401 (=> res!767648 e!657090)))

(assert (=> b!1155401 (= res!767648 (bvsgt from!1455 i!673))))

(assert (=> b!1155401 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!518352 () Unit!38045)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74793 (_ BitVec 64) (_ BitVec 32)) Unit!38045)

(assert (=> b!1155401 (= lt!518352 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1155402 () Bool)

(assert (=> b!1155402 (contains!6760 call!54862 k!934)))

(declare-fun lt!518362 () Unit!38045)

(assert (=> b!1155402 (= lt!518362 call!54863)))

(assert (=> b!1155402 call!54859))

(declare-fun lt!518365 () ListLongMap!16463)

(declare-fun +!3660 (ListLongMap!16463 tuple2!18494) ListLongMap!16463)

(assert (=> b!1155402 (= lt!518361 (+!3660 lt!518365 (tuple2!18495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518354 () Unit!38045)

(declare-fun addStillContains!904 (ListLongMap!16463 (_ BitVec 64) V!43757 (_ BitVec 64)) Unit!38045)

(assert (=> b!1155402 (= lt!518354 (addStillContains!904 lt!518365 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1155402 (= e!657085 lt!518362)))

(declare-fun b!1155403 () Bool)

(declare-fun res!767637 () Bool)

(assert (=> b!1155403 (=> (not res!767637) (not e!657087))))

(assert (=> b!1155403 (= res!767637 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36583 _keys!1208))))))

(declare-fun b!1155404 () Bool)

(assert (=> b!1155404 (= e!657087 e!657089)))

(declare-fun res!767645 () Bool)

(assert (=> b!1155404 (=> (not res!767645) (not e!657089))))

(declare-fun lt!518367 () array!74793)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74793 (_ BitVec 32)) Bool)

(assert (=> b!1155404 (= res!767645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518367 mask!1564))))

(assert (=> b!1155404 (= lt!518367 (array!74794 (store (arr!36047 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36583 _keys!1208)))))

(declare-fun lt!518363 () array!74795)

(declare-fun bm!54859 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4716 (array!74793 array!74795 (_ BitVec 32) (_ BitVec 32) V!43757 V!43757 (_ BitVec 32) Int) ListLongMap!16463)

(assert (=> bm!54859 (= call!54865 (getCurrentListMapNoExtraKeys!4716 lt!518367 lt!518363 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!518364 () ListLongMap!16463)

(declare-fun b!1155405 () Bool)

(declare-fun e!657081 () Bool)

(assert (=> b!1155405 (= e!657081 (= lt!518364 (getCurrentListMapNoExtraKeys!4716 lt!518367 lt!518363 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1155406 () Bool)

(declare-fun e!657088 () Bool)

(assert (=> b!1155406 (= e!657090 e!657088)))

(declare-fun res!767638 () Bool)

(assert (=> b!1155406 (=> res!767638 e!657088)))

(assert (=> b!1155406 (= res!767638 (not (= from!1455 i!673)))))

(declare-fun lt!518368 () ListLongMap!16463)

(assert (=> b!1155406 (= lt!518368 (getCurrentListMapNoExtraKeys!4716 lt!518367 lt!518363 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518369 () V!43757)

(assert (=> b!1155406 (= lt!518363 (array!74796 (store (arr!36048 _values!996) i!673 (ValueCellFull!13777 lt!518369)) (size!36584 _values!996)))))

(declare-fun dynLambda!2725 (Int (_ BitVec 64)) V!43757)

(assert (=> b!1155406 (= lt!518369 (dynLambda!2725 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518360 () ListLongMap!16463)

(assert (=> b!1155406 (= lt!518360 (getCurrentListMapNoExtraKeys!4716 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun c!114847 () Bool)

(declare-fun bm!54860 () Bool)

(assert (=> bm!54860 (= call!54863 (addStillContains!904 (ite c!114850 lt!518361 lt!518365) (ite c!114850 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114847 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114850 minValue!944 (ite c!114847 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1155407 () Bool)

(declare-fun e!657080 () Bool)

(declare-fun mapRes!45284 () Bool)

(assert (=> b!1155407 (= e!657083 (and e!657080 mapRes!45284))))

(declare-fun condMapEmpty!45284 () Bool)

(declare-fun mapDefault!45284 () ValueCell!13777)

