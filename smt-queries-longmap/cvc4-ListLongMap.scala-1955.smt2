; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34480 () Bool)

(assert start!34480)

(declare-fun b_free!7403 () Bool)

(declare-fun b_next!7403 () Bool)

(assert (=> start!34480 (= b_free!7403 (not b_next!7403))))

(declare-fun tp!25754 () Bool)

(declare-fun b_and!14611 () Bool)

(assert (=> start!34480 (= tp!25754 b_and!14611)))

(declare-fun b!344488 () Bool)

(declare-fun e!211178 () Bool)

(declare-fun tp_is_empty!7355 () Bool)

(assert (=> b!344488 (= e!211178 tp_is_empty!7355)))

(declare-fun b!344489 () Bool)

(declare-fun e!211179 () Bool)

(declare-fun mapRes!12471 () Bool)

(assert (=> b!344489 (= e!211179 (and e!211178 mapRes!12471))))

(declare-fun condMapEmpty!12471 () Bool)

(declare-datatypes ((V!10783 0))(
  ( (V!10784 (val!3722 Int)) )
))
(declare-datatypes ((ValueCell!3334 0))(
  ( (ValueCellFull!3334 (v!5898 V!10783)) (EmptyCell!3334) )
))
(declare-datatypes ((array!18299 0))(
  ( (array!18300 (arr!8666 (Array (_ BitVec 32) ValueCell!3334)) (size!9018 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18299)

(declare-fun mapDefault!12471 () ValueCell!3334)

