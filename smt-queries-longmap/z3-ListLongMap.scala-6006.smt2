; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78056 () Bool)

(assert start!78056)

(declare-fun b_free!16447 () Bool)

(declare-fun b_next!16447 () Bool)

(assert (=> start!78056 (= b_free!16447 (not b_next!16447))))

(declare-fun tp!57606 () Bool)

(declare-fun b_and!27025 () Bool)

(assert (=> start!78056 (= tp!57606 b_and!27025)))

(declare-fun mapNonEmpty!30013 () Bool)

(declare-fun mapRes!30013 () Bool)

(declare-fun tp!57607 () Bool)

(declare-fun e!510376 () Bool)

(assert (=> mapNonEmpty!30013 (= mapRes!30013 (and tp!57607 e!510376))))

(declare-datatypes ((V!30119 0))(
  ( (V!30120 (val!9483 Int)) )
))
(declare-datatypes ((ValueCell!8951 0))(
  ( (ValueCellFull!8951 (v!11987 V!30119)) (EmptyCell!8951) )
))
(declare-datatypes ((array!53805 0))(
  ( (array!53806 (arr!25856 (Array (_ BitVec 32) ValueCell!8951)) (size!26316 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53805)

(declare-fun mapKey!30013 () (_ BitVec 32))

(declare-fun mapRest!30013 () (Array (_ BitVec 32) ValueCell!8951))

(declare-fun mapValue!30013 () ValueCell!8951)

(assert (=> mapNonEmpty!30013 (= (arr!25856 _values!1152) (store mapRest!30013 mapKey!30013 mapValue!30013))))

(declare-fun b!910357 () Bool)

(declare-fun e!510378 () Bool)

(assert (=> b!910357 (= e!510378 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30119)

(declare-fun lt!410358 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30119)

(declare-datatypes ((array!53807 0))(
  ( (array!53808 (arr!25857 (Array (_ BitVec 32) (_ BitVec 64))) (size!26317 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53807)

(declare-datatypes ((tuple2!12316 0))(
  ( (tuple2!12317 (_1!6169 (_ BitVec 64)) (_2!6169 V!30119)) )
))
(declare-datatypes ((List!18135 0))(
  ( (Nil!18132) (Cons!18131 (h!19283 tuple2!12316) (t!25708 List!18135)) )
))
(declare-datatypes ((ListLongMap!11015 0))(
  ( (ListLongMap!11016 (toList!5523 List!18135)) )
))
(declare-fun contains!4574 (ListLongMap!11015 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2784 (array!53807 array!53805 (_ BitVec 32) (_ BitVec 32) V!30119 V!30119 (_ BitVec 32) Int) ListLongMap!11015)

(assert (=> b!910357 (= lt!410358 (contains!4574 (getCurrentListMap!2784 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!614162 () Bool)

(assert (=> start!78056 (=> (not res!614162) (not e!510378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78056 (= res!614162 (validMask!0 mask!1756))))

(assert (=> start!78056 e!510378))

(declare-fun e!510375 () Bool)

(declare-fun array_inv!20294 (array!53805) Bool)

(assert (=> start!78056 (and (array_inv!20294 _values!1152) e!510375)))

(assert (=> start!78056 tp!57606))

(assert (=> start!78056 true))

(declare-fun tp_is_empty!18865 () Bool)

(assert (=> start!78056 tp_is_empty!18865))

(declare-fun array_inv!20295 (array!53807) Bool)

(assert (=> start!78056 (array_inv!20295 _keys!1386)))

(declare-fun b!910358 () Bool)

(declare-fun res!614164 () Bool)

(assert (=> b!910358 (=> (not res!614164) (not e!510378))))

(assert (=> b!910358 (= res!614164 (and (= (size!26316 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26317 _keys!1386) (size!26316 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910359 () Bool)

(declare-fun res!614163 () Bool)

(assert (=> b!910359 (=> (not res!614163) (not e!510378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53807 (_ BitVec 32)) Bool)

(assert (=> b!910359 (= res!614163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30013 () Bool)

(assert (=> mapIsEmpty!30013 mapRes!30013))

(declare-fun b!910360 () Bool)

(declare-fun res!614165 () Bool)

(assert (=> b!910360 (=> (not res!614165) (not e!510378))))

(declare-datatypes ((List!18136 0))(
  ( (Nil!18133) (Cons!18132 (h!19284 (_ BitVec 64)) (t!25709 List!18136)) )
))
(declare-fun arrayNoDuplicates!0 (array!53807 (_ BitVec 32) List!18136) Bool)

(assert (=> b!910360 (= res!614165 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18133))))

(declare-fun b!910361 () Bool)

(declare-fun e!510377 () Bool)

(assert (=> b!910361 (= e!510377 tp_is_empty!18865)))

(declare-fun b!910362 () Bool)

(assert (=> b!910362 (= e!510376 tp_is_empty!18865)))

(declare-fun b!910363 () Bool)

(assert (=> b!910363 (= e!510375 (and e!510377 mapRes!30013))))

(declare-fun condMapEmpty!30013 () Bool)

(declare-fun mapDefault!30013 () ValueCell!8951)

(assert (=> b!910363 (= condMapEmpty!30013 (= (arr!25856 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8951)) mapDefault!30013)))))

(assert (= (and start!78056 res!614162) b!910358))

(assert (= (and b!910358 res!614164) b!910359))

(assert (= (and b!910359 res!614163) b!910360))

(assert (= (and b!910360 res!614165) b!910357))

(assert (= (and b!910363 condMapEmpty!30013) mapIsEmpty!30013))

(assert (= (and b!910363 (not condMapEmpty!30013)) mapNonEmpty!30013))

(get-info :version)

(assert (= (and mapNonEmpty!30013 ((_ is ValueCellFull!8951) mapValue!30013)) b!910362))

(assert (= (and b!910363 ((_ is ValueCellFull!8951) mapDefault!30013)) b!910361))

(assert (= start!78056 b!910363))

(declare-fun m!845991 () Bool)

(assert (=> b!910360 m!845991))

(declare-fun m!845993 () Bool)

(assert (=> b!910359 m!845993))

(declare-fun m!845995 () Bool)

(assert (=> start!78056 m!845995))

(declare-fun m!845997 () Bool)

(assert (=> start!78056 m!845997))

(declare-fun m!845999 () Bool)

(assert (=> start!78056 m!845999))

(declare-fun m!846001 () Bool)

(assert (=> mapNonEmpty!30013 m!846001))

(declare-fun m!846003 () Bool)

(assert (=> b!910357 m!846003))

(assert (=> b!910357 m!846003))

(declare-fun m!846005 () Bool)

(assert (=> b!910357 m!846005))

(check-sat (not mapNonEmpty!30013) b_and!27025 (not b!910360) (not b!910357) (not b!910359) (not start!78056) (not b_next!16447) tp_is_empty!18865)
(check-sat b_and!27025 (not b_next!16447))
