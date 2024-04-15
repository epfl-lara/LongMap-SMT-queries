; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77940 () Bool)

(assert start!77940)

(declare-fun b_free!16501 () Bool)

(declare-fun b_next!16501 () Bool)

(assert (=> start!77940 (= b_free!16501 (not b_next!16501))))

(declare-fun tp!57771 () Bool)

(declare-fun b_and!27045 () Bool)

(assert (=> start!77940 (= tp!57771 b_and!27045)))

(declare-fun b!909909 () Bool)

(declare-fun e!510122 () Bool)

(declare-fun e!510124 () Bool)

(declare-fun mapRes!30097 () Bool)

(assert (=> b!909909 (= e!510122 (and e!510124 mapRes!30097))))

(declare-fun condMapEmpty!30097 () Bool)

(declare-datatypes ((V!30191 0))(
  ( (V!30192 (val!9510 Int)) )
))
(declare-datatypes ((ValueCell!8978 0))(
  ( (ValueCellFull!8978 (v!12017 V!30191)) (EmptyCell!8978) )
))
(declare-datatypes ((array!53841 0))(
  ( (array!53842 (arr!25878 (Array (_ BitVec 32) ValueCell!8978)) (size!26339 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53841)

(declare-fun mapDefault!30097 () ValueCell!8978)

(assert (=> b!909909 (= condMapEmpty!30097 (= (arr!25878 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8978)) mapDefault!30097)))))

(declare-fun b!909910 () Bool)

(declare-fun e!510125 () Bool)

(declare-fun tp_is_empty!18919 () Bool)

(assert (=> b!909910 (= e!510125 tp_is_empty!18919)))

(declare-fun res!614098 () Bool)

(declare-fun e!510123 () Bool)

(assert (=> start!77940 (=> (not res!614098) (not e!510123))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77940 (= res!614098 (validMask!0 mask!1756))))

(assert (=> start!77940 e!510123))

(declare-fun array_inv!20288 (array!53841) Bool)

(assert (=> start!77940 (and (array_inv!20288 _values!1152) e!510122)))

(assert (=> start!77940 tp!57771))

(assert (=> start!77940 true))

(assert (=> start!77940 tp_is_empty!18919))

(declare-datatypes ((array!53843 0))(
  ( (array!53844 (arr!25879 (Array (_ BitVec 32) (_ BitVec 64))) (size!26340 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53843)

(declare-fun array_inv!20289 (array!53843) Bool)

(assert (=> start!77940 (array_inv!20289 _keys!1386)))

(declare-fun mapIsEmpty!30097 () Bool)

(assert (=> mapIsEmpty!30097 mapRes!30097))

(declare-fun b!909911 () Bool)

(assert (=> b!909911 (= e!510124 tp_is_empty!18919)))

(declare-fun b!909912 () Bool)

(declare-fun res!614095 () Bool)

(assert (=> b!909912 (=> (not res!614095) (not e!510123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53843 (_ BitVec 32)) Bool)

(assert (=> b!909912 (= res!614095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909913 () Bool)

(declare-fun res!614097 () Bool)

(assert (=> b!909913 (=> (not res!614097) (not e!510123))))

(declare-datatypes ((List!18207 0))(
  ( (Nil!18204) (Cons!18203 (h!19349 (_ BitVec 64)) (t!25781 List!18207)) )
))
(declare-fun arrayNoDuplicates!0 (array!53843 (_ BitVec 32) List!18207) Bool)

(assert (=> b!909913 (= res!614097 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18204))))

(declare-fun mapNonEmpty!30097 () Bool)

(declare-fun tp!57772 () Bool)

(assert (=> mapNonEmpty!30097 (= mapRes!30097 (and tp!57772 e!510125))))

(declare-fun mapKey!30097 () (_ BitVec 32))

(declare-fun mapRest!30097 () (Array (_ BitVec 32) ValueCell!8978))

(declare-fun mapValue!30097 () ValueCell!8978)

(assert (=> mapNonEmpty!30097 (= (arr!25878 _values!1152) (store mapRest!30097 mapKey!30097 mapValue!30097))))

(declare-fun b!909914 () Bool)

(declare-fun res!614096 () Bool)

(assert (=> b!909914 (=> (not res!614096) (not e!510123))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!909914 (= res!614096 (and (= (size!26339 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26340 _keys!1386) (size!26339 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909915 () Bool)

(assert (=> b!909915 (= e!510123 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409920 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30191)

(declare-fun zeroValue!1094 () V!30191)

(declare-datatypes ((tuple2!12422 0))(
  ( (tuple2!12423 (_1!6222 (_ BitVec 64)) (_2!6222 V!30191)) )
))
(declare-datatypes ((List!18208 0))(
  ( (Nil!18205) (Cons!18204 (h!19350 tuple2!12422) (t!25782 List!18208)) )
))
(declare-datatypes ((ListLongMap!11109 0))(
  ( (ListLongMap!11110 (toList!5570 List!18208)) )
))
(declare-fun contains!4570 (ListLongMap!11109 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2772 (array!53843 array!53841 (_ BitVec 32) (_ BitVec 32) V!30191 V!30191 (_ BitVec 32) Int) ListLongMap!11109)

(assert (=> b!909915 (= lt!409920 (contains!4570 (getCurrentListMap!2772 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!77940 res!614098) b!909914))

(assert (= (and b!909914 res!614096) b!909912))

(assert (= (and b!909912 res!614095) b!909913))

(assert (= (and b!909913 res!614097) b!909915))

(assert (= (and b!909909 condMapEmpty!30097) mapIsEmpty!30097))

(assert (= (and b!909909 (not condMapEmpty!30097)) mapNonEmpty!30097))

(get-info :version)

(assert (= (and mapNonEmpty!30097 ((_ is ValueCellFull!8978) mapValue!30097)) b!909910))

(assert (= (and b!909909 ((_ is ValueCellFull!8978) mapDefault!30097)) b!909911))

(assert (= start!77940 b!909909))

(declare-fun m!844463 () Bool)

(assert (=> b!909912 m!844463))

(declare-fun m!844465 () Bool)

(assert (=> b!909915 m!844465))

(assert (=> b!909915 m!844465))

(declare-fun m!844467 () Bool)

(assert (=> b!909915 m!844467))

(declare-fun m!844469 () Bool)

(assert (=> mapNonEmpty!30097 m!844469))

(declare-fun m!844471 () Bool)

(assert (=> b!909913 m!844471))

(declare-fun m!844473 () Bool)

(assert (=> start!77940 m!844473))

(declare-fun m!844475 () Bool)

(assert (=> start!77940 m!844475))

(declare-fun m!844477 () Bool)

(assert (=> start!77940 m!844477))

(check-sat (not start!77940) (not b!909913) (not b_next!16501) (not b!909912) tp_is_empty!18919 (not mapNonEmpty!30097) (not b!909915) b_and!27045)
(check-sat b_and!27045 (not b_next!16501))
