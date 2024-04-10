; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98454 () Bool)

(assert start!98454)

(declare-fun b_free!24059 () Bool)

(declare-fun b_next!24059 () Bool)

(assert (=> start!98454 (= b_free!24059 (not b_next!24059))))

(declare-fun tp!84887 () Bool)

(declare-fun b_and!38967 () Bool)

(assert (=> start!98454 (= tp!84887 b_and!38967)))

(declare-datatypes ((V!43245 0))(
  ( (V!43246 (val!14351 Int)) )
))
(declare-fun zeroValue!944 () V!43245)

(declare-fun bm!50247 () Bool)

(declare-datatypes ((tuple2!18128 0))(
  ( (tuple2!18129 (_1!9075 (_ BitVec 64)) (_2!9075 V!43245)) )
))
(declare-datatypes ((List!24885 0))(
  ( (Nil!24882) (Cons!24881 (h!26090 tuple2!18128) (t!35936 List!24885)) )
))
(declare-datatypes ((ListLongMap!16097 0))(
  ( (ListLongMap!16098 (toList!8064 List!24885)) )
))
(declare-fun call!50253 () ListLongMap!16097)

(declare-fun lt!506184 () ListLongMap!16097)

(declare-fun lt!506192 () ListLongMap!16097)

(declare-fun c!111393 () Bool)

(declare-fun c!111390 () Bool)

(declare-fun minValue!944 () V!43245)

(declare-fun +!3499 (ListLongMap!16097 tuple2!18128) ListLongMap!16097)

(assert (=> bm!50247 (= call!50253 (+!3499 (ite c!111390 lt!506192 lt!506184) (ite c!111390 (tuple2!18129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111393 (tuple2!18129 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1137934 () Bool)

(declare-fun e!647502 () Bool)

(declare-fun e!647501 () Bool)

(assert (=> b!1137934 (= e!647502 e!647501)))

(declare-fun res!759208 () Bool)

(assert (=> b!1137934 (=> (not res!759208) (not e!647501))))

(declare-datatypes ((array!74037 0))(
  ( (array!74038 (arr!35669 (Array (_ BitVec 32) (_ BitVec 64))) (size!36205 (_ BitVec 32))) )
))
(declare-fun lt!506191 () array!74037)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74037 (_ BitVec 32)) Bool)

(assert (=> b!1137934 (= res!759208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506191 mask!1564))))

(declare-fun _keys!1208 () array!74037)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137934 (= lt!506191 (array!74038 (store (arr!35669 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36205 _keys!1208)))))

(declare-fun b!1137935 () Bool)

(declare-fun e!647503 () Bool)

(declare-fun tp_is_empty!28589 () Bool)

(assert (=> b!1137935 (= e!647503 tp_is_empty!28589)))

(declare-fun call!50257 () ListLongMap!16097)

(declare-fun bm!50248 () Bool)

(declare-fun call!50251 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6602 (ListLongMap!16097 (_ BitVec 64)) Bool)

(assert (=> bm!50248 (= call!50251 (contains!6602 (ite c!111390 lt!506192 call!50257) k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun call!50254 () ListLongMap!16097)

(declare-datatypes ((ValueCell!13585 0))(
  ( (ValueCellFull!13585 (v!16988 V!43245)) (EmptyCell!13585) )
))
(declare-datatypes ((array!74039 0))(
  ( (array!74040 (arr!35670 (Array (_ BitVec 32) ValueCell!13585)) (size!36206 (_ BitVec 32))) )
))
(declare-fun lt!506189 () array!74039)

(declare-fun bm!50249 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4548 (array!74037 array!74039 (_ BitVec 32) (_ BitVec 32) V!43245 V!43245 (_ BitVec 32) Int) ListLongMap!16097)

(assert (=> bm!50249 (= call!50254 (getCurrentListMapNoExtraKeys!4548 lt!506191 lt!506189 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50250 () Bool)

(declare-datatypes ((Unit!37276 0))(
  ( (Unit!37277) )
))
(declare-fun call!50255 () Unit!37276)

(declare-fun call!50250 () Unit!37276)

(assert (=> bm!50250 (= call!50255 call!50250)))

(declare-fun bm!50251 () Bool)

(declare-fun call!50256 () Bool)

(assert (=> bm!50251 (= call!50256 call!50251)))

(declare-fun b!1137937 () Bool)

(declare-fun e!647506 () Unit!37276)

(declare-fun Unit!37278 () Unit!37276)

(assert (=> b!1137937 (= e!647506 Unit!37278)))

(declare-fun bm!50252 () Bool)

(assert (=> bm!50252 (= call!50257 call!50253)))

(declare-fun e!647499 () Bool)

(declare-fun b!1137938 () Bool)

(declare-fun arrayContainsKey!0 (array!74037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137938 (= e!647499 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137939 () Bool)

(assert (=> b!1137939 call!50256))

(declare-fun lt!506188 () Unit!37276)

(assert (=> b!1137939 (= lt!506188 call!50255)))

(assert (=> b!1137939 (= e!647506 lt!506188)))

(declare-fun b!1137940 () Bool)

(declare-fun res!759204 () Bool)

(assert (=> b!1137940 (=> (not res!759204) (not e!647501))))

(declare-datatypes ((List!24886 0))(
  ( (Nil!24883) (Cons!24882 (h!26091 (_ BitVec 64)) (t!35937 List!24886)) )
))
(declare-fun arrayNoDuplicates!0 (array!74037 (_ BitVec 32) List!24886) Bool)

(assert (=> b!1137940 (= res!759204 (arrayNoDuplicates!0 lt!506191 #b00000000000000000000000000000000 Nil!24883))))

(declare-fun b!1137941 () Bool)

(declare-fun e!647507 () Unit!37276)

(declare-fun Unit!37279 () Unit!37276)

(assert (=> b!1137941 (= e!647507 Unit!37279)))

(declare-fun lt!506196 () Bool)

(assert (=> b!1137941 (= lt!506196 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1137941 (= c!111390 (and (not lt!506196) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506186 () Unit!37276)

(declare-fun e!647496 () Unit!37276)

(assert (=> b!1137941 (= lt!506186 e!647496)))

(declare-fun _values!996 () array!74039)

(declare-fun lt!506181 () Unit!37276)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!361 (array!74037 array!74039 (_ BitVec 32) (_ BitVec 32) V!43245 V!43245 (_ BitVec 64) (_ BitVec 32) Int) Unit!37276)

(assert (=> b!1137941 (= lt!506181 (lemmaListMapContainsThenArrayContainsFrom!361 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111392 () Bool)

(assert (=> b!1137941 (= c!111392 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759210 () Bool)

(declare-fun e!647504 () Bool)

(assert (=> b!1137941 (= res!759210 e!647504)))

(assert (=> b!1137941 (=> (not res!759210) (not e!647499))))

(assert (=> b!1137941 e!647499))

(declare-fun lt!506183 () Unit!37276)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74037 (_ BitVec 32) (_ BitVec 32)) Unit!37276)

(assert (=> b!1137941 (= lt!506183 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1137941 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24883)))

(declare-fun lt!506194 () Unit!37276)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74037 (_ BitVec 64) (_ BitVec 32) List!24886) Unit!37276)

(assert (=> b!1137941 (= lt!506194 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24883))))

(assert (=> b!1137941 false))

(declare-fun b!1137942 () Bool)

(declare-fun e!647500 () Bool)

(assert (=> b!1137942 (= e!647500 true)))

(declare-fun lt!506187 () Unit!37276)

(assert (=> b!1137942 (= lt!506187 e!647507)))

(declare-fun c!111394 () Bool)

(assert (=> b!1137942 (= c!111394 (contains!6602 lt!506184 k!934))))

(assert (=> b!1137942 (= lt!506184 (getCurrentListMapNoExtraKeys!4548 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137943 () Bool)

(declare-fun e!647505 () Bool)

(declare-fun mapRes!44708 () Bool)

(assert (=> b!1137943 (= e!647505 (and e!647503 mapRes!44708))))

(declare-fun condMapEmpty!44708 () Bool)

(declare-fun mapDefault!44708 () ValueCell!13585)

