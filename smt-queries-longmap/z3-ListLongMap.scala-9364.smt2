; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111844 () Bool)

(assert start!111844)

(declare-fun b_free!30277 () Bool)

(declare-fun b_next!30277 () Bool)

(assert (=> start!111844 (= b_free!30277 (not b_next!30277))))

(declare-fun tp!106306 () Bool)

(declare-fun b_and!48715 () Bool)

(assert (=> start!111844 (= tp!106306 b_and!48715)))

(declare-fun res!878019 () Bool)

(declare-fun e!754761 () Bool)

(assert (=> start!111844 (=> (not res!878019) (not e!754761))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111844 (= res!878019 (validMask!0 mask!2019))))

(assert (=> start!111844 e!754761))

(declare-datatypes ((array!89199 0))(
  ( (array!89200 (arr!43069 (Array (_ BitVec 32) (_ BitVec 64))) (size!43620 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89199)

(declare-fun array_inv!32789 (array!89199) Bool)

(assert (=> start!111844 (array_inv!32789 _keys!1609)))

(assert (=> start!111844 true))

(declare-fun tp_is_empty!36097 () Bool)

(assert (=> start!111844 tp_is_empty!36097))

(declare-datatypes ((V!53233 0))(
  ( (V!53234 (val!18123 Int)) )
))
(declare-datatypes ((ValueCell!17150 0))(
  ( (ValueCellFull!17150 (v!20748 V!53233)) (EmptyCell!17150) )
))
(declare-datatypes ((array!89201 0))(
  ( (array!89202 (arr!43070 (Array (_ BitVec 32) ValueCell!17150)) (size!43621 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89201)

(declare-fun e!754759 () Bool)

(declare-fun array_inv!32790 (array!89201) Bool)

(assert (=> start!111844 (and (array_inv!32790 _values!1337) e!754759)))

(assert (=> start!111844 tp!106306))

(declare-fun b!1323364 () Bool)

(declare-fun res!878022 () Bool)

(assert (=> b!1323364 (=> (not res!878022) (not e!754761))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323364 (= res!878022 (validKeyInArray!0 (select (arr!43069 _keys!1609) from!2000)))))

(declare-fun b!1323365 () Bool)

(declare-fun res!878026 () Bool)

(assert (=> b!1323365 (=> (not res!878026) (not e!754761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89199 (_ BitVec 32)) Bool)

(assert (=> b!1323365 (= res!878026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323366 () Bool)

(declare-fun e!754762 () Bool)

(assert (=> b!1323366 (= e!754762 tp_is_empty!36097)))

(declare-fun b!1323367 () Bool)

(declare-fun e!754760 () Bool)

(assert (=> b!1323367 (= e!754760 tp_is_empty!36097)))

(declare-fun b!1323368 () Bool)

(assert (=> b!1323368 (= e!754761 (not true))))

(declare-datatypes ((tuple2!23390 0))(
  ( (tuple2!23391 (_1!11706 (_ BitVec 64)) (_2!11706 V!53233)) )
))
(declare-datatypes ((List!30540 0))(
  ( (Nil!30537) (Cons!30536 (h!31754 tuple2!23390) (t!44358 List!30540)) )
))
(declare-datatypes ((ListLongMap!21055 0))(
  ( (ListLongMap!21056 (toList!10543 List!30540)) )
))
(declare-fun lt!588359 () ListLongMap!21055)

(declare-fun lt!588358 () tuple2!23390)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8710 (ListLongMap!21055 (_ BitVec 64)) Bool)

(declare-fun +!4619 (ListLongMap!21055 tuple2!23390) ListLongMap!21055)

(assert (=> b!1323368 (contains!8710 (+!4619 lt!588359 lt!588358) k0!1164)))

(declare-fun zeroValue!1279 () V!53233)

(declare-datatypes ((Unit!43525 0))(
  ( (Unit!43526) )
))
(declare-fun lt!588362 () Unit!43525)

(declare-fun addStillContains!1131 (ListLongMap!21055 (_ BitVec 64) V!53233 (_ BitVec 64)) Unit!43525)

(assert (=> b!1323368 (= lt!588362 (addStillContains!1131 lt!588359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323368 (contains!8710 lt!588359 k0!1164)))

(declare-fun lt!588354 () Unit!43525)

(declare-fun lt!588356 () V!53233)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!174 ((_ BitVec 64) (_ BitVec 64) V!53233 ListLongMap!21055) Unit!43525)

(assert (=> b!1323368 (= lt!588354 (lemmaInListMapAfterAddingDiffThenInBefore!174 k0!1164 (select (arr!43069 _keys!1609) from!2000) lt!588356 lt!588359))))

(declare-fun lt!588361 () ListLongMap!21055)

(assert (=> b!1323368 (contains!8710 lt!588361 k0!1164)))

(declare-fun lt!588355 () Unit!43525)

(assert (=> b!1323368 (= lt!588355 (lemmaInListMapAfterAddingDiffThenInBefore!174 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588361))))

(declare-fun lt!588357 () ListLongMap!21055)

(assert (=> b!1323368 (contains!8710 lt!588357 k0!1164)))

(declare-fun minValue!1279 () V!53233)

(declare-fun lt!588360 () Unit!43525)

(assert (=> b!1323368 (= lt!588360 (lemmaInListMapAfterAddingDiffThenInBefore!174 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588357))))

(assert (=> b!1323368 (= lt!588357 (+!4619 lt!588361 lt!588358))))

(assert (=> b!1323368 (= lt!588358 (tuple2!23391 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323368 (= lt!588361 (+!4619 lt!588359 (tuple2!23391 (select (arr!43069 _keys!1609) from!2000) lt!588356)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21706 (ValueCell!17150 V!53233) V!53233)

(declare-fun dynLambda!3573 (Int (_ BitVec 64)) V!53233)

(assert (=> b!1323368 (= lt!588356 (get!21706 (select (arr!43070 _values!1337) from!2000) (dynLambda!3573 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6258 (array!89199 array!89201 (_ BitVec 32) (_ BitVec 32) V!53233 V!53233 (_ BitVec 32) Int) ListLongMap!21055)

(assert (=> b!1323368 (= lt!588359 (getCurrentListMapNoExtraKeys!6258 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323369 () Bool)

(declare-fun res!878023 () Bool)

(assert (=> b!1323369 (=> (not res!878023) (not e!754761))))

(assert (=> b!1323369 (= res!878023 (and (= (size!43621 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43620 _keys!1609) (size!43621 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323370 () Bool)

(declare-fun res!878021 () Bool)

(assert (=> b!1323370 (=> (not res!878021) (not e!754761))))

(declare-fun getCurrentListMap!5533 (array!89199 array!89201 (_ BitVec 32) (_ BitVec 32) V!53233 V!53233 (_ BitVec 32) Int) ListLongMap!21055)

(assert (=> b!1323370 (= res!878021 (contains!8710 (getCurrentListMap!5533 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323371 () Bool)

(declare-fun mapRes!55793 () Bool)

(assert (=> b!1323371 (= e!754759 (and e!754762 mapRes!55793))))

(declare-fun condMapEmpty!55793 () Bool)

(declare-fun mapDefault!55793 () ValueCell!17150)

(assert (=> b!1323371 (= condMapEmpty!55793 (= (arr!43070 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17150)) mapDefault!55793)))))

(declare-fun b!1323372 () Bool)

(declare-fun res!878020 () Bool)

(assert (=> b!1323372 (=> (not res!878020) (not e!754761))))

(declare-datatypes ((List!30541 0))(
  ( (Nil!30538) (Cons!30537 (h!31755 (_ BitVec 64)) (t!44359 List!30541)) )
))
(declare-fun arrayNoDuplicates!0 (array!89199 (_ BitVec 32) List!30541) Bool)

(assert (=> b!1323372 (= res!878020 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30538))))

(declare-fun b!1323373 () Bool)

(declare-fun res!878024 () Bool)

(assert (=> b!1323373 (=> (not res!878024) (not e!754761))))

(assert (=> b!1323373 (= res!878024 (not (= (select (arr!43069 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55793 () Bool)

(declare-fun tp!106307 () Bool)

(assert (=> mapNonEmpty!55793 (= mapRes!55793 (and tp!106307 e!754760))))

(declare-fun mapRest!55793 () (Array (_ BitVec 32) ValueCell!17150))

(declare-fun mapValue!55793 () ValueCell!17150)

(declare-fun mapKey!55793 () (_ BitVec 32))

(assert (=> mapNonEmpty!55793 (= (arr!43070 _values!1337) (store mapRest!55793 mapKey!55793 mapValue!55793))))

(declare-fun b!1323374 () Bool)

(declare-fun res!878025 () Bool)

(assert (=> b!1323374 (=> (not res!878025) (not e!754761))))

(assert (=> b!1323374 (= res!878025 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43620 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55793 () Bool)

(assert (=> mapIsEmpty!55793 mapRes!55793))

(assert (= (and start!111844 res!878019) b!1323369))

(assert (= (and b!1323369 res!878023) b!1323365))

(assert (= (and b!1323365 res!878026) b!1323372))

(assert (= (and b!1323372 res!878020) b!1323374))

(assert (= (and b!1323374 res!878025) b!1323370))

(assert (= (and b!1323370 res!878021) b!1323373))

(assert (= (and b!1323373 res!878024) b!1323364))

(assert (= (and b!1323364 res!878022) b!1323368))

(assert (= (and b!1323371 condMapEmpty!55793) mapIsEmpty!55793))

(assert (= (and b!1323371 (not condMapEmpty!55793)) mapNonEmpty!55793))

(get-info :version)

(assert (= (and mapNonEmpty!55793 ((_ is ValueCellFull!17150) mapValue!55793)) b!1323367))

(assert (= (and b!1323371 ((_ is ValueCellFull!17150) mapDefault!55793)) b!1323366))

(assert (= start!111844 b!1323371))

(declare-fun b_lambda!23597 () Bool)

(assert (=> (not b_lambda!23597) (not b!1323368)))

(declare-fun t!44357 () Bool)

(declare-fun tb!11621 () Bool)

(assert (=> (and start!111844 (= defaultEntry!1340 defaultEntry!1340) t!44357) tb!11621))

(declare-fun result!24305 () Bool)

(assert (=> tb!11621 (= result!24305 tp_is_empty!36097)))

(assert (=> b!1323368 t!44357))

(declare-fun b_and!48717 () Bool)

(assert (= b_and!48715 (and (=> t!44357 result!24305) b_and!48717)))

(declare-fun m!1211789 () Bool)

(assert (=> start!111844 m!1211789))

(declare-fun m!1211791 () Bool)

(assert (=> start!111844 m!1211791))

(declare-fun m!1211793 () Bool)

(assert (=> start!111844 m!1211793))

(declare-fun m!1211795 () Bool)

(assert (=> b!1323365 m!1211795))

(declare-fun m!1211797 () Bool)

(assert (=> b!1323370 m!1211797))

(assert (=> b!1323370 m!1211797))

(declare-fun m!1211799 () Bool)

(assert (=> b!1323370 m!1211799))

(declare-fun m!1211801 () Bool)

(assert (=> b!1323368 m!1211801))

(declare-fun m!1211803 () Bool)

(assert (=> b!1323368 m!1211803))

(declare-fun m!1211805 () Bool)

(assert (=> b!1323368 m!1211805))

(declare-fun m!1211807 () Bool)

(assert (=> b!1323368 m!1211807))

(declare-fun m!1211809 () Bool)

(assert (=> b!1323368 m!1211809))

(declare-fun m!1211811 () Bool)

(assert (=> b!1323368 m!1211811))

(declare-fun m!1211813 () Bool)

(assert (=> b!1323368 m!1211813))

(declare-fun m!1211815 () Bool)

(assert (=> b!1323368 m!1211815))

(assert (=> b!1323368 m!1211813))

(assert (=> b!1323368 m!1211807))

(declare-fun m!1211817 () Bool)

(assert (=> b!1323368 m!1211817))

(declare-fun m!1211819 () Bool)

(assert (=> b!1323368 m!1211819))

(declare-fun m!1211821 () Bool)

(assert (=> b!1323368 m!1211821))

(assert (=> b!1323368 m!1211805))

(declare-fun m!1211823 () Bool)

(assert (=> b!1323368 m!1211823))

(declare-fun m!1211825 () Bool)

(assert (=> b!1323368 m!1211825))

(declare-fun m!1211827 () Bool)

(assert (=> b!1323368 m!1211827))

(assert (=> b!1323368 m!1211819))

(declare-fun m!1211829 () Bool)

(assert (=> b!1323368 m!1211829))

(declare-fun m!1211831 () Bool)

(assert (=> b!1323368 m!1211831))

(assert (=> b!1323373 m!1211819))

(declare-fun m!1211833 () Bool)

(assert (=> b!1323372 m!1211833))

(declare-fun m!1211835 () Bool)

(assert (=> mapNonEmpty!55793 m!1211835))

(assert (=> b!1323364 m!1211819))

(assert (=> b!1323364 m!1211819))

(declare-fun m!1211837 () Bool)

(assert (=> b!1323364 m!1211837))

(check-sat tp_is_empty!36097 (not b!1323368) (not b!1323364) (not start!111844) (not b!1323370) b_and!48717 (not b_lambda!23597) (not b_next!30277) (not b!1323365) (not b!1323372) (not mapNonEmpty!55793))
(check-sat b_and!48717 (not b_next!30277))
