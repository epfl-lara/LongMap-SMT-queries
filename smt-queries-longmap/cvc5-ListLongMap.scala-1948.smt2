; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34434 () Bool)

(assert start!34434)

(declare-fun b_free!7357 () Bool)

(declare-fun b_next!7357 () Bool)

(assert (=> start!34434 (= b_free!7357 (not b_next!7357))))

(declare-fun tp!25616 () Bool)

(declare-fun b_and!14565 () Bool)

(assert (=> start!34434 (= tp!25616 b_and!14565)))

(declare-fun b!343867 () Bool)

(declare-fun e!210834 () Bool)

(declare-fun e!210831 () Bool)

(declare-fun mapRes!12402 () Bool)

(assert (=> b!343867 (= e!210834 (and e!210831 mapRes!12402))))

(declare-fun condMapEmpty!12402 () Bool)

(declare-datatypes ((V!10723 0))(
  ( (V!10724 (val!3699 Int)) )
))
(declare-datatypes ((ValueCell!3311 0))(
  ( (ValueCellFull!3311 (v!5875 V!10723)) (EmptyCell!3311) )
))
(declare-datatypes ((array!18211 0))(
  ( (array!18212 (arr!8622 (Array (_ BitVec 32) ValueCell!3311)) (size!8974 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18211)

(declare-fun mapDefault!12402 () ValueCell!3311)

