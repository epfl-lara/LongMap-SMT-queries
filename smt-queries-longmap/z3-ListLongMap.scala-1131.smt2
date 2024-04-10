; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23254 () Bool)

(assert start!23254)

(declare-fun b!244305 () Bool)

(declare-fun b_free!6537 () Bool)

(declare-fun b_next!6537 () Bool)

(assert (=> b!244305 (= b_free!6537 (not b_next!6537))))

(declare-fun tp!22837 () Bool)

(declare-fun b_and!13521 () Bool)

(assert (=> b!244305 (= tp!22837 b_and!13521)))

(declare-fun b!244294 () Bool)

(declare-fun res!119808 () Bool)

(declare-fun e!158523 () Bool)

(assert (=> b!244294 (=> (not res!119808) (not e!158523))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8179 0))(
  ( (V!8180 (val!3244 Int)) )
))
(declare-datatypes ((ValueCell!2856 0))(
  ( (ValueCellFull!2856 (v!5293 V!8179)) (EmptyCell!2856) )
))
(declare-datatypes ((array!12091 0))(
  ( (array!12092 (arr!5740 (Array (_ BitVec 32) ValueCell!2856)) (size!6082 (_ BitVec 32))) )
))
(declare-datatypes ((array!12093 0))(
  ( (array!12094 (arr!5741 (Array (_ BitVec 32) (_ BitVec 64))) (size!6083 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3612 0))(
  ( (LongMapFixedSize!3613 (defaultEntry!4523 Int) (mask!10622 (_ BitVec 32)) (extraKeys!4260 (_ BitVec 32)) (zeroValue!4364 V!8179) (minValue!4364 V!8179) (_size!1855 (_ BitVec 32)) (_keys!6635 array!12093) (_values!4506 array!12091) (_vacant!1855 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3612)

(assert (=> b!244294 (= res!119808 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6083 (_keys!6635 thiss!1504)))))))

(declare-fun b!244295 () Bool)

(declare-datatypes ((Unit!7540 0))(
  ( (Unit!7541) )
))
(declare-fun e!158520 () Unit!7540)

(declare-fun Unit!7542 () Unit!7540)

(assert (=> b!244295 (= e!158520 Unit!7542)))

(declare-fun lt!122460 () Unit!7540)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!169 (array!12093 array!12091 (_ BitVec 32) (_ BitVec 32) V!8179 V!8179 (_ BitVec 64) (_ BitVec 32) Int) Unit!7540)

(assert (=> b!244295 (= lt!122460 (lemmaArrayContainsKeyThenInListMap!169 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)))))

(assert (=> b!244295 false))

(declare-fun b!244296 () Bool)

(declare-fun e!158521 () Unit!7540)

(declare-fun Unit!7543 () Unit!7540)

(assert (=> b!244296 (= e!158521 Unit!7543)))

(declare-fun lt!122459 () Unit!7540)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!366 (array!12093 array!12091 (_ BitVec 32) (_ BitVec 32) V!8179 V!8179 (_ BitVec 64) Int) Unit!7540)

(assert (=> b!244296 (= lt!122459 (lemmaInListMapThenSeekEntryOrOpenFindsIt!366 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) key!932 (defaultEntry!4523 thiss!1504)))))

(assert (=> b!244296 false))

(declare-fun b!244297 () Bool)

(declare-fun res!119813 () Bool)

(assert (=> b!244297 (=> (not res!119813) (not e!158523))))

(declare-datatypes ((List!3656 0))(
  ( (Nil!3653) (Cons!3652 (h!4309 (_ BitVec 64)) (t!8665 List!3656)) )
))
(declare-fun arrayNoDuplicates!0 (array!12093 (_ BitVec 32) List!3656) Bool)

(assert (=> b!244297 (= res!119813 (arrayNoDuplicates!0 (_keys!6635 thiss!1504) #b00000000000000000000000000000000 Nil!3653))))

(declare-fun b!244299 () Bool)

(declare-fun res!119809 () Bool)

(assert (=> b!244299 (=> (not res!119809) (not e!158523))))

(declare-fun noDuplicate!101 (List!3656) Bool)

(assert (=> b!244299 (= res!119809 (noDuplicate!101 Nil!3653))))

(declare-fun b!244300 () Bool)

(declare-fun e!158530 () Bool)

(declare-fun contains!1762 (List!3656 (_ BitVec 64)) Bool)

(assert (=> b!244300 (= e!158530 (not (contains!1762 Nil!3653 key!932)))))

(declare-fun b!244301 () Bool)

(declare-fun e!158534 () Bool)

(declare-fun e!158527 () Bool)

(assert (=> b!244301 (= e!158534 e!158527)))

(declare-fun res!119804 () Bool)

(declare-fun call!22785 () Bool)

(assert (=> b!244301 (= res!119804 call!22785)))

(assert (=> b!244301 (=> (not res!119804) (not e!158527))))

(declare-fun b!244302 () Bool)

(declare-fun e!158529 () Bool)

(assert (=> b!244302 (= e!158529 e!158530)))

(declare-fun res!119810 () Bool)

(assert (=> b!244302 (=> (not res!119810) (not e!158530))))

(assert (=> b!244302 (= res!119810 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!244303 () Bool)

(declare-fun e!158518 () Bool)

(declare-fun call!22784 () Bool)

(assert (=> b!244303 (= e!158518 (not call!22784))))

(declare-fun mapIsEmpty!10852 () Bool)

(declare-fun mapRes!10852 () Bool)

(assert (=> mapIsEmpty!10852 mapRes!10852))

(declare-fun b!244304 () Bool)

(declare-fun res!119814 () Bool)

(declare-fun e!158524 () Bool)

(assert (=> b!244304 (=> (not res!119814) (not e!158524))))

(assert (=> b!244304 (= res!119814 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!158531 () Bool)

(declare-fun e!158532 () Bool)

(declare-fun tp_is_empty!6399 () Bool)

(declare-fun array_inv!3795 (array!12093) Bool)

(declare-fun array_inv!3796 (array!12091) Bool)

(assert (=> b!244305 (= e!158532 (and tp!22837 tp_is_empty!6399 (array_inv!3795 (_keys!6635 thiss!1504)) (array_inv!3796 (_values!4506 thiss!1504)) e!158531))))

(declare-fun mapNonEmpty!10852 () Bool)

(declare-fun tp!22836 () Bool)

(declare-fun e!158522 () Bool)

(assert (=> mapNonEmpty!10852 (= mapRes!10852 (and tp!22836 e!158522))))

(declare-fun mapKey!10852 () (_ BitVec 32))

(declare-fun mapRest!10852 () (Array (_ BitVec 32) ValueCell!2856))

(declare-fun mapValue!10852 () ValueCell!2856)

(assert (=> mapNonEmpty!10852 (= (arr!5740 (_values!4506 thiss!1504)) (store mapRest!10852 mapKey!10852 mapValue!10852))))

(declare-fun b!244306 () Bool)

(declare-fun e!158526 () Bool)

(assert (=> b!244306 (= e!158526 tp_is_empty!6399)))

(declare-fun b!244307 () Bool)

(declare-fun res!119802 () Bool)

(declare-datatypes ((SeekEntryResult!1079 0))(
  ( (MissingZero!1079 (index!6486 (_ BitVec 32))) (Found!1079 (index!6487 (_ BitVec 32))) (Intermediate!1079 (undefined!1891 Bool) (index!6488 (_ BitVec 32)) (x!24365 (_ BitVec 32))) (Undefined!1079) (MissingVacant!1079 (index!6489 (_ BitVec 32))) )
))
(declare-fun lt!122456 () SeekEntryResult!1079)

(assert (=> b!244307 (= res!119802 (= (select (arr!5741 (_keys!6635 thiss!1504)) (index!6489 lt!122456)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244307 (=> (not res!119802) (not e!158527))))

(declare-fun b!244298 () Bool)

(declare-fun res!119806 () Bool)

(assert (=> b!244298 (=> (not res!119806) (not e!158518))))

(assert (=> b!244298 (= res!119806 (= (select (arr!5741 (_keys!6635 thiss!1504)) (index!6486 lt!122456)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!119800 () Bool)

(assert (=> start!23254 (=> (not res!119800) (not e!158524))))

(declare-fun valid!1415 (LongMapFixedSize!3612) Bool)

(assert (=> start!23254 (= res!119800 (valid!1415 thiss!1504))))

(assert (=> start!23254 e!158524))

(assert (=> start!23254 e!158532))

(assert (=> start!23254 true))

(declare-fun b!244308 () Bool)

(declare-fun res!119812 () Bool)

(assert (=> b!244308 (=> (not res!119812) (not e!158518))))

(assert (=> b!244308 (= res!119812 call!22785)))

(declare-fun e!158535 () Bool)

(assert (=> b!244308 (= e!158535 e!158518)))

(declare-fun b!244309 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244309 (= e!158523 (not (validKeyInArray!0 key!932)))))

(declare-fun b!244310 () Bool)

(declare-fun res!119805 () Bool)

(assert (=> b!244310 (=> (not res!119805) (not e!158523))))

(assert (=> b!244310 (= res!119805 (not (contains!1762 Nil!3653 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244311 () Bool)

(get-info :version)

(assert (=> b!244311 (= e!158534 ((_ is Undefined!1079) lt!122456))))

(declare-fun b!244312 () Bool)

(declare-fun e!158519 () Bool)

(assert (=> b!244312 (= e!158519 (contains!1762 Nil!3653 key!932))))

(declare-fun b!244313 () Bool)

(declare-fun e!158533 () Bool)

(declare-fun e!158528 () Bool)

(assert (=> b!244313 (= e!158533 e!158528)))

(declare-fun res!119816 () Bool)

(assert (=> b!244313 (=> (not res!119816) (not e!158528))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244313 (= res!119816 (inRange!0 index!297 (mask!10622 thiss!1504)))))

(declare-fun lt!122455 () Unit!7540)

(assert (=> b!244313 (= lt!122455 e!158521)))

(declare-fun c!40773 () Bool)

(declare-datatypes ((tuple2!4774 0))(
  ( (tuple2!4775 (_1!2398 (_ BitVec 64)) (_2!2398 V!8179)) )
))
(declare-datatypes ((List!3657 0))(
  ( (Nil!3654) (Cons!3653 (h!4310 tuple2!4774) (t!8666 List!3657)) )
))
(declare-datatypes ((ListLongMap!3687 0))(
  ( (ListLongMap!3688 (toList!1859 List!3657)) )
))
(declare-fun contains!1763 (ListLongMap!3687 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1387 (array!12093 array!12091 (_ BitVec 32) (_ BitVec 32) V!8179 V!8179 (_ BitVec 32) Int) ListLongMap!3687)

(assert (=> b!244313 (= c!40773 (contains!1763 (getCurrentListMap!1387 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)) key!932))))

(declare-fun b!244314 () Bool)

(declare-fun res!119811 () Bool)

(assert (=> b!244314 (=> (not res!119811) (not e!158523))))

(assert (=> b!244314 (= res!119811 (not (contains!1762 Nil!3653 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244315 () Bool)

(declare-fun Unit!7544 () Unit!7540)

(assert (=> b!244315 (= e!158520 Unit!7544)))

(declare-fun b!244316 () Bool)

(assert (=> b!244316 (= e!158531 (and e!158526 mapRes!10852))))

(declare-fun condMapEmpty!10852 () Bool)

(declare-fun mapDefault!10852 () ValueCell!2856)

(assert (=> b!244316 (= condMapEmpty!10852 (= (arr!5740 (_values!4506 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2856)) mapDefault!10852)))))

(declare-fun b!244317 () Bool)

(assert (=> b!244317 (= e!158528 e!158523)))

(declare-fun res!119815 () Bool)

(assert (=> b!244317 (=> (not res!119815) (not e!158523))))

(assert (=> b!244317 (= res!119815 (and (bvslt (size!6083 (_keys!6635 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6083 (_keys!6635 thiss!1504)))))))

(declare-fun lt!122457 () Unit!7540)

(assert (=> b!244317 (= lt!122457 e!158520)))

(declare-fun c!40775 () Bool)

(declare-fun arrayContainsKey!0 (array!12093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!244317 (= c!40775 (arrayContainsKey!0 (_keys!6635 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244318 () Bool)

(assert (=> b!244318 (= e!158527 (not call!22784))))

(declare-fun c!40774 () Bool)

(declare-fun bm!22781 () Bool)

(assert (=> bm!22781 (= call!22785 (inRange!0 (ite c!40774 (index!6486 lt!122456) (index!6489 lt!122456)) (mask!10622 thiss!1504)))))

(declare-fun b!244319 () Bool)

(declare-fun res!119803 () Bool)

(assert (=> b!244319 (=> (not res!119803) (not e!158523))))

(assert (=> b!244319 (= res!119803 e!158529)))

(declare-fun res!119801 () Bool)

(assert (=> b!244319 (=> res!119801 e!158529)))

(assert (=> b!244319 (= res!119801 e!158519)))

(declare-fun res!119799 () Bool)

(assert (=> b!244319 (=> (not res!119799) (not e!158519))))

(assert (=> b!244319 (= res!119799 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun bm!22782 () Bool)

(assert (=> bm!22782 (= call!22784 (arrayContainsKey!0 (_keys!6635 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244320 () Bool)

(declare-fun lt!122458 () Unit!7540)

(assert (=> b!244320 (= e!158521 lt!122458)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!372 (array!12093 array!12091 (_ BitVec 32) (_ BitVec 32) V!8179 V!8179 (_ BitVec 64) Int) Unit!7540)

(assert (=> b!244320 (= lt!122458 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!372 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) key!932 (defaultEntry!4523 thiss!1504)))))

(assert (=> b!244320 (= c!40774 ((_ is MissingZero!1079) lt!122456))))

(assert (=> b!244320 e!158535))

(declare-fun b!244321 () Bool)

(assert (=> b!244321 (= e!158524 e!158533)))

(declare-fun res!119807 () Bool)

(assert (=> b!244321 (=> (not res!119807) (not e!158533))))

(assert (=> b!244321 (= res!119807 (or (= lt!122456 (MissingZero!1079 index!297)) (= lt!122456 (MissingVacant!1079 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12093 (_ BitVec 32)) SeekEntryResult!1079)

(assert (=> b!244321 (= lt!122456 (seekEntryOrOpen!0 key!932 (_keys!6635 thiss!1504) (mask!10622 thiss!1504)))))

(declare-fun b!244322 () Bool)

(declare-fun c!40776 () Bool)

(assert (=> b!244322 (= c!40776 ((_ is MissingVacant!1079) lt!122456))))

(assert (=> b!244322 (= e!158535 e!158534)))

(declare-fun b!244323 () Bool)

(assert (=> b!244323 (= e!158522 tp_is_empty!6399)))

(assert (= (and start!23254 res!119800) b!244304))

(assert (= (and b!244304 res!119814) b!244321))

(assert (= (and b!244321 res!119807) b!244313))

(assert (= (and b!244313 c!40773) b!244296))

(assert (= (and b!244313 (not c!40773)) b!244320))

(assert (= (and b!244320 c!40774) b!244308))

(assert (= (and b!244320 (not c!40774)) b!244322))

(assert (= (and b!244308 res!119812) b!244298))

(assert (= (and b!244298 res!119806) b!244303))

(assert (= (and b!244322 c!40776) b!244301))

(assert (= (and b!244322 (not c!40776)) b!244311))

(assert (= (and b!244301 res!119804) b!244307))

(assert (= (and b!244307 res!119802) b!244318))

(assert (= (or b!244308 b!244301) bm!22781))

(assert (= (or b!244303 b!244318) bm!22782))

(assert (= (and b!244313 res!119816) b!244317))

(assert (= (and b!244317 c!40775) b!244295))

(assert (= (and b!244317 (not c!40775)) b!244315))

(assert (= (and b!244317 res!119815) b!244299))

(assert (= (and b!244299 res!119809) b!244310))

(assert (= (and b!244310 res!119805) b!244314))

(assert (= (and b!244314 res!119811) b!244319))

(assert (= (and b!244319 res!119799) b!244312))

(assert (= (and b!244319 (not res!119801)) b!244302))

(assert (= (and b!244302 res!119810) b!244300))

(assert (= (and b!244319 res!119803) b!244297))

(assert (= (and b!244297 res!119813) b!244294))

(assert (= (and b!244294 res!119808) b!244309))

(assert (= (and b!244316 condMapEmpty!10852) mapIsEmpty!10852))

(assert (= (and b!244316 (not condMapEmpty!10852)) mapNonEmpty!10852))

(assert (= (and mapNonEmpty!10852 ((_ is ValueCellFull!2856) mapValue!10852)) b!244323))

(assert (= (and b!244316 ((_ is ValueCellFull!2856) mapDefault!10852)) b!244306))

(assert (= b!244305 b!244316))

(assert (= start!23254 b!244305))

(declare-fun m!262323 () Bool)

(assert (=> b!244305 m!262323))

(declare-fun m!262325 () Bool)

(assert (=> b!244305 m!262325))

(declare-fun m!262327 () Bool)

(assert (=> b!244300 m!262327))

(declare-fun m!262329 () Bool)

(assert (=> b!244296 m!262329))

(declare-fun m!262331 () Bool)

(assert (=> b!244321 m!262331))

(declare-fun m!262333 () Bool)

(assert (=> b!244314 m!262333))

(declare-fun m!262335 () Bool)

(assert (=> start!23254 m!262335))

(declare-fun m!262337 () Bool)

(assert (=> b!244310 m!262337))

(declare-fun m!262339 () Bool)

(assert (=> mapNonEmpty!10852 m!262339))

(declare-fun m!262341 () Bool)

(assert (=> b!244298 m!262341))

(declare-fun m!262343 () Bool)

(assert (=> b!244309 m!262343))

(declare-fun m!262345 () Bool)

(assert (=> bm!22781 m!262345))

(declare-fun m!262347 () Bool)

(assert (=> b!244295 m!262347))

(declare-fun m!262349 () Bool)

(assert (=> b!244313 m!262349))

(declare-fun m!262351 () Bool)

(assert (=> b!244313 m!262351))

(assert (=> b!244313 m!262351))

(declare-fun m!262353 () Bool)

(assert (=> b!244313 m!262353))

(declare-fun m!262355 () Bool)

(assert (=> b!244320 m!262355))

(declare-fun m!262357 () Bool)

(assert (=> b!244299 m!262357))

(declare-fun m!262359 () Bool)

(assert (=> b!244317 m!262359))

(assert (=> bm!22782 m!262359))

(declare-fun m!262361 () Bool)

(assert (=> b!244297 m!262361))

(assert (=> b!244312 m!262327))

(declare-fun m!262363 () Bool)

(assert (=> b!244307 m!262363))

(check-sat (not b!244300) (not b!244305) (not b!244297) (not b!244317) (not b!244309) (not b!244321) (not b!244310) (not b!244314) (not b!244313) (not b!244299) b_and!13521 (not b!244312) (not b!244320) (not start!23254) (not bm!22781) (not bm!22782) (not b!244295) (not mapNonEmpty!10852) tp_is_empty!6399 (not b!244296) (not b_next!6537))
(check-sat b_and!13521 (not b_next!6537))
(get-model)

(declare-fun b!244424 () Bool)

(declare-fun e!158601 () Bool)

(declare-fun call!22794 () Bool)

(assert (=> b!244424 (= e!158601 call!22794)))

(declare-fun b!244425 () Bool)

(declare-fun e!158598 () Bool)

(declare-fun e!158599 () Bool)

(assert (=> b!244425 (= e!158598 e!158599)))

(declare-fun res!119877 () Bool)

(assert (=> b!244425 (=> (not res!119877) (not e!158599))))

(declare-fun e!158600 () Bool)

(assert (=> b!244425 (= res!119877 (not e!158600))))

(declare-fun res!119879 () Bool)

(assert (=> b!244425 (=> (not res!119879) (not e!158600))))

(assert (=> b!244425 (= res!119879 (validKeyInArray!0 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244426 () Bool)

(assert (=> b!244426 (= e!158599 e!158601)))

(declare-fun c!40791 () Bool)

(assert (=> b!244426 (= c!40791 (validKeyInArray!0 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244427 () Bool)

(assert (=> b!244427 (= e!158600 (contains!1762 Nil!3653 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244428 () Bool)

(assert (=> b!244428 (= e!158601 call!22794)))

(declare-fun d!60107 () Bool)

(declare-fun res!119878 () Bool)

(assert (=> d!60107 (=> res!119878 e!158598)))

(assert (=> d!60107 (= res!119878 (bvsge #b00000000000000000000000000000000 (size!6083 (_keys!6635 thiss!1504))))))

(assert (=> d!60107 (= (arrayNoDuplicates!0 (_keys!6635 thiss!1504) #b00000000000000000000000000000000 Nil!3653) e!158598)))

(declare-fun bm!22791 () Bool)

(assert (=> bm!22791 (= call!22794 (arrayNoDuplicates!0 (_keys!6635 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40791 (Cons!3652 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000) Nil!3653) Nil!3653)))))

(assert (= (and d!60107 (not res!119878)) b!244425))

(assert (= (and b!244425 res!119879) b!244427))

(assert (= (and b!244425 res!119877) b!244426))

(assert (= (and b!244426 c!40791) b!244424))

(assert (= (and b!244426 (not c!40791)) b!244428))

(assert (= (or b!244424 b!244428) bm!22791))

(declare-fun m!262407 () Bool)

(assert (=> b!244425 m!262407))

(assert (=> b!244425 m!262407))

(declare-fun m!262409 () Bool)

(assert (=> b!244425 m!262409))

(assert (=> b!244426 m!262407))

(assert (=> b!244426 m!262407))

(assert (=> b!244426 m!262409))

(assert (=> b!244427 m!262407))

(assert (=> b!244427 m!262407))

(declare-fun m!262411 () Bool)

(assert (=> b!244427 m!262411))

(assert (=> bm!22791 m!262407))

(declare-fun m!262413 () Bool)

(assert (=> bm!22791 m!262413))

(assert (=> b!244297 d!60107))

(declare-fun d!60109 () Bool)

(assert (=> d!60109 (= (array_inv!3795 (_keys!6635 thiss!1504)) (bvsge (size!6083 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244305 d!60109))

(declare-fun d!60111 () Bool)

(assert (=> d!60111 (= (array_inv!3796 (_values!4506 thiss!1504)) (bvsge (size!6082 (_values!4506 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244305 d!60111))

(declare-fun d!60113 () Bool)

(assert (=> d!60113 (contains!1763 (getCurrentListMap!1387 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)) key!932)))

(declare-fun lt!122481 () Unit!7540)

(declare-fun choose!1140 (array!12093 array!12091 (_ BitVec 32) (_ BitVec 32) V!8179 V!8179 (_ BitVec 64) (_ BitVec 32) Int) Unit!7540)

(assert (=> d!60113 (= lt!122481 (choose!1140 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!60113 (validMask!0 (mask!10622 thiss!1504))))

(assert (=> d!60113 (= (lemmaArrayContainsKeyThenInListMap!169 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)) lt!122481)))

(declare-fun bs!8880 () Bool)

(assert (= bs!8880 d!60113))

(assert (=> bs!8880 m!262351))

(assert (=> bs!8880 m!262351))

(assert (=> bs!8880 m!262353))

(declare-fun m!262415 () Bool)

(assert (=> bs!8880 m!262415))

(declare-fun m!262417 () Bool)

(assert (=> bs!8880 m!262417))

(assert (=> b!244295 d!60113))

(declare-fun d!60115 () Bool)

(declare-fun e!158604 () Bool)

(assert (=> d!60115 e!158604))

(declare-fun res!119885 () Bool)

(assert (=> d!60115 (=> (not res!119885) (not e!158604))))

(declare-fun lt!122487 () SeekEntryResult!1079)

(assert (=> d!60115 (= res!119885 ((_ is Found!1079) lt!122487))))

(assert (=> d!60115 (= lt!122487 (seekEntryOrOpen!0 key!932 (_keys!6635 thiss!1504) (mask!10622 thiss!1504)))))

(declare-fun lt!122486 () Unit!7540)

(declare-fun choose!1141 (array!12093 array!12091 (_ BitVec 32) (_ BitVec 32) V!8179 V!8179 (_ BitVec 64) Int) Unit!7540)

(assert (=> d!60115 (= lt!122486 (choose!1141 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) key!932 (defaultEntry!4523 thiss!1504)))))

(assert (=> d!60115 (validMask!0 (mask!10622 thiss!1504))))

(assert (=> d!60115 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!366 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) key!932 (defaultEntry!4523 thiss!1504)) lt!122486)))

(declare-fun b!244433 () Bool)

(declare-fun res!119884 () Bool)

(assert (=> b!244433 (=> (not res!119884) (not e!158604))))

(assert (=> b!244433 (= res!119884 (inRange!0 (index!6487 lt!122487) (mask!10622 thiss!1504)))))

(declare-fun b!244434 () Bool)

(assert (=> b!244434 (= e!158604 (= (select (arr!5741 (_keys!6635 thiss!1504)) (index!6487 lt!122487)) key!932))))

(assert (=> b!244434 (and (bvsge (index!6487 lt!122487) #b00000000000000000000000000000000) (bvslt (index!6487 lt!122487) (size!6083 (_keys!6635 thiss!1504))))))

(assert (= (and d!60115 res!119885) b!244433))

(assert (= (and b!244433 res!119884) b!244434))

(assert (=> d!60115 m!262331))

(declare-fun m!262419 () Bool)

(assert (=> d!60115 m!262419))

(assert (=> d!60115 m!262417))

(declare-fun m!262421 () Bool)

(assert (=> b!244433 m!262421))

(declare-fun m!262423 () Bool)

(assert (=> b!244434 m!262423))

(assert (=> b!244296 d!60115))

(declare-fun d!60117 () Bool)

(declare-fun res!119890 () Bool)

(declare-fun e!158609 () Bool)

(assert (=> d!60117 (=> res!119890 e!158609)))

(assert (=> d!60117 (= res!119890 ((_ is Nil!3653) Nil!3653))))

(assert (=> d!60117 (= (noDuplicate!101 Nil!3653) e!158609)))

(declare-fun b!244439 () Bool)

(declare-fun e!158610 () Bool)

(assert (=> b!244439 (= e!158609 e!158610)))

(declare-fun res!119891 () Bool)

(assert (=> b!244439 (=> (not res!119891) (not e!158610))))

(assert (=> b!244439 (= res!119891 (not (contains!1762 (t!8665 Nil!3653) (h!4309 Nil!3653))))))

(declare-fun b!244440 () Bool)

(assert (=> b!244440 (= e!158610 (noDuplicate!101 (t!8665 Nil!3653)))))

(assert (= (and d!60117 (not res!119890)) b!244439))

(assert (= (and b!244439 res!119891) b!244440))

(declare-fun m!262425 () Bool)

(assert (=> b!244439 m!262425))

(declare-fun m!262427 () Bool)

(assert (=> b!244440 m!262427))

(assert (=> b!244299 d!60117))

(declare-fun d!60119 () Bool)

(declare-fun lt!122490 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!162 (List!3656) (InoxSet (_ BitVec 64)))

(assert (=> d!60119 (= lt!122490 (select (content!162 Nil!3653) key!932))))

(declare-fun e!158616 () Bool)

(assert (=> d!60119 (= lt!122490 e!158616)))

(declare-fun res!119896 () Bool)

(assert (=> d!60119 (=> (not res!119896) (not e!158616))))

(assert (=> d!60119 (= res!119896 ((_ is Cons!3652) Nil!3653))))

(assert (=> d!60119 (= (contains!1762 Nil!3653 key!932) lt!122490)))

(declare-fun b!244445 () Bool)

(declare-fun e!158615 () Bool)

(assert (=> b!244445 (= e!158616 e!158615)))

(declare-fun res!119897 () Bool)

(assert (=> b!244445 (=> res!119897 e!158615)))

(assert (=> b!244445 (= res!119897 (= (h!4309 Nil!3653) key!932))))

(declare-fun b!244446 () Bool)

(assert (=> b!244446 (= e!158615 (contains!1762 (t!8665 Nil!3653) key!932))))

(assert (= (and d!60119 res!119896) b!244445))

(assert (= (and b!244445 (not res!119897)) b!244446))

(declare-fun m!262429 () Bool)

(assert (=> d!60119 m!262429))

(declare-fun m!262431 () Bool)

(assert (=> d!60119 m!262431))

(declare-fun m!262433 () Bool)

(assert (=> b!244446 m!262433))

(assert (=> b!244300 d!60119))

(declare-fun d!60121 () Bool)

(assert (=> d!60121 (= (inRange!0 (ite c!40774 (index!6486 lt!122456) (index!6489 lt!122456)) (mask!10622 thiss!1504)) (and (bvsge (ite c!40774 (index!6486 lt!122456) (index!6489 lt!122456)) #b00000000000000000000000000000000) (bvslt (ite c!40774 (index!6486 lt!122456) (index!6489 lt!122456)) (bvadd (mask!10622 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22781 d!60121))

(declare-fun d!60123 () Bool)

(declare-fun res!119902 () Bool)

(declare-fun e!158621 () Bool)

(assert (=> d!60123 (=> res!119902 e!158621)))

(assert (=> d!60123 (= res!119902 (= (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60123 (= (arrayContainsKey!0 (_keys!6635 thiss!1504) key!932 #b00000000000000000000000000000000) e!158621)))

(declare-fun b!244451 () Bool)

(declare-fun e!158622 () Bool)

(assert (=> b!244451 (= e!158621 e!158622)))

(declare-fun res!119903 () Bool)

(assert (=> b!244451 (=> (not res!119903) (not e!158622))))

(assert (=> b!244451 (= res!119903 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6083 (_keys!6635 thiss!1504))))))

(declare-fun b!244452 () Bool)

(assert (=> b!244452 (= e!158622 (arrayContainsKey!0 (_keys!6635 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60123 (not res!119902)) b!244451))

(assert (= (and b!244451 res!119903) b!244452))

(assert (=> d!60123 m!262407))

(declare-fun m!262435 () Bool)

(assert (=> b!244452 m!262435))

(assert (=> b!244317 d!60123))

(assert (=> bm!22782 d!60123))

(declare-fun d!60125 () Bool)

(declare-fun e!158631 () Bool)

(assert (=> d!60125 e!158631))

(declare-fun c!40796 () Bool)

(declare-fun lt!122495 () SeekEntryResult!1079)

(assert (=> d!60125 (= c!40796 ((_ is MissingZero!1079) lt!122495))))

(assert (=> d!60125 (= lt!122495 (seekEntryOrOpen!0 key!932 (_keys!6635 thiss!1504) (mask!10622 thiss!1504)))))

(declare-fun lt!122496 () Unit!7540)

(declare-fun choose!1142 (array!12093 array!12091 (_ BitVec 32) (_ BitVec 32) V!8179 V!8179 (_ BitVec 64) Int) Unit!7540)

(assert (=> d!60125 (= lt!122496 (choose!1142 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) key!932 (defaultEntry!4523 thiss!1504)))))

(assert (=> d!60125 (validMask!0 (mask!10622 thiss!1504))))

(assert (=> d!60125 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!372 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) key!932 (defaultEntry!4523 thiss!1504)) lt!122496)))

(declare-fun b!244469 () Bool)

(declare-fun e!158633 () Bool)

(assert (=> b!244469 (= e!158633 ((_ is Undefined!1079) lt!122495))))

(declare-fun b!244470 () Bool)

(assert (=> b!244470 (and (bvsge (index!6486 lt!122495) #b00000000000000000000000000000000) (bvslt (index!6486 lt!122495) (size!6083 (_keys!6635 thiss!1504))))))

(declare-fun res!119913 () Bool)

(assert (=> b!244470 (= res!119913 (= (select (arr!5741 (_keys!6635 thiss!1504)) (index!6486 lt!122495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158634 () Bool)

(assert (=> b!244470 (=> (not res!119913) (not e!158634))))

(declare-fun b!244471 () Bool)

(declare-fun e!158632 () Bool)

(declare-fun call!22799 () Bool)

(assert (=> b!244471 (= e!158632 (not call!22799))))

(declare-fun b!244472 () Bool)

(assert (=> b!244472 (= e!158631 e!158634)))

(declare-fun res!119914 () Bool)

(declare-fun call!22800 () Bool)

(assert (=> b!244472 (= res!119914 call!22800)))

(assert (=> b!244472 (=> (not res!119914) (not e!158634))))

(declare-fun bm!22796 () Bool)

(assert (=> bm!22796 (= call!22800 (inRange!0 (ite c!40796 (index!6486 lt!122495) (index!6489 lt!122495)) (mask!10622 thiss!1504)))))

(declare-fun b!244473 () Bool)

(declare-fun res!119915 () Bool)

(assert (=> b!244473 (=> (not res!119915) (not e!158632))))

(assert (=> b!244473 (= res!119915 call!22800)))

(assert (=> b!244473 (= e!158633 e!158632)))

(declare-fun bm!22797 () Bool)

(assert (=> bm!22797 (= call!22799 (arrayContainsKey!0 (_keys!6635 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244474 () Bool)

(assert (=> b!244474 (= e!158631 e!158633)))

(declare-fun c!40797 () Bool)

(assert (=> b!244474 (= c!40797 ((_ is MissingVacant!1079) lt!122495))))

(declare-fun b!244475 () Bool)

(assert (=> b!244475 (= e!158634 (not call!22799))))

(declare-fun b!244476 () Bool)

(declare-fun res!119912 () Bool)

(assert (=> b!244476 (=> (not res!119912) (not e!158632))))

(assert (=> b!244476 (= res!119912 (= (select (arr!5741 (_keys!6635 thiss!1504)) (index!6489 lt!122495)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244476 (and (bvsge (index!6489 lt!122495) #b00000000000000000000000000000000) (bvslt (index!6489 lt!122495) (size!6083 (_keys!6635 thiss!1504))))))

(assert (= (and d!60125 c!40796) b!244472))

(assert (= (and d!60125 (not c!40796)) b!244474))

(assert (= (and b!244472 res!119914) b!244470))

(assert (= (and b!244470 res!119913) b!244475))

(assert (= (and b!244474 c!40797) b!244473))

(assert (= (and b!244474 (not c!40797)) b!244469))

(assert (= (and b!244473 res!119915) b!244476))

(assert (= (and b!244476 res!119912) b!244471))

(assert (= (or b!244472 b!244473) bm!22796))

(assert (= (or b!244475 b!244471) bm!22797))

(declare-fun m!262437 () Bool)

(assert (=> b!244476 m!262437))

(assert (=> bm!22797 m!262359))

(declare-fun m!262439 () Bool)

(assert (=> bm!22796 m!262439))

(assert (=> d!60125 m!262331))

(declare-fun m!262441 () Bool)

(assert (=> d!60125 m!262441))

(assert (=> d!60125 m!262417))

(declare-fun m!262443 () Bool)

(assert (=> b!244470 m!262443))

(assert (=> b!244320 d!60125))

(declare-fun d!60127 () Bool)

(assert (=> d!60127 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244309 d!60127))

(declare-fun d!60129 () Bool)

(declare-fun res!119922 () Bool)

(declare-fun e!158637 () Bool)

(assert (=> d!60129 (=> (not res!119922) (not e!158637))))

(declare-fun simpleValid!251 (LongMapFixedSize!3612) Bool)

(assert (=> d!60129 (= res!119922 (simpleValid!251 thiss!1504))))

(assert (=> d!60129 (= (valid!1415 thiss!1504) e!158637)))

(declare-fun b!244483 () Bool)

(declare-fun res!119923 () Bool)

(assert (=> b!244483 (=> (not res!119923) (not e!158637))))

(declare-fun arrayCountValidKeys!0 (array!12093 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!244483 (= res!119923 (= (arrayCountValidKeys!0 (_keys!6635 thiss!1504) #b00000000000000000000000000000000 (size!6083 (_keys!6635 thiss!1504))) (_size!1855 thiss!1504)))))

(declare-fun b!244484 () Bool)

(declare-fun res!119924 () Bool)

(assert (=> b!244484 (=> (not res!119924) (not e!158637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12093 (_ BitVec 32)) Bool)

(assert (=> b!244484 (= res!119924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6635 thiss!1504) (mask!10622 thiss!1504)))))

(declare-fun b!244485 () Bool)

(assert (=> b!244485 (= e!158637 (arrayNoDuplicates!0 (_keys!6635 thiss!1504) #b00000000000000000000000000000000 Nil!3653))))

(assert (= (and d!60129 res!119922) b!244483))

(assert (= (and b!244483 res!119923) b!244484))

(assert (= (and b!244484 res!119924) b!244485))

(declare-fun m!262445 () Bool)

(assert (=> d!60129 m!262445))

(declare-fun m!262447 () Bool)

(assert (=> b!244483 m!262447))

(declare-fun m!262449 () Bool)

(assert (=> b!244484 m!262449))

(assert (=> b!244485 m!262361))

(assert (=> start!23254 d!60129))

(declare-fun d!60131 () Bool)

(declare-fun lt!122497 () Bool)

(assert (=> d!60131 (= lt!122497 (select (content!162 Nil!3653) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158639 () Bool)

(assert (=> d!60131 (= lt!122497 e!158639)))

(declare-fun res!119925 () Bool)

(assert (=> d!60131 (=> (not res!119925) (not e!158639))))

(assert (=> d!60131 (= res!119925 ((_ is Cons!3652) Nil!3653))))

(assert (=> d!60131 (= (contains!1762 Nil!3653 #b0000000000000000000000000000000000000000000000000000000000000000) lt!122497)))

(declare-fun b!244486 () Bool)

(declare-fun e!158638 () Bool)

(assert (=> b!244486 (= e!158639 e!158638)))

(declare-fun res!119926 () Bool)

(assert (=> b!244486 (=> res!119926 e!158638)))

(assert (=> b!244486 (= res!119926 (= (h!4309 Nil!3653) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244487 () Bool)

(assert (=> b!244487 (= e!158638 (contains!1762 (t!8665 Nil!3653) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60131 res!119925) b!244486))

(assert (= (and b!244486 (not res!119926)) b!244487))

(assert (=> d!60131 m!262429))

(declare-fun m!262451 () Bool)

(assert (=> d!60131 m!262451))

(declare-fun m!262453 () Bool)

(assert (=> b!244487 m!262453))

(assert (=> b!244310 d!60131))

(declare-fun d!60133 () Bool)

(assert (=> d!60133 (= (inRange!0 index!297 (mask!10622 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10622 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!244313 d!60133))

(declare-fun d!60135 () Bool)

(declare-fun e!158644 () Bool)

(assert (=> d!60135 e!158644))

(declare-fun res!119929 () Bool)

(assert (=> d!60135 (=> res!119929 e!158644)))

(declare-fun lt!122509 () Bool)

(assert (=> d!60135 (= res!119929 (not lt!122509))))

(declare-fun lt!122507 () Bool)

(assert (=> d!60135 (= lt!122509 lt!122507)))

(declare-fun lt!122508 () Unit!7540)

(declare-fun e!158645 () Unit!7540)

(assert (=> d!60135 (= lt!122508 e!158645)))

(declare-fun c!40800 () Bool)

(assert (=> d!60135 (= c!40800 lt!122507)))

(declare-fun containsKey!278 (List!3657 (_ BitVec 64)) Bool)

(assert (=> d!60135 (= lt!122507 (containsKey!278 (toList!1859 (getCurrentListMap!1387 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504))) key!932))))

(assert (=> d!60135 (= (contains!1763 (getCurrentListMap!1387 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)) key!932) lt!122509)))

(declare-fun b!244494 () Bool)

(declare-fun lt!122506 () Unit!7540)

(assert (=> b!244494 (= e!158645 lt!122506)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!226 (List!3657 (_ BitVec 64)) Unit!7540)

(assert (=> b!244494 (= lt!122506 (lemmaContainsKeyImpliesGetValueByKeyDefined!226 (toList!1859 (getCurrentListMap!1387 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504))) key!932))))

(declare-datatypes ((Option!292 0))(
  ( (Some!291 (v!5296 V!8179)) (None!290) )
))
(declare-fun isDefined!227 (Option!292) Bool)

(declare-fun getValueByKey!286 (List!3657 (_ BitVec 64)) Option!292)

(assert (=> b!244494 (isDefined!227 (getValueByKey!286 (toList!1859 (getCurrentListMap!1387 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504))) key!932))))

(declare-fun b!244495 () Bool)

(declare-fun Unit!7549 () Unit!7540)

(assert (=> b!244495 (= e!158645 Unit!7549)))

(declare-fun b!244496 () Bool)

(assert (=> b!244496 (= e!158644 (isDefined!227 (getValueByKey!286 (toList!1859 (getCurrentListMap!1387 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504))) key!932)))))

(assert (= (and d!60135 c!40800) b!244494))

(assert (= (and d!60135 (not c!40800)) b!244495))

(assert (= (and d!60135 (not res!119929)) b!244496))

(declare-fun m!262455 () Bool)

(assert (=> d!60135 m!262455))

(declare-fun m!262457 () Bool)

(assert (=> b!244494 m!262457))

(declare-fun m!262459 () Bool)

(assert (=> b!244494 m!262459))

(assert (=> b!244494 m!262459))

(declare-fun m!262461 () Bool)

(assert (=> b!244494 m!262461))

(assert (=> b!244496 m!262459))

(assert (=> b!244496 m!262459))

(assert (=> b!244496 m!262461))

(assert (=> b!244313 d!60135))

(declare-fun b!244539 () Bool)

(declare-fun e!158678 () Bool)

(declare-fun e!158684 () Bool)

(assert (=> b!244539 (= e!158678 e!158684)))

(declare-fun res!119948 () Bool)

(assert (=> b!244539 (=> (not res!119948) (not e!158684))))

(declare-fun lt!122564 () ListLongMap!3687)

(assert (=> b!244539 (= res!119948 (contains!1763 lt!122564 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!244539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6083 (_keys!6635 thiss!1504))))))

(declare-fun bm!22812 () Bool)

(declare-fun call!22817 () ListLongMap!3687)

(declare-fun call!22818 () ListLongMap!3687)

(assert (=> bm!22812 (= call!22817 call!22818)))

(declare-fun b!244540 () Bool)

(declare-fun e!158681 () Unit!7540)

(declare-fun Unit!7550 () Unit!7540)

(assert (=> b!244540 (= e!158681 Unit!7550)))

(declare-fun b!244541 () Bool)

(declare-fun e!158673 () Bool)

(assert (=> b!244541 (= e!158673 (validKeyInArray!0 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22813 () Bool)

(declare-fun call!22820 () ListLongMap!3687)

(declare-fun call!22816 () ListLongMap!3687)

(assert (=> bm!22813 (= call!22820 call!22816)))

(declare-fun b!244542 () Bool)

(declare-fun e!158675 () ListLongMap!3687)

(assert (=> b!244542 (= e!158675 call!22820)))

(declare-fun b!244543 () Bool)

(declare-fun e!158679 () Bool)

(assert (=> b!244543 (= e!158679 (validKeyInArray!0 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244544 () Bool)

(declare-fun e!158674 () Bool)

(declare-fun e!158680 () Bool)

(assert (=> b!244544 (= e!158674 e!158680)))

(declare-fun c!40815 () Bool)

(assert (=> b!244544 (= c!40815 (not (= (bvand (extraKeys!4260 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!244545 () Bool)

(declare-fun e!158676 () ListLongMap!3687)

(assert (=> b!244545 (= e!158676 call!22820)))

(declare-fun b!244546 () Bool)

(declare-fun c!40818 () Bool)

(assert (=> b!244546 (= c!40818 (and (not (= (bvand (extraKeys!4260 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4260 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!244546 (= e!158675 e!158676)))

(declare-fun d!60137 () Bool)

(assert (=> d!60137 e!158674))

(declare-fun res!119955 () Bool)

(assert (=> d!60137 (=> (not res!119955) (not e!158674))))

(assert (=> d!60137 (= res!119955 (or (bvsge #b00000000000000000000000000000000 (size!6083 (_keys!6635 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6083 (_keys!6635 thiss!1504))))))))

(declare-fun lt!122556 () ListLongMap!3687)

(assert (=> d!60137 (= lt!122564 lt!122556)))

(declare-fun lt!122565 () Unit!7540)

(assert (=> d!60137 (= lt!122565 e!158681)))

(declare-fun c!40813 () Bool)

(assert (=> d!60137 (= c!40813 e!158673)))

(declare-fun res!119954 () Bool)

(assert (=> d!60137 (=> (not res!119954) (not e!158673))))

(assert (=> d!60137 (= res!119954 (bvslt #b00000000000000000000000000000000 (size!6083 (_keys!6635 thiss!1504))))))

(declare-fun e!158683 () ListLongMap!3687)

(assert (=> d!60137 (= lt!122556 e!158683)))

(declare-fun c!40816 () Bool)

(assert (=> d!60137 (= c!40816 (and (not (= (bvand (extraKeys!4260 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4260 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60137 (validMask!0 (mask!10622 thiss!1504))))

(assert (=> d!60137 (= (getCurrentListMap!1387 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)) lt!122564)))

(declare-fun bm!22814 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!550 (array!12093 array!12091 (_ BitVec 32) (_ BitVec 32) V!8179 V!8179 (_ BitVec 32) Int) ListLongMap!3687)

(assert (=> bm!22814 (= call!22818 (getCurrentListMapNoExtraKeys!550 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)))))

(declare-fun b!244547 () Bool)

(declare-fun call!22821 () ListLongMap!3687)

(assert (=> b!244547 (= e!158676 call!22821)))

(declare-fun b!244548 () Bool)

(declare-fun lt!122554 () Unit!7540)

(assert (=> b!244548 (= e!158681 lt!122554)))

(declare-fun lt!122566 () ListLongMap!3687)

(assert (=> b!244548 (= lt!122566 (getCurrentListMapNoExtraKeys!550 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)))))

(declare-fun lt!122558 () (_ BitVec 64))

(assert (=> b!244548 (= lt!122558 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122569 () (_ BitVec 64))

(assert (=> b!244548 (= lt!122569 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122563 () Unit!7540)

(declare-fun addStillContains!204 (ListLongMap!3687 (_ BitVec 64) V!8179 (_ BitVec 64)) Unit!7540)

(assert (=> b!244548 (= lt!122563 (addStillContains!204 lt!122566 lt!122558 (zeroValue!4364 thiss!1504) lt!122569))))

(declare-fun +!655 (ListLongMap!3687 tuple2!4774) ListLongMap!3687)

(assert (=> b!244548 (contains!1763 (+!655 lt!122566 (tuple2!4775 lt!122558 (zeroValue!4364 thiss!1504))) lt!122569)))

(declare-fun lt!122574 () Unit!7540)

(assert (=> b!244548 (= lt!122574 lt!122563)))

(declare-fun lt!122570 () ListLongMap!3687)

(assert (=> b!244548 (= lt!122570 (getCurrentListMapNoExtraKeys!550 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)))))

(declare-fun lt!122561 () (_ BitVec 64))

(assert (=> b!244548 (= lt!122561 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122573 () (_ BitVec 64))

(assert (=> b!244548 (= lt!122573 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122575 () Unit!7540)

(declare-fun addApplyDifferent!204 (ListLongMap!3687 (_ BitVec 64) V!8179 (_ BitVec 64)) Unit!7540)

(assert (=> b!244548 (= lt!122575 (addApplyDifferent!204 lt!122570 lt!122561 (minValue!4364 thiss!1504) lt!122573))))

(declare-fun apply!228 (ListLongMap!3687 (_ BitVec 64)) V!8179)

(assert (=> b!244548 (= (apply!228 (+!655 lt!122570 (tuple2!4775 lt!122561 (minValue!4364 thiss!1504))) lt!122573) (apply!228 lt!122570 lt!122573))))

(declare-fun lt!122560 () Unit!7540)

(assert (=> b!244548 (= lt!122560 lt!122575)))

(declare-fun lt!122562 () ListLongMap!3687)

(assert (=> b!244548 (= lt!122562 (getCurrentListMapNoExtraKeys!550 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)))))

(declare-fun lt!122568 () (_ BitVec 64))

(assert (=> b!244548 (= lt!122568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122557 () (_ BitVec 64))

(assert (=> b!244548 (= lt!122557 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122567 () Unit!7540)

(assert (=> b!244548 (= lt!122567 (addApplyDifferent!204 lt!122562 lt!122568 (zeroValue!4364 thiss!1504) lt!122557))))

(assert (=> b!244548 (= (apply!228 (+!655 lt!122562 (tuple2!4775 lt!122568 (zeroValue!4364 thiss!1504))) lt!122557) (apply!228 lt!122562 lt!122557))))

(declare-fun lt!122572 () Unit!7540)

(assert (=> b!244548 (= lt!122572 lt!122567)))

(declare-fun lt!122555 () ListLongMap!3687)

(assert (=> b!244548 (= lt!122555 (getCurrentListMapNoExtraKeys!550 (_keys!6635 thiss!1504) (_values!4506 thiss!1504) (mask!10622 thiss!1504) (extraKeys!4260 thiss!1504) (zeroValue!4364 thiss!1504) (minValue!4364 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4523 thiss!1504)))))

(declare-fun lt!122571 () (_ BitVec 64))

(assert (=> b!244548 (= lt!122571 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122559 () (_ BitVec 64))

(assert (=> b!244548 (= lt!122559 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244548 (= lt!122554 (addApplyDifferent!204 lt!122555 lt!122571 (minValue!4364 thiss!1504) lt!122559))))

(assert (=> b!244548 (= (apply!228 (+!655 lt!122555 (tuple2!4775 lt!122571 (minValue!4364 thiss!1504))) lt!122559) (apply!228 lt!122555 lt!122559))))

(declare-fun b!244549 () Bool)

(declare-fun get!2946 (ValueCell!2856 V!8179) V!8179)

(declare-fun dynLambda!571 (Int (_ BitVec 64)) V!8179)

(assert (=> b!244549 (= e!158684 (= (apply!228 lt!122564 (select (arr!5741 (_keys!6635 thiss!1504)) #b00000000000000000000000000000000)) (get!2946 (select (arr!5740 (_values!4506 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!571 (defaultEntry!4523 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6082 (_values!4506 thiss!1504))))))

(assert (=> b!244549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6083 (_keys!6635 thiss!1504))))))

(declare-fun b!244550 () Bool)

(declare-fun e!158677 () Bool)

(declare-fun call!22819 () Bool)

(assert (=> b!244550 (= e!158677 (not call!22819))))

(declare-fun b!244551 () Bool)

(declare-fun e!158682 () Bool)

(assert (=> b!244551 (= e!158682 (= (apply!228 lt!122564 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4364 thiss!1504)))))

(declare-fun bm!22815 () Bool)

(declare-fun call!22815 () Bool)

(assert (=> bm!22815 (= call!22815 (contains!1763 lt!122564 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!40814 () Bool)

(declare-fun bm!22816 () Bool)

(assert (=> bm!22816 (= call!22816 (+!655 (ite c!40816 call!22818 (ite c!40814 call!22817 call!22821)) (ite (or c!40816 c!40814) (tuple2!4775 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4364 thiss!1504)) (tuple2!4775 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4364 thiss!1504)))))))

(declare-fun b!244552 () Bool)

(assert (=> b!244552 (= e!158680 e!158682)))

(declare-fun res!119951 () Bool)

(assert (=> b!244552 (= res!119951 call!22815)))

(assert (=> b!244552 (=> (not res!119951) (not e!158682))))

(declare-fun bm!22817 () Bool)

(assert (=> bm!22817 (= call!22821 call!22817)))

(declare-fun b!244553 () Bool)

(declare-fun e!158672 () Bool)

(assert (=> b!244553 (= e!158677 e!158672)))

(declare-fun res!119949 () Bool)

(assert (=> b!244553 (= res!119949 call!22819)))

(assert (=> b!244553 (=> (not res!119949) (not e!158672))))

(declare-fun b!244554 () Bool)

(declare-fun res!119953 () Bool)

(assert (=> b!244554 (=> (not res!119953) (not e!158674))))

(assert (=> b!244554 (= res!119953 e!158677)))

(declare-fun c!40817 () Bool)

(assert (=> b!244554 (= c!40817 (not (= (bvand (extraKeys!4260 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!244555 () Bool)

(assert (=> b!244555 (= e!158683 (+!655 call!22816 (tuple2!4775 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4364 thiss!1504))))))

(declare-fun b!244556 () Bool)

(assert (=> b!244556 (= e!158672 (= (apply!228 lt!122564 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4364 thiss!1504)))))

(declare-fun b!244557 () Bool)

(assert (=> b!244557 (= e!158680 (not call!22815))))

(declare-fun b!244558 () Bool)

(declare-fun res!119950 () Bool)

(assert (=> b!244558 (=> (not res!119950) (not e!158674))))

(assert (=> b!244558 (= res!119950 e!158678)))

(declare-fun res!119952 () Bool)

(assert (=> b!244558 (=> res!119952 e!158678)))

(assert (=> b!244558 (= res!119952 (not e!158679))))

(declare-fun res!119956 () Bool)

(assert (=> b!244558 (=> (not res!119956) (not e!158679))))

(assert (=> b!244558 (= res!119956 (bvslt #b00000000000000000000000000000000 (size!6083 (_keys!6635 thiss!1504))))))

(declare-fun b!244559 () Bool)

(assert (=> b!244559 (= e!158683 e!158675)))

(assert (=> b!244559 (= c!40814 (and (not (= (bvand (extraKeys!4260 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4260 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22818 () Bool)

(assert (=> bm!22818 (= call!22819 (contains!1763 lt!122564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60137 c!40816) b!244555))

(assert (= (and d!60137 (not c!40816)) b!244559))

(assert (= (and b!244559 c!40814) b!244542))

(assert (= (and b!244559 (not c!40814)) b!244546))

(assert (= (and b!244546 c!40818) b!244545))

(assert (= (and b!244546 (not c!40818)) b!244547))

(assert (= (or b!244545 b!244547) bm!22817))

(assert (= (or b!244542 bm!22817) bm!22812))

(assert (= (or b!244542 b!244545) bm!22813))

(assert (= (or b!244555 bm!22812) bm!22814))

(assert (= (or b!244555 bm!22813) bm!22816))

(assert (= (and d!60137 res!119954) b!244541))

(assert (= (and d!60137 c!40813) b!244548))

(assert (= (and d!60137 (not c!40813)) b!244540))

(assert (= (and d!60137 res!119955) b!244558))

(assert (= (and b!244558 res!119956) b!244543))

(assert (= (and b!244558 (not res!119952)) b!244539))

(assert (= (and b!244539 res!119948) b!244549))

(assert (= (and b!244558 res!119950) b!244554))

(assert (= (and b!244554 c!40817) b!244553))

(assert (= (and b!244554 (not c!40817)) b!244550))

(assert (= (and b!244553 res!119949) b!244556))

(assert (= (or b!244553 b!244550) bm!22818))

(assert (= (and b!244554 res!119953) b!244544))

(assert (= (and b!244544 c!40815) b!244552))

(assert (= (and b!244544 (not c!40815)) b!244557))

(assert (= (and b!244552 res!119951) b!244551))

(assert (= (or b!244552 b!244557) bm!22815))

(declare-fun b_lambda!8015 () Bool)

(assert (=> (not b_lambda!8015) (not b!244549)))

(declare-fun t!8670 () Bool)

(declare-fun tb!2969 () Bool)

(assert (=> (and b!244305 (= (defaultEntry!4523 thiss!1504) (defaultEntry!4523 thiss!1504)) t!8670) tb!2969))

(declare-fun result!5229 () Bool)

(assert (=> tb!2969 (= result!5229 tp_is_empty!6399)))

(assert (=> b!244549 t!8670))

(declare-fun b_and!13525 () Bool)

(assert (= b_and!13521 (and (=> t!8670 result!5229) b_and!13525)))

(declare-fun m!262463 () Bool)

(assert (=> b!244555 m!262463))

(declare-fun m!262465 () Bool)

(assert (=> bm!22814 m!262465))

(assert (=> b!244539 m!262407))

(assert (=> b!244539 m!262407))

(declare-fun m!262467 () Bool)

(assert (=> b!244539 m!262467))

(assert (=> b!244541 m!262407))

(assert (=> b!244541 m!262407))

(assert (=> b!244541 m!262409))

(declare-fun m!262469 () Bool)

(assert (=> bm!22815 m!262469))

(assert (=> b!244543 m!262407))

(assert (=> b!244543 m!262407))

(assert (=> b!244543 m!262409))

(declare-fun m!262471 () Bool)

(assert (=> b!244556 m!262471))

(declare-fun m!262473 () Bool)

(assert (=> b!244549 m!262473))

(assert (=> b!244549 m!262407))

(assert (=> b!244549 m!262473))

(declare-fun m!262475 () Bool)

(assert (=> b!244549 m!262475))

(declare-fun m!262477 () Bool)

(assert (=> b!244549 m!262477))

(assert (=> b!244549 m!262407))

(declare-fun m!262479 () Bool)

(assert (=> b!244549 m!262479))

(assert (=> b!244549 m!262475))

(declare-fun m!262481 () Bool)

(assert (=> b!244548 m!262481))

(declare-fun m!262483 () Bool)

(assert (=> b!244548 m!262483))

(declare-fun m!262485 () Bool)

(assert (=> b!244548 m!262485))

(declare-fun m!262487 () Bool)

(assert (=> b!244548 m!262487))

(declare-fun m!262489 () Bool)

(assert (=> b!244548 m!262489))

(declare-fun m!262491 () Bool)

(assert (=> b!244548 m!262491))

(declare-fun m!262493 () Bool)

(assert (=> b!244548 m!262493))

(declare-fun m!262495 () Bool)

(assert (=> b!244548 m!262495))

(declare-fun m!262497 () Bool)

(assert (=> b!244548 m!262497))

(assert (=> b!244548 m!262489))

(declare-fun m!262499 () Bool)

(assert (=> b!244548 m!262499))

(assert (=> b!244548 m!262407))

(declare-fun m!262501 () Bool)

(assert (=> b!244548 m!262501))

(declare-fun m!262503 () Bool)

(assert (=> b!244548 m!262503))

(declare-fun m!262505 () Bool)

(assert (=> b!244548 m!262505))

(assert (=> b!244548 m!262465))

(assert (=> b!244548 m!262483))

(assert (=> b!244548 m!262501))

(declare-fun m!262507 () Bool)

(assert (=> b!244548 m!262507))

(declare-fun m!262509 () Bool)

(assert (=> b!244548 m!262509))

(assert (=> b!244548 m!262503))

(assert (=> d!60137 m!262417))

(declare-fun m!262511 () Bool)

(assert (=> bm!22816 m!262511))

(declare-fun m!262513 () Bool)

(assert (=> b!244551 m!262513))

(declare-fun m!262515 () Bool)

(assert (=> bm!22818 m!262515))

(assert (=> b!244313 d!60137))

(declare-fun d!60139 () Bool)

(declare-fun lt!122576 () Bool)

(assert (=> d!60139 (= lt!122576 (select (content!162 Nil!3653) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158686 () Bool)

(assert (=> d!60139 (= lt!122576 e!158686)))

(declare-fun res!119957 () Bool)

(assert (=> d!60139 (=> (not res!119957) (not e!158686))))

(assert (=> d!60139 (= res!119957 ((_ is Cons!3652) Nil!3653))))

(assert (=> d!60139 (= (contains!1762 Nil!3653 #b1000000000000000000000000000000000000000000000000000000000000000) lt!122576)))

(declare-fun b!244562 () Bool)

(declare-fun e!158685 () Bool)

(assert (=> b!244562 (= e!158686 e!158685)))

(declare-fun res!119958 () Bool)

(assert (=> b!244562 (=> res!119958 e!158685)))

(assert (=> b!244562 (= res!119958 (= (h!4309 Nil!3653) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244563 () Bool)

(assert (=> b!244563 (= e!158685 (contains!1762 (t!8665 Nil!3653) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60139 res!119957) b!244562))

(assert (= (and b!244562 (not res!119958)) b!244563))

(assert (=> d!60139 m!262429))

(declare-fun m!262517 () Bool)

(assert (=> d!60139 m!262517))

(declare-fun m!262519 () Bool)

(assert (=> b!244563 m!262519))

(assert (=> b!244314 d!60139))

(assert (=> b!244312 d!60119))

(declare-fun b!244576 () Bool)

(declare-fun e!158695 () SeekEntryResult!1079)

(declare-fun e!158694 () SeekEntryResult!1079)

(assert (=> b!244576 (= e!158695 e!158694)))

(declare-fun lt!122583 () (_ BitVec 64))

(declare-fun lt!122585 () SeekEntryResult!1079)

(assert (=> b!244576 (= lt!122583 (select (arr!5741 (_keys!6635 thiss!1504)) (index!6488 lt!122585)))))

(declare-fun c!40826 () Bool)

(assert (=> b!244576 (= c!40826 (= lt!122583 key!932))))

(declare-fun d!60141 () Bool)

(declare-fun lt!122584 () SeekEntryResult!1079)

(assert (=> d!60141 (and (or ((_ is Undefined!1079) lt!122584) (not ((_ is Found!1079) lt!122584)) (and (bvsge (index!6487 lt!122584) #b00000000000000000000000000000000) (bvslt (index!6487 lt!122584) (size!6083 (_keys!6635 thiss!1504))))) (or ((_ is Undefined!1079) lt!122584) ((_ is Found!1079) lt!122584) (not ((_ is MissingZero!1079) lt!122584)) (and (bvsge (index!6486 lt!122584) #b00000000000000000000000000000000) (bvslt (index!6486 lt!122584) (size!6083 (_keys!6635 thiss!1504))))) (or ((_ is Undefined!1079) lt!122584) ((_ is Found!1079) lt!122584) ((_ is MissingZero!1079) lt!122584) (not ((_ is MissingVacant!1079) lt!122584)) (and (bvsge (index!6489 lt!122584) #b00000000000000000000000000000000) (bvslt (index!6489 lt!122584) (size!6083 (_keys!6635 thiss!1504))))) (or ((_ is Undefined!1079) lt!122584) (ite ((_ is Found!1079) lt!122584) (= (select (arr!5741 (_keys!6635 thiss!1504)) (index!6487 lt!122584)) key!932) (ite ((_ is MissingZero!1079) lt!122584) (= (select (arr!5741 (_keys!6635 thiss!1504)) (index!6486 lt!122584)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1079) lt!122584) (= (select (arr!5741 (_keys!6635 thiss!1504)) (index!6489 lt!122584)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60141 (= lt!122584 e!158695)))

(declare-fun c!40827 () Bool)

(assert (=> d!60141 (= c!40827 (and ((_ is Intermediate!1079) lt!122585) (undefined!1891 lt!122585)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12093 (_ BitVec 32)) SeekEntryResult!1079)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60141 (= lt!122585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10622 thiss!1504)) key!932 (_keys!6635 thiss!1504) (mask!10622 thiss!1504)))))

(assert (=> d!60141 (validMask!0 (mask!10622 thiss!1504))))

(assert (=> d!60141 (= (seekEntryOrOpen!0 key!932 (_keys!6635 thiss!1504) (mask!10622 thiss!1504)) lt!122584)))

(declare-fun b!244577 () Bool)

(assert (=> b!244577 (= e!158694 (Found!1079 (index!6488 lt!122585)))))

(declare-fun b!244578 () Bool)

(declare-fun c!40825 () Bool)

(assert (=> b!244578 (= c!40825 (= lt!122583 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158693 () SeekEntryResult!1079)

(assert (=> b!244578 (= e!158694 e!158693)))

(declare-fun b!244579 () Bool)

(assert (=> b!244579 (= e!158695 Undefined!1079)))

(declare-fun b!244580 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12093 (_ BitVec 32)) SeekEntryResult!1079)

(assert (=> b!244580 (= e!158693 (seekKeyOrZeroReturnVacant!0 (x!24365 lt!122585) (index!6488 lt!122585) (index!6488 lt!122585) key!932 (_keys!6635 thiss!1504) (mask!10622 thiss!1504)))))

(declare-fun b!244581 () Bool)

(assert (=> b!244581 (= e!158693 (MissingZero!1079 (index!6488 lt!122585)))))

(assert (= (and d!60141 c!40827) b!244579))

(assert (= (and d!60141 (not c!40827)) b!244576))

(assert (= (and b!244576 c!40826) b!244577))

(assert (= (and b!244576 (not c!40826)) b!244578))

(assert (= (and b!244578 c!40825) b!244581))

(assert (= (and b!244578 (not c!40825)) b!244580))

(declare-fun m!262521 () Bool)

(assert (=> b!244576 m!262521))

(declare-fun m!262523 () Bool)

(assert (=> d!60141 m!262523))

(declare-fun m!262525 () Bool)

(assert (=> d!60141 m!262525))

(declare-fun m!262527 () Bool)

(assert (=> d!60141 m!262527))

(declare-fun m!262529 () Bool)

(assert (=> d!60141 m!262529))

(assert (=> d!60141 m!262529))

(declare-fun m!262531 () Bool)

(assert (=> d!60141 m!262531))

(assert (=> d!60141 m!262417))

(declare-fun m!262533 () Bool)

(assert (=> b!244580 m!262533))

(assert (=> b!244321 d!60141))

(declare-fun b!244589 () Bool)

(declare-fun e!158701 () Bool)

(assert (=> b!244589 (= e!158701 tp_is_empty!6399)))

(declare-fun condMapEmpty!10858 () Bool)

(declare-fun mapDefault!10858 () ValueCell!2856)

(assert (=> mapNonEmpty!10852 (= condMapEmpty!10858 (= mapRest!10852 ((as const (Array (_ BitVec 32) ValueCell!2856)) mapDefault!10858)))))

(declare-fun mapRes!10858 () Bool)

(assert (=> mapNonEmpty!10852 (= tp!22836 (and e!158701 mapRes!10858))))

(declare-fun b!244588 () Bool)

(declare-fun e!158700 () Bool)

(assert (=> b!244588 (= e!158700 tp_is_empty!6399)))

(declare-fun mapIsEmpty!10858 () Bool)

(assert (=> mapIsEmpty!10858 mapRes!10858))

(declare-fun mapNonEmpty!10858 () Bool)

(declare-fun tp!22846 () Bool)

(assert (=> mapNonEmpty!10858 (= mapRes!10858 (and tp!22846 e!158700))))

(declare-fun mapKey!10858 () (_ BitVec 32))

(declare-fun mapValue!10858 () ValueCell!2856)

(declare-fun mapRest!10858 () (Array (_ BitVec 32) ValueCell!2856))

(assert (=> mapNonEmpty!10858 (= mapRest!10852 (store mapRest!10858 mapKey!10858 mapValue!10858))))

(assert (= (and mapNonEmpty!10852 condMapEmpty!10858) mapIsEmpty!10858))

(assert (= (and mapNonEmpty!10852 (not condMapEmpty!10858)) mapNonEmpty!10858))

(assert (= (and mapNonEmpty!10858 ((_ is ValueCellFull!2856) mapValue!10858)) b!244588))

(assert (= (and mapNonEmpty!10852 ((_ is ValueCellFull!2856) mapDefault!10858)) b!244589))

(declare-fun m!262535 () Bool)

(assert (=> mapNonEmpty!10858 m!262535))

(declare-fun b_lambda!8017 () Bool)

(assert (= b_lambda!8015 (or (and b!244305 b_free!6537) b_lambda!8017)))

(check-sat (not b!244549) (not b!244563) (not d!60125) (not b!244427) (not b!244487) (not b!244439) (not b!244452) (not b!244543) (not d!60137) (not d!60131) (not bm!22797) (not d!60115) (not b!244496) (not b!244426) (not bm!22814) (not d!60113) (not bm!22815) (not bm!22816) (not d!60141) (not b!244580) (not b!244556) (not mapNonEmpty!10858) (not bm!22796) (not bm!22818) (not d!60119) (not b_lambda!8017) (not b!244551) (not d!60135) (not b!244446) (not b!244548) (not b!244555) b_and!13525 (not b!244494) (not b!244541) (not b!244484) (not b!244425) (not d!60129) (not b!244539) (not d!60139) (not b!244483) (not b!244433) (not bm!22791) (not b_next!6537) tp_is_empty!6399 (not b!244440) (not b!244485))
(check-sat b_and!13525 (not b_next!6537))
