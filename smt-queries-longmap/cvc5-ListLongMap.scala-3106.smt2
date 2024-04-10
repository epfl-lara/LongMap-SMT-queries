; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43648 () Bool)

(assert start!43648)

(declare-fun b_free!12355 () Bool)

(declare-fun b_next!12355 () Bool)

(assert (=> start!43648 (= b_free!12355 (not b_next!12355))))

(declare-fun tp!43357 () Bool)

(declare-fun b_and!21121 () Bool)

(assert (=> start!43648 (= tp!43357 b_and!21121)))

(declare-fun b!483432 () Bool)

(declare-fun e!284498 () Bool)

(declare-fun tp_is_empty!13867 () Bool)

(assert (=> b!483432 (= e!284498 tp_is_empty!13867)))

(declare-fun b!483433 () Bool)

(declare-fun e!284496 () Bool)

(declare-fun mapRes!22519 () Bool)

(assert (=> b!483433 (= e!284496 (and e!284498 mapRes!22519))))

(declare-fun condMapEmpty!22519 () Bool)

(declare-datatypes ((V!19561 0))(
  ( (V!19562 (val!6981 Int)) )
))
(declare-datatypes ((ValueCell!6572 0))(
  ( (ValueCellFull!6572 (v!9277 V!19561)) (EmptyCell!6572) )
))
(declare-datatypes ((array!31397 0))(
  ( (array!31398 (arr!15098 (Array (_ BitVec 32) ValueCell!6572)) (size!15456 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31397)

(declare-fun mapDefault!22519 () ValueCell!6572)

