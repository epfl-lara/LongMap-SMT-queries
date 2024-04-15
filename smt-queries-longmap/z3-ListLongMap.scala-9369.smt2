; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111650 () Bool)

(assert start!111650)

(declare-fun b_free!30307 () Bool)

(declare-fun b_next!30307 () Bool)

(assert (=> start!111650 (= b_free!30307 (not b_next!30307))))

(declare-fun tp!106397 () Bool)

(declare-fun b_and!48755 () Bool)

(assert (=> start!111650 (= tp!106397 b_and!48755)))

(declare-fun b!1322520 () Bool)

(declare-fun res!877835 () Bool)

(declare-fun e!754108 () Bool)

(assert (=> b!1322520 (=> (not res!877835) (not e!754108))))

(declare-datatypes ((array!89107 0))(
  ( (array!89108 (arr!43028 (Array (_ BitVec 32) (_ BitVec 64))) (size!43580 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89107)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322520 (= res!877835 (validKeyInArray!0 (select (arr!43028 _keys!1609) from!2000)))))

(declare-fun b!1322521 () Bool)

(declare-fun res!877838 () Bool)

(assert (=> b!1322521 (=> (not res!877838) (not e!754108))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89107 (_ BitVec 32)) Bool)

(assert (=> b!1322521 (= res!877838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322522 () Bool)

(declare-fun res!877832 () Bool)

(assert (=> b!1322522 (=> (not res!877832) (not e!754108))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1322522 (= res!877832 (not (= (select (arr!43028 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322523 () Bool)

(declare-fun e!754111 () Bool)

(declare-fun e!754109 () Bool)

(declare-fun mapRes!55838 () Bool)

(assert (=> b!1322523 (= e!754111 (and e!754109 mapRes!55838))))

(declare-fun condMapEmpty!55838 () Bool)

(declare-datatypes ((V!53273 0))(
  ( (V!53274 (val!18138 Int)) )
))
(declare-datatypes ((ValueCell!17165 0))(
  ( (ValueCellFull!17165 (v!20767 V!53273)) (EmptyCell!17165) )
))
(declare-datatypes ((array!89109 0))(
  ( (array!89110 (arr!43029 (Array (_ BitVec 32) ValueCell!17165)) (size!43581 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89109)

(declare-fun mapDefault!55838 () ValueCell!17165)

(assert (=> b!1322523 (= condMapEmpty!55838 (= (arr!43029 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17165)) mapDefault!55838)))))

(declare-fun res!877836 () Bool)

(assert (=> start!111650 (=> (not res!877836) (not e!754108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111650 (= res!877836 (validMask!0 mask!2019))))

(assert (=> start!111650 e!754108))

(declare-fun array_inv!32671 (array!89107) Bool)

(assert (=> start!111650 (array_inv!32671 _keys!1609)))

(assert (=> start!111650 true))

(declare-fun tp_is_empty!36127 () Bool)

(assert (=> start!111650 tp_is_empty!36127))

(declare-fun array_inv!32672 (array!89109) Bool)

(assert (=> start!111650 (and (array_inv!32672 _values!1337) e!754111)))

(assert (=> start!111650 tp!106397))

(declare-fun mapNonEmpty!55838 () Bool)

(declare-fun tp!106398 () Bool)

(declare-fun e!754110 () Bool)

(assert (=> mapNonEmpty!55838 (= mapRes!55838 (and tp!106398 e!754110))))

(declare-fun mapRest!55838 () (Array (_ BitVec 32) ValueCell!17165))

(declare-fun mapValue!55838 () ValueCell!17165)

(declare-fun mapKey!55838 () (_ BitVec 32))

(assert (=> mapNonEmpty!55838 (= (arr!43029 _values!1337) (store mapRest!55838 mapKey!55838 mapValue!55838))))

(declare-fun b!1322524 () Bool)

(assert (=> b!1322524 (= e!754109 tp_is_empty!36127)))

(declare-fun b!1322525 () Bool)

(assert (=> b!1322525 (= e!754110 tp_is_empty!36127)))

(declare-fun b!1322526 () Bool)

(declare-fun res!877833 () Bool)

(assert (=> b!1322526 (=> (not res!877833) (not e!754108))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53273)

(declare-fun minValue!1279 () V!53273)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23446 0))(
  ( (tuple2!23447 (_1!11734 (_ BitVec 64)) (_2!11734 V!53273)) )
))
(declare-datatypes ((List!30582 0))(
  ( (Nil!30579) (Cons!30578 (h!31787 tuple2!23446) (t!44430 List!30582)) )
))
(declare-datatypes ((ListLongMap!21103 0))(
  ( (ListLongMap!21104 (toList!10567 List!30582)) )
))
(declare-fun contains!8650 (ListLongMap!21103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5450 (array!89107 array!89109 (_ BitVec 32) (_ BitVec 32) V!53273 V!53273 (_ BitVec 32) Int) ListLongMap!21103)

(assert (=> b!1322526 (= res!877833 (contains!8650 (getCurrentListMap!5450 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322527 () Bool)

(assert (=> b!1322527 (= e!754108 (not true))))

(declare-fun lt!588104 () ListLongMap!21103)

(declare-fun lt!588098 () tuple2!23446)

(declare-fun +!4607 (ListLongMap!21103 tuple2!23446) ListLongMap!21103)

(assert (=> b!1322527 (contains!8650 (+!4607 lt!588104 lt!588098) k0!1164)))

(declare-datatypes ((Unit!43397 0))(
  ( (Unit!43398) )
))
(declare-fun lt!588101 () Unit!43397)

(declare-fun addStillContains!1131 (ListLongMap!21103 (_ BitVec 64) V!53273 (_ BitVec 64)) Unit!43397)

(assert (=> b!1322527 (= lt!588101 (addStillContains!1131 lt!588104 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322527 (contains!8650 lt!588104 k0!1164)))

(declare-fun lt!588102 () Unit!43397)

(declare-fun lt!588099 () V!53273)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!172 ((_ BitVec 64) (_ BitVec 64) V!53273 ListLongMap!21103) Unit!43397)

(assert (=> b!1322527 (= lt!588102 (lemmaInListMapAfterAddingDiffThenInBefore!172 k0!1164 (select (arr!43028 _keys!1609) from!2000) lt!588099 lt!588104))))

(declare-fun lt!588097 () ListLongMap!21103)

(assert (=> b!1322527 (contains!8650 lt!588097 k0!1164)))

(declare-fun lt!588100 () Unit!43397)

(assert (=> b!1322527 (= lt!588100 (lemmaInListMapAfterAddingDiffThenInBefore!172 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588097))))

(declare-fun lt!588103 () ListLongMap!21103)

(assert (=> b!1322527 (contains!8650 lt!588103 k0!1164)))

(declare-fun lt!588105 () Unit!43397)

(assert (=> b!1322527 (= lt!588105 (lemmaInListMapAfterAddingDiffThenInBefore!172 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588103))))

(assert (=> b!1322527 (= lt!588103 (+!4607 lt!588097 lt!588098))))

(assert (=> b!1322527 (= lt!588098 (tuple2!23447 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322527 (= lt!588097 (+!4607 lt!588104 (tuple2!23447 (select (arr!43028 _keys!1609) from!2000) lt!588099)))))

(declare-fun get!21668 (ValueCell!17165 V!53273) V!53273)

(declare-fun dynLambda!3537 (Int (_ BitVec 64)) V!53273)

(assert (=> b!1322527 (= lt!588099 (get!21668 (select (arr!43029 _values!1337) from!2000) (dynLambda!3537 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6240 (array!89107 array!89109 (_ BitVec 32) (_ BitVec 32) V!53273 V!53273 (_ BitVec 32) Int) ListLongMap!21103)

(assert (=> b!1322527 (= lt!588104 (getCurrentListMapNoExtraKeys!6240 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322528 () Bool)

(declare-fun res!877834 () Bool)

(assert (=> b!1322528 (=> (not res!877834) (not e!754108))))

(declare-datatypes ((List!30583 0))(
  ( (Nil!30580) (Cons!30579 (h!31788 (_ BitVec 64)) (t!44431 List!30583)) )
))
(declare-fun arrayNoDuplicates!0 (array!89107 (_ BitVec 32) List!30583) Bool)

(assert (=> b!1322528 (= res!877834 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30580))))

(declare-fun b!1322529 () Bool)

(declare-fun res!877837 () Bool)

(assert (=> b!1322529 (=> (not res!877837) (not e!754108))))

(assert (=> b!1322529 (= res!877837 (and (= (size!43581 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43580 _keys!1609) (size!43581 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322530 () Bool)

(declare-fun res!877839 () Bool)

(assert (=> b!1322530 (=> (not res!877839) (not e!754108))))

(assert (=> b!1322530 (= res!877839 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43580 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55838 () Bool)

(assert (=> mapIsEmpty!55838 mapRes!55838))

(assert (= (and start!111650 res!877836) b!1322529))

(assert (= (and b!1322529 res!877837) b!1322521))

(assert (= (and b!1322521 res!877838) b!1322528))

(assert (= (and b!1322528 res!877834) b!1322530))

(assert (= (and b!1322530 res!877839) b!1322526))

(assert (= (and b!1322526 res!877833) b!1322522))

(assert (= (and b!1322522 res!877832) b!1322520))

(assert (= (and b!1322520 res!877835) b!1322527))

(assert (= (and b!1322523 condMapEmpty!55838) mapIsEmpty!55838))

(assert (= (and b!1322523 (not condMapEmpty!55838)) mapNonEmpty!55838))

(get-info :version)

(assert (= (and mapNonEmpty!55838 ((_ is ValueCellFull!17165) mapValue!55838)) b!1322525))

(assert (= (and b!1322523 ((_ is ValueCellFull!17165) mapDefault!55838)) b!1322524))

(assert (= start!111650 b!1322523))

(declare-fun b_lambda!23623 () Bool)

(assert (=> (not b_lambda!23623) (not b!1322527)))

(declare-fun t!44429 () Bool)

(declare-fun tb!11651 () Bool)

(assert (=> (and start!111650 (= defaultEntry!1340 defaultEntry!1340) t!44429) tb!11651))

(declare-fun result!24365 () Bool)

(assert (=> tb!11651 (= result!24365 tp_is_empty!36127)))

(assert (=> b!1322527 t!44429))

(declare-fun b_and!48757 () Bool)

(assert (= b_and!48755 (and (=> t!44429 result!24365) b_and!48757)))

(declare-fun m!1210425 () Bool)

(assert (=> b!1322521 m!1210425))

(declare-fun m!1210427 () Bool)

(assert (=> mapNonEmpty!55838 m!1210427))

(declare-fun m!1210429 () Bool)

(assert (=> b!1322522 m!1210429))

(declare-fun m!1210431 () Bool)

(assert (=> b!1322527 m!1210431))

(assert (=> b!1322527 m!1210429))

(declare-fun m!1210433 () Bool)

(assert (=> b!1322527 m!1210433))

(declare-fun m!1210435 () Bool)

(assert (=> b!1322527 m!1210435))

(declare-fun m!1210437 () Bool)

(assert (=> b!1322527 m!1210437))

(declare-fun m!1210439 () Bool)

(assert (=> b!1322527 m!1210439))

(declare-fun m!1210441 () Bool)

(assert (=> b!1322527 m!1210441))

(assert (=> b!1322527 m!1210437))

(declare-fun m!1210443 () Bool)

(assert (=> b!1322527 m!1210443))

(declare-fun m!1210445 () Bool)

(assert (=> b!1322527 m!1210445))

(declare-fun m!1210447 () Bool)

(assert (=> b!1322527 m!1210447))

(assert (=> b!1322527 m!1210443))

(assert (=> b!1322527 m!1210435))

(declare-fun m!1210449 () Bool)

(assert (=> b!1322527 m!1210449))

(assert (=> b!1322527 m!1210429))

(declare-fun m!1210451 () Bool)

(assert (=> b!1322527 m!1210451))

(declare-fun m!1210453 () Bool)

(assert (=> b!1322527 m!1210453))

(declare-fun m!1210455 () Bool)

(assert (=> b!1322527 m!1210455))

(declare-fun m!1210457 () Bool)

(assert (=> b!1322527 m!1210457))

(declare-fun m!1210459 () Bool)

(assert (=> b!1322527 m!1210459))

(declare-fun m!1210461 () Bool)

(assert (=> start!111650 m!1210461))

(declare-fun m!1210463 () Bool)

(assert (=> start!111650 m!1210463))

(declare-fun m!1210465 () Bool)

(assert (=> start!111650 m!1210465))

(declare-fun m!1210467 () Bool)

(assert (=> b!1322528 m!1210467))

(assert (=> b!1322520 m!1210429))

(assert (=> b!1322520 m!1210429))

(declare-fun m!1210469 () Bool)

(assert (=> b!1322520 m!1210469))

(declare-fun m!1210471 () Bool)

(assert (=> b!1322526 m!1210471))

(assert (=> b!1322526 m!1210471))

(declare-fun m!1210473 () Bool)

(assert (=> b!1322526 m!1210473))

(check-sat (not b!1322528) (not start!111650) (not b_lambda!23623) (not mapNonEmpty!55838) (not b!1322521) (not b_next!30307) (not b!1322527) (not b!1322526) b_and!48757 (not b!1322520) tp_is_empty!36127)
(check-sat b_and!48757 (not b_next!30307))
