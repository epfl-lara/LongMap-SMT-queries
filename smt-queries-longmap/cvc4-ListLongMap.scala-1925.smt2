; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34200 () Bool)

(assert start!34200)

(declare-fun b_free!7223 () Bool)

(declare-fun b_next!7223 () Bool)

(assert (=> start!34200 (= b_free!7223 (not b_next!7223))))

(declare-fun tp!25203 () Bool)

(declare-fun b_and!14423 () Bool)

(assert (=> start!34200 (= tp!25203 b_and!14423)))

(declare-fun b!341023 () Bool)

(declare-fun e!209168 () Bool)

(declare-fun e!209167 () Bool)

(declare-fun mapRes!12189 () Bool)

(assert (=> b!341023 (= e!209168 (and e!209167 mapRes!12189))))

(declare-fun condMapEmpty!12189 () Bool)

(declare-datatypes ((V!10543 0))(
  ( (V!10544 (val!3632 Int)) )
))
(declare-datatypes ((ValueCell!3244 0))(
  ( (ValueCellFull!3244 (v!5804 V!10543)) (EmptyCell!3244) )
))
(declare-datatypes ((array!17949 0))(
  ( (array!17950 (arr!8495 (Array (_ BitVec 32) ValueCell!3244)) (size!8847 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17949)

(declare-fun mapDefault!12189 () ValueCell!3244)

