; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23662 () Bool)

(assert start!23662)

(declare-fun b!248725 () Bool)

(declare-fun b_free!6609 () Bool)

(declare-fun b_next!6609 () Bool)

(assert (=> b!248725 (= b_free!6609 (not b_next!6609))))

(declare-fun tp!23080 () Bool)

(declare-fun b_and!13615 () Bool)

(assert (=> b!248725 (= tp!23080 b_and!13615)))

(declare-fun b!248712 () Bool)

(declare-fun e!161327 () Bool)

(declare-fun call!23323 () Bool)

(assert (=> b!248712 (= e!161327 (not call!23323))))

(declare-fun b!248713 () Bool)

(declare-fun e!161321 () Bool)

(assert (=> b!248713 (= e!161321 e!161327)))

(declare-fun res!121885 () Bool)

(declare-fun call!23324 () Bool)

(assert (=> b!248713 (= res!121885 call!23324)))

(assert (=> b!248713 (=> (not res!121885) (not e!161327))))

(declare-fun b!248714 () Bool)

(declare-fun e!161326 () Bool)

(declare-fun e!161330 () Bool)

(assert (=> b!248714 (= e!161326 e!161330)))

(declare-fun res!121879 () Bool)

(assert (=> b!248714 (=> (not res!121879) (not e!161330))))

(declare-datatypes ((SeekEntryResult!1113 0))(
  ( (MissingZero!1113 (index!6622 (_ BitVec 32))) (Found!1113 (index!6623 (_ BitVec 32))) (Intermediate!1113 (undefined!1925 Bool) (index!6624 (_ BitVec 32)) (x!24593 (_ BitVec 32))) (Undefined!1113) (MissingVacant!1113 (index!6625 (_ BitVec 32))) )
))
(declare-fun lt!124545 () SeekEntryResult!1113)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!248714 (= res!121879 (or (= lt!124545 (MissingZero!1113 index!297)) (= lt!124545 (MissingVacant!1113 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8275 0))(
  ( (V!8276 (val!3280 Int)) )
))
(declare-datatypes ((ValueCell!2892 0))(
  ( (ValueCellFull!2892 (v!5340 V!8275)) (EmptyCell!2892) )
))
(declare-datatypes ((array!12253 0))(
  ( (array!12254 (arr!5812 (Array (_ BitVec 32) ValueCell!2892)) (size!6155 (_ BitVec 32))) )
))
(declare-datatypes ((array!12255 0))(
  ( (array!12256 (arr!5813 (Array (_ BitVec 32) (_ BitVec 64))) (size!6156 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3684 0))(
  ( (LongMapFixedSize!3685 (defaultEntry!4599 Int) (mask!10753 (_ BitVec 32)) (extraKeys!4336 (_ BitVec 32)) (zeroValue!4440 V!8275) (minValue!4440 V!8275) (_size!1891 (_ BitVec 32)) (_keys!6725 array!12255) (_values!4582 array!12253) (_vacant!1891 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3684)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12255 (_ BitVec 32)) SeekEntryResult!1113)

(assert (=> b!248714 (= lt!124545 (seekEntryOrOpen!0 key!932 (_keys!6725 thiss!1504) (mask!10753 thiss!1504)))))

(declare-fun b!248715 () Bool)

(declare-fun res!121882 () Bool)

(declare-fun e!161329 () Bool)

(assert (=> b!248715 (=> (not res!121882) (not e!161329))))

(assert (=> b!248715 (= res!121882 (= (select (arr!5813 (_keys!6725 thiss!1504)) (index!6622 lt!124545)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248716 () Bool)

(declare-fun res!121878 () Bool)

(assert (=> b!248716 (= res!121878 (= (select (arr!5813 (_keys!6725 thiss!1504)) (index!6625 lt!124545)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248716 (=> (not res!121878) (not e!161327))))

(declare-fun b!248718 () Bool)

(assert (=> b!248718 (= e!161329 (not call!23323))))

(declare-fun b!248719 () Bool)

(declare-fun c!41682 () Bool)

(get-info :version)

(assert (=> b!248719 (= c!41682 ((_ is MissingVacant!1113) lt!124545))))

(declare-fun e!161323 () Bool)

(assert (=> b!248719 (= e!161323 e!161321)))

(declare-fun b!248720 () Bool)

(declare-fun res!121884 () Bool)

(assert (=> b!248720 (=> (not res!121884) (not e!161329))))

(assert (=> b!248720 (= res!121884 call!23324)))

(assert (=> b!248720 (= e!161323 e!161329)))

(declare-fun b!248721 () Bool)

(declare-datatypes ((Unit!7703 0))(
  ( (Unit!7704) )
))
(declare-fun e!161318 () Unit!7703)

(declare-fun Unit!7705 () Unit!7703)

(assert (=> b!248721 (= e!161318 Unit!7705)))

(declare-fun lt!124550 () Unit!7703)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!391 (array!12255 array!12253 (_ BitVec 32) (_ BitVec 32) V!8275 V!8275 (_ BitVec 64) Int) Unit!7703)

(assert (=> b!248721 (= lt!124550 (lemmaInListMapThenSeekEntryOrOpenFindsIt!391 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) key!932 (defaultEntry!4599 thiss!1504)))))

(assert (=> b!248721 false))

(declare-fun b!248722 () Bool)

(assert (=> b!248722 (= e!161321 ((_ is Undefined!1113) lt!124545))))

(declare-fun b!248723 () Bool)

(declare-fun e!161317 () Bool)

(declare-fun e!161324 () Bool)

(declare-fun mapRes!10988 () Bool)

(assert (=> b!248723 (= e!161317 (and e!161324 mapRes!10988))))

(declare-fun condMapEmpty!10988 () Bool)

(declare-fun mapDefault!10988 () ValueCell!2892)

(assert (=> b!248723 (= condMapEmpty!10988 (= (arr!5812 (_values!4582 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2892)) mapDefault!10988)))))

(declare-fun b!248724 () Bool)

(declare-fun tp_is_empty!6471 () Bool)

(assert (=> b!248724 (= e!161324 tp_is_empty!6471)))

(declare-fun e!161328 () Bool)

(declare-fun array_inv!3837 (array!12255) Bool)

(declare-fun array_inv!3838 (array!12253) Bool)

(assert (=> b!248725 (= e!161328 (and tp!23080 tp_is_empty!6471 (array_inv!3837 (_keys!6725 thiss!1504)) (array_inv!3838 (_values!4582 thiss!1504)) e!161317))))

(declare-fun bm!23320 () Bool)

(declare-fun c!41680 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23320 (= call!23324 (inRange!0 (ite c!41680 (index!6622 lt!124545) (index!6625 lt!124545)) (mask!10753 thiss!1504)))))

(declare-fun mapIsEmpty!10988 () Bool)

(assert (=> mapIsEmpty!10988 mapRes!10988))

(declare-fun b!248726 () Bool)

(declare-fun lt!124551 () Unit!7703)

(assert (=> b!248726 (= e!161318 lt!124551)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!394 (array!12255 array!12253 (_ BitVec 32) (_ BitVec 32) V!8275 V!8275 (_ BitVec 64) Int) Unit!7703)

(assert (=> b!248726 (= lt!124551 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!394 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) key!932 (defaultEntry!4599 thiss!1504)))))

(assert (=> b!248726 (= c!41680 ((_ is MissingZero!1113) lt!124545))))

(assert (=> b!248726 e!161323))

(declare-fun bm!23321 () Bool)

(declare-fun arrayContainsKey!0 (array!12255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23321 (= call!23323 (arrayContainsKey!0 (_keys!6725 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!121881 () Bool)

(assert (=> start!23662 (=> (not res!121881) (not e!161326))))

(declare-fun valid!1442 (LongMapFixedSize!3684) Bool)

(assert (=> start!23662 (= res!121881 (valid!1442 thiss!1504))))

(assert (=> start!23662 e!161326))

(assert (=> start!23662 e!161328))

(assert (=> start!23662 true))

(declare-fun b!248717 () Bool)

(declare-fun e!161320 () Bool)

(assert (=> b!248717 (= e!161330 e!161320)))

(declare-fun res!121880 () Bool)

(assert (=> b!248717 (=> (not res!121880) (not e!161320))))

(assert (=> b!248717 (= res!121880 (inRange!0 index!297 (mask!10753 thiss!1504)))))

(declare-fun lt!124552 () Unit!7703)

(assert (=> b!248717 (= lt!124552 e!161318)))

(declare-fun c!41681 () Bool)

(declare-datatypes ((tuple2!4828 0))(
  ( (tuple2!4829 (_1!2425 (_ BitVec 64)) (_2!2425 V!8275)) )
))
(declare-datatypes ((List!3709 0))(
  ( (Nil!3706) (Cons!3705 (h!4363 tuple2!4828) (t!8736 List!3709)) )
))
(declare-datatypes ((ListLongMap!3741 0))(
  ( (ListLongMap!3742 (toList!1886 List!3709)) )
))
(declare-fun contains!1802 (ListLongMap!3741 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1414 (array!12255 array!12253 (_ BitVec 32) (_ BitVec 32) V!8275 V!8275 (_ BitVec 32) Int) ListLongMap!3741)

(assert (=> b!248717 (= c!41681 (contains!1802 (getCurrentListMap!1414 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10988 () Bool)

(declare-fun tp!23081 () Bool)

(declare-fun e!161319 () Bool)

(assert (=> mapNonEmpty!10988 (= mapRes!10988 (and tp!23081 e!161319))))

(declare-fun mapValue!10988 () ValueCell!2892)

(declare-fun mapKey!10988 () (_ BitVec 32))

(declare-fun mapRest!10988 () (Array (_ BitVec 32) ValueCell!2892))

(assert (=> mapNonEmpty!10988 (= (arr!5812 (_values!4582 thiss!1504)) (store mapRest!10988 mapKey!10988 mapValue!10988))))

(declare-fun b!248727 () Bool)

(declare-fun e!161322 () Unit!7703)

(declare-fun Unit!7706 () Unit!7703)

(assert (=> b!248727 (= e!161322 Unit!7706)))

(declare-fun b!248728 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!248728 (= e!161320 (not (validMask!0 (mask!10753 thiss!1504))))))

(declare-fun lt!124548 () array!12255)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12255 (_ BitVec 32)) Bool)

(assert (=> b!248728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124548 (mask!10753 thiss!1504))))

(declare-fun lt!124544 () Unit!7703)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12255 (_ BitVec 32) (_ BitVec 32)) Unit!7703)

(assert (=> b!248728 (= lt!124544 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6725 thiss!1504) index!297 (mask!10753 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12255 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!248728 (= (arrayCountValidKeys!0 lt!124548 #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6725 thiss!1504) #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504)))))))

(declare-fun lt!124547 () Unit!7703)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12255 (_ BitVec 32) (_ BitVec 64)) Unit!7703)

(assert (=> b!248728 (= lt!124547 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6725 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3710 0))(
  ( (Nil!3707) (Cons!3706 (h!4364 (_ BitVec 64)) (t!8737 List!3710)) )
))
(declare-fun arrayNoDuplicates!0 (array!12255 (_ BitVec 32) List!3710) Bool)

(assert (=> b!248728 (arrayNoDuplicates!0 lt!124548 #b00000000000000000000000000000000 Nil!3707)))

(assert (=> b!248728 (= lt!124548 (array!12256 (store (arr!5813 (_keys!6725 thiss!1504)) index!297 key!932) (size!6156 (_keys!6725 thiss!1504))))))

(declare-fun lt!124553 () Unit!7703)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12255 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3710) Unit!7703)

(assert (=> b!248728 (= lt!124553 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6725 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3707))))

(declare-fun lt!124546 () Unit!7703)

(assert (=> b!248728 (= lt!124546 e!161322)))

(declare-fun c!41683 () Bool)

(assert (=> b!248728 (= c!41683 (arrayContainsKey!0 (_keys!6725 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248729 () Bool)

(declare-fun Unit!7707 () Unit!7703)

(assert (=> b!248729 (= e!161322 Unit!7707)))

(declare-fun lt!124549 () Unit!7703)

(declare-fun lemmaArrayContainsKeyThenInListMap!195 (array!12255 array!12253 (_ BitVec 32) (_ BitVec 32) V!8275 V!8275 (_ BitVec 64) (_ BitVec 32) Int) Unit!7703)

(assert (=> b!248729 (= lt!124549 (lemmaArrayContainsKeyThenInListMap!195 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)))))

(assert (=> b!248729 false))

(declare-fun b!248730 () Bool)

(declare-fun res!121883 () Bool)

(assert (=> b!248730 (=> (not res!121883) (not e!161326))))

(assert (=> b!248730 (= res!121883 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!248731 () Bool)

(assert (=> b!248731 (= e!161319 tp_is_empty!6471)))

(assert (= (and start!23662 res!121881) b!248730))

(assert (= (and b!248730 res!121883) b!248714))

(assert (= (and b!248714 res!121879) b!248717))

(assert (= (and b!248717 c!41681) b!248721))

(assert (= (and b!248717 (not c!41681)) b!248726))

(assert (= (and b!248726 c!41680) b!248720))

(assert (= (and b!248726 (not c!41680)) b!248719))

(assert (= (and b!248720 res!121884) b!248715))

(assert (= (and b!248715 res!121882) b!248718))

(assert (= (and b!248719 c!41682) b!248713))

(assert (= (and b!248719 (not c!41682)) b!248722))

(assert (= (and b!248713 res!121885) b!248716))

(assert (= (and b!248716 res!121878) b!248712))

(assert (= (or b!248720 b!248713) bm!23320))

(assert (= (or b!248718 b!248712) bm!23321))

(assert (= (and b!248717 res!121880) b!248728))

(assert (= (and b!248728 c!41683) b!248729))

(assert (= (and b!248728 (not c!41683)) b!248727))

(assert (= (and b!248723 condMapEmpty!10988) mapIsEmpty!10988))

(assert (= (and b!248723 (not condMapEmpty!10988)) mapNonEmpty!10988))

(assert (= (and mapNonEmpty!10988 ((_ is ValueCellFull!2892) mapValue!10988)) b!248731))

(assert (= (and b!248723 ((_ is ValueCellFull!2892) mapDefault!10988)) b!248724))

(assert (= b!248725 b!248723))

(assert (= start!23662 b!248725))

(declare-fun m!265373 () Bool)

(assert (=> b!248717 m!265373))

(declare-fun m!265375 () Bool)

(assert (=> b!248717 m!265375))

(assert (=> b!248717 m!265375))

(declare-fun m!265377 () Bool)

(assert (=> b!248717 m!265377))

(declare-fun m!265379 () Bool)

(assert (=> b!248721 m!265379))

(declare-fun m!265381 () Bool)

(assert (=> b!248729 m!265381))

(declare-fun m!265383 () Bool)

(assert (=> mapNonEmpty!10988 m!265383))

(declare-fun m!265385 () Bool)

(assert (=> b!248715 m!265385))

(declare-fun m!265387 () Bool)

(assert (=> b!248726 m!265387))

(declare-fun m!265389 () Bool)

(assert (=> b!248725 m!265389))

(declare-fun m!265391 () Bool)

(assert (=> b!248725 m!265391))

(declare-fun m!265393 () Bool)

(assert (=> bm!23320 m!265393))

(declare-fun m!265395 () Bool)

(assert (=> bm!23321 m!265395))

(declare-fun m!265397 () Bool)

(assert (=> b!248714 m!265397))

(declare-fun m!265399 () Bool)

(assert (=> b!248728 m!265399))

(assert (=> b!248728 m!265395))

(declare-fun m!265401 () Bool)

(assert (=> b!248728 m!265401))

(declare-fun m!265403 () Bool)

(assert (=> b!248728 m!265403))

(declare-fun m!265405 () Bool)

(assert (=> b!248728 m!265405))

(declare-fun m!265407 () Bool)

(assert (=> b!248728 m!265407))

(declare-fun m!265409 () Bool)

(assert (=> b!248728 m!265409))

(declare-fun m!265411 () Bool)

(assert (=> b!248728 m!265411))

(declare-fun m!265413 () Bool)

(assert (=> b!248728 m!265413))

(declare-fun m!265415 () Bool)

(assert (=> b!248728 m!265415))

(declare-fun m!265417 () Bool)

(assert (=> b!248716 m!265417))

(declare-fun m!265419 () Bool)

(assert (=> start!23662 m!265419))

(check-sat (not b!248721) (not b!248717) (not b!248725) (not bm!23320) (not b!248728) tp_is_empty!6471 (not mapNonEmpty!10988) (not b_next!6609) (not b!248714) (not start!23662) (not b!248726) b_and!13615 (not b!248729) (not bm!23321))
(check-sat b_and!13615 (not b_next!6609))
(get-model)

(declare-fun b!248808 () Bool)

(declare-fun e!161382 () Bool)

(declare-fun e!161381 () Bool)

(assert (=> b!248808 (= e!161382 e!161381)))

(declare-fun res!121920 () Bool)

(declare-fun call!23336 () Bool)

(assert (=> b!248808 (= res!121920 call!23336)))

(assert (=> b!248808 (=> (not res!121920) (not e!161381))))

(declare-fun c!41700 () Bool)

(declare-fun lt!124588 () SeekEntryResult!1113)

(declare-fun bm!23332 () Bool)

(assert (=> bm!23332 (= call!23336 (inRange!0 (ite c!41700 (index!6622 lt!124588) (index!6625 lt!124588)) (mask!10753 thiss!1504)))))

(declare-fun d!60569 () Bool)

(assert (=> d!60569 e!161382))

(assert (=> d!60569 (= c!41700 ((_ is MissingZero!1113) lt!124588))))

(assert (=> d!60569 (= lt!124588 (seekEntryOrOpen!0 key!932 (_keys!6725 thiss!1504) (mask!10753 thiss!1504)))))

(declare-fun lt!124589 () Unit!7703)

(declare-fun choose!1170 (array!12255 array!12253 (_ BitVec 32) (_ BitVec 32) V!8275 V!8275 (_ BitVec 64) Int) Unit!7703)

(assert (=> d!60569 (= lt!124589 (choose!1170 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) key!932 (defaultEntry!4599 thiss!1504)))))

(assert (=> d!60569 (validMask!0 (mask!10753 thiss!1504))))

(assert (=> d!60569 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!394 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) key!932 (defaultEntry!4599 thiss!1504)) lt!124589)))

(declare-fun b!248809 () Bool)

(declare-fun e!161384 () Bool)

(declare-fun call!23335 () Bool)

(assert (=> b!248809 (= e!161384 (not call!23335))))

(declare-fun b!248810 () Bool)

(declare-fun e!161383 () Bool)

(assert (=> b!248810 (= e!161382 e!161383)))

(declare-fun c!41701 () Bool)

(assert (=> b!248810 (= c!41701 ((_ is MissingVacant!1113) lt!124588))))

(declare-fun b!248811 () Bool)

(assert (=> b!248811 (= e!161381 (not call!23335))))

(declare-fun b!248812 () Bool)

(assert (=> b!248812 (and (bvsge (index!6622 lt!124588) #b00000000000000000000000000000000) (bvslt (index!6622 lt!124588) (size!6156 (_keys!6725 thiss!1504))))))

(declare-fun res!121918 () Bool)

(assert (=> b!248812 (= res!121918 (= (select (arr!5813 (_keys!6725 thiss!1504)) (index!6622 lt!124588)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248812 (=> (not res!121918) (not e!161381))))

(declare-fun bm!23333 () Bool)

(assert (=> bm!23333 (= call!23335 (arrayContainsKey!0 (_keys!6725 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248813 () Bool)

(declare-fun res!121921 () Bool)

(assert (=> b!248813 (=> (not res!121921) (not e!161384))))

(assert (=> b!248813 (= res!121921 (= (select (arr!5813 (_keys!6725 thiss!1504)) (index!6625 lt!124588)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248813 (and (bvsge (index!6625 lt!124588) #b00000000000000000000000000000000) (bvslt (index!6625 lt!124588) (size!6156 (_keys!6725 thiss!1504))))))

(declare-fun b!248814 () Bool)

(assert (=> b!248814 (= e!161383 ((_ is Undefined!1113) lt!124588))))

(declare-fun b!248815 () Bool)

(declare-fun res!121919 () Bool)

(assert (=> b!248815 (=> (not res!121919) (not e!161384))))

(assert (=> b!248815 (= res!121919 call!23336)))

(assert (=> b!248815 (= e!161383 e!161384)))

(assert (= (and d!60569 c!41700) b!248808))

(assert (= (and d!60569 (not c!41700)) b!248810))

(assert (= (and b!248808 res!121920) b!248812))

(assert (= (and b!248812 res!121918) b!248811))

(assert (= (and b!248810 c!41701) b!248815))

(assert (= (and b!248810 (not c!41701)) b!248814))

(assert (= (and b!248815 res!121919) b!248813))

(assert (= (and b!248813 res!121921) b!248809))

(assert (= (or b!248808 b!248815) bm!23332))

(assert (= (or b!248811 b!248809) bm!23333))

(declare-fun m!265469 () Bool)

(assert (=> b!248813 m!265469))

(assert (=> bm!23333 m!265395))

(assert (=> d!60569 m!265397))

(declare-fun m!265471 () Bool)

(assert (=> d!60569 m!265471))

(assert (=> d!60569 m!265399))

(declare-fun m!265473 () Bool)

(assert (=> bm!23332 m!265473))

(declare-fun m!265475 () Bool)

(assert (=> b!248812 m!265475))

(assert (=> b!248726 d!60569))

(declare-fun d!60571 () Bool)

(assert (=> d!60571 (contains!1802 (getCurrentListMap!1414 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)) key!932)))

(declare-fun lt!124592 () Unit!7703)

(declare-fun choose!1171 (array!12255 array!12253 (_ BitVec 32) (_ BitVec 32) V!8275 V!8275 (_ BitVec 64) (_ BitVec 32) Int) Unit!7703)

(assert (=> d!60571 (= lt!124592 (choose!1171 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)))))

(assert (=> d!60571 (validMask!0 (mask!10753 thiss!1504))))

(assert (=> d!60571 (= (lemmaArrayContainsKeyThenInListMap!195 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)) lt!124592)))

(declare-fun bs!8939 () Bool)

(assert (= bs!8939 d!60571))

(assert (=> bs!8939 m!265375))

(assert (=> bs!8939 m!265375))

(assert (=> bs!8939 m!265377))

(declare-fun m!265477 () Bool)

(assert (=> bs!8939 m!265477))

(assert (=> bs!8939 m!265399))

(assert (=> b!248729 d!60571))

(declare-fun d!60573 () Bool)

(assert (=> d!60573 (= (inRange!0 index!297 (mask!10753 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10753 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!248717 d!60573))

(declare-fun d!60575 () Bool)

(declare-fun e!161389 () Bool)

(assert (=> d!60575 e!161389))

(declare-fun res!121924 () Bool)

(assert (=> d!60575 (=> res!121924 e!161389)))

(declare-fun lt!124601 () Bool)

(assert (=> d!60575 (= res!121924 (not lt!124601))))

(declare-fun lt!124602 () Bool)

(assert (=> d!60575 (= lt!124601 lt!124602)))

(declare-fun lt!124604 () Unit!7703)

(declare-fun e!161390 () Unit!7703)

(assert (=> d!60575 (= lt!124604 e!161390)))

(declare-fun c!41704 () Bool)

(assert (=> d!60575 (= c!41704 lt!124602)))

(declare-fun containsKey!287 (List!3709 (_ BitVec 64)) Bool)

(assert (=> d!60575 (= lt!124602 (containsKey!287 (toList!1886 (getCurrentListMap!1414 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504))) key!932))))

(assert (=> d!60575 (= (contains!1802 (getCurrentListMap!1414 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)) key!932) lt!124601)))

(declare-fun b!248822 () Bool)

(declare-fun lt!124603 () Unit!7703)

(assert (=> b!248822 (= e!161390 lt!124603)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!235 (List!3709 (_ BitVec 64)) Unit!7703)

(assert (=> b!248822 (= lt!124603 (lemmaContainsKeyImpliesGetValueByKeyDefined!235 (toList!1886 (getCurrentListMap!1414 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504))) key!932))))

(declare-datatypes ((Option!301 0))(
  ( (Some!300 (v!5342 V!8275)) (None!299) )
))
(declare-fun isDefined!236 (Option!301) Bool)

(declare-fun getValueByKey!295 (List!3709 (_ BitVec 64)) Option!301)

(assert (=> b!248822 (isDefined!236 (getValueByKey!295 (toList!1886 (getCurrentListMap!1414 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504))) key!932))))

(declare-fun b!248823 () Bool)

(declare-fun Unit!7708 () Unit!7703)

(assert (=> b!248823 (= e!161390 Unit!7708)))

(declare-fun b!248824 () Bool)

(assert (=> b!248824 (= e!161389 (isDefined!236 (getValueByKey!295 (toList!1886 (getCurrentListMap!1414 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504))) key!932)))))

(assert (= (and d!60575 c!41704) b!248822))

(assert (= (and d!60575 (not c!41704)) b!248823))

(assert (= (and d!60575 (not res!121924)) b!248824))

(declare-fun m!265479 () Bool)

(assert (=> d!60575 m!265479))

(declare-fun m!265481 () Bool)

(assert (=> b!248822 m!265481))

(declare-fun m!265483 () Bool)

(assert (=> b!248822 m!265483))

(assert (=> b!248822 m!265483))

(declare-fun m!265485 () Bool)

(assert (=> b!248822 m!265485))

(assert (=> b!248824 m!265483))

(assert (=> b!248824 m!265483))

(assert (=> b!248824 m!265485))

(assert (=> b!248717 d!60575))

(declare-fun b!248867 () Bool)

(declare-fun e!161417 () Bool)

(declare-fun call!23351 () Bool)

(assert (=> b!248867 (= e!161417 (not call!23351))))

(declare-fun b!248868 () Bool)

(declare-fun e!161418 () ListLongMap!3741)

(declare-fun e!161423 () ListLongMap!3741)

(assert (=> b!248868 (= e!161418 e!161423)))

(declare-fun c!41719 () Bool)

(assert (=> b!248868 (= c!41719 (and (not (= (bvand (extraKeys!4336 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4336 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!248869 () Bool)

(declare-fun c!41717 () Bool)

(assert (=> b!248869 (= c!41717 (and (not (= (bvand (extraKeys!4336 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4336 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!161429 () ListLongMap!3741)

(assert (=> b!248869 (= e!161423 e!161429)))

(declare-fun b!248870 () Bool)

(declare-fun e!161425 () Bool)

(assert (=> b!248870 (= e!161425 e!161417)))

(declare-fun c!41722 () Bool)

(assert (=> b!248870 (= c!41722 (not (= (bvand (extraKeys!4336 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!248871 () Bool)

(declare-fun res!121944 () Bool)

(assert (=> b!248871 (=> (not res!121944) (not e!161425))))

(declare-fun e!161424 () Bool)

(assert (=> b!248871 (= res!121944 e!161424)))

(declare-fun c!41721 () Bool)

(assert (=> b!248871 (= c!41721 (not (= (bvand (extraKeys!4336 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!248872 () Bool)

(declare-fun e!161419 () Unit!7703)

(declare-fun Unit!7709 () Unit!7703)

(assert (=> b!248872 (= e!161419 Unit!7709)))

(declare-fun b!248873 () Bool)

(declare-fun res!121947 () Bool)

(assert (=> b!248873 (=> (not res!121947) (not e!161425))))

(declare-fun e!161428 () Bool)

(assert (=> b!248873 (= res!121947 e!161428)))

(declare-fun res!121946 () Bool)

(assert (=> b!248873 (=> res!121946 e!161428)))

(declare-fun e!161420 () Bool)

(assert (=> b!248873 (= res!121946 (not e!161420))))

(declare-fun res!121943 () Bool)

(assert (=> b!248873 (=> (not res!121943) (not e!161420))))

(assert (=> b!248873 (= res!121943 (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))))))

(declare-fun b!248874 () Bool)

(declare-fun e!161427 () Bool)

(declare-fun lt!124670 () ListLongMap!3741)

(declare-fun apply!237 (ListLongMap!3741 (_ BitVec 64)) V!8275)

(declare-fun get!2982 (ValueCell!2892 V!8275) V!8275)

(declare-fun dynLambda!580 (Int (_ BitVec 64)) V!8275)

(assert (=> b!248874 (= e!161427 (= (apply!237 lt!124670 (select (arr!5813 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000)) (get!2982 (select (arr!5812 (_values!4582 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!580 (defaultEntry!4599 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!248874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6155 (_values!4582 thiss!1504))))))

(assert (=> b!248874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))))))

(declare-fun b!248875 () Bool)

(declare-fun e!161426 () Bool)

(assert (=> b!248875 (= e!161426 (= (apply!237 lt!124670 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4440 thiss!1504)))))

(declare-fun b!248876 () Bool)

(declare-fun call!23353 () Bool)

(assert (=> b!248876 (= e!161424 (not call!23353))))

(declare-fun b!248877 () Bool)

(declare-fun e!161422 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!248877 (= e!161422 (validKeyInArray!0 (select (arr!5813 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248878 () Bool)

(declare-fun lt!124652 () Unit!7703)

(assert (=> b!248878 (= e!161419 lt!124652)))

(declare-fun lt!124650 () ListLongMap!3741)

(declare-fun getCurrentListMapNoExtraKeys!559 (array!12255 array!12253 (_ BitVec 32) (_ BitVec 32) V!8275 V!8275 (_ BitVec 32) Int) ListLongMap!3741)

(assert (=> b!248878 (= lt!124650 (getCurrentListMapNoExtraKeys!559 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)))))

(declare-fun lt!124659 () (_ BitVec 64))

(assert (=> b!248878 (= lt!124659 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124656 () (_ BitVec 64))

(assert (=> b!248878 (= lt!124656 (select (arr!5813 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124666 () Unit!7703)

(declare-fun addStillContains!213 (ListLongMap!3741 (_ BitVec 64) V!8275 (_ BitVec 64)) Unit!7703)

(assert (=> b!248878 (= lt!124666 (addStillContains!213 lt!124650 lt!124659 (zeroValue!4440 thiss!1504) lt!124656))))

(declare-fun +!664 (ListLongMap!3741 tuple2!4828) ListLongMap!3741)

(assert (=> b!248878 (contains!1802 (+!664 lt!124650 (tuple2!4829 lt!124659 (zeroValue!4440 thiss!1504))) lt!124656)))

(declare-fun lt!124665 () Unit!7703)

(assert (=> b!248878 (= lt!124665 lt!124666)))

(declare-fun lt!124655 () ListLongMap!3741)

(assert (=> b!248878 (= lt!124655 (getCurrentListMapNoExtraKeys!559 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)))))

(declare-fun lt!124669 () (_ BitVec 64))

(assert (=> b!248878 (= lt!124669 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124667 () (_ BitVec 64))

(assert (=> b!248878 (= lt!124667 (select (arr!5813 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124651 () Unit!7703)

(declare-fun addApplyDifferent!213 (ListLongMap!3741 (_ BitVec 64) V!8275 (_ BitVec 64)) Unit!7703)

(assert (=> b!248878 (= lt!124651 (addApplyDifferent!213 lt!124655 lt!124669 (minValue!4440 thiss!1504) lt!124667))))

(assert (=> b!248878 (= (apply!237 (+!664 lt!124655 (tuple2!4829 lt!124669 (minValue!4440 thiss!1504))) lt!124667) (apply!237 lt!124655 lt!124667))))

(declare-fun lt!124668 () Unit!7703)

(assert (=> b!248878 (= lt!124668 lt!124651)))

(declare-fun lt!124649 () ListLongMap!3741)

(assert (=> b!248878 (= lt!124649 (getCurrentListMapNoExtraKeys!559 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)))))

(declare-fun lt!124657 () (_ BitVec 64))

(assert (=> b!248878 (= lt!124657 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124662 () (_ BitVec 64))

(assert (=> b!248878 (= lt!124662 (select (arr!5813 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124660 () Unit!7703)

(assert (=> b!248878 (= lt!124660 (addApplyDifferent!213 lt!124649 lt!124657 (zeroValue!4440 thiss!1504) lt!124662))))

(assert (=> b!248878 (= (apply!237 (+!664 lt!124649 (tuple2!4829 lt!124657 (zeroValue!4440 thiss!1504))) lt!124662) (apply!237 lt!124649 lt!124662))))

(declare-fun lt!124654 () Unit!7703)

(assert (=> b!248878 (= lt!124654 lt!124660)))

(declare-fun lt!124653 () ListLongMap!3741)

(assert (=> b!248878 (= lt!124653 (getCurrentListMapNoExtraKeys!559 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)))))

(declare-fun lt!124661 () (_ BitVec 64))

(assert (=> b!248878 (= lt!124661 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124664 () (_ BitVec 64))

(assert (=> b!248878 (= lt!124664 (select (arr!5813 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248878 (= lt!124652 (addApplyDifferent!213 lt!124653 lt!124661 (minValue!4440 thiss!1504) lt!124664))))

(assert (=> b!248878 (= (apply!237 (+!664 lt!124653 (tuple2!4829 lt!124661 (minValue!4440 thiss!1504))) lt!124664) (apply!237 lt!124653 lt!124664))))

(declare-fun b!248879 () Bool)

(assert (=> b!248879 (= e!161428 e!161427)))

(declare-fun res!121948 () Bool)

(assert (=> b!248879 (=> (not res!121948) (not e!161427))))

(assert (=> b!248879 (= res!121948 (contains!1802 lt!124670 (select (arr!5813 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!248879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))))))

(declare-fun b!248880 () Bool)

(assert (=> b!248880 (= e!161420 (validKeyInArray!0 (select (arr!5813 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248881 () Bool)

(declare-fun call!23355 () ListLongMap!3741)

(assert (=> b!248881 (= e!161429 call!23355)))

(declare-fun bm!23349 () Bool)

(assert (=> bm!23349 (= call!23353 (contains!1802 lt!124670 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23350 () Bool)

(declare-fun call!23354 () ListLongMap!3741)

(assert (=> bm!23350 (= call!23354 (getCurrentListMapNoExtraKeys!559 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)))))

(declare-fun b!248882 () Bool)

(declare-fun call!23352 () ListLongMap!3741)

(assert (=> b!248882 (= e!161418 (+!664 call!23352 (tuple2!4829 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4440 thiss!1504))))))

(declare-fun b!248883 () Bool)

(assert (=> b!248883 (= e!161424 e!161426)))

(declare-fun res!121949 () Bool)

(assert (=> b!248883 (= res!121949 call!23353)))

(assert (=> b!248883 (=> (not res!121949) (not e!161426))))

(declare-fun b!248884 () Bool)

(declare-fun call!23356 () ListLongMap!3741)

(assert (=> b!248884 (= e!161429 call!23356)))

(declare-fun bm!23351 () Bool)

(assert (=> bm!23351 (= call!23355 call!23352)))

(declare-fun bm!23352 () Bool)

(assert (=> bm!23352 (= call!23351 (contains!1802 lt!124670 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23353 () Bool)

(declare-fun call!23357 () ListLongMap!3741)

(assert (=> bm!23353 (= call!23356 call!23357)))

(declare-fun bm!23354 () Bool)

(assert (=> bm!23354 (= call!23357 call!23354)))

(declare-fun b!248885 () Bool)

(assert (=> b!248885 (= e!161423 call!23355)))

(declare-fun d!60577 () Bool)

(assert (=> d!60577 e!161425))

(declare-fun res!121950 () Bool)

(assert (=> d!60577 (=> (not res!121950) (not e!161425))))

(assert (=> d!60577 (= res!121950 (or (bvsge #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))))))))

(declare-fun lt!124658 () ListLongMap!3741)

(assert (=> d!60577 (= lt!124670 lt!124658)))

(declare-fun lt!124663 () Unit!7703)

(assert (=> d!60577 (= lt!124663 e!161419)))

(declare-fun c!41718 () Bool)

(assert (=> d!60577 (= c!41718 e!161422)))

(declare-fun res!121951 () Bool)

(assert (=> d!60577 (=> (not res!121951) (not e!161422))))

(assert (=> d!60577 (= res!121951 (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))))))

(assert (=> d!60577 (= lt!124658 e!161418)))

(declare-fun c!41720 () Bool)

(assert (=> d!60577 (= c!41720 (and (not (= (bvand (extraKeys!4336 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4336 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60577 (validMask!0 (mask!10753 thiss!1504))))

(assert (=> d!60577 (= (getCurrentListMap!1414 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4599 thiss!1504)) lt!124670)))

(declare-fun bm!23348 () Bool)

(assert (=> bm!23348 (= call!23352 (+!664 (ite c!41720 call!23354 (ite c!41719 call!23357 call!23356)) (ite (or c!41720 c!41719) (tuple2!4829 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4440 thiss!1504)) (tuple2!4829 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4440 thiss!1504)))))))

(declare-fun b!248886 () Bool)

(declare-fun e!161421 () Bool)

(assert (=> b!248886 (= e!161417 e!161421)))

(declare-fun res!121945 () Bool)

(assert (=> b!248886 (= res!121945 call!23351)))

(assert (=> b!248886 (=> (not res!121945) (not e!161421))))

(declare-fun b!248887 () Bool)

(assert (=> b!248887 (= e!161421 (= (apply!237 lt!124670 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4440 thiss!1504)))))

(assert (= (and d!60577 c!41720) b!248882))

(assert (= (and d!60577 (not c!41720)) b!248868))

(assert (= (and b!248868 c!41719) b!248885))

(assert (= (and b!248868 (not c!41719)) b!248869))

(assert (= (and b!248869 c!41717) b!248881))

(assert (= (and b!248869 (not c!41717)) b!248884))

(assert (= (or b!248881 b!248884) bm!23353))

(assert (= (or b!248885 bm!23353) bm!23354))

(assert (= (or b!248885 b!248881) bm!23351))

(assert (= (or b!248882 bm!23354) bm!23350))

(assert (= (or b!248882 bm!23351) bm!23348))

(assert (= (and d!60577 res!121951) b!248877))

(assert (= (and d!60577 c!41718) b!248878))

(assert (= (and d!60577 (not c!41718)) b!248872))

(assert (= (and d!60577 res!121950) b!248873))

(assert (= (and b!248873 res!121943) b!248880))

(assert (= (and b!248873 (not res!121946)) b!248879))

(assert (= (and b!248879 res!121948) b!248874))

(assert (= (and b!248873 res!121947) b!248871))

(assert (= (and b!248871 c!41721) b!248883))

(assert (= (and b!248871 (not c!41721)) b!248876))

(assert (= (and b!248883 res!121949) b!248875))

(assert (= (or b!248883 b!248876) bm!23349))

(assert (= (and b!248871 res!121944) b!248870))

(assert (= (and b!248870 c!41722) b!248886))

(assert (= (and b!248870 (not c!41722)) b!248867))

(assert (= (and b!248886 res!121945) b!248887))

(assert (= (or b!248886 b!248867) bm!23352))

(declare-fun b_lambda!8059 () Bool)

(assert (=> (not b_lambda!8059) (not b!248874)))

(declare-fun t!8739 () Bool)

(declare-fun tb!2987 () Bool)

(assert (=> (and b!248725 (= (defaultEntry!4599 thiss!1504) (defaultEntry!4599 thiss!1504)) t!8739) tb!2987))

(declare-fun result!5283 () Bool)

(assert (=> tb!2987 (= result!5283 tp_is_empty!6471)))

(assert (=> b!248874 t!8739))

(declare-fun b_and!13619 () Bool)

(assert (= b_and!13615 (and (=> t!8739 result!5283) b_and!13619)))

(declare-fun m!265487 () Bool)

(assert (=> bm!23352 m!265487))

(declare-fun m!265489 () Bool)

(assert (=> b!248880 m!265489))

(assert (=> b!248880 m!265489))

(declare-fun m!265491 () Bool)

(assert (=> b!248880 m!265491))

(declare-fun m!265493 () Bool)

(assert (=> bm!23350 m!265493))

(assert (=> b!248879 m!265489))

(assert (=> b!248879 m!265489))

(declare-fun m!265495 () Bool)

(assert (=> b!248879 m!265495))

(declare-fun m!265497 () Bool)

(assert (=> b!248874 m!265497))

(declare-fun m!265499 () Bool)

(assert (=> b!248874 m!265499))

(declare-fun m!265501 () Bool)

(assert (=> b!248874 m!265501))

(assert (=> b!248874 m!265499))

(assert (=> b!248874 m!265497))

(assert (=> b!248874 m!265489))

(declare-fun m!265503 () Bool)

(assert (=> b!248874 m!265503))

(assert (=> b!248874 m!265489))

(declare-fun m!265505 () Bool)

(assert (=> bm!23348 m!265505))

(declare-fun m!265507 () Bool)

(assert (=> b!248875 m!265507))

(assert (=> d!60577 m!265399))

(declare-fun m!265509 () Bool)

(assert (=> b!248878 m!265509))

(declare-fun m!265511 () Bool)

(assert (=> b!248878 m!265511))

(declare-fun m!265513 () Bool)

(assert (=> b!248878 m!265513))

(declare-fun m!265515 () Bool)

(assert (=> b!248878 m!265515))

(declare-fun m!265517 () Bool)

(assert (=> b!248878 m!265517))

(declare-fun m!265519 () Bool)

(assert (=> b!248878 m!265519))

(assert (=> b!248878 m!265493))

(declare-fun m!265521 () Bool)

(assert (=> b!248878 m!265521))

(declare-fun m!265523 () Bool)

(assert (=> b!248878 m!265523))

(declare-fun m!265525 () Bool)

(assert (=> b!248878 m!265525))

(assert (=> b!248878 m!265523))

(declare-fun m!265527 () Bool)

(assert (=> b!248878 m!265527))

(declare-fun m!265529 () Bool)

(assert (=> b!248878 m!265529))

(assert (=> b!248878 m!265489))

(declare-fun m!265531 () Bool)

(assert (=> b!248878 m!265531))

(assert (=> b!248878 m!265519))

(declare-fun m!265533 () Bool)

(assert (=> b!248878 m!265533))

(declare-fun m!265535 () Bool)

(assert (=> b!248878 m!265535))

(declare-fun m!265537 () Bool)

(assert (=> b!248878 m!265537))

(assert (=> b!248878 m!265511))

(assert (=> b!248878 m!265535))

(declare-fun m!265539 () Bool)

(assert (=> bm!23349 m!265539))

(declare-fun m!265541 () Bool)

(assert (=> b!248882 m!265541))

(assert (=> b!248877 m!265489))

(assert (=> b!248877 m!265489))

(assert (=> b!248877 m!265491))

(declare-fun m!265543 () Bool)

(assert (=> b!248887 m!265543))

(assert (=> b!248717 d!60577))

(declare-fun d!60579 () Bool)

(declare-fun lt!124673 () (_ BitVec 32))

(assert (=> d!60579 (and (bvsge lt!124673 #b00000000000000000000000000000000) (bvsle lt!124673 (bvsub (size!6156 lt!124548) #b00000000000000000000000000000000)))))

(declare-fun e!161435 () (_ BitVec 32))

(assert (=> d!60579 (= lt!124673 e!161435)))

(declare-fun c!41727 () Bool)

(assert (=> d!60579 (= c!41727 (bvsge #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))))))

(assert (=> d!60579 (and (bvsle #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6156 (_keys!6725 thiss!1504)) (size!6156 lt!124548)))))

(assert (=> d!60579 (= (arrayCountValidKeys!0 lt!124548 #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))) lt!124673)))

(declare-fun b!248898 () Bool)

(assert (=> b!248898 (= e!161435 #b00000000000000000000000000000000)))

(declare-fun b!248899 () Bool)

(declare-fun e!161434 () (_ BitVec 32))

(declare-fun call!23360 () (_ BitVec 32))

(assert (=> b!248899 (= e!161434 (bvadd #b00000000000000000000000000000001 call!23360))))

(declare-fun bm!23357 () Bool)

(assert (=> bm!23357 (= call!23360 (arrayCountValidKeys!0 lt!124548 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6725 thiss!1504))))))

(declare-fun b!248900 () Bool)

(assert (=> b!248900 (= e!161434 call!23360)))

(declare-fun b!248901 () Bool)

(assert (=> b!248901 (= e!161435 e!161434)))

(declare-fun c!41728 () Bool)

(assert (=> b!248901 (= c!41728 (validKeyInArray!0 (select (arr!5813 lt!124548) #b00000000000000000000000000000000)))))

(assert (= (and d!60579 c!41727) b!248898))

(assert (= (and d!60579 (not c!41727)) b!248901))

(assert (= (and b!248901 c!41728) b!248899))

(assert (= (and b!248901 (not c!41728)) b!248900))

(assert (= (or b!248899 b!248900) bm!23357))

(declare-fun m!265545 () Bool)

(assert (=> bm!23357 m!265545))

(declare-fun m!265547 () Bool)

(assert (=> b!248901 m!265547))

(assert (=> b!248901 m!265547))

(declare-fun m!265549 () Bool)

(assert (=> b!248901 m!265549))

(assert (=> b!248728 d!60579))

(declare-fun d!60581 () Bool)

(declare-fun lt!124674 () (_ BitVec 32))

(assert (=> d!60581 (and (bvsge lt!124674 #b00000000000000000000000000000000) (bvsle lt!124674 (bvsub (size!6156 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!161437 () (_ BitVec 32))

(assert (=> d!60581 (= lt!124674 e!161437)))

(declare-fun c!41729 () Bool)

(assert (=> d!60581 (= c!41729 (bvsge #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))))))

(assert (=> d!60581 (and (bvsle #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6156 (_keys!6725 thiss!1504)) (size!6156 (_keys!6725 thiss!1504))))))

(assert (=> d!60581 (= (arrayCountValidKeys!0 (_keys!6725 thiss!1504) #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))) lt!124674)))

(declare-fun b!248902 () Bool)

(assert (=> b!248902 (= e!161437 #b00000000000000000000000000000000)))

(declare-fun b!248903 () Bool)

(declare-fun e!161436 () (_ BitVec 32))

(declare-fun call!23361 () (_ BitVec 32))

(assert (=> b!248903 (= e!161436 (bvadd #b00000000000000000000000000000001 call!23361))))

(declare-fun bm!23358 () Bool)

(assert (=> bm!23358 (= call!23361 (arrayCountValidKeys!0 (_keys!6725 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6725 thiss!1504))))))

(declare-fun b!248904 () Bool)

(assert (=> b!248904 (= e!161436 call!23361)))

(declare-fun b!248905 () Bool)

(assert (=> b!248905 (= e!161437 e!161436)))

(declare-fun c!41730 () Bool)

(assert (=> b!248905 (= c!41730 (validKeyInArray!0 (select (arr!5813 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60581 c!41729) b!248902))

(assert (= (and d!60581 (not c!41729)) b!248905))

(assert (= (and b!248905 c!41730) b!248903))

(assert (= (and b!248905 (not c!41730)) b!248904))

(assert (= (or b!248903 b!248904) bm!23358))

(declare-fun m!265551 () Bool)

(assert (=> bm!23358 m!265551))

(assert (=> b!248905 m!265489))

(assert (=> b!248905 m!265489))

(assert (=> b!248905 m!265491))

(assert (=> b!248728 d!60581))

(declare-fun d!60583 () Bool)

(assert (=> d!60583 (= (validMask!0 (mask!10753 thiss!1504)) (and (or (= (mask!10753 thiss!1504) #b00000000000000000000000000000111) (= (mask!10753 thiss!1504) #b00000000000000000000000000001111) (= (mask!10753 thiss!1504) #b00000000000000000000000000011111) (= (mask!10753 thiss!1504) #b00000000000000000000000000111111) (= (mask!10753 thiss!1504) #b00000000000000000000000001111111) (= (mask!10753 thiss!1504) #b00000000000000000000000011111111) (= (mask!10753 thiss!1504) #b00000000000000000000000111111111) (= (mask!10753 thiss!1504) #b00000000000000000000001111111111) (= (mask!10753 thiss!1504) #b00000000000000000000011111111111) (= (mask!10753 thiss!1504) #b00000000000000000000111111111111) (= (mask!10753 thiss!1504) #b00000000000000000001111111111111) (= (mask!10753 thiss!1504) #b00000000000000000011111111111111) (= (mask!10753 thiss!1504) #b00000000000000000111111111111111) (= (mask!10753 thiss!1504) #b00000000000000001111111111111111) (= (mask!10753 thiss!1504) #b00000000000000011111111111111111) (= (mask!10753 thiss!1504) #b00000000000000111111111111111111) (= (mask!10753 thiss!1504) #b00000000000001111111111111111111) (= (mask!10753 thiss!1504) #b00000000000011111111111111111111) (= (mask!10753 thiss!1504) #b00000000000111111111111111111111) (= (mask!10753 thiss!1504) #b00000000001111111111111111111111) (= (mask!10753 thiss!1504) #b00000000011111111111111111111111) (= (mask!10753 thiss!1504) #b00000000111111111111111111111111) (= (mask!10753 thiss!1504) #b00000001111111111111111111111111) (= (mask!10753 thiss!1504) #b00000011111111111111111111111111) (= (mask!10753 thiss!1504) #b00000111111111111111111111111111) (= (mask!10753 thiss!1504) #b00001111111111111111111111111111) (= (mask!10753 thiss!1504) #b00011111111111111111111111111111) (= (mask!10753 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10753 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!248728 d!60583))

(declare-fun b!248914 () Bool)

(declare-fun e!161446 () Bool)

(declare-fun call!23364 () Bool)

(assert (=> b!248914 (= e!161446 call!23364)))

(declare-fun bm!23361 () Bool)

(assert (=> bm!23361 (= call!23364 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!124548 (mask!10753 thiss!1504)))))

(declare-fun d!60585 () Bool)

(declare-fun res!121956 () Bool)

(declare-fun e!161445 () Bool)

(assert (=> d!60585 (=> res!121956 e!161445)))

(assert (=> d!60585 (= res!121956 (bvsge #b00000000000000000000000000000000 (size!6156 lt!124548)))))

(assert (=> d!60585 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124548 (mask!10753 thiss!1504)) e!161445)))

(declare-fun b!248915 () Bool)

(declare-fun e!161444 () Bool)

(assert (=> b!248915 (= e!161444 call!23364)))

(declare-fun b!248916 () Bool)

(assert (=> b!248916 (= e!161444 e!161446)))

(declare-fun lt!124682 () (_ BitVec 64))

(assert (=> b!248916 (= lt!124682 (select (arr!5813 lt!124548) #b00000000000000000000000000000000))))

(declare-fun lt!124681 () Unit!7703)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12255 (_ BitVec 64) (_ BitVec 32)) Unit!7703)

(assert (=> b!248916 (= lt!124681 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124548 lt!124682 #b00000000000000000000000000000000))))

(assert (=> b!248916 (arrayContainsKey!0 lt!124548 lt!124682 #b00000000000000000000000000000000)))

(declare-fun lt!124683 () Unit!7703)

(assert (=> b!248916 (= lt!124683 lt!124681)))

(declare-fun res!121957 () Bool)

(assert (=> b!248916 (= res!121957 (= (seekEntryOrOpen!0 (select (arr!5813 lt!124548) #b00000000000000000000000000000000) lt!124548 (mask!10753 thiss!1504)) (Found!1113 #b00000000000000000000000000000000)))))

(assert (=> b!248916 (=> (not res!121957) (not e!161446))))

(declare-fun b!248917 () Bool)

(assert (=> b!248917 (= e!161445 e!161444)))

(declare-fun c!41733 () Bool)

(assert (=> b!248917 (= c!41733 (validKeyInArray!0 (select (arr!5813 lt!124548) #b00000000000000000000000000000000)))))

(assert (= (and d!60585 (not res!121956)) b!248917))

(assert (= (and b!248917 c!41733) b!248916))

(assert (= (and b!248917 (not c!41733)) b!248915))

(assert (= (and b!248916 res!121957) b!248914))

(assert (= (or b!248914 b!248915) bm!23361))

(declare-fun m!265553 () Bool)

(assert (=> bm!23361 m!265553))

(assert (=> b!248916 m!265547))

(declare-fun m!265555 () Bool)

(assert (=> b!248916 m!265555))

(declare-fun m!265557 () Bool)

(assert (=> b!248916 m!265557))

(assert (=> b!248916 m!265547))

(declare-fun m!265559 () Bool)

(assert (=> b!248916 m!265559))

(assert (=> b!248917 m!265547))

(assert (=> b!248917 m!265547))

(assert (=> b!248917 m!265549))

(assert (=> b!248728 d!60585))

(declare-fun d!60587 () Bool)

(declare-fun e!161449 () Bool)

(assert (=> d!60587 e!161449))

(declare-fun res!121960 () Bool)

(assert (=> d!60587 (=> (not res!121960) (not e!161449))))

(assert (=> d!60587 (= res!121960 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6156 (_keys!6725 thiss!1504)))))))

(declare-fun lt!124686 () Unit!7703)

(declare-fun choose!41 (array!12255 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3710) Unit!7703)

(assert (=> d!60587 (= lt!124686 (choose!41 (_keys!6725 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3707))))

(assert (=> d!60587 (bvslt (size!6156 (_keys!6725 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60587 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6725 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3707) lt!124686)))

(declare-fun b!248920 () Bool)

(assert (=> b!248920 (= e!161449 (arrayNoDuplicates!0 (array!12256 (store (arr!5813 (_keys!6725 thiss!1504)) index!297 key!932) (size!6156 (_keys!6725 thiss!1504))) #b00000000000000000000000000000000 Nil!3707))))

(assert (= (and d!60587 res!121960) b!248920))

(declare-fun m!265561 () Bool)

(assert (=> d!60587 m!265561))

(assert (=> b!248920 m!265403))

(declare-fun m!265563 () Bool)

(assert (=> b!248920 m!265563))

(assert (=> b!248728 d!60587))

(declare-fun b!248932 () Bool)

(declare-fun e!161454 () Bool)

(assert (=> b!248932 (= e!161454 (= (arrayCountValidKeys!0 (array!12256 (store (arr!5813 (_keys!6725 thiss!1504)) index!297 key!932) (size!6156 (_keys!6725 thiss!1504))) #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6725 thiss!1504) #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!60589 () Bool)

(assert (=> d!60589 e!161454))

(declare-fun res!121970 () Bool)

(assert (=> d!60589 (=> (not res!121970) (not e!161454))))

(assert (=> d!60589 (= res!121970 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6156 (_keys!6725 thiss!1504)))))))

(declare-fun lt!124689 () Unit!7703)

(declare-fun choose!1 (array!12255 (_ BitVec 32) (_ BitVec 64)) Unit!7703)

(assert (=> d!60589 (= lt!124689 (choose!1 (_keys!6725 thiss!1504) index!297 key!932))))

(declare-fun e!161455 () Bool)

(assert (=> d!60589 e!161455))

(declare-fun res!121969 () Bool)

(assert (=> d!60589 (=> (not res!121969) (not e!161455))))

(assert (=> d!60589 (= res!121969 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6156 (_keys!6725 thiss!1504)))))))

(assert (=> d!60589 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6725 thiss!1504) index!297 key!932) lt!124689)))

(declare-fun b!248930 () Bool)

(declare-fun res!121972 () Bool)

(assert (=> b!248930 (=> (not res!121972) (not e!161455))))

(assert (=> b!248930 (= res!121972 (validKeyInArray!0 key!932))))

(declare-fun b!248929 () Bool)

(declare-fun res!121971 () Bool)

(assert (=> b!248929 (=> (not res!121971) (not e!161455))))

(assert (=> b!248929 (= res!121971 (not (validKeyInArray!0 (select (arr!5813 (_keys!6725 thiss!1504)) index!297))))))

(declare-fun b!248931 () Bool)

(assert (=> b!248931 (= e!161455 (bvslt (size!6156 (_keys!6725 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!60589 res!121969) b!248929))

(assert (= (and b!248929 res!121971) b!248930))

(assert (= (and b!248930 res!121972) b!248931))

(assert (= (and d!60589 res!121970) b!248932))

(assert (=> b!248932 m!265403))

(declare-fun m!265565 () Bool)

(assert (=> b!248932 m!265565))

(assert (=> b!248932 m!265405))

(declare-fun m!265567 () Bool)

(assert (=> d!60589 m!265567))

(declare-fun m!265569 () Bool)

(assert (=> b!248930 m!265569))

(declare-fun m!265571 () Bool)

(assert (=> b!248929 m!265571))

(assert (=> b!248929 m!265571))

(declare-fun m!265573 () Bool)

(assert (=> b!248929 m!265573))

(assert (=> b!248728 d!60589))

(declare-fun b!248943 () Bool)

(declare-fun e!161466 () Bool)

(declare-fun e!161467 () Bool)

(assert (=> b!248943 (= e!161466 e!161467)))

(declare-fun c!41736 () Bool)

(assert (=> b!248943 (= c!41736 (validKeyInArray!0 (select (arr!5813 lt!124548) #b00000000000000000000000000000000)))))

(declare-fun bm!23364 () Bool)

(declare-fun call!23367 () Bool)

(assert (=> bm!23364 (= call!23367 (arrayNoDuplicates!0 lt!124548 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41736 (Cons!3706 (select (arr!5813 lt!124548) #b00000000000000000000000000000000) Nil!3707) Nil!3707)))))

(declare-fun d!60591 () Bool)

(declare-fun res!121979 () Bool)

(declare-fun e!161464 () Bool)

(assert (=> d!60591 (=> res!121979 e!161464)))

(assert (=> d!60591 (= res!121979 (bvsge #b00000000000000000000000000000000 (size!6156 lt!124548)))))

(assert (=> d!60591 (= (arrayNoDuplicates!0 lt!124548 #b00000000000000000000000000000000 Nil!3707) e!161464)))

(declare-fun b!248944 () Bool)

(assert (=> b!248944 (= e!161464 e!161466)))

(declare-fun res!121981 () Bool)

(assert (=> b!248944 (=> (not res!121981) (not e!161466))))

(declare-fun e!161465 () Bool)

(assert (=> b!248944 (= res!121981 (not e!161465))))

(declare-fun res!121980 () Bool)

(assert (=> b!248944 (=> (not res!121980) (not e!161465))))

(assert (=> b!248944 (= res!121980 (validKeyInArray!0 (select (arr!5813 lt!124548) #b00000000000000000000000000000000)))))

(declare-fun b!248945 () Bool)

(declare-fun contains!1803 (List!3710 (_ BitVec 64)) Bool)

(assert (=> b!248945 (= e!161465 (contains!1803 Nil!3707 (select (arr!5813 lt!124548) #b00000000000000000000000000000000)))))

(declare-fun b!248946 () Bool)

(assert (=> b!248946 (= e!161467 call!23367)))

(declare-fun b!248947 () Bool)

(assert (=> b!248947 (= e!161467 call!23367)))

(assert (= (and d!60591 (not res!121979)) b!248944))

(assert (= (and b!248944 res!121980) b!248945))

(assert (= (and b!248944 res!121981) b!248943))

(assert (= (and b!248943 c!41736) b!248946))

(assert (= (and b!248943 (not c!41736)) b!248947))

(assert (= (or b!248946 b!248947) bm!23364))

(assert (=> b!248943 m!265547))

(assert (=> b!248943 m!265547))

(assert (=> b!248943 m!265549))

(assert (=> bm!23364 m!265547))

(declare-fun m!265575 () Bool)

(assert (=> bm!23364 m!265575))

(assert (=> b!248944 m!265547))

(assert (=> b!248944 m!265547))

(assert (=> b!248944 m!265549))

(assert (=> b!248945 m!265547))

(assert (=> b!248945 m!265547))

(declare-fun m!265577 () Bool)

(assert (=> b!248945 m!265577))

(assert (=> b!248728 d!60591))

(declare-fun d!60593 () Bool)

(declare-fun res!121986 () Bool)

(declare-fun e!161472 () Bool)

(assert (=> d!60593 (=> res!121986 e!161472)))

(assert (=> d!60593 (= res!121986 (= (select (arr!5813 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60593 (= (arrayContainsKey!0 (_keys!6725 thiss!1504) key!932 #b00000000000000000000000000000000) e!161472)))

(declare-fun b!248952 () Bool)

(declare-fun e!161473 () Bool)

(assert (=> b!248952 (= e!161472 e!161473)))

(declare-fun res!121987 () Bool)

(assert (=> b!248952 (=> (not res!121987) (not e!161473))))

(assert (=> b!248952 (= res!121987 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6725 thiss!1504))))))

(declare-fun b!248953 () Bool)

(assert (=> b!248953 (= e!161473 (arrayContainsKey!0 (_keys!6725 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60593 (not res!121986)) b!248952))

(assert (= (and b!248952 res!121987) b!248953))

(assert (=> d!60593 m!265489))

(declare-fun m!265579 () Bool)

(assert (=> b!248953 m!265579))

(assert (=> b!248728 d!60593))

(declare-fun d!60595 () Bool)

(declare-fun e!161476 () Bool)

(assert (=> d!60595 e!161476))

(declare-fun res!121990 () Bool)

(assert (=> d!60595 (=> (not res!121990) (not e!161476))))

(assert (=> d!60595 (= res!121990 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6156 (_keys!6725 thiss!1504)))))))

(declare-fun lt!124692 () Unit!7703)

(declare-fun choose!102 ((_ BitVec 64) array!12255 (_ BitVec 32) (_ BitVec 32)) Unit!7703)

(assert (=> d!60595 (= lt!124692 (choose!102 key!932 (_keys!6725 thiss!1504) index!297 (mask!10753 thiss!1504)))))

(assert (=> d!60595 (validMask!0 (mask!10753 thiss!1504))))

(assert (=> d!60595 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6725 thiss!1504) index!297 (mask!10753 thiss!1504)) lt!124692)))

(declare-fun b!248956 () Bool)

(assert (=> b!248956 (= e!161476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12256 (store (arr!5813 (_keys!6725 thiss!1504)) index!297 key!932) (size!6156 (_keys!6725 thiss!1504))) (mask!10753 thiss!1504)))))

(assert (= (and d!60595 res!121990) b!248956))

(declare-fun m!265581 () Bool)

(assert (=> d!60595 m!265581))

(assert (=> d!60595 m!265399))

(assert (=> b!248956 m!265403))

(declare-fun m!265583 () Bool)

(assert (=> b!248956 m!265583))

(assert (=> b!248728 d!60595))

(declare-fun d!60597 () Bool)

(declare-fun e!161479 () Bool)

(assert (=> d!60597 e!161479))

(declare-fun res!121996 () Bool)

(assert (=> d!60597 (=> (not res!121996) (not e!161479))))

(declare-fun lt!124697 () SeekEntryResult!1113)

(assert (=> d!60597 (= res!121996 ((_ is Found!1113) lt!124697))))

(assert (=> d!60597 (= lt!124697 (seekEntryOrOpen!0 key!932 (_keys!6725 thiss!1504) (mask!10753 thiss!1504)))))

(declare-fun lt!124698 () Unit!7703)

(declare-fun choose!1172 (array!12255 array!12253 (_ BitVec 32) (_ BitVec 32) V!8275 V!8275 (_ BitVec 64) Int) Unit!7703)

(assert (=> d!60597 (= lt!124698 (choose!1172 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) key!932 (defaultEntry!4599 thiss!1504)))))

(assert (=> d!60597 (validMask!0 (mask!10753 thiss!1504))))

(assert (=> d!60597 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!391 (_keys!6725 thiss!1504) (_values!4582 thiss!1504) (mask!10753 thiss!1504) (extraKeys!4336 thiss!1504) (zeroValue!4440 thiss!1504) (minValue!4440 thiss!1504) key!932 (defaultEntry!4599 thiss!1504)) lt!124698)))

(declare-fun b!248961 () Bool)

(declare-fun res!121995 () Bool)

(assert (=> b!248961 (=> (not res!121995) (not e!161479))))

(assert (=> b!248961 (= res!121995 (inRange!0 (index!6623 lt!124697) (mask!10753 thiss!1504)))))

(declare-fun b!248962 () Bool)

(assert (=> b!248962 (= e!161479 (= (select (arr!5813 (_keys!6725 thiss!1504)) (index!6623 lt!124697)) key!932))))

(assert (=> b!248962 (and (bvsge (index!6623 lt!124697) #b00000000000000000000000000000000) (bvslt (index!6623 lt!124697) (size!6156 (_keys!6725 thiss!1504))))))

(assert (= (and d!60597 res!121996) b!248961))

(assert (= (and b!248961 res!121995) b!248962))

(assert (=> d!60597 m!265397))

(declare-fun m!265585 () Bool)

(assert (=> d!60597 m!265585))

(assert (=> d!60597 m!265399))

(declare-fun m!265587 () Bool)

(assert (=> b!248961 m!265587))

(declare-fun m!265589 () Bool)

(assert (=> b!248962 m!265589))

(assert (=> b!248721 d!60597))

(declare-fun d!60599 () Bool)

(assert (=> d!60599 (= (inRange!0 (ite c!41680 (index!6622 lt!124545) (index!6625 lt!124545)) (mask!10753 thiss!1504)) (and (bvsge (ite c!41680 (index!6622 lt!124545) (index!6625 lt!124545)) #b00000000000000000000000000000000) (bvslt (ite c!41680 (index!6622 lt!124545) (index!6625 lt!124545)) (bvadd (mask!10753 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23320 d!60599))

(declare-fun d!60601 () Bool)

(declare-fun res!122003 () Bool)

(declare-fun e!161482 () Bool)

(assert (=> d!60601 (=> (not res!122003) (not e!161482))))

(declare-fun simpleValid!260 (LongMapFixedSize!3684) Bool)

(assert (=> d!60601 (= res!122003 (simpleValid!260 thiss!1504))))

(assert (=> d!60601 (= (valid!1442 thiss!1504) e!161482)))

(declare-fun b!248969 () Bool)

(declare-fun res!122004 () Bool)

(assert (=> b!248969 (=> (not res!122004) (not e!161482))))

(assert (=> b!248969 (= res!122004 (= (arrayCountValidKeys!0 (_keys!6725 thiss!1504) #b00000000000000000000000000000000 (size!6156 (_keys!6725 thiss!1504))) (_size!1891 thiss!1504)))))

(declare-fun b!248970 () Bool)

(declare-fun res!122005 () Bool)

(assert (=> b!248970 (=> (not res!122005) (not e!161482))))

(assert (=> b!248970 (= res!122005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6725 thiss!1504) (mask!10753 thiss!1504)))))

(declare-fun b!248971 () Bool)

(assert (=> b!248971 (= e!161482 (arrayNoDuplicates!0 (_keys!6725 thiss!1504) #b00000000000000000000000000000000 Nil!3707))))

(assert (= (and d!60601 res!122003) b!248969))

(assert (= (and b!248969 res!122004) b!248970))

(assert (= (and b!248970 res!122005) b!248971))

(declare-fun m!265591 () Bool)

(assert (=> d!60601 m!265591))

(assert (=> b!248969 m!265405))

(declare-fun m!265593 () Bool)

(assert (=> b!248970 m!265593))

(declare-fun m!265595 () Bool)

(assert (=> b!248971 m!265595))

(assert (=> start!23662 d!60601))

(declare-fun d!60603 () Bool)

(assert (=> d!60603 (= (array_inv!3837 (_keys!6725 thiss!1504)) (bvsge (size!6156 (_keys!6725 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248725 d!60603))

(declare-fun d!60605 () Bool)

(assert (=> d!60605 (= (array_inv!3838 (_values!4582 thiss!1504)) (bvsge (size!6155 (_values!4582 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248725 d!60605))

(declare-fun b!248984 () Bool)

(declare-fun c!41744 () Bool)

(declare-fun lt!124705 () (_ BitVec 64))

(assert (=> b!248984 (= c!41744 (= lt!124705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161491 () SeekEntryResult!1113)

(declare-fun e!161489 () SeekEntryResult!1113)

(assert (=> b!248984 (= e!161491 e!161489)))

(declare-fun d!60607 () Bool)

(declare-fun lt!124706 () SeekEntryResult!1113)

(assert (=> d!60607 (and (or ((_ is Undefined!1113) lt!124706) (not ((_ is Found!1113) lt!124706)) (and (bvsge (index!6623 lt!124706) #b00000000000000000000000000000000) (bvslt (index!6623 lt!124706) (size!6156 (_keys!6725 thiss!1504))))) (or ((_ is Undefined!1113) lt!124706) ((_ is Found!1113) lt!124706) (not ((_ is MissingZero!1113) lt!124706)) (and (bvsge (index!6622 lt!124706) #b00000000000000000000000000000000) (bvslt (index!6622 lt!124706) (size!6156 (_keys!6725 thiss!1504))))) (or ((_ is Undefined!1113) lt!124706) ((_ is Found!1113) lt!124706) ((_ is MissingZero!1113) lt!124706) (not ((_ is MissingVacant!1113) lt!124706)) (and (bvsge (index!6625 lt!124706) #b00000000000000000000000000000000) (bvslt (index!6625 lt!124706) (size!6156 (_keys!6725 thiss!1504))))) (or ((_ is Undefined!1113) lt!124706) (ite ((_ is Found!1113) lt!124706) (= (select (arr!5813 (_keys!6725 thiss!1504)) (index!6623 lt!124706)) key!932) (ite ((_ is MissingZero!1113) lt!124706) (= (select (arr!5813 (_keys!6725 thiss!1504)) (index!6622 lt!124706)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1113) lt!124706) (= (select (arr!5813 (_keys!6725 thiss!1504)) (index!6625 lt!124706)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!161490 () SeekEntryResult!1113)

(assert (=> d!60607 (= lt!124706 e!161490)))

(declare-fun c!41743 () Bool)

(declare-fun lt!124707 () SeekEntryResult!1113)

(assert (=> d!60607 (= c!41743 (and ((_ is Intermediate!1113) lt!124707) (undefined!1925 lt!124707)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12255 (_ BitVec 32)) SeekEntryResult!1113)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60607 (= lt!124707 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10753 thiss!1504)) key!932 (_keys!6725 thiss!1504) (mask!10753 thiss!1504)))))

(assert (=> d!60607 (validMask!0 (mask!10753 thiss!1504))))

(assert (=> d!60607 (= (seekEntryOrOpen!0 key!932 (_keys!6725 thiss!1504) (mask!10753 thiss!1504)) lt!124706)))

(declare-fun b!248985 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12255 (_ BitVec 32)) SeekEntryResult!1113)

(assert (=> b!248985 (= e!161489 (seekKeyOrZeroReturnVacant!0 (x!24593 lt!124707) (index!6624 lt!124707) (index!6624 lt!124707) key!932 (_keys!6725 thiss!1504) (mask!10753 thiss!1504)))))

(declare-fun b!248986 () Bool)

(assert (=> b!248986 (= e!161490 Undefined!1113)))

(declare-fun b!248987 () Bool)

(assert (=> b!248987 (= e!161489 (MissingZero!1113 (index!6624 lt!124707)))))

(declare-fun b!248988 () Bool)

(assert (=> b!248988 (= e!161490 e!161491)))

(assert (=> b!248988 (= lt!124705 (select (arr!5813 (_keys!6725 thiss!1504)) (index!6624 lt!124707)))))

(declare-fun c!41745 () Bool)

(assert (=> b!248988 (= c!41745 (= lt!124705 key!932))))

(declare-fun b!248989 () Bool)

(assert (=> b!248989 (= e!161491 (Found!1113 (index!6624 lt!124707)))))

(assert (= (and d!60607 c!41743) b!248986))

(assert (= (and d!60607 (not c!41743)) b!248988))

(assert (= (and b!248988 c!41745) b!248989))

(assert (= (and b!248988 (not c!41745)) b!248984))

(assert (= (and b!248984 c!41744) b!248987))

(assert (= (and b!248984 (not c!41744)) b!248985))

(assert (=> d!60607 m!265399))

(declare-fun m!265597 () Bool)

(assert (=> d!60607 m!265597))

(declare-fun m!265599 () Bool)

(assert (=> d!60607 m!265599))

(declare-fun m!265601 () Bool)

(assert (=> d!60607 m!265601))

(declare-fun m!265603 () Bool)

(assert (=> d!60607 m!265603))

(assert (=> d!60607 m!265603))

(declare-fun m!265605 () Bool)

(assert (=> d!60607 m!265605))

(declare-fun m!265607 () Bool)

(assert (=> b!248985 m!265607))

(declare-fun m!265609 () Bool)

(assert (=> b!248988 m!265609))

(assert (=> b!248714 d!60607))

(assert (=> bm!23321 d!60593))

(declare-fun condMapEmpty!10994 () Bool)

(declare-fun mapDefault!10994 () ValueCell!2892)

(assert (=> mapNonEmpty!10988 (= condMapEmpty!10994 (= mapRest!10988 ((as const (Array (_ BitVec 32) ValueCell!2892)) mapDefault!10994)))))

(declare-fun e!161496 () Bool)

(declare-fun mapRes!10994 () Bool)

(assert (=> mapNonEmpty!10988 (= tp!23081 (and e!161496 mapRes!10994))))

(declare-fun b!248996 () Bool)

(declare-fun e!161497 () Bool)

(assert (=> b!248996 (= e!161497 tp_is_empty!6471)))

(declare-fun mapIsEmpty!10994 () Bool)

(assert (=> mapIsEmpty!10994 mapRes!10994))

(declare-fun mapNonEmpty!10994 () Bool)

(declare-fun tp!23090 () Bool)

(assert (=> mapNonEmpty!10994 (= mapRes!10994 (and tp!23090 e!161497))))

(declare-fun mapKey!10994 () (_ BitVec 32))

(declare-fun mapValue!10994 () ValueCell!2892)

(declare-fun mapRest!10994 () (Array (_ BitVec 32) ValueCell!2892))

(assert (=> mapNonEmpty!10994 (= mapRest!10988 (store mapRest!10994 mapKey!10994 mapValue!10994))))

(declare-fun b!248997 () Bool)

(assert (=> b!248997 (= e!161496 tp_is_empty!6471)))

(assert (= (and mapNonEmpty!10988 condMapEmpty!10994) mapIsEmpty!10994))

(assert (= (and mapNonEmpty!10988 (not condMapEmpty!10994)) mapNonEmpty!10994))

(assert (= (and mapNonEmpty!10994 ((_ is ValueCellFull!2892) mapValue!10994)) b!248996))

(assert (= (and mapNonEmpty!10988 ((_ is ValueCellFull!2892) mapDefault!10994)) b!248997))

(declare-fun m!265611 () Bool)

(assert (=> mapNonEmpty!10994 m!265611))

(declare-fun b_lambda!8061 () Bool)

(assert (= b_lambda!8059 (or (and b!248725 b_free!6609) b_lambda!8061)))

(check-sat b_and!13619 (not d!60571) (not b!248929) (not b!248875) (not b_lambda!8061) (not b!248943) (not b!248901) (not bm!23349) (not b!248932) (not bm!23350) (not b!248874) (not d!60577) (not b!248920) (not b!248877) (not d!60569) (not b!248879) (not bm!23348) (not d!60601) (not b!248985) (not bm!23357) (not d!60607) (not b!248956) (not b!248880) (not b!248970) (not b!248882) (not d!60587) (not bm!23364) (not b!248961) (not d!60597) (not b!248969) (not b!248917) (not b!248878) (not bm!23361) (not b!248916) tp_is_empty!6471 (not b!248822) (not bm!23358) (not b!248953) (not bm!23333) (not b_next!6609) (not d!60575) (not b!248905) (not d!60595) (not bm!23332) (not bm!23352) (not d!60589) (not b!248944) (not b!248971) (not b!248930) (not b!248824) (not b!248887) (not b!248945) (not mapNonEmpty!10994))
(check-sat b_and!13619 (not b_next!6609))
