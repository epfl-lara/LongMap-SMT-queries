; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22122 () Bool)

(assert start!22122)

(declare-fun b!230353 () Bool)

(declare-fun b_free!6189 () Bool)

(declare-fun b_next!6189 () Bool)

(assert (=> b!230353 (= b_free!6189 (not b_next!6189))))

(declare-fun tp!21708 () Bool)

(declare-fun b_and!13087 () Bool)

(assert (=> b!230353 (= tp!21708 b_and!13087)))

(declare-fun b!230340 () Bool)

(declare-fun e!149486 () Bool)

(declare-fun call!21401 () Bool)

(assert (=> b!230340 (= e!149486 (not call!21401))))

(declare-fun b!230341 () Bool)

(declare-datatypes ((Unit!7050 0))(
  ( (Unit!7051) )
))
(declare-fun e!149485 () Unit!7050)

(declare-fun Unit!7052 () Unit!7050)

(assert (=> b!230341 (= e!149485 Unit!7052)))

(declare-fun b!230342 () Bool)

(declare-fun e!149476 () Unit!7050)

(declare-fun lt!115916 () Unit!7050)

(assert (=> b!230342 (= e!149476 lt!115916)))

(declare-datatypes ((V!7715 0))(
  ( (V!7716 (val!3070 Int)) )
))
(declare-datatypes ((ValueCell!2682 0))(
  ( (ValueCellFull!2682 (v!5090 V!7715)) (EmptyCell!2682) )
))
(declare-datatypes ((array!11345 0))(
  ( (array!11346 (arr!5392 (Array (_ BitVec 32) ValueCell!2682)) (size!5725 (_ BitVec 32))) )
))
(declare-datatypes ((array!11347 0))(
  ( (array!11348 (arr!5393 (Array (_ BitVec 32) (_ BitVec 64))) (size!5726 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3264 0))(
  ( (LongMapFixedSize!3265 (defaultEntry!4291 Int) (mask!10181 (_ BitVec 32)) (extraKeys!4028 (_ BitVec 32)) (zeroValue!4132 V!7715) (minValue!4132 V!7715) (_size!1681 (_ BitVec 32)) (_keys!6345 array!11347) (_values!4274 array!11345) (_vacant!1681 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3264)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!306 (array!11347 array!11345 (_ BitVec 32) (_ BitVec 32) V!7715 V!7715 (_ BitVec 64) Int) Unit!7050)

(assert (=> b!230342 (= lt!115916 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!306 (_keys!6345 thiss!1504) (_values!4274 thiss!1504) (mask!10181 thiss!1504) (extraKeys!4028 thiss!1504) (zeroValue!4132 thiss!1504) (minValue!4132 thiss!1504) key!932 (defaultEntry!4291 thiss!1504)))))

(declare-fun c!38232 () Bool)

(declare-datatypes ((SeekEntryResult!936 0))(
  ( (MissingZero!936 (index!5914 (_ BitVec 32))) (Found!936 (index!5915 (_ BitVec 32))) (Intermediate!936 (undefined!1748 Bool) (index!5916 (_ BitVec 32)) (x!23436 (_ BitVec 32))) (Undefined!936) (MissingVacant!936 (index!5917 (_ BitVec 32))) )
))
(declare-fun lt!115919 () SeekEntryResult!936)

(get-info :version)

(assert (=> b!230342 (= c!38232 ((_ is MissingZero!936) lt!115919))))

(declare-fun e!149481 () Bool)

(assert (=> b!230342 e!149481))

(declare-fun b!230343 () Bool)

(declare-fun e!149474 () Bool)

(declare-fun e!149482 () Bool)

(assert (=> b!230343 (= e!149474 e!149482)))

(declare-fun res!113303 () Bool)

(assert (=> b!230343 (=> (not res!113303) (not e!149482))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230343 (= res!113303 (or (= lt!115919 (MissingZero!936 index!297)) (= lt!115919 (MissingVacant!936 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11347 (_ BitVec 32)) SeekEntryResult!936)

(assert (=> b!230343 (= lt!115919 (seekEntryOrOpen!0 key!932 (_keys!6345 thiss!1504) (mask!10181 thiss!1504)))))

(declare-fun b!230344 () Bool)

(declare-fun e!149483 () Bool)

(declare-fun tp_is_empty!6051 () Bool)

(assert (=> b!230344 (= e!149483 tp_is_empty!6051)))

(declare-fun call!21402 () Bool)

(declare-fun bm!21398 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21398 (= call!21402 (inRange!0 (ite c!38232 (index!5914 lt!115919) (index!5917 lt!115919)) (mask!10181 thiss!1504)))))

(declare-fun b!230346 () Bool)

(declare-fun e!149475 () Bool)

(assert (=> b!230346 (= e!149475 ((_ is Undefined!936) lt!115919))))

(declare-fun mapNonEmpty!10246 () Bool)

(declare-fun mapRes!10246 () Bool)

(declare-fun tp!21709 () Bool)

(declare-fun e!149480 () Bool)

(assert (=> mapNonEmpty!10246 (= mapRes!10246 (and tp!21709 e!149480))))

(declare-fun mapValue!10246 () ValueCell!2682)

(declare-fun mapRest!10246 () (Array (_ BitVec 32) ValueCell!2682))

(declare-fun mapKey!10246 () (_ BitVec 32))

(assert (=> mapNonEmpty!10246 (= (arr!5392 (_values!4274 thiss!1504)) (store mapRest!10246 mapKey!10246 mapValue!10246))))

(declare-fun mapIsEmpty!10246 () Bool)

(assert (=> mapIsEmpty!10246 mapRes!10246))

(declare-fun b!230347 () Bool)

(declare-fun res!113304 () Bool)

(declare-fun e!149477 () Bool)

(assert (=> b!230347 (=> (not res!113304) (not e!149477))))

(assert (=> b!230347 (= res!113304 (= (select (arr!5393 (_keys!6345 thiss!1504)) (index!5914 lt!115919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230348 () Bool)

(declare-fun res!113302 () Bool)

(assert (=> b!230348 (=> (not res!113302) (not e!149474))))

(assert (=> b!230348 (= res!113302 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230349 () Bool)

(assert (=> b!230349 (= e!149480 tp_is_empty!6051)))

(declare-fun b!230345 () Bool)

(declare-fun e!149473 () Bool)

(assert (=> b!230345 (= e!149473 (not true))))

(declare-fun lt!115923 () array!11347)

(declare-fun v!346 () V!7715)

(declare-datatypes ((tuple2!4530 0))(
  ( (tuple2!4531 (_1!2276 (_ BitVec 64)) (_2!2276 V!7715)) )
))
(declare-datatypes ((List!3453 0))(
  ( (Nil!3450) (Cons!3449 (h!4097 tuple2!4530) (t!8412 List!3453)) )
))
(declare-datatypes ((ListLongMap!3443 0))(
  ( (ListLongMap!3444 (toList!1737 List!3453)) )
))
(declare-fun lt!115922 () ListLongMap!3443)

(declare-fun +!605 (ListLongMap!3443 tuple2!4530) ListLongMap!3443)

(declare-fun getCurrentListMap!1265 (array!11347 array!11345 (_ BitVec 32) (_ BitVec 32) V!7715 V!7715 (_ BitVec 32) Int) ListLongMap!3443)

(assert (=> b!230345 (= (+!605 lt!115922 (tuple2!4531 key!932 v!346)) (getCurrentListMap!1265 lt!115923 (array!11346 (store (arr!5392 (_values!4274 thiss!1504)) index!297 (ValueCellFull!2682 v!346)) (size!5725 (_values!4274 thiss!1504))) (mask!10181 thiss!1504) (extraKeys!4028 thiss!1504) (zeroValue!4132 thiss!1504) (minValue!4132 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4291 thiss!1504)))))

(declare-fun lt!115918 () Unit!7050)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!59 (array!11347 array!11345 (_ BitVec 32) (_ BitVec 32) V!7715 V!7715 (_ BitVec 32) (_ BitVec 64) V!7715 Int) Unit!7050)

(assert (=> b!230345 (= lt!115918 (lemmaAddValidKeyToArrayThenAddPairToListMap!59 (_keys!6345 thiss!1504) (_values!4274 thiss!1504) (mask!10181 thiss!1504) (extraKeys!4028 thiss!1504) (zeroValue!4132 thiss!1504) (minValue!4132 thiss!1504) index!297 key!932 v!346 (defaultEntry!4291 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11347 (_ BitVec 32)) Bool)

(assert (=> b!230345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115923 (mask!10181 thiss!1504))))

(declare-fun lt!115914 () Unit!7050)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11347 (_ BitVec 32) (_ BitVec 32)) Unit!7050)

(assert (=> b!230345 (= lt!115914 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6345 thiss!1504) index!297 (mask!10181 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11347 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230345 (= (arrayCountValidKeys!0 lt!115923 #b00000000000000000000000000000000 (size!5726 (_keys!6345 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6345 thiss!1504) #b00000000000000000000000000000000 (size!5726 (_keys!6345 thiss!1504)))))))

(declare-fun lt!115917 () Unit!7050)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11347 (_ BitVec 32) (_ BitVec 64)) Unit!7050)

(assert (=> b!230345 (= lt!115917 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6345 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3454 0))(
  ( (Nil!3451) (Cons!3450 (h!4098 (_ BitVec 64)) (t!8413 List!3454)) )
))
(declare-fun arrayNoDuplicates!0 (array!11347 (_ BitVec 32) List!3454) Bool)

(assert (=> b!230345 (arrayNoDuplicates!0 lt!115923 #b00000000000000000000000000000000 Nil!3451)))

(assert (=> b!230345 (= lt!115923 (array!11348 (store (arr!5393 (_keys!6345 thiss!1504)) index!297 key!932) (size!5726 (_keys!6345 thiss!1504))))))

(declare-fun lt!115915 () Unit!7050)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3454) Unit!7050)

(assert (=> b!230345 (= lt!115915 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6345 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3451))))

(declare-fun lt!115921 () Unit!7050)

(assert (=> b!230345 (= lt!115921 e!149485)))

(declare-fun c!38229 () Bool)

(declare-fun arrayContainsKey!0 (array!11347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230345 (= c!38229 (arrayContainsKey!0 (_keys!6345 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!113298 () Bool)

(assert (=> start!22122 (=> (not res!113298) (not e!149474))))

(declare-fun valid!1300 (LongMapFixedSize!3264) Bool)

(assert (=> start!22122 (= res!113298 (valid!1300 thiss!1504))))

(assert (=> start!22122 e!149474))

(declare-fun e!149479 () Bool)

(assert (=> start!22122 e!149479))

(assert (=> start!22122 true))

(assert (=> start!22122 tp_is_empty!6051))

(declare-fun b!230350 () Bool)

(assert (=> b!230350 (= e!149477 (not call!21401))))

(declare-fun b!230351 () Bool)

(assert (=> b!230351 (= e!149482 e!149473)))

(declare-fun res!113301 () Bool)

(assert (=> b!230351 (=> (not res!113301) (not e!149473))))

(assert (=> b!230351 (= res!113301 (inRange!0 index!297 (mask!10181 thiss!1504)))))

(declare-fun lt!115920 () Unit!7050)

(assert (=> b!230351 (= lt!115920 e!149476)))

(declare-fun c!38230 () Bool)

(declare-fun contains!1610 (ListLongMap!3443 (_ BitVec 64)) Bool)

(assert (=> b!230351 (= c!38230 (contains!1610 lt!115922 key!932))))

(assert (=> b!230351 (= lt!115922 (getCurrentListMap!1265 (_keys!6345 thiss!1504) (_values!4274 thiss!1504) (mask!10181 thiss!1504) (extraKeys!4028 thiss!1504) (zeroValue!4132 thiss!1504) (minValue!4132 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4291 thiss!1504)))))

(declare-fun b!230352 () Bool)

(declare-fun res!113299 () Bool)

(assert (=> b!230352 (= res!113299 (= (select (arr!5393 (_keys!6345 thiss!1504)) (index!5917 lt!115919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230352 (=> (not res!113299) (not e!149486))))

(declare-fun e!149484 () Bool)

(declare-fun array_inv!3557 (array!11347) Bool)

(declare-fun array_inv!3558 (array!11345) Bool)

(assert (=> b!230353 (= e!149479 (and tp!21708 tp_is_empty!6051 (array_inv!3557 (_keys!6345 thiss!1504)) (array_inv!3558 (_values!4274 thiss!1504)) e!149484))))

(declare-fun bm!21399 () Bool)

(assert (=> bm!21399 (= call!21401 (arrayContainsKey!0 (_keys!6345 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230354 () Bool)

(declare-fun Unit!7053 () Unit!7050)

(assert (=> b!230354 (= e!149476 Unit!7053)))

(declare-fun lt!115925 () Unit!7050)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!290 (array!11347 array!11345 (_ BitVec 32) (_ BitVec 32) V!7715 V!7715 (_ BitVec 64) Int) Unit!7050)

(assert (=> b!230354 (= lt!115925 (lemmaInListMapThenSeekEntryOrOpenFindsIt!290 (_keys!6345 thiss!1504) (_values!4274 thiss!1504) (mask!10181 thiss!1504) (extraKeys!4028 thiss!1504) (zeroValue!4132 thiss!1504) (minValue!4132 thiss!1504) key!932 (defaultEntry!4291 thiss!1504)))))

(assert (=> b!230354 false))

(declare-fun b!230355 () Bool)

(assert (=> b!230355 (= e!149475 e!149486)))

(declare-fun res!113305 () Bool)

(assert (=> b!230355 (= res!113305 call!21402)))

(assert (=> b!230355 (=> (not res!113305) (not e!149486))))

(declare-fun b!230356 () Bool)

(declare-fun res!113300 () Bool)

(assert (=> b!230356 (=> (not res!113300) (not e!149477))))

(assert (=> b!230356 (= res!113300 call!21402)))

(assert (=> b!230356 (= e!149481 e!149477)))

(declare-fun b!230357 () Bool)

(declare-fun c!38231 () Bool)

(assert (=> b!230357 (= c!38231 ((_ is MissingVacant!936) lt!115919))))

(assert (=> b!230357 (= e!149481 e!149475)))

(declare-fun b!230358 () Bool)

(assert (=> b!230358 (= e!149484 (and e!149483 mapRes!10246))))

(declare-fun condMapEmpty!10246 () Bool)

(declare-fun mapDefault!10246 () ValueCell!2682)

(assert (=> b!230358 (= condMapEmpty!10246 (= (arr!5392 (_values!4274 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2682)) mapDefault!10246)))))

(declare-fun b!230359 () Bool)

(declare-fun Unit!7054 () Unit!7050)

(assert (=> b!230359 (= e!149485 Unit!7054)))

(declare-fun lt!115924 () Unit!7050)

(declare-fun lemmaArrayContainsKeyThenInListMap!123 (array!11347 array!11345 (_ BitVec 32) (_ BitVec 32) V!7715 V!7715 (_ BitVec 64) (_ BitVec 32) Int) Unit!7050)

(assert (=> b!230359 (= lt!115924 (lemmaArrayContainsKeyThenInListMap!123 (_keys!6345 thiss!1504) (_values!4274 thiss!1504) (mask!10181 thiss!1504) (extraKeys!4028 thiss!1504) (zeroValue!4132 thiss!1504) (minValue!4132 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4291 thiss!1504)))))

(assert (=> b!230359 false))

(assert (= (and start!22122 res!113298) b!230348))

(assert (= (and b!230348 res!113302) b!230343))

(assert (= (and b!230343 res!113303) b!230351))

(assert (= (and b!230351 c!38230) b!230354))

(assert (= (and b!230351 (not c!38230)) b!230342))

(assert (= (and b!230342 c!38232) b!230356))

(assert (= (and b!230342 (not c!38232)) b!230357))

(assert (= (and b!230356 res!113300) b!230347))

(assert (= (and b!230347 res!113304) b!230350))

(assert (= (and b!230357 c!38231) b!230355))

(assert (= (and b!230357 (not c!38231)) b!230346))

(assert (= (and b!230355 res!113305) b!230352))

(assert (= (and b!230352 res!113299) b!230340))

(assert (= (or b!230356 b!230355) bm!21398))

(assert (= (or b!230350 b!230340) bm!21399))

(assert (= (and b!230351 res!113301) b!230345))

(assert (= (and b!230345 c!38229) b!230359))

(assert (= (and b!230345 (not c!38229)) b!230341))

(assert (= (and b!230358 condMapEmpty!10246) mapIsEmpty!10246))

(assert (= (and b!230358 (not condMapEmpty!10246)) mapNonEmpty!10246))

(assert (= (and mapNonEmpty!10246 ((_ is ValueCellFull!2682) mapValue!10246)) b!230349))

(assert (= (and b!230358 ((_ is ValueCellFull!2682) mapDefault!10246)) b!230344))

(assert (= b!230353 b!230358))

(assert (= start!22122 b!230353))

(declare-fun m!251723 () Bool)

(assert (=> b!230354 m!251723))

(declare-fun m!251725 () Bool)

(assert (=> b!230351 m!251725))

(declare-fun m!251727 () Bool)

(assert (=> b!230351 m!251727))

(declare-fun m!251729 () Bool)

(assert (=> b!230351 m!251729))

(declare-fun m!251731 () Bool)

(assert (=> start!22122 m!251731))

(declare-fun m!251733 () Bool)

(assert (=> b!230347 m!251733))

(declare-fun m!251735 () Bool)

(assert (=> b!230345 m!251735))

(declare-fun m!251737 () Bool)

(assert (=> b!230345 m!251737))

(declare-fun m!251739 () Bool)

(assert (=> b!230345 m!251739))

(declare-fun m!251741 () Bool)

(assert (=> b!230345 m!251741))

(declare-fun m!251743 () Bool)

(assert (=> b!230345 m!251743))

(declare-fun m!251745 () Bool)

(assert (=> b!230345 m!251745))

(declare-fun m!251747 () Bool)

(assert (=> b!230345 m!251747))

(declare-fun m!251749 () Bool)

(assert (=> b!230345 m!251749))

(declare-fun m!251751 () Bool)

(assert (=> b!230345 m!251751))

(declare-fun m!251753 () Bool)

(assert (=> b!230345 m!251753))

(declare-fun m!251755 () Bool)

(assert (=> b!230345 m!251755))

(declare-fun m!251757 () Bool)

(assert (=> b!230345 m!251757))

(declare-fun m!251759 () Bool)

(assert (=> b!230345 m!251759))

(declare-fun m!251761 () Bool)

(assert (=> b!230343 m!251761))

(declare-fun m!251763 () Bool)

(assert (=> b!230342 m!251763))

(declare-fun m!251765 () Bool)

(assert (=> b!230353 m!251765))

(declare-fun m!251767 () Bool)

(assert (=> b!230353 m!251767))

(declare-fun m!251769 () Bool)

(assert (=> b!230359 m!251769))

(declare-fun m!251771 () Bool)

(assert (=> mapNonEmpty!10246 m!251771))

(declare-fun m!251773 () Bool)

(assert (=> b!230352 m!251773))

(assert (=> bm!21399 m!251735))

(declare-fun m!251775 () Bool)

(assert (=> bm!21398 m!251775))

(check-sat (not start!22122) (not b!230343) (not b_next!6189) (not bm!21399) (not bm!21398) (not b!230342) (not b!230359) b_and!13087 (not b!230354) tp_is_empty!6051 (not mapNonEmpty!10246) (not b!230351) (not b!230353) (not b!230345))
(check-sat b_and!13087 (not b_next!6189))
