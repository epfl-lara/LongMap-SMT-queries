; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111784 () Bool)

(assert start!111784)

(declare-fun b_free!30217 () Bool)

(declare-fun b_next!30217 () Bool)

(assert (=> start!111784 (= b_free!30217 (not b_next!30217))))

(declare-fun tp!106127 () Bool)

(declare-fun b_and!48595 () Bool)

(assert (=> start!111784 (= tp!106127 b_and!48595)))

(declare-fun b!1322314 () Bool)

(declare-fun e!754308 () Bool)

(declare-fun tp_is_empty!36037 () Bool)

(assert (=> b!1322314 (= e!754308 tp_is_empty!36037)))

(declare-fun res!877303 () Bool)

(declare-fun e!754312 () Bool)

(assert (=> start!111784 (=> (not res!877303) (not e!754312))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111784 (= res!877303 (validMask!0 mask!2019))))

(assert (=> start!111784 e!754312))

(declare-datatypes ((array!89081 0))(
  ( (array!89082 (arr!43010 (Array (_ BitVec 32) (_ BitVec 64))) (size!43561 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89081)

(declare-fun array_inv!32747 (array!89081) Bool)

(assert (=> start!111784 (array_inv!32747 _keys!1609)))

(assert (=> start!111784 true))

(assert (=> start!111784 tp_is_empty!36037))

(declare-datatypes ((V!53153 0))(
  ( (V!53154 (val!18093 Int)) )
))
(declare-datatypes ((ValueCell!17120 0))(
  ( (ValueCellFull!17120 (v!20718 V!53153)) (EmptyCell!17120) )
))
(declare-datatypes ((array!89083 0))(
  ( (array!89084 (arr!43011 (Array (_ BitVec 32) ValueCell!17120)) (size!43562 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89083)

(declare-fun e!754309 () Bool)

(declare-fun array_inv!32748 (array!89083) Bool)

(assert (=> start!111784 (and (array_inv!32748 _values!1337) e!754309)))

(assert (=> start!111784 tp!106127))

(declare-fun mapNonEmpty!55703 () Bool)

(declare-fun mapRes!55703 () Bool)

(declare-fun tp!106126 () Bool)

(assert (=> mapNonEmpty!55703 (= mapRes!55703 (and tp!106126 e!754308))))

(declare-fun mapValue!55703 () ValueCell!17120)

(declare-fun mapRest!55703 () (Array (_ BitVec 32) ValueCell!17120))

(declare-fun mapKey!55703 () (_ BitVec 32))

(assert (=> mapNonEmpty!55703 (= (arr!43011 _values!1337) (store mapRest!55703 mapKey!55703 mapValue!55703))))

(declare-fun b!1322315 () Bool)

(declare-fun e!754311 () Bool)

(assert (=> b!1322315 (= e!754311 tp_is_empty!36037)))

(declare-fun mapIsEmpty!55703 () Bool)

(assert (=> mapIsEmpty!55703 mapRes!55703))

(declare-fun b!1322316 () Bool)

(declare-fun res!877301 () Bool)

(assert (=> b!1322316 (=> (not res!877301) (not e!754312))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322316 (= res!877301 (validKeyInArray!0 (select (arr!43010 _keys!1609) from!2000)))))

(declare-fun b!1322317 () Bool)

(assert (=> b!1322317 (= e!754309 (and e!754311 mapRes!55703))))

(declare-fun condMapEmpty!55703 () Bool)

(declare-fun mapDefault!55703 () ValueCell!17120)

(assert (=> b!1322317 (= condMapEmpty!55703 (= (arr!43011 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17120)) mapDefault!55703)))))

(declare-fun b!1322318 () Bool)

(declare-fun res!877305 () Bool)

(assert (=> b!1322318 (=> (not res!877305) (not e!754312))))

(declare-datatypes ((List!30493 0))(
  ( (Nil!30490) (Cons!30489 (h!31707 (_ BitVec 64)) (t!44251 List!30493)) )
))
(declare-fun arrayNoDuplicates!0 (array!89081 (_ BitVec 32) List!30493) Bool)

(assert (=> b!1322318 (= res!877305 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30490))))

(declare-fun b!1322319 () Bool)

(declare-fun res!877306 () Bool)

(assert (=> b!1322319 (=> (not res!877306) (not e!754312))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1322319 (= res!877306 (and (= (size!43562 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43561 _keys!1609) (size!43562 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322320 () Bool)

(declare-fun res!877299 () Bool)

(assert (=> b!1322320 (=> (not res!877299) (not e!754312))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1322320 (= res!877299 (not (= (select (arr!43010 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322321 () Bool)

(declare-fun res!877304 () Bool)

(assert (=> b!1322321 (=> (not res!877304) (not e!754312))))

(declare-fun zeroValue!1279 () V!53153)

(declare-fun minValue!1279 () V!53153)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23338 0))(
  ( (tuple2!23339 (_1!11680 (_ BitVec 64)) (_2!11680 V!53153)) )
))
(declare-datatypes ((List!30494 0))(
  ( (Nil!30491) (Cons!30490 (h!31708 tuple2!23338) (t!44252 List!30494)) )
))
(declare-datatypes ((ListLongMap!21003 0))(
  ( (ListLongMap!21004 (toList!10517 List!30494)) )
))
(declare-fun contains!8684 (ListLongMap!21003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5513 (array!89081 array!89083 (_ BitVec 32) (_ BitVec 32) V!53153 V!53153 (_ BitVec 32) Int) ListLongMap!21003)

(assert (=> b!1322321 (= res!877304 (contains!8684 (getCurrentListMap!5513 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322322 () Bool)

(declare-fun res!877302 () Bool)

(assert (=> b!1322322 (=> (not res!877302) (not e!754312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89081 (_ BitVec 32)) Bool)

(assert (=> b!1322322 (= res!877302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322323 () Bool)

(assert (=> b!1322323 (= e!754312 (not true))))

(declare-fun lt!587685 () ListLongMap!21003)

(assert (=> b!1322323 (contains!8684 lt!587685 k0!1164)))

(declare-datatypes ((Unit!43481 0))(
  ( (Unit!43482) )
))
(declare-fun lt!587684 () Unit!43481)

(declare-fun lt!587687 () V!53153)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!152 ((_ BitVec 64) (_ BitVec 64) V!53153 ListLongMap!21003) Unit!43481)

(assert (=> b!1322323 (= lt!587684 (lemmaInListMapAfterAddingDiffThenInBefore!152 k0!1164 (select (arr!43010 _keys!1609) from!2000) lt!587687 lt!587685))))

(declare-fun lt!587690 () ListLongMap!21003)

(assert (=> b!1322323 (contains!8684 lt!587690 k0!1164)))

(declare-fun lt!587688 () Unit!43481)

(assert (=> b!1322323 (= lt!587688 (lemmaInListMapAfterAddingDiffThenInBefore!152 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587690))))

(declare-fun lt!587686 () ListLongMap!21003)

(assert (=> b!1322323 (contains!8684 lt!587686 k0!1164)))

(declare-fun lt!587689 () Unit!43481)

(assert (=> b!1322323 (= lt!587689 (lemmaInListMapAfterAddingDiffThenInBefore!152 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587686))))

(declare-fun +!4597 (ListLongMap!21003 tuple2!23338) ListLongMap!21003)

(assert (=> b!1322323 (= lt!587686 (+!4597 lt!587690 (tuple2!23339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1322323 (= lt!587690 (+!4597 lt!587685 (tuple2!23339 (select (arr!43010 _keys!1609) from!2000) lt!587687)))))

(declare-fun get!21664 (ValueCell!17120 V!53153) V!53153)

(declare-fun dynLambda!3551 (Int (_ BitVec 64)) V!53153)

(assert (=> b!1322323 (= lt!587687 (get!21664 (select (arr!43011 _values!1337) from!2000) (dynLambda!3551 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6236 (array!89081 array!89083 (_ BitVec 32) (_ BitVec 32) V!53153 V!53153 (_ BitVec 32) Int) ListLongMap!21003)

(assert (=> b!1322323 (= lt!587685 (getCurrentListMapNoExtraKeys!6236 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322324 () Bool)

(declare-fun res!877300 () Bool)

(assert (=> b!1322324 (=> (not res!877300) (not e!754312))))

(assert (=> b!1322324 (= res!877300 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43561 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111784 res!877303) b!1322319))

(assert (= (and b!1322319 res!877306) b!1322322))

(assert (= (and b!1322322 res!877302) b!1322318))

(assert (= (and b!1322318 res!877305) b!1322324))

(assert (= (and b!1322324 res!877300) b!1322321))

(assert (= (and b!1322321 res!877304) b!1322320))

(assert (= (and b!1322320 res!877299) b!1322316))

(assert (= (and b!1322316 res!877301) b!1322323))

(assert (= (and b!1322317 condMapEmpty!55703) mapIsEmpty!55703))

(assert (= (and b!1322317 (not condMapEmpty!55703)) mapNonEmpty!55703))

(get-info :version)

(assert (= (and mapNonEmpty!55703 ((_ is ValueCellFull!17120) mapValue!55703)) b!1322314))

(assert (= (and b!1322317 ((_ is ValueCellFull!17120) mapDefault!55703)) b!1322315))

(assert (= start!111784 b!1322317))

(declare-fun b_lambda!23537 () Bool)

(assert (=> (not b_lambda!23537) (not b!1322323)))

(declare-fun t!44250 () Bool)

(declare-fun tb!11561 () Bool)

(assert (=> (and start!111784 (= defaultEntry!1340 defaultEntry!1340) t!44250) tb!11561))

(declare-fun result!24185 () Bool)

(assert (=> tb!11561 (= result!24185 tp_is_empty!36037)))

(assert (=> b!1322323 t!44250))

(declare-fun b_and!48597 () Bool)

(assert (= b_and!48595 (and (=> t!44250 result!24185) b_and!48597)))

(declare-fun m!1210433 () Bool)

(assert (=> b!1322321 m!1210433))

(assert (=> b!1322321 m!1210433))

(declare-fun m!1210435 () Bool)

(assert (=> b!1322321 m!1210435))

(declare-fun m!1210437 () Bool)

(assert (=> b!1322318 m!1210437))

(declare-fun m!1210439 () Bool)

(assert (=> b!1322322 m!1210439))

(declare-fun m!1210441 () Bool)

(assert (=> start!111784 m!1210441))

(declare-fun m!1210443 () Bool)

(assert (=> start!111784 m!1210443))

(declare-fun m!1210445 () Bool)

(assert (=> start!111784 m!1210445))

(declare-fun m!1210447 () Bool)

(assert (=> b!1322323 m!1210447))

(declare-fun m!1210449 () Bool)

(assert (=> b!1322323 m!1210449))

(declare-fun m!1210451 () Bool)

(assert (=> b!1322323 m!1210451))

(declare-fun m!1210453 () Bool)

(assert (=> b!1322323 m!1210453))

(declare-fun m!1210455 () Bool)

(assert (=> b!1322323 m!1210455))

(declare-fun m!1210457 () Bool)

(assert (=> b!1322323 m!1210457))

(declare-fun m!1210459 () Bool)

(assert (=> b!1322323 m!1210459))

(declare-fun m!1210461 () Bool)

(assert (=> b!1322323 m!1210461))

(declare-fun m!1210463 () Bool)

(assert (=> b!1322323 m!1210463))

(assert (=> b!1322323 m!1210461))

(assert (=> b!1322323 m!1210453))

(declare-fun m!1210465 () Bool)

(assert (=> b!1322323 m!1210465))

(declare-fun m!1210467 () Bool)

(assert (=> b!1322323 m!1210467))

(declare-fun m!1210469 () Bool)

(assert (=> b!1322323 m!1210469))

(declare-fun m!1210471 () Bool)

(assert (=> b!1322323 m!1210471))

(assert (=> b!1322323 m!1210447))

(declare-fun m!1210473 () Bool)

(assert (=> mapNonEmpty!55703 m!1210473))

(assert (=> b!1322316 m!1210447))

(assert (=> b!1322316 m!1210447))

(declare-fun m!1210475 () Bool)

(assert (=> b!1322316 m!1210475))

(assert (=> b!1322320 m!1210447))

(check-sat (not b!1322321) b_and!48597 (not b!1322316) (not b!1322323) (not b_lambda!23537) (not start!111784) (not mapNonEmpty!55703) (not b!1322318) (not b!1322322) tp_is_empty!36037 (not b_next!30217))
(check-sat b_and!48597 (not b_next!30217))
