; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22070 () Bool)

(assert start!22070)

(declare-fun b!228553 () Bool)

(declare-fun b_free!6133 () Bool)

(declare-fun b_next!6133 () Bool)

(assert (=> b!228553 (= b_free!6133 (not b_next!6133))))

(declare-fun tp!21540 () Bool)

(declare-fun b_and!13045 () Bool)

(assert (=> b!228553 (= tp!21540 b_and!13045)))

(declare-fun b!228551 () Bool)

(declare-fun c!37907 () Bool)

(declare-datatypes ((SeekEntryResult!879 0))(
  ( (MissingZero!879 (index!5686 (_ BitVec 32))) (Found!879 (index!5687 (_ BitVec 32))) (Intermediate!879 (undefined!1691 Bool) (index!5688 (_ BitVec 32)) (x!23307 (_ BitVec 32))) (Undefined!879) (MissingVacant!879 (index!5689 (_ BitVec 32))) )
))
(declare-fun lt!115026 () SeekEntryResult!879)

(get-info :version)

(assert (=> b!228551 (= c!37907 ((_ is MissingVacant!879) lt!115026))))

(declare-fun e!148275 () Bool)

(declare-fun e!148283 () Bool)

(assert (=> b!228551 (= e!148275 e!148283)))

(declare-fun e!148277 () Bool)

(declare-fun tp_is_empty!5995 () Bool)

(declare-datatypes ((V!7641 0))(
  ( (V!7642 (val!3042 Int)) )
))
(declare-datatypes ((ValueCell!2654 0))(
  ( (ValueCellFull!2654 (v!5063 V!7641)) (EmptyCell!2654) )
))
(declare-datatypes ((array!11231 0))(
  ( (array!11232 (arr!5335 (Array (_ BitVec 32) ValueCell!2654)) (size!5668 (_ BitVec 32))) )
))
(declare-datatypes ((array!11233 0))(
  ( (array!11234 (arr!5336 (Array (_ BitVec 32) (_ BitVec 64))) (size!5669 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3208 0))(
  ( (LongMapFixedSize!3209 (defaultEntry!4263 Int) (mask!10135 (_ BitVec 32)) (extraKeys!4000 (_ BitVec 32)) (zeroValue!4104 V!7641) (minValue!4104 V!7641) (_size!1653 (_ BitVec 32)) (_keys!6317 array!11233) (_values!4246 array!11231) (_vacant!1653 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3208)

(declare-fun e!148271 () Bool)

(declare-fun array_inv!3503 (array!11233) Bool)

(declare-fun array_inv!3504 (array!11231) Bool)

(assert (=> b!228553 (= e!148271 (and tp!21540 tp_is_empty!5995 (array_inv!3503 (_keys!6317 thiss!1504)) (array_inv!3504 (_values!4246 thiss!1504)) e!148277))))

(declare-fun b!228554 () Bool)

(declare-datatypes ((Unit!6927 0))(
  ( (Unit!6928) )
))
(declare-fun e!148276 () Unit!6927)

(declare-fun Unit!6929 () Unit!6927)

(assert (=> b!228554 (= e!148276 Unit!6929)))

(declare-fun lt!115019 () Unit!6927)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!273 (array!11233 array!11231 (_ BitVec 32) (_ BitVec 32) V!7641 V!7641 (_ BitVec 64) Int) Unit!6927)

(assert (=> b!228554 (= lt!115019 (lemmaInListMapThenSeekEntryOrOpenFindsIt!273 (_keys!6317 thiss!1504) (_values!4246 thiss!1504) (mask!10135 thiss!1504) (extraKeys!4000 thiss!1504) (zeroValue!4104 thiss!1504) (minValue!4104 thiss!1504) key!932 (defaultEntry!4263 thiss!1504)))))

(assert (=> b!228554 false))

(declare-fun bm!21218 () Bool)

(declare-fun call!21221 () Bool)

(declare-fun arrayContainsKey!0 (array!11233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21218 (= call!21221 (arrayContainsKey!0 (_keys!6317 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228555 () Bool)

(declare-fun res!112501 () Bool)

(declare-fun e!148279 () Bool)

(assert (=> b!228555 (=> (not res!112501) (not e!148279))))

(assert (=> b!228555 (= res!112501 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228556 () Bool)

(declare-fun e!148281 () Bool)

(assert (=> b!228556 (= e!148281 (not call!21221))))

(declare-fun b!228557 () Bool)

(declare-fun lt!115022 () Unit!6927)

(assert (=> b!228557 (= e!148276 lt!115022)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!267 (array!11233 array!11231 (_ BitVec 32) (_ BitVec 32) V!7641 V!7641 (_ BitVec 64) Int) Unit!6927)

(assert (=> b!228557 (= lt!115022 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!267 (_keys!6317 thiss!1504) (_values!4246 thiss!1504) (mask!10135 thiss!1504) (extraKeys!4000 thiss!1504) (zeroValue!4104 thiss!1504) (minValue!4104 thiss!1504) key!932 (defaultEntry!4263 thiss!1504)))))

(declare-fun c!37909 () Bool)

(assert (=> b!228557 (= c!37909 ((_ is MissingZero!879) lt!115026))))

(assert (=> b!228557 e!148275))

(declare-fun mapIsEmpty!10162 () Bool)

(declare-fun mapRes!10162 () Bool)

(assert (=> mapIsEmpty!10162 mapRes!10162))

(declare-fun res!112491 () Bool)

(assert (=> start!22070 (=> (not res!112491) (not e!148279))))

(declare-fun valid!1291 (LongMapFixedSize!3208) Bool)

(assert (=> start!22070 (= res!112491 (valid!1291 thiss!1504))))

(assert (=> start!22070 e!148279))

(assert (=> start!22070 e!148271))

(assert (=> start!22070 true))

(declare-fun b!228552 () Bool)

(declare-fun e!148278 () Bool)

(assert (=> b!228552 (= e!148278 (not call!21221))))

(declare-fun b!228558 () Bool)

(declare-fun e!148269 () Unit!6927)

(declare-fun Unit!6930 () Unit!6927)

(assert (=> b!228558 (= e!148269 Unit!6930)))

(declare-fun b!228559 () Bool)

(declare-fun e!148280 () Bool)

(assert (=> b!228559 (= e!148280 tp_is_empty!5995)))

(declare-fun mapNonEmpty!10162 () Bool)

(declare-fun tp!21541 () Bool)

(assert (=> mapNonEmpty!10162 (= mapRes!10162 (and tp!21541 e!148280))))

(declare-fun mapRest!10162 () (Array (_ BitVec 32) ValueCell!2654))

(declare-fun mapValue!10162 () ValueCell!2654)

(declare-fun mapKey!10162 () (_ BitVec 32))

(assert (=> mapNonEmpty!10162 (= (arr!5335 (_values!4246 thiss!1504)) (store mapRest!10162 mapKey!10162 mapValue!10162))))

(declare-fun b!228560 () Bool)

(declare-fun e!148273 () Bool)

(declare-fun e!148274 () Bool)

(assert (=> b!228560 (= e!148273 (not e!148274))))

(declare-fun res!112495 () Bool)

(assert (=> b!228560 (=> res!112495 e!148274)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228560 (= res!112495 (not (validMask!0 (mask!10135 thiss!1504))))))

(declare-fun lt!115027 () array!11233)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11233 (_ BitVec 32)) Bool)

(assert (=> b!228560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115027 (mask!10135 thiss!1504))))

(declare-fun lt!115021 () Unit!6927)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11233 (_ BitVec 32) (_ BitVec 32)) Unit!6927)

(assert (=> b!228560 (= lt!115021 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6317 thiss!1504) index!297 (mask!10135 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11233 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228560 (= (arrayCountValidKeys!0 lt!115027 #b00000000000000000000000000000000 (size!5669 (_keys!6317 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6317 thiss!1504) #b00000000000000000000000000000000 (size!5669 (_keys!6317 thiss!1504)))))))

(declare-fun lt!115020 () Unit!6927)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11233 (_ BitVec 32) (_ BitVec 64)) Unit!6927)

(assert (=> b!228560 (= lt!115020 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6317 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3330 0))(
  ( (Nil!3327) (Cons!3326 (h!3974 (_ BitVec 64)) (t!8281 List!3330)) )
))
(declare-fun arrayNoDuplicates!0 (array!11233 (_ BitVec 32) List!3330) Bool)

(assert (=> b!228560 (arrayNoDuplicates!0 lt!115027 #b00000000000000000000000000000000 Nil!3327)))

(assert (=> b!228560 (= lt!115027 (array!11234 (store (arr!5336 (_keys!6317 thiss!1504)) index!297 key!932) (size!5669 (_keys!6317 thiss!1504))))))

(declare-fun lt!115025 () Unit!6927)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11233 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3330) Unit!6927)

(assert (=> b!228560 (= lt!115025 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6317 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3327))))

(declare-fun lt!115024 () Unit!6927)

(assert (=> b!228560 (= lt!115024 e!148269)))

(declare-fun c!37908 () Bool)

(assert (=> b!228560 (= c!37908 (arrayContainsKey!0 (_keys!6317 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228561 () Bool)

(declare-fun e!148282 () Bool)

(assert (=> b!228561 (= e!148277 (and e!148282 mapRes!10162))))

(declare-fun condMapEmpty!10162 () Bool)

(declare-fun mapDefault!10162 () ValueCell!2654)

(assert (=> b!228561 (= condMapEmpty!10162 (= (arr!5335 (_values!4246 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2654)) mapDefault!10162)))))

(declare-fun b!228562 () Bool)

(declare-fun res!112493 () Bool)

(assert (=> b!228562 (=> (not res!112493) (not e!148278))))

(assert (=> b!228562 (= res!112493 (= (select (arr!5336 (_keys!6317 thiss!1504)) (index!5686 lt!115026)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!228563 () Bool)

(declare-fun e!148270 () Bool)

(assert (=> b!228563 (= e!148270 e!148273)))

(declare-fun res!112492 () Bool)

(assert (=> b!228563 (=> (not res!112492) (not e!148273))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228563 (= res!112492 (inRange!0 index!297 (mask!10135 thiss!1504)))))

(declare-fun lt!115018 () Unit!6927)

(assert (=> b!228563 (= lt!115018 e!148276)))

(declare-fun c!37906 () Bool)

(declare-datatypes ((tuple2!4416 0))(
  ( (tuple2!4417 (_1!2219 (_ BitVec 64)) (_2!2219 V!7641)) )
))
(declare-datatypes ((List!3331 0))(
  ( (Nil!3328) (Cons!3327 (h!3975 tuple2!4416) (t!8282 List!3331)) )
))
(declare-datatypes ((ListLongMap!3331 0))(
  ( (ListLongMap!3332 (toList!1681 List!3331)) )
))
(declare-fun contains!1570 (ListLongMap!3331 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1213 (array!11233 array!11231 (_ BitVec 32) (_ BitVec 32) V!7641 V!7641 (_ BitVec 32) Int) ListLongMap!3331)

(assert (=> b!228563 (= c!37906 (contains!1570 (getCurrentListMap!1213 (_keys!6317 thiss!1504) (_values!4246 thiss!1504) (mask!10135 thiss!1504) (extraKeys!4000 thiss!1504) (zeroValue!4104 thiss!1504) (minValue!4104 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4263 thiss!1504)) key!932))))

(declare-fun b!228564 () Bool)

(assert (=> b!228564 (= e!148279 e!148270)))

(declare-fun res!112496 () Bool)

(assert (=> b!228564 (=> (not res!112496) (not e!148270))))

(assert (=> b!228564 (= res!112496 (or (= lt!115026 (MissingZero!879 index!297)) (= lt!115026 (MissingVacant!879 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11233 (_ BitVec 32)) SeekEntryResult!879)

(assert (=> b!228564 (= lt!115026 (seekEntryOrOpen!0 key!932 (_keys!6317 thiss!1504) (mask!10135 thiss!1504)))))

(declare-fun b!228565 () Bool)

(declare-fun res!112499 () Bool)

(assert (=> b!228565 (=> res!112499 e!148274)))

(assert (=> b!228565 (= res!112499 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6317 thiss!1504) (mask!10135 thiss!1504))))))

(declare-fun b!228566 () Bool)

(assert (=> b!228566 (= e!148282 tp_is_empty!5995)))

(declare-fun b!228567 () Bool)

(declare-fun res!112497 () Bool)

(assert (=> b!228567 (=> (not res!112497) (not e!148278))))

(declare-fun call!21222 () Bool)

(assert (=> b!228567 (= res!112497 call!21222)))

(assert (=> b!228567 (= e!148275 e!148278)))

(declare-fun b!228568 () Bool)

(assert (=> b!228568 (= e!148283 e!148281)))

(declare-fun res!112494 () Bool)

(assert (=> b!228568 (= res!112494 call!21222)))

(assert (=> b!228568 (=> (not res!112494) (not e!148281))))

(declare-fun b!228569 () Bool)

(assert (=> b!228569 (= e!148283 ((_ is Undefined!879) lt!115026))))

(declare-fun b!228570 () Bool)

(assert (=> b!228570 (= e!148274 true)))

(declare-fun lt!115023 () Bool)

(assert (=> b!228570 (= lt!115023 (arrayNoDuplicates!0 (_keys!6317 thiss!1504) #b00000000000000000000000000000000 Nil!3327))))

(declare-fun bm!21219 () Bool)

(assert (=> bm!21219 (= call!21222 (inRange!0 (ite c!37909 (index!5686 lt!115026) (index!5689 lt!115026)) (mask!10135 thiss!1504)))))

(declare-fun b!228571 () Bool)

(declare-fun Unit!6931 () Unit!6927)

(assert (=> b!228571 (= e!148269 Unit!6931)))

(declare-fun lt!115017 () Unit!6927)

(declare-fun lemmaArrayContainsKeyThenInListMap!114 (array!11233 array!11231 (_ BitVec 32) (_ BitVec 32) V!7641 V!7641 (_ BitVec 64) (_ BitVec 32) Int) Unit!6927)

(assert (=> b!228571 (= lt!115017 (lemmaArrayContainsKeyThenInListMap!114 (_keys!6317 thiss!1504) (_values!4246 thiss!1504) (mask!10135 thiss!1504) (extraKeys!4000 thiss!1504) (zeroValue!4104 thiss!1504) (minValue!4104 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4263 thiss!1504)))))

(assert (=> b!228571 false))

(declare-fun b!228572 () Bool)

(declare-fun res!112500 () Bool)

(assert (=> b!228572 (= res!112500 (= (select (arr!5336 (_keys!6317 thiss!1504)) (index!5689 lt!115026)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228572 (=> (not res!112500) (not e!148281))))

(declare-fun b!228573 () Bool)

(declare-fun res!112498 () Bool)

(assert (=> b!228573 (=> res!112498 e!148274)))

(assert (=> b!228573 (= res!112498 (or (not (= (size!5668 (_values!4246 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10135 thiss!1504)))) (not (= (size!5669 (_keys!6317 thiss!1504)) (size!5668 (_values!4246 thiss!1504)))) (bvslt (mask!10135 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4000 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4000 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!22070 res!112491) b!228555))

(assert (= (and b!228555 res!112501) b!228564))

(assert (= (and b!228564 res!112496) b!228563))

(assert (= (and b!228563 c!37906) b!228554))

(assert (= (and b!228563 (not c!37906)) b!228557))

(assert (= (and b!228557 c!37909) b!228567))

(assert (= (and b!228557 (not c!37909)) b!228551))

(assert (= (and b!228567 res!112497) b!228562))

(assert (= (and b!228562 res!112493) b!228552))

(assert (= (and b!228551 c!37907) b!228568))

(assert (= (and b!228551 (not c!37907)) b!228569))

(assert (= (and b!228568 res!112494) b!228572))

(assert (= (and b!228572 res!112500) b!228556))

(assert (= (or b!228567 b!228568) bm!21219))

(assert (= (or b!228552 b!228556) bm!21218))

(assert (= (and b!228563 res!112492) b!228560))

(assert (= (and b!228560 c!37908) b!228571))

(assert (= (and b!228560 (not c!37908)) b!228558))

(assert (= (and b!228560 (not res!112495)) b!228573))

(assert (= (and b!228573 (not res!112498)) b!228565))

(assert (= (and b!228565 (not res!112499)) b!228570))

(assert (= (and b!228561 condMapEmpty!10162) mapIsEmpty!10162))

(assert (= (and b!228561 (not condMapEmpty!10162)) mapNonEmpty!10162))

(assert (= (and mapNonEmpty!10162 ((_ is ValueCellFull!2654) mapValue!10162)) b!228559))

(assert (= (and b!228561 ((_ is ValueCellFull!2654) mapDefault!10162)) b!228566))

(assert (= b!228553 b!228561))

(assert (= start!22070 b!228553))

(declare-fun m!250429 () Bool)

(assert (=> start!22070 m!250429))

(declare-fun m!250431 () Bool)

(assert (=> b!228560 m!250431))

(declare-fun m!250433 () Bool)

(assert (=> b!228560 m!250433))

(declare-fun m!250435 () Bool)

(assert (=> b!228560 m!250435))

(declare-fun m!250437 () Bool)

(assert (=> b!228560 m!250437))

(declare-fun m!250439 () Bool)

(assert (=> b!228560 m!250439))

(declare-fun m!250441 () Bool)

(assert (=> b!228560 m!250441))

(declare-fun m!250443 () Bool)

(assert (=> b!228560 m!250443))

(declare-fun m!250445 () Bool)

(assert (=> b!228560 m!250445))

(declare-fun m!250447 () Bool)

(assert (=> b!228560 m!250447))

(declare-fun m!250449 () Bool)

(assert (=> b!228560 m!250449))

(declare-fun m!250451 () Bool)

(assert (=> bm!21219 m!250451))

(declare-fun m!250453 () Bool)

(assert (=> b!228557 m!250453))

(declare-fun m!250455 () Bool)

(assert (=> b!228563 m!250455))

(declare-fun m!250457 () Bool)

(assert (=> b!228563 m!250457))

(assert (=> b!228563 m!250457))

(declare-fun m!250459 () Bool)

(assert (=> b!228563 m!250459))

(declare-fun m!250461 () Bool)

(assert (=> mapNonEmpty!10162 m!250461))

(declare-fun m!250463 () Bool)

(assert (=> b!228562 m!250463))

(declare-fun m!250465 () Bool)

(assert (=> b!228553 m!250465))

(declare-fun m!250467 () Bool)

(assert (=> b!228553 m!250467))

(declare-fun m!250469 () Bool)

(assert (=> b!228571 m!250469))

(declare-fun m!250471 () Bool)

(assert (=> b!228570 m!250471))

(declare-fun m!250473 () Bool)

(assert (=> b!228564 m!250473))

(assert (=> bm!21218 m!250433))

(declare-fun m!250475 () Bool)

(assert (=> b!228565 m!250475))

(declare-fun m!250477 () Bool)

(assert (=> b!228572 m!250477))

(declare-fun m!250479 () Bool)

(assert (=> b!228554 m!250479))

(check-sat (not b!228570) (not b!228557) (not b!228560) tp_is_empty!5995 (not b!228564) (not b!228571) (not b!228554) (not start!22070) b_and!13045 (not bm!21219) (not b_next!6133) (not b!228553) (not mapNonEmpty!10162) (not b!228565) (not bm!21218) (not b!228563))
(check-sat b_and!13045 (not b_next!6133))
