; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22776 () Bool)

(assert start!22776)

(declare-fun b!237507 () Bool)

(declare-fun b_free!6379 () Bool)

(declare-fun b_next!6379 () Bool)

(assert (=> b!237507 (= b_free!6379 (not b_next!6379))))

(declare-fun tp!22327 () Bool)

(declare-fun b_and!13347 () Bool)

(assert (=> b!237507 (= tp!22327 b_and!13347)))

(declare-fun b!237499 () Bool)

(declare-fun res!116396 () Bool)

(declare-fun e!154220 () Bool)

(assert (=> b!237499 (=> (not res!116396) (not e!154220))))

(declare-datatypes ((V!7969 0))(
  ( (V!7970 (val!3165 Int)) )
))
(declare-datatypes ((ValueCell!2777 0))(
  ( (ValueCellFull!2777 (v!5200 V!7969)) (EmptyCell!2777) )
))
(declare-datatypes ((array!11751 0))(
  ( (array!11752 (arr!5581 (Array (_ BitVec 32) ValueCell!2777)) (size!5921 (_ BitVec 32))) )
))
(declare-datatypes ((array!11753 0))(
  ( (array!11754 (arr!5582 (Array (_ BitVec 32) (_ BitVec 64))) (size!5922 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3454 0))(
  ( (LongMapFixedSize!3455 (defaultEntry!4407 Int) (mask!10420 (_ BitVec 32)) (extraKeys!4144 (_ BitVec 32)) (zeroValue!4248 V!7969) (minValue!4248 V!7969) (_size!1776 (_ BitVec 32)) (_keys!6499 array!11753) (_values!4390 array!11751) (_vacant!1776 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3454)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4590 0))(
  ( (tuple2!4591 (_1!2306 (_ BitVec 64)) (_2!2306 V!7969)) )
))
(declare-datatypes ((List!3485 0))(
  ( (Nil!3482) (Cons!3481 (h!4136 tuple2!4590) (t!8464 List!3485)) )
))
(declare-datatypes ((ListLongMap!3505 0))(
  ( (ListLongMap!3506 (toList!1768 List!3485)) )
))
(declare-fun contains!1666 (ListLongMap!3505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1300 (array!11753 array!11751 (_ BitVec 32) (_ BitVec 32) V!7969 V!7969 (_ BitVec 32) Int) ListLongMap!3505)

(assert (=> b!237499 (= res!116396 (not (contains!1666 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)) key!932)))))

(declare-fun b!237500 () Bool)

(declare-fun res!116400 () Bool)

(declare-fun e!154225 () Bool)

(assert (=> b!237500 (=> (not res!116400) (not e!154225))))

(assert (=> b!237500 (= res!116400 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237501 () Bool)

(declare-fun e!154222 () Bool)

(declare-fun e!154224 () Bool)

(declare-fun mapRes!10580 () Bool)

(assert (=> b!237501 (= e!154222 (and e!154224 mapRes!10580))))

(declare-fun condMapEmpty!10580 () Bool)

(declare-fun mapDefault!10580 () ValueCell!2777)

(assert (=> b!237501 (= condMapEmpty!10580 (= (arr!5581 (_values!4390 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2777)) mapDefault!10580)))))

(declare-fun mapNonEmpty!10580 () Bool)

(declare-fun tp!22328 () Bool)

(declare-fun e!154219 () Bool)

(assert (=> mapNonEmpty!10580 (= mapRes!10580 (and tp!22328 e!154219))))

(declare-fun mapRest!10580 () (Array (_ BitVec 32) ValueCell!2777))

(declare-fun mapValue!10580 () ValueCell!2777)

(declare-fun mapKey!10580 () (_ BitVec 32))

(assert (=> mapNonEmpty!10580 (= (arr!5581 (_values!4390 thiss!1504)) (store mapRest!10580 mapKey!10580 mapValue!10580))))

(declare-fun b!237502 () Bool)

(assert (=> b!237502 (= e!154225 e!154220)))

(declare-fun res!116398 () Bool)

(assert (=> b!237502 (=> (not res!116398) (not e!154220))))

(declare-datatypes ((SeekEntryResult!981 0))(
  ( (MissingZero!981 (index!6094 (_ BitVec 32))) (Found!981 (index!6095 (_ BitVec 32))) (Intermediate!981 (undefined!1793 Bool) (index!6096 (_ BitVec 32)) (x!23933 (_ BitVec 32))) (Undefined!981) (MissingVacant!981 (index!6097 (_ BitVec 32))) )
))
(declare-fun lt!120144 () SeekEntryResult!981)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237502 (= res!116398 (or (= lt!120144 (MissingZero!981 index!297)) (= lt!120144 (MissingVacant!981 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11753 (_ BitVec 32)) SeekEntryResult!981)

(assert (=> b!237502 (= lt!120144 (seekEntryOrOpen!0 key!932 (_keys!6499 thiss!1504) (mask!10420 thiss!1504)))))

(declare-fun b!237503 () Bool)

(assert (=> b!237503 (= e!154220 (and (= (size!5921 (_values!4390 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10420 thiss!1504))) (= (size!5922 (_keys!6499 thiss!1504)) (size!5921 (_values!4390 thiss!1504))) (bvsge (mask!10420 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4144 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4144 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!10580 () Bool)

(assert (=> mapIsEmpty!10580 mapRes!10580))

(declare-fun b!237504 () Bool)

(declare-fun res!116399 () Bool)

(assert (=> b!237504 (=> (not res!116399) (not e!154220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237504 (= res!116399 (validMask!0 (mask!10420 thiss!1504)))))

(declare-fun b!237505 () Bool)

(declare-fun tp_is_empty!6241 () Bool)

(assert (=> b!237505 (= e!154224 tp_is_empty!6241)))

(declare-fun res!116397 () Bool)

(assert (=> start!22776 (=> (not res!116397) (not e!154225))))

(declare-fun valid!1377 (LongMapFixedSize!3454) Bool)

(assert (=> start!22776 (= res!116397 (valid!1377 thiss!1504))))

(assert (=> start!22776 e!154225))

(declare-fun e!154221 () Bool)

(assert (=> start!22776 e!154221))

(assert (=> start!22776 true))

(declare-fun b!237506 () Bool)

(assert (=> b!237506 (= e!154219 tp_is_empty!6241)))

(declare-fun array_inv!3667 (array!11753) Bool)

(declare-fun array_inv!3668 (array!11751) Bool)

(assert (=> b!237507 (= e!154221 (and tp!22327 tp_is_empty!6241 (array_inv!3667 (_keys!6499 thiss!1504)) (array_inv!3668 (_values!4390 thiss!1504)) e!154222))))

(assert (= (and start!22776 res!116397) b!237500))

(assert (= (and b!237500 res!116400) b!237502))

(assert (= (and b!237502 res!116398) b!237499))

(assert (= (and b!237499 res!116396) b!237504))

(assert (= (and b!237504 res!116399) b!237503))

(assert (= (and b!237501 condMapEmpty!10580) mapIsEmpty!10580))

(assert (= (and b!237501 (not condMapEmpty!10580)) mapNonEmpty!10580))

(get-info :version)

(assert (= (and mapNonEmpty!10580 ((_ is ValueCellFull!2777) mapValue!10580)) b!237506))

(assert (= (and b!237501 ((_ is ValueCellFull!2777) mapDefault!10580)) b!237505))

(assert (= b!237507 b!237501))

(assert (= start!22776 b!237507))

(declare-fun m!258403 () Bool)

(assert (=> b!237507 m!258403))

(declare-fun m!258405 () Bool)

(assert (=> b!237507 m!258405))

(declare-fun m!258407 () Bool)

(assert (=> b!237499 m!258407))

(assert (=> b!237499 m!258407))

(declare-fun m!258409 () Bool)

(assert (=> b!237499 m!258409))

(declare-fun m!258411 () Bool)

(assert (=> b!237504 m!258411))

(declare-fun m!258413 () Bool)

(assert (=> start!22776 m!258413))

(declare-fun m!258415 () Bool)

(assert (=> b!237502 m!258415))

(declare-fun m!258417 () Bool)

(assert (=> mapNonEmpty!10580 m!258417))

(check-sat b_and!13347 (not b!237502) tp_is_empty!6241 (not b!237499) (not b!237504) (not b!237507) (not mapNonEmpty!10580) (not b_next!6379) (not start!22776))
(check-sat b_and!13347 (not b_next!6379))
(get-model)

(declare-fun d!59695 () Bool)

(assert (=> d!59695 (= (array_inv!3667 (_keys!6499 thiss!1504)) (bvsge (size!5922 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237507 d!59695))

(declare-fun d!59697 () Bool)

(assert (=> d!59697 (= (array_inv!3668 (_values!4390 thiss!1504)) (bvsge (size!5921 (_values!4390 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237507 d!59697))

(declare-fun d!59699 () Bool)

(declare-fun e!154272 () Bool)

(assert (=> d!59699 e!154272))

(declare-fun res!116433 () Bool)

(assert (=> d!59699 (=> res!116433 e!154272)))

(declare-fun lt!120159 () Bool)

(assert (=> d!59699 (= res!116433 (not lt!120159))))

(declare-fun lt!120160 () Bool)

(assert (=> d!59699 (= lt!120159 lt!120160)))

(declare-datatypes ((Unit!7287 0))(
  ( (Unit!7288) )
))
(declare-fun lt!120162 () Unit!7287)

(declare-fun e!154273 () Unit!7287)

(assert (=> d!59699 (= lt!120162 e!154273)))

(declare-fun c!39611 () Bool)

(assert (=> d!59699 (= c!39611 lt!120160)))

(declare-fun containsKey!267 (List!3485 (_ BitVec 64)) Bool)

(assert (=> d!59699 (= lt!120160 (containsKey!267 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(assert (=> d!59699 (= (contains!1666 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)) key!932) lt!120159)))

(declare-fun b!237568 () Bool)

(declare-fun lt!120161 () Unit!7287)

(assert (=> b!237568 (= e!154273 lt!120161)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!215 (List!3485 (_ BitVec 64)) Unit!7287)

(assert (=> b!237568 (= lt!120161 (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(declare-datatypes ((Option!282 0))(
  ( (Some!281 (v!5203 V!7969)) (None!280) )
))
(declare-fun isDefined!216 (Option!282) Bool)

(declare-fun getValueByKey!276 (List!3485 (_ BitVec 64)) Option!282)

(assert (=> b!237568 (isDefined!216 (getValueByKey!276 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(declare-fun b!237569 () Bool)

(declare-fun Unit!7289 () Unit!7287)

(assert (=> b!237569 (= e!154273 Unit!7289)))

(declare-fun b!237570 () Bool)

(assert (=> b!237570 (= e!154272 (isDefined!216 (getValueByKey!276 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932)))))

(assert (= (and d!59699 c!39611) b!237568))

(assert (= (and d!59699 (not c!39611)) b!237569))

(assert (= (and d!59699 (not res!116433)) b!237570))

(declare-fun m!258451 () Bool)

(assert (=> d!59699 m!258451))

(declare-fun m!258453 () Bool)

(assert (=> b!237568 m!258453))

(declare-fun m!258455 () Bool)

(assert (=> b!237568 m!258455))

(assert (=> b!237568 m!258455))

(declare-fun m!258457 () Bool)

(assert (=> b!237568 m!258457))

(assert (=> b!237570 m!258455))

(assert (=> b!237570 m!258455))

(assert (=> b!237570 m!258457))

(assert (=> b!237499 d!59699))

(declare-fun bm!22071 () Bool)

(declare-fun call!22076 () ListLongMap!3505)

(declare-fun call!22075 () ListLongMap!3505)

(assert (=> bm!22071 (= call!22076 call!22075)))

(declare-fun b!237613 () Bool)

(declare-fun e!154303 () ListLongMap!3505)

(declare-fun e!154311 () ListLongMap!3505)

(assert (=> b!237613 (= e!154303 e!154311)))

(declare-fun c!39629 () Bool)

(assert (=> b!237613 (= c!39629 (and (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237614 () Bool)

(declare-fun e!154302 () ListLongMap!3505)

(declare-fun call!22078 () ListLongMap!3505)

(assert (=> b!237614 (= e!154302 call!22078)))

(declare-fun bm!22072 () Bool)

(declare-fun call!22074 () ListLongMap!3505)

(declare-fun getCurrentListMapNoExtraKeys!533 (array!11753 array!11751 (_ BitVec 32) (_ BitVec 32) V!7969 V!7969 (_ BitVec 32) Int) ListLongMap!3505)

(assert (=> bm!22072 (= call!22074 (getCurrentListMapNoExtraKeys!533 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))

(declare-fun b!237615 () Bool)

(declare-fun e!154312 () Unit!7287)

(declare-fun Unit!7290 () Unit!7287)

(assert (=> b!237615 (= e!154312 Unit!7290)))

(declare-fun b!237616 () Bool)

(declare-fun e!154305 () Bool)

(declare-fun lt!120212 () ListLongMap!3505)

(declare-fun apply!217 (ListLongMap!3505 (_ BitVec 64)) V!7969)

(declare-fun get!2883 (ValueCell!2777 V!7969) V!7969)

(declare-fun dynLambda!560 (Int (_ BitVec 64)) V!7969)

(assert (=> b!237616 (= e!154305 (= (apply!217 lt!120212 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)) (get!2883 (select (arr!5581 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237616 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5921 (_values!4390 thiss!1504))))))

(assert (=> b!237616 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(declare-fun d!59701 () Bool)

(declare-fun e!154301 () Bool)

(assert (=> d!59701 e!154301))

(declare-fun res!116453 () Bool)

(assert (=> d!59701 (=> (not res!116453) (not e!154301))))

(assert (=> d!59701 (= res!116453 (or (bvsge #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))))

(declare-fun lt!120214 () ListLongMap!3505)

(assert (=> d!59701 (= lt!120212 lt!120214)))

(declare-fun lt!120207 () Unit!7287)

(assert (=> d!59701 (= lt!120207 e!154312)))

(declare-fun c!39624 () Bool)

(declare-fun e!154309 () Bool)

(assert (=> d!59701 (= c!39624 e!154309)))

(declare-fun res!116454 () Bool)

(assert (=> d!59701 (=> (not res!116454) (not e!154309))))

(assert (=> d!59701 (= res!116454 (bvslt #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(assert (=> d!59701 (= lt!120214 e!154303)))

(declare-fun c!39626 () Bool)

(assert (=> d!59701 (= c!39626 (and (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59701 (validMask!0 (mask!10420 thiss!1504))))

(assert (=> d!59701 (= (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)) lt!120212)))

(declare-fun b!237617 () Bool)

(declare-fun e!154300 () Bool)

(declare-fun call!22079 () Bool)

(assert (=> b!237617 (= e!154300 (not call!22079))))

(declare-fun b!237618 () Bool)

(declare-fun res!116458 () Bool)

(assert (=> b!237618 (=> (not res!116458) (not e!154301))))

(assert (=> b!237618 (= res!116458 e!154300)))

(declare-fun c!39628 () Bool)

(assert (=> b!237618 (= c!39628 (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!237619 () Bool)

(declare-fun e!154308 () Bool)

(declare-fun call!22080 () Bool)

(assert (=> b!237619 (= e!154308 (not call!22080))))

(declare-fun b!237620 () Bool)

(declare-fun lt!120223 () Unit!7287)

(assert (=> b!237620 (= e!154312 lt!120223)))

(declare-fun lt!120221 () ListLongMap!3505)

(assert (=> b!237620 (= lt!120221 (getCurrentListMapNoExtraKeys!533 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))

(declare-fun lt!120220 () (_ BitVec 64))

(assert (=> b!237620 (= lt!120220 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120228 () (_ BitVec 64))

(assert (=> b!237620 (= lt!120228 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120224 () Unit!7287)

(declare-fun addStillContains!193 (ListLongMap!3505 (_ BitVec 64) V!7969 (_ BitVec 64)) Unit!7287)

(assert (=> b!237620 (= lt!120224 (addStillContains!193 lt!120221 lt!120220 (zeroValue!4248 thiss!1504) lt!120228))))

(declare-fun +!644 (ListLongMap!3505 tuple2!4590) ListLongMap!3505)

(assert (=> b!237620 (contains!1666 (+!644 lt!120221 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504))) lt!120228)))

(declare-fun lt!120217 () Unit!7287)

(assert (=> b!237620 (= lt!120217 lt!120224)))

(declare-fun lt!120225 () ListLongMap!3505)

(assert (=> b!237620 (= lt!120225 (getCurrentListMapNoExtraKeys!533 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))

(declare-fun lt!120209 () (_ BitVec 64))

(assert (=> b!237620 (= lt!120209 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120211 () (_ BitVec 64))

(assert (=> b!237620 (= lt!120211 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120222 () Unit!7287)

(declare-fun addApplyDifferent!193 (ListLongMap!3505 (_ BitVec 64) V!7969 (_ BitVec 64)) Unit!7287)

(assert (=> b!237620 (= lt!120222 (addApplyDifferent!193 lt!120225 lt!120209 (minValue!4248 thiss!1504) lt!120211))))

(assert (=> b!237620 (= (apply!217 (+!644 lt!120225 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504))) lt!120211) (apply!217 lt!120225 lt!120211))))

(declare-fun lt!120213 () Unit!7287)

(assert (=> b!237620 (= lt!120213 lt!120222)))

(declare-fun lt!120227 () ListLongMap!3505)

(assert (=> b!237620 (= lt!120227 (getCurrentListMapNoExtraKeys!533 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))

(declare-fun lt!120226 () (_ BitVec 64))

(assert (=> b!237620 (= lt!120226 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120210 () (_ BitVec 64))

(assert (=> b!237620 (= lt!120210 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120216 () Unit!7287)

(assert (=> b!237620 (= lt!120216 (addApplyDifferent!193 lt!120227 lt!120226 (zeroValue!4248 thiss!1504) lt!120210))))

(assert (=> b!237620 (= (apply!217 (+!644 lt!120227 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504))) lt!120210) (apply!217 lt!120227 lt!120210))))

(declare-fun lt!120219 () Unit!7287)

(assert (=> b!237620 (= lt!120219 lt!120216)))

(declare-fun lt!120215 () ListLongMap!3505)

(assert (=> b!237620 (= lt!120215 (getCurrentListMapNoExtraKeys!533 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))

(declare-fun lt!120218 () (_ BitVec 64))

(assert (=> b!237620 (= lt!120218 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120208 () (_ BitVec 64))

(assert (=> b!237620 (= lt!120208 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237620 (= lt!120223 (addApplyDifferent!193 lt!120215 lt!120218 (minValue!4248 thiss!1504) lt!120208))))

(assert (=> b!237620 (= (apply!217 (+!644 lt!120215 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504))) lt!120208) (apply!217 lt!120215 lt!120208))))

(declare-fun b!237621 () Bool)

(declare-fun res!116460 () Bool)

(assert (=> b!237621 (=> (not res!116460) (not e!154301))))

(declare-fun e!154310 () Bool)

(assert (=> b!237621 (= res!116460 e!154310)))

(declare-fun res!116455 () Bool)

(assert (=> b!237621 (=> res!116455 e!154310)))

(declare-fun e!154306 () Bool)

(assert (=> b!237621 (= res!116455 (not e!154306))))

(declare-fun res!116457 () Bool)

(assert (=> b!237621 (=> (not res!116457) (not e!154306))))

(assert (=> b!237621 (= res!116457 (bvslt #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(declare-fun call!22077 () ListLongMap!3505)

(declare-fun bm!22073 () Bool)

(assert (=> bm!22073 (= call!22077 (+!644 (ite c!39626 call!22074 (ite c!39629 call!22075 call!22076)) (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(declare-fun bm!22074 () Bool)

(assert (=> bm!22074 (= call!22079 (contains!1666 lt!120212 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237622 () Bool)

(declare-fun e!154307 () Bool)

(assert (=> b!237622 (= e!154307 (= (apply!217 lt!120212 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4248 thiss!1504)))))

(declare-fun b!237623 () Bool)

(assert (=> b!237623 (= e!154302 call!22076)))

(declare-fun bm!22075 () Bool)

(assert (=> bm!22075 (= call!22080 (contains!1666 lt!120212 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237624 () Bool)

(declare-fun e!154304 () Bool)

(assert (=> b!237624 (= e!154304 (= (apply!217 lt!120212 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4248 thiss!1504)))))

(declare-fun bm!22076 () Bool)

(assert (=> bm!22076 (= call!22075 call!22074)))

(declare-fun bm!22077 () Bool)

(assert (=> bm!22077 (= call!22078 call!22077)))

(declare-fun b!237625 () Bool)

(declare-fun c!39625 () Bool)

(assert (=> b!237625 (= c!39625 (and (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!237625 (= e!154311 e!154302)))

(declare-fun b!237626 () Bool)

(assert (=> b!237626 (= e!154303 (+!644 call!22077 (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))

(declare-fun b!237627 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!237627 (= e!154306 (validKeyInArray!0 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237628 () Bool)

(assert (=> b!237628 (= e!154311 call!22078)))

(declare-fun b!237629 () Bool)

(assert (=> b!237629 (= e!154308 e!154307)))

(declare-fun res!116456 () Bool)

(assert (=> b!237629 (= res!116456 call!22080)))

(assert (=> b!237629 (=> (not res!116456) (not e!154307))))

(declare-fun b!237630 () Bool)

(assert (=> b!237630 (= e!154309 (validKeyInArray!0 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237631 () Bool)

(assert (=> b!237631 (= e!154301 e!154308)))

(declare-fun c!39627 () Bool)

(assert (=> b!237631 (= c!39627 (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237632 () Bool)

(assert (=> b!237632 (= e!154300 e!154304)))

(declare-fun res!116459 () Bool)

(assert (=> b!237632 (= res!116459 call!22079)))

(assert (=> b!237632 (=> (not res!116459) (not e!154304))))

(declare-fun b!237633 () Bool)

(assert (=> b!237633 (= e!154310 e!154305)))

(declare-fun res!116452 () Bool)

(assert (=> b!237633 (=> (not res!116452) (not e!154305))))

(assert (=> b!237633 (= res!116452 (contains!1666 lt!120212 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237633 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(assert (= (and d!59701 c!39626) b!237626))

(assert (= (and d!59701 (not c!39626)) b!237613))

(assert (= (and b!237613 c!39629) b!237628))

(assert (= (and b!237613 (not c!39629)) b!237625))

(assert (= (and b!237625 c!39625) b!237614))

(assert (= (and b!237625 (not c!39625)) b!237623))

(assert (= (or b!237614 b!237623) bm!22071))

(assert (= (or b!237628 bm!22071) bm!22076))

(assert (= (or b!237628 b!237614) bm!22077))

(assert (= (or b!237626 bm!22076) bm!22072))

(assert (= (or b!237626 bm!22077) bm!22073))

(assert (= (and d!59701 res!116454) b!237630))

(assert (= (and d!59701 c!39624) b!237620))

(assert (= (and d!59701 (not c!39624)) b!237615))

(assert (= (and d!59701 res!116453) b!237621))

(assert (= (and b!237621 res!116457) b!237627))

(assert (= (and b!237621 (not res!116455)) b!237633))

(assert (= (and b!237633 res!116452) b!237616))

(assert (= (and b!237621 res!116460) b!237618))

(assert (= (and b!237618 c!39628) b!237632))

(assert (= (and b!237618 (not c!39628)) b!237617))

(assert (= (and b!237632 res!116459) b!237624))

(assert (= (or b!237632 b!237617) bm!22074))

(assert (= (and b!237618 res!116458) b!237631))

(assert (= (and b!237631 c!39627) b!237629))

(assert (= (and b!237631 (not c!39627)) b!237619))

(assert (= (and b!237629 res!116456) b!237622))

(assert (= (or b!237629 b!237619) bm!22075))

(declare-fun b_lambda!7977 () Bool)

(assert (=> (not b_lambda!7977) (not b!237616)))

(declare-fun t!8467 () Bool)

(declare-fun tb!2939 () Bool)

(assert (=> (and b!237507 (= (defaultEntry!4407 thiss!1504) (defaultEntry!4407 thiss!1504)) t!8467) tb!2939))

(declare-fun result!5155 () Bool)

(assert (=> tb!2939 (= result!5155 tp_is_empty!6241)))

(assert (=> b!237616 t!8467))

(declare-fun b_and!13353 () Bool)

(assert (= b_and!13347 (and (=> t!8467 result!5155) b_and!13353)))

(declare-fun m!258459 () Bool)

(assert (=> b!237626 m!258459))

(declare-fun m!258461 () Bool)

(assert (=> b!237622 m!258461))

(declare-fun m!258463 () Bool)

(assert (=> bm!22075 m!258463))

(declare-fun m!258465 () Bool)

(assert (=> b!237630 m!258465))

(assert (=> b!237630 m!258465))

(declare-fun m!258467 () Bool)

(assert (=> b!237630 m!258467))

(declare-fun m!258469 () Bool)

(assert (=> bm!22073 m!258469))

(assert (=> d!59701 m!258411))

(assert (=> b!237633 m!258465))

(assert (=> b!237633 m!258465))

(declare-fun m!258471 () Bool)

(assert (=> b!237633 m!258471))

(declare-fun m!258473 () Bool)

(assert (=> bm!22074 m!258473))

(declare-fun m!258475 () Bool)

(assert (=> b!237616 m!258475))

(assert (=> b!237616 m!258465))

(assert (=> b!237616 m!258475))

(declare-fun m!258477 () Bool)

(assert (=> b!237616 m!258477))

(declare-fun m!258479 () Bool)

(assert (=> b!237616 m!258479))

(assert (=> b!237616 m!258477))

(assert (=> b!237616 m!258465))

(declare-fun m!258481 () Bool)

(assert (=> b!237616 m!258481))

(assert (=> b!237627 m!258465))

(assert (=> b!237627 m!258465))

(assert (=> b!237627 m!258467))

(declare-fun m!258483 () Bool)

(assert (=> bm!22072 m!258483))

(declare-fun m!258485 () Bool)

(assert (=> b!237624 m!258485))

(assert (=> b!237620 m!258465))

(declare-fun m!258487 () Bool)

(assert (=> b!237620 m!258487))

(declare-fun m!258489 () Bool)

(assert (=> b!237620 m!258489))

(declare-fun m!258491 () Bool)

(assert (=> b!237620 m!258491))

(declare-fun m!258493 () Bool)

(assert (=> b!237620 m!258493))

(declare-fun m!258495 () Bool)

(assert (=> b!237620 m!258495))

(assert (=> b!237620 m!258483))

(declare-fun m!258497 () Bool)

(assert (=> b!237620 m!258497))

(declare-fun m!258499 () Bool)

(assert (=> b!237620 m!258499))

(declare-fun m!258501 () Bool)

(assert (=> b!237620 m!258501))

(assert (=> b!237620 m!258491))

(declare-fun m!258503 () Bool)

(assert (=> b!237620 m!258503))

(declare-fun m!258505 () Bool)

(assert (=> b!237620 m!258505))

(declare-fun m!258507 () Bool)

(assert (=> b!237620 m!258507))

(declare-fun m!258509 () Bool)

(assert (=> b!237620 m!258509))

(assert (=> b!237620 m!258505))

(declare-fun m!258511 () Bool)

(assert (=> b!237620 m!258511))

(declare-fun m!258513 () Bool)

(assert (=> b!237620 m!258513))

(declare-fun m!258515 () Bool)

(assert (=> b!237620 m!258515))

(assert (=> b!237620 m!258487))

(assert (=> b!237620 m!258507))

(assert (=> b!237499 d!59701))

(declare-fun d!59703 () Bool)

(assert (=> d!59703 (= (validMask!0 (mask!10420 thiss!1504)) (and (or (= (mask!10420 thiss!1504) #b00000000000000000000000000000111) (= (mask!10420 thiss!1504) #b00000000000000000000000000001111) (= (mask!10420 thiss!1504) #b00000000000000000000000000011111) (= (mask!10420 thiss!1504) #b00000000000000000000000000111111) (= (mask!10420 thiss!1504) #b00000000000000000000000001111111) (= (mask!10420 thiss!1504) #b00000000000000000000000011111111) (= (mask!10420 thiss!1504) #b00000000000000000000000111111111) (= (mask!10420 thiss!1504) #b00000000000000000000001111111111) (= (mask!10420 thiss!1504) #b00000000000000000000011111111111) (= (mask!10420 thiss!1504) #b00000000000000000000111111111111) (= (mask!10420 thiss!1504) #b00000000000000000001111111111111) (= (mask!10420 thiss!1504) #b00000000000000000011111111111111) (= (mask!10420 thiss!1504) #b00000000000000000111111111111111) (= (mask!10420 thiss!1504) #b00000000000000001111111111111111) (= (mask!10420 thiss!1504) #b00000000000000011111111111111111) (= (mask!10420 thiss!1504) #b00000000000000111111111111111111) (= (mask!10420 thiss!1504) #b00000000000001111111111111111111) (= (mask!10420 thiss!1504) #b00000000000011111111111111111111) (= (mask!10420 thiss!1504) #b00000000000111111111111111111111) (= (mask!10420 thiss!1504) #b00000000001111111111111111111111) (= (mask!10420 thiss!1504) #b00000000011111111111111111111111) (= (mask!10420 thiss!1504) #b00000000111111111111111111111111) (= (mask!10420 thiss!1504) #b00000001111111111111111111111111) (= (mask!10420 thiss!1504) #b00000011111111111111111111111111) (= (mask!10420 thiss!1504) #b00000111111111111111111111111111) (= (mask!10420 thiss!1504) #b00001111111111111111111111111111) (= (mask!10420 thiss!1504) #b00011111111111111111111111111111) (= (mask!10420 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10420 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!237504 d!59703))

(declare-fun d!59705 () Bool)

(declare-fun res!116467 () Bool)

(declare-fun e!154315 () Bool)

(assert (=> d!59705 (=> (not res!116467) (not e!154315))))

(declare-fun simpleValid!240 (LongMapFixedSize!3454) Bool)

(assert (=> d!59705 (= res!116467 (simpleValid!240 thiss!1504))))

(assert (=> d!59705 (= (valid!1377 thiss!1504) e!154315)))

(declare-fun b!237642 () Bool)

(declare-fun res!116468 () Bool)

(assert (=> b!237642 (=> (not res!116468) (not e!154315))))

(declare-fun arrayCountValidKeys!0 (array!11753 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237642 (= res!116468 (= (arrayCountValidKeys!0 (_keys!6499 thiss!1504) #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))) (_size!1776 thiss!1504)))))

(declare-fun b!237643 () Bool)

(declare-fun res!116469 () Bool)

(assert (=> b!237643 (=> (not res!116469) (not e!154315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11753 (_ BitVec 32)) Bool)

(assert (=> b!237643 (= res!116469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6499 thiss!1504) (mask!10420 thiss!1504)))))

(declare-fun b!237644 () Bool)

(declare-datatypes ((List!3487 0))(
  ( (Nil!3484) (Cons!3483 (h!4138 (_ BitVec 64)) (t!8468 List!3487)) )
))
(declare-fun arrayNoDuplicates!0 (array!11753 (_ BitVec 32) List!3487) Bool)

(assert (=> b!237644 (= e!154315 (arrayNoDuplicates!0 (_keys!6499 thiss!1504) #b00000000000000000000000000000000 Nil!3484))))

(assert (= (and d!59705 res!116467) b!237642))

(assert (= (and b!237642 res!116468) b!237643))

(assert (= (and b!237643 res!116469) b!237644))

(declare-fun m!258517 () Bool)

(assert (=> d!59705 m!258517))

(declare-fun m!258519 () Bool)

(assert (=> b!237642 m!258519))

(declare-fun m!258521 () Bool)

(assert (=> b!237643 m!258521))

(declare-fun m!258523 () Bool)

(assert (=> b!237644 m!258523))

(assert (=> start!22776 d!59705))

(declare-fun d!59707 () Bool)

(declare-fun lt!120237 () SeekEntryResult!981)

(assert (=> d!59707 (and (or ((_ is Undefined!981) lt!120237) (not ((_ is Found!981) lt!120237)) (and (bvsge (index!6095 lt!120237) #b00000000000000000000000000000000) (bvslt (index!6095 lt!120237) (size!5922 (_keys!6499 thiss!1504))))) (or ((_ is Undefined!981) lt!120237) ((_ is Found!981) lt!120237) (not ((_ is MissingZero!981) lt!120237)) (and (bvsge (index!6094 lt!120237) #b00000000000000000000000000000000) (bvslt (index!6094 lt!120237) (size!5922 (_keys!6499 thiss!1504))))) (or ((_ is Undefined!981) lt!120237) ((_ is Found!981) lt!120237) ((_ is MissingZero!981) lt!120237) (not ((_ is MissingVacant!981) lt!120237)) (and (bvsge (index!6097 lt!120237) #b00000000000000000000000000000000) (bvslt (index!6097 lt!120237) (size!5922 (_keys!6499 thiss!1504))))) (or ((_ is Undefined!981) lt!120237) (ite ((_ is Found!981) lt!120237) (= (select (arr!5582 (_keys!6499 thiss!1504)) (index!6095 lt!120237)) key!932) (ite ((_ is MissingZero!981) lt!120237) (= (select (arr!5582 (_keys!6499 thiss!1504)) (index!6094 lt!120237)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!981) lt!120237) (= (select (arr!5582 (_keys!6499 thiss!1504)) (index!6097 lt!120237)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!154324 () SeekEntryResult!981)

(assert (=> d!59707 (= lt!120237 e!154324)))

(declare-fun c!39636 () Bool)

(declare-fun lt!120235 () SeekEntryResult!981)

(assert (=> d!59707 (= c!39636 (and ((_ is Intermediate!981) lt!120235) (undefined!1793 lt!120235)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11753 (_ BitVec 32)) SeekEntryResult!981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59707 (= lt!120235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10420 thiss!1504)) key!932 (_keys!6499 thiss!1504) (mask!10420 thiss!1504)))))

(assert (=> d!59707 (validMask!0 (mask!10420 thiss!1504))))

(assert (=> d!59707 (= (seekEntryOrOpen!0 key!932 (_keys!6499 thiss!1504) (mask!10420 thiss!1504)) lt!120237)))

(declare-fun b!237657 () Bool)

(declare-fun c!39638 () Bool)

(declare-fun lt!120236 () (_ BitVec 64))

(assert (=> b!237657 (= c!39638 (= lt!120236 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154322 () SeekEntryResult!981)

(declare-fun e!154323 () SeekEntryResult!981)

(assert (=> b!237657 (= e!154322 e!154323)))

(declare-fun b!237658 () Bool)

(assert (=> b!237658 (= e!154324 Undefined!981)))

(declare-fun b!237659 () Bool)

(assert (=> b!237659 (= e!154322 (Found!981 (index!6096 lt!120235)))))

(declare-fun b!237660 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11753 (_ BitVec 32)) SeekEntryResult!981)

(assert (=> b!237660 (= e!154323 (seekKeyOrZeroReturnVacant!0 (x!23933 lt!120235) (index!6096 lt!120235) (index!6096 lt!120235) key!932 (_keys!6499 thiss!1504) (mask!10420 thiss!1504)))))

(declare-fun b!237661 () Bool)

(assert (=> b!237661 (= e!154324 e!154322)))

(assert (=> b!237661 (= lt!120236 (select (arr!5582 (_keys!6499 thiss!1504)) (index!6096 lt!120235)))))

(declare-fun c!39637 () Bool)

(assert (=> b!237661 (= c!39637 (= lt!120236 key!932))))

(declare-fun b!237662 () Bool)

(assert (=> b!237662 (= e!154323 (MissingZero!981 (index!6096 lt!120235)))))

(assert (= (and d!59707 c!39636) b!237658))

(assert (= (and d!59707 (not c!39636)) b!237661))

(assert (= (and b!237661 c!39637) b!237659))

(assert (= (and b!237661 (not c!39637)) b!237657))

(assert (= (and b!237657 c!39638) b!237662))

(assert (= (and b!237657 (not c!39638)) b!237660))

(declare-fun m!258525 () Bool)

(assert (=> d!59707 m!258525))

(assert (=> d!59707 m!258411))

(declare-fun m!258527 () Bool)

(assert (=> d!59707 m!258527))

(declare-fun m!258529 () Bool)

(assert (=> d!59707 m!258529))

(assert (=> d!59707 m!258527))

(declare-fun m!258531 () Bool)

(assert (=> d!59707 m!258531))

(declare-fun m!258533 () Bool)

(assert (=> d!59707 m!258533))

(declare-fun m!258535 () Bool)

(assert (=> b!237660 m!258535))

(declare-fun m!258537 () Bool)

(assert (=> b!237661 m!258537))

(assert (=> b!237502 d!59707))

(declare-fun b!237670 () Bool)

(declare-fun e!154329 () Bool)

(assert (=> b!237670 (= e!154329 tp_is_empty!6241)))

(declare-fun mapNonEmpty!10589 () Bool)

(declare-fun mapRes!10589 () Bool)

(declare-fun tp!22343 () Bool)

(declare-fun e!154330 () Bool)

(assert (=> mapNonEmpty!10589 (= mapRes!10589 (and tp!22343 e!154330))))

(declare-fun mapKey!10589 () (_ BitVec 32))

(declare-fun mapValue!10589 () ValueCell!2777)

(declare-fun mapRest!10589 () (Array (_ BitVec 32) ValueCell!2777))

(assert (=> mapNonEmpty!10589 (= mapRest!10580 (store mapRest!10589 mapKey!10589 mapValue!10589))))

(declare-fun condMapEmpty!10589 () Bool)

(declare-fun mapDefault!10589 () ValueCell!2777)

(assert (=> mapNonEmpty!10580 (= condMapEmpty!10589 (= mapRest!10580 ((as const (Array (_ BitVec 32) ValueCell!2777)) mapDefault!10589)))))

(assert (=> mapNonEmpty!10580 (= tp!22328 (and e!154329 mapRes!10589))))

(declare-fun mapIsEmpty!10589 () Bool)

(assert (=> mapIsEmpty!10589 mapRes!10589))

(declare-fun b!237669 () Bool)

(assert (=> b!237669 (= e!154330 tp_is_empty!6241)))

(assert (= (and mapNonEmpty!10580 condMapEmpty!10589) mapIsEmpty!10589))

(assert (= (and mapNonEmpty!10580 (not condMapEmpty!10589)) mapNonEmpty!10589))

(assert (= (and mapNonEmpty!10589 ((_ is ValueCellFull!2777) mapValue!10589)) b!237669))

(assert (= (and mapNonEmpty!10580 ((_ is ValueCellFull!2777) mapDefault!10589)) b!237670))

(declare-fun m!258539 () Bool)

(assert (=> mapNonEmpty!10589 m!258539))

(declare-fun b_lambda!7979 () Bool)

(assert (= b_lambda!7977 (or (and b!237507 b_free!6379) b_lambda!7979)))

(check-sat (not bm!22075) (not b!237643) (not b!237626) (not b!237620) (not d!59705) (not d!59699) (not d!59707) (not b!237622) (not b!237644) (not b!237630) (not b!237627) (not bm!22074) (not b!237616) (not b!237642) (not b!237660) (not bm!22072) tp_is_empty!6241 (not mapNonEmpty!10589) b_and!13353 (not b!237568) (not bm!22073) (not b_lambda!7979) (not d!59701) (not b!237633) (not b_next!6379) (not b!237624) (not b!237570))
(check-sat b_and!13353 (not b_next!6379))
(get-model)

(assert (=> d!59701 d!59703))

(declare-fun d!59709 () Bool)

(declare-fun isEmpty!524 (Option!282) Bool)

(assert (=> d!59709 (= (isDefined!216 (getValueByKey!276 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932)) (not (isEmpty!524 (getValueByKey!276 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))))

(declare-fun bs!8791 () Bool)

(assert (= bs!8791 d!59709))

(assert (=> bs!8791 m!258455))

(declare-fun m!258541 () Bool)

(assert (=> bs!8791 m!258541))

(assert (=> b!237570 d!59709))

(declare-fun b!237682 () Bool)

(declare-fun e!154336 () Option!282)

(assert (=> b!237682 (= e!154336 None!280)))

(declare-fun d!59711 () Bool)

(declare-fun c!39643 () Bool)

(assert (=> d!59711 (= c!39643 (and ((_ is Cons!3481) (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) (= (_1!2306 (h!4136 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) key!932)))))

(declare-fun e!154335 () Option!282)

(assert (=> d!59711 (= (getValueByKey!276 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932) e!154335)))

(declare-fun b!237681 () Bool)

(assert (=> b!237681 (= e!154336 (getValueByKey!276 (t!8464 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) key!932))))

(declare-fun b!237679 () Bool)

(assert (=> b!237679 (= e!154335 (Some!281 (_2!2306 (h!4136 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))))))

(declare-fun b!237680 () Bool)

(assert (=> b!237680 (= e!154335 e!154336)))

(declare-fun c!39644 () Bool)

(assert (=> b!237680 (= c!39644 (and ((_ is Cons!3481) (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) (not (= (_1!2306 (h!4136 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) key!932))))))

(assert (= (and d!59711 c!39643) b!237679))

(assert (= (and d!59711 (not c!39643)) b!237680))

(assert (= (and b!237680 c!39644) b!237681))

(assert (= (and b!237680 (not c!39644)) b!237682))

(declare-fun m!258543 () Bool)

(assert (=> b!237681 m!258543))

(assert (=> b!237570 d!59711))

(declare-fun d!59713 () Bool)

(declare-fun get!2884 (Option!282) V!7969)

(assert (=> d!59713 (= (apply!217 lt!120225 lt!120211) (get!2884 (getValueByKey!276 (toList!1768 lt!120225) lt!120211)))))

(declare-fun bs!8792 () Bool)

(assert (= bs!8792 d!59713))

(declare-fun m!258545 () Bool)

(assert (=> bs!8792 m!258545))

(assert (=> bs!8792 m!258545))

(declare-fun m!258547 () Bool)

(assert (=> bs!8792 m!258547))

(assert (=> b!237620 d!59713))

(declare-fun d!59715 () Bool)

(assert (=> d!59715 (= (apply!217 (+!644 lt!120225 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504))) lt!120211) (apply!217 lt!120225 lt!120211))))

(declare-fun lt!120240 () Unit!7287)

(declare-fun choose!1120 (ListLongMap!3505 (_ BitVec 64) V!7969 (_ BitVec 64)) Unit!7287)

(assert (=> d!59715 (= lt!120240 (choose!1120 lt!120225 lt!120209 (minValue!4248 thiss!1504) lt!120211))))

(declare-fun e!154339 () Bool)

(assert (=> d!59715 e!154339))

(declare-fun res!116472 () Bool)

(assert (=> d!59715 (=> (not res!116472) (not e!154339))))

(assert (=> d!59715 (= res!116472 (contains!1666 lt!120225 lt!120211))))

(assert (=> d!59715 (= (addApplyDifferent!193 lt!120225 lt!120209 (minValue!4248 thiss!1504) lt!120211) lt!120240)))

(declare-fun b!237686 () Bool)

(assert (=> b!237686 (= e!154339 (not (= lt!120211 lt!120209)))))

(assert (= (and d!59715 res!116472) b!237686))

(assert (=> d!59715 m!258487))

(assert (=> d!59715 m!258489))

(assert (=> d!59715 m!258487))

(declare-fun m!258549 () Bool)

(assert (=> d!59715 m!258549))

(declare-fun m!258551 () Bool)

(assert (=> d!59715 m!258551))

(assert (=> d!59715 m!258497))

(assert (=> b!237620 d!59715))

(declare-fun d!59717 () Bool)

(assert (=> d!59717 (= (apply!217 (+!644 lt!120227 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504))) lt!120210) (apply!217 lt!120227 lt!120210))))

(declare-fun lt!120241 () Unit!7287)

(assert (=> d!59717 (= lt!120241 (choose!1120 lt!120227 lt!120226 (zeroValue!4248 thiss!1504) lt!120210))))

(declare-fun e!154340 () Bool)

(assert (=> d!59717 e!154340))

(declare-fun res!116473 () Bool)

(assert (=> d!59717 (=> (not res!116473) (not e!154340))))

(assert (=> d!59717 (= res!116473 (contains!1666 lt!120227 lt!120210))))

(assert (=> d!59717 (= (addApplyDifferent!193 lt!120227 lt!120226 (zeroValue!4248 thiss!1504) lt!120210) lt!120241)))

(declare-fun b!237687 () Bool)

(assert (=> b!237687 (= e!154340 (not (= lt!120210 lt!120226)))))

(assert (= (and d!59717 res!116473) b!237687))

(assert (=> d!59717 m!258507))

(assert (=> d!59717 m!258509))

(assert (=> d!59717 m!258507))

(declare-fun m!258553 () Bool)

(assert (=> d!59717 m!258553))

(declare-fun m!258555 () Bool)

(assert (=> d!59717 m!258555))

(assert (=> d!59717 m!258495))

(assert (=> b!237620 d!59717))

(declare-fun d!59719 () Bool)

(declare-fun e!154341 () Bool)

(assert (=> d!59719 e!154341))

(declare-fun res!116474 () Bool)

(assert (=> d!59719 (=> res!116474 e!154341)))

(declare-fun lt!120242 () Bool)

(assert (=> d!59719 (= res!116474 (not lt!120242))))

(declare-fun lt!120243 () Bool)

(assert (=> d!59719 (= lt!120242 lt!120243)))

(declare-fun lt!120245 () Unit!7287)

(declare-fun e!154342 () Unit!7287)

(assert (=> d!59719 (= lt!120245 e!154342)))

(declare-fun c!39645 () Bool)

(assert (=> d!59719 (= c!39645 lt!120243)))

(assert (=> d!59719 (= lt!120243 (containsKey!267 (toList!1768 (+!644 lt!120221 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504)))) lt!120228))))

(assert (=> d!59719 (= (contains!1666 (+!644 lt!120221 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504))) lt!120228) lt!120242)))

(declare-fun b!237688 () Bool)

(declare-fun lt!120244 () Unit!7287)

(assert (=> b!237688 (= e!154342 lt!120244)))

(assert (=> b!237688 (= lt!120244 (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1768 (+!644 lt!120221 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504)))) lt!120228))))

(assert (=> b!237688 (isDefined!216 (getValueByKey!276 (toList!1768 (+!644 lt!120221 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504)))) lt!120228))))

(declare-fun b!237689 () Bool)

(declare-fun Unit!7291 () Unit!7287)

(assert (=> b!237689 (= e!154342 Unit!7291)))

(declare-fun b!237690 () Bool)

(assert (=> b!237690 (= e!154341 (isDefined!216 (getValueByKey!276 (toList!1768 (+!644 lt!120221 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504)))) lt!120228)))))

(assert (= (and d!59719 c!39645) b!237688))

(assert (= (and d!59719 (not c!39645)) b!237689))

(assert (= (and d!59719 (not res!116474)) b!237690))

(declare-fun m!258557 () Bool)

(assert (=> d!59719 m!258557))

(declare-fun m!258559 () Bool)

(assert (=> b!237688 m!258559))

(declare-fun m!258561 () Bool)

(assert (=> b!237688 m!258561))

(assert (=> b!237688 m!258561))

(declare-fun m!258563 () Bool)

(assert (=> b!237688 m!258563))

(assert (=> b!237690 m!258561))

(assert (=> b!237690 m!258561))

(assert (=> b!237690 m!258563))

(assert (=> b!237620 d!59719))

(declare-fun d!59721 () Bool)

(assert (=> d!59721 (= (apply!217 (+!644 lt!120215 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504))) lt!120208) (apply!217 lt!120215 lt!120208))))

(declare-fun lt!120246 () Unit!7287)

(assert (=> d!59721 (= lt!120246 (choose!1120 lt!120215 lt!120218 (minValue!4248 thiss!1504) lt!120208))))

(declare-fun e!154343 () Bool)

(assert (=> d!59721 e!154343))

(declare-fun res!116475 () Bool)

(assert (=> d!59721 (=> (not res!116475) (not e!154343))))

(assert (=> d!59721 (= res!116475 (contains!1666 lt!120215 lt!120208))))

(assert (=> d!59721 (= (addApplyDifferent!193 lt!120215 lt!120218 (minValue!4248 thiss!1504) lt!120208) lt!120246)))

(declare-fun b!237691 () Bool)

(assert (=> b!237691 (= e!154343 (not (= lt!120208 lt!120218)))))

(assert (= (and d!59721 res!116475) b!237691))

(assert (=> d!59721 m!258491))

(assert (=> d!59721 m!258493))

(assert (=> d!59721 m!258491))

(declare-fun m!258565 () Bool)

(assert (=> d!59721 m!258565))

(declare-fun m!258567 () Bool)

(assert (=> d!59721 m!258567))

(assert (=> d!59721 m!258499))

(assert (=> b!237620 d!59721))

(declare-fun d!59723 () Bool)

(assert (=> d!59723 (contains!1666 (+!644 lt!120221 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504))) lt!120228)))

(declare-fun lt!120249 () Unit!7287)

(declare-fun choose!1121 (ListLongMap!3505 (_ BitVec 64) V!7969 (_ BitVec 64)) Unit!7287)

(assert (=> d!59723 (= lt!120249 (choose!1121 lt!120221 lt!120220 (zeroValue!4248 thiss!1504) lt!120228))))

(assert (=> d!59723 (contains!1666 lt!120221 lt!120228)))

(assert (=> d!59723 (= (addStillContains!193 lt!120221 lt!120220 (zeroValue!4248 thiss!1504) lt!120228) lt!120249)))

(declare-fun bs!8793 () Bool)

(assert (= bs!8793 d!59723))

(assert (=> bs!8793 m!258505))

(assert (=> bs!8793 m!258505))

(assert (=> bs!8793 m!258511))

(declare-fun m!258569 () Bool)

(assert (=> bs!8793 m!258569))

(declare-fun m!258571 () Bool)

(assert (=> bs!8793 m!258571))

(assert (=> b!237620 d!59723))

(declare-fun d!59725 () Bool)

(assert (=> d!59725 (= (apply!217 (+!644 lt!120225 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504))) lt!120211) (get!2884 (getValueByKey!276 (toList!1768 (+!644 lt!120225 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504)))) lt!120211)))))

(declare-fun bs!8794 () Bool)

(assert (= bs!8794 d!59725))

(declare-fun m!258573 () Bool)

(assert (=> bs!8794 m!258573))

(assert (=> bs!8794 m!258573))

(declare-fun m!258575 () Bool)

(assert (=> bs!8794 m!258575))

(assert (=> b!237620 d!59725))

(declare-fun d!59727 () Bool)

(declare-fun e!154346 () Bool)

(assert (=> d!59727 e!154346))

(declare-fun res!116480 () Bool)

(assert (=> d!59727 (=> (not res!116480) (not e!154346))))

(declare-fun lt!120258 () ListLongMap!3505)

(assert (=> d!59727 (= res!116480 (contains!1666 lt!120258 (_1!2306 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504)))))))

(declare-fun lt!120260 () List!3485)

(assert (=> d!59727 (= lt!120258 (ListLongMap!3506 lt!120260))))

(declare-fun lt!120259 () Unit!7287)

(declare-fun lt!120261 () Unit!7287)

(assert (=> d!59727 (= lt!120259 lt!120261)))

(assert (=> d!59727 (= (getValueByKey!276 lt!120260 (_1!2306 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504)))) (Some!281 (_2!2306 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!155 (List!3485 (_ BitVec 64) V!7969) Unit!7287)

(assert (=> d!59727 (= lt!120261 (lemmaContainsTupThenGetReturnValue!155 lt!120260 (_1!2306 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504))) (_2!2306 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504)))))))

(declare-fun insertStrictlySorted!158 (List!3485 (_ BitVec 64) V!7969) List!3485)

(assert (=> d!59727 (= lt!120260 (insertStrictlySorted!158 (toList!1768 lt!120215) (_1!2306 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504))) (_2!2306 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504)))))))

(assert (=> d!59727 (= (+!644 lt!120215 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504))) lt!120258)))

(declare-fun b!237697 () Bool)

(declare-fun res!116481 () Bool)

(assert (=> b!237697 (=> (not res!116481) (not e!154346))))

(assert (=> b!237697 (= res!116481 (= (getValueByKey!276 (toList!1768 lt!120258) (_1!2306 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504)))) (Some!281 (_2!2306 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504))))))))

(declare-fun b!237698 () Bool)

(declare-fun contains!1668 (List!3485 tuple2!4590) Bool)

(assert (=> b!237698 (= e!154346 (contains!1668 (toList!1768 lt!120258) (tuple2!4591 lt!120218 (minValue!4248 thiss!1504))))))

(assert (= (and d!59727 res!116480) b!237697))

(assert (= (and b!237697 res!116481) b!237698))

(declare-fun m!258577 () Bool)

(assert (=> d!59727 m!258577))

(declare-fun m!258579 () Bool)

(assert (=> d!59727 m!258579))

(declare-fun m!258581 () Bool)

(assert (=> d!59727 m!258581))

(declare-fun m!258583 () Bool)

(assert (=> d!59727 m!258583))

(declare-fun m!258585 () Bool)

(assert (=> b!237697 m!258585))

(declare-fun m!258587 () Bool)

(assert (=> b!237698 m!258587))

(assert (=> b!237620 d!59727))

(declare-fun d!59729 () Bool)

(assert (=> d!59729 (= (apply!217 (+!644 lt!120227 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504))) lt!120210) (get!2884 (getValueByKey!276 (toList!1768 (+!644 lt!120227 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504)))) lt!120210)))))

(declare-fun bs!8795 () Bool)

(assert (= bs!8795 d!59729))

(declare-fun m!258589 () Bool)

(assert (=> bs!8795 m!258589))

(assert (=> bs!8795 m!258589))

(declare-fun m!258591 () Bool)

(assert (=> bs!8795 m!258591))

(assert (=> b!237620 d!59729))

(declare-fun d!59731 () Bool)

(assert (=> d!59731 (= (apply!217 lt!120227 lt!120210) (get!2884 (getValueByKey!276 (toList!1768 lt!120227) lt!120210)))))

(declare-fun bs!8796 () Bool)

(assert (= bs!8796 d!59731))

(declare-fun m!258593 () Bool)

(assert (=> bs!8796 m!258593))

(assert (=> bs!8796 m!258593))

(declare-fun m!258595 () Bool)

(assert (=> bs!8796 m!258595))

(assert (=> b!237620 d!59731))

(declare-fun d!59733 () Bool)

(declare-fun e!154347 () Bool)

(assert (=> d!59733 e!154347))

(declare-fun res!116482 () Bool)

(assert (=> d!59733 (=> (not res!116482) (not e!154347))))

(declare-fun lt!120262 () ListLongMap!3505)

(assert (=> d!59733 (= res!116482 (contains!1666 lt!120262 (_1!2306 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504)))))))

(declare-fun lt!120264 () List!3485)

(assert (=> d!59733 (= lt!120262 (ListLongMap!3506 lt!120264))))

(declare-fun lt!120263 () Unit!7287)

(declare-fun lt!120265 () Unit!7287)

(assert (=> d!59733 (= lt!120263 lt!120265)))

(assert (=> d!59733 (= (getValueByKey!276 lt!120264 (_1!2306 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504)))) (Some!281 (_2!2306 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59733 (= lt!120265 (lemmaContainsTupThenGetReturnValue!155 lt!120264 (_1!2306 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504))) (_2!2306 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59733 (= lt!120264 (insertStrictlySorted!158 (toList!1768 lt!120221) (_1!2306 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504))) (_2!2306 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59733 (= (+!644 lt!120221 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504))) lt!120262)))

(declare-fun b!237699 () Bool)

(declare-fun res!116483 () Bool)

(assert (=> b!237699 (=> (not res!116483) (not e!154347))))

(assert (=> b!237699 (= res!116483 (= (getValueByKey!276 (toList!1768 lt!120262) (_1!2306 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504)))) (Some!281 (_2!2306 (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504))))))))

(declare-fun b!237700 () Bool)

(assert (=> b!237700 (= e!154347 (contains!1668 (toList!1768 lt!120262) (tuple2!4591 lt!120220 (zeroValue!4248 thiss!1504))))))

(assert (= (and d!59733 res!116482) b!237699))

(assert (= (and b!237699 res!116483) b!237700))

(declare-fun m!258597 () Bool)

(assert (=> d!59733 m!258597))

(declare-fun m!258599 () Bool)

(assert (=> d!59733 m!258599))

(declare-fun m!258601 () Bool)

(assert (=> d!59733 m!258601))

(declare-fun m!258603 () Bool)

(assert (=> d!59733 m!258603))

(declare-fun m!258605 () Bool)

(assert (=> b!237699 m!258605))

(declare-fun m!258607 () Bool)

(assert (=> b!237700 m!258607))

(assert (=> b!237620 d!59733))

(declare-fun d!59735 () Bool)

(declare-fun e!154348 () Bool)

(assert (=> d!59735 e!154348))

(declare-fun res!116484 () Bool)

(assert (=> d!59735 (=> (not res!116484) (not e!154348))))

(declare-fun lt!120266 () ListLongMap!3505)

(assert (=> d!59735 (= res!116484 (contains!1666 lt!120266 (_1!2306 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504)))))))

(declare-fun lt!120268 () List!3485)

(assert (=> d!59735 (= lt!120266 (ListLongMap!3506 lt!120268))))

(declare-fun lt!120267 () Unit!7287)

(declare-fun lt!120269 () Unit!7287)

(assert (=> d!59735 (= lt!120267 lt!120269)))

(assert (=> d!59735 (= (getValueByKey!276 lt!120268 (_1!2306 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504)))) (Some!281 (_2!2306 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59735 (= lt!120269 (lemmaContainsTupThenGetReturnValue!155 lt!120268 (_1!2306 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504))) (_2!2306 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59735 (= lt!120268 (insertStrictlySorted!158 (toList!1768 lt!120227) (_1!2306 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504))) (_2!2306 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59735 (= (+!644 lt!120227 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504))) lt!120266)))

(declare-fun b!237701 () Bool)

(declare-fun res!116485 () Bool)

(assert (=> b!237701 (=> (not res!116485) (not e!154348))))

(assert (=> b!237701 (= res!116485 (= (getValueByKey!276 (toList!1768 lt!120266) (_1!2306 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504)))) (Some!281 (_2!2306 (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504))))))))

(declare-fun b!237702 () Bool)

(assert (=> b!237702 (= e!154348 (contains!1668 (toList!1768 lt!120266) (tuple2!4591 lt!120226 (zeroValue!4248 thiss!1504))))))

(assert (= (and d!59735 res!116484) b!237701))

(assert (= (and b!237701 res!116485) b!237702))

(declare-fun m!258609 () Bool)

(assert (=> d!59735 m!258609))

(declare-fun m!258611 () Bool)

(assert (=> d!59735 m!258611))

(declare-fun m!258613 () Bool)

(assert (=> d!59735 m!258613))

(declare-fun m!258615 () Bool)

(assert (=> d!59735 m!258615))

(declare-fun m!258617 () Bool)

(assert (=> b!237701 m!258617))

(declare-fun m!258619 () Bool)

(assert (=> b!237702 m!258619))

(assert (=> b!237620 d!59735))

(declare-fun b!237727 () Bool)

(declare-fun e!154364 () ListLongMap!3505)

(assert (=> b!237727 (= e!154364 (ListLongMap!3506 Nil!3482))))

(declare-fun b!237728 () Bool)

(declare-fun lt!120284 () Unit!7287)

(declare-fun lt!120289 () Unit!7287)

(assert (=> b!237728 (= lt!120284 lt!120289)))

(declare-fun lt!120290 () V!7969)

(declare-fun lt!120287 () (_ BitVec 64))

(declare-fun lt!120286 () ListLongMap!3505)

(declare-fun lt!120288 () (_ BitVec 64))

(assert (=> b!237728 (not (contains!1666 (+!644 lt!120286 (tuple2!4591 lt!120287 lt!120290)) lt!120288))))

(declare-fun addStillNotContains!120 (ListLongMap!3505 (_ BitVec 64) V!7969 (_ BitVec 64)) Unit!7287)

(assert (=> b!237728 (= lt!120289 (addStillNotContains!120 lt!120286 lt!120287 lt!120290 lt!120288))))

(assert (=> b!237728 (= lt!120288 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!237728 (= lt!120290 (get!2883 (select (arr!5581 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!237728 (= lt!120287 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!22083 () ListLongMap!3505)

(assert (=> b!237728 (= lt!120286 call!22083)))

(declare-fun e!154363 () ListLongMap!3505)

(assert (=> b!237728 (= e!154363 (+!644 call!22083 (tuple2!4591 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000) (get!2883 (select (arr!5581 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!237729 () Bool)

(declare-fun e!154366 () Bool)

(declare-fun e!154365 () Bool)

(assert (=> b!237729 (= e!154366 e!154365)))

(declare-fun c!39654 () Bool)

(declare-fun e!154367 () Bool)

(assert (=> b!237729 (= c!39654 e!154367)))

(declare-fun res!116496 () Bool)

(assert (=> b!237729 (=> (not res!116496) (not e!154367))))

(assert (=> b!237729 (= res!116496 (bvslt #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(declare-fun b!237730 () Bool)

(assert (=> b!237730 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(assert (=> b!237730 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5921 (_values!4390 thiss!1504))))))

(declare-fun e!154368 () Bool)

(declare-fun lt!120285 () ListLongMap!3505)

(assert (=> b!237730 (= e!154368 (= (apply!217 lt!120285 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)) (get!2883 (select (arr!5581 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237731 () Bool)

(declare-fun e!154369 () Bool)

(declare-fun isEmpty!525 (ListLongMap!3505) Bool)

(assert (=> b!237731 (= e!154369 (isEmpty!525 lt!120285))))

(declare-fun b!237732 () Bool)

(assert (=> b!237732 (= e!154364 e!154363)))

(declare-fun c!39656 () Bool)

(assert (=> b!237732 (= c!39656 (validKeyInArray!0 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237733 () Bool)

(assert (=> b!237733 (= e!154365 e!154369)))

(declare-fun c!39655 () Bool)

(assert (=> b!237733 (= c!39655 (bvslt #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(declare-fun b!237734 () Bool)

(assert (=> b!237734 (= e!154369 (= lt!120285 (getCurrentListMapNoExtraKeys!533 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4407 thiss!1504))))))

(declare-fun bm!22080 () Bool)

(assert (=> bm!22080 (= call!22083 (getCurrentListMapNoExtraKeys!533 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4407 thiss!1504)))))

(declare-fun b!237735 () Bool)

(assert (=> b!237735 (= e!154367 (validKeyInArray!0 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237735 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!59737 () Bool)

(assert (=> d!59737 e!154366))

(declare-fun res!116494 () Bool)

(assert (=> d!59737 (=> (not res!116494) (not e!154366))))

(assert (=> d!59737 (= res!116494 (not (contains!1666 lt!120285 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59737 (= lt!120285 e!154364)))

(declare-fun c!39657 () Bool)

(assert (=> d!59737 (= c!39657 (bvsge #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(assert (=> d!59737 (validMask!0 (mask!10420 thiss!1504))))

(assert (=> d!59737 (= (getCurrentListMapNoExtraKeys!533 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)) lt!120285)))

(declare-fun b!237736 () Bool)

(declare-fun res!116495 () Bool)

(assert (=> b!237736 (=> (not res!116495) (not e!154366))))

(assert (=> b!237736 (= res!116495 (not (contains!1666 lt!120285 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237737 () Bool)

(assert (=> b!237737 (= e!154363 call!22083)))

(declare-fun b!237738 () Bool)

(assert (=> b!237738 (= e!154365 e!154368)))

(assert (=> b!237738 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(declare-fun res!116497 () Bool)

(assert (=> b!237738 (= res!116497 (contains!1666 lt!120285 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237738 (=> (not res!116497) (not e!154368))))

(assert (= (and d!59737 c!39657) b!237727))

(assert (= (and d!59737 (not c!39657)) b!237732))

(assert (= (and b!237732 c!39656) b!237728))

(assert (= (and b!237732 (not c!39656)) b!237737))

(assert (= (or b!237728 b!237737) bm!22080))

(assert (= (and d!59737 res!116494) b!237736))

(assert (= (and b!237736 res!116495) b!237729))

(assert (= (and b!237729 res!116496) b!237735))

(assert (= (and b!237729 c!39654) b!237738))

(assert (= (and b!237729 (not c!39654)) b!237733))

(assert (= (and b!237738 res!116497) b!237730))

(assert (= (and b!237733 c!39655) b!237734))

(assert (= (and b!237733 (not c!39655)) b!237731))

(declare-fun b_lambda!7981 () Bool)

(assert (=> (not b_lambda!7981) (not b!237728)))

(assert (=> b!237728 t!8467))

(declare-fun b_and!13355 () Bool)

(assert (= b_and!13353 (and (=> t!8467 result!5155) b_and!13355)))

(declare-fun b_lambda!7983 () Bool)

(assert (=> (not b_lambda!7983) (not b!237730)))

(assert (=> b!237730 t!8467))

(declare-fun b_and!13357 () Bool)

(assert (= b_and!13355 (and (=> t!8467 result!5155) b_and!13357)))

(declare-fun m!258621 () Bool)

(assert (=> b!237734 m!258621))

(assert (=> b!237730 m!258475))

(assert (=> b!237730 m!258477))

(assert (=> b!237730 m!258475))

(assert (=> b!237730 m!258477))

(assert (=> b!237730 m!258479))

(assert (=> b!237730 m!258465))

(declare-fun m!258623 () Bool)

(assert (=> b!237730 m!258623))

(assert (=> b!237730 m!258465))

(assert (=> b!237735 m!258465))

(assert (=> b!237735 m!258465))

(assert (=> b!237735 m!258467))

(declare-fun m!258625 () Bool)

(assert (=> b!237728 m!258625))

(declare-fun m!258627 () Bool)

(assert (=> b!237728 m!258627))

(declare-fun m!258629 () Bool)

(assert (=> b!237728 m!258629))

(assert (=> b!237728 m!258475))

(declare-fun m!258631 () Bool)

(assert (=> b!237728 m!258631))

(assert (=> b!237728 m!258475))

(assert (=> b!237728 m!258477))

(assert (=> b!237728 m!258479))

(assert (=> b!237728 m!258465))

(assert (=> b!237728 m!258477))

(assert (=> b!237728 m!258627))

(assert (=> bm!22080 m!258621))

(declare-fun m!258633 () Bool)

(assert (=> d!59737 m!258633))

(assert (=> d!59737 m!258411))

(declare-fun m!258635 () Bool)

(assert (=> b!237731 m!258635))

(declare-fun m!258637 () Bool)

(assert (=> b!237736 m!258637))

(assert (=> b!237732 m!258465))

(assert (=> b!237732 m!258465))

(assert (=> b!237732 m!258467))

(assert (=> b!237738 m!258465))

(assert (=> b!237738 m!258465))

(declare-fun m!258639 () Bool)

(assert (=> b!237738 m!258639))

(assert (=> b!237620 d!59737))

(declare-fun d!59739 () Bool)

(declare-fun e!154370 () Bool)

(assert (=> d!59739 e!154370))

(declare-fun res!116498 () Bool)

(assert (=> d!59739 (=> (not res!116498) (not e!154370))))

(declare-fun lt!120291 () ListLongMap!3505)

(assert (=> d!59739 (= res!116498 (contains!1666 lt!120291 (_1!2306 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504)))))))

(declare-fun lt!120293 () List!3485)

(assert (=> d!59739 (= lt!120291 (ListLongMap!3506 lt!120293))))

(declare-fun lt!120292 () Unit!7287)

(declare-fun lt!120294 () Unit!7287)

(assert (=> d!59739 (= lt!120292 lt!120294)))

(assert (=> d!59739 (= (getValueByKey!276 lt!120293 (_1!2306 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504)))) (Some!281 (_2!2306 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504)))))))

(assert (=> d!59739 (= lt!120294 (lemmaContainsTupThenGetReturnValue!155 lt!120293 (_1!2306 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504))) (_2!2306 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504)))))))

(assert (=> d!59739 (= lt!120293 (insertStrictlySorted!158 (toList!1768 lt!120225) (_1!2306 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504))) (_2!2306 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504)))))))

(assert (=> d!59739 (= (+!644 lt!120225 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504))) lt!120291)))

(declare-fun b!237739 () Bool)

(declare-fun res!116499 () Bool)

(assert (=> b!237739 (=> (not res!116499) (not e!154370))))

(assert (=> b!237739 (= res!116499 (= (getValueByKey!276 (toList!1768 lt!120291) (_1!2306 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504)))) (Some!281 (_2!2306 (tuple2!4591 lt!120209 (minValue!4248 thiss!1504))))))))

(declare-fun b!237740 () Bool)

(assert (=> b!237740 (= e!154370 (contains!1668 (toList!1768 lt!120291) (tuple2!4591 lt!120209 (minValue!4248 thiss!1504))))))

(assert (= (and d!59739 res!116498) b!237739))

(assert (= (and b!237739 res!116499) b!237740))

(declare-fun m!258641 () Bool)

(assert (=> d!59739 m!258641))

(declare-fun m!258643 () Bool)

(assert (=> d!59739 m!258643))

(declare-fun m!258645 () Bool)

(assert (=> d!59739 m!258645))

(declare-fun m!258647 () Bool)

(assert (=> d!59739 m!258647))

(declare-fun m!258649 () Bool)

(assert (=> b!237739 m!258649))

(declare-fun m!258651 () Bool)

(assert (=> b!237740 m!258651))

(assert (=> b!237620 d!59739))

(declare-fun d!59741 () Bool)

(assert (=> d!59741 (= (apply!217 lt!120215 lt!120208) (get!2884 (getValueByKey!276 (toList!1768 lt!120215) lt!120208)))))

(declare-fun bs!8797 () Bool)

(assert (= bs!8797 d!59741))

(declare-fun m!258653 () Bool)

(assert (=> bs!8797 m!258653))

(assert (=> bs!8797 m!258653))

(declare-fun m!258655 () Bool)

(assert (=> bs!8797 m!258655))

(assert (=> b!237620 d!59741))

(declare-fun d!59743 () Bool)

(assert (=> d!59743 (= (apply!217 (+!644 lt!120215 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504))) lt!120208) (get!2884 (getValueByKey!276 (toList!1768 (+!644 lt!120215 (tuple2!4591 lt!120218 (minValue!4248 thiss!1504)))) lt!120208)))))

(declare-fun bs!8798 () Bool)

(assert (= bs!8798 d!59743))

(declare-fun m!258657 () Bool)

(assert (=> bs!8798 m!258657))

(assert (=> bs!8798 m!258657))

(declare-fun m!258659 () Bool)

(assert (=> bs!8798 m!258659))

(assert (=> b!237620 d!59743))

(declare-fun b!237751 () Bool)

(declare-fun e!154382 () Bool)

(declare-fun e!154380 () Bool)

(assert (=> b!237751 (= e!154382 e!154380)))

(declare-fun res!116508 () Bool)

(assert (=> b!237751 (=> (not res!116508) (not e!154380))))

(declare-fun e!154381 () Bool)

(assert (=> b!237751 (= res!116508 (not e!154381))))

(declare-fun res!116506 () Bool)

(assert (=> b!237751 (=> (not res!116506) (not e!154381))))

(assert (=> b!237751 (= res!116506 (validKeyInArray!0 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237752 () Bool)

(declare-fun e!154379 () Bool)

(declare-fun call!22086 () Bool)

(assert (=> b!237752 (= e!154379 call!22086)))

(declare-fun b!237753 () Bool)

(assert (=> b!237753 (= e!154379 call!22086)))

(declare-fun b!237754 () Bool)

(assert (=> b!237754 (= e!154380 e!154379)))

(declare-fun c!39660 () Bool)

(assert (=> b!237754 (= c!39660 (validKeyInArray!0 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59745 () Bool)

(declare-fun res!116507 () Bool)

(assert (=> d!59745 (=> res!116507 e!154382)))

(assert (=> d!59745 (= res!116507 (bvsge #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(assert (=> d!59745 (= (arrayNoDuplicates!0 (_keys!6499 thiss!1504) #b00000000000000000000000000000000 Nil!3484) e!154382)))

(declare-fun bm!22083 () Bool)

(assert (=> bm!22083 (= call!22086 (arrayNoDuplicates!0 (_keys!6499 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39660 (Cons!3483 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000) Nil!3484) Nil!3484)))))

(declare-fun b!237755 () Bool)

(declare-fun contains!1669 (List!3487 (_ BitVec 64)) Bool)

(assert (=> b!237755 (= e!154381 (contains!1669 Nil!3484 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59745 (not res!116507)) b!237751))

(assert (= (and b!237751 res!116506) b!237755))

(assert (= (and b!237751 res!116508) b!237754))

(assert (= (and b!237754 c!39660) b!237753))

(assert (= (and b!237754 (not c!39660)) b!237752))

(assert (= (or b!237753 b!237752) bm!22083))

(assert (=> b!237751 m!258465))

(assert (=> b!237751 m!258465))

(assert (=> b!237751 m!258467))

(assert (=> b!237754 m!258465))

(assert (=> b!237754 m!258465))

(assert (=> b!237754 m!258467))

(assert (=> bm!22083 m!258465))

(declare-fun m!258661 () Bool)

(assert (=> bm!22083 m!258661))

(assert (=> b!237755 m!258465))

(assert (=> b!237755 m!258465))

(declare-fun m!258663 () Bool)

(assert (=> b!237755 m!258663))

(assert (=> b!237644 d!59745))

(declare-fun d!59747 () Bool)

(declare-fun e!154383 () Bool)

(assert (=> d!59747 e!154383))

(declare-fun res!116509 () Bool)

(assert (=> d!59747 (=> res!116509 e!154383)))

(declare-fun lt!120295 () Bool)

(assert (=> d!59747 (= res!116509 (not lt!120295))))

(declare-fun lt!120296 () Bool)

(assert (=> d!59747 (= lt!120295 lt!120296)))

(declare-fun lt!120298 () Unit!7287)

(declare-fun e!154384 () Unit!7287)

(assert (=> d!59747 (= lt!120298 e!154384)))

(declare-fun c!39661 () Bool)

(assert (=> d!59747 (= c!39661 lt!120296)))

(assert (=> d!59747 (= lt!120296 (containsKey!267 (toList!1768 lt!120212) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59747 (= (contains!1666 lt!120212 #b1000000000000000000000000000000000000000000000000000000000000000) lt!120295)))

(declare-fun b!237756 () Bool)

(declare-fun lt!120297 () Unit!7287)

(assert (=> b!237756 (= e!154384 lt!120297)))

(assert (=> b!237756 (= lt!120297 (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1768 lt!120212) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237756 (isDefined!216 (getValueByKey!276 (toList!1768 lt!120212) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237757 () Bool)

(declare-fun Unit!7292 () Unit!7287)

(assert (=> b!237757 (= e!154384 Unit!7292)))

(declare-fun b!237758 () Bool)

(assert (=> b!237758 (= e!154383 (isDefined!216 (getValueByKey!276 (toList!1768 lt!120212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59747 c!39661) b!237756))

(assert (= (and d!59747 (not c!39661)) b!237757))

(assert (= (and d!59747 (not res!116509)) b!237758))

(declare-fun m!258665 () Bool)

(assert (=> d!59747 m!258665))

(declare-fun m!258667 () Bool)

(assert (=> b!237756 m!258667))

(declare-fun m!258669 () Bool)

(assert (=> b!237756 m!258669))

(assert (=> b!237756 m!258669))

(declare-fun m!258671 () Bool)

(assert (=> b!237756 m!258671))

(assert (=> b!237758 m!258669))

(assert (=> b!237758 m!258669))

(assert (=> b!237758 m!258671))

(assert (=> bm!22075 d!59747))

(declare-fun d!59749 () Bool)

(assert (=> d!59749 (= (apply!217 lt!120212 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)) (get!2884 (getValueByKey!276 (toList!1768 lt!120212) (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8799 () Bool)

(assert (= bs!8799 d!59749))

(assert (=> bs!8799 m!258465))

(declare-fun m!258673 () Bool)

(assert (=> bs!8799 m!258673))

(assert (=> bs!8799 m!258673))

(declare-fun m!258675 () Bool)

(assert (=> bs!8799 m!258675))

(assert (=> b!237616 d!59749))

(declare-fun d!59751 () Bool)

(declare-fun c!39664 () Bool)

(assert (=> d!59751 (= c!39664 ((_ is ValueCellFull!2777) (select (arr!5581 (_values!4390 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!154387 () V!7969)

(assert (=> d!59751 (= (get!2883 (select (arr!5581 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!154387)))

(declare-fun b!237763 () Bool)

(declare-fun get!2885 (ValueCell!2777 V!7969) V!7969)

(assert (=> b!237763 (= e!154387 (get!2885 (select (arr!5581 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237764 () Bool)

(declare-fun get!2886 (ValueCell!2777 V!7969) V!7969)

(assert (=> b!237764 (= e!154387 (get!2886 (select (arr!5581 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59751 c!39664) b!237763))

(assert (= (and d!59751 (not c!39664)) b!237764))

(assert (=> b!237763 m!258475))

(assert (=> b!237763 m!258477))

(declare-fun m!258677 () Bool)

(assert (=> b!237763 m!258677))

(assert (=> b!237764 m!258475))

(assert (=> b!237764 m!258477))

(declare-fun m!258679 () Bool)

(assert (=> b!237764 m!258679))

(assert (=> b!237616 d!59751))

(declare-fun d!59753 () Bool)

(assert (=> d!59753 (= (apply!217 lt!120212 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2884 (getValueByKey!276 (toList!1768 lt!120212) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8800 () Bool)

(assert (= bs!8800 d!59753))

(declare-fun m!258681 () Bool)

(assert (=> bs!8800 m!258681))

(assert (=> bs!8800 m!258681))

(declare-fun m!258683 () Bool)

(assert (=> bs!8800 m!258683))

(assert (=> b!237624 d!59753))

(declare-fun d!59755 () Bool)

(declare-fun e!154388 () Bool)

(assert (=> d!59755 e!154388))

(declare-fun res!116510 () Bool)

(assert (=> d!59755 (=> res!116510 e!154388)))

(declare-fun lt!120299 () Bool)

(assert (=> d!59755 (= res!116510 (not lt!120299))))

(declare-fun lt!120300 () Bool)

(assert (=> d!59755 (= lt!120299 lt!120300)))

(declare-fun lt!120302 () Unit!7287)

(declare-fun e!154389 () Unit!7287)

(assert (=> d!59755 (= lt!120302 e!154389)))

(declare-fun c!39665 () Bool)

(assert (=> d!59755 (= c!39665 lt!120300)))

(assert (=> d!59755 (= lt!120300 (containsKey!267 (toList!1768 lt!120212) (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59755 (= (contains!1666 lt!120212 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)) lt!120299)))

(declare-fun b!237765 () Bool)

(declare-fun lt!120301 () Unit!7287)

(assert (=> b!237765 (= e!154389 lt!120301)))

(assert (=> b!237765 (= lt!120301 (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1768 lt!120212) (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237765 (isDefined!216 (getValueByKey!276 (toList!1768 lt!120212) (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237766 () Bool)

(declare-fun Unit!7293 () Unit!7287)

(assert (=> b!237766 (= e!154389 Unit!7293)))

(declare-fun b!237767 () Bool)

(assert (=> b!237767 (= e!154388 (isDefined!216 (getValueByKey!276 (toList!1768 lt!120212) (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59755 c!39665) b!237765))

(assert (= (and d!59755 (not c!39665)) b!237766))

(assert (= (and d!59755 (not res!116510)) b!237767))

(assert (=> d!59755 m!258465))

(declare-fun m!258685 () Bool)

(assert (=> d!59755 m!258685))

(assert (=> b!237765 m!258465))

(declare-fun m!258687 () Bool)

(assert (=> b!237765 m!258687))

(assert (=> b!237765 m!258465))

(assert (=> b!237765 m!258673))

(assert (=> b!237765 m!258673))

(declare-fun m!258689 () Bool)

(assert (=> b!237765 m!258689))

(assert (=> b!237767 m!258465))

(assert (=> b!237767 m!258673))

(assert (=> b!237767 m!258673))

(assert (=> b!237767 m!258689))

(assert (=> b!237633 d!59755))

(declare-fun d!59757 () Bool)

(assert (=> d!59757 (isDefined!216 (getValueByKey!276 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(declare-fun lt!120305 () Unit!7287)

(declare-fun choose!1122 (List!3485 (_ BitVec 64)) Unit!7287)

(assert (=> d!59757 (= lt!120305 (choose!1122 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(declare-fun e!154392 () Bool)

(assert (=> d!59757 e!154392))

(declare-fun res!116513 () Bool)

(assert (=> d!59757 (=> (not res!116513) (not e!154392))))

(declare-fun isStrictlySorted!353 (List!3485) Bool)

(assert (=> d!59757 (= res!116513 (isStrictlySorted!353 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))))

(assert (=> d!59757 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932) lt!120305)))

(declare-fun b!237770 () Bool)

(assert (=> b!237770 (= e!154392 (containsKey!267 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(assert (= (and d!59757 res!116513) b!237770))

(assert (=> d!59757 m!258455))

(assert (=> d!59757 m!258455))

(assert (=> d!59757 m!258457))

(declare-fun m!258691 () Bool)

(assert (=> d!59757 m!258691))

(declare-fun m!258693 () Bool)

(assert (=> d!59757 m!258693))

(assert (=> b!237770 m!258451))

(assert (=> b!237568 d!59757))

(assert (=> b!237568 d!59709))

(assert (=> b!237568 d!59711))

(declare-fun d!59759 () Bool)

(declare-fun res!116525 () Bool)

(declare-fun e!154395 () Bool)

(assert (=> d!59759 (=> (not res!116525) (not e!154395))))

(assert (=> d!59759 (= res!116525 (validMask!0 (mask!10420 thiss!1504)))))

(assert (=> d!59759 (= (simpleValid!240 thiss!1504) e!154395)))

(declare-fun b!237781 () Bool)

(declare-fun res!116524 () Bool)

(assert (=> b!237781 (=> (not res!116524) (not e!154395))))

(declare-fun size!5927 (LongMapFixedSize!3454) (_ BitVec 32))

(assert (=> b!237781 (= res!116524 (= (size!5927 thiss!1504) (bvadd (_size!1776 thiss!1504) (bvsdiv (bvadd (extraKeys!4144 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!237779 () Bool)

(declare-fun res!116522 () Bool)

(assert (=> b!237779 (=> (not res!116522) (not e!154395))))

(assert (=> b!237779 (= res!116522 (and (= (size!5921 (_values!4390 thiss!1504)) (bvadd (mask!10420 thiss!1504) #b00000000000000000000000000000001)) (= (size!5922 (_keys!6499 thiss!1504)) (size!5921 (_values!4390 thiss!1504))) (bvsge (_size!1776 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1776 thiss!1504) (bvadd (mask!10420 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!237782 () Bool)

(assert (=> b!237782 (= e!154395 (and (bvsge (extraKeys!4144 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4144 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1776 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!237780 () Bool)

(declare-fun res!116523 () Bool)

(assert (=> b!237780 (=> (not res!116523) (not e!154395))))

(assert (=> b!237780 (= res!116523 (bvsge (size!5927 thiss!1504) (_size!1776 thiss!1504)))))

(assert (= (and d!59759 res!116525) b!237779))

(assert (= (and b!237779 res!116522) b!237780))

(assert (= (and b!237780 res!116523) b!237781))

(assert (= (and b!237781 res!116524) b!237782))

(assert (=> d!59759 m!258411))

(declare-fun m!258695 () Bool)

(assert (=> b!237781 m!258695))

(assert (=> b!237780 m!258695))

(assert (=> d!59705 d!59759))

(declare-fun d!59761 () Bool)

(declare-fun e!154396 () Bool)

(assert (=> d!59761 e!154396))

(declare-fun res!116526 () Bool)

(assert (=> d!59761 (=> res!116526 e!154396)))

(declare-fun lt!120306 () Bool)

(assert (=> d!59761 (= res!116526 (not lt!120306))))

(declare-fun lt!120307 () Bool)

(assert (=> d!59761 (= lt!120306 lt!120307)))

(declare-fun lt!120309 () Unit!7287)

(declare-fun e!154397 () Unit!7287)

(assert (=> d!59761 (= lt!120309 e!154397)))

(declare-fun c!39666 () Bool)

(assert (=> d!59761 (= c!39666 lt!120307)))

(assert (=> d!59761 (= lt!120307 (containsKey!267 (toList!1768 lt!120212) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59761 (= (contains!1666 lt!120212 #b0000000000000000000000000000000000000000000000000000000000000000) lt!120306)))

(declare-fun b!237783 () Bool)

(declare-fun lt!120308 () Unit!7287)

(assert (=> b!237783 (= e!154397 lt!120308)))

(assert (=> b!237783 (= lt!120308 (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1768 lt!120212) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237783 (isDefined!216 (getValueByKey!276 (toList!1768 lt!120212) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237784 () Bool)

(declare-fun Unit!7294 () Unit!7287)

(assert (=> b!237784 (= e!154397 Unit!7294)))

(declare-fun b!237785 () Bool)

(assert (=> b!237785 (= e!154396 (isDefined!216 (getValueByKey!276 (toList!1768 lt!120212) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59761 c!39666) b!237783))

(assert (= (and d!59761 (not c!39666)) b!237784))

(assert (= (and d!59761 (not res!116526)) b!237785))

(declare-fun m!258697 () Bool)

(assert (=> d!59761 m!258697))

(declare-fun m!258699 () Bool)

(assert (=> b!237783 m!258699))

(assert (=> b!237783 m!258681))

(assert (=> b!237783 m!258681))

(declare-fun m!258701 () Bool)

(assert (=> b!237783 m!258701))

(assert (=> b!237785 m!258681))

(assert (=> b!237785 m!258681))

(assert (=> b!237785 m!258701))

(assert (=> bm!22074 d!59761))

(declare-fun b!237794 () Bool)

(declare-fun e!154402 () (_ BitVec 32))

(declare-fun call!22089 () (_ BitVec 32))

(assert (=> b!237794 (= e!154402 call!22089)))

(declare-fun d!59763 () Bool)

(declare-fun lt!120312 () (_ BitVec 32))

(assert (=> d!59763 (and (bvsge lt!120312 #b00000000000000000000000000000000) (bvsle lt!120312 (bvsub (size!5922 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!154403 () (_ BitVec 32))

(assert (=> d!59763 (= lt!120312 e!154403)))

(declare-fun c!39672 () Bool)

(assert (=> d!59763 (= c!39672 (bvsge #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(assert (=> d!59763 (and (bvsle #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5922 (_keys!6499 thiss!1504)) (size!5922 (_keys!6499 thiss!1504))))))

(assert (=> d!59763 (= (arrayCountValidKeys!0 (_keys!6499 thiss!1504) #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))) lt!120312)))

(declare-fun b!237795 () Bool)

(assert (=> b!237795 (= e!154402 (bvadd #b00000000000000000000000000000001 call!22089))))

(declare-fun b!237796 () Bool)

(assert (=> b!237796 (= e!154403 e!154402)))

(declare-fun c!39671 () Bool)

(assert (=> b!237796 (= c!39671 (validKeyInArray!0 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237797 () Bool)

(assert (=> b!237797 (= e!154403 #b00000000000000000000000000000000)))

(declare-fun bm!22086 () Bool)

(assert (=> bm!22086 (= call!22089 (arrayCountValidKeys!0 (_keys!6499 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5922 (_keys!6499 thiss!1504))))))

(assert (= (and d!59763 c!39672) b!237797))

(assert (= (and d!59763 (not c!39672)) b!237796))

(assert (= (and b!237796 c!39671) b!237795))

(assert (= (and b!237796 (not c!39671)) b!237794))

(assert (= (or b!237795 b!237794) bm!22086))

(assert (=> b!237796 m!258465))

(assert (=> b!237796 m!258465))

(assert (=> b!237796 m!258467))

(declare-fun m!258703 () Bool)

(assert (=> bm!22086 m!258703))

(assert (=> b!237642 d!59763))

(declare-fun d!59765 () Bool)

(assert (=> d!59765 (= (apply!217 lt!120212 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2884 (getValueByKey!276 (toList!1768 lt!120212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8801 () Bool)

(assert (= bs!8801 d!59765))

(assert (=> bs!8801 m!258669))

(assert (=> bs!8801 m!258669))

(declare-fun m!258705 () Bool)

(assert (=> bs!8801 m!258705))

(assert (=> b!237622 d!59765))

(declare-fun d!59767 () Bool)

(assert (=> d!59767 (= (validKeyInArray!0 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237630 d!59767))

(declare-fun b!237806 () Bool)

(declare-fun e!154410 () Bool)

(declare-fun call!22092 () Bool)

(assert (=> b!237806 (= e!154410 call!22092)))

(declare-fun b!237807 () Bool)

(declare-fun e!154412 () Bool)

(assert (=> b!237807 (= e!154412 call!22092)))

(declare-fun bm!22089 () Bool)

(assert (=> bm!22089 (= call!22092 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6499 thiss!1504) (mask!10420 thiss!1504)))))

(declare-fun b!237808 () Bool)

(assert (=> b!237808 (= e!154412 e!154410)))

(declare-fun lt!120321 () (_ BitVec 64))

(assert (=> b!237808 (= lt!120321 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120319 () Unit!7287)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11753 (_ BitVec 64) (_ BitVec 32)) Unit!7287)

(assert (=> b!237808 (= lt!120319 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6499 thiss!1504) lt!120321 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!237808 (arrayContainsKey!0 (_keys!6499 thiss!1504) lt!120321 #b00000000000000000000000000000000)))

(declare-fun lt!120320 () Unit!7287)

(assert (=> b!237808 (= lt!120320 lt!120319)))

(declare-fun res!116532 () Bool)

(assert (=> b!237808 (= res!116532 (= (seekEntryOrOpen!0 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000) (_keys!6499 thiss!1504) (mask!10420 thiss!1504)) (Found!981 #b00000000000000000000000000000000)))))

(assert (=> b!237808 (=> (not res!116532) (not e!154410))))

(declare-fun b!237809 () Bool)

(declare-fun e!154411 () Bool)

(assert (=> b!237809 (= e!154411 e!154412)))

(declare-fun c!39675 () Bool)

(assert (=> b!237809 (= c!39675 (validKeyInArray!0 (select (arr!5582 (_keys!6499 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59769 () Bool)

(declare-fun res!116531 () Bool)

(assert (=> d!59769 (=> res!116531 e!154411)))

(assert (=> d!59769 (= res!116531 (bvsge #b00000000000000000000000000000000 (size!5922 (_keys!6499 thiss!1504))))))

(assert (=> d!59769 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6499 thiss!1504) (mask!10420 thiss!1504)) e!154411)))

(assert (= (and d!59769 (not res!116531)) b!237809))

(assert (= (and b!237809 c!39675) b!237808))

(assert (= (and b!237809 (not c!39675)) b!237807))

(assert (= (and b!237808 res!116532) b!237806))

(assert (= (or b!237806 b!237807) bm!22089))

(declare-fun m!258707 () Bool)

(assert (=> bm!22089 m!258707))

(assert (=> b!237808 m!258465))

(declare-fun m!258709 () Bool)

(assert (=> b!237808 m!258709))

(declare-fun m!258711 () Bool)

(assert (=> b!237808 m!258711))

(assert (=> b!237808 m!258465))

(declare-fun m!258713 () Bool)

(assert (=> b!237808 m!258713))

(assert (=> b!237809 m!258465))

(assert (=> b!237809 m!258465))

(assert (=> b!237809 m!258467))

(assert (=> b!237643 d!59769))

(assert (=> bm!22072 d!59737))

(declare-fun d!59771 () Bool)

(declare-fun res!116537 () Bool)

(declare-fun e!154417 () Bool)

(assert (=> d!59771 (=> res!116537 e!154417)))

(assert (=> d!59771 (= res!116537 (and ((_ is Cons!3481) (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) (= (_1!2306 (h!4136 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) key!932)))))

(assert (=> d!59771 (= (containsKey!267 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932) e!154417)))

(declare-fun b!237814 () Bool)

(declare-fun e!154418 () Bool)

(assert (=> b!237814 (= e!154417 e!154418)))

(declare-fun res!116538 () Bool)

(assert (=> b!237814 (=> (not res!116538) (not e!154418))))

(assert (=> b!237814 (= res!116538 (and (or (not ((_ is Cons!3481) (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) (bvsle (_1!2306 (h!4136 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) key!932)) ((_ is Cons!3481) (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) (bvslt (_1!2306 (h!4136 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) key!932)))))

(declare-fun b!237815 () Bool)

(assert (=> b!237815 (= e!154418 (containsKey!267 (t!8464 (toList!1768 (getCurrentListMap!1300 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) key!932))))

(assert (= (and d!59771 (not res!116537)) b!237814))

(assert (= (and b!237814 res!116538) b!237815))

(declare-fun m!258715 () Bool)

(assert (=> b!237815 m!258715))

(assert (=> d!59699 d!59771))

(declare-fun b!237834 () Bool)

(declare-fun e!154430 () Bool)

(declare-fun lt!120326 () SeekEntryResult!981)

(assert (=> b!237834 (= e!154430 (bvsge (x!23933 lt!120326) #b01111111111111111111111111111110))))

(declare-fun b!237835 () Bool)

(declare-fun e!154432 () Bool)

(assert (=> b!237835 (= e!154430 e!154432)))

(declare-fun res!116547 () Bool)

(assert (=> b!237835 (= res!116547 (and ((_ is Intermediate!981) lt!120326) (not (undefined!1793 lt!120326)) (bvslt (x!23933 lt!120326) #b01111111111111111111111111111110) (bvsge (x!23933 lt!120326) #b00000000000000000000000000000000) (bvsge (x!23933 lt!120326) #b00000000000000000000000000000000)))))

(assert (=> b!237835 (=> (not res!116547) (not e!154432))))

(declare-fun b!237836 () Bool)

(declare-fun e!154429 () SeekEntryResult!981)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237836 (= e!154429 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10420 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10420 thiss!1504)) key!932 (_keys!6499 thiss!1504) (mask!10420 thiss!1504)))))

(declare-fun b!237837 () Bool)

(assert (=> b!237837 (= e!154429 (Intermediate!981 false (toIndex!0 key!932 (mask!10420 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!237838 () Bool)

(assert (=> b!237838 (and (bvsge (index!6096 lt!120326) #b00000000000000000000000000000000) (bvslt (index!6096 lt!120326) (size!5922 (_keys!6499 thiss!1504))))))

(declare-fun e!154431 () Bool)

(assert (=> b!237838 (= e!154431 (= (select (arr!5582 (_keys!6499 thiss!1504)) (index!6096 lt!120326)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237839 () Bool)

(assert (=> b!237839 (and (bvsge (index!6096 lt!120326) #b00000000000000000000000000000000) (bvslt (index!6096 lt!120326) (size!5922 (_keys!6499 thiss!1504))))))

(declare-fun res!116545 () Bool)

(assert (=> b!237839 (= res!116545 (= (select (arr!5582 (_keys!6499 thiss!1504)) (index!6096 lt!120326)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237839 (=> res!116545 e!154431)))

(declare-fun d!59773 () Bool)

(assert (=> d!59773 e!154430))

(declare-fun c!39682 () Bool)

(assert (=> d!59773 (= c!39682 (and ((_ is Intermediate!981) lt!120326) (undefined!1793 lt!120326)))))

(declare-fun e!154433 () SeekEntryResult!981)

(assert (=> d!59773 (= lt!120326 e!154433)))

(declare-fun c!39684 () Bool)

(assert (=> d!59773 (= c!39684 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!120327 () (_ BitVec 64))

(assert (=> d!59773 (= lt!120327 (select (arr!5582 (_keys!6499 thiss!1504)) (toIndex!0 key!932 (mask!10420 thiss!1504))))))

(assert (=> d!59773 (validMask!0 (mask!10420 thiss!1504))))

(assert (=> d!59773 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10420 thiss!1504)) key!932 (_keys!6499 thiss!1504) (mask!10420 thiss!1504)) lt!120326)))

(declare-fun b!237840 () Bool)

(assert (=> b!237840 (= e!154433 e!154429)))

(declare-fun c!39683 () Bool)

(assert (=> b!237840 (= c!39683 (or (= lt!120327 key!932) (= (bvadd lt!120327 lt!120327) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237841 () Bool)

(assert (=> b!237841 (= e!154433 (Intermediate!981 true (toIndex!0 key!932 (mask!10420 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!237842 () Bool)

(assert (=> b!237842 (and (bvsge (index!6096 lt!120326) #b00000000000000000000000000000000) (bvslt (index!6096 lt!120326) (size!5922 (_keys!6499 thiss!1504))))))

(declare-fun res!116546 () Bool)

(assert (=> b!237842 (= res!116546 (= (select (arr!5582 (_keys!6499 thiss!1504)) (index!6096 lt!120326)) key!932))))

(assert (=> b!237842 (=> res!116546 e!154431)))

(assert (=> b!237842 (= e!154432 e!154431)))

(assert (= (and d!59773 c!39684) b!237841))

(assert (= (and d!59773 (not c!39684)) b!237840))

(assert (= (and b!237840 c!39683) b!237837))

(assert (= (and b!237840 (not c!39683)) b!237836))

(assert (= (and d!59773 c!39682) b!237834))

(assert (= (and d!59773 (not c!39682)) b!237835))

(assert (= (and b!237835 res!116547) b!237842))

(assert (= (and b!237842 (not res!116546)) b!237839))

(assert (= (and b!237839 (not res!116545)) b!237838))

(assert (=> d!59773 m!258527))

(declare-fun m!258717 () Bool)

(assert (=> d!59773 m!258717))

(assert (=> d!59773 m!258411))

(declare-fun m!258719 () Bool)

(assert (=> b!237838 m!258719))

(assert (=> b!237842 m!258719))

(assert (=> b!237839 m!258719))

(assert (=> b!237836 m!258527))

(declare-fun m!258721 () Bool)

(assert (=> b!237836 m!258721))

(assert (=> b!237836 m!258721))

(declare-fun m!258723 () Bool)

(assert (=> b!237836 m!258723))

(assert (=> d!59707 d!59773))

(declare-fun d!59775 () Bool)

(declare-fun lt!120333 () (_ BitVec 32))

(declare-fun lt!120332 () (_ BitVec 32))

(assert (=> d!59775 (= lt!120333 (bvmul (bvxor lt!120332 (bvlshr lt!120332 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59775 (= lt!120332 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59775 (and (bvsge (mask!10420 thiss!1504) #b00000000000000000000000000000000) (let ((res!116548 (let ((h!4139 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23951 (bvmul (bvxor h!4139 (bvlshr h!4139 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23951 (bvlshr x!23951 #b00000000000000000000000000001101)) (mask!10420 thiss!1504)))))) (and (bvslt res!116548 (bvadd (mask!10420 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!116548 #b00000000000000000000000000000000))))))

(assert (=> d!59775 (= (toIndex!0 key!932 (mask!10420 thiss!1504)) (bvand (bvxor lt!120333 (bvlshr lt!120333 #b00000000000000000000000000001101)) (mask!10420 thiss!1504)))))

(assert (=> d!59707 d!59775))

(assert (=> d!59707 d!59703))

(declare-fun d!59777 () Bool)

(declare-fun e!154434 () Bool)

(assert (=> d!59777 e!154434))

(declare-fun res!116549 () Bool)

(assert (=> d!59777 (=> (not res!116549) (not e!154434))))

(declare-fun lt!120334 () ListLongMap!3505)

(assert (=> d!59777 (= res!116549 (contains!1666 lt!120334 (_1!2306 (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(declare-fun lt!120336 () List!3485)

(assert (=> d!59777 (= lt!120334 (ListLongMap!3506 lt!120336))))

(declare-fun lt!120335 () Unit!7287)

(declare-fun lt!120337 () Unit!7287)

(assert (=> d!59777 (= lt!120335 lt!120337)))

(assert (=> d!59777 (= (getValueByKey!276 lt!120336 (_1!2306 (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))) (Some!281 (_2!2306 (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(assert (=> d!59777 (= lt!120337 (lemmaContainsTupThenGetReturnValue!155 lt!120336 (_1!2306 (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))) (_2!2306 (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(assert (=> d!59777 (= lt!120336 (insertStrictlySorted!158 (toList!1768 call!22077) (_1!2306 (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))) (_2!2306 (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(assert (=> d!59777 (= (+!644 call!22077 (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))) lt!120334)))

(declare-fun b!237843 () Bool)

(declare-fun res!116550 () Bool)

(assert (=> b!237843 (=> (not res!116550) (not e!154434))))

(assert (=> b!237843 (= res!116550 (= (getValueByKey!276 (toList!1768 lt!120334) (_1!2306 (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))) (Some!281 (_2!2306 (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))))

(declare-fun b!237844 () Bool)

(assert (=> b!237844 (= e!154434 (contains!1668 (toList!1768 lt!120334) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))

(assert (= (and d!59777 res!116549) b!237843))

(assert (= (and b!237843 res!116550) b!237844))

(declare-fun m!258725 () Bool)

(assert (=> d!59777 m!258725))

(declare-fun m!258727 () Bool)

(assert (=> d!59777 m!258727))

(declare-fun m!258729 () Bool)

(assert (=> d!59777 m!258729))

(declare-fun m!258731 () Bool)

(assert (=> d!59777 m!258731))

(declare-fun m!258733 () Bool)

(assert (=> b!237843 m!258733))

(declare-fun m!258735 () Bool)

(assert (=> b!237844 m!258735))

(assert (=> b!237626 d!59777))

(assert (=> b!237627 d!59767))

(declare-fun d!59779 () Bool)

(declare-fun e!154435 () Bool)

(assert (=> d!59779 e!154435))

(declare-fun res!116551 () Bool)

(assert (=> d!59779 (=> (not res!116551) (not e!154435))))

(declare-fun lt!120338 () ListLongMap!3505)

(assert (=> d!59779 (= res!116551 (contains!1666 lt!120338 (_1!2306 (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))))

(declare-fun lt!120340 () List!3485)

(assert (=> d!59779 (= lt!120338 (ListLongMap!3506 lt!120340))))

(declare-fun lt!120339 () Unit!7287)

(declare-fun lt!120341 () Unit!7287)

(assert (=> d!59779 (= lt!120339 lt!120341)))

(assert (=> d!59779 (= (getValueByKey!276 lt!120340 (_1!2306 (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))) (Some!281 (_2!2306 (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))))

(assert (=> d!59779 (= lt!120341 (lemmaContainsTupThenGetReturnValue!155 lt!120340 (_1!2306 (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))) (_2!2306 (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))))

(assert (=> d!59779 (= lt!120340 (insertStrictlySorted!158 (toList!1768 (ite c!39626 call!22074 (ite c!39629 call!22075 call!22076))) (_1!2306 (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))) (_2!2306 (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))))

(assert (=> d!59779 (= (+!644 (ite c!39626 call!22074 (ite c!39629 call!22075 call!22076)) (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))) lt!120338)))

(declare-fun b!237845 () Bool)

(declare-fun res!116552 () Bool)

(assert (=> b!237845 (=> (not res!116552) (not e!154435))))

(assert (=> b!237845 (= res!116552 (= (getValueByKey!276 (toList!1768 lt!120338) (_1!2306 (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))) (Some!281 (_2!2306 (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))))

(declare-fun b!237846 () Bool)

(assert (=> b!237846 (= e!154435 (contains!1668 (toList!1768 lt!120338) (ite (or c!39626 c!39629) (tuple2!4591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(assert (= (and d!59779 res!116551) b!237845))

(assert (= (and b!237845 res!116552) b!237846))

(declare-fun m!258737 () Bool)

(assert (=> d!59779 m!258737))

(declare-fun m!258739 () Bool)

(assert (=> d!59779 m!258739))

(declare-fun m!258741 () Bool)

(assert (=> d!59779 m!258741))

(declare-fun m!258743 () Bool)

(assert (=> d!59779 m!258743))

(declare-fun m!258745 () Bool)

(assert (=> b!237845 m!258745))

(declare-fun m!258747 () Bool)

(assert (=> b!237846 m!258747))

(assert (=> bm!22073 d!59779))

(declare-fun b!237859 () Bool)

(declare-fun e!154443 () SeekEntryResult!981)

(assert (=> b!237859 (= e!154443 (Found!981 (index!6096 lt!120235)))))

(declare-fun b!237860 () Bool)

(declare-fun c!39691 () Bool)

(declare-fun lt!120347 () (_ BitVec 64))

(assert (=> b!237860 (= c!39691 (= lt!120347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154444 () SeekEntryResult!981)

(assert (=> b!237860 (= e!154443 e!154444)))

(declare-fun b!237861 () Bool)

(declare-fun e!154442 () SeekEntryResult!981)

(assert (=> b!237861 (= e!154442 e!154443)))

(declare-fun c!39693 () Bool)

(assert (=> b!237861 (= c!39693 (= lt!120347 key!932))))

(declare-fun b!237862 () Bool)

(assert (=> b!237862 (= e!154442 Undefined!981)))

(declare-fun lt!120346 () SeekEntryResult!981)

(declare-fun d!59781 () Bool)

(assert (=> d!59781 (and (or ((_ is Undefined!981) lt!120346) (not ((_ is Found!981) lt!120346)) (and (bvsge (index!6095 lt!120346) #b00000000000000000000000000000000) (bvslt (index!6095 lt!120346) (size!5922 (_keys!6499 thiss!1504))))) (or ((_ is Undefined!981) lt!120346) ((_ is Found!981) lt!120346) (not ((_ is MissingVacant!981) lt!120346)) (not (= (index!6097 lt!120346) (index!6096 lt!120235))) (and (bvsge (index!6097 lt!120346) #b00000000000000000000000000000000) (bvslt (index!6097 lt!120346) (size!5922 (_keys!6499 thiss!1504))))) (or ((_ is Undefined!981) lt!120346) (ite ((_ is Found!981) lt!120346) (= (select (arr!5582 (_keys!6499 thiss!1504)) (index!6095 lt!120346)) key!932) (and ((_ is MissingVacant!981) lt!120346) (= (index!6097 lt!120346) (index!6096 lt!120235)) (= (select (arr!5582 (_keys!6499 thiss!1504)) (index!6097 lt!120346)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59781 (= lt!120346 e!154442)))

(declare-fun c!39692 () Bool)

(assert (=> d!59781 (= c!39692 (bvsge (x!23933 lt!120235) #b01111111111111111111111111111110))))

(assert (=> d!59781 (= lt!120347 (select (arr!5582 (_keys!6499 thiss!1504)) (index!6096 lt!120235)))))

(assert (=> d!59781 (validMask!0 (mask!10420 thiss!1504))))

(assert (=> d!59781 (= (seekKeyOrZeroReturnVacant!0 (x!23933 lt!120235) (index!6096 lt!120235) (index!6096 lt!120235) key!932 (_keys!6499 thiss!1504) (mask!10420 thiss!1504)) lt!120346)))

(declare-fun b!237863 () Bool)

(assert (=> b!237863 (= e!154444 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23933 lt!120235) #b00000000000000000000000000000001) (nextIndex!0 (index!6096 lt!120235) (bvadd (x!23933 lt!120235) #b00000000000000000000000000000001) (mask!10420 thiss!1504)) (index!6096 lt!120235) key!932 (_keys!6499 thiss!1504) (mask!10420 thiss!1504)))))

(declare-fun b!237864 () Bool)

(assert (=> b!237864 (= e!154444 (MissingVacant!981 (index!6096 lt!120235)))))

(assert (= (and d!59781 c!39692) b!237862))

(assert (= (and d!59781 (not c!39692)) b!237861))

(assert (= (and b!237861 c!39693) b!237859))

(assert (= (and b!237861 (not c!39693)) b!237860))

(assert (= (and b!237860 c!39691) b!237864))

(assert (= (and b!237860 (not c!39691)) b!237863))

(declare-fun m!258749 () Bool)

(assert (=> d!59781 m!258749))

(declare-fun m!258751 () Bool)

(assert (=> d!59781 m!258751))

(assert (=> d!59781 m!258537))

(assert (=> d!59781 m!258411))

(declare-fun m!258753 () Bool)

(assert (=> b!237863 m!258753))

(assert (=> b!237863 m!258753))

(declare-fun m!258755 () Bool)

(assert (=> b!237863 m!258755))

(assert (=> b!237660 d!59781))

(declare-fun b!237866 () Bool)

(declare-fun e!154445 () Bool)

(assert (=> b!237866 (= e!154445 tp_is_empty!6241)))

(declare-fun mapNonEmpty!10590 () Bool)

(declare-fun mapRes!10590 () Bool)

(declare-fun tp!22344 () Bool)

(declare-fun e!154446 () Bool)

(assert (=> mapNonEmpty!10590 (= mapRes!10590 (and tp!22344 e!154446))))

(declare-fun mapKey!10590 () (_ BitVec 32))

(declare-fun mapValue!10590 () ValueCell!2777)

(declare-fun mapRest!10590 () (Array (_ BitVec 32) ValueCell!2777))

(assert (=> mapNonEmpty!10590 (= mapRest!10589 (store mapRest!10590 mapKey!10590 mapValue!10590))))

(declare-fun condMapEmpty!10590 () Bool)

(declare-fun mapDefault!10590 () ValueCell!2777)

(assert (=> mapNonEmpty!10589 (= condMapEmpty!10590 (= mapRest!10589 ((as const (Array (_ BitVec 32) ValueCell!2777)) mapDefault!10590)))))

(assert (=> mapNonEmpty!10589 (= tp!22343 (and e!154445 mapRes!10590))))

(declare-fun mapIsEmpty!10590 () Bool)

(assert (=> mapIsEmpty!10590 mapRes!10590))

(declare-fun b!237865 () Bool)

(assert (=> b!237865 (= e!154446 tp_is_empty!6241)))

(assert (= (and mapNonEmpty!10589 condMapEmpty!10590) mapIsEmpty!10590))

(assert (= (and mapNonEmpty!10589 (not condMapEmpty!10590)) mapNonEmpty!10590))

(assert (= (and mapNonEmpty!10590 ((_ is ValueCellFull!2777) mapValue!10590)) b!237865))

(assert (= (and mapNonEmpty!10589 ((_ is ValueCellFull!2777) mapDefault!10590)) b!237866))

(declare-fun m!258757 () Bool)

(assert (=> mapNonEmpty!10590 m!258757))

(declare-fun b_lambda!7985 () Bool)

(assert (= b_lambda!7981 (or (and b!237507 b_free!6379) b_lambda!7985)))

(declare-fun b_lambda!7987 () Bool)

(assert (= b_lambda!7983 (or (and b!237507 b_free!6379) b_lambda!7987)))

(check-sat (not d!59765) (not bm!22080) (not b!237754) (not b!237844) (not bm!22089) (not b_lambda!7979) (not b!237740) (not b!237734) (not b!237702) (not b!237755) (not b!237815) (not d!59729) b_and!13357 (not b!237783) (not b!237699) (not d!59733) (not b!237700) (not b!237845) (not b!237701) (not b!237780) (not b!237863) (not d!59715) tp_is_empty!6241 (not b!237736) (not b!237809) (not d!59731) (not b!237808) (not b!237690) (not b!237732) (not d!59723) (not bm!22083) (not d!59777) (not d!59739) (not b!237751) (not d!59749) (not d!59759) (not d!59755) (not d!59743) (not b_lambda!7985) (not b_lambda!7987) (not b!237756) (not d!59753) (not b!237738) (not b!237758) (not d!59709) (not d!59719) (not b!237728) (not b!237681) (not b!237846) (not d!59757) (not d!59773) (not b!237785) (not b!237698) (not b!237765) (not b!237730) (not d!59717) (not d!59727) (not b!237796) (not b!237739) (not b!237731) (not d!59761) (not b!237688) (not d!59721) (not d!59781) (not b!237697) (not b!237770) (not d!59747) (not d!59779) (not b!237767) (not d!59737) (not d!59735) (not bm!22086) (not d!59725) (not b!237781) (not b!237843) (not d!59713) (not b!237735) (not b!237836) (not b!237763) (not b_next!6379) (not d!59741) (not b!237764) (not mapNonEmpty!10590))
(check-sat b_and!13357 (not b_next!6379))
