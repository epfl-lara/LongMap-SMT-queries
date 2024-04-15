; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111686 () Bool)

(assert start!111686)

(declare-fun b_free!30343 () Bool)

(declare-fun b_next!30343 () Bool)

(assert (=> start!111686 (= b_free!30343 (not b_next!30343))))

(declare-fun tp!106506 () Bool)

(declare-fun b_and!48827 () Bool)

(assert (=> start!111686 (= tp!106506 b_and!48827)))

(declare-fun b!1323150 () Bool)

(declare-fun e!754379 () Bool)

(declare-fun e!754378 () Bool)

(declare-fun mapRes!55892 () Bool)

(assert (=> b!1323150 (= e!754379 (and e!754378 mapRes!55892))))

(declare-fun condMapEmpty!55892 () Bool)

(declare-datatypes ((V!53321 0))(
  ( (V!53322 (val!18156 Int)) )
))
(declare-datatypes ((ValueCell!17183 0))(
  ( (ValueCellFull!17183 (v!20785 V!53321)) (EmptyCell!17183) )
))
(declare-datatypes ((array!89175 0))(
  ( (array!89176 (arr!43062 (Array (_ BitVec 32) ValueCell!17183)) (size!43614 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89175)

(declare-fun mapDefault!55892 () ValueCell!17183)

(assert (=> b!1323150 (= condMapEmpty!55892 (= (arr!43062 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17183)) mapDefault!55892)))))

(declare-fun b!1323151 () Bool)

(declare-fun res!878269 () Bool)

(declare-fun e!754381 () Bool)

(assert (=> b!1323151 (=> (not res!878269) (not e!754381))))

(declare-datatypes ((array!89177 0))(
  ( (array!89178 (arr!43063 (Array (_ BitVec 32) (_ BitVec 64))) (size!43615 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89177)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323151 (= res!878269 (not (= (select (arr!43063 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323152 () Bool)

(declare-fun res!878271 () Bool)

(assert (=> b!1323152 (=> (not res!878271) (not e!754381))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1323152 (= res!878271 (and (= (size!43614 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43615 _keys!1609) (size!43614 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323153 () Bool)

(declare-fun res!878267 () Bool)

(assert (=> b!1323153 (=> (not res!878267) (not e!754381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323153 (= res!878267 (validKeyInArray!0 (select (arr!43063 _keys!1609) from!2000)))))

(declare-fun b!1323154 () Bool)

(declare-fun tp_is_empty!36163 () Bool)

(assert (=> b!1323154 (= e!754378 tp_is_empty!36163)))

(declare-fun res!878268 () Bool)

(assert (=> start!111686 (=> (not res!878268) (not e!754381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111686 (= res!878268 (validMask!0 mask!2019))))

(assert (=> start!111686 e!754381))

(declare-fun array_inv!32691 (array!89177) Bool)

(assert (=> start!111686 (array_inv!32691 _keys!1609)))

(assert (=> start!111686 true))

(assert (=> start!111686 tp_is_empty!36163))

(declare-fun array_inv!32692 (array!89175) Bool)

(assert (=> start!111686 (and (array_inv!32692 _values!1337) e!754379)))

(assert (=> start!111686 tp!106506))

(declare-fun mapIsEmpty!55892 () Bool)

(assert (=> mapIsEmpty!55892 mapRes!55892))

(declare-fun b!1323155 () Bool)

(declare-fun res!878270 () Bool)

(assert (=> b!1323155 (=> (not res!878270) (not e!754381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89177 (_ BitVec 32)) Bool)

(assert (=> b!1323155 (= res!878270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323156 () Bool)

(assert (=> b!1323156 (= e!754381 (not true))))

(declare-datatypes ((tuple2!23472 0))(
  ( (tuple2!23473 (_1!11747 (_ BitVec 64)) (_2!11747 V!53321)) )
))
(declare-datatypes ((List!30607 0))(
  ( (Nil!30604) (Cons!30603 (h!31812 tuple2!23472) (t!44491 List!30607)) )
))
(declare-datatypes ((ListLongMap!21129 0))(
  ( (ListLongMap!21130 (toList!10580 List!30607)) )
))
(declare-fun lt!588646 () ListLongMap!21129)

(declare-fun minValue!1279 () V!53321)

(declare-fun contains!8663 (ListLongMap!21129 (_ BitVec 64)) Bool)

(declare-fun +!4618 (ListLongMap!21129 tuple2!23472) ListLongMap!21129)

(assert (=> b!1323156 (contains!8663 (+!4618 lt!588646 (tuple2!23473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43419 0))(
  ( (Unit!43420) )
))
(declare-fun lt!588643 () Unit!43419)

(declare-fun addStillContains!1142 (ListLongMap!21129 (_ BitVec 64) V!53321 (_ BitVec 64)) Unit!43419)

(assert (=> b!1323156 (= lt!588643 (addStillContains!1142 lt!588646 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323156 (contains!8663 lt!588646 k0!1164)))

(declare-fun lt!588647 () ListLongMap!21129)

(declare-fun lt!588649 () tuple2!23472)

(assert (=> b!1323156 (= lt!588646 (+!4618 lt!588647 lt!588649))))

(declare-fun lt!588641 () Unit!43419)

(declare-fun zeroValue!1279 () V!53321)

(assert (=> b!1323156 (= lt!588641 (addStillContains!1142 lt!588647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323156 (contains!8663 lt!588647 k0!1164)))

(declare-fun lt!588650 () Unit!43419)

(declare-fun lt!588644 () V!53321)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!183 ((_ BitVec 64) (_ BitVec 64) V!53321 ListLongMap!21129) Unit!43419)

(assert (=> b!1323156 (= lt!588650 (lemmaInListMapAfterAddingDiffThenInBefore!183 k0!1164 (select (arr!43063 _keys!1609) from!2000) lt!588644 lt!588647))))

(declare-fun lt!588645 () ListLongMap!21129)

(assert (=> b!1323156 (contains!8663 lt!588645 k0!1164)))

(declare-fun lt!588642 () Unit!43419)

(assert (=> b!1323156 (= lt!588642 (lemmaInListMapAfterAddingDiffThenInBefore!183 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588645))))

(declare-fun lt!588651 () ListLongMap!21129)

(assert (=> b!1323156 (contains!8663 lt!588651 k0!1164)))

(declare-fun lt!588648 () Unit!43419)

(assert (=> b!1323156 (= lt!588648 (lemmaInListMapAfterAddingDiffThenInBefore!183 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588651))))

(assert (=> b!1323156 (= lt!588651 (+!4618 lt!588645 lt!588649))))

(assert (=> b!1323156 (= lt!588649 (tuple2!23473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323156 (= lt!588645 (+!4618 lt!588647 (tuple2!23473 (select (arr!43063 _keys!1609) from!2000) lt!588644)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21691 (ValueCell!17183 V!53321) V!53321)

(declare-fun dynLambda!3548 (Int (_ BitVec 64)) V!53321)

(assert (=> b!1323156 (= lt!588644 (get!21691 (select (arr!43062 _values!1337) from!2000) (dynLambda!3548 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6251 (array!89177 array!89175 (_ BitVec 32) (_ BitVec 32) V!53321 V!53321 (_ BitVec 32) Int) ListLongMap!21129)

(assert (=> b!1323156 (= lt!588647 (getCurrentListMapNoExtraKeys!6251 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323157 () Bool)

(declare-fun res!878265 () Bool)

(assert (=> b!1323157 (=> (not res!878265) (not e!754381))))

(declare-fun getCurrentListMap!5462 (array!89177 array!89175 (_ BitVec 32) (_ BitVec 32) V!53321 V!53321 (_ BitVec 32) Int) ListLongMap!21129)

(assert (=> b!1323157 (= res!878265 (contains!8663 (getCurrentListMap!5462 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323158 () Bool)

(declare-fun e!754377 () Bool)

(assert (=> b!1323158 (= e!754377 tp_is_empty!36163)))

(declare-fun b!1323159 () Bool)

(declare-fun res!878266 () Bool)

(assert (=> b!1323159 (=> (not res!878266) (not e!754381))))

(declare-datatypes ((List!30608 0))(
  ( (Nil!30605) (Cons!30604 (h!31813 (_ BitVec 64)) (t!44492 List!30608)) )
))
(declare-fun arrayNoDuplicates!0 (array!89177 (_ BitVec 32) List!30608) Bool)

(assert (=> b!1323159 (= res!878266 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30605))))

(declare-fun b!1323160 () Bool)

(declare-fun res!878264 () Bool)

(assert (=> b!1323160 (=> (not res!878264) (not e!754381))))

(assert (=> b!1323160 (= res!878264 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43615 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55892 () Bool)

(declare-fun tp!106505 () Bool)

(assert (=> mapNonEmpty!55892 (= mapRes!55892 (and tp!106505 e!754377))))

(declare-fun mapKey!55892 () (_ BitVec 32))

(declare-fun mapRest!55892 () (Array (_ BitVec 32) ValueCell!17183))

(declare-fun mapValue!55892 () ValueCell!17183)

(assert (=> mapNonEmpty!55892 (= (arr!43062 _values!1337) (store mapRest!55892 mapKey!55892 mapValue!55892))))

(assert (= (and start!111686 res!878268) b!1323152))

(assert (= (and b!1323152 res!878271) b!1323155))

(assert (= (and b!1323155 res!878270) b!1323159))

(assert (= (and b!1323159 res!878266) b!1323160))

(assert (= (and b!1323160 res!878264) b!1323157))

(assert (= (and b!1323157 res!878265) b!1323151))

(assert (= (and b!1323151 res!878269) b!1323153))

(assert (= (and b!1323153 res!878267) b!1323156))

(assert (= (and b!1323150 condMapEmpty!55892) mapIsEmpty!55892))

(assert (= (and b!1323150 (not condMapEmpty!55892)) mapNonEmpty!55892))

(get-info :version)

(assert (= (and mapNonEmpty!55892 ((_ is ValueCellFull!17183) mapValue!55892)) b!1323158))

(assert (= (and b!1323150 ((_ is ValueCellFull!17183) mapDefault!55892)) b!1323154))

(assert (= start!111686 b!1323150))

(declare-fun b_lambda!23659 () Bool)

(assert (=> (not b_lambda!23659) (not b!1323156)))

(declare-fun t!44490 () Bool)

(declare-fun tb!11687 () Bool)

(assert (=> (and start!111686 (= defaultEntry!1340 defaultEntry!1340) t!44490) tb!11687))

(declare-fun result!24437 () Bool)

(assert (=> tb!11687 (= result!24437 tp_is_empty!36163)))

(assert (=> b!1323156 t!44490))

(declare-fun b_and!48829 () Bool)

(assert (= b_and!48827 (and (=> t!44490 result!24437) b_and!48829)))

(declare-fun m!1211379 () Bool)

(assert (=> b!1323151 m!1211379))

(declare-fun m!1211381 () Bool)

(assert (=> b!1323156 m!1211381))

(declare-fun m!1211383 () Bool)

(assert (=> b!1323156 m!1211383))

(declare-fun m!1211385 () Bool)

(assert (=> b!1323156 m!1211385))

(declare-fun m!1211387 () Bool)

(assert (=> b!1323156 m!1211387))

(assert (=> b!1323156 m!1211379))

(declare-fun m!1211389 () Bool)

(assert (=> b!1323156 m!1211389))

(declare-fun m!1211391 () Bool)

(assert (=> b!1323156 m!1211391))

(declare-fun m!1211393 () Bool)

(assert (=> b!1323156 m!1211393))

(declare-fun m!1211395 () Bool)

(assert (=> b!1323156 m!1211395))

(assert (=> b!1323156 m!1211391))

(assert (=> b!1323156 m!1211381))

(declare-fun m!1211397 () Bool)

(assert (=> b!1323156 m!1211397))

(declare-fun m!1211399 () Bool)

(assert (=> b!1323156 m!1211399))

(assert (=> b!1323156 m!1211379))

(declare-fun m!1211401 () Bool)

(assert (=> b!1323156 m!1211401))

(declare-fun m!1211403 () Bool)

(assert (=> b!1323156 m!1211403))

(declare-fun m!1211405 () Bool)

(assert (=> b!1323156 m!1211405))

(declare-fun m!1211407 () Bool)

(assert (=> b!1323156 m!1211407))

(declare-fun m!1211409 () Bool)

(assert (=> b!1323156 m!1211409))

(declare-fun m!1211411 () Bool)

(assert (=> b!1323156 m!1211411))

(declare-fun m!1211413 () Bool)

(assert (=> b!1323156 m!1211413))

(declare-fun m!1211415 () Bool)

(assert (=> b!1323156 m!1211415))

(assert (=> b!1323156 m!1211403))

(declare-fun m!1211417 () Bool)

(assert (=> b!1323159 m!1211417))

(declare-fun m!1211419 () Bool)

(assert (=> start!111686 m!1211419))

(declare-fun m!1211421 () Bool)

(assert (=> start!111686 m!1211421))

(declare-fun m!1211423 () Bool)

(assert (=> start!111686 m!1211423))

(declare-fun m!1211425 () Bool)

(assert (=> mapNonEmpty!55892 m!1211425))

(assert (=> b!1323153 m!1211379))

(assert (=> b!1323153 m!1211379))

(declare-fun m!1211427 () Bool)

(assert (=> b!1323153 m!1211427))

(declare-fun m!1211429 () Bool)

(assert (=> b!1323157 m!1211429))

(assert (=> b!1323157 m!1211429))

(declare-fun m!1211431 () Bool)

(assert (=> b!1323157 m!1211431))

(declare-fun m!1211433 () Bool)

(assert (=> b!1323155 m!1211433))

(check-sat b_and!48829 (not b!1323155) tp_is_empty!36163 (not b!1323157) (not b!1323156) (not b_next!30343) (not b!1323153) (not b!1323159) (not start!111686) (not b_lambda!23659) (not mapNonEmpty!55892))
(check-sat b_and!48829 (not b_next!30343))
