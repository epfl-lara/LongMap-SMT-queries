; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22174 () Bool)

(assert start!22174)

(declare-fun b!231913 () Bool)

(declare-fun b_free!6241 () Bool)

(declare-fun b_next!6241 () Bool)

(assert (=> b!231913 (= b_free!6241 (not b_next!6241))))

(declare-fun tp!21864 () Bool)

(declare-fun b_and!13139 () Bool)

(assert (=> b!231913 (= tp!21864 b_and!13139)))

(declare-fun b!231900 () Bool)

(declare-fun e!150570 () Bool)

(declare-datatypes ((SeekEntryResult!957 0))(
  ( (MissingZero!957 (index!5998 (_ BitVec 32))) (Found!957 (index!5999 (_ BitVec 32))) (Intermediate!957 (undefined!1769 Bool) (index!6000 (_ BitVec 32)) (x!23529 (_ BitVec 32))) (Undefined!957) (MissingVacant!957 (index!6001 (_ BitVec 32))) )
))
(declare-fun lt!116996 () SeekEntryResult!957)

(assert (=> b!231900 (= e!150570 (is-Undefined!957 lt!116996))))

(declare-fun c!38541 () Bool)

(declare-datatypes ((V!7785 0))(
  ( (V!7786 (val!3096 Int)) )
))
(declare-datatypes ((ValueCell!2708 0))(
  ( (ValueCellFull!2708 (v!5116 V!7785)) (EmptyCell!2708) )
))
(declare-datatypes ((array!11449 0))(
  ( (array!11450 (arr!5444 (Array (_ BitVec 32) ValueCell!2708)) (size!5777 (_ BitVec 32))) )
))
(declare-datatypes ((array!11451 0))(
  ( (array!11452 (arr!5445 (Array (_ BitVec 32) (_ BitVec 64))) (size!5778 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3316 0))(
  ( (LongMapFixedSize!3317 (defaultEntry!4317 Int) (mask!10225 (_ BitVec 32)) (extraKeys!4054 (_ BitVec 32)) (zeroValue!4158 V!7785) (minValue!4158 V!7785) (_size!1707 (_ BitVec 32)) (_keys!6371 array!11451) (_values!4300 array!11449) (_vacant!1707 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3316)

(declare-fun call!21558 () Bool)

(declare-fun bm!21554 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21554 (= call!21558 (inRange!0 (ite c!38541 (index!5998 lt!116996) (index!6001 lt!116996)) (mask!10225 thiss!1504)))))

(declare-fun b!231901 () Bool)

(declare-fun e!150566 () Bool)

(declare-fun call!21557 () Bool)

(assert (=> b!231901 (= e!150566 (not call!21557))))

(declare-fun b!231902 () Bool)

(declare-datatypes ((Unit!7147 0))(
  ( (Unit!7148) )
))
(declare-fun e!150569 () Unit!7147)

(declare-fun Unit!7149 () Unit!7147)

(assert (=> b!231902 (= e!150569 Unit!7149)))

(declare-fun lt!116998 () Unit!7147)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!305 (array!11451 array!11449 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 64) Int) Unit!7147)

(assert (=> b!231902 (= lt!116998 (lemmaInListMapThenSeekEntryOrOpenFindsIt!305 (_keys!6371 thiss!1504) (_values!4300 thiss!1504) (mask!10225 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) key!932 (defaultEntry!4317 thiss!1504)))))

(assert (=> b!231902 false))

(declare-fun mapIsEmpty!10324 () Bool)

(declare-fun mapRes!10324 () Bool)

(assert (=> mapIsEmpty!10324 mapRes!10324))

(declare-fun b!231903 () Bool)

(declare-fun e!150571 () Bool)

(declare-fun tp_is_empty!6103 () Bool)

(assert (=> b!231903 (= e!150571 tp_is_empty!6103)))

(declare-fun b!231904 () Bool)

(declare-fun res!113926 () Bool)

(assert (=> b!231904 (=> (not res!113926) (not e!150566))))

(assert (=> b!231904 (= res!113926 call!21558)))

(declare-fun e!150565 () Bool)

(assert (=> b!231904 (= e!150565 e!150566)))

(declare-fun b!231905 () Bool)

(declare-fun res!113929 () Bool)

(assert (=> b!231905 (= res!113929 (= (select (arr!5445 (_keys!6371 thiss!1504)) (index!6001 lt!116996)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!150577 () Bool)

(assert (=> b!231905 (=> (not res!113929) (not e!150577))))

(declare-fun b!231906 () Bool)

(declare-fun e!150567 () Bool)

(assert (=> b!231906 (= e!150567 (not true))))

(declare-fun lt!116990 () array!11451)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11451 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231906 (= (arrayCountValidKeys!0 lt!116990 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116997 () Unit!7147)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11451 (_ BitVec 32)) Unit!7147)

(assert (=> b!231906 (= lt!116997 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116990 index!297))))

(declare-fun arrayContainsKey!0 (array!11451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231906 (arrayContainsKey!0 lt!116990 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117001 () Unit!7147)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11451 (_ BitVec 64) (_ BitVec 32)) Unit!7147)

(assert (=> b!231906 (= lt!117001 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116990 key!932 index!297))))

(declare-fun v!346 () V!7785)

(declare-datatypes ((tuple2!4568 0))(
  ( (tuple2!4569 (_1!2295 (_ BitVec 64)) (_2!2295 V!7785)) )
))
(declare-datatypes ((List!3486 0))(
  ( (Nil!3483) (Cons!3482 (h!4130 tuple2!4568) (t!8445 List!3486)) )
))
(declare-datatypes ((ListLongMap!3481 0))(
  ( (ListLongMap!3482 (toList!1756 List!3486)) )
))
(declare-fun lt!116995 () ListLongMap!3481)

(declare-fun +!619 (ListLongMap!3481 tuple2!4568) ListLongMap!3481)

(declare-fun getCurrentListMap!1284 (array!11451 array!11449 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 32) Int) ListLongMap!3481)

(assert (=> b!231906 (= (+!619 lt!116995 (tuple2!4569 key!932 v!346)) (getCurrentListMap!1284 lt!116990 (array!11450 (store (arr!5444 (_values!4300 thiss!1504)) index!297 (ValueCellFull!2708 v!346)) (size!5777 (_values!4300 thiss!1504))) (mask!10225 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4317 thiss!1504)))))

(declare-fun lt!116992 () Unit!7147)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!73 (array!11451 array!11449 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 32) (_ BitVec 64) V!7785 Int) Unit!7147)

(assert (=> b!231906 (= lt!116992 (lemmaAddValidKeyToArrayThenAddPairToListMap!73 (_keys!6371 thiss!1504) (_values!4300 thiss!1504) (mask!10225 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) index!297 key!932 v!346 (defaultEntry!4317 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11451 (_ BitVec 32)) Bool)

(assert (=> b!231906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116990 (mask!10225 thiss!1504))))

(declare-fun lt!116991 () Unit!7147)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11451 (_ BitVec 32) (_ BitVec 32)) Unit!7147)

(assert (=> b!231906 (= lt!116991 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6371 thiss!1504) index!297 (mask!10225 thiss!1504)))))

(assert (=> b!231906 (= (arrayCountValidKeys!0 lt!116990 #b00000000000000000000000000000000 (size!5778 (_keys!6371 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6371 thiss!1504) #b00000000000000000000000000000000 (size!5778 (_keys!6371 thiss!1504)))))))

(declare-fun lt!116989 () Unit!7147)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11451 (_ BitVec 32) (_ BitVec 64)) Unit!7147)

(assert (=> b!231906 (= lt!116989 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6371 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3487 0))(
  ( (Nil!3484) (Cons!3483 (h!4131 (_ BitVec 64)) (t!8446 List!3487)) )
))
(declare-fun arrayNoDuplicates!0 (array!11451 (_ BitVec 32) List!3487) Bool)

(assert (=> b!231906 (arrayNoDuplicates!0 lt!116990 #b00000000000000000000000000000000 Nil!3484)))

(assert (=> b!231906 (= lt!116990 (array!11452 (store (arr!5445 (_keys!6371 thiss!1504)) index!297 key!932) (size!5778 (_keys!6371 thiss!1504))))))

(declare-fun lt!116993 () Unit!7147)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11451 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3487) Unit!7147)

(assert (=> b!231906 (= lt!116993 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6371 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3484))))

(declare-fun lt!116999 () Unit!7147)

(declare-fun e!150573 () Unit!7147)

(assert (=> b!231906 (= lt!116999 e!150573)))

(declare-fun c!38542 () Bool)

(assert (=> b!231906 (= c!38542 (arrayContainsKey!0 (_keys!6371 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231907 () Bool)

(declare-fun e!150568 () Bool)

(assert (=> b!231907 (= e!150568 tp_is_empty!6103)))

(declare-fun b!231908 () Bool)

(declare-fun e!150578 () Bool)

(assert (=> b!231908 (= e!150578 e!150567)))

(declare-fun res!113923 () Bool)

(assert (=> b!231908 (=> (not res!113923) (not e!150567))))

(assert (=> b!231908 (= res!113923 (inRange!0 index!297 (mask!10225 thiss!1504)))))

(declare-fun lt!117002 () Unit!7147)

(assert (=> b!231908 (= lt!117002 e!150569)))

(declare-fun c!38544 () Bool)

(declare-fun contains!1625 (ListLongMap!3481 (_ BitVec 64)) Bool)

(assert (=> b!231908 (= c!38544 (contains!1625 lt!116995 key!932))))

(assert (=> b!231908 (= lt!116995 (getCurrentListMap!1284 (_keys!6371 thiss!1504) (_values!4300 thiss!1504) (mask!10225 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4317 thiss!1504)))))

(declare-fun b!231909 () Bool)

(declare-fun e!150575 () Bool)

(assert (=> b!231909 (= e!150575 (and e!150571 mapRes!10324))))

(declare-fun condMapEmpty!10324 () Bool)

(declare-fun mapDefault!10324 () ValueCell!2708)

