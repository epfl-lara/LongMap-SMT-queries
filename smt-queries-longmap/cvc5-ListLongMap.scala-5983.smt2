; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77724 () Bool)

(assert start!77724)

(declare-fun b_free!16309 () Bool)

(declare-fun b_next!16309 () Bool)

(assert (=> start!77724 (= b_free!16309 (not b_next!16309))))

(declare-fun tp!57189 () Bool)

(declare-fun b_and!26771 () Bool)

(assert (=> start!77724 (= tp!57189 b_and!26771)))

(declare-fun b!906845 () Bool)

(declare-fun e!508206 () Bool)

(declare-fun e!508205 () Bool)

(assert (=> b!906845 (= e!508206 (not e!508205))))

(declare-fun res!612028 () Bool)

(assert (=> b!906845 (=> res!612028 e!508205)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53494 0))(
  ( (array!53495 (arr!25706 (Array (_ BitVec 32) (_ BitVec 64))) (size!26165 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53494)

(assert (=> b!906845 (= res!612028 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26165 _keys!1386))))))

(declare-datatypes ((V!29935 0))(
  ( (V!29936 (val!9414 Int)) )
))
(declare-datatypes ((ValueCell!8882 0))(
  ( (ValueCellFull!8882 (v!11919 V!29935)) (EmptyCell!8882) )
))
(declare-datatypes ((array!53496 0))(
  ( (array!53497 (arr!25707 (Array (_ BitVec 32) ValueCell!8882)) (size!26166 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53496)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409068 () V!29935)

(declare-fun get!13520 (ValueCell!8882 V!29935) V!29935)

(declare-fun dynLambda!1356 (Int (_ BitVec 64)) V!29935)

(assert (=> b!906845 (= lt!409068 (get!13520 (select (arr!25707 _values!1152) i!717) (dynLambda!1356 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906845 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29935)

(declare-datatypes ((Unit!30780 0))(
  ( (Unit!30781) )
))
(declare-fun lt!409070 () Unit!30780)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29935)

(declare-fun lemmaKeyInListMapIsInArray!228 (array!53494 array!53496 (_ BitVec 32) (_ BitVec 32) V!29935 V!29935 (_ BitVec 64) Int) Unit!30780)

(assert (=> b!906845 (= lt!409070 (lemmaKeyInListMapIsInArray!228 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!906846 () Bool)

(declare-fun e!508204 () Bool)

(declare-fun tp_is_empty!18727 () Bool)

(assert (=> b!906846 (= e!508204 tp_is_empty!18727)))

(declare-fun b!906847 () Bool)

(declare-fun e!508203 () Bool)

(assert (=> b!906847 (= e!508203 e!508206)))

(declare-fun res!612025 () Bool)

(assert (=> b!906847 (=> (not res!612025) (not e!508206))))

(declare-datatypes ((tuple2!12258 0))(
  ( (tuple2!12259 (_1!6140 (_ BitVec 64)) (_2!6140 V!29935)) )
))
(declare-datatypes ((List!18062 0))(
  ( (Nil!18059) (Cons!18058 (h!19204 tuple2!12258) (t!25543 List!18062)) )
))
(declare-datatypes ((ListLongMap!10955 0))(
  ( (ListLongMap!10956 (toList!5493 List!18062)) )
))
(declare-fun lt!409067 () ListLongMap!10955)

(declare-fun contains!4538 (ListLongMap!10955 (_ BitVec 64)) Bool)

(assert (=> b!906847 (= res!612025 (contains!4538 lt!409067 k!1033))))

(declare-fun getCurrentListMap!2759 (array!53494 array!53496 (_ BitVec 32) (_ BitVec 32) V!29935 V!29935 (_ BitVec 32) Int) ListLongMap!10955)

(assert (=> b!906847 (= lt!409067 (getCurrentListMap!2759 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906848 () Bool)

(declare-fun e!508209 () Bool)

(assert (=> b!906848 (= e!508209 tp_is_empty!18727)))

(declare-fun mapIsEmpty!29803 () Bool)

(declare-fun mapRes!29803 () Bool)

(assert (=> mapIsEmpty!29803 mapRes!29803))

(declare-fun b!906849 () Bool)

(declare-fun res!612020 () Bool)

(declare-fun e!508207 () Bool)

(assert (=> b!906849 (=> res!612020 e!508207)))

(declare-fun lt!409069 () ListLongMap!10955)

(declare-fun apply!479 (ListLongMap!10955 (_ BitVec 64)) V!29935)

(assert (=> b!906849 (= res!612020 (not (= (apply!479 lt!409069 k!1033) lt!409068)))))

(declare-fun b!906850 () Bool)

(declare-fun res!612021 () Bool)

(assert (=> b!906850 (=> (not res!612021) (not e!508206))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906850 (= res!612021 (inRange!0 i!717 mask!1756))))

(declare-fun res!612023 () Bool)

(assert (=> start!77724 (=> (not res!612023) (not e!508203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77724 (= res!612023 (validMask!0 mask!1756))))

(assert (=> start!77724 e!508203))

(declare-fun e!508208 () Bool)

(declare-fun array_inv!20138 (array!53496) Bool)

(assert (=> start!77724 (and (array_inv!20138 _values!1152) e!508208)))

(assert (=> start!77724 tp!57189))

(assert (=> start!77724 true))

(assert (=> start!77724 tp_is_empty!18727))

(declare-fun array_inv!20139 (array!53494) Bool)

(assert (=> start!77724 (array_inv!20139 _keys!1386)))

(declare-fun b!906851 () Bool)

(assert (=> b!906851 (= e!508208 (and e!508204 mapRes!29803))))

(declare-fun condMapEmpty!29803 () Bool)

(declare-fun mapDefault!29803 () ValueCell!8882)

