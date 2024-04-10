; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71056 () Bool)

(assert start!71056)

(declare-fun b_free!13243 () Bool)

(declare-fun b_next!13243 () Bool)

(assert (=> start!71056 (= b_free!13243 (not b_next!13243))))

(declare-fun tp!46486 () Bool)

(declare-fun b_and!22157 () Bool)

(assert (=> start!71056 (= tp!46486 b_and!22157)))

(declare-fun b!825108 () Bool)

(declare-fun e!459174 () Bool)

(declare-fun e!459176 () Bool)

(declare-fun mapRes!24052 () Bool)

(assert (=> b!825108 (= e!459174 (and e!459176 mapRes!24052))))

(declare-fun condMapEmpty!24052 () Bool)

(declare-datatypes ((V!24939 0))(
  ( (V!24940 (val!7524 Int)) )
))
(declare-datatypes ((ValueCell!7061 0))(
  ( (ValueCellFull!7061 (v!9957 V!24939)) (EmptyCell!7061) )
))
(declare-datatypes ((array!46096 0))(
  ( (array!46097 (arr!22094 (Array (_ BitVec 32) ValueCell!7061)) (size!22515 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46096)

(declare-fun mapDefault!24052 () ValueCell!7061)

