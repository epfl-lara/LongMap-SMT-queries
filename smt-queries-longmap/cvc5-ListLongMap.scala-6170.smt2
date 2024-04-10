; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79128 () Bool)

(assert start!79128)

(declare-fun b_free!17341 () Bool)

(declare-fun b_next!17341 () Bool)

(assert (=> start!79128 (= b_free!17341 (not b_next!17341))))

(declare-fun tp!60464 () Bool)

(declare-fun b_and!28407 () Bool)

(assert (=> start!79128 (= tp!60464 b_and!28407)))

(declare-fun b!928755 () Bool)

(declare-fun e!521493 () Bool)

(declare-fun e!521492 () Bool)

(declare-fun mapRes!31530 () Bool)

(assert (=> b!928755 (= e!521493 (and e!521492 mapRes!31530))))

(declare-fun condMapEmpty!31530 () Bool)

(declare-datatypes ((V!31431 0))(
  ( (V!31432 (val!9975 Int)) )
))
(declare-datatypes ((ValueCell!9443 0))(
  ( (ValueCellFull!9443 (v!12493 V!31431)) (EmptyCell!9443) )
))
(declare-datatypes ((array!55654 0))(
  ( (array!55655 (arr!26772 (Array (_ BitVec 32) ValueCell!9443)) (size!27231 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55654)

(declare-fun mapDefault!31530 () ValueCell!9443)

