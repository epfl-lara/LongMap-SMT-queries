; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98126 () Bool)

(assert start!98126)

(declare-fun b_free!23827 () Bool)

(declare-fun b_next!23827 () Bool)

(assert (=> start!98126 (= b_free!23827 (not b_next!23827))))

(declare-fun tp!84184 () Bool)

(declare-fun b_and!38437 () Bool)

(assert (=> start!98126 (= tp!84184 b_and!38437)))

(declare-fun b!1127755 () Bool)

(declare-fun e!641877 () Bool)

(declare-fun e!641871 () Bool)

(declare-fun mapRes!44353 () Bool)

(assert (=> b!1127755 (= e!641877 (and e!641871 mapRes!44353))))

(declare-fun condMapEmpty!44353 () Bool)

(declare-datatypes ((V!42937 0))(
  ( (V!42938 (val!14235 Int)) )
))
(declare-datatypes ((ValueCell!13469 0))(
  ( (ValueCellFull!13469 (v!16868 V!42937)) (EmptyCell!13469) )
))
(declare-datatypes ((array!73575 0))(
  ( (array!73576 (arr!35440 (Array (_ BitVec 32) ValueCell!13469)) (size!35976 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73575)

(declare-fun mapDefault!44353 () ValueCell!13469)

