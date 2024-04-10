; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19000 () Bool)

(assert start!19000)

(declare-fun b!187353 () Bool)

(declare-fun b_free!4611 () Bool)

(declare-fun b_next!4611 () Bool)

(assert (=> b!187353 (= b_free!4611 (not b_next!4611))))

(declare-fun tp!16646 () Bool)

(declare-fun b_and!11229 () Bool)

(assert (=> b!187353 (= tp!16646 b_and!11229)))

(declare-fun b!187349 () Bool)

(declare-fun e!123317 () Bool)

(declare-fun tp_is_empty!4383 () Bool)

(assert (=> b!187349 (= e!123317 tp_is_empty!4383)))

(declare-fun b!187350 () Bool)

(declare-fun e!123315 () Bool)

(declare-fun e!123310 () Bool)

(assert (=> b!187350 (= e!123315 e!123310)))

(declare-fun res!88589 () Bool)

(assert (=> b!187350 (=> (not res!88589) (not e!123310))))

(declare-datatypes ((SeekEntryResult!647 0))(
  ( (MissingZero!647 (index!4758 (_ BitVec 32))) (Found!647 (index!4759 (_ BitVec 32))) (Intermediate!647 (undefined!1459 Bool) (index!4760 (_ BitVec 32)) (x!20281 (_ BitVec 32))) (Undefined!647) (MissingVacant!647 (index!4761 (_ BitVec 32))) )
))
(declare-fun lt!92682 () SeekEntryResult!647)

(get-info :version)

(assert (=> b!187350 (= res!88589 (and (not ((_ is Undefined!647) lt!92682)) (not ((_ is MissingVacant!647) lt!92682)) (not ((_ is MissingZero!647) lt!92682)) ((_ is Found!647) lt!92682)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5491 0))(
  ( (V!5492 (val!2236 Int)) )
))
(declare-datatypes ((ValueCell!1848 0))(
  ( (ValueCellFull!1848 (v!4151 V!5491)) (EmptyCell!1848) )
))
(declare-datatypes ((array!7983 0))(
  ( (array!7984 (arr!3767 (Array (_ BitVec 32) (_ BitVec 64))) (size!4085 (_ BitVec 32))) )
))
(declare-datatypes ((array!7985 0))(
  ( (array!7986 (arr!3768 (Array (_ BitVec 32) ValueCell!1848)) (size!4086 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2604 0))(
  ( (LongMapFixedSize!2605 (defaultEntry!3822 Int) (mask!8967 (_ BitVec 32)) (extraKeys!3559 (_ BitVec 32)) (zeroValue!3663 V!5491) (minValue!3663 V!5491) (_size!1351 (_ BitVec 32)) (_keys!5773 array!7983) (_values!3805 array!7985) (_vacant!1351 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2604)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7983 (_ BitVec 32)) SeekEntryResult!647)

(assert (=> b!187350 (= lt!92682 (seekEntryOrOpen!0 key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)))))

(declare-fun b!187351 () Bool)

(declare-fun e!123316 () Bool)

(declare-fun mapRes!7550 () Bool)

(assert (=> b!187351 (= e!123316 (and e!123317 mapRes!7550))))

(declare-fun condMapEmpty!7550 () Bool)

(declare-fun mapDefault!7550 () ValueCell!1848)

(assert (=> b!187351 (= condMapEmpty!7550 (= (arr!3768 (_values!3805 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1848)) mapDefault!7550)))))

(declare-fun b!187352 () Bool)

(declare-datatypes ((Unit!5646 0))(
  ( (Unit!5647) )
))
(declare-fun e!123308 () Unit!5646)

(declare-fun Unit!5648 () Unit!5646)

(assert (=> b!187352 (= e!123308 Unit!5648)))

(declare-fun lt!92681 () Unit!5646)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!153 (array!7983 array!7985 (_ BitVec 32) (_ BitVec 32) V!5491 V!5491 (_ BitVec 64) Int) Unit!5646)

(assert (=> b!187352 (= lt!92681 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!153 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) key!828 (defaultEntry!3822 thiss!1248)))))

(assert (=> b!187352 false))

(declare-fun e!123311 () Bool)

(declare-fun array_inv!2437 (array!7983) Bool)

(declare-fun array_inv!2438 (array!7985) Bool)

(assert (=> b!187353 (= e!123311 (and tp!16646 tp_is_empty!4383 (array_inv!2437 (_keys!5773 thiss!1248)) (array_inv!2438 (_values!3805 thiss!1248)) e!123316))))

(declare-fun b!187354 () Bool)

(declare-fun e!123314 () Bool)

(assert (=> b!187354 (= e!123314 (and (= (size!4086 (_values!3805 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8967 thiss!1248))) (= (size!4085 (_keys!5773 thiss!1248)) (size!4086 (_values!3805 thiss!1248))) (bvsge (mask!8967 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3559 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun res!88592 () Bool)

(assert (=> start!19000 (=> (not res!88592) (not e!123315))))

(declare-fun valid!1071 (LongMapFixedSize!2604) Bool)

(assert (=> start!19000 (= res!88592 (valid!1071 thiss!1248))))

(assert (=> start!19000 e!123315))

(assert (=> start!19000 e!123311))

(assert (=> start!19000 true))

(declare-fun b!187355 () Bool)

(declare-fun lt!92680 () Unit!5646)

(assert (=> b!187355 (= e!123308 lt!92680)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!149 (array!7983 array!7985 (_ BitVec 32) (_ BitVec 32) V!5491 V!5491 (_ BitVec 64) Int) Unit!5646)

(assert (=> b!187355 (= lt!92680 (lemmaInListMapThenSeekEntryOrOpenFindsIt!149 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) key!828 (defaultEntry!3822 thiss!1248)))))

(declare-fun res!88593 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187355 (= res!88593 (inRange!0 (index!4759 lt!92682) (mask!8967 thiss!1248)))))

(declare-fun e!123313 () Bool)

(assert (=> b!187355 (=> (not res!88593) (not e!123313))))

(assert (=> b!187355 e!123313))

(declare-fun mapNonEmpty!7550 () Bool)

(declare-fun tp!16645 () Bool)

(declare-fun e!123309 () Bool)

(assert (=> mapNonEmpty!7550 (= mapRes!7550 (and tp!16645 e!123309))))

(declare-fun mapValue!7550 () ValueCell!1848)

(declare-fun mapRest!7550 () (Array (_ BitVec 32) ValueCell!1848))

(declare-fun mapKey!7550 () (_ BitVec 32))

(assert (=> mapNonEmpty!7550 (= (arr!3768 (_values!3805 thiss!1248)) (store mapRest!7550 mapKey!7550 mapValue!7550))))

(declare-fun mapIsEmpty!7550 () Bool)

(assert (=> mapIsEmpty!7550 mapRes!7550))

(declare-fun b!187356 () Bool)

(assert (=> b!187356 (= e!123309 tp_is_empty!4383)))

(declare-fun b!187357 () Bool)

(assert (=> b!187357 (= e!123310 e!123314)))

(declare-fun res!88591 () Bool)

(assert (=> b!187357 (=> (not res!88591) (not e!123314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!187357 (= res!88591 (validMask!0 (mask!8967 thiss!1248)))))

(declare-fun lt!92683 () Unit!5646)

(assert (=> b!187357 (= lt!92683 e!123308)))

(declare-fun c!33630 () Bool)

(declare-datatypes ((tuple2!3478 0))(
  ( (tuple2!3479 (_1!1750 (_ BitVec 64)) (_2!1750 V!5491)) )
))
(declare-datatypes ((List!2382 0))(
  ( (Nil!2379) (Cons!2378 (h!3013 tuple2!3478) (t!7274 List!2382)) )
))
(declare-datatypes ((ListLongMap!2395 0))(
  ( (ListLongMap!2396 (toList!1213 List!2382)) )
))
(declare-fun contains!1313 (ListLongMap!2395 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!861 (array!7983 array!7985 (_ BitVec 32) (_ BitVec 32) V!5491 V!5491 (_ BitVec 32) Int) ListLongMap!2395)

(assert (=> b!187357 (= c!33630 (contains!1313 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)) key!828))))

(declare-fun b!187358 () Bool)

(assert (=> b!187358 (= e!123313 (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4759 lt!92682)) key!828))))

(declare-fun b!187359 () Bool)

(declare-fun res!88590 () Bool)

(assert (=> b!187359 (=> (not res!88590) (not e!123315))))

(assert (=> b!187359 (= res!88590 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!19000 res!88592) b!187359))

(assert (= (and b!187359 res!88590) b!187350))

(assert (= (and b!187350 res!88589) b!187357))

(assert (= (and b!187357 c!33630) b!187355))

(assert (= (and b!187357 (not c!33630)) b!187352))

(assert (= (and b!187355 res!88593) b!187358))

(assert (= (and b!187357 res!88591) b!187354))

(assert (= (and b!187351 condMapEmpty!7550) mapIsEmpty!7550))

(assert (= (and b!187351 (not condMapEmpty!7550)) mapNonEmpty!7550))

(assert (= (and mapNonEmpty!7550 ((_ is ValueCellFull!1848) mapValue!7550)) b!187356))

(assert (= (and b!187351 ((_ is ValueCellFull!1848) mapDefault!7550)) b!187349))

(assert (= b!187353 b!187351))

(assert (= start!19000 b!187353))

(declare-fun m!214169 () Bool)

(assert (=> b!187357 m!214169))

(declare-fun m!214171 () Bool)

(assert (=> b!187357 m!214171))

(assert (=> b!187357 m!214171))

(declare-fun m!214173 () Bool)

(assert (=> b!187357 m!214173))

(declare-fun m!214175 () Bool)

(assert (=> start!19000 m!214175))

(declare-fun m!214177 () Bool)

(assert (=> b!187353 m!214177))

(declare-fun m!214179 () Bool)

(assert (=> b!187353 m!214179))

(declare-fun m!214181 () Bool)

(assert (=> b!187358 m!214181))

(declare-fun m!214183 () Bool)

(assert (=> b!187350 m!214183))

(declare-fun m!214185 () Bool)

(assert (=> b!187352 m!214185))

(declare-fun m!214187 () Bool)

(assert (=> b!187355 m!214187))

(declare-fun m!214189 () Bool)

(assert (=> b!187355 m!214189))

(declare-fun m!214191 () Bool)

(assert (=> mapNonEmpty!7550 m!214191))

(check-sat (not b!187352) (not start!19000) (not b!187350) b_and!11229 tp_is_empty!4383 (not mapNonEmpty!7550) (not b!187355) (not b_next!4611) (not b!187357) (not b!187353))
(check-sat b_and!11229 (not b_next!4611))
(get-model)

(declare-fun b!187409 () Bool)

(declare-fun lt!92701 () SeekEntryResult!647)

(assert (=> b!187409 (and (bvsge (index!4758 lt!92701) #b00000000000000000000000000000000) (bvslt (index!4758 lt!92701) (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun res!88619 () Bool)

(assert (=> b!187409 (= res!88619 (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4758 lt!92701)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123358 () Bool)

(assert (=> b!187409 (=> (not res!88619) (not e!123358))))

(declare-fun b!187410 () Bool)

(declare-fun e!123359 () Bool)

(assert (=> b!187410 (= e!123359 ((_ is Undefined!647) lt!92701))))

(declare-fun b!187412 () Bool)

(declare-fun res!88618 () Bool)

(declare-fun e!123357 () Bool)

(assert (=> b!187412 (=> (not res!88618) (not e!123357))))

(declare-fun call!18888 () Bool)

(assert (=> b!187412 (= res!88618 call!18888)))

(assert (=> b!187412 (= e!123359 e!123357)))

(declare-fun b!187413 () Bool)

(declare-fun e!123356 () Bool)

(assert (=> b!187413 (= e!123356 e!123359)))

(declare-fun c!33639 () Bool)

(assert (=> b!187413 (= c!33639 ((_ is MissingVacant!647) lt!92701))))

(declare-fun b!187414 () Bool)

(declare-fun call!18889 () Bool)

(assert (=> b!187414 (= e!123358 (not call!18889))))

(declare-fun bm!18885 () Bool)

(declare-fun arrayContainsKey!0 (array!7983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18885 (= call!18889 (arrayContainsKey!0 (_keys!5773 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!187415 () Bool)

(assert (=> b!187415 (= e!123356 e!123358)))

(declare-fun res!88617 () Bool)

(assert (=> b!187415 (= res!88617 call!18888)))

(assert (=> b!187415 (=> (not res!88617) (not e!123358))))

(declare-fun b!187411 () Bool)

(declare-fun res!88620 () Bool)

(assert (=> b!187411 (=> (not res!88620) (not e!123357))))

(assert (=> b!187411 (= res!88620 (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4761 lt!92701)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187411 (and (bvsge (index!4761 lt!92701) #b00000000000000000000000000000000) (bvslt (index!4761 lt!92701) (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun d!55399 () Bool)

(assert (=> d!55399 e!123356))

(declare-fun c!33638 () Bool)

(assert (=> d!55399 (= c!33638 ((_ is MissingZero!647) lt!92701))))

(assert (=> d!55399 (= lt!92701 (seekEntryOrOpen!0 key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)))))

(declare-fun lt!92700 () Unit!5646)

(declare-fun choose!996 (array!7983 array!7985 (_ BitVec 32) (_ BitVec 32) V!5491 V!5491 (_ BitVec 64) Int) Unit!5646)

(assert (=> d!55399 (= lt!92700 (choose!996 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) key!828 (defaultEntry!3822 thiss!1248)))))

(assert (=> d!55399 (validMask!0 (mask!8967 thiss!1248))))

(assert (=> d!55399 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!153 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) key!828 (defaultEntry!3822 thiss!1248)) lt!92700)))

(declare-fun bm!18886 () Bool)

(assert (=> bm!18886 (= call!18888 (inRange!0 (ite c!33638 (index!4758 lt!92701) (index!4761 lt!92701)) (mask!8967 thiss!1248)))))

(declare-fun b!187416 () Bool)

(assert (=> b!187416 (= e!123357 (not call!18889))))

(assert (= (and d!55399 c!33638) b!187415))

(assert (= (and d!55399 (not c!33638)) b!187413))

(assert (= (and b!187415 res!88617) b!187409))

(assert (= (and b!187409 res!88619) b!187414))

(assert (= (and b!187413 c!33639) b!187412))

(assert (= (and b!187413 (not c!33639)) b!187410))

(assert (= (and b!187412 res!88618) b!187411))

(assert (= (and b!187411 res!88620) b!187416))

(assert (= (or b!187415 b!187412) bm!18886))

(assert (= (or b!187414 b!187416) bm!18885))

(declare-fun m!214217 () Bool)

(assert (=> bm!18885 m!214217))

(declare-fun m!214219 () Bool)

(assert (=> b!187411 m!214219))

(declare-fun m!214221 () Bool)

(assert (=> b!187409 m!214221))

(declare-fun m!214223 () Bool)

(assert (=> bm!18886 m!214223))

(assert (=> d!55399 m!214183))

(declare-fun m!214225 () Bool)

(assert (=> d!55399 m!214225))

(assert (=> d!55399 m!214169))

(assert (=> b!187352 d!55399))

(declare-fun d!55401 () Bool)

(declare-fun res!88627 () Bool)

(declare-fun e!123362 () Bool)

(assert (=> d!55401 (=> (not res!88627) (not e!123362))))

(declare-fun simpleValid!187 (LongMapFixedSize!2604) Bool)

(assert (=> d!55401 (= res!88627 (simpleValid!187 thiss!1248))))

(assert (=> d!55401 (= (valid!1071 thiss!1248) e!123362)))

(declare-fun b!187423 () Bool)

(declare-fun res!88628 () Bool)

(assert (=> b!187423 (=> (not res!88628) (not e!123362))))

(declare-fun arrayCountValidKeys!0 (array!7983 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187423 (= res!88628 (= (arrayCountValidKeys!0 (_keys!5773 thiss!1248) #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))) (_size!1351 thiss!1248)))))

(declare-fun b!187424 () Bool)

(declare-fun res!88629 () Bool)

(assert (=> b!187424 (=> (not res!88629) (not e!123362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7983 (_ BitVec 32)) Bool)

(assert (=> b!187424 (= res!88629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)))))

(declare-fun b!187425 () Bool)

(declare-datatypes ((List!2383 0))(
  ( (Nil!2380) (Cons!2379 (h!3014 (_ BitVec 64)) (t!7277 List!2383)) )
))
(declare-fun arrayNoDuplicates!0 (array!7983 (_ BitVec 32) List!2383) Bool)

(assert (=> b!187425 (= e!123362 (arrayNoDuplicates!0 (_keys!5773 thiss!1248) #b00000000000000000000000000000000 Nil!2380))))

(assert (= (and d!55401 res!88627) b!187423))

(assert (= (and b!187423 res!88628) b!187424))

(assert (= (and b!187424 res!88629) b!187425))

(declare-fun m!214227 () Bool)

(assert (=> d!55401 m!214227))

(declare-fun m!214229 () Bool)

(assert (=> b!187423 m!214229))

(declare-fun m!214231 () Bool)

(assert (=> b!187424 m!214231))

(declare-fun m!214233 () Bool)

(assert (=> b!187425 m!214233))

(assert (=> start!19000 d!55401))

(declare-fun d!55403 () Bool)

(assert (=> d!55403 (= (array_inv!2437 (_keys!5773 thiss!1248)) (bvsge (size!4085 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187353 d!55403))

(declare-fun d!55405 () Bool)

(assert (=> d!55405 (= (array_inv!2438 (_values!3805 thiss!1248)) (bvsge (size!4086 (_values!3805 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187353 d!55405))

(declare-fun d!55407 () Bool)

(assert (=> d!55407 (= (validMask!0 (mask!8967 thiss!1248)) (and (or (= (mask!8967 thiss!1248) #b00000000000000000000000000000111) (= (mask!8967 thiss!1248) #b00000000000000000000000000001111) (= (mask!8967 thiss!1248) #b00000000000000000000000000011111) (= (mask!8967 thiss!1248) #b00000000000000000000000000111111) (= (mask!8967 thiss!1248) #b00000000000000000000000001111111) (= (mask!8967 thiss!1248) #b00000000000000000000000011111111) (= (mask!8967 thiss!1248) #b00000000000000000000000111111111) (= (mask!8967 thiss!1248) #b00000000000000000000001111111111) (= (mask!8967 thiss!1248) #b00000000000000000000011111111111) (= (mask!8967 thiss!1248) #b00000000000000000000111111111111) (= (mask!8967 thiss!1248) #b00000000000000000001111111111111) (= (mask!8967 thiss!1248) #b00000000000000000011111111111111) (= (mask!8967 thiss!1248) #b00000000000000000111111111111111) (= (mask!8967 thiss!1248) #b00000000000000001111111111111111) (= (mask!8967 thiss!1248) #b00000000000000011111111111111111) (= (mask!8967 thiss!1248) #b00000000000000111111111111111111) (= (mask!8967 thiss!1248) #b00000000000001111111111111111111) (= (mask!8967 thiss!1248) #b00000000000011111111111111111111) (= (mask!8967 thiss!1248) #b00000000000111111111111111111111) (= (mask!8967 thiss!1248) #b00000000001111111111111111111111) (= (mask!8967 thiss!1248) #b00000000011111111111111111111111) (= (mask!8967 thiss!1248) #b00000000111111111111111111111111) (= (mask!8967 thiss!1248) #b00000001111111111111111111111111) (= (mask!8967 thiss!1248) #b00000011111111111111111111111111) (= (mask!8967 thiss!1248) #b00000111111111111111111111111111) (= (mask!8967 thiss!1248) #b00001111111111111111111111111111) (= (mask!8967 thiss!1248) #b00011111111111111111111111111111) (= (mask!8967 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8967 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!187357 d!55407))

(declare-fun d!55409 () Bool)

(declare-fun e!123368 () Bool)

(assert (=> d!55409 e!123368))

(declare-fun res!88632 () Bool)

(assert (=> d!55409 (=> res!88632 e!123368)))

(declare-fun lt!92711 () Bool)

(assert (=> d!55409 (= res!88632 (not lt!92711))))

(declare-fun lt!92713 () Bool)

(assert (=> d!55409 (= lt!92711 lt!92713)))

(declare-fun lt!92710 () Unit!5646)

(declare-fun e!123367 () Unit!5646)

(assert (=> d!55409 (= lt!92710 e!123367)))

(declare-fun c!33642 () Bool)

(assert (=> d!55409 (= c!33642 lt!92713)))

(declare-fun containsKey!232 (List!2382 (_ BitVec 64)) Bool)

(assert (=> d!55409 (= lt!92713 (containsKey!232 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828))))

(assert (=> d!55409 (= (contains!1313 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)) key!828) lt!92711)))

(declare-fun b!187432 () Bool)

(declare-fun lt!92712 () Unit!5646)

(assert (=> b!187432 (= e!123367 lt!92712)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!180 (List!2382 (_ BitVec 64)) Unit!5646)

(assert (=> b!187432 (= lt!92712 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828))))

(declare-datatypes ((Option!234 0))(
  ( (Some!233 (v!4153 V!5491)) (None!232) )
))
(declare-fun isDefined!181 (Option!234) Bool)

(declare-fun getValueByKey!228 (List!2382 (_ BitVec 64)) Option!234)

(assert (=> b!187432 (isDefined!181 (getValueByKey!228 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828))))

(declare-fun b!187433 () Bool)

(declare-fun Unit!5652 () Unit!5646)

(assert (=> b!187433 (= e!123367 Unit!5652)))

(declare-fun b!187434 () Bool)

(assert (=> b!187434 (= e!123368 (isDefined!181 (getValueByKey!228 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828)))))

(assert (= (and d!55409 c!33642) b!187432))

(assert (= (and d!55409 (not c!33642)) b!187433))

(assert (= (and d!55409 (not res!88632)) b!187434))

(declare-fun m!214235 () Bool)

(assert (=> d!55409 m!214235))

(declare-fun m!214237 () Bool)

(assert (=> b!187432 m!214237))

(declare-fun m!214239 () Bool)

(assert (=> b!187432 m!214239))

(assert (=> b!187432 m!214239))

(declare-fun m!214241 () Bool)

(assert (=> b!187432 m!214241))

(assert (=> b!187434 m!214239))

(assert (=> b!187434 m!214239))

(assert (=> b!187434 m!214241))

(assert (=> b!187357 d!55409))

(declare-fun b!187477 () Bool)

(declare-fun e!123397 () ListLongMap!2395)

(declare-fun call!18906 () ListLongMap!2395)

(assert (=> b!187477 (= e!123397 call!18906)))

(declare-fun c!33657 () Bool)

(declare-fun call!18909 () ListLongMap!2395)

(declare-fun call!18905 () ListLongMap!2395)

(declare-fun call!18904 () ListLongMap!2395)

(declare-fun call!18910 () ListLongMap!2395)

(declare-fun bm!18901 () Bool)

(declare-fun c!33655 () Bool)

(declare-fun +!291 (ListLongMap!2395 tuple2!3478) ListLongMap!2395)

(assert (=> bm!18901 (= call!18905 (+!291 (ite c!33657 call!18904 (ite c!33655 call!18909 call!18910)) (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))))))

(declare-fun bm!18902 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!204 (array!7983 array!7985 (_ BitVec 32) (_ BitVec 32) V!5491 V!5491 (_ BitVec 32) Int) ListLongMap!2395)

(assert (=> bm!18902 (= call!18904 (getCurrentListMapNoExtraKeys!204 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))))

(declare-fun bm!18903 () Bool)

(declare-fun call!18908 () Bool)

(declare-fun lt!92764 () ListLongMap!2395)

(assert (=> bm!18903 (= call!18908 (contains!1313 lt!92764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187479 () Bool)

(declare-fun res!88652 () Bool)

(declare-fun e!123406 () Bool)

(assert (=> b!187479 (=> (not res!88652) (not e!123406))))

(declare-fun e!123396 () Bool)

(assert (=> b!187479 (= res!88652 e!123396)))

(declare-fun c!33659 () Bool)

(assert (=> b!187479 (= c!33659 (not (= (bvand (extraKeys!3559 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!187480 () Bool)

(declare-fun e!123403 () Bool)

(assert (=> b!187480 (= e!123396 e!123403)))

(declare-fun res!88659 () Bool)

(assert (=> b!187480 (= res!88659 call!18908)))

(assert (=> b!187480 (=> (not res!88659) (not e!123403))))

(declare-fun b!187481 () Bool)

(declare-fun e!123395 () Bool)

(declare-fun apply!171 (ListLongMap!2395 (_ BitVec 64)) V!5491)

(assert (=> b!187481 (= e!123395 (= (apply!171 lt!92764 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3663 thiss!1248)))))

(declare-fun b!187482 () Bool)

(declare-fun e!123400 () Unit!5646)

(declare-fun Unit!5653 () Unit!5646)

(assert (=> b!187482 (= e!123400 Unit!5653)))

(declare-fun b!187483 () Bool)

(assert (=> b!187483 (= e!123403 (= (apply!171 lt!92764 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3663 thiss!1248)))))

(declare-fun b!187478 () Bool)

(declare-fun e!123407 () ListLongMap!2395)

(assert (=> b!187478 (= e!123407 e!123397)))

(assert (=> b!187478 (= c!33655 (and (not (= (bvand (extraKeys!3559 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3559 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!55411 () Bool)

(assert (=> d!55411 e!123406))

(declare-fun res!88651 () Bool)

(assert (=> d!55411 (=> (not res!88651) (not e!123406))))

(assert (=> d!55411 (= res!88651 (or (bvsge #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))))

(declare-fun lt!92771 () ListLongMap!2395)

(assert (=> d!55411 (= lt!92764 lt!92771)))

(declare-fun lt!92758 () Unit!5646)

(assert (=> d!55411 (= lt!92758 e!123400)))

(declare-fun c!33660 () Bool)

(declare-fun e!123399 () Bool)

(assert (=> d!55411 (= c!33660 e!123399)))

(declare-fun res!88655 () Bool)

(assert (=> d!55411 (=> (not res!88655) (not e!123399))))

(assert (=> d!55411 (= res!88655 (bvslt #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(assert (=> d!55411 (= lt!92771 e!123407)))

(assert (=> d!55411 (= c!33657 (and (not (= (bvand (extraKeys!3559 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3559 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55411 (validMask!0 (mask!8967 thiss!1248))))

(assert (=> d!55411 (= (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)) lt!92764)))

(declare-fun b!187484 () Bool)

(declare-fun e!123402 () Bool)

(declare-fun call!18907 () Bool)

(assert (=> b!187484 (= e!123402 (not call!18907))))

(declare-fun b!187485 () Bool)

(assert (=> b!187485 (= e!123402 e!123395)))

(declare-fun res!88653 () Bool)

(assert (=> b!187485 (= res!88653 call!18907)))

(assert (=> b!187485 (=> (not res!88653) (not e!123395))))

(declare-fun b!187486 () Bool)

(declare-fun e!123404 () Bool)

(declare-fun e!123405 () Bool)

(assert (=> b!187486 (= e!123404 e!123405)))

(declare-fun res!88654 () Bool)

(assert (=> b!187486 (=> (not res!88654) (not e!123405))))

(assert (=> b!187486 (= res!88654 (contains!1313 lt!92764 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun b!187487 () Bool)

(assert (=> b!187487 (= e!123407 (+!291 call!18905 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))))))

(declare-fun b!187488 () Bool)

(declare-fun res!88658 () Bool)

(assert (=> b!187488 (=> (not res!88658) (not e!123406))))

(assert (=> b!187488 (= res!88658 e!123404)))

(declare-fun res!88657 () Bool)

(assert (=> b!187488 (=> res!88657 e!123404)))

(declare-fun e!123398 () Bool)

(assert (=> b!187488 (= res!88657 (not e!123398))))

(declare-fun res!88656 () Bool)

(assert (=> b!187488 (=> (not res!88656) (not e!123398))))

(assert (=> b!187488 (= res!88656 (bvslt #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun b!187489 () Bool)

(assert (=> b!187489 (= e!123406 e!123402)))

(declare-fun c!33658 () Bool)

(assert (=> b!187489 (= c!33658 (not (= (bvand (extraKeys!3559 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18904 () Bool)

(assert (=> bm!18904 (= call!18909 call!18904)))

(declare-fun bm!18905 () Bool)

(assert (=> bm!18905 (= call!18907 (contains!1313 lt!92764 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187490 () Bool)

(declare-fun e!123401 () ListLongMap!2395)

(assert (=> b!187490 (= e!123401 call!18906)))

(declare-fun bm!18906 () Bool)

(assert (=> bm!18906 (= call!18906 call!18905)))

(declare-fun b!187491 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!187491 (= e!123398 (validKeyInArray!0 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187492 () Bool)

(declare-fun c!33656 () Bool)

(assert (=> b!187492 (= c!33656 (and (not (= (bvand (extraKeys!3559 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3559 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!187492 (= e!123397 e!123401)))

(declare-fun b!187493 () Bool)

(assert (=> b!187493 (= e!123396 (not call!18908))))

(declare-fun b!187494 () Bool)

(declare-fun lt!92769 () Unit!5646)

(assert (=> b!187494 (= e!123400 lt!92769)))

(declare-fun lt!92775 () ListLongMap!2395)

(assert (=> b!187494 (= lt!92775 (getCurrentListMapNoExtraKeys!204 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))))

(declare-fun lt!92776 () (_ BitVec 64))

(assert (=> b!187494 (= lt!92776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92762 () (_ BitVec 64))

(assert (=> b!187494 (= lt!92762 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92770 () Unit!5646)

(declare-fun addStillContains!147 (ListLongMap!2395 (_ BitVec 64) V!5491 (_ BitVec 64)) Unit!5646)

(assert (=> b!187494 (= lt!92770 (addStillContains!147 lt!92775 lt!92776 (zeroValue!3663 thiss!1248) lt!92762))))

(assert (=> b!187494 (contains!1313 (+!291 lt!92775 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248))) lt!92762)))

(declare-fun lt!92773 () Unit!5646)

(assert (=> b!187494 (= lt!92773 lt!92770)))

(declare-fun lt!92767 () ListLongMap!2395)

(assert (=> b!187494 (= lt!92767 (getCurrentListMapNoExtraKeys!204 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))))

(declare-fun lt!92778 () (_ BitVec 64))

(assert (=> b!187494 (= lt!92778 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92761 () (_ BitVec 64))

(assert (=> b!187494 (= lt!92761 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92772 () Unit!5646)

(declare-fun addApplyDifferent!147 (ListLongMap!2395 (_ BitVec 64) V!5491 (_ BitVec 64)) Unit!5646)

(assert (=> b!187494 (= lt!92772 (addApplyDifferent!147 lt!92767 lt!92778 (minValue!3663 thiss!1248) lt!92761))))

(assert (=> b!187494 (= (apply!171 (+!291 lt!92767 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248))) lt!92761) (apply!171 lt!92767 lt!92761))))

(declare-fun lt!92765 () Unit!5646)

(assert (=> b!187494 (= lt!92765 lt!92772)))

(declare-fun lt!92760 () ListLongMap!2395)

(assert (=> b!187494 (= lt!92760 (getCurrentListMapNoExtraKeys!204 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))))

(declare-fun lt!92759 () (_ BitVec 64))

(assert (=> b!187494 (= lt!92759 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92763 () (_ BitVec 64))

(assert (=> b!187494 (= lt!92763 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92777 () Unit!5646)

(assert (=> b!187494 (= lt!92777 (addApplyDifferent!147 lt!92760 lt!92759 (zeroValue!3663 thiss!1248) lt!92763))))

(assert (=> b!187494 (= (apply!171 (+!291 lt!92760 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248))) lt!92763) (apply!171 lt!92760 lt!92763))))

(declare-fun lt!92766 () Unit!5646)

(assert (=> b!187494 (= lt!92766 lt!92777)))

(declare-fun lt!92768 () ListLongMap!2395)

(assert (=> b!187494 (= lt!92768 (getCurrentListMapNoExtraKeys!204 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))))

(declare-fun lt!92779 () (_ BitVec 64))

(assert (=> b!187494 (= lt!92779 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92774 () (_ BitVec 64))

(assert (=> b!187494 (= lt!92774 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187494 (= lt!92769 (addApplyDifferent!147 lt!92768 lt!92779 (minValue!3663 thiss!1248) lt!92774))))

(assert (=> b!187494 (= (apply!171 (+!291 lt!92768 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248))) lt!92774) (apply!171 lt!92768 lt!92774))))

(declare-fun b!187495 () Bool)

(declare-fun get!2166 (ValueCell!1848 V!5491) V!5491)

(declare-fun dynLambda!514 (Int (_ BitVec 64)) V!5491)

(assert (=> b!187495 (= e!123405 (= (apply!171 lt!92764 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)) (get!2166 (select (arr!3768 (_values!3805 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3822 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187495 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4086 (_values!3805 thiss!1248))))))

(assert (=> b!187495 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun b!187496 () Bool)

(assert (=> b!187496 (= e!123399 (validKeyInArray!0 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18907 () Bool)

(assert (=> bm!18907 (= call!18910 call!18909)))

(declare-fun b!187497 () Bool)

(assert (=> b!187497 (= e!123401 call!18910)))

(assert (= (and d!55411 c!33657) b!187487))

(assert (= (and d!55411 (not c!33657)) b!187478))

(assert (= (and b!187478 c!33655) b!187477))

(assert (= (and b!187478 (not c!33655)) b!187492))

(assert (= (and b!187492 c!33656) b!187490))

(assert (= (and b!187492 (not c!33656)) b!187497))

(assert (= (or b!187490 b!187497) bm!18907))

(assert (= (or b!187477 bm!18907) bm!18904))

(assert (= (or b!187477 b!187490) bm!18906))

(assert (= (or b!187487 bm!18904) bm!18902))

(assert (= (or b!187487 bm!18906) bm!18901))

(assert (= (and d!55411 res!88655) b!187496))

(assert (= (and d!55411 c!33660) b!187494))

(assert (= (and d!55411 (not c!33660)) b!187482))

(assert (= (and d!55411 res!88651) b!187488))

(assert (= (and b!187488 res!88656) b!187491))

(assert (= (and b!187488 (not res!88657)) b!187486))

(assert (= (and b!187486 res!88654) b!187495))

(assert (= (and b!187488 res!88658) b!187479))

(assert (= (and b!187479 c!33659) b!187480))

(assert (= (and b!187479 (not c!33659)) b!187493))

(assert (= (and b!187480 res!88659) b!187483))

(assert (= (or b!187480 b!187493) bm!18903))

(assert (= (and b!187479 res!88652) b!187489))

(assert (= (and b!187489 c!33658) b!187485))

(assert (= (and b!187489 (not c!33658)) b!187484))

(assert (= (and b!187485 res!88653) b!187481))

(assert (= (or b!187485 b!187484) bm!18905))

(declare-fun b_lambda!7287 () Bool)

(assert (=> (not b_lambda!7287) (not b!187495)))

(declare-fun t!7276 () Bool)

(declare-fun tb!2853 () Bool)

(assert (=> (and b!187353 (= (defaultEntry!3822 thiss!1248) (defaultEntry!3822 thiss!1248)) t!7276) tb!2853))

(declare-fun result!4837 () Bool)

(assert (=> tb!2853 (= result!4837 tp_is_empty!4383)))

(assert (=> b!187495 t!7276))

(declare-fun b_and!11233 () Bool)

(assert (= b_and!11229 (and (=> t!7276 result!4837) b_and!11233)))

(declare-fun m!214243 () Bool)

(assert (=> b!187483 m!214243))

(declare-fun m!214245 () Bool)

(assert (=> b!187487 m!214245))

(declare-fun m!214247 () Bool)

(assert (=> bm!18905 m!214247))

(declare-fun m!214249 () Bool)

(assert (=> b!187491 m!214249))

(assert (=> b!187491 m!214249))

(declare-fun m!214251 () Bool)

(assert (=> b!187491 m!214251))

(assert (=> d!55411 m!214169))

(declare-fun m!214253 () Bool)

(assert (=> b!187494 m!214253))

(declare-fun m!214255 () Bool)

(assert (=> b!187494 m!214255))

(declare-fun m!214257 () Bool)

(assert (=> b!187494 m!214257))

(declare-fun m!214259 () Bool)

(assert (=> b!187494 m!214259))

(declare-fun m!214261 () Bool)

(assert (=> b!187494 m!214261))

(assert (=> b!187494 m!214249))

(declare-fun m!214263 () Bool)

(assert (=> b!187494 m!214263))

(declare-fun m!214265 () Bool)

(assert (=> b!187494 m!214265))

(declare-fun m!214267 () Bool)

(assert (=> b!187494 m!214267))

(declare-fun m!214269 () Bool)

(assert (=> b!187494 m!214269))

(declare-fun m!214271 () Bool)

(assert (=> b!187494 m!214271))

(assert (=> b!187494 m!214263))

(declare-fun m!214273 () Bool)

(assert (=> b!187494 m!214273))

(assert (=> b!187494 m!214253))

(declare-fun m!214275 () Bool)

(assert (=> b!187494 m!214275))

(declare-fun m!214277 () Bool)

(assert (=> b!187494 m!214277))

(assert (=> b!187494 m!214269))

(assert (=> b!187494 m!214257))

(declare-fun m!214279 () Bool)

(assert (=> b!187494 m!214279))

(declare-fun m!214281 () Bool)

(assert (=> b!187494 m!214281))

(declare-fun m!214283 () Bool)

(assert (=> b!187494 m!214283))

(assert (=> b!187496 m!214249))

(assert (=> b!187496 m!214249))

(assert (=> b!187496 m!214251))

(assert (=> b!187495 m!214249))

(declare-fun m!214285 () Bool)

(assert (=> b!187495 m!214285))

(assert (=> b!187495 m!214249))

(declare-fun m!214287 () Bool)

(assert (=> b!187495 m!214287))

(declare-fun m!214289 () Bool)

(assert (=> b!187495 m!214289))

(assert (=> b!187495 m!214287))

(assert (=> b!187495 m!214289))

(declare-fun m!214291 () Bool)

(assert (=> b!187495 m!214291))

(declare-fun m!214293 () Bool)

(assert (=> bm!18903 m!214293))

(assert (=> b!187486 m!214249))

(assert (=> b!187486 m!214249))

(declare-fun m!214295 () Bool)

(assert (=> b!187486 m!214295))

(declare-fun m!214297 () Bool)

(assert (=> bm!18901 m!214297))

(assert (=> bm!18902 m!214267))

(declare-fun m!214299 () Bool)

(assert (=> b!187481 m!214299))

(assert (=> b!187357 d!55411))

(declare-fun b!187512 () Bool)

(declare-fun c!33669 () Bool)

(declare-fun lt!92788 () (_ BitVec 64))

(assert (=> b!187512 (= c!33669 (= lt!92788 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123415 () SeekEntryResult!647)

(declare-fun e!123416 () SeekEntryResult!647)

(assert (=> b!187512 (= e!123415 e!123416)))

(declare-fun b!187513 () Bool)

(declare-fun lt!92787 () SeekEntryResult!647)

(assert (=> b!187513 (= e!123415 (Found!647 (index!4760 lt!92787)))))

(declare-fun b!187514 () Bool)

(assert (=> b!187514 (= e!123416 (MissingZero!647 (index!4760 lt!92787)))))

(declare-fun b!187515 () Bool)

(declare-fun e!123414 () SeekEntryResult!647)

(assert (=> b!187515 (= e!123414 Undefined!647)))

(declare-fun d!55413 () Bool)

(declare-fun lt!92786 () SeekEntryResult!647)

(assert (=> d!55413 (and (or ((_ is Undefined!647) lt!92786) (not ((_ is Found!647) lt!92786)) (and (bvsge (index!4759 lt!92786) #b00000000000000000000000000000000) (bvslt (index!4759 lt!92786) (size!4085 (_keys!5773 thiss!1248))))) (or ((_ is Undefined!647) lt!92786) ((_ is Found!647) lt!92786) (not ((_ is MissingZero!647) lt!92786)) (and (bvsge (index!4758 lt!92786) #b00000000000000000000000000000000) (bvslt (index!4758 lt!92786) (size!4085 (_keys!5773 thiss!1248))))) (or ((_ is Undefined!647) lt!92786) ((_ is Found!647) lt!92786) ((_ is MissingZero!647) lt!92786) (not ((_ is MissingVacant!647) lt!92786)) (and (bvsge (index!4761 lt!92786) #b00000000000000000000000000000000) (bvslt (index!4761 lt!92786) (size!4085 (_keys!5773 thiss!1248))))) (or ((_ is Undefined!647) lt!92786) (ite ((_ is Found!647) lt!92786) (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4759 lt!92786)) key!828) (ite ((_ is MissingZero!647) lt!92786) (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4758 lt!92786)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!647) lt!92786) (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4761 lt!92786)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55413 (= lt!92786 e!123414)))

(declare-fun c!33668 () Bool)

(assert (=> d!55413 (= c!33668 (and ((_ is Intermediate!647) lt!92787) (undefined!1459 lt!92787)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7983 (_ BitVec 32)) SeekEntryResult!647)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55413 (= lt!92787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8967 thiss!1248)) key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)))))

(assert (=> d!55413 (validMask!0 (mask!8967 thiss!1248))))

(assert (=> d!55413 (= (seekEntryOrOpen!0 key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)) lt!92786)))

(declare-fun b!187516 () Bool)

(assert (=> b!187516 (= e!123414 e!123415)))

(assert (=> b!187516 (= lt!92788 (select (arr!3767 (_keys!5773 thiss!1248)) (index!4760 lt!92787)))))

(declare-fun c!33667 () Bool)

(assert (=> b!187516 (= c!33667 (= lt!92788 key!828))))

(declare-fun b!187517 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7983 (_ BitVec 32)) SeekEntryResult!647)

(assert (=> b!187517 (= e!123416 (seekKeyOrZeroReturnVacant!0 (x!20281 lt!92787) (index!4760 lt!92787) (index!4760 lt!92787) key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)))))

(assert (= (and d!55413 c!33668) b!187515))

(assert (= (and d!55413 (not c!33668)) b!187516))

(assert (= (and b!187516 c!33667) b!187513))

(assert (= (and b!187516 (not c!33667)) b!187512))

(assert (= (and b!187512 c!33669) b!187514))

(assert (= (and b!187512 (not c!33669)) b!187517))

(assert (=> d!55413 m!214169))

(declare-fun m!214301 () Bool)

(assert (=> d!55413 m!214301))

(declare-fun m!214303 () Bool)

(assert (=> d!55413 m!214303))

(declare-fun m!214305 () Bool)

(assert (=> d!55413 m!214305))

(declare-fun m!214307 () Bool)

(assert (=> d!55413 m!214307))

(assert (=> d!55413 m!214301))

(declare-fun m!214309 () Bool)

(assert (=> d!55413 m!214309))

(declare-fun m!214311 () Bool)

(assert (=> b!187516 m!214311))

(declare-fun m!214313 () Bool)

(assert (=> b!187517 m!214313))

(assert (=> b!187350 d!55413))

(declare-fun d!55415 () Bool)

(declare-fun e!123419 () Bool)

(assert (=> d!55415 e!123419))

(declare-fun res!88664 () Bool)

(assert (=> d!55415 (=> (not res!88664) (not e!123419))))

(declare-fun lt!92794 () SeekEntryResult!647)

(assert (=> d!55415 (= res!88664 ((_ is Found!647) lt!92794))))

(assert (=> d!55415 (= lt!92794 (seekEntryOrOpen!0 key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)))))

(declare-fun lt!92793 () Unit!5646)

(declare-fun choose!997 (array!7983 array!7985 (_ BitVec 32) (_ BitVec 32) V!5491 V!5491 (_ BitVec 64) Int) Unit!5646)

(assert (=> d!55415 (= lt!92793 (choose!997 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) key!828 (defaultEntry!3822 thiss!1248)))))

(assert (=> d!55415 (validMask!0 (mask!8967 thiss!1248))))

(assert (=> d!55415 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!149 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) key!828 (defaultEntry!3822 thiss!1248)) lt!92793)))

(declare-fun b!187522 () Bool)

(declare-fun res!88665 () Bool)

(assert (=> b!187522 (=> (not res!88665) (not e!123419))))

(assert (=> b!187522 (= res!88665 (inRange!0 (index!4759 lt!92794) (mask!8967 thiss!1248)))))

(declare-fun b!187523 () Bool)

(assert (=> b!187523 (= e!123419 (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4759 lt!92794)) key!828))))

(assert (=> b!187523 (and (bvsge (index!4759 lt!92794) #b00000000000000000000000000000000) (bvslt (index!4759 lt!92794) (size!4085 (_keys!5773 thiss!1248))))))

(assert (= (and d!55415 res!88664) b!187522))

(assert (= (and b!187522 res!88665) b!187523))

(assert (=> d!55415 m!214183))

(declare-fun m!214315 () Bool)

(assert (=> d!55415 m!214315))

(assert (=> d!55415 m!214169))

(declare-fun m!214317 () Bool)

(assert (=> b!187522 m!214317))

(declare-fun m!214319 () Bool)

(assert (=> b!187523 m!214319))

(assert (=> b!187355 d!55415))

(declare-fun d!55417 () Bool)

(assert (=> d!55417 (= (inRange!0 (index!4759 lt!92682) (mask!8967 thiss!1248)) (and (bvsge (index!4759 lt!92682) #b00000000000000000000000000000000) (bvslt (index!4759 lt!92682) (bvadd (mask!8967 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187355 d!55417))

(declare-fun b!187531 () Bool)

(declare-fun e!123424 () Bool)

(assert (=> b!187531 (= e!123424 tp_is_empty!4383)))

(declare-fun mapIsEmpty!7556 () Bool)

(declare-fun mapRes!7556 () Bool)

(assert (=> mapIsEmpty!7556 mapRes!7556))

(declare-fun condMapEmpty!7556 () Bool)

(declare-fun mapDefault!7556 () ValueCell!1848)

(assert (=> mapNonEmpty!7550 (= condMapEmpty!7556 (= mapRest!7550 ((as const (Array (_ BitVec 32) ValueCell!1848)) mapDefault!7556)))))

(assert (=> mapNonEmpty!7550 (= tp!16645 (and e!123424 mapRes!7556))))

(declare-fun b!187530 () Bool)

(declare-fun e!123425 () Bool)

(assert (=> b!187530 (= e!123425 tp_is_empty!4383)))

(declare-fun mapNonEmpty!7556 () Bool)

(declare-fun tp!16655 () Bool)

(assert (=> mapNonEmpty!7556 (= mapRes!7556 (and tp!16655 e!123425))))

(declare-fun mapValue!7556 () ValueCell!1848)

(declare-fun mapKey!7556 () (_ BitVec 32))

(declare-fun mapRest!7556 () (Array (_ BitVec 32) ValueCell!1848))

(assert (=> mapNonEmpty!7556 (= mapRest!7550 (store mapRest!7556 mapKey!7556 mapValue!7556))))

(assert (= (and mapNonEmpty!7550 condMapEmpty!7556) mapIsEmpty!7556))

(assert (= (and mapNonEmpty!7550 (not condMapEmpty!7556)) mapNonEmpty!7556))

(assert (= (and mapNonEmpty!7556 ((_ is ValueCellFull!1848) mapValue!7556)) b!187530))

(assert (= (and mapNonEmpty!7550 ((_ is ValueCellFull!1848) mapDefault!7556)) b!187531))

(declare-fun m!214321 () Bool)

(assert (=> mapNonEmpty!7556 m!214321))

(declare-fun b_lambda!7289 () Bool)

(assert (= b_lambda!7287 (or (and b!187353 b_free!4611) b_lambda!7289)))

(check-sat (not d!55411) (not d!55413) (not b!187496) (not b!187483) (not bm!18905) (not mapNonEmpty!7556) tp_is_empty!4383 (not d!55401) (not b!187432) (not b!187425) (not bm!18901) (not d!55415) (not b!187487) (not b!187494) (not bm!18903) b_and!11233 (not b!187424) (not b!187423) (not bm!18885) (not bm!18886) (not b_lambda!7289) (not b!187434) (not b!187491) (not bm!18902) (not d!55399) (not d!55409) (not b!187481) (not b!187522) (not b!187486) (not b!187517) (not b!187495) (not b_next!4611))
(check-sat b_and!11233 (not b_next!4611))
(get-model)

(assert (=> d!55415 d!55413))

(declare-fun d!55419 () Bool)

(declare-fun e!123428 () Bool)

(assert (=> d!55419 e!123428))

(declare-fun res!88670 () Bool)

(assert (=> d!55419 (=> (not res!88670) (not e!123428))))

(declare-fun lt!92797 () SeekEntryResult!647)

(assert (=> d!55419 (= res!88670 ((_ is Found!647) lt!92797))))

(assert (=> d!55419 (= lt!92797 (seekEntryOrOpen!0 key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)))))

(assert (=> d!55419 true))

(declare-fun _$33!132 () Unit!5646)

(assert (=> d!55419 (= (choose!997 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) key!828 (defaultEntry!3822 thiss!1248)) _$33!132)))

(declare-fun b!187536 () Bool)

(declare-fun res!88671 () Bool)

(assert (=> b!187536 (=> (not res!88671) (not e!123428))))

(assert (=> b!187536 (= res!88671 (inRange!0 (index!4759 lt!92797) (mask!8967 thiss!1248)))))

(declare-fun b!187537 () Bool)

(assert (=> b!187537 (= e!123428 (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4759 lt!92797)) key!828))))

(assert (= (and d!55419 res!88670) b!187536))

(assert (= (and b!187536 res!88671) b!187537))

(assert (=> d!55419 m!214183))

(declare-fun m!214323 () Bool)

(assert (=> b!187536 m!214323))

(declare-fun m!214325 () Bool)

(assert (=> b!187537 m!214325))

(assert (=> d!55415 d!55419))

(assert (=> d!55415 d!55407))

(declare-fun d!55421 () Bool)

(declare-fun e!123431 () Bool)

(assert (=> d!55421 e!123431))

(declare-fun res!88677 () Bool)

(assert (=> d!55421 (=> (not res!88677) (not e!123431))))

(declare-fun lt!92809 () ListLongMap!2395)

(assert (=> d!55421 (= res!88677 (contains!1313 lt!92809 (_1!1750 (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))))))))

(declare-fun lt!92808 () List!2382)

(assert (=> d!55421 (= lt!92809 (ListLongMap!2396 lt!92808))))

(declare-fun lt!92806 () Unit!5646)

(declare-fun lt!92807 () Unit!5646)

(assert (=> d!55421 (= lt!92806 lt!92807)))

(assert (=> d!55421 (= (getValueByKey!228 lt!92808 (_1!1750 (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))))) (Some!233 (_2!1750 (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!119 (List!2382 (_ BitVec 64) V!5491) Unit!5646)

(assert (=> d!55421 (= lt!92807 (lemmaContainsTupThenGetReturnValue!119 lt!92808 (_1!1750 (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))) (_2!1750 (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))))))))

(declare-fun insertStrictlySorted!122 (List!2382 (_ BitVec 64) V!5491) List!2382)

(assert (=> d!55421 (= lt!92808 (insertStrictlySorted!122 (toList!1213 (ite c!33657 call!18904 (ite c!33655 call!18909 call!18910))) (_1!1750 (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))) (_2!1750 (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))))))))

(assert (=> d!55421 (= (+!291 (ite c!33657 call!18904 (ite c!33655 call!18909 call!18910)) (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))) lt!92809)))

(declare-fun b!187542 () Bool)

(declare-fun res!88676 () Bool)

(assert (=> b!187542 (=> (not res!88676) (not e!123431))))

(assert (=> b!187542 (= res!88676 (= (getValueByKey!228 (toList!1213 lt!92809) (_1!1750 (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))))) (Some!233 (_2!1750 (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))))))))

(declare-fun b!187543 () Bool)

(declare-fun contains!1314 (List!2382 tuple2!3478) Bool)

(assert (=> b!187543 (= e!123431 (contains!1314 (toList!1213 lt!92809) (ite (or c!33657 c!33655) (tuple2!3479 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3663 thiss!1248)) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))))))

(assert (= (and d!55421 res!88677) b!187542))

(assert (= (and b!187542 res!88676) b!187543))

(declare-fun m!214327 () Bool)

(assert (=> d!55421 m!214327))

(declare-fun m!214329 () Bool)

(assert (=> d!55421 m!214329))

(declare-fun m!214331 () Bool)

(assert (=> d!55421 m!214331))

(declare-fun m!214333 () Bool)

(assert (=> d!55421 m!214333))

(declare-fun m!214335 () Bool)

(assert (=> b!187542 m!214335))

(declare-fun m!214337 () Bool)

(assert (=> b!187543 m!214337))

(assert (=> bm!18901 d!55421))

(declare-fun d!55423 () Bool)

(declare-fun get!2167 (Option!234) V!5491)

(assert (=> d!55423 (= (apply!171 (+!291 lt!92767 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248))) lt!92761) (get!2167 (getValueByKey!228 (toList!1213 (+!291 lt!92767 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248)))) lt!92761)))))

(declare-fun bs!7562 () Bool)

(assert (= bs!7562 d!55423))

(declare-fun m!214339 () Bool)

(assert (=> bs!7562 m!214339))

(assert (=> bs!7562 m!214339))

(declare-fun m!214341 () Bool)

(assert (=> bs!7562 m!214341))

(assert (=> b!187494 d!55423))

(declare-fun d!55425 () Bool)

(assert (=> d!55425 (= (apply!171 (+!291 lt!92760 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248))) lt!92763) (apply!171 lt!92760 lt!92763))))

(declare-fun lt!92812 () Unit!5646)

(declare-fun choose!998 (ListLongMap!2395 (_ BitVec 64) V!5491 (_ BitVec 64)) Unit!5646)

(assert (=> d!55425 (= lt!92812 (choose!998 lt!92760 lt!92759 (zeroValue!3663 thiss!1248) lt!92763))))

(declare-fun e!123434 () Bool)

(assert (=> d!55425 e!123434))

(declare-fun res!88680 () Bool)

(assert (=> d!55425 (=> (not res!88680) (not e!123434))))

(assert (=> d!55425 (= res!88680 (contains!1313 lt!92760 lt!92763))))

(assert (=> d!55425 (= (addApplyDifferent!147 lt!92760 lt!92759 (zeroValue!3663 thiss!1248) lt!92763) lt!92812)))

(declare-fun b!187547 () Bool)

(assert (=> b!187547 (= e!123434 (not (= lt!92763 lt!92759)))))

(assert (= (and d!55425 res!88680) b!187547))

(declare-fun m!214343 () Bool)

(assert (=> d!55425 m!214343))

(assert (=> d!55425 m!214257))

(assert (=> d!55425 m!214277))

(declare-fun m!214345 () Bool)

(assert (=> d!55425 m!214345))

(assert (=> d!55425 m!214257))

(assert (=> d!55425 m!214259))

(assert (=> b!187494 d!55425))

(declare-fun d!55427 () Bool)

(assert (=> d!55427 (= (apply!171 lt!92768 lt!92774) (get!2167 (getValueByKey!228 (toList!1213 lt!92768) lt!92774)))))

(declare-fun bs!7563 () Bool)

(assert (= bs!7563 d!55427))

(declare-fun m!214347 () Bool)

(assert (=> bs!7563 m!214347))

(assert (=> bs!7563 m!214347))

(declare-fun m!214349 () Bool)

(assert (=> bs!7563 m!214349))

(assert (=> b!187494 d!55427))

(declare-fun d!55429 () Bool)

(assert (=> d!55429 (= (apply!171 (+!291 lt!92760 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248))) lt!92763) (get!2167 (getValueByKey!228 (toList!1213 (+!291 lt!92760 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248)))) lt!92763)))))

(declare-fun bs!7564 () Bool)

(assert (= bs!7564 d!55429))

(declare-fun m!214351 () Bool)

(assert (=> bs!7564 m!214351))

(assert (=> bs!7564 m!214351))

(declare-fun m!214353 () Bool)

(assert (=> bs!7564 m!214353))

(assert (=> b!187494 d!55429))

(declare-fun d!55431 () Bool)

(declare-fun e!123435 () Bool)

(assert (=> d!55431 e!123435))

(declare-fun res!88682 () Bool)

(assert (=> d!55431 (=> (not res!88682) (not e!123435))))

(declare-fun lt!92816 () ListLongMap!2395)

(assert (=> d!55431 (= res!88682 (contains!1313 lt!92816 (_1!1750 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248)))))))

(declare-fun lt!92815 () List!2382)

(assert (=> d!55431 (= lt!92816 (ListLongMap!2396 lt!92815))))

(declare-fun lt!92813 () Unit!5646)

(declare-fun lt!92814 () Unit!5646)

(assert (=> d!55431 (= lt!92813 lt!92814)))

(assert (=> d!55431 (= (getValueByKey!228 lt!92815 (_1!1750 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248)))) (Some!233 (_2!1750 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248)))))))

(assert (=> d!55431 (= lt!92814 (lemmaContainsTupThenGetReturnValue!119 lt!92815 (_1!1750 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248))) (_2!1750 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248)))))))

(assert (=> d!55431 (= lt!92815 (insertStrictlySorted!122 (toList!1213 lt!92775) (_1!1750 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248))) (_2!1750 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248)))))))

(assert (=> d!55431 (= (+!291 lt!92775 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248))) lt!92816)))

(declare-fun b!187548 () Bool)

(declare-fun res!88681 () Bool)

(assert (=> b!187548 (=> (not res!88681) (not e!123435))))

(assert (=> b!187548 (= res!88681 (= (getValueByKey!228 (toList!1213 lt!92816) (_1!1750 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248)))) (Some!233 (_2!1750 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248))))))))

(declare-fun b!187549 () Bool)

(assert (=> b!187549 (= e!123435 (contains!1314 (toList!1213 lt!92816) (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248))))))

(assert (= (and d!55431 res!88682) b!187548))

(assert (= (and b!187548 res!88681) b!187549))

(declare-fun m!214355 () Bool)

(assert (=> d!55431 m!214355))

(declare-fun m!214357 () Bool)

(assert (=> d!55431 m!214357))

(declare-fun m!214359 () Bool)

(assert (=> d!55431 m!214359))

(declare-fun m!214361 () Bool)

(assert (=> d!55431 m!214361))

(declare-fun m!214363 () Bool)

(assert (=> b!187548 m!214363))

(declare-fun m!214365 () Bool)

(assert (=> b!187549 m!214365))

(assert (=> b!187494 d!55431))

(declare-fun d!55433 () Bool)

(declare-fun e!123437 () Bool)

(assert (=> d!55433 e!123437))

(declare-fun res!88683 () Bool)

(assert (=> d!55433 (=> res!88683 e!123437)))

(declare-fun lt!92818 () Bool)

(assert (=> d!55433 (= res!88683 (not lt!92818))))

(declare-fun lt!92820 () Bool)

(assert (=> d!55433 (= lt!92818 lt!92820)))

(declare-fun lt!92817 () Unit!5646)

(declare-fun e!123436 () Unit!5646)

(assert (=> d!55433 (= lt!92817 e!123436)))

(declare-fun c!33670 () Bool)

(assert (=> d!55433 (= c!33670 lt!92820)))

(assert (=> d!55433 (= lt!92820 (containsKey!232 (toList!1213 (+!291 lt!92775 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248)))) lt!92762))))

(assert (=> d!55433 (= (contains!1313 (+!291 lt!92775 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248))) lt!92762) lt!92818)))

(declare-fun b!187550 () Bool)

(declare-fun lt!92819 () Unit!5646)

(assert (=> b!187550 (= e!123436 lt!92819)))

(assert (=> b!187550 (= lt!92819 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1213 (+!291 lt!92775 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248)))) lt!92762))))

(assert (=> b!187550 (isDefined!181 (getValueByKey!228 (toList!1213 (+!291 lt!92775 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248)))) lt!92762))))

(declare-fun b!187551 () Bool)

(declare-fun Unit!5654 () Unit!5646)

(assert (=> b!187551 (= e!123436 Unit!5654)))

(declare-fun b!187552 () Bool)

(assert (=> b!187552 (= e!123437 (isDefined!181 (getValueByKey!228 (toList!1213 (+!291 lt!92775 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248)))) lt!92762)))))

(assert (= (and d!55433 c!33670) b!187550))

(assert (= (and d!55433 (not c!33670)) b!187551))

(assert (= (and d!55433 (not res!88683)) b!187552))

(declare-fun m!214367 () Bool)

(assert (=> d!55433 m!214367))

(declare-fun m!214369 () Bool)

(assert (=> b!187550 m!214369))

(declare-fun m!214371 () Bool)

(assert (=> b!187550 m!214371))

(assert (=> b!187550 m!214371))

(declare-fun m!214373 () Bool)

(assert (=> b!187550 m!214373))

(assert (=> b!187552 m!214371))

(assert (=> b!187552 m!214371))

(assert (=> b!187552 m!214373))

(assert (=> b!187494 d!55433))

(declare-fun d!55435 () Bool)

(declare-fun e!123454 () Bool)

(assert (=> d!55435 e!123454))

(declare-fun res!88692 () Bool)

(assert (=> d!55435 (=> (not res!88692) (not e!123454))))

(declare-fun lt!92839 () ListLongMap!2395)

(assert (=> d!55435 (= res!88692 (not (contains!1313 lt!92839 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!123456 () ListLongMap!2395)

(assert (=> d!55435 (= lt!92839 e!123456)))

(declare-fun c!33682 () Bool)

(assert (=> d!55435 (= c!33682 (bvsge #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(assert (=> d!55435 (validMask!0 (mask!8967 thiss!1248))))

(assert (=> d!55435 (= (getCurrentListMapNoExtraKeys!204 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)) lt!92839)))

(declare-fun b!187577 () Bool)

(declare-fun e!123458 () Bool)

(declare-fun e!123457 () Bool)

(assert (=> b!187577 (= e!123458 e!123457)))

(declare-fun c!33679 () Bool)

(assert (=> b!187577 (= c!33679 (bvslt #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun b!187578 () Bool)

(declare-fun e!123452 () Bool)

(assert (=> b!187578 (= e!123458 e!123452)))

(assert (=> b!187578 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun res!88695 () Bool)

(assert (=> b!187578 (= res!88695 (contains!1313 lt!92839 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187578 (=> (not res!88695) (not e!123452))))

(declare-fun b!187579 () Bool)

(declare-fun lt!92837 () Unit!5646)

(declare-fun lt!92835 () Unit!5646)

(assert (=> b!187579 (= lt!92837 lt!92835)))

(declare-fun lt!92838 () ListLongMap!2395)

(declare-fun lt!92841 () (_ BitVec 64))

(declare-fun lt!92836 () V!5491)

(declare-fun lt!92840 () (_ BitVec 64))

(assert (=> b!187579 (not (contains!1313 (+!291 lt!92838 (tuple2!3479 lt!92841 lt!92836)) lt!92840))))

(declare-fun addStillNotContains!91 (ListLongMap!2395 (_ BitVec 64) V!5491 (_ BitVec 64)) Unit!5646)

(assert (=> b!187579 (= lt!92835 (addStillNotContains!91 lt!92838 lt!92841 lt!92836 lt!92840))))

(assert (=> b!187579 (= lt!92840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!187579 (= lt!92836 (get!2166 (select (arr!3768 (_values!3805 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3822 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187579 (= lt!92841 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18913 () ListLongMap!2395)

(assert (=> b!187579 (= lt!92838 call!18913)))

(declare-fun e!123453 () ListLongMap!2395)

(assert (=> b!187579 (= e!123453 (+!291 call!18913 (tuple2!3479 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000) (get!2166 (select (arr!3768 (_values!3805 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3822 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!187580 () Bool)

(assert (=> b!187580 (= e!123456 e!123453)))

(declare-fun c!33681 () Bool)

(assert (=> b!187580 (= c!33681 (validKeyInArray!0 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187581 () Bool)

(assert (=> b!187581 (= e!123454 e!123458)))

(declare-fun c!33680 () Bool)

(declare-fun e!123455 () Bool)

(assert (=> b!187581 (= c!33680 e!123455)))

(declare-fun res!88694 () Bool)

(assert (=> b!187581 (=> (not res!88694) (not e!123455))))

(assert (=> b!187581 (= res!88694 (bvslt #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun bm!18910 () Bool)

(assert (=> bm!18910 (= call!18913 (getCurrentListMapNoExtraKeys!204 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3822 thiss!1248)))))

(declare-fun b!187582 () Bool)

(assert (=> b!187582 (= e!123455 (validKeyInArray!0 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187582 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!187583 () Bool)

(assert (=> b!187583 (= e!123453 call!18913)))

(declare-fun b!187584 () Bool)

(declare-fun isEmpty!475 (ListLongMap!2395) Bool)

(assert (=> b!187584 (= e!123457 (isEmpty!475 lt!92839))))

(declare-fun b!187585 () Bool)

(declare-fun res!88693 () Bool)

(assert (=> b!187585 (=> (not res!88693) (not e!123454))))

(assert (=> b!187585 (= res!88693 (not (contains!1313 lt!92839 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!187586 () Bool)

(assert (=> b!187586 (= e!123456 (ListLongMap!2396 Nil!2379))))

(declare-fun b!187587 () Bool)

(assert (=> b!187587 (= e!123457 (= lt!92839 (getCurrentListMapNoExtraKeys!204 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3822 thiss!1248))))))

(declare-fun b!187588 () Bool)

(assert (=> b!187588 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(assert (=> b!187588 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4086 (_values!3805 thiss!1248))))))

(assert (=> b!187588 (= e!123452 (= (apply!171 lt!92839 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)) (get!2166 (select (arr!3768 (_values!3805 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3822 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!55435 c!33682) b!187586))

(assert (= (and d!55435 (not c!33682)) b!187580))

(assert (= (and b!187580 c!33681) b!187579))

(assert (= (and b!187580 (not c!33681)) b!187583))

(assert (= (or b!187579 b!187583) bm!18910))

(assert (= (and d!55435 res!88692) b!187585))

(assert (= (and b!187585 res!88693) b!187581))

(assert (= (and b!187581 res!88694) b!187582))

(assert (= (and b!187581 c!33680) b!187578))

(assert (= (and b!187581 (not c!33680)) b!187577))

(assert (= (and b!187578 res!88695) b!187588))

(assert (= (and b!187577 c!33679) b!187587))

(assert (= (and b!187577 (not c!33679)) b!187584))

(declare-fun b_lambda!7291 () Bool)

(assert (=> (not b_lambda!7291) (not b!187579)))

(assert (=> b!187579 t!7276))

(declare-fun b_and!11235 () Bool)

(assert (= b_and!11233 (and (=> t!7276 result!4837) b_and!11235)))

(declare-fun b_lambda!7293 () Bool)

(assert (=> (not b_lambda!7293) (not b!187588)))

(assert (=> b!187588 t!7276))

(declare-fun b_and!11237 () Bool)

(assert (= b_and!11235 (and (=> t!7276 result!4837) b_and!11237)))

(assert (=> b!187582 m!214249))

(assert (=> b!187582 m!214249))

(assert (=> b!187582 m!214251))

(declare-fun m!214375 () Bool)

(assert (=> d!55435 m!214375))

(assert (=> d!55435 m!214169))

(declare-fun m!214377 () Bool)

(assert (=> b!187587 m!214377))

(declare-fun m!214379 () Bool)

(assert (=> b!187579 m!214379))

(assert (=> b!187579 m!214249))

(declare-fun m!214381 () Bool)

(assert (=> b!187579 m!214381))

(declare-fun m!214383 () Bool)

(assert (=> b!187579 m!214383))

(assert (=> b!187579 m!214287))

(assert (=> b!187579 m!214289))

(assert (=> b!187579 m!214291))

(assert (=> b!187579 m!214287))

(assert (=> b!187579 m!214289))

(assert (=> b!187579 m!214379))

(declare-fun m!214385 () Bool)

(assert (=> b!187579 m!214385))

(assert (=> bm!18910 m!214377))

(declare-fun m!214387 () Bool)

(assert (=> b!187585 m!214387))

(declare-fun m!214389 () Bool)

(assert (=> b!187584 m!214389))

(assert (=> b!187588 m!214249))

(declare-fun m!214391 () Bool)

(assert (=> b!187588 m!214391))

(assert (=> b!187588 m!214249))

(assert (=> b!187588 m!214289))

(assert (=> b!187588 m!214287))

(assert (=> b!187588 m!214289))

(assert (=> b!187588 m!214291))

(assert (=> b!187588 m!214287))

(assert (=> b!187580 m!214249))

(assert (=> b!187580 m!214249))

(assert (=> b!187580 m!214251))

(assert (=> b!187578 m!214249))

(assert (=> b!187578 m!214249))

(declare-fun m!214393 () Bool)

(assert (=> b!187578 m!214393))

(assert (=> b!187494 d!55435))

(declare-fun d!55437 () Bool)

(assert (=> d!55437 (= (apply!171 lt!92760 lt!92763) (get!2167 (getValueByKey!228 (toList!1213 lt!92760) lt!92763)))))

(declare-fun bs!7565 () Bool)

(assert (= bs!7565 d!55437))

(declare-fun m!214395 () Bool)

(assert (=> bs!7565 m!214395))

(assert (=> bs!7565 m!214395))

(declare-fun m!214397 () Bool)

(assert (=> bs!7565 m!214397))

(assert (=> b!187494 d!55437))

(declare-fun d!55439 () Bool)

(assert (=> d!55439 (= (apply!171 (+!291 lt!92768 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248))) lt!92774) (get!2167 (getValueByKey!228 (toList!1213 (+!291 lt!92768 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248)))) lt!92774)))))

(declare-fun bs!7566 () Bool)

(assert (= bs!7566 d!55439))

(declare-fun m!214399 () Bool)

(assert (=> bs!7566 m!214399))

(assert (=> bs!7566 m!214399))

(declare-fun m!214401 () Bool)

(assert (=> bs!7566 m!214401))

(assert (=> b!187494 d!55439))

(declare-fun d!55441 () Bool)

(assert (=> d!55441 (= (apply!171 (+!291 lt!92767 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248))) lt!92761) (apply!171 lt!92767 lt!92761))))

(declare-fun lt!92842 () Unit!5646)

(assert (=> d!55441 (= lt!92842 (choose!998 lt!92767 lt!92778 (minValue!3663 thiss!1248) lt!92761))))

(declare-fun e!123459 () Bool)

(assert (=> d!55441 e!123459))

(declare-fun res!88696 () Bool)

(assert (=> d!55441 (=> (not res!88696) (not e!123459))))

(assert (=> d!55441 (= res!88696 (contains!1313 lt!92767 lt!92761))))

(assert (=> d!55441 (= (addApplyDifferent!147 lt!92767 lt!92778 (minValue!3663 thiss!1248) lt!92761) lt!92842)))

(declare-fun b!187589 () Bool)

(assert (=> b!187589 (= e!123459 (not (= lt!92761 lt!92778)))))

(assert (= (and d!55441 res!88696) b!187589))

(declare-fun m!214403 () Bool)

(assert (=> d!55441 m!214403))

(assert (=> d!55441 m!214253))

(assert (=> d!55441 m!214279))

(declare-fun m!214405 () Bool)

(assert (=> d!55441 m!214405))

(assert (=> d!55441 m!214253))

(assert (=> d!55441 m!214255))

(assert (=> b!187494 d!55441))

(declare-fun d!55443 () Bool)

(assert (=> d!55443 (= (apply!171 (+!291 lt!92768 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248))) lt!92774) (apply!171 lt!92768 lt!92774))))

(declare-fun lt!92843 () Unit!5646)

(assert (=> d!55443 (= lt!92843 (choose!998 lt!92768 lt!92779 (minValue!3663 thiss!1248) lt!92774))))

(declare-fun e!123460 () Bool)

(assert (=> d!55443 e!123460))

(declare-fun res!88697 () Bool)

(assert (=> d!55443 (=> (not res!88697) (not e!123460))))

(assert (=> d!55443 (= res!88697 (contains!1313 lt!92768 lt!92774))))

(assert (=> d!55443 (= (addApplyDifferent!147 lt!92768 lt!92779 (minValue!3663 thiss!1248) lt!92774) lt!92843)))

(declare-fun b!187590 () Bool)

(assert (=> b!187590 (= e!123460 (not (= lt!92774 lt!92779)))))

(assert (= (and d!55443 res!88697) b!187590))

(declare-fun m!214407 () Bool)

(assert (=> d!55443 m!214407))

(assert (=> d!55443 m!214263))

(assert (=> d!55443 m!214283))

(declare-fun m!214409 () Bool)

(assert (=> d!55443 m!214409))

(assert (=> d!55443 m!214263))

(assert (=> d!55443 m!214273))

(assert (=> b!187494 d!55443))

(declare-fun d!55445 () Bool)

(declare-fun e!123461 () Bool)

(assert (=> d!55445 e!123461))

(declare-fun res!88699 () Bool)

(assert (=> d!55445 (=> (not res!88699) (not e!123461))))

(declare-fun lt!92847 () ListLongMap!2395)

(assert (=> d!55445 (= res!88699 (contains!1313 lt!92847 (_1!1750 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248)))))))

(declare-fun lt!92846 () List!2382)

(assert (=> d!55445 (= lt!92847 (ListLongMap!2396 lt!92846))))

(declare-fun lt!92844 () Unit!5646)

(declare-fun lt!92845 () Unit!5646)

(assert (=> d!55445 (= lt!92844 lt!92845)))

(assert (=> d!55445 (= (getValueByKey!228 lt!92846 (_1!1750 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248)))) (Some!233 (_2!1750 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248)))))))

(assert (=> d!55445 (= lt!92845 (lemmaContainsTupThenGetReturnValue!119 lt!92846 (_1!1750 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248))) (_2!1750 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248)))))))

(assert (=> d!55445 (= lt!92846 (insertStrictlySorted!122 (toList!1213 lt!92768) (_1!1750 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248))) (_2!1750 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248)))))))

(assert (=> d!55445 (= (+!291 lt!92768 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248))) lt!92847)))

(declare-fun b!187591 () Bool)

(declare-fun res!88698 () Bool)

(assert (=> b!187591 (=> (not res!88698) (not e!123461))))

(assert (=> b!187591 (= res!88698 (= (getValueByKey!228 (toList!1213 lt!92847) (_1!1750 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248)))) (Some!233 (_2!1750 (tuple2!3479 lt!92779 (minValue!3663 thiss!1248))))))))

(declare-fun b!187592 () Bool)

(assert (=> b!187592 (= e!123461 (contains!1314 (toList!1213 lt!92847) (tuple2!3479 lt!92779 (minValue!3663 thiss!1248))))))

(assert (= (and d!55445 res!88699) b!187591))

(assert (= (and b!187591 res!88698) b!187592))

(declare-fun m!214411 () Bool)

(assert (=> d!55445 m!214411))

(declare-fun m!214413 () Bool)

(assert (=> d!55445 m!214413))

(declare-fun m!214415 () Bool)

(assert (=> d!55445 m!214415))

(declare-fun m!214417 () Bool)

(assert (=> d!55445 m!214417))

(declare-fun m!214419 () Bool)

(assert (=> b!187591 m!214419))

(declare-fun m!214421 () Bool)

(assert (=> b!187592 m!214421))

(assert (=> b!187494 d!55445))

(declare-fun d!55447 () Bool)

(declare-fun e!123462 () Bool)

(assert (=> d!55447 e!123462))

(declare-fun res!88701 () Bool)

(assert (=> d!55447 (=> (not res!88701) (not e!123462))))

(declare-fun lt!92851 () ListLongMap!2395)

(assert (=> d!55447 (= res!88701 (contains!1313 lt!92851 (_1!1750 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248)))))))

(declare-fun lt!92850 () List!2382)

(assert (=> d!55447 (= lt!92851 (ListLongMap!2396 lt!92850))))

(declare-fun lt!92848 () Unit!5646)

(declare-fun lt!92849 () Unit!5646)

(assert (=> d!55447 (= lt!92848 lt!92849)))

(assert (=> d!55447 (= (getValueByKey!228 lt!92850 (_1!1750 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248)))) (Some!233 (_2!1750 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248)))))))

(assert (=> d!55447 (= lt!92849 (lemmaContainsTupThenGetReturnValue!119 lt!92850 (_1!1750 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248))) (_2!1750 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248)))))))

(assert (=> d!55447 (= lt!92850 (insertStrictlySorted!122 (toList!1213 lt!92760) (_1!1750 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248))) (_2!1750 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248)))))))

(assert (=> d!55447 (= (+!291 lt!92760 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248))) lt!92851)))

(declare-fun b!187593 () Bool)

(declare-fun res!88700 () Bool)

(assert (=> b!187593 (=> (not res!88700) (not e!123462))))

(assert (=> b!187593 (= res!88700 (= (getValueByKey!228 (toList!1213 lt!92851) (_1!1750 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248)))) (Some!233 (_2!1750 (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248))))))))

(declare-fun b!187594 () Bool)

(assert (=> b!187594 (= e!123462 (contains!1314 (toList!1213 lt!92851) (tuple2!3479 lt!92759 (zeroValue!3663 thiss!1248))))))

(assert (= (and d!55447 res!88701) b!187593))

(assert (= (and b!187593 res!88700) b!187594))

(declare-fun m!214423 () Bool)

(assert (=> d!55447 m!214423))

(declare-fun m!214425 () Bool)

(assert (=> d!55447 m!214425))

(declare-fun m!214427 () Bool)

(assert (=> d!55447 m!214427))

(declare-fun m!214429 () Bool)

(assert (=> d!55447 m!214429))

(declare-fun m!214431 () Bool)

(assert (=> b!187593 m!214431))

(declare-fun m!214433 () Bool)

(assert (=> b!187594 m!214433))

(assert (=> b!187494 d!55447))

(declare-fun d!55449 () Bool)

(declare-fun e!123463 () Bool)

(assert (=> d!55449 e!123463))

(declare-fun res!88703 () Bool)

(assert (=> d!55449 (=> (not res!88703) (not e!123463))))

(declare-fun lt!92855 () ListLongMap!2395)

(assert (=> d!55449 (= res!88703 (contains!1313 lt!92855 (_1!1750 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248)))))))

(declare-fun lt!92854 () List!2382)

(assert (=> d!55449 (= lt!92855 (ListLongMap!2396 lt!92854))))

(declare-fun lt!92852 () Unit!5646)

(declare-fun lt!92853 () Unit!5646)

(assert (=> d!55449 (= lt!92852 lt!92853)))

(assert (=> d!55449 (= (getValueByKey!228 lt!92854 (_1!1750 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248)))) (Some!233 (_2!1750 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248)))))))

(assert (=> d!55449 (= lt!92853 (lemmaContainsTupThenGetReturnValue!119 lt!92854 (_1!1750 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248))) (_2!1750 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248)))))))

(assert (=> d!55449 (= lt!92854 (insertStrictlySorted!122 (toList!1213 lt!92767) (_1!1750 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248))) (_2!1750 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248)))))))

(assert (=> d!55449 (= (+!291 lt!92767 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248))) lt!92855)))

(declare-fun b!187595 () Bool)

(declare-fun res!88702 () Bool)

(assert (=> b!187595 (=> (not res!88702) (not e!123463))))

(assert (=> b!187595 (= res!88702 (= (getValueByKey!228 (toList!1213 lt!92855) (_1!1750 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248)))) (Some!233 (_2!1750 (tuple2!3479 lt!92778 (minValue!3663 thiss!1248))))))))

(declare-fun b!187596 () Bool)

(assert (=> b!187596 (= e!123463 (contains!1314 (toList!1213 lt!92855) (tuple2!3479 lt!92778 (minValue!3663 thiss!1248))))))

(assert (= (and d!55449 res!88703) b!187595))

(assert (= (and b!187595 res!88702) b!187596))

(declare-fun m!214435 () Bool)

(assert (=> d!55449 m!214435))

(declare-fun m!214437 () Bool)

(assert (=> d!55449 m!214437))

(declare-fun m!214439 () Bool)

(assert (=> d!55449 m!214439))

(declare-fun m!214441 () Bool)

(assert (=> d!55449 m!214441))

(declare-fun m!214443 () Bool)

(assert (=> b!187595 m!214443))

(declare-fun m!214445 () Bool)

(assert (=> b!187596 m!214445))

(assert (=> b!187494 d!55449))

(declare-fun d!55451 () Bool)

(assert (=> d!55451 (= (apply!171 lt!92767 lt!92761) (get!2167 (getValueByKey!228 (toList!1213 lt!92767) lt!92761)))))

(declare-fun bs!7567 () Bool)

(assert (= bs!7567 d!55451))

(declare-fun m!214447 () Bool)

(assert (=> bs!7567 m!214447))

(assert (=> bs!7567 m!214447))

(declare-fun m!214449 () Bool)

(assert (=> bs!7567 m!214449))

(assert (=> b!187494 d!55451))

(declare-fun d!55453 () Bool)

(assert (=> d!55453 (contains!1313 (+!291 lt!92775 (tuple2!3479 lt!92776 (zeroValue!3663 thiss!1248))) lt!92762)))

(declare-fun lt!92858 () Unit!5646)

(declare-fun choose!999 (ListLongMap!2395 (_ BitVec 64) V!5491 (_ BitVec 64)) Unit!5646)

(assert (=> d!55453 (= lt!92858 (choose!999 lt!92775 lt!92776 (zeroValue!3663 thiss!1248) lt!92762))))

(assert (=> d!55453 (contains!1313 lt!92775 lt!92762)))

(assert (=> d!55453 (= (addStillContains!147 lt!92775 lt!92776 (zeroValue!3663 thiss!1248) lt!92762) lt!92858)))

(declare-fun bs!7568 () Bool)

(assert (= bs!7568 d!55453))

(assert (=> bs!7568 m!214269))

(assert (=> bs!7568 m!214269))

(assert (=> bs!7568 m!214271))

(declare-fun m!214451 () Bool)

(assert (=> bs!7568 m!214451))

(declare-fun m!214453 () Bool)

(assert (=> bs!7568 m!214453))

(assert (=> b!187494 d!55453))

(declare-fun d!55455 () Bool)

(assert (=> d!55455 (= (apply!171 lt!92764 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)) (get!2167 (getValueByKey!228 (toList!1213 lt!92764) (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7569 () Bool)

(assert (= bs!7569 d!55455))

(assert (=> bs!7569 m!214249))

(declare-fun m!214455 () Bool)

(assert (=> bs!7569 m!214455))

(assert (=> bs!7569 m!214455))

(declare-fun m!214457 () Bool)

(assert (=> bs!7569 m!214457))

(assert (=> b!187495 d!55455))

(declare-fun d!55457 () Bool)

(declare-fun c!33685 () Bool)

(assert (=> d!55457 (= c!33685 ((_ is ValueCellFull!1848) (select (arr!3768 (_values!3805 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!123466 () V!5491)

(assert (=> d!55457 (= (get!2166 (select (arr!3768 (_values!3805 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3822 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!123466)))

(declare-fun b!187602 () Bool)

(declare-fun get!2168 (ValueCell!1848 V!5491) V!5491)

(assert (=> b!187602 (= e!123466 (get!2168 (select (arr!3768 (_values!3805 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3822 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!187603 () Bool)

(declare-fun get!2169 (ValueCell!1848 V!5491) V!5491)

(assert (=> b!187603 (= e!123466 (get!2169 (select (arr!3768 (_values!3805 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3822 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55457 c!33685) b!187602))

(assert (= (and d!55457 (not c!33685)) b!187603))

(assert (=> b!187602 m!214287))

(assert (=> b!187602 m!214289))

(declare-fun m!214459 () Bool)

(assert (=> b!187602 m!214459))

(assert (=> b!187603 m!214287))

(assert (=> b!187603 m!214289))

(declare-fun m!214461 () Bool)

(assert (=> b!187603 m!214461))

(assert (=> b!187495 d!55457))

(declare-fun d!55459 () Bool)

(assert (=> d!55459 (= (validKeyInArray!0 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187491 d!55459))

(assert (=> d!55399 d!55413))

(declare-fun d!55461 () Bool)

(declare-fun e!123477 () Bool)

(assert (=> d!55461 e!123477))

(declare-fun c!33690 () Bool)

(declare-fun lt!92861 () SeekEntryResult!647)

(assert (=> d!55461 (= c!33690 ((_ is MissingZero!647) lt!92861))))

(assert (=> d!55461 (= lt!92861 (seekEntryOrOpen!0 key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)))))

(assert (=> d!55461 true))

(declare-fun _$34!1069 () Unit!5646)

(assert (=> d!55461 (= (choose!996 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) key!828 (defaultEntry!3822 thiss!1248)) _$34!1069)))

(declare-fun b!187620 () Bool)

(declare-fun e!123478 () Bool)

(assert (=> b!187620 (= e!123477 e!123478)))

(declare-fun res!88713 () Bool)

(declare-fun call!18919 () Bool)

(assert (=> b!187620 (= res!88713 call!18919)))

(assert (=> b!187620 (=> (not res!88713) (not e!123478))))

(declare-fun b!187621 () Bool)

(declare-fun e!123476 () Bool)

(assert (=> b!187621 (= e!123476 ((_ is Undefined!647) lt!92861))))

(declare-fun b!187622 () Bool)

(declare-fun res!88714 () Bool)

(declare-fun e!123475 () Bool)

(assert (=> b!187622 (=> (not res!88714) (not e!123475))))

(assert (=> b!187622 (= res!88714 call!18919)))

(assert (=> b!187622 (= e!123476 e!123475)))

(declare-fun b!187623 () Bool)

(assert (=> b!187623 (= e!123477 e!123476)))

(declare-fun c!33691 () Bool)

(assert (=> b!187623 (= c!33691 ((_ is MissingVacant!647) lt!92861))))

(declare-fun bm!18915 () Bool)

(assert (=> bm!18915 (= call!18919 (inRange!0 (ite c!33690 (index!4758 lt!92861) (index!4761 lt!92861)) (mask!8967 thiss!1248)))))

(declare-fun b!187624 () Bool)

(declare-fun res!88715 () Bool)

(assert (=> b!187624 (=> (not res!88715) (not e!123475))))

(assert (=> b!187624 (= res!88715 (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4761 lt!92861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18916 () Bool)

(declare-fun call!18918 () Bool)

(assert (=> bm!18916 (= call!18918 (arrayContainsKey!0 (_keys!5773 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!187625 () Bool)

(assert (=> b!187625 (= e!123478 (not call!18918))))

(declare-fun b!187626 () Bool)

(assert (=> b!187626 (= e!123475 (not call!18918))))

(declare-fun b!187627 () Bool)

(declare-fun res!88712 () Bool)

(assert (=> b!187627 (= res!88712 (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4758 lt!92861)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187627 (=> (not res!88712) (not e!123478))))

(assert (= (and d!55461 c!33690) b!187620))

(assert (= (and d!55461 (not c!33690)) b!187623))

(assert (= (and b!187620 res!88713) b!187627))

(assert (= (and b!187627 res!88712) b!187625))

(assert (= (and b!187623 c!33691) b!187622))

(assert (= (and b!187623 (not c!33691)) b!187621))

(assert (= (and b!187622 res!88714) b!187624))

(assert (= (and b!187624 res!88715) b!187626))

(assert (= (or b!187620 b!187622) bm!18915))

(assert (= (or b!187625 b!187626) bm!18916))

(declare-fun m!214463 () Bool)

(assert (=> bm!18915 m!214463))

(declare-fun m!214465 () Bool)

(assert (=> b!187624 m!214465))

(assert (=> bm!18916 m!214217))

(declare-fun m!214467 () Bool)

(assert (=> b!187627 m!214467))

(assert (=> d!55461 m!214183))

(assert (=> d!55399 d!55461))

(assert (=> d!55399 d!55407))

(declare-fun d!55463 () Bool)

(assert (=> d!55463 (isDefined!181 (getValueByKey!228 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828))))

(declare-fun lt!92864 () Unit!5646)

(declare-fun choose!1000 (List!2382 (_ BitVec 64)) Unit!5646)

(assert (=> d!55463 (= lt!92864 (choose!1000 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828))))

(declare-fun e!123481 () Bool)

(assert (=> d!55463 e!123481))

(declare-fun res!88718 () Bool)

(assert (=> d!55463 (=> (not res!88718) (not e!123481))))

(declare-fun isStrictlySorted!351 (List!2382) Bool)

(assert (=> d!55463 (= res!88718 (isStrictlySorted!351 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))))))

(assert (=> d!55463 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828) lt!92864)))

(declare-fun b!187630 () Bool)

(assert (=> b!187630 (= e!123481 (containsKey!232 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828))))

(assert (= (and d!55463 res!88718) b!187630))

(assert (=> d!55463 m!214239))

(assert (=> d!55463 m!214239))

(assert (=> d!55463 m!214241))

(declare-fun m!214469 () Bool)

(assert (=> d!55463 m!214469))

(declare-fun m!214471 () Bool)

(assert (=> d!55463 m!214471))

(assert (=> b!187630 m!214235))

(assert (=> b!187432 d!55463))

(declare-fun d!55465 () Bool)

(declare-fun isEmpty!476 (Option!234) Bool)

(assert (=> d!55465 (= (isDefined!181 (getValueByKey!228 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828)) (not (isEmpty!476 (getValueByKey!228 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828))))))

(declare-fun bs!7570 () Bool)

(assert (= bs!7570 d!55465))

(assert (=> bs!7570 m!214239))

(declare-fun m!214473 () Bool)

(assert (=> bs!7570 m!214473))

(assert (=> b!187432 d!55465))

(declare-fun b!187642 () Bool)

(declare-fun e!123487 () Option!234)

(assert (=> b!187642 (= e!123487 None!232)))

(declare-fun b!187639 () Bool)

(declare-fun e!123486 () Option!234)

(assert (=> b!187639 (= e!123486 (Some!233 (_2!1750 (h!3013 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))))))))

(declare-fun b!187640 () Bool)

(assert (=> b!187640 (= e!123486 e!123487)))

(declare-fun c!33697 () Bool)

(assert (=> b!187640 (= c!33697 (and ((_ is Cons!2378) (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))) (not (= (_1!1750 (h!3013 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))))) key!828))))))

(declare-fun d!55467 () Bool)

(declare-fun c!33696 () Bool)

(assert (=> d!55467 (= c!33696 (and ((_ is Cons!2378) (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))) (= (_1!1750 (h!3013 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))))) key!828)))))

(assert (=> d!55467 (= (getValueByKey!228 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828) e!123486)))

(declare-fun b!187641 () Bool)

(assert (=> b!187641 (= e!123487 (getValueByKey!228 (t!7274 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))) key!828))))

(assert (= (and d!55467 c!33696) b!187639))

(assert (= (and d!55467 (not c!33696)) b!187640))

(assert (= (and b!187640 c!33697) b!187641))

(assert (= (and b!187640 (not c!33697)) b!187642))

(declare-fun m!214475 () Bool)

(assert (=> b!187641 m!214475))

(assert (=> b!187432 d!55467))

(declare-fun b!187655 () Bool)

(declare-fun e!123494 () SeekEntryResult!647)

(assert (=> b!187655 (= e!123494 (Found!647 (index!4760 lt!92787)))))

(declare-fun b!187656 () Bool)

(declare-fun c!33706 () Bool)

(declare-fun lt!92870 () (_ BitVec 64))

(assert (=> b!187656 (= c!33706 (= lt!92870 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123496 () SeekEntryResult!647)

(assert (=> b!187656 (= e!123494 e!123496)))

(declare-fun b!187657 () Bool)

(declare-fun e!123495 () SeekEntryResult!647)

(assert (=> b!187657 (= e!123495 Undefined!647)))

(declare-fun b!187658 () Bool)

(assert (=> b!187658 (= e!123496 (MissingVacant!647 (index!4760 lt!92787)))))

(declare-fun b!187659 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187659 (= e!123496 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20281 lt!92787) #b00000000000000000000000000000001) (nextIndex!0 (index!4760 lt!92787) (x!20281 lt!92787) (mask!8967 thiss!1248)) (index!4760 lt!92787) key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)))))

(declare-fun b!187660 () Bool)

(assert (=> b!187660 (= e!123495 e!123494)))

(declare-fun c!33705 () Bool)

(assert (=> b!187660 (= c!33705 (= lt!92870 key!828))))

(declare-fun lt!92869 () SeekEntryResult!647)

(declare-fun d!55469 () Bool)

(assert (=> d!55469 (and (or ((_ is Undefined!647) lt!92869) (not ((_ is Found!647) lt!92869)) (and (bvsge (index!4759 lt!92869) #b00000000000000000000000000000000) (bvslt (index!4759 lt!92869) (size!4085 (_keys!5773 thiss!1248))))) (or ((_ is Undefined!647) lt!92869) ((_ is Found!647) lt!92869) (not ((_ is MissingVacant!647) lt!92869)) (not (= (index!4761 lt!92869) (index!4760 lt!92787))) (and (bvsge (index!4761 lt!92869) #b00000000000000000000000000000000) (bvslt (index!4761 lt!92869) (size!4085 (_keys!5773 thiss!1248))))) (or ((_ is Undefined!647) lt!92869) (ite ((_ is Found!647) lt!92869) (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4759 lt!92869)) key!828) (and ((_ is MissingVacant!647) lt!92869) (= (index!4761 lt!92869) (index!4760 lt!92787)) (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4761 lt!92869)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55469 (= lt!92869 e!123495)))

(declare-fun c!33704 () Bool)

(assert (=> d!55469 (= c!33704 (bvsge (x!20281 lt!92787) #b01111111111111111111111111111110))))

(assert (=> d!55469 (= lt!92870 (select (arr!3767 (_keys!5773 thiss!1248)) (index!4760 lt!92787)))))

(assert (=> d!55469 (validMask!0 (mask!8967 thiss!1248))))

(assert (=> d!55469 (= (seekKeyOrZeroReturnVacant!0 (x!20281 lt!92787) (index!4760 lt!92787) (index!4760 lt!92787) key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)) lt!92869)))

(assert (= (and d!55469 c!33704) b!187657))

(assert (= (and d!55469 (not c!33704)) b!187660))

(assert (= (and b!187660 c!33705) b!187655))

(assert (= (and b!187660 (not c!33705)) b!187656))

(assert (= (and b!187656 c!33706) b!187658))

(assert (= (and b!187656 (not c!33706)) b!187659))

(declare-fun m!214477 () Bool)

(assert (=> b!187659 m!214477))

(assert (=> b!187659 m!214477))

(declare-fun m!214479 () Bool)

(assert (=> b!187659 m!214479))

(declare-fun m!214481 () Bool)

(assert (=> d!55469 m!214481))

(declare-fun m!214483 () Bool)

(assert (=> d!55469 m!214483))

(assert (=> d!55469 m!214311))

(assert (=> d!55469 m!214169))

(assert (=> b!187517 d!55469))

(declare-fun b!187671 () Bool)

(declare-fun res!88729 () Bool)

(declare-fun e!123499 () Bool)

(assert (=> b!187671 (=> (not res!88729) (not e!123499))))

(declare-fun size!4089 (LongMapFixedSize!2604) (_ BitVec 32))

(assert (=> b!187671 (= res!88729 (= (size!4089 thiss!1248) (bvadd (_size!1351 thiss!1248) (bvsdiv (bvadd (extraKeys!3559 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!187672 () Bool)

(assert (=> b!187672 (= e!123499 (and (bvsge (extraKeys!3559 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3559 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1351 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!55471 () Bool)

(declare-fun res!88730 () Bool)

(assert (=> d!55471 (=> (not res!88730) (not e!123499))))

(assert (=> d!55471 (= res!88730 (validMask!0 (mask!8967 thiss!1248)))))

(assert (=> d!55471 (= (simpleValid!187 thiss!1248) e!123499)))

(declare-fun b!187669 () Bool)

(declare-fun res!88727 () Bool)

(assert (=> b!187669 (=> (not res!88727) (not e!123499))))

(assert (=> b!187669 (= res!88727 (and (= (size!4086 (_values!3805 thiss!1248)) (bvadd (mask!8967 thiss!1248) #b00000000000000000000000000000001)) (= (size!4085 (_keys!5773 thiss!1248)) (size!4086 (_values!3805 thiss!1248))) (bvsge (_size!1351 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1351 thiss!1248) (bvadd (mask!8967 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!187670 () Bool)

(declare-fun res!88728 () Bool)

(assert (=> b!187670 (=> (not res!88728) (not e!123499))))

(assert (=> b!187670 (= res!88728 (bvsge (size!4089 thiss!1248) (_size!1351 thiss!1248)))))

(assert (= (and d!55471 res!88730) b!187669))

(assert (= (and b!187669 res!88727) b!187670))

(assert (= (and b!187670 res!88728) b!187671))

(assert (= (and b!187671 res!88729) b!187672))

(declare-fun m!214485 () Bool)

(assert (=> b!187671 m!214485))

(assert (=> d!55471 m!214169))

(assert (=> b!187670 m!214485))

(assert (=> d!55401 d!55471))

(declare-fun d!55473 () Bool)

(assert (=> d!55473 (= (apply!171 lt!92764 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2167 (getValueByKey!228 (toList!1213 lt!92764) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7571 () Bool)

(assert (= bs!7571 d!55473))

(declare-fun m!214487 () Bool)

(assert (=> bs!7571 m!214487))

(assert (=> bs!7571 m!214487))

(declare-fun m!214489 () Bool)

(assert (=> bs!7571 m!214489))

(assert (=> b!187481 d!55473))

(declare-fun b!187681 () Bool)

(declare-fun e!123504 () (_ BitVec 32))

(declare-fun call!18922 () (_ BitVec 32))

(assert (=> b!187681 (= e!123504 (bvadd #b00000000000000000000000000000001 call!18922))))

(declare-fun b!187682 () Bool)

(declare-fun e!123505 () (_ BitVec 32))

(assert (=> b!187682 (= e!123505 #b00000000000000000000000000000000)))

(declare-fun d!55475 () Bool)

(declare-fun lt!92873 () (_ BitVec 32))

(assert (=> d!55475 (and (bvsge lt!92873 #b00000000000000000000000000000000) (bvsle lt!92873 (bvsub (size!4085 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55475 (= lt!92873 e!123505)))

(declare-fun c!33712 () Bool)

(assert (=> d!55475 (= c!33712 (bvsge #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(assert (=> d!55475 (and (bvsle #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4085 (_keys!5773 thiss!1248)) (size!4085 (_keys!5773 thiss!1248))))))

(assert (=> d!55475 (= (arrayCountValidKeys!0 (_keys!5773 thiss!1248) #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))) lt!92873)))

(declare-fun bm!18919 () Bool)

(assert (=> bm!18919 (= call!18922 (arrayCountValidKeys!0 (_keys!5773 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun b!187683 () Bool)

(assert (=> b!187683 (= e!123505 e!123504)))

(declare-fun c!33711 () Bool)

(assert (=> b!187683 (= c!33711 (validKeyInArray!0 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187684 () Bool)

(assert (=> b!187684 (= e!123504 call!18922)))

(assert (= (and d!55475 c!33712) b!187682))

(assert (= (and d!55475 (not c!33712)) b!187683))

(assert (= (and b!187683 c!33711) b!187681))

(assert (= (and b!187683 (not c!33711)) b!187684))

(assert (= (or b!187681 b!187684) bm!18919))

(declare-fun m!214491 () Bool)

(assert (=> bm!18919 m!214491))

(assert (=> b!187683 m!214249))

(assert (=> b!187683 m!214249))

(assert (=> b!187683 m!214251))

(assert (=> b!187423 d!55475))

(assert (=> b!187434 d!55465))

(assert (=> b!187434 d!55467))

(assert (=> bm!18902 d!55435))

(declare-fun d!55477 () Bool)

(declare-fun e!123507 () Bool)

(assert (=> d!55477 e!123507))

(declare-fun res!88731 () Bool)

(assert (=> d!55477 (=> res!88731 e!123507)))

(declare-fun lt!92875 () Bool)

(assert (=> d!55477 (= res!88731 (not lt!92875))))

(declare-fun lt!92877 () Bool)

(assert (=> d!55477 (= lt!92875 lt!92877)))

(declare-fun lt!92874 () Unit!5646)

(declare-fun e!123506 () Unit!5646)

(assert (=> d!55477 (= lt!92874 e!123506)))

(declare-fun c!33713 () Bool)

(assert (=> d!55477 (= c!33713 lt!92877)))

(assert (=> d!55477 (= lt!92877 (containsKey!232 (toList!1213 lt!92764) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55477 (= (contains!1313 lt!92764 #b0000000000000000000000000000000000000000000000000000000000000000) lt!92875)))

(declare-fun b!187685 () Bool)

(declare-fun lt!92876 () Unit!5646)

(assert (=> b!187685 (= e!123506 lt!92876)))

(assert (=> b!187685 (= lt!92876 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1213 lt!92764) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187685 (isDefined!181 (getValueByKey!228 (toList!1213 lt!92764) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187686 () Bool)

(declare-fun Unit!5655 () Unit!5646)

(assert (=> b!187686 (= e!123506 Unit!5655)))

(declare-fun b!187687 () Bool)

(assert (=> b!187687 (= e!123507 (isDefined!181 (getValueByKey!228 (toList!1213 lt!92764) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55477 c!33713) b!187685))

(assert (= (and d!55477 (not c!33713)) b!187686))

(assert (= (and d!55477 (not res!88731)) b!187687))

(declare-fun m!214493 () Bool)

(assert (=> d!55477 m!214493))

(declare-fun m!214495 () Bool)

(assert (=> b!187685 m!214495))

(declare-fun m!214497 () Bool)

(assert (=> b!187685 m!214497))

(assert (=> b!187685 m!214497))

(declare-fun m!214499 () Bool)

(assert (=> b!187685 m!214499))

(assert (=> b!187687 m!214497))

(assert (=> b!187687 m!214497))

(assert (=> b!187687 m!214499))

(assert (=> bm!18903 d!55477))

(assert (=> b!187496 d!55459))

(declare-fun d!55479 () Bool)

(declare-fun e!123509 () Bool)

(assert (=> d!55479 e!123509))

(declare-fun res!88732 () Bool)

(assert (=> d!55479 (=> res!88732 e!123509)))

(declare-fun lt!92879 () Bool)

(assert (=> d!55479 (= res!88732 (not lt!92879))))

(declare-fun lt!92881 () Bool)

(assert (=> d!55479 (= lt!92879 lt!92881)))

(declare-fun lt!92878 () Unit!5646)

(declare-fun e!123508 () Unit!5646)

(assert (=> d!55479 (= lt!92878 e!123508)))

(declare-fun c!33714 () Bool)

(assert (=> d!55479 (= c!33714 lt!92881)))

(assert (=> d!55479 (= lt!92881 (containsKey!232 (toList!1213 lt!92764) (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55479 (= (contains!1313 lt!92764 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)) lt!92879)))

(declare-fun b!187688 () Bool)

(declare-fun lt!92880 () Unit!5646)

(assert (=> b!187688 (= e!123508 lt!92880)))

(assert (=> b!187688 (= lt!92880 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1213 lt!92764) (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187688 (isDefined!181 (getValueByKey!228 (toList!1213 lt!92764) (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187689 () Bool)

(declare-fun Unit!5656 () Unit!5646)

(assert (=> b!187689 (= e!123508 Unit!5656)))

(declare-fun b!187690 () Bool)

(assert (=> b!187690 (= e!123509 (isDefined!181 (getValueByKey!228 (toList!1213 lt!92764) (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55479 c!33714) b!187688))

(assert (= (and d!55479 (not c!33714)) b!187689))

(assert (= (and d!55479 (not res!88732)) b!187690))

(assert (=> d!55479 m!214249))

(declare-fun m!214501 () Bool)

(assert (=> d!55479 m!214501))

(assert (=> b!187688 m!214249))

(declare-fun m!214503 () Bool)

(assert (=> b!187688 m!214503))

(assert (=> b!187688 m!214249))

(assert (=> b!187688 m!214455))

(assert (=> b!187688 m!214455))

(declare-fun m!214505 () Bool)

(assert (=> b!187688 m!214505))

(assert (=> b!187690 m!214249))

(assert (=> b!187690 m!214455))

(assert (=> b!187690 m!214455))

(assert (=> b!187690 m!214505))

(assert (=> b!187486 d!55479))

(declare-fun d!55481 () Bool)

(declare-fun e!123510 () Bool)

(assert (=> d!55481 e!123510))

(declare-fun res!88734 () Bool)

(assert (=> d!55481 (=> (not res!88734) (not e!123510))))

(declare-fun lt!92885 () ListLongMap!2395)

(assert (=> d!55481 (= res!88734 (contains!1313 lt!92885 (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))))))

(declare-fun lt!92884 () List!2382)

(assert (=> d!55481 (= lt!92885 (ListLongMap!2396 lt!92884))))

(declare-fun lt!92882 () Unit!5646)

(declare-fun lt!92883 () Unit!5646)

(assert (=> d!55481 (= lt!92882 lt!92883)))

(assert (=> d!55481 (= (getValueByKey!228 lt!92884 (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))) (Some!233 (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))))))

(assert (=> d!55481 (= lt!92883 (lemmaContainsTupThenGetReturnValue!119 lt!92884 (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))) (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))))))

(assert (=> d!55481 (= lt!92884 (insertStrictlySorted!122 (toList!1213 call!18905) (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))) (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))))))

(assert (=> d!55481 (= (+!291 call!18905 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))) lt!92885)))

(declare-fun b!187691 () Bool)

(declare-fun res!88733 () Bool)

(assert (=> b!187691 (=> (not res!88733) (not e!123510))))

(assert (=> b!187691 (= res!88733 (= (getValueByKey!228 (toList!1213 lt!92885) (_1!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248)))) (Some!233 (_2!1750 (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))))))))

(declare-fun b!187692 () Bool)

(assert (=> b!187692 (= e!123510 (contains!1314 (toList!1213 lt!92885) (tuple2!3479 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3663 thiss!1248))))))

(assert (= (and d!55481 res!88734) b!187691))

(assert (= (and b!187691 res!88733) b!187692))

(declare-fun m!214507 () Bool)

(assert (=> d!55481 m!214507))

(declare-fun m!214509 () Bool)

(assert (=> d!55481 m!214509))

(declare-fun m!214511 () Bool)

(assert (=> d!55481 m!214511))

(declare-fun m!214513 () Bool)

(assert (=> d!55481 m!214513))

(declare-fun m!214515 () Bool)

(assert (=> b!187691 m!214515))

(declare-fun m!214517 () Bool)

(assert (=> b!187692 m!214517))

(assert (=> b!187487 d!55481))

(declare-fun d!55483 () Bool)

(assert (=> d!55483 (= (apply!171 lt!92764 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2167 (getValueByKey!228 (toList!1213 lt!92764) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7572 () Bool)

(assert (= bs!7572 d!55483))

(assert (=> bs!7572 m!214497))

(assert (=> bs!7572 m!214497))

(declare-fun m!214519 () Bool)

(assert (=> bs!7572 m!214519))

(assert (=> b!187483 d!55483))

(declare-fun b!187701 () Bool)

(declare-fun e!123518 () Bool)

(declare-fun e!123519 () Bool)

(assert (=> b!187701 (= e!123518 e!123519)))

(declare-fun lt!92894 () (_ BitVec 64))

(assert (=> b!187701 (= lt!92894 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92893 () Unit!5646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7983 (_ BitVec 64) (_ BitVec 32)) Unit!5646)

(assert (=> b!187701 (= lt!92893 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5773 thiss!1248) lt!92894 #b00000000000000000000000000000000))))

(assert (=> b!187701 (arrayContainsKey!0 (_keys!5773 thiss!1248) lt!92894 #b00000000000000000000000000000000)))

(declare-fun lt!92892 () Unit!5646)

(assert (=> b!187701 (= lt!92892 lt!92893)))

(declare-fun res!88739 () Bool)

(assert (=> b!187701 (= res!88739 (= (seekEntryOrOpen!0 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000) (_keys!5773 thiss!1248) (mask!8967 thiss!1248)) (Found!647 #b00000000000000000000000000000000)))))

(assert (=> b!187701 (=> (not res!88739) (not e!123519))))

(declare-fun b!187702 () Bool)

(declare-fun e!123517 () Bool)

(assert (=> b!187702 (= e!123517 e!123518)))

(declare-fun c!33717 () Bool)

(assert (=> b!187702 (= c!33717 (validKeyInArray!0 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18922 () Bool)

(declare-fun call!18925 () Bool)

(assert (=> bm!18922 (= call!18925 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5773 thiss!1248) (mask!8967 thiss!1248)))))

(declare-fun b!187703 () Bool)

(assert (=> b!187703 (= e!123518 call!18925)))

(declare-fun b!187704 () Bool)

(assert (=> b!187704 (= e!123519 call!18925)))

(declare-fun d!55485 () Bool)

(declare-fun res!88740 () Bool)

(assert (=> d!55485 (=> res!88740 e!123517)))

(assert (=> d!55485 (= res!88740 (bvsge #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(assert (=> d!55485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)) e!123517)))

(assert (= (and d!55485 (not res!88740)) b!187702))

(assert (= (and b!187702 c!33717) b!187701))

(assert (= (and b!187702 (not c!33717)) b!187703))

(assert (= (and b!187701 res!88739) b!187704))

(assert (= (or b!187704 b!187703) bm!18922))

(assert (=> b!187701 m!214249))

(declare-fun m!214521 () Bool)

(assert (=> b!187701 m!214521))

(declare-fun m!214523 () Bool)

(assert (=> b!187701 m!214523))

(assert (=> b!187701 m!214249))

(declare-fun m!214525 () Bool)

(assert (=> b!187701 m!214525))

(assert (=> b!187702 m!214249))

(assert (=> b!187702 m!214249))

(assert (=> b!187702 m!214251))

(declare-fun m!214527 () Bool)

(assert (=> bm!18922 m!214527))

(assert (=> b!187424 d!55485))

(declare-fun b!187715 () Bool)

(declare-fun e!123531 () Bool)

(declare-fun call!18928 () Bool)

(assert (=> b!187715 (= e!123531 call!18928)))

(declare-fun bm!18925 () Bool)

(declare-fun c!33720 () Bool)

(assert (=> bm!18925 (= call!18928 (arrayNoDuplicates!0 (_keys!5773 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33720 (Cons!2379 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000) Nil!2380) Nil!2380)))))

(declare-fun b!187716 () Bool)

(declare-fun e!123528 () Bool)

(assert (=> b!187716 (= e!123528 e!123531)))

(assert (=> b!187716 (= c!33720 (validKeyInArray!0 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187717 () Bool)

(assert (=> b!187717 (= e!123531 call!18928)))

(declare-fun b!187718 () Bool)

(declare-fun e!123530 () Bool)

(declare-fun contains!1315 (List!2383 (_ BitVec 64)) Bool)

(assert (=> b!187718 (= e!123530 (contains!1315 Nil!2380 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55487 () Bool)

(declare-fun res!88747 () Bool)

(declare-fun e!123529 () Bool)

(assert (=> d!55487 (=> res!88747 e!123529)))

(assert (=> d!55487 (= res!88747 (bvsge #b00000000000000000000000000000000 (size!4085 (_keys!5773 thiss!1248))))))

(assert (=> d!55487 (= (arrayNoDuplicates!0 (_keys!5773 thiss!1248) #b00000000000000000000000000000000 Nil!2380) e!123529)))

(declare-fun b!187719 () Bool)

(assert (=> b!187719 (= e!123529 e!123528)))

(declare-fun res!88748 () Bool)

(assert (=> b!187719 (=> (not res!88748) (not e!123528))))

(assert (=> b!187719 (= res!88748 (not e!123530))))

(declare-fun res!88749 () Bool)

(assert (=> b!187719 (=> (not res!88749) (not e!123530))))

(assert (=> b!187719 (= res!88749 (validKeyInArray!0 (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55487 (not res!88747)) b!187719))

(assert (= (and b!187719 res!88749) b!187718))

(assert (= (and b!187719 res!88748) b!187716))

(assert (= (and b!187716 c!33720) b!187717))

(assert (= (and b!187716 (not c!33720)) b!187715))

(assert (= (or b!187717 b!187715) bm!18925))

(assert (=> bm!18925 m!214249))

(declare-fun m!214529 () Bool)

(assert (=> bm!18925 m!214529))

(assert (=> b!187716 m!214249))

(assert (=> b!187716 m!214249))

(assert (=> b!187716 m!214251))

(assert (=> b!187718 m!214249))

(assert (=> b!187718 m!214249))

(declare-fun m!214531 () Bool)

(assert (=> b!187718 m!214531))

(assert (=> b!187719 m!214249))

(assert (=> b!187719 m!214249))

(assert (=> b!187719 m!214251))

(assert (=> b!187425 d!55487))

(declare-fun d!55489 () Bool)

(assert (=> d!55489 (= (inRange!0 (index!4759 lt!92794) (mask!8967 thiss!1248)) (and (bvsge (index!4759 lt!92794) #b00000000000000000000000000000000) (bvslt (index!4759 lt!92794) (bvadd (mask!8967 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187522 d!55489))

(declare-fun d!55491 () Bool)

(declare-fun e!123533 () Bool)

(assert (=> d!55491 e!123533))

(declare-fun res!88750 () Bool)

(assert (=> d!55491 (=> res!88750 e!123533)))

(declare-fun lt!92896 () Bool)

(assert (=> d!55491 (= res!88750 (not lt!92896))))

(declare-fun lt!92898 () Bool)

(assert (=> d!55491 (= lt!92896 lt!92898)))

(declare-fun lt!92895 () Unit!5646)

(declare-fun e!123532 () Unit!5646)

(assert (=> d!55491 (= lt!92895 e!123532)))

(declare-fun c!33721 () Bool)

(assert (=> d!55491 (= c!33721 lt!92898)))

(assert (=> d!55491 (= lt!92898 (containsKey!232 (toList!1213 lt!92764) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55491 (= (contains!1313 lt!92764 #b1000000000000000000000000000000000000000000000000000000000000000) lt!92896)))

(declare-fun b!187720 () Bool)

(declare-fun lt!92897 () Unit!5646)

(assert (=> b!187720 (= e!123532 lt!92897)))

(assert (=> b!187720 (= lt!92897 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1213 lt!92764) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187720 (isDefined!181 (getValueByKey!228 (toList!1213 lt!92764) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187721 () Bool)

(declare-fun Unit!5657 () Unit!5646)

(assert (=> b!187721 (= e!123532 Unit!5657)))

(declare-fun b!187722 () Bool)

(assert (=> b!187722 (= e!123533 (isDefined!181 (getValueByKey!228 (toList!1213 lt!92764) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55491 c!33721) b!187720))

(assert (= (and d!55491 (not c!33721)) b!187721))

(assert (= (and d!55491 (not res!88750)) b!187722))

(declare-fun m!214533 () Bool)

(assert (=> d!55491 m!214533))

(declare-fun m!214535 () Bool)

(assert (=> b!187720 m!214535))

(assert (=> b!187720 m!214487))

(assert (=> b!187720 m!214487))

(declare-fun m!214537 () Bool)

(assert (=> b!187720 m!214537))

(assert (=> b!187722 m!214487))

(assert (=> b!187722 m!214487))

(assert (=> b!187722 m!214537))

(assert (=> bm!18905 d!55491))

(assert (=> d!55411 d!55407))

(declare-fun b!187741 () Bool)

(declare-fun e!123546 () Bool)

(declare-fun e!123544 () Bool)

(assert (=> b!187741 (= e!123546 e!123544)))

(declare-fun res!88759 () Bool)

(declare-fun lt!92903 () SeekEntryResult!647)

(assert (=> b!187741 (= res!88759 (and ((_ is Intermediate!647) lt!92903) (not (undefined!1459 lt!92903)) (bvslt (x!20281 lt!92903) #b01111111111111111111111111111110) (bvsge (x!20281 lt!92903) #b00000000000000000000000000000000) (bvsge (x!20281 lt!92903) #b00000000000000000000000000000000)))))

(assert (=> b!187741 (=> (not res!88759) (not e!123544))))

(declare-fun d!55493 () Bool)

(assert (=> d!55493 e!123546))

(declare-fun c!33730 () Bool)

(assert (=> d!55493 (= c!33730 (and ((_ is Intermediate!647) lt!92903) (undefined!1459 lt!92903)))))

(declare-fun e!123545 () SeekEntryResult!647)

(assert (=> d!55493 (= lt!92903 e!123545)))

(declare-fun c!33728 () Bool)

(assert (=> d!55493 (= c!33728 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!92904 () (_ BitVec 64))

(assert (=> d!55493 (= lt!92904 (select (arr!3767 (_keys!5773 thiss!1248)) (toIndex!0 key!828 (mask!8967 thiss!1248))))))

(assert (=> d!55493 (validMask!0 (mask!8967 thiss!1248))))

(assert (=> d!55493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8967 thiss!1248)) key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)) lt!92903)))

(declare-fun b!187742 () Bool)

(assert (=> b!187742 (= e!123546 (bvsge (x!20281 lt!92903) #b01111111111111111111111111111110))))

(declare-fun b!187743 () Bool)

(assert (=> b!187743 (and (bvsge (index!4760 lt!92903) #b00000000000000000000000000000000) (bvslt (index!4760 lt!92903) (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun res!88758 () Bool)

(assert (=> b!187743 (= res!88758 (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4760 lt!92903)) key!828))))

(declare-fun e!123547 () Bool)

(assert (=> b!187743 (=> res!88758 e!123547)))

(assert (=> b!187743 (= e!123544 e!123547)))

(declare-fun b!187744 () Bool)

(declare-fun e!123548 () SeekEntryResult!647)

(assert (=> b!187744 (= e!123548 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8967 thiss!1248)) #b00000000000000000000000000000000 (mask!8967 thiss!1248)) key!828 (_keys!5773 thiss!1248) (mask!8967 thiss!1248)))))

(declare-fun b!187745 () Bool)

(assert (=> b!187745 (= e!123545 (Intermediate!647 true (toIndex!0 key!828 (mask!8967 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!187746 () Bool)

(assert (=> b!187746 (and (bvsge (index!4760 lt!92903) #b00000000000000000000000000000000) (bvslt (index!4760 lt!92903) (size!4085 (_keys!5773 thiss!1248))))))

(assert (=> b!187746 (= e!123547 (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4760 lt!92903)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187747 () Bool)

(assert (=> b!187747 (= e!123548 (Intermediate!647 false (toIndex!0 key!828 (mask!8967 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!187748 () Bool)

(assert (=> b!187748 (= e!123545 e!123548)))

(declare-fun c!33729 () Bool)

(assert (=> b!187748 (= c!33729 (or (= lt!92904 key!828) (= (bvadd lt!92904 lt!92904) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!187749 () Bool)

(assert (=> b!187749 (and (bvsge (index!4760 lt!92903) #b00000000000000000000000000000000) (bvslt (index!4760 lt!92903) (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun res!88757 () Bool)

(assert (=> b!187749 (= res!88757 (= (select (arr!3767 (_keys!5773 thiss!1248)) (index!4760 lt!92903)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187749 (=> res!88757 e!123547)))

(assert (= (and d!55493 c!33728) b!187745))

(assert (= (and d!55493 (not c!33728)) b!187748))

(assert (= (and b!187748 c!33729) b!187747))

(assert (= (and b!187748 (not c!33729)) b!187744))

(assert (= (and d!55493 c!33730) b!187742))

(assert (= (and d!55493 (not c!33730)) b!187741))

(assert (= (and b!187741 res!88759) b!187743))

(assert (= (and b!187743 (not res!88758)) b!187749))

(assert (= (and b!187749 (not res!88757)) b!187746))

(declare-fun m!214539 () Bool)

(assert (=> b!187743 m!214539))

(assert (=> d!55493 m!214301))

(declare-fun m!214541 () Bool)

(assert (=> d!55493 m!214541))

(assert (=> d!55493 m!214169))

(assert (=> b!187746 m!214539))

(assert (=> b!187744 m!214301))

(declare-fun m!214543 () Bool)

(assert (=> b!187744 m!214543))

(assert (=> b!187744 m!214543))

(declare-fun m!214545 () Bool)

(assert (=> b!187744 m!214545))

(assert (=> b!187749 m!214539))

(assert (=> d!55413 d!55493))

(declare-fun d!55495 () Bool)

(declare-fun lt!92910 () (_ BitVec 32))

(declare-fun lt!92909 () (_ BitVec 32))

(assert (=> d!55495 (= lt!92910 (bvmul (bvxor lt!92909 (bvlshr lt!92909 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55495 (= lt!92909 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55495 (and (bvsge (mask!8967 thiss!1248) #b00000000000000000000000000000000) (let ((res!88760 (let ((h!3015 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20300 (bvmul (bvxor h!3015 (bvlshr h!3015 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20300 (bvlshr x!20300 #b00000000000000000000000000001101)) (mask!8967 thiss!1248)))))) (and (bvslt res!88760 (bvadd (mask!8967 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88760 #b00000000000000000000000000000000))))))

(assert (=> d!55495 (= (toIndex!0 key!828 (mask!8967 thiss!1248)) (bvand (bvxor lt!92910 (bvlshr lt!92910 #b00000000000000000000000000001101)) (mask!8967 thiss!1248)))))

(assert (=> d!55413 d!55495))

(assert (=> d!55413 d!55407))

(declare-fun d!55497 () Bool)

(declare-fun res!88765 () Bool)

(declare-fun e!123553 () Bool)

(assert (=> d!55497 (=> res!88765 e!123553)))

(assert (=> d!55497 (= res!88765 (= (select (arr!3767 (_keys!5773 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55497 (= (arrayContainsKey!0 (_keys!5773 thiss!1248) key!828 #b00000000000000000000000000000000) e!123553)))

(declare-fun b!187754 () Bool)

(declare-fun e!123554 () Bool)

(assert (=> b!187754 (= e!123553 e!123554)))

(declare-fun res!88766 () Bool)

(assert (=> b!187754 (=> (not res!88766) (not e!123554))))

(assert (=> b!187754 (= res!88766 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4085 (_keys!5773 thiss!1248))))))

(declare-fun b!187755 () Bool)

(assert (=> b!187755 (= e!123554 (arrayContainsKey!0 (_keys!5773 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55497 (not res!88765)) b!187754))

(assert (= (and b!187754 res!88766) b!187755))

(assert (=> d!55497 m!214249))

(declare-fun m!214547 () Bool)

(assert (=> b!187755 m!214547))

(assert (=> bm!18885 d!55497))

(declare-fun d!55499 () Bool)

(declare-fun res!88771 () Bool)

(declare-fun e!123559 () Bool)

(assert (=> d!55499 (=> res!88771 e!123559)))

(assert (=> d!55499 (= res!88771 (and ((_ is Cons!2378) (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))) (= (_1!1750 (h!3013 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))))) key!828)))))

(assert (=> d!55499 (= (containsKey!232 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))) key!828) e!123559)))

(declare-fun b!187760 () Bool)

(declare-fun e!123560 () Bool)

(assert (=> b!187760 (= e!123559 e!123560)))

(declare-fun res!88772 () Bool)

(assert (=> b!187760 (=> (not res!88772) (not e!123560))))

(assert (=> b!187760 (= res!88772 (and (or (not ((_ is Cons!2378) (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))))) (bvsle (_1!1750 (h!3013 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))))) key!828)) ((_ is Cons!2378) (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))) (bvslt (_1!1750 (h!3013 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248))))) key!828)))))

(declare-fun b!187761 () Bool)

(assert (=> b!187761 (= e!123560 (containsKey!232 (t!7274 (toList!1213 (getCurrentListMap!861 (_keys!5773 thiss!1248) (_values!3805 thiss!1248) (mask!8967 thiss!1248) (extraKeys!3559 thiss!1248) (zeroValue!3663 thiss!1248) (minValue!3663 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3822 thiss!1248)))) key!828))))

(assert (= (and d!55499 (not res!88771)) b!187760))

(assert (= (and b!187760 res!88772) b!187761))

(declare-fun m!214549 () Bool)

(assert (=> b!187761 m!214549))

(assert (=> d!55409 d!55499))

(declare-fun d!55501 () Bool)

(assert (=> d!55501 (= (inRange!0 (ite c!33638 (index!4758 lt!92701) (index!4761 lt!92701)) (mask!8967 thiss!1248)) (and (bvsge (ite c!33638 (index!4758 lt!92701) (index!4761 lt!92701)) #b00000000000000000000000000000000) (bvslt (ite c!33638 (index!4758 lt!92701) (index!4761 lt!92701)) (bvadd (mask!8967 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18886 d!55501))

(declare-fun b!187763 () Bool)

(declare-fun e!123561 () Bool)

(assert (=> b!187763 (= e!123561 tp_is_empty!4383)))

(declare-fun mapIsEmpty!7557 () Bool)

(declare-fun mapRes!7557 () Bool)

(assert (=> mapIsEmpty!7557 mapRes!7557))

(declare-fun condMapEmpty!7557 () Bool)

(declare-fun mapDefault!7557 () ValueCell!1848)

(assert (=> mapNonEmpty!7556 (= condMapEmpty!7557 (= mapRest!7556 ((as const (Array (_ BitVec 32) ValueCell!1848)) mapDefault!7557)))))

(assert (=> mapNonEmpty!7556 (= tp!16655 (and e!123561 mapRes!7557))))

(declare-fun b!187762 () Bool)

(declare-fun e!123562 () Bool)

(assert (=> b!187762 (= e!123562 tp_is_empty!4383)))

(declare-fun mapNonEmpty!7557 () Bool)

(declare-fun tp!16656 () Bool)

(assert (=> mapNonEmpty!7557 (= mapRes!7557 (and tp!16656 e!123562))))

(declare-fun mapRest!7557 () (Array (_ BitVec 32) ValueCell!1848))

(declare-fun mapKey!7557 () (_ BitVec 32))

(declare-fun mapValue!7557 () ValueCell!1848)

(assert (=> mapNonEmpty!7557 (= mapRest!7556 (store mapRest!7557 mapKey!7557 mapValue!7557))))

(assert (= (and mapNonEmpty!7556 condMapEmpty!7557) mapIsEmpty!7557))

(assert (= (and mapNonEmpty!7556 (not condMapEmpty!7557)) mapNonEmpty!7557))

(assert (= (and mapNonEmpty!7557 ((_ is ValueCellFull!1848) mapValue!7557)) b!187762))

(assert (= (and mapNonEmpty!7556 ((_ is ValueCellFull!1848) mapDefault!7557)) b!187763))

(declare-fun m!214551 () Bool)

(assert (=> mapNonEmpty!7557 m!214551))

(declare-fun b_lambda!7295 () Bool)

(assert (= b_lambda!7291 (or (and b!187353 b_free!4611) b_lambda!7295)))

(declare-fun b_lambda!7297 () Bool)

(assert (= b_lambda!7293 (or (and b!187353 b_free!4611) b_lambda!7297)))

(check-sat (not b!187659) (not b!187579) (not b!187718) (not d!55447) (not b!187536) (not d!55451) (not b!187587) (not d!55419) (not d!55439) (not d!55481) (not b!187596) (not b!187701) (not d!55435) (not d!55477) (not b!187716) (not b!187688) (not b!187687) (not b!187719) (not b!187580) (not bm!18915) (not b!187594) (not d!55427) (not bm!18919) (not d!55437) (not b!187641) (not d!55421) (not d!55449) (not d!55493) (not d!55491) (not bm!18910) (not d!55469) (not bm!18916) (not d!55443) (not d!55429) (not b!187702) (not b!187595) (not b!187548) (not b!187755) (not b_lambda!7289) (not d!55471) (not d!55463) (not b!187761) (not b!187542) (not d!55465) (not d!55453) (not mapNonEmpty!7557) b_and!11237 (not b!187549) (not b!187744) (not d!55479) (not d!55441) (not b!187592) (not b!187602) (not b!187671) (not b!187683) (not b!187630) (not b!187603) (not b!187550) (not b!187691) tp_is_empty!4383 (not d!55445) (not d!55483) (not d!55455) (not b!187582) (not b!187692) (not b!187593) (not b!187685) (not b!187591) (not b!187578) (not b_lambda!7297) (not b_lambda!7295) (not d!55461) (not b!187690) (not d!55423) (not b!187552) (not d!55425) (not b!187588) (not d!55431) (not b!187670) (not b!187584) (not bm!18922) (not b_next!4611) (not b!187585) (not d!55433) (not b!187720) (not b!187722) (not d!55473) (not b!187543) (not bm!18925))
(check-sat b_and!11237 (not b_next!4611))
