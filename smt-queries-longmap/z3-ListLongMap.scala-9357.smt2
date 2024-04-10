; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111580 () Bool)

(assert start!111580)

(declare-fun b_free!30237 () Bool)

(declare-fun b_next!30237 () Bool)

(assert (=> start!111580 (= b_free!30237 (not b_next!30237))))

(declare-fun tp!106186 () Bool)

(declare-fun b_and!48633 () Bool)

(assert (=> start!111580 (= tp!106186 b_and!48633)))

(declare-fun b!1321365 () Bool)

(declare-fun e!753618 () Bool)

(declare-fun tp_is_empty!36057 () Bool)

(assert (=> b!1321365 (= e!753618 tp_is_empty!36057)))

(declare-fun res!877024 () Bool)

(declare-fun e!753616 () Bool)

(assert (=> start!111580 (=> (not res!877024) (not e!753616))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111580 (= res!877024 (validMask!0 mask!2019))))

(assert (=> start!111580 e!753616))

(declare-datatypes ((array!89040 0))(
  ( (array!89041 (arr!42994 (Array (_ BitVec 32) (_ BitVec 64))) (size!43544 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89040)

(declare-fun array_inv!32457 (array!89040) Bool)

(assert (=> start!111580 (array_inv!32457 _keys!1609)))

(assert (=> start!111580 true))

(assert (=> start!111580 tp_is_empty!36057))

(declare-datatypes ((V!53179 0))(
  ( (V!53180 (val!18103 Int)) )
))
(declare-datatypes ((ValueCell!17130 0))(
  ( (ValueCellFull!17130 (v!20733 V!53179)) (EmptyCell!17130) )
))
(declare-datatypes ((array!89042 0))(
  ( (array!89043 (arr!42995 (Array (_ BitVec 32) ValueCell!17130)) (size!43545 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89042)

(declare-fun e!753619 () Bool)

(declare-fun array_inv!32458 (array!89042) Bool)

(assert (=> start!111580 (and (array_inv!32458 _values!1337) e!753619)))

(assert (=> start!111580 tp!106186))

(declare-fun mapIsEmpty!55733 () Bool)

(declare-fun mapRes!55733 () Bool)

(assert (=> mapIsEmpty!55733 mapRes!55733))

(declare-fun b!1321366 () Bool)

(declare-fun res!877025 () Bool)

(assert (=> b!1321366 (=> (not res!877025) (not e!753616))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1321366 (= res!877025 (not (= (select (arr!42994 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321367 () Bool)

(declare-fun res!877022 () Bool)

(assert (=> b!1321367 (=> (not res!877022) (not e!753616))))

(declare-datatypes ((List!30463 0))(
  ( (Nil!30460) (Cons!30459 (h!31668 (_ BitVec 64)) (t!44249 List!30463)) )
))
(declare-fun arrayNoDuplicates!0 (array!89040 (_ BitVec 32) List!30463) Bool)

(assert (=> b!1321367 (= res!877022 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30460))))

(declare-fun b!1321368 () Bool)

(declare-fun res!877026 () Bool)

(assert (=> b!1321368 (=> (not res!877026) (not e!753616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89040 (_ BitVec 32)) Bool)

(assert (=> b!1321368 (= res!877026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55733 () Bool)

(declare-fun tp!106187 () Bool)

(assert (=> mapNonEmpty!55733 (= mapRes!55733 (and tp!106187 e!753618))))

(declare-fun mapRest!55733 () (Array (_ BitVec 32) ValueCell!17130))

(declare-fun mapValue!55733 () ValueCell!17130)

(declare-fun mapKey!55733 () (_ BitVec 32))

(assert (=> mapNonEmpty!55733 (= (arr!42995 _values!1337) (store mapRest!55733 mapKey!55733 mapValue!55733))))

(declare-fun b!1321369 () Bool)

(declare-fun res!877027 () Bool)

(assert (=> b!1321369 (=> (not res!877027) (not e!753616))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53179)

(declare-fun minValue!1279 () V!53179)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23314 0))(
  ( (tuple2!23315 (_1!11668 (_ BitVec 64)) (_2!11668 V!53179)) )
))
(declare-datatypes ((List!30464 0))(
  ( (Nil!30461) (Cons!30460 (h!31669 tuple2!23314) (t!44250 List!30464)) )
))
(declare-datatypes ((ListLongMap!20971 0))(
  ( (ListLongMap!20972 (toList!10501 List!30464)) )
))
(declare-fun contains!8656 (ListLongMap!20971 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5503 (array!89040 array!89042 (_ BitVec 32) (_ BitVec 32) V!53179 V!53179 (_ BitVec 32) Int) ListLongMap!20971)

(assert (=> b!1321369 (= res!877027 (contains!8656 (getCurrentListMap!5503 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321370 () Bool)

(declare-fun e!753617 () Bool)

(assert (=> b!1321370 (= e!753617 tp_is_empty!36057)))

(declare-fun b!1321371 () Bool)

(declare-fun res!877028 () Bool)

(assert (=> b!1321371 (=> (not res!877028) (not e!753616))))

(assert (=> b!1321371 (= res!877028 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43544 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321372 () Bool)

(declare-fun res!877023 () Bool)

(assert (=> b!1321372 (=> (not res!877023) (not e!753616))))

(assert (=> b!1321372 (= res!877023 (and (= (size!43545 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43544 _keys!1609) (size!43545 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321373 () Bool)

(declare-fun res!877021 () Bool)

(assert (=> b!1321373 (=> (not res!877021) (not e!753616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321373 (= res!877021 (validKeyInArray!0 (select (arr!42994 _keys!1609) from!2000)))))

(declare-fun b!1321374 () Bool)

(assert (=> b!1321374 (= e!753616 (not true))))

(declare-fun lt!587422 () ListLongMap!20971)

(assert (=> b!1321374 (contains!8656 lt!587422 k0!1164)))

(declare-fun lt!587419 () V!53179)

(declare-datatypes ((Unit!43536 0))(
  ( (Unit!43537) )
))
(declare-fun lt!587421 () Unit!43536)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!154 ((_ BitVec 64) (_ BitVec 64) V!53179 ListLongMap!20971) Unit!43536)

(assert (=> b!1321374 (= lt!587421 (lemmaInListMapAfterAddingDiffThenInBefore!154 k0!1164 (select (arr!42994 _keys!1609) from!2000) lt!587419 lt!587422))))

(declare-fun lt!587420 () ListLongMap!20971)

(assert (=> b!1321374 (contains!8656 lt!587420 k0!1164)))

(declare-fun lt!587424 () Unit!43536)

(assert (=> b!1321374 (= lt!587424 (lemmaInListMapAfterAddingDiffThenInBefore!154 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587420))))

(declare-fun lt!587423 () ListLongMap!20971)

(assert (=> b!1321374 (contains!8656 lt!587423 k0!1164)))

(declare-fun lt!587418 () Unit!43536)

(assert (=> b!1321374 (= lt!587418 (lemmaInListMapAfterAddingDiffThenInBefore!154 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587423))))

(declare-fun +!4558 (ListLongMap!20971 tuple2!23314) ListLongMap!20971)

(assert (=> b!1321374 (= lt!587423 (+!4558 lt!587420 (tuple2!23315 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321374 (= lt!587420 (+!4558 lt!587422 (tuple2!23315 (select (arr!42994 _keys!1609) from!2000) lt!587419)))))

(declare-fun get!21628 (ValueCell!17130 V!53179) V!53179)

(declare-fun dynLambda!3497 (Int (_ BitVec 64)) V!53179)

(assert (=> b!1321374 (= lt!587419 (get!21628 (select (arr!42995 _values!1337) from!2000) (dynLambda!3497 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6193 (array!89040 array!89042 (_ BitVec 32) (_ BitVec 32) V!53179 V!53179 (_ BitVec 32) Int) ListLongMap!20971)

(assert (=> b!1321374 (= lt!587422 (getCurrentListMapNoExtraKeys!6193 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321375 () Bool)

(assert (=> b!1321375 (= e!753619 (and e!753617 mapRes!55733))))

(declare-fun condMapEmpty!55733 () Bool)

(declare-fun mapDefault!55733 () ValueCell!17130)

(assert (=> b!1321375 (= condMapEmpty!55733 (= (arr!42995 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17130)) mapDefault!55733)))))

(assert (= (and start!111580 res!877024) b!1321372))

(assert (= (and b!1321372 res!877023) b!1321368))

(assert (= (and b!1321368 res!877026) b!1321367))

(assert (= (and b!1321367 res!877022) b!1321371))

(assert (= (and b!1321371 res!877028) b!1321369))

(assert (= (and b!1321369 res!877027) b!1321366))

(assert (= (and b!1321366 res!877025) b!1321373))

(assert (= (and b!1321373 res!877021) b!1321374))

(assert (= (and b!1321375 condMapEmpty!55733) mapIsEmpty!55733))

(assert (= (and b!1321375 (not condMapEmpty!55733)) mapNonEmpty!55733))

(get-info :version)

(assert (= (and mapNonEmpty!55733 ((_ is ValueCellFull!17130) mapValue!55733)) b!1321365))

(assert (= (and b!1321375 ((_ is ValueCellFull!17130) mapDefault!55733)) b!1321370))

(assert (= start!111580 b!1321375))

(declare-fun b_lambda!23563 () Bool)

(assert (=> (not b_lambda!23563) (not b!1321374)))

(declare-fun t!44248 () Bool)

(declare-fun tb!11589 () Bool)

(assert (=> (and start!111580 (= defaultEntry!1340 defaultEntry!1340) t!44248) tb!11589))

(declare-fun result!24233 () Bool)

(assert (=> tb!11589 (= result!24233 tp_is_empty!36057)))

(assert (=> b!1321374 t!44248))

(declare-fun b_and!48635 () Bool)

(assert (= b_and!48633 (and (=> t!44248 result!24233) b_and!48635)))

(declare-fun m!1209275 () Bool)

(assert (=> b!1321374 m!1209275))

(declare-fun m!1209277 () Bool)

(assert (=> b!1321374 m!1209277))

(declare-fun m!1209279 () Bool)

(assert (=> b!1321374 m!1209279))

(declare-fun m!1209281 () Bool)

(assert (=> b!1321374 m!1209281))

(declare-fun m!1209283 () Bool)

(assert (=> b!1321374 m!1209283))

(declare-fun m!1209285 () Bool)

(assert (=> b!1321374 m!1209285))

(assert (=> b!1321374 m!1209283))

(assert (=> b!1321374 m!1209281))

(declare-fun m!1209287 () Bool)

(assert (=> b!1321374 m!1209287))

(declare-fun m!1209289 () Bool)

(assert (=> b!1321374 m!1209289))

(declare-fun m!1209291 () Bool)

(assert (=> b!1321374 m!1209291))

(declare-fun m!1209293 () Bool)

(assert (=> b!1321374 m!1209293))

(declare-fun m!1209295 () Bool)

(assert (=> b!1321374 m!1209295))

(assert (=> b!1321374 m!1209289))

(declare-fun m!1209297 () Bool)

(assert (=> b!1321374 m!1209297))

(declare-fun m!1209299 () Bool)

(assert (=> b!1321374 m!1209299))

(assert (=> b!1321366 m!1209289))

(declare-fun m!1209301 () Bool)

(assert (=> b!1321369 m!1209301))

(assert (=> b!1321369 m!1209301))

(declare-fun m!1209303 () Bool)

(assert (=> b!1321369 m!1209303))

(declare-fun m!1209305 () Bool)

(assert (=> start!111580 m!1209305))

(declare-fun m!1209307 () Bool)

(assert (=> start!111580 m!1209307))

(declare-fun m!1209309 () Bool)

(assert (=> start!111580 m!1209309))

(declare-fun m!1209311 () Bool)

(assert (=> b!1321367 m!1209311))

(assert (=> b!1321373 m!1209289))

(assert (=> b!1321373 m!1209289))

(declare-fun m!1209313 () Bool)

(assert (=> b!1321373 m!1209313))

(declare-fun m!1209315 () Bool)

(assert (=> b!1321368 m!1209315))

(declare-fun m!1209317 () Bool)

(assert (=> mapNonEmpty!55733 m!1209317))

(check-sat (not b!1321373) (not mapNonEmpty!55733) b_and!48635 (not b_lambda!23563) (not b_next!30237) (not start!111580) (not b!1321367) (not b!1321374) (not b!1321369) tp_is_empty!36057 (not b!1321368))
(check-sat b_and!48635 (not b_next!30237))
