; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101086 () Bool)

(assert start!101086)

(declare-fun b_free!26053 () Bool)

(declare-fun b_next!26053 () Bool)

(assert (=> start!101086 (= b_free!26053 (not b_next!26053))))

(declare-fun tp!91178 () Bool)

(declare-fun b_and!43179 () Bool)

(assert (=> start!101086 (= tp!91178 b_and!43179)))

(declare-fun b!1212155 () Bool)

(declare-datatypes ((Unit!40035 0))(
  ( (Unit!40036) )
))
(declare-fun e!688394 () Unit!40035)

(declare-fun lt!550655 () Unit!40035)

(assert (=> b!1212155 (= e!688394 lt!550655)))

(declare-fun call!60078 () Unit!40035)

(assert (=> b!1212155 (= lt!550655 call!60078)))

(declare-fun call!60080 () Bool)

(assert (=> b!1212155 call!60080))

(declare-fun bm!60071 () Bool)

(declare-fun call!60077 () Unit!40035)

(assert (=> bm!60071 (= call!60078 call!60077)))

(declare-fun bm!60072 () Bool)

(declare-datatypes ((V!46137 0))(
  ( (V!46138 (val!15435 Int)) )
))
(declare-datatypes ((tuple2!19908 0))(
  ( (tuple2!19909 (_1!9965 (_ BitVec 64)) (_2!9965 V!46137)) )
))
(declare-datatypes ((List!26686 0))(
  ( (Nil!26683) (Cons!26682 (h!27891 tuple2!19908) (t!39710 List!26686)) )
))
(declare-datatypes ((ListLongMap!17877 0))(
  ( (ListLongMap!17878 (toList!8954 List!26686)) )
))
(declare-fun call!60079 () ListLongMap!17877)

(declare-fun call!60074 () ListLongMap!17877)

(assert (=> bm!60072 (= call!60079 call!60074)))

(declare-fun res!805118 () Bool)

(declare-fun e!688385 () Bool)

(assert (=> start!101086 (=> (not res!805118) (not e!688385))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78214 0))(
  ( (array!78215 (arr!37743 (Array (_ BitVec 32) (_ BitVec 64))) (size!38281 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78214)

(assert (=> start!101086 (= res!805118 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38281 _keys!1208))))))

(assert (=> start!101086 e!688385))

(declare-fun tp_is_empty!30757 () Bool)

(assert (=> start!101086 tp_is_empty!30757))

(declare-fun array_inv!28854 (array!78214) Bool)

(assert (=> start!101086 (array_inv!28854 _keys!1208)))

(assert (=> start!101086 true))

(assert (=> start!101086 tp!91178))

(declare-datatypes ((ValueCell!14669 0))(
  ( (ValueCellFull!14669 (v!18086 V!46137)) (EmptyCell!14669) )
))
(declare-datatypes ((array!78216 0))(
  ( (array!78217 (arr!37744 (Array (_ BitVec 32) ValueCell!14669)) (size!38282 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78216)

(declare-fun e!688392 () Bool)

(declare-fun array_inv!28855 (array!78216) Bool)

(assert (=> start!101086 (and (array_inv!28855 _values!996) e!688392)))

(declare-fun b!1212156 () Bool)

(declare-fun e!688380 () Bool)

(assert (=> b!1212156 (= e!688380 tp_is_empty!30757)))

(declare-fun b!1212157 () Bool)

(declare-fun e!688389 () Unit!40035)

(declare-fun Unit!40037 () Unit!40035)

(assert (=> b!1212157 (= e!688389 Unit!40037)))

(declare-fun b!1212158 () Bool)

(declare-fun res!805126 () Bool)

(assert (=> b!1212158 (=> (not res!805126) (not e!688385))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212158 (= res!805126 (validMask!0 mask!1564))))

(declare-fun b!1212159 () Bool)

(declare-fun res!805122 () Bool)

(assert (=> b!1212159 (=> (not res!805122) (not e!688385))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1212159 (= res!805122 (and (= (size!38282 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38281 _keys!1208) (size!38282 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1212160 () Bool)

(declare-fun res!805123 () Bool)

(assert (=> b!1212160 (=> (not res!805123) (not e!688385))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212160 (= res!805123 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38281 _keys!1208))))))

(declare-fun b!1212161 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!688390 () Bool)

(declare-fun arrayContainsKey!0 (array!78214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212161 (= e!688390 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212162 () Bool)

(declare-fun mapRes!48007 () Bool)

(assert (=> b!1212162 (= e!688392 (and e!688380 mapRes!48007))))

(declare-fun condMapEmpty!48007 () Bool)

(declare-fun mapDefault!48007 () ValueCell!14669)

(assert (=> b!1212162 (= condMapEmpty!48007 (= (arr!37744 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14669)) mapDefault!48007)))))

(declare-fun call!60081 () ListLongMap!17877)

(declare-fun call!60076 () ListLongMap!17877)

(declare-fun b!1212163 () Bool)

(declare-fun e!688382 () Bool)

(declare-fun -!1831 (ListLongMap!17877 (_ BitVec 64)) ListLongMap!17877)

(assert (=> b!1212163 (= e!688382 (= call!60081 (-!1831 call!60076 k0!934)))))

(declare-fun b!1212164 () Bool)

(declare-fun e!688384 () Unit!40035)

(assert (=> b!1212164 (= e!688394 e!688384)))

(declare-fun c!119610 () Bool)

(declare-fun lt!550663 () Bool)

(assert (=> b!1212164 (= c!119610 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550663))))

(declare-fun bm!60073 () Bool)

(declare-fun call!60075 () Bool)

(assert (=> bm!60073 (= call!60080 call!60075)))

(declare-fun b!1212165 () Bool)

(declare-fun Unit!40038 () Unit!40035)

(assert (=> b!1212165 (= e!688389 Unit!40038)))

(assert (=> b!1212165 (= lt!550663 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119607 () Bool)

(assert (=> b!1212165 (= c!119607 (and (not lt!550663) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550661 () Unit!40035)

(declare-fun e!688386 () Unit!40035)

(assert (=> b!1212165 (= lt!550661 e!688386)))

(declare-fun zeroValue!944 () V!46137)

(declare-fun lt!550665 () Unit!40035)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46137)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!600 (array!78214 array!78216 (_ BitVec 32) (_ BitVec 32) V!46137 V!46137 (_ BitVec 64) (_ BitVec 32) Int) Unit!40035)

(assert (=> b!1212165 (= lt!550665 (lemmaListMapContainsThenArrayContainsFrom!600 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119612 () Bool)

(assert (=> b!1212165 (= c!119612 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805130 () Bool)

(declare-fun e!688388 () Bool)

(assert (=> b!1212165 (= res!805130 e!688388)))

(assert (=> b!1212165 (=> (not res!805130) (not e!688390))))

(assert (=> b!1212165 e!688390))

(declare-fun lt!550673 () Unit!40035)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78214 (_ BitVec 32) (_ BitVec 32)) Unit!40035)

(assert (=> b!1212165 (= lt!550673 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26687 0))(
  ( (Nil!26684) (Cons!26683 (h!27892 (_ BitVec 64)) (t!39711 List!26687)) )
))
(declare-fun arrayNoDuplicates!0 (array!78214 (_ BitVec 32) List!26687) Bool)

(assert (=> b!1212165 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26684)))

(declare-fun lt!550676 () Unit!40035)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78214 (_ BitVec 64) (_ BitVec 32) List!26687) Unit!40035)

(assert (=> b!1212165 (= lt!550676 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26684))))

(assert (=> b!1212165 false))

(declare-fun b!1212166 () Bool)

(declare-fun res!805124 () Bool)

(assert (=> b!1212166 (=> (not res!805124) (not e!688385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78214 (_ BitVec 32)) Bool)

(assert (=> b!1212166 (= res!805124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1212167 () Bool)

(assert (=> b!1212167 call!60080))

(declare-fun lt!550656 () Unit!40035)

(assert (=> b!1212167 (= lt!550656 call!60078)))

(assert (=> b!1212167 (= e!688384 lt!550656)))

(declare-fun b!1212168 () Bool)

(assert (=> b!1212168 (= e!688388 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212169 () Bool)

(declare-fun e!688383 () Bool)

(assert (=> b!1212169 (= e!688383 (bvslt i!673 (size!38282 _values!996)))))

(declare-fun e!688387 () Bool)

(assert (=> b!1212169 e!688387))

(declare-fun res!805121 () Bool)

(assert (=> b!1212169 (=> (not res!805121) (not e!688387))))

(declare-fun lt!550659 () ListLongMap!17877)

(declare-fun lt!550664 () ListLongMap!17877)

(assert (=> b!1212169 (= res!805121 (= lt!550659 lt!550664))))

(declare-fun lt!550668 () ListLongMap!17877)

(assert (=> b!1212169 (= lt!550659 (-!1831 lt!550668 k0!934))))

(declare-fun lt!550669 () V!46137)

(declare-fun +!4074 (ListLongMap!17877 tuple2!19908) ListLongMap!17877)

(assert (=> b!1212169 (= (-!1831 (+!4074 lt!550664 (tuple2!19909 (select (arr!37743 _keys!1208) from!1455) lt!550669)) (select (arr!37743 _keys!1208) from!1455)) lt!550664)))

(declare-fun lt!550674 () Unit!40035)

(declare-fun addThenRemoveForNewKeyIsSame!267 (ListLongMap!17877 (_ BitVec 64) V!46137) Unit!40035)

(assert (=> b!1212169 (= lt!550674 (addThenRemoveForNewKeyIsSame!267 lt!550664 (select (arr!37743 _keys!1208) from!1455) lt!550669))))

(declare-fun lt!550657 () V!46137)

(declare-fun get!19254 (ValueCell!14669 V!46137) V!46137)

(assert (=> b!1212169 (= lt!550669 (get!19254 (select (arr!37744 _values!996) from!1455) lt!550657))))

(declare-fun lt!550662 () Unit!40035)

(assert (=> b!1212169 (= lt!550662 e!688389)))

(declare-fun c!119608 () Bool)

(declare-fun contains!6960 (ListLongMap!17877 (_ BitVec 64)) Bool)

(assert (=> b!1212169 (= c!119608 (contains!6960 lt!550664 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!5396 (array!78214 array!78216 (_ BitVec 32) (_ BitVec 32) V!46137 V!46137 (_ BitVec 32) Int) ListLongMap!17877)

(assert (=> b!1212169 (= lt!550664 (getCurrentListMapNoExtraKeys!5396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!550672 () ListLongMap!17877)

(declare-fun c!119609 () Bool)

(declare-fun bm!60074 () Bool)

(assert (=> bm!60074 (= call!60074 (+!4074 (ite c!119607 lt!550672 lt!550664) (ite c!119607 (tuple2!19909 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119609 (tuple2!19909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19909 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1212170 () Bool)

(declare-fun e!688395 () Bool)

(declare-fun e!688396 () Bool)

(assert (=> b!1212170 (= e!688395 (not e!688396))))

(declare-fun res!805132 () Bool)

(assert (=> b!1212170 (=> res!805132 e!688396)))

(assert (=> b!1212170 (= res!805132 (bvsgt from!1455 i!673))))

(assert (=> b!1212170 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550658 () Unit!40035)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78214 (_ BitVec 64) (_ BitVec 32)) Unit!40035)

(assert (=> b!1212170 (= lt!550658 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1212171 () Bool)

(declare-fun res!805128 () Bool)

(assert (=> b!1212171 (=> (not res!805128) (not e!688395))))

(declare-fun lt!550671 () array!78214)

(assert (=> b!1212171 (= res!805128 (arrayNoDuplicates!0 lt!550671 #b00000000000000000000000000000000 Nil!26684))))

(declare-fun bm!60075 () Bool)

(declare-fun addStillContains!1059 (ListLongMap!17877 (_ BitVec 64) V!46137 (_ BitVec 64)) Unit!40035)

(assert (=> bm!60075 (= call!60077 (addStillContains!1059 (ite c!119607 lt!550672 lt!550664) (ite c!119607 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119609 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119607 minValue!944 (ite c!119609 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!60076 () Bool)

(assert (=> bm!60076 (= call!60075 (contains!6960 (ite c!119607 lt!550672 call!60079) k0!934))))

(declare-fun mapNonEmpty!48007 () Bool)

(declare-fun tp!91177 () Bool)

(declare-fun e!688393 () Bool)

(assert (=> mapNonEmpty!48007 (= mapRes!48007 (and tp!91177 e!688393))))

(declare-fun mapValue!48007 () ValueCell!14669)

(declare-fun mapRest!48007 () (Array (_ BitVec 32) ValueCell!14669))

(declare-fun mapKey!48007 () (_ BitVec 32))

(assert (=> mapNonEmpty!48007 (= (arr!37744 _values!996) (store mapRest!48007 mapKey!48007 mapValue!48007))))

(declare-fun b!1212172 () Bool)

(assert (=> b!1212172 (= c!119609 (and (not lt!550663) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1212172 (= e!688386 e!688394)))

(declare-fun b!1212173 () Bool)

(declare-fun res!805131 () Bool)

(assert (=> b!1212173 (=> (not res!805131) (not e!688385))))

(assert (=> b!1212173 (= res!805131 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26684))))

(declare-fun b!1212174 () Bool)

(declare-fun Unit!40039 () Unit!40035)

(assert (=> b!1212174 (= e!688384 Unit!40039)))

(declare-fun b!1212175 () Bool)

(assert (=> b!1212175 (= e!688382 (= call!60081 call!60076))))

(declare-fun lt!550660 () array!78216)

(declare-fun b!1212176 () Bool)

(assert (=> b!1212176 (= e!688387 (= lt!550659 (getCurrentListMapNoExtraKeys!5396 lt!550671 lt!550660 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!60077 () Bool)

(assert (=> bm!60077 (= call!60081 (getCurrentListMapNoExtraKeys!5396 lt!550671 lt!550660 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212177 () Bool)

(declare-fun e!688381 () Bool)

(assert (=> b!1212177 (= e!688381 e!688383)))

(declare-fun res!805125 () Bool)

(assert (=> b!1212177 (=> res!805125 e!688383)))

(assert (=> b!1212177 (= res!805125 (not (= (select (arr!37743 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1212177 e!688382))

(declare-fun c!119611 () Bool)

(assert (=> b!1212177 (= c!119611 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550670 () Unit!40035)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1070 (array!78214 array!78216 (_ BitVec 32) (_ BitVec 32) V!46137 V!46137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40035)

(assert (=> b!1212177 (= lt!550670 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1070 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212178 () Bool)

(declare-fun res!805129 () Bool)

(assert (=> b!1212178 (=> (not res!805129) (not e!688385))))

(assert (=> b!1212178 (= res!805129 (= (select (arr!37743 _keys!1208) i!673) k0!934))))

(declare-fun b!1212179 () Bool)

(assert (=> b!1212179 (= e!688388 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550663) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1212180 () Bool)

(assert (=> b!1212180 (= e!688393 tp_is_empty!30757)))

(declare-fun bm!60078 () Bool)

(assert (=> bm!60078 (= call!60076 (getCurrentListMapNoExtraKeys!5396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212181 () Bool)

(assert (=> b!1212181 (= e!688385 e!688395)))

(declare-fun res!805120 () Bool)

(assert (=> b!1212181 (=> (not res!805120) (not e!688395))))

(assert (=> b!1212181 (= res!805120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550671 mask!1564))))

(assert (=> b!1212181 (= lt!550671 (array!78215 (store (arr!37743 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38281 _keys!1208)))))

(declare-fun mapIsEmpty!48007 () Bool)

(assert (=> mapIsEmpty!48007 mapRes!48007))

(declare-fun b!1212182 () Bool)

(assert (=> b!1212182 (contains!6960 call!60074 k0!934)))

(declare-fun lt!550667 () Unit!40035)

(assert (=> b!1212182 (= lt!550667 call!60077)))

(assert (=> b!1212182 call!60075))

(assert (=> b!1212182 (= lt!550672 (+!4074 lt!550664 (tuple2!19909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!550666 () Unit!40035)

(assert (=> b!1212182 (= lt!550666 (addStillContains!1059 lt!550664 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1212182 (= e!688386 lt!550667)))

(declare-fun b!1212183 () Bool)

(declare-fun res!805127 () Bool)

(assert (=> b!1212183 (=> (not res!805127) (not e!688385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212183 (= res!805127 (validKeyInArray!0 k0!934))))

(declare-fun b!1212184 () Bool)

(assert (=> b!1212184 (= e!688396 e!688381)))

(declare-fun res!805119 () Bool)

(assert (=> b!1212184 (=> res!805119 e!688381)))

(assert (=> b!1212184 (= res!805119 (not (= from!1455 i!673)))))

(declare-fun lt!550675 () ListLongMap!17877)

(assert (=> b!1212184 (= lt!550675 (getCurrentListMapNoExtraKeys!5396 lt!550671 lt!550660 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1212184 (= lt!550660 (array!78217 (store (arr!37744 _values!996) i!673 (ValueCellFull!14669 lt!550657)) (size!38282 _values!996)))))

(declare-fun dynLambda!3252 (Int (_ BitVec 64)) V!46137)

(assert (=> b!1212184 (= lt!550657 (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1212184 (= lt!550668 (getCurrentListMapNoExtraKeys!5396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101086 res!805118) b!1212158))

(assert (= (and b!1212158 res!805126) b!1212159))

(assert (= (and b!1212159 res!805122) b!1212166))

(assert (= (and b!1212166 res!805124) b!1212173))

(assert (= (and b!1212173 res!805131) b!1212160))

(assert (= (and b!1212160 res!805123) b!1212183))

(assert (= (and b!1212183 res!805127) b!1212178))

(assert (= (and b!1212178 res!805129) b!1212181))

(assert (= (and b!1212181 res!805120) b!1212171))

(assert (= (and b!1212171 res!805128) b!1212170))

(assert (= (and b!1212170 (not res!805132)) b!1212184))

(assert (= (and b!1212184 (not res!805119)) b!1212177))

(assert (= (and b!1212177 c!119611) b!1212163))

(assert (= (and b!1212177 (not c!119611)) b!1212175))

(assert (= (or b!1212163 b!1212175) bm!60077))

(assert (= (or b!1212163 b!1212175) bm!60078))

(assert (= (and b!1212177 (not res!805125)) b!1212169))

(assert (= (and b!1212169 c!119608) b!1212165))

(assert (= (and b!1212169 (not c!119608)) b!1212157))

(assert (= (and b!1212165 c!119607) b!1212182))

(assert (= (and b!1212165 (not c!119607)) b!1212172))

(assert (= (and b!1212172 c!119609) b!1212155))

(assert (= (and b!1212172 (not c!119609)) b!1212164))

(assert (= (and b!1212164 c!119610) b!1212167))

(assert (= (and b!1212164 (not c!119610)) b!1212174))

(assert (= (or b!1212155 b!1212167) bm!60071))

(assert (= (or b!1212155 b!1212167) bm!60072))

(assert (= (or b!1212155 b!1212167) bm!60073))

(assert (= (or b!1212182 bm!60073) bm!60076))

(assert (= (or b!1212182 bm!60071) bm!60075))

(assert (= (or b!1212182 bm!60072) bm!60074))

(assert (= (and b!1212165 c!119612) b!1212168))

(assert (= (and b!1212165 (not c!119612)) b!1212179))

(assert (= (and b!1212165 res!805130) b!1212161))

(assert (= (and b!1212169 res!805121) b!1212176))

(assert (= (and b!1212162 condMapEmpty!48007) mapIsEmpty!48007))

(assert (= (and b!1212162 (not condMapEmpty!48007)) mapNonEmpty!48007))

(get-info :version)

(assert (= (and mapNonEmpty!48007 ((_ is ValueCellFull!14669) mapValue!48007)) b!1212180))

(assert (= (and b!1212162 ((_ is ValueCellFull!14669) mapDefault!48007)) b!1212156))

(assert (= start!101086 b!1212162))

(declare-fun b_lambda!21665 () Bool)

(assert (=> (not b_lambda!21665) (not b!1212184)))

(declare-fun t!39709 () Bool)

(declare-fun tb!10845 () Bool)

(assert (=> (and start!101086 (= defaultEntry!1004 defaultEntry!1004) t!39709) tb!10845))

(declare-fun result!22293 () Bool)

(assert (=> tb!10845 (= result!22293 tp_is_empty!30757)))

(assert (=> b!1212184 t!39709))

(declare-fun b_and!43181 () Bool)

(assert (= b_and!43179 (and (=> t!39709 result!22293) b_and!43181)))

(declare-fun m!1117015 () Bool)

(assert (=> b!1212182 m!1117015))

(declare-fun m!1117017 () Bool)

(assert (=> b!1212182 m!1117017))

(declare-fun m!1117019 () Bool)

(assert (=> b!1212182 m!1117019))

(declare-fun m!1117021 () Bool)

(assert (=> start!101086 m!1117021))

(declare-fun m!1117023 () Bool)

(assert (=> start!101086 m!1117023))

(declare-fun m!1117025 () Bool)

(assert (=> b!1212171 m!1117025))

(declare-fun m!1117027 () Bool)

(assert (=> bm!60075 m!1117027))

(declare-fun m!1117029 () Bool)

(assert (=> b!1212163 m!1117029))

(declare-fun m!1117031 () Bool)

(assert (=> mapNonEmpty!48007 m!1117031))

(declare-fun m!1117033 () Bool)

(assert (=> b!1212184 m!1117033))

(declare-fun m!1117035 () Bool)

(assert (=> b!1212184 m!1117035))

(declare-fun m!1117037 () Bool)

(assert (=> b!1212184 m!1117037))

(declare-fun m!1117039 () Bool)

(assert (=> b!1212184 m!1117039))

(declare-fun m!1117041 () Bool)

(assert (=> b!1212169 m!1117041))

(declare-fun m!1117043 () Bool)

(assert (=> b!1212169 m!1117043))

(declare-fun m!1117045 () Bool)

(assert (=> b!1212169 m!1117045))

(declare-fun m!1117047 () Bool)

(assert (=> b!1212169 m!1117047))

(declare-fun m!1117049 () Bool)

(assert (=> b!1212169 m!1117049))

(assert (=> b!1212169 m!1117047))

(declare-fun m!1117051 () Bool)

(assert (=> b!1212169 m!1117051))

(declare-fun m!1117053 () Bool)

(assert (=> b!1212169 m!1117053))

(declare-fun m!1117055 () Bool)

(assert (=> b!1212169 m!1117055))

(assert (=> b!1212169 m!1117049))

(assert (=> b!1212169 m!1117053))

(declare-fun m!1117057 () Bool)

(assert (=> b!1212169 m!1117057))

(assert (=> b!1212169 m!1117053))

(declare-fun m!1117059 () Bool)

(assert (=> b!1212170 m!1117059))

(declare-fun m!1117061 () Bool)

(assert (=> b!1212170 m!1117061))

(declare-fun m!1117063 () Bool)

(assert (=> b!1212181 m!1117063))

(declare-fun m!1117065 () Bool)

(assert (=> b!1212181 m!1117065))

(declare-fun m!1117067 () Bool)

(assert (=> b!1212176 m!1117067))

(declare-fun m!1117069 () Bool)

(assert (=> b!1212165 m!1117069))

(declare-fun m!1117071 () Bool)

(assert (=> b!1212165 m!1117071))

(declare-fun m!1117073 () Bool)

(assert (=> b!1212165 m!1117073))

(declare-fun m!1117075 () Bool)

(assert (=> b!1212165 m!1117075))

(declare-fun m!1117077 () Bool)

(assert (=> b!1212161 m!1117077))

(assert (=> b!1212177 m!1117053))

(declare-fun m!1117079 () Bool)

(assert (=> b!1212177 m!1117079))

(declare-fun m!1117081 () Bool)

(assert (=> b!1212158 m!1117081))

(declare-fun m!1117083 () Bool)

(assert (=> b!1212178 m!1117083))

(declare-fun m!1117085 () Bool)

(assert (=> b!1212173 m!1117085))

(assert (=> bm!60078 m!1117043))

(declare-fun m!1117087 () Bool)

(assert (=> b!1212183 m!1117087))

(assert (=> b!1212168 m!1117077))

(assert (=> bm!60077 m!1117067))

(declare-fun m!1117089 () Bool)

(assert (=> b!1212166 m!1117089))

(declare-fun m!1117091 () Bool)

(assert (=> bm!60076 m!1117091))

(declare-fun m!1117093 () Bool)

(assert (=> bm!60074 m!1117093))

(check-sat (not b_next!26053) (not start!101086) (not b!1212168) (not b!1212183) (not b!1212163) tp_is_empty!30757 (not b!1212171) (not b!1212161) (not b!1212170) (not bm!60075) (not b!1212182) (not b!1212166) (not b!1212181) (not b!1212177) (not b!1212184) (not b!1212176) (not bm!60076) b_and!43181 (not b!1212173) (not bm!60078) (not b!1212165) (not b!1212158) (not mapNonEmpty!48007) (not bm!60077) (not b_lambda!21665) (not bm!60074) (not b!1212169))
(check-sat b_and!43181 (not b_next!26053))
