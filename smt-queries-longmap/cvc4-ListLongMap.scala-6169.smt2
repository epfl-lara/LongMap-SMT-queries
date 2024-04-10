; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79126 () Bool)

(assert start!79126)

(declare-fun b_free!17339 () Bool)

(declare-fun b_next!17339 () Bool)

(assert (=> start!79126 (= b_free!17339 (not b_next!17339))))

(declare-fun tp!60458 () Bool)

(declare-fun b_and!28405 () Bool)

(assert (=> start!79126 (= tp!60458 b_and!28405)))

(declare-fun b!928728 () Bool)

(declare-fun e!521478 () Bool)

(declare-fun e!521477 () Bool)

(declare-fun mapRes!31527 () Bool)

(assert (=> b!928728 (= e!521478 (and e!521477 mapRes!31527))))

(declare-fun condMapEmpty!31527 () Bool)

(declare-datatypes ((V!31427 0))(
  ( (V!31428 (val!9974 Int)) )
))
(declare-datatypes ((ValueCell!9442 0))(
  ( (ValueCellFull!9442 (v!12492 V!31427)) (EmptyCell!9442) )
))
(declare-datatypes ((array!55652 0))(
  ( (array!55653 (arr!26771 (Array (_ BitVec 32) ValueCell!9442)) (size!27230 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55652)

(declare-fun mapDefault!31527 () ValueCell!9442)

