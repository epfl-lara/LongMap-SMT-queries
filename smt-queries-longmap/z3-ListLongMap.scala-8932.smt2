; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108542 () Bool)

(assert start!108542)

(declare-fun b!1279838 () Bool)

(declare-fun e!731198 () Bool)

(assert (=> b!1279838 (= e!731198 false)))

(declare-fun lt!576372 () Bool)

(declare-datatypes ((array!84135 0))(
  ( (array!84136 (arr!40567 (Array (_ BitVec 32) (_ BitVec 64))) (size!41118 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84135)

(declare-datatypes ((List!28778 0))(
  ( (Nil!28775) (Cons!28774 (h!29992 (_ BitVec 64)) (t!42310 List!28778)) )
))
(declare-fun arrayNoDuplicates!0 (array!84135 (_ BitVec 32) List!28778) Bool)

(assert (=> b!1279838 (= lt!576372 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28775))))

(declare-fun mapNonEmpty!51809 () Bool)

(declare-fun mapRes!51809 () Bool)

(declare-fun tp!98783 () Bool)

(declare-fun e!731202 () Bool)

(assert (=> mapNonEmpty!51809 (= mapRes!51809 (and tp!98783 e!731202))))

(declare-datatypes ((V!49777 0))(
  ( (V!49778 (val!16827 Int)) )
))
(declare-datatypes ((ValueCell!15854 0))(
  ( (ValueCellFull!15854 (v!19422 V!49777)) (EmptyCell!15854) )
))
(declare-fun mapRest!51809 () (Array (_ BitVec 32) ValueCell!15854))

(declare-fun mapValue!51809 () ValueCell!15854)

(declare-datatypes ((array!84137 0))(
  ( (array!84138 (arr!40568 (Array (_ BitVec 32) ValueCell!15854)) (size!41119 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84137)

(declare-fun mapKey!51809 () (_ BitVec 32))

(assert (=> mapNonEmpty!51809 (= (arr!40568 _values!1445) (store mapRest!51809 mapKey!51809 mapValue!51809))))

(declare-fun mapIsEmpty!51809 () Bool)

(assert (=> mapIsEmpty!51809 mapRes!51809))

(declare-fun b!1279839 () Bool)

(declare-fun e!731199 () Bool)

(declare-fun tp_is_empty!33505 () Bool)

(assert (=> b!1279839 (= e!731199 tp_is_empty!33505)))

(declare-fun b!1279840 () Bool)

(declare-fun e!731200 () Bool)

(assert (=> b!1279840 (= e!731200 (and e!731199 mapRes!51809))))

(declare-fun condMapEmpty!51809 () Bool)

(declare-fun mapDefault!51809 () ValueCell!15854)

(assert (=> b!1279840 (= condMapEmpty!51809 (= (arr!40568 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15854)) mapDefault!51809)))))

(declare-fun b!1279841 () Bool)

(declare-fun res!849917 () Bool)

(assert (=> b!1279841 (=> (not res!849917) (not e!731198))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84135 (_ BitVec 32)) Bool)

(assert (=> b!1279841 (= res!849917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279842 () Bool)

(assert (=> b!1279842 (= e!731202 tp_is_empty!33505)))

(declare-fun b!1279843 () Bool)

(declare-fun res!849918 () Bool)

(assert (=> b!1279843 (=> (not res!849918) (not e!731198))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279843 (= res!849918 (and (= (size!41119 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41118 _keys!1741) (size!41119 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!849916 () Bool)

(assert (=> start!108542 (=> (not res!849916) (not e!731198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108542 (= res!849916 (validMask!0 mask!2175))))

(assert (=> start!108542 e!731198))

(assert (=> start!108542 true))

(declare-fun array_inv!31005 (array!84137) Bool)

(assert (=> start!108542 (and (array_inv!31005 _values!1445) e!731200)))

(declare-fun array_inv!31006 (array!84135) Bool)

(assert (=> start!108542 (array_inv!31006 _keys!1741)))

(assert (= (and start!108542 res!849916) b!1279843))

(assert (= (and b!1279843 res!849918) b!1279841))

(assert (= (and b!1279841 res!849917) b!1279838))

(assert (= (and b!1279840 condMapEmpty!51809) mapIsEmpty!51809))

(assert (= (and b!1279840 (not condMapEmpty!51809)) mapNonEmpty!51809))

(get-info :version)

(assert (= (and mapNonEmpty!51809 ((_ is ValueCellFull!15854) mapValue!51809)) b!1279842))

(assert (= (and b!1279840 ((_ is ValueCellFull!15854) mapDefault!51809)) b!1279839))

(assert (= start!108542 b!1279840))

(declare-fun m!1175421 () Bool)

(assert (=> b!1279838 m!1175421))

(declare-fun m!1175423 () Bool)

(assert (=> mapNonEmpty!51809 m!1175423))

(declare-fun m!1175425 () Bool)

(assert (=> b!1279841 m!1175425))

(declare-fun m!1175427 () Bool)

(assert (=> start!108542 m!1175427))

(declare-fun m!1175429 () Bool)

(assert (=> start!108542 m!1175429))

(declare-fun m!1175431 () Bool)

(assert (=> start!108542 m!1175431))

(check-sat (not start!108542) (not mapNonEmpty!51809) tp_is_empty!33505 (not b!1279841) (not b!1279838))
(check-sat)
