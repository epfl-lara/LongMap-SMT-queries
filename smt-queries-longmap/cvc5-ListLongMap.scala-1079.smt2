; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22156 () Bool)

(assert start!22156)

(declare-fun b!231375 () Bool)

(declare-fun b_free!6223 () Bool)

(declare-fun b_next!6223 () Bool)

(assert (=> b!231375 (= b_free!6223 (not b_next!6223))))

(declare-fun tp!21811 () Bool)

(declare-fun b_and!13121 () Bool)

(assert (=> b!231375 (= tp!21811 b_and!13121)))

(declare-fun b!231360 () Bool)

(declare-fun e!150192 () Bool)

(assert (=> b!231360 (= e!150192 (not true))))

(declare-datatypes ((array!11413 0))(
  ( (array!11414 (arr!5426 (Array (_ BitVec 32) (_ BitVec 64))) (size!5759 (_ BitVec 32))) )
))
(declare-fun lt!116613 () array!11413)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11413 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231360 (= (arrayCountValidKeys!0 lt!116613 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!7116 0))(
  ( (Unit!7117) )
))
(declare-fun lt!116620 () Unit!7116)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11413 (_ BitVec 32)) Unit!7116)

(assert (=> b!231360 (= lt!116620 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116613 index!297))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231360 (arrayContainsKey!0 lt!116613 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116618 () Unit!7116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11413 (_ BitVec 64) (_ BitVec 32)) Unit!7116)

(assert (=> b!231360 (= lt!116618 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116613 key!932 index!297))))

(declare-datatypes ((V!7761 0))(
  ( (V!7762 (val!3087 Int)) )
))
(declare-datatypes ((ValueCell!2699 0))(
  ( (ValueCellFull!2699 (v!5107 V!7761)) (EmptyCell!2699) )
))
(declare-datatypes ((array!11415 0))(
  ( (array!11416 (arr!5427 (Array (_ BitVec 32) ValueCell!2699)) (size!5760 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3298 0))(
  ( (LongMapFixedSize!3299 (defaultEntry!4308 Int) (mask!10210 (_ BitVec 32)) (extraKeys!4045 (_ BitVec 32)) (zeroValue!4149 V!7761) (minValue!4149 V!7761) (_size!1698 (_ BitVec 32)) (_keys!6362 array!11413) (_values!4291 array!11415) (_vacant!1698 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3298)

(declare-fun v!346 () V!7761)

(declare-datatypes ((tuple2!4556 0))(
  ( (tuple2!4557 (_1!2289 (_ BitVec 64)) (_2!2289 V!7761)) )
))
(declare-datatypes ((List!3475 0))(
  ( (Nil!3472) (Cons!3471 (h!4119 tuple2!4556) (t!8434 List!3475)) )
))
(declare-datatypes ((ListLongMap!3469 0))(
  ( (ListLongMap!3470 (toList!1750 List!3475)) )
))
(declare-fun lt!116615 () ListLongMap!3469)

(declare-fun +!614 (ListLongMap!3469 tuple2!4556) ListLongMap!3469)

(declare-fun getCurrentListMap!1278 (array!11413 array!11415 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 32) Int) ListLongMap!3469)

(assert (=> b!231360 (= (+!614 lt!116615 (tuple2!4557 key!932 v!346)) (getCurrentListMap!1278 lt!116613 (array!11416 (store (arr!5427 (_values!4291 thiss!1504)) index!297 (ValueCellFull!2699 v!346)) (size!5760 (_values!4291 thiss!1504))) (mask!10210 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4308 thiss!1504)))))

(declare-fun lt!116623 () Unit!7116)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!68 (array!11413 array!11415 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 32) (_ BitVec 64) V!7761 Int) Unit!7116)

(assert (=> b!231360 (= lt!116623 (lemmaAddValidKeyToArrayThenAddPairToListMap!68 (_keys!6362 thiss!1504) (_values!4291 thiss!1504) (mask!10210 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) index!297 key!932 v!346 (defaultEntry!4308 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11413 (_ BitVec 32)) Bool)

(assert (=> b!231360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116613 (mask!10210 thiss!1504))))

(declare-fun lt!116611 () Unit!7116)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11413 (_ BitVec 32) (_ BitVec 32)) Unit!7116)

(assert (=> b!231360 (= lt!116611 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6362 thiss!1504) index!297 (mask!10210 thiss!1504)))))

(assert (=> b!231360 (= (arrayCountValidKeys!0 lt!116613 #b00000000000000000000000000000000 (size!5759 (_keys!6362 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6362 thiss!1504) #b00000000000000000000000000000000 (size!5759 (_keys!6362 thiss!1504)))))))

(declare-fun lt!116612 () Unit!7116)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11413 (_ BitVec 32) (_ BitVec 64)) Unit!7116)

(assert (=> b!231360 (= lt!116612 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6362 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3476 0))(
  ( (Nil!3473) (Cons!3472 (h!4120 (_ BitVec 64)) (t!8435 List!3476)) )
))
(declare-fun arrayNoDuplicates!0 (array!11413 (_ BitVec 32) List!3476) Bool)

(assert (=> b!231360 (arrayNoDuplicates!0 lt!116613 #b00000000000000000000000000000000 Nil!3473)))

(assert (=> b!231360 (= lt!116613 (array!11414 (store (arr!5426 (_keys!6362 thiss!1504)) index!297 key!932) (size!5759 (_keys!6362 thiss!1504))))))

(declare-fun lt!116616 () Unit!7116)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3476) Unit!7116)

(assert (=> b!231360 (= lt!116616 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6362 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3473))))

(declare-fun lt!116614 () Unit!7116)

(declare-fun e!150197 () Unit!7116)

(assert (=> b!231360 (= lt!116614 e!150197)))

(declare-fun c!38435 () Bool)

(assert (=> b!231360 (= c!38435 (arrayContainsKey!0 (_keys!6362 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231361 () Bool)

(declare-fun Unit!7118 () Unit!7116)

(assert (=> b!231361 (= e!150197 Unit!7118)))

(declare-fun lt!116621 () Unit!7116)

(declare-fun lemmaArrayContainsKeyThenInListMap!135 (array!11413 array!11415 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 64) (_ BitVec 32) Int) Unit!7116)

(assert (=> b!231361 (= lt!116621 (lemmaArrayContainsKeyThenInListMap!135 (_keys!6362 thiss!1504) (_values!4291 thiss!1504) (mask!10210 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4308 thiss!1504)))))

(assert (=> b!231361 false))

(declare-fun b!231362 () Bool)

(declare-fun e!150189 () Bool)

(declare-fun call!21504 () Bool)

(assert (=> b!231362 (= e!150189 (not call!21504))))

(declare-fun b!231363 () Bool)

(declare-fun res!113706 () Bool)

(declare-fun e!150199 () Bool)

(assert (=> b!231363 (=> (not res!113706) (not e!150199))))

(assert (=> b!231363 (= res!113706 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231364 () Bool)

(declare-fun e!150198 () Bool)

(declare-fun e!150200 () Bool)

(declare-fun mapRes!10297 () Bool)

(assert (=> b!231364 (= e!150198 (and e!150200 mapRes!10297))))

(declare-fun condMapEmpty!10297 () Bool)

(declare-fun mapDefault!10297 () ValueCell!2699)

