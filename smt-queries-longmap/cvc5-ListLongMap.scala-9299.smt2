; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111142 () Bool)

(assert start!111142)

(declare-fun b_free!29977 () Bool)

(declare-fun b_next!29977 () Bool)

(assert (=> start!111142 (= b_free!29977 (not b_next!29977))))

(declare-fun tp!105252 () Bool)

(declare-fun b_and!48185 () Bool)

(assert (=> start!111142 (= tp!105252 b_and!48185)))

(declare-fun b!1315934 () Bool)

(declare-fun e!750690 () Bool)

(declare-fun e!750689 () Bool)

(declare-fun mapRes!55189 () Bool)

(assert (=> b!1315934 (= e!750690 (and e!750689 mapRes!55189))))

(declare-fun condMapEmpty!55189 () Bool)

(declare-datatypes ((V!52713 0))(
  ( (V!52714 (val!17928 Int)) )
))
(declare-datatypes ((ValueCell!16955 0))(
  ( (ValueCellFull!16955 (v!20555 V!52713)) (EmptyCell!16955) )
))
(declare-datatypes ((array!88374 0))(
  ( (array!88375 (arr!42667 (Array (_ BitVec 32) ValueCell!16955)) (size!43217 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88374)

(declare-fun mapDefault!55189 () ValueCell!16955)

