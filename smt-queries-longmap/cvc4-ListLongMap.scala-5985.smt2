; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77740 () Bool)

(assert start!77740)

(declare-fun b_free!16325 () Bool)

(declare-fun b_next!16325 () Bool)

(assert (=> start!77740 (= b_free!16325 (not b_next!16325))))

(declare-fun tp!57237 () Bool)

(declare-fun b_and!26803 () Bool)

(assert (=> start!77740 (= tp!57237 b_and!26803)))

(declare-fun b!907174 () Bool)

(declare-fun res!612265 () Bool)

(declare-fun e!508401 () Bool)

(assert (=> b!907174 (=> (not res!612265) (not e!508401))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53522 0))(
  ( (array!53523 (arr!25720 (Array (_ BitVec 32) (_ BitVec 64))) (size!26179 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53522)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!907174 (= res!612265 (and (= (select (arr!25720 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907175 () Bool)

(declare-fun e!508398 () Bool)

(declare-fun e!508396 () Bool)

(assert (=> b!907175 (= e!508398 e!508396)))

(declare-fun res!612268 () Bool)

(assert (=> b!907175 (=> res!612268 e!508396)))

(declare-datatypes ((V!29955 0))(
  ( (V!29956 (val!9422 Int)) )
))
(declare-datatypes ((tuple2!12270 0))(
  ( (tuple2!12271 (_1!6146 (_ BitVec 64)) (_2!6146 V!29955)) )
))
(declare-datatypes ((List!18071 0))(
  ( (Nil!18068) (Cons!18067 (h!19213 tuple2!12270) (t!25568 List!18071)) )
))
(declare-datatypes ((ListLongMap!10967 0))(
  ( (ListLongMap!10968 (toList!5499 List!18071)) )
))
(declare-fun lt!409191 () ListLongMap!10967)

(declare-fun contains!4544 (ListLongMap!10967 (_ BitVec 64)) Bool)

(assert (=> b!907175 (= res!612268 (not (contains!4544 lt!409191 k!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29955)

(declare-datatypes ((ValueCell!8890 0))(
  ( (ValueCellFull!8890 (v!11927 V!29955)) (EmptyCell!8890) )
))
(declare-datatypes ((array!53524 0))(
  ( (array!53525 (arr!25721 (Array (_ BitVec 32) ValueCell!8890)) (size!26180 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53524)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29955)

(declare-fun getCurrentListMap!2765 (array!53522 array!53524 (_ BitVec 32) (_ BitVec 32) V!29955 V!29955 (_ BitVec 32) Int) ListLongMap!10967)

(assert (=> b!907175 (= lt!409191 (getCurrentListMap!2765 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907176 () Bool)

(declare-fun res!612260 () Bool)

(declare-fun e!508397 () Bool)

(assert (=> b!907176 (=> (not res!612260) (not e!508397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53522 (_ BitVec 32)) Bool)

(assert (=> b!907176 (= res!612260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907177 () Bool)

(declare-fun res!612269 () Bool)

(assert (=> b!907177 (=> (not res!612269) (not e!508397))))

(declare-datatypes ((List!18072 0))(
  ( (Nil!18069) (Cons!18068 (h!19214 (_ BitVec 64)) (t!25569 List!18072)) )
))
(declare-fun arrayNoDuplicates!0 (array!53522 (_ BitVec 32) List!18072) Bool)

(assert (=> b!907177 (= res!612269 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18069))))

(declare-fun b!907178 () Bool)

(declare-fun res!612263 () Bool)

(assert (=> b!907178 (=> res!612263 e!508396)))

(declare-fun lt!409189 () V!29955)

(declare-fun apply!483 (ListLongMap!10967 (_ BitVec 64)) V!29955)

(assert (=> b!907178 (= res!612263 (not (= (apply!483 lt!409191 k!1033) lt!409189)))))

(declare-fun b!907179 () Bool)

(declare-fun res!612261 () Bool)

(assert (=> b!907179 (=> (not res!612261) (not e!508401))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907179 (= res!612261 (inRange!0 i!717 mask!1756))))

(declare-fun b!907180 () Bool)

(declare-fun e!508395 () Bool)

(declare-fun e!508400 () Bool)

(declare-fun mapRes!29827 () Bool)

(assert (=> b!907180 (= e!508395 (and e!508400 mapRes!29827))))

(declare-fun condMapEmpty!29827 () Bool)

(declare-fun mapDefault!29827 () ValueCell!8890)

