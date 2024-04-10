; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39398 () Bool)

(assert start!39398)

(declare-fun b_free!9665 () Bool)

(declare-fun b_next!9665 () Bool)

(assert (=> start!39398 (= b_free!9665 (not b_next!9665))))

(declare-fun tp!34523 () Bool)

(declare-fun b_and!17205 () Bool)

(assert (=> start!39398 (= tp!34523 b_and!17205)))

(declare-fun b!418905 () Bool)

(declare-fun e!249733 () Bool)

(declare-fun e!249735 () Bool)

(declare-fun mapRes!17847 () Bool)

(assert (=> b!418905 (= e!249733 (and e!249735 mapRes!17847))))

(declare-fun condMapEmpty!17847 () Bool)

(declare-datatypes ((V!15527 0))(
  ( (V!15528 (val!5453 Int)) )
))
(declare-datatypes ((ValueCell!5065 0))(
  ( (ValueCellFull!5065 (v!7700 V!15527)) (EmptyCell!5065) )
))
(declare-datatypes ((array!25485 0))(
  ( (array!25486 (arr!12192 (Array (_ BitVec 32) ValueCell!5065)) (size!12544 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25485)

(declare-fun mapDefault!17847 () ValueCell!5065)

