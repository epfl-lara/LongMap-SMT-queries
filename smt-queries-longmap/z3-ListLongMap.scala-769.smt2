; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18100 () Bool)

(assert start!18100)

(declare-fun b!180266 () Bool)

(declare-fun b_free!4455 () Bool)

(declare-fun b_next!4455 () Bool)

(assert (=> b!180266 (= b_free!4455 (not b_next!4455))))

(declare-fun tp!16098 () Bool)

(declare-fun b_and!10989 () Bool)

(assert (=> b!180266 (= tp!16098 b_and!10989)))

(declare-fun b!180259 () Bool)

(declare-fun e!118748 () Bool)

(declare-fun tp_is_empty!4227 () Bool)

(assert (=> b!180259 (= e!118748 tp_is_empty!4227)))

(declare-fun b!180260 () Bool)

(declare-fun res!85386 () Bool)

(declare-fun e!118744 () Bool)

(assert (=> b!180260 (=> (not res!85386) (not e!118744))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!180260 (= res!85386 (not (= key!828 (bvneg key!828))))))

(declare-fun b!180261 () Bool)

(declare-fun e!118750 () Bool)

(declare-fun e!118749 () Bool)

(declare-fun mapRes!7237 () Bool)

(assert (=> b!180261 (= e!118750 (and e!118749 mapRes!7237))))

(declare-fun condMapEmpty!7237 () Bool)

(declare-datatypes ((V!5283 0))(
  ( (V!5284 (val!2158 Int)) )
))
(declare-datatypes ((ValueCell!1770 0))(
  ( (ValueCellFull!1770 (v!4049 V!5283)) (EmptyCell!1770) )
))
(declare-datatypes ((array!7625 0))(
  ( (array!7626 (arr!3611 (Array (_ BitVec 32) (_ BitVec 64))) (size!3919 (_ BitVec 32))) )
))
(declare-datatypes ((array!7627 0))(
  ( (array!7628 (arr!3612 (Array (_ BitVec 32) ValueCell!1770)) (size!3920 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2448 0))(
  ( (LongMapFixedSize!2449 (defaultEntry!3700 Int) (mask!8698 (_ BitVec 32)) (extraKeys!3437 (_ BitVec 32)) (zeroValue!3541 V!5283) (minValue!3541 V!5283) (_size!1273 (_ BitVec 32)) (_keys!5592 array!7625) (_values!3683 array!7627) (_vacant!1273 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2448)

(declare-fun mapDefault!7237 () ValueCell!1770)

(assert (=> b!180261 (= condMapEmpty!7237 (= (arr!3612 (_values!3683 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1770)) mapDefault!7237)))))

(declare-fun e!118745 () Bool)

(declare-datatypes ((tuple2!3362 0))(
  ( (tuple2!3363 (_1!1692 (_ BitVec 64)) (_2!1692 V!5283)) )
))
(declare-datatypes ((List!2293 0))(
  ( (Nil!2290) (Cons!2289 (h!2914 tuple2!3362) (t!7141 List!2293)) )
))
(declare-datatypes ((ListLongMap!2283 0))(
  ( (ListLongMap!2284 (toList!1157 List!2293)) )
))
(declare-fun call!18216 () ListLongMap!2283)

(declare-fun lt!89039 () ListLongMap!2283)

(declare-fun v!309 () V!5283)

(declare-fun b!180262 () Bool)

(declare-fun +!267 (ListLongMap!2283 tuple2!3362) ListLongMap!2283)

(assert (=> b!180262 (= e!118745 (not (= lt!89039 (+!267 call!18216 (tuple2!3363 key!828 v!309)))))))

(declare-fun b!180264 () Bool)

(declare-fun e!118743 () Bool)

(declare-fun e!118751 () Bool)

(assert (=> b!180264 (= e!118743 e!118751)))

(declare-fun c!32285 () Bool)

(declare-datatypes ((tuple2!3364 0))(
  ( (tuple2!3365 (_1!1693 Bool) (_2!1693 LongMapFixedSize!2448)) )
))
(declare-fun lt!89038 () tuple2!3364)

(assert (=> b!180264 (= c!32285 (_1!1693 lt!89038))))

(declare-fun b!180265 () Bool)

(declare-fun call!18217 () ListLongMap!2283)

(assert (=> b!180265 (= e!118751 (not (= call!18217 call!18216)))))

(declare-fun mapIsEmpty!7237 () Bool)

(assert (=> mapIsEmpty!7237 mapRes!7237))

(declare-fun e!118742 () Bool)

(declare-fun array_inv!2325 (array!7625) Bool)

(declare-fun array_inv!2326 (array!7627) Bool)

(assert (=> b!180266 (= e!118742 (and tp!16098 tp_is_empty!4227 (array_inv!2325 (_keys!5592 thiss!1248)) (array_inv!2326 (_values!3683 thiss!1248)) e!118750))))

(declare-fun b!180267 () Bool)

(declare-fun e!118747 () Bool)

(assert (=> b!180267 (= e!118744 e!118747)))

(declare-fun res!85385 () Bool)

(assert (=> b!180267 (=> (not res!85385) (not e!118747))))

(declare-datatypes ((SeekEntryResult!591 0))(
  ( (MissingZero!591 (index!4533 (_ BitVec 32))) (Found!591 (index!4534 (_ BitVec 32))) (Intermediate!591 (undefined!1403 Bool) (index!4535 (_ BitVec 32)) (x!19703 (_ BitVec 32))) (Undefined!591) (MissingVacant!591 (index!4536 (_ BitVec 32))) )
))
(declare-fun lt!89037 () SeekEntryResult!591)

(get-info :version)

(assert (=> b!180267 (= res!85385 (and (not ((_ is Undefined!591) lt!89037)) (not ((_ is MissingVacant!591) lt!89037)) ((_ is MissingZero!591) lt!89037)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7625 (_ BitVec 32)) SeekEntryResult!591)

(assert (=> b!180267 (= lt!89037 (seekEntryOrOpen!0 key!828 (_keys!5592 thiss!1248) (mask!8698 thiss!1248)))))

(declare-fun b!180268 () Bool)

(assert (=> b!180268 (= e!118749 tp_is_empty!4227)))

(declare-fun mapNonEmpty!7237 () Bool)

(declare-fun tp!16099 () Bool)

(assert (=> mapNonEmpty!7237 (= mapRes!7237 (and tp!16099 e!118748))))

(declare-fun mapValue!7237 () ValueCell!1770)

(declare-fun mapRest!7237 () (Array (_ BitVec 32) ValueCell!1770))

(declare-fun mapKey!7237 () (_ BitVec 32))

(assert (=> mapNonEmpty!7237 (= (arr!3612 (_values!3683 thiss!1248)) (store mapRest!7237 mapKey!7237 mapValue!7237))))

(declare-fun b!180269 () Bool)

(assert (=> b!180269 (= e!118751 e!118745)))

(assert (=> b!180269 (= lt!89039 call!18217)))

(declare-fun res!85387 () Bool)

(declare-fun contains!1232 (ListLongMap!2283 (_ BitVec 64)) Bool)

(assert (=> b!180269 (= res!85387 (not (contains!1232 lt!89039 key!828)))))

(assert (=> b!180269 (=> res!85387 e!118745)))

(declare-fun b!180263 () Bool)

(assert (=> b!180263 (= e!118747 e!118743)))

(declare-fun res!85383 () Bool)

(assert (=> b!180263 (=> res!85383 e!118743)))

(declare-fun valid!1017 (LongMapFixedSize!2448) Bool)

(assert (=> b!180263 (= res!85383 (not (valid!1017 (_2!1693 lt!89038))))))

(declare-fun updateHelperNewKey!88 (LongMapFixedSize!2448 (_ BitVec 64) V!5283 (_ BitVec 32)) tuple2!3364)

(assert (=> b!180263 (= lt!89038 (updateHelperNewKey!88 thiss!1248 key!828 v!309 (index!4533 lt!89037)))))

(declare-fun res!85384 () Bool)

(assert (=> start!18100 (=> (not res!85384) (not e!118744))))

(assert (=> start!18100 (= res!85384 (valid!1017 thiss!1248))))

(assert (=> start!18100 e!118744))

(assert (=> start!18100 e!118742))

(assert (=> start!18100 true))

(assert (=> start!18100 tp_is_empty!4227))

(declare-fun bm!18213 () Bool)

(declare-fun map!1938 (LongMapFixedSize!2448) ListLongMap!2283)

(assert (=> bm!18213 (= call!18217 (map!1938 (_2!1693 lt!89038)))))

(declare-fun bm!18214 () Bool)

(assert (=> bm!18214 (= call!18216 (map!1938 thiss!1248))))

(assert (= (and start!18100 res!85384) b!180260))

(assert (= (and b!180260 res!85386) b!180267))

(assert (= (and b!180267 res!85385) b!180263))

(assert (= (and b!180263 (not res!85383)) b!180264))

(assert (= (and b!180264 c!32285) b!180269))

(assert (= (and b!180264 (not c!32285)) b!180265))

(assert (= (and b!180269 (not res!85387)) b!180262))

(assert (= (or b!180262 b!180265) bm!18214))

(assert (= (or b!180269 b!180265) bm!18213))

(assert (= (and b!180261 condMapEmpty!7237) mapIsEmpty!7237))

(assert (= (and b!180261 (not condMapEmpty!7237)) mapNonEmpty!7237))

(assert (= (and mapNonEmpty!7237 ((_ is ValueCellFull!1770) mapValue!7237)) b!180259))

(assert (= (and b!180261 ((_ is ValueCellFull!1770) mapDefault!7237)) b!180268))

(assert (= b!180266 b!180261))

(assert (= start!18100 b!180266))

(declare-fun m!208295 () Bool)

(assert (=> b!180262 m!208295))

(declare-fun m!208297 () Bool)

(assert (=> start!18100 m!208297))

(declare-fun m!208299 () Bool)

(assert (=> bm!18213 m!208299))

(declare-fun m!208301 () Bool)

(assert (=> b!180266 m!208301))

(declare-fun m!208303 () Bool)

(assert (=> b!180266 m!208303))

(declare-fun m!208305 () Bool)

(assert (=> b!180269 m!208305))

(declare-fun m!208307 () Bool)

(assert (=> b!180267 m!208307))

(declare-fun m!208309 () Bool)

(assert (=> b!180263 m!208309))

(declare-fun m!208311 () Bool)

(assert (=> b!180263 m!208311))

(declare-fun m!208313 () Bool)

(assert (=> mapNonEmpty!7237 m!208313))

(declare-fun m!208315 () Bool)

(assert (=> bm!18214 m!208315))

(check-sat (not b!180262) (not mapNonEmpty!7237) (not start!18100) (not b!180263) (not b!180269) b_and!10989 (not b!180266) (not b!180267) tp_is_empty!4227 (not bm!18214) (not bm!18213) (not b_next!4455))
(check-sat b_and!10989 (not b_next!4455))
(get-model)

(declare-fun d!54211 () Bool)

(declare-fun e!118786 () Bool)

(assert (=> d!54211 e!118786))

(declare-fun res!85405 () Bool)

(assert (=> d!54211 (=> res!85405 e!118786)))

(declare-fun lt!89059 () Bool)

(assert (=> d!54211 (= res!85405 (not lt!89059))))

(declare-fun lt!89060 () Bool)

(assert (=> d!54211 (= lt!89059 lt!89060)))

(declare-datatypes ((Unit!5486 0))(
  ( (Unit!5487) )
))
(declare-fun lt!89058 () Unit!5486)

(declare-fun e!118787 () Unit!5486)

(assert (=> d!54211 (= lt!89058 e!118787)))

(declare-fun c!32291 () Bool)

(assert (=> d!54211 (= c!32291 lt!89060)))

(declare-fun containsKey!209 (List!2293 (_ BitVec 64)) Bool)

(assert (=> d!54211 (= lt!89060 (containsKey!209 (toList!1157 lt!89039) key!828))))

(assert (=> d!54211 (= (contains!1232 lt!89039 key!828) lt!89059)))

(declare-fun b!180309 () Bool)

(declare-fun lt!89057 () Unit!5486)

(assert (=> b!180309 (= e!118787 lt!89057)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!157 (List!2293 (_ BitVec 64)) Unit!5486)

(assert (=> b!180309 (= lt!89057 (lemmaContainsKeyImpliesGetValueByKeyDefined!157 (toList!1157 lt!89039) key!828))))

(declare-datatypes ((Option!211 0))(
  ( (Some!210 (v!4052 V!5283)) (None!209) )
))
(declare-fun isDefined!158 (Option!211) Bool)

(declare-fun getValueByKey!205 (List!2293 (_ BitVec 64)) Option!211)

(assert (=> b!180309 (isDefined!158 (getValueByKey!205 (toList!1157 lt!89039) key!828))))

(declare-fun b!180310 () Bool)

(declare-fun Unit!5488 () Unit!5486)

(assert (=> b!180310 (= e!118787 Unit!5488)))

(declare-fun b!180311 () Bool)

(assert (=> b!180311 (= e!118786 (isDefined!158 (getValueByKey!205 (toList!1157 lt!89039) key!828)))))

(assert (= (and d!54211 c!32291) b!180309))

(assert (= (and d!54211 (not c!32291)) b!180310))

(assert (= (and d!54211 (not res!85405)) b!180311))

(declare-fun m!208339 () Bool)

(assert (=> d!54211 m!208339))

(declare-fun m!208341 () Bool)

(assert (=> b!180309 m!208341))

(declare-fun m!208343 () Bool)

(assert (=> b!180309 m!208343))

(assert (=> b!180309 m!208343))

(declare-fun m!208345 () Bool)

(assert (=> b!180309 m!208345))

(assert (=> b!180311 m!208343))

(assert (=> b!180311 m!208343))

(assert (=> b!180311 m!208345))

(assert (=> b!180269 d!54211))

(declare-fun d!54213 () Bool)

(declare-fun res!85412 () Bool)

(declare-fun e!118790 () Bool)

(assert (=> d!54213 (=> (not res!85412) (not e!118790))))

(declare-fun simpleValid!164 (LongMapFixedSize!2448) Bool)

(assert (=> d!54213 (= res!85412 (simpleValid!164 thiss!1248))))

(assert (=> d!54213 (= (valid!1017 thiss!1248) e!118790)))

(declare-fun b!180318 () Bool)

(declare-fun res!85413 () Bool)

(assert (=> b!180318 (=> (not res!85413) (not e!118790))))

(declare-fun arrayCountValidKeys!0 (array!7625 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180318 (= res!85413 (= (arrayCountValidKeys!0 (_keys!5592 thiss!1248) #b00000000000000000000000000000000 (size!3919 (_keys!5592 thiss!1248))) (_size!1273 thiss!1248)))))

(declare-fun b!180319 () Bool)

(declare-fun res!85414 () Bool)

(assert (=> b!180319 (=> (not res!85414) (not e!118790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7625 (_ BitVec 32)) Bool)

(assert (=> b!180319 (= res!85414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5592 thiss!1248) (mask!8698 thiss!1248)))))

(declare-fun b!180320 () Bool)

(declare-datatypes ((List!2295 0))(
  ( (Nil!2292) (Cons!2291 (h!2916 (_ BitVec 64)) (t!7143 List!2295)) )
))
(declare-fun arrayNoDuplicates!0 (array!7625 (_ BitVec 32) List!2295) Bool)

(assert (=> b!180320 (= e!118790 (arrayNoDuplicates!0 (_keys!5592 thiss!1248) #b00000000000000000000000000000000 Nil!2292))))

(assert (= (and d!54213 res!85412) b!180318))

(assert (= (and b!180318 res!85413) b!180319))

(assert (= (and b!180319 res!85414) b!180320))

(declare-fun m!208347 () Bool)

(assert (=> d!54213 m!208347))

(declare-fun m!208349 () Bool)

(assert (=> b!180318 m!208349))

(declare-fun m!208351 () Bool)

(assert (=> b!180319 m!208351))

(declare-fun m!208353 () Bool)

(assert (=> b!180320 m!208353))

(assert (=> start!18100 d!54213))

(declare-fun d!54215 () Bool)

(declare-fun getCurrentListMap!806 (array!7625 array!7627 (_ BitVec 32) (_ BitVec 32) V!5283 V!5283 (_ BitVec 32) Int) ListLongMap!2283)

(assert (=> d!54215 (= (map!1938 (_2!1693 lt!89038)) (getCurrentListMap!806 (_keys!5592 (_2!1693 lt!89038)) (_values!3683 (_2!1693 lt!89038)) (mask!8698 (_2!1693 lt!89038)) (extraKeys!3437 (_2!1693 lt!89038)) (zeroValue!3541 (_2!1693 lt!89038)) (minValue!3541 (_2!1693 lt!89038)) #b00000000000000000000000000000000 (defaultEntry!3700 (_2!1693 lt!89038))))))

(declare-fun bs!7372 () Bool)

(assert (= bs!7372 d!54215))

(declare-fun m!208355 () Bool)

(assert (=> bs!7372 m!208355))

(assert (=> bm!18213 d!54215))

(declare-fun d!54217 () Bool)

(declare-fun e!118793 () Bool)

(assert (=> d!54217 e!118793))

(declare-fun res!85419 () Bool)

(assert (=> d!54217 (=> (not res!85419) (not e!118793))))

(declare-fun lt!89069 () ListLongMap!2283)

(assert (=> d!54217 (= res!85419 (contains!1232 lt!89069 (_1!1692 (tuple2!3363 key!828 v!309))))))

(declare-fun lt!89070 () List!2293)

(assert (=> d!54217 (= lt!89069 (ListLongMap!2284 lt!89070))))

(declare-fun lt!89072 () Unit!5486)

(declare-fun lt!89071 () Unit!5486)

(assert (=> d!54217 (= lt!89072 lt!89071)))

(assert (=> d!54217 (= (getValueByKey!205 lt!89070 (_1!1692 (tuple2!3363 key!828 v!309))) (Some!210 (_2!1692 (tuple2!3363 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!108 (List!2293 (_ BitVec 64) V!5283) Unit!5486)

(assert (=> d!54217 (= lt!89071 (lemmaContainsTupThenGetReturnValue!108 lt!89070 (_1!1692 (tuple2!3363 key!828 v!309)) (_2!1692 (tuple2!3363 key!828 v!309))))))

(declare-fun insertStrictlySorted!111 (List!2293 (_ BitVec 64) V!5283) List!2293)

(assert (=> d!54217 (= lt!89070 (insertStrictlySorted!111 (toList!1157 call!18216) (_1!1692 (tuple2!3363 key!828 v!309)) (_2!1692 (tuple2!3363 key!828 v!309))))))

(assert (=> d!54217 (= (+!267 call!18216 (tuple2!3363 key!828 v!309)) lt!89069)))

(declare-fun b!180325 () Bool)

(declare-fun res!85420 () Bool)

(assert (=> b!180325 (=> (not res!85420) (not e!118793))))

(assert (=> b!180325 (= res!85420 (= (getValueByKey!205 (toList!1157 lt!89069) (_1!1692 (tuple2!3363 key!828 v!309))) (Some!210 (_2!1692 (tuple2!3363 key!828 v!309)))))))

(declare-fun b!180326 () Bool)

(declare-fun contains!1234 (List!2293 tuple2!3362) Bool)

(assert (=> b!180326 (= e!118793 (contains!1234 (toList!1157 lt!89069) (tuple2!3363 key!828 v!309)))))

(assert (= (and d!54217 res!85419) b!180325))

(assert (= (and b!180325 res!85420) b!180326))

(declare-fun m!208357 () Bool)

(assert (=> d!54217 m!208357))

(declare-fun m!208359 () Bool)

(assert (=> d!54217 m!208359))

(declare-fun m!208361 () Bool)

(assert (=> d!54217 m!208361))

(declare-fun m!208363 () Bool)

(assert (=> d!54217 m!208363))

(declare-fun m!208365 () Bool)

(assert (=> b!180325 m!208365))

(declare-fun m!208367 () Bool)

(assert (=> b!180326 m!208367))

(assert (=> b!180262 d!54217))

(declare-fun d!54219 () Bool)

(assert (=> d!54219 (= (array_inv!2325 (_keys!5592 thiss!1248)) (bvsge (size!3919 (_keys!5592 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180266 d!54219))

(declare-fun d!54221 () Bool)

(assert (=> d!54221 (= (array_inv!2326 (_values!3683 thiss!1248)) (bvsge (size!3920 (_values!3683 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180266 d!54221))

(declare-fun e!118800 () SeekEntryResult!591)

(declare-fun lt!89081 () SeekEntryResult!591)

(declare-fun b!180339 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7625 (_ BitVec 32)) SeekEntryResult!591)

(assert (=> b!180339 (= e!118800 (seekKeyOrZeroReturnVacant!0 (x!19703 lt!89081) (index!4535 lt!89081) (index!4535 lt!89081) key!828 (_keys!5592 thiss!1248) (mask!8698 thiss!1248)))))

(declare-fun b!180340 () Bool)

(declare-fun e!118801 () SeekEntryResult!591)

(assert (=> b!180340 (= e!118801 (Found!591 (index!4535 lt!89081)))))

(declare-fun b!180341 () Bool)

(declare-fun e!118802 () SeekEntryResult!591)

(assert (=> b!180341 (= e!118802 e!118801)))

(declare-fun lt!89079 () (_ BitVec 64))

(assert (=> b!180341 (= lt!89079 (select (arr!3611 (_keys!5592 thiss!1248)) (index!4535 lt!89081)))))

(declare-fun c!32299 () Bool)

(assert (=> b!180341 (= c!32299 (= lt!89079 key!828))))

(declare-fun b!180342 () Bool)

(assert (=> b!180342 (= e!118802 Undefined!591)))

(declare-fun d!54223 () Bool)

(declare-fun lt!89080 () SeekEntryResult!591)

(assert (=> d!54223 (and (or ((_ is Undefined!591) lt!89080) (not ((_ is Found!591) lt!89080)) (and (bvsge (index!4534 lt!89080) #b00000000000000000000000000000000) (bvslt (index!4534 lt!89080) (size!3919 (_keys!5592 thiss!1248))))) (or ((_ is Undefined!591) lt!89080) ((_ is Found!591) lt!89080) (not ((_ is MissingZero!591) lt!89080)) (and (bvsge (index!4533 lt!89080) #b00000000000000000000000000000000) (bvslt (index!4533 lt!89080) (size!3919 (_keys!5592 thiss!1248))))) (or ((_ is Undefined!591) lt!89080) ((_ is Found!591) lt!89080) ((_ is MissingZero!591) lt!89080) (not ((_ is MissingVacant!591) lt!89080)) (and (bvsge (index!4536 lt!89080) #b00000000000000000000000000000000) (bvslt (index!4536 lt!89080) (size!3919 (_keys!5592 thiss!1248))))) (or ((_ is Undefined!591) lt!89080) (ite ((_ is Found!591) lt!89080) (= (select (arr!3611 (_keys!5592 thiss!1248)) (index!4534 lt!89080)) key!828) (ite ((_ is MissingZero!591) lt!89080) (= (select (arr!3611 (_keys!5592 thiss!1248)) (index!4533 lt!89080)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!591) lt!89080) (= (select (arr!3611 (_keys!5592 thiss!1248)) (index!4536 lt!89080)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54223 (= lt!89080 e!118802)))

(declare-fun c!32300 () Bool)

(assert (=> d!54223 (= c!32300 (and ((_ is Intermediate!591) lt!89081) (undefined!1403 lt!89081)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7625 (_ BitVec 32)) SeekEntryResult!591)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54223 (= lt!89081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8698 thiss!1248)) key!828 (_keys!5592 thiss!1248) (mask!8698 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!54223 (validMask!0 (mask!8698 thiss!1248))))

(assert (=> d!54223 (= (seekEntryOrOpen!0 key!828 (_keys!5592 thiss!1248) (mask!8698 thiss!1248)) lt!89080)))

(declare-fun b!180343 () Bool)

(assert (=> b!180343 (= e!118800 (MissingZero!591 (index!4535 lt!89081)))))

(declare-fun b!180344 () Bool)

(declare-fun c!32298 () Bool)

(assert (=> b!180344 (= c!32298 (= lt!89079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180344 (= e!118801 e!118800)))

(assert (= (and d!54223 c!32300) b!180342))

(assert (= (and d!54223 (not c!32300)) b!180341))

(assert (= (and b!180341 c!32299) b!180340))

(assert (= (and b!180341 (not c!32299)) b!180344))

(assert (= (and b!180344 c!32298) b!180343))

(assert (= (and b!180344 (not c!32298)) b!180339))

(declare-fun m!208369 () Bool)

(assert (=> b!180339 m!208369))

(declare-fun m!208371 () Bool)

(assert (=> b!180341 m!208371))

(declare-fun m!208373 () Bool)

(assert (=> d!54223 m!208373))

(declare-fun m!208375 () Bool)

(assert (=> d!54223 m!208375))

(declare-fun m!208377 () Bool)

(assert (=> d!54223 m!208377))

(declare-fun m!208379 () Bool)

(assert (=> d!54223 m!208379))

(declare-fun m!208381 () Bool)

(assert (=> d!54223 m!208381))

(assert (=> d!54223 m!208373))

(declare-fun m!208383 () Bool)

(assert (=> d!54223 m!208383))

(assert (=> b!180267 d!54223))

(declare-fun d!54225 () Bool)

(assert (=> d!54225 (= (map!1938 thiss!1248) (getCurrentListMap!806 (_keys!5592 thiss!1248) (_values!3683 thiss!1248) (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3700 thiss!1248)))))

(declare-fun bs!7373 () Bool)

(assert (= bs!7373 d!54225))

(declare-fun m!208385 () Bool)

(assert (=> bs!7373 m!208385))

(assert (=> bm!18214 d!54225))

(declare-fun d!54227 () Bool)

(declare-fun res!85421 () Bool)

(declare-fun e!118803 () Bool)

(assert (=> d!54227 (=> (not res!85421) (not e!118803))))

(assert (=> d!54227 (= res!85421 (simpleValid!164 (_2!1693 lt!89038)))))

(assert (=> d!54227 (= (valid!1017 (_2!1693 lt!89038)) e!118803)))

(declare-fun b!180345 () Bool)

(declare-fun res!85422 () Bool)

(assert (=> b!180345 (=> (not res!85422) (not e!118803))))

(assert (=> b!180345 (= res!85422 (= (arrayCountValidKeys!0 (_keys!5592 (_2!1693 lt!89038)) #b00000000000000000000000000000000 (size!3919 (_keys!5592 (_2!1693 lt!89038)))) (_size!1273 (_2!1693 lt!89038))))))

(declare-fun b!180346 () Bool)

(declare-fun res!85423 () Bool)

(assert (=> b!180346 (=> (not res!85423) (not e!118803))))

(assert (=> b!180346 (= res!85423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5592 (_2!1693 lt!89038)) (mask!8698 (_2!1693 lt!89038))))))

(declare-fun b!180347 () Bool)

(assert (=> b!180347 (= e!118803 (arrayNoDuplicates!0 (_keys!5592 (_2!1693 lt!89038)) #b00000000000000000000000000000000 Nil!2292))))

(assert (= (and d!54227 res!85421) b!180345))

(assert (= (and b!180345 res!85422) b!180346))

(assert (= (and b!180346 res!85423) b!180347))

(declare-fun m!208387 () Bool)

(assert (=> d!54227 m!208387))

(declare-fun m!208389 () Bool)

(assert (=> b!180345 m!208389))

(declare-fun m!208391 () Bool)

(assert (=> b!180346 m!208391))

(declare-fun m!208393 () Bool)

(assert (=> b!180347 m!208393))

(assert (=> b!180263 d!54227))

(declare-fun bm!18229 () Bool)

(declare-fun call!18232 () Bool)

(declare-fun arrayContainsKey!0 (array!7625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18229 (= call!18232 (arrayContainsKey!0 (_keys!5592 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!180382 () Bool)

(declare-fun e!118822 () Bool)

(declare-fun lt!89158 () SeekEntryResult!591)

(assert (=> b!180382 (= e!118822 (= (select (arr!3611 (_keys!5592 thiss!1248)) (index!4534 lt!89158)) key!828))))

(declare-fun d!54229 () Bool)

(declare-fun e!118820 () Bool)

(assert (=> d!54229 e!118820))

(declare-fun res!85444 () Bool)

(assert (=> d!54229 (=> (not res!85444) (not e!118820))))

(declare-fun lt!89166 () tuple2!3364)

(assert (=> d!54229 (= res!85444 (_1!1693 lt!89166))))

(assert (=> d!54229 (= lt!89166 (tuple2!3365 true (LongMapFixedSize!2449 (defaultEntry!3700 thiss!1248) (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) (bvadd (_size!1273 thiss!1248) #b00000000000000000000000000000001) (array!7626 (store (arr!3611 (_keys!5592 thiss!1248)) (index!4533 lt!89037) key!828) (size!3919 (_keys!5592 thiss!1248))) (array!7628 (store (arr!3612 (_values!3683 thiss!1248)) (index!4533 lt!89037) (ValueCellFull!1770 v!309)) (size!3920 (_values!3683 thiss!1248))) (_vacant!1273 thiss!1248))))))

(declare-fun lt!89157 () Unit!5486)

(declare-fun lt!89149 () Unit!5486)

(assert (=> d!54229 (= lt!89157 lt!89149)))

(declare-fun lt!89165 () array!7627)

(declare-fun lt!89167 () array!7625)

(assert (=> d!54229 (contains!1232 (getCurrentListMap!806 lt!89167 lt!89165 (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3700 thiss!1248)) (select (store (arr!3611 (_keys!5592 thiss!1248)) (index!4533 lt!89037) key!828) (index!4533 lt!89037)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!145 (array!7625 array!7627 (_ BitVec 32) (_ BitVec 32) V!5283 V!5283 (_ BitVec 32) Int) Unit!5486)

(assert (=> d!54229 (= lt!89149 (lemmaValidKeyInArrayIsInListMap!145 lt!89167 lt!89165 (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) (index!4533 lt!89037) (defaultEntry!3700 thiss!1248)))))

(assert (=> d!54229 (= lt!89165 (array!7628 (store (arr!3612 (_values!3683 thiss!1248)) (index!4533 lt!89037) (ValueCellFull!1770 v!309)) (size!3920 (_values!3683 thiss!1248))))))

(assert (=> d!54229 (= lt!89167 (array!7626 (store (arr!3611 (_keys!5592 thiss!1248)) (index!4533 lt!89037) key!828) (size!3919 (_keys!5592 thiss!1248))))))

(declare-fun lt!89164 () Unit!5486)

(declare-fun lt!89153 () Unit!5486)

(assert (=> d!54229 (= lt!89164 lt!89153)))

(declare-fun lt!89148 () array!7625)

(assert (=> d!54229 (= (arrayCountValidKeys!0 lt!89148 (index!4533 lt!89037) (bvadd (index!4533 lt!89037) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!7625 (_ BitVec 32)) Unit!5486)

(assert (=> d!54229 (= lt!89153 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!89148 (index!4533 lt!89037)))))

(assert (=> d!54229 (= lt!89148 (array!7626 (store (arr!3611 (_keys!5592 thiss!1248)) (index!4533 lt!89037) key!828) (size!3919 (_keys!5592 thiss!1248))))))

(declare-fun lt!89169 () Unit!5486)

(declare-fun lt!89162 () Unit!5486)

(assert (=> d!54229 (= lt!89169 lt!89162)))

(declare-fun lt!89155 () array!7625)

(assert (=> d!54229 (arrayContainsKey!0 lt!89155 key!828 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7625 (_ BitVec 64) (_ BitVec 32)) Unit!5486)

(assert (=> d!54229 (= lt!89162 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!89155 key!828 (index!4533 lt!89037)))))

(assert (=> d!54229 (= lt!89155 (array!7626 (store (arr!3611 (_keys!5592 thiss!1248)) (index!4533 lt!89037) key!828) (size!3919 (_keys!5592 thiss!1248))))))

(declare-fun lt!89163 () Unit!5486)

(declare-fun lt!89147 () Unit!5486)

(assert (=> d!54229 (= lt!89163 lt!89147)))

(assert (=> d!54229 (= (+!267 (getCurrentListMap!806 (_keys!5592 thiss!1248) (_values!3683 thiss!1248) (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3700 thiss!1248)) (tuple2!3363 key!828 v!309)) (getCurrentListMap!806 (array!7626 (store (arr!3611 (_keys!5592 thiss!1248)) (index!4533 lt!89037) key!828) (size!3919 (_keys!5592 thiss!1248))) (array!7628 (store (arr!3612 (_values!3683 thiss!1248)) (index!4533 lt!89037) (ValueCellFull!1770 v!309)) (size!3920 (_values!3683 thiss!1248))) (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3700 thiss!1248)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!51 (array!7625 array!7627 (_ BitVec 32) (_ BitVec 32) V!5283 V!5283 (_ BitVec 32) (_ BitVec 64) V!5283 Int) Unit!5486)

(assert (=> d!54229 (= lt!89147 (lemmaAddValidKeyToArrayThenAddPairToListMap!51 (_keys!5592 thiss!1248) (_values!3683 thiss!1248) (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) (index!4533 lt!89037) key!828 v!309 (defaultEntry!3700 thiss!1248)))))

(declare-fun lt!89152 () Unit!5486)

(declare-fun lt!89143 () Unit!5486)

(assert (=> d!54229 (= lt!89152 lt!89143)))

(assert (=> d!54229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!7626 (store (arr!3611 (_keys!5592 thiss!1248)) (index!4533 lt!89037) key!828) (size!3919 (_keys!5592 thiss!1248))) (mask!8698 thiss!1248))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!7625 (_ BitVec 32) (_ BitVec 32)) Unit!5486)

(assert (=> d!54229 (= lt!89143 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!828 (_keys!5592 thiss!1248) (index!4533 lt!89037) (mask!8698 thiss!1248)))))

(declare-fun lt!89145 () Unit!5486)

(declare-fun lt!89156 () Unit!5486)

(assert (=> d!54229 (= lt!89145 lt!89156)))

(assert (=> d!54229 (= (arrayCountValidKeys!0 (array!7626 (store (arr!3611 (_keys!5592 thiss!1248)) (index!4533 lt!89037) key!828) (size!3919 (_keys!5592 thiss!1248))) #b00000000000000000000000000000000 (size!3919 (_keys!5592 thiss!1248))) (bvadd (arrayCountValidKeys!0 (_keys!5592 thiss!1248) #b00000000000000000000000000000000 (size!3919 (_keys!5592 thiss!1248))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!7625 (_ BitVec 32) (_ BitVec 64)) Unit!5486)

(assert (=> d!54229 (= lt!89156 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!5592 thiss!1248) (index!4533 lt!89037) key!828))))

(declare-fun lt!89159 () Unit!5486)

(declare-fun lt!89170 () Unit!5486)

(assert (=> d!54229 (= lt!89159 lt!89170)))

(declare-fun lt!89150 () List!2295)

(declare-fun lt!89144 () (_ BitVec 32))

(assert (=> d!54229 (arrayNoDuplicates!0 (array!7626 (store (arr!3611 (_keys!5592 thiss!1248)) (index!4533 lt!89037) key!828) (size!3919 (_keys!5592 thiss!1248))) lt!89144 lt!89150)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!7625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!2295) Unit!5486)

(assert (=> d!54229 (= lt!89170 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!5592 thiss!1248) key!828 (index!4533 lt!89037) lt!89144 lt!89150))))

(assert (=> d!54229 (= lt!89150 Nil!2292)))

(assert (=> d!54229 (= lt!89144 #b00000000000000000000000000000000)))

(declare-fun lt!89161 () Unit!5486)

(declare-fun e!118826 () Unit!5486)

(assert (=> d!54229 (= lt!89161 e!118826)))

(declare-fun c!32310 () Bool)

(assert (=> d!54229 (= c!32310 (arrayContainsKey!0 (_keys!5592 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun lt!89151 () Unit!5486)

(declare-fun e!118825 () Unit!5486)

(assert (=> d!54229 (= lt!89151 e!118825)))

(declare-fun c!32312 () Bool)

(assert (=> d!54229 (= c!32312 (contains!1232 (getCurrentListMap!806 (_keys!5592 thiss!1248) (_values!3683 thiss!1248) (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3700 thiss!1248)) key!828))))

(assert (=> d!54229 (valid!1017 thiss!1248)))

(assert (=> d!54229 (= (updateHelperNewKey!88 thiss!1248 key!828 v!309 (index!4533 lt!89037)) lt!89166)))

(declare-fun b!180383 () Bool)

(declare-fun Unit!5489 () Unit!5486)

(assert (=> b!180383 (= e!118826 Unit!5489)))

(declare-fun lt!89142 () Unit!5486)

(declare-fun lemmaArrayContainsKeyThenInListMap!51 (array!7625 array!7627 (_ BitVec 32) (_ BitVec 32) V!5283 V!5283 (_ BitVec 64) (_ BitVec 32) Int) Unit!5486)

(assert (=> b!180383 (= lt!89142 (lemmaArrayContainsKeyThenInListMap!51 (_keys!5592 thiss!1248) (_values!3683 thiss!1248) (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) key!828 #b00000000000000000000000000000000 (defaultEntry!3700 thiss!1248)))))

(assert (=> b!180383 (contains!1232 (getCurrentListMap!806 (_keys!5592 thiss!1248) (_values!3683 thiss!1248) (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3700 thiss!1248)) key!828)))

(declare-fun lt!89146 () Unit!5486)

(assert (=> b!180383 (= lt!89146 lt!89142)))

(assert (=> b!180383 false))

(declare-fun b!180384 () Bool)

(assert (=> b!180384 (= e!118820 (= (map!1938 (_2!1693 lt!89166)) (+!267 (map!1938 thiss!1248) (tuple2!3363 key!828 v!309))))))

(declare-fun bm!18230 () Bool)

(declare-fun call!18233 () SeekEntryResult!591)

(assert (=> bm!18230 (= call!18233 (seekEntryOrOpen!0 key!828 (_keys!5592 thiss!1248) (mask!8698 thiss!1248)))))

(declare-fun b!180385 () Bool)

(declare-fun res!85443 () Bool)

(declare-fun e!118824 () Bool)

(assert (=> b!180385 (=> (not res!85443) (not e!118824))))

(declare-fun lt!89154 () SeekEntryResult!591)

(assert (=> b!180385 (= res!85443 (= (select (arr!3611 (_keys!5592 thiss!1248)) (index!4533 lt!89154)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180386 () Bool)

(declare-fun res!85449 () Bool)

(assert (=> b!180386 (= res!85449 (= (select (arr!3611 (_keys!5592 thiss!1248)) (index!4536 lt!89154)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118823 () Bool)

(assert (=> b!180386 (=> (not res!85449) (not e!118823))))

(declare-fun c!32311 () Bool)

(declare-fun call!18234 () Bool)

(declare-fun bm!18231 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!18231 (= call!18234 (inRange!0 (ite c!32312 (index!4534 lt!89158) (ite c!32311 (index!4533 lt!89154) (index!4536 lt!89154))) (mask!8698 thiss!1248)))))

(declare-fun b!180387 () Bool)

(declare-fun Unit!5490 () Unit!5486)

(assert (=> b!180387 (= e!118825 Unit!5490)))

(declare-fun lt!89168 () Unit!5486)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!141 (array!7625 array!7627 (_ BitVec 32) (_ BitVec 32) V!5283 V!5283 (_ BitVec 64) Int) Unit!5486)

(assert (=> b!180387 (= lt!89168 (lemmaInListMapThenSeekEntryOrOpenFindsIt!141 (_keys!5592 thiss!1248) (_values!3683 thiss!1248) (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) key!828 (defaultEntry!3700 thiss!1248)))))

(assert (=> b!180387 (= lt!89158 call!18233)))

(declare-fun res!85446 () Bool)

(assert (=> b!180387 (= res!85446 ((_ is Found!591) lt!89158))))

(assert (=> b!180387 (=> (not res!85446) (not e!118822))))

(assert (=> b!180387 e!118822))

(declare-fun lt!89160 () Unit!5486)

(assert (=> b!180387 (= lt!89160 lt!89168)))

(assert (=> b!180387 false))

(declare-fun b!180388 () Bool)

(assert (=> b!180388 (= e!118823 (not call!18232))))

(declare-fun b!180389 () Bool)

(declare-fun lt!89171 () Unit!5486)

(assert (=> b!180389 (= e!118825 lt!89171)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!142 (array!7625 array!7627 (_ BitVec 32) (_ BitVec 32) V!5283 V!5283 (_ BitVec 64) Int) Unit!5486)

(assert (=> b!180389 (= lt!89171 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!142 (_keys!5592 thiss!1248) (_values!3683 thiss!1248) (mask!8698 thiss!1248) (extraKeys!3437 thiss!1248) (zeroValue!3541 thiss!1248) (minValue!3541 thiss!1248) key!828 (defaultEntry!3700 thiss!1248)))))

(assert (=> b!180389 (= lt!89154 call!18233)))

(assert (=> b!180389 (= c!32311 ((_ is MissingZero!591) lt!89154))))

(declare-fun e!118827 () Bool)

(assert (=> b!180389 e!118827))

(declare-fun b!180390 () Bool)

(declare-fun e!118821 () Bool)

(assert (=> b!180390 (= e!118821 ((_ is Undefined!591) lt!89154))))

(declare-fun b!180391 () Bool)

(declare-fun Unit!5491 () Unit!5486)

(assert (=> b!180391 (= e!118826 Unit!5491)))

(declare-fun b!180392 () Bool)

(assert (=> b!180392 (= e!118824 (not call!18232))))

(declare-fun b!180393 () Bool)

(declare-fun c!32309 () Bool)

(assert (=> b!180393 (= c!32309 ((_ is MissingVacant!591) lt!89154))))

(assert (=> b!180393 (= e!118827 e!118821)))

(declare-fun b!180394 () Bool)

(declare-fun res!85447 () Bool)

(assert (=> b!180394 (=> (not res!85447) (not e!118820))))

(assert (=> b!180394 (= res!85447 (valid!1017 (_2!1693 lt!89166)))))

(declare-fun b!180395 () Bool)

(declare-fun res!85442 () Bool)

(assert (=> b!180395 (=> (not res!85442) (not e!118824))))

(declare-fun call!18235 () Bool)

(assert (=> b!180395 (= res!85442 call!18235)))

(assert (=> b!180395 (= e!118827 e!118824)))

(declare-fun b!180396 () Bool)

(declare-fun res!85448 () Bool)

(assert (=> b!180396 (=> (not res!85448) (not e!118820))))

(assert (=> b!180396 (= res!85448 (contains!1232 (map!1938 (_2!1693 lt!89166)) key!828))))

(declare-fun bm!18232 () Bool)

(assert (=> bm!18232 (= call!18235 call!18234)))

(declare-fun b!180397 () Bool)

(assert (=> b!180397 (= e!118821 e!118823)))

(declare-fun res!85450 () Bool)

(assert (=> b!180397 (= res!85450 call!18235)))

(assert (=> b!180397 (=> (not res!85450) (not e!118823))))

(declare-fun b!180398 () Bool)

(declare-fun res!85445 () Bool)

(assert (=> b!180398 (= res!85445 call!18234)))

(assert (=> b!180398 (=> (not res!85445) (not e!118822))))

(assert (= (and d!54229 c!32312) b!180387))

(assert (= (and d!54229 (not c!32312)) b!180389))

(assert (= (and b!180387 res!85446) b!180398))

(assert (= (and b!180398 res!85445) b!180382))

(assert (= (and b!180389 c!32311) b!180395))

(assert (= (and b!180389 (not c!32311)) b!180393))

(assert (= (and b!180395 res!85442) b!180385))

(assert (= (and b!180385 res!85443) b!180392))

(assert (= (and b!180393 c!32309) b!180397))

(assert (= (and b!180393 (not c!32309)) b!180390))

(assert (= (and b!180397 res!85450) b!180386))

(assert (= (and b!180386 res!85449) b!180388))

(assert (= (or b!180395 b!180397) bm!18232))

(assert (= (or b!180392 b!180388) bm!18229))

(assert (= (or b!180398 bm!18232) bm!18231))

(assert (= (or b!180387 b!180389) bm!18230))

(assert (= (and d!54229 c!32310) b!180383))

(assert (= (and d!54229 (not c!32310)) b!180391))

(assert (= (and d!54229 res!85444) b!180394))

(assert (= (and b!180394 res!85447) b!180396))

(assert (= (and b!180396 res!85448) b!180384))

(declare-fun m!208395 () Bool)

(assert (=> b!180385 m!208395))

(assert (=> d!54229 m!208297))

(declare-fun m!208397 () Bool)

(assert (=> d!54229 m!208397))

(declare-fun m!208399 () Bool)

(assert (=> d!54229 m!208399))

(declare-fun m!208401 () Bool)

(assert (=> d!54229 m!208401))

(declare-fun m!208403 () Bool)

(assert (=> d!54229 m!208403))

(declare-fun m!208405 () Bool)

(assert (=> d!54229 m!208405))

(declare-fun m!208407 () Bool)

(assert (=> d!54229 m!208407))

(declare-fun m!208409 () Bool)

(assert (=> d!54229 m!208409))

(declare-fun m!208411 () Bool)

(assert (=> d!54229 m!208411))

(assert (=> d!54229 m!208385))

(declare-fun m!208413 () Bool)

(assert (=> d!54229 m!208413))

(declare-fun m!208415 () Bool)

(assert (=> d!54229 m!208415))

(declare-fun m!208417 () Bool)

(assert (=> d!54229 m!208417))

(declare-fun m!208419 () Bool)

(assert (=> d!54229 m!208419))

(assert (=> d!54229 m!208349))

(assert (=> d!54229 m!208401))

(declare-fun m!208421 () Bool)

(assert (=> d!54229 m!208421))

(declare-fun m!208423 () Bool)

(assert (=> d!54229 m!208423))

(assert (=> d!54229 m!208385))

(declare-fun m!208425 () Bool)

(assert (=> d!54229 m!208425))

(declare-fun m!208427 () Bool)

(assert (=> d!54229 m!208427))

(declare-fun m!208429 () Bool)

(assert (=> d!54229 m!208429))

(declare-fun m!208431 () Bool)

(assert (=> d!54229 m!208431))

(declare-fun m!208433 () Bool)

(assert (=> d!54229 m!208433))

(declare-fun m!208435 () Bool)

(assert (=> d!54229 m!208435))

(assert (=> d!54229 m!208385))

(assert (=> d!54229 m!208399))

(declare-fun m!208437 () Bool)

(assert (=> d!54229 m!208437))

(assert (=> bm!18230 m!208307))

(assert (=> bm!18229 m!208397))

(declare-fun m!208439 () Bool)

(assert (=> b!180389 m!208439))

(declare-fun m!208441 () Bool)

(assert (=> b!180382 m!208441))

(declare-fun m!208443 () Bool)

(assert (=> bm!18231 m!208443))

(declare-fun m!208445 () Bool)

(assert (=> b!180396 m!208445))

(assert (=> b!180396 m!208445))

(declare-fun m!208447 () Bool)

(assert (=> b!180396 m!208447))

(declare-fun m!208449 () Bool)

(assert (=> b!180394 m!208449))

(declare-fun m!208451 () Bool)

(assert (=> b!180383 m!208451))

(assert (=> b!180383 m!208385))

(assert (=> b!180383 m!208385))

(assert (=> b!180383 m!208425))

(assert (=> b!180384 m!208445))

(assert (=> b!180384 m!208315))

(assert (=> b!180384 m!208315))

(declare-fun m!208453 () Bool)

(assert (=> b!180384 m!208453))

(declare-fun m!208455 () Bool)

(assert (=> b!180386 m!208455))

(declare-fun m!208457 () Bool)

(assert (=> b!180387 m!208457))

(assert (=> b!180263 d!54229))

(declare-fun mapNonEmpty!7243 () Bool)

(declare-fun mapRes!7243 () Bool)

(declare-fun tp!16108 () Bool)

(declare-fun e!118832 () Bool)

(assert (=> mapNonEmpty!7243 (= mapRes!7243 (and tp!16108 e!118832))))

(declare-fun mapKey!7243 () (_ BitVec 32))

(declare-fun mapRest!7243 () (Array (_ BitVec 32) ValueCell!1770))

(declare-fun mapValue!7243 () ValueCell!1770)

(assert (=> mapNonEmpty!7243 (= mapRest!7237 (store mapRest!7243 mapKey!7243 mapValue!7243))))

(declare-fun condMapEmpty!7243 () Bool)

(declare-fun mapDefault!7243 () ValueCell!1770)

(assert (=> mapNonEmpty!7237 (= condMapEmpty!7243 (= mapRest!7237 ((as const (Array (_ BitVec 32) ValueCell!1770)) mapDefault!7243)))))

(declare-fun e!118833 () Bool)

(assert (=> mapNonEmpty!7237 (= tp!16099 (and e!118833 mapRes!7243))))

(declare-fun mapIsEmpty!7243 () Bool)

(assert (=> mapIsEmpty!7243 mapRes!7243))

(declare-fun b!180405 () Bool)

(assert (=> b!180405 (= e!118832 tp_is_empty!4227)))

(declare-fun b!180406 () Bool)

(assert (=> b!180406 (= e!118833 tp_is_empty!4227)))

(assert (= (and mapNonEmpty!7237 condMapEmpty!7243) mapIsEmpty!7243))

(assert (= (and mapNonEmpty!7237 (not condMapEmpty!7243)) mapNonEmpty!7243))

(assert (= (and mapNonEmpty!7243 ((_ is ValueCellFull!1770) mapValue!7243)) b!180405))

(assert (= (and mapNonEmpty!7237 ((_ is ValueCellFull!1770) mapDefault!7243)) b!180406))

(declare-fun m!208459 () Bool)

(assert (=> mapNonEmpty!7243 m!208459))

(check-sat (not b!180325) (not b!180346) (not d!54229) (not d!54217) (not b!180389) (not d!54213) (not b!180394) (not d!54225) tp_is_empty!4227 (not b!180347) (not d!54215) (not b!180396) (not bm!18231) (not b!180319) (not b!180384) (not b!180387) (not d!54223) (not b!180345) (not bm!18229) (not b!180309) (not b!180318) (not b!180311) (not d!54227) (not b!180339) (not d!54211) (not bm!18230) (not b!180326) (not mapNonEmpty!7243) (not b!180320) b_and!10989 (not b!180383) (not b_next!4455))
(check-sat b_and!10989 (not b_next!4455))
