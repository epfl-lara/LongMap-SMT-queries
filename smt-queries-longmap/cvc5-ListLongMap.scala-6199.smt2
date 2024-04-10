; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79302 () Bool)

(assert start!79302)

(declare-fun b_free!17515 () Bool)

(declare-fun b_next!17515 () Bool)

(assert (=> start!79302 (= b_free!17515 (not b_next!17515))))

(declare-fun tp!60985 () Bool)

(declare-fun b_and!28581 () Bool)

(assert (=> start!79302 (= tp!60985 b_and!28581)))

(declare-fun res!627253 () Bool)

(declare-fun e!523062 () Bool)

(assert (=> start!79302 (=> (not res!627253) (not e!523062))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79302 (= res!627253 (validMask!0 mask!1881))))

(assert (=> start!79302 e!523062))

(assert (=> start!79302 true))

(declare-fun tp_is_empty!20023 () Bool)

(assert (=> start!79302 tp_is_empty!20023))

(declare-datatypes ((V!31663 0))(
  ( (V!31664 (val!10062 Int)) )
))
(declare-datatypes ((ValueCell!9530 0))(
  ( (ValueCellFull!9530 (v!12580 V!31663)) (EmptyCell!9530) )
))
(declare-datatypes ((array!55986 0))(
  ( (array!55987 (arr!26938 (Array (_ BitVec 32) ValueCell!9530)) (size!27397 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55986)

(declare-fun e!523066 () Bool)

(declare-fun array_inv!20968 (array!55986) Bool)

(assert (=> start!79302 (and (array_inv!20968 _values!1231) e!523066)))

(assert (=> start!79302 tp!60985))

(declare-datatypes ((array!55988 0))(
  ( (array!55989 (arr!26939 (Array (_ BitVec 32) (_ BitVec 64))) (size!27398 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55988)

(declare-fun array_inv!20969 (array!55988) Bool)

(assert (=> start!79302 (array_inv!20969 _keys!1487)))

(declare-fun b!931373 () Bool)

(declare-fun e!523065 () Bool)

(declare-fun mapRes!31791 () Bool)

(assert (=> b!931373 (= e!523066 (and e!523065 mapRes!31791))))

(declare-fun condMapEmpty!31791 () Bool)

(declare-fun mapDefault!31791 () ValueCell!9530)

