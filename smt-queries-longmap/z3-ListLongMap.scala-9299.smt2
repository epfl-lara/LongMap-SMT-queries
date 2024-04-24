; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111366 () Bool)

(assert start!111366)

(declare-fun b_free!29977 () Bool)

(declare-fun b_next!29977 () Bool)

(assert (=> start!111366 (= b_free!29977 (not b_next!29977))))

(declare-fun tp!105253 () Bool)

(declare-fun b_and!48187 () Bool)

(assert (=> start!111366 (= tp!105253 b_and!48187)))

(declare-fun b!1317233 () Bool)

(declare-fun e!751534 () Bool)

(assert (=> b!1317233 (= e!751534 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52713 0))(
  ( (V!52714 (val!17928 Int)) )
))
(declare-fun minValue!1296 () V!52713)

(declare-datatypes ((ValueCell!16955 0))(
  ( (ValueCellFull!16955 (v!20550 V!52713)) (EmptyCell!16955) )
))
(declare-datatypes ((array!88431 0))(
  ( (array!88432 (arr!42691 (Array (_ BitVec 32) ValueCell!16955)) (size!43242 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88431)

(declare-fun zeroValue!1296 () V!52713)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!586451 () Bool)

(declare-datatypes ((array!88433 0))(
  ( (array!88434 (arr!42692 (Array (_ BitVec 32) (_ BitVec 64))) (size!43243 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88433)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((tuple2!23156 0))(
  ( (tuple2!23157 (_1!11589 (_ BitVec 64)) (_2!11589 V!52713)) )
))
(declare-datatypes ((List!30300 0))(
  ( (Nil!30297) (Cons!30296 (h!31514 tuple2!23156) (t!43898 List!30300)) )
))
(declare-datatypes ((ListLongMap!20821 0))(
  ( (ListLongMap!20822 (toList!10426 List!30300)) )
))
(declare-fun contains!8588 (ListLongMap!20821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5430 (array!88433 array!88431 (_ BitVec 32) (_ BitVec 32) V!52713 V!52713 (_ BitVec 32) Int) ListLongMap!20821)

(assert (=> b!1317233 (= lt!586451 (contains!8588 (getCurrentListMap!5430 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1317235 () Bool)

(declare-fun res!874099 () Bool)

(assert (=> b!1317235 (=> (not res!874099) (not e!751534))))

(declare-datatypes ((List!30301 0))(
  ( (Nil!30298) (Cons!30297 (h!31515 (_ BitVec 64)) (t!43899 List!30301)) )
))
(declare-fun arrayNoDuplicates!0 (array!88433 (_ BitVec 32) List!30301) Bool)

(assert (=> b!1317235 (= res!874099 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30298))))

(declare-fun b!1317236 () Bool)

(declare-fun e!751532 () Bool)

(declare-fun e!751535 () Bool)

(declare-fun mapRes!55189 () Bool)

(assert (=> b!1317236 (= e!751532 (and e!751535 mapRes!55189))))

(declare-fun condMapEmpty!55189 () Bool)

(declare-fun mapDefault!55189 () ValueCell!16955)

(assert (=> b!1317236 (= condMapEmpty!55189 (= (arr!42691 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16955)) mapDefault!55189)))))

(declare-fun b!1317237 () Bool)

(declare-fun e!751531 () Bool)

(declare-fun tp_is_empty!35707 () Bool)

(assert (=> b!1317237 (= e!751531 tp_is_empty!35707)))

(declare-fun mapNonEmpty!55189 () Bool)

(declare-fun tp!105252 () Bool)

(assert (=> mapNonEmpty!55189 (= mapRes!55189 (and tp!105252 e!751531))))

(declare-fun mapRest!55189 () (Array (_ BitVec 32) ValueCell!16955))

(declare-fun mapValue!55189 () ValueCell!16955)

(declare-fun mapKey!55189 () (_ BitVec 32))

(assert (=> mapNonEmpty!55189 (= (arr!42691 _values!1354) (store mapRest!55189 mapKey!55189 mapValue!55189))))

(declare-fun b!1317238 () Bool)

(declare-fun res!874101 () Bool)

(assert (=> b!1317238 (=> (not res!874101) (not e!751534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88433 (_ BitVec 32)) Bool)

(assert (=> b!1317238 (= res!874101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!55189 () Bool)

(assert (=> mapIsEmpty!55189 mapRes!55189))

(declare-fun b!1317239 () Bool)

(assert (=> b!1317239 (= e!751535 tp_is_empty!35707)))

(declare-fun b!1317240 () Bool)

(declare-fun res!874100 () Bool)

(assert (=> b!1317240 (=> (not res!874100) (not e!751534))))

(assert (=> b!1317240 (= res!874100 (and (= (size!43242 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43243 _keys!1628) (size!43242 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!874103 () Bool)

(assert (=> start!111366 (=> (not res!874103) (not e!751534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111366 (= res!874103 (validMask!0 mask!2040))))

(assert (=> start!111366 e!751534))

(assert (=> start!111366 tp!105253))

(declare-fun array_inv!32509 (array!88433) Bool)

(assert (=> start!111366 (array_inv!32509 _keys!1628)))

(assert (=> start!111366 true))

(assert (=> start!111366 tp_is_empty!35707))

(declare-fun array_inv!32510 (array!88431) Bool)

(assert (=> start!111366 (and (array_inv!32510 _values!1354) e!751532)))

(declare-fun b!1317234 () Bool)

(declare-fun res!874102 () Bool)

(assert (=> b!1317234 (=> (not res!874102) (not e!751534))))

(assert (=> b!1317234 (= res!874102 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43243 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111366 res!874103) b!1317240))

(assert (= (and b!1317240 res!874100) b!1317238))

(assert (= (and b!1317238 res!874101) b!1317235))

(assert (= (and b!1317235 res!874099) b!1317234))

(assert (= (and b!1317234 res!874102) b!1317233))

(assert (= (and b!1317236 condMapEmpty!55189) mapIsEmpty!55189))

(assert (= (and b!1317236 (not condMapEmpty!55189)) mapNonEmpty!55189))

(get-info :version)

(assert (= (and mapNonEmpty!55189 ((_ is ValueCellFull!16955) mapValue!55189)) b!1317237))

(assert (= (and b!1317236 ((_ is ValueCellFull!16955) mapDefault!55189)) b!1317239))

(assert (= start!111366 b!1317236))

(declare-fun m!1205561 () Bool)

(assert (=> b!1317238 m!1205561))

(declare-fun m!1205563 () Bool)

(assert (=> mapNonEmpty!55189 m!1205563))

(declare-fun m!1205565 () Bool)

(assert (=> b!1317235 m!1205565))

(declare-fun m!1205567 () Bool)

(assert (=> start!111366 m!1205567))

(declare-fun m!1205569 () Bool)

(assert (=> start!111366 m!1205569))

(declare-fun m!1205571 () Bool)

(assert (=> start!111366 m!1205571))

(declare-fun m!1205573 () Bool)

(assert (=> b!1317233 m!1205573))

(assert (=> b!1317233 m!1205573))

(declare-fun m!1205575 () Bool)

(assert (=> b!1317233 m!1205575))

(check-sat (not b!1317235) (not b!1317233) (not b!1317238) tp_is_empty!35707 (not b_next!29977) (not mapNonEmpty!55189) (not start!111366) b_and!48187)
(check-sat b_and!48187 (not b_next!29977))
