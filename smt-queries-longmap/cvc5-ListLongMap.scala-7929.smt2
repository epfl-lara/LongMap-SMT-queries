; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98414 () Bool)

(assert start!98414)

(declare-fun b_free!24019 () Bool)

(declare-fun b_next!24019 () Bool)

(assert (=> start!98414 (= b_free!24019 (not b_next!24019))))

(declare-fun tp!84767 () Bool)

(declare-fun b_and!38887 () Bool)

(assert (=> start!98414 (= tp!84767 b_and!38887)))

(declare-fun e!646530 () Bool)

(declare-fun b!1136122 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((V!43193 0))(
  ( (V!43194 (val!14331 Int)) )
))
(declare-datatypes ((tuple2!18090 0))(
  ( (tuple2!18091 (_1!9056 (_ BitVec 64)) (_2!9056 V!43193)) )
))
(declare-datatypes ((List!24849 0))(
  ( (Nil!24846) (Cons!24845 (h!26054 tuple2!18090) (t!35860 List!24849)) )
))
(declare-datatypes ((ListLongMap!16059 0))(
  ( (ListLongMap!16060 (toList!8045 List!24849)) )
))
(declare-fun call!49777 () ListLongMap!16059)

(declare-fun call!49771 () ListLongMap!16059)

(declare-fun -!1206 (ListLongMap!16059 (_ BitVec 64)) ListLongMap!16059)

(assert (=> b!1136122 (= e!646530 (= call!49771 (-!1206 call!49777 k!934)))))

(declare-fun b!1136123 () Bool)

(declare-fun e!646521 () Bool)

(declare-fun e!646531 () Bool)

(assert (=> b!1136123 (= e!646521 e!646531)))

(declare-fun res!758304 () Bool)

(assert (=> b!1136123 (=> res!758304 e!646531)))

(declare-datatypes ((array!73959 0))(
  ( (array!73960 (arr!35630 (Array (_ BitVec 32) (_ BitVec 64))) (size!36166 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73959)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1136123 (= res!758304 (not (= (select (arr!35630 _keys!1208) from!1455) k!934)))))

(assert (=> b!1136123 e!646530))

(declare-fun c!111047 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136123 (= c!111047 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43193)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13565 0))(
  ( (ValueCellFull!13565 (v!16968 V!43193)) (EmptyCell!13565) )
))
(declare-datatypes ((array!73961 0))(
  ( (array!73962 (arr!35631 (Array (_ BitVec 32) ValueCell!13565)) (size!36167 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73961)

(declare-fun minValue!944 () V!43193)

(declare-datatypes ((Unit!37209 0))(
  ( (Unit!37210) )
))
(declare-fun lt!505127 () Unit!37209)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!455 (array!73959 array!73961 (_ BitVec 32) (_ BitVec 32) V!43193 V!43193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37209)

(assert (=> b!1136123 (= lt!505127 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!455 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136124 () Bool)

(declare-fun e!646525 () Bool)

(assert (=> b!1136124 (= e!646531 e!646525)))

(declare-fun res!758309 () Bool)

(assert (=> b!1136124 (=> res!758309 e!646525)))

(declare-fun lt!505115 () ListLongMap!16059)

(declare-fun contains!6580 (ListLongMap!16059 (_ BitVec 64)) Bool)

(assert (=> b!1136124 (= res!758309 (not (contains!6580 lt!505115 k!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4529 (array!73959 array!73961 (_ BitVec 32) (_ BitVec 32) V!43193 V!43193 (_ BitVec 32) Int) ListLongMap!16059)

(assert (=> b!1136124 (= lt!505115 (getCurrentListMapNoExtraKeys!4529 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136125 () Bool)

(declare-fun e!646527 () Bool)

(declare-fun e!646535 () Bool)

(assert (=> b!1136125 (= e!646527 (not e!646535))))

(declare-fun res!758308 () Bool)

(assert (=> b!1136125 (=> res!758308 e!646535)))

(assert (=> b!1136125 (= res!758308 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136125 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!505125 () Unit!37209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73959 (_ BitVec 64) (_ BitVec 32)) Unit!37209)

(assert (=> b!1136125 (= lt!505125 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1136126 () Bool)

(declare-fun e!646523 () Bool)

(assert (=> b!1136126 (= e!646523 e!646527)))

(declare-fun res!758306 () Bool)

(assert (=> b!1136126 (=> (not res!758306) (not e!646527))))

(declare-fun lt!505119 () array!73959)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73959 (_ BitVec 32)) Bool)

(assert (=> b!1136126 (= res!758306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505119 mask!1564))))

(assert (=> b!1136126 (= lt!505119 (array!73960 (store (arr!35630 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36166 _keys!1208)))))

(declare-fun b!1136127 () Bool)

(declare-fun res!758314 () Bool)

(assert (=> b!1136127 (=> (not res!758314) (not e!646523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136127 (= res!758314 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44648 () Bool)

(declare-fun mapRes!44648 () Bool)

(declare-fun tp!84768 () Bool)

(declare-fun e!646522 () Bool)

(assert (=> mapNonEmpty!44648 (= mapRes!44648 (and tp!84768 e!646522))))

(declare-fun mapValue!44648 () ValueCell!13565)

(declare-fun mapRest!44648 () (Array (_ BitVec 32) ValueCell!13565))

(declare-fun mapKey!44648 () (_ BitVec 32))

(assert (=> mapNonEmpty!44648 (= (arr!35631 _values!996) (store mapRest!44648 mapKey!44648 mapValue!44648))))

(declare-fun b!1136129 () Bool)

(declare-fun e!646534 () Bool)

(declare-fun tp_is_empty!28549 () Bool)

(assert (=> b!1136129 (= e!646534 tp_is_empty!28549)))

(declare-fun b!1136130 () Bool)

(declare-fun e!646526 () Bool)

(declare-fun lt!505124 () Bool)

(assert (=> b!1136130 (= e!646526 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505124) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!49770 () ListLongMap!16059)

(declare-fun c!111048 () Bool)

(declare-fun bm!49767 () Bool)

(declare-fun lt!505126 () ListLongMap!16059)

(declare-fun c!111045 () Bool)

(declare-fun +!3481 (ListLongMap!16059 tuple2!18090) ListLongMap!16059)

(assert (=> bm!49767 (= call!49770 (+!3481 (ite c!111045 lt!505126 lt!505115) (ite c!111045 (tuple2!18091 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111048 (tuple2!18091 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18091 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1136131 () Bool)

(declare-fun e!646520 () Bool)

(assert (=> b!1136131 (= e!646520 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!49776 () ListLongMap!16059)

(declare-fun bm!49768 () Bool)

(declare-fun call!49774 () Bool)

(assert (=> bm!49768 (= call!49774 (contains!6580 (ite c!111045 lt!505126 call!49776) k!934))))

(declare-fun bm!49769 () Bool)

(assert (=> bm!49769 (= call!49776 call!49770)))

(declare-fun b!1136132 () Bool)

(declare-fun res!758315 () Bool)

(declare-fun e!646528 () Bool)

(assert (=> b!1136132 (=> res!758315 e!646528)))

(declare-datatypes ((List!24850 0))(
  ( (Nil!24847) (Cons!24846 (h!26055 (_ BitVec 64)) (t!35861 List!24850)) )
))
(declare-fun noDuplicate!1601 (List!24850) Bool)

(assert (=> b!1136132 (= res!758315 (not (noDuplicate!1601 Nil!24847)))))

(declare-fun b!1136133 () Bool)

(declare-fun res!758310 () Bool)

(assert (=> b!1136133 (=> (not res!758310) (not e!646527))))

(declare-fun arrayNoDuplicates!0 (array!73959 (_ BitVec 32) List!24850) Bool)

(assert (=> b!1136133 (= res!758310 (arrayNoDuplicates!0 lt!505119 #b00000000000000000000000000000000 Nil!24847))))

(declare-fun b!1136134 () Bool)

(assert (=> b!1136134 (= e!646525 e!646528)))

(declare-fun res!758311 () Bool)

(assert (=> b!1136134 (=> res!758311 e!646528)))

(assert (=> b!1136134 (= res!758311 (or (bvsge (size!36166 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36166 _keys!1208)) (bvsge from!1455 (size!36166 _keys!1208))))))

(assert (=> b!1136134 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24847)))

(declare-fun lt!505129 () Unit!37209)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73959 (_ BitVec 32) (_ BitVec 32)) Unit!37209)

(assert (=> b!1136134 (= lt!505129 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1136134 e!646520))

(declare-fun res!758302 () Bool)

(assert (=> b!1136134 (=> (not res!758302) (not e!646520))))

(assert (=> b!1136134 (= res!758302 e!646526)))

(declare-fun c!111046 () Bool)

(assert (=> b!1136134 (= c!111046 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!505123 () Unit!37209)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!347 (array!73959 array!73961 (_ BitVec 32) (_ BitVec 32) V!43193 V!43193 (_ BitVec 64) (_ BitVec 32) Int) Unit!37209)

(assert (=> b!1136134 (= lt!505123 (lemmaListMapContainsThenArrayContainsFrom!347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505116 () Unit!37209)

(declare-fun e!646533 () Unit!37209)

(assert (=> b!1136134 (= lt!505116 e!646533)))

(assert (=> b!1136134 (= c!111045 (and (not lt!505124) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1136134 (= lt!505124 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1136135 () Bool)

(declare-fun e!646529 () Bool)

(assert (=> b!1136135 (= e!646529 (and e!646534 mapRes!44648))))

(declare-fun condMapEmpty!44648 () Bool)

(declare-fun mapDefault!44648 () ValueCell!13565)

