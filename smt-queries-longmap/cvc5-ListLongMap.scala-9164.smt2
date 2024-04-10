; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110058 () Bool)

(assert start!110058)

(declare-fun b_free!29257 () Bool)

(declare-fun b_next!29257 () Bool)

(assert (=> start!110058 (= b_free!29257 (not b_next!29257))))

(declare-fun tp!102921 () Bool)

(declare-fun b_and!47421 () Bool)

(assert (=> start!110058 (= tp!102921 b_and!47421)))

(declare-fun b!1303370 () Bool)

(declare-fun e!743436 () Bool)

(declare-fun e!743440 () Bool)

(declare-fun mapRes!53938 () Bool)

(assert (=> b!1303370 (= e!743436 (and e!743440 mapRes!53938))))

(declare-fun condMapEmpty!53938 () Bool)

(declare-datatypes ((V!51633 0))(
  ( (V!51634 (val!17523 Int)) )
))
(declare-datatypes ((ValueCell!16550 0))(
  ( (ValueCellFull!16550 (v!20139 V!51633)) (EmptyCell!16550) )
))
(declare-datatypes ((array!86810 0))(
  ( (array!86811 (arr!41896 (Array (_ BitVec 32) ValueCell!16550)) (size!42446 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86810)

(declare-fun mapDefault!53938 () ValueCell!16550)

