; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20220 () Bool)

(assert start!20220)

(declare-fun b_free!4879 () Bool)

(declare-fun b_next!4879 () Bool)

(assert (=> start!20220 (= b_free!4879 (not b_next!4879))))

(declare-fun tp!17669 () Bool)

(declare-fun b_and!11625 () Bool)

(assert (=> start!20220 (= tp!17669 b_and!11625)))

(declare-fun mapIsEmpty!8171 () Bool)

(declare-fun mapRes!8171 () Bool)

(assert (=> mapIsEmpty!8171 mapRes!8171))

(declare-fun b!198734 () Bool)

(declare-fun e!130572 () Bool)

(declare-fun e!130570 () Bool)

(assert (=> b!198734 (= e!130572 (and e!130570 mapRes!8171))))

(declare-fun condMapEmpty!8171 () Bool)

(declare-datatypes ((V!5961 0))(
  ( (V!5962 (val!2412 Int)) )
))
(declare-datatypes ((ValueCell!2024 0))(
  ( (ValueCellFull!2024 (v!4382 V!5961)) (EmptyCell!2024) )
))
(declare-datatypes ((array!8713 0))(
  ( (array!8714 (arr!4107 (Array (_ BitVec 32) ValueCell!2024)) (size!4432 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8713)

(declare-fun mapDefault!8171 () ValueCell!2024)

