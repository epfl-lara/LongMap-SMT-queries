; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77742 () Bool)

(assert start!77742)

(declare-fun b_free!16327 () Bool)

(declare-fun b_next!16327 () Bool)

(assert (=> start!77742 (= b_free!16327 (not b_next!16327))))

(declare-fun tp!57242 () Bool)

(declare-fun b_and!26807 () Bool)

(assert (=> start!77742 (= tp!57242 b_and!26807)))

(declare-fun mapIsEmpty!29830 () Bool)

(declare-fun mapRes!29830 () Bool)

(assert (=> mapIsEmpty!29830 mapRes!29830))

(declare-fun b!907214 () Bool)

(declare-fun e!508418 () Bool)

(assert (=> b!907214 (= e!508418 true)))

(declare-datatypes ((V!29959 0))(
  ( (V!29960 (val!9423 Int)) )
))
(declare-datatypes ((tuple2!12272 0))(
  ( (tuple2!12273 (_1!6147 (_ BitVec 64)) (_2!6147 V!29959)) )
))
(declare-datatypes ((List!18073 0))(
  ( (Nil!18070) (Cons!18069 (h!19215 tuple2!12272) (t!25572 List!18073)) )
))
(declare-datatypes ((ListLongMap!10969 0))(
  ( (ListLongMap!10970 (toList!5500 List!18073)) )
))
(declare-fun lt!409205 () ListLongMap!10969)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!409204 () V!29959)

(declare-fun apply!484 (ListLongMap!10969 (_ BitVec 64)) V!29959)

(assert (=> b!907214 (= (apply!484 lt!409205 k!1033) lt!409204)))

(declare-datatypes ((ValueCell!8891 0))(
  ( (ValueCellFull!8891 (v!11928 V!29959)) (EmptyCell!8891) )
))
(declare-datatypes ((array!53526 0))(
  ( (array!53527 (arr!25722 (Array (_ BitVec 32) ValueCell!8891)) (size!26181 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53526)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((Unit!30788 0))(
  ( (Unit!30789) )
))
(declare-fun lt!409202 () Unit!30788)

(declare-fun zeroValue!1094 () V!29959)

(declare-datatypes ((array!53528 0))(
  ( (array!53529 (arr!25723 (Array (_ BitVec 32) (_ BitVec 64))) (size!26182 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53528)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29959)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun lemmaListMapApplyFromThenApplyFromZero!37 (array!53528 array!53526 (_ BitVec 32) (_ BitVec 32) V!29959 V!29959 (_ BitVec 64) V!29959 (_ BitVec 32) Int) Unit!30788)

(assert (=> b!907214 (= lt!409202 (lemmaListMapApplyFromThenApplyFromZero!37 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409204 i!717 defaultEntry!1160))))

(declare-fun b!907215 () Bool)

(declare-fun res!612290 () Bool)

(assert (=> b!907215 (=> res!612290 e!508418)))

(declare-fun lt!409206 () ListLongMap!10969)

(assert (=> b!907215 (= res!612290 (not (= (apply!484 lt!409206 k!1033) lt!409204)))))

(declare-fun b!907216 () Bool)

(declare-fun e!508423 () Bool)

(declare-fun tp_is_empty!18745 () Bool)

(assert (=> b!907216 (= e!508423 tp_is_empty!18745)))

(declare-fun b!907217 () Bool)

(declare-fun res!612299 () Bool)

(declare-fun e!508420 () Bool)

(assert (=> b!907217 (=> (not res!612299) (not e!508420))))

(assert (=> b!907217 (= res!612299 (and (= (size!26181 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26182 _keys!1386) (size!26181 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907218 () Bool)

(declare-fun e!508421 () Bool)

(declare-fun e!508425 () Bool)

(assert (=> b!907218 (= e!508421 (not e!508425))))

(declare-fun res!612298 () Bool)

(assert (=> b!907218 (=> res!612298 e!508425)))

(assert (=> b!907218 (= res!612298 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26182 _keys!1386))))))

(declare-fun get!13530 (ValueCell!8891 V!29959) V!29959)

(declare-fun dynLambda!1360 (Int (_ BitVec 64)) V!29959)

(assert (=> b!907218 (= lt!409204 (get!13530 (select (arr!25722 _values!1152) i!717) (dynLambda!1360 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907218 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409203 () Unit!30788)

(declare-fun lemmaKeyInListMapIsInArray!232 (array!53528 array!53526 (_ BitVec 32) (_ BitVec 32) V!29959 V!29959 (_ BitVec 64) Int) Unit!30788)

(assert (=> b!907218 (= lt!409203 (lemmaKeyInListMapIsInArray!232 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!907219 () Bool)

(declare-fun e!508422 () Bool)

(assert (=> b!907219 (= e!508422 (and e!508423 mapRes!29830))))

(declare-fun condMapEmpty!29830 () Bool)

(declare-fun mapDefault!29830 () ValueCell!8891)

