; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40060 () Bool)

(assert start!40060)

(declare-fun b_free!10327 () Bool)

(declare-fun b_next!10327 () Bool)

(assert (=> start!40060 (= b_free!10327 (not b_next!10327))))

(declare-fun tp!36510 () Bool)

(declare-fun b_and!18295 () Bool)

(assert (=> start!40060 (= tp!36510 b_and!18295)))

(declare-fun b!437204 () Bool)

(declare-fun e!258078 () Bool)

(declare-fun tp_is_empty!11479 () Bool)

(assert (=> b!437204 (= e!258078 tp_is_empty!11479)))

(declare-fun mapIsEmpty!18840 () Bool)

(declare-fun mapRes!18840 () Bool)

(assert (=> mapIsEmpty!18840 mapRes!18840))

(declare-fun b!437205 () Bool)

(declare-fun e!258081 () Bool)

(assert (=> b!437205 (= e!258081 (and e!258078 mapRes!18840))))

(declare-fun condMapEmpty!18840 () Bool)

(declare-datatypes ((V!16411 0))(
  ( (V!16412 (val!5784 Int)) )
))
(declare-datatypes ((ValueCell!5396 0))(
  ( (ValueCellFull!5396 (v!8031 V!16411)) (EmptyCell!5396) )
))
(declare-datatypes ((array!26779 0))(
  ( (array!26780 (arr!12839 (Array (_ BitVec 32) ValueCell!5396)) (size!13191 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26779)

(declare-fun mapDefault!18840 () ValueCell!5396)

