; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71134 () Bool)

(assert start!71134)

(declare-fun b_free!13301 () Bool)

(declare-fun b_next!13301 () Bool)

(assert (=> start!71134 (= b_free!13301 (not b_next!13301))))

(declare-fun tp!46663 () Bool)

(declare-fun b_and!22227 () Bool)

(assert (=> start!71134 (= tp!46663 b_and!22227)))

(declare-fun b!826184 () Bool)

(declare-fun e!459999 () Bool)

(declare-fun e!460002 () Bool)

(declare-fun mapRes!24142 () Bool)

(assert (=> b!826184 (= e!459999 (and e!460002 mapRes!24142))))

(declare-fun condMapEmpty!24142 () Bool)

(declare-datatypes ((V!25015 0))(
  ( (V!25016 (val!7553 Int)) )
))
(declare-datatypes ((ValueCell!7090 0))(
  ( (ValueCellFull!7090 (v!9987 V!25015)) (EmptyCell!7090) )
))
(declare-datatypes ((array!46206 0))(
  ( (array!46207 (arr!22148 (Array (_ BitVec 32) ValueCell!7090)) (size!22569 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46206)

(declare-fun mapDefault!24142 () ValueCell!7090)

