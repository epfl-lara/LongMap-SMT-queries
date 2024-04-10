; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19194 () Bool)

(assert start!19194)

(declare-fun b!188857 () Bool)

(declare-fun b_free!4635 () Bool)

(declare-fun b_next!4635 () Bool)

(assert (=> b!188857 (= b_free!4635 (not b_next!4635))))

(declare-fun tp!16732 () Bool)

(declare-fun b_and!11269 () Bool)

(assert (=> b!188857 (= tp!16732 b_and!11269)))

(declare-fun b!188846 () Bool)

(declare-fun res!89279 () Bool)

(declare-fun e!124285 () Bool)

(assert (=> b!188846 (=> (not res!89279) (not e!124285))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!188846 (= res!89279 (not (= key!828 (bvneg key!828))))))

(declare-fun b!188847 () Bool)

(declare-fun res!89281 () Bool)

(declare-fun e!124291 () Bool)

(assert (=> b!188847 (=> (not res!89281) (not e!124291))))

(declare-datatypes ((V!5523 0))(
  ( (V!5524 (val!2248 Int)) )
))
(declare-datatypes ((ValueCell!1860 0))(
  ( (ValueCellFull!1860 (v!4167 V!5523)) (EmptyCell!1860) )
))
(declare-datatypes ((array!8039 0))(
  ( (array!8040 (arr!3791 (Array (_ BitVec 32) (_ BitVec 64))) (size!4111 (_ BitVec 32))) )
))
(declare-datatypes ((array!8041 0))(
  ( (array!8042 (arr!3792 (Array (_ BitVec 32) ValueCell!1860)) (size!4112 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2628 0))(
  ( (LongMapFixedSize!2629 (defaultEntry!3852 Int) (mask!9027 (_ BitVec 32)) (extraKeys!3589 (_ BitVec 32)) (zeroValue!3693 V!5523) (minValue!3693 V!5523) (_size!1363 (_ BitVec 32)) (_keys!5815 array!8039) (_values!3835 array!8041) (_vacant!1363 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2628)

(assert (=> b!188847 (= res!89281 (and (= (size!4112 (_values!3835 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9027 thiss!1248))) (= (size!4111 (_keys!5815 thiss!1248)) (size!4112 (_values!3835 thiss!1248))) (bvsge (mask!9027 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3589 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3589 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!188848 () Bool)

(declare-fun e!124292 () Bool)

(declare-fun e!124286 () Bool)

(declare-fun mapRes!7600 () Bool)

(assert (=> b!188848 (= e!124292 (and e!124286 mapRes!7600))))

(declare-fun condMapEmpty!7600 () Bool)

(declare-fun mapDefault!7600 () ValueCell!1860)

(assert (=> b!188848 (= condMapEmpty!7600 (= (arr!3792 (_values!3835 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1860)) mapDefault!7600)))))

(declare-fun res!89277 () Bool)

(assert (=> start!19194 (=> (not res!89277) (not e!124285))))

(declare-fun valid!1081 (LongMapFixedSize!2628) Bool)

(assert (=> start!19194 (= res!89277 (valid!1081 thiss!1248))))

(assert (=> start!19194 e!124285))

(declare-fun e!124290 () Bool)

(assert (=> start!19194 e!124290))

(assert (=> start!19194 true))

(declare-fun b!188849 () Bool)

(declare-fun tp_is_empty!4407 () Bool)

(assert (=> b!188849 (= e!124286 tp_is_empty!4407)))

(declare-fun b!188850 () Bool)

(declare-datatypes ((Unit!5694 0))(
  ( (Unit!5695) )
))
(declare-fun e!124288 () Unit!5694)

(declare-fun Unit!5696 () Unit!5694)

(assert (=> b!188850 (= e!124288 Unit!5696)))

(declare-fun lt!93471 () Unit!5694)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!163 (array!8039 array!8041 (_ BitVec 32) (_ BitVec 32) V!5523 V!5523 (_ BitVec 64) Int) Unit!5694)

(assert (=> b!188850 (= lt!93471 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!163 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) key!828 (defaultEntry!3852 thiss!1248)))))

(assert (=> b!188850 false))

(declare-fun b!188851 () Bool)

(declare-fun res!89278 () Bool)

(assert (=> b!188851 (=> (not res!89278) (not e!124291))))

(declare-datatypes ((List!2397 0))(
  ( (Nil!2394) (Cons!2393 (h!3030 (_ BitVec 64)) (t!7297 List!2397)) )
))
(declare-fun arrayNoDuplicates!0 (array!8039 (_ BitVec 32) List!2397) Bool)

(assert (=> b!188851 (= res!89278 (arrayNoDuplicates!0 (_keys!5815 thiss!1248) #b00000000000000000000000000000000 Nil!2394))))

(declare-fun b!188852 () Bool)

(declare-fun lt!93473 () Unit!5694)

(assert (=> b!188852 (= e!124288 lt!93473)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!159 (array!8039 array!8041 (_ BitVec 32) (_ BitVec 32) V!5523 V!5523 (_ BitVec 64) Int) Unit!5694)

(assert (=> b!188852 (= lt!93473 (lemmaInListMapThenSeekEntryOrOpenFindsIt!159 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) key!828 (defaultEntry!3852 thiss!1248)))))

(declare-fun res!89275 () Bool)

(declare-datatypes ((SeekEntryResult!657 0))(
  ( (MissingZero!657 (index!4798 (_ BitVec 32))) (Found!657 (index!4799 (_ BitVec 32))) (Intermediate!657 (undefined!1469 Bool) (index!4800 (_ BitVec 32)) (x!20379 (_ BitVec 32))) (Undefined!657) (MissingVacant!657 (index!4801 (_ BitVec 32))) )
))
(declare-fun lt!93472 () SeekEntryResult!657)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188852 (= res!89275 (inRange!0 (index!4799 lt!93472) (mask!9027 thiss!1248)))))

(declare-fun e!124293 () Bool)

(assert (=> b!188852 (=> (not res!89275) (not e!124293))))

(assert (=> b!188852 e!124293))

(declare-fun mapIsEmpty!7600 () Bool)

(assert (=> mapIsEmpty!7600 mapRes!7600))

(declare-fun b!188853 () Bool)

(assert (=> b!188853 (= e!124293 (= (select (arr!3791 (_keys!5815 thiss!1248)) (index!4799 lt!93472)) key!828))))

(declare-fun b!188854 () Bool)

(declare-fun e!124289 () Bool)

(assert (=> b!188854 (= e!124289 tp_is_empty!4407)))

(declare-fun b!188855 () Bool)

(assert (=> b!188855 (= e!124291 (or (bvslt (index!4799 lt!93472) #b00000000000000000000000000000000) (bvsge (index!4799 lt!93472) (size!4111 (_keys!5815 thiss!1248)))))))

(declare-fun b!188856 () Bool)

(declare-fun e!124284 () Bool)

(assert (=> b!188856 (= e!124284 e!124291)))

(declare-fun res!89274 () Bool)

(assert (=> b!188856 (=> (not res!89274) (not e!124291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188856 (= res!89274 (validMask!0 (mask!9027 thiss!1248)))))

(declare-fun lt!93470 () Unit!5694)

(assert (=> b!188856 (= lt!93470 e!124288)))

(declare-fun c!33941 () Bool)

(declare-datatypes ((tuple2!3498 0))(
  ( (tuple2!3499 (_1!1760 (_ BitVec 64)) (_2!1760 V!5523)) )
))
(declare-datatypes ((List!2398 0))(
  ( (Nil!2395) (Cons!2394 (h!3031 tuple2!3498) (t!7298 List!2398)) )
))
(declare-datatypes ((ListLongMap!2415 0))(
  ( (ListLongMap!2416 (toList!1223 List!2398)) )
))
(declare-fun contains!1328 (ListLongMap!2415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!871 (array!8039 array!8041 (_ BitVec 32) (_ BitVec 32) V!5523 V!5523 (_ BitVec 32) Int) ListLongMap!2415)

(assert (=> b!188856 (= c!33941 (contains!1328 (getCurrentListMap!871 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7600 () Bool)

(declare-fun tp!16731 () Bool)

(assert (=> mapNonEmpty!7600 (= mapRes!7600 (and tp!16731 e!124289))))

(declare-fun mapValue!7600 () ValueCell!1860)

(declare-fun mapRest!7600 () (Array (_ BitVec 32) ValueCell!1860))

(declare-fun mapKey!7600 () (_ BitVec 32))

(assert (=> mapNonEmpty!7600 (= (arr!3792 (_values!3835 thiss!1248)) (store mapRest!7600 mapKey!7600 mapValue!7600))))

(declare-fun array_inv!2455 (array!8039) Bool)

(declare-fun array_inv!2456 (array!8041) Bool)

(assert (=> b!188857 (= e!124290 (and tp!16732 tp_is_empty!4407 (array_inv!2455 (_keys!5815 thiss!1248)) (array_inv!2456 (_values!3835 thiss!1248)) e!124292))))

(declare-fun b!188858 () Bool)

(assert (=> b!188858 (= e!124285 e!124284)))

(declare-fun res!89280 () Bool)

(assert (=> b!188858 (=> (not res!89280) (not e!124284))))

(get-info :version)

(assert (=> b!188858 (= res!89280 (and (not ((_ is Undefined!657) lt!93472)) (not ((_ is MissingVacant!657) lt!93472)) (not ((_ is MissingZero!657) lt!93472)) ((_ is Found!657) lt!93472)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8039 (_ BitVec 32)) SeekEntryResult!657)

(assert (=> b!188858 (= lt!93472 (seekEntryOrOpen!0 key!828 (_keys!5815 thiss!1248) (mask!9027 thiss!1248)))))

(declare-fun b!188859 () Bool)

(declare-fun res!89276 () Bool)

(assert (=> b!188859 (=> (not res!89276) (not e!124291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8039 (_ BitVec 32)) Bool)

(assert (=> b!188859 (= res!89276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5815 thiss!1248) (mask!9027 thiss!1248)))))

(assert (= (and start!19194 res!89277) b!188846))

(assert (= (and b!188846 res!89279) b!188858))

(assert (= (and b!188858 res!89280) b!188856))

(assert (= (and b!188856 c!33941) b!188852))

(assert (= (and b!188856 (not c!33941)) b!188850))

(assert (= (and b!188852 res!89275) b!188853))

(assert (= (and b!188856 res!89274) b!188847))

(assert (= (and b!188847 res!89281) b!188859))

(assert (= (and b!188859 res!89276) b!188851))

(assert (= (and b!188851 res!89278) b!188855))

(assert (= (and b!188848 condMapEmpty!7600) mapIsEmpty!7600))

(assert (= (and b!188848 (not condMapEmpty!7600)) mapNonEmpty!7600))

(assert (= (and mapNonEmpty!7600 ((_ is ValueCellFull!1860) mapValue!7600)) b!188854))

(assert (= (and b!188848 ((_ is ValueCellFull!1860) mapDefault!7600)) b!188849))

(assert (= b!188857 b!188848))

(assert (= start!19194 b!188857))

(declare-fun m!215377 () Bool)

(assert (=> b!188859 m!215377))

(declare-fun m!215379 () Bool)

(assert (=> b!188851 m!215379))

(declare-fun m!215381 () Bool)

(assert (=> mapNonEmpty!7600 m!215381))

(declare-fun m!215383 () Bool)

(assert (=> start!19194 m!215383))

(declare-fun m!215385 () Bool)

(assert (=> b!188857 m!215385))

(declare-fun m!215387 () Bool)

(assert (=> b!188857 m!215387))

(declare-fun m!215389 () Bool)

(assert (=> b!188853 m!215389))

(declare-fun m!215391 () Bool)

(assert (=> b!188856 m!215391))

(declare-fun m!215393 () Bool)

(assert (=> b!188856 m!215393))

(assert (=> b!188856 m!215393))

(declare-fun m!215395 () Bool)

(assert (=> b!188856 m!215395))

(declare-fun m!215397 () Bool)

(assert (=> b!188858 m!215397))

(declare-fun m!215399 () Bool)

(assert (=> b!188852 m!215399))

(declare-fun m!215401 () Bool)

(assert (=> b!188852 m!215401))

(declare-fun m!215403 () Bool)

(assert (=> b!188850 m!215403))

(check-sat tp_is_empty!4407 (not b!188852) (not b!188850) (not b!188857) (not b!188856) (not b_next!4635) b_and!11269 (not b!188858) (not b!188859) (not b!188851) (not mapNonEmpty!7600) (not start!19194))
(check-sat b_and!11269 (not b_next!4635))
(get-model)

(declare-fun d!55661 () Bool)

(assert (=> d!55661 (= (array_inv!2455 (_keys!5815 thiss!1248)) (bvsge (size!4111 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188857 d!55661))

(declare-fun d!55663 () Bool)

(assert (=> d!55663 (= (array_inv!2456 (_values!3835 thiss!1248)) (bvsge (size!4112 (_values!3835 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188857 d!55663))

(declare-fun e!124330 () SeekEntryResult!657)

(declare-fun lt!93492 () SeekEntryResult!657)

(declare-fun b!188914 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8039 (_ BitVec 32)) SeekEntryResult!657)

(assert (=> b!188914 (= e!124330 (seekKeyOrZeroReturnVacant!0 (x!20379 lt!93492) (index!4800 lt!93492) (index!4800 lt!93492) key!828 (_keys!5815 thiss!1248) (mask!9027 thiss!1248)))))

(declare-fun b!188915 () Bool)

(declare-fun e!124332 () SeekEntryResult!657)

(assert (=> b!188915 (= e!124332 Undefined!657)))

(declare-fun b!188916 () Bool)

(assert (=> b!188916 (= e!124330 (MissingZero!657 (index!4800 lt!93492)))))

(declare-fun b!188917 () Bool)

(declare-fun e!124331 () SeekEntryResult!657)

(assert (=> b!188917 (= e!124331 (Found!657 (index!4800 lt!93492)))))

(declare-fun b!188919 () Bool)

(assert (=> b!188919 (= e!124332 e!124331)))

(declare-fun lt!93493 () (_ BitVec 64))

(assert (=> b!188919 (= lt!93493 (select (arr!3791 (_keys!5815 thiss!1248)) (index!4800 lt!93492)))))

(declare-fun c!33952 () Bool)

(assert (=> b!188919 (= c!33952 (= lt!93493 key!828))))

(declare-fun b!188918 () Bool)

(declare-fun c!33951 () Bool)

(assert (=> b!188918 (= c!33951 (= lt!93493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188918 (= e!124331 e!124330)))

(declare-fun d!55665 () Bool)

(declare-fun lt!93494 () SeekEntryResult!657)

(assert (=> d!55665 (and (or ((_ is Undefined!657) lt!93494) (not ((_ is Found!657) lt!93494)) (and (bvsge (index!4799 lt!93494) #b00000000000000000000000000000000) (bvslt (index!4799 lt!93494) (size!4111 (_keys!5815 thiss!1248))))) (or ((_ is Undefined!657) lt!93494) ((_ is Found!657) lt!93494) (not ((_ is MissingZero!657) lt!93494)) (and (bvsge (index!4798 lt!93494) #b00000000000000000000000000000000) (bvslt (index!4798 lt!93494) (size!4111 (_keys!5815 thiss!1248))))) (or ((_ is Undefined!657) lt!93494) ((_ is Found!657) lt!93494) ((_ is MissingZero!657) lt!93494) (not ((_ is MissingVacant!657) lt!93494)) (and (bvsge (index!4801 lt!93494) #b00000000000000000000000000000000) (bvslt (index!4801 lt!93494) (size!4111 (_keys!5815 thiss!1248))))) (or ((_ is Undefined!657) lt!93494) (ite ((_ is Found!657) lt!93494) (= (select (arr!3791 (_keys!5815 thiss!1248)) (index!4799 lt!93494)) key!828) (ite ((_ is MissingZero!657) lt!93494) (= (select (arr!3791 (_keys!5815 thiss!1248)) (index!4798 lt!93494)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!657) lt!93494) (= (select (arr!3791 (_keys!5815 thiss!1248)) (index!4801 lt!93494)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55665 (= lt!93494 e!124332)))

(declare-fun c!33953 () Bool)

(assert (=> d!55665 (= c!33953 (and ((_ is Intermediate!657) lt!93492) (undefined!1469 lt!93492)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8039 (_ BitVec 32)) SeekEntryResult!657)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55665 (= lt!93492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9027 thiss!1248)) key!828 (_keys!5815 thiss!1248) (mask!9027 thiss!1248)))))

(assert (=> d!55665 (validMask!0 (mask!9027 thiss!1248))))

(assert (=> d!55665 (= (seekEntryOrOpen!0 key!828 (_keys!5815 thiss!1248) (mask!9027 thiss!1248)) lt!93494)))

(assert (= (and d!55665 c!33953) b!188915))

(assert (= (and d!55665 (not c!33953)) b!188919))

(assert (= (and b!188919 c!33952) b!188917))

(assert (= (and b!188919 (not c!33952)) b!188918))

(assert (= (and b!188918 c!33951) b!188916))

(assert (= (and b!188918 (not c!33951)) b!188914))

(declare-fun m!215433 () Bool)

(assert (=> b!188914 m!215433))

(declare-fun m!215435 () Bool)

(assert (=> b!188919 m!215435))

(declare-fun m!215437 () Bool)

(assert (=> d!55665 m!215437))

(declare-fun m!215439 () Bool)

(assert (=> d!55665 m!215439))

(assert (=> d!55665 m!215437))

(declare-fun m!215441 () Bool)

(assert (=> d!55665 m!215441))

(declare-fun m!215443 () Bool)

(assert (=> d!55665 m!215443))

(assert (=> d!55665 m!215391))

(declare-fun m!215445 () Bool)

(assert (=> d!55665 m!215445))

(assert (=> b!188858 d!55665))

(declare-fun bm!19038 () Bool)

(declare-fun call!19041 () Bool)

(declare-fun arrayContainsKey!0 (array!8039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19038 (= call!19041 (arrayContainsKey!0 (_keys!5815 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!188936 () Bool)

(declare-fun e!124343 () Bool)

(assert (=> b!188936 (= e!124343 (not call!19041))))

(declare-fun b!188937 () Bool)

(declare-fun lt!93499 () SeekEntryResult!657)

(assert (=> b!188937 (and (bvsge (index!4798 lt!93499) #b00000000000000000000000000000000) (bvslt (index!4798 lt!93499) (size!4111 (_keys!5815 thiss!1248))))))

(declare-fun res!89315 () Bool)

(assert (=> b!188937 (= res!89315 (= (select (arr!3791 (_keys!5815 thiss!1248)) (index!4798 lt!93499)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188937 (=> (not res!89315) (not e!124343))))

(declare-fun call!19042 () Bool)

(declare-fun c!33959 () Bool)

(declare-fun bm!19039 () Bool)

(assert (=> bm!19039 (= call!19042 (inRange!0 (ite c!33959 (index!4798 lt!93499) (index!4801 lt!93499)) (mask!9027 thiss!1248)))))

(declare-fun b!188938 () Bool)

(declare-fun res!89314 () Bool)

(declare-fun e!124342 () Bool)

(assert (=> b!188938 (=> (not res!89314) (not e!124342))))

(assert (=> b!188938 (= res!89314 call!19042)))

(declare-fun e!124344 () Bool)

(assert (=> b!188938 (= e!124344 e!124342)))

(declare-fun b!188939 () Bool)

(declare-fun e!124341 () Bool)

(assert (=> b!188939 (= e!124341 e!124343)))

(declare-fun res!89317 () Bool)

(assert (=> b!188939 (= res!89317 call!19042)))

(assert (=> b!188939 (=> (not res!89317) (not e!124343))))

(declare-fun d!55667 () Bool)

(assert (=> d!55667 e!124341))

(assert (=> d!55667 (= c!33959 ((_ is MissingZero!657) lt!93499))))

(assert (=> d!55667 (= lt!93499 (seekEntryOrOpen!0 key!828 (_keys!5815 thiss!1248) (mask!9027 thiss!1248)))))

(declare-fun lt!93500 () Unit!5694)

(declare-fun choose!1010 (array!8039 array!8041 (_ BitVec 32) (_ BitVec 32) V!5523 V!5523 (_ BitVec 64) Int) Unit!5694)

(assert (=> d!55667 (= lt!93500 (choose!1010 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) key!828 (defaultEntry!3852 thiss!1248)))))

(assert (=> d!55667 (validMask!0 (mask!9027 thiss!1248))))

(assert (=> d!55667 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!163 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) key!828 (defaultEntry!3852 thiss!1248)) lt!93500)))

(declare-fun b!188940 () Bool)

(declare-fun res!89316 () Bool)

(assert (=> b!188940 (=> (not res!89316) (not e!124342))))

(assert (=> b!188940 (= res!89316 (= (select (arr!3791 (_keys!5815 thiss!1248)) (index!4801 lt!93499)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188940 (and (bvsge (index!4801 lt!93499) #b00000000000000000000000000000000) (bvslt (index!4801 lt!93499) (size!4111 (_keys!5815 thiss!1248))))))

(declare-fun b!188941 () Bool)

(assert (=> b!188941 (= e!124341 e!124344)))

(declare-fun c!33958 () Bool)

(assert (=> b!188941 (= c!33958 ((_ is MissingVacant!657) lt!93499))))

(declare-fun b!188942 () Bool)

(assert (=> b!188942 (= e!124344 ((_ is Undefined!657) lt!93499))))

(declare-fun b!188943 () Bool)

(assert (=> b!188943 (= e!124342 (not call!19041))))

(assert (= (and d!55667 c!33959) b!188939))

(assert (= (and d!55667 (not c!33959)) b!188941))

(assert (= (and b!188939 res!89317) b!188937))

(assert (= (and b!188937 res!89315) b!188936))

(assert (= (and b!188941 c!33958) b!188938))

(assert (= (and b!188941 (not c!33958)) b!188942))

(assert (= (and b!188938 res!89314) b!188940))

(assert (= (and b!188940 res!89316) b!188943))

(assert (= (or b!188939 b!188938) bm!19039))

(assert (= (or b!188936 b!188943) bm!19038))

(declare-fun m!215447 () Bool)

(assert (=> b!188937 m!215447))

(declare-fun m!215449 () Bool)

(assert (=> bm!19039 m!215449))

(assert (=> d!55667 m!215397))

(declare-fun m!215451 () Bool)

(assert (=> d!55667 m!215451))

(assert (=> d!55667 m!215391))

(declare-fun m!215453 () Bool)

(assert (=> bm!19038 m!215453))

(declare-fun m!215455 () Bool)

(assert (=> b!188940 m!215455))

(assert (=> b!188850 d!55667))

(declare-fun b!188952 () Bool)

(declare-fun e!124352 () Bool)

(declare-fun e!124353 () Bool)

(assert (=> b!188952 (= e!124352 e!124353)))

(declare-fun lt!93508 () (_ BitVec 64))

(assert (=> b!188952 (= lt!93508 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93507 () Unit!5694)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8039 (_ BitVec 64) (_ BitVec 32)) Unit!5694)

(assert (=> b!188952 (= lt!93507 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5815 thiss!1248) lt!93508 #b00000000000000000000000000000000))))

(assert (=> b!188952 (arrayContainsKey!0 (_keys!5815 thiss!1248) lt!93508 #b00000000000000000000000000000000)))

(declare-fun lt!93509 () Unit!5694)

(assert (=> b!188952 (= lt!93509 lt!93507)))

(declare-fun res!89322 () Bool)

(assert (=> b!188952 (= res!89322 (= (seekEntryOrOpen!0 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000) (_keys!5815 thiss!1248) (mask!9027 thiss!1248)) (Found!657 #b00000000000000000000000000000000)))))

(assert (=> b!188952 (=> (not res!89322) (not e!124353))))

(declare-fun b!188953 () Bool)

(declare-fun call!19045 () Bool)

(assert (=> b!188953 (= e!124353 call!19045)))

(declare-fun bm!19042 () Bool)

(assert (=> bm!19042 (= call!19045 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5815 thiss!1248) (mask!9027 thiss!1248)))))

(declare-fun d!55669 () Bool)

(declare-fun res!89323 () Bool)

(declare-fun e!124351 () Bool)

(assert (=> d!55669 (=> res!89323 e!124351)))

(assert (=> d!55669 (= res!89323 (bvsge #b00000000000000000000000000000000 (size!4111 (_keys!5815 thiss!1248))))))

(assert (=> d!55669 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5815 thiss!1248) (mask!9027 thiss!1248)) e!124351)))

(declare-fun b!188954 () Bool)

(assert (=> b!188954 (= e!124351 e!124352)))

(declare-fun c!33962 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!188954 (= c!33962 (validKeyInArray!0 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188955 () Bool)

(assert (=> b!188955 (= e!124352 call!19045)))

(assert (= (and d!55669 (not res!89323)) b!188954))

(assert (= (and b!188954 c!33962) b!188952))

(assert (= (and b!188954 (not c!33962)) b!188955))

(assert (= (and b!188952 res!89322) b!188953))

(assert (= (or b!188953 b!188955) bm!19042))

(declare-fun m!215457 () Bool)

(assert (=> b!188952 m!215457))

(declare-fun m!215459 () Bool)

(assert (=> b!188952 m!215459))

(declare-fun m!215461 () Bool)

(assert (=> b!188952 m!215461))

(assert (=> b!188952 m!215457))

(declare-fun m!215463 () Bool)

(assert (=> b!188952 m!215463))

(declare-fun m!215465 () Bool)

(assert (=> bm!19042 m!215465))

(assert (=> b!188954 m!215457))

(assert (=> b!188954 m!215457))

(declare-fun m!215467 () Bool)

(assert (=> b!188954 m!215467))

(assert (=> b!188859 d!55669))

(declare-fun d!55671 () Bool)

(declare-fun res!89330 () Bool)

(declare-fun e!124356 () Bool)

(assert (=> d!55671 (=> (not res!89330) (not e!124356))))

(declare-fun simpleValid!191 (LongMapFixedSize!2628) Bool)

(assert (=> d!55671 (= res!89330 (simpleValid!191 thiss!1248))))

(assert (=> d!55671 (= (valid!1081 thiss!1248) e!124356)))

(declare-fun b!188962 () Bool)

(declare-fun res!89331 () Bool)

(assert (=> b!188962 (=> (not res!89331) (not e!124356))))

(declare-fun arrayCountValidKeys!0 (array!8039 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!188962 (= res!89331 (= (arrayCountValidKeys!0 (_keys!5815 thiss!1248) #b00000000000000000000000000000000 (size!4111 (_keys!5815 thiss!1248))) (_size!1363 thiss!1248)))))

(declare-fun b!188963 () Bool)

(declare-fun res!89332 () Bool)

(assert (=> b!188963 (=> (not res!89332) (not e!124356))))

(assert (=> b!188963 (= res!89332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5815 thiss!1248) (mask!9027 thiss!1248)))))

(declare-fun b!188964 () Bool)

(assert (=> b!188964 (= e!124356 (arrayNoDuplicates!0 (_keys!5815 thiss!1248) #b00000000000000000000000000000000 Nil!2394))))

(assert (= (and d!55671 res!89330) b!188962))

(assert (= (and b!188962 res!89331) b!188963))

(assert (= (and b!188963 res!89332) b!188964))

(declare-fun m!215469 () Bool)

(assert (=> d!55671 m!215469))

(declare-fun m!215471 () Bool)

(assert (=> b!188962 m!215471))

(assert (=> b!188963 m!215377))

(assert (=> b!188964 m!215379))

(assert (=> start!19194 d!55671))

(declare-fun d!55673 () Bool)

(declare-fun res!89339 () Bool)

(declare-fun e!124368 () Bool)

(assert (=> d!55673 (=> res!89339 e!124368)))

(assert (=> d!55673 (= res!89339 (bvsge #b00000000000000000000000000000000 (size!4111 (_keys!5815 thiss!1248))))))

(assert (=> d!55673 (= (arrayNoDuplicates!0 (_keys!5815 thiss!1248) #b00000000000000000000000000000000 Nil!2394) e!124368)))

(declare-fun b!188975 () Bool)

(declare-fun e!124365 () Bool)

(declare-fun call!19048 () Bool)

(assert (=> b!188975 (= e!124365 call!19048)))

(declare-fun b!188976 () Bool)

(declare-fun e!124366 () Bool)

(assert (=> b!188976 (= e!124368 e!124366)))

(declare-fun res!89340 () Bool)

(assert (=> b!188976 (=> (not res!89340) (not e!124366))))

(declare-fun e!124367 () Bool)

(assert (=> b!188976 (= res!89340 (not e!124367))))

(declare-fun res!89341 () Bool)

(assert (=> b!188976 (=> (not res!89341) (not e!124367))))

(assert (=> b!188976 (= res!89341 (validKeyInArray!0 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188977 () Bool)

(declare-fun contains!1330 (List!2397 (_ BitVec 64)) Bool)

(assert (=> b!188977 (= e!124367 (contains!1330 Nil!2394 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188978 () Bool)

(assert (=> b!188978 (= e!124365 call!19048)))

(declare-fun b!188979 () Bool)

(assert (=> b!188979 (= e!124366 e!124365)))

(declare-fun c!33965 () Bool)

(assert (=> b!188979 (= c!33965 (validKeyInArray!0 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19045 () Bool)

(assert (=> bm!19045 (= call!19048 (arrayNoDuplicates!0 (_keys!5815 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33965 (Cons!2393 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000) Nil!2394) Nil!2394)))))

(assert (= (and d!55673 (not res!89339)) b!188976))

(assert (= (and b!188976 res!89341) b!188977))

(assert (= (and b!188976 res!89340) b!188979))

(assert (= (and b!188979 c!33965) b!188978))

(assert (= (and b!188979 (not c!33965)) b!188975))

(assert (= (or b!188978 b!188975) bm!19045))

(assert (=> b!188976 m!215457))

(assert (=> b!188976 m!215457))

(assert (=> b!188976 m!215467))

(assert (=> b!188977 m!215457))

(assert (=> b!188977 m!215457))

(declare-fun m!215473 () Bool)

(assert (=> b!188977 m!215473))

(assert (=> b!188979 m!215457))

(assert (=> b!188979 m!215457))

(assert (=> b!188979 m!215467))

(assert (=> bm!19045 m!215457))

(declare-fun m!215475 () Bool)

(assert (=> bm!19045 m!215475))

(assert (=> b!188851 d!55673))

(declare-fun d!55675 () Bool)

(declare-fun e!124371 () Bool)

(assert (=> d!55675 e!124371))

(declare-fun res!89347 () Bool)

(assert (=> d!55675 (=> (not res!89347) (not e!124371))))

(declare-fun lt!93514 () SeekEntryResult!657)

(assert (=> d!55675 (= res!89347 ((_ is Found!657) lt!93514))))

(assert (=> d!55675 (= lt!93514 (seekEntryOrOpen!0 key!828 (_keys!5815 thiss!1248) (mask!9027 thiss!1248)))))

(declare-fun lt!93515 () Unit!5694)

(declare-fun choose!1011 (array!8039 array!8041 (_ BitVec 32) (_ BitVec 32) V!5523 V!5523 (_ BitVec 64) Int) Unit!5694)

(assert (=> d!55675 (= lt!93515 (choose!1011 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) key!828 (defaultEntry!3852 thiss!1248)))))

(assert (=> d!55675 (validMask!0 (mask!9027 thiss!1248))))

(assert (=> d!55675 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!159 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) key!828 (defaultEntry!3852 thiss!1248)) lt!93515)))

(declare-fun b!188984 () Bool)

(declare-fun res!89346 () Bool)

(assert (=> b!188984 (=> (not res!89346) (not e!124371))))

(assert (=> b!188984 (= res!89346 (inRange!0 (index!4799 lt!93514) (mask!9027 thiss!1248)))))

(declare-fun b!188985 () Bool)

(assert (=> b!188985 (= e!124371 (= (select (arr!3791 (_keys!5815 thiss!1248)) (index!4799 lt!93514)) key!828))))

(assert (=> b!188985 (and (bvsge (index!4799 lt!93514) #b00000000000000000000000000000000) (bvslt (index!4799 lt!93514) (size!4111 (_keys!5815 thiss!1248))))))

(assert (= (and d!55675 res!89347) b!188984))

(assert (= (and b!188984 res!89346) b!188985))

(assert (=> d!55675 m!215397))

(declare-fun m!215477 () Bool)

(assert (=> d!55675 m!215477))

(assert (=> d!55675 m!215391))

(declare-fun m!215479 () Bool)

(assert (=> b!188984 m!215479))

(declare-fun m!215481 () Bool)

(assert (=> b!188985 m!215481))

(assert (=> b!188852 d!55675))

(declare-fun d!55677 () Bool)

(assert (=> d!55677 (= (inRange!0 (index!4799 lt!93472) (mask!9027 thiss!1248)) (and (bvsge (index!4799 lt!93472) #b00000000000000000000000000000000) (bvslt (index!4799 lt!93472) (bvadd (mask!9027 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!188852 d!55677))

(declare-fun d!55679 () Bool)

(assert (=> d!55679 (= (validMask!0 (mask!9027 thiss!1248)) (and (or (= (mask!9027 thiss!1248) #b00000000000000000000000000000111) (= (mask!9027 thiss!1248) #b00000000000000000000000000001111) (= (mask!9027 thiss!1248) #b00000000000000000000000000011111) (= (mask!9027 thiss!1248) #b00000000000000000000000000111111) (= (mask!9027 thiss!1248) #b00000000000000000000000001111111) (= (mask!9027 thiss!1248) #b00000000000000000000000011111111) (= (mask!9027 thiss!1248) #b00000000000000000000000111111111) (= (mask!9027 thiss!1248) #b00000000000000000000001111111111) (= (mask!9027 thiss!1248) #b00000000000000000000011111111111) (= (mask!9027 thiss!1248) #b00000000000000000000111111111111) (= (mask!9027 thiss!1248) #b00000000000000000001111111111111) (= (mask!9027 thiss!1248) #b00000000000000000011111111111111) (= (mask!9027 thiss!1248) #b00000000000000000111111111111111) (= (mask!9027 thiss!1248) #b00000000000000001111111111111111) (= (mask!9027 thiss!1248) #b00000000000000011111111111111111) (= (mask!9027 thiss!1248) #b00000000000000111111111111111111) (= (mask!9027 thiss!1248) #b00000000000001111111111111111111) (= (mask!9027 thiss!1248) #b00000000000011111111111111111111) (= (mask!9027 thiss!1248) #b00000000000111111111111111111111) (= (mask!9027 thiss!1248) #b00000000001111111111111111111111) (= (mask!9027 thiss!1248) #b00000000011111111111111111111111) (= (mask!9027 thiss!1248) #b00000000111111111111111111111111) (= (mask!9027 thiss!1248) #b00000001111111111111111111111111) (= (mask!9027 thiss!1248) #b00000011111111111111111111111111) (= (mask!9027 thiss!1248) #b00000111111111111111111111111111) (= (mask!9027 thiss!1248) #b00001111111111111111111111111111) (= (mask!9027 thiss!1248) #b00011111111111111111111111111111) (= (mask!9027 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9027 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!188856 d!55679))

(declare-fun d!55681 () Bool)

(declare-fun e!124376 () Bool)

(assert (=> d!55681 e!124376))

(declare-fun res!89350 () Bool)

(assert (=> d!55681 (=> res!89350 e!124376)))

(declare-fun lt!93526 () Bool)

(assert (=> d!55681 (= res!89350 (not lt!93526))))

(declare-fun lt!93524 () Bool)

(assert (=> d!55681 (= lt!93526 lt!93524)))

(declare-fun lt!93527 () Unit!5694)

(declare-fun e!124377 () Unit!5694)

(assert (=> d!55681 (= lt!93527 e!124377)))

(declare-fun c!33968 () Bool)

(assert (=> d!55681 (= c!33968 lt!93524)))

(declare-fun containsKey!236 (List!2398 (_ BitVec 64)) Bool)

(assert (=> d!55681 (= lt!93524 (containsKey!236 (toList!1223 (getCurrentListMap!871 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248))) key!828))))

(assert (=> d!55681 (= (contains!1328 (getCurrentListMap!871 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248)) key!828) lt!93526)))

(declare-fun b!188992 () Bool)

(declare-fun lt!93525 () Unit!5694)

(assert (=> b!188992 (= e!124377 lt!93525)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!184 (List!2398 (_ BitVec 64)) Unit!5694)

(assert (=> b!188992 (= lt!93525 (lemmaContainsKeyImpliesGetValueByKeyDefined!184 (toList!1223 (getCurrentListMap!871 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248))) key!828))))

(declare-datatypes ((Option!238 0))(
  ( (Some!237 (v!4169 V!5523)) (None!236) )
))
(declare-fun isDefined!185 (Option!238) Bool)

(declare-fun getValueByKey!232 (List!2398 (_ BitVec 64)) Option!238)

(assert (=> b!188992 (isDefined!185 (getValueByKey!232 (toList!1223 (getCurrentListMap!871 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248))) key!828))))

(declare-fun b!188993 () Bool)

(declare-fun Unit!5699 () Unit!5694)

(assert (=> b!188993 (= e!124377 Unit!5699)))

(declare-fun b!188994 () Bool)

(assert (=> b!188994 (= e!124376 (isDefined!185 (getValueByKey!232 (toList!1223 (getCurrentListMap!871 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248))) key!828)))))

(assert (= (and d!55681 c!33968) b!188992))

(assert (= (and d!55681 (not c!33968)) b!188993))

(assert (= (and d!55681 (not res!89350)) b!188994))

(declare-fun m!215483 () Bool)

(assert (=> d!55681 m!215483))

(declare-fun m!215485 () Bool)

(assert (=> b!188992 m!215485))

(declare-fun m!215487 () Bool)

(assert (=> b!188992 m!215487))

(assert (=> b!188992 m!215487))

(declare-fun m!215489 () Bool)

(assert (=> b!188992 m!215489))

(assert (=> b!188994 m!215487))

(assert (=> b!188994 m!215487))

(assert (=> b!188994 m!215489))

(assert (=> b!188856 d!55681))

(declare-fun b!189037 () Bool)

(declare-fun res!89370 () Bool)

(declare-fun e!124410 () Bool)

(assert (=> b!189037 (=> (not res!89370) (not e!124410))))

(declare-fun e!124416 () Bool)

(assert (=> b!189037 (= res!89370 e!124416)))

(declare-fun c!33984 () Bool)

(assert (=> b!189037 (= c!33984 (not (= (bvand (extraKeys!3589 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!189038 () Bool)

(declare-fun e!124409 () Bool)

(assert (=> b!189038 (= e!124409 (validKeyInArray!0 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189039 () Bool)

(declare-fun res!89372 () Bool)

(assert (=> b!189039 (=> (not res!89372) (not e!124410))))

(declare-fun e!124413 () Bool)

(assert (=> b!189039 (= res!89372 e!124413)))

(declare-fun res!89377 () Bool)

(assert (=> b!189039 (=> res!89377 e!124413)))

(assert (=> b!189039 (= res!89377 (not e!124409))))

(declare-fun res!89371 () Bool)

(assert (=> b!189039 (=> (not res!89371) (not e!124409))))

(assert (=> b!189039 (= res!89371 (bvslt #b00000000000000000000000000000000 (size!4111 (_keys!5815 thiss!1248))))))

(declare-fun b!189040 () Bool)

(declare-fun e!124404 () ListLongMap!2415)

(declare-fun call!19069 () ListLongMap!2415)

(declare-fun +!295 (ListLongMap!2415 tuple2!3498) ListLongMap!2415)

(assert (=> b!189040 (= e!124404 (+!295 call!19069 (tuple2!3499 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3693 thiss!1248))))))

(declare-fun b!189041 () Bool)

(declare-fun e!124407 () ListLongMap!2415)

(declare-fun call!19067 () ListLongMap!2415)

(assert (=> b!189041 (= e!124407 call!19067)))

(declare-fun bm!19060 () Bool)

(declare-fun call!19066 () ListLongMap!2415)

(assert (=> bm!19060 (= call!19066 call!19069)))

(declare-fun bm!19061 () Bool)

(declare-fun call!19068 () Bool)

(declare-fun lt!93588 () ListLongMap!2415)

(assert (=> bm!19061 (= call!19068 (contains!1328 lt!93588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189042 () Bool)

(declare-fun e!124414 () Bool)

(assert (=> b!189042 (= e!124410 e!124414)))

(declare-fun c!33982 () Bool)

(assert (=> b!189042 (= c!33982 (not (= (bvand (extraKeys!3589 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189043 () Bool)

(declare-fun e!124408 () Bool)

(declare-fun apply!175 (ListLongMap!2415 (_ BitVec 64)) V!5523)

(assert (=> b!189043 (= e!124408 (= (apply!175 lt!93588 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3693 thiss!1248)))))

(declare-fun c!33981 () Bool)

(declare-fun c!33985 () Bool)

(declare-fun call!19064 () ListLongMap!2415)

(declare-fun call!19065 () ListLongMap!2415)

(declare-fun bm!19062 () Bool)

(assert (=> bm!19062 (= call!19069 (+!295 (ite c!33981 call!19064 (ite c!33985 call!19065 call!19067)) (ite (or c!33981 c!33985) (tuple2!3499 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3693 thiss!1248)) (tuple2!3499 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3693 thiss!1248)))))))

(declare-fun b!189044 () Bool)

(declare-fun e!124412 () Bool)

(assert (=> b!189044 (= e!124416 e!124412)))

(declare-fun res!89375 () Bool)

(assert (=> b!189044 (= res!89375 call!19068)))

(assert (=> b!189044 (=> (not res!89375) (not e!124412))))

(declare-fun b!189045 () Bool)

(declare-fun c!33986 () Bool)

(assert (=> b!189045 (= c!33986 (and (not (= (bvand (extraKeys!3589 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3589 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!124406 () ListLongMap!2415)

(assert (=> b!189045 (= e!124406 e!124407)))

(declare-fun b!189046 () Bool)

(declare-fun e!124411 () Unit!5694)

(declare-fun Unit!5700 () Unit!5694)

(assert (=> b!189046 (= e!124411 Unit!5700)))

(declare-fun b!189047 () Bool)

(assert (=> b!189047 (= e!124414 e!124408)))

(declare-fun res!89369 () Bool)

(declare-fun call!19063 () Bool)

(assert (=> b!189047 (= res!89369 call!19063)))

(assert (=> b!189047 (=> (not res!89369) (not e!124408))))

(declare-fun b!189048 () Bool)

(declare-fun e!124415 () Bool)

(assert (=> b!189048 (= e!124413 e!124415)))

(declare-fun res!89374 () Bool)

(assert (=> b!189048 (=> (not res!89374) (not e!124415))))

(assert (=> b!189048 (= res!89374 (contains!1328 lt!93588 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189048 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4111 (_keys!5815 thiss!1248))))))

(declare-fun bm!19063 () Bool)

(assert (=> bm!19063 (= call!19067 call!19065)))

(declare-fun b!189049 () Bool)

(declare-fun e!124405 () Bool)

(assert (=> b!189049 (= e!124405 (validKeyInArray!0 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189050 () Bool)

(assert (=> b!189050 (= e!124412 (= (apply!175 lt!93588 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3693 thiss!1248)))))

(declare-fun b!189051 () Bool)

(declare-fun get!2184 (ValueCell!1860 V!5523) V!5523)

(declare-fun dynLambda!518 (Int (_ BitVec 64)) V!5523)

(assert (=> b!189051 (= e!124415 (= (apply!175 lt!93588 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000)) (get!2184 (select (arr!3792 (_values!3835 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!518 (defaultEntry!3852 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4112 (_values!3835 thiss!1248))))))

(assert (=> b!189051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4111 (_keys!5815 thiss!1248))))))

(declare-fun b!189052 () Bool)

(assert (=> b!189052 (= e!124416 (not call!19068))))

(declare-fun bm!19064 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!208 (array!8039 array!8041 (_ BitVec 32) (_ BitVec 32) V!5523 V!5523 (_ BitVec 32) Int) ListLongMap!2415)

(assert (=> bm!19064 (= call!19064 (getCurrentListMapNoExtraKeys!208 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248)))))

(declare-fun b!189053 () Bool)

(assert (=> b!189053 (= e!124404 e!124406)))

(assert (=> b!189053 (= c!33985 (and (not (= (bvand (extraKeys!3589 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3589 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189054 () Bool)

(assert (=> b!189054 (= e!124406 call!19066)))

(declare-fun bm!19065 () Bool)

(assert (=> bm!19065 (= call!19065 call!19064)))

(declare-fun d!55683 () Bool)

(assert (=> d!55683 e!124410))

(declare-fun res!89373 () Bool)

(assert (=> d!55683 (=> (not res!89373) (not e!124410))))

(assert (=> d!55683 (= res!89373 (or (bvsge #b00000000000000000000000000000000 (size!4111 (_keys!5815 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4111 (_keys!5815 thiss!1248))))))))

(declare-fun lt!93586 () ListLongMap!2415)

(assert (=> d!55683 (= lt!93588 lt!93586)))

(declare-fun lt!93578 () Unit!5694)

(assert (=> d!55683 (= lt!93578 e!124411)))

(declare-fun c!33983 () Bool)

(assert (=> d!55683 (= c!33983 e!124405)))

(declare-fun res!89376 () Bool)

(assert (=> d!55683 (=> (not res!89376) (not e!124405))))

(assert (=> d!55683 (= res!89376 (bvslt #b00000000000000000000000000000000 (size!4111 (_keys!5815 thiss!1248))))))

(assert (=> d!55683 (= lt!93586 e!124404)))

(assert (=> d!55683 (= c!33981 (and (not (= (bvand (extraKeys!3589 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3589 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55683 (validMask!0 (mask!9027 thiss!1248))))

(assert (=> d!55683 (= (getCurrentListMap!871 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248)) lt!93588)))

(declare-fun b!189055 () Bool)

(declare-fun lt!93575 () Unit!5694)

(assert (=> b!189055 (= e!124411 lt!93575)))

(declare-fun lt!93587 () ListLongMap!2415)

(assert (=> b!189055 (= lt!93587 (getCurrentListMapNoExtraKeys!208 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248)))))

(declare-fun lt!93579 () (_ BitVec 64))

(assert (=> b!189055 (= lt!93579 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93585 () (_ BitVec 64))

(assert (=> b!189055 (= lt!93585 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93592 () Unit!5694)

(declare-fun addStillContains!151 (ListLongMap!2415 (_ BitVec 64) V!5523 (_ BitVec 64)) Unit!5694)

(assert (=> b!189055 (= lt!93592 (addStillContains!151 lt!93587 lt!93579 (zeroValue!3693 thiss!1248) lt!93585))))

(assert (=> b!189055 (contains!1328 (+!295 lt!93587 (tuple2!3499 lt!93579 (zeroValue!3693 thiss!1248))) lt!93585)))

(declare-fun lt!93577 () Unit!5694)

(assert (=> b!189055 (= lt!93577 lt!93592)))

(declare-fun lt!93572 () ListLongMap!2415)

(assert (=> b!189055 (= lt!93572 (getCurrentListMapNoExtraKeys!208 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248)))))

(declare-fun lt!93576 () (_ BitVec 64))

(assert (=> b!189055 (= lt!93576 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93589 () (_ BitVec 64))

(assert (=> b!189055 (= lt!93589 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93590 () Unit!5694)

(declare-fun addApplyDifferent!151 (ListLongMap!2415 (_ BitVec 64) V!5523 (_ BitVec 64)) Unit!5694)

(assert (=> b!189055 (= lt!93590 (addApplyDifferent!151 lt!93572 lt!93576 (minValue!3693 thiss!1248) lt!93589))))

(assert (=> b!189055 (= (apply!175 (+!295 lt!93572 (tuple2!3499 lt!93576 (minValue!3693 thiss!1248))) lt!93589) (apply!175 lt!93572 lt!93589))))

(declare-fun lt!93573 () Unit!5694)

(assert (=> b!189055 (= lt!93573 lt!93590)))

(declare-fun lt!93581 () ListLongMap!2415)

(assert (=> b!189055 (= lt!93581 (getCurrentListMapNoExtraKeys!208 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248)))))

(declare-fun lt!93582 () (_ BitVec 64))

(assert (=> b!189055 (= lt!93582 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93583 () (_ BitVec 64))

(assert (=> b!189055 (= lt!93583 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93574 () Unit!5694)

(assert (=> b!189055 (= lt!93574 (addApplyDifferent!151 lt!93581 lt!93582 (zeroValue!3693 thiss!1248) lt!93583))))

(assert (=> b!189055 (= (apply!175 (+!295 lt!93581 (tuple2!3499 lt!93582 (zeroValue!3693 thiss!1248))) lt!93583) (apply!175 lt!93581 lt!93583))))

(declare-fun lt!93591 () Unit!5694)

(assert (=> b!189055 (= lt!93591 lt!93574)))

(declare-fun lt!93584 () ListLongMap!2415)

(assert (=> b!189055 (= lt!93584 (getCurrentListMapNoExtraKeys!208 (_keys!5815 thiss!1248) (_values!3835 thiss!1248) (mask!9027 thiss!1248) (extraKeys!3589 thiss!1248) (zeroValue!3693 thiss!1248) (minValue!3693 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3852 thiss!1248)))))

(declare-fun lt!93593 () (_ BitVec 64))

(assert (=> b!189055 (= lt!93593 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93580 () (_ BitVec 64))

(assert (=> b!189055 (= lt!93580 (select (arr!3791 (_keys!5815 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189055 (= lt!93575 (addApplyDifferent!151 lt!93584 lt!93593 (minValue!3693 thiss!1248) lt!93580))))

(assert (=> b!189055 (= (apply!175 (+!295 lt!93584 (tuple2!3499 lt!93593 (minValue!3693 thiss!1248))) lt!93580) (apply!175 lt!93584 lt!93580))))

(declare-fun b!189056 () Bool)

(assert (=> b!189056 (= e!124407 call!19066)))

(declare-fun bm!19066 () Bool)

(assert (=> bm!19066 (= call!19063 (contains!1328 lt!93588 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189057 () Bool)

(assert (=> b!189057 (= e!124414 (not call!19063))))

(assert (= (and d!55683 c!33981) b!189040))

(assert (= (and d!55683 (not c!33981)) b!189053))

(assert (= (and b!189053 c!33985) b!189054))

(assert (= (and b!189053 (not c!33985)) b!189045))

(assert (= (and b!189045 c!33986) b!189056))

(assert (= (and b!189045 (not c!33986)) b!189041))

(assert (= (or b!189056 b!189041) bm!19063))

(assert (= (or b!189054 bm!19063) bm!19065))

(assert (= (or b!189054 b!189056) bm!19060))

(assert (= (or b!189040 bm!19065) bm!19064))

(assert (= (or b!189040 bm!19060) bm!19062))

(assert (= (and d!55683 res!89376) b!189049))

(assert (= (and d!55683 c!33983) b!189055))

(assert (= (and d!55683 (not c!33983)) b!189046))

(assert (= (and d!55683 res!89373) b!189039))

(assert (= (and b!189039 res!89371) b!189038))

(assert (= (and b!189039 (not res!89377)) b!189048))

(assert (= (and b!189048 res!89374) b!189051))

(assert (= (and b!189039 res!89372) b!189037))

(assert (= (and b!189037 c!33984) b!189044))

(assert (= (and b!189037 (not c!33984)) b!189052))

(assert (= (and b!189044 res!89375) b!189050))

(assert (= (or b!189044 b!189052) bm!19061))

(assert (= (and b!189037 res!89370) b!189042))

(assert (= (and b!189042 c!33982) b!189047))

(assert (= (and b!189042 (not c!33982)) b!189057))

(assert (= (and b!189047 res!89369) b!189043))

(assert (= (or b!189047 b!189057) bm!19066))

(declare-fun b_lambda!7319 () Bool)

(assert (=> (not b_lambda!7319) (not b!189051)))

(declare-fun t!7302 () Bool)

(declare-fun tb!2861 () Bool)

(assert (=> (and b!188857 (= (defaultEntry!3852 thiss!1248) (defaultEntry!3852 thiss!1248)) t!7302) tb!2861))

(declare-fun result!4861 () Bool)

(assert (=> tb!2861 (= result!4861 tp_is_empty!4407)))

(assert (=> b!189051 t!7302))

(declare-fun b_and!11273 () Bool)

(assert (= b_and!11269 (and (=> t!7302 result!4861) b_and!11273)))

(declare-fun m!215491 () Bool)

(assert (=> bm!19062 m!215491))

(assert (=> b!189049 m!215457))

(assert (=> b!189049 m!215457))

(assert (=> b!189049 m!215467))

(declare-fun m!215493 () Bool)

(assert (=> b!189043 m!215493))

(assert (=> d!55683 m!215391))

(assert (=> b!189038 m!215457))

(assert (=> b!189038 m!215457))

(assert (=> b!189038 m!215467))

(declare-fun m!215495 () Bool)

(assert (=> b!189055 m!215495))

(declare-fun m!215497 () Bool)

(assert (=> b!189055 m!215497))

(declare-fun m!215499 () Bool)

(assert (=> b!189055 m!215499))

(declare-fun m!215501 () Bool)

(assert (=> b!189055 m!215501))

(declare-fun m!215503 () Bool)

(assert (=> b!189055 m!215503))

(assert (=> b!189055 m!215497))

(declare-fun m!215505 () Bool)

(assert (=> b!189055 m!215505))

(declare-fun m!215507 () Bool)

(assert (=> b!189055 m!215507))

(declare-fun m!215509 () Bool)

(assert (=> b!189055 m!215509))

(declare-fun m!215511 () Bool)

(assert (=> b!189055 m!215511))

(declare-fun m!215513 () Bool)

(assert (=> b!189055 m!215513))

(declare-fun m!215515 () Bool)

(assert (=> b!189055 m!215515))

(assert (=> b!189055 m!215513))

(assert (=> b!189055 m!215511))

(declare-fun m!215517 () Bool)

(assert (=> b!189055 m!215517))

(assert (=> b!189055 m!215457))

(declare-fun m!215519 () Bool)

(assert (=> b!189055 m!215519))

(declare-fun m!215521 () Bool)

(assert (=> b!189055 m!215521))

(declare-fun m!215523 () Bool)

(assert (=> b!189055 m!215523))

(assert (=> b!189055 m!215523))

(declare-fun m!215525 () Bool)

(assert (=> b!189055 m!215525))

(declare-fun m!215527 () Bool)

(assert (=> b!189040 m!215527))

(declare-fun m!215529 () Bool)

(assert (=> b!189051 m!215529))

(declare-fun m!215531 () Bool)

(assert (=> b!189051 m!215531))

(declare-fun m!215533 () Bool)

(assert (=> b!189051 m!215533))

(assert (=> b!189051 m!215457))

(assert (=> b!189051 m!215457))

(declare-fun m!215535 () Bool)

(assert (=> b!189051 m!215535))

(assert (=> b!189051 m!215529))

(assert (=> b!189051 m!215531))

(declare-fun m!215537 () Bool)

(assert (=> bm!19061 m!215537))

(declare-fun m!215539 () Bool)

(assert (=> bm!19066 m!215539))

(assert (=> bm!19064 m!215503))

(declare-fun m!215541 () Bool)

(assert (=> b!189050 m!215541))

(assert (=> b!189048 m!215457))

(assert (=> b!189048 m!215457))

(declare-fun m!215543 () Bool)

(assert (=> b!189048 m!215543))

(assert (=> b!188856 d!55683))

(declare-fun mapNonEmpty!7606 () Bool)

(declare-fun mapRes!7606 () Bool)

(declare-fun tp!16741 () Bool)

(declare-fun e!124422 () Bool)

(assert (=> mapNonEmpty!7606 (= mapRes!7606 (and tp!16741 e!124422))))

(declare-fun mapKey!7606 () (_ BitVec 32))

(declare-fun mapValue!7606 () ValueCell!1860)

(declare-fun mapRest!7606 () (Array (_ BitVec 32) ValueCell!1860))

(assert (=> mapNonEmpty!7606 (= mapRest!7600 (store mapRest!7606 mapKey!7606 mapValue!7606))))

(declare-fun b!189066 () Bool)

(assert (=> b!189066 (= e!124422 tp_is_empty!4407)))

(declare-fun b!189067 () Bool)

(declare-fun e!124421 () Bool)

(assert (=> b!189067 (= e!124421 tp_is_empty!4407)))

(declare-fun mapIsEmpty!7606 () Bool)

(assert (=> mapIsEmpty!7606 mapRes!7606))

(declare-fun condMapEmpty!7606 () Bool)

(declare-fun mapDefault!7606 () ValueCell!1860)

(assert (=> mapNonEmpty!7600 (= condMapEmpty!7606 (= mapRest!7600 ((as const (Array (_ BitVec 32) ValueCell!1860)) mapDefault!7606)))))

(assert (=> mapNonEmpty!7600 (= tp!16731 (and e!124421 mapRes!7606))))

(assert (= (and mapNonEmpty!7600 condMapEmpty!7606) mapIsEmpty!7606))

(assert (= (and mapNonEmpty!7600 (not condMapEmpty!7606)) mapNonEmpty!7606))

(assert (= (and mapNonEmpty!7606 ((_ is ValueCellFull!1860) mapValue!7606)) b!189066))

(assert (= (and mapNonEmpty!7600 ((_ is ValueCellFull!1860) mapDefault!7606)) b!189067))

(declare-fun m!215545 () Bool)

(assert (=> mapNonEmpty!7606 m!215545))

(declare-fun b_lambda!7321 () Bool)

(assert (= b_lambda!7319 (or (and b!188857 b_free!4635) b_lambda!7321)))

(check-sat (not b!189049) (not b!189051) (not d!55675) (not b!188954) (not b!188994) (not d!55681) (not b!189050) (not bm!19066) (not d!55683) (not b!188992) (not b!188963) (not b!189043) (not b!189055) (not bm!19062) (not b!189048) (not bm!19061) (not bm!19039) (not b!188976) (not b_lambda!7321) (not b!188964) tp_is_empty!4407 (not bm!19045) (not mapNonEmpty!7606) (not b!188979) (not bm!19042) (not b!188914) (not b!188962) (not b!189038) (not b!189040) (not b_next!4635) (not d!55667) (not d!55665) (not b!188952) b_and!11273 (not d!55671) (not bm!19064) (not b!188977) (not bm!19038) (not b!188984))
(check-sat b_and!11273 (not b_next!4635))
