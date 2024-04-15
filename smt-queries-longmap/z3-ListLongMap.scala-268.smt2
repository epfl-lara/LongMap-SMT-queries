; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4396 () Bool)

(assert start!4396)

(declare-fun b_free!1195 () Bool)

(declare-fun b_next!1195 () Bool)

(assert (=> start!4396 (= b_free!1195 (not b_next!1195))))

(declare-fun tp!5020 () Bool)

(declare-fun b_and!2009 () Bool)

(assert (=> start!4396 (= tp!5020 b_and!2009)))

(declare-fun b!33938 () Bool)

(declare-fun res!20596 () Bool)

(declare-fun e!21539 () Bool)

(assert (=> b!33938 (=> (not res!20596) (not e!21539))))

(declare-datatypes ((V!1891 0))(
  ( (V!1892 (val!801 Int)) )
))
(declare-datatypes ((ValueCell!575 0))(
  ( (ValueCellFull!575 (v!1894 V!1891)) (EmptyCell!575) )
))
(declare-datatypes ((array!2289 0))(
  ( (array!2290 (arr!1093 (Array (_ BitVec 32) ValueCell!575)) (size!1194 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2289)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2291 0))(
  ( (array!2292 (arr!1094 (Array (_ BitVec 32) (_ BitVec 64))) (size!1195 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2291)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!33938 (= res!20596 (and (= (size!1194 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1195 _keys!1833) (size!1194 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1867 () Bool)

(declare-fun mapRes!1867 () Bool)

(declare-fun tp!5019 () Bool)

(declare-fun e!21544 () Bool)

(assert (=> mapNonEmpty!1867 (= mapRes!1867 (and tp!5019 e!21544))))

(declare-fun mapRest!1867 () (Array (_ BitVec 32) ValueCell!575))

(declare-fun mapKey!1867 () (_ BitVec 32))

(declare-fun mapValue!1867 () ValueCell!575)

(assert (=> mapNonEmpty!1867 (= (arr!1093 _values!1501) (store mapRest!1867 mapKey!1867 mapValue!1867))))

(declare-fun b!33939 () Bool)

(declare-fun e!21543 () Bool)

(assert (=> b!33939 (= e!21543 (not false))))

(declare-fun lt!12549 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2291 (_ BitVec 32)) Bool)

(assert (=> b!33939 (arrayForallSeekEntryOrOpenFound!0 lt!12549 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!767 0))(
  ( (Unit!768) )
))
(declare-fun lt!12545 () Unit!767)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!2291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!767)

(assert (=> b!33939 (= lt!12545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12549))))

(declare-datatypes ((SeekEntryResult!144 0))(
  ( (MissingZero!144 (index!2698 (_ BitVec 32))) (Found!144 (index!2699 (_ BitVec 32))) (Intermediate!144 (undefined!956 Bool) (index!2700 (_ BitVec 32)) (x!6880 (_ BitVec 32))) (Undefined!144) (MissingVacant!144 (index!2701 (_ BitVec 32))) )
))
(declare-fun lt!12548 () SeekEntryResult!144)

(get-info :version)

(assert (=> b!33939 (and ((_ is Found!144) lt!12548) (= (index!2699 lt!12548) lt!12549))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2291 (_ BitVec 32)) SeekEntryResult!144)

(assert (=> b!33939 (= lt!12548 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12547 () Unit!767)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2291 (_ BitVec 32)) Unit!767)

(assert (=> b!33939 (= lt!12547 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12549 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1304 0))(
  ( (tuple2!1305 (_1!663 (_ BitVec 64)) (_2!663 V!1891)) )
))
(declare-datatypes ((List!887 0))(
  ( (Nil!884) (Cons!883 (h!1450 tuple2!1304) (t!3583 List!887)) )
))
(declare-datatypes ((ListLongMap!869 0))(
  ( (ListLongMap!870 (toList!450 List!887)) )
))
(declare-fun lt!12546 () ListLongMap!869)

(declare-fun contains!396 (ListLongMap!869 (_ BitVec 64)) Bool)

(assert (=> b!33939 (contains!396 lt!12546 (select (arr!1094 _keys!1833) lt!12549))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!12550 () Unit!767)

(declare-fun zeroValue!1443 () V!1891)

(declare-fun minValue!1443 () V!1891)

(declare-fun lemmaValidKeyInArrayIsInListMap!65 (array!2291 array!2289 (_ BitVec 32) (_ BitVec 32) V!1891 V!1891 (_ BitVec 32) Int) Unit!767)

(assert (=> b!33939 (= lt!12550 (lemmaValidKeyInArrayIsInListMap!65 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12549 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2291 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33939 (= lt!12549 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33940 () Bool)

(assert (=> b!33940 (= e!21539 e!21543)))

(declare-fun res!20591 () Bool)

(assert (=> b!33940 (=> (not res!20591) (not e!21543))))

(assert (=> b!33940 (= res!20591 (not (contains!396 lt!12546 k0!1304)))))

(declare-fun getCurrentListMap!269 (array!2291 array!2289 (_ BitVec 32) (_ BitVec 32) V!1891 V!1891 (_ BitVec 32) Int) ListLongMap!869)

(assert (=> b!33940 (= lt!12546 (getCurrentListMap!269 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1867 () Bool)

(assert (=> mapIsEmpty!1867 mapRes!1867))

(declare-fun b!33941 () Bool)

(declare-fun res!20590 () Bool)

(assert (=> b!33941 (=> (not res!20590) (not e!21539))))

(assert (=> b!33941 (= res!20590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33942 () Bool)

(declare-fun tp_is_empty!1549 () Bool)

(assert (=> b!33942 (= e!21544 tp_is_empty!1549)))

(declare-fun b!33944 () Bool)

(declare-fun res!20592 () Bool)

(assert (=> b!33944 (=> (not res!20592) (not e!21543))))

(declare-fun arrayContainsKey!0 (array!2291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33944 (= res!20592 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33945 () Bool)

(declare-fun res!20593 () Bool)

(assert (=> b!33945 (=> (not res!20593) (not e!21539))))

(declare-datatypes ((List!888 0))(
  ( (Nil!885) (Cons!884 (h!1451 (_ BitVec 64)) (t!3584 List!888)) )
))
(declare-fun arrayNoDuplicates!0 (array!2291 (_ BitVec 32) List!888) Bool)

(assert (=> b!33945 (= res!20593 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!885))))

(declare-fun b!33946 () Bool)

(declare-fun res!20595 () Bool)

(assert (=> b!33946 (=> (not res!20595) (not e!21539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33946 (= res!20595 (validKeyInArray!0 k0!1304))))

(declare-fun b!33947 () Bool)

(declare-fun e!21540 () Bool)

(declare-fun e!21542 () Bool)

(assert (=> b!33947 (= e!21540 (and e!21542 mapRes!1867))))

(declare-fun condMapEmpty!1867 () Bool)

(declare-fun mapDefault!1867 () ValueCell!575)

(assert (=> b!33947 (= condMapEmpty!1867 (= (arr!1093 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!575)) mapDefault!1867)))))

(declare-fun b!33943 () Bool)

(assert (=> b!33943 (= e!21542 tp_is_empty!1549)))

(declare-fun res!20594 () Bool)

(assert (=> start!4396 (=> (not res!20594) (not e!21539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4396 (= res!20594 (validMask!0 mask!2294))))

(assert (=> start!4396 e!21539))

(assert (=> start!4396 true))

(assert (=> start!4396 tp!5020))

(declare-fun array_inv!779 (array!2289) Bool)

(assert (=> start!4396 (and (array_inv!779 _values!1501) e!21540)))

(declare-fun array_inv!780 (array!2291) Bool)

(assert (=> start!4396 (array_inv!780 _keys!1833)))

(assert (=> start!4396 tp_is_empty!1549))

(assert (= (and start!4396 res!20594) b!33938))

(assert (= (and b!33938 res!20596) b!33941))

(assert (= (and b!33941 res!20590) b!33945))

(assert (= (and b!33945 res!20593) b!33946))

(assert (= (and b!33946 res!20595) b!33940))

(assert (= (and b!33940 res!20591) b!33944))

(assert (= (and b!33944 res!20592) b!33939))

(assert (= (and b!33947 condMapEmpty!1867) mapIsEmpty!1867))

(assert (= (and b!33947 (not condMapEmpty!1867)) mapNonEmpty!1867))

(assert (= (and mapNonEmpty!1867 ((_ is ValueCellFull!575) mapValue!1867)) b!33942))

(assert (= (and b!33947 ((_ is ValueCellFull!575) mapDefault!1867)) b!33943))

(assert (= start!4396 b!33947))

(declare-fun m!27273 () Bool)

(assert (=> b!33940 m!27273))

(declare-fun m!27275 () Bool)

(assert (=> b!33940 m!27275))

(declare-fun m!27277 () Bool)

(assert (=> b!33945 m!27277))

(declare-fun m!27279 () Bool)

(assert (=> b!33941 m!27279))

(declare-fun m!27281 () Bool)

(assert (=> b!33944 m!27281))

(declare-fun m!27283 () Bool)

(assert (=> b!33939 m!27283))

(declare-fun m!27285 () Bool)

(assert (=> b!33939 m!27285))

(declare-fun m!27287 () Bool)

(assert (=> b!33939 m!27287))

(declare-fun m!27289 () Bool)

(assert (=> b!33939 m!27289))

(declare-fun m!27291 () Bool)

(assert (=> b!33939 m!27291))

(declare-fun m!27293 () Bool)

(assert (=> b!33939 m!27293))

(declare-fun m!27295 () Bool)

(assert (=> b!33939 m!27295))

(declare-fun m!27297 () Bool)

(assert (=> b!33939 m!27297))

(assert (=> b!33939 m!27289))

(declare-fun m!27299 () Bool)

(assert (=> mapNonEmpty!1867 m!27299))

(declare-fun m!27301 () Bool)

(assert (=> start!4396 m!27301))

(declare-fun m!27303 () Bool)

(assert (=> start!4396 m!27303))

(declare-fun m!27305 () Bool)

(assert (=> start!4396 m!27305))

(declare-fun m!27307 () Bool)

(assert (=> b!33946 m!27307))

(check-sat (not mapNonEmpty!1867) (not b!33944) tp_is_empty!1549 (not start!4396) (not b!33939) b_and!2009 (not b_next!1195) (not b!33941) (not b!33946) (not b!33940) (not b!33945))
(check-sat b_and!2009 (not b_next!1195))
(get-model)

(declare-fun d!5185 () Bool)

(declare-fun res!20643 () Bool)

(declare-fun e!21585 () Bool)

(assert (=> d!5185 (=> res!20643 e!21585)))

(assert (=> d!5185 (= res!20643 (= (select (arr!1094 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5185 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!21585)))

(declare-fun b!34012 () Bool)

(declare-fun e!21586 () Bool)

(assert (=> b!34012 (= e!21585 e!21586)))

(declare-fun res!20644 () Bool)

(assert (=> b!34012 (=> (not res!20644) (not e!21586))))

(assert (=> b!34012 (= res!20644 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1195 _keys!1833)))))

(declare-fun b!34013 () Bool)

(assert (=> b!34013 (= e!21586 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5185 (not res!20643)) b!34012))

(assert (= (and b!34012 res!20644) b!34013))

(declare-fun m!27381 () Bool)

(assert (=> d!5185 m!27381))

(declare-fun m!27383 () Bool)

(assert (=> b!34013 m!27383))

(assert (=> b!33944 d!5185))

(declare-fun d!5187 () Bool)

(declare-fun lt!12589 () (_ BitVec 32))

(assert (=> d!5187 (and (or (bvslt lt!12589 #b00000000000000000000000000000000) (bvsge lt!12589 (size!1195 _keys!1833)) (and (bvsge lt!12589 #b00000000000000000000000000000000) (bvslt lt!12589 (size!1195 _keys!1833)))) (bvsge lt!12589 #b00000000000000000000000000000000) (bvslt lt!12589 (size!1195 _keys!1833)) (= (select (arr!1094 _keys!1833) lt!12589) k0!1304))))

(declare-fun e!21589 () (_ BitVec 32))

(assert (=> d!5187 (= lt!12589 e!21589)))

(declare-fun c!3909 () Bool)

(assert (=> d!5187 (= c!3909 (= (select (arr!1094 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1195 _keys!1833)) (bvslt (size!1195 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5187 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!12589)))

(declare-fun b!34018 () Bool)

(assert (=> b!34018 (= e!21589 #b00000000000000000000000000000000)))

(declare-fun b!34019 () Bool)

(assert (=> b!34019 (= e!21589 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5187 c!3909) b!34018))

(assert (= (and d!5187 (not c!3909)) b!34019))

(declare-fun m!27385 () Bool)

(assert (=> d!5187 m!27385))

(assert (=> d!5187 m!27381))

(declare-fun m!27387 () Bool)

(assert (=> b!34019 m!27387))

(assert (=> b!33939 d!5187))

(declare-fun b!34028 () Bool)

(declare-fun e!21597 () Bool)

(declare-fun e!21598 () Bool)

(assert (=> b!34028 (= e!21597 e!21598)))

(declare-fun lt!12597 () (_ BitVec 64))

(assert (=> b!34028 (= lt!12597 (select (arr!1094 _keys!1833) lt!12549))))

(declare-fun lt!12598 () Unit!767)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2291 (_ BitVec 64) (_ BitVec 32)) Unit!767)

(assert (=> b!34028 (= lt!12598 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12597 lt!12549))))

(assert (=> b!34028 (arrayContainsKey!0 _keys!1833 lt!12597 #b00000000000000000000000000000000)))

(declare-fun lt!12596 () Unit!767)

(assert (=> b!34028 (= lt!12596 lt!12598)))

(declare-fun res!20650 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2291 (_ BitVec 32)) SeekEntryResult!144)

(assert (=> b!34028 (= res!20650 (= (seekEntryOrOpen!0 (select (arr!1094 _keys!1833) lt!12549) _keys!1833 mask!2294) (Found!144 lt!12549)))))

(assert (=> b!34028 (=> (not res!20650) (not e!21598))))

(declare-fun d!5189 () Bool)

(declare-fun res!20649 () Bool)

(declare-fun e!21596 () Bool)

(assert (=> d!5189 (=> res!20649 e!21596)))

(assert (=> d!5189 (= res!20649 (bvsge lt!12549 (size!1195 _keys!1833)))))

(assert (=> d!5189 (= (arrayForallSeekEntryOrOpenFound!0 lt!12549 _keys!1833 mask!2294) e!21596)))

(declare-fun b!34029 () Bool)

(declare-fun call!2726 () Bool)

(assert (=> b!34029 (= e!21597 call!2726)))

(declare-fun b!34030 () Bool)

(assert (=> b!34030 (= e!21596 e!21597)))

(declare-fun c!3912 () Bool)

(assert (=> b!34030 (= c!3912 (validKeyInArray!0 (select (arr!1094 _keys!1833) lt!12549)))))

(declare-fun bm!2723 () Bool)

(assert (=> bm!2723 (= call!2726 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!12549 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!34031 () Bool)

(assert (=> b!34031 (= e!21598 call!2726)))

(assert (= (and d!5189 (not res!20649)) b!34030))

(assert (= (and b!34030 c!3912) b!34028))

(assert (= (and b!34030 (not c!3912)) b!34029))

(assert (= (and b!34028 res!20650) b!34031))

(assert (= (or b!34031 b!34029) bm!2723))

(assert (=> b!34028 m!27289))

(declare-fun m!27389 () Bool)

(assert (=> b!34028 m!27389))

(declare-fun m!27391 () Bool)

(assert (=> b!34028 m!27391))

(assert (=> b!34028 m!27289))

(declare-fun m!27393 () Bool)

(assert (=> b!34028 m!27393))

(assert (=> b!34030 m!27289))

(assert (=> b!34030 m!27289))

(declare-fun m!27395 () Bool)

(assert (=> b!34030 m!27395))

(declare-fun m!27397 () Bool)

(assert (=> bm!2723 m!27397))

(assert (=> b!33939 d!5189))

(declare-fun d!5191 () Bool)

(assert (=> d!5191 (arrayForallSeekEntryOrOpenFound!0 lt!12549 _keys!1833 mask!2294)))

(declare-fun lt!12601 () Unit!767)

(declare-fun choose!38 (array!2291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!767)

(assert (=> d!5191 (= lt!12601 (choose!38 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12549))))

(assert (=> d!5191 (validMask!0 mask!2294)))

(assert (=> d!5191 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12549) lt!12601)))

(declare-fun bs!1315 () Bool)

(assert (= bs!1315 d!5191))

(assert (=> bs!1315 m!27297))

(declare-fun m!27399 () Bool)

(assert (=> bs!1315 m!27399))

(assert (=> bs!1315 m!27301))

(assert (=> b!33939 d!5191))

(declare-fun d!5193 () Bool)

(declare-fun e!21601 () Bool)

(assert (=> d!5193 e!21601))

(declare-fun res!20653 () Bool)

(assert (=> d!5193 (=> (not res!20653) (not e!21601))))

(assert (=> d!5193 (= res!20653 (and (bvsge lt!12549 #b00000000000000000000000000000000) (bvslt lt!12549 (size!1195 _keys!1833))))))

(declare-fun lt!12604 () Unit!767)

(declare-fun choose!219 (array!2291 array!2289 (_ BitVec 32) (_ BitVec 32) V!1891 V!1891 (_ BitVec 32) Int) Unit!767)

(assert (=> d!5193 (= lt!12604 (choose!219 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12549 defaultEntry!1504))))

(assert (=> d!5193 (validMask!0 mask!2294)))

(assert (=> d!5193 (= (lemmaValidKeyInArrayIsInListMap!65 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12549 defaultEntry!1504) lt!12604)))

(declare-fun b!34034 () Bool)

(assert (=> b!34034 (= e!21601 (contains!396 (getCurrentListMap!269 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1094 _keys!1833) lt!12549)))))

(assert (= (and d!5193 res!20653) b!34034))

(declare-fun m!27401 () Bool)

(assert (=> d!5193 m!27401))

(assert (=> d!5193 m!27301))

(assert (=> b!34034 m!27275))

(assert (=> b!34034 m!27289))

(assert (=> b!34034 m!27275))

(assert (=> b!34034 m!27289))

(declare-fun m!27403 () Bool)

(assert (=> b!34034 m!27403))

(assert (=> b!33939 d!5193))

(declare-fun b!34047 () Bool)

(declare-fun e!21610 () SeekEntryResult!144)

(declare-fun e!21609 () SeekEntryResult!144)

(assert (=> b!34047 (= e!21610 e!21609)))

(declare-fun lt!12614 () (_ BitVec 64))

(declare-fun lt!12613 () SeekEntryResult!144)

(assert (=> b!34047 (= lt!12614 (select (arr!1094 _keys!1833) (index!2700 lt!12613)))))

(declare-fun c!3920 () Bool)

(assert (=> b!34047 (= c!3920 (= lt!12614 k0!1304))))

(declare-fun b!34049 () Bool)

(assert (=> b!34049 (= e!21610 Undefined!144)))

(declare-fun b!34050 () Bool)

(declare-fun e!21608 () SeekEntryResult!144)

(assert (=> b!34050 (= e!21608 (MissingZero!144 (index!2700 lt!12613)))))

(declare-fun b!34051 () Bool)

(declare-fun c!3921 () Bool)

(assert (=> b!34051 (= c!3921 (= lt!12614 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!34051 (= e!21609 e!21608)))

(declare-fun b!34052 () Bool)

(declare-fun lt!12615 () SeekEntryResult!144)

(assert (=> b!34052 (= e!21608 (ite ((_ is MissingVacant!144) lt!12615) (MissingZero!144 (index!2701 lt!12615)) lt!12615))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2291 (_ BitVec 32)) SeekEntryResult!144)

(assert (=> b!34052 (= lt!12615 (seekKeyOrZeroReturnVacant!0 (x!6880 lt!12613) (index!2700 lt!12613) (index!2700 lt!12613) k0!1304 _keys!1833 mask!2294))))

(declare-fun d!5195 () Bool)

(declare-fun lt!12616 () SeekEntryResult!144)

(assert (=> d!5195 (and (or ((_ is MissingVacant!144) lt!12616) (not ((_ is Found!144) lt!12616)) (and (bvsge (index!2699 lt!12616) #b00000000000000000000000000000000) (bvslt (index!2699 lt!12616) (size!1195 _keys!1833)))) (not ((_ is MissingVacant!144) lt!12616)) (or (not ((_ is Found!144) lt!12616)) (= (select (arr!1094 _keys!1833) (index!2699 lt!12616)) k0!1304)))))

(assert (=> d!5195 (= lt!12616 e!21610)))

(declare-fun c!3919 () Bool)

(assert (=> d!5195 (= c!3919 (and ((_ is Intermediate!144) lt!12613) (undefined!956 lt!12613)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2291 (_ BitVec 32)) SeekEntryResult!144)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5195 (= lt!12613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5195 (validMask!0 mask!2294)))

(assert (=> d!5195 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12616)))

(declare-fun b!34048 () Bool)

(assert (=> b!34048 (= e!21609 (Found!144 (index!2700 lt!12613)))))

(assert (= (and d!5195 c!3919) b!34049))

(assert (= (and d!5195 (not c!3919)) b!34047))

(assert (= (and b!34047 c!3920) b!34048))

(assert (= (and b!34047 (not c!3920)) b!34051))

(assert (= (and b!34051 c!3921) b!34050))

(assert (= (and b!34051 (not c!3921)) b!34052))

(declare-fun m!27405 () Bool)

(assert (=> b!34047 m!27405))

(declare-fun m!27407 () Bool)

(assert (=> b!34052 m!27407))

(declare-fun m!27409 () Bool)

(assert (=> d!5195 m!27409))

(declare-fun m!27411 () Bool)

(assert (=> d!5195 m!27411))

(assert (=> d!5195 m!27411))

(declare-fun m!27413 () Bool)

(assert (=> d!5195 m!27413))

(assert (=> d!5195 m!27301))

(assert (=> b!33939 d!5195))

(declare-fun d!5197 () Bool)

(declare-fun e!21616 () Bool)

(assert (=> d!5197 e!21616))

(declare-fun res!20656 () Bool)

(assert (=> d!5197 (=> res!20656 e!21616)))

(declare-fun lt!12626 () Bool)

(assert (=> d!5197 (= res!20656 (not lt!12626))))

(declare-fun lt!12627 () Bool)

(assert (=> d!5197 (= lt!12626 lt!12627)))

(declare-fun lt!12628 () Unit!767)

(declare-fun e!21615 () Unit!767)

(assert (=> d!5197 (= lt!12628 e!21615)))

(declare-fun c!3924 () Bool)

(assert (=> d!5197 (= c!3924 lt!12627)))

(declare-fun containsKey!33 (List!887 (_ BitVec 64)) Bool)

(assert (=> d!5197 (= lt!12627 (containsKey!33 (toList!450 lt!12546) (select (arr!1094 _keys!1833) lt!12549)))))

(assert (=> d!5197 (= (contains!396 lt!12546 (select (arr!1094 _keys!1833) lt!12549)) lt!12626)))

(declare-fun b!34059 () Bool)

(declare-fun lt!12625 () Unit!767)

(assert (=> b!34059 (= e!21615 lt!12625)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!30 (List!887 (_ BitVec 64)) Unit!767)

(assert (=> b!34059 (= lt!12625 (lemmaContainsKeyImpliesGetValueByKeyDefined!30 (toList!450 lt!12546) (select (arr!1094 _keys!1833) lt!12549)))))

(declare-datatypes ((Option!75 0))(
  ( (Some!74 (v!1897 V!1891)) (None!73) )
))
(declare-fun isDefined!31 (Option!75) Bool)

(declare-fun getValueByKey!69 (List!887 (_ BitVec 64)) Option!75)

(assert (=> b!34059 (isDefined!31 (getValueByKey!69 (toList!450 lt!12546) (select (arr!1094 _keys!1833) lt!12549)))))

(declare-fun b!34060 () Bool)

(declare-fun Unit!769 () Unit!767)

(assert (=> b!34060 (= e!21615 Unit!769)))

(declare-fun b!34061 () Bool)

(assert (=> b!34061 (= e!21616 (isDefined!31 (getValueByKey!69 (toList!450 lt!12546) (select (arr!1094 _keys!1833) lt!12549))))))

(assert (= (and d!5197 c!3924) b!34059))

(assert (= (and d!5197 (not c!3924)) b!34060))

(assert (= (and d!5197 (not res!20656)) b!34061))

(assert (=> d!5197 m!27289))

(declare-fun m!27415 () Bool)

(assert (=> d!5197 m!27415))

(assert (=> b!34059 m!27289))

(declare-fun m!27417 () Bool)

(assert (=> b!34059 m!27417))

(assert (=> b!34059 m!27289))

(declare-fun m!27419 () Bool)

(assert (=> b!34059 m!27419))

(assert (=> b!34059 m!27419))

(declare-fun m!27421 () Bool)

(assert (=> b!34059 m!27421))

(assert (=> b!34061 m!27289))

(assert (=> b!34061 m!27419))

(assert (=> b!34061 m!27419))

(assert (=> b!34061 m!27421))

(assert (=> b!33939 d!5197))

(declare-fun d!5199 () Bool)

(declare-fun lt!12634 () SeekEntryResult!144)

(assert (=> d!5199 (and ((_ is Found!144) lt!12634) (= (index!2699 lt!12634) lt!12549))))

(assert (=> d!5199 (= lt!12634 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12633 () Unit!767)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!2291 (_ BitVec 32)) Unit!767)

(assert (=> d!5199 (= lt!12633 (choose!0 k0!1304 lt!12549 _keys!1833 mask!2294))))

(assert (=> d!5199 (validMask!0 mask!2294)))

(assert (=> d!5199 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12549 _keys!1833 mask!2294) lt!12633)))

(declare-fun bs!1316 () Bool)

(assert (= bs!1316 d!5199))

(assert (=> bs!1316 m!27287))

(declare-fun m!27423 () Bool)

(assert (=> bs!1316 m!27423))

(assert (=> bs!1316 m!27301))

(assert (=> b!33939 d!5199))

(declare-fun d!5201 () Bool)

(assert (=> d!5201 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4396 d!5201))

(declare-fun d!5203 () Bool)

(assert (=> d!5203 (= (array_inv!779 _values!1501) (bvsge (size!1194 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4396 d!5203))

(declare-fun d!5205 () Bool)

(assert (=> d!5205 (= (array_inv!780 _keys!1833) (bvsge (size!1195 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4396 d!5205))

(declare-fun b!34072 () Bool)

(declare-fun e!21625 () Bool)

(declare-fun e!21626 () Bool)

(assert (=> b!34072 (= e!21625 e!21626)))

(declare-fun res!20665 () Bool)

(assert (=> b!34072 (=> (not res!20665) (not e!21626))))

(declare-fun e!21627 () Bool)

(assert (=> b!34072 (= res!20665 (not e!21627))))

(declare-fun res!20663 () Bool)

(assert (=> b!34072 (=> (not res!20663) (not e!21627))))

(assert (=> b!34072 (= res!20663 (validKeyInArray!0 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5207 () Bool)

(declare-fun res!20664 () Bool)

(assert (=> d!5207 (=> res!20664 e!21625)))

(assert (=> d!5207 (= res!20664 (bvsge #b00000000000000000000000000000000 (size!1195 _keys!1833)))))

(assert (=> d!5207 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!885) e!21625)))

(declare-fun b!34073 () Bool)

(declare-fun contains!397 (List!888 (_ BitVec 64)) Bool)

(assert (=> b!34073 (= e!21627 (contains!397 Nil!885 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!34074 () Bool)

(declare-fun e!21628 () Bool)

(declare-fun call!2729 () Bool)

(assert (=> b!34074 (= e!21628 call!2729)))

(declare-fun bm!2726 () Bool)

(declare-fun c!3927 () Bool)

(assert (=> bm!2726 (= call!2729 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3927 (Cons!884 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000) Nil!885) Nil!885)))))

(declare-fun b!34075 () Bool)

(assert (=> b!34075 (= e!21628 call!2729)))

(declare-fun b!34076 () Bool)

(assert (=> b!34076 (= e!21626 e!21628)))

(assert (=> b!34076 (= c!3927 (validKeyInArray!0 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5207 (not res!20664)) b!34072))

(assert (= (and b!34072 res!20663) b!34073))

(assert (= (and b!34072 res!20665) b!34076))

(assert (= (and b!34076 c!3927) b!34075))

(assert (= (and b!34076 (not c!3927)) b!34074))

(assert (= (or b!34075 b!34074) bm!2726))

(assert (=> b!34072 m!27381))

(assert (=> b!34072 m!27381))

(declare-fun m!27425 () Bool)

(assert (=> b!34072 m!27425))

(assert (=> b!34073 m!27381))

(assert (=> b!34073 m!27381))

(declare-fun m!27427 () Bool)

(assert (=> b!34073 m!27427))

(assert (=> bm!2726 m!27381))

(declare-fun m!27429 () Bool)

(assert (=> bm!2726 m!27429))

(assert (=> b!34076 m!27381))

(assert (=> b!34076 m!27381))

(assert (=> b!34076 m!27425))

(assert (=> b!33945 d!5207))

(declare-fun d!5209 () Bool)

(declare-fun e!21630 () Bool)

(assert (=> d!5209 e!21630))

(declare-fun res!20666 () Bool)

(assert (=> d!5209 (=> res!20666 e!21630)))

(declare-fun lt!12636 () Bool)

(assert (=> d!5209 (= res!20666 (not lt!12636))))

(declare-fun lt!12637 () Bool)

(assert (=> d!5209 (= lt!12636 lt!12637)))

(declare-fun lt!12638 () Unit!767)

(declare-fun e!21629 () Unit!767)

(assert (=> d!5209 (= lt!12638 e!21629)))

(declare-fun c!3928 () Bool)

(assert (=> d!5209 (= c!3928 lt!12637)))

(assert (=> d!5209 (= lt!12637 (containsKey!33 (toList!450 lt!12546) k0!1304))))

(assert (=> d!5209 (= (contains!396 lt!12546 k0!1304) lt!12636)))

(declare-fun b!34077 () Bool)

(declare-fun lt!12635 () Unit!767)

(assert (=> b!34077 (= e!21629 lt!12635)))

(assert (=> b!34077 (= lt!12635 (lemmaContainsKeyImpliesGetValueByKeyDefined!30 (toList!450 lt!12546) k0!1304))))

(assert (=> b!34077 (isDefined!31 (getValueByKey!69 (toList!450 lt!12546) k0!1304))))

(declare-fun b!34078 () Bool)

(declare-fun Unit!770 () Unit!767)

(assert (=> b!34078 (= e!21629 Unit!770)))

(declare-fun b!34079 () Bool)

(assert (=> b!34079 (= e!21630 (isDefined!31 (getValueByKey!69 (toList!450 lt!12546) k0!1304)))))

(assert (= (and d!5209 c!3928) b!34077))

(assert (= (and d!5209 (not c!3928)) b!34078))

(assert (= (and d!5209 (not res!20666)) b!34079))

(declare-fun m!27431 () Bool)

(assert (=> d!5209 m!27431))

(declare-fun m!27433 () Bool)

(assert (=> b!34077 m!27433))

(declare-fun m!27435 () Bool)

(assert (=> b!34077 m!27435))

(assert (=> b!34077 m!27435))

(declare-fun m!27437 () Bool)

(assert (=> b!34077 m!27437))

(assert (=> b!34079 m!27435))

(assert (=> b!34079 m!27435))

(assert (=> b!34079 m!27437))

(assert (=> b!33940 d!5209))

(declare-fun b!34122 () Bool)

(declare-fun e!21660 () Bool)

(declare-fun e!21661 () Bool)

(assert (=> b!34122 (= e!21660 e!21661)))

(declare-fun res!20688 () Bool)

(assert (=> b!34122 (=> (not res!20688) (not e!21661))))

(declare-fun lt!12689 () ListLongMap!869)

(assert (=> b!34122 (= res!20688 (contains!396 lt!12689 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!34122 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1195 _keys!1833)))))

(declare-fun b!34123 () Bool)

(declare-fun res!20687 () Bool)

(declare-fun e!21663 () Bool)

(assert (=> b!34123 (=> (not res!20687) (not e!21663))))

(assert (=> b!34123 (= res!20687 e!21660)))

(declare-fun res!20693 () Bool)

(assert (=> b!34123 (=> res!20693 e!21660)))

(declare-fun e!21669 () Bool)

(assert (=> b!34123 (= res!20693 (not e!21669))))

(declare-fun res!20690 () Bool)

(assert (=> b!34123 (=> (not res!20690) (not e!21669))))

(assert (=> b!34123 (= res!20690 (bvslt #b00000000000000000000000000000000 (size!1195 _keys!1833)))))

(declare-fun b!34124 () Bool)

(declare-fun e!21658 () ListLongMap!869)

(declare-fun call!2744 () ListLongMap!869)

(declare-fun +!56 (ListLongMap!869 tuple2!1304) ListLongMap!869)

(assert (=> b!34124 (= e!21658 (+!56 call!2744 (tuple2!1305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun bm!2741 () Bool)

(declare-fun call!2746 () Bool)

(assert (=> bm!2741 (= call!2746 (contains!396 lt!12689 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!34125 () Bool)

(declare-fun res!20689 () Bool)

(assert (=> b!34125 (=> (not res!20689) (not e!21663))))

(declare-fun e!21666 () Bool)

(assert (=> b!34125 (= res!20689 e!21666)))

(declare-fun c!3942 () Bool)

(assert (=> b!34125 (= c!3942 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!2742 () Bool)

(declare-fun call!2745 () ListLongMap!869)

(declare-fun getCurrentListMapNoExtraKeys!25 (array!2291 array!2289 (_ BitVec 32) (_ BitVec 32) V!1891 V!1891 (_ BitVec 32) Int) ListLongMap!869)

(assert (=> bm!2742 (= call!2745 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!34127 () Bool)

(declare-fun e!21668 () Bool)

(declare-fun apply!38 (ListLongMap!869 (_ BitVec 64)) V!1891)

(assert (=> b!34127 (= e!21668 (= (apply!38 lt!12689 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!34128 () Bool)

(declare-fun e!21659 () Bool)

(assert (=> b!34128 (= e!21659 (validKeyInArray!0 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!34129 () Bool)

(declare-fun e!21665 () ListLongMap!869)

(declare-fun call!2750 () ListLongMap!869)

(assert (=> b!34129 (= e!21665 call!2750)))

(declare-fun b!34130 () Bool)

(declare-fun e!21662 () ListLongMap!869)

(assert (=> b!34130 (= e!21662 call!2750)))

(declare-fun b!34131 () Bool)

(assert (=> b!34131 (= e!21666 e!21668)))

(declare-fun res!20685 () Bool)

(declare-fun call!2748 () Bool)

(assert (=> b!34131 (= res!20685 call!2748)))

(assert (=> b!34131 (=> (not res!20685) (not e!21668))))

(declare-fun bm!2743 () Bool)

(declare-fun call!2747 () ListLongMap!869)

(assert (=> bm!2743 (= call!2747 call!2745)))

(declare-fun b!34132 () Bool)

(assert (=> b!34132 (= e!21666 (not call!2748))))

(declare-fun bm!2744 () Bool)

(declare-fun call!2749 () ListLongMap!869)

(assert (=> bm!2744 (= call!2749 call!2747)))

(declare-fun d!5211 () Bool)

(assert (=> d!5211 e!21663))

(declare-fun res!20691 () Bool)

(assert (=> d!5211 (=> (not res!20691) (not e!21663))))

(assert (=> d!5211 (= res!20691 (or (bvsge #b00000000000000000000000000000000 (size!1195 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1195 _keys!1833)))))))

(declare-fun lt!12698 () ListLongMap!869)

(assert (=> d!5211 (= lt!12689 lt!12698)))

(declare-fun lt!12704 () Unit!767)

(declare-fun e!21664 () Unit!767)

(assert (=> d!5211 (= lt!12704 e!21664)))

(declare-fun c!3946 () Bool)

(assert (=> d!5211 (= c!3946 e!21659)))

(declare-fun res!20692 () Bool)

(assert (=> d!5211 (=> (not res!20692) (not e!21659))))

(assert (=> d!5211 (= res!20692 (bvslt #b00000000000000000000000000000000 (size!1195 _keys!1833)))))

(assert (=> d!5211 (= lt!12698 e!21658)))

(declare-fun c!3943 () Bool)

(assert (=> d!5211 (= c!3943 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5211 (validMask!0 mask!2294)))

(assert (=> d!5211 (= (getCurrentListMap!269 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12689)))

(declare-fun b!34126 () Bool)

(declare-fun lt!12696 () Unit!767)

(assert (=> b!34126 (= e!21664 lt!12696)))

(declare-fun lt!12687 () ListLongMap!869)

(assert (=> b!34126 (= lt!12687 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12695 () (_ BitVec 64))

(assert (=> b!34126 (= lt!12695 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12700 () (_ BitVec 64))

(assert (=> b!34126 (= lt!12700 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12686 () Unit!767)

(declare-fun addStillContains!23 (ListLongMap!869 (_ BitVec 64) V!1891 (_ BitVec 64)) Unit!767)

(assert (=> b!34126 (= lt!12686 (addStillContains!23 lt!12687 lt!12695 zeroValue!1443 lt!12700))))

(assert (=> b!34126 (contains!396 (+!56 lt!12687 (tuple2!1305 lt!12695 zeroValue!1443)) lt!12700)))

(declare-fun lt!12699 () Unit!767)

(assert (=> b!34126 (= lt!12699 lt!12686)))

(declare-fun lt!12697 () ListLongMap!869)

(assert (=> b!34126 (= lt!12697 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12683 () (_ BitVec 64))

(assert (=> b!34126 (= lt!12683 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12688 () (_ BitVec 64))

(assert (=> b!34126 (= lt!12688 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12690 () Unit!767)

(declare-fun addApplyDifferent!23 (ListLongMap!869 (_ BitVec 64) V!1891 (_ BitVec 64)) Unit!767)

(assert (=> b!34126 (= lt!12690 (addApplyDifferent!23 lt!12697 lt!12683 minValue!1443 lt!12688))))

(assert (=> b!34126 (= (apply!38 (+!56 lt!12697 (tuple2!1305 lt!12683 minValue!1443)) lt!12688) (apply!38 lt!12697 lt!12688))))

(declare-fun lt!12685 () Unit!767)

(assert (=> b!34126 (= lt!12685 lt!12690)))

(declare-fun lt!12691 () ListLongMap!869)

(assert (=> b!34126 (= lt!12691 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12684 () (_ BitVec 64))

(assert (=> b!34126 (= lt!12684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12693 () (_ BitVec 64))

(assert (=> b!34126 (= lt!12693 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12694 () Unit!767)

(assert (=> b!34126 (= lt!12694 (addApplyDifferent!23 lt!12691 lt!12684 zeroValue!1443 lt!12693))))

(assert (=> b!34126 (= (apply!38 (+!56 lt!12691 (tuple2!1305 lt!12684 zeroValue!1443)) lt!12693) (apply!38 lt!12691 lt!12693))))

(declare-fun lt!12702 () Unit!767)

(assert (=> b!34126 (= lt!12702 lt!12694)))

(declare-fun lt!12703 () ListLongMap!869)

(assert (=> b!34126 (= lt!12703 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12692 () (_ BitVec 64))

(assert (=> b!34126 (= lt!12692 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12701 () (_ BitVec 64))

(assert (=> b!34126 (= lt!12701 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!34126 (= lt!12696 (addApplyDifferent!23 lt!12703 lt!12692 minValue!1443 lt!12701))))

(assert (=> b!34126 (= (apply!38 (+!56 lt!12703 (tuple2!1305 lt!12692 minValue!1443)) lt!12701) (apply!38 lt!12703 lt!12701))))

(declare-fun b!34133 () Bool)

(declare-fun e!21667 () Bool)

(declare-fun e!21657 () Bool)

(assert (=> b!34133 (= e!21667 e!21657)))

(declare-fun res!20686 () Bool)

(assert (=> b!34133 (= res!20686 call!2746)))

(assert (=> b!34133 (=> (not res!20686) (not e!21657))))

(declare-fun b!34134 () Bool)

(assert (=> b!34134 (= e!21663 e!21667)))

(declare-fun c!3944 () Bool)

(assert (=> b!34134 (= c!3944 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!34135 () Bool)

(declare-fun get!579 (ValueCell!575 V!1891) V!1891)

(declare-fun dynLambda!154 (Int (_ BitVec 64)) V!1891)

(assert (=> b!34135 (= e!21661 (= (apply!38 lt!12689 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000)) (get!579 (select (arr!1093 _values!1501) #b00000000000000000000000000000000) (dynLambda!154 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!34135 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1194 _values!1501)))))

(assert (=> b!34135 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1195 _keys!1833)))))

(declare-fun b!34136 () Bool)

(declare-fun Unit!771 () Unit!767)

(assert (=> b!34136 (= e!21664 Unit!771)))

(declare-fun b!34137 () Bool)

(assert (=> b!34137 (= e!21657 (= (apply!38 lt!12689 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun bm!2745 () Bool)

(assert (=> bm!2745 (= call!2750 call!2744)))

(declare-fun b!34138 () Bool)

(assert (=> b!34138 (= e!21667 (not call!2746))))

(declare-fun c!3941 () Bool)

(declare-fun bm!2746 () Bool)

(assert (=> bm!2746 (= call!2744 (+!56 (ite c!3943 call!2745 (ite c!3941 call!2747 call!2749)) (ite (or c!3943 c!3941) (tuple2!1305 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!34139 () Bool)

(assert (=> b!34139 (= e!21662 call!2749)))

(declare-fun b!34140 () Bool)

(declare-fun c!3945 () Bool)

(assert (=> b!34140 (= c!3945 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!34140 (= e!21665 e!21662)))

(declare-fun b!34141 () Bool)

(assert (=> b!34141 (= e!21669 (validKeyInArray!0 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!34142 () Bool)

(assert (=> b!34142 (= e!21658 e!21665)))

(assert (=> b!34142 (= c!3941 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2747 () Bool)

(assert (=> bm!2747 (= call!2748 (contains!396 lt!12689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!5211 c!3943) b!34124))

(assert (= (and d!5211 (not c!3943)) b!34142))

(assert (= (and b!34142 c!3941) b!34129))

(assert (= (and b!34142 (not c!3941)) b!34140))

(assert (= (and b!34140 c!3945) b!34130))

(assert (= (and b!34140 (not c!3945)) b!34139))

(assert (= (or b!34130 b!34139) bm!2744))

(assert (= (or b!34129 bm!2744) bm!2743))

(assert (= (or b!34129 b!34130) bm!2745))

(assert (= (or b!34124 bm!2743) bm!2742))

(assert (= (or b!34124 bm!2745) bm!2746))

(assert (= (and d!5211 res!20692) b!34128))

(assert (= (and d!5211 c!3946) b!34126))

(assert (= (and d!5211 (not c!3946)) b!34136))

(assert (= (and d!5211 res!20691) b!34123))

(assert (= (and b!34123 res!20690) b!34141))

(assert (= (and b!34123 (not res!20693)) b!34122))

(assert (= (and b!34122 res!20688) b!34135))

(assert (= (and b!34123 res!20687) b!34125))

(assert (= (and b!34125 c!3942) b!34131))

(assert (= (and b!34125 (not c!3942)) b!34132))

(assert (= (and b!34131 res!20685) b!34127))

(assert (= (or b!34131 b!34132) bm!2747))

(assert (= (and b!34125 res!20689) b!34134))

(assert (= (and b!34134 c!3944) b!34133))

(assert (= (and b!34134 (not c!3944)) b!34138))

(assert (= (and b!34133 res!20686) b!34137))

(assert (= (or b!34133 b!34138) bm!2741))

(declare-fun b_lambda!1703 () Bool)

(assert (=> (not b_lambda!1703) (not b!34135)))

(declare-fun t!3586 () Bool)

(declare-fun tb!685 () Bool)

(assert (=> (and start!4396 (= defaultEntry!1504 defaultEntry!1504) t!3586) tb!685))

(declare-fun result!1177 () Bool)

(assert (=> tb!685 (= result!1177 tp_is_empty!1549)))

(assert (=> b!34135 t!3586))

(declare-fun b_and!2015 () Bool)

(assert (= b_and!2009 (and (=> t!3586 result!1177) b_and!2015)))

(declare-fun m!27439 () Bool)

(assert (=> bm!2746 m!27439))

(assert (=> b!34122 m!27381))

(assert (=> b!34122 m!27381))

(declare-fun m!27441 () Bool)

(assert (=> b!34122 m!27441))

(declare-fun m!27443 () Bool)

(assert (=> b!34126 m!27443))

(declare-fun m!27445 () Bool)

(assert (=> b!34126 m!27445))

(declare-fun m!27447 () Bool)

(assert (=> b!34126 m!27447))

(declare-fun m!27449 () Bool)

(assert (=> b!34126 m!27449))

(declare-fun m!27451 () Bool)

(assert (=> b!34126 m!27451))

(declare-fun m!27453 () Bool)

(assert (=> b!34126 m!27453))

(declare-fun m!27455 () Bool)

(assert (=> b!34126 m!27455))

(declare-fun m!27457 () Bool)

(assert (=> b!34126 m!27457))

(assert (=> b!34126 m!27457))

(declare-fun m!27459 () Bool)

(assert (=> b!34126 m!27459))

(declare-fun m!27461 () Bool)

(assert (=> b!34126 m!27461))

(declare-fun m!27463 () Bool)

(assert (=> b!34126 m!27463))

(declare-fun m!27465 () Bool)

(assert (=> b!34126 m!27465))

(assert (=> b!34126 m!27447))

(declare-fun m!27467 () Bool)

(assert (=> b!34126 m!27467))

(declare-fun m!27469 () Bool)

(assert (=> b!34126 m!27469))

(assert (=> b!34126 m!27381))

(assert (=> b!34126 m!27453))

(declare-fun m!27471 () Bool)

(assert (=> b!34126 m!27471))

(assert (=> b!34126 m!27463))

(declare-fun m!27473 () Bool)

(assert (=> b!34126 m!27473))

(assert (=> b!34135 m!27381))

(declare-fun m!27475 () Bool)

(assert (=> b!34135 m!27475))

(declare-fun m!27477 () Bool)

(assert (=> b!34135 m!27477))

(declare-fun m!27479 () Bool)

(assert (=> b!34135 m!27479))

(assert (=> b!34135 m!27475))

(assert (=> b!34135 m!27381))

(declare-fun m!27481 () Bool)

(assert (=> b!34135 m!27481))

(assert (=> b!34135 m!27477))

(declare-fun m!27483 () Bool)

(assert (=> b!34137 m!27483))

(declare-fun m!27485 () Bool)

(assert (=> b!34127 m!27485))

(declare-fun m!27487 () Bool)

(assert (=> bm!2747 m!27487))

(assert (=> b!34128 m!27381))

(assert (=> b!34128 m!27381))

(assert (=> b!34128 m!27425))

(declare-fun m!27489 () Bool)

(assert (=> b!34124 m!27489))

(assert (=> b!34141 m!27381))

(assert (=> b!34141 m!27381))

(assert (=> b!34141 m!27425))

(assert (=> d!5211 m!27301))

(assert (=> bm!2742 m!27451))

(declare-fun m!27491 () Bool)

(assert (=> bm!2741 m!27491))

(assert (=> b!33940 d!5211))

(declare-fun b!34145 () Bool)

(declare-fun e!21671 () Bool)

(declare-fun e!21672 () Bool)

(assert (=> b!34145 (= e!21671 e!21672)))

(declare-fun lt!12706 () (_ BitVec 64))

(assert (=> b!34145 (= lt!12706 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12707 () Unit!767)

(assert (=> b!34145 (= lt!12707 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12706 #b00000000000000000000000000000000))))

(assert (=> b!34145 (arrayContainsKey!0 _keys!1833 lt!12706 #b00000000000000000000000000000000)))

(declare-fun lt!12705 () Unit!767)

(assert (=> b!34145 (= lt!12705 lt!12707)))

(declare-fun res!20695 () Bool)

(assert (=> b!34145 (= res!20695 (= (seekEntryOrOpen!0 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!144 #b00000000000000000000000000000000)))))

(assert (=> b!34145 (=> (not res!20695) (not e!21672))))

(declare-fun d!5213 () Bool)

(declare-fun res!20694 () Bool)

(declare-fun e!21670 () Bool)

(assert (=> d!5213 (=> res!20694 e!21670)))

(assert (=> d!5213 (= res!20694 (bvsge #b00000000000000000000000000000000 (size!1195 _keys!1833)))))

(assert (=> d!5213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21670)))

(declare-fun b!34146 () Bool)

(declare-fun call!2751 () Bool)

(assert (=> b!34146 (= e!21671 call!2751)))

(declare-fun b!34147 () Bool)

(assert (=> b!34147 (= e!21670 e!21671)))

(declare-fun c!3947 () Bool)

(assert (=> b!34147 (= c!3947 (validKeyInArray!0 (select (arr!1094 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2748 () Bool)

(assert (=> bm!2748 (= call!2751 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!34148 () Bool)

(assert (=> b!34148 (= e!21672 call!2751)))

(assert (= (and d!5213 (not res!20694)) b!34147))

(assert (= (and b!34147 c!3947) b!34145))

(assert (= (and b!34147 (not c!3947)) b!34146))

(assert (= (and b!34145 res!20695) b!34148))

(assert (= (or b!34148 b!34146) bm!2748))

(assert (=> b!34145 m!27381))

(declare-fun m!27493 () Bool)

(assert (=> b!34145 m!27493))

(declare-fun m!27495 () Bool)

(assert (=> b!34145 m!27495))

(assert (=> b!34145 m!27381))

(declare-fun m!27497 () Bool)

(assert (=> b!34145 m!27497))

(assert (=> b!34147 m!27381))

(assert (=> b!34147 m!27381))

(assert (=> b!34147 m!27425))

(declare-fun m!27499 () Bool)

(assert (=> bm!2748 m!27499))

(assert (=> b!33941 d!5213))

(declare-fun d!5215 () Bool)

(assert (=> d!5215 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33946 d!5215))

(declare-fun mapIsEmpty!1876 () Bool)

(declare-fun mapRes!1876 () Bool)

(assert (=> mapIsEmpty!1876 mapRes!1876))

(declare-fun b!34155 () Bool)

(declare-fun e!21677 () Bool)

(assert (=> b!34155 (= e!21677 tp_is_empty!1549)))

(declare-fun condMapEmpty!1876 () Bool)

(declare-fun mapDefault!1876 () ValueCell!575)

(assert (=> mapNonEmpty!1867 (= condMapEmpty!1876 (= mapRest!1867 ((as const (Array (_ BitVec 32) ValueCell!575)) mapDefault!1876)))))

(declare-fun e!21678 () Bool)

(assert (=> mapNonEmpty!1867 (= tp!5019 (and e!21678 mapRes!1876))))

(declare-fun b!34156 () Bool)

(assert (=> b!34156 (= e!21678 tp_is_empty!1549)))

(declare-fun mapNonEmpty!1876 () Bool)

(declare-fun tp!5035 () Bool)

(assert (=> mapNonEmpty!1876 (= mapRes!1876 (and tp!5035 e!21677))))

(declare-fun mapKey!1876 () (_ BitVec 32))

(declare-fun mapValue!1876 () ValueCell!575)

(declare-fun mapRest!1876 () (Array (_ BitVec 32) ValueCell!575))

(assert (=> mapNonEmpty!1876 (= mapRest!1867 (store mapRest!1876 mapKey!1876 mapValue!1876))))

(assert (= (and mapNonEmpty!1867 condMapEmpty!1876) mapIsEmpty!1876))

(assert (= (and mapNonEmpty!1867 (not condMapEmpty!1876)) mapNonEmpty!1876))

(assert (= (and mapNonEmpty!1876 ((_ is ValueCellFull!575) mapValue!1876)) b!34155))

(assert (= (and mapNonEmpty!1867 ((_ is ValueCellFull!575) mapDefault!1876)) b!34156))

(declare-fun m!27501 () Bool)

(assert (=> mapNonEmpty!1876 m!27501))

(declare-fun b_lambda!1705 () Bool)

(assert (= b_lambda!1703 (or (and start!4396 b_free!1195) b_lambda!1705)))

(check-sat (not b!34124) (not b!34079) (not bm!2748) (not b!34076) tp_is_empty!1549 (not b!34059) (not b!34141) (not b!34061) (not b!34126) (not d!5195) (not b!34077) (not b!34137) (not b!34072) (not b_next!1195) (not d!5191) (not b!34030) (not d!5197) (not b!34052) (not b_lambda!1705) (not b!34127) (not b!34013) (not b!34122) (not b!34034) (not bm!2723) (not b!34073) (not d!5211) (not mapNonEmpty!1876) (not d!5209) (not b!34019) (not bm!2741) (not bm!2742) (not b!34028) b_and!2015 (not b!34145) (not bm!2747) (not b!34147) (not bm!2746) (not bm!2726) (not b!34128) (not d!5199) (not b!34135) (not d!5193))
(check-sat b_and!2015 (not b_next!1195))
