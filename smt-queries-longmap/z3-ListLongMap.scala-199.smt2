; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3828 () Bool)

(assert start!3828)

(declare-fun b_free!783 () Bool)

(declare-fun b_next!783 () Bool)

(assert (=> start!3828 (= b_free!783 (not b_next!783))))

(declare-fun tp!3760 () Bool)

(declare-fun b_and!1587 () Bool)

(assert (=> start!3828 (= tp!3760 b_and!1587)))

(declare-fun b!26824 () Bool)

(declare-fun e!17500 () Bool)

(declare-fun e!17498 () Bool)

(declare-fun mapRes!1225 () Bool)

(assert (=> b!26824 (= e!17500 (and e!17498 mapRes!1225))))

(declare-fun condMapEmpty!1225 () Bool)

(declare-datatypes ((V!1341 0))(
  ( (V!1342 (val!595 Int)) )
))
(declare-datatypes ((ValueCell!369 0))(
  ( (ValueCellFull!369 (v!1681 V!1341)) (EmptyCell!369) )
))
(declare-datatypes ((array!1515 0))(
  ( (array!1516 (arr!714 (Array (_ BitVec 32) ValueCell!369)) (size!815 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1515)

(declare-fun mapDefault!1225 () ValueCell!369)

(assert (=> b!26824 (= condMapEmpty!1225 (= (arr!714 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!369)) mapDefault!1225)))))

(declare-fun res!15910 () Bool)

(declare-fun e!17499 () Bool)

(assert (=> start!3828 (=> (not res!15910) (not e!17499))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3828 (= res!15910 (validMask!0 mask!2294))))

(assert (=> start!3828 e!17499))

(assert (=> start!3828 true))

(assert (=> start!3828 tp!3760))

(declare-fun array_inv!491 (array!1515) Bool)

(assert (=> start!3828 (and (array_inv!491 _values!1501) e!17500)))

(declare-datatypes ((array!1517 0))(
  ( (array!1518 (arr!715 (Array (_ BitVec 32) (_ BitVec 64))) (size!816 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1517)

(declare-fun array_inv!492 (array!1517) Bool)

(assert (=> start!3828 (array_inv!492 _keys!1833)))

(declare-fun tp_is_empty!1137 () Bool)

(assert (=> start!3828 tp_is_empty!1137))

(declare-fun b!26825 () Bool)

(declare-fun res!15912 () Bool)

(assert (=> b!26825 (=> (not res!15912) (not e!17499))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26825 (= res!15912 (and (= (size!815 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!816 _keys!1833) (size!815 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26826 () Bool)

(declare-fun res!15911 () Bool)

(assert (=> b!26826 (=> (not res!15911) (not e!17499))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1341)

(declare-fun minValue!1443 () V!1341)

(declare-datatypes ((tuple2!1004 0))(
  ( (tuple2!1005 (_1!513 (_ BitVec 64)) (_2!513 V!1341)) )
))
(declare-datatypes ((List!604 0))(
  ( (Nil!601) (Cons!600 (h!1167 tuple2!1004) (t!3291 List!604)) )
))
(declare-datatypes ((ListLongMap!581 0))(
  ( (ListLongMap!582 (toList!306 List!604)) )
))
(declare-fun contains!243 (ListLongMap!581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!136 (array!1517 array!1515 (_ BitVec 32) (_ BitVec 32) V!1341 V!1341 (_ BitVec 32) Int) ListLongMap!581)

(assert (=> b!26826 (= res!15911 (not (contains!243 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapNonEmpty!1225 () Bool)

(declare-fun tp!3759 () Bool)

(declare-fun e!17497 () Bool)

(assert (=> mapNonEmpty!1225 (= mapRes!1225 (and tp!3759 e!17497))))

(declare-fun mapKey!1225 () (_ BitVec 32))

(declare-fun mapValue!1225 () ValueCell!369)

(declare-fun mapRest!1225 () (Array (_ BitVec 32) ValueCell!369))

(assert (=> mapNonEmpty!1225 (= (arr!714 _values!1501) (store mapRest!1225 mapKey!1225 mapValue!1225))))

(declare-fun b!26827 () Bool)

(declare-fun res!15914 () Bool)

(assert (=> b!26827 (=> (not res!15914) (not e!17499))))

(declare-datatypes ((List!605 0))(
  ( (Nil!602) (Cons!601 (h!1168 (_ BitVec 64)) (t!3292 List!605)) )
))
(declare-fun arrayNoDuplicates!0 (array!1517 (_ BitVec 32) List!605) Bool)

(assert (=> b!26827 (= res!15914 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!602))))

(declare-fun b!26828 () Bool)

(assert (=> b!26828 (= e!17497 tp_is_empty!1137)))

(declare-fun b!26829 () Bool)

(assert (=> b!26829 (= e!17499 (bvsge #b00000000000000000000000000000000 (size!816 _keys!1833)))))

(declare-fun b!26830 () Bool)

(declare-fun res!15913 () Bool)

(assert (=> b!26830 (=> (not res!15913) (not e!17499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1517 (_ BitVec 32)) Bool)

(assert (=> b!26830 (= res!15913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26831 () Bool)

(declare-fun res!15915 () Bool)

(assert (=> b!26831 (=> (not res!15915) (not e!17499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26831 (= res!15915 (validKeyInArray!0 k0!1304))))

(declare-fun b!26832 () Bool)

(assert (=> b!26832 (= e!17498 tp_is_empty!1137)))

(declare-fun mapIsEmpty!1225 () Bool)

(assert (=> mapIsEmpty!1225 mapRes!1225))

(assert (= (and start!3828 res!15910) b!26825))

(assert (= (and b!26825 res!15912) b!26830))

(assert (= (and b!26830 res!15913) b!26827))

(assert (= (and b!26827 res!15914) b!26831))

(assert (= (and b!26831 res!15915) b!26826))

(assert (= (and b!26826 res!15911) b!26829))

(assert (= (and b!26824 condMapEmpty!1225) mapIsEmpty!1225))

(assert (= (and b!26824 (not condMapEmpty!1225)) mapNonEmpty!1225))

(get-info :version)

(assert (= (and mapNonEmpty!1225 ((_ is ValueCellFull!369) mapValue!1225)) b!26828))

(assert (= (and b!26824 ((_ is ValueCellFull!369) mapDefault!1225)) b!26832))

(assert (= start!3828 b!26824))

(declare-fun m!21461 () Bool)

(assert (=> b!26827 m!21461))

(declare-fun m!21463 () Bool)

(assert (=> b!26826 m!21463))

(assert (=> b!26826 m!21463))

(declare-fun m!21465 () Bool)

(assert (=> b!26826 m!21465))

(declare-fun m!21467 () Bool)

(assert (=> b!26830 m!21467))

(declare-fun m!21469 () Bool)

(assert (=> b!26831 m!21469))

(declare-fun m!21471 () Bool)

(assert (=> mapNonEmpty!1225 m!21471))

(declare-fun m!21473 () Bool)

(assert (=> start!3828 m!21473))

(declare-fun m!21475 () Bool)

(assert (=> start!3828 m!21475))

(declare-fun m!21477 () Bool)

(assert (=> start!3828 m!21477))

(check-sat (not b!26826) b_and!1587 (not b!26830) (not b!26831) (not mapNonEmpty!1225) (not start!3828) tp_is_empty!1137 (not b!26827) (not b_next!783))
(check-sat b_and!1587 (not b_next!783))
(get-model)

(declare-fun d!4911 () Bool)

(declare-fun e!17522 () Bool)

(assert (=> d!4911 e!17522))

(declare-fun res!15936 () Bool)

(assert (=> d!4911 (=> res!15936 e!17522)))

(declare-fun lt!10421 () Bool)

(assert (=> d!4911 (= res!15936 (not lt!10421))))

(declare-fun lt!10418 () Bool)

(assert (=> d!4911 (= lt!10421 lt!10418)))

(declare-datatypes ((Unit!627 0))(
  ( (Unit!628) )
))
(declare-fun lt!10419 () Unit!627)

(declare-fun e!17521 () Unit!627)

(assert (=> d!4911 (= lt!10419 e!17521)))

(declare-fun c!3659 () Bool)

(assert (=> d!4911 (= c!3659 lt!10418)))

(declare-fun containsKey!26 (List!604 (_ BitVec 64)) Bool)

(assert (=> d!4911 (= lt!10418 (containsKey!26 (toList!306 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!4911 (= (contains!243 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!10421)))

(declare-fun b!26866 () Bool)

(declare-fun lt!10420 () Unit!627)

(assert (=> b!26866 (= e!17521 lt!10420)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!23 (List!604 (_ BitVec 64)) Unit!627)

(assert (=> b!26866 (= lt!10420 (lemmaContainsKeyImpliesGetValueByKeyDefined!23 (toList!306 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!68 0))(
  ( (Some!67 (v!1683 V!1341)) (None!66) )
))
(declare-fun isDefined!24 (Option!68) Bool)

(declare-fun getValueByKey!62 (List!604 (_ BitVec 64)) Option!68)

(assert (=> b!26866 (isDefined!24 (getValueByKey!62 (toList!306 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!26867 () Bool)

(declare-fun Unit!629 () Unit!627)

(assert (=> b!26867 (= e!17521 Unit!629)))

(declare-fun b!26868 () Bool)

(assert (=> b!26868 (= e!17522 (isDefined!24 (getValueByKey!62 (toList!306 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!4911 c!3659) b!26866))

(assert (= (and d!4911 (not c!3659)) b!26867))

(assert (= (and d!4911 (not res!15936)) b!26868))

(declare-fun m!21497 () Bool)

(assert (=> d!4911 m!21497))

(declare-fun m!21499 () Bool)

(assert (=> b!26866 m!21499))

(declare-fun m!21501 () Bool)

(assert (=> b!26866 m!21501))

(assert (=> b!26866 m!21501))

(declare-fun m!21503 () Bool)

(assert (=> b!26866 m!21503))

(assert (=> b!26868 m!21501))

(assert (=> b!26868 m!21501))

(assert (=> b!26868 m!21503))

(assert (=> b!26826 d!4911))

(declare-fun b!26911 () Bool)

(declare-fun e!17559 () Unit!627)

(declare-fun lt!10472 () Unit!627)

(assert (=> b!26911 (= e!17559 lt!10472)))

(declare-fun lt!10468 () ListLongMap!581)

(declare-fun getCurrentListMapNoExtraKeys!17 (array!1517 array!1515 (_ BitVec 32) (_ BitVec 32) V!1341 V!1341 (_ BitVec 32) Int) ListLongMap!581)

(assert (=> b!26911 (= lt!10468 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10471 () (_ BitVec 64))

(assert (=> b!26911 (= lt!10471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10485 () (_ BitVec 64))

(assert (=> b!26911 (= lt!10485 (select (arr!715 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10470 () Unit!627)

(declare-fun addStillContains!15 (ListLongMap!581 (_ BitVec 64) V!1341 (_ BitVec 64)) Unit!627)

(assert (=> b!26911 (= lt!10470 (addStillContains!15 lt!10468 lt!10471 zeroValue!1443 lt!10485))))

(declare-fun +!48 (ListLongMap!581 tuple2!1004) ListLongMap!581)

(assert (=> b!26911 (contains!243 (+!48 lt!10468 (tuple2!1005 lt!10471 zeroValue!1443)) lt!10485)))

(declare-fun lt!10480 () Unit!627)

(assert (=> b!26911 (= lt!10480 lt!10470)))

(declare-fun lt!10473 () ListLongMap!581)

(assert (=> b!26911 (= lt!10473 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10487 () (_ BitVec 64))

(assert (=> b!26911 (= lt!10487 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10483 () (_ BitVec 64))

(assert (=> b!26911 (= lt!10483 (select (arr!715 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10466 () Unit!627)

(declare-fun addApplyDifferent!15 (ListLongMap!581 (_ BitVec 64) V!1341 (_ BitVec 64)) Unit!627)

(assert (=> b!26911 (= lt!10466 (addApplyDifferent!15 lt!10473 lt!10487 minValue!1443 lt!10483))))

(declare-fun apply!30 (ListLongMap!581 (_ BitVec 64)) V!1341)

(assert (=> b!26911 (= (apply!30 (+!48 lt!10473 (tuple2!1005 lt!10487 minValue!1443)) lt!10483) (apply!30 lt!10473 lt!10483))))

(declare-fun lt!10482 () Unit!627)

(assert (=> b!26911 (= lt!10482 lt!10466)))

(declare-fun lt!10477 () ListLongMap!581)

(assert (=> b!26911 (= lt!10477 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10476 () (_ BitVec 64))

(assert (=> b!26911 (= lt!10476 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10474 () (_ BitVec 64))

(assert (=> b!26911 (= lt!10474 (select (arr!715 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10467 () Unit!627)

(assert (=> b!26911 (= lt!10467 (addApplyDifferent!15 lt!10477 lt!10476 zeroValue!1443 lt!10474))))

(assert (=> b!26911 (= (apply!30 (+!48 lt!10477 (tuple2!1005 lt!10476 zeroValue!1443)) lt!10474) (apply!30 lt!10477 lt!10474))))

(declare-fun lt!10479 () Unit!627)

(assert (=> b!26911 (= lt!10479 lt!10467)))

(declare-fun lt!10475 () ListLongMap!581)

(assert (=> b!26911 (= lt!10475 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10469 () (_ BitVec 64))

(assert (=> b!26911 (= lt!10469 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10478 () (_ BitVec 64))

(assert (=> b!26911 (= lt!10478 (select (arr!715 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!26911 (= lt!10472 (addApplyDifferent!15 lt!10475 lt!10469 minValue!1443 lt!10478))))

(assert (=> b!26911 (= (apply!30 (+!48 lt!10475 (tuple2!1005 lt!10469 minValue!1443)) lt!10478) (apply!30 lt!10475 lt!10478))))

(declare-fun bm!2520 () Bool)

(declare-fun call!2527 () ListLongMap!581)

(declare-fun call!2525 () ListLongMap!581)

(assert (=> bm!2520 (= call!2527 call!2525)))

(declare-fun b!26912 () Bool)

(declare-fun e!17561 () Bool)

(declare-fun lt!10484 () ListLongMap!581)

(assert (=> b!26912 (= e!17561 (= (apply!30 lt!10484 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!26913 () Bool)

(declare-fun e!17556 () Bool)

(declare-fun e!17560 () Bool)

(assert (=> b!26913 (= e!17556 e!17560)))

(declare-fun res!15960 () Bool)

(declare-fun call!2522 () Bool)

(assert (=> b!26913 (= res!15960 call!2522)))

(assert (=> b!26913 (=> (not res!15960) (not e!17560))))

(declare-fun b!26914 () Bool)

(declare-fun e!17555 () ListLongMap!581)

(declare-fun e!17552 () ListLongMap!581)

(assert (=> b!26914 (= e!17555 e!17552)))

(declare-fun c!3675 () Bool)

(assert (=> b!26914 (= c!3675 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!2523 () ListLongMap!581)

(declare-fun call!2528 () ListLongMap!581)

(declare-fun bm!2521 () Bool)

(declare-fun c!3674 () Bool)

(assert (=> bm!2521 (= call!2523 (+!48 (ite c!3674 call!2528 (ite c!3675 call!2525 call!2527)) (ite (or c!3674 c!3675) (tuple2!1005 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1005 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!26915 () Bool)

(declare-fun e!17550 () ListLongMap!581)

(assert (=> b!26915 (= e!17550 call!2527)))

(declare-fun b!26916 () Bool)

(declare-fun e!17558 () Bool)

(assert (=> b!26916 (= e!17558 e!17561)))

(declare-fun res!15963 () Bool)

(declare-fun call!2524 () Bool)

(assert (=> b!26916 (= res!15963 call!2524)))

(assert (=> b!26916 (=> (not res!15963) (not e!17561))))

(declare-fun b!26917 () Bool)

(assert (=> b!26917 (= e!17558 (not call!2524))))

(declare-fun b!26918 () Bool)

(assert (=> b!26918 (= e!17560 (= (apply!30 lt!10484 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!26919 () Bool)

(declare-fun Unit!630 () Unit!627)

(assert (=> b!26919 (= e!17559 Unit!630)))

(declare-fun b!26920 () Bool)

(declare-fun e!17554 () Bool)

(declare-fun e!17551 () Bool)

(assert (=> b!26920 (= e!17554 e!17551)))

(declare-fun res!15958 () Bool)

(assert (=> b!26920 (=> (not res!15958) (not e!17551))))

(assert (=> b!26920 (= res!15958 (contains!243 lt!10484 (select (arr!715 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!26920 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!816 _keys!1833)))))

(declare-fun b!26921 () Bool)

(declare-fun e!17557 () Bool)

(assert (=> b!26921 (= e!17557 e!17558)))

(declare-fun c!3677 () Bool)

(assert (=> b!26921 (= c!3677 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2522 () Bool)

(declare-fun call!2526 () ListLongMap!581)

(assert (=> bm!2522 (= call!2526 call!2523)))

(declare-fun b!26922 () Bool)

(declare-fun e!17549 () Bool)

(assert (=> b!26922 (= e!17549 (validKeyInArray!0 (select (arr!715 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26923 () Bool)

(declare-fun get!433 (ValueCell!369 V!1341) V!1341)

(declare-fun dynLambda!147 (Int (_ BitVec 64)) V!1341)

(assert (=> b!26923 (= e!17551 (= (apply!30 lt!10484 (select (arr!715 _keys!1833) #b00000000000000000000000000000000)) (get!433 (select (arr!714 _values!1501) #b00000000000000000000000000000000) (dynLambda!147 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!26923 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!815 _values!1501)))))

(assert (=> b!26923 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!816 _keys!1833)))))

(declare-fun d!4913 () Bool)

(assert (=> d!4913 e!17557))

(declare-fun res!15955 () Bool)

(assert (=> d!4913 (=> (not res!15955) (not e!17557))))

(assert (=> d!4913 (= res!15955 (or (bvsge #b00000000000000000000000000000000 (size!816 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!816 _keys!1833)))))))

(declare-fun lt!10481 () ListLongMap!581)

(assert (=> d!4913 (= lt!10484 lt!10481)))

(declare-fun lt!10486 () Unit!627)

(assert (=> d!4913 (= lt!10486 e!17559)))

(declare-fun c!3672 () Bool)

(declare-fun e!17553 () Bool)

(assert (=> d!4913 (= c!3672 e!17553)))

(declare-fun res!15959 () Bool)

(assert (=> d!4913 (=> (not res!15959) (not e!17553))))

(assert (=> d!4913 (= res!15959 (bvslt #b00000000000000000000000000000000 (size!816 _keys!1833)))))

(assert (=> d!4913 (= lt!10481 e!17555)))

(assert (=> d!4913 (= c!3674 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!4913 (validMask!0 mask!2294)))

(assert (=> d!4913 (= (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!10484)))

(declare-fun bm!2519 () Bool)

(assert (=> bm!2519 (= call!2528 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!26924 () Bool)

(assert (=> b!26924 (= e!17553 (validKeyInArray!0 (select (arr!715 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26925 () Bool)

(assert (=> b!26925 (= e!17550 call!2526)))

(declare-fun bm!2523 () Bool)

(assert (=> bm!2523 (= call!2525 call!2528)))

(declare-fun b!26926 () Bool)

(assert (=> b!26926 (= e!17556 (not call!2522))))

(declare-fun b!26927 () Bool)

(assert (=> b!26927 (= e!17552 call!2526)))

(declare-fun bm!2524 () Bool)

(assert (=> bm!2524 (= call!2522 (contains!243 lt!10484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2525 () Bool)

(assert (=> bm!2525 (= call!2524 (contains!243 lt!10484 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26928 () Bool)

(declare-fun res!15962 () Bool)

(assert (=> b!26928 (=> (not res!15962) (not e!17557))))

(assert (=> b!26928 (= res!15962 e!17554)))

(declare-fun res!15957 () Bool)

(assert (=> b!26928 (=> res!15957 e!17554)))

(assert (=> b!26928 (= res!15957 (not e!17549))))

(declare-fun res!15956 () Bool)

(assert (=> b!26928 (=> (not res!15956) (not e!17549))))

(assert (=> b!26928 (= res!15956 (bvslt #b00000000000000000000000000000000 (size!816 _keys!1833)))))

(declare-fun b!26929 () Bool)

(assert (=> b!26929 (= e!17555 (+!48 call!2523 (tuple2!1005 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!26930 () Bool)

(declare-fun c!3676 () Bool)

(assert (=> b!26930 (= c!3676 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!26930 (= e!17552 e!17550)))

(declare-fun b!26931 () Bool)

(declare-fun res!15961 () Bool)

(assert (=> b!26931 (=> (not res!15961) (not e!17557))))

(assert (=> b!26931 (= res!15961 e!17556)))

(declare-fun c!3673 () Bool)

(assert (=> b!26931 (= c!3673 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!4913 c!3674) b!26929))

(assert (= (and d!4913 (not c!3674)) b!26914))

(assert (= (and b!26914 c!3675) b!26927))

(assert (= (and b!26914 (not c!3675)) b!26930))

(assert (= (and b!26930 c!3676) b!26925))

(assert (= (and b!26930 (not c!3676)) b!26915))

(assert (= (or b!26925 b!26915) bm!2520))

(assert (= (or b!26927 bm!2520) bm!2523))

(assert (= (or b!26927 b!26925) bm!2522))

(assert (= (or b!26929 bm!2523) bm!2519))

(assert (= (or b!26929 bm!2522) bm!2521))

(assert (= (and d!4913 res!15959) b!26924))

(assert (= (and d!4913 c!3672) b!26911))

(assert (= (and d!4913 (not c!3672)) b!26919))

(assert (= (and d!4913 res!15955) b!26928))

(assert (= (and b!26928 res!15956) b!26922))

(assert (= (and b!26928 (not res!15957)) b!26920))

(assert (= (and b!26920 res!15958) b!26923))

(assert (= (and b!26928 res!15962) b!26931))

(assert (= (and b!26931 c!3673) b!26913))

(assert (= (and b!26931 (not c!3673)) b!26926))

(assert (= (and b!26913 res!15960) b!26918))

(assert (= (or b!26913 b!26926) bm!2524))

(assert (= (and b!26931 res!15961) b!26921))

(assert (= (and b!26921 c!3677) b!26916))

(assert (= (and b!26921 (not c!3677)) b!26917))

(assert (= (and b!26916 res!15963) b!26912))

(assert (= (or b!26916 b!26917) bm!2525))

(declare-fun b_lambda!1683 () Bool)

(assert (=> (not b_lambda!1683) (not b!26923)))

(declare-fun t!3294 () Bool)

(declare-fun tb!675 () Bool)

(assert (=> (and start!3828 (= defaultEntry!1504 defaultEntry!1504) t!3294) tb!675))

(declare-fun result!1135 () Bool)

(assert (=> tb!675 (= result!1135 tp_is_empty!1137)))

(assert (=> b!26923 t!3294))

(declare-fun b_and!1591 () Bool)

(assert (= b_and!1587 (and (=> t!3294 result!1135) b_and!1591)))

(declare-fun m!21505 () Bool)

(assert (=> b!26912 m!21505))

(declare-fun m!21507 () Bool)

(assert (=> bm!2519 m!21507))

(declare-fun m!21509 () Bool)

(assert (=> b!26929 m!21509))

(assert (=> d!4913 m!21473))

(declare-fun m!21511 () Bool)

(assert (=> b!26911 m!21511))

(declare-fun m!21513 () Bool)

(assert (=> b!26911 m!21513))

(declare-fun m!21515 () Bool)

(assert (=> b!26911 m!21515))

(declare-fun m!21517 () Bool)

(assert (=> b!26911 m!21517))

(declare-fun m!21519 () Bool)

(assert (=> b!26911 m!21519))

(declare-fun m!21521 () Bool)

(assert (=> b!26911 m!21521))

(declare-fun m!21523 () Bool)

(assert (=> b!26911 m!21523))

(assert (=> b!26911 m!21515))

(declare-fun m!21525 () Bool)

(assert (=> b!26911 m!21525))

(declare-fun m!21527 () Bool)

(assert (=> b!26911 m!21527))

(assert (=> b!26911 m!21519))

(assert (=> b!26911 m!21513))

(declare-fun m!21529 () Bool)

(assert (=> b!26911 m!21529))

(declare-fun m!21531 () Bool)

(assert (=> b!26911 m!21531))

(declare-fun m!21533 () Bool)

(assert (=> b!26911 m!21533))

(assert (=> b!26911 m!21507))

(declare-fun m!21535 () Bool)

(assert (=> b!26911 m!21535))

(declare-fun m!21537 () Bool)

(assert (=> b!26911 m!21537))

(assert (=> b!26911 m!21511))

(declare-fun m!21539 () Bool)

(assert (=> b!26911 m!21539))

(declare-fun m!21541 () Bool)

(assert (=> b!26911 m!21541))

(declare-fun m!21543 () Bool)

(assert (=> bm!2524 m!21543))

(assert (=> b!26923 m!21531))

(declare-fun m!21545 () Bool)

(assert (=> b!26923 m!21545))

(declare-fun m!21547 () Bool)

(assert (=> b!26923 m!21547))

(declare-fun m!21549 () Bool)

(assert (=> b!26923 m!21549))

(declare-fun m!21551 () Bool)

(assert (=> b!26923 m!21551))

(assert (=> b!26923 m!21531))

(assert (=> b!26923 m!21549))

(assert (=> b!26923 m!21547))

(declare-fun m!21553 () Bool)

(assert (=> b!26918 m!21553))

(assert (=> b!26922 m!21531))

(assert (=> b!26922 m!21531))

(declare-fun m!21555 () Bool)

(assert (=> b!26922 m!21555))

(declare-fun m!21557 () Bool)

(assert (=> bm!2525 m!21557))

(assert (=> b!26920 m!21531))

(assert (=> b!26920 m!21531))

(declare-fun m!21559 () Bool)

(assert (=> b!26920 m!21559))

(assert (=> b!26924 m!21531))

(assert (=> b!26924 m!21531))

(assert (=> b!26924 m!21555))

(declare-fun m!21561 () Bool)

(assert (=> bm!2521 m!21561))

(assert (=> b!26826 d!4913))

(declare-fun bm!2528 () Bool)

(declare-fun call!2531 () Bool)

(assert (=> bm!2528 (= call!2531 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!26942 () Bool)

(declare-fun e!17570 () Bool)

(declare-fun e!17569 () Bool)

(assert (=> b!26942 (= e!17570 e!17569)))

(declare-fun lt!10494 () (_ BitVec 64))

(assert (=> b!26942 (= lt!10494 (select (arr!715 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10496 () Unit!627)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1517 (_ BitVec 64) (_ BitVec 32)) Unit!627)

(assert (=> b!26942 (= lt!10496 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10494 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!26942 (arrayContainsKey!0 _keys!1833 lt!10494 #b00000000000000000000000000000000)))

(declare-fun lt!10495 () Unit!627)

(assert (=> b!26942 (= lt!10495 lt!10496)))

(declare-fun res!15969 () Bool)

(declare-datatypes ((SeekEntryResult!62 0))(
  ( (MissingZero!62 (index!2370 (_ BitVec 32))) (Found!62 (index!2371 (_ BitVec 32))) (Intermediate!62 (undefined!874 Bool) (index!2372 (_ BitVec 32)) (x!6176 (_ BitVec 32))) (Undefined!62) (MissingVacant!62 (index!2373 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1517 (_ BitVec 32)) SeekEntryResult!62)

(assert (=> b!26942 (= res!15969 (= (seekEntryOrOpen!0 (select (arr!715 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!62 #b00000000000000000000000000000000)))))

(assert (=> b!26942 (=> (not res!15969) (not e!17569))))

(declare-fun b!26943 () Bool)

(assert (=> b!26943 (= e!17570 call!2531)))

(declare-fun b!26944 () Bool)

(declare-fun e!17568 () Bool)

(assert (=> b!26944 (= e!17568 e!17570)))

(declare-fun c!3680 () Bool)

(assert (=> b!26944 (= c!3680 (validKeyInArray!0 (select (arr!715 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26945 () Bool)

(assert (=> b!26945 (= e!17569 call!2531)))

(declare-fun d!4915 () Bool)

(declare-fun res!15968 () Bool)

(assert (=> d!4915 (=> res!15968 e!17568)))

(assert (=> d!4915 (= res!15968 (bvsge #b00000000000000000000000000000000 (size!816 _keys!1833)))))

(assert (=> d!4915 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17568)))

(assert (= (and d!4915 (not res!15968)) b!26944))

(assert (= (and b!26944 c!3680) b!26942))

(assert (= (and b!26944 (not c!3680)) b!26943))

(assert (= (and b!26942 res!15969) b!26945))

(assert (= (or b!26945 b!26943) bm!2528))

(declare-fun m!21563 () Bool)

(assert (=> bm!2528 m!21563))

(assert (=> b!26942 m!21531))

(declare-fun m!21565 () Bool)

(assert (=> b!26942 m!21565))

(declare-fun m!21567 () Bool)

(assert (=> b!26942 m!21567))

(assert (=> b!26942 m!21531))

(declare-fun m!21569 () Bool)

(assert (=> b!26942 m!21569))

(assert (=> b!26944 m!21531))

(assert (=> b!26944 m!21531))

(assert (=> b!26944 m!21555))

(assert (=> b!26830 d!4915))

(declare-fun d!4917 () Bool)

(assert (=> d!4917 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3828 d!4917))

(declare-fun d!4919 () Bool)

(assert (=> d!4919 (= (array_inv!491 _values!1501) (bvsge (size!815 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3828 d!4919))

(declare-fun d!4921 () Bool)

(assert (=> d!4921 (= (array_inv!492 _keys!1833) (bvsge (size!816 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3828 d!4921))

(declare-fun d!4923 () Bool)

(assert (=> d!4923 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!26831 d!4923))

(declare-fun bm!2531 () Bool)

(declare-fun call!2534 () Bool)

(declare-fun c!3683 () Bool)

(assert (=> bm!2531 (= call!2534 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3683 (Cons!601 (select (arr!715 _keys!1833) #b00000000000000000000000000000000) Nil!602) Nil!602)))))

(declare-fun b!26956 () Bool)

(declare-fun e!17581 () Bool)

(declare-fun e!17580 () Bool)

(assert (=> b!26956 (= e!17581 e!17580)))

(assert (=> b!26956 (= c!3683 (validKeyInArray!0 (select (arr!715 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26957 () Bool)

(assert (=> b!26957 (= e!17580 call!2534)))

(declare-fun b!26959 () Bool)

(declare-fun e!17579 () Bool)

(declare-fun contains!244 (List!605 (_ BitVec 64)) Bool)

(assert (=> b!26959 (= e!17579 (contains!244 Nil!602 (select (arr!715 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26960 () Bool)

(declare-fun e!17582 () Bool)

(assert (=> b!26960 (= e!17582 e!17581)))

(declare-fun res!15977 () Bool)

(assert (=> b!26960 (=> (not res!15977) (not e!17581))))

(assert (=> b!26960 (= res!15977 (not e!17579))))

(declare-fun res!15978 () Bool)

(assert (=> b!26960 (=> (not res!15978) (not e!17579))))

(assert (=> b!26960 (= res!15978 (validKeyInArray!0 (select (arr!715 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!4925 () Bool)

(declare-fun res!15976 () Bool)

(assert (=> d!4925 (=> res!15976 e!17582)))

(assert (=> d!4925 (= res!15976 (bvsge #b00000000000000000000000000000000 (size!816 _keys!1833)))))

(assert (=> d!4925 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!602) e!17582)))

(declare-fun b!26958 () Bool)

(assert (=> b!26958 (= e!17580 call!2534)))

(assert (= (and d!4925 (not res!15976)) b!26960))

(assert (= (and b!26960 res!15978) b!26959))

(assert (= (and b!26960 res!15977) b!26956))

(assert (= (and b!26956 c!3683) b!26957))

(assert (= (and b!26956 (not c!3683)) b!26958))

(assert (= (or b!26957 b!26958) bm!2531))

(assert (=> bm!2531 m!21531))

(declare-fun m!21571 () Bool)

(assert (=> bm!2531 m!21571))

(assert (=> b!26956 m!21531))

(assert (=> b!26956 m!21531))

(assert (=> b!26956 m!21555))

(assert (=> b!26959 m!21531))

(assert (=> b!26959 m!21531))

(declare-fun m!21573 () Bool)

(assert (=> b!26959 m!21573))

(assert (=> b!26960 m!21531))

(assert (=> b!26960 m!21531))

(assert (=> b!26960 m!21555))

(assert (=> b!26827 d!4925))

(declare-fun b!26967 () Bool)

(declare-fun e!17587 () Bool)

(assert (=> b!26967 (= e!17587 tp_is_empty!1137)))

(declare-fun mapIsEmpty!1231 () Bool)

(declare-fun mapRes!1231 () Bool)

(assert (=> mapIsEmpty!1231 mapRes!1231))

(declare-fun condMapEmpty!1231 () Bool)

(declare-fun mapDefault!1231 () ValueCell!369)

(assert (=> mapNonEmpty!1225 (= condMapEmpty!1231 (= mapRest!1225 ((as const (Array (_ BitVec 32) ValueCell!369)) mapDefault!1231)))))

(declare-fun e!17588 () Bool)

(assert (=> mapNonEmpty!1225 (= tp!3759 (and e!17588 mapRes!1231))))

(declare-fun mapNonEmpty!1231 () Bool)

(declare-fun tp!3769 () Bool)

(assert (=> mapNonEmpty!1231 (= mapRes!1231 (and tp!3769 e!17587))))

(declare-fun mapKey!1231 () (_ BitVec 32))

(declare-fun mapRest!1231 () (Array (_ BitVec 32) ValueCell!369))

(declare-fun mapValue!1231 () ValueCell!369)

(assert (=> mapNonEmpty!1231 (= mapRest!1225 (store mapRest!1231 mapKey!1231 mapValue!1231))))

(declare-fun b!26968 () Bool)

(assert (=> b!26968 (= e!17588 tp_is_empty!1137)))

(assert (= (and mapNonEmpty!1225 condMapEmpty!1231) mapIsEmpty!1231))

(assert (= (and mapNonEmpty!1225 (not condMapEmpty!1231)) mapNonEmpty!1231))

(assert (= (and mapNonEmpty!1231 ((_ is ValueCellFull!369) mapValue!1231)) b!26967))

(assert (= (and mapNonEmpty!1225 ((_ is ValueCellFull!369) mapDefault!1231)) b!26968))

(declare-fun m!21575 () Bool)

(assert (=> mapNonEmpty!1231 m!21575))

(declare-fun b_lambda!1685 () Bool)

(assert (= b_lambda!1683 (or (and start!3828 b_free!783) b_lambda!1685)))

(check-sat (not b!26918) (not b!26929) (not b!26911) (not b_next!783) (not b!26924) b_and!1591 (not b!26868) (not d!4913) (not b!26959) (not bm!2525) tp_is_empty!1137 (not bm!2524) (not bm!2528) (not b!26956) (not b!26922) (not b!26942) (not b_lambda!1685) (not b!26960) (not bm!2531) (not mapNonEmpty!1231) (not b!26912) (not bm!2519) (not d!4911) (not b!26944) (not b!26866) (not bm!2521) (not b!26920) (not b!26923))
(check-sat b_and!1591 (not b_next!783))
