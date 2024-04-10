; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22534 () Bool)

(assert start!22534)

(declare-fun b!235635 () Bool)

(declare-fun b_free!6339 () Bool)

(declare-fun b_next!6339 () Bool)

(assert (=> b!235635 (= b_free!6339 (not b_next!6339))))

(declare-fun tp!22187 () Bool)

(declare-fun b_and!13269 () Bool)

(assert (=> b!235635 (= tp!22187 b_and!13269)))

(declare-fun b!235631 () Bool)

(declare-fun res!115565 () Bool)

(declare-fun e!153019 () Bool)

(assert (=> b!235631 (=> (not res!115565) (not e!153019))))

(declare-datatypes ((V!7915 0))(
  ( (V!7916 (val!3145 Int)) )
))
(declare-datatypes ((ValueCell!2757 0))(
  ( (ValueCellFull!2757 (v!5173 V!7915)) (EmptyCell!2757) )
))
(declare-datatypes ((array!11661 0))(
  ( (array!11662 (arr!5542 (Array (_ BitVec 32) ValueCell!2757)) (size!5879 (_ BitVec 32))) )
))
(declare-datatypes ((array!11663 0))(
  ( (array!11664 (arr!5543 (Array (_ BitVec 32) (_ BitVec 64))) (size!5880 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3414 0))(
  ( (LongMapFixedSize!3415 (defaultEntry!4378 Int) (mask!10352 (_ BitVec 32)) (extraKeys!4115 (_ BitVec 32)) (zeroValue!4219 V!7915) (minValue!4219 V!7915) (_size!1756 (_ BitVec 32)) (_keys!6454 array!11663) (_values!4361 array!11661) (_vacant!1756 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3414)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4636 0))(
  ( (tuple2!4637 (_1!2329 (_ BitVec 64)) (_2!2329 V!7915)) )
))
(declare-datatypes ((List!3545 0))(
  ( (Nil!3542) (Cons!3541 (h!4193 tuple2!4636) (t!8520 List!3545)) )
))
(declare-datatypes ((ListLongMap!3549 0))(
  ( (ListLongMap!3550 (toList!1790 List!3545)) )
))
(declare-fun contains!1667 (ListLongMap!3549 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1318 (array!11663 array!11661 (_ BitVec 32) (_ BitVec 32) V!7915 V!7915 (_ BitVec 32) Int) ListLongMap!3549)

(assert (=> b!235631 (= res!115565 (contains!1667 (getCurrentListMap!1318 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10499 () Bool)

(declare-fun mapRes!10499 () Bool)

(assert (=> mapIsEmpty!10499 mapRes!10499))

(declare-fun b!235632 () Bool)

(declare-fun res!115571 () Bool)

(assert (=> b!235632 (=> (not res!115571) (not e!153019))))

(assert (=> b!235632 (= res!115571 (and (= (size!5879 (_values!4361 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10352 thiss!1504))) (= (size!5880 (_keys!6454 thiss!1504)) (size!5879 (_values!4361 thiss!1504))) (bvsge (mask!10352 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4115 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4115 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!115572 () Bool)

(declare-fun e!153024 () Bool)

(assert (=> start!22534 (=> (not res!115572) (not e!153024))))

(declare-fun valid!1349 (LongMapFixedSize!3414) Bool)

(assert (=> start!22534 (= res!115572 (valid!1349 thiss!1504))))

(assert (=> start!22534 e!153024))

(declare-fun e!153020 () Bool)

(assert (=> start!22534 e!153020))

(assert (=> start!22534 true))

(declare-fun b!235633 () Bool)

(declare-fun e!153025 () Bool)

(declare-fun tp_is_empty!6201 () Bool)

(assert (=> b!235633 (= e!153025 tp_is_empty!6201)))

(declare-fun b!235634 () Bool)

(declare-fun res!115569 () Bool)

(assert (=> b!235634 (=> (not res!115569) (not e!153019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235634 (= res!115569 (validMask!0 (mask!10352 thiss!1504)))))

(declare-fun e!153022 () Bool)

(declare-fun array_inv!3657 (array!11663) Bool)

(declare-fun array_inv!3658 (array!11661) Bool)

(assert (=> b!235635 (= e!153020 (and tp!22187 tp_is_empty!6201 (array_inv!3657 (_keys!6454 thiss!1504)) (array_inv!3658 (_values!4361 thiss!1504)) e!153022))))

(declare-fun b!235636 () Bool)

(declare-fun e!153023 () Bool)

(assert (=> b!235636 (= e!153023 tp_is_empty!6201)))

(declare-fun b!235637 () Bool)

(declare-fun res!115568 () Bool)

(assert (=> b!235637 (=> (not res!115568) (not e!153019))))

(declare-datatypes ((List!3546 0))(
  ( (Nil!3543) (Cons!3542 (h!4194 (_ BitVec 64)) (t!8521 List!3546)) )
))
(declare-fun arrayNoDuplicates!0 (array!11663 (_ BitVec 32) List!3546) Bool)

(assert (=> b!235637 (= res!115568 (arrayNoDuplicates!0 (_keys!6454 thiss!1504) #b00000000000000000000000000000000 Nil!3543))))

(declare-fun b!235638 () Bool)

(declare-fun res!115567 () Bool)

(assert (=> b!235638 (=> (not res!115567) (not e!153024))))

(assert (=> b!235638 (= res!115567 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235639 () Bool)

(declare-fun res!115570 () Bool)

(assert (=> b!235639 (=> (not res!115570) (not e!153019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11663 (_ BitVec 32)) Bool)

(assert (=> b!235639 (= res!115570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6454 thiss!1504) (mask!10352 thiss!1504)))))

(declare-fun b!235640 () Bool)

(assert (=> b!235640 (= e!153024 e!153019)))

(declare-fun res!115566 () Bool)

(assert (=> b!235640 (=> (not res!115566) (not e!153019))))

(declare-datatypes ((SeekEntryResult!993 0))(
  ( (MissingZero!993 (index!6142 (_ BitVec 32))) (Found!993 (index!6143 (_ BitVec 32))) (Intermediate!993 (undefined!1805 Bool) (index!6144 (_ BitVec 32)) (x!23805 (_ BitVec 32))) (Undefined!993) (MissingVacant!993 (index!6145 (_ BitVec 32))) )
))
(declare-fun lt!119155 () SeekEntryResult!993)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235640 (= res!115566 (or (= lt!119155 (MissingZero!993 index!297)) (= lt!119155 (MissingVacant!993 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11663 (_ BitVec 32)) SeekEntryResult!993)

(assert (=> b!235640 (= lt!119155 (seekEntryOrOpen!0 key!932 (_keys!6454 thiss!1504) (mask!10352 thiss!1504)))))

(declare-fun mapNonEmpty!10499 () Bool)

(declare-fun tp!22186 () Bool)

(assert (=> mapNonEmpty!10499 (= mapRes!10499 (and tp!22186 e!153025))))

(declare-fun mapKey!10499 () (_ BitVec 32))

(declare-fun mapValue!10499 () ValueCell!2757)

(declare-fun mapRest!10499 () (Array (_ BitVec 32) ValueCell!2757))

(assert (=> mapNonEmpty!10499 (= (arr!5542 (_values!4361 thiss!1504)) (store mapRest!10499 mapKey!10499 mapValue!10499))))

(declare-fun b!235641 () Bool)

(assert (=> b!235641 (= e!153022 (and e!153023 mapRes!10499))))

(declare-fun condMapEmpty!10499 () Bool)

(declare-fun mapDefault!10499 () ValueCell!2757)

(assert (=> b!235641 (= condMapEmpty!10499 (= (arr!5542 (_values!4361 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2757)) mapDefault!10499)))))

(declare-fun b!235642 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!235642 (= e!153019 (not (validKeyInArray!0 key!932)))))

(assert (= (and start!22534 res!115572) b!235638))

(assert (= (and b!235638 res!115567) b!235640))

(assert (= (and b!235640 res!115566) b!235631))

(assert (= (and b!235631 res!115565) b!235634))

(assert (= (and b!235634 res!115569) b!235632))

(assert (= (and b!235632 res!115571) b!235639))

(assert (= (and b!235639 res!115570) b!235637))

(assert (= (and b!235637 res!115568) b!235642))

(assert (= (and b!235641 condMapEmpty!10499) mapIsEmpty!10499))

(assert (= (and b!235641 (not condMapEmpty!10499)) mapNonEmpty!10499))

(get-info :version)

(assert (= (and mapNonEmpty!10499 ((_ is ValueCellFull!2757) mapValue!10499)) b!235633))

(assert (= (and b!235641 ((_ is ValueCellFull!2757) mapDefault!10499)) b!235636))

(assert (= b!235635 b!235641))

(assert (= start!22534 b!235635))

(declare-fun m!256675 () Bool)

(assert (=> mapNonEmpty!10499 m!256675))

(declare-fun m!256677 () Bool)

(assert (=> b!235637 m!256677))

(declare-fun m!256679 () Bool)

(assert (=> start!22534 m!256679))

(declare-fun m!256681 () Bool)

(assert (=> b!235642 m!256681))

(declare-fun m!256683 () Bool)

(assert (=> b!235639 m!256683))

(declare-fun m!256685 () Bool)

(assert (=> b!235631 m!256685))

(assert (=> b!235631 m!256685))

(declare-fun m!256687 () Bool)

(assert (=> b!235631 m!256687))

(declare-fun m!256689 () Bool)

(assert (=> b!235635 m!256689))

(declare-fun m!256691 () Bool)

(assert (=> b!235635 m!256691))

(declare-fun m!256693 () Bool)

(assert (=> b!235640 m!256693))

(declare-fun m!256695 () Bool)

(assert (=> b!235634 m!256695))

(check-sat (not b_next!6339) (not b!235635) (not b!235639) (not b!235642) b_and!13269 (not b!235637) (not mapNonEmpty!10499) (not start!22534) (not b!235640) tp_is_empty!6201 (not b!235634) (not b!235631))
(check-sat b_and!13269 (not b_next!6339))
(get-model)

(declare-fun d!59295 () Bool)

(assert (=> d!59295 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235642 d!59295))

(declare-fun d!59297 () Bool)

(assert (=> d!59297 (= (validMask!0 (mask!10352 thiss!1504)) (and (or (= (mask!10352 thiss!1504) #b00000000000000000000000000000111) (= (mask!10352 thiss!1504) #b00000000000000000000000000001111) (= (mask!10352 thiss!1504) #b00000000000000000000000000011111) (= (mask!10352 thiss!1504) #b00000000000000000000000000111111) (= (mask!10352 thiss!1504) #b00000000000000000000000001111111) (= (mask!10352 thiss!1504) #b00000000000000000000000011111111) (= (mask!10352 thiss!1504) #b00000000000000000000000111111111) (= (mask!10352 thiss!1504) #b00000000000000000000001111111111) (= (mask!10352 thiss!1504) #b00000000000000000000011111111111) (= (mask!10352 thiss!1504) #b00000000000000000000111111111111) (= (mask!10352 thiss!1504) #b00000000000000000001111111111111) (= (mask!10352 thiss!1504) #b00000000000000000011111111111111) (= (mask!10352 thiss!1504) #b00000000000000000111111111111111) (= (mask!10352 thiss!1504) #b00000000000000001111111111111111) (= (mask!10352 thiss!1504) #b00000000000000011111111111111111) (= (mask!10352 thiss!1504) #b00000000000000111111111111111111) (= (mask!10352 thiss!1504) #b00000000000001111111111111111111) (= (mask!10352 thiss!1504) #b00000000000011111111111111111111) (= (mask!10352 thiss!1504) #b00000000000111111111111111111111) (= (mask!10352 thiss!1504) #b00000000001111111111111111111111) (= (mask!10352 thiss!1504) #b00000000011111111111111111111111) (= (mask!10352 thiss!1504) #b00000000111111111111111111111111) (= (mask!10352 thiss!1504) #b00000001111111111111111111111111) (= (mask!10352 thiss!1504) #b00000011111111111111111111111111) (= (mask!10352 thiss!1504) #b00000111111111111111111111111111) (= (mask!10352 thiss!1504) #b00001111111111111111111111111111) (= (mask!10352 thiss!1504) #b00011111111111111111111111111111) (= (mask!10352 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10352 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235634 d!59297))

(declare-fun b!235687 () Bool)

(declare-fun e!153053 () Bool)

(declare-fun call!21906 () Bool)

(assert (=> b!235687 (= e!153053 call!21906)))

(declare-fun b!235688 () Bool)

(declare-fun e!153054 () Bool)

(assert (=> b!235688 (= e!153054 call!21906)))

(declare-fun d!59299 () Bool)

(declare-fun res!115601 () Bool)

(declare-fun e!153055 () Bool)

(assert (=> d!59299 (=> res!115601 e!153055)))

(assert (=> d!59299 (= res!115601 (bvsge #b00000000000000000000000000000000 (size!5880 (_keys!6454 thiss!1504))))))

(assert (=> d!59299 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6454 thiss!1504) (mask!10352 thiss!1504)) e!153055)))

(declare-fun b!235689 () Bool)

(assert (=> b!235689 (= e!153053 e!153054)))

(declare-fun lt!119165 () (_ BitVec 64))

(assert (=> b!235689 (= lt!119165 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!7258 0))(
  ( (Unit!7259) )
))
(declare-fun lt!119167 () Unit!7258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11663 (_ BitVec 64) (_ BitVec 32)) Unit!7258)

(assert (=> b!235689 (= lt!119167 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6454 thiss!1504) lt!119165 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!235689 (arrayContainsKey!0 (_keys!6454 thiss!1504) lt!119165 #b00000000000000000000000000000000)))

(declare-fun lt!119166 () Unit!7258)

(assert (=> b!235689 (= lt!119166 lt!119167)))

(declare-fun res!115602 () Bool)

(assert (=> b!235689 (= res!115602 (= (seekEntryOrOpen!0 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000) (_keys!6454 thiss!1504) (mask!10352 thiss!1504)) (Found!993 #b00000000000000000000000000000000)))))

(assert (=> b!235689 (=> (not res!115602) (not e!153054))))

(declare-fun b!235690 () Bool)

(assert (=> b!235690 (= e!153055 e!153053)))

(declare-fun c!39247 () Bool)

(assert (=> b!235690 (= c!39247 (validKeyInArray!0 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21903 () Bool)

(assert (=> bm!21903 (= call!21906 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6454 thiss!1504) (mask!10352 thiss!1504)))))

(assert (= (and d!59299 (not res!115601)) b!235690))

(assert (= (and b!235690 c!39247) b!235689))

(assert (= (and b!235690 (not c!39247)) b!235687))

(assert (= (and b!235689 res!115602) b!235688))

(assert (= (or b!235688 b!235687) bm!21903))

(declare-fun m!256719 () Bool)

(assert (=> b!235689 m!256719))

(declare-fun m!256721 () Bool)

(assert (=> b!235689 m!256721))

(declare-fun m!256723 () Bool)

(assert (=> b!235689 m!256723))

(assert (=> b!235689 m!256719))

(declare-fun m!256725 () Bool)

(assert (=> b!235689 m!256725))

(assert (=> b!235690 m!256719))

(assert (=> b!235690 m!256719))

(declare-fun m!256727 () Bool)

(assert (=> b!235690 m!256727))

(declare-fun m!256729 () Bool)

(assert (=> bm!21903 m!256729))

(assert (=> b!235639 d!59299))

(declare-fun d!59301 () Bool)

(declare-fun res!115609 () Bool)

(declare-fun e!153058 () Bool)

(assert (=> d!59301 (=> (not res!115609) (not e!153058))))

(declare-fun simpleValid!234 (LongMapFixedSize!3414) Bool)

(assert (=> d!59301 (= res!115609 (simpleValid!234 thiss!1504))))

(assert (=> d!59301 (= (valid!1349 thiss!1504) e!153058)))

(declare-fun b!235697 () Bool)

(declare-fun res!115610 () Bool)

(assert (=> b!235697 (=> (not res!115610) (not e!153058))))

(declare-fun arrayCountValidKeys!0 (array!11663 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!235697 (= res!115610 (= (arrayCountValidKeys!0 (_keys!6454 thiss!1504) #b00000000000000000000000000000000 (size!5880 (_keys!6454 thiss!1504))) (_size!1756 thiss!1504)))))

(declare-fun b!235698 () Bool)

(declare-fun res!115611 () Bool)

(assert (=> b!235698 (=> (not res!115611) (not e!153058))))

(assert (=> b!235698 (= res!115611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6454 thiss!1504) (mask!10352 thiss!1504)))))

(declare-fun b!235699 () Bool)

(assert (=> b!235699 (= e!153058 (arrayNoDuplicates!0 (_keys!6454 thiss!1504) #b00000000000000000000000000000000 Nil!3543))))

(assert (= (and d!59301 res!115609) b!235697))

(assert (= (and b!235697 res!115610) b!235698))

(assert (= (and b!235698 res!115611) b!235699))

(declare-fun m!256731 () Bool)

(assert (=> d!59301 m!256731))

(declare-fun m!256733 () Bool)

(assert (=> b!235697 m!256733))

(assert (=> b!235698 m!256683))

(assert (=> b!235699 m!256677))

(assert (=> start!22534 d!59301))

(declare-fun d!59303 () Bool)

(declare-fun e!153063 () Bool)

(assert (=> d!59303 e!153063))

(declare-fun res!115614 () Bool)

(assert (=> d!59303 (=> res!115614 e!153063)))

(declare-fun lt!119179 () Bool)

(assert (=> d!59303 (= res!115614 (not lt!119179))))

(declare-fun lt!119176 () Bool)

(assert (=> d!59303 (= lt!119179 lt!119176)))

(declare-fun lt!119177 () Unit!7258)

(declare-fun e!153064 () Unit!7258)

(assert (=> d!59303 (= lt!119177 e!153064)))

(declare-fun c!39250 () Bool)

(assert (=> d!59303 (= c!39250 lt!119176)))

(declare-fun containsKey!261 (List!3545 (_ BitVec 64)) Bool)

(assert (=> d!59303 (= lt!119176 (containsKey!261 (toList!1790 (getCurrentListMap!1318 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504))) key!932))))

(assert (=> d!59303 (= (contains!1667 (getCurrentListMap!1318 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504)) key!932) lt!119179)))

(declare-fun b!235706 () Bool)

(declare-fun lt!119178 () Unit!7258)

(assert (=> b!235706 (= e!153064 lt!119178)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!209 (List!3545 (_ BitVec 64)) Unit!7258)

(assert (=> b!235706 (= lt!119178 (lemmaContainsKeyImpliesGetValueByKeyDefined!209 (toList!1790 (getCurrentListMap!1318 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504))) key!932))))

(declare-datatypes ((Option!275 0))(
  ( (Some!274 (v!5175 V!7915)) (None!273) )
))
(declare-fun isDefined!210 (Option!275) Bool)

(declare-fun getValueByKey!269 (List!3545 (_ BitVec 64)) Option!275)

(assert (=> b!235706 (isDefined!210 (getValueByKey!269 (toList!1790 (getCurrentListMap!1318 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504))) key!932))))

(declare-fun b!235707 () Bool)

(declare-fun Unit!7260 () Unit!7258)

(assert (=> b!235707 (= e!153064 Unit!7260)))

(declare-fun b!235708 () Bool)

(assert (=> b!235708 (= e!153063 (isDefined!210 (getValueByKey!269 (toList!1790 (getCurrentListMap!1318 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504))) key!932)))))

(assert (= (and d!59303 c!39250) b!235706))

(assert (= (and d!59303 (not c!39250)) b!235707))

(assert (= (and d!59303 (not res!115614)) b!235708))

(declare-fun m!256735 () Bool)

(assert (=> d!59303 m!256735))

(declare-fun m!256737 () Bool)

(assert (=> b!235706 m!256737))

(declare-fun m!256739 () Bool)

(assert (=> b!235706 m!256739))

(assert (=> b!235706 m!256739))

(declare-fun m!256741 () Bool)

(assert (=> b!235706 m!256741))

(assert (=> b!235708 m!256739))

(assert (=> b!235708 m!256739))

(assert (=> b!235708 m!256741))

(assert (=> b!235631 d!59303))

(declare-fun b!235751 () Bool)

(declare-fun e!153101 () ListLongMap!3549)

(declare-fun e!153097 () ListLongMap!3549)

(assert (=> b!235751 (= e!153101 e!153097)))

(declare-fun c!39268 () Bool)

(assert (=> b!235751 (= c!39268 (and (not (= (bvand (extraKeys!4115 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4115 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21918 () Bool)

(declare-fun call!21925 () ListLongMap!3549)

(declare-fun call!21923 () ListLongMap!3549)

(assert (=> bm!21918 (= call!21925 call!21923)))

(declare-fun b!235752 () Bool)

(declare-fun res!115638 () Bool)

(declare-fun e!153092 () Bool)

(assert (=> b!235752 (=> (not res!115638) (not e!153092))))

(declare-fun e!153095 () Bool)

(assert (=> b!235752 (= res!115638 e!153095)))

(declare-fun res!115633 () Bool)

(assert (=> b!235752 (=> res!115633 e!153095)))

(declare-fun e!153103 () Bool)

(assert (=> b!235752 (= res!115633 (not e!153103))))

(declare-fun res!115641 () Bool)

(assert (=> b!235752 (=> (not res!115641) (not e!153103))))

(assert (=> b!235752 (= res!115641 (bvslt #b00000000000000000000000000000000 (size!5880 (_keys!6454 thiss!1504))))))

(declare-fun bm!21919 () Bool)

(declare-fun call!21924 () ListLongMap!3549)

(declare-fun call!21926 () ListLongMap!3549)

(assert (=> bm!21919 (= call!21924 call!21926)))

(declare-fun b!235753 () Bool)

(declare-fun c!39265 () Bool)

(assert (=> b!235753 (= c!39265 (and (not (= (bvand (extraKeys!4115 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4115 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!153091 () ListLongMap!3549)

(assert (=> b!235753 (= e!153097 e!153091)))

(declare-fun b!235754 () Bool)

(assert (=> b!235754 (= e!153091 call!21924)))

(declare-fun d!59305 () Bool)

(assert (=> d!59305 e!153092))

(declare-fun res!115640 () Bool)

(assert (=> d!59305 (=> (not res!115640) (not e!153092))))

(assert (=> d!59305 (= res!115640 (or (bvsge #b00000000000000000000000000000000 (size!5880 (_keys!6454 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5880 (_keys!6454 thiss!1504))))))))

(declare-fun lt!119241 () ListLongMap!3549)

(declare-fun lt!119236 () ListLongMap!3549)

(assert (=> d!59305 (= lt!119241 lt!119236)))

(declare-fun lt!119229 () Unit!7258)

(declare-fun e!153102 () Unit!7258)

(assert (=> d!59305 (= lt!119229 e!153102)))

(declare-fun c!39264 () Bool)

(declare-fun e!153093 () Bool)

(assert (=> d!59305 (= c!39264 e!153093)))

(declare-fun res!115637 () Bool)

(assert (=> d!59305 (=> (not res!115637) (not e!153093))))

(assert (=> d!59305 (= res!115637 (bvslt #b00000000000000000000000000000000 (size!5880 (_keys!6454 thiss!1504))))))

(assert (=> d!59305 (= lt!119236 e!153101)))

(declare-fun c!39266 () Bool)

(assert (=> d!59305 (= c!39266 (and (not (= (bvand (extraKeys!4115 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4115 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59305 (validMask!0 (mask!10352 thiss!1504))))

(assert (=> d!59305 (= (getCurrentListMap!1318 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504)) lt!119241)))

(declare-fun b!235755 () Bool)

(declare-fun e!153099 () Bool)

(declare-fun apply!211 (ListLongMap!3549 (_ BitVec 64)) V!7915)

(assert (=> b!235755 (= e!153099 (= (apply!211 lt!119241 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4219 thiss!1504)))))

(declare-fun b!235756 () Bool)

(declare-fun lt!119234 () Unit!7258)

(assert (=> b!235756 (= e!153102 lt!119234)))

(declare-fun lt!119226 () ListLongMap!3549)

(declare-fun getCurrentListMapNoExtraKeys!533 (array!11663 array!11661 (_ BitVec 32) (_ BitVec 32) V!7915 V!7915 (_ BitVec 32) Int) ListLongMap!3549)

(assert (=> b!235756 (= lt!119226 (getCurrentListMapNoExtraKeys!533 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504)))))

(declare-fun lt!119224 () (_ BitVec 64))

(assert (=> b!235756 (= lt!119224 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119227 () (_ BitVec 64))

(assert (=> b!235756 (= lt!119227 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119243 () Unit!7258)

(declare-fun addStillContains!187 (ListLongMap!3549 (_ BitVec 64) V!7915 (_ BitVec 64)) Unit!7258)

(assert (=> b!235756 (= lt!119243 (addStillContains!187 lt!119226 lt!119224 (zeroValue!4219 thiss!1504) lt!119227))))

(declare-fun +!638 (ListLongMap!3549 tuple2!4636) ListLongMap!3549)

(assert (=> b!235756 (contains!1667 (+!638 lt!119226 (tuple2!4637 lt!119224 (zeroValue!4219 thiss!1504))) lt!119227)))

(declare-fun lt!119230 () Unit!7258)

(assert (=> b!235756 (= lt!119230 lt!119243)))

(declare-fun lt!119239 () ListLongMap!3549)

(assert (=> b!235756 (= lt!119239 (getCurrentListMapNoExtraKeys!533 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504)))))

(declare-fun lt!119240 () (_ BitVec 64))

(assert (=> b!235756 (= lt!119240 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119242 () (_ BitVec 64))

(assert (=> b!235756 (= lt!119242 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119244 () Unit!7258)

(declare-fun addApplyDifferent!187 (ListLongMap!3549 (_ BitVec 64) V!7915 (_ BitVec 64)) Unit!7258)

(assert (=> b!235756 (= lt!119244 (addApplyDifferent!187 lt!119239 lt!119240 (minValue!4219 thiss!1504) lt!119242))))

(assert (=> b!235756 (= (apply!211 (+!638 lt!119239 (tuple2!4637 lt!119240 (minValue!4219 thiss!1504))) lt!119242) (apply!211 lt!119239 lt!119242))))

(declare-fun lt!119228 () Unit!7258)

(assert (=> b!235756 (= lt!119228 lt!119244)))

(declare-fun lt!119245 () ListLongMap!3549)

(assert (=> b!235756 (= lt!119245 (getCurrentListMapNoExtraKeys!533 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504)))))

(declare-fun lt!119231 () (_ BitVec 64))

(assert (=> b!235756 (= lt!119231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119225 () (_ BitVec 64))

(assert (=> b!235756 (= lt!119225 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119235 () Unit!7258)

(assert (=> b!235756 (= lt!119235 (addApplyDifferent!187 lt!119245 lt!119231 (zeroValue!4219 thiss!1504) lt!119225))))

(assert (=> b!235756 (= (apply!211 (+!638 lt!119245 (tuple2!4637 lt!119231 (zeroValue!4219 thiss!1504))) lt!119225) (apply!211 lt!119245 lt!119225))))

(declare-fun lt!119238 () Unit!7258)

(assert (=> b!235756 (= lt!119238 lt!119235)))

(declare-fun lt!119232 () ListLongMap!3549)

(assert (=> b!235756 (= lt!119232 (getCurrentListMapNoExtraKeys!533 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504)))))

(declare-fun lt!119233 () (_ BitVec 64))

(assert (=> b!235756 (= lt!119233 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119237 () (_ BitVec 64))

(assert (=> b!235756 (= lt!119237 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235756 (= lt!119234 (addApplyDifferent!187 lt!119232 lt!119233 (minValue!4219 thiss!1504) lt!119237))))

(assert (=> b!235756 (= (apply!211 (+!638 lt!119232 (tuple2!4637 lt!119233 (minValue!4219 thiss!1504))) lt!119237) (apply!211 lt!119232 lt!119237))))

(declare-fun b!235757 () Bool)

(declare-fun call!21927 () ListLongMap!3549)

(assert (=> b!235757 (= e!153091 call!21927)))

(declare-fun b!235758 () Bool)

(declare-fun e!153094 () Bool)

(declare-fun call!21922 () Bool)

(assert (=> b!235758 (= e!153094 (not call!21922))))

(declare-fun bm!21920 () Bool)

(assert (=> bm!21920 (= call!21922 (contains!1667 lt!119241 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235759 () Bool)

(assert (=> b!235759 (= e!153097 call!21924)))

(declare-fun b!235760 () Bool)

(declare-fun e!153098 () Bool)

(declare-fun call!21921 () Bool)

(assert (=> b!235760 (= e!153098 (not call!21921))))

(declare-fun b!235761 () Bool)

(declare-fun e!153096 () Bool)

(declare-fun get!2848 (ValueCell!2757 V!7915) V!7915)

(declare-fun dynLambda!554 (Int (_ BitVec 64)) V!7915)

(assert (=> b!235761 (= e!153096 (= (apply!211 lt!119241 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000)) (get!2848 (select (arr!5542 (_values!4361 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!554 (defaultEntry!4378 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5879 (_values!4361 thiss!1504))))))

(assert (=> b!235761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5880 (_keys!6454 thiss!1504))))))

(declare-fun b!235762 () Bool)

(assert (=> b!235762 (= e!153093 (validKeyInArray!0 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235763 () Bool)

(assert (=> b!235763 (= e!153092 e!153094)))

(declare-fun c!39263 () Bool)

(assert (=> b!235763 (= c!39263 (not (= (bvand (extraKeys!4115 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235764 () Bool)

(declare-fun res!115635 () Bool)

(assert (=> b!235764 (=> (not res!115635) (not e!153092))))

(assert (=> b!235764 (= res!115635 e!153098)))

(declare-fun c!39267 () Bool)

(assert (=> b!235764 (= c!39267 (not (= (bvand (extraKeys!4115 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!21921 () Bool)

(assert (=> bm!21921 (= call!21921 (contains!1667 lt!119241 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21922 () Bool)

(assert (=> bm!21922 (= call!21926 (+!638 (ite c!39266 call!21923 (ite c!39268 call!21925 call!21927)) (ite (or c!39266 c!39268) (tuple2!4637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4219 thiss!1504)) (tuple2!4637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4219 thiss!1504)))))))

(declare-fun b!235765 () Bool)

(assert (=> b!235765 (= e!153103 (validKeyInArray!0 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235766 () Bool)

(assert (=> b!235766 (= e!153101 (+!638 call!21926 (tuple2!4637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4219 thiss!1504))))))

(declare-fun b!235767 () Bool)

(declare-fun Unit!7261 () Unit!7258)

(assert (=> b!235767 (= e!153102 Unit!7261)))

(declare-fun bm!21923 () Bool)

(assert (=> bm!21923 (= call!21927 call!21925)))

(declare-fun b!235768 () Bool)

(declare-fun e!153100 () Bool)

(assert (=> b!235768 (= e!153098 e!153100)))

(declare-fun res!115634 () Bool)

(assert (=> b!235768 (= res!115634 call!21921)))

(assert (=> b!235768 (=> (not res!115634) (not e!153100))))

(declare-fun bm!21924 () Bool)

(assert (=> bm!21924 (= call!21923 (getCurrentListMapNoExtraKeys!533 (_keys!6454 thiss!1504) (_values!4361 thiss!1504) (mask!10352 thiss!1504) (extraKeys!4115 thiss!1504) (zeroValue!4219 thiss!1504) (minValue!4219 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4378 thiss!1504)))))

(declare-fun b!235769 () Bool)

(assert (=> b!235769 (= e!153100 (= (apply!211 lt!119241 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4219 thiss!1504)))))

(declare-fun b!235770 () Bool)

(assert (=> b!235770 (= e!153095 e!153096)))

(declare-fun res!115636 () Bool)

(assert (=> b!235770 (=> (not res!115636) (not e!153096))))

(assert (=> b!235770 (= res!115636 (contains!1667 lt!119241 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!235770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5880 (_keys!6454 thiss!1504))))))

(declare-fun b!235771 () Bool)

(assert (=> b!235771 (= e!153094 e!153099)))

(declare-fun res!115639 () Bool)

(assert (=> b!235771 (= res!115639 call!21922)))

(assert (=> b!235771 (=> (not res!115639) (not e!153099))))

(assert (= (and d!59305 c!39266) b!235766))

(assert (= (and d!59305 (not c!39266)) b!235751))

(assert (= (and b!235751 c!39268) b!235759))

(assert (= (and b!235751 (not c!39268)) b!235753))

(assert (= (and b!235753 c!39265) b!235754))

(assert (= (and b!235753 (not c!39265)) b!235757))

(assert (= (or b!235754 b!235757) bm!21923))

(assert (= (or b!235759 bm!21923) bm!21918))

(assert (= (or b!235759 b!235754) bm!21919))

(assert (= (or b!235766 bm!21918) bm!21924))

(assert (= (or b!235766 bm!21919) bm!21922))

(assert (= (and d!59305 res!115637) b!235762))

(assert (= (and d!59305 c!39264) b!235756))

(assert (= (and d!59305 (not c!39264)) b!235767))

(assert (= (and d!59305 res!115640) b!235752))

(assert (= (and b!235752 res!115641) b!235765))

(assert (= (and b!235752 (not res!115633)) b!235770))

(assert (= (and b!235770 res!115636) b!235761))

(assert (= (and b!235752 res!115638) b!235764))

(assert (= (and b!235764 c!39267) b!235768))

(assert (= (and b!235764 (not c!39267)) b!235760))

(assert (= (and b!235768 res!115634) b!235769))

(assert (= (or b!235768 b!235760) bm!21921))

(assert (= (and b!235764 res!115635) b!235763))

(assert (= (and b!235763 c!39263) b!235771))

(assert (= (and b!235763 (not c!39263)) b!235758))

(assert (= (and b!235771 res!115639) b!235755))

(assert (= (or b!235771 b!235758) bm!21920))

(declare-fun b_lambda!7907 () Bool)

(assert (=> (not b_lambda!7907) (not b!235761)))

(declare-fun t!8523 () Bool)

(declare-fun tb!2935 () Bool)

(assert (=> (and b!235635 (= (defaultEntry!4378 thiss!1504) (defaultEntry!4378 thiss!1504)) t!8523) tb!2935))

(declare-fun result!5127 () Bool)

(assert (=> tb!2935 (= result!5127 tp_is_empty!6201)))

(assert (=> b!235761 t!8523))

(declare-fun b_and!13273 () Bool)

(assert (= b_and!13269 (and (=> t!8523 result!5127) b_and!13273)))

(assert (=> b!235765 m!256719))

(assert (=> b!235765 m!256719))

(assert (=> b!235765 m!256727))

(declare-fun m!256743 () Bool)

(assert (=> b!235769 m!256743))

(declare-fun m!256745 () Bool)

(assert (=> b!235756 m!256745))

(declare-fun m!256747 () Bool)

(assert (=> b!235756 m!256747))

(declare-fun m!256749 () Bool)

(assert (=> b!235756 m!256749))

(assert (=> b!235756 m!256745))

(declare-fun m!256751 () Bool)

(assert (=> b!235756 m!256751))

(declare-fun m!256753 () Bool)

(assert (=> b!235756 m!256753))

(declare-fun m!256755 () Bool)

(assert (=> b!235756 m!256755))

(declare-fun m!256757 () Bool)

(assert (=> b!235756 m!256757))

(declare-fun m!256759 () Bool)

(assert (=> b!235756 m!256759))

(assert (=> b!235756 m!256751))

(declare-fun m!256761 () Bool)

(assert (=> b!235756 m!256761))

(assert (=> b!235756 m!256719))

(declare-fun m!256763 () Bool)

(assert (=> b!235756 m!256763))

(assert (=> b!235756 m!256753))

(declare-fun m!256765 () Bool)

(assert (=> b!235756 m!256765))

(assert (=> b!235756 m!256763))

(declare-fun m!256767 () Bool)

(assert (=> b!235756 m!256767))

(declare-fun m!256769 () Bool)

(assert (=> b!235756 m!256769))

(declare-fun m!256771 () Bool)

(assert (=> b!235756 m!256771))

(declare-fun m!256773 () Bool)

(assert (=> b!235756 m!256773))

(declare-fun m!256775 () Bool)

(assert (=> b!235756 m!256775))

(declare-fun m!256777 () Bool)

(assert (=> b!235766 m!256777))

(declare-fun m!256779 () Bool)

(assert (=> bm!21921 m!256779))

(assert (=> b!235762 m!256719))

(assert (=> b!235762 m!256719))

(assert (=> b!235762 m!256727))

(assert (=> bm!21924 m!256757))

(declare-fun m!256781 () Bool)

(assert (=> b!235755 m!256781))

(assert (=> b!235770 m!256719))

(assert (=> b!235770 m!256719))

(declare-fun m!256783 () Bool)

(assert (=> b!235770 m!256783))

(declare-fun m!256785 () Bool)

(assert (=> bm!21920 m!256785))

(assert (=> d!59305 m!256695))

(declare-fun m!256787 () Bool)

(assert (=> bm!21922 m!256787))

(assert (=> b!235761 m!256719))

(declare-fun m!256789 () Bool)

(assert (=> b!235761 m!256789))

(declare-fun m!256791 () Bool)

(assert (=> b!235761 m!256791))

(declare-fun m!256793 () Bool)

(assert (=> b!235761 m!256793))

(assert (=> b!235761 m!256791))

(assert (=> b!235761 m!256793))

(declare-fun m!256795 () Bool)

(assert (=> b!235761 m!256795))

(assert (=> b!235761 m!256719))

(assert (=> b!235631 d!59305))

(declare-fun e!153110 () SeekEntryResult!993)

(declare-fun b!235786 () Bool)

(declare-fun lt!119253 () SeekEntryResult!993)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11663 (_ BitVec 32)) SeekEntryResult!993)

(assert (=> b!235786 (= e!153110 (seekKeyOrZeroReturnVacant!0 (x!23805 lt!119253) (index!6144 lt!119253) (index!6144 lt!119253) key!932 (_keys!6454 thiss!1504) (mask!10352 thiss!1504)))))

(declare-fun b!235787 () Bool)

(declare-fun c!39275 () Bool)

(declare-fun lt!119254 () (_ BitVec 64))

(assert (=> b!235787 (= c!39275 (= lt!119254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153112 () SeekEntryResult!993)

(assert (=> b!235787 (= e!153112 e!153110)))

(declare-fun b!235788 () Bool)

(declare-fun e!153111 () SeekEntryResult!993)

(assert (=> b!235788 (= e!153111 e!153112)))

(assert (=> b!235788 (= lt!119254 (select (arr!5543 (_keys!6454 thiss!1504)) (index!6144 lt!119253)))))

(declare-fun c!39277 () Bool)

(assert (=> b!235788 (= c!39277 (= lt!119254 key!932))))

(declare-fun b!235789 () Bool)

(assert (=> b!235789 (= e!153112 (Found!993 (index!6144 lt!119253)))))

(declare-fun b!235790 () Bool)

(assert (=> b!235790 (= e!153111 Undefined!993)))

(declare-fun b!235791 () Bool)

(assert (=> b!235791 (= e!153110 (MissingZero!993 (index!6144 lt!119253)))))

(declare-fun d!59307 () Bool)

(declare-fun lt!119252 () SeekEntryResult!993)

(assert (=> d!59307 (and (or ((_ is Undefined!993) lt!119252) (not ((_ is Found!993) lt!119252)) (and (bvsge (index!6143 lt!119252) #b00000000000000000000000000000000) (bvslt (index!6143 lt!119252) (size!5880 (_keys!6454 thiss!1504))))) (or ((_ is Undefined!993) lt!119252) ((_ is Found!993) lt!119252) (not ((_ is MissingZero!993) lt!119252)) (and (bvsge (index!6142 lt!119252) #b00000000000000000000000000000000) (bvslt (index!6142 lt!119252) (size!5880 (_keys!6454 thiss!1504))))) (or ((_ is Undefined!993) lt!119252) ((_ is Found!993) lt!119252) ((_ is MissingZero!993) lt!119252) (not ((_ is MissingVacant!993) lt!119252)) (and (bvsge (index!6145 lt!119252) #b00000000000000000000000000000000) (bvslt (index!6145 lt!119252) (size!5880 (_keys!6454 thiss!1504))))) (or ((_ is Undefined!993) lt!119252) (ite ((_ is Found!993) lt!119252) (= (select (arr!5543 (_keys!6454 thiss!1504)) (index!6143 lt!119252)) key!932) (ite ((_ is MissingZero!993) lt!119252) (= (select (arr!5543 (_keys!6454 thiss!1504)) (index!6142 lt!119252)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!993) lt!119252) (= (select (arr!5543 (_keys!6454 thiss!1504)) (index!6145 lt!119252)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59307 (= lt!119252 e!153111)))

(declare-fun c!39276 () Bool)

(assert (=> d!59307 (= c!39276 (and ((_ is Intermediate!993) lt!119253) (undefined!1805 lt!119253)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11663 (_ BitVec 32)) SeekEntryResult!993)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59307 (= lt!119253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10352 thiss!1504)) key!932 (_keys!6454 thiss!1504) (mask!10352 thiss!1504)))))

(assert (=> d!59307 (validMask!0 (mask!10352 thiss!1504))))

(assert (=> d!59307 (= (seekEntryOrOpen!0 key!932 (_keys!6454 thiss!1504) (mask!10352 thiss!1504)) lt!119252)))

(assert (= (and d!59307 c!39276) b!235790))

(assert (= (and d!59307 (not c!39276)) b!235788))

(assert (= (and b!235788 c!39277) b!235789))

(assert (= (and b!235788 (not c!39277)) b!235787))

(assert (= (and b!235787 c!39275) b!235791))

(assert (= (and b!235787 (not c!39275)) b!235786))

(declare-fun m!256797 () Bool)

(assert (=> b!235786 m!256797))

(declare-fun m!256799 () Bool)

(assert (=> b!235788 m!256799))

(declare-fun m!256801 () Bool)

(assert (=> d!59307 m!256801))

(declare-fun m!256803 () Bool)

(assert (=> d!59307 m!256803))

(assert (=> d!59307 m!256801))

(declare-fun m!256805 () Bool)

(assert (=> d!59307 m!256805))

(declare-fun m!256807 () Bool)

(assert (=> d!59307 m!256807))

(assert (=> d!59307 m!256695))

(declare-fun m!256809 () Bool)

(assert (=> d!59307 m!256809))

(assert (=> b!235640 d!59307))

(declare-fun d!59309 () Bool)

(assert (=> d!59309 (= (array_inv!3657 (_keys!6454 thiss!1504)) (bvsge (size!5880 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235635 d!59309))

(declare-fun d!59311 () Bool)

(assert (=> d!59311 (= (array_inv!3658 (_values!4361 thiss!1504)) (bvsge (size!5879 (_values!4361 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235635 d!59311))

(declare-fun b!235802 () Bool)

(declare-fun e!153124 () Bool)

(declare-fun e!153122 () Bool)

(assert (=> b!235802 (= e!153124 e!153122)))

(declare-fun c!39280 () Bool)

(assert (=> b!235802 (= c!39280 (validKeyInArray!0 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235803 () Bool)

(declare-fun call!21930 () Bool)

(assert (=> b!235803 (= e!153122 call!21930)))

(declare-fun d!59313 () Bool)

(declare-fun res!115649 () Bool)

(declare-fun e!153121 () Bool)

(assert (=> d!59313 (=> res!115649 e!153121)))

(assert (=> d!59313 (= res!115649 (bvsge #b00000000000000000000000000000000 (size!5880 (_keys!6454 thiss!1504))))))

(assert (=> d!59313 (= (arrayNoDuplicates!0 (_keys!6454 thiss!1504) #b00000000000000000000000000000000 Nil!3543) e!153121)))

(declare-fun bm!21927 () Bool)

(assert (=> bm!21927 (= call!21930 (arrayNoDuplicates!0 (_keys!6454 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39280 (Cons!3542 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000) Nil!3543) Nil!3543)))))

(declare-fun b!235804 () Bool)

(declare-fun e!153123 () Bool)

(declare-fun contains!1668 (List!3546 (_ BitVec 64)) Bool)

(assert (=> b!235804 (= e!153123 (contains!1668 Nil!3543 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235805 () Bool)

(assert (=> b!235805 (= e!153121 e!153124)))

(declare-fun res!115650 () Bool)

(assert (=> b!235805 (=> (not res!115650) (not e!153124))))

(assert (=> b!235805 (= res!115650 (not e!153123))))

(declare-fun res!115648 () Bool)

(assert (=> b!235805 (=> (not res!115648) (not e!153123))))

(assert (=> b!235805 (= res!115648 (validKeyInArray!0 (select (arr!5543 (_keys!6454 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235806 () Bool)

(assert (=> b!235806 (= e!153122 call!21930)))

(assert (= (and d!59313 (not res!115649)) b!235805))

(assert (= (and b!235805 res!115648) b!235804))

(assert (= (and b!235805 res!115650) b!235802))

(assert (= (and b!235802 c!39280) b!235803))

(assert (= (and b!235802 (not c!39280)) b!235806))

(assert (= (or b!235803 b!235806) bm!21927))

(assert (=> b!235802 m!256719))

(assert (=> b!235802 m!256719))

(assert (=> b!235802 m!256727))

(assert (=> bm!21927 m!256719))

(declare-fun m!256811 () Bool)

(assert (=> bm!21927 m!256811))

(assert (=> b!235804 m!256719))

(assert (=> b!235804 m!256719))

(declare-fun m!256813 () Bool)

(assert (=> b!235804 m!256813))

(assert (=> b!235805 m!256719))

(assert (=> b!235805 m!256719))

(assert (=> b!235805 m!256727))

(assert (=> b!235637 d!59313))

(declare-fun condMapEmpty!10505 () Bool)

(declare-fun mapDefault!10505 () ValueCell!2757)

(assert (=> mapNonEmpty!10499 (= condMapEmpty!10505 (= mapRest!10499 ((as const (Array (_ BitVec 32) ValueCell!2757)) mapDefault!10505)))))

(declare-fun e!153130 () Bool)

(declare-fun mapRes!10505 () Bool)

(assert (=> mapNonEmpty!10499 (= tp!22186 (and e!153130 mapRes!10505))))

(declare-fun b!235814 () Bool)

(assert (=> b!235814 (= e!153130 tp_is_empty!6201)))

(declare-fun b!235813 () Bool)

(declare-fun e!153129 () Bool)

(assert (=> b!235813 (= e!153129 tp_is_empty!6201)))

(declare-fun mapNonEmpty!10505 () Bool)

(declare-fun tp!22196 () Bool)

(assert (=> mapNonEmpty!10505 (= mapRes!10505 (and tp!22196 e!153129))))

(declare-fun mapRest!10505 () (Array (_ BitVec 32) ValueCell!2757))

(declare-fun mapKey!10505 () (_ BitVec 32))

(declare-fun mapValue!10505 () ValueCell!2757)

(assert (=> mapNonEmpty!10505 (= mapRest!10499 (store mapRest!10505 mapKey!10505 mapValue!10505))))

(declare-fun mapIsEmpty!10505 () Bool)

(assert (=> mapIsEmpty!10505 mapRes!10505))

(assert (= (and mapNonEmpty!10499 condMapEmpty!10505) mapIsEmpty!10505))

(assert (= (and mapNonEmpty!10499 (not condMapEmpty!10505)) mapNonEmpty!10505))

(assert (= (and mapNonEmpty!10505 ((_ is ValueCellFull!2757) mapValue!10505)) b!235813))

(assert (= (and mapNonEmpty!10499 ((_ is ValueCellFull!2757) mapDefault!10505)) b!235814))

(declare-fun m!256815 () Bool)

(assert (=> mapNonEmpty!10505 m!256815))

(declare-fun b_lambda!7909 () Bool)

(assert (= b_lambda!7907 (or (and b!235635 b_free!6339) b_lambda!7909)))

(check-sat (not b!235804) (not b!235770) (not b!235708) (not b!235802) (not b!235761) (not bm!21903) (not b!235689) (not d!59305) (not bm!21921) (not b!235755) (not b!235766) (not b_next!6339) b_and!13273 (not b!235690) (not b!235706) (not b!235762) (not b!235765) (not d!59307) (not bm!21924) (not b!235756) (not bm!21922) (not d!59301) (not b!235786) tp_is_empty!6201 (not b!235805) (not bm!21927) (not b!235769) (not b!235698) (not bm!21920) (not d!59303) (not mapNonEmpty!10505) (not b!235697) (not b!235699) (not b_lambda!7909))
(check-sat b_and!13273 (not b_next!6339))
