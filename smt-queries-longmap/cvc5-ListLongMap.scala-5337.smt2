; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71312 () Bool)

(assert start!71312)

(declare-fun b_free!13429 () Bool)

(declare-fun b_next!13429 () Bool)

(assert (=> start!71312 (= b_free!13429 (not b_next!13429))))

(declare-fun tp!47056 () Bool)

(declare-fun b_and!22387 () Bool)

(assert (=> start!71312 (= tp!47056 b_and!22387)))

(declare-fun b!828224 () Bool)

(declare-fun e!461485 () Bool)

(declare-fun tp_is_empty!15139 () Bool)

(assert (=> b!828224 (= e!461485 tp_is_empty!15139)))

(declare-fun b!828225 () Bool)

(declare-fun e!461484 () Bool)

(declare-fun mapRes!24343 () Bool)

(assert (=> b!828225 (= e!461484 (and e!461485 mapRes!24343))))

(declare-fun condMapEmpty!24343 () Bool)

(declare-datatypes ((V!25187 0))(
  ( (V!25188 (val!7617 Int)) )
))
(declare-datatypes ((ValueCell!7154 0))(
  ( (ValueCellFull!7154 (v!10053 V!25187)) (EmptyCell!7154) )
))
(declare-datatypes ((array!46444 0))(
  ( (array!46445 (arr!22264 (Array (_ BitVec 32) ValueCell!7154)) (size!22685 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46444)

(declare-fun mapDefault!24343 () ValueCell!7154)

