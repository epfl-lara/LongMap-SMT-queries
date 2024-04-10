; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101094 () Bool)

(assert start!101094)

(declare-fun b_free!26055 () Bool)

(declare-fun b_next!26055 () Bool)

(assert (=> start!101094 (= b_free!26055 (not b_next!26055))))

(declare-fun tp!91184 () Bool)

(declare-fun b_and!43209 () Bool)

(assert (=> start!101094 (= tp!91184 b_and!43209)))

(declare-fun b!1212380 () Bool)

(declare-fun e!688526 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((V!46139 0))(
  ( (V!46140 (val!15436 Int)) )
))
(declare-datatypes ((ValueCell!14670 0))(
  ( (ValueCellFull!14670 (v!18088 V!46139)) (EmptyCell!14670) )
))
(declare-datatypes ((array!78305 0))(
  ( (array!78306 (arr!37788 (Array (_ BitVec 32) ValueCell!14670)) (size!38324 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78305)

(assert (=> b!1212380 (= e!688526 (bvslt i!673 (size!38324 _values!996)))))

(declare-fun e!688522 () Bool)

(assert (=> b!1212380 e!688522))

(declare-fun res!805239 () Bool)

(assert (=> b!1212380 (=> (not res!805239) (not e!688522))))

(declare-datatypes ((tuple2!19836 0))(
  ( (tuple2!19837 (_1!9929 (_ BitVec 64)) (_2!9929 V!46139)) )
))
(declare-datatypes ((List!26637 0))(
  ( (Nil!26634) (Cons!26633 (h!27842 tuple2!19836) (t!39672 List!26637)) )
))
(declare-datatypes ((ListLongMap!17805 0))(
  ( (ListLongMap!17806 (toList!8918 List!26637)) )
))
(declare-fun lt!550936 () ListLongMap!17805)

(declare-fun lt!550931 () ListLongMap!17805)

(assert (=> b!1212380 (= res!805239 (= lt!550936 lt!550931))))

(declare-fun lt!550933 () ListLongMap!17805)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1866 (ListLongMap!17805 (_ BitVec 64)) ListLongMap!17805)

(assert (=> b!1212380 (= lt!550936 (-!1866 lt!550933 k0!934))))

(declare-datatypes ((array!78307 0))(
  ( (array!78308 (arr!37789 (Array (_ BitVec 32) (_ BitVec 64))) (size!38325 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78307)

(declare-fun lt!550922 () V!46139)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!4035 (ListLongMap!17805 tuple2!19836) ListLongMap!17805)

(assert (=> b!1212380 (= (-!1866 (+!4035 lt!550931 (tuple2!19837 (select (arr!37789 _keys!1208) from!1455) lt!550922)) (select (arr!37789 _keys!1208) from!1455)) lt!550931)))

(declare-datatypes ((Unit!40210 0))(
  ( (Unit!40211) )
))
(declare-fun lt!550928 () Unit!40210)

(declare-fun addThenRemoveForNewKeyIsSame!282 (ListLongMap!17805 (_ BitVec 64) V!46139) Unit!40210)

(assert (=> b!1212380 (= lt!550928 (addThenRemoveForNewKeyIsSame!282 lt!550931 (select (arr!37789 _keys!1208) from!1455) lt!550922))))

(declare-fun lt!550934 () V!46139)

(declare-fun get!19261 (ValueCell!14670 V!46139) V!46139)

(assert (=> b!1212380 (= lt!550922 (get!19261 (select (arr!37788 _values!996) from!1455) lt!550934))))

(declare-fun lt!550927 () Unit!40210)

(declare-fun e!688518 () Unit!40210)

(assert (=> b!1212380 (= lt!550927 e!688518)))

(declare-fun c!119655 () Bool)

(declare-fun contains!6990 (ListLongMap!17805 (_ BitVec 64)) Bool)

(assert (=> b!1212380 (= c!119655 (contains!6990 lt!550931 k0!934))))

(declare-fun zeroValue!944 () V!46139)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46139)

(declare-fun getCurrentListMapNoExtraKeys!5350 (array!78307 array!78305 (_ BitVec 32) (_ BitVec 32) V!46139 V!46139 (_ BitVec 32) Int) ListLongMap!17805)

(assert (=> b!1212380 (= lt!550931 (getCurrentListMapNoExtraKeys!5350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!48010 () Bool)

(declare-fun mapRes!48010 () Bool)

(declare-fun tp!91183 () Bool)

(declare-fun e!688529 () Bool)

(assert (=> mapNonEmpty!48010 (= mapRes!48010 (and tp!91183 e!688529))))

(declare-fun mapValue!48010 () ValueCell!14670)

(declare-fun mapRest!48010 () (Array (_ BitVec 32) ValueCell!14670))

(declare-fun mapKey!48010 () (_ BitVec 32))

(assert (=> mapNonEmpty!48010 (= (arr!37788 _values!996) (store mapRest!48010 mapKey!48010 mapValue!48010))))

(declare-fun c!119657 () Bool)

(declare-fun call!60127 () Bool)

(declare-fun lt!550916 () ListLongMap!17805)

(declare-fun call!60125 () ListLongMap!17805)

(declare-fun bm!60119 () Bool)

(assert (=> bm!60119 (= call!60127 (contains!6990 (ite c!119657 lt!550916 call!60125) k0!934))))

(declare-fun b!1212381 () Bool)

(declare-fun e!688523 () Bool)

(declare-fun call!60123 () ListLongMap!17805)

(declare-fun call!60124 () ListLongMap!17805)

(assert (=> b!1212381 (= e!688523 (= call!60123 call!60124))))

(declare-fun b!1212382 () Bool)

(declare-fun e!688517 () Bool)

(declare-fun e!688515 () Bool)

(assert (=> b!1212382 (= e!688517 (and e!688515 mapRes!48010))))

(declare-fun condMapEmpty!48010 () Bool)

(declare-fun mapDefault!48010 () ValueCell!14670)

(assert (=> b!1212382 (= condMapEmpty!48010 (= (arr!37788 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14670)) mapDefault!48010)))))

(declare-fun b!1212383 () Bool)

(declare-fun c!119656 () Bool)

(declare-fun lt!550918 () Bool)

(assert (=> b!1212383 (= c!119656 (and (not lt!550918) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!688527 () Unit!40210)

(declare-fun e!688528 () Unit!40210)

(assert (=> b!1212383 (= e!688527 e!688528)))

(declare-fun bm!60120 () Bool)

(declare-fun call!60129 () ListLongMap!17805)

(assert (=> bm!60120 (= call!60125 call!60129)))

(declare-fun b!1212384 () Bool)

(declare-fun e!688524 () Bool)

(assert (=> b!1212384 (= e!688524 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550918) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1212385 () Bool)

(declare-fun Unit!40212 () Unit!40210)

(assert (=> b!1212385 (= e!688518 Unit!40212)))

(declare-fun b!1212386 () Bool)

(declare-fun res!805240 () Bool)

(declare-fun e!688519 () Bool)

(assert (=> b!1212386 (=> (not res!805240) (not e!688519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78307 (_ BitVec 32)) Bool)

(assert (=> b!1212386 (= res!805240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!60121 () Bool)

(assert (=> bm!60121 (= call!60129 (+!4035 (ite c!119657 lt!550916 lt!550931) (ite c!119657 (tuple2!19837 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119656 (tuple2!19837 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19837 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!60128 () Unit!40210)

(declare-fun bm!60122 () Bool)

(declare-fun addStillContains!1062 (ListLongMap!17805 (_ BitVec 64) V!46139 (_ BitVec 64)) Unit!40210)

(assert (=> bm!60122 (= call!60128 (addStillContains!1062 (ite c!119657 lt!550916 lt!550931) (ite c!119657 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119656 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119657 minValue!944 (ite c!119656 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1212387 () Bool)

(declare-fun lt!550920 () Unit!40210)

(assert (=> b!1212387 (= e!688528 lt!550920)))

(declare-fun call!60122 () Unit!40210)

(assert (=> b!1212387 (= lt!550920 call!60122)))

(declare-fun call!60126 () Bool)

(assert (=> b!1212387 call!60126))

(declare-fun lt!550929 () array!78307)

(declare-fun bm!60123 () Bool)

(declare-fun lt!550924 () array!78305)

(assert (=> bm!60123 (= call!60123 (getCurrentListMapNoExtraKeys!5350 lt!550929 lt!550924 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212388 () Bool)

(declare-fun e!688521 () Unit!40210)

(assert (=> b!1212388 (= e!688528 e!688521)))

(declare-fun c!119658 () Bool)

(assert (=> b!1212388 (= c!119658 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550918))))

(declare-fun b!1212389 () Bool)

(assert (=> b!1212389 (= e!688523 (= call!60123 (-!1866 call!60124 k0!934)))))

(declare-fun bm!60124 () Bool)

(assert (=> bm!60124 (= call!60124 (getCurrentListMapNoExtraKeys!5350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212390 () Bool)

(declare-fun tp_is_empty!30759 () Bool)

(assert (=> b!1212390 (= e!688515 tp_is_empty!30759)))

(declare-fun bm!60125 () Bool)

(assert (=> bm!60125 (= call!60122 call!60128)))

(declare-fun b!1212391 () Bool)

(declare-fun e!688525 () Bool)

(declare-fun e!688514 () Bool)

(assert (=> b!1212391 (= e!688525 (not e!688514))))

(declare-fun res!805235 () Bool)

(assert (=> b!1212391 (=> res!805235 e!688514)))

(assert (=> b!1212391 (= res!805235 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212391 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550923 () Unit!40210)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78307 (_ BitVec 64) (_ BitVec 32)) Unit!40210)

(assert (=> b!1212391 (= lt!550923 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1212392 () Bool)

(declare-fun res!805244 () Bool)

(assert (=> b!1212392 (=> (not res!805244) (not e!688525))))

(declare-datatypes ((List!26638 0))(
  ( (Nil!26635) (Cons!26634 (h!27843 (_ BitVec 64)) (t!39673 List!26638)) )
))
(declare-fun arrayNoDuplicates!0 (array!78307 (_ BitVec 32) List!26638) Bool)

(assert (=> b!1212392 (= res!805244 (arrayNoDuplicates!0 lt!550929 #b00000000000000000000000000000000 Nil!26635))))

(declare-fun bm!60126 () Bool)

(assert (=> bm!60126 (= call!60126 call!60127)))

(declare-fun b!1212393 () Bool)

(declare-fun res!805233 () Bool)

(assert (=> b!1212393 (=> (not res!805233) (not e!688519))))

(assert (=> b!1212393 (= res!805233 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38325 _keys!1208))))))

(declare-fun b!1212394 () Bool)

(declare-fun Unit!40213 () Unit!40210)

(assert (=> b!1212394 (= e!688518 Unit!40213)))

(assert (=> b!1212394 (= lt!550918 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1212394 (= c!119657 (and (not lt!550918) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550917 () Unit!40210)

(assert (=> b!1212394 (= lt!550917 e!688527)))

(declare-fun lt!550930 () Unit!40210)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!613 (array!78307 array!78305 (_ BitVec 32) (_ BitVec 32) V!46139 V!46139 (_ BitVec 64) (_ BitVec 32) Int) Unit!40210)

(assert (=> b!1212394 (= lt!550930 (lemmaListMapContainsThenArrayContainsFrom!613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119654 () Bool)

(assert (=> b!1212394 (= c!119654 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805236 () Bool)

(assert (=> b!1212394 (= res!805236 e!688524)))

(declare-fun e!688516 () Bool)

(assert (=> b!1212394 (=> (not res!805236) (not e!688516))))

(assert (=> b!1212394 e!688516))

(declare-fun lt!550932 () Unit!40210)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78307 (_ BitVec 32) (_ BitVec 32)) Unit!40210)

(assert (=> b!1212394 (= lt!550932 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1212394 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26635)))

(declare-fun lt!550925 () Unit!40210)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78307 (_ BitVec 64) (_ BitVec 32) List!26638) Unit!40210)

(assert (=> b!1212394 (= lt!550925 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26635))))

(assert (=> b!1212394 false))

(declare-fun b!1212395 () Bool)

(declare-fun e!688530 () Bool)

(assert (=> b!1212395 (= e!688514 e!688530)))

(declare-fun res!805245 () Bool)

(assert (=> b!1212395 (=> res!805245 e!688530)))

(assert (=> b!1212395 (= res!805245 (not (= from!1455 i!673)))))

(declare-fun lt!550935 () ListLongMap!17805)

(assert (=> b!1212395 (= lt!550935 (getCurrentListMapNoExtraKeys!5350 lt!550929 lt!550924 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1212395 (= lt!550924 (array!78306 (store (arr!37788 _values!996) i!673 (ValueCellFull!14670 lt!550934)) (size!38324 _values!996)))))

(declare-fun dynLambda!3242 (Int (_ BitVec 64)) V!46139)

(assert (=> b!1212395 (= lt!550934 (dynLambda!3242 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1212395 (= lt!550933 (getCurrentListMapNoExtraKeys!5350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1212396 () Bool)

(declare-fun res!805237 () Bool)

(assert (=> b!1212396 (=> (not res!805237) (not e!688519))))

(assert (=> b!1212396 (= res!805237 (and (= (size!38324 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38325 _keys!1208) (size!38324 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1212397 () Bool)

(declare-fun res!805242 () Bool)

(assert (=> b!1212397 (=> (not res!805242) (not e!688519))))

(assert (=> b!1212397 (= res!805242 (= (select (arr!37789 _keys!1208) i!673) k0!934))))

(declare-fun res!805241 () Bool)

(assert (=> start!101094 (=> (not res!805241) (not e!688519))))

(assert (=> start!101094 (= res!805241 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38325 _keys!1208))))))

(assert (=> start!101094 e!688519))

(assert (=> start!101094 tp_is_empty!30759))

(declare-fun array_inv!28786 (array!78307) Bool)

(assert (=> start!101094 (array_inv!28786 _keys!1208)))

(assert (=> start!101094 true))

(assert (=> start!101094 tp!91184))

(declare-fun array_inv!28787 (array!78305) Bool)

(assert (=> start!101094 (and (array_inv!28787 _values!996) e!688517)))

(declare-fun b!1212398 () Bool)

(assert (=> b!1212398 call!60126))

(declare-fun lt!550921 () Unit!40210)

(assert (=> b!1212398 (= lt!550921 call!60122)))

(assert (=> b!1212398 (= e!688521 lt!550921)))

(declare-fun b!1212399 () Bool)

(declare-fun res!805234 () Bool)

(assert (=> b!1212399 (=> (not res!805234) (not e!688519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212399 (= res!805234 (validMask!0 mask!1564))))

(declare-fun b!1212400 () Bool)

(assert (=> b!1212400 (= e!688522 (= lt!550936 (getCurrentListMapNoExtraKeys!5350 lt!550929 lt!550924 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1212401 () Bool)

(declare-fun res!805243 () Bool)

(assert (=> b!1212401 (=> (not res!805243) (not e!688519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212401 (= res!805243 (validKeyInArray!0 k0!934))))

(declare-fun b!1212402 () Bool)

(assert (=> b!1212402 (= e!688530 e!688526)))

(declare-fun res!805232 () Bool)

(assert (=> b!1212402 (=> res!805232 e!688526)))

(assert (=> b!1212402 (= res!805232 (not (= (select (arr!37789 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1212402 e!688523))

(declare-fun c!119659 () Bool)

(assert (=> b!1212402 (= c!119659 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550919 () Unit!40210)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1076 (array!78307 array!78305 (_ BitVec 32) (_ BitVec 32) V!46139 V!46139 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40210)

(assert (=> b!1212402 (= lt!550919 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1076 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212403 () Bool)

(declare-fun Unit!40214 () Unit!40210)

(assert (=> b!1212403 (= e!688521 Unit!40214)))

(declare-fun b!1212404 () Bool)

(assert (=> b!1212404 (= e!688529 tp_is_empty!30759)))

(declare-fun mapIsEmpty!48010 () Bool)

(assert (=> mapIsEmpty!48010 mapRes!48010))

(declare-fun b!1212405 () Bool)

(assert (=> b!1212405 (= e!688516 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212406 () Bool)

(assert (=> b!1212406 (contains!6990 call!60129 k0!934)))

(declare-fun lt!550926 () Unit!40210)

(assert (=> b!1212406 (= lt!550926 call!60128)))

(assert (=> b!1212406 call!60127))

(assert (=> b!1212406 (= lt!550916 (+!4035 lt!550931 (tuple2!19837 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!550937 () Unit!40210)

(assert (=> b!1212406 (= lt!550937 (addStillContains!1062 lt!550931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1212406 (= e!688527 lt!550926)))

(declare-fun b!1212407 () Bool)

(assert (=> b!1212407 (= e!688519 e!688525)))

(declare-fun res!805246 () Bool)

(assert (=> b!1212407 (=> (not res!805246) (not e!688525))))

(assert (=> b!1212407 (= res!805246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550929 mask!1564))))

(assert (=> b!1212407 (= lt!550929 (array!78308 (store (arr!37789 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38325 _keys!1208)))))

(declare-fun b!1212408 () Bool)

(declare-fun res!805238 () Bool)

(assert (=> b!1212408 (=> (not res!805238) (not e!688519))))

(assert (=> b!1212408 (= res!805238 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26635))))

(declare-fun b!1212409 () Bool)

(assert (=> b!1212409 (= e!688524 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!101094 res!805241) b!1212399))

(assert (= (and b!1212399 res!805234) b!1212396))

(assert (= (and b!1212396 res!805237) b!1212386))

(assert (= (and b!1212386 res!805240) b!1212408))

(assert (= (and b!1212408 res!805238) b!1212393))

(assert (= (and b!1212393 res!805233) b!1212401))

(assert (= (and b!1212401 res!805243) b!1212397))

(assert (= (and b!1212397 res!805242) b!1212407))

(assert (= (and b!1212407 res!805246) b!1212392))

(assert (= (and b!1212392 res!805244) b!1212391))

(assert (= (and b!1212391 (not res!805235)) b!1212395))

(assert (= (and b!1212395 (not res!805245)) b!1212402))

(assert (= (and b!1212402 c!119659) b!1212389))

(assert (= (and b!1212402 (not c!119659)) b!1212381))

(assert (= (or b!1212389 b!1212381) bm!60123))

(assert (= (or b!1212389 b!1212381) bm!60124))

(assert (= (and b!1212402 (not res!805232)) b!1212380))

(assert (= (and b!1212380 c!119655) b!1212394))

(assert (= (and b!1212380 (not c!119655)) b!1212385))

(assert (= (and b!1212394 c!119657) b!1212406))

(assert (= (and b!1212394 (not c!119657)) b!1212383))

(assert (= (and b!1212383 c!119656) b!1212387))

(assert (= (and b!1212383 (not c!119656)) b!1212388))

(assert (= (and b!1212388 c!119658) b!1212398))

(assert (= (and b!1212388 (not c!119658)) b!1212403))

(assert (= (or b!1212387 b!1212398) bm!60125))

(assert (= (or b!1212387 b!1212398) bm!60120))

(assert (= (or b!1212387 b!1212398) bm!60126))

(assert (= (or b!1212406 bm!60126) bm!60119))

(assert (= (or b!1212406 bm!60125) bm!60122))

(assert (= (or b!1212406 bm!60120) bm!60121))

(assert (= (and b!1212394 c!119654) b!1212409))

(assert (= (and b!1212394 (not c!119654)) b!1212384))

(assert (= (and b!1212394 res!805236) b!1212405))

(assert (= (and b!1212380 res!805239) b!1212400))

(assert (= (and b!1212382 condMapEmpty!48010) mapIsEmpty!48010))

(assert (= (and b!1212382 (not condMapEmpty!48010)) mapNonEmpty!48010))

(get-info :version)

(assert (= (and mapNonEmpty!48010 ((_ is ValueCellFull!14670) mapValue!48010)) b!1212404))

(assert (= (and b!1212382 ((_ is ValueCellFull!14670) mapDefault!48010)) b!1212390))

(assert (= start!101094 b!1212382))

(declare-fun b_lambda!21693 () Bool)

(assert (=> (not b_lambda!21693) (not b!1212395)))

(declare-fun t!39671 () Bool)

(declare-fun tb!10855 () Bool)

(assert (=> (and start!101094 (= defaultEntry!1004 defaultEntry!1004) t!39671) tb!10855))

(declare-fun result!22305 () Bool)

(assert (=> tb!10855 (= result!22305 tp_is_empty!30759)))

(assert (=> b!1212395 t!39671))

(declare-fun b_and!43211 () Bool)

(assert (= b_and!43209 (and (=> t!39671 result!22305) b_and!43211)))

(declare-fun m!1117719 () Bool)

(assert (=> bm!60122 m!1117719))

(declare-fun m!1117721 () Bool)

(assert (=> bm!60124 m!1117721))

(declare-fun m!1117723 () Bool)

(assert (=> b!1212380 m!1117723))

(assert (=> b!1212380 m!1117721))

(declare-fun m!1117725 () Bool)

(assert (=> b!1212380 m!1117725))

(declare-fun m!1117727 () Bool)

(assert (=> b!1212380 m!1117727))

(declare-fun m!1117729 () Bool)

(assert (=> b!1212380 m!1117729))

(assert (=> b!1212380 m!1117727))

(assert (=> b!1212380 m!1117725))

(declare-fun m!1117731 () Bool)

(assert (=> b!1212380 m!1117731))

(declare-fun m!1117733 () Bool)

(assert (=> b!1212380 m!1117733))

(assert (=> b!1212380 m!1117731))

(declare-fun m!1117735 () Bool)

(assert (=> b!1212380 m!1117735))

(declare-fun m!1117737 () Bool)

(assert (=> b!1212380 m!1117737))

(assert (=> b!1212380 m!1117731))

(declare-fun m!1117739 () Bool)

(assert (=> b!1212397 m!1117739))

(declare-fun m!1117741 () Bool)

(assert (=> start!101094 m!1117741))

(declare-fun m!1117743 () Bool)

(assert (=> start!101094 m!1117743))

(declare-fun m!1117745 () Bool)

(assert (=> b!1212395 m!1117745))

(declare-fun m!1117747 () Bool)

(assert (=> b!1212395 m!1117747))

(declare-fun m!1117749 () Bool)

(assert (=> b!1212395 m!1117749))

(declare-fun m!1117751 () Bool)

(assert (=> b!1212395 m!1117751))

(declare-fun m!1117753 () Bool)

(assert (=> b!1212386 m!1117753))

(declare-fun m!1117755 () Bool)

(assert (=> b!1212399 m!1117755))

(declare-fun m!1117757 () Bool)

(assert (=> b!1212406 m!1117757))

(declare-fun m!1117759 () Bool)

(assert (=> b!1212406 m!1117759))

(declare-fun m!1117761 () Bool)

(assert (=> b!1212406 m!1117761))

(declare-fun m!1117763 () Bool)

(assert (=> b!1212394 m!1117763))

(declare-fun m!1117765 () Bool)

(assert (=> b!1212394 m!1117765))

(declare-fun m!1117767 () Bool)

(assert (=> b!1212394 m!1117767))

(declare-fun m!1117769 () Bool)

(assert (=> b!1212394 m!1117769))

(declare-fun m!1117771 () Bool)

(assert (=> b!1212392 m!1117771))

(declare-fun m!1117773 () Bool)

(assert (=> b!1212391 m!1117773))

(declare-fun m!1117775 () Bool)

(assert (=> b!1212391 m!1117775))

(declare-fun m!1117777 () Bool)

(assert (=> bm!60119 m!1117777))

(declare-fun m!1117779 () Bool)

(assert (=> b!1212401 m!1117779))

(declare-fun m!1117781 () Bool)

(assert (=> b!1212409 m!1117781))

(declare-fun m!1117783 () Bool)

(assert (=> mapNonEmpty!48010 m!1117783))

(assert (=> b!1212405 m!1117781))

(declare-fun m!1117785 () Bool)

(assert (=> b!1212407 m!1117785))

(declare-fun m!1117787 () Bool)

(assert (=> b!1212407 m!1117787))

(assert (=> b!1212402 m!1117731))

(declare-fun m!1117789 () Bool)

(assert (=> b!1212402 m!1117789))

(declare-fun m!1117791 () Bool)

(assert (=> b!1212408 m!1117791))

(declare-fun m!1117793 () Bool)

(assert (=> b!1212400 m!1117793))

(declare-fun m!1117795 () Bool)

(assert (=> b!1212389 m!1117795))

(assert (=> bm!60123 m!1117793))

(declare-fun m!1117797 () Bool)

(assert (=> bm!60121 m!1117797))

(check-sat (not b!1212400) (not b!1212394) (not b!1212409) (not b!1212399) tp_is_empty!30759 (not bm!60121) (not b!1212407) (not b!1212395) (not start!101094) (not b!1212380) (not b_lambda!21693) (not b_next!26055) (not b!1212405) (not bm!60123) (not b!1212392) (not bm!60119) (not b!1212406) (not b!1212391) (not b!1212401) (not bm!60124) (not b!1212408) (not bm!60122) (not b!1212386) (not b!1212402) (not b!1212389) b_and!43211 (not mapNonEmpty!48010))
(check-sat b_and!43211 (not b_next!26055))
