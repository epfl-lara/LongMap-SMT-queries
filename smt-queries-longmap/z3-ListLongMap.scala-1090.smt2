; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22240 () Bool)

(assert start!22240)

(declare-fun b!233163 () Bool)

(declare-fun b_free!6289 () Bool)

(declare-fun b_next!6289 () Bool)

(assert (=> b!233163 (= b_free!6289 (not b_next!6289))))

(declare-fun tp!22012 () Bool)

(declare-fun b_and!13163 () Bool)

(assert (=> b!233163 (= tp!22012 b_and!13163)))

(declare-fun e!151464 () Bool)

(declare-datatypes ((V!7849 0))(
  ( (V!7850 (val!3120 Int)) )
))
(declare-datatypes ((ValueCell!2732 0))(
  ( (ValueCellFull!2732 (v!5135 V!7849)) (EmptyCell!2732) )
))
(declare-datatypes ((array!11539 0))(
  ( (array!11540 (arr!5487 (Array (_ BitVec 32) ValueCell!2732)) (size!5821 (_ BitVec 32))) )
))
(declare-datatypes ((array!11541 0))(
  ( (array!11542 (arr!5488 (Array (_ BitVec 32) (_ BitVec 64))) (size!5822 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3364 0))(
  ( (LongMapFixedSize!3365 (defaultEntry!4342 Int) (mask!10267 (_ BitVec 32)) (extraKeys!4079 (_ BitVec 32)) (zeroValue!4183 V!7849) (minValue!4183 V!7849) (_size!1731 (_ BitVec 32)) (_keys!6396 array!11541) (_values!4325 array!11539) (_vacant!1731 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3364)

(declare-fun tp_is_empty!6151 () Bool)

(declare-fun e!151460 () Bool)

(declare-fun array_inv!3623 (array!11541) Bool)

(declare-fun array_inv!3624 (array!11539) Bool)

(assert (=> b!233163 (= e!151460 (and tp!22012 tp_is_empty!6151 (array_inv!3623 (_keys!6396 thiss!1504)) (array_inv!3624 (_values!4325 thiss!1504)) e!151464))))

(declare-fun b!233164 () Bool)

(declare-fun res!114413 () Bool)

(declare-fun e!151463 () Bool)

(assert (=> b!233164 (=> (not res!114413) (not e!151463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!233164 (= res!114413 (validMask!0 (mask!10267 thiss!1504)))))

(declare-fun b!233165 () Bool)

(declare-fun res!114410 () Bool)

(declare-fun e!151462 () Bool)

(assert (=> b!233165 (=> (not res!114410) (not e!151462))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!233165 (= res!114410 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233166 () Bool)

(declare-fun res!114409 () Bool)

(assert (=> b!233166 (=> (not res!114409) (not e!151463))))

(declare-datatypes ((tuple2!4586 0))(
  ( (tuple2!4587 (_1!2304 (_ BitVec 64)) (_2!2304 V!7849)) )
))
(declare-datatypes ((List!3515 0))(
  ( (Nil!3512) (Cons!3511 (h!4159 tuple2!4586) (t!8467 List!3515)) )
))
(declare-datatypes ((ListLongMap!3489 0))(
  ( (ListLongMap!3490 (toList!1760 List!3515)) )
))
(declare-fun contains!1631 (ListLongMap!3489 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1269 (array!11541 array!11539 (_ BitVec 32) (_ BitVec 32) V!7849 V!7849 (_ BitVec 32) Int) ListLongMap!3489)

(assert (=> b!233166 (= res!114409 (contains!1631 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)) key!932))))

(declare-fun b!233167 () Bool)

(assert (=> b!233167 (= e!151462 e!151463)))

(declare-fun res!114411 () Bool)

(assert (=> b!233167 (=> (not res!114411) (not e!151463))))

(declare-datatypes ((SeekEntryResult!981 0))(
  ( (MissingZero!981 (index!6094 (_ BitVec 32))) (Found!981 (index!6095 (_ BitVec 32))) (Intermediate!981 (undefined!1793 Bool) (index!6096 (_ BitVec 32)) (x!23626 (_ BitVec 32))) (Undefined!981) (MissingVacant!981 (index!6097 (_ BitVec 32))) )
))
(declare-fun lt!117823 () SeekEntryResult!981)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233167 (= res!114411 (or (= lt!117823 (MissingZero!981 index!297)) (= lt!117823 (MissingVacant!981 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11541 (_ BitVec 32)) SeekEntryResult!981)

(assert (=> b!233167 (= lt!117823 (seekEntryOrOpen!0 key!932 (_keys!6396 thiss!1504) (mask!10267 thiss!1504)))))

(declare-fun res!114412 () Bool)

(assert (=> start!22240 (=> (not res!114412) (not e!151462))))

(declare-fun valid!1346 (LongMapFixedSize!3364) Bool)

(assert (=> start!22240 (= res!114412 (valid!1346 thiss!1504))))

(assert (=> start!22240 e!151462))

(assert (=> start!22240 e!151460))

(assert (=> start!22240 true))

(declare-fun mapIsEmpty!10399 () Bool)

(declare-fun mapRes!10399 () Bool)

(assert (=> mapIsEmpty!10399 mapRes!10399))

(declare-fun mapNonEmpty!10399 () Bool)

(declare-fun tp!22011 () Bool)

(declare-fun e!151459 () Bool)

(assert (=> mapNonEmpty!10399 (= mapRes!10399 (and tp!22011 e!151459))))

(declare-fun mapKey!10399 () (_ BitVec 32))

(declare-fun mapRest!10399 () (Array (_ BitVec 32) ValueCell!2732))

(declare-fun mapValue!10399 () ValueCell!2732)

(assert (=> mapNonEmpty!10399 (= (arr!5487 (_values!4325 thiss!1504)) (store mapRest!10399 mapKey!10399 mapValue!10399))))

(declare-fun b!233168 () Bool)

(assert (=> b!233168 (= e!151459 tp_is_empty!6151)))

(declare-fun b!233169 () Bool)

(declare-fun e!151461 () Bool)

(assert (=> b!233169 (= e!151461 tp_is_empty!6151)))

(declare-fun b!233170 () Bool)

(assert (=> b!233170 (= e!151464 (and e!151461 mapRes!10399))))

(declare-fun condMapEmpty!10399 () Bool)

(declare-fun mapDefault!10399 () ValueCell!2732)

(assert (=> b!233170 (= condMapEmpty!10399 (= (arr!5487 (_values!4325 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2732)) mapDefault!10399)))))

(declare-fun b!233171 () Bool)

(assert (=> b!233171 (= e!151463 (not (= (size!5821 (_values!4325 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10267 thiss!1504)))))))

(assert (= (and start!22240 res!114412) b!233165))

(assert (= (and b!233165 res!114410) b!233167))

(assert (= (and b!233167 res!114411) b!233166))

(assert (= (and b!233166 res!114409) b!233164))

(assert (= (and b!233164 res!114413) b!233171))

(assert (= (and b!233170 condMapEmpty!10399) mapIsEmpty!10399))

(assert (= (and b!233170 (not condMapEmpty!10399)) mapNonEmpty!10399))

(get-info :version)

(assert (= (and mapNonEmpty!10399 ((_ is ValueCellFull!2732) mapValue!10399)) b!233168))

(assert (= (and b!233170 ((_ is ValueCellFull!2732) mapDefault!10399)) b!233169))

(assert (= b!233163 b!233170))

(assert (= start!22240 b!233163))

(declare-fun m!254107 () Bool)

(assert (=> start!22240 m!254107))

(declare-fun m!254109 () Bool)

(assert (=> mapNonEmpty!10399 m!254109))

(declare-fun m!254111 () Bool)

(assert (=> b!233163 m!254111))

(declare-fun m!254113 () Bool)

(assert (=> b!233163 m!254113))

(declare-fun m!254115 () Bool)

(assert (=> b!233167 m!254115))

(declare-fun m!254117 () Bool)

(assert (=> b!233166 m!254117))

(assert (=> b!233166 m!254117))

(declare-fun m!254119 () Bool)

(assert (=> b!233166 m!254119))

(declare-fun m!254121 () Bool)

(assert (=> b!233164 m!254121))

(check-sat (not start!22240) (not b!233166) (not b_next!6289) (not b!233167) tp_is_empty!6151 (not b!233164) (not b!233163) (not mapNonEmpty!10399) b_and!13163)
(check-sat b_and!13163 (not b_next!6289))
(get-model)

(declare-fun d!58731 () Bool)

(assert (=> d!58731 (= (array_inv!3623 (_keys!6396 thiss!1504)) (bvsge (size!5822 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233163 d!58731))

(declare-fun d!58733 () Bool)

(assert (=> d!58733 (= (array_inv!3624 (_values!4325 thiss!1504)) (bvsge (size!5821 (_values!4325 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233163 d!58733))

(declare-fun d!58735 () Bool)

(assert (=> d!58735 (= (validMask!0 (mask!10267 thiss!1504)) (and (or (= (mask!10267 thiss!1504) #b00000000000000000000000000000111) (= (mask!10267 thiss!1504) #b00000000000000000000000000001111) (= (mask!10267 thiss!1504) #b00000000000000000000000000011111) (= (mask!10267 thiss!1504) #b00000000000000000000000000111111) (= (mask!10267 thiss!1504) #b00000000000000000000000001111111) (= (mask!10267 thiss!1504) #b00000000000000000000000011111111) (= (mask!10267 thiss!1504) #b00000000000000000000000111111111) (= (mask!10267 thiss!1504) #b00000000000000000000001111111111) (= (mask!10267 thiss!1504) #b00000000000000000000011111111111) (= (mask!10267 thiss!1504) #b00000000000000000000111111111111) (= (mask!10267 thiss!1504) #b00000000000000000001111111111111) (= (mask!10267 thiss!1504) #b00000000000000000011111111111111) (= (mask!10267 thiss!1504) #b00000000000000000111111111111111) (= (mask!10267 thiss!1504) #b00000000000000001111111111111111) (= (mask!10267 thiss!1504) #b00000000000000011111111111111111) (= (mask!10267 thiss!1504) #b00000000000000111111111111111111) (= (mask!10267 thiss!1504) #b00000000000001111111111111111111) (= (mask!10267 thiss!1504) #b00000000000011111111111111111111) (= (mask!10267 thiss!1504) #b00000000000111111111111111111111) (= (mask!10267 thiss!1504) #b00000000001111111111111111111111) (= (mask!10267 thiss!1504) #b00000000011111111111111111111111) (= (mask!10267 thiss!1504) #b00000000111111111111111111111111) (= (mask!10267 thiss!1504) #b00000001111111111111111111111111) (= (mask!10267 thiss!1504) #b00000011111111111111111111111111) (= (mask!10267 thiss!1504) #b00000111111111111111111111111111) (= (mask!10267 thiss!1504) #b00001111111111111111111111111111) (= (mask!10267 thiss!1504) #b00011111111111111111111111111111) (= (mask!10267 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10267 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!233164 d!58735))

(declare-fun d!58737 () Bool)

(declare-fun e!151512 () Bool)

(assert (=> d!58737 e!151512))

(declare-fun res!114446 () Bool)

(assert (=> d!58737 (=> res!114446 e!151512)))

(declare-fun lt!117838 () Bool)

(assert (=> d!58737 (= res!114446 (not lt!117838))))

(declare-fun lt!117839 () Bool)

(assert (=> d!58737 (= lt!117838 lt!117839)))

(declare-datatypes ((Unit!7210 0))(
  ( (Unit!7211) )
))
(declare-fun lt!117840 () Unit!7210)

(declare-fun e!151511 () Unit!7210)

(assert (=> d!58737 (= lt!117840 e!151511)))

(declare-fun c!38782 () Bool)

(assert (=> d!58737 (= c!38782 lt!117839)))

(declare-fun containsKey!252 (List!3515 (_ BitVec 64)) Bool)

(assert (=> d!58737 (= lt!117839 (containsKey!252 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(assert (=> d!58737 (= (contains!1631 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)) key!932) lt!117838)))

(declare-fun b!233232 () Bool)

(declare-fun lt!117841 () Unit!7210)

(assert (=> b!233232 (= e!151511 lt!117841)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!201 (List!3515 (_ BitVec 64)) Unit!7210)

(assert (=> b!233232 (= lt!117841 (lemmaContainsKeyImpliesGetValueByKeyDefined!201 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(declare-datatypes ((Option!266 0))(
  ( (Some!265 (v!5138 V!7849)) (None!264) )
))
(declare-fun isDefined!202 (Option!266) Bool)

(declare-fun getValueByKey!260 (List!3515 (_ BitVec 64)) Option!266)

(assert (=> b!233232 (isDefined!202 (getValueByKey!260 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(declare-fun b!233233 () Bool)

(declare-fun Unit!7212 () Unit!7210)

(assert (=> b!233233 (= e!151511 Unit!7212)))

(declare-fun b!233234 () Bool)

(assert (=> b!233234 (= e!151512 (isDefined!202 (getValueByKey!260 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932)))))

(assert (= (and d!58737 c!38782) b!233232))

(assert (= (and d!58737 (not c!38782)) b!233233))

(assert (= (and d!58737 (not res!114446)) b!233234))

(declare-fun m!254155 () Bool)

(assert (=> d!58737 m!254155))

(declare-fun m!254157 () Bool)

(assert (=> b!233232 m!254157))

(declare-fun m!254159 () Bool)

(assert (=> b!233232 m!254159))

(assert (=> b!233232 m!254159))

(declare-fun m!254161 () Bool)

(assert (=> b!233232 m!254161))

(assert (=> b!233234 m!254159))

(assert (=> b!233234 m!254159))

(assert (=> b!233234 m!254161))

(assert (=> b!233166 d!58737))

(declare-fun bm!21687 () Bool)

(declare-fun call!21691 () ListLongMap!3489)

(declare-fun call!21692 () ListLongMap!3489)

(assert (=> bm!21687 (= call!21691 call!21692)))

(declare-fun bm!21688 () Bool)

(declare-fun call!21695 () Bool)

(declare-fun lt!117891 () ListLongMap!3489)

(assert (=> bm!21688 (= call!21695 (contains!1631 lt!117891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233277 () Bool)

(declare-fun e!151549 () Bool)

(declare-fun apply!204 (ListLongMap!3489 (_ BitVec 64)) V!7849)

(assert (=> b!233277 (= e!151549 (= (apply!204 lt!117891 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4183 thiss!1504)))))

(declare-fun b!233278 () Bool)

(declare-fun e!151544 () ListLongMap!3489)

(declare-fun call!21696 () ListLongMap!3489)

(declare-fun +!637 (ListLongMap!3489 tuple2!4586) ListLongMap!3489)

(assert (=> b!233278 (= e!151544 (+!637 call!21696 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))

(declare-fun c!38797 () Bool)

(declare-fun c!38799 () Bool)

(declare-fun bm!21689 () Bool)

(declare-fun call!21693 () ListLongMap!3489)

(assert (=> bm!21689 (= call!21696 (+!637 (ite c!38799 call!21692 (ite c!38797 call!21691 call!21693)) (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(declare-fun b!233279 () Bool)

(declare-fun res!114470 () Bool)

(declare-fun e!151546 () Bool)

(assert (=> b!233279 (=> (not res!114470) (not e!151546))))

(declare-fun e!151542 () Bool)

(assert (=> b!233279 (= res!114470 e!151542)))

(declare-fun res!114467 () Bool)

(assert (=> b!233279 (=> res!114467 e!151542)))

(declare-fun e!151548 () Bool)

(assert (=> b!233279 (= res!114467 (not e!151548))))

(declare-fun res!114468 () Bool)

(assert (=> b!233279 (=> (not res!114468) (not e!151548))))

(assert (=> b!233279 (= res!114468 (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(declare-fun b!233281 () Bool)

(declare-fun e!151541 () Bool)

(declare-fun call!21690 () Bool)

(assert (=> b!233281 (= e!151541 (not call!21690))))

(declare-fun b!233282 () Bool)

(declare-fun e!151550 () Bool)

(assert (=> b!233282 (= e!151550 (= (apply!204 lt!117891 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4183 thiss!1504)))))

(declare-fun b!233283 () Bool)

(declare-fun c!38798 () Bool)

(assert (=> b!233283 (= c!38798 (and (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!151551 () ListLongMap!3489)

(declare-fun e!151543 () ListLongMap!3489)

(assert (=> b!233283 (= e!151551 e!151543)))

(declare-fun b!233284 () Bool)

(assert (=> b!233284 (= e!151544 e!151551)))

(assert (=> b!233284 (= c!38797 (and (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233285 () Bool)

(assert (=> b!233285 (= e!151546 e!151541)))

(declare-fun c!38800 () Bool)

(assert (=> b!233285 (= c!38800 (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233286 () Bool)

(declare-fun call!21694 () ListLongMap!3489)

(assert (=> b!233286 (= e!151551 call!21694)))

(declare-fun b!233287 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!233287 (= e!151548 (validKeyInArray!0 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233288 () Bool)

(assert (=> b!233288 (= e!151543 call!21694)))

(declare-fun b!233289 () Bool)

(assert (=> b!233289 (= e!151541 e!151550)))

(declare-fun res!114472 () Bool)

(assert (=> b!233289 (= res!114472 call!21690)))

(assert (=> b!233289 (=> (not res!114472) (not e!151550))))

(declare-fun b!233290 () Bool)

(declare-fun e!151539 () Bool)

(assert (=> b!233290 (= e!151539 (validKeyInArray!0 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233291 () Bool)

(assert (=> b!233291 (= e!151543 call!21693)))

(declare-fun bm!21690 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!520 (array!11541 array!11539 (_ BitVec 32) (_ BitVec 32) V!7849 V!7849 (_ BitVec 32) Int) ListLongMap!3489)

(assert (=> bm!21690 (= call!21692 (getCurrentListMapNoExtraKeys!520 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))

(declare-fun b!233292 () Bool)

(declare-fun e!151540 () Bool)

(declare-fun get!2807 (ValueCell!2732 V!7849) V!7849)

(declare-fun dynLambda!538 (Int (_ BitVec 64)) V!7849)

(assert (=> b!233292 (= e!151540 (= (apply!204 lt!117891 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)) (get!2807 (select (arr!5487 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!538 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5821 (_values!4325 thiss!1504))))))

(assert (=> b!233292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(declare-fun bm!21691 () Bool)

(assert (=> bm!21691 (= call!21693 call!21691)))

(declare-fun b!233293 () Bool)

(declare-fun e!151545 () Unit!7210)

(declare-fun Unit!7213 () Unit!7210)

(assert (=> b!233293 (= e!151545 Unit!7213)))

(declare-fun b!233294 () Bool)

(assert (=> b!233294 (= e!151542 e!151540)))

(declare-fun res!114473 () Bool)

(assert (=> b!233294 (=> (not res!114473) (not e!151540))))

(assert (=> b!233294 (= res!114473 (contains!1631 lt!117891 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(declare-fun bm!21692 () Bool)

(assert (=> bm!21692 (= call!21690 (contains!1631 lt!117891 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233295 () Bool)

(declare-fun res!114469 () Bool)

(assert (=> b!233295 (=> (not res!114469) (not e!151546))))

(declare-fun e!151547 () Bool)

(assert (=> b!233295 (= res!114469 e!151547)))

(declare-fun c!38796 () Bool)

(assert (=> b!233295 (= c!38796 (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!21693 () Bool)

(assert (=> bm!21693 (= call!21694 call!21696)))

(declare-fun b!233296 () Bool)

(declare-fun lt!117897 () Unit!7210)

(assert (=> b!233296 (= e!151545 lt!117897)))

(declare-fun lt!117886 () ListLongMap!3489)

(assert (=> b!233296 (= lt!117886 (getCurrentListMapNoExtraKeys!520 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))

(declare-fun lt!117889 () (_ BitVec 64))

(assert (=> b!233296 (= lt!117889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117896 () (_ BitVec 64))

(assert (=> b!233296 (= lt!117896 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!117887 () Unit!7210)

(declare-fun addStillContains!180 (ListLongMap!3489 (_ BitVec 64) V!7849 (_ BitVec 64)) Unit!7210)

(assert (=> b!233296 (= lt!117887 (addStillContains!180 lt!117886 lt!117889 (zeroValue!4183 thiss!1504) lt!117896))))

(assert (=> b!233296 (contains!1631 (+!637 lt!117886 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504))) lt!117896)))

(declare-fun lt!117895 () Unit!7210)

(assert (=> b!233296 (= lt!117895 lt!117887)))

(declare-fun lt!117905 () ListLongMap!3489)

(assert (=> b!233296 (= lt!117905 (getCurrentListMapNoExtraKeys!520 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))

(declare-fun lt!117893 () (_ BitVec 64))

(assert (=> b!233296 (= lt!117893 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117894 () (_ BitVec 64))

(assert (=> b!233296 (= lt!117894 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!117900 () Unit!7210)

(declare-fun addApplyDifferent!180 (ListLongMap!3489 (_ BitVec 64) V!7849 (_ BitVec 64)) Unit!7210)

(assert (=> b!233296 (= lt!117900 (addApplyDifferent!180 lt!117905 lt!117893 (minValue!4183 thiss!1504) lt!117894))))

(assert (=> b!233296 (= (apply!204 (+!637 lt!117905 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504))) lt!117894) (apply!204 lt!117905 lt!117894))))

(declare-fun lt!117907 () Unit!7210)

(assert (=> b!233296 (= lt!117907 lt!117900)))

(declare-fun lt!117899 () ListLongMap!3489)

(assert (=> b!233296 (= lt!117899 (getCurrentListMapNoExtraKeys!520 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))

(declare-fun lt!117892 () (_ BitVec 64))

(assert (=> b!233296 (= lt!117892 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117902 () (_ BitVec 64))

(assert (=> b!233296 (= lt!117902 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!117904 () Unit!7210)

(assert (=> b!233296 (= lt!117904 (addApplyDifferent!180 lt!117899 lt!117892 (zeroValue!4183 thiss!1504) lt!117902))))

(assert (=> b!233296 (= (apply!204 (+!637 lt!117899 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504))) lt!117902) (apply!204 lt!117899 lt!117902))))

(declare-fun lt!117901 () Unit!7210)

(assert (=> b!233296 (= lt!117901 lt!117904)))

(declare-fun lt!117898 () ListLongMap!3489)

(assert (=> b!233296 (= lt!117898 (getCurrentListMapNoExtraKeys!520 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))

(declare-fun lt!117906 () (_ BitVec 64))

(assert (=> b!233296 (= lt!117906 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117890 () (_ BitVec 64))

(assert (=> b!233296 (= lt!117890 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233296 (= lt!117897 (addApplyDifferent!180 lt!117898 lt!117906 (minValue!4183 thiss!1504) lt!117890))))

(assert (=> b!233296 (= (apply!204 (+!637 lt!117898 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504))) lt!117890) (apply!204 lt!117898 lt!117890))))

(declare-fun b!233297 () Bool)

(assert (=> b!233297 (= e!151547 (not call!21695))))

(declare-fun b!233280 () Bool)

(assert (=> b!233280 (= e!151547 e!151549)))

(declare-fun res!114465 () Bool)

(assert (=> b!233280 (= res!114465 call!21695)))

(assert (=> b!233280 (=> (not res!114465) (not e!151549))))

(declare-fun d!58739 () Bool)

(assert (=> d!58739 e!151546))

(declare-fun res!114471 () Bool)

(assert (=> d!58739 (=> (not res!114471) (not e!151546))))

(assert (=> d!58739 (= res!114471 (or (bvsge #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))))

(declare-fun lt!117903 () ListLongMap!3489)

(assert (=> d!58739 (= lt!117891 lt!117903)))

(declare-fun lt!117888 () Unit!7210)

(assert (=> d!58739 (= lt!117888 e!151545)))

(declare-fun c!38795 () Bool)

(assert (=> d!58739 (= c!38795 e!151539)))

(declare-fun res!114466 () Bool)

(assert (=> d!58739 (=> (not res!114466) (not e!151539))))

(assert (=> d!58739 (= res!114466 (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(assert (=> d!58739 (= lt!117903 e!151544)))

(assert (=> d!58739 (= c!38799 (and (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58739 (validMask!0 (mask!10267 thiss!1504))))

(assert (=> d!58739 (= (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)) lt!117891)))

(assert (= (and d!58739 c!38799) b!233278))

(assert (= (and d!58739 (not c!38799)) b!233284))

(assert (= (and b!233284 c!38797) b!233286))

(assert (= (and b!233284 (not c!38797)) b!233283))

(assert (= (and b!233283 c!38798) b!233288))

(assert (= (and b!233283 (not c!38798)) b!233291))

(assert (= (or b!233288 b!233291) bm!21691))

(assert (= (or b!233286 bm!21691) bm!21687))

(assert (= (or b!233286 b!233288) bm!21693))

(assert (= (or b!233278 bm!21687) bm!21690))

(assert (= (or b!233278 bm!21693) bm!21689))

(assert (= (and d!58739 res!114466) b!233290))

(assert (= (and d!58739 c!38795) b!233296))

(assert (= (and d!58739 (not c!38795)) b!233293))

(assert (= (and d!58739 res!114471) b!233279))

(assert (= (and b!233279 res!114468) b!233287))

(assert (= (and b!233279 (not res!114467)) b!233294))

(assert (= (and b!233294 res!114473) b!233292))

(assert (= (and b!233279 res!114470) b!233295))

(assert (= (and b!233295 c!38796) b!233280))

(assert (= (and b!233295 (not c!38796)) b!233297))

(assert (= (and b!233280 res!114465) b!233277))

(assert (= (or b!233280 b!233297) bm!21688))

(assert (= (and b!233295 res!114469) b!233285))

(assert (= (and b!233285 c!38800) b!233289))

(assert (= (and b!233285 (not c!38800)) b!233281))

(assert (= (and b!233289 res!114472) b!233282))

(assert (= (or b!233289 b!233281) bm!21692))

(declare-fun b_lambda!7829 () Bool)

(assert (=> (not b_lambda!7829) (not b!233292)))

(declare-fun t!8469 () Bool)

(declare-fun tb!2913 () Bool)

(assert (=> (and b!233163 (= (defaultEntry!4342 thiss!1504) (defaultEntry!4342 thiss!1504)) t!8469) tb!2913))

(declare-fun result!5077 () Bool)

(assert (=> tb!2913 (= result!5077 tp_is_empty!6151)))

(assert (=> b!233292 t!8469))

(declare-fun b_and!13169 () Bool)

(assert (= b_and!13163 (and (=> t!8469 result!5077) b_and!13169)))

(declare-fun m!254163 () Bool)

(assert (=> b!233282 m!254163))

(declare-fun m!254165 () Bool)

(assert (=> b!233278 m!254165))

(declare-fun m!254167 () Bool)

(assert (=> b!233294 m!254167))

(assert (=> b!233294 m!254167))

(declare-fun m!254169 () Bool)

(assert (=> b!233294 m!254169))

(declare-fun m!254171 () Bool)

(assert (=> bm!21692 m!254171))

(assert (=> d!58739 m!254121))

(declare-fun m!254173 () Bool)

(assert (=> bm!21690 m!254173))

(assert (=> b!233287 m!254167))

(assert (=> b!233287 m!254167))

(declare-fun m!254175 () Bool)

(assert (=> b!233287 m!254175))

(declare-fun m!254177 () Bool)

(assert (=> b!233296 m!254177))

(declare-fun m!254179 () Bool)

(assert (=> b!233296 m!254179))

(declare-fun m!254181 () Bool)

(assert (=> b!233296 m!254181))

(assert (=> b!233296 m!254181))

(declare-fun m!254183 () Bool)

(assert (=> b!233296 m!254183))

(declare-fun m!254185 () Bool)

(assert (=> b!233296 m!254185))

(declare-fun m!254187 () Bool)

(assert (=> b!233296 m!254187))

(declare-fun m!254189 () Bool)

(assert (=> b!233296 m!254189))

(declare-fun m!254191 () Bool)

(assert (=> b!233296 m!254191))

(declare-fun m!254193 () Bool)

(assert (=> b!233296 m!254193))

(declare-fun m!254195 () Bool)

(assert (=> b!233296 m!254195))

(assert (=> b!233296 m!254167))

(declare-fun m!254197 () Bool)

(assert (=> b!233296 m!254197))

(assert (=> b!233296 m!254195))

(declare-fun m!254199 () Bool)

(assert (=> b!233296 m!254199))

(declare-fun m!254201 () Bool)

(assert (=> b!233296 m!254201))

(declare-fun m!254203 () Bool)

(assert (=> b!233296 m!254203))

(assert (=> b!233296 m!254173))

(assert (=> b!233296 m!254189))

(assert (=> b!233296 m!254185))

(declare-fun m!254205 () Bool)

(assert (=> b!233296 m!254205))

(declare-fun m!254207 () Bool)

(assert (=> bm!21688 m!254207))

(declare-fun m!254209 () Bool)

(assert (=> bm!21689 m!254209))

(declare-fun m!254211 () Bool)

(assert (=> b!233277 m!254211))

(assert (=> b!233290 m!254167))

(assert (=> b!233290 m!254167))

(assert (=> b!233290 m!254175))

(declare-fun m!254213 () Bool)

(assert (=> b!233292 m!254213))

(assert (=> b!233292 m!254167))

(declare-fun m!254215 () Bool)

(assert (=> b!233292 m!254215))

(assert (=> b!233292 m!254213))

(declare-fun m!254217 () Bool)

(assert (=> b!233292 m!254217))

(declare-fun m!254219 () Bool)

(assert (=> b!233292 m!254219))

(assert (=> b!233292 m!254217))

(assert (=> b!233292 m!254167))

(assert (=> b!233166 d!58739))

(declare-fun d!58741 () Bool)

(declare-fun res!114480 () Bool)

(declare-fun e!151554 () Bool)

(assert (=> d!58741 (=> (not res!114480) (not e!151554))))

(declare-fun simpleValid!227 (LongMapFixedSize!3364) Bool)

(assert (=> d!58741 (= res!114480 (simpleValid!227 thiss!1504))))

(assert (=> d!58741 (= (valid!1346 thiss!1504) e!151554)))

(declare-fun b!233306 () Bool)

(declare-fun res!114481 () Bool)

(assert (=> b!233306 (=> (not res!114481) (not e!151554))))

(declare-fun arrayCountValidKeys!0 (array!11541 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233306 (= res!114481 (= (arrayCountValidKeys!0 (_keys!6396 thiss!1504) #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))) (_size!1731 thiss!1504)))))

(declare-fun b!233307 () Bool)

(declare-fun res!114482 () Bool)

(assert (=> b!233307 (=> (not res!114482) (not e!151554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11541 (_ BitVec 32)) Bool)

(assert (=> b!233307 (= res!114482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6396 thiss!1504) (mask!10267 thiss!1504)))))

(declare-fun b!233308 () Bool)

(declare-datatypes ((List!3516 0))(
  ( (Nil!3513) (Cons!3512 (h!4160 (_ BitVec 64)) (t!8470 List!3516)) )
))
(declare-fun arrayNoDuplicates!0 (array!11541 (_ BitVec 32) List!3516) Bool)

(assert (=> b!233308 (= e!151554 (arrayNoDuplicates!0 (_keys!6396 thiss!1504) #b00000000000000000000000000000000 Nil!3513))))

(assert (= (and d!58741 res!114480) b!233306))

(assert (= (and b!233306 res!114481) b!233307))

(assert (= (and b!233307 res!114482) b!233308))

(declare-fun m!254221 () Bool)

(assert (=> d!58741 m!254221))

(declare-fun m!254223 () Bool)

(assert (=> b!233306 m!254223))

(declare-fun m!254225 () Bool)

(assert (=> b!233307 m!254225))

(declare-fun m!254227 () Bool)

(assert (=> b!233308 m!254227))

(assert (=> start!22240 d!58741))

(declare-fun b!233321 () Bool)

(declare-fun e!151563 () SeekEntryResult!981)

(declare-fun lt!117914 () SeekEntryResult!981)

(assert (=> b!233321 (= e!151563 (Found!981 (index!6096 lt!117914)))))

(declare-fun b!233322 () Bool)

(declare-fun e!151561 () SeekEntryResult!981)

(assert (=> b!233322 (= e!151561 Undefined!981)))

(declare-fun b!233323 () Bool)

(assert (=> b!233323 (= e!151561 e!151563)))

(declare-fun lt!117916 () (_ BitVec 64))

(assert (=> b!233323 (= lt!117916 (select (arr!5488 (_keys!6396 thiss!1504)) (index!6096 lt!117914)))))

(declare-fun c!38807 () Bool)

(assert (=> b!233323 (= c!38807 (= lt!117916 key!932))))

(declare-fun e!151562 () SeekEntryResult!981)

(declare-fun b!233324 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11541 (_ BitVec 32)) SeekEntryResult!981)

(assert (=> b!233324 (= e!151562 (seekKeyOrZeroReturnVacant!0 (x!23626 lt!117914) (index!6096 lt!117914) (index!6096 lt!117914) key!932 (_keys!6396 thiss!1504) (mask!10267 thiss!1504)))))

(declare-fun d!58743 () Bool)

(declare-fun lt!117915 () SeekEntryResult!981)

(assert (=> d!58743 (and (or ((_ is Undefined!981) lt!117915) (not ((_ is Found!981) lt!117915)) (and (bvsge (index!6095 lt!117915) #b00000000000000000000000000000000) (bvslt (index!6095 lt!117915) (size!5822 (_keys!6396 thiss!1504))))) (or ((_ is Undefined!981) lt!117915) ((_ is Found!981) lt!117915) (not ((_ is MissingZero!981) lt!117915)) (and (bvsge (index!6094 lt!117915) #b00000000000000000000000000000000) (bvslt (index!6094 lt!117915) (size!5822 (_keys!6396 thiss!1504))))) (or ((_ is Undefined!981) lt!117915) ((_ is Found!981) lt!117915) ((_ is MissingZero!981) lt!117915) (not ((_ is MissingVacant!981) lt!117915)) (and (bvsge (index!6097 lt!117915) #b00000000000000000000000000000000) (bvslt (index!6097 lt!117915) (size!5822 (_keys!6396 thiss!1504))))) (or ((_ is Undefined!981) lt!117915) (ite ((_ is Found!981) lt!117915) (= (select (arr!5488 (_keys!6396 thiss!1504)) (index!6095 lt!117915)) key!932) (ite ((_ is MissingZero!981) lt!117915) (= (select (arr!5488 (_keys!6396 thiss!1504)) (index!6094 lt!117915)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!981) lt!117915) (= (select (arr!5488 (_keys!6396 thiss!1504)) (index!6097 lt!117915)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58743 (= lt!117915 e!151561)))

(declare-fun c!38808 () Bool)

(assert (=> d!58743 (= c!38808 (and ((_ is Intermediate!981) lt!117914) (undefined!1793 lt!117914)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11541 (_ BitVec 32)) SeekEntryResult!981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58743 (= lt!117914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10267 thiss!1504)) key!932 (_keys!6396 thiss!1504) (mask!10267 thiss!1504)))))

(assert (=> d!58743 (validMask!0 (mask!10267 thiss!1504))))

(assert (=> d!58743 (= (seekEntryOrOpen!0 key!932 (_keys!6396 thiss!1504) (mask!10267 thiss!1504)) lt!117915)))

(declare-fun b!233325 () Bool)

(assert (=> b!233325 (= e!151562 (MissingZero!981 (index!6096 lt!117914)))))

(declare-fun b!233326 () Bool)

(declare-fun c!38809 () Bool)

(assert (=> b!233326 (= c!38809 (= lt!117916 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233326 (= e!151563 e!151562)))

(assert (= (and d!58743 c!38808) b!233322))

(assert (= (and d!58743 (not c!38808)) b!233323))

(assert (= (and b!233323 c!38807) b!233321))

(assert (= (and b!233323 (not c!38807)) b!233326))

(assert (= (and b!233326 c!38809) b!233325))

(assert (= (and b!233326 (not c!38809)) b!233324))

(declare-fun m!254229 () Bool)

(assert (=> b!233323 m!254229))

(declare-fun m!254231 () Bool)

(assert (=> b!233324 m!254231))

(declare-fun m!254233 () Bool)

(assert (=> d!58743 m!254233))

(declare-fun m!254235 () Bool)

(assert (=> d!58743 m!254235))

(assert (=> d!58743 m!254121))

(assert (=> d!58743 m!254233))

(declare-fun m!254237 () Bool)

(assert (=> d!58743 m!254237))

(declare-fun m!254239 () Bool)

(assert (=> d!58743 m!254239))

(declare-fun m!254241 () Bool)

(assert (=> d!58743 m!254241))

(assert (=> b!233167 d!58743))

(declare-fun b!233333 () Bool)

(declare-fun e!151569 () Bool)

(assert (=> b!233333 (= e!151569 tp_is_empty!6151)))

(declare-fun mapIsEmpty!10408 () Bool)

(declare-fun mapRes!10408 () Bool)

(assert (=> mapIsEmpty!10408 mapRes!10408))

(declare-fun condMapEmpty!10408 () Bool)

(declare-fun mapDefault!10408 () ValueCell!2732)

(assert (=> mapNonEmpty!10399 (= condMapEmpty!10408 (= mapRest!10399 ((as const (Array (_ BitVec 32) ValueCell!2732)) mapDefault!10408)))))

(declare-fun e!151568 () Bool)

(assert (=> mapNonEmpty!10399 (= tp!22011 (and e!151568 mapRes!10408))))

(declare-fun b!233334 () Bool)

(assert (=> b!233334 (= e!151568 tp_is_empty!6151)))

(declare-fun mapNonEmpty!10408 () Bool)

(declare-fun tp!22027 () Bool)

(assert (=> mapNonEmpty!10408 (= mapRes!10408 (and tp!22027 e!151569))))

(declare-fun mapValue!10408 () ValueCell!2732)

(declare-fun mapKey!10408 () (_ BitVec 32))

(declare-fun mapRest!10408 () (Array (_ BitVec 32) ValueCell!2732))

(assert (=> mapNonEmpty!10408 (= mapRest!10399 (store mapRest!10408 mapKey!10408 mapValue!10408))))

(assert (= (and mapNonEmpty!10399 condMapEmpty!10408) mapIsEmpty!10408))

(assert (= (and mapNonEmpty!10399 (not condMapEmpty!10408)) mapNonEmpty!10408))

(assert (= (and mapNonEmpty!10408 ((_ is ValueCellFull!2732) mapValue!10408)) b!233333))

(assert (= (and mapNonEmpty!10399 ((_ is ValueCellFull!2732) mapDefault!10408)) b!233334))

(declare-fun m!254243 () Bool)

(assert (=> mapNonEmpty!10408 m!254243))

(declare-fun b_lambda!7831 () Bool)

(assert (= b_lambda!7829 (or (and b!233163 b_free!6289) b_lambda!7831)))

(check-sat (not b!233292) (not d!58743) (not b!233296) (not bm!21692) (not b!233278) (not b_lambda!7831) (not b_next!6289) (not b!233294) (not b!233307) b_and!13169 (not b!233277) (not b!233308) (not b!233290) (not bm!21689) (not b!233306) (not mapNonEmpty!10408) (not b!233324) (not d!58737) (not b!233234) (not b!233232) tp_is_empty!6151 (not b!233282) (not d!58741) (not d!58739) (not bm!21690) (not bm!21688) (not b!233287))
(check-sat b_and!13169 (not b_next!6289))
(get-model)

(declare-fun d!58745 () Bool)

(declare-fun get!2808 (Option!266) V!7849)

(assert (=> d!58745 (= (apply!204 lt!117891 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2808 (getValueByKey!260 (toList!1760 lt!117891) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8625 () Bool)

(assert (= bs!8625 d!58745))

(declare-fun m!254245 () Bool)

(assert (=> bs!8625 m!254245))

(assert (=> bs!8625 m!254245))

(declare-fun m!254247 () Bool)

(assert (=> bs!8625 m!254247))

(assert (=> b!233277 d!58745))

(declare-fun d!58747 () Bool)

(assert (=> d!58747 (= (validKeyInArray!0 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233287 d!58747))

(declare-fun d!58749 () Bool)

(declare-fun e!151572 () Bool)

(assert (=> d!58749 e!151572))

(declare-fun res!114488 () Bool)

(assert (=> d!58749 (=> (not res!114488) (not e!151572))))

(declare-fun lt!117927 () ListLongMap!3489)

(assert (=> d!58749 (= res!114488 (contains!1631 lt!117927 (_1!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(declare-fun lt!117928 () List!3515)

(assert (=> d!58749 (= lt!117927 (ListLongMap!3490 lt!117928))))

(declare-fun lt!117925 () Unit!7210)

(declare-fun lt!117926 () Unit!7210)

(assert (=> d!58749 (= lt!117925 lt!117926)))

(assert (=> d!58749 (= (getValueByKey!260 lt!117928 (_1!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))) (Some!265 (_2!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!148 (List!3515 (_ BitVec 64) V!7849) Unit!7210)

(assert (=> d!58749 (= lt!117926 (lemmaContainsTupThenGetReturnValue!148 lt!117928 (_1!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))) (_2!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(declare-fun insertStrictlySorted!151 (List!3515 (_ BitVec 64) V!7849) List!3515)

(assert (=> d!58749 (= lt!117928 (insertStrictlySorted!151 (toList!1760 call!21696) (_1!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))) (_2!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(assert (=> d!58749 (= (+!637 call!21696 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))) lt!117927)))

(declare-fun b!233339 () Bool)

(declare-fun res!114487 () Bool)

(assert (=> b!233339 (=> (not res!114487) (not e!151572))))

(assert (=> b!233339 (= res!114487 (= (getValueByKey!260 (toList!1760 lt!117927) (_1!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))) (Some!265 (_2!2304 (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))))

(declare-fun b!233340 () Bool)

(declare-fun contains!1632 (List!3515 tuple2!4586) Bool)

(assert (=> b!233340 (= e!151572 (contains!1632 (toList!1760 lt!117927) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))

(assert (= (and d!58749 res!114488) b!233339))

(assert (= (and b!233339 res!114487) b!233340))

(declare-fun m!254249 () Bool)

(assert (=> d!58749 m!254249))

(declare-fun m!254251 () Bool)

(assert (=> d!58749 m!254251))

(declare-fun m!254253 () Bool)

(assert (=> d!58749 m!254253))

(declare-fun m!254255 () Bool)

(assert (=> d!58749 m!254255))

(declare-fun m!254257 () Bool)

(assert (=> b!233339 m!254257))

(declare-fun m!254259 () Bool)

(assert (=> b!233340 m!254259))

(assert (=> b!233278 d!58749))

(declare-fun d!58751 () Bool)

(declare-fun res!114493 () Bool)

(declare-fun e!151577 () Bool)

(assert (=> d!58751 (=> res!114493 e!151577)))

(assert (=> d!58751 (= res!114493 (and ((_ is Cons!3511) (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) (= (_1!2304 (h!4159 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) key!932)))))

(assert (=> d!58751 (= (containsKey!252 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932) e!151577)))

(declare-fun b!233345 () Bool)

(declare-fun e!151578 () Bool)

(assert (=> b!233345 (= e!151577 e!151578)))

(declare-fun res!114494 () Bool)

(assert (=> b!233345 (=> (not res!114494) (not e!151578))))

(assert (=> b!233345 (= res!114494 (and (or (not ((_ is Cons!3511) (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) (bvsle (_1!2304 (h!4159 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) key!932)) ((_ is Cons!3511) (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) (bvslt (_1!2304 (h!4159 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) key!932)))))

(declare-fun b!233346 () Bool)

(assert (=> b!233346 (= e!151578 (containsKey!252 (t!8467 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) key!932))))

(assert (= (and d!58751 (not res!114493)) b!233345))

(assert (= (and b!233345 res!114494) b!233346))

(declare-fun m!254261 () Bool)

(assert (=> b!233346 m!254261))

(assert (=> d!58737 d!58751))

(declare-fun d!58753 () Bool)

(declare-fun e!151579 () Bool)

(assert (=> d!58753 e!151579))

(declare-fun res!114496 () Bool)

(assert (=> d!58753 (=> (not res!114496) (not e!151579))))

(declare-fun lt!117931 () ListLongMap!3489)

(assert (=> d!58753 (= res!114496 (contains!1631 lt!117931 (_1!2304 (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))))

(declare-fun lt!117932 () List!3515)

(assert (=> d!58753 (= lt!117931 (ListLongMap!3490 lt!117932))))

(declare-fun lt!117929 () Unit!7210)

(declare-fun lt!117930 () Unit!7210)

(assert (=> d!58753 (= lt!117929 lt!117930)))

(assert (=> d!58753 (= (getValueByKey!260 lt!117932 (_1!2304 (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))) (Some!265 (_2!2304 (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))))

(assert (=> d!58753 (= lt!117930 (lemmaContainsTupThenGetReturnValue!148 lt!117932 (_1!2304 (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))) (_2!2304 (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))))

(assert (=> d!58753 (= lt!117932 (insertStrictlySorted!151 (toList!1760 (ite c!38799 call!21692 (ite c!38797 call!21691 call!21693))) (_1!2304 (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))) (_2!2304 (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))))

(assert (=> d!58753 (= (+!637 (ite c!38799 call!21692 (ite c!38797 call!21691 call!21693)) (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))) lt!117931)))

(declare-fun b!233347 () Bool)

(declare-fun res!114495 () Bool)

(assert (=> b!233347 (=> (not res!114495) (not e!151579))))

(assert (=> b!233347 (= res!114495 (= (getValueByKey!260 (toList!1760 lt!117931) (_1!2304 (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))) (Some!265 (_2!2304 (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))))

(declare-fun b!233348 () Bool)

(assert (=> b!233348 (= e!151579 (contains!1632 (toList!1760 lt!117931) (ite (or c!38799 c!38797) (tuple2!4587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(assert (= (and d!58753 res!114496) b!233347))

(assert (= (and b!233347 res!114495) b!233348))

(declare-fun m!254263 () Bool)

(assert (=> d!58753 m!254263))

(declare-fun m!254265 () Bool)

(assert (=> d!58753 m!254265))

(declare-fun m!254267 () Bool)

(assert (=> d!58753 m!254267))

(declare-fun m!254269 () Bool)

(assert (=> d!58753 m!254269))

(declare-fun m!254271 () Bool)

(assert (=> b!233347 m!254271))

(declare-fun m!254273 () Bool)

(assert (=> b!233348 m!254273))

(assert (=> bm!21689 d!58753))

(declare-fun d!58755 () Bool)

(assert (=> d!58755 (= (apply!204 (+!637 lt!117898 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504))) lt!117890) (apply!204 lt!117898 lt!117890))))

(declare-fun lt!117935 () Unit!7210)

(declare-fun choose!1099 (ListLongMap!3489 (_ BitVec 64) V!7849 (_ BitVec 64)) Unit!7210)

(assert (=> d!58755 (= lt!117935 (choose!1099 lt!117898 lt!117906 (minValue!4183 thiss!1504) lt!117890))))

(declare-fun e!151582 () Bool)

(assert (=> d!58755 e!151582))

(declare-fun res!114499 () Bool)

(assert (=> d!58755 (=> (not res!114499) (not e!151582))))

(assert (=> d!58755 (= res!114499 (contains!1631 lt!117898 lt!117890))))

(assert (=> d!58755 (= (addApplyDifferent!180 lt!117898 lt!117906 (minValue!4183 thiss!1504) lt!117890) lt!117935)))

(declare-fun b!233352 () Bool)

(assert (=> b!233352 (= e!151582 (not (= lt!117890 lt!117906)))))

(assert (= (and d!58755 res!114499) b!233352))

(declare-fun m!254275 () Bool)

(assert (=> d!58755 m!254275))

(assert (=> d!58755 m!254181))

(assert (=> d!58755 m!254197))

(assert (=> d!58755 m!254181))

(assert (=> d!58755 m!254183))

(declare-fun m!254277 () Bool)

(assert (=> d!58755 m!254277))

(assert (=> b!233296 d!58755))

(declare-fun d!58757 () Bool)

(assert (=> d!58757 (= (apply!204 lt!117905 lt!117894) (get!2808 (getValueByKey!260 (toList!1760 lt!117905) lt!117894)))))

(declare-fun bs!8626 () Bool)

(assert (= bs!8626 d!58757))

(declare-fun m!254279 () Bool)

(assert (=> bs!8626 m!254279))

(assert (=> bs!8626 m!254279))

(declare-fun m!254281 () Bool)

(assert (=> bs!8626 m!254281))

(assert (=> b!233296 d!58757))

(declare-fun d!58759 () Bool)

(declare-fun e!151584 () Bool)

(assert (=> d!58759 e!151584))

(declare-fun res!114500 () Bool)

(assert (=> d!58759 (=> res!114500 e!151584)))

(declare-fun lt!117936 () Bool)

(assert (=> d!58759 (= res!114500 (not lt!117936))))

(declare-fun lt!117937 () Bool)

(assert (=> d!58759 (= lt!117936 lt!117937)))

(declare-fun lt!117938 () Unit!7210)

(declare-fun e!151583 () Unit!7210)

(assert (=> d!58759 (= lt!117938 e!151583)))

(declare-fun c!38810 () Bool)

(assert (=> d!58759 (= c!38810 lt!117937)))

(assert (=> d!58759 (= lt!117937 (containsKey!252 (toList!1760 (+!637 lt!117886 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504)))) lt!117896))))

(assert (=> d!58759 (= (contains!1631 (+!637 lt!117886 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504))) lt!117896) lt!117936)))

(declare-fun b!233353 () Bool)

(declare-fun lt!117939 () Unit!7210)

(assert (=> b!233353 (= e!151583 lt!117939)))

(assert (=> b!233353 (= lt!117939 (lemmaContainsKeyImpliesGetValueByKeyDefined!201 (toList!1760 (+!637 lt!117886 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504)))) lt!117896))))

(assert (=> b!233353 (isDefined!202 (getValueByKey!260 (toList!1760 (+!637 lt!117886 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504)))) lt!117896))))

(declare-fun b!233354 () Bool)

(declare-fun Unit!7214 () Unit!7210)

(assert (=> b!233354 (= e!151583 Unit!7214)))

(declare-fun b!233355 () Bool)

(assert (=> b!233355 (= e!151584 (isDefined!202 (getValueByKey!260 (toList!1760 (+!637 lt!117886 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504)))) lt!117896)))))

(assert (= (and d!58759 c!38810) b!233353))

(assert (= (and d!58759 (not c!38810)) b!233354))

(assert (= (and d!58759 (not res!114500)) b!233355))

(declare-fun m!254283 () Bool)

(assert (=> d!58759 m!254283))

(declare-fun m!254285 () Bool)

(assert (=> b!233353 m!254285))

(declare-fun m!254287 () Bool)

(assert (=> b!233353 m!254287))

(assert (=> b!233353 m!254287))

(declare-fun m!254289 () Bool)

(assert (=> b!233353 m!254289))

(assert (=> b!233355 m!254287))

(assert (=> b!233355 m!254287))

(assert (=> b!233355 m!254289))

(assert (=> b!233296 d!58759))

(declare-fun d!58761 () Bool)

(assert (=> d!58761 (= (apply!204 (+!637 lt!117899 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504))) lt!117902) (apply!204 lt!117899 lt!117902))))

(declare-fun lt!117940 () Unit!7210)

(assert (=> d!58761 (= lt!117940 (choose!1099 lt!117899 lt!117892 (zeroValue!4183 thiss!1504) lt!117902))))

(declare-fun e!151585 () Bool)

(assert (=> d!58761 e!151585))

(declare-fun res!114501 () Bool)

(assert (=> d!58761 (=> (not res!114501) (not e!151585))))

(assert (=> d!58761 (= res!114501 (contains!1631 lt!117899 lt!117902))))

(assert (=> d!58761 (= (addApplyDifferent!180 lt!117899 lt!117892 (zeroValue!4183 thiss!1504) lt!117902) lt!117940)))

(declare-fun b!233356 () Bool)

(assert (=> b!233356 (= e!151585 (not (= lt!117902 lt!117892)))))

(assert (= (and d!58761 res!114501) b!233356))

(declare-fun m!254291 () Bool)

(assert (=> d!58761 m!254291))

(assert (=> d!58761 m!254185))

(assert (=> d!58761 m!254201))

(assert (=> d!58761 m!254185))

(assert (=> d!58761 m!254205))

(declare-fun m!254293 () Bool)

(assert (=> d!58761 m!254293))

(assert (=> b!233296 d!58761))

(declare-fun d!58763 () Bool)

(assert (=> d!58763 (= (apply!204 (+!637 lt!117899 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504))) lt!117902) (get!2808 (getValueByKey!260 (toList!1760 (+!637 lt!117899 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504)))) lt!117902)))))

(declare-fun bs!8627 () Bool)

(assert (= bs!8627 d!58763))

(declare-fun m!254295 () Bool)

(assert (=> bs!8627 m!254295))

(assert (=> bs!8627 m!254295))

(declare-fun m!254297 () Bool)

(assert (=> bs!8627 m!254297))

(assert (=> b!233296 d!58763))

(declare-fun d!58765 () Bool)

(assert (=> d!58765 (= (apply!204 (+!637 lt!117905 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504))) lt!117894) (apply!204 lt!117905 lt!117894))))

(declare-fun lt!117941 () Unit!7210)

(assert (=> d!58765 (= lt!117941 (choose!1099 lt!117905 lt!117893 (minValue!4183 thiss!1504) lt!117894))))

(declare-fun e!151586 () Bool)

(assert (=> d!58765 e!151586))

(declare-fun res!114502 () Bool)

(assert (=> d!58765 (=> (not res!114502) (not e!151586))))

(assert (=> d!58765 (= res!114502 (contains!1631 lt!117905 lt!117894))))

(assert (=> d!58765 (= (addApplyDifferent!180 lt!117905 lt!117893 (minValue!4183 thiss!1504) lt!117894) lt!117941)))

(declare-fun b!233357 () Bool)

(assert (=> b!233357 (= e!151586 (not (= lt!117894 lt!117893)))))

(assert (= (and d!58765 res!114502) b!233357))

(declare-fun m!254299 () Bool)

(assert (=> d!58765 m!254299))

(assert (=> d!58765 m!254195))

(assert (=> d!58765 m!254203))

(assert (=> d!58765 m!254195))

(assert (=> d!58765 m!254199))

(declare-fun m!254301 () Bool)

(assert (=> d!58765 m!254301))

(assert (=> b!233296 d!58765))

(declare-fun d!58767 () Bool)

(declare-fun e!151587 () Bool)

(assert (=> d!58767 e!151587))

(declare-fun res!114504 () Bool)

(assert (=> d!58767 (=> (not res!114504) (not e!151587))))

(declare-fun lt!117944 () ListLongMap!3489)

(assert (=> d!58767 (= res!114504 (contains!1631 lt!117944 (_1!2304 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504)))))))

(declare-fun lt!117945 () List!3515)

(assert (=> d!58767 (= lt!117944 (ListLongMap!3490 lt!117945))))

(declare-fun lt!117942 () Unit!7210)

(declare-fun lt!117943 () Unit!7210)

(assert (=> d!58767 (= lt!117942 lt!117943)))

(assert (=> d!58767 (= (getValueByKey!260 lt!117945 (_1!2304 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504)))) (Some!265 (_2!2304 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504)))))))

(assert (=> d!58767 (= lt!117943 (lemmaContainsTupThenGetReturnValue!148 lt!117945 (_1!2304 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504))) (_2!2304 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504)))))))

(assert (=> d!58767 (= lt!117945 (insertStrictlySorted!151 (toList!1760 lt!117899) (_1!2304 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504))) (_2!2304 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504)))))))

(assert (=> d!58767 (= (+!637 lt!117899 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504))) lt!117944)))

(declare-fun b!233358 () Bool)

(declare-fun res!114503 () Bool)

(assert (=> b!233358 (=> (not res!114503) (not e!151587))))

(assert (=> b!233358 (= res!114503 (= (getValueByKey!260 (toList!1760 lt!117944) (_1!2304 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504)))) (Some!265 (_2!2304 (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504))))))))

(declare-fun b!233359 () Bool)

(assert (=> b!233359 (= e!151587 (contains!1632 (toList!1760 lt!117944) (tuple2!4587 lt!117892 (zeroValue!4183 thiss!1504))))))

(assert (= (and d!58767 res!114504) b!233358))

(assert (= (and b!233358 res!114503) b!233359))

(declare-fun m!254303 () Bool)

(assert (=> d!58767 m!254303))

(declare-fun m!254305 () Bool)

(assert (=> d!58767 m!254305))

(declare-fun m!254307 () Bool)

(assert (=> d!58767 m!254307))

(declare-fun m!254309 () Bool)

(assert (=> d!58767 m!254309))

(declare-fun m!254311 () Bool)

(assert (=> b!233358 m!254311))

(declare-fun m!254313 () Bool)

(assert (=> b!233359 m!254313))

(assert (=> b!233296 d!58767))

(declare-fun d!58769 () Bool)

(assert (=> d!58769 (contains!1631 (+!637 lt!117886 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504))) lt!117896)))

(declare-fun lt!117948 () Unit!7210)

(declare-fun choose!1100 (ListLongMap!3489 (_ BitVec 64) V!7849 (_ BitVec 64)) Unit!7210)

(assert (=> d!58769 (= lt!117948 (choose!1100 lt!117886 lt!117889 (zeroValue!4183 thiss!1504) lt!117896))))

(assert (=> d!58769 (contains!1631 lt!117886 lt!117896)))

(assert (=> d!58769 (= (addStillContains!180 lt!117886 lt!117889 (zeroValue!4183 thiss!1504) lt!117896) lt!117948)))

(declare-fun bs!8628 () Bool)

(assert (= bs!8628 d!58769))

(assert (=> bs!8628 m!254189))

(assert (=> bs!8628 m!254189))

(assert (=> bs!8628 m!254191))

(declare-fun m!254315 () Bool)

(assert (=> bs!8628 m!254315))

(declare-fun m!254317 () Bool)

(assert (=> bs!8628 m!254317))

(assert (=> b!233296 d!58769))

(declare-fun d!58771 () Bool)

(declare-fun e!151588 () Bool)

(assert (=> d!58771 e!151588))

(declare-fun res!114506 () Bool)

(assert (=> d!58771 (=> (not res!114506) (not e!151588))))

(declare-fun lt!117951 () ListLongMap!3489)

(assert (=> d!58771 (= res!114506 (contains!1631 lt!117951 (_1!2304 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504)))))))

(declare-fun lt!117952 () List!3515)

(assert (=> d!58771 (= lt!117951 (ListLongMap!3490 lt!117952))))

(declare-fun lt!117949 () Unit!7210)

(declare-fun lt!117950 () Unit!7210)

(assert (=> d!58771 (= lt!117949 lt!117950)))

(assert (=> d!58771 (= (getValueByKey!260 lt!117952 (_1!2304 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504)))) (Some!265 (_2!2304 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504)))))))

(assert (=> d!58771 (= lt!117950 (lemmaContainsTupThenGetReturnValue!148 lt!117952 (_1!2304 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504))) (_2!2304 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504)))))))

(assert (=> d!58771 (= lt!117952 (insertStrictlySorted!151 (toList!1760 lt!117905) (_1!2304 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504))) (_2!2304 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504)))))))

(assert (=> d!58771 (= (+!637 lt!117905 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504))) lt!117951)))

(declare-fun b!233361 () Bool)

(declare-fun res!114505 () Bool)

(assert (=> b!233361 (=> (not res!114505) (not e!151588))))

(assert (=> b!233361 (= res!114505 (= (getValueByKey!260 (toList!1760 lt!117951) (_1!2304 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504)))) (Some!265 (_2!2304 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504))))))))

(declare-fun b!233362 () Bool)

(assert (=> b!233362 (= e!151588 (contains!1632 (toList!1760 lt!117951) (tuple2!4587 lt!117893 (minValue!4183 thiss!1504))))))

(assert (= (and d!58771 res!114506) b!233361))

(assert (= (and b!233361 res!114505) b!233362))

(declare-fun m!254319 () Bool)

(assert (=> d!58771 m!254319))

(declare-fun m!254321 () Bool)

(assert (=> d!58771 m!254321))

(declare-fun m!254323 () Bool)

(assert (=> d!58771 m!254323))

(declare-fun m!254325 () Bool)

(assert (=> d!58771 m!254325))

(declare-fun m!254327 () Bool)

(assert (=> b!233361 m!254327))

(declare-fun m!254329 () Bool)

(assert (=> b!233362 m!254329))

(assert (=> b!233296 d!58771))

(declare-fun d!58773 () Bool)

(declare-fun e!151589 () Bool)

(assert (=> d!58773 e!151589))

(declare-fun res!114508 () Bool)

(assert (=> d!58773 (=> (not res!114508) (not e!151589))))

(declare-fun lt!117955 () ListLongMap!3489)

(assert (=> d!58773 (= res!114508 (contains!1631 lt!117955 (_1!2304 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504)))))))

(declare-fun lt!117956 () List!3515)

(assert (=> d!58773 (= lt!117955 (ListLongMap!3490 lt!117956))))

(declare-fun lt!117953 () Unit!7210)

(declare-fun lt!117954 () Unit!7210)

(assert (=> d!58773 (= lt!117953 lt!117954)))

(assert (=> d!58773 (= (getValueByKey!260 lt!117956 (_1!2304 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504)))) (Some!265 (_2!2304 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504)))))))

(assert (=> d!58773 (= lt!117954 (lemmaContainsTupThenGetReturnValue!148 lt!117956 (_1!2304 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504))) (_2!2304 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504)))))))

(assert (=> d!58773 (= lt!117956 (insertStrictlySorted!151 (toList!1760 lt!117898) (_1!2304 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504))) (_2!2304 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504)))))))

(assert (=> d!58773 (= (+!637 lt!117898 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504))) lt!117955)))

(declare-fun b!233363 () Bool)

(declare-fun res!114507 () Bool)

(assert (=> b!233363 (=> (not res!114507) (not e!151589))))

(assert (=> b!233363 (= res!114507 (= (getValueByKey!260 (toList!1760 lt!117955) (_1!2304 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504)))) (Some!265 (_2!2304 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504))))))))

(declare-fun b!233364 () Bool)

(assert (=> b!233364 (= e!151589 (contains!1632 (toList!1760 lt!117955) (tuple2!4587 lt!117906 (minValue!4183 thiss!1504))))))

(assert (= (and d!58773 res!114508) b!233363))

(assert (= (and b!233363 res!114507) b!233364))

(declare-fun m!254331 () Bool)

(assert (=> d!58773 m!254331))

(declare-fun m!254333 () Bool)

(assert (=> d!58773 m!254333))

(declare-fun m!254335 () Bool)

(assert (=> d!58773 m!254335))

(declare-fun m!254337 () Bool)

(assert (=> d!58773 m!254337))

(declare-fun m!254339 () Bool)

(assert (=> b!233363 m!254339))

(declare-fun m!254341 () Bool)

(assert (=> b!233364 m!254341))

(assert (=> b!233296 d!58773))

(declare-fun d!58775 () Bool)

(assert (=> d!58775 (= (apply!204 lt!117898 lt!117890) (get!2808 (getValueByKey!260 (toList!1760 lt!117898) lt!117890)))))

(declare-fun bs!8629 () Bool)

(assert (= bs!8629 d!58775))

(declare-fun m!254343 () Bool)

(assert (=> bs!8629 m!254343))

(assert (=> bs!8629 m!254343))

(declare-fun m!254345 () Bool)

(assert (=> bs!8629 m!254345))

(assert (=> b!233296 d!58775))

(declare-fun d!58777 () Bool)

(declare-fun e!151590 () Bool)

(assert (=> d!58777 e!151590))

(declare-fun res!114510 () Bool)

(assert (=> d!58777 (=> (not res!114510) (not e!151590))))

(declare-fun lt!117959 () ListLongMap!3489)

(assert (=> d!58777 (= res!114510 (contains!1631 lt!117959 (_1!2304 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504)))))))

(declare-fun lt!117960 () List!3515)

(assert (=> d!58777 (= lt!117959 (ListLongMap!3490 lt!117960))))

(declare-fun lt!117957 () Unit!7210)

(declare-fun lt!117958 () Unit!7210)

(assert (=> d!58777 (= lt!117957 lt!117958)))

(assert (=> d!58777 (= (getValueByKey!260 lt!117960 (_1!2304 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504)))) (Some!265 (_2!2304 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504)))))))

(assert (=> d!58777 (= lt!117958 (lemmaContainsTupThenGetReturnValue!148 lt!117960 (_1!2304 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504))) (_2!2304 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504)))))))

(assert (=> d!58777 (= lt!117960 (insertStrictlySorted!151 (toList!1760 lt!117886) (_1!2304 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504))) (_2!2304 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504)))))))

(assert (=> d!58777 (= (+!637 lt!117886 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504))) lt!117959)))

(declare-fun b!233365 () Bool)

(declare-fun res!114509 () Bool)

(assert (=> b!233365 (=> (not res!114509) (not e!151590))))

(assert (=> b!233365 (= res!114509 (= (getValueByKey!260 (toList!1760 lt!117959) (_1!2304 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504)))) (Some!265 (_2!2304 (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504))))))))

(declare-fun b!233366 () Bool)

(assert (=> b!233366 (= e!151590 (contains!1632 (toList!1760 lt!117959) (tuple2!4587 lt!117889 (zeroValue!4183 thiss!1504))))))

(assert (= (and d!58777 res!114510) b!233365))

(assert (= (and b!233365 res!114509) b!233366))

(declare-fun m!254347 () Bool)

(assert (=> d!58777 m!254347))

(declare-fun m!254349 () Bool)

(assert (=> d!58777 m!254349))

(declare-fun m!254351 () Bool)

(assert (=> d!58777 m!254351))

(declare-fun m!254353 () Bool)

(assert (=> d!58777 m!254353))

(declare-fun m!254355 () Bool)

(assert (=> b!233365 m!254355))

(declare-fun m!254357 () Bool)

(assert (=> b!233366 m!254357))

(assert (=> b!233296 d!58777))

(declare-fun d!58779 () Bool)

(assert (=> d!58779 (= (apply!204 (+!637 lt!117898 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504))) lt!117890) (get!2808 (getValueByKey!260 (toList!1760 (+!637 lt!117898 (tuple2!4587 lt!117906 (minValue!4183 thiss!1504)))) lt!117890)))))

(declare-fun bs!8630 () Bool)

(assert (= bs!8630 d!58779))

(declare-fun m!254359 () Bool)

(assert (=> bs!8630 m!254359))

(assert (=> bs!8630 m!254359))

(declare-fun m!254361 () Bool)

(assert (=> bs!8630 m!254361))

(assert (=> b!233296 d!58779))

(declare-fun b!233391 () Bool)

(declare-fun e!151606 () ListLongMap!3489)

(declare-fun call!21699 () ListLongMap!3489)

(assert (=> b!233391 (= e!151606 call!21699)))

(declare-fun b!233392 () Bool)

(declare-fun e!151607 () ListLongMap!3489)

(assert (=> b!233392 (= e!151607 e!151606)))

(declare-fun c!38821 () Bool)

(assert (=> b!233392 (= c!38821 (validKeyInArray!0 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233393 () Bool)

(declare-fun e!151610 () Bool)

(assert (=> b!233393 (= e!151610 (validKeyInArray!0 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233393 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!233394 () Bool)

(declare-fun res!114520 () Bool)

(declare-fun e!151609 () Bool)

(assert (=> b!233394 (=> (not res!114520) (not e!151609))))

(declare-fun lt!117978 () ListLongMap!3489)

(assert (=> b!233394 (= res!114520 (not (contains!1631 lt!117978 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!233395 () Bool)

(declare-fun e!151608 () Bool)

(declare-fun e!151611 () Bool)

(assert (=> b!233395 (= e!151608 e!151611)))

(declare-fun c!38819 () Bool)

(assert (=> b!233395 (= c!38819 (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(declare-fun b!233396 () Bool)

(declare-fun e!151605 () Bool)

(assert (=> b!233396 (= e!151608 e!151605)))

(assert (=> b!233396 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(declare-fun res!114522 () Bool)

(assert (=> b!233396 (= res!114522 (contains!1631 lt!117978 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233396 (=> (not res!114522) (not e!151605))))

(declare-fun b!233397 () Bool)

(assert (=> b!233397 (= e!151609 e!151608)))

(declare-fun c!38822 () Bool)

(assert (=> b!233397 (= c!38822 e!151610)))

(declare-fun res!114519 () Bool)

(assert (=> b!233397 (=> (not res!114519) (not e!151610))))

(assert (=> b!233397 (= res!114519 (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(declare-fun b!233398 () Bool)

(assert (=> b!233398 (= e!151611 (= lt!117978 (getCurrentListMapNoExtraKeys!520 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4342 thiss!1504))))))

(declare-fun d!58781 () Bool)

(assert (=> d!58781 e!151609))

(declare-fun res!114521 () Bool)

(assert (=> d!58781 (=> (not res!114521) (not e!151609))))

(assert (=> d!58781 (= res!114521 (not (contains!1631 lt!117978 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58781 (= lt!117978 e!151607)))

(declare-fun c!38820 () Bool)

(assert (=> d!58781 (= c!38820 (bvsge #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(assert (=> d!58781 (validMask!0 (mask!10267 thiss!1504))))

(assert (=> d!58781 (= (getCurrentListMapNoExtraKeys!520 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)) lt!117978)))

(declare-fun b!233399 () Bool)

(assert (=> b!233399 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(assert (=> b!233399 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5821 (_values!4325 thiss!1504))))))

(assert (=> b!233399 (= e!151605 (= (apply!204 lt!117978 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)) (get!2807 (select (arr!5487 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!538 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233400 () Bool)

(assert (=> b!233400 (= e!151607 (ListLongMap!3490 Nil!3512))))

(declare-fun b!233401 () Bool)

(declare-fun isEmpty!508 (ListLongMap!3489) Bool)

(assert (=> b!233401 (= e!151611 (isEmpty!508 lt!117978))))

(declare-fun b!233402 () Bool)

(declare-fun lt!117980 () Unit!7210)

(declare-fun lt!117975 () Unit!7210)

(assert (=> b!233402 (= lt!117980 lt!117975)))

(declare-fun lt!117976 () (_ BitVec 64))

(declare-fun lt!117979 () V!7849)

(declare-fun lt!117981 () (_ BitVec 64))

(declare-fun lt!117977 () ListLongMap!3489)

(assert (=> b!233402 (not (contains!1631 (+!637 lt!117977 (tuple2!4587 lt!117976 lt!117979)) lt!117981))))

(declare-fun addStillNotContains!112 (ListLongMap!3489 (_ BitVec 64) V!7849 (_ BitVec 64)) Unit!7210)

(assert (=> b!233402 (= lt!117975 (addStillNotContains!112 lt!117977 lt!117976 lt!117979 lt!117981))))

(assert (=> b!233402 (= lt!117981 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!233402 (= lt!117979 (get!2807 (select (arr!5487 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!538 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!233402 (= lt!117976 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233402 (= lt!117977 call!21699)))

(assert (=> b!233402 (= e!151606 (+!637 call!21699 (tuple2!4587 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000) (get!2807 (select (arr!5487 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!538 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!21696 () Bool)

(assert (=> bm!21696 (= call!21699 (getCurrentListMapNoExtraKeys!520 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4342 thiss!1504)))))

(assert (= (and d!58781 c!38820) b!233400))

(assert (= (and d!58781 (not c!38820)) b!233392))

(assert (= (and b!233392 c!38821) b!233402))

(assert (= (and b!233392 (not c!38821)) b!233391))

(assert (= (or b!233402 b!233391) bm!21696))

(assert (= (and d!58781 res!114521) b!233394))

(assert (= (and b!233394 res!114520) b!233397))

(assert (= (and b!233397 res!114519) b!233393))

(assert (= (and b!233397 c!38822) b!233396))

(assert (= (and b!233397 (not c!38822)) b!233395))

(assert (= (and b!233396 res!114522) b!233399))

(assert (= (and b!233395 c!38819) b!233398))

(assert (= (and b!233395 (not c!38819)) b!233401))

(declare-fun b_lambda!7833 () Bool)

(assert (=> (not b_lambda!7833) (not b!233399)))

(assert (=> b!233399 t!8469))

(declare-fun b_and!13171 () Bool)

(assert (= b_and!13169 (and (=> t!8469 result!5077) b_and!13171)))

(declare-fun b_lambda!7835 () Bool)

(assert (=> (not b_lambda!7835) (not b!233402)))

(assert (=> b!233402 t!8469))

(declare-fun b_and!13173 () Bool)

(assert (= b_and!13171 (and (=> t!8469 result!5077) b_and!13173)))

(declare-fun m!254363 () Bool)

(assert (=> b!233401 m!254363))

(assert (=> b!233393 m!254167))

(assert (=> b!233393 m!254167))

(assert (=> b!233393 m!254175))

(assert (=> b!233402 m!254217))

(declare-fun m!254365 () Bool)

(assert (=> b!233402 m!254365))

(assert (=> b!233402 m!254213))

(assert (=> b!233402 m!254167))

(declare-fun m!254367 () Bool)

(assert (=> b!233402 m!254367))

(declare-fun m!254369 () Bool)

(assert (=> b!233402 m!254369))

(assert (=> b!233402 m!254213))

(assert (=> b!233402 m!254217))

(assert (=> b!233402 m!254219))

(assert (=> b!233402 m!254367))

(declare-fun m!254371 () Bool)

(assert (=> b!233402 m!254371))

(declare-fun m!254373 () Bool)

(assert (=> b!233398 m!254373))

(declare-fun m!254375 () Bool)

(assert (=> b!233394 m!254375))

(assert (=> b!233396 m!254167))

(assert (=> b!233396 m!254167))

(declare-fun m!254377 () Bool)

(assert (=> b!233396 m!254377))

(assert (=> b!233399 m!254217))

(assert (=> b!233399 m!254213))

(assert (=> b!233399 m!254167))

(assert (=> b!233399 m!254167))

(declare-fun m!254379 () Bool)

(assert (=> b!233399 m!254379))

(assert (=> b!233399 m!254213))

(assert (=> b!233399 m!254217))

(assert (=> b!233399 m!254219))

(assert (=> bm!21696 m!254373))

(declare-fun m!254381 () Bool)

(assert (=> d!58781 m!254381))

(assert (=> d!58781 m!254121))

(assert (=> b!233392 m!254167))

(assert (=> b!233392 m!254167))

(assert (=> b!233392 m!254175))

(assert (=> b!233296 d!58781))

(declare-fun d!58783 () Bool)

(assert (=> d!58783 (= (apply!204 (+!637 lt!117905 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504))) lt!117894) (get!2808 (getValueByKey!260 (toList!1760 (+!637 lt!117905 (tuple2!4587 lt!117893 (minValue!4183 thiss!1504)))) lt!117894)))))

(declare-fun bs!8631 () Bool)

(assert (= bs!8631 d!58783))

(declare-fun m!254383 () Bool)

(assert (=> bs!8631 m!254383))

(assert (=> bs!8631 m!254383))

(declare-fun m!254385 () Bool)

(assert (=> bs!8631 m!254385))

(assert (=> b!233296 d!58783))

(declare-fun d!58785 () Bool)

(assert (=> d!58785 (= (apply!204 lt!117899 lt!117902) (get!2808 (getValueByKey!260 (toList!1760 lt!117899) lt!117902)))))

(declare-fun bs!8632 () Bool)

(assert (= bs!8632 d!58785))

(declare-fun m!254387 () Bool)

(assert (=> bs!8632 m!254387))

(assert (=> bs!8632 m!254387))

(declare-fun m!254389 () Bool)

(assert (=> bs!8632 m!254389))

(assert (=> b!233296 d!58785))

(assert (=> b!233290 d!58747))

(declare-fun d!58787 () Bool)

(assert (=> d!58787 (isDefined!202 (getValueByKey!260 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(declare-fun lt!117984 () Unit!7210)

(declare-fun choose!1101 (List!3515 (_ BitVec 64)) Unit!7210)

(assert (=> d!58787 (= lt!117984 (choose!1101 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(declare-fun e!151614 () Bool)

(assert (=> d!58787 e!151614))

(declare-fun res!114525 () Bool)

(assert (=> d!58787 (=> (not res!114525) (not e!151614))))

(declare-fun isStrictlySorted!354 (List!3515) Bool)

(assert (=> d!58787 (= res!114525 (isStrictlySorted!354 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))))

(assert (=> d!58787 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!201 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932) lt!117984)))

(declare-fun b!233405 () Bool)

(assert (=> b!233405 (= e!151614 (containsKey!252 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(assert (= (and d!58787 res!114525) b!233405))

(assert (=> d!58787 m!254159))

(assert (=> d!58787 m!254159))

(assert (=> d!58787 m!254161))

(declare-fun m!254391 () Bool)

(assert (=> d!58787 m!254391))

(declare-fun m!254393 () Bool)

(assert (=> d!58787 m!254393))

(assert (=> b!233405 m!254155))

(assert (=> b!233232 d!58787))

(declare-fun d!58789 () Bool)

(declare-fun isEmpty!509 (Option!266) Bool)

(assert (=> d!58789 (= (isDefined!202 (getValueByKey!260 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932)) (not (isEmpty!509 (getValueByKey!260 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))))

(declare-fun bs!8633 () Bool)

(assert (= bs!8633 d!58789))

(assert (=> bs!8633 m!254159))

(declare-fun m!254395 () Bool)

(assert (=> bs!8633 m!254395))

(assert (=> b!233232 d!58789))

(declare-fun b!233414 () Bool)

(declare-fun e!151619 () Option!266)

(assert (=> b!233414 (= e!151619 (Some!265 (_2!2304 (h!4159 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))))))

(declare-fun b!233417 () Bool)

(declare-fun e!151620 () Option!266)

(assert (=> b!233417 (= e!151620 None!264)))

(declare-fun b!233415 () Bool)

(assert (=> b!233415 (= e!151619 e!151620)))

(declare-fun c!38828 () Bool)

(assert (=> b!233415 (= c!38828 (and ((_ is Cons!3511) (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) (not (= (_1!2304 (h!4159 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) key!932))))))

(declare-fun b!233416 () Bool)

(assert (=> b!233416 (= e!151620 (getValueByKey!260 (t!8467 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) key!932))))

(declare-fun d!58791 () Bool)

(declare-fun c!38827 () Bool)

(assert (=> d!58791 (= c!38827 (and ((_ is Cons!3511) (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) (= (_1!2304 (h!4159 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) key!932)))))

(assert (=> d!58791 (= (getValueByKey!260 (toList!1760 (getCurrentListMap!1269 (_keys!6396 thiss!1504) (_values!4325 thiss!1504) (mask!10267 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932) e!151619)))

(assert (= (and d!58791 c!38827) b!233414))

(assert (= (and d!58791 (not c!38827)) b!233415))

(assert (= (and b!233415 c!38828) b!233416))

(assert (= (and b!233415 (not c!38828)) b!233417))

(declare-fun m!254397 () Bool)

(assert (=> b!233416 m!254397))

(assert (=> b!233232 d!58791))

(declare-fun e!151627 () SeekEntryResult!981)

(declare-fun b!233430 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233430 (= e!151627 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23626 lt!117914) #b00000000000000000000000000000001) (nextIndex!0 (index!6096 lt!117914) (x!23626 lt!117914) (mask!10267 thiss!1504)) (index!6096 lt!117914) key!932 (_keys!6396 thiss!1504) (mask!10267 thiss!1504)))))

(declare-fun b!233431 () Bool)

(declare-fun e!151629 () SeekEntryResult!981)

(assert (=> b!233431 (= e!151629 Undefined!981)))

(declare-fun b!233432 () Bool)

(declare-fun e!151628 () SeekEntryResult!981)

(assert (=> b!233432 (= e!151628 (Found!981 (index!6096 lt!117914)))))

(declare-fun b!233434 () Bool)

(declare-fun c!38835 () Bool)

(declare-fun lt!117989 () (_ BitVec 64))

(assert (=> b!233434 (= c!38835 (= lt!117989 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233434 (= e!151628 e!151627)))

(declare-fun b!233435 () Bool)

(assert (=> b!233435 (= e!151627 (MissingVacant!981 (index!6096 lt!117914)))))

(declare-fun b!233433 () Bool)

(assert (=> b!233433 (= e!151629 e!151628)))

(declare-fun c!38836 () Bool)

(assert (=> b!233433 (= c!38836 (= lt!117989 key!932))))

(declare-fun lt!117990 () SeekEntryResult!981)

(declare-fun d!58793 () Bool)

(assert (=> d!58793 (and (or ((_ is Undefined!981) lt!117990) (not ((_ is Found!981) lt!117990)) (and (bvsge (index!6095 lt!117990) #b00000000000000000000000000000000) (bvslt (index!6095 lt!117990) (size!5822 (_keys!6396 thiss!1504))))) (or ((_ is Undefined!981) lt!117990) ((_ is Found!981) lt!117990) (not ((_ is MissingVacant!981) lt!117990)) (not (= (index!6097 lt!117990) (index!6096 lt!117914))) (and (bvsge (index!6097 lt!117990) #b00000000000000000000000000000000) (bvslt (index!6097 lt!117990) (size!5822 (_keys!6396 thiss!1504))))) (or ((_ is Undefined!981) lt!117990) (ite ((_ is Found!981) lt!117990) (= (select (arr!5488 (_keys!6396 thiss!1504)) (index!6095 lt!117990)) key!932) (and ((_ is MissingVacant!981) lt!117990) (= (index!6097 lt!117990) (index!6096 lt!117914)) (= (select (arr!5488 (_keys!6396 thiss!1504)) (index!6097 lt!117990)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58793 (= lt!117990 e!151629)))

(declare-fun c!38837 () Bool)

(assert (=> d!58793 (= c!38837 (bvsge (x!23626 lt!117914) #b01111111111111111111111111111110))))

(assert (=> d!58793 (= lt!117989 (select (arr!5488 (_keys!6396 thiss!1504)) (index!6096 lt!117914)))))

(assert (=> d!58793 (validMask!0 (mask!10267 thiss!1504))))

(assert (=> d!58793 (= (seekKeyOrZeroReturnVacant!0 (x!23626 lt!117914) (index!6096 lt!117914) (index!6096 lt!117914) key!932 (_keys!6396 thiss!1504) (mask!10267 thiss!1504)) lt!117990)))

(assert (= (and d!58793 c!38837) b!233431))

(assert (= (and d!58793 (not c!38837)) b!233433))

(assert (= (and b!233433 c!38836) b!233432))

(assert (= (and b!233433 (not c!38836)) b!233434))

(assert (= (and b!233434 c!38835) b!233435))

(assert (= (and b!233434 (not c!38835)) b!233430))

(declare-fun m!254399 () Bool)

(assert (=> b!233430 m!254399))

(assert (=> b!233430 m!254399))

(declare-fun m!254401 () Bool)

(assert (=> b!233430 m!254401))

(declare-fun m!254403 () Bool)

(assert (=> d!58793 m!254403))

(declare-fun m!254405 () Bool)

(assert (=> d!58793 m!254405))

(assert (=> d!58793 m!254229))

(assert (=> d!58793 m!254121))

(assert (=> b!233324 d!58793))

(declare-fun b!233446 () Bool)

(declare-fun res!114536 () Bool)

(declare-fun e!151632 () Bool)

(assert (=> b!233446 (=> (not res!114536) (not e!151632))))

(declare-fun size!5827 (LongMapFixedSize!3364) (_ BitVec 32))

(assert (=> b!233446 (= res!114536 (= (size!5827 thiss!1504) (bvadd (_size!1731 thiss!1504) (bvsdiv (bvadd (extraKeys!4079 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!233444 () Bool)

(declare-fun res!114534 () Bool)

(assert (=> b!233444 (=> (not res!114534) (not e!151632))))

(assert (=> b!233444 (= res!114534 (and (= (size!5821 (_values!4325 thiss!1504)) (bvadd (mask!10267 thiss!1504) #b00000000000000000000000000000001)) (= (size!5822 (_keys!6396 thiss!1504)) (size!5821 (_values!4325 thiss!1504))) (bvsge (_size!1731 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1731 thiss!1504) (bvadd (mask!10267 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!233447 () Bool)

(assert (=> b!233447 (= e!151632 (and (bvsge (extraKeys!4079 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4079 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1731 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!58795 () Bool)

(declare-fun res!114537 () Bool)

(assert (=> d!58795 (=> (not res!114537) (not e!151632))))

(assert (=> d!58795 (= res!114537 (validMask!0 (mask!10267 thiss!1504)))))

(assert (=> d!58795 (= (simpleValid!227 thiss!1504) e!151632)))

(declare-fun b!233445 () Bool)

(declare-fun res!114535 () Bool)

(assert (=> b!233445 (=> (not res!114535) (not e!151632))))

(assert (=> b!233445 (= res!114535 (bvsge (size!5827 thiss!1504) (_size!1731 thiss!1504)))))

(assert (= (and d!58795 res!114537) b!233444))

(assert (= (and b!233444 res!114534) b!233445))

(assert (= (and b!233445 res!114535) b!233446))

(assert (= (and b!233446 res!114536) b!233447))

(declare-fun m!254407 () Bool)

(assert (=> b!233446 m!254407))

(assert (=> d!58795 m!254121))

(assert (=> b!233445 m!254407))

(assert (=> d!58741 d!58795))

(assert (=> bm!21690 d!58781))

(assert (=> d!58739 d!58735))

(declare-fun bm!21699 () Bool)

(declare-fun call!21702 () (_ BitVec 32))

(assert (=> bm!21699 (= call!21702 (arrayCountValidKeys!0 (_keys!6396 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5822 (_keys!6396 thiss!1504))))))

(declare-fun b!233456 () Bool)

(declare-fun e!151637 () (_ BitVec 32))

(declare-fun e!151638 () (_ BitVec 32))

(assert (=> b!233456 (= e!151637 e!151638)))

(declare-fun c!38842 () Bool)

(assert (=> b!233456 (= c!38842 (validKeyInArray!0 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233457 () Bool)

(assert (=> b!233457 (= e!151637 #b00000000000000000000000000000000)))

(declare-fun d!58797 () Bool)

(declare-fun lt!117993 () (_ BitVec 32))

(assert (=> d!58797 (and (bvsge lt!117993 #b00000000000000000000000000000000) (bvsle lt!117993 (bvsub (size!5822 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58797 (= lt!117993 e!151637)))

(declare-fun c!38843 () Bool)

(assert (=> d!58797 (= c!38843 (bvsge #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(assert (=> d!58797 (and (bvsle #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5822 (_keys!6396 thiss!1504)) (size!5822 (_keys!6396 thiss!1504))))))

(assert (=> d!58797 (= (arrayCountValidKeys!0 (_keys!6396 thiss!1504) #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))) lt!117993)))

(declare-fun b!233458 () Bool)

(assert (=> b!233458 (= e!151638 (bvadd #b00000000000000000000000000000001 call!21702))))

(declare-fun b!233459 () Bool)

(assert (=> b!233459 (= e!151638 call!21702)))

(assert (= (and d!58797 c!38843) b!233457))

(assert (= (and d!58797 (not c!38843)) b!233456))

(assert (= (and b!233456 c!38842) b!233458))

(assert (= (and b!233456 (not c!38842)) b!233459))

(assert (= (or b!233458 b!233459) bm!21699))

(declare-fun m!254409 () Bool)

(assert (=> bm!21699 m!254409))

(assert (=> b!233456 m!254167))

(assert (=> b!233456 m!254167))

(assert (=> b!233456 m!254175))

(assert (=> b!233306 d!58797))

(declare-fun d!58799 () Bool)

(assert (=> d!58799 (= (apply!204 lt!117891 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2808 (getValueByKey!260 (toList!1760 lt!117891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8634 () Bool)

(assert (= bs!8634 d!58799))

(declare-fun m!254411 () Bool)

(assert (=> bs!8634 m!254411))

(assert (=> bs!8634 m!254411))

(declare-fun m!254413 () Bool)

(assert (=> bs!8634 m!254413))

(assert (=> b!233282 d!58799))

(assert (=> b!233234 d!58789))

(assert (=> b!233234 d!58791))

(declare-fun d!58801 () Bool)

(assert (=> d!58801 (= (apply!204 lt!117891 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)) (get!2808 (getValueByKey!260 (toList!1760 lt!117891) (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8635 () Bool)

(assert (= bs!8635 d!58801))

(assert (=> bs!8635 m!254167))

(declare-fun m!254415 () Bool)

(assert (=> bs!8635 m!254415))

(assert (=> bs!8635 m!254415))

(declare-fun m!254417 () Bool)

(assert (=> bs!8635 m!254417))

(assert (=> b!233292 d!58801))

(declare-fun d!58803 () Bool)

(declare-fun c!38846 () Bool)

(assert (=> d!58803 (= c!38846 ((_ is ValueCellFull!2732) (select (arr!5487 (_values!4325 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!151641 () V!7849)

(assert (=> d!58803 (= (get!2807 (select (arr!5487 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!538 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!151641)))

(declare-fun b!233464 () Bool)

(declare-fun get!2809 (ValueCell!2732 V!7849) V!7849)

(assert (=> b!233464 (= e!151641 (get!2809 (select (arr!5487 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!538 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!233465 () Bool)

(declare-fun get!2810 (ValueCell!2732 V!7849) V!7849)

(assert (=> b!233465 (= e!151641 (get!2810 (select (arr!5487 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!538 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58803 c!38846) b!233464))

(assert (= (and d!58803 (not c!38846)) b!233465))

(assert (=> b!233464 m!254213))

(assert (=> b!233464 m!254217))

(declare-fun m!254419 () Bool)

(assert (=> b!233464 m!254419))

(assert (=> b!233465 m!254213))

(assert (=> b!233465 m!254217))

(declare-fun m!254421 () Bool)

(assert (=> b!233465 m!254421))

(assert (=> b!233292 d!58803))

(declare-fun b!233474 () Bool)

(declare-fun e!151650 () Bool)

(declare-fun call!21705 () Bool)

(assert (=> b!233474 (= e!151650 call!21705)))

(declare-fun b!233475 () Bool)

(declare-fun e!151648 () Bool)

(assert (=> b!233475 (= e!151648 e!151650)))

(declare-fun c!38849 () Bool)

(assert (=> b!233475 (= c!38849 (validKeyInArray!0 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233476 () Bool)

(declare-fun e!151649 () Bool)

(assert (=> b!233476 (= e!151649 call!21705)))

(declare-fun d!58805 () Bool)

(declare-fun res!114543 () Bool)

(assert (=> d!58805 (=> res!114543 e!151648)))

(assert (=> d!58805 (= res!114543 (bvsge #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(assert (=> d!58805 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6396 thiss!1504) (mask!10267 thiss!1504)) e!151648)))

(declare-fun bm!21702 () Bool)

(assert (=> bm!21702 (= call!21705 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6396 thiss!1504) (mask!10267 thiss!1504)))))

(declare-fun b!233477 () Bool)

(assert (=> b!233477 (= e!151650 e!151649)))

(declare-fun lt!118000 () (_ BitVec 64))

(assert (=> b!233477 (= lt!118000 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118002 () Unit!7210)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11541 (_ BitVec 64) (_ BitVec 32)) Unit!7210)

(assert (=> b!233477 (= lt!118002 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6396 thiss!1504) lt!118000 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233477 (arrayContainsKey!0 (_keys!6396 thiss!1504) lt!118000 #b00000000000000000000000000000000)))

(declare-fun lt!118001 () Unit!7210)

(assert (=> b!233477 (= lt!118001 lt!118002)))

(declare-fun res!114542 () Bool)

(assert (=> b!233477 (= res!114542 (= (seekEntryOrOpen!0 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000) (_keys!6396 thiss!1504) (mask!10267 thiss!1504)) (Found!981 #b00000000000000000000000000000000)))))

(assert (=> b!233477 (=> (not res!114542) (not e!151649))))

(assert (= (and d!58805 (not res!114543)) b!233475))

(assert (= (and b!233475 c!38849) b!233477))

(assert (= (and b!233475 (not c!38849)) b!233474))

(assert (= (and b!233477 res!114542) b!233476))

(assert (= (or b!233476 b!233474) bm!21702))

(assert (=> b!233475 m!254167))

(assert (=> b!233475 m!254167))

(assert (=> b!233475 m!254175))

(declare-fun m!254423 () Bool)

(assert (=> bm!21702 m!254423))

(assert (=> b!233477 m!254167))

(declare-fun m!254425 () Bool)

(assert (=> b!233477 m!254425))

(declare-fun m!254427 () Bool)

(assert (=> b!233477 m!254427))

(assert (=> b!233477 m!254167))

(declare-fun m!254429 () Bool)

(assert (=> b!233477 m!254429))

(assert (=> b!233307 d!58805))

(declare-fun b!233496 () Bool)

(declare-fun e!151665 () SeekEntryResult!981)

(declare-fun e!151663 () SeekEntryResult!981)

(assert (=> b!233496 (= e!151665 e!151663)))

(declare-fun c!38856 () Bool)

(declare-fun lt!118007 () (_ BitVec 64))

(assert (=> b!233496 (= c!38856 (or (= lt!118007 key!932) (= (bvadd lt!118007 lt!118007) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!58807 () Bool)

(declare-fun e!151664 () Bool)

(assert (=> d!58807 e!151664))

(declare-fun c!38858 () Bool)

(declare-fun lt!118008 () SeekEntryResult!981)

(assert (=> d!58807 (= c!38858 (and ((_ is Intermediate!981) lt!118008) (undefined!1793 lt!118008)))))

(assert (=> d!58807 (= lt!118008 e!151665)))

(declare-fun c!38857 () Bool)

(assert (=> d!58807 (= c!38857 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!58807 (= lt!118007 (select (arr!5488 (_keys!6396 thiss!1504)) (toIndex!0 key!932 (mask!10267 thiss!1504))))))

(assert (=> d!58807 (validMask!0 (mask!10267 thiss!1504))))

(assert (=> d!58807 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10267 thiss!1504)) key!932 (_keys!6396 thiss!1504) (mask!10267 thiss!1504)) lt!118008)))

(declare-fun b!233497 () Bool)

(declare-fun e!151662 () Bool)

(assert (=> b!233497 (= e!151664 e!151662)))

(declare-fun res!114552 () Bool)

(assert (=> b!233497 (= res!114552 (and ((_ is Intermediate!981) lt!118008) (not (undefined!1793 lt!118008)) (bvslt (x!23626 lt!118008) #b01111111111111111111111111111110) (bvsge (x!23626 lt!118008) #b00000000000000000000000000000000) (bvsge (x!23626 lt!118008) #b00000000000000000000000000000000)))))

(assert (=> b!233497 (=> (not res!114552) (not e!151662))))

(declare-fun b!233498 () Bool)

(assert (=> b!233498 (and (bvsge (index!6096 lt!118008) #b00000000000000000000000000000000) (bvslt (index!6096 lt!118008) (size!5822 (_keys!6396 thiss!1504))))))

(declare-fun e!151661 () Bool)

(assert (=> b!233498 (= e!151661 (= (select (arr!5488 (_keys!6396 thiss!1504)) (index!6096 lt!118008)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233499 () Bool)

(assert (=> b!233499 (and (bvsge (index!6096 lt!118008) #b00000000000000000000000000000000) (bvslt (index!6096 lt!118008) (size!5822 (_keys!6396 thiss!1504))))))

(declare-fun res!114550 () Bool)

(assert (=> b!233499 (= res!114550 (= (select (arr!5488 (_keys!6396 thiss!1504)) (index!6096 lt!118008)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233499 (=> res!114550 e!151661)))

(declare-fun b!233500 () Bool)

(assert (=> b!233500 (= e!151663 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10267 thiss!1504)) #b00000000000000000000000000000000 (mask!10267 thiss!1504)) key!932 (_keys!6396 thiss!1504) (mask!10267 thiss!1504)))))

(declare-fun b!233501 () Bool)

(assert (=> b!233501 (= e!151665 (Intermediate!981 true (toIndex!0 key!932 (mask!10267 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!233502 () Bool)

(assert (=> b!233502 (= e!151664 (bvsge (x!23626 lt!118008) #b01111111111111111111111111111110))))

(declare-fun b!233503 () Bool)

(assert (=> b!233503 (and (bvsge (index!6096 lt!118008) #b00000000000000000000000000000000) (bvslt (index!6096 lt!118008) (size!5822 (_keys!6396 thiss!1504))))))

(declare-fun res!114551 () Bool)

(assert (=> b!233503 (= res!114551 (= (select (arr!5488 (_keys!6396 thiss!1504)) (index!6096 lt!118008)) key!932))))

(assert (=> b!233503 (=> res!114551 e!151661)))

(assert (=> b!233503 (= e!151662 e!151661)))

(declare-fun b!233504 () Bool)

(assert (=> b!233504 (= e!151663 (Intermediate!981 false (toIndex!0 key!932 (mask!10267 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!58807 c!38857) b!233501))

(assert (= (and d!58807 (not c!38857)) b!233496))

(assert (= (and b!233496 c!38856) b!233504))

(assert (= (and b!233496 (not c!38856)) b!233500))

(assert (= (and d!58807 c!38858) b!233502))

(assert (= (and d!58807 (not c!38858)) b!233497))

(assert (= (and b!233497 res!114552) b!233503))

(assert (= (and b!233503 (not res!114551)) b!233499))

(assert (= (and b!233499 (not res!114550)) b!233498))

(declare-fun m!254431 () Bool)

(assert (=> b!233498 m!254431))

(assert (=> d!58807 m!254233))

(declare-fun m!254433 () Bool)

(assert (=> d!58807 m!254433))

(assert (=> d!58807 m!254121))

(assert (=> b!233500 m!254233))

(declare-fun m!254435 () Bool)

(assert (=> b!233500 m!254435))

(assert (=> b!233500 m!254435))

(declare-fun m!254437 () Bool)

(assert (=> b!233500 m!254437))

(assert (=> b!233499 m!254431))

(assert (=> b!233503 m!254431))

(assert (=> d!58743 d!58807))

(declare-fun d!58809 () Bool)

(declare-fun lt!118014 () (_ BitVec 32))

(declare-fun lt!118013 () (_ BitVec 32))

(assert (=> d!58809 (= lt!118014 (bvmul (bvxor lt!118013 (bvlshr lt!118013 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58809 (= lt!118013 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58809 (and (bvsge (mask!10267 thiss!1504) #b00000000000000000000000000000000) (let ((res!114553 (let ((h!4161 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23644 (bvmul (bvxor h!4161 (bvlshr h!4161 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23644 (bvlshr x!23644 #b00000000000000000000000000001101)) (mask!10267 thiss!1504)))))) (and (bvslt res!114553 (bvadd (mask!10267 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!114553 #b00000000000000000000000000000000))))))

(assert (=> d!58809 (= (toIndex!0 key!932 (mask!10267 thiss!1504)) (bvand (bvxor lt!118014 (bvlshr lt!118014 #b00000000000000000000000000001101)) (mask!10267 thiss!1504)))))

(assert (=> d!58743 d!58809))

(assert (=> d!58743 d!58735))

(declare-fun b!233515 () Bool)

(declare-fun e!151675 () Bool)

(declare-fun e!151674 () Bool)

(assert (=> b!233515 (= e!151675 e!151674)))

(declare-fun res!114560 () Bool)

(assert (=> b!233515 (=> (not res!114560) (not e!151674))))

(declare-fun e!151676 () Bool)

(assert (=> b!233515 (= res!114560 (not e!151676))))

(declare-fun res!114561 () Bool)

(assert (=> b!233515 (=> (not res!114561) (not e!151676))))

(assert (=> b!233515 (= res!114561 (validKeyInArray!0 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58811 () Bool)

(declare-fun res!114562 () Bool)

(assert (=> d!58811 (=> res!114562 e!151675)))

(assert (=> d!58811 (= res!114562 (bvsge #b00000000000000000000000000000000 (size!5822 (_keys!6396 thiss!1504))))))

(assert (=> d!58811 (= (arrayNoDuplicates!0 (_keys!6396 thiss!1504) #b00000000000000000000000000000000 Nil!3513) e!151675)))

(declare-fun b!233516 () Bool)

(declare-fun e!151677 () Bool)

(declare-fun call!21708 () Bool)

(assert (=> b!233516 (= e!151677 call!21708)))

(declare-fun bm!21705 () Bool)

(declare-fun c!38861 () Bool)

(assert (=> bm!21705 (= call!21708 (arrayNoDuplicates!0 (_keys!6396 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!38861 (Cons!3512 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000) Nil!3513) Nil!3513)))))

(declare-fun b!233517 () Bool)

(declare-fun contains!1633 (List!3516 (_ BitVec 64)) Bool)

(assert (=> b!233517 (= e!151676 (contains!1633 Nil!3513 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233518 () Bool)

(assert (=> b!233518 (= e!151677 call!21708)))

(declare-fun b!233519 () Bool)

(assert (=> b!233519 (= e!151674 e!151677)))

(assert (=> b!233519 (= c!38861 (validKeyInArray!0 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58811 (not res!114562)) b!233515))

(assert (= (and b!233515 res!114561) b!233517))

(assert (= (and b!233515 res!114560) b!233519))

(assert (= (and b!233519 c!38861) b!233518))

(assert (= (and b!233519 (not c!38861)) b!233516))

(assert (= (or b!233518 b!233516) bm!21705))

(assert (=> b!233515 m!254167))

(assert (=> b!233515 m!254167))

(assert (=> b!233515 m!254175))

(assert (=> bm!21705 m!254167))

(declare-fun m!254439 () Bool)

(assert (=> bm!21705 m!254439))

(assert (=> b!233517 m!254167))

(assert (=> b!233517 m!254167))

(declare-fun m!254441 () Bool)

(assert (=> b!233517 m!254441))

(assert (=> b!233519 m!254167))

(assert (=> b!233519 m!254167))

(assert (=> b!233519 m!254175))

(assert (=> b!233308 d!58811))

(declare-fun d!58813 () Bool)

(declare-fun e!151679 () Bool)

(assert (=> d!58813 e!151679))

(declare-fun res!114563 () Bool)

(assert (=> d!58813 (=> res!114563 e!151679)))

(declare-fun lt!118015 () Bool)

(assert (=> d!58813 (= res!114563 (not lt!118015))))

(declare-fun lt!118016 () Bool)

(assert (=> d!58813 (= lt!118015 lt!118016)))

(declare-fun lt!118017 () Unit!7210)

(declare-fun e!151678 () Unit!7210)

(assert (=> d!58813 (= lt!118017 e!151678)))

(declare-fun c!38862 () Bool)

(assert (=> d!58813 (= c!38862 lt!118016)))

(assert (=> d!58813 (= lt!118016 (containsKey!252 (toList!1760 lt!117891) (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58813 (= (contains!1631 lt!117891 (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)) lt!118015)))

(declare-fun b!233520 () Bool)

(declare-fun lt!118018 () Unit!7210)

(assert (=> b!233520 (= e!151678 lt!118018)))

(assert (=> b!233520 (= lt!118018 (lemmaContainsKeyImpliesGetValueByKeyDefined!201 (toList!1760 lt!117891) (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233520 (isDefined!202 (getValueByKey!260 (toList!1760 lt!117891) (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233521 () Bool)

(declare-fun Unit!7215 () Unit!7210)

(assert (=> b!233521 (= e!151678 Unit!7215)))

(declare-fun b!233522 () Bool)

(assert (=> b!233522 (= e!151679 (isDefined!202 (getValueByKey!260 (toList!1760 lt!117891) (select (arr!5488 (_keys!6396 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!58813 c!38862) b!233520))

(assert (= (and d!58813 (not c!38862)) b!233521))

(assert (= (and d!58813 (not res!114563)) b!233522))

(assert (=> d!58813 m!254167))

(declare-fun m!254443 () Bool)

(assert (=> d!58813 m!254443))

(assert (=> b!233520 m!254167))

(declare-fun m!254445 () Bool)

(assert (=> b!233520 m!254445))

(assert (=> b!233520 m!254167))

(assert (=> b!233520 m!254415))

(assert (=> b!233520 m!254415))

(declare-fun m!254447 () Bool)

(assert (=> b!233520 m!254447))

(assert (=> b!233522 m!254167))

(assert (=> b!233522 m!254415))

(assert (=> b!233522 m!254415))

(assert (=> b!233522 m!254447))

(assert (=> b!233294 d!58813))

(declare-fun d!58815 () Bool)

(declare-fun e!151681 () Bool)

(assert (=> d!58815 e!151681))

(declare-fun res!114564 () Bool)

(assert (=> d!58815 (=> res!114564 e!151681)))

(declare-fun lt!118019 () Bool)

(assert (=> d!58815 (= res!114564 (not lt!118019))))

(declare-fun lt!118020 () Bool)

(assert (=> d!58815 (= lt!118019 lt!118020)))

(declare-fun lt!118021 () Unit!7210)

(declare-fun e!151680 () Unit!7210)

(assert (=> d!58815 (= lt!118021 e!151680)))

(declare-fun c!38863 () Bool)

(assert (=> d!58815 (= c!38863 lt!118020)))

(assert (=> d!58815 (= lt!118020 (containsKey!252 (toList!1760 lt!117891) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58815 (= (contains!1631 lt!117891 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118019)))

(declare-fun b!233523 () Bool)

(declare-fun lt!118022 () Unit!7210)

(assert (=> b!233523 (= e!151680 lt!118022)))

(assert (=> b!233523 (= lt!118022 (lemmaContainsKeyImpliesGetValueByKeyDefined!201 (toList!1760 lt!117891) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233523 (isDefined!202 (getValueByKey!260 (toList!1760 lt!117891) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233524 () Bool)

(declare-fun Unit!7216 () Unit!7210)

(assert (=> b!233524 (= e!151680 Unit!7216)))

(declare-fun b!233525 () Bool)

(assert (=> b!233525 (= e!151681 (isDefined!202 (getValueByKey!260 (toList!1760 lt!117891) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58815 c!38863) b!233523))

(assert (= (and d!58815 (not c!38863)) b!233524))

(assert (= (and d!58815 (not res!114564)) b!233525))

(declare-fun m!254449 () Bool)

(assert (=> d!58815 m!254449))

(declare-fun m!254451 () Bool)

(assert (=> b!233523 m!254451))

(assert (=> b!233523 m!254245))

(assert (=> b!233523 m!254245))

(declare-fun m!254453 () Bool)

(assert (=> b!233523 m!254453))

(assert (=> b!233525 m!254245))

(assert (=> b!233525 m!254245))

(assert (=> b!233525 m!254453))

(assert (=> bm!21688 d!58815))

(declare-fun d!58817 () Bool)

(declare-fun e!151683 () Bool)

(assert (=> d!58817 e!151683))

(declare-fun res!114565 () Bool)

(assert (=> d!58817 (=> res!114565 e!151683)))

(declare-fun lt!118023 () Bool)

(assert (=> d!58817 (= res!114565 (not lt!118023))))

(declare-fun lt!118024 () Bool)

(assert (=> d!58817 (= lt!118023 lt!118024)))

(declare-fun lt!118025 () Unit!7210)

(declare-fun e!151682 () Unit!7210)

(assert (=> d!58817 (= lt!118025 e!151682)))

(declare-fun c!38864 () Bool)

(assert (=> d!58817 (= c!38864 lt!118024)))

(assert (=> d!58817 (= lt!118024 (containsKey!252 (toList!1760 lt!117891) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58817 (= (contains!1631 lt!117891 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118023)))

(declare-fun b!233526 () Bool)

(declare-fun lt!118026 () Unit!7210)

(assert (=> b!233526 (= e!151682 lt!118026)))

(assert (=> b!233526 (= lt!118026 (lemmaContainsKeyImpliesGetValueByKeyDefined!201 (toList!1760 lt!117891) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233526 (isDefined!202 (getValueByKey!260 (toList!1760 lt!117891) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233527 () Bool)

(declare-fun Unit!7217 () Unit!7210)

(assert (=> b!233527 (= e!151682 Unit!7217)))

(declare-fun b!233528 () Bool)

(assert (=> b!233528 (= e!151683 (isDefined!202 (getValueByKey!260 (toList!1760 lt!117891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58817 c!38864) b!233526))

(assert (= (and d!58817 (not c!38864)) b!233527))

(assert (= (and d!58817 (not res!114565)) b!233528))

(declare-fun m!254455 () Bool)

(assert (=> d!58817 m!254455))

(declare-fun m!254457 () Bool)

(assert (=> b!233526 m!254457))

(assert (=> b!233526 m!254411))

(assert (=> b!233526 m!254411))

(declare-fun m!254459 () Bool)

(assert (=> b!233526 m!254459))

(assert (=> b!233528 m!254411))

(assert (=> b!233528 m!254411))

(assert (=> b!233528 m!254459))

(assert (=> bm!21692 d!58817))

(declare-fun b!233529 () Bool)

(declare-fun e!151685 () Bool)

(assert (=> b!233529 (= e!151685 tp_is_empty!6151)))

(declare-fun mapIsEmpty!10409 () Bool)

(declare-fun mapRes!10409 () Bool)

(assert (=> mapIsEmpty!10409 mapRes!10409))

(declare-fun condMapEmpty!10409 () Bool)

(declare-fun mapDefault!10409 () ValueCell!2732)

(assert (=> mapNonEmpty!10408 (= condMapEmpty!10409 (= mapRest!10408 ((as const (Array (_ BitVec 32) ValueCell!2732)) mapDefault!10409)))))

(declare-fun e!151684 () Bool)

(assert (=> mapNonEmpty!10408 (= tp!22027 (and e!151684 mapRes!10409))))

(declare-fun b!233530 () Bool)

(assert (=> b!233530 (= e!151684 tp_is_empty!6151)))

(declare-fun mapNonEmpty!10409 () Bool)

(declare-fun tp!22028 () Bool)

(assert (=> mapNonEmpty!10409 (= mapRes!10409 (and tp!22028 e!151685))))

(declare-fun mapKey!10409 () (_ BitVec 32))

(declare-fun mapRest!10409 () (Array (_ BitVec 32) ValueCell!2732))

(declare-fun mapValue!10409 () ValueCell!2732)

(assert (=> mapNonEmpty!10409 (= mapRest!10408 (store mapRest!10409 mapKey!10409 mapValue!10409))))

(assert (= (and mapNonEmpty!10408 condMapEmpty!10409) mapIsEmpty!10409))

(assert (= (and mapNonEmpty!10408 (not condMapEmpty!10409)) mapNonEmpty!10409))

(assert (= (and mapNonEmpty!10409 ((_ is ValueCellFull!2732) mapValue!10409)) b!233529))

(assert (= (and mapNonEmpty!10408 ((_ is ValueCellFull!2732) mapDefault!10409)) b!233530))

(declare-fun m!254461 () Bool)

(assert (=> mapNonEmpty!10409 m!254461))

(declare-fun b_lambda!7837 () Bool)

(assert (= b_lambda!7835 (or (and b!233163 b_free!6289) b_lambda!7837)))

(declare-fun b_lambda!7839 () Bool)

(assert (= b_lambda!7833 (or (and b!233163 b_free!6289) b_lambda!7839)))

(check-sat (not mapNonEmpty!10409) (not b!233464) (not b!233366) (not b_next!6289) (not b!233526) (not b!233398) (not b!233347) (not bm!21705) (not d!58769) (not b!233405) (not d!58785) (not d!58757) (not d!58787) (not d!58767) (not b!233517) (not b!233348) (not d!58773) (not b!233353) (not b!233394) (not b!233399) (not d!58761) (not d!58753) (not b!233363) (not d!58749) (not d!58745) (not d!58783) (not d!58755) (not b!233339) (not b_lambda!7831) (not d!58775) (not b!233358) (not b!233365) (not d!58781) (not b!233523) (not b!233401) (not b!233465) (not b!233445) (not b_lambda!7837) (not b!233430) (not b!233346) (not b!233340) (not b!233446) (not bm!21699) tp_is_empty!6151 (not b!233364) (not d!58759) (not d!58807) (not d!58789) (not b!233393) (not d!58801) (not bm!21696) (not b!233416) (not b!233519) (not b!233475) (not d!58795) (not d!58793) (not b!233477) b_and!13173 (not b!233396) (not b!233355) (not b_lambda!7839) (not d!58817) (not b!233359) (not b!233361) (not d!58765) (not d!58799) (not b!233515) (not d!58815) (not b!233362) (not b!233522) (not d!58777) (not d!58779) (not b!233528) (not b!233500) (not b!233525) (not b!233520) (not bm!21702) (not b!233392) (not d!58763) (not b!233402) (not b!233456) (not d!58771) (not d!58813))
(check-sat b_and!13173 (not b_next!6289))
