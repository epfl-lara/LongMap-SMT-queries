; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23490 () Bool)

(assert start!23490)

(declare-fun b!246698 () Bool)

(declare-fun b_free!6571 () Bool)

(declare-fun b_next!6571 () Bool)

(assert (=> b!246698 (= b_free!6571 (not b_next!6571))))

(declare-fun tp!22954 () Bool)

(declare-fun b_and!13583 () Bool)

(assert (=> b!246698 (= tp!22954 b_and!13583)))

(declare-fun res!120955 () Bool)

(declare-fun e!160040 () Bool)

(assert (=> start!23490 (=> (not res!120955) (not e!160040))))

(declare-datatypes ((V!8225 0))(
  ( (V!8226 (val!3261 Int)) )
))
(declare-datatypes ((ValueCell!2873 0))(
  ( (ValueCellFull!2873 (v!5318 V!8225)) (EmptyCell!2873) )
))
(declare-datatypes ((array!12167 0))(
  ( (array!12168 (arr!5773 (Array (_ BitVec 32) ValueCell!2873)) (size!6116 (_ BitVec 32))) )
))
(declare-datatypes ((array!12169 0))(
  ( (array!12170 (arr!5774 (Array (_ BitVec 32) (_ BitVec 64))) (size!6117 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3646 0))(
  ( (LongMapFixedSize!3647 (defaultEntry!4564 Int) (mask!10692 (_ BitVec 32)) (extraKeys!4301 (_ BitVec 32)) (zeroValue!4405 V!8225) (minValue!4405 V!8225) (_size!1872 (_ BitVec 32)) (_keys!6684 array!12169) (_values!4547 array!12167) (_vacant!1872 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3646)

(declare-fun valid!1438 (LongMapFixedSize!3646) Bool)

(assert (=> start!23490 (= res!120955 (valid!1438 thiss!1504))))

(assert (=> start!23490 e!160040))

(declare-fun e!160035 () Bool)

(assert (=> start!23490 e!160035))

(assert (=> start!23490 true))

(declare-fun mapIsEmpty!10919 () Bool)

(declare-fun mapRes!10919 () Bool)

(assert (=> mapIsEmpty!10919 mapRes!10919))

(declare-fun b!246693 () Bool)

(declare-fun e!160026 () Bool)

(assert (=> b!246693 (= e!160040 e!160026)))

(declare-fun res!120947 () Bool)

(assert (=> b!246693 (=> (not res!120947) (not e!160026))))

(declare-datatypes ((SeekEntryResult!1062 0))(
  ( (MissingZero!1062 (index!6418 (_ BitVec 32))) (Found!1062 (index!6419 (_ BitVec 32))) (Intermediate!1062 (undefined!1874 Bool) (index!6420 (_ BitVec 32)) (x!24454 (_ BitVec 32))) (Undefined!1062) (MissingVacant!1062 (index!6421 (_ BitVec 32))) )
))
(declare-fun lt!123599 () SeekEntryResult!1062)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!246693 (= res!120947 (or (= lt!123599 (MissingZero!1062 index!297)) (= lt!123599 (MissingVacant!1062 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12169 (_ BitVec 32)) SeekEntryResult!1062)

(assert (=> b!246693 (= lt!123599 (seekEntryOrOpen!0 key!932 (_keys!6684 thiss!1504) (mask!10692 thiss!1504)))))

(declare-fun b!246694 () Bool)

(declare-fun res!120952 () Bool)

(declare-fun e!160028 () Bool)

(assert (=> b!246694 (=> (not res!120952) (not e!160028))))

(assert (=> b!246694 (= res!120952 (= (select (arr!5774 (_keys!6684 thiss!1504)) (index!6418 lt!123599)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246695 () Bool)

(declare-fun e!160034 () Bool)

(declare-fun e!160033 () Bool)

(assert (=> b!246695 (= e!160034 (and e!160033 mapRes!10919))))

(declare-fun condMapEmpty!10919 () Bool)

(declare-fun mapDefault!10919 () ValueCell!2873)

(assert (=> b!246695 (= condMapEmpty!10919 (= (arr!5773 (_values!4547 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2873)) mapDefault!10919)))))

(declare-fun c!41273 () Bool)

(declare-fun bm!23051 () Bool)

(declare-fun call!23055 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23051 (= call!23055 (inRange!0 (ite c!41273 (index!6418 lt!123599) (index!6421 lt!123599)) (mask!10692 thiss!1504)))))

(declare-fun b!246696 () Bool)

(declare-fun call!23054 () Bool)

(assert (=> b!246696 (= e!160028 (not call!23054))))

(declare-fun bm!23052 () Bool)

(declare-fun arrayContainsKey!0 (array!12169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23052 (= call!23054 (arrayContainsKey!0 (_keys!6684 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10919 () Bool)

(declare-fun tp!22955 () Bool)

(declare-fun e!160030 () Bool)

(assert (=> mapNonEmpty!10919 (= mapRes!10919 (and tp!22955 e!160030))))

(declare-fun mapKey!10919 () (_ BitVec 32))

(declare-fun mapValue!10919 () ValueCell!2873)

(declare-fun mapRest!10919 () (Array (_ BitVec 32) ValueCell!2873))

(assert (=> mapNonEmpty!10919 (= (arr!5773 (_values!4547 thiss!1504)) (store mapRest!10919 mapKey!10919 mapValue!10919))))

(declare-fun b!246697 () Bool)

(declare-fun e!160036 () Bool)

(declare-fun e!160037 () Bool)

(assert (=> b!246697 (= e!160036 (not e!160037))))

(declare-fun res!120951 () Bool)

(assert (=> b!246697 (=> res!120951 e!160037)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!246697 (= res!120951 (not (validMask!0 (mask!10692 thiss!1504))))))

(declare-fun lt!123596 () array!12169)

(declare-fun arrayCountValidKeys!0 (array!12169 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!246697 (= (arrayCountValidKeys!0 lt!123596 #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6684 thiss!1504) #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504)))))))

(declare-datatypes ((Unit!7598 0))(
  ( (Unit!7599) )
))
(declare-fun lt!123592 () Unit!7598)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12169 (_ BitVec 32) (_ BitVec 64)) Unit!7598)

(assert (=> b!246697 (= lt!123592 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6684 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3606 0))(
  ( (Nil!3603) (Cons!3602 (h!4260 (_ BitVec 64)) (t!8617 List!3606)) )
))
(declare-fun arrayNoDuplicates!0 (array!12169 (_ BitVec 32) List!3606) Bool)

(assert (=> b!246697 (arrayNoDuplicates!0 lt!123596 #b00000000000000000000000000000000 Nil!3603)))

(assert (=> b!246697 (= lt!123596 (array!12170 (store (arr!5774 (_keys!6684 thiss!1504)) index!297 key!932) (size!6117 (_keys!6684 thiss!1504))))))

(declare-fun lt!123600 () Unit!7598)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12169 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3606) Unit!7598)

(assert (=> b!246697 (= lt!123600 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6684 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3603))))

(declare-fun lt!123598 () Unit!7598)

(declare-fun e!160027 () Unit!7598)

(assert (=> b!246697 (= lt!123598 e!160027)))

(declare-fun c!41271 () Bool)

(assert (=> b!246697 (= c!41271 (arrayContainsKey!0 (_keys!6684 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun tp_is_empty!6433 () Bool)

(declare-fun array_inv!3797 (array!12169) Bool)

(declare-fun array_inv!3798 (array!12167) Bool)

(assert (=> b!246698 (= e!160035 (and tp!22954 tp_is_empty!6433 (array_inv!3797 (_keys!6684 thiss!1504)) (array_inv!3798 (_values!4547 thiss!1504)) e!160034))))

(declare-fun b!246699 () Bool)

(declare-fun res!120948 () Bool)

(assert (=> b!246699 (=> (not res!120948) (not e!160028))))

(assert (=> b!246699 (= res!120948 call!23055)))

(declare-fun e!160031 () Bool)

(assert (=> b!246699 (= e!160031 e!160028)))

(declare-fun b!246700 () Bool)

(assert (=> b!246700 (= e!160026 e!160036)))

(declare-fun res!120950 () Bool)

(assert (=> b!246700 (=> (not res!120950) (not e!160036))))

(assert (=> b!246700 (= res!120950 (inRange!0 index!297 (mask!10692 thiss!1504)))))

(declare-fun lt!123593 () Unit!7598)

(declare-fun e!160039 () Unit!7598)

(assert (=> b!246700 (= lt!123593 e!160039)))

(declare-fun c!41270 () Bool)

(declare-datatypes ((tuple2!4730 0))(
  ( (tuple2!4731 (_1!2376 (_ BitVec 64)) (_2!2376 V!8225)) )
))
(declare-datatypes ((List!3607 0))(
  ( (Nil!3604) (Cons!3603 (h!4261 tuple2!4730) (t!8618 List!3607)) )
))
(declare-datatypes ((ListLongMap!3645 0))(
  ( (ListLongMap!3646 (toList!1838 List!3607)) )
))
(declare-fun contains!1766 (ListLongMap!3645 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1370 (array!12169 array!12167 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 32) Int) ListLongMap!3645)

(assert (=> b!246700 (= c!41270 (contains!1766 (getCurrentListMap!1370 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)) key!932))))

(declare-fun b!246701 () Bool)

(declare-fun Unit!7600 () Unit!7598)

(assert (=> b!246701 (= e!160039 Unit!7600)))

(declare-fun lt!123595 () Unit!7598)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!375 (array!12169 array!12167 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) Int) Unit!7598)

(assert (=> b!246701 (= lt!123595 (lemmaInListMapThenSeekEntryOrOpenFindsIt!375 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)))))

(assert (=> b!246701 false))

(declare-fun b!246702 () Bool)

(assert (=> b!246702 (= e!160037 (or (not (= (size!6117 (_keys!6684 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10692 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6117 (_keys!6684 thiss!1504)))))))

(declare-fun b!246703 () Bool)

(declare-fun e!160032 () Bool)

(assert (=> b!246703 (= e!160032 (not call!23054))))

(declare-fun b!246704 () Bool)

(declare-fun res!120954 () Bool)

(assert (=> b!246704 (= res!120954 (= (select (arr!5774 (_keys!6684 thiss!1504)) (index!6421 lt!123599)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246704 (=> (not res!120954) (not e!160032))))

(declare-fun b!246705 () Bool)

(declare-fun e!160029 () Bool)

(assert (=> b!246705 (= e!160029 e!160032)))

(declare-fun res!120949 () Bool)

(assert (=> b!246705 (= res!120949 call!23055)))

(assert (=> b!246705 (=> (not res!120949) (not e!160032))))

(declare-fun b!246706 () Bool)

(declare-fun lt!123597 () Unit!7598)

(assert (=> b!246706 (= e!160039 lt!123597)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!368 (array!12169 array!12167 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) Int) Unit!7598)

(assert (=> b!246706 (= lt!123597 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!368 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)))))

(get-info :version)

(assert (=> b!246706 (= c!41273 ((_ is MissingZero!1062) lt!123599))))

(assert (=> b!246706 e!160031))

(declare-fun b!246707 () Bool)

(declare-fun Unit!7601 () Unit!7598)

(assert (=> b!246707 (= e!160027 Unit!7601)))

(declare-fun b!246708 () Bool)

(assert (=> b!246708 (= e!160029 ((_ is Undefined!1062) lt!123599))))

(declare-fun b!246709 () Bool)

(declare-fun c!41272 () Bool)

(assert (=> b!246709 (= c!41272 ((_ is MissingVacant!1062) lt!123599))))

(assert (=> b!246709 (= e!160031 e!160029)))

(declare-fun b!246710 () Bool)

(declare-fun res!120953 () Bool)

(assert (=> b!246710 (=> (not res!120953) (not e!160040))))

(assert (=> b!246710 (= res!120953 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!246711 () Bool)

(assert (=> b!246711 (= e!160033 tp_is_empty!6433)))

(declare-fun b!246712 () Bool)

(assert (=> b!246712 (= e!160030 tp_is_empty!6433)))

(declare-fun b!246713 () Bool)

(declare-fun Unit!7602 () Unit!7598)

(assert (=> b!246713 (= e!160027 Unit!7602)))

(declare-fun lt!123594 () Unit!7598)

(declare-fun lemmaArrayContainsKeyThenInListMap!192 (array!12169 array!12167 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) (_ BitVec 32) Int) Unit!7598)

(assert (=> b!246713 (= lt!123594 (lemmaArrayContainsKeyThenInListMap!192 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(assert (=> b!246713 false))

(assert (= (and start!23490 res!120955) b!246710))

(assert (= (and b!246710 res!120953) b!246693))

(assert (= (and b!246693 res!120947) b!246700))

(assert (= (and b!246700 c!41270) b!246701))

(assert (= (and b!246700 (not c!41270)) b!246706))

(assert (= (and b!246706 c!41273) b!246699))

(assert (= (and b!246706 (not c!41273)) b!246709))

(assert (= (and b!246699 res!120948) b!246694))

(assert (= (and b!246694 res!120952) b!246696))

(assert (= (and b!246709 c!41272) b!246705))

(assert (= (and b!246709 (not c!41272)) b!246708))

(assert (= (and b!246705 res!120949) b!246704))

(assert (= (and b!246704 res!120954) b!246703))

(assert (= (or b!246699 b!246705) bm!23051))

(assert (= (or b!246696 b!246703) bm!23052))

(assert (= (and b!246700 res!120950) b!246697))

(assert (= (and b!246697 c!41271) b!246713))

(assert (= (and b!246697 (not c!41271)) b!246707))

(assert (= (and b!246697 (not res!120951)) b!246702))

(assert (= (and b!246695 condMapEmpty!10919) mapIsEmpty!10919))

(assert (= (and b!246695 (not condMapEmpty!10919)) mapNonEmpty!10919))

(assert (= (and mapNonEmpty!10919 ((_ is ValueCellFull!2873) mapValue!10919)) b!246712))

(assert (= (and b!246695 ((_ is ValueCellFull!2873) mapDefault!10919)) b!246711))

(assert (= b!246698 b!246695))

(assert (= start!23490 b!246698))

(declare-fun m!264143 () Bool)

(assert (=> b!246698 m!264143))

(declare-fun m!264145 () Bool)

(assert (=> b!246698 m!264145))

(declare-fun m!264147 () Bool)

(assert (=> start!23490 m!264147))

(declare-fun m!264149 () Bool)

(assert (=> b!246701 m!264149))

(declare-fun m!264151 () Bool)

(assert (=> b!246697 m!264151))

(declare-fun m!264153 () Bool)

(assert (=> b!246697 m!264153))

(declare-fun m!264155 () Bool)

(assert (=> b!246697 m!264155))

(declare-fun m!264157 () Bool)

(assert (=> b!246697 m!264157))

(declare-fun m!264159 () Bool)

(assert (=> b!246697 m!264159))

(declare-fun m!264161 () Bool)

(assert (=> b!246697 m!264161))

(declare-fun m!264163 () Bool)

(assert (=> b!246697 m!264163))

(declare-fun m!264165 () Bool)

(assert (=> b!246697 m!264165))

(declare-fun m!264167 () Bool)

(assert (=> b!246693 m!264167))

(declare-fun m!264169 () Bool)

(assert (=> bm!23051 m!264169))

(declare-fun m!264171 () Bool)

(assert (=> b!246713 m!264171))

(declare-fun m!264173 () Bool)

(assert (=> b!246694 m!264173))

(declare-fun m!264175 () Bool)

(assert (=> b!246704 m!264175))

(declare-fun m!264177 () Bool)

(assert (=> b!246706 m!264177))

(declare-fun m!264179 () Bool)

(assert (=> b!246700 m!264179))

(declare-fun m!264181 () Bool)

(assert (=> b!246700 m!264181))

(assert (=> b!246700 m!264181))

(declare-fun m!264183 () Bool)

(assert (=> b!246700 m!264183))

(declare-fun m!264185 () Bool)

(assert (=> mapNonEmpty!10919 m!264185))

(assert (=> bm!23052 m!264153))

(check-sat (not b_next!6571) (not bm!23051) (not b!246706) (not mapNonEmpty!10919) (not start!23490) tp_is_empty!6433 (not b!246693) (not bm!23052) b_and!13583 (not b!246713) (not b!246701) (not b!246700) (not b!246697) (not b!246698))
(check-sat b_and!13583 (not b_next!6571))
(get-model)

(declare-fun d!60475 () Bool)

(assert (=> d!60475 (= (inRange!0 (ite c!41273 (index!6418 lt!123599) (index!6421 lt!123599)) (mask!10692 thiss!1504)) (and (bvsge (ite c!41273 (index!6418 lt!123599) (index!6421 lt!123599)) #b00000000000000000000000000000000) (bvslt (ite c!41273 (index!6418 lt!123599) (index!6421 lt!123599)) (bvadd (mask!10692 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23051 d!60475))

(declare-fun d!60477 () Bool)

(declare-fun res!121014 () Bool)

(declare-fun e!160135 () Bool)

(assert (=> d!60477 (=> res!121014 e!160135)))

(assert (=> d!60477 (= res!121014 (= (select (arr!5774 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60477 (= (arrayContainsKey!0 (_keys!6684 thiss!1504) key!932 #b00000000000000000000000000000000) e!160135)))

(declare-fun b!246844 () Bool)

(declare-fun e!160136 () Bool)

(assert (=> b!246844 (= e!160135 e!160136)))

(declare-fun res!121015 () Bool)

(assert (=> b!246844 (=> (not res!121015) (not e!160136))))

(assert (=> b!246844 (= res!121015 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6117 (_keys!6684 thiss!1504))))))

(declare-fun b!246845 () Bool)

(assert (=> b!246845 (= e!160136 (arrayContainsKey!0 (_keys!6684 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60477 (not res!121014)) b!246844))

(assert (= (and b!246844 res!121015) b!246845))

(declare-fun m!264275 () Bool)

(assert (=> d!60477 m!264275))

(declare-fun m!264277 () Bool)

(assert (=> b!246845 m!264277))

(assert (=> bm!23052 d!60477))

(declare-fun call!23073 () Bool)

(declare-fun c!41302 () Bool)

(declare-fun bm!23069 () Bool)

(declare-fun lt!123659 () SeekEntryResult!1062)

(assert (=> bm!23069 (= call!23073 (inRange!0 (ite c!41302 (index!6418 lt!123659) (index!6421 lt!123659)) (mask!10692 thiss!1504)))))

(declare-fun b!246862 () Bool)

(assert (=> b!246862 (and (bvsge (index!6418 lt!123659) #b00000000000000000000000000000000) (bvslt (index!6418 lt!123659) (size!6117 (_keys!6684 thiss!1504))))))

(declare-fun res!121025 () Bool)

(assert (=> b!246862 (= res!121025 (= (select (arr!5774 (_keys!6684 thiss!1504)) (index!6418 lt!123659)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160146 () Bool)

(assert (=> b!246862 (=> (not res!121025) (not e!160146))))

(declare-fun d!60479 () Bool)

(declare-fun e!160145 () Bool)

(assert (=> d!60479 e!160145))

(assert (=> d!60479 (= c!41302 ((_ is MissingZero!1062) lt!123659))))

(assert (=> d!60479 (= lt!123659 (seekEntryOrOpen!0 key!932 (_keys!6684 thiss!1504) (mask!10692 thiss!1504)))))

(declare-fun lt!123660 () Unit!7598)

(declare-fun choose!1165 (array!12169 array!12167 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) Int) Unit!7598)

(assert (=> d!60479 (= lt!123660 (choose!1165 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)))))

(assert (=> d!60479 (validMask!0 (mask!10692 thiss!1504))))

(assert (=> d!60479 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!368 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)) lt!123660)))

(declare-fun b!246863 () Bool)

(declare-fun res!121024 () Bool)

(declare-fun e!160147 () Bool)

(assert (=> b!246863 (=> (not res!121024) (not e!160147))))

(assert (=> b!246863 (= res!121024 call!23073)))

(declare-fun e!160148 () Bool)

(assert (=> b!246863 (= e!160148 e!160147)))

(declare-fun bm!23070 () Bool)

(declare-fun call!23072 () Bool)

(assert (=> bm!23070 (= call!23072 (arrayContainsKey!0 (_keys!6684 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246864 () Bool)

(assert (=> b!246864 (= e!160146 (not call!23072))))

(declare-fun b!246865 () Bool)

(assert (=> b!246865 (= e!160145 e!160148)))

(declare-fun c!41303 () Bool)

(assert (=> b!246865 (= c!41303 ((_ is MissingVacant!1062) lt!123659))))

(declare-fun b!246866 () Bool)

(assert (=> b!246866 (= e!160147 (not call!23072))))

(declare-fun b!246867 () Bool)

(assert (=> b!246867 (= e!160148 ((_ is Undefined!1062) lt!123659))))

(declare-fun b!246868 () Bool)

(declare-fun res!121027 () Bool)

(assert (=> b!246868 (=> (not res!121027) (not e!160147))))

(assert (=> b!246868 (= res!121027 (= (select (arr!5774 (_keys!6684 thiss!1504)) (index!6421 lt!123659)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246868 (and (bvsge (index!6421 lt!123659) #b00000000000000000000000000000000) (bvslt (index!6421 lt!123659) (size!6117 (_keys!6684 thiss!1504))))))

(declare-fun b!246869 () Bool)

(assert (=> b!246869 (= e!160145 e!160146)))

(declare-fun res!121026 () Bool)

(assert (=> b!246869 (= res!121026 call!23073)))

(assert (=> b!246869 (=> (not res!121026) (not e!160146))))

(assert (= (and d!60479 c!41302) b!246869))

(assert (= (and d!60479 (not c!41302)) b!246865))

(assert (= (and b!246869 res!121026) b!246862))

(assert (= (and b!246862 res!121025) b!246864))

(assert (= (and b!246865 c!41303) b!246863))

(assert (= (and b!246865 (not c!41303)) b!246867))

(assert (= (and b!246863 res!121024) b!246868))

(assert (= (and b!246868 res!121027) b!246866))

(assert (= (or b!246869 b!246863) bm!23069))

(assert (= (or b!246864 b!246866) bm!23070))

(declare-fun m!264279 () Bool)

(assert (=> b!246862 m!264279))

(declare-fun m!264281 () Bool)

(assert (=> bm!23069 m!264281))

(assert (=> d!60479 m!264167))

(declare-fun m!264283 () Bool)

(assert (=> d!60479 m!264283))

(assert (=> d!60479 m!264151))

(assert (=> bm!23070 m!264153))

(declare-fun m!264285 () Bool)

(assert (=> b!246868 m!264285))

(assert (=> b!246706 d!60479))

(declare-fun b!246882 () Bool)

(declare-fun e!160157 () SeekEntryResult!1062)

(declare-fun e!160155 () SeekEntryResult!1062)

(assert (=> b!246882 (= e!160157 e!160155)))

(declare-fun lt!123667 () (_ BitVec 64))

(declare-fun lt!123669 () SeekEntryResult!1062)

(assert (=> b!246882 (= lt!123667 (select (arr!5774 (_keys!6684 thiss!1504)) (index!6420 lt!123669)))))

(declare-fun c!41312 () Bool)

(assert (=> b!246882 (= c!41312 (= lt!123667 key!932))))

(declare-fun e!160156 () SeekEntryResult!1062)

(declare-fun b!246883 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12169 (_ BitVec 32)) SeekEntryResult!1062)

(assert (=> b!246883 (= e!160156 (seekKeyOrZeroReturnVacant!0 (x!24454 lt!123669) (index!6420 lt!123669) (index!6420 lt!123669) key!932 (_keys!6684 thiss!1504) (mask!10692 thiss!1504)))))

(declare-fun b!246884 () Bool)

(assert (=> b!246884 (= e!160157 Undefined!1062)))

(declare-fun b!246885 () Bool)

(assert (=> b!246885 (= e!160155 (Found!1062 (index!6420 lt!123669)))))

(declare-fun d!60481 () Bool)

(declare-fun lt!123668 () SeekEntryResult!1062)

(assert (=> d!60481 (and (or ((_ is Undefined!1062) lt!123668) (not ((_ is Found!1062) lt!123668)) (and (bvsge (index!6419 lt!123668) #b00000000000000000000000000000000) (bvslt (index!6419 lt!123668) (size!6117 (_keys!6684 thiss!1504))))) (or ((_ is Undefined!1062) lt!123668) ((_ is Found!1062) lt!123668) (not ((_ is MissingZero!1062) lt!123668)) (and (bvsge (index!6418 lt!123668) #b00000000000000000000000000000000) (bvslt (index!6418 lt!123668) (size!6117 (_keys!6684 thiss!1504))))) (or ((_ is Undefined!1062) lt!123668) ((_ is Found!1062) lt!123668) ((_ is MissingZero!1062) lt!123668) (not ((_ is MissingVacant!1062) lt!123668)) (and (bvsge (index!6421 lt!123668) #b00000000000000000000000000000000) (bvslt (index!6421 lt!123668) (size!6117 (_keys!6684 thiss!1504))))) (or ((_ is Undefined!1062) lt!123668) (ite ((_ is Found!1062) lt!123668) (= (select (arr!5774 (_keys!6684 thiss!1504)) (index!6419 lt!123668)) key!932) (ite ((_ is MissingZero!1062) lt!123668) (= (select (arr!5774 (_keys!6684 thiss!1504)) (index!6418 lt!123668)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1062) lt!123668) (= (select (arr!5774 (_keys!6684 thiss!1504)) (index!6421 lt!123668)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60481 (= lt!123668 e!160157)))

(declare-fun c!41311 () Bool)

(assert (=> d!60481 (= c!41311 (and ((_ is Intermediate!1062) lt!123669) (undefined!1874 lt!123669)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12169 (_ BitVec 32)) SeekEntryResult!1062)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60481 (= lt!123669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10692 thiss!1504)) key!932 (_keys!6684 thiss!1504) (mask!10692 thiss!1504)))))

(assert (=> d!60481 (validMask!0 (mask!10692 thiss!1504))))

(assert (=> d!60481 (= (seekEntryOrOpen!0 key!932 (_keys!6684 thiss!1504) (mask!10692 thiss!1504)) lt!123668)))

(declare-fun b!246886 () Bool)

(declare-fun c!41310 () Bool)

(assert (=> b!246886 (= c!41310 (= lt!123667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246886 (= e!160155 e!160156)))

(declare-fun b!246887 () Bool)

(assert (=> b!246887 (= e!160156 (MissingZero!1062 (index!6420 lt!123669)))))

(assert (= (and d!60481 c!41311) b!246884))

(assert (= (and d!60481 (not c!41311)) b!246882))

(assert (= (and b!246882 c!41312) b!246885))

(assert (= (and b!246882 (not c!41312)) b!246886))

(assert (= (and b!246886 c!41310) b!246887))

(assert (= (and b!246886 (not c!41310)) b!246883))

(declare-fun m!264287 () Bool)

(assert (=> b!246882 m!264287))

(declare-fun m!264289 () Bool)

(assert (=> b!246883 m!264289))

(declare-fun m!264291 () Bool)

(assert (=> d!60481 m!264291))

(assert (=> d!60481 m!264151))

(declare-fun m!264293 () Bool)

(assert (=> d!60481 m!264293))

(declare-fun m!264295 () Bool)

(assert (=> d!60481 m!264295))

(assert (=> d!60481 m!264293))

(declare-fun m!264297 () Bool)

(assert (=> d!60481 m!264297))

(declare-fun m!264299 () Bool)

(assert (=> d!60481 m!264299))

(assert (=> b!246693 d!60481))

(declare-fun d!60483 () Bool)

(assert (=> d!60483 (= (inRange!0 index!297 (mask!10692 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10692 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!246700 d!60483))

(declare-fun d!60485 () Bool)

(declare-fun e!160163 () Bool)

(assert (=> d!60485 e!160163))

(declare-fun res!121030 () Bool)

(assert (=> d!60485 (=> res!121030 e!160163)))

(declare-fun lt!123680 () Bool)

(assert (=> d!60485 (= res!121030 (not lt!123680))))

(declare-fun lt!123681 () Bool)

(assert (=> d!60485 (= lt!123680 lt!123681)))

(declare-fun lt!123678 () Unit!7598)

(declare-fun e!160162 () Unit!7598)

(assert (=> d!60485 (= lt!123678 e!160162)))

(declare-fun c!41315 () Bool)

(assert (=> d!60485 (= c!41315 lt!123681)))

(declare-fun containsKey!283 (List!3607 (_ BitVec 64)) Bool)

(assert (=> d!60485 (= lt!123681 (containsKey!283 (toList!1838 (getCurrentListMap!1370 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504))) key!932))))

(assert (=> d!60485 (= (contains!1766 (getCurrentListMap!1370 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)) key!932) lt!123680)))

(declare-fun b!246894 () Bool)

(declare-fun lt!123679 () Unit!7598)

(assert (=> b!246894 (= e!160162 lt!123679)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!231 (List!3607 (_ BitVec 64)) Unit!7598)

(assert (=> b!246894 (= lt!123679 (lemmaContainsKeyImpliesGetValueByKeyDefined!231 (toList!1838 (getCurrentListMap!1370 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504))) key!932))))

(declare-datatypes ((Option!298 0))(
  ( (Some!297 (v!5321 V!8225)) (None!296) )
))
(declare-fun isDefined!232 (Option!298) Bool)

(declare-fun getValueByKey!292 (List!3607 (_ BitVec 64)) Option!298)

(assert (=> b!246894 (isDefined!232 (getValueByKey!292 (toList!1838 (getCurrentListMap!1370 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504))) key!932))))

(declare-fun b!246895 () Bool)

(declare-fun Unit!7611 () Unit!7598)

(assert (=> b!246895 (= e!160162 Unit!7611)))

(declare-fun b!246896 () Bool)

(assert (=> b!246896 (= e!160163 (isDefined!232 (getValueByKey!292 (toList!1838 (getCurrentListMap!1370 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504))) key!932)))))

(assert (= (and d!60485 c!41315) b!246894))

(assert (= (and d!60485 (not c!41315)) b!246895))

(assert (= (and d!60485 (not res!121030)) b!246896))

(declare-fun m!264301 () Bool)

(assert (=> d!60485 m!264301))

(declare-fun m!264303 () Bool)

(assert (=> b!246894 m!264303))

(declare-fun m!264305 () Bool)

(assert (=> b!246894 m!264305))

(assert (=> b!246894 m!264305))

(declare-fun m!264307 () Bool)

(assert (=> b!246894 m!264307))

(assert (=> b!246896 m!264305))

(assert (=> b!246896 m!264305))

(assert (=> b!246896 m!264307))

(assert (=> b!246700 d!60485))

(declare-fun b!246939 () Bool)

(declare-fun e!160202 () ListLongMap!3645)

(declare-fun call!23089 () ListLongMap!3645)

(assert (=> b!246939 (= e!160202 call!23089)))

(declare-fun b!246940 () Bool)

(declare-fun e!160192 () Bool)

(declare-fun lt!123736 () ListLongMap!3645)

(declare-fun apply!233 (ListLongMap!3645 (_ BitVec 64)) V!8225)

(declare-fun get!2972 (ValueCell!2873 V!8225) V!8225)

(declare-fun dynLambda!576 (Int (_ BitVec 64)) V!8225)

(assert (=> b!246940 (= e!160192 (= (apply!233 lt!123736 (select (arr!5774 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000)) (get!2972 (select (arr!5773 (_values!4547 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!576 (defaultEntry!4564 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!246940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6116 (_values!4547 thiss!1504))))))

(assert (=> b!246940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))))))

(declare-fun b!246941 () Bool)

(declare-fun e!160201 () ListLongMap!3645)

(assert (=> b!246941 (= e!160201 call!23089)))

(declare-fun bm!23085 () Bool)

(declare-fun call!23091 () Bool)

(assert (=> bm!23085 (= call!23091 (contains!1766 lt!123736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23086 () Bool)

(declare-fun call!23090 () ListLongMap!3645)

(assert (=> bm!23086 (= call!23089 call!23090)))

(declare-fun bm!23087 () Bool)

(declare-fun call!23088 () ListLongMap!3645)

(declare-fun call!23093 () ListLongMap!3645)

(assert (=> bm!23087 (= call!23088 call!23093)))

(declare-fun b!246942 () Bool)

(declare-fun e!160197 () Bool)

(assert (=> b!246942 (= e!160197 e!160192)))

(declare-fun res!121049 () Bool)

(assert (=> b!246942 (=> (not res!121049) (not e!160192))))

(assert (=> b!246942 (= res!121049 (contains!1766 lt!123736 (select (arr!5774 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246942 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))))))

(declare-fun b!246943 () Bool)

(declare-fun e!160195 () Bool)

(assert (=> b!246943 (= e!160195 (= (apply!233 lt!123736 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4405 thiss!1504)))))

(declare-fun d!60487 () Bool)

(declare-fun e!160191 () Bool)

(assert (=> d!60487 e!160191))

(declare-fun res!121054 () Bool)

(assert (=> d!60487 (=> (not res!121054) (not e!160191))))

(assert (=> d!60487 (= res!121054 (or (bvsge #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))))))))

(declare-fun lt!123738 () ListLongMap!3645)

(assert (=> d!60487 (= lt!123736 lt!123738)))

(declare-fun lt!123733 () Unit!7598)

(declare-fun e!160193 () Unit!7598)

(assert (=> d!60487 (= lt!123733 e!160193)))

(declare-fun c!41332 () Bool)

(declare-fun e!160196 () Bool)

(assert (=> d!60487 (= c!41332 e!160196)))

(declare-fun res!121052 () Bool)

(assert (=> d!60487 (=> (not res!121052) (not e!160196))))

(assert (=> d!60487 (= res!121052 (bvslt #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))))))

(declare-fun e!160190 () ListLongMap!3645)

(assert (=> d!60487 (= lt!123738 e!160190)))

(declare-fun c!41329 () Bool)

(assert (=> d!60487 (= c!41329 (and (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60487 (validMask!0 (mask!10692 thiss!1504))))

(assert (=> d!60487 (= (getCurrentListMap!1370 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)) lt!123736)))

(declare-fun bm!23088 () Bool)

(declare-fun call!23094 () ListLongMap!3645)

(declare-fun c!41328 () Bool)

(declare-fun +!660 (ListLongMap!3645 tuple2!4730) ListLongMap!3645)

(assert (=> bm!23088 (= call!23090 (+!660 (ite c!41329 call!23093 (ite c!41328 call!23088 call!23094)) (ite (or c!41329 c!41328) (tuple2!4731 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4405 thiss!1504)) (tuple2!4731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4405 thiss!1504)))))))

(declare-fun b!246944 () Bool)

(declare-fun e!160199 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!246944 (= e!160199 (validKeyInArray!0 (select (arr!5774 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246945 () Bool)

(assert (=> b!246945 (= e!160190 e!160201)))

(assert (=> b!246945 (= c!41328 (and (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!246946 () Bool)

(declare-fun c!41333 () Bool)

(assert (=> b!246946 (= c!41333 (and (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!246946 (= e!160201 e!160202)))

(declare-fun b!246947 () Bool)

(declare-fun e!160198 () Bool)

(assert (=> b!246947 (= e!160198 e!160195)))

(declare-fun res!121057 () Bool)

(declare-fun call!23092 () Bool)

(assert (=> b!246947 (= res!121057 call!23092)))

(assert (=> b!246947 (=> (not res!121057) (not e!160195))))

(declare-fun bm!23089 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!549 (array!12169 array!12167 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 32) Int) ListLongMap!3645)

(assert (=> bm!23089 (= call!23093 (getCurrentListMapNoExtraKeys!549 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(declare-fun b!246948 () Bool)

(assert (=> b!246948 (= e!160196 (validKeyInArray!0 (select (arr!5774 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246949 () Bool)

(declare-fun res!121050 () Bool)

(assert (=> b!246949 (=> (not res!121050) (not e!160191))))

(declare-fun e!160194 () Bool)

(assert (=> b!246949 (= res!121050 e!160194)))

(declare-fun c!41330 () Bool)

(assert (=> b!246949 (= c!41330 (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!23090 () Bool)

(assert (=> bm!23090 (= call!23094 call!23088)))

(declare-fun b!246950 () Bool)

(declare-fun lt!123735 () Unit!7598)

(assert (=> b!246950 (= e!160193 lt!123735)))

(declare-fun lt!123729 () ListLongMap!3645)

(assert (=> b!246950 (= lt!123729 (getCurrentListMapNoExtraKeys!549 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(declare-fun lt!123742 () (_ BitVec 64))

(assert (=> b!246950 (= lt!123742 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123743 () (_ BitVec 64))

(assert (=> b!246950 (= lt!123743 (select (arr!5774 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123728 () Unit!7598)

(declare-fun addStillContains!209 (ListLongMap!3645 (_ BitVec 64) V!8225 (_ BitVec 64)) Unit!7598)

(assert (=> b!246950 (= lt!123728 (addStillContains!209 lt!123729 lt!123742 (zeroValue!4405 thiss!1504) lt!123743))))

(assert (=> b!246950 (contains!1766 (+!660 lt!123729 (tuple2!4731 lt!123742 (zeroValue!4405 thiss!1504))) lt!123743)))

(declare-fun lt!123737 () Unit!7598)

(assert (=> b!246950 (= lt!123737 lt!123728)))

(declare-fun lt!123727 () ListLongMap!3645)

(assert (=> b!246950 (= lt!123727 (getCurrentListMapNoExtraKeys!549 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(declare-fun lt!123745 () (_ BitVec 64))

(assert (=> b!246950 (= lt!123745 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123741 () (_ BitVec 64))

(assert (=> b!246950 (= lt!123741 (select (arr!5774 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123746 () Unit!7598)

(declare-fun addApplyDifferent!209 (ListLongMap!3645 (_ BitVec 64) V!8225 (_ BitVec 64)) Unit!7598)

(assert (=> b!246950 (= lt!123746 (addApplyDifferent!209 lt!123727 lt!123745 (minValue!4405 thiss!1504) lt!123741))))

(assert (=> b!246950 (= (apply!233 (+!660 lt!123727 (tuple2!4731 lt!123745 (minValue!4405 thiss!1504))) lt!123741) (apply!233 lt!123727 lt!123741))))

(declare-fun lt!123744 () Unit!7598)

(assert (=> b!246950 (= lt!123744 lt!123746)))

(declare-fun lt!123747 () ListLongMap!3645)

(assert (=> b!246950 (= lt!123747 (getCurrentListMapNoExtraKeys!549 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(declare-fun lt!123732 () (_ BitVec 64))

(assert (=> b!246950 (= lt!123732 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123739 () (_ BitVec 64))

(assert (=> b!246950 (= lt!123739 (select (arr!5774 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123726 () Unit!7598)

(assert (=> b!246950 (= lt!123726 (addApplyDifferent!209 lt!123747 lt!123732 (zeroValue!4405 thiss!1504) lt!123739))))

(assert (=> b!246950 (= (apply!233 (+!660 lt!123747 (tuple2!4731 lt!123732 (zeroValue!4405 thiss!1504))) lt!123739) (apply!233 lt!123747 lt!123739))))

(declare-fun lt!123730 () Unit!7598)

(assert (=> b!246950 (= lt!123730 lt!123726)))

(declare-fun lt!123740 () ListLongMap!3645)

(assert (=> b!246950 (= lt!123740 (getCurrentListMapNoExtraKeys!549 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(declare-fun lt!123731 () (_ BitVec 64))

(assert (=> b!246950 (= lt!123731 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123734 () (_ BitVec 64))

(assert (=> b!246950 (= lt!123734 (select (arr!5774 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246950 (= lt!123735 (addApplyDifferent!209 lt!123740 lt!123731 (minValue!4405 thiss!1504) lt!123734))))

(assert (=> b!246950 (= (apply!233 (+!660 lt!123740 (tuple2!4731 lt!123731 (minValue!4405 thiss!1504))) lt!123734) (apply!233 lt!123740 lt!123734))))

(declare-fun b!246951 () Bool)

(assert (=> b!246951 (= e!160202 call!23094)))

(declare-fun b!246952 () Bool)

(assert (=> b!246952 (= e!160190 (+!660 call!23090 (tuple2!4731 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4405 thiss!1504))))))

(declare-fun b!246953 () Bool)

(declare-fun e!160200 () Bool)

(assert (=> b!246953 (= e!160194 e!160200)))

(declare-fun res!121055 () Bool)

(assert (=> b!246953 (= res!121055 call!23091)))

(assert (=> b!246953 (=> (not res!121055) (not e!160200))))

(declare-fun b!246954 () Bool)

(declare-fun Unit!7612 () Unit!7598)

(assert (=> b!246954 (= e!160193 Unit!7612)))

(declare-fun b!246955 () Bool)

(assert (=> b!246955 (= e!160194 (not call!23091))))

(declare-fun b!246956 () Bool)

(assert (=> b!246956 (= e!160191 e!160198)))

(declare-fun c!41331 () Bool)

(assert (=> b!246956 (= c!41331 (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!246957 () Bool)

(declare-fun res!121051 () Bool)

(assert (=> b!246957 (=> (not res!121051) (not e!160191))))

(assert (=> b!246957 (= res!121051 e!160197)))

(declare-fun res!121056 () Bool)

(assert (=> b!246957 (=> res!121056 e!160197)))

(assert (=> b!246957 (= res!121056 (not e!160199))))

(declare-fun res!121053 () Bool)

(assert (=> b!246957 (=> (not res!121053) (not e!160199))))

(assert (=> b!246957 (= res!121053 (bvslt #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))))))

(declare-fun b!246958 () Bool)

(assert (=> b!246958 (= e!160200 (= (apply!233 lt!123736 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4405 thiss!1504)))))

(declare-fun b!246959 () Bool)

(assert (=> b!246959 (= e!160198 (not call!23092))))

(declare-fun bm!23091 () Bool)

(assert (=> bm!23091 (= call!23092 (contains!1766 lt!123736 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60487 c!41329) b!246952))

(assert (= (and d!60487 (not c!41329)) b!246945))

(assert (= (and b!246945 c!41328) b!246941))

(assert (= (and b!246945 (not c!41328)) b!246946))

(assert (= (and b!246946 c!41333) b!246939))

(assert (= (and b!246946 (not c!41333)) b!246951))

(assert (= (or b!246939 b!246951) bm!23090))

(assert (= (or b!246941 bm!23090) bm!23087))

(assert (= (or b!246941 b!246939) bm!23086))

(assert (= (or b!246952 bm!23087) bm!23089))

(assert (= (or b!246952 bm!23086) bm!23088))

(assert (= (and d!60487 res!121052) b!246948))

(assert (= (and d!60487 c!41332) b!246950))

(assert (= (and d!60487 (not c!41332)) b!246954))

(assert (= (and d!60487 res!121054) b!246957))

(assert (= (and b!246957 res!121053) b!246944))

(assert (= (and b!246957 (not res!121056)) b!246942))

(assert (= (and b!246942 res!121049) b!246940))

(assert (= (and b!246957 res!121051) b!246949))

(assert (= (and b!246949 c!41330) b!246953))

(assert (= (and b!246949 (not c!41330)) b!246955))

(assert (= (and b!246953 res!121055) b!246958))

(assert (= (or b!246953 b!246955) bm!23085))

(assert (= (and b!246949 res!121050) b!246956))

(assert (= (and b!246956 c!41331) b!246947))

(assert (= (and b!246956 (not c!41331)) b!246959))

(assert (= (and b!246947 res!121057) b!246943))

(assert (= (or b!246947 b!246959) bm!23091))

(declare-fun b_lambda!8065 () Bool)

(assert (=> (not b_lambda!8065) (not b!246940)))

(declare-fun t!8623 () Bool)

(declare-fun tb!2971 () Bool)

(assert (=> (and b!246698 (= (defaultEntry!4564 thiss!1504) (defaultEntry!4564 thiss!1504)) t!8623) tb!2971))

(declare-fun result!5251 () Bool)

(assert (=> tb!2971 (= result!5251 tp_is_empty!6433)))

(assert (=> b!246940 t!8623))

(declare-fun b_and!13589 () Bool)

(assert (= b_and!13583 (and (=> t!8623 result!5251) b_and!13589)))

(declare-fun m!264309 () Bool)

(assert (=> bm!23089 m!264309))

(declare-fun m!264311 () Bool)

(assert (=> b!246943 m!264311))

(declare-fun m!264313 () Bool)

(assert (=> b!246952 m!264313))

(declare-fun m!264315 () Bool)

(assert (=> bm!23085 m!264315))

(assert (=> b!246948 m!264275))

(assert (=> b!246948 m!264275))

(declare-fun m!264317 () Bool)

(assert (=> b!246948 m!264317))

(declare-fun m!264319 () Bool)

(assert (=> bm!23088 m!264319))

(assert (=> b!246940 m!264275))

(declare-fun m!264321 () Bool)

(assert (=> b!246940 m!264321))

(declare-fun m!264323 () Bool)

(assert (=> b!246940 m!264323))

(assert (=> b!246940 m!264323))

(declare-fun m!264325 () Bool)

(assert (=> b!246940 m!264325))

(declare-fun m!264327 () Bool)

(assert (=> b!246940 m!264327))

(assert (=> b!246940 m!264325))

(assert (=> b!246940 m!264275))

(declare-fun m!264329 () Bool)

(assert (=> b!246958 m!264329))

(assert (=> b!246944 m!264275))

(assert (=> b!246944 m!264275))

(assert (=> b!246944 m!264317))

(declare-fun m!264331 () Bool)

(assert (=> b!246950 m!264331))

(declare-fun m!264333 () Bool)

(assert (=> b!246950 m!264333))

(declare-fun m!264335 () Bool)

(assert (=> b!246950 m!264335))

(assert (=> b!246950 m!264275))

(declare-fun m!264337 () Bool)

(assert (=> b!246950 m!264337))

(declare-fun m!264339 () Bool)

(assert (=> b!246950 m!264339))

(declare-fun m!264341 () Bool)

(assert (=> b!246950 m!264341))

(declare-fun m!264343 () Bool)

(assert (=> b!246950 m!264343))

(declare-fun m!264345 () Bool)

(assert (=> b!246950 m!264345))

(declare-fun m!264347 () Bool)

(assert (=> b!246950 m!264347))

(assert (=> b!246950 m!264309))

(declare-fun m!264349 () Bool)

(assert (=> b!246950 m!264349))

(assert (=> b!246950 m!264333))

(declare-fun m!264351 () Bool)

(assert (=> b!246950 m!264351))

(declare-fun m!264353 () Bool)

(assert (=> b!246950 m!264353))

(assert (=> b!246950 m!264347))

(declare-fun m!264355 () Bool)

(assert (=> b!246950 m!264355))

(assert (=> b!246950 m!264343))

(declare-fun m!264357 () Bool)

(assert (=> b!246950 m!264357))

(assert (=> b!246950 m!264331))

(declare-fun m!264359 () Bool)

(assert (=> b!246950 m!264359))

(declare-fun m!264361 () Bool)

(assert (=> bm!23091 m!264361))

(assert (=> b!246942 m!264275))

(assert (=> b!246942 m!264275))

(declare-fun m!264363 () Bool)

(assert (=> b!246942 m!264363))

(assert (=> d!60487 m!264151))

(assert (=> b!246700 d!60487))

(declare-fun d!60489 () Bool)

(declare-fun e!160205 () Bool)

(assert (=> d!60489 e!160205))

(declare-fun res!121062 () Bool)

(assert (=> d!60489 (=> (not res!121062) (not e!160205))))

(declare-fun lt!123753 () SeekEntryResult!1062)

(assert (=> d!60489 (= res!121062 ((_ is Found!1062) lt!123753))))

(assert (=> d!60489 (= lt!123753 (seekEntryOrOpen!0 key!932 (_keys!6684 thiss!1504) (mask!10692 thiss!1504)))))

(declare-fun lt!123752 () Unit!7598)

(declare-fun choose!1166 (array!12169 array!12167 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) Int) Unit!7598)

(assert (=> d!60489 (= lt!123752 (choose!1166 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)))))

(assert (=> d!60489 (validMask!0 (mask!10692 thiss!1504))))

(assert (=> d!60489 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!375 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)) lt!123752)))

(declare-fun b!246966 () Bool)

(declare-fun res!121063 () Bool)

(assert (=> b!246966 (=> (not res!121063) (not e!160205))))

(assert (=> b!246966 (= res!121063 (inRange!0 (index!6419 lt!123753) (mask!10692 thiss!1504)))))

(declare-fun b!246967 () Bool)

(assert (=> b!246967 (= e!160205 (= (select (arr!5774 (_keys!6684 thiss!1504)) (index!6419 lt!123753)) key!932))))

(assert (=> b!246967 (and (bvsge (index!6419 lt!123753) #b00000000000000000000000000000000) (bvslt (index!6419 lt!123753) (size!6117 (_keys!6684 thiss!1504))))))

(assert (= (and d!60489 res!121062) b!246966))

(assert (= (and b!246966 res!121063) b!246967))

(assert (=> d!60489 m!264167))

(declare-fun m!264365 () Bool)

(assert (=> d!60489 m!264365))

(assert (=> d!60489 m!264151))

(declare-fun m!264367 () Bool)

(assert (=> b!246966 m!264367))

(declare-fun m!264369 () Bool)

(assert (=> b!246967 m!264369))

(assert (=> b!246701 d!60489))

(declare-fun d!60491 () Bool)

(declare-fun res!121070 () Bool)

(declare-fun e!160208 () Bool)

(assert (=> d!60491 (=> (not res!121070) (not e!160208))))

(declare-fun simpleValid!256 (LongMapFixedSize!3646) Bool)

(assert (=> d!60491 (= res!121070 (simpleValid!256 thiss!1504))))

(assert (=> d!60491 (= (valid!1438 thiss!1504) e!160208)))

(declare-fun b!246974 () Bool)

(declare-fun res!121071 () Bool)

(assert (=> b!246974 (=> (not res!121071) (not e!160208))))

(assert (=> b!246974 (= res!121071 (= (arrayCountValidKeys!0 (_keys!6684 thiss!1504) #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))) (_size!1872 thiss!1504)))))

(declare-fun b!246975 () Bool)

(declare-fun res!121072 () Bool)

(assert (=> b!246975 (=> (not res!121072) (not e!160208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12169 (_ BitVec 32)) Bool)

(assert (=> b!246975 (= res!121072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6684 thiss!1504) (mask!10692 thiss!1504)))))

(declare-fun b!246976 () Bool)

(assert (=> b!246976 (= e!160208 (arrayNoDuplicates!0 (_keys!6684 thiss!1504) #b00000000000000000000000000000000 Nil!3603))))

(assert (= (and d!60491 res!121070) b!246974))

(assert (= (and b!246974 res!121071) b!246975))

(assert (= (and b!246975 res!121072) b!246976))

(declare-fun m!264371 () Bool)

(assert (=> d!60491 m!264371))

(assert (=> b!246974 m!264159))

(declare-fun m!264373 () Bool)

(assert (=> b!246975 m!264373))

(declare-fun m!264375 () Bool)

(assert (=> b!246976 m!264375))

(assert (=> start!23490 d!60491))

(declare-fun d!60493 () Bool)

(assert (=> d!60493 (= (array_inv!3797 (_keys!6684 thiss!1504)) (bvsge (size!6117 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246698 d!60493))

(declare-fun d!60495 () Bool)

(assert (=> d!60495 (= (array_inv!3798 (_values!4547 thiss!1504)) (bvsge (size!6116 (_values!4547 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246698 d!60495))

(declare-fun b!246985 () Bool)

(declare-fun e!160214 () (_ BitVec 32))

(assert (=> b!246985 (= e!160214 #b00000000000000000000000000000000)))

(declare-fun d!60497 () Bool)

(declare-fun lt!123756 () (_ BitVec 32))

(assert (=> d!60497 (and (bvsge lt!123756 #b00000000000000000000000000000000) (bvsle lt!123756 (bvsub (size!6117 lt!123596) #b00000000000000000000000000000000)))))

(assert (=> d!60497 (= lt!123756 e!160214)))

(declare-fun c!41339 () Bool)

(assert (=> d!60497 (= c!41339 (bvsge #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))))))

(assert (=> d!60497 (and (bvsle #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6117 (_keys!6684 thiss!1504)) (size!6117 lt!123596)))))

(assert (=> d!60497 (= (arrayCountValidKeys!0 lt!123596 #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))) lt!123756)))

(declare-fun bm!23094 () Bool)

(declare-fun call!23097 () (_ BitVec 32))

(assert (=> bm!23094 (= call!23097 (arrayCountValidKeys!0 lt!123596 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6117 (_keys!6684 thiss!1504))))))

(declare-fun b!246986 () Bool)

(declare-fun e!160213 () (_ BitVec 32))

(assert (=> b!246986 (= e!160214 e!160213)))

(declare-fun c!41338 () Bool)

(assert (=> b!246986 (= c!41338 (validKeyInArray!0 (select (arr!5774 lt!123596) #b00000000000000000000000000000000)))))

(declare-fun b!246987 () Bool)

(assert (=> b!246987 (= e!160213 (bvadd #b00000000000000000000000000000001 call!23097))))

(declare-fun b!246988 () Bool)

(assert (=> b!246988 (= e!160213 call!23097)))

(assert (= (and d!60497 c!41339) b!246985))

(assert (= (and d!60497 (not c!41339)) b!246986))

(assert (= (and b!246986 c!41338) b!246987))

(assert (= (and b!246986 (not c!41338)) b!246988))

(assert (= (or b!246987 b!246988) bm!23094))

(declare-fun m!264377 () Bool)

(assert (=> bm!23094 m!264377))

(declare-fun m!264379 () Bool)

(assert (=> b!246986 m!264379))

(assert (=> b!246986 m!264379))

(declare-fun m!264381 () Bool)

(assert (=> b!246986 m!264381))

(assert (=> b!246697 d!60497))

(declare-fun d!60499 () Bool)

(declare-fun e!160220 () Bool)

(assert (=> d!60499 e!160220))

(declare-fun res!121081 () Bool)

(assert (=> d!60499 (=> (not res!121081) (not e!160220))))

(assert (=> d!60499 (= res!121081 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6117 (_keys!6684 thiss!1504)))))))

(declare-fun lt!123759 () Unit!7598)

(declare-fun choose!1 (array!12169 (_ BitVec 32) (_ BitVec 64)) Unit!7598)

(assert (=> d!60499 (= lt!123759 (choose!1 (_keys!6684 thiss!1504) index!297 key!932))))

(declare-fun e!160219 () Bool)

(assert (=> d!60499 e!160219))

(declare-fun res!121083 () Bool)

(assert (=> d!60499 (=> (not res!121083) (not e!160219))))

(assert (=> d!60499 (= res!121083 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6117 (_keys!6684 thiss!1504)))))))

(assert (=> d!60499 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6684 thiss!1504) index!297 key!932) lt!123759)))

(declare-fun b!246999 () Bool)

(assert (=> b!246999 (= e!160219 (bvslt (size!6117 (_keys!6684 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!247000 () Bool)

(assert (=> b!247000 (= e!160220 (= (arrayCountValidKeys!0 (array!12170 (store (arr!5774 (_keys!6684 thiss!1504)) index!297 key!932) (size!6117 (_keys!6684 thiss!1504))) #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6684 thiss!1504) #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!246997 () Bool)

(declare-fun res!121082 () Bool)

(assert (=> b!246997 (=> (not res!121082) (not e!160219))))

(assert (=> b!246997 (= res!121082 (not (validKeyInArray!0 (select (arr!5774 (_keys!6684 thiss!1504)) index!297))))))

(declare-fun b!246998 () Bool)

(declare-fun res!121084 () Bool)

(assert (=> b!246998 (=> (not res!121084) (not e!160219))))

(assert (=> b!246998 (= res!121084 (validKeyInArray!0 key!932))))

(assert (= (and d!60499 res!121083) b!246997))

(assert (= (and b!246997 res!121082) b!246998))

(assert (= (and b!246998 res!121084) b!246999))

(assert (= (and d!60499 res!121081) b!247000))

(declare-fun m!264383 () Bool)

(assert (=> d!60499 m!264383))

(assert (=> b!247000 m!264165))

(declare-fun m!264385 () Bool)

(assert (=> b!247000 m!264385))

(assert (=> b!247000 m!264159))

(declare-fun m!264387 () Bool)

(assert (=> b!246997 m!264387))

(assert (=> b!246997 m!264387))

(declare-fun m!264389 () Bool)

(assert (=> b!246997 m!264389))

(declare-fun m!264391 () Bool)

(assert (=> b!246998 m!264391))

(assert (=> b!246697 d!60499))

(assert (=> b!246697 d!60477))

(declare-fun b!247001 () Bool)

(declare-fun e!160222 () (_ BitVec 32))

(assert (=> b!247001 (= e!160222 #b00000000000000000000000000000000)))

(declare-fun d!60501 () Bool)

(declare-fun lt!123760 () (_ BitVec 32))

(assert (=> d!60501 (and (bvsge lt!123760 #b00000000000000000000000000000000) (bvsle lt!123760 (bvsub (size!6117 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60501 (= lt!123760 e!160222)))

(declare-fun c!41341 () Bool)

(assert (=> d!60501 (= c!41341 (bvsge #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))))))

(assert (=> d!60501 (and (bvsle #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6117 (_keys!6684 thiss!1504)) (size!6117 (_keys!6684 thiss!1504))))))

(assert (=> d!60501 (= (arrayCountValidKeys!0 (_keys!6684 thiss!1504) #b00000000000000000000000000000000 (size!6117 (_keys!6684 thiss!1504))) lt!123760)))

(declare-fun bm!23095 () Bool)

(declare-fun call!23098 () (_ BitVec 32))

(assert (=> bm!23095 (= call!23098 (arrayCountValidKeys!0 (_keys!6684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6117 (_keys!6684 thiss!1504))))))

(declare-fun b!247002 () Bool)

(declare-fun e!160221 () (_ BitVec 32))

(assert (=> b!247002 (= e!160222 e!160221)))

(declare-fun c!41340 () Bool)

(assert (=> b!247002 (= c!41340 (validKeyInArray!0 (select (arr!5774 (_keys!6684 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!247003 () Bool)

(assert (=> b!247003 (= e!160221 (bvadd #b00000000000000000000000000000001 call!23098))))

(declare-fun b!247004 () Bool)

(assert (=> b!247004 (= e!160221 call!23098)))

(assert (= (and d!60501 c!41341) b!247001))

(assert (= (and d!60501 (not c!41341)) b!247002))

(assert (= (and b!247002 c!41340) b!247003))

(assert (= (and b!247002 (not c!41340)) b!247004))

(assert (= (or b!247003 b!247004) bm!23095))

(declare-fun m!264393 () Bool)

(assert (=> bm!23095 m!264393))

(assert (=> b!247002 m!264275))

(assert (=> b!247002 m!264275))

(assert (=> b!247002 m!264317))

(assert (=> b!246697 d!60501))

(declare-fun d!60503 () Bool)

(assert (=> d!60503 (= (validMask!0 (mask!10692 thiss!1504)) (and (or (= (mask!10692 thiss!1504) #b00000000000000000000000000000111) (= (mask!10692 thiss!1504) #b00000000000000000000000000001111) (= (mask!10692 thiss!1504) #b00000000000000000000000000011111) (= (mask!10692 thiss!1504) #b00000000000000000000000000111111) (= (mask!10692 thiss!1504) #b00000000000000000000000001111111) (= (mask!10692 thiss!1504) #b00000000000000000000000011111111) (= (mask!10692 thiss!1504) #b00000000000000000000000111111111) (= (mask!10692 thiss!1504) #b00000000000000000000001111111111) (= (mask!10692 thiss!1504) #b00000000000000000000011111111111) (= (mask!10692 thiss!1504) #b00000000000000000000111111111111) (= (mask!10692 thiss!1504) #b00000000000000000001111111111111) (= (mask!10692 thiss!1504) #b00000000000000000011111111111111) (= (mask!10692 thiss!1504) #b00000000000000000111111111111111) (= (mask!10692 thiss!1504) #b00000000000000001111111111111111) (= (mask!10692 thiss!1504) #b00000000000000011111111111111111) (= (mask!10692 thiss!1504) #b00000000000000111111111111111111) (= (mask!10692 thiss!1504) #b00000000000001111111111111111111) (= (mask!10692 thiss!1504) #b00000000000011111111111111111111) (= (mask!10692 thiss!1504) #b00000000000111111111111111111111) (= (mask!10692 thiss!1504) #b00000000001111111111111111111111) (= (mask!10692 thiss!1504) #b00000000011111111111111111111111) (= (mask!10692 thiss!1504) #b00000000111111111111111111111111) (= (mask!10692 thiss!1504) #b00000001111111111111111111111111) (= (mask!10692 thiss!1504) #b00000011111111111111111111111111) (= (mask!10692 thiss!1504) #b00000111111111111111111111111111) (= (mask!10692 thiss!1504) #b00001111111111111111111111111111) (= (mask!10692 thiss!1504) #b00011111111111111111111111111111) (= (mask!10692 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10692 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!246697 d!60503))

(declare-fun d!60505 () Bool)

(declare-fun res!121093 () Bool)

(declare-fun e!160234 () Bool)

(assert (=> d!60505 (=> res!121093 e!160234)))

(assert (=> d!60505 (= res!121093 (bvsge #b00000000000000000000000000000000 (size!6117 lt!123596)))))

(assert (=> d!60505 (= (arrayNoDuplicates!0 lt!123596 #b00000000000000000000000000000000 Nil!3603) e!160234)))

(declare-fun bm!23098 () Bool)

(declare-fun call!23101 () Bool)

(declare-fun c!41344 () Bool)

(assert (=> bm!23098 (= call!23101 (arrayNoDuplicates!0 lt!123596 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41344 (Cons!3602 (select (arr!5774 lt!123596) #b00000000000000000000000000000000) Nil!3603) Nil!3603)))))

(declare-fun b!247015 () Bool)

(declare-fun e!160232 () Bool)

(declare-fun e!160233 () Bool)

(assert (=> b!247015 (= e!160232 e!160233)))

(assert (=> b!247015 (= c!41344 (validKeyInArray!0 (select (arr!5774 lt!123596) #b00000000000000000000000000000000)))))

(declare-fun b!247016 () Bool)

(assert (=> b!247016 (= e!160233 call!23101)))

(declare-fun b!247017 () Bool)

(assert (=> b!247017 (= e!160234 e!160232)))

(declare-fun res!121092 () Bool)

(assert (=> b!247017 (=> (not res!121092) (not e!160232))))

(declare-fun e!160231 () Bool)

(assert (=> b!247017 (= res!121092 (not e!160231))))

(declare-fun res!121091 () Bool)

(assert (=> b!247017 (=> (not res!121091) (not e!160231))))

(assert (=> b!247017 (= res!121091 (validKeyInArray!0 (select (arr!5774 lt!123596) #b00000000000000000000000000000000)))))

(declare-fun b!247018 () Bool)

(declare-fun contains!1769 (List!3606 (_ BitVec 64)) Bool)

(assert (=> b!247018 (= e!160231 (contains!1769 Nil!3603 (select (arr!5774 lt!123596) #b00000000000000000000000000000000)))))

(declare-fun b!247019 () Bool)

(assert (=> b!247019 (= e!160233 call!23101)))

(assert (= (and d!60505 (not res!121093)) b!247017))

(assert (= (and b!247017 res!121091) b!247018))

(assert (= (and b!247017 res!121092) b!247015))

(assert (= (and b!247015 c!41344) b!247019))

(assert (= (and b!247015 (not c!41344)) b!247016))

(assert (= (or b!247019 b!247016) bm!23098))

(assert (=> bm!23098 m!264379))

(declare-fun m!264395 () Bool)

(assert (=> bm!23098 m!264395))

(assert (=> b!247015 m!264379))

(assert (=> b!247015 m!264379))

(assert (=> b!247015 m!264381))

(assert (=> b!247017 m!264379))

(assert (=> b!247017 m!264379))

(assert (=> b!247017 m!264381))

(assert (=> b!247018 m!264379))

(assert (=> b!247018 m!264379))

(declare-fun m!264397 () Bool)

(assert (=> b!247018 m!264397))

(assert (=> b!246697 d!60505))

(declare-fun d!60507 () Bool)

(declare-fun e!160237 () Bool)

(assert (=> d!60507 e!160237))

(declare-fun res!121096 () Bool)

(assert (=> d!60507 (=> (not res!121096) (not e!160237))))

(assert (=> d!60507 (= res!121096 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6117 (_keys!6684 thiss!1504)))))))

(declare-fun lt!123763 () Unit!7598)

(declare-fun choose!41 (array!12169 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3606) Unit!7598)

(assert (=> d!60507 (= lt!123763 (choose!41 (_keys!6684 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3603))))

(assert (=> d!60507 (bvslt (size!6117 (_keys!6684 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60507 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6684 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3603) lt!123763)))

(declare-fun b!247022 () Bool)

(assert (=> b!247022 (= e!160237 (arrayNoDuplicates!0 (array!12170 (store (arr!5774 (_keys!6684 thiss!1504)) index!297 key!932) (size!6117 (_keys!6684 thiss!1504))) #b00000000000000000000000000000000 Nil!3603))))

(assert (= (and d!60507 res!121096) b!247022))

(declare-fun m!264399 () Bool)

(assert (=> d!60507 m!264399))

(assert (=> b!247022 m!264165))

(declare-fun m!264401 () Bool)

(assert (=> b!247022 m!264401))

(assert (=> b!246697 d!60507))

(declare-fun d!60509 () Bool)

(assert (=> d!60509 (contains!1766 (getCurrentListMap!1370 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)) key!932)))

(declare-fun lt!123766 () Unit!7598)

(declare-fun choose!1167 (array!12169 array!12167 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) (_ BitVec 32) Int) Unit!7598)

(assert (=> d!60509 (= lt!123766 (choose!1167 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(assert (=> d!60509 (validMask!0 (mask!10692 thiss!1504))))

(assert (=> d!60509 (= (lemmaArrayContainsKeyThenInListMap!192 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)) lt!123766)))

(declare-fun bs!8936 () Bool)

(assert (= bs!8936 d!60509))

(assert (=> bs!8936 m!264181))

(assert (=> bs!8936 m!264181))

(assert (=> bs!8936 m!264183))

(declare-fun m!264403 () Bool)

(assert (=> bs!8936 m!264403))

(assert (=> bs!8936 m!264151))

(assert (=> b!246713 d!60509))

(declare-fun mapIsEmpty!10928 () Bool)

(declare-fun mapRes!10928 () Bool)

(assert (=> mapIsEmpty!10928 mapRes!10928))

(declare-fun mapNonEmpty!10928 () Bool)

(declare-fun tp!22970 () Bool)

(declare-fun e!160243 () Bool)

(assert (=> mapNonEmpty!10928 (= mapRes!10928 (and tp!22970 e!160243))))

(declare-fun mapKey!10928 () (_ BitVec 32))

(declare-fun mapRest!10928 () (Array (_ BitVec 32) ValueCell!2873))

(declare-fun mapValue!10928 () ValueCell!2873)

(assert (=> mapNonEmpty!10928 (= mapRest!10919 (store mapRest!10928 mapKey!10928 mapValue!10928))))

(declare-fun b!247029 () Bool)

(assert (=> b!247029 (= e!160243 tp_is_empty!6433)))

(declare-fun condMapEmpty!10928 () Bool)

(declare-fun mapDefault!10928 () ValueCell!2873)

(assert (=> mapNonEmpty!10919 (= condMapEmpty!10928 (= mapRest!10919 ((as const (Array (_ BitVec 32) ValueCell!2873)) mapDefault!10928)))))

(declare-fun e!160242 () Bool)

(assert (=> mapNonEmpty!10919 (= tp!22955 (and e!160242 mapRes!10928))))

(declare-fun b!247030 () Bool)

(assert (=> b!247030 (= e!160242 tp_is_empty!6433)))

(assert (= (and mapNonEmpty!10919 condMapEmpty!10928) mapIsEmpty!10928))

(assert (= (and mapNonEmpty!10919 (not condMapEmpty!10928)) mapNonEmpty!10928))

(assert (= (and mapNonEmpty!10928 ((_ is ValueCellFull!2873) mapValue!10928)) b!247029))

(assert (= (and mapNonEmpty!10919 ((_ is ValueCellFull!2873) mapDefault!10928)) b!247030))

(declare-fun m!264405 () Bool)

(assert (=> mapNonEmpty!10928 m!264405))

(declare-fun b_lambda!8067 () Bool)

(assert (= b_lambda!8065 (or (and b!246698 b_free!6571) b_lambda!8067)))

(check-sat (not d!60507) (not b!246940) (not b_next!6571) (not d!60509) (not b!246997) (not b!246944) tp_is_empty!6433 (not bm!23098) (not b!247017) (not b!246894) (not b_lambda!8067) (not b!246896) (not bm!23094) (not d!60479) (not b!246950) (not b!246974) (not b!246942) (not b!247022) (not b!246845) (not bm!23095) (not b!246958) (not d!60489) (not b!247015) (not d!60481) (not b!246976) b_and!13589 (not b!246952) (not bm!23070) (not b!246975) (not b!246943) (not d!60487) (not b!246998) (not mapNonEmpty!10928) (not b!246883) (not b!246966) (not b!246948) (not d!60485) (not bm!23085) (not d!60499) (not bm!23089) (not bm!23069) (not bm!23088) (not b!247002) (not bm!23091) (not b!247018) (not b!247000) (not d!60491) (not b!246986))
(check-sat b_and!13589 (not b_next!6571))
