; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78690 () Bool)

(assert start!78690)

(declare-fun b_free!16903 () Bool)

(declare-fun b_next!16903 () Bool)

(assert (=> start!78690 (= b_free!16903 (not b_next!16903))))

(declare-fun tp!59150 () Bool)

(declare-fun b_and!27543 () Bool)

(assert (=> start!78690 (= tp!59150 b_and!27543)))

(declare-fun b!917591 () Bool)

(declare-fun e!515140 () Bool)

(declare-fun tp_is_empty!19411 () Bool)

(assert (=> b!917591 (= e!515140 tp_is_empty!19411)))

(declare-fun b!917592 () Bool)

(declare-fun res!618619 () Bool)

(declare-fun e!515146 () Bool)

(assert (=> b!917592 (=> (not res!618619) (not e!515146))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54808 0))(
  ( (array!54809 (arr!26349 (Array (_ BitVec 32) (_ BitVec 64))) (size!26808 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54808)

(assert (=> b!917592 (= res!618619 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26808 _keys!1487))))))

(declare-fun res!618612 () Bool)

(assert (=> start!78690 (=> (not res!618612) (not e!515146))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78690 (= res!618612 (validMask!0 mask!1881))))

(assert (=> start!78690 e!515146))

(assert (=> start!78690 true))

(assert (=> start!78690 tp_is_empty!19411))

(declare-datatypes ((V!30847 0))(
  ( (V!30848 (val!9756 Int)) )
))
(declare-datatypes ((ValueCell!9224 0))(
  ( (ValueCellFull!9224 (v!12274 V!30847)) (EmptyCell!9224) )
))
(declare-datatypes ((array!54810 0))(
  ( (array!54811 (arr!26350 (Array (_ BitVec 32) ValueCell!9224)) (size!26809 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54810)

(declare-fun e!515145 () Bool)

(declare-fun array_inv!20548 (array!54810) Bool)

(assert (=> start!78690 (and (array_inv!20548 _values!1231) e!515145)))

(assert (=> start!78690 tp!59150))

(declare-fun array_inv!20549 (array!54808) Bool)

(assert (=> start!78690 (array_inv!20549 _keys!1487)))

(declare-fun b!917593 () Bool)

(declare-fun mapRes!30873 () Bool)

(assert (=> b!917593 (= e!515145 (and e!515140 mapRes!30873))))

(declare-fun condMapEmpty!30873 () Bool)

(declare-fun mapDefault!30873 () ValueCell!9224)

