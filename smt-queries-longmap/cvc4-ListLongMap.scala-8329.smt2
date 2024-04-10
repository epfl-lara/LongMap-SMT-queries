; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101378 () Bool)

(assert start!101378)

(declare-fun b_free!26249 () Bool)

(declare-fun b_next!26249 () Bool)

(assert (=> start!101378 (= b_free!26249 (not b_next!26249))))

(declare-fun tp!91774 () Bool)

(declare-fun b_and!43651 () Bool)

(assert (=> start!101378 (= tp!91774 b_and!43651)))

(declare-fun b!1218279 () Bool)

(declare-fun res!809097 () Bool)

(declare-fun e!691682 () Bool)

(assert (=> b!1218279 (=> (not res!809097) (not e!691682))))

(declare-datatypes ((array!78681 0))(
  ( (array!78682 (arr!37973 (Array (_ BitVec 32) (_ BitVec 64))) (size!38509 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78681)

(declare-datatypes ((List!26783 0))(
  ( (Nil!26780) (Cons!26779 (h!27988 (_ BitVec 64)) (t!40012 List!26783)) )
))
(declare-fun arrayNoDuplicates!0 (array!78681 (_ BitVec 32) List!26783) Bool)

(assert (=> b!1218279 (= res!809097 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26780))))

(declare-fun b!1218280 () Bool)

(declare-fun e!691677 () Bool)

(declare-fun tp_is_empty!30953 () Bool)

(assert (=> b!1218280 (= e!691677 tp_is_empty!30953)))

(declare-fun mapNonEmpty!48310 () Bool)

(declare-fun mapRes!48310 () Bool)

(declare-fun tp!91775 () Bool)

(declare-fun e!691679 () Bool)

(assert (=> mapNonEmpty!48310 (= mapRes!48310 (and tp!91775 e!691679))))

(declare-fun mapKey!48310 () (_ BitVec 32))

(declare-datatypes ((V!46397 0))(
  ( (V!46398 (val!15533 Int)) )
))
(declare-datatypes ((ValueCell!14767 0))(
  ( (ValueCellFull!14767 (v!18188 V!46397)) (EmptyCell!14767) )
))
(declare-fun mapRest!48310 () (Array (_ BitVec 32) ValueCell!14767))

(declare-datatypes ((array!78683 0))(
  ( (array!78684 (arr!37974 (Array (_ BitVec 32) ValueCell!14767)) (size!38510 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78683)

(declare-fun mapValue!48310 () ValueCell!14767)

(assert (=> mapNonEmpty!48310 (= (arr!37974 _values!996) (store mapRest!48310 mapKey!48310 mapValue!48310))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1218281 () Bool)

(declare-fun e!691675 () Bool)

(declare-fun arrayContainsKey!0 (array!78681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218281 (= e!691675 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1218282 () Bool)

(declare-fun e!691684 () Bool)

(assert (=> b!1218282 (= e!691682 e!691684)))

(declare-fun res!809109 () Bool)

(assert (=> b!1218282 (=> (not res!809109) (not e!691684))))

(declare-fun lt!553804 () array!78681)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78681 (_ BitVec 32)) Bool)

(assert (=> b!1218282 (= res!809109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553804 mask!1564))))

(assert (=> b!1218282 (= lt!553804 (array!78682 (store (arr!37973 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38509 _keys!1208)))))

(declare-fun b!1218283 () Bool)

(declare-fun e!691680 () Bool)

(assert (=> b!1218283 (= e!691684 (not e!691680))))

(declare-fun res!809099 () Bool)

(assert (=> b!1218283 (=> res!809099 e!691680)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218283 (= res!809099 (bvsgt from!1455 i!673))))

(assert (=> b!1218283 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40384 0))(
  ( (Unit!40385) )
))
(declare-fun lt!553806 () Unit!40384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78681 (_ BitVec 64) (_ BitVec 32)) Unit!40384)

(assert (=> b!1218283 (= lt!553806 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1218284 () Bool)

(declare-fun res!809101 () Bool)

(assert (=> b!1218284 (=> (not res!809101) (not e!691684))))

(assert (=> b!1218284 (= res!809101 (arrayNoDuplicates!0 lt!553804 #b00000000000000000000000000000000 Nil!26780))))

(declare-fun b!1218285 () Bool)

(declare-fun res!809110 () Bool)

(assert (=> b!1218285 (=> (not res!809110) (not e!691682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218285 (= res!809110 (validMask!0 mask!1564))))

(declare-fun b!1218286 () Bool)

(declare-fun e!691683 () Bool)

(assert (=> b!1218286 (= e!691680 e!691683)))

(declare-fun res!809111 () Bool)

(assert (=> b!1218286 (=> res!809111 e!691683)))

(assert (=> b!1218286 (= res!809111 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46397)

(declare-fun lt!553811 () array!78683)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19980 0))(
  ( (tuple2!19981 (_1!10001 (_ BitVec 64)) (_2!10001 V!46397)) )
))
(declare-datatypes ((List!26784 0))(
  ( (Nil!26781) (Cons!26780 (h!27989 tuple2!19980) (t!40013 List!26784)) )
))
(declare-datatypes ((ListLongMap!17949 0))(
  ( (ListLongMap!17950 (toList!8990 List!26784)) )
))
(declare-fun lt!553808 () ListLongMap!17949)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46397)

(declare-fun getCurrentListMapNoExtraKeys!5416 (array!78681 array!78683 (_ BitVec 32) (_ BitVec 32) V!46397 V!46397 (_ BitVec 32) Int) ListLongMap!17949)

(assert (=> b!1218286 (= lt!553808 (getCurrentListMapNoExtraKeys!5416 lt!553804 lt!553811 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553812 () V!46397)

(assert (=> b!1218286 (= lt!553811 (array!78684 (store (arr!37974 _values!996) i!673 (ValueCellFull!14767 lt!553812)) (size!38510 _values!996)))))

(declare-fun dynLambda!3300 (Int (_ BitVec 64)) V!46397)

(assert (=> b!1218286 (= lt!553812 (dynLambda!3300 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553807 () ListLongMap!17949)

(assert (=> b!1218286 (= lt!553807 (getCurrentListMapNoExtraKeys!5416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218287 () Bool)

(declare-fun e!691678 () Bool)

(assert (=> b!1218287 (= e!691683 e!691678)))

(declare-fun res!809098 () Bool)

(assert (=> b!1218287 (=> res!809098 e!691678)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218287 (= res!809098 (not (validKeyInArray!0 (select (arr!37973 _keys!1208) from!1455))))))

(declare-fun lt!553810 () ListLongMap!17949)

(declare-fun lt!553803 () ListLongMap!17949)

(assert (=> b!1218287 (= lt!553810 lt!553803)))

(declare-fun lt!553809 () ListLongMap!17949)

(declare-fun -!1905 (ListLongMap!17949 (_ BitVec 64)) ListLongMap!17949)

(assert (=> b!1218287 (= lt!553803 (-!1905 lt!553809 k!934))))

(assert (=> b!1218287 (= lt!553810 (getCurrentListMapNoExtraKeys!5416 lt!553804 lt!553811 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218287 (= lt!553809 (getCurrentListMapNoExtraKeys!5416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553805 () Unit!40384)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1112 (array!78681 array!78683 (_ BitVec 32) (_ BitVec 32) V!46397 V!46397 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40384)

(assert (=> b!1218287 (= lt!553805 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1112 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218288 () Bool)

(declare-fun res!809103 () Bool)

(assert (=> b!1218288 (=> (not res!809103) (not e!691682))))

(assert (=> b!1218288 (= res!809103 (and (= (size!38510 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38509 _keys!1208) (size!38510 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218289 () Bool)

(assert (=> b!1218289 (= e!691679 tp_is_empty!30953)))

(declare-fun b!1218290 () Bool)

(declare-fun e!691681 () Bool)

(assert (=> b!1218290 (= e!691681 (and e!691677 mapRes!48310))))

(declare-fun condMapEmpty!48310 () Bool)

(declare-fun mapDefault!48310 () ValueCell!14767)

