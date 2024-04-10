; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110514 () Bool)

(assert start!110514)

(declare-fun b_free!29349 () Bool)

(declare-fun b_next!29349 () Bool)

(assert (=> start!110514 (= b_free!29349 (not b_next!29349))))

(declare-fun tp!103368 () Bool)

(declare-fun b_and!47557 () Bool)

(assert (=> start!110514 (= tp!103368 b_and!47557)))

(declare-fun res!867803 () Bool)

(declare-fun e!745979 () Bool)

(assert (=> start!110514 (=> (not res!867803) (not e!745979))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110514 (= res!867803 (validMask!0 mask!2040))))

(assert (=> start!110514 e!745979))

(assert (=> start!110514 tp!103368))

(declare-datatypes ((array!87162 0))(
  ( (array!87163 (arr!42061 (Array (_ BitVec 32) (_ BitVec 64))) (size!42611 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87162)

(declare-fun array_inv!31795 (array!87162) Bool)

(assert (=> start!110514 (array_inv!31795 _keys!1628)))

(assert (=> start!110514 true))

(declare-fun tp_is_empty!35079 () Bool)

(assert (=> start!110514 tp_is_empty!35079))

(declare-datatypes ((V!51875 0))(
  ( (V!51876 (val!17614 Int)) )
))
(declare-datatypes ((ValueCell!16641 0))(
  ( (ValueCellFull!16641 (v!20241 V!51875)) (EmptyCell!16641) )
))
(declare-datatypes ((array!87164 0))(
  ( (array!87165 (arr!42062 (Array (_ BitVec 32) ValueCell!16641)) (size!42612 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87164)

(declare-fun e!745978 () Bool)

(declare-fun array_inv!31796 (array!87164) Bool)

(assert (=> start!110514 (and (array_inv!31796 _values!1354) e!745978)))

(declare-fun b!1307327 () Bool)

(declare-fun e!745980 () Bool)

(assert (=> b!1307327 (= e!745980 tp_is_empty!35079)))

(declare-fun b!1307328 () Bool)

(declare-fun mapRes!54247 () Bool)

(assert (=> b!1307328 (= e!745978 (and e!745980 mapRes!54247))))

(declare-fun condMapEmpty!54247 () Bool)

(declare-fun mapDefault!54247 () ValueCell!16641)

(assert (=> b!1307328 (= condMapEmpty!54247 (= (arr!42062 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16641)) mapDefault!54247)))))

(declare-fun b!1307329 () Bool)

(declare-fun res!867800 () Bool)

(assert (=> b!1307329 (=> (not res!867800) (not e!745979))))

(declare-datatypes ((List!29820 0))(
  ( (Nil!29817) (Cons!29816 (h!31025 (_ BitVec 64)) (t!43426 List!29820)) )
))
(declare-fun arrayNoDuplicates!0 (array!87162 (_ BitVec 32) List!29820) Bool)

(assert (=> b!1307329 (= res!867800 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29817))))

(declare-fun b!1307330 () Bool)

(declare-fun e!745982 () Bool)

(assert (=> b!1307330 (= e!745982 tp_is_empty!35079)))

(declare-fun b!1307331 () Bool)

(declare-fun res!867804 () Bool)

(assert (=> b!1307331 (=> (not res!867804) (not e!745979))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307331 (= res!867804 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42611 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307332 () Bool)

(declare-fun res!867802 () Bool)

(assert (=> b!1307332 (=> (not res!867802) (not e!745979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87162 (_ BitVec 32)) Bool)

(assert (=> b!1307332 (= res!867802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54247 () Bool)

(declare-fun tp!103369 () Bool)

(assert (=> mapNonEmpty!54247 (= mapRes!54247 (and tp!103369 e!745982))))

(declare-fun mapValue!54247 () ValueCell!16641)

(declare-fun mapRest!54247 () (Array (_ BitVec 32) ValueCell!16641))

(declare-fun mapKey!54247 () (_ BitVec 32))

(assert (=> mapNonEmpty!54247 (= (arr!42062 _values!1354) (store mapRest!54247 mapKey!54247 mapValue!54247))))

(declare-fun mapIsEmpty!54247 () Bool)

(assert (=> mapIsEmpty!54247 mapRes!54247))

(declare-fun b!1307333 () Bool)

(assert (=> b!1307333 (= e!745979 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51875)

(declare-fun zeroValue!1296 () V!51875)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585042 () Bool)

(declare-datatypes ((tuple2!22680 0))(
  ( (tuple2!22681 (_1!11351 (_ BitVec 64)) (_2!11351 V!51875)) )
))
(declare-datatypes ((List!29821 0))(
  ( (Nil!29818) (Cons!29817 (h!31026 tuple2!22680) (t!43427 List!29821)) )
))
(declare-datatypes ((ListLongMap!20337 0))(
  ( (ListLongMap!20338 (toList!10184 List!29821)) )
))
(declare-fun contains!8334 (ListLongMap!20337 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5197 (array!87162 array!87164 (_ BitVec 32) (_ BitVec 32) V!51875 V!51875 (_ BitVec 32) Int) ListLongMap!20337)

(assert (=> b!1307333 (= lt!585042 (contains!8334 (getCurrentListMap!5197 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307334 () Bool)

(declare-fun res!867801 () Bool)

(assert (=> b!1307334 (=> (not res!867801) (not e!745979))))

(assert (=> b!1307334 (= res!867801 (and (= (size!42612 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42611 _keys!1628) (size!42612 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110514 res!867803) b!1307334))

(assert (= (and b!1307334 res!867801) b!1307332))

(assert (= (and b!1307332 res!867802) b!1307329))

(assert (= (and b!1307329 res!867800) b!1307331))

(assert (= (and b!1307331 res!867804) b!1307333))

(assert (= (and b!1307328 condMapEmpty!54247) mapIsEmpty!54247))

(assert (= (and b!1307328 (not condMapEmpty!54247)) mapNonEmpty!54247))

(get-info :version)

(assert (= (and mapNonEmpty!54247 ((_ is ValueCellFull!16641) mapValue!54247)) b!1307330))

(assert (= (and b!1307328 ((_ is ValueCellFull!16641) mapDefault!54247)) b!1307327))

(assert (= start!110514 b!1307328))

(declare-fun m!1198057 () Bool)

(assert (=> b!1307332 m!1198057))

(declare-fun m!1198059 () Bool)

(assert (=> b!1307329 m!1198059))

(declare-fun m!1198061 () Bool)

(assert (=> start!110514 m!1198061))

(declare-fun m!1198063 () Bool)

(assert (=> start!110514 m!1198063))

(declare-fun m!1198065 () Bool)

(assert (=> start!110514 m!1198065))

(declare-fun m!1198067 () Bool)

(assert (=> mapNonEmpty!54247 m!1198067))

(declare-fun m!1198069 () Bool)

(assert (=> b!1307333 m!1198069))

(assert (=> b!1307333 m!1198069))

(declare-fun m!1198071 () Bool)

(assert (=> b!1307333 m!1198071))

(check-sat b_and!47557 (not b_next!29349) tp_is_empty!35079 (not b!1307329) (not mapNonEmpty!54247) (not b!1307332) (not b!1307333) (not start!110514))
(check-sat b_and!47557 (not b_next!29349))
