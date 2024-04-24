; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78102 () Bool)

(assert start!78102)

(declare-fun b_free!16477 () Bool)

(declare-fun b_next!16477 () Bool)

(assert (=> start!78102 (= b_free!16477 (not b_next!16477))))

(declare-fun tp!57699 () Bool)

(declare-fun b_and!27057 () Bool)

(assert (=> start!78102 (= tp!57699 b_and!27057)))

(declare-fun res!614406 () Bool)

(declare-fun e!510672 () Bool)

(assert (=> start!78102 (=> (not res!614406) (not e!510672))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78102 (= res!614406 (validMask!0 mask!1756))))

(assert (=> start!78102 e!510672))

(declare-datatypes ((V!30159 0))(
  ( (V!30160 (val!9498 Int)) )
))
(declare-datatypes ((ValueCell!8966 0))(
  ( (ValueCellFull!8966 (v!12003 V!30159)) (EmptyCell!8966) )
))
(declare-datatypes ((array!53861 0))(
  ( (array!53862 (arr!25883 (Array (_ BitVec 32) ValueCell!8966)) (size!26343 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53861)

(declare-fun e!510675 () Bool)

(declare-fun array_inv!20312 (array!53861) Bool)

(assert (=> start!78102 (and (array_inv!20312 _values!1152) e!510675)))

(assert (=> start!78102 tp!57699))

(assert (=> start!78102 true))

(declare-fun tp_is_empty!18895 () Bool)

(assert (=> start!78102 tp_is_empty!18895))

(declare-datatypes ((array!53863 0))(
  ( (array!53864 (arr!25884 (Array (_ BitVec 32) (_ BitVec 64))) (size!26344 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53863)

(declare-fun array_inv!20313 (array!53863) Bool)

(assert (=> start!78102 (array_inv!20313 _keys!1386)))

(declare-fun mapIsEmpty!30061 () Bool)

(declare-fun mapRes!30061 () Bool)

(assert (=> mapIsEmpty!30061 mapRes!30061))

(declare-fun mapNonEmpty!30061 () Bool)

(declare-fun tp!57700 () Bool)

(declare-fun e!510673 () Bool)

(assert (=> mapNonEmpty!30061 (= mapRes!30061 (and tp!57700 e!510673))))

(declare-fun mapValue!30061 () ValueCell!8966)

(declare-fun mapKey!30061 () (_ BitVec 32))

(declare-fun mapRest!30061 () (Array (_ BitVec 32) ValueCell!8966))

(assert (=> mapNonEmpty!30061 (= (arr!25883 _values!1152) (store mapRest!30061 mapKey!30061 mapValue!30061))))

(declare-fun b!910799 () Bool)

(declare-fun res!614407 () Bool)

(assert (=> b!910799 (=> (not res!614407) (not e!510672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53863 (_ BitVec 32)) Bool)

(assert (=> b!910799 (= res!614407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910800 () Bool)

(declare-fun e!510671 () Bool)

(assert (=> b!910800 (= e!510675 (and e!510671 mapRes!30061))))

(declare-fun condMapEmpty!30061 () Bool)

(declare-fun mapDefault!30061 () ValueCell!8966)

(assert (=> b!910800 (= condMapEmpty!30061 (= (arr!25883 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8966)) mapDefault!30061)))))

(declare-fun b!910801 () Bool)

(assert (=> b!910801 (= e!510671 tp_is_empty!18895)))

(declare-fun b!910802 () Bool)

(assert (=> b!910802 (= e!510672 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30159)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30159)

(declare-fun lt!410481 () Bool)

(declare-datatypes ((tuple2!12334 0))(
  ( (tuple2!12335 (_1!6178 (_ BitVec 64)) (_2!6178 V!30159)) )
))
(declare-datatypes ((List!18152 0))(
  ( (Nil!18149) (Cons!18148 (h!19300 tuple2!12334) (t!25727 List!18152)) )
))
(declare-datatypes ((ListLongMap!11033 0))(
  ( (ListLongMap!11034 (toList!5532 List!18152)) )
))
(declare-fun contains!4584 (ListLongMap!11033 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2793 (array!53863 array!53861 (_ BitVec 32) (_ BitVec 32) V!30159 V!30159 (_ BitVec 32) Int) ListLongMap!11033)

(assert (=> b!910802 (= lt!410481 (contains!4584 (getCurrentListMap!2793 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910803 () Bool)

(assert (=> b!910803 (= e!510673 tp_is_empty!18895)))

(declare-fun b!910804 () Bool)

(declare-fun res!614405 () Bool)

(assert (=> b!910804 (=> (not res!614405) (not e!510672))))

(assert (=> b!910804 (= res!614405 (and (= (size!26343 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26344 _keys!1386) (size!26343 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910805 () Bool)

(declare-fun res!614408 () Bool)

(assert (=> b!910805 (=> (not res!614408) (not e!510672))))

(declare-datatypes ((List!18153 0))(
  ( (Nil!18150) (Cons!18149 (h!19301 (_ BitVec 64)) (t!25728 List!18153)) )
))
(declare-fun arrayNoDuplicates!0 (array!53863 (_ BitVec 32) List!18153) Bool)

(assert (=> b!910805 (= res!614408 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18150))))

(assert (= (and start!78102 res!614406) b!910804))

(assert (= (and b!910804 res!614405) b!910799))

(assert (= (and b!910799 res!614407) b!910805))

(assert (= (and b!910805 res!614408) b!910802))

(assert (= (and b!910800 condMapEmpty!30061) mapIsEmpty!30061))

(assert (= (and b!910800 (not condMapEmpty!30061)) mapNonEmpty!30061))

(get-info :version)

(assert (= (and mapNonEmpty!30061 ((_ is ValueCellFull!8966) mapValue!30061)) b!910803))

(assert (= (and b!910800 ((_ is ValueCellFull!8966) mapDefault!30061)) b!910801))

(assert (= start!78102 b!910800))

(declare-fun m!846323 () Bool)

(assert (=> mapNonEmpty!30061 m!846323))

(declare-fun m!846325 () Bool)

(assert (=> b!910802 m!846325))

(assert (=> b!910802 m!846325))

(declare-fun m!846327 () Bool)

(assert (=> b!910802 m!846327))

(declare-fun m!846329 () Bool)

(assert (=> b!910805 m!846329))

(declare-fun m!846331 () Bool)

(assert (=> start!78102 m!846331))

(declare-fun m!846333 () Bool)

(assert (=> start!78102 m!846333))

(declare-fun m!846335 () Bool)

(assert (=> start!78102 m!846335))

(declare-fun m!846337 () Bool)

(assert (=> b!910799 m!846337))

(check-sat (not mapNonEmpty!30061) (not b_next!16477) (not b!910799) (not b!910805) (not b!910802) (not start!78102) tp_is_empty!18895 b_and!27057)
(check-sat b_and!27057 (not b_next!16477))
