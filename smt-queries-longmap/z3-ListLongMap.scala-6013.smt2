; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77928 () Bool)

(assert start!77928)

(declare-fun b_free!16489 () Bool)

(declare-fun b_next!16489 () Bool)

(assert (=> start!77928 (= b_free!16489 (not b_next!16489))))

(declare-fun tp!57735 () Bool)

(declare-fun b_and!27033 () Bool)

(assert (=> start!77928 (= tp!57735 b_and!27033)))

(declare-fun b!909783 () Bool)

(declare-fun e!510032 () Bool)

(assert (=> b!909783 (= e!510032 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((V!30175 0))(
  ( (V!30176 (val!9504 Int)) )
))
(declare-fun zeroValue!1094 () V!30175)

(declare-datatypes ((array!53819 0))(
  ( (array!53820 (arr!25867 (Array (_ BitVec 32) (_ BitVec 64))) (size!26328 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53819)

(declare-datatypes ((ValueCell!8972 0))(
  ( (ValueCellFull!8972 (v!12011 V!30175)) (EmptyCell!8972) )
))
(declare-datatypes ((array!53821 0))(
  ( (array!53822 (arr!25868 (Array (_ BitVec 32) ValueCell!8972)) (size!26329 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53821)

(declare-fun lt!409902 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30175)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12412 0))(
  ( (tuple2!12413 (_1!6217 (_ BitVec 64)) (_2!6217 V!30175)) )
))
(declare-datatypes ((List!18198 0))(
  ( (Nil!18195) (Cons!18194 (h!19340 tuple2!12412) (t!25772 List!18198)) )
))
(declare-datatypes ((ListLongMap!11099 0))(
  ( (ListLongMap!11100 (toList!5565 List!18198)) )
))
(declare-fun contains!4565 (ListLongMap!11099 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2767 (array!53819 array!53821 (_ BitVec 32) (_ BitVec 32) V!30175 V!30175 (_ BitVec 32) Int) ListLongMap!11099)

(assert (=> b!909783 (= lt!409902 (contains!4565 (getCurrentListMap!2767 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30079 () Bool)

(declare-fun mapRes!30079 () Bool)

(declare-fun tp!57736 () Bool)

(declare-fun e!510033 () Bool)

(assert (=> mapNonEmpty!30079 (= mapRes!30079 (and tp!57736 e!510033))))

(declare-fun mapKey!30079 () (_ BitVec 32))

(declare-fun mapValue!30079 () ValueCell!8972)

(declare-fun mapRest!30079 () (Array (_ BitVec 32) ValueCell!8972))

(assert (=> mapNonEmpty!30079 (= (arr!25868 _values!1152) (store mapRest!30079 mapKey!30079 mapValue!30079))))

(declare-fun b!909784 () Bool)

(declare-fun e!510031 () Bool)

(declare-fun tp_is_empty!18907 () Bool)

(assert (=> b!909784 (= e!510031 tp_is_empty!18907)))

(declare-fun mapIsEmpty!30079 () Bool)

(assert (=> mapIsEmpty!30079 mapRes!30079))

(declare-fun b!909785 () Bool)

(assert (=> b!909785 (= e!510033 tp_is_empty!18907)))

(declare-fun b!909786 () Bool)

(declare-fun res!614026 () Bool)

(assert (=> b!909786 (=> (not res!614026) (not e!510032))))

(declare-datatypes ((List!18199 0))(
  ( (Nil!18196) (Cons!18195 (h!19341 (_ BitVec 64)) (t!25773 List!18199)) )
))
(declare-fun arrayNoDuplicates!0 (array!53819 (_ BitVec 32) List!18199) Bool)

(assert (=> b!909786 (= res!614026 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18196))))

(declare-fun res!614025 () Bool)

(assert (=> start!77928 (=> (not res!614025) (not e!510032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77928 (= res!614025 (validMask!0 mask!1756))))

(assert (=> start!77928 e!510032))

(declare-fun e!510035 () Bool)

(declare-fun array_inv!20280 (array!53821) Bool)

(assert (=> start!77928 (and (array_inv!20280 _values!1152) e!510035)))

(assert (=> start!77928 tp!57735))

(assert (=> start!77928 true))

(assert (=> start!77928 tp_is_empty!18907))

(declare-fun array_inv!20281 (array!53819) Bool)

(assert (=> start!77928 (array_inv!20281 _keys!1386)))

(declare-fun b!909787 () Bool)

(declare-fun res!614024 () Bool)

(assert (=> b!909787 (=> (not res!614024) (not e!510032))))

(assert (=> b!909787 (= res!614024 (and (= (size!26329 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26328 _keys!1386) (size!26329 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909788 () Bool)

(declare-fun res!614023 () Bool)

(assert (=> b!909788 (=> (not res!614023) (not e!510032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53819 (_ BitVec 32)) Bool)

(assert (=> b!909788 (= res!614023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909789 () Bool)

(assert (=> b!909789 (= e!510035 (and e!510031 mapRes!30079))))

(declare-fun condMapEmpty!30079 () Bool)

(declare-fun mapDefault!30079 () ValueCell!8972)

(assert (=> b!909789 (= condMapEmpty!30079 (= (arr!25868 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8972)) mapDefault!30079)))))

(assert (= (and start!77928 res!614025) b!909787))

(assert (= (and b!909787 res!614024) b!909788))

(assert (= (and b!909788 res!614023) b!909786))

(assert (= (and b!909786 res!614026) b!909783))

(assert (= (and b!909789 condMapEmpty!30079) mapIsEmpty!30079))

(assert (= (and b!909789 (not condMapEmpty!30079)) mapNonEmpty!30079))

(get-info :version)

(assert (= (and mapNonEmpty!30079 ((_ is ValueCellFull!8972) mapValue!30079)) b!909785))

(assert (= (and b!909789 ((_ is ValueCellFull!8972) mapDefault!30079)) b!909784))

(assert (= start!77928 b!909789))

(declare-fun m!844367 () Bool)

(assert (=> b!909786 m!844367))

(declare-fun m!844369 () Bool)

(assert (=> b!909788 m!844369))

(declare-fun m!844371 () Bool)

(assert (=> start!77928 m!844371))

(declare-fun m!844373 () Bool)

(assert (=> start!77928 m!844373))

(declare-fun m!844375 () Bool)

(assert (=> start!77928 m!844375))

(declare-fun m!844377 () Bool)

(assert (=> mapNonEmpty!30079 m!844377))

(declare-fun m!844379 () Bool)

(assert (=> b!909783 m!844379))

(assert (=> b!909783 m!844379))

(declare-fun m!844381 () Bool)

(assert (=> b!909783 m!844381))

(check-sat (not mapNonEmpty!30079) (not start!77928) (not b!909786) b_and!27033 tp_is_empty!18907 (not b!909783) (not b_next!16489) (not b!909788))
(check-sat b_and!27033 (not b_next!16489))
