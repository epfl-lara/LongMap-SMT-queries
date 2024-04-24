; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83780 () Bool)

(assert start!83780)

(declare-fun res!654263 () Bool)

(declare-fun e!551156 () Bool)

(assert (=> start!83780 (=> (not res!654263) (not e!551156))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83780 (= res!654263 (validMask!0 mask!1948))))

(assert (=> start!83780 e!551156))

(assert (=> start!83780 true))

(declare-datatypes ((V!34929 0))(
  ( (V!34930 (val!11280 Int)) )
))
(declare-datatypes ((ValueCell!10748 0))(
  ( (ValueCellFull!10748 (v!13838 V!34929)) (EmptyCell!10748) )
))
(declare-datatypes ((array!60986 0))(
  ( (array!60987 (arr!29351 (Array (_ BitVec 32) ValueCell!10748)) (size!29831 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60986)

(declare-fun e!551157 () Bool)

(declare-fun array_inv!22749 (array!60986) Bool)

(assert (=> start!83780 (and (array_inv!22749 _values!1278) e!551157)))

(declare-datatypes ((array!60988 0))(
  ( (array!60989 (arr!29352 (Array (_ BitVec 32) (_ BitVec 64))) (size!29832 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60988)

(declare-fun array_inv!22750 (array!60988) Bool)

(assert (=> start!83780 (array_inv!22750 _keys!1544)))

(declare-fun mapNonEmpty!35702 () Bool)

(declare-fun mapRes!35702 () Bool)

(declare-fun tp!67955 () Bool)

(declare-fun e!551154 () Bool)

(assert (=> mapNonEmpty!35702 (= mapRes!35702 (and tp!67955 e!551154))))

(declare-fun mapRest!35702 () (Array (_ BitVec 32) ValueCell!10748))

(declare-fun mapValue!35702 () ValueCell!10748)

(declare-fun mapKey!35702 () (_ BitVec 32))

(assert (=> mapNonEmpty!35702 (= (arr!29351 _values!1278) (store mapRest!35702 mapKey!35702 mapValue!35702))))

(declare-fun b!977805 () Bool)

(declare-fun tp_is_empty!22459 () Bool)

(assert (=> b!977805 (= e!551154 tp_is_empty!22459)))

(declare-fun b!977806 () Bool)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977806 (= e!551156 (and (= (size!29831 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29832 _keys!1544) (size!29831 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011) (not (= (size!29832 _keys!1544) (bvadd #b00000000000000000000000000000001 mask!1948)))))))

(declare-fun b!977807 () Bool)

(declare-fun e!551158 () Bool)

(assert (=> b!977807 (= e!551157 (and e!551158 mapRes!35702))))

(declare-fun condMapEmpty!35702 () Bool)

(declare-fun mapDefault!35702 () ValueCell!10748)

(assert (=> b!977807 (= condMapEmpty!35702 (= (arr!29351 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10748)) mapDefault!35702)))))

(declare-fun mapIsEmpty!35702 () Bool)

(assert (=> mapIsEmpty!35702 mapRes!35702))

(declare-fun b!977808 () Bool)

(assert (=> b!977808 (= e!551158 tp_is_empty!22459)))

(assert (= (and start!83780 res!654263) b!977806))

(assert (= (and b!977807 condMapEmpty!35702) mapIsEmpty!35702))

(assert (= (and b!977807 (not condMapEmpty!35702)) mapNonEmpty!35702))

(get-info :version)

(assert (= (and mapNonEmpty!35702 ((_ is ValueCellFull!10748) mapValue!35702)) b!977805))

(assert (= (and b!977807 ((_ is ValueCellFull!10748) mapDefault!35702)) b!977808))

(assert (= start!83780 b!977807))

(declare-fun m!905665 () Bool)

(assert (=> start!83780 m!905665))

(declare-fun m!905667 () Bool)

(assert (=> start!83780 m!905667))

(declare-fun m!905669 () Bool)

(assert (=> start!83780 m!905669))

(declare-fun m!905671 () Bool)

(assert (=> mapNonEmpty!35702 m!905671))

(check-sat (not start!83780) (not mapNonEmpty!35702) tp_is_empty!22459)
(check-sat)
