; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100578 () Bool)

(assert start!100578)

(declare-fun b_free!25901 () Bool)

(declare-fun b_next!25901 () Bool)

(assert (=> start!100578 (= b_free!25901 (not b_next!25901))))

(declare-fun tp!90693 () Bool)

(declare-fun b_and!42689 () Bool)

(assert (=> start!100578 (= tp!90693 b_and!42689)))

(declare-fun b!1203293 () Bool)

(declare-fun e!683268 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77983 0))(
  ( (array!77984 (arr!37636 (Array (_ BitVec 32) (_ BitVec 64))) (size!38172 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77983)

(assert (=> b!1203293 (= e!683268 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38172 _keys!1208))))))

(declare-datatypes ((Unit!39892 0))(
  ( (Unit!39893) )
))
(declare-fun lt!545468 () Unit!39892)

(declare-fun e!683279 () Unit!39892)

(assert (=> b!1203293 (= lt!545468 e!683279)))

(declare-fun c!117805 () Bool)

(declare-fun lt!545474 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1203293 (= c!117805 (and (not lt!545474) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203293 (= lt!545474 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!58009 () Bool)

(declare-datatypes ((V!45933 0))(
  ( (V!45934 (val!15359 Int)) )
))
(declare-datatypes ((tuple2!19690 0))(
  ( (tuple2!19691 (_1!9856 (_ BitVec 64)) (_2!9856 V!45933)) )
))
(declare-datatypes ((List!26500 0))(
  ( (Nil!26497) (Cons!26496 (h!27705 tuple2!19690) (t!39381 List!26500)) )
))
(declare-datatypes ((ListLongMap!17659 0))(
  ( (ListLongMap!17660 (toList!8845 List!26500)) )
))
(declare-fun call!58018 () ListLongMap!17659)

(declare-fun call!58017 () ListLongMap!17659)

(assert (=> bm!58009 (= call!58018 call!58017)))

(declare-fun lt!545475 () ListLongMap!17659)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun bm!58010 () Bool)

(declare-fun call!58019 () Bool)

(declare-fun contains!6899 (ListLongMap!17659 (_ BitVec 64)) Bool)

(assert (=> bm!58010 (= call!58019 (contains!6899 (ite c!117805 lt!545475 call!58018) k!934))))

(declare-fun b!1203294 () Bool)

(declare-fun res!800789 () Bool)

(declare-fun e!683271 () Bool)

(assert (=> b!1203294 (=> (not res!800789) (not e!683271))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203294 (= res!800789 (validMask!0 mask!1564))))

(declare-fun b!1203295 () Bool)

(declare-fun res!800787 () Bool)

(declare-fun e!683272 () Bool)

(assert (=> b!1203295 (=> (not res!800787) (not e!683272))))

(declare-fun lt!545473 () array!77983)

(declare-datatypes ((List!26501 0))(
  ( (Nil!26498) (Cons!26497 (h!27706 (_ BitVec 64)) (t!39382 List!26501)) )
))
(declare-fun arrayNoDuplicates!0 (array!77983 (_ BitVec 32) List!26501) Bool)

(assert (=> b!1203295 (= res!800787 (arrayNoDuplicates!0 lt!545473 #b00000000000000000000000000000000 Nil!26498))))

(declare-fun zeroValue!944 () V!45933)

(declare-fun call!58013 () Unit!39892)

(declare-fun bm!58011 () Bool)

(declare-fun c!117803 () Bool)

(declare-fun lt!545476 () ListLongMap!17659)

(declare-fun minValue!944 () V!45933)

(declare-fun addStillContains!1000 (ListLongMap!17659 (_ BitVec 64) V!45933 (_ BitVec 64)) Unit!39892)

(assert (=> bm!58011 (= call!58013 (addStillContains!1000 lt!545476 (ite (or c!117805 c!117803) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117805 c!117803) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1203296 () Bool)

(declare-fun res!800790 () Bool)

(assert (=> b!1203296 (=> (not res!800790) (not e!683271))))

(assert (=> b!1203296 (= res!800790 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26498))))

(declare-fun mapNonEmpty!47750 () Bool)

(declare-fun mapRes!47750 () Bool)

(declare-fun tp!90692 () Bool)

(declare-fun e!683274 () Bool)

(assert (=> mapNonEmpty!47750 (= mapRes!47750 (and tp!90692 e!683274))))

(declare-fun mapKey!47750 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14593 0))(
  ( (ValueCellFull!14593 (v!17997 V!45933)) (EmptyCell!14593) )
))
(declare-fun mapValue!47750 () ValueCell!14593)

(declare-datatypes ((array!77985 0))(
  ( (array!77986 (arr!37637 (Array (_ BitVec 32) ValueCell!14593)) (size!38173 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77985)

(declare-fun mapRest!47750 () (Array (_ BitVec 32) ValueCell!14593))

(assert (=> mapNonEmpty!47750 (= (arr!37637 _values!996) (store mapRest!47750 mapKey!47750 mapValue!47750))))

(declare-fun b!1203297 () Bool)

(declare-fun e!683275 () Bool)

(declare-fun e!683276 () Bool)

(assert (=> b!1203297 (= e!683275 e!683276)))

(declare-fun res!800794 () Bool)

(assert (=> b!1203297 (=> res!800794 e!683276)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1203297 (= res!800794 (not (= from!1455 i!673)))))

(declare-fun lt!545470 () ListLongMap!17659)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!545466 () array!77985)

(declare-fun getCurrentListMapNoExtraKeys!5281 (array!77983 array!77985 (_ BitVec 32) (_ BitVec 32) V!45933 V!45933 (_ BitVec 32) Int) ListLongMap!17659)

(assert (=> b!1203297 (= lt!545470 (getCurrentListMapNoExtraKeys!5281 lt!545473 lt!545466 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3193 (Int (_ BitVec 64)) V!45933)

(assert (=> b!1203297 (= lt!545466 (array!77986 (store (arr!37637 _values!996) i!673 (ValueCellFull!14593 (dynLambda!3193 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38173 _values!996)))))

(declare-fun lt!545472 () ListLongMap!17659)

(assert (=> b!1203297 (= lt!545472 (getCurrentListMapNoExtraKeys!5281 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1203298 () Bool)

(declare-fun e!683281 () Bool)

(declare-fun call!58012 () ListLongMap!17659)

(declare-fun call!58016 () ListLongMap!17659)

(assert (=> b!1203298 (= e!683281 (= call!58012 call!58016))))

(declare-fun b!1203299 () Bool)

(declare-fun e!683277 () Unit!39892)

(declare-fun Unit!39894 () Unit!39892)

(assert (=> b!1203299 (= e!683277 Unit!39894)))

(declare-fun bm!58012 () Bool)

(declare-fun +!3971 (ListLongMap!17659 tuple2!19690) ListLongMap!17659)

(assert (=> bm!58012 (= call!58017 (+!3971 lt!545476 (ite (or c!117805 c!117803) (tuple2!19691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1203300 () Bool)

(declare-fun res!800785 () Bool)

(assert (=> b!1203300 (=> (not res!800785) (not e!683271))))

(assert (=> b!1203300 (= res!800785 (and (= (size!38173 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38172 _keys!1208) (size!38173 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1203301 () Bool)

(declare-fun e!683278 () Bool)

(assert (=> b!1203301 (= e!683278 e!683268)))

(declare-fun res!800796 () Bool)

(assert (=> b!1203301 (=> res!800796 e!683268)))

(assert (=> b!1203301 (= res!800796 (not (contains!6899 lt!545476 k!934)))))

(assert (=> b!1203301 (= lt!545476 (getCurrentListMapNoExtraKeys!5281 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58013 () Bool)

(assert (=> bm!58013 (= call!58012 (getCurrentListMapNoExtraKeys!5281 lt!545473 lt!545466 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203303 () Bool)

(declare-fun lt!545464 () Unit!39892)

(assert (=> b!1203303 (= e!683277 lt!545464)))

(declare-fun call!58015 () Unit!39892)

(assert (=> b!1203303 (= lt!545464 call!58015)))

(declare-fun call!58014 () Bool)

(assert (=> b!1203303 call!58014))

(declare-fun b!1203304 () Bool)

(assert (=> b!1203304 (= e!683272 (not e!683275))))

(declare-fun res!800791 () Bool)

(assert (=> b!1203304 (=> res!800791 e!683275)))

(assert (=> b!1203304 (= res!800791 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1203304 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!545469 () Unit!39892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77983 (_ BitVec 64) (_ BitVec 32)) Unit!39892)

(assert (=> b!1203304 (= lt!545469 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!58014 () Bool)

(assert (=> bm!58014 (= call!58015 call!58013)))

(declare-fun b!1203305 () Bool)

(assert (=> b!1203305 (= e!683271 e!683272)))

(declare-fun res!800792 () Bool)

(assert (=> b!1203305 (=> (not res!800792) (not e!683272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77983 (_ BitVec 32)) Bool)

(assert (=> b!1203305 (= res!800792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545473 mask!1564))))

(assert (=> b!1203305 (= lt!545473 (array!77984 (store (arr!37636 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38172 _keys!1208)))))

(declare-fun bm!58015 () Bool)

(assert (=> bm!58015 (= call!58014 call!58019)))

(declare-fun b!1203306 () Bool)

(declare-fun tp_is_empty!30605 () Bool)

(assert (=> b!1203306 (= e!683274 tp_is_empty!30605)))

(declare-fun mapIsEmpty!47750 () Bool)

(assert (=> mapIsEmpty!47750 mapRes!47750))

(declare-fun b!1203307 () Bool)

(declare-fun res!800795 () Bool)

(assert (=> b!1203307 (=> (not res!800795) (not e!683271))))

(assert (=> b!1203307 (= res!800795 (= (select (arr!37636 _keys!1208) i!673) k!934))))

(declare-fun b!1203308 () Bool)

(declare-fun c!117804 () Bool)

(assert (=> b!1203308 (= c!117804 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545474))))

(declare-fun e!683273 () Unit!39892)

(assert (=> b!1203308 (= e!683273 e!683277)))

(declare-fun bm!58016 () Bool)

(assert (=> bm!58016 (= call!58016 (getCurrentListMapNoExtraKeys!5281 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203309 () Bool)

(declare-fun res!800786 () Bool)

(assert (=> b!1203309 (=> (not res!800786) (not e!683271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203309 (= res!800786 (validKeyInArray!0 k!934))))

(declare-fun b!1203310 () Bool)

(assert (=> b!1203310 call!58014))

(declare-fun lt!545471 () Unit!39892)

(assert (=> b!1203310 (= lt!545471 call!58015)))

(assert (=> b!1203310 (= e!683273 lt!545471)))

(declare-fun b!1203311 () Bool)

(declare-fun e!683270 () Bool)

(assert (=> b!1203311 (= e!683270 tp_is_empty!30605)))

(declare-fun b!1203312 () Bool)

(declare-fun res!800788 () Bool)

(assert (=> b!1203312 (=> (not res!800788) (not e!683271))))

(assert (=> b!1203312 (= res!800788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1203313 () Bool)

(declare-fun res!800784 () Bool)

(assert (=> b!1203313 (=> (not res!800784) (not e!683271))))

(assert (=> b!1203313 (= res!800784 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38172 _keys!1208))))))

(declare-fun b!1203314 () Bool)

(declare-fun -!1811 (ListLongMap!17659 (_ BitVec 64)) ListLongMap!17659)

(assert (=> b!1203314 (= e!683281 (= call!58012 (-!1811 call!58016 k!934)))))

(declare-fun b!1203315 () Bool)

(declare-fun lt!545465 () Unit!39892)

(assert (=> b!1203315 (= e!683279 lt!545465)))

(declare-fun lt!545467 () Unit!39892)

(assert (=> b!1203315 (= lt!545467 call!58013)))

(assert (=> b!1203315 (= lt!545475 call!58017)))

(assert (=> b!1203315 call!58019))

(assert (=> b!1203315 (= lt!545465 (addStillContains!1000 lt!545475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1203315 (contains!6899 (+!3971 lt!545475 (tuple2!19691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1203316 () Bool)

(declare-fun e!683269 () Bool)

(assert (=> b!1203316 (= e!683269 (and e!683270 mapRes!47750))))

(declare-fun condMapEmpty!47750 () Bool)

(declare-fun mapDefault!47750 () ValueCell!14593)

