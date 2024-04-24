; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22034 () Bool)

(assert start!22034)

(declare-fun b!227316 () Bool)

(declare-fun b_free!6097 () Bool)

(declare-fun b_next!6097 () Bool)

(assert (=> b!227316 (= b_free!6097 (not b_next!6097))))

(declare-fun tp!21433 () Bool)

(declare-fun b_and!13009 () Bool)

(assert (=> b!227316 (= tp!21433 b_and!13009)))

(declare-fun b!227309 () Bool)

(declare-fun e!147468 () Bool)

(declare-datatypes ((SeekEntryResult!863 0))(
  ( (MissingZero!863 (index!5622 (_ BitVec 32))) (Found!863 (index!5623 (_ BitVec 32))) (Intermediate!863 (undefined!1675 Bool) (index!5624 (_ BitVec 32)) (x!23243 (_ BitVec 32))) (Undefined!863) (MissingVacant!863 (index!5625 (_ BitVec 32))) )
))
(declare-fun lt!114427 () SeekEntryResult!863)

(get-info :version)

(assert (=> b!227309 (= e!147468 ((_ is Undefined!863) lt!114427))))

(declare-fun b!227310 () Bool)

(declare-fun res!111906 () Bool)

(declare-datatypes ((V!7593 0))(
  ( (V!7594 (val!3024 Int)) )
))
(declare-datatypes ((ValueCell!2636 0))(
  ( (ValueCellFull!2636 (v!5045 V!7593)) (EmptyCell!2636) )
))
(declare-datatypes ((array!11159 0))(
  ( (array!11160 (arr!5299 (Array (_ BitVec 32) ValueCell!2636)) (size!5632 (_ BitVec 32))) )
))
(declare-datatypes ((array!11161 0))(
  ( (array!11162 (arr!5300 (Array (_ BitVec 32) (_ BitVec 64))) (size!5633 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3172 0))(
  ( (LongMapFixedSize!3173 (defaultEntry!4245 Int) (mask!10105 (_ BitVec 32)) (extraKeys!3982 (_ BitVec 32)) (zeroValue!4086 V!7593) (minValue!4086 V!7593) (_size!1635 (_ BitVec 32)) (_keys!6299 array!11161) (_values!4228 array!11159) (_vacant!1635 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3172)

(assert (=> b!227310 (= res!111906 (= (select (arr!5300 (_keys!6299 thiss!1504)) (index!5625 lt!114427)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147473 () Bool)

(assert (=> b!227310 (=> (not res!111906) (not e!147473))))

(declare-fun mapIsEmpty!10108 () Bool)

(declare-fun mapRes!10108 () Bool)

(assert (=> mapIsEmpty!10108 mapRes!10108))

(declare-fun b!227311 () Bool)

(declare-fun e!147464 () Bool)

(declare-fun e!147462 () Bool)

(assert (=> b!227311 (= e!147464 (and e!147462 mapRes!10108))))

(declare-fun condMapEmpty!10108 () Bool)

(declare-fun mapDefault!10108 () ValueCell!2636)

(assert (=> b!227311 (= condMapEmpty!10108 (= (arr!5299 (_values!4228 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2636)) mapDefault!10108)))))

(declare-fun mapNonEmpty!10108 () Bool)

(declare-fun tp!21432 () Bool)

(declare-fun e!147470 () Bool)

(assert (=> mapNonEmpty!10108 (= mapRes!10108 (and tp!21432 e!147470))))

(declare-fun mapValue!10108 () ValueCell!2636)

(declare-fun mapRest!10108 () (Array (_ BitVec 32) ValueCell!2636))

(declare-fun mapKey!10108 () (_ BitVec 32))

(assert (=> mapNonEmpty!10108 (= (arr!5299 (_values!4228 thiss!1504)) (store mapRest!10108 mapKey!10108 mapValue!10108))))

(declare-fun b!227312 () Bool)

(declare-fun res!111904 () Bool)

(declare-fun e!147466 () Bool)

(assert (=> b!227312 (=> res!111904 e!147466)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11161 (_ BitVec 32)) Bool)

(assert (=> b!227312 (= res!111904 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6299 thiss!1504) (mask!10105 thiss!1504))))))

(declare-fun b!227313 () Bool)

(declare-datatypes ((Unit!6869 0))(
  ( (Unit!6870) )
))
(declare-fun e!147465 () Unit!6869)

(declare-fun Unit!6871 () Unit!6869)

(assert (=> b!227313 (= e!147465 Unit!6871)))

(declare-fun lt!114428 () Unit!6869)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!264 (array!11161 array!11159 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 64) Int) Unit!6869)

(assert (=> b!227313 (= lt!114428 (lemmaInListMapThenSeekEntryOrOpenFindsIt!264 (_keys!6299 thiss!1504) (_values!4228 thiss!1504) (mask!10105 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) key!932 (defaultEntry!4245 thiss!1504)))))

(assert (=> b!227313 false))

(declare-fun b!227314 () Bool)

(declare-fun e!147472 () Bool)

(declare-fun e!147460 () Bool)

(assert (=> b!227314 (= e!147472 e!147460)))

(declare-fun res!111899 () Bool)

(assert (=> b!227314 (=> (not res!111899) (not e!147460))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227314 (= res!111899 (inRange!0 index!297 (mask!10105 thiss!1504)))))

(declare-fun lt!114433 () Unit!6869)

(assert (=> b!227314 (= lt!114433 e!147465)))

(declare-fun c!37693 () Bool)

(declare-datatypes ((tuple2!4394 0))(
  ( (tuple2!4395 (_1!2208 (_ BitVec 64)) (_2!2208 V!7593)) )
))
(declare-datatypes ((List!3305 0))(
  ( (Nil!3302) (Cons!3301 (h!3949 tuple2!4394) (t!8256 List!3305)) )
))
(declare-datatypes ((ListLongMap!3309 0))(
  ( (ListLongMap!3310 (toList!1670 List!3305)) )
))
(declare-fun contains!1559 (ListLongMap!3309 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1202 (array!11161 array!11159 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 32) Int) ListLongMap!3309)

(assert (=> b!227314 (= c!37693 (contains!1559 (getCurrentListMap!1202 (_keys!6299 thiss!1504) (_values!4228 thiss!1504) (mask!10105 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4245 thiss!1504)) key!932))))

(declare-fun b!227315 () Bool)

(declare-fun e!147463 () Unit!6869)

(declare-fun Unit!6872 () Unit!6869)

(assert (=> b!227315 (= e!147463 Unit!6872)))

(declare-fun lt!114426 () Unit!6869)

(declare-fun lemmaArrayContainsKeyThenInListMap!103 (array!11161 array!11159 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 64) (_ BitVec 32) Int) Unit!6869)

(assert (=> b!227315 (= lt!114426 (lemmaArrayContainsKeyThenInListMap!103 (_keys!6299 thiss!1504) (_values!4228 thiss!1504) (mask!10105 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4245 thiss!1504)))))

(assert (=> b!227315 false))

(declare-fun tp_is_empty!5959 () Bool)

(declare-fun e!147461 () Bool)

(declare-fun array_inv!3481 (array!11161) Bool)

(declare-fun array_inv!3482 (array!11159) Bool)

(assert (=> b!227316 (= e!147461 (and tp!21433 tp_is_empty!5959 (array_inv!3481 (_keys!6299 thiss!1504)) (array_inv!3482 (_values!4228 thiss!1504)) e!147464))))

(declare-fun b!227317 () Bool)

(declare-fun e!147471 () Bool)

(assert (=> b!227317 (= e!147471 e!147472)))

(declare-fun res!111902 () Bool)

(assert (=> b!227317 (=> (not res!111902) (not e!147472))))

(assert (=> b!227317 (= res!111902 (or (= lt!114427 (MissingZero!863 index!297)) (= lt!114427 (MissingVacant!863 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11161 (_ BitVec 32)) SeekEntryResult!863)

(assert (=> b!227317 (= lt!114427 (seekEntryOrOpen!0 key!932 (_keys!6299 thiss!1504) (mask!10105 thiss!1504)))))

(declare-fun b!227318 () Bool)

(declare-fun call!21114 () Bool)

(assert (=> b!227318 (= e!147473 (not call!21114))))

(declare-fun call!21113 () Bool)

(declare-fun c!37692 () Bool)

(declare-fun bm!21110 () Bool)

(assert (=> bm!21110 (= call!21113 (inRange!0 (ite c!37692 (index!5622 lt!114427) (index!5625 lt!114427)) (mask!10105 thiss!1504)))))

(declare-fun b!227319 () Bool)

(declare-fun res!111898 () Bool)

(assert (=> b!227319 (=> (not res!111898) (not e!147471))))

(assert (=> b!227319 (= res!111898 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!111903 () Bool)

(assert (=> start!22034 (=> (not res!111903) (not e!147471))))

(declare-fun valid!1279 (LongMapFixedSize!3172) Bool)

(assert (=> start!22034 (= res!111903 (valid!1279 thiss!1504))))

(assert (=> start!22034 e!147471))

(assert (=> start!22034 e!147461))

(assert (=> start!22034 true))

(declare-fun b!227320 () Bool)

(declare-fun res!111897 () Bool)

(declare-fun e!147467 () Bool)

(assert (=> b!227320 (=> (not res!111897) (not e!147467))))

(assert (=> b!227320 (= res!111897 call!21113)))

(declare-fun e!147469 () Bool)

(assert (=> b!227320 (= e!147469 e!147467)))

(declare-fun b!227321 () Bool)

(assert (=> b!227321 (= e!147470 tp_is_empty!5959)))

(declare-fun b!227322 () Bool)

(assert (=> b!227322 (= e!147468 e!147473)))

(declare-fun res!111905 () Bool)

(assert (=> b!227322 (= res!111905 call!21113)))

(assert (=> b!227322 (=> (not res!111905) (not e!147473))))

(declare-fun bm!21111 () Bool)

(declare-fun arrayContainsKey!0 (array!11161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21111 (= call!21114 (arrayContainsKey!0 (_keys!6299 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227323 () Bool)

(declare-fun c!37691 () Bool)

(assert (=> b!227323 (= c!37691 ((_ is MissingVacant!863) lt!114427))))

(assert (=> b!227323 (= e!147469 e!147468)))

(declare-fun b!227324 () Bool)

(assert (=> b!227324 (= e!147462 tp_is_empty!5959)))

(declare-fun b!227325 () Bool)

(declare-fun res!111907 () Bool)

(assert (=> b!227325 (=> res!111907 e!147466)))

(assert (=> b!227325 (= res!111907 (or (not (= (size!5632 (_values!4228 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10105 thiss!1504)))) (not (= (size!5633 (_keys!6299 thiss!1504)) (size!5632 (_values!4228 thiss!1504)))) (bvslt (mask!10105 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3982 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3982 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227326 () Bool)

(assert (=> b!227326 (= e!147466 true)))

(declare-fun lt!114423 () Bool)

(declare-datatypes ((List!3306 0))(
  ( (Nil!3303) (Cons!3302 (h!3950 (_ BitVec 64)) (t!8257 List!3306)) )
))
(declare-fun arrayNoDuplicates!0 (array!11161 (_ BitVec 32) List!3306) Bool)

(assert (=> b!227326 (= lt!114423 (arrayNoDuplicates!0 (_keys!6299 thiss!1504) #b00000000000000000000000000000000 Nil!3303))))

(declare-fun b!227327 () Bool)

(declare-fun Unit!6873 () Unit!6869)

(assert (=> b!227327 (= e!147463 Unit!6873)))

(declare-fun b!227328 () Bool)

(assert (=> b!227328 (= e!147460 (not e!147466))))

(declare-fun res!111901 () Bool)

(assert (=> b!227328 (=> res!111901 e!147466)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227328 (= res!111901 (not (validMask!0 (mask!10105 thiss!1504))))))

(declare-fun lt!114429 () array!11161)

(assert (=> b!227328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114429 (mask!10105 thiss!1504))))

(declare-fun lt!114425 () Unit!6869)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11161 (_ BitVec 32) (_ BitVec 32)) Unit!6869)

(assert (=> b!227328 (= lt!114425 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6299 thiss!1504) index!297 (mask!10105 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11161 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227328 (= (arrayCountValidKeys!0 lt!114429 #b00000000000000000000000000000000 (size!5633 (_keys!6299 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6299 thiss!1504) #b00000000000000000000000000000000 (size!5633 (_keys!6299 thiss!1504)))))))

(declare-fun lt!114424 () Unit!6869)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11161 (_ BitVec 32) (_ BitVec 64)) Unit!6869)

(assert (=> b!227328 (= lt!114424 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6299 thiss!1504) index!297 key!932))))

(assert (=> b!227328 (arrayNoDuplicates!0 lt!114429 #b00000000000000000000000000000000 Nil!3303)))

(assert (=> b!227328 (= lt!114429 (array!11162 (store (arr!5300 (_keys!6299 thiss!1504)) index!297 key!932) (size!5633 (_keys!6299 thiss!1504))))))

(declare-fun lt!114432 () Unit!6869)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11161 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3306) Unit!6869)

(assert (=> b!227328 (= lt!114432 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6299 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3303))))

(declare-fun lt!114430 () Unit!6869)

(assert (=> b!227328 (= lt!114430 e!147463)))

(declare-fun c!37690 () Bool)

(assert (=> b!227328 (= c!37690 (arrayContainsKey!0 (_keys!6299 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227329 () Bool)

(assert (=> b!227329 (= e!147467 (not call!21114))))

(declare-fun b!227330 () Bool)

(declare-fun res!111900 () Bool)

(assert (=> b!227330 (=> (not res!111900) (not e!147467))))

(assert (=> b!227330 (= res!111900 (= (select (arr!5300 (_keys!6299 thiss!1504)) (index!5622 lt!114427)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227331 () Bool)

(declare-fun lt!114431 () Unit!6869)

(assert (=> b!227331 (= e!147465 lt!114431)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!255 (array!11161 array!11159 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 64) Int) Unit!6869)

(assert (=> b!227331 (= lt!114431 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!255 (_keys!6299 thiss!1504) (_values!4228 thiss!1504) (mask!10105 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) key!932 (defaultEntry!4245 thiss!1504)))))

(assert (=> b!227331 (= c!37692 ((_ is MissingZero!863) lt!114427))))

(assert (=> b!227331 e!147469))

(assert (= (and start!22034 res!111903) b!227319))

(assert (= (and b!227319 res!111898) b!227317))

(assert (= (and b!227317 res!111902) b!227314))

(assert (= (and b!227314 c!37693) b!227313))

(assert (= (and b!227314 (not c!37693)) b!227331))

(assert (= (and b!227331 c!37692) b!227320))

(assert (= (and b!227331 (not c!37692)) b!227323))

(assert (= (and b!227320 res!111897) b!227330))

(assert (= (and b!227330 res!111900) b!227329))

(assert (= (and b!227323 c!37691) b!227322))

(assert (= (and b!227323 (not c!37691)) b!227309))

(assert (= (and b!227322 res!111905) b!227310))

(assert (= (and b!227310 res!111906) b!227318))

(assert (= (or b!227320 b!227322) bm!21110))

(assert (= (or b!227329 b!227318) bm!21111))

(assert (= (and b!227314 res!111899) b!227328))

(assert (= (and b!227328 c!37690) b!227315))

(assert (= (and b!227328 (not c!37690)) b!227327))

(assert (= (and b!227328 (not res!111901)) b!227325))

(assert (= (and b!227325 (not res!111907)) b!227312))

(assert (= (and b!227312 (not res!111904)) b!227326))

(assert (= (and b!227311 condMapEmpty!10108) mapIsEmpty!10108))

(assert (= (and b!227311 (not condMapEmpty!10108)) mapNonEmpty!10108))

(assert (= (and mapNonEmpty!10108 ((_ is ValueCellFull!2636) mapValue!10108)) b!227321))

(assert (= (and b!227311 ((_ is ValueCellFull!2636) mapDefault!10108)) b!227324))

(assert (= b!227316 b!227311))

(assert (= start!22034 b!227316))

(declare-fun m!249493 () Bool)

(assert (=> bm!21111 m!249493))

(declare-fun m!249495 () Bool)

(assert (=> b!227326 m!249495))

(declare-fun m!249497 () Bool)

(assert (=> b!227328 m!249497))

(assert (=> b!227328 m!249493))

(declare-fun m!249499 () Bool)

(assert (=> b!227328 m!249499))

(declare-fun m!249501 () Bool)

(assert (=> b!227328 m!249501))

(declare-fun m!249503 () Bool)

(assert (=> b!227328 m!249503))

(declare-fun m!249505 () Bool)

(assert (=> b!227328 m!249505))

(declare-fun m!249507 () Bool)

(assert (=> b!227328 m!249507))

(declare-fun m!249509 () Bool)

(assert (=> b!227328 m!249509))

(declare-fun m!249511 () Bool)

(assert (=> b!227328 m!249511))

(declare-fun m!249513 () Bool)

(assert (=> b!227328 m!249513))

(declare-fun m!249515 () Bool)

(assert (=> b!227331 m!249515))

(declare-fun m!249517 () Bool)

(assert (=> b!227314 m!249517))

(declare-fun m!249519 () Bool)

(assert (=> b!227314 m!249519))

(assert (=> b!227314 m!249519))

(declare-fun m!249521 () Bool)

(assert (=> b!227314 m!249521))

(declare-fun m!249523 () Bool)

(assert (=> b!227317 m!249523))

(declare-fun m!249525 () Bool)

(assert (=> mapNonEmpty!10108 m!249525))

(declare-fun m!249527 () Bool)

(assert (=> b!227315 m!249527))

(declare-fun m!249529 () Bool)

(assert (=> b!227310 m!249529))

(declare-fun m!249531 () Bool)

(assert (=> start!22034 m!249531))

(declare-fun m!249533 () Bool)

(assert (=> b!227312 m!249533))

(declare-fun m!249535 () Bool)

(assert (=> b!227316 m!249535))

(declare-fun m!249537 () Bool)

(assert (=> b!227316 m!249537))

(declare-fun m!249539 () Bool)

(assert (=> bm!21110 m!249539))

(declare-fun m!249541 () Bool)

(assert (=> b!227330 m!249541))

(declare-fun m!249543 () Bool)

(assert (=> b!227313 m!249543))

(check-sat (not bm!21110) (not b!227313) (not bm!21111) (not b!227316) (not b!227314) (not b!227315) (not mapNonEmpty!10108) tp_is_empty!5959 (not b!227328) (not b!227317) (not b!227331) (not b!227326) (not b!227312) b_and!13009 (not b_next!6097) (not start!22034))
(check-sat b_and!13009 (not b_next!6097))
