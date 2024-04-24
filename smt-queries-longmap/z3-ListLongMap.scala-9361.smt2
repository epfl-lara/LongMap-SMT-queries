; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111826 () Bool)

(assert start!111826)

(declare-fun b_free!30259 () Bool)

(declare-fun b_next!30259 () Bool)

(assert (=> start!111826 (= b_free!30259 (not b_next!30259))))

(declare-fun tp!106253 () Bool)

(declare-fun b_and!48679 () Bool)

(assert (=> start!111826 (= tp!106253 b_and!48679)))

(declare-fun b!1323049 () Bool)

(declare-fun e!754627 () Bool)

(declare-fun tp_is_empty!36079 () Bool)

(assert (=> b!1323049 (= e!754627 tp_is_empty!36079)))

(declare-fun mapNonEmpty!55766 () Bool)

(declare-fun mapRes!55766 () Bool)

(declare-fun tp!106252 () Bool)

(declare-fun e!754624 () Bool)

(assert (=> mapNonEmpty!55766 (= mapRes!55766 (and tp!106252 e!754624))))

(declare-datatypes ((V!53209 0))(
  ( (V!53210 (val!18114 Int)) )
))
(declare-datatypes ((ValueCell!17141 0))(
  ( (ValueCellFull!17141 (v!20739 V!53209)) (EmptyCell!17141) )
))
(declare-datatypes ((array!89163 0))(
  ( (array!89164 (arr!43051 (Array (_ BitVec 32) ValueCell!17141)) (size!43602 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89163)

(declare-fun mapKey!55766 () (_ BitVec 32))

(declare-fun mapValue!55766 () ValueCell!17141)

(declare-fun mapRest!55766 () (Array (_ BitVec 32) ValueCell!17141))

(assert (=> mapNonEmpty!55766 (= (arr!43051 _values!1337) (store mapRest!55766 mapKey!55766 mapValue!55766))))

(declare-fun b!1323050 () Bool)

(declare-fun res!877806 () Bool)

(declare-fun e!754626 () Bool)

(assert (=> b!1323050 (=> (not res!877806) (not e!754626))))

(declare-datatypes ((array!89165 0))(
  ( (array!89166 (arr!43052 (Array (_ BitVec 32) (_ BitVec 64))) (size!43603 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89165)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89165 (_ BitVec 32)) Bool)

(assert (=> b!1323050 (= res!877806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323051 () Bool)

(declare-fun res!877805 () Bool)

(assert (=> b!1323051 (=> (not res!877805) (not e!754626))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323051 (= res!877805 (validKeyInArray!0 (select (arr!43052 _keys!1609) from!2000)))))

(declare-fun b!1323052 () Bool)

(assert (=> b!1323052 (= e!754626 (not true))))

(declare-datatypes ((tuple2!23374 0))(
  ( (tuple2!23375 (_1!11698 (_ BitVec 64)) (_2!11698 V!53209)) )
))
(declare-datatypes ((List!30525 0))(
  ( (Nil!30522) (Cons!30521 (h!31739 tuple2!23374) (t!44325 List!30525)) )
))
(declare-datatypes ((ListLongMap!21039 0))(
  ( (ListLongMap!21040 (toList!10535 List!30525)) )
))
(declare-fun lt!588129 () ListLongMap!21039)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8702 (ListLongMap!21039 (_ BitVec 64)) Bool)

(assert (=> b!1323052 (contains!8702 lt!588129 k0!1164)))

(declare-datatypes ((Unit!43509 0))(
  ( (Unit!43510) )
))
(declare-fun lt!588125 () Unit!43509)

(declare-fun lt!588127 () V!53209)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!166 ((_ BitVec 64) (_ BitVec 64) V!53209 ListLongMap!21039) Unit!43509)

(assert (=> b!1323052 (= lt!588125 (lemmaInListMapAfterAddingDiffThenInBefore!166 k0!1164 (select (arr!43052 _keys!1609) from!2000) lt!588127 lt!588129))))

(declare-fun lt!588126 () ListLongMap!21039)

(assert (=> b!1323052 (contains!8702 lt!588126 k0!1164)))

(declare-fun lt!588128 () Unit!43509)

(declare-fun zeroValue!1279 () V!53209)

(assert (=> b!1323052 (= lt!588128 (lemmaInListMapAfterAddingDiffThenInBefore!166 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588126))))

(declare-fun lt!588130 () ListLongMap!21039)

(assert (=> b!1323052 (contains!8702 lt!588130 k0!1164)))

(declare-fun lt!588131 () Unit!43509)

(declare-fun minValue!1279 () V!53209)

(assert (=> b!1323052 (= lt!588131 (lemmaInListMapAfterAddingDiffThenInBefore!166 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588130))))

(declare-fun +!4611 (ListLongMap!21039 tuple2!23374) ListLongMap!21039)

(assert (=> b!1323052 (= lt!588130 (+!4611 lt!588126 (tuple2!23375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1323052 (= lt!588126 (+!4611 lt!588129 (tuple2!23375 (select (arr!43052 _keys!1609) from!2000) lt!588127)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21692 (ValueCell!17141 V!53209) V!53209)

(declare-fun dynLambda!3565 (Int (_ BitVec 64)) V!53209)

(assert (=> b!1323052 (= lt!588127 (get!21692 (select (arr!43051 _values!1337) from!2000) (dynLambda!3565 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6250 (array!89165 array!89163 (_ BitVec 32) (_ BitVec 32) V!53209 V!53209 (_ BitVec 32) Int) ListLongMap!21039)

(assert (=> b!1323052 (= lt!588129 (getCurrentListMapNoExtraKeys!6250 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323053 () Bool)

(declare-fun e!754625 () Bool)

(assert (=> b!1323053 (= e!754625 (and e!754627 mapRes!55766))))

(declare-fun condMapEmpty!55766 () Bool)

(declare-fun mapDefault!55766 () ValueCell!17141)

(assert (=> b!1323053 (= condMapEmpty!55766 (= (arr!43051 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17141)) mapDefault!55766)))))

(declare-fun b!1323054 () Bool)

(assert (=> b!1323054 (= e!754624 tp_is_empty!36079)))

(declare-fun b!1323055 () Bool)

(declare-fun res!877803 () Bool)

(assert (=> b!1323055 (=> (not res!877803) (not e!754626))))

(declare-fun getCurrentListMap!5527 (array!89165 array!89163 (_ BitVec 32) (_ BitVec 32) V!53209 V!53209 (_ BitVec 32) Int) ListLongMap!21039)

(assert (=> b!1323055 (= res!877803 (contains!8702 (getCurrentListMap!5527 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323056 () Bool)

(declare-fun res!877810 () Bool)

(assert (=> b!1323056 (=> (not res!877810) (not e!754626))))

(assert (=> b!1323056 (= res!877810 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43603 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!877809 () Bool)

(assert (=> start!111826 (=> (not res!877809) (not e!754626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111826 (= res!877809 (validMask!0 mask!2019))))

(assert (=> start!111826 e!754626))

(declare-fun array_inv!32775 (array!89165) Bool)

(assert (=> start!111826 (array_inv!32775 _keys!1609)))

(assert (=> start!111826 true))

(assert (=> start!111826 tp_is_empty!36079))

(declare-fun array_inv!32776 (array!89163) Bool)

(assert (=> start!111826 (and (array_inv!32776 _values!1337) e!754625)))

(assert (=> start!111826 tp!106253))

(declare-fun mapIsEmpty!55766 () Bool)

(assert (=> mapIsEmpty!55766 mapRes!55766))

(declare-fun b!1323057 () Bool)

(declare-fun res!877807 () Bool)

(assert (=> b!1323057 (=> (not res!877807) (not e!754626))))

(assert (=> b!1323057 (= res!877807 (and (= (size!43602 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43603 _keys!1609) (size!43602 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323058 () Bool)

(declare-fun res!877804 () Bool)

(assert (=> b!1323058 (=> (not res!877804) (not e!754626))))

(assert (=> b!1323058 (= res!877804 (not (= (select (arr!43052 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323059 () Bool)

(declare-fun res!877808 () Bool)

(assert (=> b!1323059 (=> (not res!877808) (not e!754626))))

(declare-datatypes ((List!30526 0))(
  ( (Nil!30523) (Cons!30522 (h!31740 (_ BitVec 64)) (t!44326 List!30526)) )
))
(declare-fun arrayNoDuplicates!0 (array!89165 (_ BitVec 32) List!30526) Bool)

(assert (=> b!1323059 (= res!877808 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30523))))

(assert (= (and start!111826 res!877809) b!1323057))

(assert (= (and b!1323057 res!877807) b!1323050))

(assert (= (and b!1323050 res!877806) b!1323059))

(assert (= (and b!1323059 res!877808) b!1323056))

(assert (= (and b!1323056 res!877810) b!1323055))

(assert (= (and b!1323055 res!877803) b!1323058))

(assert (= (and b!1323058 res!877804) b!1323051))

(assert (= (and b!1323051 res!877805) b!1323052))

(assert (= (and b!1323053 condMapEmpty!55766) mapIsEmpty!55766))

(assert (= (and b!1323053 (not condMapEmpty!55766)) mapNonEmpty!55766))

(get-info :version)

(assert (= (and mapNonEmpty!55766 ((_ is ValueCellFull!17141) mapValue!55766)) b!1323054))

(assert (= (and b!1323053 ((_ is ValueCellFull!17141) mapDefault!55766)) b!1323049))

(assert (= start!111826 b!1323053))

(declare-fun b_lambda!23579 () Bool)

(assert (=> (not b_lambda!23579) (not b!1323052)))

(declare-fun t!44324 () Bool)

(declare-fun tb!11603 () Bool)

(assert (=> (and start!111826 (= defaultEntry!1340 defaultEntry!1340) t!44324) tb!11603))

(declare-fun result!24269 () Bool)

(assert (=> tb!11603 (= result!24269 tp_is_empty!36079)))

(assert (=> b!1323052 t!44324))

(declare-fun b_and!48681 () Bool)

(assert (= b_and!48679 (and (=> t!44324 result!24269) b_and!48681)))

(declare-fun m!1211357 () Bool)

(assert (=> b!1323050 m!1211357))

(declare-fun m!1211359 () Bool)

(assert (=> b!1323051 m!1211359))

(assert (=> b!1323051 m!1211359))

(declare-fun m!1211361 () Bool)

(assert (=> b!1323051 m!1211361))

(declare-fun m!1211363 () Bool)

(assert (=> b!1323059 m!1211363))

(declare-fun m!1211365 () Bool)

(assert (=> start!111826 m!1211365))

(declare-fun m!1211367 () Bool)

(assert (=> start!111826 m!1211367))

(declare-fun m!1211369 () Bool)

(assert (=> start!111826 m!1211369))

(declare-fun m!1211371 () Bool)

(assert (=> b!1323052 m!1211371))

(declare-fun m!1211373 () Bool)

(assert (=> b!1323052 m!1211373))

(declare-fun m!1211375 () Bool)

(assert (=> b!1323052 m!1211375))

(declare-fun m!1211377 () Bool)

(assert (=> b!1323052 m!1211377))

(declare-fun m!1211379 () Bool)

(assert (=> b!1323052 m!1211379))

(declare-fun m!1211381 () Bool)

(assert (=> b!1323052 m!1211381))

(declare-fun m!1211383 () Bool)

(assert (=> b!1323052 m!1211383))

(assert (=> b!1323052 m!1211379))

(assert (=> b!1323052 m!1211359))

(declare-fun m!1211385 () Bool)

(assert (=> b!1323052 m!1211385))

(declare-fun m!1211387 () Bool)

(assert (=> b!1323052 m!1211387))

(declare-fun m!1211389 () Bool)

(assert (=> b!1323052 m!1211389))

(assert (=> b!1323052 m!1211377))

(declare-fun m!1211391 () Bool)

(assert (=> b!1323052 m!1211391))

(declare-fun m!1211393 () Bool)

(assert (=> b!1323052 m!1211393))

(assert (=> b!1323052 m!1211359))

(assert (=> b!1323058 m!1211359))

(declare-fun m!1211395 () Bool)

(assert (=> b!1323055 m!1211395))

(assert (=> b!1323055 m!1211395))

(declare-fun m!1211397 () Bool)

(assert (=> b!1323055 m!1211397))

(declare-fun m!1211399 () Bool)

(assert (=> mapNonEmpty!55766 m!1211399))

(check-sat (not mapNonEmpty!55766) (not b!1323052) tp_is_empty!36079 (not b_next!30259) (not b!1323051) (not start!111826) (not b!1323050) (not b!1323055) (not b!1323059) (not b_lambda!23579) b_and!48681)
(check-sat b_and!48681 (not b_next!30259))
