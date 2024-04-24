; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19002 () Bool)

(assert start!19002)

(declare-fun b!187370 () Bool)

(declare-fun b_free!4609 () Bool)

(declare-fun b_next!4609 () Bool)

(assert (=> b!187370 (= b_free!4609 (not b_next!4609))))

(declare-fun tp!16639 () Bool)

(declare-fun b_and!11241 () Bool)

(assert (=> b!187370 (= tp!16639 b_and!11241)))

(declare-fun b!187363 () Bool)

(declare-fun e!123309 () Bool)

(declare-datatypes ((V!5489 0))(
  ( (V!5490 (val!2235 Int)) )
))
(declare-datatypes ((ValueCell!1847 0))(
  ( (ValueCellFull!1847 (v!4151 V!5489)) (EmptyCell!1847) )
))
(declare-datatypes ((array!7965 0))(
  ( (array!7966 (arr!3758 (Array (_ BitVec 32) (_ BitVec 64))) (size!4076 (_ BitVec 32))) )
))
(declare-datatypes ((array!7967 0))(
  ( (array!7968 (arr!3759 (Array (_ BitVec 32) ValueCell!1847)) (size!4077 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2602 0))(
  ( (LongMapFixedSize!2603 (defaultEntry!3821 Int) (mask!8966 (_ BitVec 32)) (extraKeys!3558 (_ BitVec 32)) (zeroValue!3662 V!5489) (minValue!3662 V!5489) (_size!1350 (_ BitVec 32)) (_keys!5772 array!7965) (_values!3804 array!7967) (_vacant!1350 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2602)

(assert (=> b!187363 (= e!123309 (and (= (size!4077 (_values!3804 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8966 thiss!1248))) (= (size!4076 (_keys!5772 thiss!1248)) (size!4077 (_values!3804 thiss!1248))) (bvsge (mask!8966 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3558 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!7547 () Bool)

(declare-fun mapRes!7547 () Bool)

(declare-fun tp!16640 () Bool)

(declare-fun e!123307 () Bool)

(assert (=> mapNonEmpty!7547 (= mapRes!7547 (and tp!16640 e!123307))))

(declare-fun mapKey!7547 () (_ BitVec 32))

(declare-fun mapRest!7547 () (Array (_ BitVec 32) ValueCell!1847))

(declare-fun mapValue!7547 () ValueCell!1847)

(assert (=> mapNonEmpty!7547 (= (arr!3759 (_values!3804 thiss!1248)) (store mapRest!7547 mapKey!7547 mapValue!7547))))

(declare-fun res!88596 () Bool)

(declare-fun e!123304 () Bool)

(assert (=> start!19002 (=> (not res!88596) (not e!123304))))

(declare-fun valid!1097 (LongMapFixedSize!2602) Bool)

(assert (=> start!19002 (= res!88596 (valid!1097 thiss!1248))))

(assert (=> start!19002 e!123304))

(declare-fun e!123308 () Bool)

(assert (=> start!19002 e!123308))

(assert (=> start!19002 true))

(declare-fun b!187364 () Bool)

(declare-fun tp_is_empty!4381 () Bool)

(assert (=> b!187364 (= e!123307 tp_is_empty!4381)))

(declare-fun mapIsEmpty!7547 () Bool)

(assert (=> mapIsEmpty!7547 mapRes!7547))

(declare-fun b!187365 () Bool)

(declare-fun e!123310 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!639 0))(
  ( (MissingZero!639 (index!4726 (_ BitVec 32))) (Found!639 (index!4727 (_ BitVec 32))) (Intermediate!639 (undefined!1451 Bool) (index!4728 (_ BitVec 32)) (x!20273 (_ BitVec 32))) (Undefined!639) (MissingVacant!639 (index!4729 (_ BitVec 32))) )
))
(declare-fun lt!92727 () SeekEntryResult!639)

(assert (=> b!187365 (= e!123310 (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4727 lt!92727)) key!828))))

(declare-fun b!187366 () Bool)

(declare-datatypes ((Unit!5651 0))(
  ( (Unit!5652) )
))
(declare-fun e!123311 () Unit!5651)

(declare-fun Unit!5653 () Unit!5651)

(assert (=> b!187366 (= e!123311 Unit!5653)))

(declare-fun lt!92728 () Unit!5651)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!148 (array!7965 array!7967 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 64) Int) Unit!5651)

(assert (=> b!187366 (= lt!92728 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!148 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)))))

(assert (=> b!187366 false))

(declare-fun b!187367 () Bool)

(declare-fun e!123303 () Bool)

(declare-fun e!123302 () Bool)

(assert (=> b!187367 (= e!123303 (and e!123302 mapRes!7547))))

(declare-fun condMapEmpty!7547 () Bool)

(declare-fun mapDefault!7547 () ValueCell!1847)

(assert (=> b!187367 (= condMapEmpty!7547 (= (arr!3759 (_values!3804 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1847)) mapDefault!7547)))))

(declare-fun b!187368 () Bool)

(assert (=> b!187368 (= e!123302 tp_is_empty!4381)))

(declare-fun b!187369 () Bool)

(declare-fun res!88599 () Bool)

(assert (=> b!187369 (=> (not res!88599) (not e!123304))))

(assert (=> b!187369 (= res!88599 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2427 (array!7965) Bool)

(declare-fun array_inv!2428 (array!7967) Bool)

(assert (=> b!187370 (= e!123308 (and tp!16639 tp_is_empty!4381 (array_inv!2427 (_keys!5772 thiss!1248)) (array_inv!2428 (_values!3804 thiss!1248)) e!123303))))

(declare-fun b!187371 () Bool)

(declare-fun e!123305 () Bool)

(assert (=> b!187371 (= e!123305 e!123309)))

(declare-fun res!88597 () Bool)

(assert (=> b!187371 (=> (not res!88597) (not e!123309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!187371 (= res!88597 (validMask!0 (mask!8966 thiss!1248)))))

(declare-fun lt!92730 () Unit!5651)

(assert (=> b!187371 (= lt!92730 e!123311)))

(declare-fun c!33640 () Bool)

(declare-datatypes ((tuple2!3426 0))(
  ( (tuple2!3427 (_1!1724 (_ BitVec 64)) (_2!1724 V!5489)) )
))
(declare-datatypes ((List!2349 0))(
  ( (Nil!2346) (Cons!2345 (h!2980 tuple2!3426) (t!7233 List!2349)) )
))
(declare-datatypes ((ListLongMap!2347 0))(
  ( (ListLongMap!2348 (toList!1189 List!2349)) )
))
(declare-fun contains!1301 (ListLongMap!2347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!841 (array!7965 array!7967 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 32) Int) ListLongMap!2347)

(assert (=> b!187371 (= c!33640 (contains!1301 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)) key!828))))

(declare-fun b!187372 () Bool)

(assert (=> b!187372 (= e!123304 e!123305)))

(declare-fun res!88595 () Bool)

(assert (=> b!187372 (=> (not res!88595) (not e!123305))))

(get-info :version)

(assert (=> b!187372 (= res!88595 (and (not ((_ is Undefined!639) lt!92727)) (not ((_ is MissingVacant!639) lt!92727)) (not ((_ is MissingZero!639) lt!92727)) ((_ is Found!639) lt!92727)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7965 (_ BitVec 32)) SeekEntryResult!639)

(assert (=> b!187372 (= lt!92727 (seekEntryOrOpen!0 key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)))))

(declare-fun b!187373 () Bool)

(declare-fun lt!92729 () Unit!5651)

(assert (=> b!187373 (= e!123311 lt!92729)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!154 (array!7965 array!7967 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 64) Int) Unit!5651)

(assert (=> b!187373 (= lt!92729 (lemmaInListMapThenSeekEntryOrOpenFindsIt!154 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)))))

(declare-fun res!88598 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187373 (= res!88598 (inRange!0 (index!4727 lt!92727) (mask!8966 thiss!1248)))))

(assert (=> b!187373 (=> (not res!88598) (not e!123310))))

(assert (=> b!187373 e!123310))

(assert (= (and start!19002 res!88596) b!187369))

(assert (= (and b!187369 res!88599) b!187372))

(assert (= (and b!187372 res!88595) b!187371))

(assert (= (and b!187371 c!33640) b!187373))

(assert (= (and b!187371 (not c!33640)) b!187366))

(assert (= (and b!187373 res!88598) b!187365))

(assert (= (and b!187371 res!88597) b!187363))

(assert (= (and b!187367 condMapEmpty!7547) mapIsEmpty!7547))

(assert (= (and b!187367 (not condMapEmpty!7547)) mapNonEmpty!7547))

(assert (= (and mapNonEmpty!7547 ((_ is ValueCellFull!1847) mapValue!7547)) b!187364))

(assert (= (and b!187367 ((_ is ValueCellFull!1847) mapDefault!7547)) b!187368))

(assert (= b!187370 b!187367))

(assert (= start!19002 b!187370))

(declare-fun m!214327 () Bool)

(assert (=> b!187372 m!214327))

(declare-fun m!214329 () Bool)

(assert (=> start!19002 m!214329))

(declare-fun m!214331 () Bool)

(assert (=> b!187373 m!214331))

(declare-fun m!214333 () Bool)

(assert (=> b!187373 m!214333))

(declare-fun m!214335 () Bool)

(assert (=> b!187365 m!214335))

(declare-fun m!214337 () Bool)

(assert (=> b!187371 m!214337))

(declare-fun m!214339 () Bool)

(assert (=> b!187371 m!214339))

(assert (=> b!187371 m!214339))

(declare-fun m!214341 () Bool)

(assert (=> b!187371 m!214341))

(declare-fun m!214343 () Bool)

(assert (=> b!187370 m!214343))

(declare-fun m!214345 () Bool)

(assert (=> b!187370 m!214345))

(declare-fun m!214347 () Bool)

(assert (=> b!187366 m!214347))

(declare-fun m!214349 () Bool)

(assert (=> mapNonEmpty!7547 m!214349))

(check-sat (not b!187366) (not b!187373) (not start!19002) (not b!187372) (not b_next!4609) (not b!187370) (not mapNonEmpty!7547) tp_is_empty!4381 b_and!11241 (not b!187371))
(check-sat b_and!11241 (not b_next!4609))
(get-model)

(declare-fun d!55473 () Bool)

(declare-fun e!123374 () Bool)

(assert (=> d!55473 e!123374))

(declare-fun res!88634 () Bool)

(assert (=> d!55473 (=> (not res!88634) (not e!123374))))

(declare-fun lt!92759 () SeekEntryResult!639)

(assert (=> d!55473 (= res!88634 ((_ is Found!639) lt!92759))))

(assert (=> d!55473 (= lt!92759 (seekEntryOrOpen!0 key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)))))

(declare-fun lt!92760 () Unit!5651)

(declare-fun choose!1003 (array!7965 array!7967 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 64) Int) Unit!5651)

(assert (=> d!55473 (= lt!92760 (choose!1003 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)))))

(assert (=> d!55473 (validMask!0 (mask!8966 thiss!1248))))

(assert (=> d!55473 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!154 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)) lt!92760)))

(declare-fun b!187444 () Bool)

(declare-fun res!88635 () Bool)

(assert (=> b!187444 (=> (not res!88635) (not e!123374))))

(assert (=> b!187444 (= res!88635 (inRange!0 (index!4727 lt!92759) (mask!8966 thiss!1248)))))

(declare-fun b!187445 () Bool)

(assert (=> b!187445 (= e!123374 (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4727 lt!92759)) key!828))))

(assert (=> b!187445 (and (bvsge (index!4727 lt!92759) #b00000000000000000000000000000000) (bvslt (index!4727 lt!92759) (size!4076 (_keys!5772 thiss!1248))))))

(assert (= (and d!55473 res!88634) b!187444))

(assert (= (and b!187444 res!88635) b!187445))

(assert (=> d!55473 m!214327))

(declare-fun m!214399 () Bool)

(assert (=> d!55473 m!214399))

(assert (=> d!55473 m!214337))

(declare-fun m!214401 () Bool)

(assert (=> b!187444 m!214401))

(declare-fun m!214403 () Bool)

(assert (=> b!187445 m!214403))

(assert (=> b!187373 d!55473))

(declare-fun d!55475 () Bool)

(assert (=> d!55475 (= (inRange!0 (index!4727 lt!92727) (mask!8966 thiss!1248)) (and (bvsge (index!4727 lt!92727) #b00000000000000000000000000000000) (bvslt (index!4727 lt!92727) (bvadd (mask!8966 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187373 d!55475))

(declare-fun b!187458 () Bool)

(declare-fun lt!92767 () SeekEntryResult!639)

(declare-fun e!123383 () SeekEntryResult!639)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7965 (_ BitVec 32)) SeekEntryResult!639)

(assert (=> b!187458 (= e!123383 (seekKeyOrZeroReturnVacant!0 (x!20273 lt!92767) (index!4728 lt!92767) (index!4728 lt!92767) key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)))))

(declare-fun b!187459 () Bool)

(declare-fun e!123382 () SeekEntryResult!639)

(assert (=> b!187459 (= e!123382 (Found!639 (index!4728 lt!92767)))))

(declare-fun b!187460 () Bool)

(declare-fun e!123381 () SeekEntryResult!639)

(assert (=> b!187460 (= e!123381 e!123382)))

(declare-fun lt!92769 () (_ BitVec 64))

(assert (=> b!187460 (= lt!92769 (select (arr!3758 (_keys!5772 thiss!1248)) (index!4728 lt!92767)))))

(declare-fun c!33654 () Bool)

(assert (=> b!187460 (= c!33654 (= lt!92769 key!828))))

(declare-fun b!187461 () Bool)

(assert (=> b!187461 (= e!123381 Undefined!639)))

(declare-fun d!55477 () Bool)

(declare-fun lt!92768 () SeekEntryResult!639)

(assert (=> d!55477 (and (or ((_ is Undefined!639) lt!92768) (not ((_ is Found!639) lt!92768)) (and (bvsge (index!4727 lt!92768) #b00000000000000000000000000000000) (bvslt (index!4727 lt!92768) (size!4076 (_keys!5772 thiss!1248))))) (or ((_ is Undefined!639) lt!92768) ((_ is Found!639) lt!92768) (not ((_ is MissingZero!639) lt!92768)) (and (bvsge (index!4726 lt!92768) #b00000000000000000000000000000000) (bvslt (index!4726 lt!92768) (size!4076 (_keys!5772 thiss!1248))))) (or ((_ is Undefined!639) lt!92768) ((_ is Found!639) lt!92768) ((_ is MissingZero!639) lt!92768) (not ((_ is MissingVacant!639) lt!92768)) (and (bvsge (index!4729 lt!92768) #b00000000000000000000000000000000) (bvslt (index!4729 lt!92768) (size!4076 (_keys!5772 thiss!1248))))) (or ((_ is Undefined!639) lt!92768) (ite ((_ is Found!639) lt!92768) (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4727 lt!92768)) key!828) (ite ((_ is MissingZero!639) lt!92768) (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4726 lt!92768)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!639) lt!92768) (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4729 lt!92768)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55477 (= lt!92768 e!123381)))

(declare-fun c!33653 () Bool)

(assert (=> d!55477 (= c!33653 (and ((_ is Intermediate!639) lt!92767) (undefined!1451 lt!92767)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7965 (_ BitVec 32)) SeekEntryResult!639)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55477 (= lt!92767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8966 thiss!1248)) key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)))))

(assert (=> d!55477 (validMask!0 (mask!8966 thiss!1248))))

(assert (=> d!55477 (= (seekEntryOrOpen!0 key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)) lt!92768)))

(declare-fun b!187462 () Bool)

(assert (=> b!187462 (= e!123383 (MissingZero!639 (index!4728 lt!92767)))))

(declare-fun b!187463 () Bool)

(declare-fun c!33655 () Bool)

(assert (=> b!187463 (= c!33655 (= lt!92769 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187463 (= e!123382 e!123383)))

(assert (= (and d!55477 c!33653) b!187461))

(assert (= (and d!55477 (not c!33653)) b!187460))

(assert (= (and b!187460 c!33654) b!187459))

(assert (= (and b!187460 (not c!33654)) b!187463))

(assert (= (and b!187463 c!33655) b!187462))

(assert (= (and b!187463 (not c!33655)) b!187458))

(declare-fun m!214405 () Bool)

(assert (=> b!187458 m!214405))

(declare-fun m!214407 () Bool)

(assert (=> b!187460 m!214407))

(declare-fun m!214409 () Bool)

(assert (=> d!55477 m!214409))

(assert (=> d!55477 m!214409))

(declare-fun m!214411 () Bool)

(assert (=> d!55477 m!214411))

(declare-fun m!214413 () Bool)

(assert (=> d!55477 m!214413))

(declare-fun m!214415 () Bool)

(assert (=> d!55477 m!214415))

(assert (=> d!55477 m!214337))

(declare-fun m!214417 () Bool)

(assert (=> d!55477 m!214417))

(assert (=> b!187372 d!55477))

(declare-fun d!55479 () Bool)

(assert (=> d!55479 (= (array_inv!2427 (_keys!5772 thiss!1248)) (bvsge (size!4076 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187370 d!55479))

(declare-fun d!55481 () Bool)

(assert (=> d!55481 (= (array_inv!2428 (_values!3804 thiss!1248)) (bvsge (size!4077 (_values!3804 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187370 d!55481))

(declare-fun b!187480 () Bool)

(declare-fun lt!92775 () SeekEntryResult!639)

(assert (=> b!187480 (and (bvsge (index!4726 lt!92775) #b00000000000000000000000000000000) (bvslt (index!4726 lt!92775) (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun res!88645 () Bool)

(assert (=> b!187480 (= res!88645 (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4726 lt!92775)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123394 () Bool)

(assert (=> b!187480 (=> (not res!88645) (not e!123394))))

(declare-fun b!187481 () Bool)

(declare-fun e!123392 () Bool)

(declare-fun e!123395 () Bool)

(assert (=> b!187481 (= e!123392 e!123395)))

(declare-fun c!33661 () Bool)

(assert (=> b!187481 (= c!33661 ((_ is MissingVacant!639) lt!92775))))

(declare-fun d!55483 () Bool)

(assert (=> d!55483 e!123392))

(declare-fun c!33660 () Bool)

(assert (=> d!55483 (= c!33660 ((_ is MissingZero!639) lt!92775))))

(assert (=> d!55483 (= lt!92775 (seekEntryOrOpen!0 key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)))))

(declare-fun lt!92774 () Unit!5651)

(declare-fun choose!1004 (array!7965 array!7967 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 64) Int) Unit!5651)

(assert (=> d!55483 (= lt!92774 (choose!1004 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)))))

(assert (=> d!55483 (validMask!0 (mask!8966 thiss!1248))))

(assert (=> d!55483 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!148 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)) lt!92774)))

(declare-fun b!187482 () Bool)

(declare-fun res!88646 () Bool)

(declare-fun e!123393 () Bool)

(assert (=> b!187482 (=> (not res!88646) (not e!123393))))

(declare-fun call!18877 () Bool)

(assert (=> b!187482 (= res!88646 call!18877)))

(assert (=> b!187482 (= e!123395 e!123393)))

(declare-fun b!187483 () Bool)

(declare-fun res!88647 () Bool)

(assert (=> b!187483 (=> (not res!88647) (not e!123393))))

(assert (=> b!187483 (= res!88647 (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4729 lt!92775)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187483 (and (bvsge (index!4729 lt!92775) #b00000000000000000000000000000000) (bvslt (index!4729 lt!92775) (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun b!187484 () Bool)

(declare-fun call!18876 () Bool)

(assert (=> b!187484 (= e!123393 (not call!18876))))

(declare-fun bm!18873 () Bool)

(assert (=> bm!18873 (= call!18877 (inRange!0 (ite c!33660 (index!4726 lt!92775) (index!4729 lt!92775)) (mask!8966 thiss!1248)))))

(declare-fun bm!18874 () Bool)

(declare-fun arrayContainsKey!0 (array!7965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18874 (= call!18876 (arrayContainsKey!0 (_keys!5772 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!187485 () Bool)

(assert (=> b!187485 (= e!123394 (not call!18876))))

(declare-fun b!187486 () Bool)

(assert (=> b!187486 (= e!123392 e!123394)))

(declare-fun res!88644 () Bool)

(assert (=> b!187486 (= res!88644 call!18877)))

(assert (=> b!187486 (=> (not res!88644) (not e!123394))))

(declare-fun b!187487 () Bool)

(assert (=> b!187487 (= e!123395 ((_ is Undefined!639) lt!92775))))

(assert (= (and d!55483 c!33660) b!187486))

(assert (= (and d!55483 (not c!33660)) b!187481))

(assert (= (and b!187486 res!88644) b!187480))

(assert (= (and b!187480 res!88645) b!187485))

(assert (= (and b!187481 c!33661) b!187482))

(assert (= (and b!187481 (not c!33661)) b!187487))

(assert (= (and b!187482 res!88646) b!187483))

(assert (= (and b!187483 res!88647) b!187484))

(assert (= (or b!187486 b!187482) bm!18873))

(assert (= (or b!187485 b!187484) bm!18874))

(declare-fun m!214419 () Bool)

(assert (=> b!187483 m!214419))

(declare-fun m!214421 () Bool)

(assert (=> bm!18874 m!214421))

(declare-fun m!214423 () Bool)

(assert (=> b!187480 m!214423))

(assert (=> d!55483 m!214327))

(declare-fun m!214425 () Bool)

(assert (=> d!55483 m!214425))

(assert (=> d!55483 m!214337))

(declare-fun m!214427 () Bool)

(assert (=> bm!18873 m!214427))

(assert (=> b!187366 d!55483))

(declare-fun d!55485 () Bool)

(declare-fun res!88654 () Bool)

(declare-fun e!123398 () Bool)

(assert (=> d!55485 (=> (not res!88654) (not e!123398))))

(declare-fun simpleValid!187 (LongMapFixedSize!2602) Bool)

(assert (=> d!55485 (= res!88654 (simpleValid!187 thiss!1248))))

(assert (=> d!55485 (= (valid!1097 thiss!1248) e!123398)))

(declare-fun b!187494 () Bool)

(declare-fun res!88655 () Bool)

(assert (=> b!187494 (=> (not res!88655) (not e!123398))))

(declare-fun arrayCountValidKeys!0 (array!7965 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187494 (= res!88655 (= (arrayCountValidKeys!0 (_keys!5772 thiss!1248) #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))) (_size!1350 thiss!1248)))))

(declare-fun b!187495 () Bool)

(declare-fun res!88656 () Bool)

(assert (=> b!187495 (=> (not res!88656) (not e!123398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7965 (_ BitVec 32)) Bool)

(assert (=> b!187495 (= res!88656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)))))

(declare-fun b!187496 () Bool)

(declare-datatypes ((List!2352 0))(
  ( (Nil!2349) (Cons!2348 (h!2983 (_ BitVec 64)) (t!7238 List!2352)) )
))
(declare-fun arrayNoDuplicates!0 (array!7965 (_ BitVec 32) List!2352) Bool)

(assert (=> b!187496 (= e!123398 (arrayNoDuplicates!0 (_keys!5772 thiss!1248) #b00000000000000000000000000000000 Nil!2349))))

(assert (= (and d!55485 res!88654) b!187494))

(assert (= (and b!187494 res!88655) b!187495))

(assert (= (and b!187495 res!88656) b!187496))

(declare-fun m!214429 () Bool)

(assert (=> d!55485 m!214429))

(declare-fun m!214431 () Bool)

(assert (=> b!187494 m!214431))

(declare-fun m!214433 () Bool)

(assert (=> b!187495 m!214433))

(declare-fun m!214435 () Bool)

(assert (=> b!187496 m!214435))

(assert (=> start!19002 d!55485))

(declare-fun d!55487 () Bool)

(assert (=> d!55487 (= (validMask!0 (mask!8966 thiss!1248)) (and (or (= (mask!8966 thiss!1248) #b00000000000000000000000000000111) (= (mask!8966 thiss!1248) #b00000000000000000000000000001111) (= (mask!8966 thiss!1248) #b00000000000000000000000000011111) (= (mask!8966 thiss!1248) #b00000000000000000000000000111111) (= (mask!8966 thiss!1248) #b00000000000000000000000001111111) (= (mask!8966 thiss!1248) #b00000000000000000000000011111111) (= (mask!8966 thiss!1248) #b00000000000000000000000111111111) (= (mask!8966 thiss!1248) #b00000000000000000000001111111111) (= (mask!8966 thiss!1248) #b00000000000000000000011111111111) (= (mask!8966 thiss!1248) #b00000000000000000000111111111111) (= (mask!8966 thiss!1248) #b00000000000000000001111111111111) (= (mask!8966 thiss!1248) #b00000000000000000011111111111111) (= (mask!8966 thiss!1248) #b00000000000000000111111111111111) (= (mask!8966 thiss!1248) #b00000000000000001111111111111111) (= (mask!8966 thiss!1248) #b00000000000000011111111111111111) (= (mask!8966 thiss!1248) #b00000000000000111111111111111111) (= (mask!8966 thiss!1248) #b00000000000001111111111111111111) (= (mask!8966 thiss!1248) #b00000000000011111111111111111111) (= (mask!8966 thiss!1248) #b00000000000111111111111111111111) (= (mask!8966 thiss!1248) #b00000000001111111111111111111111) (= (mask!8966 thiss!1248) #b00000000011111111111111111111111) (= (mask!8966 thiss!1248) #b00000000111111111111111111111111) (= (mask!8966 thiss!1248) #b00000001111111111111111111111111) (= (mask!8966 thiss!1248) #b00000011111111111111111111111111) (= (mask!8966 thiss!1248) #b00000111111111111111111111111111) (= (mask!8966 thiss!1248) #b00001111111111111111111111111111) (= (mask!8966 thiss!1248) #b00011111111111111111111111111111) (= (mask!8966 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8966 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!187371 d!55487))

(declare-fun d!55489 () Bool)

(declare-fun e!123404 () Bool)

(assert (=> d!55489 e!123404))

(declare-fun res!88659 () Bool)

(assert (=> d!55489 (=> res!88659 e!123404)))

(declare-fun lt!92787 () Bool)

(assert (=> d!55489 (= res!88659 (not lt!92787))))

(declare-fun lt!92786 () Bool)

(assert (=> d!55489 (= lt!92787 lt!92786)))

(declare-fun lt!92785 () Unit!5651)

(declare-fun e!123403 () Unit!5651)

(assert (=> d!55489 (= lt!92785 e!123403)))

(declare-fun c!33664 () Bool)

(assert (=> d!55489 (= c!33664 lt!92786)))

(declare-fun containsKey!232 (List!2349 (_ BitVec 64)) Bool)

(assert (=> d!55489 (= lt!92786 (containsKey!232 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(assert (=> d!55489 (= (contains!1301 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)) key!828) lt!92787)))

(declare-fun b!187503 () Bool)

(declare-fun lt!92784 () Unit!5651)

(assert (=> b!187503 (= e!123403 lt!92784)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!180 (List!2349 (_ BitVec 64)) Unit!5651)

(assert (=> b!187503 (= lt!92784 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(declare-datatypes ((Option!235 0))(
  ( (Some!234 (v!4154 V!5489)) (None!233) )
))
(declare-fun isDefined!181 (Option!235) Bool)

(declare-fun getValueByKey!229 (List!2349 (_ BitVec 64)) Option!235)

(assert (=> b!187503 (isDefined!181 (getValueByKey!229 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(declare-fun b!187504 () Bool)

(declare-fun Unit!5659 () Unit!5651)

(assert (=> b!187504 (= e!123403 Unit!5659)))

(declare-fun b!187505 () Bool)

(assert (=> b!187505 (= e!123404 (isDefined!181 (getValueByKey!229 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828)))))

(assert (= (and d!55489 c!33664) b!187503))

(assert (= (and d!55489 (not c!33664)) b!187504))

(assert (= (and d!55489 (not res!88659)) b!187505))

(declare-fun m!214437 () Bool)

(assert (=> d!55489 m!214437))

(declare-fun m!214439 () Bool)

(assert (=> b!187503 m!214439))

(declare-fun m!214441 () Bool)

(assert (=> b!187503 m!214441))

(assert (=> b!187503 m!214441))

(declare-fun m!214443 () Bool)

(assert (=> b!187503 m!214443))

(assert (=> b!187505 m!214441))

(assert (=> b!187505 m!214441))

(assert (=> b!187505 m!214443))

(assert (=> b!187371 d!55489))

(declare-fun bm!18889 () Bool)

(declare-fun call!18893 () ListLongMap!2347)

(declare-fun call!18897 () ListLongMap!2347)

(assert (=> bm!18889 (= call!18893 call!18897)))

(declare-fun bm!18890 () Bool)

(declare-fun call!18898 () ListLongMap!2347)

(assert (=> bm!18890 (= call!18898 call!18893)))

(declare-fun b!187548 () Bool)

(declare-fun e!123436 () Unit!5651)

(declare-fun lt!92832 () Unit!5651)

(assert (=> b!187548 (= e!123436 lt!92832)))

(declare-fun lt!92843 () ListLongMap!2347)

(declare-fun getCurrentListMapNoExtraKeys!202 (array!7965 array!7967 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 32) Int) ListLongMap!2347)

(assert (=> b!187548 (= lt!92843 (getCurrentListMapNoExtraKeys!202 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))

(declare-fun lt!92837 () (_ BitVec 64))

(assert (=> b!187548 (= lt!92837 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92839 () (_ BitVec 64))

(assert (=> b!187548 (= lt!92839 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92838 () Unit!5651)

(declare-fun addStillContains!147 (ListLongMap!2347 (_ BitVec 64) V!5489 (_ BitVec 64)) Unit!5651)

(assert (=> b!187548 (= lt!92838 (addStillContains!147 lt!92843 lt!92837 (zeroValue!3662 thiss!1248) lt!92839))))

(declare-fun +!291 (ListLongMap!2347 tuple2!3426) ListLongMap!2347)

(assert (=> b!187548 (contains!1301 (+!291 lt!92843 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248))) lt!92839)))

(declare-fun lt!92847 () Unit!5651)

(assert (=> b!187548 (= lt!92847 lt!92838)))

(declare-fun lt!92850 () ListLongMap!2347)

(assert (=> b!187548 (= lt!92850 (getCurrentListMapNoExtraKeys!202 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))

(declare-fun lt!92835 () (_ BitVec 64))

(assert (=> b!187548 (= lt!92835 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92842 () (_ BitVec 64))

(assert (=> b!187548 (= lt!92842 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92841 () Unit!5651)

(declare-fun addApplyDifferent!147 (ListLongMap!2347 (_ BitVec 64) V!5489 (_ BitVec 64)) Unit!5651)

(assert (=> b!187548 (= lt!92841 (addApplyDifferent!147 lt!92850 lt!92835 (minValue!3662 thiss!1248) lt!92842))))

(declare-fun apply!171 (ListLongMap!2347 (_ BitVec 64)) V!5489)

(assert (=> b!187548 (= (apply!171 (+!291 lt!92850 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248))) lt!92842) (apply!171 lt!92850 lt!92842))))

(declare-fun lt!92845 () Unit!5651)

(assert (=> b!187548 (= lt!92845 lt!92841)))

(declare-fun lt!92834 () ListLongMap!2347)

(assert (=> b!187548 (= lt!92834 (getCurrentListMapNoExtraKeys!202 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))

(declare-fun lt!92833 () (_ BitVec 64))

(assert (=> b!187548 (= lt!92833 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92853 () (_ BitVec 64))

(assert (=> b!187548 (= lt!92853 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92846 () Unit!5651)

(assert (=> b!187548 (= lt!92846 (addApplyDifferent!147 lt!92834 lt!92833 (zeroValue!3662 thiss!1248) lt!92853))))

(assert (=> b!187548 (= (apply!171 (+!291 lt!92834 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248))) lt!92853) (apply!171 lt!92834 lt!92853))))

(declare-fun lt!92844 () Unit!5651)

(assert (=> b!187548 (= lt!92844 lt!92846)))

(declare-fun lt!92849 () ListLongMap!2347)

(assert (=> b!187548 (= lt!92849 (getCurrentListMapNoExtraKeys!202 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))

(declare-fun lt!92848 () (_ BitVec 64))

(assert (=> b!187548 (= lt!92848 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92852 () (_ BitVec 64))

(assert (=> b!187548 (= lt!92852 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187548 (= lt!92832 (addApplyDifferent!147 lt!92849 lt!92848 (minValue!3662 thiss!1248) lt!92852))))

(assert (=> b!187548 (= (apply!171 (+!291 lt!92849 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248))) lt!92852) (apply!171 lt!92849 lt!92852))))

(declare-fun b!187549 () Bool)

(declare-fun e!123434 () Bool)

(declare-fun e!123440 () Bool)

(assert (=> b!187549 (= e!123434 e!123440)))

(declare-fun res!88678 () Bool)

(declare-fun call!18892 () Bool)

(assert (=> b!187549 (= res!88678 call!18892)))

(assert (=> b!187549 (=> (not res!88678) (not e!123440))))

(declare-fun b!187550 () Bool)

(declare-fun e!123439 () Bool)

(assert (=> b!187550 (= e!123439 e!123434)))

(declare-fun c!33677 () Bool)

(assert (=> b!187550 (= c!33677 (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!187551 () Bool)

(declare-fun e!123443 () Bool)

(declare-fun lt!92840 () ListLongMap!2347)

(declare-fun get!2172 (ValueCell!1847 V!5489) V!5489)

(declare-fun dynLambda!514 (Int (_ BitVec 64)) V!5489)

(assert (=> b!187551 (= e!123443 (= (apply!171 lt!92840 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)) (get!2172 (select (arr!3759 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187551 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4077 (_values!3804 thiss!1248))))))

(assert (=> b!187551 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun b!187552 () Bool)

(declare-fun e!123437 () Bool)

(declare-fun e!123431 () Bool)

(assert (=> b!187552 (= e!123437 e!123431)))

(declare-fun res!88681 () Bool)

(declare-fun call!18896 () Bool)

(assert (=> b!187552 (= res!88681 call!18896)))

(assert (=> b!187552 (=> (not res!88681) (not e!123431))))

(declare-fun b!187553 () Bool)

(declare-fun res!88682 () Bool)

(assert (=> b!187553 (=> (not res!88682) (not e!123439))))

(assert (=> b!187553 (= res!88682 e!123437)))

(declare-fun c!33682 () Bool)

(assert (=> b!187553 (= c!33682 (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18892 () Bool)

(assert (=> bm!18892 (= call!18896 (contains!1301 lt!92840 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187554 () Bool)

(assert (=> b!187554 (= e!123434 (not call!18892))))

(declare-fun b!187555 () Bool)

(declare-fun e!123432 () ListLongMap!2347)

(declare-fun call!18895 () ListLongMap!2347)

(assert (=> b!187555 (= e!123432 call!18895)))

(declare-fun b!187556 () Bool)

(assert (=> b!187556 (= e!123437 (not call!18896))))

(declare-fun b!187557 () Bool)

(declare-fun e!123433 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!187557 (= e!123433 (validKeyInArray!0 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55491 () Bool)

(assert (=> d!55491 e!123439))

(declare-fun res!88679 () Bool)

(assert (=> d!55491 (=> (not res!88679) (not e!123439))))

(assert (=> d!55491 (= res!88679 (or (bvsge #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))))

(declare-fun lt!92836 () ListLongMap!2347)

(assert (=> d!55491 (= lt!92840 lt!92836)))

(declare-fun lt!92851 () Unit!5651)

(assert (=> d!55491 (= lt!92851 e!123436)))

(declare-fun c!33678 () Bool)

(declare-fun e!123435 () Bool)

(assert (=> d!55491 (= c!33678 e!123435)))

(declare-fun res!88684 () Bool)

(assert (=> d!55491 (=> (not res!88684) (not e!123435))))

(assert (=> d!55491 (= res!88684 (bvslt #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun e!123442 () ListLongMap!2347)

(assert (=> d!55491 (= lt!92836 e!123442)))

(declare-fun c!33679 () Bool)

(assert (=> d!55491 (= c!33679 (and (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55491 (validMask!0 (mask!8966 thiss!1248))))

(assert (=> d!55491 (= (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)) lt!92840)))

(declare-fun bm!18891 () Bool)

(assert (=> bm!18891 (= call!18892 (contains!1301 lt!92840 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187558 () Bool)

(declare-fun call!18894 () ListLongMap!2347)

(assert (=> b!187558 (= e!123442 (+!291 call!18894 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))

(declare-fun b!187559 () Bool)

(declare-fun Unit!5660 () Unit!5651)

(assert (=> b!187559 (= e!123436 Unit!5660)))

(declare-fun b!187560 () Bool)

(declare-fun e!123438 () ListLongMap!2347)

(assert (=> b!187560 (= e!123438 call!18898)))

(declare-fun b!187561 () Bool)

(declare-fun c!33680 () Bool)

(assert (=> b!187561 (= c!33680 (and (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!187561 (= e!123432 e!123438)))

(declare-fun b!187562 () Bool)

(declare-fun e!123441 () Bool)

(assert (=> b!187562 (= e!123441 e!123443)))

(declare-fun res!88680 () Bool)

(assert (=> b!187562 (=> (not res!88680) (not e!123443))))

(assert (=> b!187562 (= res!88680 (contains!1301 lt!92840 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187562 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun c!33681 () Bool)

(declare-fun bm!18893 () Bool)

(assert (=> bm!18893 (= call!18894 (+!291 (ite c!33679 call!18897 (ite c!33681 call!18893 call!18898)) (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(declare-fun bm!18894 () Bool)

(assert (=> bm!18894 (= call!18895 call!18894)))

(declare-fun b!187563 () Bool)

(assert (=> b!187563 (= e!123442 e!123432)))

(assert (=> b!187563 (= c!33681 (and (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!187564 () Bool)

(assert (=> b!187564 (= e!123438 call!18895)))

(declare-fun b!187565 () Bool)

(assert (=> b!187565 (= e!123440 (= (apply!171 lt!92840 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3662 thiss!1248)))))

(declare-fun b!187566 () Bool)

(assert (=> b!187566 (= e!123435 (validKeyInArray!0 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18895 () Bool)

(assert (=> bm!18895 (= call!18897 (getCurrentListMapNoExtraKeys!202 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))

(declare-fun b!187567 () Bool)

(declare-fun res!88686 () Bool)

(assert (=> b!187567 (=> (not res!88686) (not e!123439))))

(assert (=> b!187567 (= res!88686 e!123441)))

(declare-fun res!88683 () Bool)

(assert (=> b!187567 (=> res!88683 e!123441)))

(assert (=> b!187567 (= res!88683 (not e!123433))))

(declare-fun res!88685 () Bool)

(assert (=> b!187567 (=> (not res!88685) (not e!123433))))

(assert (=> b!187567 (= res!88685 (bvslt #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun b!187568 () Bool)

(assert (=> b!187568 (= e!123431 (= (apply!171 lt!92840 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3662 thiss!1248)))))

(assert (= (and d!55491 c!33679) b!187558))

(assert (= (and d!55491 (not c!33679)) b!187563))

(assert (= (and b!187563 c!33681) b!187555))

(assert (= (and b!187563 (not c!33681)) b!187561))

(assert (= (and b!187561 c!33680) b!187564))

(assert (= (and b!187561 (not c!33680)) b!187560))

(assert (= (or b!187564 b!187560) bm!18890))

(assert (= (or b!187555 bm!18890) bm!18889))

(assert (= (or b!187555 b!187564) bm!18894))

(assert (= (or b!187558 bm!18889) bm!18895))

(assert (= (or b!187558 bm!18894) bm!18893))

(assert (= (and d!55491 res!88684) b!187566))

(assert (= (and d!55491 c!33678) b!187548))

(assert (= (and d!55491 (not c!33678)) b!187559))

(assert (= (and d!55491 res!88679) b!187567))

(assert (= (and b!187567 res!88685) b!187557))

(assert (= (and b!187567 (not res!88683)) b!187562))

(assert (= (and b!187562 res!88680) b!187551))

(assert (= (and b!187567 res!88686) b!187553))

(assert (= (and b!187553 c!33682) b!187552))

(assert (= (and b!187553 (not c!33682)) b!187556))

(assert (= (and b!187552 res!88681) b!187568))

(assert (= (or b!187552 b!187556) bm!18892))

(assert (= (and b!187553 res!88682) b!187550))

(assert (= (and b!187550 c!33677) b!187549))

(assert (= (and b!187550 (not c!33677)) b!187554))

(assert (= (and b!187549 res!88678) b!187565))

(assert (= (or b!187549 b!187554) bm!18891))

(declare-fun b_lambda!7309 () Bool)

(assert (=> (not b_lambda!7309) (not b!187551)))

(declare-fun t!7237 () Bool)

(declare-fun tb!2845 () Bool)

(assert (=> (and b!187370 (= (defaultEntry!3821 thiss!1248) (defaultEntry!3821 thiss!1248)) t!7237) tb!2845))

(declare-fun result!4829 () Bool)

(assert (=> tb!2845 (= result!4829 tp_is_empty!4381)))

(assert (=> b!187551 t!7237))

(declare-fun b_and!11247 () Bool)

(assert (= b_and!11241 (and (=> t!7237 result!4829) b_and!11247)))

(declare-fun m!214445 () Bool)

(assert (=> bm!18892 m!214445))

(assert (=> d!55491 m!214337))

(declare-fun m!214447 () Bool)

(assert (=> b!187558 m!214447))

(declare-fun m!214449 () Bool)

(assert (=> b!187565 m!214449))

(declare-fun m!214451 () Bool)

(assert (=> b!187557 m!214451))

(assert (=> b!187557 m!214451))

(declare-fun m!214453 () Bool)

(assert (=> b!187557 m!214453))

(declare-fun m!214455 () Bool)

(assert (=> bm!18893 m!214455))

(assert (=> b!187562 m!214451))

(assert (=> b!187562 m!214451))

(declare-fun m!214457 () Bool)

(assert (=> b!187562 m!214457))

(assert (=> b!187566 m!214451))

(assert (=> b!187566 m!214451))

(assert (=> b!187566 m!214453))

(declare-fun m!214459 () Bool)

(assert (=> b!187551 m!214459))

(assert (=> b!187551 m!214451))

(declare-fun m!214461 () Bool)

(assert (=> b!187551 m!214461))

(assert (=> b!187551 m!214451))

(declare-fun m!214463 () Bool)

(assert (=> b!187551 m!214463))

(assert (=> b!187551 m!214459))

(assert (=> b!187551 m!214461))

(declare-fun m!214465 () Bool)

(assert (=> b!187551 m!214465))

(declare-fun m!214467 () Bool)

(assert (=> bm!18891 m!214467))

(declare-fun m!214469 () Bool)

(assert (=> bm!18895 m!214469))

(declare-fun m!214471 () Bool)

(assert (=> b!187568 m!214471))

(declare-fun m!214473 () Bool)

(assert (=> b!187548 m!214473))

(assert (=> b!187548 m!214451))

(declare-fun m!214475 () Bool)

(assert (=> b!187548 m!214475))

(declare-fun m!214477 () Bool)

(assert (=> b!187548 m!214477))

(assert (=> b!187548 m!214475))

(declare-fun m!214479 () Bool)

(assert (=> b!187548 m!214479))

(declare-fun m!214481 () Bool)

(assert (=> b!187548 m!214481))

(assert (=> b!187548 m!214469))

(declare-fun m!214483 () Bool)

(assert (=> b!187548 m!214483))

(declare-fun m!214485 () Bool)

(assert (=> b!187548 m!214485))

(declare-fun m!214487 () Bool)

(assert (=> b!187548 m!214487))

(declare-fun m!214489 () Bool)

(assert (=> b!187548 m!214489))

(declare-fun m!214491 () Bool)

(assert (=> b!187548 m!214491))

(declare-fun m!214493 () Bool)

(assert (=> b!187548 m!214493))

(declare-fun m!214495 () Bool)

(assert (=> b!187548 m!214495))

(assert (=> b!187548 m!214483))

(declare-fun m!214497 () Bool)

(assert (=> b!187548 m!214497))

(assert (=> b!187548 m!214485))

(declare-fun m!214499 () Bool)

(assert (=> b!187548 m!214499))

(declare-fun m!214501 () Bool)

(assert (=> b!187548 m!214501))

(assert (=> b!187548 m!214499))

(assert (=> b!187371 d!55491))

(declare-fun condMapEmpty!7556 () Bool)

(declare-fun mapDefault!7556 () ValueCell!1847)

(assert (=> mapNonEmpty!7547 (= condMapEmpty!7556 (= mapRest!7547 ((as const (Array (_ BitVec 32) ValueCell!1847)) mapDefault!7556)))))

(declare-fun e!123448 () Bool)

(declare-fun mapRes!7556 () Bool)

(assert (=> mapNonEmpty!7547 (= tp!16640 (and e!123448 mapRes!7556))))

(declare-fun mapNonEmpty!7556 () Bool)

(declare-fun tp!16655 () Bool)

(declare-fun e!123449 () Bool)

(assert (=> mapNonEmpty!7556 (= mapRes!7556 (and tp!16655 e!123449))))

(declare-fun mapRest!7556 () (Array (_ BitVec 32) ValueCell!1847))

(declare-fun mapValue!7556 () ValueCell!1847)

(declare-fun mapKey!7556 () (_ BitVec 32))

(assert (=> mapNonEmpty!7556 (= mapRest!7547 (store mapRest!7556 mapKey!7556 mapValue!7556))))

(declare-fun mapIsEmpty!7556 () Bool)

(assert (=> mapIsEmpty!7556 mapRes!7556))

(declare-fun b!187577 () Bool)

(assert (=> b!187577 (= e!123449 tp_is_empty!4381)))

(declare-fun b!187578 () Bool)

(assert (=> b!187578 (= e!123448 tp_is_empty!4381)))

(assert (= (and mapNonEmpty!7547 condMapEmpty!7556) mapIsEmpty!7556))

(assert (= (and mapNonEmpty!7547 (not condMapEmpty!7556)) mapNonEmpty!7556))

(assert (= (and mapNonEmpty!7556 ((_ is ValueCellFull!1847) mapValue!7556)) b!187577))

(assert (= (and mapNonEmpty!7547 ((_ is ValueCellFull!1847) mapDefault!7556)) b!187578))

(declare-fun m!214503 () Bool)

(assert (=> mapNonEmpty!7556 m!214503))

(declare-fun b_lambda!7311 () Bool)

(assert (= b_lambda!7309 (or (and b!187370 b_free!4609) b_lambda!7311)))

(check-sat (not b!187496) (not b!187558) (not bm!18892) (not d!55477) (not b!187566) (not d!55473) (not b_next!4609) (not bm!18874) (not b!187458) (not b!187562) (not bm!18893) (not bm!18895) (not bm!18891) (not b!187503) (not bm!18873) (not b!187551) (not b!187444) (not d!55483) (not d!55491) (not mapNonEmpty!7556) (not b_lambda!7311) b_and!11247 (not b!187568) (not b!187505) (not b!187494) (not b!187495) (not d!55485) (not b!187565) (not b!187548) tp_is_empty!4381 (not b!187557) (not d!55489))
(check-sat b_and!11247 (not b_next!4609))
(get-model)

(declare-fun d!55493 () Bool)

(declare-fun e!123451 () Bool)

(assert (=> d!55493 e!123451))

(declare-fun res!88687 () Bool)

(assert (=> d!55493 (=> res!88687 e!123451)))

(declare-fun lt!92857 () Bool)

(assert (=> d!55493 (= res!88687 (not lt!92857))))

(declare-fun lt!92856 () Bool)

(assert (=> d!55493 (= lt!92857 lt!92856)))

(declare-fun lt!92855 () Unit!5651)

(declare-fun e!123450 () Unit!5651)

(assert (=> d!55493 (= lt!92855 e!123450)))

(declare-fun c!33683 () Bool)

(assert (=> d!55493 (= c!33683 lt!92856)))

(assert (=> d!55493 (= lt!92856 (containsKey!232 (toList!1189 lt!92840) (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55493 (= (contains!1301 lt!92840 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)) lt!92857)))

(declare-fun b!187579 () Bool)

(declare-fun lt!92854 () Unit!5651)

(assert (=> b!187579 (= e!123450 lt!92854)))

(assert (=> b!187579 (= lt!92854 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1189 lt!92840) (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187579 (isDefined!181 (getValueByKey!229 (toList!1189 lt!92840) (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187580 () Bool)

(declare-fun Unit!5661 () Unit!5651)

(assert (=> b!187580 (= e!123450 Unit!5661)))

(declare-fun b!187581 () Bool)

(assert (=> b!187581 (= e!123451 (isDefined!181 (getValueByKey!229 (toList!1189 lt!92840) (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55493 c!33683) b!187579))

(assert (= (and d!55493 (not c!33683)) b!187580))

(assert (= (and d!55493 (not res!88687)) b!187581))

(assert (=> d!55493 m!214451))

(declare-fun m!214505 () Bool)

(assert (=> d!55493 m!214505))

(assert (=> b!187579 m!214451))

(declare-fun m!214507 () Bool)

(assert (=> b!187579 m!214507))

(assert (=> b!187579 m!214451))

(declare-fun m!214509 () Bool)

(assert (=> b!187579 m!214509))

(assert (=> b!187579 m!214509))

(declare-fun m!214511 () Bool)

(assert (=> b!187579 m!214511))

(assert (=> b!187581 m!214451))

(assert (=> b!187581 m!214509))

(assert (=> b!187581 m!214509))

(assert (=> b!187581 m!214511))

(assert (=> b!187562 d!55493))

(declare-fun bm!18898 () Bool)

(declare-fun call!18901 () (_ BitVec 32))

(assert (=> bm!18898 (= call!18901 (arrayCountValidKeys!0 (_keys!5772 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun b!187590 () Bool)

(declare-fun e!123457 () (_ BitVec 32))

(assert (=> b!187590 (= e!123457 (bvadd #b00000000000000000000000000000001 call!18901))))

(declare-fun b!187591 () Bool)

(declare-fun e!123456 () (_ BitVec 32))

(assert (=> b!187591 (= e!123456 #b00000000000000000000000000000000)))

(declare-fun b!187592 () Bool)

(assert (=> b!187592 (= e!123457 call!18901)))

(declare-fun b!187593 () Bool)

(assert (=> b!187593 (= e!123456 e!123457)))

(declare-fun c!33688 () Bool)

(assert (=> b!187593 (= c!33688 (validKeyInArray!0 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55495 () Bool)

(declare-fun lt!92860 () (_ BitVec 32))

(assert (=> d!55495 (and (bvsge lt!92860 #b00000000000000000000000000000000) (bvsle lt!92860 (bvsub (size!4076 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55495 (= lt!92860 e!123456)))

(declare-fun c!33689 () Bool)

(assert (=> d!55495 (= c!33689 (bvsge #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(assert (=> d!55495 (and (bvsle #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4076 (_keys!5772 thiss!1248)) (size!4076 (_keys!5772 thiss!1248))))))

(assert (=> d!55495 (= (arrayCountValidKeys!0 (_keys!5772 thiss!1248) #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))) lt!92860)))

(assert (= (and d!55495 c!33689) b!187591))

(assert (= (and d!55495 (not c!33689)) b!187593))

(assert (= (and b!187593 c!33688) b!187590))

(assert (= (and b!187593 (not c!33688)) b!187592))

(assert (= (or b!187590 b!187592) bm!18898))

(declare-fun m!214513 () Bool)

(assert (=> bm!18898 m!214513))

(assert (=> b!187593 m!214451))

(assert (=> b!187593 m!214451))

(assert (=> b!187593 m!214453))

(assert (=> b!187494 d!55495))

(assert (=> d!55491 d!55487))

(declare-fun d!55497 () Bool)

(declare-fun e!123460 () Bool)

(assert (=> d!55497 e!123460))

(declare-fun res!88692 () Bool)

(assert (=> d!55497 (=> (not res!88692) (not e!123460))))

(declare-fun lt!92869 () ListLongMap!2347)

(assert (=> d!55497 (= res!88692 (contains!1301 lt!92869 (_1!1724 (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))))

(declare-fun lt!92872 () List!2349)

(assert (=> d!55497 (= lt!92869 (ListLongMap!2348 lt!92872))))

(declare-fun lt!92871 () Unit!5651)

(declare-fun lt!92870 () Unit!5651)

(assert (=> d!55497 (= lt!92871 lt!92870)))

(assert (=> d!55497 (= (getValueByKey!229 lt!92872 (_1!1724 (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))) (Some!234 (_2!1724 (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!120 (List!2349 (_ BitVec 64) V!5489) Unit!5651)

(assert (=> d!55497 (= lt!92870 (lemmaContainsTupThenGetReturnValue!120 lt!92872 (_1!1724 (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))) (_2!1724 (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))))

(declare-fun insertStrictlySorted!123 (List!2349 (_ BitVec 64) V!5489) List!2349)

(assert (=> d!55497 (= lt!92872 (insertStrictlySorted!123 (toList!1189 (ite c!33679 call!18897 (ite c!33681 call!18893 call!18898))) (_1!1724 (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))) (_2!1724 (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))))

(assert (=> d!55497 (= (+!291 (ite c!33679 call!18897 (ite c!33681 call!18893 call!18898)) (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))) lt!92869)))

(declare-fun b!187598 () Bool)

(declare-fun res!88693 () Bool)

(assert (=> b!187598 (=> (not res!88693) (not e!123460))))

(assert (=> b!187598 (= res!88693 (= (getValueByKey!229 (toList!1189 lt!92869) (_1!1724 (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))) (Some!234 (_2!1724 (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))))

(declare-fun b!187599 () Bool)

(declare-fun contains!1304 (List!2349 tuple2!3426) Bool)

(assert (=> b!187599 (= e!123460 (contains!1304 (toList!1189 lt!92869) (ite (or c!33679 c!33681) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(assert (= (and d!55497 res!88692) b!187598))

(assert (= (and b!187598 res!88693) b!187599))

(declare-fun m!214515 () Bool)

(assert (=> d!55497 m!214515))

(declare-fun m!214517 () Bool)

(assert (=> d!55497 m!214517))

(declare-fun m!214519 () Bool)

(assert (=> d!55497 m!214519))

(declare-fun m!214521 () Bool)

(assert (=> d!55497 m!214521))

(declare-fun m!214523 () Bool)

(assert (=> b!187598 m!214523))

(declare-fun m!214525 () Bool)

(assert (=> b!187599 m!214525))

(assert (=> bm!18893 d!55497))

(declare-fun b!187608 () Bool)

(declare-fun e!123467 () Bool)

(declare-fun e!123469 () Bool)

(assert (=> b!187608 (= e!123467 e!123469)))

(declare-fun c!33692 () Bool)

(assert (=> b!187608 (= c!33692 (validKeyInArray!0 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18901 () Bool)

(declare-fun call!18904 () Bool)

(assert (=> bm!18901 (= call!18904 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5772 thiss!1248) (mask!8966 thiss!1248)))))

(declare-fun b!187610 () Bool)

(declare-fun e!123468 () Bool)

(assert (=> b!187610 (= e!123468 call!18904)))

(declare-fun b!187611 () Bool)

(assert (=> b!187611 (= e!123469 e!123468)))

(declare-fun lt!92881 () (_ BitVec 64))

(assert (=> b!187611 (= lt!92881 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92880 () Unit!5651)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7965 (_ BitVec 64) (_ BitVec 32)) Unit!5651)

(assert (=> b!187611 (= lt!92880 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5772 thiss!1248) lt!92881 #b00000000000000000000000000000000))))

(assert (=> b!187611 (arrayContainsKey!0 (_keys!5772 thiss!1248) lt!92881 #b00000000000000000000000000000000)))

(declare-fun lt!92879 () Unit!5651)

(assert (=> b!187611 (= lt!92879 lt!92880)))

(declare-fun res!88699 () Bool)

(assert (=> b!187611 (= res!88699 (= (seekEntryOrOpen!0 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000) (_keys!5772 thiss!1248) (mask!8966 thiss!1248)) (Found!639 #b00000000000000000000000000000000)))))

(assert (=> b!187611 (=> (not res!88699) (not e!123468))))

(declare-fun b!187609 () Bool)

(assert (=> b!187609 (= e!123469 call!18904)))

(declare-fun d!55499 () Bool)

(declare-fun res!88698 () Bool)

(assert (=> d!55499 (=> res!88698 e!123467)))

(assert (=> d!55499 (= res!88698 (bvsge #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(assert (=> d!55499 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)) e!123467)))

(assert (= (and d!55499 (not res!88698)) b!187608))

(assert (= (and b!187608 c!33692) b!187611))

(assert (= (and b!187608 (not c!33692)) b!187609))

(assert (= (and b!187611 res!88699) b!187610))

(assert (= (or b!187610 b!187609) bm!18901))

(assert (=> b!187608 m!214451))

(assert (=> b!187608 m!214451))

(assert (=> b!187608 m!214453))

(declare-fun m!214527 () Bool)

(assert (=> bm!18901 m!214527))

(assert (=> b!187611 m!214451))

(declare-fun m!214529 () Bool)

(assert (=> b!187611 m!214529))

(declare-fun m!214531 () Bool)

(assert (=> b!187611 m!214531))

(assert (=> b!187611 m!214451))

(declare-fun m!214533 () Bool)

(assert (=> b!187611 m!214533))

(assert (=> b!187495 d!55499))

(declare-fun b!187624 () Bool)

(declare-fun e!123477 () SeekEntryResult!639)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187624 (= e!123477 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20273 lt!92767) #b00000000000000000000000000000001) (nextIndex!0 (index!4728 lt!92767) (bvadd (x!20273 lt!92767) #b00000000000000000000000000000001) (mask!8966 thiss!1248)) (index!4728 lt!92767) key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)))))

(declare-fun b!187625 () Bool)

(declare-fun e!123476 () SeekEntryResult!639)

(assert (=> b!187625 (= e!123476 Undefined!639)))

(declare-fun b!187626 () Bool)

(declare-fun c!33699 () Bool)

(declare-fun lt!92887 () (_ BitVec 64))

(assert (=> b!187626 (= c!33699 (= lt!92887 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123478 () SeekEntryResult!639)

(assert (=> b!187626 (= e!123478 e!123477)))

(declare-fun lt!92886 () SeekEntryResult!639)

(declare-fun d!55501 () Bool)

(assert (=> d!55501 (and (or ((_ is Undefined!639) lt!92886) (not ((_ is Found!639) lt!92886)) (and (bvsge (index!4727 lt!92886) #b00000000000000000000000000000000) (bvslt (index!4727 lt!92886) (size!4076 (_keys!5772 thiss!1248))))) (or ((_ is Undefined!639) lt!92886) ((_ is Found!639) lt!92886) (not ((_ is MissingVacant!639) lt!92886)) (not (= (index!4729 lt!92886) (index!4728 lt!92767))) (and (bvsge (index!4729 lt!92886) #b00000000000000000000000000000000) (bvslt (index!4729 lt!92886) (size!4076 (_keys!5772 thiss!1248))))) (or ((_ is Undefined!639) lt!92886) (ite ((_ is Found!639) lt!92886) (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4727 lt!92886)) key!828) (and ((_ is MissingVacant!639) lt!92886) (= (index!4729 lt!92886) (index!4728 lt!92767)) (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4729 lt!92886)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55501 (= lt!92886 e!123476)))

(declare-fun c!33700 () Bool)

(assert (=> d!55501 (= c!33700 (bvsge (x!20273 lt!92767) #b01111111111111111111111111111110))))

(assert (=> d!55501 (= lt!92887 (select (arr!3758 (_keys!5772 thiss!1248)) (index!4728 lt!92767)))))

(assert (=> d!55501 (validMask!0 (mask!8966 thiss!1248))))

(assert (=> d!55501 (= (seekKeyOrZeroReturnVacant!0 (x!20273 lt!92767) (index!4728 lt!92767) (index!4728 lt!92767) key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)) lt!92886)))

(declare-fun b!187627 () Bool)

(assert (=> b!187627 (= e!123476 e!123478)))

(declare-fun c!33701 () Bool)

(assert (=> b!187627 (= c!33701 (= lt!92887 key!828))))

(declare-fun b!187628 () Bool)

(assert (=> b!187628 (= e!123478 (Found!639 (index!4728 lt!92767)))))

(declare-fun b!187629 () Bool)

(assert (=> b!187629 (= e!123477 (MissingVacant!639 (index!4728 lt!92767)))))

(assert (= (and d!55501 c!33700) b!187625))

(assert (= (and d!55501 (not c!33700)) b!187627))

(assert (= (and b!187627 c!33701) b!187628))

(assert (= (and b!187627 (not c!33701)) b!187626))

(assert (= (and b!187626 c!33699) b!187629))

(assert (= (and b!187626 (not c!33699)) b!187624))

(declare-fun m!214535 () Bool)

(assert (=> b!187624 m!214535))

(assert (=> b!187624 m!214535))

(declare-fun m!214537 () Bool)

(assert (=> b!187624 m!214537))

(declare-fun m!214539 () Bool)

(assert (=> d!55501 m!214539))

(declare-fun m!214541 () Bool)

(assert (=> d!55501 m!214541))

(assert (=> d!55501 m!214407))

(assert (=> d!55501 m!214337))

(assert (=> b!187458 d!55501))

(declare-fun bm!18904 () Bool)

(declare-fun call!18907 () Bool)

(declare-fun c!33704 () Bool)

(assert (=> bm!18904 (= call!18907 (arrayNoDuplicates!0 (_keys!5772 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33704 (Cons!2348 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000) Nil!2349) Nil!2349)))))

(declare-fun b!187640 () Bool)

(declare-fun e!123487 () Bool)

(assert (=> b!187640 (= e!123487 call!18907)))

(declare-fun b!187641 () Bool)

(assert (=> b!187641 (= e!123487 call!18907)))

(declare-fun b!187642 () Bool)

(declare-fun e!123489 () Bool)

(assert (=> b!187642 (= e!123489 e!123487)))

(assert (=> b!187642 (= c!33704 (validKeyInArray!0 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187643 () Bool)

(declare-fun e!123488 () Bool)

(assert (=> b!187643 (= e!123488 e!123489)))

(declare-fun res!88707 () Bool)

(assert (=> b!187643 (=> (not res!88707) (not e!123489))))

(declare-fun e!123490 () Bool)

(assert (=> b!187643 (= res!88707 (not e!123490))))

(declare-fun res!88706 () Bool)

(assert (=> b!187643 (=> (not res!88706) (not e!123490))))

(assert (=> b!187643 (= res!88706 (validKeyInArray!0 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187644 () Bool)

(declare-fun contains!1305 (List!2352 (_ BitVec 64)) Bool)

(assert (=> b!187644 (= e!123490 (contains!1305 Nil!2349 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55503 () Bool)

(declare-fun res!88708 () Bool)

(assert (=> d!55503 (=> res!88708 e!123488)))

(assert (=> d!55503 (= res!88708 (bvsge #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(assert (=> d!55503 (= (arrayNoDuplicates!0 (_keys!5772 thiss!1248) #b00000000000000000000000000000000 Nil!2349) e!123488)))

(assert (= (and d!55503 (not res!88708)) b!187643))

(assert (= (and b!187643 res!88706) b!187644))

(assert (= (and b!187643 res!88707) b!187642))

(assert (= (and b!187642 c!33704) b!187641))

(assert (= (and b!187642 (not c!33704)) b!187640))

(assert (= (or b!187641 b!187640) bm!18904))

(assert (=> bm!18904 m!214451))

(declare-fun m!214543 () Bool)

(assert (=> bm!18904 m!214543))

(assert (=> b!187642 m!214451))

(assert (=> b!187642 m!214451))

(assert (=> b!187642 m!214453))

(assert (=> b!187643 m!214451))

(assert (=> b!187643 m!214451))

(assert (=> b!187643 m!214453))

(assert (=> b!187644 m!214451))

(assert (=> b!187644 m!214451))

(declare-fun m!214545 () Bool)

(assert (=> b!187644 m!214545))

(assert (=> b!187496 d!55503))

(declare-fun b!187653 () Bool)

(declare-fun res!88718 () Bool)

(declare-fun e!123493 () Bool)

(assert (=> b!187653 (=> (not res!88718) (not e!123493))))

(assert (=> b!187653 (= res!88718 (and (= (size!4077 (_values!3804 thiss!1248)) (bvadd (mask!8966 thiss!1248) #b00000000000000000000000000000001)) (= (size!4076 (_keys!5772 thiss!1248)) (size!4077 (_values!3804 thiss!1248))) (bvsge (_size!1350 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1350 thiss!1248) (bvadd (mask!8966 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!187656 () Bool)

(assert (=> b!187656 (= e!123493 (and (bvsge (extraKeys!3558 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3558 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1350 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!55505 () Bool)

(declare-fun res!88717 () Bool)

(assert (=> d!55505 (=> (not res!88717) (not e!123493))))

(assert (=> d!55505 (= res!88717 (validMask!0 (mask!8966 thiss!1248)))))

(assert (=> d!55505 (= (simpleValid!187 thiss!1248) e!123493)))

(declare-fun b!187655 () Bool)

(declare-fun res!88719 () Bool)

(assert (=> b!187655 (=> (not res!88719) (not e!123493))))

(declare-fun size!4082 (LongMapFixedSize!2602) (_ BitVec 32))

(assert (=> b!187655 (= res!88719 (= (size!4082 thiss!1248) (bvadd (_size!1350 thiss!1248) (bvsdiv (bvadd (extraKeys!3558 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!187654 () Bool)

(declare-fun res!88720 () Bool)

(assert (=> b!187654 (=> (not res!88720) (not e!123493))))

(assert (=> b!187654 (= res!88720 (bvsge (size!4082 thiss!1248) (_size!1350 thiss!1248)))))

(assert (= (and d!55505 res!88717) b!187653))

(assert (= (and b!187653 res!88718) b!187654))

(assert (= (and b!187654 res!88720) b!187655))

(assert (= (and b!187655 res!88719) b!187656))

(assert (=> d!55505 m!214337))

(declare-fun m!214547 () Bool)

(assert (=> b!187655 m!214547))

(assert (=> b!187654 m!214547))

(assert (=> d!55485 d!55505))

(declare-fun d!55507 () Bool)

(declare-fun res!88725 () Bool)

(declare-fun e!123498 () Bool)

(assert (=> d!55507 (=> res!88725 e!123498)))

(assert (=> d!55507 (= res!88725 (= (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55507 (= (arrayContainsKey!0 (_keys!5772 thiss!1248) key!828 #b00000000000000000000000000000000) e!123498)))

(declare-fun b!187661 () Bool)

(declare-fun e!123499 () Bool)

(assert (=> b!187661 (= e!123498 e!123499)))

(declare-fun res!88726 () Bool)

(assert (=> b!187661 (=> (not res!88726) (not e!123499))))

(assert (=> b!187661 (= res!88726 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun b!187662 () Bool)

(assert (=> b!187662 (= e!123499 (arrayContainsKey!0 (_keys!5772 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55507 (not res!88725)) b!187661))

(assert (= (and b!187661 res!88726) b!187662))

(assert (=> d!55507 m!214451))

(declare-fun m!214549 () Bool)

(assert (=> b!187662 m!214549))

(assert (=> bm!18874 d!55507))

(declare-fun d!55509 () Bool)

(assert (=> d!55509 (= (apply!171 (+!291 lt!92849 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248))) lt!92852) (apply!171 lt!92849 lt!92852))))

(declare-fun lt!92890 () Unit!5651)

(declare-fun choose!1005 (ListLongMap!2347 (_ BitVec 64) V!5489 (_ BitVec 64)) Unit!5651)

(assert (=> d!55509 (= lt!92890 (choose!1005 lt!92849 lt!92848 (minValue!3662 thiss!1248) lt!92852))))

(declare-fun e!123502 () Bool)

(assert (=> d!55509 e!123502))

(declare-fun res!88729 () Bool)

(assert (=> d!55509 (=> (not res!88729) (not e!123502))))

(assert (=> d!55509 (= res!88729 (contains!1301 lt!92849 lt!92852))))

(assert (=> d!55509 (= (addApplyDifferent!147 lt!92849 lt!92848 (minValue!3662 thiss!1248) lt!92852) lt!92890)))

(declare-fun b!187666 () Bool)

(assert (=> b!187666 (= e!123502 (not (= lt!92852 lt!92848)))))

(assert (= (and d!55509 res!88729) b!187666))

(assert (=> d!55509 m!214495))

(assert (=> d!55509 m!214499))

(assert (=> d!55509 m!214501))

(declare-fun m!214551 () Bool)

(assert (=> d!55509 m!214551))

(declare-fun m!214553 () Bool)

(assert (=> d!55509 m!214553))

(assert (=> d!55509 m!214499))

(assert (=> b!187548 d!55509))

(declare-fun d!55511 () Bool)

(declare-fun e!123503 () Bool)

(assert (=> d!55511 e!123503))

(declare-fun res!88730 () Bool)

(assert (=> d!55511 (=> (not res!88730) (not e!123503))))

(declare-fun lt!92891 () ListLongMap!2347)

(assert (=> d!55511 (= res!88730 (contains!1301 lt!92891 (_1!1724 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248)))))))

(declare-fun lt!92894 () List!2349)

(assert (=> d!55511 (= lt!92891 (ListLongMap!2348 lt!92894))))

(declare-fun lt!92893 () Unit!5651)

(declare-fun lt!92892 () Unit!5651)

(assert (=> d!55511 (= lt!92893 lt!92892)))

(assert (=> d!55511 (= (getValueByKey!229 lt!92894 (_1!1724 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248)))) (Some!234 (_2!1724 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248)))))))

(assert (=> d!55511 (= lt!92892 (lemmaContainsTupThenGetReturnValue!120 lt!92894 (_1!1724 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248))) (_2!1724 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248)))))))

(assert (=> d!55511 (= lt!92894 (insertStrictlySorted!123 (toList!1189 lt!92850) (_1!1724 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248))) (_2!1724 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248)))))))

(assert (=> d!55511 (= (+!291 lt!92850 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248))) lt!92891)))

(declare-fun b!187667 () Bool)

(declare-fun res!88731 () Bool)

(assert (=> b!187667 (=> (not res!88731) (not e!123503))))

(assert (=> b!187667 (= res!88731 (= (getValueByKey!229 (toList!1189 lt!92891) (_1!1724 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248)))) (Some!234 (_2!1724 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248))))))))

(declare-fun b!187668 () Bool)

(assert (=> b!187668 (= e!123503 (contains!1304 (toList!1189 lt!92891) (tuple2!3427 lt!92835 (minValue!3662 thiss!1248))))))

(assert (= (and d!55511 res!88730) b!187667))

(assert (= (and b!187667 res!88731) b!187668))

(declare-fun m!214555 () Bool)

(assert (=> d!55511 m!214555))

(declare-fun m!214557 () Bool)

(assert (=> d!55511 m!214557))

(declare-fun m!214559 () Bool)

(assert (=> d!55511 m!214559))

(declare-fun m!214561 () Bool)

(assert (=> d!55511 m!214561))

(declare-fun m!214563 () Bool)

(assert (=> b!187667 m!214563))

(declare-fun m!214565 () Bool)

(assert (=> b!187668 m!214565))

(assert (=> b!187548 d!55511))

(declare-fun d!55513 () Bool)

(assert (=> d!55513 (contains!1301 (+!291 lt!92843 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248))) lt!92839)))

(declare-fun lt!92897 () Unit!5651)

(declare-fun choose!1006 (ListLongMap!2347 (_ BitVec 64) V!5489 (_ BitVec 64)) Unit!5651)

(assert (=> d!55513 (= lt!92897 (choose!1006 lt!92843 lt!92837 (zeroValue!3662 thiss!1248) lt!92839))))

(assert (=> d!55513 (contains!1301 lt!92843 lt!92839)))

(assert (=> d!55513 (= (addStillContains!147 lt!92843 lt!92837 (zeroValue!3662 thiss!1248) lt!92839) lt!92897)))

(declare-fun bs!7581 () Bool)

(assert (= bs!7581 d!55513))

(assert (=> bs!7581 m!214475))

(assert (=> bs!7581 m!214475))

(assert (=> bs!7581 m!214479))

(declare-fun m!214567 () Bool)

(assert (=> bs!7581 m!214567))

(declare-fun m!214569 () Bool)

(assert (=> bs!7581 m!214569))

(assert (=> b!187548 d!55513))

(declare-fun d!55515 () Bool)

(declare-fun e!123505 () Bool)

(assert (=> d!55515 e!123505))

(declare-fun res!88732 () Bool)

(assert (=> d!55515 (=> res!88732 e!123505)))

(declare-fun lt!92901 () Bool)

(assert (=> d!55515 (= res!88732 (not lt!92901))))

(declare-fun lt!92900 () Bool)

(assert (=> d!55515 (= lt!92901 lt!92900)))

(declare-fun lt!92899 () Unit!5651)

(declare-fun e!123504 () Unit!5651)

(assert (=> d!55515 (= lt!92899 e!123504)))

(declare-fun c!33705 () Bool)

(assert (=> d!55515 (= c!33705 lt!92900)))

(assert (=> d!55515 (= lt!92900 (containsKey!232 (toList!1189 (+!291 lt!92843 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248)))) lt!92839))))

(assert (=> d!55515 (= (contains!1301 (+!291 lt!92843 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248))) lt!92839) lt!92901)))

(declare-fun b!187670 () Bool)

(declare-fun lt!92898 () Unit!5651)

(assert (=> b!187670 (= e!123504 lt!92898)))

(assert (=> b!187670 (= lt!92898 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1189 (+!291 lt!92843 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248)))) lt!92839))))

(assert (=> b!187670 (isDefined!181 (getValueByKey!229 (toList!1189 (+!291 lt!92843 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248)))) lt!92839))))

(declare-fun b!187671 () Bool)

(declare-fun Unit!5662 () Unit!5651)

(assert (=> b!187671 (= e!123504 Unit!5662)))

(declare-fun b!187672 () Bool)

(assert (=> b!187672 (= e!123505 (isDefined!181 (getValueByKey!229 (toList!1189 (+!291 lt!92843 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248)))) lt!92839)))))

(assert (= (and d!55515 c!33705) b!187670))

(assert (= (and d!55515 (not c!33705)) b!187671))

(assert (= (and d!55515 (not res!88732)) b!187672))

(declare-fun m!214571 () Bool)

(assert (=> d!55515 m!214571))

(declare-fun m!214573 () Bool)

(assert (=> b!187670 m!214573))

(declare-fun m!214575 () Bool)

(assert (=> b!187670 m!214575))

(assert (=> b!187670 m!214575))

(declare-fun m!214577 () Bool)

(assert (=> b!187670 m!214577))

(assert (=> b!187672 m!214575))

(assert (=> b!187672 m!214575))

(assert (=> b!187672 m!214577))

(assert (=> b!187548 d!55515))

(declare-fun d!55517 () Bool)

(declare-fun get!2173 (Option!235) V!5489)

(assert (=> d!55517 (= (apply!171 lt!92834 lt!92853) (get!2173 (getValueByKey!229 (toList!1189 lt!92834) lt!92853)))))

(declare-fun bs!7582 () Bool)

(assert (= bs!7582 d!55517))

(declare-fun m!214579 () Bool)

(assert (=> bs!7582 m!214579))

(assert (=> bs!7582 m!214579))

(declare-fun m!214581 () Bool)

(assert (=> bs!7582 m!214581))

(assert (=> b!187548 d!55517))

(declare-fun d!55519 () Bool)

(assert (=> d!55519 (= (apply!171 (+!291 lt!92834 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248))) lt!92853) (apply!171 lt!92834 lt!92853))))

(declare-fun lt!92902 () Unit!5651)

(assert (=> d!55519 (= lt!92902 (choose!1005 lt!92834 lt!92833 (zeroValue!3662 thiss!1248) lt!92853))))

(declare-fun e!123506 () Bool)

(assert (=> d!55519 e!123506))

(declare-fun res!88733 () Bool)

(assert (=> d!55519 (=> (not res!88733) (not e!123506))))

(assert (=> d!55519 (= res!88733 (contains!1301 lt!92834 lt!92853))))

(assert (=> d!55519 (= (addApplyDifferent!147 lt!92834 lt!92833 (zeroValue!3662 thiss!1248) lt!92853) lt!92902)))

(declare-fun b!187673 () Bool)

(assert (=> b!187673 (= e!123506 (not (= lt!92853 lt!92833)))))

(assert (= (and d!55519 res!88733) b!187673))

(assert (=> d!55519 m!214489))

(assert (=> d!55519 m!214485))

(assert (=> d!55519 m!214487))

(declare-fun m!214583 () Bool)

(assert (=> d!55519 m!214583))

(declare-fun m!214585 () Bool)

(assert (=> d!55519 m!214585))

(assert (=> d!55519 m!214485))

(assert (=> b!187548 d!55519))

(declare-fun d!55521 () Bool)

(declare-fun e!123507 () Bool)

(assert (=> d!55521 e!123507))

(declare-fun res!88734 () Bool)

(assert (=> d!55521 (=> (not res!88734) (not e!123507))))

(declare-fun lt!92903 () ListLongMap!2347)

(assert (=> d!55521 (= res!88734 (contains!1301 lt!92903 (_1!1724 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248)))))))

(declare-fun lt!92906 () List!2349)

(assert (=> d!55521 (= lt!92903 (ListLongMap!2348 lt!92906))))

(declare-fun lt!92905 () Unit!5651)

(declare-fun lt!92904 () Unit!5651)

(assert (=> d!55521 (= lt!92905 lt!92904)))

(assert (=> d!55521 (= (getValueByKey!229 lt!92906 (_1!1724 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248)))) (Some!234 (_2!1724 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248)))))))

(assert (=> d!55521 (= lt!92904 (lemmaContainsTupThenGetReturnValue!120 lt!92906 (_1!1724 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248))) (_2!1724 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248)))))))

(assert (=> d!55521 (= lt!92906 (insertStrictlySorted!123 (toList!1189 lt!92843) (_1!1724 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248))) (_2!1724 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248)))))))

(assert (=> d!55521 (= (+!291 lt!92843 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248))) lt!92903)))

(declare-fun b!187674 () Bool)

(declare-fun res!88735 () Bool)

(assert (=> b!187674 (=> (not res!88735) (not e!123507))))

(assert (=> b!187674 (= res!88735 (= (getValueByKey!229 (toList!1189 lt!92903) (_1!1724 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248)))) (Some!234 (_2!1724 (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248))))))))

(declare-fun b!187675 () Bool)

(assert (=> b!187675 (= e!123507 (contains!1304 (toList!1189 lt!92903) (tuple2!3427 lt!92837 (zeroValue!3662 thiss!1248))))))

(assert (= (and d!55521 res!88734) b!187674))

(assert (= (and b!187674 res!88735) b!187675))

(declare-fun m!214587 () Bool)

(assert (=> d!55521 m!214587))

(declare-fun m!214589 () Bool)

(assert (=> d!55521 m!214589))

(declare-fun m!214591 () Bool)

(assert (=> d!55521 m!214591))

(declare-fun m!214593 () Bool)

(assert (=> d!55521 m!214593))

(declare-fun m!214595 () Bool)

(assert (=> b!187674 m!214595))

(declare-fun m!214597 () Bool)

(assert (=> b!187675 m!214597))

(assert (=> b!187548 d!55521))

(declare-fun d!55523 () Bool)

(assert (=> d!55523 (= (apply!171 (+!291 lt!92850 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248))) lt!92842) (get!2173 (getValueByKey!229 (toList!1189 (+!291 lt!92850 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248)))) lt!92842)))))

(declare-fun bs!7583 () Bool)

(assert (= bs!7583 d!55523))

(declare-fun m!214599 () Bool)

(assert (=> bs!7583 m!214599))

(assert (=> bs!7583 m!214599))

(declare-fun m!214601 () Bool)

(assert (=> bs!7583 m!214601))

(assert (=> b!187548 d!55523))

(declare-fun d!55525 () Bool)

(assert (=> d!55525 (= (apply!171 lt!92850 lt!92842) (get!2173 (getValueByKey!229 (toList!1189 lt!92850) lt!92842)))))

(declare-fun bs!7584 () Bool)

(assert (= bs!7584 d!55525))

(declare-fun m!214603 () Bool)

(assert (=> bs!7584 m!214603))

(assert (=> bs!7584 m!214603))

(declare-fun m!214605 () Bool)

(assert (=> bs!7584 m!214605))

(assert (=> b!187548 d!55525))

(declare-fun b!187700 () Bool)

(declare-fun e!123523 () Bool)

(declare-fun e!123524 () Bool)

(assert (=> b!187700 (= e!123523 e!123524)))

(assert (=> b!187700 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun res!88747 () Bool)

(declare-fun lt!92927 () ListLongMap!2347)

(assert (=> b!187700 (= res!88747 (contains!1301 lt!92927 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187700 (=> (not res!88747) (not e!123524))))

(declare-fun b!187701 () Bool)

(declare-fun e!123528 () ListLongMap!2347)

(declare-fun call!18910 () ListLongMap!2347)

(assert (=> b!187701 (= e!123528 call!18910)))

(declare-fun b!187702 () Bool)

(declare-fun e!123525 () ListLongMap!2347)

(assert (=> b!187702 (= e!123525 e!123528)))

(declare-fun c!33717 () Bool)

(assert (=> b!187702 (= c!33717 (validKeyInArray!0 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187703 () Bool)

(assert (=> b!187703 (= e!123525 (ListLongMap!2348 Nil!2346))))

(declare-fun d!55527 () Bool)

(declare-fun e!123526 () Bool)

(assert (=> d!55527 e!123526))

(declare-fun res!88745 () Bool)

(assert (=> d!55527 (=> (not res!88745) (not e!123526))))

(assert (=> d!55527 (= res!88745 (not (contains!1301 lt!92927 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55527 (= lt!92927 e!123525)))

(declare-fun c!33715 () Bool)

(assert (=> d!55527 (= c!33715 (bvsge #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(assert (=> d!55527 (validMask!0 (mask!8966 thiss!1248))))

(assert (=> d!55527 (= (getCurrentListMapNoExtraKeys!202 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)) lt!92927)))

(declare-fun b!187704 () Bool)

(declare-fun e!123522 () Bool)

(assert (=> b!187704 (= e!123522 (= lt!92927 (getCurrentListMapNoExtraKeys!202 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3821 thiss!1248))))))

(declare-fun b!187705 () Bool)

(assert (=> b!187705 (= e!123523 e!123522)))

(declare-fun c!33714 () Bool)

(assert (=> b!187705 (= c!33714 (bvslt #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun b!187706 () Bool)

(declare-fun res!88746 () Bool)

(assert (=> b!187706 (=> (not res!88746) (not e!123526))))

(assert (=> b!187706 (= res!88746 (not (contains!1301 lt!92927 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!187707 () Bool)

(declare-fun isEmpty!481 (ListLongMap!2347) Bool)

(assert (=> b!187707 (= e!123522 (isEmpty!481 lt!92927))))

(declare-fun b!187708 () Bool)

(assert (=> b!187708 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(assert (=> b!187708 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4077 (_values!3804 thiss!1248))))))

(assert (=> b!187708 (= e!123524 (= (apply!171 lt!92927 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)) (get!2172 (select (arr!3759 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!18907 () Bool)

(assert (=> bm!18907 (= call!18910 (getCurrentListMapNoExtraKeys!202 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3821 thiss!1248)))))

(declare-fun b!187709 () Bool)

(assert (=> b!187709 (= e!123526 e!123523)))

(declare-fun c!33716 () Bool)

(declare-fun e!123527 () Bool)

(assert (=> b!187709 (= c!33716 e!123527)))

(declare-fun res!88744 () Bool)

(assert (=> b!187709 (=> (not res!88744) (not e!123527))))

(assert (=> b!187709 (= res!88744 (bvslt #b00000000000000000000000000000000 (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun b!187710 () Bool)

(declare-fun lt!92922 () Unit!5651)

(declare-fun lt!92924 () Unit!5651)

(assert (=> b!187710 (= lt!92922 lt!92924)))

(declare-fun lt!92926 () (_ BitVec 64))

(declare-fun lt!92921 () ListLongMap!2347)

(declare-fun lt!92925 () (_ BitVec 64))

(declare-fun lt!92923 () V!5489)

(assert (=> b!187710 (not (contains!1301 (+!291 lt!92921 (tuple2!3427 lt!92925 lt!92923)) lt!92926))))

(declare-fun addStillNotContains!93 (ListLongMap!2347 (_ BitVec 64) V!5489 (_ BitVec 64)) Unit!5651)

(assert (=> b!187710 (= lt!92924 (addStillNotContains!93 lt!92921 lt!92925 lt!92923 lt!92926))))

(assert (=> b!187710 (= lt!92926 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!187710 (= lt!92923 (get!2172 (select (arr!3759 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187710 (= lt!92925 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187710 (= lt!92921 call!18910)))

(assert (=> b!187710 (= e!123528 (+!291 call!18910 (tuple2!3427 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000) (get!2172 (select (arr!3759 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!187711 () Bool)

(assert (=> b!187711 (= e!123527 (validKeyInArray!0 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187711 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!55527 c!33715) b!187703))

(assert (= (and d!55527 (not c!33715)) b!187702))

(assert (= (and b!187702 c!33717) b!187710))

(assert (= (and b!187702 (not c!33717)) b!187701))

(assert (= (or b!187710 b!187701) bm!18907))

(assert (= (and d!55527 res!88745) b!187706))

(assert (= (and b!187706 res!88746) b!187709))

(assert (= (and b!187709 res!88744) b!187711))

(assert (= (and b!187709 c!33716) b!187700))

(assert (= (and b!187709 (not c!33716)) b!187705))

(assert (= (and b!187700 res!88747) b!187708))

(assert (= (and b!187705 c!33714) b!187704))

(assert (= (and b!187705 (not c!33714)) b!187707))

(declare-fun b_lambda!7313 () Bool)

(assert (=> (not b_lambda!7313) (not b!187708)))

(assert (=> b!187708 t!7237))

(declare-fun b_and!11249 () Bool)

(assert (= b_and!11247 (and (=> t!7237 result!4829) b_and!11249)))

(declare-fun b_lambda!7315 () Bool)

(assert (=> (not b_lambda!7315) (not b!187710)))

(assert (=> b!187710 t!7237))

(declare-fun b_and!11251 () Bool)

(assert (= b_and!11249 (and (=> t!7237 result!4829) b_and!11251)))

(assert (=> b!187710 m!214459))

(assert (=> b!187710 m!214461))

(assert (=> b!187710 m!214465))

(assert (=> b!187710 m!214461))

(declare-fun m!214607 () Bool)

(assert (=> b!187710 m!214607))

(declare-fun m!214609 () Bool)

(assert (=> b!187710 m!214609))

(assert (=> b!187710 m!214451))

(assert (=> b!187710 m!214459))

(assert (=> b!187710 m!214607))

(declare-fun m!214611 () Bool)

(assert (=> b!187710 m!214611))

(declare-fun m!214613 () Bool)

(assert (=> b!187710 m!214613))

(declare-fun m!214615 () Bool)

(assert (=> b!187706 m!214615))

(declare-fun m!214617 () Bool)

(assert (=> bm!18907 m!214617))

(declare-fun m!214619 () Bool)

(assert (=> d!55527 m!214619))

(assert (=> d!55527 m!214337))

(assert (=> b!187700 m!214451))

(assert (=> b!187700 m!214451))

(declare-fun m!214621 () Bool)

(assert (=> b!187700 m!214621))

(assert (=> b!187711 m!214451))

(assert (=> b!187711 m!214451))

(assert (=> b!187711 m!214453))

(assert (=> b!187702 m!214451))

(assert (=> b!187702 m!214451))

(assert (=> b!187702 m!214453))

(declare-fun m!214623 () Bool)

(assert (=> b!187707 m!214623))

(assert (=> b!187708 m!214459))

(assert (=> b!187708 m!214461))

(assert (=> b!187708 m!214465))

(assert (=> b!187708 m!214461))

(assert (=> b!187708 m!214451))

(assert (=> b!187708 m!214459))

(assert (=> b!187708 m!214451))

(declare-fun m!214625 () Bool)

(assert (=> b!187708 m!214625))

(assert (=> b!187704 m!214617))

(assert (=> b!187548 d!55527))

(declare-fun d!55529 () Bool)

(assert (=> d!55529 (= (apply!171 (+!291 lt!92834 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248))) lt!92853) (get!2173 (getValueByKey!229 (toList!1189 (+!291 lt!92834 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248)))) lt!92853)))))

(declare-fun bs!7585 () Bool)

(assert (= bs!7585 d!55529))

(declare-fun m!214627 () Bool)

(assert (=> bs!7585 m!214627))

(assert (=> bs!7585 m!214627))

(declare-fun m!214629 () Bool)

(assert (=> bs!7585 m!214629))

(assert (=> b!187548 d!55529))

(declare-fun d!55531 () Bool)

(assert (=> d!55531 (= (apply!171 lt!92849 lt!92852) (get!2173 (getValueByKey!229 (toList!1189 lt!92849) lt!92852)))))

(declare-fun bs!7586 () Bool)

(assert (= bs!7586 d!55531))

(declare-fun m!214631 () Bool)

(assert (=> bs!7586 m!214631))

(assert (=> bs!7586 m!214631))

(declare-fun m!214633 () Bool)

(assert (=> bs!7586 m!214633))

(assert (=> b!187548 d!55531))

(declare-fun d!55533 () Bool)

(declare-fun e!123529 () Bool)

(assert (=> d!55533 e!123529))

(declare-fun res!88748 () Bool)

(assert (=> d!55533 (=> (not res!88748) (not e!123529))))

(declare-fun lt!92928 () ListLongMap!2347)

(assert (=> d!55533 (= res!88748 (contains!1301 lt!92928 (_1!1724 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248)))))))

(declare-fun lt!92931 () List!2349)

(assert (=> d!55533 (= lt!92928 (ListLongMap!2348 lt!92931))))

(declare-fun lt!92930 () Unit!5651)

(declare-fun lt!92929 () Unit!5651)

(assert (=> d!55533 (= lt!92930 lt!92929)))

(assert (=> d!55533 (= (getValueByKey!229 lt!92931 (_1!1724 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248)))) (Some!234 (_2!1724 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248)))))))

(assert (=> d!55533 (= lt!92929 (lemmaContainsTupThenGetReturnValue!120 lt!92931 (_1!1724 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248))) (_2!1724 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248)))))))

(assert (=> d!55533 (= lt!92931 (insertStrictlySorted!123 (toList!1189 lt!92849) (_1!1724 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248))) (_2!1724 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248)))))))

(assert (=> d!55533 (= (+!291 lt!92849 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248))) lt!92928)))

(declare-fun b!187712 () Bool)

(declare-fun res!88749 () Bool)

(assert (=> b!187712 (=> (not res!88749) (not e!123529))))

(assert (=> b!187712 (= res!88749 (= (getValueByKey!229 (toList!1189 lt!92928) (_1!1724 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248)))) (Some!234 (_2!1724 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248))))))))

(declare-fun b!187713 () Bool)

(assert (=> b!187713 (= e!123529 (contains!1304 (toList!1189 lt!92928) (tuple2!3427 lt!92848 (minValue!3662 thiss!1248))))))

(assert (= (and d!55533 res!88748) b!187712))

(assert (= (and b!187712 res!88749) b!187713))

(declare-fun m!214635 () Bool)

(assert (=> d!55533 m!214635))

(declare-fun m!214637 () Bool)

(assert (=> d!55533 m!214637))

(declare-fun m!214639 () Bool)

(assert (=> d!55533 m!214639))

(declare-fun m!214641 () Bool)

(assert (=> d!55533 m!214641))

(declare-fun m!214643 () Bool)

(assert (=> b!187712 m!214643))

(declare-fun m!214645 () Bool)

(assert (=> b!187713 m!214645))

(assert (=> b!187548 d!55533))

(declare-fun d!55535 () Bool)

(assert (=> d!55535 (= (apply!171 (+!291 lt!92850 (tuple2!3427 lt!92835 (minValue!3662 thiss!1248))) lt!92842) (apply!171 lt!92850 lt!92842))))

(declare-fun lt!92932 () Unit!5651)

(assert (=> d!55535 (= lt!92932 (choose!1005 lt!92850 lt!92835 (minValue!3662 thiss!1248) lt!92842))))

(declare-fun e!123530 () Bool)

(assert (=> d!55535 e!123530))

(declare-fun res!88750 () Bool)

(assert (=> d!55535 (=> (not res!88750) (not e!123530))))

(assert (=> d!55535 (= res!88750 (contains!1301 lt!92850 lt!92842))))

(assert (=> d!55535 (= (addApplyDifferent!147 lt!92850 lt!92835 (minValue!3662 thiss!1248) lt!92842) lt!92932)))

(declare-fun b!187714 () Bool)

(assert (=> b!187714 (= e!123530 (not (= lt!92842 lt!92835)))))

(assert (= (and d!55535 res!88750) b!187714))

(assert (=> d!55535 m!214493))

(assert (=> d!55535 m!214483))

(assert (=> d!55535 m!214497))

(declare-fun m!214647 () Bool)

(assert (=> d!55535 m!214647))

(declare-fun m!214649 () Bool)

(assert (=> d!55535 m!214649))

(assert (=> d!55535 m!214483))

(assert (=> b!187548 d!55535))

(declare-fun d!55537 () Bool)

(declare-fun e!123531 () Bool)

(assert (=> d!55537 e!123531))

(declare-fun res!88751 () Bool)

(assert (=> d!55537 (=> (not res!88751) (not e!123531))))

(declare-fun lt!92933 () ListLongMap!2347)

(assert (=> d!55537 (= res!88751 (contains!1301 lt!92933 (_1!1724 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248)))))))

(declare-fun lt!92936 () List!2349)

(assert (=> d!55537 (= lt!92933 (ListLongMap!2348 lt!92936))))

(declare-fun lt!92935 () Unit!5651)

(declare-fun lt!92934 () Unit!5651)

(assert (=> d!55537 (= lt!92935 lt!92934)))

(assert (=> d!55537 (= (getValueByKey!229 lt!92936 (_1!1724 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248)))) (Some!234 (_2!1724 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248)))))))

(assert (=> d!55537 (= lt!92934 (lemmaContainsTupThenGetReturnValue!120 lt!92936 (_1!1724 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248))) (_2!1724 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248)))))))

(assert (=> d!55537 (= lt!92936 (insertStrictlySorted!123 (toList!1189 lt!92834) (_1!1724 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248))) (_2!1724 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248)))))))

(assert (=> d!55537 (= (+!291 lt!92834 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248))) lt!92933)))

(declare-fun b!187715 () Bool)

(declare-fun res!88752 () Bool)

(assert (=> b!187715 (=> (not res!88752) (not e!123531))))

(assert (=> b!187715 (= res!88752 (= (getValueByKey!229 (toList!1189 lt!92933) (_1!1724 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248)))) (Some!234 (_2!1724 (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248))))))))

(declare-fun b!187716 () Bool)

(assert (=> b!187716 (= e!123531 (contains!1304 (toList!1189 lt!92933) (tuple2!3427 lt!92833 (zeroValue!3662 thiss!1248))))))

(assert (= (and d!55537 res!88751) b!187715))

(assert (= (and b!187715 res!88752) b!187716))

(declare-fun m!214651 () Bool)

(assert (=> d!55537 m!214651))

(declare-fun m!214653 () Bool)

(assert (=> d!55537 m!214653))

(declare-fun m!214655 () Bool)

(assert (=> d!55537 m!214655))

(declare-fun m!214657 () Bool)

(assert (=> d!55537 m!214657))

(declare-fun m!214659 () Bool)

(assert (=> b!187715 m!214659))

(declare-fun m!214661 () Bool)

(assert (=> b!187716 m!214661))

(assert (=> b!187548 d!55537))

(declare-fun d!55539 () Bool)

(assert (=> d!55539 (= (apply!171 (+!291 lt!92849 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248))) lt!92852) (get!2173 (getValueByKey!229 (toList!1189 (+!291 lt!92849 (tuple2!3427 lt!92848 (minValue!3662 thiss!1248)))) lt!92852)))))

(declare-fun bs!7587 () Bool)

(assert (= bs!7587 d!55539))

(declare-fun m!214663 () Bool)

(assert (=> bs!7587 m!214663))

(assert (=> bs!7587 m!214663))

(declare-fun m!214665 () Bool)

(assert (=> bs!7587 m!214665))

(assert (=> b!187548 d!55539))

(declare-fun d!55541 () Bool)

(assert (=> d!55541 (= (validKeyInArray!0 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187566 d!55541))

(assert (=> bm!18895 d!55527))

(declare-fun d!55543 () Bool)

(assert (=> d!55543 (= (inRange!0 (index!4727 lt!92759) (mask!8966 thiss!1248)) (and (bvsge (index!4727 lt!92759) #b00000000000000000000000000000000) (bvslt (index!4727 lt!92759) (bvadd (mask!8966 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187444 d!55543))

(declare-fun d!55545 () Bool)

(assert (=> d!55545 (= (apply!171 lt!92840 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2173 (getValueByKey!229 (toList!1189 lt!92840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7588 () Bool)

(assert (= bs!7588 d!55545))

(declare-fun m!214667 () Bool)

(assert (=> bs!7588 m!214667))

(assert (=> bs!7588 m!214667))

(declare-fun m!214669 () Bool)

(assert (=> bs!7588 m!214669))

(assert (=> b!187565 d!55545))

(declare-fun d!55547 () Bool)

(assert (=> d!55547 (= (inRange!0 (ite c!33660 (index!4726 lt!92775) (index!4729 lt!92775)) (mask!8966 thiss!1248)) (and (bvsge (ite c!33660 (index!4726 lt!92775) (index!4729 lt!92775)) #b00000000000000000000000000000000) (bvslt (ite c!33660 (index!4726 lt!92775) (index!4729 lt!92775)) (bvadd (mask!8966 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18873 d!55547))

(declare-fun d!55549 () Bool)

(declare-fun isEmpty!482 (Option!235) Bool)

(assert (=> d!55549 (= (isDefined!181 (getValueByKey!229 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828)) (not (isEmpty!482 (getValueByKey!229 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))))

(declare-fun bs!7589 () Bool)

(assert (= bs!7589 d!55549))

(assert (=> bs!7589 m!214441))

(declare-fun m!214671 () Bool)

(assert (=> bs!7589 m!214671))

(assert (=> b!187505 d!55549))

(declare-fun d!55551 () Bool)

(declare-fun c!33722 () Bool)

(assert (=> d!55551 (= c!33722 (and ((_ is Cons!2345) (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) (= (_1!1724 (h!2980 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) key!828)))))

(declare-fun e!123536 () Option!235)

(assert (=> d!55551 (= (getValueByKey!229 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828) e!123536)))

(declare-fun b!187725 () Bool)

(assert (=> b!187725 (= e!123536 (Some!234 (_2!1724 (h!2980 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))))))

(declare-fun b!187727 () Bool)

(declare-fun e!123537 () Option!235)

(assert (=> b!187727 (= e!123537 (getValueByKey!229 (t!7233 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) key!828))))

(declare-fun b!187728 () Bool)

(assert (=> b!187728 (= e!123537 None!233)))

(declare-fun b!187726 () Bool)

(assert (=> b!187726 (= e!123536 e!123537)))

(declare-fun c!33723 () Bool)

(assert (=> b!187726 (= c!33723 (and ((_ is Cons!2345) (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) (not (= (_1!1724 (h!2980 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) key!828))))))

(assert (= (and d!55551 c!33722) b!187725))

(assert (= (and d!55551 (not c!33722)) b!187726))

(assert (= (and b!187726 c!33723) b!187727))

(assert (= (and b!187726 (not c!33723)) b!187728))

(declare-fun m!214673 () Bool)

(assert (=> b!187727 m!214673))

(assert (=> b!187505 d!55551))

(declare-fun d!55553 () Bool)

(declare-fun e!123539 () Bool)

(assert (=> d!55553 e!123539))

(declare-fun res!88753 () Bool)

(assert (=> d!55553 (=> res!88753 e!123539)))

(declare-fun lt!92940 () Bool)

(assert (=> d!55553 (= res!88753 (not lt!92940))))

(declare-fun lt!92939 () Bool)

(assert (=> d!55553 (= lt!92940 lt!92939)))

(declare-fun lt!92938 () Unit!5651)

(declare-fun e!123538 () Unit!5651)

(assert (=> d!55553 (= lt!92938 e!123538)))

(declare-fun c!33724 () Bool)

(assert (=> d!55553 (= c!33724 lt!92939)))

(assert (=> d!55553 (= lt!92939 (containsKey!232 (toList!1189 lt!92840) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55553 (= (contains!1301 lt!92840 #b0000000000000000000000000000000000000000000000000000000000000000) lt!92940)))

(declare-fun b!187729 () Bool)

(declare-fun lt!92937 () Unit!5651)

(assert (=> b!187729 (= e!123538 lt!92937)))

(assert (=> b!187729 (= lt!92937 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1189 lt!92840) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187729 (isDefined!181 (getValueByKey!229 (toList!1189 lt!92840) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187730 () Bool)

(declare-fun Unit!5663 () Unit!5651)

(assert (=> b!187730 (= e!123538 Unit!5663)))

(declare-fun b!187731 () Bool)

(assert (=> b!187731 (= e!123539 (isDefined!181 (getValueByKey!229 (toList!1189 lt!92840) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55553 c!33724) b!187729))

(assert (= (and d!55553 (not c!33724)) b!187730))

(assert (= (and d!55553 (not res!88753)) b!187731))

(declare-fun m!214675 () Bool)

(assert (=> d!55553 m!214675))

(declare-fun m!214677 () Bool)

(assert (=> b!187729 m!214677))

(declare-fun m!214679 () Bool)

(assert (=> b!187729 m!214679))

(assert (=> b!187729 m!214679))

(declare-fun m!214681 () Bool)

(assert (=> b!187729 m!214681))

(assert (=> b!187731 m!214679))

(assert (=> b!187731 m!214679))

(assert (=> b!187731 m!214681))

(assert (=> bm!18892 d!55553))

(assert (=> d!55483 d!55477))

(declare-fun b!187748 () Bool)

(declare-fun res!88765 () Bool)

(declare-fun lt!92943 () SeekEntryResult!639)

(assert (=> b!187748 (= res!88765 (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4726 lt!92943)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123548 () Bool)

(assert (=> b!187748 (=> (not res!88765) (not e!123548))))

(declare-fun b!187749 () Bool)

(declare-fun e!123550 () Bool)

(assert (=> b!187749 (= e!123550 ((_ is Undefined!639) lt!92943))))

(declare-fun b!187750 () Bool)

(declare-fun e!123551 () Bool)

(declare-fun call!18916 () Bool)

(assert (=> b!187750 (= e!123551 (not call!18916))))

(declare-fun b!187751 () Bool)

(declare-fun e!123549 () Bool)

(assert (=> b!187751 (= e!123549 e!123550)))

(declare-fun c!33729 () Bool)

(assert (=> b!187751 (= c!33729 ((_ is MissingVacant!639) lt!92943))))

(declare-fun bm!18912 () Bool)

(declare-fun c!33730 () Bool)

(declare-fun call!18915 () Bool)

(assert (=> bm!18912 (= call!18915 (inRange!0 (ite c!33730 (index!4726 lt!92943) (index!4729 lt!92943)) (mask!8966 thiss!1248)))))

(declare-fun b!187752 () Bool)

(assert (=> b!187752 (= e!123549 e!123548)))

(declare-fun res!88762 () Bool)

(assert (=> b!187752 (= res!88762 call!18915)))

(assert (=> b!187752 (=> (not res!88762) (not e!123548))))

(declare-fun b!187753 () Bool)

(declare-fun res!88763 () Bool)

(assert (=> b!187753 (=> (not res!88763) (not e!123551))))

(assert (=> b!187753 (= res!88763 (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4729 lt!92943)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!55555 () Bool)

(assert (=> d!55555 e!123549))

(assert (=> d!55555 (= c!33730 ((_ is MissingZero!639) lt!92943))))

(assert (=> d!55555 (= lt!92943 (seekEntryOrOpen!0 key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)))))

(assert (=> d!55555 true))

(declare-fun _$34!1069 () Unit!5651)

(assert (=> d!55555 (= (choose!1004 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)) _$34!1069)))

(declare-fun b!187754 () Bool)

(declare-fun res!88764 () Bool)

(assert (=> b!187754 (=> (not res!88764) (not e!123551))))

(assert (=> b!187754 (= res!88764 call!18915)))

(assert (=> b!187754 (= e!123550 e!123551)))

(declare-fun bm!18913 () Bool)

(assert (=> bm!18913 (= call!18916 (arrayContainsKey!0 (_keys!5772 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!187755 () Bool)

(assert (=> b!187755 (= e!123548 (not call!18916))))

(assert (= (and d!55555 c!33730) b!187752))

(assert (= (and d!55555 (not c!33730)) b!187751))

(assert (= (and b!187752 res!88762) b!187748))

(assert (= (and b!187748 res!88765) b!187755))

(assert (= (and b!187751 c!33729) b!187754))

(assert (= (and b!187751 (not c!33729)) b!187749))

(assert (= (and b!187754 res!88764) b!187753))

(assert (= (and b!187753 res!88763) b!187750))

(assert (= (or b!187752 b!187754) bm!18912))

(assert (= (or b!187755 b!187750) bm!18913))

(declare-fun m!214683 () Bool)

(assert (=> bm!18912 m!214683))

(assert (=> d!55555 m!214327))

(assert (=> bm!18913 m!214421))

(declare-fun m!214685 () Bool)

(assert (=> b!187753 m!214685))

(declare-fun m!214687 () Bool)

(assert (=> b!187748 m!214687))

(assert (=> d!55483 d!55555))

(assert (=> d!55483 d!55487))

(declare-fun d!55557 () Bool)

(assert (=> d!55557 (= (apply!171 lt!92840 (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000)) (get!2173 (getValueByKey!229 (toList!1189 lt!92840) (select (arr!3758 (_keys!5772 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7590 () Bool)

(assert (= bs!7590 d!55557))

(assert (=> bs!7590 m!214451))

(assert (=> bs!7590 m!214509))

(assert (=> bs!7590 m!214509))

(declare-fun m!214689 () Bool)

(assert (=> bs!7590 m!214689))

(assert (=> b!187551 d!55557))

(declare-fun d!55559 () Bool)

(declare-fun c!33733 () Bool)

(assert (=> d!55559 (= c!33733 ((_ is ValueCellFull!1847) (select (arr!3759 (_values!3804 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!123554 () V!5489)

(assert (=> d!55559 (= (get!2172 (select (arr!3759 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!123554)))

(declare-fun b!187760 () Bool)

(declare-fun get!2174 (ValueCell!1847 V!5489) V!5489)

(assert (=> b!187760 (= e!123554 (get!2174 (select (arr!3759 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!187761 () Bool)

(declare-fun get!2175 (ValueCell!1847 V!5489) V!5489)

(assert (=> b!187761 (= e!123554 (get!2175 (select (arr!3759 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55559 c!33733) b!187760))

(assert (= (and d!55559 (not c!33733)) b!187761))

(assert (=> b!187760 m!214459))

(assert (=> b!187760 m!214461))

(declare-fun m!214691 () Bool)

(assert (=> b!187760 m!214691))

(assert (=> b!187761 m!214459))

(assert (=> b!187761 m!214461))

(declare-fun m!214693 () Bool)

(assert (=> b!187761 m!214693))

(assert (=> b!187551 d!55559))

(declare-fun d!55561 () Bool)

(assert (=> d!55561 (= (apply!171 lt!92840 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2173 (getValueByKey!229 (toList!1189 lt!92840) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7591 () Bool)

(assert (= bs!7591 d!55561))

(assert (=> bs!7591 m!214679))

(assert (=> bs!7591 m!214679))

(declare-fun m!214695 () Bool)

(assert (=> bs!7591 m!214695))

(assert (=> b!187568 d!55561))

(declare-fun d!55563 () Bool)

(declare-fun e!123556 () Bool)

(assert (=> d!55563 e!123556))

(declare-fun res!88766 () Bool)

(assert (=> d!55563 (=> res!88766 e!123556)))

(declare-fun lt!92947 () Bool)

(assert (=> d!55563 (= res!88766 (not lt!92947))))

(declare-fun lt!92946 () Bool)

(assert (=> d!55563 (= lt!92947 lt!92946)))

(declare-fun lt!92945 () Unit!5651)

(declare-fun e!123555 () Unit!5651)

(assert (=> d!55563 (= lt!92945 e!123555)))

(declare-fun c!33734 () Bool)

(assert (=> d!55563 (= c!33734 lt!92946)))

(assert (=> d!55563 (= lt!92946 (containsKey!232 (toList!1189 lt!92840) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55563 (= (contains!1301 lt!92840 #b1000000000000000000000000000000000000000000000000000000000000000) lt!92947)))

(declare-fun b!187762 () Bool)

(declare-fun lt!92944 () Unit!5651)

(assert (=> b!187762 (= e!123555 lt!92944)))

(assert (=> b!187762 (= lt!92944 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1189 lt!92840) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187762 (isDefined!181 (getValueByKey!229 (toList!1189 lt!92840) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187763 () Bool)

(declare-fun Unit!5664 () Unit!5651)

(assert (=> b!187763 (= e!123555 Unit!5664)))

(declare-fun b!187764 () Bool)

(assert (=> b!187764 (= e!123556 (isDefined!181 (getValueByKey!229 (toList!1189 lt!92840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55563 c!33734) b!187762))

(assert (= (and d!55563 (not c!33734)) b!187763))

(assert (= (and d!55563 (not res!88766)) b!187764))

(declare-fun m!214697 () Bool)

(assert (=> d!55563 m!214697))

(declare-fun m!214699 () Bool)

(assert (=> b!187762 m!214699))

(assert (=> b!187762 m!214667))

(assert (=> b!187762 m!214667))

(declare-fun m!214701 () Bool)

(assert (=> b!187762 m!214701))

(assert (=> b!187764 m!214667))

(assert (=> b!187764 m!214667))

(assert (=> b!187764 m!214701))

(assert (=> bm!18891 d!55563))

(declare-fun d!55565 () Bool)

(assert (=> d!55565 (isDefined!181 (getValueByKey!229 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(declare-fun lt!92950 () Unit!5651)

(declare-fun choose!1007 (List!2349 (_ BitVec 64)) Unit!5651)

(assert (=> d!55565 (= lt!92950 (choose!1007 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(declare-fun e!123559 () Bool)

(assert (=> d!55565 e!123559))

(declare-fun res!88769 () Bool)

(assert (=> d!55565 (=> (not res!88769) (not e!123559))))

(declare-fun isStrictlySorted!338 (List!2349) Bool)

(assert (=> d!55565 (= res!88769 (isStrictlySorted!338 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))))

(assert (=> d!55565 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828) lt!92950)))

(declare-fun b!187767 () Bool)

(assert (=> b!187767 (= e!123559 (containsKey!232 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(assert (= (and d!55565 res!88769) b!187767))

(assert (=> d!55565 m!214441))

(assert (=> d!55565 m!214441))

(assert (=> d!55565 m!214443))

(declare-fun m!214703 () Bool)

(assert (=> d!55565 m!214703))

(declare-fun m!214705 () Bool)

(assert (=> d!55565 m!214705))

(assert (=> b!187767 m!214437))

(assert (=> b!187503 d!55565))

(assert (=> b!187503 d!55549))

(assert (=> b!187503 d!55551))

(assert (=> b!187557 d!55541))

(assert (=> d!55473 d!55477))

(declare-fun d!55567 () Bool)

(declare-fun e!123562 () Bool)

(assert (=> d!55567 e!123562))

(declare-fun res!88774 () Bool)

(assert (=> d!55567 (=> (not res!88774) (not e!123562))))

(declare-fun lt!92953 () SeekEntryResult!639)

(assert (=> d!55567 (= res!88774 ((_ is Found!639) lt!92953))))

(assert (=> d!55567 (= lt!92953 (seekEntryOrOpen!0 key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)))))

(assert (=> d!55567 true))

(declare-fun _$33!132 () Unit!5651)

(assert (=> d!55567 (= (choose!1003 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)) _$33!132)))

(declare-fun b!187772 () Bool)

(declare-fun res!88775 () Bool)

(assert (=> b!187772 (=> (not res!88775) (not e!123562))))

(assert (=> b!187772 (= res!88775 (inRange!0 (index!4727 lt!92953) (mask!8966 thiss!1248)))))

(declare-fun b!187773 () Bool)

(assert (=> b!187773 (= e!123562 (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4727 lt!92953)) key!828))))

(assert (= (and d!55567 res!88774) b!187772))

(assert (= (and b!187772 res!88775) b!187773))

(assert (=> d!55567 m!214327))

(declare-fun m!214707 () Bool)

(assert (=> b!187772 m!214707))

(declare-fun m!214709 () Bool)

(assert (=> b!187773 m!214709))

(assert (=> d!55473 d!55567))

(assert (=> d!55473 d!55487))

(declare-fun d!55569 () Bool)

(declare-fun res!88780 () Bool)

(declare-fun e!123567 () Bool)

(assert (=> d!55569 (=> res!88780 e!123567)))

(assert (=> d!55569 (= res!88780 (and ((_ is Cons!2345) (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) (= (_1!1724 (h!2980 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) key!828)))))

(assert (=> d!55569 (= (containsKey!232 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828) e!123567)))

(declare-fun b!187778 () Bool)

(declare-fun e!123568 () Bool)

(assert (=> b!187778 (= e!123567 e!123568)))

(declare-fun res!88781 () Bool)

(assert (=> b!187778 (=> (not res!88781) (not e!123568))))

(assert (=> b!187778 (= res!88781 (and (or (not ((_ is Cons!2345) (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) (bvsle (_1!1724 (h!2980 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) key!828)) ((_ is Cons!2345) (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) (bvslt (_1!1724 (h!2980 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) key!828)))))

(declare-fun b!187779 () Bool)

(assert (=> b!187779 (= e!123568 (containsKey!232 (t!7233 (toList!1189 (getCurrentListMap!841 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) key!828))))

(assert (= (and d!55569 (not res!88780)) b!187778))

(assert (= (and b!187778 res!88781) b!187779))

(declare-fun m!214711 () Bool)

(assert (=> b!187779 m!214711))

(assert (=> d!55489 d!55569))

(declare-fun d!55571 () Bool)

(declare-fun e!123569 () Bool)

(assert (=> d!55571 e!123569))

(declare-fun res!88782 () Bool)

(assert (=> d!55571 (=> (not res!88782) (not e!123569))))

(declare-fun lt!92954 () ListLongMap!2347)

(assert (=> d!55571 (= res!88782 (contains!1301 lt!92954 (_1!1724 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(declare-fun lt!92957 () List!2349)

(assert (=> d!55571 (= lt!92954 (ListLongMap!2348 lt!92957))))

(declare-fun lt!92956 () Unit!5651)

(declare-fun lt!92955 () Unit!5651)

(assert (=> d!55571 (= lt!92956 lt!92955)))

(assert (=> d!55571 (= (getValueByKey!229 lt!92957 (_1!1724 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))) (Some!234 (_2!1724 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(assert (=> d!55571 (= lt!92955 (lemmaContainsTupThenGetReturnValue!120 lt!92957 (_1!1724 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))) (_2!1724 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(assert (=> d!55571 (= lt!92957 (insertStrictlySorted!123 (toList!1189 call!18894) (_1!1724 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))) (_2!1724 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(assert (=> d!55571 (= (+!291 call!18894 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))) lt!92954)))

(declare-fun b!187780 () Bool)

(declare-fun res!88783 () Bool)

(assert (=> b!187780 (=> (not res!88783) (not e!123569))))

(assert (=> b!187780 (= res!88783 (= (getValueByKey!229 (toList!1189 lt!92954) (_1!1724 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))) (Some!234 (_2!1724 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))))

(declare-fun b!187781 () Bool)

(assert (=> b!187781 (= e!123569 (contains!1304 (toList!1189 lt!92954) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))

(assert (= (and d!55571 res!88782) b!187780))

(assert (= (and b!187780 res!88783) b!187781))

(declare-fun m!214713 () Bool)

(assert (=> d!55571 m!214713))

(declare-fun m!214715 () Bool)

(assert (=> d!55571 m!214715))

(declare-fun m!214717 () Bool)

(assert (=> d!55571 m!214717))

(declare-fun m!214719 () Bool)

(assert (=> d!55571 m!214719))

(declare-fun m!214721 () Bool)

(assert (=> b!187780 m!214721))

(declare-fun m!214723 () Bool)

(assert (=> b!187781 m!214723))

(assert (=> b!187558 d!55571))

(declare-fun d!55573 () Bool)

(declare-fun e!123583 () Bool)

(assert (=> d!55573 e!123583))

(declare-fun c!33743 () Bool)

(declare-fun lt!92962 () SeekEntryResult!639)

(assert (=> d!55573 (= c!33743 (and ((_ is Intermediate!639) lt!92962) (undefined!1451 lt!92962)))))

(declare-fun e!123584 () SeekEntryResult!639)

(assert (=> d!55573 (= lt!92962 e!123584)))

(declare-fun c!33742 () Bool)

(assert (=> d!55573 (= c!33742 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!92963 () (_ BitVec 64))

(assert (=> d!55573 (= lt!92963 (select (arr!3758 (_keys!5772 thiss!1248)) (toIndex!0 key!828 (mask!8966 thiss!1248))))))

(assert (=> d!55573 (validMask!0 (mask!8966 thiss!1248))))

(assert (=> d!55573 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8966 thiss!1248)) key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)) lt!92962)))

(declare-fun b!187800 () Bool)

(declare-fun e!123580 () Bool)

(assert (=> b!187800 (= e!123583 e!123580)))

(declare-fun res!88791 () Bool)

(assert (=> b!187800 (= res!88791 (and ((_ is Intermediate!639) lt!92962) (not (undefined!1451 lt!92962)) (bvslt (x!20273 lt!92962) #b01111111111111111111111111111110) (bvsge (x!20273 lt!92962) #b00000000000000000000000000000000) (bvsge (x!20273 lt!92962) #b00000000000000000000000000000000)))))

(assert (=> b!187800 (=> (not res!88791) (not e!123580))))

(declare-fun b!187801 () Bool)

(assert (=> b!187801 (and (bvsge (index!4728 lt!92962) #b00000000000000000000000000000000) (bvslt (index!4728 lt!92962) (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun res!88792 () Bool)

(assert (=> b!187801 (= res!88792 (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4728 lt!92962)) key!828))))

(declare-fun e!123582 () Bool)

(assert (=> b!187801 (=> res!88792 e!123582)))

(assert (=> b!187801 (= e!123580 e!123582)))

(declare-fun b!187802 () Bool)

(declare-fun e!123581 () SeekEntryResult!639)

(assert (=> b!187802 (= e!123581 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8966 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8966 thiss!1248)) key!828 (_keys!5772 thiss!1248) (mask!8966 thiss!1248)))))

(declare-fun b!187803 () Bool)

(assert (=> b!187803 (= e!123584 (Intermediate!639 true (toIndex!0 key!828 (mask!8966 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!187804 () Bool)

(assert (=> b!187804 (and (bvsge (index!4728 lt!92962) #b00000000000000000000000000000000) (bvslt (index!4728 lt!92962) (size!4076 (_keys!5772 thiss!1248))))))

(declare-fun res!88790 () Bool)

(assert (=> b!187804 (= res!88790 (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4728 lt!92962)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187804 (=> res!88790 e!123582)))

(declare-fun b!187805 () Bool)

(assert (=> b!187805 (= e!123584 e!123581)))

(declare-fun c!33741 () Bool)

(assert (=> b!187805 (= c!33741 (or (= lt!92963 key!828) (= (bvadd lt!92963 lt!92963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!187806 () Bool)

(assert (=> b!187806 (= e!123581 (Intermediate!639 false (toIndex!0 key!828 (mask!8966 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!187807 () Bool)

(assert (=> b!187807 (and (bvsge (index!4728 lt!92962) #b00000000000000000000000000000000) (bvslt (index!4728 lt!92962) (size!4076 (_keys!5772 thiss!1248))))))

(assert (=> b!187807 (= e!123582 (= (select (arr!3758 (_keys!5772 thiss!1248)) (index!4728 lt!92962)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187808 () Bool)

(assert (=> b!187808 (= e!123583 (bvsge (x!20273 lt!92962) #b01111111111111111111111111111110))))

(assert (= (and d!55573 c!33742) b!187803))

(assert (= (and d!55573 (not c!33742)) b!187805))

(assert (= (and b!187805 c!33741) b!187806))

(assert (= (and b!187805 (not c!33741)) b!187802))

(assert (= (and d!55573 c!33743) b!187808))

(assert (= (and d!55573 (not c!33743)) b!187800))

(assert (= (and b!187800 res!88791) b!187801))

(assert (= (and b!187801 (not res!88792)) b!187804))

(assert (= (and b!187804 (not res!88790)) b!187807))

(assert (=> d!55573 m!214409))

(declare-fun m!214725 () Bool)

(assert (=> d!55573 m!214725))

(assert (=> d!55573 m!214337))

(declare-fun m!214727 () Bool)

(assert (=> b!187804 m!214727))

(assert (=> b!187801 m!214727))

(assert (=> b!187802 m!214409))

(declare-fun m!214729 () Bool)

(assert (=> b!187802 m!214729))

(assert (=> b!187802 m!214729))

(declare-fun m!214731 () Bool)

(assert (=> b!187802 m!214731))

(assert (=> b!187807 m!214727))

(assert (=> d!55477 d!55573))

(declare-fun d!55575 () Bool)

(declare-fun lt!92969 () (_ BitVec 32))

(declare-fun lt!92968 () (_ BitVec 32))

(assert (=> d!55575 (= lt!92969 (bvmul (bvxor lt!92968 (bvlshr lt!92968 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55575 (= lt!92968 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55575 (and (bvsge (mask!8966 thiss!1248) #b00000000000000000000000000000000) (let ((res!88793 (let ((h!2984 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20293 (bvmul (bvxor h!2984 (bvlshr h!2984 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20293 (bvlshr x!20293 #b00000000000000000000000000001101)) (mask!8966 thiss!1248)))))) (and (bvslt res!88793 (bvadd (mask!8966 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88793 #b00000000000000000000000000000000))))))

(assert (=> d!55575 (= (toIndex!0 key!828 (mask!8966 thiss!1248)) (bvand (bvxor lt!92969 (bvlshr lt!92969 #b00000000000000000000000000001101)) (mask!8966 thiss!1248)))))

(assert (=> d!55477 d!55575))

(assert (=> d!55477 d!55487))

(declare-fun condMapEmpty!7557 () Bool)

(declare-fun mapDefault!7557 () ValueCell!1847)

(assert (=> mapNonEmpty!7556 (= condMapEmpty!7557 (= mapRest!7556 ((as const (Array (_ BitVec 32) ValueCell!1847)) mapDefault!7557)))))

(declare-fun e!123585 () Bool)

(declare-fun mapRes!7557 () Bool)

(assert (=> mapNonEmpty!7556 (= tp!16655 (and e!123585 mapRes!7557))))

(declare-fun mapNonEmpty!7557 () Bool)

(declare-fun tp!16656 () Bool)

(declare-fun e!123586 () Bool)

(assert (=> mapNonEmpty!7557 (= mapRes!7557 (and tp!16656 e!123586))))

(declare-fun mapKey!7557 () (_ BitVec 32))

(declare-fun mapRest!7557 () (Array (_ BitVec 32) ValueCell!1847))

(declare-fun mapValue!7557 () ValueCell!1847)

(assert (=> mapNonEmpty!7557 (= mapRest!7556 (store mapRest!7557 mapKey!7557 mapValue!7557))))

(declare-fun mapIsEmpty!7557 () Bool)

(assert (=> mapIsEmpty!7557 mapRes!7557))

(declare-fun b!187809 () Bool)

(assert (=> b!187809 (= e!123586 tp_is_empty!4381)))

(declare-fun b!187810 () Bool)

(assert (=> b!187810 (= e!123585 tp_is_empty!4381)))

(assert (= (and mapNonEmpty!7556 condMapEmpty!7557) mapIsEmpty!7557))

(assert (= (and mapNonEmpty!7556 (not condMapEmpty!7557)) mapNonEmpty!7557))

(assert (= (and mapNonEmpty!7557 ((_ is ValueCellFull!1847) mapValue!7557)) b!187809))

(assert (= (and mapNonEmpty!7556 ((_ is ValueCellFull!1847) mapDefault!7557)) b!187810))

(declare-fun m!214733 () Bool)

(assert (=> mapNonEmpty!7557 m!214733))

(declare-fun b_lambda!7317 () Bool)

(assert (= b_lambda!7313 (or (and b!187370 b_free!4609) b_lambda!7317)))

(declare-fun b_lambda!7319 () Bool)

(assert (= b_lambda!7315 (or (and b!187370 b_free!4609) b_lambda!7319)))

(check-sat b_and!11251 (not mapNonEmpty!7557) (not b!187643) (not b!187731) (not d!55505) (not bm!18901) (not d!55527) (not bm!18898) (not d!55521) (not b!187608) (not b!187706) (not b!187707) (not d!55537) (not b!187729) (not b!187644) (not b!187654) (not b!187712) (not b_lambda!7319) (not b!187668) (not d!55511) (not b!187716) (not d!55563) (not b!187672) (not d!55561) (not b!187599) (not d!55517) (not b!187581) (not b!187675) (not b!187593) (not d!55501) (not d!55555) (not b!187713) (not b!187761) (not b_lambda!7311) (not b!187802) (not b!187702) (not b!187767) (not b!187674) (not d!55539) (not b!187727) (not d!55525) (not d!55557) (not d!55549) (not d!55531) (not b!187670) (not b!187710) (not bm!18904) (not d!55529) (not b!187764) (not b_next!4609) (not b!187779) (not d!55513) (not bm!18912) (not d!55523) (not b!187760) (not d!55509) (not b!187642) (not b!187624) (not b!187715) (not b!187772) (not d!55565) (not d!55497) (not d!55515) (not b!187611) (not b!187708) (not b!187700) (not b!187711) (not b!187762) (not d!55567) (not b!187704) (not d!55535) (not b!187781) (not bm!18907) (not b!187667) tp_is_empty!4381 (not d!55553) (not d!55533) (not b!187780) (not b!187655) (not b!187579) (not d!55519) (not bm!18913) (not b_lambda!7317) (not d!55571) (not b!187662) (not d!55545) (not b!187598) (not d!55573) (not d!55493))
(check-sat b_and!11251 (not b_next!4609))
