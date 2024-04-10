; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39298 () Bool)

(assert start!39298)

(declare-fun b_free!9565 () Bool)

(declare-fun b_next!9565 () Bool)

(assert (=> start!39298 (= b_free!9565 (not b_next!9565))))

(declare-fun tp!34223 () Bool)

(declare-fun b_and!17005 () Bool)

(assert (=> start!39298 (= tp!34223 b_and!17005)))

(declare-fun mapIsEmpty!17697 () Bool)

(declare-fun mapRes!17697 () Bool)

(assert (=> mapIsEmpty!17697 mapRes!17697))

(declare-fun b!415955 () Bool)

(declare-fun e!248379 () Bool)

(declare-fun tp_is_empty!10717 () Bool)

(assert (=> b!415955 (= e!248379 tp_is_empty!10717)))

(declare-fun b!415956 () Bool)

(declare-fun e!248377 () Bool)

(assert (=> b!415956 (= e!248377 (and e!248379 mapRes!17697))))

(declare-fun condMapEmpty!17697 () Bool)

(declare-datatypes ((V!15395 0))(
  ( (V!15396 (val!5403 Int)) )
))
(declare-datatypes ((ValueCell!5015 0))(
  ( (ValueCellFull!5015 (v!7650 V!15395)) (EmptyCell!5015) )
))
(declare-datatypes ((array!25291 0))(
  ( (array!25292 (arr!12095 (Array (_ BitVec 32) ValueCell!5015)) (size!12447 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25291)

(declare-fun mapDefault!17697 () ValueCell!5015)

