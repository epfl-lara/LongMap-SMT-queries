; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71062 () Bool)

(assert start!71062)

(declare-fun b_free!13249 () Bool)

(declare-fun b_next!13249 () Bool)

(assert (=> start!71062 (= b_free!13249 (not b_next!13249))))

(declare-fun tp!46503 () Bool)

(declare-fun b_and!22163 () Bool)

(assert (=> start!71062 (= tp!46503 b_and!22163)))

(declare-fun b!825198 () Bool)

(declare-fun e!459242 () Bool)

(declare-fun e!459245 () Bool)

(declare-fun mapRes!24061 () Bool)

(assert (=> b!825198 (= e!459242 (and e!459245 mapRes!24061))))

(declare-fun condMapEmpty!24061 () Bool)

(declare-datatypes ((V!24947 0))(
  ( (V!24948 (val!7527 Int)) )
))
(declare-datatypes ((ValueCell!7064 0))(
  ( (ValueCellFull!7064 (v!9960 V!24947)) (EmptyCell!7064) )
))
(declare-datatypes ((array!46106 0))(
  ( (array!46107 (arr!22099 (Array (_ BitVec 32) ValueCell!7064)) (size!22520 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46106)

(declare-fun mapDefault!24061 () ValueCell!7064)

