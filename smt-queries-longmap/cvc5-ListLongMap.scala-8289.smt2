; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101006 () Bool)

(assert start!101006)

(declare-fun b_free!26005 () Bool)

(declare-fun b_next!26005 () Bool)

(assert (=> start!101006 (= b_free!26005 (not b_next!26005))))

(declare-fun tp!91031 () Bool)

(declare-fun b_and!43091 () Bool)

(assert (=> start!101006 (= tp!91031 b_and!43091)))

(declare-fun b!1209947 () Bool)

(declare-fun e!687177 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78203 0))(
  ( (array!78204 (arr!37738 (Array (_ BitVec 32) (_ BitVec 64))) (size!38274 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78203)

(assert (=> b!1209947 (= e!687177 (bvslt from!1455 (size!38274 _keys!1208)))))

(declare-datatypes ((Unit!40099 0))(
  ( (Unit!40100) )
))
(declare-fun lt!549275 () Unit!40099)

(declare-fun e!687180 () Unit!40099)

(assert (=> b!1209947 (= lt!549275 e!687180)))

(declare-fun c!119161 () Bool)

(declare-datatypes ((V!46073 0))(
  ( (V!46074 (val!15411 Int)) )
))
(declare-datatypes ((tuple2!19788 0))(
  ( (tuple2!19789 (_1!9905 (_ BitVec 64)) (_2!9905 V!46073)) )
))
(declare-datatypes ((List!26589 0))(
  ( (Nil!26586) (Cons!26585 (h!27794 tuple2!19788) (t!39574 List!26589)) )
))
(declare-datatypes ((ListLongMap!17757 0))(
  ( (ListLongMap!17758 (toList!8894 List!26589)) )
))
(declare-fun lt!549274 () ListLongMap!17757)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6965 (ListLongMap!17757 (_ BitVec 64)) Bool)

(assert (=> b!1209947 (= c!119161 (contains!6965 lt!549274 k!934))))

(declare-fun zeroValue!944 () V!46073)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14645 0))(
  ( (ValueCellFull!14645 (v!18062 V!46073)) (EmptyCell!14645) )
))
(declare-datatypes ((array!78205 0))(
  ( (array!78206 (arr!37739 (Array (_ BitVec 32) ValueCell!14645)) (size!38275 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78205)

(declare-fun minValue!944 () V!46073)

(declare-fun getCurrentListMapNoExtraKeys!5327 (array!78203 array!78205 (_ BitVec 32) (_ BitVec 32) V!46073 V!46073 (_ BitVec 32) Int) ListLongMap!17757)

(assert (=> b!1209947 (= lt!549274 (getCurrentListMapNoExtraKeys!5327 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209948 () Bool)

(declare-fun res!804089 () Bool)

(declare-fun e!687170 () Bool)

(assert (=> b!1209948 (=> (not res!804089) (not e!687170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78203 (_ BitVec 32)) Bool)

(assert (=> b!1209948 (= res!804089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1209949 () Bool)

(declare-fun res!804087 () Bool)

(assert (=> b!1209949 (=> (not res!804087) (not e!687170))))

(assert (=> b!1209949 (= res!804087 (and (= (size!38275 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38274 _keys!1208) (size!38275 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1209950 () Bool)

(declare-fun res!804090 () Bool)

(assert (=> b!1209950 (=> (not res!804090) (not e!687170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209950 (= res!804090 (validKeyInArray!0 k!934))))

(declare-fun b!1209951 () Bool)

(declare-fun res!804085 () Bool)

(assert (=> b!1209951 (=> (not res!804085) (not e!687170))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209951 (= res!804085 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38274 _keys!1208))))))

(declare-fun b!1209952 () Bool)

(declare-fun call!59505 () Bool)

(assert (=> b!1209952 call!59505))

(declare-fun lt!549279 () Unit!40099)

(declare-fun call!59503 () Unit!40099)

(assert (=> b!1209952 (= lt!549279 call!59503)))

(declare-fun e!687169 () Unit!40099)

(assert (=> b!1209952 (= e!687169 lt!549279)))

(declare-fun call!59504 () ListLongMap!17757)

(declare-fun c!119160 () Bool)

(declare-fun bm!59498 () Bool)

(declare-fun lt!549287 () ListLongMap!17757)

(declare-fun c!119162 () Bool)

(declare-fun +!4012 (ListLongMap!17757 tuple2!19788) ListLongMap!17757)

(assert (=> bm!59498 (= call!59504 (+!4012 (ite c!119160 lt!549287 lt!549274) (ite c!119160 (tuple2!19789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119162 (tuple2!19789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209953 () Bool)

(declare-fun e!687181 () Bool)

(assert (=> b!1209953 (= e!687170 e!687181)))

(declare-fun res!804086 () Bool)

(assert (=> b!1209953 (=> (not res!804086) (not e!687181))))

(declare-fun lt!549277 () array!78203)

(assert (=> b!1209953 (= res!804086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549277 mask!1564))))

(assert (=> b!1209953 (= lt!549277 (array!78204 (store (arr!37738 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38274 _keys!1208)))))

(declare-fun b!1209954 () Bool)

(declare-fun e!687176 () Bool)

(declare-fun tp_is_empty!30709 () Bool)

(assert (=> b!1209954 (= e!687176 tp_is_empty!30709)))

(declare-fun b!1209955 () Bool)

(declare-fun Unit!40101 () Unit!40099)

(assert (=> b!1209955 (= e!687169 Unit!40101)))

(declare-fun bm!59499 () Bool)

(declare-fun call!59501 () ListLongMap!17757)

(assert (=> bm!59499 (= call!59501 call!59504)))

(declare-fun b!1209956 () Bool)

(declare-fun e!687174 () Unit!40099)

(declare-fun lt!549286 () Unit!40099)

(assert (=> b!1209956 (= e!687174 lt!549286)))

(assert (=> b!1209956 (= lt!549286 call!59503)))

(assert (=> b!1209956 call!59505))

(declare-fun e!687168 () Bool)

(declare-fun call!59502 () ListLongMap!17757)

(declare-fun call!59507 () ListLongMap!17757)

(declare-fun b!1209957 () Bool)

(declare-fun -!1844 (ListLongMap!17757 (_ BitVec 64)) ListLongMap!17757)

(assert (=> b!1209957 (= e!687168 (= call!59507 (-!1844 call!59502 k!934)))))

(declare-fun bm!59500 () Bool)

(declare-fun call!59506 () Bool)

(assert (=> bm!59500 (= call!59506 (contains!6965 (ite c!119160 lt!549287 call!59501) k!934))))

(declare-fun bm!59501 () Bool)

(declare-fun lt!549276 () array!78205)

(assert (=> bm!59501 (= call!59507 (getCurrentListMapNoExtraKeys!5327 lt!549277 lt!549276 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!804077 () Bool)

(assert (=> start!101006 (=> (not res!804077) (not e!687170))))

(assert (=> start!101006 (= res!804077 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38274 _keys!1208))))))

(assert (=> start!101006 e!687170))

(assert (=> start!101006 tp_is_empty!30709))

(declare-fun array_inv!28746 (array!78203) Bool)

(assert (=> start!101006 (array_inv!28746 _keys!1208)))

(assert (=> start!101006 true))

(assert (=> start!101006 tp!91031))

(declare-fun e!687173 () Bool)

(declare-fun array_inv!28747 (array!78205) Bool)

(assert (=> start!101006 (and (array_inv!28747 _values!996) e!687173)))

(declare-fun b!1209958 () Bool)

(declare-fun e!687178 () Bool)

(assert (=> b!1209958 (= e!687178 e!687177)))

(declare-fun res!804080 () Bool)

(assert (=> b!1209958 (=> res!804080 e!687177)))

(assert (=> b!1209958 (= res!804080 (not (= (select (arr!37738 _keys!1208) from!1455) k!934)))))

(assert (=> b!1209958 e!687168))

(declare-fun c!119159 () Bool)

(assert (=> b!1209958 (= c!119159 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549283 () Unit!40099)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1055 (array!78203 array!78205 (_ BitVec 32) (_ BitVec 32) V!46073 V!46073 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40099)

(assert (=> b!1209958 (= lt!549283 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1055 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!687172 () Bool)

(declare-fun b!1209959 () Bool)

(declare-fun arrayContainsKey!0 (array!78203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209959 (= e!687172 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209960 () Bool)

(declare-fun res!804082 () Bool)

(assert (=> b!1209960 (=> (not res!804082) (not e!687181))))

(declare-datatypes ((List!26590 0))(
  ( (Nil!26587) (Cons!26586 (h!27795 (_ BitVec 64)) (t!39575 List!26590)) )
))
(declare-fun arrayNoDuplicates!0 (array!78203 (_ BitVec 32) List!26590) Bool)

(assert (=> b!1209960 (= res!804082 (arrayNoDuplicates!0 lt!549277 #b00000000000000000000000000000000 Nil!26587))))

(declare-fun b!1209961 () Bool)

(declare-fun lt!549273 () Bool)

(assert (=> b!1209961 (= c!119162 (and (not lt!549273) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687179 () Unit!40099)

(assert (=> b!1209961 (= e!687179 e!687174)))

(declare-fun b!1209962 () Bool)

(declare-fun e!687182 () Bool)

(assert (=> b!1209962 (= e!687181 (not e!687182))))

(declare-fun res!804079 () Bool)

(assert (=> b!1209962 (=> res!804079 e!687182)))

(assert (=> b!1209962 (= res!804079 (bvsgt from!1455 i!673))))

(assert (=> b!1209962 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!549284 () Unit!40099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78203 (_ BitVec 64) (_ BitVec 32)) Unit!40099)

(assert (=> b!1209962 (= lt!549284 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1209963 () Bool)

(assert (=> b!1209963 (= e!687168 (= call!59507 call!59502))))

(declare-fun b!1209964 () Bool)

(declare-fun Unit!40102 () Unit!40099)

(assert (=> b!1209964 (= e!687180 Unit!40102)))

(assert (=> b!1209964 (= lt!549273 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1209964 (= c!119160 (and (not lt!549273) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549282 () Unit!40099)

(assert (=> b!1209964 (= lt!549282 e!687179)))

(declare-fun lt!549289 () Unit!40099)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!592 (array!78203 array!78205 (_ BitVec 32) (_ BitVec 32) V!46073 V!46073 (_ BitVec 64) (_ BitVec 32) Int) Unit!40099)

(assert (=> b!1209964 (= lt!549289 (lemmaListMapContainsThenArrayContainsFrom!592 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119157 () Bool)

(assert (=> b!1209964 (= c!119157 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804078 () Bool)

(assert (=> b!1209964 (= res!804078 e!687172)))

(declare-fun e!687171 () Bool)

(assert (=> b!1209964 (=> (not res!804078) (not e!687171))))

(assert (=> b!1209964 e!687171))

(declare-fun lt!549285 () Unit!40099)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78203 (_ BitVec 32) (_ BitVec 32)) Unit!40099)

(assert (=> b!1209964 (= lt!549285 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1209964 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26587)))

(declare-fun lt!549280 () Unit!40099)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78203 (_ BitVec 64) (_ BitVec 32) List!26590) Unit!40099)

(assert (=> b!1209964 (= lt!549280 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26587))))

(assert (=> b!1209964 false))

(declare-fun b!1209965 () Bool)

(assert (=> b!1209965 (= e!687182 e!687178)))

(declare-fun res!804083 () Bool)

(assert (=> b!1209965 (=> res!804083 e!687178)))

(assert (=> b!1209965 (= res!804083 (not (= from!1455 i!673)))))

(declare-fun lt!549288 () ListLongMap!17757)

(assert (=> b!1209965 (= lt!549288 (getCurrentListMapNoExtraKeys!5327 lt!549277 lt!549276 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3225 (Int (_ BitVec 64)) V!46073)

(assert (=> b!1209965 (= lt!549276 (array!78206 (store (arr!37739 _values!996) i!673 (ValueCellFull!14645 (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38275 _values!996)))))

(declare-fun lt!549278 () ListLongMap!17757)

(assert (=> b!1209965 (= lt!549278 (getCurrentListMapNoExtraKeys!5327 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1209966 () Bool)

(declare-fun Unit!40103 () Unit!40099)

(assert (=> b!1209966 (= e!687180 Unit!40103)))

(declare-fun b!1209967 () Bool)

(assert (=> b!1209967 (= e!687172 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549273) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!59502 () Bool)

(declare-fun call!59508 () Unit!40099)

(assert (=> bm!59502 (= call!59503 call!59508)))

(declare-fun b!1209968 () Bool)

(declare-fun e!687167 () Bool)

(declare-fun mapRes!47932 () Bool)

(assert (=> b!1209968 (= e!687173 (and e!687167 mapRes!47932))))

(declare-fun condMapEmpty!47932 () Bool)

(declare-fun mapDefault!47932 () ValueCell!14645)

