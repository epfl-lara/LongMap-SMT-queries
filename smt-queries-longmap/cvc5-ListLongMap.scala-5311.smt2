; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71086 () Bool)

(assert start!71086)

(declare-fun b_free!13273 () Bool)

(declare-fun b_next!13273 () Bool)

(assert (=> start!71086 (= b_free!13273 (not b_next!13273))))

(declare-fun tp!46576 () Bool)

(declare-fun b_and!22187 () Bool)

(assert (=> start!71086 (= tp!46576 b_and!22187)))

(declare-fun b!825558 () Bool)

(declare-fun e!459531 () Bool)

(declare-fun e!459530 () Bool)

(declare-fun mapRes!24097 () Bool)

(assert (=> b!825558 (= e!459531 (and e!459530 mapRes!24097))))

(declare-fun condMapEmpty!24097 () Bool)

(declare-datatypes ((V!24979 0))(
  ( (V!24980 (val!7539 Int)) )
))
(declare-datatypes ((ValueCell!7076 0))(
  ( (ValueCellFull!7076 (v!9972 V!24979)) (EmptyCell!7076) )
))
(declare-datatypes ((array!46150 0))(
  ( (array!46151 (arr!22121 (Array (_ BitVec 32) ValueCell!7076)) (size!22542 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46150)

(declare-fun mapDefault!24097 () ValueCell!7076)

