; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77868 () Bool)

(assert start!77868)

(declare-fun b_free!16427 () Bool)

(declare-fun b_next!16427 () Bool)

(assert (=> start!77868 (= b_free!16427 (not b_next!16427))))

(declare-fun tp!57546 () Bool)

(declare-fun b_and!26995 () Bool)

(assert (=> start!77868 (= tp!57546 b_and!26995)))

(declare-fun b!909244 () Bool)

(declare-fun e!509645 () Bool)

(declare-fun tp_is_empty!18845 () Bool)

(assert (=> b!909244 (= e!509645 tp_is_empty!18845)))

(declare-fun b!909245 () Bool)

(declare-fun res!613701 () Bool)

(declare-fun e!509644 () Bool)

(assert (=> b!909245 (=> (not res!613701) (not e!509644))))

(declare-datatypes ((V!30091 0))(
  ( (V!30092 (val!9473 Int)) )
))
(declare-datatypes ((ValueCell!8941 0))(
  ( (ValueCellFull!8941 (v!11980 V!30091)) (EmptyCell!8941) )
))
(declare-datatypes ((array!53718 0))(
  ( (array!53719 (arr!25817 (Array (_ BitVec 32) ValueCell!8941)) (size!26276 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53718)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53720 0))(
  ( (array!53721 (arr!25818 (Array (_ BitVec 32) (_ BitVec 64))) (size!26277 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53720)

(assert (=> b!909245 (= res!613701 (and (= (size!26276 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26277 _keys!1386) (size!26276 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909246 () Bool)

(assert (=> b!909246 (= e!509644 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30091)

(declare-fun lt!409967 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30091)

(declare-datatypes ((tuple2!12348 0))(
  ( (tuple2!12349 (_1!6185 (_ BitVec 64)) (_2!6185 V!30091)) )
))
(declare-datatypes ((List!18141 0))(
  ( (Nil!18138) (Cons!18137 (h!19283 tuple2!12348) (t!25722 List!18141)) )
))
(declare-datatypes ((ListLongMap!11045 0))(
  ( (ListLongMap!11046 (toList!5538 List!18141)) )
))
(declare-fun contains!4580 (ListLongMap!11045 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2800 (array!53720 array!53718 (_ BitVec 32) (_ BitVec 32) V!30091 V!30091 (_ BitVec 32) Int) ListLongMap!11045)

(assert (=> b!909246 (= lt!409967 (contains!4580 (getCurrentListMap!2800 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!909247 () Bool)

(declare-fun e!509642 () Bool)

(assert (=> b!909247 (= e!509642 tp_is_empty!18845)))

(declare-fun mapIsEmpty!29983 () Bool)

(declare-fun mapRes!29983 () Bool)

(assert (=> mapIsEmpty!29983 mapRes!29983))

(declare-fun b!909249 () Bool)

(declare-fun res!613698 () Bool)

(assert (=> b!909249 (=> (not res!613698) (not e!509644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53720 (_ BitVec 32)) Bool)

(assert (=> b!909249 (= res!613698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909248 () Bool)

(declare-fun e!509643 () Bool)

(assert (=> b!909248 (= e!509643 (and e!509645 mapRes!29983))))

(declare-fun condMapEmpty!29983 () Bool)

(declare-fun mapDefault!29983 () ValueCell!8941)

