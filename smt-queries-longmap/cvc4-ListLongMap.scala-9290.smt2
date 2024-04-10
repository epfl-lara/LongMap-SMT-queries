; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111092 () Bool)

(assert start!111092)

(declare-fun b_free!29927 () Bool)

(declare-fun b_next!29927 () Bool)

(assert (=> start!111092 (= b_free!29927 (not b_next!29927))))

(declare-fun tp!105102 () Bool)

(declare-fun b_and!48135 () Bool)

(assert (=> start!111092 (= tp!105102 b_and!48135)))

(declare-fun res!873210 () Bool)

(declare-fun e!750317 () Bool)

(assert (=> start!111092 (=> (not res!873210) (not e!750317))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111092 (= res!873210 (validMask!0 mask!2040))))

(assert (=> start!111092 e!750317))

(assert (=> start!111092 tp!105102))

(declare-datatypes ((array!88278 0))(
  ( (array!88279 (arr!42619 (Array (_ BitVec 32) (_ BitVec 64))) (size!43169 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88278)

(declare-fun array_inv!32189 (array!88278) Bool)

(assert (=> start!111092 (array_inv!32189 _keys!1628)))

(assert (=> start!111092 true))

(declare-fun tp_is_empty!35657 () Bool)

(assert (=> start!111092 tp_is_empty!35657))

(declare-datatypes ((V!52645 0))(
  ( (V!52646 (val!17903 Int)) )
))
(declare-datatypes ((ValueCell!16930 0))(
  ( (ValueCellFull!16930 (v!20530 V!52645)) (EmptyCell!16930) )
))
(declare-datatypes ((array!88280 0))(
  ( (array!88281 (arr!42620 (Array (_ BitVec 32) ValueCell!16930)) (size!43170 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88280)

(declare-fun e!750314 () Bool)

(declare-fun array_inv!32190 (array!88280) Bool)

(assert (=> start!111092 (and (array_inv!32190 _values!1354) e!750314)))

(declare-fun mapNonEmpty!55114 () Bool)

(declare-fun mapRes!55114 () Bool)

(declare-fun tp!105103 () Bool)

(declare-fun e!750315 () Bool)

(assert (=> mapNonEmpty!55114 (= mapRes!55114 (and tp!105103 e!750315))))

(declare-fun mapKey!55114 () (_ BitVec 32))

(declare-fun mapRest!55114 () (Array (_ BitVec 32) ValueCell!16930))

(declare-fun mapValue!55114 () ValueCell!16930)

(assert (=> mapNonEmpty!55114 (= (arr!42620 _values!1354) (store mapRest!55114 mapKey!55114 mapValue!55114))))

(declare-fun b!1315334 () Bool)

(declare-fun res!873207 () Bool)

(assert (=> b!1315334 (=> (not res!873207) (not e!750317))))

(declare-datatypes ((List!30231 0))(
  ( (Nil!30228) (Cons!30227 (h!31436 (_ BitVec 64)) (t!43837 List!30231)) )
))
(declare-fun arrayNoDuplicates!0 (array!88278 (_ BitVec 32) List!30231) Bool)

(assert (=> b!1315334 (= res!873207 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30228))))

(declare-fun b!1315335 () Bool)

(declare-fun res!873208 () Bool)

(assert (=> b!1315335 (=> (not res!873208) (not e!750317))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315335 (= res!873208 (and (= (size!43170 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43169 _keys!1628) (size!43170 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315336 () Bool)

(assert (=> b!1315336 (= e!750317 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585900 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun zeroValue!1296 () V!52645)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52645)

(declare-datatypes ((tuple2!23096 0))(
  ( (tuple2!23097 (_1!11559 (_ BitVec 64)) (_2!11559 V!52645)) )
))
(declare-datatypes ((List!30232 0))(
  ( (Nil!30229) (Cons!30228 (h!31437 tuple2!23096) (t!43838 List!30232)) )
))
(declare-datatypes ((ListLongMap!20753 0))(
  ( (ListLongMap!20754 (toList!10392 List!30232)) )
))
(declare-fun contains!8542 (ListLongMap!20753 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5405 (array!88278 array!88280 (_ BitVec 32) (_ BitVec 32) V!52645 V!52645 (_ BitVec 32) Int) ListLongMap!20753)

(assert (=> b!1315336 (= lt!585900 (contains!8542 (getCurrentListMap!5405 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapIsEmpty!55114 () Bool)

(assert (=> mapIsEmpty!55114 mapRes!55114))

(declare-fun b!1315337 () Bool)

(declare-fun e!750313 () Bool)

(assert (=> b!1315337 (= e!750314 (and e!750313 mapRes!55114))))

(declare-fun condMapEmpty!55114 () Bool)

(declare-fun mapDefault!55114 () ValueCell!16930)

