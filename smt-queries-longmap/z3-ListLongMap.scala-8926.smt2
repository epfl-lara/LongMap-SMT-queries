; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108238 () Bool)

(assert start!108238)

(declare-fun res!849159 () Bool)

(declare-fun e!729958 () Bool)

(assert (=> start!108238 (=> (not res!849159) (not e!729958))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108238 (= res!849159 (validMask!0 mask!2175))))

(assert (=> start!108238 e!729958))

(assert (=> start!108238 true))

(declare-datatypes ((V!49729 0))(
  ( (V!49730 (val!16809 Int)) )
))
(declare-datatypes ((ValueCell!15836 0))(
  ( (ValueCellFull!15836 (v!19407 V!49729)) (EmptyCell!15836) )
))
(declare-datatypes ((array!83927 0))(
  ( (array!83928 (arr!40473 (Array (_ BitVec 32) ValueCell!15836)) (size!41025 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!83927)

(declare-fun e!729959 () Bool)

(declare-fun array_inv!30907 (array!83927) Bool)

(assert (=> start!108238 (and (array_inv!30907 _values!1445) e!729959)))

(declare-datatypes ((array!83929 0))(
  ( (array!83930 (arr!40474 (Array (_ BitVec 32) (_ BitVec 64))) (size!41026 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!83929)

(declare-fun array_inv!30908 (array!83929) Bool)

(assert (=> start!108238 (array_inv!30908 _keys!1741)))

(declare-fun b!1278033 () Bool)

(declare-fun e!729961 () Bool)

(declare-fun tp_is_empty!33469 () Bool)

(assert (=> b!1278033 (= e!729961 tp_is_empty!33469)))

(declare-fun b!1278034 () Bool)

(declare-fun e!729957 () Bool)

(assert (=> b!1278034 (= e!729957 tp_is_empty!33469)))

(declare-fun mapNonEmpty!51740 () Bool)

(declare-fun mapRes!51740 () Bool)

(declare-fun tp!98715 () Bool)

(assert (=> mapNonEmpty!51740 (= mapRes!51740 (and tp!98715 e!729957))))

(declare-fun mapKey!51740 () (_ BitVec 32))

(declare-fun mapValue!51740 () ValueCell!15836)

(declare-fun mapRest!51740 () (Array (_ BitVec 32) ValueCell!15836))

(assert (=> mapNonEmpty!51740 (= (arr!40473 _values!1445) (store mapRest!51740 mapKey!51740 mapValue!51740))))

(declare-fun b!1278035 () Bool)

(assert (=> b!1278035 (= e!729959 (and e!729961 mapRes!51740))))

(declare-fun condMapEmpty!51740 () Bool)

(declare-fun mapDefault!51740 () ValueCell!15836)

(assert (=> b!1278035 (= condMapEmpty!51740 (= (arr!40473 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15836)) mapDefault!51740)))))

(declare-fun b!1278036 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278036 (= e!729958 (and (= (size!41025 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41026 _keys!1741) (size!41025 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011) (not (= (size!41026 _keys!1741) (bvadd #b00000000000000000000000000000001 mask!2175)))))))

(declare-fun mapIsEmpty!51740 () Bool)

(assert (=> mapIsEmpty!51740 mapRes!51740))

(assert (= (and start!108238 res!849159) b!1278036))

(assert (= (and b!1278035 condMapEmpty!51740) mapIsEmpty!51740))

(assert (= (and b!1278035 (not condMapEmpty!51740)) mapNonEmpty!51740))

(get-info :version)

(assert (= (and mapNonEmpty!51740 ((_ is ValueCellFull!15836) mapValue!51740)) b!1278034))

(assert (= (and b!1278035 ((_ is ValueCellFull!15836) mapDefault!51740)) b!1278033))

(assert (= start!108238 b!1278035))

(declare-fun m!1173041 () Bool)

(assert (=> start!108238 m!1173041))

(declare-fun m!1173043 () Bool)

(assert (=> start!108238 m!1173043))

(declare-fun m!1173045 () Bool)

(assert (=> start!108238 m!1173045))

(declare-fun m!1173047 () Bool)

(assert (=> mapNonEmpty!51740 m!1173047))

(check-sat (not start!108238) (not mapNonEmpty!51740) tp_is_empty!33469)
(check-sat)
