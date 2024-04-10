; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101534 () Bool)

(assert start!101534)

(declare-fun b_free!26321 () Bool)

(declare-fun b_next!26321 () Bool)

(assert (=> start!101534 (= b_free!26321 (not b_next!26321))))

(declare-fun tp!92000 () Bool)

(declare-fun b_and!43849 () Bool)

(assert (=> start!101534 (= tp!92000 b_and!43849)))

(declare-fun b!1220819 () Bool)

(declare-fun e!693242 () Bool)

(declare-fun e!693244 () Bool)

(assert (=> b!1220819 (= e!693242 e!693244)))

(declare-fun res!810997 () Bool)

(assert (=> b!1220819 (=> res!810997 e!693244)))

(declare-datatypes ((array!78829 0))(
  ( (array!78830 (arr!38044 (Array (_ BitVec 32) (_ BitVec 64))) (size!38580 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78829)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220819 (= res!810997 (not (validKeyInArray!0 (select (arr!38044 _keys!1208) from!1455))))))

(declare-datatypes ((V!46493 0))(
  ( (V!46494 (val!15569 Int)) )
))
(declare-datatypes ((tuple2!20044 0))(
  ( (tuple2!20045 (_1!10033 (_ BitVec 64)) (_2!10033 V!46493)) )
))
(declare-datatypes ((List!26845 0))(
  ( (Nil!26842) (Cons!26841 (h!28050 tuple2!20044) (t!40146 List!26845)) )
))
(declare-datatypes ((ListLongMap!18013 0))(
  ( (ListLongMap!18014 (toList!9022 List!26845)) )
))
(declare-fun lt!555232 () ListLongMap!18013)

(declare-fun lt!555239 () ListLongMap!18013)

(assert (=> b!1220819 (= lt!555232 lt!555239)))

(declare-fun lt!555241 () ListLongMap!18013)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1931 (ListLongMap!18013 (_ BitVec 64)) ListLongMap!18013)

(assert (=> b!1220819 (= lt!555239 (-!1931 lt!555241 k!934))))

(declare-fun zeroValue!944 () V!46493)

(declare-fun lt!555236 () array!78829)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!46493)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14803 0))(
  ( (ValueCellFull!14803 (v!18227 V!46493)) (EmptyCell!14803) )
))
(declare-datatypes ((array!78831 0))(
  ( (array!78832 (arr!38045 (Array (_ BitVec 32) ValueCell!14803)) (size!38581 (_ BitVec 32))) )
))
(declare-fun lt!555240 () array!78831)

(declare-fun getCurrentListMapNoExtraKeys!5445 (array!78829 array!78831 (_ BitVec 32) (_ BitVec 32) V!46493 V!46493 (_ BitVec 32) Int) ListLongMap!18013)

(assert (=> b!1220819 (= lt!555232 (getCurrentListMapNoExtraKeys!5445 lt!555236 lt!555240 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78831)

(assert (=> b!1220819 (= lt!555241 (getCurrentListMapNoExtraKeys!5445 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40448 0))(
  ( (Unit!40449) )
))
(declare-fun lt!555235 () Unit!40448)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1138 (array!78829 array!78831 (_ BitVec 32) (_ BitVec 32) V!46493 V!46493 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40448)

(assert (=> b!1220819 (= lt!555235 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1138 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220820 () Bool)

(declare-fun e!693241 () Bool)

(declare-fun e!693249 () Bool)

(assert (=> b!1220820 (= e!693241 (not e!693249))))

(declare-fun res!810993 () Bool)

(assert (=> b!1220820 (=> res!810993 e!693249)))

(assert (=> b!1220820 (= res!810993 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220820 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!555237 () Unit!40448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78829 (_ BitVec 64) (_ BitVec 32)) Unit!40448)

(assert (=> b!1220820 (= lt!555237 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1220821 () Bool)

(declare-fun e!693246 () Bool)

(declare-fun e!693240 () Bool)

(declare-fun mapRes!48427 () Bool)

(assert (=> b!1220821 (= e!693246 (and e!693240 mapRes!48427))))

(declare-fun condMapEmpty!48427 () Bool)

(declare-fun mapDefault!48427 () ValueCell!14803)

