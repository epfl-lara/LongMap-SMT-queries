; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100012 () Bool)

(assert start!100012)

(declare-fun b_free!25591 () Bool)

(declare-fun b_next!25591 () Bool)

(assert (=> start!100012 (= b_free!25591 (not b_next!25591))))

(declare-fun tp!89486 () Bool)

(declare-fun b_and!42049 () Bool)

(assert (=> start!100012 (= tp!89486 b_and!42049)))

(declare-fun b!1191562 () Bool)

(declare-fun res!792573 () Bool)

(declare-fun e!677333 () Bool)

(assert (=> b!1191562 (=> (not res!792573) (not e!677333))))

(declare-datatypes ((array!77033 0))(
  ( (array!77034 (arr!37166 (Array (_ BitVec 32) (_ BitVec 64))) (size!37702 (_ BitVec 32))) )
))
(declare-fun lt!541884 () array!77033)

(declare-datatypes ((List!26173 0))(
  ( (Nil!26170) (Cons!26169 (h!27378 (_ BitVec 64)) (t!38756 List!26173)) )
))
(declare-fun arrayNoDuplicates!0 (array!77033 (_ BitVec 32) List!26173) Bool)

(assert (=> b!1191562 (= res!792573 (arrayNoDuplicates!0 lt!541884 #b00000000000000000000000000000000 Nil!26170))))

(declare-fun b!1191563 () Bool)

(declare-fun res!792580 () Bool)

(declare-fun e!677332 () Bool)

(assert (=> b!1191563 (=> (not res!792580) (not e!677332))))

(declare-fun _keys!1208 () array!77033)

(assert (=> b!1191563 (= res!792580 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26170))))

(declare-fun b!1191564 () Bool)

(declare-fun res!792579 () Bool)

(assert (=> b!1191564 (=> (not res!792579) (not e!677332))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1191564 (= res!792579 (= (select (arr!37166 _keys!1208) i!673) k!934))))

(declare-fun b!1191565 () Bool)

(declare-fun e!677331 () Bool)

(declare-fun tp_is_empty!30121 () Bool)

(assert (=> b!1191565 (= e!677331 tp_is_empty!30121)))

(declare-fun b!1191566 () Bool)

(declare-fun e!677336 () Bool)

(assert (=> b!1191566 (= e!677336 tp_is_empty!30121)))

(declare-fun b!1191567 () Bool)

(declare-fun e!677334 () Bool)

(assert (=> b!1191567 (= e!677333 (not e!677334))))

(declare-fun res!792578 () Bool)

(assert (=> b!1191567 (=> res!792578 e!677334)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1191567 (= res!792578 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191567 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39526 0))(
  ( (Unit!39527) )
))
(declare-fun lt!541883 () Unit!39526)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77033 (_ BitVec 64) (_ BitVec 32)) Unit!39526)

(assert (=> b!1191567 (= lt!541883 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1191568 () Bool)

(declare-fun res!792581 () Bool)

(assert (=> b!1191568 (=> (not res!792581) (not e!677332))))

(assert (=> b!1191568 (= res!792581 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37702 _keys!1208))))))

(declare-fun b!1191569 () Bool)

(declare-fun res!792574 () Bool)

(assert (=> b!1191569 (=> (not res!792574) (not e!677332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191569 (= res!792574 (validKeyInArray!0 k!934))))

(declare-fun b!1191570 () Bool)

(declare-fun res!792583 () Bool)

(assert (=> b!1191570 (=> (not res!792583) (not e!677332))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45289 0))(
  ( (V!45290 (val!15117 Int)) )
))
(declare-datatypes ((ValueCell!14351 0))(
  ( (ValueCellFull!14351 (v!17755 V!45289)) (EmptyCell!14351) )
))
(declare-datatypes ((array!77035 0))(
  ( (array!77036 (arr!37167 (Array (_ BitVec 32) ValueCell!14351)) (size!37703 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77035)

(assert (=> b!1191570 (= res!792583 (and (= (size!37703 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37702 _keys!1208) (size!37703 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191571 () Bool)

(assert (=> b!1191571 (= e!677332 e!677333)))

(declare-fun res!792575 () Bool)

(assert (=> b!1191571 (=> (not res!792575) (not e!677333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77033 (_ BitVec 32)) Bool)

(assert (=> b!1191571 (= res!792575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541884 mask!1564))))

(assert (=> b!1191571 (= lt!541884 (array!77034 (store (arr!37166 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37702 _keys!1208)))))

(declare-fun res!792572 () Bool)

(assert (=> start!100012 (=> (not res!792572) (not e!677332))))

(assert (=> start!100012 (= res!792572 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37702 _keys!1208))))))

(assert (=> start!100012 e!677332))

(assert (=> start!100012 tp_is_empty!30121))

(declare-fun array_inv!28342 (array!77033) Bool)

(assert (=> start!100012 (array_inv!28342 _keys!1208)))

(assert (=> start!100012 true))

(assert (=> start!100012 tp!89486))

(declare-fun e!677337 () Bool)

(declare-fun array_inv!28343 (array!77035) Bool)

(assert (=> start!100012 (and (array_inv!28343 _values!996) e!677337)))

(declare-fun b!1191572 () Bool)

(declare-fun e!677338 () Bool)

(assert (=> b!1191572 (= e!677338 true)))

(declare-fun zeroValue!944 () V!45289)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541879 () array!77035)

(declare-fun minValue!944 () V!45289)

(declare-datatypes ((tuple2!19430 0))(
  ( (tuple2!19431 (_1!9726 (_ BitVec 64)) (_2!9726 V!45289)) )
))
(declare-datatypes ((List!26174 0))(
  ( (Nil!26171) (Cons!26170 (h!27379 tuple2!19430) (t!38757 List!26174)) )
))
(declare-datatypes ((ListLongMap!17399 0))(
  ( (ListLongMap!17400 (toList!8715 List!26174)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5156 (array!77033 array!77035 (_ BitVec 32) (_ BitVec 32) V!45289 V!45289 (_ BitVec 32) Int) ListLongMap!17399)

(declare-fun -!1740 (ListLongMap!17399 (_ BitVec 64)) ListLongMap!17399)

(assert (=> b!1191572 (= (getCurrentListMapNoExtraKeys!5156 lt!541884 lt!541879 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1740 (getCurrentListMapNoExtraKeys!5156 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!541882 () Unit!39526)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!949 (array!77033 array!77035 (_ BitVec 32) (_ BitVec 32) V!45289 V!45289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39526)

(assert (=> b!1191572 (= lt!541882 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!949 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191573 () Bool)

(declare-fun res!792577 () Bool)

(assert (=> b!1191573 (=> (not res!792577) (not e!677332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191573 (= res!792577 (validMask!0 mask!1564))))

(declare-fun b!1191574 () Bool)

(declare-fun mapRes!47009 () Bool)

(assert (=> b!1191574 (= e!677337 (and e!677331 mapRes!47009))))

(declare-fun condMapEmpty!47009 () Bool)

(declare-fun mapDefault!47009 () ValueCell!14351)

