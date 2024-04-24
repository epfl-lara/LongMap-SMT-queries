; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108548 () Bool)

(assert start!108548)

(declare-fun res!849943 () Bool)

(declare-fun e!731246 () Bool)

(assert (=> start!108548 (=> (not res!849943) (not e!731246))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108548 (= res!849943 (validMask!0 mask!2175))))

(assert (=> start!108548 e!731246))

(assert (=> start!108548 true))

(declare-datatypes ((V!49785 0))(
  ( (V!49786 (val!16830 Int)) )
))
(declare-datatypes ((ValueCell!15857 0))(
  ( (ValueCellFull!15857 (v!19425 V!49785)) (EmptyCell!15857) )
))
(declare-datatypes ((array!84145 0))(
  ( (array!84146 (arr!40572 (Array (_ BitVec 32) ValueCell!15857)) (size!41123 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84145)

(declare-fun e!731247 () Bool)

(declare-fun array_inv!31007 (array!84145) Bool)

(assert (=> start!108548 (and (array_inv!31007 _values!1445) e!731247)))

(declare-datatypes ((array!84147 0))(
  ( (array!84148 (arr!40573 (Array (_ BitVec 32) (_ BitVec 64))) (size!41124 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84147)

(declare-fun array_inv!31008 (array!84147) Bool)

(assert (=> start!108548 (array_inv!31008 _keys!1741)))

(declare-fun b!1279892 () Bool)

(declare-fun res!849945 () Bool)

(assert (=> b!1279892 (=> (not res!849945) (not e!731246))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279892 (= res!849945 (and (= (size!41123 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41124 _keys!1741) (size!41123 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279893 () Bool)

(declare-fun res!849944 () Bool)

(assert (=> b!1279893 (=> (not res!849944) (not e!731246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84147 (_ BitVec 32)) Bool)

(assert (=> b!1279893 (= res!849944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279894 () Bool)

(declare-fun e!731245 () Bool)

(declare-fun tp_is_empty!33511 () Bool)

(assert (=> b!1279894 (= e!731245 tp_is_empty!33511)))

(declare-fun mapIsEmpty!51818 () Bool)

(declare-fun mapRes!51818 () Bool)

(assert (=> mapIsEmpty!51818 mapRes!51818))

(declare-fun mapNonEmpty!51818 () Bool)

(declare-fun tp!98792 () Bool)

(assert (=> mapNonEmpty!51818 (= mapRes!51818 (and tp!98792 e!731245))))

(declare-fun mapKey!51818 () (_ BitVec 32))

(declare-fun mapValue!51818 () ValueCell!15857)

(declare-fun mapRest!51818 () (Array (_ BitVec 32) ValueCell!15857))

(assert (=> mapNonEmpty!51818 (= (arr!40572 _values!1445) (store mapRest!51818 mapKey!51818 mapValue!51818))))

(declare-fun b!1279895 () Bool)

(assert (=> b!1279895 (= e!731246 false)))

(declare-fun lt!576381 () Bool)

(declare-datatypes ((List!28780 0))(
  ( (Nil!28777) (Cons!28776 (h!29994 (_ BitVec 64)) (t!42312 List!28780)) )
))
(declare-fun arrayNoDuplicates!0 (array!84147 (_ BitVec 32) List!28780) Bool)

(assert (=> b!1279895 (= lt!576381 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28777))))

(declare-fun b!1279896 () Bool)

(declare-fun e!731244 () Bool)

(assert (=> b!1279896 (= e!731247 (and e!731244 mapRes!51818))))

(declare-fun condMapEmpty!51818 () Bool)

(declare-fun mapDefault!51818 () ValueCell!15857)

(assert (=> b!1279896 (= condMapEmpty!51818 (= (arr!40572 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15857)) mapDefault!51818)))))

(declare-fun b!1279897 () Bool)

(assert (=> b!1279897 (= e!731244 tp_is_empty!33511)))

(assert (= (and start!108548 res!849943) b!1279892))

(assert (= (and b!1279892 res!849945) b!1279893))

(assert (= (and b!1279893 res!849944) b!1279895))

(assert (= (and b!1279896 condMapEmpty!51818) mapIsEmpty!51818))

(assert (= (and b!1279896 (not condMapEmpty!51818)) mapNonEmpty!51818))

(get-info :version)

(assert (= (and mapNonEmpty!51818 ((_ is ValueCellFull!15857) mapValue!51818)) b!1279894))

(assert (= (and b!1279896 ((_ is ValueCellFull!15857) mapDefault!51818)) b!1279897))

(assert (= start!108548 b!1279896))

(declare-fun m!1175457 () Bool)

(assert (=> start!108548 m!1175457))

(declare-fun m!1175459 () Bool)

(assert (=> start!108548 m!1175459))

(declare-fun m!1175461 () Bool)

(assert (=> start!108548 m!1175461))

(declare-fun m!1175463 () Bool)

(assert (=> b!1279893 m!1175463))

(declare-fun m!1175465 () Bool)

(assert (=> mapNonEmpty!51818 m!1175465))

(declare-fun m!1175467 () Bool)

(assert (=> b!1279895 m!1175467))

(check-sat (not start!108548) tp_is_empty!33511 (not b!1279895) (not mapNonEmpty!51818) (not b!1279893))
(check-sat)
