; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78760 () Bool)

(assert start!78760)

(declare-fun b_free!16973 () Bool)

(declare-fun b_next!16973 () Bool)

(assert (=> start!78760 (= b_free!16973 (not b_next!16973))))

(declare-fun tp!59359 () Bool)

(declare-fun b_and!27683 () Bool)

(assert (=> start!78760 (= tp!59359 b_and!27683)))

(declare-fun b!919026 () Bool)

(declare-fun e!515878 () Bool)

(declare-fun tp_is_empty!19481 () Bool)

(assert (=> b!919026 (= e!515878 tp_is_empty!19481)))

(declare-fun res!619667 () Bool)

(declare-fun e!515880 () Bool)

(assert (=> start!78760 (=> (not res!619667) (not e!515880))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78760 (= res!619667 (validMask!0 mask!1881))))

(assert (=> start!78760 e!515880))

(assert (=> start!78760 true))

(assert (=> start!78760 tp_is_empty!19481))

(declare-datatypes ((V!30939 0))(
  ( (V!30940 (val!9791 Int)) )
))
(declare-datatypes ((ValueCell!9259 0))(
  ( (ValueCellFull!9259 (v!12309 V!30939)) (EmptyCell!9259) )
))
(declare-datatypes ((array!54946 0))(
  ( (array!54947 (arr!26418 (Array (_ BitVec 32) ValueCell!9259)) (size!26877 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54946)

(declare-fun e!515881 () Bool)

(declare-fun array_inv!20590 (array!54946) Bool)

(assert (=> start!78760 (and (array_inv!20590 _values!1231) e!515881)))

(assert (=> start!78760 tp!59359))

(declare-datatypes ((array!54948 0))(
  ( (array!54949 (arr!26419 (Array (_ BitVec 32) (_ BitVec 64))) (size!26878 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54948)

(declare-fun array_inv!20591 (array!54948) Bool)

(assert (=> start!78760 (array_inv!20591 _keys!1487)))

(declare-fun b!919027 () Bool)

(declare-fun res!619665 () Bool)

(assert (=> b!919027 (=> (not res!619665) (not e!515880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54948 (_ BitVec 32)) Bool)

(assert (=> b!919027 (= res!619665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919028 () Bool)

(declare-fun mapRes!30978 () Bool)

(assert (=> b!919028 (= e!515881 (and e!515878 mapRes!30978))))

(declare-fun condMapEmpty!30978 () Bool)

(declare-fun mapDefault!30978 () ValueCell!9259)

