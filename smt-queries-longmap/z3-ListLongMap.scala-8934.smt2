; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108554 () Bool)

(assert start!108554)

(declare-fun b!1279946 () Bool)

(declare-fun res!849970 () Bool)

(declare-fun e!731291 () Bool)

(assert (=> b!1279946 (=> (not res!849970) (not e!731291))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49793 0))(
  ( (V!49794 (val!16833 Int)) )
))
(declare-datatypes ((ValueCell!15860 0))(
  ( (ValueCellFull!15860 (v!19428 V!49793)) (EmptyCell!15860) )
))
(declare-datatypes ((array!84157 0))(
  ( (array!84158 (arr!40578 (Array (_ BitVec 32) ValueCell!15860)) (size!41129 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84157)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84159 0))(
  ( (array!84160 (arr!40579 (Array (_ BitVec 32) (_ BitVec 64))) (size!41130 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84159)

(assert (=> b!1279946 (= res!849970 (and (= (size!41129 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41130 _keys!1741) (size!41129 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51827 () Bool)

(declare-fun mapRes!51827 () Bool)

(assert (=> mapIsEmpty!51827 mapRes!51827))

(declare-fun res!849972 () Bool)

(assert (=> start!108554 (=> (not res!849972) (not e!731291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108554 (= res!849972 (validMask!0 mask!2175))))

(assert (=> start!108554 e!731291))

(assert (=> start!108554 true))

(declare-fun e!731292 () Bool)

(declare-fun array_inv!31009 (array!84157) Bool)

(assert (=> start!108554 (and (array_inv!31009 _values!1445) e!731292)))

(declare-fun array_inv!31010 (array!84159) Bool)

(assert (=> start!108554 (array_inv!31010 _keys!1741)))

(declare-fun mapNonEmpty!51827 () Bool)

(declare-fun tp!98801 () Bool)

(declare-fun e!731290 () Bool)

(assert (=> mapNonEmpty!51827 (= mapRes!51827 (and tp!98801 e!731290))))

(declare-fun mapKey!51827 () (_ BitVec 32))

(declare-fun mapRest!51827 () (Array (_ BitVec 32) ValueCell!15860))

(declare-fun mapValue!51827 () ValueCell!15860)

(assert (=> mapNonEmpty!51827 (= (arr!40578 _values!1445) (store mapRest!51827 mapKey!51827 mapValue!51827))))

(declare-fun b!1279947 () Bool)

(declare-fun e!731289 () Bool)

(assert (=> b!1279947 (= e!731292 (and e!731289 mapRes!51827))))

(declare-fun condMapEmpty!51827 () Bool)

(declare-fun mapDefault!51827 () ValueCell!15860)

(assert (=> b!1279947 (= condMapEmpty!51827 (= (arr!40578 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15860)) mapDefault!51827)))))

(declare-fun b!1279948 () Bool)

(declare-fun tp_is_empty!33517 () Bool)

(assert (=> b!1279948 (= e!731289 tp_is_empty!33517)))

(declare-fun b!1279949 () Bool)

(assert (=> b!1279949 (= e!731291 false)))

(declare-fun lt!576390 () Bool)

(declare-datatypes ((List!28783 0))(
  ( (Nil!28780) (Cons!28779 (h!29997 (_ BitVec 64)) (t!42315 List!28783)) )
))
(declare-fun arrayNoDuplicates!0 (array!84159 (_ BitVec 32) List!28783) Bool)

(assert (=> b!1279949 (= lt!576390 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28780))))

(declare-fun b!1279950 () Bool)

(assert (=> b!1279950 (= e!731290 tp_is_empty!33517)))

(declare-fun b!1279951 () Bool)

(declare-fun res!849971 () Bool)

(assert (=> b!1279951 (=> (not res!849971) (not e!731291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84159 (_ BitVec 32)) Bool)

(assert (=> b!1279951 (= res!849971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108554 res!849972) b!1279946))

(assert (= (and b!1279946 res!849970) b!1279951))

(assert (= (and b!1279951 res!849971) b!1279949))

(assert (= (and b!1279947 condMapEmpty!51827) mapIsEmpty!51827))

(assert (= (and b!1279947 (not condMapEmpty!51827)) mapNonEmpty!51827))

(get-info :version)

(assert (= (and mapNonEmpty!51827 ((_ is ValueCellFull!15860) mapValue!51827)) b!1279950))

(assert (= (and b!1279947 ((_ is ValueCellFull!15860) mapDefault!51827)) b!1279948))

(assert (= start!108554 b!1279947))

(declare-fun m!1175493 () Bool)

(assert (=> start!108554 m!1175493))

(declare-fun m!1175495 () Bool)

(assert (=> start!108554 m!1175495))

(declare-fun m!1175497 () Bool)

(assert (=> start!108554 m!1175497))

(declare-fun m!1175499 () Bool)

(assert (=> mapNonEmpty!51827 m!1175499))

(declare-fun m!1175501 () Bool)

(assert (=> b!1279949 m!1175501))

(declare-fun m!1175503 () Bool)

(assert (=> b!1279951 m!1175503))

(check-sat tp_is_empty!33517 (not b!1279951) (not b!1279949) (not start!108554) (not mapNonEmpty!51827))
(check-sat)
