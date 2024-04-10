; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78598 () Bool)

(assert start!78598)

(declare-fun b_free!16811 () Bool)

(declare-fun b_next!16811 () Bool)

(assert (=> start!78598 (= b_free!16811 (not b_next!16811))))

(declare-fun tp!58874 () Bool)

(declare-fun b_and!27433 () Bool)

(assert (=> start!78598 (= tp!58874 b_and!27433)))

(declare-fun res!617678 () Bool)

(declare-fun e!514306 () Bool)

(assert (=> start!78598 (=> (not res!617678) (not e!514306))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78598 (= res!617678 (validMask!0 mask!1881))))

(assert (=> start!78598 e!514306))

(assert (=> start!78598 true))

(declare-datatypes ((V!30723 0))(
  ( (V!30724 (val!9710 Int)) )
))
(declare-datatypes ((ValueCell!9178 0))(
  ( (ValueCellFull!9178 (v!12228 V!30723)) (EmptyCell!9178) )
))
(declare-datatypes ((array!54630 0))(
  ( (array!54631 (arr!26260 (Array (_ BitVec 32) ValueCell!9178)) (size!26719 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54630)

(declare-fun e!514304 () Bool)

(declare-fun array_inv!20484 (array!54630) Bool)

(assert (=> start!78598 (and (array_inv!20484 _values!1231) e!514304)))

(assert (=> start!78598 tp!58874))

(declare-datatypes ((array!54632 0))(
  ( (array!54633 (arr!26261 (Array (_ BitVec 32) (_ BitVec 64))) (size!26720 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54632)

(declare-fun array_inv!20485 (array!54632) Bool)

(assert (=> start!78598 (array_inv!20485 _keys!1487)))

(declare-fun tp_is_empty!19319 () Bool)

(assert (=> start!78598 tp_is_empty!19319))

(declare-fun b!916225 () Bool)

(declare-fun e!514305 () Bool)

(assert (=> b!916225 (= e!514305 tp_is_empty!19319)))

(declare-fun b!916226 () Bool)

(declare-fun mapRes!30735 () Bool)

(assert (=> b!916226 (= e!514304 (and e!514305 mapRes!30735))))

(declare-fun condMapEmpty!30735 () Bool)

(declare-fun mapDefault!30735 () ValueCell!9178)

