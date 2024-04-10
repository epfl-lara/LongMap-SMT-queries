; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34584 () Bool)

(assert start!34584)

(declare-fun b_free!7469 () Bool)

(declare-fun b_next!7469 () Bool)

(assert (=> start!34584 (= b_free!7469 (not b_next!7469))))

(declare-fun tp!25959 () Bool)

(declare-fun b_and!14681 () Bool)

(assert (=> start!34584 (= tp!25959 b_and!14681)))

(declare-fun mapIsEmpty!12576 () Bool)

(declare-fun mapRes!12576 () Bool)

(assert (=> mapIsEmpty!12576 mapRes!12576))

(declare-fun b!345649 () Bool)

(declare-fun e!211849 () Bool)

(declare-fun e!211848 () Bool)

(assert (=> b!345649 (= e!211849 (and e!211848 mapRes!12576))))

(declare-fun condMapEmpty!12576 () Bool)

(declare-datatypes ((V!10871 0))(
  ( (V!10872 (val!3755 Int)) )
))
(declare-datatypes ((ValueCell!3367 0))(
  ( (ValueCellFull!3367 (v!5933 V!10871)) (EmptyCell!3367) )
))
(declare-datatypes ((array!18429 0))(
  ( (array!18430 (arr!8729 (Array (_ BitVec 32) ValueCell!3367)) (size!9081 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18429)

(declare-fun mapDefault!12576 () ValueCell!3367)

