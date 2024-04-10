; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77804 () Bool)

(assert start!77804)

(declare-fun b_free!16363 () Bool)

(declare-fun b_next!16363 () Bool)

(assert (=> start!77804 (= b_free!16363 (not b_next!16363))))

(declare-fun tp!57353 () Bool)

(declare-fun b_and!26883 () Bool)

(assert (=> start!77804 (= tp!57353 b_and!26883)))

(declare-fun b!908104 () Bool)

(declare-fun res!612900 () Bool)

(declare-fun e!508953 () Bool)

(assert (=> b!908104 (=> res!612900 e!508953)))

(declare-datatypes ((V!30007 0))(
  ( (V!30008 (val!9441 Int)) )
))
(declare-datatypes ((tuple2!12298 0))(
  ( (tuple2!12299 (_1!6160 (_ BitVec 64)) (_2!6160 V!30007)) )
))
(declare-datatypes ((List!18096 0))(
  ( (Nil!18093) (Cons!18092 (h!19238 tuple2!12298) (t!25631 List!18096)) )
))
(declare-datatypes ((ListLongMap!10995 0))(
  ( (ListLongMap!10996 (toList!5513 List!18096)) )
))
(declare-fun lt!409593 () ListLongMap!10995)

(declare-fun lt!409594 () V!30007)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun apply!497 (ListLongMap!10995 (_ BitVec 64)) V!30007)

(assert (=> b!908104 (= res!612900 (not (= (apply!497 lt!409593 k!1033) lt!409594)))))

(declare-fun b!908105 () Bool)

(declare-fun res!612899 () Bool)

(declare-fun e!508958 () Bool)

(assert (=> b!908105 (=> (not res!612899) (not e!508958))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53596 0))(
  ( (array!53597 (arr!25756 (Array (_ BitVec 32) (_ BitVec 64))) (size!26215 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53596)

(assert (=> b!908105 (= res!612899 (and (= (select (arr!25756 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908106 () Bool)

(declare-fun e!508959 () Bool)

(declare-fun tp_is_empty!18781 () Bool)

(assert (=> b!908106 (= e!508959 tp_is_empty!18781)))

(declare-fun mapNonEmpty!29887 () Bool)

(declare-fun mapRes!29887 () Bool)

(declare-fun tp!57354 () Bool)

(assert (=> mapNonEmpty!29887 (= mapRes!29887 (and tp!57354 e!508959))))

(declare-datatypes ((ValueCell!8909 0))(
  ( (ValueCellFull!8909 (v!11948 V!30007)) (EmptyCell!8909) )
))
(declare-datatypes ((array!53598 0))(
  ( (array!53599 (arr!25757 (Array (_ BitVec 32) ValueCell!8909)) (size!26216 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53598)

(declare-fun mapValue!29887 () ValueCell!8909)

(declare-fun mapKey!29887 () (_ BitVec 32))

(declare-fun mapRest!29887 () (Array (_ BitVec 32) ValueCell!8909))

(assert (=> mapNonEmpty!29887 (= (arr!25757 _values!1152) (store mapRest!29887 mapKey!29887 mapValue!29887))))

(declare-fun mapIsEmpty!29887 () Bool)

(assert (=> mapIsEmpty!29887 mapRes!29887))

(declare-fun b!908107 () Bool)

(declare-fun e!508955 () Bool)

(assert (=> b!908107 (= e!508958 (not e!508955))))

(declare-fun res!612894 () Bool)

(assert (=> b!908107 (=> res!612894 e!508955)))

(assert (=> b!908107 (= res!612894 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26215 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun get!13557 (ValueCell!8909 V!30007) V!30007)

(declare-fun dynLambda!1372 (Int (_ BitVec 64)) V!30007)

(assert (=> b!908107 (= lt!409594 (get!13557 (select (arr!25757 _values!1152) i!717) (dynLambda!1372 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908107 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30007)

(declare-datatypes ((Unit!30822 0))(
  ( (Unit!30823) )
))
(declare-fun lt!409591 () Unit!30822)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30007)

(declare-fun lemmaKeyInListMapIsInArray!244 (array!53596 array!53598 (_ BitVec 32) (_ BitVec 32) V!30007 V!30007 (_ BitVec 64) Int) Unit!30822)

(assert (=> b!908107 (= lt!409591 (lemmaKeyInListMapIsInArray!244 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!908108 () Bool)

(declare-fun e!508956 () Bool)

(assert (=> b!908108 (= e!508956 e!508958)))

(declare-fun res!612895 () Bool)

(assert (=> b!908108 (=> (not res!612895) (not e!508958))))

(declare-fun lt!409592 () ListLongMap!10995)

(declare-fun contains!4556 (ListLongMap!10995 (_ BitVec 64)) Bool)

(assert (=> b!908108 (= res!612895 (contains!4556 lt!409592 k!1033))))

(declare-fun getCurrentListMap!2776 (array!53596 array!53598 (_ BitVec 32) (_ BitVec 32) V!30007 V!30007 (_ BitVec 32) Int) ListLongMap!10995)

(assert (=> b!908108 (= lt!409592 (getCurrentListMap!2776 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun res!612898 () Bool)

(assert (=> start!77804 (=> (not res!612898) (not e!508956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77804 (= res!612898 (validMask!0 mask!1756))))

(assert (=> start!77804 e!508956))

(declare-fun e!508952 () Bool)

(declare-fun array_inv!20166 (array!53598) Bool)

(assert (=> start!77804 (and (array_inv!20166 _values!1152) e!508952)))

(assert (=> start!77804 tp!57353))

(assert (=> start!77804 true))

(assert (=> start!77804 tp_is_empty!18781))

(declare-fun array_inv!20167 (array!53596) Bool)

(assert (=> start!77804 (array_inv!20167 _keys!1386)))

(declare-fun b!908109 () Bool)

(declare-fun res!612897 () Bool)

(assert (=> b!908109 (=> (not res!612897) (not e!508956))))

(assert (=> b!908109 (= res!612897 (and (= (size!26216 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26215 _keys!1386) (size!26216 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908110 () Bool)

(assert (=> b!908110 (= e!508955 e!508953)))

(declare-fun res!612901 () Bool)

(assert (=> b!908110 (=> res!612901 e!508953)))

(assert (=> b!908110 (= res!612901 (not (contains!4556 lt!409593 k!1033)))))

(assert (=> b!908110 (= lt!409593 (getCurrentListMap!2776 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908111 () Bool)

(declare-fun res!612896 () Bool)

(assert (=> b!908111 (=> (not res!612896) (not e!508956))))

(declare-datatypes ((List!18097 0))(
  ( (Nil!18094) (Cons!18093 (h!19239 (_ BitVec 64)) (t!25632 List!18097)) )
))
(declare-fun arrayNoDuplicates!0 (array!53596 (_ BitVec 32) List!18097) Bool)

(assert (=> b!908111 (= res!612896 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18094))))

(declare-fun b!908112 () Bool)

(declare-fun res!612902 () Bool)

(assert (=> b!908112 (=> (not res!612902) (not e!508958))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908112 (= res!612902 (inRange!0 i!717 mask!1756))))

(declare-fun b!908113 () Bool)

(declare-fun res!612903 () Bool)

(assert (=> b!908113 (=> (not res!612903) (not e!508956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53596 (_ BitVec 32)) Bool)

(assert (=> b!908113 (= res!612903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908114 () Bool)

(assert (=> b!908114 (= e!508953 true)))

(assert (=> b!908114 (= (apply!497 lt!409592 k!1033) lt!409594)))

(declare-fun lt!409595 () Unit!30822)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!49 (array!53596 array!53598 (_ BitVec 32) (_ BitVec 32) V!30007 V!30007 (_ BitVec 64) V!30007 (_ BitVec 32) Int) Unit!30822)

(assert (=> b!908114 (= lt!409595 (lemmaListMapApplyFromThenApplyFromZero!49 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409594 i!717 defaultEntry!1160))))

(declare-fun b!908115 () Bool)

(declare-fun e!508957 () Bool)

(assert (=> b!908115 (= e!508952 (and e!508957 mapRes!29887))))

(declare-fun condMapEmpty!29887 () Bool)

(declare-fun mapDefault!29887 () ValueCell!8909)

