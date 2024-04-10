; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1020 () Bool)

(assert start!1020)

(declare-fun b_free!349 () Bool)

(declare-fun b_next!349 () Bool)

(assert (=> start!1020 (= b_free!349 (not b_next!349))))

(declare-fun tp!1286 () Bool)

(declare-fun b_and!501 () Bool)

(assert (=> start!1020 (= tp!1286 b_and!501)))

(declare-fun b!8799 () Bool)

(declare-fun e!5017 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8799 (= e!5017 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8800 () Bool)

(declare-fun e!5016 () Bool)

(declare-fun tp_is_empty!427 () Bool)

(assert (=> b!8800 (= e!5016 tp_is_empty!427)))

(declare-fun b!8801 () Bool)

(declare-datatypes ((array!787 0))(
  ( (array!788 (arr!379 (Array (_ BitVec 32) (_ BitVec 64))) (size!441 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!787)

(declare-fun arrayContainsKey!0 (array!787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8801 (= e!5017 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!8802 () Bool)

(declare-fun e!5018 () Bool)

(declare-fun e!5020 () Bool)

(declare-fun mapRes!620 () Bool)

(assert (=> b!8802 (= e!5018 (and e!5020 mapRes!620))))

(declare-fun condMapEmpty!620 () Bool)

(declare-datatypes ((V!747 0))(
  ( (V!748 (val!219 Int)) )
))
(declare-datatypes ((ValueCell!197 0))(
  ( (ValueCellFull!197 (v!1313 V!747)) (EmptyCell!197) )
))
(declare-datatypes ((array!789 0))(
  ( (array!790 (arr!380 (Array (_ BitVec 32) ValueCell!197)) (size!442 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!789)

(declare-fun mapDefault!620 () ValueCell!197)

