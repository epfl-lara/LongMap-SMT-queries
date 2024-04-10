; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101226 () Bool)

(assert start!101226)

(declare-fun b_free!26149 () Bool)

(declare-fun b_next!26149 () Bool)

(assert (=> start!101226 (= b_free!26149 (not b_next!26149))))

(declare-fun tp!91468 () Bool)

(declare-fun b_and!43415 () Bool)

(assert (=> start!101226 (= tp!91468 b_and!43415)))

(declare-fun b!1215552 () Bool)

(declare-fun e!690202 () Bool)

(declare-fun e!690200 () Bool)

(declare-fun mapRes!48154 () Bool)

(assert (=> b!1215552 (= e!690202 (and e!690200 mapRes!48154))))

(declare-fun condMapEmpty!48154 () Bool)

(declare-datatypes ((V!46265 0))(
  ( (V!46266 (val!15483 Int)) )
))
(declare-datatypes ((ValueCell!14717 0))(
  ( (ValueCellFull!14717 (v!18136 V!46265)) (EmptyCell!14717) )
))
(declare-datatypes ((array!78481 0))(
  ( (array!78482 (arr!37875 (Array (_ BitVec 32) ValueCell!14717)) (size!38411 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78481)

(declare-fun mapDefault!48154 () ValueCell!14717)

