; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111904 () Bool)

(assert start!111904)

(declare-fun b_free!30337 () Bool)

(declare-fun b_next!30337 () Bool)

(assert (=> start!111904 (= b_free!30337 (not b_next!30337))))

(declare-fun tp!106487 () Bool)

(declare-fun b_and!48835 () Bool)

(assert (=> start!111904 (= tp!106487 b_and!48835)))

(declare-fun b!1324414 () Bool)

(declare-fun e!755209 () Bool)

(declare-fun tp_is_empty!36157 () Bool)

(assert (=> b!1324414 (= e!755209 tp_is_empty!36157)))

(declare-fun mapNonEmpty!55883 () Bool)

(declare-fun mapRes!55883 () Bool)

(declare-fun tp!106486 () Bool)

(declare-fun e!755211 () Bool)

(assert (=> mapNonEmpty!55883 (= mapRes!55883 (and tp!106486 e!755211))))

(declare-datatypes ((V!53313 0))(
  ( (V!53314 (val!18153 Int)) )
))
(declare-datatypes ((ValueCell!17180 0))(
  ( (ValueCellFull!17180 (v!20778 V!53313)) (EmptyCell!17180) )
))
(declare-fun mapRest!55883 () (Array (_ BitVec 32) ValueCell!17180))

(declare-fun mapValue!55883 () ValueCell!17180)

(declare-fun mapKey!55883 () (_ BitVec 32))

(declare-datatypes ((array!89319 0))(
  ( (array!89320 (arr!43129 (Array (_ BitVec 32) ValueCell!17180)) (size!43680 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89319)

(assert (=> mapNonEmpty!55883 (= (arr!43129 _values!1337) (store mapRest!55883 mapKey!55883 mapValue!55883))))

(declare-fun b!1324415 () Bool)

(assert (=> b!1324415 (= e!755211 tp_is_empty!36157)))

(declare-fun b!1324416 () Bool)

(declare-fun res!878740 () Bool)

(declare-fun e!755208 () Bool)

(assert (=> b!1324416 (=> (not res!878740) (not e!755208))))

(declare-datatypes ((array!89321 0))(
  ( (array!89322 (arr!43130 (Array (_ BitVec 32) (_ BitVec 64))) (size!43681 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89321)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1324416 (= res!878740 (and (= (size!43680 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43681 _keys!1609) (size!43680 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324417 () Bool)

(declare-fun res!878741 () Bool)

(assert (=> b!1324417 (=> (not res!878741) (not e!755208))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324417 (= res!878741 (not (= (select (arr!43130 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324418 () Bool)

(declare-fun e!755210 () Bool)

(assert (=> b!1324418 (= e!755210 (and e!755209 mapRes!55883))))

(declare-fun condMapEmpty!55883 () Bool)

(declare-fun mapDefault!55883 () ValueCell!17180)

(assert (=> b!1324418 (= condMapEmpty!55883 (= (arr!43129 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17180)) mapDefault!55883)))))

(declare-fun b!1324419 () Bool)

(declare-fun res!878746 () Bool)

(assert (=> b!1324419 (=> (not res!878746) (not e!755208))))

(declare-fun minValue!1279 () V!53313)

(declare-fun defaultEntry!1340 () Int)

(declare-fun zeroValue!1279 () V!53313)

(declare-datatypes ((tuple2!23442 0))(
  ( (tuple2!23443 (_1!11732 (_ BitVec 64)) (_2!11732 V!53313)) )
))
(declare-datatypes ((List!30591 0))(
  ( (Nil!30588) (Cons!30587 (h!31805 tuple2!23442) (t!44469 List!30591)) )
))
(declare-datatypes ((ListLongMap!21107 0))(
  ( (ListLongMap!21108 (toList!10569 List!30591)) )
))
(declare-fun contains!8736 (ListLongMap!21107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5554 (array!89321 array!89319 (_ BitVec 32) (_ BitVec 32) V!53313 V!53313 (_ BitVec 32) Int) ListLongMap!21107)

(assert (=> b!1324419 (= res!878746 (contains!8736 (getCurrentListMap!5554 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324420 () Bool)

(declare-fun res!878742 () Bool)

(assert (=> b!1324420 (=> (not res!878742) (not e!755208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324420 (= res!878742 (validKeyInArray!0 (select (arr!43130 _keys!1609) from!2000)))))

(declare-fun b!1324421 () Bool)

(declare-fun res!878745 () Bool)

(assert (=> b!1324421 (=> (not res!878745) (not e!755208))))

(declare-datatypes ((List!30592 0))(
  ( (Nil!30589) (Cons!30588 (h!31806 (_ BitVec 64)) (t!44470 List!30592)) )
))
(declare-fun arrayNoDuplicates!0 (array!89321 (_ BitVec 32) List!30592) Bool)

(assert (=> b!1324421 (= res!878745 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30589))))

(declare-fun b!1324423 () Bool)

(assert (=> b!1324423 (= e!755208 (not true))))

(declare-fun lt!589213 () ListLongMap!21107)

(declare-fun +!4642 (ListLongMap!21107 tuple2!23442) ListLongMap!21107)

(assert (=> b!1324423 (contains!8736 (+!4642 lt!589213 (tuple2!23443 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43571 0))(
  ( (Unit!43572) )
))
(declare-fun lt!589211 () Unit!43571)

(declare-fun addStillContains!1154 (ListLongMap!21107 (_ BitVec 64) V!53313 (_ BitVec 64)) Unit!43571)

(assert (=> b!1324423 (= lt!589211 (addStillContains!1154 lt!589213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1324423 (contains!8736 lt!589213 k0!1164)))

(declare-fun lt!589207 () ListLongMap!21107)

(declare-fun lt!589214 () tuple2!23442)

(assert (=> b!1324423 (= lt!589213 (+!4642 lt!589207 lt!589214))))

(declare-fun lt!589210 () Unit!43571)

(assert (=> b!1324423 (= lt!589210 (addStillContains!1154 lt!589207 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1324423 (contains!8736 lt!589207 k0!1164)))

(declare-fun lt!589209 () Unit!43571)

(declare-fun lt!589206 () V!53313)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!197 ((_ BitVec 64) (_ BitVec 64) V!53313 ListLongMap!21107) Unit!43571)

(assert (=> b!1324423 (= lt!589209 (lemmaInListMapAfterAddingDiffThenInBefore!197 k0!1164 (select (arr!43130 _keys!1609) from!2000) lt!589206 lt!589207))))

(declare-fun lt!589205 () ListLongMap!21107)

(assert (=> b!1324423 (contains!8736 lt!589205 k0!1164)))

(declare-fun lt!589204 () Unit!43571)

(assert (=> b!1324423 (= lt!589204 (lemmaInListMapAfterAddingDiffThenInBefore!197 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589205))))

(declare-fun lt!589208 () ListLongMap!21107)

(assert (=> b!1324423 (contains!8736 lt!589208 k0!1164)))

(declare-fun lt!589212 () Unit!43571)

(assert (=> b!1324423 (= lt!589212 (lemmaInListMapAfterAddingDiffThenInBefore!197 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589208))))

(assert (=> b!1324423 (= lt!589208 (+!4642 lt!589205 lt!589214))))

(assert (=> b!1324423 (= lt!589214 (tuple2!23443 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1324423 (= lt!589205 (+!4642 lt!589207 (tuple2!23443 (select (arr!43130 _keys!1609) from!2000) lt!589206)))))

(declare-fun get!21749 (ValueCell!17180 V!53313) V!53313)

(declare-fun dynLambda!3596 (Int (_ BitVec 64)) V!53313)

(assert (=> b!1324423 (= lt!589206 (get!21749 (select (arr!43129 _values!1337) from!2000) (dynLambda!3596 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6281 (array!89321 array!89319 (_ BitVec 32) (_ BitVec 32) V!53313 V!53313 (_ BitVec 32) Int) ListLongMap!21107)

(assert (=> b!1324423 (= lt!589207 (getCurrentListMapNoExtraKeys!6281 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1324424 () Bool)

(declare-fun res!878739 () Bool)

(assert (=> b!1324424 (=> (not res!878739) (not e!755208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89321 (_ BitVec 32)) Bool)

(assert (=> b!1324424 (= res!878739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55883 () Bool)

(assert (=> mapIsEmpty!55883 mapRes!55883))

(declare-fun res!878744 () Bool)

(assert (=> start!111904 (=> (not res!878744) (not e!755208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111904 (= res!878744 (validMask!0 mask!2019))))

(assert (=> start!111904 e!755208))

(declare-fun array_inv!32835 (array!89321) Bool)

(assert (=> start!111904 (array_inv!32835 _keys!1609)))

(assert (=> start!111904 true))

(assert (=> start!111904 tp_is_empty!36157))

(declare-fun array_inv!32836 (array!89319) Bool)

(assert (=> start!111904 (and (array_inv!32836 _values!1337) e!755210)))

(assert (=> start!111904 tp!106487))

(declare-fun b!1324422 () Bool)

(declare-fun res!878743 () Bool)

(assert (=> b!1324422 (=> (not res!878743) (not e!755208))))

(assert (=> b!1324422 (= res!878743 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43681 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111904 res!878744) b!1324416))

(assert (= (and b!1324416 res!878740) b!1324424))

(assert (= (and b!1324424 res!878739) b!1324421))

(assert (= (and b!1324421 res!878745) b!1324422))

(assert (= (and b!1324422 res!878743) b!1324419))

(assert (= (and b!1324419 res!878746) b!1324417))

(assert (= (and b!1324417 res!878741) b!1324420))

(assert (= (and b!1324420 res!878742) b!1324423))

(assert (= (and b!1324418 condMapEmpty!55883) mapIsEmpty!55883))

(assert (= (and b!1324418 (not condMapEmpty!55883)) mapNonEmpty!55883))

(get-info :version)

(assert (= (and mapNonEmpty!55883 ((_ is ValueCellFull!17180) mapValue!55883)) b!1324415))

(assert (= (and b!1324418 ((_ is ValueCellFull!17180) mapDefault!55883)) b!1324414))

(assert (= start!111904 b!1324418))

(declare-fun b_lambda!23657 () Bool)

(assert (=> (not b_lambda!23657) (not b!1324423)))

(declare-fun t!44468 () Bool)

(declare-fun tb!11681 () Bool)

(assert (=> (and start!111904 (= defaultEntry!1340 defaultEntry!1340) t!44468) tb!11681))

(declare-fun result!24425 () Bool)

(assert (=> tb!11681 (= result!24425 tp_is_empty!36157)))

(assert (=> b!1324423 t!44468))

(declare-fun b_and!48837 () Bool)

(assert (= b_and!48835 (and (=> t!44468 result!24425) b_and!48837)))

(declare-fun m!1213325 () Bool)

(assert (=> start!111904 m!1213325))

(declare-fun m!1213327 () Bool)

(assert (=> start!111904 m!1213327))

(declare-fun m!1213329 () Bool)

(assert (=> start!111904 m!1213329))

(declare-fun m!1213331 () Bool)

(assert (=> mapNonEmpty!55883 m!1213331))

(declare-fun m!1213333 () Bool)

(assert (=> b!1324420 m!1213333))

(assert (=> b!1324420 m!1213333))

(declare-fun m!1213335 () Bool)

(assert (=> b!1324420 m!1213335))

(declare-fun m!1213337 () Bool)

(assert (=> b!1324421 m!1213337))

(declare-fun m!1213339 () Bool)

(assert (=> b!1324424 m!1213339))

(assert (=> b!1324417 m!1213333))

(declare-fun m!1213341 () Bool)

(assert (=> b!1324419 m!1213341))

(assert (=> b!1324419 m!1213341))

(declare-fun m!1213343 () Bool)

(assert (=> b!1324419 m!1213343))

(declare-fun m!1213345 () Bool)

(assert (=> b!1324423 m!1213345))

(declare-fun m!1213347 () Bool)

(assert (=> b!1324423 m!1213347))

(declare-fun m!1213349 () Bool)

(assert (=> b!1324423 m!1213349))

(declare-fun m!1213351 () Bool)

(assert (=> b!1324423 m!1213351))

(declare-fun m!1213353 () Bool)

(assert (=> b!1324423 m!1213353))

(declare-fun m!1213355 () Bool)

(assert (=> b!1324423 m!1213355))

(declare-fun m!1213357 () Bool)

(assert (=> b!1324423 m!1213357))

(assert (=> b!1324423 m!1213333))

(declare-fun m!1213359 () Bool)

(assert (=> b!1324423 m!1213359))

(declare-fun m!1213361 () Bool)

(assert (=> b!1324423 m!1213361))

(assert (=> b!1324423 m!1213333))

(declare-fun m!1213363 () Bool)

(assert (=> b!1324423 m!1213363))

(declare-fun m!1213365 () Bool)

(assert (=> b!1324423 m!1213365))

(declare-fun m!1213367 () Bool)

(assert (=> b!1324423 m!1213367))

(declare-fun m!1213369 () Bool)

(assert (=> b!1324423 m!1213369))

(assert (=> b!1324423 m!1213359))

(declare-fun m!1213371 () Bool)

(assert (=> b!1324423 m!1213371))

(declare-fun m!1213373 () Bool)

(assert (=> b!1324423 m!1213373))

(declare-fun m!1213375 () Bool)

(assert (=> b!1324423 m!1213375))

(assert (=> b!1324423 m!1213369))

(assert (=> b!1324423 m!1213365))

(declare-fun m!1213377 () Bool)

(assert (=> b!1324423 m!1213377))

(declare-fun m!1213379 () Bool)

(assert (=> b!1324423 m!1213379))

(check-sat (not b_lambda!23657) (not b!1324423) (not mapNonEmpty!55883) b_and!48837 (not b!1324420) (not start!111904) (not b!1324424) (not b_next!30337) (not b!1324421) tp_is_empty!36157 (not b!1324419))
(check-sat b_and!48837 (not b_next!30337))
