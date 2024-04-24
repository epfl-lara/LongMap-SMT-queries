; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108462 () Bool)

(assert start!108462)

(declare-fun b!1279402 () Bool)

(declare-fun e!730836 () Bool)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49729 0))(
  ( (V!49730 (val!16809 Int)) )
))
(declare-datatypes ((ValueCell!15836 0))(
  ( (ValueCellFull!15836 (v!19403 V!49729)) (EmptyCell!15836) )
))
(declare-datatypes ((array!84059 0))(
  ( (array!84060 (arr!40534 (Array (_ BitVec 32) ValueCell!15836)) (size!41085 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84059)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84061 0))(
  ( (array!84062 (arr!40535 (Array (_ BitVec 32) (_ BitVec 64))) (size!41086 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84061)

(assert (=> b!1279402 (= e!730836 (and (= (size!41085 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41086 _keys!1741) (size!41085 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011) (not (= (size!41086 _keys!1741) (bvadd #b00000000000000000000000000000001 mask!2175)))))))

(declare-fun b!1279403 () Bool)

(declare-fun e!730833 () Bool)

(declare-fun e!730837 () Bool)

(declare-fun mapRes!51740 () Bool)

(assert (=> b!1279403 (= e!730833 (and e!730837 mapRes!51740))))

(declare-fun condMapEmpty!51740 () Bool)

(declare-fun mapDefault!51740 () ValueCell!15836)

(assert (=> b!1279403 (= condMapEmpty!51740 (= (arr!40534 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15836)) mapDefault!51740)))))

(declare-fun mapNonEmpty!51740 () Bool)

(declare-fun tp!98714 () Bool)

(declare-fun e!730835 () Bool)

(assert (=> mapNonEmpty!51740 (= mapRes!51740 (and tp!98714 e!730835))))

(declare-fun mapKey!51740 () (_ BitVec 32))

(declare-fun mapRest!51740 () (Array (_ BitVec 32) ValueCell!15836))

(declare-fun mapValue!51740 () ValueCell!15836)

(assert (=> mapNonEmpty!51740 (= (arr!40534 _values!1445) (store mapRest!51740 mapKey!51740 mapValue!51740))))

(declare-fun mapIsEmpty!51740 () Bool)

(assert (=> mapIsEmpty!51740 mapRes!51740))

(declare-fun b!1279404 () Bool)

(declare-fun tp_is_empty!33469 () Bool)

(assert (=> b!1279404 (= e!730835 tp_is_empty!33469)))

(declare-fun res!849706 () Bool)

(assert (=> start!108462 (=> (not res!849706) (not e!730836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108462 (= res!849706 (validMask!0 mask!2175))))

(assert (=> start!108462 e!730836))

(assert (=> start!108462 true))

(declare-fun array_inv!30977 (array!84059) Bool)

(assert (=> start!108462 (and (array_inv!30977 _values!1445) e!730833)))

(declare-fun array_inv!30978 (array!84061) Bool)

(assert (=> start!108462 (array_inv!30978 _keys!1741)))

(declare-fun b!1279405 () Bool)

(assert (=> b!1279405 (= e!730837 tp_is_empty!33469)))

(assert (= (and start!108462 res!849706) b!1279402))

(assert (= (and b!1279403 condMapEmpty!51740) mapIsEmpty!51740))

(assert (= (and b!1279403 (not condMapEmpty!51740)) mapNonEmpty!51740))

(get-info :version)

(assert (= (and mapNonEmpty!51740 ((_ is ValueCellFull!15836) mapValue!51740)) b!1279404))

(assert (= (and b!1279403 ((_ is ValueCellFull!15836) mapDefault!51740)) b!1279405))

(assert (= start!108462 b!1279403))

(declare-fun m!1175153 () Bool)

(assert (=> mapNonEmpty!51740 m!1175153))

(declare-fun m!1175155 () Bool)

(assert (=> start!108462 m!1175155))

(declare-fun m!1175157 () Bool)

(assert (=> start!108462 m!1175157))

(declare-fun m!1175159 () Bool)

(assert (=> start!108462 m!1175159))

(check-sat (not start!108462) (not mapNonEmpty!51740) tp_is_empty!33469)
(check-sat)
