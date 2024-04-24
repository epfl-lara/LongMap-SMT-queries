; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78120 () Bool)

(assert start!78120)

(declare-fun b_free!16495 () Bool)

(declare-fun b_next!16495 () Bool)

(assert (=> start!78120 (= b_free!16495 (not b_next!16495))))

(declare-fun tp!57754 () Bool)

(declare-fun b_and!27075 () Bool)

(assert (=> start!78120 (= tp!57754 b_and!27075)))

(declare-fun b!910988 () Bool)

(declare-fun e!510806 () Bool)

(declare-fun e!510808 () Bool)

(declare-fun mapRes!30088 () Bool)

(assert (=> b!910988 (= e!510806 (and e!510808 mapRes!30088))))

(declare-fun condMapEmpty!30088 () Bool)

(declare-datatypes ((V!30183 0))(
  ( (V!30184 (val!9507 Int)) )
))
(declare-datatypes ((ValueCell!8975 0))(
  ( (ValueCellFull!8975 (v!12012 V!30183)) (EmptyCell!8975) )
))
(declare-datatypes ((array!53895 0))(
  ( (array!53896 (arr!25900 (Array (_ BitVec 32) ValueCell!8975)) (size!26360 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53895)

(declare-fun mapDefault!30088 () ValueCell!8975)

(assert (=> b!910988 (= condMapEmpty!30088 (= (arr!25900 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8975)) mapDefault!30088)))))

(declare-fun mapNonEmpty!30088 () Bool)

(declare-fun tp!57753 () Bool)

(declare-fun e!510807 () Bool)

(assert (=> mapNonEmpty!30088 (= mapRes!30088 (and tp!57753 e!510807))))

(declare-fun mapRest!30088 () (Array (_ BitVec 32) ValueCell!8975))

(declare-fun mapValue!30088 () ValueCell!8975)

(declare-fun mapKey!30088 () (_ BitVec 32))

(assert (=> mapNonEmpty!30088 (= (arr!25900 _values!1152) (store mapRest!30088 mapKey!30088 mapValue!30088))))

(declare-fun b!910989 () Bool)

(declare-fun tp_is_empty!18913 () Bool)

(assert (=> b!910989 (= e!510808 tp_is_empty!18913)))

(declare-fun b!910990 () Bool)

(declare-fun e!510809 () Bool)

(assert (=> b!910990 (= e!510809 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30183)

(declare-datatypes ((array!53897 0))(
  ( (array!53898 (arr!25901 (Array (_ BitVec 32) (_ BitVec 64))) (size!26361 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53897)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410508 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30183)

(declare-datatypes ((tuple2!12346 0))(
  ( (tuple2!12347 (_1!6184 (_ BitVec 64)) (_2!6184 V!30183)) )
))
(declare-datatypes ((List!18165 0))(
  ( (Nil!18162) (Cons!18161 (h!19313 tuple2!12346) (t!25740 List!18165)) )
))
(declare-datatypes ((ListLongMap!11045 0))(
  ( (ListLongMap!11046 (toList!5538 List!18165)) )
))
(declare-fun contains!4590 (ListLongMap!11045 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2799 (array!53897 array!53895 (_ BitVec 32) (_ BitVec 32) V!30183 V!30183 (_ BitVec 32) Int) ListLongMap!11045)

(assert (=> b!910990 (= lt!410508 (contains!4590 (getCurrentListMap!2799 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910991 () Bool)

(declare-fun res!614515 () Bool)

(assert (=> b!910991 (=> (not res!614515) (not e!510809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53897 (_ BitVec 32)) Bool)

(assert (=> b!910991 (= res!614515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910992 () Bool)

(declare-fun res!614516 () Bool)

(assert (=> b!910992 (=> (not res!614516) (not e!510809))))

(assert (=> b!910992 (= res!614516 (and (= (size!26360 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26361 _keys!1386) (size!26360 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910993 () Bool)

(declare-fun res!614514 () Bool)

(assert (=> b!910993 (=> (not res!614514) (not e!510809))))

(declare-datatypes ((List!18166 0))(
  ( (Nil!18163) (Cons!18162 (h!19314 (_ BitVec 64)) (t!25741 List!18166)) )
))
(declare-fun arrayNoDuplicates!0 (array!53897 (_ BitVec 32) List!18166) Bool)

(assert (=> b!910993 (= res!614514 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18163))))

(declare-fun mapIsEmpty!30088 () Bool)

(assert (=> mapIsEmpty!30088 mapRes!30088))

(declare-fun b!910994 () Bool)

(assert (=> b!910994 (= e!510807 tp_is_empty!18913)))

(declare-fun res!614513 () Bool)

(assert (=> start!78120 (=> (not res!614513) (not e!510809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78120 (= res!614513 (validMask!0 mask!1756))))

(assert (=> start!78120 e!510809))

(declare-fun array_inv!20324 (array!53895) Bool)

(assert (=> start!78120 (and (array_inv!20324 _values!1152) e!510806)))

(assert (=> start!78120 tp!57754))

(assert (=> start!78120 true))

(assert (=> start!78120 tp_is_empty!18913))

(declare-fun array_inv!20325 (array!53897) Bool)

(assert (=> start!78120 (array_inv!20325 _keys!1386)))

(assert (= (and start!78120 res!614513) b!910992))

(assert (= (and b!910992 res!614516) b!910991))

(assert (= (and b!910991 res!614515) b!910993))

(assert (= (and b!910993 res!614514) b!910990))

(assert (= (and b!910988 condMapEmpty!30088) mapIsEmpty!30088))

(assert (= (and b!910988 (not condMapEmpty!30088)) mapNonEmpty!30088))

(get-info :version)

(assert (= (and mapNonEmpty!30088 ((_ is ValueCellFull!8975) mapValue!30088)) b!910994))

(assert (= (and b!910988 ((_ is ValueCellFull!8975) mapDefault!30088)) b!910989))

(assert (= start!78120 b!910988))

(declare-fun m!846467 () Bool)

(assert (=> mapNonEmpty!30088 m!846467))

(declare-fun m!846469 () Bool)

(assert (=> start!78120 m!846469))

(declare-fun m!846471 () Bool)

(assert (=> start!78120 m!846471))

(declare-fun m!846473 () Bool)

(assert (=> start!78120 m!846473))

(declare-fun m!846475 () Bool)

(assert (=> b!910991 m!846475))

(declare-fun m!846477 () Bool)

(assert (=> b!910993 m!846477))

(declare-fun m!846479 () Bool)

(assert (=> b!910990 m!846479))

(assert (=> b!910990 m!846479))

(declare-fun m!846481 () Bool)

(assert (=> b!910990 m!846481))

(check-sat (not b_next!16495) (not start!78120) (not b!910990) (not b!910991) (not mapNonEmpty!30088) b_and!27075 tp_is_empty!18913 (not b!910993))
(check-sat b_and!27075 (not b_next!16495))
