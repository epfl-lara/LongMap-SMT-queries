; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78032 () Bool)

(assert start!78032)

(declare-fun b_free!16423 () Bool)

(declare-fun b_next!16423 () Bool)

(assert (=> start!78032 (= b_free!16423 (not b_next!16423))))

(declare-fun tp!57534 () Bool)

(declare-fun b_and!27001 () Bool)

(assert (=> start!78032 (= tp!57534 b_and!27001)))

(declare-fun mapNonEmpty!29977 () Bool)

(declare-fun mapRes!29977 () Bool)

(declare-fun tp!57535 () Bool)

(declare-fun e!510196 () Bool)

(assert (=> mapNonEmpty!29977 (= mapRes!29977 (and tp!57535 e!510196))))

(declare-datatypes ((V!30087 0))(
  ( (V!30088 (val!9471 Int)) )
))
(declare-datatypes ((ValueCell!8939 0))(
  ( (ValueCellFull!8939 (v!11975 V!30087)) (EmptyCell!8939) )
))
(declare-fun mapRest!29977 () (Array (_ BitVec 32) ValueCell!8939))

(declare-fun mapValue!29977 () ValueCell!8939)

(declare-datatypes ((array!53757 0))(
  ( (array!53758 (arr!25832 (Array (_ BitVec 32) ValueCell!8939)) (size!26292 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53757)

(declare-fun mapKey!29977 () (_ BitVec 32))

(assert (=> mapNonEmpty!29977 (= (arr!25832 _values!1152) (store mapRest!29977 mapKey!29977 mapValue!29977))))

(declare-fun b!910105 () Bool)

(declare-fun res!614018 () Bool)

(declare-fun e!510194 () Bool)

(assert (=> b!910105 (=> (not res!614018) (not e!510194))))

(declare-datatypes ((array!53759 0))(
  ( (array!53760 (arr!25833 (Array (_ BitVec 32) (_ BitVec 64))) (size!26293 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53759)

(declare-datatypes ((List!18115 0))(
  ( (Nil!18112) (Cons!18111 (h!19263 (_ BitVec 64)) (t!25688 List!18115)) )
))
(declare-fun arrayNoDuplicates!0 (array!53759 (_ BitVec 32) List!18115) Bool)

(assert (=> b!910105 (= res!614018 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18112))))

(declare-fun b!910106 () Bool)

(declare-fun res!614021 () Bool)

(assert (=> b!910106 (=> (not res!614021) (not e!510194))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!910106 (= res!614021 (and (= (size!26292 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26293 _keys!1386) (size!26292 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910107 () Bool)

(declare-fun e!510198 () Bool)

(declare-fun e!510195 () Bool)

(assert (=> b!910107 (= e!510198 (and e!510195 mapRes!29977))))

(declare-fun condMapEmpty!29977 () Bool)

(declare-fun mapDefault!29977 () ValueCell!8939)

(assert (=> b!910107 (= condMapEmpty!29977 (= (arr!25832 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8939)) mapDefault!29977)))))

(declare-fun mapIsEmpty!29977 () Bool)

(assert (=> mapIsEmpty!29977 mapRes!29977))

(declare-fun res!614019 () Bool)

(assert (=> start!78032 (=> (not res!614019) (not e!510194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78032 (= res!614019 (validMask!0 mask!1756))))

(assert (=> start!78032 e!510194))

(declare-fun array_inv!20278 (array!53757) Bool)

(assert (=> start!78032 (and (array_inv!20278 _values!1152) e!510198)))

(assert (=> start!78032 tp!57534))

(assert (=> start!78032 true))

(declare-fun tp_is_empty!18841 () Bool)

(assert (=> start!78032 tp_is_empty!18841))

(declare-fun array_inv!20279 (array!53759) Bool)

(assert (=> start!78032 (array_inv!20279 _keys!1386)))

(declare-fun b!910108 () Bool)

(assert (=> b!910108 (= e!510194 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30087)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410322 () Bool)

(declare-fun minValue!1094 () V!30087)

(declare-datatypes ((tuple2!12294 0))(
  ( (tuple2!12295 (_1!6158 (_ BitVec 64)) (_2!6158 V!30087)) )
))
(declare-datatypes ((List!18116 0))(
  ( (Nil!18113) (Cons!18112 (h!19264 tuple2!12294) (t!25689 List!18116)) )
))
(declare-datatypes ((ListLongMap!10993 0))(
  ( (ListLongMap!10994 (toList!5512 List!18116)) )
))
(declare-fun contains!4563 (ListLongMap!10993 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2773 (array!53759 array!53757 (_ BitVec 32) (_ BitVec 32) V!30087 V!30087 (_ BitVec 32) Int) ListLongMap!10993)

(assert (=> b!910108 (= lt!410322 (contains!4563 (getCurrentListMap!2773 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910109 () Bool)

(assert (=> b!910109 (= e!510195 tp_is_empty!18841)))

(declare-fun b!910110 () Bool)

(assert (=> b!910110 (= e!510196 tp_is_empty!18841)))

(declare-fun b!910111 () Bool)

(declare-fun res!614020 () Bool)

(assert (=> b!910111 (=> (not res!614020) (not e!510194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53759 (_ BitVec 32)) Bool)

(assert (=> b!910111 (= res!614020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78032 res!614019) b!910106))

(assert (= (and b!910106 res!614021) b!910111))

(assert (= (and b!910111 res!614020) b!910105))

(assert (= (and b!910105 res!614018) b!910108))

(assert (= (and b!910107 condMapEmpty!29977) mapIsEmpty!29977))

(assert (= (and b!910107 (not condMapEmpty!29977)) mapNonEmpty!29977))

(get-info :version)

(assert (= (and mapNonEmpty!29977 ((_ is ValueCellFull!8939) mapValue!29977)) b!910110))

(assert (= (and b!910107 ((_ is ValueCellFull!8939) mapDefault!29977)) b!910109))

(assert (= start!78032 b!910107))

(declare-fun m!845799 () Bool)

(assert (=> b!910111 m!845799))

(declare-fun m!845801 () Bool)

(assert (=> mapNonEmpty!29977 m!845801))

(declare-fun m!845803 () Bool)

(assert (=> start!78032 m!845803))

(declare-fun m!845805 () Bool)

(assert (=> start!78032 m!845805))

(declare-fun m!845807 () Bool)

(assert (=> start!78032 m!845807))

(declare-fun m!845809 () Bool)

(assert (=> b!910105 m!845809))

(declare-fun m!845811 () Bool)

(assert (=> b!910108 m!845811))

(assert (=> b!910108 m!845811))

(declare-fun m!845813 () Bool)

(assert (=> b!910108 m!845813))

(check-sat b_and!27001 tp_is_empty!18841 (not b_next!16423) (not b!910108) (not b!910105) (not mapNonEmpty!29977) (not b!910111) (not start!78032))
(check-sat b_and!27001 (not b_next!16423))
