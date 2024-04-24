; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101328 () Bool)

(assert start!101328)

(declare-fun b_free!26053 () Bool)

(declare-fun b_next!26053 () Bool)

(assert (=> start!101328 (= b_free!26053 (not b_next!26053))))

(declare-fun tp!91178 () Bool)

(declare-fun b_and!43207 () Bool)

(assert (=> start!101328 (= tp!91178 b_and!43207)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!689294 () Bool)

(declare-fun b!1213575 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!551347 () Bool)

(assert (=> b!1213575 (= e!689294 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551347) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1213576 () Bool)

(declare-fun res!805697 () Bool)

(declare-fun e!689297 () Bool)

(assert (=> b!1213576 (=> (not res!805697) (not e!689297))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78333 0))(
  ( (array!78334 (arr!37796 (Array (_ BitVec 32) (_ BitVec 64))) (size!38333 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78333)

(assert (=> b!1213576 (= res!805697 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38333 _keys!1208))))))

(declare-fun mapIsEmpty!48007 () Bool)

(declare-fun mapRes!48007 () Bool)

(assert (=> mapIsEmpty!48007 mapRes!48007))

(declare-fun b!1213577 () Bool)

(declare-fun e!689302 () Bool)

(declare-fun e!689299 () Bool)

(assert (=> b!1213577 (= e!689302 (and e!689299 mapRes!48007))))

(declare-fun condMapEmpty!48007 () Bool)

(declare-datatypes ((V!46137 0))(
  ( (V!46138 (val!15435 Int)) )
))
(declare-datatypes ((ValueCell!14669 0))(
  ( (ValueCellFull!14669 (v!18083 V!46137)) (EmptyCell!14669) )
))
(declare-datatypes ((array!78335 0))(
  ( (array!78336 (arr!37797 (Array (_ BitVec 32) ValueCell!14669)) (size!38334 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78335)

(declare-fun mapDefault!48007 () ValueCell!14669)

(assert (=> b!1213577 (= condMapEmpty!48007 (= (arr!37797 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14669)) mapDefault!48007)))))

(declare-fun b!1213578 () Bool)

(declare-fun e!689303 () Bool)

(declare-fun e!689307 () Bool)

(assert (=> b!1213578 (= e!689303 (not e!689307))))

(declare-fun res!805700 () Bool)

(assert (=> b!1213578 (=> res!805700 e!689307)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1213578 (= res!805700 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213578 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40157 0))(
  ( (Unit!40158) )
))
(declare-fun lt!551342 () Unit!40157)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78333 (_ BitVec 64) (_ BitVec 32)) Unit!40157)

(assert (=> b!1213578 (= lt!551342 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1213579 () Bool)

(declare-fun res!805706 () Bool)

(assert (=> b!1213579 (=> (not res!805706) (not e!689297))))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1213579 (= res!805706 (and (= (size!38334 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38333 _keys!1208) (size!38334 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!60160 () Bool)

(declare-fun call!60167 () Unit!40157)

(declare-fun call!60170 () Unit!40157)

(assert (=> bm!60160 (= call!60167 call!60170)))

(declare-fun b!1213580 () Bool)

(declare-fun res!805701 () Bool)

(assert (=> b!1213580 (=> (not res!805701) (not e!689297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78333 (_ BitVec 32)) Bool)

(assert (=> b!1213580 (= res!805701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!60165 () Bool)

(declare-fun c!120034 () Bool)

(declare-datatypes ((tuple2!19844 0))(
  ( (tuple2!19845 (_1!9933 (_ BitVec 64)) (_2!9933 V!46137)) )
))
(declare-datatypes ((List!26647 0))(
  ( (Nil!26644) (Cons!26643 (h!27861 tuple2!19844) (t!39672 List!26647)) )
))
(declare-datatypes ((ListLongMap!17821 0))(
  ( (ListLongMap!17822 (toList!8926 List!26647)) )
))
(declare-fun call!60163 () ListLongMap!17821)

(declare-fun bm!60161 () Bool)

(declare-fun lt!551331 () ListLongMap!17821)

(declare-fun contains!7020 (ListLongMap!17821 (_ BitVec 64)) Bool)

(assert (=> bm!60161 (= call!60165 (contains!7020 (ite c!120034 lt!551331 call!60163) k0!934))))

(declare-fun b!1213582 () Bool)

(declare-fun e!689306 () Unit!40157)

(declare-fun Unit!40159 () Unit!40157)

(assert (=> b!1213582 (= e!689306 Unit!40159)))

(assert (=> b!1213582 (= lt!551347 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1213582 (= c!120034 (and (not lt!551347) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551336 () Unit!40157)

(declare-fun e!689300 () Unit!40157)

(assert (=> b!1213582 (= lt!551336 e!689300)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46137)

(declare-fun lt!551337 () Unit!40157)

(declare-fun zeroValue!944 () V!46137)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!616 (array!78333 array!78335 (_ BitVec 32) (_ BitVec 32) V!46137 V!46137 (_ BitVec 64) (_ BitVec 32) Int) Unit!40157)

(assert (=> b!1213582 (= lt!551337 (lemmaListMapContainsThenArrayContainsFrom!616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!120036 () Bool)

(assert (=> b!1213582 (= c!120036 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805705 () Bool)

(assert (=> b!1213582 (= res!805705 e!689294)))

(declare-fun e!689308 () Bool)

(assert (=> b!1213582 (=> (not res!805705) (not e!689308))))

(assert (=> b!1213582 e!689308))

(declare-fun lt!551351 () Unit!40157)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78333 (_ BitVec 32) (_ BitVec 32)) Unit!40157)

(assert (=> b!1213582 (= lt!551351 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26648 0))(
  ( (Nil!26645) (Cons!26644 (h!27862 (_ BitVec 64)) (t!39673 List!26648)) )
))
(declare-fun arrayNoDuplicates!0 (array!78333 (_ BitVec 32) List!26648) Bool)

(assert (=> b!1213582 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26645)))

(declare-fun lt!551335 () Unit!40157)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78333 (_ BitVec 64) (_ BitVec 32) List!26648) Unit!40157)

(assert (=> b!1213582 (= lt!551335 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26645))))

(assert (=> b!1213582 false))

(declare-fun call!60166 () ListLongMap!17821)

(declare-fun call!60164 () ListLongMap!17821)

(declare-fun b!1213583 () Bool)

(declare-fun e!689310 () Bool)

(declare-fun -!1853 (ListLongMap!17821 (_ BitVec 64)) ListLongMap!17821)

(assert (=> b!1213583 (= e!689310 (= call!60164 (-!1853 call!60166 k0!934)))))

(declare-fun b!1213584 () Bool)

(declare-fun Unit!40160 () Unit!40157)

(assert (=> b!1213584 (= e!689306 Unit!40160)))

(declare-fun bm!60162 () Bool)

(declare-fun lt!551346 () array!78333)

(declare-fun lt!551340 () array!78335)

(declare-fun getCurrentListMapNoExtraKeys!5385 (array!78333 array!78335 (_ BitVec 32) (_ BitVec 32) V!46137 V!46137 (_ BitVec 32) Int) ListLongMap!17821)

(assert (=> bm!60162 (= call!60164 (getCurrentListMapNoExtraKeys!5385 lt!551346 lt!551340 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213585 () Bool)

(declare-fun res!805693 () Bool)

(assert (=> b!1213585 (=> (not res!805693) (not e!689297))))

(assert (=> b!1213585 (= res!805693 (= (select (arr!37796 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48007 () Bool)

(declare-fun tp!91177 () Bool)

(declare-fun e!689298 () Bool)

(assert (=> mapNonEmpty!48007 (= mapRes!48007 (and tp!91177 e!689298))))

(declare-fun mapRest!48007 () (Array (_ BitVec 32) ValueCell!14669))

(declare-fun mapKey!48007 () (_ BitVec 32))

(declare-fun mapValue!48007 () ValueCell!14669)

(assert (=> mapNonEmpty!48007 (= (arr!37797 _values!996) (store mapRest!48007 mapKey!48007 mapValue!48007))))

(declare-fun bm!60163 () Bool)

(declare-fun call!60168 () ListLongMap!17821)

(assert (=> bm!60163 (= call!60163 call!60168)))

(declare-fun b!1213586 () Bool)

(declare-fun e!689295 () Bool)

(declare-fun e!689309 () Bool)

(assert (=> b!1213586 (= e!689295 e!689309)))

(declare-fun res!805695 () Bool)

(assert (=> b!1213586 (=> res!805695 e!689309)))

(assert (=> b!1213586 (= res!805695 (not (= (select (arr!37796 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1213586 e!689310))

(declare-fun c!120035 () Bool)

(assert (=> b!1213586 (= c!120035 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551332 () Unit!40157)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1068 (array!78333 array!78335 (_ BitVec 32) (_ BitVec 32) V!46137 V!46137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40157)

(assert (=> b!1213586 (= lt!551332 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1068 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213587 () Bool)

(declare-fun res!805698 () Bool)

(assert (=> b!1213587 (=> (not res!805698) (not e!689297))))

(assert (=> b!1213587 (= res!805698 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26645))))

(declare-fun b!1213588 () Bool)

(assert (=> b!1213588 (= e!689310 (= call!60164 call!60166))))

(declare-fun b!1213589 () Bool)

(assert (=> b!1213589 (= e!689297 e!689303)))

(declare-fun res!805702 () Bool)

(assert (=> b!1213589 (=> (not res!805702) (not e!689303))))

(assert (=> b!1213589 (= res!805702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551346 mask!1564))))

(assert (=> b!1213589 (= lt!551346 (array!78334 (store (arr!37796 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38333 _keys!1208)))))

(declare-fun b!1213590 () Bool)

(declare-fun res!805696 () Bool)

(assert (=> b!1213590 (=> (not res!805696) (not e!689297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213590 (= res!805696 (validKeyInArray!0 k0!934))))

(declare-fun b!1213591 () Bool)

(declare-fun e!689305 () Unit!40157)

(declare-fun lt!551334 () Unit!40157)

(assert (=> b!1213591 (= e!689305 lt!551334)))

(assert (=> b!1213591 (= lt!551334 call!60167)))

(declare-fun call!60169 () Bool)

(assert (=> b!1213591 call!60169))

(declare-fun b!1213592 () Bool)

(assert (=> b!1213592 (= e!689308 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213593 () Bool)

(assert (=> b!1213593 (= e!689309 (bvslt i!673 (size!38334 _values!996)))))

(declare-fun e!689296 () Bool)

(assert (=> b!1213593 e!689296))

(declare-fun res!805707 () Bool)

(assert (=> b!1213593 (=> (not res!805707) (not e!689296))))

(declare-fun lt!551350 () ListLongMap!17821)

(declare-fun lt!551345 () ListLongMap!17821)

(assert (=> b!1213593 (= res!805707 (= lt!551350 lt!551345))))

(declare-fun lt!551338 () ListLongMap!17821)

(assert (=> b!1213593 (= lt!551350 (-!1853 lt!551338 k0!934))))

(declare-fun lt!551343 () V!46137)

(declare-fun +!4084 (ListLongMap!17821 tuple2!19844) ListLongMap!17821)

(assert (=> b!1213593 (= (-!1853 (+!4084 lt!551345 (tuple2!19845 (select (arr!37796 _keys!1208) from!1455) lt!551343)) (select (arr!37796 _keys!1208) from!1455)) lt!551345)))

(declare-fun lt!551339 () Unit!40157)

(declare-fun addThenRemoveForNewKeyIsSame!280 (ListLongMap!17821 (_ BitVec 64) V!46137) Unit!40157)

(assert (=> b!1213593 (= lt!551339 (addThenRemoveForNewKeyIsSame!280 lt!551345 (select (arr!37796 _keys!1208) from!1455) lt!551343))))

(declare-fun lt!551348 () V!46137)

(declare-fun get!19309 (ValueCell!14669 V!46137) V!46137)

(assert (=> b!1213593 (= lt!551343 (get!19309 (select (arr!37797 _values!996) from!1455) lt!551348))))

(declare-fun lt!551349 () Unit!40157)

(assert (=> b!1213593 (= lt!551349 e!689306)))

(declare-fun c!120039 () Bool)

(assert (=> b!1213593 (= c!120039 (contains!7020 lt!551345 k0!934))))

(assert (=> b!1213593 (= lt!551345 (getCurrentListMapNoExtraKeys!5385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213594 () Bool)

(declare-fun e!689301 () Unit!40157)

(declare-fun Unit!40161 () Unit!40157)

(assert (=> b!1213594 (= e!689301 Unit!40161)))

(declare-fun b!1213595 () Bool)

(assert (=> b!1213595 (= e!689307 e!689295)))

(declare-fun res!805704 () Bool)

(assert (=> b!1213595 (=> res!805704 e!689295)))

(assert (=> b!1213595 (= res!805704 (not (= from!1455 i!673)))))

(declare-fun lt!551344 () ListLongMap!17821)

(assert (=> b!1213595 (= lt!551344 (getCurrentListMapNoExtraKeys!5385 lt!551346 lt!551340 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1213595 (= lt!551340 (array!78336 (store (arr!37797 _values!996) i!673 (ValueCellFull!14669 lt!551348)) (size!38334 _values!996)))))

(declare-fun dynLambda!3299 (Int (_ BitVec 64)) V!46137)

(assert (=> b!1213595 (= lt!551348 (dynLambda!3299 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1213595 (= lt!551338 (getCurrentListMapNoExtraKeys!5385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!60164 () Bool)

(declare-fun c!120038 () Bool)

(assert (=> bm!60164 (= call!60168 (+!4084 lt!551345 (ite (or c!120034 c!120038) (tuple2!19845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19845 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1213596 () Bool)

(declare-fun tp_is_empty!30757 () Bool)

(assert (=> b!1213596 (= e!689298 tp_is_empty!30757)))

(declare-fun b!1213597 () Bool)

(assert (=> b!1213597 (contains!7020 (+!4084 lt!551331 (tuple2!19845 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!551333 () Unit!40157)

(assert (=> b!1213597 (= lt!551333 call!60170)))

(assert (=> b!1213597 call!60165))

(assert (=> b!1213597 (= lt!551331 call!60168)))

(declare-fun lt!551341 () Unit!40157)

(declare-fun addStillContains!1068 (ListLongMap!17821 (_ BitVec 64) V!46137 (_ BitVec 64)) Unit!40157)

(assert (=> b!1213597 (= lt!551341 (addStillContains!1068 lt!551345 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1213597 (= e!689300 lt!551333)))

(declare-fun b!1213598 () Bool)

(assert (=> b!1213598 (= e!689296 (= lt!551350 (getCurrentListMapNoExtraKeys!5385 lt!551346 lt!551340 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!60165 () Bool)

(assert (=> bm!60165 (= call!60169 call!60165)))

(declare-fun b!1213599 () Bool)

(assert (=> b!1213599 (= e!689305 e!689301)))

(declare-fun c!120037 () Bool)

(assert (=> b!1213599 (= c!120037 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551347))))

(declare-fun b!1213600 () Bool)

(assert (=> b!1213600 call!60169))

(declare-fun lt!551330 () Unit!40157)

(assert (=> b!1213600 (= lt!551330 call!60167)))

(assert (=> b!1213600 (= e!689301 lt!551330)))

(declare-fun b!1213581 () Bool)

(declare-fun res!805699 () Bool)

(assert (=> b!1213581 (=> (not res!805699) (not e!689297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213581 (= res!805699 (validMask!0 mask!1564))))

(declare-fun res!805694 () Bool)

(assert (=> start!101328 (=> (not res!805694) (not e!689297))))

(assert (=> start!101328 (= res!805694 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38333 _keys!1208))))))

(assert (=> start!101328 e!689297))

(assert (=> start!101328 tp_is_empty!30757))

(declare-fun array_inv!28848 (array!78333) Bool)

(assert (=> start!101328 (array_inv!28848 _keys!1208)))

(assert (=> start!101328 true))

(assert (=> start!101328 tp!91178))

(declare-fun array_inv!28849 (array!78335) Bool)

(assert (=> start!101328 (and (array_inv!28849 _values!996) e!689302)))

(declare-fun bm!60166 () Bool)

(assert (=> bm!60166 (= call!60170 (addStillContains!1068 (ite c!120034 lt!551331 lt!551345) (ite c!120034 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!120038 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!120034 minValue!944 (ite c!120038 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1213601 () Bool)

(assert (=> b!1213601 (= e!689294 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213602 () Bool)

(assert (=> b!1213602 (= e!689299 tp_is_empty!30757)))

(declare-fun b!1213603 () Bool)

(declare-fun res!805703 () Bool)

(assert (=> b!1213603 (=> (not res!805703) (not e!689303))))

(assert (=> b!1213603 (= res!805703 (arrayNoDuplicates!0 lt!551346 #b00000000000000000000000000000000 Nil!26645))))

(declare-fun bm!60167 () Bool)

(assert (=> bm!60167 (= call!60166 (getCurrentListMapNoExtraKeys!5385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213604 () Bool)

(assert (=> b!1213604 (= c!120038 (and (not lt!551347) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1213604 (= e!689300 e!689305)))

(assert (= (and start!101328 res!805694) b!1213581))

(assert (= (and b!1213581 res!805699) b!1213579))

(assert (= (and b!1213579 res!805706) b!1213580))

(assert (= (and b!1213580 res!805701) b!1213587))

(assert (= (and b!1213587 res!805698) b!1213576))

(assert (= (and b!1213576 res!805697) b!1213590))

(assert (= (and b!1213590 res!805696) b!1213585))

(assert (= (and b!1213585 res!805693) b!1213589))

(assert (= (and b!1213589 res!805702) b!1213603))

(assert (= (and b!1213603 res!805703) b!1213578))

(assert (= (and b!1213578 (not res!805700)) b!1213595))

(assert (= (and b!1213595 (not res!805704)) b!1213586))

(assert (= (and b!1213586 c!120035) b!1213583))

(assert (= (and b!1213586 (not c!120035)) b!1213588))

(assert (= (or b!1213583 b!1213588) bm!60162))

(assert (= (or b!1213583 b!1213588) bm!60167))

(assert (= (and b!1213586 (not res!805695)) b!1213593))

(assert (= (and b!1213593 c!120039) b!1213582))

(assert (= (and b!1213593 (not c!120039)) b!1213584))

(assert (= (and b!1213582 c!120034) b!1213597))

(assert (= (and b!1213582 (not c!120034)) b!1213604))

(assert (= (and b!1213604 c!120038) b!1213591))

(assert (= (and b!1213604 (not c!120038)) b!1213599))

(assert (= (and b!1213599 c!120037) b!1213600))

(assert (= (and b!1213599 (not c!120037)) b!1213594))

(assert (= (or b!1213591 b!1213600) bm!60160))

(assert (= (or b!1213591 b!1213600) bm!60163))

(assert (= (or b!1213591 b!1213600) bm!60165))

(assert (= (or b!1213597 bm!60165) bm!60161))

(assert (= (or b!1213597 bm!60160) bm!60166))

(assert (= (or b!1213597 bm!60163) bm!60164))

(assert (= (and b!1213582 c!120036) b!1213601))

(assert (= (and b!1213582 (not c!120036)) b!1213575))

(assert (= (and b!1213582 res!805705) b!1213592))

(assert (= (and b!1213593 res!805707) b!1213598))

(assert (= (and b!1213577 condMapEmpty!48007) mapIsEmpty!48007))

(assert (= (and b!1213577 (not condMapEmpty!48007)) mapNonEmpty!48007))

(get-info :version)

(assert (= (and mapNonEmpty!48007 ((_ is ValueCellFull!14669) mapValue!48007)) b!1213596))

(assert (= (and b!1213577 ((_ is ValueCellFull!14669) mapDefault!48007)) b!1213602))

(assert (= start!101328 b!1213577))

(declare-fun b_lambda!21685 () Bool)

(assert (=> (not b_lambda!21685) (not b!1213595)))

(declare-fun t!39671 () Bool)

(declare-fun tb!10845 () Bool)

(assert (=> (and start!101328 (= defaultEntry!1004 defaultEntry!1004) t!39671) tb!10845))

(declare-fun result!22293 () Bool)

(assert (=> tb!10845 (= result!22293 tp_is_empty!30757)))

(assert (=> b!1213595 t!39671))

(declare-fun b_and!43209 () Bool)

(assert (= b_and!43207 (and (=> t!39671 result!22293) b_and!43209)))

(declare-fun m!1119219 () Bool)

(assert (=> b!1213578 m!1119219))

(declare-fun m!1119221 () Bool)

(assert (=> b!1213578 m!1119221))

(declare-fun m!1119223 () Bool)

(assert (=> bm!60166 m!1119223))

(declare-fun m!1119225 () Bool)

(assert (=> bm!60167 m!1119225))

(declare-fun m!1119227 () Bool)

(assert (=> mapNonEmpty!48007 m!1119227))

(declare-fun m!1119229 () Bool)

(assert (=> start!101328 m!1119229))

(declare-fun m!1119231 () Bool)

(assert (=> start!101328 m!1119231))

(declare-fun m!1119233 () Bool)

(assert (=> b!1213582 m!1119233))

(declare-fun m!1119235 () Bool)

(assert (=> b!1213582 m!1119235))

(declare-fun m!1119237 () Bool)

(assert (=> b!1213582 m!1119237))

(declare-fun m!1119239 () Bool)

(assert (=> b!1213582 m!1119239))

(declare-fun m!1119241 () Bool)

(assert (=> bm!60162 m!1119241))

(declare-fun m!1119243 () Bool)

(assert (=> bm!60164 m!1119243))

(declare-fun m!1119245 () Bool)

(assert (=> b!1213589 m!1119245))

(declare-fun m!1119247 () Bool)

(assert (=> b!1213589 m!1119247))

(declare-fun m!1119249 () Bool)

(assert (=> b!1213590 m!1119249))

(declare-fun m!1119251 () Bool)

(assert (=> b!1213585 m!1119251))

(declare-fun m!1119253 () Bool)

(assert (=> b!1213587 m!1119253))

(assert (=> b!1213593 m!1119225))

(declare-fun m!1119255 () Bool)

(assert (=> b!1213593 m!1119255))

(declare-fun m!1119257 () Bool)

(assert (=> b!1213593 m!1119257))

(declare-fun m!1119259 () Bool)

(assert (=> b!1213593 m!1119259))

(declare-fun m!1119261 () Bool)

(assert (=> b!1213593 m!1119261))

(assert (=> b!1213593 m!1119257))

(declare-fun m!1119263 () Bool)

(assert (=> b!1213593 m!1119263))

(assert (=> b!1213593 m!1119255))

(declare-fun m!1119265 () Bool)

(assert (=> b!1213593 m!1119265))

(declare-fun m!1119267 () Bool)

(assert (=> b!1213593 m!1119267))

(assert (=> b!1213593 m!1119265))

(assert (=> b!1213593 m!1119265))

(declare-fun m!1119269 () Bool)

(assert (=> b!1213593 m!1119269))

(assert (=> b!1213586 m!1119265))

(declare-fun m!1119271 () Bool)

(assert (=> b!1213586 m!1119271))

(declare-fun m!1119273 () Bool)

(assert (=> b!1213595 m!1119273))

(declare-fun m!1119275 () Bool)

(assert (=> b!1213595 m!1119275))

(declare-fun m!1119277 () Bool)

(assert (=> b!1213595 m!1119277))

(declare-fun m!1119279 () Bool)

(assert (=> b!1213595 m!1119279))

(declare-fun m!1119281 () Bool)

(assert (=> b!1213592 m!1119281))

(declare-fun m!1119283 () Bool)

(assert (=> bm!60161 m!1119283))

(declare-fun m!1119285 () Bool)

(assert (=> b!1213597 m!1119285))

(assert (=> b!1213597 m!1119285))

(declare-fun m!1119287 () Bool)

(assert (=> b!1213597 m!1119287))

(declare-fun m!1119289 () Bool)

(assert (=> b!1213597 m!1119289))

(declare-fun m!1119291 () Bool)

(assert (=> b!1213583 m!1119291))

(declare-fun m!1119293 () Bool)

(assert (=> b!1213581 m!1119293))

(declare-fun m!1119295 () Bool)

(assert (=> b!1213580 m!1119295))

(declare-fun m!1119297 () Bool)

(assert (=> b!1213603 m!1119297))

(assert (=> b!1213601 m!1119281))

(assert (=> b!1213598 m!1119241))

(check-sat (not bm!60162) (not start!101328) (not b!1213601) (not b!1213578) (not b!1213589) b_and!43209 (not b_lambda!21685) (not b!1213603) (not b!1213592) (not b!1213590) (not mapNonEmpty!48007) (not b_next!26053) (not b!1213583) (not bm!60166) (not b!1213581) (not b!1213598) (not b!1213593) (not b!1213595) (not b!1213587) (not bm!60164) (not b!1213580) (not b!1213597) tp_is_empty!30757 (not bm!60161) (not bm!60167) (not b!1213582) (not b!1213586))
(check-sat b_and!43209 (not b_next!26053))
