; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108348 () Bool)

(assert start!108348)

(declare-fun b!1278739 () Bool)

(declare-fun e!730547 () Bool)

(assert (=> b!1278739 (= e!730547 false)))

(declare-fun lt!575755 () Bool)

(declare-datatypes ((array!84053 0))(
  ( (array!84054 (arr!40531 (Array (_ BitVec 32) (_ BitVec 64))) (size!41083 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84053)

(declare-datatypes ((List!28824 0))(
  ( (Nil!28821) (Cons!28820 (h!30029 (_ BitVec 64)) (t!42356 List!28824)) )
))
(declare-fun arrayNoDuplicates!0 (array!84053 (_ BitVec 32) List!28824) Bool)

(assert (=> b!1278739 (= lt!575755 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28821))))

(declare-fun b!1278740 () Bool)

(declare-fun res!849505 () Bool)

(assert (=> b!1278740 (=> (not res!849505) (not e!730547))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49817 0))(
  ( (V!49818 (val!16842 Int)) )
))
(declare-datatypes ((ValueCell!15869 0))(
  ( (ValueCellFull!15869 (v!19441 V!49817)) (EmptyCell!15869) )
))
(declare-datatypes ((array!84055 0))(
  ( (array!84056 (arr!40532 (Array (_ BitVec 32) ValueCell!15869)) (size!41084 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84055)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278740 (= res!849505 (and (= (size!41084 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41083 _keys!1741) (size!41084 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278741 () Bool)

(declare-fun e!730550 () Bool)

(declare-fun e!730548 () Bool)

(declare-fun mapRes!51854 () Bool)

(assert (=> b!1278741 (= e!730550 (and e!730548 mapRes!51854))))

(declare-fun condMapEmpty!51854 () Bool)

(declare-fun mapDefault!51854 () ValueCell!15869)

(assert (=> b!1278741 (= condMapEmpty!51854 (= (arr!40532 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15869)) mapDefault!51854)))))

(declare-fun b!1278742 () Bool)

(declare-fun tp_is_empty!33535 () Bool)

(assert (=> b!1278742 (= e!730548 tp_is_empty!33535)))

(declare-fun mapIsEmpty!51854 () Bool)

(assert (=> mapIsEmpty!51854 mapRes!51854))

(declare-fun b!1278743 () Bool)

(declare-fun res!849504 () Bool)

(assert (=> b!1278743 (=> (not res!849504) (not e!730547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84053 (_ BitVec 32)) Bool)

(assert (=> b!1278743 (= res!849504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278744 () Bool)

(declare-fun e!730549 () Bool)

(assert (=> b!1278744 (= e!730549 tp_is_empty!33535)))

(declare-fun res!849506 () Bool)

(assert (=> start!108348 (=> (not res!849506) (not e!730547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108348 (= res!849506 (validMask!0 mask!2175))))

(assert (=> start!108348 e!730547))

(assert (=> start!108348 true))

(declare-fun array_inv!30939 (array!84055) Bool)

(assert (=> start!108348 (and (array_inv!30939 _values!1445) e!730550)))

(declare-fun array_inv!30940 (array!84053) Bool)

(assert (=> start!108348 (array_inv!30940 _keys!1741)))

(declare-fun mapNonEmpty!51854 () Bool)

(declare-fun tp!98829 () Bool)

(assert (=> mapNonEmpty!51854 (= mapRes!51854 (and tp!98829 e!730549))))

(declare-fun mapValue!51854 () ValueCell!15869)

(declare-fun mapKey!51854 () (_ BitVec 32))

(declare-fun mapRest!51854 () (Array (_ BitVec 32) ValueCell!15869))

(assert (=> mapNonEmpty!51854 (= (arr!40532 _values!1445) (store mapRest!51854 mapKey!51854 mapValue!51854))))

(assert (= (and start!108348 res!849506) b!1278740))

(assert (= (and b!1278740 res!849505) b!1278743))

(assert (= (and b!1278743 res!849504) b!1278739))

(assert (= (and b!1278741 condMapEmpty!51854) mapIsEmpty!51854))

(assert (= (and b!1278741 (not condMapEmpty!51854)) mapNonEmpty!51854))

(get-info :version)

(assert (= (and mapNonEmpty!51854 ((_ is ValueCellFull!15869) mapValue!51854)) b!1278744))

(assert (= (and b!1278741 ((_ is ValueCellFull!15869) mapDefault!51854)) b!1278742))

(assert (= start!108348 b!1278741))

(declare-fun m!1173489 () Bool)

(assert (=> b!1278739 m!1173489))

(declare-fun m!1173491 () Bool)

(assert (=> b!1278743 m!1173491))

(declare-fun m!1173493 () Bool)

(assert (=> start!108348 m!1173493))

(declare-fun m!1173495 () Bool)

(assert (=> start!108348 m!1173495))

(declare-fun m!1173497 () Bool)

(assert (=> start!108348 m!1173497))

(declare-fun m!1173499 () Bool)

(assert (=> mapNonEmpty!51854 m!1173499))

(check-sat tp_is_empty!33535 (not b!1278739) (not b!1278743) (not start!108348) (not mapNonEmpty!51854))
(check-sat)
