; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111416 () Bool)

(assert start!111416)

(declare-fun b_free!30073 () Bool)

(declare-fun b_next!30073 () Bool)

(assert (=> start!111416 (= b_free!30073 (not b_next!30073))))

(declare-fun tp!105696 () Bool)

(declare-fun b_and!48287 () Bool)

(assert (=> start!111416 (= tp!105696 b_and!48287)))

(declare-fun b!1318425 () Bool)

(declare-fun e!752352 () Bool)

(declare-fun tp_is_empty!35893 () Bool)

(assert (=> b!1318425 (= e!752352 tp_is_empty!35893)))

(declare-fun b!1318426 () Bool)

(declare-fun res!875030 () Bool)

(declare-fun e!752355 () Bool)

(assert (=> b!1318426 (=> (not res!875030) (not e!752355))))

(declare-datatypes ((array!88653 0))(
  ( (array!88654 (arr!42801 (Array (_ BitVec 32) (_ BitVec 64))) (size!43353 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88653)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318426 (= res!875030 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43353 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!875026 () Bool)

(assert (=> start!111416 (=> (not res!875026) (not e!752355))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111416 (= res!875026 (validMask!0 mask!2019))))

(assert (=> start!111416 e!752355))

(declare-fun array_inv!32503 (array!88653) Bool)

(assert (=> start!111416 (array_inv!32503 _keys!1609)))

(assert (=> start!111416 true))

(assert (=> start!111416 tp_is_empty!35893))

(declare-datatypes ((V!52961 0))(
  ( (V!52962 (val!18021 Int)) )
))
(declare-datatypes ((ValueCell!17048 0))(
  ( (ValueCellFull!17048 (v!20650 V!52961)) (EmptyCell!17048) )
))
(declare-datatypes ((array!88655 0))(
  ( (array!88656 (arr!42802 (Array (_ BitVec 32) ValueCell!17048)) (size!43354 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88655)

(declare-fun e!752353 () Bool)

(declare-fun array_inv!32504 (array!88655) Bool)

(assert (=> start!111416 (and (array_inv!32504 _values!1337) e!752353)))

(assert (=> start!111416 tp!105696))

(declare-fun b!1318427 () Bool)

(declare-fun res!875025 () Bool)

(assert (=> b!1318427 (=> (not res!875025) (not e!752355))))

(declare-fun zeroValue!1279 () V!52961)

(declare-fun minValue!1279 () V!52961)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23276 0))(
  ( (tuple2!23277 (_1!11649 (_ BitVec 64)) (_2!11649 V!52961)) )
))
(declare-datatypes ((List!30414 0))(
  ( (Nil!30411) (Cons!30410 (h!31619 tuple2!23276) (t!44028 List!30414)) )
))
(declare-datatypes ((ListLongMap!20933 0))(
  ( (ListLongMap!20934 (toList!10482 List!30414)) )
))
(declare-fun contains!8565 (ListLongMap!20933 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5375 (array!88653 array!88655 (_ BitVec 32) (_ BitVec 32) V!52961 V!52961 (_ BitVec 32) Int) ListLongMap!20933)

(assert (=> b!1318427 (= res!875025 (contains!8565 (getCurrentListMap!5375 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318428 () Bool)

(declare-fun res!875031 () Bool)

(assert (=> b!1318428 (=> (not res!875031) (not e!752355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88653 (_ BitVec 32)) Bool)

(assert (=> b!1318428 (= res!875031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318429 () Bool)

(assert (=> b!1318429 (= e!752355 (not true))))

(declare-fun lt!586292 () ListLongMap!20933)

(assert (=> b!1318429 (contains!8565 lt!586292 k0!1164)))

(declare-datatypes ((Unit!43251 0))(
  ( (Unit!43252) )
))
(declare-fun lt!586293 () Unit!43251)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!99 ((_ BitVec 64) (_ BitVec 64) V!52961 ListLongMap!20933) Unit!43251)

(assert (=> b!1318429 (= lt!586293 (lemmaInListMapAfterAddingDiffThenInBefore!99 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586292))))

(declare-fun +!4534 (ListLongMap!20933 tuple2!23276) ListLongMap!20933)

(declare-fun getCurrentListMapNoExtraKeys!6167 (array!88653 array!88655 (_ BitVec 32) (_ BitVec 32) V!52961 V!52961 (_ BitVec 32) Int) ListLongMap!20933)

(declare-fun get!21517 (ValueCell!17048 V!52961) V!52961)

(declare-fun dynLambda!3464 (Int (_ BitVec 64)) V!52961)

(assert (=> b!1318429 (= lt!586292 (+!4534 (+!4534 (getCurrentListMapNoExtraKeys!6167 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23277 (select (arr!42801 _keys!1609) from!2000) (get!21517 (select (arr!42802 _values!1337) from!2000) (dynLambda!3464 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1318430 () Bool)

(declare-fun res!875029 () Bool)

(assert (=> b!1318430 (=> (not res!875029) (not e!752355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318430 (= res!875029 (validKeyInArray!0 (select (arr!42801 _keys!1609) from!2000)))))

(declare-fun b!1318431 () Bool)

(declare-fun e!752356 () Bool)

(declare-fun mapRes!55487 () Bool)

(assert (=> b!1318431 (= e!752353 (and e!752356 mapRes!55487))))

(declare-fun condMapEmpty!55487 () Bool)

(declare-fun mapDefault!55487 () ValueCell!17048)

(assert (=> b!1318431 (= condMapEmpty!55487 (= (arr!42802 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17048)) mapDefault!55487)))))

(declare-fun b!1318432 () Bool)

(assert (=> b!1318432 (= e!752356 tp_is_empty!35893)))

(declare-fun mapNonEmpty!55487 () Bool)

(declare-fun tp!105695 () Bool)

(assert (=> mapNonEmpty!55487 (= mapRes!55487 (and tp!105695 e!752352))))

(declare-fun mapValue!55487 () ValueCell!17048)

(declare-fun mapKey!55487 () (_ BitVec 32))

(declare-fun mapRest!55487 () (Array (_ BitVec 32) ValueCell!17048))

(assert (=> mapNonEmpty!55487 (= (arr!42802 _values!1337) (store mapRest!55487 mapKey!55487 mapValue!55487))))

(declare-fun b!1318433 () Bool)

(declare-fun res!875027 () Bool)

(assert (=> b!1318433 (=> (not res!875027) (not e!752355))))

(assert (=> b!1318433 (= res!875027 (not (= (select (arr!42801 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318434 () Bool)

(declare-fun res!875028 () Bool)

(assert (=> b!1318434 (=> (not res!875028) (not e!752355))))

(assert (=> b!1318434 (= res!875028 (and (= (size!43354 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43353 _keys!1609) (size!43354 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55487 () Bool)

(assert (=> mapIsEmpty!55487 mapRes!55487))

(declare-fun b!1318435 () Bool)

(declare-fun res!875024 () Bool)

(assert (=> b!1318435 (=> (not res!875024) (not e!752355))))

(declare-datatypes ((List!30415 0))(
  ( (Nil!30412) (Cons!30411 (h!31620 (_ BitVec 64)) (t!44029 List!30415)) )
))
(declare-fun arrayNoDuplicates!0 (array!88653 (_ BitVec 32) List!30415) Bool)

(assert (=> b!1318435 (= res!875024 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30412))))

(assert (= (and start!111416 res!875026) b!1318434))

(assert (= (and b!1318434 res!875028) b!1318428))

(assert (= (and b!1318428 res!875031) b!1318435))

(assert (= (and b!1318435 res!875024) b!1318426))

(assert (= (and b!1318426 res!875030) b!1318427))

(assert (= (and b!1318427 res!875025) b!1318433))

(assert (= (and b!1318433 res!875027) b!1318430))

(assert (= (and b!1318430 res!875029) b!1318429))

(assert (= (and b!1318431 condMapEmpty!55487) mapIsEmpty!55487))

(assert (= (and b!1318431 (not condMapEmpty!55487)) mapNonEmpty!55487))

(get-info :version)

(assert (= (and mapNonEmpty!55487 ((_ is ValueCellFull!17048) mapValue!55487)) b!1318425))

(assert (= (and b!1318431 ((_ is ValueCellFull!17048) mapDefault!55487)) b!1318432))

(assert (= start!111416 b!1318431))

(declare-fun b_lambda!23389 () Bool)

(assert (=> (not b_lambda!23389) (not b!1318429)))

(declare-fun t!44027 () Bool)

(declare-fun tb!11417 () Bool)

(assert (=> (and start!111416 (= defaultEntry!1340 defaultEntry!1340) t!44027) tb!11417))

(declare-fun result!23897 () Bool)

(assert (=> tb!11417 (= result!23897 tp_is_empty!35893)))

(assert (=> b!1318429 t!44027))

(declare-fun b_and!48289 () Bool)

(assert (= b_and!48287 (and (=> t!44027 result!23897) b_and!48289)))

(declare-fun m!1205547 () Bool)

(assert (=> mapNonEmpty!55487 m!1205547))

(declare-fun m!1205549 () Bool)

(assert (=> b!1318435 m!1205549))

(declare-fun m!1205551 () Bool)

(assert (=> b!1318429 m!1205551))

(declare-fun m!1205553 () Bool)

(assert (=> b!1318429 m!1205553))

(declare-fun m!1205555 () Bool)

(assert (=> b!1318429 m!1205555))

(declare-fun m!1205557 () Bool)

(assert (=> b!1318429 m!1205557))

(assert (=> b!1318429 m!1205555))

(declare-fun m!1205559 () Bool)

(assert (=> b!1318429 m!1205559))

(declare-fun m!1205561 () Bool)

(assert (=> b!1318429 m!1205561))

(assert (=> b!1318429 m!1205553))

(declare-fun m!1205563 () Bool)

(assert (=> b!1318429 m!1205563))

(assert (=> b!1318429 m!1205557))

(assert (=> b!1318429 m!1205551))

(declare-fun m!1205565 () Bool)

(assert (=> b!1318429 m!1205565))

(declare-fun m!1205567 () Bool)

(assert (=> b!1318429 m!1205567))

(declare-fun m!1205569 () Bool)

(assert (=> start!111416 m!1205569))

(declare-fun m!1205571 () Bool)

(assert (=> start!111416 m!1205571))

(declare-fun m!1205573 () Bool)

(assert (=> start!111416 m!1205573))

(declare-fun m!1205575 () Bool)

(assert (=> b!1318427 m!1205575))

(assert (=> b!1318427 m!1205575))

(declare-fun m!1205577 () Bool)

(assert (=> b!1318427 m!1205577))

(assert (=> b!1318433 m!1205561))

(assert (=> b!1318430 m!1205561))

(assert (=> b!1318430 m!1205561))

(declare-fun m!1205579 () Bool)

(assert (=> b!1318430 m!1205579))

(declare-fun m!1205581 () Bool)

(assert (=> b!1318428 m!1205581))

(check-sat b_and!48289 (not b_next!30073) (not b!1318429) (not b!1318428) (not b!1318435) (not b_lambda!23389) (not start!111416) (not b!1318427) (not b!1318430) (not mapNonEmpty!55487) tp_is_empty!35893)
(check-sat b_and!48289 (not b_next!30073))
