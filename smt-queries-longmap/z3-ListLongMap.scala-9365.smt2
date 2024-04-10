; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111628 () Bool)

(assert start!111628)

(declare-fun b_free!30285 () Bool)

(declare-fun b_next!30285 () Bool)

(assert (=> start!111628 (= b_free!30285 (not b_next!30285))))

(declare-fun tp!106331 () Bool)

(declare-fun b_and!48729 () Bool)

(assert (=> start!111628 (= tp!106331 b_and!48729)))

(declare-fun res!877603 () Bool)

(declare-fun e!753979 () Bool)

(assert (=> start!111628 (=> (not res!877603) (not e!753979))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111628 (= res!877603 (validMask!0 mask!2019))))

(assert (=> start!111628 e!753979))

(declare-datatypes ((array!89132 0))(
  ( (array!89133 (arr!43040 (Array (_ BitVec 32) (_ BitVec 64))) (size!43590 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89132)

(declare-fun array_inv!32495 (array!89132) Bool)

(assert (=> start!111628 (array_inv!32495 _keys!1609)))

(assert (=> start!111628 true))

(declare-fun tp_is_empty!36105 () Bool)

(assert (=> start!111628 tp_is_empty!36105))

(declare-datatypes ((V!53243 0))(
  ( (V!53244 (val!18127 Int)) )
))
(declare-datatypes ((ValueCell!17154 0))(
  ( (ValueCellFull!17154 (v!20757 V!53243)) (EmptyCell!17154) )
))
(declare-datatypes ((array!89134 0))(
  ( (array!89135 (arr!43041 (Array (_ BitVec 32) ValueCell!17154)) (size!43591 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89134)

(declare-fun e!753978 () Bool)

(declare-fun array_inv!32496 (array!89134) Bool)

(assert (=> start!111628 (and (array_inv!32496 _values!1337) e!753978)))

(assert (=> start!111628 tp!106331))

(declare-fun b!1322205 () Bool)

(declare-fun res!877602 () Bool)

(assert (=> b!1322205 (=> (not res!877602) (not e!753979))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1322205 (= res!877602 (not (= (select (arr!43040 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322206 () Bool)

(declare-fun e!753976 () Bool)

(assert (=> b!1322206 (= e!753976 tp_is_empty!36105)))

(declare-fun b!1322207 () Bool)

(declare-fun e!753975 () Bool)

(assert (=> b!1322207 (= e!753975 tp_is_empty!36105)))

(declare-fun b!1322208 () Bool)

(declare-fun res!877597 () Bool)

(assert (=> b!1322208 (=> (not res!877597) (not e!753979))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1322208 (= res!877597 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43590 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322209 () Bool)

(declare-fun res!877601 () Bool)

(assert (=> b!1322209 (=> (not res!877601) (not e!753979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89132 (_ BitVec 32)) Bool)

(assert (=> b!1322209 (= res!877601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322210 () Bool)

(declare-fun res!877600 () Bool)

(assert (=> b!1322210 (=> (not res!877600) (not e!753979))))

(assert (=> b!1322210 (= res!877600 (and (= (size!43591 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43590 _keys!1609) (size!43591 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322211 () Bool)

(declare-fun mapRes!55805 () Bool)

(assert (=> b!1322211 (= e!753978 (and e!753975 mapRes!55805))))

(declare-fun condMapEmpty!55805 () Bool)

(declare-fun mapDefault!55805 () ValueCell!17154)

(assert (=> b!1322211 (= condMapEmpty!55805 (= (arr!43041 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17154)) mapDefault!55805)))))

(declare-fun b!1322212 () Bool)

(declare-fun res!877599 () Bool)

(assert (=> b!1322212 (=> (not res!877599) (not e!753979))))

(declare-datatypes ((List!30499 0))(
  ( (Nil!30496) (Cons!30495 (h!31704 (_ BitVec 64)) (t!44333 List!30499)) )
))
(declare-fun arrayNoDuplicates!0 (array!89132 (_ BitVec 32) List!30499) Bool)

(assert (=> b!1322212 (= res!877599 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30496))))

(declare-fun mapNonEmpty!55805 () Bool)

(declare-fun tp!106330 () Bool)

(assert (=> mapNonEmpty!55805 (= mapRes!55805 (and tp!106330 e!753976))))

(declare-fun mapValue!55805 () ValueCell!17154)

(declare-fun mapKey!55805 () (_ BitVec 32))

(declare-fun mapRest!55805 () (Array (_ BitVec 32) ValueCell!17154))

(assert (=> mapNonEmpty!55805 (= (arr!43041 _values!1337) (store mapRest!55805 mapKey!55805 mapValue!55805))))

(declare-fun b!1322213 () Bool)

(declare-fun res!877604 () Bool)

(assert (=> b!1322213 (=> (not res!877604) (not e!753979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322213 (= res!877604 (validKeyInArray!0 (select (arr!43040 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55805 () Bool)

(assert (=> mapIsEmpty!55805 mapRes!55805))

(declare-fun b!1322214 () Bool)

(assert (=> b!1322214 (= e!753979 (not true))))

(declare-datatypes ((tuple2!23352 0))(
  ( (tuple2!23353 (_1!11687 (_ BitVec 64)) (_2!11687 V!53243)) )
))
(declare-datatypes ((List!30500 0))(
  ( (Nil!30497) (Cons!30496 (h!31705 tuple2!23352) (t!44334 List!30500)) )
))
(declare-datatypes ((ListLongMap!21009 0))(
  ( (ListLongMap!21010 (toList!10520 List!30500)) )
))
(declare-fun lt!587993 () ListLongMap!21009)

(declare-fun lt!587994 () tuple2!23352)

(declare-fun contains!8675 (ListLongMap!21009 (_ BitVec 64)) Bool)

(declare-fun +!4575 (ListLongMap!21009 tuple2!23352) ListLongMap!21009)

(assert (=> b!1322214 (contains!8675 (+!4575 lt!587993 lt!587994) k0!1164)))

(declare-fun zeroValue!1279 () V!53243)

(declare-datatypes ((Unit!43570 0))(
  ( (Unit!43571) )
))
(declare-fun lt!587991 () Unit!43570)

(declare-fun addStillContains!1124 (ListLongMap!21009 (_ BitVec 64) V!53243 (_ BitVec 64)) Unit!43570)

(assert (=> b!1322214 (= lt!587991 (addStillContains!1124 lt!587993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322214 (contains!8675 lt!587993 k0!1164)))

(declare-fun lt!587987 () V!53243)

(declare-fun lt!587986 () Unit!43570)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!171 ((_ BitVec 64) (_ BitVec 64) V!53243 ListLongMap!21009) Unit!43570)

(assert (=> b!1322214 (= lt!587986 (lemmaInListMapAfterAddingDiffThenInBefore!171 k0!1164 (select (arr!43040 _keys!1609) from!2000) lt!587987 lt!587993))))

(declare-fun lt!587989 () ListLongMap!21009)

(assert (=> b!1322214 (contains!8675 lt!587989 k0!1164)))

(declare-fun lt!587988 () Unit!43570)

(assert (=> b!1322214 (= lt!587988 (lemmaInListMapAfterAddingDiffThenInBefore!171 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587989))))

(declare-fun lt!587992 () ListLongMap!21009)

(assert (=> b!1322214 (contains!8675 lt!587992 k0!1164)))

(declare-fun lt!587990 () Unit!43570)

(declare-fun minValue!1279 () V!53243)

(assert (=> b!1322214 (= lt!587990 (lemmaInListMapAfterAddingDiffThenInBefore!171 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587992))))

(assert (=> b!1322214 (= lt!587992 (+!4575 lt!587989 lt!587994))))

(assert (=> b!1322214 (= lt!587994 (tuple2!23353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322214 (= lt!587989 (+!4575 lt!587993 (tuple2!23353 (select (arr!43040 _keys!1609) from!2000) lt!587987)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21661 (ValueCell!17154 V!53243) V!53243)

(declare-fun dynLambda!3514 (Int (_ BitVec 64)) V!53243)

(assert (=> b!1322214 (= lt!587987 (get!21661 (select (arr!43041 _values!1337) from!2000) (dynLambda!3514 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6210 (array!89132 array!89134 (_ BitVec 32) (_ BitVec 32) V!53243 V!53243 (_ BitVec 32) Int) ListLongMap!21009)

(assert (=> b!1322214 (= lt!587993 (getCurrentListMapNoExtraKeys!6210 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322215 () Bool)

(declare-fun res!877598 () Bool)

(assert (=> b!1322215 (=> (not res!877598) (not e!753979))))

(declare-fun getCurrentListMap!5521 (array!89132 array!89134 (_ BitVec 32) (_ BitVec 32) V!53243 V!53243 (_ BitVec 32) Int) ListLongMap!21009)

(assert (=> b!1322215 (= res!877598 (contains!8675 (getCurrentListMap!5521 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111628 res!877603) b!1322210))

(assert (= (and b!1322210 res!877600) b!1322209))

(assert (= (and b!1322209 res!877601) b!1322212))

(assert (= (and b!1322212 res!877599) b!1322208))

(assert (= (and b!1322208 res!877597) b!1322215))

(assert (= (and b!1322215 res!877598) b!1322205))

(assert (= (and b!1322205 res!877602) b!1322213))

(assert (= (and b!1322213 res!877604) b!1322214))

(assert (= (and b!1322211 condMapEmpty!55805) mapIsEmpty!55805))

(assert (= (and b!1322211 (not condMapEmpty!55805)) mapNonEmpty!55805))

(get-info :version)

(assert (= (and mapNonEmpty!55805 ((_ is ValueCellFull!17154) mapValue!55805)) b!1322206))

(assert (= (and b!1322211 ((_ is ValueCellFull!17154) mapDefault!55805)) b!1322207))

(assert (= start!111628 b!1322211))

(declare-fun b_lambda!23611 () Bool)

(assert (=> (not b_lambda!23611) (not b!1322214)))

(declare-fun t!44332 () Bool)

(declare-fun tb!11637 () Bool)

(assert (=> (and start!111628 (= defaultEntry!1340 defaultEntry!1340) t!44332) tb!11637))

(declare-fun result!24329 () Bool)

(assert (=> tb!11637 (= result!24329 tp_is_empty!36105)))

(assert (=> b!1322214 t!44332))

(declare-fun b_and!48731 () Bool)

(assert (= b_and!48729 (and (=> t!44332 result!24329) b_and!48731)))

(declare-fun m!1210391 () Bool)

(assert (=> start!111628 m!1210391))

(declare-fun m!1210393 () Bool)

(assert (=> start!111628 m!1210393))

(declare-fun m!1210395 () Bool)

(assert (=> start!111628 m!1210395))

(declare-fun m!1210397 () Bool)

(assert (=> b!1322215 m!1210397))

(assert (=> b!1322215 m!1210397))

(declare-fun m!1210399 () Bool)

(assert (=> b!1322215 m!1210399))

(declare-fun m!1210401 () Bool)

(assert (=> b!1322209 m!1210401))

(declare-fun m!1210403 () Bool)

(assert (=> b!1322212 m!1210403))

(declare-fun m!1210405 () Bool)

(assert (=> mapNonEmpty!55805 m!1210405))

(declare-fun m!1210407 () Bool)

(assert (=> b!1322214 m!1210407))

(declare-fun m!1210409 () Bool)

(assert (=> b!1322214 m!1210409))

(declare-fun m!1210411 () Bool)

(assert (=> b!1322214 m!1210411))

(declare-fun m!1210413 () Bool)

(assert (=> b!1322214 m!1210413))

(declare-fun m!1210415 () Bool)

(assert (=> b!1322214 m!1210415))

(declare-fun m!1210417 () Bool)

(assert (=> b!1322214 m!1210417))

(declare-fun m!1210419 () Bool)

(assert (=> b!1322214 m!1210419))

(declare-fun m!1210421 () Bool)

(assert (=> b!1322214 m!1210421))

(declare-fun m!1210423 () Bool)

(assert (=> b!1322214 m!1210423))

(declare-fun m!1210425 () Bool)

(assert (=> b!1322214 m!1210425))

(declare-fun m!1210427 () Bool)

(assert (=> b!1322214 m!1210427))

(declare-fun m!1210429 () Bool)

(assert (=> b!1322214 m!1210429))

(declare-fun m!1210431 () Bool)

(assert (=> b!1322214 m!1210431))

(assert (=> b!1322214 m!1210423))

(declare-fun m!1210433 () Bool)

(assert (=> b!1322214 m!1210433))

(declare-fun m!1210435 () Bool)

(assert (=> b!1322214 m!1210435))

(assert (=> b!1322214 m!1210415))

(assert (=> b!1322214 m!1210427))

(assert (=> b!1322214 m!1210411))

(declare-fun m!1210437 () Bool)

(assert (=> b!1322214 m!1210437))

(assert (=> b!1322213 m!1210423))

(assert (=> b!1322213 m!1210423))

(declare-fun m!1210439 () Bool)

(assert (=> b!1322213 m!1210439))

(assert (=> b!1322205 m!1210423))

(check-sat b_and!48731 (not b!1322209) (not b_lambda!23611) (not b_next!30285) (not b!1322212) (not start!111628) tp_is_empty!36105 (not b!1322215) (not b!1322213) (not b!1322214) (not mapNonEmpty!55805))
(check-sat b_and!48731 (not b_next!30285))
