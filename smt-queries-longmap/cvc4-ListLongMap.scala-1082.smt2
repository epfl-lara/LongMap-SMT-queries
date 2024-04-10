; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22178 () Bool)

(assert start!22178)

(declare-fun b!232024 () Bool)

(declare-fun b_free!6245 () Bool)

(declare-fun b_next!6245 () Bool)

(assert (=> b!232024 (= b_free!6245 (not b_next!6245))))

(declare-fun tp!21877 () Bool)

(declare-fun b_and!13143 () Bool)

(assert (=> b!232024 (= tp!21877 b_and!13143)))

(declare-fun mapNonEmpty!10330 () Bool)

(declare-fun mapRes!10330 () Bool)

(declare-fun tp!21876 () Bool)

(declare-fun e!150652 () Bool)

(assert (=> mapNonEmpty!10330 (= mapRes!10330 (and tp!21876 e!150652))))

(declare-datatypes ((V!7789 0))(
  ( (V!7790 (val!3098 Int)) )
))
(declare-datatypes ((ValueCell!2710 0))(
  ( (ValueCellFull!2710 (v!5118 V!7789)) (EmptyCell!2710) )
))
(declare-fun mapValue!10330 () ValueCell!2710)

(declare-fun mapRest!10330 () (Array (_ BitVec 32) ValueCell!2710))

(declare-datatypes ((array!11457 0))(
  ( (array!11458 (arr!5448 (Array (_ BitVec 32) ValueCell!2710)) (size!5781 (_ BitVec 32))) )
))
(declare-datatypes ((array!11459 0))(
  ( (array!11460 (arr!5449 (Array (_ BitVec 32) (_ BitVec 64))) (size!5782 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3320 0))(
  ( (LongMapFixedSize!3321 (defaultEntry!4319 Int) (mask!10227 (_ BitVec 32)) (extraKeys!4056 (_ BitVec 32)) (zeroValue!4160 V!7789) (minValue!4160 V!7789) (_size!1709 (_ BitVec 32)) (_keys!6373 array!11459) (_values!4302 array!11457) (_vacant!1709 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3320)

(declare-fun mapKey!10330 () (_ BitVec 32))

(assert (=> mapNonEmpty!10330 (= (arr!5448 (_values!4302 thiss!1504)) (store mapRest!10330 mapKey!10330 mapValue!10330))))

(declare-datatypes ((SeekEntryResult!959 0))(
  ( (MissingZero!959 (index!6006 (_ BitVec 32))) (Found!959 (index!6007 (_ BitVec 32))) (Intermediate!959 (undefined!1771 Bool) (index!6008 (_ BitVec 32)) (x!23531 (_ BitVec 32))) (Undefined!959) (MissingVacant!959 (index!6009 (_ BitVec 32))) )
))
(declare-fun lt!117086 () SeekEntryResult!959)

(declare-fun call!21569 () Bool)

(declare-fun c!38565 () Bool)

(declare-fun bm!21566 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21566 (= call!21569 (inRange!0 (ite c!38565 (index!6006 lt!117086) (index!6009 lt!117086)) (mask!10227 thiss!1504)))))

(declare-fun res!113972 () Bool)

(declare-fun e!150661 () Bool)

(assert (=> start!22178 (=> (not res!113972) (not e!150661))))

(declare-fun valid!1316 (LongMapFixedSize!3320) Bool)

(assert (=> start!22178 (= res!113972 (valid!1316 thiss!1504))))

(assert (=> start!22178 e!150661))

(declare-fun e!150655 () Bool)

(assert (=> start!22178 e!150655))

(assert (=> start!22178 true))

(declare-fun tp_is_empty!6107 () Bool)

(assert (=> start!22178 tp_is_empty!6107))

(declare-fun b!232020 () Bool)

(declare-datatypes ((Unit!7155 0))(
  ( (Unit!7156) )
))
(declare-fun e!150662 () Unit!7155)

(declare-fun lt!117076 () Unit!7155)

(assert (=> b!232020 (= e!150662 lt!117076)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!323 (array!11459 array!11457 (_ BitVec 32) (_ BitVec 32) V!7789 V!7789 (_ BitVec 64) Int) Unit!7155)

(assert (=> b!232020 (= lt!117076 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!323 (_keys!6373 thiss!1504) (_values!4302 thiss!1504) (mask!10227 thiss!1504) (extraKeys!4056 thiss!1504) (zeroValue!4160 thiss!1504) (minValue!4160 thiss!1504) key!932 (defaultEntry!4319 thiss!1504)))))

(assert (=> b!232020 (= c!38565 (is-MissingZero!959 lt!117086))))

(declare-fun e!150653 () Bool)

(assert (=> b!232020 e!150653))

(declare-fun b!232021 () Bool)

(declare-fun e!150659 () Unit!7155)

(declare-fun Unit!7157 () Unit!7155)

(assert (=> b!232021 (= e!150659 Unit!7157)))

(declare-fun lt!117077 () Unit!7155)

(declare-fun lemmaArrayContainsKeyThenInListMap!142 (array!11459 array!11457 (_ BitVec 32) (_ BitVec 32) V!7789 V!7789 (_ BitVec 64) (_ BitVec 32) Int) Unit!7155)

(assert (=> b!232021 (= lt!117077 (lemmaArrayContainsKeyThenInListMap!142 (_keys!6373 thiss!1504) (_values!4302 thiss!1504) (mask!10227 thiss!1504) (extraKeys!4056 thiss!1504) (zeroValue!4160 thiss!1504) (minValue!4160 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4319 thiss!1504)))))

(assert (=> b!232021 false))

(declare-fun b!232022 () Bool)

(declare-fun Unit!7158 () Unit!7155)

(assert (=> b!232022 (= e!150662 Unit!7158)))

(declare-fun lt!117080 () Unit!7155)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!307 (array!11459 array!11457 (_ BitVec 32) (_ BitVec 32) V!7789 V!7789 (_ BitVec 64) Int) Unit!7155)

(assert (=> b!232022 (= lt!117080 (lemmaInListMapThenSeekEntryOrOpenFindsIt!307 (_keys!6373 thiss!1504) (_values!4302 thiss!1504) (mask!10227 thiss!1504) (extraKeys!4056 thiss!1504) (zeroValue!4160 thiss!1504) (minValue!4160 thiss!1504) key!932 (defaultEntry!4319 thiss!1504)))))

(assert (=> b!232022 false))

(declare-fun b!232023 () Bool)

(declare-fun Unit!7159 () Unit!7155)

(assert (=> b!232023 (= e!150659 Unit!7159)))

(declare-fun e!150657 () Bool)

(declare-fun array_inv!3591 (array!11459) Bool)

(declare-fun array_inv!3592 (array!11457) Bool)

(assert (=> b!232024 (= e!150655 (and tp!21877 tp_is_empty!6107 (array_inv!3591 (_keys!6373 thiss!1504)) (array_inv!3592 (_values!4302 thiss!1504)) e!150657))))

(declare-fun b!232025 () Bool)

(declare-fun e!150650 () Bool)

(declare-fun call!21570 () Bool)

(assert (=> b!232025 (= e!150650 (not call!21570))))

(declare-fun b!232026 () Bool)

(declare-fun e!150649 () Bool)

(declare-fun e!150654 () Bool)

(assert (=> b!232026 (= e!150649 e!150654)))

(declare-fun res!113974 () Bool)

(assert (=> b!232026 (= res!113974 call!21569)))

(assert (=> b!232026 (=> (not res!113974) (not e!150654))))

(declare-fun b!232027 () Bool)

(declare-fun e!150658 () Bool)

(declare-fun e!150656 () Bool)

(assert (=> b!232027 (= e!150658 e!150656)))

(declare-fun res!113970 () Bool)

(assert (=> b!232027 (=> (not res!113970) (not e!150656))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232027 (= res!113970 (inRange!0 index!297 (mask!10227 thiss!1504)))))

(declare-fun lt!117074 () Unit!7155)

(assert (=> b!232027 (= lt!117074 e!150662)))

(declare-fun c!38568 () Bool)

(declare-datatypes ((tuple2!4572 0))(
  ( (tuple2!4573 (_1!2297 (_ BitVec 64)) (_2!2297 V!7789)) )
))
(declare-datatypes ((List!3490 0))(
  ( (Nil!3487) (Cons!3486 (h!4134 tuple2!4572) (t!8449 List!3490)) )
))
(declare-datatypes ((ListLongMap!3485 0))(
  ( (ListLongMap!3486 (toList!1758 List!3490)) )
))
(declare-fun lt!117084 () ListLongMap!3485)

(declare-fun contains!1627 (ListLongMap!3485 (_ BitVec 64)) Bool)

(assert (=> b!232027 (= c!38568 (contains!1627 lt!117084 key!932))))

(declare-fun getCurrentListMap!1286 (array!11459 array!11457 (_ BitVec 32) (_ BitVec 32) V!7789 V!7789 (_ BitVec 32) Int) ListLongMap!3485)

(assert (=> b!232027 (= lt!117084 (getCurrentListMap!1286 (_keys!6373 thiss!1504) (_values!4302 thiss!1504) (mask!10227 thiss!1504) (extraKeys!4056 thiss!1504) (zeroValue!4160 thiss!1504) (minValue!4160 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4319 thiss!1504)))))

(declare-fun b!232028 () Bool)

(assert (=> b!232028 (= e!150656 (not true))))

(declare-fun lt!117081 () array!11459)

(declare-fun arrayCountValidKeys!0 (array!11459 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232028 (= (arrayCountValidKeys!0 lt!117081 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117085 () Unit!7155)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11459 (_ BitVec 32)) Unit!7155)

(assert (=> b!232028 (= lt!117085 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117081 index!297))))

(declare-fun arrayContainsKey!0 (array!11459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232028 (arrayContainsKey!0 lt!117081 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117075 () Unit!7155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11459 (_ BitVec 64) (_ BitVec 32)) Unit!7155)

(assert (=> b!232028 (= lt!117075 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117081 key!932 index!297))))

(declare-fun v!346 () V!7789)

(declare-fun +!621 (ListLongMap!3485 tuple2!4572) ListLongMap!3485)

(assert (=> b!232028 (= (+!621 lt!117084 (tuple2!4573 key!932 v!346)) (getCurrentListMap!1286 lt!117081 (array!11458 (store (arr!5448 (_values!4302 thiss!1504)) index!297 (ValueCellFull!2710 v!346)) (size!5781 (_values!4302 thiss!1504))) (mask!10227 thiss!1504) (extraKeys!4056 thiss!1504) (zeroValue!4160 thiss!1504) (minValue!4160 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4319 thiss!1504)))))

(declare-fun lt!117078 () Unit!7155)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!75 (array!11459 array!11457 (_ BitVec 32) (_ BitVec 32) V!7789 V!7789 (_ BitVec 32) (_ BitVec 64) V!7789 Int) Unit!7155)

(assert (=> b!232028 (= lt!117078 (lemmaAddValidKeyToArrayThenAddPairToListMap!75 (_keys!6373 thiss!1504) (_values!4302 thiss!1504) (mask!10227 thiss!1504) (extraKeys!4056 thiss!1504) (zeroValue!4160 thiss!1504) (minValue!4160 thiss!1504) index!297 key!932 v!346 (defaultEntry!4319 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11459 (_ BitVec 32)) Bool)

(assert (=> b!232028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117081 (mask!10227 thiss!1504))))

(declare-fun lt!117073 () Unit!7155)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11459 (_ BitVec 32) (_ BitVec 32)) Unit!7155)

(assert (=> b!232028 (= lt!117073 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6373 thiss!1504) index!297 (mask!10227 thiss!1504)))))

(assert (=> b!232028 (= (arrayCountValidKeys!0 lt!117081 #b00000000000000000000000000000000 (size!5782 (_keys!6373 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6373 thiss!1504) #b00000000000000000000000000000000 (size!5782 (_keys!6373 thiss!1504)))))))

(declare-fun lt!117082 () Unit!7155)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11459 (_ BitVec 32) (_ BitVec 64)) Unit!7155)

(assert (=> b!232028 (= lt!117082 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6373 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3491 0))(
  ( (Nil!3488) (Cons!3487 (h!4135 (_ BitVec 64)) (t!8450 List!3491)) )
))
(declare-fun arrayNoDuplicates!0 (array!11459 (_ BitVec 32) List!3491) Bool)

(assert (=> b!232028 (arrayNoDuplicates!0 lt!117081 #b00000000000000000000000000000000 Nil!3488)))

(assert (=> b!232028 (= lt!117081 (array!11460 (store (arr!5449 (_keys!6373 thiss!1504)) index!297 key!932) (size!5782 (_keys!6373 thiss!1504))))))

(declare-fun lt!117083 () Unit!7155)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11459 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3491) Unit!7155)

(assert (=> b!232028 (= lt!117083 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6373 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3488))))

(declare-fun lt!117079 () Unit!7155)

(assert (=> b!232028 (= lt!117079 e!150659)))

(declare-fun c!38567 () Bool)

(assert (=> b!232028 (= c!38567 (arrayContainsKey!0 (_keys!6373 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!21567 () Bool)

(assert (=> bm!21567 (= call!21570 (arrayContainsKey!0 (_keys!6373 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232029 () Bool)

(declare-fun res!113975 () Bool)

(assert (=> b!232029 (=> (not res!113975) (not e!150650))))

(assert (=> b!232029 (= res!113975 (= (select (arr!5449 (_keys!6373 thiss!1504)) (index!6006 lt!117086)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232030 () Bool)

(declare-fun e!150660 () Bool)

(assert (=> b!232030 (= e!150660 tp_is_empty!6107)))

(declare-fun b!232031 () Bool)

(assert (=> b!232031 (= e!150652 tp_is_empty!6107)))

(declare-fun b!232032 () Bool)

(assert (=> b!232032 (= e!150657 (and e!150660 mapRes!10330))))

(declare-fun condMapEmpty!10330 () Bool)

(declare-fun mapDefault!10330 () ValueCell!2710)

