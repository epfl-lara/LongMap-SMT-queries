; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111694 () Bool)

(assert start!111694)

(declare-fun b_free!30351 () Bool)

(declare-fun b_next!30351 () Bool)

(assert (=> start!111694 (= b_free!30351 (not b_next!30351))))

(declare-fun tp!106529 () Bool)

(declare-fun b_and!48861 () Bool)

(assert (=> start!111694 (= tp!106529 b_and!48861)))

(declare-fun b!1323360 () Bool)

(declare-fun e!754470 () Bool)

(declare-fun e!754471 () Bool)

(declare-fun mapRes!55904 () Bool)

(assert (=> b!1323360 (= e!754470 (and e!754471 mapRes!55904))))

(declare-fun condMapEmpty!55904 () Bool)

(declare-datatypes ((V!53331 0))(
  ( (V!53332 (val!18160 Int)) )
))
(declare-datatypes ((ValueCell!17187 0))(
  ( (ValueCellFull!17187 (v!20790 V!53331)) (EmptyCell!17187) )
))
(declare-datatypes ((array!89260 0))(
  ( (array!89261 (arr!43104 (Array (_ BitVec 32) ValueCell!17187)) (size!43654 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89260)

(declare-fun mapDefault!55904 () ValueCell!17187)

(assert (=> b!1323360 (= condMapEmpty!55904 (= (arr!43104 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17187)) mapDefault!55904)))))

(declare-fun b!1323361 () Bool)

(declare-fun tp_is_empty!36171 () Bool)

(assert (=> b!1323361 (= e!754471 tp_is_empty!36171)))

(declare-fun b!1323362 () Bool)

(declare-fun res!878394 () Bool)

(declare-fun e!754472 () Bool)

(assert (=> b!1323362 (=> (not res!878394) (not e!754472))))

(declare-datatypes ((array!89262 0))(
  ( (array!89263 (arr!43105 (Array (_ BitVec 32) (_ BitVec 64))) (size!43655 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89262)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1323362 (= res!878394 (and (= (size!43654 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43655 _keys!1609) (size!43654 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55904 () Bool)

(assert (=> mapIsEmpty!55904 mapRes!55904))

(declare-fun b!1323363 () Bool)

(declare-fun res!878391 () Bool)

(assert (=> b!1323363 (=> (not res!878391) (not e!754472))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323363 (= res!878391 (validKeyInArray!0 (select (arr!43105 _keys!1609) from!2000)))))

(declare-fun res!878395 () Bool)

(assert (=> start!111694 (=> (not res!878395) (not e!754472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111694 (= res!878395 (validMask!0 mask!2019))))

(assert (=> start!111694 e!754472))

(declare-fun array_inv!32543 (array!89262) Bool)

(assert (=> start!111694 (array_inv!32543 _keys!1609)))

(assert (=> start!111694 true))

(assert (=> start!111694 tp_is_empty!36171))

(declare-fun array_inv!32544 (array!89260) Bool)

(assert (=> start!111694 (and (array_inv!32544 _values!1337) e!754470)))

(assert (=> start!111694 tp!106529))

(declare-fun b!1323364 () Bool)

(declare-fun res!878389 () Bool)

(assert (=> b!1323364 (=> (not res!878389) (not e!754472))))

(declare-datatypes ((List!30550 0))(
  ( (Nil!30547) (Cons!30546 (h!31755 (_ BitVec 64)) (t!44450 List!30550)) )
))
(declare-fun arrayNoDuplicates!0 (array!89262 (_ BitVec 32) List!30550) Bool)

(assert (=> b!1323364 (= res!878389 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30547))))

(declare-fun b!1323365 () Bool)

(declare-fun res!878392 () Bool)

(assert (=> b!1323365 (=> (not res!878392) (not e!754472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89262 (_ BitVec 32)) Bool)

(assert (=> b!1323365 (= res!878392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323366 () Bool)

(declare-fun res!878396 () Bool)

(assert (=> b!1323366 (=> (not res!878396) (not e!754472))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323366 (= res!878396 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43655 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323367 () Bool)

(assert (=> b!1323367 (= e!754472 (not true))))

(declare-datatypes ((tuple2!23408 0))(
  ( (tuple2!23409 (_1!11715 (_ BitVec 64)) (_2!11715 V!53331)) )
))
(declare-datatypes ((List!30551 0))(
  ( (Nil!30548) (Cons!30547 (h!31756 tuple2!23408) (t!44451 List!30551)) )
))
(declare-datatypes ((ListLongMap!21065 0))(
  ( (ListLongMap!21066 (toList!10548 List!30551)) )
))
(declare-fun lt!588967 () ListLongMap!21065)

(declare-fun minValue!1279 () V!53331)

(declare-fun contains!8703 (ListLongMap!21065 (_ BitVec 64)) Bool)

(declare-fun +!4600 (ListLongMap!21065 tuple2!23408) ListLongMap!21065)

(assert (=> b!1323367 (contains!8703 (+!4600 lt!588967 (tuple2!23409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43620 0))(
  ( (Unit!43621) )
))
(declare-fun lt!588963 () Unit!43620)

(declare-fun addStillContains!1149 (ListLongMap!21065 (_ BitVec 64) V!53331 (_ BitVec 64)) Unit!43620)

(assert (=> b!1323367 (= lt!588963 (addStillContains!1149 lt!588967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323367 (contains!8703 lt!588967 k0!1164)))

(declare-fun lt!588968 () ListLongMap!21065)

(declare-fun lt!588960 () tuple2!23408)

(assert (=> b!1323367 (= lt!588967 (+!4600 lt!588968 lt!588960))))

(declare-fun zeroValue!1279 () V!53331)

(declare-fun lt!588964 () Unit!43620)

(assert (=> b!1323367 (= lt!588964 (addStillContains!1149 lt!588968 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323367 (contains!8703 lt!588968 k0!1164)))

(declare-fun lt!588961 () V!53331)

(declare-fun lt!588962 () Unit!43620)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!196 ((_ BitVec 64) (_ BitVec 64) V!53331 ListLongMap!21065) Unit!43620)

(assert (=> b!1323367 (= lt!588962 (lemmaInListMapAfterAddingDiffThenInBefore!196 k0!1164 (select (arr!43105 _keys!1609) from!2000) lt!588961 lt!588968))))

(declare-fun lt!588965 () ListLongMap!21065)

(assert (=> b!1323367 (contains!8703 lt!588965 k0!1164)))

(declare-fun lt!588966 () Unit!43620)

(assert (=> b!1323367 (= lt!588966 (lemmaInListMapAfterAddingDiffThenInBefore!196 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588965))))

(declare-fun lt!588959 () ListLongMap!21065)

(assert (=> b!1323367 (contains!8703 lt!588959 k0!1164)))

(declare-fun lt!588969 () Unit!43620)

(assert (=> b!1323367 (= lt!588969 (lemmaInListMapAfterAddingDiffThenInBefore!196 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588959))))

(assert (=> b!1323367 (= lt!588959 (+!4600 lt!588965 lt!588960))))

(assert (=> b!1323367 (= lt!588960 (tuple2!23409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323367 (= lt!588965 (+!4600 lt!588968 (tuple2!23409 (select (arr!43105 _keys!1609) from!2000) lt!588961)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21708 (ValueCell!17187 V!53331) V!53331)

(declare-fun dynLambda!3539 (Int (_ BitVec 64)) V!53331)

(assert (=> b!1323367 (= lt!588961 (get!21708 (select (arr!43104 _values!1337) from!2000) (dynLambda!3539 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6235 (array!89262 array!89260 (_ BitVec 32) (_ BitVec 32) V!53331 V!53331 (_ BitVec 32) Int) ListLongMap!21065)

(assert (=> b!1323367 (= lt!588968 (getCurrentListMapNoExtraKeys!6235 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323368 () Bool)

(declare-fun e!754474 () Bool)

(assert (=> b!1323368 (= e!754474 tp_is_empty!36171)))

(declare-fun mapNonEmpty!55904 () Bool)

(declare-fun tp!106528 () Bool)

(assert (=> mapNonEmpty!55904 (= mapRes!55904 (and tp!106528 e!754474))))

(declare-fun mapValue!55904 () ValueCell!17187)

(declare-fun mapRest!55904 () (Array (_ BitVec 32) ValueCell!17187))

(declare-fun mapKey!55904 () (_ BitVec 32))

(assert (=> mapNonEmpty!55904 (= (arr!43104 _values!1337) (store mapRest!55904 mapKey!55904 mapValue!55904))))

(declare-fun b!1323369 () Bool)

(declare-fun res!878393 () Bool)

(assert (=> b!1323369 (=> (not res!878393) (not e!754472))))

(declare-fun getCurrentListMap!5545 (array!89262 array!89260 (_ BitVec 32) (_ BitVec 32) V!53331 V!53331 (_ BitVec 32) Int) ListLongMap!21065)

(assert (=> b!1323369 (= res!878393 (contains!8703 (getCurrentListMap!5545 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323370 () Bool)

(declare-fun res!878390 () Bool)

(assert (=> b!1323370 (=> (not res!878390) (not e!754472))))

(assert (=> b!1323370 (= res!878390 (not (= (select (arr!43105 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111694 res!878395) b!1323362))

(assert (= (and b!1323362 res!878394) b!1323365))

(assert (= (and b!1323365 res!878392) b!1323364))

(assert (= (and b!1323364 res!878389) b!1323366))

(assert (= (and b!1323366 res!878396) b!1323369))

(assert (= (and b!1323369 res!878393) b!1323370))

(assert (= (and b!1323370 res!878390) b!1323363))

(assert (= (and b!1323363 res!878391) b!1323367))

(assert (= (and b!1323360 condMapEmpty!55904) mapIsEmpty!55904))

(assert (= (and b!1323360 (not condMapEmpty!55904)) mapNonEmpty!55904))

(get-info :version)

(assert (= (and mapNonEmpty!55904 ((_ is ValueCellFull!17187) mapValue!55904)) b!1323368))

(assert (= (and b!1323360 ((_ is ValueCellFull!17187) mapDefault!55904)) b!1323361))

(assert (= start!111694 b!1323360))

(declare-fun b_lambda!23677 () Bool)

(assert (=> (not b_lambda!23677) (not b!1323367)))

(declare-fun t!44449 () Bool)

(declare-fun tb!11703 () Bool)

(assert (=> (and start!111694 (= defaultEntry!1340 defaultEntry!1340) t!44449) tb!11703))

(declare-fun result!24461 () Bool)

(assert (=> tb!11703 (= result!24461 tp_is_empty!36171)))

(assert (=> b!1323367 t!44449))

(declare-fun b_and!48863 () Bool)

(assert (= b_and!48861 (and (=> t!44449 result!24461) b_and!48863)))

(declare-fun m!1212119 () Bool)

(assert (=> b!1323365 m!1212119))

(declare-fun m!1212121 () Bool)

(assert (=> b!1323363 m!1212121))

(assert (=> b!1323363 m!1212121))

(declare-fun m!1212123 () Bool)

(assert (=> b!1323363 m!1212123))

(declare-fun m!1212125 () Bool)

(assert (=> b!1323369 m!1212125))

(assert (=> b!1323369 m!1212125))

(declare-fun m!1212127 () Bool)

(assert (=> b!1323369 m!1212127))

(assert (=> b!1323370 m!1212121))

(declare-fun m!1212129 () Bool)

(assert (=> mapNonEmpty!55904 m!1212129))

(declare-fun m!1212131 () Bool)

(assert (=> b!1323364 m!1212131))

(declare-fun m!1212133 () Bool)

(assert (=> start!111694 m!1212133))

(declare-fun m!1212135 () Bool)

(assert (=> start!111694 m!1212135))

(declare-fun m!1212137 () Bool)

(assert (=> start!111694 m!1212137))

(declare-fun m!1212139 () Bool)

(assert (=> b!1323367 m!1212139))

(declare-fun m!1212141 () Bool)

(assert (=> b!1323367 m!1212141))

(declare-fun m!1212143 () Bool)

(assert (=> b!1323367 m!1212143))

(declare-fun m!1212145 () Bool)

(assert (=> b!1323367 m!1212145))

(declare-fun m!1212147 () Bool)

(assert (=> b!1323367 m!1212147))

(declare-fun m!1212149 () Bool)

(assert (=> b!1323367 m!1212149))

(assert (=> b!1323367 m!1212121))

(declare-fun m!1212151 () Bool)

(assert (=> b!1323367 m!1212151))

(declare-fun m!1212153 () Bool)

(assert (=> b!1323367 m!1212153))

(declare-fun m!1212155 () Bool)

(assert (=> b!1323367 m!1212155))

(declare-fun m!1212157 () Bool)

(assert (=> b!1323367 m!1212157))

(declare-fun m!1212159 () Bool)

(assert (=> b!1323367 m!1212159))

(declare-fun m!1212161 () Bool)

(assert (=> b!1323367 m!1212161))

(declare-fun m!1212163 () Bool)

(assert (=> b!1323367 m!1212163))

(assert (=> b!1323367 m!1212155))

(assert (=> b!1323367 m!1212145))

(declare-fun m!1212165 () Bool)

(assert (=> b!1323367 m!1212165))

(declare-fun m!1212167 () Bool)

(assert (=> b!1323367 m!1212167))

(declare-fun m!1212169 () Bool)

(assert (=> b!1323367 m!1212169))

(assert (=> b!1323367 m!1212153))

(declare-fun m!1212171 () Bool)

(assert (=> b!1323367 m!1212171))

(declare-fun m!1212173 () Bool)

(assert (=> b!1323367 m!1212173))

(assert (=> b!1323367 m!1212121))

(check-sat (not b!1323367) (not b!1323365) (not b!1323363) (not b_next!30351) (not b_lambda!23677) b_and!48863 (not b!1323364) (not start!111694) (not mapNonEmpty!55904) (not b!1323369) tp_is_empty!36171)
(check-sat b_and!48863 (not b_next!30351))
