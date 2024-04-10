; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78570 () Bool)

(assert start!78570)

(declare-fun b_free!16783 () Bool)

(declare-fun b_next!16783 () Bool)

(assert (=> start!78570 (= b_free!16783 (not b_next!16783))))

(declare-fun tp!58789 () Bool)

(declare-fun b_and!27405 () Bool)

(assert (=> start!78570 (= tp!58789 b_and!27405)))

(declare-fun res!617467 () Bool)

(declare-fun e!514094 () Bool)

(assert (=> start!78570 (=> (not res!617467) (not e!514094))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78570 (= res!617467 (validMask!0 mask!1881))))

(assert (=> start!78570 e!514094))

(assert (=> start!78570 true))

(declare-datatypes ((V!30687 0))(
  ( (V!30688 (val!9696 Int)) )
))
(declare-datatypes ((ValueCell!9164 0))(
  ( (ValueCellFull!9164 (v!12214 V!30687)) (EmptyCell!9164) )
))
(declare-datatypes ((array!54576 0))(
  ( (array!54577 (arr!26233 (Array (_ BitVec 32) ValueCell!9164)) (size!26692 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54576)

(declare-fun e!514093 () Bool)

(declare-fun array_inv!20468 (array!54576) Bool)

(assert (=> start!78570 (and (array_inv!20468 _values!1231) e!514093)))

(assert (=> start!78570 tp!58789))

(declare-datatypes ((array!54578 0))(
  ( (array!54579 (arr!26234 (Array (_ BitVec 32) (_ BitVec 64))) (size!26693 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54578)

(declare-fun array_inv!20469 (array!54578) Bool)

(assert (=> start!78570 (array_inv!20469 _keys!1487)))

(declare-fun tp_is_empty!19291 () Bool)

(assert (=> start!78570 tp_is_empty!19291))

(declare-fun b!915889 () Bool)

(declare-fun e!514096 () Bool)

(assert (=> b!915889 (= e!514096 tp_is_empty!19291)))

(declare-fun b!915890 () Bool)

(declare-fun mapRes!30693 () Bool)

(assert (=> b!915890 (= e!514093 (and e!514096 mapRes!30693))))

(declare-fun condMapEmpty!30693 () Bool)

(declare-fun mapDefault!30693 () ValueCell!9164)

