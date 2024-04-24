; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108584 () Bool)

(assert start!108584)

(declare-fun mapNonEmpty!51872 () Bool)

(declare-fun mapRes!51872 () Bool)

(declare-fun tp!98846 () Bool)

(declare-fun e!731514 () Bool)

(assert (=> mapNonEmpty!51872 (= mapRes!51872 (and tp!98846 e!731514))))

(declare-fun mapKey!51872 () (_ BitVec 32))

(declare-datatypes ((V!49833 0))(
  ( (V!49834 (val!16848 Int)) )
))
(declare-datatypes ((ValueCell!15875 0))(
  ( (ValueCellFull!15875 (v!19443 V!49833)) (EmptyCell!15875) )
))
(declare-fun mapValue!51872 () ValueCell!15875)

(declare-datatypes ((array!84211 0))(
  ( (array!84212 (arr!40605 (Array (_ BitVec 32) ValueCell!15875)) (size!41156 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84211)

(declare-fun mapRest!51872 () (Array (_ BitVec 32) ValueCell!15875))

(assert (=> mapNonEmpty!51872 (= (arr!40605 _values!1445) (store mapRest!51872 mapKey!51872 mapValue!51872))))

(declare-fun b!1280216 () Bool)

(declare-fun e!731513 () Bool)

(assert (=> b!1280216 (= e!731513 false)))

(declare-fun lt!576435 () Bool)

(declare-datatypes ((array!84213 0))(
  ( (array!84214 (arr!40606 (Array (_ BitVec 32) (_ BitVec 64))) (size!41157 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84213)

(declare-datatypes ((List!28792 0))(
  ( (Nil!28789) (Cons!28788 (h!30006 (_ BitVec 64)) (t!42324 List!28792)) )
))
(declare-fun arrayNoDuplicates!0 (array!84213 (_ BitVec 32) List!28792) Bool)

(assert (=> b!1280216 (= lt!576435 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28789))))

(declare-fun b!1280217 () Bool)

(declare-fun e!731517 () Bool)

(declare-fun e!731516 () Bool)

(assert (=> b!1280217 (= e!731517 (and e!731516 mapRes!51872))))

(declare-fun condMapEmpty!51872 () Bool)

(declare-fun mapDefault!51872 () ValueCell!15875)

(assert (=> b!1280217 (= condMapEmpty!51872 (= (arr!40605 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15875)) mapDefault!51872)))))

(declare-fun b!1280218 () Bool)

(declare-fun tp_is_empty!33547 () Bool)

(assert (=> b!1280218 (= e!731516 tp_is_empty!33547)))

(declare-fun b!1280219 () Bool)

(declare-fun res!850105 () Bool)

(assert (=> b!1280219 (=> (not res!850105) (not e!731513))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84213 (_ BitVec 32)) Bool)

(assert (=> b!1280219 (= res!850105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!850107 () Bool)

(assert (=> start!108584 (=> (not res!850107) (not e!731513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108584 (= res!850107 (validMask!0 mask!2175))))

(assert (=> start!108584 e!731513))

(assert (=> start!108584 true))

(declare-fun array_inv!31029 (array!84211) Bool)

(assert (=> start!108584 (and (array_inv!31029 _values!1445) e!731517)))

(declare-fun array_inv!31030 (array!84213) Bool)

(assert (=> start!108584 (array_inv!31030 _keys!1741)))

(declare-fun b!1280220 () Bool)

(assert (=> b!1280220 (= e!731514 tp_is_empty!33547)))

(declare-fun mapIsEmpty!51872 () Bool)

(assert (=> mapIsEmpty!51872 mapRes!51872))

(declare-fun b!1280221 () Bool)

(declare-fun res!850106 () Bool)

(assert (=> b!1280221 (=> (not res!850106) (not e!731513))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280221 (= res!850106 (and (= (size!41156 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41157 _keys!1741) (size!41156 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108584 res!850107) b!1280221))

(assert (= (and b!1280221 res!850106) b!1280219))

(assert (= (and b!1280219 res!850105) b!1280216))

(assert (= (and b!1280217 condMapEmpty!51872) mapIsEmpty!51872))

(assert (= (and b!1280217 (not condMapEmpty!51872)) mapNonEmpty!51872))

(get-info :version)

(assert (= (and mapNonEmpty!51872 ((_ is ValueCellFull!15875) mapValue!51872)) b!1280220))

(assert (= (and b!1280217 ((_ is ValueCellFull!15875) mapDefault!51872)) b!1280218))

(assert (= start!108584 b!1280217))

(declare-fun m!1175673 () Bool)

(assert (=> mapNonEmpty!51872 m!1175673))

(declare-fun m!1175675 () Bool)

(assert (=> b!1280216 m!1175675))

(declare-fun m!1175677 () Bool)

(assert (=> b!1280219 m!1175677))

(declare-fun m!1175679 () Bool)

(assert (=> start!108584 m!1175679))

(declare-fun m!1175681 () Bool)

(assert (=> start!108584 m!1175681))

(declare-fun m!1175683 () Bool)

(assert (=> start!108584 m!1175683))

(check-sat tp_is_empty!33547 (not start!108584) (not b!1280216) (not mapNonEmpty!51872) (not b!1280219))
(check-sat)
