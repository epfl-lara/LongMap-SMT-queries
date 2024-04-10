; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39554 () Bool)

(assert start!39554)

(declare-fun b_free!9821 () Bool)

(declare-fun b_next!9821 () Bool)

(assert (=> start!39554 (= b_free!9821 (not b_next!9821))))

(declare-fun tp!34991 () Bool)

(declare-fun b_and!17477 () Bool)

(assert (=> start!39554 (= tp!34991 b_and!17477)))

(declare-fun b!423219 () Bool)

(declare-fun e!251650 () Bool)

(declare-fun e!251652 () Bool)

(declare-fun mapRes!18081 () Bool)

(assert (=> b!423219 (= e!251650 (and e!251652 mapRes!18081))))

(declare-fun condMapEmpty!18081 () Bool)

(declare-datatypes ((V!15735 0))(
  ( (V!15736 (val!5531 Int)) )
))
(declare-datatypes ((ValueCell!5143 0))(
  ( (ValueCellFull!5143 (v!7778 V!15735)) (EmptyCell!5143) )
))
(declare-datatypes ((array!25793 0))(
  ( (array!25794 (arr!12346 (Array (_ BitVec 32) ValueCell!5143)) (size!12698 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25793)

(declare-fun mapDefault!18081 () ValueCell!5143)

