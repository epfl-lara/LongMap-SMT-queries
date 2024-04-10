; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34506 () Bool)

(assert start!34506)

(declare-fun b_free!7429 () Bool)

(declare-fun b_next!7429 () Bool)

(assert (=> start!34506 (= b_free!7429 (not b_next!7429))))

(declare-fun tp!25833 () Bool)

(declare-fun b_and!14637 () Bool)

(assert (=> start!34506 (= tp!25833 b_and!14637)))

(declare-fun b!344839 () Bool)

(declare-fun e!211370 () Bool)

(declare-fun e!211374 () Bool)

(declare-fun mapRes!12510 () Bool)

(assert (=> b!344839 (= e!211370 (and e!211374 mapRes!12510))))

(declare-fun condMapEmpty!12510 () Bool)

(declare-datatypes ((V!10819 0))(
  ( (V!10820 (val!3735 Int)) )
))
(declare-datatypes ((ValueCell!3347 0))(
  ( (ValueCellFull!3347 (v!5911 V!10819)) (EmptyCell!3347) )
))
(declare-datatypes ((array!18347 0))(
  ( (array!18348 (arr!8690 (Array (_ BitVec 32) ValueCell!3347)) (size!9042 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18347)

(declare-fun mapDefault!12510 () ValueCell!3347)

