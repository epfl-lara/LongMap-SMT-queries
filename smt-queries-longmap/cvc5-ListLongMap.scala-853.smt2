; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20214 () Bool)

(assert start!20214)

(declare-fun b_free!4873 () Bool)

(declare-fun b_next!4873 () Bool)

(assert (=> start!20214 (= b_free!4873 (not b_next!4873))))

(declare-fun tp!17650 () Bool)

(declare-fun b_and!11619 () Bool)

(assert (=> start!20214 (= tp!17650 b_and!11619)))

(declare-fun b!198644 () Bool)

(declare-fun e!130526 () Bool)

(declare-fun e!130529 () Bool)

(declare-fun mapRes!8162 () Bool)

(assert (=> b!198644 (= e!130526 (and e!130529 mapRes!8162))))

(declare-fun condMapEmpty!8162 () Bool)

(declare-datatypes ((V!5953 0))(
  ( (V!5954 (val!2409 Int)) )
))
(declare-datatypes ((ValueCell!2021 0))(
  ( (ValueCellFull!2021 (v!4379 V!5953)) (EmptyCell!2021) )
))
(declare-datatypes ((array!8705 0))(
  ( (array!8706 (arr!4103 (Array (_ BitVec 32) ValueCell!2021)) (size!4428 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8705)

(declare-fun mapDefault!8162 () ValueCell!2021)

