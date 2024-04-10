; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110498 () Bool)

(assert start!110498)

(declare-fun b_free!29333 () Bool)

(declare-fun b_next!29333 () Bool)

(assert (=> start!110498 (= b_free!29333 (not b_next!29333))))

(declare-fun tp!103320 () Bool)

(declare-fun b_and!47541 () Bool)

(assert (=> start!110498 (= tp!103320 b_and!47541)))

(declare-fun b!1307135 () Bool)

(declare-fun e!745858 () Bool)

(declare-fun e!745859 () Bool)

(declare-fun mapRes!54223 () Bool)

(assert (=> b!1307135 (= e!745858 (and e!745859 mapRes!54223))))

(declare-fun condMapEmpty!54223 () Bool)

(declare-datatypes ((V!51853 0))(
  ( (V!51854 (val!17606 Int)) )
))
(declare-datatypes ((ValueCell!16633 0))(
  ( (ValueCellFull!16633 (v!20233 V!51853)) (EmptyCell!16633) )
))
(declare-datatypes ((array!87132 0))(
  ( (array!87133 (arr!42046 (Array (_ BitVec 32) ValueCell!16633)) (size!42596 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87132)

(declare-fun mapDefault!54223 () ValueCell!16633)

