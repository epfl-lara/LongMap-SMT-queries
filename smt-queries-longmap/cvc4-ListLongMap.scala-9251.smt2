; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110858 () Bool)

(assert start!110858)

(declare-fun b_free!29693 () Bool)

(declare-fun b_next!29693 () Bool)

(assert (=> start!110858 (= b_free!29693 (not b_next!29693))))

(declare-fun tp!104400 () Bool)

(declare-fun b_and!47901 () Bool)

(assert (=> start!110858 (= tp!104400 b_and!47901)))

(declare-fun b!1312387 () Bool)

(declare-fun e!748560 () Bool)

(declare-fun e!748558 () Bool)

(declare-fun mapRes!54763 () Bool)

(assert (=> b!1312387 (= e!748560 (and e!748558 mapRes!54763))))

(declare-fun condMapEmpty!54763 () Bool)

(declare-datatypes ((V!52333 0))(
  ( (V!52334 (val!17786 Int)) )
))
(declare-datatypes ((ValueCell!16813 0))(
  ( (ValueCellFull!16813 (v!20413 V!52333)) (EmptyCell!16813) )
))
(declare-datatypes ((array!87834 0))(
  ( (array!87835 (arr!42397 (Array (_ BitVec 32) ValueCell!16813)) (size!42947 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87834)

(declare-fun mapDefault!54763 () ValueCell!16813)

