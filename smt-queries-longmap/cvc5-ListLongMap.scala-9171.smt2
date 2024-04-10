; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110252 () Bool)

(assert start!110252)

(declare-fun b_free!29299 () Bool)

(declare-fun b_next!29299 () Bool)

(assert (=> start!110252 (= b_free!29299 (not b_next!29299))))

(declare-fun tp!103062 () Bool)

(declare-fun b_and!47495 () Bool)

(assert (=> start!110252 (= tp!103062 b_and!47495)))

(declare-fun b!1305066 () Bool)

(declare-fun e!744429 () Bool)

(declare-fun e!744431 () Bool)

(declare-fun mapRes!54015 () Bool)

(assert (=> b!1305066 (= e!744429 (and e!744431 mapRes!54015))))

(declare-fun condMapEmpty!54015 () Bool)

(declare-datatypes ((V!51689 0))(
  ( (V!51690 (val!17544 Int)) )
))
(declare-datatypes ((ValueCell!16571 0))(
  ( (ValueCellFull!16571 (v!20166 V!51689)) (EmptyCell!16571) )
))
(declare-datatypes ((array!86896 0))(
  ( (array!86897 (arr!41935 (Array (_ BitVec 32) ValueCell!16571)) (size!42485 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86896)

(declare-fun mapDefault!54015 () ValueCell!16571)

