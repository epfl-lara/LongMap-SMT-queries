; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71092 () Bool)

(assert start!71092)

(declare-fun b_free!13279 () Bool)

(declare-fun b_next!13279 () Bool)

(assert (=> start!71092 (= b_free!13279 (not b_next!13279))))

(declare-fun tp!46593 () Bool)

(declare-fun b_and!22193 () Bool)

(assert (=> start!71092 (= tp!46593 b_and!22193)))

(declare-fun res!562849 () Bool)

(declare-fun e!459602 () Bool)

(assert (=> start!71092 (=> (not res!562849) (not e!459602))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71092 (= res!562849 (validMask!0 mask!1312))))

(assert (=> start!71092 e!459602))

(declare-fun tp_is_empty!14989 () Bool)

(assert (=> start!71092 tp_is_empty!14989))

(declare-datatypes ((array!46160 0))(
  ( (array!46161 (arr!22126 (Array (_ BitVec 32) (_ BitVec 64))) (size!22547 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46160)

(declare-fun array_inv!17639 (array!46160) Bool)

(assert (=> start!71092 (array_inv!17639 _keys!976)))

(assert (=> start!71092 true))

(declare-datatypes ((V!24987 0))(
  ( (V!24988 (val!7542 Int)) )
))
(declare-datatypes ((ValueCell!7079 0))(
  ( (ValueCellFull!7079 (v!9975 V!24987)) (EmptyCell!7079) )
))
(declare-datatypes ((array!46162 0))(
  ( (array!46163 (arr!22127 (Array (_ BitVec 32) ValueCell!7079)) (size!22548 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46162)

(declare-fun e!459607 () Bool)

(declare-fun array_inv!17640 (array!46162) Bool)

(assert (=> start!71092 (and (array_inv!17640 _values!788) e!459607)))

(assert (=> start!71092 tp!46593))

(declare-fun b!825648 () Bool)

(declare-fun e!459604 () Bool)

(declare-fun mapRes!24106 () Bool)

(assert (=> b!825648 (= e!459607 (and e!459604 mapRes!24106))))

(declare-fun condMapEmpty!24106 () Bool)

(declare-fun mapDefault!24106 () ValueCell!7079)

