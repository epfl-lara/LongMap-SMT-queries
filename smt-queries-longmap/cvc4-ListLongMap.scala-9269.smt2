; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110966 () Bool)

(assert start!110966)

(declare-fun b_free!29801 () Bool)

(declare-fun b_next!29801 () Bool)

(assert (=> start!110966 (= b_free!29801 (not b_next!29801))))

(declare-fun tp!104724 () Bool)

(declare-fun b_and!48009 () Bool)

(assert (=> start!110966 (= tp!104724 b_and!48009)))

(declare-fun b!1313750 () Bool)

(declare-fun e!749370 () Bool)

(declare-fun e!749368 () Bool)

(declare-fun mapRes!54925 () Bool)

(assert (=> b!1313750 (= e!749370 (and e!749368 mapRes!54925))))

(declare-fun condMapEmpty!54925 () Bool)

(declare-datatypes ((V!52477 0))(
  ( (V!52478 (val!17840 Int)) )
))
(declare-datatypes ((ValueCell!16867 0))(
  ( (ValueCellFull!16867 (v!20467 V!52477)) (EmptyCell!16867) )
))
(declare-datatypes ((array!88036 0))(
  ( (array!88037 (arr!42498 (Array (_ BitVec 32) ValueCell!16867)) (size!43048 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88036)

(declare-fun mapDefault!54925 () ValueCell!16867)

