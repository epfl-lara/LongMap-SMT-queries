; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79188 () Bool)

(assert start!79188)

(declare-fun b_free!17401 () Bool)

(declare-fun b_next!17401 () Bool)

(assert (=> start!79188 (= b_free!17401 (not b_next!17401))))

(declare-fun tp!60644 () Bool)

(declare-fun b_and!28467 () Bool)

(assert (=> start!79188 (= tp!60644 b_and!28467)))

(declare-fun b!929632 () Bool)

(declare-fun e!522035 () Bool)

(declare-fun e!522036 () Bool)

(declare-fun mapRes!31620 () Bool)

(assert (=> b!929632 (= e!522035 (and e!522036 mapRes!31620))))

(declare-fun condMapEmpty!31620 () Bool)

(declare-datatypes ((V!31511 0))(
  ( (V!31512 (val!10005 Int)) )
))
(declare-datatypes ((ValueCell!9473 0))(
  ( (ValueCellFull!9473 (v!12523 V!31511)) (EmptyCell!9473) )
))
(declare-datatypes ((array!55772 0))(
  ( (array!55773 (arr!26831 (Array (_ BitVec 32) ValueCell!9473)) (size!27290 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55772)

(declare-fun mapDefault!31620 () ValueCell!9473)

