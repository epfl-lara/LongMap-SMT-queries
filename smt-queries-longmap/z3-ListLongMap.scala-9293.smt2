; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111330 () Bool)

(assert start!111330)

(declare-fun b_free!29941 () Bool)

(declare-fun b_next!29941 () Bool)

(assert (=> start!111330 (= b_free!29941 (not b_next!29941))))

(declare-fun tp!105144 () Bool)

(declare-fun b_and!48151 () Bool)

(assert (=> start!111330 (= tp!105144 b_and!48151)))

(declare-fun b!1316801 () Bool)

(declare-fun res!873829 () Bool)

(declare-fun e!751264 () Bool)

(assert (=> b!1316801 (=> (not res!873829) (not e!751264))))

(declare-datatypes ((array!88363 0))(
  ( (array!88364 (arr!42657 (Array (_ BitVec 32) (_ BitVec 64))) (size!43208 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88363)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52665 0))(
  ( (V!52666 (val!17910 Int)) )
))
(declare-datatypes ((ValueCell!16937 0))(
  ( (ValueCellFull!16937 (v!20532 V!52665)) (EmptyCell!16937) )
))
(declare-datatypes ((array!88365 0))(
  ( (array!88366 (arr!42658 (Array (_ BitVec 32) ValueCell!16937)) (size!43209 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88365)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316801 (= res!873829 (and (= (size!43209 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43208 _keys!1628) (size!43209 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316802 () Bool)

(declare-fun res!873832 () Bool)

(assert (=> b!1316802 (=> (not res!873832) (not e!751264))))

(declare-datatypes ((List!30274 0))(
  ( (Nil!30271) (Cons!30270 (h!31488 (_ BitVec 64)) (t!43872 List!30274)) )
))
(declare-fun arrayNoDuplicates!0 (array!88363 (_ BitVec 32) List!30274) Bool)

(assert (=> b!1316802 (= res!873832 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30271))))

(declare-fun b!1316803 () Bool)

(declare-fun res!873833 () Bool)

(assert (=> b!1316803 (=> (not res!873833) (not e!751264))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1316803 (= res!873833 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43208 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316804 () Bool)

(assert (=> b!1316804 (= e!751264 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52665)

(declare-fun lt!586397 () Bool)

(declare-fun zeroValue!1296 () V!52665)

(declare-datatypes ((tuple2!23128 0))(
  ( (tuple2!23129 (_1!11575 (_ BitVec 64)) (_2!11575 V!52665)) )
))
(declare-datatypes ((List!30275 0))(
  ( (Nil!30272) (Cons!30271 (h!31489 tuple2!23128) (t!43873 List!30275)) )
))
(declare-datatypes ((ListLongMap!20793 0))(
  ( (ListLongMap!20794 (toList!10412 List!30275)) )
))
(declare-fun contains!8574 (ListLongMap!20793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5416 (array!88363 array!88365 (_ BitVec 32) (_ BitVec 32) V!52665 V!52665 (_ BitVec 32) Int) ListLongMap!20793)

(assert (=> b!1316804 (= lt!586397 (contains!8574 (getCurrentListMap!5416 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316805 () Bool)

(declare-fun e!751263 () Bool)

(declare-fun e!751262 () Bool)

(declare-fun mapRes!55135 () Bool)

(assert (=> b!1316805 (= e!751263 (and e!751262 mapRes!55135))))

(declare-fun condMapEmpty!55135 () Bool)

(declare-fun mapDefault!55135 () ValueCell!16937)

(assert (=> b!1316805 (= condMapEmpty!55135 (= (arr!42658 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16937)) mapDefault!55135)))))

(declare-fun b!1316806 () Bool)

(declare-fun res!873831 () Bool)

(assert (=> b!1316806 (=> (not res!873831) (not e!751264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88363 (_ BitVec 32)) Bool)

(assert (=> b!1316806 (= res!873831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316807 () Bool)

(declare-fun e!751265 () Bool)

(declare-fun tp_is_empty!35671 () Bool)

(assert (=> b!1316807 (= e!751265 tp_is_empty!35671)))

(declare-fun res!873830 () Bool)

(assert (=> start!111330 (=> (not res!873830) (not e!751264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111330 (= res!873830 (validMask!0 mask!2040))))

(assert (=> start!111330 e!751264))

(assert (=> start!111330 tp!105144))

(declare-fun array_inv!32485 (array!88363) Bool)

(assert (=> start!111330 (array_inv!32485 _keys!1628)))

(assert (=> start!111330 true))

(assert (=> start!111330 tp_is_empty!35671))

(declare-fun array_inv!32486 (array!88365) Bool)

(assert (=> start!111330 (and (array_inv!32486 _values!1354) e!751263)))

(declare-fun mapIsEmpty!55135 () Bool)

(assert (=> mapIsEmpty!55135 mapRes!55135))

(declare-fun b!1316808 () Bool)

(assert (=> b!1316808 (= e!751262 tp_is_empty!35671)))

(declare-fun mapNonEmpty!55135 () Bool)

(declare-fun tp!105145 () Bool)

(assert (=> mapNonEmpty!55135 (= mapRes!55135 (and tp!105145 e!751265))))

(declare-fun mapValue!55135 () ValueCell!16937)

(declare-fun mapKey!55135 () (_ BitVec 32))

(declare-fun mapRest!55135 () (Array (_ BitVec 32) ValueCell!16937))

(assert (=> mapNonEmpty!55135 (= (arr!42658 _values!1354) (store mapRest!55135 mapKey!55135 mapValue!55135))))

(assert (= (and start!111330 res!873830) b!1316801))

(assert (= (and b!1316801 res!873829) b!1316806))

(assert (= (and b!1316806 res!873831) b!1316802))

(assert (= (and b!1316802 res!873832) b!1316803))

(assert (= (and b!1316803 res!873833) b!1316804))

(assert (= (and b!1316805 condMapEmpty!55135) mapIsEmpty!55135))

(assert (= (and b!1316805 (not condMapEmpty!55135)) mapNonEmpty!55135))

(get-info :version)

(assert (= (and mapNonEmpty!55135 ((_ is ValueCellFull!16937) mapValue!55135)) b!1316807))

(assert (= (and b!1316805 ((_ is ValueCellFull!16937) mapDefault!55135)) b!1316808))

(assert (= start!111330 b!1316805))

(declare-fun m!1205273 () Bool)

(assert (=> b!1316802 m!1205273))

(declare-fun m!1205275 () Bool)

(assert (=> b!1316806 m!1205275))

(declare-fun m!1205277 () Bool)

(assert (=> mapNonEmpty!55135 m!1205277))

(declare-fun m!1205279 () Bool)

(assert (=> b!1316804 m!1205279))

(assert (=> b!1316804 m!1205279))

(declare-fun m!1205281 () Bool)

(assert (=> b!1316804 m!1205281))

(declare-fun m!1205283 () Bool)

(assert (=> start!111330 m!1205283))

(declare-fun m!1205285 () Bool)

(assert (=> start!111330 m!1205285))

(declare-fun m!1205287 () Bool)

(assert (=> start!111330 m!1205287))

(check-sat tp_is_empty!35671 b_and!48151 (not b!1316802) (not mapNonEmpty!55135) (not b_next!29941) (not b!1316804) (not start!111330) (not b!1316806))
(check-sat b_and!48151 (not b_next!29941))
