; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1038 () Bool)

(assert start!1038)

(declare-fun b_free!367 () Bool)

(declare-fun b_next!367 () Bool)

(assert (=> start!1038 (= b_free!367 (not b_next!367))))

(declare-fun tp!1339 () Bool)

(declare-fun b_and!519 () Bool)

(assert (=> start!1038 (= tp!1339 b_and!519)))

(declare-fun b!9123 () Bool)

(declare-fun e!5205 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!9123 (= e!5205 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!9124 () Bool)

(declare-fun e!5210 () Bool)

(declare-fun e!5206 () Bool)

(declare-fun mapRes!647 () Bool)

(assert (=> b!9124 (= e!5210 (and e!5206 mapRes!647))))

(declare-fun condMapEmpty!647 () Bool)

(declare-datatypes ((V!771 0))(
  ( (V!772 (val!228 Int)) )
))
(declare-datatypes ((ValueCell!206 0))(
  ( (ValueCellFull!206 (v!1322 V!771)) (EmptyCell!206) )
))
(declare-datatypes ((array!823 0))(
  ( (array!824 (arr!397 (Array (_ BitVec 32) ValueCell!206)) (size!459 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!823)

(declare-fun mapDefault!647 () ValueCell!206)

