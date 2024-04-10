; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111134 () Bool)

(assert start!111134)

(declare-fun b_free!29969 () Bool)

(declare-fun b_next!29969 () Bool)

(assert (=> start!111134 (= b_free!29969 (not b_next!29969))))

(declare-fun tp!105228 () Bool)

(declare-fun b_and!48177 () Bool)

(assert (=> start!111134 (= tp!105228 b_and!48177)))

(declare-fun b!1315838 () Bool)

(declare-fun res!873525 () Bool)

(declare-fun e!750629 () Bool)

(assert (=> b!1315838 (=> (not res!873525) (not e!750629))))

(declare-datatypes ((array!88358 0))(
  ( (array!88359 (arr!42659 (Array (_ BitVec 32) (_ BitVec 64))) (size!43209 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88358)

(declare-datatypes ((List!30263 0))(
  ( (Nil!30260) (Cons!30259 (h!31468 (_ BitVec 64)) (t!43869 List!30263)) )
))
(declare-fun arrayNoDuplicates!0 (array!88358 (_ BitVec 32) List!30263) Bool)

(assert (=> b!1315838 (= res!873525 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30260))))

(declare-fun res!873524 () Bool)

(assert (=> start!111134 (=> (not res!873524) (not e!750629))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111134 (= res!873524 (validMask!0 mask!2040))))

(assert (=> start!111134 e!750629))

(assert (=> start!111134 tp!105228))

(declare-fun array_inv!32219 (array!88358) Bool)

(assert (=> start!111134 (array_inv!32219 _keys!1628)))

(assert (=> start!111134 true))

(declare-fun tp_is_empty!35699 () Bool)

(assert (=> start!111134 tp_is_empty!35699))

(declare-datatypes ((V!52701 0))(
  ( (V!52702 (val!17924 Int)) )
))
(declare-datatypes ((ValueCell!16951 0))(
  ( (ValueCellFull!16951 (v!20551 V!52701)) (EmptyCell!16951) )
))
(declare-datatypes ((array!88360 0))(
  ( (array!88361 (arr!42660 (Array (_ BitVec 32) ValueCell!16951)) (size!43210 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88360)

(declare-fun e!750628 () Bool)

(declare-fun array_inv!32220 (array!88360) Bool)

(assert (=> start!111134 (and (array_inv!32220 _values!1354) e!750628)))

(declare-fun b!1315839 () Bool)

(declare-fun res!873522 () Bool)

(assert (=> b!1315839 (=> (not res!873522) (not e!750629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88358 (_ BitVec 32)) Bool)

(assert (=> b!1315839 (= res!873522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315840 () Bool)

(declare-fun e!750632 () Bool)

(assert (=> b!1315840 (= e!750632 tp_is_empty!35699)))

(declare-fun b!1315841 () Bool)

(assert (=> b!1315841 (= e!750629 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585963 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52701)

(declare-fun zeroValue!1296 () V!52701)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23126 0))(
  ( (tuple2!23127 (_1!11574 (_ BitVec 64)) (_2!11574 V!52701)) )
))
(declare-datatypes ((List!30264 0))(
  ( (Nil!30261) (Cons!30260 (h!31469 tuple2!23126) (t!43870 List!30264)) )
))
(declare-datatypes ((ListLongMap!20783 0))(
  ( (ListLongMap!20784 (toList!10407 List!30264)) )
))
(declare-fun contains!8557 (ListLongMap!20783 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5420 (array!88358 array!88360 (_ BitVec 32) (_ BitVec 32) V!52701 V!52701 (_ BitVec 32) Int) ListLongMap!20783)

(assert (=> b!1315841 (= lt!585963 (contains!8557 (getCurrentListMap!5420 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1315842 () Bool)

(declare-fun res!873523 () Bool)

(assert (=> b!1315842 (=> (not res!873523) (not e!750629))))

(assert (=> b!1315842 (= res!873523 (and (= (size!43210 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43209 _keys!1628) (size!43210 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315843 () Bool)

(declare-fun res!873521 () Bool)

(assert (=> b!1315843 (=> (not res!873521) (not e!750629))))

(assert (=> b!1315843 (= res!873521 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43209 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315844 () Bool)

(declare-fun e!750631 () Bool)

(assert (=> b!1315844 (= e!750631 tp_is_empty!35699)))

(declare-fun mapIsEmpty!55177 () Bool)

(declare-fun mapRes!55177 () Bool)

(assert (=> mapIsEmpty!55177 mapRes!55177))

(declare-fun b!1315845 () Bool)

(assert (=> b!1315845 (= e!750628 (and e!750631 mapRes!55177))))

(declare-fun condMapEmpty!55177 () Bool)

(declare-fun mapDefault!55177 () ValueCell!16951)

