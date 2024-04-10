; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82370 () Bool)

(assert start!82370)

(declare-fun b_free!18637 () Bool)

(declare-fun b_next!18637 () Bool)

(assert (=> start!82370 (= b_free!18637 (not b_next!18637))))

(declare-fun tp!64880 () Bool)

(declare-fun b_and!30125 () Bool)

(assert (=> start!82370 (= tp!64880 b_and!30125)))

(declare-fun b!960422 () Bool)

(declare-fun e!541394 () Bool)

(declare-fun e!541392 () Bool)

(declare-fun mapRes!34003 () Bool)

(assert (=> b!960422 (= e!541394 (and e!541392 mapRes!34003))))

(declare-fun condMapEmpty!34003 () Bool)

(declare-datatypes ((V!33449 0))(
  ( (V!33450 (val!10725 Int)) )
))
(declare-datatypes ((ValueCell!10193 0))(
  ( (ValueCellFull!10193 (v!13282 V!33449)) (EmptyCell!10193) )
))
(declare-datatypes ((array!58789 0))(
  ( (array!58790 (arr!28268 (Array (_ BitVec 32) ValueCell!10193)) (size!28747 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58789)

(declare-fun mapDefault!34003 () ValueCell!10193)

