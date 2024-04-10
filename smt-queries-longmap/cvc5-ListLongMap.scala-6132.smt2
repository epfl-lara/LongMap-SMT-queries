; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78900 () Bool)

(assert start!78900)

(declare-fun b_free!17113 () Bool)

(declare-fun b_next!17113 () Bool)

(assert (=> start!78900 (= b_free!17113 (not b_next!17113))))

(declare-fun tp!59780 () Bool)

(declare-fun b_and!27963 () Bool)

(assert (=> start!78900 (= tp!59780 b_and!27963)))

(declare-fun b!922377 () Bool)

(declare-fun res!622012 () Bool)

(declare-fun e!517551 () Bool)

(assert (=> b!922377 (=> (not res!622012) (not e!517551))))

(declare-datatypes ((array!55218 0))(
  ( (array!55219 (arr!26554 (Array (_ BitVec 32) (_ BitVec 64))) (size!27013 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55218)

(declare-datatypes ((List!18633 0))(
  ( (Nil!18630) (Cons!18629 (h!19775 (_ BitVec 64)) (t!26476 List!18633)) )
))
(declare-fun arrayNoDuplicates!0 (array!55218 (_ BitVec 32) List!18633) Bool)

(assert (=> b!922377 (= res!622012 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18630))))

(declare-fun b!922378 () Bool)

(declare-fun e!517548 () Bool)

(declare-fun tp_is_empty!19621 () Bool)

(assert (=> b!922378 (= e!517548 tp_is_empty!19621)))

(declare-fun b!922379 () Bool)

(declare-fun e!517552 () Bool)

(declare-fun mapRes!31188 () Bool)

(assert (=> b!922379 (= e!517552 (and e!517548 mapRes!31188))))

(declare-fun condMapEmpty!31188 () Bool)

(declare-datatypes ((V!31127 0))(
  ( (V!31128 (val!9861 Int)) )
))
(declare-datatypes ((ValueCell!9329 0))(
  ( (ValueCellFull!9329 (v!12379 V!31127)) (EmptyCell!9329) )
))
(declare-datatypes ((array!55220 0))(
  ( (array!55221 (arr!26555 (Array (_ BitVec 32) ValueCell!9329)) (size!27014 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55220)

(declare-fun mapDefault!31188 () ValueCell!9329)

