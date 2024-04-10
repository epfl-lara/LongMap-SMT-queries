; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22104 () Bool)

(assert start!22104)

(declare-fun b!229804 () Bool)

(declare-fun b_free!6171 () Bool)

(declare-fun b_next!6171 () Bool)

(assert (=> b!229804 (= b_free!6171 (not b_next!6171))))

(declare-fun tp!21655 () Bool)

(declare-fun b_and!13069 () Bool)

(assert (=> b!229804 (= tp!21655 b_and!13069)))

(declare-fun b!229800 () Bool)

(declare-fun e!149100 () Bool)

(declare-fun e!149095 () Bool)

(assert (=> b!229800 (= e!149100 e!149095)))

(declare-fun res!113082 () Bool)

(assert (=> b!229800 (=> (not res!113082) (not e!149095))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7691 0))(
  ( (V!7692 (val!3061 Int)) )
))
(declare-datatypes ((ValueCell!2673 0))(
  ( (ValueCellFull!2673 (v!5081 V!7691)) (EmptyCell!2673) )
))
(declare-datatypes ((array!11309 0))(
  ( (array!11310 (arr!5374 (Array (_ BitVec 32) ValueCell!2673)) (size!5707 (_ BitVec 32))) )
))
(declare-datatypes ((array!11311 0))(
  ( (array!11312 (arr!5375 (Array (_ BitVec 32) (_ BitVec 64))) (size!5708 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3246 0))(
  ( (LongMapFixedSize!3247 (defaultEntry!4282 Int) (mask!10166 (_ BitVec 32)) (extraKeys!4019 (_ BitVec 32)) (zeroValue!4123 V!7691) (minValue!4123 V!7691) (_size!1672 (_ BitVec 32)) (_keys!6336 array!11311) (_values!4265 array!11309) (_vacant!1672 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3246)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229800 (= res!113082 (inRange!0 index!297 (mask!10166 thiss!1504)))))

(declare-datatypes ((Unit!7016 0))(
  ( (Unit!7017) )
))
(declare-fun lt!115591 () Unit!7016)

(declare-fun e!149108 () Unit!7016)

(assert (=> b!229800 (= lt!115591 e!149108)))

(declare-fun c!38123 () Bool)

(declare-datatypes ((tuple2!4514 0))(
  ( (tuple2!4515 (_1!2268 (_ BitVec 64)) (_2!2268 V!7691)) )
))
(declare-datatypes ((List!3438 0))(
  ( (Nil!3435) (Cons!3434 (h!4082 tuple2!4514) (t!8397 List!3438)) )
))
(declare-datatypes ((ListLongMap!3427 0))(
  ( (ListLongMap!3428 (toList!1729 List!3438)) )
))
(declare-fun lt!115598 () ListLongMap!3427)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1603 (ListLongMap!3427 (_ BitVec 64)) Bool)

(assert (=> b!229800 (= c!38123 (contains!1603 lt!115598 key!932))))

(declare-fun getCurrentListMap!1257 (array!11311 array!11309 (_ BitVec 32) (_ BitVec 32) V!7691 V!7691 (_ BitVec 32) Int) ListLongMap!3427)

(assert (=> b!229800 (= lt!115598 (getCurrentListMap!1257 (_keys!6336 thiss!1504) (_values!4265 thiss!1504) (mask!10166 thiss!1504) (extraKeys!4019 thiss!1504) (zeroValue!4123 thiss!1504) (minValue!4123 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4282 thiss!1504)))))

(declare-fun b!229801 () Bool)

(declare-fun e!149105 () Bool)

(declare-fun e!149096 () Bool)

(assert (=> b!229801 (= e!149105 e!149096)))

(declare-fun res!113086 () Bool)

(declare-fun call!21348 () Bool)

(assert (=> b!229801 (= res!113086 call!21348)))

(assert (=> b!229801 (=> (not res!113086) (not e!149096))))

(declare-fun b!229802 () Bool)

(declare-fun c!38122 () Bool)

(declare-datatypes ((SeekEntryResult!927 0))(
  ( (MissingZero!927 (index!5878 (_ BitVec 32))) (Found!927 (index!5879 (_ BitVec 32))) (Intermediate!927 (undefined!1739 Bool) (index!5880 (_ BitVec 32)) (x!23403 (_ BitVec 32))) (Undefined!927) (MissingVacant!927 (index!5881 (_ BitVec 32))) )
))
(declare-fun lt!115600 () SeekEntryResult!927)

(get-info :version)

(assert (=> b!229802 (= c!38122 ((_ is MissingVacant!927) lt!115600))))

(declare-fun e!149102 () Bool)

(assert (=> b!229802 (= e!149102 e!149105)))

(declare-fun b!229803 () Bool)

(declare-fun lt!115601 () Unit!7016)

(assert (=> b!229803 (= e!149108 lt!115601)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!301 (array!11311 array!11309 (_ BitVec 32) (_ BitVec 32) V!7691 V!7691 (_ BitVec 64) Int) Unit!7016)

(assert (=> b!229803 (= lt!115601 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!301 (_keys!6336 thiss!1504) (_values!4265 thiss!1504) (mask!10166 thiss!1504) (extraKeys!4019 thiss!1504) (zeroValue!4123 thiss!1504) (minValue!4123 thiss!1504) key!932 (defaultEntry!4282 thiss!1504)))))

(declare-fun c!38121 () Bool)

(assert (=> b!229803 (= c!38121 ((_ is MissingZero!927) lt!115600))))

(assert (=> b!229803 e!149102))

(declare-fun mapIsEmpty!10219 () Bool)

(declare-fun mapRes!10219 () Bool)

(assert (=> mapIsEmpty!10219 mapRes!10219))

(declare-fun tp_is_empty!6033 () Bool)

(declare-fun e!149104 () Bool)

(declare-fun e!149098 () Bool)

(declare-fun array_inv!3545 (array!11311) Bool)

(declare-fun array_inv!3546 (array!11309) Bool)

(assert (=> b!229804 (= e!149104 (and tp!21655 tp_is_empty!6033 (array_inv!3545 (_keys!6336 thiss!1504)) (array_inv!3546 (_values!4265 thiss!1504)) e!149098))))

(declare-fun b!229805 () Bool)

(declare-fun res!113088 () Bool)

(declare-fun e!149107 () Bool)

(assert (=> b!229805 (=> (not res!113088) (not e!149107))))

(assert (=> b!229805 (= res!113088 (= (select (arr!5375 (_keys!6336 thiss!1504)) (index!5878 lt!115600)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229806 () Bool)

(declare-fun res!113089 () Bool)

(assert (=> b!229806 (= res!113089 (= (select (arr!5375 (_keys!6336 thiss!1504)) (index!5881 lt!115600)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!229806 (=> (not res!113089) (not e!149096))))

(declare-fun b!229807 () Bool)

(declare-fun e!149103 () Bool)

(assert (=> b!229807 (= e!149103 tp_is_empty!6033)))

(declare-fun b!229808 () Bool)

(declare-fun e!149106 () Unit!7016)

(declare-fun Unit!7018 () Unit!7016)

(assert (=> b!229808 (= e!149106 Unit!7018)))

(declare-fun lt!115597 () Unit!7016)

(declare-fun lemmaArrayContainsKeyThenInListMap!118 (array!11311 array!11309 (_ BitVec 32) (_ BitVec 32) V!7691 V!7691 (_ BitVec 64) (_ BitVec 32) Int) Unit!7016)

(assert (=> b!229808 (= lt!115597 (lemmaArrayContainsKeyThenInListMap!118 (_keys!6336 thiss!1504) (_values!4265 thiss!1504) (mask!10166 thiss!1504) (extraKeys!4019 thiss!1504) (zeroValue!4123 thiss!1504) (minValue!4123 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4282 thiss!1504)))))

(assert (=> b!229808 false))

(declare-fun b!229809 () Bool)

(declare-fun e!149101 () Bool)

(assert (=> b!229809 (= e!149101 e!149100)))

(declare-fun res!113085 () Bool)

(assert (=> b!229809 (=> (not res!113085) (not e!149100))))

(assert (=> b!229809 (= res!113085 (or (= lt!115600 (MissingZero!927 index!297)) (= lt!115600 (MissingVacant!927 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11311 (_ BitVec 32)) SeekEntryResult!927)

(assert (=> b!229809 (= lt!115600 (seekEntryOrOpen!0 key!932 (_keys!6336 thiss!1504) (mask!10166 thiss!1504)))))

(declare-fun bm!21344 () Bool)

(assert (=> bm!21344 (= call!21348 (inRange!0 (ite c!38121 (index!5878 lt!115600) (index!5881 lt!115600)) (mask!10166 thiss!1504)))))

(declare-fun b!229810 () Bool)

(declare-fun e!149097 () Bool)

(assert (=> b!229810 (= e!149098 (and e!149097 mapRes!10219))))

(declare-fun condMapEmpty!10219 () Bool)

(declare-fun mapDefault!10219 () ValueCell!2673)

(assert (=> b!229810 (= condMapEmpty!10219 (= (arr!5374 (_values!4265 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2673)) mapDefault!10219)))))

(declare-fun b!229811 () Bool)

(declare-fun Unit!7019 () Unit!7016)

(assert (=> b!229811 (= e!149106 Unit!7019)))

(declare-fun b!229812 () Bool)

(declare-fun call!21347 () Bool)

(assert (=> b!229812 (= e!149107 (not call!21347))))

(declare-fun bm!21345 () Bool)

(declare-fun arrayContainsKey!0 (array!11311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21345 (= call!21347 (arrayContainsKey!0 (_keys!6336 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229813 () Bool)

(assert (=> b!229813 (= e!149097 tp_is_empty!6033)))

(declare-fun b!229814 () Bool)

(assert (=> b!229814 (= e!149095 (not true))))

(declare-fun v!346 () V!7691)

(declare-fun lt!115594 () array!11311)

(declare-fun +!598 (ListLongMap!3427 tuple2!4514) ListLongMap!3427)

(assert (=> b!229814 (= (+!598 lt!115598 (tuple2!4515 key!932 v!346)) (getCurrentListMap!1257 lt!115594 (array!11310 (store (arr!5374 (_values!4265 thiss!1504)) index!297 (ValueCellFull!2673 v!346)) (size!5707 (_values!4265 thiss!1504))) (mask!10166 thiss!1504) (extraKeys!4019 thiss!1504) (zeroValue!4123 thiss!1504) (minValue!4123 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4282 thiss!1504)))))

(declare-fun lt!115596 () Unit!7016)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!52 (array!11311 array!11309 (_ BitVec 32) (_ BitVec 32) V!7691 V!7691 (_ BitVec 32) (_ BitVec 64) V!7691 Int) Unit!7016)

(assert (=> b!229814 (= lt!115596 (lemmaAddValidKeyToArrayThenAddPairToListMap!52 (_keys!6336 thiss!1504) (_values!4265 thiss!1504) (mask!10166 thiss!1504) (extraKeys!4019 thiss!1504) (zeroValue!4123 thiss!1504) (minValue!4123 thiss!1504) index!297 key!932 v!346 (defaultEntry!4282 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11311 (_ BitVec 32)) Bool)

(assert (=> b!229814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115594 (mask!10166 thiss!1504))))

(declare-fun lt!115592 () Unit!7016)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11311 (_ BitVec 32) (_ BitVec 32)) Unit!7016)

(assert (=> b!229814 (= lt!115592 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6336 thiss!1504) index!297 (mask!10166 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11311 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229814 (= (arrayCountValidKeys!0 lt!115594 #b00000000000000000000000000000000 (size!5708 (_keys!6336 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6336 thiss!1504) #b00000000000000000000000000000000 (size!5708 (_keys!6336 thiss!1504)))))))

(declare-fun lt!115595 () Unit!7016)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11311 (_ BitVec 32) (_ BitVec 64)) Unit!7016)

(assert (=> b!229814 (= lt!115595 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6336 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3439 0))(
  ( (Nil!3436) (Cons!3435 (h!4083 (_ BitVec 64)) (t!8398 List!3439)) )
))
(declare-fun arrayNoDuplicates!0 (array!11311 (_ BitVec 32) List!3439) Bool)

(assert (=> b!229814 (arrayNoDuplicates!0 lt!115594 #b00000000000000000000000000000000 Nil!3436)))

(assert (=> b!229814 (= lt!115594 (array!11312 (store (arr!5375 (_keys!6336 thiss!1504)) index!297 key!932) (size!5708 (_keys!6336 thiss!1504))))))

(declare-fun lt!115599 () Unit!7016)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11311 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3439) Unit!7016)

(assert (=> b!229814 (= lt!115599 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6336 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3436))))

(declare-fun lt!115593 () Unit!7016)

(assert (=> b!229814 (= lt!115593 e!149106)))

(declare-fun c!38124 () Bool)

(assert (=> b!229814 (= c!38124 (arrayContainsKey!0 (_keys!6336 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229815 () Bool)

(declare-fun res!113084 () Bool)

(assert (=> b!229815 (=> (not res!113084) (not e!149107))))

(assert (=> b!229815 (= res!113084 call!21348)))

(assert (=> b!229815 (= e!149102 e!149107)))

(declare-fun b!229816 () Bool)

(assert (=> b!229816 (= e!149105 ((_ is Undefined!927) lt!115600))))

(declare-fun b!229817 () Bool)

(declare-fun res!113087 () Bool)

(assert (=> b!229817 (=> (not res!113087) (not e!149101))))

(assert (=> b!229817 (= res!113087 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!113083 () Bool)

(assert (=> start!22104 (=> (not res!113083) (not e!149101))))

(declare-fun valid!1295 (LongMapFixedSize!3246) Bool)

(assert (=> start!22104 (= res!113083 (valid!1295 thiss!1504))))

(assert (=> start!22104 e!149101))

(assert (=> start!22104 e!149104))

(assert (=> start!22104 true))

(assert (=> start!22104 tp_is_empty!6033))

(declare-fun mapNonEmpty!10219 () Bool)

(declare-fun tp!21654 () Bool)

(assert (=> mapNonEmpty!10219 (= mapRes!10219 (and tp!21654 e!149103))))

(declare-fun mapKey!10219 () (_ BitVec 32))

(declare-fun mapRest!10219 () (Array (_ BitVec 32) ValueCell!2673))

(declare-fun mapValue!10219 () ValueCell!2673)

(assert (=> mapNonEmpty!10219 (= (arr!5374 (_values!4265 thiss!1504)) (store mapRest!10219 mapKey!10219 mapValue!10219))))

(declare-fun b!229818 () Bool)

(assert (=> b!229818 (= e!149096 (not call!21347))))

(declare-fun b!229819 () Bool)

(declare-fun Unit!7020 () Unit!7016)

(assert (=> b!229819 (= e!149108 Unit!7020)))

(declare-fun lt!115590 () Unit!7016)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!284 (array!11311 array!11309 (_ BitVec 32) (_ BitVec 32) V!7691 V!7691 (_ BitVec 64) Int) Unit!7016)

(assert (=> b!229819 (= lt!115590 (lemmaInListMapThenSeekEntryOrOpenFindsIt!284 (_keys!6336 thiss!1504) (_values!4265 thiss!1504) (mask!10166 thiss!1504) (extraKeys!4019 thiss!1504) (zeroValue!4123 thiss!1504) (minValue!4123 thiss!1504) key!932 (defaultEntry!4282 thiss!1504)))))

(assert (=> b!229819 false))

(assert (= (and start!22104 res!113083) b!229817))

(assert (= (and b!229817 res!113087) b!229809))

(assert (= (and b!229809 res!113085) b!229800))

(assert (= (and b!229800 c!38123) b!229819))

(assert (= (and b!229800 (not c!38123)) b!229803))

(assert (= (and b!229803 c!38121) b!229815))

(assert (= (and b!229803 (not c!38121)) b!229802))

(assert (= (and b!229815 res!113084) b!229805))

(assert (= (and b!229805 res!113088) b!229812))

(assert (= (and b!229802 c!38122) b!229801))

(assert (= (and b!229802 (not c!38122)) b!229816))

(assert (= (and b!229801 res!113086) b!229806))

(assert (= (and b!229806 res!113089) b!229818))

(assert (= (or b!229815 b!229801) bm!21344))

(assert (= (or b!229812 b!229818) bm!21345))

(assert (= (and b!229800 res!113082) b!229814))

(assert (= (and b!229814 c!38124) b!229808))

(assert (= (and b!229814 (not c!38124)) b!229811))

(assert (= (and b!229810 condMapEmpty!10219) mapIsEmpty!10219))

(assert (= (and b!229810 (not condMapEmpty!10219)) mapNonEmpty!10219))

(assert (= (and mapNonEmpty!10219 ((_ is ValueCellFull!2673) mapValue!10219)) b!229807))

(assert (= (and b!229810 ((_ is ValueCellFull!2673) mapDefault!10219)) b!229813))

(assert (= b!229804 b!229810))

(assert (= start!22104 b!229804))

(declare-fun m!251237 () Bool)

(assert (=> bm!21345 m!251237))

(declare-fun m!251239 () Bool)

(assert (=> b!229804 m!251239))

(declare-fun m!251241 () Bool)

(assert (=> b!229804 m!251241))

(declare-fun m!251243 () Bool)

(assert (=> b!229800 m!251243))

(declare-fun m!251245 () Bool)

(assert (=> b!229800 m!251245))

(declare-fun m!251247 () Bool)

(assert (=> b!229800 m!251247))

(assert (=> b!229814 m!251237))

(declare-fun m!251249 () Bool)

(assert (=> b!229814 m!251249))

(declare-fun m!251251 () Bool)

(assert (=> b!229814 m!251251))

(declare-fun m!251253 () Bool)

(assert (=> b!229814 m!251253))

(declare-fun m!251255 () Bool)

(assert (=> b!229814 m!251255))

(declare-fun m!251257 () Bool)

(assert (=> b!229814 m!251257))

(declare-fun m!251259 () Bool)

(assert (=> b!229814 m!251259))

(declare-fun m!251261 () Bool)

(assert (=> b!229814 m!251261))

(declare-fun m!251263 () Bool)

(assert (=> b!229814 m!251263))

(declare-fun m!251265 () Bool)

(assert (=> b!229814 m!251265))

(declare-fun m!251267 () Bool)

(assert (=> b!229814 m!251267))

(declare-fun m!251269 () Bool)

(assert (=> b!229814 m!251269))

(declare-fun m!251271 () Bool)

(assert (=> b!229814 m!251271))

(declare-fun m!251273 () Bool)

(assert (=> b!229819 m!251273))

(declare-fun m!251275 () Bool)

(assert (=> mapNonEmpty!10219 m!251275))

(declare-fun m!251277 () Bool)

(assert (=> b!229806 m!251277))

(declare-fun m!251279 () Bool)

(assert (=> b!229805 m!251279))

(declare-fun m!251281 () Bool)

(assert (=> b!229808 m!251281))

(declare-fun m!251283 () Bool)

(assert (=> start!22104 m!251283))

(declare-fun m!251285 () Bool)

(assert (=> b!229803 m!251285))

(declare-fun m!251287 () Bool)

(assert (=> b!229809 m!251287))

(declare-fun m!251289 () Bool)

(assert (=> bm!21344 m!251289))

(check-sat (not b_next!6171) (not mapNonEmpty!10219) (not b!229814) (not bm!21345) (not b!229803) tp_is_empty!6033 (not b!229800) (not start!22104) (not b!229809) (not b!229804) (not b!229819) (not bm!21344) b_and!13069 (not b!229808))
(check-sat b_and!13069 (not b_next!6171))
