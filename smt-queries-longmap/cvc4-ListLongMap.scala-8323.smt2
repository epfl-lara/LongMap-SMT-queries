; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101290 () Bool)

(assert start!101290)

(declare-fun b_free!26213 () Bool)

(declare-fun b_next!26213 () Bool)

(assert (=> start!101290 (= b_free!26213 (not b_next!26213))))

(declare-fun tp!91660 () Bool)

(declare-fun b_and!43543 () Bool)

(assert (=> start!101290 (= tp!91660 b_and!43543)))

(declare-fun b!1217030 () Bool)

(declare-fun e!690941 () Bool)

(declare-fun e!690944 () Bool)

(assert (=> b!1217030 (= e!690941 e!690944)))

(declare-fun res!808216 () Bool)

(assert (=> b!1217030 (=> res!808216 e!690944)))

(declare-datatypes ((array!78605 0))(
  ( (array!78606 (arr!37937 (Array (_ BitVec 32) (_ BitVec 64))) (size!38473 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78605)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217030 (= res!808216 (not (validKeyInArray!0 (select (arr!37937 _keys!1208) from!1455))))))

(declare-datatypes ((V!46349 0))(
  ( (V!46350 (val!15515 Int)) )
))
(declare-fun zeroValue!944 () V!46349)

(declare-datatypes ((ValueCell!14749 0))(
  ( (ValueCellFull!14749 (v!18168 V!46349)) (EmptyCell!14749) )
))
(declare-datatypes ((array!78607 0))(
  ( (array!78608 (arr!37938 (Array (_ BitVec 32) ValueCell!14749)) (size!38474 (_ BitVec 32))) )
))
(declare-fun lt!553117 () array!78607)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun _values!996 () array!78607)

(declare-fun minValue!944 () V!46349)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!553120 () array!78605)

(declare-datatypes ((tuple2!19946 0))(
  ( (tuple2!19947 (_1!9984 (_ BitVec 64)) (_2!9984 V!46349)) )
))
(declare-datatypes ((List!26750 0))(
  ( (Nil!26747) (Cons!26746 (h!27955 tuple2!19946) (t!39943 List!26750)) )
))
(declare-datatypes ((ListLongMap!17915 0))(
  ( (ListLongMap!17916 (toList!8973 List!26750)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5400 (array!78605 array!78607 (_ BitVec 32) (_ BitVec 32) V!46349 V!46349 (_ BitVec 32) Int) ListLongMap!17915)

(declare-fun -!1890 (ListLongMap!17915 (_ BitVec 64)) ListLongMap!17915)

(assert (=> b!1217030 (= (getCurrentListMapNoExtraKeys!5400 lt!553120 lt!553117 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1890 (getCurrentListMapNoExtraKeys!5400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40352 0))(
  ( (Unit!40353) )
))
(declare-fun lt!553122 () Unit!40352)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1097 (array!78605 array!78607 (_ BitVec 32) (_ BitVec 32) V!46349 V!46349 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40352)

(assert (=> b!1217030 (= lt!553122 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1097 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217031 () Bool)

(declare-fun res!808222 () Bool)

(declare-fun e!690939 () Bool)

(assert (=> b!1217031 (=> (not res!808222) (not e!690939))))

(declare-datatypes ((List!26751 0))(
  ( (Nil!26748) (Cons!26747 (h!27956 (_ BitVec 64)) (t!39944 List!26751)) )
))
(declare-fun arrayNoDuplicates!0 (array!78605 (_ BitVec 32) List!26751) Bool)

(assert (=> b!1217031 (= res!808222 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26748))))

(declare-fun mapNonEmpty!48250 () Bool)

(declare-fun mapRes!48250 () Bool)

(declare-fun tp!91661 () Bool)

(declare-fun e!690940 () Bool)

(assert (=> mapNonEmpty!48250 (= mapRes!48250 (and tp!91661 e!690940))))

(declare-fun mapRest!48250 () (Array (_ BitVec 32) ValueCell!14749))

(declare-fun mapKey!48250 () (_ BitVec 32))

(declare-fun mapValue!48250 () ValueCell!14749)

(assert (=> mapNonEmpty!48250 (= (arr!37938 _values!996) (store mapRest!48250 mapKey!48250 mapValue!48250))))

(declare-fun b!1217032 () Bool)

(declare-fun e!690943 () Bool)

(declare-fun e!690946 () Bool)

(assert (=> b!1217032 (= e!690943 (and e!690946 mapRes!48250))))

(declare-fun condMapEmpty!48250 () Bool)

(declare-fun mapDefault!48250 () ValueCell!14749)

