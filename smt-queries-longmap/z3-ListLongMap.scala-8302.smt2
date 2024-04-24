; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101396 () Bool)

(assert start!101396)

(declare-fun b_free!26083 () Bool)

(declare-fun b_next!26083 () Bool)

(assert (=> start!101396 (= b_free!26083 (not b_next!26083))))

(declare-fun tp!91271 () Bool)

(declare-fun b_and!43285 () Bool)

(assert (=> start!101396 (= tp!91271 b_and!43285)))

(declare-fun bm!60541 () Bool)

(declare-datatypes ((V!46177 0))(
  ( (V!46178 (val!15450 Int)) )
))
(declare-datatypes ((tuple2!19874 0))(
  ( (tuple2!19875 (_1!9948 (_ BitVec 64)) (_2!9948 V!46177)) )
))
(declare-datatypes ((List!26676 0))(
  ( (Nil!26673) (Cons!26672 (h!27890 tuple2!19874) (t!39731 List!26676)) )
))
(declare-datatypes ((ListLongMap!17851 0))(
  ( (ListLongMap!17852 (toList!8941 List!26676)) )
))
(declare-fun call!60546 () ListLongMap!17851)

(declare-fun call!60548 () ListLongMap!17851)

(assert (=> bm!60541 (= call!60546 call!60548)))

(declare-fun zeroValue!944 () V!46177)

(declare-fun bm!60542 () Bool)

(declare-fun c!120352 () Bool)

(declare-fun c!120356 () Bool)

(declare-fun lt!552448 () ListLongMap!17851)

(declare-fun lt!552450 () ListLongMap!17851)

(declare-fun minValue!944 () V!46177)

(declare-fun +!4097 (ListLongMap!17851 tuple2!19874) ListLongMap!17851)

(assert (=> bm!60542 (= call!60548 (+!4097 (ite c!120356 lt!552450 lt!552448) (ite c!120356 (tuple2!19875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120352 (tuple2!19875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1215131 () Bool)

(declare-fun e!690180 () Bool)

(declare-fun tp_is_empty!30787 () Bool)

(assert (=> b!1215131 (= e!690180 tp_is_empty!30787)))

(declare-fun bm!60543 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14684 0))(
  ( (ValueCellFull!14684 (v!18099 V!46177)) (EmptyCell!14684) )
))
(declare-datatypes ((array!78395 0))(
  ( (array!78396 (arr!37826 (Array (_ BitVec 32) ValueCell!14684)) (size!38363 (_ BitVec 32))) )
))
(declare-fun lt!552454 () array!78395)

(declare-fun call!60547 () ListLongMap!17851)

(declare-datatypes ((array!78397 0))(
  ( (array!78398 (arr!37827 (Array (_ BitVec 32) (_ BitVec 64))) (size!38364 (_ BitVec 32))) )
))
(declare-fun lt!552456 () array!78397)

(declare-fun getCurrentListMapNoExtraKeys!5399 (array!78397 array!78395 (_ BitVec 32) (_ BitVec 32) V!46177 V!46177 (_ BitVec 32) Int) ListLongMap!17851)

(assert (=> bm!60543 (= call!60547 (getCurrentListMapNoExtraKeys!5399 lt!552456 lt!552454 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1215132 () Bool)

(declare-fun res!806450 () Bool)

(declare-fun e!690179 () Bool)

(assert (=> b!1215132 (=> (not res!806450) (not e!690179))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215132 (= res!806450 (validKeyInArray!0 k0!934))))

(declare-fun b!1215133 () Bool)

(declare-fun e!690183 () Bool)

(declare-fun e!690185 () Bool)

(assert (=> b!1215133 (= e!690183 e!690185)))

(declare-fun res!806454 () Bool)

(assert (=> b!1215133 (=> res!806454 e!690185)))

(declare-fun _keys!1208 () array!78397)

(assert (=> b!1215133 (= res!806454 (not (= (select (arr!37827 _keys!1208) from!1455) k0!934)))))

(declare-fun e!690187 () Bool)

(assert (=> b!1215133 e!690187))

(declare-fun c!120353 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215133 (= c!120353 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun _values!996 () array!78395)

(declare-datatypes ((Unit!40221 0))(
  ( (Unit!40222) )
))
(declare-fun lt!552457 () Unit!40221)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1079 (array!78397 array!78395 (_ BitVec 32) (_ BitVec 32) V!46177 V!46177 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40221)

(assert (=> b!1215133 (= lt!552457 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1079 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60544 () Bool)

(declare-fun call!60545 () Unit!40221)

(declare-fun addStillContains!1079 (ListLongMap!17851 (_ BitVec 64) V!46177 (_ BitVec 64)) Unit!40221)

(assert (=> bm!60544 (= call!60545 (addStillContains!1079 (ite c!120356 lt!552450 lt!552448) (ite c!120356 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!120352 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!120356 minValue!944 (ite c!120352 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!60545 () Bool)

(declare-fun call!60551 () Bool)

(declare-fun contains!7035 (ListLongMap!17851 (_ BitVec 64)) Bool)

(assert (=> bm!60545 (= call!60551 (contains!7035 (ite c!120356 lt!552450 call!60546) k0!934))))

(declare-fun b!1215134 () Bool)

(declare-fun res!806442 () Bool)

(assert (=> b!1215134 (=> (not res!806442) (not e!690179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215134 (= res!806442 (validMask!0 mask!1564))))

(declare-fun bm!60546 () Bool)

(declare-fun call!60550 () Bool)

(assert (=> bm!60546 (= call!60550 call!60551)))

(declare-fun b!1215135 () Bool)

(declare-fun res!806449 () Bool)

(assert (=> b!1215135 (=> (not res!806449) (not e!690179))))

(assert (=> b!1215135 (= res!806449 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38364 _keys!1208))))))

(declare-fun bm!60547 () Bool)

(declare-fun call!60549 () ListLongMap!17851)

(assert (=> bm!60547 (= call!60549 (getCurrentListMapNoExtraKeys!5399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1215136 () Bool)

(declare-fun res!806452 () Bool)

(assert (=> b!1215136 (=> (not res!806452) (not e!690179))))

(assert (=> b!1215136 (= res!806452 (= (select (arr!37827 _keys!1208) i!673) k0!934))))

(declare-fun b!1215137 () Bool)

(declare-fun res!806441 () Bool)

(declare-fun e!690182 () Bool)

(assert (=> b!1215137 (=> (not res!806441) (not e!690182))))

(declare-datatypes ((List!26677 0))(
  ( (Nil!26674) (Cons!26673 (h!27891 (_ BitVec 64)) (t!39732 List!26677)) )
))
(declare-fun arrayNoDuplicates!0 (array!78397 (_ BitVec 32) List!26677) Bool)

(assert (=> b!1215137 (= res!806441 (arrayNoDuplicates!0 lt!552456 #b00000000000000000000000000000000 Nil!26674))))

(declare-fun b!1215138 () Bool)

(declare-fun e!690190 () Unit!40221)

(declare-fun lt!552459 () Unit!40221)

(assert (=> b!1215138 (= e!690190 lt!552459)))

(declare-fun call!60544 () Unit!40221)

(assert (=> b!1215138 (= lt!552459 call!60544)))

(assert (=> b!1215138 call!60550))

(declare-fun res!806453 () Bool)

(assert (=> start!101396 (=> (not res!806453) (not e!690179))))

(assert (=> start!101396 (= res!806453 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38364 _keys!1208))))))

(assert (=> start!101396 e!690179))

(assert (=> start!101396 tp_is_empty!30787))

(declare-fun array_inv!28870 (array!78397) Bool)

(assert (=> start!101396 (array_inv!28870 _keys!1208)))

(assert (=> start!101396 true))

(assert (=> start!101396 tp!91271))

(declare-fun e!690181 () Bool)

(declare-fun array_inv!28871 (array!78395) Bool)

(assert (=> start!101396 (and (array_inv!28871 _values!996) e!690181)))

(declare-fun b!1215139 () Bool)

(assert (=> b!1215139 call!60550))

(declare-fun lt!552443 () Unit!40221)

(assert (=> b!1215139 (= lt!552443 call!60544)))

(declare-fun e!690174 () Unit!40221)

(assert (=> b!1215139 (= e!690174 lt!552443)))

(declare-fun b!1215140 () Bool)

(declare-fun res!806446 () Bool)

(assert (=> b!1215140 (=> (not res!806446) (not e!690179))))

(assert (=> b!1215140 (= res!806446 (and (= (size!38363 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38364 _keys!1208) (size!38363 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215141 () Bool)

(declare-fun e!690178 () Bool)

(assert (=> b!1215141 (= e!690178 tp_is_empty!30787)))

(declare-fun b!1215142 () Bool)

(declare-fun lt!552442 () ListLongMap!17851)

(declare-fun e!690189 () Bool)

(assert (=> b!1215142 (= e!690189 (= lt!552442 (getCurrentListMapNoExtraKeys!5399 lt!552456 lt!552454 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1215143 () Bool)

(assert (=> b!1215143 (= e!690179 e!690182)))

(declare-fun res!806447 () Bool)

(assert (=> b!1215143 (=> (not res!806447) (not e!690182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78397 (_ BitVec 32)) Bool)

(assert (=> b!1215143 (= res!806447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552456 mask!1564))))

(assert (=> b!1215143 (= lt!552456 (array!78398 (store (arr!37827 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38364 _keys!1208)))))

(declare-fun b!1215144 () Bool)

(declare-fun e!690175 () Bool)

(assert (=> b!1215144 (= e!690182 (not e!690175))))

(declare-fun res!806455 () Bool)

(assert (=> b!1215144 (=> res!806455 e!690175)))

(assert (=> b!1215144 (= res!806455 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215144 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!552451 () Unit!40221)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78397 (_ BitVec 64) (_ BitVec 32)) Unit!40221)

(assert (=> b!1215144 (= lt!552451 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!690188 () Bool)

(declare-fun b!1215145 () Bool)

(assert (=> b!1215145 (= e!690188 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1215146 () Bool)

(declare-fun Unit!40223 () Unit!40221)

(assert (=> b!1215146 (= e!690174 Unit!40223)))

(declare-fun b!1215147 () Bool)

(declare-fun res!806443 () Bool)

(assert (=> b!1215147 (=> (not res!806443) (not e!690179))))

(assert (=> b!1215147 (= res!806443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!690184 () Bool)

(declare-fun lt!552458 () Bool)

(declare-fun b!1215148 () Bool)

(assert (=> b!1215148 (= e!690184 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!552458) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1215149 () Bool)

(declare-fun -!1864 (ListLongMap!17851 (_ BitVec 64)) ListLongMap!17851)

(assert (=> b!1215149 (= e!690187 (= call!60547 (-!1864 call!60549 k0!934)))))

(declare-fun b!1215150 () Bool)

(declare-fun mapRes!48055 () Bool)

(assert (=> b!1215150 (= e!690181 (and e!690180 mapRes!48055))))

(declare-fun condMapEmpty!48055 () Bool)

(declare-fun mapDefault!48055 () ValueCell!14684)

(assert (=> b!1215150 (= condMapEmpty!48055 (= (arr!37826 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14684)) mapDefault!48055)))))

(declare-fun bm!60548 () Bool)

(assert (=> bm!60548 (= call!60544 call!60545)))

(declare-fun b!1215151 () Bool)

(declare-fun res!806451 () Bool)

(assert (=> b!1215151 (=> (not res!806451) (not e!690179))))

(assert (=> b!1215151 (= res!806451 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26674))))

(declare-fun mapIsEmpty!48055 () Bool)

(assert (=> mapIsEmpty!48055 mapRes!48055))

(declare-fun b!1215152 () Bool)

(assert (=> b!1215152 (= e!690187 (= call!60547 call!60549))))

(declare-fun b!1215153 () Bool)

(assert (=> b!1215153 (= e!690184 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1215154 () Bool)

(assert (=> b!1215154 (= c!120352 (and (not lt!552458) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!690177 () Unit!40221)

(assert (=> b!1215154 (= e!690177 e!690190)))

(declare-fun b!1215155 () Bool)

(declare-fun e!690186 () Unit!40221)

(declare-fun Unit!40224 () Unit!40221)

(assert (=> b!1215155 (= e!690186 Unit!40224)))

(declare-fun b!1215156 () Bool)

(declare-fun Unit!40225 () Unit!40221)

(assert (=> b!1215156 (= e!690186 Unit!40225)))

(assert (=> b!1215156 (= lt!552458 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1215156 (= c!120356 (and (not lt!552458) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!552452 () Unit!40221)

(assert (=> b!1215156 (= lt!552452 e!690177)))

(declare-fun lt!552447 () Unit!40221)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!626 (array!78397 array!78395 (_ BitVec 32) (_ BitVec 32) V!46177 V!46177 (_ BitVec 64) (_ BitVec 32) Int) Unit!40221)

(assert (=> b!1215156 (= lt!552447 (lemmaListMapContainsThenArrayContainsFrom!626 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!120354 () Bool)

(assert (=> b!1215156 (= c!120354 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!806444 () Bool)

(assert (=> b!1215156 (= res!806444 e!690184)))

(assert (=> b!1215156 (=> (not res!806444) (not e!690188))))

(assert (=> b!1215156 e!690188))

(declare-fun lt!552455 () Unit!40221)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78397 (_ BitVec 32) (_ BitVec 32)) Unit!40221)

(assert (=> b!1215156 (= lt!552455 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1215156 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26674)))

(declare-fun lt!552444 () Unit!40221)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78397 (_ BitVec 64) (_ BitVec 32) List!26677) Unit!40221)

(assert (=> b!1215156 (= lt!552444 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26674))))

(assert (=> b!1215156 false))

(declare-fun b!1215157 () Bool)

(assert (=> b!1215157 (= e!690185 true)))

(assert (=> b!1215157 e!690189))

(declare-fun res!806448 () Bool)

(assert (=> b!1215157 (=> (not res!806448) (not e!690189))))

(assert (=> b!1215157 (= res!806448 (= lt!552442 lt!552448))))

(declare-fun lt!552446 () ListLongMap!17851)

(assert (=> b!1215157 (= lt!552442 (-!1864 lt!552446 k0!934))))

(declare-fun lt!552441 () V!46177)

(assert (=> b!1215157 (= (-!1864 (+!4097 lt!552448 (tuple2!19875 (select (arr!37827 _keys!1208) from!1455) lt!552441)) (select (arr!37827 _keys!1208) from!1455)) lt!552448)))

(declare-fun lt!552445 () Unit!40221)

(declare-fun addThenRemoveForNewKeyIsSame!290 (ListLongMap!17851 (_ BitVec 64) V!46177) Unit!40221)

(assert (=> b!1215157 (= lt!552445 (addThenRemoveForNewKeyIsSame!290 lt!552448 (select (arr!37827 _keys!1208) from!1455) lt!552441))))

(declare-fun lt!552460 () V!46177)

(declare-fun get!19331 (ValueCell!14684 V!46177) V!46177)

(assert (=> b!1215157 (= lt!552441 (get!19331 (select (arr!37826 _values!996) from!1455) lt!552460))))

(declare-fun lt!552461 () Unit!40221)

(assert (=> b!1215157 (= lt!552461 e!690186)))

(declare-fun c!120355 () Bool)

(assert (=> b!1215157 (= c!120355 (contains!7035 lt!552448 k0!934))))

(assert (=> b!1215157 (= lt!552448 (getCurrentListMapNoExtraKeys!5399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1215158 () Bool)

(assert (=> b!1215158 (= e!690190 e!690174)))

(declare-fun c!120351 () Bool)

(assert (=> b!1215158 (= c!120351 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!552458))))

(declare-fun mapNonEmpty!48055 () Bool)

(declare-fun tp!91270 () Bool)

(assert (=> mapNonEmpty!48055 (= mapRes!48055 (and tp!91270 e!690178))))

(declare-fun mapRest!48055 () (Array (_ BitVec 32) ValueCell!14684))

(declare-fun mapValue!48055 () ValueCell!14684)

(declare-fun mapKey!48055 () (_ BitVec 32))

(assert (=> mapNonEmpty!48055 (= (arr!37826 _values!996) (store mapRest!48055 mapKey!48055 mapValue!48055))))

(declare-fun b!1215159 () Bool)

(assert (=> b!1215159 (contains!7035 call!60548 k0!934)))

(declare-fun lt!552462 () Unit!40221)

(assert (=> b!1215159 (= lt!552462 call!60545)))

(assert (=> b!1215159 call!60551))

(assert (=> b!1215159 (= lt!552450 (+!4097 lt!552448 (tuple2!19875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!552449 () Unit!40221)

(assert (=> b!1215159 (= lt!552449 (addStillContains!1079 lt!552448 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1215159 (= e!690177 lt!552462)))

(declare-fun b!1215160 () Bool)

(assert (=> b!1215160 (= e!690175 e!690183)))

(declare-fun res!806445 () Bool)

(assert (=> b!1215160 (=> res!806445 e!690183)))

(assert (=> b!1215160 (= res!806445 (not (= from!1455 i!673)))))

(declare-fun lt!552453 () ListLongMap!17851)

(assert (=> b!1215160 (= lt!552453 (getCurrentListMapNoExtraKeys!5399 lt!552456 lt!552454 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1215160 (= lt!552454 (array!78396 (store (arr!37826 _values!996) i!673 (ValueCellFull!14684 lt!552460)) (size!38363 _values!996)))))

(declare-fun dynLambda!3312 (Int (_ BitVec 64)) V!46177)

(assert (=> b!1215160 (= lt!552460 (dynLambda!3312 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1215160 (= lt!552446 (getCurrentListMapNoExtraKeys!5399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101396 res!806453) b!1215134))

(assert (= (and b!1215134 res!806442) b!1215140))

(assert (= (and b!1215140 res!806446) b!1215147))

(assert (= (and b!1215147 res!806443) b!1215151))

(assert (= (and b!1215151 res!806451) b!1215135))

(assert (= (and b!1215135 res!806449) b!1215132))

(assert (= (and b!1215132 res!806450) b!1215136))

(assert (= (and b!1215136 res!806452) b!1215143))

(assert (= (and b!1215143 res!806447) b!1215137))

(assert (= (and b!1215137 res!806441) b!1215144))

(assert (= (and b!1215144 (not res!806455)) b!1215160))

(assert (= (and b!1215160 (not res!806445)) b!1215133))

(assert (= (and b!1215133 c!120353) b!1215149))

(assert (= (and b!1215133 (not c!120353)) b!1215152))

(assert (= (or b!1215149 b!1215152) bm!60543))

(assert (= (or b!1215149 b!1215152) bm!60547))

(assert (= (and b!1215133 (not res!806454)) b!1215157))

(assert (= (and b!1215157 c!120355) b!1215156))

(assert (= (and b!1215157 (not c!120355)) b!1215155))

(assert (= (and b!1215156 c!120356) b!1215159))

(assert (= (and b!1215156 (not c!120356)) b!1215154))

(assert (= (and b!1215154 c!120352) b!1215138))

(assert (= (and b!1215154 (not c!120352)) b!1215158))

(assert (= (and b!1215158 c!120351) b!1215139))

(assert (= (and b!1215158 (not c!120351)) b!1215146))

(assert (= (or b!1215138 b!1215139) bm!60548))

(assert (= (or b!1215138 b!1215139) bm!60541))

(assert (= (or b!1215138 b!1215139) bm!60546))

(assert (= (or b!1215159 bm!60546) bm!60545))

(assert (= (or b!1215159 bm!60548) bm!60544))

(assert (= (or b!1215159 bm!60541) bm!60542))

(assert (= (and b!1215156 c!120354) b!1215153))

(assert (= (and b!1215156 (not c!120354)) b!1215148))

(assert (= (and b!1215156 res!806444) b!1215145))

(assert (= (and b!1215157 res!806448) b!1215142))

(assert (= (and b!1215150 condMapEmpty!48055) mapIsEmpty!48055))

(assert (= (and b!1215150 (not condMapEmpty!48055)) mapNonEmpty!48055))

(get-info :version)

(assert (= (and mapNonEmpty!48055 ((_ is ValueCellFull!14684) mapValue!48055)) b!1215141))

(assert (= (and b!1215150 ((_ is ValueCellFull!14684) mapDefault!48055)) b!1215131))

(assert (= start!101396 b!1215150))

(declare-fun b_lambda!21753 () Bool)

(assert (=> (not b_lambda!21753) (not b!1215160)))

(declare-fun t!39730 () Bool)

(declare-fun tb!10875 () Bool)

(assert (=> (and start!101396 (= defaultEntry!1004 defaultEntry!1004) t!39730) tb!10875))

(declare-fun result!22355 () Bool)

(assert (=> tb!10875 (= result!22355 tp_is_empty!30787)))

(assert (=> b!1215160 t!39730))

(declare-fun b_and!43287 () Bool)

(assert (= b_and!43285 (and (=> t!39730 result!22355) b_and!43287)))

(declare-fun m!1120685 () Bool)

(assert (=> bm!60547 m!1120685))

(declare-fun m!1120687 () Bool)

(assert (=> bm!60543 m!1120687))

(declare-fun m!1120689 () Bool)

(assert (=> b!1215133 m!1120689))

(declare-fun m!1120691 () Bool)

(assert (=> b!1215133 m!1120691))

(declare-fun m!1120693 () Bool)

(assert (=> b!1215132 m!1120693))

(declare-fun m!1120695 () Bool)

(assert (=> b!1215143 m!1120695))

(declare-fun m!1120697 () Bool)

(assert (=> b!1215143 m!1120697))

(assert (=> b!1215157 m!1120685))

(declare-fun m!1120699 () Bool)

(assert (=> b!1215157 m!1120699))

(assert (=> b!1215157 m!1120689))

(declare-fun m!1120701 () Bool)

(assert (=> b!1215157 m!1120701))

(declare-fun m!1120703 () Bool)

(assert (=> b!1215157 m!1120703))

(assert (=> b!1215157 m!1120689))

(declare-fun m!1120705 () Bool)

(assert (=> b!1215157 m!1120705))

(assert (=> b!1215157 m!1120703))

(declare-fun m!1120707 () Bool)

(assert (=> b!1215157 m!1120707))

(assert (=> b!1215157 m!1120699))

(assert (=> b!1215157 m!1120689))

(declare-fun m!1120709 () Bool)

(assert (=> b!1215157 m!1120709))

(declare-fun m!1120711 () Bool)

(assert (=> b!1215157 m!1120711))

(declare-fun m!1120713 () Bool)

(assert (=> b!1215149 m!1120713))

(declare-fun m!1120715 () Bool)

(assert (=> bm!60542 m!1120715))

(declare-fun m!1120717 () Bool)

(assert (=> b!1215134 m!1120717))

(declare-fun m!1120719 () Bool)

(assert (=> b!1215136 m!1120719))

(declare-fun m!1120721 () Bool)

(assert (=> start!101396 m!1120721))

(declare-fun m!1120723 () Bool)

(assert (=> start!101396 m!1120723))

(declare-fun m!1120725 () Bool)

(assert (=> bm!60544 m!1120725))

(declare-fun m!1120727 () Bool)

(assert (=> mapNonEmpty!48055 m!1120727))

(declare-fun m!1120729 () Bool)

(assert (=> b!1215145 m!1120729))

(declare-fun m!1120731 () Bool)

(assert (=> bm!60545 m!1120731))

(declare-fun m!1120733 () Bool)

(assert (=> b!1215144 m!1120733))

(declare-fun m!1120735 () Bool)

(assert (=> b!1215144 m!1120735))

(assert (=> b!1215142 m!1120687))

(declare-fun m!1120737 () Bool)

(assert (=> b!1215160 m!1120737))

(declare-fun m!1120739 () Bool)

(assert (=> b!1215160 m!1120739))

(declare-fun m!1120741 () Bool)

(assert (=> b!1215160 m!1120741))

(declare-fun m!1120743 () Bool)

(assert (=> b!1215160 m!1120743))

(declare-fun m!1120745 () Bool)

(assert (=> b!1215156 m!1120745))

(declare-fun m!1120747 () Bool)

(assert (=> b!1215156 m!1120747))

(declare-fun m!1120749 () Bool)

(assert (=> b!1215156 m!1120749))

(declare-fun m!1120751 () Bool)

(assert (=> b!1215156 m!1120751))

(declare-fun m!1120753 () Bool)

(assert (=> b!1215137 m!1120753))

(declare-fun m!1120755 () Bool)

(assert (=> b!1215147 m!1120755))

(declare-fun m!1120757 () Bool)

(assert (=> b!1215159 m!1120757))

(declare-fun m!1120759 () Bool)

(assert (=> b!1215159 m!1120759))

(declare-fun m!1120761 () Bool)

(assert (=> b!1215159 m!1120761))

(assert (=> b!1215153 m!1120729))

(declare-fun m!1120763 () Bool)

(assert (=> b!1215151 m!1120763))

(check-sat (not b!1215160) (not b!1215142) (not b!1215133) (not b!1215132) (not mapNonEmpty!48055) (not b!1215143) (not bm!60547) (not bm!60542) (not b!1215144) (not b!1215151) (not bm!60545) (not bm!60543) (not b!1215134) b_and!43287 (not b!1215157) (not bm!60544) (not b_lambda!21753) (not b!1215137) (not b_next!26083) (not b!1215147) (not start!101396) (not b!1215156) (not b!1215153) tp_is_empty!30787 (not b!1215159) (not b!1215149) (not b!1215145))
(check-sat b_and!43287 (not b_next!26083))
