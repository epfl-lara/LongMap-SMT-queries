; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101524 () Bool)

(assert start!101524)

(declare-fun b_free!26311 () Bool)

(declare-fun b_next!26311 () Bool)

(assert (=> start!101524 (= b_free!26311 (not b_next!26311))))

(declare-fun tp!91969 () Bool)

(declare-fun b_and!43829 () Bool)

(assert (=> start!101524 (= tp!91969 b_and!43829)))

(declare-fun b!1220524 () Bool)

(declare-fun res!810756 () Bool)

(declare-fun e!693059 () Bool)

(assert (=> b!1220524 (=> (not res!810756) (not e!693059))))

(declare-datatypes ((array!78809 0))(
  ( (array!78810 (arr!38034 (Array (_ BitVec 32) (_ BitVec 64))) (size!38570 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78809)

(declare-datatypes ((List!26838 0))(
  ( (Nil!26835) (Cons!26834 (h!28043 (_ BitVec 64)) (t!40129 List!26838)) )
))
(declare-fun arrayNoDuplicates!0 (array!78809 (_ BitVec 32) List!26838) Bool)

(assert (=> b!1220524 (= res!810756 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26835))))

(declare-fun mapIsEmpty!48412 () Bool)

(declare-fun mapRes!48412 () Bool)

(assert (=> mapIsEmpty!48412 mapRes!48412))

(declare-fun b!1220525 () Bool)

(declare-fun e!693062 () Bool)

(declare-fun e!693063 () Bool)

(assert (=> b!1220525 (= e!693062 e!693063)))

(declare-fun res!810759 () Bool)

(assert (=> b!1220525 (=> res!810759 e!693063)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1220525 (= res!810759 (not (= (select (arr!38034 _keys!1208) from!1455) k!934)))))

(declare-fun b!1220526 () Bool)

(declare-fun e!693070 () Bool)

(declare-fun e!693069 () Bool)

(assert (=> b!1220526 (= e!693070 e!693069)))

(declare-fun res!810761 () Bool)

(assert (=> b!1220526 (=> res!810761 e!693069)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220526 (= res!810761 (not (validKeyInArray!0 (select (arr!38034 _keys!1208) from!1455))))))

(declare-datatypes ((V!46481 0))(
  ( (V!46482 (val!15564 Int)) )
))
(declare-datatypes ((tuple2!20038 0))(
  ( (tuple2!20039 (_1!10030 (_ BitVec 64)) (_2!10030 V!46481)) )
))
(declare-datatypes ((List!26839 0))(
  ( (Nil!26836) (Cons!26835 (h!28044 tuple2!20038) (t!40130 List!26839)) )
))
(declare-datatypes ((ListLongMap!18007 0))(
  ( (ListLongMap!18008 (toList!9019 List!26839)) )
))
(declare-fun lt!555060 () ListLongMap!18007)

(declare-fun lt!555054 () ListLongMap!18007)

(assert (=> b!1220526 (= lt!555060 lt!555054)))

(declare-fun lt!555053 () ListLongMap!18007)

(declare-fun -!1928 (ListLongMap!18007 (_ BitVec 64)) ListLongMap!18007)

(assert (=> b!1220526 (= lt!555054 (-!1928 lt!555053 k!934))))

(declare-fun zeroValue!944 () V!46481)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555058 () array!78809)

(declare-fun minValue!944 () V!46481)

(declare-datatypes ((ValueCell!14798 0))(
  ( (ValueCellFull!14798 (v!18222 V!46481)) (EmptyCell!14798) )
))
(declare-datatypes ((array!78811 0))(
  ( (array!78812 (arr!38035 (Array (_ BitVec 32) ValueCell!14798)) (size!38571 (_ BitVec 32))) )
))
(declare-fun lt!555061 () array!78811)

(declare-fun getCurrentListMapNoExtraKeys!5442 (array!78809 array!78811 (_ BitVec 32) (_ BitVec 32) V!46481 V!46481 (_ BitVec 32) Int) ListLongMap!18007)

(assert (=> b!1220526 (= lt!555060 (getCurrentListMapNoExtraKeys!5442 lt!555058 lt!555061 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78811)

(assert (=> b!1220526 (= lt!555053 (getCurrentListMapNoExtraKeys!5442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40440 0))(
  ( (Unit!40441) )
))
(declare-fun lt!555062 () Unit!40440)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1135 (array!78809 array!78811 (_ BitVec 32) (_ BitVec 32) V!46481 V!46481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40440)

(assert (=> b!1220526 (= lt!555062 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1135 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220527 () Bool)

(declare-fun arrayContainsKey!0 (array!78809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220527 (= e!693063 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1220528 () Bool)

(declare-fun res!810750 () Bool)

(assert (=> b!1220528 (=> (not res!810750) (not e!693059))))

(assert (=> b!1220528 (= res!810750 (= (select (arr!38034 _keys!1208) i!673) k!934))))

(declare-fun b!1220529 () Bool)

(declare-fun e!693060 () Bool)

(declare-fun tp_is_empty!31015 () Bool)

(assert (=> b!1220529 (= e!693060 tp_is_empty!31015)))

(declare-fun b!1220530 () Bool)

(declare-fun e!693061 () Bool)

(assert (=> b!1220530 (= e!693061 e!693070)))

(declare-fun res!810747 () Bool)

(assert (=> b!1220530 (=> res!810747 e!693070)))

(assert (=> b!1220530 (= res!810747 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!555063 () ListLongMap!18007)

(assert (=> b!1220530 (= lt!555063 (getCurrentListMapNoExtraKeys!5442 lt!555058 lt!555061 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555052 () V!46481)

(assert (=> b!1220530 (= lt!555061 (array!78812 (store (arr!38035 _values!996) i!673 (ValueCellFull!14798 lt!555052)) (size!38571 _values!996)))))

(declare-fun dynLambda!3323 (Int (_ BitVec 64)) V!46481)

(assert (=> b!1220530 (= lt!555052 (dynLambda!3323 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555055 () ListLongMap!18007)

(assert (=> b!1220530 (= lt!555055 (getCurrentListMapNoExtraKeys!5442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220531 () Bool)

(declare-fun e!693064 () Bool)

(assert (=> b!1220531 (= e!693064 (and e!693060 mapRes!48412))))

(declare-fun condMapEmpty!48412 () Bool)

(declare-fun mapDefault!48412 () ValueCell!14798)

