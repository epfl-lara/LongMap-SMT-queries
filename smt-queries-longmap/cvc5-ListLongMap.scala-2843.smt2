; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41044 () Bool)

(assert start!41044)

(declare-fun b_free!10957 () Bool)

(declare-fun b_next!10957 () Bool)

(assert (=> start!41044 (= b_free!10957 (not b_next!10957))))

(declare-fun tp!38701 () Bool)

(declare-fun b_and!19121 () Bool)

(assert (=> start!41044 (= tp!38701 b_and!19121)))

(declare-fun b!457402 () Bool)

(declare-fun e!267157 () Bool)

(declare-fun e!267156 () Bool)

(declare-fun mapRes!20086 () Bool)

(assert (=> b!457402 (= e!267157 (and e!267156 mapRes!20086))))

(declare-fun condMapEmpty!20086 () Bool)

(declare-datatypes ((V!17499 0))(
  ( (V!17500 (val!6192 Int)) )
))
(declare-datatypes ((ValueCell!5804 0))(
  ( (ValueCellFull!5804 (v!8462 V!17499)) (EmptyCell!5804) )
))
(declare-datatypes ((array!28393 0))(
  ( (array!28394 (arr!13639 (Array (_ BitVec 32) ValueCell!5804)) (size!13991 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28393)

(declare-fun mapDefault!20086 () ValueCell!5804)

