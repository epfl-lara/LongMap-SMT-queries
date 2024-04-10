; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77520 () Bool)

(assert start!77520)

(declare-fun b_free!16105 () Bool)

(declare-fun b_next!16105 () Bool)

(assert (=> start!77520 (= b_free!16105 (not b_next!16105))))

(declare-fun tp!56576 () Bool)

(declare-fun b_and!26471 () Bool)

(assert (=> start!77520 (= tp!56576 b_and!26471)))

(declare-fun b!903236 () Bool)

(declare-fun e!506039 () Bool)

(assert (=> b!903236 (= e!506039 false)))

(declare-datatypes ((V!29663 0))(
  ( (V!29664 (val!9312 Int)) )
))
(declare-datatypes ((ValueCell!8780 0))(
  ( (ValueCellFull!8780 (v!11817 V!29663)) (EmptyCell!8780) )
))
(declare-datatypes ((array!53104 0))(
  ( (array!53105 (arr!25511 (Array (_ BitVec 32) ValueCell!8780)) (size!25970 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53104)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29663)

(declare-datatypes ((array!53106 0))(
  ( (array!53107 (arr!25512 (Array (_ BitVec 32) (_ BitVec 64))) (size!25971 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53106)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29663)

(declare-fun lt!407979 () Bool)

(declare-datatypes ((tuple2!12092 0))(
  ( (tuple2!12093 (_1!6057 (_ BitVec 64)) (_2!6057 V!29663)) )
))
(declare-datatypes ((List!17913 0))(
  ( (Nil!17910) (Cons!17909 (h!19055 tuple2!12092) (t!25296 List!17913)) )
))
(declare-datatypes ((ListLongMap!10789 0))(
  ( (ListLongMap!10790 (toList!5410 List!17913)) )
))
(declare-fun contains!4458 (ListLongMap!10789 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2679 (array!53106 array!53104 (_ BitVec 32) (_ BitVec 32) V!29663 V!29663 (_ BitVec 32) Int) ListLongMap!10789)

(assert (=> b!903236 (= lt!407979 (contains!4458 (getCurrentListMap!2679 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903237 () Bool)

(declare-fun e!506037 () Bool)

(declare-fun tp_is_empty!18523 () Bool)

(assert (=> b!903237 (= e!506037 tp_is_empty!18523)))

(declare-fun b!903238 () Bool)

(declare-fun e!506040 () Bool)

(declare-fun e!506038 () Bool)

(declare-fun mapRes!29497 () Bool)

(assert (=> b!903238 (= e!506040 (and e!506038 mapRes!29497))))

(declare-fun condMapEmpty!29497 () Bool)

(declare-fun mapDefault!29497 () ValueCell!8780)

