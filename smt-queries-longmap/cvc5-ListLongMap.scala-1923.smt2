; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34184 () Bool)

(assert start!34184)

(declare-fun b_free!7207 () Bool)

(declare-fun b_next!7207 () Bool)

(assert (=> start!34184 (= b_free!7207 (not b_next!7207))))

(declare-fun tp!25154 () Bool)

(declare-fun b_and!14407 () Bool)

(assert (=> start!34184 (= tp!25154 b_and!14407)))

(declare-fun b!340759 () Bool)

(declare-fun e!209023 () Bool)

(declare-fun e!209028 () Bool)

(declare-fun mapRes!12165 () Bool)

(assert (=> b!340759 (= e!209023 (and e!209028 mapRes!12165))))

(declare-fun condMapEmpty!12165 () Bool)

(declare-datatypes ((V!10523 0))(
  ( (V!10524 (val!3624 Int)) )
))
(declare-datatypes ((ValueCell!3236 0))(
  ( (ValueCellFull!3236 (v!5796 V!10523)) (EmptyCell!3236) )
))
(declare-datatypes ((array!17921 0))(
  ( (array!17922 (arr!8481 (Array (_ BitVec 32) ValueCell!3236)) (size!8833 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17921)

(declare-fun mapDefault!12165 () ValueCell!3236)

