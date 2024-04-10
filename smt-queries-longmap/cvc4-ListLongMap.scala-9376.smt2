; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111696 () Bool)

(assert start!111696)

(declare-fun b_free!30353 () Bool)

(declare-fun b_next!30353 () Bool)

(assert (=> start!111696 (= b_free!30353 (not b_next!30353))))

(declare-fun tp!106535 () Bool)

(declare-fun b_and!48865 () Bool)

(assert (=> start!111696 (= tp!106535 b_and!48865)))

(declare-fun mapIsEmpty!55907 () Bool)

(declare-fun mapRes!55907 () Bool)

(assert (=> mapIsEmpty!55907 mapRes!55907))

(declare-fun b!1323396 () Bool)

(declare-fun res!878414 () Bool)

(declare-fun e!754486 () Bool)

(assert (=> b!1323396 (=> (not res!878414) (not e!754486))))

(declare-datatypes ((array!89264 0))(
  ( (array!89265 (arr!43106 (Array (_ BitVec 32) (_ BitVec 64))) (size!43656 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89264)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1323396 (= res!878414 (not (= (select (arr!43106 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1323397 () Bool)

(declare-fun res!878413 () Bool)

(assert (=> b!1323397 (=> (not res!878413) (not e!754486))))

(declare-datatypes ((List!30552 0))(
  ( (Nil!30549) (Cons!30548 (h!31757 (_ BitVec 64)) (t!44454 List!30552)) )
))
(declare-fun arrayNoDuplicates!0 (array!89264 (_ BitVec 32) List!30552) Bool)

(assert (=> b!1323397 (= res!878413 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30549))))

(declare-fun mapNonEmpty!55907 () Bool)

(declare-fun tp!106534 () Bool)

(declare-fun e!754485 () Bool)

(assert (=> mapNonEmpty!55907 (= mapRes!55907 (and tp!106534 e!754485))))

(declare-datatypes ((V!53333 0))(
  ( (V!53334 (val!18161 Int)) )
))
(declare-datatypes ((ValueCell!17188 0))(
  ( (ValueCellFull!17188 (v!20791 V!53333)) (EmptyCell!17188) )
))
(declare-fun mapValue!55907 () ValueCell!17188)

(declare-fun mapKey!55907 () (_ BitVec 32))

(declare-datatypes ((array!89266 0))(
  ( (array!89267 (arr!43107 (Array (_ BitVec 32) ValueCell!17188)) (size!43657 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89266)

(declare-fun mapRest!55907 () (Array (_ BitVec 32) ValueCell!17188))

(assert (=> mapNonEmpty!55907 (= (arr!43107 _values!1337) (store mapRest!55907 mapKey!55907 mapValue!55907))))

(declare-fun b!1323398 () Bool)

(assert (=> b!1323398 (= e!754486 (not true))))

(declare-datatypes ((tuple2!23410 0))(
  ( (tuple2!23411 (_1!11716 (_ BitVec 64)) (_2!11716 V!53333)) )
))
(declare-datatypes ((List!30553 0))(
  ( (Nil!30550) (Cons!30549 (h!31758 tuple2!23410) (t!44455 List!30553)) )
))
(declare-datatypes ((ListLongMap!21067 0))(
  ( (ListLongMap!21068 (toList!10549 List!30553)) )
))
(declare-fun lt!588999 () ListLongMap!21067)

(declare-fun minValue!1279 () V!53333)

(declare-fun contains!8704 (ListLongMap!21067 (_ BitVec 64)) Bool)

(declare-fun +!4601 (ListLongMap!21067 tuple2!23410) ListLongMap!21067)

(assert (=> b!1323398 (contains!8704 (+!4601 lt!588999 (tuple2!23411 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43622 0))(
  ( (Unit!43623) )
))
(declare-fun lt!588998 () Unit!43622)

(declare-fun addStillContains!1150 (ListLongMap!21067 (_ BitVec 64) V!53333 (_ BitVec 64)) Unit!43622)

(assert (=> b!1323398 (= lt!588998 (addStillContains!1150 lt!588999 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1323398 (contains!8704 lt!588999 k!1164)))

(declare-fun lt!588992 () ListLongMap!21067)

(declare-fun lt!589001 () tuple2!23410)

(assert (=> b!1323398 (= lt!588999 (+!4601 lt!588992 lt!589001))))

(declare-fun zeroValue!1279 () V!53333)

(declare-fun lt!589000 () Unit!43622)

(assert (=> b!1323398 (= lt!589000 (addStillContains!1150 lt!588992 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1323398 (contains!8704 lt!588992 k!1164)))

(declare-fun lt!588996 () Unit!43622)

(declare-fun lt!588993 () V!53333)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!197 ((_ BitVec 64) (_ BitVec 64) V!53333 ListLongMap!21067) Unit!43622)

(assert (=> b!1323398 (= lt!588996 (lemmaInListMapAfterAddingDiffThenInBefore!197 k!1164 (select (arr!43106 _keys!1609) from!2000) lt!588993 lt!588992))))

(declare-fun lt!588994 () ListLongMap!21067)

(assert (=> b!1323398 (contains!8704 lt!588994 k!1164)))

(declare-fun lt!589002 () Unit!43622)

(assert (=> b!1323398 (= lt!589002 (lemmaInListMapAfterAddingDiffThenInBefore!197 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588994))))

(declare-fun lt!588997 () ListLongMap!21067)

(assert (=> b!1323398 (contains!8704 lt!588997 k!1164)))

(declare-fun lt!588995 () Unit!43622)

(assert (=> b!1323398 (= lt!588995 (lemmaInListMapAfterAddingDiffThenInBefore!197 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588997))))

(assert (=> b!1323398 (= lt!588997 (+!4601 lt!588994 lt!589001))))

(assert (=> b!1323398 (= lt!589001 (tuple2!23411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323398 (= lt!588994 (+!4601 lt!588992 (tuple2!23411 (select (arr!43106 _keys!1609) from!2000) lt!588993)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21709 (ValueCell!17188 V!53333) V!53333)

(declare-fun dynLambda!3540 (Int (_ BitVec 64)) V!53333)

(assert (=> b!1323398 (= lt!588993 (get!21709 (select (arr!43107 _values!1337) from!2000) (dynLambda!3540 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6236 (array!89264 array!89266 (_ BitVec 32) (_ BitVec 32) V!53333 V!53333 (_ BitVec 32) Int) ListLongMap!21067)

(assert (=> b!1323398 (= lt!588992 (getCurrentListMapNoExtraKeys!6236 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323399 () Bool)

(declare-fun res!878417 () Bool)

(assert (=> b!1323399 (=> (not res!878417) (not e!754486))))

(declare-fun getCurrentListMap!5546 (array!89264 array!89266 (_ BitVec 32) (_ BitVec 32) V!53333 V!53333 (_ BitVec 32) Int) ListLongMap!21067)

(assert (=> b!1323399 (= res!878417 (contains!8704 (getCurrentListMap!5546 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1323400 () Bool)

(declare-fun res!878418 () Bool)

(assert (=> b!1323400 (=> (not res!878418) (not e!754486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323400 (= res!878418 (validKeyInArray!0 (select (arr!43106 _keys!1609) from!2000)))))

(declare-fun b!1323401 () Bool)

(declare-fun res!878419 () Bool)

(assert (=> b!1323401 (=> (not res!878419) (not e!754486))))

(assert (=> b!1323401 (= res!878419 (and (= (size!43657 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43656 _keys!1609) (size!43657 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323402 () Bool)

(declare-fun res!878420 () Bool)

(assert (=> b!1323402 (=> (not res!878420) (not e!754486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89264 (_ BitVec 32)) Bool)

(assert (=> b!1323402 (= res!878420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323403 () Bool)

(declare-fun tp_is_empty!36173 () Bool)

(assert (=> b!1323403 (= e!754485 tp_is_empty!36173)))

(declare-fun b!1323395 () Bool)

(declare-fun res!878415 () Bool)

(assert (=> b!1323395 (=> (not res!878415) (not e!754486))))

(assert (=> b!1323395 (= res!878415 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43656 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!878416 () Bool)

(assert (=> start!111696 (=> (not res!878416) (not e!754486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111696 (= res!878416 (validMask!0 mask!2019))))

(assert (=> start!111696 e!754486))

(declare-fun array_inv!32545 (array!89264) Bool)

(assert (=> start!111696 (array_inv!32545 _keys!1609)))

(assert (=> start!111696 true))

(assert (=> start!111696 tp_is_empty!36173))

(declare-fun e!754487 () Bool)

(declare-fun array_inv!32546 (array!89266) Bool)

(assert (=> start!111696 (and (array_inv!32546 _values!1337) e!754487)))

(assert (=> start!111696 tp!106535))

(declare-fun b!1323404 () Bool)

(declare-fun e!754489 () Bool)

(assert (=> b!1323404 (= e!754487 (and e!754489 mapRes!55907))))

(declare-fun condMapEmpty!55907 () Bool)

(declare-fun mapDefault!55907 () ValueCell!17188)

