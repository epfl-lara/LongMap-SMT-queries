; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37476 () Bool)

(assert start!37476)

(declare-fun b_free!8603 () Bool)

(declare-fun b_next!8603 () Bool)

(assert (=> start!37476 (= b_free!8603 (not b_next!8603))))

(declare-fun tp!30525 () Bool)

(declare-fun b_and!15845 () Bool)

(assert (=> start!37476 (= tp!30525 b_and!15845)))

(declare-fun b!381940 () Bool)

(declare-fun e!232157 () Bool)

(declare-fun tp_is_empty!9251 () Bool)

(assert (=> b!381940 (= e!232157 tp_is_empty!9251)))

(declare-fun mapIsEmpty!15441 () Bool)

(declare-fun mapRes!15441 () Bool)

(assert (=> mapIsEmpty!15441 mapRes!15441))

(declare-fun b!381941 () Bool)

(declare-fun e!232153 () Bool)

(declare-fun e!232154 () Bool)

(assert (=> b!381941 (= e!232153 (and e!232154 mapRes!15441))))

(declare-fun condMapEmpty!15441 () Bool)

(declare-datatypes ((V!13439 0))(
  ( (V!13440 (val!4670 Int)) )
))
(declare-datatypes ((ValueCell!4282 0))(
  ( (ValueCellFull!4282 (v!6867 V!13439)) (EmptyCell!4282) )
))
(declare-datatypes ((array!22415 0))(
  ( (array!22416 (arr!10676 (Array (_ BitVec 32) ValueCell!4282)) (size!11028 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22415)

(declare-fun mapDefault!15441 () ValueCell!4282)

