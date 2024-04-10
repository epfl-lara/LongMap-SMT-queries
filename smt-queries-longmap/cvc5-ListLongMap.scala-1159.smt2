; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24378 () Bool)

(assert start!24378)

(declare-fun b!255397 () Bool)

(declare-fun b_free!6703 () Bool)

(declare-fun b_next!6703 () Bool)

(assert (=> b!255397 (= b_free!6703 (not b_next!6703))))

(declare-fun tp!23402 () Bool)

(declare-fun b_and!13753 () Bool)

(assert (=> b!255397 (= tp!23402 b_and!13753)))

(declare-fun b!255396 () Bool)

(declare-fun res!124990 () Bool)

(declare-fun e!165555 () Bool)

(assert (=> b!255396 (=> (not res!124990) (not e!165555))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!255396 (= res!124990 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!165553 () Bool)

(declare-datatypes ((V!8401 0))(
  ( (V!8402 (val!3327 Int)) )
))
(declare-datatypes ((ValueCell!2939 0))(
  ( (ValueCellFull!2939 (v!5407 V!8401)) (EmptyCell!2939) )
))
(declare-datatypes ((array!12465 0))(
  ( (array!12466 (arr!5906 (Array (_ BitVec 32) ValueCell!2939)) (size!6253 (_ BitVec 32))) )
))
(declare-datatypes ((array!12467 0))(
  ( (array!12468 (arr!5907 (Array (_ BitVec 32) (_ BitVec 64))) (size!6254 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3778 0))(
  ( (LongMapFixedSize!3779 (defaultEntry!4712 Int) (mask!10972 (_ BitVec 32)) (extraKeys!4449 (_ BitVec 32)) (zeroValue!4553 V!8401) (minValue!4553 V!8401) (_size!1938 (_ BitVec 32)) (_keys!6870 array!12467) (_values!4695 array!12465) (_vacant!1938 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3778)

(declare-fun e!165559 () Bool)

(declare-fun tp_is_empty!6565 () Bool)

(declare-fun array_inv!3905 (array!12467) Bool)

(declare-fun array_inv!3906 (array!12465) Bool)

(assert (=> b!255397 (= e!165553 (and tp!23402 tp_is_empty!6565 (array_inv!3905 (_keys!6870 thiss!1504)) (array_inv!3906 (_values!4695 thiss!1504)) e!165559))))

(declare-fun mapIsEmpty!11169 () Bool)

(declare-fun mapRes!11169 () Bool)

(assert (=> mapIsEmpty!11169 mapRes!11169))

(declare-fun res!124993 () Bool)

(assert (=> start!24378 (=> (not res!124993) (not e!165555))))

(declare-fun valid!1477 (LongMapFixedSize!3778) Bool)

(assert (=> start!24378 (= res!124993 (valid!1477 thiss!1504))))

(assert (=> start!24378 e!165555))

(assert (=> start!24378 e!165553))

(assert (=> start!24378 true))

(assert (=> start!24378 tp_is_empty!6565))

(declare-fun bm!24139 () Bool)

(declare-fun call!24143 () Bool)

(declare-fun arrayContainsKey!0 (array!12467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24139 (= call!24143 (arrayContainsKey!0 (_keys!6870 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255398 () Bool)

(declare-fun res!124994 () Bool)

(declare-datatypes ((SeekEntryResult!1157 0))(
  ( (MissingZero!1157 (index!6798 (_ BitVec 32))) (Found!1157 (index!6799 (_ BitVec 32))) (Intermediate!1157 (undefined!1969 Bool) (index!6800 (_ BitVec 32)) (x!24917 (_ BitVec 32))) (Undefined!1157) (MissingVacant!1157 (index!6801 (_ BitVec 32))) )
))
(declare-fun lt!128095 () SeekEntryResult!1157)

(assert (=> b!255398 (= res!124994 (= (select (arr!5907 (_keys!6870 thiss!1504)) (index!6801 lt!128095)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165556 () Bool)

(assert (=> b!255398 (=> (not res!124994) (not e!165556))))

(declare-fun b!255399 () Bool)

(declare-fun res!124991 () Bool)

(declare-fun e!165554 () Bool)

(assert (=> b!255399 (=> (not res!124991) (not e!165554))))

(assert (=> b!255399 (= res!124991 (= (select (arr!5907 (_keys!6870 thiss!1504)) (index!6798 lt!128095)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255400 () Bool)

(assert (=> b!255400 (= e!165554 (not call!24143))))

(declare-fun b!255401 () Bool)

(assert (=> b!255401 (= e!165556 (not call!24143))))

(declare-fun b!255402 () Bool)

(declare-fun c!43119 () Bool)

(assert (=> b!255402 (= c!43119 (is-MissingVacant!1157 lt!128095))))

(declare-fun e!165546 () Bool)

(declare-fun e!165549 () Bool)

(assert (=> b!255402 (= e!165546 e!165549)))

(declare-fun b!255403 () Bool)

(declare-datatypes ((Unit!7925 0))(
  ( (Unit!7926) )
))
(declare-fun e!165548 () Unit!7925)

(declare-fun Unit!7927 () Unit!7925)

(assert (=> b!255403 (= e!165548 Unit!7927)))

(declare-fun b!255404 () Bool)

(declare-fun e!165547 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!255404 (= e!165547 (not (or (bvslt index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6254 (_keys!6870 thiss!1504))))))))

(declare-fun lt!128098 () array!12467)

(declare-fun v!346 () V!8401)

(declare-datatypes ((tuple2!4900 0))(
  ( (tuple2!4901 (_1!2461 (_ BitVec 64)) (_2!2461 V!8401)) )
))
(declare-datatypes ((List!3780 0))(
  ( (Nil!3777) (Cons!3776 (h!4438 tuple2!4900) (t!8831 List!3780)) )
))
(declare-datatypes ((ListLongMap!3813 0))(
  ( (ListLongMap!3814 (toList!1922 List!3780)) )
))
(declare-fun lt!128106 () ListLongMap!3813)

(declare-fun +!677 (ListLongMap!3813 tuple2!4900) ListLongMap!3813)

(declare-fun getCurrentListMap!1450 (array!12467 array!12465 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 32) Int) ListLongMap!3813)

(assert (=> b!255404 (= (+!677 lt!128106 (tuple2!4901 key!932 v!346)) (getCurrentListMap!1450 lt!128098 (array!12466 (store (arr!5906 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6253 (_values!4695 thiss!1504))) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128101 () Unit!7925)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!87 (array!12467 array!12465 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 32) (_ BitVec 64) V!8401 Int) Unit!7925)

(assert (=> b!255404 (= lt!128101 (lemmaAddValidKeyToArrayThenAddPairToListMap!87 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) index!297 key!932 v!346 (defaultEntry!4712 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12467 (_ BitVec 32)) Bool)

(assert (=> b!255404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128098 (mask!10972 thiss!1504))))

(declare-fun lt!128096 () Unit!7925)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12467 (_ BitVec 32) (_ BitVec 32)) Unit!7925)

(assert (=> b!255404 (= lt!128096 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6870 thiss!1504) index!297 (mask!10972 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12467 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!255404 (= (arrayCountValidKeys!0 lt!128098 #b00000000000000000000000000000000 (size!6254 (_keys!6870 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6870 thiss!1504) #b00000000000000000000000000000000 (size!6254 (_keys!6870 thiss!1504)))))))

(declare-fun lt!128102 () Unit!7925)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12467 (_ BitVec 32) (_ BitVec 64)) Unit!7925)

(assert (=> b!255404 (= lt!128102 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6870 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3781 0))(
  ( (Nil!3778) (Cons!3777 (h!4439 (_ BitVec 64)) (t!8832 List!3781)) )
))
(declare-fun arrayNoDuplicates!0 (array!12467 (_ BitVec 32) List!3781) Bool)

(assert (=> b!255404 (arrayNoDuplicates!0 lt!128098 #b00000000000000000000000000000000 Nil!3778)))

(assert (=> b!255404 (= lt!128098 (array!12468 (store (arr!5907 (_keys!6870 thiss!1504)) index!297 key!932) (size!6254 (_keys!6870 thiss!1504))))))

(declare-fun lt!128100 () Unit!7925)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12467 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3781) Unit!7925)

(assert (=> b!255404 (= lt!128100 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6870 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3778))))

(declare-fun lt!128104 () Unit!7925)

(assert (=> b!255404 (= lt!128104 e!165548)))

(declare-fun c!43120 () Bool)

(assert (=> b!255404 (= c!43120 (arrayContainsKey!0 (_keys!6870 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255405 () Bool)

(declare-fun e!165558 () Bool)

(assert (=> b!255405 (= e!165558 e!165547)))

(declare-fun res!124988 () Bool)

(assert (=> b!255405 (=> (not res!124988) (not e!165547))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255405 (= res!124988 (inRange!0 index!297 (mask!10972 thiss!1504)))))

(declare-fun lt!128097 () Unit!7925)

(declare-fun e!165552 () Unit!7925)

(assert (=> b!255405 (= lt!128097 e!165552)))

(declare-fun c!43122 () Bool)

(declare-fun contains!1856 (ListLongMap!3813 (_ BitVec 64)) Bool)

(assert (=> b!255405 (= c!43122 (contains!1856 lt!128106 key!932))))

(assert (=> b!255405 (= lt!128106 (getCurrentListMap!1450 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun b!255406 () Bool)

(declare-fun e!165551 () Bool)

(assert (=> b!255406 (= e!165551 tp_is_empty!6565)))

(declare-fun b!255407 () Bool)

(declare-fun e!165550 () Bool)

(assert (=> b!255407 (= e!165559 (and e!165550 mapRes!11169))))

(declare-fun condMapEmpty!11169 () Bool)

(declare-fun mapDefault!11169 () ValueCell!2939)

