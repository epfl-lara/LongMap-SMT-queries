; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96372 () Bool)

(assert start!96372)

(declare-fun b_free!22951 () Bool)

(declare-fun b_next!22951 () Bool)

(assert (=> start!96372 (= b_free!22951 (not b_next!22951))))

(declare-fun tp!80779 () Bool)

(declare-fun b_and!36577 () Bool)

(assert (=> start!96372 (= tp!80779 b_and!36577)))

(declare-fun mapIsEmpty!42262 () Bool)

(declare-fun mapRes!42262 () Bool)

(assert (=> mapIsEmpty!42262 mapRes!42262))

(declare-fun b!1095167 () Bool)

(declare-fun e!625251 () Bool)

(declare-fun e!625252 () Bool)

(assert (=> b!1095167 (= e!625251 (and e!625252 mapRes!42262))))

(declare-fun condMapEmpty!42262 () Bool)

(declare-datatypes ((V!41129 0))(
  ( (V!41130 (val!13557 Int)) )
))
(declare-datatypes ((ValueCell!12791 0))(
  ( (ValueCellFull!12791 (v!16178 V!41129)) (EmptyCell!12791) )
))
(declare-datatypes ((array!70919 0))(
  ( (array!70920 (arr!34131 (Array (_ BitVec 32) ValueCell!12791)) (size!34667 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70919)

(declare-fun mapDefault!42262 () ValueCell!12791)

