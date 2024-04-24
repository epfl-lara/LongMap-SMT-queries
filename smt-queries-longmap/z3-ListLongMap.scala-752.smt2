; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17648 () Bool)

(assert start!17648)

(declare-fun b!176431 () Bool)

(declare-fun b_free!4351 () Bool)

(declare-fun b_next!4351 () Bool)

(assert (=> b!176431 (= b_free!4351 (not b_next!4351))))

(declare-fun tp!15743 () Bool)

(declare-fun b_and!10859 () Bool)

(assert (=> b!176431 (= tp!15743 b_and!10859)))

(declare-fun b!176422 () Bool)

(declare-fun e!116391 () Bool)

(declare-fun tp_is_empty!4123 () Bool)

(assert (=> b!176422 (= e!116391 tp_is_empty!4123)))

(declare-fun b!176423 () Bool)

(declare-fun e!116395 () Bool)

(declare-fun e!116396 () Bool)

(declare-fun mapRes!7038 () Bool)

(assert (=> b!176423 (= e!116395 (and e!116396 mapRes!7038))))

(declare-fun condMapEmpty!7038 () Bool)

(declare-datatypes ((V!5145 0))(
  ( (V!5146 (val!2106 Int)) )
))
(declare-datatypes ((ValueCell!1718 0))(
  ( (ValueCellFull!1718 (v!3984 V!5145)) (EmptyCell!1718) )
))
(declare-datatypes ((array!7377 0))(
  ( (array!7378 (arr!3500 (Array (_ BitVec 32) (_ BitVec 64))) (size!3804 (_ BitVec 32))) )
))
(declare-datatypes ((array!7379 0))(
  ( (array!7380 (arr!3501 (Array (_ BitVec 32) ValueCell!1718)) (size!3805 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2344 0))(
  ( (LongMapFixedSize!2345 (defaultEntry!3632 Int) (mask!8549 (_ BitVec 32)) (extraKeys!3369 (_ BitVec 32)) (zeroValue!3473 V!5145) (minValue!3473 V!5145) (_size!1221 (_ BitVec 32)) (_keys!5493 array!7377) (_values!3615 array!7379) (_vacant!1221 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2344)

(declare-fun mapDefault!7038 () ValueCell!1718)

(assert (=> b!176423 (= condMapEmpty!7038 (= (arr!3501 (_values!3615 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1718)) mapDefault!7038)))))

(declare-fun b!176424 () Bool)

(declare-fun res!83601 () Bool)

(declare-fun e!116393 () Bool)

(assert (=> b!176424 (=> (not res!83601) (not e!116393))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!550 0))(
  ( (MissingZero!550 (index!4368 (_ BitVec 32))) (Found!550 (index!4369 (_ BitVec 32))) (Intermediate!550 (undefined!1362 Bool) (index!4370 (_ BitVec 32)) (x!19360 (_ BitVec 32))) (Undefined!550) (MissingVacant!550 (index!4371 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7377 (_ BitVec 32)) SeekEntryResult!550)

(assert (=> b!176424 (= res!83601 ((_ is Undefined!550) (seekEntryOrOpen!0 key!828 (_keys!5493 thiss!1248) (mask!8549 thiss!1248))))))

(declare-fun b!176425 () Bool)

(declare-fun res!83599 () Bool)

(assert (=> b!176425 (=> (not res!83599) (not e!116393))))

(declare-datatypes ((tuple2!3234 0))(
  ( (tuple2!3235 (_1!1628 (_ BitVec 64)) (_2!1628 V!5145)) )
))
(declare-datatypes ((List!2211 0))(
  ( (Nil!2208) (Cons!2207 (h!2828 tuple2!3234) (t!7027 List!2211)) )
))
(declare-datatypes ((ListLongMap!2167 0))(
  ( (ListLongMap!2168 (toList!1099 List!2211)) )
))
(declare-fun contains!1174 (ListLongMap!2167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!754 (array!7377 array!7379 (_ BitVec 32) (_ BitVec 32) V!5145 V!5145 (_ BitVec 32) Int) ListLongMap!2167)

(assert (=> b!176425 (= res!83599 (contains!1174 (getCurrentListMap!754 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!7038 () Bool)

(assert (=> mapIsEmpty!7038 mapRes!7038))

(declare-fun b!176426 () Bool)

(declare-fun res!83600 () Bool)

(assert (=> b!176426 (=> (not res!83600) (not e!116393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176426 (= res!83600 (validMask!0 (mask!8549 thiss!1248)))))

(declare-fun b!176427 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7377 (_ BitVec 32)) Bool)

(assert (=> b!176427 (= e!116393 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5493 thiss!1248) (mask!8549 thiss!1248))))))

(declare-fun mapNonEmpty!7038 () Bool)

(declare-fun tp!15744 () Bool)

(assert (=> mapNonEmpty!7038 (= mapRes!7038 (and tp!15744 e!116391))))

(declare-fun mapValue!7038 () ValueCell!1718)

(declare-fun mapKey!7038 () (_ BitVec 32))

(declare-fun mapRest!7038 () (Array (_ BitVec 32) ValueCell!1718))

(assert (=> mapNonEmpty!7038 (= (arr!3501 (_values!3615 thiss!1248)) (store mapRest!7038 mapKey!7038 mapValue!7038))))

(declare-fun b!176428 () Bool)

(declare-fun res!83598 () Bool)

(assert (=> b!176428 (=> (not res!83598) (not e!116393))))

(assert (=> b!176428 (= res!83598 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176429 () Bool)

(assert (=> b!176429 (= e!116396 tp_is_empty!4123)))

(declare-fun b!176430 () Bool)

(declare-fun res!83602 () Bool)

(assert (=> b!176430 (=> (not res!83602) (not e!116393))))

(assert (=> b!176430 (= res!83602 (and (= (size!3805 (_values!3615 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8549 thiss!1248))) (= (size!3804 (_keys!5493 thiss!1248)) (size!3805 (_values!3615 thiss!1248))) (bvsge (mask!8549 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3369 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3369 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!83603 () Bool)

(assert (=> start!17648 (=> (not res!83603) (not e!116393))))

(declare-fun valid!1005 (LongMapFixedSize!2344) Bool)

(assert (=> start!17648 (= res!83603 (valid!1005 thiss!1248))))

(assert (=> start!17648 e!116393))

(declare-fun e!116394 () Bool)

(assert (=> start!17648 e!116394))

(assert (=> start!17648 true))

(declare-fun array_inv!2259 (array!7377) Bool)

(declare-fun array_inv!2260 (array!7379) Bool)

(assert (=> b!176431 (= e!116394 (and tp!15743 tp_is_empty!4123 (array_inv!2259 (_keys!5493 thiss!1248)) (array_inv!2260 (_values!3615 thiss!1248)) e!116395))))

(assert (= (and start!17648 res!83603) b!176428))

(assert (= (and b!176428 res!83598) b!176424))

(assert (= (and b!176424 res!83601) b!176425))

(assert (= (and b!176425 res!83599) b!176426))

(assert (= (and b!176426 res!83600) b!176430))

(assert (= (and b!176430 res!83602) b!176427))

(assert (= (and b!176423 condMapEmpty!7038) mapIsEmpty!7038))

(assert (= (and b!176423 (not condMapEmpty!7038)) mapNonEmpty!7038))

(assert (= (and mapNonEmpty!7038 ((_ is ValueCellFull!1718) mapValue!7038)) b!176422))

(assert (= (and b!176423 ((_ is ValueCellFull!1718) mapDefault!7038)) b!176429))

(assert (= b!176431 b!176423))

(assert (= start!17648 b!176431))

(declare-fun m!205395 () Bool)

(assert (=> start!17648 m!205395))

(declare-fun m!205397 () Bool)

(assert (=> b!176427 m!205397))

(declare-fun m!205399 () Bool)

(assert (=> b!176431 m!205399))

(declare-fun m!205401 () Bool)

(assert (=> b!176431 m!205401))

(declare-fun m!205403 () Bool)

(assert (=> b!176425 m!205403))

(assert (=> b!176425 m!205403))

(declare-fun m!205405 () Bool)

(assert (=> b!176425 m!205405))

(declare-fun m!205407 () Bool)

(assert (=> mapNonEmpty!7038 m!205407))

(declare-fun m!205409 () Bool)

(assert (=> b!176426 m!205409))

(declare-fun m!205411 () Bool)

(assert (=> b!176424 m!205411))

(check-sat (not start!17648) (not b_next!4351) (not b!176427) b_and!10859 (not mapNonEmpty!7038) tp_is_empty!4123 (not b!176424) (not b!176431) (not b!176425) (not b!176426))
(check-sat b_and!10859 (not b_next!4351))
(get-model)

(declare-fun d!53743 () Bool)

(assert (=> d!53743 (= (validMask!0 (mask!8549 thiss!1248)) (and (or (= (mask!8549 thiss!1248) #b00000000000000000000000000000111) (= (mask!8549 thiss!1248) #b00000000000000000000000000001111) (= (mask!8549 thiss!1248) #b00000000000000000000000000011111) (= (mask!8549 thiss!1248) #b00000000000000000000000000111111) (= (mask!8549 thiss!1248) #b00000000000000000000000001111111) (= (mask!8549 thiss!1248) #b00000000000000000000000011111111) (= (mask!8549 thiss!1248) #b00000000000000000000000111111111) (= (mask!8549 thiss!1248) #b00000000000000000000001111111111) (= (mask!8549 thiss!1248) #b00000000000000000000011111111111) (= (mask!8549 thiss!1248) #b00000000000000000000111111111111) (= (mask!8549 thiss!1248) #b00000000000000000001111111111111) (= (mask!8549 thiss!1248) #b00000000000000000011111111111111) (= (mask!8549 thiss!1248) #b00000000000000000111111111111111) (= (mask!8549 thiss!1248) #b00000000000000001111111111111111) (= (mask!8549 thiss!1248) #b00000000000000011111111111111111) (= (mask!8549 thiss!1248) #b00000000000000111111111111111111) (= (mask!8549 thiss!1248) #b00000000000001111111111111111111) (= (mask!8549 thiss!1248) #b00000000000011111111111111111111) (= (mask!8549 thiss!1248) #b00000000000111111111111111111111) (= (mask!8549 thiss!1248) #b00000000001111111111111111111111) (= (mask!8549 thiss!1248) #b00000000011111111111111111111111) (= (mask!8549 thiss!1248) #b00000000111111111111111111111111) (= (mask!8549 thiss!1248) #b00000001111111111111111111111111) (= (mask!8549 thiss!1248) #b00000011111111111111111111111111) (= (mask!8549 thiss!1248) #b00000111111111111111111111111111) (= (mask!8549 thiss!1248) #b00001111111111111111111111111111) (= (mask!8549 thiss!1248) #b00011111111111111111111111111111) (= (mask!8549 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8549 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!176426 d!53743))

(declare-fun d!53745 () Bool)

(assert (=> d!53745 (= (array_inv!2259 (_keys!5493 thiss!1248)) (bvsge (size!3804 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176431 d!53745))

(declare-fun d!53747 () Bool)

(assert (=> d!53747 (= (array_inv!2260 (_values!3615 thiss!1248)) (bvsge (size!3805 (_values!3615 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176431 d!53747))

(declare-fun bm!17833 () Bool)

(declare-fun call!17836 () Bool)

(assert (=> bm!17833 (= call!17836 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5493 thiss!1248) (mask!8549 thiss!1248)))))

(declare-fun b!176500 () Bool)

(declare-fun e!116441 () Bool)

(assert (=> b!176500 (= e!116441 call!17836)))

(declare-fun b!176501 () Bool)

(declare-fun e!116440 () Bool)

(assert (=> b!176501 (= e!116440 call!17836)))

(declare-fun b!176502 () Bool)

(assert (=> b!176502 (= e!116441 e!116440)))

(declare-fun lt!87347 () (_ BitVec 64))

(assert (=> b!176502 (= lt!87347 (select (arr!3500 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5405 0))(
  ( (Unit!5406) )
))
(declare-fun lt!87346 () Unit!5405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7377 (_ BitVec 64) (_ BitVec 32)) Unit!5405)

(assert (=> b!176502 (= lt!87346 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5493 thiss!1248) lt!87347 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!176502 (arrayContainsKey!0 (_keys!5493 thiss!1248) lt!87347 #b00000000000000000000000000000000)))

(declare-fun lt!87345 () Unit!5405)

(assert (=> b!176502 (= lt!87345 lt!87346)))

(declare-fun res!83644 () Bool)

(assert (=> b!176502 (= res!83644 (= (seekEntryOrOpen!0 (select (arr!3500 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000) (_keys!5493 thiss!1248) (mask!8549 thiss!1248)) (Found!550 #b00000000000000000000000000000000)))))

(assert (=> b!176502 (=> (not res!83644) (not e!116440))))

(declare-fun b!176503 () Bool)

(declare-fun e!116439 () Bool)

(assert (=> b!176503 (= e!116439 e!116441)))

(declare-fun c!31643 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176503 (= c!31643 (validKeyInArray!0 (select (arr!3500 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53749 () Bool)

(declare-fun res!83645 () Bool)

(assert (=> d!53749 (=> res!83645 e!116439)))

(assert (=> d!53749 (= res!83645 (bvsge #b00000000000000000000000000000000 (size!3804 (_keys!5493 thiss!1248))))))

(assert (=> d!53749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5493 thiss!1248) (mask!8549 thiss!1248)) e!116439)))

(assert (= (and d!53749 (not res!83645)) b!176503))

(assert (= (and b!176503 c!31643) b!176502))

(assert (= (and b!176503 (not c!31643)) b!176500))

(assert (= (and b!176502 res!83644) b!176501))

(assert (= (or b!176501 b!176500) bm!17833))

(declare-fun m!205449 () Bool)

(assert (=> bm!17833 m!205449))

(declare-fun m!205451 () Bool)

(assert (=> b!176502 m!205451))

(declare-fun m!205453 () Bool)

(assert (=> b!176502 m!205453))

(declare-fun m!205455 () Bool)

(assert (=> b!176502 m!205455))

(assert (=> b!176502 m!205451))

(declare-fun m!205457 () Bool)

(assert (=> b!176502 m!205457))

(assert (=> b!176503 m!205451))

(assert (=> b!176503 m!205451))

(declare-fun m!205459 () Bool)

(assert (=> b!176503 m!205459))

(assert (=> b!176427 d!53749))

(declare-fun b!176516 () Bool)

(declare-fun c!31650 () Bool)

(declare-fun lt!87354 () (_ BitVec 64))

(assert (=> b!176516 (= c!31650 (= lt!87354 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116448 () SeekEntryResult!550)

(declare-fun e!116450 () SeekEntryResult!550)

(assert (=> b!176516 (= e!116448 e!116450)))

(declare-fun b!176517 () Bool)

(declare-fun e!116449 () SeekEntryResult!550)

(assert (=> b!176517 (= e!116449 e!116448)))

(declare-fun lt!87356 () SeekEntryResult!550)

(assert (=> b!176517 (= lt!87354 (select (arr!3500 (_keys!5493 thiss!1248)) (index!4370 lt!87356)))))

(declare-fun c!31651 () Bool)

(assert (=> b!176517 (= c!31651 (= lt!87354 key!828))))

(declare-fun b!176518 () Bool)

(assert (=> b!176518 (= e!116450 (MissingZero!550 (index!4370 lt!87356)))))

(declare-fun d!53751 () Bool)

(declare-fun lt!87355 () SeekEntryResult!550)

(assert (=> d!53751 (and (or ((_ is Undefined!550) lt!87355) (not ((_ is Found!550) lt!87355)) (and (bvsge (index!4369 lt!87355) #b00000000000000000000000000000000) (bvslt (index!4369 lt!87355) (size!3804 (_keys!5493 thiss!1248))))) (or ((_ is Undefined!550) lt!87355) ((_ is Found!550) lt!87355) (not ((_ is MissingZero!550) lt!87355)) (and (bvsge (index!4368 lt!87355) #b00000000000000000000000000000000) (bvslt (index!4368 lt!87355) (size!3804 (_keys!5493 thiss!1248))))) (or ((_ is Undefined!550) lt!87355) ((_ is Found!550) lt!87355) ((_ is MissingZero!550) lt!87355) (not ((_ is MissingVacant!550) lt!87355)) (and (bvsge (index!4371 lt!87355) #b00000000000000000000000000000000) (bvslt (index!4371 lt!87355) (size!3804 (_keys!5493 thiss!1248))))) (or ((_ is Undefined!550) lt!87355) (ite ((_ is Found!550) lt!87355) (= (select (arr!3500 (_keys!5493 thiss!1248)) (index!4369 lt!87355)) key!828) (ite ((_ is MissingZero!550) lt!87355) (= (select (arr!3500 (_keys!5493 thiss!1248)) (index!4368 lt!87355)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!550) lt!87355) (= (select (arr!3500 (_keys!5493 thiss!1248)) (index!4371 lt!87355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53751 (= lt!87355 e!116449)))

(declare-fun c!31652 () Bool)

(assert (=> d!53751 (= c!31652 (and ((_ is Intermediate!550) lt!87356) (undefined!1362 lt!87356)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7377 (_ BitVec 32)) SeekEntryResult!550)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53751 (= lt!87356 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8549 thiss!1248)) key!828 (_keys!5493 thiss!1248) (mask!8549 thiss!1248)))))

(assert (=> d!53751 (validMask!0 (mask!8549 thiss!1248))))

(assert (=> d!53751 (= (seekEntryOrOpen!0 key!828 (_keys!5493 thiss!1248) (mask!8549 thiss!1248)) lt!87355)))

(declare-fun b!176519 () Bool)

(assert (=> b!176519 (= e!116449 Undefined!550)))

(declare-fun b!176520 () Bool)

(assert (=> b!176520 (= e!116448 (Found!550 (index!4370 lt!87356)))))

(declare-fun b!176521 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7377 (_ BitVec 32)) SeekEntryResult!550)

(assert (=> b!176521 (= e!116450 (seekKeyOrZeroReturnVacant!0 (x!19360 lt!87356) (index!4370 lt!87356) (index!4370 lt!87356) key!828 (_keys!5493 thiss!1248) (mask!8549 thiss!1248)))))

(assert (= (and d!53751 c!31652) b!176519))

(assert (= (and d!53751 (not c!31652)) b!176517))

(assert (= (and b!176517 c!31651) b!176520))

(assert (= (and b!176517 (not c!31651)) b!176516))

(assert (= (and b!176516 c!31650) b!176518))

(assert (= (and b!176516 (not c!31650)) b!176521))

(declare-fun m!205461 () Bool)

(assert (=> b!176517 m!205461))

(declare-fun m!205463 () Bool)

(assert (=> d!53751 m!205463))

(declare-fun m!205465 () Bool)

(assert (=> d!53751 m!205465))

(declare-fun m!205467 () Bool)

(assert (=> d!53751 m!205467))

(assert (=> d!53751 m!205465))

(declare-fun m!205469 () Bool)

(assert (=> d!53751 m!205469))

(declare-fun m!205471 () Bool)

(assert (=> d!53751 m!205471))

(assert (=> d!53751 m!205409))

(declare-fun m!205473 () Bool)

(assert (=> b!176521 m!205473))

(assert (=> b!176424 d!53751))

(declare-fun d!53753 () Bool)

(declare-fun e!116455 () Bool)

(assert (=> d!53753 e!116455))

(declare-fun res!83648 () Bool)

(assert (=> d!53753 (=> res!83648 e!116455)))

(declare-fun lt!87368 () Bool)

(assert (=> d!53753 (= res!83648 (not lt!87368))))

(declare-fun lt!87367 () Bool)

(assert (=> d!53753 (= lt!87368 lt!87367)))

(declare-fun lt!87366 () Unit!5405)

(declare-fun e!116456 () Unit!5405)

(assert (=> d!53753 (= lt!87366 e!116456)))

(declare-fun c!31655 () Bool)

(assert (=> d!53753 (= c!31655 lt!87367)))

(declare-fun containsKey!196 (List!2211 (_ BitVec 64)) Bool)

(assert (=> d!53753 (= lt!87367 (containsKey!196 (toList!1099 (getCurrentListMap!754 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248))) key!828))))

(assert (=> d!53753 (= (contains!1174 (getCurrentListMap!754 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)) key!828) lt!87368)))

(declare-fun b!176528 () Bool)

(declare-fun lt!87365 () Unit!5405)

(assert (=> b!176528 (= e!116456 lt!87365)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!144 (List!2211 (_ BitVec 64)) Unit!5405)

(assert (=> b!176528 (= lt!87365 (lemmaContainsKeyImpliesGetValueByKeyDefined!144 (toList!1099 (getCurrentListMap!754 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248))) key!828))))

(declare-datatypes ((Option!199 0))(
  ( (Some!198 (v!3987 V!5145)) (None!197) )
))
(declare-fun isDefined!145 (Option!199) Bool)

(declare-fun getValueByKey!193 (List!2211 (_ BitVec 64)) Option!199)

(assert (=> b!176528 (isDefined!145 (getValueByKey!193 (toList!1099 (getCurrentListMap!754 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248))) key!828))))

(declare-fun b!176529 () Bool)

(declare-fun Unit!5407 () Unit!5405)

(assert (=> b!176529 (= e!116456 Unit!5407)))

(declare-fun b!176530 () Bool)

(assert (=> b!176530 (= e!116455 (isDefined!145 (getValueByKey!193 (toList!1099 (getCurrentListMap!754 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248))) key!828)))))

(assert (= (and d!53753 c!31655) b!176528))

(assert (= (and d!53753 (not c!31655)) b!176529))

(assert (= (and d!53753 (not res!83648)) b!176530))

(declare-fun m!205475 () Bool)

(assert (=> d!53753 m!205475))

(declare-fun m!205477 () Bool)

(assert (=> b!176528 m!205477))

(declare-fun m!205479 () Bool)

(assert (=> b!176528 m!205479))

(assert (=> b!176528 m!205479))

(declare-fun m!205481 () Bool)

(assert (=> b!176528 m!205481))

(assert (=> b!176530 m!205479))

(assert (=> b!176530 m!205479))

(assert (=> b!176530 m!205481))

(assert (=> b!176425 d!53753))

(declare-fun b!176573 () Bool)

(declare-fun e!116494 () Bool)

(declare-fun e!116491 () Bool)

(assert (=> b!176573 (= e!116494 e!116491)))

(declare-fun res!83673 () Bool)

(declare-fun call!17855 () Bool)

(assert (=> b!176573 (= res!83673 call!17855)))

(assert (=> b!176573 (=> (not res!83673) (not e!116491))))

(declare-fun b!176574 () Bool)

(declare-fun res!83675 () Bool)

(declare-fun e!116486 () Bool)

(assert (=> b!176574 (=> (not res!83675) (not e!116486))))

(declare-fun e!116489 () Bool)

(assert (=> b!176574 (= res!83675 e!116489)))

(declare-fun res!83668 () Bool)

(assert (=> b!176574 (=> res!83668 e!116489)))

(declare-fun e!116495 () Bool)

(assert (=> b!176574 (= res!83668 (not e!116495))))

(declare-fun res!83669 () Bool)

(assert (=> b!176574 (=> (not res!83669) (not e!116495))))

(assert (=> b!176574 (= res!83669 (bvslt #b00000000000000000000000000000000 (size!3804 (_keys!5493 thiss!1248))))))

(declare-fun b!176575 () Bool)

(declare-fun e!116488 () ListLongMap!2167)

(declare-fun call!17854 () ListLongMap!2167)

(declare-fun +!254 (ListLongMap!2167 tuple2!3234) ListLongMap!2167)

(assert (=> b!176575 (= e!116488 (+!254 call!17854 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3473 thiss!1248))))))

(declare-fun b!176576 () Bool)

(declare-fun e!116484 () Unit!5405)

(declare-fun Unit!5408 () Unit!5405)

(assert (=> b!176576 (= e!116484 Unit!5408)))

(declare-fun bm!17848 () Bool)

(declare-fun call!17857 () ListLongMap!2167)

(declare-fun call!17853 () ListLongMap!2167)

(declare-fun call!17851 () ListLongMap!2167)

(declare-fun c!31672 () Bool)

(declare-fun c!31673 () Bool)

(assert (=> bm!17848 (= call!17854 (+!254 (ite c!31672 call!17853 (ite c!31673 call!17857 call!17851)) (ite (or c!31672 c!31673) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3473 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3473 thiss!1248)))))))

(declare-fun b!176577 () Bool)

(declare-fun e!116485 () ListLongMap!2167)

(declare-fun call!17852 () ListLongMap!2167)

(assert (=> b!176577 (= e!116485 call!17852)))

(declare-fun bm!17849 () Bool)

(assert (=> bm!17849 (= call!17857 call!17853)))

(declare-fun d!53755 () Bool)

(assert (=> d!53755 e!116486))

(declare-fun res!83667 () Bool)

(assert (=> d!53755 (=> (not res!83667) (not e!116486))))

(assert (=> d!53755 (= res!83667 (or (bvsge #b00000000000000000000000000000000 (size!3804 (_keys!5493 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3804 (_keys!5493 thiss!1248))))))))

(declare-fun lt!87432 () ListLongMap!2167)

(declare-fun lt!87418 () ListLongMap!2167)

(assert (=> d!53755 (= lt!87432 lt!87418)))

(declare-fun lt!87425 () Unit!5405)

(assert (=> d!53755 (= lt!87425 e!116484)))

(declare-fun c!31668 () Bool)

(declare-fun e!116487 () Bool)

(assert (=> d!53755 (= c!31668 e!116487)))

(declare-fun res!83671 () Bool)

(assert (=> d!53755 (=> (not res!83671) (not e!116487))))

(assert (=> d!53755 (= res!83671 (bvslt #b00000000000000000000000000000000 (size!3804 (_keys!5493 thiss!1248))))))

(assert (=> d!53755 (= lt!87418 e!116488)))

(assert (=> d!53755 (= c!31672 (and (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53755 (validMask!0 (mask!8549 thiss!1248))))

(assert (=> d!53755 (= (getCurrentListMap!754 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)) lt!87432)))

(declare-fun b!176578 () Bool)

(declare-fun res!83670 () Bool)

(assert (=> b!176578 (=> (not res!83670) (not e!116486))))

(declare-fun e!116490 () Bool)

(assert (=> b!176578 (= res!83670 e!116490)))

(declare-fun c!31671 () Bool)

(assert (=> b!176578 (= c!31671 (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!17850 () Bool)

(declare-fun call!17856 () Bool)

(assert (=> bm!17850 (= call!17856 (contains!1174 lt!87432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176579 () Bool)

(declare-fun e!116492 () ListLongMap!2167)

(assert (=> b!176579 (= e!116492 call!17852)))

(declare-fun b!176580 () Bool)

(assert (=> b!176580 (= e!116495 (validKeyInArray!0 (select (arr!3500 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176581 () Bool)

(declare-fun e!116493 () Bool)

(declare-fun apply!137 (ListLongMap!2167 (_ BitVec 64)) V!5145)

(assert (=> b!176581 (= e!116493 (= (apply!137 lt!87432 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3473 thiss!1248)))))

(declare-fun b!176582 () Bool)

(assert (=> b!176582 (= e!116487 (validKeyInArray!0 (select (arr!3500 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176583 () Bool)

(assert (=> b!176583 (= e!116488 e!116492)))

(assert (=> b!176583 (= c!31673 (and (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!176584 () Bool)

(assert (=> b!176584 (= e!116486 e!116494)))

(declare-fun c!31669 () Bool)

(assert (=> b!176584 (= c!31669 (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17851 () Bool)

(assert (=> bm!17851 (= call!17855 (contains!1174 lt!87432 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176585 () Bool)

(declare-fun c!31670 () Bool)

(assert (=> b!176585 (= c!31670 (and (not (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3369 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!176585 (= e!116492 e!116485)))

(declare-fun b!176586 () Bool)

(assert (=> b!176586 (= e!116491 (= (apply!137 lt!87432 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3473 thiss!1248)))))

(declare-fun b!176587 () Bool)

(assert (=> b!176587 (= e!116485 call!17851)))

(declare-fun bm!17852 () Bool)

(assert (=> bm!17852 (= call!17851 call!17857)))

(declare-fun bm!17853 () Bool)

(assert (=> bm!17853 (= call!17852 call!17854)))

(declare-fun b!176588 () Bool)

(declare-fun lt!87422 () Unit!5405)

(assert (=> b!176588 (= e!116484 lt!87422)))

(declare-fun lt!87430 () ListLongMap!2167)

(declare-fun getCurrentListMapNoExtraKeys!168 (array!7377 array!7379 (_ BitVec 32) (_ BitVec 32) V!5145 V!5145 (_ BitVec 32) Int) ListLongMap!2167)

(assert (=> b!176588 (= lt!87430 (getCurrentListMapNoExtraKeys!168 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)))))

(declare-fun lt!87426 () (_ BitVec 64))

(assert (=> b!176588 (= lt!87426 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87423 () (_ BitVec 64))

(assert (=> b!176588 (= lt!87423 (select (arr!3500 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87413 () Unit!5405)

(declare-fun addStillContains!113 (ListLongMap!2167 (_ BitVec 64) V!5145 (_ BitVec 64)) Unit!5405)

(assert (=> b!176588 (= lt!87413 (addStillContains!113 lt!87430 lt!87426 (zeroValue!3473 thiss!1248) lt!87423))))

(assert (=> b!176588 (contains!1174 (+!254 lt!87430 (tuple2!3235 lt!87426 (zeroValue!3473 thiss!1248))) lt!87423)))

(declare-fun lt!87414 () Unit!5405)

(assert (=> b!176588 (= lt!87414 lt!87413)))

(declare-fun lt!87431 () ListLongMap!2167)

(assert (=> b!176588 (= lt!87431 (getCurrentListMapNoExtraKeys!168 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)))))

(declare-fun lt!87417 () (_ BitVec 64))

(assert (=> b!176588 (= lt!87417 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87415 () (_ BitVec 64))

(assert (=> b!176588 (= lt!87415 (select (arr!3500 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87427 () Unit!5405)

(declare-fun addApplyDifferent!113 (ListLongMap!2167 (_ BitVec 64) V!5145 (_ BitVec 64)) Unit!5405)

(assert (=> b!176588 (= lt!87427 (addApplyDifferent!113 lt!87431 lt!87417 (minValue!3473 thiss!1248) lt!87415))))

(assert (=> b!176588 (= (apply!137 (+!254 lt!87431 (tuple2!3235 lt!87417 (minValue!3473 thiss!1248))) lt!87415) (apply!137 lt!87431 lt!87415))))

(declare-fun lt!87416 () Unit!5405)

(assert (=> b!176588 (= lt!87416 lt!87427)))

(declare-fun lt!87421 () ListLongMap!2167)

(assert (=> b!176588 (= lt!87421 (getCurrentListMapNoExtraKeys!168 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)))))

(declare-fun lt!87420 () (_ BitVec 64))

(assert (=> b!176588 (= lt!87420 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87428 () (_ BitVec 64))

(assert (=> b!176588 (= lt!87428 (select (arr!3500 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87419 () Unit!5405)

(assert (=> b!176588 (= lt!87419 (addApplyDifferent!113 lt!87421 lt!87420 (zeroValue!3473 thiss!1248) lt!87428))))

(assert (=> b!176588 (= (apply!137 (+!254 lt!87421 (tuple2!3235 lt!87420 (zeroValue!3473 thiss!1248))) lt!87428) (apply!137 lt!87421 lt!87428))))

(declare-fun lt!87429 () Unit!5405)

(assert (=> b!176588 (= lt!87429 lt!87419)))

(declare-fun lt!87434 () ListLongMap!2167)

(assert (=> b!176588 (= lt!87434 (getCurrentListMapNoExtraKeys!168 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)))))

(declare-fun lt!87424 () (_ BitVec 64))

(assert (=> b!176588 (= lt!87424 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87433 () (_ BitVec 64))

(assert (=> b!176588 (= lt!87433 (select (arr!3500 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176588 (= lt!87422 (addApplyDifferent!113 lt!87434 lt!87424 (minValue!3473 thiss!1248) lt!87433))))

(assert (=> b!176588 (= (apply!137 (+!254 lt!87434 (tuple2!3235 lt!87424 (minValue!3473 thiss!1248))) lt!87433) (apply!137 lt!87434 lt!87433))))

(declare-fun b!176589 () Bool)

(declare-fun e!116483 () Bool)

(declare-fun get!2010 (ValueCell!1718 V!5145) V!5145)

(declare-fun dynLambda!480 (Int (_ BitVec 64)) V!5145)

(assert (=> b!176589 (= e!116483 (= (apply!137 lt!87432 (select (arr!3500 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000)) (get!2010 (select (arr!3501 (_values!3615 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!480 (defaultEntry!3632 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176589 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3805 (_values!3615 thiss!1248))))))

(assert (=> b!176589 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3804 (_keys!5493 thiss!1248))))))

(declare-fun b!176590 () Bool)

(assert (=> b!176590 (= e!116489 e!116483)))

(declare-fun res!83674 () Bool)

(assert (=> b!176590 (=> (not res!83674) (not e!116483))))

(assert (=> b!176590 (= res!83674 (contains!1174 lt!87432 (select (arr!3500 (_keys!5493 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176590 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3804 (_keys!5493 thiss!1248))))))

(declare-fun b!176591 () Bool)

(assert (=> b!176591 (= e!116490 e!116493)))

(declare-fun res!83672 () Bool)

(assert (=> b!176591 (= res!83672 call!17856)))

(assert (=> b!176591 (=> (not res!83672) (not e!116493))))

(declare-fun bm!17854 () Bool)

(assert (=> bm!17854 (= call!17853 (getCurrentListMapNoExtraKeys!168 (_keys!5493 thiss!1248) (_values!3615 thiss!1248) (mask!8549 thiss!1248) (extraKeys!3369 thiss!1248) (zeroValue!3473 thiss!1248) (minValue!3473 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3632 thiss!1248)))))

(declare-fun b!176592 () Bool)

(assert (=> b!176592 (= e!116490 (not call!17856))))

(declare-fun b!176593 () Bool)

(assert (=> b!176593 (= e!116494 (not call!17855))))

(assert (= (and d!53755 c!31672) b!176575))

(assert (= (and d!53755 (not c!31672)) b!176583))

(assert (= (and b!176583 c!31673) b!176579))

(assert (= (and b!176583 (not c!31673)) b!176585))

(assert (= (and b!176585 c!31670) b!176577))

(assert (= (and b!176585 (not c!31670)) b!176587))

(assert (= (or b!176577 b!176587) bm!17852))

(assert (= (or b!176579 bm!17852) bm!17849))

(assert (= (or b!176579 b!176577) bm!17853))

(assert (= (or b!176575 bm!17849) bm!17854))

(assert (= (or b!176575 bm!17853) bm!17848))

(assert (= (and d!53755 res!83671) b!176582))

(assert (= (and d!53755 c!31668) b!176588))

(assert (= (and d!53755 (not c!31668)) b!176576))

(assert (= (and d!53755 res!83667) b!176574))

(assert (= (and b!176574 res!83669) b!176580))

(assert (= (and b!176574 (not res!83668)) b!176590))

(assert (= (and b!176590 res!83674) b!176589))

(assert (= (and b!176574 res!83675) b!176578))

(assert (= (and b!176578 c!31671) b!176591))

(assert (= (and b!176578 (not c!31671)) b!176592))

(assert (= (and b!176591 res!83672) b!176581))

(assert (= (or b!176591 b!176592) bm!17850))

(assert (= (and b!176578 res!83670) b!176584))

(assert (= (and b!176584 c!31669) b!176573))

(assert (= (and b!176584 (not c!31669)) b!176593))

(assert (= (and b!176573 res!83673) b!176586))

(assert (= (or b!176573 b!176593) bm!17851))

(declare-fun b_lambda!7061 () Bool)

(assert (=> (not b_lambda!7061) (not b!176589)))

(declare-fun t!7031 () Bool)

(declare-fun tb!2777 () Bool)

(assert (=> (and b!176431 (= (defaultEntry!3632 thiss!1248) (defaultEntry!3632 thiss!1248)) t!7031) tb!2777))

(declare-fun result!4621 () Bool)

(assert (=> tb!2777 (= result!4621 tp_is_empty!4123)))

(assert (=> b!176589 t!7031))

(declare-fun b_and!10865 () Bool)

(assert (= b_and!10859 (and (=> t!7031 result!4621) b_and!10865)))

(declare-fun m!205483 () Bool)

(assert (=> bm!17851 m!205483))

(assert (=> d!53755 m!205409))

(declare-fun m!205485 () Bool)

(assert (=> b!176589 m!205485))

(assert (=> b!176589 m!205451))

(declare-fun m!205487 () Bool)

(assert (=> b!176589 m!205487))

(assert (=> b!176589 m!205485))

(declare-fun m!205489 () Bool)

(assert (=> b!176589 m!205489))

(assert (=> b!176589 m!205451))

(declare-fun m!205491 () Bool)

(assert (=> b!176589 m!205491))

(assert (=> b!176589 m!205487))

(declare-fun m!205493 () Bool)

(assert (=> bm!17854 m!205493))

(declare-fun m!205495 () Bool)

(assert (=> b!176581 m!205495))

(declare-fun m!205497 () Bool)

(assert (=> bm!17848 m!205497))

(assert (=> b!176590 m!205451))

(assert (=> b!176590 m!205451))

(declare-fun m!205499 () Bool)

(assert (=> b!176590 m!205499))

(declare-fun m!205501 () Bool)

(assert (=> b!176588 m!205501))

(assert (=> b!176588 m!205451))

(declare-fun m!205503 () Bool)

(assert (=> b!176588 m!205503))

(declare-fun m!205505 () Bool)

(assert (=> b!176588 m!205505))

(declare-fun m!205507 () Bool)

(assert (=> b!176588 m!205507))

(declare-fun m!205509 () Bool)

(assert (=> b!176588 m!205509))

(declare-fun m!205511 () Bool)

(assert (=> b!176588 m!205511))

(declare-fun m!205513 () Bool)

(assert (=> b!176588 m!205513))

(declare-fun m!205515 () Bool)

(assert (=> b!176588 m!205515))

(declare-fun m!205517 () Bool)

(assert (=> b!176588 m!205517))

(declare-fun m!205519 () Bool)

(assert (=> b!176588 m!205519))

(assert (=> b!176588 m!205493))

(declare-fun m!205521 () Bool)

(assert (=> b!176588 m!205521))

(declare-fun m!205523 () Bool)

(assert (=> b!176588 m!205523))

(declare-fun m!205525 () Bool)

(assert (=> b!176588 m!205525))

(assert (=> b!176588 m!205505))

(assert (=> b!176588 m!205515))

(declare-fun m!205527 () Bool)

(assert (=> b!176588 m!205527))

(assert (=> b!176588 m!205521))

(declare-fun m!205529 () Bool)

(assert (=> b!176588 m!205529))

(assert (=> b!176588 m!205511))

(assert (=> b!176582 m!205451))

(assert (=> b!176582 m!205451))

(assert (=> b!176582 m!205459))

(assert (=> b!176580 m!205451))

(assert (=> b!176580 m!205451))

(assert (=> b!176580 m!205459))

(declare-fun m!205531 () Bool)

(assert (=> b!176586 m!205531))

(declare-fun m!205533 () Bool)

(assert (=> b!176575 m!205533))

(declare-fun m!205535 () Bool)

(assert (=> bm!17850 m!205535))

(assert (=> b!176425 d!53755))

(declare-fun d!53757 () Bool)

(declare-fun res!83682 () Bool)

(declare-fun e!116498 () Bool)

(assert (=> d!53757 (=> (not res!83682) (not e!116498))))

(declare-fun simpleValid!151 (LongMapFixedSize!2344) Bool)

(assert (=> d!53757 (= res!83682 (simpleValid!151 thiss!1248))))

(assert (=> d!53757 (= (valid!1005 thiss!1248) e!116498)))

(declare-fun b!176602 () Bool)

(declare-fun res!83683 () Bool)

(assert (=> b!176602 (=> (not res!83683) (not e!116498))))

(declare-fun arrayCountValidKeys!0 (array!7377 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176602 (= res!83683 (= (arrayCountValidKeys!0 (_keys!5493 thiss!1248) #b00000000000000000000000000000000 (size!3804 (_keys!5493 thiss!1248))) (_size!1221 thiss!1248)))))

(declare-fun b!176603 () Bool)

(declare-fun res!83684 () Bool)

(assert (=> b!176603 (=> (not res!83684) (not e!116498))))

(assert (=> b!176603 (= res!83684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5493 thiss!1248) (mask!8549 thiss!1248)))))

(declare-fun b!176604 () Bool)

(declare-datatypes ((List!2214 0))(
  ( (Nil!2211) (Cons!2210 (h!2831 (_ BitVec 64)) (t!7032 List!2214)) )
))
(declare-fun arrayNoDuplicates!0 (array!7377 (_ BitVec 32) List!2214) Bool)

(assert (=> b!176604 (= e!116498 (arrayNoDuplicates!0 (_keys!5493 thiss!1248) #b00000000000000000000000000000000 Nil!2211))))

(assert (= (and d!53757 res!83682) b!176602))

(assert (= (and b!176602 res!83683) b!176603))

(assert (= (and b!176603 res!83684) b!176604))

(declare-fun m!205537 () Bool)

(assert (=> d!53757 m!205537))

(declare-fun m!205539 () Bool)

(assert (=> b!176602 m!205539))

(assert (=> b!176603 m!205397))

(declare-fun m!205541 () Bool)

(assert (=> b!176604 m!205541))

(assert (=> start!17648 d!53757))

(declare-fun mapNonEmpty!7047 () Bool)

(declare-fun mapRes!7047 () Bool)

(declare-fun tp!15759 () Bool)

(declare-fun e!116504 () Bool)

(assert (=> mapNonEmpty!7047 (= mapRes!7047 (and tp!15759 e!116504))))

(declare-fun mapKey!7047 () (_ BitVec 32))

(declare-fun mapValue!7047 () ValueCell!1718)

(declare-fun mapRest!7047 () (Array (_ BitVec 32) ValueCell!1718))

(assert (=> mapNonEmpty!7047 (= mapRest!7038 (store mapRest!7047 mapKey!7047 mapValue!7047))))

(declare-fun b!176612 () Bool)

(declare-fun e!116503 () Bool)

(assert (=> b!176612 (= e!116503 tp_is_empty!4123)))

(declare-fun condMapEmpty!7047 () Bool)

(declare-fun mapDefault!7047 () ValueCell!1718)

(assert (=> mapNonEmpty!7038 (= condMapEmpty!7047 (= mapRest!7038 ((as const (Array (_ BitVec 32) ValueCell!1718)) mapDefault!7047)))))

(assert (=> mapNonEmpty!7038 (= tp!15744 (and e!116503 mapRes!7047))))

(declare-fun b!176611 () Bool)

(assert (=> b!176611 (= e!116504 tp_is_empty!4123)))

(declare-fun mapIsEmpty!7047 () Bool)

(assert (=> mapIsEmpty!7047 mapRes!7047))

(assert (= (and mapNonEmpty!7038 condMapEmpty!7047) mapIsEmpty!7047))

(assert (= (and mapNonEmpty!7038 (not condMapEmpty!7047)) mapNonEmpty!7047))

(assert (= (and mapNonEmpty!7047 ((_ is ValueCellFull!1718) mapValue!7047)) b!176611))

(assert (= (and mapNonEmpty!7038 ((_ is ValueCellFull!1718) mapDefault!7047)) b!176612))

(declare-fun m!205543 () Bool)

(assert (=> mapNonEmpty!7047 m!205543))

(declare-fun b_lambda!7063 () Bool)

(assert (= b_lambda!7061 (or (and b!176431 b_free!4351) b_lambda!7063)))

(check-sat (not b_next!4351) (not b!176530) (not b!176575) (not b!176528) (not d!53751) (not b!176590) (not b!176582) (not b!176586) (not bm!17850) (not bm!17848) (not b!176602) (not b_lambda!7063) b_and!10865 (not b!176581) (not mapNonEmpty!7047) (not bm!17854) (not d!53757) (not bm!17851) (not b!176603) tp_is_empty!4123 (not b!176503) (not d!53755) (not bm!17833) (not b!176521) (not d!53753) (not b!176589) (not b!176604) (not b!176580) (not b!176502) (not b!176588))
(check-sat b_and!10865 (not b_next!4351))
