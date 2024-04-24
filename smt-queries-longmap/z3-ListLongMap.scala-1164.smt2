; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24610 () Bool)

(assert start!24610)

(declare-fun b!257580 () Bool)

(declare-fun b_free!6733 () Bool)

(declare-fun b_next!6733 () Bool)

(assert (=> b!257580 (= b_free!6733 (not b_next!6733))))

(declare-fun tp!23508 () Bool)

(declare-fun b_and!13817 () Bool)

(assert (=> b!257580 (= tp!23508 b_and!13817)))

(declare-fun mapIsEmpty!11229 () Bool)

(declare-fun mapRes!11229 () Bool)

(assert (=> mapIsEmpty!11229 mapRes!11229))

(declare-fun b!257566 () Bool)

(declare-fun e!166962 () Bool)

(declare-fun e!166949 () Bool)

(assert (=> b!257566 (= e!166962 e!166949)))

(declare-fun res!125983 () Bool)

(assert (=> b!257566 (=> (not res!125983) (not e!166949))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8441 0))(
  ( (V!8442 (val!3342 Int)) )
))
(declare-datatypes ((ValueCell!2954 0))(
  ( (ValueCellFull!2954 (v!5438 V!8441)) (EmptyCell!2954) )
))
(declare-datatypes ((array!12533 0))(
  ( (array!12534 (arr!5935 (Array (_ BitVec 32) ValueCell!2954)) (size!6282 (_ BitVec 32))) )
))
(declare-datatypes ((array!12535 0))(
  ( (array!12536 (arr!5936 (Array (_ BitVec 32) (_ BitVec 64))) (size!6283 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3808 0))(
  ( (LongMapFixedSize!3809 (defaultEntry!4752 Int) (mask!11042 (_ BitVec 32)) (extraKeys!4489 (_ BitVec 32)) (zeroValue!4593 V!8441) (minValue!4593 V!8441) (_size!1953 (_ BitVec 32)) (_keys!6920 array!12535) (_values!4735 array!12533) (_vacant!1953 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3808)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257566 (= res!125983 (inRange!0 index!297 (mask!11042 thiss!1504)))))

(declare-datatypes ((Unit!7971 0))(
  ( (Unit!7972) )
))
(declare-fun lt!129546 () Unit!7971)

(declare-fun e!166957 () Unit!7971)

(assert (=> b!257566 (= lt!129546 e!166957)))

(declare-fun c!43597 () Bool)

(declare-datatypes ((tuple2!4836 0))(
  ( (tuple2!4837 (_1!2429 (_ BitVec 64)) (_2!2429 V!8441)) )
))
(declare-datatypes ((List!3714 0))(
  ( (Nil!3711) (Cons!3710 (h!4372 tuple2!4836) (t!8767 List!3714)) )
))
(declare-datatypes ((ListLongMap!3751 0))(
  ( (ListLongMap!3752 (toList!1891 List!3714)) )
))
(declare-fun lt!129540 () ListLongMap!3751)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1850 (ListLongMap!3751 (_ BitVec 64)) Bool)

(assert (=> b!257566 (= c!43597 (contains!1850 lt!129540 key!932))))

(declare-fun getCurrentListMap!1423 (array!12535 array!12533 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 32) Int) ListLongMap!3751)

(assert (=> b!257566 (= lt!129540 (getCurrentListMap!1423 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun b!257567 () Bool)

(declare-fun res!125980 () Bool)

(declare-fun e!166950 () Bool)

(assert (=> b!257567 (=> (not res!125980) (not e!166950))))

(assert (=> b!257567 (= res!125980 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!257568 () Bool)

(declare-fun Unit!7973 () Unit!7971)

(assert (=> b!257568 (= e!166957 Unit!7973)))

(declare-fun lt!129552 () Unit!7971)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!429 (array!12535 array!12533 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) Int) Unit!7971)

(assert (=> b!257568 (= lt!129552 (lemmaInListMapThenSeekEntryOrOpenFindsIt!429 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)))))

(assert (=> b!257568 false))

(declare-fun b!257569 () Bool)

(declare-fun e!166951 () Bool)

(declare-fun call!24442 () Bool)

(assert (=> b!257569 (= e!166951 (not call!24442))))

(declare-fun b!257570 () Bool)

(declare-fun res!125978 () Bool)

(declare-fun e!166954 () Bool)

(assert (=> b!257570 (=> (not res!125978) (not e!166954))))

(declare-fun call!24441 () Bool)

(assert (=> b!257570 (= res!125978 call!24441)))

(declare-fun e!166952 () Bool)

(assert (=> b!257570 (= e!166952 e!166954)))

(declare-fun b!257571 () Bool)

(declare-fun c!43594 () Bool)

(declare-datatypes ((SeekEntryResult!1138 0))(
  ( (MissingZero!1138 (index!6722 (_ BitVec 32))) (Found!1138 (index!6723 (_ BitVec 32))) (Intermediate!1138 (undefined!1950 Bool) (index!6724 (_ BitVec 32)) (x!24988 (_ BitVec 32))) (Undefined!1138) (MissingVacant!1138 (index!6725 (_ BitVec 32))) )
))
(declare-fun lt!129550 () SeekEntryResult!1138)

(get-info :version)

(assert (=> b!257571 (= c!43594 ((_ is MissingVacant!1138) lt!129550))))

(declare-fun e!166956 () Bool)

(assert (=> b!257571 (= e!166952 e!166956)))

(declare-fun res!125984 () Bool)

(assert (=> start!24610 (=> (not res!125984) (not e!166950))))

(declare-fun valid!1494 (LongMapFixedSize!3808) Bool)

(assert (=> start!24610 (= res!125984 (valid!1494 thiss!1504))))

(assert (=> start!24610 e!166950))

(declare-fun e!166958 () Bool)

(assert (=> start!24610 e!166958))

(assert (=> start!24610 true))

(declare-fun tp_is_empty!6595 () Bool)

(assert (=> start!24610 tp_is_empty!6595))

(declare-fun bm!24438 () Bool)

(declare-fun c!43596 () Bool)

(assert (=> bm!24438 (= call!24441 (inRange!0 (ite c!43596 (index!6722 lt!129550) (index!6725 lt!129550)) (mask!11042 thiss!1504)))))

(declare-fun b!257572 () Bool)

(assert (=> b!257572 (= e!166950 e!166962)))

(declare-fun res!125985 () Bool)

(assert (=> b!257572 (=> (not res!125985) (not e!166962))))

(assert (=> b!257572 (= res!125985 (or (= lt!129550 (MissingZero!1138 index!297)) (= lt!129550 (MissingVacant!1138 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12535 (_ BitVec 32)) SeekEntryResult!1138)

(assert (=> b!257572 (= lt!129550 (seekEntryOrOpen!0 key!932 (_keys!6920 thiss!1504) (mask!11042 thiss!1504)))))

(declare-fun b!257573 () Bool)

(declare-fun e!166953 () Bool)

(assert (=> b!257573 (= e!166953 tp_is_empty!6595)))

(declare-fun mapNonEmpty!11229 () Bool)

(declare-fun tp!23507 () Bool)

(declare-fun e!166959 () Bool)

(assert (=> mapNonEmpty!11229 (= mapRes!11229 (and tp!23507 e!166959))))

(declare-fun mapKey!11229 () (_ BitVec 32))

(declare-fun mapValue!11229 () ValueCell!2954)

(declare-fun mapRest!11229 () (Array (_ BitVec 32) ValueCell!2954))

(assert (=> mapNonEmpty!11229 (= (arr!5935 (_values!4735 thiss!1504)) (store mapRest!11229 mapKey!11229 mapValue!11229))))

(declare-fun bm!24439 () Bool)

(declare-fun arrayContainsKey!0 (array!12535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24439 (= call!24442 (arrayContainsKey!0 (_keys!6920 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257574 () Bool)

(declare-fun res!125979 () Bool)

(assert (=> b!257574 (=> (not res!125979) (not e!166954))))

(assert (=> b!257574 (= res!125979 (= (select (arr!5936 (_keys!6920 thiss!1504)) (index!6722 lt!129550)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257575 () Bool)

(declare-fun e!166955 () Unit!7971)

(declare-fun Unit!7974 () Unit!7971)

(assert (=> b!257575 (= e!166955 Unit!7974)))

(declare-fun lt!129549 () Unit!7971)

(declare-fun lemmaArrayContainsKeyThenInListMap!246 (array!12535 array!12533 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) (_ BitVec 32) Int) Unit!7971)

(assert (=> b!257575 (= lt!129549 (lemmaArrayContainsKeyThenInListMap!246 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(assert (=> b!257575 false))

(declare-fun b!257576 () Bool)

(declare-fun e!166961 () Bool)

(assert (=> b!257576 (= e!166961 (and e!166953 mapRes!11229))))

(declare-fun condMapEmpty!11229 () Bool)

(declare-fun mapDefault!11229 () ValueCell!2954)

(assert (=> b!257576 (= condMapEmpty!11229 (= (arr!5935 (_values!4735 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2954)) mapDefault!11229)))))

(declare-fun b!257577 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!257577 (= e!166949 (not (validMask!0 (mask!11042 thiss!1504))))))

(declare-fun lt!129541 () array!12535)

(declare-fun arrayCountValidKeys!0 (array!12535 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!257577 (= (arrayCountValidKeys!0 lt!129541 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!129542 () Unit!7971)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12535 (_ BitVec 32)) Unit!7971)

(assert (=> b!257577 (= lt!129542 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129541 index!297))))

(assert (=> b!257577 (arrayContainsKey!0 lt!129541 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129553 () Unit!7971)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12535 (_ BitVec 64) (_ BitVec 32)) Unit!7971)

(assert (=> b!257577 (= lt!129553 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129541 key!932 index!297))))

(declare-fun v!346 () V!8441)

(declare-fun +!688 (ListLongMap!3751 tuple2!4836) ListLongMap!3751)

(assert (=> b!257577 (= (+!688 lt!129540 (tuple2!4837 key!932 v!346)) (getCurrentListMap!1423 lt!129541 (array!12534 (store (arr!5935 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6282 (_values!4735 thiss!1504))) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129545 () Unit!7971)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!103 (array!12535 array!12533 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 32) (_ BitVec 64) V!8441 Int) Unit!7971)

(assert (=> b!257577 (= lt!129545 (lemmaAddValidKeyToArrayThenAddPairToListMap!103 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) index!297 key!932 v!346 (defaultEntry!4752 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12535 (_ BitVec 32)) Bool)

(assert (=> b!257577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129541 (mask!11042 thiss!1504))))

(declare-fun lt!129547 () Unit!7971)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12535 (_ BitVec 32) (_ BitVec 32)) Unit!7971)

(assert (=> b!257577 (= lt!129547 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6920 thiss!1504) index!297 (mask!11042 thiss!1504)))))

(assert (=> b!257577 (= (arrayCountValidKeys!0 lt!129541 #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6920 thiss!1504) #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504)))))))

(declare-fun lt!129551 () Unit!7971)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12535 (_ BitVec 32) (_ BitVec 64)) Unit!7971)

(assert (=> b!257577 (= lt!129551 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6920 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3715 0))(
  ( (Nil!3712) (Cons!3711 (h!4373 (_ BitVec 64)) (t!8768 List!3715)) )
))
(declare-fun arrayNoDuplicates!0 (array!12535 (_ BitVec 32) List!3715) Bool)

(assert (=> b!257577 (arrayNoDuplicates!0 lt!129541 #b00000000000000000000000000000000 Nil!3712)))

(assert (=> b!257577 (= lt!129541 (array!12536 (store (arr!5936 (_keys!6920 thiss!1504)) index!297 key!932) (size!6283 (_keys!6920 thiss!1504))))))

(declare-fun lt!129548 () Unit!7971)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3715) Unit!7971)

(assert (=> b!257577 (= lt!129548 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6920 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3712))))

(declare-fun lt!129543 () Unit!7971)

(assert (=> b!257577 (= lt!129543 e!166955)))

(declare-fun c!43595 () Bool)

(assert (=> b!257577 (= c!43595 (arrayContainsKey!0 (_keys!6920 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257578 () Bool)

(declare-fun res!125982 () Bool)

(assert (=> b!257578 (= res!125982 (= (select (arr!5936 (_keys!6920 thiss!1504)) (index!6725 lt!129550)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257578 (=> (not res!125982) (not e!166951))))

(declare-fun b!257579 () Bool)

(assert (=> b!257579 (= e!166959 tp_is_empty!6595)))

(declare-fun array_inv!3905 (array!12535) Bool)

(declare-fun array_inv!3906 (array!12533) Bool)

(assert (=> b!257580 (= e!166958 (and tp!23508 tp_is_empty!6595 (array_inv!3905 (_keys!6920 thiss!1504)) (array_inv!3906 (_values!4735 thiss!1504)) e!166961))))

(declare-fun b!257581 () Bool)

(assert (=> b!257581 (= e!166954 (not call!24442))))

(declare-fun b!257582 () Bool)

(declare-fun Unit!7975 () Unit!7971)

(assert (=> b!257582 (= e!166955 Unit!7975)))

(declare-fun b!257583 () Bool)

(declare-fun lt!129544 () Unit!7971)

(assert (=> b!257583 (= e!166957 lt!129544)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!422 (array!12535 array!12533 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) Int) Unit!7971)

(assert (=> b!257583 (= lt!129544 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!422 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)))))

(assert (=> b!257583 (= c!43596 ((_ is MissingZero!1138) lt!129550))))

(assert (=> b!257583 e!166952))

(declare-fun b!257584 () Bool)

(assert (=> b!257584 (= e!166956 e!166951)))

(declare-fun res!125981 () Bool)

(assert (=> b!257584 (= res!125981 call!24441)))

(assert (=> b!257584 (=> (not res!125981) (not e!166951))))

(declare-fun b!257585 () Bool)

(assert (=> b!257585 (= e!166956 ((_ is Undefined!1138) lt!129550))))

(assert (= (and start!24610 res!125984) b!257567))

(assert (= (and b!257567 res!125980) b!257572))

(assert (= (and b!257572 res!125985) b!257566))

(assert (= (and b!257566 c!43597) b!257568))

(assert (= (and b!257566 (not c!43597)) b!257583))

(assert (= (and b!257583 c!43596) b!257570))

(assert (= (and b!257583 (not c!43596)) b!257571))

(assert (= (and b!257570 res!125978) b!257574))

(assert (= (and b!257574 res!125979) b!257581))

(assert (= (and b!257571 c!43594) b!257584))

(assert (= (and b!257571 (not c!43594)) b!257585))

(assert (= (and b!257584 res!125981) b!257578))

(assert (= (and b!257578 res!125982) b!257569))

(assert (= (or b!257570 b!257584) bm!24438))

(assert (= (or b!257581 b!257569) bm!24439))

(assert (= (and b!257566 res!125983) b!257577))

(assert (= (and b!257577 c!43595) b!257575))

(assert (= (and b!257577 (not c!43595)) b!257582))

(assert (= (and b!257576 condMapEmpty!11229) mapIsEmpty!11229))

(assert (= (and b!257576 (not condMapEmpty!11229)) mapNonEmpty!11229))

(assert (= (and mapNonEmpty!11229 ((_ is ValueCellFull!2954) mapValue!11229)) b!257579))

(assert (= (and b!257576 ((_ is ValueCellFull!2954) mapDefault!11229)) b!257573))

(assert (= b!257580 b!257576))

(assert (= start!24610 b!257580))

(declare-fun m!273015 () Bool)

(assert (=> bm!24438 m!273015))

(declare-fun m!273017 () Bool)

(assert (=> b!257580 m!273017))

(declare-fun m!273019 () Bool)

(assert (=> b!257580 m!273019))

(declare-fun m!273021 () Bool)

(assert (=> b!257566 m!273021))

(declare-fun m!273023 () Bool)

(assert (=> b!257566 m!273023))

(declare-fun m!273025 () Bool)

(assert (=> b!257566 m!273025))

(declare-fun m!273027 () Bool)

(assert (=> b!257577 m!273027))

(declare-fun m!273029 () Bool)

(assert (=> b!257577 m!273029))

(declare-fun m!273031 () Bool)

(assert (=> b!257577 m!273031))

(declare-fun m!273033 () Bool)

(assert (=> b!257577 m!273033))

(declare-fun m!273035 () Bool)

(assert (=> b!257577 m!273035))

(declare-fun m!273037 () Bool)

(assert (=> b!257577 m!273037))

(declare-fun m!273039 () Bool)

(assert (=> b!257577 m!273039))

(declare-fun m!273041 () Bool)

(assert (=> b!257577 m!273041))

(declare-fun m!273043 () Bool)

(assert (=> b!257577 m!273043))

(declare-fun m!273045 () Bool)

(assert (=> b!257577 m!273045))

(declare-fun m!273047 () Bool)

(assert (=> b!257577 m!273047))

(declare-fun m!273049 () Bool)

(assert (=> b!257577 m!273049))

(declare-fun m!273051 () Bool)

(assert (=> b!257577 m!273051))

(declare-fun m!273053 () Bool)

(assert (=> b!257577 m!273053))

(declare-fun m!273055 () Bool)

(assert (=> b!257577 m!273055))

(declare-fun m!273057 () Bool)

(assert (=> b!257577 m!273057))

(declare-fun m!273059 () Bool)

(assert (=> b!257577 m!273059))

(declare-fun m!273061 () Bool)

(assert (=> b!257577 m!273061))

(assert (=> bm!24439 m!273051))

(declare-fun m!273063 () Bool)

(assert (=> mapNonEmpty!11229 m!273063))

(declare-fun m!273065 () Bool)

(assert (=> b!257574 m!273065))

(declare-fun m!273067 () Bool)

(assert (=> b!257583 m!273067))

(declare-fun m!273069 () Bool)

(assert (=> b!257575 m!273069))

(declare-fun m!273071 () Bool)

(assert (=> b!257568 m!273071))

(declare-fun m!273073 () Bool)

(assert (=> start!24610 m!273073))

(declare-fun m!273075 () Bool)

(assert (=> b!257578 m!273075))

(declare-fun m!273077 () Bool)

(assert (=> b!257572 m!273077))

(check-sat (not mapNonEmpty!11229) (not b!257568) (not b!257575) tp_is_empty!6595 (not bm!24439) (not start!24610) (not b!257583) (not b!257572) (not b!257577) (not b_next!6733) (not b!257566) (not b!257580) (not bm!24438) b_and!13817)
(check-sat b_and!13817 (not b_next!6733))
(get-model)

(declare-fun e!167051 () Bool)

(declare-fun b!257717 () Bool)

(assert (=> b!257717 (= e!167051 (= (arrayCountValidKeys!0 (array!12536 (store (arr!5936 (_keys!6920 thiss!1504)) index!297 key!932) (size!6283 (_keys!6920 thiss!1504))) #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6920 thiss!1504) #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!257716 () Bool)

(declare-fun e!167052 () Bool)

(assert (=> b!257716 (= e!167052 (bvslt (size!6283 (_keys!6920 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!257714 () Bool)

(declare-fun res!126042 () Bool)

(assert (=> b!257714 (=> (not res!126042) (not e!167052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!257714 (= res!126042 (not (validKeyInArray!0 (select (arr!5936 (_keys!6920 thiss!1504)) index!297))))))

(declare-fun b!257715 () Bool)

(declare-fun res!126043 () Bool)

(assert (=> b!257715 (=> (not res!126043) (not e!167052))))

(assert (=> b!257715 (= res!126043 (validKeyInArray!0 key!932))))

(declare-fun d!61897 () Bool)

(assert (=> d!61897 e!167051))

(declare-fun res!126044 () Bool)

(assert (=> d!61897 (=> (not res!126044) (not e!167051))))

(assert (=> d!61897 (= res!126044 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6283 (_keys!6920 thiss!1504)))))))

(declare-fun lt!129640 () Unit!7971)

(declare-fun choose!1 (array!12535 (_ BitVec 32) (_ BitVec 64)) Unit!7971)

(assert (=> d!61897 (= lt!129640 (choose!1 (_keys!6920 thiss!1504) index!297 key!932))))

(assert (=> d!61897 e!167052))

(declare-fun res!126045 () Bool)

(assert (=> d!61897 (=> (not res!126045) (not e!167052))))

(assert (=> d!61897 (= res!126045 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6283 (_keys!6920 thiss!1504)))))))

(assert (=> d!61897 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6920 thiss!1504) index!297 key!932) lt!129640)))

(assert (= (and d!61897 res!126045) b!257714))

(assert (= (and b!257714 res!126042) b!257715))

(assert (= (and b!257715 res!126043) b!257716))

(assert (= (and d!61897 res!126044) b!257717))

(assert (=> b!257717 m!273039))

(declare-fun m!273207 () Bool)

(assert (=> b!257717 m!273207))

(assert (=> b!257717 m!273041))

(declare-fun m!273209 () Bool)

(assert (=> b!257714 m!273209))

(assert (=> b!257714 m!273209))

(declare-fun m!273211 () Bool)

(assert (=> b!257714 m!273211))

(declare-fun m!273213 () Bool)

(assert (=> b!257715 m!273213))

(declare-fun m!273215 () Bool)

(assert (=> d!61897 m!273215))

(assert (=> b!257577 d!61897))

(declare-fun b!257726 () Bool)

(declare-fun e!167058 () (_ BitVec 32))

(declare-fun call!24457 () (_ BitVec 32))

(assert (=> b!257726 (= e!167058 call!24457)))

(declare-fun b!257727 () Bool)

(declare-fun e!167057 () (_ BitVec 32))

(assert (=> b!257727 (= e!167057 e!167058)))

(declare-fun c!43626 () Bool)

(assert (=> b!257727 (= c!43626 (validKeyInArray!0 (select (arr!5936 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24454 () Bool)

(assert (=> bm!24454 (= call!24457 (arrayCountValidKeys!0 (_keys!6920 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6283 (_keys!6920 thiss!1504))))))

(declare-fun d!61899 () Bool)

(declare-fun lt!129643 () (_ BitVec 32))

(assert (=> d!61899 (and (bvsge lt!129643 #b00000000000000000000000000000000) (bvsle lt!129643 (bvsub (size!6283 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61899 (= lt!129643 e!167057)))

(declare-fun c!43627 () Bool)

(assert (=> d!61899 (= c!43627 (bvsge #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))))))

(assert (=> d!61899 (and (bvsle #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6283 (_keys!6920 thiss!1504)) (size!6283 (_keys!6920 thiss!1504))))))

(assert (=> d!61899 (= (arrayCountValidKeys!0 (_keys!6920 thiss!1504) #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))) lt!129643)))

(declare-fun b!257728 () Bool)

(assert (=> b!257728 (= e!167058 (bvadd #b00000000000000000000000000000001 call!24457))))

(declare-fun b!257729 () Bool)

(assert (=> b!257729 (= e!167057 #b00000000000000000000000000000000)))

(assert (= (and d!61899 c!43627) b!257729))

(assert (= (and d!61899 (not c!43627)) b!257727))

(assert (= (and b!257727 c!43626) b!257728))

(assert (= (and b!257727 (not c!43626)) b!257726))

(assert (= (or b!257728 b!257726) bm!24454))

(declare-fun m!273217 () Bool)

(assert (=> b!257727 m!273217))

(assert (=> b!257727 m!273217))

(declare-fun m!273219 () Bool)

(assert (=> b!257727 m!273219))

(declare-fun m!273221 () Bool)

(assert (=> bm!24454 m!273221))

(assert (=> b!257577 d!61899))

(declare-fun d!61901 () Bool)

(declare-fun e!167061 () Bool)

(assert (=> d!61901 e!167061))

(declare-fun res!126048 () Bool)

(assert (=> d!61901 (=> (not res!126048) (not e!167061))))

(assert (=> d!61901 (= res!126048 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6283 (_keys!6920 thiss!1504))) (bvslt index!297 (size!6282 (_values!4735 thiss!1504)))))))

(declare-fun lt!129646 () Unit!7971)

(declare-fun choose!1247 (array!12535 array!12533 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 32) (_ BitVec 64) V!8441 Int) Unit!7971)

(assert (=> d!61901 (= lt!129646 (choose!1247 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) index!297 key!932 v!346 (defaultEntry!4752 thiss!1504)))))

(assert (=> d!61901 (validMask!0 (mask!11042 thiss!1504))))

(assert (=> d!61901 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!103 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) index!297 key!932 v!346 (defaultEntry!4752 thiss!1504)) lt!129646)))

(declare-fun b!257732 () Bool)

(assert (=> b!257732 (= e!167061 (= (+!688 (getCurrentListMap!1423 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)) (tuple2!4837 key!932 v!346)) (getCurrentListMap!1423 (array!12536 (store (arr!5936 (_keys!6920 thiss!1504)) index!297 key!932) (size!6283 (_keys!6920 thiss!1504))) (array!12534 (store (arr!5935 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6282 (_values!4735 thiss!1504))) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504))))))

(assert (= (and d!61901 res!126048) b!257732))

(declare-fun m!273223 () Bool)

(assert (=> d!61901 m!273223))

(assert (=> d!61901 m!273045))

(assert (=> b!257732 m!273025))

(assert (=> b!257732 m!273031))

(declare-fun m!273225 () Bool)

(assert (=> b!257732 m!273225))

(assert (=> b!257732 m!273025))

(declare-fun m!273227 () Bool)

(assert (=> b!257732 m!273227))

(assert (=> b!257732 m!273039))

(assert (=> b!257577 d!61901))

(declare-fun b!257775 () Bool)

(declare-fun e!167093 () Bool)

(declare-fun e!167096 () Bool)

(assert (=> b!257775 (= e!167093 e!167096)))

(declare-fun c!43641 () Bool)

(assert (=> b!257775 (= c!43641 (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257776 () Bool)

(declare-fun e!167094 () Bool)

(declare-fun call!24472 () Bool)

(assert (=> b!257776 (= e!167094 (not call!24472))))

(declare-fun b!257777 () Bool)

(declare-fun e!167097 () Bool)

(declare-fun lt!129691 () ListLongMap!3751)

(declare-fun apply!254 (ListLongMap!3751 (_ BitVec 64)) V!8441)

(assert (=> b!257777 (= e!167097 (= (apply!254 lt!129691 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4593 thiss!1504)))))

(declare-fun b!257778 () Bool)

(declare-fun e!167090 () Bool)

(assert (=> b!257778 (= e!167090 (validKeyInArray!0 (select (arr!5936 lt!129541) #b00000000000000000000000000000000)))))

(declare-fun b!257779 () Bool)

(declare-fun res!126073 () Bool)

(assert (=> b!257779 (=> (not res!126073) (not e!167093))))

(assert (=> b!257779 (= res!126073 e!167094)))

(declare-fun c!43645 () Bool)

(assert (=> b!257779 (= c!43645 (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!257780 () Bool)

(declare-fun e!167100 () Unit!7971)

(declare-fun Unit!7986 () Unit!7971)

(assert (=> b!257780 (= e!167100 Unit!7986)))

(declare-fun b!257781 () Bool)

(declare-fun e!167089 () Bool)

(declare-fun e!167091 () Bool)

(assert (=> b!257781 (= e!167089 e!167091)))

(declare-fun res!126069 () Bool)

(assert (=> b!257781 (=> (not res!126069) (not e!167091))))

(assert (=> b!257781 (= res!126069 (contains!1850 lt!129691 (select (arr!5936 lt!129541) #b00000000000000000000000000000000)))))

(assert (=> b!257781 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6283 lt!129541)))))

(declare-fun b!257783 () Bool)

(declare-fun e!167099 () ListLongMap!3751)

(declare-fun e!167088 () ListLongMap!3751)

(assert (=> b!257783 (= e!167099 e!167088)))

(declare-fun c!43643 () Bool)

(assert (=> b!257783 (= c!43643 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257784 () Bool)

(declare-fun c!43640 () Bool)

(assert (=> b!257784 (= c!43640 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167092 () ListLongMap!3751)

(assert (=> b!257784 (= e!167088 e!167092)))

(declare-fun b!257785 () Bool)

(declare-fun call!24477 () ListLongMap!3751)

(assert (=> b!257785 (= e!167099 (+!688 call!24477 (tuple2!4837 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4593 thiss!1504))))))

(declare-fun b!257786 () Bool)

(declare-fun e!167098 () Bool)

(assert (=> b!257786 (= e!167098 (= (apply!254 lt!129691 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4593 thiss!1504)))))

(declare-fun b!257787 () Bool)

(declare-fun e!167095 () Bool)

(assert (=> b!257787 (= e!167095 (validKeyInArray!0 (select (arr!5936 lt!129541) #b00000000000000000000000000000000)))))

(declare-fun bm!24469 () Bool)

(declare-fun call!24478 () ListLongMap!3751)

(declare-fun call!24475 () ListLongMap!3751)

(assert (=> bm!24469 (= call!24478 call!24475)))

(declare-fun b!257788 () Bool)

(assert (=> b!257788 (= e!167096 e!167098)))

(declare-fun res!126074 () Bool)

(declare-fun call!24474 () Bool)

(assert (=> b!257788 (= res!126074 call!24474)))

(assert (=> b!257788 (=> (not res!126074) (not e!167098))))

(declare-fun bm!24470 () Bool)

(declare-fun call!24473 () ListLongMap!3751)

(assert (=> bm!24470 (= call!24473 call!24477)))

(declare-fun b!257789 () Bool)

(declare-fun lt!129705 () Unit!7971)

(assert (=> b!257789 (= e!167100 lt!129705)))

(declare-fun lt!129695 () ListLongMap!3751)

(declare-fun getCurrentListMapNoExtraKeys!570 (array!12535 array!12533 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 32) Int) ListLongMap!3751)

(assert (=> b!257789 (= lt!129695 (getCurrentListMapNoExtraKeys!570 lt!129541 (array!12534 (store (arr!5935 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6282 (_values!4735 thiss!1504))) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129693 () (_ BitVec 64))

(assert (=> b!257789 (= lt!129693 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129694 () (_ BitVec 64))

(assert (=> b!257789 (= lt!129694 (select (arr!5936 lt!129541) #b00000000000000000000000000000000))))

(declare-fun lt!129710 () Unit!7971)

(declare-fun addStillContains!230 (ListLongMap!3751 (_ BitVec 64) V!8441 (_ BitVec 64)) Unit!7971)

(assert (=> b!257789 (= lt!129710 (addStillContains!230 lt!129695 lt!129693 (zeroValue!4593 thiss!1504) lt!129694))))

(assert (=> b!257789 (contains!1850 (+!688 lt!129695 (tuple2!4837 lt!129693 (zeroValue!4593 thiss!1504))) lt!129694)))

(declare-fun lt!129708 () Unit!7971)

(assert (=> b!257789 (= lt!129708 lt!129710)))

(declare-fun lt!129712 () ListLongMap!3751)

(assert (=> b!257789 (= lt!129712 (getCurrentListMapNoExtraKeys!570 lt!129541 (array!12534 (store (arr!5935 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6282 (_values!4735 thiss!1504))) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129692 () (_ BitVec 64))

(assert (=> b!257789 (= lt!129692 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129698 () (_ BitVec 64))

(assert (=> b!257789 (= lt!129698 (select (arr!5936 lt!129541) #b00000000000000000000000000000000))))

(declare-fun lt!129702 () Unit!7971)

(declare-fun addApplyDifferent!230 (ListLongMap!3751 (_ BitVec 64) V!8441 (_ BitVec 64)) Unit!7971)

(assert (=> b!257789 (= lt!129702 (addApplyDifferent!230 lt!129712 lt!129692 (minValue!4593 thiss!1504) lt!129698))))

(assert (=> b!257789 (= (apply!254 (+!688 lt!129712 (tuple2!4837 lt!129692 (minValue!4593 thiss!1504))) lt!129698) (apply!254 lt!129712 lt!129698))))

(declare-fun lt!129697 () Unit!7971)

(assert (=> b!257789 (= lt!129697 lt!129702)))

(declare-fun lt!129703 () ListLongMap!3751)

(assert (=> b!257789 (= lt!129703 (getCurrentListMapNoExtraKeys!570 lt!129541 (array!12534 (store (arr!5935 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6282 (_values!4735 thiss!1504))) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129699 () (_ BitVec 64))

(assert (=> b!257789 (= lt!129699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129696 () (_ BitVec 64))

(assert (=> b!257789 (= lt!129696 (select (arr!5936 lt!129541) #b00000000000000000000000000000000))))

(declare-fun lt!129707 () Unit!7971)

(assert (=> b!257789 (= lt!129707 (addApplyDifferent!230 lt!129703 lt!129699 (zeroValue!4593 thiss!1504) lt!129696))))

(assert (=> b!257789 (= (apply!254 (+!688 lt!129703 (tuple2!4837 lt!129699 (zeroValue!4593 thiss!1504))) lt!129696) (apply!254 lt!129703 lt!129696))))

(declare-fun lt!129700 () Unit!7971)

(assert (=> b!257789 (= lt!129700 lt!129707)))

(declare-fun lt!129711 () ListLongMap!3751)

(assert (=> b!257789 (= lt!129711 (getCurrentListMapNoExtraKeys!570 lt!129541 (array!12534 (store (arr!5935 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6282 (_values!4735 thiss!1504))) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129706 () (_ BitVec 64))

(assert (=> b!257789 (= lt!129706 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129704 () (_ BitVec 64))

(assert (=> b!257789 (= lt!129704 (select (arr!5936 lt!129541) #b00000000000000000000000000000000))))

(assert (=> b!257789 (= lt!129705 (addApplyDifferent!230 lt!129711 lt!129706 (minValue!4593 thiss!1504) lt!129704))))

(assert (=> b!257789 (= (apply!254 (+!688 lt!129711 (tuple2!4837 lt!129706 (minValue!4593 thiss!1504))) lt!129704) (apply!254 lt!129711 lt!129704))))

(declare-fun b!257790 () Bool)

(assert (=> b!257790 (= e!167094 e!167097)))

(declare-fun res!126070 () Bool)

(assert (=> b!257790 (= res!126070 call!24472)))

(assert (=> b!257790 (=> (not res!126070) (not e!167097))))

(declare-fun b!257782 () Bool)

(assert (=> b!257782 (= e!167088 call!24473)))

(declare-fun d!61903 () Bool)

(assert (=> d!61903 e!167093))

(declare-fun res!126072 () Bool)

(assert (=> d!61903 (=> (not res!126072) (not e!167093))))

(assert (=> d!61903 (= res!126072 (or (bvsge #b00000000000000000000000000000000 (size!6283 lt!129541)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6283 lt!129541)))))))

(declare-fun lt!129701 () ListLongMap!3751)

(assert (=> d!61903 (= lt!129691 lt!129701)))

(declare-fun lt!129709 () Unit!7971)

(assert (=> d!61903 (= lt!129709 e!167100)))

(declare-fun c!43644 () Bool)

(assert (=> d!61903 (= c!43644 e!167095)))

(declare-fun res!126075 () Bool)

(assert (=> d!61903 (=> (not res!126075) (not e!167095))))

(assert (=> d!61903 (= res!126075 (bvslt #b00000000000000000000000000000000 (size!6283 lt!129541)))))

(assert (=> d!61903 (= lt!129701 e!167099)))

(declare-fun c!43642 () Bool)

(assert (=> d!61903 (= c!43642 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61903 (validMask!0 (mask!11042 thiss!1504))))

(assert (=> d!61903 (= (getCurrentListMap!1423 lt!129541 (array!12534 (store (arr!5935 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6282 (_values!4735 thiss!1504))) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)) lt!129691)))

(declare-fun bm!24471 () Bool)

(declare-fun call!24476 () ListLongMap!3751)

(assert (=> bm!24471 (= call!24475 call!24476)))

(declare-fun bm!24472 () Bool)

(assert (=> bm!24472 (= call!24474 (contains!1850 lt!129691 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257791 () Bool)

(assert (=> b!257791 (= e!167092 call!24473)))

(declare-fun b!257792 () Bool)

(declare-fun get!3059 (ValueCell!2954 V!8441) V!8441)

(declare-fun dynLambda!597 (Int (_ BitVec 64)) V!8441)

(assert (=> b!257792 (= e!167091 (= (apply!254 lt!129691 (select (arr!5936 lt!129541) #b00000000000000000000000000000000)) (get!3059 (select (arr!5935 (array!12534 (store (arr!5935 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6282 (_values!4735 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!597 (defaultEntry!4752 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6282 (array!12534 (store (arr!5935 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6282 (_values!4735 thiss!1504))))))))

(assert (=> b!257792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6283 lt!129541)))))

(declare-fun bm!24473 () Bool)

(assert (=> bm!24473 (= call!24476 (getCurrentListMapNoExtraKeys!570 lt!129541 (array!12534 (store (arr!5935 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6282 (_values!4735 thiss!1504))) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun bm!24474 () Bool)

(assert (=> bm!24474 (= call!24477 (+!688 (ite c!43642 call!24476 (ite c!43643 call!24475 call!24478)) (ite (or c!43642 c!43643) (tuple2!4837 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4593 thiss!1504)) (tuple2!4837 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4593 thiss!1504)))))))

(declare-fun bm!24475 () Bool)

(assert (=> bm!24475 (= call!24472 (contains!1850 lt!129691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257793 () Bool)

(declare-fun res!126067 () Bool)

(assert (=> b!257793 (=> (not res!126067) (not e!167093))))

(assert (=> b!257793 (= res!126067 e!167089)))

(declare-fun res!126068 () Bool)

(assert (=> b!257793 (=> res!126068 e!167089)))

(assert (=> b!257793 (= res!126068 (not e!167090))))

(declare-fun res!126071 () Bool)

(assert (=> b!257793 (=> (not res!126071) (not e!167090))))

(assert (=> b!257793 (= res!126071 (bvslt #b00000000000000000000000000000000 (size!6283 lt!129541)))))

(declare-fun b!257794 () Bool)

(assert (=> b!257794 (= e!167096 (not call!24474))))

(declare-fun b!257795 () Bool)

(assert (=> b!257795 (= e!167092 call!24478)))

(assert (= (and d!61903 c!43642) b!257785))

(assert (= (and d!61903 (not c!43642)) b!257783))

(assert (= (and b!257783 c!43643) b!257782))

(assert (= (and b!257783 (not c!43643)) b!257784))

(assert (= (and b!257784 c!43640) b!257791))

(assert (= (and b!257784 (not c!43640)) b!257795))

(assert (= (or b!257791 b!257795) bm!24469))

(assert (= (or b!257782 bm!24469) bm!24471))

(assert (= (or b!257782 b!257791) bm!24470))

(assert (= (or b!257785 bm!24471) bm!24473))

(assert (= (or b!257785 bm!24470) bm!24474))

(assert (= (and d!61903 res!126075) b!257787))

(assert (= (and d!61903 c!43644) b!257789))

(assert (= (and d!61903 (not c!43644)) b!257780))

(assert (= (and d!61903 res!126072) b!257793))

(assert (= (and b!257793 res!126071) b!257778))

(assert (= (and b!257793 (not res!126068)) b!257781))

(assert (= (and b!257781 res!126069) b!257792))

(assert (= (and b!257793 res!126067) b!257779))

(assert (= (and b!257779 c!43645) b!257790))

(assert (= (and b!257779 (not c!43645)) b!257776))

(assert (= (and b!257790 res!126070) b!257777))

(assert (= (or b!257790 b!257776) bm!24475))

(assert (= (and b!257779 res!126073) b!257775))

(assert (= (and b!257775 c!43641) b!257788))

(assert (= (and b!257775 (not c!43641)) b!257794))

(assert (= (and b!257788 res!126074) b!257786))

(assert (= (or b!257788 b!257794) bm!24472))

(declare-fun b_lambda!8209 () Bool)

(assert (=> (not b_lambda!8209) (not b!257792)))

(declare-fun t!8774 () Bool)

(declare-fun tb!3013 () Bool)

(assert (=> (and b!257580 (= (defaultEntry!4752 thiss!1504) (defaultEntry!4752 thiss!1504)) t!8774) tb!3013))

(declare-fun result!5377 () Bool)

(assert (=> tb!3013 (= result!5377 tp_is_empty!6595)))

(assert (=> b!257792 t!8774))

(declare-fun b_and!13823 () Bool)

(assert (= b_and!13817 (and (=> t!8774 result!5377) b_and!13823)))

(declare-fun m!273229 () Bool)

(assert (=> b!257786 m!273229))

(declare-fun m!273231 () Bool)

(assert (=> bm!24472 m!273231))

(declare-fun m!273233 () Bool)

(assert (=> b!257777 m!273233))

(declare-fun m!273235 () Bool)

(assert (=> bm!24474 m!273235))

(declare-fun m!273237 () Bool)

(assert (=> b!257792 m!273237))

(declare-fun m!273239 () Bool)

(assert (=> b!257792 m!273239))

(assert (=> b!257792 m!273237))

(declare-fun m!273241 () Bool)

(assert (=> b!257792 m!273241))

(declare-fun m!273243 () Bool)

(assert (=> b!257792 m!273243))

(assert (=> b!257792 m!273239))

(assert (=> b!257792 m!273243))

(declare-fun m!273245 () Bool)

(assert (=> b!257792 m!273245))

(declare-fun m!273247 () Bool)

(assert (=> b!257789 m!273247))

(declare-fun m!273249 () Bool)

(assert (=> b!257789 m!273249))

(declare-fun m!273251 () Bool)

(assert (=> b!257789 m!273251))

(declare-fun m!273253 () Bool)

(assert (=> b!257789 m!273253))

(assert (=> b!257789 m!273243))

(declare-fun m!273255 () Bool)

(assert (=> b!257789 m!273255))

(declare-fun m!273257 () Bool)

(assert (=> b!257789 m!273257))

(declare-fun m!273259 () Bool)

(assert (=> b!257789 m!273259))

(assert (=> b!257789 m!273255))

(declare-fun m!273261 () Bool)

(assert (=> b!257789 m!273261))

(declare-fun m!273263 () Bool)

(assert (=> b!257789 m!273263))

(declare-fun m!273265 () Bool)

(assert (=> b!257789 m!273265))

(assert (=> b!257789 m!273249))

(assert (=> b!257789 m!273259))

(declare-fun m!273267 () Bool)

(assert (=> b!257789 m!273267))

(declare-fun m!273269 () Bool)

(assert (=> b!257789 m!273269))

(declare-fun m!273271 () Bool)

(assert (=> b!257789 m!273271))

(declare-fun m!273273 () Bool)

(assert (=> b!257789 m!273273))

(declare-fun m!273275 () Bool)

(assert (=> b!257789 m!273275))

(declare-fun m!273277 () Bool)

(assert (=> b!257789 m!273277))

(assert (=> b!257789 m!273271))

(declare-fun m!273279 () Bool)

(assert (=> b!257785 m!273279))

(assert (=> b!257787 m!273243))

(assert (=> b!257787 m!273243))

(declare-fun m!273281 () Bool)

(assert (=> b!257787 m!273281))

(assert (=> bm!24473 m!273265))

(declare-fun m!273283 () Bool)

(assert (=> bm!24475 m!273283))

(assert (=> b!257781 m!273243))

(assert (=> b!257781 m!273243))

(declare-fun m!273285 () Bool)

(assert (=> b!257781 m!273285))

(assert (=> b!257778 m!273243))

(assert (=> b!257778 m!273243))

(assert (=> b!257778 m!273281))

(assert (=> d!61903 m!273045))

(assert (=> b!257577 d!61903))

(declare-fun d!61905 () Bool)

(declare-fun res!126080 () Bool)

(declare-fun e!167105 () Bool)

(assert (=> d!61905 (=> res!126080 e!167105)))

(assert (=> d!61905 (= res!126080 (= (select (arr!5936 lt!129541) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61905 (= (arrayContainsKey!0 lt!129541 key!932 #b00000000000000000000000000000000) e!167105)))

(declare-fun b!257802 () Bool)

(declare-fun e!167106 () Bool)

(assert (=> b!257802 (= e!167105 e!167106)))

(declare-fun res!126081 () Bool)

(assert (=> b!257802 (=> (not res!126081) (not e!167106))))

(assert (=> b!257802 (= res!126081 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6283 lt!129541)))))

(declare-fun b!257803 () Bool)

(assert (=> b!257803 (= e!167106 (arrayContainsKey!0 lt!129541 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61905 (not res!126080)) b!257802))

(assert (= (and b!257802 res!126081) b!257803))

(assert (=> d!61905 m!273243))

(declare-fun m!273287 () Bool)

(assert (=> b!257803 m!273287))

(assert (=> b!257577 d!61905))

(declare-fun b!257814 () Bool)

(declare-fun e!167118 () Bool)

(declare-fun contains!1852 (List!3715 (_ BitVec 64)) Bool)

(assert (=> b!257814 (= e!167118 (contains!1852 Nil!3712 (select (arr!5936 lt!129541) #b00000000000000000000000000000000)))))

(declare-fun bm!24478 () Bool)

(declare-fun call!24481 () Bool)

(declare-fun c!43648 () Bool)

(assert (=> bm!24478 (= call!24481 (arrayNoDuplicates!0 lt!129541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43648 (Cons!3711 (select (arr!5936 lt!129541) #b00000000000000000000000000000000) Nil!3712) Nil!3712)))))

(declare-fun b!257815 () Bool)

(declare-fun e!167117 () Bool)

(declare-fun e!167116 () Bool)

(assert (=> b!257815 (= e!167117 e!167116)))

(declare-fun res!126088 () Bool)

(assert (=> b!257815 (=> (not res!126088) (not e!167116))))

(assert (=> b!257815 (= res!126088 (not e!167118))))

(declare-fun res!126089 () Bool)

(assert (=> b!257815 (=> (not res!126089) (not e!167118))))

(assert (=> b!257815 (= res!126089 (validKeyInArray!0 (select (arr!5936 lt!129541) #b00000000000000000000000000000000)))))

(declare-fun d!61907 () Bool)

(declare-fun res!126090 () Bool)

(assert (=> d!61907 (=> res!126090 e!167117)))

(assert (=> d!61907 (= res!126090 (bvsge #b00000000000000000000000000000000 (size!6283 lt!129541)))))

(assert (=> d!61907 (= (arrayNoDuplicates!0 lt!129541 #b00000000000000000000000000000000 Nil!3712) e!167117)))

(declare-fun b!257816 () Bool)

(declare-fun e!167115 () Bool)

(assert (=> b!257816 (= e!167115 call!24481)))

(declare-fun b!257817 () Bool)

(assert (=> b!257817 (= e!167115 call!24481)))

(declare-fun b!257818 () Bool)

(assert (=> b!257818 (= e!167116 e!167115)))

(assert (=> b!257818 (= c!43648 (validKeyInArray!0 (select (arr!5936 lt!129541) #b00000000000000000000000000000000)))))

(assert (= (and d!61907 (not res!126090)) b!257815))

(assert (= (and b!257815 res!126089) b!257814))

(assert (= (and b!257815 res!126088) b!257818))

(assert (= (and b!257818 c!43648) b!257816))

(assert (= (and b!257818 (not c!43648)) b!257817))

(assert (= (or b!257816 b!257817) bm!24478))

(assert (=> b!257814 m!273243))

(assert (=> b!257814 m!273243))

(declare-fun m!273289 () Bool)

(assert (=> b!257814 m!273289))

(assert (=> bm!24478 m!273243))

(declare-fun m!273291 () Bool)

(assert (=> bm!24478 m!273291))

(assert (=> b!257815 m!273243))

(assert (=> b!257815 m!273243))

(assert (=> b!257815 m!273281))

(assert (=> b!257818 m!273243))

(assert (=> b!257818 m!273243))

(assert (=> b!257818 m!273281))

(assert (=> b!257577 d!61907))

(declare-fun b!257819 () Bool)

(declare-fun e!167120 () (_ BitVec 32))

(declare-fun call!24482 () (_ BitVec 32))

(assert (=> b!257819 (= e!167120 call!24482)))

(declare-fun b!257820 () Bool)

(declare-fun e!167119 () (_ BitVec 32))

(assert (=> b!257820 (= e!167119 e!167120)))

(declare-fun c!43649 () Bool)

(assert (=> b!257820 (= c!43649 (validKeyInArray!0 (select (arr!5936 lt!129541) index!297)))))

(declare-fun bm!24479 () Bool)

(assert (=> bm!24479 (= call!24482 (arrayCountValidKeys!0 lt!129541 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun d!61909 () Bool)

(declare-fun lt!129713 () (_ BitVec 32))

(assert (=> d!61909 (and (bvsge lt!129713 #b00000000000000000000000000000000) (bvsle lt!129713 (bvsub (size!6283 lt!129541) index!297)))))

(assert (=> d!61909 (= lt!129713 e!167119)))

(declare-fun c!43650 () Bool)

(assert (=> d!61909 (= c!43650 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!61909 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6283 lt!129541)))))

(assert (=> d!61909 (= (arrayCountValidKeys!0 lt!129541 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!129713)))

(declare-fun b!257821 () Bool)

(assert (=> b!257821 (= e!167120 (bvadd #b00000000000000000000000000000001 call!24482))))

(declare-fun b!257822 () Bool)

(assert (=> b!257822 (= e!167119 #b00000000000000000000000000000000)))

(assert (= (and d!61909 c!43650) b!257822))

(assert (= (and d!61909 (not c!43650)) b!257820))

(assert (= (and b!257820 c!43649) b!257821))

(assert (= (and b!257820 (not c!43649)) b!257819))

(assert (= (or b!257821 b!257819) bm!24479))

(declare-fun m!273293 () Bool)

(assert (=> b!257820 m!273293))

(assert (=> b!257820 m!273293))

(declare-fun m!273295 () Bool)

(assert (=> b!257820 m!273295))

(declare-fun m!273297 () Bool)

(assert (=> bm!24479 m!273297))

(assert (=> b!257577 d!61909))

(declare-fun d!61911 () Bool)

(declare-fun e!167123 () Bool)

(assert (=> d!61911 e!167123))

(declare-fun res!126093 () Bool)

(assert (=> d!61911 (=> (not res!126093) (not e!167123))))

(assert (=> d!61911 (= res!126093 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6283 (_keys!6920 thiss!1504)))))))

(declare-fun lt!129716 () Unit!7971)

(declare-fun choose!41 (array!12535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3715) Unit!7971)

(assert (=> d!61911 (= lt!129716 (choose!41 (_keys!6920 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3712))))

(assert (=> d!61911 (bvslt (size!6283 (_keys!6920 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61911 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6920 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3712) lt!129716)))

(declare-fun b!257825 () Bool)

(assert (=> b!257825 (= e!167123 (arrayNoDuplicates!0 (array!12536 (store (arr!5936 (_keys!6920 thiss!1504)) index!297 key!932) (size!6283 (_keys!6920 thiss!1504))) #b00000000000000000000000000000000 Nil!3712))))

(assert (= (and d!61911 res!126093) b!257825))

(declare-fun m!273299 () Bool)

(assert (=> d!61911 m!273299))

(assert (=> b!257825 m!273039))

(declare-fun m!273301 () Bool)

(assert (=> b!257825 m!273301))

(assert (=> b!257577 d!61911))

(declare-fun d!61913 () Bool)

(declare-fun e!167126 () Bool)

(assert (=> d!61913 e!167126))

(declare-fun res!126098 () Bool)

(assert (=> d!61913 (=> (not res!126098) (not e!167126))))

(declare-fun lt!129727 () ListLongMap!3751)

(assert (=> d!61913 (= res!126098 (contains!1850 lt!129727 (_1!2429 (tuple2!4837 key!932 v!346))))))

(declare-fun lt!129725 () List!3714)

(assert (=> d!61913 (= lt!129727 (ListLongMap!3752 lt!129725))))

(declare-fun lt!129728 () Unit!7971)

(declare-fun lt!129726 () Unit!7971)

(assert (=> d!61913 (= lt!129728 lt!129726)))

(declare-datatypes ((Option!319 0))(
  ( (Some!318 (v!5443 V!8441)) (None!317) )
))
(declare-fun getValueByKey!313 (List!3714 (_ BitVec 64)) Option!319)

(assert (=> d!61913 (= (getValueByKey!313 lt!129725 (_1!2429 (tuple2!4837 key!932 v!346))) (Some!318 (_2!2429 (tuple2!4837 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!169 (List!3714 (_ BitVec 64) V!8441) Unit!7971)

(assert (=> d!61913 (= lt!129726 (lemmaContainsTupThenGetReturnValue!169 lt!129725 (_1!2429 (tuple2!4837 key!932 v!346)) (_2!2429 (tuple2!4837 key!932 v!346))))))

(declare-fun insertStrictlySorted!172 (List!3714 (_ BitVec 64) V!8441) List!3714)

(assert (=> d!61913 (= lt!129725 (insertStrictlySorted!172 (toList!1891 lt!129540) (_1!2429 (tuple2!4837 key!932 v!346)) (_2!2429 (tuple2!4837 key!932 v!346))))))

(assert (=> d!61913 (= (+!688 lt!129540 (tuple2!4837 key!932 v!346)) lt!129727)))

(declare-fun b!257830 () Bool)

(declare-fun res!126099 () Bool)

(assert (=> b!257830 (=> (not res!126099) (not e!167126))))

(assert (=> b!257830 (= res!126099 (= (getValueByKey!313 (toList!1891 lt!129727) (_1!2429 (tuple2!4837 key!932 v!346))) (Some!318 (_2!2429 (tuple2!4837 key!932 v!346)))))))

(declare-fun b!257831 () Bool)

(declare-fun contains!1853 (List!3714 tuple2!4836) Bool)

(assert (=> b!257831 (= e!167126 (contains!1853 (toList!1891 lt!129727) (tuple2!4837 key!932 v!346)))))

(assert (= (and d!61913 res!126098) b!257830))

(assert (= (and b!257830 res!126099) b!257831))

(declare-fun m!273303 () Bool)

(assert (=> d!61913 m!273303))

(declare-fun m!273305 () Bool)

(assert (=> d!61913 m!273305))

(declare-fun m!273307 () Bool)

(assert (=> d!61913 m!273307))

(declare-fun m!273309 () Bool)

(assert (=> d!61913 m!273309))

(declare-fun m!273311 () Bool)

(assert (=> b!257830 m!273311))

(declare-fun m!273313 () Bool)

(assert (=> b!257831 m!273313))

(assert (=> b!257577 d!61913))

(declare-fun b!257832 () Bool)

(declare-fun e!167128 () (_ BitVec 32))

(declare-fun call!24483 () (_ BitVec 32))

(assert (=> b!257832 (= e!167128 call!24483)))

(declare-fun b!257833 () Bool)

(declare-fun e!167127 () (_ BitVec 32))

(assert (=> b!257833 (= e!167127 e!167128)))

(declare-fun c!43651 () Bool)

(assert (=> b!257833 (= c!43651 (validKeyInArray!0 (select (arr!5936 lt!129541) #b00000000000000000000000000000000)))))

(declare-fun bm!24480 () Bool)

(assert (=> bm!24480 (= call!24483 (arrayCountValidKeys!0 lt!129541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6283 (_keys!6920 thiss!1504))))))

(declare-fun d!61915 () Bool)

(declare-fun lt!129729 () (_ BitVec 32))

(assert (=> d!61915 (and (bvsge lt!129729 #b00000000000000000000000000000000) (bvsle lt!129729 (bvsub (size!6283 lt!129541) #b00000000000000000000000000000000)))))

(assert (=> d!61915 (= lt!129729 e!167127)))

(declare-fun c!43652 () Bool)

(assert (=> d!61915 (= c!43652 (bvsge #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))))))

(assert (=> d!61915 (and (bvsle #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6283 (_keys!6920 thiss!1504)) (size!6283 lt!129541)))))

(assert (=> d!61915 (= (arrayCountValidKeys!0 lt!129541 #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))) lt!129729)))

(declare-fun b!257834 () Bool)

(assert (=> b!257834 (= e!167128 (bvadd #b00000000000000000000000000000001 call!24483))))

(declare-fun b!257835 () Bool)

(assert (=> b!257835 (= e!167127 #b00000000000000000000000000000000)))

(assert (= (and d!61915 c!43652) b!257835))

(assert (= (and d!61915 (not c!43652)) b!257833))

(assert (= (and b!257833 c!43651) b!257834))

(assert (= (and b!257833 (not c!43651)) b!257832))

(assert (= (or b!257834 b!257832) bm!24480))

(assert (=> b!257833 m!273243))

(assert (=> b!257833 m!273243))

(assert (=> b!257833 m!273281))

(declare-fun m!273315 () Bool)

(assert (=> bm!24480 m!273315))

(assert (=> b!257577 d!61915))

(declare-fun d!61917 () Bool)

(declare-fun res!126100 () Bool)

(declare-fun e!167129 () Bool)

(assert (=> d!61917 (=> res!126100 e!167129)))

(assert (=> d!61917 (= res!126100 (= (select (arr!5936 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61917 (= (arrayContainsKey!0 (_keys!6920 thiss!1504) key!932 #b00000000000000000000000000000000) e!167129)))

(declare-fun b!257836 () Bool)

(declare-fun e!167130 () Bool)

(assert (=> b!257836 (= e!167129 e!167130)))

(declare-fun res!126101 () Bool)

(assert (=> b!257836 (=> (not res!126101) (not e!167130))))

(assert (=> b!257836 (= res!126101 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6283 (_keys!6920 thiss!1504))))))

(declare-fun b!257837 () Bool)

(assert (=> b!257837 (= e!167130 (arrayContainsKey!0 (_keys!6920 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61917 (not res!126100)) b!257836))

(assert (= (and b!257836 res!126101) b!257837))

(assert (=> d!61917 m!273217))

(declare-fun m!273317 () Bool)

(assert (=> b!257837 m!273317))

(assert (=> b!257577 d!61917))

(declare-fun d!61919 () Bool)

(declare-fun e!167133 () Bool)

(assert (=> d!61919 e!167133))

(declare-fun res!126104 () Bool)

(assert (=> d!61919 (=> (not res!126104) (not e!167133))))

(assert (=> d!61919 (= res!126104 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6283 (_keys!6920 thiss!1504)))))))

(declare-fun lt!129732 () Unit!7971)

(declare-fun choose!102 ((_ BitVec 64) array!12535 (_ BitVec 32) (_ BitVec 32)) Unit!7971)

(assert (=> d!61919 (= lt!129732 (choose!102 key!932 (_keys!6920 thiss!1504) index!297 (mask!11042 thiss!1504)))))

(assert (=> d!61919 (validMask!0 (mask!11042 thiss!1504))))

(assert (=> d!61919 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6920 thiss!1504) index!297 (mask!11042 thiss!1504)) lt!129732)))

(declare-fun b!257840 () Bool)

(assert (=> b!257840 (= e!167133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12536 (store (arr!5936 (_keys!6920 thiss!1504)) index!297 key!932) (size!6283 (_keys!6920 thiss!1504))) (mask!11042 thiss!1504)))))

(assert (= (and d!61919 res!126104) b!257840))

(declare-fun m!273319 () Bool)

(assert (=> d!61919 m!273319))

(assert (=> d!61919 m!273045))

(assert (=> b!257840 m!273039))

(declare-fun m!273321 () Bool)

(assert (=> b!257840 m!273321))

(assert (=> b!257577 d!61919))

(declare-fun d!61921 () Bool)

(assert (=> d!61921 (= (validMask!0 (mask!11042 thiss!1504)) (and (or (= (mask!11042 thiss!1504) #b00000000000000000000000000000111) (= (mask!11042 thiss!1504) #b00000000000000000000000000001111) (= (mask!11042 thiss!1504) #b00000000000000000000000000011111) (= (mask!11042 thiss!1504) #b00000000000000000000000000111111) (= (mask!11042 thiss!1504) #b00000000000000000000000001111111) (= (mask!11042 thiss!1504) #b00000000000000000000000011111111) (= (mask!11042 thiss!1504) #b00000000000000000000000111111111) (= (mask!11042 thiss!1504) #b00000000000000000000001111111111) (= (mask!11042 thiss!1504) #b00000000000000000000011111111111) (= (mask!11042 thiss!1504) #b00000000000000000000111111111111) (= (mask!11042 thiss!1504) #b00000000000000000001111111111111) (= (mask!11042 thiss!1504) #b00000000000000000011111111111111) (= (mask!11042 thiss!1504) #b00000000000000000111111111111111) (= (mask!11042 thiss!1504) #b00000000000000001111111111111111) (= (mask!11042 thiss!1504) #b00000000000000011111111111111111) (= (mask!11042 thiss!1504) #b00000000000000111111111111111111) (= (mask!11042 thiss!1504) #b00000000000001111111111111111111) (= (mask!11042 thiss!1504) #b00000000000011111111111111111111) (= (mask!11042 thiss!1504) #b00000000000111111111111111111111) (= (mask!11042 thiss!1504) #b00000000001111111111111111111111) (= (mask!11042 thiss!1504) #b00000000011111111111111111111111) (= (mask!11042 thiss!1504) #b00000000111111111111111111111111) (= (mask!11042 thiss!1504) #b00000001111111111111111111111111) (= (mask!11042 thiss!1504) #b00000011111111111111111111111111) (= (mask!11042 thiss!1504) #b00000111111111111111111111111111) (= (mask!11042 thiss!1504) #b00001111111111111111111111111111) (= (mask!11042 thiss!1504) #b00011111111111111111111111111111) (= (mask!11042 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11042 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!257577 d!61921))

(declare-fun b!257849 () Bool)

(declare-fun e!167141 () Bool)

(declare-fun e!167140 () Bool)

(assert (=> b!257849 (= e!167141 e!167140)))

(declare-fun c!43655 () Bool)

(assert (=> b!257849 (= c!43655 (validKeyInArray!0 (select (arr!5936 lt!129541) #b00000000000000000000000000000000)))))

(declare-fun b!257850 () Bool)

(declare-fun e!167142 () Bool)

(assert (=> b!257850 (= e!167140 e!167142)))

(declare-fun lt!129741 () (_ BitVec 64))

(assert (=> b!257850 (= lt!129741 (select (arr!5936 lt!129541) #b00000000000000000000000000000000))))

(declare-fun lt!129740 () Unit!7971)

(assert (=> b!257850 (= lt!129740 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129541 lt!129741 #b00000000000000000000000000000000))))

(assert (=> b!257850 (arrayContainsKey!0 lt!129541 lt!129741 #b00000000000000000000000000000000)))

(declare-fun lt!129739 () Unit!7971)

(assert (=> b!257850 (= lt!129739 lt!129740)))

(declare-fun res!126109 () Bool)

(assert (=> b!257850 (= res!126109 (= (seekEntryOrOpen!0 (select (arr!5936 lt!129541) #b00000000000000000000000000000000) lt!129541 (mask!11042 thiss!1504)) (Found!1138 #b00000000000000000000000000000000)))))

(assert (=> b!257850 (=> (not res!126109) (not e!167142))))

(declare-fun bm!24483 () Bool)

(declare-fun call!24486 () Bool)

(assert (=> bm!24483 (= call!24486 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129541 (mask!11042 thiss!1504)))))

(declare-fun d!61923 () Bool)

(declare-fun res!126110 () Bool)

(assert (=> d!61923 (=> res!126110 e!167141)))

(assert (=> d!61923 (= res!126110 (bvsge #b00000000000000000000000000000000 (size!6283 lt!129541)))))

(assert (=> d!61923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129541 (mask!11042 thiss!1504)) e!167141)))

(declare-fun b!257851 () Bool)

(assert (=> b!257851 (= e!167142 call!24486)))

(declare-fun b!257852 () Bool)

(assert (=> b!257852 (= e!167140 call!24486)))

(assert (= (and d!61923 (not res!126110)) b!257849))

(assert (= (and b!257849 c!43655) b!257850))

(assert (= (and b!257849 (not c!43655)) b!257852))

(assert (= (and b!257850 res!126109) b!257851))

(assert (= (or b!257851 b!257852) bm!24483))

(assert (=> b!257849 m!273243))

(assert (=> b!257849 m!273243))

(assert (=> b!257849 m!273281))

(assert (=> b!257850 m!273243))

(declare-fun m!273323 () Bool)

(assert (=> b!257850 m!273323))

(declare-fun m!273325 () Bool)

(assert (=> b!257850 m!273325))

(assert (=> b!257850 m!273243))

(declare-fun m!273327 () Bool)

(assert (=> b!257850 m!273327))

(declare-fun m!273329 () Bool)

(assert (=> bm!24483 m!273329))

(assert (=> b!257577 d!61923))

(declare-fun d!61925 () Bool)

(assert (=> d!61925 (arrayContainsKey!0 lt!129541 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129744 () Unit!7971)

(declare-fun choose!13 (array!12535 (_ BitVec 64) (_ BitVec 32)) Unit!7971)

(assert (=> d!61925 (= lt!129744 (choose!13 lt!129541 key!932 index!297))))

(assert (=> d!61925 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61925 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129541 key!932 index!297) lt!129744)))

(declare-fun bs!9104 () Bool)

(assert (= bs!9104 d!61925))

(assert (=> bs!9104 m!273061))

(declare-fun m!273331 () Bool)

(assert (=> bs!9104 m!273331))

(assert (=> b!257577 d!61925))

(declare-fun d!61927 () Bool)

(assert (=> d!61927 (= (arrayCountValidKeys!0 lt!129541 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!129747 () Unit!7971)

(declare-fun choose!2 (array!12535 (_ BitVec 32)) Unit!7971)

(assert (=> d!61927 (= lt!129747 (choose!2 lt!129541 index!297))))

(declare-fun e!167145 () Bool)

(assert (=> d!61927 e!167145))

(declare-fun res!126115 () Bool)

(assert (=> d!61927 (=> (not res!126115) (not e!167145))))

(assert (=> d!61927 (= res!126115 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6283 lt!129541))))))

(assert (=> d!61927 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129541 index!297) lt!129747)))

(declare-fun b!257857 () Bool)

(declare-fun res!126116 () Bool)

(assert (=> b!257857 (=> (not res!126116) (not e!167145))))

(assert (=> b!257857 (= res!126116 (validKeyInArray!0 (select (arr!5936 lt!129541) index!297)))))

(declare-fun b!257858 () Bool)

(assert (=> b!257858 (= e!167145 (bvslt (size!6283 lt!129541) #b01111111111111111111111111111111))))

(assert (= (and d!61927 res!126115) b!257857))

(assert (= (and b!257857 res!126116) b!257858))

(declare-fun m!273333 () Bool)

(assert (=> d!61927 m!273333))

(declare-fun m!273335 () Bool)

(assert (=> d!61927 m!273335))

(assert (=> b!257857 m!273293))

(assert (=> b!257857 m!273293))

(assert (=> b!257857 m!273295))

(assert (=> b!257577 d!61927))

(declare-fun d!61929 () Bool)

(declare-fun e!167156 () Bool)

(assert (=> d!61929 e!167156))

(declare-fun c!43661 () Bool)

(declare-fun lt!129753 () SeekEntryResult!1138)

(assert (=> d!61929 (= c!43661 ((_ is MissingZero!1138) lt!129753))))

(assert (=> d!61929 (= lt!129753 (seekEntryOrOpen!0 key!932 (_keys!6920 thiss!1504) (mask!11042 thiss!1504)))))

(declare-fun lt!129752 () Unit!7971)

(declare-fun choose!1248 (array!12535 array!12533 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) Int) Unit!7971)

(assert (=> d!61929 (= lt!129752 (choose!1248 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)))))

(assert (=> d!61929 (validMask!0 (mask!11042 thiss!1504))))

(assert (=> d!61929 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!422 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)) lt!129752)))

(declare-fun b!257875 () Bool)

(assert (=> b!257875 (and (bvsge (index!6722 lt!129753) #b00000000000000000000000000000000) (bvslt (index!6722 lt!129753) (size!6283 (_keys!6920 thiss!1504))))))

(declare-fun res!126125 () Bool)

(assert (=> b!257875 (= res!126125 (= (select (arr!5936 (_keys!6920 thiss!1504)) (index!6722 lt!129753)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167157 () Bool)

(assert (=> b!257875 (=> (not res!126125) (not e!167157))))

(declare-fun b!257876 () Bool)

(assert (=> b!257876 (= e!167156 e!167157)))

(declare-fun res!126127 () Bool)

(declare-fun call!24491 () Bool)

(assert (=> b!257876 (= res!126127 call!24491)))

(assert (=> b!257876 (=> (not res!126127) (not e!167157))))

(declare-fun bm!24488 () Bool)

(assert (=> bm!24488 (= call!24491 (inRange!0 (ite c!43661 (index!6722 lt!129753) (index!6725 lt!129753)) (mask!11042 thiss!1504)))))

(declare-fun b!257877 () Bool)

(declare-fun e!167155 () Bool)

(declare-fun call!24492 () Bool)

(assert (=> b!257877 (= e!167155 (not call!24492))))

(declare-fun b!257878 () Bool)

(declare-fun e!167154 () Bool)

(assert (=> b!257878 (= e!167154 ((_ is Undefined!1138) lt!129753))))

(declare-fun b!257879 () Bool)

(assert (=> b!257879 (= e!167156 e!167154)))

(declare-fun c!43660 () Bool)

(assert (=> b!257879 (= c!43660 ((_ is MissingVacant!1138) lt!129753))))

(declare-fun bm!24489 () Bool)

(assert (=> bm!24489 (= call!24492 (arrayContainsKey!0 (_keys!6920 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257880 () Bool)

(declare-fun res!126126 () Bool)

(assert (=> b!257880 (=> (not res!126126) (not e!167155))))

(assert (=> b!257880 (= res!126126 (= (select (arr!5936 (_keys!6920 thiss!1504)) (index!6725 lt!129753)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257880 (and (bvsge (index!6725 lt!129753) #b00000000000000000000000000000000) (bvslt (index!6725 lt!129753) (size!6283 (_keys!6920 thiss!1504))))))

(declare-fun b!257881 () Bool)

(assert (=> b!257881 (= e!167157 (not call!24492))))

(declare-fun b!257882 () Bool)

(declare-fun res!126128 () Bool)

(assert (=> b!257882 (=> (not res!126128) (not e!167155))))

(assert (=> b!257882 (= res!126128 call!24491)))

(assert (=> b!257882 (= e!167154 e!167155)))

(assert (= (and d!61929 c!43661) b!257876))

(assert (= (and d!61929 (not c!43661)) b!257879))

(assert (= (and b!257876 res!126127) b!257875))

(assert (= (and b!257875 res!126125) b!257881))

(assert (= (and b!257879 c!43660) b!257882))

(assert (= (and b!257879 (not c!43660)) b!257878))

(assert (= (and b!257882 res!126128) b!257880))

(assert (= (and b!257880 res!126126) b!257877))

(assert (= (or b!257876 b!257882) bm!24488))

(assert (= (or b!257881 b!257877) bm!24489))

(declare-fun m!273337 () Bool)

(assert (=> bm!24488 m!273337))

(declare-fun m!273339 () Bool)

(assert (=> b!257880 m!273339))

(assert (=> d!61929 m!273077))

(declare-fun m!273341 () Bool)

(assert (=> d!61929 m!273341))

(assert (=> d!61929 m!273045))

(assert (=> bm!24489 m!273051))

(declare-fun m!273343 () Bool)

(assert (=> b!257875 m!273343))

(assert (=> b!257583 d!61929))

(assert (=> bm!24439 d!61917))

(declare-fun d!61931 () Bool)

(assert (=> d!61931 (= (inRange!0 index!297 (mask!11042 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11042 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!257566 d!61931))

(declare-fun d!61933 () Bool)

(declare-fun e!167163 () Bool)

(assert (=> d!61933 e!167163))

(declare-fun res!126131 () Bool)

(assert (=> d!61933 (=> res!126131 e!167163)))

(declare-fun lt!129762 () Bool)

(assert (=> d!61933 (= res!126131 (not lt!129762))))

(declare-fun lt!129764 () Bool)

(assert (=> d!61933 (= lt!129762 lt!129764)))

(declare-fun lt!129765 () Unit!7971)

(declare-fun e!167162 () Unit!7971)

(assert (=> d!61933 (= lt!129765 e!167162)))

(declare-fun c!43664 () Bool)

(assert (=> d!61933 (= c!43664 lt!129764)))

(declare-fun containsKey!304 (List!3714 (_ BitVec 64)) Bool)

(assert (=> d!61933 (= lt!129764 (containsKey!304 (toList!1891 lt!129540) key!932))))

(assert (=> d!61933 (= (contains!1850 lt!129540 key!932) lt!129762)))

(declare-fun b!257889 () Bool)

(declare-fun lt!129763 () Unit!7971)

(assert (=> b!257889 (= e!167162 lt!129763)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!252 (List!3714 (_ BitVec 64)) Unit!7971)

(assert (=> b!257889 (= lt!129763 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1891 lt!129540) key!932))))

(declare-fun isDefined!253 (Option!319) Bool)

(assert (=> b!257889 (isDefined!253 (getValueByKey!313 (toList!1891 lt!129540) key!932))))

(declare-fun b!257890 () Bool)

(declare-fun Unit!7987 () Unit!7971)

(assert (=> b!257890 (= e!167162 Unit!7987)))

(declare-fun b!257891 () Bool)

(assert (=> b!257891 (= e!167163 (isDefined!253 (getValueByKey!313 (toList!1891 lt!129540) key!932)))))

(assert (= (and d!61933 c!43664) b!257889))

(assert (= (and d!61933 (not c!43664)) b!257890))

(assert (= (and d!61933 (not res!126131)) b!257891))

(declare-fun m!273345 () Bool)

(assert (=> d!61933 m!273345))

(declare-fun m!273347 () Bool)

(assert (=> b!257889 m!273347))

(declare-fun m!273349 () Bool)

(assert (=> b!257889 m!273349))

(assert (=> b!257889 m!273349))

(declare-fun m!273351 () Bool)

(assert (=> b!257889 m!273351))

(assert (=> b!257891 m!273349))

(assert (=> b!257891 m!273349))

(assert (=> b!257891 m!273351))

(assert (=> b!257566 d!61933))

(declare-fun b!257892 () Bool)

(declare-fun e!167169 () Bool)

(declare-fun e!167172 () Bool)

(assert (=> b!257892 (= e!167169 e!167172)))

(declare-fun c!43666 () Bool)

(assert (=> b!257892 (= c!43666 (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257893 () Bool)

(declare-fun e!167170 () Bool)

(declare-fun call!24493 () Bool)

(assert (=> b!257893 (= e!167170 (not call!24493))))

(declare-fun b!257894 () Bool)

(declare-fun e!167173 () Bool)

(declare-fun lt!129766 () ListLongMap!3751)

(assert (=> b!257894 (= e!167173 (= (apply!254 lt!129766 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4593 thiss!1504)))))

(declare-fun b!257895 () Bool)

(declare-fun e!167166 () Bool)

(assert (=> b!257895 (= e!167166 (validKeyInArray!0 (select (arr!5936 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257896 () Bool)

(declare-fun res!126138 () Bool)

(assert (=> b!257896 (=> (not res!126138) (not e!167169))))

(assert (=> b!257896 (= res!126138 e!167170)))

(declare-fun c!43670 () Bool)

(assert (=> b!257896 (= c!43670 (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!257897 () Bool)

(declare-fun e!167176 () Unit!7971)

(declare-fun Unit!7988 () Unit!7971)

(assert (=> b!257897 (= e!167176 Unit!7988)))

(declare-fun b!257898 () Bool)

(declare-fun e!167165 () Bool)

(declare-fun e!167167 () Bool)

(assert (=> b!257898 (= e!167165 e!167167)))

(declare-fun res!126134 () Bool)

(assert (=> b!257898 (=> (not res!126134) (not e!167167))))

(assert (=> b!257898 (= res!126134 (contains!1850 lt!129766 (select (arr!5936 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!257898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))))))

(declare-fun b!257900 () Bool)

(declare-fun e!167175 () ListLongMap!3751)

(declare-fun e!167164 () ListLongMap!3751)

(assert (=> b!257900 (= e!167175 e!167164)))

(declare-fun c!43668 () Bool)

(assert (=> b!257900 (= c!43668 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257901 () Bool)

(declare-fun c!43665 () Bool)

(assert (=> b!257901 (= c!43665 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167168 () ListLongMap!3751)

(assert (=> b!257901 (= e!167164 e!167168)))

(declare-fun b!257902 () Bool)

(declare-fun call!24498 () ListLongMap!3751)

(assert (=> b!257902 (= e!167175 (+!688 call!24498 (tuple2!4837 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4593 thiss!1504))))))

(declare-fun b!257903 () Bool)

(declare-fun e!167174 () Bool)

(assert (=> b!257903 (= e!167174 (= (apply!254 lt!129766 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4593 thiss!1504)))))

(declare-fun b!257904 () Bool)

(declare-fun e!167171 () Bool)

(assert (=> b!257904 (= e!167171 (validKeyInArray!0 (select (arr!5936 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24490 () Bool)

(declare-fun call!24499 () ListLongMap!3751)

(declare-fun call!24496 () ListLongMap!3751)

(assert (=> bm!24490 (= call!24499 call!24496)))

(declare-fun b!257905 () Bool)

(assert (=> b!257905 (= e!167172 e!167174)))

(declare-fun res!126139 () Bool)

(declare-fun call!24495 () Bool)

(assert (=> b!257905 (= res!126139 call!24495)))

(assert (=> b!257905 (=> (not res!126139) (not e!167174))))

(declare-fun bm!24491 () Bool)

(declare-fun call!24494 () ListLongMap!3751)

(assert (=> bm!24491 (= call!24494 call!24498)))

(declare-fun b!257906 () Bool)

(declare-fun lt!129780 () Unit!7971)

(assert (=> b!257906 (= e!167176 lt!129780)))

(declare-fun lt!129770 () ListLongMap!3751)

(assert (=> b!257906 (= lt!129770 (getCurrentListMapNoExtraKeys!570 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129768 () (_ BitVec 64))

(assert (=> b!257906 (= lt!129768 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129769 () (_ BitVec 64))

(assert (=> b!257906 (= lt!129769 (select (arr!5936 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129785 () Unit!7971)

(assert (=> b!257906 (= lt!129785 (addStillContains!230 lt!129770 lt!129768 (zeroValue!4593 thiss!1504) lt!129769))))

(assert (=> b!257906 (contains!1850 (+!688 lt!129770 (tuple2!4837 lt!129768 (zeroValue!4593 thiss!1504))) lt!129769)))

(declare-fun lt!129783 () Unit!7971)

(assert (=> b!257906 (= lt!129783 lt!129785)))

(declare-fun lt!129787 () ListLongMap!3751)

(assert (=> b!257906 (= lt!129787 (getCurrentListMapNoExtraKeys!570 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129767 () (_ BitVec 64))

(assert (=> b!257906 (= lt!129767 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129773 () (_ BitVec 64))

(assert (=> b!257906 (= lt!129773 (select (arr!5936 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129777 () Unit!7971)

(assert (=> b!257906 (= lt!129777 (addApplyDifferent!230 lt!129787 lt!129767 (minValue!4593 thiss!1504) lt!129773))))

(assert (=> b!257906 (= (apply!254 (+!688 lt!129787 (tuple2!4837 lt!129767 (minValue!4593 thiss!1504))) lt!129773) (apply!254 lt!129787 lt!129773))))

(declare-fun lt!129772 () Unit!7971)

(assert (=> b!257906 (= lt!129772 lt!129777)))

(declare-fun lt!129778 () ListLongMap!3751)

(assert (=> b!257906 (= lt!129778 (getCurrentListMapNoExtraKeys!570 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129774 () (_ BitVec 64))

(assert (=> b!257906 (= lt!129774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129771 () (_ BitVec 64))

(assert (=> b!257906 (= lt!129771 (select (arr!5936 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129782 () Unit!7971)

(assert (=> b!257906 (= lt!129782 (addApplyDifferent!230 lt!129778 lt!129774 (zeroValue!4593 thiss!1504) lt!129771))))

(assert (=> b!257906 (= (apply!254 (+!688 lt!129778 (tuple2!4837 lt!129774 (zeroValue!4593 thiss!1504))) lt!129771) (apply!254 lt!129778 lt!129771))))

(declare-fun lt!129775 () Unit!7971)

(assert (=> b!257906 (= lt!129775 lt!129782)))

(declare-fun lt!129786 () ListLongMap!3751)

(assert (=> b!257906 (= lt!129786 (getCurrentListMapNoExtraKeys!570 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129781 () (_ BitVec 64))

(assert (=> b!257906 (= lt!129781 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129779 () (_ BitVec 64))

(assert (=> b!257906 (= lt!129779 (select (arr!5936 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257906 (= lt!129780 (addApplyDifferent!230 lt!129786 lt!129781 (minValue!4593 thiss!1504) lt!129779))))

(assert (=> b!257906 (= (apply!254 (+!688 lt!129786 (tuple2!4837 lt!129781 (minValue!4593 thiss!1504))) lt!129779) (apply!254 lt!129786 lt!129779))))

(declare-fun b!257907 () Bool)

(assert (=> b!257907 (= e!167170 e!167173)))

(declare-fun res!126135 () Bool)

(assert (=> b!257907 (= res!126135 call!24493)))

(assert (=> b!257907 (=> (not res!126135) (not e!167173))))

(declare-fun b!257899 () Bool)

(assert (=> b!257899 (= e!167164 call!24494)))

(declare-fun d!61935 () Bool)

(assert (=> d!61935 e!167169))

(declare-fun res!126137 () Bool)

(assert (=> d!61935 (=> (not res!126137) (not e!167169))))

(assert (=> d!61935 (= res!126137 (or (bvsge #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))))))))

(declare-fun lt!129776 () ListLongMap!3751)

(assert (=> d!61935 (= lt!129766 lt!129776)))

(declare-fun lt!129784 () Unit!7971)

(assert (=> d!61935 (= lt!129784 e!167176)))

(declare-fun c!43669 () Bool)

(assert (=> d!61935 (= c!43669 e!167171)))

(declare-fun res!126140 () Bool)

(assert (=> d!61935 (=> (not res!126140) (not e!167171))))

(assert (=> d!61935 (= res!126140 (bvslt #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))))))

(assert (=> d!61935 (= lt!129776 e!167175)))

(declare-fun c!43667 () Bool)

(assert (=> d!61935 (= c!43667 (and (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4489 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61935 (validMask!0 (mask!11042 thiss!1504))))

(assert (=> d!61935 (= (getCurrentListMap!1423 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)) lt!129766)))

(declare-fun bm!24492 () Bool)

(declare-fun call!24497 () ListLongMap!3751)

(assert (=> bm!24492 (= call!24496 call!24497)))

(declare-fun bm!24493 () Bool)

(assert (=> bm!24493 (= call!24495 (contains!1850 lt!129766 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257908 () Bool)

(assert (=> b!257908 (= e!167168 call!24494)))

(declare-fun b!257909 () Bool)

(assert (=> b!257909 (= e!167167 (= (apply!254 lt!129766 (select (arr!5936 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000)) (get!3059 (select (arr!5935 (_values!4735 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!597 (defaultEntry!4752 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257909 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6282 (_values!4735 thiss!1504))))))

(assert (=> b!257909 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))))))

(declare-fun bm!24494 () Bool)

(assert (=> bm!24494 (= call!24497 (getCurrentListMapNoExtraKeys!570 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun bm!24495 () Bool)

(assert (=> bm!24495 (= call!24498 (+!688 (ite c!43667 call!24497 (ite c!43668 call!24496 call!24499)) (ite (or c!43667 c!43668) (tuple2!4837 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4593 thiss!1504)) (tuple2!4837 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4593 thiss!1504)))))))

(declare-fun bm!24496 () Bool)

(assert (=> bm!24496 (= call!24493 (contains!1850 lt!129766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257910 () Bool)

(declare-fun res!126132 () Bool)

(assert (=> b!257910 (=> (not res!126132) (not e!167169))))

(assert (=> b!257910 (= res!126132 e!167165)))

(declare-fun res!126133 () Bool)

(assert (=> b!257910 (=> res!126133 e!167165)))

(assert (=> b!257910 (= res!126133 (not e!167166))))

(declare-fun res!126136 () Bool)

(assert (=> b!257910 (=> (not res!126136) (not e!167166))))

(assert (=> b!257910 (= res!126136 (bvslt #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))))))

(declare-fun b!257911 () Bool)

(assert (=> b!257911 (= e!167172 (not call!24495))))

(declare-fun b!257912 () Bool)

(assert (=> b!257912 (= e!167168 call!24499)))

(assert (= (and d!61935 c!43667) b!257902))

(assert (= (and d!61935 (not c!43667)) b!257900))

(assert (= (and b!257900 c!43668) b!257899))

(assert (= (and b!257900 (not c!43668)) b!257901))

(assert (= (and b!257901 c!43665) b!257908))

(assert (= (and b!257901 (not c!43665)) b!257912))

(assert (= (or b!257908 b!257912) bm!24490))

(assert (= (or b!257899 bm!24490) bm!24492))

(assert (= (or b!257899 b!257908) bm!24491))

(assert (= (or b!257902 bm!24492) bm!24494))

(assert (= (or b!257902 bm!24491) bm!24495))

(assert (= (and d!61935 res!126140) b!257904))

(assert (= (and d!61935 c!43669) b!257906))

(assert (= (and d!61935 (not c!43669)) b!257897))

(assert (= (and d!61935 res!126137) b!257910))

(assert (= (and b!257910 res!126136) b!257895))

(assert (= (and b!257910 (not res!126133)) b!257898))

(assert (= (and b!257898 res!126134) b!257909))

(assert (= (and b!257910 res!126132) b!257896))

(assert (= (and b!257896 c!43670) b!257907))

(assert (= (and b!257896 (not c!43670)) b!257893))

(assert (= (and b!257907 res!126135) b!257894))

(assert (= (or b!257907 b!257893) bm!24496))

(assert (= (and b!257896 res!126138) b!257892))

(assert (= (and b!257892 c!43666) b!257905))

(assert (= (and b!257892 (not c!43666)) b!257911))

(assert (= (and b!257905 res!126139) b!257903))

(assert (= (or b!257905 b!257911) bm!24493))

(declare-fun b_lambda!8211 () Bool)

(assert (=> (not b_lambda!8211) (not b!257909)))

(assert (=> b!257909 t!8774))

(declare-fun b_and!13825 () Bool)

(assert (= b_and!13823 (and (=> t!8774 result!5377) b_and!13825)))

(declare-fun m!273353 () Bool)

(assert (=> b!257903 m!273353))

(declare-fun m!273355 () Bool)

(assert (=> bm!24493 m!273355))

(declare-fun m!273357 () Bool)

(assert (=> b!257894 m!273357))

(declare-fun m!273359 () Bool)

(assert (=> bm!24495 m!273359))

(assert (=> b!257909 m!273237))

(declare-fun m!273361 () Bool)

(assert (=> b!257909 m!273361))

(assert (=> b!257909 m!273237))

(declare-fun m!273363 () Bool)

(assert (=> b!257909 m!273363))

(assert (=> b!257909 m!273217))

(assert (=> b!257909 m!273361))

(assert (=> b!257909 m!273217))

(declare-fun m!273365 () Bool)

(assert (=> b!257909 m!273365))

(declare-fun m!273367 () Bool)

(assert (=> b!257906 m!273367))

(declare-fun m!273369 () Bool)

(assert (=> b!257906 m!273369))

(declare-fun m!273371 () Bool)

(assert (=> b!257906 m!273371))

(declare-fun m!273373 () Bool)

(assert (=> b!257906 m!273373))

(assert (=> b!257906 m!273217))

(declare-fun m!273375 () Bool)

(assert (=> b!257906 m!273375))

(declare-fun m!273377 () Bool)

(assert (=> b!257906 m!273377))

(declare-fun m!273379 () Bool)

(assert (=> b!257906 m!273379))

(assert (=> b!257906 m!273375))

(declare-fun m!273381 () Bool)

(assert (=> b!257906 m!273381))

(declare-fun m!273383 () Bool)

(assert (=> b!257906 m!273383))

(declare-fun m!273385 () Bool)

(assert (=> b!257906 m!273385))

(assert (=> b!257906 m!273369))

(assert (=> b!257906 m!273379))

(declare-fun m!273387 () Bool)

(assert (=> b!257906 m!273387))

(declare-fun m!273389 () Bool)

(assert (=> b!257906 m!273389))

(declare-fun m!273391 () Bool)

(assert (=> b!257906 m!273391))

(declare-fun m!273393 () Bool)

(assert (=> b!257906 m!273393))

(declare-fun m!273395 () Bool)

(assert (=> b!257906 m!273395))

(declare-fun m!273397 () Bool)

(assert (=> b!257906 m!273397))

(assert (=> b!257906 m!273391))

(declare-fun m!273399 () Bool)

(assert (=> b!257902 m!273399))

(assert (=> b!257904 m!273217))

(assert (=> b!257904 m!273217))

(assert (=> b!257904 m!273219))

(assert (=> bm!24494 m!273385))

(declare-fun m!273401 () Bool)

(assert (=> bm!24496 m!273401))

(assert (=> b!257898 m!273217))

(assert (=> b!257898 m!273217))

(declare-fun m!273403 () Bool)

(assert (=> b!257898 m!273403))

(assert (=> b!257895 m!273217))

(assert (=> b!257895 m!273217))

(assert (=> b!257895 m!273219))

(assert (=> d!61935 m!273045))

(assert (=> b!257566 d!61935))

(declare-fun d!61937 () Bool)

(assert (=> d!61937 (= (inRange!0 (ite c!43596 (index!6722 lt!129550) (index!6725 lt!129550)) (mask!11042 thiss!1504)) (and (bvsge (ite c!43596 (index!6722 lt!129550) (index!6725 lt!129550)) #b00000000000000000000000000000000) (bvslt (ite c!43596 (index!6722 lt!129550) (index!6725 lt!129550)) (bvadd (mask!11042 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24438 d!61937))

(declare-fun d!61939 () Bool)

(declare-fun res!126147 () Bool)

(declare-fun e!167179 () Bool)

(assert (=> d!61939 (=> (not res!126147) (not e!167179))))

(declare-fun simpleValid!277 (LongMapFixedSize!3808) Bool)

(assert (=> d!61939 (= res!126147 (simpleValid!277 thiss!1504))))

(assert (=> d!61939 (= (valid!1494 thiss!1504) e!167179)))

(declare-fun b!257919 () Bool)

(declare-fun res!126148 () Bool)

(assert (=> b!257919 (=> (not res!126148) (not e!167179))))

(assert (=> b!257919 (= res!126148 (= (arrayCountValidKeys!0 (_keys!6920 thiss!1504) #b00000000000000000000000000000000 (size!6283 (_keys!6920 thiss!1504))) (_size!1953 thiss!1504)))))

(declare-fun b!257920 () Bool)

(declare-fun res!126149 () Bool)

(assert (=> b!257920 (=> (not res!126149) (not e!167179))))

(assert (=> b!257920 (= res!126149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6920 thiss!1504) (mask!11042 thiss!1504)))))

(declare-fun b!257921 () Bool)

(assert (=> b!257921 (= e!167179 (arrayNoDuplicates!0 (_keys!6920 thiss!1504) #b00000000000000000000000000000000 Nil!3712))))

(assert (= (and d!61939 res!126147) b!257919))

(assert (= (and b!257919 res!126148) b!257920))

(assert (= (and b!257920 res!126149) b!257921))

(declare-fun m!273405 () Bool)

(assert (=> d!61939 m!273405))

(assert (=> b!257919 m!273041))

(declare-fun m!273407 () Bool)

(assert (=> b!257920 m!273407))

(declare-fun m!273409 () Bool)

(assert (=> b!257921 m!273409))

(assert (=> start!24610 d!61939))

(declare-fun d!61941 () Bool)

(assert (=> d!61941 (contains!1850 (getCurrentListMap!1423 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)) key!932)))

(declare-fun lt!129790 () Unit!7971)

(declare-fun choose!1249 (array!12535 array!12533 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) (_ BitVec 32) Int) Unit!7971)

(assert (=> d!61941 (= lt!129790 (choose!1249 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(assert (=> d!61941 (validMask!0 (mask!11042 thiss!1504))))

(assert (=> d!61941 (= (lemmaArrayContainsKeyThenInListMap!246 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)) lt!129790)))

(declare-fun bs!9105 () Bool)

(assert (= bs!9105 d!61941))

(assert (=> bs!9105 m!273025))

(assert (=> bs!9105 m!273025))

(declare-fun m!273411 () Bool)

(assert (=> bs!9105 m!273411))

(declare-fun m!273413 () Bool)

(assert (=> bs!9105 m!273413))

(assert (=> bs!9105 m!273045))

(assert (=> b!257575 d!61941))

(declare-fun d!61943 () Bool)

(assert (=> d!61943 (= (array_inv!3905 (_keys!6920 thiss!1504)) (bvsge (size!6283 (_keys!6920 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257580 d!61943))

(declare-fun d!61945 () Bool)

(assert (=> d!61945 (= (array_inv!3906 (_values!4735 thiss!1504)) (bvsge (size!6282 (_values!4735 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257580 d!61945))

(declare-fun d!61947 () Bool)

(declare-fun e!167182 () Bool)

(assert (=> d!61947 e!167182))

(declare-fun res!126154 () Bool)

(assert (=> d!61947 (=> (not res!126154) (not e!167182))))

(declare-fun lt!129795 () SeekEntryResult!1138)

(assert (=> d!61947 (= res!126154 ((_ is Found!1138) lt!129795))))

(assert (=> d!61947 (= lt!129795 (seekEntryOrOpen!0 key!932 (_keys!6920 thiss!1504) (mask!11042 thiss!1504)))))

(declare-fun lt!129796 () Unit!7971)

(declare-fun choose!1250 (array!12535 array!12533 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) Int) Unit!7971)

(assert (=> d!61947 (= lt!129796 (choose!1250 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)))))

(assert (=> d!61947 (validMask!0 (mask!11042 thiss!1504))))

(assert (=> d!61947 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!429 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)) lt!129796)))

(declare-fun b!257926 () Bool)

(declare-fun res!126155 () Bool)

(assert (=> b!257926 (=> (not res!126155) (not e!167182))))

(assert (=> b!257926 (= res!126155 (inRange!0 (index!6723 lt!129795) (mask!11042 thiss!1504)))))

(declare-fun b!257927 () Bool)

(assert (=> b!257927 (= e!167182 (= (select (arr!5936 (_keys!6920 thiss!1504)) (index!6723 lt!129795)) key!932))))

(assert (=> b!257927 (and (bvsge (index!6723 lt!129795) #b00000000000000000000000000000000) (bvslt (index!6723 lt!129795) (size!6283 (_keys!6920 thiss!1504))))))

(assert (= (and d!61947 res!126154) b!257926))

(assert (= (and b!257926 res!126155) b!257927))

(assert (=> d!61947 m!273077))

(declare-fun m!273415 () Bool)

(assert (=> d!61947 m!273415))

(assert (=> d!61947 m!273045))

(declare-fun m!273417 () Bool)

(assert (=> b!257926 m!273417))

(declare-fun m!273419 () Bool)

(assert (=> b!257927 m!273419))

(assert (=> b!257568 d!61947))

(declare-fun b!257940 () Bool)

(declare-fun c!43679 () Bool)

(declare-fun lt!129805 () (_ BitVec 64))

(assert (=> b!257940 (= c!43679 (= lt!129805 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167191 () SeekEntryResult!1138)

(declare-fun e!167190 () SeekEntryResult!1138)

(assert (=> b!257940 (= e!167191 e!167190)))

(declare-fun d!61949 () Bool)

(declare-fun lt!129804 () SeekEntryResult!1138)

(assert (=> d!61949 (and (or ((_ is Undefined!1138) lt!129804) (not ((_ is Found!1138) lt!129804)) (and (bvsge (index!6723 lt!129804) #b00000000000000000000000000000000) (bvslt (index!6723 lt!129804) (size!6283 (_keys!6920 thiss!1504))))) (or ((_ is Undefined!1138) lt!129804) ((_ is Found!1138) lt!129804) (not ((_ is MissingZero!1138) lt!129804)) (and (bvsge (index!6722 lt!129804) #b00000000000000000000000000000000) (bvslt (index!6722 lt!129804) (size!6283 (_keys!6920 thiss!1504))))) (or ((_ is Undefined!1138) lt!129804) ((_ is Found!1138) lt!129804) ((_ is MissingZero!1138) lt!129804) (not ((_ is MissingVacant!1138) lt!129804)) (and (bvsge (index!6725 lt!129804) #b00000000000000000000000000000000) (bvslt (index!6725 lt!129804) (size!6283 (_keys!6920 thiss!1504))))) (or ((_ is Undefined!1138) lt!129804) (ite ((_ is Found!1138) lt!129804) (= (select (arr!5936 (_keys!6920 thiss!1504)) (index!6723 lt!129804)) key!932) (ite ((_ is MissingZero!1138) lt!129804) (= (select (arr!5936 (_keys!6920 thiss!1504)) (index!6722 lt!129804)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1138) lt!129804) (= (select (arr!5936 (_keys!6920 thiss!1504)) (index!6725 lt!129804)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!167189 () SeekEntryResult!1138)

(assert (=> d!61949 (= lt!129804 e!167189)))

(declare-fun c!43678 () Bool)

(declare-fun lt!129803 () SeekEntryResult!1138)

(assert (=> d!61949 (= c!43678 (and ((_ is Intermediate!1138) lt!129803) (undefined!1950 lt!129803)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12535 (_ BitVec 32)) SeekEntryResult!1138)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61949 (= lt!129803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11042 thiss!1504)) key!932 (_keys!6920 thiss!1504) (mask!11042 thiss!1504)))))

(assert (=> d!61949 (validMask!0 (mask!11042 thiss!1504))))

(assert (=> d!61949 (= (seekEntryOrOpen!0 key!932 (_keys!6920 thiss!1504) (mask!11042 thiss!1504)) lt!129804)))

(declare-fun b!257941 () Bool)

(assert (=> b!257941 (= e!167190 (MissingZero!1138 (index!6724 lt!129803)))))

(declare-fun b!257942 () Bool)

(assert (=> b!257942 (= e!167189 e!167191)))

(assert (=> b!257942 (= lt!129805 (select (arr!5936 (_keys!6920 thiss!1504)) (index!6724 lt!129803)))))

(declare-fun c!43677 () Bool)

(assert (=> b!257942 (= c!43677 (= lt!129805 key!932))))

(declare-fun b!257943 () Bool)

(assert (=> b!257943 (= e!167191 (Found!1138 (index!6724 lt!129803)))))

(declare-fun b!257944 () Bool)

(assert (=> b!257944 (= e!167189 Undefined!1138)))

(declare-fun b!257945 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12535 (_ BitVec 32)) SeekEntryResult!1138)

(assert (=> b!257945 (= e!167190 (seekKeyOrZeroReturnVacant!0 (x!24988 lt!129803) (index!6724 lt!129803) (index!6724 lt!129803) key!932 (_keys!6920 thiss!1504) (mask!11042 thiss!1504)))))

(assert (= (and d!61949 c!43678) b!257944))

(assert (= (and d!61949 (not c!43678)) b!257942))

(assert (= (and b!257942 c!43677) b!257943))

(assert (= (and b!257942 (not c!43677)) b!257940))

(assert (= (and b!257940 c!43679) b!257941))

(assert (= (and b!257940 (not c!43679)) b!257945))

(declare-fun m!273421 () Bool)

(assert (=> d!61949 m!273421))

(assert (=> d!61949 m!273045))

(declare-fun m!273423 () Bool)

(assert (=> d!61949 m!273423))

(declare-fun m!273425 () Bool)

(assert (=> d!61949 m!273425))

(declare-fun m!273427 () Bool)

(assert (=> d!61949 m!273427))

(declare-fun m!273429 () Bool)

(assert (=> d!61949 m!273429))

(assert (=> d!61949 m!273423))

(declare-fun m!273431 () Bool)

(assert (=> b!257942 m!273431))

(declare-fun m!273433 () Bool)

(assert (=> b!257945 m!273433))

(assert (=> b!257572 d!61949))

(declare-fun mapIsEmpty!11238 () Bool)

(declare-fun mapRes!11238 () Bool)

(assert (=> mapIsEmpty!11238 mapRes!11238))

(declare-fun b!257953 () Bool)

(declare-fun e!167197 () Bool)

(assert (=> b!257953 (= e!167197 tp_is_empty!6595)))

(declare-fun condMapEmpty!11238 () Bool)

(declare-fun mapDefault!11238 () ValueCell!2954)

(assert (=> mapNonEmpty!11229 (= condMapEmpty!11238 (= mapRest!11229 ((as const (Array (_ BitVec 32) ValueCell!2954)) mapDefault!11238)))))

(assert (=> mapNonEmpty!11229 (= tp!23507 (and e!167197 mapRes!11238))))

(declare-fun b!257952 () Bool)

(declare-fun e!167196 () Bool)

(assert (=> b!257952 (= e!167196 tp_is_empty!6595)))

(declare-fun mapNonEmpty!11238 () Bool)

(declare-fun tp!23523 () Bool)

(assert (=> mapNonEmpty!11238 (= mapRes!11238 (and tp!23523 e!167196))))

(declare-fun mapKey!11238 () (_ BitVec 32))

(declare-fun mapRest!11238 () (Array (_ BitVec 32) ValueCell!2954))

(declare-fun mapValue!11238 () ValueCell!2954)

(assert (=> mapNonEmpty!11238 (= mapRest!11229 (store mapRest!11238 mapKey!11238 mapValue!11238))))

(assert (= (and mapNonEmpty!11229 condMapEmpty!11238) mapIsEmpty!11238))

(assert (= (and mapNonEmpty!11229 (not condMapEmpty!11238)) mapNonEmpty!11238))

(assert (= (and mapNonEmpty!11238 ((_ is ValueCellFull!2954) mapValue!11238)) b!257952))

(assert (= (and mapNonEmpty!11229 ((_ is ValueCellFull!2954) mapDefault!11238)) b!257953))

(declare-fun m!273435 () Bool)

(assert (=> mapNonEmpty!11238 m!273435))

(declare-fun b_lambda!8213 () Bool)

(assert (= b_lambda!8211 (or (and b!257580 b_free!6733) b_lambda!8213)))

(declare-fun b_lambda!8215 () Bool)

(assert (= b_lambda!8209 (or (and b!257580 b_free!6733) b_lambda!8215)))

(check-sat (not b!257833) (not d!61901) (not b!257919) (not b!257857) (not b!257732) (not b!257830) (not d!61939) (not b!257921) (not b!257909) (not d!61925) (not b!257831) (not d!61919) (not mapNonEmpty!11238) (not b!257820) (not b!257789) tp_is_empty!6595 (not b!257850) (not d!61941) (not b!257920) (not b!257815) (not b!257891) (not b!257777) (not d!61911) (not bm!24483) (not d!61913) (not b!257787) (not bm!24480) (not b!257825) (not bm!24496) (not b!257792) (not b!257837) (not b!257898) (not b!257903) (not d!61897) (not b!257904) (not b!257717) (not b_lambda!8215) (not d!61949) (not bm!24472) (not b_lambda!8213) (not bm!24495) (not b!257926) (not b!257849) (not b!257895) (not b!257894) (not bm!24489) (not bm!24493) (not d!61927) (not b!257906) (not bm!24474) (not bm!24479) (not d!61947) (not b!257818) (not b!257778) (not b!257786) (not bm!24494) (not b!257714) (not b!257781) (not bm!24488) (not b!257902) (not b!257715) (not bm!24454) (not b!257840) (not b!257727) (not bm!24475) (not d!61935) b_and!13825 (not bm!24473) (not b!257889) (not b!257803) (not d!61933) (not b_next!6733) (not bm!24478) (not b!257945) (not b!257785) (not b!257814) (not d!61903) (not d!61929))
(check-sat b_and!13825 (not b_next!6733))
