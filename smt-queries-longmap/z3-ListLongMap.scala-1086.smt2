; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22202 () Bool)

(assert start!22202)

(declare-fun b!232670 () Bool)

(declare-fun b_free!6265 () Bool)

(declare-fun b_next!6265 () Bool)

(assert (=> b!232670 (= b_free!6265 (not b_next!6265))))

(declare-fun tp!21936 () Bool)

(declare-fun b_and!13177 () Bool)

(assert (=> b!232670 (= tp!21936 b_and!13177)))

(declare-fun b!232669 () Bool)

(declare-fun res!114233 () Bool)

(declare-fun e!151104 () Bool)

(assert (=> b!232669 (=> (not res!114233) (not e!151104))))

(declare-fun call!21617 () Bool)

(assert (=> b!232669 (= res!114233 call!21617)))

(declare-fun e!151096 () Bool)

(assert (=> b!232669 (= e!151096 e!151104)))

(declare-fun b!232671 () Bool)

(declare-fun e!151109 () Bool)

(declare-datatypes ((SeekEntryResult!936 0))(
  ( (MissingZero!936 (index!5914 (_ BitVec 32))) (Found!936 (index!5915 (_ BitVec 32))) (Intermediate!936 (undefined!1748 Bool) (index!5916 (_ BitVec 32)) (x!23540 (_ BitVec 32))) (Undefined!936) (MissingVacant!936 (index!5917 (_ BitVec 32))) )
))
(declare-fun lt!117625 () SeekEntryResult!936)

(get-info :version)

(assert (=> b!232671 (= e!151109 ((_ is Undefined!936) lt!117625))))

(declare-fun b!232672 () Bool)

(declare-fun call!21618 () Bool)

(assert (=> b!232672 (= e!151104 (not call!21618))))

(declare-fun b!232673 () Bool)

(declare-fun e!151107 () Bool)

(declare-fun tp_is_empty!6127 () Bool)

(assert (=> b!232673 (= e!151107 tp_is_empty!6127)))

(declare-fun mapNonEmpty!10360 () Bool)

(declare-fun mapRes!10360 () Bool)

(declare-fun tp!21937 () Bool)

(assert (=> mapNonEmpty!10360 (= mapRes!10360 (and tp!21937 e!151107))))

(declare-fun mapKey!10360 () (_ BitVec 32))

(declare-datatypes ((V!7817 0))(
  ( (V!7818 (val!3108 Int)) )
))
(declare-datatypes ((ValueCell!2720 0))(
  ( (ValueCellFull!2720 (v!5129 V!7817)) (EmptyCell!2720) )
))
(declare-fun mapValue!10360 () ValueCell!2720)

(declare-datatypes ((array!11495 0))(
  ( (array!11496 (arr!5467 (Array (_ BitVec 32) ValueCell!2720)) (size!5800 (_ BitVec 32))) )
))
(declare-datatypes ((array!11497 0))(
  ( (array!11498 (arr!5468 (Array (_ BitVec 32) (_ BitVec 64))) (size!5801 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3340 0))(
  ( (LongMapFixedSize!3341 (defaultEntry!4329 Int) (mask!10245 (_ BitVec 32)) (extraKeys!4066 (_ BitVec 32)) (zeroValue!4170 V!7817) (minValue!4170 V!7817) (_size!1719 (_ BitVec 32)) (_keys!6383 array!11497) (_values!4312 array!11495) (_vacant!1719 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3340)

(declare-fun mapRest!10360 () (Array (_ BitVec 32) ValueCell!2720))

(assert (=> mapNonEmpty!10360 (= (arr!5467 (_values!4312 thiss!1504)) (store mapRest!10360 mapKey!10360 mapValue!10360))))

(declare-fun b!232674 () Bool)

(declare-datatypes ((Unit!7174 0))(
  ( (Unit!7175) )
))
(declare-fun e!151102 () Unit!7174)

(declare-fun lt!117610 () Unit!7174)

(assert (=> b!232674 (= e!151102 lt!117610)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!310 (array!11497 array!11495 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 64) Int) Unit!7174)

(assert (=> b!232674 (= lt!117610 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!310 (_keys!6383 thiss!1504) (_values!4312 thiss!1504) (mask!10245 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) key!932 (defaultEntry!4329 thiss!1504)))))

(declare-fun c!38698 () Bool)

(assert (=> b!232674 (= c!38698 ((_ is MissingZero!936) lt!117625))))

(assert (=> b!232674 e!151096))

(declare-fun b!232675 () Bool)

(declare-fun e!151098 () Bool)

(assert (=> b!232675 (= e!151109 e!151098)))

(declare-fun res!114239 () Bool)

(assert (=> b!232675 (= res!114239 call!21617)))

(assert (=> b!232675 (=> (not res!114239) (not e!151098))))

(declare-fun b!232676 () Bool)

(declare-fun res!114234 () Bool)

(declare-fun e!151105 () Bool)

(assert (=> b!232676 (=> (not res!114234) (not e!151105))))

(assert (=> b!232676 (= res!114234 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232677 () Bool)

(declare-fun res!114237 () Bool)

(assert (=> b!232677 (=> (not res!114237) (not e!151104))))

(assert (=> b!232677 (= res!114237 (= (select (arr!5468 (_keys!6383 thiss!1504)) (index!5914 lt!117625)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232678 () Bool)

(declare-fun e!151108 () Bool)

(declare-fun e!151100 () Bool)

(assert (=> b!232678 (= e!151108 (not e!151100))))

(declare-fun res!114238 () Bool)

(assert (=> b!232678 (=> res!114238 e!151100)))

(declare-fun lt!117618 () LongMapFixedSize!3340)

(declare-fun valid!1337 (LongMapFixedSize!3340) Bool)

(assert (=> b!232678 (= res!114238 (not (valid!1337 lt!117618)))))

(declare-datatypes ((tuple2!4518 0))(
  ( (tuple2!4519 (_1!2270 (_ BitVec 64)) (_2!2270 V!7817)) )
))
(declare-datatypes ((List!3427 0))(
  ( (Nil!3424) (Cons!3423 (h!4071 tuple2!4518) (t!8378 List!3427)) )
))
(declare-datatypes ((ListLongMap!3433 0))(
  ( (ListLongMap!3434 (toList!1732 List!3427)) )
))
(declare-fun lt!117628 () ListLongMap!3433)

(declare-fun contains!1614 (ListLongMap!3433 (_ BitVec 64)) Bool)

(assert (=> b!232678 (contains!1614 lt!117628 key!932)))

(declare-fun lt!117626 () array!11497)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!117613 () Unit!7174)

(declare-fun lt!117624 () array!11495)

(declare-fun lemmaValidKeyInArrayIsInListMap!148 (array!11497 array!11495 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 32) Int) Unit!7174)

(assert (=> b!232678 (= lt!117613 (lemmaValidKeyInArrayIsInListMap!148 lt!117626 lt!117624 (mask!10245 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) index!297 (defaultEntry!4329 thiss!1504)))))

(assert (=> b!232678 (= lt!117618 (LongMapFixedSize!3341 (defaultEntry!4329 thiss!1504) (mask!10245 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1719 thiss!1504)) lt!117626 lt!117624 (_vacant!1719 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11497 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232678 (= (arrayCountValidKeys!0 lt!117626 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117621 () Unit!7174)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11497 (_ BitVec 32)) Unit!7174)

(assert (=> b!232678 (= lt!117621 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117626 index!297))))

(declare-fun arrayContainsKey!0 (array!11497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232678 (arrayContainsKey!0 lt!117626 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117620 () Unit!7174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11497 (_ BitVec 64) (_ BitVec 32)) Unit!7174)

(assert (=> b!232678 (= lt!117620 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117626 key!932 index!297))))

(declare-fun lt!117617 () ListLongMap!3433)

(assert (=> b!232678 (= lt!117617 lt!117628)))

(declare-fun getCurrentListMap!1264 (array!11497 array!11495 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 32) Int) ListLongMap!3433)

(assert (=> b!232678 (= lt!117628 (getCurrentListMap!1264 lt!117626 lt!117624 (mask!10245 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4329 thiss!1504)))))

(declare-fun v!346 () V!7817)

(declare-fun lt!117612 () ListLongMap!3433)

(declare-fun +!627 (ListLongMap!3433 tuple2!4518) ListLongMap!3433)

(assert (=> b!232678 (= lt!117617 (+!627 lt!117612 (tuple2!4519 key!932 v!346)))))

(assert (=> b!232678 (= lt!117624 (array!11496 (store (arr!5467 (_values!4312 thiss!1504)) index!297 (ValueCellFull!2720 v!346)) (size!5800 (_values!4312 thiss!1504))))))

(declare-fun lt!117609 () Unit!7174)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!86 (array!11497 array!11495 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 32) (_ BitVec 64) V!7817 Int) Unit!7174)

(assert (=> b!232678 (= lt!117609 (lemmaAddValidKeyToArrayThenAddPairToListMap!86 (_keys!6383 thiss!1504) (_values!4312 thiss!1504) (mask!10245 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) index!297 key!932 v!346 (defaultEntry!4329 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11497 (_ BitVec 32)) Bool)

(assert (=> b!232678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117626 (mask!10245 thiss!1504))))

(declare-fun lt!117614 () Unit!7174)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11497 (_ BitVec 32) (_ BitVec 32)) Unit!7174)

(assert (=> b!232678 (= lt!117614 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6383 thiss!1504) index!297 (mask!10245 thiss!1504)))))

(assert (=> b!232678 (= (arrayCountValidKeys!0 lt!117626 #b00000000000000000000000000000000 (size!5801 (_keys!6383 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6383 thiss!1504) #b00000000000000000000000000000000 (size!5801 (_keys!6383 thiss!1504)))))))

(declare-fun lt!117622 () Unit!7174)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11497 (_ BitVec 32) (_ BitVec 64)) Unit!7174)

(assert (=> b!232678 (= lt!117622 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6383 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3428 0))(
  ( (Nil!3425) (Cons!3424 (h!4072 (_ BitVec 64)) (t!8379 List!3428)) )
))
(declare-fun arrayNoDuplicates!0 (array!11497 (_ BitVec 32) List!3428) Bool)

(assert (=> b!232678 (arrayNoDuplicates!0 lt!117626 #b00000000000000000000000000000000 Nil!3425)))

(assert (=> b!232678 (= lt!117626 (array!11498 (store (arr!5468 (_keys!6383 thiss!1504)) index!297 key!932) (size!5801 (_keys!6383 thiss!1504))))))

(declare-fun lt!117616 () Unit!7174)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11497 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3428) Unit!7174)

(assert (=> b!232678 (= lt!117616 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6383 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3425))))

(declare-fun lt!117611 () Unit!7174)

(declare-fun e!151095 () Unit!7174)

(assert (=> b!232678 (= lt!117611 e!151095)))

(declare-fun c!38701 () Bool)

(assert (=> b!232678 (= c!38701 (arrayContainsKey!0 (_keys!6383 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232679 () Bool)

(declare-fun e!151106 () Bool)

(assert (=> b!232679 (= e!151106 tp_is_empty!6127)))

(declare-fun b!232680 () Bool)

(declare-fun e!151097 () Bool)

(assert (=> b!232680 (= e!151097 (and e!151106 mapRes!10360))))

(declare-fun condMapEmpty!10360 () Bool)

(declare-fun mapDefault!10360 () ValueCell!2720)

(assert (=> b!232680 (= condMapEmpty!10360 (= (arr!5467 (_values!4312 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2720)) mapDefault!10360)))))

(declare-fun e!151103 () Bool)

(declare-fun array_inv!3585 (array!11497) Bool)

(declare-fun array_inv!3586 (array!11495) Bool)

(assert (=> b!232670 (= e!151103 (and tp!21936 tp_is_empty!6127 (array_inv!3585 (_keys!6383 thiss!1504)) (array_inv!3586 (_values!4312 thiss!1504)) e!151097))))

(declare-fun res!114241 () Bool)

(assert (=> start!22202 (=> (not res!114241) (not e!151105))))

(assert (=> start!22202 (= res!114241 (valid!1337 thiss!1504))))

(assert (=> start!22202 e!151105))

(assert (=> start!22202 e!151103))

(assert (=> start!22202 true))

(assert (=> start!22202 tp_is_empty!6127))

(declare-fun mapIsEmpty!10360 () Bool)

(assert (=> mapIsEmpty!10360 mapRes!10360))

(declare-fun b!232681 () Bool)

(declare-fun Unit!7176 () Unit!7174)

(assert (=> b!232681 (= e!151095 Unit!7176)))

(declare-fun b!232682 () Bool)

(declare-fun e!151099 () Bool)

(assert (=> b!232682 (= e!151105 e!151099)))

(declare-fun res!114235 () Bool)

(assert (=> b!232682 (=> (not res!114235) (not e!151099))))

(assert (=> b!232682 (= res!114235 (or (= lt!117625 (MissingZero!936 index!297)) (= lt!117625 (MissingVacant!936 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11497 (_ BitVec 32)) SeekEntryResult!936)

(assert (=> b!232682 (= lt!117625 (seekEntryOrOpen!0 key!932 (_keys!6383 thiss!1504) (mask!10245 thiss!1504)))))

(declare-fun b!232683 () Bool)

(declare-fun c!38700 () Bool)

(assert (=> b!232683 (= c!38700 ((_ is MissingVacant!936) lt!117625))))

(assert (=> b!232683 (= e!151096 e!151109)))

(declare-fun b!232684 () Bool)

(declare-fun Unit!7177 () Unit!7174)

(assert (=> b!232684 (= e!151095 Unit!7177)))

(declare-fun lt!117615 () Unit!7174)

(declare-fun lemmaArrayContainsKeyThenInListMap!154 (array!11497 array!11495 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 64) (_ BitVec 32) Int) Unit!7174)

(assert (=> b!232684 (= lt!117615 (lemmaArrayContainsKeyThenInListMap!154 (_keys!6383 thiss!1504) (_values!4312 thiss!1504) (mask!10245 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4329 thiss!1504)))))

(assert (=> b!232684 false))

(declare-fun bm!21614 () Bool)

(assert (=> bm!21614 (= call!21618 (arrayContainsKey!0 (_keys!6383 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232685 () Bool)

(declare-fun res!114236 () Bool)

(assert (=> b!232685 (= res!114236 (= (select (arr!5468 (_keys!6383 thiss!1504)) (index!5917 lt!117625)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!232685 (=> (not res!114236) (not e!151098))))

(declare-fun bm!21615 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21615 (= call!21617 (inRange!0 (ite c!38698 (index!5914 lt!117625) (index!5917 lt!117625)) (mask!10245 thiss!1504)))))

(declare-fun b!232686 () Bool)

(assert (=> b!232686 (= e!151100 true)))

(declare-fun lt!117619 () Bool)

(declare-fun map!2568 (LongMapFixedSize!3340) ListLongMap!3433)

(assert (=> b!232686 (= lt!117619 (contains!1614 (map!2568 lt!117618) key!932))))

(declare-fun b!232687 () Bool)

(assert (=> b!232687 (= e!151098 (not call!21618))))

(declare-fun b!232688 () Bool)

(declare-fun Unit!7178 () Unit!7174)

(assert (=> b!232688 (= e!151102 Unit!7178)))

(declare-fun lt!117627 () Unit!7174)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!316 (array!11497 array!11495 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 64) Int) Unit!7174)

(assert (=> b!232688 (= lt!117627 (lemmaInListMapThenSeekEntryOrOpenFindsIt!316 (_keys!6383 thiss!1504) (_values!4312 thiss!1504) (mask!10245 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) key!932 (defaultEntry!4329 thiss!1504)))))

(assert (=> b!232688 false))

(declare-fun b!232689 () Bool)

(assert (=> b!232689 (= e!151099 e!151108)))

(declare-fun res!114240 () Bool)

(assert (=> b!232689 (=> (not res!114240) (not e!151108))))

(assert (=> b!232689 (= res!114240 (inRange!0 index!297 (mask!10245 thiss!1504)))))

(declare-fun lt!117623 () Unit!7174)

(assert (=> b!232689 (= lt!117623 e!151102)))

(declare-fun c!38699 () Bool)

(assert (=> b!232689 (= c!38699 (contains!1614 lt!117612 key!932))))

(assert (=> b!232689 (= lt!117612 (getCurrentListMap!1264 (_keys!6383 thiss!1504) (_values!4312 thiss!1504) (mask!10245 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4329 thiss!1504)))))

(assert (= (and start!22202 res!114241) b!232676))

(assert (= (and b!232676 res!114234) b!232682))

(assert (= (and b!232682 res!114235) b!232689))

(assert (= (and b!232689 c!38699) b!232688))

(assert (= (and b!232689 (not c!38699)) b!232674))

(assert (= (and b!232674 c!38698) b!232669))

(assert (= (and b!232674 (not c!38698)) b!232683))

(assert (= (and b!232669 res!114233) b!232677))

(assert (= (and b!232677 res!114237) b!232672))

(assert (= (and b!232683 c!38700) b!232675))

(assert (= (and b!232683 (not c!38700)) b!232671))

(assert (= (and b!232675 res!114239) b!232685))

(assert (= (and b!232685 res!114236) b!232687))

(assert (= (or b!232669 b!232675) bm!21615))

(assert (= (or b!232672 b!232687) bm!21614))

(assert (= (and b!232689 res!114240) b!232678))

(assert (= (and b!232678 c!38701) b!232684))

(assert (= (and b!232678 (not c!38701)) b!232681))

(assert (= (and b!232678 (not res!114238)) b!232686))

(assert (= (and b!232680 condMapEmpty!10360) mapIsEmpty!10360))

(assert (= (and b!232680 (not condMapEmpty!10360)) mapNonEmpty!10360))

(assert (= (and mapNonEmpty!10360 ((_ is ValueCellFull!2720) mapValue!10360)) b!232673))

(assert (= (and b!232680 ((_ is ValueCellFull!2720) mapDefault!10360)) b!232679))

(assert (= b!232670 b!232680))

(assert (= start!22202 b!232670))

(declare-fun m!254251 () Bool)

(assert (=> b!232678 m!254251))

(declare-fun m!254253 () Bool)

(assert (=> b!232678 m!254253))

(declare-fun m!254255 () Bool)

(assert (=> b!232678 m!254255))

(declare-fun m!254257 () Bool)

(assert (=> b!232678 m!254257))

(declare-fun m!254259 () Bool)

(assert (=> b!232678 m!254259))

(declare-fun m!254261 () Bool)

(assert (=> b!232678 m!254261))

(declare-fun m!254263 () Bool)

(assert (=> b!232678 m!254263))

(declare-fun m!254265 () Bool)

(assert (=> b!232678 m!254265))

(declare-fun m!254267 () Bool)

(assert (=> b!232678 m!254267))

(declare-fun m!254269 () Bool)

(assert (=> b!232678 m!254269))

(declare-fun m!254271 () Bool)

(assert (=> b!232678 m!254271))

(declare-fun m!254273 () Bool)

(assert (=> b!232678 m!254273))

(declare-fun m!254275 () Bool)

(assert (=> b!232678 m!254275))

(declare-fun m!254277 () Bool)

(assert (=> b!232678 m!254277))

(declare-fun m!254279 () Bool)

(assert (=> b!232678 m!254279))

(declare-fun m!254281 () Bool)

(assert (=> b!232678 m!254281))

(declare-fun m!254283 () Bool)

(assert (=> b!232678 m!254283))

(declare-fun m!254285 () Bool)

(assert (=> b!232678 m!254285))

(declare-fun m!254287 () Bool)

(assert (=> b!232678 m!254287))

(declare-fun m!254289 () Bool)

(assert (=> b!232678 m!254289))

(assert (=> bm!21614 m!254251))

(declare-fun m!254291 () Bool)

(assert (=> mapNonEmpty!10360 m!254291))

(declare-fun m!254293 () Bool)

(assert (=> bm!21615 m!254293))

(declare-fun m!254295 () Bool)

(assert (=> start!22202 m!254295))

(declare-fun m!254297 () Bool)

(assert (=> b!232686 m!254297))

(assert (=> b!232686 m!254297))

(declare-fun m!254299 () Bool)

(assert (=> b!232686 m!254299))

(declare-fun m!254301 () Bool)

(assert (=> b!232684 m!254301))

(declare-fun m!254303 () Bool)

(assert (=> b!232688 m!254303))

(declare-fun m!254305 () Bool)

(assert (=> b!232682 m!254305))

(declare-fun m!254307 () Bool)

(assert (=> b!232674 m!254307))

(declare-fun m!254309 () Bool)

(assert (=> b!232689 m!254309))

(declare-fun m!254311 () Bool)

(assert (=> b!232689 m!254311))

(declare-fun m!254313 () Bool)

(assert (=> b!232689 m!254313))

(declare-fun m!254315 () Bool)

(assert (=> b!232677 m!254315))

(declare-fun m!254317 () Bool)

(assert (=> b!232685 m!254317))

(declare-fun m!254319 () Bool)

(assert (=> b!232670 m!254319))

(declare-fun m!254321 () Bool)

(assert (=> b!232670 m!254321))

(check-sat (not b!232689) (not b!232678) (not bm!21614) (not b!232688) (not b_next!6265) b_and!13177 (not mapNonEmpty!10360) (not b!232686) (not b!232670) (not b!232674) (not b!232684) (not b!232682) tp_is_empty!6127 (not start!22202) (not bm!21615))
(check-sat b_and!13177 (not b_next!6265))
