; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78108 () Bool)

(assert start!78108)

(declare-fun b_free!16483 () Bool)

(declare-fun b_next!16483 () Bool)

(assert (=> start!78108 (= b_free!16483 (not b_next!16483))))

(declare-fun tp!57717 () Bool)

(declare-fun b_and!27063 () Bool)

(assert (=> start!78108 (= tp!57717 b_and!27063)))

(declare-fun mapNonEmpty!30070 () Bool)

(declare-fun mapRes!30070 () Bool)

(declare-fun tp!57718 () Bool)

(declare-fun e!510716 () Bool)

(assert (=> mapNonEmpty!30070 (= mapRes!30070 (and tp!57718 e!510716))))

(declare-datatypes ((V!30167 0))(
  ( (V!30168 (val!9501 Int)) )
))
(declare-datatypes ((ValueCell!8969 0))(
  ( (ValueCellFull!8969 (v!12006 V!30167)) (EmptyCell!8969) )
))
(declare-datatypes ((array!53873 0))(
  ( (array!53874 (arr!25889 (Array (_ BitVec 32) ValueCell!8969)) (size!26349 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53873)

(declare-fun mapValue!30070 () ValueCell!8969)

(declare-fun mapKey!30070 () (_ BitVec 32))

(declare-fun mapRest!30070 () (Array (_ BitVec 32) ValueCell!8969))

(assert (=> mapNonEmpty!30070 (= (arr!25889 _values!1152) (store mapRest!30070 mapKey!30070 mapValue!30070))))

(declare-fun b!910862 () Bool)

(declare-fun res!614441 () Bool)

(declare-fun e!510717 () Bool)

(assert (=> b!910862 (=> (not res!614441) (not e!510717))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53875 0))(
  ( (array!53876 (arr!25890 (Array (_ BitVec 32) (_ BitVec 64))) (size!26350 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53875)

(assert (=> b!910862 (= res!614441 (and (= (size!26349 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26350 _keys!1386) (size!26349 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910863 () Bool)

(declare-fun e!510720 () Bool)

(declare-fun e!510718 () Bool)

(assert (=> b!910863 (= e!510720 (and e!510718 mapRes!30070))))

(declare-fun condMapEmpty!30070 () Bool)

(declare-fun mapDefault!30070 () ValueCell!8969)

(assert (=> b!910863 (= condMapEmpty!30070 (= (arr!25889 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8969)) mapDefault!30070)))))

(declare-fun b!910864 () Bool)

(declare-fun tp_is_empty!18901 () Bool)

(assert (=> b!910864 (= e!510718 tp_is_empty!18901)))

(declare-fun b!910865 () Bool)

(assert (=> b!910865 (= e!510717 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410490 () Bool)

(declare-fun zeroValue!1094 () V!30167)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30167)

(declare-datatypes ((tuple2!12338 0))(
  ( (tuple2!12339 (_1!6180 (_ BitVec 64)) (_2!6180 V!30167)) )
))
(declare-datatypes ((List!18157 0))(
  ( (Nil!18154) (Cons!18153 (h!19305 tuple2!12338) (t!25732 List!18157)) )
))
(declare-datatypes ((ListLongMap!11037 0))(
  ( (ListLongMap!11038 (toList!5534 List!18157)) )
))
(declare-fun contains!4586 (ListLongMap!11037 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2795 (array!53875 array!53873 (_ BitVec 32) (_ BitVec 32) V!30167 V!30167 (_ BitVec 32) Int) ListLongMap!11037)

(assert (=> b!910865 (= lt!410490 (contains!4586 (getCurrentListMap!2795 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910866 () Bool)

(declare-fun res!614442 () Bool)

(assert (=> b!910866 (=> (not res!614442) (not e!510717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53875 (_ BitVec 32)) Bool)

(assert (=> b!910866 (= res!614442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!614443 () Bool)

(assert (=> start!78108 (=> (not res!614443) (not e!510717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78108 (= res!614443 (validMask!0 mask!1756))))

(assert (=> start!78108 e!510717))

(declare-fun array_inv!20318 (array!53873) Bool)

(assert (=> start!78108 (and (array_inv!20318 _values!1152) e!510720)))

(assert (=> start!78108 tp!57717))

(assert (=> start!78108 true))

(assert (=> start!78108 tp_is_empty!18901))

(declare-fun array_inv!20319 (array!53875) Bool)

(assert (=> start!78108 (array_inv!20319 _keys!1386)))

(declare-fun mapIsEmpty!30070 () Bool)

(assert (=> mapIsEmpty!30070 mapRes!30070))

(declare-fun b!910867 () Bool)

(assert (=> b!910867 (= e!510716 tp_is_empty!18901)))

(declare-fun b!910868 () Bool)

(declare-fun res!614444 () Bool)

(assert (=> b!910868 (=> (not res!614444) (not e!510717))))

(declare-datatypes ((List!18158 0))(
  ( (Nil!18155) (Cons!18154 (h!19306 (_ BitVec 64)) (t!25733 List!18158)) )
))
(declare-fun arrayNoDuplicates!0 (array!53875 (_ BitVec 32) List!18158) Bool)

(assert (=> b!910868 (= res!614444 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18155))))

(assert (= (and start!78108 res!614443) b!910862))

(assert (= (and b!910862 res!614441) b!910866))

(assert (= (and b!910866 res!614442) b!910868))

(assert (= (and b!910868 res!614444) b!910865))

(assert (= (and b!910863 condMapEmpty!30070) mapIsEmpty!30070))

(assert (= (and b!910863 (not condMapEmpty!30070)) mapNonEmpty!30070))

(get-info :version)

(assert (= (and mapNonEmpty!30070 ((_ is ValueCellFull!8969) mapValue!30070)) b!910867))

(assert (= (and b!910863 ((_ is ValueCellFull!8969) mapDefault!30070)) b!910864))

(assert (= start!78108 b!910863))

(declare-fun m!846371 () Bool)

(assert (=> b!910866 m!846371))

(declare-fun m!846373 () Bool)

(assert (=> b!910868 m!846373))

(declare-fun m!846375 () Bool)

(assert (=> b!910865 m!846375))

(assert (=> b!910865 m!846375))

(declare-fun m!846377 () Bool)

(assert (=> b!910865 m!846377))

(declare-fun m!846379 () Bool)

(assert (=> mapNonEmpty!30070 m!846379))

(declare-fun m!846381 () Bool)

(assert (=> start!78108 m!846381))

(declare-fun m!846383 () Bool)

(assert (=> start!78108 m!846383))

(declare-fun m!846385 () Bool)

(assert (=> start!78108 m!846385))

(check-sat (not b!910868) (not b!910866) tp_is_empty!18901 (not mapNonEmpty!30070) (not b_next!16483) (not start!78108) (not b!910865) b_and!27063)
(check-sat b_and!27063 (not b_next!16483))
