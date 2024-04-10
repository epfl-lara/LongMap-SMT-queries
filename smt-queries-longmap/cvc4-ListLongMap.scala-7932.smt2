; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98436 () Bool)

(assert start!98436)

(declare-fun b_free!24041 () Bool)

(declare-fun b_next!24041 () Bool)

(assert (=> start!98436 (= b_free!24041 (not b_next!24041))))

(declare-fun tp!84833 () Bool)

(declare-fun b_and!38931 () Bool)

(assert (=> start!98436 (= tp!84833 b_and!38931)))

(declare-fun b!1137133 () Bool)

(declare-datatypes ((Unit!37246 0))(
  ( (Unit!37247) )
))
(declare-fun e!647073 () Unit!37246)

(declare-fun Unit!37248 () Unit!37246)

(assert (=> b!1137133 (= e!647073 Unit!37248)))

(declare-fun lt!505694 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1137133 (= lt!505694 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111230 () Bool)

(assert (=> b!1137133 (= c!111230 (and (not lt!505694) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505703 () Unit!37246)

(declare-fun e!647070 () Unit!37246)

(assert (=> b!1137133 (= lt!505703 e!647070)))

(declare-datatypes ((V!43221 0))(
  ( (V!43222 (val!14342 Int)) )
))
(declare-fun zeroValue!944 () V!43221)

(declare-datatypes ((array!74003 0))(
  ( (array!74004 (arr!35652 (Array (_ BitVec 32) (_ BitVec 64))) (size!36188 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74003)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!505701 () Unit!37246)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13576 0))(
  ( (ValueCellFull!13576 (v!16979 V!43221)) (EmptyCell!13576) )
))
(declare-datatypes ((array!74005 0))(
  ( (array!74006 (arr!35653 (Array (_ BitVec 32) ValueCell!13576)) (size!36189 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74005)

(declare-fun minValue!944 () V!43221)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!355 (array!74003 array!74005 (_ BitVec 32) (_ BitVec 32) V!43221 V!43221 (_ BitVec 64) (_ BitVec 32) Int) Unit!37246)

(assert (=> b!1137133 (= lt!505701 (lemmaListMapContainsThenArrayContainsFrom!355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111228 () Bool)

(assert (=> b!1137133 (= c!111228 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!758828 () Bool)

(declare-fun e!647075 () Bool)

(assert (=> b!1137133 (= res!758828 e!647075)))

(declare-fun e!647065 () Bool)

(assert (=> b!1137133 (=> (not res!758828) (not e!647065))))

(assert (=> b!1137133 e!647065))

(declare-fun lt!505695 () Unit!37246)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74003 (_ BitVec 32) (_ BitVec 32)) Unit!37246)

(assert (=> b!1137133 (= lt!505695 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24870 0))(
  ( (Nil!24867) (Cons!24866 (h!26075 (_ BitVec 64)) (t!35903 List!24870)) )
))
(declare-fun arrayNoDuplicates!0 (array!74003 (_ BitVec 32) List!24870) Bool)

(assert (=> b!1137133 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24867)))

(declare-fun lt!505696 () Unit!37246)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74003 (_ BitVec 64) (_ BitVec 32) List!24870) Unit!37246)

(assert (=> b!1137133 (= lt!505696 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24867))))

(assert (=> b!1137133 false))

(declare-fun b!1137134 () Bool)

(declare-fun arrayContainsKey!0 (array!74003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137134 (= e!647075 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137135 () Bool)

(declare-fun e!647079 () Bool)

(declare-fun tp_is_empty!28571 () Bool)

(assert (=> b!1137135 (= e!647079 tp_is_empty!28571)))

(declare-fun b!1137136 () Bool)

(declare-fun res!758827 () Bool)

(declare-fun e!647078 () Bool)

(assert (=> b!1137136 (=> (not res!758827) (not e!647078))))

(assert (=> b!1137136 (= res!758827 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24867))))

(declare-fun b!1137137 () Bool)

(declare-fun res!758834 () Bool)

(assert (=> b!1137137 (=> (not res!758834) (not e!647078))))

(assert (=> b!1137137 (= res!758834 (and (= (size!36189 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36188 _keys!1208) (size!36189 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1137138 () Bool)

(assert (=> b!1137138 (= e!647065 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50031 () Bool)

(declare-fun call!50035 () Bool)

(declare-fun call!50038 () Bool)

(assert (=> bm!50031 (= call!50035 call!50038)))

(declare-fun b!1137139 () Bool)

(declare-fun e!647077 () Bool)

(declare-fun e!647072 () Bool)

(assert (=> b!1137139 (= e!647077 e!647072)))

(declare-fun res!758835 () Bool)

(assert (=> b!1137139 (=> res!758835 e!647072)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137139 (= res!758835 (not (= from!1455 i!673)))))

(declare-fun lt!505707 () array!74005)

(declare-datatypes ((tuple2!18112 0))(
  ( (tuple2!18113 (_1!9067 (_ BitVec 64)) (_2!9067 V!43221)) )
))
(declare-datatypes ((List!24871 0))(
  ( (Nil!24868) (Cons!24867 (h!26076 tuple2!18112) (t!35904 List!24871)) )
))
(declare-datatypes ((ListLongMap!16081 0))(
  ( (ListLongMap!16082 (toList!8056 List!24871)) )
))
(declare-fun lt!505704 () ListLongMap!16081)

(declare-fun lt!505710 () array!74003)

(declare-fun getCurrentListMapNoExtraKeys!4540 (array!74003 array!74005 (_ BitVec 32) (_ BitVec 32) V!43221 V!43221 (_ BitVec 32) Int) ListLongMap!16081)

(assert (=> b!1137139 (= lt!505704 (getCurrentListMapNoExtraKeys!4540 lt!505710 lt!505707 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2596 (Int (_ BitVec 64)) V!43221)

(assert (=> b!1137139 (= lt!505707 (array!74006 (store (arr!35653 _values!996) i!673 (ValueCellFull!13576 (dynLambda!2596 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36189 _values!996)))))

(declare-fun lt!505700 () ListLongMap!16081)

(assert (=> b!1137139 (= lt!505700 (getCurrentListMapNoExtraKeys!4540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1137140 () Bool)

(declare-fun e!647074 () Bool)

(declare-fun mapRes!44681 () Bool)

(assert (=> b!1137140 (= e!647074 (and e!647079 mapRes!44681))))

(declare-fun condMapEmpty!44681 () Bool)

(declare-fun mapDefault!44681 () ValueCell!13576)

