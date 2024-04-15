; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110518 () Bool)

(assert start!110518)

(declare-fun b_free!29353 () Bool)

(declare-fun b_next!29353 () Bool)

(assert (=> start!110518 (= b_free!29353 (not b_next!29353))))

(declare-fun tp!103381 () Bool)

(declare-fun b_and!47543 () Bool)

(assert (=> start!110518 (= tp!103381 b_and!47543)))

(declare-fun b!1307305 () Bool)

(declare-fun e!745976 () Bool)

(declare-fun tp_is_empty!35083 () Bool)

(assert (=> b!1307305 (= e!745976 tp_is_empty!35083)))

(declare-fun res!867801 () Bool)

(declare-fun e!745978 () Bool)

(assert (=> start!110518 (=> (not res!867801) (not e!745978))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110518 (= res!867801 (validMask!0 mask!2040))))

(assert (=> start!110518 e!745978))

(assert (=> start!110518 tp!103381))

(declare-datatypes ((array!87083 0))(
  ( (array!87084 (arr!42022 (Array (_ BitVec 32) (_ BitVec 64))) (size!42574 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87083)

(declare-fun array_inv!31959 (array!87083) Bool)

(assert (=> start!110518 (array_inv!31959 _keys!1628)))

(assert (=> start!110518 true))

(assert (=> start!110518 tp_is_empty!35083))

(declare-datatypes ((V!51881 0))(
  ( (V!51882 (val!17616 Int)) )
))
(declare-datatypes ((ValueCell!16643 0))(
  ( (ValueCellFull!16643 (v!20242 V!51881)) (EmptyCell!16643) )
))
(declare-datatypes ((array!87085 0))(
  ( (array!87086 (arr!42023 (Array (_ BitVec 32) ValueCell!16643)) (size!42575 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87085)

(declare-fun e!745977 () Bool)

(declare-fun array_inv!31960 (array!87085) Bool)

(assert (=> start!110518 (and (array_inv!31960 _values!1354) e!745977)))

(declare-fun mapNonEmpty!54253 () Bool)

(declare-fun mapRes!54253 () Bool)

(declare-fun tp!103382 () Bool)

(declare-fun e!745979 () Bool)

(assert (=> mapNonEmpty!54253 (= mapRes!54253 (and tp!103382 e!745979))))

(declare-fun mapRest!54253 () (Array (_ BitVec 32) ValueCell!16643))

(declare-fun mapKey!54253 () (_ BitVec 32))

(declare-fun mapValue!54253 () ValueCell!16643)

(assert (=> mapNonEmpty!54253 (= (arr!42023 _values!1354) (store mapRest!54253 mapKey!54253 mapValue!54253))))

(declare-fun b!1307306 () Bool)

(assert (=> b!1307306 (= e!745978 false)))

(declare-fun lt!584862 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51881)

(declare-fun zeroValue!1296 () V!51881)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22758 0))(
  ( (tuple2!22759 (_1!11390 (_ BitVec 64)) (_2!11390 V!51881)) )
))
(declare-datatypes ((List!29883 0))(
  ( (Nil!29880) (Cons!29879 (h!31088 tuple2!22758) (t!43481 List!29883)) )
))
(declare-datatypes ((ListLongMap!20415 0))(
  ( (ListLongMap!20416 (toList!10223 List!29883)) )
))
(declare-fun contains!8300 (ListLongMap!20415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5118 (array!87083 array!87085 (_ BitVec 32) (_ BitVec 32) V!51881 V!51881 (_ BitVec 32) Int) ListLongMap!20415)

(assert (=> b!1307306 (= lt!584862 (contains!8300 (getCurrentListMap!5118 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307307 () Bool)

(assert (=> b!1307307 (= e!745977 (and e!745976 mapRes!54253))))

(declare-fun condMapEmpty!54253 () Bool)

(declare-fun mapDefault!54253 () ValueCell!16643)

(assert (=> b!1307307 (= condMapEmpty!54253 (= (arr!42023 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16643)) mapDefault!54253)))))

(declare-fun b!1307308 () Bool)

(declare-fun res!867804 () Bool)

(assert (=> b!1307308 (=> (not res!867804) (not e!745978))))

(declare-datatypes ((List!29884 0))(
  ( (Nil!29881) (Cons!29880 (h!31089 (_ BitVec 64)) (t!43482 List!29884)) )
))
(declare-fun arrayNoDuplicates!0 (array!87083 (_ BitVec 32) List!29884) Bool)

(assert (=> b!1307308 (= res!867804 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29881))))

(declare-fun b!1307309 () Bool)

(assert (=> b!1307309 (= e!745979 tp_is_empty!35083)))

(declare-fun b!1307310 () Bool)

(declare-fun res!867803 () Bool)

(assert (=> b!1307310 (=> (not res!867803) (not e!745978))))

(assert (=> b!1307310 (= res!867803 (and (= (size!42575 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42574 _keys!1628) (size!42575 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307311 () Bool)

(declare-fun res!867802 () Bool)

(assert (=> b!1307311 (=> (not res!867802) (not e!745978))))

(assert (=> b!1307311 (= res!867802 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42574 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307312 () Bool)

(declare-fun res!867805 () Bool)

(assert (=> b!1307312 (=> (not res!867805) (not e!745978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87083 (_ BitVec 32)) Bool)

(assert (=> b!1307312 (= res!867805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54253 () Bool)

(assert (=> mapIsEmpty!54253 mapRes!54253))

(assert (= (and start!110518 res!867801) b!1307310))

(assert (= (and b!1307310 res!867803) b!1307312))

(assert (= (and b!1307312 res!867805) b!1307308))

(assert (= (and b!1307308 res!867804) b!1307311))

(assert (= (and b!1307311 res!867802) b!1307306))

(assert (= (and b!1307307 condMapEmpty!54253) mapIsEmpty!54253))

(assert (= (and b!1307307 (not condMapEmpty!54253)) mapNonEmpty!54253))

(get-info :version)

(assert (= (and mapNonEmpty!54253 ((_ is ValueCellFull!16643) mapValue!54253)) b!1307309))

(assert (= (and b!1307307 ((_ is ValueCellFull!16643) mapDefault!54253)) b!1307305))

(assert (= start!110518 b!1307307))

(declare-fun m!1197573 () Bool)

(assert (=> mapNonEmpty!54253 m!1197573))

(declare-fun m!1197575 () Bool)

(assert (=> start!110518 m!1197575))

(declare-fun m!1197577 () Bool)

(assert (=> start!110518 m!1197577))

(declare-fun m!1197579 () Bool)

(assert (=> start!110518 m!1197579))

(declare-fun m!1197581 () Bool)

(assert (=> b!1307312 m!1197581))

(declare-fun m!1197583 () Bool)

(assert (=> b!1307308 m!1197583))

(declare-fun m!1197585 () Bool)

(assert (=> b!1307306 m!1197585))

(assert (=> b!1307306 m!1197585))

(declare-fun m!1197587 () Bool)

(assert (=> b!1307306 m!1197587))

(check-sat tp_is_empty!35083 (not start!110518) (not b!1307306) (not b!1307308) (not b!1307312) (not b_next!29353) b_and!47543 (not mapNonEmpty!54253))
(check-sat b_and!47543 (not b_next!29353))
