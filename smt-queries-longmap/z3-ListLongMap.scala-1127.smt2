; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23150 () Bool)

(assert start!23150)

(declare-fun b!242543 () Bool)

(declare-fun b_free!6511 () Bool)

(declare-fun b_next!6511 () Bool)

(assert (=> b!242543 (= b_free!6511 (not b_next!6511))))

(declare-fun tp!22749 () Bool)

(declare-fun b_and!13463 () Bool)

(assert (=> b!242543 (= tp!22749 b_and!13463)))

(declare-fun b!242530 () Bool)

(declare-fun res!118821 () Bool)

(declare-fun e!157399 () Bool)

(assert (=> b!242530 (=> (not res!118821) (not e!157399))))

(declare-datatypes ((List!3624 0))(
  ( (Nil!3621) (Cons!3620 (h!4277 (_ BitVec 64)) (t!8618 List!3624)) )
))
(declare-fun contains!1726 (List!3624 (_ BitVec 64)) Bool)

(assert (=> b!242530 (= res!118821 (not (contains!1726 Nil!3621 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!242531 () Bool)

(declare-fun e!157403 () Bool)

(declare-fun e!157407 () Bool)

(assert (=> b!242531 (= e!157403 e!157407)))

(declare-fun res!118820 () Bool)

(assert (=> b!242531 (=> (not res!118820) (not e!157407))))

(declare-datatypes ((SeekEntryResult!1066 0))(
  ( (MissingZero!1066 (index!6434 (_ BitVec 32))) (Found!1066 (index!6435 (_ BitVec 32))) (Intermediate!1066 (undefined!1878 Bool) (index!6436 (_ BitVec 32)) (x!24289 (_ BitVec 32))) (Undefined!1066) (MissingVacant!1066 (index!6437 (_ BitVec 32))) )
))
(declare-fun lt!121713 () SeekEntryResult!1066)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!242531 (= res!118820 (or (= lt!121713 (MissingZero!1066 index!297)) (= lt!121713 (MissingVacant!1066 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8145 0))(
  ( (V!8146 (val!3231 Int)) )
))
(declare-datatypes ((ValueCell!2843 0))(
  ( (ValueCellFull!2843 (v!5268 V!8145)) (EmptyCell!2843) )
))
(declare-datatypes ((array!12025 0))(
  ( (array!12026 (arr!5709 (Array (_ BitVec 32) ValueCell!2843)) (size!6052 (_ BitVec 32))) )
))
(declare-datatypes ((array!12027 0))(
  ( (array!12028 (arr!5710 (Array (_ BitVec 32) (_ BitVec 64))) (size!6053 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3586 0))(
  ( (LongMapFixedSize!3587 (defaultEntry!4498 Int) (mask!10582 (_ BitVec 32)) (extraKeys!4235 (_ BitVec 32)) (zeroValue!4339 V!8145) (minValue!4339 V!8145) (_size!1842 (_ BitVec 32)) (_keys!6606 array!12027) (_values!4481 array!12025) (_vacant!1842 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3586)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12027 (_ BitVec 32)) SeekEntryResult!1066)

(assert (=> b!242531 (= lt!121713 (seekEntryOrOpen!0 key!932 (_keys!6606 thiss!1504) (mask!10582 thiss!1504)))))

(declare-fun mapNonEmpty!10804 () Bool)

(declare-fun mapRes!10804 () Bool)

(declare-fun tp!22750 () Bool)

(declare-fun e!157401 () Bool)

(assert (=> mapNonEmpty!10804 (= mapRes!10804 (and tp!22750 e!157401))))

(declare-fun mapKey!10804 () (_ BitVec 32))

(declare-fun mapValue!10804 () ValueCell!2843)

(declare-fun mapRest!10804 () (Array (_ BitVec 32) ValueCell!2843))

(assert (=> mapNonEmpty!10804 (= (arr!5709 (_values!4481 thiss!1504)) (store mapRest!10804 mapKey!10804 mapValue!10804))))

(declare-fun b!242533 () Bool)

(declare-datatypes ((Unit!7475 0))(
  ( (Unit!7476) )
))
(declare-fun e!157413 () Unit!7475)

(declare-fun Unit!7477 () Unit!7475)

(assert (=> b!242533 (= e!157413 Unit!7477)))

(declare-fun lt!121711 () Unit!7475)

(declare-fun lemmaArrayContainsKeyThenInListMap!173 (array!12027 array!12025 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) (_ BitVec 32) Int) Unit!7475)

(assert (=> b!242533 (= lt!121711 (lemmaArrayContainsKeyThenInListMap!173 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(assert (=> b!242533 false))

(declare-fun b!242534 () Bool)

(declare-fun e!157410 () Bool)

(declare-fun call!22596 () Bool)

(assert (=> b!242534 (= e!157410 (not call!22596))))

(declare-fun b!242535 () Bool)

(declare-fun e!157408 () Unit!7475)

(declare-fun Unit!7478 () Unit!7475)

(assert (=> b!242535 (= e!157408 Unit!7478)))

(declare-fun lt!121715 () Unit!7475)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!362 (array!12027 array!12025 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) Int) Unit!7475)

(assert (=> b!242535 (= lt!121715 (lemmaInListMapThenSeekEntryOrOpenFindsIt!362 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)))))

(assert (=> b!242535 false))

(declare-fun b!242536 () Bool)

(declare-fun e!157398 () Bool)

(assert (=> b!242536 (= e!157398 (contains!1726 Nil!3621 key!932))))

(declare-fun b!242537 () Bool)

(declare-fun e!157405 () Bool)

(get-info :version)

(assert (=> b!242537 (= e!157405 ((_ is Undefined!1066) lt!121713))))

(declare-fun b!242538 () Bool)

(declare-fun tp_is_empty!6373 () Bool)

(assert (=> b!242538 (= e!157401 tp_is_empty!6373)))

(declare-fun b!242539 () Bool)

(declare-fun res!118816 () Bool)

(assert (=> b!242539 (=> (not res!118816) (not e!157399))))

(declare-fun noDuplicate!93 (List!3624) Bool)

(assert (=> b!242539 (= res!118816 (noDuplicate!93 Nil!3621))))

(declare-fun b!242540 () Bool)

(declare-fun e!157402 () Bool)

(assert (=> b!242540 (= e!157402 (not (contains!1726 Nil!3621 key!932)))))

(declare-fun b!242541 () Bool)

(declare-fun e!157412 () Bool)

(assert (=> b!242541 (= e!157405 e!157412)))

(declare-fun res!118827 () Bool)

(declare-fun call!22595 () Bool)

(assert (=> b!242541 (= res!118827 call!22595)))

(assert (=> b!242541 (=> (not res!118827) (not e!157412))))

(declare-fun bm!22592 () Bool)

(declare-fun arrayContainsKey!0 (array!12027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22592 (= call!22596 (arrayContainsKey!0 (_keys!6606 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242542 () Bool)

(declare-fun res!118815 () Bool)

(assert (=> b!242542 (=> (not res!118815) (not e!157403))))

(assert (=> b!242542 (= res!118815 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!157409 () Bool)

(declare-fun e!157404 () Bool)

(declare-fun array_inv!3769 (array!12027) Bool)

(declare-fun array_inv!3770 (array!12025) Bool)

(assert (=> b!242543 (= e!157409 (and tp!22749 tp_is_empty!6373 (array_inv!3769 (_keys!6606 thiss!1504)) (array_inv!3770 (_values!4481 thiss!1504)) e!157404))))

(declare-fun b!242544 () Bool)

(declare-fun res!118822 () Bool)

(assert (=> b!242544 (=> (not res!118822) (not e!157399))))

(assert (=> b!242544 (= res!118822 (not (contains!1726 Nil!3621 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!242545 () Bool)

(declare-fun lt!121714 () Unit!7475)

(assert (=> b!242545 (= e!157408 lt!121714)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!360 (array!12027 array!12025 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) Int) Unit!7475)

(assert (=> b!242545 (= lt!121714 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!360 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)))))

(declare-fun c!40479 () Bool)

(assert (=> b!242545 (= c!40479 ((_ is MissingZero!1066) lt!121713))))

(declare-fun e!157414 () Bool)

(assert (=> b!242545 e!157414))

(declare-fun b!242546 () Bool)

(declare-fun c!40478 () Bool)

(assert (=> b!242546 (= c!40478 ((_ is MissingVacant!1066) lt!121713))))

(assert (=> b!242546 (= e!157414 e!157405)))

(declare-fun b!242547 () Bool)

(declare-fun Unit!7479 () Unit!7475)

(assert (=> b!242547 (= e!157413 Unit!7479)))

(declare-fun b!242548 () Bool)

(declare-fun res!118814 () Bool)

(assert (=> b!242548 (=> (not res!118814) (not e!157399))))

(assert (=> b!242548 (= res!118814 e!157402)))

(declare-fun res!118813 () Bool)

(assert (=> b!242548 (=> res!118813 e!157402)))

(assert (=> b!242548 (= res!118813 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun mapIsEmpty!10804 () Bool)

(assert (=> mapIsEmpty!10804 mapRes!10804))

(declare-fun b!242549 () Bool)

(declare-fun res!118818 () Bool)

(assert (=> b!242549 (=> (not res!118818) (not e!157410))))

(assert (=> b!242549 (= res!118818 (= (select (arr!5710 (_keys!6606 thiss!1504)) (index!6434 lt!121713)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242550 () Bool)

(declare-fun res!118824 () Bool)

(assert (=> b!242550 (= res!118824 (= (select (arr!5710 (_keys!6606 thiss!1504)) (index!6437 lt!121713)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242550 (=> (not res!118824) (not e!157412))))

(declare-fun b!242532 () Bool)

(declare-fun res!118823 () Bool)

(assert (=> b!242532 (=> (not res!118823) (not e!157410))))

(assert (=> b!242532 (= res!118823 call!22595)))

(assert (=> b!242532 (= e!157414 e!157410)))

(declare-fun res!118817 () Bool)

(assert (=> start!23150 (=> (not res!118817) (not e!157403))))

(declare-fun valid!1415 (LongMapFixedSize!3586) Bool)

(assert (=> start!23150 (= res!118817 (valid!1415 thiss!1504))))

(assert (=> start!23150 e!157403))

(assert (=> start!23150 e!157409))

(assert (=> start!23150 true))

(declare-fun bm!22593 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22593 (= call!22595 (inRange!0 (ite c!40479 (index!6434 lt!121713) (index!6437 lt!121713)) (mask!10582 thiss!1504)))))

(declare-fun b!242551 () Bool)

(declare-fun e!157400 () Bool)

(assert (=> b!242551 (= e!157400 e!157399)))

(declare-fun res!118819 () Bool)

(assert (=> b!242551 (=> (not res!118819) (not e!157399))))

(assert (=> b!242551 (= res!118819 (and (bvslt (size!6053 (_keys!6606 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6606 thiss!1504)))))))

(declare-fun lt!121710 () Unit!7475)

(assert (=> b!242551 (= lt!121710 e!157413)))

(declare-fun c!40480 () Bool)

(assert (=> b!242551 (= c!40480 (arrayContainsKey!0 (_keys!6606 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242552 () Bool)

(assert (=> b!242552 (= e!157407 e!157400)))

(declare-fun res!118825 () Bool)

(assert (=> b!242552 (=> (not res!118825) (not e!157400))))

(assert (=> b!242552 (= res!118825 (inRange!0 index!297 (mask!10582 thiss!1504)))))

(declare-fun lt!121712 () Unit!7475)

(assert (=> b!242552 (= lt!121712 e!157408)))

(declare-fun c!40477 () Bool)

(declare-datatypes ((tuple2!4726 0))(
  ( (tuple2!4727 (_1!2374 (_ BitVec 64)) (_2!2374 V!8145)) )
))
(declare-datatypes ((List!3625 0))(
  ( (Nil!3622) (Cons!3621 (h!4278 tuple2!4726) (t!8619 List!3625)) )
))
(declare-datatypes ((ListLongMap!3629 0))(
  ( (ListLongMap!3630 (toList!1830 List!3625)) )
))
(declare-fun contains!1727 (ListLongMap!3629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1339 (array!12027 array!12025 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 32) Int) ListLongMap!3629)

(assert (=> b!242552 (= c!40477 (contains!1727 (getCurrentListMap!1339 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)) key!932))))

(declare-fun b!242553 () Bool)

(declare-fun e!157411 () Bool)

(assert (=> b!242553 (= e!157404 (and e!157411 mapRes!10804))))

(declare-fun condMapEmpty!10804 () Bool)

(declare-fun mapDefault!10804 () ValueCell!2843)

(assert (=> b!242553 (= condMapEmpty!10804 (= (arr!5709 (_values!4481 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2843)) mapDefault!10804)))))

(declare-fun b!242554 () Bool)

(assert (=> b!242554 (= e!157411 tp_is_empty!6373)))

(declare-fun b!242555 () Bool)

(assert (=> b!242555 (= e!157412 (not call!22596))))

(declare-fun b!242556 () Bool)

(assert (=> b!242556 (= e!157399 e!157398)))

(declare-fun res!118826 () Bool)

(assert (=> b!242556 (=> res!118826 e!157398)))

(assert (=> b!242556 (= res!118826 (bvsgt #b00000000000000000000000000000000 index!297))))

(assert (= (and start!23150 res!118817) b!242542))

(assert (= (and b!242542 res!118815) b!242531))

(assert (= (and b!242531 res!118820) b!242552))

(assert (= (and b!242552 c!40477) b!242535))

(assert (= (and b!242552 (not c!40477)) b!242545))

(assert (= (and b!242545 c!40479) b!242532))

(assert (= (and b!242545 (not c!40479)) b!242546))

(assert (= (and b!242532 res!118823) b!242549))

(assert (= (and b!242549 res!118818) b!242534))

(assert (= (and b!242546 c!40478) b!242541))

(assert (= (and b!242546 (not c!40478)) b!242537))

(assert (= (and b!242541 res!118827) b!242550))

(assert (= (and b!242550 res!118824) b!242555))

(assert (= (or b!242532 b!242541) bm!22593))

(assert (= (or b!242534 b!242555) bm!22592))

(assert (= (and b!242552 res!118825) b!242551))

(assert (= (and b!242551 c!40480) b!242533))

(assert (= (and b!242551 (not c!40480)) b!242547))

(assert (= (and b!242551 res!118819) b!242539))

(assert (= (and b!242539 res!118816) b!242530))

(assert (= (and b!242530 res!118821) b!242544))

(assert (= (and b!242544 res!118822) b!242548))

(assert (= (and b!242548 (not res!118813)) b!242540))

(assert (= (and b!242548 res!118814) b!242556))

(assert (= (and b!242556 (not res!118826)) b!242536))

(assert (= (and b!242553 condMapEmpty!10804) mapIsEmpty!10804))

(assert (= (and b!242553 (not condMapEmpty!10804)) mapNonEmpty!10804))

(assert (= (and mapNonEmpty!10804 ((_ is ValueCellFull!2843) mapValue!10804)) b!242538))

(assert (= (and b!242553 ((_ is ValueCellFull!2843) mapDefault!10804)) b!242554))

(assert (= b!242543 b!242553))

(assert (= start!23150 b!242543))

(declare-fun m!260803 () Bool)

(assert (=> b!242544 m!260803))

(declare-fun m!260805 () Bool)

(assert (=> b!242536 m!260805))

(declare-fun m!260807 () Bool)

(assert (=> bm!22593 m!260807))

(declare-fun m!260809 () Bool)

(assert (=> b!242531 m!260809))

(assert (=> b!242540 m!260805))

(declare-fun m!260811 () Bool)

(assert (=> b!242551 m!260811))

(declare-fun m!260813 () Bool)

(assert (=> b!242535 m!260813))

(declare-fun m!260815 () Bool)

(assert (=> b!242549 m!260815))

(declare-fun m!260817 () Bool)

(assert (=> b!242552 m!260817))

(declare-fun m!260819 () Bool)

(assert (=> b!242552 m!260819))

(assert (=> b!242552 m!260819))

(declare-fun m!260821 () Bool)

(assert (=> b!242552 m!260821))

(declare-fun m!260823 () Bool)

(assert (=> b!242550 m!260823))

(declare-fun m!260825 () Bool)

(assert (=> b!242533 m!260825))

(declare-fun m!260827 () Bool)

(assert (=> b!242539 m!260827))

(declare-fun m!260829 () Bool)

(assert (=> mapNonEmpty!10804 m!260829))

(declare-fun m!260831 () Bool)

(assert (=> b!242530 m!260831))

(declare-fun m!260833 () Bool)

(assert (=> start!23150 m!260833))

(assert (=> bm!22592 m!260811))

(declare-fun m!260835 () Bool)

(assert (=> b!242545 m!260835))

(declare-fun m!260837 () Bool)

(assert (=> b!242543 m!260837))

(declare-fun m!260839 () Bool)

(assert (=> b!242543 m!260839))

(check-sat (not b!242544) (not b!242535) tp_is_empty!6373 (not b!242545) (not start!23150) (not b!242531) (not bm!22592) (not b!242533) (not b!242530) b_and!13463 (not b_next!6511) (not b!242552) (not b!242543) (not bm!22593) (not b!242540) (not b!242539) (not b!242551) (not mapNonEmpty!10804) (not b!242536))
(check-sat b_and!13463 (not b_next!6511))
(get-model)

(declare-fun d!59851 () Bool)

(assert (=> d!59851 (= (inRange!0 index!297 (mask!10582 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10582 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!242552 d!59851))

(declare-fun d!59853 () Bool)

(declare-fun e!157522 () Bool)

(assert (=> d!59853 e!157522))

(declare-fun res!118920 () Bool)

(assert (=> d!59853 (=> res!118920 e!157522)))

(declare-fun lt!121760 () Bool)

(assert (=> d!59853 (= res!118920 (not lt!121760))))

(declare-fun lt!121761 () Bool)

(assert (=> d!59853 (= lt!121760 lt!121761)))

(declare-fun lt!121762 () Unit!7475)

(declare-fun e!157521 () Unit!7475)

(assert (=> d!59853 (= lt!121762 e!157521)))

(declare-fun c!40507 () Bool)

(assert (=> d!59853 (= c!40507 lt!121761)))

(declare-fun containsKey!273 (List!3625 (_ BitVec 64)) Bool)

(assert (=> d!59853 (= lt!121761 (containsKey!273 (toList!1830 (getCurrentListMap!1339 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504))) key!932))))

(assert (=> d!59853 (= (contains!1727 (getCurrentListMap!1339 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)) key!932) lt!121760)))

(declare-fun b!242725 () Bool)

(declare-fun lt!121763 () Unit!7475)

(assert (=> b!242725 (= e!157521 lt!121763)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!222 (List!3625 (_ BitVec 64)) Unit!7475)

(assert (=> b!242725 (= lt!121763 (lemmaContainsKeyImpliesGetValueByKeyDefined!222 (toList!1830 (getCurrentListMap!1339 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504))) key!932))))

(declare-datatypes ((Option!287 0))(
  ( (Some!286 (v!5272 V!8145)) (None!285) )
))
(declare-fun isDefined!223 (Option!287) Bool)

(declare-fun getValueByKey!281 (List!3625 (_ BitVec 64)) Option!287)

(assert (=> b!242725 (isDefined!223 (getValueByKey!281 (toList!1830 (getCurrentListMap!1339 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504))) key!932))))

(declare-fun b!242726 () Bool)

(declare-fun Unit!7485 () Unit!7475)

(assert (=> b!242726 (= e!157521 Unit!7485)))

(declare-fun b!242727 () Bool)

(assert (=> b!242727 (= e!157522 (isDefined!223 (getValueByKey!281 (toList!1830 (getCurrentListMap!1339 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504))) key!932)))))

(assert (= (and d!59853 c!40507) b!242725))

(assert (= (and d!59853 (not c!40507)) b!242726))

(assert (= (and d!59853 (not res!118920)) b!242727))

(declare-fun m!260917 () Bool)

(assert (=> d!59853 m!260917))

(declare-fun m!260919 () Bool)

(assert (=> b!242725 m!260919))

(declare-fun m!260921 () Bool)

(assert (=> b!242725 m!260921))

(assert (=> b!242725 m!260921))

(declare-fun m!260923 () Bool)

(assert (=> b!242725 m!260923))

(assert (=> b!242727 m!260921))

(assert (=> b!242727 m!260921))

(assert (=> b!242727 m!260923))

(assert (=> b!242552 d!59853))

(declare-fun b!242770 () Bool)

(declare-fun e!157549 () Bool)

(declare-fun lt!121812 () ListLongMap!3629)

(declare-fun apply!225 (ListLongMap!3629 (_ BitVec 64)) V!8145)

(declare-fun get!2929 (ValueCell!2843 V!8145) V!8145)

(declare-fun dynLambda!559 (Int (_ BitVec 64)) V!8145)

(assert (=> b!242770 (= e!157549 (= (apply!225 lt!121812 (select (arr!5710 (_keys!6606 thiss!1504)) #b00000000000000000000000000000000)) (get!2929 (select (arr!5709 (_values!4481 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!559 (defaultEntry!4498 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!242770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6052 (_values!4481 thiss!1504))))))

(assert (=> b!242770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6606 thiss!1504))))))

(declare-fun b!242771 () Bool)

(declare-fun res!118941 () Bool)

(declare-fun e!157556 () Bool)

(assert (=> b!242771 (=> (not res!118941) (not e!157556))))

(declare-fun e!157557 () Bool)

(assert (=> b!242771 (= res!118941 e!157557)))

(declare-fun res!118939 () Bool)

(assert (=> b!242771 (=> res!118939 e!157557)))

(declare-fun e!157553 () Bool)

(assert (=> b!242771 (= res!118939 (not e!157553))))

(declare-fun res!118943 () Bool)

(assert (=> b!242771 (=> (not res!118943) (not e!157553))))

(assert (=> b!242771 (= res!118943 (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6606 thiss!1504))))))

(declare-fun bm!22620 () Bool)

(declare-fun call!22627 () Bool)

(assert (=> bm!22620 (= call!22627 (contains!1727 lt!121812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242772 () Bool)

(declare-fun e!157559 () ListLongMap!3629)

(declare-fun call!22629 () ListLongMap!3629)

(assert (=> b!242772 (= e!157559 call!22629)))

(declare-fun b!242773 () Bool)

(declare-fun e!157551 () ListLongMap!3629)

(declare-fun call!22625 () ListLongMap!3629)

(assert (=> b!242773 (= e!157551 call!22625)))

(declare-fun b!242774 () Bool)

(declare-fun res!118947 () Bool)

(assert (=> b!242774 (=> (not res!118947) (not e!157556))))

(declare-fun e!157560 () Bool)

(assert (=> b!242774 (= res!118947 e!157560)))

(declare-fun c!40522 () Bool)

(assert (=> b!242774 (= c!40522 (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!242775 () Bool)

(assert (=> b!242775 (= e!157557 e!157549)))

(declare-fun res!118944 () Bool)

(assert (=> b!242775 (=> (not res!118944) (not e!157549))))

(assert (=> b!242775 (= res!118944 (contains!1727 lt!121812 (select (arr!5710 (_keys!6606 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!242775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6606 thiss!1504))))))

(declare-fun b!242776 () Bool)

(declare-fun e!157554 () Bool)

(declare-fun call!22624 () Bool)

(assert (=> b!242776 (= e!157554 (not call!22624))))

(declare-fun b!242777 () Bool)

(assert (=> b!242777 (= e!157556 e!157554)))

(declare-fun c!40523 () Bool)

(assert (=> b!242777 (= c!40523 (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22621 () Bool)

(declare-fun call!22623 () ListLongMap!3629)

(declare-fun getCurrentListMapNoExtraKeys!541 (array!12027 array!12025 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 32) Int) ListLongMap!3629)

(assert (=> bm!22621 (= call!22623 (getCurrentListMapNoExtraKeys!541 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(declare-fun b!242778 () Bool)

(declare-fun e!157558 () Unit!7475)

(declare-fun Unit!7486 () Unit!7475)

(assert (=> b!242778 (= e!157558 Unit!7486)))

(declare-fun b!242779 () Bool)

(declare-fun e!157552 () Bool)

(assert (=> b!242779 (= e!157552 (= (apply!225 lt!121812 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4339 thiss!1504)))))

(declare-fun b!242780 () Bool)

(declare-fun e!157561 () Bool)

(assert (=> b!242780 (= e!157554 e!157561)))

(declare-fun res!118946 () Bool)

(assert (=> b!242780 (= res!118946 call!22624)))

(assert (=> b!242780 (=> (not res!118946) (not e!157561))))

(declare-fun bm!22622 () Bool)

(assert (=> bm!22622 (= call!22624 (contains!1727 lt!121812 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!40521 () Bool)

(declare-fun c!40525 () Bool)

(declare-fun bm!22623 () Bool)

(declare-fun call!22626 () ListLongMap!3629)

(declare-fun call!22628 () ListLongMap!3629)

(declare-fun +!658 (ListLongMap!3629 tuple2!4726) ListLongMap!3629)

(assert (=> bm!22623 (= call!22628 (+!658 (ite c!40521 call!22623 (ite c!40525 call!22626 call!22625)) (ite (or c!40521 c!40525) (tuple2!4727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4339 thiss!1504)) (tuple2!4727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4339 thiss!1504)))))))

(declare-fun b!242781 () Bool)

(assert (=> b!242781 (= e!157560 e!157552)))

(declare-fun res!118942 () Bool)

(assert (=> b!242781 (= res!118942 call!22627)))

(assert (=> b!242781 (=> (not res!118942) (not e!157552))))

(declare-fun b!242782 () Bool)

(declare-fun e!157550 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!242782 (= e!157550 (validKeyInArray!0 (select (arr!5710 (_keys!6606 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!242783 () Bool)

(declare-fun e!157555 () ListLongMap!3629)

(assert (=> b!242783 (= e!157555 e!157559)))

(assert (=> b!242783 (= c!40525 (and (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!59855 () Bool)

(assert (=> d!59855 e!157556))

(declare-fun res!118945 () Bool)

(assert (=> d!59855 (=> (not res!118945) (not e!157556))))

(assert (=> d!59855 (= res!118945 (or (bvsge #b00000000000000000000000000000000 (size!6053 (_keys!6606 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6606 thiss!1504))))))))

(declare-fun lt!121827 () ListLongMap!3629)

(assert (=> d!59855 (= lt!121812 lt!121827)))

(declare-fun lt!121808 () Unit!7475)

(assert (=> d!59855 (= lt!121808 e!157558)))

(declare-fun c!40524 () Bool)

(assert (=> d!59855 (= c!40524 e!157550)))

(declare-fun res!118940 () Bool)

(assert (=> d!59855 (=> (not res!118940) (not e!157550))))

(assert (=> d!59855 (= res!118940 (bvslt #b00000000000000000000000000000000 (size!6053 (_keys!6606 thiss!1504))))))

(assert (=> d!59855 (= lt!121827 e!157555)))

(assert (=> d!59855 (= c!40521 (and (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59855 (validMask!0 (mask!10582 thiss!1504))))

(assert (=> d!59855 (= (getCurrentListMap!1339 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)) lt!121812)))

(declare-fun b!242784 () Bool)

(declare-fun lt!121821 () Unit!7475)

(assert (=> b!242784 (= e!157558 lt!121821)))

(declare-fun lt!121815 () ListLongMap!3629)

(assert (=> b!242784 (= lt!121815 (getCurrentListMapNoExtraKeys!541 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(declare-fun lt!121819 () (_ BitVec 64))

(assert (=> b!242784 (= lt!121819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121811 () (_ BitVec 64))

(assert (=> b!242784 (= lt!121811 (select (arr!5710 (_keys!6606 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121826 () Unit!7475)

(declare-fun addStillContains!201 (ListLongMap!3629 (_ BitVec 64) V!8145 (_ BitVec 64)) Unit!7475)

(assert (=> b!242784 (= lt!121826 (addStillContains!201 lt!121815 lt!121819 (zeroValue!4339 thiss!1504) lt!121811))))

(assert (=> b!242784 (contains!1727 (+!658 lt!121815 (tuple2!4727 lt!121819 (zeroValue!4339 thiss!1504))) lt!121811)))

(declare-fun lt!121822 () Unit!7475)

(assert (=> b!242784 (= lt!121822 lt!121826)))

(declare-fun lt!121817 () ListLongMap!3629)

(assert (=> b!242784 (= lt!121817 (getCurrentListMapNoExtraKeys!541 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(declare-fun lt!121814 () (_ BitVec 64))

(assert (=> b!242784 (= lt!121814 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121825 () (_ BitVec 64))

(assert (=> b!242784 (= lt!121825 (select (arr!5710 (_keys!6606 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121818 () Unit!7475)

(declare-fun addApplyDifferent!201 (ListLongMap!3629 (_ BitVec 64) V!8145 (_ BitVec 64)) Unit!7475)

(assert (=> b!242784 (= lt!121818 (addApplyDifferent!201 lt!121817 lt!121814 (minValue!4339 thiss!1504) lt!121825))))

(assert (=> b!242784 (= (apply!225 (+!658 lt!121817 (tuple2!4727 lt!121814 (minValue!4339 thiss!1504))) lt!121825) (apply!225 lt!121817 lt!121825))))

(declare-fun lt!121829 () Unit!7475)

(assert (=> b!242784 (= lt!121829 lt!121818)))

(declare-fun lt!121810 () ListLongMap!3629)

(assert (=> b!242784 (= lt!121810 (getCurrentListMapNoExtraKeys!541 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(declare-fun lt!121809 () (_ BitVec 64))

(assert (=> b!242784 (= lt!121809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121824 () (_ BitVec 64))

(assert (=> b!242784 (= lt!121824 (select (arr!5710 (_keys!6606 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121816 () Unit!7475)

(assert (=> b!242784 (= lt!121816 (addApplyDifferent!201 lt!121810 lt!121809 (zeroValue!4339 thiss!1504) lt!121824))))

(assert (=> b!242784 (= (apply!225 (+!658 lt!121810 (tuple2!4727 lt!121809 (zeroValue!4339 thiss!1504))) lt!121824) (apply!225 lt!121810 lt!121824))))

(declare-fun lt!121820 () Unit!7475)

(assert (=> b!242784 (= lt!121820 lt!121816)))

(declare-fun lt!121828 () ListLongMap!3629)

(assert (=> b!242784 (= lt!121828 (getCurrentListMapNoExtraKeys!541 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(declare-fun lt!121813 () (_ BitVec 64))

(assert (=> b!242784 (= lt!121813 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121823 () (_ BitVec 64))

(assert (=> b!242784 (= lt!121823 (select (arr!5710 (_keys!6606 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242784 (= lt!121821 (addApplyDifferent!201 lt!121828 lt!121813 (minValue!4339 thiss!1504) lt!121823))))

(assert (=> b!242784 (= (apply!225 (+!658 lt!121828 (tuple2!4727 lt!121813 (minValue!4339 thiss!1504))) lt!121823) (apply!225 lt!121828 lt!121823))))

(declare-fun b!242785 () Bool)

(assert (=> b!242785 (= e!157553 (validKeyInArray!0 (select (arr!5710 (_keys!6606 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!242786 () Bool)

(assert (=> b!242786 (= e!157560 (not call!22627))))

(declare-fun b!242787 () Bool)

(assert (=> b!242787 (= e!157555 (+!658 call!22628 (tuple2!4727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4339 thiss!1504))))))

(declare-fun b!242788 () Bool)

(assert (=> b!242788 (= e!157561 (= (apply!225 lt!121812 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4339 thiss!1504)))))

(declare-fun bm!22624 () Bool)

(assert (=> bm!22624 (= call!22625 call!22626)))

(declare-fun bm!22625 () Bool)

(assert (=> bm!22625 (= call!22626 call!22623)))

(declare-fun b!242789 () Bool)

(assert (=> b!242789 (= e!157551 call!22629)))

(declare-fun bm!22626 () Bool)

(assert (=> bm!22626 (= call!22629 call!22628)))

(declare-fun b!242790 () Bool)

(declare-fun c!40520 () Bool)

(assert (=> b!242790 (= c!40520 (and (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!242790 (= e!157559 e!157551)))

(assert (= (and d!59855 c!40521) b!242787))

(assert (= (and d!59855 (not c!40521)) b!242783))

(assert (= (and b!242783 c!40525) b!242772))

(assert (= (and b!242783 (not c!40525)) b!242790))

(assert (= (and b!242790 c!40520) b!242789))

(assert (= (and b!242790 (not c!40520)) b!242773))

(assert (= (or b!242789 b!242773) bm!22624))

(assert (= (or b!242772 bm!22624) bm!22625))

(assert (= (or b!242772 b!242789) bm!22626))

(assert (= (or b!242787 bm!22625) bm!22621))

(assert (= (or b!242787 bm!22626) bm!22623))

(assert (= (and d!59855 res!118940) b!242782))

(assert (= (and d!59855 c!40524) b!242784))

(assert (= (and d!59855 (not c!40524)) b!242778))

(assert (= (and d!59855 res!118945) b!242771))

(assert (= (and b!242771 res!118943) b!242785))

(assert (= (and b!242771 (not res!118939)) b!242775))

(assert (= (and b!242775 res!118944) b!242770))

(assert (= (and b!242771 res!118941) b!242774))

(assert (= (and b!242774 c!40522) b!242781))

(assert (= (and b!242774 (not c!40522)) b!242786))

(assert (= (and b!242781 res!118942) b!242779))

(assert (= (or b!242781 b!242786) bm!22620))

(assert (= (and b!242774 res!118947) b!242777))

(assert (= (and b!242777 c!40523) b!242780))

(assert (= (and b!242777 (not c!40523)) b!242776))

(assert (= (and b!242780 res!118946) b!242788))

(assert (= (or b!242780 b!242776) bm!22622))

(declare-fun b_lambda!7985 () Bool)

(assert (=> (not b_lambda!7985) (not b!242770)))

(declare-fun t!8622 () Bool)

(declare-fun tb!2955 () Bool)

(assert (=> (and b!242543 (= (defaultEntry!4498 thiss!1504) (defaultEntry!4498 thiss!1504)) t!8622) tb!2955))

(declare-fun result!5203 () Bool)

(assert (=> tb!2955 (= result!5203 tp_is_empty!6373)))

(assert (=> b!242770 t!8622))

(declare-fun b_and!13469 () Bool)

(assert (= b_and!13463 (and (=> t!8622 result!5203) b_and!13469)))

(declare-fun m!260925 () Bool)

(assert (=> b!242788 m!260925))

(declare-fun m!260927 () Bool)

(assert (=> b!242787 m!260927))

(declare-fun m!260929 () Bool)

(assert (=> b!242779 m!260929))

(declare-fun m!260931 () Bool)

(assert (=> bm!22622 m!260931))

(declare-fun m!260933 () Bool)

(assert (=> b!242782 m!260933))

(assert (=> b!242782 m!260933))

(declare-fun m!260935 () Bool)

(assert (=> b!242782 m!260935))

(declare-fun m!260937 () Bool)

(assert (=> bm!22620 m!260937))

(declare-fun m!260939 () Bool)

(assert (=> b!242784 m!260939))

(declare-fun m!260941 () Bool)

(assert (=> b!242784 m!260941))

(declare-fun m!260943 () Bool)

(assert (=> b!242784 m!260943))

(declare-fun m!260945 () Bool)

(assert (=> b!242784 m!260945))

(declare-fun m!260947 () Bool)

(assert (=> b!242784 m!260947))

(declare-fun m!260949 () Bool)

(assert (=> b!242784 m!260949))

(declare-fun m!260951 () Bool)

(assert (=> b!242784 m!260951))

(declare-fun m!260953 () Bool)

(assert (=> b!242784 m!260953))

(declare-fun m!260955 () Bool)

(assert (=> b!242784 m!260955))

(assert (=> b!242784 m!260939))

(assert (=> b!242784 m!260949))

(declare-fun m!260957 () Bool)

(assert (=> b!242784 m!260957))

(declare-fun m!260959 () Bool)

(assert (=> b!242784 m!260959))

(declare-fun m!260961 () Bool)

(assert (=> b!242784 m!260961))

(assert (=> b!242784 m!260945))

(declare-fun m!260963 () Bool)

(assert (=> b!242784 m!260963))

(declare-fun m!260965 () Bool)

(assert (=> b!242784 m!260965))

(assert (=> b!242784 m!260933))

(declare-fun m!260967 () Bool)

(assert (=> b!242784 m!260967))

(assert (=> b!242784 m!260959))

(declare-fun m!260969 () Bool)

(assert (=> b!242784 m!260969))

(assert (=> b!242775 m!260933))

(assert (=> b!242775 m!260933))

(declare-fun m!260971 () Bool)

(assert (=> b!242775 m!260971))

(assert (=> b!242785 m!260933))

(assert (=> b!242785 m!260933))

(assert (=> b!242785 m!260935))

(declare-fun m!260973 () Bool)

(assert (=> bm!22623 m!260973))

(assert (=> b!242770 m!260933))

(declare-fun m!260975 () Bool)

(assert (=> b!242770 m!260975))

(assert (=> b!242770 m!260933))

(declare-fun m!260977 () Bool)

(assert (=> b!242770 m!260977))

(declare-fun m!260979 () Bool)

(assert (=> b!242770 m!260979))

(assert (=> b!242770 m!260977))

(assert (=> b!242770 m!260979))

(declare-fun m!260981 () Bool)

(assert (=> b!242770 m!260981))

(assert (=> bm!22621 m!260951))

(declare-fun m!260983 () Bool)

(assert (=> d!59855 m!260983))

(assert (=> b!242552 d!59855))

(declare-fun d!59857 () Bool)

(assert (=> d!59857 (contains!1727 (getCurrentListMap!1339 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)) key!932)))

(declare-fun lt!121832 () Unit!7475)

(declare-fun choose!1138 (array!12027 array!12025 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) (_ BitVec 32) Int) Unit!7475)

(assert (=> d!59857 (= lt!121832 (choose!1138 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(assert (=> d!59857 (validMask!0 (mask!10582 thiss!1504))))

(assert (=> d!59857 (= (lemmaArrayContainsKeyThenInListMap!173 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)) lt!121832)))

(declare-fun bs!8840 () Bool)

(assert (= bs!8840 d!59857))

(assert (=> bs!8840 m!260819))

(assert (=> bs!8840 m!260819))

(assert (=> bs!8840 m!260821))

(declare-fun m!260985 () Bool)

(assert (=> bs!8840 m!260985))

(assert (=> bs!8840 m!260983))

(assert (=> b!242533 d!59857))

(declare-fun d!59859 () Bool)

(assert (=> d!59859 (= (array_inv!3769 (_keys!6606 thiss!1504)) (bvsge (size!6053 (_keys!6606 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242543 d!59859))

(declare-fun d!59861 () Bool)

(assert (=> d!59861 (= (array_inv!3770 (_values!4481 thiss!1504)) (bvsge (size!6052 (_values!4481 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242543 d!59861))

(declare-fun d!59863 () Bool)

(declare-fun res!118952 () Bool)

(declare-fun e!157566 () Bool)

(assert (=> d!59863 (=> res!118952 e!157566)))

(assert (=> d!59863 (= res!118952 (= (select (arr!5710 (_keys!6606 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59863 (= (arrayContainsKey!0 (_keys!6606 thiss!1504) key!932 #b00000000000000000000000000000000) e!157566)))

(declare-fun b!242797 () Bool)

(declare-fun e!157567 () Bool)

(assert (=> b!242797 (= e!157566 e!157567)))

(declare-fun res!118953 () Bool)

(assert (=> b!242797 (=> (not res!118953) (not e!157567))))

(assert (=> b!242797 (= res!118953 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6053 (_keys!6606 thiss!1504))))))

(declare-fun b!242798 () Bool)

(assert (=> b!242798 (= e!157567 (arrayContainsKey!0 (_keys!6606 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59863 (not res!118952)) b!242797))

(assert (= (and b!242797 res!118953) b!242798))

(assert (=> d!59863 m!260933))

(declare-fun m!260987 () Bool)

(assert (=> b!242798 m!260987))

(assert (=> b!242551 d!59863))

(declare-fun d!59865 () Bool)

(assert (=> d!59865 (= (inRange!0 (ite c!40479 (index!6434 lt!121713) (index!6437 lt!121713)) (mask!10582 thiss!1504)) (and (bvsge (ite c!40479 (index!6434 lt!121713) (index!6437 lt!121713)) #b00000000000000000000000000000000) (bvslt (ite c!40479 (index!6434 lt!121713) (index!6437 lt!121713)) (bvadd (mask!10582 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22593 d!59865))

(declare-fun d!59867 () Bool)

(declare-fun res!118960 () Bool)

(declare-fun e!157570 () Bool)

(assert (=> d!59867 (=> (not res!118960) (not e!157570))))

(declare-fun simpleValid!248 (LongMapFixedSize!3586) Bool)

(assert (=> d!59867 (= res!118960 (simpleValid!248 thiss!1504))))

(assert (=> d!59867 (= (valid!1415 thiss!1504) e!157570)))

(declare-fun b!242805 () Bool)

(declare-fun res!118961 () Bool)

(assert (=> b!242805 (=> (not res!118961) (not e!157570))))

(declare-fun arrayCountValidKeys!0 (array!12027 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!242805 (= res!118961 (= (arrayCountValidKeys!0 (_keys!6606 thiss!1504) #b00000000000000000000000000000000 (size!6053 (_keys!6606 thiss!1504))) (_size!1842 thiss!1504)))))

(declare-fun b!242806 () Bool)

(declare-fun res!118962 () Bool)

(assert (=> b!242806 (=> (not res!118962) (not e!157570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12027 (_ BitVec 32)) Bool)

(assert (=> b!242806 (= res!118962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6606 thiss!1504) (mask!10582 thiss!1504)))))

(declare-fun b!242807 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12027 (_ BitVec 32) List!3624) Bool)

(assert (=> b!242807 (= e!157570 (arrayNoDuplicates!0 (_keys!6606 thiss!1504) #b00000000000000000000000000000000 Nil!3621))))

(assert (= (and d!59867 res!118960) b!242805))

(assert (= (and b!242805 res!118961) b!242806))

(assert (= (and b!242806 res!118962) b!242807))

(declare-fun m!260989 () Bool)

(assert (=> d!59867 m!260989))

(declare-fun m!260991 () Bool)

(assert (=> b!242805 m!260991))

(declare-fun m!260993 () Bool)

(assert (=> b!242806 m!260993))

(declare-fun m!260995 () Bool)

(assert (=> b!242807 m!260995))

(assert (=> start!23150 d!59867))

(assert (=> bm!22592 d!59863))

(declare-fun b!242821 () Bool)

(declare-fun lt!121840 () SeekEntryResult!1066)

(declare-fun e!157578 () SeekEntryResult!1066)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12027 (_ BitVec 32)) SeekEntryResult!1066)

(assert (=> b!242821 (= e!157578 (seekKeyOrZeroReturnVacant!0 (x!24289 lt!121840) (index!6436 lt!121840) (index!6436 lt!121840) key!932 (_keys!6606 thiss!1504) (mask!10582 thiss!1504)))))

(declare-fun b!242822 () Bool)

(declare-fun e!157579 () SeekEntryResult!1066)

(declare-fun e!157577 () SeekEntryResult!1066)

(assert (=> b!242822 (= e!157579 e!157577)))

(declare-fun lt!121841 () (_ BitVec 64))

(assert (=> b!242822 (= lt!121841 (select (arr!5710 (_keys!6606 thiss!1504)) (index!6436 lt!121840)))))

(declare-fun c!40532 () Bool)

(assert (=> b!242822 (= c!40532 (= lt!121841 key!932))))

(declare-fun b!242823 () Bool)

(declare-fun c!40534 () Bool)

(assert (=> b!242823 (= c!40534 (= lt!121841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242823 (= e!157577 e!157578)))

(declare-fun b!242824 () Bool)

(assert (=> b!242824 (= e!157579 Undefined!1066)))

(declare-fun b!242825 () Bool)

(assert (=> b!242825 (= e!157577 (Found!1066 (index!6436 lt!121840)))))

(declare-fun d!59869 () Bool)

(declare-fun lt!121839 () SeekEntryResult!1066)

(assert (=> d!59869 (and (or ((_ is Undefined!1066) lt!121839) (not ((_ is Found!1066) lt!121839)) (and (bvsge (index!6435 lt!121839) #b00000000000000000000000000000000) (bvslt (index!6435 lt!121839) (size!6053 (_keys!6606 thiss!1504))))) (or ((_ is Undefined!1066) lt!121839) ((_ is Found!1066) lt!121839) (not ((_ is MissingZero!1066) lt!121839)) (and (bvsge (index!6434 lt!121839) #b00000000000000000000000000000000) (bvslt (index!6434 lt!121839) (size!6053 (_keys!6606 thiss!1504))))) (or ((_ is Undefined!1066) lt!121839) ((_ is Found!1066) lt!121839) ((_ is MissingZero!1066) lt!121839) (not ((_ is MissingVacant!1066) lt!121839)) (and (bvsge (index!6437 lt!121839) #b00000000000000000000000000000000) (bvslt (index!6437 lt!121839) (size!6053 (_keys!6606 thiss!1504))))) (or ((_ is Undefined!1066) lt!121839) (ite ((_ is Found!1066) lt!121839) (= (select (arr!5710 (_keys!6606 thiss!1504)) (index!6435 lt!121839)) key!932) (ite ((_ is MissingZero!1066) lt!121839) (= (select (arr!5710 (_keys!6606 thiss!1504)) (index!6434 lt!121839)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1066) lt!121839) (= (select (arr!5710 (_keys!6606 thiss!1504)) (index!6437 lt!121839)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59869 (= lt!121839 e!157579)))

(declare-fun c!40533 () Bool)

(assert (=> d!59869 (= c!40533 (and ((_ is Intermediate!1066) lt!121840) (undefined!1878 lt!121840)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12027 (_ BitVec 32)) SeekEntryResult!1066)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59869 (= lt!121840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10582 thiss!1504)) key!932 (_keys!6606 thiss!1504) (mask!10582 thiss!1504)))))

(assert (=> d!59869 (validMask!0 (mask!10582 thiss!1504))))

(assert (=> d!59869 (= (seekEntryOrOpen!0 key!932 (_keys!6606 thiss!1504) (mask!10582 thiss!1504)) lt!121839)))

(declare-fun b!242820 () Bool)

(assert (=> b!242820 (= e!157578 (MissingZero!1066 (index!6436 lt!121840)))))

(assert (= (and d!59869 c!40533) b!242824))

(assert (= (and d!59869 (not c!40533)) b!242822))

(assert (= (and b!242822 c!40532) b!242825))

(assert (= (and b!242822 (not c!40532)) b!242823))

(assert (= (and b!242823 c!40534) b!242820))

(assert (= (and b!242823 (not c!40534)) b!242821))

(declare-fun m!260997 () Bool)

(assert (=> b!242821 m!260997))

(declare-fun m!260999 () Bool)

(assert (=> b!242822 m!260999))

(declare-fun m!261001 () Bool)

(assert (=> d!59869 m!261001))

(declare-fun m!261003 () Bool)

(assert (=> d!59869 m!261003))

(assert (=> d!59869 m!260983))

(declare-fun m!261005 () Bool)

(assert (=> d!59869 m!261005))

(declare-fun m!261007 () Bool)

(assert (=> d!59869 m!261007))

(declare-fun m!261009 () Bool)

(assert (=> d!59869 m!261009))

(assert (=> d!59869 m!261007))

(assert (=> b!242531 d!59869))

(declare-fun d!59871 () Bool)

(declare-fun lt!121844 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!159 (List!3624) (InoxSet (_ BitVec 64)))

(assert (=> d!59871 (= lt!121844 (select (content!159 Nil!3621) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157585 () Bool)

(assert (=> d!59871 (= lt!121844 e!157585)))

(declare-fun res!118968 () Bool)

(assert (=> d!59871 (=> (not res!118968) (not e!157585))))

(assert (=> d!59871 (= res!118968 ((_ is Cons!3620) Nil!3621))))

(assert (=> d!59871 (= (contains!1726 Nil!3621 #b0000000000000000000000000000000000000000000000000000000000000000) lt!121844)))

(declare-fun b!242830 () Bool)

(declare-fun e!157584 () Bool)

(assert (=> b!242830 (= e!157585 e!157584)))

(declare-fun res!118967 () Bool)

(assert (=> b!242830 (=> res!118967 e!157584)))

(assert (=> b!242830 (= res!118967 (= (h!4277 Nil!3621) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242831 () Bool)

(assert (=> b!242831 (= e!157584 (contains!1726 (t!8618 Nil!3621) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59871 res!118968) b!242830))

(assert (= (and b!242830 (not res!118967)) b!242831))

(declare-fun m!261011 () Bool)

(assert (=> d!59871 m!261011))

(declare-fun m!261013 () Bool)

(assert (=> d!59871 m!261013))

(declare-fun m!261015 () Bool)

(assert (=> b!242831 m!261015))

(assert (=> b!242530 d!59871))

(declare-fun d!59873 () Bool)

(declare-fun lt!121845 () Bool)

(assert (=> d!59873 (= lt!121845 (select (content!159 Nil!3621) key!932))))

(declare-fun e!157587 () Bool)

(assert (=> d!59873 (= lt!121845 e!157587)))

(declare-fun res!118970 () Bool)

(assert (=> d!59873 (=> (not res!118970) (not e!157587))))

(assert (=> d!59873 (= res!118970 ((_ is Cons!3620) Nil!3621))))

(assert (=> d!59873 (= (contains!1726 Nil!3621 key!932) lt!121845)))

(declare-fun b!242832 () Bool)

(declare-fun e!157586 () Bool)

(assert (=> b!242832 (= e!157587 e!157586)))

(declare-fun res!118969 () Bool)

(assert (=> b!242832 (=> res!118969 e!157586)))

(assert (=> b!242832 (= res!118969 (= (h!4277 Nil!3621) key!932))))

(declare-fun b!242833 () Bool)

(assert (=> b!242833 (= e!157586 (contains!1726 (t!8618 Nil!3621) key!932))))

(assert (= (and d!59873 res!118970) b!242832))

(assert (= (and b!242832 (not res!118969)) b!242833))

(assert (=> d!59873 m!261011))

(declare-fun m!261017 () Bool)

(assert (=> d!59873 m!261017))

(declare-fun m!261019 () Bool)

(assert (=> b!242833 m!261019))

(assert (=> b!242540 d!59873))

(declare-fun d!59875 () Bool)

(declare-fun res!118975 () Bool)

(declare-fun e!157592 () Bool)

(assert (=> d!59875 (=> res!118975 e!157592)))

(assert (=> d!59875 (= res!118975 ((_ is Nil!3621) Nil!3621))))

(assert (=> d!59875 (= (noDuplicate!93 Nil!3621) e!157592)))

(declare-fun b!242838 () Bool)

(declare-fun e!157593 () Bool)

(assert (=> b!242838 (= e!157592 e!157593)))

(declare-fun res!118976 () Bool)

(assert (=> b!242838 (=> (not res!118976) (not e!157593))))

(assert (=> b!242838 (= res!118976 (not (contains!1726 (t!8618 Nil!3621) (h!4277 Nil!3621))))))

(declare-fun b!242839 () Bool)

(assert (=> b!242839 (= e!157593 (noDuplicate!93 (t!8618 Nil!3621)))))

(assert (= (and d!59875 (not res!118975)) b!242838))

(assert (= (and b!242838 res!118976) b!242839))

(declare-fun m!261021 () Bool)

(assert (=> b!242838 m!261021))

(declare-fun m!261023 () Bool)

(assert (=> b!242839 m!261023))

(assert (=> b!242539 d!59875))

(assert (=> b!242536 d!59873))

(declare-fun d!59877 () Bool)

(declare-fun e!157596 () Bool)

(assert (=> d!59877 e!157596))

(declare-fun res!118981 () Bool)

(assert (=> d!59877 (=> (not res!118981) (not e!157596))))

(declare-fun lt!121851 () SeekEntryResult!1066)

(assert (=> d!59877 (= res!118981 ((_ is Found!1066) lt!121851))))

(assert (=> d!59877 (= lt!121851 (seekEntryOrOpen!0 key!932 (_keys!6606 thiss!1504) (mask!10582 thiss!1504)))))

(declare-fun lt!121850 () Unit!7475)

(declare-fun choose!1139 (array!12027 array!12025 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) Int) Unit!7475)

(assert (=> d!59877 (= lt!121850 (choose!1139 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)))))

(assert (=> d!59877 (validMask!0 (mask!10582 thiss!1504))))

(assert (=> d!59877 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!362 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)) lt!121850)))

(declare-fun b!242844 () Bool)

(declare-fun res!118982 () Bool)

(assert (=> b!242844 (=> (not res!118982) (not e!157596))))

(assert (=> b!242844 (= res!118982 (inRange!0 (index!6435 lt!121851) (mask!10582 thiss!1504)))))

(declare-fun b!242845 () Bool)

(assert (=> b!242845 (= e!157596 (= (select (arr!5710 (_keys!6606 thiss!1504)) (index!6435 lt!121851)) key!932))))

(assert (=> b!242845 (and (bvsge (index!6435 lt!121851) #b00000000000000000000000000000000) (bvslt (index!6435 lt!121851) (size!6053 (_keys!6606 thiss!1504))))))

(assert (= (and d!59877 res!118981) b!242844))

(assert (= (and b!242844 res!118982) b!242845))

(assert (=> d!59877 m!260809))

(declare-fun m!261025 () Bool)

(assert (=> d!59877 m!261025))

(assert (=> d!59877 m!260983))

(declare-fun m!261027 () Bool)

(assert (=> b!242844 m!261027))

(declare-fun m!261029 () Bool)

(assert (=> b!242845 m!261029))

(assert (=> b!242535 d!59877))

(declare-fun b!242862 () Bool)

(declare-fun e!157605 () Bool)

(declare-fun call!22635 () Bool)

(assert (=> b!242862 (= e!157605 (not call!22635))))

(declare-fun b!242863 () Bool)

(declare-fun e!157608 () Bool)

(declare-fun e!157607 () Bool)

(assert (=> b!242863 (= e!157608 e!157607)))

(declare-fun res!118992 () Bool)

(declare-fun call!22634 () Bool)

(assert (=> b!242863 (= res!118992 call!22634)))

(assert (=> b!242863 (=> (not res!118992) (not e!157607))))

(declare-fun c!40539 () Bool)

(declare-fun lt!121856 () SeekEntryResult!1066)

(declare-fun bm!22631 () Bool)

(assert (=> bm!22631 (= call!22634 (inRange!0 (ite c!40539 (index!6434 lt!121856) (index!6437 lt!121856)) (mask!10582 thiss!1504)))))

(declare-fun b!242864 () Bool)

(declare-fun e!157606 () Bool)

(assert (=> b!242864 (= e!157608 e!157606)))

(declare-fun c!40540 () Bool)

(assert (=> b!242864 (= c!40540 ((_ is MissingVacant!1066) lt!121856))))

(declare-fun b!242865 () Bool)

(assert (=> b!242865 (and (bvsge (index!6434 lt!121856) #b00000000000000000000000000000000) (bvslt (index!6434 lt!121856) (size!6053 (_keys!6606 thiss!1504))))))

(declare-fun res!118993 () Bool)

(assert (=> b!242865 (= res!118993 (= (select (arr!5710 (_keys!6606 thiss!1504)) (index!6434 lt!121856)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242865 (=> (not res!118993) (not e!157607))))

(declare-fun d!59879 () Bool)

(assert (=> d!59879 e!157608))

(assert (=> d!59879 (= c!40539 ((_ is MissingZero!1066) lt!121856))))

(assert (=> d!59879 (= lt!121856 (seekEntryOrOpen!0 key!932 (_keys!6606 thiss!1504) (mask!10582 thiss!1504)))))

(declare-fun lt!121857 () Unit!7475)

(declare-fun choose!1140 (array!12027 array!12025 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) Int) Unit!7475)

(assert (=> d!59879 (= lt!121857 (choose!1140 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)))))

(assert (=> d!59879 (validMask!0 (mask!10582 thiss!1504))))

(assert (=> d!59879 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!360 (_keys!6606 thiss!1504) (_values!4481 thiss!1504) (mask!10582 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)) lt!121857)))

(declare-fun b!242866 () Bool)

(declare-fun res!118994 () Bool)

(assert (=> b!242866 (=> (not res!118994) (not e!157605))))

(assert (=> b!242866 (= res!118994 call!22634)))

(assert (=> b!242866 (= e!157606 e!157605)))

(declare-fun b!242867 () Bool)

(assert (=> b!242867 (= e!157606 ((_ is Undefined!1066) lt!121856))))

(declare-fun b!242868 () Bool)

(assert (=> b!242868 (= e!157607 (not call!22635))))

(declare-fun bm!22632 () Bool)

(assert (=> bm!22632 (= call!22635 (arrayContainsKey!0 (_keys!6606 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242869 () Bool)

(declare-fun res!118991 () Bool)

(assert (=> b!242869 (=> (not res!118991) (not e!157605))))

(assert (=> b!242869 (= res!118991 (= (select (arr!5710 (_keys!6606 thiss!1504)) (index!6437 lt!121856)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242869 (and (bvsge (index!6437 lt!121856) #b00000000000000000000000000000000) (bvslt (index!6437 lt!121856) (size!6053 (_keys!6606 thiss!1504))))))

(assert (= (and d!59879 c!40539) b!242863))

(assert (= (and d!59879 (not c!40539)) b!242864))

(assert (= (and b!242863 res!118992) b!242865))

(assert (= (and b!242865 res!118993) b!242868))

(assert (= (and b!242864 c!40540) b!242866))

(assert (= (and b!242864 (not c!40540)) b!242867))

(assert (= (and b!242866 res!118994) b!242869))

(assert (= (and b!242869 res!118991) b!242862))

(assert (= (or b!242863 b!242866) bm!22631))

(assert (= (or b!242868 b!242862) bm!22632))

(declare-fun m!261031 () Bool)

(assert (=> b!242865 m!261031))

(declare-fun m!261033 () Bool)

(assert (=> b!242869 m!261033))

(declare-fun m!261035 () Bool)

(assert (=> bm!22631 m!261035))

(assert (=> d!59879 m!260809))

(declare-fun m!261037 () Bool)

(assert (=> d!59879 m!261037))

(assert (=> d!59879 m!260983))

(assert (=> bm!22632 m!260811))

(assert (=> b!242545 d!59879))

(declare-fun d!59881 () Bool)

(declare-fun lt!121858 () Bool)

(assert (=> d!59881 (= lt!121858 (select (content!159 Nil!3621) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157610 () Bool)

(assert (=> d!59881 (= lt!121858 e!157610)))

(declare-fun res!118996 () Bool)

(assert (=> d!59881 (=> (not res!118996) (not e!157610))))

(assert (=> d!59881 (= res!118996 ((_ is Cons!3620) Nil!3621))))

(assert (=> d!59881 (= (contains!1726 Nil!3621 #b1000000000000000000000000000000000000000000000000000000000000000) lt!121858)))

(declare-fun b!242870 () Bool)

(declare-fun e!157609 () Bool)

(assert (=> b!242870 (= e!157610 e!157609)))

(declare-fun res!118995 () Bool)

(assert (=> b!242870 (=> res!118995 e!157609)))

(assert (=> b!242870 (= res!118995 (= (h!4277 Nil!3621) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242871 () Bool)

(assert (=> b!242871 (= e!157609 (contains!1726 (t!8618 Nil!3621) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59881 res!118996) b!242870))

(assert (= (and b!242870 (not res!118995)) b!242871))

(assert (=> d!59881 m!261011))

(declare-fun m!261039 () Bool)

(assert (=> d!59881 m!261039))

(declare-fun m!261041 () Bool)

(assert (=> b!242871 m!261041))

(assert (=> b!242544 d!59881))

(declare-fun b!242878 () Bool)

(declare-fun e!157616 () Bool)

(assert (=> b!242878 (= e!157616 tp_is_empty!6373)))

(declare-fun b!242879 () Bool)

(declare-fun e!157615 () Bool)

(assert (=> b!242879 (= e!157615 tp_is_empty!6373)))

(declare-fun mapNonEmpty!10813 () Bool)

(declare-fun mapRes!10813 () Bool)

(declare-fun tp!22765 () Bool)

(assert (=> mapNonEmpty!10813 (= mapRes!10813 (and tp!22765 e!157616))))

(declare-fun mapKey!10813 () (_ BitVec 32))

(declare-fun mapRest!10813 () (Array (_ BitVec 32) ValueCell!2843))

(declare-fun mapValue!10813 () ValueCell!2843)

(assert (=> mapNonEmpty!10813 (= mapRest!10804 (store mapRest!10813 mapKey!10813 mapValue!10813))))

(declare-fun mapIsEmpty!10813 () Bool)

(assert (=> mapIsEmpty!10813 mapRes!10813))

(declare-fun condMapEmpty!10813 () Bool)

(declare-fun mapDefault!10813 () ValueCell!2843)

(assert (=> mapNonEmpty!10804 (= condMapEmpty!10813 (= mapRest!10804 ((as const (Array (_ BitVec 32) ValueCell!2843)) mapDefault!10813)))))

(assert (=> mapNonEmpty!10804 (= tp!22750 (and e!157615 mapRes!10813))))

(assert (= (and mapNonEmpty!10804 condMapEmpty!10813) mapIsEmpty!10813))

(assert (= (and mapNonEmpty!10804 (not condMapEmpty!10813)) mapNonEmpty!10813))

(assert (= (and mapNonEmpty!10813 ((_ is ValueCellFull!2843) mapValue!10813)) b!242878))

(assert (= (and mapNonEmpty!10804 ((_ is ValueCellFull!2843) mapDefault!10813)) b!242879))

(declare-fun m!261043 () Bool)

(assert (=> mapNonEmpty!10813 m!261043))

(declare-fun b_lambda!7987 () Bool)

(assert (= b_lambda!7985 (or (and b!242543 b_free!6511) b_lambda!7987)))

(check-sat (not b!242871) (not b!242833) (not d!59857) tp_is_empty!6373 (not bm!22623) (not b!242775) (not b!242807) (not b!242779) (not b!242770) (not d!59853) (not b!242839) (not d!59867) (not b!242787) (not d!59879) (not b_lambda!7987) (not bm!22622) (not b!242844) (not b!242785) (not bm!22621) (not b!242831) (not b!242782) (not b_next!6511) (not d!59871) (not b!242784) (not mapNonEmpty!10813) (not b!242806) (not d!59881) (not b!242788) (not b!242838) (not d!59873) (not b!242727) (not b!242725) (not d!59869) (not b!242798) (not b!242821) (not bm!22620) (not d!59855) (not d!59877) (not bm!22632) b_and!13469 (not bm!22631) (not b!242805))
(check-sat b_and!13469 (not b_next!6511))
