; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101012 () Bool)

(assert start!101012)

(declare-fun b_free!26011 () Bool)

(declare-fun b_next!26011 () Bool)

(assert (=> start!101012 (= b_free!26011 (not b_next!26011))))

(declare-fun tp!91048 () Bool)

(declare-fun b_and!43103 () Bool)

(assert (=> start!101012 (= tp!91048 b_and!43103)))

(declare-fun b!1210214 () Bool)

(declare-datatypes ((V!46081 0))(
  ( (V!46082 (val!15414 Int)) )
))
(declare-datatypes ((tuple2!19794 0))(
  ( (tuple2!19795 (_1!9908 (_ BitVec 64)) (_2!9908 V!46081)) )
))
(declare-datatypes ((List!26595 0))(
  ( (Nil!26592) (Cons!26591 (h!27800 tuple2!19794) (t!39586 List!26595)) )
))
(declare-datatypes ((ListLongMap!17763 0))(
  ( (ListLongMap!17764 (toList!8897 List!26595)) )
))
(declare-fun call!59573 () ListLongMap!17763)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6968 (ListLongMap!17763 (_ BitVec 64)) Bool)

(assert (=> b!1210214 (contains!6968 call!59573 k!934)))

(declare-fun lt!549441 () ListLongMap!17763)

(declare-datatypes ((Unit!40114 0))(
  ( (Unit!40115) )
))
(declare-fun lt!549450 () Unit!40114)

(declare-fun minValue!944 () V!46081)

(declare-fun addStillContains!1043 (ListLongMap!17763 (_ BitVec 64) V!46081 (_ BitVec 64)) Unit!40114)

(assert (=> b!1210214 (= lt!549450 (addStillContains!1043 lt!549441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!59578 () Bool)

(assert (=> b!1210214 call!59578))

(declare-fun lt!549439 () ListLongMap!17763)

(declare-fun zeroValue!944 () V!46081)

(declare-fun +!4015 (ListLongMap!17763 tuple2!19794) ListLongMap!17763)

(assert (=> b!1210214 (= lt!549441 (+!4015 lt!549439 (tuple2!19795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!549435 () Unit!40114)

(declare-fun call!59579 () Unit!40114)

(assert (=> b!1210214 (= lt!549435 call!59579)))

(declare-fun e!687316 () Unit!40114)

(assert (=> b!1210214 (= e!687316 lt!549450)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!549448 () Bool)

(declare-fun e!687319 () Bool)

(declare-fun b!1210215 () Bool)

(assert (=> b!1210215 (= e!687319 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549448) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1210216 () Bool)

(declare-fun call!59580 () Bool)

(assert (=> b!1210216 call!59580))

(declare-fun lt!549446 () Unit!40114)

(declare-fun call!59574 () Unit!40114)

(assert (=> b!1210216 (= lt!549446 call!59574)))

(declare-fun e!687315 () Unit!40114)

(assert (=> b!1210216 (= e!687315 lt!549446)))

(declare-fun b!1210217 () Bool)

(declare-fun c!119212 () Bool)

(assert (=> b!1210217 (= c!119212 (and (not lt!549448) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687324 () Unit!40114)

(assert (=> b!1210217 (= e!687316 e!687324)))

(declare-fun b!1210218 () Bool)

(declare-fun e!687323 () Bool)

(declare-fun e!687325 () Bool)

(assert (=> b!1210218 (= e!687323 e!687325)))

(declare-fun res!804206 () Bool)

(assert (=> b!1210218 (=> (not res!804206) (not e!687325))))

(declare-datatypes ((array!78215 0))(
  ( (array!78216 (arr!37744 (Array (_ BitVec 32) (_ BitVec 64))) (size!38280 (_ BitVec 32))) )
))
(declare-fun lt!549440 () array!78215)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78215 (_ BitVec 32)) Bool)

(assert (=> b!1210218 (= res!804206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549440 mask!1564))))

(declare-fun _keys!1208 () array!78215)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210218 (= lt!549440 (array!78216 (store (arr!37744 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38280 _keys!1208)))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1210219 () Bool)

(declare-fun arrayContainsKey!0 (array!78215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210219 (= e!687319 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59570 () Bool)

(declare-fun c!119216 () Bool)

(assert (=> bm!59570 (= call!59573 (+!4015 (ite c!119216 lt!549441 lt!549439) (ite c!119216 (tuple2!19795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119212 (tuple2!19795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1210220 () Bool)

(declare-fun res!804216 () Bool)

(assert (=> b!1210220 (=> (not res!804216) (not e!687323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210220 (= res!804216 (validMask!0 mask!1564))))

(declare-fun call!59576 () ListLongMap!17763)

(declare-fun bm!59571 () Bool)

(assert (=> bm!59571 (= call!59578 (contains!6968 (ite c!119216 lt!549441 call!59576) k!934))))

(declare-fun b!1210221 () Bool)

(declare-fun e!687326 () Bool)

(declare-fun e!687321 () Bool)

(assert (=> b!1210221 (= e!687326 e!687321)))

(declare-fun res!804214 () Bool)

(assert (=> b!1210221 (=> res!804214 e!687321)))

(assert (=> b!1210221 (= res!804214 (not (= from!1455 i!673)))))

(declare-datatypes ((ValueCell!14648 0))(
  ( (ValueCellFull!14648 (v!18065 V!46081)) (EmptyCell!14648) )
))
(declare-datatypes ((array!78217 0))(
  ( (array!78218 (arr!37745 (Array (_ BitVec 32) ValueCell!14648)) (size!38281 (_ BitVec 32))) )
))
(declare-fun lt!549442 () array!78217)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!549444 () ListLongMap!17763)

(declare-fun getCurrentListMapNoExtraKeys!5330 (array!78215 array!78217 (_ BitVec 32) (_ BitVec 32) V!46081 V!46081 (_ BitVec 32) Int) ListLongMap!17763)

(assert (=> b!1210221 (= lt!549444 (getCurrentListMapNoExtraKeys!5330 lt!549440 lt!549442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78217)

(declare-fun dynLambda!3228 (Int (_ BitVec 64)) V!46081)

(assert (=> b!1210221 (= lt!549442 (array!78218 (store (arr!37745 _values!996) i!673 (ValueCellFull!14648 (dynLambda!3228 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38281 _values!996)))))

(declare-fun lt!549451 () ListLongMap!17763)

(assert (=> b!1210221 (= lt!549451 (getCurrentListMapNoExtraKeys!5330 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59572 () Bool)

(assert (=> bm!59572 (= call!59579 (addStillContains!1043 lt!549439 (ite (or c!119216 c!119212) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119216 c!119212) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1210222 () Bool)

(declare-fun res!804207 () Bool)

(assert (=> b!1210222 (=> (not res!804207) (not e!687323))))

(assert (=> b!1210222 (= res!804207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1210223 () Bool)

(declare-fun e!687314 () Bool)

(declare-fun tp_is_empty!30715 () Bool)

(assert (=> b!1210223 (= e!687314 tp_is_empty!30715)))

(declare-fun b!1210224 () Bool)

(declare-fun e!687313 () Unit!40114)

(declare-fun Unit!40116 () Unit!40114)

(assert (=> b!1210224 (= e!687313 Unit!40116)))

(assert (=> b!1210224 (= lt!549448 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1210224 (= c!119216 (and (not lt!549448) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549434 () Unit!40114)

(assert (=> b!1210224 (= lt!549434 e!687316)))

(declare-fun lt!549438 () Unit!40114)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!595 (array!78215 array!78217 (_ BitVec 32) (_ BitVec 32) V!46081 V!46081 (_ BitVec 64) (_ BitVec 32) Int) Unit!40114)

(assert (=> b!1210224 (= lt!549438 (lemmaListMapContainsThenArrayContainsFrom!595 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119211 () Bool)

(assert (=> b!1210224 (= c!119211 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804208 () Bool)

(assert (=> b!1210224 (= res!804208 e!687319)))

(declare-fun e!687320 () Bool)

(assert (=> b!1210224 (=> (not res!804208) (not e!687320))))

(assert (=> b!1210224 e!687320))

(declare-fun lt!549449 () Unit!40114)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78215 (_ BitVec 32) (_ BitVec 32)) Unit!40114)

(assert (=> b!1210224 (= lt!549449 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26596 0))(
  ( (Nil!26593) (Cons!26592 (h!27801 (_ BitVec 64)) (t!39587 List!26596)) )
))
(declare-fun arrayNoDuplicates!0 (array!78215 (_ BitVec 32) List!26596) Bool)

(assert (=> b!1210224 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26593)))

(declare-fun lt!549445 () Unit!40114)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78215 (_ BitVec 64) (_ BitVec 32) List!26596) Unit!40114)

(assert (=> b!1210224 (= lt!549445 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26593))))

(assert (=> b!1210224 false))

(declare-fun bm!59573 () Bool)

(assert (=> bm!59573 (= call!59580 call!59578)))

(declare-fun b!1210225 () Bool)

(declare-fun res!804210 () Bool)

(assert (=> b!1210225 (=> (not res!804210) (not e!687323))))

(assert (=> b!1210225 (= res!804210 (and (= (size!38281 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38280 _keys!1208) (size!38281 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1210226 () Bool)

(declare-fun res!804204 () Bool)

(assert (=> b!1210226 (=> (not res!804204) (not e!687323))))

(assert (=> b!1210226 (= res!804204 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38280 _keys!1208))))))

(declare-fun call!59577 () ListLongMap!17763)

(declare-fun bm!59574 () Bool)

(assert (=> bm!59574 (= call!59577 (getCurrentListMapNoExtraKeys!5330 lt!549440 lt!549442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210227 () Bool)

(declare-fun res!804212 () Bool)

(assert (=> b!1210227 (=> (not res!804212) (not e!687323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210227 (= res!804212 (validKeyInArray!0 k!934))))

(declare-fun b!1210228 () Bool)

(declare-fun e!687312 () Bool)

(declare-fun call!59575 () ListLongMap!17763)

(assert (=> b!1210228 (= e!687312 (= call!59577 call!59575))))

(declare-fun b!1210229 () Bool)

(assert (=> b!1210229 (= e!687320 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210230 () Bool)

(declare-fun res!804203 () Bool)

(assert (=> b!1210230 (=> (not res!804203) (not e!687323))))

(assert (=> b!1210230 (= res!804203 (= (select (arr!37744 _keys!1208) i!673) k!934))))

(declare-fun b!1210231 () Bool)

(declare-fun lt!549437 () Unit!40114)

(assert (=> b!1210231 (= e!687324 lt!549437)))

(assert (=> b!1210231 (= lt!549437 call!59574)))

(assert (=> b!1210231 call!59580))

(declare-fun mapNonEmpty!47941 () Bool)

(declare-fun mapRes!47941 () Bool)

(declare-fun tp!91049 () Bool)

(assert (=> mapNonEmpty!47941 (= mapRes!47941 (and tp!91049 e!687314))))

(declare-fun mapValue!47941 () ValueCell!14648)

(declare-fun mapKey!47941 () (_ BitVec 32))

(declare-fun mapRest!47941 () (Array (_ BitVec 32) ValueCell!14648))

(assert (=> mapNonEmpty!47941 (= (arr!37745 _values!996) (store mapRest!47941 mapKey!47941 mapValue!47941))))

(declare-fun bm!59575 () Bool)

(assert (=> bm!59575 (= call!59576 call!59573)))

(declare-fun b!1210232 () Bool)

(declare-fun res!804205 () Bool)

(assert (=> b!1210232 (=> (not res!804205) (not e!687323))))

(assert (=> b!1210232 (= res!804205 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26593))))

(declare-fun b!1210233 () Bool)

(declare-fun -!1847 (ListLongMap!17763 (_ BitVec 64)) ListLongMap!17763)

(assert (=> b!1210233 (= e!687312 (= call!59577 (-!1847 call!59575 k!934)))))

(declare-fun bm!59576 () Bool)

(assert (=> bm!59576 (= call!59575 (getCurrentListMapNoExtraKeys!5330 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210234 () Bool)

(assert (=> b!1210234 (= e!687324 e!687315)))

(declare-fun c!119214 () Bool)

(assert (=> b!1210234 (= c!119214 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549448))))

(declare-fun b!1210235 () Bool)

(declare-fun Unit!40117 () Unit!40114)

(assert (=> b!1210235 (= e!687313 Unit!40117)))

(declare-fun b!1210236 () Bool)

(declare-fun e!687311 () Bool)

(assert (=> b!1210236 (= e!687321 e!687311)))

(declare-fun res!804213 () Bool)

(assert (=> b!1210236 (=> res!804213 e!687311)))

(assert (=> b!1210236 (= res!804213 (not (= (select (arr!37744 _keys!1208) from!1455) k!934)))))

(assert (=> b!1210236 e!687312))

(declare-fun c!119213 () Bool)

(assert (=> b!1210236 (= c!119213 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549436 () Unit!40114)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1058 (array!78215 array!78217 (_ BitVec 32) (_ BitVec 32) V!46081 V!46081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40114)

(assert (=> b!1210236 (= lt!549436 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1058 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210237 () Bool)

(declare-fun res!804215 () Bool)

(assert (=> b!1210237 (=> (not res!804215) (not e!687325))))

(assert (=> b!1210237 (= res!804215 (arrayNoDuplicates!0 lt!549440 #b00000000000000000000000000000000 Nil!26593))))

(declare-fun b!1210238 () Bool)

(assert (=> b!1210238 (= e!687311 (bvslt from!1455 (size!38281 _values!996)))))

(declare-fun lt!549447 () Unit!40114)

(assert (=> b!1210238 (= lt!549447 e!687313)))

(declare-fun c!119215 () Bool)

(assert (=> b!1210238 (= c!119215 (contains!6968 lt!549439 k!934))))

(assert (=> b!1210238 (= lt!549439 (getCurrentListMapNoExtraKeys!5330 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210239 () Bool)

(declare-fun e!687318 () Bool)

(assert (=> b!1210239 (= e!687318 tp_is_empty!30715)))

(declare-fun b!1210240 () Bool)

(assert (=> b!1210240 (= e!687325 (not e!687326))))

(declare-fun res!804209 () Bool)

(assert (=> b!1210240 (=> res!804209 e!687326)))

(assert (=> b!1210240 (= res!804209 (bvsgt from!1455 i!673))))

(assert (=> b!1210240 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!549443 () Unit!40114)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78215 (_ BitVec 64) (_ BitVec 32)) Unit!40114)

(assert (=> b!1210240 (= lt!549443 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!59577 () Bool)

(assert (=> bm!59577 (= call!59574 call!59579)))

(declare-fun b!1210241 () Bool)

(declare-fun Unit!40118 () Unit!40114)

(assert (=> b!1210241 (= e!687315 Unit!40118)))

(declare-fun res!804211 () Bool)

(assert (=> start!101012 (=> (not res!804211) (not e!687323))))

(assert (=> start!101012 (= res!804211 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38280 _keys!1208))))))

(assert (=> start!101012 e!687323))

(assert (=> start!101012 tp_is_empty!30715))

(declare-fun array_inv!28752 (array!78215) Bool)

(assert (=> start!101012 (array_inv!28752 _keys!1208)))

(assert (=> start!101012 true))

(assert (=> start!101012 tp!91048))

(declare-fun e!687317 () Bool)

(declare-fun array_inv!28753 (array!78217) Bool)

(assert (=> start!101012 (and (array_inv!28753 _values!996) e!687317)))

(declare-fun b!1210242 () Bool)

(assert (=> b!1210242 (= e!687317 (and e!687318 mapRes!47941))))

(declare-fun condMapEmpty!47941 () Bool)

(declare-fun mapDefault!47941 () ValueCell!14648)

