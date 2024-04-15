; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111470 () Bool)

(assert start!111470)

(declare-fun b_free!30127 () Bool)

(declare-fun b_next!30127 () Bool)

(assert (=> start!111470 (= b_free!30127 (not b_next!30127))))

(declare-fun tp!105857 () Bool)

(declare-fun b_and!48395 () Bool)

(assert (=> start!111470 (= tp!105857 b_and!48395)))

(declare-fun b!1319371 () Bool)

(declare-fun res!875673 () Bool)

(declare-fun e!752759 () Bool)

(assert (=> b!1319371 (=> (not res!875673) (not e!752759))))

(declare-datatypes ((array!88759 0))(
  ( (array!88760 (arr!42854 (Array (_ BitVec 32) (_ BitVec 64))) (size!43406 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88759)

(declare-datatypes ((List!30456 0))(
  ( (Nil!30453) (Cons!30452 (h!31661 (_ BitVec 64)) (t!44124 List!30456)) )
))
(declare-fun arrayNoDuplicates!0 (array!88759 (_ BitVec 32) List!30456) Bool)

(assert (=> b!1319371 (= res!875673 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30453))))

(declare-fun b!1319372 () Bool)

(assert (=> b!1319372 (= e!752759 (not true))))

(declare-datatypes ((V!53033 0))(
  ( (V!53034 (val!18048 Int)) )
))
(declare-datatypes ((tuple2!23318 0))(
  ( (tuple2!23319 (_1!11670 (_ BitVec 64)) (_2!11670 V!53033)) )
))
(declare-datatypes ((List!30457 0))(
  ( (Nil!30454) (Cons!30453 (h!31662 tuple2!23318) (t!44125 List!30457)) )
))
(declare-datatypes ((ListLongMap!20975 0))(
  ( (ListLongMap!20976 (toList!10503 List!30457)) )
))
(declare-fun lt!586455 () ListLongMap!20975)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8586 (ListLongMap!20975 (_ BitVec 64)) Bool)

(assert (=> b!1319372 (contains!8586 lt!586455 k0!1164)))

(declare-fun minValue!1279 () V!53033)

(declare-datatypes ((Unit!43283 0))(
  ( (Unit!43284) )
))
(declare-fun lt!586454 () Unit!43283)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!115 ((_ BitVec 64) (_ BitVec 64) V!53033 ListLongMap!20975) Unit!43283)

(assert (=> b!1319372 (= lt!586454 (lemmaInListMapAfterAddingDiffThenInBefore!115 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586455))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53033)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17075 0))(
  ( (ValueCellFull!17075 (v!20677 V!53033)) (EmptyCell!17075) )
))
(declare-datatypes ((array!88761 0))(
  ( (array!88762 (arr!42855 (Array (_ BitVec 32) ValueCell!17075)) (size!43407 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88761)

(declare-fun +!4550 (ListLongMap!20975 tuple2!23318) ListLongMap!20975)

(declare-fun getCurrentListMapNoExtraKeys!6183 (array!88759 array!88761 (_ BitVec 32) (_ BitVec 32) V!53033 V!53033 (_ BitVec 32) Int) ListLongMap!20975)

(declare-fun get!21551 (ValueCell!17075 V!53033) V!53033)

(declare-fun dynLambda!3480 (Int (_ BitVec 64)) V!53033)

(assert (=> b!1319372 (= lt!586455 (+!4550 (+!4550 (getCurrentListMapNoExtraKeys!6183 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23319 (select (arr!42854 _keys!1609) from!2000) (get!21551 (select (arr!42855 _values!1337) from!2000) (dynLambda!3480 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23319 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapNonEmpty!55568 () Bool)

(declare-fun mapRes!55568 () Bool)

(declare-fun tp!105858 () Bool)

(declare-fun e!752761 () Bool)

(assert (=> mapNonEmpty!55568 (= mapRes!55568 (and tp!105858 e!752761))))

(declare-fun mapRest!55568 () (Array (_ BitVec 32) ValueCell!17075))

(declare-fun mapValue!55568 () ValueCell!17075)

(declare-fun mapKey!55568 () (_ BitVec 32))

(assert (=> mapNonEmpty!55568 (= (arr!42855 _values!1337) (store mapRest!55568 mapKey!55568 mapValue!55568))))

(declare-fun b!1319373 () Bool)

(declare-fun e!752760 () Bool)

(declare-fun tp_is_empty!35947 () Bool)

(assert (=> b!1319373 (= e!752760 tp_is_empty!35947)))

(declare-fun b!1319374 () Bool)

(declare-fun res!875672 () Bool)

(assert (=> b!1319374 (=> (not res!875672) (not e!752759))))

(assert (=> b!1319374 (= res!875672 (not (= (select (arr!42854 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319375 () Bool)

(declare-fun e!752757 () Bool)

(assert (=> b!1319375 (= e!752757 (and e!752760 mapRes!55568))))

(declare-fun condMapEmpty!55568 () Bool)

(declare-fun mapDefault!55568 () ValueCell!17075)

(assert (=> b!1319375 (= condMapEmpty!55568 (= (arr!42855 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17075)) mapDefault!55568)))))

(declare-fun b!1319376 () Bool)

(assert (=> b!1319376 (= e!752761 tp_is_empty!35947)))

(declare-fun mapIsEmpty!55568 () Bool)

(assert (=> mapIsEmpty!55568 mapRes!55568))

(declare-fun res!875674 () Bool)

(assert (=> start!111470 (=> (not res!875674) (not e!752759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111470 (= res!875674 (validMask!0 mask!2019))))

(assert (=> start!111470 e!752759))

(declare-fun array_inv!32543 (array!88759) Bool)

(assert (=> start!111470 (array_inv!32543 _keys!1609)))

(assert (=> start!111470 true))

(assert (=> start!111470 tp_is_empty!35947))

(declare-fun array_inv!32544 (array!88761) Bool)

(assert (=> start!111470 (and (array_inv!32544 _values!1337) e!752757)))

(assert (=> start!111470 tp!105857))

(declare-fun b!1319370 () Bool)

(declare-fun res!875677 () Bool)

(assert (=> b!1319370 (=> (not res!875677) (not e!752759))))

(assert (=> b!1319370 (= res!875677 (and (= (size!43407 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43406 _keys!1609) (size!43407 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319377 () Bool)

(declare-fun res!875675 () Bool)

(assert (=> b!1319377 (=> (not res!875675) (not e!752759))))

(declare-fun getCurrentListMap!5396 (array!88759 array!88761 (_ BitVec 32) (_ BitVec 32) V!53033 V!53033 (_ BitVec 32) Int) ListLongMap!20975)

(assert (=> b!1319377 (= res!875675 (contains!8586 (getCurrentListMap!5396 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319378 () Bool)

(declare-fun res!875678 () Bool)

(assert (=> b!1319378 (=> (not res!875678) (not e!752759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319378 (= res!875678 (validKeyInArray!0 (select (arr!42854 _keys!1609) from!2000)))))

(declare-fun b!1319379 () Bool)

(declare-fun res!875676 () Bool)

(assert (=> b!1319379 (=> (not res!875676) (not e!752759))))

(assert (=> b!1319379 (= res!875676 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43406 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319380 () Bool)

(declare-fun res!875679 () Bool)

(assert (=> b!1319380 (=> (not res!875679) (not e!752759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88759 (_ BitVec 32)) Bool)

(assert (=> b!1319380 (= res!875679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111470 res!875674) b!1319370))

(assert (= (and b!1319370 res!875677) b!1319380))

(assert (= (and b!1319380 res!875679) b!1319371))

(assert (= (and b!1319371 res!875673) b!1319379))

(assert (= (and b!1319379 res!875676) b!1319377))

(assert (= (and b!1319377 res!875675) b!1319374))

(assert (= (and b!1319374 res!875672) b!1319378))

(assert (= (and b!1319378 res!875678) b!1319372))

(assert (= (and b!1319375 condMapEmpty!55568) mapIsEmpty!55568))

(assert (= (and b!1319375 (not condMapEmpty!55568)) mapNonEmpty!55568))

(get-info :version)

(assert (= (and mapNonEmpty!55568 ((_ is ValueCellFull!17075) mapValue!55568)) b!1319376))

(assert (= (and b!1319375 ((_ is ValueCellFull!17075) mapDefault!55568)) b!1319373))

(assert (= start!111470 b!1319375))

(declare-fun b_lambda!23443 () Bool)

(assert (=> (not b_lambda!23443) (not b!1319372)))

(declare-fun t!44123 () Bool)

(declare-fun tb!11471 () Bool)

(assert (=> (and start!111470 (= defaultEntry!1340 defaultEntry!1340) t!44123) tb!11471))

(declare-fun result!24005 () Bool)

(assert (=> tb!11471 (= result!24005 tp_is_empty!35947)))

(assert (=> b!1319372 t!44123))

(declare-fun b_and!48397 () Bool)

(assert (= b_and!48395 (and (=> t!44123 result!24005) b_and!48397)))

(declare-fun m!1206519 () Bool)

(assert (=> b!1319371 m!1206519))

(declare-fun m!1206521 () Bool)

(assert (=> b!1319374 m!1206521))

(declare-fun m!1206523 () Bool)

(assert (=> b!1319372 m!1206523))

(declare-fun m!1206525 () Bool)

(assert (=> b!1319372 m!1206525))

(assert (=> b!1319372 m!1206523))

(declare-fun m!1206527 () Bool)

(assert (=> b!1319372 m!1206527))

(declare-fun m!1206529 () Bool)

(assert (=> b!1319372 m!1206529))

(assert (=> b!1319372 m!1206527))

(declare-fun m!1206531 () Bool)

(assert (=> b!1319372 m!1206531))

(declare-fun m!1206533 () Bool)

(assert (=> b!1319372 m!1206533))

(assert (=> b!1319372 m!1206529))

(assert (=> b!1319372 m!1206525))

(declare-fun m!1206535 () Bool)

(assert (=> b!1319372 m!1206535))

(declare-fun m!1206537 () Bool)

(assert (=> b!1319372 m!1206537))

(assert (=> b!1319372 m!1206521))

(declare-fun m!1206539 () Bool)

(assert (=> start!111470 m!1206539))

(declare-fun m!1206541 () Bool)

(assert (=> start!111470 m!1206541))

(declare-fun m!1206543 () Bool)

(assert (=> start!111470 m!1206543))

(assert (=> b!1319378 m!1206521))

(assert (=> b!1319378 m!1206521))

(declare-fun m!1206545 () Bool)

(assert (=> b!1319378 m!1206545))

(declare-fun m!1206547 () Bool)

(assert (=> b!1319377 m!1206547))

(assert (=> b!1319377 m!1206547))

(declare-fun m!1206549 () Bool)

(assert (=> b!1319377 m!1206549))

(declare-fun m!1206551 () Bool)

(assert (=> mapNonEmpty!55568 m!1206551))

(declare-fun m!1206553 () Bool)

(assert (=> b!1319380 m!1206553))

(check-sat (not b!1319378) (not b!1319371) (not b_next!30127) (not b!1319372) (not b!1319377) (not start!111470) (not b_lambda!23443) b_and!48397 tp_is_empty!35947 (not b!1319380) (not mapNonEmpty!55568))
(check-sat b_and!48397 (not b_next!30127))
