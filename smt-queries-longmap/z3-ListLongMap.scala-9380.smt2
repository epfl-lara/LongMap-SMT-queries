; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111940 () Bool)

(assert start!111940)

(declare-fun b_free!30373 () Bool)

(declare-fun b_next!30373 () Bool)

(assert (=> start!111940 (= b_free!30373 (not b_next!30373))))

(declare-fun tp!106595 () Bool)

(declare-fun b_and!48907 () Bool)

(assert (=> start!111940 (= tp!106595 b_and!48907)))

(declare-fun mapIsEmpty!55937 () Bool)

(declare-fun mapRes!55937 () Bool)

(assert (=> mapIsEmpty!55937 mapRes!55937))

(declare-fun b!1325044 () Bool)

(declare-fun res!879173 () Bool)

(declare-fun e!755478 () Bool)

(assert (=> b!1325044 (=> (not res!879173) (not e!755478))))

(declare-datatypes ((array!89391 0))(
  ( (array!89392 (arr!43165 (Array (_ BitVec 32) (_ BitVec 64))) (size!43716 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89391)

(declare-datatypes ((List!30618 0))(
  ( (Nil!30615) (Cons!30614 (h!31832 (_ BitVec 64)) (t!44532 List!30618)) )
))
(declare-fun arrayNoDuplicates!0 (array!89391 (_ BitVec 32) List!30618) Bool)

(assert (=> b!1325044 (= res!879173 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30615))))

(declare-fun b!1325045 () Bool)

(declare-fun e!755479 () Bool)

(declare-fun tp_is_empty!36193 () Bool)

(assert (=> b!1325045 (= e!755479 tp_is_empty!36193)))

(declare-fun b!1325046 () Bool)

(declare-fun res!879175 () Bool)

(assert (=> b!1325046 (=> (not res!879175) (not e!755478))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1325046 (= res!879175 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43716 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325047 () Bool)

(declare-fun res!879177 () Bool)

(assert (=> b!1325047 (=> (not res!879177) (not e!755478))))

(declare-datatypes ((V!53361 0))(
  ( (V!53362 (val!18171 Int)) )
))
(declare-datatypes ((ValueCell!17198 0))(
  ( (ValueCellFull!17198 (v!20796 V!53361)) (EmptyCell!17198) )
))
(declare-datatypes ((array!89393 0))(
  ( (array!89394 (arr!43166 (Array (_ BitVec 32) ValueCell!17198)) (size!43717 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89393)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1325047 (= res!879177 (and (= (size!43717 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43716 _keys!1609) (size!43717 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325048 () Bool)

(declare-fun res!879176 () Bool)

(assert (=> b!1325048 (=> (not res!879176) (not e!755478))))

(assert (=> b!1325048 (= res!879176 (not (= (select (arr!43165 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325049 () Bool)

(declare-fun res!879178 () Bool)

(assert (=> b!1325049 (=> (not res!879178) (not e!755478))))

(declare-fun zeroValue!1279 () V!53361)

(declare-fun minValue!1279 () V!53361)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23468 0))(
  ( (tuple2!23469 (_1!11745 (_ BitVec 64)) (_2!11745 V!53361)) )
))
(declare-datatypes ((List!30619 0))(
  ( (Nil!30616) (Cons!30615 (h!31833 tuple2!23468) (t!44533 List!30619)) )
))
(declare-datatypes ((ListLongMap!21133 0))(
  ( (ListLongMap!21134 (toList!10582 List!30619)) )
))
(declare-fun contains!8749 (ListLongMap!21133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5566 (array!89391 array!89393 (_ BitVec 32) (_ BitVec 32) V!53361 V!53361 (_ BitVec 32) Int) ListLongMap!21133)

(assert (=> b!1325049 (= res!879178 (contains!8749 (getCurrentListMap!5566 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55937 () Bool)

(declare-fun tp!106594 () Bool)

(declare-fun e!755480 () Bool)

(assert (=> mapNonEmpty!55937 (= mapRes!55937 (and tp!106594 e!755480))))

(declare-fun mapKey!55937 () (_ BitVec 32))

(declare-fun mapRest!55937 () (Array (_ BitVec 32) ValueCell!17198))

(declare-fun mapValue!55937 () ValueCell!17198)

(assert (=> mapNonEmpty!55937 (= (arr!43166 _values!1337) (store mapRest!55937 mapKey!55937 mapValue!55937))))

(declare-fun b!1325050 () Bool)

(assert (=> b!1325050 (= e!755478 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-fun lt!589805 () ListLongMap!21133)

(declare-fun +!4653 (ListLongMap!21133 tuple2!23468) ListLongMap!21133)

(assert (=> b!1325050 (contains!8749 (+!4653 lt!589805 (tuple2!23469 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43593 0))(
  ( (Unit!43594) )
))
(declare-fun lt!589802 () Unit!43593)

(declare-fun addStillContains!1165 (ListLongMap!21133 (_ BitVec 64) V!53361 (_ BitVec 64)) Unit!43593)

(assert (=> b!1325050 (= lt!589802 (addStillContains!1165 lt!589805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1325050 (contains!8749 lt!589805 k0!1164)))

(declare-fun lt!589806 () ListLongMap!21133)

(declare-fun lt!589798 () tuple2!23468)

(assert (=> b!1325050 (= lt!589805 (+!4653 lt!589806 lt!589798))))

(declare-fun lt!589800 () Unit!43593)

(assert (=> b!1325050 (= lt!589800 (addStillContains!1165 lt!589806 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1325050 (contains!8749 lt!589806 k0!1164)))

(declare-fun lt!589801 () V!53361)

(declare-fun lt!589804 () Unit!43593)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!208 ((_ BitVec 64) (_ BitVec 64) V!53361 ListLongMap!21133) Unit!43593)

(assert (=> b!1325050 (= lt!589804 (lemmaInListMapAfterAddingDiffThenInBefore!208 k0!1164 (select (arr!43165 _keys!1609) from!2000) lt!589801 lt!589806))))

(declare-fun lt!589807 () ListLongMap!21133)

(assert (=> b!1325050 (contains!8749 lt!589807 k0!1164)))

(declare-fun lt!589808 () Unit!43593)

(assert (=> b!1325050 (= lt!589808 (lemmaInListMapAfterAddingDiffThenInBefore!208 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589807))))

(declare-fun lt!589803 () ListLongMap!21133)

(assert (=> b!1325050 (contains!8749 lt!589803 k0!1164)))

(declare-fun lt!589799 () Unit!43593)

(assert (=> b!1325050 (= lt!589799 (lemmaInListMapAfterAddingDiffThenInBefore!208 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589803))))

(assert (=> b!1325050 (= lt!589803 (+!4653 lt!589807 lt!589798))))

(assert (=> b!1325050 (= lt!589798 (tuple2!23469 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1325050 (= lt!589807 (+!4653 lt!589806 (tuple2!23469 (select (arr!43165 _keys!1609) from!2000) lt!589801)))))

(declare-fun get!21772 (ValueCell!17198 V!53361) V!53361)

(declare-fun dynLambda!3607 (Int (_ BitVec 64)) V!53361)

(assert (=> b!1325050 (= lt!589801 (get!21772 (select (arr!43166 _values!1337) from!2000) (dynLambda!3607 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6292 (array!89391 array!89393 (_ BitVec 32) (_ BitVec 32) V!53361 V!53361 (_ BitVec 32) Int) ListLongMap!21133)

(assert (=> b!1325050 (= lt!589806 (getCurrentListMapNoExtraKeys!6292 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1325051 () Bool)

(declare-fun res!879174 () Bool)

(assert (=> b!1325051 (=> (not res!879174) (not e!755478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89391 (_ BitVec 32)) Bool)

(assert (=> b!1325051 (= res!879174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325052 () Bool)

(assert (=> b!1325052 (= e!755480 tp_is_empty!36193)))

(declare-fun res!879171 () Bool)

(assert (=> start!111940 (=> (not res!879171) (not e!755478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111940 (= res!879171 (validMask!0 mask!2019))))

(assert (=> start!111940 e!755478))

(declare-fun array_inv!32861 (array!89391) Bool)

(assert (=> start!111940 (array_inv!32861 _keys!1609)))

(assert (=> start!111940 true))

(assert (=> start!111940 tp_is_empty!36193))

(declare-fun e!755481 () Bool)

(declare-fun array_inv!32862 (array!89393) Bool)

(assert (=> start!111940 (and (array_inv!32862 _values!1337) e!755481)))

(assert (=> start!111940 tp!106595))

(declare-fun b!1325053 () Bool)

(declare-fun res!879172 () Bool)

(assert (=> b!1325053 (=> (not res!879172) (not e!755478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325053 (= res!879172 (validKeyInArray!0 (select (arr!43165 _keys!1609) from!2000)))))

(declare-fun b!1325054 () Bool)

(assert (=> b!1325054 (= e!755481 (and e!755479 mapRes!55937))))

(declare-fun condMapEmpty!55937 () Bool)

(declare-fun mapDefault!55937 () ValueCell!17198)

(assert (=> b!1325054 (= condMapEmpty!55937 (= (arr!43166 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17198)) mapDefault!55937)))))

(assert (= (and start!111940 res!879171) b!1325047))

(assert (= (and b!1325047 res!879177) b!1325051))

(assert (= (and b!1325051 res!879174) b!1325044))

(assert (= (and b!1325044 res!879173) b!1325046))

(assert (= (and b!1325046 res!879175) b!1325049))

(assert (= (and b!1325049 res!879178) b!1325048))

(assert (= (and b!1325048 res!879176) b!1325053))

(assert (= (and b!1325053 res!879172) b!1325050))

(assert (= (and b!1325054 condMapEmpty!55937) mapIsEmpty!55937))

(assert (= (and b!1325054 (not condMapEmpty!55937)) mapNonEmpty!55937))

(get-info :version)

(assert (= (and mapNonEmpty!55937 ((_ is ValueCellFull!17198) mapValue!55937)) b!1325052))

(assert (= (and b!1325054 ((_ is ValueCellFull!17198) mapDefault!55937)) b!1325045))

(assert (= start!111940 b!1325054))

(declare-fun b_lambda!23693 () Bool)

(assert (=> (not b_lambda!23693) (not b!1325050)))

(declare-fun t!44531 () Bool)

(declare-fun tb!11717 () Bool)

(assert (=> (and start!111940 (= defaultEntry!1340 defaultEntry!1340) t!44531) tb!11717))

(declare-fun result!24497 () Bool)

(assert (=> tb!11717 (= result!24497 tp_is_empty!36193)))

(assert (=> b!1325050 t!44531))

(declare-fun b_and!48909 () Bool)

(assert (= b_and!48907 (and (=> t!44531 result!24497) b_and!48909)))

(declare-fun m!1214333 () Bool)

(assert (=> b!1325050 m!1214333))

(declare-fun m!1214335 () Bool)

(assert (=> b!1325050 m!1214335))

(declare-fun m!1214337 () Bool)

(assert (=> b!1325050 m!1214337))

(declare-fun m!1214339 () Bool)

(assert (=> b!1325050 m!1214339))

(declare-fun m!1214341 () Bool)

(assert (=> b!1325050 m!1214341))

(declare-fun m!1214343 () Bool)

(assert (=> b!1325050 m!1214343))

(declare-fun m!1214345 () Bool)

(assert (=> b!1325050 m!1214345))

(declare-fun m!1214347 () Bool)

(assert (=> b!1325050 m!1214347))

(declare-fun m!1214349 () Bool)

(assert (=> b!1325050 m!1214349))

(declare-fun m!1214351 () Bool)

(assert (=> b!1325050 m!1214351))

(declare-fun m!1214353 () Bool)

(assert (=> b!1325050 m!1214353))

(assert (=> b!1325050 m!1214339))

(declare-fun m!1214355 () Bool)

(assert (=> b!1325050 m!1214355))

(assert (=> b!1325050 m!1214335))

(assert (=> b!1325050 m!1214345))

(declare-fun m!1214357 () Bool)

(assert (=> b!1325050 m!1214357))

(declare-fun m!1214359 () Bool)

(assert (=> b!1325050 m!1214359))

(assert (=> b!1325050 m!1214353))

(declare-fun m!1214361 () Bool)

(assert (=> b!1325050 m!1214361))

(declare-fun m!1214363 () Bool)

(assert (=> b!1325050 m!1214363))

(declare-fun m!1214365 () Bool)

(assert (=> b!1325050 m!1214365))

(declare-fun m!1214367 () Bool)

(assert (=> b!1325050 m!1214367))

(declare-fun m!1214369 () Bool)

(assert (=> b!1325050 m!1214369))

(declare-fun m!1214371 () Bool)

(assert (=> mapNonEmpty!55937 m!1214371))

(declare-fun m!1214373 () Bool)

(assert (=> b!1325049 m!1214373))

(assert (=> b!1325049 m!1214373))

(declare-fun m!1214375 () Bool)

(assert (=> b!1325049 m!1214375))

(declare-fun m!1214377 () Bool)

(assert (=> start!111940 m!1214377))

(declare-fun m!1214379 () Bool)

(assert (=> start!111940 m!1214379))

(declare-fun m!1214381 () Bool)

(assert (=> start!111940 m!1214381))

(declare-fun m!1214383 () Bool)

(assert (=> b!1325051 m!1214383))

(assert (=> b!1325048 m!1214335))

(declare-fun m!1214385 () Bool)

(assert (=> b!1325044 m!1214385))

(assert (=> b!1325053 m!1214335))

(assert (=> b!1325053 m!1214335))

(declare-fun m!1214387 () Bool)

(assert (=> b!1325053 m!1214387))

(check-sat (not mapNonEmpty!55937) (not b_next!30373) b_and!48909 (not b!1325050) (not b!1325051) (not start!111940) (not b!1325053) (not b!1325049) tp_is_empty!36193 (not b_lambda!23693) (not b!1325044))
(check-sat b_and!48909 (not b_next!30373))
