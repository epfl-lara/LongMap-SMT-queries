; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24760 () Bool)

(assert start!24760)

(declare-fun b!258768 () Bool)

(declare-fun b_free!6745 () Bool)

(declare-fun b_next!6745 () Bool)

(assert (=> b!258768 (= b_free!6745 (not b_next!6745))))

(declare-fun tp!23551 () Bool)

(declare-fun b_and!13833 () Bool)

(assert (=> b!258768 (= tp!23551 b_and!13833)))

(declare-fun mapIsEmpty!11254 () Bool)

(declare-fun mapRes!11254 () Bool)

(assert (=> mapIsEmpty!11254 mapRes!11254))

(declare-fun b!258754 () Bool)

(declare-datatypes ((Unit!8040 0))(
  ( (Unit!8041) )
))
(declare-fun e!167714 () Unit!8040)

(declare-fun Unit!8042 () Unit!8040)

(assert (=> b!258754 (= e!167714 Unit!8042)))

(declare-fun lt!130283 () Unit!8040)

(declare-datatypes ((V!8457 0))(
  ( (V!8458 (val!3348 Int)) )
))
(declare-datatypes ((ValueCell!2960 0))(
  ( (ValueCellFull!2960 (v!5452 V!8457)) (EmptyCell!2960) )
))
(declare-datatypes ((array!12563 0))(
  ( (array!12564 (arr!5948 (Array (_ BitVec 32) ValueCell!2960)) (size!6296 (_ BitVec 32))) )
))
(declare-datatypes ((array!12565 0))(
  ( (array!12566 (arr!5949 (Array (_ BitVec 32) (_ BitVec 64))) (size!6297 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3820 0))(
  ( (LongMapFixedSize!3821 (defaultEntry!4773 Int) (mask!11081 (_ BitVec 32)) (extraKeys!4510 (_ BitVec 32)) (zeroValue!4614 V!8457) (minValue!4614 V!8457) (_size!1959 (_ BitVec 32)) (_keys!6947 array!12565) (_values!4756 array!12563) (_vacant!1959 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3820)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!437 (array!12565 array!12563 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) Int) Unit!8040)

(assert (=> b!258754 (= lt!130283 (lemmaInListMapThenSeekEntryOrOpenFindsIt!437 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)))))

(assert (=> b!258754 false))

(declare-fun b!258755 () Bool)

(declare-fun e!167721 () Bool)

(declare-fun e!167722 () Bool)

(assert (=> b!258755 (= e!167721 (not e!167722))))

(declare-fun res!126521 () Bool)

(assert (=> b!258755 (=> res!126521 e!167722)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!258755 (= res!126521 (not (validMask!0 (mask!11081 thiss!1504))))))

(declare-fun lt!130281 () array!12565)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12565 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!258755 (= (arrayCountValidKeys!0 lt!130281 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!130290 () Unit!8040)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12565 (_ BitVec 32)) Unit!8040)

(assert (=> b!258755 (= lt!130290 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130281 index!297))))

(declare-fun arrayContainsKey!0 (array!12565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!258755 (arrayContainsKey!0 lt!130281 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130280 () Unit!8040)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12565 (_ BitVec 64) (_ BitVec 32)) Unit!8040)

(assert (=> b!258755 (= lt!130280 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130281 key!932 index!297))))

(declare-datatypes ((tuple2!4936 0))(
  ( (tuple2!4937 (_1!2479 (_ BitVec 64)) (_2!2479 V!8457)) )
))
(declare-datatypes ((List!3815 0))(
  ( (Nil!3812) (Cons!3811 (h!4474 tuple2!4936) (t!8880 List!3815)) )
))
(declare-datatypes ((ListLongMap!3849 0))(
  ( (ListLongMap!3850 (toList!1940 List!3815)) )
))
(declare-fun lt!130292 () ListLongMap!3849)

(declare-fun v!346 () V!8457)

(declare-fun +!694 (ListLongMap!3849 tuple2!4936) ListLongMap!3849)

(declare-fun getCurrentListMap!1468 (array!12565 array!12563 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 32) Int) ListLongMap!3849)

(assert (=> b!258755 (= (+!694 lt!130292 (tuple2!4937 key!932 v!346)) (getCurrentListMap!1468 lt!130281 (array!12564 (store (arr!5948 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6296 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130293 () Unit!8040)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!104 (array!12565 array!12563 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 32) (_ BitVec 64) V!8457 Int) Unit!8040)

(assert (=> b!258755 (= lt!130293 (lemmaAddValidKeyToArrayThenAddPairToListMap!104 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) index!297 key!932 v!346 (defaultEntry!4773 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12565 (_ BitVec 32)) Bool)

(assert (=> b!258755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130281 (mask!11081 thiss!1504))))

(declare-fun lt!130284 () Unit!8040)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12565 (_ BitVec 32) (_ BitVec 32)) Unit!8040)

(assert (=> b!258755 (= lt!130284 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6947 thiss!1504) index!297 (mask!11081 thiss!1504)))))

(assert (=> b!258755 (= (arrayCountValidKeys!0 lt!130281 #b00000000000000000000000000000000 (size!6297 (_keys!6947 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6947 thiss!1504) #b00000000000000000000000000000000 (size!6297 (_keys!6947 thiss!1504)))))))

(declare-fun lt!130288 () Unit!8040)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12565 (_ BitVec 32) (_ BitVec 64)) Unit!8040)

(assert (=> b!258755 (= lt!130288 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6947 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3816 0))(
  ( (Nil!3813) (Cons!3812 (h!4475 (_ BitVec 64)) (t!8881 List!3816)) )
))
(declare-fun arrayNoDuplicates!0 (array!12565 (_ BitVec 32) List!3816) Bool)

(assert (=> b!258755 (arrayNoDuplicates!0 lt!130281 #b00000000000000000000000000000000 Nil!3813)))

(assert (=> b!258755 (= lt!130281 (array!12566 (store (arr!5949 (_keys!6947 thiss!1504)) index!297 key!932) (size!6297 (_keys!6947 thiss!1504))))))

(declare-fun lt!130282 () Unit!8040)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12565 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3816) Unit!8040)

(assert (=> b!258755 (= lt!130282 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6947 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3813))))

(declare-fun lt!130285 () Unit!8040)

(declare-fun e!167713 () Unit!8040)

(assert (=> b!258755 (= lt!130285 e!167713)))

(declare-fun c!43872 () Bool)

(assert (=> b!258755 (= c!43872 (arrayContainsKey!0 (_keys!6947 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258756 () Bool)

(declare-fun e!167711 () Bool)

(declare-fun tp_is_empty!6607 () Bool)

(assert (=> b!258756 (= e!167711 tp_is_empty!6607)))

(declare-fun res!126522 () Bool)

(declare-fun e!167712 () Bool)

(assert (=> start!24760 (=> (not res!126522) (not e!167712))))

(declare-fun valid!1491 (LongMapFixedSize!3820) Bool)

(assert (=> start!24760 (= res!126522 (valid!1491 thiss!1504))))

(assert (=> start!24760 e!167712))

(declare-fun e!167709 () Bool)

(assert (=> start!24760 e!167709))

(assert (=> start!24760 true))

(assert (=> start!24760 tp_is_empty!6607))

(declare-fun b!258757 () Bool)

(assert (=> b!258757 (= e!167722 (or (not (= (size!6296 (_values!4756 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11081 thiss!1504)))) (= (size!6297 (_keys!6947 thiss!1504)) (size!6296 (_values!4756 thiss!1504)))))))

(declare-fun b!258758 () Bool)

(declare-fun Unit!8043 () Unit!8040)

(assert (=> b!258758 (= e!167713 Unit!8043)))

(declare-fun b!258759 () Bool)

(declare-fun Unit!8044 () Unit!8040)

(assert (=> b!258759 (= e!167713 Unit!8044)))

(declare-fun lt!130291 () Unit!8040)

(declare-fun lemmaArrayContainsKeyThenInListMap!245 (array!12565 array!12563 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) (_ BitVec 32) Int) Unit!8040)

(assert (=> b!258759 (= lt!130291 (lemmaArrayContainsKeyThenInListMap!245 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(assert (=> b!258759 false))

(declare-fun b!258760 () Bool)

(declare-fun e!167715 () Bool)

(assert (=> b!258760 (= e!167712 e!167715)))

(declare-fun res!126519 () Bool)

(assert (=> b!258760 (=> (not res!126519) (not e!167715))))

(declare-datatypes ((SeekEntryResult!1176 0))(
  ( (MissingZero!1176 (index!6874 (_ BitVec 32))) (Found!1176 (index!6875 (_ BitVec 32))) (Intermediate!1176 (undefined!1988 Bool) (index!6876 (_ BitVec 32)) (x!25070 (_ BitVec 32))) (Undefined!1176) (MissingVacant!1176 (index!6877 (_ BitVec 32))) )
))
(declare-fun lt!130286 () SeekEntryResult!1176)

(assert (=> b!258760 (= res!126519 (or (= lt!130286 (MissingZero!1176 index!297)) (= lt!130286 (MissingVacant!1176 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12565 (_ BitVec 32)) SeekEntryResult!1176)

(assert (=> b!258760 (= lt!130286 (seekEntryOrOpen!0 key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(declare-fun b!258761 () Bool)

(declare-fun res!126520 () Bool)

(assert (=> b!258761 (= res!126520 (= (select (arr!5949 (_keys!6947 thiss!1504)) (index!6877 lt!130286)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167719 () Bool)

(assert (=> b!258761 (=> (not res!126520) (not e!167719))))

(declare-fun b!258762 () Bool)

(declare-fun e!167723 () Bool)

(declare-fun e!167717 () Bool)

(assert (=> b!258762 (= e!167723 (and e!167717 mapRes!11254))))

(declare-fun condMapEmpty!11254 () Bool)

(declare-fun mapDefault!11254 () ValueCell!2960)

