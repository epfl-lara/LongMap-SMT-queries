; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101144 () Bool)

(assert start!101144)

(declare-fun b_free!26067 () Bool)

(declare-fun b_next!26067 () Bool)

(assert (=> start!101144 (= b_free!26067 (not b_next!26067))))

(declare-fun tp!91222 () Bool)

(declare-fun b_and!43251 () Bool)

(assert (=> start!101144 (= tp!91222 b_and!43251)))

(declare-fun b!1213108 () Bool)

(declare-fun e!688943 () Bool)

(declare-fun e!688951 () Bool)

(assert (=> b!1213108 (= e!688943 (not e!688951))))

(declare-fun res!805579 () Bool)

(assert (=> b!1213108 (=> res!805579 e!688951)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213108 (= res!805579 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78329 0))(
  ( (array!78330 (arr!37799 (Array (_ BitVec 32) (_ BitVec 64))) (size!38335 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78329)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213108 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40231 0))(
  ( (Unit!40232) )
))
(declare-fun lt!551434 () Unit!40231)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78329 (_ BitVec 64) (_ BitVec 32)) Unit!40231)

(assert (=> b!1213108 (= lt!551434 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-datatypes ((V!46155 0))(
  ( (V!46156 (val!15442 Int)) )
))
(declare-fun zeroValue!944 () V!46155)

(declare-datatypes ((tuple2!19846 0))(
  ( (tuple2!19847 (_1!9934 (_ BitVec 64)) (_2!9934 V!46155)) )
))
(declare-datatypes ((List!26646 0))(
  ( (Nil!26643) (Cons!26642 (h!27851 tuple2!19846) (t!39693 List!26646)) )
))
(declare-datatypes ((ListLongMap!17815 0))(
  ( (ListLongMap!17816 (toList!8923 List!26646)) )
))
(declare-fun call!60288 () ListLongMap!17815)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!551443 () array!78329)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!60284 () Bool)

(declare-fun minValue!944 () V!46155)

(declare-datatypes ((ValueCell!14676 0))(
  ( (ValueCellFull!14676 (v!18095 V!46155)) (EmptyCell!14676) )
))
(declare-datatypes ((array!78331 0))(
  ( (array!78332 (arr!37800 (Array (_ BitVec 32) ValueCell!14676)) (size!38336 (_ BitVec 32))) )
))
(declare-fun lt!551452 () array!78331)

(declare-fun getCurrentListMapNoExtraKeys!5354 (array!78329 array!78331 (_ BitVec 32) (_ BitVec 32) V!46155 V!46155 (_ BitVec 32) Int) ListLongMap!17815)

(assert (=> bm!60284 (= call!60288 (getCurrentListMapNoExtraKeys!5354 lt!551443 lt!551452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213109 () Bool)

(declare-fun res!805581 () Bool)

(assert (=> b!1213109 (=> (not res!805581) (not e!688943))))

(declare-datatypes ((List!26647 0))(
  ( (Nil!26644) (Cons!26643 (h!27852 (_ BitVec 64)) (t!39694 List!26647)) )
))
(declare-fun arrayNoDuplicates!0 (array!78329 (_ BitVec 32) List!26647) Bool)

(assert (=> b!1213109 (= res!805581 (arrayNoDuplicates!0 lt!551443 #b00000000000000000000000000000000 Nil!26644))))

(declare-fun b!1213110 () Bool)

(declare-fun call!60287 () ListLongMap!17815)

(declare-fun contains!6995 (ListLongMap!17815 (_ BitVec 64)) Bool)

(assert (=> b!1213110 (contains!6995 call!60287 k0!934)))

(declare-fun lt!551435 () ListLongMap!17815)

(declare-fun lt!551436 () Unit!40231)

(declare-fun addStillContains!1066 (ListLongMap!17815 (_ BitVec 64) V!46155 (_ BitVec 64)) Unit!40231)

(assert (=> b!1213110 (= lt!551436 (addStillContains!1066 lt!551435 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!60291 () Bool)

(assert (=> b!1213110 call!60291))

(declare-fun lt!551450 () ListLongMap!17815)

(declare-fun +!4038 (ListLongMap!17815 tuple2!19846) ListLongMap!17815)

(assert (=> b!1213110 (= lt!551435 (+!4038 lt!551450 (tuple2!19847 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551446 () Unit!40231)

(declare-fun call!60292 () Unit!40231)

(assert (=> b!1213110 (= lt!551446 call!60292)))

(declare-fun e!688945 () Unit!40231)

(assert (=> b!1213110 (= e!688945 lt!551436)))

(declare-fun call!60290 () ListLongMap!17815)

(declare-fun _values!996 () array!78331)

(declare-fun bm!60285 () Bool)

(assert (=> bm!60285 (= call!60290 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213111 () Bool)

(declare-fun e!688939 () Unit!40231)

(declare-fun Unit!40233 () Unit!40231)

(assert (=> b!1213111 (= e!688939 Unit!40233)))

(declare-fun c!119814 () Bool)

(declare-fun bm!60286 () Bool)

(declare-fun c!119812 () Bool)

(assert (=> bm!60286 (= call!60292 (addStillContains!1066 lt!551450 (ite (or c!119814 c!119812) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119814 c!119812) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!60287 () Bool)

(declare-fun call!60289 () ListLongMap!17815)

(assert (=> bm!60287 (= call!60289 call!60287)))

(declare-fun b!1213112 () Bool)

(declare-fun res!805584 () Bool)

(declare-fun e!688937 () Bool)

(assert (=> b!1213112 (=> (not res!805584) (not e!688937))))

(assert (=> b!1213112 (= res!805584 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38335 _keys!1208))))))

(declare-fun b!1213113 () Bool)

(declare-fun res!805575 () Bool)

(assert (=> b!1213113 (=> (not res!805575) (not e!688937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78329 (_ BitVec 32)) Bool)

(assert (=> b!1213113 (= res!805575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1213114 () Bool)

(declare-fun e!688942 () Unit!40231)

(assert (=> b!1213114 (= e!688942 e!688939)))

(declare-fun c!119809 () Bool)

(declare-fun lt!551437 () Bool)

(assert (=> b!1213114 (= c!119809 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551437))))

(declare-fun bm!60288 () Bool)

(assert (=> bm!60288 (= call!60287 (+!4038 (ite c!119814 lt!551435 lt!551450) (ite c!119814 (tuple2!19847 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119812 (tuple2!19847 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19847 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1213115 () Bool)

(declare-fun res!805577 () Bool)

(assert (=> b!1213115 (=> (not res!805577) (not e!688937))))

(assert (=> b!1213115 (= res!805577 (= (select (arr!37799 _keys!1208) i!673) k0!934))))

(declare-fun b!1213116 () Bool)

(declare-fun lt!551438 () ListLongMap!17815)

(declare-fun e!688936 () Bool)

(assert (=> b!1213116 (= e!688936 (= lt!551438 (getCurrentListMapNoExtraKeys!5354 lt!551443 lt!551452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1213117 () Bool)

(declare-fun res!805578 () Bool)

(assert (=> b!1213117 (=> (not res!805578) (not e!688937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213117 (= res!805578 (validMask!0 mask!1564))))

(declare-fun b!1213118 () Bool)

(declare-fun e!688940 () Bool)

(declare-fun -!1869 (ListLongMap!17815 (_ BitVec 64)) ListLongMap!17815)

(assert (=> b!1213118 (= e!688940 (= call!60288 (-!1869 call!60290 k0!934)))))

(declare-fun b!1213119 () Bool)

(assert (=> b!1213119 (= c!119812 (and (not lt!551437) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1213119 (= e!688945 e!688942)))

(declare-fun b!1213120 () Bool)

(declare-fun call!60294 () Bool)

(assert (=> b!1213120 call!60294))

(declare-fun lt!551444 () Unit!40231)

(declare-fun call!60293 () Unit!40231)

(assert (=> b!1213120 (= lt!551444 call!60293)))

(assert (=> b!1213120 (= e!688939 lt!551444)))

(declare-fun e!688947 () Bool)

(declare-fun b!1213121 () Bool)

(assert (=> b!1213121 (= e!688947 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551437) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!805576 () Bool)

(assert (=> start!101144 (=> (not res!805576) (not e!688937))))

(assert (=> start!101144 (= res!805576 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38335 _keys!1208))))))

(assert (=> start!101144 e!688937))

(declare-fun tp_is_empty!30771 () Bool)

(assert (=> start!101144 tp_is_empty!30771))

(declare-fun array_inv!28792 (array!78329) Bool)

(assert (=> start!101144 (array_inv!28792 _keys!1208)))

(assert (=> start!101144 true))

(assert (=> start!101144 tp!91222))

(declare-fun e!688950 () Bool)

(declare-fun array_inv!28793 (array!78331) Bool)

(assert (=> start!101144 (and (array_inv!28793 _values!996) e!688950)))

(declare-fun bm!60289 () Bool)

(assert (=> bm!60289 (= call!60294 call!60291)))

(declare-fun b!1213122 () Bool)

(declare-fun e!688944 () Bool)

(assert (=> b!1213122 (= e!688944 tp_is_empty!30771)))

(declare-fun b!1213123 () Bool)

(assert (=> b!1213123 (= e!688947 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213124 () Bool)

(assert (=> b!1213124 (= e!688937 e!688943)))

(declare-fun res!805582 () Bool)

(assert (=> b!1213124 (=> (not res!805582) (not e!688943))))

(assert (=> b!1213124 (= res!805582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551443 mask!1564))))

(assert (=> b!1213124 (= lt!551443 (array!78330 (store (arr!37799 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38335 _keys!1208)))))

(declare-fun mapNonEmpty!48031 () Bool)

(declare-fun mapRes!48031 () Bool)

(declare-fun tp!91223 () Bool)

(declare-fun e!688938 () Bool)

(assert (=> mapNonEmpty!48031 (= mapRes!48031 (and tp!91223 e!688938))))

(declare-fun mapRest!48031 () (Array (_ BitVec 32) ValueCell!14676))

(declare-fun mapKey!48031 () (_ BitVec 32))

(declare-fun mapValue!48031 () ValueCell!14676)

(assert (=> mapNonEmpty!48031 (= (arr!37800 _values!996) (store mapRest!48031 mapKey!48031 mapValue!48031))))

(declare-fun b!1213125 () Bool)

(assert (=> b!1213125 (= e!688938 tp_is_empty!30771)))

(declare-fun bm!60290 () Bool)

(assert (=> bm!60290 (= call!60291 (contains!6995 (ite c!119814 lt!551435 call!60289) k0!934))))

(declare-fun b!1213126 () Bool)

(declare-fun e!688935 () Bool)

(assert (=> b!1213126 (= e!688951 e!688935)))

(declare-fun res!805583 () Bool)

(assert (=> b!1213126 (=> res!805583 e!688935)))

(assert (=> b!1213126 (= res!805583 (not (= from!1455 i!673)))))

(declare-fun lt!551451 () ListLongMap!17815)

(assert (=> b!1213126 (= lt!551451 (getCurrentListMapNoExtraKeys!5354 lt!551443 lt!551452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!551441 () V!46155)

(assert (=> b!1213126 (= lt!551452 (array!78332 (store (arr!37800 _values!996) i!673 (ValueCellFull!14676 lt!551441)) (size!38336 _values!996)))))

(declare-fun dynLambda!3245 (Int (_ BitVec 64)) V!46155)

(assert (=> b!1213126 (= lt!551441 (dynLambda!3245 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!551442 () ListLongMap!17815)

(assert (=> b!1213126 (= lt!551442 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!60291 () Bool)

(assert (=> bm!60291 (= call!60293 call!60292)))

(declare-fun b!1213127 () Bool)

(assert (=> b!1213127 (= e!688940 (= call!60288 call!60290))))

(declare-fun b!1213128 () Bool)

(declare-fun e!688946 () Unit!40231)

(declare-fun Unit!40234 () Unit!40231)

(assert (=> b!1213128 (= e!688946 Unit!40234)))

(assert (=> b!1213128 (= lt!551437 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1213128 (= c!119814 (and (not lt!551437) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551439 () Unit!40231)

(assert (=> b!1213128 (= lt!551439 e!688945)))

(declare-fun lt!551445 () Unit!40231)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!616 (array!78329 array!78331 (_ BitVec 32) (_ BitVec 32) V!46155 V!46155 (_ BitVec 64) (_ BitVec 32) Int) Unit!40231)

(assert (=> b!1213128 (= lt!551445 (lemmaListMapContainsThenArrayContainsFrom!616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119810 () Bool)

(assert (=> b!1213128 (= c!119810 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805589 () Bool)

(assert (=> b!1213128 (= res!805589 e!688947)))

(declare-fun e!688948 () Bool)

(assert (=> b!1213128 (=> (not res!805589) (not e!688948))))

(assert (=> b!1213128 e!688948))

(declare-fun lt!551453 () Unit!40231)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78329 (_ BitVec 32) (_ BitVec 32)) Unit!40231)

(assert (=> b!1213128 (= lt!551453 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1213128 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26644)))

(declare-fun lt!551433 () Unit!40231)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78329 (_ BitVec 64) (_ BitVec 32) List!26647) Unit!40231)

(assert (=> b!1213128 (= lt!551433 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26644))))

(assert (=> b!1213128 false))

(declare-fun b!1213129 () Bool)

(assert (=> b!1213129 (= e!688950 (and e!688944 mapRes!48031))))

(declare-fun condMapEmpty!48031 () Bool)

(declare-fun mapDefault!48031 () ValueCell!14676)

(assert (=> b!1213129 (= condMapEmpty!48031 (= (arr!37800 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14676)) mapDefault!48031)))))

(declare-fun b!1213130 () Bool)

(declare-fun res!805585 () Bool)

(assert (=> b!1213130 (=> (not res!805585) (not e!688937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213130 (= res!805585 (validKeyInArray!0 k0!934))))

(declare-fun b!1213131 () Bool)

(declare-fun e!688941 () Bool)

(assert (=> b!1213131 (= e!688941 true)))

(assert (=> b!1213131 e!688936))

(declare-fun res!805587 () Bool)

(assert (=> b!1213131 (=> (not res!805587) (not e!688936))))

(assert (=> b!1213131 (= res!805587 (= lt!551438 lt!551450))))

(assert (=> b!1213131 (= lt!551438 (-!1869 lt!551442 k0!934))))

(declare-fun lt!551448 () V!46155)

(assert (=> b!1213131 (= (-!1869 (+!4038 lt!551450 (tuple2!19847 (select (arr!37799 _keys!1208) from!1455) lt!551448)) (select (arr!37799 _keys!1208) from!1455)) lt!551450)))

(declare-fun lt!551447 () Unit!40231)

(declare-fun addThenRemoveForNewKeyIsSame!284 (ListLongMap!17815 (_ BitVec 64) V!46155) Unit!40231)

(assert (=> b!1213131 (= lt!551447 (addThenRemoveForNewKeyIsSame!284 lt!551450 (select (arr!37799 _keys!1208) from!1455) lt!551448))))

(declare-fun get!19269 (ValueCell!14676 V!46155) V!46155)

(assert (=> b!1213131 (= lt!551448 (get!19269 (select (arr!37800 _values!996) from!1455) lt!551441))))

(declare-fun lt!551454 () Unit!40231)

(assert (=> b!1213131 (= lt!551454 e!688946)))

(declare-fun c!119811 () Bool)

(assert (=> b!1213131 (= c!119811 (contains!6995 lt!551450 k0!934))))

(assert (=> b!1213131 (= lt!551450 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213132 () Bool)

(declare-fun lt!551440 () Unit!40231)

(assert (=> b!1213132 (= e!688942 lt!551440)))

(assert (=> b!1213132 (= lt!551440 call!60293)))

(assert (=> b!1213132 call!60294))

(declare-fun b!1213133 () Bool)

(assert (=> b!1213133 (= e!688935 e!688941)))

(declare-fun res!805588 () Bool)

(assert (=> b!1213133 (=> res!805588 e!688941)))

(assert (=> b!1213133 (= res!805588 (not (= (select (arr!37799 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1213133 e!688940))

(declare-fun c!119813 () Bool)

(assert (=> b!1213133 (= c!119813 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551449 () Unit!40231)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1079 (array!78329 array!78331 (_ BitVec 32) (_ BitVec 32) V!46155 V!46155 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40231)

(assert (=> b!1213133 (= lt!551449 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1079 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213134 () Bool)

(declare-fun res!805586 () Bool)

(assert (=> b!1213134 (=> (not res!805586) (not e!688937))))

(assert (=> b!1213134 (= res!805586 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26644))))

(declare-fun mapIsEmpty!48031 () Bool)

(assert (=> mapIsEmpty!48031 mapRes!48031))

(declare-fun b!1213135 () Bool)

(declare-fun res!805580 () Bool)

(assert (=> b!1213135 (=> (not res!805580) (not e!688937))))

(assert (=> b!1213135 (= res!805580 (and (= (size!38336 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38335 _keys!1208) (size!38336 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1213136 () Bool)

(declare-fun Unit!40235 () Unit!40231)

(assert (=> b!1213136 (= e!688946 Unit!40235)))

(declare-fun b!1213137 () Bool)

(assert (=> b!1213137 (= e!688948 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!101144 res!805576) b!1213117))

(assert (= (and b!1213117 res!805578) b!1213135))

(assert (= (and b!1213135 res!805580) b!1213113))

(assert (= (and b!1213113 res!805575) b!1213134))

(assert (= (and b!1213134 res!805586) b!1213112))

(assert (= (and b!1213112 res!805584) b!1213130))

(assert (= (and b!1213130 res!805585) b!1213115))

(assert (= (and b!1213115 res!805577) b!1213124))

(assert (= (and b!1213124 res!805582) b!1213109))

(assert (= (and b!1213109 res!805581) b!1213108))

(assert (= (and b!1213108 (not res!805579)) b!1213126))

(assert (= (and b!1213126 (not res!805583)) b!1213133))

(assert (= (and b!1213133 c!119813) b!1213118))

(assert (= (and b!1213133 (not c!119813)) b!1213127))

(assert (= (or b!1213118 b!1213127) bm!60284))

(assert (= (or b!1213118 b!1213127) bm!60285))

(assert (= (and b!1213133 (not res!805588)) b!1213131))

(assert (= (and b!1213131 c!119811) b!1213128))

(assert (= (and b!1213131 (not c!119811)) b!1213136))

(assert (= (and b!1213128 c!119814) b!1213110))

(assert (= (and b!1213128 (not c!119814)) b!1213119))

(assert (= (and b!1213119 c!119812) b!1213132))

(assert (= (and b!1213119 (not c!119812)) b!1213114))

(assert (= (and b!1213114 c!119809) b!1213120))

(assert (= (and b!1213114 (not c!119809)) b!1213111))

(assert (= (or b!1213132 b!1213120) bm!60291))

(assert (= (or b!1213132 b!1213120) bm!60287))

(assert (= (or b!1213132 b!1213120) bm!60289))

(assert (= (or b!1213110 bm!60289) bm!60290))

(assert (= (or b!1213110 bm!60291) bm!60286))

(assert (= (or b!1213110 bm!60287) bm!60288))

(assert (= (and b!1213128 c!119810) b!1213123))

(assert (= (and b!1213128 (not c!119810)) b!1213121))

(assert (= (and b!1213128 res!805589) b!1213137))

(assert (= (and b!1213131 res!805587) b!1213116))

(assert (= (and b!1213129 condMapEmpty!48031) mapIsEmpty!48031))

(assert (= (and b!1213129 (not condMapEmpty!48031)) mapNonEmpty!48031))

(get-info :version)

(assert (= (and mapNonEmpty!48031 ((_ is ValueCellFull!14676) mapValue!48031)) b!1213125))

(assert (= (and b!1213129 ((_ is ValueCellFull!14676) mapDefault!48031)) b!1213122))

(assert (= start!101144 b!1213129))

(declare-fun b_lambda!21743 () Bool)

(assert (=> (not b_lambda!21743) (not b!1213126)))

(declare-fun t!39692 () Bool)

(declare-fun tb!10867 () Bool)

(assert (=> (and start!101144 (= defaultEntry!1004 defaultEntry!1004) t!39692) tb!10867))

(declare-fun result!22331 () Bool)

(assert (=> tb!10867 (= result!22331 tp_is_empty!30771)))

(assert (=> b!1213126 t!39692))

(declare-fun b_and!43253 () Bool)

(assert (= b_and!43251 (and (=> t!39692 result!22331) b_and!43253)))

(declare-fun m!1118459 () Bool)

(assert (=> b!1213123 m!1118459))

(declare-fun m!1118461 () Bool)

(assert (=> b!1213124 m!1118461))

(declare-fun m!1118463 () Bool)

(assert (=> b!1213124 m!1118463))

(declare-fun m!1118465 () Bool)

(assert (=> b!1213131 m!1118465))

(declare-fun m!1118467 () Bool)

(assert (=> b!1213131 m!1118467))

(declare-fun m!1118469 () Bool)

(assert (=> b!1213131 m!1118469))

(declare-fun m!1118471 () Bool)

(assert (=> b!1213131 m!1118471))

(declare-fun m!1118473 () Bool)

(assert (=> b!1213131 m!1118473))

(assert (=> b!1213131 m!1118465))

(assert (=> b!1213131 m!1118473))

(declare-fun m!1118475 () Bool)

(assert (=> b!1213131 m!1118475))

(declare-fun m!1118477 () Bool)

(assert (=> b!1213131 m!1118477))

(assert (=> b!1213131 m!1118467))

(assert (=> b!1213131 m!1118467))

(declare-fun m!1118479 () Bool)

(assert (=> b!1213131 m!1118479))

(declare-fun m!1118481 () Bool)

(assert (=> b!1213131 m!1118481))

(declare-fun m!1118483 () Bool)

(assert (=> b!1213110 m!1118483))

(declare-fun m!1118485 () Bool)

(assert (=> b!1213110 m!1118485))

(declare-fun m!1118487 () Bool)

(assert (=> b!1213110 m!1118487))

(declare-fun m!1118489 () Bool)

(assert (=> b!1213108 m!1118489))

(declare-fun m!1118491 () Bool)

(assert (=> b!1213108 m!1118491))

(declare-fun m!1118493 () Bool)

(assert (=> b!1213116 m!1118493))

(declare-fun m!1118495 () Bool)

(assert (=> b!1213117 m!1118495))

(declare-fun m!1118497 () Bool)

(assert (=> b!1213128 m!1118497))

(declare-fun m!1118499 () Bool)

(assert (=> b!1213128 m!1118499))

(declare-fun m!1118501 () Bool)

(assert (=> b!1213128 m!1118501))

(declare-fun m!1118503 () Bool)

(assert (=> b!1213128 m!1118503))

(declare-fun m!1118505 () Bool)

(assert (=> bm!60288 m!1118505))

(assert (=> bm!60285 m!1118481))

(declare-fun m!1118507 () Bool)

(assert (=> b!1213130 m!1118507))

(declare-fun m!1118509 () Bool)

(assert (=> b!1213134 m!1118509))

(declare-fun m!1118511 () Bool)

(assert (=> bm!60290 m!1118511))

(assert (=> b!1213133 m!1118467))

(declare-fun m!1118513 () Bool)

(assert (=> b!1213133 m!1118513))

(declare-fun m!1118515 () Bool)

(assert (=> mapNonEmpty!48031 m!1118515))

(declare-fun m!1118517 () Bool)

(assert (=> start!101144 m!1118517))

(declare-fun m!1118519 () Bool)

(assert (=> start!101144 m!1118519))

(assert (=> b!1213137 m!1118459))

(declare-fun m!1118521 () Bool)

(assert (=> b!1213115 m!1118521))

(declare-fun m!1118523 () Bool)

(assert (=> bm!60286 m!1118523))

(assert (=> bm!60284 m!1118493))

(declare-fun m!1118525 () Bool)

(assert (=> b!1213126 m!1118525))

(declare-fun m!1118527 () Bool)

(assert (=> b!1213126 m!1118527))

(declare-fun m!1118529 () Bool)

(assert (=> b!1213126 m!1118529))

(declare-fun m!1118531 () Bool)

(assert (=> b!1213126 m!1118531))

(declare-fun m!1118533 () Bool)

(assert (=> b!1213109 m!1118533))

(declare-fun m!1118535 () Bool)

(assert (=> b!1213118 m!1118535))

(declare-fun m!1118537 () Bool)

(assert (=> b!1213113 m!1118537))

(check-sat (not b!1213108) (not mapNonEmpty!48031) (not b!1213128) (not start!101144) (not b!1213133) b_and!43253 (not b!1213110) tp_is_empty!30771 (not bm!60290) (not b!1213113) (not b_lambda!21743) (not b!1213134) (not bm!60285) (not bm!60288) (not b!1213117) (not b!1213109) (not bm!60284) (not b!1213137) (not b!1213123) (not b!1213116) (not b!1213126) (not b!1213131) (not b_next!26067) (not b!1213118) (not b!1213124) (not bm!60286) (not b!1213130))
(check-sat b_and!43253 (not b_next!26067))
