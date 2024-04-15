; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111716 () Bool)

(assert start!111716)

(declare-fun b_free!30373 () Bool)

(declare-fun b_next!30373 () Bool)

(assert (=> start!111716 (= b_free!30373 (not b_next!30373))))

(declare-fun tp!106595 () Bool)

(declare-fun b_and!48887 () Bool)

(assert (=> start!111716 (= tp!106595 b_and!48887)))

(declare-fun b!1323675 () Bool)

(declare-fun res!878624 () Bool)

(declare-fun e!754604 () Bool)

(assert (=> b!1323675 (=> (not res!878624) (not e!754604))))

(declare-datatypes ((array!89235 0))(
  ( (array!89236 (arr!43092 (Array (_ BitVec 32) (_ BitVec 64))) (size!43644 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89235)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53361 0))(
  ( (V!53362 (val!18171 Int)) )
))
(declare-datatypes ((ValueCell!17198 0))(
  ( (ValueCellFull!17198 (v!20800 V!53361)) (EmptyCell!17198) )
))
(declare-datatypes ((array!89237 0))(
  ( (array!89238 (arr!43093 (Array (_ BitVec 32) ValueCell!17198)) (size!43645 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89237)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1323675 (= res!878624 (and (= (size!43645 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43644 _keys!1609) (size!43645 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55937 () Bool)

(declare-fun mapRes!55937 () Bool)

(declare-fun tp!106596 () Bool)

(declare-fun e!754602 () Bool)

(assert (=> mapNonEmpty!55937 (= mapRes!55937 (and tp!106596 e!754602))))

(declare-fun mapValue!55937 () ValueCell!17198)

(declare-fun mapKey!55937 () (_ BitVec 32))

(declare-fun mapRest!55937 () (Array (_ BitVec 32) ValueCell!17198))

(assert (=> mapNonEmpty!55937 (= (arr!43093 _values!1337) (store mapRest!55937 mapKey!55937 mapValue!55937))))

(declare-fun b!1323676 () Bool)

(declare-fun e!754605 () Bool)

(declare-fun e!754603 () Bool)

(assert (=> b!1323676 (= e!754605 (and e!754603 mapRes!55937))))

(declare-fun condMapEmpty!55937 () Bool)

(declare-fun mapDefault!55937 () ValueCell!17198)

(assert (=> b!1323676 (= condMapEmpty!55937 (= (arr!43093 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17198)) mapDefault!55937)))))

(declare-fun b!1323677 () Bool)

(declare-fun res!878629 () Bool)

(assert (=> b!1323677 (=> (not res!878629) (not e!754604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89235 (_ BitVec 32)) Bool)

(assert (=> b!1323677 (= res!878629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323678 () Bool)

(declare-fun res!878631 () Bool)

(assert (=> b!1323678 (=> (not res!878631) (not e!754604))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323678 (= res!878631 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43644 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323679 () Bool)

(declare-fun res!878626 () Bool)

(assert (=> b!1323679 (=> (not res!878626) (not e!754604))))

(assert (=> b!1323679 (= res!878626 (not (= (select (arr!43092 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323680 () Bool)

(declare-fun tp_is_empty!36193 () Bool)

(assert (=> b!1323680 (= e!754603 tp_is_empty!36193)))

(declare-fun b!1323681 () Bool)

(assert (=> b!1323681 (= e!754604 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23492 0))(
  ( (tuple2!23493 (_1!11757 (_ BitVec 64)) (_2!11757 V!53361)) )
))
(declare-datatypes ((List!30624 0))(
  ( (Nil!30621) (Cons!30620 (h!31829 tuple2!23492) (t!44538 List!30624)) )
))
(declare-datatypes ((ListLongMap!21149 0))(
  ( (ListLongMap!21150 (toList!10590 List!30624)) )
))
(declare-fun lt!589140 () ListLongMap!21149)

(declare-fun minValue!1279 () V!53361)

(declare-fun contains!8673 (ListLongMap!21149 (_ BitVec 64)) Bool)

(declare-fun +!4627 (ListLongMap!21149 tuple2!23492) ListLongMap!21149)

(assert (=> b!1323681 (contains!8673 (+!4627 lt!589140 (tuple2!23493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43437 0))(
  ( (Unit!43438) )
))
(declare-fun lt!589137 () Unit!43437)

(declare-fun addStillContains!1151 (ListLongMap!21149 (_ BitVec 64) V!53361 (_ BitVec 64)) Unit!43437)

(assert (=> b!1323681 (= lt!589137 (addStillContains!1151 lt!589140 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323681 (contains!8673 lt!589140 k0!1164)))

(declare-fun lt!589139 () ListLongMap!21149)

(declare-fun lt!589138 () tuple2!23492)

(assert (=> b!1323681 (= lt!589140 (+!4627 lt!589139 lt!589138))))

(declare-fun zeroValue!1279 () V!53361)

(declare-fun lt!589145 () Unit!43437)

(assert (=> b!1323681 (= lt!589145 (addStillContains!1151 lt!589139 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323681 (contains!8673 lt!589139 k0!1164)))

(declare-fun lt!589143 () Unit!43437)

(declare-fun lt!589144 () V!53361)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!192 ((_ BitVec 64) (_ BitVec 64) V!53361 ListLongMap!21149) Unit!43437)

(assert (=> b!1323681 (= lt!589143 (lemmaInListMapAfterAddingDiffThenInBefore!192 k0!1164 (select (arr!43092 _keys!1609) from!2000) lt!589144 lt!589139))))

(declare-fun lt!589142 () ListLongMap!21149)

(assert (=> b!1323681 (contains!8673 lt!589142 k0!1164)))

(declare-fun lt!589141 () Unit!43437)

(assert (=> b!1323681 (= lt!589141 (lemmaInListMapAfterAddingDiffThenInBefore!192 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589142))))

(declare-fun lt!589136 () ListLongMap!21149)

(assert (=> b!1323681 (contains!8673 lt!589136 k0!1164)))

(declare-fun lt!589146 () Unit!43437)

(assert (=> b!1323681 (= lt!589146 (lemmaInListMapAfterAddingDiffThenInBefore!192 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589136))))

(assert (=> b!1323681 (= lt!589136 (+!4627 lt!589142 lt!589138))))

(assert (=> b!1323681 (= lt!589138 (tuple2!23493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323681 (= lt!589142 (+!4627 lt!589139 (tuple2!23493 (select (arr!43092 _keys!1609) from!2000) lt!589144)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21710 (ValueCell!17198 V!53361) V!53361)

(declare-fun dynLambda!3557 (Int (_ BitVec 64)) V!53361)

(assert (=> b!1323681 (= lt!589144 (get!21710 (select (arr!43093 _values!1337) from!2000) (dynLambda!3557 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6260 (array!89235 array!89237 (_ BitVec 32) (_ BitVec 32) V!53361 V!53361 (_ BitVec 32) Int) ListLongMap!21149)

(assert (=> b!1323681 (= lt!589139 (getCurrentListMapNoExtraKeys!6260 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323682 () Bool)

(declare-fun res!878627 () Bool)

(assert (=> b!1323682 (=> (not res!878627) (not e!754604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323682 (= res!878627 (validKeyInArray!0 (select (arr!43092 _keys!1609) from!2000)))))

(declare-fun b!1323683 () Bool)

(declare-fun res!878628 () Bool)

(assert (=> b!1323683 (=> (not res!878628) (not e!754604))))

(declare-fun getCurrentListMap!5470 (array!89235 array!89237 (_ BitVec 32) (_ BitVec 32) V!53361 V!53361 (_ BitVec 32) Int) ListLongMap!21149)

(assert (=> b!1323683 (= res!878628 (contains!8673 (getCurrentListMap!5470 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55937 () Bool)

(assert (=> mapIsEmpty!55937 mapRes!55937))

(declare-fun b!1323684 () Bool)

(assert (=> b!1323684 (= e!754602 tp_is_empty!36193)))

(declare-fun b!1323685 () Bool)

(declare-fun res!878630 () Bool)

(assert (=> b!1323685 (=> (not res!878630) (not e!754604))))

(declare-datatypes ((List!30625 0))(
  ( (Nil!30622) (Cons!30621 (h!31830 (_ BitVec 64)) (t!44539 List!30625)) )
))
(declare-fun arrayNoDuplicates!0 (array!89235 (_ BitVec 32) List!30625) Bool)

(assert (=> b!1323685 (= res!878630 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30622))))

(declare-fun res!878625 () Bool)

(assert (=> start!111716 (=> (not res!878625) (not e!754604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111716 (= res!878625 (validMask!0 mask!2019))))

(assert (=> start!111716 e!754604))

(declare-fun array_inv!32715 (array!89235) Bool)

(assert (=> start!111716 (array_inv!32715 _keys!1609)))

(assert (=> start!111716 true))

(assert (=> start!111716 tp_is_empty!36193))

(declare-fun array_inv!32716 (array!89237) Bool)

(assert (=> start!111716 (and (array_inv!32716 _values!1337) e!754605)))

(assert (=> start!111716 tp!106595))

(assert (= (and start!111716 res!878625) b!1323675))

(assert (= (and b!1323675 res!878624) b!1323677))

(assert (= (and b!1323677 res!878629) b!1323685))

(assert (= (and b!1323685 res!878630) b!1323678))

(assert (= (and b!1323678 res!878631) b!1323683))

(assert (= (and b!1323683 res!878628) b!1323679))

(assert (= (and b!1323679 res!878626) b!1323682))

(assert (= (and b!1323682 res!878627) b!1323681))

(assert (= (and b!1323676 condMapEmpty!55937) mapIsEmpty!55937))

(assert (= (and b!1323676 (not condMapEmpty!55937)) mapNonEmpty!55937))

(get-info :version)

(assert (= (and mapNonEmpty!55937 ((_ is ValueCellFull!17198) mapValue!55937)) b!1323684))

(assert (= (and b!1323676 ((_ is ValueCellFull!17198) mapDefault!55937)) b!1323680))

(assert (= start!111716 b!1323676))

(declare-fun b_lambda!23689 () Bool)

(assert (=> (not b_lambda!23689) (not b!1323681)))

(declare-fun t!44537 () Bool)

(declare-fun tb!11717 () Bool)

(assert (=> (and start!111716 (= defaultEntry!1340 defaultEntry!1340) t!44537) tb!11717))

(declare-fun result!24497 () Bool)

(assert (=> tb!11717 (= result!24497 tp_is_empty!36193)))

(assert (=> b!1323681 t!44537))

(declare-fun b_and!48889 () Bool)

(assert (= b_and!48887 (and (=> t!44537 result!24497) b_and!48889)))

(declare-fun m!1212219 () Bool)

(assert (=> b!1323679 m!1212219))

(declare-fun m!1212221 () Bool)

(assert (=> b!1323677 m!1212221))

(assert (=> b!1323681 m!1212219))

(declare-fun m!1212223 () Bool)

(assert (=> b!1323681 m!1212223))

(declare-fun m!1212225 () Bool)

(assert (=> b!1323681 m!1212225))

(declare-fun m!1212227 () Bool)

(assert (=> b!1323681 m!1212227))

(declare-fun m!1212229 () Bool)

(assert (=> b!1323681 m!1212229))

(declare-fun m!1212231 () Bool)

(assert (=> b!1323681 m!1212231))

(declare-fun m!1212233 () Bool)

(assert (=> b!1323681 m!1212233))

(declare-fun m!1212235 () Bool)

(assert (=> b!1323681 m!1212235))

(declare-fun m!1212237 () Bool)

(assert (=> b!1323681 m!1212237))

(declare-fun m!1212239 () Bool)

(assert (=> b!1323681 m!1212239))

(assert (=> b!1323681 m!1212219))

(declare-fun m!1212241 () Bool)

(assert (=> b!1323681 m!1212241))

(declare-fun m!1212243 () Bool)

(assert (=> b!1323681 m!1212243))

(declare-fun m!1212245 () Bool)

(assert (=> b!1323681 m!1212245))

(declare-fun m!1212247 () Bool)

(assert (=> b!1323681 m!1212247))

(declare-fun m!1212249 () Bool)

(assert (=> b!1323681 m!1212249))

(declare-fun m!1212251 () Bool)

(assert (=> b!1323681 m!1212251))

(assert (=> b!1323681 m!1212249))

(assert (=> b!1323681 m!1212241))

(declare-fun m!1212253 () Bool)

(assert (=> b!1323681 m!1212253))

(declare-fun m!1212255 () Bool)

(assert (=> b!1323681 m!1212255))

(assert (=> b!1323681 m!1212243))

(declare-fun m!1212257 () Bool)

(assert (=> b!1323681 m!1212257))

(declare-fun m!1212259 () Bool)

(assert (=> mapNonEmpty!55937 m!1212259))

(declare-fun m!1212261 () Bool)

(assert (=> b!1323685 m!1212261))

(declare-fun m!1212263 () Bool)

(assert (=> start!111716 m!1212263))

(declare-fun m!1212265 () Bool)

(assert (=> start!111716 m!1212265))

(declare-fun m!1212267 () Bool)

(assert (=> start!111716 m!1212267))

(declare-fun m!1212269 () Bool)

(assert (=> b!1323683 m!1212269))

(assert (=> b!1323683 m!1212269))

(declare-fun m!1212271 () Bool)

(assert (=> b!1323683 m!1212271))

(assert (=> b!1323682 m!1212219))

(assert (=> b!1323682 m!1212219))

(declare-fun m!1212273 () Bool)

(assert (=> b!1323682 m!1212273))

(check-sat (not b_next!30373) (not start!111716) (not b!1323685) (not b!1323682) (not b!1323683) (not b_lambda!23689) b_and!48889 (not mapNonEmpty!55937) (not b!1323677) (not b!1323681) tp_is_empty!36193)
(check-sat b_and!48889 (not b_next!30373))
