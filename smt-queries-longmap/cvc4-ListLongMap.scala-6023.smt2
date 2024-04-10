; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78026 () Bool)

(assert start!78026)

(declare-fun b_free!16553 () Bool)

(declare-fun b_next!16553 () Bool)

(assert (=> start!78026 (= b_free!16553 (not b_next!16553))))

(declare-fun tp!57930 () Bool)

(declare-fun b_and!27125 () Bool)

(assert (=> start!78026 (= tp!57930 b_and!27125)))

(declare-fun b!910821 () Bool)

(declare-fun e!510735 () Bool)

(assert (=> b!910821 (= e!510735 false)))

(declare-datatypes ((V!30259 0))(
  ( (V!30260 (val!9536 Int)) )
))
(declare-datatypes ((ValueCell!9004 0))(
  ( (ValueCellFull!9004 (v!12045 V!30259)) (EmptyCell!9004) )
))
(declare-datatypes ((array!53954 0))(
  ( (array!53955 (arr!25933 (Array (_ BitVec 32) ValueCell!9004)) (size!26392 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53954)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lt!410312 () Bool)

(declare-fun zeroValue!1094 () V!30259)

(declare-datatypes ((array!53956 0))(
  ( (array!53957 (arr!25934 (Array (_ BitVec 32) (_ BitVec 64))) (size!26393 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53956)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30259)

(declare-datatypes ((tuple2!12426 0))(
  ( (tuple2!12427 (_1!6224 (_ BitVec 64)) (_2!6224 V!30259)) )
))
(declare-datatypes ((List!18217 0))(
  ( (Nil!18214) (Cons!18213 (h!19359 tuple2!12426) (t!25802 List!18217)) )
))
(declare-datatypes ((ListLongMap!11123 0))(
  ( (ListLongMap!11124 (toList!5577 List!18217)) )
))
(declare-fun contains!4621 (ListLongMap!11123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2839 (array!53956 array!53954 (_ BitVec 32) (_ BitVec 32) V!30259 V!30259 (_ BitVec 32) Int) ListLongMap!11123)

(assert (=> b!910821 (= lt!410312 (contains!4621 (getCurrentListMap!2839 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapIsEmpty!30178 () Bool)

(declare-fun mapRes!30178 () Bool)

(assert (=> mapIsEmpty!30178 mapRes!30178))

(declare-fun b!910823 () Bool)

(declare-fun res!614581 () Bool)

(assert (=> b!910823 (=> (not res!614581) (not e!510735))))

(declare-datatypes ((List!18218 0))(
  ( (Nil!18215) (Cons!18214 (h!19360 (_ BitVec 64)) (t!25803 List!18218)) )
))
(declare-fun arrayNoDuplicates!0 (array!53956 (_ BitVec 32) List!18218) Bool)

(assert (=> b!910823 (= res!614581 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18215))))

(declare-fun b!910824 () Bool)

(declare-fun e!510734 () Bool)

(declare-fun tp_is_empty!18971 () Bool)

(assert (=> b!910824 (= e!510734 tp_is_empty!18971)))

(declare-fun b!910825 () Bool)

(declare-fun res!614583 () Bool)

(assert (=> b!910825 (=> (not res!614583) (not e!510735))))

(assert (=> b!910825 (= res!614583 (and (= (size!26392 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26393 _keys!1386) (size!26392 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910826 () Bool)

(declare-fun res!614580 () Bool)

(assert (=> b!910826 (=> (not res!614580) (not e!510735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53956 (_ BitVec 32)) Bool)

(assert (=> b!910826 (= res!614580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910827 () Bool)

(declare-fun e!510733 () Bool)

(assert (=> b!910827 (= e!510733 (and e!510734 mapRes!30178))))

(declare-fun condMapEmpty!30178 () Bool)

(declare-fun mapDefault!30178 () ValueCell!9004)

