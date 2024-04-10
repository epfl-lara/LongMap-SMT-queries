; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101142 () Bool)

(assert start!101142)

(declare-fun b_free!26065 () Bool)

(declare-fun b_next!26065 () Bool)

(assert (=> start!101142 (= b_free!26065 (not b_next!26065))))

(declare-fun tp!91216 () Bool)

(declare-fun b_and!43247 () Bool)

(assert (=> start!101142 (= tp!91216 b_and!43247)))

(declare-fun bm!60260 () Bool)

(declare-datatypes ((V!46153 0))(
  ( (V!46154 (val!15441 Int)) )
))
(declare-datatypes ((tuple2!19844 0))(
  ( (tuple2!19845 (_1!9933 (_ BitVec 64)) (_2!9933 V!46153)) )
))
(declare-datatypes ((List!26644 0))(
  ( (Nil!26641) (Cons!26640 (h!27849 tuple2!19844) (t!39689 List!26644)) )
))
(declare-datatypes ((ListLongMap!17813 0))(
  ( (ListLongMap!17814 (toList!8922 List!26644)) )
))
(declare-fun call!60270 () ListLongMap!17813)

(declare-fun call!60264 () ListLongMap!17813)

(assert (=> bm!60260 (= call!60270 call!60264)))

(declare-fun b!1213016 () Bool)

(declare-datatypes ((Unit!40227 0))(
  ( (Unit!40228) )
))
(declare-fun e!688900 () Unit!40227)

(declare-fun Unit!40229 () Unit!40227)

(assert (=> b!1213016 (= e!688900 Unit!40229)))

(declare-fun b!1213017 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6994 (ListLongMap!17813 (_ BitVec 64)) Bool)

(assert (=> b!1213017 (contains!6994 call!60264 k!934)))

(declare-fun lt!551386 () Unit!40227)

(declare-fun call!60266 () Unit!40227)

(assert (=> b!1213017 (= lt!551386 call!60266)))

(declare-fun call!60265 () Bool)

(assert (=> b!1213017 call!60265))

(declare-fun lt!551387 () ListLongMap!17813)

(declare-fun lt!551383 () ListLongMap!17813)

(declare-fun zeroValue!944 () V!46153)

(declare-fun +!4037 (ListLongMap!17813 tuple2!19844) ListLongMap!17813)

(assert (=> b!1213017 (= lt!551387 (+!4037 lt!551383 (tuple2!19845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551369 () Unit!40227)

(declare-fun addStillContains!1065 (ListLongMap!17813 (_ BitVec 64) V!46153 (_ BitVec 64)) Unit!40227)

(assert (=> b!1213017 (= lt!551369 (addStillContains!1065 lt!551383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!688891 () Unit!40227)

(assert (=> b!1213017 (= e!688891 lt!551386)))

(declare-fun b!1213018 () Bool)

(declare-fun e!688890 () Bool)

(declare-fun e!688896 () Bool)

(assert (=> b!1213018 (= e!688890 (not e!688896))))

(declare-fun res!805534 () Bool)

(assert (=> b!1213018 (=> res!805534 e!688896)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213018 (= res!805534 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78325 0))(
  ( (array!78326 (arr!37797 (Array (_ BitVec 32) (_ BitVec 64))) (size!38333 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78325)

(declare-fun arrayContainsKey!0 (array!78325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213018 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!551379 () Unit!40227)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78325 (_ BitVec 64) (_ BitVec 32)) Unit!40227)

(assert (=> b!1213018 (= lt!551379 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1213019 () Bool)

(declare-fun res!805530 () Bool)

(declare-fun e!688889 () Bool)

(assert (=> b!1213019 (=> (not res!805530) (not e!688889))))

(assert (=> b!1213019 (= res!805530 (= (select (arr!37797 _keys!1208) i!673) k!934))))

(declare-fun b!1213020 () Bool)

(declare-fun e!688898 () Unit!40227)

(declare-fun lt!551373 () Unit!40227)

(assert (=> b!1213020 (= e!688898 lt!551373)))

(declare-fun call!60268 () Unit!40227)

(assert (=> b!1213020 (= lt!551373 call!60268)))

(declare-fun call!60269 () Bool)

(assert (=> b!1213020 call!60269))

(declare-fun b!1213021 () Bool)

(assert (=> b!1213021 (= e!688898 e!688900)))

(declare-fun c!119791 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!551374 () Bool)

(assert (=> b!1213021 (= c!119791 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551374))))

(declare-fun b!1213022 () Bool)

(declare-fun res!805542 () Bool)

(assert (=> b!1213022 (=> (not res!805542) (not e!688889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213022 (= res!805542 (validKeyInArray!0 k!934))))

(declare-fun lt!551377 () array!78325)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!551384 () ListLongMap!17813)

(declare-fun defaultEntry!1004 () Int)

(declare-fun e!688899 () Bool)

(declare-fun minValue!944 () V!46153)

(declare-fun b!1213023 () Bool)

(declare-datatypes ((ValueCell!14675 0))(
  ( (ValueCellFull!14675 (v!18094 V!46153)) (EmptyCell!14675) )
))
(declare-datatypes ((array!78327 0))(
  ( (array!78328 (arr!37798 (Array (_ BitVec 32) ValueCell!14675)) (size!38334 (_ BitVec 32))) )
))
(declare-fun lt!551385 () array!78327)

(declare-fun getCurrentListMapNoExtraKeys!5353 (array!78325 array!78327 (_ BitVec 32) (_ BitVec 32) V!46153 V!46153 (_ BitVec 32) Int) ListLongMap!17813)

(assert (=> b!1213023 (= e!688899 (= lt!551384 (getCurrentListMapNoExtraKeys!5353 lt!551377 lt!551385 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1213024 () Bool)

(assert (=> b!1213024 (= e!688889 e!688890)))

(declare-fun res!805533 () Bool)

(assert (=> b!1213024 (=> (not res!805533) (not e!688890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78325 (_ BitVec 32)) Bool)

(assert (=> b!1213024 (= res!805533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551377 mask!1564))))

(assert (=> b!1213024 (= lt!551377 (array!78326 (store (arr!37797 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38333 _keys!1208)))))

(declare-fun mapIsEmpty!48028 () Bool)

(declare-fun mapRes!48028 () Bool)

(assert (=> mapIsEmpty!48028 mapRes!48028))

(declare-fun call!60263 () ListLongMap!17813)

(declare-fun _values!996 () array!78327)

(declare-fun bm!60261 () Bool)

(assert (=> bm!60261 (= call!60263 (getCurrentListMapNoExtraKeys!5353 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!805537 () Bool)

(assert (=> start!101142 (=> (not res!805537) (not e!688889))))

(assert (=> start!101142 (= res!805537 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38333 _keys!1208))))))

(assert (=> start!101142 e!688889))

(declare-fun tp_is_empty!30769 () Bool)

(assert (=> start!101142 tp_is_empty!30769))

(declare-fun array_inv!28790 (array!78325) Bool)

(assert (=> start!101142 (array_inv!28790 _keys!1208)))

(assert (=> start!101142 true))

(assert (=> start!101142 tp!91216))

(declare-fun e!688892 () Bool)

(declare-fun array_inv!28791 (array!78327) Bool)

(assert (=> start!101142 (and (array_inv!28791 _values!996) e!688892)))

(declare-fun b!1213025 () Bool)

(declare-fun e!688885 () Bool)

(assert (=> b!1213025 (= e!688885 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213026 () Bool)

(declare-fun e!688895 () Bool)

(assert (=> b!1213026 (= e!688895 tp_is_empty!30769)))

(declare-fun e!688886 () Bool)

(declare-fun b!1213027 () Bool)

(assert (=> b!1213027 (= e!688886 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551374) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1213028 () Bool)

(declare-fun e!688884 () Unit!40227)

(declare-fun Unit!40230 () Unit!40227)

(assert (=> b!1213028 (= e!688884 Unit!40230)))

(assert (=> b!1213028 (= lt!551374 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119795 () Bool)

(assert (=> b!1213028 (= c!119795 (and (not lt!551374) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551371 () Unit!40227)

(assert (=> b!1213028 (= lt!551371 e!688891)))

(declare-fun lt!551367 () Unit!40227)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!615 (array!78325 array!78327 (_ BitVec 32) (_ BitVec 32) V!46153 V!46153 (_ BitVec 64) (_ BitVec 32) Int) Unit!40227)

(assert (=> b!1213028 (= lt!551367 (lemmaListMapContainsThenArrayContainsFrom!615 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119794 () Bool)

(assert (=> b!1213028 (= c!119794 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805536 () Bool)

(assert (=> b!1213028 (= res!805536 e!688886)))

(assert (=> b!1213028 (=> (not res!805536) (not e!688885))))

(assert (=> b!1213028 e!688885))

(declare-fun lt!551382 () Unit!40227)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78325 (_ BitVec 32) (_ BitVec 32)) Unit!40227)

(assert (=> b!1213028 (= lt!551382 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26645 0))(
  ( (Nil!26642) (Cons!26641 (h!27850 (_ BitVec 64)) (t!39690 List!26645)) )
))
(declare-fun arrayNoDuplicates!0 (array!78325 (_ BitVec 32) List!26645) Bool)

(assert (=> b!1213028 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26642)))

(declare-fun lt!551372 () Unit!40227)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78325 (_ BitVec 64) (_ BitVec 32) List!26645) Unit!40227)

(assert (=> b!1213028 (= lt!551372 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26642))))

(assert (=> b!1213028 false))

(declare-fun b!1213029 () Bool)

(declare-fun e!688887 () Bool)

(declare-fun e!688894 () Bool)

(assert (=> b!1213029 (= e!688887 e!688894)))

(declare-fun res!805539 () Bool)

(assert (=> b!1213029 (=> res!805539 e!688894)))

(assert (=> b!1213029 (= res!805539 (not (= (select (arr!37797 _keys!1208) from!1455) k!934)))))

(declare-fun e!688893 () Bool)

(assert (=> b!1213029 e!688893))

(declare-fun c!119792 () Bool)

(assert (=> b!1213029 (= c!119792 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551375 () Unit!40227)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1078 (array!78325 array!78327 (_ BitVec 32) (_ BitVec 32) V!46153 V!46153 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40227)

(assert (=> b!1213029 (= lt!551375 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1078 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213030 () Bool)

(assert (=> b!1213030 (= e!688896 e!688887)))

(declare-fun res!805544 () Bool)

(assert (=> b!1213030 (=> res!805544 e!688887)))

(assert (=> b!1213030 (= res!805544 (not (= from!1455 i!673)))))

(declare-fun lt!551388 () ListLongMap!17813)

(assert (=> b!1213030 (= lt!551388 (getCurrentListMapNoExtraKeys!5353 lt!551377 lt!551385 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!551380 () V!46153)

(assert (=> b!1213030 (= lt!551385 (array!78328 (store (arr!37798 _values!996) i!673 (ValueCellFull!14675 lt!551380)) (size!38334 _values!996)))))

(declare-fun dynLambda!3244 (Int (_ BitVec 64)) V!46153)

(assert (=> b!1213030 (= lt!551380 (dynLambda!3244 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!551370 () ListLongMap!17813)

(assert (=> b!1213030 (= lt!551370 (getCurrentListMapNoExtraKeys!5353 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1213031 () Bool)

(declare-fun res!805532 () Bool)

(assert (=> b!1213031 (=> (not res!805532) (not e!688889))))

(assert (=> b!1213031 (= res!805532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1213032 () Bool)

(declare-fun call!60267 () ListLongMap!17813)

(declare-fun -!1868 (ListLongMap!17813 (_ BitVec 64)) ListLongMap!17813)

(assert (=> b!1213032 (= e!688893 (= call!60267 (-!1868 call!60263 k!934)))))

(declare-fun b!1213033 () Bool)

(assert (=> b!1213033 (= e!688893 (= call!60267 call!60263))))

(declare-fun b!1213034 () Bool)

(assert (=> b!1213034 (= e!688892 (and e!688895 mapRes!48028))))

(declare-fun condMapEmpty!48028 () Bool)

(declare-fun mapDefault!48028 () ValueCell!14675)

