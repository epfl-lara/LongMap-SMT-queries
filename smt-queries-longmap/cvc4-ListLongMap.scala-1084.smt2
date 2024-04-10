; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22190 () Bool)

(assert start!22190)

(declare-fun b!232380 () Bool)

(declare-fun b_free!6257 () Bool)

(declare-fun b_next!6257 () Bool)

(assert (=> b!232380 (= b_free!6257 (not b_next!6257))))

(declare-fun tp!21913 () Bool)

(declare-fun b_and!13155 () Bool)

(assert (=> b!232380 (= tp!21913 b_and!13155)))

(declare-fun e!150912 () Bool)

(declare-fun e!150913 () Bool)

(declare-datatypes ((V!7805 0))(
  ( (V!7806 (val!3104 Int)) )
))
(declare-datatypes ((ValueCell!2716 0))(
  ( (ValueCellFull!2716 (v!5124 V!7805)) (EmptyCell!2716) )
))
(declare-datatypes ((array!11481 0))(
  ( (array!11482 (arr!5460 (Array (_ BitVec 32) ValueCell!2716)) (size!5793 (_ BitVec 32))) )
))
(declare-datatypes ((array!11483 0))(
  ( (array!11484 (arr!5461 (Array (_ BitVec 32) (_ BitVec 64))) (size!5794 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3332 0))(
  ( (LongMapFixedSize!3333 (defaultEntry!4325 Int) (mask!10237 (_ BitVec 32)) (extraKeys!4062 (_ BitVec 32)) (zeroValue!4166 V!7805) (minValue!4166 V!7805) (_size!1715 (_ BitVec 32)) (_keys!6379 array!11483) (_values!4308 array!11481) (_vacant!1715 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3332)

(declare-fun tp_is_empty!6119 () Bool)

(declare-fun array_inv!3599 (array!11483) Bool)

(declare-fun array_inv!3600 (array!11481) Bool)

(assert (=> b!232380 (= e!150912 (and tp!21913 tp_is_empty!6119 (array_inv!3599 (_keys!6379 thiss!1504)) (array_inv!3600 (_values!4308 thiss!1504)) e!150913))))

(declare-fun b!232381 () Bool)

(declare-fun e!150902 () Bool)

(assert (=> b!232381 (= e!150902 (not true))))

(declare-fun lt!117334 () array!11483)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11483 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232381 (= (arrayCountValidKeys!0 lt!117334 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!7178 0))(
  ( (Unit!7179) )
))
(declare-fun lt!117330 () Unit!7178)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11483 (_ BitVec 32)) Unit!7178)

(assert (=> b!232381 (= lt!117330 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117334 index!297))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232381 (arrayContainsKey!0 lt!117334 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117331 () Unit!7178)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11483 (_ BitVec 64) (_ BitVec 32)) Unit!7178)

(assert (=> b!232381 (= lt!117331 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117334 key!932 index!297))))

(declare-datatypes ((tuple2!4582 0))(
  ( (tuple2!4583 (_1!2302 (_ BitVec 64)) (_2!2302 V!7805)) )
))
(declare-datatypes ((List!3499 0))(
  ( (Nil!3496) (Cons!3495 (h!4143 tuple2!4582) (t!8458 List!3499)) )
))
(declare-datatypes ((ListLongMap!3495 0))(
  ( (ListLongMap!3496 (toList!1763 List!3499)) )
))
(declare-fun lt!117335 () ListLongMap!3495)

(declare-fun v!346 () V!7805)

(declare-fun +!625 (ListLongMap!3495 tuple2!4582) ListLongMap!3495)

(declare-fun getCurrentListMap!1291 (array!11483 array!11481 (_ BitVec 32) (_ BitVec 32) V!7805 V!7805 (_ BitVec 32) Int) ListLongMap!3495)

(assert (=> b!232381 (= (+!625 lt!117335 (tuple2!4583 key!932 v!346)) (getCurrentListMap!1291 lt!117334 (array!11482 (store (arr!5460 (_values!4308 thiss!1504)) index!297 (ValueCellFull!2716 v!346)) (size!5793 (_values!4308 thiss!1504))) (mask!10237 thiss!1504) (extraKeys!4062 thiss!1504) (zeroValue!4166 thiss!1504) (minValue!4166 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4325 thiss!1504)))))

(declare-fun lt!117332 () Unit!7178)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!79 (array!11483 array!11481 (_ BitVec 32) (_ BitVec 32) V!7805 V!7805 (_ BitVec 32) (_ BitVec 64) V!7805 Int) Unit!7178)

(assert (=> b!232381 (= lt!117332 (lemmaAddValidKeyToArrayThenAddPairToListMap!79 (_keys!6379 thiss!1504) (_values!4308 thiss!1504) (mask!10237 thiss!1504) (extraKeys!4062 thiss!1504) (zeroValue!4166 thiss!1504) (minValue!4166 thiss!1504) index!297 key!932 v!346 (defaultEntry!4325 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11483 (_ BitVec 32)) Bool)

(assert (=> b!232381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117334 (mask!10237 thiss!1504))))

(declare-fun lt!117325 () Unit!7178)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11483 (_ BitVec 32) (_ BitVec 32)) Unit!7178)

(assert (=> b!232381 (= lt!117325 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6379 thiss!1504) index!297 (mask!10237 thiss!1504)))))

(assert (=> b!232381 (= (arrayCountValidKeys!0 lt!117334 #b00000000000000000000000000000000 (size!5794 (_keys!6379 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6379 thiss!1504) #b00000000000000000000000000000000 (size!5794 (_keys!6379 thiss!1504)))))))

(declare-fun lt!117326 () Unit!7178)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11483 (_ BitVec 32) (_ BitVec 64)) Unit!7178)

(assert (=> b!232381 (= lt!117326 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6379 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3500 0))(
  ( (Nil!3497) (Cons!3496 (h!4144 (_ BitVec 64)) (t!8459 List!3500)) )
))
(declare-fun arrayNoDuplicates!0 (array!11483 (_ BitVec 32) List!3500) Bool)

(assert (=> b!232381 (arrayNoDuplicates!0 lt!117334 #b00000000000000000000000000000000 Nil!3497)))

(assert (=> b!232381 (= lt!117334 (array!11484 (store (arr!5461 (_keys!6379 thiss!1504)) index!297 key!932) (size!5794 (_keys!6379 thiss!1504))))))

(declare-fun lt!117327 () Unit!7178)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11483 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3500) Unit!7178)

(assert (=> b!232381 (= lt!117327 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6379 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3497))))

(declare-fun lt!117338 () Unit!7178)

(declare-fun e!150903 () Unit!7178)

(assert (=> b!232381 (= lt!117338 e!150903)))

(declare-fun c!38639 () Bool)

(assert (=> b!232381 (= c!38639 (arrayContainsKey!0 (_keys!6379 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232382 () Bool)

(declare-fun e!150901 () Bool)

(declare-fun call!21605 () Bool)

(assert (=> b!232382 (= e!150901 (not call!21605))))

(declare-fun b!232383 () Bool)

(declare-fun res!114120 () Bool)

(declare-fun e!150906 () Bool)

(assert (=> b!232383 (=> (not res!114120) (not e!150906))))

(assert (=> b!232383 (= res!114120 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232384 () Bool)

(declare-fun e!150907 () Bool)

(assert (=> b!232384 (= e!150907 e!150902)))

(declare-fun res!114115 () Bool)

(assert (=> b!232384 (=> (not res!114115) (not e!150902))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!232384 (= res!114115 (inRange!0 index!297 (mask!10237 thiss!1504)))))

(declare-fun lt!117333 () Unit!7178)

(declare-fun e!150910 () Unit!7178)

(assert (=> b!232384 (= lt!117333 e!150910)))

(declare-fun c!38638 () Bool)

(declare-fun contains!1631 (ListLongMap!3495 (_ BitVec 64)) Bool)

(assert (=> b!232384 (= c!38638 (contains!1631 lt!117335 key!932))))

(assert (=> b!232384 (= lt!117335 (getCurrentListMap!1291 (_keys!6379 thiss!1504) (_values!4308 thiss!1504) (mask!10237 thiss!1504) (extraKeys!4062 thiss!1504) (zeroValue!4166 thiss!1504) (minValue!4166 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4325 thiss!1504)))))

(declare-fun bm!21602 () Bool)

(assert (=> bm!21602 (= call!21605 (arrayContainsKey!0 (_keys!6379 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232385 () Bool)

(declare-fun e!150909 () Bool)

(assert (=> b!232385 (= e!150909 tp_is_empty!6119)))

(declare-fun b!232387 () Bool)

(declare-fun e!150908 () Bool)

(assert (=> b!232387 (= e!150908 (not call!21605))))

(declare-fun b!232388 () Bool)

(declare-fun e!150904 () Bool)

(declare-datatypes ((SeekEntryResult!964 0))(
  ( (MissingZero!964 (index!6026 (_ BitVec 32))) (Found!964 (index!6027 (_ BitVec 32))) (Intermediate!964 (undefined!1776 Bool) (index!6028 (_ BitVec 32)) (x!23552 (_ BitVec 32))) (Undefined!964) (MissingVacant!964 (index!6029 (_ BitVec 32))) )
))
(declare-fun lt!117329 () SeekEntryResult!964)

(assert (=> b!232388 (= e!150904 (is-Undefined!964 lt!117329))))

(declare-fun b!232389 () Bool)

(assert (=> b!232389 (= e!150906 e!150907)))

(declare-fun res!114121 () Bool)

(assert (=> b!232389 (=> (not res!114121) (not e!150907))))

(assert (=> b!232389 (= res!114121 (or (= lt!117329 (MissingZero!964 index!297)) (= lt!117329 (MissingVacant!964 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11483 (_ BitVec 32)) SeekEntryResult!964)

(assert (=> b!232389 (= lt!117329 (seekEntryOrOpen!0 key!932 (_keys!6379 thiss!1504) (mask!10237 thiss!1504)))))

(declare-fun b!232390 () Bool)

(declare-fun Unit!7180 () Unit!7178)

(assert (=> b!232390 (= e!150903 Unit!7180)))

(declare-fun c!38640 () Bool)

(declare-fun call!21606 () Bool)

(declare-fun bm!21603 () Bool)

(assert (=> bm!21603 (= call!21606 (inRange!0 (ite c!38640 (index!6026 lt!117329) (index!6029 lt!117329)) (mask!10237 thiss!1504)))))

(declare-fun b!232391 () Bool)

(declare-fun res!114117 () Bool)

(assert (=> b!232391 (=> (not res!114117) (not e!150908))))

(assert (=> b!232391 (= res!114117 call!21606)))

(declare-fun e!150911 () Bool)

(assert (=> b!232391 (= e!150911 e!150908)))

(declare-fun b!232392 () Bool)

(declare-fun res!114118 () Bool)

(assert (=> b!232392 (= res!114118 (= (select (arr!5461 (_keys!6379 thiss!1504)) (index!6029 lt!117329)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!232392 (=> (not res!114118) (not e!150901))))

(declare-fun mapIsEmpty!10348 () Bool)

(declare-fun mapRes!10348 () Bool)

(assert (=> mapIsEmpty!10348 mapRes!10348))

(declare-fun b!232393 () Bool)

(assert (=> b!232393 (= e!150913 (and e!150909 mapRes!10348))))

(declare-fun condMapEmpty!10348 () Bool)

(declare-fun mapDefault!10348 () ValueCell!2716)

