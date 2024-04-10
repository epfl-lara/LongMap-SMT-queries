; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110956 () Bool)

(assert start!110956)

(declare-fun b_free!29791 () Bool)

(declare-fun b_next!29791 () Bool)

(assert (=> start!110956 (= b_free!29791 (not b_next!29791))))

(declare-fun tp!104694 () Bool)

(declare-fun b_and!47999 () Bool)

(assert (=> start!110956 (= tp!104694 b_and!47999)))

(declare-fun mapIsEmpty!54910 () Bool)

(declare-fun mapRes!54910 () Bool)

(assert (=> mapIsEmpty!54910 mapRes!54910))

(declare-fun b!1313630 () Bool)

(declare-fun e!749295 () Bool)

(declare-fun e!749293 () Bool)

(assert (=> b!1313630 (= e!749295 (and e!749293 mapRes!54910))))

(declare-fun condMapEmpty!54910 () Bool)

(declare-datatypes ((V!52465 0))(
  ( (V!52466 (val!17835 Int)) )
))
(declare-datatypes ((ValueCell!16862 0))(
  ( (ValueCellFull!16862 (v!20462 V!52465)) (EmptyCell!16862) )
))
(declare-datatypes ((array!88020 0))(
  ( (array!88021 (arr!42490 (Array (_ BitVec 32) ValueCell!16862)) (size!43040 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88020)

(declare-fun mapDefault!54910 () ValueCell!16862)

