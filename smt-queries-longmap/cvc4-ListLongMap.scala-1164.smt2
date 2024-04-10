; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24610 () Bool)

(assert start!24610)

(declare-fun b!257656 () Bool)

(declare-fun b_free!6737 () Bool)

(declare-fun b_next!6737 () Bool)

(assert (=> b!257656 (= b_free!6737 (not b_next!6737))))

(declare-fun tp!23520 () Bool)

(declare-fun b_and!13807 () Bool)

(assert (=> b!257656 (= tp!23520 b_and!13807)))

(declare-fun bm!24462 () Bool)

(declare-fun call!24466 () Bool)

(declare-datatypes ((V!8445 0))(
  ( (V!8446 (val!3344 Int)) )
))
(declare-datatypes ((ValueCell!2956 0))(
  ( (ValueCellFull!2956 (v!5439 V!8445)) (EmptyCell!2956) )
))
(declare-datatypes ((array!12543 0))(
  ( (array!12544 (arr!5940 (Array (_ BitVec 32) ValueCell!2956)) (size!6287 (_ BitVec 32))) )
))
(declare-datatypes ((array!12545 0))(
  ( (array!12546 (arr!5941 (Array (_ BitVec 32) (_ BitVec 64))) (size!6288 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3812 0))(
  ( (LongMapFixedSize!3813 (defaultEntry!4754 Int) (mask!11044 (_ BitVec 32)) (extraKeys!4491 (_ BitVec 32)) (zeroValue!4595 V!8445) (minValue!4595 V!8445) (_size!1955 (_ BitVec 32)) (_keys!6922 array!12545) (_values!4737 array!12543) (_vacant!1955 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3812)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24462 (= call!24466 (arrayContainsKey!0 (_keys!6922 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257639 () Bool)

(declare-fun res!126005 () Bool)

(declare-datatypes ((SeekEntryResult!1172 0))(
  ( (MissingZero!1172 (index!6858 (_ BitVec 32))) (Found!1172 (index!6859 (_ BitVec 32))) (Intermediate!1172 (undefined!1984 Bool) (index!6860 (_ BitVec 32)) (x!25022 (_ BitVec 32))) (Undefined!1172) (MissingVacant!1172 (index!6861 (_ BitVec 32))) )
))
(declare-fun lt!129570 () SeekEntryResult!1172)

(assert (=> b!257639 (= res!126005 (= (select (arr!5941 (_keys!6922 thiss!1504)) (index!6861 lt!129570)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167012 () Bool)

(assert (=> b!257639 (=> (not res!126005) (not e!167012))))

(declare-fun b!257640 () Bool)

(declare-datatypes ((Unit!8007 0))(
  ( (Unit!8008) )
))
(declare-fun e!167014 () Unit!8007)

(declare-fun Unit!8009 () Unit!8007)

(assert (=> b!257640 (= e!167014 Unit!8009)))

(declare-fun lt!129575 () Unit!8007)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!435 (array!12545 array!12543 (_ BitVec 32) (_ BitVec 32) V!8445 V!8445 (_ BitVec 64) Int) Unit!8007)

(assert (=> b!257640 (= lt!129575 (lemmaInListMapThenSeekEntryOrOpenFindsIt!435 (_keys!6922 thiss!1504) (_values!4737 thiss!1504) (mask!11044 thiss!1504) (extraKeys!4491 thiss!1504) (zeroValue!4595 thiss!1504) (minValue!4595 thiss!1504) key!932 (defaultEntry!4754 thiss!1504)))))

(assert (=> b!257640 false))

(declare-fun b!257641 () Bool)

(declare-fun e!167011 () Unit!8007)

(declare-fun Unit!8010 () Unit!8007)

(assert (=> b!257641 (= e!167011 Unit!8010)))

(declare-fun lt!129573 () Unit!8007)

(declare-fun lemmaArrayContainsKeyThenInListMap!242 (array!12545 array!12543 (_ BitVec 32) (_ BitVec 32) V!8445 V!8445 (_ BitVec 64) (_ BitVec 32) Int) Unit!8007)

(assert (=> b!257641 (= lt!129573 (lemmaArrayContainsKeyThenInListMap!242 (_keys!6922 thiss!1504) (_values!4737 thiss!1504) (mask!11044 thiss!1504) (extraKeys!4491 thiss!1504) (zeroValue!4595 thiss!1504) (minValue!4595 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4754 thiss!1504)))))

(assert (=> b!257641 false))

(declare-fun b!257642 () Bool)

(declare-fun e!167016 () Bool)

(assert (=> b!257642 (= e!167016 (not call!24466))))

(declare-fun b!257643 () Bool)

(declare-fun lt!129572 () Unit!8007)

(assert (=> b!257643 (= e!167014 lt!129572)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!438 (array!12545 array!12543 (_ BitVec 32) (_ BitVec 32) V!8445 V!8445 (_ BitVec 64) Int) Unit!8007)

(assert (=> b!257643 (= lt!129572 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!438 (_keys!6922 thiss!1504) (_values!4737 thiss!1504) (mask!11044 thiss!1504) (extraKeys!4491 thiss!1504) (zeroValue!4595 thiss!1504) (minValue!4595 thiss!1504) key!932 (defaultEntry!4754 thiss!1504)))))

(declare-fun c!43608 () Bool)

(assert (=> b!257643 (= c!43608 (is-MissingZero!1172 lt!129570))))

(declare-fun e!167018 () Bool)

(assert (=> b!257643 e!167018))

(declare-fun b!257644 () Bool)

(declare-fun e!167020 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!257644 (= e!167020 (not (validMask!0 (mask!11044 thiss!1504))))))

(declare-fun lt!129566 () array!12545)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12545 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!257644 (= (arrayCountValidKeys!0 lt!129566 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!129571 () Unit!8007)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12545 (_ BitVec 32)) Unit!8007)

(assert (=> b!257644 (= lt!129571 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129566 index!297))))

(assert (=> b!257644 (arrayContainsKey!0 lt!129566 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129577 () Unit!8007)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12545 (_ BitVec 64) (_ BitVec 32)) Unit!8007)

(assert (=> b!257644 (= lt!129577 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129566 key!932 index!297))))

(declare-fun v!346 () V!8445)

(declare-datatypes ((tuple2!4928 0))(
  ( (tuple2!4929 (_1!2475 (_ BitVec 64)) (_2!2475 V!8445)) )
))
(declare-datatypes ((List!3807 0))(
  ( (Nil!3804) (Cons!3803 (h!4465 tuple2!4928) (t!8868 List!3807)) )
))
(declare-datatypes ((ListLongMap!3841 0))(
  ( (ListLongMap!3842 (toList!1936 List!3807)) )
))
(declare-fun lt!129567 () ListLongMap!3841)

(declare-fun +!690 (ListLongMap!3841 tuple2!4928) ListLongMap!3841)

(declare-fun getCurrentListMap!1464 (array!12545 array!12543 (_ BitVec 32) (_ BitVec 32) V!8445 V!8445 (_ BitVec 32) Int) ListLongMap!3841)

(assert (=> b!257644 (= (+!690 lt!129567 (tuple2!4929 key!932 v!346)) (getCurrentListMap!1464 lt!129566 (array!12544 (store (arr!5940 (_values!4737 thiss!1504)) index!297 (ValueCellFull!2956 v!346)) (size!6287 (_values!4737 thiss!1504))) (mask!11044 thiss!1504) (extraKeys!4491 thiss!1504) (zeroValue!4595 thiss!1504) (minValue!4595 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4754 thiss!1504)))))

(declare-fun lt!129576 () Unit!8007)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!100 (array!12545 array!12543 (_ BitVec 32) (_ BitVec 32) V!8445 V!8445 (_ BitVec 32) (_ BitVec 64) V!8445 Int) Unit!8007)

(assert (=> b!257644 (= lt!129576 (lemmaAddValidKeyToArrayThenAddPairToListMap!100 (_keys!6922 thiss!1504) (_values!4737 thiss!1504) (mask!11044 thiss!1504) (extraKeys!4491 thiss!1504) (zeroValue!4595 thiss!1504) (minValue!4595 thiss!1504) index!297 key!932 v!346 (defaultEntry!4754 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12545 (_ BitVec 32)) Bool)

(assert (=> b!257644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129566 (mask!11044 thiss!1504))))

(declare-fun lt!129578 () Unit!8007)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12545 (_ BitVec 32) (_ BitVec 32)) Unit!8007)

(assert (=> b!257644 (= lt!129578 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6922 thiss!1504) index!297 (mask!11044 thiss!1504)))))

(assert (=> b!257644 (= (arrayCountValidKeys!0 lt!129566 #b00000000000000000000000000000000 (size!6288 (_keys!6922 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6922 thiss!1504) #b00000000000000000000000000000000 (size!6288 (_keys!6922 thiss!1504)))))))

(declare-fun lt!129574 () Unit!8007)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12545 (_ BitVec 32) (_ BitVec 64)) Unit!8007)

(assert (=> b!257644 (= lt!129574 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6922 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3808 0))(
  ( (Nil!3805) (Cons!3804 (h!4466 (_ BitVec 64)) (t!8869 List!3808)) )
))
(declare-fun arrayNoDuplicates!0 (array!12545 (_ BitVec 32) List!3808) Bool)

(assert (=> b!257644 (arrayNoDuplicates!0 lt!129566 #b00000000000000000000000000000000 Nil!3805)))

(assert (=> b!257644 (= lt!129566 (array!12546 (store (arr!5941 (_keys!6922 thiss!1504)) index!297 key!932) (size!6288 (_keys!6922 thiss!1504))))))

(declare-fun lt!129565 () Unit!8007)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12545 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3808) Unit!8007)

(assert (=> b!257644 (= lt!129565 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6922 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3805))))

(declare-fun lt!129569 () Unit!8007)

(assert (=> b!257644 (= lt!129569 e!167011)))

(declare-fun c!43606 () Bool)

(assert (=> b!257644 (= c!43606 (arrayContainsKey!0 (_keys!6922 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257645 () Bool)

(declare-fun e!167010 () Bool)

(declare-fun e!167009 () Bool)

(declare-fun mapRes!11235 () Bool)

(assert (=> b!257645 (= e!167010 (and e!167009 mapRes!11235))))

(declare-fun condMapEmpty!11235 () Bool)

(declare-fun mapDefault!11235 () ValueCell!2956)

