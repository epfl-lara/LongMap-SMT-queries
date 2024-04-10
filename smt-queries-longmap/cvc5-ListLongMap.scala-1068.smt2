; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22090 () Bool)

(assert start!22090)

(declare-fun b!229345 () Bool)

(declare-fun b_free!6157 () Bool)

(declare-fun b_next!6157 () Bool)

(assert (=> b!229345 (= b_free!6157 (not b_next!6157))))

(declare-fun tp!21613 () Bool)

(declare-fun b_and!13055 () Bool)

(assert (=> b!229345 (= tp!21613 b_and!13055)))

(declare-fun b!229332 () Bool)

(declare-fun e!148785 () Bool)

(declare-fun e!148787 () Bool)

(assert (=> b!229332 (= e!148785 (not e!148787))))

(declare-fun res!112868 () Bool)

(assert (=> b!229332 (=> res!112868 e!148787)))

(declare-datatypes ((V!7673 0))(
  ( (V!7674 (val!3054 Int)) )
))
(declare-datatypes ((ValueCell!2666 0))(
  ( (ValueCellFull!2666 (v!5074 V!7673)) (EmptyCell!2666) )
))
(declare-datatypes ((array!11281 0))(
  ( (array!11282 (arr!5360 (Array (_ BitVec 32) ValueCell!2666)) (size!5693 (_ BitVec 32))) )
))
(declare-datatypes ((array!11283 0))(
  ( (array!11284 (arr!5361 (Array (_ BitVec 32) (_ BitVec 64))) (size!5694 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3232 0))(
  ( (LongMapFixedSize!3233 (defaultEntry!4275 Int) (mask!10155 (_ BitVec 32)) (extraKeys!4012 (_ BitVec 32)) (zeroValue!4116 V!7673) (minValue!4116 V!7673) (_size!1665 (_ BitVec 32)) (_keys!6329 array!11283) (_values!4258 array!11281) (_vacant!1665 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3232)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229332 (= res!112868 (not (validMask!0 (mask!10155 thiss!1504))))))

(declare-fun lt!115356 () array!11283)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11283 (_ BitVec 32)) Bool)

(assert (=> b!229332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115356 (mask!10155 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((Unit!6994 0))(
  ( (Unit!6995) )
))
(declare-fun lt!115363 () Unit!6994)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11283 (_ BitVec 32) (_ BitVec 32)) Unit!6994)

(assert (=> b!229332 (= lt!115363 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6329 thiss!1504) index!297 (mask!10155 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11283 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229332 (= (arrayCountValidKeys!0 lt!115356 #b00000000000000000000000000000000 (size!5694 (_keys!6329 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6329 thiss!1504) #b00000000000000000000000000000000 (size!5694 (_keys!6329 thiss!1504)))))))

(declare-fun lt!115362 () Unit!6994)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11283 (_ BitVec 32) (_ BitVec 64)) Unit!6994)

(assert (=> b!229332 (= lt!115362 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6329 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3431 0))(
  ( (Nil!3428) (Cons!3427 (h!4075 (_ BitVec 64)) (t!8390 List!3431)) )
))
(declare-fun arrayNoDuplicates!0 (array!11283 (_ BitVec 32) List!3431) Bool)

(assert (=> b!229332 (arrayNoDuplicates!0 lt!115356 #b00000000000000000000000000000000 Nil!3428)))

(assert (=> b!229332 (= lt!115356 (array!11284 (store (arr!5361 (_keys!6329 thiss!1504)) index!297 key!932) (size!5694 (_keys!6329 thiss!1504))))))

(declare-fun lt!115354 () Unit!6994)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3431) Unit!6994)

(assert (=> b!229332 (= lt!115354 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6329 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3428))))

(declare-fun lt!115360 () Unit!6994)

(declare-fun e!148795 () Unit!6994)

(assert (=> b!229332 (= lt!115360 e!148795)))

(declare-fun c!38039 () Bool)

(declare-fun arrayContainsKey!0 (array!11283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229332 (= c!38039 (arrayContainsKey!0 (_keys!6329 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!21302 () Bool)

(declare-fun call!21305 () Bool)

(assert (=> bm!21302 (= call!21305 (arrayContainsKey!0 (_keys!6329 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229333 () Bool)

(declare-fun res!112872 () Bool)

(declare-fun e!148799 () Bool)

(assert (=> b!229333 (=> (not res!112872) (not e!148799))))

(declare-fun call!21306 () Bool)

(assert (=> b!229333 (= res!112872 call!21306)))

(declare-fun e!148792 () Bool)

(assert (=> b!229333 (= e!148792 e!148799)))

(declare-fun b!229334 () Bool)

(declare-fun res!112873 () Bool)

(declare-datatypes ((SeekEntryResult!920 0))(
  ( (MissingZero!920 (index!5850 (_ BitVec 32))) (Found!920 (index!5851 (_ BitVec 32))) (Intermediate!920 (undefined!1732 Bool) (index!5852 (_ BitVec 32)) (x!23380 (_ BitVec 32))) (Undefined!920) (MissingVacant!920 (index!5853 (_ BitVec 32))) )
))
(declare-fun lt!115364 () SeekEntryResult!920)

(assert (=> b!229334 (= res!112873 (= (select (arr!5361 (_keys!6329 thiss!1504)) (index!5853 lt!115364)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148786 () Bool)

(assert (=> b!229334 (=> (not res!112873) (not e!148786))))

(declare-fun b!229335 () Bool)

(declare-fun e!148796 () Unit!6994)

(declare-fun Unit!6996 () Unit!6994)

(assert (=> b!229335 (= e!148796 Unit!6996)))

(declare-fun lt!115355 () Unit!6994)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!280 (array!11283 array!11281 (_ BitVec 32) (_ BitVec 32) V!7673 V!7673 (_ BitVec 64) Int) Unit!6994)

(assert (=> b!229335 (= lt!115355 (lemmaInListMapThenSeekEntryOrOpenFindsIt!280 (_keys!6329 thiss!1504) (_values!4258 thiss!1504) (mask!10155 thiss!1504) (extraKeys!4012 thiss!1504) (zeroValue!4116 thiss!1504) (minValue!4116 thiss!1504) key!932 (defaultEntry!4275 thiss!1504)))))

(assert (=> b!229335 false))

(declare-fun b!229336 () Bool)

(assert (=> b!229336 (= e!148787 true)))

(declare-fun lt!115361 () Bool)

(assert (=> b!229336 (= lt!115361 (arrayNoDuplicates!0 (_keys!6329 thiss!1504) #b00000000000000000000000000000000 Nil!3428))))

(declare-fun b!229337 () Bool)

(declare-fun e!148798 () Bool)

(assert (=> b!229337 (= e!148798 (is-Undefined!920 lt!115364))))

(declare-fun b!229338 () Bool)

(declare-fun e!148789 () Bool)

(declare-fun e!148790 () Bool)

(declare-fun mapRes!10198 () Bool)

(assert (=> b!229338 (= e!148789 (and e!148790 mapRes!10198))))

(declare-fun condMapEmpty!10198 () Bool)

(declare-fun mapDefault!10198 () ValueCell!2666)

