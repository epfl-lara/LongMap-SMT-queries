; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39536 () Bool)

(assert start!39536)

(declare-fun b_free!9803 () Bool)

(declare-fun b_next!9803 () Bool)

(assert (=> start!39536 (= b_free!9803 (not b_next!9803))))

(declare-fun tp!34937 () Bool)

(declare-fun b_and!17459 () Bool)

(assert (=> start!39536 (= tp!34937 b_and!17459)))

(declare-fun b!422814 () Bool)

(declare-fun res!246985 () Bool)

(declare-fun e!251489 () Bool)

(assert (=> b!422814 (=> (not res!246985) (not e!251489))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422814 (= res!246985 (validMask!0 mask!1025))))

(declare-fun b!422815 () Bool)

(declare-fun res!246980 () Bool)

(assert (=> b!422815 (=> (not res!246980) (not e!251489))))

(declare-datatypes ((array!25757 0))(
  ( (array!25758 (arr!12328 (Array (_ BitVec 32) (_ BitVec 64))) (size!12680 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25757)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422815 (= res!246980 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!422816 () Bool)

(declare-fun e!251487 () Bool)

(declare-fun tp_is_empty!10955 () Bool)

(assert (=> b!422816 (= e!251487 tp_is_empty!10955)))

(declare-fun b!422817 () Bool)

(declare-fun e!251485 () Bool)

(declare-fun mapRes!18054 () Bool)

(assert (=> b!422817 (= e!251485 (and e!251487 mapRes!18054))))

(declare-fun condMapEmpty!18054 () Bool)

(declare-datatypes ((V!15711 0))(
  ( (V!15712 (val!5522 Int)) )
))
(declare-datatypes ((ValueCell!5134 0))(
  ( (ValueCellFull!5134 (v!7769 V!15711)) (EmptyCell!5134) )
))
(declare-datatypes ((array!25759 0))(
  ( (array!25760 (arr!12329 (Array (_ BitVec 32) ValueCell!5134)) (size!12681 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25759)

(declare-fun mapDefault!18054 () ValueCell!5134)

