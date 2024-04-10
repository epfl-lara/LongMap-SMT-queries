; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37358 () Bool)

(assert start!37358)

(declare-fun b_free!8485 () Bool)

(declare-fun b_next!8485 () Bool)

(assert (=> start!37358 (= b_free!8485 (not b_next!8485))))

(declare-fun tp!30170 () Bool)

(declare-fun b_and!15727 () Bool)

(assert (=> start!37358 (= tp!30170 b_and!15727)))

(declare-fun b!379365 () Bool)

(declare-fun e!230817 () Bool)

(declare-fun tp_is_empty!9133 () Bool)

(assert (=> b!379365 (= e!230817 tp_is_empty!9133)))

(declare-fun b!379366 () Bool)

(declare-fun e!230818 () Bool)

(declare-fun mapRes!15264 () Bool)

(assert (=> b!379366 (= e!230818 (and e!230817 mapRes!15264))))

(declare-fun condMapEmpty!15264 () Bool)

(declare-datatypes ((V!13283 0))(
  ( (V!13284 (val!4611 Int)) )
))
(declare-datatypes ((ValueCell!4223 0))(
  ( (ValueCellFull!4223 (v!6808 V!13283)) (EmptyCell!4223) )
))
(declare-datatypes ((array!22189 0))(
  ( (array!22190 (arr!10563 (Array (_ BitVec 32) ValueCell!4223)) (size!10915 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22189)

(declare-fun mapDefault!15264 () ValueCell!4223)

