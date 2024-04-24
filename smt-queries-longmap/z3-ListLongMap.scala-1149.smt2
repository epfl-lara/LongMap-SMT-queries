; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24100 () Bool)

(assert start!24100)

(declare-fun b!252044 () Bool)

(declare-fun b_free!6643 () Bool)

(declare-fun b_next!6643 () Bool)

(assert (=> b!252044 (= b_free!6643 (not b_next!6643))))

(declare-fun tp!23205 () Bool)

(declare-fun b_and!13691 () Bool)

(assert (=> b!252044 (= tp!23205 b_and!13691)))

(declare-fun res!123378 () Bool)

(declare-fun e!163430 () Bool)

(assert (=> start!24100 (=> (not res!123378) (not e!163430))))

(declare-datatypes ((V!8321 0))(
  ( (V!8322 (val!3297 Int)) )
))
(declare-datatypes ((ValueCell!2909 0))(
  ( (ValueCellFull!2909 (v!5368 V!8321)) (EmptyCell!2909) )
))
(declare-datatypes ((array!12331 0))(
  ( (array!12332 (arr!5845 (Array (_ BitVec 32) ValueCell!2909)) (size!6192 (_ BitVec 32))) )
))
(declare-datatypes ((array!12333 0))(
  ( (array!12334 (arr!5846 (Array (_ BitVec 32) (_ BitVec 64))) (size!6193 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3718 0))(
  ( (LongMapFixedSize!3719 (defaultEntry!4656 Int) (mask!10868 (_ BitVec 32)) (extraKeys!4393 (_ BitVec 32)) (zeroValue!4497 V!8321) (minValue!4497 V!8321) (_size!1908 (_ BitVec 32)) (_keys!6802 array!12333) (_values!4639 array!12331) (_vacant!1908 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3718)

(declare-fun valid!1460 (LongMapFixedSize!3718) Bool)

(assert (=> start!24100 (= res!123378 (valid!1460 thiss!1504))))

(assert (=> start!24100 e!163430))

(declare-fun e!163434 () Bool)

(assert (=> start!24100 e!163434))

(assert (=> start!24100 true))

(declare-fun b!252032 () Bool)

(declare-fun res!123382 () Bool)

(assert (=> b!252032 (=> (not res!123382) (not e!163430))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!252032 (= res!123382 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!23704 () Bool)

(declare-fun call!23708 () Bool)

(declare-fun arrayContainsKey!0 (array!12333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23704 (= call!23708 (arrayContainsKey!0 (_keys!6802 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252033 () Bool)

(declare-fun res!123385 () Bool)

(declare-fun e!163437 () Bool)

(assert (=> b!252033 (=> res!123385 e!163437)))

(assert (=> b!252033 (= res!123385 (or (not (= (size!6192 (_values!4639 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10868 thiss!1504)))) (not (= (size!6193 (_keys!6802 thiss!1504)) (size!6192 (_values!4639 thiss!1504)))) (bvslt (mask!10868 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4393 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4393 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!252034 () Bool)

(declare-fun e!163442 () Bool)

(assert (=> b!252034 (= e!163430 e!163442)))

(declare-fun res!123381 () Bool)

(assert (=> b!252034 (=> (not res!123381) (not e!163442))))

(declare-datatypes ((SeekEntryResult!1094 0))(
  ( (MissingZero!1094 (index!6546 (_ BitVec 32))) (Found!1094 (index!6547 (_ BitVec 32))) (Intermediate!1094 (undefined!1906 Bool) (index!6548 (_ BitVec 32)) (x!24714 (_ BitVec 32))) (Undefined!1094) (MissingVacant!1094 (index!6549 (_ BitVec 32))) )
))
(declare-fun lt!126361 () SeekEntryResult!1094)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!252034 (= res!123381 (or (= lt!126361 (MissingZero!1094 index!297)) (= lt!126361 (MissingVacant!1094 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12333 (_ BitVec 32)) SeekEntryResult!1094)

(assert (=> b!252034 (= lt!126361 (seekEntryOrOpen!0 key!932 (_keys!6802 thiss!1504) (mask!10868 thiss!1504)))))

(declare-fun b!252035 () Bool)

(declare-datatypes ((Unit!7769 0))(
  ( (Unit!7770) )
))
(declare-fun e!163433 () Unit!7769)

(declare-fun Unit!7771 () Unit!7769)

(assert (=> b!252035 (= e!163433 Unit!7771)))

(declare-fun lt!126364 () Unit!7769)

(declare-fun lemmaArrayContainsKeyThenInListMap!217 (array!12333 array!12331 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) (_ BitVec 32) Int) Unit!7769)

(assert (=> b!252035 (= lt!126364 (lemmaArrayContainsKeyThenInListMap!217 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(assert (=> b!252035 false))

(declare-fun b!252036 () Bool)

(declare-fun e!163439 () Unit!7769)

(declare-fun lt!126363 () Unit!7769)

(assert (=> b!252036 (= e!163439 lt!126363)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!392 (array!12333 array!12331 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) Int) Unit!7769)

(assert (=> b!252036 (= lt!126363 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!392 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)))))

(declare-fun c!42453 () Bool)

(get-info :version)

(assert (=> b!252036 (= c!42453 ((_ is MissingZero!1094) lt!126361))))

(declare-fun e!163441 () Bool)

(assert (=> b!252036 e!163441))

(declare-fun b!252037 () Bool)

(declare-fun res!123380 () Bool)

(assert (=> b!252037 (= res!123380 (= (select (arr!5846 (_keys!6802 thiss!1504)) (index!6549 lt!126361)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163432 () Bool)

(assert (=> b!252037 (=> (not res!123380) (not e!163432))))

(declare-fun b!252038 () Bool)

(declare-fun e!163431 () Bool)

(assert (=> b!252038 (= e!163431 e!163432)))

(declare-fun res!123383 () Bool)

(declare-fun call!23707 () Bool)

(assert (=> b!252038 (= res!123383 call!23707)))

(assert (=> b!252038 (=> (not res!123383) (not e!163432))))

(declare-fun b!252039 () Bool)

(declare-fun e!163440 () Bool)

(assert (=> b!252039 (= e!163440 (not e!163437))))

(declare-fun res!123376 () Bool)

(assert (=> b!252039 (=> res!123376 e!163437)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252039 (= res!123376 (not (validMask!0 (mask!10868 thiss!1504))))))

(declare-fun lt!126366 () array!12333)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12333 (_ BitVec 32)) Bool)

(assert (=> b!252039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126366 (mask!10868 thiss!1504))))

(declare-fun lt!126365 () Unit!7769)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12333 (_ BitVec 32) (_ BitVec 32)) Unit!7769)

(assert (=> b!252039 (= lt!126365 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6802 thiss!1504) index!297 (mask!10868 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12333 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252039 (= (arrayCountValidKeys!0 lt!126366 #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6802 thiss!1504) #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504)))))))

(declare-fun lt!126357 () Unit!7769)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12333 (_ BitVec 32) (_ BitVec 64)) Unit!7769)

(assert (=> b!252039 (= lt!126357 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6802 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3650 0))(
  ( (Nil!3647) (Cons!3646 (h!4308 (_ BitVec 64)) (t!8681 List!3650)) )
))
(declare-fun arrayNoDuplicates!0 (array!12333 (_ BitVec 32) List!3650) Bool)

(assert (=> b!252039 (arrayNoDuplicates!0 lt!126366 #b00000000000000000000000000000000 Nil!3647)))

(assert (=> b!252039 (= lt!126366 (array!12334 (store (arr!5846 (_keys!6802 thiss!1504)) index!297 key!932) (size!6193 (_keys!6802 thiss!1504))))))

(declare-fun lt!126358 () Unit!7769)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12333 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3650) Unit!7769)

(assert (=> b!252039 (= lt!126358 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6802 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3647))))

(declare-fun lt!126360 () Unit!7769)

(assert (=> b!252039 (= lt!126360 e!163433)))

(declare-fun c!42455 () Bool)

(assert (=> b!252039 (= c!42455 (arrayContainsKey!0 (_keys!6802 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11061 () Bool)

(declare-fun mapRes!11061 () Bool)

(assert (=> mapIsEmpty!11061 mapRes!11061))

(declare-fun b!252040 () Bool)

(assert (=> b!252040 (= e!163437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6802 thiss!1504) (mask!10868 thiss!1504)))))

(declare-fun b!252041 () Bool)

(declare-fun e!163438 () Bool)

(declare-fun e!163428 () Bool)

(assert (=> b!252041 (= e!163438 (and e!163428 mapRes!11061))))

(declare-fun condMapEmpty!11061 () Bool)

(declare-fun mapDefault!11061 () ValueCell!2909)

(assert (=> b!252041 (= condMapEmpty!11061 (= (arr!5845 (_values!4639 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2909)) mapDefault!11061)))))

(declare-fun b!252042 () Bool)

(declare-fun e!163435 () Bool)

(assert (=> b!252042 (= e!163435 (not call!23708))))

(declare-fun b!252043 () Bool)

(declare-fun Unit!7772 () Unit!7769)

(assert (=> b!252043 (= e!163433 Unit!7772)))

(declare-fun tp_is_empty!6505 () Bool)

(declare-fun array_inv!3841 (array!12333) Bool)

(declare-fun array_inv!3842 (array!12331) Bool)

(assert (=> b!252044 (= e!163434 (and tp!23205 tp_is_empty!6505 (array_inv!3841 (_keys!6802 thiss!1504)) (array_inv!3842 (_values!4639 thiss!1504)) e!163438))))

(declare-fun mapNonEmpty!11061 () Bool)

(declare-fun tp!23204 () Bool)

(declare-fun e!163429 () Bool)

(assert (=> mapNonEmpty!11061 (= mapRes!11061 (and tp!23204 e!163429))))

(declare-fun mapValue!11061 () ValueCell!2909)

(declare-fun mapKey!11061 () (_ BitVec 32))

(declare-fun mapRest!11061 () (Array (_ BitVec 32) ValueCell!2909))

(assert (=> mapNonEmpty!11061 (= (arr!5845 (_values!4639 thiss!1504)) (store mapRest!11061 mapKey!11061 mapValue!11061))))

(declare-fun b!252045 () Bool)

(declare-fun res!123379 () Bool)

(assert (=> b!252045 (=> (not res!123379) (not e!163435))))

(assert (=> b!252045 (= res!123379 (= (select (arr!5846 (_keys!6802 thiss!1504)) (index!6546 lt!126361)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23705 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23705 (= call!23707 (inRange!0 (ite c!42453 (index!6546 lt!126361) (index!6549 lt!126361)) (mask!10868 thiss!1504)))))

(declare-fun b!252046 () Bool)

(declare-fun res!123377 () Bool)

(assert (=> b!252046 (=> (not res!123377) (not e!163435))))

(assert (=> b!252046 (= res!123377 call!23707)))

(assert (=> b!252046 (= e!163441 e!163435)))

(declare-fun b!252047 () Bool)

(assert (=> b!252047 (= e!163429 tp_is_empty!6505)))

(declare-fun b!252048 () Bool)

(declare-fun c!42456 () Bool)

(assert (=> b!252048 (= c!42456 ((_ is MissingVacant!1094) lt!126361))))

(assert (=> b!252048 (= e!163441 e!163431)))

(declare-fun b!252049 () Bool)

(assert (=> b!252049 (= e!163442 e!163440)))

(declare-fun res!123384 () Bool)

(assert (=> b!252049 (=> (not res!123384) (not e!163440))))

(assert (=> b!252049 (= res!123384 (inRange!0 index!297 (mask!10868 thiss!1504)))))

(declare-fun lt!126359 () Unit!7769)

(assert (=> b!252049 (= lt!126359 e!163439)))

(declare-fun c!42454 () Bool)

(declare-datatypes ((tuple2!4772 0))(
  ( (tuple2!4773 (_1!2397 (_ BitVec 64)) (_2!2397 V!8321)) )
))
(declare-datatypes ((List!3651 0))(
  ( (Nil!3648) (Cons!3647 (h!4309 tuple2!4772) (t!8682 List!3651)) )
))
(declare-datatypes ((ListLongMap!3687 0))(
  ( (ListLongMap!3688 (toList!1859 List!3651)) )
))
(declare-fun contains!1801 (ListLongMap!3687 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1391 (array!12333 array!12331 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 32) Int) ListLongMap!3687)

(assert (=> b!252049 (= c!42454 (contains!1801 (getCurrentListMap!1391 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)) key!932))))

(declare-fun b!252050 () Bool)

(assert (=> b!252050 (= e!163432 (not call!23708))))

(declare-fun b!252051 () Bool)

(assert (=> b!252051 (= e!163431 ((_ is Undefined!1094) lt!126361))))

(declare-fun b!252052 () Bool)

(declare-fun Unit!7773 () Unit!7769)

(assert (=> b!252052 (= e!163439 Unit!7773)))

(declare-fun lt!126362 () Unit!7769)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!398 (array!12333 array!12331 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) Int) Unit!7769)

(assert (=> b!252052 (= lt!126362 (lemmaInListMapThenSeekEntryOrOpenFindsIt!398 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)))))

(assert (=> b!252052 false))

(declare-fun b!252053 () Bool)

(assert (=> b!252053 (= e!163428 tp_is_empty!6505)))

(assert (= (and start!24100 res!123378) b!252032))

(assert (= (and b!252032 res!123382) b!252034))

(assert (= (and b!252034 res!123381) b!252049))

(assert (= (and b!252049 c!42454) b!252052))

(assert (= (and b!252049 (not c!42454)) b!252036))

(assert (= (and b!252036 c!42453) b!252046))

(assert (= (and b!252036 (not c!42453)) b!252048))

(assert (= (and b!252046 res!123377) b!252045))

(assert (= (and b!252045 res!123379) b!252042))

(assert (= (and b!252048 c!42456) b!252038))

(assert (= (and b!252048 (not c!42456)) b!252051))

(assert (= (and b!252038 res!123383) b!252037))

(assert (= (and b!252037 res!123380) b!252050))

(assert (= (or b!252046 b!252038) bm!23705))

(assert (= (or b!252042 b!252050) bm!23704))

(assert (= (and b!252049 res!123384) b!252039))

(assert (= (and b!252039 c!42455) b!252035))

(assert (= (and b!252039 (not c!42455)) b!252043))

(assert (= (and b!252039 (not res!123376)) b!252033))

(assert (= (and b!252033 (not res!123385)) b!252040))

(assert (= (and b!252041 condMapEmpty!11061) mapIsEmpty!11061))

(assert (= (and b!252041 (not condMapEmpty!11061)) mapNonEmpty!11061))

(assert (= (and mapNonEmpty!11061 ((_ is ValueCellFull!2909) mapValue!11061)) b!252047))

(assert (= (and b!252041 ((_ is ValueCellFull!2909) mapDefault!11061)) b!252053))

(assert (= b!252044 b!252041))

(assert (= start!24100 b!252044))

(declare-fun m!268411 () Bool)

(assert (=> bm!23704 m!268411))

(declare-fun m!268413 () Bool)

(assert (=> start!24100 m!268413))

(declare-fun m!268415 () Bool)

(assert (=> b!252040 m!268415))

(declare-fun m!268417 () Bool)

(assert (=> b!252044 m!268417))

(declare-fun m!268419 () Bool)

(assert (=> b!252044 m!268419))

(declare-fun m!268421 () Bool)

(assert (=> mapNonEmpty!11061 m!268421))

(declare-fun m!268423 () Bool)

(assert (=> b!252037 m!268423))

(declare-fun m!268425 () Bool)

(assert (=> b!252049 m!268425))

(declare-fun m!268427 () Bool)

(assert (=> b!252049 m!268427))

(assert (=> b!252049 m!268427))

(declare-fun m!268429 () Bool)

(assert (=> b!252049 m!268429))

(declare-fun m!268431 () Bool)

(assert (=> b!252036 m!268431))

(declare-fun m!268433 () Bool)

(assert (=> b!252045 m!268433))

(declare-fun m!268435 () Bool)

(assert (=> b!252034 m!268435))

(declare-fun m!268437 () Bool)

(assert (=> b!252039 m!268437))

(assert (=> b!252039 m!268411))

(declare-fun m!268439 () Bool)

(assert (=> b!252039 m!268439))

(declare-fun m!268441 () Bool)

(assert (=> b!252039 m!268441))

(declare-fun m!268443 () Bool)

(assert (=> b!252039 m!268443))

(declare-fun m!268445 () Bool)

(assert (=> b!252039 m!268445))

(declare-fun m!268447 () Bool)

(assert (=> b!252039 m!268447))

(declare-fun m!268449 () Bool)

(assert (=> b!252039 m!268449))

(declare-fun m!268451 () Bool)

(assert (=> b!252039 m!268451))

(declare-fun m!268453 () Bool)

(assert (=> b!252039 m!268453))

(declare-fun m!268455 () Bool)

(assert (=> bm!23705 m!268455))

(declare-fun m!268457 () Bool)

(assert (=> b!252052 m!268457))

(declare-fun m!268459 () Bool)

(assert (=> b!252035 m!268459))

(check-sat (not b!252040) (not b_next!6643) (not bm!23705) (not b!252035) (not b!252052) (not b!252036) (not start!24100) (not b!252039) (not b!252044) (not b!252049) b_and!13691 (not b!252034) (not mapNonEmpty!11061) (not bm!23704) tp_is_empty!6505)
(check-sat b_and!13691 (not b_next!6643))
(get-model)

(declare-fun d!61367 () Bool)

(declare-fun res!123452 () Bool)

(declare-fun e!163535 () Bool)

(assert (=> d!61367 (=> (not res!123452) (not e!163535))))

(declare-fun simpleValid!266 (LongMapFixedSize!3718) Bool)

(assert (=> d!61367 (= res!123452 (simpleValid!266 thiss!1504))))

(assert (=> d!61367 (= (valid!1460 thiss!1504) e!163535)))

(declare-fun b!252192 () Bool)

(declare-fun res!123453 () Bool)

(assert (=> b!252192 (=> (not res!123453) (not e!163535))))

(assert (=> b!252192 (= res!123453 (= (arrayCountValidKeys!0 (_keys!6802 thiss!1504) #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))) (_size!1908 thiss!1504)))))

(declare-fun b!252193 () Bool)

(declare-fun res!123454 () Bool)

(assert (=> b!252193 (=> (not res!123454) (not e!163535))))

(assert (=> b!252193 (= res!123454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6802 thiss!1504) (mask!10868 thiss!1504)))))

(declare-fun b!252194 () Bool)

(assert (=> b!252194 (= e!163535 (arrayNoDuplicates!0 (_keys!6802 thiss!1504) #b00000000000000000000000000000000 Nil!3647))))

(assert (= (and d!61367 res!123452) b!252192))

(assert (= (and b!252192 res!123453) b!252193))

(assert (= (and b!252193 res!123454) b!252194))

(declare-fun m!268561 () Bool)

(assert (=> d!61367 m!268561))

(assert (=> b!252192 m!268451))

(assert (=> b!252193 m!268415))

(declare-fun m!268563 () Bool)

(assert (=> b!252194 m!268563))

(assert (=> start!24100 d!61367))

(declare-fun d!61369 () Bool)

(assert (=> d!61369 (= (inRange!0 index!297 (mask!10868 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10868 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!252049 d!61369))

(declare-fun d!61371 () Bool)

(declare-fun e!163540 () Bool)

(assert (=> d!61371 e!163540))

(declare-fun res!123457 () Bool)

(assert (=> d!61371 (=> res!123457 e!163540)))

(declare-fun lt!126435 () Bool)

(assert (=> d!61371 (= res!123457 (not lt!126435))))

(declare-fun lt!126437 () Bool)

(assert (=> d!61371 (= lt!126435 lt!126437)))

(declare-fun lt!126436 () Unit!7769)

(declare-fun e!163541 () Unit!7769)

(assert (=> d!61371 (= lt!126436 e!163541)))

(declare-fun c!42483 () Bool)

(assert (=> d!61371 (= c!42483 lt!126437)))

(declare-fun containsKey!293 (List!3651 (_ BitVec 64)) Bool)

(assert (=> d!61371 (= lt!126437 (containsKey!293 (toList!1859 (getCurrentListMap!1391 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504))) key!932))))

(assert (=> d!61371 (= (contains!1801 (getCurrentListMap!1391 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)) key!932) lt!126435)))

(declare-fun b!252201 () Bool)

(declare-fun lt!126438 () Unit!7769)

(assert (=> b!252201 (= e!163541 lt!126438)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!241 (List!3651 (_ BitVec 64)) Unit!7769)

(assert (=> b!252201 (= lt!126438 (lemmaContainsKeyImpliesGetValueByKeyDefined!241 (toList!1859 (getCurrentListMap!1391 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504))) key!932))))

(declare-datatypes ((Option!308 0))(
  ( (Some!307 (v!5371 V!8321)) (None!306) )
))
(declare-fun isDefined!242 (Option!308) Bool)

(declare-fun getValueByKey!302 (List!3651 (_ BitVec 64)) Option!308)

(assert (=> b!252201 (isDefined!242 (getValueByKey!302 (toList!1859 (getCurrentListMap!1391 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504))) key!932))))

(declare-fun b!252202 () Bool)

(declare-fun Unit!7782 () Unit!7769)

(assert (=> b!252202 (= e!163541 Unit!7782)))

(declare-fun b!252203 () Bool)

(assert (=> b!252203 (= e!163540 (isDefined!242 (getValueByKey!302 (toList!1859 (getCurrentListMap!1391 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504))) key!932)))))

(assert (= (and d!61371 c!42483) b!252201))

(assert (= (and d!61371 (not c!42483)) b!252202))

(assert (= (and d!61371 (not res!123457)) b!252203))

(declare-fun m!268565 () Bool)

(assert (=> d!61371 m!268565))

(declare-fun m!268567 () Bool)

(assert (=> b!252201 m!268567))

(declare-fun m!268569 () Bool)

(assert (=> b!252201 m!268569))

(assert (=> b!252201 m!268569))

(declare-fun m!268571 () Bool)

(assert (=> b!252201 m!268571))

(assert (=> b!252203 m!268569))

(assert (=> b!252203 m!268569))

(assert (=> b!252203 m!268571))

(assert (=> b!252049 d!61371))

(declare-fun b!252246 () Bool)

(declare-fun e!163578 () Bool)

(declare-fun lt!126493 () ListLongMap!3687)

(declare-fun apply!243 (ListLongMap!3687 (_ BitVec 64)) V!8321)

(assert (=> b!252246 (= e!163578 (= (apply!243 lt!126493 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4497 thiss!1504)))))

(declare-fun b!252247 () Bool)

(declare-fun e!163570 () ListLongMap!3687)

(declare-fun e!163572 () ListLongMap!3687)

(assert (=> b!252247 (= e!163570 e!163572)))

(declare-fun c!42499 () Bool)

(assert (=> b!252247 (= c!42499 (and (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!252248 () Bool)

(declare-fun call!23735 () ListLongMap!3687)

(assert (=> b!252248 (= e!163572 call!23735)))

(declare-fun b!252249 () Bool)

(declare-fun e!163574 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!252249 (= e!163574 (validKeyInArray!0 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252250 () Bool)

(declare-fun e!163568 () Bool)

(assert (=> b!252250 (= e!163568 (= (apply!243 lt!126493 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4497 thiss!1504)))))

(declare-fun b!252251 () Bool)

(declare-fun res!123480 () Bool)

(declare-fun e!163577 () Bool)

(assert (=> b!252251 (=> (not res!123480) (not e!163577))))

(declare-fun e!163580 () Bool)

(assert (=> b!252251 (= res!123480 e!163580)))

(declare-fun c!42501 () Bool)

(assert (=> b!252251 (= c!42501 (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!252252 () Bool)

(declare-fun e!163575 () ListLongMap!3687)

(declare-fun call!23741 () ListLongMap!3687)

(assert (=> b!252252 (= e!163575 call!23741)))

(declare-fun b!252253 () Bool)

(declare-fun e!163576 () Bool)

(assert (=> b!252253 (= e!163576 e!163568)))

(declare-fun res!123484 () Bool)

(declare-fun call!23739 () Bool)

(assert (=> b!252253 (= res!123484 call!23739)))

(assert (=> b!252253 (=> (not res!123484) (not e!163568))))

(declare-fun b!252255 () Bool)

(declare-fun call!23740 () ListLongMap!3687)

(declare-fun +!670 (ListLongMap!3687 tuple2!4772) ListLongMap!3687)

(assert (=> b!252255 (= e!163570 (+!670 call!23740 (tuple2!4773 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4497 thiss!1504))))))

(declare-fun bm!23732 () Bool)

(declare-fun call!23738 () ListLongMap!3687)

(declare-fun c!42500 () Bool)

(declare-fun call!23736 () ListLongMap!3687)

(assert (=> bm!23732 (= call!23740 (+!670 (ite c!42500 call!23736 (ite c!42499 call!23738 call!23741)) (ite (or c!42500 c!42499) (tuple2!4773 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4497 thiss!1504)) (tuple2!4773 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4497 thiss!1504)))))))

(declare-fun bm!23733 () Bool)

(assert (=> bm!23733 (= call!23735 call!23740)))

(declare-fun b!252256 () Bool)

(declare-fun e!163571 () Unit!7769)

(declare-fun lt!126488 () Unit!7769)

(assert (=> b!252256 (= e!163571 lt!126488)))

(declare-fun lt!126496 () ListLongMap!3687)

(declare-fun getCurrentListMapNoExtraKeys!559 (array!12333 array!12331 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 32) Int) ListLongMap!3687)

(assert (=> b!252256 (= lt!126496 (getCurrentListMapNoExtraKeys!559 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(declare-fun lt!126497 () (_ BitVec 64))

(assert (=> b!252256 (= lt!126497 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126485 () (_ BitVec 64))

(assert (=> b!252256 (= lt!126485 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126498 () Unit!7769)

(declare-fun addStillContains!219 (ListLongMap!3687 (_ BitVec 64) V!8321 (_ BitVec 64)) Unit!7769)

(assert (=> b!252256 (= lt!126498 (addStillContains!219 lt!126496 lt!126497 (zeroValue!4497 thiss!1504) lt!126485))))

(assert (=> b!252256 (contains!1801 (+!670 lt!126496 (tuple2!4773 lt!126497 (zeroValue!4497 thiss!1504))) lt!126485)))

(declare-fun lt!126494 () Unit!7769)

(assert (=> b!252256 (= lt!126494 lt!126498)))

(declare-fun lt!126499 () ListLongMap!3687)

(assert (=> b!252256 (= lt!126499 (getCurrentListMapNoExtraKeys!559 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(declare-fun lt!126483 () (_ BitVec 64))

(assert (=> b!252256 (= lt!126483 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126502 () (_ BitVec 64))

(assert (=> b!252256 (= lt!126502 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126503 () Unit!7769)

(declare-fun addApplyDifferent!219 (ListLongMap!3687 (_ BitVec 64) V!8321 (_ BitVec 64)) Unit!7769)

(assert (=> b!252256 (= lt!126503 (addApplyDifferent!219 lt!126499 lt!126483 (minValue!4497 thiss!1504) lt!126502))))

(assert (=> b!252256 (= (apply!243 (+!670 lt!126499 (tuple2!4773 lt!126483 (minValue!4497 thiss!1504))) lt!126502) (apply!243 lt!126499 lt!126502))))

(declare-fun lt!126484 () Unit!7769)

(assert (=> b!252256 (= lt!126484 lt!126503)))

(declare-fun lt!126490 () ListLongMap!3687)

(assert (=> b!252256 (= lt!126490 (getCurrentListMapNoExtraKeys!559 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(declare-fun lt!126491 () (_ BitVec 64))

(assert (=> b!252256 (= lt!126491 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126487 () (_ BitVec 64))

(assert (=> b!252256 (= lt!126487 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126504 () Unit!7769)

(assert (=> b!252256 (= lt!126504 (addApplyDifferent!219 lt!126490 lt!126491 (zeroValue!4497 thiss!1504) lt!126487))))

(assert (=> b!252256 (= (apply!243 (+!670 lt!126490 (tuple2!4773 lt!126491 (zeroValue!4497 thiss!1504))) lt!126487) (apply!243 lt!126490 lt!126487))))

(declare-fun lt!126501 () Unit!7769)

(assert (=> b!252256 (= lt!126501 lt!126504)))

(declare-fun lt!126489 () ListLongMap!3687)

(assert (=> b!252256 (= lt!126489 (getCurrentListMapNoExtraKeys!559 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(declare-fun lt!126492 () (_ BitVec 64))

(assert (=> b!252256 (= lt!126492 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126495 () (_ BitVec 64))

(assert (=> b!252256 (= lt!126495 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252256 (= lt!126488 (addApplyDifferent!219 lt!126489 lt!126492 (minValue!4497 thiss!1504) lt!126495))))

(assert (=> b!252256 (= (apply!243 (+!670 lt!126489 (tuple2!4773 lt!126492 (minValue!4497 thiss!1504))) lt!126495) (apply!243 lt!126489 lt!126495))))

(declare-fun b!252257 () Bool)

(declare-fun e!163579 () Bool)

(assert (=> b!252257 (= e!163579 (validKeyInArray!0 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252258 () Bool)

(assert (=> b!252258 (= e!163577 e!163576)))

(declare-fun c!42497 () Bool)

(assert (=> b!252258 (= c!42497 (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!252259 () Bool)

(assert (=> b!252259 (= e!163575 call!23735)))

(declare-fun b!252260 () Bool)

(assert (=> b!252260 (= e!163576 (not call!23739))))

(declare-fun bm!23734 () Bool)

(assert (=> bm!23734 (= call!23741 call!23738)))

(declare-fun b!252261 () Bool)

(declare-fun e!163573 () Bool)

(declare-fun get!3018 (ValueCell!2909 V!8321) V!8321)

(declare-fun dynLambda!586 (Int (_ BitVec 64)) V!8321)

(assert (=> b!252261 (= e!163573 (= (apply!243 lt!126493 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000)) (get!3018 (select (arr!5845 (_values!4639 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!586 (defaultEntry!4656 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!252261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6192 (_values!4639 thiss!1504))))))

(assert (=> b!252261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))))))

(declare-fun bm!23735 () Bool)

(assert (=> bm!23735 (= call!23739 (contains!1801 lt!126493 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23736 () Bool)

(assert (=> bm!23736 (= call!23738 call!23736)))

(declare-fun bm!23737 () Bool)

(assert (=> bm!23737 (= call!23736 (getCurrentListMapNoExtraKeys!559 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(declare-fun b!252262 () Bool)

(assert (=> b!252262 (= e!163580 e!163578)))

(declare-fun res!123476 () Bool)

(declare-fun call!23737 () Bool)

(assert (=> b!252262 (= res!123476 call!23737)))

(assert (=> b!252262 (=> (not res!123476) (not e!163578))))

(declare-fun b!252263 () Bool)

(assert (=> b!252263 (= e!163580 (not call!23737))))

(declare-fun b!252264 () Bool)

(declare-fun res!123483 () Bool)

(assert (=> b!252264 (=> (not res!123483) (not e!163577))))

(declare-fun e!163569 () Bool)

(assert (=> b!252264 (= res!123483 e!163569)))

(declare-fun res!123478 () Bool)

(assert (=> b!252264 (=> res!123478 e!163569)))

(assert (=> b!252264 (= res!123478 (not e!163579))))

(declare-fun res!123477 () Bool)

(assert (=> b!252264 (=> (not res!123477) (not e!163579))))

(assert (=> b!252264 (= res!123477 (bvslt #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))))))

(declare-fun d!61373 () Bool)

(assert (=> d!61373 e!163577))

(declare-fun res!123482 () Bool)

(assert (=> d!61373 (=> (not res!123482) (not e!163577))))

(assert (=> d!61373 (= res!123482 (or (bvsge #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))))))))

(declare-fun lt!126486 () ListLongMap!3687)

(assert (=> d!61373 (= lt!126493 lt!126486)))

(declare-fun lt!126500 () Unit!7769)

(assert (=> d!61373 (= lt!126500 e!163571)))

(declare-fun c!42496 () Bool)

(assert (=> d!61373 (= c!42496 e!163574)))

(declare-fun res!123481 () Bool)

(assert (=> d!61373 (=> (not res!123481) (not e!163574))))

(assert (=> d!61373 (= res!123481 (bvslt #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))))))

(assert (=> d!61373 (= lt!126486 e!163570)))

(assert (=> d!61373 (= c!42500 (and (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61373 (validMask!0 (mask!10868 thiss!1504))))

(assert (=> d!61373 (= (getCurrentListMap!1391 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)) lt!126493)))

(declare-fun b!252254 () Bool)

(assert (=> b!252254 (= e!163569 e!163573)))

(declare-fun res!123479 () Bool)

(assert (=> b!252254 (=> (not res!123479) (not e!163573))))

(assert (=> b!252254 (= res!123479 (contains!1801 lt!126493 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!252254 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))))))

(declare-fun b!252265 () Bool)

(declare-fun Unit!7783 () Unit!7769)

(assert (=> b!252265 (= e!163571 Unit!7783)))

(declare-fun b!252266 () Bool)

(declare-fun c!42498 () Bool)

(assert (=> b!252266 (= c!42498 (and (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!252266 (= e!163572 e!163575)))

(declare-fun bm!23738 () Bool)

(assert (=> bm!23738 (= call!23737 (contains!1801 lt!126493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!61373 c!42500) b!252255))

(assert (= (and d!61373 (not c!42500)) b!252247))

(assert (= (and b!252247 c!42499) b!252248))

(assert (= (and b!252247 (not c!42499)) b!252266))

(assert (= (and b!252266 c!42498) b!252259))

(assert (= (and b!252266 (not c!42498)) b!252252))

(assert (= (or b!252259 b!252252) bm!23734))

(assert (= (or b!252248 bm!23734) bm!23736))

(assert (= (or b!252248 b!252259) bm!23733))

(assert (= (or b!252255 bm!23736) bm!23737))

(assert (= (or b!252255 bm!23733) bm!23732))

(assert (= (and d!61373 res!123481) b!252249))

(assert (= (and d!61373 c!42496) b!252256))

(assert (= (and d!61373 (not c!42496)) b!252265))

(assert (= (and d!61373 res!123482) b!252264))

(assert (= (and b!252264 res!123477) b!252257))

(assert (= (and b!252264 (not res!123478)) b!252254))

(assert (= (and b!252254 res!123479) b!252261))

(assert (= (and b!252264 res!123483) b!252251))

(assert (= (and b!252251 c!42501) b!252262))

(assert (= (and b!252251 (not c!42501)) b!252263))

(assert (= (and b!252262 res!123476) b!252246))

(assert (= (or b!252262 b!252263) bm!23738))

(assert (= (and b!252251 res!123480) b!252258))

(assert (= (and b!252258 c!42497) b!252253))

(assert (= (and b!252258 (not c!42497)) b!252260))

(assert (= (and b!252253 res!123484) b!252250))

(assert (= (or b!252253 b!252260) bm!23735))

(declare-fun b_lambda!8137 () Bool)

(assert (=> (not b_lambda!8137) (not b!252261)))

(declare-fun t!8687 () Bool)

(declare-fun tb!2991 () Bool)

(assert (=> (and b!252044 (= (defaultEntry!4656 thiss!1504) (defaultEntry!4656 thiss!1504)) t!8687) tb!2991))

(declare-fun result!5311 () Bool)

(assert (=> tb!2991 (= result!5311 tp_is_empty!6505)))

(assert (=> b!252261 t!8687))

(declare-fun b_and!13697 () Bool)

(assert (= b_and!13691 (and (=> t!8687 result!5311) b_and!13697)))

(declare-fun m!268573 () Bool)

(assert (=> bm!23735 m!268573))

(declare-fun m!268575 () Bool)

(assert (=> b!252256 m!268575))

(declare-fun m!268577 () Bool)

(assert (=> b!252256 m!268577))

(declare-fun m!268579 () Bool)

(assert (=> b!252256 m!268579))

(declare-fun m!268581 () Bool)

(assert (=> b!252256 m!268581))

(declare-fun m!268583 () Bool)

(assert (=> b!252256 m!268583))

(declare-fun m!268585 () Bool)

(assert (=> b!252256 m!268585))

(declare-fun m!268587 () Bool)

(assert (=> b!252256 m!268587))

(declare-fun m!268589 () Bool)

(assert (=> b!252256 m!268589))

(declare-fun m!268591 () Bool)

(assert (=> b!252256 m!268591))

(declare-fun m!268593 () Bool)

(assert (=> b!252256 m!268593))

(declare-fun m!268595 () Bool)

(assert (=> b!252256 m!268595))

(declare-fun m!268597 () Bool)

(assert (=> b!252256 m!268597))

(declare-fun m!268599 () Bool)

(assert (=> b!252256 m!268599))

(assert (=> b!252256 m!268591))

(declare-fun m!268601 () Bool)

(assert (=> b!252256 m!268601))

(declare-fun m!268603 () Bool)

(assert (=> b!252256 m!268603))

(declare-fun m!268605 () Bool)

(assert (=> b!252256 m!268605))

(declare-fun m!268607 () Bool)

(assert (=> b!252256 m!268607))

(assert (=> b!252256 m!268579))

(assert (=> b!252256 m!268585))

(assert (=> b!252256 m!268603))

(assert (=> b!252261 m!268607))

(declare-fun m!268609 () Bool)

(assert (=> b!252261 m!268609))

(assert (=> b!252261 m!268607))

(declare-fun m!268611 () Bool)

(assert (=> b!252261 m!268611))

(assert (=> b!252261 m!268611))

(declare-fun m!268613 () Bool)

(assert (=> b!252261 m!268613))

(declare-fun m!268615 () Bool)

(assert (=> b!252261 m!268615))

(assert (=> b!252261 m!268613))

(declare-fun m!268617 () Bool)

(assert (=> b!252246 m!268617))

(assert (=> b!252254 m!268607))

(assert (=> b!252254 m!268607))

(declare-fun m!268619 () Bool)

(assert (=> b!252254 m!268619))

(declare-fun m!268621 () Bool)

(assert (=> b!252250 m!268621))

(declare-fun m!268623 () Bool)

(assert (=> bm!23732 m!268623))

(assert (=> b!252257 m!268607))

(assert (=> b!252257 m!268607))

(declare-fun m!268625 () Bool)

(assert (=> b!252257 m!268625))

(assert (=> bm!23737 m!268583))

(assert (=> b!252249 m!268607))

(assert (=> b!252249 m!268607))

(assert (=> b!252249 m!268625))

(assert (=> d!61373 m!268437))

(declare-fun m!268627 () Bool)

(assert (=> bm!23738 m!268627))

(declare-fun m!268629 () Bool)

(assert (=> b!252255 m!268629))

(assert (=> b!252049 d!61373))

(declare-fun b!252277 () Bool)

(declare-fun e!163587 () Bool)

(declare-fun call!23744 () Bool)

(assert (=> b!252277 (= e!163587 call!23744)))

(declare-fun b!252278 () Bool)

(declare-fun e!163589 () Bool)

(assert (=> b!252278 (= e!163589 e!163587)))

(declare-fun lt!126512 () (_ BitVec 64))

(assert (=> b!252278 (= lt!126512 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126513 () Unit!7769)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12333 (_ BitVec 64) (_ BitVec 32)) Unit!7769)

(assert (=> b!252278 (= lt!126513 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6802 thiss!1504) lt!126512 #b00000000000000000000000000000000))))

(assert (=> b!252278 (arrayContainsKey!0 (_keys!6802 thiss!1504) lt!126512 #b00000000000000000000000000000000)))

(declare-fun lt!126511 () Unit!7769)

(assert (=> b!252278 (= lt!126511 lt!126513)))

(declare-fun res!123489 () Bool)

(assert (=> b!252278 (= res!123489 (= (seekEntryOrOpen!0 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000) (_keys!6802 thiss!1504) (mask!10868 thiss!1504)) (Found!1094 #b00000000000000000000000000000000)))))

(assert (=> b!252278 (=> (not res!123489) (not e!163587))))

(declare-fun b!252279 () Bool)

(assert (=> b!252279 (= e!163589 call!23744)))

(declare-fun bm!23741 () Bool)

(assert (=> bm!23741 (= call!23744 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6802 thiss!1504) (mask!10868 thiss!1504)))))

(declare-fun b!252280 () Bool)

(declare-fun e!163588 () Bool)

(assert (=> b!252280 (= e!163588 e!163589)))

(declare-fun c!42504 () Bool)

(assert (=> b!252280 (= c!42504 (validKeyInArray!0 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61375 () Bool)

(declare-fun res!123490 () Bool)

(assert (=> d!61375 (=> res!123490 e!163588)))

(assert (=> d!61375 (= res!123490 (bvsge #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))))))

(assert (=> d!61375 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6802 thiss!1504) (mask!10868 thiss!1504)) e!163588)))

(assert (= (and d!61375 (not res!123490)) b!252280))

(assert (= (and b!252280 c!42504) b!252278))

(assert (= (and b!252280 (not c!42504)) b!252279))

(assert (= (and b!252278 res!123489) b!252277))

(assert (= (or b!252277 b!252279) bm!23741))

(assert (=> b!252278 m!268607))

(declare-fun m!268631 () Bool)

(assert (=> b!252278 m!268631))

(declare-fun m!268633 () Bool)

(assert (=> b!252278 m!268633))

(assert (=> b!252278 m!268607))

(declare-fun m!268635 () Bool)

(assert (=> b!252278 m!268635))

(declare-fun m!268637 () Bool)

(assert (=> bm!23741 m!268637))

(assert (=> b!252280 m!268607))

(assert (=> b!252280 m!268607))

(assert (=> b!252280 m!268625))

(assert (=> b!252040 d!61375))

(declare-fun e!163594 () Bool)

(declare-fun b!252292 () Bool)

(assert (=> b!252292 (= e!163594 (= (arrayCountValidKeys!0 (array!12334 (store (arr!5846 (_keys!6802 thiss!1504)) index!297 key!932) (size!6193 (_keys!6802 thiss!1504))) #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6802 thiss!1504) #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!252289 () Bool)

(declare-fun res!123499 () Bool)

(declare-fun e!163595 () Bool)

(assert (=> b!252289 (=> (not res!123499) (not e!163595))))

(assert (=> b!252289 (= res!123499 (not (validKeyInArray!0 (select (arr!5846 (_keys!6802 thiss!1504)) index!297))))))

(declare-fun b!252290 () Bool)

(declare-fun res!123501 () Bool)

(assert (=> b!252290 (=> (not res!123501) (not e!163595))))

(assert (=> b!252290 (= res!123501 (validKeyInArray!0 key!932))))

(declare-fun d!61377 () Bool)

(assert (=> d!61377 e!163594))

(declare-fun res!123500 () Bool)

(assert (=> d!61377 (=> (not res!123500) (not e!163594))))

(assert (=> d!61377 (= res!123500 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6193 (_keys!6802 thiss!1504)))))))

(declare-fun lt!126516 () Unit!7769)

(declare-fun choose!1 (array!12333 (_ BitVec 32) (_ BitVec 64)) Unit!7769)

(assert (=> d!61377 (= lt!126516 (choose!1 (_keys!6802 thiss!1504) index!297 key!932))))

(assert (=> d!61377 e!163595))

(declare-fun res!123502 () Bool)

(assert (=> d!61377 (=> (not res!123502) (not e!163595))))

(assert (=> d!61377 (= res!123502 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6193 (_keys!6802 thiss!1504)))))))

(assert (=> d!61377 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6802 thiss!1504) index!297 key!932) lt!126516)))

(declare-fun b!252291 () Bool)

(assert (=> b!252291 (= e!163595 (bvslt (size!6193 (_keys!6802 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!61377 res!123502) b!252289))

(assert (= (and b!252289 res!123499) b!252290))

(assert (= (and b!252290 res!123501) b!252291))

(assert (= (and d!61377 res!123500) b!252292))

(assert (=> b!252292 m!268447))

(declare-fun m!268639 () Bool)

(assert (=> b!252292 m!268639))

(assert (=> b!252292 m!268451))

(declare-fun m!268641 () Bool)

(assert (=> b!252289 m!268641))

(assert (=> b!252289 m!268641))

(declare-fun m!268643 () Bool)

(assert (=> b!252289 m!268643))

(declare-fun m!268645 () Bool)

(assert (=> b!252290 m!268645))

(declare-fun m!268647 () Bool)

(assert (=> d!61377 m!268647))

(assert (=> b!252039 d!61377))

(declare-fun b!252301 () Bool)

(declare-fun e!163600 () (_ BitVec 32))

(assert (=> b!252301 (= e!163600 #b00000000000000000000000000000000)))

(declare-fun d!61379 () Bool)

(declare-fun lt!126519 () (_ BitVec 32))

(assert (=> d!61379 (and (bvsge lt!126519 #b00000000000000000000000000000000) (bvsle lt!126519 (bvsub (size!6193 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61379 (= lt!126519 e!163600)))

(declare-fun c!42510 () Bool)

(assert (=> d!61379 (= c!42510 (bvsge #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))))))

(assert (=> d!61379 (and (bvsle #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6193 (_keys!6802 thiss!1504)) (size!6193 (_keys!6802 thiss!1504))))))

(assert (=> d!61379 (= (arrayCountValidKeys!0 (_keys!6802 thiss!1504) #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))) lt!126519)))

(declare-fun b!252302 () Bool)

(declare-fun e!163601 () (_ BitVec 32))

(declare-fun call!23747 () (_ BitVec 32))

(assert (=> b!252302 (= e!163601 (bvadd #b00000000000000000000000000000001 call!23747))))

(declare-fun bm!23744 () Bool)

(assert (=> bm!23744 (= call!23747 (arrayCountValidKeys!0 (_keys!6802 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6193 (_keys!6802 thiss!1504))))))

(declare-fun b!252303 () Bool)

(assert (=> b!252303 (= e!163601 call!23747)))

(declare-fun b!252304 () Bool)

(assert (=> b!252304 (= e!163600 e!163601)))

(declare-fun c!42509 () Bool)

(assert (=> b!252304 (= c!42509 (validKeyInArray!0 (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61379 c!42510) b!252301))

(assert (= (and d!61379 (not c!42510)) b!252304))

(assert (= (and b!252304 c!42509) b!252302))

(assert (= (and b!252304 (not c!42509)) b!252303))

(assert (= (or b!252302 b!252303) bm!23744))

(declare-fun m!268649 () Bool)

(assert (=> bm!23744 m!268649))

(assert (=> b!252304 m!268607))

(assert (=> b!252304 m!268607))

(assert (=> b!252304 m!268625))

(assert (=> b!252039 d!61379))

(declare-fun d!61381 () Bool)

(assert (=> d!61381 (= (validMask!0 (mask!10868 thiss!1504)) (and (or (= (mask!10868 thiss!1504) #b00000000000000000000000000000111) (= (mask!10868 thiss!1504) #b00000000000000000000000000001111) (= (mask!10868 thiss!1504) #b00000000000000000000000000011111) (= (mask!10868 thiss!1504) #b00000000000000000000000000111111) (= (mask!10868 thiss!1504) #b00000000000000000000000001111111) (= (mask!10868 thiss!1504) #b00000000000000000000000011111111) (= (mask!10868 thiss!1504) #b00000000000000000000000111111111) (= (mask!10868 thiss!1504) #b00000000000000000000001111111111) (= (mask!10868 thiss!1504) #b00000000000000000000011111111111) (= (mask!10868 thiss!1504) #b00000000000000000000111111111111) (= (mask!10868 thiss!1504) #b00000000000000000001111111111111) (= (mask!10868 thiss!1504) #b00000000000000000011111111111111) (= (mask!10868 thiss!1504) #b00000000000000000111111111111111) (= (mask!10868 thiss!1504) #b00000000000000001111111111111111) (= (mask!10868 thiss!1504) #b00000000000000011111111111111111) (= (mask!10868 thiss!1504) #b00000000000000111111111111111111) (= (mask!10868 thiss!1504) #b00000000000001111111111111111111) (= (mask!10868 thiss!1504) #b00000000000011111111111111111111) (= (mask!10868 thiss!1504) #b00000000000111111111111111111111) (= (mask!10868 thiss!1504) #b00000000001111111111111111111111) (= (mask!10868 thiss!1504) #b00000000011111111111111111111111) (= (mask!10868 thiss!1504) #b00000000111111111111111111111111) (= (mask!10868 thiss!1504) #b00000001111111111111111111111111) (= (mask!10868 thiss!1504) #b00000011111111111111111111111111) (= (mask!10868 thiss!1504) #b00000111111111111111111111111111) (= (mask!10868 thiss!1504) #b00001111111111111111111111111111) (= (mask!10868 thiss!1504) #b00011111111111111111111111111111) (= (mask!10868 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10868 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!252039 d!61381))

(declare-fun b!252305 () Bool)

(declare-fun e!163602 () (_ BitVec 32))

(assert (=> b!252305 (= e!163602 #b00000000000000000000000000000000)))

(declare-fun d!61383 () Bool)

(declare-fun lt!126520 () (_ BitVec 32))

(assert (=> d!61383 (and (bvsge lt!126520 #b00000000000000000000000000000000) (bvsle lt!126520 (bvsub (size!6193 lt!126366) #b00000000000000000000000000000000)))))

(assert (=> d!61383 (= lt!126520 e!163602)))

(declare-fun c!42512 () Bool)

(assert (=> d!61383 (= c!42512 (bvsge #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))))))

(assert (=> d!61383 (and (bvsle #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6193 (_keys!6802 thiss!1504)) (size!6193 lt!126366)))))

(assert (=> d!61383 (= (arrayCountValidKeys!0 lt!126366 #b00000000000000000000000000000000 (size!6193 (_keys!6802 thiss!1504))) lt!126520)))

(declare-fun b!252306 () Bool)

(declare-fun e!163603 () (_ BitVec 32))

(declare-fun call!23748 () (_ BitVec 32))

(assert (=> b!252306 (= e!163603 (bvadd #b00000000000000000000000000000001 call!23748))))

(declare-fun bm!23745 () Bool)

(assert (=> bm!23745 (= call!23748 (arrayCountValidKeys!0 lt!126366 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6193 (_keys!6802 thiss!1504))))))

(declare-fun b!252307 () Bool)

(assert (=> b!252307 (= e!163603 call!23748)))

(declare-fun b!252308 () Bool)

(assert (=> b!252308 (= e!163602 e!163603)))

(declare-fun c!42511 () Bool)

(assert (=> b!252308 (= c!42511 (validKeyInArray!0 (select (arr!5846 lt!126366) #b00000000000000000000000000000000)))))

(assert (= (and d!61383 c!42512) b!252305))

(assert (= (and d!61383 (not c!42512)) b!252308))

(assert (= (and b!252308 c!42511) b!252306))

(assert (= (and b!252308 (not c!42511)) b!252307))

(assert (= (or b!252306 b!252307) bm!23745))

(declare-fun m!268651 () Bool)

(assert (=> bm!23745 m!268651))

(declare-fun m!268653 () Bool)

(assert (=> b!252308 m!268653))

(assert (=> b!252308 m!268653))

(declare-fun m!268655 () Bool)

(assert (=> b!252308 m!268655))

(assert (=> b!252039 d!61383))

(declare-fun b!252309 () Bool)

(declare-fun e!163604 () Bool)

(declare-fun call!23749 () Bool)

(assert (=> b!252309 (= e!163604 call!23749)))

(declare-fun b!252310 () Bool)

(declare-fun e!163606 () Bool)

(assert (=> b!252310 (= e!163606 e!163604)))

(declare-fun lt!126522 () (_ BitVec 64))

(assert (=> b!252310 (= lt!126522 (select (arr!5846 lt!126366) #b00000000000000000000000000000000))))

(declare-fun lt!126523 () Unit!7769)

(assert (=> b!252310 (= lt!126523 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126366 lt!126522 #b00000000000000000000000000000000))))

(assert (=> b!252310 (arrayContainsKey!0 lt!126366 lt!126522 #b00000000000000000000000000000000)))

(declare-fun lt!126521 () Unit!7769)

(assert (=> b!252310 (= lt!126521 lt!126523)))

(declare-fun res!123503 () Bool)

(assert (=> b!252310 (= res!123503 (= (seekEntryOrOpen!0 (select (arr!5846 lt!126366) #b00000000000000000000000000000000) lt!126366 (mask!10868 thiss!1504)) (Found!1094 #b00000000000000000000000000000000)))))

(assert (=> b!252310 (=> (not res!123503) (not e!163604))))

(declare-fun b!252311 () Bool)

(assert (=> b!252311 (= e!163606 call!23749)))

(declare-fun bm!23746 () Bool)

(assert (=> bm!23746 (= call!23749 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126366 (mask!10868 thiss!1504)))))

(declare-fun b!252312 () Bool)

(declare-fun e!163605 () Bool)

(assert (=> b!252312 (= e!163605 e!163606)))

(declare-fun c!42513 () Bool)

(assert (=> b!252312 (= c!42513 (validKeyInArray!0 (select (arr!5846 lt!126366) #b00000000000000000000000000000000)))))

(declare-fun d!61385 () Bool)

(declare-fun res!123504 () Bool)

(assert (=> d!61385 (=> res!123504 e!163605)))

(assert (=> d!61385 (= res!123504 (bvsge #b00000000000000000000000000000000 (size!6193 lt!126366)))))

(assert (=> d!61385 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126366 (mask!10868 thiss!1504)) e!163605)))

(assert (= (and d!61385 (not res!123504)) b!252312))

(assert (= (and b!252312 c!42513) b!252310))

(assert (= (and b!252312 (not c!42513)) b!252311))

(assert (= (and b!252310 res!123503) b!252309))

(assert (= (or b!252309 b!252311) bm!23746))

(assert (=> b!252310 m!268653))

(declare-fun m!268657 () Bool)

(assert (=> b!252310 m!268657))

(declare-fun m!268659 () Bool)

(assert (=> b!252310 m!268659))

(assert (=> b!252310 m!268653))

(declare-fun m!268661 () Bool)

(assert (=> b!252310 m!268661))

(declare-fun m!268663 () Bool)

(assert (=> bm!23746 m!268663))

(assert (=> b!252312 m!268653))

(assert (=> b!252312 m!268653))

(assert (=> b!252312 m!268655))

(assert (=> b!252039 d!61385))

(declare-fun d!61387 () Bool)

(declare-fun res!123509 () Bool)

(declare-fun e!163611 () Bool)

(assert (=> d!61387 (=> res!123509 e!163611)))

(assert (=> d!61387 (= res!123509 (= (select (arr!5846 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61387 (= (arrayContainsKey!0 (_keys!6802 thiss!1504) key!932 #b00000000000000000000000000000000) e!163611)))

(declare-fun b!252317 () Bool)

(declare-fun e!163612 () Bool)

(assert (=> b!252317 (= e!163611 e!163612)))

(declare-fun res!123510 () Bool)

(assert (=> b!252317 (=> (not res!123510) (not e!163612))))

(assert (=> b!252317 (= res!123510 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6193 (_keys!6802 thiss!1504))))))

(declare-fun b!252318 () Bool)

(assert (=> b!252318 (= e!163612 (arrayContainsKey!0 (_keys!6802 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61387 (not res!123509)) b!252317))

(assert (= (and b!252317 res!123510) b!252318))

(assert (=> d!61387 m!268607))

(declare-fun m!268665 () Bool)

(assert (=> b!252318 m!268665))

(assert (=> b!252039 d!61387))

(declare-fun d!61389 () Bool)

(declare-fun e!163615 () Bool)

(assert (=> d!61389 e!163615))

(declare-fun res!123513 () Bool)

(assert (=> d!61389 (=> (not res!123513) (not e!163615))))

(assert (=> d!61389 (= res!123513 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6193 (_keys!6802 thiss!1504)))))))

(declare-fun lt!126526 () Unit!7769)

(declare-fun choose!102 ((_ BitVec 64) array!12333 (_ BitVec 32) (_ BitVec 32)) Unit!7769)

(assert (=> d!61389 (= lt!126526 (choose!102 key!932 (_keys!6802 thiss!1504) index!297 (mask!10868 thiss!1504)))))

(assert (=> d!61389 (validMask!0 (mask!10868 thiss!1504))))

(assert (=> d!61389 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6802 thiss!1504) index!297 (mask!10868 thiss!1504)) lt!126526)))

(declare-fun b!252321 () Bool)

(assert (=> b!252321 (= e!163615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12334 (store (arr!5846 (_keys!6802 thiss!1504)) index!297 key!932) (size!6193 (_keys!6802 thiss!1504))) (mask!10868 thiss!1504)))))

(assert (= (and d!61389 res!123513) b!252321))

(declare-fun m!268667 () Bool)

(assert (=> d!61389 m!268667))

(assert (=> d!61389 m!268437))

(assert (=> b!252321 m!268447))

(declare-fun m!268669 () Bool)

(assert (=> b!252321 m!268669))

(assert (=> b!252039 d!61389))

(declare-fun d!61391 () Bool)

(declare-fun e!163618 () Bool)

(assert (=> d!61391 e!163618))

(declare-fun res!123516 () Bool)

(assert (=> d!61391 (=> (not res!123516) (not e!163618))))

(assert (=> d!61391 (= res!123516 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6193 (_keys!6802 thiss!1504)))))))

(declare-fun lt!126529 () Unit!7769)

(declare-fun choose!41 (array!12333 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3650) Unit!7769)

(assert (=> d!61391 (= lt!126529 (choose!41 (_keys!6802 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3647))))

(assert (=> d!61391 (bvslt (size!6193 (_keys!6802 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61391 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6802 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3647) lt!126529)))

(declare-fun b!252324 () Bool)

(assert (=> b!252324 (= e!163618 (arrayNoDuplicates!0 (array!12334 (store (arr!5846 (_keys!6802 thiss!1504)) index!297 key!932) (size!6193 (_keys!6802 thiss!1504))) #b00000000000000000000000000000000 Nil!3647))))

(assert (= (and d!61391 res!123516) b!252324))

(declare-fun m!268671 () Bool)

(assert (=> d!61391 m!268671))

(assert (=> b!252324 m!268447))

(declare-fun m!268673 () Bool)

(assert (=> b!252324 m!268673))

(assert (=> b!252039 d!61391))

(declare-fun b!252335 () Bool)

(declare-fun e!163630 () Bool)

(declare-fun e!163628 () Bool)

(assert (=> b!252335 (= e!163630 e!163628)))

(declare-fun res!123523 () Bool)

(assert (=> b!252335 (=> (not res!123523) (not e!163628))))

(declare-fun e!163629 () Bool)

(assert (=> b!252335 (= res!123523 (not e!163629))))

(declare-fun res!123525 () Bool)

(assert (=> b!252335 (=> (not res!123525) (not e!163629))))

(assert (=> b!252335 (= res!123525 (validKeyInArray!0 (select (arr!5846 lt!126366) #b00000000000000000000000000000000)))))

(declare-fun b!252336 () Bool)

(declare-fun contains!1803 (List!3650 (_ BitVec 64)) Bool)

(assert (=> b!252336 (= e!163629 (contains!1803 Nil!3647 (select (arr!5846 lt!126366) #b00000000000000000000000000000000)))))

(declare-fun b!252337 () Bool)

(declare-fun e!163627 () Bool)

(assert (=> b!252337 (= e!163628 e!163627)))

(declare-fun c!42516 () Bool)

(assert (=> b!252337 (= c!42516 (validKeyInArray!0 (select (arr!5846 lt!126366) #b00000000000000000000000000000000)))))

(declare-fun b!252338 () Bool)

(declare-fun call!23752 () Bool)

(assert (=> b!252338 (= e!163627 call!23752)))

(declare-fun b!252339 () Bool)

(assert (=> b!252339 (= e!163627 call!23752)))

(declare-fun bm!23749 () Bool)

(assert (=> bm!23749 (= call!23752 (arrayNoDuplicates!0 lt!126366 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42516 (Cons!3646 (select (arr!5846 lt!126366) #b00000000000000000000000000000000) Nil!3647) Nil!3647)))))

(declare-fun d!61393 () Bool)

(declare-fun res!123524 () Bool)

(assert (=> d!61393 (=> res!123524 e!163630)))

(assert (=> d!61393 (= res!123524 (bvsge #b00000000000000000000000000000000 (size!6193 lt!126366)))))

(assert (=> d!61393 (= (arrayNoDuplicates!0 lt!126366 #b00000000000000000000000000000000 Nil!3647) e!163630)))

(assert (= (and d!61393 (not res!123524)) b!252335))

(assert (= (and b!252335 res!123525) b!252336))

(assert (= (and b!252335 res!123523) b!252337))

(assert (= (and b!252337 c!42516) b!252338))

(assert (= (and b!252337 (not c!42516)) b!252339))

(assert (= (or b!252338 b!252339) bm!23749))

(assert (=> b!252335 m!268653))

(assert (=> b!252335 m!268653))

(assert (=> b!252335 m!268655))

(assert (=> b!252336 m!268653))

(assert (=> b!252336 m!268653))

(declare-fun m!268675 () Bool)

(assert (=> b!252336 m!268675))

(assert (=> b!252337 m!268653))

(assert (=> b!252337 m!268653))

(assert (=> b!252337 m!268655))

(assert (=> bm!23749 m!268653))

(declare-fun m!268677 () Bool)

(assert (=> bm!23749 m!268677))

(assert (=> b!252039 d!61393))

(declare-fun d!61395 () Bool)

(assert (=> d!61395 (= (inRange!0 (ite c!42453 (index!6546 lt!126361) (index!6549 lt!126361)) (mask!10868 thiss!1504)) (and (bvsge (ite c!42453 (index!6546 lt!126361) (index!6549 lt!126361)) #b00000000000000000000000000000000) (bvslt (ite c!42453 (index!6546 lt!126361) (index!6549 lt!126361)) (bvadd (mask!10868 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23705 d!61395))

(declare-fun b!252356 () Bool)

(declare-fun res!123535 () Bool)

(declare-fun e!163642 () Bool)

(assert (=> b!252356 (=> (not res!123535) (not e!163642))))

(declare-fun call!23757 () Bool)

(assert (=> b!252356 (= res!123535 call!23757)))

(declare-fun e!163640 () Bool)

(assert (=> b!252356 (= e!163640 e!163642)))

(declare-fun b!252357 () Bool)

(declare-fun e!163639 () Bool)

(declare-fun e!163641 () Bool)

(assert (=> b!252357 (= e!163639 e!163641)))

(declare-fun res!123534 () Bool)

(assert (=> b!252357 (= res!123534 call!23757)))

(assert (=> b!252357 (=> (not res!123534) (not e!163641))))

(declare-fun bm!23754 () Bool)

(declare-fun call!23758 () Bool)

(assert (=> bm!23754 (= call!23758 (arrayContainsKey!0 (_keys!6802 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252359 () Bool)

(declare-fun lt!126535 () SeekEntryResult!1094)

(assert (=> b!252359 (= e!163640 ((_ is Undefined!1094) lt!126535))))

(declare-fun b!252360 () Bool)

(assert (=> b!252360 (= e!163639 e!163640)))

(declare-fun c!42522 () Bool)

(assert (=> b!252360 (= c!42522 ((_ is MissingVacant!1094) lt!126535))))

(declare-fun b!252361 () Bool)

(assert (=> b!252361 (= e!163641 (not call!23758))))

(declare-fun c!42521 () Bool)

(declare-fun bm!23755 () Bool)

(assert (=> bm!23755 (= call!23757 (inRange!0 (ite c!42521 (index!6546 lt!126535) (index!6549 lt!126535)) (mask!10868 thiss!1504)))))

(declare-fun b!252358 () Bool)

(assert (=> b!252358 (= e!163642 (not call!23758))))

(declare-fun d!61397 () Bool)

(assert (=> d!61397 e!163639))

(assert (=> d!61397 (= c!42521 ((_ is MissingZero!1094) lt!126535))))

(assert (=> d!61397 (= lt!126535 (seekEntryOrOpen!0 key!932 (_keys!6802 thiss!1504) (mask!10868 thiss!1504)))))

(declare-fun lt!126534 () Unit!7769)

(declare-fun choose!1207 (array!12333 array!12331 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) Int) Unit!7769)

(assert (=> d!61397 (= lt!126534 (choose!1207 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)))))

(assert (=> d!61397 (validMask!0 (mask!10868 thiss!1504))))

(assert (=> d!61397 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!392 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)) lt!126534)))

(declare-fun b!252362 () Bool)

(declare-fun res!123536 () Bool)

(assert (=> b!252362 (=> (not res!123536) (not e!163642))))

(assert (=> b!252362 (= res!123536 (= (select (arr!5846 (_keys!6802 thiss!1504)) (index!6549 lt!126535)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252362 (and (bvsge (index!6549 lt!126535) #b00000000000000000000000000000000) (bvslt (index!6549 lt!126535) (size!6193 (_keys!6802 thiss!1504))))))

(declare-fun b!252363 () Bool)

(assert (=> b!252363 (and (bvsge (index!6546 lt!126535) #b00000000000000000000000000000000) (bvslt (index!6546 lt!126535) (size!6193 (_keys!6802 thiss!1504))))))

(declare-fun res!123537 () Bool)

(assert (=> b!252363 (= res!123537 (= (select (arr!5846 (_keys!6802 thiss!1504)) (index!6546 lt!126535)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252363 (=> (not res!123537) (not e!163641))))

(assert (= (and d!61397 c!42521) b!252357))

(assert (= (and d!61397 (not c!42521)) b!252360))

(assert (= (and b!252357 res!123534) b!252363))

(assert (= (and b!252363 res!123537) b!252361))

(assert (= (and b!252360 c!42522) b!252356))

(assert (= (and b!252360 (not c!42522)) b!252359))

(assert (= (and b!252356 res!123535) b!252362))

(assert (= (and b!252362 res!123536) b!252358))

(assert (= (or b!252357 b!252356) bm!23755))

(assert (= (or b!252361 b!252358) bm!23754))

(declare-fun m!268679 () Bool)

(assert (=> b!252363 m!268679))

(declare-fun m!268681 () Bool)

(assert (=> bm!23755 m!268681))

(assert (=> bm!23754 m!268411))

(assert (=> d!61397 m!268435))

(declare-fun m!268683 () Bool)

(assert (=> d!61397 m!268683))

(assert (=> d!61397 m!268437))

(declare-fun m!268685 () Bool)

(assert (=> b!252362 m!268685))

(assert (=> b!252036 d!61397))

(declare-fun d!61399 () Bool)

(assert (=> d!61399 (contains!1801 (getCurrentListMap!1391 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)) key!932)))

(declare-fun lt!126538 () Unit!7769)

(declare-fun choose!1208 (array!12333 array!12331 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) (_ BitVec 32) Int) Unit!7769)

(assert (=> d!61399 (= lt!126538 (choose!1208 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(assert (=> d!61399 (validMask!0 (mask!10868 thiss!1504))))

(assert (=> d!61399 (= (lemmaArrayContainsKeyThenInListMap!217 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)) lt!126538)))

(declare-fun bs!9046 () Bool)

(assert (= bs!9046 d!61399))

(assert (=> bs!9046 m!268427))

(assert (=> bs!9046 m!268427))

(assert (=> bs!9046 m!268429))

(declare-fun m!268687 () Bool)

(assert (=> bs!9046 m!268687))

(assert (=> bs!9046 m!268437))

(assert (=> b!252035 d!61399))

(declare-fun b!252376 () Bool)

(declare-fun e!163649 () SeekEntryResult!1094)

(declare-fun lt!126546 () SeekEntryResult!1094)

(assert (=> b!252376 (= e!163649 (Found!1094 (index!6548 lt!126546)))))

(declare-fun e!163651 () SeekEntryResult!1094)

(declare-fun b!252377 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12333 (_ BitVec 32)) SeekEntryResult!1094)

(assert (=> b!252377 (= e!163651 (seekKeyOrZeroReturnVacant!0 (x!24714 lt!126546) (index!6548 lt!126546) (index!6548 lt!126546) key!932 (_keys!6802 thiss!1504) (mask!10868 thiss!1504)))))

(declare-fun b!252379 () Bool)

(assert (=> b!252379 (= e!163651 (MissingZero!1094 (index!6548 lt!126546)))))

(declare-fun b!252380 () Bool)

(declare-fun e!163650 () SeekEntryResult!1094)

(assert (=> b!252380 (= e!163650 Undefined!1094)))

(declare-fun b!252381 () Bool)

(assert (=> b!252381 (= e!163650 e!163649)))

(declare-fun lt!126547 () (_ BitVec 64))

(assert (=> b!252381 (= lt!126547 (select (arr!5846 (_keys!6802 thiss!1504)) (index!6548 lt!126546)))))

(declare-fun c!42531 () Bool)

(assert (=> b!252381 (= c!42531 (= lt!126547 key!932))))

(declare-fun d!61401 () Bool)

(declare-fun lt!126545 () SeekEntryResult!1094)

(assert (=> d!61401 (and (or ((_ is Undefined!1094) lt!126545) (not ((_ is Found!1094) lt!126545)) (and (bvsge (index!6547 lt!126545) #b00000000000000000000000000000000) (bvslt (index!6547 lt!126545) (size!6193 (_keys!6802 thiss!1504))))) (or ((_ is Undefined!1094) lt!126545) ((_ is Found!1094) lt!126545) (not ((_ is MissingZero!1094) lt!126545)) (and (bvsge (index!6546 lt!126545) #b00000000000000000000000000000000) (bvslt (index!6546 lt!126545) (size!6193 (_keys!6802 thiss!1504))))) (or ((_ is Undefined!1094) lt!126545) ((_ is Found!1094) lt!126545) ((_ is MissingZero!1094) lt!126545) (not ((_ is MissingVacant!1094) lt!126545)) (and (bvsge (index!6549 lt!126545) #b00000000000000000000000000000000) (bvslt (index!6549 lt!126545) (size!6193 (_keys!6802 thiss!1504))))) (or ((_ is Undefined!1094) lt!126545) (ite ((_ is Found!1094) lt!126545) (= (select (arr!5846 (_keys!6802 thiss!1504)) (index!6547 lt!126545)) key!932) (ite ((_ is MissingZero!1094) lt!126545) (= (select (arr!5846 (_keys!6802 thiss!1504)) (index!6546 lt!126545)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1094) lt!126545) (= (select (arr!5846 (_keys!6802 thiss!1504)) (index!6549 lt!126545)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61401 (= lt!126545 e!163650)))

(declare-fun c!42529 () Bool)

(assert (=> d!61401 (= c!42529 (and ((_ is Intermediate!1094) lt!126546) (undefined!1906 lt!126546)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12333 (_ BitVec 32)) SeekEntryResult!1094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61401 (= lt!126546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10868 thiss!1504)) key!932 (_keys!6802 thiss!1504) (mask!10868 thiss!1504)))))

(assert (=> d!61401 (validMask!0 (mask!10868 thiss!1504))))

(assert (=> d!61401 (= (seekEntryOrOpen!0 key!932 (_keys!6802 thiss!1504) (mask!10868 thiss!1504)) lt!126545)))

(declare-fun b!252378 () Bool)

(declare-fun c!42530 () Bool)

(assert (=> b!252378 (= c!42530 (= lt!126547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252378 (= e!163649 e!163651)))

(assert (= (and d!61401 c!42529) b!252380))

(assert (= (and d!61401 (not c!42529)) b!252381))

(assert (= (and b!252381 c!42531) b!252376))

(assert (= (and b!252381 (not c!42531)) b!252378))

(assert (= (and b!252378 c!42530) b!252379))

(assert (= (and b!252378 (not c!42530)) b!252377))

(declare-fun m!268689 () Bool)

(assert (=> b!252377 m!268689))

(declare-fun m!268691 () Bool)

(assert (=> b!252381 m!268691))

(declare-fun m!268693 () Bool)

(assert (=> d!61401 m!268693))

(declare-fun m!268695 () Bool)

(assert (=> d!61401 m!268695))

(declare-fun m!268697 () Bool)

(assert (=> d!61401 m!268697))

(declare-fun m!268699 () Bool)

(assert (=> d!61401 m!268699))

(declare-fun m!268701 () Bool)

(assert (=> d!61401 m!268701))

(assert (=> d!61401 m!268699))

(assert (=> d!61401 m!268437))

(assert (=> b!252034 d!61401))

(declare-fun d!61403 () Bool)

(assert (=> d!61403 (= (array_inv!3841 (_keys!6802 thiss!1504)) (bvsge (size!6193 (_keys!6802 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252044 d!61403))

(declare-fun d!61405 () Bool)

(assert (=> d!61405 (= (array_inv!3842 (_values!4639 thiss!1504)) (bvsge (size!6192 (_values!4639 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252044 d!61405))

(declare-fun d!61407 () Bool)

(declare-fun e!163654 () Bool)

(assert (=> d!61407 e!163654))

(declare-fun res!123542 () Bool)

(assert (=> d!61407 (=> (not res!123542) (not e!163654))))

(declare-fun lt!126552 () SeekEntryResult!1094)

(assert (=> d!61407 (= res!123542 ((_ is Found!1094) lt!126552))))

(assert (=> d!61407 (= lt!126552 (seekEntryOrOpen!0 key!932 (_keys!6802 thiss!1504) (mask!10868 thiss!1504)))))

(declare-fun lt!126553 () Unit!7769)

(declare-fun choose!1209 (array!12333 array!12331 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) Int) Unit!7769)

(assert (=> d!61407 (= lt!126553 (choose!1209 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)))))

(assert (=> d!61407 (validMask!0 (mask!10868 thiss!1504))))

(assert (=> d!61407 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!398 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)) lt!126553)))

(declare-fun b!252386 () Bool)

(declare-fun res!123543 () Bool)

(assert (=> b!252386 (=> (not res!123543) (not e!163654))))

(assert (=> b!252386 (= res!123543 (inRange!0 (index!6547 lt!126552) (mask!10868 thiss!1504)))))

(declare-fun b!252387 () Bool)

(assert (=> b!252387 (= e!163654 (= (select (arr!5846 (_keys!6802 thiss!1504)) (index!6547 lt!126552)) key!932))))

(assert (=> b!252387 (and (bvsge (index!6547 lt!126552) #b00000000000000000000000000000000) (bvslt (index!6547 lt!126552) (size!6193 (_keys!6802 thiss!1504))))))

(assert (= (and d!61407 res!123542) b!252386))

(assert (= (and b!252386 res!123543) b!252387))

(assert (=> d!61407 m!268435))

(declare-fun m!268703 () Bool)

(assert (=> d!61407 m!268703))

(assert (=> d!61407 m!268437))

(declare-fun m!268705 () Bool)

(assert (=> b!252386 m!268705))

(declare-fun m!268707 () Bool)

(assert (=> b!252387 m!268707))

(assert (=> b!252052 d!61407))

(assert (=> bm!23704 d!61387))

(declare-fun mapNonEmpty!11070 () Bool)

(declare-fun mapRes!11070 () Bool)

(declare-fun tp!23220 () Bool)

(declare-fun e!163660 () Bool)

(assert (=> mapNonEmpty!11070 (= mapRes!11070 (and tp!23220 e!163660))))

(declare-fun mapKey!11070 () (_ BitVec 32))

(declare-fun mapValue!11070 () ValueCell!2909)

(declare-fun mapRest!11070 () (Array (_ BitVec 32) ValueCell!2909))

(assert (=> mapNonEmpty!11070 (= mapRest!11061 (store mapRest!11070 mapKey!11070 mapValue!11070))))

(declare-fun mapIsEmpty!11070 () Bool)

(assert (=> mapIsEmpty!11070 mapRes!11070))

(declare-fun condMapEmpty!11070 () Bool)

(declare-fun mapDefault!11070 () ValueCell!2909)

(assert (=> mapNonEmpty!11061 (= condMapEmpty!11070 (= mapRest!11061 ((as const (Array (_ BitVec 32) ValueCell!2909)) mapDefault!11070)))))

(declare-fun e!163659 () Bool)

(assert (=> mapNonEmpty!11061 (= tp!23204 (and e!163659 mapRes!11070))))

(declare-fun b!252395 () Bool)

(assert (=> b!252395 (= e!163659 tp_is_empty!6505)))

(declare-fun b!252394 () Bool)

(assert (=> b!252394 (= e!163660 tp_is_empty!6505)))

(assert (= (and mapNonEmpty!11061 condMapEmpty!11070) mapIsEmpty!11070))

(assert (= (and mapNonEmpty!11061 (not condMapEmpty!11070)) mapNonEmpty!11070))

(assert (= (and mapNonEmpty!11070 ((_ is ValueCellFull!2909) mapValue!11070)) b!252394))

(assert (= (and mapNonEmpty!11061 ((_ is ValueCellFull!2909) mapDefault!11070)) b!252395))

(declare-fun m!268709 () Bool)

(assert (=> mapNonEmpty!11070 m!268709))

(declare-fun b_lambda!8139 () Bool)

(assert (= b_lambda!8137 (or (and b!252044 b_free!6643) b_lambda!8139)))

(check-sat (not d!61399) (not b!252377) (not b_next!6643) (not b!252203) (not b!252256) (not bm!23755) (not b!252192) (not b!252321) (not b!252254) (not b!252292) (not b!252246) (not b!252289) (not b!252312) (not b!252193) (not b!252290) (not d!61391) (not b!252318) (not b!252336) (not d!61377) (not bm!23749) (not bm!23746) (not d!61389) (not b!252304) (not b!252194) (not bm!23754) (not bm!23735) (not b!252310) (not bm!23741) (not d!61407) (not b!252249) b_and!13697 (not bm!23737) (not d!61373) (not mapNonEmpty!11070) (not d!61367) (not b!252250) (not d!61397) (not bm!23732) (not bm!23738) (not b!252201) (not d!61401) (not b_lambda!8139) (not b!252324) (not bm!23745) (not b!252337) (not b!252280) (not b!252335) (not b!252308) (not b!252257) (not b!252255) (not b!252386) (not b!252261) (not bm!23744) (not d!61371) (not b!252278) tp_is_empty!6505)
(check-sat b_and!13697 (not b_next!6643))
