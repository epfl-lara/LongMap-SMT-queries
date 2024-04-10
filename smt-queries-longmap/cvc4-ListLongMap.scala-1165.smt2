; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24660 () Bool)

(assert start!24660)

(declare-fun b!258090 () Bool)

(declare-fun b_free!6743 () Bool)

(declare-fun b_next!6743 () Bool)

(assert (=> b!258090 (= b_free!6743 (not b_next!6743))))

(declare-fun tp!23541 () Bool)

(declare-fun b_and!13817 () Bool)

(assert (=> b!258090 (= tp!23541 b_and!13817)))

(declare-fun bm!24525 () Bool)

(declare-fun call!24528 () Bool)

(declare-datatypes ((V!8453 0))(
  ( (V!8454 (val!3347 Int)) )
))
(declare-datatypes ((ValueCell!2959 0))(
  ( (ValueCellFull!2959 (v!5445 V!8453)) (EmptyCell!2959) )
))
(declare-datatypes ((array!12557 0))(
  ( (array!12558 (arr!5946 (Array (_ BitVec 32) ValueCell!2959)) (size!6293 (_ BitVec 32))) )
))
(declare-datatypes ((array!12559 0))(
  ( (array!12560 (arr!5947 (Array (_ BitVec 32) (_ BitVec 64))) (size!6294 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3818 0))(
  ( (LongMapFixedSize!3819 (defaultEntry!4762 Int) (mask!11059 (_ BitVec 32)) (extraKeys!4499 (_ BitVec 32)) (zeroValue!4603 V!8453) (minValue!4603 V!8453) (_size!1958 (_ BitVec 32)) (_keys!6932 array!12559) (_values!4745 array!12557) (_vacant!1958 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3818)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24525 (= call!24528 (arrayContainsKey!0 (_keys!6932 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258075 () Bool)

(declare-fun res!126207 () Bool)

(declare-fun e!167306 () Bool)

(assert (=> b!258075 (=> (not res!126207) (not e!167306))))

(declare-fun call!24529 () Bool)

(assert (=> b!258075 (= res!126207 call!24529)))

(declare-fun e!167304 () Bool)

(assert (=> b!258075 (= e!167304 e!167306)))

(declare-fun mapNonEmpty!11247 () Bool)

(declare-fun mapRes!11247 () Bool)

(declare-fun tp!23540 () Bool)

(declare-fun e!167305 () Bool)

(assert (=> mapNonEmpty!11247 (= mapRes!11247 (and tp!23540 e!167305))))

(declare-fun mapRest!11247 () (Array (_ BitVec 32) ValueCell!2959))

(declare-fun mapValue!11247 () ValueCell!2959)

(declare-fun mapKey!11247 () (_ BitVec 32))

(assert (=> mapNonEmpty!11247 (= (arr!5946 (_values!4745 thiss!1504)) (store mapRest!11247 mapKey!11247 mapValue!11247))))

(declare-fun b!258076 () Bool)

(declare-datatypes ((Unit!8022 0))(
  ( (Unit!8023) )
))
(declare-fun e!167307 () Unit!8022)

(declare-fun Unit!8024 () Unit!8022)

(assert (=> b!258076 (= e!167307 Unit!8024)))

(declare-fun lt!129865 () Unit!8022)

(declare-fun lemmaArrayContainsKeyThenInListMap!244 (array!12559 array!12557 (_ BitVec 32) (_ BitVec 32) V!8453 V!8453 (_ BitVec 64) (_ BitVec 32) Int) Unit!8022)

(assert (=> b!258076 (= lt!129865 (lemmaArrayContainsKeyThenInListMap!244 (_keys!6932 thiss!1504) (_values!4745 thiss!1504) (mask!11059 thiss!1504) (extraKeys!4499 thiss!1504) (zeroValue!4603 thiss!1504) (minValue!4603 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4762 thiss!1504)))))

(assert (=> b!258076 false))

(declare-fun b!258077 () Bool)

(declare-fun e!167299 () Bool)

(declare-fun tp_is_empty!6605 () Bool)

(assert (=> b!258077 (= e!167299 tp_is_empty!6605)))

(declare-fun b!258078 () Bool)

(declare-fun res!126208 () Bool)

(declare-datatypes ((SeekEntryResult!1175 0))(
  ( (MissingZero!1175 (index!6870 (_ BitVec 32))) (Found!1175 (index!6871 (_ BitVec 32))) (Intermediate!1175 (undefined!1987 Bool) (index!6872 (_ BitVec 32)) (x!25043 (_ BitVec 32))) (Undefined!1175) (MissingVacant!1175 (index!6873 (_ BitVec 32))) )
))
(declare-fun lt!129871 () SeekEntryResult!1175)

(assert (=> b!258078 (= res!126208 (= (select (arr!5947 (_keys!6932 thiss!1504)) (index!6873 lt!129871)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167294 () Bool)

(assert (=> b!258078 (=> (not res!126208) (not e!167294))))

(declare-fun b!258079 () Bool)

(assert (=> b!258079 (= e!167305 tp_is_empty!6605)))

(declare-fun b!258080 () Bool)

(declare-fun e!167295 () Bool)

(declare-fun e!167301 () Bool)

(assert (=> b!258080 (= e!167295 (not e!167301))))

(declare-fun res!126212 () Bool)

(assert (=> b!258080 (=> res!126212 e!167301)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!258080 (= res!126212 (not (validMask!0 (mask!11059 thiss!1504))))))

(declare-fun lt!129863 () array!12559)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12559 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!258080 (= (arrayCountValidKeys!0 lt!129863 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!129869 () Unit!8022)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12559 (_ BitVec 32)) Unit!8022)

(assert (=> b!258080 (= lt!129869 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129863 index!297))))

(assert (=> b!258080 (arrayContainsKey!0 lt!129863 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129868 () Unit!8022)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12559 (_ BitVec 64) (_ BitVec 32)) Unit!8022)

(assert (=> b!258080 (= lt!129868 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129863 key!932 index!297))))

(declare-datatypes ((tuple2!4934 0))(
  ( (tuple2!4935 (_1!2478 (_ BitVec 64)) (_2!2478 V!8453)) )
))
(declare-datatypes ((List!3813 0))(
  ( (Nil!3810) (Cons!3809 (h!4471 tuple2!4934) (t!8876 List!3813)) )
))
(declare-datatypes ((ListLongMap!3847 0))(
  ( (ListLongMap!3848 (toList!1939 List!3813)) )
))
(declare-fun lt!129867 () ListLongMap!3847)

(declare-fun v!346 () V!8453)

(declare-fun +!693 (ListLongMap!3847 tuple2!4934) ListLongMap!3847)

(declare-fun getCurrentListMap!1467 (array!12559 array!12557 (_ BitVec 32) (_ BitVec 32) V!8453 V!8453 (_ BitVec 32) Int) ListLongMap!3847)

(assert (=> b!258080 (= (+!693 lt!129867 (tuple2!4935 key!932 v!346)) (getCurrentListMap!1467 lt!129863 (array!12558 (store (arr!5946 (_values!4745 thiss!1504)) index!297 (ValueCellFull!2959 v!346)) (size!6293 (_values!4745 thiss!1504))) (mask!11059 thiss!1504) (extraKeys!4499 thiss!1504) (zeroValue!4603 thiss!1504) (minValue!4603 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4762 thiss!1504)))))

(declare-fun lt!129861 () Unit!8022)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!103 (array!12559 array!12557 (_ BitVec 32) (_ BitVec 32) V!8453 V!8453 (_ BitVec 32) (_ BitVec 64) V!8453 Int) Unit!8022)

(assert (=> b!258080 (= lt!129861 (lemmaAddValidKeyToArrayThenAddPairToListMap!103 (_keys!6932 thiss!1504) (_values!4745 thiss!1504) (mask!11059 thiss!1504) (extraKeys!4499 thiss!1504) (zeroValue!4603 thiss!1504) (minValue!4603 thiss!1504) index!297 key!932 v!346 (defaultEntry!4762 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12559 (_ BitVec 32)) Bool)

(assert (=> b!258080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129863 (mask!11059 thiss!1504))))

(declare-fun lt!129866 () Unit!8022)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12559 (_ BitVec 32) (_ BitVec 32)) Unit!8022)

(assert (=> b!258080 (= lt!129866 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6932 thiss!1504) index!297 (mask!11059 thiss!1504)))))

(assert (=> b!258080 (= (arrayCountValidKeys!0 lt!129863 #b00000000000000000000000000000000 (size!6294 (_keys!6932 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6932 thiss!1504) #b00000000000000000000000000000000 (size!6294 (_keys!6932 thiss!1504)))))))

(declare-fun lt!129870 () Unit!8022)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12559 (_ BitVec 32) (_ BitVec 64)) Unit!8022)

(assert (=> b!258080 (= lt!129870 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6932 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3814 0))(
  ( (Nil!3811) (Cons!3810 (h!4472 (_ BitVec 64)) (t!8877 List!3814)) )
))
(declare-fun arrayNoDuplicates!0 (array!12559 (_ BitVec 32) List!3814) Bool)

(assert (=> b!258080 (arrayNoDuplicates!0 lt!129863 #b00000000000000000000000000000000 Nil!3811)))

(assert (=> b!258080 (= lt!129863 (array!12560 (store (arr!5947 (_keys!6932 thiss!1504)) index!297 key!932) (size!6294 (_keys!6932 thiss!1504))))))

(declare-fun lt!129872 () Unit!8022)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12559 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3814) Unit!8022)

(assert (=> b!258080 (= lt!129872 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6932 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3811))))

(declare-fun lt!129860 () Unit!8022)

(assert (=> b!258080 (= lt!129860 e!167307)))

(declare-fun c!43700 () Bool)

(assert (=> b!258080 (= c!43700 (arrayContainsKey!0 (_keys!6932 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258081 () Bool)

(assert (=> b!258081 (= e!167306 (not call!24528))))

(declare-fun b!258082 () Bool)

(declare-fun e!167296 () Bool)

(assert (=> b!258082 (= e!167296 (is-Undefined!1175 lt!129871))))

(declare-fun b!258083 () Bool)

(declare-fun e!167297 () Bool)

(assert (=> b!258083 (= e!167297 e!167295)))

(declare-fun res!126211 () Bool)

(assert (=> b!258083 (=> (not res!126211) (not e!167295))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!258083 (= res!126211 (inRange!0 index!297 (mask!11059 thiss!1504)))))

(declare-fun lt!129862 () Unit!8022)

(declare-fun e!167308 () Unit!8022)

(assert (=> b!258083 (= lt!129862 e!167308)))

(declare-fun c!43701 () Bool)

(declare-fun contains!1879 (ListLongMap!3847 (_ BitVec 64)) Bool)

(assert (=> b!258083 (= c!43701 (contains!1879 lt!129867 key!932))))

(assert (=> b!258083 (= lt!129867 (getCurrentListMap!1467 (_keys!6932 thiss!1504) (_values!4745 thiss!1504) (mask!11059 thiss!1504) (extraKeys!4499 thiss!1504) (zeroValue!4603 thiss!1504) (minValue!4603 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4762 thiss!1504)))))

(declare-fun b!258085 () Bool)

(declare-fun c!43699 () Bool)

(assert (=> b!258085 (= c!43699 (is-MissingVacant!1175 lt!129871))))

(assert (=> b!258085 (= e!167304 e!167296)))

(declare-fun b!258086 () Bool)

(declare-fun res!126213 () Bool)

(declare-fun e!167300 () Bool)

(assert (=> b!258086 (=> (not res!126213) (not e!167300))))

(assert (=> b!258086 (= res!126213 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!258087 () Bool)

(assert (=> b!258087 (= e!167294 (not call!24528))))

(declare-fun b!258088 () Bool)

(declare-fun Unit!8025 () Unit!8022)

(assert (=> b!258088 (= e!167307 Unit!8025)))

(declare-fun b!258089 () Bool)

(declare-fun e!167303 () Bool)

(assert (=> b!258089 (= e!167303 (and e!167299 mapRes!11247))))

(declare-fun condMapEmpty!11247 () Bool)

(declare-fun mapDefault!11247 () ValueCell!2959)

