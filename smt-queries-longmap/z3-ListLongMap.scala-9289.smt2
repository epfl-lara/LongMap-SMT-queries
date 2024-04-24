; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111306 () Bool)

(assert start!111306)

(declare-fun b_free!29917 () Bool)

(declare-fun b_next!29917 () Bool)

(assert (=> start!111306 (= b_free!29917 (not b_next!29917))))

(declare-fun tp!105073 () Bool)

(declare-fun b_and!48127 () Bool)

(assert (=> start!111306 (= tp!105073 b_and!48127)))

(declare-fun b!1316485 () Bool)

(declare-fun res!873622 () Bool)

(declare-fun e!751081 () Bool)

(assert (=> b!1316485 (=> (not res!873622) (not e!751081))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52633 0))(
  ( (V!52634 (val!17898 Int)) )
))
(declare-fun minValue!1296 () V!52633)

(declare-datatypes ((ValueCell!16925 0))(
  ( (ValueCellFull!16925 (v!20520 V!52633)) (EmptyCell!16925) )
))
(declare-datatypes ((array!88315 0))(
  ( (array!88316 (arr!42633 (Array (_ BitVec 32) ValueCell!16925)) (size!43184 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88315)

(declare-fun zeroValue!1296 () V!52633)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((array!88317 0))(
  ( (array!88318 (arr!42634 (Array (_ BitVec 32) (_ BitVec 64))) (size!43185 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88317)

(declare-datatypes ((tuple2!23112 0))(
  ( (tuple2!23113 (_1!11567 (_ BitVec 64)) (_2!11567 V!52633)) )
))
(declare-datatypes ((List!30257 0))(
  ( (Nil!30254) (Cons!30253 (h!31471 tuple2!23112) (t!43855 List!30257)) )
))
(declare-datatypes ((ListLongMap!20777 0))(
  ( (ListLongMap!20778 (toList!10404 List!30257)) )
))
(declare-fun contains!8566 (ListLongMap!20777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5408 (array!88317 array!88315 (_ BitVec 32) (_ BitVec 32) V!52633 V!52633 (_ BitVec 32) Int) ListLongMap!20777)

(assert (=> b!1316485 (= res!873622 (contains!8566 (getCurrentListMap!5408 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!55099 () Bool)

(declare-fun mapRes!55099 () Bool)

(assert (=> mapIsEmpty!55099 mapRes!55099))

(declare-fun b!1316486 () Bool)

(declare-fun e!751084 () Bool)

(declare-fun e!751083 () Bool)

(assert (=> b!1316486 (= e!751084 (and e!751083 mapRes!55099))))

(declare-fun condMapEmpty!55099 () Bool)

(declare-fun mapDefault!55099 () ValueCell!16925)

(assert (=> b!1316486 (= condMapEmpty!55099 (= (arr!42633 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16925)) mapDefault!55099)))))

(declare-fun b!1316487 () Bool)

(declare-fun res!873629 () Bool)

(assert (=> b!1316487 (=> (not res!873629) (not e!751081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316487 (= res!873629 (validKeyInArray!0 (select (arr!42634 _keys!1628) from!2020)))))

(declare-fun b!1316488 () Bool)

(declare-fun res!873626 () Bool)

(assert (=> b!1316488 (=> (not res!873626) (not e!751081))))

(declare-datatypes ((List!30258 0))(
  ( (Nil!30255) (Cons!30254 (h!31472 (_ BitVec 64)) (t!43856 List!30258)) )
))
(declare-fun arrayNoDuplicates!0 (array!88317 (_ BitVec 32) List!30258) Bool)

(assert (=> b!1316488 (= res!873626 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30255))))

(declare-fun b!1316489 () Bool)

(declare-fun e!751082 () Bool)

(declare-fun tp_is_empty!35647 () Bool)

(assert (=> b!1316489 (= e!751082 tp_is_empty!35647)))

(declare-fun b!1316490 () Bool)

(assert (=> b!1316490 (= e!751083 tp_is_empty!35647)))

(declare-fun res!873625 () Bool)

(assert (=> start!111306 (=> (not res!873625) (not e!751081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111306 (= res!873625 (validMask!0 mask!2040))))

(assert (=> start!111306 e!751081))

(assert (=> start!111306 tp!105073))

(declare-fun array_inv!32465 (array!88317) Bool)

(assert (=> start!111306 (array_inv!32465 _keys!1628)))

(assert (=> start!111306 true))

(assert (=> start!111306 tp_is_empty!35647))

(declare-fun array_inv!32466 (array!88315) Bool)

(assert (=> start!111306 (and (array_inv!32466 _values!1354) e!751084)))

(declare-fun b!1316491 () Bool)

(declare-fun res!873621 () Bool)

(assert (=> b!1316491 (=> (not res!873621) (not e!751081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88317 (_ BitVec 32)) Bool)

(assert (=> b!1316491 (= res!873621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316492 () Bool)

(assert (=> b!1316492 (= e!751081 (not true))))

(assert (=> b!1316492 (contains!8566 (getCurrentListMap!5408 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43357 0))(
  ( (Unit!43358) )
))
(declare-fun lt!586361 () Unit!43357)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!22 (array!88317 array!88315 (_ BitVec 32) (_ BitVec 32) V!52633 V!52633 (_ BitVec 64) (_ BitVec 32) Int) Unit!43357)

(assert (=> b!1316492 (= lt!586361 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!22 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1316493 () Bool)

(declare-fun res!873623 () Bool)

(assert (=> b!1316493 (=> (not res!873623) (not e!751081))))

(assert (=> b!1316493 (= res!873623 (not (= (select (arr!42634 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapNonEmpty!55099 () Bool)

(declare-fun tp!105072 () Bool)

(assert (=> mapNonEmpty!55099 (= mapRes!55099 (and tp!105072 e!751082))))

(declare-fun mapKey!55099 () (_ BitVec 32))

(declare-fun mapValue!55099 () ValueCell!16925)

(declare-fun mapRest!55099 () (Array (_ BitVec 32) ValueCell!16925))

(assert (=> mapNonEmpty!55099 (= (arr!42633 _values!1354) (store mapRest!55099 mapKey!55099 mapValue!55099))))

(declare-fun b!1316494 () Bool)

(declare-fun res!873627 () Bool)

(assert (=> b!1316494 (=> (not res!873627) (not e!751081))))

(assert (=> b!1316494 (= res!873627 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43185 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316495 () Bool)

(declare-fun res!873628 () Bool)

(assert (=> b!1316495 (=> (not res!873628) (not e!751081))))

(assert (=> b!1316495 (= res!873628 (and (= (size!43184 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43185 _keys!1628) (size!43184 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316496 () Bool)

(declare-fun res!873624 () Bool)

(assert (=> b!1316496 (=> (not res!873624) (not e!751081))))

(assert (=> b!1316496 (= res!873624 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!111306 res!873625) b!1316495))

(assert (= (and b!1316495 res!873628) b!1316491))

(assert (= (and b!1316491 res!873621) b!1316488))

(assert (= (and b!1316488 res!873626) b!1316494))

(assert (= (and b!1316494 res!873627) b!1316485))

(assert (= (and b!1316485 res!873622) b!1316493))

(assert (= (and b!1316493 res!873623) b!1316487))

(assert (= (and b!1316487 res!873629) b!1316496))

(assert (= (and b!1316496 res!873624) b!1316492))

(assert (= (and b!1316486 condMapEmpty!55099) mapIsEmpty!55099))

(assert (= (and b!1316486 (not condMapEmpty!55099)) mapNonEmpty!55099))

(get-info :version)

(assert (= (and mapNonEmpty!55099 ((_ is ValueCellFull!16925) mapValue!55099)) b!1316489))

(assert (= (and b!1316486 ((_ is ValueCellFull!16925) mapDefault!55099)) b!1316490))

(assert (= start!111306 b!1316486))

(declare-fun m!1205051 () Bool)

(assert (=> b!1316491 m!1205051))

(declare-fun m!1205053 () Bool)

(assert (=> b!1316493 m!1205053))

(declare-fun m!1205055 () Bool)

(assert (=> b!1316492 m!1205055))

(assert (=> b!1316492 m!1205055))

(declare-fun m!1205057 () Bool)

(assert (=> b!1316492 m!1205057))

(declare-fun m!1205059 () Bool)

(assert (=> b!1316492 m!1205059))

(declare-fun m!1205061 () Bool)

(assert (=> mapNonEmpty!55099 m!1205061))

(declare-fun m!1205063 () Bool)

(assert (=> start!111306 m!1205063))

(declare-fun m!1205065 () Bool)

(assert (=> start!111306 m!1205065))

(declare-fun m!1205067 () Bool)

(assert (=> start!111306 m!1205067))

(declare-fun m!1205069 () Bool)

(assert (=> b!1316485 m!1205069))

(assert (=> b!1316485 m!1205069))

(declare-fun m!1205071 () Bool)

(assert (=> b!1316485 m!1205071))

(declare-fun m!1205073 () Bool)

(assert (=> b!1316488 m!1205073))

(assert (=> b!1316487 m!1205053))

(assert (=> b!1316487 m!1205053))

(declare-fun m!1205075 () Bool)

(assert (=> b!1316487 m!1205075))

(check-sat tp_is_empty!35647 (not b!1316492) (not b!1316485) (not b_next!29917) (not b!1316488) (not start!111306) (not b!1316491) (not b!1316487) (not mapNonEmpty!55099) b_and!48127)
(check-sat b_and!48127 (not b_next!29917))
