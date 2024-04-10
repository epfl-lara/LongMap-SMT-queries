; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111586 () Bool)

(assert start!111586)

(declare-fun b_free!30243 () Bool)

(declare-fun b_next!30243 () Bool)

(assert (=> start!111586 (= b_free!30243 (not b_next!30243))))

(declare-fun tp!106205 () Bool)

(declare-fun b_and!48645 () Bool)

(assert (=> start!111586 (= tp!106205 b_and!48645)))

(declare-fun b!1321470 () Bool)

(declare-fun res!877098 () Bool)

(declare-fun e!753663 () Bool)

(assert (=> b!1321470 (=> (not res!877098) (not e!753663))))

(declare-datatypes ((array!89052 0))(
  ( (array!89053 (arr!43000 (Array (_ BitVec 32) (_ BitVec 64))) (size!43550 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89052)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53187 0))(
  ( (V!53188 (val!18106 Int)) )
))
(declare-datatypes ((ValueCell!17133 0))(
  ( (ValueCellFull!17133 (v!20736 V!53187)) (EmptyCell!17133) )
))
(declare-datatypes ((array!89054 0))(
  ( (array!89055 (arr!43001 (Array (_ BitVec 32) ValueCell!17133)) (size!43551 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89054)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1321470 (= res!877098 (and (= (size!43551 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43550 _keys!1609) (size!43551 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321471 () Bool)

(assert (=> b!1321471 (= e!753663 (not true))))

(declare-datatypes ((tuple2!23320 0))(
  ( (tuple2!23321 (_1!11671 (_ BitVec 64)) (_2!11671 V!53187)) )
))
(declare-datatypes ((List!30468 0))(
  ( (Nil!30465) (Cons!30464 (h!31673 tuple2!23320) (t!44260 List!30468)) )
))
(declare-datatypes ((ListLongMap!20977 0))(
  ( (ListLongMap!20978 (toList!10504 List!30468)) )
))
(declare-fun lt!587483 () ListLongMap!20977)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8659 (ListLongMap!20977 (_ BitVec 64)) Bool)

(assert (=> b!1321471 (contains!8659 lt!587483 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((Unit!43542 0))(
  ( (Unit!43543) )
))
(declare-fun lt!587486 () Unit!43542)

(declare-fun lt!587487 () V!53187)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!157 ((_ BitVec 64) (_ BitVec 64) V!53187 ListLongMap!20977) Unit!43542)

(assert (=> b!1321471 (= lt!587486 (lemmaInListMapAfterAddingDiffThenInBefore!157 k0!1164 (select (arr!43000 _keys!1609) from!2000) lt!587487 lt!587483))))

(declare-fun lt!587485 () ListLongMap!20977)

(assert (=> b!1321471 (contains!8659 lt!587485 k0!1164)))

(declare-fun zeroValue!1279 () V!53187)

(declare-fun lt!587482 () Unit!43542)

(assert (=> b!1321471 (= lt!587482 (lemmaInListMapAfterAddingDiffThenInBefore!157 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587485))))

(declare-fun lt!587481 () ListLongMap!20977)

(assert (=> b!1321471 (contains!8659 lt!587481 k0!1164)))

(declare-fun minValue!1279 () V!53187)

(declare-fun lt!587484 () Unit!43542)

(assert (=> b!1321471 (= lt!587484 (lemmaInListMapAfterAddingDiffThenInBefore!157 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587481))))

(declare-fun +!4561 (ListLongMap!20977 tuple2!23320) ListLongMap!20977)

(assert (=> b!1321471 (= lt!587481 (+!4561 lt!587485 (tuple2!23321 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321471 (= lt!587485 (+!4561 lt!587483 (tuple2!23321 (select (arr!43000 _keys!1609) from!2000) lt!587487)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21633 (ValueCell!17133 V!53187) V!53187)

(declare-fun dynLambda!3500 (Int (_ BitVec 64)) V!53187)

(assert (=> b!1321471 (= lt!587487 (get!21633 (select (arr!43001 _values!1337) from!2000) (dynLambda!3500 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6196 (array!89052 array!89054 (_ BitVec 32) (_ BitVec 32) V!53187 V!53187 (_ BitVec 32) Int) ListLongMap!20977)

(assert (=> b!1321471 (= lt!587483 (getCurrentListMapNoExtraKeys!6196 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321472 () Bool)

(declare-fun res!877095 () Bool)

(assert (=> b!1321472 (=> (not res!877095) (not e!753663))))

(declare-fun getCurrentListMap!5505 (array!89052 array!89054 (_ BitVec 32) (_ BitVec 32) V!53187 V!53187 (_ BitVec 32) Int) ListLongMap!20977)

(assert (=> b!1321472 (= res!877095 (contains!8659 (getCurrentListMap!5505 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321473 () Bool)

(declare-fun e!753662 () Bool)

(declare-fun tp_is_empty!36063 () Bool)

(assert (=> b!1321473 (= e!753662 tp_is_empty!36063)))

(declare-fun b!1321474 () Bool)

(declare-fun res!877099 () Bool)

(assert (=> b!1321474 (=> (not res!877099) (not e!753663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321474 (= res!877099 (validKeyInArray!0 (select (arr!43000 _keys!1609) from!2000)))))

(declare-fun b!1321475 () Bool)

(declare-fun res!877096 () Bool)

(assert (=> b!1321475 (=> (not res!877096) (not e!753663))))

(assert (=> b!1321475 (= res!877096 (not (= (select (arr!43000 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!55742 () Bool)

(declare-fun mapRes!55742 () Bool)

(assert (=> mapIsEmpty!55742 mapRes!55742))

(declare-fun mapNonEmpty!55742 () Bool)

(declare-fun tp!106204 () Bool)

(declare-fun e!753661 () Bool)

(assert (=> mapNonEmpty!55742 (= mapRes!55742 (and tp!106204 e!753661))))

(declare-fun mapKey!55742 () (_ BitVec 32))

(declare-fun mapRest!55742 () (Array (_ BitVec 32) ValueCell!17133))

(declare-fun mapValue!55742 () ValueCell!17133)

(assert (=> mapNonEmpty!55742 (= (arr!43001 _values!1337) (store mapRest!55742 mapKey!55742 mapValue!55742))))

(declare-fun res!877094 () Bool)

(assert (=> start!111586 (=> (not res!877094) (not e!753663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111586 (= res!877094 (validMask!0 mask!2019))))

(assert (=> start!111586 e!753663))

(declare-fun array_inv!32461 (array!89052) Bool)

(assert (=> start!111586 (array_inv!32461 _keys!1609)))

(assert (=> start!111586 true))

(assert (=> start!111586 tp_is_empty!36063))

(declare-fun e!753664 () Bool)

(declare-fun array_inv!32462 (array!89054) Bool)

(assert (=> start!111586 (and (array_inv!32462 _values!1337) e!753664)))

(assert (=> start!111586 tp!106205))

(declare-fun b!1321476 () Bool)

(declare-fun res!877093 () Bool)

(assert (=> b!1321476 (=> (not res!877093) (not e!753663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89052 (_ BitVec 32)) Bool)

(assert (=> b!1321476 (= res!877093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321477 () Bool)

(declare-fun res!877100 () Bool)

(assert (=> b!1321477 (=> (not res!877100) (not e!753663))))

(declare-datatypes ((List!30469 0))(
  ( (Nil!30466) (Cons!30465 (h!31674 (_ BitVec 64)) (t!44261 List!30469)) )
))
(declare-fun arrayNoDuplicates!0 (array!89052 (_ BitVec 32) List!30469) Bool)

(assert (=> b!1321477 (= res!877100 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30466))))

(declare-fun b!1321478 () Bool)

(assert (=> b!1321478 (= e!753661 tp_is_empty!36063)))

(declare-fun b!1321479 () Bool)

(declare-fun res!877097 () Bool)

(assert (=> b!1321479 (=> (not res!877097) (not e!753663))))

(assert (=> b!1321479 (= res!877097 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43550 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321480 () Bool)

(assert (=> b!1321480 (= e!753664 (and e!753662 mapRes!55742))))

(declare-fun condMapEmpty!55742 () Bool)

(declare-fun mapDefault!55742 () ValueCell!17133)

(assert (=> b!1321480 (= condMapEmpty!55742 (= (arr!43001 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17133)) mapDefault!55742)))))

(assert (= (and start!111586 res!877094) b!1321470))

(assert (= (and b!1321470 res!877098) b!1321476))

(assert (= (and b!1321476 res!877093) b!1321477))

(assert (= (and b!1321477 res!877100) b!1321479))

(assert (= (and b!1321479 res!877097) b!1321472))

(assert (= (and b!1321472 res!877095) b!1321475))

(assert (= (and b!1321475 res!877096) b!1321474))

(assert (= (and b!1321474 res!877099) b!1321471))

(assert (= (and b!1321480 condMapEmpty!55742) mapIsEmpty!55742))

(assert (= (and b!1321480 (not condMapEmpty!55742)) mapNonEmpty!55742))

(get-info :version)

(assert (= (and mapNonEmpty!55742 ((_ is ValueCellFull!17133) mapValue!55742)) b!1321478))

(assert (= (and b!1321480 ((_ is ValueCellFull!17133) mapDefault!55742)) b!1321473))

(assert (= start!111586 b!1321480))

(declare-fun b_lambda!23569 () Bool)

(assert (=> (not b_lambda!23569) (not b!1321471)))

(declare-fun t!44259 () Bool)

(declare-fun tb!11595 () Bool)

(assert (=> (and start!111586 (= defaultEntry!1340 defaultEntry!1340) t!44259) tb!11595))

(declare-fun result!24245 () Bool)

(assert (=> tb!11595 (= result!24245 tp_is_empty!36063)))

(assert (=> b!1321471 t!44259))

(declare-fun b_and!48647 () Bool)

(assert (= b_and!48645 (and (=> t!44259 result!24245) b_and!48647)))

(declare-fun m!1209407 () Bool)

(assert (=> b!1321475 m!1209407))

(declare-fun m!1209409 () Bool)

(assert (=> start!111586 m!1209409))

(declare-fun m!1209411 () Bool)

(assert (=> start!111586 m!1209411))

(declare-fun m!1209413 () Bool)

(assert (=> start!111586 m!1209413))

(declare-fun m!1209415 () Bool)

(assert (=> b!1321471 m!1209415))

(declare-fun m!1209417 () Bool)

(assert (=> b!1321471 m!1209417))

(declare-fun m!1209419 () Bool)

(assert (=> b!1321471 m!1209419))

(declare-fun m!1209421 () Bool)

(assert (=> b!1321471 m!1209421))

(declare-fun m!1209423 () Bool)

(assert (=> b!1321471 m!1209423))

(declare-fun m!1209425 () Bool)

(assert (=> b!1321471 m!1209425))

(declare-fun m!1209427 () Bool)

(assert (=> b!1321471 m!1209427))

(assert (=> b!1321471 m!1209407))

(declare-fun m!1209429 () Bool)

(assert (=> b!1321471 m!1209429))

(assert (=> b!1321471 m!1209427))

(assert (=> b!1321471 m!1209419))

(declare-fun m!1209431 () Bool)

(assert (=> b!1321471 m!1209431))

(declare-fun m!1209433 () Bool)

(assert (=> b!1321471 m!1209433))

(assert (=> b!1321471 m!1209407))

(declare-fun m!1209435 () Bool)

(assert (=> b!1321471 m!1209435))

(declare-fun m!1209437 () Bool)

(assert (=> b!1321471 m!1209437))

(declare-fun m!1209439 () Bool)

(assert (=> mapNonEmpty!55742 m!1209439))

(declare-fun m!1209441 () Bool)

(assert (=> b!1321477 m!1209441))

(declare-fun m!1209443 () Bool)

(assert (=> b!1321476 m!1209443))

(assert (=> b!1321474 m!1209407))

(assert (=> b!1321474 m!1209407))

(declare-fun m!1209445 () Bool)

(assert (=> b!1321474 m!1209445))

(declare-fun m!1209447 () Bool)

(assert (=> b!1321472 m!1209447))

(assert (=> b!1321472 m!1209447))

(declare-fun m!1209449 () Bool)

(assert (=> b!1321472 m!1209449))

(check-sat (not b_lambda!23569) (not b!1321471) (not b!1321477) (not b!1321474) tp_is_empty!36063 (not b_next!30243) b_and!48647 (not mapNonEmpty!55742) (not b!1321476) (not start!111586) (not b!1321472))
(check-sat b_and!48647 (not b_next!30243))
