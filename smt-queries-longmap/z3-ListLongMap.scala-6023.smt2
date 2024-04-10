; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78024 () Bool)

(assert start!78024)

(declare-fun b_free!16551 () Bool)

(declare-fun b_next!16551 () Bool)

(assert (=> start!78024 (= b_free!16551 (not b_next!16551))))

(declare-fun tp!57924 () Bool)

(declare-fun b_and!27123 () Bool)

(assert (=> start!78024 (= tp!57924 b_and!27123)))

(declare-fun res!614569 () Bool)

(declare-fun e!510719 () Bool)

(assert (=> start!78024 (=> (not res!614569) (not e!510719))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78024 (= res!614569 (validMask!0 mask!1756))))

(assert (=> start!78024 e!510719))

(declare-datatypes ((V!30257 0))(
  ( (V!30258 (val!9535 Int)) )
))
(declare-datatypes ((ValueCell!9003 0))(
  ( (ValueCellFull!9003 (v!12044 V!30257)) (EmptyCell!9003) )
))
(declare-datatypes ((array!53950 0))(
  ( (array!53951 (arr!25931 (Array (_ BitVec 32) ValueCell!9003)) (size!26390 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53950)

(declare-fun e!510716 () Bool)

(declare-fun array_inv!20274 (array!53950) Bool)

(assert (=> start!78024 (and (array_inv!20274 _values!1152) e!510716)))

(assert (=> start!78024 tp!57924))

(assert (=> start!78024 true))

(declare-fun tp_is_empty!18969 () Bool)

(assert (=> start!78024 tp_is_empty!18969))

(declare-datatypes ((array!53952 0))(
  ( (array!53953 (arr!25932 (Array (_ BitVec 32) (_ BitVec 64))) (size!26391 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53952)

(declare-fun array_inv!20275 (array!53952) Bool)

(assert (=> start!78024 (array_inv!20275 _keys!1386)))

(declare-fun b!910800 () Bool)

(declare-fun res!614570 () Bool)

(assert (=> b!910800 (=> (not res!614570) (not e!510719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53952 (_ BitVec 32)) Bool)

(assert (=> b!910800 (= res!614570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910801 () Bool)

(assert (=> b!910801 (= e!510719 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410309 () Bool)

(declare-fun zeroValue!1094 () V!30257)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30257)

(declare-datatypes ((tuple2!12424 0))(
  ( (tuple2!12425 (_1!6223 (_ BitVec 64)) (_2!6223 V!30257)) )
))
(declare-datatypes ((List!18215 0))(
  ( (Nil!18212) (Cons!18211 (h!19357 tuple2!12424) (t!25800 List!18215)) )
))
(declare-datatypes ((ListLongMap!11121 0))(
  ( (ListLongMap!11122 (toList!5576 List!18215)) )
))
(declare-fun contains!4620 (ListLongMap!11121 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2838 (array!53952 array!53950 (_ BitVec 32) (_ BitVec 32) V!30257 V!30257 (_ BitVec 32) Int) ListLongMap!11121)

(assert (=> b!910801 (= lt!410309 (contains!4620 (getCurrentListMap!2838 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30175 () Bool)

(declare-fun mapRes!30175 () Bool)

(assert (=> mapIsEmpty!30175 mapRes!30175))

(declare-fun b!910802 () Bool)

(declare-fun e!510717 () Bool)

(assert (=> b!910802 (= e!510717 tp_is_empty!18969)))

(declare-fun b!910803 () Bool)

(assert (=> b!910803 (= e!510716 (and e!510717 mapRes!30175))))

(declare-fun condMapEmpty!30175 () Bool)

(declare-fun mapDefault!30175 () ValueCell!9003)

(assert (=> b!910803 (= condMapEmpty!30175 (= (arr!25931 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9003)) mapDefault!30175)))))

(declare-fun b!910804 () Bool)

(declare-fun e!510718 () Bool)

(assert (=> b!910804 (= e!510718 tp_is_empty!18969)))

(declare-fun b!910805 () Bool)

(declare-fun res!614568 () Bool)

(assert (=> b!910805 (=> (not res!614568) (not e!510719))))

(declare-datatypes ((List!18216 0))(
  ( (Nil!18213) (Cons!18212 (h!19358 (_ BitVec 64)) (t!25801 List!18216)) )
))
(declare-fun arrayNoDuplicates!0 (array!53952 (_ BitVec 32) List!18216) Bool)

(assert (=> b!910805 (= res!614568 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18213))))

(declare-fun b!910806 () Bool)

(declare-fun res!614571 () Bool)

(assert (=> b!910806 (=> (not res!614571) (not e!510719))))

(assert (=> b!910806 (= res!614571 (and (= (size!26390 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26391 _keys!1386) (size!26390 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30175 () Bool)

(declare-fun tp!57923 () Bool)

(assert (=> mapNonEmpty!30175 (= mapRes!30175 (and tp!57923 e!510718))))

(declare-fun mapKey!30175 () (_ BitVec 32))

(declare-fun mapValue!30175 () ValueCell!9003)

(declare-fun mapRest!30175 () (Array (_ BitVec 32) ValueCell!9003))

(assert (=> mapNonEmpty!30175 (= (arr!25931 _values!1152) (store mapRest!30175 mapKey!30175 mapValue!30175))))

(assert (= (and start!78024 res!614569) b!910806))

(assert (= (and b!910806 res!614571) b!910800))

(assert (= (and b!910800 res!614570) b!910805))

(assert (= (and b!910805 res!614568) b!910801))

(assert (= (and b!910803 condMapEmpty!30175) mapIsEmpty!30175))

(assert (= (and b!910803 (not condMapEmpty!30175)) mapNonEmpty!30175))

(get-info :version)

(assert (= (and mapNonEmpty!30175 ((_ is ValueCellFull!9003) mapValue!30175)) b!910804))

(assert (= (and b!910803 ((_ is ValueCellFull!9003) mapDefault!30175)) b!910802))

(assert (= start!78024 b!910803))

(declare-fun m!845713 () Bool)

(assert (=> mapNonEmpty!30175 m!845713))

(declare-fun m!845715 () Bool)

(assert (=> b!910805 m!845715))

(declare-fun m!845717 () Bool)

(assert (=> b!910801 m!845717))

(assert (=> b!910801 m!845717))

(declare-fun m!845719 () Bool)

(assert (=> b!910801 m!845719))

(declare-fun m!845721 () Bool)

(assert (=> start!78024 m!845721))

(declare-fun m!845723 () Bool)

(assert (=> start!78024 m!845723))

(declare-fun m!845725 () Bool)

(assert (=> start!78024 m!845725))

(declare-fun m!845727 () Bool)

(assert (=> b!910800 m!845727))

(check-sat b_and!27123 (not mapNonEmpty!30175) tp_is_empty!18969 (not start!78024) (not b!910801) (not b!910800) (not b_next!16551) (not b!910805))
(check-sat b_and!27123 (not b_next!16551))
