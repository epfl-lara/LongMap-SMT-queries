; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110708 () Bool)

(assert start!110708)

(declare-fun b_free!29543 () Bool)

(declare-fun b_next!29543 () Bool)

(assert (=> start!110708 (= b_free!29543 (not b_next!29543))))

(declare-fun tp!103951 () Bool)

(declare-fun b_and!47751 () Bool)

(assert (=> start!110708 (= tp!103951 b_and!47751)))

(declare-fun b!1310119 () Bool)

(declare-fun e!747434 () Bool)

(declare-fun e!747436 () Bool)

(declare-fun mapRes!54538 () Bool)

(assert (=> b!1310119 (= e!747434 (and e!747436 mapRes!54538))))

(declare-fun condMapEmpty!54538 () Bool)

(declare-datatypes ((V!52133 0))(
  ( (V!52134 (val!17711 Int)) )
))
(declare-datatypes ((ValueCell!16738 0))(
  ( (ValueCellFull!16738 (v!20338 V!52133)) (EmptyCell!16738) )
))
(declare-datatypes ((array!87536 0))(
  ( (array!87537 (arr!42248 (Array (_ BitVec 32) ValueCell!16738)) (size!42798 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87536)

(declare-fun mapDefault!54538 () ValueCell!16738)

