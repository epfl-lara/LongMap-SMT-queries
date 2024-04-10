; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111110 () Bool)

(assert start!111110)

(declare-fun b_free!29945 () Bool)

(declare-fun b_next!29945 () Bool)

(assert (=> start!111110 (= b_free!29945 (not b_next!29945))))

(declare-fun tp!105157 () Bool)

(declare-fun b_and!48153 () Bool)

(assert (=> start!111110 (= tp!105157 b_and!48153)))

(declare-fun mapNonEmpty!55141 () Bool)

(declare-fun mapRes!55141 () Bool)

(declare-fun tp!105156 () Bool)

(declare-fun e!750452 () Bool)

(assert (=> mapNonEmpty!55141 (= mapRes!55141 (and tp!105156 e!750452))))

(declare-fun mapKey!55141 () (_ BitVec 32))

(declare-datatypes ((V!52669 0))(
  ( (V!52670 (val!17912 Int)) )
))
(declare-datatypes ((ValueCell!16939 0))(
  ( (ValueCellFull!16939 (v!20539 V!52669)) (EmptyCell!16939) )
))
(declare-fun mapRest!55141 () (Array (_ BitVec 32) ValueCell!16939))

(declare-datatypes ((array!88312 0))(
  ( (array!88313 (arr!42636 (Array (_ BitVec 32) ValueCell!16939)) (size!43186 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88312)

(declare-fun mapValue!55141 () ValueCell!16939)

(assert (=> mapNonEmpty!55141 (= (arr!42636 _values!1354) (store mapRest!55141 mapKey!55141 mapValue!55141))))

(declare-fun b!1315550 () Bool)

(declare-fun tp_is_empty!35675 () Bool)

(assert (=> b!1315550 (= e!750452 tp_is_empty!35675)))

(declare-fun b!1315551 () Bool)

(declare-fun e!750449 () Bool)

(assert (=> b!1315551 (= e!750449 tp_is_empty!35675)))

(declare-fun b!1315552 () Bool)

(declare-fun res!873341 () Bool)

(declare-fun e!750450 () Bool)

(assert (=> b!1315552 (=> (not res!873341) (not e!750450))))

(declare-datatypes ((array!88314 0))(
  ( (array!88315 (arr!42637 (Array (_ BitVec 32) (_ BitVec 64))) (size!43187 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88314)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88314 (_ BitVec 32)) Bool)

(assert (=> b!1315552 (= res!873341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!873342 () Bool)

(assert (=> start!111110 (=> (not res!873342) (not e!750450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111110 (= res!873342 (validMask!0 mask!2040))))

(assert (=> start!111110 e!750450))

(assert (=> start!111110 tp!105157))

(declare-fun array_inv!32201 (array!88314) Bool)

(assert (=> start!111110 (array_inv!32201 _keys!1628)))

(assert (=> start!111110 true))

(assert (=> start!111110 tp_is_empty!35675))

(declare-fun e!750448 () Bool)

(declare-fun array_inv!32202 (array!88312) Bool)

(assert (=> start!111110 (and (array_inv!32202 _values!1354) e!750448)))

(declare-fun mapIsEmpty!55141 () Bool)

(assert (=> mapIsEmpty!55141 mapRes!55141))

(declare-fun b!1315553 () Bool)

(assert (=> b!1315553 (= e!750448 (and e!750449 mapRes!55141))))

(declare-fun condMapEmpty!55141 () Bool)

(declare-fun mapDefault!55141 () ValueCell!16939)

