; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111168 () Bool)

(assert start!111168)

(declare-fun b_free!30003 () Bool)

(declare-fun b_next!30003 () Bool)

(assert (=> start!111168 (= b_free!30003 (not b_next!30003))))

(declare-fun tp!105330 () Bool)

(declare-fun b_and!48211 () Bool)

(assert (=> start!111168 (= tp!105330 b_and!48211)))

(declare-fun b!1316297 () Bool)

(declare-fun res!873831 () Bool)

(declare-fun e!750884 () Bool)

(assert (=> b!1316297 (=> (not res!873831) (not e!750884))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88424 0))(
  ( (array!88425 (arr!42692 (Array (_ BitVec 32) (_ BitVec 64))) (size!43242 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88424)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52747 0))(
  ( (V!52748 (val!17941 Int)) )
))
(declare-fun minValue!1296 () V!52747)

(declare-datatypes ((ValueCell!16968 0))(
  ( (ValueCellFull!16968 (v!20568 V!52747)) (EmptyCell!16968) )
))
(declare-datatypes ((array!88426 0))(
  ( (array!88427 (arr!42693 (Array (_ BitVec 32) ValueCell!16968)) (size!43243 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88426)

(declare-fun zeroValue!1296 () V!52747)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23148 0))(
  ( (tuple2!23149 (_1!11585 (_ BitVec 64)) (_2!11585 V!52747)) )
))
(declare-datatypes ((List!30286 0))(
  ( (Nil!30283) (Cons!30282 (h!31491 tuple2!23148) (t!43892 List!30286)) )
))
(declare-datatypes ((ListLongMap!20805 0))(
  ( (ListLongMap!20806 (toList!10418 List!30286)) )
))
(declare-fun contains!8568 (ListLongMap!20805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5431 (array!88424 array!88426 (_ BitVec 32) (_ BitVec 32) V!52747 V!52747 (_ BitVec 32) Int) ListLongMap!20805)

(assert (=> b!1316297 (= res!873831 (contains!8568 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!55228 () Bool)

(declare-fun mapRes!55228 () Bool)

(declare-fun tp!105331 () Bool)

(declare-fun e!750887 () Bool)

(assert (=> mapNonEmpty!55228 (= mapRes!55228 (and tp!105331 e!750887))))

(declare-fun mapValue!55228 () ValueCell!16968)

(declare-fun mapRest!55228 () (Array (_ BitVec 32) ValueCell!16968))

(declare-fun mapKey!55228 () (_ BitVec 32))

(assert (=> mapNonEmpty!55228 (= (arr!42693 _values!1354) (store mapRest!55228 mapKey!55228 mapValue!55228))))

(declare-fun b!1316298 () Bool)

(declare-fun res!873834 () Bool)

(assert (=> b!1316298 (=> (not res!873834) (not e!750884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316298 (= res!873834 (not (validKeyInArray!0 (select (arr!42692 _keys!1628) from!2020))))))

(declare-fun mapIsEmpty!55228 () Bool)

(assert (=> mapIsEmpty!55228 mapRes!55228))

(declare-fun b!1316299 () Bool)

(declare-fun e!750885 () Bool)

(declare-fun e!750886 () Bool)

(assert (=> b!1316299 (= e!750885 (and e!750886 mapRes!55228))))

(declare-fun condMapEmpty!55228 () Bool)

(declare-fun mapDefault!55228 () ValueCell!16968)

(assert (=> b!1316299 (= condMapEmpty!55228 (= (arr!42693 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16968)) mapDefault!55228)))))

(declare-fun b!1316300 () Bool)

(declare-fun res!873828 () Bool)

(assert (=> b!1316300 (=> (not res!873828) (not e!750884))))

(declare-datatypes ((List!30287 0))(
  ( (Nil!30284) (Cons!30283 (h!31492 (_ BitVec 64)) (t!43893 List!30287)) )
))
(declare-fun arrayNoDuplicates!0 (array!88424 (_ BitVec 32) List!30287) Bool)

(assert (=> b!1316300 (= res!873828 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30284))))

(declare-fun b!1316301 () Bool)

(declare-fun res!873827 () Bool)

(assert (=> b!1316301 (=> (not res!873827) (not e!750884))))

(assert (=> b!1316301 (= res!873827 (not (= (select (arr!42692 _keys!1628) from!2020) k0!1175)))))

(declare-fun res!873833 () Bool)

(assert (=> start!111168 (=> (not res!873833) (not e!750884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111168 (= res!873833 (validMask!0 mask!2040))))

(assert (=> start!111168 e!750884))

(assert (=> start!111168 tp!105330))

(declare-fun array_inv!32243 (array!88424) Bool)

(assert (=> start!111168 (array_inv!32243 _keys!1628)))

(assert (=> start!111168 true))

(declare-fun tp_is_empty!35733 () Bool)

(assert (=> start!111168 tp_is_empty!35733))

(declare-fun array_inv!32244 (array!88426) Bool)

(assert (=> start!111168 (and (array_inv!32244 _values!1354) e!750885)))

(declare-fun b!1316302 () Bool)

(declare-fun res!873829 () Bool)

(assert (=> b!1316302 (=> (not res!873829) (not e!750884))))

(assert (=> b!1316302 (= res!873829 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43242 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316303 () Bool)

(assert (=> b!1316303 (= e!750884 (not (contains!8568 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))))

(declare-fun b!1316304 () Bool)

(assert (=> b!1316304 (= e!750886 tp_is_empty!35733)))

(declare-fun b!1316305 () Bool)

(declare-fun res!873830 () Bool)

(assert (=> b!1316305 (=> (not res!873830) (not e!750884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88424 (_ BitVec 32)) Bool)

(assert (=> b!1316305 (= res!873830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316306 () Bool)

(declare-fun res!873832 () Bool)

(assert (=> b!1316306 (=> (not res!873832) (not e!750884))))

(assert (=> b!1316306 (= res!873832 (and (= (size!43243 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43242 _keys!1628) (size!43243 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316307 () Bool)

(assert (=> b!1316307 (= e!750887 tp_is_empty!35733)))

(assert (= (and start!111168 res!873833) b!1316306))

(assert (= (and b!1316306 res!873832) b!1316305))

(assert (= (and b!1316305 res!873830) b!1316300))

(assert (= (and b!1316300 res!873828) b!1316302))

(assert (= (and b!1316302 res!873829) b!1316297))

(assert (= (and b!1316297 res!873831) b!1316301))

(assert (= (and b!1316301 res!873827) b!1316298))

(assert (= (and b!1316298 res!873834) b!1316303))

(assert (= (and b!1316299 condMapEmpty!55228) mapIsEmpty!55228))

(assert (= (and b!1316299 (not condMapEmpty!55228)) mapNonEmpty!55228))

(get-info :version)

(assert (= (and mapNonEmpty!55228 ((_ is ValueCellFull!16968) mapValue!55228)) b!1316307))

(assert (= (and b!1316299 ((_ is ValueCellFull!16968) mapDefault!55228)) b!1316304))

(assert (= start!111168 b!1316299))

(declare-fun m!1204209 () Bool)

(assert (=> b!1316303 m!1204209))

(assert (=> b!1316303 m!1204209))

(declare-fun m!1204211 () Bool)

(assert (=> b!1316303 m!1204211))

(declare-fun m!1204213 () Bool)

(assert (=> b!1316300 m!1204213))

(declare-fun m!1204215 () Bool)

(assert (=> b!1316305 m!1204215))

(declare-fun m!1204217 () Bool)

(assert (=> start!111168 m!1204217))

(declare-fun m!1204219 () Bool)

(assert (=> start!111168 m!1204219))

(declare-fun m!1204221 () Bool)

(assert (=> start!111168 m!1204221))

(declare-fun m!1204223 () Bool)

(assert (=> b!1316298 m!1204223))

(assert (=> b!1316298 m!1204223))

(declare-fun m!1204225 () Bool)

(assert (=> b!1316298 m!1204225))

(declare-fun m!1204227 () Bool)

(assert (=> b!1316297 m!1204227))

(assert (=> b!1316297 m!1204227))

(declare-fun m!1204229 () Bool)

(assert (=> b!1316297 m!1204229))

(declare-fun m!1204231 () Bool)

(assert (=> mapNonEmpty!55228 m!1204231))

(assert (=> b!1316301 m!1204223))

(check-sat (not b!1316300) (not b!1316303) b_and!48211 (not b!1316297) (not start!111168) (not b!1316305) tp_is_empty!35733 (not b_next!30003) (not mapNonEmpty!55228) (not b!1316298))
(check-sat b_and!48211 (not b_next!30003))
(get-model)

(declare-fun d!142515 () Bool)

(assert (=> d!142515 (= (validKeyInArray!0 (select (arr!42692 _keys!1628) from!2020)) (and (not (= (select (arr!42692 _keys!1628) from!2020) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!42692 _keys!1628) from!2020) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1316298 d!142515))

(declare-fun d!142517 () Bool)

(declare-fun e!750907 () Bool)

(assert (=> d!142517 e!750907))

(declare-fun res!873861 () Bool)

(assert (=> d!142517 (=> res!873861 e!750907)))

(declare-fun lt!586019 () Bool)

(assert (=> d!142517 (= res!873861 (not lt!586019))))

(declare-fun lt!586017 () Bool)

(assert (=> d!142517 (= lt!586019 lt!586017)))

(declare-datatypes ((Unit!43400 0))(
  ( (Unit!43401) )
))
(declare-fun lt!586018 () Unit!43400)

(declare-fun e!750908 () Unit!43400)

(assert (=> d!142517 (= lt!586018 e!750908)))

(declare-fun c!125550 () Bool)

(assert (=> d!142517 (= c!125550 lt!586017)))

(declare-fun containsKey!733 (List!30286 (_ BitVec 64)) Bool)

(assert (=> d!142517 (= lt!586017 (containsKey!733 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(assert (=> d!142517 (= (contains!8568 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175) lt!586019)))

(declare-fun b!1316347 () Bool)

(declare-fun lt!586020 () Unit!43400)

(assert (=> b!1316347 (= e!750908 lt!586020)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!479 (List!30286 (_ BitVec 64)) Unit!43400)

(assert (=> b!1316347 (= lt!586020 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(declare-datatypes ((Option!763 0))(
  ( (Some!762 (v!20570 V!52747)) (None!761) )
))
(declare-fun isDefined!518 (Option!763) Bool)

(declare-fun getValueByKey!711 (List!30286 (_ BitVec 64)) Option!763)

(assert (=> b!1316347 (isDefined!518 (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(declare-fun b!1316348 () Bool)

(declare-fun Unit!43402 () Unit!43400)

(assert (=> b!1316348 (= e!750908 Unit!43402)))

(declare-fun b!1316349 () Bool)

(assert (=> b!1316349 (= e!750907 (isDefined!518 (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175)))))

(assert (= (and d!142517 c!125550) b!1316347))

(assert (= (and d!142517 (not c!125550)) b!1316348))

(assert (= (and d!142517 (not res!873861)) b!1316349))

(declare-fun m!1204257 () Bool)

(assert (=> d!142517 m!1204257))

(declare-fun m!1204259 () Bool)

(assert (=> b!1316347 m!1204259))

(declare-fun m!1204261 () Bool)

(assert (=> b!1316347 m!1204261))

(assert (=> b!1316347 m!1204261))

(declare-fun m!1204263 () Bool)

(assert (=> b!1316347 m!1204263))

(assert (=> b!1316349 m!1204261))

(assert (=> b!1316349 m!1204261))

(assert (=> b!1316349 m!1204263))

(assert (=> b!1316303 d!142517))

(declare-fun bm!64644 () Bool)

(declare-fun call!64649 () Bool)

(declare-fun lt!586078 () ListLongMap!20805)

(assert (=> bm!64644 (= call!64649 (contains!8568 lt!586078 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316392 () Bool)

(declare-fun res!873886 () Bool)

(declare-fun e!750936 () Bool)

(assert (=> b!1316392 (=> (not res!873886) (not e!750936))))

(declare-fun e!750940 () Bool)

(assert (=> b!1316392 (= res!873886 e!750940)))

(declare-fun res!873882 () Bool)

(assert (=> b!1316392 (=> res!873882 e!750940)))

(declare-fun e!750944 () Bool)

(assert (=> b!1316392 (= res!873882 (not e!750944))))

(declare-fun res!873888 () Bool)

(assert (=> b!1316392 (=> (not res!873888) (not e!750944))))

(assert (=> b!1316392 (= res!873888 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43242 _keys!1628)))))

(declare-fun b!1316393 () Bool)

(declare-fun e!750943 () Bool)

(declare-fun e!750938 () Bool)

(assert (=> b!1316393 (= e!750943 e!750938)))

(declare-fun res!873883 () Bool)

(assert (=> b!1316393 (= res!873883 call!64649)))

(assert (=> b!1316393 (=> (not res!873883) (not e!750938))))

(declare-fun b!1316394 () Bool)

(assert (=> b!1316394 (= e!750944 (validKeyInArray!0 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun b!1316395 () Bool)

(declare-fun e!750942 () ListLongMap!20805)

(declare-fun call!64648 () ListLongMap!20805)

(declare-fun +!4496 (ListLongMap!20805 tuple2!23148) ListLongMap!20805)

(assert (=> b!1316395 (= e!750942 (+!4496 call!64648 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(declare-fun b!1316396 () Bool)

(assert (=> b!1316396 (= e!750943 (not call!64649))))

(declare-fun bm!64645 () Bool)

(declare-fun call!64650 () ListLongMap!20805)

(assert (=> bm!64645 (= call!64650 call!64648)))

(declare-fun b!1316397 () Bool)

(declare-fun e!750941 () ListLongMap!20805)

(assert (=> b!1316397 (= e!750941 call!64650)))

(declare-fun b!1316398 () Bool)

(declare-fun e!750937 () Unit!43400)

(declare-fun lt!586076 () Unit!43400)

(assert (=> b!1316398 (= e!750937 lt!586076)))

(declare-fun lt!586073 () ListLongMap!20805)

(declare-fun getCurrentListMapNoExtraKeys!6131 (array!88424 array!88426 (_ BitVec 32) (_ BitVec 32) V!52747 V!52747 (_ BitVec 32) Int) ListLongMap!20805)

(assert (=> b!1316398 (= lt!586073 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!586067 () (_ BitVec 64))

(assert (=> b!1316398 (= lt!586067 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586084 () (_ BitVec 64))

(assert (=> b!1316398 (= lt!586084 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(declare-fun lt!586086 () Unit!43400)

(declare-fun addStillContains!1116 (ListLongMap!20805 (_ BitVec 64) V!52747 (_ BitVec 64)) Unit!43400)

(assert (=> b!1316398 (= lt!586086 (addStillContains!1116 lt!586073 lt!586067 zeroValue!1296 lt!586084))))

(assert (=> b!1316398 (contains!8568 (+!4496 lt!586073 (tuple2!23149 lt!586067 zeroValue!1296)) lt!586084)))

(declare-fun lt!586071 () Unit!43400)

(assert (=> b!1316398 (= lt!586071 lt!586086)))

(declare-fun lt!586080 () ListLongMap!20805)

(assert (=> b!1316398 (= lt!586080 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!586085 () (_ BitVec 64))

(assert (=> b!1316398 (= lt!586085 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586072 () (_ BitVec 64))

(assert (=> b!1316398 (= lt!586072 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(declare-fun lt!586077 () Unit!43400)

(declare-fun addApplyDifferent!570 (ListLongMap!20805 (_ BitVec 64) V!52747 (_ BitVec 64)) Unit!43400)

(assert (=> b!1316398 (= lt!586077 (addApplyDifferent!570 lt!586080 lt!586085 minValue!1296 lt!586072))))

(declare-fun apply!1028 (ListLongMap!20805 (_ BitVec 64)) V!52747)

(assert (=> b!1316398 (= (apply!1028 (+!4496 lt!586080 (tuple2!23149 lt!586085 minValue!1296)) lt!586072) (apply!1028 lt!586080 lt!586072))))

(declare-fun lt!586069 () Unit!43400)

(assert (=> b!1316398 (= lt!586069 lt!586077)))

(declare-fun lt!586065 () ListLongMap!20805)

(assert (=> b!1316398 (= lt!586065 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!586082 () (_ BitVec 64))

(assert (=> b!1316398 (= lt!586082 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586068 () (_ BitVec 64))

(assert (=> b!1316398 (= lt!586068 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(declare-fun lt!586066 () Unit!43400)

(assert (=> b!1316398 (= lt!586066 (addApplyDifferent!570 lt!586065 lt!586082 zeroValue!1296 lt!586068))))

(assert (=> b!1316398 (= (apply!1028 (+!4496 lt!586065 (tuple2!23149 lt!586082 zeroValue!1296)) lt!586068) (apply!1028 lt!586065 lt!586068))))

(declare-fun lt!586079 () Unit!43400)

(assert (=> b!1316398 (= lt!586079 lt!586066)))

(declare-fun lt!586074 () ListLongMap!20805)

(assert (=> b!1316398 (= lt!586074 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!586070 () (_ BitVec 64))

(assert (=> b!1316398 (= lt!586070 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586081 () (_ BitVec 64))

(assert (=> b!1316398 (= lt!586081 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(assert (=> b!1316398 (= lt!586076 (addApplyDifferent!570 lt!586074 lt!586070 minValue!1296 lt!586081))))

(assert (=> b!1316398 (= (apply!1028 (+!4496 lt!586074 (tuple2!23149 lt!586070 minValue!1296)) lt!586081) (apply!1028 lt!586074 lt!586081))))

(declare-fun b!1316399 () Bool)

(declare-fun e!750935 () Bool)

(assert (=> b!1316399 (= e!750935 (= (apply!1028 lt!586078 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1296))))

(declare-fun b!1316400 () Bool)

(declare-fun e!750939 () Bool)

(assert (=> b!1316400 (= e!750939 (validKeyInArray!0 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun b!1316402 () Bool)

(declare-fun Unit!43403 () Unit!43400)

(assert (=> b!1316402 (= e!750937 Unit!43403)))

(declare-fun b!1316403 () Bool)

(assert (=> b!1316403 (= e!750938 (= (apply!1028 lt!586078 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1296))))

(declare-fun b!1316404 () Bool)

(declare-fun e!750946 () Bool)

(assert (=> b!1316404 (= e!750940 e!750946)))

(declare-fun res!873880 () Bool)

(assert (=> b!1316404 (=> (not res!873880) (not e!750946))))

(assert (=> b!1316404 (= res!873880 (contains!8568 lt!586078 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1316404 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43242 _keys!1628)))))

(declare-fun b!1316405 () Bool)

(declare-fun res!873884 () Bool)

(assert (=> b!1316405 (=> (not res!873884) (not e!750936))))

(declare-fun e!750947 () Bool)

(assert (=> b!1316405 (= res!873884 e!750947)))

(declare-fun c!125567 () Bool)

(assert (=> b!1316405 (= c!125567 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1316406 () Bool)

(declare-fun e!750945 () ListLongMap!20805)

(assert (=> b!1316406 (= e!750945 call!64650)))

(declare-fun bm!64646 () Bool)

(declare-fun call!64651 () ListLongMap!20805)

(declare-fun call!64653 () ListLongMap!20805)

(assert (=> bm!64646 (= call!64651 call!64653)))

(declare-fun b!1316407 () Bool)

(declare-fun c!125563 () Bool)

(assert (=> b!1316407 (= c!125563 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1316407 (= e!750945 e!750941)))

(declare-fun b!1316408 () Bool)

(assert (=> b!1316408 (= e!750947 e!750935)))

(declare-fun res!873885 () Bool)

(declare-fun call!64652 () Bool)

(assert (=> b!1316408 (= res!873885 call!64652)))

(assert (=> b!1316408 (=> (not res!873885) (not e!750935))))

(declare-fun c!125565 () Bool)

(declare-fun call!64647 () ListLongMap!20805)

(declare-fun bm!64647 () Bool)

(declare-fun c!125564 () Bool)

(assert (=> bm!64647 (= call!64648 (+!4496 (ite c!125565 call!64653 (ite c!125564 call!64651 call!64647)) (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun b!1316409 () Bool)

(assert (=> b!1316409 (= e!750941 call!64647)))

(declare-fun bm!64648 () Bool)

(assert (=> bm!64648 (= call!64653 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun bm!64649 () Bool)

(assert (=> bm!64649 (= call!64652 (contains!8568 lt!586078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64650 () Bool)

(assert (=> bm!64650 (= call!64647 call!64651)))

(declare-fun b!1316410 () Bool)

(assert (=> b!1316410 (= e!750936 e!750943)))

(declare-fun c!125568 () Bool)

(assert (=> b!1316410 (= c!125568 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1316411 () Bool)

(declare-fun get!21455 (ValueCell!16968 V!52747) V!52747)

(declare-fun dynLambda!3435 (Int (_ BitVec 64)) V!52747)

(assert (=> b!1316411 (= e!750946 (= (apply!1028 lt!586078 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (get!21455 (select (arr!42693 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1316411 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43243 _values!1354)))))

(assert (=> b!1316411 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43242 _keys!1628)))))

(declare-fun b!1316412 () Bool)

(assert (=> b!1316412 (= e!750942 e!750945)))

(assert (=> b!1316412 (= c!125564 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!142519 () Bool)

(assert (=> d!142519 e!750936))

(declare-fun res!873881 () Bool)

(assert (=> d!142519 (=> (not res!873881) (not e!750936))))

(assert (=> d!142519 (= res!873881 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2020) (size!43242 _keys!1628)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43242 _keys!1628)))))))

(declare-fun lt!586075 () ListLongMap!20805)

(assert (=> d!142519 (= lt!586078 lt!586075)))

(declare-fun lt!586083 () Unit!43400)

(assert (=> d!142519 (= lt!586083 e!750937)))

(declare-fun c!125566 () Bool)

(assert (=> d!142519 (= c!125566 e!750939)))

(declare-fun res!873887 () Bool)

(assert (=> d!142519 (=> (not res!873887) (not e!750939))))

(assert (=> d!142519 (= res!873887 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43242 _keys!1628)))))

(assert (=> d!142519 (= lt!586075 e!750942)))

(assert (=> d!142519 (= c!125565 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142519 (validMask!0 mask!2040)))

(assert (=> d!142519 (= (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) lt!586078)))

(declare-fun b!1316401 () Bool)

(assert (=> b!1316401 (= e!750947 (not call!64652))))

(assert (= (and d!142519 c!125565) b!1316395))

(assert (= (and d!142519 (not c!125565)) b!1316412))

(assert (= (and b!1316412 c!125564) b!1316406))

(assert (= (and b!1316412 (not c!125564)) b!1316407))

(assert (= (and b!1316407 c!125563) b!1316397))

(assert (= (and b!1316407 (not c!125563)) b!1316409))

(assert (= (or b!1316397 b!1316409) bm!64650))

(assert (= (or b!1316406 bm!64650) bm!64646))

(assert (= (or b!1316406 b!1316397) bm!64645))

(assert (= (or b!1316395 bm!64646) bm!64648))

(assert (= (or b!1316395 bm!64645) bm!64647))

(assert (= (and d!142519 res!873887) b!1316400))

(assert (= (and d!142519 c!125566) b!1316398))

(assert (= (and d!142519 (not c!125566)) b!1316402))

(assert (= (and d!142519 res!873881) b!1316392))

(assert (= (and b!1316392 res!873888) b!1316394))

(assert (= (and b!1316392 (not res!873882)) b!1316404))

(assert (= (and b!1316404 res!873880) b!1316411))

(assert (= (and b!1316392 res!873886) b!1316405))

(assert (= (and b!1316405 c!125567) b!1316408))

(assert (= (and b!1316405 (not c!125567)) b!1316401))

(assert (= (and b!1316408 res!873885) b!1316399))

(assert (= (or b!1316408 b!1316401) bm!64649))

(assert (= (and b!1316405 res!873884) b!1316410))

(assert (= (and b!1316410 c!125568) b!1316393))

(assert (= (and b!1316410 (not c!125568)) b!1316396))

(assert (= (and b!1316393 res!873883) b!1316403))

(assert (= (or b!1316393 b!1316396) bm!64644))

(declare-fun b_lambda!23363 () Bool)

(assert (=> (not b_lambda!23363) (not b!1316411)))

(declare-fun t!43897 () Bool)

(declare-fun tb!11411 () Bool)

(assert (=> (and start!111168 (= defaultEntry!1357 defaultEntry!1357) t!43897) tb!11411))

(declare-fun result!23865 () Bool)

(assert (=> tb!11411 (= result!23865 tp_is_empty!35733)))

(assert (=> b!1316411 t!43897))

(declare-fun b_and!48215 () Bool)

(assert (= b_and!48211 (and (=> t!43897 result!23865) b_and!48215)))

(declare-fun m!1204265 () Bool)

(assert (=> b!1316399 m!1204265))

(declare-fun m!1204267 () Bool)

(assert (=> b!1316400 m!1204267))

(assert (=> b!1316400 m!1204267))

(declare-fun m!1204269 () Bool)

(assert (=> b!1316400 m!1204269))

(assert (=> b!1316411 m!1204267))

(declare-fun m!1204271 () Bool)

(assert (=> b!1316411 m!1204271))

(declare-fun m!1204273 () Bool)

(assert (=> b!1316411 m!1204273))

(declare-fun m!1204275 () Bool)

(assert (=> b!1316411 m!1204275))

(assert (=> b!1316411 m!1204275))

(assert (=> b!1316411 m!1204273))

(declare-fun m!1204277 () Bool)

(assert (=> b!1316411 m!1204277))

(assert (=> b!1316411 m!1204267))

(declare-fun m!1204279 () Bool)

(assert (=> b!1316398 m!1204279))

(declare-fun m!1204281 () Bool)

(assert (=> b!1316398 m!1204281))

(declare-fun m!1204283 () Bool)

(assert (=> b!1316398 m!1204283))

(declare-fun m!1204285 () Bool)

(assert (=> b!1316398 m!1204285))

(declare-fun m!1204287 () Bool)

(assert (=> b!1316398 m!1204287))

(declare-fun m!1204289 () Bool)

(assert (=> b!1316398 m!1204289))

(declare-fun m!1204291 () Bool)

(assert (=> b!1316398 m!1204291))

(declare-fun m!1204293 () Bool)

(assert (=> b!1316398 m!1204293))

(assert (=> b!1316398 m!1204267))

(declare-fun m!1204295 () Bool)

(assert (=> b!1316398 m!1204295))

(declare-fun m!1204297 () Bool)

(assert (=> b!1316398 m!1204297))

(declare-fun m!1204299 () Bool)

(assert (=> b!1316398 m!1204299))

(assert (=> b!1316398 m!1204283))

(declare-fun m!1204301 () Bool)

(assert (=> b!1316398 m!1204301))

(assert (=> b!1316398 m!1204291))

(declare-fun m!1204303 () Bool)

(assert (=> b!1316398 m!1204303))

(declare-fun m!1204305 () Bool)

(assert (=> b!1316398 m!1204305))

(assert (=> b!1316398 m!1204295))

(assert (=> b!1316398 m!1204289))

(declare-fun m!1204307 () Bool)

(assert (=> b!1316398 m!1204307))

(declare-fun m!1204309 () Bool)

(assert (=> b!1316398 m!1204309))

(declare-fun m!1204311 () Bool)

(assert (=> bm!64647 m!1204311))

(declare-fun m!1204313 () Bool)

(assert (=> b!1316395 m!1204313))

(assert (=> b!1316394 m!1204267))

(assert (=> b!1316394 m!1204267))

(assert (=> b!1316394 m!1204269))

(declare-fun m!1204315 () Bool)

(assert (=> bm!64644 m!1204315))

(assert (=> bm!64648 m!1204303))

(declare-fun m!1204317 () Bool)

(assert (=> b!1316403 m!1204317))

(declare-fun m!1204319 () Bool)

(assert (=> bm!64649 m!1204319))

(assert (=> b!1316404 m!1204267))

(assert (=> b!1316404 m!1204267))

(declare-fun m!1204321 () Bool)

(assert (=> b!1316404 m!1204321))

(assert (=> d!142519 m!1204217))

(assert (=> b!1316303 d!142519))

(declare-fun b!1316423 () Bool)

(declare-fun e!750954 () Bool)

(declare-fun call!64656 () Bool)

(assert (=> b!1316423 (= e!750954 call!64656)))

(declare-fun d!142521 () Bool)

(declare-fun res!873893 () Bool)

(declare-fun e!750955 () Bool)

(assert (=> d!142521 (=> res!873893 e!750955)))

(assert (=> d!142521 (= res!873893 (bvsge #b00000000000000000000000000000000 (size!43242 _keys!1628)))))

(assert (=> d!142521 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!750955)))

(declare-fun bm!64653 () Bool)

(assert (=> bm!64653 (= call!64656 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun b!1316424 () Bool)

(declare-fun e!750956 () Bool)

(assert (=> b!1316424 (= e!750956 call!64656)))

(declare-fun b!1316425 () Bool)

(assert (=> b!1316425 (= e!750954 e!750956)))

(declare-fun lt!586093 () (_ BitVec 64))

(assert (=> b!1316425 (= lt!586093 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000))))

(declare-fun lt!586094 () Unit!43400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88424 (_ BitVec 64) (_ BitVec 32)) Unit!43400)

(assert (=> b!1316425 (= lt!586094 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!586093 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1316425 (arrayContainsKey!0 _keys!1628 lt!586093 #b00000000000000000000000000000000)))

(declare-fun lt!586095 () Unit!43400)

(assert (=> b!1316425 (= lt!586095 lt!586094)))

(declare-fun res!873894 () Bool)

(declare-datatypes ((SeekEntryResult!10035 0))(
  ( (MissingZero!10035 (index!42511 (_ BitVec 32))) (Found!10035 (index!42512 (_ BitVec 32))) (Intermediate!10035 (undefined!10847 Bool) (index!42513 (_ BitVec 32)) (x!117025 (_ BitVec 32))) (Undefined!10035) (MissingVacant!10035 (index!42514 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88424 (_ BitVec 32)) SeekEntryResult!10035)

(assert (=> b!1316425 (= res!873894 (= (seekEntryOrOpen!0 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!10035 #b00000000000000000000000000000000)))))

(assert (=> b!1316425 (=> (not res!873894) (not e!750956))))

(declare-fun b!1316426 () Bool)

(assert (=> b!1316426 (= e!750955 e!750954)))

(declare-fun c!125571 () Bool)

(assert (=> b!1316426 (= c!125571 (validKeyInArray!0 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000)))))

(assert (= (and d!142521 (not res!873893)) b!1316426))

(assert (= (and b!1316426 c!125571) b!1316425))

(assert (= (and b!1316426 (not c!125571)) b!1316423))

(assert (= (and b!1316425 res!873894) b!1316424))

(assert (= (or b!1316424 b!1316423) bm!64653))

(declare-fun m!1204323 () Bool)

(assert (=> bm!64653 m!1204323))

(declare-fun m!1204325 () Bool)

(assert (=> b!1316425 m!1204325))

(declare-fun m!1204327 () Bool)

(assert (=> b!1316425 m!1204327))

(declare-fun m!1204329 () Bool)

(assert (=> b!1316425 m!1204329))

(assert (=> b!1316425 m!1204325))

(declare-fun m!1204331 () Bool)

(assert (=> b!1316425 m!1204331))

(assert (=> b!1316426 m!1204325))

(assert (=> b!1316426 m!1204325))

(declare-fun m!1204333 () Bool)

(assert (=> b!1316426 m!1204333))

(assert (=> b!1316305 d!142521))

(declare-fun d!142523 () Bool)

(assert (=> d!142523 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!111168 d!142523))

(declare-fun d!142525 () Bool)

(assert (=> d!142525 (= (array_inv!32243 _keys!1628) (bvsge (size!43242 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!111168 d!142525))

(declare-fun d!142527 () Bool)

(assert (=> d!142527 (= (array_inv!32244 _values!1354) (bvsge (size!43243 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!111168 d!142527))

(declare-fun b!1316437 () Bool)

(declare-fun e!750968 () Bool)

(declare-fun call!64659 () Bool)

(assert (=> b!1316437 (= e!750968 call!64659)))

(declare-fun bm!64656 () Bool)

(declare-fun c!125574 () Bool)

(assert (=> bm!64656 (= call!64659 (arrayNoDuplicates!0 _keys!1628 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125574 (Cons!30283 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) Nil!30284) Nil!30284)))))

(declare-fun b!1316438 () Bool)

(declare-fun e!750965 () Bool)

(assert (=> b!1316438 (= e!750965 e!750968)))

(assert (=> b!1316438 (= c!125574 (validKeyInArray!0 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1316439 () Bool)

(declare-fun e!750967 () Bool)

(assert (=> b!1316439 (= e!750967 e!750965)))

(declare-fun res!873903 () Bool)

(assert (=> b!1316439 (=> (not res!873903) (not e!750965))))

(declare-fun e!750966 () Bool)

(assert (=> b!1316439 (= res!873903 (not e!750966))))

(declare-fun res!873902 () Bool)

(assert (=> b!1316439 (=> (not res!873902) (not e!750966))))

(assert (=> b!1316439 (= res!873902 (validKeyInArray!0 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun d!142529 () Bool)

(declare-fun res!873901 () Bool)

(assert (=> d!142529 (=> res!873901 e!750967)))

(assert (=> d!142529 (= res!873901 (bvsge #b00000000000000000000000000000000 (size!43242 _keys!1628)))))

(assert (=> d!142529 (= (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30284) e!750967)))

(declare-fun b!1316440 () Bool)

(declare-fun contains!8570 (List!30287 (_ BitVec 64)) Bool)

(assert (=> b!1316440 (= e!750966 (contains!8570 Nil!30284 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1316441 () Bool)

(assert (=> b!1316441 (= e!750968 call!64659)))

(assert (= (and d!142529 (not res!873901)) b!1316439))

(assert (= (and b!1316439 res!873902) b!1316440))

(assert (= (and b!1316439 res!873903) b!1316438))

(assert (= (and b!1316438 c!125574) b!1316437))

(assert (= (and b!1316438 (not c!125574)) b!1316441))

(assert (= (or b!1316437 b!1316441) bm!64656))

(assert (=> bm!64656 m!1204325))

(declare-fun m!1204335 () Bool)

(assert (=> bm!64656 m!1204335))

(assert (=> b!1316438 m!1204325))

(assert (=> b!1316438 m!1204325))

(assert (=> b!1316438 m!1204333))

(assert (=> b!1316439 m!1204325))

(assert (=> b!1316439 m!1204325))

(assert (=> b!1316439 m!1204333))

(assert (=> b!1316440 m!1204325))

(assert (=> b!1316440 m!1204325))

(declare-fun m!1204337 () Bool)

(assert (=> b!1316440 m!1204337))

(assert (=> b!1316300 d!142529))

(declare-fun d!142531 () Bool)

(declare-fun e!750969 () Bool)

(assert (=> d!142531 e!750969))

(declare-fun res!873904 () Bool)

(assert (=> d!142531 (=> res!873904 e!750969)))

(declare-fun lt!586098 () Bool)

(assert (=> d!142531 (= res!873904 (not lt!586098))))

(declare-fun lt!586096 () Bool)

(assert (=> d!142531 (= lt!586098 lt!586096)))

(declare-fun lt!586097 () Unit!43400)

(declare-fun e!750970 () Unit!43400)

(assert (=> d!142531 (= lt!586097 e!750970)))

(declare-fun c!125575 () Bool)

(assert (=> d!142531 (= c!125575 lt!586096)))

(assert (=> d!142531 (= lt!586096 (containsKey!733 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(assert (=> d!142531 (= (contains!8568 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175) lt!586098)))

(declare-fun b!1316442 () Bool)

(declare-fun lt!586099 () Unit!43400)

(assert (=> b!1316442 (= e!750970 lt!586099)))

(assert (=> b!1316442 (= lt!586099 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(assert (=> b!1316442 (isDefined!518 (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(declare-fun b!1316443 () Bool)

(declare-fun Unit!43404 () Unit!43400)

(assert (=> b!1316443 (= e!750970 Unit!43404)))

(declare-fun b!1316444 () Bool)

(assert (=> b!1316444 (= e!750969 (isDefined!518 (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175)))))

(assert (= (and d!142531 c!125575) b!1316442))

(assert (= (and d!142531 (not c!125575)) b!1316443))

(assert (= (and d!142531 (not res!873904)) b!1316444))

(declare-fun m!1204339 () Bool)

(assert (=> d!142531 m!1204339))

(declare-fun m!1204341 () Bool)

(assert (=> b!1316442 m!1204341))

(declare-fun m!1204343 () Bool)

(assert (=> b!1316442 m!1204343))

(assert (=> b!1316442 m!1204343))

(declare-fun m!1204345 () Bool)

(assert (=> b!1316442 m!1204345))

(assert (=> b!1316444 m!1204343))

(assert (=> b!1316444 m!1204343))

(assert (=> b!1316444 m!1204345))

(assert (=> b!1316297 d!142531))

(declare-fun bm!64657 () Bool)

(declare-fun call!64662 () Bool)

(declare-fun lt!586113 () ListLongMap!20805)

(assert (=> bm!64657 (= call!64662 (contains!8568 lt!586113 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316445 () Bool)

(declare-fun res!873911 () Bool)

(declare-fun e!750972 () Bool)

(assert (=> b!1316445 (=> (not res!873911) (not e!750972))))

(declare-fun e!750976 () Bool)

(assert (=> b!1316445 (= res!873911 e!750976)))

(declare-fun res!873907 () Bool)

(assert (=> b!1316445 (=> res!873907 e!750976)))

(declare-fun e!750980 () Bool)

(assert (=> b!1316445 (= res!873907 (not e!750980))))

(declare-fun res!873913 () Bool)

(assert (=> b!1316445 (=> (not res!873913) (not e!750980))))

(assert (=> b!1316445 (= res!873913 (bvslt from!2020 (size!43242 _keys!1628)))))

(declare-fun b!1316446 () Bool)

(declare-fun e!750979 () Bool)

(declare-fun e!750974 () Bool)

(assert (=> b!1316446 (= e!750979 e!750974)))

(declare-fun res!873908 () Bool)

(assert (=> b!1316446 (= res!873908 call!64662)))

(assert (=> b!1316446 (=> (not res!873908) (not e!750974))))

(declare-fun b!1316447 () Bool)

(assert (=> b!1316447 (= e!750980 (validKeyInArray!0 (select (arr!42692 _keys!1628) from!2020)))))

(declare-fun b!1316448 () Bool)

(declare-fun e!750978 () ListLongMap!20805)

(declare-fun call!64661 () ListLongMap!20805)

(assert (=> b!1316448 (= e!750978 (+!4496 call!64661 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(declare-fun b!1316449 () Bool)

(assert (=> b!1316449 (= e!750979 (not call!64662))))

(declare-fun bm!64658 () Bool)

(declare-fun call!64663 () ListLongMap!20805)

(assert (=> bm!64658 (= call!64663 call!64661)))

(declare-fun b!1316450 () Bool)

(declare-fun e!750977 () ListLongMap!20805)

(assert (=> b!1316450 (= e!750977 call!64663)))

(declare-fun b!1316451 () Bool)

(declare-fun e!750973 () Unit!43400)

(declare-fun lt!586111 () Unit!43400)

(assert (=> b!1316451 (= e!750973 lt!586111)))

(declare-fun lt!586108 () ListLongMap!20805)

(assert (=> b!1316451 (= lt!586108 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!586102 () (_ BitVec 64))

(assert (=> b!1316451 (= lt!586102 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586119 () (_ BitVec 64))

(assert (=> b!1316451 (= lt!586119 (select (arr!42692 _keys!1628) from!2020))))

(declare-fun lt!586121 () Unit!43400)

(assert (=> b!1316451 (= lt!586121 (addStillContains!1116 lt!586108 lt!586102 zeroValue!1296 lt!586119))))

(assert (=> b!1316451 (contains!8568 (+!4496 lt!586108 (tuple2!23149 lt!586102 zeroValue!1296)) lt!586119)))

(declare-fun lt!586106 () Unit!43400)

(assert (=> b!1316451 (= lt!586106 lt!586121)))

(declare-fun lt!586115 () ListLongMap!20805)

(assert (=> b!1316451 (= lt!586115 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!586120 () (_ BitVec 64))

(assert (=> b!1316451 (= lt!586120 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586107 () (_ BitVec 64))

(assert (=> b!1316451 (= lt!586107 (select (arr!42692 _keys!1628) from!2020))))

(declare-fun lt!586112 () Unit!43400)

(assert (=> b!1316451 (= lt!586112 (addApplyDifferent!570 lt!586115 lt!586120 minValue!1296 lt!586107))))

(assert (=> b!1316451 (= (apply!1028 (+!4496 lt!586115 (tuple2!23149 lt!586120 minValue!1296)) lt!586107) (apply!1028 lt!586115 lt!586107))))

(declare-fun lt!586104 () Unit!43400)

(assert (=> b!1316451 (= lt!586104 lt!586112)))

(declare-fun lt!586100 () ListLongMap!20805)

(assert (=> b!1316451 (= lt!586100 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!586117 () (_ BitVec 64))

(assert (=> b!1316451 (= lt!586117 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586103 () (_ BitVec 64))

(assert (=> b!1316451 (= lt!586103 (select (arr!42692 _keys!1628) from!2020))))

(declare-fun lt!586101 () Unit!43400)

(assert (=> b!1316451 (= lt!586101 (addApplyDifferent!570 lt!586100 lt!586117 zeroValue!1296 lt!586103))))

(assert (=> b!1316451 (= (apply!1028 (+!4496 lt!586100 (tuple2!23149 lt!586117 zeroValue!1296)) lt!586103) (apply!1028 lt!586100 lt!586103))))

(declare-fun lt!586114 () Unit!43400)

(assert (=> b!1316451 (= lt!586114 lt!586101)))

(declare-fun lt!586109 () ListLongMap!20805)

(assert (=> b!1316451 (= lt!586109 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!586105 () (_ BitVec 64))

(assert (=> b!1316451 (= lt!586105 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586116 () (_ BitVec 64))

(assert (=> b!1316451 (= lt!586116 (select (arr!42692 _keys!1628) from!2020))))

(assert (=> b!1316451 (= lt!586111 (addApplyDifferent!570 lt!586109 lt!586105 minValue!1296 lt!586116))))

(assert (=> b!1316451 (= (apply!1028 (+!4496 lt!586109 (tuple2!23149 lt!586105 minValue!1296)) lt!586116) (apply!1028 lt!586109 lt!586116))))

(declare-fun b!1316452 () Bool)

(declare-fun e!750971 () Bool)

(assert (=> b!1316452 (= e!750971 (= (apply!1028 lt!586113 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1296))))

(declare-fun b!1316453 () Bool)

(declare-fun e!750975 () Bool)

(assert (=> b!1316453 (= e!750975 (validKeyInArray!0 (select (arr!42692 _keys!1628) from!2020)))))

(declare-fun b!1316455 () Bool)

(declare-fun Unit!43405 () Unit!43400)

(assert (=> b!1316455 (= e!750973 Unit!43405)))

(declare-fun b!1316456 () Bool)

(assert (=> b!1316456 (= e!750974 (= (apply!1028 lt!586113 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1296))))

(declare-fun b!1316457 () Bool)

(declare-fun e!750982 () Bool)

(assert (=> b!1316457 (= e!750976 e!750982)))

(declare-fun res!873905 () Bool)

(assert (=> b!1316457 (=> (not res!873905) (not e!750982))))

(assert (=> b!1316457 (= res!873905 (contains!8568 lt!586113 (select (arr!42692 _keys!1628) from!2020)))))

(assert (=> b!1316457 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43242 _keys!1628)))))

(declare-fun b!1316458 () Bool)

(declare-fun res!873909 () Bool)

(assert (=> b!1316458 (=> (not res!873909) (not e!750972))))

(declare-fun e!750983 () Bool)

(assert (=> b!1316458 (= res!873909 e!750983)))

(declare-fun c!125580 () Bool)

(assert (=> b!1316458 (= c!125580 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1316459 () Bool)

(declare-fun e!750981 () ListLongMap!20805)

(assert (=> b!1316459 (= e!750981 call!64663)))

(declare-fun bm!64659 () Bool)

(declare-fun call!64664 () ListLongMap!20805)

(declare-fun call!64666 () ListLongMap!20805)

(assert (=> bm!64659 (= call!64664 call!64666)))

(declare-fun b!1316460 () Bool)

(declare-fun c!125576 () Bool)

(assert (=> b!1316460 (= c!125576 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1316460 (= e!750981 e!750977)))

(declare-fun b!1316461 () Bool)

(assert (=> b!1316461 (= e!750983 e!750971)))

(declare-fun res!873910 () Bool)

(declare-fun call!64665 () Bool)

(assert (=> b!1316461 (= res!873910 call!64665)))

(assert (=> b!1316461 (=> (not res!873910) (not e!750971))))

(declare-fun c!125578 () Bool)

(declare-fun call!64660 () ListLongMap!20805)

(declare-fun c!125577 () Bool)

(declare-fun bm!64660 () Bool)

(assert (=> bm!64660 (= call!64661 (+!4496 (ite c!125578 call!64666 (ite c!125577 call!64664 call!64660)) (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun b!1316462 () Bool)

(assert (=> b!1316462 (= e!750977 call!64660)))

(declare-fun bm!64661 () Bool)

(assert (=> bm!64661 (= call!64666 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun bm!64662 () Bool)

(assert (=> bm!64662 (= call!64665 (contains!8568 lt!586113 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64663 () Bool)

(assert (=> bm!64663 (= call!64660 call!64664)))

(declare-fun b!1316463 () Bool)

(assert (=> b!1316463 (= e!750972 e!750979)))

(declare-fun c!125581 () Bool)

(assert (=> b!1316463 (= c!125581 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1316464 () Bool)

(assert (=> b!1316464 (= e!750982 (= (apply!1028 lt!586113 (select (arr!42692 _keys!1628) from!2020)) (get!21455 (select (arr!42693 _values!1354) from!2020) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1316464 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43243 _values!1354)))))

(assert (=> b!1316464 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43242 _keys!1628)))))

(declare-fun b!1316465 () Bool)

(assert (=> b!1316465 (= e!750978 e!750981)))

(assert (=> b!1316465 (= c!125577 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!142533 () Bool)

(assert (=> d!142533 e!750972))

(declare-fun res!873906 () Bool)

(assert (=> d!142533 (=> (not res!873906) (not e!750972))))

(assert (=> d!142533 (= res!873906 (or (bvsge from!2020 (size!43242 _keys!1628)) (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43242 _keys!1628)))))))

(declare-fun lt!586110 () ListLongMap!20805)

(assert (=> d!142533 (= lt!586113 lt!586110)))

(declare-fun lt!586118 () Unit!43400)

(assert (=> d!142533 (= lt!586118 e!750973)))

(declare-fun c!125579 () Bool)

(assert (=> d!142533 (= c!125579 e!750975)))

(declare-fun res!873912 () Bool)

(assert (=> d!142533 (=> (not res!873912) (not e!750975))))

(assert (=> d!142533 (= res!873912 (bvslt from!2020 (size!43242 _keys!1628)))))

(assert (=> d!142533 (= lt!586110 e!750978)))

(assert (=> d!142533 (= c!125578 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142533 (validMask!0 mask!2040)))

(assert (=> d!142533 (= (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) lt!586113)))

(declare-fun b!1316454 () Bool)

(assert (=> b!1316454 (= e!750983 (not call!64665))))

(assert (= (and d!142533 c!125578) b!1316448))

(assert (= (and d!142533 (not c!125578)) b!1316465))

(assert (= (and b!1316465 c!125577) b!1316459))

(assert (= (and b!1316465 (not c!125577)) b!1316460))

(assert (= (and b!1316460 c!125576) b!1316450))

(assert (= (and b!1316460 (not c!125576)) b!1316462))

(assert (= (or b!1316450 b!1316462) bm!64663))

(assert (= (or b!1316459 bm!64663) bm!64659))

(assert (= (or b!1316459 b!1316450) bm!64658))

(assert (= (or b!1316448 bm!64659) bm!64661))

(assert (= (or b!1316448 bm!64658) bm!64660))

(assert (= (and d!142533 res!873912) b!1316453))

(assert (= (and d!142533 c!125579) b!1316451))

(assert (= (and d!142533 (not c!125579)) b!1316455))

(assert (= (and d!142533 res!873906) b!1316445))

(assert (= (and b!1316445 res!873913) b!1316447))

(assert (= (and b!1316445 (not res!873907)) b!1316457))

(assert (= (and b!1316457 res!873905) b!1316464))

(assert (= (and b!1316445 res!873911) b!1316458))

(assert (= (and b!1316458 c!125580) b!1316461))

(assert (= (and b!1316458 (not c!125580)) b!1316454))

(assert (= (and b!1316461 res!873910) b!1316452))

(assert (= (or b!1316461 b!1316454) bm!64662))

(assert (= (and b!1316458 res!873909) b!1316463))

(assert (= (and b!1316463 c!125581) b!1316446))

(assert (= (and b!1316463 (not c!125581)) b!1316449))

(assert (= (and b!1316446 res!873908) b!1316456))

(assert (= (or b!1316446 b!1316449) bm!64657))

(declare-fun b_lambda!23365 () Bool)

(assert (=> (not b_lambda!23365) (not b!1316464)))

(assert (=> b!1316464 t!43897))

(declare-fun b_and!48217 () Bool)

(assert (= b_and!48215 (and (=> t!43897 result!23865) b_and!48217)))

(declare-fun m!1204347 () Bool)

(assert (=> b!1316452 m!1204347))

(assert (=> b!1316453 m!1204223))

(assert (=> b!1316453 m!1204223))

(assert (=> b!1316453 m!1204225))

(assert (=> b!1316464 m!1204223))

(declare-fun m!1204349 () Bool)

(assert (=> b!1316464 m!1204349))

(assert (=> b!1316464 m!1204273))

(declare-fun m!1204351 () Bool)

(assert (=> b!1316464 m!1204351))

(assert (=> b!1316464 m!1204351))

(assert (=> b!1316464 m!1204273))

(declare-fun m!1204353 () Bool)

(assert (=> b!1316464 m!1204353))

(assert (=> b!1316464 m!1204223))

(declare-fun m!1204355 () Bool)

(assert (=> b!1316451 m!1204355))

(declare-fun m!1204357 () Bool)

(assert (=> b!1316451 m!1204357))

(declare-fun m!1204359 () Bool)

(assert (=> b!1316451 m!1204359))

(declare-fun m!1204361 () Bool)

(assert (=> b!1316451 m!1204361))

(declare-fun m!1204363 () Bool)

(assert (=> b!1316451 m!1204363))

(declare-fun m!1204365 () Bool)

(assert (=> b!1316451 m!1204365))

(declare-fun m!1204367 () Bool)

(assert (=> b!1316451 m!1204367))

(declare-fun m!1204369 () Bool)

(assert (=> b!1316451 m!1204369))

(assert (=> b!1316451 m!1204223))

(declare-fun m!1204371 () Bool)

(assert (=> b!1316451 m!1204371))

(declare-fun m!1204373 () Bool)

(assert (=> b!1316451 m!1204373))

(declare-fun m!1204375 () Bool)

(assert (=> b!1316451 m!1204375))

(assert (=> b!1316451 m!1204359))

(declare-fun m!1204377 () Bool)

(assert (=> b!1316451 m!1204377))

(assert (=> b!1316451 m!1204367))

(declare-fun m!1204379 () Bool)

(assert (=> b!1316451 m!1204379))

(declare-fun m!1204381 () Bool)

(assert (=> b!1316451 m!1204381))

(assert (=> b!1316451 m!1204371))

(assert (=> b!1316451 m!1204365))

(declare-fun m!1204383 () Bool)

(assert (=> b!1316451 m!1204383))

(declare-fun m!1204385 () Bool)

(assert (=> b!1316451 m!1204385))

(declare-fun m!1204387 () Bool)

(assert (=> bm!64660 m!1204387))

(declare-fun m!1204389 () Bool)

(assert (=> b!1316448 m!1204389))

(assert (=> b!1316447 m!1204223))

(assert (=> b!1316447 m!1204223))

(assert (=> b!1316447 m!1204225))

(declare-fun m!1204391 () Bool)

(assert (=> bm!64657 m!1204391))

(assert (=> bm!64661 m!1204379))

(declare-fun m!1204393 () Bool)

(assert (=> b!1316456 m!1204393))

(declare-fun m!1204395 () Bool)

(assert (=> bm!64662 m!1204395))

(assert (=> b!1316457 m!1204223))

(assert (=> b!1316457 m!1204223))

(declare-fun m!1204397 () Bool)

(assert (=> b!1316457 m!1204397))

(assert (=> d!142533 m!1204217))

(assert (=> b!1316297 d!142533))

(declare-fun b!1316473 () Bool)

(declare-fun e!750988 () Bool)

(assert (=> b!1316473 (= e!750988 tp_is_empty!35733)))

(declare-fun condMapEmpty!55234 () Bool)

(declare-fun mapDefault!55234 () ValueCell!16968)

(assert (=> mapNonEmpty!55228 (= condMapEmpty!55234 (= mapRest!55228 ((as const (Array (_ BitVec 32) ValueCell!16968)) mapDefault!55234)))))

(declare-fun mapRes!55234 () Bool)

(assert (=> mapNonEmpty!55228 (= tp!105331 (and e!750988 mapRes!55234))))

(declare-fun b!1316472 () Bool)

(declare-fun e!750989 () Bool)

(assert (=> b!1316472 (= e!750989 tp_is_empty!35733)))

(declare-fun mapIsEmpty!55234 () Bool)

(assert (=> mapIsEmpty!55234 mapRes!55234))

(declare-fun mapNonEmpty!55234 () Bool)

(declare-fun tp!105340 () Bool)

(assert (=> mapNonEmpty!55234 (= mapRes!55234 (and tp!105340 e!750989))))

(declare-fun mapValue!55234 () ValueCell!16968)

(declare-fun mapKey!55234 () (_ BitVec 32))

(declare-fun mapRest!55234 () (Array (_ BitVec 32) ValueCell!16968))

(assert (=> mapNonEmpty!55234 (= mapRest!55228 (store mapRest!55234 mapKey!55234 mapValue!55234))))

(assert (= (and mapNonEmpty!55228 condMapEmpty!55234) mapIsEmpty!55234))

(assert (= (and mapNonEmpty!55228 (not condMapEmpty!55234)) mapNonEmpty!55234))

(assert (= (and mapNonEmpty!55234 ((_ is ValueCellFull!16968) mapValue!55234)) b!1316472))

(assert (= (and mapNonEmpty!55228 ((_ is ValueCellFull!16968) mapDefault!55234)) b!1316473))

(declare-fun m!1204399 () Bool)

(assert (=> mapNonEmpty!55234 m!1204399))

(declare-fun b_lambda!23367 () Bool)

(assert (= b_lambda!23365 (or (and start!111168 b_free!30003) b_lambda!23367)))

(declare-fun b_lambda!23369 () Bool)

(assert (= b_lambda!23363 (or (and start!111168 b_free!30003) b_lambda!23369)))

(check-sat (not b!1316457) (not b!1316399) (not mapNonEmpty!55234) (not bm!64653) (not b!1316452) (not b!1316447) (not b!1316404) (not b_lambda!23369) (not b!1316398) (not b!1316444) (not b!1316400) (not b!1316448) (not b!1316438) (not bm!64649) (not d!142531) (not bm!64661) (not d!142533) (not b!1316426) (not b!1316395) b_and!48217 (not b!1316425) (not b!1316403) (not b!1316453) (not b!1316349) (not b!1316442) (not b!1316394) (not b_lambda!23367) (not b!1316464) (not bm!64660) (not bm!64644) (not bm!64648) (not bm!64656) (not d!142519) (not b!1316411) (not bm!64647) tp_is_empty!35733 (not b!1316456) (not b!1316451) (not b!1316440) (not d!142517) (not b_next!30003) (not bm!64662) (not bm!64657) (not b!1316439) (not b!1316347))
(check-sat b_and!48217 (not b_next!30003))
(get-model)

(declare-fun d!142535 () Bool)

(declare-fun e!750992 () Bool)

(assert (=> d!142535 e!750992))

(declare-fun res!873919 () Bool)

(assert (=> d!142535 (=> (not res!873919) (not e!750992))))

(declare-fun lt!586131 () ListLongMap!20805)

(assert (=> d!142535 (= res!873919 (contains!8568 lt!586131 (_1!11585 (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun lt!586132 () List!30286)

(assert (=> d!142535 (= lt!586131 (ListLongMap!20806 lt!586132))))

(declare-fun lt!586133 () Unit!43400)

(declare-fun lt!586130 () Unit!43400)

(assert (=> d!142535 (= lt!586133 lt!586130)))

(assert (=> d!142535 (= (getValueByKey!711 lt!586132 (_1!11585 (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!762 (_2!11585 (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!356 (List!30286 (_ BitVec 64) V!52747) Unit!43400)

(assert (=> d!142535 (= lt!586130 (lemmaContainsTupThenGetReturnValue!356 lt!586132 (_1!11585 (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11585 (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun insertStrictlySorted!485 (List!30286 (_ BitVec 64) V!52747) List!30286)

(assert (=> d!142535 (= lt!586132 (insertStrictlySorted!485 (toList!10418 (ite c!125578 call!64666 (ite c!125577 call!64664 call!64660))) (_1!11585 (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11585 (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!142535 (= (+!4496 (ite c!125578 call!64666 (ite c!125577 call!64664 call!64660)) (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) lt!586131)))

(declare-fun b!1316478 () Bool)

(declare-fun res!873918 () Bool)

(assert (=> b!1316478 (=> (not res!873918) (not e!750992))))

(assert (=> b!1316478 (= res!873918 (= (getValueByKey!711 (toList!10418 lt!586131) (_1!11585 (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!762 (_2!11585 (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))))

(declare-fun b!1316479 () Bool)

(declare-fun contains!8571 (List!30286 tuple2!23148) Bool)

(assert (=> b!1316479 (= e!750992 (contains!8571 (toList!10418 lt!586131) (ite (or c!125578 c!125577) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (= (and d!142535 res!873919) b!1316478))

(assert (= (and b!1316478 res!873918) b!1316479))

(declare-fun m!1204401 () Bool)

(assert (=> d!142535 m!1204401))

(declare-fun m!1204403 () Bool)

(assert (=> d!142535 m!1204403))

(declare-fun m!1204405 () Bool)

(assert (=> d!142535 m!1204405))

(declare-fun m!1204407 () Bool)

(assert (=> d!142535 m!1204407))

(declare-fun m!1204409 () Bool)

(assert (=> b!1316478 m!1204409))

(declare-fun m!1204411 () Bool)

(assert (=> b!1316479 m!1204411))

(assert (=> bm!64660 d!142535))

(declare-fun d!142537 () Bool)

(assert (=> d!142537 (= (validKeyInArray!0 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000)) (and (not (= (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1316439 d!142537))

(declare-fun d!142539 () Bool)

(declare-fun e!750993 () Bool)

(assert (=> d!142539 e!750993))

(declare-fun res!873920 () Bool)

(assert (=> d!142539 (=> res!873920 e!750993)))

(declare-fun lt!586136 () Bool)

(assert (=> d!142539 (= res!873920 (not lt!586136))))

(declare-fun lt!586134 () Bool)

(assert (=> d!142539 (= lt!586136 lt!586134)))

(declare-fun lt!586135 () Unit!43400)

(declare-fun e!750994 () Unit!43400)

(assert (=> d!142539 (= lt!586135 e!750994)))

(declare-fun c!125582 () Bool)

(assert (=> d!142539 (= c!125582 lt!586134)))

(assert (=> d!142539 (= lt!586134 (containsKey!733 (toList!10418 lt!586113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142539 (= (contains!8568 lt!586113 #b1000000000000000000000000000000000000000000000000000000000000000) lt!586136)))

(declare-fun b!1316480 () Bool)

(declare-fun lt!586137 () Unit!43400)

(assert (=> b!1316480 (= e!750994 lt!586137)))

(assert (=> b!1316480 (= lt!586137 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 lt!586113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1316480 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316481 () Bool)

(declare-fun Unit!43406 () Unit!43400)

(assert (=> b!1316481 (= e!750994 Unit!43406)))

(declare-fun b!1316482 () Bool)

(assert (=> b!1316482 (= e!750993 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586113) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142539 c!125582) b!1316480))

(assert (= (and d!142539 (not c!125582)) b!1316481))

(assert (= (and d!142539 (not res!873920)) b!1316482))

(declare-fun m!1204413 () Bool)

(assert (=> d!142539 m!1204413))

(declare-fun m!1204415 () Bool)

(assert (=> b!1316480 m!1204415))

(declare-fun m!1204417 () Bool)

(assert (=> b!1316480 m!1204417))

(assert (=> b!1316480 m!1204417))

(declare-fun m!1204419 () Bool)

(assert (=> b!1316480 m!1204419))

(assert (=> b!1316482 m!1204417))

(assert (=> b!1316482 m!1204417))

(assert (=> b!1316482 m!1204419))

(assert (=> bm!64657 d!142539))

(declare-fun d!142541 () Bool)

(declare-fun lt!586140 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!651 (List!30287) (InoxSet (_ BitVec 64)))

(assert (=> d!142541 (= lt!586140 (select (content!651 Nil!30284) (select (arr!42692 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun e!750999 () Bool)

(assert (=> d!142541 (= lt!586140 e!750999)))

(declare-fun res!873925 () Bool)

(assert (=> d!142541 (=> (not res!873925) (not e!750999))))

(assert (=> d!142541 (= res!873925 ((_ is Cons!30283) Nil!30284))))

(assert (=> d!142541 (= (contains!8570 Nil!30284 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000)) lt!586140)))

(declare-fun b!1316487 () Bool)

(declare-fun e!751000 () Bool)

(assert (=> b!1316487 (= e!750999 e!751000)))

(declare-fun res!873926 () Bool)

(assert (=> b!1316487 (=> res!873926 e!751000)))

(assert (=> b!1316487 (= res!873926 (= (h!31492 Nil!30284) (select (arr!42692 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1316488 () Bool)

(assert (=> b!1316488 (= e!751000 (contains!8570 (t!43893 Nil!30284) (select (arr!42692 _keys!1628) #b00000000000000000000000000000000)))))

(assert (= (and d!142541 res!873925) b!1316487))

(assert (= (and b!1316487 (not res!873926)) b!1316488))

(declare-fun m!1204421 () Bool)

(assert (=> d!142541 m!1204421))

(assert (=> d!142541 m!1204325))

(declare-fun m!1204423 () Bool)

(assert (=> d!142541 m!1204423))

(assert (=> b!1316488 m!1204325))

(declare-fun m!1204425 () Bool)

(assert (=> b!1316488 m!1204425))

(assert (=> b!1316440 d!142541))

(assert (=> d!142519 d!142523))

(declare-fun d!142543 () Bool)

(declare-fun isEmpty!1073 (Option!763) Bool)

(assert (=> d!142543 (= (isDefined!518 (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175)) (not (isEmpty!1073 (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))))

(declare-fun bs!37599 () Bool)

(assert (= bs!37599 d!142543))

(assert (=> bs!37599 m!1204343))

(declare-fun m!1204427 () Bool)

(assert (=> bs!37599 m!1204427))

(assert (=> b!1316444 d!142543))

(declare-fun b!1316499 () Bool)

(declare-fun e!751006 () Option!763)

(assert (=> b!1316499 (= e!751006 (getValueByKey!711 (t!43892 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) k0!1175))))

(declare-fun e!751005 () Option!763)

(declare-fun b!1316497 () Bool)

(assert (=> b!1316497 (= e!751005 (Some!762 (_2!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))))))

(declare-fun c!125587 () Bool)

(declare-fun d!142545 () Bool)

(assert (=> d!142545 (= c!125587 (and ((_ is Cons!30282) (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (= (_1!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)))))

(assert (=> d!142545 (= (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175) e!751005)))

(declare-fun b!1316500 () Bool)

(assert (=> b!1316500 (= e!751006 None!761)))

(declare-fun b!1316498 () Bool)

(assert (=> b!1316498 (= e!751005 e!751006)))

(declare-fun c!125588 () Bool)

(assert (=> b!1316498 (= c!125588 (and ((_ is Cons!30282) (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (not (= (_1!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175))))))

(assert (= (and d!142545 c!125587) b!1316497))

(assert (= (and d!142545 (not c!125587)) b!1316498))

(assert (= (and b!1316498 c!125588) b!1316499))

(assert (= (and b!1316498 (not c!125588)) b!1316500))

(declare-fun m!1204429 () Bool)

(assert (=> b!1316499 m!1204429))

(assert (=> b!1316444 d!142545))

(declare-fun b!1316501 () Bool)

(declare-fun e!751010 () Bool)

(declare-fun call!64667 () Bool)

(assert (=> b!1316501 (= e!751010 call!64667)))

(declare-fun bm!64664 () Bool)

(declare-fun c!125589 () Bool)

(assert (=> bm!64664 (= call!64667 (arrayNoDuplicates!0 _keys!1628 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125589 (Cons!30283 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125574 (Cons!30283 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) Nil!30284) Nil!30284)) (ite c!125574 (Cons!30283 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) Nil!30284) Nil!30284))))))

(declare-fun b!1316502 () Bool)

(declare-fun e!751007 () Bool)

(assert (=> b!1316502 (= e!751007 e!751010)))

(assert (=> b!1316502 (= c!125589 (validKeyInArray!0 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1316503 () Bool)

(declare-fun e!751009 () Bool)

(assert (=> b!1316503 (= e!751009 e!751007)))

(declare-fun res!873929 () Bool)

(assert (=> b!1316503 (=> (not res!873929) (not e!751007))))

(declare-fun e!751008 () Bool)

(assert (=> b!1316503 (= res!873929 (not e!751008))))

(declare-fun res!873928 () Bool)

(assert (=> b!1316503 (=> (not res!873928) (not e!751008))))

(assert (=> b!1316503 (= res!873928 (validKeyInArray!0 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!142547 () Bool)

(declare-fun res!873927 () Bool)

(assert (=> d!142547 (=> res!873927 e!751009)))

(assert (=> d!142547 (= res!873927 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43242 _keys!1628)))))

(assert (=> d!142547 (= (arrayNoDuplicates!0 _keys!1628 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125574 (Cons!30283 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) Nil!30284) Nil!30284)) e!751009)))

(declare-fun b!1316504 () Bool)

(assert (=> b!1316504 (= e!751008 (contains!8570 (ite c!125574 (Cons!30283 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) Nil!30284) Nil!30284) (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1316505 () Bool)

(assert (=> b!1316505 (= e!751010 call!64667)))

(assert (= (and d!142547 (not res!873927)) b!1316503))

(assert (= (and b!1316503 res!873928) b!1316504))

(assert (= (and b!1316503 res!873929) b!1316502))

(assert (= (and b!1316502 c!125589) b!1316501))

(assert (= (and b!1316502 (not c!125589)) b!1316505))

(assert (= (or b!1316501 b!1316505) bm!64664))

(declare-fun m!1204431 () Bool)

(assert (=> bm!64664 m!1204431))

(declare-fun m!1204433 () Bool)

(assert (=> bm!64664 m!1204433))

(assert (=> b!1316502 m!1204431))

(assert (=> b!1316502 m!1204431))

(declare-fun m!1204435 () Bool)

(assert (=> b!1316502 m!1204435))

(assert (=> b!1316503 m!1204431))

(assert (=> b!1316503 m!1204431))

(assert (=> b!1316503 m!1204435))

(assert (=> b!1316504 m!1204431))

(assert (=> b!1316504 m!1204431))

(declare-fun m!1204437 () Bool)

(assert (=> b!1316504 m!1204437))

(assert (=> bm!64656 d!142547))

(declare-fun d!142549 () Bool)

(declare-fun res!873934 () Bool)

(declare-fun e!751015 () Bool)

(assert (=> d!142549 (=> res!873934 e!751015)))

(assert (=> d!142549 (= res!873934 (and ((_ is Cons!30282) (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (= (_1!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)))))

(assert (=> d!142549 (= (containsKey!733 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175) e!751015)))

(declare-fun b!1316510 () Bool)

(declare-fun e!751016 () Bool)

(assert (=> b!1316510 (= e!751015 e!751016)))

(declare-fun res!873935 () Bool)

(assert (=> b!1316510 (=> (not res!873935) (not e!751016))))

(assert (=> b!1316510 (= res!873935 (and (or (not ((_ is Cons!30282) (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) (bvsle (_1!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)) ((_ is Cons!30282) (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (bvslt (_1!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)))))

(declare-fun b!1316511 () Bool)

(assert (=> b!1316511 (= e!751016 (containsKey!733 (t!43892 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) k0!1175))))

(assert (= (and d!142549 (not res!873934)) b!1316510))

(assert (= (and b!1316510 res!873935) b!1316511))

(declare-fun m!1204439 () Bool)

(assert (=> b!1316511 m!1204439))

(assert (=> d!142517 d!142549))

(declare-fun d!142551 () Bool)

(declare-fun e!751017 () Bool)

(assert (=> d!142551 e!751017))

(declare-fun res!873936 () Bool)

(assert (=> d!142551 (=> res!873936 e!751017)))

(declare-fun lt!586143 () Bool)

(assert (=> d!142551 (= res!873936 (not lt!586143))))

(declare-fun lt!586141 () Bool)

(assert (=> d!142551 (= lt!586143 lt!586141)))

(declare-fun lt!586142 () Unit!43400)

(declare-fun e!751018 () Unit!43400)

(assert (=> d!142551 (= lt!586142 e!751018)))

(declare-fun c!125590 () Bool)

(assert (=> d!142551 (= c!125590 lt!586141)))

(assert (=> d!142551 (= lt!586141 (containsKey!733 (toList!10418 lt!586078) (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> d!142551 (= (contains!8568 lt!586078 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) lt!586143)))

(declare-fun b!1316512 () Bool)

(declare-fun lt!586144 () Unit!43400)

(assert (=> b!1316512 (= e!751018 lt!586144)))

(assert (=> b!1316512 (= lt!586144 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 lt!586078) (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1316512 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586078) (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun b!1316513 () Bool)

(declare-fun Unit!43407 () Unit!43400)

(assert (=> b!1316513 (= e!751018 Unit!43407)))

(declare-fun b!1316514 () Bool)

(assert (=> b!1316514 (= e!751017 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586078) (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))))

(assert (= (and d!142551 c!125590) b!1316512))

(assert (= (and d!142551 (not c!125590)) b!1316513))

(assert (= (and d!142551 (not res!873936)) b!1316514))

(assert (=> d!142551 m!1204267))

(declare-fun m!1204441 () Bool)

(assert (=> d!142551 m!1204441))

(assert (=> b!1316512 m!1204267))

(declare-fun m!1204443 () Bool)

(assert (=> b!1316512 m!1204443))

(assert (=> b!1316512 m!1204267))

(declare-fun m!1204445 () Bool)

(assert (=> b!1316512 m!1204445))

(assert (=> b!1316512 m!1204445))

(declare-fun m!1204447 () Bool)

(assert (=> b!1316512 m!1204447))

(assert (=> b!1316514 m!1204267))

(assert (=> b!1316514 m!1204445))

(assert (=> b!1316514 m!1204445))

(assert (=> b!1316514 m!1204447))

(assert (=> b!1316404 d!142551))

(assert (=> b!1316438 d!142537))

(declare-fun d!142553 () Bool)

(declare-fun e!751019 () Bool)

(assert (=> d!142553 e!751019))

(declare-fun res!873938 () Bool)

(assert (=> d!142553 (=> (not res!873938) (not e!751019))))

(declare-fun lt!586146 () ListLongMap!20805)

(assert (=> d!142553 (= res!873938 (contains!8568 lt!586146 (_1!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun lt!586147 () List!30286)

(assert (=> d!142553 (= lt!586146 (ListLongMap!20806 lt!586147))))

(declare-fun lt!586148 () Unit!43400)

(declare-fun lt!586145 () Unit!43400)

(assert (=> d!142553 (= lt!586148 lt!586145)))

(assert (=> d!142553 (= (getValueByKey!711 lt!586147 (_1!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142553 (= lt!586145 (lemmaContainsTupThenGetReturnValue!356 lt!586147 (_1!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142553 (= lt!586147 (insertStrictlySorted!485 (toList!10418 call!64661) (_1!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142553 (= (+!4496 call!64661 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) lt!586146)))

(declare-fun b!1316515 () Bool)

(declare-fun res!873937 () Bool)

(assert (=> b!1316515 (=> (not res!873937) (not e!751019))))

(assert (=> b!1316515 (= res!873937 (= (getValueByKey!711 (toList!10418 lt!586146) (_1!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun b!1316516 () Bool)

(assert (=> b!1316516 (= e!751019 (contains!8571 (toList!10418 lt!586146) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(assert (= (and d!142553 res!873938) b!1316515))

(assert (= (and b!1316515 res!873937) b!1316516))

(declare-fun m!1204449 () Bool)

(assert (=> d!142553 m!1204449))

(declare-fun m!1204451 () Bool)

(assert (=> d!142553 m!1204451))

(declare-fun m!1204453 () Bool)

(assert (=> d!142553 m!1204453))

(declare-fun m!1204455 () Bool)

(assert (=> d!142553 m!1204455))

(declare-fun m!1204457 () Bool)

(assert (=> b!1316515 m!1204457))

(declare-fun m!1204459 () Bool)

(assert (=> b!1316516 m!1204459))

(assert (=> b!1316448 d!142553))

(declare-fun b!1316541 () Bool)

(assert (=> b!1316541 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43242 _keys!1628)))))

(assert (=> b!1316541 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43243 _values!1354)))))

(declare-fun lt!586168 () ListLongMap!20805)

(declare-fun e!751037 () Bool)

(assert (=> b!1316541 (= e!751037 (= (apply!1028 lt!586168 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (get!21455 (select (arr!42693 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316542 () Bool)

(declare-fun lt!586165 () Unit!43400)

(declare-fun lt!586166 () Unit!43400)

(assert (=> b!1316542 (= lt!586165 lt!586166)))

(declare-fun lt!586163 () (_ BitVec 64))

(declare-fun lt!586167 () ListLongMap!20805)

(declare-fun lt!586164 () V!52747)

(declare-fun lt!586169 () (_ BitVec 64))

(assert (=> b!1316542 (not (contains!8568 (+!4496 lt!586167 (tuple2!23149 lt!586169 lt!586164)) lt!586163))))

(declare-fun addStillNotContains!492 (ListLongMap!20805 (_ BitVec 64) V!52747 (_ BitVec 64)) Unit!43400)

(assert (=> b!1316542 (= lt!586166 (addStillNotContains!492 lt!586167 lt!586169 lt!586164 lt!586163))))

(assert (=> b!1316542 (= lt!586163 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1316542 (= lt!586164 (get!21455 (select (arr!42693 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1316542 (= lt!586169 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(declare-fun call!64670 () ListLongMap!20805)

(assert (=> b!1316542 (= lt!586167 call!64670)))

(declare-fun e!751035 () ListLongMap!20805)

(assert (=> b!1316542 (= e!751035 (+!4496 call!64670 (tuple2!23149 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)) (get!21455 (select (arr!42693 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1316543 () Bool)

(assert (=> b!1316543 (= e!751035 call!64670)))

(declare-fun b!1316544 () Bool)

(declare-fun e!751040 () ListLongMap!20805)

(assert (=> b!1316544 (= e!751040 (ListLongMap!20806 Nil!30283))))

(declare-fun b!1316545 () Bool)

(declare-fun e!751036 () Bool)

(declare-fun isEmpty!1074 (ListLongMap!20805) Bool)

(assert (=> b!1316545 (= e!751036 (isEmpty!1074 lt!586168))))

(declare-fun b!1316546 () Bool)

(declare-fun e!751034 () Bool)

(assert (=> b!1316546 (= e!751034 e!751037)))

(assert (=> b!1316546 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43242 _keys!1628)))))

(declare-fun res!873949 () Bool)

(assert (=> b!1316546 (= res!873949 (contains!8568 lt!586168 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1316546 (=> (not res!873949) (not e!751037))))

(declare-fun bm!64667 () Bool)

(assert (=> bm!64667 (= call!64670 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020 #b00000000000000000000000000000001) defaultEntry!1357))))

(declare-fun b!1316547 () Bool)

(assert (=> b!1316547 (= e!751036 (= lt!586168 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020 #b00000000000000000000000000000001) defaultEntry!1357)))))

(declare-fun d!142555 () Bool)

(declare-fun e!751039 () Bool)

(assert (=> d!142555 e!751039))

(declare-fun res!873950 () Bool)

(assert (=> d!142555 (=> (not res!873950) (not e!751039))))

(assert (=> d!142555 (= res!873950 (not (contains!8568 lt!586168 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142555 (= lt!586168 e!751040)))

(declare-fun c!125600 () Bool)

(assert (=> d!142555 (= c!125600 (bvsge (bvadd #b00000000000000000000000000000001 from!2020) (size!43242 _keys!1628)))))

(assert (=> d!142555 (validMask!0 mask!2040)))

(assert (=> d!142555 (= (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) lt!586168)))

(declare-fun b!1316548 () Bool)

(assert (=> b!1316548 (= e!751039 e!751034)))

(declare-fun c!125601 () Bool)

(declare-fun e!751038 () Bool)

(assert (=> b!1316548 (= c!125601 e!751038)))

(declare-fun res!873948 () Bool)

(assert (=> b!1316548 (=> (not res!873948) (not e!751038))))

(assert (=> b!1316548 (= res!873948 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43242 _keys!1628)))))

(declare-fun b!1316549 () Bool)

(assert (=> b!1316549 (= e!751034 e!751036)))

(declare-fun c!125599 () Bool)

(assert (=> b!1316549 (= c!125599 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43242 _keys!1628)))))

(declare-fun b!1316550 () Bool)

(declare-fun res!873947 () Bool)

(assert (=> b!1316550 (=> (not res!873947) (not e!751039))))

(assert (=> b!1316550 (= res!873947 (not (contains!8568 lt!586168 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1316551 () Bool)

(assert (=> b!1316551 (= e!751040 e!751035)))

(declare-fun c!125602 () Bool)

(assert (=> b!1316551 (= c!125602 (validKeyInArray!0 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun b!1316552 () Bool)

(assert (=> b!1316552 (= e!751038 (validKeyInArray!0 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1316552 (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))

(assert (= (and d!142555 c!125600) b!1316544))

(assert (= (and d!142555 (not c!125600)) b!1316551))

(assert (= (and b!1316551 c!125602) b!1316542))

(assert (= (and b!1316551 (not c!125602)) b!1316543))

(assert (= (or b!1316542 b!1316543) bm!64667))

(assert (= (and d!142555 res!873950) b!1316550))

(assert (= (and b!1316550 res!873947) b!1316548))

(assert (= (and b!1316548 res!873948) b!1316552))

(assert (= (and b!1316548 c!125601) b!1316546))

(assert (= (and b!1316548 (not c!125601)) b!1316549))

(assert (= (and b!1316546 res!873949) b!1316541))

(assert (= (and b!1316549 c!125599) b!1316547))

(assert (= (and b!1316549 (not c!125599)) b!1316545))

(declare-fun b_lambda!23371 () Bool)

(assert (=> (not b_lambda!23371) (not b!1316541)))

(assert (=> b!1316541 t!43897))

(declare-fun b_and!48219 () Bool)

(assert (= b_and!48217 (and (=> t!43897 result!23865) b_and!48219)))

(declare-fun b_lambda!23373 () Bool)

(assert (=> (not b_lambda!23373) (not b!1316542)))

(assert (=> b!1316542 t!43897))

(declare-fun b_and!48221 () Bool)

(assert (= b_and!48219 (and (=> t!43897 result!23865) b_and!48221)))

(declare-fun m!1204461 () Bool)

(assert (=> b!1316550 m!1204461))

(assert (=> b!1316546 m!1204267))

(assert (=> b!1316546 m!1204267))

(declare-fun m!1204463 () Bool)

(assert (=> b!1316546 m!1204463))

(declare-fun m!1204465 () Bool)

(assert (=> b!1316547 m!1204465))

(declare-fun m!1204467 () Bool)

(assert (=> d!142555 m!1204467))

(assert (=> d!142555 m!1204217))

(assert (=> b!1316552 m!1204267))

(assert (=> b!1316552 m!1204267))

(assert (=> b!1316552 m!1204269))

(assert (=> b!1316542 m!1204275))

(assert (=> b!1316542 m!1204273))

(assert (=> b!1316542 m!1204277))

(assert (=> b!1316542 m!1204275))

(declare-fun m!1204469 () Bool)

(assert (=> b!1316542 m!1204469))

(declare-fun m!1204471 () Bool)

(assert (=> b!1316542 m!1204471))

(declare-fun m!1204473 () Bool)

(assert (=> b!1316542 m!1204473))

(assert (=> b!1316542 m!1204273))

(assert (=> b!1316542 m!1204469))

(assert (=> b!1316542 m!1204267))

(declare-fun m!1204475 () Bool)

(assert (=> b!1316542 m!1204475))

(assert (=> bm!64667 m!1204465))

(assert (=> b!1316541 m!1204275))

(assert (=> b!1316541 m!1204273))

(assert (=> b!1316541 m!1204277))

(assert (=> b!1316541 m!1204275))

(assert (=> b!1316541 m!1204273))

(assert (=> b!1316541 m!1204267))

(declare-fun m!1204477 () Bool)

(assert (=> b!1316541 m!1204477))

(assert (=> b!1316541 m!1204267))

(declare-fun m!1204479 () Bool)

(assert (=> b!1316545 m!1204479))

(assert (=> b!1316551 m!1204267))

(assert (=> b!1316551 m!1204267))

(assert (=> b!1316551 m!1204269))

(assert (=> bm!64648 d!142555))

(declare-fun b!1316553 () Bool)

(declare-fun e!751041 () Bool)

(declare-fun call!64671 () Bool)

(assert (=> b!1316553 (= e!751041 call!64671)))

(declare-fun d!142557 () Bool)

(declare-fun res!873951 () Bool)

(declare-fun e!751042 () Bool)

(assert (=> d!142557 (=> res!873951 e!751042)))

(assert (=> d!142557 (= res!873951 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43242 _keys!1628)))))

(assert (=> d!142557 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040) e!751042)))

(declare-fun bm!64668 () Bool)

(assert (=> bm!64668 (= call!64671 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun b!1316554 () Bool)

(declare-fun e!751043 () Bool)

(assert (=> b!1316554 (= e!751043 call!64671)))

(declare-fun b!1316555 () Bool)

(assert (=> b!1316555 (= e!751041 e!751043)))

(declare-fun lt!586170 () (_ BitVec 64))

(assert (=> b!1316555 (= lt!586170 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!586171 () Unit!43400)

(assert (=> b!1316555 (= lt!586171 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!586170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1316555 (arrayContainsKey!0 _keys!1628 lt!586170 #b00000000000000000000000000000000)))

(declare-fun lt!586172 () Unit!43400)

(assert (=> b!1316555 (= lt!586172 lt!586171)))

(declare-fun res!873952 () Bool)

(assert (=> b!1316555 (= res!873952 (= (seekEntryOrOpen!0 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1628 mask!2040) (Found!10035 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1316555 (=> (not res!873952) (not e!751043))))

(declare-fun b!1316556 () Bool)

(assert (=> b!1316556 (= e!751042 e!751041)))

(declare-fun c!125603 () Bool)

(assert (=> b!1316556 (= c!125603 (validKeyInArray!0 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!142557 (not res!873951)) b!1316556))

(assert (= (and b!1316556 c!125603) b!1316555))

(assert (= (and b!1316556 (not c!125603)) b!1316553))

(assert (= (and b!1316555 res!873952) b!1316554))

(assert (= (or b!1316554 b!1316553) bm!64668))

(declare-fun m!1204481 () Bool)

(assert (=> bm!64668 m!1204481))

(assert (=> b!1316555 m!1204431))

(declare-fun m!1204483 () Bool)

(assert (=> b!1316555 m!1204483))

(declare-fun m!1204485 () Bool)

(assert (=> b!1316555 m!1204485))

(assert (=> b!1316555 m!1204431))

(declare-fun m!1204487 () Bool)

(assert (=> b!1316555 m!1204487))

(assert (=> b!1316556 m!1204431))

(assert (=> b!1316556 m!1204431))

(assert (=> b!1316556 m!1204435))

(assert (=> bm!64653 d!142557))

(declare-fun d!142559 () Bool)

(assert (=> d!142559 (arrayContainsKey!0 _keys!1628 lt!586093 #b00000000000000000000000000000000)))

(declare-fun lt!586175 () Unit!43400)

(declare-fun choose!13 (array!88424 (_ BitVec 64) (_ BitVec 32)) Unit!43400)

(assert (=> d!142559 (= lt!586175 (choose!13 _keys!1628 lt!586093 #b00000000000000000000000000000000))))

(assert (=> d!142559 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!142559 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!586093 #b00000000000000000000000000000000) lt!586175)))

(declare-fun bs!37600 () Bool)

(assert (= bs!37600 d!142559))

(assert (=> bs!37600 m!1204329))

(declare-fun m!1204489 () Bool)

(assert (=> bs!37600 m!1204489))

(assert (=> b!1316425 d!142559))

(declare-fun d!142561 () Bool)

(declare-fun res!873957 () Bool)

(declare-fun e!751048 () Bool)

(assert (=> d!142561 (=> res!873957 e!751048)))

(assert (=> d!142561 (= res!873957 (= (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) lt!586093))))

(assert (=> d!142561 (= (arrayContainsKey!0 _keys!1628 lt!586093 #b00000000000000000000000000000000) e!751048)))

(declare-fun b!1316561 () Bool)

(declare-fun e!751049 () Bool)

(assert (=> b!1316561 (= e!751048 e!751049)))

(declare-fun res!873958 () Bool)

(assert (=> b!1316561 (=> (not res!873958) (not e!751049))))

(assert (=> b!1316561 (= res!873958 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43242 _keys!1628)))))

(declare-fun b!1316562 () Bool)

(assert (=> b!1316562 (= e!751049 (arrayContainsKey!0 _keys!1628 lt!586093 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!142561 (not res!873957)) b!1316561))

(assert (= (and b!1316561 res!873958) b!1316562))

(assert (=> d!142561 m!1204325))

(declare-fun m!1204491 () Bool)

(assert (=> b!1316562 m!1204491))

(assert (=> b!1316425 d!142561))

(declare-fun b!1316575 () Bool)

(declare-fun e!751056 () SeekEntryResult!10035)

(declare-fun e!751057 () SeekEntryResult!10035)

(assert (=> b!1316575 (= e!751056 e!751057)))

(declare-fun lt!586184 () (_ BitVec 64))

(declare-fun lt!586183 () SeekEntryResult!10035)

(assert (=> b!1316575 (= lt!586184 (select (arr!42692 _keys!1628) (index!42513 lt!586183)))))

(declare-fun c!125610 () Bool)

(assert (=> b!1316575 (= c!125610 (= lt!586184 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun e!751058 () SeekEntryResult!10035)

(declare-fun b!1316576 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!88424 (_ BitVec 32)) SeekEntryResult!10035)

(assert (=> b!1316576 (= e!751058 (seekKeyOrZeroReturnVacant!0 (x!117025 lt!586183) (index!42513 lt!586183) (index!42513 lt!586183) (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040))))

(declare-fun b!1316578 () Bool)

(assert (=> b!1316578 (= e!751058 (MissingZero!10035 (index!42513 lt!586183)))))

(declare-fun d!142563 () Bool)

(declare-fun lt!586182 () SeekEntryResult!10035)

(assert (=> d!142563 (and (or ((_ is Undefined!10035) lt!586182) (not ((_ is Found!10035) lt!586182)) (and (bvsge (index!42512 lt!586182) #b00000000000000000000000000000000) (bvslt (index!42512 lt!586182) (size!43242 _keys!1628)))) (or ((_ is Undefined!10035) lt!586182) ((_ is Found!10035) lt!586182) (not ((_ is MissingZero!10035) lt!586182)) (and (bvsge (index!42511 lt!586182) #b00000000000000000000000000000000) (bvslt (index!42511 lt!586182) (size!43242 _keys!1628)))) (or ((_ is Undefined!10035) lt!586182) ((_ is Found!10035) lt!586182) ((_ is MissingZero!10035) lt!586182) (not ((_ is MissingVacant!10035) lt!586182)) (and (bvsge (index!42514 lt!586182) #b00000000000000000000000000000000) (bvslt (index!42514 lt!586182) (size!43242 _keys!1628)))) (or ((_ is Undefined!10035) lt!586182) (ite ((_ is Found!10035) lt!586182) (= (select (arr!42692 _keys!1628) (index!42512 lt!586182)) (select (arr!42692 _keys!1628) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10035) lt!586182) (= (select (arr!42692 _keys!1628) (index!42511 lt!586182)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10035) lt!586182) (= (select (arr!42692 _keys!1628) (index!42514 lt!586182)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142563 (= lt!586182 e!751056)))

(declare-fun c!125612 () Bool)

(assert (=> d!142563 (= c!125612 (and ((_ is Intermediate!10035) lt!586183) (undefined!10847 lt!586183)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!88424 (_ BitVec 32)) SeekEntryResult!10035)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!142563 (= lt!586183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) mask!2040) (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040))))

(assert (=> d!142563 (validMask!0 mask!2040)))

(assert (=> d!142563 (= (seekEntryOrOpen!0 (select (arr!42692 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) lt!586182)))

(declare-fun b!1316577 () Bool)

(declare-fun c!125611 () Bool)

(assert (=> b!1316577 (= c!125611 (= lt!586184 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1316577 (= e!751057 e!751058)))

(declare-fun b!1316579 () Bool)

(assert (=> b!1316579 (= e!751057 (Found!10035 (index!42513 lt!586183)))))

(declare-fun b!1316580 () Bool)

(assert (=> b!1316580 (= e!751056 Undefined!10035)))

(assert (= (and d!142563 c!125612) b!1316580))

(assert (= (and d!142563 (not c!125612)) b!1316575))

(assert (= (and b!1316575 c!125610) b!1316579))

(assert (= (and b!1316575 (not c!125610)) b!1316577))

(assert (= (and b!1316577 c!125611) b!1316578))

(assert (= (and b!1316577 (not c!125611)) b!1316576))

(declare-fun m!1204493 () Bool)

(assert (=> b!1316575 m!1204493))

(assert (=> b!1316576 m!1204325))

(declare-fun m!1204495 () Bool)

(assert (=> b!1316576 m!1204495))

(declare-fun m!1204497 () Bool)

(assert (=> d!142563 m!1204497))

(declare-fun m!1204499 () Bool)

(assert (=> d!142563 m!1204499))

(assert (=> d!142563 m!1204217))

(declare-fun m!1204501 () Bool)

(assert (=> d!142563 m!1204501))

(assert (=> d!142563 m!1204325))

(declare-fun m!1204503 () Bool)

(assert (=> d!142563 m!1204503))

(assert (=> d!142563 m!1204503))

(assert (=> d!142563 m!1204325))

(declare-fun m!1204505 () Bool)

(assert (=> d!142563 m!1204505))

(assert (=> b!1316425 d!142563))

(declare-fun d!142565 () Bool)

(declare-fun e!751059 () Bool)

(assert (=> d!142565 e!751059))

(declare-fun res!873959 () Bool)

(assert (=> d!142565 (=> res!873959 e!751059)))

(declare-fun lt!586187 () Bool)

(assert (=> d!142565 (= res!873959 (not lt!586187))))

(declare-fun lt!586185 () Bool)

(assert (=> d!142565 (= lt!586187 lt!586185)))

(declare-fun lt!586186 () Unit!43400)

(declare-fun e!751060 () Unit!43400)

(assert (=> d!142565 (= lt!586186 e!751060)))

(declare-fun c!125613 () Bool)

(assert (=> d!142565 (= c!125613 lt!586185)))

(assert (=> d!142565 (= lt!586185 (containsKey!733 (toList!10418 lt!586078) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142565 (= (contains!8568 lt!586078 #b0000000000000000000000000000000000000000000000000000000000000000) lt!586187)))

(declare-fun b!1316581 () Bool)

(declare-fun lt!586188 () Unit!43400)

(assert (=> b!1316581 (= e!751060 lt!586188)))

(assert (=> b!1316581 (= lt!586188 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 lt!586078) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1316581 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586078) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316582 () Bool)

(declare-fun Unit!43408 () Unit!43400)

(assert (=> b!1316582 (= e!751060 Unit!43408)))

(declare-fun b!1316583 () Bool)

(assert (=> b!1316583 (= e!751059 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586078) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142565 c!125613) b!1316581))

(assert (= (and d!142565 (not c!125613)) b!1316582))

(assert (= (and d!142565 (not res!873959)) b!1316583))

(declare-fun m!1204507 () Bool)

(assert (=> d!142565 m!1204507))

(declare-fun m!1204509 () Bool)

(assert (=> b!1316581 m!1204509))

(declare-fun m!1204511 () Bool)

(assert (=> b!1316581 m!1204511))

(assert (=> b!1316581 m!1204511))

(declare-fun m!1204513 () Bool)

(assert (=> b!1316581 m!1204513))

(assert (=> b!1316583 m!1204511))

(assert (=> b!1316583 m!1204511))

(assert (=> b!1316583 m!1204513))

(assert (=> bm!64649 d!142565))

(declare-fun d!142567 () Bool)

(declare-fun get!21456 (Option!763) V!52747)

(assert (=> d!142567 (= (apply!1028 lt!586113 (select (arr!42692 _keys!1628) from!2020)) (get!21456 (getValueByKey!711 (toList!10418 lt!586113) (select (arr!42692 _keys!1628) from!2020))))))

(declare-fun bs!37601 () Bool)

(assert (= bs!37601 d!142567))

(assert (=> bs!37601 m!1204223))

(declare-fun m!1204515 () Bool)

(assert (=> bs!37601 m!1204515))

(assert (=> bs!37601 m!1204515))

(declare-fun m!1204517 () Bool)

(assert (=> bs!37601 m!1204517))

(assert (=> b!1316464 d!142567))

(declare-fun d!142569 () Bool)

(declare-fun c!125616 () Bool)

(assert (=> d!142569 (= c!125616 ((_ is ValueCellFull!16968) (select (arr!42693 _values!1354) from!2020)))))

(declare-fun e!751063 () V!52747)

(assert (=> d!142569 (= (get!21455 (select (arr!42693 _values!1354) from!2020) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)) e!751063)))

(declare-fun b!1316588 () Bool)

(declare-fun get!21457 (ValueCell!16968 V!52747) V!52747)

(assert (=> b!1316588 (= e!751063 (get!21457 (select (arr!42693 _values!1354) from!2020) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1316589 () Bool)

(declare-fun get!21458 (ValueCell!16968 V!52747) V!52747)

(assert (=> b!1316589 (= e!751063 (get!21458 (select (arr!42693 _values!1354) from!2020) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142569 c!125616) b!1316588))

(assert (= (and d!142569 (not c!125616)) b!1316589))

(assert (=> b!1316588 m!1204351))

(assert (=> b!1316588 m!1204273))

(declare-fun m!1204519 () Bool)

(assert (=> b!1316588 m!1204519))

(assert (=> b!1316589 m!1204351))

(assert (=> b!1316589 m!1204273))

(declare-fun m!1204521 () Bool)

(assert (=> b!1316589 m!1204521))

(assert (=> b!1316464 d!142569))

(declare-fun d!142571 () Bool)

(declare-fun e!751064 () Bool)

(assert (=> d!142571 e!751064))

(declare-fun res!873961 () Bool)

(assert (=> d!142571 (=> (not res!873961) (not e!751064))))

(declare-fun lt!586190 () ListLongMap!20805)

(assert (=> d!142571 (= res!873961 (contains!8568 lt!586190 (_1!11585 (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun lt!586191 () List!30286)

(assert (=> d!142571 (= lt!586190 (ListLongMap!20806 lt!586191))))

(declare-fun lt!586192 () Unit!43400)

(declare-fun lt!586189 () Unit!43400)

(assert (=> d!142571 (= lt!586192 lt!586189)))

(assert (=> d!142571 (= (getValueByKey!711 lt!586191 (_1!11585 (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!762 (_2!11585 (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!142571 (= lt!586189 (lemmaContainsTupThenGetReturnValue!356 lt!586191 (_1!11585 (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11585 (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!142571 (= lt!586191 (insertStrictlySorted!485 (toList!10418 (ite c!125565 call!64653 (ite c!125564 call!64651 call!64647))) (_1!11585 (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11585 (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!142571 (= (+!4496 (ite c!125565 call!64653 (ite c!125564 call!64651 call!64647)) (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) lt!586190)))

(declare-fun b!1316590 () Bool)

(declare-fun res!873960 () Bool)

(assert (=> b!1316590 (=> (not res!873960) (not e!751064))))

(assert (=> b!1316590 (= res!873960 (= (getValueByKey!711 (toList!10418 lt!586190) (_1!11585 (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!762 (_2!11585 (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))))

(declare-fun b!1316591 () Bool)

(assert (=> b!1316591 (= e!751064 (contains!8571 (toList!10418 lt!586190) (ite (or c!125565 c!125564) (tuple2!23149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (= (and d!142571 res!873961) b!1316590))

(assert (= (and b!1316590 res!873960) b!1316591))

(declare-fun m!1204523 () Bool)

(assert (=> d!142571 m!1204523))

(declare-fun m!1204525 () Bool)

(assert (=> d!142571 m!1204525))

(declare-fun m!1204527 () Bool)

(assert (=> d!142571 m!1204527))

(declare-fun m!1204529 () Bool)

(assert (=> d!142571 m!1204529))

(declare-fun m!1204531 () Bool)

(assert (=> b!1316590 m!1204531))

(declare-fun m!1204533 () Bool)

(assert (=> b!1316591 m!1204533))

(assert (=> bm!64647 d!142571))

(declare-fun d!142573 () Bool)

(declare-fun e!751065 () Bool)

(assert (=> d!142573 e!751065))

(declare-fun res!873962 () Bool)

(assert (=> d!142573 (=> res!873962 e!751065)))

(declare-fun lt!586195 () Bool)

(assert (=> d!142573 (= res!873962 (not lt!586195))))

(declare-fun lt!586193 () Bool)

(assert (=> d!142573 (= lt!586195 lt!586193)))

(declare-fun lt!586194 () Unit!43400)

(declare-fun e!751066 () Unit!43400)

(assert (=> d!142573 (= lt!586194 e!751066)))

(declare-fun c!125617 () Bool)

(assert (=> d!142573 (= c!125617 lt!586193)))

(assert (=> d!142573 (= lt!586193 (containsKey!733 (toList!10418 lt!586113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142573 (= (contains!8568 lt!586113 #b0000000000000000000000000000000000000000000000000000000000000000) lt!586195)))

(declare-fun b!1316592 () Bool)

(declare-fun lt!586196 () Unit!43400)

(assert (=> b!1316592 (= e!751066 lt!586196)))

(assert (=> b!1316592 (= lt!586196 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 lt!586113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1316592 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316593 () Bool)

(declare-fun Unit!43409 () Unit!43400)

(assert (=> b!1316593 (= e!751066 Unit!43409)))

(declare-fun b!1316594 () Bool)

(assert (=> b!1316594 (= e!751065 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586113) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142573 c!125617) b!1316592))

(assert (= (and d!142573 (not c!125617)) b!1316593))

(assert (= (and d!142573 (not res!873962)) b!1316594))

(declare-fun m!1204535 () Bool)

(assert (=> d!142573 m!1204535))

(declare-fun m!1204537 () Bool)

(assert (=> b!1316592 m!1204537))

(declare-fun m!1204539 () Bool)

(assert (=> b!1316592 m!1204539))

(assert (=> b!1316592 m!1204539))

(declare-fun m!1204541 () Bool)

(assert (=> b!1316592 m!1204541))

(assert (=> b!1316594 m!1204539))

(assert (=> b!1316594 m!1204539))

(assert (=> b!1316594 m!1204541))

(assert (=> bm!64662 d!142573))

(declare-fun b!1316595 () Bool)

(assert (=> b!1316595 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43242 _keys!1628)))))

(assert (=> b!1316595 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43243 _values!1354)))))

(declare-fun e!751070 () Bool)

(declare-fun lt!586202 () ListLongMap!20805)

(assert (=> b!1316595 (= e!751070 (= (apply!1028 lt!586202 (select (arr!42692 _keys!1628) from!2020)) (get!21455 (select (arr!42693 _values!1354) from!2020) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316596 () Bool)

(declare-fun lt!586199 () Unit!43400)

(declare-fun lt!586200 () Unit!43400)

(assert (=> b!1316596 (= lt!586199 lt!586200)))

(declare-fun lt!586201 () ListLongMap!20805)

(declare-fun lt!586203 () (_ BitVec 64))

(declare-fun lt!586198 () V!52747)

(declare-fun lt!586197 () (_ BitVec 64))

(assert (=> b!1316596 (not (contains!8568 (+!4496 lt!586201 (tuple2!23149 lt!586203 lt!586198)) lt!586197))))

(assert (=> b!1316596 (= lt!586200 (addStillNotContains!492 lt!586201 lt!586203 lt!586198 lt!586197))))

(assert (=> b!1316596 (= lt!586197 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1316596 (= lt!586198 (get!21455 (select (arr!42693 _values!1354) from!2020) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1316596 (= lt!586203 (select (arr!42692 _keys!1628) from!2020))))

(declare-fun call!64672 () ListLongMap!20805)

(assert (=> b!1316596 (= lt!586201 call!64672)))

(declare-fun e!751068 () ListLongMap!20805)

(assert (=> b!1316596 (= e!751068 (+!4496 call!64672 (tuple2!23149 (select (arr!42692 _keys!1628) from!2020) (get!21455 (select (arr!42693 _values!1354) from!2020) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1316597 () Bool)

(assert (=> b!1316597 (= e!751068 call!64672)))

(declare-fun b!1316598 () Bool)

(declare-fun e!751073 () ListLongMap!20805)

(assert (=> b!1316598 (= e!751073 (ListLongMap!20806 Nil!30283))))

(declare-fun b!1316599 () Bool)

(declare-fun e!751069 () Bool)

(assert (=> b!1316599 (= e!751069 (isEmpty!1074 lt!586202))))

(declare-fun b!1316600 () Bool)

(declare-fun e!751067 () Bool)

(assert (=> b!1316600 (= e!751067 e!751070)))

(assert (=> b!1316600 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43242 _keys!1628)))))

(declare-fun res!873965 () Bool)

(assert (=> b!1316600 (= res!873965 (contains!8568 lt!586202 (select (arr!42692 _keys!1628) from!2020)))))

(assert (=> b!1316600 (=> (not res!873965) (not e!751070))))

(declare-fun bm!64669 () Bool)

(assert (=> bm!64669 (= call!64672 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd from!2020 #b00000000000000000000000000000001) defaultEntry!1357))))

(declare-fun b!1316601 () Bool)

(assert (=> b!1316601 (= e!751069 (= lt!586202 (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd from!2020 #b00000000000000000000000000000001) defaultEntry!1357)))))

(declare-fun d!142575 () Bool)

(declare-fun e!751072 () Bool)

(assert (=> d!142575 e!751072))

(declare-fun res!873966 () Bool)

(assert (=> d!142575 (=> (not res!873966) (not e!751072))))

(assert (=> d!142575 (= res!873966 (not (contains!8568 lt!586202 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142575 (= lt!586202 e!751073)))

(declare-fun c!125619 () Bool)

(assert (=> d!142575 (= c!125619 (bvsge from!2020 (size!43242 _keys!1628)))))

(assert (=> d!142575 (validMask!0 mask!2040)))

(assert (=> d!142575 (= (getCurrentListMapNoExtraKeys!6131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) lt!586202)))

(declare-fun b!1316602 () Bool)

(assert (=> b!1316602 (= e!751072 e!751067)))

(declare-fun c!125620 () Bool)

(declare-fun e!751071 () Bool)

(assert (=> b!1316602 (= c!125620 e!751071)))

(declare-fun res!873964 () Bool)

(assert (=> b!1316602 (=> (not res!873964) (not e!751071))))

(assert (=> b!1316602 (= res!873964 (bvslt from!2020 (size!43242 _keys!1628)))))

(declare-fun b!1316603 () Bool)

(assert (=> b!1316603 (= e!751067 e!751069)))

(declare-fun c!125618 () Bool)

(assert (=> b!1316603 (= c!125618 (bvslt from!2020 (size!43242 _keys!1628)))))

(declare-fun b!1316604 () Bool)

(declare-fun res!873963 () Bool)

(assert (=> b!1316604 (=> (not res!873963) (not e!751072))))

(assert (=> b!1316604 (= res!873963 (not (contains!8568 lt!586202 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1316605 () Bool)

(assert (=> b!1316605 (= e!751073 e!751068)))

(declare-fun c!125621 () Bool)

(assert (=> b!1316605 (= c!125621 (validKeyInArray!0 (select (arr!42692 _keys!1628) from!2020)))))

(declare-fun b!1316606 () Bool)

(assert (=> b!1316606 (= e!751071 (validKeyInArray!0 (select (arr!42692 _keys!1628) from!2020)))))

(assert (=> b!1316606 (bvsge from!2020 #b00000000000000000000000000000000)))

(assert (= (and d!142575 c!125619) b!1316598))

(assert (= (and d!142575 (not c!125619)) b!1316605))

(assert (= (and b!1316605 c!125621) b!1316596))

(assert (= (and b!1316605 (not c!125621)) b!1316597))

(assert (= (or b!1316596 b!1316597) bm!64669))

(assert (= (and d!142575 res!873966) b!1316604))

(assert (= (and b!1316604 res!873963) b!1316602))

(assert (= (and b!1316602 res!873964) b!1316606))

(assert (= (and b!1316602 c!125620) b!1316600))

(assert (= (and b!1316602 (not c!125620)) b!1316603))

(assert (= (and b!1316600 res!873965) b!1316595))

(assert (= (and b!1316603 c!125618) b!1316601))

(assert (= (and b!1316603 (not c!125618)) b!1316599))

(declare-fun b_lambda!23375 () Bool)

(assert (=> (not b_lambda!23375) (not b!1316595)))

(assert (=> b!1316595 t!43897))

(declare-fun b_and!48223 () Bool)

(assert (= b_and!48221 (and (=> t!43897 result!23865) b_and!48223)))

(declare-fun b_lambda!23377 () Bool)

(assert (=> (not b_lambda!23377) (not b!1316596)))

(assert (=> b!1316596 t!43897))

(declare-fun b_and!48225 () Bool)

(assert (= b_and!48223 (and (=> t!43897 result!23865) b_and!48225)))

(declare-fun m!1204543 () Bool)

(assert (=> b!1316604 m!1204543))

(assert (=> b!1316600 m!1204223))

(assert (=> b!1316600 m!1204223))

(declare-fun m!1204545 () Bool)

(assert (=> b!1316600 m!1204545))

(declare-fun m!1204547 () Bool)

(assert (=> b!1316601 m!1204547))

(declare-fun m!1204549 () Bool)

(assert (=> d!142575 m!1204549))

(assert (=> d!142575 m!1204217))

(assert (=> b!1316606 m!1204223))

(assert (=> b!1316606 m!1204223))

(assert (=> b!1316606 m!1204225))

(assert (=> b!1316596 m!1204351))

(assert (=> b!1316596 m!1204273))

(assert (=> b!1316596 m!1204353))

(assert (=> b!1316596 m!1204351))

(declare-fun m!1204551 () Bool)

(assert (=> b!1316596 m!1204551))

(declare-fun m!1204553 () Bool)

(assert (=> b!1316596 m!1204553))

(declare-fun m!1204555 () Bool)

(assert (=> b!1316596 m!1204555))

(assert (=> b!1316596 m!1204273))

(assert (=> b!1316596 m!1204551))

(assert (=> b!1316596 m!1204223))

(declare-fun m!1204557 () Bool)

(assert (=> b!1316596 m!1204557))

(assert (=> bm!64669 m!1204547))

(assert (=> b!1316595 m!1204351))

(assert (=> b!1316595 m!1204273))

(assert (=> b!1316595 m!1204353))

(assert (=> b!1316595 m!1204351))

(assert (=> b!1316595 m!1204273))

(assert (=> b!1316595 m!1204223))

(declare-fun m!1204559 () Bool)

(assert (=> b!1316595 m!1204559))

(assert (=> b!1316595 m!1204223))

(declare-fun m!1204561 () Bool)

(assert (=> b!1316599 m!1204561))

(assert (=> b!1316605 m!1204223))

(assert (=> b!1316605 m!1204223))

(assert (=> b!1316605 m!1204225))

(assert (=> bm!64661 d!142575))

(declare-fun d!142577 () Bool)

(declare-fun e!751074 () Bool)

(assert (=> d!142577 e!751074))

(declare-fun res!873967 () Bool)

(assert (=> d!142577 (=> res!873967 e!751074)))

(declare-fun lt!586206 () Bool)

(assert (=> d!142577 (= res!873967 (not lt!586206))))

(declare-fun lt!586204 () Bool)

(assert (=> d!142577 (= lt!586206 lt!586204)))

(declare-fun lt!586205 () Unit!43400)

(declare-fun e!751075 () Unit!43400)

(assert (=> d!142577 (= lt!586205 e!751075)))

(declare-fun c!125622 () Bool)

(assert (=> d!142577 (= c!125622 lt!586204)))

(assert (=> d!142577 (= lt!586204 (containsKey!733 (toList!10418 lt!586078) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142577 (= (contains!8568 lt!586078 #b1000000000000000000000000000000000000000000000000000000000000000) lt!586206)))

(declare-fun b!1316607 () Bool)

(declare-fun lt!586207 () Unit!43400)

(assert (=> b!1316607 (= e!751075 lt!586207)))

(assert (=> b!1316607 (= lt!586207 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 lt!586078) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1316607 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586078) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316608 () Bool)

(declare-fun Unit!43410 () Unit!43400)

(assert (=> b!1316608 (= e!751075 Unit!43410)))

(declare-fun b!1316609 () Bool)

(assert (=> b!1316609 (= e!751074 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142577 c!125622) b!1316607))

(assert (= (and d!142577 (not c!125622)) b!1316608))

(assert (= (and d!142577 (not res!873967)) b!1316609))

(declare-fun m!1204563 () Bool)

(assert (=> d!142577 m!1204563))

(declare-fun m!1204565 () Bool)

(assert (=> b!1316607 m!1204565))

(declare-fun m!1204567 () Bool)

(assert (=> b!1316607 m!1204567))

(assert (=> b!1316607 m!1204567))

(declare-fun m!1204569 () Bool)

(assert (=> b!1316607 m!1204569))

(assert (=> b!1316609 m!1204567))

(assert (=> b!1316609 m!1204567))

(assert (=> b!1316609 m!1204569))

(assert (=> bm!64644 d!142577))

(assert (=> b!1316447 d!142515))

(declare-fun d!142579 () Bool)

(assert (=> d!142579 (isDefined!518 (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(declare-fun lt!586210 () Unit!43400)

(declare-fun choose!1942 (List!30286 (_ BitVec 64)) Unit!43400)

(assert (=> d!142579 (= lt!586210 (choose!1942 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(declare-fun e!751078 () Bool)

(assert (=> d!142579 e!751078))

(declare-fun res!873970 () Bool)

(assert (=> d!142579 (=> (not res!873970) (not e!751078))))

(declare-fun isStrictlySorted!875 (List!30286) Bool)

(assert (=> d!142579 (= res!873970 (isStrictlySorted!875 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))))

(assert (=> d!142579 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175) lt!586210)))

(declare-fun b!1316612 () Bool)

(assert (=> b!1316612 (= e!751078 (containsKey!733 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(assert (= (and d!142579 res!873970) b!1316612))

(assert (=> d!142579 m!1204261))

(assert (=> d!142579 m!1204261))

(assert (=> d!142579 m!1204263))

(declare-fun m!1204571 () Bool)

(assert (=> d!142579 m!1204571))

(declare-fun m!1204573 () Bool)

(assert (=> d!142579 m!1204573))

(assert (=> b!1316612 m!1204257))

(assert (=> b!1316347 d!142579))

(declare-fun d!142581 () Bool)

(assert (=> d!142581 (= (isDefined!518 (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175)) (not (isEmpty!1073 (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))))

(declare-fun bs!37602 () Bool)

(assert (= bs!37602 d!142581))

(assert (=> bs!37602 m!1204261))

(declare-fun m!1204575 () Bool)

(assert (=> bs!37602 m!1204575))

(assert (=> b!1316347 d!142581))

(declare-fun e!751080 () Option!763)

(declare-fun b!1316615 () Bool)

(assert (=> b!1316615 (= e!751080 (getValueByKey!711 (t!43892 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) k0!1175))))

(declare-fun e!751079 () Option!763)

(declare-fun b!1316613 () Bool)

(assert (=> b!1316613 (= e!751079 (Some!762 (_2!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))))))

(declare-fun c!125623 () Bool)

(declare-fun d!142583 () Bool)

(assert (=> d!142583 (= c!125623 (and ((_ is Cons!30282) (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (= (_1!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)))))

(assert (=> d!142583 (= (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175) e!751079)))

(declare-fun b!1316616 () Bool)

(assert (=> b!1316616 (= e!751080 None!761)))

(declare-fun b!1316614 () Bool)

(assert (=> b!1316614 (= e!751079 e!751080)))

(declare-fun c!125624 () Bool)

(assert (=> b!1316614 (= c!125624 (and ((_ is Cons!30282) (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (not (= (_1!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175))))))

(assert (= (and d!142583 c!125623) b!1316613))

(assert (= (and d!142583 (not c!125623)) b!1316614))

(assert (= (and b!1316614 c!125624) b!1316615))

(assert (= (and b!1316614 (not c!125624)) b!1316616))

(declare-fun m!1204577 () Bool)

(assert (=> b!1316615 m!1204577))

(assert (=> b!1316347 d!142583))

(declare-fun d!142585 () Bool)

(assert (=> d!142585 (= (apply!1028 lt!586113 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21456 (getValueByKey!711 (toList!10418 lt!586113) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37603 () Bool)

(assert (= bs!37603 d!142585))

(assert (=> bs!37603 m!1204539))

(assert (=> bs!37603 m!1204539))

(declare-fun m!1204579 () Bool)

(assert (=> bs!37603 m!1204579))

(assert (=> b!1316452 d!142585))

(assert (=> b!1316349 d!142581))

(assert (=> b!1316349 d!142583))

(declare-fun d!142587 () Bool)

(assert (=> d!142587 (= (apply!1028 (+!4496 lt!586080 (tuple2!23149 lt!586085 minValue!1296)) lt!586072) (get!21456 (getValueByKey!711 (toList!10418 (+!4496 lt!586080 (tuple2!23149 lt!586085 minValue!1296))) lt!586072)))))

(declare-fun bs!37604 () Bool)

(assert (= bs!37604 d!142587))

(declare-fun m!1204581 () Bool)

(assert (=> bs!37604 m!1204581))

(assert (=> bs!37604 m!1204581))

(declare-fun m!1204583 () Bool)

(assert (=> bs!37604 m!1204583))

(assert (=> b!1316398 d!142587))

(declare-fun d!142589 () Bool)

(declare-fun e!751081 () Bool)

(assert (=> d!142589 e!751081))

(declare-fun res!873972 () Bool)

(assert (=> d!142589 (=> (not res!873972) (not e!751081))))

(declare-fun lt!586212 () ListLongMap!20805)

(assert (=> d!142589 (= res!873972 (contains!8568 lt!586212 (_1!11585 (tuple2!23149 lt!586070 minValue!1296))))))

(declare-fun lt!586213 () List!30286)

(assert (=> d!142589 (= lt!586212 (ListLongMap!20806 lt!586213))))

(declare-fun lt!586214 () Unit!43400)

(declare-fun lt!586211 () Unit!43400)

(assert (=> d!142589 (= lt!586214 lt!586211)))

(assert (=> d!142589 (= (getValueByKey!711 lt!586213 (_1!11585 (tuple2!23149 lt!586070 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586070 minValue!1296))))))

(assert (=> d!142589 (= lt!586211 (lemmaContainsTupThenGetReturnValue!356 lt!586213 (_1!11585 (tuple2!23149 lt!586070 minValue!1296)) (_2!11585 (tuple2!23149 lt!586070 minValue!1296))))))

(assert (=> d!142589 (= lt!586213 (insertStrictlySorted!485 (toList!10418 lt!586074) (_1!11585 (tuple2!23149 lt!586070 minValue!1296)) (_2!11585 (tuple2!23149 lt!586070 minValue!1296))))))

(assert (=> d!142589 (= (+!4496 lt!586074 (tuple2!23149 lt!586070 minValue!1296)) lt!586212)))

(declare-fun b!1316617 () Bool)

(declare-fun res!873971 () Bool)

(assert (=> b!1316617 (=> (not res!873971) (not e!751081))))

(assert (=> b!1316617 (= res!873971 (= (getValueByKey!711 (toList!10418 lt!586212) (_1!11585 (tuple2!23149 lt!586070 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586070 minValue!1296)))))))

(declare-fun b!1316618 () Bool)

(assert (=> b!1316618 (= e!751081 (contains!8571 (toList!10418 lt!586212) (tuple2!23149 lt!586070 minValue!1296)))))

(assert (= (and d!142589 res!873972) b!1316617))

(assert (= (and b!1316617 res!873971) b!1316618))

(declare-fun m!1204585 () Bool)

(assert (=> d!142589 m!1204585))

(declare-fun m!1204587 () Bool)

(assert (=> d!142589 m!1204587))

(declare-fun m!1204589 () Bool)

(assert (=> d!142589 m!1204589))

(declare-fun m!1204591 () Bool)

(assert (=> d!142589 m!1204591))

(declare-fun m!1204593 () Bool)

(assert (=> b!1316617 m!1204593))

(declare-fun m!1204595 () Bool)

(assert (=> b!1316618 m!1204595))

(assert (=> b!1316398 d!142589))

(declare-fun d!142591 () Bool)

(assert (=> d!142591 (= (apply!1028 (+!4496 lt!586065 (tuple2!23149 lt!586082 zeroValue!1296)) lt!586068) (apply!1028 lt!586065 lt!586068))))

(declare-fun lt!586217 () Unit!43400)

(declare-fun choose!1943 (ListLongMap!20805 (_ BitVec 64) V!52747 (_ BitVec 64)) Unit!43400)

(assert (=> d!142591 (= lt!586217 (choose!1943 lt!586065 lt!586082 zeroValue!1296 lt!586068))))

(declare-fun e!751084 () Bool)

(assert (=> d!142591 e!751084))

(declare-fun res!873975 () Bool)

(assert (=> d!142591 (=> (not res!873975) (not e!751084))))

(assert (=> d!142591 (= res!873975 (contains!8568 lt!586065 lt!586068))))

(assert (=> d!142591 (= (addApplyDifferent!570 lt!586065 lt!586082 zeroValue!1296 lt!586068) lt!586217)))

(declare-fun b!1316622 () Bool)

(assert (=> b!1316622 (= e!751084 (not (= lt!586068 lt!586082)))))

(assert (= (and d!142591 res!873975) b!1316622))

(assert (=> d!142591 m!1204283))

(assert (=> d!142591 m!1204285))

(assert (=> d!142591 m!1204283))

(assert (=> d!142591 m!1204281))

(declare-fun m!1204597 () Bool)

(assert (=> d!142591 m!1204597))

(declare-fun m!1204599 () Bool)

(assert (=> d!142591 m!1204599))

(assert (=> b!1316398 d!142591))

(declare-fun d!142593 () Bool)

(assert (=> d!142593 (= (apply!1028 (+!4496 lt!586080 (tuple2!23149 lt!586085 minValue!1296)) lt!586072) (apply!1028 lt!586080 lt!586072))))

(declare-fun lt!586218 () Unit!43400)

(assert (=> d!142593 (= lt!586218 (choose!1943 lt!586080 lt!586085 minValue!1296 lt!586072))))

(declare-fun e!751085 () Bool)

(assert (=> d!142593 e!751085))

(declare-fun res!873976 () Bool)

(assert (=> d!142593 (=> (not res!873976) (not e!751085))))

(assert (=> d!142593 (= res!873976 (contains!8568 lt!586080 lt!586072))))

(assert (=> d!142593 (= (addApplyDifferent!570 lt!586080 lt!586085 minValue!1296 lt!586072) lt!586218)))

(declare-fun b!1316623 () Bool)

(assert (=> b!1316623 (= e!751085 (not (= lt!586072 lt!586085)))))

(assert (= (and d!142593 res!873976) b!1316623))

(assert (=> d!142593 m!1204291))

(assert (=> d!142593 m!1204293))

(assert (=> d!142593 m!1204291))

(assert (=> d!142593 m!1204301))

(declare-fun m!1204601 () Bool)

(assert (=> d!142593 m!1204601))

(declare-fun m!1204603 () Bool)

(assert (=> d!142593 m!1204603))

(assert (=> b!1316398 d!142593))

(declare-fun d!142595 () Bool)

(assert (=> d!142595 (= (apply!1028 lt!586065 lt!586068) (get!21456 (getValueByKey!711 (toList!10418 lt!586065) lt!586068)))))

(declare-fun bs!37605 () Bool)

(assert (= bs!37605 d!142595))

(declare-fun m!1204605 () Bool)

(assert (=> bs!37605 m!1204605))

(assert (=> bs!37605 m!1204605))

(declare-fun m!1204607 () Bool)

(assert (=> bs!37605 m!1204607))

(assert (=> b!1316398 d!142595))

(declare-fun d!142597 () Bool)

(declare-fun e!751086 () Bool)

(assert (=> d!142597 e!751086))

(declare-fun res!873978 () Bool)

(assert (=> d!142597 (=> (not res!873978) (not e!751086))))

(declare-fun lt!586220 () ListLongMap!20805)

(assert (=> d!142597 (= res!873978 (contains!8568 lt!586220 (_1!11585 (tuple2!23149 lt!586085 minValue!1296))))))

(declare-fun lt!586221 () List!30286)

(assert (=> d!142597 (= lt!586220 (ListLongMap!20806 lt!586221))))

(declare-fun lt!586222 () Unit!43400)

(declare-fun lt!586219 () Unit!43400)

(assert (=> d!142597 (= lt!586222 lt!586219)))

(assert (=> d!142597 (= (getValueByKey!711 lt!586221 (_1!11585 (tuple2!23149 lt!586085 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586085 minValue!1296))))))

(assert (=> d!142597 (= lt!586219 (lemmaContainsTupThenGetReturnValue!356 lt!586221 (_1!11585 (tuple2!23149 lt!586085 minValue!1296)) (_2!11585 (tuple2!23149 lt!586085 minValue!1296))))))

(assert (=> d!142597 (= lt!586221 (insertStrictlySorted!485 (toList!10418 lt!586080) (_1!11585 (tuple2!23149 lt!586085 minValue!1296)) (_2!11585 (tuple2!23149 lt!586085 minValue!1296))))))

(assert (=> d!142597 (= (+!4496 lt!586080 (tuple2!23149 lt!586085 minValue!1296)) lt!586220)))

(declare-fun b!1316624 () Bool)

(declare-fun res!873977 () Bool)

(assert (=> b!1316624 (=> (not res!873977) (not e!751086))))

(assert (=> b!1316624 (= res!873977 (= (getValueByKey!711 (toList!10418 lt!586220) (_1!11585 (tuple2!23149 lt!586085 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586085 minValue!1296)))))))

(declare-fun b!1316625 () Bool)

(assert (=> b!1316625 (= e!751086 (contains!8571 (toList!10418 lt!586220) (tuple2!23149 lt!586085 minValue!1296)))))

(assert (= (and d!142597 res!873978) b!1316624))

(assert (= (and b!1316624 res!873977) b!1316625))

(declare-fun m!1204609 () Bool)

(assert (=> d!142597 m!1204609))

(declare-fun m!1204611 () Bool)

(assert (=> d!142597 m!1204611))

(declare-fun m!1204613 () Bool)

(assert (=> d!142597 m!1204613))

(declare-fun m!1204615 () Bool)

(assert (=> d!142597 m!1204615))

(declare-fun m!1204617 () Bool)

(assert (=> b!1316624 m!1204617))

(declare-fun m!1204619 () Bool)

(assert (=> b!1316625 m!1204619))

(assert (=> b!1316398 d!142597))

(declare-fun d!142599 () Bool)

(declare-fun e!751087 () Bool)

(assert (=> d!142599 e!751087))

(declare-fun res!873980 () Bool)

(assert (=> d!142599 (=> (not res!873980) (not e!751087))))

(declare-fun lt!586224 () ListLongMap!20805)

(assert (=> d!142599 (= res!873980 (contains!8568 lt!586224 (_1!11585 (tuple2!23149 lt!586067 zeroValue!1296))))))

(declare-fun lt!586225 () List!30286)

(assert (=> d!142599 (= lt!586224 (ListLongMap!20806 lt!586225))))

(declare-fun lt!586226 () Unit!43400)

(declare-fun lt!586223 () Unit!43400)

(assert (=> d!142599 (= lt!586226 lt!586223)))

(assert (=> d!142599 (= (getValueByKey!711 lt!586225 (_1!11585 (tuple2!23149 lt!586067 zeroValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586067 zeroValue!1296))))))

(assert (=> d!142599 (= lt!586223 (lemmaContainsTupThenGetReturnValue!356 lt!586225 (_1!11585 (tuple2!23149 lt!586067 zeroValue!1296)) (_2!11585 (tuple2!23149 lt!586067 zeroValue!1296))))))

(assert (=> d!142599 (= lt!586225 (insertStrictlySorted!485 (toList!10418 lt!586073) (_1!11585 (tuple2!23149 lt!586067 zeroValue!1296)) (_2!11585 (tuple2!23149 lt!586067 zeroValue!1296))))))

(assert (=> d!142599 (= (+!4496 lt!586073 (tuple2!23149 lt!586067 zeroValue!1296)) lt!586224)))

(declare-fun b!1316626 () Bool)

(declare-fun res!873979 () Bool)

(assert (=> b!1316626 (=> (not res!873979) (not e!751087))))

(assert (=> b!1316626 (= res!873979 (= (getValueByKey!711 (toList!10418 lt!586224) (_1!11585 (tuple2!23149 lt!586067 zeroValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586067 zeroValue!1296)))))))

(declare-fun b!1316627 () Bool)

(assert (=> b!1316627 (= e!751087 (contains!8571 (toList!10418 lt!586224) (tuple2!23149 lt!586067 zeroValue!1296)))))

(assert (= (and d!142599 res!873980) b!1316626))

(assert (= (and b!1316626 res!873979) b!1316627))

(declare-fun m!1204621 () Bool)

(assert (=> d!142599 m!1204621))

(declare-fun m!1204623 () Bool)

(assert (=> d!142599 m!1204623))

(declare-fun m!1204625 () Bool)

(assert (=> d!142599 m!1204625))

(declare-fun m!1204627 () Bool)

(assert (=> d!142599 m!1204627))

(declare-fun m!1204629 () Bool)

(assert (=> b!1316626 m!1204629))

(declare-fun m!1204631 () Bool)

(assert (=> b!1316627 m!1204631))

(assert (=> b!1316398 d!142599))

(declare-fun d!142601 () Bool)

(assert (=> d!142601 (= (apply!1028 (+!4496 lt!586074 (tuple2!23149 lt!586070 minValue!1296)) lt!586081) (get!21456 (getValueByKey!711 (toList!10418 (+!4496 lt!586074 (tuple2!23149 lt!586070 minValue!1296))) lt!586081)))))

(declare-fun bs!37606 () Bool)

(assert (= bs!37606 d!142601))

(declare-fun m!1204633 () Bool)

(assert (=> bs!37606 m!1204633))

(assert (=> bs!37606 m!1204633))

(declare-fun m!1204635 () Bool)

(assert (=> bs!37606 m!1204635))

(assert (=> b!1316398 d!142601))

(declare-fun d!142603 () Bool)

(declare-fun e!751088 () Bool)

(assert (=> d!142603 e!751088))

(declare-fun res!873981 () Bool)

(assert (=> d!142603 (=> res!873981 e!751088)))

(declare-fun lt!586229 () Bool)

(assert (=> d!142603 (= res!873981 (not lt!586229))))

(declare-fun lt!586227 () Bool)

(assert (=> d!142603 (= lt!586229 lt!586227)))

(declare-fun lt!586228 () Unit!43400)

(declare-fun e!751089 () Unit!43400)

(assert (=> d!142603 (= lt!586228 e!751089)))

(declare-fun c!125625 () Bool)

(assert (=> d!142603 (= c!125625 lt!586227)))

(assert (=> d!142603 (= lt!586227 (containsKey!733 (toList!10418 (+!4496 lt!586073 (tuple2!23149 lt!586067 zeroValue!1296))) lt!586084))))

(assert (=> d!142603 (= (contains!8568 (+!4496 lt!586073 (tuple2!23149 lt!586067 zeroValue!1296)) lt!586084) lt!586229)))

(declare-fun b!1316628 () Bool)

(declare-fun lt!586230 () Unit!43400)

(assert (=> b!1316628 (= e!751089 lt!586230)))

(assert (=> b!1316628 (= lt!586230 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 (+!4496 lt!586073 (tuple2!23149 lt!586067 zeroValue!1296))) lt!586084))))

(assert (=> b!1316628 (isDefined!518 (getValueByKey!711 (toList!10418 (+!4496 lt!586073 (tuple2!23149 lt!586067 zeroValue!1296))) lt!586084))))

(declare-fun b!1316629 () Bool)

(declare-fun Unit!43411 () Unit!43400)

(assert (=> b!1316629 (= e!751089 Unit!43411)))

(declare-fun b!1316630 () Bool)

(assert (=> b!1316630 (= e!751088 (isDefined!518 (getValueByKey!711 (toList!10418 (+!4496 lt!586073 (tuple2!23149 lt!586067 zeroValue!1296))) lt!586084)))))

(assert (= (and d!142603 c!125625) b!1316628))

(assert (= (and d!142603 (not c!125625)) b!1316629))

(assert (= (and d!142603 (not res!873981)) b!1316630))

(declare-fun m!1204637 () Bool)

(assert (=> d!142603 m!1204637))

(declare-fun m!1204639 () Bool)

(assert (=> b!1316628 m!1204639))

(declare-fun m!1204641 () Bool)

(assert (=> b!1316628 m!1204641))

(assert (=> b!1316628 m!1204641))

(declare-fun m!1204643 () Bool)

(assert (=> b!1316628 m!1204643))

(assert (=> b!1316630 m!1204641))

(assert (=> b!1316630 m!1204641))

(assert (=> b!1316630 m!1204643))

(assert (=> b!1316398 d!142603))

(declare-fun d!142605 () Bool)

(assert (=> d!142605 (= (apply!1028 lt!586080 lt!586072) (get!21456 (getValueByKey!711 (toList!10418 lt!586080) lt!586072)))))

(declare-fun bs!37607 () Bool)

(assert (= bs!37607 d!142605))

(declare-fun m!1204645 () Bool)

(assert (=> bs!37607 m!1204645))

(assert (=> bs!37607 m!1204645))

(declare-fun m!1204647 () Bool)

(assert (=> bs!37607 m!1204647))

(assert (=> b!1316398 d!142605))

(declare-fun d!142607 () Bool)

(assert (=> d!142607 (= (apply!1028 (+!4496 lt!586065 (tuple2!23149 lt!586082 zeroValue!1296)) lt!586068) (get!21456 (getValueByKey!711 (toList!10418 (+!4496 lt!586065 (tuple2!23149 lt!586082 zeroValue!1296))) lt!586068)))))

(declare-fun bs!37608 () Bool)

(assert (= bs!37608 d!142607))

(declare-fun m!1204649 () Bool)

(assert (=> bs!37608 m!1204649))

(assert (=> bs!37608 m!1204649))

(declare-fun m!1204651 () Bool)

(assert (=> bs!37608 m!1204651))

(assert (=> b!1316398 d!142607))

(assert (=> b!1316398 d!142555))

(declare-fun d!142609 () Bool)

(assert (=> d!142609 (= (apply!1028 lt!586074 lt!586081) (get!21456 (getValueByKey!711 (toList!10418 lt!586074) lt!586081)))))

(declare-fun bs!37609 () Bool)

(assert (= bs!37609 d!142609))

(declare-fun m!1204653 () Bool)

(assert (=> bs!37609 m!1204653))

(assert (=> bs!37609 m!1204653))

(declare-fun m!1204655 () Bool)

(assert (=> bs!37609 m!1204655))

(assert (=> b!1316398 d!142609))

(declare-fun d!142611 () Bool)

(assert (=> d!142611 (contains!8568 (+!4496 lt!586073 (tuple2!23149 lt!586067 zeroValue!1296)) lt!586084)))

(declare-fun lt!586233 () Unit!43400)

(declare-fun choose!1944 (ListLongMap!20805 (_ BitVec 64) V!52747 (_ BitVec 64)) Unit!43400)

(assert (=> d!142611 (= lt!586233 (choose!1944 lt!586073 lt!586067 zeroValue!1296 lt!586084))))

(assert (=> d!142611 (contains!8568 lt!586073 lt!586084)))

(assert (=> d!142611 (= (addStillContains!1116 lt!586073 lt!586067 zeroValue!1296 lt!586084) lt!586233)))

(declare-fun bs!37610 () Bool)

(assert (= bs!37610 d!142611))

(assert (=> bs!37610 m!1204295))

(assert (=> bs!37610 m!1204295))

(assert (=> bs!37610 m!1204297))

(declare-fun m!1204657 () Bool)

(assert (=> bs!37610 m!1204657))

(declare-fun m!1204659 () Bool)

(assert (=> bs!37610 m!1204659))

(assert (=> b!1316398 d!142611))

(declare-fun d!142613 () Bool)

(assert (=> d!142613 (= (apply!1028 (+!4496 lt!586074 (tuple2!23149 lt!586070 minValue!1296)) lt!586081) (apply!1028 lt!586074 lt!586081))))

(declare-fun lt!586234 () Unit!43400)

(assert (=> d!142613 (= lt!586234 (choose!1943 lt!586074 lt!586070 minValue!1296 lt!586081))))

(declare-fun e!751090 () Bool)

(assert (=> d!142613 e!751090))

(declare-fun res!873982 () Bool)

(assert (=> d!142613 (=> (not res!873982) (not e!751090))))

(assert (=> d!142613 (= res!873982 (contains!8568 lt!586074 lt!586081))))

(assert (=> d!142613 (= (addApplyDifferent!570 lt!586074 lt!586070 minValue!1296 lt!586081) lt!586234)))

(declare-fun b!1316632 () Bool)

(assert (=> b!1316632 (= e!751090 (not (= lt!586081 lt!586070)))))

(assert (= (and d!142613 res!873982) b!1316632))

(assert (=> d!142613 m!1204289))

(assert (=> d!142613 m!1204307))

(assert (=> d!142613 m!1204289))

(assert (=> d!142613 m!1204279))

(declare-fun m!1204661 () Bool)

(assert (=> d!142613 m!1204661))

(declare-fun m!1204663 () Bool)

(assert (=> d!142613 m!1204663))

(assert (=> b!1316398 d!142613))

(declare-fun d!142615 () Bool)

(declare-fun e!751091 () Bool)

(assert (=> d!142615 e!751091))

(declare-fun res!873984 () Bool)

(assert (=> d!142615 (=> (not res!873984) (not e!751091))))

(declare-fun lt!586236 () ListLongMap!20805)

(assert (=> d!142615 (= res!873984 (contains!8568 lt!586236 (_1!11585 (tuple2!23149 lt!586082 zeroValue!1296))))))

(declare-fun lt!586237 () List!30286)

(assert (=> d!142615 (= lt!586236 (ListLongMap!20806 lt!586237))))

(declare-fun lt!586238 () Unit!43400)

(declare-fun lt!586235 () Unit!43400)

(assert (=> d!142615 (= lt!586238 lt!586235)))

(assert (=> d!142615 (= (getValueByKey!711 lt!586237 (_1!11585 (tuple2!23149 lt!586082 zeroValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586082 zeroValue!1296))))))

(assert (=> d!142615 (= lt!586235 (lemmaContainsTupThenGetReturnValue!356 lt!586237 (_1!11585 (tuple2!23149 lt!586082 zeroValue!1296)) (_2!11585 (tuple2!23149 lt!586082 zeroValue!1296))))))

(assert (=> d!142615 (= lt!586237 (insertStrictlySorted!485 (toList!10418 lt!586065) (_1!11585 (tuple2!23149 lt!586082 zeroValue!1296)) (_2!11585 (tuple2!23149 lt!586082 zeroValue!1296))))))

(assert (=> d!142615 (= (+!4496 lt!586065 (tuple2!23149 lt!586082 zeroValue!1296)) lt!586236)))

(declare-fun b!1316633 () Bool)

(declare-fun res!873983 () Bool)

(assert (=> b!1316633 (=> (not res!873983) (not e!751091))))

(assert (=> b!1316633 (= res!873983 (= (getValueByKey!711 (toList!10418 lt!586236) (_1!11585 (tuple2!23149 lt!586082 zeroValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586082 zeroValue!1296)))))))

(declare-fun b!1316634 () Bool)

(assert (=> b!1316634 (= e!751091 (contains!8571 (toList!10418 lt!586236) (tuple2!23149 lt!586082 zeroValue!1296)))))

(assert (= (and d!142615 res!873984) b!1316633))

(assert (= (and b!1316633 res!873983) b!1316634))

(declare-fun m!1204665 () Bool)

(assert (=> d!142615 m!1204665))

(declare-fun m!1204667 () Bool)

(assert (=> d!142615 m!1204667))

(declare-fun m!1204669 () Bool)

(assert (=> d!142615 m!1204669))

(declare-fun m!1204671 () Bool)

(assert (=> d!142615 m!1204671))

(declare-fun m!1204673 () Bool)

(assert (=> b!1316633 m!1204673))

(declare-fun m!1204675 () Bool)

(assert (=> b!1316634 m!1204675))

(assert (=> b!1316398 d!142615))

(assert (=> b!1316453 d!142515))

(assert (=> b!1316426 d!142537))

(declare-fun d!142617 () Bool)

(declare-fun e!751092 () Bool)

(assert (=> d!142617 e!751092))

(declare-fun res!873986 () Bool)

(assert (=> d!142617 (=> (not res!873986) (not e!751092))))

(declare-fun lt!586240 () ListLongMap!20805)

(assert (=> d!142617 (= res!873986 (contains!8568 lt!586240 (_1!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun lt!586241 () List!30286)

(assert (=> d!142617 (= lt!586240 (ListLongMap!20806 lt!586241))))

(declare-fun lt!586242 () Unit!43400)

(declare-fun lt!586239 () Unit!43400)

(assert (=> d!142617 (= lt!586242 lt!586239)))

(assert (=> d!142617 (= (getValueByKey!711 lt!586241 (_1!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142617 (= lt!586239 (lemmaContainsTupThenGetReturnValue!356 lt!586241 (_1!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142617 (= lt!586241 (insertStrictlySorted!485 (toList!10418 call!64648) (_1!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142617 (= (+!4496 call!64648 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) lt!586240)))

(declare-fun b!1316635 () Bool)

(declare-fun res!873985 () Bool)

(assert (=> b!1316635 (=> (not res!873985) (not e!751092))))

(assert (=> b!1316635 (= res!873985 (= (getValueByKey!711 (toList!10418 lt!586240) (_1!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun b!1316636 () Bool)

(assert (=> b!1316636 (= e!751092 (contains!8571 (toList!10418 lt!586240) (tuple2!23149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(assert (= (and d!142617 res!873986) b!1316635))

(assert (= (and b!1316635 res!873985) b!1316636))

(declare-fun m!1204677 () Bool)

(assert (=> d!142617 m!1204677))

(declare-fun m!1204679 () Bool)

(assert (=> d!142617 m!1204679))

(declare-fun m!1204681 () Bool)

(assert (=> d!142617 m!1204681))

(declare-fun m!1204683 () Bool)

(assert (=> d!142617 m!1204683))

(declare-fun m!1204685 () Bool)

(assert (=> b!1316635 m!1204685))

(declare-fun m!1204687 () Bool)

(assert (=> b!1316636 m!1204687))

(assert (=> b!1316395 d!142617))

(declare-fun d!142619 () Bool)

(assert (=> d!142619 (= (validKeyInArray!0 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (and (not (= (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1316394 d!142619))

(assert (=> d!142533 d!142523))

(declare-fun d!142621 () Bool)

(declare-fun res!873987 () Bool)

(declare-fun e!751093 () Bool)

(assert (=> d!142621 (=> res!873987 e!751093)))

(assert (=> d!142621 (= res!873987 (and ((_ is Cons!30282) (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (= (_1!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)))))

(assert (=> d!142621 (= (containsKey!733 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175) e!751093)))

(declare-fun b!1316637 () Bool)

(declare-fun e!751094 () Bool)

(assert (=> b!1316637 (= e!751093 e!751094)))

(declare-fun res!873988 () Bool)

(assert (=> b!1316637 (=> (not res!873988) (not e!751094))))

(assert (=> b!1316637 (= res!873988 (and (or (not ((_ is Cons!30282) (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) (bvsle (_1!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)) ((_ is Cons!30282) (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (bvslt (_1!11585 (h!31491 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)))))

(declare-fun b!1316638 () Bool)

(assert (=> b!1316638 (= e!751094 (containsKey!733 (t!43892 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) k0!1175))))

(assert (= (and d!142621 (not res!873987)) b!1316637))

(assert (= (and b!1316637 res!873988) b!1316638))

(declare-fun m!1204689 () Bool)

(assert (=> b!1316638 m!1204689))

(assert (=> d!142531 d!142621))

(declare-fun d!142623 () Bool)

(assert (=> d!142623 (= (apply!1028 lt!586109 lt!586116) (get!21456 (getValueByKey!711 (toList!10418 lt!586109) lt!586116)))))

(declare-fun bs!37611 () Bool)

(assert (= bs!37611 d!142623))

(declare-fun m!1204691 () Bool)

(assert (=> bs!37611 m!1204691))

(assert (=> bs!37611 m!1204691))

(declare-fun m!1204693 () Bool)

(assert (=> bs!37611 m!1204693))

(assert (=> b!1316451 d!142623))

(declare-fun d!142625 () Bool)

(assert (=> d!142625 (contains!8568 (+!4496 lt!586108 (tuple2!23149 lt!586102 zeroValue!1296)) lt!586119)))

(declare-fun lt!586243 () Unit!43400)

(assert (=> d!142625 (= lt!586243 (choose!1944 lt!586108 lt!586102 zeroValue!1296 lt!586119))))

(assert (=> d!142625 (contains!8568 lt!586108 lt!586119)))

(assert (=> d!142625 (= (addStillContains!1116 lt!586108 lt!586102 zeroValue!1296 lt!586119) lt!586243)))

(declare-fun bs!37612 () Bool)

(assert (= bs!37612 d!142625))

(assert (=> bs!37612 m!1204371))

(assert (=> bs!37612 m!1204371))

(assert (=> bs!37612 m!1204373))

(declare-fun m!1204695 () Bool)

(assert (=> bs!37612 m!1204695))

(declare-fun m!1204697 () Bool)

(assert (=> bs!37612 m!1204697))

(assert (=> b!1316451 d!142625))

(declare-fun d!142627 () Bool)

(declare-fun e!751095 () Bool)

(assert (=> d!142627 e!751095))

(declare-fun res!873989 () Bool)

(assert (=> d!142627 (=> res!873989 e!751095)))

(declare-fun lt!586246 () Bool)

(assert (=> d!142627 (= res!873989 (not lt!586246))))

(declare-fun lt!586244 () Bool)

(assert (=> d!142627 (= lt!586246 lt!586244)))

(declare-fun lt!586245 () Unit!43400)

(declare-fun e!751096 () Unit!43400)

(assert (=> d!142627 (= lt!586245 e!751096)))

(declare-fun c!125626 () Bool)

(assert (=> d!142627 (= c!125626 lt!586244)))

(assert (=> d!142627 (= lt!586244 (containsKey!733 (toList!10418 (+!4496 lt!586108 (tuple2!23149 lt!586102 zeroValue!1296))) lt!586119))))

(assert (=> d!142627 (= (contains!8568 (+!4496 lt!586108 (tuple2!23149 lt!586102 zeroValue!1296)) lt!586119) lt!586246)))

(declare-fun b!1316639 () Bool)

(declare-fun lt!586247 () Unit!43400)

(assert (=> b!1316639 (= e!751096 lt!586247)))

(assert (=> b!1316639 (= lt!586247 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 (+!4496 lt!586108 (tuple2!23149 lt!586102 zeroValue!1296))) lt!586119))))

(assert (=> b!1316639 (isDefined!518 (getValueByKey!711 (toList!10418 (+!4496 lt!586108 (tuple2!23149 lt!586102 zeroValue!1296))) lt!586119))))

(declare-fun b!1316640 () Bool)

(declare-fun Unit!43412 () Unit!43400)

(assert (=> b!1316640 (= e!751096 Unit!43412)))

(declare-fun b!1316641 () Bool)

(assert (=> b!1316641 (= e!751095 (isDefined!518 (getValueByKey!711 (toList!10418 (+!4496 lt!586108 (tuple2!23149 lt!586102 zeroValue!1296))) lt!586119)))))

(assert (= (and d!142627 c!125626) b!1316639))

(assert (= (and d!142627 (not c!125626)) b!1316640))

(assert (= (and d!142627 (not res!873989)) b!1316641))

(declare-fun m!1204699 () Bool)

(assert (=> d!142627 m!1204699))

(declare-fun m!1204701 () Bool)

(assert (=> b!1316639 m!1204701))

(declare-fun m!1204703 () Bool)

(assert (=> b!1316639 m!1204703))

(assert (=> b!1316639 m!1204703))

(declare-fun m!1204705 () Bool)

(assert (=> b!1316639 m!1204705))

(assert (=> b!1316641 m!1204703))

(assert (=> b!1316641 m!1204703))

(assert (=> b!1316641 m!1204705))

(assert (=> b!1316451 d!142627))

(declare-fun d!142629 () Bool)

(assert (=> d!142629 (= (apply!1028 (+!4496 lt!586115 (tuple2!23149 lt!586120 minValue!1296)) lt!586107) (apply!1028 lt!586115 lt!586107))))

(declare-fun lt!586248 () Unit!43400)

(assert (=> d!142629 (= lt!586248 (choose!1943 lt!586115 lt!586120 minValue!1296 lt!586107))))

(declare-fun e!751097 () Bool)

(assert (=> d!142629 e!751097))

(declare-fun res!873990 () Bool)

(assert (=> d!142629 (=> (not res!873990) (not e!751097))))

(assert (=> d!142629 (= res!873990 (contains!8568 lt!586115 lt!586107))))

(assert (=> d!142629 (= (addApplyDifferent!570 lt!586115 lt!586120 minValue!1296 lt!586107) lt!586248)))

(declare-fun b!1316642 () Bool)

(assert (=> b!1316642 (= e!751097 (not (= lt!586107 lt!586120)))))

(assert (= (and d!142629 res!873990) b!1316642))

(assert (=> d!142629 m!1204367))

(assert (=> d!142629 m!1204369))

(assert (=> d!142629 m!1204367))

(assert (=> d!142629 m!1204377))

(declare-fun m!1204707 () Bool)

(assert (=> d!142629 m!1204707))

(declare-fun m!1204709 () Bool)

(assert (=> d!142629 m!1204709))

(assert (=> b!1316451 d!142629))

(declare-fun d!142631 () Bool)

(assert (=> d!142631 (= (apply!1028 lt!586115 lt!586107) (get!21456 (getValueByKey!711 (toList!10418 lt!586115) lt!586107)))))

(declare-fun bs!37613 () Bool)

(assert (= bs!37613 d!142631))

(declare-fun m!1204711 () Bool)

(assert (=> bs!37613 m!1204711))

(assert (=> bs!37613 m!1204711))

(declare-fun m!1204713 () Bool)

(assert (=> bs!37613 m!1204713))

(assert (=> b!1316451 d!142631))

(declare-fun d!142633 () Bool)

(assert (=> d!142633 (= (apply!1028 (+!4496 lt!586115 (tuple2!23149 lt!586120 minValue!1296)) lt!586107) (get!21456 (getValueByKey!711 (toList!10418 (+!4496 lt!586115 (tuple2!23149 lt!586120 minValue!1296))) lt!586107)))))

(declare-fun bs!37614 () Bool)

(assert (= bs!37614 d!142633))

(declare-fun m!1204715 () Bool)

(assert (=> bs!37614 m!1204715))

(assert (=> bs!37614 m!1204715))

(declare-fun m!1204717 () Bool)

(assert (=> bs!37614 m!1204717))

(assert (=> b!1316451 d!142633))

(declare-fun d!142635 () Bool)

(assert (=> d!142635 (= (apply!1028 lt!586100 lt!586103) (get!21456 (getValueByKey!711 (toList!10418 lt!586100) lt!586103)))))

(declare-fun bs!37615 () Bool)

(assert (= bs!37615 d!142635))

(declare-fun m!1204719 () Bool)

(assert (=> bs!37615 m!1204719))

(assert (=> bs!37615 m!1204719))

(declare-fun m!1204721 () Bool)

(assert (=> bs!37615 m!1204721))

(assert (=> b!1316451 d!142635))

(declare-fun d!142637 () Bool)

(declare-fun e!751098 () Bool)

(assert (=> d!142637 e!751098))

(declare-fun res!873992 () Bool)

(assert (=> d!142637 (=> (not res!873992) (not e!751098))))

(declare-fun lt!586250 () ListLongMap!20805)

(assert (=> d!142637 (= res!873992 (contains!8568 lt!586250 (_1!11585 (tuple2!23149 lt!586120 minValue!1296))))))

(declare-fun lt!586251 () List!30286)

(assert (=> d!142637 (= lt!586250 (ListLongMap!20806 lt!586251))))

(declare-fun lt!586252 () Unit!43400)

(declare-fun lt!586249 () Unit!43400)

(assert (=> d!142637 (= lt!586252 lt!586249)))

(assert (=> d!142637 (= (getValueByKey!711 lt!586251 (_1!11585 (tuple2!23149 lt!586120 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586120 minValue!1296))))))

(assert (=> d!142637 (= lt!586249 (lemmaContainsTupThenGetReturnValue!356 lt!586251 (_1!11585 (tuple2!23149 lt!586120 minValue!1296)) (_2!11585 (tuple2!23149 lt!586120 minValue!1296))))))

(assert (=> d!142637 (= lt!586251 (insertStrictlySorted!485 (toList!10418 lt!586115) (_1!11585 (tuple2!23149 lt!586120 minValue!1296)) (_2!11585 (tuple2!23149 lt!586120 minValue!1296))))))

(assert (=> d!142637 (= (+!4496 lt!586115 (tuple2!23149 lt!586120 minValue!1296)) lt!586250)))

(declare-fun b!1316643 () Bool)

(declare-fun res!873991 () Bool)

(assert (=> b!1316643 (=> (not res!873991) (not e!751098))))

(assert (=> b!1316643 (= res!873991 (= (getValueByKey!711 (toList!10418 lt!586250) (_1!11585 (tuple2!23149 lt!586120 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586120 minValue!1296)))))))

(declare-fun b!1316644 () Bool)

(assert (=> b!1316644 (= e!751098 (contains!8571 (toList!10418 lt!586250) (tuple2!23149 lt!586120 minValue!1296)))))

(assert (= (and d!142637 res!873992) b!1316643))

(assert (= (and b!1316643 res!873991) b!1316644))

(declare-fun m!1204723 () Bool)

(assert (=> d!142637 m!1204723))

(declare-fun m!1204725 () Bool)

(assert (=> d!142637 m!1204725))

(declare-fun m!1204727 () Bool)

(assert (=> d!142637 m!1204727))

(declare-fun m!1204729 () Bool)

(assert (=> d!142637 m!1204729))

(declare-fun m!1204731 () Bool)

(assert (=> b!1316643 m!1204731))

(declare-fun m!1204733 () Bool)

(assert (=> b!1316644 m!1204733))

(assert (=> b!1316451 d!142637))

(declare-fun d!142639 () Bool)

(assert (=> d!142639 (= (apply!1028 (+!4496 lt!586109 (tuple2!23149 lt!586105 minValue!1296)) lt!586116) (get!21456 (getValueByKey!711 (toList!10418 (+!4496 lt!586109 (tuple2!23149 lt!586105 minValue!1296))) lt!586116)))))

(declare-fun bs!37616 () Bool)

(assert (= bs!37616 d!142639))

(declare-fun m!1204735 () Bool)

(assert (=> bs!37616 m!1204735))

(assert (=> bs!37616 m!1204735))

(declare-fun m!1204737 () Bool)

(assert (=> bs!37616 m!1204737))

(assert (=> b!1316451 d!142639))

(declare-fun d!142641 () Bool)

(assert (=> d!142641 (= (apply!1028 (+!4496 lt!586109 (tuple2!23149 lt!586105 minValue!1296)) lt!586116) (apply!1028 lt!586109 lt!586116))))

(declare-fun lt!586253 () Unit!43400)

(assert (=> d!142641 (= lt!586253 (choose!1943 lt!586109 lt!586105 minValue!1296 lt!586116))))

(declare-fun e!751099 () Bool)

(assert (=> d!142641 e!751099))

(declare-fun res!873993 () Bool)

(assert (=> d!142641 (=> (not res!873993) (not e!751099))))

(assert (=> d!142641 (= res!873993 (contains!8568 lt!586109 lt!586116))))

(assert (=> d!142641 (= (addApplyDifferent!570 lt!586109 lt!586105 minValue!1296 lt!586116) lt!586253)))

(declare-fun b!1316645 () Bool)

(assert (=> b!1316645 (= e!751099 (not (= lt!586116 lt!586105)))))

(assert (= (and d!142641 res!873993) b!1316645))

(assert (=> d!142641 m!1204365))

(assert (=> d!142641 m!1204383))

(assert (=> d!142641 m!1204365))

(assert (=> d!142641 m!1204355))

(declare-fun m!1204739 () Bool)

(assert (=> d!142641 m!1204739))

(declare-fun m!1204741 () Bool)

(assert (=> d!142641 m!1204741))

(assert (=> b!1316451 d!142641))

(declare-fun d!142643 () Bool)

(declare-fun e!751100 () Bool)

(assert (=> d!142643 e!751100))

(declare-fun res!873995 () Bool)

(assert (=> d!142643 (=> (not res!873995) (not e!751100))))

(declare-fun lt!586255 () ListLongMap!20805)

(assert (=> d!142643 (= res!873995 (contains!8568 lt!586255 (_1!11585 (tuple2!23149 lt!586105 minValue!1296))))))

(declare-fun lt!586256 () List!30286)

(assert (=> d!142643 (= lt!586255 (ListLongMap!20806 lt!586256))))

(declare-fun lt!586257 () Unit!43400)

(declare-fun lt!586254 () Unit!43400)

(assert (=> d!142643 (= lt!586257 lt!586254)))

(assert (=> d!142643 (= (getValueByKey!711 lt!586256 (_1!11585 (tuple2!23149 lt!586105 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586105 minValue!1296))))))

(assert (=> d!142643 (= lt!586254 (lemmaContainsTupThenGetReturnValue!356 lt!586256 (_1!11585 (tuple2!23149 lt!586105 minValue!1296)) (_2!11585 (tuple2!23149 lt!586105 minValue!1296))))))

(assert (=> d!142643 (= lt!586256 (insertStrictlySorted!485 (toList!10418 lt!586109) (_1!11585 (tuple2!23149 lt!586105 minValue!1296)) (_2!11585 (tuple2!23149 lt!586105 minValue!1296))))))

(assert (=> d!142643 (= (+!4496 lt!586109 (tuple2!23149 lt!586105 minValue!1296)) lt!586255)))

(declare-fun b!1316646 () Bool)

(declare-fun res!873994 () Bool)

(assert (=> b!1316646 (=> (not res!873994) (not e!751100))))

(assert (=> b!1316646 (= res!873994 (= (getValueByKey!711 (toList!10418 lt!586255) (_1!11585 (tuple2!23149 lt!586105 minValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586105 minValue!1296)))))))

(declare-fun b!1316647 () Bool)

(assert (=> b!1316647 (= e!751100 (contains!8571 (toList!10418 lt!586255) (tuple2!23149 lt!586105 minValue!1296)))))

(assert (= (and d!142643 res!873995) b!1316646))

(assert (= (and b!1316646 res!873994) b!1316647))

(declare-fun m!1204743 () Bool)

(assert (=> d!142643 m!1204743))

(declare-fun m!1204745 () Bool)

(assert (=> d!142643 m!1204745))

(declare-fun m!1204747 () Bool)

(assert (=> d!142643 m!1204747))

(declare-fun m!1204749 () Bool)

(assert (=> d!142643 m!1204749))

(declare-fun m!1204751 () Bool)

(assert (=> b!1316646 m!1204751))

(declare-fun m!1204753 () Bool)

(assert (=> b!1316647 m!1204753))

(assert (=> b!1316451 d!142643))

(declare-fun d!142645 () Bool)

(assert (=> d!142645 (= (apply!1028 (+!4496 lt!586100 (tuple2!23149 lt!586117 zeroValue!1296)) lt!586103) (apply!1028 lt!586100 lt!586103))))

(declare-fun lt!586258 () Unit!43400)

(assert (=> d!142645 (= lt!586258 (choose!1943 lt!586100 lt!586117 zeroValue!1296 lt!586103))))

(declare-fun e!751101 () Bool)

(assert (=> d!142645 e!751101))

(declare-fun res!873996 () Bool)

(assert (=> d!142645 (=> (not res!873996) (not e!751101))))

(assert (=> d!142645 (= res!873996 (contains!8568 lt!586100 lt!586103))))

(assert (=> d!142645 (= (addApplyDifferent!570 lt!586100 lt!586117 zeroValue!1296 lt!586103) lt!586258)))

(declare-fun b!1316648 () Bool)

(assert (=> b!1316648 (= e!751101 (not (= lt!586103 lt!586117)))))

(assert (= (and d!142645 res!873996) b!1316648))

(assert (=> d!142645 m!1204359))

(assert (=> d!142645 m!1204361))

(assert (=> d!142645 m!1204359))

(assert (=> d!142645 m!1204357))

(declare-fun m!1204755 () Bool)

(assert (=> d!142645 m!1204755))

(declare-fun m!1204757 () Bool)

(assert (=> d!142645 m!1204757))

(assert (=> b!1316451 d!142645))

(declare-fun d!142647 () Bool)

(declare-fun e!751102 () Bool)

(assert (=> d!142647 e!751102))

(declare-fun res!873998 () Bool)

(assert (=> d!142647 (=> (not res!873998) (not e!751102))))

(declare-fun lt!586260 () ListLongMap!20805)

(assert (=> d!142647 (= res!873998 (contains!8568 lt!586260 (_1!11585 (tuple2!23149 lt!586102 zeroValue!1296))))))

(declare-fun lt!586261 () List!30286)

(assert (=> d!142647 (= lt!586260 (ListLongMap!20806 lt!586261))))

(declare-fun lt!586262 () Unit!43400)

(declare-fun lt!586259 () Unit!43400)

(assert (=> d!142647 (= lt!586262 lt!586259)))

(assert (=> d!142647 (= (getValueByKey!711 lt!586261 (_1!11585 (tuple2!23149 lt!586102 zeroValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586102 zeroValue!1296))))))

(assert (=> d!142647 (= lt!586259 (lemmaContainsTupThenGetReturnValue!356 lt!586261 (_1!11585 (tuple2!23149 lt!586102 zeroValue!1296)) (_2!11585 (tuple2!23149 lt!586102 zeroValue!1296))))))

(assert (=> d!142647 (= lt!586261 (insertStrictlySorted!485 (toList!10418 lt!586108) (_1!11585 (tuple2!23149 lt!586102 zeroValue!1296)) (_2!11585 (tuple2!23149 lt!586102 zeroValue!1296))))))

(assert (=> d!142647 (= (+!4496 lt!586108 (tuple2!23149 lt!586102 zeroValue!1296)) lt!586260)))

(declare-fun b!1316649 () Bool)

(declare-fun res!873997 () Bool)

(assert (=> b!1316649 (=> (not res!873997) (not e!751102))))

(assert (=> b!1316649 (= res!873997 (= (getValueByKey!711 (toList!10418 lt!586260) (_1!11585 (tuple2!23149 lt!586102 zeroValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586102 zeroValue!1296)))))))

(declare-fun b!1316650 () Bool)

(assert (=> b!1316650 (= e!751102 (contains!8571 (toList!10418 lt!586260) (tuple2!23149 lt!586102 zeroValue!1296)))))

(assert (= (and d!142647 res!873998) b!1316649))

(assert (= (and b!1316649 res!873997) b!1316650))

(declare-fun m!1204759 () Bool)

(assert (=> d!142647 m!1204759))

(declare-fun m!1204761 () Bool)

(assert (=> d!142647 m!1204761))

(declare-fun m!1204763 () Bool)

(assert (=> d!142647 m!1204763))

(declare-fun m!1204765 () Bool)

(assert (=> d!142647 m!1204765))

(declare-fun m!1204767 () Bool)

(assert (=> b!1316649 m!1204767))

(declare-fun m!1204769 () Bool)

(assert (=> b!1316650 m!1204769))

(assert (=> b!1316451 d!142647))

(declare-fun d!142649 () Bool)

(declare-fun e!751103 () Bool)

(assert (=> d!142649 e!751103))

(declare-fun res!874000 () Bool)

(assert (=> d!142649 (=> (not res!874000) (not e!751103))))

(declare-fun lt!586264 () ListLongMap!20805)

(assert (=> d!142649 (= res!874000 (contains!8568 lt!586264 (_1!11585 (tuple2!23149 lt!586117 zeroValue!1296))))))

(declare-fun lt!586265 () List!30286)

(assert (=> d!142649 (= lt!586264 (ListLongMap!20806 lt!586265))))

(declare-fun lt!586266 () Unit!43400)

(declare-fun lt!586263 () Unit!43400)

(assert (=> d!142649 (= lt!586266 lt!586263)))

(assert (=> d!142649 (= (getValueByKey!711 lt!586265 (_1!11585 (tuple2!23149 lt!586117 zeroValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586117 zeroValue!1296))))))

(assert (=> d!142649 (= lt!586263 (lemmaContainsTupThenGetReturnValue!356 lt!586265 (_1!11585 (tuple2!23149 lt!586117 zeroValue!1296)) (_2!11585 (tuple2!23149 lt!586117 zeroValue!1296))))))

(assert (=> d!142649 (= lt!586265 (insertStrictlySorted!485 (toList!10418 lt!586100) (_1!11585 (tuple2!23149 lt!586117 zeroValue!1296)) (_2!11585 (tuple2!23149 lt!586117 zeroValue!1296))))))

(assert (=> d!142649 (= (+!4496 lt!586100 (tuple2!23149 lt!586117 zeroValue!1296)) lt!586264)))

(declare-fun b!1316651 () Bool)

(declare-fun res!873999 () Bool)

(assert (=> b!1316651 (=> (not res!873999) (not e!751103))))

(assert (=> b!1316651 (= res!873999 (= (getValueByKey!711 (toList!10418 lt!586264) (_1!11585 (tuple2!23149 lt!586117 zeroValue!1296))) (Some!762 (_2!11585 (tuple2!23149 lt!586117 zeroValue!1296)))))))

(declare-fun b!1316652 () Bool)

(assert (=> b!1316652 (= e!751103 (contains!8571 (toList!10418 lt!586264) (tuple2!23149 lt!586117 zeroValue!1296)))))

(assert (= (and d!142649 res!874000) b!1316651))

(assert (= (and b!1316651 res!873999) b!1316652))

(declare-fun m!1204771 () Bool)

(assert (=> d!142649 m!1204771))

(declare-fun m!1204773 () Bool)

(assert (=> d!142649 m!1204773))

(declare-fun m!1204775 () Bool)

(assert (=> d!142649 m!1204775))

(declare-fun m!1204777 () Bool)

(assert (=> d!142649 m!1204777))

(declare-fun m!1204779 () Bool)

(assert (=> b!1316651 m!1204779))

(declare-fun m!1204781 () Bool)

(assert (=> b!1316652 m!1204781))

(assert (=> b!1316451 d!142649))

(assert (=> b!1316451 d!142575))

(declare-fun d!142651 () Bool)

(assert (=> d!142651 (= (apply!1028 (+!4496 lt!586100 (tuple2!23149 lt!586117 zeroValue!1296)) lt!586103) (get!21456 (getValueByKey!711 (toList!10418 (+!4496 lt!586100 (tuple2!23149 lt!586117 zeroValue!1296))) lt!586103)))))

(declare-fun bs!37617 () Bool)

(assert (= bs!37617 d!142651))

(declare-fun m!1204783 () Bool)

(assert (=> bs!37617 m!1204783))

(assert (=> bs!37617 m!1204783))

(declare-fun m!1204785 () Bool)

(assert (=> bs!37617 m!1204785))

(assert (=> b!1316451 d!142651))

(declare-fun d!142653 () Bool)

(assert (=> d!142653 (= (apply!1028 lt!586078 (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (get!21456 (getValueByKey!711 (toList!10418 lt!586078) (select (arr!42692 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))))

(declare-fun bs!37618 () Bool)

(assert (= bs!37618 d!142653))

(assert (=> bs!37618 m!1204267))

(assert (=> bs!37618 m!1204445))

(assert (=> bs!37618 m!1204445))

(declare-fun m!1204787 () Bool)

(assert (=> bs!37618 m!1204787))

(assert (=> b!1316411 d!142653))

(declare-fun d!142655 () Bool)

(declare-fun c!125627 () Bool)

(assert (=> d!142655 (= c!125627 ((_ is ValueCellFull!16968) (select (arr!42693 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun e!751104 () V!52747)

(assert (=> d!142655 (= (get!21455 (select (arr!42693 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)) e!751104)))

(declare-fun b!1316653 () Bool)

(assert (=> b!1316653 (= e!751104 (get!21457 (select (arr!42693 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1316654 () Bool)

(assert (=> b!1316654 (= e!751104 (get!21458 (select (arr!42693 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3435 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142655 c!125627) b!1316653))

(assert (= (and d!142655 (not c!125627)) b!1316654))

(assert (=> b!1316653 m!1204275))

(assert (=> b!1316653 m!1204273))

(declare-fun m!1204789 () Bool)

(assert (=> b!1316653 m!1204789))

(assert (=> b!1316654 m!1204275))

(assert (=> b!1316654 m!1204273))

(declare-fun m!1204791 () Bool)

(assert (=> b!1316654 m!1204791))

(assert (=> b!1316411 d!142655))

(declare-fun d!142657 () Bool)

(declare-fun e!751105 () Bool)

(assert (=> d!142657 e!751105))

(declare-fun res!874001 () Bool)

(assert (=> d!142657 (=> res!874001 e!751105)))

(declare-fun lt!586269 () Bool)

(assert (=> d!142657 (= res!874001 (not lt!586269))))

(declare-fun lt!586267 () Bool)

(assert (=> d!142657 (= lt!586269 lt!586267)))

(declare-fun lt!586268 () Unit!43400)

(declare-fun e!751106 () Unit!43400)

(assert (=> d!142657 (= lt!586268 e!751106)))

(declare-fun c!125628 () Bool)

(assert (=> d!142657 (= c!125628 lt!586267)))

(assert (=> d!142657 (= lt!586267 (containsKey!733 (toList!10418 lt!586113) (select (arr!42692 _keys!1628) from!2020)))))

(assert (=> d!142657 (= (contains!8568 lt!586113 (select (arr!42692 _keys!1628) from!2020)) lt!586269)))

(declare-fun b!1316655 () Bool)

(declare-fun lt!586270 () Unit!43400)

(assert (=> b!1316655 (= e!751106 lt!586270)))

(assert (=> b!1316655 (= lt!586270 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 lt!586113) (select (arr!42692 _keys!1628) from!2020)))))

(assert (=> b!1316655 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586113) (select (arr!42692 _keys!1628) from!2020)))))

(declare-fun b!1316656 () Bool)

(declare-fun Unit!43413 () Unit!43400)

(assert (=> b!1316656 (= e!751106 Unit!43413)))

(declare-fun b!1316657 () Bool)

(assert (=> b!1316657 (= e!751105 (isDefined!518 (getValueByKey!711 (toList!10418 lt!586113) (select (arr!42692 _keys!1628) from!2020))))))

(assert (= (and d!142657 c!125628) b!1316655))

(assert (= (and d!142657 (not c!125628)) b!1316656))

(assert (= (and d!142657 (not res!874001)) b!1316657))

(assert (=> d!142657 m!1204223))

(declare-fun m!1204793 () Bool)

(assert (=> d!142657 m!1204793))

(assert (=> b!1316655 m!1204223))

(declare-fun m!1204795 () Bool)

(assert (=> b!1316655 m!1204795))

(assert (=> b!1316655 m!1204223))

(assert (=> b!1316655 m!1204515))

(assert (=> b!1316655 m!1204515))

(declare-fun m!1204797 () Bool)

(assert (=> b!1316655 m!1204797))

(assert (=> b!1316657 m!1204223))

(assert (=> b!1316657 m!1204515))

(assert (=> b!1316657 m!1204515))

(assert (=> b!1316657 m!1204797))

(assert (=> b!1316457 d!142657))

(declare-fun d!142659 () Bool)

(assert (=> d!142659 (= (apply!1028 lt!586078 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21456 (getValueByKey!711 (toList!10418 lt!586078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37619 () Bool)

(assert (= bs!37619 d!142659))

(assert (=> bs!37619 m!1204567))

(assert (=> bs!37619 m!1204567))

(declare-fun m!1204799 () Bool)

(assert (=> bs!37619 m!1204799))

(assert (=> b!1316403 d!142659))

(declare-fun d!142661 () Bool)

(assert (=> d!142661 (isDefined!518 (getValueByKey!711 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(declare-fun lt!586271 () Unit!43400)

(assert (=> d!142661 (= lt!586271 (choose!1942 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(declare-fun e!751107 () Bool)

(assert (=> d!142661 e!751107))

(declare-fun res!874002 () Bool)

(assert (=> d!142661 (=> (not res!874002) (not e!751107))))

(assert (=> d!142661 (= res!874002 (isStrictlySorted!875 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))))

(assert (=> d!142661 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175) lt!586271)))

(declare-fun b!1316658 () Bool)

(assert (=> b!1316658 (= e!751107 (containsKey!733 (toList!10418 (getCurrentListMap!5431 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(assert (= (and d!142661 res!874002) b!1316658))

(assert (=> d!142661 m!1204343))

(assert (=> d!142661 m!1204343))

(assert (=> d!142661 m!1204345))

(declare-fun m!1204801 () Bool)

(assert (=> d!142661 m!1204801))

(declare-fun m!1204803 () Bool)

(assert (=> d!142661 m!1204803))

(assert (=> b!1316658 m!1204339))

(assert (=> b!1316442 d!142661))

(assert (=> b!1316442 d!142543))

(assert (=> b!1316442 d!142545))

(declare-fun d!142663 () Bool)

(assert (=> d!142663 (= (apply!1028 lt!586078 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21456 (getValueByKey!711 (toList!10418 lt!586078) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37620 () Bool)

(assert (= bs!37620 d!142663))

(assert (=> bs!37620 m!1204511))

(assert (=> bs!37620 m!1204511))

(declare-fun m!1204805 () Bool)

(assert (=> bs!37620 m!1204805))

(assert (=> b!1316399 d!142663))

(assert (=> b!1316400 d!142619))

(declare-fun d!142665 () Bool)

(assert (=> d!142665 (= (apply!1028 lt!586113 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21456 (getValueByKey!711 (toList!10418 lt!586113) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37621 () Bool)

(assert (= bs!37621 d!142665))

(assert (=> bs!37621 m!1204417))

(assert (=> bs!37621 m!1204417))

(declare-fun m!1204807 () Bool)

(assert (=> bs!37621 m!1204807))

(assert (=> b!1316456 d!142665))

(declare-fun b!1316660 () Bool)

(declare-fun e!751108 () Bool)

(assert (=> b!1316660 (= e!751108 tp_is_empty!35733)))

(declare-fun condMapEmpty!55235 () Bool)

(declare-fun mapDefault!55235 () ValueCell!16968)

(assert (=> mapNonEmpty!55234 (= condMapEmpty!55235 (= mapRest!55234 ((as const (Array (_ BitVec 32) ValueCell!16968)) mapDefault!55235)))))

(declare-fun mapRes!55235 () Bool)

(assert (=> mapNonEmpty!55234 (= tp!105340 (and e!751108 mapRes!55235))))

(declare-fun b!1316659 () Bool)

(declare-fun e!751109 () Bool)

(assert (=> b!1316659 (= e!751109 tp_is_empty!35733)))

(declare-fun mapIsEmpty!55235 () Bool)

(assert (=> mapIsEmpty!55235 mapRes!55235))

(declare-fun mapNonEmpty!55235 () Bool)

(declare-fun tp!105341 () Bool)

(assert (=> mapNonEmpty!55235 (= mapRes!55235 (and tp!105341 e!751109))))

(declare-fun mapKey!55235 () (_ BitVec 32))

(declare-fun mapValue!55235 () ValueCell!16968)

(declare-fun mapRest!55235 () (Array (_ BitVec 32) ValueCell!16968))

(assert (=> mapNonEmpty!55235 (= mapRest!55234 (store mapRest!55235 mapKey!55235 mapValue!55235))))

(assert (= (and mapNonEmpty!55234 condMapEmpty!55235) mapIsEmpty!55235))

(assert (= (and mapNonEmpty!55234 (not condMapEmpty!55235)) mapNonEmpty!55235))

(assert (= (and mapNonEmpty!55235 ((_ is ValueCellFull!16968) mapValue!55235)) b!1316659))

(assert (= (and mapNonEmpty!55234 ((_ is ValueCellFull!16968) mapDefault!55235)) b!1316660))

(declare-fun m!1204809 () Bool)

(assert (=> mapNonEmpty!55235 m!1204809))

(declare-fun b_lambda!23379 () Bool)

(assert (= b_lambda!23377 (or (and start!111168 b_free!30003) b_lambda!23379)))

(declare-fun b_lambda!23381 () Bool)

(assert (= b_lambda!23373 (or (and start!111168 b_free!30003) b_lambda!23381)))

(declare-fun b_lambda!23383 () Bool)

(assert (= b_lambda!23371 (or (and start!111168 b_free!30003) b_lambda!23383)))

(declare-fun b_lambda!23385 () Bool)

(assert (= b_lambda!23375 (or (and start!111168 b_free!30003) b_lambda!23385)))

(check-sat (not b!1316604) (not b!1316653) (not b!1316615) (not b!1316617) (not d!142541) (not d!142643) (not b!1316646) (not d!142555) (not d!142597) (not b!1316547) (not b!1316550) (not b!1316499) (not d!142585) (not b!1316588) (not d!142589) (not d!142577) (not b!1316636) (not d!142551) (not b!1316503) (not d!142651) (not d!142615) (not b!1316618) (not b!1316634) (not b!1316478) (not b!1316546) (not b!1316626) (not d!142631) (not bm!64669) (not b!1316599) (not b!1316592) (not b!1316504) (not b!1316516) (not d!142603) (not b!1316628) (not b!1316625) (not mapNonEmpty!55235) (not b!1316633) (not b!1316649) (not b!1316545) (not b!1316635) (not d!142567) (not b!1316652) (not d!142573) (not b!1316609) (not b!1316541) (not d!142571) (not d!142625) (not b!1316605) (not bm!64668) (not b_lambda!23379) (not d!142553) (not b!1316581) (not d!142665) (not d!142593) (not b!1316556) (not d!142641) (not b!1316654) (not b!1316552) (not b!1316600) (not d!142633) (not b!1316542) (not b!1316590) (not d!142649) (not b!1316594) (not b!1316595) (not b!1316511) (not b!1316591) (not b!1316480) (not d!142639) (not d!142591) (not b_lambda!23367) (not b!1316630) (not d!142635) (not d!142587) (not d!142563) (not b!1316482) (not b!1316515) (not b_lambda!23381) (not b!1316502) (not b!1316562) (not b!1316607) (not b!1316551) (not d!142535) (not d!142581) (not b!1316644) (not b!1316655) (not b!1316641) (not b!1316650) (not d!142579) (not d!142647) (not d!142575) (not b_lambda!23383) (not b!1316576) (not d!142617) (not d!142623) (not d!142605) (not b_lambda!23369) (not d!142663) (not b!1316596) (not b!1316606) (not d!142657) (not b!1316488) (not d!142661) (not b!1316514) (not d!142629) (not bm!64664) b_and!48225 (not d!142613) (not b_lambda!23385) (not b!1316512) (not b!1316583) (not d!142659) (not b!1316643) (not d!142653) (not b!1316624) (not b!1316657) (not b!1316479) (not b!1316647) (not d!142611) (not d!142539) tp_is_empty!35733 (not d!142559) (not d!142645) (not d!142609) (not d!142601) (not b!1316638) (not b!1316639) (not bm!64667) (not d!142595) (not d!142637) (not b!1316612) (not d!142565) (not d!142627) (not d!142543) (not b!1316589) (not b!1316627) (not b!1316658) (not d!142607) (not b!1316555) (not d!142599) (not b_next!30003) (not b!1316651) (not b!1316601))
(check-sat b_and!48225 (not b_next!30003))
