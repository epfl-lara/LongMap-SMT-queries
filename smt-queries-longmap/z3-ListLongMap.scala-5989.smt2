; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77928 () Bool)

(assert start!77928)

(declare-fun b_free!16345 () Bool)

(declare-fun b_next!16345 () Bool)

(assert (=> start!77928 (= b_free!16345 (not b_next!16345))))

(declare-fun tp!57298 () Bool)

(declare-fun b_and!26853 () Bool)

(assert (=> start!77928 (= tp!57298 b_and!26853)))

(declare-fun b!908486 () Bool)

(declare-fun e!509220 () Bool)

(declare-fun e!509221 () Bool)

(assert (=> b!908486 (= e!509220 e!509221)))

(declare-fun res!612904 () Bool)

(assert (=> b!908486 (=> res!612904 e!509221)))

(declare-datatypes ((V!29983 0))(
  ( (V!29984 (val!9432 Int)) )
))
(declare-datatypes ((tuple2!12220 0))(
  ( (tuple2!12221 (_1!6121 (_ BitVec 64)) (_2!6121 V!29983)) )
))
(declare-datatypes ((List!18051 0))(
  ( (Nil!18048) (Cons!18047 (h!19199 tuple2!12220) (t!25560 List!18051)) )
))
(declare-datatypes ((ListLongMap!10919 0))(
  ( (ListLongMap!10920 (toList!5475 List!18051)) )
))
(declare-fun lt!409699 () ListLongMap!10919)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4528 (ListLongMap!10919 (_ BitVec 64)) Bool)

(assert (=> b!908486 (= res!612904 (not (contains!4528 lt!409699 k0!1033)))))

(declare-datatypes ((ValueCell!8900 0))(
  ( (ValueCellFull!8900 (v!11934 V!29983)) (EmptyCell!8900) )
))
(declare-datatypes ((array!53601 0))(
  ( (array!53602 (arr!25755 (Array (_ BitVec 32) ValueCell!8900)) (size!26215 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53601)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29983)

(declare-datatypes ((array!53603 0))(
  ( (array!53604 (arr!25756 (Array (_ BitVec 32) (_ BitVec 64))) (size!26216 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53603)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29983)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun getCurrentListMap!2739 (array!53603 array!53601 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 32) Int) ListLongMap!10919)

(assert (=> b!908486 (= lt!409699 (getCurrentListMap!2739 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908487 () Bool)

(declare-fun res!612908 () Bool)

(assert (=> b!908487 (=> res!612908 e!509221)))

(declare-fun lt!409702 () V!29983)

(declare-fun apply!494 (ListLongMap!10919 (_ BitVec 64)) V!29983)

(assert (=> b!908487 (= res!612908 (not (= (apply!494 lt!409699 k0!1033) lt!409702)))))

(declare-fun b!908488 () Bool)

(declare-fun res!612911 () Bool)

(declare-fun e!509218 () Bool)

(assert (=> b!908488 (=> (not res!612911) (not e!509218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53603 (_ BitVec 32)) Bool)

(assert (=> b!908488 (= res!612911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908489 () Bool)

(declare-fun e!509219 () Bool)

(assert (=> b!908489 (= e!509219 (not e!509220))))

(declare-fun res!612912 () Bool)

(assert (=> b!908489 (=> res!612912 e!509220)))

(assert (=> b!908489 (= res!612912 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26216 _keys!1386))))))

(declare-fun get!13561 (ValueCell!8900 V!29983) V!29983)

(declare-fun dynLambda!1381 (Int (_ BitVec 64)) V!29983)

(assert (=> b!908489 (= lt!409702 (get!13561 (select (arr!25755 _values!1152) i!717) (dynLambda!1381 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908489 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30796 0))(
  ( (Unit!30797) )
))
(declare-fun lt!409698 () Unit!30796)

(declare-fun lemmaKeyInListMapIsInArray!240 (array!53603 array!53601 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 64) Int) Unit!30796)

(assert (=> b!908489 (= lt!409698 (lemmaKeyInListMapIsInArray!240 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908490 () Bool)

(declare-fun e!509217 () Bool)

(declare-fun tp_is_empty!18763 () Bool)

(assert (=> b!908490 (= e!509217 tp_is_empty!18763)))

(declare-fun mapIsEmpty!29857 () Bool)

(declare-fun mapRes!29857 () Bool)

(assert (=> mapIsEmpty!29857 mapRes!29857))

(declare-fun b!908491 () Bool)

(assert (=> b!908491 (= e!509218 e!509219)))

(declare-fun res!612909 () Bool)

(assert (=> b!908491 (=> (not res!612909) (not e!509219))))

(declare-fun lt!409700 () ListLongMap!10919)

(assert (=> b!908491 (= res!612909 (contains!4528 lt!409700 k0!1033))))

(assert (=> b!908491 (= lt!409700 (getCurrentListMap!2739 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapNonEmpty!29857 () Bool)

(declare-fun tp!57297 () Bool)

(assert (=> mapNonEmpty!29857 (= mapRes!29857 (and tp!57297 e!509217))))

(declare-fun mapKey!29857 () (_ BitVec 32))

(declare-fun mapValue!29857 () ValueCell!8900)

(declare-fun mapRest!29857 () (Array (_ BitVec 32) ValueCell!8900))

(assert (=> mapNonEmpty!29857 (= (arr!25755 _values!1152) (store mapRest!29857 mapKey!29857 mapValue!29857))))

(declare-fun b!908493 () Bool)

(declare-fun res!612910 () Bool)

(assert (=> b!908493 (=> (not res!612910) (not e!509218))))

(assert (=> b!908493 (= res!612910 (and (= (size!26215 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26216 _keys!1386) (size!26215 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908494 () Bool)

(declare-fun res!612905 () Bool)

(assert (=> b!908494 (=> (not res!612905) (not e!509219))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908494 (= res!612905 (inRange!0 i!717 mask!1756))))

(declare-fun b!908492 () Bool)

(assert (=> b!908492 (= e!509221 (or (bvsge #b00000000000000000000000000000000 (size!26216 _keys!1386)) (bvslt (size!26216 _keys!1386) #b01111111111111111111111111111111)))))

(assert (=> b!908492 (= (apply!494 lt!409700 k0!1033) lt!409702)))

(declare-fun lt!409701 () Unit!30796)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!43 (array!53603 array!53601 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 64) V!29983 (_ BitVec 32) Int) Unit!30796)

(assert (=> b!908492 (= lt!409701 (lemmaListMapApplyFromThenApplyFromZero!43 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409702 i!717 defaultEntry!1160))))

(declare-fun res!612906 () Bool)

(assert (=> start!77928 (=> (not res!612906) (not e!509218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77928 (= res!612906 (validMask!0 mask!1756))))

(assert (=> start!77928 e!509218))

(declare-fun e!509222 () Bool)

(declare-fun array_inv!20224 (array!53601) Bool)

(assert (=> start!77928 (and (array_inv!20224 _values!1152) e!509222)))

(assert (=> start!77928 tp!57298))

(assert (=> start!77928 true))

(assert (=> start!77928 tp_is_empty!18763))

(declare-fun array_inv!20225 (array!53603) Bool)

(assert (=> start!77928 (array_inv!20225 _keys!1386)))

(declare-fun b!908495 () Bool)

(declare-fun e!509216 () Bool)

(assert (=> b!908495 (= e!509222 (and e!509216 mapRes!29857))))

(declare-fun condMapEmpty!29857 () Bool)

(declare-fun mapDefault!29857 () ValueCell!8900)

(assert (=> b!908495 (= condMapEmpty!29857 (= (arr!25755 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8900)) mapDefault!29857)))))

(declare-fun b!908496 () Bool)

(declare-fun res!612913 () Bool)

(assert (=> b!908496 (=> (not res!612913) (not e!509218))))

(declare-datatypes ((List!18052 0))(
  ( (Nil!18049) (Cons!18048 (h!19200 (_ BitVec 64)) (t!25561 List!18052)) )
))
(declare-fun arrayNoDuplicates!0 (array!53603 (_ BitVec 32) List!18052) Bool)

(assert (=> b!908496 (= res!612913 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18049))))

(declare-fun b!908497 () Bool)

(declare-fun res!612907 () Bool)

(assert (=> b!908497 (=> (not res!612907) (not e!509219))))

(assert (=> b!908497 (= res!612907 (and (= (select (arr!25756 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908498 () Bool)

(assert (=> b!908498 (= e!509216 tp_is_empty!18763)))

(assert (= (and start!77928 res!612906) b!908493))

(assert (= (and b!908493 res!612910) b!908488))

(assert (= (and b!908488 res!612911) b!908496))

(assert (= (and b!908496 res!612913) b!908491))

(assert (= (and b!908491 res!612909) b!908494))

(assert (= (and b!908494 res!612905) b!908497))

(assert (= (and b!908497 res!612907) b!908489))

(assert (= (and b!908489 (not res!612912)) b!908486))

(assert (= (and b!908486 (not res!612904)) b!908487))

(assert (= (and b!908487 (not res!612908)) b!908492))

(assert (= (and b!908495 condMapEmpty!29857) mapIsEmpty!29857))

(assert (= (and b!908495 (not condMapEmpty!29857)) mapNonEmpty!29857))

(get-info :version)

(assert (= (and mapNonEmpty!29857 ((_ is ValueCellFull!8900) mapValue!29857)) b!908490))

(assert (= (and b!908495 ((_ is ValueCellFull!8900) mapDefault!29857)) b!908498))

(assert (= start!77928 b!908495))

(declare-fun b_lambda!13233 () Bool)

(assert (=> (not b_lambda!13233) (not b!908489)))

(declare-fun t!25559 () Bool)

(declare-fun tb!5359 () Bool)

(assert (=> (and start!77928 (= defaultEntry!1160 defaultEntry!1160) t!25559) tb!5359))

(declare-fun result!10521 () Bool)

(assert (=> tb!5359 (= result!10521 tp_is_empty!18763)))

(assert (=> b!908489 t!25559))

(declare-fun b_and!26855 () Bool)

(assert (= b_and!26853 (and (=> t!25559 result!10521) b_and!26855)))

(declare-fun m!844229 () Bool)

(assert (=> b!908488 m!844229))

(declare-fun m!844231 () Bool)

(assert (=> mapNonEmpty!29857 m!844231))

(declare-fun m!844233 () Bool)

(assert (=> b!908494 m!844233))

(declare-fun m!844235 () Bool)

(assert (=> b!908491 m!844235))

(declare-fun m!844237 () Bool)

(assert (=> b!908491 m!844237))

(declare-fun m!844239 () Bool)

(assert (=> b!908496 m!844239))

(declare-fun m!844241 () Bool)

(assert (=> start!77928 m!844241))

(declare-fun m!844243 () Bool)

(assert (=> start!77928 m!844243))

(declare-fun m!844245 () Bool)

(assert (=> start!77928 m!844245))

(declare-fun m!844247 () Bool)

(assert (=> b!908487 m!844247))

(declare-fun m!844249 () Bool)

(assert (=> b!908492 m!844249))

(declare-fun m!844251 () Bool)

(assert (=> b!908492 m!844251))

(declare-fun m!844253 () Bool)

(assert (=> b!908486 m!844253))

(declare-fun m!844255 () Bool)

(assert (=> b!908486 m!844255))

(declare-fun m!844257 () Bool)

(assert (=> b!908497 m!844257))

(declare-fun m!844259 () Bool)

(assert (=> b!908489 m!844259))

(declare-fun m!844261 () Bool)

(assert (=> b!908489 m!844261))

(declare-fun m!844263 () Bool)

(assert (=> b!908489 m!844263))

(declare-fun m!844265 () Bool)

(assert (=> b!908489 m!844265))

(assert (=> b!908489 m!844259))

(assert (=> b!908489 m!844263))

(declare-fun m!844267 () Bool)

(assert (=> b!908489 m!844267))

(check-sat (not b!908494) (not b_lambda!13233) tp_is_empty!18763 (not b!908489) (not b!908492) (not b_next!16345) (not start!77928) (not b!908486) (not b!908487) b_and!26855 (not mapNonEmpty!29857) (not b!908496) (not b!908488) (not b!908491))
(check-sat b_and!26855 (not b_next!16345))
(get-model)

(declare-fun b_lambda!13239 () Bool)

(assert (= b_lambda!13233 (or (and start!77928 b_free!16345) b_lambda!13239)))

(check-sat (not b!908494) tp_is_empty!18763 (not b!908489) (not b!908492) (not b_next!16345) (not b_lambda!13239) (not start!77928) (not b!908486) (not b!908487) b_and!26855 (not mapNonEmpty!29857) (not b!908496) (not b!908488) (not b!908491))
(check-sat b_and!26855 (not b_next!16345))
(get-model)

(declare-fun d!112411 () Bool)

(declare-fun c!95933 () Bool)

(assert (=> d!112411 (= c!95933 ((_ is ValueCellFull!8900) (select (arr!25755 _values!1152) i!717)))))

(declare-fun e!509274 () V!29983)

(assert (=> d!112411 (= (get!13561 (select (arr!25755 _values!1152) i!717) (dynLambda!1381 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!509274)))

(declare-fun b!908587 () Bool)

(declare-fun get!13563 (ValueCell!8900 V!29983) V!29983)

(assert (=> b!908587 (= e!509274 (get!13563 (select (arr!25755 _values!1152) i!717) (dynLambda!1381 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!908588 () Bool)

(declare-fun get!13564 (ValueCell!8900 V!29983) V!29983)

(assert (=> b!908588 (= e!509274 (get!13564 (select (arr!25755 _values!1152) i!717) (dynLambda!1381 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112411 c!95933) b!908587))

(assert (= (and d!112411 (not c!95933)) b!908588))

(assert (=> b!908587 m!844259))

(assert (=> b!908587 m!844263))

(declare-fun m!844349 () Bool)

(assert (=> b!908587 m!844349))

(assert (=> b!908588 m!844259))

(assert (=> b!908588 m!844263))

(declare-fun m!844351 () Bool)

(assert (=> b!908588 m!844351))

(assert (=> b!908489 d!112411))

(declare-fun d!112413 () Bool)

(declare-fun res!612978 () Bool)

(declare-fun e!509279 () Bool)

(assert (=> d!112413 (=> res!612978 e!509279)))

(assert (=> d!112413 (= res!612978 (= (select (arr!25756 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112413 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!509279)))

(declare-fun b!908593 () Bool)

(declare-fun e!509280 () Bool)

(assert (=> b!908593 (= e!509279 e!509280)))

(declare-fun res!612979 () Bool)

(assert (=> b!908593 (=> (not res!612979) (not e!509280))))

(assert (=> b!908593 (= res!612979 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26216 _keys!1386)))))

(declare-fun b!908594 () Bool)

(assert (=> b!908594 (= e!509280 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112413 (not res!612978)) b!908593))

(assert (= (and b!908593 res!612979) b!908594))

(declare-fun m!844353 () Bool)

(assert (=> d!112413 m!844353))

(declare-fun m!844355 () Bool)

(assert (=> b!908594 m!844355))

(assert (=> b!908489 d!112413))

(declare-fun d!112415 () Bool)

(declare-fun e!509283 () Bool)

(assert (=> d!112415 e!509283))

(declare-fun c!95936 () Bool)

(assert (=> d!112415 (= c!95936 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!409735 () Unit!30796)

(declare-fun choose!1533 (array!53603 array!53601 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 64) Int) Unit!30796)

(assert (=> d!112415 (= lt!409735 (choose!1533 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112415 (validMask!0 mask!1756)))

(assert (=> d!112415 (= (lemmaKeyInListMapIsInArray!240 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!409735)))

(declare-fun b!908599 () Bool)

(assert (=> b!908599 (= e!509283 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!908600 () Bool)

(assert (=> b!908600 (= e!509283 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112415 c!95936) b!908599))

(assert (= (and d!112415 (not c!95936)) b!908600))

(declare-fun m!844357 () Bool)

(assert (=> d!112415 m!844357))

(assert (=> d!112415 m!844241))

(assert (=> b!908599 m!844265))

(assert (=> b!908489 d!112415))

(declare-fun d!112417 () Bool)

(declare-datatypes ((Option!473 0))(
  ( (Some!472 (v!11938 V!29983)) (None!471) )
))
(declare-fun get!13565 (Option!473) V!29983)

(declare-fun getValueByKey!467 (List!18051 (_ BitVec 64)) Option!473)

(assert (=> d!112417 (= (apply!494 lt!409700 k0!1033) (get!13565 (getValueByKey!467 (toList!5475 lt!409700) k0!1033)))))

(declare-fun bs!25504 () Bool)

(assert (= bs!25504 d!112417))

(declare-fun m!844359 () Bool)

(assert (=> bs!25504 m!844359))

(assert (=> bs!25504 m!844359))

(declare-fun m!844361 () Bool)

(assert (=> bs!25504 m!844361))

(assert (=> b!908492 d!112417))

(declare-fun d!112419 () Bool)

(declare-fun e!509286 () Bool)

(assert (=> d!112419 e!509286))

(declare-fun res!612982 () Bool)

(assert (=> d!112419 (=> (not res!612982) (not e!509286))))

(assert (=> d!112419 (= res!612982 (contains!4528 (getCurrentListMap!2739 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun lt!409738 () Unit!30796)

(declare-fun choose!1534 (array!53603 array!53601 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 64) V!29983 (_ BitVec 32) Int) Unit!30796)

(assert (=> d!112419 (= lt!409738 (choose!1534 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409702 i!717 defaultEntry!1160))))

(assert (=> d!112419 (validMask!0 mask!1756)))

(assert (=> d!112419 (= (lemmaListMapApplyFromThenApplyFromZero!43 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409702 i!717 defaultEntry!1160) lt!409738)))

(declare-fun b!908603 () Bool)

(assert (=> b!908603 (= e!509286 (= (apply!494 (getCurrentListMap!2739 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!409702))))

(assert (= (and d!112419 res!612982) b!908603))

(assert (=> d!112419 m!844237))

(assert (=> d!112419 m!844237))

(declare-fun m!844363 () Bool)

(assert (=> d!112419 m!844363))

(declare-fun m!844365 () Bool)

(assert (=> d!112419 m!844365))

(assert (=> d!112419 m!844241))

(assert (=> b!908603 m!844237))

(assert (=> b!908603 m!844237))

(declare-fun m!844367 () Bool)

(assert (=> b!908603 m!844367))

(assert (=> b!908492 d!112419))

(declare-fun b!908612 () Bool)

(declare-fun e!509294 () Bool)

(declare-fun e!509295 () Bool)

(assert (=> b!908612 (= e!509294 e!509295)))

(declare-fun lt!409746 () (_ BitVec 64))

(assert (=> b!908612 (= lt!409746 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409747 () Unit!30796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53603 (_ BitVec 64) (_ BitVec 32)) Unit!30796)

(assert (=> b!908612 (= lt!409747 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!409746 #b00000000000000000000000000000000))))

(assert (=> b!908612 (arrayContainsKey!0 _keys!1386 lt!409746 #b00000000000000000000000000000000)))

(declare-fun lt!409745 () Unit!30796)

(assert (=> b!908612 (= lt!409745 lt!409747)))

(declare-fun res!612988 () Bool)

(declare-datatypes ((SeekEntryResult!8917 0))(
  ( (MissingZero!8917 (index!38039 (_ BitVec 32))) (Found!8917 (index!38040 (_ BitVec 32))) (Intermediate!8917 (undefined!9729 Bool) (index!38041 (_ BitVec 32)) (x!77468 (_ BitVec 32))) (Undefined!8917) (MissingVacant!8917 (index!38042 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53603 (_ BitVec 32)) SeekEntryResult!8917)

(assert (=> b!908612 (= res!612988 (= (seekEntryOrOpen!0 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8917 #b00000000000000000000000000000000)))))

(assert (=> b!908612 (=> (not res!612988) (not e!509295))))

(declare-fun b!908613 () Bool)

(declare-fun call!40300 () Bool)

(assert (=> b!908613 (= e!509294 call!40300)))

(declare-fun b!908614 () Bool)

(assert (=> b!908614 (= e!509295 call!40300)))

(declare-fun bm!40297 () Bool)

(assert (=> bm!40297 (= call!40300 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun d!112421 () Bool)

(declare-fun res!612987 () Bool)

(declare-fun e!509293 () Bool)

(assert (=> d!112421 (=> res!612987 e!509293)))

(assert (=> d!112421 (= res!612987 (bvsge #b00000000000000000000000000000000 (size!26216 _keys!1386)))))

(assert (=> d!112421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!509293)))

(declare-fun b!908615 () Bool)

(assert (=> b!908615 (= e!509293 e!509294)))

(declare-fun c!95939 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!908615 (= c!95939 (validKeyInArray!0 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112421 (not res!612987)) b!908615))

(assert (= (and b!908615 c!95939) b!908612))

(assert (= (and b!908615 (not c!95939)) b!908613))

(assert (= (and b!908612 res!612988) b!908614))

(assert (= (or b!908614 b!908613) bm!40297))

(assert (=> b!908612 m!844353))

(declare-fun m!844369 () Bool)

(assert (=> b!908612 m!844369))

(declare-fun m!844371 () Bool)

(assert (=> b!908612 m!844371))

(assert (=> b!908612 m!844353))

(declare-fun m!844373 () Bool)

(assert (=> b!908612 m!844373))

(declare-fun m!844375 () Bool)

(assert (=> bm!40297 m!844375))

(assert (=> b!908615 m!844353))

(assert (=> b!908615 m!844353))

(declare-fun m!844377 () Bool)

(assert (=> b!908615 m!844377))

(assert (=> b!908488 d!112421))

(declare-fun d!112423 () Bool)

(assert (=> d!112423 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77928 d!112423))

(declare-fun d!112425 () Bool)

(assert (=> d!112425 (= (array_inv!20224 _values!1152) (bvsge (size!26215 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77928 d!112425))

(declare-fun d!112427 () Bool)

(assert (=> d!112427 (= (array_inv!20225 _keys!1386) (bvsge (size!26216 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77928 d!112427))

(declare-fun d!112429 () Bool)

(declare-fun e!509301 () Bool)

(assert (=> d!112429 e!509301))

(declare-fun res!612991 () Bool)

(assert (=> d!112429 (=> res!612991 e!509301)))

(declare-fun lt!409758 () Bool)

(assert (=> d!112429 (= res!612991 (not lt!409758))))

(declare-fun lt!409757 () Bool)

(assert (=> d!112429 (= lt!409758 lt!409757)))

(declare-fun lt!409759 () Unit!30796)

(declare-fun e!509300 () Unit!30796)

(assert (=> d!112429 (= lt!409759 e!509300)))

(declare-fun c!95942 () Bool)

(assert (=> d!112429 (= c!95942 lt!409757)))

(declare-fun containsKey!438 (List!18051 (_ BitVec 64)) Bool)

(assert (=> d!112429 (= lt!409757 (containsKey!438 (toList!5475 lt!409699) k0!1033))))

(assert (=> d!112429 (= (contains!4528 lt!409699 k0!1033) lt!409758)))

(declare-fun b!908622 () Bool)

(declare-fun lt!409756 () Unit!30796)

(assert (=> b!908622 (= e!509300 lt!409756)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!332 (List!18051 (_ BitVec 64)) Unit!30796)

(assert (=> b!908622 (= lt!409756 (lemmaContainsKeyImpliesGetValueByKeyDefined!332 (toList!5475 lt!409699) k0!1033))))

(declare-fun isDefined!340 (Option!473) Bool)

(assert (=> b!908622 (isDefined!340 (getValueByKey!467 (toList!5475 lt!409699) k0!1033))))

(declare-fun b!908623 () Bool)

(declare-fun Unit!30800 () Unit!30796)

(assert (=> b!908623 (= e!509300 Unit!30800)))

(declare-fun b!908624 () Bool)

(assert (=> b!908624 (= e!509301 (isDefined!340 (getValueByKey!467 (toList!5475 lt!409699) k0!1033)))))

(assert (= (and d!112429 c!95942) b!908622))

(assert (= (and d!112429 (not c!95942)) b!908623))

(assert (= (and d!112429 (not res!612991)) b!908624))

(declare-fun m!844379 () Bool)

(assert (=> d!112429 m!844379))

(declare-fun m!844381 () Bool)

(assert (=> b!908622 m!844381))

(declare-fun m!844383 () Bool)

(assert (=> b!908622 m!844383))

(assert (=> b!908622 m!844383))

(declare-fun m!844385 () Bool)

(assert (=> b!908622 m!844385))

(assert (=> b!908624 m!844383))

(assert (=> b!908624 m!844383))

(assert (=> b!908624 m!844385))

(assert (=> b!908486 d!112429))

(declare-fun b!908667 () Bool)

(declare-fun e!509331 () ListLongMap!10919)

(declare-fun call!40320 () ListLongMap!10919)

(assert (=> b!908667 (= e!509331 call!40320)))

(declare-fun b!908668 () Bool)

(declare-fun e!509337 () Bool)

(declare-fun e!509336 () Bool)

(assert (=> b!908668 (= e!509337 e!509336)))

(declare-fun c!95956 () Bool)

(assert (=> b!908668 (= c!95956 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!908670 () Bool)

(declare-fun e!509338 () Bool)

(declare-fun call!40321 () Bool)

(assert (=> b!908670 (= e!509338 (not call!40321))))

(declare-fun c!95960 () Bool)

(declare-fun call!40317 () ListLongMap!10919)

(declare-fun call!40319 () ListLongMap!10919)

(declare-fun c!95959 () Bool)

(declare-fun call!40315 () ListLongMap!10919)

(declare-fun bm!40312 () Bool)

(declare-fun call!40318 () ListLongMap!10919)

(declare-fun +!2612 (ListLongMap!10919 tuple2!12220) ListLongMap!10919)

(assert (=> bm!40312 (= call!40318 (+!2612 (ite c!95960 call!40319 (ite c!95959 call!40315 call!40317)) (ite (or c!95960 c!95959) (tuple2!12221 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12221 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun bm!40313 () Bool)

(assert (=> bm!40313 (= call!40317 call!40315)))

(declare-fun bm!40314 () Bool)

(declare-fun call!40316 () Bool)

(declare-fun lt!409823 () ListLongMap!10919)

(assert (=> bm!40314 (= call!40316 (contains!4528 lt!409823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40315 () Bool)

(assert (=> bm!40315 (= call!40315 call!40319)))

(declare-fun bm!40316 () Bool)

(assert (=> bm!40316 (= call!40321 (contains!4528 lt!409823 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!908671 () Bool)

(declare-fun res!613015 () Bool)

(assert (=> b!908671 (=> (not res!613015) (not e!509337))))

(assert (=> b!908671 (= res!613015 e!509338)))

(declare-fun c!95955 () Bool)

(assert (=> b!908671 (= c!95955 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40317 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3333 (array!53603 array!53601 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 32) Int) ListLongMap!10919)

(assert (=> bm!40317 (= call!40319 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908672 () Bool)

(declare-fun e!509329 () Bool)

(assert (=> b!908672 (= e!509329 (= (apply!494 lt!409823 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!908673 () Bool)

(declare-fun e!509333 () ListLongMap!10919)

(declare-fun e!509332 () ListLongMap!10919)

(assert (=> b!908673 (= e!509333 e!509332)))

(assert (=> b!908673 (= c!95959 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!908674 () Bool)

(declare-fun e!509328 () Bool)

(assert (=> b!908674 (= e!509328 (= (apply!494 lt!409823 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun e!509339 () Bool)

(declare-fun b!908675 () Bool)

(assert (=> b!908675 (= e!509339 (= (apply!494 lt!409823 (select (arr!25756 _keys!1386) i!717)) (get!13561 (select (arr!25755 _values!1152) i!717) (dynLambda!1381 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!908675 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26215 _values!1152)))))

(assert (=> b!908675 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26216 _keys!1386)))))

(declare-fun b!908676 () Bool)

(assert (=> b!908676 (= e!509336 (not call!40316))))

(declare-fun d!112431 () Bool)

(assert (=> d!112431 e!509337))

(declare-fun res!613014 () Bool)

(assert (=> d!112431 (=> (not res!613014) (not e!509337))))

(assert (=> d!112431 (= res!613014 (or (bvsge i!717 (size!26216 _keys!1386)) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26216 _keys!1386)))))))

(declare-fun lt!409814 () ListLongMap!10919)

(assert (=> d!112431 (= lt!409823 lt!409814)))

(declare-fun lt!409808 () Unit!30796)

(declare-fun e!509330 () Unit!30796)

(assert (=> d!112431 (= lt!409808 e!509330)))

(declare-fun c!95957 () Bool)

(declare-fun e!509340 () Bool)

(assert (=> d!112431 (= c!95957 e!509340)))

(declare-fun res!613012 () Bool)

(assert (=> d!112431 (=> (not res!613012) (not e!509340))))

(assert (=> d!112431 (= res!613012 (bvslt i!717 (size!26216 _keys!1386)))))

(assert (=> d!112431 (= lt!409814 e!509333)))

(assert (=> d!112431 (= c!95960 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112431 (validMask!0 mask!1756)))

(assert (=> d!112431 (= (getCurrentListMap!2739 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!409823)))

(declare-fun b!908669 () Bool)

(assert (=> b!908669 (= e!509336 e!509329)))

(declare-fun res!613016 () Bool)

(assert (=> b!908669 (= res!613016 call!40316)))

(assert (=> b!908669 (=> (not res!613016) (not e!509329))))

(declare-fun bm!40318 () Bool)

(assert (=> bm!40318 (= call!40320 call!40318)))

(declare-fun b!908677 () Bool)

(declare-fun c!95958 () Bool)

(assert (=> b!908677 (= c!95958 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!908677 (= e!509332 e!509331)))

(declare-fun b!908678 () Bool)

(declare-fun lt!409817 () Unit!30796)

(assert (=> b!908678 (= e!509330 lt!409817)))

(declare-fun lt!409813 () ListLongMap!10919)

(assert (=> b!908678 (= lt!409813 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409825 () (_ BitVec 64))

(assert (=> b!908678 (= lt!409825 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409820 () (_ BitVec 64))

(assert (=> b!908678 (= lt!409820 (select (arr!25756 _keys!1386) i!717))))

(declare-fun lt!409822 () Unit!30796)

(declare-fun addStillContains!343 (ListLongMap!10919 (_ BitVec 64) V!29983 (_ BitVec 64)) Unit!30796)

(assert (=> b!908678 (= lt!409822 (addStillContains!343 lt!409813 lt!409825 zeroValue!1094 lt!409820))))

(assert (=> b!908678 (contains!4528 (+!2612 lt!409813 (tuple2!12221 lt!409825 zeroValue!1094)) lt!409820)))

(declare-fun lt!409819 () Unit!30796)

(assert (=> b!908678 (= lt!409819 lt!409822)))

(declare-fun lt!409804 () ListLongMap!10919)

(assert (=> b!908678 (= lt!409804 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409824 () (_ BitVec 64))

(assert (=> b!908678 (= lt!409824 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409807 () (_ BitVec 64))

(assert (=> b!908678 (= lt!409807 (select (arr!25756 _keys!1386) i!717))))

(declare-fun lt!409806 () Unit!30796)

(declare-fun addApplyDifferent!343 (ListLongMap!10919 (_ BitVec 64) V!29983 (_ BitVec 64)) Unit!30796)

(assert (=> b!908678 (= lt!409806 (addApplyDifferent!343 lt!409804 lt!409824 minValue!1094 lt!409807))))

(assert (=> b!908678 (= (apply!494 (+!2612 lt!409804 (tuple2!12221 lt!409824 minValue!1094)) lt!409807) (apply!494 lt!409804 lt!409807))))

(declare-fun lt!409810 () Unit!30796)

(assert (=> b!908678 (= lt!409810 lt!409806)))

(declare-fun lt!409812 () ListLongMap!10919)

(assert (=> b!908678 (= lt!409812 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409816 () (_ BitVec 64))

(assert (=> b!908678 (= lt!409816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409818 () (_ BitVec 64))

(assert (=> b!908678 (= lt!409818 (select (arr!25756 _keys!1386) i!717))))

(declare-fun lt!409809 () Unit!30796)

(assert (=> b!908678 (= lt!409809 (addApplyDifferent!343 lt!409812 lt!409816 zeroValue!1094 lt!409818))))

(assert (=> b!908678 (= (apply!494 (+!2612 lt!409812 (tuple2!12221 lt!409816 zeroValue!1094)) lt!409818) (apply!494 lt!409812 lt!409818))))

(declare-fun lt!409811 () Unit!30796)

(assert (=> b!908678 (= lt!409811 lt!409809)))

(declare-fun lt!409821 () ListLongMap!10919)

(assert (=> b!908678 (= lt!409821 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409805 () (_ BitVec 64))

(assert (=> b!908678 (= lt!409805 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409815 () (_ BitVec 64))

(assert (=> b!908678 (= lt!409815 (select (arr!25756 _keys!1386) i!717))))

(assert (=> b!908678 (= lt!409817 (addApplyDifferent!343 lt!409821 lt!409805 minValue!1094 lt!409815))))

(assert (=> b!908678 (= (apply!494 (+!2612 lt!409821 (tuple2!12221 lt!409805 minValue!1094)) lt!409815) (apply!494 lt!409821 lt!409815))))

(declare-fun b!908679 () Bool)

(assert (=> b!908679 (= e!509338 e!509328)))

(declare-fun res!613010 () Bool)

(assert (=> b!908679 (= res!613010 call!40321)))

(assert (=> b!908679 (=> (not res!613010) (not e!509328))))

(declare-fun b!908680 () Bool)

(declare-fun e!509335 () Bool)

(assert (=> b!908680 (= e!509335 (validKeyInArray!0 (select (arr!25756 _keys!1386) i!717)))))

(declare-fun b!908681 () Bool)

(assert (=> b!908681 (= e!509332 call!40320)))

(declare-fun b!908682 () Bool)

(assert (=> b!908682 (= e!509331 call!40317)))

(declare-fun b!908683 () Bool)

(assert (=> b!908683 (= e!509333 (+!2612 call!40318 (tuple2!12221 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!908684 () Bool)

(declare-fun e!509334 () Bool)

(assert (=> b!908684 (= e!509334 e!509339)))

(declare-fun res!613018 () Bool)

(assert (=> b!908684 (=> (not res!613018) (not e!509339))))

(assert (=> b!908684 (= res!613018 (contains!4528 lt!409823 (select (arr!25756 _keys!1386) i!717)))))

(assert (=> b!908684 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26216 _keys!1386)))))

(declare-fun b!908685 () Bool)

(assert (=> b!908685 (= e!509340 (validKeyInArray!0 (select (arr!25756 _keys!1386) i!717)))))

(declare-fun b!908686 () Bool)

(declare-fun Unit!30801 () Unit!30796)

(assert (=> b!908686 (= e!509330 Unit!30801)))

(declare-fun b!908687 () Bool)

(declare-fun res!613013 () Bool)

(assert (=> b!908687 (=> (not res!613013) (not e!509337))))

(assert (=> b!908687 (= res!613013 e!509334)))

(declare-fun res!613011 () Bool)

(assert (=> b!908687 (=> res!613011 e!509334)))

(assert (=> b!908687 (= res!613011 (not e!509335))))

(declare-fun res!613017 () Bool)

(assert (=> b!908687 (=> (not res!613017) (not e!509335))))

(assert (=> b!908687 (= res!613017 (bvslt i!717 (size!26216 _keys!1386)))))

(assert (= (and d!112431 c!95960) b!908683))

(assert (= (and d!112431 (not c!95960)) b!908673))

(assert (= (and b!908673 c!95959) b!908681))

(assert (= (and b!908673 (not c!95959)) b!908677))

(assert (= (and b!908677 c!95958) b!908667))

(assert (= (and b!908677 (not c!95958)) b!908682))

(assert (= (or b!908667 b!908682) bm!40313))

(assert (= (or b!908681 bm!40313) bm!40315))

(assert (= (or b!908681 b!908667) bm!40318))

(assert (= (or b!908683 bm!40315) bm!40317))

(assert (= (or b!908683 bm!40318) bm!40312))

(assert (= (and d!112431 res!613012) b!908685))

(assert (= (and d!112431 c!95957) b!908678))

(assert (= (and d!112431 (not c!95957)) b!908686))

(assert (= (and d!112431 res!613014) b!908687))

(assert (= (and b!908687 res!613017) b!908680))

(assert (= (and b!908687 (not res!613011)) b!908684))

(assert (= (and b!908684 res!613018) b!908675))

(assert (= (and b!908687 res!613013) b!908671))

(assert (= (and b!908671 c!95955) b!908679))

(assert (= (and b!908671 (not c!95955)) b!908670))

(assert (= (and b!908679 res!613010) b!908674))

(assert (= (or b!908679 b!908670) bm!40316))

(assert (= (and b!908671 res!613015) b!908668))

(assert (= (and b!908668 c!95956) b!908669))

(assert (= (and b!908668 (not c!95956)) b!908676))

(assert (= (and b!908669 res!613016) b!908672))

(assert (= (or b!908669 b!908676) bm!40314))

(declare-fun b_lambda!13241 () Bool)

(assert (=> (not b_lambda!13241) (not b!908675)))

(assert (=> b!908675 t!25559))

(declare-fun b_and!26865 () Bool)

(assert (= b_and!26855 (and (=> t!25559 result!10521) b_and!26865)))

(declare-fun m!844387 () Bool)

(assert (=> bm!40314 m!844387))

(declare-fun m!844389 () Bool)

(assert (=> bm!40316 m!844389))

(declare-fun m!844391 () Bool)

(assert (=> bm!40312 m!844391))

(assert (=> b!908684 m!844257))

(assert (=> b!908684 m!844257))

(declare-fun m!844393 () Bool)

(assert (=> b!908684 m!844393))

(assert (=> b!908675 m!844259))

(assert (=> b!908675 m!844263))

(assert (=> b!908675 m!844267))

(assert (=> b!908675 m!844259))

(assert (=> b!908675 m!844263))

(assert (=> b!908675 m!844257))

(declare-fun m!844395 () Bool)

(assert (=> b!908675 m!844395))

(assert (=> b!908675 m!844257))

(declare-fun m!844397 () Bool)

(assert (=> bm!40317 m!844397))

(assert (=> b!908680 m!844257))

(assert (=> b!908680 m!844257))

(declare-fun m!844399 () Bool)

(assert (=> b!908680 m!844399))

(declare-fun m!844401 () Bool)

(assert (=> b!908672 m!844401))

(declare-fun m!844403 () Bool)

(assert (=> b!908678 m!844403))

(declare-fun m!844405 () Bool)

(assert (=> b!908678 m!844405))

(declare-fun m!844407 () Bool)

(assert (=> b!908678 m!844407))

(declare-fun m!844409 () Bool)

(assert (=> b!908678 m!844409))

(declare-fun m!844411 () Bool)

(assert (=> b!908678 m!844411))

(declare-fun m!844413 () Bool)

(assert (=> b!908678 m!844413))

(declare-fun m!844415 () Bool)

(assert (=> b!908678 m!844415))

(declare-fun m!844417 () Bool)

(assert (=> b!908678 m!844417))

(declare-fun m!844419 () Bool)

(assert (=> b!908678 m!844419))

(declare-fun m!844421 () Bool)

(assert (=> b!908678 m!844421))

(declare-fun m!844423 () Bool)

(assert (=> b!908678 m!844423))

(assert (=> b!908678 m!844413))

(declare-fun m!844425 () Bool)

(assert (=> b!908678 m!844425))

(assert (=> b!908678 m!844257))

(assert (=> b!908678 m!844405))

(declare-fun m!844427 () Bool)

(assert (=> b!908678 m!844427))

(assert (=> b!908678 m!844397))

(declare-fun m!844429 () Bool)

(assert (=> b!908678 m!844429))

(assert (=> b!908678 m!844409))

(declare-fun m!844431 () Bool)

(assert (=> b!908678 m!844431))

(assert (=> b!908678 m!844417))

(declare-fun m!844433 () Bool)

(assert (=> b!908674 m!844433))

(assert (=> b!908685 m!844257))

(assert (=> b!908685 m!844257))

(assert (=> b!908685 m!844399))

(declare-fun m!844435 () Bool)

(assert (=> b!908683 m!844435))

(assert (=> d!112431 m!844241))

(assert (=> b!908486 d!112431))

(declare-fun d!112433 () Bool)

(assert (=> d!112433 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!908494 d!112433))

(declare-fun b!908698 () Bool)

(declare-fun e!509352 () Bool)

(declare-fun call!40324 () Bool)

(assert (=> b!908698 (= e!509352 call!40324)))

(declare-fun bm!40321 () Bool)

(declare-fun c!95963 () Bool)

(assert (=> bm!40321 (= call!40324 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95963 (Cons!18048 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000) Nil!18049) Nil!18049)))))

(declare-fun d!112435 () Bool)

(declare-fun res!613027 () Bool)

(declare-fun e!509349 () Bool)

(assert (=> d!112435 (=> res!613027 e!509349)))

(assert (=> d!112435 (= res!613027 (bvsge #b00000000000000000000000000000000 (size!26216 _keys!1386)))))

(assert (=> d!112435 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18049) e!509349)))

(declare-fun b!908699 () Bool)

(declare-fun e!509351 () Bool)

(assert (=> b!908699 (= e!509349 e!509351)))

(declare-fun res!613025 () Bool)

(assert (=> b!908699 (=> (not res!613025) (not e!509351))))

(declare-fun e!509350 () Bool)

(assert (=> b!908699 (= res!613025 (not e!509350))))

(declare-fun res!613026 () Bool)

(assert (=> b!908699 (=> (not res!613026) (not e!509350))))

(assert (=> b!908699 (= res!613026 (validKeyInArray!0 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!908700 () Bool)

(assert (=> b!908700 (= e!509352 call!40324)))

(declare-fun b!908701 () Bool)

(assert (=> b!908701 (= e!509351 e!509352)))

(assert (=> b!908701 (= c!95963 (validKeyInArray!0 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!908702 () Bool)

(declare-fun contains!4531 (List!18052 (_ BitVec 64)) Bool)

(assert (=> b!908702 (= e!509350 (contains!4531 Nil!18049 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112435 (not res!613027)) b!908699))

(assert (= (and b!908699 res!613026) b!908702))

(assert (= (and b!908699 res!613025) b!908701))

(assert (= (and b!908701 c!95963) b!908698))

(assert (= (and b!908701 (not c!95963)) b!908700))

(assert (= (or b!908698 b!908700) bm!40321))

(assert (=> bm!40321 m!844353))

(declare-fun m!844437 () Bool)

(assert (=> bm!40321 m!844437))

(assert (=> b!908699 m!844353))

(assert (=> b!908699 m!844353))

(assert (=> b!908699 m!844377))

(assert (=> b!908701 m!844353))

(assert (=> b!908701 m!844353))

(assert (=> b!908701 m!844377))

(assert (=> b!908702 m!844353))

(assert (=> b!908702 m!844353))

(declare-fun m!844439 () Bool)

(assert (=> b!908702 m!844439))

(assert (=> b!908496 d!112435))

(declare-fun d!112437 () Bool)

(assert (=> d!112437 (= (apply!494 lt!409699 k0!1033) (get!13565 (getValueByKey!467 (toList!5475 lt!409699) k0!1033)))))

(declare-fun bs!25505 () Bool)

(assert (= bs!25505 d!112437))

(assert (=> bs!25505 m!844383))

(assert (=> bs!25505 m!844383))

(declare-fun m!844441 () Bool)

(assert (=> bs!25505 m!844441))

(assert (=> b!908487 d!112437))

(declare-fun d!112439 () Bool)

(declare-fun e!509354 () Bool)

(assert (=> d!112439 e!509354))

(declare-fun res!613028 () Bool)

(assert (=> d!112439 (=> res!613028 e!509354)))

(declare-fun lt!409828 () Bool)

(assert (=> d!112439 (= res!613028 (not lt!409828))))

(declare-fun lt!409827 () Bool)

(assert (=> d!112439 (= lt!409828 lt!409827)))

(declare-fun lt!409829 () Unit!30796)

(declare-fun e!509353 () Unit!30796)

(assert (=> d!112439 (= lt!409829 e!509353)))

(declare-fun c!95964 () Bool)

(assert (=> d!112439 (= c!95964 lt!409827)))

(assert (=> d!112439 (= lt!409827 (containsKey!438 (toList!5475 lt!409700) k0!1033))))

(assert (=> d!112439 (= (contains!4528 lt!409700 k0!1033) lt!409828)))

(declare-fun b!908703 () Bool)

(declare-fun lt!409826 () Unit!30796)

(assert (=> b!908703 (= e!509353 lt!409826)))

(assert (=> b!908703 (= lt!409826 (lemmaContainsKeyImpliesGetValueByKeyDefined!332 (toList!5475 lt!409700) k0!1033))))

(assert (=> b!908703 (isDefined!340 (getValueByKey!467 (toList!5475 lt!409700) k0!1033))))

(declare-fun b!908704 () Bool)

(declare-fun Unit!30802 () Unit!30796)

(assert (=> b!908704 (= e!509353 Unit!30802)))

(declare-fun b!908705 () Bool)

(assert (=> b!908705 (= e!509354 (isDefined!340 (getValueByKey!467 (toList!5475 lt!409700) k0!1033)))))

(assert (= (and d!112439 c!95964) b!908703))

(assert (= (and d!112439 (not c!95964)) b!908704))

(assert (= (and d!112439 (not res!613028)) b!908705))

(declare-fun m!844443 () Bool)

(assert (=> d!112439 m!844443))

(declare-fun m!844445 () Bool)

(assert (=> b!908703 m!844445))

(assert (=> b!908703 m!844359))

(assert (=> b!908703 m!844359))

(declare-fun m!844447 () Bool)

(assert (=> b!908703 m!844447))

(assert (=> b!908705 m!844359))

(assert (=> b!908705 m!844359))

(assert (=> b!908705 m!844447))

(assert (=> b!908491 d!112439))

(declare-fun b!908706 () Bool)

(declare-fun e!509358 () ListLongMap!10919)

(declare-fun call!40330 () ListLongMap!10919)

(assert (=> b!908706 (= e!509358 call!40330)))

(declare-fun b!908707 () Bool)

(declare-fun e!509364 () Bool)

(declare-fun e!509363 () Bool)

(assert (=> b!908707 (= e!509364 e!509363)))

(declare-fun c!95966 () Bool)

(assert (=> b!908707 (= c!95966 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!908709 () Bool)

(declare-fun e!509365 () Bool)

(declare-fun call!40331 () Bool)

(assert (=> b!908709 (= e!509365 (not call!40331))))

(declare-fun call!40327 () ListLongMap!10919)

(declare-fun call!40329 () ListLongMap!10919)

(declare-fun call!40328 () ListLongMap!10919)

(declare-fun c!95969 () Bool)

(declare-fun call!40325 () ListLongMap!10919)

(declare-fun bm!40322 () Bool)

(declare-fun c!95970 () Bool)

(assert (=> bm!40322 (= call!40328 (+!2612 (ite c!95970 call!40329 (ite c!95969 call!40325 call!40327)) (ite (or c!95970 c!95969) (tuple2!12221 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12221 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun bm!40323 () Bool)

(assert (=> bm!40323 (= call!40327 call!40325)))

(declare-fun bm!40324 () Bool)

(declare-fun call!40326 () Bool)

(declare-fun lt!409849 () ListLongMap!10919)

(assert (=> bm!40324 (= call!40326 (contains!4528 lt!409849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40325 () Bool)

(assert (=> bm!40325 (= call!40325 call!40329)))

(declare-fun bm!40326 () Bool)

(assert (=> bm!40326 (= call!40331 (contains!4528 lt!409849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!908710 () Bool)

(declare-fun res!613034 () Bool)

(assert (=> b!908710 (=> (not res!613034) (not e!509364))))

(assert (=> b!908710 (= res!613034 e!509365)))

(declare-fun c!95965 () Bool)

(assert (=> b!908710 (= c!95965 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40327 () Bool)

(assert (=> bm!40327 (= call!40329 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908711 () Bool)

(declare-fun e!509356 () Bool)

(assert (=> b!908711 (= e!509356 (= (apply!494 lt!409849 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!908712 () Bool)

(declare-fun e!509360 () ListLongMap!10919)

(declare-fun e!509359 () ListLongMap!10919)

(assert (=> b!908712 (= e!509360 e!509359)))

(assert (=> b!908712 (= c!95969 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!908713 () Bool)

(declare-fun e!509355 () Bool)

(assert (=> b!908713 (= e!509355 (= (apply!494 lt!409849 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun e!509366 () Bool)

(declare-fun b!908714 () Bool)

(assert (=> b!908714 (= e!509366 (= (apply!494 lt!409849 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000)) (get!13561 (select (arr!25755 _values!1152) #b00000000000000000000000000000000) (dynLambda!1381 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!908714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26215 _values!1152)))))

(assert (=> b!908714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26216 _keys!1386)))))

(declare-fun b!908715 () Bool)

(assert (=> b!908715 (= e!509363 (not call!40326))))

(declare-fun d!112441 () Bool)

(assert (=> d!112441 e!509364))

(declare-fun res!613033 () Bool)

(assert (=> d!112441 (=> (not res!613033) (not e!509364))))

(assert (=> d!112441 (= res!613033 (or (bvsge #b00000000000000000000000000000000 (size!26216 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26216 _keys!1386)))))))

(declare-fun lt!409840 () ListLongMap!10919)

(assert (=> d!112441 (= lt!409849 lt!409840)))

(declare-fun lt!409834 () Unit!30796)

(declare-fun e!509357 () Unit!30796)

(assert (=> d!112441 (= lt!409834 e!509357)))

(declare-fun c!95967 () Bool)

(declare-fun e!509367 () Bool)

(assert (=> d!112441 (= c!95967 e!509367)))

(declare-fun res!613031 () Bool)

(assert (=> d!112441 (=> (not res!613031) (not e!509367))))

(assert (=> d!112441 (= res!613031 (bvslt #b00000000000000000000000000000000 (size!26216 _keys!1386)))))

(assert (=> d!112441 (= lt!409840 e!509360)))

(assert (=> d!112441 (= c!95970 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112441 (validMask!0 mask!1756)))

(assert (=> d!112441 (= (getCurrentListMap!2739 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!409849)))

(declare-fun b!908708 () Bool)

(assert (=> b!908708 (= e!509363 e!509356)))

(declare-fun res!613035 () Bool)

(assert (=> b!908708 (= res!613035 call!40326)))

(assert (=> b!908708 (=> (not res!613035) (not e!509356))))

(declare-fun bm!40328 () Bool)

(assert (=> bm!40328 (= call!40330 call!40328)))

(declare-fun b!908716 () Bool)

(declare-fun c!95968 () Bool)

(assert (=> b!908716 (= c!95968 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!908716 (= e!509359 e!509358)))

(declare-fun b!908717 () Bool)

(declare-fun lt!409843 () Unit!30796)

(assert (=> b!908717 (= e!509357 lt!409843)))

(declare-fun lt!409839 () ListLongMap!10919)

(assert (=> b!908717 (= lt!409839 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409851 () (_ BitVec 64))

(assert (=> b!908717 (= lt!409851 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409846 () (_ BitVec 64))

(assert (=> b!908717 (= lt!409846 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409848 () Unit!30796)

(assert (=> b!908717 (= lt!409848 (addStillContains!343 lt!409839 lt!409851 zeroValue!1094 lt!409846))))

(assert (=> b!908717 (contains!4528 (+!2612 lt!409839 (tuple2!12221 lt!409851 zeroValue!1094)) lt!409846)))

(declare-fun lt!409845 () Unit!30796)

(assert (=> b!908717 (= lt!409845 lt!409848)))

(declare-fun lt!409830 () ListLongMap!10919)

(assert (=> b!908717 (= lt!409830 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409850 () (_ BitVec 64))

(assert (=> b!908717 (= lt!409850 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409833 () (_ BitVec 64))

(assert (=> b!908717 (= lt!409833 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409832 () Unit!30796)

(assert (=> b!908717 (= lt!409832 (addApplyDifferent!343 lt!409830 lt!409850 minValue!1094 lt!409833))))

(assert (=> b!908717 (= (apply!494 (+!2612 lt!409830 (tuple2!12221 lt!409850 minValue!1094)) lt!409833) (apply!494 lt!409830 lt!409833))))

(declare-fun lt!409836 () Unit!30796)

(assert (=> b!908717 (= lt!409836 lt!409832)))

(declare-fun lt!409838 () ListLongMap!10919)

(assert (=> b!908717 (= lt!409838 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409842 () (_ BitVec 64))

(assert (=> b!908717 (= lt!409842 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409844 () (_ BitVec 64))

(assert (=> b!908717 (= lt!409844 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409835 () Unit!30796)

(assert (=> b!908717 (= lt!409835 (addApplyDifferent!343 lt!409838 lt!409842 zeroValue!1094 lt!409844))))

(assert (=> b!908717 (= (apply!494 (+!2612 lt!409838 (tuple2!12221 lt!409842 zeroValue!1094)) lt!409844) (apply!494 lt!409838 lt!409844))))

(declare-fun lt!409837 () Unit!30796)

(assert (=> b!908717 (= lt!409837 lt!409835)))

(declare-fun lt!409847 () ListLongMap!10919)

(assert (=> b!908717 (= lt!409847 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409831 () (_ BitVec 64))

(assert (=> b!908717 (= lt!409831 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409841 () (_ BitVec 64))

(assert (=> b!908717 (= lt!409841 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!908717 (= lt!409843 (addApplyDifferent!343 lt!409847 lt!409831 minValue!1094 lt!409841))))

(assert (=> b!908717 (= (apply!494 (+!2612 lt!409847 (tuple2!12221 lt!409831 minValue!1094)) lt!409841) (apply!494 lt!409847 lt!409841))))

(declare-fun b!908718 () Bool)

(assert (=> b!908718 (= e!509365 e!509355)))

(declare-fun res!613029 () Bool)

(assert (=> b!908718 (= res!613029 call!40331)))

(assert (=> b!908718 (=> (not res!613029) (not e!509355))))

(declare-fun b!908719 () Bool)

(declare-fun e!509362 () Bool)

(assert (=> b!908719 (= e!509362 (validKeyInArray!0 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!908720 () Bool)

(assert (=> b!908720 (= e!509359 call!40330)))

(declare-fun b!908721 () Bool)

(assert (=> b!908721 (= e!509358 call!40327)))

(declare-fun b!908722 () Bool)

(assert (=> b!908722 (= e!509360 (+!2612 call!40328 (tuple2!12221 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!908723 () Bool)

(declare-fun e!509361 () Bool)

(assert (=> b!908723 (= e!509361 e!509366)))

(declare-fun res!613037 () Bool)

(assert (=> b!908723 (=> (not res!613037) (not e!509366))))

(assert (=> b!908723 (= res!613037 (contains!4528 lt!409849 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!908723 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26216 _keys!1386)))))

(declare-fun b!908724 () Bool)

(assert (=> b!908724 (= e!509367 (validKeyInArray!0 (select (arr!25756 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!908725 () Bool)

(declare-fun Unit!30803 () Unit!30796)

(assert (=> b!908725 (= e!509357 Unit!30803)))

(declare-fun b!908726 () Bool)

(declare-fun res!613032 () Bool)

(assert (=> b!908726 (=> (not res!613032) (not e!509364))))

(assert (=> b!908726 (= res!613032 e!509361)))

(declare-fun res!613030 () Bool)

(assert (=> b!908726 (=> res!613030 e!509361)))

(assert (=> b!908726 (= res!613030 (not e!509362))))

(declare-fun res!613036 () Bool)

(assert (=> b!908726 (=> (not res!613036) (not e!509362))))

(assert (=> b!908726 (= res!613036 (bvslt #b00000000000000000000000000000000 (size!26216 _keys!1386)))))

(assert (= (and d!112441 c!95970) b!908722))

(assert (= (and d!112441 (not c!95970)) b!908712))

(assert (= (and b!908712 c!95969) b!908720))

(assert (= (and b!908712 (not c!95969)) b!908716))

(assert (= (and b!908716 c!95968) b!908706))

(assert (= (and b!908716 (not c!95968)) b!908721))

(assert (= (or b!908706 b!908721) bm!40323))

(assert (= (or b!908720 bm!40323) bm!40325))

(assert (= (or b!908720 b!908706) bm!40328))

(assert (= (or b!908722 bm!40325) bm!40327))

(assert (= (or b!908722 bm!40328) bm!40322))

(assert (= (and d!112441 res!613031) b!908724))

(assert (= (and d!112441 c!95967) b!908717))

(assert (= (and d!112441 (not c!95967)) b!908725))

(assert (= (and d!112441 res!613033) b!908726))

(assert (= (and b!908726 res!613036) b!908719))

(assert (= (and b!908726 (not res!613030)) b!908723))

(assert (= (and b!908723 res!613037) b!908714))

(assert (= (and b!908726 res!613032) b!908710))

(assert (= (and b!908710 c!95965) b!908718))

(assert (= (and b!908710 (not c!95965)) b!908709))

(assert (= (and b!908718 res!613029) b!908713))

(assert (= (or b!908718 b!908709) bm!40326))

(assert (= (and b!908710 res!613034) b!908707))

(assert (= (and b!908707 c!95966) b!908708))

(assert (= (and b!908707 (not c!95966)) b!908715))

(assert (= (and b!908708 res!613035) b!908711))

(assert (= (or b!908708 b!908715) bm!40324))

(declare-fun b_lambda!13243 () Bool)

(assert (=> (not b_lambda!13243) (not b!908714)))

(assert (=> b!908714 t!25559))

(declare-fun b_and!26867 () Bool)

(assert (= b_and!26865 (and (=> t!25559 result!10521) b_and!26867)))

(declare-fun m!844449 () Bool)

(assert (=> bm!40324 m!844449))

(declare-fun m!844451 () Bool)

(assert (=> bm!40326 m!844451))

(declare-fun m!844453 () Bool)

(assert (=> bm!40322 m!844453))

(assert (=> b!908723 m!844353))

(assert (=> b!908723 m!844353))

(declare-fun m!844455 () Bool)

(assert (=> b!908723 m!844455))

(declare-fun m!844457 () Bool)

(assert (=> b!908714 m!844457))

(assert (=> b!908714 m!844263))

(declare-fun m!844459 () Bool)

(assert (=> b!908714 m!844459))

(assert (=> b!908714 m!844457))

(assert (=> b!908714 m!844263))

(assert (=> b!908714 m!844353))

(declare-fun m!844461 () Bool)

(assert (=> b!908714 m!844461))

(assert (=> b!908714 m!844353))

(declare-fun m!844463 () Bool)

(assert (=> bm!40327 m!844463))

(assert (=> b!908719 m!844353))

(assert (=> b!908719 m!844353))

(assert (=> b!908719 m!844377))

(declare-fun m!844465 () Bool)

(assert (=> b!908711 m!844465))

(declare-fun m!844467 () Bool)

(assert (=> b!908717 m!844467))

(declare-fun m!844469 () Bool)

(assert (=> b!908717 m!844469))

(declare-fun m!844471 () Bool)

(assert (=> b!908717 m!844471))

(declare-fun m!844473 () Bool)

(assert (=> b!908717 m!844473))

(declare-fun m!844475 () Bool)

(assert (=> b!908717 m!844475))

(declare-fun m!844477 () Bool)

(assert (=> b!908717 m!844477))

(declare-fun m!844479 () Bool)

(assert (=> b!908717 m!844479))

(declare-fun m!844481 () Bool)

(assert (=> b!908717 m!844481))

(declare-fun m!844483 () Bool)

(assert (=> b!908717 m!844483))

(declare-fun m!844485 () Bool)

(assert (=> b!908717 m!844485))

(declare-fun m!844487 () Bool)

(assert (=> b!908717 m!844487))

(assert (=> b!908717 m!844477))

(declare-fun m!844489 () Bool)

(assert (=> b!908717 m!844489))

(assert (=> b!908717 m!844353))

(assert (=> b!908717 m!844469))

(declare-fun m!844491 () Bool)

(assert (=> b!908717 m!844491))

(assert (=> b!908717 m!844463))

(declare-fun m!844493 () Bool)

(assert (=> b!908717 m!844493))

(assert (=> b!908717 m!844473))

(declare-fun m!844495 () Bool)

(assert (=> b!908717 m!844495))

(assert (=> b!908717 m!844481))

(declare-fun m!844497 () Bool)

(assert (=> b!908713 m!844497))

(assert (=> b!908724 m!844353))

(assert (=> b!908724 m!844353))

(assert (=> b!908724 m!844377))

(declare-fun m!844499 () Bool)

(assert (=> b!908722 m!844499))

(assert (=> d!112441 m!844241))

(assert (=> b!908491 d!112441))

(declare-fun b!908734 () Bool)

(declare-fun e!509373 () Bool)

(assert (=> b!908734 (= e!509373 tp_is_empty!18763)))

(declare-fun mapNonEmpty!29866 () Bool)

(declare-fun mapRes!29866 () Bool)

(declare-fun tp!57313 () Bool)

(declare-fun e!509372 () Bool)

(assert (=> mapNonEmpty!29866 (= mapRes!29866 (and tp!57313 e!509372))))

(declare-fun mapRest!29866 () (Array (_ BitVec 32) ValueCell!8900))

(declare-fun mapValue!29866 () ValueCell!8900)

(declare-fun mapKey!29866 () (_ BitVec 32))

(assert (=> mapNonEmpty!29866 (= mapRest!29857 (store mapRest!29866 mapKey!29866 mapValue!29866))))

(declare-fun condMapEmpty!29866 () Bool)

(declare-fun mapDefault!29866 () ValueCell!8900)

(assert (=> mapNonEmpty!29857 (= condMapEmpty!29866 (= mapRest!29857 ((as const (Array (_ BitVec 32) ValueCell!8900)) mapDefault!29866)))))

(assert (=> mapNonEmpty!29857 (= tp!57297 (and e!509373 mapRes!29866))))

(declare-fun b!908733 () Bool)

(assert (=> b!908733 (= e!509372 tp_is_empty!18763)))

(declare-fun mapIsEmpty!29866 () Bool)

(assert (=> mapIsEmpty!29866 mapRes!29866))

(assert (= (and mapNonEmpty!29857 condMapEmpty!29866) mapIsEmpty!29866))

(assert (= (and mapNonEmpty!29857 (not condMapEmpty!29866)) mapNonEmpty!29866))

(assert (= (and mapNonEmpty!29866 ((_ is ValueCellFull!8900) mapValue!29866)) b!908733))

(assert (= (and mapNonEmpty!29857 ((_ is ValueCellFull!8900) mapDefault!29866)) b!908734))

(declare-fun m!844501 () Bool)

(assert (=> mapNonEmpty!29866 m!844501))

(declare-fun b_lambda!13245 () Bool)

(assert (= b_lambda!13241 (or (and start!77928 b_free!16345) b_lambda!13245)))

(declare-fun b_lambda!13247 () Bool)

(assert (= b_lambda!13243 (or (and start!77928 b_free!16345) b_lambda!13247)))

(check-sat (not b!908724) (not bm!40327) tp_is_empty!18763 (not bm!40321) (not mapNonEmpty!29866) (not b!908599) (not b!908717) (not b!908701) (not b_lambda!13247) (not b!908612) (not b!908615) (not b!908675) (not b!908714) (not bm!40326) (not b!908587) (not b!908722) (not bm!40322) (not b!908723) (not bm!40317) (not b!908684) (not b!908603) (not b!908702) (not b!908685) (not b!908711) (not b!908719) (not b!908713) (not d!112417) (not b_lambda!13245) (not b_next!16345) (not d!112441) (not b!908674) (not bm!40314) (not b_lambda!13239) (not bm!40297) (not b!908622) (not b!908588) (not bm!40316) (not bm!40312) (not d!112431) (not b!908624) (not b!908683) (not bm!40324) (not d!112419) (not d!112429) b_and!26867 (not b!908703) (not d!112415) (not b!908705) (not b!908680) (not d!112439) (not b!908678) (not b!908699) (not d!112437) (not b!908594) (not b!908672))
(check-sat b_and!26867 (not b_next!16345))
