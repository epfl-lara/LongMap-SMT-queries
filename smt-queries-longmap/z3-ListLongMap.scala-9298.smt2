; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111136 () Bool)

(assert start!111136)

(declare-fun b_free!29971 () Bool)

(declare-fun b_next!29971 () Bool)

(assert (=> start!111136 (= b_free!29971 (not b_next!29971))))

(declare-fun tp!105236 () Bool)

(declare-fun b_and!48161 () Bool)

(assert (=> start!111136 (= tp!105236 b_and!48161)))

(declare-fun b!1315792 () Bool)

(declare-fun res!873511 () Bool)

(declare-fun e!750614 () Bool)

(assert (=> b!1315792 (=> (not res!873511) (not e!750614))))

(declare-datatypes ((array!88273 0))(
  ( (array!88274 (arr!42617 (Array (_ BitVec 32) (_ BitVec 64))) (size!43169 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88273)

(declare-datatypes ((List!30326 0))(
  ( (Nil!30323) (Cons!30322 (h!31531 (_ BitVec 64)) (t!43924 List!30326)) )
))
(declare-fun arrayNoDuplicates!0 (array!88273 (_ BitVec 32) List!30326) Bool)

(assert (=> b!1315792 (= res!873511 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30323))))

(declare-fun res!873510 () Bool)

(assert (=> start!111136 (=> (not res!873510) (not e!750614))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111136 (= res!873510 (validMask!0 mask!2040))))

(assert (=> start!111136 e!750614))

(assert (=> start!111136 tp!105236))

(declare-fun array_inv!32369 (array!88273) Bool)

(assert (=> start!111136 (array_inv!32369 _keys!1628)))

(assert (=> start!111136 true))

(declare-fun tp_is_empty!35701 () Bool)

(assert (=> start!111136 tp_is_empty!35701))

(declare-datatypes ((V!52705 0))(
  ( (V!52706 (val!17925 Int)) )
))
(declare-datatypes ((ValueCell!16952 0))(
  ( (ValueCellFull!16952 (v!20551 V!52705)) (EmptyCell!16952) )
))
(declare-datatypes ((array!88275 0))(
  ( (array!88276 (arr!42618 (Array (_ BitVec 32) ValueCell!16952)) (size!43170 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88275)

(declare-fun e!750612 () Bool)

(declare-fun array_inv!32370 (array!88275) Bool)

(assert (=> start!111136 (and (array_inv!32370 _values!1354) e!750612)))

(declare-fun b!1315793 () Bool)

(declare-fun res!873508 () Bool)

(assert (=> b!1315793 (=> (not res!873508) (not e!750614))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315793 (= res!873508 (and (= (size!43170 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43169 _keys!1628) (size!43170 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315794 () Bool)

(declare-fun e!750613 () Bool)

(declare-fun mapRes!55180 () Bool)

(assert (=> b!1315794 (= e!750612 (and e!750613 mapRes!55180))))

(declare-fun condMapEmpty!55180 () Bool)

(declare-fun mapDefault!55180 () ValueCell!16952)

(assert (=> b!1315794 (= condMapEmpty!55180 (= (arr!42618 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16952)) mapDefault!55180)))))

(declare-fun mapNonEmpty!55180 () Bool)

(declare-fun tp!105235 () Bool)

(declare-fun e!750611 () Bool)

(assert (=> mapNonEmpty!55180 (= mapRes!55180 (and tp!105235 e!750611))))

(declare-fun mapValue!55180 () ValueCell!16952)

(declare-fun mapKey!55180 () (_ BitVec 32))

(declare-fun mapRest!55180 () (Array (_ BitVec 32) ValueCell!16952))

(assert (=> mapNonEmpty!55180 (= (arr!42618 _values!1354) (store mapRest!55180 mapKey!55180 mapValue!55180))))

(declare-fun b!1315795 () Bool)

(assert (=> b!1315795 (= e!750614 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52705)

(declare-fun zeroValue!1296 () V!52705)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585780 () Bool)

(declare-datatypes ((tuple2!23210 0))(
  ( (tuple2!23211 (_1!11616 (_ BitVec 64)) (_2!11616 V!52705)) )
))
(declare-datatypes ((List!30327 0))(
  ( (Nil!30324) (Cons!30323 (h!31532 tuple2!23210) (t!43925 List!30327)) )
))
(declare-datatypes ((ListLongMap!20867 0))(
  ( (ListLongMap!20868 (toList!10449 List!30327)) )
))
(declare-fun contains!8526 (ListLongMap!20867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5344 (array!88273 array!88275 (_ BitVec 32) (_ BitVec 32) V!52705 V!52705 (_ BitVec 32) Int) ListLongMap!20867)

(assert (=> b!1315795 (= lt!585780 (contains!8526 (getCurrentListMap!5344 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315796 () Bool)

(declare-fun res!873509 () Bool)

(assert (=> b!1315796 (=> (not res!873509) (not e!750614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88273 (_ BitVec 32)) Bool)

(assert (=> b!1315796 (= res!873509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315797 () Bool)

(declare-fun res!873507 () Bool)

(assert (=> b!1315797 (=> (not res!873507) (not e!750614))))

(assert (=> b!1315797 (= res!873507 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43169 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55180 () Bool)

(assert (=> mapIsEmpty!55180 mapRes!55180))

(declare-fun b!1315798 () Bool)

(assert (=> b!1315798 (= e!750613 tp_is_empty!35701)))

(declare-fun b!1315799 () Bool)

(assert (=> b!1315799 (= e!750611 tp_is_empty!35701)))

(assert (= (and start!111136 res!873510) b!1315793))

(assert (= (and b!1315793 res!873508) b!1315796))

(assert (= (and b!1315796 res!873509) b!1315792))

(assert (= (and b!1315792 res!873511) b!1315797))

(assert (= (and b!1315797 res!873507) b!1315795))

(assert (= (and b!1315794 condMapEmpty!55180) mapIsEmpty!55180))

(assert (= (and b!1315794 (not condMapEmpty!55180)) mapNonEmpty!55180))

(get-info :version)

(assert (= (and mapNonEmpty!55180 ((_ is ValueCellFull!16952) mapValue!55180)) b!1315799))

(assert (= (and b!1315794 ((_ is ValueCellFull!16952) mapDefault!55180)) b!1315798))

(assert (= start!111136 b!1315794))

(declare-fun m!1203399 () Bool)

(assert (=> b!1315796 m!1203399))

(declare-fun m!1203401 () Bool)

(assert (=> mapNonEmpty!55180 m!1203401))

(declare-fun m!1203403 () Bool)

(assert (=> start!111136 m!1203403))

(declare-fun m!1203405 () Bool)

(assert (=> start!111136 m!1203405))

(declare-fun m!1203407 () Bool)

(assert (=> start!111136 m!1203407))

(declare-fun m!1203409 () Bool)

(assert (=> b!1315795 m!1203409))

(assert (=> b!1315795 m!1203409))

(declare-fun m!1203411 () Bool)

(assert (=> b!1315795 m!1203411))

(declare-fun m!1203413 () Bool)

(assert (=> b!1315792 m!1203413))

(check-sat b_and!48161 (not b!1315792) (not mapNonEmpty!55180) (not b!1315795) (not b!1315796) (not start!111136) tp_is_empty!35701 (not b_next!29971))
(check-sat b_and!48161 (not b_next!29971))
