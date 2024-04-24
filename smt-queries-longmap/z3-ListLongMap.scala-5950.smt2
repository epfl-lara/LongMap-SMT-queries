; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77694 () Bool)

(assert start!77694)

(declare-fun b_free!16111 () Bool)

(declare-fun b_next!16111 () Bool)

(assert (=> start!77694 (= b_free!16111 (not b_next!16111))))

(declare-fun tp!56595 () Bool)

(declare-fun b_and!26487 () Bool)

(assert (=> start!77694 (= tp!56595 b_and!26487)))

(declare-fun b!904202 () Bool)

(declare-fun e!506665 () Bool)

(declare-fun tp_is_empty!18529 () Bool)

(assert (=> b!904202 (= e!506665 tp_is_empty!18529)))

(declare-fun b!904203 () Bool)

(declare-fun res!609805 () Bool)

(declare-fun e!506664 () Bool)

(assert (=> b!904203 (=> (not res!609805) (not e!506664))))

(declare-datatypes ((array!53153 0))(
  ( (array!53154 (arr!25531 (Array (_ BitVec 32) (_ BitVec 64))) (size!25991 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53153)

(declare-datatypes ((List!17877 0))(
  ( (Nil!17874) (Cons!17873 (h!19025 (_ BitVec 64)) (t!25252 List!17877)) )
))
(declare-fun arrayNoDuplicates!0 (array!53153 (_ BitVec 32) List!17877) Bool)

(assert (=> b!904203 (= res!609805 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17874))))

(declare-fun b!904204 () Bool)

(declare-fun res!609806 () Bool)

(assert (=> b!904204 (=> (not res!609806) (not e!506664))))

(declare-datatypes ((V!29671 0))(
  ( (V!29672 (val!9315 Int)) )
))
(declare-datatypes ((ValueCell!8783 0))(
  ( (ValueCellFull!8783 (v!11817 V!29671)) (EmptyCell!8783) )
))
(declare-datatypes ((array!53155 0))(
  ( (array!53156 (arr!25532 (Array (_ BitVec 32) ValueCell!8783)) (size!25992 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53155)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!904204 (= res!609806 (and (= (size!25992 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25991 _keys!1386) (size!25992 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609807 () Bool)

(assert (=> start!77694 (=> (not res!609807) (not e!506664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77694 (= res!609807 (validMask!0 mask!1756))))

(assert (=> start!77694 e!506664))

(declare-fun e!506666 () Bool)

(declare-fun array_inv!20076 (array!53155) Bool)

(assert (=> start!77694 (and (array_inv!20076 _values!1152) e!506666)))

(assert (=> start!77694 tp!56595))

(assert (=> start!77694 true))

(assert (=> start!77694 tp_is_empty!18529))

(declare-fun array_inv!20077 (array!53153) Bool)

(assert (=> start!77694 (array_inv!20077 _keys!1386)))

(declare-fun b!904205 () Bool)

(assert (=> b!904205 (= e!506664 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!408349 () Bool)

(declare-fun zeroValue!1094 () V!29671)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29671)

(declare-datatypes ((tuple2!12026 0))(
  ( (tuple2!12027 (_1!6024 (_ BitVec 64)) (_2!6024 V!29671)) )
))
(declare-datatypes ((List!17878 0))(
  ( (Nil!17875) (Cons!17874 (h!19026 tuple2!12026) (t!25253 List!17878)) )
))
(declare-datatypes ((ListLongMap!10725 0))(
  ( (ListLongMap!10726 (toList!5378 List!17878)) )
))
(declare-fun contains!4436 (ListLongMap!10725 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2647 (array!53153 array!53155 (_ BitVec 32) (_ BitVec 32) V!29671 V!29671 (_ BitVec 32) Int) ListLongMap!10725)

(assert (=> b!904205 (= lt!408349 (contains!4436 (getCurrentListMap!2647 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904206 () Bool)

(declare-fun e!506667 () Bool)

(assert (=> b!904206 (= e!506667 tp_is_empty!18529)))

(declare-fun b!904207 () Bool)

(declare-fun mapRes!29506 () Bool)

(assert (=> b!904207 (= e!506666 (and e!506665 mapRes!29506))))

(declare-fun condMapEmpty!29506 () Bool)

(declare-fun mapDefault!29506 () ValueCell!8783)

(assert (=> b!904207 (= condMapEmpty!29506 (= (arr!25532 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8783)) mapDefault!29506)))))

(declare-fun mapIsEmpty!29506 () Bool)

(assert (=> mapIsEmpty!29506 mapRes!29506))

(declare-fun mapNonEmpty!29506 () Bool)

(declare-fun tp!56596 () Bool)

(assert (=> mapNonEmpty!29506 (= mapRes!29506 (and tp!56596 e!506667))))

(declare-fun mapValue!29506 () ValueCell!8783)

(declare-fun mapRest!29506 () (Array (_ BitVec 32) ValueCell!8783))

(declare-fun mapKey!29506 () (_ BitVec 32))

(assert (=> mapNonEmpty!29506 (= (arr!25532 _values!1152) (store mapRest!29506 mapKey!29506 mapValue!29506))))

(declare-fun b!904208 () Bool)

(declare-fun res!609808 () Bool)

(assert (=> b!904208 (=> (not res!609808) (not e!506664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53153 (_ BitVec 32)) Bool)

(assert (=> b!904208 (= res!609808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77694 res!609807) b!904204))

(assert (= (and b!904204 res!609806) b!904208))

(assert (= (and b!904208 res!609808) b!904203))

(assert (= (and b!904203 res!609805) b!904205))

(assert (= (and b!904207 condMapEmpty!29506) mapIsEmpty!29506))

(assert (= (and b!904207 (not condMapEmpty!29506)) mapNonEmpty!29506))

(get-info :version)

(assert (= (and mapNonEmpty!29506 ((_ is ValueCellFull!8783) mapValue!29506)) b!904206))

(assert (= (and b!904207 ((_ is ValueCellFull!8783) mapDefault!29506)) b!904202))

(assert (= start!77694 b!904207))

(declare-fun m!840311 () Bool)

(assert (=> b!904205 m!840311))

(assert (=> b!904205 m!840311))

(declare-fun m!840313 () Bool)

(assert (=> b!904205 m!840313))

(declare-fun m!840315 () Bool)

(assert (=> mapNonEmpty!29506 m!840315))

(declare-fun m!840317 () Bool)

(assert (=> start!77694 m!840317))

(declare-fun m!840319 () Bool)

(assert (=> start!77694 m!840319))

(declare-fun m!840321 () Bool)

(assert (=> start!77694 m!840321))

(declare-fun m!840323 () Bool)

(assert (=> b!904208 m!840323))

(declare-fun m!840325 () Bool)

(assert (=> b!904203 m!840325))

(check-sat (not b!904205) (not mapNonEmpty!29506) (not b!904208) (not b_next!16111) (not b!904203) b_and!26487 (not start!77694) tp_is_empty!18529)
(check-sat b_and!26487 (not b_next!16111))
