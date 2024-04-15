; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111680 () Bool)

(assert start!111680)

(declare-fun b_free!30337 () Bool)

(declare-fun b_next!30337 () Bool)

(assert (=> start!111680 (= b_free!30337 (not b_next!30337))))

(declare-fun tp!106487 () Bool)

(declare-fun b_and!48815 () Bool)

(assert (=> start!111680 (= tp!106487 b_and!48815)))

(declare-fun mapNonEmpty!55883 () Bool)

(declare-fun mapRes!55883 () Bool)

(declare-fun tp!106488 () Bool)

(declare-fun e!754334 () Bool)

(assert (=> mapNonEmpty!55883 (= mapRes!55883 (and tp!106488 e!754334))))

(declare-fun mapKey!55883 () (_ BitVec 32))

(declare-datatypes ((V!53313 0))(
  ( (V!53314 (val!18153 Int)) )
))
(declare-datatypes ((ValueCell!17180 0))(
  ( (ValueCellFull!17180 (v!20782 V!53313)) (EmptyCell!17180) )
))
(declare-datatypes ((array!89163 0))(
  ( (array!89164 (arr!43056 (Array (_ BitVec 32) ValueCell!17180)) (size!43608 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89163)

(declare-fun mapValue!55883 () ValueCell!17180)

(declare-fun mapRest!55883 () (Array (_ BitVec 32) ValueCell!17180))

(assert (=> mapNonEmpty!55883 (= (arr!43056 _values!1337) (store mapRest!55883 mapKey!55883 mapValue!55883))))

(declare-fun b!1323045 () Bool)

(declare-fun res!878193 () Bool)

(declare-fun e!754333 () Bool)

(assert (=> b!1323045 (=> (not res!878193) (not e!754333))))

(declare-datatypes ((array!89165 0))(
  ( (array!89166 (arr!43057 (Array (_ BitVec 32) (_ BitVec 64))) (size!43609 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89165)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89165 (_ BitVec 32)) Bool)

(assert (=> b!1323045 (= res!878193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323046 () Bool)

(declare-fun res!878197 () Bool)

(assert (=> b!1323046 (=> (not res!878197) (not e!754333))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53313)

(declare-fun minValue!1279 () V!53313)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23466 0))(
  ( (tuple2!23467 (_1!11744 (_ BitVec 64)) (_2!11744 V!53313)) )
))
(declare-datatypes ((List!30601 0))(
  ( (Nil!30598) (Cons!30597 (h!31806 tuple2!23466) (t!44479 List!30601)) )
))
(declare-datatypes ((ListLongMap!21123 0))(
  ( (ListLongMap!21124 (toList!10577 List!30601)) )
))
(declare-fun contains!8660 (ListLongMap!21123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5460 (array!89165 array!89163 (_ BitVec 32) (_ BitVec 32) V!53313 V!53313 (_ BitVec 32) Int) ListLongMap!21123)

(assert (=> b!1323046 (= res!878197 (contains!8660 (getCurrentListMap!5460 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323047 () Bool)

(declare-fun res!878198 () Bool)

(assert (=> b!1323047 (=> (not res!878198) (not e!754333))))

(assert (=> b!1323047 (= res!878198 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43609 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323048 () Bool)

(declare-fun res!878192 () Bool)

(assert (=> b!1323048 (=> (not res!878192) (not e!754333))))

(assert (=> b!1323048 (= res!878192 (and (= (size!43608 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43609 _keys!1609) (size!43608 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323049 () Bool)

(declare-fun e!754332 () Bool)

(declare-fun tp_is_empty!36157 () Bool)

(assert (=> b!1323049 (= e!754332 tp_is_empty!36157)))

(declare-fun mapIsEmpty!55883 () Bool)

(assert (=> mapIsEmpty!55883 mapRes!55883))

(declare-fun b!1323050 () Bool)

(declare-fun res!878195 () Bool)

(assert (=> b!1323050 (=> (not res!878195) (not e!754333))))

(assert (=> b!1323050 (= res!878195 (not (= (select (arr!43057 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323051 () Bool)

(assert (=> b!1323051 (= e!754333 (not true))))

(declare-fun lt!588543 () ListLongMap!21123)

(declare-fun +!4616 (ListLongMap!21123 tuple2!23466) ListLongMap!21123)

(assert (=> b!1323051 (contains!8660 (+!4616 lt!588543 (tuple2!23467 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43415 0))(
  ( (Unit!43416) )
))
(declare-fun lt!588548 () Unit!43415)

(declare-fun addStillContains!1140 (ListLongMap!21123 (_ BitVec 64) V!53313 (_ BitVec 64)) Unit!43415)

(assert (=> b!1323051 (= lt!588548 (addStillContains!1140 lt!588543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323051 (contains!8660 lt!588543 k0!1164)))

(declare-fun lt!588550 () ListLongMap!21123)

(declare-fun lt!588551 () tuple2!23466)

(assert (=> b!1323051 (= lt!588543 (+!4616 lt!588550 lt!588551))))

(declare-fun lt!588545 () Unit!43415)

(assert (=> b!1323051 (= lt!588545 (addStillContains!1140 lt!588550 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323051 (contains!8660 lt!588550 k0!1164)))

(declare-fun lt!588547 () V!53313)

(declare-fun lt!588546 () Unit!43415)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!181 ((_ BitVec 64) (_ BitVec 64) V!53313 ListLongMap!21123) Unit!43415)

(assert (=> b!1323051 (= lt!588546 (lemmaInListMapAfterAddingDiffThenInBefore!181 k0!1164 (select (arr!43057 _keys!1609) from!2000) lt!588547 lt!588550))))

(declare-fun lt!588552 () ListLongMap!21123)

(assert (=> b!1323051 (contains!8660 lt!588552 k0!1164)))

(declare-fun lt!588542 () Unit!43415)

(assert (=> b!1323051 (= lt!588542 (lemmaInListMapAfterAddingDiffThenInBefore!181 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588552))))

(declare-fun lt!588549 () ListLongMap!21123)

(assert (=> b!1323051 (contains!8660 lt!588549 k0!1164)))

(declare-fun lt!588544 () Unit!43415)

(assert (=> b!1323051 (= lt!588544 (lemmaInListMapAfterAddingDiffThenInBefore!181 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588549))))

(assert (=> b!1323051 (= lt!588549 (+!4616 lt!588552 lt!588551))))

(assert (=> b!1323051 (= lt!588551 (tuple2!23467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323051 (= lt!588552 (+!4616 lt!588550 (tuple2!23467 (select (arr!43057 _keys!1609) from!2000) lt!588547)))))

(declare-fun get!21687 (ValueCell!17180 V!53313) V!53313)

(declare-fun dynLambda!3546 (Int (_ BitVec 64)) V!53313)

(assert (=> b!1323051 (= lt!588547 (get!21687 (select (arr!43056 _values!1337) from!2000) (dynLambda!3546 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6249 (array!89165 array!89163 (_ BitVec 32) (_ BitVec 32) V!53313 V!53313 (_ BitVec 32) Int) ListLongMap!21123)

(assert (=> b!1323051 (= lt!588550 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323052 () Bool)

(declare-fun res!878194 () Bool)

(assert (=> b!1323052 (=> (not res!878194) (not e!754333))))

(declare-datatypes ((List!30602 0))(
  ( (Nil!30599) (Cons!30598 (h!31807 (_ BitVec 64)) (t!44480 List!30602)) )
))
(declare-fun arrayNoDuplicates!0 (array!89165 (_ BitVec 32) List!30602) Bool)

(assert (=> b!1323052 (= res!878194 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30599))))

(declare-fun b!1323054 () Bool)

(assert (=> b!1323054 (= e!754334 tp_is_empty!36157)))

(declare-fun b!1323055 () Bool)

(declare-fun res!878196 () Bool)

(assert (=> b!1323055 (=> (not res!878196) (not e!754333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323055 (= res!878196 (validKeyInArray!0 (select (arr!43057 _keys!1609) from!2000)))))

(declare-fun res!878199 () Bool)

(assert (=> start!111680 (=> (not res!878199) (not e!754333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111680 (= res!878199 (validMask!0 mask!2019))))

(assert (=> start!111680 e!754333))

(declare-fun array_inv!32689 (array!89165) Bool)

(assert (=> start!111680 (array_inv!32689 _keys!1609)))

(assert (=> start!111680 true))

(assert (=> start!111680 tp_is_empty!36157))

(declare-fun e!754336 () Bool)

(declare-fun array_inv!32690 (array!89163) Bool)

(assert (=> start!111680 (and (array_inv!32690 _values!1337) e!754336)))

(assert (=> start!111680 tp!106487))

(declare-fun b!1323053 () Bool)

(assert (=> b!1323053 (= e!754336 (and e!754332 mapRes!55883))))

(declare-fun condMapEmpty!55883 () Bool)

(declare-fun mapDefault!55883 () ValueCell!17180)

(assert (=> b!1323053 (= condMapEmpty!55883 (= (arr!43056 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17180)) mapDefault!55883)))))

(assert (= (and start!111680 res!878199) b!1323048))

(assert (= (and b!1323048 res!878192) b!1323045))

(assert (= (and b!1323045 res!878193) b!1323052))

(assert (= (and b!1323052 res!878194) b!1323047))

(assert (= (and b!1323047 res!878198) b!1323046))

(assert (= (and b!1323046 res!878197) b!1323050))

(assert (= (and b!1323050 res!878195) b!1323055))

(assert (= (and b!1323055 res!878196) b!1323051))

(assert (= (and b!1323053 condMapEmpty!55883) mapIsEmpty!55883))

(assert (= (and b!1323053 (not condMapEmpty!55883)) mapNonEmpty!55883))

(get-info :version)

(assert (= (and mapNonEmpty!55883 ((_ is ValueCellFull!17180) mapValue!55883)) b!1323054))

(assert (= (and b!1323053 ((_ is ValueCellFull!17180) mapDefault!55883)) b!1323049))

(assert (= start!111680 b!1323053))

(declare-fun b_lambda!23653 () Bool)

(assert (=> (not b_lambda!23653) (not b!1323051)))

(declare-fun t!44478 () Bool)

(declare-fun tb!11681 () Bool)

(assert (=> (and start!111680 (= defaultEntry!1340 defaultEntry!1340) t!44478) tb!11681))

(declare-fun result!24425 () Bool)

(assert (=> tb!11681 (= result!24425 tp_is_empty!36157)))

(assert (=> b!1323051 t!44478))

(declare-fun b_and!48817 () Bool)

(assert (= b_and!48815 (and (=> t!44478 result!24425) b_and!48817)))

(declare-fun m!1211211 () Bool)

(assert (=> mapNonEmpty!55883 m!1211211))

(declare-fun m!1211213 () Bool)

(assert (=> b!1323046 m!1211213))

(assert (=> b!1323046 m!1211213))

(declare-fun m!1211215 () Bool)

(assert (=> b!1323046 m!1211215))

(declare-fun m!1211217 () Bool)

(assert (=> b!1323045 m!1211217))

(declare-fun m!1211219 () Bool)

(assert (=> b!1323055 m!1211219))

(assert (=> b!1323055 m!1211219))

(declare-fun m!1211221 () Bool)

(assert (=> b!1323055 m!1211221))

(declare-fun m!1211223 () Bool)

(assert (=> start!111680 m!1211223))

(declare-fun m!1211225 () Bool)

(assert (=> start!111680 m!1211225))

(declare-fun m!1211227 () Bool)

(assert (=> start!111680 m!1211227))

(declare-fun m!1211229 () Bool)

(assert (=> b!1323051 m!1211229))

(declare-fun m!1211231 () Bool)

(assert (=> b!1323051 m!1211231))

(declare-fun m!1211233 () Bool)

(assert (=> b!1323051 m!1211233))

(declare-fun m!1211235 () Bool)

(assert (=> b!1323051 m!1211235))

(declare-fun m!1211237 () Bool)

(assert (=> b!1323051 m!1211237))

(declare-fun m!1211239 () Bool)

(assert (=> b!1323051 m!1211239))

(declare-fun m!1211241 () Bool)

(assert (=> b!1323051 m!1211241))

(assert (=> b!1323051 m!1211219))

(declare-fun m!1211243 () Bool)

(assert (=> b!1323051 m!1211243))

(declare-fun m!1211245 () Bool)

(assert (=> b!1323051 m!1211245))

(declare-fun m!1211247 () Bool)

(assert (=> b!1323051 m!1211247))

(declare-fun m!1211249 () Bool)

(assert (=> b!1323051 m!1211249))

(assert (=> b!1323051 m!1211229))

(declare-fun m!1211251 () Bool)

(assert (=> b!1323051 m!1211251))

(assert (=> b!1323051 m!1211245))

(assert (=> b!1323051 m!1211235))

(declare-fun m!1211253 () Bool)

(assert (=> b!1323051 m!1211253))

(declare-fun m!1211255 () Bool)

(assert (=> b!1323051 m!1211255))

(assert (=> b!1323051 m!1211219))

(declare-fun m!1211257 () Bool)

(assert (=> b!1323051 m!1211257))

(declare-fun m!1211259 () Bool)

(assert (=> b!1323051 m!1211259))

(declare-fun m!1211261 () Bool)

(assert (=> b!1323051 m!1211261))

(declare-fun m!1211263 () Bool)

(assert (=> b!1323051 m!1211263))

(declare-fun m!1211265 () Bool)

(assert (=> b!1323052 m!1211265))

(assert (=> b!1323050 m!1211219))

(check-sat (not b!1323051) (not b_next!30337) (not b!1323055) b_and!48817 (not b_lambda!23653) (not b!1323052) (not start!111680) (not mapNonEmpty!55883) tp_is_empty!36157 (not b!1323046) (not b!1323045))
(check-sat b_and!48817 (not b_next!30337))
