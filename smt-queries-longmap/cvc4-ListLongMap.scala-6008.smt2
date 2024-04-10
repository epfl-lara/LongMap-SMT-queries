; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77904 () Bool)

(assert start!77904)

(declare-fun b_free!16463 () Bool)

(declare-fun b_next!16463 () Bool)

(assert (=> start!77904 (= b_free!16463 (not b_next!16463))))

(declare-fun tp!57654 () Bool)

(declare-fun b_and!27031 () Bool)

(assert (=> start!77904 (= tp!57654 b_and!27031)))

(declare-fun b!909638 () Bool)

(declare-fun e!509916 () Bool)

(declare-fun tp_is_empty!18881 () Bool)

(assert (=> b!909638 (= e!509916 tp_is_empty!18881)))

(declare-fun b!909639 () Bool)

(declare-fun res!613931 () Bool)

(declare-fun e!509913 () Bool)

(assert (=> b!909639 (=> (not res!613931) (not e!509913))))

(declare-datatypes ((array!53784 0))(
  ( (array!53785 (arr!25850 (Array (_ BitVec 32) (_ BitVec 64))) (size!26309 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53784)

(declare-datatypes ((List!18160 0))(
  ( (Nil!18157) (Cons!18156 (h!19302 (_ BitVec 64)) (t!25741 List!18160)) )
))
(declare-fun arrayNoDuplicates!0 (array!53784 (_ BitVec 32) List!18160) Bool)

(assert (=> b!909639 (= res!613931 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18157))))

(declare-fun b!909640 () Bool)

(declare-fun res!613934 () Bool)

(assert (=> b!909640 (=> (not res!613934) (not e!509913))))

(declare-datatypes ((V!30139 0))(
  ( (V!30140 (val!9491 Int)) )
))
(declare-datatypes ((ValueCell!8959 0))(
  ( (ValueCellFull!8959 (v!11998 V!30139)) (EmptyCell!8959) )
))
(declare-datatypes ((array!53786 0))(
  ( (array!53787 (arr!25851 (Array (_ BitVec 32) ValueCell!8959)) (size!26310 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53786)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30139)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30139)

(declare-datatypes ((tuple2!12368 0))(
  ( (tuple2!12369 (_1!6195 (_ BitVec 64)) (_2!6195 V!30139)) )
))
(declare-datatypes ((List!18161 0))(
  ( (Nil!18158) (Cons!18157 (h!19303 tuple2!12368) (t!25742 List!18161)) )
))
(declare-datatypes ((ListLongMap!11065 0))(
  ( (ListLongMap!11066 (toList!5548 List!18161)) )
))
(declare-fun contains!4590 (ListLongMap!11065 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2810 (array!53784 array!53786 (_ BitVec 32) (_ BitVec 32) V!30139 V!30139 (_ BitVec 32) Int) ListLongMap!11065)

(assert (=> b!909640 (= res!613934 (contains!4590 (getCurrentListMap!2810 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!909641 () Bool)

(declare-fun res!613935 () Bool)

(assert (=> b!909641 (=> (not res!613935) (not e!509913))))

(assert (=> b!909641 (= res!613935 (and (= (size!26310 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26309 _keys!1386) (size!26310 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909642 () Bool)

(declare-fun e!509914 () Bool)

(declare-fun e!509912 () Bool)

(declare-fun mapRes!30037 () Bool)

(assert (=> b!909642 (= e!509914 (and e!509912 mapRes!30037))))

(declare-fun condMapEmpty!30037 () Bool)

(declare-fun mapDefault!30037 () ValueCell!8959)

