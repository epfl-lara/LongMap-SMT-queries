; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110478 () Bool)

(assert start!110478)

(declare-fun mapNonEmpty!54193 () Bool)

(declare-fun mapRes!54193 () Bool)

(declare-fun tp!103273 () Bool)

(declare-fun e!745711 () Bool)

(assert (=> mapNonEmpty!54193 (= mapRes!54193 (and tp!103273 e!745711))))

(declare-datatypes ((V!51827 0))(
  ( (V!51828 (val!17596 Int)) )
))
(declare-datatypes ((ValueCell!16623 0))(
  ( (ValueCellFull!16623 (v!20223 V!51827)) (EmptyCell!16623) )
))
(declare-datatypes ((array!87094 0))(
  ( (array!87095 (arr!42027 (Array (_ BitVec 32) ValueCell!16623)) (size!42577 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87094)

(declare-fun mapKey!54193 () (_ BitVec 32))

(declare-fun mapRest!54193 () (Array (_ BitVec 32) ValueCell!16623))

(declare-fun mapValue!54193 () ValueCell!16623)

(assert (=> mapNonEmpty!54193 (= (arr!42027 _values!1354) (store mapRest!54193 mapKey!54193 mapValue!54193))))

(declare-fun b!1306912 () Bool)

(declare-fun e!745709 () Bool)

(declare-fun e!745712 () Bool)

(assert (=> b!1306912 (= e!745709 (and e!745712 mapRes!54193))))

(declare-fun condMapEmpty!54193 () Bool)

(declare-fun mapDefault!54193 () ValueCell!16623)

(assert (=> b!1306912 (= condMapEmpty!54193 (= (arr!42027 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16623)) mapDefault!54193)))))

(declare-fun b!1306913 () Bool)

(declare-fun tp_is_empty!35043 () Bool)

(assert (=> b!1306913 (= e!745712 tp_is_empty!35043)))

(declare-fun res!867547 () Bool)

(declare-fun e!745708 () Bool)

(assert (=> start!110478 (=> (not res!867547) (not e!745708))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110478 (= res!867547 (validMask!0 mask!2040))))

(assert (=> start!110478 e!745708))

(assert (=> start!110478 true))

(declare-fun array_inv!31771 (array!87094) Bool)

(assert (=> start!110478 (and (array_inv!31771 _values!1354) e!745709)))

(declare-datatypes ((array!87096 0))(
  ( (array!87097 (arr!42028 (Array (_ BitVec 32) (_ BitVec 64))) (size!42578 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87096)

(declare-fun array_inv!31772 (array!87096) Bool)

(assert (=> start!110478 (array_inv!31772 _keys!1628)))

(declare-fun b!1306914 () Bool)

(declare-fun res!867549 () Bool)

(assert (=> b!1306914 (=> (not res!867549) (not e!745708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87096 (_ BitVec 32)) Bool)

(assert (=> b!1306914 (= res!867549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306915 () Bool)

(assert (=> b!1306915 (= e!745708 false)))

(declare-fun lt!584997 () Bool)

(declare-datatypes ((List!29803 0))(
  ( (Nil!29800) (Cons!29799 (h!31008 (_ BitVec 64)) (t!43409 List!29803)) )
))
(declare-fun arrayNoDuplicates!0 (array!87096 (_ BitVec 32) List!29803) Bool)

(assert (=> b!1306915 (= lt!584997 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29800))))

(declare-fun b!1306916 () Bool)

(assert (=> b!1306916 (= e!745711 tp_is_empty!35043)))

(declare-fun b!1306917 () Bool)

(declare-fun res!867548 () Bool)

(assert (=> b!1306917 (=> (not res!867548) (not e!745708))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306917 (= res!867548 (and (= (size!42577 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42578 _keys!1628) (size!42577 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54193 () Bool)

(assert (=> mapIsEmpty!54193 mapRes!54193))

(assert (= (and start!110478 res!867547) b!1306917))

(assert (= (and b!1306917 res!867548) b!1306914))

(assert (= (and b!1306914 res!867549) b!1306915))

(assert (= (and b!1306912 condMapEmpty!54193) mapIsEmpty!54193))

(assert (= (and b!1306912 (not condMapEmpty!54193)) mapNonEmpty!54193))

(get-info :version)

(assert (= (and mapNonEmpty!54193 ((_ is ValueCellFull!16623) mapValue!54193)) b!1306916))

(assert (= (and b!1306912 ((_ is ValueCellFull!16623) mapDefault!54193)) b!1306913))

(assert (= start!110478 b!1306912))

(declare-fun m!1197789 () Bool)

(assert (=> mapNonEmpty!54193 m!1197789))

(declare-fun m!1197791 () Bool)

(assert (=> start!110478 m!1197791))

(declare-fun m!1197793 () Bool)

(assert (=> start!110478 m!1197793))

(declare-fun m!1197795 () Bool)

(assert (=> start!110478 m!1197795))

(declare-fun m!1197797 () Bool)

(assert (=> b!1306914 m!1197797))

(declare-fun m!1197799 () Bool)

(assert (=> b!1306915 m!1197799))

(check-sat (not b!1306915) (not mapNonEmpty!54193) (not start!110478) (not b!1306914) tp_is_empty!35043)
(check-sat)
