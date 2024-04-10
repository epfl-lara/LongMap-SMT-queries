; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71258 () Bool)

(assert start!71258)

(declare-fun b_free!13405 () Bool)

(declare-fun b_next!13405 () Bool)

(assert (=> start!71258 (= b_free!13405 (not b_next!13405))))

(declare-fun tp!46977 () Bool)

(declare-fun b_and!22343 () Bool)

(assert (=> start!71258 (= tp!46977 b_and!22343)))

(declare-fun b!827701 () Bool)

(declare-fun e!461129 () Bool)

(declare-fun e!461127 () Bool)

(declare-fun mapRes!24301 () Bool)

(assert (=> b!827701 (= e!461129 (and e!461127 mapRes!24301))))

(declare-fun condMapEmpty!24301 () Bool)

(declare-datatypes ((V!25155 0))(
  ( (V!25156 (val!7605 Int)) )
))
(declare-datatypes ((ValueCell!7142 0))(
  ( (ValueCellFull!7142 (v!10040 V!25155)) (EmptyCell!7142) )
))
(declare-datatypes ((array!46398 0))(
  ( (array!46399 (arr!22243 (Array (_ BitVec 32) ValueCell!7142)) (size!22664 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46398)

(declare-fun mapDefault!24301 () ValueCell!7142)

