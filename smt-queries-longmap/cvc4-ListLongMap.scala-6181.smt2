; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79198 () Bool)

(assert start!79198)

(declare-fun b_free!17411 () Bool)

(declare-fun b_next!17411 () Bool)

(assert (=> start!79198 (= b_free!17411 (not b_next!17411))))

(declare-fun tp!60673 () Bool)

(declare-fun b_and!28477 () Bool)

(assert (=> start!79198 (= tp!60673 b_and!28477)))

(declare-fun b!929797 () Bool)

(declare-fun e!522127 () Bool)

(declare-fun e!522124 () Bool)

(declare-fun mapRes!31635 () Bool)

(assert (=> b!929797 (= e!522127 (and e!522124 mapRes!31635))))

(declare-fun condMapEmpty!31635 () Bool)

(declare-datatypes ((V!31523 0))(
  ( (V!31524 (val!10010 Int)) )
))
(declare-datatypes ((ValueCell!9478 0))(
  ( (ValueCellFull!9478 (v!12528 V!31523)) (EmptyCell!9478) )
))
(declare-datatypes ((array!55790 0))(
  ( (array!55791 (arr!26840 (Array (_ BitVec 32) ValueCell!9478)) (size!27299 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55790)

(declare-fun mapDefault!31635 () ValueCell!9478)

