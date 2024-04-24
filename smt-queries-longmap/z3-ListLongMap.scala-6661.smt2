; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84106 () Bool)

(assert start!84106)

(declare-fun b!981856 () Bool)

(declare-fun e!553526 () Bool)

(declare-fun e!553527 () Bool)

(declare-fun mapRes!36140 () Bool)

(assert (=> b!981856 (= e!553526 (and e!553527 mapRes!36140))))

(declare-fun condMapEmpty!36140 () Bool)

(declare-datatypes ((V!35305 0))(
  ( (V!35306 (val!11421 Int)) )
))
(declare-datatypes ((ValueCell!10889 0))(
  ( (ValueCellFull!10889 (v!13980 V!35305)) (EmptyCell!10889) )
))
(declare-datatypes ((array!61518 0))(
  ( (array!61519 (arr!29612 (Array (_ BitVec 32) ValueCell!10889)) (size!30092 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61518)

(declare-fun mapDefault!36140 () ValueCell!10889)

(assert (=> b!981856 (= condMapEmpty!36140 (= (arr!29612 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10889)) mapDefault!36140)))))

(declare-fun b!981857 () Bool)

(declare-fun tp_is_empty!22741 () Bool)

(assert (=> b!981857 (= e!553527 tp_is_empty!22741)))

(declare-fun res!656815 () Bool)

(declare-fun e!553528 () Bool)

(assert (=> start!84106 (=> (not res!656815) (not e!553528))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84106 (= res!656815 (validMask!0 mask!1948))))

(assert (=> start!84106 e!553528))

(assert (=> start!84106 true))

(declare-fun array_inv!22923 (array!61518) Bool)

(assert (=> start!84106 (and (array_inv!22923 _values!1278) e!553526)))

(declare-datatypes ((array!61520 0))(
  ( (array!61521 (arr!29613 (Array (_ BitVec 32) (_ BitVec 64))) (size!30093 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61520)

(declare-fun array_inv!22924 (array!61520) Bool)

(assert (=> start!84106 (array_inv!22924 _keys!1544)))

(declare-fun mapIsEmpty!36140 () Bool)

(assert (=> mapIsEmpty!36140 mapRes!36140))

(declare-fun b!981858 () Bool)

(declare-fun e!553529 () Bool)

(assert (=> b!981858 (= e!553529 tp_is_empty!22741)))

(declare-fun b!981859 () Bool)

(assert (=> b!981859 (= e!553528 false)))

(declare-fun lt!435990 () Bool)

(declare-datatypes ((List!20520 0))(
  ( (Nil!20517) (Cons!20516 (h!21684 (_ BitVec 64)) (t!29195 List!20520)) )
))
(declare-fun arrayNoDuplicates!0 (array!61520 (_ BitVec 32) List!20520) Bool)

(assert (=> b!981859 (= lt!435990 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20517))))

(declare-fun b!981860 () Bool)

(declare-fun res!656813 () Bool)

(assert (=> b!981860 (=> (not res!656813) (not e!553528))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981860 (= res!656813 (and (= (size!30092 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30093 _keys!1544) (size!30092 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981861 () Bool)

(declare-fun res!656814 () Bool)

(assert (=> b!981861 (=> (not res!656814) (not e!553528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61520 (_ BitVec 32)) Bool)

(assert (=> b!981861 (= res!656814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36140 () Bool)

(declare-fun tp!68654 () Bool)

(assert (=> mapNonEmpty!36140 (= mapRes!36140 (and tp!68654 e!553529))))

(declare-fun mapValue!36140 () ValueCell!10889)

(declare-fun mapRest!36140 () (Array (_ BitVec 32) ValueCell!10889))

(declare-fun mapKey!36140 () (_ BitVec 32))

(assert (=> mapNonEmpty!36140 (= (arr!29612 _values!1278) (store mapRest!36140 mapKey!36140 mapValue!36140))))

(assert (= (and start!84106 res!656815) b!981860))

(assert (= (and b!981860 res!656813) b!981861))

(assert (= (and b!981861 res!656814) b!981859))

(assert (= (and b!981856 condMapEmpty!36140) mapIsEmpty!36140))

(assert (= (and b!981856 (not condMapEmpty!36140)) mapNonEmpty!36140))

(get-info :version)

(assert (= (and mapNonEmpty!36140 ((_ is ValueCellFull!10889) mapValue!36140)) b!981858))

(assert (= (and b!981856 ((_ is ValueCellFull!10889) mapDefault!36140)) b!981857))

(assert (= start!84106 b!981856))

(declare-fun m!909785 () Bool)

(assert (=> start!84106 m!909785))

(declare-fun m!909787 () Bool)

(assert (=> start!84106 m!909787))

(declare-fun m!909789 () Bool)

(assert (=> start!84106 m!909789))

(declare-fun m!909791 () Bool)

(assert (=> b!981859 m!909791))

(declare-fun m!909793 () Bool)

(assert (=> b!981861 m!909793))

(declare-fun m!909795 () Bool)

(assert (=> mapNonEmpty!36140 m!909795))

(check-sat (not b!981859) (not mapNonEmpty!36140) (not start!84106) tp_is_empty!22741 (not b!981861))
(check-sat)
