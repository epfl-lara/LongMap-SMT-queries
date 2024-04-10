; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71274 () Bool)

(assert start!71274)

(declare-fun b_free!13421 () Bool)

(declare-fun b_next!13421 () Bool)

(assert (=> start!71274 (= b_free!13421 (not b_next!13421))))

(declare-fun tp!47025 () Bool)

(declare-fun b_and!22359 () Bool)

(assert (=> start!71274 (= tp!47025 b_and!22359)))

(declare-fun b!827869 () Bool)

(declare-fun e!461249 () Bool)

(declare-fun tp_is_empty!15131 () Bool)

(assert (=> b!827869 (= e!461249 tp_is_empty!15131)))

(declare-fun b!827870 () Bool)

(declare-fun e!461248 () Bool)

(declare-fun mapRes!24325 () Bool)

(assert (=> b!827870 (= e!461248 (and e!461249 mapRes!24325))))

(declare-fun condMapEmpty!24325 () Bool)

(declare-datatypes ((V!25175 0))(
  ( (V!25176 (val!7613 Int)) )
))
(declare-datatypes ((ValueCell!7150 0))(
  ( (ValueCellFull!7150 (v!10048 V!25175)) (EmptyCell!7150) )
))
(declare-datatypes ((array!46426 0))(
  ( (array!46427 (arr!22257 (Array (_ BitVec 32) ValueCell!7150)) (size!22678 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46426)

(declare-fun mapDefault!24325 () ValueCell!7150)

