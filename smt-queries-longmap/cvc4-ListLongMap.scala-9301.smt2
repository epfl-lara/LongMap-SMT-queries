; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111158 () Bool)

(assert start!111158)

(declare-fun b_free!29993 () Bool)

(declare-fun b_next!29993 () Bool)

(assert (=> start!111158 (= b_free!29993 (not b_next!29993))))

(declare-fun tp!105301 () Bool)

(declare-fun b_and!48201 () Bool)

(assert (=> start!111158 (= tp!105301 b_and!48201)))

(declare-fun b!1316126 () Bool)

(declare-fun res!873701 () Bool)

(declare-fun e!750809 () Bool)

(assert (=> b!1316126 (=> (not res!873701) (not e!750809))))

(declare-datatypes ((array!88404 0))(
  ( (array!88405 (arr!42682 (Array (_ BitVec 32) (_ BitVec 64))) (size!43232 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88404)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52733 0))(
  ( (V!52734 (val!17936 Int)) )
))
(declare-datatypes ((ValueCell!16963 0))(
  ( (ValueCellFull!16963 (v!20563 V!52733)) (EmptyCell!16963) )
))
(declare-datatypes ((array!88406 0))(
  ( (array!88407 (arr!42683 (Array (_ BitVec 32) ValueCell!16963)) (size!43233 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88406)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316126 (= res!873701 (and (= (size!43233 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43232 _keys!1628) (size!43233 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55213 () Bool)

(declare-fun mapRes!55213 () Bool)

(assert (=> mapIsEmpty!55213 mapRes!55213))

(declare-fun mapNonEmpty!55213 () Bool)

(declare-fun tp!105300 () Bool)

(declare-fun e!750811 () Bool)

(assert (=> mapNonEmpty!55213 (= mapRes!55213 (and tp!105300 e!750811))))

(declare-fun mapValue!55213 () ValueCell!16963)

(declare-fun mapKey!55213 () (_ BitVec 32))

(declare-fun mapRest!55213 () (Array (_ BitVec 32) ValueCell!16963))

(assert (=> mapNonEmpty!55213 (= (arr!42683 _values!1354) (store mapRest!55213 mapKey!55213 mapValue!55213))))

(declare-fun b!1316127 () Bool)

(declare-fun e!750812 () Bool)

(declare-fun e!750810 () Bool)

(assert (=> b!1316127 (= e!750812 (and e!750810 mapRes!55213))))

(declare-fun condMapEmpty!55213 () Bool)

(declare-fun mapDefault!55213 () ValueCell!16963)

