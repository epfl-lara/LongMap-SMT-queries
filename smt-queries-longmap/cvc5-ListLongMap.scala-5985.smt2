; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77736 () Bool)

(assert start!77736)

(declare-fun b_free!16321 () Bool)

(declare-fun b_next!16321 () Bool)

(assert (=> start!77736 (= b_free!16321 (not b_next!16321))))

(declare-fun tp!57224 () Bool)

(declare-fun b_and!26795 () Bool)

(assert (=> start!77736 (= tp!57224 b_and!26795)))

(declare-fun b!907091 () Bool)

(declare-fun e!508348 () Bool)

(declare-fun e!508346 () Bool)

(assert (=> b!907091 (= e!508348 e!508346)))

(declare-fun res!612204 () Bool)

(assert (=> b!907091 (=> res!612204 e!508346)))

(declare-datatypes ((V!29951 0))(
  ( (V!29952 (val!9420 Int)) )
))
(declare-datatypes ((tuple2!12266 0))(
  ( (tuple2!12267 (_1!6144 (_ BitVec 64)) (_2!6144 V!29951)) )
))
(declare-datatypes ((List!18068 0))(
  ( (Nil!18065) (Cons!18064 (h!19210 tuple2!12266) (t!25561 List!18068)) )
))
(declare-datatypes ((ListLongMap!10963 0))(
  ( (ListLongMap!10964 (toList!5497 List!18068)) )
))
(declare-fun lt!409161 () ListLongMap!10963)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4542 (ListLongMap!10963 (_ BitVec 64)) Bool)

(assert (=> b!907091 (= res!612204 (not (contains!4542 lt!409161 k!1033)))))

(declare-datatypes ((ValueCell!8888 0))(
  ( (ValueCellFull!8888 (v!11925 V!29951)) (EmptyCell!8888) )
))
(declare-datatypes ((array!53514 0))(
  ( (array!53515 (arr!25716 (Array (_ BitVec 32) ValueCell!8888)) (size!26175 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53514)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29951)

(declare-datatypes ((array!53516 0))(
  ( (array!53517 (arr!25717 (Array (_ BitVec 32) (_ BitVec 64))) (size!26176 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53516)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29951)

(declare-fun getCurrentListMap!2763 (array!53516 array!53514 (_ BitVec 32) (_ BitVec 32) V!29951 V!29951 (_ BitVec 32) Int) ListLongMap!10963)

(assert (=> b!907091 (= lt!409161 (getCurrentListMap!2763 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907092 () Bool)

(declare-fun res!612201 () Bool)

(declare-fun e!508353 () Bool)

(assert (=> b!907092 (=> (not res!612201) (not e!508353))))

(assert (=> b!907092 (= res!612201 (and (= (select (arr!25717 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907093 () Bool)

(declare-fun res!612207 () Bool)

(assert (=> b!907093 (=> (not res!612207) (not e!508353))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907093 (= res!612207 (inRange!0 i!717 mask!1756))))

(declare-fun b!907094 () Bool)

(declare-fun res!612209 () Bool)

(declare-fun e!508352 () Bool)

(assert (=> b!907094 (=> (not res!612209) (not e!508352))))

(assert (=> b!907094 (= res!612209 (and (= (size!26175 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26176 _keys!1386) (size!26175 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907095 () Bool)

(declare-fun e!508350 () Bool)

(declare-fun e!508347 () Bool)

(declare-fun mapRes!29821 () Bool)

(assert (=> b!907095 (= e!508350 (and e!508347 mapRes!29821))))

(declare-fun condMapEmpty!29821 () Bool)

(declare-fun mapDefault!29821 () ValueCell!8888)

