; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109690 () Bool)

(assert start!109690)

(declare-fun b_free!29143 () Bool)

(declare-fun b_next!29143 () Bool)

(assert (=> start!109690 (= b_free!29143 (not b_next!29143))))

(declare-fun tp!102553 () Bool)

(declare-fun b_and!47239 () Bool)

(assert (=> start!109690 (= tp!102553 b_and!47239)))

(declare-fun b!1299264 () Bool)

(declare-fun e!741230 () Bool)

(declare-fun e!741228 () Bool)

(declare-fun mapRes!53741 () Bool)

(assert (=> b!1299264 (= e!741230 (and e!741228 mapRes!53741))))

(declare-fun condMapEmpty!53741 () Bool)

(declare-datatypes ((V!51481 0))(
  ( (V!51482 (val!17466 Int)) )
))
(declare-datatypes ((ValueCell!16493 0))(
  ( (ValueCellFull!16493 (v!20071 V!51481)) (EmptyCell!16493) )
))
(declare-datatypes ((array!86574 0))(
  ( (array!86575 (arr!41786 (Array (_ BitVec 32) ValueCell!16493)) (size!42336 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86574)

(declare-fun mapDefault!53741 () ValueCell!16493)

