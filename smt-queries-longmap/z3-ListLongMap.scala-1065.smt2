; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22074 () Bool)

(assert start!22074)

(declare-fun b!228781 () Bool)

(declare-fun b_free!6141 () Bool)

(declare-fun b_next!6141 () Bool)

(assert (=> b!228781 (= b_free!6141 (not b_next!6141))))

(declare-fun tp!21565 () Bool)

(declare-fun b_and!13039 () Bool)

(assert (=> b!228781 (= tp!21565 b_and!13039)))

(declare-fun b!228780 () Bool)

(declare-fun e!148430 () Bool)

(declare-fun e!148432 () Bool)

(assert (=> b!228780 (= e!148430 (not e!148432))))

(declare-fun res!112612 () Bool)

(assert (=> b!228780 (=> res!112612 e!148432)))

(declare-datatypes ((V!7651 0))(
  ( (V!7652 (val!3046 Int)) )
))
(declare-datatypes ((ValueCell!2658 0))(
  ( (ValueCellFull!2658 (v!5066 V!7651)) (EmptyCell!2658) )
))
(declare-datatypes ((array!11249 0))(
  ( (array!11250 (arr!5344 (Array (_ BitVec 32) ValueCell!2658)) (size!5677 (_ BitVec 32))) )
))
(declare-datatypes ((array!11251 0))(
  ( (array!11252 (arr!5345 (Array (_ BitVec 32) (_ BitVec 64))) (size!5678 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3216 0))(
  ( (LongMapFixedSize!3217 (defaultEntry!4267 Int) (mask!10141 (_ BitVec 32)) (extraKeys!4004 (_ BitVec 32)) (zeroValue!4108 V!7651) (minValue!4108 V!7651) (_size!1657 (_ BitVec 32)) (_keys!6321 array!11251) (_values!4250 array!11249) (_vacant!1657 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3216)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228780 (= res!112612 (not (validMask!0 (mask!10141 thiss!1504))))))

(declare-fun lt!115094 () array!11251)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11251 (_ BitVec 32)) Bool)

(assert (=> b!228780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115094 (mask!10141 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((Unit!6963 0))(
  ( (Unit!6964) )
))
(declare-fun lt!115098 () Unit!6963)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11251 (_ BitVec 32) (_ BitVec 32)) Unit!6963)

(assert (=> b!228780 (= lt!115098 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6321 thiss!1504) index!297 (mask!10141 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11251 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228780 (= (arrayCountValidKeys!0 lt!115094 #b00000000000000000000000000000000 (size!5678 (_keys!6321 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6321 thiss!1504) #b00000000000000000000000000000000 (size!5678 (_keys!6321 thiss!1504)))))))

(declare-fun lt!115099 () Unit!6963)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11251 (_ BitVec 32) (_ BitVec 64)) Unit!6963)

(assert (=> b!228780 (= lt!115099 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6321 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3417 0))(
  ( (Nil!3414) (Cons!3413 (h!4061 (_ BitVec 64)) (t!8376 List!3417)) )
))
(declare-fun arrayNoDuplicates!0 (array!11251 (_ BitVec 32) List!3417) Bool)

(assert (=> b!228780 (arrayNoDuplicates!0 lt!115094 #b00000000000000000000000000000000 Nil!3414)))

(assert (=> b!228780 (= lt!115094 (array!11252 (store (arr!5345 (_keys!6321 thiss!1504)) index!297 key!932) (size!5678 (_keys!6321 thiss!1504))))))

(declare-fun lt!115090 () Unit!6963)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11251 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3417) Unit!6963)

(assert (=> b!228780 (= lt!115090 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6321 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3414))))

(declare-fun lt!115091 () Unit!6963)

(declare-fun e!148437 () Unit!6963)

(assert (=> b!228780 (= lt!115091 e!148437)))

(declare-fun c!37943 () Bool)

(declare-fun arrayContainsKey!0 (array!11251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228780 (= c!37943 (arrayContainsKey!0 (_keys!6321 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun tp_is_empty!6003 () Bool)

(declare-fun e!148436 () Bool)

(declare-fun e!148429 () Bool)

(declare-fun array_inv!3529 (array!11251) Bool)

(declare-fun array_inv!3530 (array!11249) Bool)

(assert (=> b!228781 (= e!148436 (and tp!21565 tp_is_empty!6003 (array_inv!3529 (_keys!6321 thiss!1504)) (array_inv!3530 (_values!4250 thiss!1504)) e!148429))))

(declare-fun b!228782 () Bool)

(declare-fun res!112606 () Bool)

(declare-fun e!148427 () Bool)

(assert (=> b!228782 (=> (not res!112606) (not e!148427))))

(declare-datatypes ((SeekEntryResult!912 0))(
  ( (MissingZero!912 (index!5818 (_ BitVec 32))) (Found!912 (index!5819 (_ BitVec 32))) (Intermediate!912 (undefined!1724 Bool) (index!5820 (_ BitVec 32)) (x!23348 (_ BitVec 32))) (Undefined!912) (MissingVacant!912 (index!5821 (_ BitVec 32))) )
))
(declare-fun lt!115097 () SeekEntryResult!912)

(assert (=> b!228782 (= res!112606 (= (select (arr!5345 (_keys!6321 thiss!1504)) (index!5818 lt!115097)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!228783 () Bool)

(declare-fun e!148434 () Bool)

(assert (=> b!228783 (= e!148434 tp_is_empty!6003)))

(declare-fun b!228784 () Bool)

(declare-fun Unit!6965 () Unit!6963)

(assert (=> b!228784 (= e!148437 Unit!6965)))

(declare-fun lt!115100 () Unit!6963)

(declare-fun lemmaArrayContainsKeyThenInListMap!111 (array!11251 array!11249 (_ BitVec 32) (_ BitVec 32) V!7651 V!7651 (_ BitVec 64) (_ BitVec 32) Int) Unit!6963)

(assert (=> b!228784 (= lt!115100 (lemmaArrayContainsKeyThenInListMap!111 (_keys!6321 thiss!1504) (_values!4250 thiss!1504) (mask!10141 thiss!1504) (extraKeys!4004 thiss!1504) (zeroValue!4108 thiss!1504) (minValue!4108 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4267 thiss!1504)))))

(assert (=> b!228784 false))

(declare-fun mapIsEmpty!10174 () Bool)

(declare-fun mapRes!10174 () Bool)

(assert (=> mapIsEmpty!10174 mapRes!10174))

(declare-fun b!228785 () Bool)

(declare-fun res!112602 () Bool)

(assert (=> b!228785 (=> res!112602 e!148432)))

(assert (=> b!228785 (= res!112602 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6321 thiss!1504) (mask!10141 thiss!1504))))))

(declare-fun b!228786 () Bool)

(assert (=> b!228786 (= e!148432 true)))

(declare-fun lt!115096 () Bool)

(assert (=> b!228786 (= lt!115096 (arrayNoDuplicates!0 (_keys!6321 thiss!1504) #b00000000000000000000000000000000 Nil!3414))))

(declare-fun b!228787 () Bool)

(declare-fun res!112607 () Bool)

(assert (=> b!228787 (=> (not res!112607) (not e!148427))))

(declare-fun call!21257 () Bool)

(assert (=> b!228787 (= res!112607 call!21257)))

(declare-fun e!148438 () Bool)

(assert (=> b!228787 (= e!148438 e!148427)))

(declare-fun b!228788 () Bool)

(declare-fun e!148433 () Bool)

(declare-fun e!148439 () Bool)

(assert (=> b!228788 (= e!148433 e!148439)))

(declare-fun res!112604 () Bool)

(assert (=> b!228788 (=> (not res!112604) (not e!148439))))

(assert (=> b!228788 (= res!112604 (or (= lt!115097 (MissingZero!912 index!297)) (= lt!115097 (MissingVacant!912 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11251 (_ BitVec 32)) SeekEntryResult!912)

(assert (=> b!228788 (= lt!115097 (seekEntryOrOpen!0 key!932 (_keys!6321 thiss!1504) (mask!10141 thiss!1504)))))

(declare-fun bm!21254 () Bool)

(declare-fun c!37941 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21254 (= call!21257 (inRange!0 (ite c!37941 (index!5818 lt!115097) (index!5821 lt!115097)) (mask!10141 thiss!1504)))))

(declare-fun res!112609 () Bool)

(assert (=> start!22074 (=> (not res!112609) (not e!148433))))

(declare-fun valid!1284 (LongMapFixedSize!3216) Bool)

(assert (=> start!22074 (= res!112609 (valid!1284 thiss!1504))))

(assert (=> start!22074 e!148433))

(assert (=> start!22074 e!148436))

(assert (=> start!22074 true))

(declare-fun b!228789 () Bool)

(declare-fun Unit!6966 () Unit!6963)

(assert (=> b!228789 (= e!148437 Unit!6966)))

(declare-fun b!228790 () Bool)

(declare-fun e!148428 () Unit!6963)

(declare-fun Unit!6967 () Unit!6963)

(assert (=> b!228790 (= e!148428 Unit!6967)))

(declare-fun lt!115092 () Unit!6963)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!275 (array!11251 array!11249 (_ BitVec 32) (_ BitVec 32) V!7651 V!7651 (_ BitVec 64) Int) Unit!6963)

(assert (=> b!228790 (= lt!115092 (lemmaInListMapThenSeekEntryOrOpenFindsIt!275 (_keys!6321 thiss!1504) (_values!4250 thiss!1504) (mask!10141 thiss!1504) (extraKeys!4004 thiss!1504) (zeroValue!4108 thiss!1504) (minValue!4108 thiss!1504) key!932 (defaultEntry!4267 thiss!1504)))))

(assert (=> b!228790 false))

(declare-fun b!228791 () Bool)

(declare-fun call!21258 () Bool)

(assert (=> b!228791 (= e!148427 (not call!21258))))

(declare-fun b!228792 () Bool)

(declare-fun res!112603 () Bool)

(assert (=> b!228792 (=> (not res!112603) (not e!148433))))

(assert (=> b!228792 (= res!112603 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228793 () Bool)

(declare-fun e!148431 () Bool)

(declare-fun e!148425 () Bool)

(assert (=> b!228793 (= e!148431 e!148425)))

(declare-fun res!112605 () Bool)

(assert (=> b!228793 (= res!112605 call!21257)))

(assert (=> b!228793 (=> (not res!112605) (not e!148425))))

(declare-fun b!228794 () Bool)

(declare-fun e!148435 () Bool)

(assert (=> b!228794 (= e!148435 tp_is_empty!6003)))

(declare-fun b!228795 () Bool)

(declare-fun res!112610 () Bool)

(assert (=> b!228795 (=> res!112610 e!148432)))

(assert (=> b!228795 (= res!112610 (or (not (= (size!5677 (_values!4250 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10141 thiss!1504)))) (not (= (size!5678 (_keys!6321 thiss!1504)) (size!5677 (_values!4250 thiss!1504)))) (bvslt (mask!10141 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4004 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4004 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228796 () Bool)

(declare-fun lt!115093 () Unit!6963)

(assert (=> b!228796 (= e!148428 lt!115093)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!290 (array!11251 array!11249 (_ BitVec 32) (_ BitVec 32) V!7651 V!7651 (_ BitVec 64) Int) Unit!6963)

(assert (=> b!228796 (= lt!115093 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!290 (_keys!6321 thiss!1504) (_values!4250 thiss!1504) (mask!10141 thiss!1504) (extraKeys!4004 thiss!1504) (zeroValue!4108 thiss!1504) (minValue!4108 thiss!1504) key!932 (defaultEntry!4267 thiss!1504)))))

(get-info :version)

(assert (=> b!228796 (= c!37941 ((_ is MissingZero!912) lt!115097))))

(assert (=> b!228796 e!148438))

(declare-fun bm!21255 () Bool)

(assert (=> bm!21255 (= call!21258 (arrayContainsKey!0 (_keys!6321 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228797 () Bool)

(declare-fun res!112608 () Bool)

(assert (=> b!228797 (= res!112608 (= (select (arr!5345 (_keys!6321 thiss!1504)) (index!5821 lt!115097)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228797 (=> (not res!112608) (not e!148425))))

(declare-fun b!228798 () Bool)

(assert (=> b!228798 (= e!148429 (and e!148434 mapRes!10174))))

(declare-fun condMapEmpty!10174 () Bool)

(declare-fun mapDefault!10174 () ValueCell!2658)

(assert (=> b!228798 (= condMapEmpty!10174 (= (arr!5344 (_values!4250 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2658)) mapDefault!10174)))))

(declare-fun b!228799 () Bool)

(assert (=> b!228799 (= e!148431 ((_ is Undefined!912) lt!115097))))

(declare-fun b!228800 () Bool)

(assert (=> b!228800 (= e!148439 e!148430)))

(declare-fun res!112611 () Bool)

(assert (=> b!228800 (=> (not res!112611) (not e!148430))))

(assert (=> b!228800 (= res!112611 (inRange!0 index!297 (mask!10141 thiss!1504)))))

(declare-fun lt!115095 () Unit!6963)

(assert (=> b!228800 (= lt!115095 e!148428)))

(declare-fun c!37944 () Bool)

(declare-datatypes ((tuple2!4494 0))(
  ( (tuple2!4495 (_1!2258 (_ BitVec 64)) (_2!2258 V!7651)) )
))
(declare-datatypes ((List!3418 0))(
  ( (Nil!3415) (Cons!3414 (h!4062 tuple2!4494) (t!8377 List!3418)) )
))
(declare-datatypes ((ListLongMap!3407 0))(
  ( (ListLongMap!3408 (toList!1719 List!3418)) )
))
(declare-fun contains!1593 (ListLongMap!3407 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1247 (array!11251 array!11249 (_ BitVec 32) (_ BitVec 32) V!7651 V!7651 (_ BitVec 32) Int) ListLongMap!3407)

(assert (=> b!228800 (= c!37944 (contains!1593 (getCurrentListMap!1247 (_keys!6321 thiss!1504) (_values!4250 thiss!1504) (mask!10141 thiss!1504) (extraKeys!4004 thiss!1504) (zeroValue!4108 thiss!1504) (minValue!4108 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4267 thiss!1504)) key!932))))

(declare-fun b!228801 () Bool)

(declare-fun c!37942 () Bool)

(assert (=> b!228801 (= c!37942 ((_ is MissingVacant!912) lt!115097))))

(assert (=> b!228801 (= e!148438 e!148431)))

(declare-fun mapNonEmpty!10174 () Bool)

(declare-fun tp!21564 () Bool)

(assert (=> mapNonEmpty!10174 (= mapRes!10174 (and tp!21564 e!148435))))

(declare-fun mapRest!10174 () (Array (_ BitVec 32) ValueCell!2658))

(declare-fun mapKey!10174 () (_ BitVec 32))

(declare-fun mapValue!10174 () ValueCell!2658)

(assert (=> mapNonEmpty!10174 (= (arr!5344 (_values!4250 thiss!1504)) (store mapRest!10174 mapKey!10174 mapValue!10174))))

(declare-fun b!228802 () Bool)

(assert (=> b!228802 (= e!148425 (not call!21258))))

(assert (= (and start!22074 res!112609) b!228792))

(assert (= (and b!228792 res!112603) b!228788))

(assert (= (and b!228788 res!112604) b!228800))

(assert (= (and b!228800 c!37944) b!228790))

(assert (= (and b!228800 (not c!37944)) b!228796))

(assert (= (and b!228796 c!37941) b!228787))

(assert (= (and b!228796 (not c!37941)) b!228801))

(assert (= (and b!228787 res!112607) b!228782))

(assert (= (and b!228782 res!112606) b!228791))

(assert (= (and b!228801 c!37942) b!228793))

(assert (= (and b!228801 (not c!37942)) b!228799))

(assert (= (and b!228793 res!112605) b!228797))

(assert (= (and b!228797 res!112608) b!228802))

(assert (= (or b!228787 b!228793) bm!21254))

(assert (= (or b!228791 b!228802) bm!21255))

(assert (= (and b!228800 res!112611) b!228780))

(assert (= (and b!228780 c!37943) b!228784))

(assert (= (and b!228780 (not c!37943)) b!228789))

(assert (= (and b!228780 (not res!112612)) b!228795))

(assert (= (and b!228795 (not res!112610)) b!228785))

(assert (= (and b!228785 (not res!112602)) b!228786))

(assert (= (and b!228798 condMapEmpty!10174) mapIsEmpty!10174))

(assert (= (and b!228798 (not condMapEmpty!10174)) mapNonEmpty!10174))

(assert (= (and mapNonEmpty!10174 ((_ is ValueCellFull!2658) mapValue!10174)) b!228794))

(assert (= (and b!228798 ((_ is ValueCellFull!2658) mapDefault!10174)) b!228783))

(assert (= b!228781 b!228798))

(assert (= start!22074 b!228781))

(declare-fun m!250455 () Bool)

(assert (=> bm!21255 m!250455))

(declare-fun m!250457 () Bool)

(assert (=> bm!21254 m!250457))

(declare-fun m!250459 () Bool)

(assert (=> b!228797 m!250459))

(declare-fun m!250461 () Bool)

(assert (=> b!228780 m!250461))

(assert (=> b!228780 m!250455))

(declare-fun m!250463 () Bool)

(assert (=> b!228780 m!250463))

(declare-fun m!250465 () Bool)

(assert (=> b!228780 m!250465))

(declare-fun m!250467 () Bool)

(assert (=> b!228780 m!250467))

(declare-fun m!250469 () Bool)

(assert (=> b!228780 m!250469))

(declare-fun m!250471 () Bool)

(assert (=> b!228780 m!250471))

(declare-fun m!250473 () Bool)

(assert (=> b!228780 m!250473))

(declare-fun m!250475 () Bool)

(assert (=> b!228780 m!250475))

(declare-fun m!250477 () Bool)

(assert (=> b!228780 m!250477))

(declare-fun m!250479 () Bool)

(assert (=> b!228800 m!250479))

(declare-fun m!250481 () Bool)

(assert (=> b!228800 m!250481))

(assert (=> b!228800 m!250481))

(declare-fun m!250483 () Bool)

(assert (=> b!228800 m!250483))

(declare-fun m!250485 () Bool)

(assert (=> b!228782 m!250485))

(declare-fun m!250487 () Bool)

(assert (=> b!228781 m!250487))

(declare-fun m!250489 () Bool)

(assert (=> b!228781 m!250489))

(declare-fun m!250491 () Bool)

(assert (=> b!228786 m!250491))

(declare-fun m!250493 () Bool)

(assert (=> b!228796 m!250493))

(declare-fun m!250495 () Bool)

(assert (=> b!228790 m!250495))

(declare-fun m!250497 () Bool)

(assert (=> start!22074 m!250497))

(declare-fun m!250499 () Bool)

(assert (=> b!228785 m!250499))

(declare-fun m!250501 () Bool)

(assert (=> mapNonEmpty!10174 m!250501))

(declare-fun m!250503 () Bool)

(assert (=> b!228784 m!250503))

(declare-fun m!250505 () Bool)

(assert (=> b!228788 m!250505))

(check-sat (not b!228784) (not bm!21254) (not start!22074) (not b!228788) (not b!228800) (not b!228781) (not bm!21255) (not b!228780) (not b!228785) (not b!228796) tp_is_empty!6003 (not b_next!6141) b_and!13039 (not mapNonEmpty!10174) (not b!228790) (not b!228786))
(check-sat b_and!13039 (not b_next!6141))
