; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111264 () Bool)

(assert start!111264)

(declare-fun b_free!29875 () Bool)

(declare-fun b_next!29875 () Bool)

(assert (=> start!111264 (= b_free!29875 (not b_next!29875))))

(declare-fun tp!104947 () Bool)

(declare-fun b_and!48085 () Bool)

(assert (=> start!111264 (= tp!104947 b_and!48085)))

(declare-fun b!1315973 () Bool)

(declare-fun e!750768 () Bool)

(declare-fun tp_is_empty!35605 () Bool)

(assert (=> b!1315973 (= e!750768 tp_is_empty!35605)))

(declare-fun b!1315974 () Bool)

(declare-fun e!750767 () Bool)

(assert (=> b!1315974 (= e!750767 tp_is_empty!35605)))

(declare-fun b!1315975 () Bool)

(declare-fun e!750769 () Bool)

(assert (=> b!1315975 (= e!750769 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88237 0))(
  ( (array!88238 (arr!42594 (Array (_ BitVec 32) (_ BitVec 64))) (size!43145 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88237)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52577 0))(
  ( (V!52578 (val!17877 Int)) )
))
(declare-fun minValue!1296 () V!52577)

(declare-datatypes ((ValueCell!16904 0))(
  ( (ValueCellFull!16904 (v!20499 V!52577)) (EmptyCell!16904) )
))
(declare-datatypes ((array!88239 0))(
  ( (array!88240 (arr!42595 (Array (_ BitVec 32) ValueCell!16904)) (size!43146 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88239)

(declare-fun zeroValue!1296 () V!52577)

(declare-fun lt!586298 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23084 0))(
  ( (tuple2!23085 (_1!11553 (_ BitVec 64)) (_2!11553 V!52577)) )
))
(declare-datatypes ((List!30231 0))(
  ( (Nil!30228) (Cons!30227 (h!31445 tuple2!23084) (t!43829 List!30231)) )
))
(declare-datatypes ((ListLongMap!20749 0))(
  ( (ListLongMap!20750 (toList!10390 List!30231)) )
))
(declare-fun contains!8552 (ListLongMap!20749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5394 (array!88237 array!88239 (_ BitVec 32) (_ BitVec 32) V!52577 V!52577 (_ BitVec 32) Int) ListLongMap!20749)

(assert (=> b!1315975 (= lt!586298 (contains!8552 (getCurrentListMap!5394 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315976 () Bool)

(declare-fun res!873300 () Bool)

(assert (=> b!1315976 (=> (not res!873300) (not e!750769))))

(assert (=> b!1315976 (= res!873300 (and (= (size!43146 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43145 _keys!1628) (size!43146 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55036 () Bool)

(declare-fun mapRes!55036 () Bool)

(assert (=> mapIsEmpty!55036 mapRes!55036))

(declare-fun b!1315977 () Bool)

(declare-fun e!750766 () Bool)

(assert (=> b!1315977 (= e!750766 (and e!750767 mapRes!55036))))

(declare-fun condMapEmpty!55036 () Bool)

(declare-fun mapDefault!55036 () ValueCell!16904)

(assert (=> b!1315977 (= condMapEmpty!55036 (= (arr!42595 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16904)) mapDefault!55036)))))

(declare-fun b!1315978 () Bool)

(declare-fun res!873299 () Bool)

(assert (=> b!1315978 (=> (not res!873299) (not e!750769))))

(assert (=> b!1315978 (= res!873299 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43145 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!873301 () Bool)

(assert (=> start!111264 (=> (not res!873301) (not e!750769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111264 (= res!873301 (validMask!0 mask!2040))))

(assert (=> start!111264 e!750769))

(assert (=> start!111264 tp!104947))

(declare-fun array_inv!32435 (array!88237) Bool)

(assert (=> start!111264 (array_inv!32435 _keys!1628)))

(assert (=> start!111264 true))

(assert (=> start!111264 tp_is_empty!35605))

(declare-fun array_inv!32436 (array!88239) Bool)

(assert (=> start!111264 (and (array_inv!32436 _values!1354) e!750766)))

(declare-fun b!1315979 () Bool)

(declare-fun res!873298 () Bool)

(assert (=> b!1315979 (=> (not res!873298) (not e!750769))))

(declare-datatypes ((List!30232 0))(
  ( (Nil!30229) (Cons!30228 (h!31446 (_ BitVec 64)) (t!43830 List!30232)) )
))
(declare-fun arrayNoDuplicates!0 (array!88237 (_ BitVec 32) List!30232) Bool)

(assert (=> b!1315979 (= res!873298 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30229))))

(declare-fun b!1315980 () Bool)

(declare-fun res!873302 () Bool)

(assert (=> b!1315980 (=> (not res!873302) (not e!750769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88237 (_ BitVec 32)) Bool)

(assert (=> b!1315980 (= res!873302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!55036 () Bool)

(declare-fun tp!104946 () Bool)

(assert (=> mapNonEmpty!55036 (= mapRes!55036 (and tp!104946 e!750768))))

(declare-fun mapKey!55036 () (_ BitVec 32))

(declare-fun mapValue!55036 () ValueCell!16904)

(declare-fun mapRest!55036 () (Array (_ BitVec 32) ValueCell!16904))

(assert (=> mapNonEmpty!55036 (= (arr!42595 _values!1354) (store mapRest!55036 mapKey!55036 mapValue!55036))))

(assert (= (and start!111264 res!873301) b!1315976))

(assert (= (and b!1315976 res!873300) b!1315980))

(assert (= (and b!1315980 res!873302) b!1315979))

(assert (= (and b!1315979 res!873298) b!1315978))

(assert (= (and b!1315978 res!873299) b!1315975))

(assert (= (and b!1315977 condMapEmpty!55036) mapIsEmpty!55036))

(assert (= (and b!1315977 (not condMapEmpty!55036)) mapNonEmpty!55036))

(get-info :version)

(assert (= (and mapNonEmpty!55036 ((_ is ValueCellFull!16904) mapValue!55036)) b!1315973))

(assert (= (and b!1315977 ((_ is ValueCellFull!16904) mapDefault!55036)) b!1315974))

(assert (= start!111264 b!1315977))

(declare-fun m!1204715 () Bool)

(assert (=> start!111264 m!1204715))

(declare-fun m!1204717 () Bool)

(assert (=> start!111264 m!1204717))

(declare-fun m!1204719 () Bool)

(assert (=> start!111264 m!1204719))

(declare-fun m!1204721 () Bool)

(assert (=> mapNonEmpty!55036 m!1204721))

(declare-fun m!1204723 () Bool)

(assert (=> b!1315979 m!1204723))

(declare-fun m!1204725 () Bool)

(assert (=> b!1315980 m!1204725))

(declare-fun m!1204727 () Bool)

(assert (=> b!1315975 m!1204727))

(assert (=> b!1315975 m!1204727))

(declare-fun m!1204729 () Bool)

(assert (=> b!1315975 m!1204729))

(check-sat (not mapNonEmpty!55036) tp_is_empty!35605 (not b!1315975) b_and!48085 (not b!1315979) (not start!111264) (not b_next!29875) (not b!1315980))
(check-sat b_and!48085 (not b_next!29875))
