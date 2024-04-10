; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97192 () Bool)

(assert start!97192)

(declare-fun b!1105758 () Bool)

(declare-fun res!737848 () Bool)

(declare-fun e!631065 () Bool)

(assert (=> b!1105758 (=> (not res!737848) (not e!631065))))

(declare-datatypes ((array!71763 0))(
  ( (array!71764 (arr!34534 (Array (_ BitVec 32) (_ BitVec 64))) (size!35070 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71763)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71763 (_ BitVec 32)) Bool)

(assert (=> b!1105758 (= res!737848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105759 () Bool)

(declare-fun e!631063 () Bool)

(declare-fun tp_is_empty!27423 () Bool)

(assert (=> b!1105759 (= e!631063 tp_is_empty!27423)))

(declare-fun b!1105760 () Bool)

(declare-fun res!737841 () Bool)

(assert (=> b!1105760 (=> (not res!737841) (not e!631065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105760 (= res!737841 (validMask!0 mask!1564))))

(declare-fun b!1105761 () Bool)

(declare-fun res!737846 () Bool)

(assert (=> b!1105761 (=> (not res!737846) (not e!631065))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105761 (= res!737846 (= (select (arr!34534 _keys!1208) i!673) k0!934))))

(declare-fun b!1105762 () Bool)

(declare-fun e!631064 () Bool)

(assert (=> b!1105762 (= e!631064 tp_is_empty!27423)))

(declare-fun b!1105763 () Bool)

(declare-fun res!737845 () Bool)

(assert (=> b!1105763 (=> (not res!737845) (not e!631065))))

(declare-datatypes ((List!24080 0))(
  ( (Nil!24077) (Cons!24076 (h!25285 (_ BitVec 64)) (t!34345 List!24080)) )
))
(declare-fun arrayNoDuplicates!0 (array!71763 (_ BitVec 32) List!24080) Bool)

(assert (=> b!1105763 (= res!737845 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24077))))

(declare-fun res!737847 () Bool)

(assert (=> start!97192 (=> (not res!737847) (not e!631065))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97192 (= res!737847 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35070 _keys!1208))))))

(assert (=> start!97192 e!631065))

(declare-fun array_inv!26580 (array!71763) Bool)

(assert (=> start!97192 (array_inv!26580 _keys!1208)))

(assert (=> start!97192 true))

(declare-datatypes ((V!41691 0))(
  ( (V!41692 (val!13768 Int)) )
))
(declare-datatypes ((ValueCell!13002 0))(
  ( (ValueCellFull!13002 (v!16401 V!41691)) (EmptyCell!13002) )
))
(declare-datatypes ((array!71765 0))(
  ( (array!71766 (arr!34535 (Array (_ BitVec 32) ValueCell!13002)) (size!35071 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71765)

(declare-fun e!631061 () Bool)

(declare-fun array_inv!26581 (array!71765) Bool)

(assert (=> start!97192 (and (array_inv!26581 _values!996) e!631061)))

(declare-fun mapNonEmpty!42952 () Bool)

(declare-fun mapRes!42952 () Bool)

(declare-fun tp!81872 () Bool)

(assert (=> mapNonEmpty!42952 (= mapRes!42952 (and tp!81872 e!631064))))

(declare-fun mapRest!42952 () (Array (_ BitVec 32) ValueCell!13002))

(declare-fun mapKey!42952 () (_ BitVec 32))

(declare-fun mapValue!42952 () ValueCell!13002)

(assert (=> mapNonEmpty!42952 (= (arr!34535 _values!996) (store mapRest!42952 mapKey!42952 mapValue!42952))))

(declare-fun b!1105764 () Bool)

(declare-fun e!631062 () Bool)

(assert (=> b!1105764 (= e!631062 (not true))))

(declare-fun arrayContainsKey!0 (array!71763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105764 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36282 0))(
  ( (Unit!36283) )
))
(declare-fun lt!495356 () Unit!36282)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71763 (_ BitVec 64) (_ BitVec 32)) Unit!36282)

(assert (=> b!1105764 (= lt!495356 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!42952 () Bool)

(assert (=> mapIsEmpty!42952 mapRes!42952))

(declare-fun b!1105765 () Bool)

(assert (=> b!1105765 (= e!631061 (and e!631063 mapRes!42952))))

(declare-fun condMapEmpty!42952 () Bool)

(declare-fun mapDefault!42952 () ValueCell!13002)

(assert (=> b!1105765 (= condMapEmpty!42952 (= (arr!34535 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13002)) mapDefault!42952)))))

(declare-fun b!1105766 () Bool)

(declare-fun res!737839 () Bool)

(assert (=> b!1105766 (=> (not res!737839) (not e!631065))))

(assert (=> b!1105766 (= res!737839 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35070 _keys!1208))))))

(declare-fun b!1105767 () Bool)

(declare-fun res!737844 () Bool)

(assert (=> b!1105767 (=> (not res!737844) (not e!631065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105767 (= res!737844 (validKeyInArray!0 k0!934))))

(declare-fun b!1105768 () Bool)

(assert (=> b!1105768 (= e!631065 e!631062)))

(declare-fun res!737843 () Bool)

(assert (=> b!1105768 (=> (not res!737843) (not e!631062))))

(declare-fun lt!495355 () array!71763)

(assert (=> b!1105768 (= res!737843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495355 mask!1564))))

(assert (=> b!1105768 (= lt!495355 (array!71764 (store (arr!34534 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35070 _keys!1208)))))

(declare-fun b!1105769 () Bool)

(declare-fun res!737840 () Bool)

(assert (=> b!1105769 (=> (not res!737840) (not e!631065))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105769 (= res!737840 (and (= (size!35071 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35070 _keys!1208) (size!35071 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105770 () Bool)

(declare-fun res!737842 () Bool)

(assert (=> b!1105770 (=> (not res!737842) (not e!631062))))

(assert (=> b!1105770 (= res!737842 (arrayNoDuplicates!0 lt!495355 #b00000000000000000000000000000000 Nil!24077))))

(assert (= (and start!97192 res!737847) b!1105760))

(assert (= (and b!1105760 res!737841) b!1105769))

(assert (= (and b!1105769 res!737840) b!1105758))

(assert (= (and b!1105758 res!737848) b!1105763))

(assert (= (and b!1105763 res!737845) b!1105766))

(assert (= (and b!1105766 res!737839) b!1105767))

(assert (= (and b!1105767 res!737844) b!1105761))

(assert (= (and b!1105761 res!737846) b!1105768))

(assert (= (and b!1105768 res!737843) b!1105770))

(assert (= (and b!1105770 res!737842) b!1105764))

(assert (= (and b!1105765 condMapEmpty!42952) mapIsEmpty!42952))

(assert (= (and b!1105765 (not condMapEmpty!42952)) mapNonEmpty!42952))

(get-info :version)

(assert (= (and mapNonEmpty!42952 ((_ is ValueCellFull!13002) mapValue!42952)) b!1105762))

(assert (= (and b!1105765 ((_ is ValueCellFull!13002) mapDefault!42952)) b!1105759))

(assert (= start!97192 b!1105765))

(declare-fun m!1025047 () Bool)

(assert (=> b!1105761 m!1025047))

(declare-fun m!1025049 () Bool)

(assert (=> mapNonEmpty!42952 m!1025049))

(declare-fun m!1025051 () Bool)

(assert (=> b!1105768 m!1025051))

(declare-fun m!1025053 () Bool)

(assert (=> b!1105768 m!1025053))

(declare-fun m!1025055 () Bool)

(assert (=> b!1105764 m!1025055))

(declare-fun m!1025057 () Bool)

(assert (=> b!1105764 m!1025057))

(declare-fun m!1025059 () Bool)

(assert (=> b!1105760 m!1025059))

(declare-fun m!1025061 () Bool)

(assert (=> b!1105767 m!1025061))

(declare-fun m!1025063 () Bool)

(assert (=> b!1105770 m!1025063))

(declare-fun m!1025065 () Bool)

(assert (=> start!97192 m!1025065))

(declare-fun m!1025067 () Bool)

(assert (=> start!97192 m!1025067))

(declare-fun m!1025069 () Bool)

(assert (=> b!1105763 m!1025069))

(declare-fun m!1025071 () Bool)

(assert (=> b!1105758 m!1025071))

(check-sat (not b!1105767) (not b!1105768) (not start!97192) tp_is_empty!27423 (not b!1105770) (not b!1105760) (not b!1105764) (not b!1105758) (not b!1105763) (not mapNonEmpty!42952))
(check-sat)
