; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22146 () Bool)

(assert start!22146)

(declare-fun b!231077 () Bool)

(declare-fun b_free!6213 () Bool)

(declare-fun b_next!6213 () Bool)

(assert (=> b!231077 (= b_free!6213 (not b_next!6213))))

(declare-fun tp!21780 () Bool)

(declare-fun b_and!13111 () Bool)

(assert (=> b!231077 (= tp!21780 b_and!13111)))

(declare-fun b!231060 () Bool)

(declare-datatypes ((Unit!7095 0))(
  ( (Unit!7096) )
))
(declare-fun e!149980 () Unit!7095)

(declare-fun Unit!7097 () Unit!7095)

(assert (=> b!231060 (= e!149980 Unit!7097)))

(declare-fun lt!116409 () Unit!7095)

(declare-datatypes ((V!7747 0))(
  ( (V!7748 (val!3082 Int)) )
))
(declare-datatypes ((ValueCell!2694 0))(
  ( (ValueCellFull!2694 (v!5102 V!7747)) (EmptyCell!2694) )
))
(declare-datatypes ((array!11393 0))(
  ( (array!11394 (arr!5416 (Array (_ BitVec 32) ValueCell!2694)) (size!5749 (_ BitVec 32))) )
))
(declare-datatypes ((array!11395 0))(
  ( (array!11396 (arr!5417 (Array (_ BitVec 32) (_ BitVec 64))) (size!5750 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3288 0))(
  ( (LongMapFixedSize!3289 (defaultEntry!4303 Int) (mask!10201 (_ BitVec 32)) (extraKeys!4040 (_ BitVec 32)) (zeroValue!4144 V!7747) (minValue!4144 V!7747) (_size!1693 (_ BitVec 32)) (_keys!6357 array!11395) (_values!4286 array!11393) (_vacant!1693 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3288)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!297 (array!11395 array!11393 (_ BitVec 32) (_ BitVec 32) V!7747 V!7747 (_ BitVec 64) Int) Unit!7095)

(assert (=> b!231060 (= lt!116409 (lemmaInListMapThenSeekEntryOrOpenFindsIt!297 (_keys!6357 thiss!1504) (_values!4286 thiss!1504) (mask!10201 thiss!1504) (extraKeys!4040 thiss!1504) (zeroValue!4144 thiss!1504) (minValue!4144 thiss!1504) key!932 (defaultEntry!4303 thiss!1504)))))

(assert (=> b!231060 false))

(declare-fun b!231061 () Bool)

(declare-fun e!149985 () Unit!7095)

(declare-fun Unit!7098 () Unit!7095)

(assert (=> b!231061 (= e!149985 Unit!7098)))

(declare-fun b!231062 () Bool)

(declare-fun res!113591 () Bool)

(declare-fun e!149986 () Bool)

(assert (=> b!231062 (=> (not res!113591) (not e!149986))))

(declare-fun call!21474 () Bool)

(assert (=> b!231062 (= res!113591 call!21474)))

(declare-fun e!149988 () Bool)

(assert (=> b!231062 (= e!149988 e!149986)))

(declare-fun bm!21470 () Bool)

(declare-fun call!21473 () Bool)

(declare-fun arrayContainsKey!0 (array!11395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21470 (= call!21473 (arrayContainsKey!0 (_keys!6357 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231063 () Bool)

(declare-fun Unit!7099 () Unit!7095)

(assert (=> b!231063 (= e!149985 Unit!7099)))

(declare-fun lt!116412 () Unit!7095)

(declare-fun lemmaArrayContainsKeyThenInListMap!131 (array!11395 array!11393 (_ BitVec 32) (_ BitVec 32) V!7747 V!7747 (_ BitVec 64) (_ BitVec 32) Int) Unit!7095)

(assert (=> b!231063 (= lt!116412 (lemmaArrayContainsKeyThenInListMap!131 (_keys!6357 thiss!1504) (_values!4286 thiss!1504) (mask!10201 thiss!1504) (extraKeys!4040 thiss!1504) (zeroValue!4144 thiss!1504) (minValue!4144 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4303 thiss!1504)))))

(assert (=> b!231063 false))

(declare-fun mapNonEmpty!10282 () Bool)

(declare-fun mapRes!10282 () Bool)

(declare-fun tp!21781 () Bool)

(declare-fun e!149982 () Bool)

(assert (=> mapNonEmpty!10282 (= mapRes!10282 (and tp!21781 e!149982))))

(declare-fun mapRest!10282 () (Array (_ BitVec 32) ValueCell!2694))

(declare-fun mapKey!10282 () (_ BitVec 32))

(declare-fun mapValue!10282 () ValueCell!2694)

(assert (=> mapNonEmpty!10282 (= (arr!5416 (_values!4286 thiss!1504)) (store mapRest!10282 mapKey!10282 mapValue!10282))))

(declare-fun b!231064 () Bool)

(declare-fun e!149990 () Bool)

(declare-fun e!149987 () Bool)

(assert (=> b!231064 (= e!149990 e!149987)))

(declare-fun res!113588 () Bool)

(assert (=> b!231064 (=> (not res!113588) (not e!149987))))

(declare-datatypes ((SeekEntryResult!946 0))(
  ( (MissingZero!946 (index!5954 (_ BitVec 32))) (Found!946 (index!5955 (_ BitVec 32))) (Intermediate!946 (undefined!1758 Bool) (index!5956 (_ BitVec 32)) (x!23478 (_ BitVec 32))) (Undefined!946) (MissingVacant!946 (index!5957 (_ BitVec 32))) )
))
(declare-fun lt!116407 () SeekEntryResult!946)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231064 (= res!113588 (or (= lt!116407 (MissingZero!946 index!297)) (= lt!116407 (MissingVacant!946 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11395 (_ BitVec 32)) SeekEntryResult!946)

(assert (=> b!231064 (= lt!116407 (seekEntryOrOpen!0 key!932 (_keys!6357 thiss!1504) (mask!10201 thiss!1504)))))

(declare-fun mapIsEmpty!10282 () Bool)

(assert (=> mapIsEmpty!10282 mapRes!10282))

(declare-fun b!231065 () Bool)

(declare-fun c!38373 () Bool)

(get-info :version)

(assert (=> b!231065 (= c!38373 ((_ is MissingVacant!946) lt!116407))))

(declare-fun e!149984 () Bool)

(assert (=> b!231065 (= e!149988 e!149984)))

(declare-fun b!231066 () Bool)

(declare-fun e!149981 () Bool)

(assert (=> b!231066 (= e!149981 (not call!21473))))

(declare-fun b!231067 () Bool)

(declare-fun e!149979 () Bool)

(declare-fun tp_is_empty!6075 () Bool)

(assert (=> b!231067 (= e!149979 tp_is_empty!6075)))

(declare-fun b!231068 () Bool)

(declare-fun res!113593 () Bool)

(assert (=> b!231068 (=> (not res!113593) (not e!149986))))

(assert (=> b!231068 (= res!113593 (= (select (arr!5417 (_keys!6357 thiss!1504)) (index!5954 lt!116407)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!38374 () Bool)

(declare-fun bm!21471 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21471 (= call!21474 (inRange!0 (ite c!38374 (index!5954 lt!116407) (index!5957 lt!116407)) (mask!10201 thiss!1504)))))

(declare-fun res!113586 () Bool)

(assert (=> start!22146 (=> (not res!113586) (not e!149990))))

(declare-fun valid!1307 (LongMapFixedSize!3288) Bool)

(assert (=> start!22146 (= res!113586 (valid!1307 thiss!1504))))

(assert (=> start!22146 e!149990))

(declare-fun e!149989 () Bool)

(assert (=> start!22146 e!149989))

(assert (=> start!22146 true))

(assert (=> start!22146 tp_is_empty!6075))

(declare-fun b!231069 () Bool)

(declare-fun lt!116406 () Unit!7095)

(assert (=> b!231069 (= e!149980 lt!116406)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!314 (array!11395 array!11393 (_ BitVec 32) (_ BitVec 32) V!7747 V!7747 (_ BitVec 64) Int) Unit!7095)

(assert (=> b!231069 (= lt!116406 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!314 (_keys!6357 thiss!1504) (_values!4286 thiss!1504) (mask!10201 thiss!1504) (extraKeys!4040 thiss!1504) (zeroValue!4144 thiss!1504) (minValue!4144 thiss!1504) key!932 (defaultEntry!4303 thiss!1504)))))

(assert (=> b!231069 (= c!38374 ((_ is MissingZero!946) lt!116407))))

(assert (=> b!231069 e!149988))

(declare-fun b!231070 () Bool)

(assert (=> b!231070 (= e!149984 ((_ is Undefined!946) lt!116407))))

(declare-fun b!231071 () Bool)

(declare-fun e!149977 () Bool)

(assert (=> b!231071 (= e!149977 (not true))))

(declare-fun lt!116401 () array!11395)

(declare-fun arrayCountValidKeys!0 (array!11395 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231071 (= (arrayCountValidKeys!0 lt!116401 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116411 () Unit!7095)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11395 (_ BitVec 32)) Unit!7095)

(assert (=> b!231071 (= lt!116411 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116401 index!297))))

(assert (=> b!231071 (arrayContainsKey!0 lt!116401 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116413 () Unit!7095)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11395 (_ BitVec 64) (_ BitVec 32)) Unit!7095)

(assert (=> b!231071 (= lt!116413 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116401 key!932 index!297))))

(declare-datatypes ((tuple2!4548 0))(
  ( (tuple2!4549 (_1!2285 (_ BitVec 64)) (_2!2285 V!7747)) )
))
(declare-datatypes ((List!3468 0))(
  ( (Nil!3465) (Cons!3464 (h!4112 tuple2!4548) (t!8427 List!3468)) )
))
(declare-datatypes ((ListLongMap!3461 0))(
  ( (ListLongMap!3462 (toList!1746 List!3468)) )
))
(declare-fun lt!116408 () ListLongMap!3461)

(declare-fun v!346 () V!7747)

(declare-fun +!611 (ListLongMap!3461 tuple2!4548) ListLongMap!3461)

(declare-fun getCurrentListMap!1274 (array!11395 array!11393 (_ BitVec 32) (_ BitVec 32) V!7747 V!7747 (_ BitVec 32) Int) ListLongMap!3461)

(assert (=> b!231071 (= (+!611 lt!116408 (tuple2!4549 key!932 v!346)) (getCurrentListMap!1274 lt!116401 (array!11394 (store (arr!5416 (_values!4286 thiss!1504)) index!297 (ValueCellFull!2694 v!346)) (size!5749 (_values!4286 thiss!1504))) (mask!10201 thiss!1504) (extraKeys!4040 thiss!1504) (zeroValue!4144 thiss!1504) (minValue!4144 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4303 thiss!1504)))))

(declare-fun lt!116414 () Unit!7095)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!65 (array!11395 array!11393 (_ BitVec 32) (_ BitVec 32) V!7747 V!7747 (_ BitVec 32) (_ BitVec 64) V!7747 Int) Unit!7095)

(assert (=> b!231071 (= lt!116414 (lemmaAddValidKeyToArrayThenAddPairToListMap!65 (_keys!6357 thiss!1504) (_values!4286 thiss!1504) (mask!10201 thiss!1504) (extraKeys!4040 thiss!1504) (zeroValue!4144 thiss!1504) (minValue!4144 thiss!1504) index!297 key!932 v!346 (defaultEntry!4303 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11395 (_ BitVec 32)) Bool)

(assert (=> b!231071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116401 (mask!10201 thiss!1504))))

(declare-fun lt!116410 () Unit!7095)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11395 (_ BitVec 32) (_ BitVec 32)) Unit!7095)

(assert (=> b!231071 (= lt!116410 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6357 thiss!1504) index!297 (mask!10201 thiss!1504)))))

(assert (=> b!231071 (= (arrayCountValidKeys!0 lt!116401 #b00000000000000000000000000000000 (size!5750 (_keys!6357 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6357 thiss!1504) #b00000000000000000000000000000000 (size!5750 (_keys!6357 thiss!1504)))))))

(declare-fun lt!116405 () Unit!7095)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11395 (_ BitVec 32) (_ BitVec 64)) Unit!7095)

(assert (=> b!231071 (= lt!116405 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6357 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3469 0))(
  ( (Nil!3466) (Cons!3465 (h!4113 (_ BitVec 64)) (t!8428 List!3469)) )
))
(declare-fun arrayNoDuplicates!0 (array!11395 (_ BitVec 32) List!3469) Bool)

(assert (=> b!231071 (arrayNoDuplicates!0 lt!116401 #b00000000000000000000000000000000 Nil!3466)))

(assert (=> b!231071 (= lt!116401 (array!11396 (store (arr!5417 (_keys!6357 thiss!1504)) index!297 key!932) (size!5750 (_keys!6357 thiss!1504))))))

(declare-fun lt!116402 () Unit!7095)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11395 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3469) Unit!7095)

(assert (=> b!231071 (= lt!116402 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6357 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3466))))

(declare-fun lt!116404 () Unit!7095)

(assert (=> b!231071 (= lt!116404 e!149985)))

(declare-fun c!38375 () Bool)

(assert (=> b!231071 (= c!38375 (arrayContainsKey!0 (_keys!6357 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231072 () Bool)

(declare-fun res!113589 () Bool)

(assert (=> b!231072 (=> (not res!113589) (not e!149990))))

(assert (=> b!231072 (= res!113589 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231073 () Bool)

(assert (=> b!231073 (= e!149982 tp_is_empty!6075)))

(declare-fun b!231074 () Bool)

(assert (=> b!231074 (= e!149984 e!149981)))

(declare-fun res!113587 () Bool)

(assert (=> b!231074 (= res!113587 call!21474)))

(assert (=> b!231074 (=> (not res!113587) (not e!149981))))

(declare-fun b!231075 () Bool)

(assert (=> b!231075 (= e!149986 (not call!21473))))

(declare-fun b!231076 () Bool)

(declare-fun e!149978 () Bool)

(assert (=> b!231076 (= e!149978 (and e!149979 mapRes!10282))))

(declare-fun condMapEmpty!10282 () Bool)

(declare-fun mapDefault!10282 () ValueCell!2694)

(assert (=> b!231076 (= condMapEmpty!10282 (= (arr!5416 (_values!4286 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2694)) mapDefault!10282)))))

(declare-fun array_inv!3571 (array!11395) Bool)

(declare-fun array_inv!3572 (array!11393) Bool)

(assert (=> b!231077 (= e!149989 (and tp!21780 tp_is_empty!6075 (array_inv!3571 (_keys!6357 thiss!1504)) (array_inv!3572 (_values!4286 thiss!1504)) e!149978))))

(declare-fun b!231078 () Bool)

(declare-fun res!113592 () Bool)

(assert (=> b!231078 (= res!113592 (= (select (arr!5417 (_keys!6357 thiss!1504)) (index!5957 lt!116407)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231078 (=> (not res!113592) (not e!149981))))

(declare-fun b!231079 () Bool)

(assert (=> b!231079 (= e!149987 e!149977)))

(declare-fun res!113590 () Bool)

(assert (=> b!231079 (=> (not res!113590) (not e!149977))))

(assert (=> b!231079 (= res!113590 (inRange!0 index!297 (mask!10201 thiss!1504)))))

(declare-fun lt!116403 () Unit!7095)

(assert (=> b!231079 (= lt!116403 e!149980)))

(declare-fun c!38376 () Bool)

(declare-fun contains!1618 (ListLongMap!3461 (_ BitVec 64)) Bool)

(assert (=> b!231079 (= c!38376 (contains!1618 lt!116408 key!932))))

(assert (=> b!231079 (= lt!116408 (getCurrentListMap!1274 (_keys!6357 thiss!1504) (_values!4286 thiss!1504) (mask!10201 thiss!1504) (extraKeys!4040 thiss!1504) (zeroValue!4144 thiss!1504) (minValue!4144 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4303 thiss!1504)))))

(assert (= (and start!22146 res!113586) b!231072))

(assert (= (and b!231072 res!113589) b!231064))

(assert (= (and b!231064 res!113588) b!231079))

(assert (= (and b!231079 c!38376) b!231060))

(assert (= (and b!231079 (not c!38376)) b!231069))

(assert (= (and b!231069 c!38374) b!231062))

(assert (= (and b!231069 (not c!38374)) b!231065))

(assert (= (and b!231062 res!113591) b!231068))

(assert (= (and b!231068 res!113593) b!231075))

(assert (= (and b!231065 c!38373) b!231074))

(assert (= (and b!231065 (not c!38373)) b!231070))

(assert (= (and b!231074 res!113587) b!231078))

(assert (= (and b!231078 res!113592) b!231066))

(assert (= (or b!231062 b!231074) bm!21471))

(assert (= (or b!231075 b!231066) bm!21470))

(assert (= (and b!231079 res!113590) b!231071))

(assert (= (and b!231071 c!38375) b!231063))

(assert (= (and b!231071 (not c!38375)) b!231061))

(assert (= (and b!231076 condMapEmpty!10282) mapIsEmpty!10282))

(assert (= (and b!231076 (not condMapEmpty!10282)) mapNonEmpty!10282))

(assert (= (and mapNonEmpty!10282 ((_ is ValueCellFull!2694) mapValue!10282)) b!231073))

(assert (= (and b!231076 ((_ is ValueCellFull!2694) mapDefault!10282)) b!231067))

(assert (= b!231077 b!231076))

(assert (= start!22146 b!231077))

(declare-fun m!252439 () Bool)

(assert (=> b!231060 m!252439))

(declare-fun m!252441 () Bool)

(assert (=> b!231068 m!252441))

(declare-fun m!252443 () Bool)

(assert (=> b!231069 m!252443))

(declare-fun m!252445 () Bool)

(assert (=> b!231077 m!252445))

(declare-fun m!252447 () Bool)

(assert (=> b!231077 m!252447))

(declare-fun m!252449 () Bool)

(assert (=> bm!21470 m!252449))

(declare-fun m!252451 () Bool)

(assert (=> bm!21471 m!252451))

(declare-fun m!252453 () Bool)

(assert (=> start!22146 m!252453))

(declare-fun m!252455 () Bool)

(assert (=> b!231064 m!252455))

(declare-fun m!252457 () Bool)

(assert (=> b!231071 m!252457))

(declare-fun m!252459 () Bool)

(assert (=> b!231071 m!252459))

(declare-fun m!252461 () Bool)

(assert (=> b!231071 m!252461))

(declare-fun m!252463 () Bool)

(assert (=> b!231071 m!252463))

(declare-fun m!252465 () Bool)

(assert (=> b!231071 m!252465))

(declare-fun m!252467 () Bool)

(assert (=> b!231071 m!252467))

(declare-fun m!252469 () Bool)

(assert (=> b!231071 m!252469))

(declare-fun m!252471 () Bool)

(assert (=> b!231071 m!252471))

(declare-fun m!252473 () Bool)

(assert (=> b!231071 m!252473))

(declare-fun m!252475 () Bool)

(assert (=> b!231071 m!252475))

(assert (=> b!231071 m!252449))

(declare-fun m!252477 () Bool)

(assert (=> b!231071 m!252477))

(declare-fun m!252479 () Bool)

(assert (=> b!231071 m!252479))

(declare-fun m!252481 () Bool)

(assert (=> b!231071 m!252481))

(declare-fun m!252483 () Bool)

(assert (=> b!231071 m!252483))

(declare-fun m!252485 () Bool)

(assert (=> b!231071 m!252485))

(declare-fun m!252487 () Bool)

(assert (=> b!231071 m!252487))

(declare-fun m!252489 () Bool)

(assert (=> b!231078 m!252489))

(declare-fun m!252491 () Bool)

(assert (=> b!231079 m!252491))

(declare-fun m!252493 () Bool)

(assert (=> b!231079 m!252493))

(declare-fun m!252495 () Bool)

(assert (=> b!231079 m!252495))

(declare-fun m!252497 () Bool)

(assert (=> mapNonEmpty!10282 m!252497))

(declare-fun m!252499 () Bool)

(assert (=> b!231063 m!252499))

(check-sat (not bm!21471) (not b!231069) (not bm!21470) (not b!231060) (not b!231079) tp_is_empty!6075 (not start!22146) (not b!231077) (not b!231064) (not b_next!6213) (not b!231063) b_and!13111 (not b!231071) (not mapNonEmpty!10282))
(check-sat b_and!13111 (not b_next!6213))
