; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101770 () Bool)

(assert start!101770)

(declare-fun b_free!26459 () Bool)

(declare-fun b_next!26459 () Bool)

(assert (=> start!101770 (= b_free!26459 (not b_next!26459))))

(declare-fun tp!92423 () Bool)

(declare-fun b_and!44179 () Bool)

(assert (=> start!101770 (= tp!92423 b_and!44179)))

(declare-fun b!1225651 () Bool)

(declare-fun e!696123 () Bool)

(declare-fun e!696117 () Bool)

(assert (=> b!1225651 (= e!696123 (not e!696117))))

(declare-fun res!814522 () Bool)

(assert (=> b!1225651 (=> res!814522 e!696117)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225651 (= res!814522 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!79105 0))(
  ( (array!79106 (arr!38179 (Array (_ BitVec 32) (_ BitVec 64))) (size!38715 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79105)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225651 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40624 0))(
  ( (Unit!40625) )
))
(declare-fun lt!558525 () Unit!40624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79105 (_ BitVec 64) (_ BitVec 32)) Unit!40624)

(assert (=> b!1225651 (= lt!558525 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1225652 () Bool)

(declare-fun res!814519 () Bool)

(declare-fun e!696119 () Bool)

(assert (=> b!1225652 (=> (not res!814519) (not e!696119))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225652 (= res!814519 (validMask!0 mask!1564))))

(declare-fun b!1225653 () Bool)

(declare-fun e!696122 () Bool)

(declare-fun tp_is_empty!31163 () Bool)

(assert (=> b!1225653 (= e!696122 tp_is_empty!31163)))

(declare-fun b!1225654 () Bool)

(declare-fun e!696121 () Bool)

(assert (=> b!1225654 (= e!696121 tp_is_empty!31163)))

(declare-fun mapIsEmpty!48643 () Bool)

(declare-fun mapRes!48643 () Bool)

(assert (=> mapIsEmpty!48643 mapRes!48643))

(declare-fun b!1225655 () Bool)

(declare-fun e!696124 () Bool)

(assert (=> b!1225655 (= e!696117 e!696124)))

(declare-fun res!814521 () Bool)

(assert (=> b!1225655 (=> res!814521 e!696124)))

(assert (=> b!1225655 (= res!814521 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46677 0))(
  ( (V!46678 (val!15638 Int)) )
))
(declare-datatypes ((tuple2!20158 0))(
  ( (tuple2!20159 (_1!10090 (_ BitVec 64)) (_2!10090 V!46677)) )
))
(declare-datatypes ((List!26959 0))(
  ( (Nil!26956) (Cons!26955 (h!28164 tuple2!20158) (t!40398 List!26959)) )
))
(declare-datatypes ((ListLongMap!18127 0))(
  ( (ListLongMap!18128 (toList!9079 List!26959)) )
))
(declare-fun lt!558529 () ListLongMap!18127)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!558530 () array!79105)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46677)

(declare-datatypes ((ValueCell!14872 0))(
  ( (ValueCellFull!14872 (v!18300 V!46677)) (EmptyCell!14872) )
))
(declare-datatypes ((array!79107 0))(
  ( (array!79108 (arr!38180 (Array (_ BitVec 32) ValueCell!14872)) (size!38716 (_ BitVec 32))) )
))
(declare-fun lt!558527 () array!79107)

(declare-fun zeroValue!944 () V!46677)

(declare-fun getCurrentListMapNoExtraKeys!5498 (array!79105 array!79107 (_ BitVec 32) (_ BitVec 32) V!46677 V!46677 (_ BitVec 32) Int) ListLongMap!18127)

(assert (=> b!1225655 (= lt!558529 (getCurrentListMapNoExtraKeys!5498 lt!558530 lt!558527 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!79107)

(declare-fun dynLambda!3369 (Int (_ BitVec 64)) V!46677)

(assert (=> b!1225655 (= lt!558527 (array!79108 (store (arr!38180 _values!996) i!673 (ValueCellFull!14872 (dynLambda!3369 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38716 _values!996)))))

(declare-fun lt!558526 () ListLongMap!18127)

(assert (=> b!1225655 (= lt!558526 (getCurrentListMapNoExtraKeys!5498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225656 () Bool)

(declare-fun res!814515 () Bool)

(assert (=> b!1225656 (=> (not res!814515) (not e!696119))))

(assert (=> b!1225656 (= res!814515 (and (= (size!38716 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38715 _keys!1208) (size!38716 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225657 () Bool)

(assert (=> b!1225657 (= e!696124 true)))

(declare-fun -!1978 (ListLongMap!18127 (_ BitVec 64)) ListLongMap!18127)

(assert (=> b!1225657 (= (getCurrentListMapNoExtraKeys!5498 lt!558530 lt!558527 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1978 (getCurrentListMapNoExtraKeys!5498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!558528 () Unit!40624)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1184 (array!79105 array!79107 (_ BitVec 32) (_ BitVec 32) V!46677 V!46677 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40624)

(assert (=> b!1225657 (= lt!558528 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1184 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225658 () Bool)

(declare-fun e!696120 () Bool)

(assert (=> b!1225658 (= e!696120 (and e!696122 mapRes!48643))))

(declare-fun condMapEmpty!48643 () Bool)

(declare-fun mapDefault!48643 () ValueCell!14872)

