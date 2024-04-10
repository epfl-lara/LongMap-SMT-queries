; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78218 () Bool)

(assert start!78218)

(declare-fun b_free!16709 () Bool)

(declare-fun b_next!16709 () Bool)

(assert (=> start!78218 (= b_free!16709 (not b_next!16709))))

(declare-fun tp!58404 () Bool)

(declare-fun b_and!27285 () Bool)

(assert (=> start!78218 (= tp!58404 b_and!27285)))

(declare-fun b!912893 () Bool)

(declare-fun e!512055 () Bool)

(declare-fun tp_is_empty!19127 () Bool)

(assert (=> b!912893 (= e!512055 tp_is_empty!19127)))

(declare-fun b!912894 () Bool)

(declare-fun e!512058 () Bool)

(assert (=> b!912894 (= e!512058 tp_is_empty!19127)))

(declare-fun b!912895 () Bool)

(declare-fun e!512057 () Bool)

(assert (=> b!912895 (= e!512057 (not true))))

(declare-datatypes ((array!54246 0))(
  ( (array!54247 (arr!26077 (Array (_ BitVec 32) (_ BitVec 64))) (size!26536 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54246)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912895 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!30467 0))(
  ( (V!30468 (val!9614 Int)) )
))
(declare-datatypes ((ValueCell!9082 0))(
  ( (ValueCellFull!9082 (v!12125 V!30467)) (EmptyCell!9082) )
))
(declare-datatypes ((array!54248 0))(
  ( (array!54249 (arr!26078 (Array (_ BitVec 32) ValueCell!9082)) (size!26537 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54248)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30467)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30467)

(declare-datatypes ((Unit!30898 0))(
  ( (Unit!30899) )
))
(declare-fun lt!410714 () Unit!30898)

(declare-fun lemmaKeyInListMapIsInArray!274 (array!54246 array!54248 (_ BitVec 32) (_ BitVec 32) V!30467 V!30467 (_ BitVec 64) Int) Unit!30898)

(assert (=> b!912895 (= lt!410714 (lemmaKeyInListMapIsInArray!274 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!912896 () Bool)

(declare-fun res!615820 () Bool)

(assert (=> b!912896 (=> (not res!615820) (not e!512057))))

(assert (=> b!912896 (= res!615820 (and (= (size!26537 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26536 _keys!1386) (size!26537 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912897 () Bool)

(declare-fun res!615822 () Bool)

(assert (=> b!912897 (=> (not res!615822) (not e!512057))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!912897 (= res!615822 (and (= (select (arr!26077 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912898 () Bool)

(declare-fun res!615816 () Bool)

(assert (=> b!912898 (=> (not res!615816) (not e!512057))))

(declare-datatypes ((tuple2!12526 0))(
  ( (tuple2!12527 (_1!6274 (_ BitVec 64)) (_2!6274 V!30467)) )
))
(declare-datatypes ((List!18316 0))(
  ( (Nil!18313) (Cons!18312 (h!19458 tuple2!12526) (t!25905 List!18316)) )
))
(declare-datatypes ((ListLongMap!11223 0))(
  ( (ListLongMap!11224 (toList!5627 List!18316)) )
))
(declare-fun contains!4673 (ListLongMap!11223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2889 (array!54246 array!54248 (_ BitVec 32) (_ BitVec 32) V!30467 V!30467 (_ BitVec 32) Int) ListLongMap!11223)

(assert (=> b!912898 (= res!615816 (contains!4673 (getCurrentListMap!2889 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!912899 () Bool)

(declare-fun res!615817 () Bool)

(assert (=> b!912899 (=> (not res!615817) (not e!512057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54246 (_ BitVec 32)) Bool)

(assert (=> b!912899 (= res!615817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912900 () Bool)

(declare-fun e!512056 () Bool)

(declare-fun mapRes!30418 () Bool)

(assert (=> b!912900 (= e!512056 (and e!512055 mapRes!30418))))

(declare-fun condMapEmpty!30418 () Bool)

(declare-fun mapDefault!30418 () ValueCell!9082)

