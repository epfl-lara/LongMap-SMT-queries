; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77916 () Bool)

(assert start!77916)

(declare-fun b_free!16477 () Bool)

(declare-fun b_next!16477 () Bool)

(assert (=> start!77916 (= b_free!16477 (not b_next!16477))))

(declare-fun tp!57699 () Bool)

(declare-fun b_and!27021 () Bool)

(assert (=> start!77916 (= tp!57699 b_and!27021)))

(declare-fun b!909657 () Bool)

(declare-fun e!509943 () Bool)

(declare-fun tp_is_empty!18895 () Bool)

(assert (=> b!909657 (= e!509943 tp_is_empty!18895)))

(declare-fun b!909658 () Bool)

(declare-fun e!509941 () Bool)

(assert (=> b!909658 (= e!509941 false)))

(declare-datatypes ((V!30159 0))(
  ( (V!30160 (val!9498 Int)) )
))
(declare-datatypes ((ValueCell!8966 0))(
  ( (ValueCellFull!8966 (v!12005 V!30159)) (EmptyCell!8966) )
))
(declare-datatypes ((array!53797 0))(
  ( (array!53798 (arr!25856 (Array (_ BitVec 32) ValueCell!8966)) (size!26317 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53797)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53799 0))(
  ( (array!53800 (arr!25857 (Array (_ BitVec 32) (_ BitVec 64))) (size!26318 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53799)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30159)

(declare-fun lt!409884 () Bool)

(declare-fun zeroValue!1094 () V!30159)

(declare-datatypes ((tuple2!12404 0))(
  ( (tuple2!12405 (_1!6213 (_ BitVec 64)) (_2!6213 V!30159)) )
))
(declare-datatypes ((List!18189 0))(
  ( (Nil!18186) (Cons!18185 (h!19331 tuple2!12404) (t!25763 List!18189)) )
))
(declare-datatypes ((ListLongMap!11091 0))(
  ( (ListLongMap!11092 (toList!5561 List!18189)) )
))
(declare-fun contains!4561 (ListLongMap!11091 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2763 (array!53799 array!53797 (_ BitVec 32) (_ BitVec 32) V!30159 V!30159 (_ BitVec 32) Int) ListLongMap!11091)

(assert (=> b!909658 (= lt!409884 (contains!4561 (getCurrentListMap!2763 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909659 () Bool)

(declare-fun res!613951 () Bool)

(assert (=> b!909659 (=> (not res!613951) (not e!509941))))

(assert (=> b!909659 (= res!613951 (and (= (size!26317 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26318 _keys!1386) (size!26317 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909660 () Bool)

(declare-fun res!613953 () Bool)

(assert (=> b!909660 (=> (not res!613953) (not e!509941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53799 (_ BitVec 32)) Bool)

(assert (=> b!909660 (= res!613953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30061 () Bool)

(declare-fun mapRes!30061 () Bool)

(assert (=> mapIsEmpty!30061 mapRes!30061))

(declare-fun b!909661 () Bool)

(declare-fun e!509945 () Bool)

(assert (=> b!909661 (= e!509945 tp_is_empty!18895)))

(declare-fun b!909662 () Bool)

(declare-fun e!509944 () Bool)

(assert (=> b!909662 (= e!509944 (and e!509943 mapRes!30061))))

(declare-fun condMapEmpty!30061 () Bool)

(declare-fun mapDefault!30061 () ValueCell!8966)

(assert (=> b!909662 (= condMapEmpty!30061 (= (arr!25856 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8966)) mapDefault!30061)))))

(declare-fun b!909663 () Bool)

(declare-fun res!613952 () Bool)

(assert (=> b!909663 (=> (not res!613952) (not e!509941))))

(declare-datatypes ((List!18190 0))(
  ( (Nil!18187) (Cons!18186 (h!19332 (_ BitVec 64)) (t!25764 List!18190)) )
))
(declare-fun arrayNoDuplicates!0 (array!53799 (_ BitVec 32) List!18190) Bool)

(assert (=> b!909663 (= res!613952 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18187))))

(declare-fun res!613954 () Bool)

(assert (=> start!77916 (=> (not res!613954) (not e!509941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77916 (= res!613954 (validMask!0 mask!1756))))

(assert (=> start!77916 e!509941))

(declare-fun array_inv!20270 (array!53797) Bool)

(assert (=> start!77916 (and (array_inv!20270 _values!1152) e!509944)))

(assert (=> start!77916 tp!57699))

(assert (=> start!77916 true))

(assert (=> start!77916 tp_is_empty!18895))

(declare-fun array_inv!20271 (array!53799) Bool)

(assert (=> start!77916 (array_inv!20271 _keys!1386)))

(declare-fun mapNonEmpty!30061 () Bool)

(declare-fun tp!57700 () Bool)

(assert (=> mapNonEmpty!30061 (= mapRes!30061 (and tp!57700 e!509945))))

(declare-fun mapRest!30061 () (Array (_ BitVec 32) ValueCell!8966))

(declare-fun mapKey!30061 () (_ BitVec 32))

(declare-fun mapValue!30061 () ValueCell!8966)

(assert (=> mapNonEmpty!30061 (= (arr!25856 _values!1152) (store mapRest!30061 mapKey!30061 mapValue!30061))))

(assert (= (and start!77916 res!613954) b!909659))

(assert (= (and b!909659 res!613951) b!909660))

(assert (= (and b!909660 res!613953) b!909663))

(assert (= (and b!909663 res!613952) b!909658))

(assert (= (and b!909662 condMapEmpty!30061) mapIsEmpty!30061))

(assert (= (and b!909662 (not condMapEmpty!30061)) mapNonEmpty!30061))

(get-info :version)

(assert (= (and mapNonEmpty!30061 ((_ is ValueCellFull!8966) mapValue!30061)) b!909661))

(assert (= (and b!909662 ((_ is ValueCellFull!8966) mapDefault!30061)) b!909657))

(assert (= start!77916 b!909662))

(declare-fun m!844271 () Bool)

(assert (=> b!909663 m!844271))

(declare-fun m!844273 () Bool)

(assert (=> b!909658 m!844273))

(assert (=> b!909658 m!844273))

(declare-fun m!844275 () Bool)

(assert (=> b!909658 m!844275))

(declare-fun m!844277 () Bool)

(assert (=> start!77916 m!844277))

(declare-fun m!844279 () Bool)

(assert (=> start!77916 m!844279))

(declare-fun m!844281 () Bool)

(assert (=> start!77916 m!844281))

(declare-fun m!844283 () Bool)

(assert (=> mapNonEmpty!30061 m!844283))

(declare-fun m!844285 () Bool)

(assert (=> b!909660 m!844285))

(check-sat (not b!909663) (not b!909660) (not b!909658) (not mapNonEmpty!30061) (not b_next!16477) (not start!77916) b_and!27021 tp_is_empty!18895)
(check-sat b_and!27021 (not b_next!16477))
