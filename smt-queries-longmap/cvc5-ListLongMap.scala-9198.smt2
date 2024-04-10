; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110536 () Bool)

(assert start!110536)

(declare-fun b_free!29371 () Bool)

(declare-fun b_next!29371 () Bool)

(assert (=> start!110536 (= b_free!29371 (not b_next!29371))))

(declare-fun tp!103434 () Bool)

(declare-fun b_and!47579 () Bool)

(assert (=> start!110536 (= tp!103434 b_and!47579)))

(declare-fun b!1307591 () Bool)

(declare-fun e!746147 () Bool)

(declare-fun tp_is_empty!35101 () Bool)

(assert (=> b!1307591 (= e!746147 tp_is_empty!35101)))

(declare-fun b!1307592 () Bool)

(declare-fun res!867967 () Bool)

(declare-fun e!746144 () Bool)

(assert (=> b!1307592 (=> (not res!867967) (not e!746144))))

(declare-datatypes ((array!87202 0))(
  ( (array!87203 (arr!42081 (Array (_ BitVec 32) (_ BitVec 64))) (size!42631 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87202)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51905 0))(
  ( (V!51906 (val!17625 Int)) )
))
(declare-datatypes ((ValueCell!16652 0))(
  ( (ValueCellFull!16652 (v!20252 V!51905)) (EmptyCell!16652) )
))
(declare-datatypes ((array!87204 0))(
  ( (array!87205 (arr!42082 (Array (_ BitVec 32) ValueCell!16652)) (size!42632 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87204)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307592 (= res!867967 (and (= (size!42632 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42631 _keys!1628) (size!42632 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54280 () Bool)

(declare-fun mapRes!54280 () Bool)

(declare-fun tp!103435 () Bool)

(declare-fun e!746146 () Bool)

(assert (=> mapNonEmpty!54280 (= mapRes!54280 (and tp!103435 e!746146))))

(declare-fun mapKey!54280 () (_ BitVec 32))

(declare-fun mapValue!54280 () ValueCell!16652)

(declare-fun mapRest!54280 () (Array (_ BitVec 32) ValueCell!16652))

(assert (=> mapNonEmpty!54280 (= (arr!42082 _values!1354) (store mapRest!54280 mapKey!54280 mapValue!54280))))

(declare-fun mapIsEmpty!54280 () Bool)

(assert (=> mapIsEmpty!54280 mapRes!54280))

(declare-fun b!1307593 () Bool)

(declare-fun e!746143 () Bool)

(assert (=> b!1307593 (= e!746143 (and e!746147 mapRes!54280))))

(declare-fun condMapEmpty!54280 () Bool)

(declare-fun mapDefault!54280 () ValueCell!16652)

