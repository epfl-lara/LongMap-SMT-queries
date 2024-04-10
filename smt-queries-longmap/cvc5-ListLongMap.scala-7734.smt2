; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97132 () Bool)

(assert start!97132)

(declare-fun b!1104850 () Bool)

(declare-fun e!630627 () Bool)

(declare-fun tp_is_empty!27379 () Bool)

(assert (=> b!1104850 (= e!630627 tp_is_empty!27379)))

(declare-fun b!1104851 () Bool)

(declare-fun res!737153 () Bool)

(declare-fun e!630629 () Bool)

(assert (=> b!1104851 (=> (not res!737153) (not e!630629))))

(declare-datatypes ((array!71679 0))(
  ( (array!71680 (arr!34493 (Array (_ BitVec 32) (_ BitVec 64))) (size!35029 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71679)

(declare-datatypes ((List!24064 0))(
  ( (Nil!24061) (Cons!24060 (h!25269 (_ BitVec 64)) (t!34329 List!24064)) )
))
(declare-fun arrayNoDuplicates!0 (array!71679 (_ BitVec 32) List!24064) Bool)

(assert (=> b!1104851 (= res!737153 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24061))))

(declare-fun b!1104852 () Bool)

(declare-fun e!630625 () Bool)

(assert (=> b!1104852 (= e!630625 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104852 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36252 0))(
  ( (Unit!36253) )
))
(declare-fun lt!495209 () Unit!36252)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71679 (_ BitVec 64) (_ BitVec 32)) Unit!36252)

(assert (=> b!1104852 (= lt!495209 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1104853 () Bool)

(declare-fun res!737154 () Bool)

(assert (=> b!1104853 (=> (not res!737154) (not e!630629))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71679 (_ BitVec 32)) Bool)

(assert (=> b!1104853 (= res!737154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!42883 () Bool)

(declare-fun mapRes!42883 () Bool)

(assert (=> mapIsEmpty!42883 mapRes!42883))

(declare-fun b!1104854 () Bool)

(declare-fun res!737155 () Bool)

(assert (=> b!1104854 (=> (not res!737155) (not e!630629))))

(assert (=> b!1104854 (= res!737155 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35029 _keys!1208))))))

(declare-fun mapNonEmpty!42883 () Bool)

(declare-fun tp!81803 () Bool)

(declare-fun e!630626 () Bool)

(assert (=> mapNonEmpty!42883 (= mapRes!42883 (and tp!81803 e!630626))))

(declare-fun mapKey!42883 () (_ BitVec 32))

(declare-datatypes ((V!41633 0))(
  ( (V!41634 (val!13746 Int)) )
))
(declare-datatypes ((ValueCell!12980 0))(
  ( (ValueCellFull!12980 (v!16379 V!41633)) (EmptyCell!12980) )
))
(declare-fun mapRest!42883 () (Array (_ BitVec 32) ValueCell!12980))

(declare-datatypes ((array!71681 0))(
  ( (array!71682 (arr!34494 (Array (_ BitVec 32) ValueCell!12980)) (size!35030 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71681)

(declare-fun mapValue!42883 () ValueCell!12980)

(assert (=> mapNonEmpty!42883 (= (arr!34494 _values!996) (store mapRest!42883 mapKey!42883 mapValue!42883))))

(declare-fun b!1104855 () Bool)

(declare-fun res!737157 () Bool)

(assert (=> b!1104855 (=> (not res!737157) (not e!630629))))

(assert (=> b!1104855 (= res!737157 (= (select (arr!34493 _keys!1208) i!673) k!934))))

(declare-fun b!1104857 () Bool)

(assert (=> b!1104857 (= e!630629 e!630625)))

(declare-fun res!737162 () Bool)

(assert (=> b!1104857 (=> (not res!737162) (not e!630625))))

(declare-fun lt!495208 () array!71679)

(assert (=> b!1104857 (= res!737162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495208 mask!1564))))

(assert (=> b!1104857 (= lt!495208 (array!71680 (store (arr!34493 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35029 _keys!1208)))))

(declare-fun b!1104858 () Bool)

(declare-fun res!737161 () Bool)

(assert (=> b!1104858 (=> (not res!737161) (not e!630629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104858 (= res!737161 (validMask!0 mask!1564))))

(declare-fun res!737158 () Bool)

(assert (=> start!97132 (=> (not res!737158) (not e!630629))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97132 (= res!737158 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35029 _keys!1208))))))

(assert (=> start!97132 e!630629))

(declare-fun array_inv!26554 (array!71679) Bool)

(assert (=> start!97132 (array_inv!26554 _keys!1208)))

(assert (=> start!97132 true))

(declare-fun e!630624 () Bool)

(declare-fun array_inv!26555 (array!71681) Bool)

(assert (=> start!97132 (and (array_inv!26555 _values!996) e!630624)))

(declare-fun b!1104856 () Bool)

(declare-fun res!737160 () Bool)

(assert (=> b!1104856 (=> (not res!737160) (not e!630629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104856 (= res!737160 (validKeyInArray!0 k!934))))

(declare-fun b!1104859 () Bool)

(declare-fun res!737156 () Bool)

(assert (=> b!1104859 (=> (not res!737156) (not e!630625))))

(assert (=> b!1104859 (= res!737156 (arrayNoDuplicates!0 lt!495208 #b00000000000000000000000000000000 Nil!24061))))

(declare-fun b!1104860 () Bool)

(assert (=> b!1104860 (= e!630626 tp_is_empty!27379)))

(declare-fun b!1104861 () Bool)

(assert (=> b!1104861 (= e!630624 (and e!630627 mapRes!42883))))

(declare-fun condMapEmpty!42883 () Bool)

(declare-fun mapDefault!42883 () ValueCell!12980)

