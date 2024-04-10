; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22152 () Bool)

(assert start!22152)

(declare-fun b!231254 () Bool)

(declare-fun b_free!6219 () Bool)

(declare-fun b_next!6219 () Bool)

(assert (=> b!231254 (= b_free!6219 (not b_next!6219))))

(declare-fun tp!21798 () Bool)

(declare-fun b_and!13117 () Bool)

(assert (=> b!231254 (= tp!21798 b_and!13117)))

(declare-fun b!231240 () Bool)

(declare-fun c!38411 () Bool)

(declare-datatypes ((SeekEntryResult!949 0))(
  ( (MissingZero!949 (index!5966 (_ BitVec 32))) (Found!949 (index!5967 (_ BitVec 32))) (Intermediate!949 (undefined!1761 Bool) (index!5968 (_ BitVec 32)) (x!23489 (_ BitVec 32))) (Undefined!949) (MissingVacant!949 (index!5969 (_ BitVec 32))) )
))
(declare-fun lt!116532 () SeekEntryResult!949)

(get-info :version)

(assert (=> b!231240 (= c!38411 ((_ is MissingVacant!949) lt!116532))))

(declare-fun e!150107 () Bool)

(declare-fun e!150111 () Bool)

(assert (=> b!231240 (= e!150107 e!150111)))

(declare-fun b!231241 () Bool)

(declare-fun res!113658 () Bool)

(declare-fun e!150108 () Bool)

(assert (=> b!231241 (=> (not res!113658) (not e!150108))))

(declare-fun call!21491 () Bool)

(assert (=> b!231241 (= res!113658 call!21491)))

(assert (=> b!231241 (= e!150107 e!150108)))

(declare-fun b!231242 () Bool)

(declare-datatypes ((Unit!7108 0))(
  ( (Unit!7109) )
))
(declare-fun e!150105 () Unit!7108)

(declare-fun Unit!7110 () Unit!7108)

(assert (=> b!231242 (= e!150105 Unit!7110)))

(declare-fun res!113665 () Bool)

(declare-fun e!150115 () Bool)

(assert (=> start!22152 (=> (not res!113665) (not e!150115))))

(declare-datatypes ((V!7755 0))(
  ( (V!7756 (val!3085 Int)) )
))
(declare-datatypes ((ValueCell!2697 0))(
  ( (ValueCellFull!2697 (v!5105 V!7755)) (EmptyCell!2697) )
))
(declare-datatypes ((array!11405 0))(
  ( (array!11406 (arr!5422 (Array (_ BitVec 32) ValueCell!2697)) (size!5755 (_ BitVec 32))) )
))
(declare-datatypes ((array!11407 0))(
  ( (array!11408 (arr!5423 (Array (_ BitVec 32) (_ BitVec 64))) (size!5756 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3294 0))(
  ( (LongMapFixedSize!3295 (defaultEntry!4306 Int) (mask!10206 (_ BitVec 32)) (extraKeys!4043 (_ BitVec 32)) (zeroValue!4147 V!7755) (minValue!4147 V!7755) (_size!1696 (_ BitVec 32)) (_keys!6360 array!11407) (_values!4289 array!11405) (_vacant!1696 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3294)

(declare-fun valid!1309 (LongMapFixedSize!3294) Bool)

(assert (=> start!22152 (= res!113665 (valid!1309 thiss!1504))))

(assert (=> start!22152 e!150115))

(declare-fun e!150109 () Bool)

(assert (=> start!22152 e!150109))

(assert (=> start!22152 true))

(declare-fun tp_is_empty!6081 () Bool)

(assert (=> start!22152 tp_is_empty!6081))

(declare-fun b!231243 () Bool)

(declare-fun Unit!7111 () Unit!7108)

(assert (=> b!231243 (= e!150105 Unit!7111)))

(declare-fun lt!116536 () Unit!7108)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!133 (array!11407 array!11405 (_ BitVec 32) (_ BitVec 32) V!7755 V!7755 (_ BitVec 64) (_ BitVec 32) Int) Unit!7108)

(assert (=> b!231243 (= lt!116536 (lemmaArrayContainsKeyThenInListMap!133 (_keys!6360 thiss!1504) (_values!4289 thiss!1504) (mask!10206 thiss!1504) (extraKeys!4043 thiss!1504) (zeroValue!4147 thiss!1504) (minValue!4147 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4306 thiss!1504)))))

(assert (=> b!231243 false))

(declare-fun b!231244 () Bool)

(declare-fun e!150112 () Bool)

(assert (=> b!231244 (= e!150115 e!150112)))

(declare-fun res!113664 () Bool)

(assert (=> b!231244 (=> (not res!113664) (not e!150112))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231244 (= res!113664 (or (= lt!116532 (MissingZero!949 index!297)) (= lt!116532 (MissingVacant!949 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11407 (_ BitVec 32)) SeekEntryResult!949)

(assert (=> b!231244 (= lt!116532 (seekEntryOrOpen!0 key!932 (_keys!6360 thiss!1504) (mask!10206 thiss!1504)))))

(declare-fun b!231245 () Bool)

(declare-fun e!150103 () Unit!7108)

(declare-fun Unit!7112 () Unit!7108)

(assert (=> b!231245 (= e!150103 Unit!7112)))

(declare-fun lt!116537 () Unit!7108)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!299 (array!11407 array!11405 (_ BitVec 32) (_ BitVec 32) V!7755 V!7755 (_ BitVec 64) Int) Unit!7108)

(assert (=> b!231245 (= lt!116537 (lemmaInListMapThenSeekEntryOrOpenFindsIt!299 (_keys!6360 thiss!1504) (_values!4289 thiss!1504) (mask!10206 thiss!1504) (extraKeys!4043 thiss!1504) (zeroValue!4147 thiss!1504) (minValue!4147 thiss!1504) key!932 (defaultEntry!4306 thiss!1504)))))

(assert (=> b!231245 false))

(declare-fun b!231246 () Bool)

(declare-fun e!150104 () Bool)

(declare-fun e!150114 () Bool)

(declare-fun mapRes!10291 () Bool)

(assert (=> b!231246 (= e!150104 (and e!150114 mapRes!10291))))

(declare-fun condMapEmpty!10291 () Bool)

(declare-fun mapDefault!10291 () ValueCell!2697)

(assert (=> b!231246 (= condMapEmpty!10291 (= (arr!5422 (_values!4289 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2697)) mapDefault!10291)))))

(declare-fun b!231247 () Bool)

(declare-fun e!150113 () Bool)

(assert (=> b!231247 (= e!150113 (not true))))

(declare-fun lt!116527 () array!11407)

(declare-fun arrayCountValidKeys!0 (array!11407 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231247 (= (arrayCountValidKeys!0 lt!116527 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116538 () Unit!7108)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11407 (_ BitVec 32)) Unit!7108)

(assert (=> b!231247 (= lt!116538 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116527 index!297))))

(declare-fun arrayContainsKey!0 (array!11407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231247 (arrayContainsKey!0 lt!116527 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116531 () Unit!7108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11407 (_ BitVec 64) (_ BitVec 32)) Unit!7108)

(assert (=> b!231247 (= lt!116531 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116527 key!932 index!297))))

(declare-datatypes ((tuple2!4552 0))(
  ( (tuple2!4553 (_1!2287 (_ BitVec 64)) (_2!2287 V!7755)) )
))
(declare-datatypes ((List!3472 0))(
  ( (Nil!3469) (Cons!3468 (h!4116 tuple2!4552) (t!8431 List!3472)) )
))
(declare-datatypes ((ListLongMap!3465 0))(
  ( (ListLongMap!3466 (toList!1748 List!3472)) )
))
(declare-fun lt!116539 () ListLongMap!3465)

(declare-fun v!346 () V!7755)

(declare-fun +!613 (ListLongMap!3465 tuple2!4552) ListLongMap!3465)

(declare-fun getCurrentListMap!1276 (array!11407 array!11405 (_ BitVec 32) (_ BitVec 32) V!7755 V!7755 (_ BitVec 32) Int) ListLongMap!3465)

(assert (=> b!231247 (= (+!613 lt!116539 (tuple2!4553 key!932 v!346)) (getCurrentListMap!1276 lt!116527 (array!11406 (store (arr!5422 (_values!4289 thiss!1504)) index!297 (ValueCellFull!2697 v!346)) (size!5755 (_values!4289 thiss!1504))) (mask!10206 thiss!1504) (extraKeys!4043 thiss!1504) (zeroValue!4147 thiss!1504) (minValue!4147 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4306 thiss!1504)))))

(declare-fun lt!116533 () Unit!7108)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!67 (array!11407 array!11405 (_ BitVec 32) (_ BitVec 32) V!7755 V!7755 (_ BitVec 32) (_ BitVec 64) V!7755 Int) Unit!7108)

(assert (=> b!231247 (= lt!116533 (lemmaAddValidKeyToArrayThenAddPairToListMap!67 (_keys!6360 thiss!1504) (_values!4289 thiss!1504) (mask!10206 thiss!1504) (extraKeys!4043 thiss!1504) (zeroValue!4147 thiss!1504) (minValue!4147 thiss!1504) index!297 key!932 v!346 (defaultEntry!4306 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11407 (_ BitVec 32)) Bool)

(assert (=> b!231247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116527 (mask!10206 thiss!1504))))

(declare-fun lt!116534 () Unit!7108)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11407 (_ BitVec 32) (_ BitVec 32)) Unit!7108)

(assert (=> b!231247 (= lt!116534 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6360 thiss!1504) index!297 (mask!10206 thiss!1504)))))

(assert (=> b!231247 (= (arrayCountValidKeys!0 lt!116527 #b00000000000000000000000000000000 (size!5756 (_keys!6360 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6360 thiss!1504) #b00000000000000000000000000000000 (size!5756 (_keys!6360 thiss!1504)))))))

(declare-fun lt!116530 () Unit!7108)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11407 (_ BitVec 32) (_ BitVec 64)) Unit!7108)

(assert (=> b!231247 (= lt!116530 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6360 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3473 0))(
  ( (Nil!3470) (Cons!3469 (h!4117 (_ BitVec 64)) (t!8432 List!3473)) )
))
(declare-fun arrayNoDuplicates!0 (array!11407 (_ BitVec 32) List!3473) Bool)

(assert (=> b!231247 (arrayNoDuplicates!0 lt!116527 #b00000000000000000000000000000000 Nil!3470)))

(assert (=> b!231247 (= lt!116527 (array!11408 (store (arr!5423 (_keys!6360 thiss!1504)) index!297 key!932) (size!5756 (_keys!6360 thiss!1504))))))

(declare-fun lt!116528 () Unit!7108)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11407 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3473) Unit!7108)

(assert (=> b!231247 (= lt!116528 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6360 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3470))))

(declare-fun lt!116535 () Unit!7108)

(assert (=> b!231247 (= lt!116535 e!150105)))

(declare-fun c!38409 () Bool)

(assert (=> b!231247 (= c!38409 (arrayContainsKey!0 (_keys!6360 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231248 () Bool)

(declare-fun call!21492 () Bool)

(assert (=> b!231248 (= e!150108 (not call!21492))))

(declare-fun b!231249 () Bool)

(assert (=> b!231249 (= e!150111 ((_ is Undefined!949) lt!116532))))

(declare-fun mapNonEmpty!10291 () Bool)

(declare-fun tp!21799 () Bool)

(declare-fun e!150106 () Bool)

(assert (=> mapNonEmpty!10291 (= mapRes!10291 (and tp!21799 e!150106))))

(declare-fun mapKey!10291 () (_ BitVec 32))

(declare-fun mapValue!10291 () ValueCell!2697)

(declare-fun mapRest!10291 () (Array (_ BitVec 32) ValueCell!2697))

(assert (=> mapNonEmpty!10291 (= (arr!5422 (_values!4289 thiss!1504)) (store mapRest!10291 mapKey!10291 mapValue!10291))))

(declare-fun b!231250 () Bool)

(declare-fun e!150116 () Bool)

(assert (=> b!231250 (= e!150116 (not call!21492))))

(declare-fun b!231251 () Bool)

(declare-fun res!113662 () Bool)

(assert (=> b!231251 (=> (not res!113662) (not e!150108))))

(assert (=> b!231251 (= res!113662 (= (select (arr!5423 (_keys!6360 thiss!1504)) (index!5966 lt!116532)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231252 () Bool)

(assert (=> b!231252 (= e!150112 e!150113)))

(declare-fun res!113661 () Bool)

(assert (=> b!231252 (=> (not res!113661) (not e!150113))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!231252 (= res!113661 (inRange!0 index!297 (mask!10206 thiss!1504)))))

(declare-fun lt!116540 () Unit!7108)

(assert (=> b!231252 (= lt!116540 e!150103)))

(declare-fun c!38410 () Bool)

(declare-fun contains!1619 (ListLongMap!3465 (_ BitVec 64)) Bool)

(assert (=> b!231252 (= c!38410 (contains!1619 lt!116539 key!932))))

(assert (=> b!231252 (= lt!116539 (getCurrentListMap!1276 (_keys!6360 thiss!1504) (_values!4289 thiss!1504) (mask!10206 thiss!1504) (extraKeys!4043 thiss!1504) (zeroValue!4147 thiss!1504) (minValue!4147 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4306 thiss!1504)))))

(declare-fun b!231253 () Bool)

(assert (=> b!231253 (= e!150111 e!150116)))

(declare-fun res!113660 () Bool)

(assert (=> b!231253 (= res!113660 call!21491)))

(assert (=> b!231253 (=> (not res!113660) (not e!150116))))

(declare-fun bm!21488 () Bool)

(assert (=> bm!21488 (= call!21492 (arrayContainsKey!0 (_keys!6360 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3577 (array!11407) Bool)

(declare-fun array_inv!3578 (array!11405) Bool)

(assert (=> b!231254 (= e!150109 (and tp!21798 tp_is_empty!6081 (array_inv!3577 (_keys!6360 thiss!1504)) (array_inv!3578 (_values!4289 thiss!1504)) e!150104))))

(declare-fun mapIsEmpty!10291 () Bool)

(assert (=> mapIsEmpty!10291 mapRes!10291))

(declare-fun b!231255 () Bool)

(assert (=> b!231255 (= e!150106 tp_is_empty!6081)))

(declare-fun b!231256 () Bool)

(assert (=> b!231256 (= e!150114 tp_is_empty!6081)))

(declare-fun b!231257 () Bool)

(declare-fun res!113659 () Bool)

(assert (=> b!231257 (= res!113659 (= (select (arr!5423 (_keys!6360 thiss!1504)) (index!5969 lt!116532)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231257 (=> (not res!113659) (not e!150116))))

(declare-fun b!231258 () Bool)

(declare-fun lt!116529 () Unit!7108)

(assert (=> b!231258 (= e!150103 lt!116529)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!316 (array!11407 array!11405 (_ BitVec 32) (_ BitVec 32) V!7755 V!7755 (_ BitVec 64) Int) Unit!7108)

(assert (=> b!231258 (= lt!116529 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!316 (_keys!6360 thiss!1504) (_values!4289 thiss!1504) (mask!10206 thiss!1504) (extraKeys!4043 thiss!1504) (zeroValue!4147 thiss!1504) (minValue!4147 thiss!1504) key!932 (defaultEntry!4306 thiss!1504)))))

(declare-fun c!38412 () Bool)

(assert (=> b!231258 (= c!38412 ((_ is MissingZero!949) lt!116532))))

(assert (=> b!231258 e!150107))

(declare-fun bm!21489 () Bool)

(assert (=> bm!21489 (= call!21491 (inRange!0 (ite c!38412 (index!5966 lt!116532) (index!5969 lt!116532)) (mask!10206 thiss!1504)))))

(declare-fun b!231259 () Bool)

(declare-fun res!113663 () Bool)

(assert (=> b!231259 (=> (not res!113663) (not e!150115))))

(assert (=> b!231259 (= res!113663 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22152 res!113665) b!231259))

(assert (= (and b!231259 res!113663) b!231244))

(assert (= (and b!231244 res!113664) b!231252))

(assert (= (and b!231252 c!38410) b!231245))

(assert (= (and b!231252 (not c!38410)) b!231258))

(assert (= (and b!231258 c!38412) b!231241))

(assert (= (and b!231258 (not c!38412)) b!231240))

(assert (= (and b!231241 res!113658) b!231251))

(assert (= (and b!231251 res!113662) b!231248))

(assert (= (and b!231240 c!38411) b!231253))

(assert (= (and b!231240 (not c!38411)) b!231249))

(assert (= (and b!231253 res!113660) b!231257))

(assert (= (and b!231257 res!113659) b!231250))

(assert (= (or b!231241 b!231253) bm!21489))

(assert (= (or b!231248 b!231250) bm!21488))

(assert (= (and b!231252 res!113661) b!231247))

(assert (= (and b!231247 c!38409) b!231243))

(assert (= (and b!231247 (not c!38409)) b!231242))

(assert (= (and b!231246 condMapEmpty!10291) mapIsEmpty!10291))

(assert (= (and b!231246 (not condMapEmpty!10291)) mapNonEmpty!10291))

(assert (= (and mapNonEmpty!10291 ((_ is ValueCellFull!2697) mapValue!10291)) b!231255))

(assert (= (and b!231246 ((_ is ValueCellFull!2697) mapDefault!10291)) b!231256))

(assert (= b!231254 b!231246))

(assert (= start!22152 b!231254))

(declare-fun m!252625 () Bool)

(assert (=> b!231245 m!252625))

(declare-fun m!252627 () Bool)

(assert (=> b!231243 m!252627))

(declare-fun m!252629 () Bool)

(assert (=> b!231252 m!252629))

(declare-fun m!252631 () Bool)

(assert (=> b!231252 m!252631))

(declare-fun m!252633 () Bool)

(assert (=> b!231252 m!252633))

(declare-fun m!252635 () Bool)

(assert (=> mapNonEmpty!10291 m!252635))

(declare-fun m!252637 () Bool)

(assert (=> bm!21489 m!252637))

(declare-fun m!252639 () Bool)

(assert (=> bm!21488 m!252639))

(declare-fun m!252641 () Bool)

(assert (=> b!231258 m!252641))

(assert (=> b!231247 m!252639))

(declare-fun m!252643 () Bool)

(assert (=> b!231247 m!252643))

(declare-fun m!252645 () Bool)

(assert (=> b!231247 m!252645))

(declare-fun m!252647 () Bool)

(assert (=> b!231247 m!252647))

(declare-fun m!252649 () Bool)

(assert (=> b!231247 m!252649))

(declare-fun m!252651 () Bool)

(assert (=> b!231247 m!252651))

(declare-fun m!252653 () Bool)

(assert (=> b!231247 m!252653))

(declare-fun m!252655 () Bool)

(assert (=> b!231247 m!252655))

(declare-fun m!252657 () Bool)

(assert (=> b!231247 m!252657))

(declare-fun m!252659 () Bool)

(assert (=> b!231247 m!252659))

(declare-fun m!252661 () Bool)

(assert (=> b!231247 m!252661))

(declare-fun m!252663 () Bool)

(assert (=> b!231247 m!252663))

(declare-fun m!252665 () Bool)

(assert (=> b!231247 m!252665))

(declare-fun m!252667 () Bool)

(assert (=> b!231247 m!252667))

(declare-fun m!252669 () Bool)

(assert (=> b!231247 m!252669))

(declare-fun m!252671 () Bool)

(assert (=> b!231247 m!252671))

(declare-fun m!252673 () Bool)

(assert (=> b!231247 m!252673))

(declare-fun m!252675 () Bool)

(assert (=> b!231257 m!252675))

(declare-fun m!252677 () Bool)

(assert (=> start!22152 m!252677))

(declare-fun m!252679 () Bool)

(assert (=> b!231251 m!252679))

(declare-fun m!252681 () Bool)

(assert (=> b!231244 m!252681))

(declare-fun m!252683 () Bool)

(assert (=> b!231254 m!252683))

(declare-fun m!252685 () Bool)

(assert (=> b!231254 m!252685))

(check-sat b_and!13117 (not b!231252) (not bm!21489) (not b!231254) (not start!22152) (not b!231244) (not b!231245) tp_is_empty!6081 (not mapNonEmpty!10291) (not b_next!6219) (not b!231247) (not bm!21488) (not b!231258) (not b!231243))
(check-sat b_and!13117 (not b_next!6219))
