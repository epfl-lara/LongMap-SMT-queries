; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71234 () Bool)

(assert start!71234)

(declare-fun b_free!13381 () Bool)

(declare-fun b_next!13381 () Bool)

(assert (=> start!71234 (= b_free!13381 (not b_next!13381))))

(declare-fun tp!46906 () Bool)

(declare-fun b_and!22319 () Bool)

(assert (=> start!71234 (= tp!46906 b_and!22319)))

(declare-fun b!827449 () Bool)

(declare-fun e!460948 () Bool)

(declare-fun e!460945 () Bool)

(declare-fun mapRes!24265 () Bool)

(assert (=> b!827449 (= e!460948 (and e!460945 mapRes!24265))))

(declare-fun condMapEmpty!24265 () Bool)

(declare-datatypes ((V!25123 0))(
  ( (V!25124 (val!7593 Int)) )
))
(declare-datatypes ((ValueCell!7130 0))(
  ( (ValueCellFull!7130 (v!10028 V!25123)) (EmptyCell!7130) )
))
(declare-datatypes ((array!46358 0))(
  ( (array!46359 (arr!22223 (Array (_ BitVec 32) ValueCell!7130)) (size!22644 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46358)

(declare-fun mapDefault!24265 () ValueCell!7130)

