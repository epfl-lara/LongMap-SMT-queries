; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110064 () Bool)

(assert start!110064)

(declare-fun b_free!29263 () Bool)

(declare-fun b_next!29263 () Bool)

(assert (=> start!110064 (= b_free!29263 (not b_next!29263))))

(declare-fun tp!102940 () Bool)

(declare-fun b_and!47427 () Bool)

(assert (=> start!110064 (= tp!102940 b_and!47427)))

(declare-fun b!1303478 () Bool)

(declare-fun e!743490 () Bool)

(declare-fun e!743492 () Bool)

(declare-fun mapRes!53947 () Bool)

(assert (=> b!1303478 (= e!743490 (and e!743492 mapRes!53947))))

(declare-fun condMapEmpty!53947 () Bool)

(declare-datatypes ((V!51641 0))(
  ( (V!51642 (val!17526 Int)) )
))
(declare-datatypes ((ValueCell!16553 0))(
  ( (ValueCellFull!16553 (v!20142 V!51641)) (EmptyCell!16553) )
))
(declare-datatypes ((array!86820 0))(
  ( (array!86821 (arr!41901 (Array (_ BitVec 32) ValueCell!16553)) (size!42451 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86820)

(declare-fun mapDefault!53947 () ValueCell!16553)

