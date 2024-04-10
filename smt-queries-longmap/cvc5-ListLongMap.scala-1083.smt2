; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22180 () Bool)

(assert start!22180)

(declare-fun b!232088 () Bool)

(declare-fun b_free!6247 () Bool)

(declare-fun b_next!6247 () Bool)

(assert (=> b!232088 (= b_free!6247 (not b_next!6247))))

(declare-fun tp!21882 () Bool)

(declare-fun b_and!13145 () Bool)

(assert (=> b!232088 (= tp!21882 b_and!13145)))

(declare-fun b!232080 () Bool)

(declare-fun e!150693 () Bool)

(assert (=> b!232080 (= e!150693 (not true))))

(declare-datatypes ((array!11461 0))(
  ( (array!11462 (arr!5450 (Array (_ BitVec 32) (_ BitVec 64))) (size!5783 (_ BitVec 32))) )
))
(declare-fun lt!117120 () array!11461)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11461 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232080 (= (arrayCountValidKeys!0 lt!117120 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!7160 0))(
  ( (Unit!7161) )
))
(declare-fun lt!117118 () Unit!7160)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11461 (_ BitVec 32)) Unit!7160)

(assert (=> b!232080 (= lt!117118 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117120 index!297))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232080 (arrayContainsKey!0 lt!117120 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117127 () Unit!7160)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11461 (_ BitVec 64) (_ BitVec 32)) Unit!7160)

(assert (=> b!232080 (= lt!117127 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117120 key!932 index!297))))

(declare-datatypes ((V!7793 0))(
  ( (V!7794 (val!3099 Int)) )
))
(declare-datatypes ((tuple2!4574 0))(
  ( (tuple2!4575 (_1!2298 (_ BitVec 64)) (_2!2298 V!7793)) )
))
(declare-datatypes ((List!3492 0))(
  ( (Nil!3489) (Cons!3488 (h!4136 tuple2!4574) (t!8451 List!3492)) )
))
(declare-datatypes ((ListLongMap!3487 0))(
  ( (ListLongMap!3488 (toList!1759 List!3492)) )
))
(declare-fun lt!117126 () ListLongMap!3487)

(declare-datatypes ((ValueCell!2711 0))(
  ( (ValueCellFull!2711 (v!5119 V!7793)) (EmptyCell!2711) )
))
(declare-datatypes ((array!11463 0))(
  ( (array!11464 (arr!5451 (Array (_ BitVec 32) ValueCell!2711)) (size!5784 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3322 0))(
  ( (LongMapFixedSize!3323 (defaultEntry!4320 Int) (mask!10230 (_ BitVec 32)) (extraKeys!4057 (_ BitVec 32)) (zeroValue!4161 V!7793) (minValue!4161 V!7793) (_size!1710 (_ BitVec 32)) (_keys!6374 array!11461) (_values!4303 array!11463) (_vacant!1710 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3322)

(declare-fun v!346 () V!7793)

(declare-fun +!622 (ListLongMap!3487 tuple2!4574) ListLongMap!3487)

(declare-fun getCurrentListMap!1287 (array!11461 array!11463 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 32) Int) ListLongMap!3487)

(assert (=> b!232080 (= (+!622 lt!117126 (tuple2!4575 key!932 v!346)) (getCurrentListMap!1287 lt!117120 (array!11464 (store (arr!5451 (_values!4303 thiss!1504)) index!297 (ValueCellFull!2711 v!346)) (size!5784 (_values!4303 thiss!1504))) (mask!10230 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4320 thiss!1504)))))

(declare-fun lt!117119 () Unit!7160)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!76 (array!11461 array!11463 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 32) (_ BitVec 64) V!7793 Int) Unit!7160)

(assert (=> b!232080 (= lt!117119 (lemmaAddValidKeyToArrayThenAddPairToListMap!76 (_keys!6374 thiss!1504) (_values!4303 thiss!1504) (mask!10230 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) index!297 key!932 v!346 (defaultEntry!4320 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11461 (_ BitVec 32)) Bool)

(assert (=> b!232080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117120 (mask!10230 thiss!1504))))

(declare-fun lt!117116 () Unit!7160)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11461 (_ BitVec 32) (_ BitVec 32)) Unit!7160)

(assert (=> b!232080 (= lt!117116 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6374 thiss!1504) index!297 (mask!10230 thiss!1504)))))

(assert (=> b!232080 (= (arrayCountValidKeys!0 lt!117120 #b00000000000000000000000000000000 (size!5783 (_keys!6374 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6374 thiss!1504) #b00000000000000000000000000000000 (size!5783 (_keys!6374 thiss!1504)))))))

(declare-fun lt!117115 () Unit!7160)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11461 (_ BitVec 32) (_ BitVec 64)) Unit!7160)

(assert (=> b!232080 (= lt!117115 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6374 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3493 0))(
  ( (Nil!3490) (Cons!3489 (h!4137 (_ BitVec 64)) (t!8452 List!3493)) )
))
(declare-fun arrayNoDuplicates!0 (array!11461 (_ BitVec 32) List!3493) Bool)

(assert (=> b!232080 (arrayNoDuplicates!0 lt!117120 #b00000000000000000000000000000000 Nil!3490)))

(assert (=> b!232080 (= lt!117120 (array!11462 (store (arr!5450 (_keys!6374 thiss!1504)) index!297 key!932) (size!5783 (_keys!6374 thiss!1504))))))

(declare-fun lt!117117 () Unit!7160)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11461 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3493) Unit!7160)

(assert (=> b!232080 (= lt!117117 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6374 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3490))))

(declare-fun lt!117123 () Unit!7160)

(declare-fun e!150704 () Unit!7160)

(assert (=> b!232080 (= lt!117123 e!150704)))

(declare-fun c!38577 () Bool)

(assert (=> b!232080 (= c!38577 (arrayContainsKey!0 (_keys!6374 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232081 () Bool)

(declare-fun res!113996 () Bool)

(declare-fun e!150694 () Bool)

(assert (=> b!232081 (=> (not res!113996) (not e!150694))))

(assert (=> b!232081 (= res!113996 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232082 () Bool)

(declare-fun e!150692 () Bool)

(declare-fun e!150697 () Bool)

(declare-fun mapRes!10333 () Bool)

(assert (=> b!232082 (= e!150692 (and e!150697 mapRes!10333))))

(declare-fun condMapEmpty!10333 () Bool)

(declare-fun mapDefault!10333 () ValueCell!2711)

