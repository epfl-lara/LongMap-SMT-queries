; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22208 () Bool)

(assert start!22208)

(declare-fun b!232679 () Bool)

(declare-fun b_free!6271 () Bool)

(declare-fun b_next!6271 () Bool)

(assert (=> b!232679 (= b_free!6271 (not b_next!6271))))

(declare-fun tp!21954 () Bool)

(declare-fun b_and!13143 () Bool)

(assert (=> b!232679 (= tp!21954 b_and!13143)))

(declare-fun bm!21620 () Bool)

(declare-fun call!21624 () Bool)

(declare-datatypes ((V!7825 0))(
  ( (V!7826 (val!3111 Int)) )
))
(declare-datatypes ((ValueCell!2723 0))(
  ( (ValueCellFull!2723 (v!5125 V!7825)) (EmptyCell!2723) )
))
(declare-datatypes ((array!11501 0))(
  ( (array!11502 (arr!5469 (Array (_ BitVec 32) ValueCell!2723)) (size!5803 (_ BitVec 32))) )
))
(declare-datatypes ((array!11503 0))(
  ( (array!11504 (arr!5470 (Array (_ BitVec 32) (_ BitVec 64))) (size!5804 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3346 0))(
  ( (LongMapFixedSize!3347 (defaultEntry!4332 Int) (mask!10249 (_ BitVec 32)) (extraKeys!4069 (_ BitVec 32)) (zeroValue!4173 V!7825) (minValue!4173 V!7825) (_size!1722 (_ BitVec 32)) (_keys!6385 array!11503) (_values!4315 array!11501) (_vacant!1722 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3346)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21620 (= call!21624 (arrayContainsKey!0 (_keys!6385 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232664 () Bool)

(declare-fun e!151110 () Bool)

(declare-fun e!151117 () Bool)

(assert (=> b!232664 (= e!151110 e!151117)))

(declare-fun res!114199 () Bool)

(assert (=> b!232664 (=> (not res!114199) (not e!151117))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!232664 (= res!114199 (inRange!0 index!297 (mask!10249 thiss!1504)))))

(declare-datatypes ((Unit!7185 0))(
  ( (Unit!7186) )
))
(declare-fun lt!117567 () Unit!7185)

(declare-fun e!151109 () Unit!7185)

(assert (=> b!232664 (= lt!117567 e!151109)))

(declare-fun c!38696 () Bool)

(declare-datatypes ((tuple2!4568 0))(
  ( (tuple2!4569 (_1!2295 (_ BitVec 64)) (_2!2295 V!7825)) )
))
(declare-datatypes ((List!3504 0))(
  ( (Nil!3501) (Cons!3500 (h!4148 tuple2!4568) (t!8454 List!3504)) )
))
(declare-datatypes ((ListLongMap!3471 0))(
  ( (ListLongMap!3472 (toList!1751 List!3504)) )
))
(declare-fun lt!117557 () ListLongMap!3471)

(declare-fun contains!1622 (ListLongMap!3471 (_ BitVec 64)) Bool)

(assert (=> b!232664 (= c!38696 (contains!1622 lt!117557 key!932))))

(declare-fun getCurrentListMap!1260 (array!11503 array!11501 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 32) Int) ListLongMap!3471)

(assert (=> b!232664 (= lt!117557 (getCurrentListMap!1260 (_keys!6385 thiss!1504) (_values!4315 thiss!1504) (mask!10249 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4332 thiss!1504)))))

(declare-fun b!232665 () Bool)

(declare-fun e!151111 () Unit!7185)

(declare-fun Unit!7187 () Unit!7185)

(assert (=> b!232665 (= e!151111 Unit!7187)))

(declare-fun b!232667 () Bool)

(declare-fun res!114201 () Bool)

(declare-fun e!151105 () Bool)

(assert (=> b!232667 (=> (not res!114201) (not e!151105))))

(declare-datatypes ((SeekEntryResult!973 0))(
  ( (MissingZero!973 (index!6062 (_ BitVec 32))) (Found!973 (index!6063 (_ BitVec 32))) (Intermediate!973 (undefined!1785 Bool) (index!6064 (_ BitVec 32)) (x!23584 (_ BitVec 32))) (Undefined!973) (MissingVacant!973 (index!6065 (_ BitVec 32))) )
))
(declare-fun lt!117566 () SeekEntryResult!973)

(assert (=> b!232667 (= res!114201 (= (select (arr!5470 (_keys!6385 thiss!1504)) (index!6062 lt!117566)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232668 () Bool)

(declare-fun Unit!7188 () Unit!7185)

(assert (=> b!232668 (= e!151111 Unit!7188)))

(declare-fun lt!117562 () Unit!7185)

(declare-fun lemmaArrayContainsKeyThenInListMap!159 (array!11503 array!11501 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 64) (_ BitVec 32) Int) Unit!7185)

(assert (=> b!232668 (= lt!117562 (lemmaArrayContainsKeyThenInListMap!159 (_keys!6385 thiss!1504) (_values!4315 thiss!1504) (mask!10249 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4332 thiss!1504)))))

(assert (=> b!232668 false))

(declare-fun b!232669 () Bool)

(declare-fun e!151108 () Bool)

(get-info :version)

(assert (=> b!232669 (= e!151108 ((_ is Undefined!973) lt!117566))))

(declare-fun b!232670 () Bool)

(declare-fun e!151119 () Bool)

(declare-fun tp_is_empty!6133 () Bool)

(assert (=> b!232670 (= e!151119 tp_is_empty!6133)))

(declare-fun b!232671 () Bool)

(declare-fun lt!117565 () Unit!7185)

(assert (=> b!232671 (= e!151109 lt!117565)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!317 (array!11503 array!11501 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 64) Int) Unit!7185)

(assert (=> b!232671 (= lt!117565 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!317 (_keys!6385 thiss!1504) (_values!4315 thiss!1504) (mask!10249 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) key!932 (defaultEntry!4332 thiss!1504)))))

(declare-fun c!38698 () Bool)

(assert (=> b!232671 (= c!38698 ((_ is MissingZero!973) lt!117566))))

(declare-fun e!151118 () Bool)

(assert (=> b!232671 e!151118))

(declare-fun b!232672 () Bool)

(declare-fun e!151113 () Bool)

(assert (=> b!232672 (= e!151113 tp_is_empty!6133)))

(declare-fun call!21623 () Bool)

(declare-fun bm!21621 () Bool)

(assert (=> bm!21621 (= call!21623 (inRange!0 (ite c!38698 (index!6062 lt!117566) (index!6065 lt!117566)) (mask!10249 thiss!1504)))))

(declare-fun b!232673 () Bool)

(declare-fun e!151112 () Bool)

(assert (=> b!232673 (= e!151112 (not call!21624))))

(declare-fun b!232674 () Bool)

(declare-fun e!151115 () Bool)

(assert (=> b!232674 (= e!151117 (not e!151115))))

(declare-fun res!114204 () Bool)

(assert (=> b!232674 (=> res!114204 e!151115)))

(declare-fun lt!117561 () LongMapFixedSize!3346)

(declare-fun valid!1338 (LongMapFixedSize!3346) Bool)

(assert (=> b!232674 (= res!114204 (not (valid!1338 lt!117561)))))

(declare-fun lt!117552 () ListLongMap!3471)

(assert (=> b!232674 (contains!1622 lt!117552 key!932)))

(declare-fun lt!117560 () array!11501)

(declare-fun lt!117563 () array!11503)

(declare-fun lt!117553 () Unit!7185)

(declare-fun lemmaValidKeyInArrayIsInListMap!150 (array!11503 array!11501 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 32) Int) Unit!7185)

(assert (=> b!232674 (= lt!117553 (lemmaValidKeyInArrayIsInListMap!150 lt!117563 lt!117560 (mask!10249 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) index!297 (defaultEntry!4332 thiss!1504)))))

(assert (=> b!232674 (= lt!117561 (LongMapFixedSize!3347 (defaultEntry!4332 thiss!1504) (mask!10249 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1722 thiss!1504)) lt!117563 lt!117560 (_vacant!1722 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11503 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232674 (= (arrayCountValidKeys!0 lt!117563 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117564 () Unit!7185)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11503 (_ BitVec 32)) Unit!7185)

(assert (=> b!232674 (= lt!117564 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117563 index!297))))

(assert (=> b!232674 (arrayContainsKey!0 lt!117563 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117558 () Unit!7185)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11503 (_ BitVec 64) (_ BitVec 32)) Unit!7185)

(assert (=> b!232674 (= lt!117558 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117563 key!932 index!297))))

(declare-fun lt!117559 () ListLongMap!3471)

(assert (=> b!232674 (= lt!117559 lt!117552)))

(assert (=> b!232674 (= lt!117552 (getCurrentListMap!1260 lt!117563 lt!117560 (mask!10249 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4332 thiss!1504)))))

(declare-fun v!346 () V!7825)

(declare-fun +!635 (ListLongMap!3471 tuple2!4568) ListLongMap!3471)

(assert (=> b!232674 (= lt!117559 (+!635 lt!117557 (tuple2!4569 key!932 v!346)))))

(assert (=> b!232674 (= lt!117560 (array!11502 (store (arr!5469 (_values!4315 thiss!1504)) index!297 (ValueCellFull!2723 v!346)) (size!5803 (_values!4315 thiss!1504))))))

(declare-fun lt!117549 () Unit!7185)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!90 (array!11503 array!11501 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 32) (_ BitVec 64) V!7825 Int) Unit!7185)

(assert (=> b!232674 (= lt!117549 (lemmaAddValidKeyToArrayThenAddPairToListMap!90 (_keys!6385 thiss!1504) (_values!4315 thiss!1504) (mask!10249 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) index!297 key!932 v!346 (defaultEntry!4332 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11503 (_ BitVec 32)) Bool)

(assert (=> b!232674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117563 (mask!10249 thiss!1504))))

(declare-fun lt!117554 () Unit!7185)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11503 (_ BitVec 32) (_ BitVec 32)) Unit!7185)

(assert (=> b!232674 (= lt!117554 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6385 thiss!1504) index!297 (mask!10249 thiss!1504)))))

(assert (=> b!232674 (= (arrayCountValidKeys!0 lt!117563 #b00000000000000000000000000000000 (size!5804 (_keys!6385 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6385 thiss!1504) #b00000000000000000000000000000000 (size!5804 (_keys!6385 thiss!1504)))))))

(declare-fun lt!117550 () Unit!7185)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11503 (_ BitVec 32) (_ BitVec 64)) Unit!7185)

(assert (=> b!232674 (= lt!117550 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6385 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3505 0))(
  ( (Nil!3502) (Cons!3501 (h!4149 (_ BitVec 64)) (t!8455 List!3505)) )
))
(declare-fun arrayNoDuplicates!0 (array!11503 (_ BitVec 32) List!3505) Bool)

(assert (=> b!232674 (arrayNoDuplicates!0 lt!117563 #b00000000000000000000000000000000 Nil!3502)))

(assert (=> b!232674 (= lt!117563 (array!11504 (store (arr!5470 (_keys!6385 thiss!1504)) index!297 key!932) (size!5804 (_keys!6385 thiss!1504))))))

(declare-fun lt!117568 () Unit!7185)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3505) Unit!7185)

(assert (=> b!232674 (= lt!117568 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6385 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3502))))

(declare-fun lt!117556 () Unit!7185)

(assert (=> b!232674 (= lt!117556 e!151111)))

(declare-fun c!38697 () Bool)

(assert (=> b!232674 (= c!38697 (arrayContainsKey!0 (_keys!6385 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232675 () Bool)

(assert (=> b!232675 (= e!151105 (not call!21624))))

(declare-fun b!232676 () Bool)

(assert (=> b!232676 (= e!151115 true)))

(declare-fun lt!117551 () Bool)

(declare-fun map!2562 (LongMapFixedSize!3346) ListLongMap!3471)

(assert (=> b!232676 (= lt!117551 (contains!1622 (map!2562 lt!117561) key!932))))

(declare-fun mapNonEmpty!10369 () Bool)

(declare-fun mapRes!10369 () Bool)

(declare-fun tp!21955 () Bool)

(assert (=> mapNonEmpty!10369 (= mapRes!10369 (and tp!21955 e!151113))))

(declare-fun mapKey!10369 () (_ BitVec 32))

(declare-fun mapRest!10369 () (Array (_ BitVec 32) ValueCell!2723))

(declare-fun mapValue!10369 () ValueCell!2723)

(assert (=> mapNonEmpty!10369 (= (arr!5469 (_values!4315 thiss!1504)) (store mapRest!10369 mapKey!10369 mapValue!10369))))

(declare-fun b!232677 () Bool)

(declare-fun res!114206 () Bool)

(assert (=> b!232677 (= res!114206 (= (select (arr!5470 (_keys!6385 thiss!1504)) (index!6065 lt!117566)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!232677 (=> (not res!114206) (not e!151112))))

(declare-fun b!232678 () Bool)

(declare-fun e!151106 () Bool)

(assert (=> b!232678 (= e!151106 (and e!151119 mapRes!10369))))

(declare-fun condMapEmpty!10369 () Bool)

(declare-fun mapDefault!10369 () ValueCell!2723)

(assert (=> b!232678 (= condMapEmpty!10369 (= (arr!5469 (_values!4315 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2723)) mapDefault!10369)))))

(declare-fun res!114202 () Bool)

(declare-fun e!151107 () Bool)

(assert (=> start!22208 (=> (not res!114202) (not e!151107))))

(assert (=> start!22208 (= res!114202 (valid!1338 thiss!1504))))

(assert (=> start!22208 e!151107))

(declare-fun e!151114 () Bool)

(assert (=> start!22208 e!151114))

(assert (=> start!22208 true))

(assert (=> start!22208 tp_is_empty!6133))

(declare-fun b!232666 () Bool)

(declare-fun c!38695 () Bool)

(assert (=> b!232666 (= c!38695 ((_ is MissingVacant!973) lt!117566))))

(assert (=> b!232666 (= e!151118 e!151108)))

(declare-fun array_inv!3609 (array!11503) Bool)

(declare-fun array_inv!3610 (array!11501) Bool)

(assert (=> b!232679 (= e!151114 (and tp!21954 tp_is_empty!6133 (array_inv!3609 (_keys!6385 thiss!1504)) (array_inv!3610 (_values!4315 thiss!1504)) e!151106))))

(declare-fun mapIsEmpty!10369 () Bool)

(assert (=> mapIsEmpty!10369 mapRes!10369))

(declare-fun b!232680 () Bool)

(assert (=> b!232680 (= e!151108 e!151112)))

(declare-fun res!114205 () Bool)

(assert (=> b!232680 (= res!114205 call!21623)))

(assert (=> b!232680 (=> (not res!114205) (not e!151112))))

(declare-fun b!232681 () Bool)

(declare-fun res!114203 () Bool)

(assert (=> b!232681 (=> (not res!114203) (not e!151105))))

(assert (=> b!232681 (= res!114203 call!21623)))

(assert (=> b!232681 (= e!151118 e!151105)))

(declare-fun b!232682 () Bool)

(declare-fun Unit!7189 () Unit!7185)

(assert (=> b!232682 (= e!151109 Unit!7189)))

(declare-fun lt!117555 () Unit!7185)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!321 (array!11503 array!11501 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 64) Int) Unit!7185)

(assert (=> b!232682 (= lt!117555 (lemmaInListMapThenSeekEntryOrOpenFindsIt!321 (_keys!6385 thiss!1504) (_values!4315 thiss!1504) (mask!10249 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) key!932 (defaultEntry!4332 thiss!1504)))))

(assert (=> b!232682 false))

(declare-fun b!232683 () Bool)

(assert (=> b!232683 (= e!151107 e!151110)))

(declare-fun res!114198 () Bool)

(assert (=> b!232683 (=> (not res!114198) (not e!151110))))

(assert (=> b!232683 (= res!114198 (or (= lt!117566 (MissingZero!973 index!297)) (= lt!117566 (MissingVacant!973 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11503 (_ BitVec 32)) SeekEntryResult!973)

(assert (=> b!232683 (= lt!117566 (seekEntryOrOpen!0 key!932 (_keys!6385 thiss!1504) (mask!10249 thiss!1504)))))

(declare-fun b!232684 () Bool)

(declare-fun res!114200 () Bool)

(assert (=> b!232684 (=> (not res!114200) (not e!151107))))

(assert (=> b!232684 (= res!114200 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22208 res!114202) b!232684))

(assert (= (and b!232684 res!114200) b!232683))

(assert (= (and b!232683 res!114198) b!232664))

(assert (= (and b!232664 c!38696) b!232682))

(assert (= (and b!232664 (not c!38696)) b!232671))

(assert (= (and b!232671 c!38698) b!232681))

(assert (= (and b!232671 (not c!38698)) b!232666))

(assert (= (and b!232681 res!114203) b!232667))

(assert (= (and b!232667 res!114201) b!232675))

(assert (= (and b!232666 c!38695) b!232680))

(assert (= (and b!232666 (not c!38695)) b!232669))

(assert (= (and b!232680 res!114205) b!232677))

(assert (= (and b!232677 res!114206) b!232673))

(assert (= (or b!232681 b!232680) bm!21621))

(assert (= (or b!232675 b!232673) bm!21620))

(assert (= (and b!232664 res!114199) b!232674))

(assert (= (and b!232674 c!38697) b!232668))

(assert (= (and b!232674 (not c!38697)) b!232665))

(assert (= (and b!232674 (not res!114204)) b!232676))

(assert (= (and b!232678 condMapEmpty!10369) mapIsEmpty!10369))

(assert (= (and b!232678 (not condMapEmpty!10369)) mapNonEmpty!10369))

(assert (= (and mapNonEmpty!10369 ((_ is ValueCellFull!2723) mapValue!10369)) b!232672))

(assert (= (and b!232678 ((_ is ValueCellFull!2723) mapDefault!10369)) b!232670))

(assert (= b!232679 b!232678))

(assert (= start!22208 b!232679))

(declare-fun m!253669 () Bool)

(assert (=> start!22208 m!253669))

(declare-fun m!253671 () Bool)

(assert (=> b!232677 m!253671))

(declare-fun m!253673 () Bool)

(assert (=> b!232676 m!253673))

(assert (=> b!232676 m!253673))

(declare-fun m!253675 () Bool)

(assert (=> b!232676 m!253675))

(declare-fun m!253677 () Bool)

(assert (=> b!232682 m!253677))

(declare-fun m!253679 () Bool)

(assert (=> b!232667 m!253679))

(declare-fun m!253681 () Bool)

(assert (=> bm!21621 m!253681))

(declare-fun m!253683 () Bool)

(assert (=> b!232664 m!253683))

(declare-fun m!253685 () Bool)

(assert (=> b!232664 m!253685))

(declare-fun m!253687 () Bool)

(assert (=> b!232664 m!253687))

(declare-fun m!253689 () Bool)

(assert (=> b!232674 m!253689))

(declare-fun m!253691 () Bool)

(assert (=> b!232674 m!253691))

(declare-fun m!253693 () Bool)

(assert (=> b!232674 m!253693))

(declare-fun m!253695 () Bool)

(assert (=> b!232674 m!253695))

(declare-fun m!253697 () Bool)

(assert (=> b!232674 m!253697))

(declare-fun m!253699 () Bool)

(assert (=> b!232674 m!253699))

(declare-fun m!253701 () Bool)

(assert (=> b!232674 m!253701))

(declare-fun m!253703 () Bool)

(assert (=> b!232674 m!253703))

(declare-fun m!253705 () Bool)

(assert (=> b!232674 m!253705))

(declare-fun m!253707 () Bool)

(assert (=> b!232674 m!253707))

(declare-fun m!253709 () Bool)

(assert (=> b!232674 m!253709))

(declare-fun m!253711 () Bool)

(assert (=> b!232674 m!253711))

(declare-fun m!253713 () Bool)

(assert (=> b!232674 m!253713))

(declare-fun m!253715 () Bool)

(assert (=> b!232674 m!253715))

(declare-fun m!253717 () Bool)

(assert (=> b!232674 m!253717))

(declare-fun m!253719 () Bool)

(assert (=> b!232674 m!253719))

(declare-fun m!253721 () Bool)

(assert (=> b!232674 m!253721))

(declare-fun m!253723 () Bool)

(assert (=> b!232674 m!253723))

(declare-fun m!253725 () Bool)

(assert (=> b!232674 m!253725))

(declare-fun m!253727 () Bool)

(assert (=> b!232674 m!253727))

(assert (=> bm!21620 m!253689))

(declare-fun m!253729 () Bool)

(assert (=> b!232683 m!253729))

(declare-fun m!253731 () Bool)

(assert (=> b!232679 m!253731))

(declare-fun m!253733 () Bool)

(assert (=> b!232679 m!253733))

(declare-fun m!253735 () Bool)

(assert (=> mapNonEmpty!10369 m!253735))

(declare-fun m!253737 () Bool)

(assert (=> b!232671 m!253737))

(declare-fun m!253739 () Bool)

(assert (=> b!232668 m!253739))

(check-sat (not b!232664) (not b!232682) b_and!13143 (not b!232676) (not b!232671) (not b_next!6271) (not b!232674) tp_is_empty!6133 (not mapNonEmpty!10369) (not b!232683) (not b!232679) (not start!22208) (not bm!21620) (not b!232668) (not bm!21621))
(check-sat b_and!13143 (not b_next!6271))
