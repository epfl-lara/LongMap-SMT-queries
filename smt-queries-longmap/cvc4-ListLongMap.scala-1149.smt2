; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24100 () Bool)

(assert start!24100)

(declare-fun b!252118 () Bool)

(declare-fun b_free!6647 () Bool)

(declare-fun b_next!6647 () Bool)

(assert (=> b!252118 (= b_free!6647 (not b_next!6647))))

(declare-fun tp!23217 () Bool)

(declare-fun b_and!13681 () Bool)

(assert (=> b!252118 (= tp!23217 b_and!13681)))

(declare-fun b!252117 () Bool)

(declare-fun e!163504 () Bool)

(declare-datatypes ((V!8325 0))(
  ( (V!8326 (val!3299 Int)) )
))
(declare-datatypes ((ValueCell!2911 0))(
  ( (ValueCellFull!2911 (v!5369 V!8325)) (EmptyCell!2911) )
))
(declare-datatypes ((array!12341 0))(
  ( (array!12342 (arr!5850 (Array (_ BitVec 32) ValueCell!2911)) (size!6197 (_ BitVec 32))) )
))
(declare-datatypes ((array!12343 0))(
  ( (array!12344 (arr!5851 (Array (_ BitVec 32) (_ BitVec 64))) (size!6198 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3722 0))(
  ( (LongMapFixedSize!3723 (defaultEntry!4658 Int) (mask!10870 (_ BitVec 32)) (extraKeys!4395 (_ BitVec 32)) (zeroValue!4499 V!8325) (minValue!4499 V!8325) (_size!1910 (_ BitVec 32)) (_keys!6804 array!12343) (_values!4641 array!12341) (_vacant!1910 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3722)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12343 (_ BitVec 32)) Bool)

(assert (=> b!252117 (= e!163504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6804 thiss!1504) (mask!10870 thiss!1504)))))

(declare-fun tp_is_empty!6509 () Bool)

(declare-fun e!163498 () Bool)

(declare-fun e!163494 () Bool)

(declare-fun array_inv!3867 (array!12343) Bool)

(declare-fun array_inv!3868 (array!12341) Bool)

(assert (=> b!252118 (= e!163494 (and tp!23217 tp_is_empty!6509 (array_inv!3867 (_keys!6804 thiss!1504)) (array_inv!3868 (_values!4641 thiss!1504)) e!163498))))

(declare-fun b!252119 () Bool)

(declare-fun e!163506 () Bool)

(assert (=> b!252119 (= e!163506 (not e!163504))))

(declare-fun res!123418 () Bool)

(assert (=> b!252119 (=> res!123418 e!163504)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252119 (= res!123418 (not (validMask!0 (mask!10870 thiss!1504))))))

(declare-fun lt!126363 () array!12343)

(assert (=> b!252119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126363 (mask!10870 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!7804 0))(
  ( (Unit!7805) )
))
(declare-fun lt!126358 () Unit!7804)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12343 (_ BitVec 32) (_ BitVec 32)) Unit!7804)

(assert (=> b!252119 (= lt!126358 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6804 thiss!1504) index!297 (mask!10870 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12343 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252119 (= (arrayCountValidKeys!0 lt!126363 #b00000000000000000000000000000000 (size!6198 (_keys!6804 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6804 thiss!1504) #b00000000000000000000000000000000 (size!6198 (_keys!6804 thiss!1504)))))))

(declare-fun lt!126361 () Unit!7804)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12343 (_ BitVec 32) (_ BitVec 64)) Unit!7804)

(assert (=> b!252119 (= lt!126361 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6804 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3738 0))(
  ( (Nil!3735) (Cons!3734 (h!4396 (_ BitVec 64)) (t!8777 List!3738)) )
))
(declare-fun arrayNoDuplicates!0 (array!12343 (_ BitVec 32) List!3738) Bool)

(assert (=> b!252119 (arrayNoDuplicates!0 lt!126363 #b00000000000000000000000000000000 Nil!3735)))

(assert (=> b!252119 (= lt!126363 (array!12344 (store (arr!5851 (_keys!6804 thiss!1504)) index!297 key!932) (size!6198 (_keys!6804 thiss!1504))))))

(declare-fun lt!126367 () Unit!7804)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12343 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3738) Unit!7804)

(assert (=> b!252119 (= lt!126367 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6804 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3735))))

(declare-fun lt!126359 () Unit!7804)

(declare-fun e!163495 () Unit!7804)

(assert (=> b!252119 (= lt!126359 e!163495)))

(declare-fun c!42467 () Bool)

(declare-fun arrayContainsKey!0 (array!12343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!252119 (= c!42467 (arrayContainsKey!0 (_keys!6804 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!1131 0))(
  ( (MissingZero!1131 (index!6694 (_ BitVec 32))) (Found!1131 (index!6695 (_ BitVec 32))) (Intermediate!1131 (undefined!1943 Bool) (index!6696 (_ BitVec 32)) (x!24751 (_ BitVec 32))) (Undefined!1131) (MissingVacant!1131 (index!6697 (_ BitVec 32))) )
))
(declare-fun lt!126365 () SeekEntryResult!1131)

(declare-fun bm!23728 () Bool)

(declare-fun call!23732 () Bool)

(declare-fun c!42464 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23728 (= call!23732 (inRange!0 (ite c!42464 (index!6694 lt!126365) (index!6697 lt!126365)) (mask!10870 thiss!1504)))))

(declare-fun b!252120 () Bool)

(declare-fun res!123417 () Bool)

(assert (=> b!252120 (= res!123417 (= (select (arr!5851 (_keys!6804 thiss!1504)) (index!6697 lt!126365)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163502 () Bool)

(assert (=> b!252120 (=> (not res!123417) (not e!163502))))

(declare-fun b!252121 () Bool)

(declare-fun res!123422 () Bool)

(declare-fun e!163497 () Bool)

(assert (=> b!252121 (=> (not res!123422) (not e!163497))))

(assert (=> b!252121 (= res!123422 call!23732)))

(declare-fun e!163499 () Bool)

(assert (=> b!252121 (= e!163499 e!163497)))

(declare-fun b!252122 () Bool)

(declare-fun e!163496 () Bool)

(assert (=> b!252122 (= e!163496 e!163506)))

(declare-fun res!123415 () Bool)

(assert (=> b!252122 (=> (not res!123415) (not e!163506))))

(assert (=> b!252122 (= res!123415 (inRange!0 index!297 (mask!10870 thiss!1504)))))

(declare-fun lt!126366 () Unit!7804)

(declare-fun e!163500 () Unit!7804)

(assert (=> b!252122 (= lt!126366 e!163500)))

(declare-fun c!42466 () Bool)

(declare-datatypes ((tuple2!4858 0))(
  ( (tuple2!4859 (_1!2440 (_ BitVec 64)) (_2!2440 V!8325)) )
))
(declare-datatypes ((List!3739 0))(
  ( (Nil!3736) (Cons!3735 (h!4397 tuple2!4858) (t!8778 List!3739)) )
))
(declare-datatypes ((ListLongMap!3771 0))(
  ( (ListLongMap!3772 (toList!1901 List!3739)) )
))
(declare-fun contains!1827 (ListLongMap!3771 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1429 (array!12343 array!12341 (_ BitVec 32) (_ BitVec 32) V!8325 V!8325 (_ BitVec 32) Int) ListLongMap!3771)

(assert (=> b!252122 (= c!42466 (contains!1827 (getCurrentListMap!1429 (_keys!6804 thiss!1504) (_values!4641 thiss!1504) (mask!10870 thiss!1504) (extraKeys!4395 thiss!1504) (zeroValue!4499 thiss!1504) (minValue!4499 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4658 thiss!1504)) key!932))))

(declare-fun res!123423 () Bool)

(declare-fun e!163501 () Bool)

(assert (=> start!24100 (=> (not res!123423) (not e!163501))))

(declare-fun valid!1456 (LongMapFixedSize!3722) Bool)

(assert (=> start!24100 (= res!123423 (valid!1456 thiss!1504))))

(assert (=> start!24100 e!163501))

(assert (=> start!24100 e!163494))

(assert (=> start!24100 true))

(declare-fun b!252123 () Bool)

(declare-fun e!163508 () Bool)

(assert (=> b!252123 (= e!163508 (is-Undefined!1131 lt!126365))))

(declare-fun b!252124 () Bool)

(declare-fun c!42465 () Bool)

(assert (=> b!252124 (= c!42465 (is-MissingVacant!1131 lt!126365))))

(assert (=> b!252124 (= e!163499 e!163508)))

(declare-fun b!252125 () Bool)

(declare-fun Unit!7806 () Unit!7804)

(assert (=> b!252125 (= e!163495 Unit!7806)))

(declare-fun lt!126360 () Unit!7804)

(declare-fun lemmaArrayContainsKeyThenInListMap!209 (array!12343 array!12341 (_ BitVec 32) (_ BitVec 32) V!8325 V!8325 (_ BitVec 64) (_ BitVec 32) Int) Unit!7804)

(assert (=> b!252125 (= lt!126360 (lemmaArrayContainsKeyThenInListMap!209 (_keys!6804 thiss!1504) (_values!4641 thiss!1504) (mask!10870 thiss!1504) (extraKeys!4395 thiss!1504) (zeroValue!4499 thiss!1504) (minValue!4499 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4658 thiss!1504)))))

(assert (=> b!252125 false))

(declare-fun b!252126 () Bool)

(declare-fun e!163503 () Bool)

(assert (=> b!252126 (= e!163503 tp_is_empty!6509)))

(declare-fun b!252127 () Bool)

(assert (=> b!252127 (= e!163508 e!163502)))

(declare-fun res!123421 () Bool)

(assert (=> b!252127 (= res!123421 call!23732)))

(assert (=> b!252127 (=> (not res!123421) (not e!163502))))

(declare-fun b!252128 () Bool)

(declare-fun call!23731 () Bool)

(assert (=> b!252128 (= e!163497 (not call!23731))))

(declare-fun mapIsEmpty!11067 () Bool)

(declare-fun mapRes!11067 () Bool)

(assert (=> mapIsEmpty!11067 mapRes!11067))

(declare-fun b!252129 () Bool)

(declare-fun Unit!7807 () Unit!7804)

(assert (=> b!252129 (= e!163495 Unit!7807)))

(declare-fun b!252130 () Bool)

(declare-fun e!163505 () Bool)

(assert (=> b!252130 (= e!163505 tp_is_empty!6509)))

(declare-fun b!252131 () Bool)

(declare-fun res!123416 () Bool)

(assert (=> b!252131 (=> (not res!123416) (not e!163497))))

(assert (=> b!252131 (= res!123416 (= (select (arr!5851 (_keys!6804 thiss!1504)) (index!6694 lt!126365)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252132 () Bool)

(declare-fun res!123419 () Bool)

(assert (=> b!252132 (=> (not res!123419) (not e!163501))))

(assert (=> b!252132 (= res!123419 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!11067 () Bool)

(declare-fun tp!23216 () Bool)

(assert (=> mapNonEmpty!11067 (= mapRes!11067 (and tp!23216 e!163505))))

(declare-fun mapKey!11067 () (_ BitVec 32))

(declare-fun mapValue!11067 () ValueCell!2911)

(declare-fun mapRest!11067 () (Array (_ BitVec 32) ValueCell!2911))

(assert (=> mapNonEmpty!11067 (= (arr!5850 (_values!4641 thiss!1504)) (store mapRest!11067 mapKey!11067 mapValue!11067))))

(declare-fun b!252133 () Bool)

(assert (=> b!252133 (= e!163498 (and e!163503 mapRes!11067))))

(declare-fun condMapEmpty!11067 () Bool)

(declare-fun mapDefault!11067 () ValueCell!2911)

