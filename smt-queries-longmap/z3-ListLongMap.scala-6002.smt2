; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77846 () Bool)

(assert start!77846)

(declare-fun b_free!16423 () Bool)

(declare-fun b_next!16423 () Bool)

(assert (=> start!77846 (= b_free!16423 (not b_next!16423))))

(declare-fun tp!57535 () Bool)

(declare-fun b_and!26965 () Bool)

(assert (=> start!77846 (= tp!57535 b_and!26965)))

(declare-fun res!613567 () Bool)

(declare-fun e!509465 () Bool)

(assert (=> start!77846 (=> (not res!613567) (not e!509465))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77846 (= res!613567 (validMask!0 mask!1756))))

(assert (=> start!77846 e!509465))

(declare-datatypes ((V!30087 0))(
  ( (V!30088 (val!9471 Int)) )
))
(declare-datatypes ((ValueCell!8939 0))(
  ( (ValueCellFull!8939 (v!11977 V!30087)) (EmptyCell!8939) )
))
(declare-datatypes ((array!53691 0))(
  ( (array!53692 (arr!25804 (Array (_ BitVec 32) ValueCell!8939)) (size!26265 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53691)

(declare-fun e!509464 () Bool)

(declare-fun array_inv!20238 (array!53691) Bool)

(assert (=> start!77846 (and (array_inv!20238 _values!1152) e!509464)))

(assert (=> start!77846 tp!57535))

(assert (=> start!77846 true))

(declare-fun tp_is_empty!18841 () Bool)

(assert (=> start!77846 tp_is_empty!18841))

(declare-datatypes ((array!53693 0))(
  ( (array!53694 (arr!25805 (Array (_ BitVec 32) (_ BitVec 64))) (size!26266 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53693)

(declare-fun array_inv!20239 (array!53693) Bool)

(assert (=> start!77846 (array_inv!20239 _keys!1386)))

(declare-fun b!908963 () Bool)

(assert (=> b!908963 (= e!509465 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30087)

(declare-fun lt!409725 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30087)

(declare-datatypes ((tuple2!12374 0))(
  ( (tuple2!12375 (_1!6198 (_ BitVec 64)) (_2!6198 V!30087)) )
))
(declare-datatypes ((List!18155 0))(
  ( (Nil!18152) (Cons!18151 (h!19297 tuple2!12374) (t!25727 List!18155)) )
))
(declare-datatypes ((ListLongMap!11061 0))(
  ( (ListLongMap!11062 (toList!5546 List!18155)) )
))
(declare-fun contains!4545 (ListLongMap!11061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2748 (array!53693 array!53691 (_ BitVec 32) (_ BitVec 32) V!30087 V!30087 (_ BitVec 32) Int) ListLongMap!11061)

(assert (=> b!908963 (= lt!409725 (contains!4545 (getCurrentListMap!2748 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!908964 () Bool)

(declare-fun e!509466 () Bool)

(assert (=> b!908964 (= e!509466 tp_is_empty!18841)))

(declare-fun b!908965 () Bool)

(declare-fun res!613564 () Bool)

(assert (=> b!908965 (=> (not res!613564) (not e!509465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53693 (_ BitVec 32)) Bool)

(assert (=> b!908965 (= res!613564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29977 () Bool)

(declare-fun mapRes!29977 () Bool)

(assert (=> mapIsEmpty!29977 mapRes!29977))

(declare-fun b!908966 () Bool)

(declare-fun res!613565 () Bool)

(assert (=> b!908966 (=> (not res!613565) (not e!509465))))

(declare-datatypes ((List!18156 0))(
  ( (Nil!18153) (Cons!18152 (h!19298 (_ BitVec 64)) (t!25728 List!18156)) )
))
(declare-fun arrayNoDuplicates!0 (array!53693 (_ BitVec 32) List!18156) Bool)

(assert (=> b!908966 (= res!613565 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18153))))

(declare-fun b!908967 () Bool)

(declare-fun res!613566 () Bool)

(assert (=> b!908967 (=> (not res!613566) (not e!509465))))

(assert (=> b!908967 (= res!613566 (and (= (size!26265 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26266 _keys!1386) (size!26265 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29977 () Bool)

(declare-fun tp!57534 () Bool)

(assert (=> mapNonEmpty!29977 (= mapRes!29977 (and tp!57534 e!509466))))

(declare-fun mapRest!29977 () (Array (_ BitVec 32) ValueCell!8939))

(declare-fun mapKey!29977 () (_ BitVec 32))

(declare-fun mapValue!29977 () ValueCell!8939)

(assert (=> mapNonEmpty!29977 (= (arr!25804 _values!1152) (store mapRest!29977 mapKey!29977 mapValue!29977))))

(declare-fun b!908968 () Bool)

(declare-fun e!509468 () Bool)

(assert (=> b!908968 (= e!509468 tp_is_empty!18841)))

(declare-fun b!908969 () Bool)

(assert (=> b!908969 (= e!509464 (and e!509468 mapRes!29977))))

(declare-fun condMapEmpty!29977 () Bool)

(declare-fun mapDefault!29977 () ValueCell!8939)

(assert (=> b!908969 (= condMapEmpty!29977 (= (arr!25804 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8939)) mapDefault!29977)))))

(assert (= (and start!77846 res!613567) b!908967))

(assert (= (and b!908967 res!613566) b!908965))

(assert (= (and b!908965 res!613564) b!908966))

(assert (= (and b!908966 res!613565) b!908963))

(assert (= (and b!908969 condMapEmpty!29977) mapIsEmpty!29977))

(assert (= (and b!908969 (not condMapEmpty!29977)) mapNonEmpty!29977))

(get-info :version)

(assert (= (and mapNonEmpty!29977 ((_ is ValueCellFull!8939) mapValue!29977)) b!908964))

(assert (= (and b!908969 ((_ is ValueCellFull!8939) mapDefault!29977)) b!908968))

(assert (= start!77846 b!908969))

(declare-fun m!843747 () Bool)

(assert (=> start!77846 m!843747))

(declare-fun m!843749 () Bool)

(assert (=> start!77846 m!843749))

(declare-fun m!843751 () Bool)

(assert (=> start!77846 m!843751))

(declare-fun m!843753 () Bool)

(assert (=> b!908963 m!843753))

(assert (=> b!908963 m!843753))

(declare-fun m!843755 () Bool)

(assert (=> b!908963 m!843755))

(declare-fun m!843757 () Bool)

(assert (=> mapNonEmpty!29977 m!843757))

(declare-fun m!843759 () Bool)

(assert (=> b!908966 m!843759))

(declare-fun m!843761 () Bool)

(assert (=> b!908965 m!843761))

(check-sat (not b!908965) tp_is_empty!18841 (not start!77846) b_and!26965 (not b!908963) (not mapNonEmpty!29977) (not b_next!16423) (not b!908966))
(check-sat b_and!26965 (not b_next!16423))
