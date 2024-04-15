; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4510 () Bool)

(assert start!4510)

(declare-fun b_free!1261 () Bool)

(declare-fun b_next!1261 () Bool)

(assert (=> start!4510 (= b_free!1261 (not b_next!1261))))

(declare-fun tp!5223 () Bool)

(declare-fun b_and!2079 () Bool)

(assert (=> start!4510 (= tp!5223 b_and!2079)))

(declare-fun b!35212 () Bool)

(declare-fun e!22238 () Bool)

(declare-fun e!22241 () Bool)

(assert (=> b!35212 (= e!22238 e!22241)))

(declare-fun res!21393 () Bool)

(assert (=> b!35212 (=> (not res!21393) (not e!22241))))

(declare-datatypes ((SeekEntryResult!163 0))(
  ( (MissingZero!163 (index!2774 (_ BitVec 32))) (Found!163 (index!2775 (_ BitVec 32))) (Intermediate!163 (undefined!975 Bool) (index!2776 (_ BitVec 32)) (x!7007 (_ BitVec 32))) (Undefined!163) (MissingVacant!163 (index!2777 (_ BitVec 32))) )
))
(declare-fun lt!12944 () SeekEntryResult!163)

(declare-datatypes ((array!2417 0))(
  ( (array!2418 (arr!1155 (Array (_ BitVec 32) (_ BitVec 64))) (size!1256 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2417)

(get-info :version)

(assert (=> b!35212 (= res!21393 (and ((_ is Found!163) lt!12944) (bvsge (index!2775 lt!12944) #b00000000000000000000000000000000) (bvslt (index!2775 lt!12944) (size!1256 _keys!1833))))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2417 (_ BitVec 32)) SeekEntryResult!163)

(assert (=> b!35212 (= lt!12944 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35213 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35213 (= e!22241 (not (validKeyInArray!0 (select (arr!1155 _keys!1833) (index!2775 lt!12944)))))))

(declare-fun b!35214 () Bool)

(declare-fun res!21396 () Bool)

(assert (=> b!35214 (=> (not res!21396) (not e!22238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2417 (_ BitVec 32)) Bool)

(assert (=> b!35214 (= res!21396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35215 () Bool)

(declare-fun res!21394 () Bool)

(assert (=> b!35215 (=> (not res!21394) (not e!22238))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1979 0))(
  ( (V!1980 (val!834 Int)) )
))
(declare-datatypes ((ValueCell!608 0))(
  ( (ValueCellFull!608 (v!1929 V!1979)) (EmptyCell!608) )
))
(declare-datatypes ((array!2419 0))(
  ( (array!2420 (arr!1156 (Array (_ BitVec 32) ValueCell!608)) (size!1257 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2419)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1979)

(declare-fun minValue!1443 () V!1979)

(declare-datatypes ((tuple2!1338 0))(
  ( (tuple2!1339 (_1!680 (_ BitVec 64)) (_2!680 V!1979)) )
))
(declare-datatypes ((List!922 0))(
  ( (Nil!919) (Cons!918 (h!1485 tuple2!1338) (t!3622 List!922)) )
))
(declare-datatypes ((ListLongMap!903 0))(
  ( (ListLongMap!904 (toList!467 List!922)) )
))
(declare-fun contains!415 (ListLongMap!903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!286 (array!2417 array!2419 (_ BitVec 32) (_ BitVec 32) V!1979 V!1979 (_ BitVec 32) Int) ListLongMap!903)

(assert (=> b!35215 (= res!21394 (not (contains!415 (getCurrentListMap!286 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!35216 () Bool)

(declare-fun e!22240 () Bool)

(declare-fun tp_is_empty!1615 () Bool)

(assert (=> b!35216 (= e!22240 tp_is_empty!1615)))

(declare-fun mapIsEmpty!1972 () Bool)

(declare-fun mapRes!1972 () Bool)

(assert (=> mapIsEmpty!1972 mapRes!1972))

(declare-fun res!21400 () Bool)

(assert (=> start!4510 (=> (not res!21400) (not e!22238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4510 (= res!21400 (validMask!0 mask!2294))))

(assert (=> start!4510 e!22238))

(assert (=> start!4510 true))

(assert (=> start!4510 tp!5223))

(declare-fun e!22237 () Bool)

(declare-fun array_inv!813 (array!2419) Bool)

(assert (=> start!4510 (and (array_inv!813 _values!1501) e!22237)))

(declare-fun array_inv!814 (array!2417) Bool)

(assert (=> start!4510 (array_inv!814 _keys!1833)))

(assert (=> start!4510 tp_is_empty!1615))

(declare-fun b!35217 () Bool)

(declare-fun res!21398 () Bool)

(assert (=> b!35217 (=> (not res!21398) (not e!22238))))

(declare-datatypes ((List!923 0))(
  ( (Nil!920) (Cons!919 (h!1486 (_ BitVec 64)) (t!3623 List!923)) )
))
(declare-fun arrayNoDuplicates!0 (array!2417 (_ BitVec 32) List!923) Bool)

(assert (=> b!35217 (= res!21398 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!920))))

(declare-fun b!35218 () Bool)

(declare-fun res!21399 () Bool)

(assert (=> b!35218 (=> (not res!21399) (not e!22238))))

(assert (=> b!35218 (= res!21399 (and (= (size!1257 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1256 _keys!1833) (size!1257 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1972 () Bool)

(declare-fun tp!5224 () Bool)

(assert (=> mapNonEmpty!1972 (= mapRes!1972 (and tp!5224 e!22240))))

(declare-fun mapKey!1972 () (_ BitVec 32))

(declare-fun mapValue!1972 () ValueCell!608)

(declare-fun mapRest!1972 () (Array (_ BitVec 32) ValueCell!608))

(assert (=> mapNonEmpty!1972 (= (arr!1156 _values!1501) (store mapRest!1972 mapKey!1972 mapValue!1972))))

(declare-fun b!35219 () Bool)

(declare-fun e!22242 () Bool)

(assert (=> b!35219 (= e!22242 tp_is_empty!1615)))

(declare-fun b!35220 () Bool)

(assert (=> b!35220 (= e!22237 (and e!22242 mapRes!1972))))

(declare-fun condMapEmpty!1972 () Bool)

(declare-fun mapDefault!1972 () ValueCell!608)

(assert (=> b!35220 (= condMapEmpty!1972 (= (arr!1156 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!608)) mapDefault!1972)))))

(declare-fun b!35221 () Bool)

(declare-fun res!21397 () Bool)

(assert (=> b!35221 (=> (not res!21397) (not e!22238))))

(declare-fun arrayContainsKey!0 (array!2417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35221 (= res!21397 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!35222 () Bool)

(declare-fun res!21395 () Bool)

(assert (=> b!35222 (=> (not res!21395) (not e!22238))))

(assert (=> b!35222 (= res!21395 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4510 res!21400) b!35218))

(assert (= (and b!35218 res!21399) b!35214))

(assert (= (and b!35214 res!21396) b!35217))

(assert (= (and b!35217 res!21398) b!35222))

(assert (= (and b!35222 res!21395) b!35215))

(assert (= (and b!35215 res!21394) b!35221))

(assert (= (and b!35221 res!21397) b!35212))

(assert (= (and b!35212 res!21393) b!35213))

(assert (= (and b!35220 condMapEmpty!1972) mapIsEmpty!1972))

(assert (= (and b!35220 (not condMapEmpty!1972)) mapNonEmpty!1972))

(assert (= (and mapNonEmpty!1972 ((_ is ValueCellFull!608) mapValue!1972)) b!35216))

(assert (= (and b!35220 ((_ is ValueCellFull!608) mapDefault!1972)) b!35219))

(assert (= start!4510 b!35220))

(declare-fun m!28297 () Bool)

(assert (=> b!35221 m!28297))

(declare-fun m!28299 () Bool)

(assert (=> b!35222 m!28299))

(declare-fun m!28301 () Bool)

(assert (=> b!35212 m!28301))

(declare-fun m!28303 () Bool)

(assert (=> b!35215 m!28303))

(assert (=> b!35215 m!28303))

(declare-fun m!28305 () Bool)

(assert (=> b!35215 m!28305))

(declare-fun m!28307 () Bool)

(assert (=> b!35214 m!28307))

(declare-fun m!28309 () Bool)

(assert (=> b!35213 m!28309))

(assert (=> b!35213 m!28309))

(declare-fun m!28311 () Bool)

(assert (=> b!35213 m!28311))

(declare-fun m!28313 () Bool)

(assert (=> mapNonEmpty!1972 m!28313))

(declare-fun m!28315 () Bool)

(assert (=> b!35217 m!28315))

(declare-fun m!28317 () Bool)

(assert (=> start!4510 m!28317))

(declare-fun m!28319 () Bool)

(assert (=> start!4510 m!28319))

(declare-fun m!28321 () Bool)

(assert (=> start!4510 m!28321))

(check-sat (not b!35213) (not mapNonEmpty!1972) tp_is_empty!1615 (not b!35215) (not start!4510) (not b!35217) (not b!35212) (not b_next!1261) (not b!35214) (not b!35221) (not b!35222) b_and!2079)
(check-sat b_and!2079 (not b_next!1261))
(get-model)

(declare-fun d!5259 () Bool)

(declare-fun res!21453 () Bool)

(declare-fun e!22287 () Bool)

(assert (=> d!5259 (=> res!21453 e!22287)))

(assert (=> d!5259 (= res!21453 (bvsge #b00000000000000000000000000000000 (size!1256 _keys!1833)))))

(assert (=> d!5259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22287)))

(declare-fun b!35297 () Bool)

(declare-fun e!22286 () Bool)

(assert (=> b!35297 (= e!22287 e!22286)))

(declare-fun c!3986 () Bool)

(assert (=> b!35297 (= c!3986 (validKeyInArray!0 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35298 () Bool)

(declare-fun e!22285 () Bool)

(assert (=> b!35298 (= e!22286 e!22285)))

(declare-fun lt!12957 () (_ BitVec 64))

(assert (=> b!35298 (= lt!12957 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!780 0))(
  ( (Unit!781) )
))
(declare-fun lt!12959 () Unit!780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2417 (_ BitVec 64) (_ BitVec 32)) Unit!780)

(assert (=> b!35298 (= lt!12959 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12957 #b00000000000000000000000000000000))))

(assert (=> b!35298 (arrayContainsKey!0 _keys!1833 lt!12957 #b00000000000000000000000000000000)))

(declare-fun lt!12958 () Unit!780)

(assert (=> b!35298 (= lt!12958 lt!12959)))

(declare-fun res!21454 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2417 (_ BitVec 32)) SeekEntryResult!163)

(assert (=> b!35298 (= res!21454 (= (seekEntryOrOpen!0 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!163 #b00000000000000000000000000000000)))))

(assert (=> b!35298 (=> (not res!21454) (not e!22285))))

(declare-fun b!35299 () Bool)

(declare-fun call!2781 () Bool)

(assert (=> b!35299 (= e!22285 call!2781)))

(declare-fun bm!2778 () Bool)

(assert (=> bm!2778 (= call!2781 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!35300 () Bool)

(assert (=> b!35300 (= e!22286 call!2781)))

(assert (= (and d!5259 (not res!21453)) b!35297))

(assert (= (and b!35297 c!3986) b!35298))

(assert (= (and b!35297 (not c!3986)) b!35300))

(assert (= (and b!35298 res!21454) b!35299))

(assert (= (or b!35299 b!35300) bm!2778))

(declare-fun m!28375 () Bool)

(assert (=> b!35297 m!28375))

(assert (=> b!35297 m!28375))

(declare-fun m!28377 () Bool)

(assert (=> b!35297 m!28377))

(assert (=> b!35298 m!28375))

(declare-fun m!28379 () Bool)

(assert (=> b!35298 m!28379))

(declare-fun m!28381 () Bool)

(assert (=> b!35298 m!28381))

(assert (=> b!35298 m!28375))

(declare-fun m!28383 () Bool)

(assert (=> b!35298 m!28383))

(declare-fun m!28385 () Bool)

(assert (=> bm!2778 m!28385))

(assert (=> b!35214 d!5259))

(declare-fun d!5261 () Bool)

(assert (=> d!5261 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4510 d!5261))

(declare-fun d!5263 () Bool)

(assert (=> d!5263 (= (array_inv!813 _values!1501) (bvsge (size!1257 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4510 d!5263))

(declare-fun d!5265 () Bool)

(assert (=> d!5265 (= (array_inv!814 _keys!1833) (bvsge (size!1256 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4510 d!5265))

(declare-fun d!5267 () Bool)

(assert (=> d!5267 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35222 d!5267))

(declare-fun d!5269 () Bool)

(declare-fun e!22292 () Bool)

(assert (=> d!5269 e!22292))

(declare-fun res!21457 () Bool)

(assert (=> d!5269 (=> res!21457 e!22292)))

(declare-fun lt!12968 () Bool)

(assert (=> d!5269 (= res!21457 (not lt!12968))))

(declare-fun lt!12970 () Bool)

(assert (=> d!5269 (= lt!12968 lt!12970)))

(declare-fun lt!12971 () Unit!780)

(declare-fun e!22293 () Unit!780)

(assert (=> d!5269 (= lt!12971 e!22293)))

(declare-fun c!3989 () Bool)

(assert (=> d!5269 (= c!3989 lt!12970)))

(declare-fun containsKey!35 (List!922 (_ BitVec 64)) Bool)

(assert (=> d!5269 (= lt!12970 (containsKey!35 (toList!467 (getCurrentListMap!286 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5269 (= (contains!415 (getCurrentListMap!286 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!12968)))

(declare-fun b!35307 () Bool)

(declare-fun lt!12969 () Unit!780)

(assert (=> b!35307 (= e!22293 lt!12969)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!32 (List!922 (_ BitVec 64)) Unit!780)

(assert (=> b!35307 (= lt!12969 (lemmaContainsKeyImpliesGetValueByKeyDefined!32 (toList!467 (getCurrentListMap!286 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!77 0))(
  ( (Some!76 (v!1932 V!1979)) (None!75) )
))
(declare-fun isDefined!33 (Option!77) Bool)

(declare-fun getValueByKey!71 (List!922 (_ BitVec 64)) Option!77)

(assert (=> b!35307 (isDefined!33 (getValueByKey!71 (toList!467 (getCurrentListMap!286 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!35308 () Bool)

(declare-fun Unit!782 () Unit!780)

(assert (=> b!35308 (= e!22293 Unit!782)))

(declare-fun b!35309 () Bool)

(assert (=> b!35309 (= e!22292 (isDefined!33 (getValueByKey!71 (toList!467 (getCurrentListMap!286 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5269 c!3989) b!35307))

(assert (= (and d!5269 (not c!3989)) b!35308))

(assert (= (and d!5269 (not res!21457)) b!35309))

(declare-fun m!28387 () Bool)

(assert (=> d!5269 m!28387))

(declare-fun m!28389 () Bool)

(assert (=> b!35307 m!28389))

(declare-fun m!28391 () Bool)

(assert (=> b!35307 m!28391))

(assert (=> b!35307 m!28391))

(declare-fun m!28393 () Bool)

(assert (=> b!35307 m!28393))

(assert (=> b!35309 m!28391))

(assert (=> b!35309 m!28391))

(assert (=> b!35309 m!28393))

(assert (=> b!35215 d!5269))

(declare-fun bm!2793 () Bool)

(declare-fun call!2800 () ListLongMap!903)

(declare-fun call!2801 () ListLongMap!903)

(assert (=> bm!2793 (= call!2800 call!2801)))

(declare-fun call!2798 () ListLongMap!903)

(declare-fun bm!2794 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!27 (array!2417 array!2419 (_ BitVec 32) (_ BitVec 32) V!1979 V!1979 (_ BitVec 32) Int) ListLongMap!903)

(assert (=> bm!2794 (= call!2798 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun c!4004 () Bool)

(declare-fun call!2796 () ListLongMap!903)

(declare-fun c!4006 () Bool)

(declare-fun bm!2795 () Bool)

(declare-fun +!58 (ListLongMap!903 tuple2!1338) ListLongMap!903)

(assert (=> bm!2795 (= call!2796 (+!58 (ite c!4006 call!2798 (ite c!4004 call!2801 call!2800)) (ite (or c!4006 c!4004) (tuple2!1339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun d!5271 () Bool)

(declare-fun e!22326 () Bool)

(assert (=> d!5271 e!22326))

(declare-fun res!21484 () Bool)

(assert (=> d!5271 (=> (not res!21484) (not e!22326))))

(assert (=> d!5271 (= res!21484 (or (bvsge #b00000000000000000000000000000000 (size!1256 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1256 _keys!1833)))))))

(declare-fun lt!13035 () ListLongMap!903)

(declare-fun lt!13021 () ListLongMap!903)

(assert (=> d!5271 (= lt!13035 lt!13021)))

(declare-fun lt!13029 () Unit!780)

(declare-fun e!22329 () Unit!780)

(assert (=> d!5271 (= lt!13029 e!22329)))

(declare-fun c!4005 () Bool)

(declare-fun e!22320 () Bool)

(assert (=> d!5271 (= c!4005 e!22320)))

(declare-fun res!21480 () Bool)

(assert (=> d!5271 (=> (not res!21480) (not e!22320))))

(assert (=> d!5271 (= res!21480 (bvslt #b00000000000000000000000000000000 (size!1256 _keys!1833)))))

(declare-fun e!22331 () ListLongMap!903)

(assert (=> d!5271 (= lt!13021 e!22331)))

(assert (=> d!5271 (= c!4006 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5271 (validMask!0 mask!2294)))

(assert (=> d!5271 (= (getCurrentListMap!286 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!13035)))

(declare-fun b!35352 () Bool)

(declare-fun res!21483 () Bool)

(assert (=> b!35352 (=> (not res!21483) (not e!22326))))

(declare-fun e!22330 () Bool)

(assert (=> b!35352 (= res!21483 e!22330)))

(declare-fun c!4003 () Bool)

(assert (=> b!35352 (= c!4003 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!35353 () Bool)

(declare-fun e!22321 () ListLongMap!903)

(declare-fun call!2802 () ListLongMap!903)

(assert (=> b!35353 (= e!22321 call!2802)))

(declare-fun b!35354 () Bool)

(declare-fun e!22323 () Bool)

(declare-fun apply!40 (ListLongMap!903 (_ BitVec 64)) V!1979)

(assert (=> b!35354 (= e!22323 (= (apply!40 lt!13035 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!35355 () Bool)

(declare-fun e!22324 () Bool)

(assert (=> b!35355 (= e!22326 e!22324)))

(declare-fun c!4002 () Bool)

(assert (=> b!35355 (= c!4002 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35356 () Bool)

(assert (=> b!35356 (= e!22331 (+!58 call!2796 (tuple2!1339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun bm!2796 () Bool)

(declare-fun call!2797 () Bool)

(assert (=> bm!2796 (= call!2797 (contains!415 lt!13035 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35357 () Bool)

(declare-fun e!22328 () Bool)

(declare-fun get!603 (ValueCell!608 V!1979) V!1979)

(declare-fun dynLambda!156 (Int (_ BitVec 64)) V!1979)

(assert (=> b!35357 (= e!22328 (= (apply!40 lt!13035 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000)) (get!603 (select (arr!1156 _values!1501) #b00000000000000000000000000000000) (dynLambda!156 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35357 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1257 _values!1501)))))

(assert (=> b!35357 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1256 _keys!1833)))))

(declare-fun b!35358 () Bool)

(declare-fun e!22322 () Bool)

(assert (=> b!35358 (= e!22322 (= (apply!40 lt!13035 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!35359 () Bool)

(declare-fun lt!13037 () Unit!780)

(assert (=> b!35359 (= e!22329 lt!13037)))

(declare-fun lt!13019 () ListLongMap!903)

(assert (=> b!35359 (= lt!13019 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13028 () (_ BitVec 64))

(assert (=> b!35359 (= lt!13028 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13024 () (_ BitVec 64))

(assert (=> b!35359 (= lt!13024 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13027 () Unit!780)

(declare-fun addStillContains!25 (ListLongMap!903 (_ BitVec 64) V!1979 (_ BitVec 64)) Unit!780)

(assert (=> b!35359 (= lt!13027 (addStillContains!25 lt!13019 lt!13028 zeroValue!1443 lt!13024))))

(assert (=> b!35359 (contains!415 (+!58 lt!13019 (tuple2!1339 lt!13028 zeroValue!1443)) lt!13024)))

(declare-fun lt!13034 () Unit!780)

(assert (=> b!35359 (= lt!13034 lt!13027)))

(declare-fun lt!13030 () ListLongMap!903)

(assert (=> b!35359 (= lt!13030 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13022 () (_ BitVec 64))

(assert (=> b!35359 (= lt!13022 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13025 () (_ BitVec 64))

(assert (=> b!35359 (= lt!13025 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13031 () Unit!780)

(declare-fun addApplyDifferent!25 (ListLongMap!903 (_ BitVec 64) V!1979 (_ BitVec 64)) Unit!780)

(assert (=> b!35359 (= lt!13031 (addApplyDifferent!25 lt!13030 lt!13022 minValue!1443 lt!13025))))

(assert (=> b!35359 (= (apply!40 (+!58 lt!13030 (tuple2!1339 lt!13022 minValue!1443)) lt!13025) (apply!40 lt!13030 lt!13025))))

(declare-fun lt!13023 () Unit!780)

(assert (=> b!35359 (= lt!13023 lt!13031)))

(declare-fun lt!13017 () ListLongMap!903)

(assert (=> b!35359 (= lt!13017 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13020 () (_ BitVec 64))

(assert (=> b!35359 (= lt!13020 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13016 () (_ BitVec 64))

(assert (=> b!35359 (= lt!13016 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13033 () Unit!780)

(assert (=> b!35359 (= lt!13033 (addApplyDifferent!25 lt!13017 lt!13020 zeroValue!1443 lt!13016))))

(assert (=> b!35359 (= (apply!40 (+!58 lt!13017 (tuple2!1339 lt!13020 zeroValue!1443)) lt!13016) (apply!40 lt!13017 lt!13016))))

(declare-fun lt!13018 () Unit!780)

(assert (=> b!35359 (= lt!13018 lt!13033)))

(declare-fun lt!13026 () ListLongMap!903)

(assert (=> b!35359 (= lt!13026 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13032 () (_ BitVec 64))

(assert (=> b!35359 (= lt!13032 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13036 () (_ BitVec 64))

(assert (=> b!35359 (= lt!13036 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35359 (= lt!13037 (addApplyDifferent!25 lt!13026 lt!13032 minValue!1443 lt!13036))))

(assert (=> b!35359 (= (apply!40 (+!58 lt!13026 (tuple2!1339 lt!13032 minValue!1443)) lt!13036) (apply!40 lt!13026 lt!13036))))

(declare-fun b!35360 () Bool)

(declare-fun c!4007 () Bool)

(assert (=> b!35360 (= c!4007 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!22325 () ListLongMap!903)

(assert (=> b!35360 (= e!22325 e!22321)))

(declare-fun b!35361 () Bool)

(assert (=> b!35361 (= e!22330 e!22322)))

(declare-fun res!21481 () Bool)

(declare-fun call!2799 () Bool)

(assert (=> b!35361 (= res!21481 call!2799)))

(assert (=> b!35361 (=> (not res!21481) (not e!22322))))

(declare-fun b!35362 () Bool)

(assert (=> b!35362 (= e!22321 call!2800)))

(declare-fun bm!2797 () Bool)

(assert (=> bm!2797 (= call!2802 call!2796)))

(declare-fun b!35363 () Bool)

(declare-fun Unit!783 () Unit!780)

(assert (=> b!35363 (= e!22329 Unit!783)))

(declare-fun bm!2798 () Bool)

(assert (=> bm!2798 (= call!2801 call!2798)))

(declare-fun b!35364 () Bool)

(assert (=> b!35364 (= e!22325 call!2802)))

(declare-fun bm!2799 () Bool)

(assert (=> bm!2799 (= call!2799 (contains!415 lt!13035 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35365 () Bool)

(declare-fun e!22332 () Bool)

(assert (=> b!35365 (= e!22332 (validKeyInArray!0 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35366 () Bool)

(assert (=> b!35366 (= e!22320 (validKeyInArray!0 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35367 () Bool)

(declare-fun res!21482 () Bool)

(assert (=> b!35367 (=> (not res!21482) (not e!22326))))

(declare-fun e!22327 () Bool)

(assert (=> b!35367 (= res!21482 e!22327)))

(declare-fun res!21479 () Bool)

(assert (=> b!35367 (=> res!21479 e!22327)))

(assert (=> b!35367 (= res!21479 (not e!22332))))

(declare-fun res!21477 () Bool)

(assert (=> b!35367 (=> (not res!21477) (not e!22332))))

(assert (=> b!35367 (= res!21477 (bvslt #b00000000000000000000000000000000 (size!1256 _keys!1833)))))

(declare-fun b!35368 () Bool)

(assert (=> b!35368 (= e!22330 (not call!2799))))

(declare-fun b!35369 () Bool)

(assert (=> b!35369 (= e!22324 e!22323)))

(declare-fun res!21476 () Bool)

(assert (=> b!35369 (= res!21476 call!2797)))

(assert (=> b!35369 (=> (not res!21476) (not e!22323))))

(declare-fun b!35370 () Bool)

(assert (=> b!35370 (= e!22327 e!22328)))

(declare-fun res!21478 () Bool)

(assert (=> b!35370 (=> (not res!21478) (not e!22328))))

(assert (=> b!35370 (= res!21478 (contains!415 lt!13035 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35370 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1256 _keys!1833)))))

(declare-fun b!35371 () Bool)

(assert (=> b!35371 (= e!22324 (not call!2797))))

(declare-fun b!35372 () Bool)

(assert (=> b!35372 (= e!22331 e!22325)))

(assert (=> b!35372 (= c!4004 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!5271 c!4006) b!35356))

(assert (= (and d!5271 (not c!4006)) b!35372))

(assert (= (and b!35372 c!4004) b!35364))

(assert (= (and b!35372 (not c!4004)) b!35360))

(assert (= (and b!35360 c!4007) b!35353))

(assert (= (and b!35360 (not c!4007)) b!35362))

(assert (= (or b!35353 b!35362) bm!2793))

(assert (= (or b!35364 bm!2793) bm!2798))

(assert (= (or b!35364 b!35353) bm!2797))

(assert (= (or b!35356 bm!2798) bm!2794))

(assert (= (or b!35356 bm!2797) bm!2795))

(assert (= (and d!5271 res!21480) b!35366))

(assert (= (and d!5271 c!4005) b!35359))

(assert (= (and d!5271 (not c!4005)) b!35363))

(assert (= (and d!5271 res!21484) b!35367))

(assert (= (and b!35367 res!21477) b!35365))

(assert (= (and b!35367 (not res!21479)) b!35370))

(assert (= (and b!35370 res!21478) b!35357))

(assert (= (and b!35367 res!21482) b!35352))

(assert (= (and b!35352 c!4003) b!35361))

(assert (= (and b!35352 (not c!4003)) b!35368))

(assert (= (and b!35361 res!21481) b!35358))

(assert (= (or b!35361 b!35368) bm!2799))

(assert (= (and b!35352 res!21483) b!35355))

(assert (= (and b!35355 c!4002) b!35369))

(assert (= (and b!35355 (not c!4002)) b!35371))

(assert (= (and b!35369 res!21476) b!35354))

(assert (= (or b!35369 b!35371) bm!2796))

(declare-fun b_lambda!1711 () Bool)

(assert (=> (not b_lambda!1711) (not b!35357)))

(declare-fun t!3629 () Bool)

(declare-fun tb!689 () Bool)

(assert (=> (and start!4510 (= defaultEntry!1504 defaultEntry!1504) t!3629) tb!689))

(declare-fun result!1189 () Bool)

(assert (=> tb!689 (= result!1189 tp_is_empty!1615)))

(assert (=> b!35357 t!3629))

(declare-fun b_and!2085 () Bool)

(assert (= b_and!2079 (and (=> t!3629 result!1189) b_and!2085)))

(declare-fun m!28395 () Bool)

(assert (=> b!35354 m!28395))

(assert (=> b!35366 m!28375))

(assert (=> b!35366 m!28375))

(assert (=> b!35366 m!28377))

(assert (=> d!5271 m!28317))

(declare-fun m!28397 () Bool)

(assert (=> b!35358 m!28397))

(declare-fun m!28399 () Bool)

(assert (=> b!35357 m!28399))

(assert (=> b!35357 m!28375))

(declare-fun m!28401 () Bool)

(assert (=> b!35357 m!28401))

(assert (=> b!35357 m!28399))

(declare-fun m!28403 () Bool)

(assert (=> b!35357 m!28403))

(declare-fun m!28405 () Bool)

(assert (=> b!35357 m!28405))

(assert (=> b!35357 m!28375))

(assert (=> b!35357 m!28403))

(declare-fun m!28407 () Bool)

(assert (=> b!35359 m!28407))

(assert (=> b!35359 m!28375))

(declare-fun m!28409 () Bool)

(assert (=> b!35359 m!28409))

(declare-fun m!28411 () Bool)

(assert (=> b!35359 m!28411))

(declare-fun m!28413 () Bool)

(assert (=> b!35359 m!28413))

(declare-fun m!28415 () Bool)

(assert (=> b!35359 m!28415))

(declare-fun m!28417 () Bool)

(assert (=> b!35359 m!28417))

(declare-fun m!28419 () Bool)

(assert (=> b!35359 m!28419))

(declare-fun m!28421 () Bool)

(assert (=> b!35359 m!28421))

(declare-fun m!28423 () Bool)

(assert (=> b!35359 m!28423))

(assert (=> b!35359 m!28411))

(declare-fun m!28425 () Bool)

(assert (=> b!35359 m!28425))

(declare-fun m!28427 () Bool)

(assert (=> b!35359 m!28427))

(assert (=> b!35359 m!28427))

(declare-fun m!28429 () Bool)

(assert (=> b!35359 m!28429))

(assert (=> b!35359 m!28413))

(declare-fun m!28431 () Bool)

(assert (=> b!35359 m!28431))

(declare-fun m!28433 () Bool)

(assert (=> b!35359 m!28433))

(declare-fun m!28435 () Bool)

(assert (=> b!35359 m!28435))

(assert (=> b!35359 m!28435))

(declare-fun m!28437 () Bool)

(assert (=> b!35359 m!28437))

(declare-fun m!28439 () Bool)

(assert (=> b!35356 m!28439))

(assert (=> bm!2794 m!28431))

(declare-fun m!28441 () Bool)

(assert (=> bm!2796 m!28441))

(declare-fun m!28443 () Bool)

(assert (=> bm!2799 m!28443))

(declare-fun m!28445 () Bool)

(assert (=> bm!2795 m!28445))

(assert (=> b!35370 m!28375))

(assert (=> b!35370 m!28375))

(declare-fun m!28447 () Bool)

(assert (=> b!35370 m!28447))

(assert (=> b!35365 m!28375))

(assert (=> b!35365 m!28375))

(assert (=> b!35365 m!28377))

(assert (=> b!35215 d!5271))

(declare-fun d!5273 () Bool)

(assert (=> d!5273 (= (validKeyInArray!0 (select (arr!1155 _keys!1833) (index!2775 lt!12944))) (and (not (= (select (arr!1155 _keys!1833) (index!2775 lt!12944)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1155 _keys!1833) (index!2775 lt!12944)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35213 d!5273))

(declare-fun d!5275 () Bool)

(declare-fun res!21493 () Bool)

(declare-fun e!22344 () Bool)

(assert (=> d!5275 (=> res!21493 e!22344)))

(assert (=> d!5275 (= res!21493 (bvsge #b00000000000000000000000000000000 (size!1256 _keys!1833)))))

(assert (=> d!5275 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!920) e!22344)))

(declare-fun b!35385 () Bool)

(declare-fun e!22341 () Bool)

(declare-fun e!22342 () Bool)

(assert (=> b!35385 (= e!22341 e!22342)))

(declare-fun c!4010 () Bool)

(assert (=> b!35385 (= c!4010 (validKeyInArray!0 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35386 () Bool)

(assert (=> b!35386 (= e!22344 e!22341)))

(declare-fun res!21491 () Bool)

(assert (=> b!35386 (=> (not res!21491) (not e!22341))))

(declare-fun e!22343 () Bool)

(assert (=> b!35386 (= res!21491 (not e!22343))))

(declare-fun res!21492 () Bool)

(assert (=> b!35386 (=> (not res!21492) (not e!22343))))

(assert (=> b!35386 (= res!21492 (validKeyInArray!0 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35387 () Bool)

(declare-fun call!2805 () Bool)

(assert (=> b!35387 (= e!22342 call!2805)))

(declare-fun bm!2802 () Bool)

(assert (=> bm!2802 (= call!2805 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4010 (Cons!919 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000) Nil!920) Nil!920)))))

(declare-fun b!35388 () Bool)

(assert (=> b!35388 (= e!22342 call!2805)))

(declare-fun b!35389 () Bool)

(declare-fun contains!418 (List!923 (_ BitVec 64)) Bool)

(assert (=> b!35389 (= e!22343 (contains!418 Nil!920 (select (arr!1155 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5275 (not res!21493)) b!35386))

(assert (= (and b!35386 res!21492) b!35389))

(assert (= (and b!35386 res!21491) b!35385))

(assert (= (and b!35385 c!4010) b!35388))

(assert (= (and b!35385 (not c!4010)) b!35387))

(assert (= (or b!35388 b!35387) bm!2802))

(assert (=> b!35385 m!28375))

(assert (=> b!35385 m!28375))

(assert (=> b!35385 m!28377))

(assert (=> b!35386 m!28375))

(assert (=> b!35386 m!28375))

(assert (=> b!35386 m!28377))

(assert (=> bm!2802 m!28375))

(declare-fun m!28449 () Bool)

(assert (=> bm!2802 m!28449))

(assert (=> b!35389 m!28375))

(assert (=> b!35389 m!28375))

(declare-fun m!28451 () Bool)

(assert (=> b!35389 m!28451))

(assert (=> b!35217 d!5275))

(declare-fun d!5277 () Bool)

(declare-fun res!21498 () Bool)

(declare-fun e!22349 () Bool)

(assert (=> d!5277 (=> res!21498 e!22349)))

(assert (=> d!5277 (= res!21498 (= (select (arr!1155 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5277 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22349)))

(declare-fun b!35394 () Bool)

(declare-fun e!22350 () Bool)

(assert (=> b!35394 (= e!22349 e!22350)))

(declare-fun res!21499 () Bool)

(assert (=> b!35394 (=> (not res!21499) (not e!22350))))

(assert (=> b!35394 (= res!21499 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1256 _keys!1833)))))

(declare-fun b!35395 () Bool)

(assert (=> b!35395 (= e!22350 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5277 (not res!21498)) b!35394))

(assert (= (and b!35394 res!21499) b!35395))

(assert (=> d!5277 m!28375))

(declare-fun m!28453 () Bool)

(assert (=> b!35395 m!28453))

(assert (=> b!35221 d!5277))

(declare-fun b!35408 () Bool)

(declare-fun e!22358 () SeekEntryResult!163)

(declare-fun e!22357 () SeekEntryResult!163)

(assert (=> b!35408 (= e!22358 e!22357)))

(declare-fun lt!13047 () (_ BitVec 64))

(declare-fun lt!13048 () SeekEntryResult!163)

(assert (=> b!35408 (= lt!13047 (select (arr!1155 _keys!1833) (index!2776 lt!13048)))))

(declare-fun c!4019 () Bool)

(assert (=> b!35408 (= c!4019 (= lt!13047 k0!1304))))

(declare-fun b!35410 () Bool)

(assert (=> b!35410 (= e!22357 (Found!163 (index!2776 lt!13048)))))

(declare-fun b!35411 () Bool)

(declare-fun e!22359 () SeekEntryResult!163)

(declare-fun lt!13046 () SeekEntryResult!163)

(assert (=> b!35411 (= e!22359 (ite ((_ is MissingVacant!163) lt!13046) (MissingZero!163 (index!2777 lt!13046)) lt!13046))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2417 (_ BitVec 32)) SeekEntryResult!163)

(assert (=> b!35411 (= lt!13046 (seekKeyOrZeroReturnVacant!0 (x!7007 lt!13048) (index!2776 lt!13048) (index!2776 lt!13048) k0!1304 _keys!1833 mask!2294))))

(declare-fun d!5279 () Bool)

(declare-fun lt!13049 () SeekEntryResult!163)

(assert (=> d!5279 (and (or ((_ is MissingVacant!163) lt!13049) (not ((_ is Found!163) lt!13049)) (and (bvsge (index!2775 lt!13049) #b00000000000000000000000000000000) (bvslt (index!2775 lt!13049) (size!1256 _keys!1833)))) (not ((_ is MissingVacant!163) lt!13049)) (or (not ((_ is Found!163) lt!13049)) (= (select (arr!1155 _keys!1833) (index!2775 lt!13049)) k0!1304)))))

(assert (=> d!5279 (= lt!13049 e!22358)))

(declare-fun c!4018 () Bool)

(assert (=> d!5279 (= c!4018 (and ((_ is Intermediate!163) lt!13048) (undefined!975 lt!13048)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2417 (_ BitVec 32)) SeekEntryResult!163)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5279 (= lt!13048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5279 (validMask!0 mask!2294)))

(assert (=> d!5279 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!13049)))

(declare-fun b!35409 () Bool)

(assert (=> b!35409 (= e!22359 (MissingZero!163 (index!2776 lt!13048)))))

(declare-fun b!35412 () Bool)

(assert (=> b!35412 (= e!22358 Undefined!163)))

(declare-fun b!35413 () Bool)

(declare-fun c!4017 () Bool)

(assert (=> b!35413 (= c!4017 (= lt!13047 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!35413 (= e!22357 e!22359)))

(assert (= (and d!5279 c!4018) b!35412))

(assert (= (and d!5279 (not c!4018)) b!35408))

(assert (= (and b!35408 c!4019) b!35410))

(assert (= (and b!35408 (not c!4019)) b!35413))

(assert (= (and b!35413 c!4017) b!35409))

(assert (= (and b!35413 (not c!4017)) b!35411))

(declare-fun m!28455 () Bool)

(assert (=> b!35408 m!28455))

(declare-fun m!28457 () Bool)

(assert (=> b!35411 m!28457))

(declare-fun m!28459 () Bool)

(assert (=> d!5279 m!28459))

(declare-fun m!28461 () Bool)

(assert (=> d!5279 m!28461))

(assert (=> d!5279 m!28461))

(declare-fun m!28463 () Bool)

(assert (=> d!5279 m!28463))

(assert (=> d!5279 m!28317))

(assert (=> b!35212 d!5279))

(declare-fun condMapEmpty!1981 () Bool)

(declare-fun mapDefault!1981 () ValueCell!608)

(assert (=> mapNonEmpty!1972 (= condMapEmpty!1981 (= mapRest!1972 ((as const (Array (_ BitVec 32) ValueCell!608)) mapDefault!1981)))))

(declare-fun e!22364 () Bool)

(declare-fun mapRes!1981 () Bool)

(assert (=> mapNonEmpty!1972 (= tp!5224 (and e!22364 mapRes!1981))))

(declare-fun mapNonEmpty!1981 () Bool)

(declare-fun tp!5239 () Bool)

(declare-fun e!22365 () Bool)

(assert (=> mapNonEmpty!1981 (= mapRes!1981 (and tp!5239 e!22365))))

(declare-fun mapRest!1981 () (Array (_ BitVec 32) ValueCell!608))

(declare-fun mapValue!1981 () ValueCell!608)

(declare-fun mapKey!1981 () (_ BitVec 32))

(assert (=> mapNonEmpty!1981 (= mapRest!1972 (store mapRest!1981 mapKey!1981 mapValue!1981))))

(declare-fun mapIsEmpty!1981 () Bool)

(assert (=> mapIsEmpty!1981 mapRes!1981))

(declare-fun b!35420 () Bool)

(assert (=> b!35420 (= e!22365 tp_is_empty!1615)))

(declare-fun b!35421 () Bool)

(assert (=> b!35421 (= e!22364 tp_is_empty!1615)))

(assert (= (and mapNonEmpty!1972 condMapEmpty!1981) mapIsEmpty!1981))

(assert (= (and mapNonEmpty!1972 (not condMapEmpty!1981)) mapNonEmpty!1981))

(assert (= (and mapNonEmpty!1981 ((_ is ValueCellFull!608) mapValue!1981)) b!35420))

(assert (= (and mapNonEmpty!1972 ((_ is ValueCellFull!608) mapDefault!1981)) b!35421))

(declare-fun m!28465 () Bool)

(assert (=> mapNonEmpty!1981 m!28465))

(declare-fun b_lambda!1713 () Bool)

(assert (= b_lambda!1711 (or (and start!4510 b_free!1261) b_lambda!1713)))

(check-sat (not bm!2795) (not b!35307) b_and!2085 (not b!35389) (not b!35365) tp_is_empty!1615 (not b!35358) (not d!5269) (not bm!2802) (not b!35297) (not b!35366) (not b!35395) (not d!5279) (not bm!2799) (not b!35354) (not b!35411) (not b_lambda!1713) (not b!35298) (not mapNonEmpty!1981) (not b!35359) (not d!5271) (not b!35385) (not b!35370) (not b!35309) (not bm!2778) (not b!35357) (not b!35356) (not bm!2794) (not bm!2796) (not b!35386) (not b_next!1261))
(check-sat b_and!2085 (not b_next!1261))
