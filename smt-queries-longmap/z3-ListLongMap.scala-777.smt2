; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18410 () Bool)

(assert start!18410)

(declare-fun b!182611 () Bool)

(declare-fun b_free!4501 () Bool)

(declare-fun b_next!4501 () Bool)

(assert (=> b!182611 (= b_free!4501 (not b_next!4501))))

(declare-fun tp!16264 () Bool)

(declare-fun b_and!11079 () Bool)

(assert (=> b!182611 (= tp!16264 b_and!11079)))

(declare-fun b!182602 () Bool)

(declare-fun e!120227 () Bool)

(declare-datatypes ((V!5345 0))(
  ( (V!5346 (val!2181 Int)) )
))
(declare-datatypes ((ValueCell!1793 0))(
  ( (ValueCellFull!1793 (v!4082 V!5345)) (EmptyCell!1793) )
))
(declare-datatypes ((array!7719 0))(
  ( (array!7720 (arr!3650 (Array (_ BitVec 32) (_ BitVec 64))) (size!3962 (_ BitVec 32))) )
))
(declare-datatypes ((array!7721 0))(
  ( (array!7722 (arr!3651 (Array (_ BitVec 32) ValueCell!1793)) (size!3963 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2494 0))(
  ( (LongMapFixedSize!2495 (defaultEntry!3734 Int) (mask!8780 (_ BitVec 32)) (extraKeys!3471 (_ BitVec 32)) (zeroValue!3575 V!5345) (minValue!3575 V!5345) (_size!1296 (_ BitVec 32)) (_keys!5647 array!7719) (_values!3717 array!7721) (_vacant!1296 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2494)

(declare-datatypes ((List!2285 0))(
  ( (Nil!2282) (Cons!2281 (h!2910 (_ BitVec 64)) (t!7139 List!2285)) )
))
(declare-fun arrayNoDuplicates!0 (array!7719 (_ BitVec 32) List!2285) Bool)

(assert (=> b!182602 (= e!120227 (not (arrayNoDuplicates!0 (_keys!5647 thiss!1248) #b00000000000000000000000000000000 Nil!2282)))))

(declare-fun b!182603 () Bool)

(declare-fun res!86413 () Bool)

(assert (=> b!182603 (=> (not res!86413) (not e!120227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182603 (= res!86413 (validMask!0 (mask!8780 thiss!1248)))))

(declare-fun b!182604 () Bool)

(declare-fun res!86415 () Bool)

(assert (=> b!182604 (=> (not res!86415) (not e!120227))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3344 0))(
  ( (tuple2!3345 (_1!1683 (_ BitVec 64)) (_2!1683 V!5345)) )
))
(declare-datatypes ((List!2286 0))(
  ( (Nil!2283) (Cons!2282 (h!2911 tuple2!3344) (t!7140 List!2286)) )
))
(declare-datatypes ((ListLongMap!2265 0))(
  ( (ListLongMap!2266 (toList!1148 List!2286)) )
))
(declare-fun contains!1244 (ListLongMap!2265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!800 (array!7719 array!7721 (_ BitVec 32) (_ BitVec 32) V!5345 V!5345 (_ BitVec 32) Int) ListLongMap!2265)

(assert (=> b!182604 (= res!86415 (contains!1244 (getCurrentListMap!800 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)) key!828))))

(declare-fun b!182605 () Bool)

(declare-fun res!86412 () Bool)

(assert (=> b!182605 (=> (not res!86412) (not e!120227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7719 (_ BitVec 32)) Bool)

(assert (=> b!182605 (= res!86412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5647 thiss!1248) (mask!8780 thiss!1248)))))

(declare-fun b!182606 () Bool)

(declare-fun res!86414 () Bool)

(assert (=> b!182606 (=> (not res!86414) (not e!120227))))

(assert (=> b!182606 (= res!86414 (and (= (size!3963 (_values!3717 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8780 thiss!1248))) (= (size!3962 (_keys!5647 thiss!1248)) (size!3963 (_values!3717 thiss!1248))) (bvsge (mask!8780 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3471 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3471 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7334 () Bool)

(declare-fun mapRes!7334 () Bool)

(assert (=> mapIsEmpty!7334 mapRes!7334))

(declare-fun mapNonEmpty!7334 () Bool)

(declare-fun tp!16265 () Bool)

(declare-fun e!120233 () Bool)

(assert (=> mapNonEmpty!7334 (= mapRes!7334 (and tp!16265 e!120233))))

(declare-fun mapValue!7334 () ValueCell!1793)

(declare-fun mapKey!7334 () (_ BitVec 32))

(declare-fun mapRest!7334 () (Array (_ BitVec 32) ValueCell!1793))

(assert (=> mapNonEmpty!7334 (= (arr!3651 (_values!3717 thiss!1248)) (store mapRest!7334 mapKey!7334 mapValue!7334))))

(declare-fun b!182607 () Bool)

(declare-fun e!120230 () Bool)

(assert (=> b!182607 (= e!120230 e!120227)))

(declare-fun res!86418 () Bool)

(assert (=> b!182607 (=> (not res!86418) (not e!120227))))

(declare-datatypes ((SeekEntryResult!598 0))(
  ( (MissingZero!598 (index!4562 (_ BitVec 32))) (Found!598 (index!4563 (_ BitVec 32))) (Intermediate!598 (undefined!1410 Bool) (index!4564 (_ BitVec 32)) (x!19890 (_ BitVec 32))) (Undefined!598) (MissingVacant!598 (index!4565 (_ BitVec 32))) )
))
(declare-fun lt!90354 () SeekEntryResult!598)

(get-info :version)

(assert (=> b!182607 (= res!86418 (and (not ((_ is Undefined!598) lt!90354)) (not ((_ is MissingVacant!598) lt!90354)) (not ((_ is MissingZero!598) lt!90354)) ((_ is Found!598) lt!90354)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7719 (_ BitVec 32)) SeekEntryResult!598)

(assert (=> b!182607 (= lt!90354 (seekEntryOrOpen!0 key!828 (_keys!5647 thiss!1248) (mask!8780 thiss!1248)))))

(declare-fun b!182608 () Bool)

(declare-fun e!120229 () Bool)

(declare-fun tp_is_empty!4273 () Bool)

(assert (=> b!182608 (= e!120229 tp_is_empty!4273)))

(declare-fun res!86416 () Bool)

(assert (=> start!18410 (=> (not res!86416) (not e!120230))))

(declare-fun valid!1055 (LongMapFixedSize!2494) Bool)

(assert (=> start!18410 (= res!86416 (valid!1055 thiss!1248))))

(assert (=> start!18410 e!120230))

(declare-fun e!120232 () Bool)

(assert (=> start!18410 e!120232))

(assert (=> start!18410 true))

(declare-fun b!182609 () Bool)

(declare-fun res!86417 () Bool)

(assert (=> b!182609 (=> (not res!86417) (not e!120230))))

(assert (=> b!182609 (= res!86417 (not (= key!828 (bvneg key!828))))))

(declare-fun b!182610 () Bool)

(declare-fun e!120231 () Bool)

(assert (=> b!182610 (= e!120231 (and e!120229 mapRes!7334))))

(declare-fun condMapEmpty!7334 () Bool)

(declare-fun mapDefault!7334 () ValueCell!1793)

(assert (=> b!182610 (= condMapEmpty!7334 (= (arr!3651 (_values!3717 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1793)) mapDefault!7334)))))

(declare-fun array_inv!2355 (array!7719) Bool)

(declare-fun array_inv!2356 (array!7721) Bool)

(assert (=> b!182611 (= e!120232 (and tp!16264 tp_is_empty!4273 (array_inv!2355 (_keys!5647 thiss!1248)) (array_inv!2356 (_values!3717 thiss!1248)) e!120231))))

(declare-fun b!182612 () Bool)

(assert (=> b!182612 (= e!120233 tp_is_empty!4273)))

(assert (= (and start!18410 res!86416) b!182609))

(assert (= (and b!182609 res!86417) b!182607))

(assert (= (and b!182607 res!86418) b!182604))

(assert (= (and b!182604 res!86415) b!182603))

(assert (= (and b!182603 res!86413) b!182606))

(assert (= (and b!182606 res!86414) b!182605))

(assert (= (and b!182605 res!86412) b!182602))

(assert (= (and b!182610 condMapEmpty!7334) mapIsEmpty!7334))

(assert (= (and b!182610 (not condMapEmpty!7334)) mapNonEmpty!7334))

(assert (= (and mapNonEmpty!7334 ((_ is ValueCellFull!1793) mapValue!7334)) b!182612))

(assert (= (and b!182610 ((_ is ValueCellFull!1793) mapDefault!7334)) b!182608))

(assert (= b!182611 b!182610))

(assert (= start!18410 b!182611))

(declare-fun m!210493 () Bool)

(assert (=> b!182605 m!210493))

(declare-fun m!210495 () Bool)

(assert (=> b!182607 m!210495))

(declare-fun m!210497 () Bool)

(assert (=> mapNonEmpty!7334 m!210497))

(declare-fun m!210499 () Bool)

(assert (=> b!182603 m!210499))

(declare-fun m!210501 () Bool)

(assert (=> b!182604 m!210501))

(assert (=> b!182604 m!210501))

(declare-fun m!210503 () Bool)

(assert (=> b!182604 m!210503))

(declare-fun m!210505 () Bool)

(assert (=> b!182602 m!210505))

(declare-fun m!210507 () Bool)

(assert (=> b!182611 m!210507))

(declare-fun m!210509 () Bool)

(assert (=> b!182611 m!210509))

(declare-fun m!210511 () Bool)

(assert (=> start!18410 m!210511))

(check-sat (not b_next!4501) (not b!182603) (not b!182604) (not b!182605) (not b!182607) b_and!11079 tp_is_empty!4273 (not mapNonEmpty!7334) (not b!182602) (not b!182611) (not start!18410))
(check-sat b_and!11079 (not b_next!4501))
(get-model)

(declare-fun b!182687 () Bool)

(declare-fun e!120282 () Bool)

(declare-fun e!120283 () Bool)

(assert (=> b!182687 (= e!120282 e!120283)))

(declare-fun lt!90369 () (_ BitVec 64))

(assert (=> b!182687 (= lt!90369 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5536 0))(
  ( (Unit!5537) )
))
(declare-fun lt!90368 () Unit!5536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7719 (_ BitVec 64) (_ BitVec 32)) Unit!5536)

(assert (=> b!182687 (= lt!90368 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5647 thiss!1248) lt!90369 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!182687 (arrayContainsKey!0 (_keys!5647 thiss!1248) lt!90369 #b00000000000000000000000000000000)))

(declare-fun lt!90367 () Unit!5536)

(assert (=> b!182687 (= lt!90367 lt!90368)))

(declare-fun res!86466 () Bool)

(assert (=> b!182687 (= res!86466 (= (seekEntryOrOpen!0 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000) (_keys!5647 thiss!1248) (mask!8780 thiss!1248)) (Found!598 #b00000000000000000000000000000000)))))

(assert (=> b!182687 (=> (not res!86466) (not e!120283))))

(declare-fun b!182688 () Bool)

(declare-fun call!18424 () Bool)

(assert (=> b!182688 (= e!120283 call!18424)))

(declare-fun b!182689 () Bool)

(declare-fun e!120284 () Bool)

(assert (=> b!182689 (= e!120284 e!120282)))

(declare-fun c!32761 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182689 (= c!32761 (validKeyInArray!0 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54717 () Bool)

(declare-fun res!86465 () Bool)

(assert (=> d!54717 (=> res!86465 e!120284)))

(assert (=> d!54717 (= res!86465 (bvsge #b00000000000000000000000000000000 (size!3962 (_keys!5647 thiss!1248))))))

(assert (=> d!54717 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5647 thiss!1248) (mask!8780 thiss!1248)) e!120284)))

(declare-fun bm!18421 () Bool)

(assert (=> bm!18421 (= call!18424 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5647 thiss!1248) (mask!8780 thiss!1248)))))

(declare-fun b!182690 () Bool)

(assert (=> b!182690 (= e!120282 call!18424)))

(assert (= (and d!54717 (not res!86465)) b!182689))

(assert (= (and b!182689 c!32761) b!182687))

(assert (= (and b!182689 (not c!32761)) b!182690))

(assert (= (and b!182687 res!86466) b!182688))

(assert (= (or b!182688 b!182690) bm!18421))

(declare-fun m!210553 () Bool)

(assert (=> b!182687 m!210553))

(declare-fun m!210555 () Bool)

(assert (=> b!182687 m!210555))

(declare-fun m!210557 () Bool)

(assert (=> b!182687 m!210557))

(assert (=> b!182687 m!210553))

(declare-fun m!210559 () Bool)

(assert (=> b!182687 m!210559))

(assert (=> b!182689 m!210553))

(assert (=> b!182689 m!210553))

(declare-fun m!210561 () Bool)

(assert (=> b!182689 m!210561))

(declare-fun m!210563 () Bool)

(assert (=> bm!18421 m!210563))

(assert (=> b!182605 d!54717))

(declare-fun d!54719 () Bool)

(declare-fun res!86473 () Bool)

(declare-fun e!120287 () Bool)

(assert (=> d!54719 (=> (not res!86473) (not e!120287))))

(declare-fun simpleValid!172 (LongMapFixedSize!2494) Bool)

(assert (=> d!54719 (= res!86473 (simpleValid!172 thiss!1248))))

(assert (=> d!54719 (= (valid!1055 thiss!1248) e!120287)))

(declare-fun b!182697 () Bool)

(declare-fun res!86474 () Bool)

(assert (=> b!182697 (=> (not res!86474) (not e!120287))))

(declare-fun arrayCountValidKeys!0 (array!7719 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182697 (= res!86474 (= (arrayCountValidKeys!0 (_keys!5647 thiss!1248) #b00000000000000000000000000000000 (size!3962 (_keys!5647 thiss!1248))) (_size!1296 thiss!1248)))))

(declare-fun b!182698 () Bool)

(declare-fun res!86475 () Bool)

(assert (=> b!182698 (=> (not res!86475) (not e!120287))))

(assert (=> b!182698 (= res!86475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5647 thiss!1248) (mask!8780 thiss!1248)))))

(declare-fun b!182699 () Bool)

(assert (=> b!182699 (= e!120287 (arrayNoDuplicates!0 (_keys!5647 thiss!1248) #b00000000000000000000000000000000 Nil!2282))))

(assert (= (and d!54719 res!86473) b!182697))

(assert (= (and b!182697 res!86474) b!182698))

(assert (= (and b!182698 res!86475) b!182699))

(declare-fun m!210565 () Bool)

(assert (=> d!54719 m!210565))

(declare-fun m!210567 () Bool)

(assert (=> b!182697 m!210567))

(assert (=> b!182698 m!210493))

(assert (=> b!182699 m!210505))

(assert (=> start!18410 d!54719))

(declare-fun b!182712 () Bool)

(declare-fun e!120296 () SeekEntryResult!598)

(declare-fun lt!90376 () SeekEntryResult!598)

(assert (=> b!182712 (= e!120296 (Found!598 (index!4564 lt!90376)))))

(declare-fun b!182713 () Bool)

(declare-fun e!120295 () SeekEntryResult!598)

(assert (=> b!182713 (= e!120295 e!120296)))

(declare-fun lt!90377 () (_ BitVec 64))

(assert (=> b!182713 (= lt!90377 (select (arr!3650 (_keys!5647 thiss!1248)) (index!4564 lt!90376)))))

(declare-fun c!32768 () Bool)

(assert (=> b!182713 (= c!32768 (= lt!90377 key!828))))

(declare-fun b!182714 () Bool)

(declare-fun e!120294 () SeekEntryResult!598)

(assert (=> b!182714 (= e!120294 (MissingZero!598 (index!4564 lt!90376)))))

(declare-fun b!182715 () Bool)

(assert (=> b!182715 (= e!120295 Undefined!598)))

(declare-fun d!54721 () Bool)

(declare-fun lt!90378 () SeekEntryResult!598)

(assert (=> d!54721 (and (or ((_ is Undefined!598) lt!90378) (not ((_ is Found!598) lt!90378)) (and (bvsge (index!4563 lt!90378) #b00000000000000000000000000000000) (bvslt (index!4563 lt!90378) (size!3962 (_keys!5647 thiss!1248))))) (or ((_ is Undefined!598) lt!90378) ((_ is Found!598) lt!90378) (not ((_ is MissingZero!598) lt!90378)) (and (bvsge (index!4562 lt!90378) #b00000000000000000000000000000000) (bvslt (index!4562 lt!90378) (size!3962 (_keys!5647 thiss!1248))))) (or ((_ is Undefined!598) lt!90378) ((_ is Found!598) lt!90378) ((_ is MissingZero!598) lt!90378) (not ((_ is MissingVacant!598) lt!90378)) (and (bvsge (index!4565 lt!90378) #b00000000000000000000000000000000) (bvslt (index!4565 lt!90378) (size!3962 (_keys!5647 thiss!1248))))) (or ((_ is Undefined!598) lt!90378) (ite ((_ is Found!598) lt!90378) (= (select (arr!3650 (_keys!5647 thiss!1248)) (index!4563 lt!90378)) key!828) (ite ((_ is MissingZero!598) lt!90378) (= (select (arr!3650 (_keys!5647 thiss!1248)) (index!4562 lt!90378)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!598) lt!90378) (= (select (arr!3650 (_keys!5647 thiss!1248)) (index!4565 lt!90378)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54721 (= lt!90378 e!120295)))

(declare-fun c!32770 () Bool)

(assert (=> d!54721 (= c!32770 (and ((_ is Intermediate!598) lt!90376) (undefined!1410 lt!90376)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7719 (_ BitVec 32)) SeekEntryResult!598)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54721 (= lt!90376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8780 thiss!1248)) key!828 (_keys!5647 thiss!1248) (mask!8780 thiss!1248)))))

(assert (=> d!54721 (validMask!0 (mask!8780 thiss!1248))))

(assert (=> d!54721 (= (seekEntryOrOpen!0 key!828 (_keys!5647 thiss!1248) (mask!8780 thiss!1248)) lt!90378)))

(declare-fun b!182716 () Bool)

(declare-fun c!32769 () Bool)

(assert (=> b!182716 (= c!32769 (= lt!90377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182716 (= e!120296 e!120294)))

(declare-fun b!182717 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7719 (_ BitVec 32)) SeekEntryResult!598)

(assert (=> b!182717 (= e!120294 (seekKeyOrZeroReturnVacant!0 (x!19890 lt!90376) (index!4564 lt!90376) (index!4564 lt!90376) key!828 (_keys!5647 thiss!1248) (mask!8780 thiss!1248)))))

(assert (= (and d!54721 c!32770) b!182715))

(assert (= (and d!54721 (not c!32770)) b!182713))

(assert (= (and b!182713 c!32768) b!182712))

(assert (= (and b!182713 (not c!32768)) b!182716))

(assert (= (and b!182716 c!32769) b!182714))

(assert (= (and b!182716 (not c!32769)) b!182717))

(declare-fun m!210569 () Bool)

(assert (=> b!182713 m!210569))

(declare-fun m!210571 () Bool)

(assert (=> d!54721 m!210571))

(declare-fun m!210573 () Bool)

(assert (=> d!54721 m!210573))

(declare-fun m!210575 () Bool)

(assert (=> d!54721 m!210575))

(declare-fun m!210577 () Bool)

(assert (=> d!54721 m!210577))

(declare-fun m!210579 () Bool)

(assert (=> d!54721 m!210579))

(assert (=> d!54721 m!210571))

(assert (=> d!54721 m!210499))

(declare-fun m!210581 () Bool)

(assert (=> b!182717 m!210581))

(assert (=> b!182607 d!54721))

(declare-fun d!54723 () Bool)

(declare-fun e!120302 () Bool)

(assert (=> d!54723 e!120302))

(declare-fun res!86478 () Bool)

(assert (=> d!54723 (=> res!86478 e!120302)))

(declare-fun lt!90387 () Bool)

(assert (=> d!54723 (= res!86478 (not lt!90387))))

(declare-fun lt!90390 () Bool)

(assert (=> d!54723 (= lt!90387 lt!90390)))

(declare-fun lt!90388 () Unit!5536)

(declare-fun e!120301 () Unit!5536)

(assert (=> d!54723 (= lt!90388 e!120301)))

(declare-fun c!32773 () Bool)

(assert (=> d!54723 (= c!32773 lt!90390)))

(declare-fun containsKey!217 (List!2286 (_ BitVec 64)) Bool)

(assert (=> d!54723 (= lt!90390 (containsKey!217 (toList!1148 (getCurrentListMap!800 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248))) key!828))))

(assert (=> d!54723 (= (contains!1244 (getCurrentListMap!800 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)) key!828) lt!90387)))

(declare-fun b!182724 () Bool)

(declare-fun lt!90389 () Unit!5536)

(assert (=> b!182724 (= e!120301 lt!90389)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!165 (List!2286 (_ BitVec 64)) Unit!5536)

(assert (=> b!182724 (= lt!90389 (lemmaContainsKeyImpliesGetValueByKeyDefined!165 (toList!1148 (getCurrentListMap!800 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248))) key!828))))

(declare-datatypes ((Option!220 0))(
  ( (Some!219 (v!4085 V!5345)) (None!218) )
))
(declare-fun isDefined!166 (Option!220) Bool)

(declare-fun getValueByKey!214 (List!2286 (_ BitVec 64)) Option!220)

(assert (=> b!182724 (isDefined!166 (getValueByKey!214 (toList!1148 (getCurrentListMap!800 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248))) key!828))))

(declare-fun b!182725 () Bool)

(declare-fun Unit!5538 () Unit!5536)

(assert (=> b!182725 (= e!120301 Unit!5538)))

(declare-fun b!182726 () Bool)

(assert (=> b!182726 (= e!120302 (isDefined!166 (getValueByKey!214 (toList!1148 (getCurrentListMap!800 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248))) key!828)))))

(assert (= (and d!54723 c!32773) b!182724))

(assert (= (and d!54723 (not c!32773)) b!182725))

(assert (= (and d!54723 (not res!86478)) b!182726))

(declare-fun m!210583 () Bool)

(assert (=> d!54723 m!210583))

(declare-fun m!210585 () Bool)

(assert (=> b!182724 m!210585))

(declare-fun m!210587 () Bool)

(assert (=> b!182724 m!210587))

(assert (=> b!182724 m!210587))

(declare-fun m!210589 () Bool)

(assert (=> b!182724 m!210589))

(assert (=> b!182726 m!210587))

(assert (=> b!182726 m!210587))

(assert (=> b!182726 m!210589))

(assert (=> b!182604 d!54723))

(declare-fun bm!18436 () Bool)

(declare-fun call!18440 () ListLongMap!2265)

(declare-fun getCurrentListMapNoExtraKeys!187 (array!7719 array!7721 (_ BitVec 32) (_ BitVec 32) V!5345 V!5345 (_ BitVec 32) Int) ListLongMap!2265)

(assert (=> bm!18436 (= call!18440 (getCurrentListMapNoExtraKeys!187 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)))))

(declare-fun b!182769 () Bool)

(declare-fun e!120329 () Bool)

(assert (=> b!182769 (= e!120329 (validKeyInArray!0 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18437 () Bool)

(declare-fun call!18439 () Bool)

(declare-fun lt!90435 () ListLongMap!2265)

(assert (=> bm!18437 (= call!18439 (contains!1244 lt!90435 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182770 () Bool)

(declare-fun e!120330 () Bool)

(declare-fun e!120337 () Bool)

(assert (=> b!182770 (= e!120330 e!120337)))

(declare-fun res!86501 () Bool)

(declare-fun call!18442 () Bool)

(assert (=> b!182770 (= res!86501 call!18442)))

(assert (=> b!182770 (=> (not res!86501) (not e!120337))))

(declare-fun b!182771 () Bool)

(declare-fun e!120340 () ListLongMap!2265)

(declare-fun call!18445 () ListLongMap!2265)

(declare-fun +!276 (ListLongMap!2265 tuple2!3344) ListLongMap!2265)

(assert (=> b!182771 (= e!120340 (+!276 call!18445 (tuple2!3345 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3575 thiss!1248))))))

(declare-fun b!182772 () Bool)

(declare-fun res!86500 () Bool)

(declare-fun e!120341 () Bool)

(assert (=> b!182772 (=> (not res!86500) (not e!120341))))

(declare-fun e!120335 () Bool)

(assert (=> b!182772 (= res!86500 e!120335)))

(declare-fun res!86502 () Bool)

(assert (=> b!182772 (=> res!86502 e!120335)))

(assert (=> b!182772 (= res!86502 (not e!120329))))

(declare-fun res!86504 () Bool)

(assert (=> b!182772 (=> (not res!86504) (not e!120329))))

(assert (=> b!182772 (= res!86504 (bvslt #b00000000000000000000000000000000 (size!3962 (_keys!5647 thiss!1248))))))

(declare-fun b!182773 () Bool)

(declare-fun res!86497 () Bool)

(assert (=> b!182773 (=> (not res!86497) (not e!120341))))

(declare-fun e!120333 () Bool)

(assert (=> b!182773 (= res!86497 e!120333)))

(declare-fun c!32786 () Bool)

(assert (=> b!182773 (= c!32786 (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!182774 () Bool)

(declare-fun e!120334 () ListLongMap!2265)

(declare-fun call!18441 () ListLongMap!2265)

(assert (=> b!182774 (= e!120334 call!18441)))

(declare-fun b!182775 () Bool)

(declare-fun e!120332 () Bool)

(declare-fun apply!156 (ListLongMap!2265 (_ BitVec 64)) V!5345)

(declare-fun get!2103 (ValueCell!1793 V!5345) V!5345)

(declare-fun dynLambda!499 (Int (_ BitVec 64)) V!5345)

(assert (=> b!182775 (= e!120332 (= (apply!156 lt!90435 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000)) (get!2103 (select (arr!3651 (_values!3717 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!499 (defaultEntry!3734 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3963 (_values!3717 thiss!1248))))))

(assert (=> b!182775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3962 (_keys!5647 thiss!1248))))))

(declare-fun b!182776 () Bool)

(assert (=> b!182776 (= e!120337 (= (apply!156 lt!90435 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3575 thiss!1248)))))

(declare-fun b!182777 () Bool)

(declare-fun e!120339 () Unit!5536)

(declare-fun Unit!5539 () Unit!5536)

(assert (=> b!182777 (= e!120339 Unit!5539)))

(declare-fun b!182778 () Bool)

(declare-fun call!18444 () ListLongMap!2265)

(assert (=> b!182778 (= e!120334 call!18444)))

(declare-fun b!182780 () Bool)

(assert (=> b!182780 (= e!120333 (not call!18439))))

(declare-fun b!182781 () Bool)

(assert (=> b!182781 (= e!120335 e!120332)))

(declare-fun res!86499 () Bool)

(assert (=> b!182781 (=> (not res!86499) (not e!120332))))

(assert (=> b!182781 (= res!86499 (contains!1244 lt!90435 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182781 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3962 (_keys!5647 thiss!1248))))))

(declare-fun b!182782 () Bool)

(declare-fun e!120336 () ListLongMap!2265)

(assert (=> b!182782 (= e!120336 call!18444)))

(declare-fun b!182783 () Bool)

(declare-fun lt!90448 () Unit!5536)

(assert (=> b!182783 (= e!120339 lt!90448)))

(declare-fun lt!90447 () ListLongMap!2265)

(assert (=> b!182783 (= lt!90447 (getCurrentListMapNoExtraKeys!187 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)))))

(declare-fun lt!90446 () (_ BitVec 64))

(assert (=> b!182783 (= lt!90446 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90456 () (_ BitVec 64))

(assert (=> b!182783 (= lt!90456 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90449 () Unit!5536)

(declare-fun addStillContains!132 (ListLongMap!2265 (_ BitVec 64) V!5345 (_ BitVec 64)) Unit!5536)

(assert (=> b!182783 (= lt!90449 (addStillContains!132 lt!90447 lt!90446 (zeroValue!3575 thiss!1248) lt!90456))))

(assert (=> b!182783 (contains!1244 (+!276 lt!90447 (tuple2!3345 lt!90446 (zeroValue!3575 thiss!1248))) lt!90456)))

(declare-fun lt!90436 () Unit!5536)

(assert (=> b!182783 (= lt!90436 lt!90449)))

(declare-fun lt!90453 () ListLongMap!2265)

(assert (=> b!182783 (= lt!90453 (getCurrentListMapNoExtraKeys!187 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)))))

(declare-fun lt!90451 () (_ BitVec 64))

(assert (=> b!182783 (= lt!90451 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90455 () (_ BitVec 64))

(assert (=> b!182783 (= lt!90455 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90444 () Unit!5536)

(declare-fun addApplyDifferent!132 (ListLongMap!2265 (_ BitVec 64) V!5345 (_ BitVec 64)) Unit!5536)

(assert (=> b!182783 (= lt!90444 (addApplyDifferent!132 lt!90453 lt!90451 (minValue!3575 thiss!1248) lt!90455))))

(assert (=> b!182783 (= (apply!156 (+!276 lt!90453 (tuple2!3345 lt!90451 (minValue!3575 thiss!1248))) lt!90455) (apply!156 lt!90453 lt!90455))))

(declare-fun lt!90441 () Unit!5536)

(assert (=> b!182783 (= lt!90441 lt!90444)))

(declare-fun lt!90437 () ListLongMap!2265)

(assert (=> b!182783 (= lt!90437 (getCurrentListMapNoExtraKeys!187 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)))))

(declare-fun lt!90445 () (_ BitVec 64))

(assert (=> b!182783 (= lt!90445 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90438 () (_ BitVec 64))

(assert (=> b!182783 (= lt!90438 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90454 () Unit!5536)

(assert (=> b!182783 (= lt!90454 (addApplyDifferent!132 lt!90437 lt!90445 (zeroValue!3575 thiss!1248) lt!90438))))

(assert (=> b!182783 (= (apply!156 (+!276 lt!90437 (tuple2!3345 lt!90445 (zeroValue!3575 thiss!1248))) lt!90438) (apply!156 lt!90437 lt!90438))))

(declare-fun lt!90440 () Unit!5536)

(assert (=> b!182783 (= lt!90440 lt!90454)))

(declare-fun lt!90443 () ListLongMap!2265)

(assert (=> b!182783 (= lt!90443 (getCurrentListMapNoExtraKeys!187 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)))))

(declare-fun lt!90452 () (_ BitVec 64))

(assert (=> b!182783 (= lt!90452 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90442 () (_ BitVec 64))

(assert (=> b!182783 (= lt!90442 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182783 (= lt!90448 (addApplyDifferent!132 lt!90443 lt!90452 (minValue!3575 thiss!1248) lt!90442))))

(assert (=> b!182783 (= (apply!156 (+!276 lt!90443 (tuple2!3345 lt!90452 (minValue!3575 thiss!1248))) lt!90442) (apply!156 lt!90443 lt!90442))))

(declare-fun b!182784 () Bool)

(assert (=> b!182784 (= e!120330 (not call!18442))))

(declare-fun bm!18438 () Bool)

(assert (=> bm!18438 (= call!18442 (contains!1244 lt!90435 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182785 () Bool)

(declare-fun c!32788 () Bool)

(assert (=> b!182785 (= c!32788 (and (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!182785 (= e!120336 e!120334)))

(declare-fun b!182786 () Bool)

(declare-fun e!120331 () Bool)

(assert (=> b!182786 (= e!120331 (= (apply!156 lt!90435 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3575 thiss!1248)))))

(declare-fun bm!18439 () Bool)

(declare-fun call!18443 () ListLongMap!2265)

(assert (=> bm!18439 (= call!18443 call!18440)))

(declare-fun bm!18440 () Bool)

(declare-fun c!32787 () Bool)

(declare-fun c!32791 () Bool)

(assert (=> bm!18440 (= call!18445 (+!276 (ite c!32791 call!18440 (ite c!32787 call!18443 call!18441)) (ite (or c!32791 c!32787) (tuple2!3345 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3575 thiss!1248)) (tuple2!3345 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3575 thiss!1248)))))))

(declare-fun b!182787 () Bool)

(assert (=> b!182787 (= e!120341 e!120330)))

(declare-fun c!32790 () Bool)

(assert (=> b!182787 (= c!32790 (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18441 () Bool)

(assert (=> bm!18441 (= call!18444 call!18445)))

(declare-fun bm!18442 () Bool)

(assert (=> bm!18442 (= call!18441 call!18443)))

(declare-fun b!182788 () Bool)

(declare-fun e!120338 () Bool)

(assert (=> b!182788 (= e!120338 (validKeyInArray!0 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182789 () Bool)

(assert (=> b!182789 (= e!120333 e!120331)))

(declare-fun res!86505 () Bool)

(assert (=> b!182789 (= res!86505 call!18439)))

(assert (=> b!182789 (=> (not res!86505) (not e!120331))))

(declare-fun d!54725 () Bool)

(assert (=> d!54725 e!120341))

(declare-fun res!86503 () Bool)

(assert (=> d!54725 (=> (not res!86503) (not e!120341))))

(assert (=> d!54725 (= res!86503 (or (bvsge #b00000000000000000000000000000000 (size!3962 (_keys!5647 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3962 (_keys!5647 thiss!1248))))))))

(declare-fun lt!90450 () ListLongMap!2265)

(assert (=> d!54725 (= lt!90435 lt!90450)))

(declare-fun lt!90439 () Unit!5536)

(assert (=> d!54725 (= lt!90439 e!120339)))

(declare-fun c!32789 () Bool)

(assert (=> d!54725 (= c!32789 e!120338)))

(declare-fun res!86498 () Bool)

(assert (=> d!54725 (=> (not res!86498) (not e!120338))))

(assert (=> d!54725 (= res!86498 (bvslt #b00000000000000000000000000000000 (size!3962 (_keys!5647 thiss!1248))))))

(assert (=> d!54725 (= lt!90450 e!120340)))

(assert (=> d!54725 (= c!32791 (and (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54725 (validMask!0 (mask!8780 thiss!1248))))

(assert (=> d!54725 (= (getCurrentListMap!800 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)) lt!90435)))

(declare-fun b!182779 () Bool)

(assert (=> b!182779 (= e!120340 e!120336)))

(assert (=> b!182779 (= c!32787 (and (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!54725 c!32791) b!182771))

(assert (= (and d!54725 (not c!32791)) b!182779))

(assert (= (and b!182779 c!32787) b!182782))

(assert (= (and b!182779 (not c!32787)) b!182785))

(assert (= (and b!182785 c!32788) b!182778))

(assert (= (and b!182785 (not c!32788)) b!182774))

(assert (= (or b!182778 b!182774) bm!18442))

(assert (= (or b!182782 bm!18442) bm!18439))

(assert (= (or b!182782 b!182778) bm!18441))

(assert (= (or b!182771 bm!18439) bm!18436))

(assert (= (or b!182771 bm!18441) bm!18440))

(assert (= (and d!54725 res!86498) b!182788))

(assert (= (and d!54725 c!32789) b!182783))

(assert (= (and d!54725 (not c!32789)) b!182777))

(assert (= (and d!54725 res!86503) b!182772))

(assert (= (and b!182772 res!86504) b!182769))

(assert (= (and b!182772 (not res!86502)) b!182781))

(assert (= (and b!182781 res!86499) b!182775))

(assert (= (and b!182772 res!86500) b!182773))

(assert (= (and b!182773 c!32786) b!182789))

(assert (= (and b!182773 (not c!32786)) b!182780))

(assert (= (and b!182789 res!86505) b!182786))

(assert (= (or b!182789 b!182780) bm!18437))

(assert (= (and b!182773 res!86497) b!182787))

(assert (= (and b!182787 c!32790) b!182770))

(assert (= (and b!182787 (not c!32790)) b!182784))

(assert (= (and b!182770 res!86501) b!182776))

(assert (= (or b!182770 b!182784) bm!18438))

(declare-fun b_lambda!7201 () Bool)

(assert (=> (not b_lambda!7201) (not b!182775)))

(declare-fun t!7143 () Bool)

(declare-fun tb!2815 () Bool)

(assert (=> (and b!182611 (= (defaultEntry!3734 thiss!1248) (defaultEntry!3734 thiss!1248)) t!7143) tb!2815))

(declare-fun result!4739 () Bool)

(assert (=> tb!2815 (= result!4739 tp_is_empty!4273)))

(assert (=> b!182775 t!7143))

(declare-fun b_and!11085 () Bool)

(assert (= b_and!11079 (and (=> t!7143 result!4739) b_and!11085)))

(declare-fun m!210591 () Bool)

(assert (=> bm!18436 m!210591))

(assert (=> b!182781 m!210553))

(assert (=> b!182781 m!210553))

(declare-fun m!210593 () Bool)

(assert (=> b!182781 m!210593))

(declare-fun m!210595 () Bool)

(assert (=> b!182783 m!210595))

(declare-fun m!210597 () Bool)

(assert (=> b!182783 m!210597))

(declare-fun m!210599 () Bool)

(assert (=> b!182783 m!210599))

(declare-fun m!210601 () Bool)

(assert (=> b!182783 m!210601))

(declare-fun m!210603 () Bool)

(assert (=> b!182783 m!210603))

(declare-fun m!210605 () Bool)

(assert (=> b!182783 m!210605))

(assert (=> b!182783 m!210601))

(declare-fun m!210607 () Bool)

(assert (=> b!182783 m!210607))

(assert (=> b!182783 m!210595))

(declare-fun m!210609 () Bool)

(assert (=> b!182783 m!210609))

(declare-fun m!210611 () Bool)

(assert (=> b!182783 m!210611))

(declare-fun m!210613 () Bool)

(assert (=> b!182783 m!210613))

(declare-fun m!210615 () Bool)

(assert (=> b!182783 m!210615))

(assert (=> b!182783 m!210615))

(declare-fun m!210617 () Bool)

(assert (=> b!182783 m!210617))

(assert (=> b!182783 m!210605))

(declare-fun m!210619 () Bool)

(assert (=> b!182783 m!210619))

(assert (=> b!182783 m!210553))

(declare-fun m!210621 () Bool)

(assert (=> b!182783 m!210621))

(assert (=> b!182783 m!210591))

(declare-fun m!210623 () Bool)

(assert (=> b!182783 m!210623))

(assert (=> d!54725 m!210499))

(assert (=> b!182775 m!210553))

(declare-fun m!210625 () Bool)

(assert (=> b!182775 m!210625))

(declare-fun m!210627 () Bool)

(assert (=> b!182775 m!210627))

(declare-fun m!210629 () Bool)

(assert (=> b!182775 m!210629))

(assert (=> b!182775 m!210553))

(declare-fun m!210631 () Bool)

(assert (=> b!182775 m!210631))

(assert (=> b!182775 m!210625))

(assert (=> b!182775 m!210627))

(declare-fun m!210633 () Bool)

(assert (=> bm!18437 m!210633))

(declare-fun m!210635 () Bool)

(assert (=> bm!18438 m!210635))

(declare-fun m!210637 () Bool)

(assert (=> b!182786 m!210637))

(declare-fun m!210639 () Bool)

(assert (=> b!182771 m!210639))

(assert (=> b!182788 m!210553))

(assert (=> b!182788 m!210553))

(assert (=> b!182788 m!210561))

(declare-fun m!210641 () Bool)

(assert (=> bm!18440 m!210641))

(declare-fun m!210643 () Bool)

(assert (=> b!182776 m!210643))

(assert (=> b!182769 m!210553))

(assert (=> b!182769 m!210553))

(assert (=> b!182769 m!210561))

(assert (=> b!182604 d!54725))

(declare-fun d!54727 () Bool)

(declare-fun res!86513 () Bool)

(declare-fun e!120352 () Bool)

(assert (=> d!54727 (=> res!86513 e!120352)))

(assert (=> d!54727 (= res!86513 (bvsge #b00000000000000000000000000000000 (size!3962 (_keys!5647 thiss!1248))))))

(assert (=> d!54727 (= (arrayNoDuplicates!0 (_keys!5647 thiss!1248) #b00000000000000000000000000000000 Nil!2282) e!120352)))

(declare-fun b!182802 () Bool)

(declare-fun e!120350 () Bool)

(assert (=> b!182802 (= e!120352 e!120350)))

(declare-fun res!86512 () Bool)

(assert (=> b!182802 (=> (not res!86512) (not e!120350))))

(declare-fun e!120351 () Bool)

(assert (=> b!182802 (= res!86512 (not e!120351))))

(declare-fun res!86514 () Bool)

(assert (=> b!182802 (=> (not res!86514) (not e!120351))))

(assert (=> b!182802 (= res!86514 (validKeyInArray!0 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18445 () Bool)

(declare-fun call!18448 () Bool)

(declare-fun c!32794 () Bool)

(assert (=> bm!18445 (= call!18448 (arrayNoDuplicates!0 (_keys!5647 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32794 (Cons!2281 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000) Nil!2282) Nil!2282)))))

(declare-fun b!182803 () Bool)

(declare-fun contains!1246 (List!2285 (_ BitVec 64)) Bool)

(assert (=> b!182803 (= e!120351 (contains!1246 Nil!2282 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182804 () Bool)

(declare-fun e!120353 () Bool)

(assert (=> b!182804 (= e!120350 e!120353)))

(assert (=> b!182804 (= c!32794 (validKeyInArray!0 (select (arr!3650 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182805 () Bool)

(assert (=> b!182805 (= e!120353 call!18448)))

(declare-fun b!182806 () Bool)

(assert (=> b!182806 (= e!120353 call!18448)))

(assert (= (and d!54727 (not res!86513)) b!182802))

(assert (= (and b!182802 res!86514) b!182803))

(assert (= (and b!182802 res!86512) b!182804))

(assert (= (and b!182804 c!32794) b!182805))

(assert (= (and b!182804 (not c!32794)) b!182806))

(assert (= (or b!182805 b!182806) bm!18445))

(assert (=> b!182802 m!210553))

(assert (=> b!182802 m!210553))

(assert (=> b!182802 m!210561))

(assert (=> bm!18445 m!210553))

(declare-fun m!210645 () Bool)

(assert (=> bm!18445 m!210645))

(assert (=> b!182803 m!210553))

(assert (=> b!182803 m!210553))

(declare-fun m!210647 () Bool)

(assert (=> b!182803 m!210647))

(assert (=> b!182804 m!210553))

(assert (=> b!182804 m!210553))

(assert (=> b!182804 m!210561))

(assert (=> b!182602 d!54727))

(declare-fun d!54729 () Bool)

(assert (=> d!54729 (= (array_inv!2355 (_keys!5647 thiss!1248)) (bvsge (size!3962 (_keys!5647 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182611 d!54729))

(declare-fun d!54731 () Bool)

(assert (=> d!54731 (= (array_inv!2356 (_values!3717 thiss!1248)) (bvsge (size!3963 (_values!3717 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182611 d!54731))

(declare-fun d!54733 () Bool)

(assert (=> d!54733 (= (validMask!0 (mask!8780 thiss!1248)) (and (or (= (mask!8780 thiss!1248) #b00000000000000000000000000000111) (= (mask!8780 thiss!1248) #b00000000000000000000000000001111) (= (mask!8780 thiss!1248) #b00000000000000000000000000011111) (= (mask!8780 thiss!1248) #b00000000000000000000000000111111) (= (mask!8780 thiss!1248) #b00000000000000000000000001111111) (= (mask!8780 thiss!1248) #b00000000000000000000000011111111) (= (mask!8780 thiss!1248) #b00000000000000000000000111111111) (= (mask!8780 thiss!1248) #b00000000000000000000001111111111) (= (mask!8780 thiss!1248) #b00000000000000000000011111111111) (= (mask!8780 thiss!1248) #b00000000000000000000111111111111) (= (mask!8780 thiss!1248) #b00000000000000000001111111111111) (= (mask!8780 thiss!1248) #b00000000000000000011111111111111) (= (mask!8780 thiss!1248) #b00000000000000000111111111111111) (= (mask!8780 thiss!1248) #b00000000000000001111111111111111) (= (mask!8780 thiss!1248) #b00000000000000011111111111111111) (= (mask!8780 thiss!1248) #b00000000000000111111111111111111) (= (mask!8780 thiss!1248) #b00000000000001111111111111111111) (= (mask!8780 thiss!1248) #b00000000000011111111111111111111) (= (mask!8780 thiss!1248) #b00000000000111111111111111111111) (= (mask!8780 thiss!1248) #b00000000001111111111111111111111) (= (mask!8780 thiss!1248) #b00000000011111111111111111111111) (= (mask!8780 thiss!1248) #b00000000111111111111111111111111) (= (mask!8780 thiss!1248) #b00000001111111111111111111111111) (= (mask!8780 thiss!1248) #b00000011111111111111111111111111) (= (mask!8780 thiss!1248) #b00000111111111111111111111111111) (= (mask!8780 thiss!1248) #b00001111111111111111111111111111) (= (mask!8780 thiss!1248) #b00011111111111111111111111111111) (= (mask!8780 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8780 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!182603 d!54733))

(declare-fun mapIsEmpty!7343 () Bool)

(declare-fun mapRes!7343 () Bool)

(assert (=> mapIsEmpty!7343 mapRes!7343))

(declare-fun b!182814 () Bool)

(declare-fun e!120359 () Bool)

(assert (=> b!182814 (= e!120359 tp_is_empty!4273)))

(declare-fun b!182813 () Bool)

(declare-fun e!120358 () Bool)

(assert (=> b!182813 (= e!120358 tp_is_empty!4273)))

(declare-fun condMapEmpty!7343 () Bool)

(declare-fun mapDefault!7343 () ValueCell!1793)

(assert (=> mapNonEmpty!7334 (= condMapEmpty!7343 (= mapRest!7334 ((as const (Array (_ BitVec 32) ValueCell!1793)) mapDefault!7343)))))

(assert (=> mapNonEmpty!7334 (= tp!16265 (and e!120359 mapRes!7343))))

(declare-fun mapNonEmpty!7343 () Bool)

(declare-fun tp!16280 () Bool)

(assert (=> mapNonEmpty!7343 (= mapRes!7343 (and tp!16280 e!120358))))

(declare-fun mapKey!7343 () (_ BitVec 32))

(declare-fun mapRest!7343 () (Array (_ BitVec 32) ValueCell!1793))

(declare-fun mapValue!7343 () ValueCell!1793)

(assert (=> mapNonEmpty!7343 (= mapRest!7334 (store mapRest!7343 mapKey!7343 mapValue!7343))))

(assert (= (and mapNonEmpty!7334 condMapEmpty!7343) mapIsEmpty!7343))

(assert (= (and mapNonEmpty!7334 (not condMapEmpty!7343)) mapNonEmpty!7343))

(assert (= (and mapNonEmpty!7343 ((_ is ValueCellFull!1793) mapValue!7343)) b!182813))

(assert (= (and mapNonEmpty!7334 ((_ is ValueCellFull!1793) mapDefault!7343)) b!182814))

(declare-fun m!210649 () Bool)

(assert (=> mapNonEmpty!7343 m!210649))

(declare-fun b_lambda!7203 () Bool)

(assert (= b_lambda!7201 (or (and b!182611 b_free!4501) b_lambda!7203)))

(check-sat (not b!182687) (not d!54723) (not bm!18445) (not b!182769) (not b!182717) (not bm!18421) (not b!182771) (not b!182786) (not d!54721) (not b_lambda!7203) (not b!182804) (not b!182689) b_and!11085 (not b_next!4501) (not bm!18437) (not d!54725) (not b!182783) (not b!182803) (not bm!18440) (not b!182724) (not b!182788) (not b!182776) (not bm!18436) (not b!182775) (not mapNonEmpty!7343) tp_is_empty!4273 (not bm!18438) (not b!182726) (not b!182802) (not b!182697) (not d!54719) (not b!182699) (not b!182698) (not b!182781))
(check-sat b_and!11085 (not b_next!4501))
