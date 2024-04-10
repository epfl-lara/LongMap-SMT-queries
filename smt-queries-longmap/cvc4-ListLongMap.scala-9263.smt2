; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110930 () Bool)

(assert start!110930)

(declare-fun b_free!29765 () Bool)

(declare-fun b_next!29765 () Bool)

(assert (=> start!110930 (= b_free!29765 (not b_next!29765))))

(declare-fun tp!104617 () Bool)

(declare-fun b_and!47973 () Bool)

(assert (=> start!110930 (= tp!104617 b_and!47973)))

(declare-fun b!1313318 () Bool)

(declare-fun e!749100 () Bool)

(declare-fun e!749099 () Bool)

(declare-fun mapRes!54871 () Bool)

(assert (=> b!1313318 (= e!749100 (and e!749099 mapRes!54871))))

(declare-fun condMapEmpty!54871 () Bool)

(declare-datatypes ((V!52429 0))(
  ( (V!52430 (val!17822 Int)) )
))
(declare-datatypes ((ValueCell!16849 0))(
  ( (ValueCellFull!16849 (v!20449 V!52429)) (EmptyCell!16849) )
))
(declare-datatypes ((array!87972 0))(
  ( (array!87973 (arr!42466 (Array (_ BitVec 32) ValueCell!16849)) (size!43016 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87972)

(declare-fun mapDefault!54871 () ValueCell!16849)

