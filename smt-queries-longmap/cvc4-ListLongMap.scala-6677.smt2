; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84038 () Bool)

(assert start!84038)

(declare-fun b_free!19793 () Bool)

(declare-fun b_next!19793 () Bool)

(assert (=> start!84038 (= b_free!19793 (not b_next!19793))))

(declare-fun tp!68901 () Bool)

(declare-fun b_and!31669 () Bool)

(assert (=> start!84038 (= tp!68901 b_and!31669)))

(declare-fun b!982419 () Bool)

(declare-fun e!553788 () Bool)

(declare-fun e!553784 () Bool)

(declare-fun mapRes!36290 () Bool)

(assert (=> b!982419 (= e!553788 (and e!553784 mapRes!36290))))

(declare-fun condMapEmpty!36290 () Bool)

(declare-datatypes ((V!35437 0))(
  ( (V!35438 (val!11471 Int)) )
))
(declare-datatypes ((ValueCell!10939 0))(
  ( (ValueCellFull!10939 (v!14033 V!35437)) (EmptyCell!10939) )
))
(declare-datatypes ((array!61675 0))(
  ( (array!61676 (arr!29695 (Array (_ BitVec 32) ValueCell!10939)) (size!30174 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61675)

(declare-fun mapDefault!36290 () ValueCell!10939)
