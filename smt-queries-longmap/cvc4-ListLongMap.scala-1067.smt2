; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22088 () Bool)

(assert start!22088)

(declare-fun b!229275 () Bool)

(declare-fun b_free!6155 () Bool)

(declare-fun b_next!6155 () Bool)

(assert (=> b!229275 (= b_free!6155 (not b_next!6155))))

(declare-fun tp!21606 () Bool)

(declare-fun b_and!13053 () Bool)

(assert (=> b!229275 (= tp!21606 b_and!13053)))

(declare-fun b!229263 () Bool)

(declare-datatypes ((Unit!6990 0))(
  ( (Unit!6991) )
))
(declare-fun e!148753 () Unit!6990)

(declare-fun Unit!6992 () Unit!6990)

(assert (=> b!229263 (= e!148753 Unit!6992)))

(declare-fun b!229264 () Bool)

(declare-fun e!148750 () Bool)

(declare-datatypes ((SeekEntryResult!919 0))(
  ( (MissingZero!919 (index!5846 (_ BitVec 32))) (Found!919 (index!5847 (_ BitVec 32))) (Intermediate!919 (undefined!1731 Bool) (index!5848 (_ BitVec 32)) (x!23371 (_ BitVec 32))) (Undefined!919) (MissingVacant!919 (index!5849 (_ BitVec 32))) )
))
(declare-fun lt!115329 () SeekEntryResult!919)

(assert (=> b!229264 (= e!148750 (is-Undefined!919 lt!115329))))

(declare-fun bm!21296 () Bool)

(declare-fun call!21300 () Bool)

(declare-datatypes ((V!7669 0))(
  ( (V!7670 (val!3053 Int)) )
))
(declare-datatypes ((ValueCell!2665 0))(
  ( (ValueCellFull!2665 (v!5073 V!7669)) (EmptyCell!2665) )
))
(declare-datatypes ((array!11277 0))(
  ( (array!11278 (arr!5358 (Array (_ BitVec 32) ValueCell!2665)) (size!5691 (_ BitVec 32))) )
))
(declare-datatypes ((array!11279 0))(
  ( (array!11280 (arr!5359 (Array (_ BitVec 32) (_ BitVec 64))) (size!5692 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3230 0))(
  ( (LongMapFixedSize!3231 (defaultEntry!4274 Int) (mask!10152 (_ BitVec 32)) (extraKeys!4011 (_ BitVec 32)) (zeroValue!4115 V!7669) (minValue!4115 V!7669) (_size!1664 (_ BitVec 32)) (_keys!6328 array!11279) (_values!4257 array!11277) (_vacant!1664 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3230)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21296 (= call!21300 (arrayContainsKey!0 (_keys!6328 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun c!38026 () Bool)

(declare-fun call!21299 () Bool)

(declare-fun bm!21297 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21297 (= call!21299 (inRange!0 (ite c!38026 (index!5846 lt!115329) (index!5849 lt!115329)) (mask!10152 thiss!1504)))))

(declare-fun b!229265 () Bool)

(declare-fun e!148746 () Bool)

(declare-fun e!148749 () Bool)

(assert (=> b!229265 (= e!148746 (not e!148749))))

(declare-fun res!112835 () Bool)

(assert (=> b!229265 (=> res!112835 e!148749)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229265 (= res!112835 (not (validMask!0 (mask!10152 thiss!1504))))))

(declare-fun lt!115321 () array!11279)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11279 (_ BitVec 32)) Bool)

(assert (=> b!229265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115321 (mask!10152 thiss!1504))))

(declare-fun lt!115328 () Unit!6990)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11279 (_ BitVec 32) (_ BitVec 32)) Unit!6990)

(assert (=> b!229265 (= lt!115328 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6328 thiss!1504) index!297 (mask!10152 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11279 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229265 (= (arrayCountValidKeys!0 lt!115321 #b00000000000000000000000000000000 (size!5692 (_keys!6328 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6328 thiss!1504) #b00000000000000000000000000000000 (size!5692 (_keys!6328 thiss!1504)))))))

(declare-fun lt!115331 () Unit!6990)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11279 (_ BitVec 32) (_ BitVec 64)) Unit!6990)

(assert (=> b!229265 (= lt!115331 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6328 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3429 0))(
  ( (Nil!3426) (Cons!3425 (h!4073 (_ BitVec 64)) (t!8388 List!3429)) )
))
(declare-fun arrayNoDuplicates!0 (array!11279 (_ BitVec 32) List!3429) Bool)

(assert (=> b!229265 (arrayNoDuplicates!0 lt!115321 #b00000000000000000000000000000000 Nil!3426)))

(assert (=> b!229265 (= lt!115321 (array!11280 (store (arr!5359 (_keys!6328 thiss!1504)) index!297 key!932) (size!5692 (_keys!6328 thiss!1504))))))

(declare-fun lt!115330 () Unit!6990)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11279 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3429) Unit!6990)

(assert (=> b!229265 (= lt!115330 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6328 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3426))))

(declare-fun lt!115323 () Unit!6990)

(assert (=> b!229265 (= lt!115323 e!148753)))

(declare-fun c!38027 () Bool)

(assert (=> b!229265 (= c!38027 (arrayContainsKey!0 (_keys!6328 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229266 () Bool)

(declare-fun e!148747 () Bool)

(declare-fun e!148752 () Bool)

(assert (=> b!229266 (= e!148747 e!148752)))

(declare-fun res!112841 () Bool)

(assert (=> b!229266 (=> (not res!112841) (not e!148752))))

(assert (=> b!229266 (= res!112841 (or (= lt!115329 (MissingZero!919 index!297)) (= lt!115329 (MissingVacant!919 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11279 (_ BitVec 32)) SeekEntryResult!919)

(assert (=> b!229266 (= lt!115329 (seekEntryOrOpen!0 key!932 (_keys!6328 thiss!1504) (mask!10152 thiss!1504)))))

(declare-fun b!229267 () Bool)

(declare-fun e!148740 () Unit!6990)

(declare-fun lt!115327 () Unit!6990)

(assert (=> b!229267 (= e!148740 lt!115327)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!297 (array!11279 array!11277 (_ BitVec 32) (_ BitVec 32) V!7669 V!7669 (_ BitVec 64) Int) Unit!6990)

(assert (=> b!229267 (= lt!115327 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!297 (_keys!6328 thiss!1504) (_values!4257 thiss!1504) (mask!10152 thiss!1504) (extraKeys!4011 thiss!1504) (zeroValue!4115 thiss!1504) (minValue!4115 thiss!1504) key!932 (defaultEntry!4274 thiss!1504)))))

(assert (=> b!229267 (= c!38026 (is-MissingZero!919 lt!115329))))

(declare-fun e!148745 () Bool)

(assert (=> b!229267 e!148745))

(declare-fun b!229268 () Bool)

(declare-fun e!148744 () Bool)

(assert (=> b!229268 (= e!148744 (not call!21300))))

(declare-fun b!229269 () Bool)

(declare-fun Unit!6993 () Unit!6990)

(assert (=> b!229269 (= e!148753 Unit!6993)))

(declare-fun lt!115325 () Unit!6990)

(declare-fun lemmaArrayContainsKeyThenInListMap!114 (array!11279 array!11277 (_ BitVec 32) (_ BitVec 32) V!7669 V!7669 (_ BitVec 64) (_ BitVec 32) Int) Unit!6990)

(assert (=> b!229269 (= lt!115325 (lemmaArrayContainsKeyThenInListMap!114 (_keys!6328 thiss!1504) (_values!4257 thiss!1504) (mask!10152 thiss!1504) (extraKeys!4011 thiss!1504) (zeroValue!4115 thiss!1504) (minValue!4115 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4274 thiss!1504)))))

(assert (=> b!229269 false))

(declare-fun b!229270 () Bool)

(declare-fun res!112836 () Bool)

(assert (=> b!229270 (= res!112836 (= (select (arr!5359 (_keys!6328 thiss!1504)) (index!5849 lt!115329)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148748 () Bool)

(assert (=> b!229270 (=> (not res!112836) (not e!148748))))

(declare-fun mapIsEmpty!10195 () Bool)

(declare-fun mapRes!10195 () Bool)

(assert (=> mapIsEmpty!10195 mapRes!10195))

(declare-fun b!229271 () Bool)

(declare-fun res!112837 () Bool)

(assert (=> b!229271 (=> (not res!112837) (not e!148744))))

(assert (=> b!229271 (= res!112837 call!21299)))

(assert (=> b!229271 (= e!148745 e!148744)))

(declare-fun b!229272 () Bool)

(assert (=> b!229272 (= e!148750 e!148748)))

(declare-fun res!112842 () Bool)

(assert (=> b!229272 (= res!112842 call!21299)))

(assert (=> b!229272 (=> (not res!112842) (not e!148748))))

(declare-fun mapNonEmpty!10195 () Bool)

(declare-fun tp!21607 () Bool)

(declare-fun e!148754 () Bool)

(assert (=> mapNonEmpty!10195 (= mapRes!10195 (and tp!21607 e!148754))))

(declare-fun mapValue!10195 () ValueCell!2665)

(declare-fun mapRest!10195 () (Array (_ BitVec 32) ValueCell!2665))

(declare-fun mapKey!10195 () (_ BitVec 32))

(assert (=> mapNonEmpty!10195 (= (arr!5358 (_values!4257 thiss!1504)) (store mapRest!10195 mapKey!10195 mapValue!10195))))

(declare-fun res!112834 () Bool)

(assert (=> start!22088 (=> (not res!112834) (not e!148747))))

(declare-fun valid!1289 (LongMapFixedSize!3230) Bool)

(assert (=> start!22088 (= res!112834 (valid!1289 thiss!1504))))

(assert (=> start!22088 e!148747))

(declare-fun e!148743 () Bool)

(assert (=> start!22088 e!148743))

(assert (=> start!22088 true))

(declare-fun b!229273 () Bool)

(assert (=> b!229273 (= e!148752 e!148746)))

(declare-fun res!112838 () Bool)

(assert (=> b!229273 (=> (not res!112838) (not e!148746))))

(assert (=> b!229273 (= res!112838 (inRange!0 index!297 (mask!10152 thiss!1504)))))

(declare-fun lt!115322 () Unit!6990)

(assert (=> b!229273 (= lt!115322 e!148740)))

(declare-fun c!38028 () Bool)

(declare-datatypes ((tuple2!4506 0))(
  ( (tuple2!4507 (_1!2264 (_ BitVec 64)) (_2!2264 V!7669)) )
))
(declare-datatypes ((List!3430 0))(
  ( (Nil!3427) (Cons!3426 (h!4074 tuple2!4506) (t!8389 List!3430)) )
))
(declare-datatypes ((ListLongMap!3419 0))(
  ( (ListLongMap!3420 (toList!1725 List!3430)) )
))
(declare-fun contains!1599 (ListLongMap!3419 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1253 (array!11279 array!11277 (_ BitVec 32) (_ BitVec 32) V!7669 V!7669 (_ BitVec 32) Int) ListLongMap!3419)

(assert (=> b!229273 (= c!38028 (contains!1599 (getCurrentListMap!1253 (_keys!6328 thiss!1504) (_values!4257 thiss!1504) (mask!10152 thiss!1504) (extraKeys!4011 thiss!1504) (zeroValue!4115 thiss!1504) (minValue!4115 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4274 thiss!1504)) key!932))))

(declare-fun b!229274 () Bool)

(declare-fun e!148751 () Bool)

(declare-fun e!148741 () Bool)

(assert (=> b!229274 (= e!148751 (and e!148741 mapRes!10195))))

(declare-fun condMapEmpty!10195 () Bool)

(declare-fun mapDefault!10195 () ValueCell!2665)

