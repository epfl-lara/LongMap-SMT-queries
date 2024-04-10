; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22006 () Bool)

(assert start!22006)

(declare-fun b!226425 () Bool)

(declare-fun b_free!6073 () Bool)

(declare-fun b_next!6073 () Bool)

(assert (=> b!226425 (= b_free!6073 (not b_next!6073))))

(declare-fun tp!21361 () Bool)

(declare-fun b_and!12971 () Bool)

(assert (=> b!226425 (= tp!21361 b_and!12971)))

(declare-fun b!226402 () Bool)

(declare-fun e!146901 () Bool)

(assert (=> b!226402 (= e!146901 true)))

(declare-fun lt!113976 () Bool)

(declare-datatypes ((V!7561 0))(
  ( (V!7562 (val!3012 Int)) )
))
(declare-datatypes ((ValueCell!2624 0))(
  ( (ValueCellFull!2624 (v!5032 V!7561)) (EmptyCell!2624) )
))
(declare-datatypes ((array!11113 0))(
  ( (array!11114 (arr!5276 (Array (_ BitVec 32) ValueCell!2624)) (size!5609 (_ BitVec 32))) )
))
(declare-datatypes ((array!11115 0))(
  ( (array!11116 (arr!5277 (Array (_ BitVec 32) (_ BitVec 64))) (size!5610 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3148 0))(
  ( (LongMapFixedSize!3149 (defaultEntry!4233 Int) (mask!10085 (_ BitVec 32)) (extraKeys!3970 (_ BitVec 32)) (zeroValue!4074 V!7561) (minValue!4074 V!7561) (_size!1623 (_ BitVec 32)) (_keys!6287 array!11115) (_values!4216 array!11113) (_vacant!1623 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3148)

(declare-datatypes ((List!3373 0))(
  ( (Nil!3370) (Cons!3369 (h!4017 (_ BitVec 64)) (t!8332 List!3373)) )
))
(declare-fun arrayNoDuplicates!0 (array!11115 (_ BitVec 32) List!3373) Bool)

(assert (=> b!226402 (= lt!113976 (arrayNoDuplicates!0 (_keys!6287 thiss!1504) #b00000000000000000000000000000000 Nil!3370))))

(declare-fun b!226403 () Bool)

(declare-fun e!146897 () Bool)

(declare-fun call!21054 () Bool)

(assert (=> b!226403 (= e!146897 (not call!21054))))

(declare-fun b!226404 () Bool)

(declare-fun e!146906 () Bool)

(declare-fun tp_is_empty!5935 () Bool)

(assert (=> b!226404 (= e!146906 tp_is_empty!5935)))

(declare-fun b!226405 () Bool)

(declare-datatypes ((Unit!6846 0))(
  ( (Unit!6847) )
))
(declare-fun e!146896 () Unit!6846)

(declare-fun lt!113970 () Unit!6846)

(assert (=> b!226405 (= e!146896 lt!113970)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!268 (array!11115 array!11113 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 64) Int) Unit!6846)

(assert (=> b!226405 (= lt!113970 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!268 (_keys!6287 thiss!1504) (_values!4216 thiss!1504) (mask!10085 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) key!932 (defaultEntry!4233 thiss!1504)))))

(declare-fun c!37534 () Bool)

(declare-datatypes ((SeekEntryResult!882 0))(
  ( (MissingZero!882 (index!5698 (_ BitVec 32))) (Found!882 (index!5699 (_ BitVec 32))) (Intermediate!882 (undefined!1694 Bool) (index!5700 (_ BitVec 32)) (x!23230 (_ BitVec 32))) (Undefined!882) (MissingVacant!882 (index!5701 (_ BitVec 32))) )
))
(declare-fun lt!113975 () SeekEntryResult!882)

(assert (=> b!226405 (= c!37534 (is-MissingZero!882 lt!113975))))

(declare-fun e!146895 () Bool)

(assert (=> b!226405 e!146895))

(declare-fun b!226406 () Bool)

(declare-fun e!146909 () Bool)

(assert (=> b!226406 (= e!146909 (is-Undefined!882 lt!113975))))

(declare-fun b!226408 () Bool)

(declare-fun c!37533 () Bool)

(assert (=> b!226408 (= c!37533 (is-MissingVacant!882 lt!113975))))

(assert (=> b!226408 (= e!146895 e!146909)))

(declare-fun bm!21050 () Bool)

(declare-fun call!21053 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21050 (= call!21053 (inRange!0 (ite c!37534 (index!5698 lt!113975) (index!5701 lt!113975)) (mask!10085 thiss!1504)))))

(declare-fun b!226409 () Bool)

(declare-fun e!146904 () Bool)

(assert (=> b!226409 (= e!146904 (not e!146901))))

(declare-fun res!111458 () Bool)

(assert (=> b!226409 (=> res!111458 e!146901)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226409 (= res!111458 (not (validMask!0 (mask!10085 thiss!1504))))))

(declare-fun lt!113978 () array!11115)

(declare-fun arrayCountValidKeys!0 (array!11115 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226409 (= (arrayCountValidKeys!0 lt!113978 #b00000000000000000000000000000000 (size!5610 (_keys!6287 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6287 thiss!1504) #b00000000000000000000000000000000 (size!5610 (_keys!6287 thiss!1504)))))))

(declare-fun lt!113974 () Unit!6846)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11115 (_ BitVec 32) (_ BitVec 64)) Unit!6846)

(assert (=> b!226409 (= lt!113974 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6287 thiss!1504) index!297 key!932))))

(assert (=> b!226409 (arrayNoDuplicates!0 lt!113978 #b00000000000000000000000000000000 Nil!3370)))

(assert (=> b!226409 (= lt!113978 (array!11116 (store (arr!5277 (_keys!6287 thiss!1504)) index!297 key!932) (size!5610 (_keys!6287 thiss!1504))))))

(declare-fun lt!113971 () Unit!6846)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11115 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3373) Unit!6846)

(assert (=> b!226409 (= lt!113971 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6287 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3370))))

(declare-fun lt!113973 () Unit!6846)

(declare-fun e!146908 () Unit!6846)

(assert (=> b!226409 (= lt!113973 e!146908)))

(declare-fun c!37536 () Bool)

(declare-fun lt!113968 () Bool)

(assert (=> b!226409 (= c!37536 lt!113968)))

(declare-fun arrayContainsKey!0 (array!11115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226409 (= lt!113968 (arrayContainsKey!0 (_keys!6287 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226410 () Bool)

(declare-fun res!111448 () Bool)

(declare-fun e!146907 () Bool)

(assert (=> b!226410 (=> (not res!111448) (not e!146907))))

(assert (=> b!226410 (= res!111448 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226411 () Bool)

(declare-fun Unit!6848 () Unit!6846)

(assert (=> b!226411 (= e!146896 Unit!6848)))

(declare-fun lt!113977 () Unit!6846)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!256 (array!11115 array!11113 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 64) Int) Unit!6846)

(assert (=> b!226411 (= lt!113977 (lemmaInListMapThenSeekEntryOrOpenFindsIt!256 (_keys!6287 thiss!1504) (_values!4216 thiss!1504) (mask!10085 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) key!932 (defaultEntry!4233 thiss!1504)))))

(assert (=> b!226411 false))

(declare-fun b!226412 () Bool)

(declare-fun Unit!6849 () Unit!6846)

(assert (=> b!226412 (= e!146908 Unit!6849)))

(declare-fun lt!113969 () Unit!6846)

(declare-fun lemmaArrayContainsKeyThenInListMap!94 (array!11115 array!11113 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 64) (_ BitVec 32) Int) Unit!6846)

(assert (=> b!226412 (= lt!113969 (lemmaArrayContainsKeyThenInListMap!94 (_keys!6287 thiss!1504) (_values!4216 thiss!1504) (mask!10085 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4233 thiss!1504)))))

(assert (=> b!226412 false))

(declare-fun b!226413 () Bool)

(declare-fun res!111449 () Bool)

(declare-fun e!146898 () Bool)

(assert (=> b!226413 (=> (not res!111449) (not e!146898))))

(assert (=> b!226413 (= res!111449 (= (select (arr!5277 (_keys!6287 thiss!1504)) (index!5698 lt!113975)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226414 () Bool)

(assert (=> b!226414 (= e!146909 e!146897)))

(declare-fun res!111455 () Bool)

(assert (=> b!226414 (= res!111455 call!21053)))

(assert (=> b!226414 (=> (not res!111455) (not e!146897))))

(declare-fun b!226415 () Bool)

(declare-fun res!111451 () Bool)

(assert (=> b!226415 (=> res!111451 e!146901)))

(assert (=> b!226415 (= res!111451 lt!113968)))

(declare-fun mapNonEmpty!10072 () Bool)

(declare-fun mapRes!10072 () Bool)

(declare-fun tp!21360 () Bool)

(declare-fun e!146903 () Bool)

(assert (=> mapNonEmpty!10072 (= mapRes!10072 (and tp!21360 e!146903))))

(declare-fun mapKey!10072 () (_ BitVec 32))

(declare-fun mapRest!10072 () (Array (_ BitVec 32) ValueCell!2624))

(declare-fun mapValue!10072 () ValueCell!2624)

(assert (=> mapNonEmpty!10072 (= (arr!5276 (_values!4216 thiss!1504)) (store mapRest!10072 mapKey!10072 mapValue!10072))))

(declare-fun b!226416 () Bool)

(declare-fun e!146900 () Bool)

(assert (=> b!226416 (= e!146907 e!146900)))

(declare-fun res!111453 () Bool)

(assert (=> b!226416 (=> (not res!111453) (not e!146900))))

(assert (=> b!226416 (= res!111453 (or (= lt!113975 (MissingZero!882 index!297)) (= lt!113975 (MissingVacant!882 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11115 (_ BitVec 32)) SeekEntryResult!882)

(assert (=> b!226416 (= lt!113975 (seekEntryOrOpen!0 key!932 (_keys!6287 thiss!1504) (mask!10085 thiss!1504)))))

(declare-fun b!226417 () Bool)

(declare-fun res!111459 () Bool)

(assert (=> b!226417 (= res!111459 (= (select (arr!5277 (_keys!6287 thiss!1504)) (index!5701 lt!113975)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226417 (=> (not res!111459) (not e!146897))))

(declare-fun mapIsEmpty!10072 () Bool)

(assert (=> mapIsEmpty!10072 mapRes!10072))

(declare-fun b!226418 () Bool)

(assert (=> b!226418 (= e!146898 (not call!21054))))

(declare-fun b!226419 () Bool)

(assert (=> b!226419 (= e!146903 tp_is_empty!5935)))

(declare-fun b!226420 () Bool)

(declare-fun res!111452 () Bool)

(assert (=> b!226420 (=> res!111452 e!146901)))

(assert (=> b!226420 (= res!111452 (or (not (= (size!5610 (_keys!6287 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10085 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5610 (_keys!6287 thiss!1504)))))))

(declare-fun b!226421 () Bool)

(assert (=> b!226421 (= e!146900 e!146904)))

(declare-fun res!111460 () Bool)

(assert (=> b!226421 (=> (not res!111460) (not e!146904))))

(assert (=> b!226421 (= res!111460 (inRange!0 index!297 (mask!10085 thiss!1504)))))

(declare-fun lt!113972 () Unit!6846)

(assert (=> b!226421 (= lt!113972 e!146896)))

(declare-fun c!37535 () Bool)

(declare-datatypes ((tuple2!4456 0))(
  ( (tuple2!4457 (_1!2239 (_ BitVec 64)) (_2!2239 V!7561)) )
))
(declare-datatypes ((List!3374 0))(
  ( (Nil!3371) (Cons!3370 (h!4018 tuple2!4456) (t!8333 List!3374)) )
))
(declare-datatypes ((ListLongMap!3369 0))(
  ( (ListLongMap!3370 (toList!1700 List!3374)) )
))
(declare-fun contains!1574 (ListLongMap!3369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1228 (array!11115 array!11113 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 32) Int) ListLongMap!3369)

(assert (=> b!226421 (= c!37535 (contains!1574 (getCurrentListMap!1228 (_keys!6287 thiss!1504) (_values!4216 thiss!1504) (mask!10085 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4233 thiss!1504)) key!932))))

(declare-fun bm!21051 () Bool)

(assert (=> bm!21051 (= call!21054 (arrayContainsKey!0 (_keys!6287 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!111454 () Bool)

(assert (=> start!22006 (=> (not res!111454) (not e!146907))))

(declare-fun valid!1267 (LongMapFixedSize!3148) Bool)

(assert (=> start!22006 (= res!111454 (valid!1267 thiss!1504))))

(assert (=> start!22006 e!146907))

(declare-fun e!146902 () Bool)

(assert (=> start!22006 e!146902))

(assert (=> start!22006 true))

(declare-fun b!226407 () Bool)

(declare-fun res!111450 () Bool)

(assert (=> b!226407 (=> res!111450 e!146901)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11115 (_ BitVec 32)) Bool)

(assert (=> b!226407 (= res!111450 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6287 thiss!1504) (mask!10085 thiss!1504))))))

(declare-fun b!226422 () Bool)

(declare-fun res!111457 () Bool)

(assert (=> b!226422 (=> (not res!111457) (not e!146898))))

(assert (=> b!226422 (= res!111457 call!21053)))

(assert (=> b!226422 (= e!146895 e!146898)))

(declare-fun b!226423 () Bool)

(declare-fun res!111456 () Bool)

(assert (=> b!226423 (=> res!111456 e!146901)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226423 (= res!111456 (not (validKeyInArray!0 key!932)))))

(declare-fun b!226424 () Bool)

(declare-fun e!146905 () Bool)

(assert (=> b!226424 (= e!146905 (and e!146906 mapRes!10072))))

(declare-fun condMapEmpty!10072 () Bool)

(declare-fun mapDefault!10072 () ValueCell!2624)

