; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4142 () Bool)

(assert start!4142)

(declare-fun b_free!1047 () Bool)

(declare-fun b_next!1047 () Bool)

(assert (=> start!4142 (= b_free!1047 (not b_next!1047))))

(declare-fun tp!4560 () Bool)

(declare-fun b_and!1857 () Bool)

(assert (=> start!4142 (= tp!4560 b_and!1857)))

(declare-fun b!31127 () Bool)

(declare-fun e!19915 () Bool)

(declare-datatypes ((array!2025 0))(
  ( (array!2026 (arr!966 (Array (_ BitVec 32) (_ BitVec 64))) (size!1067 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2025)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31127 (= e!19915 (not (= (size!1067 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun b!31128 () Bool)

(declare-fun res!18835 () Bool)

(assert (=> b!31128 (=> (not res!18835) (not e!19915))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31128 (= res!18835 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!1630 () Bool)

(declare-fun mapRes!1630 () Bool)

(declare-fun tp!4561 () Bool)

(declare-fun e!19917 () Bool)

(assert (=> mapNonEmpty!1630 (= mapRes!1630 (and tp!4561 e!19917))))

(declare-fun mapKey!1630 () (_ BitVec 32))

(declare-datatypes ((V!1693 0))(
  ( (V!1694 (val!727 Int)) )
))
(declare-datatypes ((ValueCell!501 0))(
  ( (ValueCellFull!501 (v!1816 V!1693)) (EmptyCell!501) )
))
(declare-fun mapRest!1630 () (Array (_ BitVec 32) ValueCell!501))

(declare-fun mapValue!1630 () ValueCell!501)

(declare-datatypes ((array!2027 0))(
  ( (array!2028 (arr!967 (Array (_ BitVec 32) ValueCell!501)) (size!1068 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2027)

(assert (=> mapNonEmpty!1630 (= (arr!967 _values!1501) (store mapRest!1630 mapKey!1630 mapValue!1630))))

(declare-fun b!31130 () Bool)

(declare-fun tp_is_empty!1401 () Bool)

(assert (=> b!31130 (= e!19917 tp_is_empty!1401)))

(declare-fun b!31131 () Bool)

(declare-fun e!19916 () Bool)

(declare-fun e!19918 () Bool)

(assert (=> b!31131 (= e!19916 (and e!19918 mapRes!1630))))

(declare-fun condMapEmpty!1630 () Bool)

(declare-fun mapDefault!1630 () ValueCell!501)

(assert (=> b!31131 (= condMapEmpty!1630 (= (arr!967 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!501)) mapDefault!1630)))))

(declare-fun mapIsEmpty!1630 () Bool)

(assert (=> mapIsEmpty!1630 mapRes!1630))

(declare-fun b!31132 () Bool)

(declare-fun res!18833 () Bool)

(assert (=> b!31132 (=> (not res!18833) (not e!19915))))

(declare-datatypes ((List!784 0))(
  ( (Nil!781) (Cons!780 (h!1347 (_ BitVec 64)) (t!3477 List!784)) )
))
(declare-fun arrayNoDuplicates!0 (array!2025 (_ BitVec 32) List!784) Bool)

(assert (=> b!31132 (= res!18833 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!781))))

(declare-fun b!31133 () Bool)

(declare-fun res!18840 () Bool)

(assert (=> b!31133 (=> (not res!18840) (not e!19915))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!118 0))(
  ( (MissingZero!118 (index!2594 (_ BitVec 32))) (Found!118 (index!2595 (_ BitVec 32))) (Intermediate!118 (undefined!930 Bool) (index!2596 (_ BitVec 32)) (x!6604 (_ BitVec 32))) (Undefined!118) (MissingVacant!118 (index!2597 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!2025 (_ BitVec 32)) SeekEntryResult!118)

(assert (=> b!31133 (= res!18840 (not ((_ is Found!118) (seekEntry!0 k0!1304 _keys!1833 mask!2294))))))

(declare-fun b!31134 () Bool)

(declare-fun res!18839 () Bool)

(assert (=> b!31134 (=> (not res!18839) (not e!19915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31134 (= res!18839 (validKeyInArray!0 k0!1304))))

(declare-fun b!31135 () Bool)

(declare-fun res!18838 () Bool)

(assert (=> b!31135 (=> (not res!18838) (not e!19915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2025 (_ BitVec 32)) Bool)

(assert (=> b!31135 (= res!18838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31136 () Bool)

(assert (=> b!31136 (= e!19918 tp_is_empty!1401)))

(declare-fun b!31137 () Bool)

(declare-fun res!18834 () Bool)

(assert (=> b!31137 (=> (not res!18834) (not e!19915))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31137 (= res!18834 (and (= (size!1068 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1067 _keys!1833) (size!1068 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31129 () Bool)

(declare-fun res!18837 () Bool)

(assert (=> b!31129 (=> (not res!18837) (not e!19915))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1693)

(declare-fun minValue!1443 () V!1693)

(declare-datatypes ((tuple2!1192 0))(
  ( (tuple2!1193 (_1!607 (_ BitVec 64)) (_2!607 V!1693)) )
))
(declare-datatypes ((List!785 0))(
  ( (Nil!782) (Cons!781 (h!1348 tuple2!1192) (t!3478 List!785)) )
))
(declare-datatypes ((ListLongMap!769 0))(
  ( (ListLongMap!770 (toList!400 List!785)) )
))
(declare-fun contains!340 (ListLongMap!769 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!228 (array!2025 array!2027 (_ BitVec 32) (_ BitVec 32) V!1693 V!1693 (_ BitVec 32) Int) ListLongMap!769)

(assert (=> b!31129 (= res!18837 (not (contains!340 (getCurrentListMap!228 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!18836 () Bool)

(assert (=> start!4142 (=> (not res!18836) (not e!19915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4142 (= res!18836 (validMask!0 mask!2294))))

(assert (=> start!4142 e!19915))

(assert (=> start!4142 true))

(assert (=> start!4142 tp!4560))

(declare-fun array_inv!675 (array!2027) Bool)

(assert (=> start!4142 (and (array_inv!675 _values!1501) e!19916)))

(declare-fun array_inv!676 (array!2025) Bool)

(assert (=> start!4142 (array_inv!676 _keys!1833)))

(assert (=> start!4142 tp_is_empty!1401))

(assert (= (and start!4142 res!18836) b!31137))

(assert (= (and b!31137 res!18834) b!31135))

(assert (= (and b!31135 res!18838) b!31132))

(assert (= (and b!31132 res!18833) b!31134))

(assert (= (and b!31134 res!18839) b!31129))

(assert (= (and b!31129 res!18837) b!31128))

(assert (= (and b!31128 res!18835) b!31133))

(assert (= (and b!31133 res!18840) b!31127))

(assert (= (and b!31131 condMapEmpty!1630) mapIsEmpty!1630))

(assert (= (and b!31131 (not condMapEmpty!1630)) mapNonEmpty!1630))

(assert (= (and mapNonEmpty!1630 ((_ is ValueCellFull!501) mapValue!1630)) b!31130))

(assert (= (and b!31131 ((_ is ValueCellFull!501) mapDefault!1630)) b!31136))

(assert (= start!4142 b!31131))

(declare-fun m!24989 () Bool)

(assert (=> b!31135 m!24989))

(declare-fun m!24991 () Bool)

(assert (=> start!4142 m!24991))

(declare-fun m!24993 () Bool)

(assert (=> start!4142 m!24993))

(declare-fun m!24995 () Bool)

(assert (=> start!4142 m!24995))

(declare-fun m!24997 () Bool)

(assert (=> b!31132 m!24997))

(declare-fun m!24999 () Bool)

(assert (=> mapNonEmpty!1630 m!24999))

(declare-fun m!25001 () Bool)

(assert (=> b!31129 m!25001))

(assert (=> b!31129 m!25001))

(declare-fun m!25003 () Bool)

(assert (=> b!31129 m!25003))

(declare-fun m!25005 () Bool)

(assert (=> b!31128 m!25005))

(declare-fun m!25007 () Bool)

(assert (=> b!31134 m!25007))

(declare-fun m!25009 () Bool)

(assert (=> b!31133 m!25009))

(check-sat (not b!31132) b_and!1857 (not b!31135) (not start!4142) (not b!31133) (not b_next!1047) (not b!31134) (not b!31129) (not b!31128) tp_is_empty!1401 (not mapNonEmpty!1630))
(check-sat b_and!1857 (not b_next!1047))
