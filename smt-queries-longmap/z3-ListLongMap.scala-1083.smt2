; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22184 () Bool)

(assert start!22184)

(declare-fun b!232139 () Bool)

(declare-fun b_free!6247 () Bool)

(declare-fun b_next!6247 () Bool)

(assert (=> b!232139 (= b_free!6247 (not b_next!6247))))

(declare-fun tp!21883 () Bool)

(declare-fun b_and!13159 () Bool)

(assert (=> b!232139 (= tp!21883 b_and!13159)))

(declare-fun b!232127 () Bool)

(declare-fun e!150718 () Bool)

(declare-fun tp_is_empty!6109 () Bool)

(assert (=> b!232127 (= e!150718 tp_is_empty!6109)))

(declare-fun b!232128 () Bool)

(declare-fun e!150723 () Bool)

(assert (=> b!232128 (= e!150723 tp_is_empty!6109)))

(declare-fun b!232129 () Bool)

(declare-fun res!114022 () Bool)

(declare-datatypes ((V!7793 0))(
  ( (V!7794 (val!3099 Int)) )
))
(declare-datatypes ((ValueCell!2711 0))(
  ( (ValueCellFull!2711 (v!5120 V!7793)) (EmptyCell!2711) )
))
(declare-datatypes ((array!11459 0))(
  ( (array!11460 (arr!5449 (Array (_ BitVec 32) ValueCell!2711)) (size!5782 (_ BitVec 32))) )
))
(declare-datatypes ((array!11461 0))(
  ( (array!11462 (arr!5450 (Array (_ BitVec 32) (_ BitVec 64))) (size!5783 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3322 0))(
  ( (LongMapFixedSize!3323 (defaultEntry!4320 Int) (mask!10230 (_ BitVec 32)) (extraKeys!4057 (_ BitVec 32)) (zeroValue!4161 V!7793) (minValue!4161 V!7793) (_size!1710 (_ BitVec 32)) (_keys!6374 array!11461) (_values!4303 array!11459) (_vacant!1710 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3322)

(declare-datatypes ((SeekEntryResult!928 0))(
  ( (MissingZero!928 (index!5882 (_ BitVec 32))) (Found!928 (index!5883 (_ BitVec 32))) (Intermediate!928 (undefined!1740 Bool) (index!5884 (_ BitVec 32)) (x!23508 (_ BitVec 32))) (Undefined!928) (MissingVacant!928 (index!5885 (_ BitVec 32))) )
))
(declare-fun lt!117180 () SeekEntryResult!928)

(assert (=> b!232129 (= res!114022 (= (select (arr!5450 (_keys!6374 thiss!1504)) (index!5885 lt!117180)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!150719 () Bool)

(assert (=> b!232129 (=> (not res!114022) (not e!150719))))

(declare-fun bm!21560 () Bool)

(declare-fun call!21564 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21560 (= call!21564 (arrayContainsKey!0 (_keys!6374 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232130 () Bool)

(declare-fun c!38592 () Bool)

(get-info :version)

(assert (=> b!232130 (= c!38592 ((_ is MissingVacant!928) lt!117180))))

(declare-fun e!150717 () Bool)

(declare-fun e!150720 () Bool)

(assert (=> b!232130 (= e!150717 e!150720)))

(declare-fun b!232131 () Bool)

(declare-fun e!150728 () Bool)

(declare-fun mapRes!10333 () Bool)

(assert (=> b!232131 (= e!150728 (and e!150718 mapRes!10333))))

(declare-fun condMapEmpty!10333 () Bool)

(declare-fun mapDefault!10333 () ValueCell!2711)

(assert (=> b!232131 (= condMapEmpty!10333 (= (arr!5449 (_values!4303 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2711)) mapDefault!10333)))))

(declare-fun b!232132 () Bool)

(declare-datatypes ((Unit!7136 0))(
  ( (Unit!7137) )
))
(declare-fun e!150721 () Unit!7136)

(declare-fun Unit!7138 () Unit!7136)

(assert (=> b!232132 (= e!150721 Unit!7138)))

(declare-fun lt!117184 () Unit!7136)

(declare-fun lemmaArrayContainsKeyThenInListMap!147 (array!11461 array!11459 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 64) (_ BitVec 32) Int) Unit!7136)

(assert (=> b!232132 (= lt!117184 (lemmaArrayContainsKeyThenInListMap!147 (_keys!6374 thiss!1504) (_values!4303 thiss!1504) (mask!10230 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4320 thiss!1504)))))

(assert (=> b!232132 false))

(declare-fun mapIsEmpty!10333 () Bool)

(assert (=> mapIsEmpty!10333 mapRes!10333))

(declare-fun b!232133 () Bool)

(declare-fun Unit!7139 () Unit!7136)

(assert (=> b!232133 (= e!150721 Unit!7139)))

(declare-fun b!232134 () Bool)

(declare-fun e!150722 () Unit!7136)

(declare-fun lt!117187 () Unit!7136)

(assert (=> b!232134 (= e!150722 lt!117187)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!305 (array!11461 array!11459 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 64) Int) Unit!7136)

(assert (=> b!232134 (= lt!117187 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!305 (_keys!6374 thiss!1504) (_values!4303 thiss!1504) (mask!10230 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) key!932 (defaultEntry!4320 thiss!1504)))))

(declare-fun c!38593 () Bool)

(assert (=> b!232134 (= c!38593 ((_ is MissingZero!928) lt!117180))))

(assert (=> b!232134 e!150717))

(declare-fun b!232135 () Bool)

(declare-fun res!114018 () Bool)

(declare-fun e!150715 () Bool)

(assert (=> b!232135 (=> (not res!114018) (not e!150715))))

(assert (=> b!232135 (= res!114018 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232136 () Bool)

(declare-fun res!114016 () Bool)

(declare-fun e!150725 () Bool)

(assert (=> b!232136 (=> (not res!114016) (not e!150725))))

(assert (=> b!232136 (= res!114016 (= (select (arr!5450 (_keys!6374 thiss!1504)) (index!5882 lt!117180)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232138 () Bool)

(assert (=> b!232138 (= e!150725 (not call!21564))))

(declare-fun e!150724 () Bool)

(declare-fun array_inv!3575 (array!11461) Bool)

(declare-fun array_inv!3576 (array!11459) Bool)

(assert (=> b!232139 (= e!150724 (and tp!21883 tp_is_empty!6109 (array_inv!3575 (_keys!6374 thiss!1504)) (array_inv!3576 (_values!4303 thiss!1504)) e!150728))))

(declare-fun b!232140 () Bool)

(declare-fun Unit!7140 () Unit!7136)

(assert (=> b!232140 (= e!150722 Unit!7140)))

(declare-fun lt!117174 () Unit!7136)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!310 (array!11461 array!11459 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 64) Int) Unit!7136)

(assert (=> b!232140 (= lt!117174 (lemmaInListMapThenSeekEntryOrOpenFindsIt!310 (_keys!6374 thiss!1504) (_values!4303 thiss!1504) (mask!10230 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) key!932 (defaultEntry!4320 thiss!1504)))))

(assert (=> b!232140 false))

(declare-fun b!232141 () Bool)

(assert (=> b!232141 (= e!150720 ((_ is Undefined!928) lt!117180))))

(declare-fun bm!21561 () Bool)

(declare-fun call!21563 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21561 (= call!21563 (inRange!0 (ite c!38593 (index!5882 lt!117180) (index!5885 lt!117180)) (mask!10230 thiss!1504)))))

(declare-fun b!232142 () Bool)

(declare-fun e!150726 () Bool)

(declare-fun e!150727 () Bool)

(assert (=> b!232142 (= e!150726 e!150727)))

(declare-fun res!114019 () Bool)

(assert (=> b!232142 (=> (not res!114019) (not e!150727))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232142 (= res!114019 (inRange!0 index!297 (mask!10230 thiss!1504)))))

(declare-fun lt!117186 () Unit!7136)

(assert (=> b!232142 (= lt!117186 e!150722)))

(declare-fun c!38591 () Bool)

(declare-datatypes ((tuple2!4502 0))(
  ( (tuple2!4503 (_1!2262 (_ BitVec 64)) (_2!2262 V!7793)) )
))
(declare-datatypes ((List!3411 0))(
  ( (Nil!3408) (Cons!3407 (h!4055 tuple2!4502) (t!8362 List!3411)) )
))
(declare-datatypes ((ListLongMap!3417 0))(
  ( (ListLongMap!3418 (toList!1724 List!3411)) )
))
(declare-fun lt!117175 () ListLongMap!3417)

(declare-fun contains!1607 (ListLongMap!3417 (_ BitVec 64)) Bool)

(assert (=> b!232142 (= c!38591 (contains!1607 lt!117175 key!932))))

(declare-fun getCurrentListMap!1256 (array!11461 array!11459 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 32) Int) ListLongMap!3417)

(assert (=> b!232142 (= lt!117175 (getCurrentListMap!1256 (_keys!6374 thiss!1504) (_values!4303 thiss!1504) (mask!10230 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4320 thiss!1504)))))

(declare-fun b!232143 () Bool)

(declare-fun res!114021 () Bool)

(assert (=> b!232143 (=> (not res!114021) (not e!150725))))

(assert (=> b!232143 (= res!114021 call!21563)))

(assert (=> b!232143 (= e!150717 e!150725)))

(declare-fun b!232144 () Bool)

(assert (=> b!232144 (= e!150720 e!150719)))

(declare-fun res!114015 () Bool)

(assert (=> b!232144 (= res!114015 call!21563)))

(assert (=> b!232144 (=> (not res!114015) (not e!150719))))

(declare-fun mapNonEmpty!10333 () Bool)

(declare-fun tp!21882 () Bool)

(assert (=> mapNonEmpty!10333 (= mapRes!10333 (and tp!21882 e!150723))))

(declare-fun mapKey!10333 () (_ BitVec 32))

(declare-fun mapRest!10333 () (Array (_ BitVec 32) ValueCell!2711))

(declare-fun mapValue!10333 () ValueCell!2711)

(assert (=> mapNonEmpty!10333 (= (arr!5449 (_values!4303 thiss!1504)) (store mapRest!10333 mapKey!10333 mapValue!10333))))

(declare-fun b!232145 () Bool)

(assert (=> b!232145 (= e!150727 (not true))))

(declare-fun lt!117182 () array!11461)

(declare-fun arrayCountValidKeys!0 (array!11461 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232145 (= (arrayCountValidKeys!0 lt!117182 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117176 () Unit!7136)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11461 (_ BitVec 32)) Unit!7136)

(assert (=> b!232145 (= lt!117176 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117182 index!297))))

(assert (=> b!232145 (arrayContainsKey!0 lt!117182 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117181 () Unit!7136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11461 (_ BitVec 64) (_ BitVec 32)) Unit!7136)

(assert (=> b!232145 (= lt!117181 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117182 key!932 index!297))))

(declare-fun v!346 () V!7793)

(declare-fun +!619 (ListLongMap!3417 tuple2!4502) ListLongMap!3417)

(assert (=> b!232145 (= (+!619 lt!117175 (tuple2!4503 key!932 v!346)) (getCurrentListMap!1256 lt!117182 (array!11460 (store (arr!5449 (_values!4303 thiss!1504)) index!297 (ValueCellFull!2711 v!346)) (size!5782 (_values!4303 thiss!1504))) (mask!10230 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4320 thiss!1504)))))

(declare-fun lt!117185 () Unit!7136)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!78 (array!11461 array!11459 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 32) (_ BitVec 64) V!7793 Int) Unit!7136)

(assert (=> b!232145 (= lt!117185 (lemmaAddValidKeyToArrayThenAddPairToListMap!78 (_keys!6374 thiss!1504) (_values!4303 thiss!1504) (mask!10230 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) index!297 key!932 v!346 (defaultEntry!4320 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11461 (_ BitVec 32)) Bool)

(assert (=> b!232145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117182 (mask!10230 thiss!1504))))

(declare-fun lt!117178 () Unit!7136)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11461 (_ BitVec 32) (_ BitVec 32)) Unit!7136)

(assert (=> b!232145 (= lt!117178 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6374 thiss!1504) index!297 (mask!10230 thiss!1504)))))

(assert (=> b!232145 (= (arrayCountValidKeys!0 lt!117182 #b00000000000000000000000000000000 (size!5783 (_keys!6374 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6374 thiss!1504) #b00000000000000000000000000000000 (size!5783 (_keys!6374 thiss!1504)))))))

(declare-fun lt!117183 () Unit!7136)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11461 (_ BitVec 32) (_ BitVec 64)) Unit!7136)

(assert (=> b!232145 (= lt!117183 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6374 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3412 0))(
  ( (Nil!3409) (Cons!3408 (h!4056 (_ BitVec 64)) (t!8363 List!3412)) )
))
(declare-fun arrayNoDuplicates!0 (array!11461 (_ BitVec 32) List!3412) Bool)

(assert (=> b!232145 (arrayNoDuplicates!0 lt!117182 #b00000000000000000000000000000000 Nil!3409)))

(assert (=> b!232145 (= lt!117182 (array!11462 (store (arr!5450 (_keys!6374 thiss!1504)) index!297 key!932) (size!5783 (_keys!6374 thiss!1504))))))

(declare-fun lt!117177 () Unit!7136)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11461 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3412) Unit!7136)

(assert (=> b!232145 (= lt!117177 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6374 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3409))))

(declare-fun lt!117179 () Unit!7136)

(assert (=> b!232145 (= lt!117179 e!150721)))

(declare-fun c!38590 () Bool)

(assert (=> b!232145 (= c!38590 (arrayContainsKey!0 (_keys!6374 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232146 () Bool)

(assert (=> b!232146 (= e!150715 e!150726)))

(declare-fun res!114020 () Bool)

(assert (=> b!232146 (=> (not res!114020) (not e!150726))))

(assert (=> b!232146 (= res!114020 (or (= lt!117180 (MissingZero!928 index!297)) (= lt!117180 (MissingVacant!928 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11461 (_ BitVec 32)) SeekEntryResult!928)

(assert (=> b!232146 (= lt!117180 (seekEntryOrOpen!0 key!932 (_keys!6374 thiss!1504) (mask!10230 thiss!1504)))))

(declare-fun res!114017 () Bool)

(assert (=> start!22184 (=> (not res!114017) (not e!150715))))

(declare-fun valid!1331 (LongMapFixedSize!3322) Bool)

(assert (=> start!22184 (= res!114017 (valid!1331 thiss!1504))))

(assert (=> start!22184 e!150715))

(assert (=> start!22184 e!150724))

(assert (=> start!22184 true))

(assert (=> start!22184 tp_is_empty!6109))

(declare-fun b!232137 () Bool)

(assert (=> b!232137 (= e!150719 (not call!21564))))

(assert (= (and start!22184 res!114017) b!232135))

(assert (= (and b!232135 res!114018) b!232146))

(assert (= (and b!232146 res!114020) b!232142))

(assert (= (and b!232142 c!38591) b!232140))

(assert (= (and b!232142 (not c!38591)) b!232134))

(assert (= (and b!232134 c!38593) b!232143))

(assert (= (and b!232134 (not c!38593)) b!232130))

(assert (= (and b!232143 res!114021) b!232136))

(assert (= (and b!232136 res!114016) b!232138))

(assert (= (and b!232130 c!38592) b!232144))

(assert (= (and b!232130 (not c!38592)) b!232141))

(assert (= (and b!232144 res!114015) b!232129))

(assert (= (and b!232129 res!114022) b!232137))

(assert (= (or b!232143 b!232144) bm!21561))

(assert (= (or b!232138 b!232137) bm!21560))

(assert (= (and b!232142 res!114019) b!232145))

(assert (= (and b!232145 c!38590) b!232132))

(assert (= (and b!232145 (not c!38590)) b!232133))

(assert (= (and b!232131 condMapEmpty!10333) mapIsEmpty!10333))

(assert (= (and b!232131 (not condMapEmpty!10333)) mapNonEmpty!10333))

(assert (= (and mapNonEmpty!10333 ((_ is ValueCellFull!2711) mapValue!10333)) b!232128))

(assert (= (and b!232131 ((_ is ValueCellFull!2711) mapDefault!10333)) b!232127))

(assert (= b!232139 b!232131))

(assert (= start!22184 b!232139))

(declare-fun m!253675 () Bool)

(assert (=> b!232145 m!253675))

(declare-fun m!253677 () Bool)

(assert (=> b!232145 m!253677))

(declare-fun m!253679 () Bool)

(assert (=> b!232145 m!253679))

(declare-fun m!253681 () Bool)

(assert (=> b!232145 m!253681))

(declare-fun m!253683 () Bool)

(assert (=> b!232145 m!253683))

(declare-fun m!253685 () Bool)

(assert (=> b!232145 m!253685))

(declare-fun m!253687 () Bool)

(assert (=> b!232145 m!253687))

(declare-fun m!253689 () Bool)

(assert (=> b!232145 m!253689))

(declare-fun m!253691 () Bool)

(assert (=> b!232145 m!253691))

(declare-fun m!253693 () Bool)

(assert (=> b!232145 m!253693))

(declare-fun m!253695 () Bool)

(assert (=> b!232145 m!253695))

(declare-fun m!253697 () Bool)

(assert (=> b!232145 m!253697))

(declare-fun m!253699 () Bool)

(assert (=> b!232145 m!253699))

(declare-fun m!253701 () Bool)

(assert (=> b!232145 m!253701))

(declare-fun m!253703 () Bool)

(assert (=> b!232145 m!253703))

(declare-fun m!253705 () Bool)

(assert (=> b!232145 m!253705))

(declare-fun m!253707 () Bool)

(assert (=> b!232145 m!253707))

(declare-fun m!253709 () Bool)

(assert (=> b!232142 m!253709))

(declare-fun m!253711 () Bool)

(assert (=> b!232142 m!253711))

(declare-fun m!253713 () Bool)

(assert (=> b!232142 m!253713))

(declare-fun m!253715 () Bool)

(assert (=> mapNonEmpty!10333 m!253715))

(declare-fun m!253717 () Bool)

(assert (=> b!232139 m!253717))

(declare-fun m!253719 () Bool)

(assert (=> b!232139 m!253719))

(declare-fun m!253721 () Bool)

(assert (=> b!232140 m!253721))

(declare-fun m!253723 () Bool)

(assert (=> b!232134 m!253723))

(declare-fun m!253725 () Bool)

(assert (=> b!232129 m!253725))

(declare-fun m!253727 () Bool)

(assert (=> b!232132 m!253727))

(declare-fun m!253729 () Bool)

(assert (=> b!232146 m!253729))

(declare-fun m!253731 () Bool)

(assert (=> b!232136 m!253731))

(declare-fun m!253733 () Bool)

(assert (=> bm!21561 m!253733))

(assert (=> bm!21560 m!253699))

(declare-fun m!253735 () Bool)

(assert (=> start!22184 m!253735))

(check-sat (not b!232132) (not start!22184) (not bm!21561) (not b!232145) (not b!232139) (not b_next!6247) (not bm!21560) tp_is_empty!6109 (not b!232146) (not b!232140) (not mapNonEmpty!10333) (not b!232142) b_and!13159 (not b!232134))
(check-sat b_and!13159 (not b_next!6247))
