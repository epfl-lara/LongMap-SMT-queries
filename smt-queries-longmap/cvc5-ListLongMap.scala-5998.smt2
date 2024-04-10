; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77840 () Bool)

(assert start!77840)

(declare-fun b_free!16399 () Bool)

(declare-fun b_next!16399 () Bool)

(assert (=> start!77840 (= b_free!16399 (not b_next!16399))))

(declare-fun tp!57462 () Bool)

(declare-fun b_and!26955 () Bool)

(assert (=> start!77840 (= tp!57462 b_and!26955)))

(declare-fun b!908842 () Bool)

(declare-fun res!613437 () Bool)

(declare-fun e!509390 () Bool)

(assert (=> b!908842 (=> (not res!613437) (not e!509390))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908842 (= res!613437 (inRange!0 i!717 mask!1756))))

(declare-fun b!908843 () Bool)

(declare-fun e!509389 () Bool)

(declare-fun tp_is_empty!18817 () Bool)

(assert (=> b!908843 (= e!509389 tp_is_empty!18817)))

(declare-fun b!908844 () Bool)

(declare-fun res!613439 () Bool)

(declare-fun e!509384 () Bool)

(assert (=> b!908844 (=> (not res!613439) (not e!509384))))

(declare-datatypes ((array!53662 0))(
  ( (array!53663 (arr!25789 (Array (_ BitVec 32) (_ BitVec 64))) (size!26248 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53662)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53662 (_ BitVec 32)) Bool)

(assert (=> b!908844 (= res!613439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908845 () Bool)

(declare-fun e!509388 () Bool)

(assert (=> b!908845 (= e!509390 (not e!509388))))

(declare-fun res!613434 () Bool)

(assert (=> b!908845 (=> res!613434 e!509388)))

(assert (=> b!908845 (= res!613434 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26248 _keys!1386))))))

(declare-datatypes ((V!30055 0))(
  ( (V!30056 (val!9459 Int)) )
))
(declare-datatypes ((ValueCell!8927 0))(
  ( (ValueCellFull!8927 (v!11966 V!30055)) (EmptyCell!8927) )
))
(declare-datatypes ((array!53664 0))(
  ( (array!53665 (arr!25790 (Array (_ BitVec 32) ValueCell!8927)) (size!26249 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53664)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409863 () V!30055)

(declare-fun get!13580 (ValueCell!8927 V!30055) V!30055)

(declare-fun dynLambda!1383 (Int (_ BitVec 64)) V!30055)

(assert (=> b!908845 (= lt!409863 (get!13580 (select (arr!25790 _values!1152) i!717) (dynLambda!1383 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908845 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!30055)

(declare-datatypes ((Unit!30846 0))(
  ( (Unit!30847) )
))
(declare-fun lt!409865 () Unit!30846)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30055)

(declare-fun lemmaKeyInListMapIsInArray!255 (array!53662 array!53664 (_ BitVec 32) (_ BitVec 32) V!30055 V!30055 (_ BitVec 64) Int) Unit!30846)

(assert (=> b!908845 (= lt!409865 (lemmaKeyInListMapIsInArray!255 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!908847 () Bool)

(declare-fun res!613443 () Bool)

(assert (=> b!908847 (=> (not res!613443) (not e!509384))))

(assert (=> b!908847 (= res!613443 (and (= (size!26249 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26248 _keys!1386) (size!26249 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908848 () Bool)

(declare-fun res!613440 () Bool)

(declare-fun e!509391 () Bool)

(assert (=> b!908848 (=> res!613440 e!509391)))

(declare-datatypes ((tuple2!12326 0))(
  ( (tuple2!12327 (_1!6174 (_ BitVec 64)) (_2!6174 V!30055)) )
))
(declare-datatypes ((List!18120 0))(
  ( (Nil!18117) (Cons!18116 (h!19262 tuple2!12326) (t!25691 List!18120)) )
))
(declare-datatypes ((ListLongMap!11023 0))(
  ( (ListLongMap!11024 (toList!5527 List!18120)) )
))
(declare-fun lt!409864 () ListLongMap!11023)

(declare-fun apply!507 (ListLongMap!11023 (_ BitVec 64)) V!30055)

(assert (=> b!908848 (= res!613440 (not (= (apply!507 lt!409864 k!1033) lt!409863)))))

(declare-fun b!908849 () Bool)

(declare-fun e!509385 () Bool)

(assert (=> b!908849 (= e!509385 tp_is_empty!18817)))

(declare-fun b!908850 () Bool)

(assert (=> b!908850 (= e!509388 e!509391)))

(declare-fun res!613435 () Bool)

(assert (=> b!908850 (=> res!613435 e!509391)))

(declare-fun contains!4569 (ListLongMap!11023 (_ BitVec 64)) Bool)

(assert (=> b!908850 (= res!613435 (not (contains!4569 lt!409864 k!1033)))))

(declare-fun getCurrentListMap!2789 (array!53662 array!53664 (_ BitVec 32) (_ BitVec 32) V!30055 V!30055 (_ BitVec 32) Int) ListLongMap!11023)

(assert (=> b!908850 (= lt!409864 (getCurrentListMap!2789 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908851 () Bool)

(declare-fun res!613438 () Bool)

(assert (=> b!908851 (=> (not res!613438) (not e!509390))))

(assert (=> b!908851 (= res!613438 (and (= (select (arr!25789 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!29941 () Bool)

(declare-fun mapRes!29941 () Bool)

(assert (=> mapIsEmpty!29941 mapRes!29941))

(declare-fun mapNonEmpty!29941 () Bool)

(declare-fun tp!57461 () Bool)

(assert (=> mapNonEmpty!29941 (= mapRes!29941 (and tp!57461 e!509385))))

(declare-fun mapRest!29941 () (Array (_ BitVec 32) ValueCell!8927))

(declare-fun mapValue!29941 () ValueCell!8927)

(declare-fun mapKey!29941 () (_ BitVec 32))

(assert (=> mapNonEmpty!29941 (= (arr!25790 _values!1152) (store mapRest!29941 mapKey!29941 mapValue!29941))))

(declare-fun res!613442 () Bool)

(assert (=> start!77840 (=> (not res!613442) (not e!509384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77840 (= res!613442 (validMask!0 mask!1756))))

(assert (=> start!77840 e!509384))

(declare-fun e!509387 () Bool)

(declare-fun array_inv!20186 (array!53664) Bool)

(assert (=> start!77840 (and (array_inv!20186 _values!1152) e!509387)))

(assert (=> start!77840 tp!57462))

(assert (=> start!77840 true))

(assert (=> start!77840 tp_is_empty!18817))

(declare-fun array_inv!20187 (array!53662) Bool)

(assert (=> start!77840 (array_inv!20187 _keys!1386)))

(declare-fun b!908846 () Bool)

(assert (=> b!908846 (= e!509387 (and e!509389 mapRes!29941))))

(declare-fun condMapEmpty!29941 () Bool)

(declare-fun mapDefault!29941 () ValueCell!8927)

