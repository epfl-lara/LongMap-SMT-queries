; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111336 () Bool)

(assert start!111336)

(declare-fun b_free!29947 () Bool)

(declare-fun b_next!29947 () Bool)

(assert (=> start!111336 (= b_free!29947 (not b_next!29947))))

(declare-fun tp!105163 () Bool)

(declare-fun b_and!48157 () Bool)

(assert (=> start!111336 (= tp!105163 b_and!48157)))

(declare-fun b!1316873 () Bool)

(declare-fun e!751307 () Bool)

(declare-fun e!751310 () Bool)

(declare-fun mapRes!55144 () Bool)

(assert (=> b!1316873 (= e!751307 (and e!751310 mapRes!55144))))

(declare-fun condMapEmpty!55144 () Bool)

(declare-datatypes ((V!52673 0))(
  ( (V!52674 (val!17913 Int)) )
))
(declare-datatypes ((ValueCell!16940 0))(
  ( (ValueCellFull!16940 (v!20535 V!52673)) (EmptyCell!16940) )
))
(declare-datatypes ((array!88373 0))(
  ( (array!88374 (arr!42662 (Array (_ BitVec 32) ValueCell!16940)) (size!43213 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88373)

(declare-fun mapDefault!55144 () ValueCell!16940)

(assert (=> b!1316873 (= condMapEmpty!55144 (= (arr!42662 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16940)) mapDefault!55144)))))

(declare-fun b!1316874 () Bool)

(declare-fun res!873874 () Bool)

(declare-fun e!751308 () Bool)

(assert (=> b!1316874 (=> (not res!873874) (not e!751308))))

(declare-datatypes ((array!88375 0))(
  ( (array!88376 (arr!42663 (Array (_ BitVec 32) (_ BitVec 64))) (size!43214 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88375)

(declare-datatypes ((List!30278 0))(
  ( (Nil!30275) (Cons!30274 (h!31492 (_ BitVec 64)) (t!43876 List!30278)) )
))
(declare-fun arrayNoDuplicates!0 (array!88375 (_ BitVec 32) List!30278) Bool)

(assert (=> b!1316874 (= res!873874 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30275))))

(declare-fun b!1316875 () Bool)

(declare-fun tp_is_empty!35677 () Bool)

(assert (=> b!1316875 (= e!751310 tp_is_empty!35677)))

(declare-fun b!1316876 () Bool)

(declare-fun res!873875 () Bool)

(assert (=> b!1316876 (=> (not res!873875) (not e!751308))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316876 (= res!873875 (and (= (size!43213 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43214 _keys!1628) (size!43213 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316877 () Bool)

(assert (=> b!1316877 (= e!751308 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52673)

(declare-fun zeroValue!1296 () V!52673)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!586406 () Bool)

(declare-datatypes ((tuple2!23132 0))(
  ( (tuple2!23133 (_1!11577 (_ BitVec 64)) (_2!11577 V!52673)) )
))
(declare-datatypes ((List!30279 0))(
  ( (Nil!30276) (Cons!30275 (h!31493 tuple2!23132) (t!43877 List!30279)) )
))
(declare-datatypes ((ListLongMap!20797 0))(
  ( (ListLongMap!20798 (toList!10414 List!30279)) )
))
(declare-fun contains!8576 (ListLongMap!20797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5418 (array!88375 array!88373 (_ BitVec 32) (_ BitVec 32) V!52673 V!52673 (_ BitVec 32) Int) ListLongMap!20797)

(assert (=> b!1316877 (= lt!586406 (contains!8576 (getCurrentListMap!5418 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316878 () Bool)

(declare-fun res!873878 () Bool)

(assert (=> b!1316878 (=> (not res!873878) (not e!751308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88375 (_ BitVec 32)) Bool)

(assert (=> b!1316878 (= res!873878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316879 () Bool)

(declare-fun res!873876 () Bool)

(assert (=> b!1316879 (=> (not res!873876) (not e!751308))))

(assert (=> b!1316879 (= res!873876 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43214 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!873877 () Bool)

(assert (=> start!111336 (=> (not res!873877) (not e!751308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111336 (= res!873877 (validMask!0 mask!2040))))

(assert (=> start!111336 e!751308))

(assert (=> start!111336 tp!105163))

(declare-fun array_inv!32489 (array!88375) Bool)

(assert (=> start!111336 (array_inv!32489 _keys!1628)))

(assert (=> start!111336 true))

(assert (=> start!111336 tp_is_empty!35677))

(declare-fun array_inv!32490 (array!88373) Bool)

(assert (=> start!111336 (and (array_inv!32490 _values!1354) e!751307)))

(declare-fun mapNonEmpty!55144 () Bool)

(declare-fun tp!105162 () Bool)

(declare-fun e!751306 () Bool)

(assert (=> mapNonEmpty!55144 (= mapRes!55144 (and tp!105162 e!751306))))

(declare-fun mapValue!55144 () ValueCell!16940)

(declare-fun mapKey!55144 () (_ BitVec 32))

(declare-fun mapRest!55144 () (Array (_ BitVec 32) ValueCell!16940))

(assert (=> mapNonEmpty!55144 (= (arr!42662 _values!1354) (store mapRest!55144 mapKey!55144 mapValue!55144))))

(declare-fun mapIsEmpty!55144 () Bool)

(assert (=> mapIsEmpty!55144 mapRes!55144))

(declare-fun b!1316880 () Bool)

(assert (=> b!1316880 (= e!751306 tp_is_empty!35677)))

(assert (= (and start!111336 res!873877) b!1316876))

(assert (= (and b!1316876 res!873875) b!1316878))

(assert (= (and b!1316878 res!873878) b!1316874))

(assert (= (and b!1316874 res!873874) b!1316879))

(assert (= (and b!1316879 res!873876) b!1316877))

(assert (= (and b!1316873 condMapEmpty!55144) mapIsEmpty!55144))

(assert (= (and b!1316873 (not condMapEmpty!55144)) mapNonEmpty!55144))

(get-info :version)

(assert (= (and mapNonEmpty!55144 ((_ is ValueCellFull!16940) mapValue!55144)) b!1316880))

(assert (= (and b!1316873 ((_ is ValueCellFull!16940) mapDefault!55144)) b!1316875))

(assert (= start!111336 b!1316873))

(declare-fun m!1205321 () Bool)

(assert (=> b!1316877 m!1205321))

(assert (=> b!1316877 m!1205321))

(declare-fun m!1205323 () Bool)

(assert (=> b!1316877 m!1205323))

(declare-fun m!1205325 () Bool)

(assert (=> mapNonEmpty!55144 m!1205325))

(declare-fun m!1205327 () Bool)

(assert (=> start!111336 m!1205327))

(declare-fun m!1205329 () Bool)

(assert (=> start!111336 m!1205329))

(declare-fun m!1205331 () Bool)

(assert (=> start!111336 m!1205331))

(declare-fun m!1205333 () Bool)

(assert (=> b!1316874 m!1205333))

(declare-fun m!1205335 () Bool)

(assert (=> b!1316878 m!1205335))

(check-sat (not b!1316878) tp_is_empty!35677 b_and!48157 (not b!1316877) (not mapNonEmpty!55144) (not start!111336) (not b!1316874) (not b_next!29947))
(check-sat b_and!48157 (not b_next!29947))
