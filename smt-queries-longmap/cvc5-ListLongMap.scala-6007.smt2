; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77894 () Bool)

(assert start!77894)

(declare-fun b_free!16453 () Bool)

(declare-fun b_next!16453 () Bool)

(assert (=> start!77894 (= b_free!16453 (not b_next!16453))))

(declare-fun tp!57624 () Bool)

(declare-fun b_and!27021 () Bool)

(assert (=> start!77894 (= tp!57624 b_and!27021)))

(declare-fun b!909517 () Bool)

(declare-fun res!613856 () Bool)

(declare-fun e!509841 () Bool)

(assert (=> b!909517 (=> (not res!613856) (not e!509841))))

(declare-datatypes ((V!30127 0))(
  ( (V!30128 (val!9486 Int)) )
))
(declare-datatypes ((ValueCell!8954 0))(
  ( (ValueCellFull!8954 (v!11993 V!30127)) (EmptyCell!8954) )
))
(declare-datatypes ((array!53766 0))(
  ( (array!53767 (arr!25841 (Array (_ BitVec 32) ValueCell!8954)) (size!26300 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53766)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53768 0))(
  ( (array!53769 (arr!25842 (Array (_ BitVec 32) (_ BitVec 64))) (size!26301 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53768)

(assert (=> b!909517 (= res!613856 (and (= (size!26300 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26301 _keys!1386) (size!26300 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30022 () Bool)

(declare-fun mapRes!30022 () Bool)

(assert (=> mapIsEmpty!30022 mapRes!30022))

(declare-fun b!909518 () Bool)

(declare-fun res!613857 () Bool)

(assert (=> b!909518 (=> (not res!613857) (not e!509841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53768 (_ BitVec 32)) Bool)

(assert (=> b!909518 (= res!613857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909519 () Bool)

(declare-fun e!509837 () Bool)

(declare-fun tp_is_empty!18871 () Bool)

(assert (=> b!909519 (= e!509837 tp_is_empty!18871)))

(declare-fun b!909520 () Bool)

(declare-fun e!509839 () Bool)

(declare-fun e!509838 () Bool)

(assert (=> b!909520 (= e!509839 (and e!509838 mapRes!30022))))

(declare-fun condMapEmpty!30022 () Bool)

(declare-fun mapDefault!30022 () ValueCell!8954)

