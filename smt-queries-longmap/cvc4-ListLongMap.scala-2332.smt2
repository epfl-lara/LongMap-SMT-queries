; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37458 () Bool)

(assert start!37458)

(declare-fun b_free!8585 () Bool)

(declare-fun b_next!8585 () Bool)

(assert (=> start!37458 (= b_free!8585 (not b_next!8585))))

(declare-fun tp!30471 () Bool)

(declare-fun b_and!15827 () Bool)

(assert (=> start!37458 (= tp!30471 b_and!15827)))

(declare-fun b!381562 () Bool)

(declare-fun e!231966 () Bool)

(declare-fun tp_is_empty!9233 () Bool)

(assert (=> b!381562 (= e!231966 tp_is_empty!9233)))

(declare-fun b!381563 () Bool)

(declare-fun e!231962 () Bool)

(declare-fun mapRes!15414 () Bool)

(assert (=> b!381563 (= e!231962 (and e!231966 mapRes!15414))))

(declare-fun condMapEmpty!15414 () Bool)

(declare-datatypes ((V!13415 0))(
  ( (V!13416 (val!4661 Int)) )
))
(declare-datatypes ((ValueCell!4273 0))(
  ( (ValueCellFull!4273 (v!6858 V!13415)) (EmptyCell!4273) )
))
(declare-datatypes ((array!22381 0))(
  ( (array!22382 (arr!10659 (Array (_ BitVec 32) ValueCell!4273)) (size!11011 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22381)

(declare-fun mapDefault!15414 () ValueCell!4273)

