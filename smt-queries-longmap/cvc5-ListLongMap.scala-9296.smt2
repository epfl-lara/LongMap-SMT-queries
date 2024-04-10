; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111124 () Bool)

(assert start!111124)

(declare-fun b_free!29959 () Bool)

(declare-fun b_next!29959 () Bool)

(assert (=> start!111124 (= b_free!29959 (not b_next!29959))))

(declare-fun tp!105198 () Bool)

(declare-fun b_and!48167 () Bool)

(assert (=> start!111124 (= tp!105198 b_and!48167)))

(declare-fun mapNonEmpty!55162 () Bool)

(declare-fun mapRes!55162 () Bool)

(declare-fun tp!105199 () Bool)

(declare-fun e!750553 () Bool)

(assert (=> mapNonEmpty!55162 (= mapRes!55162 (and tp!105199 e!750553))))

(declare-datatypes ((V!52689 0))(
  ( (V!52690 (val!17919 Int)) )
))
(declare-datatypes ((ValueCell!16946 0))(
  ( (ValueCellFull!16946 (v!20546 V!52689)) (EmptyCell!16946) )
))
(declare-fun mapRest!55162 () (Array (_ BitVec 32) ValueCell!16946))

(declare-fun mapKey!55162 () (_ BitVec 32))

(declare-datatypes ((array!88338 0))(
  ( (array!88339 (arr!42649 (Array (_ BitVec 32) ValueCell!16946)) (size!43199 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88338)

(declare-fun mapValue!55162 () ValueCell!16946)

(assert (=> mapNonEmpty!55162 (= (arr!42649 _values!1354) (store mapRest!55162 mapKey!55162 mapValue!55162))))

(declare-fun b!1315718 () Bool)

(declare-fun e!750557 () Bool)

(declare-fun tp_is_empty!35689 () Bool)

(assert (=> b!1315718 (= e!750557 tp_is_empty!35689)))

(declare-fun b!1315719 () Bool)

(declare-fun res!873449 () Bool)

(declare-fun e!750556 () Bool)

(assert (=> b!1315719 (=> (not res!873449) (not e!750556))))

(declare-datatypes ((array!88340 0))(
  ( (array!88341 (arr!42650 (Array (_ BitVec 32) (_ BitVec 64))) (size!43200 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88340)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315719 (= res!873449 (and (= (size!43199 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43200 _keys!1628) (size!43199 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315720 () Bool)

(assert (=> b!1315720 (= e!750553 tp_is_empty!35689)))

(declare-fun b!1315721 () Bool)

(declare-fun res!873448 () Bool)

(assert (=> b!1315721 (=> (not res!873448) (not e!750556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88340 (_ BitVec 32)) Bool)

(assert (=> b!1315721 (= res!873448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315722 () Bool)

(declare-fun res!873450 () Bool)

(assert (=> b!1315722 (=> (not res!873450) (not e!750556))))

(declare-datatypes ((List!30255 0))(
  ( (Nil!30252) (Cons!30251 (h!31460 (_ BitVec 64)) (t!43861 List!30255)) )
))
(declare-fun arrayNoDuplicates!0 (array!88340 (_ BitVec 32) List!30255) Bool)

(assert (=> b!1315722 (= res!873450 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30252))))

(declare-fun res!873446 () Bool)

(assert (=> start!111124 (=> (not res!873446) (not e!750556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111124 (= res!873446 (validMask!0 mask!2040))))

(assert (=> start!111124 e!750556))

(assert (=> start!111124 tp!105198))

(declare-fun array_inv!32211 (array!88340) Bool)

(assert (=> start!111124 (array_inv!32211 _keys!1628)))

(assert (=> start!111124 true))

(assert (=> start!111124 tp_is_empty!35689))

(declare-fun e!750554 () Bool)

(declare-fun array_inv!32212 (array!88338) Bool)

(assert (=> start!111124 (and (array_inv!32212 _values!1354) e!750554)))

(declare-fun mapIsEmpty!55162 () Bool)

(assert (=> mapIsEmpty!55162 mapRes!55162))

(declare-fun b!1315723 () Bool)

(assert (=> b!1315723 (= e!750554 (and e!750557 mapRes!55162))))

(declare-fun condMapEmpty!55162 () Bool)

(declare-fun mapDefault!55162 () ValueCell!16946)

