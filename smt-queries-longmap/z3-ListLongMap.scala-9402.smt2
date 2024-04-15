; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111906 () Bool)

(assert start!111906)

(declare-fun b_free!30505 () Bool)

(declare-fun b_next!30505 () Bool)

(assert (=> start!111906 (= b_free!30505 (not b_next!30505))))

(declare-fun tp!106996 () Bool)

(declare-fun b_and!49087 () Bool)

(assert (=> start!111906 (= tp!106996 b_and!49087)))

(declare-fun b!1326048 () Bool)

(declare-fun e!755853 () Bool)

(assert (=> b!1326048 (= e!755853 (not true))))

(declare-datatypes ((V!53537 0))(
  ( (V!53538 (val!18237 Int)) )
))
(declare-datatypes ((tuple2!23588 0))(
  ( (tuple2!23589 (_1!11805 (_ BitVec 64)) (_2!11805 V!53537)) )
))
(declare-datatypes ((List!30714 0))(
  ( (Nil!30711) (Cons!30710 (h!31919 tuple2!23588) (t!44682 List!30714)) )
))
(declare-datatypes ((ListLongMap!21245 0))(
  ( (ListLongMap!21246 (toList!10638 List!30714)) )
))
(declare-fun lt!589753 () ListLongMap!21245)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8722 (ListLongMap!21245 (_ BitVec 64)) Bool)

(assert (=> b!1326048 (contains!8722 lt!589753 k0!1164)))

(declare-fun zeroValue!1279 () V!53537)

(declare-datatypes ((Unit!43483 0))(
  ( (Unit!43484) )
))
(declare-fun lt!589752 () Unit!43483)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!207 ((_ BitVec 64) (_ BitVec 64) V!53537 ListLongMap!21245) Unit!43483)

(assert (=> b!1326048 (= lt!589752 (lemmaInListMapAfterAddingDiffThenInBefore!207 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589753))))

(declare-fun lt!589755 () ListLongMap!21245)

(assert (=> b!1326048 (contains!8722 lt!589755 k0!1164)))

(declare-fun minValue!1279 () V!53537)

(declare-fun lt!589754 () Unit!43483)

(assert (=> b!1326048 (= lt!589754 (lemmaInListMapAfterAddingDiffThenInBefore!207 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589755))))

(declare-fun +!4645 (ListLongMap!21245 tuple2!23588) ListLongMap!21245)

(assert (=> b!1326048 (= lt!589755 (+!4645 lt!589753 (tuple2!23589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((array!89489 0))(
  ( (array!89490 (arr!43218 (Array (_ BitVec 32) (_ BitVec 64))) (size!43770 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89489)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17264 0))(
  ( (ValueCellFull!17264 (v!20869 V!53537)) (EmptyCell!17264) )
))
(declare-datatypes ((array!89491 0))(
  ( (array!89492 (arr!43219 (Array (_ BitVec 32) ValueCell!17264)) (size!43771 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89491)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6283 (array!89489 array!89491 (_ BitVec 32) (_ BitVec 32) V!53537 V!53537 (_ BitVec 32) Int) ListLongMap!21245)

(declare-fun get!21775 (ValueCell!17264 V!53537) V!53537)

(declare-fun dynLambda!3575 (Int (_ BitVec 64)) V!53537)

(assert (=> b!1326048 (= lt!589753 (+!4645 (getCurrentListMapNoExtraKeys!6283 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23589 (select (arr!43218 _keys!1609) from!2000) (get!21775 (select (arr!43219 _values!1337) from!2000) (dynLambda!3575 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326049 () Bool)

(declare-fun res!880108 () Bool)

(assert (=> b!1326049 (=> (not res!880108) (not e!755853))))

(declare-datatypes ((List!30715 0))(
  ( (Nil!30712) (Cons!30711 (h!31920 (_ BitVec 64)) (t!44683 List!30715)) )
))
(declare-fun arrayNoDuplicates!0 (array!89489 (_ BitVec 32) List!30715) Bool)

(assert (=> b!1326049 (= res!880108 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30712))))

(declare-fun b!1326050 () Bool)

(declare-fun res!880113 () Bool)

(assert (=> b!1326050 (=> (not res!880113) (not e!755853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89489 (_ BitVec 32)) Bool)

(assert (=> b!1326050 (= res!880113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!880112 () Bool)

(assert (=> start!111906 (=> (not res!880112) (not e!755853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111906 (= res!880112 (validMask!0 mask!2019))))

(assert (=> start!111906 e!755853))

(declare-fun array_inv!32801 (array!89489) Bool)

(assert (=> start!111906 (array_inv!32801 _keys!1609)))

(assert (=> start!111906 true))

(declare-fun tp_is_empty!36325 () Bool)

(assert (=> start!111906 tp_is_empty!36325))

(declare-fun e!755851 () Bool)

(declare-fun array_inv!32802 (array!89491) Bool)

(assert (=> start!111906 (and (array_inv!32802 _values!1337) e!755851)))

(assert (=> start!111906 tp!106996))

(declare-fun b!1326051 () Bool)

(declare-fun res!880109 () Bool)

(assert (=> b!1326051 (=> (not res!880109) (not e!755853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326051 (= res!880109 (validKeyInArray!0 (select (arr!43218 _keys!1609) from!2000)))))

(declare-fun b!1326052 () Bool)

(declare-fun e!755854 () Bool)

(assert (=> b!1326052 (= e!755854 tp_is_empty!36325)))

(declare-fun mapIsEmpty!56139 () Bool)

(declare-fun mapRes!56139 () Bool)

(assert (=> mapIsEmpty!56139 mapRes!56139))

(declare-fun b!1326053 () Bool)

(declare-fun res!880115 () Bool)

(assert (=> b!1326053 (=> (not res!880115) (not e!755853))))

(declare-fun getCurrentListMap!5512 (array!89489 array!89491 (_ BitVec 32) (_ BitVec 32) V!53537 V!53537 (_ BitVec 32) Int) ListLongMap!21245)

(assert (=> b!1326053 (= res!880115 (contains!8722 (getCurrentListMap!5512 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326054 () Bool)

(declare-fun e!755852 () Bool)

(assert (=> b!1326054 (= e!755852 tp_is_empty!36325)))

(declare-fun b!1326055 () Bool)

(declare-fun res!880110 () Bool)

(assert (=> b!1326055 (=> (not res!880110) (not e!755853))))

(assert (=> b!1326055 (= res!880110 (not (= (select (arr!43218 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326056 () Bool)

(assert (=> b!1326056 (= e!755851 (and e!755854 mapRes!56139))))

(declare-fun condMapEmpty!56139 () Bool)

(declare-fun mapDefault!56139 () ValueCell!17264)

(assert (=> b!1326056 (= condMapEmpty!56139 (= (arr!43219 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17264)) mapDefault!56139)))))

(declare-fun b!1326057 () Bool)

(declare-fun res!880114 () Bool)

(assert (=> b!1326057 (=> (not res!880114) (not e!755853))))

(assert (=> b!1326057 (= res!880114 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43770 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326058 () Bool)

(declare-fun res!880111 () Bool)

(assert (=> b!1326058 (=> (not res!880111) (not e!755853))))

(assert (=> b!1326058 (= res!880111 (and (= (size!43771 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43770 _keys!1609) (size!43771 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56139 () Bool)

(declare-fun tp!106995 () Bool)

(assert (=> mapNonEmpty!56139 (= mapRes!56139 (and tp!106995 e!755852))))

(declare-fun mapRest!56139 () (Array (_ BitVec 32) ValueCell!17264))

(declare-fun mapKey!56139 () (_ BitVec 32))

(declare-fun mapValue!56139 () ValueCell!17264)

(assert (=> mapNonEmpty!56139 (= (arr!43219 _values!1337) (store mapRest!56139 mapKey!56139 mapValue!56139))))

(assert (= (and start!111906 res!880112) b!1326058))

(assert (= (and b!1326058 res!880111) b!1326050))

(assert (= (and b!1326050 res!880113) b!1326049))

(assert (= (and b!1326049 res!880108) b!1326057))

(assert (= (and b!1326057 res!880114) b!1326053))

(assert (= (and b!1326053 res!880115) b!1326055))

(assert (= (and b!1326055 res!880110) b!1326051))

(assert (= (and b!1326051 res!880109) b!1326048))

(assert (= (and b!1326056 condMapEmpty!56139) mapIsEmpty!56139))

(assert (= (and b!1326056 (not condMapEmpty!56139)) mapNonEmpty!56139))

(get-info :version)

(assert (= (and mapNonEmpty!56139 ((_ is ValueCellFull!17264) mapValue!56139)) b!1326054))

(assert (= (and b!1326056 ((_ is ValueCellFull!17264) mapDefault!56139)) b!1326052))

(assert (= start!111906 b!1326056))

(declare-fun b_lambda!23773 () Bool)

(assert (=> (not b_lambda!23773) (not b!1326048)))

(declare-fun t!44681 () Bool)

(declare-fun tb!11771 () Bool)

(assert (=> (and start!111906 (= defaultEntry!1340 defaultEntry!1340) t!44681) tb!11771))

(declare-fun result!24607 () Bool)

(assert (=> tb!11771 (= result!24607 tp_is_empty!36325)))

(assert (=> b!1326048 t!44681))

(declare-fun b_and!49089 () Bool)

(assert (= b_and!49087 (and (=> t!44681 result!24607) b_and!49089)))

(declare-fun m!1214533 () Bool)

(assert (=> b!1326048 m!1214533))

(declare-fun m!1214535 () Bool)

(assert (=> b!1326048 m!1214535))

(declare-fun m!1214537 () Bool)

(assert (=> b!1326048 m!1214537))

(declare-fun m!1214539 () Bool)

(assert (=> b!1326048 m!1214539))

(declare-fun m!1214541 () Bool)

(assert (=> b!1326048 m!1214541))

(declare-fun m!1214543 () Bool)

(assert (=> b!1326048 m!1214543))

(declare-fun m!1214545 () Bool)

(assert (=> b!1326048 m!1214545))

(assert (=> b!1326048 m!1214533))

(declare-fun m!1214547 () Bool)

(assert (=> b!1326048 m!1214547))

(declare-fun m!1214549 () Bool)

(assert (=> b!1326048 m!1214549))

(assert (=> b!1326048 m!1214539))

(assert (=> b!1326048 m!1214535))

(declare-fun m!1214551 () Bool)

(assert (=> b!1326048 m!1214551))

(declare-fun m!1214553 () Bool)

(assert (=> b!1326048 m!1214553))

(assert (=> b!1326055 m!1214545))

(declare-fun m!1214555 () Bool)

(assert (=> b!1326049 m!1214555))

(declare-fun m!1214557 () Bool)

(assert (=> start!111906 m!1214557))

(declare-fun m!1214559 () Bool)

(assert (=> start!111906 m!1214559))

(declare-fun m!1214561 () Bool)

(assert (=> start!111906 m!1214561))

(declare-fun m!1214563 () Bool)

(assert (=> b!1326053 m!1214563))

(assert (=> b!1326053 m!1214563))

(declare-fun m!1214565 () Bool)

(assert (=> b!1326053 m!1214565))

(assert (=> b!1326051 m!1214545))

(assert (=> b!1326051 m!1214545))

(declare-fun m!1214567 () Bool)

(assert (=> b!1326051 m!1214567))

(declare-fun m!1214569 () Bool)

(assert (=> b!1326050 m!1214569))

(declare-fun m!1214571 () Bool)

(assert (=> mapNonEmpty!56139 m!1214571))

(check-sat (not b_lambda!23773) (not b!1326049) (not start!111906) b_and!49089 (not b!1326048) (not b_next!30505) (not mapNonEmpty!56139) (not b!1326050) (not b!1326053) tp_is_empty!36325 (not b!1326051))
(check-sat b_and!49089 (not b_next!30505))
