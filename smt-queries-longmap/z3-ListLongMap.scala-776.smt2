; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18388 () Bool)

(assert start!18388)

(declare-fun b!182197 () Bool)

(declare-fun b_free!4495 () Bool)

(declare-fun b_next!4495 () Bool)

(assert (=> b!182197 (= b_free!4495 (not b_next!4495))))

(declare-fun tp!16243 () Bool)

(declare-fun b_and!11031 () Bool)

(assert (=> b!182197 (= tp!16243 b_and!11031)))

(declare-fun b!182195 () Bool)

(declare-fun e!119971 () Bool)

(declare-datatypes ((V!5337 0))(
  ( (V!5338 (val!2178 Int)) )
))
(declare-datatypes ((ValueCell!1790 0))(
  ( (ValueCellFull!1790 (v!4071 V!5337)) (EmptyCell!1790) )
))
(declare-datatypes ((array!7699 0))(
  ( (array!7700 (arr!3640 (Array (_ BitVec 32) (_ BitVec 64))) (size!3953 (_ BitVec 32))) )
))
(declare-datatypes ((array!7701 0))(
  ( (array!7702 (arr!3641 (Array (_ BitVec 32) ValueCell!1790)) (size!3954 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2488 0))(
  ( (LongMapFixedSize!2489 (defaultEntry!3730 Int) (mask!8770 (_ BitVec 32)) (extraKeys!3467 (_ BitVec 32)) (zeroValue!3571 V!5337) (minValue!3571 V!5337) (_size!1293 (_ BitVec 32)) (_keys!5640 array!7699) (_values!3713 array!7701) (_vacant!1293 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2488)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7699 (_ BitVec 32)) Bool)

(assert (=> b!182195 (= e!119971 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5640 thiss!1248) (mask!8770 thiss!1248))))))

(declare-fun b!182196 () Bool)

(declare-fun e!119973 () Bool)

(declare-fun tp_is_empty!4267 () Bool)

(assert (=> b!182196 (= e!119973 tp_is_empty!4267)))

(declare-fun mapIsEmpty!7322 () Bool)

(declare-fun mapRes!7322 () Bool)

(assert (=> mapIsEmpty!7322 mapRes!7322))

(declare-fun e!119969 () Bool)

(declare-fun e!119970 () Bool)

(declare-fun array_inv!2355 (array!7699) Bool)

(declare-fun array_inv!2356 (array!7701) Bool)

(assert (=> b!182197 (= e!119970 (and tp!16243 tp_is_empty!4267 (array_inv!2355 (_keys!5640 thiss!1248)) (array_inv!2356 (_values!3713 thiss!1248)) e!119969))))

(declare-fun mapNonEmpty!7322 () Bool)

(declare-fun tp!16244 () Bool)

(assert (=> mapNonEmpty!7322 (= mapRes!7322 (and tp!16244 e!119973))))

(declare-fun mapKey!7322 () (_ BitVec 32))

(declare-fun mapRest!7322 () (Array (_ BitVec 32) ValueCell!1790))

(declare-fun mapValue!7322 () ValueCell!1790)

(assert (=> mapNonEmpty!7322 (= (arr!3641 (_values!3713 thiss!1248)) (store mapRest!7322 mapKey!7322 mapValue!7322))))

(declare-fun b!182198 () Bool)

(declare-fun e!119967 () Bool)

(assert (=> b!182198 (= e!119967 tp_is_empty!4267)))

(declare-fun b!182199 () Bool)

(declare-fun res!86198 () Bool)

(assert (=> b!182199 (=> (not res!86198) (not e!119971))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3368 0))(
  ( (tuple2!3369 (_1!1695 (_ BitVec 64)) (_2!1695 V!5337)) )
))
(declare-datatypes ((List!2311 0))(
  ( (Nil!2308) (Cons!2307 (h!2936 tuple2!3368) (t!7162 List!2311)) )
))
(declare-datatypes ((ListLongMap!2277 0))(
  ( (ListLongMap!2278 (toList!1154 List!2311)) )
))
(declare-fun contains!1244 (ListLongMap!2277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!787 (array!7699 array!7701 (_ BitVec 32) (_ BitVec 32) V!5337 V!5337 (_ BitVec 32) Int) ListLongMap!2277)

(assert (=> b!182199 (= res!86198 (contains!1244 (getCurrentListMap!787 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)) key!828))))

(declare-fun b!182200 () Bool)

(declare-fun res!86200 () Bool)

(assert (=> b!182200 (=> (not res!86200) (not e!119971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182200 (= res!86200 (validMask!0 (mask!8770 thiss!1248)))))

(declare-fun res!86197 () Bool)

(declare-fun e!119972 () Bool)

(assert (=> start!18388 (=> (not res!86197) (not e!119972))))

(declare-fun valid!1051 (LongMapFixedSize!2488) Bool)

(assert (=> start!18388 (= res!86197 (valid!1051 thiss!1248))))

(assert (=> start!18388 e!119972))

(assert (=> start!18388 e!119970))

(assert (=> start!18388 true))

(declare-fun b!182201 () Bool)

(declare-fun res!86199 () Bool)

(assert (=> b!182201 (=> (not res!86199) (not e!119972))))

(assert (=> b!182201 (= res!86199 (not (= key!828 (bvneg key!828))))))

(declare-fun b!182202 () Bool)

(assert (=> b!182202 (= e!119972 e!119971)))

(declare-fun res!86196 () Bool)

(assert (=> b!182202 (=> (not res!86196) (not e!119971))))

(declare-datatypes ((SeekEntryResult!614 0))(
  ( (MissingZero!614 (index!4626 (_ BitVec 32))) (Found!614 (index!4627 (_ BitVec 32))) (Intermediate!614 (undefined!1426 Bool) (index!4628 (_ BitVec 32)) (x!19887 (_ BitVec 32))) (Undefined!614) (MissingVacant!614 (index!4629 (_ BitVec 32))) )
))
(declare-fun lt!90009 () SeekEntryResult!614)

(get-info :version)

(assert (=> b!182202 (= res!86196 (and (not ((_ is Undefined!614) lt!90009)) (not ((_ is MissingVacant!614) lt!90009)) (not ((_ is MissingZero!614) lt!90009)) ((_ is Found!614) lt!90009)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7699 (_ BitVec 32)) SeekEntryResult!614)

(assert (=> b!182202 (= lt!90009 (seekEntryOrOpen!0 key!828 (_keys!5640 thiss!1248) (mask!8770 thiss!1248)))))

(declare-fun b!182203 () Bool)

(assert (=> b!182203 (= e!119969 (and e!119967 mapRes!7322))))

(declare-fun condMapEmpty!7322 () Bool)

(declare-fun mapDefault!7322 () ValueCell!1790)

(assert (=> b!182203 (= condMapEmpty!7322 (= (arr!3641 (_values!3713 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1790)) mapDefault!7322)))))

(declare-fun b!182204 () Bool)

(declare-fun res!86195 () Bool)

(assert (=> b!182204 (=> (not res!86195) (not e!119971))))

(assert (=> b!182204 (= res!86195 (and (= (size!3954 (_values!3713 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8770 thiss!1248))) (= (size!3953 (_keys!5640 thiss!1248)) (size!3954 (_values!3713 thiss!1248))) (bvsge (mask!8770 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3467 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3467 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!18388 res!86197) b!182201))

(assert (= (and b!182201 res!86199) b!182202))

(assert (= (and b!182202 res!86196) b!182199))

(assert (= (and b!182199 res!86198) b!182200))

(assert (= (and b!182200 res!86200) b!182204))

(assert (= (and b!182204 res!86195) b!182195))

(assert (= (and b!182203 condMapEmpty!7322) mapIsEmpty!7322))

(assert (= (and b!182203 (not condMapEmpty!7322)) mapNonEmpty!7322))

(assert (= (and mapNonEmpty!7322 ((_ is ValueCellFull!1790) mapValue!7322)) b!182196))

(assert (= (and b!182203 ((_ is ValueCellFull!1790) mapDefault!7322)) b!182198))

(assert (= b!182197 b!182203))

(assert (= start!18388 b!182197))

(declare-fun m!209545 () Bool)

(assert (=> b!182200 m!209545))

(declare-fun m!209547 () Bool)

(assert (=> b!182202 m!209547))

(declare-fun m!209549 () Bool)

(assert (=> b!182197 m!209549))

(declare-fun m!209551 () Bool)

(assert (=> b!182197 m!209551))

(declare-fun m!209553 () Bool)

(assert (=> mapNonEmpty!7322 m!209553))

(declare-fun m!209555 () Bool)

(assert (=> b!182195 m!209555))

(declare-fun m!209557 () Bool)

(assert (=> b!182199 m!209557))

(assert (=> b!182199 m!209557))

(declare-fun m!209559 () Bool)

(assert (=> b!182199 m!209559))

(declare-fun m!209561 () Bool)

(assert (=> start!18388 m!209561))

(check-sat (not b!182200) (not b_next!4495) (not b!182195) (not b!182197) (not mapNonEmpty!7322) b_and!11031 (not b!182199) (not b!182202) (not start!18388) tp_is_empty!4267)
(check-sat b_and!11031 (not b_next!4495))
(get-model)

(declare-fun d!54477 () Bool)

(declare-fun e!120020 () Bool)

(assert (=> d!54477 e!120020))

(declare-fun res!86239 () Bool)

(assert (=> d!54477 (=> res!86239 e!120020)))

(declare-fun lt!90024 () Bool)

(assert (=> d!54477 (= res!86239 (not lt!90024))))

(declare-fun lt!90025 () Bool)

(assert (=> d!54477 (= lt!90024 lt!90025)))

(declare-datatypes ((Unit!5503 0))(
  ( (Unit!5504) )
))
(declare-fun lt!90027 () Unit!5503)

(declare-fun e!120021 () Unit!5503)

(assert (=> d!54477 (= lt!90027 e!120021)))

(declare-fun c!32689 () Bool)

(assert (=> d!54477 (= c!32689 lt!90025)))

(declare-fun containsKey!214 (List!2311 (_ BitVec 64)) Bool)

(assert (=> d!54477 (= lt!90025 (containsKey!214 (toList!1154 (getCurrentListMap!787 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248))) key!828))))

(assert (=> d!54477 (= (contains!1244 (getCurrentListMap!787 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)) key!828) lt!90024)))

(declare-fun b!182271 () Bool)

(declare-fun lt!90026 () Unit!5503)

(assert (=> b!182271 (= e!120021 lt!90026)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!163 (List!2311 (_ BitVec 64)) Unit!5503)

(assert (=> b!182271 (= lt!90026 (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1154 (getCurrentListMap!787 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248))) key!828))))

(declare-datatypes ((Option!216 0))(
  ( (Some!215 (v!4074 V!5337)) (None!214) )
))
(declare-fun isDefined!164 (Option!216) Bool)

(declare-fun getValueByKey!210 (List!2311 (_ BitVec 64)) Option!216)

(assert (=> b!182271 (isDefined!164 (getValueByKey!210 (toList!1154 (getCurrentListMap!787 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248))) key!828))))

(declare-fun b!182272 () Bool)

(declare-fun Unit!5505 () Unit!5503)

(assert (=> b!182272 (= e!120021 Unit!5505)))

(declare-fun b!182273 () Bool)

(assert (=> b!182273 (= e!120020 (isDefined!164 (getValueByKey!210 (toList!1154 (getCurrentListMap!787 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248))) key!828)))))

(assert (= (and d!54477 c!32689) b!182271))

(assert (= (and d!54477 (not c!32689)) b!182272))

(assert (= (and d!54477 (not res!86239)) b!182273))

(declare-fun m!209599 () Bool)

(assert (=> d!54477 m!209599))

(declare-fun m!209601 () Bool)

(assert (=> b!182271 m!209601))

(declare-fun m!209603 () Bool)

(assert (=> b!182271 m!209603))

(assert (=> b!182271 m!209603))

(declare-fun m!209605 () Bool)

(assert (=> b!182271 m!209605))

(assert (=> b!182273 m!209603))

(assert (=> b!182273 m!209603))

(assert (=> b!182273 m!209605))

(assert (=> b!182199 d!54477))

(declare-fun c!32705 () Bool)

(declare-fun c!32703 () Bool)

(declare-fun call!18400 () ListLongMap!2277)

(declare-fun call!18405 () ListLongMap!2277)

(declare-fun call!18403 () ListLongMap!2277)

(declare-fun call!18402 () ListLongMap!2277)

(declare-fun bm!18397 () Bool)

(declare-fun +!272 (ListLongMap!2277 tuple2!3368) ListLongMap!2277)

(assert (=> bm!18397 (= call!18403 (+!272 (ite c!32705 call!18405 (ite c!32703 call!18400 call!18402)) (ite (or c!32705 c!32703) (tuple2!3369 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3571 thiss!1248)) (tuple2!3369 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3571 thiss!1248)))))))

(declare-fun bm!18398 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!176 (array!7699 array!7701 (_ BitVec 32) (_ BitVec 32) V!5337 V!5337 (_ BitVec 32) Int) ListLongMap!2277)

(assert (=> bm!18398 (= call!18405 (getCurrentListMapNoExtraKeys!176 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)))))

(declare-fun b!182316 () Bool)

(declare-fun e!120060 () Bool)

(declare-fun lt!90072 () ListLongMap!2277)

(declare-fun apply!155 (ListLongMap!2277 (_ BitVec 64)) V!5337)

(assert (=> b!182316 (= e!120060 (= (apply!155 lt!90072 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3571 thiss!1248)))))

(declare-fun b!182317 () Bool)

(declare-fun e!120048 () Bool)

(declare-fun e!120059 () Bool)

(assert (=> b!182317 (= e!120048 e!120059)))

(declare-fun res!86262 () Bool)

(declare-fun call!18404 () Bool)

(assert (=> b!182317 (= res!86262 call!18404)))

(assert (=> b!182317 (=> (not res!86262) (not e!120059))))

(declare-fun bm!18399 () Bool)

(declare-fun call!18401 () Bool)

(assert (=> bm!18399 (= call!18401 (contains!1244 lt!90072 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182318 () Bool)

(declare-fun e!120057 () ListLongMap!2277)

(declare-fun e!120055 () ListLongMap!2277)

(assert (=> b!182318 (= e!120057 e!120055)))

(assert (=> b!182318 (= c!32703 (and (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!54479 () Bool)

(declare-fun e!120056 () Bool)

(assert (=> d!54479 e!120056))

(declare-fun res!86260 () Bool)

(assert (=> d!54479 (=> (not res!86260) (not e!120056))))

(assert (=> d!54479 (= res!86260 (or (bvsge #b00000000000000000000000000000000 (size!3953 (_keys!5640 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3953 (_keys!5640 thiss!1248))))))))

(declare-fun lt!90089 () ListLongMap!2277)

(assert (=> d!54479 (= lt!90072 lt!90089)))

(declare-fun lt!90088 () Unit!5503)

(declare-fun e!120052 () Unit!5503)

(assert (=> d!54479 (= lt!90088 e!120052)))

(declare-fun c!32706 () Bool)

(declare-fun e!120050 () Bool)

(assert (=> d!54479 (= c!32706 e!120050)))

(declare-fun res!86263 () Bool)

(assert (=> d!54479 (=> (not res!86263) (not e!120050))))

(assert (=> d!54479 (= res!86263 (bvslt #b00000000000000000000000000000000 (size!3953 (_keys!5640 thiss!1248))))))

(assert (=> d!54479 (= lt!90089 e!120057)))

(assert (=> d!54479 (= c!32705 (and (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54479 (validMask!0 (mask!8770 thiss!1248))))

(assert (=> d!54479 (= (getCurrentListMap!787 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)) lt!90072)))

(declare-fun b!182319 () Bool)

(declare-fun e!120053 () ListLongMap!2277)

(assert (=> b!182319 (= e!120053 call!18402)))

(declare-fun bm!18400 () Bool)

(assert (=> bm!18400 (= call!18404 (contains!1244 lt!90072 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182320 () Bool)

(assert (=> b!182320 (= e!120057 (+!272 call!18403 (tuple2!3369 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3571 thiss!1248))))))

(declare-fun b!182321 () Bool)

(assert (=> b!182321 (= e!120048 (not call!18404))))

(declare-fun bm!18401 () Bool)

(assert (=> bm!18401 (= call!18402 call!18400)))

(declare-fun b!182322 () Bool)

(declare-fun call!18406 () ListLongMap!2277)

(assert (=> b!182322 (= e!120053 call!18406)))

(declare-fun b!182323 () Bool)

(declare-fun res!86265 () Bool)

(assert (=> b!182323 (=> (not res!86265) (not e!120056))))

(declare-fun e!120051 () Bool)

(assert (=> b!182323 (= res!86265 e!120051)))

(declare-fun res!86264 () Bool)

(assert (=> b!182323 (=> res!86264 e!120051)))

(declare-fun e!120049 () Bool)

(assert (=> b!182323 (= res!86264 (not e!120049))))

(declare-fun res!86261 () Bool)

(assert (=> b!182323 (=> (not res!86261) (not e!120049))))

(assert (=> b!182323 (= res!86261 (bvslt #b00000000000000000000000000000000 (size!3953 (_keys!5640 thiss!1248))))))

(declare-fun b!182324 () Bool)

(declare-fun e!120058 () Bool)

(assert (=> b!182324 (= e!120058 e!120060)))

(declare-fun res!86258 () Bool)

(assert (=> b!182324 (= res!86258 call!18401)))

(assert (=> b!182324 (=> (not res!86258) (not e!120060))))

(declare-fun b!182325 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182325 (= e!120049 (validKeyInArray!0 (select (arr!3640 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182326 () Bool)

(declare-fun lt!90076 () Unit!5503)

(assert (=> b!182326 (= e!120052 lt!90076)))

(declare-fun lt!90086 () ListLongMap!2277)

(assert (=> b!182326 (= lt!90086 (getCurrentListMapNoExtraKeys!176 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)))))

(declare-fun lt!90093 () (_ BitVec 64))

(assert (=> b!182326 (= lt!90093 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90087 () (_ BitVec 64))

(assert (=> b!182326 (= lt!90087 (select (arr!3640 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90080 () Unit!5503)

(declare-fun addStillContains!131 (ListLongMap!2277 (_ BitVec 64) V!5337 (_ BitVec 64)) Unit!5503)

(assert (=> b!182326 (= lt!90080 (addStillContains!131 lt!90086 lt!90093 (zeroValue!3571 thiss!1248) lt!90087))))

(assert (=> b!182326 (contains!1244 (+!272 lt!90086 (tuple2!3369 lt!90093 (zeroValue!3571 thiss!1248))) lt!90087)))

(declare-fun lt!90090 () Unit!5503)

(assert (=> b!182326 (= lt!90090 lt!90080)))

(declare-fun lt!90075 () ListLongMap!2277)

(assert (=> b!182326 (= lt!90075 (getCurrentListMapNoExtraKeys!176 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)))))

(declare-fun lt!90074 () (_ BitVec 64))

(assert (=> b!182326 (= lt!90074 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90077 () (_ BitVec 64))

(assert (=> b!182326 (= lt!90077 (select (arr!3640 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90083 () Unit!5503)

(declare-fun addApplyDifferent!131 (ListLongMap!2277 (_ BitVec 64) V!5337 (_ BitVec 64)) Unit!5503)

(assert (=> b!182326 (= lt!90083 (addApplyDifferent!131 lt!90075 lt!90074 (minValue!3571 thiss!1248) lt!90077))))

(assert (=> b!182326 (= (apply!155 (+!272 lt!90075 (tuple2!3369 lt!90074 (minValue!3571 thiss!1248))) lt!90077) (apply!155 lt!90075 lt!90077))))

(declare-fun lt!90091 () Unit!5503)

(assert (=> b!182326 (= lt!90091 lt!90083)))

(declare-fun lt!90078 () ListLongMap!2277)

(assert (=> b!182326 (= lt!90078 (getCurrentListMapNoExtraKeys!176 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)))))

(declare-fun lt!90082 () (_ BitVec 64))

(assert (=> b!182326 (= lt!90082 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90085 () (_ BitVec 64))

(assert (=> b!182326 (= lt!90085 (select (arr!3640 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90073 () Unit!5503)

(assert (=> b!182326 (= lt!90073 (addApplyDifferent!131 lt!90078 lt!90082 (zeroValue!3571 thiss!1248) lt!90085))))

(assert (=> b!182326 (= (apply!155 (+!272 lt!90078 (tuple2!3369 lt!90082 (zeroValue!3571 thiss!1248))) lt!90085) (apply!155 lt!90078 lt!90085))))

(declare-fun lt!90092 () Unit!5503)

(assert (=> b!182326 (= lt!90092 lt!90073)))

(declare-fun lt!90081 () ListLongMap!2277)

(assert (=> b!182326 (= lt!90081 (getCurrentListMapNoExtraKeys!176 (_keys!5640 thiss!1248) (_values!3713 thiss!1248) (mask!8770 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)))))

(declare-fun lt!90084 () (_ BitVec 64))

(assert (=> b!182326 (= lt!90084 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90079 () (_ BitVec 64))

(assert (=> b!182326 (= lt!90079 (select (arr!3640 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182326 (= lt!90076 (addApplyDifferent!131 lt!90081 lt!90084 (minValue!3571 thiss!1248) lt!90079))))

(assert (=> b!182326 (= (apply!155 (+!272 lt!90081 (tuple2!3369 lt!90084 (minValue!3571 thiss!1248))) lt!90079) (apply!155 lt!90081 lt!90079))))

(declare-fun b!182327 () Bool)

(declare-fun e!120054 () Bool)

(assert (=> b!182327 (= e!120051 e!120054)))

(declare-fun res!86259 () Bool)

(assert (=> b!182327 (=> (not res!86259) (not e!120054))))

(assert (=> b!182327 (= res!86259 (contains!1244 lt!90072 (select (arr!3640 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182327 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3953 (_keys!5640 thiss!1248))))))

(declare-fun b!182328 () Bool)

(assert (=> b!182328 (= e!120056 e!120058)))

(declare-fun c!32704 () Bool)

(assert (=> b!182328 (= c!32704 (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182329 () Bool)

(assert (=> b!182329 (= e!120059 (= (apply!155 lt!90072 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3571 thiss!1248)))))

(declare-fun b!182330 () Bool)

(declare-fun c!32702 () Bool)

(assert (=> b!182330 (= c!32702 (and (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!182330 (= e!120055 e!120053)))

(declare-fun b!182331 () Bool)

(assert (=> b!182331 (= e!120058 (not call!18401))))

(declare-fun b!182332 () Bool)

(assert (=> b!182332 (= e!120055 call!18406)))

(declare-fun b!182333 () Bool)

(declare-fun Unit!5506 () Unit!5503)

(assert (=> b!182333 (= e!120052 Unit!5506)))

(declare-fun b!182334 () Bool)

(declare-fun get!2088 (ValueCell!1790 V!5337) V!5337)

(declare-fun dynLambda!489 (Int (_ BitVec 64)) V!5337)

(assert (=> b!182334 (= e!120054 (= (apply!155 lt!90072 (select (arr!3640 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000)) (get!2088 (select (arr!3641 (_values!3713 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!489 (defaultEntry!3730 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182334 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3954 (_values!3713 thiss!1248))))))

(assert (=> b!182334 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3953 (_keys!5640 thiss!1248))))))

(declare-fun bm!18402 () Bool)

(assert (=> bm!18402 (= call!18400 call!18405)))

(declare-fun bm!18403 () Bool)

(assert (=> bm!18403 (= call!18406 call!18403)))

(declare-fun b!182335 () Bool)

(assert (=> b!182335 (= e!120050 (validKeyInArray!0 (select (arr!3640 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182336 () Bool)

(declare-fun res!86266 () Bool)

(assert (=> b!182336 (=> (not res!86266) (not e!120056))))

(assert (=> b!182336 (= res!86266 e!120048)))

(declare-fun c!32707 () Bool)

(assert (=> b!182336 (= c!32707 (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!54479 c!32705) b!182320))

(assert (= (and d!54479 (not c!32705)) b!182318))

(assert (= (and b!182318 c!32703) b!182332))

(assert (= (and b!182318 (not c!32703)) b!182330))

(assert (= (and b!182330 c!32702) b!182322))

(assert (= (and b!182330 (not c!32702)) b!182319))

(assert (= (or b!182322 b!182319) bm!18401))

(assert (= (or b!182332 bm!18401) bm!18402))

(assert (= (or b!182332 b!182322) bm!18403))

(assert (= (or b!182320 bm!18402) bm!18398))

(assert (= (or b!182320 bm!18403) bm!18397))

(assert (= (and d!54479 res!86263) b!182335))

(assert (= (and d!54479 c!32706) b!182326))

(assert (= (and d!54479 (not c!32706)) b!182333))

(assert (= (and d!54479 res!86260) b!182323))

(assert (= (and b!182323 res!86261) b!182325))

(assert (= (and b!182323 (not res!86264)) b!182327))

(assert (= (and b!182327 res!86259) b!182334))

(assert (= (and b!182323 res!86265) b!182336))

(assert (= (and b!182336 c!32707) b!182317))

(assert (= (and b!182336 (not c!32707)) b!182321))

(assert (= (and b!182317 res!86262) b!182329))

(assert (= (or b!182317 b!182321) bm!18400))

(assert (= (and b!182336 res!86266) b!182328))

(assert (= (and b!182328 c!32704) b!182324))

(assert (= (and b!182328 (not c!32704)) b!182331))

(assert (= (and b!182324 res!86258) b!182316))

(assert (= (or b!182324 b!182331) bm!18399))

(declare-fun b_lambda!7157 () Bool)

(assert (=> (not b_lambda!7157) (not b!182334)))

(declare-fun t!7166 () Bool)

(declare-fun tb!2813 () Bool)

(assert (=> (and b!182197 (= (defaultEntry!3730 thiss!1248) (defaultEntry!3730 thiss!1248)) t!7166) tb!2813))

(declare-fun result!4733 () Bool)

(assert (=> tb!2813 (= result!4733 tp_is_empty!4267)))

(assert (=> b!182334 t!7166))

(declare-fun b_and!11037 () Bool)

(assert (= b_and!11031 (and (=> t!7166 result!4733) b_and!11037)))

(declare-fun m!209607 () Bool)

(assert (=> b!182316 m!209607))

(declare-fun m!209609 () Bool)

(assert (=> b!182325 m!209609))

(assert (=> b!182325 m!209609))

(declare-fun m!209611 () Bool)

(assert (=> b!182325 m!209611))

(declare-fun m!209613 () Bool)

(assert (=> bm!18399 m!209613))

(declare-fun m!209615 () Bool)

(assert (=> b!182320 m!209615))

(assert (=> d!54479 m!209545))

(assert (=> b!182335 m!209609))

(assert (=> b!182335 m!209609))

(assert (=> b!182335 m!209611))

(assert (=> b!182334 m!209609))

(declare-fun m!209617 () Bool)

(assert (=> b!182334 m!209617))

(declare-fun m!209619 () Bool)

(assert (=> b!182334 m!209619))

(declare-fun m!209621 () Bool)

(assert (=> b!182334 m!209621))

(assert (=> b!182334 m!209621))

(assert (=> b!182334 m!209619))

(declare-fun m!209623 () Bool)

(assert (=> b!182334 m!209623))

(assert (=> b!182334 m!209609))

(declare-fun m!209625 () Bool)

(assert (=> b!182329 m!209625))

(declare-fun m!209627 () Bool)

(assert (=> bm!18398 m!209627))

(declare-fun m!209629 () Bool)

(assert (=> bm!18397 m!209629))

(assert (=> b!182327 m!209609))

(assert (=> b!182327 m!209609))

(declare-fun m!209631 () Bool)

(assert (=> b!182327 m!209631))

(declare-fun m!209633 () Bool)

(assert (=> bm!18400 m!209633))

(declare-fun m!209635 () Bool)

(assert (=> b!182326 m!209635))

(declare-fun m!209637 () Bool)

(assert (=> b!182326 m!209637))

(declare-fun m!209639 () Bool)

(assert (=> b!182326 m!209639))

(assert (=> b!182326 m!209627))

(declare-fun m!209641 () Bool)

(assert (=> b!182326 m!209641))

(declare-fun m!209643 () Bool)

(assert (=> b!182326 m!209643))

(assert (=> b!182326 m!209639))

(declare-fun m!209645 () Bool)

(assert (=> b!182326 m!209645))

(declare-fun m!209647 () Bool)

(assert (=> b!182326 m!209647))

(assert (=> b!182326 m!209643))

(declare-fun m!209649 () Bool)

(assert (=> b!182326 m!209649))

(declare-fun m!209651 () Bool)

(assert (=> b!182326 m!209651))

(declare-fun m!209653 () Bool)

(assert (=> b!182326 m!209653))

(declare-fun m!209655 () Bool)

(assert (=> b!182326 m!209655))

(declare-fun m!209657 () Bool)

(assert (=> b!182326 m!209657))

(declare-fun m!209659 () Bool)

(assert (=> b!182326 m!209659))

(assert (=> b!182326 m!209655))

(assert (=> b!182326 m!209609))

(assert (=> b!182326 m!209641))

(declare-fun m!209661 () Bool)

(assert (=> b!182326 m!209661))

(declare-fun m!209663 () Bool)

(assert (=> b!182326 m!209663))

(assert (=> b!182199 d!54479))

(declare-fun d!54481 () Bool)

(declare-fun res!86272 () Bool)

(declare-fun e!120067 () Bool)

(assert (=> d!54481 (=> res!86272 e!120067)))

(assert (=> d!54481 (= res!86272 (bvsge #b00000000000000000000000000000000 (size!3953 (_keys!5640 thiss!1248))))))

(assert (=> d!54481 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5640 thiss!1248) (mask!8770 thiss!1248)) e!120067)))

(declare-fun b!182347 () Bool)

(declare-fun e!120069 () Bool)

(assert (=> b!182347 (= e!120067 e!120069)))

(declare-fun c!32710 () Bool)

(assert (=> b!182347 (= c!32710 (validKeyInArray!0 (select (arr!3640 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182348 () Bool)

(declare-fun e!120068 () Bool)

(assert (=> b!182348 (= e!120069 e!120068)))

(declare-fun lt!90100 () (_ BitVec 64))

(assert (=> b!182348 (= lt!90100 (select (arr!3640 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90102 () Unit!5503)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7699 (_ BitVec 64) (_ BitVec 32)) Unit!5503)

(assert (=> b!182348 (= lt!90102 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5640 thiss!1248) lt!90100 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!182348 (arrayContainsKey!0 (_keys!5640 thiss!1248) lt!90100 #b00000000000000000000000000000000)))

(declare-fun lt!90101 () Unit!5503)

(assert (=> b!182348 (= lt!90101 lt!90102)))

(declare-fun res!86271 () Bool)

(assert (=> b!182348 (= res!86271 (= (seekEntryOrOpen!0 (select (arr!3640 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000) (_keys!5640 thiss!1248) (mask!8770 thiss!1248)) (Found!614 #b00000000000000000000000000000000)))))

(assert (=> b!182348 (=> (not res!86271) (not e!120068))))

(declare-fun b!182349 () Bool)

(declare-fun call!18409 () Bool)

(assert (=> b!182349 (= e!120069 call!18409)))

(declare-fun b!182350 () Bool)

(assert (=> b!182350 (= e!120068 call!18409)))

(declare-fun bm!18406 () Bool)

(assert (=> bm!18406 (= call!18409 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5640 thiss!1248) (mask!8770 thiss!1248)))))

(assert (= (and d!54481 (not res!86272)) b!182347))

(assert (= (and b!182347 c!32710) b!182348))

(assert (= (and b!182347 (not c!32710)) b!182349))

(assert (= (and b!182348 res!86271) b!182350))

(assert (= (or b!182350 b!182349) bm!18406))

(assert (=> b!182347 m!209609))

(assert (=> b!182347 m!209609))

(assert (=> b!182347 m!209611))

(assert (=> b!182348 m!209609))

(declare-fun m!209665 () Bool)

(assert (=> b!182348 m!209665))

(declare-fun m!209667 () Bool)

(assert (=> b!182348 m!209667))

(assert (=> b!182348 m!209609))

(declare-fun m!209669 () Bool)

(assert (=> b!182348 m!209669))

(declare-fun m!209671 () Bool)

(assert (=> bm!18406 m!209671))

(assert (=> b!182195 d!54481))

(declare-fun b!182364 () Bool)

(declare-fun e!120077 () SeekEntryResult!614)

(declare-fun lt!90109 () SeekEntryResult!614)

(assert (=> b!182364 (= e!120077 (MissingZero!614 (index!4628 lt!90109)))))

(declare-fun b!182365 () Bool)

(declare-fun c!32719 () Bool)

(declare-fun lt!90111 () (_ BitVec 64))

(assert (=> b!182365 (= c!32719 (= lt!90111 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120078 () SeekEntryResult!614)

(assert (=> b!182365 (= e!120078 e!120077)))

(declare-fun b!182366 () Bool)

(assert (=> b!182366 (= e!120078 (Found!614 (index!4628 lt!90109)))))

(declare-fun b!182367 () Bool)

(declare-fun e!120076 () SeekEntryResult!614)

(assert (=> b!182367 (= e!120076 Undefined!614)))

(declare-fun b!182368 () Bool)

(assert (=> b!182368 (= e!120076 e!120078)))

(assert (=> b!182368 (= lt!90111 (select (arr!3640 (_keys!5640 thiss!1248)) (index!4628 lt!90109)))))

(declare-fun c!32718 () Bool)

(assert (=> b!182368 (= c!32718 (= lt!90111 key!828))))

(declare-fun d!54483 () Bool)

(declare-fun lt!90110 () SeekEntryResult!614)

(assert (=> d!54483 (and (or ((_ is Undefined!614) lt!90110) (not ((_ is Found!614) lt!90110)) (and (bvsge (index!4627 lt!90110) #b00000000000000000000000000000000) (bvslt (index!4627 lt!90110) (size!3953 (_keys!5640 thiss!1248))))) (or ((_ is Undefined!614) lt!90110) ((_ is Found!614) lt!90110) (not ((_ is MissingZero!614) lt!90110)) (and (bvsge (index!4626 lt!90110) #b00000000000000000000000000000000) (bvslt (index!4626 lt!90110) (size!3953 (_keys!5640 thiss!1248))))) (or ((_ is Undefined!614) lt!90110) ((_ is Found!614) lt!90110) ((_ is MissingZero!614) lt!90110) (not ((_ is MissingVacant!614) lt!90110)) (and (bvsge (index!4629 lt!90110) #b00000000000000000000000000000000) (bvslt (index!4629 lt!90110) (size!3953 (_keys!5640 thiss!1248))))) (or ((_ is Undefined!614) lt!90110) (ite ((_ is Found!614) lt!90110) (= (select (arr!3640 (_keys!5640 thiss!1248)) (index!4627 lt!90110)) key!828) (ite ((_ is MissingZero!614) lt!90110) (= (select (arr!3640 (_keys!5640 thiss!1248)) (index!4626 lt!90110)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!614) lt!90110) (= (select (arr!3640 (_keys!5640 thiss!1248)) (index!4629 lt!90110)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54483 (= lt!90110 e!120076)))

(declare-fun c!32717 () Bool)

(assert (=> d!54483 (= c!32717 (and ((_ is Intermediate!614) lt!90109) (undefined!1426 lt!90109)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7699 (_ BitVec 32)) SeekEntryResult!614)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54483 (= lt!90109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8770 thiss!1248)) key!828 (_keys!5640 thiss!1248) (mask!8770 thiss!1248)))))

(assert (=> d!54483 (validMask!0 (mask!8770 thiss!1248))))

(assert (=> d!54483 (= (seekEntryOrOpen!0 key!828 (_keys!5640 thiss!1248) (mask!8770 thiss!1248)) lt!90110)))

(declare-fun b!182363 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7699 (_ BitVec 32)) SeekEntryResult!614)

(assert (=> b!182363 (= e!120077 (seekKeyOrZeroReturnVacant!0 (x!19887 lt!90109) (index!4628 lt!90109) (index!4628 lt!90109) key!828 (_keys!5640 thiss!1248) (mask!8770 thiss!1248)))))

(assert (= (and d!54483 c!32717) b!182367))

(assert (= (and d!54483 (not c!32717)) b!182368))

(assert (= (and b!182368 c!32718) b!182366))

(assert (= (and b!182368 (not c!32718)) b!182365))

(assert (= (and b!182365 c!32719) b!182364))

(assert (= (and b!182365 (not c!32719)) b!182363))

(declare-fun m!209673 () Bool)

(assert (=> b!182368 m!209673))

(declare-fun m!209675 () Bool)

(assert (=> d!54483 m!209675))

(declare-fun m!209677 () Bool)

(assert (=> d!54483 m!209677))

(declare-fun m!209679 () Bool)

(assert (=> d!54483 m!209679))

(assert (=> d!54483 m!209675))

(declare-fun m!209681 () Bool)

(assert (=> d!54483 m!209681))

(assert (=> d!54483 m!209545))

(declare-fun m!209683 () Bool)

(assert (=> d!54483 m!209683))

(declare-fun m!209685 () Bool)

(assert (=> b!182363 m!209685))

(assert (=> b!182202 d!54483))

(declare-fun d!54485 () Bool)

(assert (=> d!54485 (= (array_inv!2355 (_keys!5640 thiss!1248)) (bvsge (size!3953 (_keys!5640 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182197 d!54485))

(declare-fun d!54487 () Bool)

(assert (=> d!54487 (= (array_inv!2356 (_values!3713 thiss!1248)) (bvsge (size!3954 (_values!3713 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182197 d!54487))

(declare-fun d!54489 () Bool)

(declare-fun res!86279 () Bool)

(declare-fun e!120081 () Bool)

(assert (=> d!54489 (=> (not res!86279) (not e!120081))))

(declare-fun simpleValid!171 (LongMapFixedSize!2488) Bool)

(assert (=> d!54489 (= res!86279 (simpleValid!171 thiss!1248))))

(assert (=> d!54489 (= (valid!1051 thiss!1248) e!120081)))

(declare-fun b!182375 () Bool)

(declare-fun res!86280 () Bool)

(assert (=> b!182375 (=> (not res!86280) (not e!120081))))

(declare-fun arrayCountValidKeys!0 (array!7699 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182375 (= res!86280 (= (arrayCountValidKeys!0 (_keys!5640 thiss!1248) #b00000000000000000000000000000000 (size!3953 (_keys!5640 thiss!1248))) (_size!1293 thiss!1248)))))

(declare-fun b!182376 () Bool)

(declare-fun res!86281 () Bool)

(assert (=> b!182376 (=> (not res!86281) (not e!120081))))

(assert (=> b!182376 (= res!86281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5640 thiss!1248) (mask!8770 thiss!1248)))))

(declare-fun b!182377 () Bool)

(declare-datatypes ((List!2314 0))(
  ( (Nil!2311) (Cons!2310 (h!2939 (_ BitVec 64)) (t!7167 List!2314)) )
))
(declare-fun arrayNoDuplicates!0 (array!7699 (_ BitVec 32) List!2314) Bool)

(assert (=> b!182377 (= e!120081 (arrayNoDuplicates!0 (_keys!5640 thiss!1248) #b00000000000000000000000000000000 Nil!2311))))

(assert (= (and d!54489 res!86279) b!182375))

(assert (= (and b!182375 res!86280) b!182376))

(assert (= (and b!182376 res!86281) b!182377))

(declare-fun m!209687 () Bool)

(assert (=> d!54489 m!209687))

(declare-fun m!209689 () Bool)

(assert (=> b!182375 m!209689))

(assert (=> b!182376 m!209555))

(declare-fun m!209691 () Bool)

(assert (=> b!182377 m!209691))

(assert (=> start!18388 d!54489))

(declare-fun d!54491 () Bool)

(assert (=> d!54491 (= (validMask!0 (mask!8770 thiss!1248)) (and (or (= (mask!8770 thiss!1248) #b00000000000000000000000000000111) (= (mask!8770 thiss!1248) #b00000000000000000000000000001111) (= (mask!8770 thiss!1248) #b00000000000000000000000000011111) (= (mask!8770 thiss!1248) #b00000000000000000000000000111111) (= (mask!8770 thiss!1248) #b00000000000000000000000001111111) (= (mask!8770 thiss!1248) #b00000000000000000000000011111111) (= (mask!8770 thiss!1248) #b00000000000000000000000111111111) (= (mask!8770 thiss!1248) #b00000000000000000000001111111111) (= (mask!8770 thiss!1248) #b00000000000000000000011111111111) (= (mask!8770 thiss!1248) #b00000000000000000000111111111111) (= (mask!8770 thiss!1248) #b00000000000000000001111111111111) (= (mask!8770 thiss!1248) #b00000000000000000011111111111111) (= (mask!8770 thiss!1248) #b00000000000000000111111111111111) (= (mask!8770 thiss!1248) #b00000000000000001111111111111111) (= (mask!8770 thiss!1248) #b00000000000000011111111111111111) (= (mask!8770 thiss!1248) #b00000000000000111111111111111111) (= (mask!8770 thiss!1248) #b00000000000001111111111111111111) (= (mask!8770 thiss!1248) #b00000000000011111111111111111111) (= (mask!8770 thiss!1248) #b00000000000111111111111111111111) (= (mask!8770 thiss!1248) #b00000000001111111111111111111111) (= (mask!8770 thiss!1248) #b00000000011111111111111111111111) (= (mask!8770 thiss!1248) #b00000000111111111111111111111111) (= (mask!8770 thiss!1248) #b00000001111111111111111111111111) (= (mask!8770 thiss!1248) #b00000011111111111111111111111111) (= (mask!8770 thiss!1248) #b00000111111111111111111111111111) (= (mask!8770 thiss!1248) #b00001111111111111111111111111111) (= (mask!8770 thiss!1248) #b00011111111111111111111111111111) (= (mask!8770 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8770 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!182200 d!54491))

(declare-fun mapNonEmpty!7331 () Bool)

(declare-fun mapRes!7331 () Bool)

(declare-fun tp!16259 () Bool)

(declare-fun e!120086 () Bool)

(assert (=> mapNonEmpty!7331 (= mapRes!7331 (and tp!16259 e!120086))))

(declare-fun mapRest!7331 () (Array (_ BitVec 32) ValueCell!1790))

(declare-fun mapKey!7331 () (_ BitVec 32))

(declare-fun mapValue!7331 () ValueCell!1790)

(assert (=> mapNonEmpty!7331 (= mapRest!7322 (store mapRest!7331 mapKey!7331 mapValue!7331))))

(declare-fun mapIsEmpty!7331 () Bool)

(assert (=> mapIsEmpty!7331 mapRes!7331))

(declare-fun b!182384 () Bool)

(assert (=> b!182384 (= e!120086 tp_is_empty!4267)))

(declare-fun b!182385 () Bool)

(declare-fun e!120087 () Bool)

(assert (=> b!182385 (= e!120087 tp_is_empty!4267)))

(declare-fun condMapEmpty!7331 () Bool)

(declare-fun mapDefault!7331 () ValueCell!1790)

(assert (=> mapNonEmpty!7322 (= condMapEmpty!7331 (= mapRest!7322 ((as const (Array (_ BitVec 32) ValueCell!1790)) mapDefault!7331)))))

(assert (=> mapNonEmpty!7322 (= tp!16244 (and e!120087 mapRes!7331))))

(assert (= (and mapNonEmpty!7322 condMapEmpty!7331) mapIsEmpty!7331))

(assert (= (and mapNonEmpty!7322 (not condMapEmpty!7331)) mapNonEmpty!7331))

(assert (= (and mapNonEmpty!7331 ((_ is ValueCellFull!1790) mapValue!7331)) b!182384))

(assert (= (and mapNonEmpty!7322 ((_ is ValueCellFull!1790) mapDefault!7331)) b!182385))

(declare-fun m!209693 () Bool)

(assert (=> mapNonEmpty!7331 m!209693))

(declare-fun b_lambda!7159 () Bool)

(assert (= b_lambda!7157 (or (and b!182197 b_free!4495) b_lambda!7159)))

(check-sat (not b!182316) (not b_next!4495) (not mapNonEmpty!7331) (not b!182329) (not b!182335) (not b!182271) (not b!182375) (not b!182347) b_and!11037 (not bm!18399) tp_is_empty!4267 (not d!54479) (not b!182348) (not b!182376) (not d!54483) (not bm!18406) (not b!182363) (not b!182273) (not b!182326) (not d!54489) (not bm!18400) (not b_lambda!7159) (not b!182334) (not b!182320) (not b!182327) (not d!54477) (not bm!18397) (not bm!18398) (not b!182377) (not b!182325))
(check-sat b_and!11037 (not b_next!4495))
