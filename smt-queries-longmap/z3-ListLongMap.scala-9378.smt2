; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111706 () Bool)

(assert start!111706)

(declare-fun b_free!30363 () Bool)

(declare-fun b_next!30363 () Bool)

(assert (=> start!111706 (= b_free!30363 (not b_next!30363))))

(declare-fun tp!106565 () Bool)

(declare-fun b_and!48885 () Bool)

(assert (=> start!111706 (= tp!106565 b_and!48885)))

(declare-fun b!1323570 () Bool)

(declare-fun res!878539 () Bool)

(declare-fun e!754560 () Bool)

(assert (=> b!1323570 (=> (not res!878539) (not e!754560))))

(declare-datatypes ((array!89282 0))(
  ( (array!89283 (arr!43115 (Array (_ BitVec 32) (_ BitVec 64))) (size!43665 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89282)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89282 (_ BitVec 32)) Bool)

(assert (=> b!1323570 (= res!878539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323571 () Bool)

(declare-fun res!878534 () Bool)

(assert (=> b!1323571 (=> (not res!878534) (not e!754560))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323571 (= res!878534 (validKeyInArray!0 (select (arr!43115 _keys!1609) from!2000)))))

(declare-fun b!1323572 () Bool)

(declare-fun res!878536 () Bool)

(assert (=> b!1323572 (=> (not res!878536) (not e!754560))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323572 (= res!878536 (not (= (select (arr!43115 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323573 () Bool)

(declare-fun e!754562 () Bool)

(declare-fun tp_is_empty!36183 () Bool)

(assert (=> b!1323573 (= e!754562 tp_is_empty!36183)))

(declare-fun mapNonEmpty!55922 () Bool)

(declare-fun mapRes!55922 () Bool)

(declare-fun tp!106564 () Bool)

(declare-fun e!754563 () Bool)

(assert (=> mapNonEmpty!55922 (= mapRes!55922 (and tp!106564 e!754563))))

(declare-datatypes ((V!53347 0))(
  ( (V!53348 (val!18166 Int)) )
))
(declare-datatypes ((ValueCell!17193 0))(
  ( (ValueCellFull!17193 (v!20796 V!53347)) (EmptyCell!17193) )
))
(declare-fun mapValue!55922 () ValueCell!17193)

(declare-datatypes ((array!89284 0))(
  ( (array!89285 (arr!43116 (Array (_ BitVec 32) ValueCell!17193)) (size!43666 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89284)

(declare-fun mapRest!55922 () (Array (_ BitVec 32) ValueCell!17193))

(declare-fun mapKey!55922 () (_ BitVec 32))

(assert (=> mapNonEmpty!55922 (= (arr!43116 _values!1337) (store mapRest!55922 mapKey!55922 mapValue!55922))))

(declare-fun res!878533 () Bool)

(assert (=> start!111706 (=> (not res!878533) (not e!754560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111706 (= res!878533 (validMask!0 mask!2019))))

(assert (=> start!111706 e!754560))

(declare-fun array_inv!32551 (array!89282) Bool)

(assert (=> start!111706 (array_inv!32551 _keys!1609)))

(assert (=> start!111706 true))

(assert (=> start!111706 tp_is_empty!36183))

(declare-fun e!754561 () Bool)

(declare-fun array_inv!32552 (array!89284) Bool)

(assert (=> start!111706 (and (array_inv!32552 _values!1337) e!754561)))

(assert (=> start!111706 tp!106565))

(declare-fun b!1323574 () Bool)

(declare-fun res!878535 () Bool)

(assert (=> b!1323574 (=> (not res!878535) (not e!754560))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1323574 (= res!878535 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43665 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323575 () Bool)

(declare-fun res!878540 () Bool)

(assert (=> b!1323575 (=> (not res!878540) (not e!754560))))

(declare-datatypes ((List!30560 0))(
  ( (Nil!30557) (Cons!30556 (h!31765 (_ BitVec 64)) (t!44472 List!30560)) )
))
(declare-fun arrayNoDuplicates!0 (array!89282 (_ BitVec 32) List!30560) Bool)

(assert (=> b!1323575 (= res!878540 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30557))))

(declare-fun b!1323576 () Bool)

(assert (=> b!1323576 (= e!754561 (and e!754562 mapRes!55922))))

(declare-fun condMapEmpty!55922 () Bool)

(declare-fun mapDefault!55922 () ValueCell!17193)

(assert (=> b!1323576 (= condMapEmpty!55922 (= (arr!43116 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17193)) mapDefault!55922)))))

(declare-fun b!1323577 () Bool)

(assert (=> b!1323577 (= e!754563 tp_is_empty!36183)))

(declare-fun b!1323578 () Bool)

(declare-fun res!878537 () Bool)

(assert (=> b!1323578 (=> (not res!878537) (not e!754560))))

(declare-fun zeroValue!1279 () V!53347)

(declare-fun minValue!1279 () V!53347)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23418 0))(
  ( (tuple2!23419 (_1!11720 (_ BitVec 64)) (_2!11720 V!53347)) )
))
(declare-datatypes ((List!30561 0))(
  ( (Nil!30558) (Cons!30557 (h!31766 tuple2!23418) (t!44473 List!30561)) )
))
(declare-datatypes ((ListLongMap!21075 0))(
  ( (ListLongMap!21076 (toList!10553 List!30561)) )
))
(declare-fun contains!8708 (ListLongMap!21075 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5550 (array!89282 array!89284 (_ BitVec 32) (_ BitVec 32) V!53347 V!53347 (_ BitVec 32) Int) ListLongMap!21075)

(assert (=> b!1323578 (= res!878537 (contains!8708 (getCurrentListMap!5550 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55922 () Bool)

(assert (=> mapIsEmpty!55922 mapRes!55922))

(declare-fun b!1323579 () Bool)

(assert (=> b!1323579 (= e!754560 (not true))))

(declare-fun lt!589165 () ListLongMap!21075)

(declare-fun +!4604 (ListLongMap!21075 tuple2!23418) ListLongMap!21075)

(assert (=> b!1323579 (contains!8708 (+!4604 lt!589165 (tuple2!23419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43628 0))(
  ( (Unit!43629) )
))
(declare-fun lt!589164 () Unit!43628)

(declare-fun addStillContains!1153 (ListLongMap!21075 (_ BitVec 64) V!53347 (_ BitVec 64)) Unit!43628)

(assert (=> b!1323579 (= lt!589164 (addStillContains!1153 lt!589165 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323579 (contains!8708 lt!589165 k0!1164)))

(declare-fun lt!589161 () ListLongMap!21075)

(declare-fun lt!589167 () tuple2!23418)

(assert (=> b!1323579 (= lt!589165 (+!4604 lt!589161 lt!589167))))

(declare-fun lt!589157 () Unit!43628)

(assert (=> b!1323579 (= lt!589157 (addStillContains!1153 lt!589161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323579 (contains!8708 lt!589161 k0!1164)))

(declare-fun lt!589160 () Unit!43628)

(declare-fun lt!589166 () V!53347)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!200 ((_ BitVec 64) (_ BitVec 64) V!53347 ListLongMap!21075) Unit!43628)

(assert (=> b!1323579 (= lt!589160 (lemmaInListMapAfterAddingDiffThenInBefore!200 k0!1164 (select (arr!43115 _keys!1609) from!2000) lt!589166 lt!589161))))

(declare-fun lt!589162 () ListLongMap!21075)

(assert (=> b!1323579 (contains!8708 lt!589162 k0!1164)))

(declare-fun lt!589158 () Unit!43628)

(assert (=> b!1323579 (= lt!589158 (lemmaInListMapAfterAddingDiffThenInBefore!200 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589162))))

(declare-fun lt!589163 () ListLongMap!21075)

(assert (=> b!1323579 (contains!8708 lt!589163 k0!1164)))

(declare-fun lt!589159 () Unit!43628)

(assert (=> b!1323579 (= lt!589159 (lemmaInListMapAfterAddingDiffThenInBefore!200 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589163))))

(assert (=> b!1323579 (= lt!589163 (+!4604 lt!589162 lt!589167))))

(assert (=> b!1323579 (= lt!589167 (tuple2!23419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323579 (= lt!589162 (+!4604 lt!589161 (tuple2!23419 (select (arr!43115 _keys!1609) from!2000) lt!589166)))))

(declare-fun get!21716 (ValueCell!17193 V!53347) V!53347)

(declare-fun dynLambda!3543 (Int (_ BitVec 64)) V!53347)

(assert (=> b!1323579 (= lt!589166 (get!21716 (select (arr!43116 _values!1337) from!2000) (dynLambda!3543 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6239 (array!89282 array!89284 (_ BitVec 32) (_ BitVec 32) V!53347 V!53347 (_ BitVec 32) Int) ListLongMap!21075)

(assert (=> b!1323579 (= lt!589161 (getCurrentListMapNoExtraKeys!6239 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323580 () Bool)

(declare-fun res!878538 () Bool)

(assert (=> b!1323580 (=> (not res!878538) (not e!754560))))

(assert (=> b!1323580 (= res!878538 (and (= (size!43666 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43665 _keys!1609) (size!43666 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111706 res!878533) b!1323580))

(assert (= (and b!1323580 res!878538) b!1323570))

(assert (= (and b!1323570 res!878539) b!1323575))

(assert (= (and b!1323575 res!878540) b!1323574))

(assert (= (and b!1323574 res!878535) b!1323578))

(assert (= (and b!1323578 res!878537) b!1323572))

(assert (= (and b!1323572 res!878536) b!1323571))

(assert (= (and b!1323571 res!878534) b!1323579))

(assert (= (and b!1323576 condMapEmpty!55922) mapIsEmpty!55922))

(assert (= (and b!1323576 (not condMapEmpty!55922)) mapNonEmpty!55922))

(get-info :version)

(assert (= (and mapNonEmpty!55922 ((_ is ValueCellFull!17193) mapValue!55922)) b!1323577))

(assert (= (and b!1323576 ((_ is ValueCellFull!17193) mapDefault!55922)) b!1323573))

(assert (= start!111706 b!1323576))

(declare-fun b_lambda!23689 () Bool)

(assert (=> (not b_lambda!23689) (not b!1323579)))

(declare-fun t!44471 () Bool)

(declare-fun tb!11715 () Bool)

(assert (=> (and start!111706 (= defaultEntry!1340 defaultEntry!1340) t!44471) tb!11715))

(declare-fun result!24485 () Bool)

(assert (=> tb!11715 (= result!24485 tp_is_empty!36183)))

(assert (=> b!1323579 t!44471))

(declare-fun b_and!48887 () Bool)

(assert (= b_and!48885 (and (=> t!44471 result!24485) b_and!48887)))

(declare-fun m!1212455 () Bool)

(assert (=> b!1323578 m!1212455))

(assert (=> b!1323578 m!1212455))

(declare-fun m!1212457 () Bool)

(assert (=> b!1323578 m!1212457))

(declare-fun m!1212459 () Bool)

(assert (=> b!1323575 m!1212459))

(declare-fun m!1212461 () Bool)

(assert (=> b!1323572 m!1212461))

(declare-fun m!1212463 () Bool)

(assert (=> mapNonEmpty!55922 m!1212463))

(declare-fun m!1212465 () Bool)

(assert (=> b!1323570 m!1212465))

(declare-fun m!1212467 () Bool)

(assert (=> start!111706 m!1212467))

(declare-fun m!1212469 () Bool)

(assert (=> start!111706 m!1212469))

(declare-fun m!1212471 () Bool)

(assert (=> start!111706 m!1212471))

(assert (=> b!1323571 m!1212461))

(assert (=> b!1323571 m!1212461))

(declare-fun m!1212473 () Bool)

(assert (=> b!1323571 m!1212473))

(declare-fun m!1212475 () Bool)

(assert (=> b!1323579 m!1212475))

(declare-fun m!1212477 () Bool)

(assert (=> b!1323579 m!1212477))

(declare-fun m!1212479 () Bool)

(assert (=> b!1323579 m!1212479))

(declare-fun m!1212481 () Bool)

(assert (=> b!1323579 m!1212481))

(declare-fun m!1212483 () Bool)

(assert (=> b!1323579 m!1212483))

(declare-fun m!1212485 () Bool)

(assert (=> b!1323579 m!1212485))

(assert (=> b!1323579 m!1212481))

(declare-fun m!1212487 () Bool)

(assert (=> b!1323579 m!1212487))

(declare-fun m!1212489 () Bool)

(assert (=> b!1323579 m!1212489))

(declare-fun m!1212491 () Bool)

(assert (=> b!1323579 m!1212491))

(declare-fun m!1212493 () Bool)

(assert (=> b!1323579 m!1212493))

(assert (=> b!1323579 m!1212477))

(declare-fun m!1212495 () Bool)

(assert (=> b!1323579 m!1212495))

(assert (=> b!1323579 m!1212461))

(declare-fun m!1212497 () Bool)

(assert (=> b!1323579 m!1212497))

(declare-fun m!1212499 () Bool)

(assert (=> b!1323579 m!1212499))

(assert (=> b!1323579 m!1212493))

(declare-fun m!1212501 () Bool)

(assert (=> b!1323579 m!1212501))

(declare-fun m!1212503 () Bool)

(assert (=> b!1323579 m!1212503))

(declare-fun m!1212505 () Bool)

(assert (=> b!1323579 m!1212505))

(assert (=> b!1323579 m!1212461))

(declare-fun m!1212507 () Bool)

(assert (=> b!1323579 m!1212507))

(declare-fun m!1212509 () Bool)

(assert (=> b!1323579 m!1212509))

(check-sat (not b!1323570) (not b!1323579) b_and!48887 (not b_lambda!23689) (not b_next!30363) (not mapNonEmpty!55922) (not start!111706) (not b!1323575) (not b!1323571) tp_is_empty!36183 (not b!1323578))
(check-sat b_and!48887 (not b_next!30363))
