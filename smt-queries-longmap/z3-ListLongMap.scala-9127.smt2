; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109770 () Bool)

(assert start!109770)

(declare-fun b_free!29035 () Bool)

(declare-fun b_next!29035 () Bool)

(assert (=> start!109770 (= b_free!29035 (not b_next!29035))))

(declare-fun tp!102223 () Bool)

(declare-fun b_and!47127 () Bool)

(assert (=> start!109770 (= tp!102223 b_and!47127)))

(declare-fun mapNonEmpty!53573 () Bool)

(declare-fun mapRes!53573 () Bool)

(declare-fun tp!102224 () Bool)

(declare-fun e!741084 () Bool)

(assert (=> mapNonEmpty!53573 (= mapRes!53573 (and tp!102224 e!741084))))

(declare-fun mapKey!53573 () (_ BitVec 32))

(declare-datatypes ((V!51337 0))(
  ( (V!51338 (val!17412 Int)) )
))
(declare-datatypes ((ValueCell!16439 0))(
  ( (ValueCellFull!16439 (v!20010 V!51337)) (EmptyCell!16439) )
))
(declare-fun mapValue!53573 () ValueCell!16439)

(declare-datatypes ((array!86399 0))(
  ( (array!86400 (arr!41696 (Array (_ BitVec 32) ValueCell!16439)) (size!42247 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86399)

(declare-fun mapRest!53573 () (Array (_ BitVec 32) ValueCell!16439))

(assert (=> mapNonEmpty!53573 (= (arr!41696 _values!1445) (store mapRest!53573 mapKey!53573 mapValue!53573))))

(declare-fun b!1298760 () Bool)

(declare-fun res!862774 () Bool)

(declare-fun e!741082 () Bool)

(assert (=> b!1298760 (=> (not res!862774) (not e!741082))))

(declare-datatypes ((array!86401 0))(
  ( (array!86402 (arr!41697 (Array (_ BitVec 32) (_ BitVec 64))) (size!42248 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86401)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86401 (_ BitVec 32)) Bool)

(assert (=> b!1298760 (= res!862774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298761 () Bool)

(declare-fun res!862773 () Bool)

(assert (=> b!1298761 (=> (not res!862773) (not e!741082))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298761 (= res!862773 (and (= (size!42247 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42248 _keys!1741) (size!42247 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298762 () Bool)

(assert (=> b!1298762 (= e!741082 false)))

(declare-fun minValue!1387 () V!51337)

(declare-fun zeroValue!1387 () V!51337)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!581082 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22448 0))(
  ( (tuple2!22449 (_1!11235 (_ BitVec 64)) (_2!11235 V!51337)) )
))
(declare-datatypes ((List!29612 0))(
  ( (Nil!29609) (Cons!29608 (h!30826 tuple2!22448) (t!43168 List!29612)) )
))
(declare-datatypes ((ListLongMap!20113 0))(
  ( (ListLongMap!20114 (toList!10072 List!29612)) )
))
(declare-fun contains!8202 (ListLongMap!20113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5091 (array!86401 array!86399 (_ BitVec 32) (_ BitVec 32) V!51337 V!51337 (_ BitVec 32) Int) ListLongMap!20113)

(assert (=> b!1298762 (= lt!581082 (contains!8202 (getCurrentListMap!5091 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298763 () Bool)

(declare-fun e!741083 () Bool)

(declare-fun e!741080 () Bool)

(assert (=> b!1298763 (= e!741083 (and e!741080 mapRes!53573))))

(declare-fun condMapEmpty!53573 () Bool)

(declare-fun mapDefault!53573 () ValueCell!16439)

(assert (=> b!1298763 (= condMapEmpty!53573 (= (arr!41696 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16439)) mapDefault!53573)))))

(declare-fun b!1298764 () Bool)

(declare-fun tp_is_empty!34675 () Bool)

(assert (=> b!1298764 (= e!741084 tp_is_empty!34675)))

(declare-fun b!1298765 () Bool)

(declare-fun res!862777 () Bool)

(assert (=> b!1298765 (=> (not res!862777) (not e!741082))))

(assert (=> b!1298765 (= res!862777 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42248 _keys!1741))))))

(declare-fun mapIsEmpty!53573 () Bool)

(assert (=> mapIsEmpty!53573 mapRes!53573))

(declare-fun res!862776 () Bool)

(assert (=> start!109770 (=> (not res!862776) (not e!741082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109770 (= res!862776 (validMask!0 mask!2175))))

(assert (=> start!109770 e!741082))

(assert (=> start!109770 tp_is_empty!34675))

(assert (=> start!109770 true))

(declare-fun array_inv!31791 (array!86399) Bool)

(assert (=> start!109770 (and (array_inv!31791 _values!1445) e!741083)))

(declare-fun array_inv!31792 (array!86401) Bool)

(assert (=> start!109770 (array_inv!31792 _keys!1741)))

(assert (=> start!109770 tp!102223))

(declare-fun b!1298766 () Bool)

(declare-fun res!862775 () Bool)

(assert (=> b!1298766 (=> (not res!862775) (not e!741082))))

(declare-datatypes ((List!29613 0))(
  ( (Nil!29610) (Cons!29609 (h!30827 (_ BitVec 64)) (t!43169 List!29613)) )
))
(declare-fun arrayNoDuplicates!0 (array!86401 (_ BitVec 32) List!29613) Bool)

(assert (=> b!1298766 (= res!862775 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29610))))

(declare-fun b!1298767 () Bool)

(assert (=> b!1298767 (= e!741080 tp_is_empty!34675)))

(assert (= (and start!109770 res!862776) b!1298761))

(assert (= (and b!1298761 res!862773) b!1298760))

(assert (= (and b!1298760 res!862774) b!1298766))

(assert (= (and b!1298766 res!862775) b!1298765))

(assert (= (and b!1298765 res!862777) b!1298762))

(assert (= (and b!1298763 condMapEmpty!53573) mapIsEmpty!53573))

(assert (= (and b!1298763 (not condMapEmpty!53573)) mapNonEmpty!53573))

(get-info :version)

(assert (= (and mapNonEmpty!53573 ((_ is ValueCellFull!16439) mapValue!53573)) b!1298764))

(assert (= (and b!1298763 ((_ is ValueCellFull!16439) mapDefault!53573)) b!1298767))

(assert (= start!109770 b!1298763))

(declare-fun m!1190661 () Bool)

(assert (=> b!1298766 m!1190661))

(declare-fun m!1190663 () Bool)

(assert (=> b!1298760 m!1190663))

(declare-fun m!1190665 () Bool)

(assert (=> b!1298762 m!1190665))

(assert (=> b!1298762 m!1190665))

(declare-fun m!1190667 () Bool)

(assert (=> b!1298762 m!1190667))

(declare-fun m!1190669 () Bool)

(assert (=> start!109770 m!1190669))

(declare-fun m!1190671 () Bool)

(assert (=> start!109770 m!1190671))

(declare-fun m!1190673 () Bool)

(assert (=> start!109770 m!1190673))

(declare-fun m!1190675 () Bool)

(assert (=> mapNonEmpty!53573 m!1190675))

(check-sat (not b!1298766) b_and!47127 (not b!1298760) (not b_next!29035) (not b!1298762) (not mapNonEmpty!53573) (not start!109770) tp_is_empty!34675)
(check-sat b_and!47127 (not b_next!29035))
