; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22240 () Bool)

(assert start!22240)

(declare-fun b!233361 () Bool)

(declare-fun b_free!6289 () Bool)

(declare-fun b_next!6289 () Bool)

(assert (=> b!233361 (= b_free!6289 (not b_next!6289))))

(declare-fun tp!22011 () Bool)

(declare-fun b_and!13203 () Bool)

(assert (=> b!233361 (= tp!22011 b_and!13203)))

(declare-fun b!233358 () Bool)

(declare-fun e!151589 () Bool)

(declare-datatypes ((V!7849 0))(
  ( (V!7850 (val!3120 Int)) )
))
(declare-datatypes ((ValueCell!2732 0))(
  ( (ValueCellFull!2732 (v!5142 V!7849)) (EmptyCell!2732) )
))
(declare-datatypes ((array!11545 0))(
  ( (array!11546 (arr!5491 (Array (_ BitVec 32) ValueCell!2732)) (size!5824 (_ BitVec 32))) )
))
(declare-datatypes ((array!11547 0))(
  ( (array!11548 (arr!5492 (Array (_ BitVec 32) (_ BitVec 64))) (size!5825 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3364 0))(
  ( (LongMapFixedSize!3365 (defaultEntry!4342 Int) (mask!10268 (_ BitVec 32)) (extraKeys!4079 (_ BitVec 32)) (zeroValue!4183 V!7849) (minValue!4183 V!7849) (_size!1731 (_ BitVec 32)) (_keys!6397 array!11547) (_values!4325 array!11545) (_vacant!1731 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3364)

(assert (=> b!233358 (= e!151589 (not (= (size!5824 (_values!4325 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10268 thiss!1504)))))))

(declare-fun b!233359 () Bool)

(declare-fun e!151587 () Bool)

(declare-fun tp_is_empty!6151 () Bool)

(assert (=> b!233359 (= e!151587 tp_is_empty!6151)))

(declare-fun b!233360 () Bool)

(declare-fun e!151585 () Bool)

(declare-fun mapRes!10399 () Bool)

(assert (=> b!233360 (= e!151585 (and e!151587 mapRes!10399))))

(declare-fun condMapEmpty!10399 () Bool)

(declare-fun mapDefault!10399 () ValueCell!2732)

(assert (=> b!233360 (= condMapEmpty!10399 (= (arr!5491 (_values!4325 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2732)) mapDefault!10399)))))

(declare-fun mapNonEmpty!10399 () Bool)

(declare-fun tp!22012 () Bool)

(declare-fun e!151583 () Bool)

(assert (=> mapNonEmpty!10399 (= mapRes!10399 (and tp!22012 e!151583))))

(declare-fun mapRest!10399 () (Array (_ BitVec 32) ValueCell!2732))

(declare-fun mapKey!10399 () (_ BitVec 32))

(declare-fun mapValue!10399 () ValueCell!2732)

(assert (=> mapNonEmpty!10399 (= (arr!5491 (_values!4325 thiss!1504)) (store mapRest!10399 mapKey!10399 mapValue!10399))))

(declare-fun e!151584 () Bool)

(declare-fun array_inv!3599 (array!11547) Bool)

(declare-fun array_inv!3600 (array!11545) Bool)

(assert (=> b!233361 (= e!151584 (and tp!22011 tp_is_empty!6151 (array_inv!3599 (_keys!6397 thiss!1504)) (array_inv!3600 (_values!4325 thiss!1504)) e!151585))))

(declare-fun b!233362 () Bool)

(assert (=> b!233362 (= e!151583 tp_is_empty!6151)))

(declare-fun b!233357 () Bool)

(declare-fun res!114528 () Bool)

(assert (=> b!233357 (=> (not res!114528) (not e!151589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!233357 (= res!114528 (validMask!0 (mask!10268 thiss!1504)))))

(declare-fun res!114527 () Bool)

(declare-fun e!151586 () Bool)

(assert (=> start!22240 (=> (not res!114527) (not e!151586))))

(declare-fun valid!1344 (LongMapFixedSize!3364) Bool)

(assert (=> start!22240 (= res!114527 (valid!1344 thiss!1504))))

(assert (=> start!22240 e!151586))

(assert (=> start!22240 e!151584))

(assert (=> start!22240 true))

(declare-fun b!233363 () Bool)

(assert (=> b!233363 (= e!151586 e!151589)))

(declare-fun res!114526 () Bool)

(assert (=> b!233363 (=> (not res!114526) (not e!151589))))

(declare-datatypes ((SeekEntryResult!945 0))(
  ( (MissingZero!945 (index!5950 (_ BitVec 32))) (Found!945 (index!5951 (_ BitVec 32))) (Intermediate!945 (undefined!1757 Bool) (index!5952 (_ BitVec 32)) (x!23591 (_ BitVec 32))) (Undefined!945) (MissingVacant!945 (index!5953 (_ BitVec 32))) )
))
(declare-fun lt!118063 () SeekEntryResult!945)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233363 (= res!114526 (or (= lt!118063 (MissingZero!945 index!297)) (= lt!118063 (MissingVacant!945 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11547 (_ BitVec 32)) SeekEntryResult!945)

(assert (=> b!233363 (= lt!118063 (seekEntryOrOpen!0 key!932 (_keys!6397 thiss!1504) (mask!10268 thiss!1504)))))

(declare-fun b!233364 () Bool)

(declare-fun res!114525 () Bool)

(assert (=> b!233364 (=> (not res!114525) (not e!151586))))

(assert (=> b!233364 (= res!114525 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233365 () Bool)

(declare-fun res!114529 () Bool)

(assert (=> b!233365 (=> (not res!114529) (not e!151589))))

(declare-datatypes ((tuple2!4534 0))(
  ( (tuple2!4535 (_1!2278 (_ BitVec 64)) (_2!2278 V!7849)) )
))
(declare-datatypes ((List!3439 0))(
  ( (Nil!3436) (Cons!3435 (h!4083 tuple2!4534) (t!8392 List!3439)) )
))
(declare-datatypes ((ListLongMap!3449 0))(
  ( (ListLongMap!3450 (toList!1740 List!3439)) )
))
(declare-fun contains!1622 (ListLongMap!3449 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1272 (array!11547 array!11545 (_ BitVec 32) (_ BitVec 32) V!7849 V!7849 (_ BitVec 32) Int) ListLongMap!3449)

(assert (=> b!233365 (= res!114529 (contains!1622 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10399 () Bool)

(assert (=> mapIsEmpty!10399 mapRes!10399))

(assert (= (and start!22240 res!114527) b!233364))

(assert (= (and b!233364 res!114525) b!233363))

(assert (= (and b!233363 res!114526) b!233365))

(assert (= (and b!233365 res!114529) b!233357))

(assert (= (and b!233357 res!114528) b!233358))

(assert (= (and b!233360 condMapEmpty!10399) mapIsEmpty!10399))

(assert (= (and b!233360 (not condMapEmpty!10399)) mapNonEmpty!10399))

(get-info :version)

(assert (= (and mapNonEmpty!10399 ((_ is ValueCellFull!2732) mapValue!10399)) b!233362))

(assert (= (and b!233360 ((_ is ValueCellFull!2732) mapDefault!10399)) b!233359))

(assert (= b!233361 b!233360))

(assert (= start!22240 b!233361))

(declare-fun m!254905 () Bool)

(assert (=> b!233365 m!254905))

(assert (=> b!233365 m!254905))

(declare-fun m!254907 () Bool)

(assert (=> b!233365 m!254907))

(declare-fun m!254909 () Bool)

(assert (=> b!233363 m!254909))

(declare-fun m!254911 () Bool)

(assert (=> b!233361 m!254911))

(declare-fun m!254913 () Bool)

(assert (=> b!233361 m!254913))

(declare-fun m!254915 () Bool)

(assert (=> mapNonEmpty!10399 m!254915))

(declare-fun m!254917 () Bool)

(assert (=> b!233357 m!254917))

(declare-fun m!254919 () Bool)

(assert (=> start!22240 m!254919))

(check-sat tp_is_empty!6151 (not b_next!6289) (not mapNonEmpty!10399) (not b!233361) (not b!233365) (not b!233363) (not b!233357) b_and!13203 (not start!22240))
(check-sat b_and!13203 (not b_next!6289))
(get-model)

(declare-fun d!58953 () Bool)

(declare-fun res!114566 () Bool)

(declare-fun e!151634 () Bool)

(assert (=> d!58953 (=> (not res!114566) (not e!151634))))

(declare-fun simpleValid!227 (LongMapFixedSize!3364) Bool)

(assert (=> d!58953 (= res!114566 (simpleValid!227 thiss!1504))))

(assert (=> d!58953 (= (valid!1344 thiss!1504) e!151634)))

(declare-fun b!233426 () Bool)

(declare-fun res!114567 () Bool)

(assert (=> b!233426 (=> (not res!114567) (not e!151634))))

(declare-fun arrayCountValidKeys!0 (array!11547 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233426 (= res!114567 (= (arrayCountValidKeys!0 (_keys!6397 thiss!1504) #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))) (_size!1731 thiss!1504)))))

(declare-fun b!233427 () Bool)

(declare-fun res!114568 () Bool)

(assert (=> b!233427 (=> (not res!114568) (not e!151634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11547 (_ BitVec 32)) Bool)

(assert (=> b!233427 (= res!114568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6397 thiss!1504) (mask!10268 thiss!1504)))))

(declare-fun b!233428 () Bool)

(declare-datatypes ((List!3441 0))(
  ( (Nil!3438) (Cons!3437 (h!4085 (_ BitVec 64)) (t!8396 List!3441)) )
))
(declare-fun arrayNoDuplicates!0 (array!11547 (_ BitVec 32) List!3441) Bool)

(assert (=> b!233428 (= e!151634 (arrayNoDuplicates!0 (_keys!6397 thiss!1504) #b00000000000000000000000000000000 Nil!3438))))

(assert (= (and d!58953 res!114566) b!233426))

(assert (= (and b!233426 res!114567) b!233427))

(assert (= (and b!233427 res!114568) b!233428))

(declare-fun m!254953 () Bool)

(assert (=> d!58953 m!254953))

(declare-fun m!254955 () Bool)

(assert (=> b!233426 m!254955))

(declare-fun m!254957 () Bool)

(assert (=> b!233427 m!254957))

(declare-fun m!254959 () Bool)

(assert (=> b!233428 m!254959))

(assert (=> start!22240 d!58953))

(declare-fun d!58955 () Bool)

(declare-fun e!151640 () Bool)

(assert (=> d!58955 e!151640))

(declare-fun res!114571 () Bool)

(assert (=> d!58955 (=> res!114571 e!151640)))

(declare-fun lt!118079 () Bool)

(assert (=> d!58955 (= res!114571 (not lt!118079))))

(declare-fun lt!118078 () Bool)

(assert (=> d!58955 (= lt!118079 lt!118078)))

(declare-datatypes ((Unit!7203 0))(
  ( (Unit!7204) )
))
(declare-fun lt!118081 () Unit!7203)

(declare-fun e!151639 () Unit!7203)

(assert (=> d!58955 (= lt!118081 e!151639)))

(declare-fun c!38821 () Bool)

(assert (=> d!58955 (= c!38821 lt!118078)))

(declare-fun containsKey!254 (List!3439 (_ BitVec 64)) Bool)

(assert (=> d!58955 (= lt!118078 (containsKey!254 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(assert (=> d!58955 (= (contains!1622 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)) key!932) lt!118079)))

(declare-fun b!233435 () Bool)

(declare-fun lt!118080 () Unit!7203)

(assert (=> b!233435 (= e!151639 lt!118080)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!202 (List!3439 (_ BitVec 64)) Unit!7203)

(assert (=> b!233435 (= lt!118080 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(declare-datatypes ((Option!269 0))(
  ( (Some!268 (v!5145 V!7849)) (None!267) )
))
(declare-fun isDefined!203 (Option!269) Bool)

(declare-fun getValueByKey!263 (List!3439 (_ BitVec 64)) Option!269)

(assert (=> b!233435 (isDefined!203 (getValueByKey!263 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(declare-fun b!233436 () Bool)

(declare-fun Unit!7205 () Unit!7203)

(assert (=> b!233436 (= e!151639 Unit!7205)))

(declare-fun b!233437 () Bool)

(assert (=> b!233437 (= e!151640 (isDefined!203 (getValueByKey!263 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932)))))

(assert (= (and d!58955 c!38821) b!233435))

(assert (= (and d!58955 (not c!38821)) b!233436))

(assert (= (and d!58955 (not res!114571)) b!233437))

(declare-fun m!254961 () Bool)

(assert (=> d!58955 m!254961))

(declare-fun m!254963 () Bool)

(assert (=> b!233435 m!254963))

(declare-fun m!254965 () Bool)

(assert (=> b!233435 m!254965))

(assert (=> b!233435 m!254965))

(declare-fun m!254967 () Bool)

(assert (=> b!233435 m!254967))

(assert (=> b!233437 m!254965))

(assert (=> b!233437 m!254965))

(assert (=> b!233437 m!254967))

(assert (=> b!233365 d!58955))

(declare-fun b!233480 () Bool)

(declare-fun e!151675 () ListLongMap!3449)

(declare-fun e!151667 () ListLongMap!3449)

(assert (=> b!233480 (= e!151675 e!151667)))

(declare-fun c!38835 () Bool)

(assert (=> b!233480 (= c!38835 (and (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233481 () Bool)

(declare-fun e!151678 () Bool)

(declare-fun call!21705 () Bool)

(assert (=> b!233481 (= e!151678 (not call!21705))))

(declare-fun b!233482 () Bool)

(declare-fun e!151671 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!233482 (= e!151671 (validKeyInArray!0 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233483 () Bool)

(declare-fun call!21708 () ListLongMap!3449)

(assert (=> b!233483 (= e!151667 call!21708)))

(declare-fun b!233484 () Bool)

(declare-fun e!151677 () Bool)

(declare-fun e!151669 () Bool)

(assert (=> b!233484 (= e!151677 e!151669)))

(declare-fun c!38834 () Bool)

(assert (=> b!233484 (= c!38834 (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233485 () Bool)

(declare-fun call!21702 () ListLongMap!3449)

(declare-fun +!631 (ListLongMap!3449 tuple2!4534) ListLongMap!3449)

(assert (=> b!233485 (= e!151675 (+!631 call!21702 (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))

(declare-fun bm!21699 () Bool)

(declare-fun call!21707 () ListLongMap!3449)

(declare-fun call!21706 () ListLongMap!3449)

(assert (=> bm!21699 (= call!21707 call!21706)))

(declare-fun b!233486 () Bool)

(declare-fun e!151673 () Bool)

(assert (=> b!233486 (= e!151673 (validKeyInArray!0 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233487 () Bool)

(declare-fun e!151674 () ListLongMap!3449)

(assert (=> b!233487 (= e!151674 call!21708)))

(declare-fun b!233488 () Bool)

(declare-fun e!151679 () Bool)

(assert (=> b!233488 (= e!151678 e!151679)))

(declare-fun res!114593 () Bool)

(assert (=> b!233488 (= res!114593 call!21705)))

(assert (=> b!233488 (=> (not res!114593) (not e!151679))))

(declare-fun d!58957 () Bool)

(assert (=> d!58957 e!151677))

(declare-fun res!114596 () Bool)

(assert (=> d!58957 (=> (not res!114596) (not e!151677))))

(assert (=> d!58957 (= res!114596 (or (bvsge #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))))

(declare-fun lt!118126 () ListLongMap!3449)

(declare-fun lt!118138 () ListLongMap!3449)

(assert (=> d!58957 (= lt!118126 lt!118138)))

(declare-fun lt!118142 () Unit!7203)

(declare-fun e!151672 () Unit!7203)

(assert (=> d!58957 (= lt!118142 e!151672)))

(declare-fun c!38837 () Bool)

(assert (=> d!58957 (= c!38837 e!151673)))

(declare-fun res!114595 () Bool)

(assert (=> d!58957 (=> (not res!114595) (not e!151673))))

(assert (=> d!58957 (= res!114595 (bvslt #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(assert (=> d!58957 (= lt!118138 e!151675)))

(declare-fun c!38836 () Bool)

(assert (=> d!58957 (= c!38836 (and (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58957 (validMask!0 (mask!10268 thiss!1504))))

(assert (=> d!58957 (= (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)) lt!118126)))

(declare-fun b!233489 () Bool)

(declare-fun res!114594 () Bool)

(assert (=> b!233489 (=> (not res!114594) (not e!151677))))

(assert (=> b!233489 (= res!114594 e!151678)))

(declare-fun c!38838 () Bool)

(assert (=> b!233489 (= c!38838 (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!233490 () Bool)

(declare-fun Unit!7206 () Unit!7203)

(assert (=> b!233490 (= e!151672 Unit!7206)))

(declare-fun b!233491 () Bool)

(declare-fun c!38839 () Bool)

(assert (=> b!233491 (= c!38839 (and (not (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4079 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!233491 (= e!151667 e!151674)))

(declare-fun bm!21700 () Bool)

(assert (=> bm!21700 (= call!21705 (contains!1622 lt!118126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233492 () Bool)

(declare-fun call!21704 () Bool)

(assert (=> b!233492 (= e!151669 (not call!21704))))

(declare-fun b!233493 () Bool)

(declare-fun e!151670 () Bool)

(assert (=> b!233493 (= e!151669 e!151670)))

(declare-fun res!114591 () Bool)

(assert (=> b!233493 (= res!114591 call!21704)))

(assert (=> b!233493 (=> (not res!114591) (not e!151670))))

(declare-fun call!21703 () ListLongMap!3449)

(declare-fun bm!21701 () Bool)

(assert (=> bm!21701 (= call!21702 (+!631 (ite c!38836 call!21706 (ite c!38835 call!21707 call!21703)) (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(declare-fun b!233494 () Bool)

(declare-fun e!151676 () Bool)

(declare-fun e!151668 () Bool)

(assert (=> b!233494 (= e!151676 e!151668)))

(declare-fun res!114590 () Bool)

(assert (=> b!233494 (=> (not res!114590) (not e!151668))))

(assert (=> b!233494 (= res!114590 (contains!1622 lt!118126 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233494 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(declare-fun b!233495 () Bool)

(declare-fun lt!118135 () Unit!7203)

(assert (=> b!233495 (= e!151672 lt!118135)))

(declare-fun lt!118145 () ListLongMap!3449)

(declare-fun getCurrentListMapNoExtraKeys!520 (array!11547 array!11545 (_ BitVec 32) (_ BitVec 32) V!7849 V!7849 (_ BitVec 32) Int) ListLongMap!3449)

(assert (=> b!233495 (= lt!118145 (getCurrentListMapNoExtraKeys!520 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))

(declare-fun lt!118140 () (_ BitVec 64))

(assert (=> b!233495 (= lt!118140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118128 () (_ BitVec 64))

(assert (=> b!233495 (= lt!118128 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118146 () Unit!7203)

(declare-fun addStillContains!180 (ListLongMap!3449 (_ BitVec 64) V!7849 (_ BitVec 64)) Unit!7203)

(assert (=> b!233495 (= lt!118146 (addStillContains!180 lt!118145 lt!118140 (zeroValue!4183 thiss!1504) lt!118128))))

(assert (=> b!233495 (contains!1622 (+!631 lt!118145 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504))) lt!118128)))

(declare-fun lt!118144 () Unit!7203)

(assert (=> b!233495 (= lt!118144 lt!118146)))

(declare-fun lt!118136 () ListLongMap!3449)

(assert (=> b!233495 (= lt!118136 (getCurrentListMapNoExtraKeys!520 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))

(declare-fun lt!118131 () (_ BitVec 64))

(assert (=> b!233495 (= lt!118131 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118147 () (_ BitVec 64))

(assert (=> b!233495 (= lt!118147 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118132 () Unit!7203)

(declare-fun addApplyDifferent!180 (ListLongMap!3449 (_ BitVec 64) V!7849 (_ BitVec 64)) Unit!7203)

(assert (=> b!233495 (= lt!118132 (addApplyDifferent!180 lt!118136 lt!118131 (minValue!4183 thiss!1504) lt!118147))))

(declare-fun apply!204 (ListLongMap!3449 (_ BitVec 64)) V!7849)

(assert (=> b!233495 (= (apply!204 (+!631 lt!118136 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504))) lt!118147) (apply!204 lt!118136 lt!118147))))

(declare-fun lt!118137 () Unit!7203)

(assert (=> b!233495 (= lt!118137 lt!118132)))

(declare-fun lt!118139 () ListLongMap!3449)

(assert (=> b!233495 (= lt!118139 (getCurrentListMapNoExtraKeys!520 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))

(declare-fun lt!118143 () (_ BitVec 64))

(assert (=> b!233495 (= lt!118143 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118141 () (_ BitVec 64))

(assert (=> b!233495 (= lt!118141 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118134 () Unit!7203)

(assert (=> b!233495 (= lt!118134 (addApplyDifferent!180 lt!118139 lt!118143 (zeroValue!4183 thiss!1504) lt!118141))))

(assert (=> b!233495 (= (apply!204 (+!631 lt!118139 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504))) lt!118141) (apply!204 lt!118139 lt!118141))))

(declare-fun lt!118133 () Unit!7203)

(assert (=> b!233495 (= lt!118133 lt!118134)))

(declare-fun lt!118130 () ListLongMap!3449)

(assert (=> b!233495 (= lt!118130 (getCurrentListMapNoExtraKeys!520 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))

(declare-fun lt!118129 () (_ BitVec 64))

(assert (=> b!233495 (= lt!118129 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118127 () (_ BitVec 64))

(assert (=> b!233495 (= lt!118127 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233495 (= lt!118135 (addApplyDifferent!180 lt!118130 lt!118129 (minValue!4183 thiss!1504) lt!118127))))

(assert (=> b!233495 (= (apply!204 (+!631 lt!118130 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504))) lt!118127) (apply!204 lt!118130 lt!118127))))

(declare-fun bm!21702 () Bool)

(assert (=> bm!21702 (= call!21704 (contains!1622 lt!118126 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233496 () Bool)

(declare-fun res!114597 () Bool)

(assert (=> b!233496 (=> (not res!114597) (not e!151677))))

(assert (=> b!233496 (= res!114597 e!151676)))

(declare-fun res!114598 () Bool)

(assert (=> b!233496 (=> res!114598 e!151676)))

(assert (=> b!233496 (= res!114598 (not e!151671))))

(declare-fun res!114592 () Bool)

(assert (=> b!233496 (=> (not res!114592) (not e!151671))))

(assert (=> b!233496 (= res!114592 (bvslt #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(declare-fun bm!21703 () Bool)

(assert (=> bm!21703 (= call!21708 call!21702)))

(declare-fun b!233497 () Bool)

(assert (=> b!233497 (= e!151679 (= (apply!204 lt!118126 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4183 thiss!1504)))))

(declare-fun b!233498 () Bool)

(declare-fun get!2819 (ValueCell!2732 V!7849) V!7849)

(declare-fun dynLambda!547 (Int (_ BitVec 64)) V!7849)

(assert (=> b!233498 (= e!151668 (= (apply!204 lt!118126 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)) (get!2819 (select (arr!5491 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233498 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5824 (_values!4325 thiss!1504))))))

(assert (=> b!233498 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(declare-fun b!233499 () Bool)

(assert (=> b!233499 (= e!151670 (= (apply!204 lt!118126 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4183 thiss!1504)))))

(declare-fun bm!21704 () Bool)

(assert (=> bm!21704 (= call!21706 (getCurrentListMapNoExtraKeys!520 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))

(declare-fun b!233500 () Bool)

(assert (=> b!233500 (= e!151674 call!21703)))

(declare-fun bm!21705 () Bool)

(assert (=> bm!21705 (= call!21703 call!21707)))

(assert (= (and d!58957 c!38836) b!233485))

(assert (= (and d!58957 (not c!38836)) b!233480))

(assert (= (and b!233480 c!38835) b!233483))

(assert (= (and b!233480 (not c!38835)) b!233491))

(assert (= (and b!233491 c!38839) b!233487))

(assert (= (and b!233491 (not c!38839)) b!233500))

(assert (= (or b!233487 b!233500) bm!21705))

(assert (= (or b!233483 bm!21705) bm!21699))

(assert (= (or b!233483 b!233487) bm!21703))

(assert (= (or b!233485 bm!21699) bm!21704))

(assert (= (or b!233485 bm!21703) bm!21701))

(assert (= (and d!58957 res!114595) b!233486))

(assert (= (and d!58957 c!38837) b!233495))

(assert (= (and d!58957 (not c!38837)) b!233490))

(assert (= (and d!58957 res!114596) b!233496))

(assert (= (and b!233496 res!114592) b!233482))

(assert (= (and b!233496 (not res!114598)) b!233494))

(assert (= (and b!233494 res!114590) b!233498))

(assert (= (and b!233496 res!114597) b!233489))

(assert (= (and b!233489 c!38838) b!233488))

(assert (= (and b!233489 (not c!38838)) b!233481))

(assert (= (and b!233488 res!114593) b!233497))

(assert (= (or b!233488 b!233481) bm!21700))

(assert (= (and b!233489 res!114594) b!233484))

(assert (= (and b!233484 c!38834) b!233493))

(assert (= (and b!233484 (not c!38834)) b!233492))

(assert (= (and b!233493 res!114591) b!233499))

(assert (= (or b!233493 b!233492) bm!21702))

(declare-fun b_lambda!7869 () Bool)

(assert (=> (not b_lambda!7869) (not b!233498)))

(declare-fun t!8395 () Bool)

(declare-fun tb!2913 () Bool)

(assert (=> (and b!233361 (= (defaultEntry!4342 thiss!1504) (defaultEntry!4342 thiss!1504)) t!8395) tb!2913))

(declare-fun result!5077 () Bool)

(assert (=> tb!2913 (= result!5077 tp_is_empty!6151)))

(assert (=> b!233498 t!8395))

(declare-fun b_and!13209 () Bool)

(assert (= b_and!13203 (and (=> t!8395 result!5077) b_and!13209)))

(declare-fun m!254969 () Bool)

(assert (=> b!233498 m!254969))

(declare-fun m!254971 () Bool)

(assert (=> b!233498 m!254971))

(assert (=> b!233498 m!254969))

(assert (=> b!233498 m!254971))

(declare-fun m!254973 () Bool)

(assert (=> b!233498 m!254973))

(declare-fun m!254975 () Bool)

(assert (=> b!233498 m!254975))

(assert (=> b!233498 m!254975))

(declare-fun m!254977 () Bool)

(assert (=> b!233498 m!254977))

(assert (=> b!233486 m!254975))

(assert (=> b!233486 m!254975))

(declare-fun m!254979 () Bool)

(assert (=> b!233486 m!254979))

(declare-fun m!254981 () Bool)

(assert (=> b!233499 m!254981))

(assert (=> d!58957 m!254917))

(declare-fun m!254983 () Bool)

(assert (=> b!233485 m!254983))

(declare-fun m!254985 () Bool)

(assert (=> bm!21701 m!254985))

(declare-fun m!254987 () Bool)

(assert (=> b!233495 m!254987))

(declare-fun m!254989 () Bool)

(assert (=> b!233495 m!254989))

(declare-fun m!254991 () Bool)

(assert (=> b!233495 m!254991))

(declare-fun m!254993 () Bool)

(assert (=> b!233495 m!254993))

(assert (=> b!233495 m!254975))

(declare-fun m!254995 () Bool)

(assert (=> b!233495 m!254995))

(declare-fun m!254997 () Bool)

(assert (=> b!233495 m!254997))

(assert (=> b!233495 m!254991))

(declare-fun m!254999 () Bool)

(assert (=> b!233495 m!254999))

(declare-fun m!255001 () Bool)

(assert (=> b!233495 m!255001))

(assert (=> b!233495 m!254989))

(declare-fun m!255003 () Bool)

(assert (=> b!233495 m!255003))

(assert (=> b!233495 m!254995))

(declare-fun m!255005 () Bool)

(assert (=> b!233495 m!255005))

(declare-fun m!255007 () Bool)

(assert (=> b!233495 m!255007))

(declare-fun m!255009 () Bool)

(assert (=> b!233495 m!255009))

(declare-fun m!255011 () Bool)

(assert (=> b!233495 m!255011))

(declare-fun m!255013 () Bool)

(assert (=> b!233495 m!255013))

(declare-fun m!255015 () Bool)

(assert (=> b!233495 m!255015))

(assert (=> b!233495 m!255011))

(declare-fun m!255017 () Bool)

(assert (=> b!233495 m!255017))

(declare-fun m!255019 () Bool)

(assert (=> bm!21700 m!255019))

(declare-fun m!255021 () Bool)

(assert (=> b!233497 m!255021))

(declare-fun m!255023 () Bool)

(assert (=> bm!21702 m!255023))

(assert (=> bm!21704 m!255007))

(assert (=> b!233482 m!254975))

(assert (=> b!233482 m!254975))

(assert (=> b!233482 m!254979))

(assert (=> b!233494 m!254975))

(assert (=> b!233494 m!254975))

(declare-fun m!255025 () Bool)

(assert (=> b!233494 m!255025))

(assert (=> b!233365 d!58957))

(declare-fun d!58959 () Bool)

(assert (=> d!58959 (= (array_inv!3599 (_keys!6397 thiss!1504)) (bvsge (size!5825 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233361 d!58959))

(declare-fun d!58961 () Bool)

(assert (=> d!58961 (= (array_inv!3600 (_values!4325 thiss!1504)) (bvsge (size!5824 (_values!4325 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233361 d!58961))

(declare-fun d!58963 () Bool)

(assert (=> d!58963 (= (validMask!0 (mask!10268 thiss!1504)) (and (or (= (mask!10268 thiss!1504) #b00000000000000000000000000000111) (= (mask!10268 thiss!1504) #b00000000000000000000000000001111) (= (mask!10268 thiss!1504) #b00000000000000000000000000011111) (= (mask!10268 thiss!1504) #b00000000000000000000000000111111) (= (mask!10268 thiss!1504) #b00000000000000000000000001111111) (= (mask!10268 thiss!1504) #b00000000000000000000000011111111) (= (mask!10268 thiss!1504) #b00000000000000000000000111111111) (= (mask!10268 thiss!1504) #b00000000000000000000001111111111) (= (mask!10268 thiss!1504) #b00000000000000000000011111111111) (= (mask!10268 thiss!1504) #b00000000000000000000111111111111) (= (mask!10268 thiss!1504) #b00000000000000000001111111111111) (= (mask!10268 thiss!1504) #b00000000000000000011111111111111) (= (mask!10268 thiss!1504) #b00000000000000000111111111111111) (= (mask!10268 thiss!1504) #b00000000000000001111111111111111) (= (mask!10268 thiss!1504) #b00000000000000011111111111111111) (= (mask!10268 thiss!1504) #b00000000000000111111111111111111) (= (mask!10268 thiss!1504) #b00000000000001111111111111111111) (= (mask!10268 thiss!1504) #b00000000000011111111111111111111) (= (mask!10268 thiss!1504) #b00000000000111111111111111111111) (= (mask!10268 thiss!1504) #b00000000001111111111111111111111) (= (mask!10268 thiss!1504) #b00000000011111111111111111111111) (= (mask!10268 thiss!1504) #b00000000111111111111111111111111) (= (mask!10268 thiss!1504) #b00000001111111111111111111111111) (= (mask!10268 thiss!1504) #b00000011111111111111111111111111) (= (mask!10268 thiss!1504) #b00000111111111111111111111111111) (= (mask!10268 thiss!1504) #b00001111111111111111111111111111) (= (mask!10268 thiss!1504) #b00011111111111111111111111111111) (= (mask!10268 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10268 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!233357 d!58963))

(declare-fun d!58965 () Bool)

(declare-fun lt!118154 () SeekEntryResult!945)

(assert (=> d!58965 (and (or ((_ is Undefined!945) lt!118154) (not ((_ is Found!945) lt!118154)) (and (bvsge (index!5951 lt!118154) #b00000000000000000000000000000000) (bvslt (index!5951 lt!118154) (size!5825 (_keys!6397 thiss!1504))))) (or ((_ is Undefined!945) lt!118154) ((_ is Found!945) lt!118154) (not ((_ is MissingZero!945) lt!118154)) (and (bvsge (index!5950 lt!118154) #b00000000000000000000000000000000) (bvslt (index!5950 lt!118154) (size!5825 (_keys!6397 thiss!1504))))) (or ((_ is Undefined!945) lt!118154) ((_ is Found!945) lt!118154) ((_ is MissingZero!945) lt!118154) (not ((_ is MissingVacant!945) lt!118154)) (and (bvsge (index!5953 lt!118154) #b00000000000000000000000000000000) (bvslt (index!5953 lt!118154) (size!5825 (_keys!6397 thiss!1504))))) (or ((_ is Undefined!945) lt!118154) (ite ((_ is Found!945) lt!118154) (= (select (arr!5492 (_keys!6397 thiss!1504)) (index!5951 lt!118154)) key!932) (ite ((_ is MissingZero!945) lt!118154) (= (select (arr!5492 (_keys!6397 thiss!1504)) (index!5950 lt!118154)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!945) lt!118154) (= (select (arr!5492 (_keys!6397 thiss!1504)) (index!5953 lt!118154)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!151688 () SeekEntryResult!945)

(assert (=> d!58965 (= lt!118154 e!151688)))

(declare-fun c!38846 () Bool)

(declare-fun lt!118156 () SeekEntryResult!945)

(assert (=> d!58965 (= c!38846 (and ((_ is Intermediate!945) lt!118156) (undefined!1757 lt!118156)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11547 (_ BitVec 32)) SeekEntryResult!945)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58965 (= lt!118156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10268 thiss!1504)) key!932 (_keys!6397 thiss!1504) (mask!10268 thiss!1504)))))

(assert (=> d!58965 (validMask!0 (mask!10268 thiss!1504))))

(assert (=> d!58965 (= (seekEntryOrOpen!0 key!932 (_keys!6397 thiss!1504) (mask!10268 thiss!1504)) lt!118154)))

(declare-fun b!233515 () Bool)

(declare-fun e!151687 () SeekEntryResult!945)

(assert (=> b!233515 (= e!151687 (Found!945 (index!5952 lt!118156)))))

(declare-fun b!233516 () Bool)

(assert (=> b!233516 (= e!151688 Undefined!945)))

(declare-fun b!233517 () Bool)

(assert (=> b!233517 (= e!151688 e!151687)))

(declare-fun lt!118155 () (_ BitVec 64))

(assert (=> b!233517 (= lt!118155 (select (arr!5492 (_keys!6397 thiss!1504)) (index!5952 lt!118156)))))

(declare-fun c!38847 () Bool)

(assert (=> b!233517 (= c!38847 (= lt!118155 key!932))))

(declare-fun b!233518 () Bool)

(declare-fun e!151686 () SeekEntryResult!945)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11547 (_ BitVec 32)) SeekEntryResult!945)

(assert (=> b!233518 (= e!151686 (seekKeyOrZeroReturnVacant!0 (x!23591 lt!118156) (index!5952 lt!118156) (index!5952 lt!118156) key!932 (_keys!6397 thiss!1504) (mask!10268 thiss!1504)))))

(declare-fun b!233519 () Bool)

(declare-fun c!38848 () Bool)

(assert (=> b!233519 (= c!38848 (= lt!118155 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233519 (= e!151687 e!151686)))

(declare-fun b!233520 () Bool)

(assert (=> b!233520 (= e!151686 (MissingZero!945 (index!5952 lt!118156)))))

(assert (= (and d!58965 c!38846) b!233516))

(assert (= (and d!58965 (not c!38846)) b!233517))

(assert (= (and b!233517 c!38847) b!233515))

(assert (= (and b!233517 (not c!38847)) b!233519))

(assert (= (and b!233519 c!38848) b!233520))

(assert (= (and b!233519 (not c!38848)) b!233518))

(declare-fun m!255027 () Bool)

(assert (=> d!58965 m!255027))

(assert (=> d!58965 m!254917))

(declare-fun m!255029 () Bool)

(assert (=> d!58965 m!255029))

(declare-fun m!255031 () Bool)

(assert (=> d!58965 m!255031))

(assert (=> d!58965 m!255031))

(declare-fun m!255033 () Bool)

(assert (=> d!58965 m!255033))

(declare-fun m!255035 () Bool)

(assert (=> d!58965 m!255035))

(declare-fun m!255037 () Bool)

(assert (=> b!233517 m!255037))

(declare-fun m!255039 () Bool)

(assert (=> b!233518 m!255039))

(assert (=> b!233363 d!58965))

(declare-fun b!233528 () Bool)

(declare-fun e!151694 () Bool)

(assert (=> b!233528 (= e!151694 tp_is_empty!6151)))

(declare-fun mapIsEmpty!10408 () Bool)

(declare-fun mapRes!10408 () Bool)

(assert (=> mapIsEmpty!10408 mapRes!10408))

(declare-fun condMapEmpty!10408 () Bool)

(declare-fun mapDefault!10408 () ValueCell!2732)

(assert (=> mapNonEmpty!10399 (= condMapEmpty!10408 (= mapRest!10399 ((as const (Array (_ BitVec 32) ValueCell!2732)) mapDefault!10408)))))

(assert (=> mapNonEmpty!10399 (= tp!22012 (and e!151694 mapRes!10408))))

(declare-fun mapNonEmpty!10408 () Bool)

(declare-fun tp!22027 () Bool)

(declare-fun e!151693 () Bool)

(assert (=> mapNonEmpty!10408 (= mapRes!10408 (and tp!22027 e!151693))))

(declare-fun mapRest!10408 () (Array (_ BitVec 32) ValueCell!2732))

(declare-fun mapKey!10408 () (_ BitVec 32))

(declare-fun mapValue!10408 () ValueCell!2732)

(assert (=> mapNonEmpty!10408 (= mapRest!10399 (store mapRest!10408 mapKey!10408 mapValue!10408))))

(declare-fun b!233527 () Bool)

(assert (=> b!233527 (= e!151693 tp_is_empty!6151)))

(assert (= (and mapNonEmpty!10399 condMapEmpty!10408) mapIsEmpty!10408))

(assert (= (and mapNonEmpty!10399 (not condMapEmpty!10408)) mapNonEmpty!10408))

(assert (= (and mapNonEmpty!10408 ((_ is ValueCellFull!2732) mapValue!10408)) b!233527))

(assert (= (and mapNonEmpty!10399 ((_ is ValueCellFull!2732) mapDefault!10408)) b!233528))

(declare-fun m!255041 () Bool)

(assert (=> mapNonEmpty!10408 m!255041))

(declare-fun b_lambda!7871 () Bool)

(assert (= b_lambda!7869 (or (and b!233361 b_free!6289) b_lambda!7871)))

(check-sat tp_is_empty!6151 (not bm!21700) (not b!233428) (not b!233482) (not bm!21702) (not b!233435) (not d!58953) (not b!233497) (not b!233498) (not bm!21701) (not mapNonEmpty!10408) (not b_next!6289) (not b!233485) (not d!58965) (not b!233426) (not b_lambda!7871) (not b!233427) (not b!233494) (not b!233437) (not d!58957) (not bm!21704) b_and!13209 (not b!233518) (not b!233486) (not b!233495) (not d!58955) (not b!233499))
(check-sat b_and!13209 (not b_next!6289))
(get-model)

(declare-fun d!58967 () Bool)

(declare-fun e!151696 () Bool)

(assert (=> d!58967 e!151696))

(declare-fun res!114599 () Bool)

(assert (=> d!58967 (=> res!114599 e!151696)))

(declare-fun lt!118158 () Bool)

(assert (=> d!58967 (= res!114599 (not lt!118158))))

(declare-fun lt!118157 () Bool)

(assert (=> d!58967 (= lt!118158 lt!118157)))

(declare-fun lt!118160 () Unit!7203)

(declare-fun e!151695 () Unit!7203)

(assert (=> d!58967 (= lt!118160 e!151695)))

(declare-fun c!38849 () Bool)

(assert (=> d!58967 (= c!38849 lt!118157)))

(assert (=> d!58967 (= lt!118157 (containsKey!254 (toList!1740 lt!118126) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58967 (= (contains!1622 lt!118126 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118158)))

(declare-fun b!233529 () Bool)

(declare-fun lt!118159 () Unit!7203)

(assert (=> b!233529 (= e!151695 lt!118159)))

(assert (=> b!233529 (= lt!118159 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1740 lt!118126) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233529 (isDefined!203 (getValueByKey!263 (toList!1740 lt!118126) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233530 () Bool)

(declare-fun Unit!7207 () Unit!7203)

(assert (=> b!233530 (= e!151695 Unit!7207)))

(declare-fun b!233531 () Bool)

(assert (=> b!233531 (= e!151696 (isDefined!203 (getValueByKey!263 (toList!1740 lt!118126) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58967 c!38849) b!233529))

(assert (= (and d!58967 (not c!38849)) b!233530))

(assert (= (and d!58967 (not res!114599)) b!233531))

(declare-fun m!255043 () Bool)

(assert (=> d!58967 m!255043))

(declare-fun m!255045 () Bool)

(assert (=> b!233529 m!255045))

(declare-fun m!255047 () Bool)

(assert (=> b!233529 m!255047))

(assert (=> b!233529 m!255047))

(declare-fun m!255049 () Bool)

(assert (=> b!233529 m!255049))

(assert (=> b!233531 m!255047))

(assert (=> b!233531 m!255047))

(assert (=> b!233531 m!255049))

(assert (=> bm!21700 d!58967))

(declare-fun d!58969 () Bool)

(assert (=> d!58969 (= (validKeyInArray!0 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233482 d!58969))

(declare-fun d!58971 () Bool)

(declare-fun get!2820 (Option!269) V!7849)

(assert (=> d!58971 (= (apply!204 lt!118126 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)) (get!2820 (getValueByKey!263 (toList!1740 lt!118126) (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8669 () Bool)

(assert (= bs!8669 d!58971))

(assert (=> bs!8669 m!254975))

(declare-fun m!255051 () Bool)

(assert (=> bs!8669 m!255051))

(assert (=> bs!8669 m!255051))

(declare-fun m!255053 () Bool)

(assert (=> bs!8669 m!255053))

(assert (=> b!233498 d!58971))

(declare-fun d!58973 () Bool)

(declare-fun c!38852 () Bool)

(assert (=> d!58973 (= c!38852 ((_ is ValueCellFull!2732) (select (arr!5491 (_values!4325 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!151699 () V!7849)

(assert (=> d!58973 (= (get!2819 (select (arr!5491 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!151699)))

(declare-fun b!233536 () Bool)

(declare-fun get!2821 (ValueCell!2732 V!7849) V!7849)

(assert (=> b!233536 (= e!151699 (get!2821 (select (arr!5491 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!233537 () Bool)

(declare-fun get!2822 (ValueCell!2732 V!7849) V!7849)

(assert (=> b!233537 (= e!151699 (get!2822 (select (arr!5491 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58973 c!38852) b!233536))

(assert (= (and d!58973 (not c!38852)) b!233537))

(assert (=> b!233536 m!254969))

(assert (=> b!233536 m!254971))

(declare-fun m!255055 () Bool)

(assert (=> b!233536 m!255055))

(assert (=> b!233537 m!254969))

(assert (=> b!233537 m!254971))

(declare-fun m!255057 () Bool)

(assert (=> b!233537 m!255057))

(assert (=> b!233498 d!58973))

(declare-fun b!233546 () Bool)

(declare-fun e!151704 () (_ BitVec 32))

(declare-fun call!21711 () (_ BitVec 32))

(assert (=> b!233546 (= e!151704 (bvadd #b00000000000000000000000000000001 call!21711))))

(declare-fun bm!21708 () Bool)

(assert (=> bm!21708 (= call!21711 (arrayCountValidKeys!0 (_keys!6397 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5825 (_keys!6397 thiss!1504))))))

(declare-fun d!58975 () Bool)

(declare-fun lt!118163 () (_ BitVec 32))

(assert (=> d!58975 (and (bvsge lt!118163 #b00000000000000000000000000000000) (bvsle lt!118163 (bvsub (size!5825 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!151705 () (_ BitVec 32))

(assert (=> d!58975 (= lt!118163 e!151705)))

(declare-fun c!38858 () Bool)

(assert (=> d!58975 (= c!38858 (bvsge #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(assert (=> d!58975 (and (bvsle #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5825 (_keys!6397 thiss!1504)) (size!5825 (_keys!6397 thiss!1504))))))

(assert (=> d!58975 (= (arrayCountValidKeys!0 (_keys!6397 thiss!1504) #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))) lt!118163)))

(declare-fun b!233547 () Bool)

(assert (=> b!233547 (= e!151705 e!151704)))

(declare-fun c!38857 () Bool)

(assert (=> b!233547 (= c!38857 (validKeyInArray!0 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233548 () Bool)

(assert (=> b!233548 (= e!151705 #b00000000000000000000000000000000)))

(declare-fun b!233549 () Bool)

(assert (=> b!233549 (= e!151704 call!21711)))

(assert (= (and d!58975 c!38858) b!233548))

(assert (= (and d!58975 (not c!38858)) b!233547))

(assert (= (and b!233547 c!38857) b!233546))

(assert (= (and b!233547 (not c!38857)) b!233549))

(assert (= (or b!233546 b!233549) bm!21708))

(declare-fun m!255059 () Bool)

(assert (=> bm!21708 m!255059))

(assert (=> b!233547 m!254975))

(assert (=> b!233547 m!254975))

(assert (=> b!233547 m!254979))

(assert (=> b!233426 d!58975))

(declare-fun b!233560 () Bool)

(declare-fun res!114611 () Bool)

(declare-fun e!151708 () Bool)

(assert (=> b!233560 (=> (not res!114611) (not e!151708))))

(declare-fun size!5830 (LongMapFixedSize!3364) (_ BitVec 32))

(assert (=> b!233560 (= res!114611 (= (size!5830 thiss!1504) (bvadd (_size!1731 thiss!1504) (bvsdiv (bvadd (extraKeys!4079 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!58977 () Bool)

(declare-fun res!114609 () Bool)

(assert (=> d!58977 (=> (not res!114609) (not e!151708))))

(assert (=> d!58977 (= res!114609 (validMask!0 (mask!10268 thiss!1504)))))

(assert (=> d!58977 (= (simpleValid!227 thiss!1504) e!151708)))

(declare-fun b!233561 () Bool)

(assert (=> b!233561 (= e!151708 (and (bvsge (extraKeys!4079 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4079 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1731 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!233558 () Bool)

(declare-fun res!114608 () Bool)

(assert (=> b!233558 (=> (not res!114608) (not e!151708))))

(assert (=> b!233558 (= res!114608 (and (= (size!5824 (_values!4325 thiss!1504)) (bvadd (mask!10268 thiss!1504) #b00000000000000000000000000000001)) (= (size!5825 (_keys!6397 thiss!1504)) (size!5824 (_values!4325 thiss!1504))) (bvsge (_size!1731 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1731 thiss!1504) (bvadd (mask!10268 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!233559 () Bool)

(declare-fun res!114610 () Bool)

(assert (=> b!233559 (=> (not res!114610) (not e!151708))))

(assert (=> b!233559 (= res!114610 (bvsge (size!5830 thiss!1504) (_size!1731 thiss!1504)))))

(assert (= (and d!58977 res!114609) b!233558))

(assert (= (and b!233558 res!114608) b!233559))

(assert (= (and b!233559 res!114610) b!233560))

(assert (= (and b!233560 res!114611) b!233561))

(declare-fun m!255061 () Bool)

(assert (=> b!233560 m!255061))

(assert (=> d!58977 m!254917))

(assert (=> b!233559 m!255061))

(assert (=> d!58953 d!58977))

(declare-fun b!233580 () Bool)

(declare-fun e!151719 () SeekEntryResult!945)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233580 (= e!151719 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10268 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10268 thiss!1504)) key!932 (_keys!6397 thiss!1504) (mask!10268 thiss!1504)))))

(declare-fun b!233581 () Bool)

(declare-fun e!151720 () SeekEntryResult!945)

(assert (=> b!233581 (= e!151720 e!151719)))

(declare-fun c!38867 () Bool)

(declare-fun lt!118169 () (_ BitVec 64))

(assert (=> b!233581 (= c!38867 (or (= lt!118169 key!932) (= (bvadd lt!118169 lt!118169) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!233582 () Bool)

(declare-fun lt!118168 () SeekEntryResult!945)

(assert (=> b!233582 (and (bvsge (index!5952 lt!118168) #b00000000000000000000000000000000) (bvslt (index!5952 lt!118168) (size!5825 (_keys!6397 thiss!1504))))))

(declare-fun e!151721 () Bool)

(assert (=> b!233582 (= e!151721 (= (select (arr!5492 (_keys!6397 thiss!1504)) (index!5952 lt!118168)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!58979 () Bool)

(declare-fun e!151722 () Bool)

(assert (=> d!58979 e!151722))

(declare-fun c!38865 () Bool)

(assert (=> d!58979 (= c!38865 (and ((_ is Intermediate!945) lt!118168) (undefined!1757 lt!118168)))))

(assert (=> d!58979 (= lt!118168 e!151720)))

(declare-fun c!38866 () Bool)

(assert (=> d!58979 (= c!38866 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!58979 (= lt!118169 (select (arr!5492 (_keys!6397 thiss!1504)) (toIndex!0 key!932 (mask!10268 thiss!1504))))))

(assert (=> d!58979 (validMask!0 (mask!10268 thiss!1504))))

(assert (=> d!58979 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10268 thiss!1504)) key!932 (_keys!6397 thiss!1504) (mask!10268 thiss!1504)) lt!118168)))

(declare-fun b!233583 () Bool)

(declare-fun e!151723 () Bool)

(assert (=> b!233583 (= e!151722 e!151723)))

(declare-fun res!114619 () Bool)

(assert (=> b!233583 (= res!114619 (and ((_ is Intermediate!945) lt!118168) (not (undefined!1757 lt!118168)) (bvslt (x!23591 lt!118168) #b01111111111111111111111111111110) (bvsge (x!23591 lt!118168) #b00000000000000000000000000000000) (bvsge (x!23591 lt!118168) #b00000000000000000000000000000000)))))

(assert (=> b!233583 (=> (not res!114619) (not e!151723))))

(declare-fun b!233584 () Bool)

(assert (=> b!233584 (and (bvsge (index!5952 lt!118168) #b00000000000000000000000000000000) (bvslt (index!5952 lt!118168) (size!5825 (_keys!6397 thiss!1504))))))

(declare-fun res!114620 () Bool)

(assert (=> b!233584 (= res!114620 (= (select (arr!5492 (_keys!6397 thiss!1504)) (index!5952 lt!118168)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233584 (=> res!114620 e!151721)))

(declare-fun b!233585 () Bool)

(assert (=> b!233585 (and (bvsge (index!5952 lt!118168) #b00000000000000000000000000000000) (bvslt (index!5952 lt!118168) (size!5825 (_keys!6397 thiss!1504))))))

(declare-fun res!114618 () Bool)

(assert (=> b!233585 (= res!114618 (= (select (arr!5492 (_keys!6397 thiss!1504)) (index!5952 lt!118168)) key!932))))

(assert (=> b!233585 (=> res!114618 e!151721)))

(assert (=> b!233585 (= e!151723 e!151721)))

(declare-fun b!233586 () Bool)

(assert (=> b!233586 (= e!151719 (Intermediate!945 false (toIndex!0 key!932 (mask!10268 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!233587 () Bool)

(assert (=> b!233587 (= e!151720 (Intermediate!945 true (toIndex!0 key!932 (mask!10268 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!233588 () Bool)

(assert (=> b!233588 (= e!151722 (bvsge (x!23591 lt!118168) #b01111111111111111111111111111110))))

(assert (= (and d!58979 c!38866) b!233587))

(assert (= (and d!58979 (not c!38866)) b!233581))

(assert (= (and b!233581 c!38867) b!233586))

(assert (= (and b!233581 (not c!38867)) b!233580))

(assert (= (and d!58979 c!38865) b!233588))

(assert (= (and d!58979 (not c!38865)) b!233583))

(assert (= (and b!233583 res!114619) b!233585))

(assert (= (and b!233585 (not res!114618)) b!233584))

(assert (= (and b!233584 (not res!114620)) b!233582))

(declare-fun m!255063 () Bool)

(assert (=> b!233585 m!255063))

(assert (=> b!233580 m!255031))

(declare-fun m!255065 () Bool)

(assert (=> b!233580 m!255065))

(assert (=> b!233580 m!255065))

(declare-fun m!255067 () Bool)

(assert (=> b!233580 m!255067))

(assert (=> d!58979 m!255031))

(declare-fun m!255069 () Bool)

(assert (=> d!58979 m!255069))

(assert (=> d!58979 m!254917))

(assert (=> b!233582 m!255063))

(assert (=> b!233584 m!255063))

(assert (=> d!58965 d!58979))

(declare-fun d!58981 () Bool)

(declare-fun lt!118175 () (_ BitVec 32))

(declare-fun lt!118174 () (_ BitVec 32))

(assert (=> d!58981 (= lt!118175 (bvmul (bvxor lt!118174 (bvlshr lt!118174 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58981 (= lt!118174 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58981 (and (bvsge (mask!10268 thiss!1504) #b00000000000000000000000000000000) (let ((res!114621 (let ((h!4086 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23608 (bvmul (bvxor h!4086 (bvlshr h!4086 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23608 (bvlshr x!23608 #b00000000000000000000000000001101)) (mask!10268 thiss!1504)))))) (and (bvslt res!114621 (bvadd (mask!10268 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!114621 #b00000000000000000000000000000000))))))

(assert (=> d!58981 (= (toIndex!0 key!932 (mask!10268 thiss!1504)) (bvand (bvxor lt!118175 (bvlshr lt!118175 #b00000000000000000000000000001101)) (mask!10268 thiss!1504)))))

(assert (=> d!58965 d!58981))

(assert (=> d!58965 d!58963))

(declare-fun d!58983 () Bool)

(assert (=> d!58983 (= (apply!204 lt!118126 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2820 (getValueByKey!263 (toList!1740 lt!118126) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8670 () Bool)

(assert (= bs!8670 d!58983))

(assert (=> bs!8670 m!255047))

(assert (=> bs!8670 m!255047))

(declare-fun m!255071 () Bool)

(assert (=> bs!8670 m!255071))

(assert (=> b!233497 d!58983))

(declare-fun b!233601 () Bool)

(declare-fun e!151731 () SeekEntryResult!945)

(assert (=> b!233601 (= e!151731 (Found!945 (index!5952 lt!118156)))))

(declare-fun b!233602 () Bool)

(declare-fun e!151732 () SeekEntryResult!945)

(assert (=> b!233602 (= e!151732 e!151731)))

(declare-fun c!38874 () Bool)

(declare-fun lt!118181 () (_ BitVec 64))

(assert (=> b!233602 (= c!38874 (= lt!118181 key!932))))

(declare-fun b!233603 () Bool)

(declare-fun e!151730 () SeekEntryResult!945)

(assert (=> b!233603 (= e!151730 (MissingVacant!945 (index!5952 lt!118156)))))

(declare-fun b!233604 () Bool)

(assert (=> b!233604 (= e!151732 Undefined!945)))

(declare-fun b!233605 () Bool)

(declare-fun c!38875 () Bool)

(assert (=> b!233605 (= c!38875 (= lt!118181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233605 (= e!151731 e!151730)))

(declare-fun lt!118180 () SeekEntryResult!945)

(declare-fun d!58985 () Bool)

(assert (=> d!58985 (and (or ((_ is Undefined!945) lt!118180) (not ((_ is Found!945) lt!118180)) (and (bvsge (index!5951 lt!118180) #b00000000000000000000000000000000) (bvslt (index!5951 lt!118180) (size!5825 (_keys!6397 thiss!1504))))) (or ((_ is Undefined!945) lt!118180) ((_ is Found!945) lt!118180) (not ((_ is MissingVacant!945) lt!118180)) (not (= (index!5953 lt!118180) (index!5952 lt!118156))) (and (bvsge (index!5953 lt!118180) #b00000000000000000000000000000000) (bvslt (index!5953 lt!118180) (size!5825 (_keys!6397 thiss!1504))))) (or ((_ is Undefined!945) lt!118180) (ite ((_ is Found!945) lt!118180) (= (select (arr!5492 (_keys!6397 thiss!1504)) (index!5951 lt!118180)) key!932) (and ((_ is MissingVacant!945) lt!118180) (= (index!5953 lt!118180) (index!5952 lt!118156)) (= (select (arr!5492 (_keys!6397 thiss!1504)) (index!5953 lt!118180)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58985 (= lt!118180 e!151732)))

(declare-fun c!38876 () Bool)

(assert (=> d!58985 (= c!38876 (bvsge (x!23591 lt!118156) #b01111111111111111111111111111110))))

(assert (=> d!58985 (= lt!118181 (select (arr!5492 (_keys!6397 thiss!1504)) (index!5952 lt!118156)))))

(assert (=> d!58985 (validMask!0 (mask!10268 thiss!1504))))

(assert (=> d!58985 (= (seekKeyOrZeroReturnVacant!0 (x!23591 lt!118156) (index!5952 lt!118156) (index!5952 lt!118156) key!932 (_keys!6397 thiss!1504) (mask!10268 thiss!1504)) lt!118180)))

(declare-fun b!233606 () Bool)

(assert (=> b!233606 (= e!151730 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23591 lt!118156) #b00000000000000000000000000000001) (nextIndex!0 (index!5952 lt!118156) (bvadd (x!23591 lt!118156) #b00000000000000000000000000000001) (mask!10268 thiss!1504)) (index!5952 lt!118156) key!932 (_keys!6397 thiss!1504) (mask!10268 thiss!1504)))))

(assert (= (and d!58985 c!38876) b!233604))

(assert (= (and d!58985 (not c!38876)) b!233602))

(assert (= (and b!233602 c!38874) b!233601))

(assert (= (and b!233602 (not c!38874)) b!233605))

(assert (= (and b!233605 c!38875) b!233603))

(assert (= (and b!233605 (not c!38875)) b!233606))

(declare-fun m!255073 () Bool)

(assert (=> d!58985 m!255073))

(declare-fun m!255075 () Bool)

(assert (=> d!58985 m!255075))

(assert (=> d!58985 m!255037))

(assert (=> d!58985 m!254917))

(declare-fun m!255077 () Bool)

(assert (=> b!233606 m!255077))

(assert (=> b!233606 m!255077))

(declare-fun m!255079 () Bool)

(assert (=> b!233606 m!255079))

(assert (=> b!233518 d!58985))

(declare-fun d!58987 () Bool)

(declare-fun e!151734 () Bool)

(assert (=> d!58987 e!151734))

(declare-fun res!114622 () Bool)

(assert (=> d!58987 (=> res!114622 e!151734)))

(declare-fun lt!118183 () Bool)

(assert (=> d!58987 (= res!114622 (not lt!118183))))

(declare-fun lt!118182 () Bool)

(assert (=> d!58987 (= lt!118183 lt!118182)))

(declare-fun lt!118185 () Unit!7203)

(declare-fun e!151733 () Unit!7203)

(assert (=> d!58987 (= lt!118185 e!151733)))

(declare-fun c!38877 () Bool)

(assert (=> d!58987 (= c!38877 lt!118182)))

(assert (=> d!58987 (= lt!118182 (containsKey!254 (toList!1740 lt!118126) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58987 (= (contains!1622 lt!118126 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118183)))

(declare-fun b!233607 () Bool)

(declare-fun lt!118184 () Unit!7203)

(assert (=> b!233607 (= e!151733 lt!118184)))

(assert (=> b!233607 (= lt!118184 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1740 lt!118126) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233607 (isDefined!203 (getValueByKey!263 (toList!1740 lt!118126) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233608 () Bool)

(declare-fun Unit!7208 () Unit!7203)

(assert (=> b!233608 (= e!151733 Unit!7208)))

(declare-fun b!233609 () Bool)

(assert (=> b!233609 (= e!151734 (isDefined!203 (getValueByKey!263 (toList!1740 lt!118126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58987 c!38877) b!233607))

(assert (= (and d!58987 (not c!38877)) b!233608))

(assert (= (and d!58987 (not res!114622)) b!233609))

(declare-fun m!255081 () Bool)

(assert (=> d!58987 m!255081))

(declare-fun m!255083 () Bool)

(assert (=> b!233607 m!255083))

(declare-fun m!255085 () Bool)

(assert (=> b!233607 m!255085))

(assert (=> b!233607 m!255085))

(declare-fun m!255087 () Bool)

(assert (=> b!233607 m!255087))

(assert (=> b!233609 m!255085))

(assert (=> b!233609 m!255085))

(assert (=> b!233609 m!255087))

(assert (=> bm!21702 d!58987))

(declare-fun d!58989 () Bool)

(declare-fun isEmpty!510 (Option!269) Bool)

(assert (=> d!58989 (= (isDefined!203 (getValueByKey!263 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932)) (not (isEmpty!510 (getValueByKey!263 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))))

(declare-fun bs!8671 () Bool)

(assert (= bs!8671 d!58989))

(assert (=> bs!8671 m!254965))

(declare-fun m!255089 () Bool)

(assert (=> bs!8671 m!255089))

(assert (=> b!233437 d!58989))

(declare-fun b!233618 () Bool)

(declare-fun e!151739 () Option!269)

(assert (=> b!233618 (= e!151739 (Some!268 (_2!2278 (h!4083 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))))))

(declare-fun b!233621 () Bool)

(declare-fun e!151740 () Option!269)

(assert (=> b!233621 (= e!151740 None!267)))

(declare-fun b!233620 () Bool)

(assert (=> b!233620 (= e!151740 (getValueByKey!263 (t!8392 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) key!932))))

(declare-fun b!233619 () Bool)

(assert (=> b!233619 (= e!151739 e!151740)))

(declare-fun c!38883 () Bool)

(assert (=> b!233619 (= c!38883 (and ((_ is Cons!3435) (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) (not (= (_1!2278 (h!4083 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) key!932))))))

(declare-fun d!58991 () Bool)

(declare-fun c!38882 () Bool)

(assert (=> d!58991 (= c!38882 (and ((_ is Cons!3435) (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) (= (_1!2278 (h!4083 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) key!932)))))

(assert (=> d!58991 (= (getValueByKey!263 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932) e!151739)))

(assert (= (and d!58991 c!38882) b!233618))

(assert (= (and d!58991 (not c!38882)) b!233619))

(assert (= (and b!233619 c!38883) b!233620))

(assert (= (and b!233619 (not c!38883)) b!233621))

(declare-fun m!255091 () Bool)

(assert (=> b!233620 m!255091))

(assert (=> b!233437 d!58991))

(declare-fun d!58993 () Bool)

(declare-fun e!151742 () Bool)

(assert (=> d!58993 e!151742))

(declare-fun res!114623 () Bool)

(assert (=> d!58993 (=> res!114623 e!151742)))

(declare-fun lt!118187 () Bool)

(assert (=> d!58993 (= res!114623 (not lt!118187))))

(declare-fun lt!118186 () Bool)

(assert (=> d!58993 (= lt!118187 lt!118186)))

(declare-fun lt!118189 () Unit!7203)

(declare-fun e!151741 () Unit!7203)

(assert (=> d!58993 (= lt!118189 e!151741)))

(declare-fun c!38884 () Bool)

(assert (=> d!58993 (= c!38884 lt!118186)))

(assert (=> d!58993 (= lt!118186 (containsKey!254 (toList!1740 (+!631 lt!118145 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504)))) lt!118128))))

(assert (=> d!58993 (= (contains!1622 (+!631 lt!118145 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504))) lt!118128) lt!118187)))

(declare-fun b!233622 () Bool)

(declare-fun lt!118188 () Unit!7203)

(assert (=> b!233622 (= e!151741 lt!118188)))

(assert (=> b!233622 (= lt!118188 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1740 (+!631 lt!118145 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504)))) lt!118128))))

(assert (=> b!233622 (isDefined!203 (getValueByKey!263 (toList!1740 (+!631 lt!118145 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504)))) lt!118128))))

(declare-fun b!233623 () Bool)

(declare-fun Unit!7209 () Unit!7203)

(assert (=> b!233623 (= e!151741 Unit!7209)))

(declare-fun b!233624 () Bool)

(assert (=> b!233624 (= e!151742 (isDefined!203 (getValueByKey!263 (toList!1740 (+!631 lt!118145 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504)))) lt!118128)))))

(assert (= (and d!58993 c!38884) b!233622))

(assert (= (and d!58993 (not c!38884)) b!233623))

(assert (= (and d!58993 (not res!114623)) b!233624))

(declare-fun m!255093 () Bool)

(assert (=> d!58993 m!255093))

(declare-fun m!255095 () Bool)

(assert (=> b!233622 m!255095))

(declare-fun m!255097 () Bool)

(assert (=> b!233622 m!255097))

(assert (=> b!233622 m!255097))

(declare-fun m!255099 () Bool)

(assert (=> b!233622 m!255099))

(assert (=> b!233624 m!255097))

(assert (=> b!233624 m!255097))

(assert (=> b!233624 m!255099))

(assert (=> b!233495 d!58993))

(declare-fun d!58995 () Bool)

(declare-fun e!151745 () Bool)

(assert (=> d!58995 e!151745))

(declare-fun res!114629 () Bool)

(assert (=> d!58995 (=> (not res!114629) (not e!151745))))

(declare-fun lt!118201 () ListLongMap!3449)

(assert (=> d!58995 (= res!114629 (contains!1622 lt!118201 (_1!2278 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504)))))))

(declare-fun lt!118199 () List!3439)

(assert (=> d!58995 (= lt!118201 (ListLongMap!3450 lt!118199))))

(declare-fun lt!118198 () Unit!7203)

(declare-fun lt!118200 () Unit!7203)

(assert (=> d!58995 (= lt!118198 lt!118200)))

(assert (=> d!58995 (= (getValueByKey!263 lt!118199 (_1!2278 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504)))) (Some!268 (_2!2278 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!148 (List!3439 (_ BitVec 64) V!7849) Unit!7203)

(assert (=> d!58995 (= lt!118200 (lemmaContainsTupThenGetReturnValue!148 lt!118199 (_1!2278 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504))) (_2!2278 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504)))))))

(declare-fun insertStrictlySorted!151 (List!3439 (_ BitVec 64) V!7849) List!3439)

(assert (=> d!58995 (= lt!118199 (insertStrictlySorted!151 (toList!1740 lt!118139) (_1!2278 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504))) (_2!2278 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504)))))))

(assert (=> d!58995 (= (+!631 lt!118139 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504))) lt!118201)))

(declare-fun b!233629 () Bool)

(declare-fun res!114628 () Bool)

(assert (=> b!233629 (=> (not res!114628) (not e!151745))))

(assert (=> b!233629 (= res!114628 (= (getValueByKey!263 (toList!1740 lt!118201) (_1!2278 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504)))) (Some!268 (_2!2278 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504))))))))

(declare-fun b!233630 () Bool)

(declare-fun contains!1624 (List!3439 tuple2!4534) Bool)

(assert (=> b!233630 (= e!151745 (contains!1624 (toList!1740 lt!118201) (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504))))))

(assert (= (and d!58995 res!114629) b!233629))

(assert (= (and b!233629 res!114628) b!233630))

(declare-fun m!255101 () Bool)

(assert (=> d!58995 m!255101))

(declare-fun m!255103 () Bool)

(assert (=> d!58995 m!255103))

(declare-fun m!255105 () Bool)

(assert (=> d!58995 m!255105))

(declare-fun m!255107 () Bool)

(assert (=> d!58995 m!255107))

(declare-fun m!255109 () Bool)

(assert (=> b!233629 m!255109))

(declare-fun m!255111 () Bool)

(assert (=> b!233630 m!255111))

(assert (=> b!233495 d!58995))

(declare-fun d!58997 () Bool)

(assert (=> d!58997 (contains!1622 (+!631 lt!118145 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504))) lt!118128)))

(declare-fun lt!118204 () Unit!7203)

(declare-fun choose!1099 (ListLongMap!3449 (_ BitVec 64) V!7849 (_ BitVec 64)) Unit!7203)

(assert (=> d!58997 (= lt!118204 (choose!1099 lt!118145 lt!118140 (zeroValue!4183 thiss!1504) lt!118128))))

(assert (=> d!58997 (contains!1622 lt!118145 lt!118128)))

(assert (=> d!58997 (= (addStillContains!180 lt!118145 lt!118140 (zeroValue!4183 thiss!1504) lt!118128) lt!118204)))

(declare-fun bs!8672 () Bool)

(assert (= bs!8672 d!58997))

(assert (=> bs!8672 m!254989))

(assert (=> bs!8672 m!254989))

(assert (=> bs!8672 m!255003))

(declare-fun m!255113 () Bool)

(assert (=> bs!8672 m!255113))

(declare-fun m!255115 () Bool)

(assert (=> bs!8672 m!255115))

(assert (=> b!233495 d!58997))

(declare-fun d!58999 () Bool)

(declare-fun e!151746 () Bool)

(assert (=> d!58999 e!151746))

(declare-fun res!114631 () Bool)

(assert (=> d!58999 (=> (not res!114631) (not e!151746))))

(declare-fun lt!118208 () ListLongMap!3449)

(assert (=> d!58999 (= res!114631 (contains!1622 lt!118208 (_1!2278 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504)))))))

(declare-fun lt!118206 () List!3439)

(assert (=> d!58999 (= lt!118208 (ListLongMap!3450 lt!118206))))

(declare-fun lt!118205 () Unit!7203)

(declare-fun lt!118207 () Unit!7203)

(assert (=> d!58999 (= lt!118205 lt!118207)))

(assert (=> d!58999 (= (getValueByKey!263 lt!118206 (_1!2278 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504)))) (Some!268 (_2!2278 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504)))))))

(assert (=> d!58999 (= lt!118207 (lemmaContainsTupThenGetReturnValue!148 lt!118206 (_1!2278 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504))) (_2!2278 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504)))))))

(assert (=> d!58999 (= lt!118206 (insertStrictlySorted!151 (toList!1740 lt!118145) (_1!2278 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504))) (_2!2278 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504)))))))

(assert (=> d!58999 (= (+!631 lt!118145 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504))) lt!118208)))

(declare-fun b!233632 () Bool)

(declare-fun res!114630 () Bool)

(assert (=> b!233632 (=> (not res!114630) (not e!151746))))

(assert (=> b!233632 (= res!114630 (= (getValueByKey!263 (toList!1740 lt!118208) (_1!2278 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504)))) (Some!268 (_2!2278 (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504))))))))

(declare-fun b!233633 () Bool)

(assert (=> b!233633 (= e!151746 (contains!1624 (toList!1740 lt!118208) (tuple2!4535 lt!118140 (zeroValue!4183 thiss!1504))))))

(assert (= (and d!58999 res!114631) b!233632))

(assert (= (and b!233632 res!114630) b!233633))

(declare-fun m!255117 () Bool)

(assert (=> d!58999 m!255117))

(declare-fun m!255119 () Bool)

(assert (=> d!58999 m!255119))

(declare-fun m!255121 () Bool)

(assert (=> d!58999 m!255121))

(declare-fun m!255123 () Bool)

(assert (=> d!58999 m!255123))

(declare-fun m!255125 () Bool)

(assert (=> b!233632 m!255125))

(declare-fun m!255127 () Bool)

(assert (=> b!233633 m!255127))

(assert (=> b!233495 d!58999))

(declare-fun d!59001 () Bool)

(assert (=> d!59001 (= (apply!204 (+!631 lt!118136 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504))) lt!118147) (get!2820 (getValueByKey!263 (toList!1740 (+!631 lt!118136 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504)))) lt!118147)))))

(declare-fun bs!8673 () Bool)

(assert (= bs!8673 d!59001))

(declare-fun m!255129 () Bool)

(assert (=> bs!8673 m!255129))

(assert (=> bs!8673 m!255129))

(declare-fun m!255131 () Bool)

(assert (=> bs!8673 m!255131))

(assert (=> b!233495 d!59001))

(declare-fun d!59003 () Bool)

(assert (=> d!59003 (= (apply!204 (+!631 lt!118139 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504))) lt!118141) (get!2820 (getValueByKey!263 (toList!1740 (+!631 lt!118139 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504)))) lt!118141)))))

(declare-fun bs!8674 () Bool)

(assert (= bs!8674 d!59003))

(declare-fun m!255133 () Bool)

(assert (=> bs!8674 m!255133))

(assert (=> bs!8674 m!255133))

(declare-fun m!255135 () Bool)

(assert (=> bs!8674 m!255135))

(assert (=> b!233495 d!59003))

(declare-fun d!59005 () Bool)

(declare-fun e!151747 () Bool)

(assert (=> d!59005 e!151747))

(declare-fun res!114633 () Bool)

(assert (=> d!59005 (=> (not res!114633) (not e!151747))))

(declare-fun lt!118212 () ListLongMap!3449)

(assert (=> d!59005 (= res!114633 (contains!1622 lt!118212 (_1!2278 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504)))))))

(declare-fun lt!118210 () List!3439)

(assert (=> d!59005 (= lt!118212 (ListLongMap!3450 lt!118210))))

(declare-fun lt!118209 () Unit!7203)

(declare-fun lt!118211 () Unit!7203)

(assert (=> d!59005 (= lt!118209 lt!118211)))

(assert (=> d!59005 (= (getValueByKey!263 lt!118210 (_1!2278 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504)))) (Some!268 (_2!2278 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504)))))))

(assert (=> d!59005 (= lt!118211 (lemmaContainsTupThenGetReturnValue!148 lt!118210 (_1!2278 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504))) (_2!2278 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504)))))))

(assert (=> d!59005 (= lt!118210 (insertStrictlySorted!151 (toList!1740 lt!118130) (_1!2278 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504))) (_2!2278 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504)))))))

(assert (=> d!59005 (= (+!631 lt!118130 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504))) lt!118212)))

(declare-fun b!233634 () Bool)

(declare-fun res!114632 () Bool)

(assert (=> b!233634 (=> (not res!114632) (not e!151747))))

(assert (=> b!233634 (= res!114632 (= (getValueByKey!263 (toList!1740 lt!118212) (_1!2278 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504)))) (Some!268 (_2!2278 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504))))))))

(declare-fun b!233635 () Bool)

(assert (=> b!233635 (= e!151747 (contains!1624 (toList!1740 lt!118212) (tuple2!4535 lt!118129 (minValue!4183 thiss!1504))))))

(assert (= (and d!59005 res!114633) b!233634))

(assert (= (and b!233634 res!114632) b!233635))

(declare-fun m!255137 () Bool)

(assert (=> d!59005 m!255137))

(declare-fun m!255139 () Bool)

(assert (=> d!59005 m!255139))

(declare-fun m!255141 () Bool)

(assert (=> d!59005 m!255141))

(declare-fun m!255143 () Bool)

(assert (=> d!59005 m!255143))

(declare-fun m!255145 () Bool)

(assert (=> b!233634 m!255145))

(declare-fun m!255147 () Bool)

(assert (=> b!233635 m!255147))

(assert (=> b!233495 d!59005))

(declare-fun d!59007 () Bool)

(declare-fun e!151748 () Bool)

(assert (=> d!59007 e!151748))

(declare-fun res!114635 () Bool)

(assert (=> d!59007 (=> (not res!114635) (not e!151748))))

(declare-fun lt!118216 () ListLongMap!3449)

(assert (=> d!59007 (= res!114635 (contains!1622 lt!118216 (_1!2278 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504)))))))

(declare-fun lt!118214 () List!3439)

(assert (=> d!59007 (= lt!118216 (ListLongMap!3450 lt!118214))))

(declare-fun lt!118213 () Unit!7203)

(declare-fun lt!118215 () Unit!7203)

(assert (=> d!59007 (= lt!118213 lt!118215)))

(assert (=> d!59007 (= (getValueByKey!263 lt!118214 (_1!2278 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504)))) (Some!268 (_2!2278 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504)))))))

(assert (=> d!59007 (= lt!118215 (lemmaContainsTupThenGetReturnValue!148 lt!118214 (_1!2278 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504))) (_2!2278 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504)))))))

(assert (=> d!59007 (= lt!118214 (insertStrictlySorted!151 (toList!1740 lt!118136) (_1!2278 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504))) (_2!2278 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504)))))))

(assert (=> d!59007 (= (+!631 lt!118136 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504))) lt!118216)))

(declare-fun b!233636 () Bool)

(declare-fun res!114634 () Bool)

(assert (=> b!233636 (=> (not res!114634) (not e!151748))))

(assert (=> b!233636 (= res!114634 (= (getValueByKey!263 (toList!1740 lt!118216) (_1!2278 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504)))) (Some!268 (_2!2278 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504))))))))

(declare-fun b!233637 () Bool)

(assert (=> b!233637 (= e!151748 (contains!1624 (toList!1740 lt!118216) (tuple2!4535 lt!118131 (minValue!4183 thiss!1504))))))

(assert (= (and d!59007 res!114635) b!233636))

(assert (= (and b!233636 res!114634) b!233637))

(declare-fun m!255149 () Bool)

(assert (=> d!59007 m!255149))

(declare-fun m!255151 () Bool)

(assert (=> d!59007 m!255151))

(declare-fun m!255153 () Bool)

(assert (=> d!59007 m!255153))

(declare-fun m!255155 () Bool)

(assert (=> d!59007 m!255155))

(declare-fun m!255157 () Bool)

(assert (=> b!233636 m!255157))

(declare-fun m!255159 () Bool)

(assert (=> b!233637 m!255159))

(assert (=> b!233495 d!59007))

(declare-fun d!59009 () Bool)

(assert (=> d!59009 (= (apply!204 lt!118130 lt!118127) (get!2820 (getValueByKey!263 (toList!1740 lt!118130) lt!118127)))))

(declare-fun bs!8675 () Bool)

(assert (= bs!8675 d!59009))

(declare-fun m!255161 () Bool)

(assert (=> bs!8675 m!255161))

(assert (=> bs!8675 m!255161))

(declare-fun m!255163 () Bool)

(assert (=> bs!8675 m!255163))

(assert (=> b!233495 d!59009))

(declare-fun d!59011 () Bool)

(assert (=> d!59011 (= (apply!204 (+!631 lt!118139 (tuple2!4535 lt!118143 (zeroValue!4183 thiss!1504))) lt!118141) (apply!204 lt!118139 lt!118141))))

(declare-fun lt!118219 () Unit!7203)

(declare-fun choose!1100 (ListLongMap!3449 (_ BitVec 64) V!7849 (_ BitVec 64)) Unit!7203)

(assert (=> d!59011 (= lt!118219 (choose!1100 lt!118139 lt!118143 (zeroValue!4183 thiss!1504) lt!118141))))

(declare-fun e!151751 () Bool)

(assert (=> d!59011 e!151751))

(declare-fun res!114638 () Bool)

(assert (=> d!59011 (=> (not res!114638) (not e!151751))))

(assert (=> d!59011 (= res!114638 (contains!1622 lt!118139 lt!118141))))

(assert (=> d!59011 (= (addApplyDifferent!180 lt!118139 lt!118143 (zeroValue!4183 thiss!1504) lt!118141) lt!118219)))

(declare-fun b!233641 () Bool)

(assert (=> b!233641 (= e!151751 (not (= lt!118141 lt!118143)))))

(assert (= (and d!59011 res!114638) b!233641))

(declare-fun m!255165 () Bool)

(assert (=> d!59011 m!255165))

(declare-fun m!255167 () Bool)

(assert (=> d!59011 m!255167))

(assert (=> d!59011 m!254987))

(assert (=> d!59011 m!254995))

(assert (=> d!59011 m!254995))

(assert (=> d!59011 m!254997))

(assert (=> b!233495 d!59011))

(declare-fun d!59013 () Bool)

(assert (=> d!59013 (= (apply!204 (+!631 lt!118130 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504))) lt!118127) (get!2820 (getValueByKey!263 (toList!1740 (+!631 lt!118130 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504)))) lt!118127)))))

(declare-fun bs!8676 () Bool)

(assert (= bs!8676 d!59013))

(declare-fun m!255169 () Bool)

(assert (=> bs!8676 m!255169))

(assert (=> bs!8676 m!255169))

(declare-fun m!255171 () Bool)

(assert (=> bs!8676 m!255171))

(assert (=> b!233495 d!59013))

(declare-fun d!59015 () Bool)

(assert (=> d!59015 (= (apply!204 lt!118139 lt!118141) (get!2820 (getValueByKey!263 (toList!1740 lt!118139) lt!118141)))))

(declare-fun bs!8677 () Bool)

(assert (= bs!8677 d!59015))

(declare-fun m!255173 () Bool)

(assert (=> bs!8677 m!255173))

(assert (=> bs!8677 m!255173))

(declare-fun m!255175 () Bool)

(assert (=> bs!8677 m!255175))

(assert (=> b!233495 d!59015))

(declare-fun d!59017 () Bool)

(assert (=> d!59017 (= (apply!204 (+!631 lt!118136 (tuple2!4535 lt!118131 (minValue!4183 thiss!1504))) lt!118147) (apply!204 lt!118136 lt!118147))))

(declare-fun lt!118220 () Unit!7203)

(assert (=> d!59017 (= lt!118220 (choose!1100 lt!118136 lt!118131 (minValue!4183 thiss!1504) lt!118147))))

(declare-fun e!151752 () Bool)

(assert (=> d!59017 e!151752))

(declare-fun res!114639 () Bool)

(assert (=> d!59017 (=> (not res!114639) (not e!151752))))

(assert (=> d!59017 (= res!114639 (contains!1622 lt!118136 lt!118147))))

(assert (=> d!59017 (= (addApplyDifferent!180 lt!118136 lt!118131 (minValue!4183 thiss!1504) lt!118147) lt!118220)))

(declare-fun b!233642 () Bool)

(assert (=> b!233642 (= e!151752 (not (= lt!118147 lt!118131)))))

(assert (= (and d!59017 res!114639) b!233642))

(declare-fun m!255177 () Bool)

(assert (=> d!59017 m!255177))

(declare-fun m!255179 () Bool)

(assert (=> d!59017 m!255179))

(assert (=> d!59017 m!254999))

(assert (=> d!59017 m!254991))

(assert (=> d!59017 m!254991))

(assert (=> d!59017 m!254993))

(assert (=> b!233495 d!59017))

(declare-fun d!59019 () Bool)

(assert (=> d!59019 (= (apply!204 (+!631 lt!118130 (tuple2!4535 lt!118129 (minValue!4183 thiss!1504))) lt!118127) (apply!204 lt!118130 lt!118127))))

(declare-fun lt!118221 () Unit!7203)

(assert (=> d!59019 (= lt!118221 (choose!1100 lt!118130 lt!118129 (minValue!4183 thiss!1504) lt!118127))))

(declare-fun e!151753 () Bool)

(assert (=> d!59019 e!151753))

(declare-fun res!114640 () Bool)

(assert (=> d!59019 (=> (not res!114640) (not e!151753))))

(assert (=> d!59019 (= res!114640 (contains!1622 lt!118130 lt!118127))))

(assert (=> d!59019 (= (addApplyDifferent!180 lt!118130 lt!118129 (minValue!4183 thiss!1504) lt!118127) lt!118221)))

(declare-fun b!233643 () Bool)

(assert (=> b!233643 (= e!151753 (not (= lt!118127 lt!118129)))))

(assert (= (and d!59019 res!114640) b!233643))

(declare-fun m!255181 () Bool)

(assert (=> d!59019 m!255181))

(declare-fun m!255183 () Bool)

(assert (=> d!59019 m!255183))

(assert (=> d!59019 m!255009))

(assert (=> d!59019 m!255011))

(assert (=> d!59019 m!255011))

(assert (=> d!59019 m!255013))

(assert (=> b!233495 d!59019))

(declare-fun d!59021 () Bool)

(assert (=> d!59021 (= (apply!204 lt!118136 lt!118147) (get!2820 (getValueByKey!263 (toList!1740 lt!118136) lt!118147)))))

(declare-fun bs!8678 () Bool)

(assert (= bs!8678 d!59021))

(declare-fun m!255185 () Bool)

(assert (=> bs!8678 m!255185))

(assert (=> bs!8678 m!255185))

(declare-fun m!255187 () Bool)

(assert (=> bs!8678 m!255187))

(assert (=> b!233495 d!59021))

(declare-fun b!233668 () Bool)

(declare-fun e!151774 () Bool)

(declare-fun e!151769 () Bool)

(assert (=> b!233668 (= e!151774 e!151769)))

(assert (=> b!233668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(declare-fun res!114649 () Bool)

(declare-fun lt!118237 () ListLongMap!3449)

(assert (=> b!233668 (= res!114649 (contains!1622 lt!118237 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233668 (=> (not res!114649) (not e!151769))))

(declare-fun b!233669 () Bool)

(declare-fun e!151772 () Bool)

(assert (=> b!233669 (= e!151772 (= lt!118237 (getCurrentListMapNoExtraKeys!520 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4342 thiss!1504))))))

(declare-fun bm!21711 () Bool)

(declare-fun call!21714 () ListLongMap!3449)

(assert (=> bm!21711 (= call!21714 (getCurrentListMapNoExtraKeys!520 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4342 thiss!1504)))))

(declare-fun d!59023 () Bool)

(declare-fun e!151773 () Bool)

(assert (=> d!59023 e!151773))

(declare-fun res!114652 () Bool)

(assert (=> d!59023 (=> (not res!114652) (not e!151773))))

(assert (=> d!59023 (= res!114652 (not (contains!1622 lt!118237 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!151768 () ListLongMap!3449)

(assert (=> d!59023 (= lt!118237 e!151768)))

(declare-fun c!38895 () Bool)

(assert (=> d!59023 (= c!38895 (bvsge #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(assert (=> d!59023 (validMask!0 (mask!10268 thiss!1504))))

(assert (=> d!59023 (= (getCurrentListMapNoExtraKeys!520 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)) lt!118237)))

(declare-fun b!233670 () Bool)

(declare-fun lt!118240 () Unit!7203)

(declare-fun lt!118242 () Unit!7203)

(assert (=> b!233670 (= lt!118240 lt!118242)))

(declare-fun lt!118241 () (_ BitVec 64))

(declare-fun lt!118236 () (_ BitVec 64))

(declare-fun lt!118238 () V!7849)

(declare-fun lt!118239 () ListLongMap!3449)

(assert (=> b!233670 (not (contains!1622 (+!631 lt!118239 (tuple2!4535 lt!118236 lt!118238)) lt!118241))))

(declare-fun addStillNotContains!113 (ListLongMap!3449 (_ BitVec 64) V!7849 (_ BitVec 64)) Unit!7203)

(assert (=> b!233670 (= lt!118242 (addStillNotContains!113 lt!118239 lt!118236 lt!118238 lt!118241))))

(assert (=> b!233670 (= lt!118241 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!233670 (= lt!118238 (get!2819 (select (arr!5491 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!233670 (= lt!118236 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233670 (= lt!118239 call!21714)))

(declare-fun e!151770 () ListLongMap!3449)

(assert (=> b!233670 (= e!151770 (+!631 call!21714 (tuple2!4535 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000) (get!2819 (select (arr!5491 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!233671 () Bool)

(assert (=> b!233671 (= e!151770 call!21714)))

(declare-fun b!233672 () Bool)

(assert (=> b!233672 (= e!151768 (ListLongMap!3450 Nil!3436))))

(declare-fun b!233673 () Bool)

(assert (=> b!233673 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(assert (=> b!233673 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5824 (_values!4325 thiss!1504))))))

(assert (=> b!233673 (= e!151769 (= (apply!204 lt!118237 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)) (get!2819 (select (arr!5491 (_values!4325 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4342 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233674 () Bool)

(declare-fun isEmpty!511 (ListLongMap!3449) Bool)

(assert (=> b!233674 (= e!151772 (isEmpty!511 lt!118237))))

(declare-fun b!233675 () Bool)

(assert (=> b!233675 (= e!151773 e!151774)))

(declare-fun c!38896 () Bool)

(declare-fun e!151771 () Bool)

(assert (=> b!233675 (= c!38896 e!151771)))

(declare-fun res!114650 () Bool)

(assert (=> b!233675 (=> (not res!114650) (not e!151771))))

(assert (=> b!233675 (= res!114650 (bvslt #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(declare-fun b!233676 () Bool)

(declare-fun res!114651 () Bool)

(assert (=> b!233676 (=> (not res!114651) (not e!151773))))

(assert (=> b!233676 (= res!114651 (not (contains!1622 lt!118237 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!233677 () Bool)

(assert (=> b!233677 (= e!151774 e!151772)))

(declare-fun c!38893 () Bool)

(assert (=> b!233677 (= c!38893 (bvslt #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(declare-fun b!233678 () Bool)

(assert (=> b!233678 (= e!151771 (validKeyInArray!0 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233678 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!233679 () Bool)

(assert (=> b!233679 (= e!151768 e!151770)))

(declare-fun c!38894 () Bool)

(assert (=> b!233679 (= c!38894 (validKeyInArray!0 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59023 c!38895) b!233672))

(assert (= (and d!59023 (not c!38895)) b!233679))

(assert (= (and b!233679 c!38894) b!233670))

(assert (= (and b!233679 (not c!38894)) b!233671))

(assert (= (or b!233670 b!233671) bm!21711))

(assert (= (and d!59023 res!114652) b!233676))

(assert (= (and b!233676 res!114651) b!233675))

(assert (= (and b!233675 res!114650) b!233678))

(assert (= (and b!233675 c!38896) b!233668))

(assert (= (and b!233675 (not c!38896)) b!233677))

(assert (= (and b!233668 res!114649) b!233673))

(assert (= (and b!233677 c!38893) b!233669))

(assert (= (and b!233677 (not c!38893)) b!233674))

(declare-fun b_lambda!7873 () Bool)

(assert (=> (not b_lambda!7873) (not b!233670)))

(assert (=> b!233670 t!8395))

(declare-fun b_and!13211 () Bool)

(assert (= b_and!13209 (and (=> t!8395 result!5077) b_and!13211)))

(declare-fun b_lambda!7875 () Bool)

(assert (=> (not b_lambda!7875) (not b!233673)))

(assert (=> b!233673 t!8395))

(declare-fun b_and!13213 () Bool)

(assert (= b_and!13211 (and (=> t!8395 result!5077) b_and!13213)))

(assert (=> b!233678 m!254975))

(assert (=> b!233678 m!254975))

(assert (=> b!233678 m!254979))

(assert (=> b!233673 m!254975))

(assert (=> b!233673 m!254971))

(assert (=> b!233673 m!254969))

(assert (=> b!233673 m!254971))

(assert (=> b!233673 m!254973))

(assert (=> b!233673 m!254975))

(declare-fun m!255189 () Bool)

(assert (=> b!233673 m!255189))

(assert (=> b!233673 m!254969))

(assert (=> b!233668 m!254975))

(assert (=> b!233668 m!254975))

(declare-fun m!255191 () Bool)

(assert (=> b!233668 m!255191))

(assert (=> b!233679 m!254975))

(assert (=> b!233679 m!254975))

(assert (=> b!233679 m!254979))

(declare-fun m!255193 () Bool)

(assert (=> d!59023 m!255193))

(assert (=> d!59023 m!254917))

(declare-fun m!255195 () Bool)

(assert (=> b!233669 m!255195))

(declare-fun m!255197 () Bool)

(assert (=> b!233674 m!255197))

(declare-fun m!255199 () Bool)

(assert (=> b!233676 m!255199))

(assert (=> bm!21711 m!255195))

(declare-fun m!255201 () Bool)

(assert (=> b!233670 m!255201))

(assert (=> b!233670 m!254975))

(declare-fun m!255203 () Bool)

(assert (=> b!233670 m!255203))

(declare-fun m!255205 () Bool)

(assert (=> b!233670 m!255205))

(assert (=> b!233670 m!254971))

(assert (=> b!233670 m!254969))

(assert (=> b!233670 m!255203))

(assert (=> b!233670 m!254969))

(assert (=> b!233670 m!254971))

(assert (=> b!233670 m!254973))

(declare-fun m!255207 () Bool)

(assert (=> b!233670 m!255207))

(assert (=> b!233495 d!59023))

(assert (=> d!58957 d!58963))

(assert (=> b!233486 d!58969))

(declare-fun d!59025 () Bool)

(declare-fun e!151776 () Bool)

(assert (=> d!59025 e!151776))

(declare-fun res!114653 () Bool)

(assert (=> d!59025 (=> res!114653 e!151776)))

(declare-fun lt!118244 () Bool)

(assert (=> d!59025 (= res!114653 (not lt!118244))))

(declare-fun lt!118243 () Bool)

(assert (=> d!59025 (= lt!118244 lt!118243)))

(declare-fun lt!118246 () Unit!7203)

(declare-fun e!151775 () Unit!7203)

(assert (=> d!59025 (= lt!118246 e!151775)))

(declare-fun c!38897 () Bool)

(assert (=> d!59025 (= c!38897 lt!118243)))

(assert (=> d!59025 (= lt!118243 (containsKey!254 (toList!1740 lt!118126) (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59025 (= (contains!1622 lt!118126 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)) lt!118244)))

(declare-fun b!233680 () Bool)

(declare-fun lt!118245 () Unit!7203)

(assert (=> b!233680 (= e!151775 lt!118245)))

(assert (=> b!233680 (= lt!118245 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1740 lt!118126) (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233680 (isDefined!203 (getValueByKey!263 (toList!1740 lt!118126) (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233681 () Bool)

(declare-fun Unit!7210 () Unit!7203)

(assert (=> b!233681 (= e!151775 Unit!7210)))

(declare-fun b!233682 () Bool)

(assert (=> b!233682 (= e!151776 (isDefined!203 (getValueByKey!263 (toList!1740 lt!118126) (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59025 c!38897) b!233680))

(assert (= (and d!59025 (not c!38897)) b!233681))

(assert (= (and d!59025 (not res!114653)) b!233682))

(assert (=> d!59025 m!254975))

(declare-fun m!255209 () Bool)

(assert (=> d!59025 m!255209))

(assert (=> b!233680 m!254975))

(declare-fun m!255211 () Bool)

(assert (=> b!233680 m!255211))

(assert (=> b!233680 m!254975))

(assert (=> b!233680 m!255051))

(assert (=> b!233680 m!255051))

(declare-fun m!255213 () Bool)

(assert (=> b!233680 m!255213))

(assert (=> b!233682 m!254975))

(assert (=> b!233682 m!255051))

(assert (=> b!233682 m!255051))

(assert (=> b!233682 m!255213))

(assert (=> b!233494 d!59025))

(declare-fun d!59027 () Bool)

(assert (=> d!59027 (isDefined!203 (getValueByKey!263 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(declare-fun lt!118249 () Unit!7203)

(declare-fun choose!1101 (List!3439 (_ BitVec 64)) Unit!7203)

(assert (=> d!59027 (= lt!118249 (choose!1101 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(declare-fun e!151779 () Bool)

(assert (=> d!59027 e!151779))

(declare-fun res!114656 () Bool)

(assert (=> d!59027 (=> (not res!114656) (not e!151779))))

(declare-fun isStrictlySorted!346 (List!3439) Bool)

(assert (=> d!59027 (= res!114656 (isStrictlySorted!346 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))))))

(assert (=> d!59027 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932) lt!118249)))

(declare-fun b!233685 () Bool)

(assert (=> b!233685 (= e!151779 (containsKey!254 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932))))

(assert (= (and d!59027 res!114656) b!233685))

(assert (=> d!59027 m!254965))

(assert (=> d!59027 m!254965))

(assert (=> d!59027 m!254967))

(declare-fun m!255215 () Bool)

(assert (=> d!59027 m!255215))

(declare-fun m!255217 () Bool)

(assert (=> d!59027 m!255217))

(assert (=> b!233685 m!254961))

(assert (=> b!233435 d!59027))

(assert (=> b!233435 d!58989))

(assert (=> b!233435 d!58991))

(declare-fun d!59029 () Bool)

(declare-fun e!151780 () Bool)

(assert (=> d!59029 e!151780))

(declare-fun res!114658 () Bool)

(assert (=> d!59029 (=> (not res!114658) (not e!151780))))

(declare-fun lt!118253 () ListLongMap!3449)

(assert (=> d!59029 (= res!114658 (contains!1622 lt!118253 (_1!2278 (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))))

(declare-fun lt!118251 () List!3439)

(assert (=> d!59029 (= lt!118253 (ListLongMap!3450 lt!118251))))

(declare-fun lt!118250 () Unit!7203)

(declare-fun lt!118252 () Unit!7203)

(assert (=> d!59029 (= lt!118250 lt!118252)))

(assert (=> d!59029 (= (getValueByKey!263 lt!118251 (_1!2278 (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))) (Some!268 (_2!2278 (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))))

(assert (=> d!59029 (= lt!118252 (lemmaContainsTupThenGetReturnValue!148 lt!118251 (_1!2278 (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))) (_2!2278 (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))))

(assert (=> d!59029 (= lt!118251 (insertStrictlySorted!151 (toList!1740 (ite c!38836 call!21706 (ite c!38835 call!21707 call!21703))) (_1!2278 (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))) (_2!2278 (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))))

(assert (=> d!59029 (= (+!631 (ite c!38836 call!21706 (ite c!38835 call!21707 call!21703)) (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))) lt!118253)))

(declare-fun b!233686 () Bool)

(declare-fun res!114657 () Bool)

(assert (=> b!233686 (=> (not res!114657) (not e!151780))))

(assert (=> b!233686 (= res!114657 (= (getValueByKey!263 (toList!1740 lt!118253) (_1!2278 (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))) (Some!268 (_2!2278 (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))))

(declare-fun b!233687 () Bool)

(assert (=> b!233687 (= e!151780 (contains!1624 (toList!1740 lt!118253) (ite (or c!38836 c!38835) (tuple2!4535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4183 thiss!1504)) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(assert (= (and d!59029 res!114658) b!233686))

(assert (= (and b!233686 res!114657) b!233687))

(declare-fun m!255219 () Bool)

(assert (=> d!59029 m!255219))

(declare-fun m!255221 () Bool)

(assert (=> d!59029 m!255221))

(declare-fun m!255223 () Bool)

(assert (=> d!59029 m!255223))

(declare-fun m!255225 () Bool)

(assert (=> d!59029 m!255225))

(declare-fun m!255227 () Bool)

(assert (=> b!233686 m!255227))

(declare-fun m!255229 () Bool)

(assert (=> b!233687 m!255229))

(assert (=> bm!21701 d!59029))

(declare-fun d!59031 () Bool)

(declare-fun e!151781 () Bool)

(assert (=> d!59031 e!151781))

(declare-fun res!114660 () Bool)

(assert (=> d!59031 (=> (not res!114660) (not e!151781))))

(declare-fun lt!118257 () ListLongMap!3449)

(assert (=> d!59031 (= res!114660 (contains!1622 lt!118257 (_1!2278 (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(declare-fun lt!118255 () List!3439)

(assert (=> d!59031 (= lt!118257 (ListLongMap!3450 lt!118255))))

(declare-fun lt!118254 () Unit!7203)

(declare-fun lt!118256 () Unit!7203)

(assert (=> d!59031 (= lt!118254 lt!118256)))

(assert (=> d!59031 (= (getValueByKey!263 lt!118255 (_1!2278 (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))) (Some!268 (_2!2278 (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(assert (=> d!59031 (= lt!118256 (lemmaContainsTupThenGetReturnValue!148 lt!118255 (_1!2278 (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))) (_2!2278 (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(assert (=> d!59031 (= lt!118255 (insertStrictlySorted!151 (toList!1740 call!21702) (_1!2278 (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))) (_2!2278 (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))))))

(assert (=> d!59031 (= (+!631 call!21702 (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))) lt!118257)))

(declare-fun b!233688 () Bool)

(declare-fun res!114659 () Bool)

(assert (=> b!233688 (=> (not res!114659) (not e!151781))))

(assert (=> b!233688 (= res!114659 (= (getValueByKey!263 (toList!1740 lt!118257) (_1!2278 (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504)))) (Some!268 (_2!2278 (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))))

(declare-fun b!233689 () Bool)

(assert (=> b!233689 (= e!151781 (contains!1624 (toList!1740 lt!118257) (tuple2!4535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4183 thiss!1504))))))

(assert (= (and d!59031 res!114660) b!233688))

(assert (= (and b!233688 res!114659) b!233689))

(declare-fun m!255231 () Bool)

(assert (=> d!59031 m!255231))

(declare-fun m!255233 () Bool)

(assert (=> d!59031 m!255233))

(declare-fun m!255235 () Bool)

(assert (=> d!59031 m!255235))

(declare-fun m!255237 () Bool)

(assert (=> d!59031 m!255237))

(declare-fun m!255239 () Bool)

(assert (=> b!233688 m!255239))

(declare-fun m!255241 () Bool)

(assert (=> b!233689 m!255241))

(assert (=> b!233485 d!59031))

(assert (=> bm!21704 d!59023))

(declare-fun b!233700 () Bool)

(declare-fun e!151792 () Bool)

(declare-fun call!21717 () Bool)

(assert (=> b!233700 (= e!151792 call!21717)))

(declare-fun b!233701 () Bool)

(assert (=> b!233701 (= e!151792 call!21717)))

(declare-fun d!59033 () Bool)

(declare-fun res!114669 () Bool)

(declare-fun e!151790 () Bool)

(assert (=> d!59033 (=> res!114669 e!151790)))

(assert (=> d!59033 (= res!114669 (bvsge #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(assert (=> d!59033 (= (arrayNoDuplicates!0 (_keys!6397 thiss!1504) #b00000000000000000000000000000000 Nil!3438) e!151790)))

(declare-fun b!233702 () Bool)

(declare-fun e!151793 () Bool)

(declare-fun contains!1625 (List!3441 (_ BitVec 64)) Bool)

(assert (=> b!233702 (= e!151793 (contains!1625 Nil!3438 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21714 () Bool)

(declare-fun c!38900 () Bool)

(assert (=> bm!21714 (= call!21717 (arrayNoDuplicates!0 (_keys!6397 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!38900 (Cons!3437 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000) Nil!3438) Nil!3438)))))

(declare-fun b!233703 () Bool)

(declare-fun e!151791 () Bool)

(assert (=> b!233703 (= e!151791 e!151792)))

(assert (=> b!233703 (= c!38900 (validKeyInArray!0 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233704 () Bool)

(assert (=> b!233704 (= e!151790 e!151791)))

(declare-fun res!114667 () Bool)

(assert (=> b!233704 (=> (not res!114667) (not e!151791))))

(assert (=> b!233704 (= res!114667 (not e!151793))))

(declare-fun res!114668 () Bool)

(assert (=> b!233704 (=> (not res!114668) (not e!151793))))

(assert (=> b!233704 (= res!114668 (validKeyInArray!0 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59033 (not res!114669)) b!233704))

(assert (= (and b!233704 res!114668) b!233702))

(assert (= (and b!233704 res!114667) b!233703))

(assert (= (and b!233703 c!38900) b!233700))

(assert (= (and b!233703 (not c!38900)) b!233701))

(assert (= (or b!233700 b!233701) bm!21714))

(assert (=> b!233702 m!254975))

(assert (=> b!233702 m!254975))

(declare-fun m!255243 () Bool)

(assert (=> b!233702 m!255243))

(assert (=> bm!21714 m!254975))

(declare-fun m!255245 () Bool)

(assert (=> bm!21714 m!255245))

(assert (=> b!233703 m!254975))

(assert (=> b!233703 m!254975))

(assert (=> b!233703 m!254979))

(assert (=> b!233704 m!254975))

(assert (=> b!233704 m!254975))

(assert (=> b!233704 m!254979))

(assert (=> b!233428 d!59033))

(declare-fun d!59035 () Bool)

(declare-fun res!114674 () Bool)

(declare-fun e!151798 () Bool)

(assert (=> d!59035 (=> res!114674 e!151798)))

(assert (=> d!59035 (= res!114674 (and ((_ is Cons!3435) (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) (= (_1!2278 (h!4083 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) key!932)))))

(assert (=> d!59035 (= (containsKey!254 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))) key!932) e!151798)))

(declare-fun b!233709 () Bool)

(declare-fun e!151799 () Bool)

(assert (=> b!233709 (= e!151798 e!151799)))

(declare-fun res!114675 () Bool)

(assert (=> b!233709 (=> (not res!114675) (not e!151799))))

(assert (=> b!233709 (= res!114675 (and (or (not ((_ is Cons!3435) (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) (bvsle (_1!2278 (h!4083 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) key!932)) ((_ is Cons!3435) (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) (bvslt (_1!2278 (h!4083 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504))))) key!932)))))

(declare-fun b!233710 () Bool)

(assert (=> b!233710 (= e!151799 (containsKey!254 (t!8392 (toList!1740 (getCurrentListMap!1272 (_keys!6397 thiss!1504) (_values!4325 thiss!1504) (mask!10268 thiss!1504) (extraKeys!4079 thiss!1504) (zeroValue!4183 thiss!1504) (minValue!4183 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4342 thiss!1504)))) key!932))))

(assert (= (and d!59035 (not res!114674)) b!233709))

(assert (= (and b!233709 res!114675) b!233710))

(declare-fun m!255247 () Bool)

(assert (=> b!233710 m!255247))

(assert (=> d!58955 d!59035))

(declare-fun d!59037 () Bool)

(assert (=> d!59037 (= (apply!204 lt!118126 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2820 (getValueByKey!263 (toList!1740 lt!118126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8679 () Bool)

(assert (= bs!8679 d!59037))

(assert (=> bs!8679 m!255085))

(assert (=> bs!8679 m!255085))

(declare-fun m!255249 () Bool)

(assert (=> bs!8679 m!255249))

(assert (=> b!233499 d!59037))

(declare-fun b!233719 () Bool)

(declare-fun e!151807 () Bool)

(declare-fun e!151806 () Bool)

(assert (=> b!233719 (= e!151807 e!151806)))

(declare-fun c!38903 () Bool)

(assert (=> b!233719 (= c!38903 (validKeyInArray!0 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233720 () Bool)

(declare-fun e!151808 () Bool)

(declare-fun call!21720 () Bool)

(assert (=> b!233720 (= e!151808 call!21720)))

(declare-fun bm!21717 () Bool)

(assert (=> bm!21717 (= call!21720 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6397 thiss!1504) (mask!10268 thiss!1504)))))

(declare-fun d!59039 () Bool)

(declare-fun res!114681 () Bool)

(assert (=> d!59039 (=> res!114681 e!151807)))

(assert (=> d!59039 (= res!114681 (bvsge #b00000000000000000000000000000000 (size!5825 (_keys!6397 thiss!1504))))))

(assert (=> d!59039 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6397 thiss!1504) (mask!10268 thiss!1504)) e!151807)))

(declare-fun b!233721 () Bool)

(assert (=> b!233721 (= e!151806 e!151808)))

(declare-fun lt!118265 () (_ BitVec 64))

(assert (=> b!233721 (= lt!118265 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118266 () Unit!7203)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11547 (_ BitVec 64) (_ BitVec 32)) Unit!7203)

(assert (=> b!233721 (= lt!118266 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6397 thiss!1504) lt!118265 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233721 (arrayContainsKey!0 (_keys!6397 thiss!1504) lt!118265 #b00000000000000000000000000000000)))

(declare-fun lt!118264 () Unit!7203)

(assert (=> b!233721 (= lt!118264 lt!118266)))

(declare-fun res!114680 () Bool)

(assert (=> b!233721 (= res!114680 (= (seekEntryOrOpen!0 (select (arr!5492 (_keys!6397 thiss!1504)) #b00000000000000000000000000000000) (_keys!6397 thiss!1504) (mask!10268 thiss!1504)) (Found!945 #b00000000000000000000000000000000)))))

(assert (=> b!233721 (=> (not res!114680) (not e!151808))))

(declare-fun b!233722 () Bool)

(assert (=> b!233722 (= e!151806 call!21720)))

(assert (= (and d!59039 (not res!114681)) b!233719))

(assert (= (and b!233719 c!38903) b!233721))

(assert (= (and b!233719 (not c!38903)) b!233722))

(assert (= (and b!233721 res!114680) b!233720))

(assert (= (or b!233720 b!233722) bm!21717))

(assert (=> b!233719 m!254975))

(assert (=> b!233719 m!254975))

(assert (=> b!233719 m!254979))

(declare-fun m!255251 () Bool)

(assert (=> bm!21717 m!255251))

(assert (=> b!233721 m!254975))

(declare-fun m!255253 () Bool)

(assert (=> b!233721 m!255253))

(declare-fun m!255255 () Bool)

(assert (=> b!233721 m!255255))

(assert (=> b!233721 m!254975))

(declare-fun m!255257 () Bool)

(assert (=> b!233721 m!255257))

(assert (=> b!233427 d!59039))

(declare-fun b!233724 () Bool)

(declare-fun e!151810 () Bool)

(assert (=> b!233724 (= e!151810 tp_is_empty!6151)))

(declare-fun mapIsEmpty!10409 () Bool)

(declare-fun mapRes!10409 () Bool)

(assert (=> mapIsEmpty!10409 mapRes!10409))

(declare-fun condMapEmpty!10409 () Bool)

(declare-fun mapDefault!10409 () ValueCell!2732)

(assert (=> mapNonEmpty!10408 (= condMapEmpty!10409 (= mapRest!10408 ((as const (Array (_ BitVec 32) ValueCell!2732)) mapDefault!10409)))))

(assert (=> mapNonEmpty!10408 (= tp!22027 (and e!151810 mapRes!10409))))

(declare-fun mapNonEmpty!10409 () Bool)

(declare-fun tp!22028 () Bool)

(declare-fun e!151809 () Bool)

(assert (=> mapNonEmpty!10409 (= mapRes!10409 (and tp!22028 e!151809))))

(declare-fun mapRest!10409 () (Array (_ BitVec 32) ValueCell!2732))

(declare-fun mapKey!10409 () (_ BitVec 32))

(declare-fun mapValue!10409 () ValueCell!2732)

(assert (=> mapNonEmpty!10409 (= mapRest!10408 (store mapRest!10409 mapKey!10409 mapValue!10409))))

(declare-fun b!233723 () Bool)

(assert (=> b!233723 (= e!151809 tp_is_empty!6151)))

(assert (= (and mapNonEmpty!10408 condMapEmpty!10409) mapIsEmpty!10409))

(assert (= (and mapNonEmpty!10408 (not condMapEmpty!10409)) mapNonEmpty!10409))

(assert (= (and mapNonEmpty!10409 ((_ is ValueCellFull!2732) mapValue!10409)) b!233723))

(assert (= (and mapNonEmpty!10408 ((_ is ValueCellFull!2732) mapDefault!10409)) b!233724))

(declare-fun m!255259 () Bool)

(assert (=> mapNonEmpty!10409 m!255259))

(declare-fun b_lambda!7877 () Bool)

(assert (= b_lambda!7875 (or (and b!233361 b_free!6289) b_lambda!7877)))

(declare-fun b_lambda!7879 () Bool)

(assert (= b_lambda!7873 (or (and b!233361 b_free!6289) b_lambda!7879)))

(check-sat (not b!233688) (not b!233670) (not d!58989) (not b!233676) (not b!233687) (not b!233674) (not b!233629) (not bm!21714) (not b!233702) (not d!59003) (not b!233673) tp_is_empty!6151 (not d!59037) (not d!59015) (not d!59021) (not d!58993) (not d!59009) (not b!233635) (not b!233678) (not bm!21717) (not b!233580) (not b!233668) (not b!233633) (not mapNonEmpty!10409) (not b!233547) (not b_next!6289) (not d!58985) (not d!59027) (not b_lambda!7879) (not b_lambda!7877) (not b!233719) (not d!59025) (not d!59007) b_and!13213 (not b!233622) (not b!233531) (not b!233710) (not d!59005) (not b!233620) (not b!233634) (not b!233537) (not b!233609) (not d!58977) (not b!233560) (not b_lambda!7871) (not bm!21708) (not b!233669) (not b!233679) (not b!233624) (not d!59001) (not b!233703) (not b!233682) (not b!233686) (not d!59013) (not d!58999) (not d!59029) (not b!233536) (not d!59019) (not d!58997) (not b!233606) (not b!233636) (not b!233721) (not d!59031) (not d!58995) (not b!233630) (not b!233529) (not b!233559) (not d!59011) (not b!233689) (not d!58987) (not d!58971) (not d!58967) (not d!59017) (not b!233632) (not bm!21711) (not b!233637) (not b!233704) (not b!233680) (not b!233607) (not d!58983) (not d!59023) (not b!233685) (not d!58979))
(check-sat b_and!13213 (not b_next!6289))
