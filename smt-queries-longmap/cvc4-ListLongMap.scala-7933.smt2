; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98442 () Bool)

(assert start!98442)

(declare-fun b_free!24047 () Bool)

(declare-fun b_next!24047 () Bool)

(assert (=> start!98442 (= b_free!24047 (not b_next!24047))))

(declare-fun tp!84852 () Bool)

(declare-fun b_and!38943 () Bool)

(assert (=> start!98442 (= tp!84852 b_and!38943)))

(declare-datatypes ((V!43229 0))(
  ( (V!43230 (val!14345 Int)) )
))
(declare-fun zeroValue!944 () V!43229)

(declare-datatypes ((array!74015 0))(
  ( (array!74016 (arr!35658 (Array (_ BitVec 32) (_ BitVec 64))) (size!36194 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74015)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!50103 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13579 0))(
  ( (ValueCellFull!13579 (v!16982 V!43229)) (EmptyCell!13579) )
))
(declare-datatypes ((array!74017 0))(
  ( (array!74018 (arr!35659 (Array (_ BitVec 32) ValueCell!13579)) (size!36195 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74017)

(declare-fun minValue!944 () V!43229)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!18118 0))(
  ( (tuple2!18119 (_1!9070 (_ BitVec 64)) (_2!9070 V!43229)) )
))
(declare-datatypes ((List!24876 0))(
  ( (Nil!24873) (Cons!24872 (h!26081 tuple2!18118) (t!35915 List!24876)) )
))
(declare-datatypes ((ListLongMap!16087 0))(
  ( (ListLongMap!16088 (toList!8059 List!24876)) )
))
(declare-fun call!50107 () ListLongMap!16087)

(declare-fun getCurrentListMapNoExtraKeys!4543 (array!74015 array!74017 (_ BitVec 32) (_ BitVec 32) V!43229 V!43229 (_ BitVec 32) Int) ListLongMap!16087)

(assert (=> bm!50103 (= call!50107 (getCurrentListMapNoExtraKeys!4543 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50104 () Bool)

(declare-fun call!50108 () ListLongMap!16087)

(declare-fun call!50113 () ListLongMap!16087)

(assert (=> bm!50104 (= call!50108 call!50113)))

(declare-fun b!1137400 () Bool)

(declare-fun res!758955 () Bool)

(declare-fun e!647219 () Bool)

(assert (=> b!1137400 (=> (not res!758955) (not e!647219))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1137400 (= res!758955 (= (select (arr!35658 _keys!1208) i!673) k!934))))

(declare-fun b!1137401 () Bool)

(declare-fun res!758954 () Bool)

(assert (=> b!1137401 (=> (not res!758954) (not e!647219))))

(assert (=> b!1137401 (= res!758954 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36194 _keys!1208))))))

(declare-fun res!758953 () Bool)

(assert (=> start!98442 (=> (not res!758953) (not e!647219))))

(assert (=> start!98442 (= res!758953 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36194 _keys!1208))))))

(assert (=> start!98442 e!647219))

(declare-fun tp_is_empty!28577 () Bool)

(assert (=> start!98442 tp_is_empty!28577))

(declare-fun array_inv!27342 (array!74015) Bool)

(assert (=> start!98442 (array_inv!27342 _keys!1208)))

(assert (=> start!98442 true))

(assert (=> start!98442 tp!84852))

(declare-fun e!647221 () Bool)

(declare-fun array_inv!27343 (array!74017) Bool)

(assert (=> start!98442 (and (array_inv!27343 _values!996) e!647221)))

(declare-fun e!647211 () Bool)

(declare-fun b!1137402 () Bool)

(declare-fun arrayContainsKey!0 (array!74015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137402 (= e!647211 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137403 () Bool)

(declare-fun e!647208 () Bool)

(declare-fun call!50109 () ListLongMap!16087)

(assert (=> b!1137403 (= e!647208 (= call!50109 call!50107))))

(declare-fun b!1137404 () Bool)

(declare-fun res!758951 () Bool)

(assert (=> b!1137404 (=> (not res!758951) (not e!647219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74015 (_ BitVec 32)) Bool)

(assert (=> b!1137404 (= res!758951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!50111 () Bool)

(declare-fun c!111285 () Bool)

(declare-fun lt!505855 () ListLongMap!16087)

(declare-fun bm!50105 () Bool)

(declare-fun contains!6597 (ListLongMap!16087 (_ BitVec 64)) Bool)

(assert (=> bm!50105 (= call!50111 (contains!6597 (ite c!111285 lt!505855 call!50108) k!934))))

(declare-fun b!1137405 () Bool)

(declare-fun res!758959 () Bool)

(assert (=> b!1137405 (=> (not res!758959) (not e!647219))))

(declare-datatypes ((List!24877 0))(
  ( (Nil!24874) (Cons!24873 (h!26082 (_ BitVec 64)) (t!35916 List!24877)) )
))
(declare-fun arrayNoDuplicates!0 (array!74015 (_ BitVec 32) List!24877) Bool)

(assert (=> b!1137405 (= res!758959 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24874))))

(declare-fun b!1137406 () Bool)

(declare-fun res!758961 () Bool)

(assert (=> b!1137406 (=> (not res!758961) (not e!647219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137406 (= res!758961 (validKeyInArray!0 k!934))))

(declare-fun lt!505861 () ListLongMap!16087)

(declare-datatypes ((Unit!37258 0))(
  ( (Unit!37259) )
))
(declare-fun call!50112 () Unit!37258)

(declare-fun bm!50106 () Bool)

(declare-fun c!111286 () Bool)

(declare-fun addStillContains!754 (ListLongMap!16087 (_ BitVec 64) V!43229 (_ BitVec 64)) Unit!37258)

(assert (=> bm!50106 (= call!50112 (addStillContains!754 lt!505861 (ite (or c!111285 c!111286) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111285 c!111286) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1137407 () Bool)

(declare-fun e!647220 () Unit!37258)

(declare-fun e!647217 () Unit!37258)

(assert (=> b!1137407 (= e!647220 e!647217)))

(declare-fun c!111283 () Bool)

(declare-fun lt!505856 () Bool)

(assert (=> b!1137407 (= c!111283 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505856))))

(declare-fun b!1137408 () Bool)

(declare-fun res!758960 () Bool)

(assert (=> b!1137408 (=> (not res!758960) (not e!647219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137408 (= res!758960 (validMask!0 mask!1564))))

(declare-fun b!1137409 () Bool)

(declare-fun e!647214 () Bool)

(declare-fun e!647210 () Bool)

(assert (=> b!1137409 (= e!647214 (not e!647210))))

(declare-fun res!758957 () Bool)

(assert (=> b!1137409 (=> res!758957 e!647210)))

(assert (=> b!1137409 (= res!758957 (bvsgt from!1455 i!673))))

(assert (=> b!1137409 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!505860 () Unit!37258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74015 (_ BitVec 64) (_ BitVec 32)) Unit!37258)

(assert (=> b!1137409 (= lt!505860 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1137410 () Bool)

(declare-fun e!647223 () Unit!37258)

(declare-fun Unit!37260 () Unit!37258)

(assert (=> b!1137410 (= e!647223 Unit!37260)))

(declare-fun b!1137411 () Bool)

(declare-fun +!3494 (ListLongMap!16087 tuple2!18118) ListLongMap!16087)

(assert (=> b!1137411 (contains!6597 (+!3494 lt!505855 (tuple2!18119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!505859 () Unit!37258)

(assert (=> b!1137411 (= lt!505859 (addStillContains!754 lt!505855 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1137411 call!50111))

(assert (=> b!1137411 (= lt!505855 call!50113)))

(declare-fun lt!505871 () Unit!37258)

(assert (=> b!1137411 (= lt!505871 call!50112)))

(declare-fun e!647222 () Unit!37258)

(assert (=> b!1137411 (= e!647222 lt!505859)))

(declare-fun bm!50107 () Bool)

(assert (=> bm!50107 (= call!50113 (+!3494 lt!505861 (ite (or c!111285 c!111286) (tuple2!18119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1137412 () Bool)

(declare-fun e!647213 () Bool)

(declare-fun e!647218 () Bool)

(assert (=> b!1137412 (= e!647213 e!647218)))

(declare-fun res!758963 () Bool)

(assert (=> b!1137412 (=> res!758963 e!647218)))

(assert (=> b!1137412 (= res!758963 (not (= (select (arr!35658 _keys!1208) from!1455) k!934)))))

(assert (=> b!1137412 e!647208))

(declare-fun c!111281 () Bool)

(assert (=> b!1137412 (= c!111281 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505869 () Unit!37258)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!463 (array!74015 array!74017 (_ BitVec 32) (_ BitVec 32) V!43229 V!43229 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37258)

(assert (=> b!1137412 (= lt!505869 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44690 () Bool)

(declare-fun mapRes!44690 () Bool)

(assert (=> mapIsEmpty!44690 mapRes!44690))

(declare-fun b!1137413 () Bool)

(declare-fun res!758962 () Bool)

(assert (=> b!1137413 (=> (not res!758962) (not e!647214))))

(declare-fun lt!505870 () array!74015)

(assert (=> b!1137413 (= res!758962 (arrayNoDuplicates!0 lt!505870 #b00000000000000000000000000000000 Nil!24874))))

(declare-fun b!1137414 () Bool)

(declare-fun e!647215 () Bool)

(assert (=> b!1137414 (= e!647221 (and e!647215 mapRes!44690))))

(declare-fun condMapEmpty!44690 () Bool)

(declare-fun mapDefault!44690 () ValueCell!13579)

