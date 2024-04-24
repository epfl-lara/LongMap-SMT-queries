; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108560 () Bool)

(assert start!108560)

(declare-fun b!1280000 () Bool)

(declare-fun res!849998 () Bool)

(declare-fun e!731335 () Bool)

(assert (=> b!1280000 (=> (not res!849998) (not e!731335))))

(declare-datatypes ((array!84167 0))(
  ( (array!84168 (arr!40583 (Array (_ BitVec 32) (_ BitVec 64))) (size!41134 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84167)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84167 (_ BitVec 32)) Bool)

(assert (=> b!1280000 (= res!849998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280001 () Bool)

(declare-fun e!731336 () Bool)

(declare-fun tp_is_empty!33523 () Bool)

(assert (=> b!1280001 (= e!731336 tp_is_empty!33523)))

(declare-fun b!1280002 () Bool)

(assert (=> b!1280002 (= e!731335 false)))

(declare-fun lt!576399 () Bool)

(declare-datatypes ((List!28784 0))(
  ( (Nil!28781) (Cons!28780 (h!29998 (_ BitVec 64)) (t!42316 List!28784)) )
))
(declare-fun arrayNoDuplicates!0 (array!84167 (_ BitVec 32) List!28784) Bool)

(assert (=> b!1280002 (= lt!576399 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28781))))

(declare-fun b!1280003 () Bool)

(declare-fun res!849999 () Bool)

(assert (=> b!1280003 (=> (not res!849999) (not e!731335))))

(declare-datatypes ((V!49801 0))(
  ( (V!49802 (val!16836 Int)) )
))
(declare-datatypes ((ValueCell!15863 0))(
  ( (ValueCellFull!15863 (v!19431 V!49801)) (EmptyCell!15863) )
))
(declare-datatypes ((array!84169 0))(
  ( (array!84170 (arr!40584 (Array (_ BitVec 32) ValueCell!15863)) (size!41135 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84169)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280003 (= res!849999 (and (= (size!41135 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41134 _keys!1741) (size!41135 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!849997 () Bool)

(assert (=> start!108560 (=> (not res!849997) (not e!731335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108560 (= res!849997 (validMask!0 mask!2175))))

(assert (=> start!108560 e!731335))

(assert (=> start!108560 true))

(declare-fun e!731337 () Bool)

(declare-fun array_inv!31013 (array!84169) Bool)

(assert (=> start!108560 (and (array_inv!31013 _values!1445) e!731337)))

(declare-fun array_inv!31014 (array!84167) Bool)

(assert (=> start!108560 (array_inv!31014 _keys!1741)))

(declare-fun b!1280004 () Bool)

(declare-fun e!731333 () Bool)

(declare-fun mapRes!51836 () Bool)

(assert (=> b!1280004 (= e!731337 (and e!731333 mapRes!51836))))

(declare-fun condMapEmpty!51836 () Bool)

(declare-fun mapDefault!51836 () ValueCell!15863)

(assert (=> b!1280004 (= condMapEmpty!51836 (= (arr!40584 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15863)) mapDefault!51836)))))

(declare-fun mapNonEmpty!51836 () Bool)

(declare-fun tp!98810 () Bool)

(assert (=> mapNonEmpty!51836 (= mapRes!51836 (and tp!98810 e!731336))))

(declare-fun mapRest!51836 () (Array (_ BitVec 32) ValueCell!15863))

(declare-fun mapKey!51836 () (_ BitVec 32))

(declare-fun mapValue!51836 () ValueCell!15863)

(assert (=> mapNonEmpty!51836 (= (arr!40584 _values!1445) (store mapRest!51836 mapKey!51836 mapValue!51836))))

(declare-fun mapIsEmpty!51836 () Bool)

(assert (=> mapIsEmpty!51836 mapRes!51836))

(declare-fun b!1280005 () Bool)

(assert (=> b!1280005 (= e!731333 tp_is_empty!33523)))

(assert (= (and start!108560 res!849997) b!1280003))

(assert (= (and b!1280003 res!849999) b!1280000))

(assert (= (and b!1280000 res!849998) b!1280002))

(assert (= (and b!1280004 condMapEmpty!51836) mapIsEmpty!51836))

(assert (= (and b!1280004 (not condMapEmpty!51836)) mapNonEmpty!51836))

(get-info :version)

(assert (= (and mapNonEmpty!51836 ((_ is ValueCellFull!15863) mapValue!51836)) b!1280001))

(assert (= (and b!1280004 ((_ is ValueCellFull!15863) mapDefault!51836)) b!1280005))

(assert (= start!108560 b!1280004))

(declare-fun m!1175529 () Bool)

(assert (=> b!1280000 m!1175529))

(declare-fun m!1175531 () Bool)

(assert (=> b!1280002 m!1175531))

(declare-fun m!1175533 () Bool)

(assert (=> start!108560 m!1175533))

(declare-fun m!1175535 () Bool)

(assert (=> start!108560 m!1175535))

(declare-fun m!1175537 () Bool)

(assert (=> start!108560 m!1175537))

(declare-fun m!1175539 () Bool)

(assert (=> mapNonEmpty!51836 m!1175539))

(check-sat tp_is_empty!33523 (not start!108560) (not b!1280002) (not mapNonEmpty!51836) (not b!1280000))
(check-sat)
