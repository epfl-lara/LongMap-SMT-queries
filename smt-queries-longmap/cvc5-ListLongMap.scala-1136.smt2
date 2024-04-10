; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23448 () Bool)

(assert start!23448)

(declare-fun b!246281 () Bool)

(declare-fun b_free!6565 () Bool)

(declare-fun b_next!6565 () Bool)

(assert (=> b!246281 (= b_free!6565 (not b_next!6565))))

(declare-fun tp!22933 () Bool)

(declare-fun b_and!13561 () Bool)

(assert (=> b!246281 (= tp!22933 b_and!13561)))

(declare-fun b!246266 () Bool)

(declare-datatypes ((Unit!7601 0))(
  ( (Unit!7602) )
))
(declare-fun e!159757 () Unit!7601)

(declare-fun Unit!7603 () Unit!7601)

(assert (=> b!246266 (= e!159757 Unit!7603)))

(declare-fun lt!123347 () Unit!7601)

(declare-datatypes ((V!8217 0))(
  ( (V!8218 (val!3258 Int)) )
))
(declare-datatypes ((ValueCell!2870 0))(
  ( (ValueCellFull!2870 (v!5313 V!8217)) (EmptyCell!2870) )
))
(declare-datatypes ((array!12155 0))(
  ( (array!12156 (arr!5768 (Array (_ BitVec 32) ValueCell!2870)) (size!6111 (_ BitVec 32))) )
))
(declare-datatypes ((array!12157 0))(
  ( (array!12158 (arr!5769 (Array (_ BitVec 32) (_ BitVec 64))) (size!6112 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3640 0))(
  ( (LongMapFixedSize!3641 (defaultEntry!4557 Int) (mask!10680 (_ BitVec 32)) (extraKeys!4294 (_ BitVec 32)) (zeroValue!4398 V!8217) (minValue!4398 V!8217) (_size!1869 (_ BitVec 32)) (_keys!6676 array!12157) (_values!4540 array!12155) (_vacant!1869 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3640)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!177 (array!12157 array!12155 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) (_ BitVec 32) Int) Unit!7601)

(assert (=> b!246266 (= lt!123347 (lemmaArrayContainsKeyThenInListMap!177 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(assert (=> b!246266 false))

(declare-fun bm!23011 () Bool)

(declare-fun call!23015 () Bool)

(declare-fun arrayContainsKey!0 (array!12157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23011 (= call!23015 (arrayContainsKey!0 (_keys!6676 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246267 () Bool)

(declare-fun e!159759 () Bool)

(declare-fun e!159762 () Bool)

(assert (=> b!246267 (= e!159759 e!159762)))

(declare-fun res!120762 () Bool)

(assert (=> b!246267 (=> (not res!120762) (not e!159762))))

(declare-datatypes ((SeekEntryResult!1093 0))(
  ( (MissingZero!1093 (index!6542 (_ BitVec 32))) (Found!1093 (index!6543 (_ BitVec 32))) (Intermediate!1093 (undefined!1905 Bool) (index!6544 (_ BitVec 32)) (x!24467 (_ BitVec 32))) (Undefined!1093) (MissingVacant!1093 (index!6545 (_ BitVec 32))) )
))
(declare-fun lt!123343 () SeekEntryResult!1093)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!246267 (= res!120762 (or (= lt!123343 (MissingZero!1093 index!297)) (= lt!123343 (MissingVacant!1093 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12157 (_ BitVec 32)) SeekEntryResult!1093)

(assert (=> b!246267 (= lt!123343 (seekEntryOrOpen!0 key!932 (_keys!6676 thiss!1504) (mask!10680 thiss!1504)))))

(declare-fun b!246268 () Bool)

(declare-fun e!159766 () Bool)

(assert (=> b!246268 (= e!159762 e!159766)))

(declare-fun res!120766 () Bool)

(assert (=> b!246268 (=> (not res!120766) (not e!159766))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246268 (= res!120766 (inRange!0 index!297 (mask!10680 thiss!1504)))))

(declare-fun lt!123342 () Unit!7601)

(declare-fun e!159756 () Unit!7601)

(assert (=> b!246268 (= lt!123342 e!159756)))

(declare-fun c!41176 () Bool)

(declare-datatypes ((tuple2!4794 0))(
  ( (tuple2!4795 (_1!2408 (_ BitVec 64)) (_2!2408 V!8217)) )
))
(declare-datatypes ((List!3676 0))(
  ( (Nil!3673) (Cons!3672 (h!4330 tuple2!4794) (t!8693 List!3676)) )
))
(declare-datatypes ((ListLongMap!3707 0))(
  ( (ListLongMap!3708 (toList!1869 List!3676)) )
))
(declare-fun contains!1780 (ListLongMap!3707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1397 (array!12157 array!12155 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 32) Int) ListLongMap!3707)

(assert (=> b!246268 (= c!41176 (contains!1780 (getCurrentListMap!1397 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)) key!932))))

(declare-fun b!246269 () Bool)

(declare-fun e!159765 () Bool)

(assert (=> b!246269 (= e!159766 (not e!159765))))

(declare-fun res!120760 () Bool)

(assert (=> b!246269 (=> res!120760 e!159765)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!246269 (= res!120760 (not (validMask!0 (mask!10680 thiss!1504))))))

(declare-fun lt!123344 () array!12157)

(declare-fun arrayCountValidKeys!0 (array!12157 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!246269 (= (arrayCountValidKeys!0 lt!123344 #b00000000000000000000000000000000 (size!6112 (_keys!6676 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6676 thiss!1504) #b00000000000000000000000000000000 (size!6112 (_keys!6676 thiss!1504)))))))

(declare-fun lt!123340 () Unit!7601)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12157 (_ BitVec 32) (_ BitVec 64)) Unit!7601)

(assert (=> b!246269 (= lt!123340 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6676 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3677 0))(
  ( (Nil!3674) (Cons!3673 (h!4331 (_ BitVec 64)) (t!8694 List!3677)) )
))
(declare-fun arrayNoDuplicates!0 (array!12157 (_ BitVec 32) List!3677) Bool)

(assert (=> b!246269 (arrayNoDuplicates!0 lt!123344 #b00000000000000000000000000000000 Nil!3674)))

(assert (=> b!246269 (= lt!123344 (array!12158 (store (arr!5769 (_keys!6676 thiss!1504)) index!297 key!932) (size!6112 (_keys!6676 thiss!1504))))))

(declare-fun lt!123345 () Unit!7601)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12157 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3677) Unit!7601)

(assert (=> b!246269 (= lt!123345 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6676 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3674))))

(declare-fun lt!123341 () Unit!7601)

(assert (=> b!246269 (= lt!123341 e!159757)))

(declare-fun c!41175 () Bool)

(assert (=> b!246269 (= c!41175 (arrayContainsKey!0 (_keys!6676 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10907 () Bool)

(declare-fun mapRes!10907 () Bool)

(declare-fun tp!22934 () Bool)

(declare-fun e!159755 () Bool)

(assert (=> mapNonEmpty!10907 (= mapRes!10907 (and tp!22934 e!159755))))

(declare-fun mapValue!10907 () ValueCell!2870)

(declare-fun mapRest!10907 () (Array (_ BitVec 32) ValueCell!2870))

(declare-fun mapKey!10907 () (_ BitVec 32))

(assert (=> mapNonEmpty!10907 (= (arr!5768 (_values!4540 thiss!1504)) (store mapRest!10907 mapKey!10907 mapValue!10907))))

(declare-fun b!246270 () Bool)

(declare-fun res!120764 () Bool)

(assert (=> b!246270 (= res!120764 (= (select (arr!5769 (_keys!6676 thiss!1504)) (index!6545 lt!123343)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159758 () Bool)

(assert (=> b!246270 (=> (not res!120764) (not e!159758))))

(declare-fun res!120761 () Bool)

(assert (=> start!23448 (=> (not res!120761) (not e!159759))))

(declare-fun valid!1425 (LongMapFixedSize!3640) Bool)

(assert (=> start!23448 (= res!120761 (valid!1425 thiss!1504))))

(assert (=> start!23448 e!159759))

(declare-fun e!159761 () Bool)

(assert (=> start!23448 e!159761))

(assert (=> start!23448 true))

(declare-fun b!246271 () Bool)

(declare-fun res!120763 () Bool)

(declare-fun e!159754 () Bool)

(assert (=> b!246271 (=> (not res!120763) (not e!159754))))

(assert (=> b!246271 (= res!120763 (= (select (arr!5769 (_keys!6676 thiss!1504)) (index!6542 lt!123343)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246272 () Bool)

(declare-fun c!41177 () Bool)

(assert (=> b!246272 (= c!41177 (is-MissingVacant!1093 lt!123343))))

(declare-fun e!159760 () Bool)

(declare-fun e!159768 () Bool)

(assert (=> b!246272 (= e!159760 e!159768)))

(declare-fun b!246273 () Bool)

(declare-fun res!120758 () Bool)

(assert (=> b!246273 (=> (not res!120758) (not e!159754))))

(declare-fun call!23014 () Bool)

(assert (=> b!246273 (= res!120758 call!23014)))

(assert (=> b!246273 (= e!159760 e!159754)))

(declare-fun b!246274 () Bool)

(assert (=> b!246274 (= e!159768 (is-Undefined!1093 lt!123343))))

(declare-fun b!246275 () Bool)

(assert (=> b!246275 (= e!159754 (not call!23015))))

(declare-fun mapIsEmpty!10907 () Bool)

(assert (=> mapIsEmpty!10907 mapRes!10907))

(declare-fun b!246276 () Bool)

(assert (=> b!246276 (= e!159768 e!159758)))

(declare-fun res!120765 () Bool)

(assert (=> b!246276 (= res!120765 call!23014)))

(assert (=> b!246276 (=> (not res!120765) (not e!159758))))

(declare-fun b!246277 () Bool)

(declare-fun res!120759 () Bool)

(assert (=> b!246277 (=> (not res!120759) (not e!159759))))

(assert (=> b!246277 (= res!120759 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!246278 () Bool)

(declare-fun tp_is_empty!6427 () Bool)

(assert (=> b!246278 (= e!159755 tp_is_empty!6427)))

(declare-fun b!246279 () Bool)

(declare-fun lt!123346 () Unit!7601)

(assert (=> b!246279 (= e!159756 lt!123346)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!380 (array!12157 array!12155 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) Int) Unit!7601)

(assert (=> b!246279 (= lt!123346 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!380 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)))))

(declare-fun c!41174 () Bool)

(assert (=> b!246279 (= c!41174 (is-MissingZero!1093 lt!123343))))

(assert (=> b!246279 e!159760))

(declare-fun b!246280 () Bool)

(declare-fun e!159767 () Bool)

(assert (=> b!246280 (= e!159767 tp_is_empty!6427)))

(declare-fun e!159763 () Bool)

(declare-fun array_inv!3811 (array!12157) Bool)

(declare-fun array_inv!3812 (array!12155) Bool)

(assert (=> b!246281 (= e!159761 (and tp!22933 tp_is_empty!6427 (array_inv!3811 (_keys!6676 thiss!1504)) (array_inv!3812 (_values!4540 thiss!1504)) e!159763))))

(declare-fun b!246282 () Bool)

(declare-fun Unit!7604 () Unit!7601)

(assert (=> b!246282 (= e!159757 Unit!7604)))

(declare-fun b!246283 () Bool)

(declare-fun Unit!7605 () Unit!7601)

(assert (=> b!246283 (= e!159756 Unit!7605)))

(declare-fun lt!123348 () Unit!7601)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!375 (array!12157 array!12155 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) Int) Unit!7601)

(assert (=> b!246283 (= lt!123348 (lemmaInListMapThenSeekEntryOrOpenFindsIt!375 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)))))

(assert (=> b!246283 false))

(declare-fun b!246284 () Bool)

(assert (=> b!246284 (= e!159763 (and e!159767 mapRes!10907))))

(declare-fun condMapEmpty!10907 () Bool)

(declare-fun mapDefault!10907 () ValueCell!2870)

