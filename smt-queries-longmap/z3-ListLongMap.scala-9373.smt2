; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111898 () Bool)

(assert start!111898)

(declare-fun b_free!30331 () Bool)

(declare-fun b_next!30331 () Bool)

(assert (=> start!111898 (= b_free!30331 (not b_next!30331))))

(declare-fun tp!106469 () Bool)

(declare-fun b_and!48823 () Bool)

(assert (=> start!111898 (= tp!106469 b_and!48823)))

(declare-fun b!1324310 () Bool)

(declare-fun res!878670 () Bool)

(declare-fun e!755166 () Bool)

(assert (=> b!1324310 (=> (not res!878670) (not e!755166))))

(declare-datatypes ((array!89307 0))(
  ( (array!89308 (arr!43123 (Array (_ BitVec 32) (_ BitVec 64))) (size!43674 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89307)

(declare-datatypes ((List!30587 0))(
  ( (Nil!30584) (Cons!30583 (h!31801 (_ BitVec 64)) (t!44459 List!30587)) )
))
(declare-fun arrayNoDuplicates!0 (array!89307 (_ BitVec 32) List!30587) Bool)

(assert (=> b!1324310 (= res!878670 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30584))))

(declare-fun b!1324311 () Bool)

(declare-fun e!755163 () Bool)

(declare-fun e!755164 () Bool)

(declare-fun mapRes!55874 () Bool)

(assert (=> b!1324311 (= e!755163 (and e!755164 mapRes!55874))))

(declare-fun condMapEmpty!55874 () Bool)

(declare-datatypes ((V!53305 0))(
  ( (V!53306 (val!18150 Int)) )
))
(declare-datatypes ((ValueCell!17177 0))(
  ( (ValueCellFull!17177 (v!20775 V!53305)) (EmptyCell!17177) )
))
(declare-datatypes ((array!89309 0))(
  ( (array!89310 (arr!43124 (Array (_ BitVec 32) ValueCell!17177)) (size!43675 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89309)

(declare-fun mapDefault!55874 () ValueCell!17177)

(assert (=> b!1324311 (= condMapEmpty!55874 (= (arr!43124 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17177)) mapDefault!55874)))))

(declare-fun b!1324312 () Bool)

(declare-fun res!878667 () Bool)

(assert (=> b!1324312 (=> (not res!878667) (not e!755166))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89307 (_ BitVec 32)) Bool)

(assert (=> b!1324312 (= res!878667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324313 () Bool)

(assert (=> b!1324313 (= e!755166 (not true))))

(declare-datatypes ((tuple2!23438 0))(
  ( (tuple2!23439 (_1!11730 (_ BitVec 64)) (_2!11730 V!53305)) )
))
(declare-datatypes ((List!30588 0))(
  ( (Nil!30585) (Cons!30584 (h!31802 tuple2!23438) (t!44460 List!30588)) )
))
(declare-datatypes ((ListLongMap!21103 0))(
  ( (ListLongMap!21104 (toList!10567 List!30588)) )
))
(declare-fun lt!589106 () ListLongMap!21103)

(declare-fun minValue!1279 () V!53305)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8734 (ListLongMap!21103 (_ BitVec 64)) Bool)

(declare-fun +!4641 (ListLongMap!21103 tuple2!23438) ListLongMap!21103)

(assert (=> b!1324313 (contains!8734 (+!4641 lt!589106 (tuple2!23439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43569 0))(
  ( (Unit!43570) )
))
(declare-fun lt!589108 () Unit!43569)

(declare-fun addStillContains!1153 (ListLongMap!21103 (_ BitVec 64) V!53305 (_ BitVec 64)) Unit!43569)

(assert (=> b!1324313 (= lt!589108 (addStillContains!1153 lt!589106 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1324313 (contains!8734 lt!589106 k0!1164)))

(declare-fun lt!589113 () ListLongMap!21103)

(declare-fun lt!589112 () tuple2!23438)

(assert (=> b!1324313 (= lt!589106 (+!4641 lt!589113 lt!589112))))

(declare-fun lt!589111 () Unit!43569)

(declare-fun zeroValue!1279 () V!53305)

(assert (=> b!1324313 (= lt!589111 (addStillContains!1153 lt!589113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1324313 (contains!8734 lt!589113 k0!1164)))

(declare-fun lt!589115 () Unit!43569)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!589107 () V!53305)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!196 ((_ BitVec 64) (_ BitVec 64) V!53305 ListLongMap!21103) Unit!43569)

(assert (=> b!1324313 (= lt!589115 (lemmaInListMapAfterAddingDiffThenInBefore!196 k0!1164 (select (arr!43123 _keys!1609) from!2000) lt!589107 lt!589113))))

(declare-fun lt!589114 () ListLongMap!21103)

(assert (=> b!1324313 (contains!8734 lt!589114 k0!1164)))

(declare-fun lt!589109 () Unit!43569)

(assert (=> b!1324313 (= lt!589109 (lemmaInListMapAfterAddingDiffThenInBefore!196 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589114))))

(declare-fun lt!589105 () ListLongMap!21103)

(assert (=> b!1324313 (contains!8734 lt!589105 k0!1164)))

(declare-fun lt!589110 () Unit!43569)

(assert (=> b!1324313 (= lt!589110 (lemmaInListMapAfterAddingDiffThenInBefore!196 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589105))))

(assert (=> b!1324313 (= lt!589105 (+!4641 lt!589114 lt!589112))))

(assert (=> b!1324313 (= lt!589112 (tuple2!23439 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1324313 (= lt!589114 (+!4641 lt!589113 (tuple2!23439 (select (arr!43123 _keys!1609) from!2000) lt!589107)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21746 (ValueCell!17177 V!53305) V!53305)

(declare-fun dynLambda!3595 (Int (_ BitVec 64)) V!53305)

(assert (=> b!1324313 (= lt!589107 (get!21746 (select (arr!43124 _values!1337) from!2000) (dynLambda!3595 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6280 (array!89307 array!89309 (_ BitVec 32) (_ BitVec 32) V!53305 V!53305 (_ BitVec 32) Int) ListLongMap!21103)

(assert (=> b!1324313 (= lt!589113 (getCurrentListMapNoExtraKeys!6280 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1324314 () Bool)

(declare-fun res!878669 () Bool)

(assert (=> b!1324314 (=> (not res!878669) (not e!755166))))

(declare-fun getCurrentListMap!5552 (array!89307 array!89309 (_ BitVec 32) (_ BitVec 32) V!53305 V!53305 (_ BitVec 32) Int) ListLongMap!21103)

(assert (=> b!1324314 (= res!878669 (contains!8734 (getCurrentListMap!5552 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324315 () Bool)

(declare-fun res!878673 () Bool)

(assert (=> b!1324315 (=> (not res!878673) (not e!755166))))

(assert (=> b!1324315 (= res!878673 (and (= (size!43675 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43674 _keys!1609) (size!43675 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324316 () Bool)

(declare-fun tp_is_empty!36151 () Bool)

(assert (=> b!1324316 (= e!755164 tp_is_empty!36151)))

(declare-fun b!1324309 () Bool)

(declare-fun res!878668 () Bool)

(assert (=> b!1324309 (=> (not res!878668) (not e!755166))))

(assert (=> b!1324309 (= res!878668 (not (= (select (arr!43123 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!878674 () Bool)

(assert (=> start!111898 (=> (not res!878674) (not e!755166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111898 (= res!878674 (validMask!0 mask!2019))))

(assert (=> start!111898 e!755166))

(declare-fun array_inv!32831 (array!89307) Bool)

(assert (=> start!111898 (array_inv!32831 _keys!1609)))

(assert (=> start!111898 true))

(assert (=> start!111898 tp_is_empty!36151))

(declare-fun array_inv!32832 (array!89309) Bool)

(assert (=> start!111898 (and (array_inv!32832 _values!1337) e!755163)))

(assert (=> start!111898 tp!106469))

(declare-fun mapNonEmpty!55874 () Bool)

(declare-fun tp!106468 () Bool)

(declare-fun e!755165 () Bool)

(assert (=> mapNonEmpty!55874 (= mapRes!55874 (and tp!106468 e!755165))))

(declare-fun mapRest!55874 () (Array (_ BitVec 32) ValueCell!17177))

(declare-fun mapValue!55874 () ValueCell!17177)

(declare-fun mapKey!55874 () (_ BitVec 32))

(assert (=> mapNonEmpty!55874 (= (arr!43124 _values!1337) (store mapRest!55874 mapKey!55874 mapValue!55874))))

(declare-fun b!1324317 () Bool)

(declare-fun res!878672 () Bool)

(assert (=> b!1324317 (=> (not res!878672) (not e!755166))))

(assert (=> b!1324317 (= res!878672 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43674 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324318 () Bool)

(declare-fun res!878671 () Bool)

(assert (=> b!1324318 (=> (not res!878671) (not e!755166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324318 (= res!878671 (validKeyInArray!0 (select (arr!43123 _keys!1609) from!2000)))))

(declare-fun b!1324319 () Bool)

(assert (=> b!1324319 (= e!755165 tp_is_empty!36151)))

(declare-fun mapIsEmpty!55874 () Bool)

(assert (=> mapIsEmpty!55874 mapRes!55874))

(assert (= (and start!111898 res!878674) b!1324315))

(assert (= (and b!1324315 res!878673) b!1324312))

(assert (= (and b!1324312 res!878667) b!1324310))

(assert (= (and b!1324310 res!878670) b!1324317))

(assert (= (and b!1324317 res!878672) b!1324314))

(assert (= (and b!1324314 res!878669) b!1324309))

(assert (= (and b!1324309 res!878668) b!1324318))

(assert (= (and b!1324318 res!878671) b!1324313))

(assert (= (and b!1324311 condMapEmpty!55874) mapIsEmpty!55874))

(assert (= (and b!1324311 (not condMapEmpty!55874)) mapNonEmpty!55874))

(get-info :version)

(assert (= (and mapNonEmpty!55874 ((_ is ValueCellFull!17177) mapValue!55874)) b!1324319))

(assert (= (and b!1324311 ((_ is ValueCellFull!17177) mapDefault!55874)) b!1324316))

(assert (= start!111898 b!1324311))

(declare-fun b_lambda!23651 () Bool)

(assert (=> (not b_lambda!23651) (not b!1324313)))

(declare-fun t!44458 () Bool)

(declare-fun tb!11675 () Bool)

(assert (=> (and start!111898 (= defaultEntry!1340 defaultEntry!1340) t!44458) tb!11675))

(declare-fun result!24413 () Bool)

(assert (=> tb!11675 (= result!24413 tp_is_empty!36151)))

(assert (=> b!1324313 t!44458))

(declare-fun b_and!48825 () Bool)

(assert (= b_and!48823 (and (=> t!44458 result!24413) b_and!48825)))

(declare-fun m!1213157 () Bool)

(assert (=> b!1324318 m!1213157))

(assert (=> b!1324318 m!1213157))

(declare-fun m!1213159 () Bool)

(assert (=> b!1324318 m!1213159))

(declare-fun m!1213161 () Bool)

(assert (=> b!1324314 m!1213161))

(assert (=> b!1324314 m!1213161))

(declare-fun m!1213163 () Bool)

(assert (=> b!1324314 m!1213163))

(declare-fun m!1213165 () Bool)

(assert (=> mapNonEmpty!55874 m!1213165))

(declare-fun m!1213167 () Bool)

(assert (=> b!1324312 m!1213167))

(assert (=> b!1324309 m!1213157))

(declare-fun m!1213169 () Bool)

(assert (=> b!1324310 m!1213169))

(declare-fun m!1213171 () Bool)

(assert (=> b!1324313 m!1213171))

(declare-fun m!1213173 () Bool)

(assert (=> b!1324313 m!1213173))

(declare-fun m!1213175 () Bool)

(assert (=> b!1324313 m!1213175))

(declare-fun m!1213177 () Bool)

(assert (=> b!1324313 m!1213177))

(declare-fun m!1213179 () Bool)

(assert (=> b!1324313 m!1213179))

(declare-fun m!1213181 () Bool)

(assert (=> b!1324313 m!1213181))

(declare-fun m!1213183 () Bool)

(assert (=> b!1324313 m!1213183))

(declare-fun m!1213185 () Bool)

(assert (=> b!1324313 m!1213185))

(assert (=> b!1324313 m!1213157))

(assert (=> b!1324313 m!1213157))

(declare-fun m!1213187 () Bool)

(assert (=> b!1324313 m!1213187))

(declare-fun m!1213189 () Bool)

(assert (=> b!1324313 m!1213189))

(declare-fun m!1213191 () Bool)

(assert (=> b!1324313 m!1213191))

(assert (=> b!1324313 m!1213189))

(declare-fun m!1213193 () Bool)

(assert (=> b!1324313 m!1213193))

(declare-fun m!1213195 () Bool)

(assert (=> b!1324313 m!1213195))

(declare-fun m!1213197 () Bool)

(assert (=> b!1324313 m!1213197))

(declare-fun m!1213199 () Bool)

(assert (=> b!1324313 m!1213199))

(declare-fun m!1213201 () Bool)

(assert (=> b!1324313 m!1213201))

(declare-fun m!1213203 () Bool)

(assert (=> b!1324313 m!1213203))

(assert (=> b!1324313 m!1213183))

(assert (=> b!1324313 m!1213179))

(declare-fun m!1213205 () Bool)

(assert (=> b!1324313 m!1213205))

(declare-fun m!1213207 () Bool)

(assert (=> start!111898 m!1213207))

(declare-fun m!1213209 () Bool)

(assert (=> start!111898 m!1213209))

(declare-fun m!1213211 () Bool)

(assert (=> start!111898 m!1213211))

(check-sat b_and!48825 (not b_lambda!23651) tp_is_empty!36151 (not b!1324312) (not b!1324314) (not mapNonEmpty!55874) (not b!1324310) (not b!1324313) (not b_next!30331) (not start!111898) (not b!1324318))
(check-sat b_and!48825 (not b_next!30331))
