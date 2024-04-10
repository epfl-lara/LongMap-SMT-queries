; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24008 () Bool)

(assert start!24008)

(declare-fun b!251362 () Bool)

(declare-fun b_free!6637 () Bool)

(declare-fun b_next!6637 () Bool)

(assert (=> b!251362 (= b_free!6637 (not b_next!6637))))

(declare-fun tp!23183 () Bool)

(declare-fun b_and!13665 () Bool)

(assert (=> b!251362 (= tp!23183 b_and!13665)))

(declare-fun b!251346 () Bool)

(declare-fun e!163002 () Bool)

(declare-datatypes ((SeekEntryResult!1126 0))(
  ( (MissingZero!1126 (index!6674 (_ BitVec 32))) (Found!1126 (index!6675 (_ BitVec 32))) (Intermediate!1126 (undefined!1938 Bool) (index!6676 (_ BitVec 32)) (x!24720 (_ BitVec 32))) (Undefined!1126) (MissingVacant!1126 (index!6677 (_ BitVec 32))) )
))
(declare-fun lt!125962 () SeekEntryResult!1126)

(assert (=> b!251346 (= e!163002 (is-Undefined!1126 lt!125962))))

(declare-fun b!251347 () Bool)

(declare-datatypes ((Unit!7776 0))(
  ( (Unit!7777) )
))
(declare-fun e!163011 () Unit!7776)

(declare-fun Unit!7778 () Unit!7776)

(assert (=> b!251347 (= e!163011 Unit!7778)))

(declare-fun lt!125963 () Unit!7776)

(declare-datatypes ((V!8313 0))(
  ( (V!8314 (val!3294 Int)) )
))
(declare-datatypes ((ValueCell!2906 0))(
  ( (ValueCellFull!2906 (v!5362 V!8313)) (EmptyCell!2906) )
))
(declare-datatypes ((array!12319 0))(
  ( (array!12320 (arr!5840 (Array (_ BitVec 32) ValueCell!2906)) (size!6186 (_ BitVec 32))) )
))
(declare-datatypes ((array!12321 0))(
  ( (array!12322 (arr!5841 (Array (_ BitVec 32) (_ BitVec 64))) (size!6187 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3712 0))(
  ( (LongMapFixedSize!3713 (defaultEntry!4645 Int) (mask!10846 (_ BitVec 32)) (extraKeys!4382 (_ BitVec 32)) (zeroValue!4486 V!8313) (minValue!4486 V!8313) (_size!1905 (_ BitVec 32)) (_keys!6787 array!12321) (_values!4628 array!12319) (_vacant!1905 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3712)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!401 (array!12321 array!12319 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) Int) Unit!7776)

(assert (=> b!251347 (= lt!125963 (lemmaInListMapThenSeekEntryOrOpenFindsIt!401 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)))))

(assert (=> b!251347 false))

(declare-fun b!251348 () Bool)

(declare-fun e!163013 () Bool)

(declare-fun call!23647 () Bool)

(assert (=> b!251348 (= e!163013 (not call!23647))))

(declare-fun b!251349 () Bool)

(declare-fun e!163009 () Unit!7776)

(declare-fun Unit!7779 () Unit!7776)

(assert (=> b!251349 (= e!163009 Unit!7779)))

(declare-fun mapIsEmpty!11048 () Bool)

(declare-fun mapRes!11048 () Bool)

(assert (=> mapIsEmpty!11048 mapRes!11048))

(declare-fun b!251350 () Bool)

(declare-fun res!123072 () Bool)

(declare-fun e!163008 () Bool)

(assert (=> b!251350 (=> (not res!123072) (not e!163008))))

(assert (=> b!251350 (= res!123072 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!251351 () Bool)

(declare-fun res!123068 () Bool)

(assert (=> b!251351 (=> (not res!123068) (not e!163013))))

(declare-fun call!23646 () Bool)

(assert (=> b!251351 (= res!123068 call!23646)))

(declare-fun e!163007 () Bool)

(assert (=> b!251351 (= e!163007 e!163013)))

(declare-fun b!251352 () Bool)

(declare-fun e!163000 () Bool)

(assert (=> b!251352 (= e!163008 e!163000)))

(declare-fun res!123067 () Bool)

(assert (=> b!251352 (=> (not res!123067) (not e!163000))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!251352 (= res!123067 (or (= lt!125962 (MissingZero!1126 index!297)) (= lt!125962 (MissingVacant!1126 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12321 (_ BitVec 32)) SeekEntryResult!1126)

(assert (=> b!251352 (= lt!125962 (seekEntryOrOpen!0 key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(declare-fun b!251353 () Bool)

(declare-fun res!123066 () Bool)

(assert (=> b!251353 (=> (not res!123066) (not e!163013))))

(assert (=> b!251353 (= res!123066 (= (select (arr!5841 (_keys!6787 thiss!1504)) (index!6674 lt!125962)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251354 () Bool)

(declare-fun e!163005 () Bool)

(assert (=> b!251354 (= e!163000 e!163005)))

(declare-fun res!123069 () Bool)

(assert (=> b!251354 (=> (not res!123069) (not e!163005))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251354 (= res!123069 (inRange!0 index!297 (mask!10846 thiss!1504)))))

(declare-fun lt!125968 () Unit!7776)

(assert (=> b!251354 (= lt!125968 e!163011)))

(declare-fun c!42291 () Bool)

(declare-datatypes ((tuple2!4850 0))(
  ( (tuple2!4851 (_1!2436 (_ BitVec 64)) (_2!2436 V!8313)) )
))
(declare-datatypes ((List!3730 0))(
  ( (Nil!3727) (Cons!3726 (h!4387 tuple2!4850) (t!8767 List!3730)) )
))
(declare-datatypes ((ListLongMap!3763 0))(
  ( (ListLongMap!3764 (toList!1897 List!3730)) )
))
(declare-fun contains!1821 (ListLongMap!3763 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1425 (array!12321 array!12319 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 32) Int) ListLongMap!3763)

(assert (=> b!251354 (= c!42291 (contains!1821 (getCurrentListMap!1425 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) key!932))))

(declare-fun res!123071 () Bool)

(assert (=> start!24008 (=> (not res!123071) (not e!163008))))

(declare-fun valid!1451 (LongMapFixedSize!3712) Bool)

(assert (=> start!24008 (= res!123071 (valid!1451 thiss!1504))))

(assert (=> start!24008 e!163008))

(declare-fun e!163001 () Bool)

(assert (=> start!24008 e!163001))

(assert (=> start!24008 true))

(declare-fun b!251355 () Bool)

(declare-fun e!163004 () Bool)

(declare-fun tp_is_empty!6499 () Bool)

(assert (=> b!251355 (= e!163004 tp_is_empty!6499)))

(declare-fun b!251356 () Bool)

(declare-fun c!42290 () Bool)

(assert (=> b!251356 (= c!42290 (is-MissingVacant!1126 lt!125962))))

(assert (=> b!251356 (= e!163007 e!163002)))

(declare-fun b!251357 () Bool)

(declare-fun e!163014 () Bool)

(assert (=> b!251357 (= e!163014 (or (not (= (size!6186 (_values!4628 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10846 thiss!1504)))) (not (= (size!6187 (_keys!6787 thiss!1504)) (size!6186 (_values!4628 thiss!1504)))) (bvslt (mask!10846 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4382 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4382 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11048 () Bool)

(declare-fun tp!23182 () Bool)

(assert (=> mapNonEmpty!11048 (= mapRes!11048 (and tp!23182 e!163004))))

(declare-fun mapRest!11048 () (Array (_ BitVec 32) ValueCell!2906))

(declare-fun mapValue!11048 () ValueCell!2906)

(declare-fun mapKey!11048 () (_ BitVec 32))

(assert (=> mapNonEmpty!11048 (= (arr!5840 (_values!4628 thiss!1504)) (store mapRest!11048 mapKey!11048 mapValue!11048))))

(declare-fun b!251358 () Bool)

(declare-fun e!163003 () Bool)

(assert (=> b!251358 (= e!163003 tp_is_empty!6499)))

(declare-fun b!251359 () Bool)

(declare-fun res!123073 () Bool)

(assert (=> b!251359 (= res!123073 (= (select (arr!5841 (_keys!6787 thiss!1504)) (index!6677 lt!125962)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163010 () Bool)

(assert (=> b!251359 (=> (not res!123073) (not e!163010))))

(declare-fun b!251360 () Bool)

(assert (=> b!251360 (= e!163010 (not call!23647))))

(declare-fun bm!23643 () Bool)

(declare-fun arrayContainsKey!0 (array!12321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23643 (= call!23647 (arrayContainsKey!0 (_keys!6787 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251361 () Bool)

(assert (=> b!251361 (= e!163002 e!163010)))

(declare-fun res!123065 () Bool)

(assert (=> b!251361 (= res!123065 call!23646)))

(assert (=> b!251361 (=> (not res!123065) (not e!163010))))

(declare-fun e!163006 () Bool)

(declare-fun array_inv!3857 (array!12321) Bool)

(declare-fun array_inv!3858 (array!12319) Bool)

(assert (=> b!251362 (= e!163001 (and tp!23183 tp_is_empty!6499 (array_inv!3857 (_keys!6787 thiss!1504)) (array_inv!3858 (_values!4628 thiss!1504)) e!163006))))

(declare-fun b!251363 () Bool)

(assert (=> b!251363 (= e!163005 (not e!163014))))

(declare-fun res!123070 () Bool)

(assert (=> b!251363 (=> res!123070 e!163014)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!251363 (= res!123070 (not (validMask!0 (mask!10846 thiss!1504))))))

(declare-fun lt!125959 () array!12321)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12321 (_ BitVec 32)) Bool)

(assert (=> b!251363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125959 (mask!10846 thiss!1504))))

(declare-fun lt!125966 () Unit!7776)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12321 (_ BitVec 32) (_ BitVec 32)) Unit!7776)

(assert (=> b!251363 (= lt!125966 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6787 thiss!1504) index!297 (mask!10846 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12321 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251363 (= (arrayCountValidKeys!0 lt!125959 #b00000000000000000000000000000000 (size!6187 (_keys!6787 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6787 thiss!1504) #b00000000000000000000000000000000 (size!6187 (_keys!6787 thiss!1504)))))))

(declare-fun lt!125965 () Unit!7776)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12321 (_ BitVec 32) (_ BitVec 64)) Unit!7776)

(assert (=> b!251363 (= lt!125965 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6787 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3731 0))(
  ( (Nil!3728) (Cons!3727 (h!4388 (_ BitVec 64)) (t!8768 List!3731)) )
))
(declare-fun arrayNoDuplicates!0 (array!12321 (_ BitVec 32) List!3731) Bool)

(assert (=> b!251363 (arrayNoDuplicates!0 lt!125959 #b00000000000000000000000000000000 Nil!3728)))

(assert (=> b!251363 (= lt!125959 (array!12322 (store (arr!5841 (_keys!6787 thiss!1504)) index!297 key!932) (size!6187 (_keys!6787 thiss!1504))))))

(declare-fun lt!125964 () Unit!7776)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12321 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3731) Unit!7776)

(assert (=> b!251363 (= lt!125964 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6787 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3728))))

(declare-fun lt!125960 () Unit!7776)

(assert (=> b!251363 (= lt!125960 e!163009)))

(declare-fun c!42293 () Bool)

(assert (=> b!251363 (= c!42293 (arrayContainsKey!0 (_keys!6787 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251364 () Bool)

(declare-fun lt!125961 () Unit!7776)

(assert (=> b!251364 (= e!163011 lt!125961)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!404 (array!12321 array!12319 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) Int) Unit!7776)

(assert (=> b!251364 (= lt!125961 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!404 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)))))

(declare-fun c!42292 () Bool)

(assert (=> b!251364 (= c!42292 (is-MissingZero!1126 lt!125962))))

(assert (=> b!251364 e!163007))

(declare-fun b!251365 () Bool)

(declare-fun Unit!7780 () Unit!7776)

(assert (=> b!251365 (= e!163009 Unit!7780)))

(declare-fun lt!125967 () Unit!7776)

(declare-fun lemmaArrayContainsKeyThenInListMap!204 (array!12321 array!12319 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) (_ BitVec 32) Int) Unit!7776)

(assert (=> b!251365 (= lt!125967 (lemmaArrayContainsKeyThenInListMap!204 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(assert (=> b!251365 false))

(declare-fun bm!23644 () Bool)

(assert (=> bm!23644 (= call!23646 (inRange!0 (ite c!42292 (index!6674 lt!125962) (index!6677 lt!125962)) (mask!10846 thiss!1504)))))

(declare-fun b!251366 () Bool)

(assert (=> b!251366 (= e!163006 (and e!163003 mapRes!11048))))

(declare-fun condMapEmpty!11048 () Bool)

(declare-fun mapDefault!11048 () ValueCell!2906)

