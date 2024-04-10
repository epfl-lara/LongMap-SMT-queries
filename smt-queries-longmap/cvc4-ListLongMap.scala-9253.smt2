; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110870 () Bool)

(assert start!110870)

(declare-fun b_free!29705 () Bool)

(declare-fun b_next!29705 () Bool)

(assert (=> start!110870 (= b_free!29705 (not b_next!29705))))

(declare-fun tp!104437 () Bool)

(declare-fun b_and!47913 () Bool)

(assert (=> start!110870 (= tp!104437 b_and!47913)))

(declare-fun b!1312571 () Bool)

(declare-fun e!748648 () Bool)

(declare-fun e!748652 () Bool)

(declare-fun mapRes!54781 () Bool)

(assert (=> b!1312571 (= e!748648 (and e!748652 mapRes!54781))))

(declare-fun condMapEmpty!54781 () Bool)

(declare-datatypes ((V!52349 0))(
  ( (V!52350 (val!17792 Int)) )
))
(declare-datatypes ((ValueCell!16819 0))(
  ( (ValueCellFull!16819 (v!20419 V!52349)) (EmptyCell!16819) )
))
(declare-datatypes ((array!87856 0))(
  ( (array!87857 (arr!42408 (Array (_ BitVec 32) ValueCell!16819)) (size!42958 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87856)

(declare-fun mapDefault!54781 () ValueCell!16819)

