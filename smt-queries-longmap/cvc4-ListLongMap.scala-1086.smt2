; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22202 () Bool)

(assert start!22202)

(declare-fun b!232753 () Bool)

(declare-fun b_free!6269 () Bool)

(declare-fun b_next!6269 () Bool)

(assert (=> b!232753 (= b_free!6269 (not b_next!6269))))

(declare-fun tp!21949 () Bool)

(declare-fun b_and!13167 () Bool)

(assert (=> b!232753 (= tp!21949 b_and!13167)))

(declare-fun b!232748 () Bool)

(declare-fun e!151173 () Bool)

(declare-fun e!151172 () Bool)

(assert (=> b!232748 (= e!151173 e!151172)))

(declare-fun res!114269 () Bool)

(declare-fun call!21642 () Bool)

(assert (=> b!232748 (= res!114269 call!21642)))

(assert (=> b!232748 (=> (not res!114269) (not e!151172))))

(declare-fun bm!21638 () Bool)

(declare-fun call!21641 () Bool)

(declare-datatypes ((V!7821 0))(
  ( (V!7822 (val!3110 Int)) )
))
(declare-datatypes ((ValueCell!2722 0))(
  ( (ValueCellFull!2722 (v!5130 V!7821)) (EmptyCell!2722) )
))
(declare-datatypes ((array!11505 0))(
  ( (array!11506 (arr!5472 (Array (_ BitVec 32) ValueCell!2722)) (size!5805 (_ BitVec 32))) )
))
(declare-datatypes ((array!11507 0))(
  ( (array!11508 (arr!5473 (Array (_ BitVec 32) (_ BitVec 64))) (size!5806 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3344 0))(
  ( (LongMapFixedSize!3345 (defaultEntry!4331 Int) (mask!10247 (_ BitVec 32)) (extraKeys!4068 (_ BitVec 32)) (zeroValue!4172 V!7821) (minValue!4172 V!7821) (_size!1721 (_ BitVec 32)) (_keys!6385 array!11507) (_values!4314 array!11505) (_vacant!1721 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3344)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21638 (= call!21641 (arrayContainsKey!0 (_keys!6385 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232749 () Bool)

(declare-datatypes ((Unit!7193 0))(
  ( (Unit!7194) )
))
(declare-fun e!151161 () Unit!7193)

(declare-fun Unit!7195 () Unit!7193)

(assert (=> b!232749 (= e!151161 Unit!7195)))

(declare-fun lt!117673 () Unit!7193)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!312 (array!11507 array!11505 (_ BitVec 32) (_ BitVec 32) V!7821 V!7821 (_ BitVec 64) Int) Unit!7193)

(assert (=> b!232749 (= lt!117673 (lemmaInListMapThenSeekEntryOrOpenFindsIt!312 (_keys!6385 thiss!1504) (_values!4314 thiss!1504) (mask!10247 thiss!1504) (extraKeys!4068 thiss!1504) (zeroValue!4172 thiss!1504) (minValue!4172 thiss!1504) key!932 (defaultEntry!4331 thiss!1504)))))

(assert (=> b!232749 false))

(declare-fun b!232750 () Bool)

(declare-fun res!114274 () Bool)

(declare-fun e!151167 () Bool)

(assert (=> b!232750 (=> (not res!114274) (not e!151167))))

(assert (=> b!232750 (= res!114274 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232751 () Bool)

(declare-fun e!151171 () Bool)

(declare-fun e!151165 () Bool)

(assert (=> b!232751 (= e!151171 (not e!151165))))

(declare-fun res!114271 () Bool)

(assert (=> b!232751 (=> res!114271 e!151165)))

(declare-fun lt!117687 () LongMapFixedSize!3344)

(declare-fun valid!1322 (LongMapFixedSize!3344) Bool)

(assert (=> b!232751 (= res!114271 (not (valid!1322 lt!117687)))))

(declare-datatypes ((tuple2!4590 0))(
  ( (tuple2!4591 (_1!2306 (_ BitVec 64)) (_2!2306 V!7821)) )
))
(declare-datatypes ((List!3506 0))(
  ( (Nil!3503) (Cons!3502 (h!4150 tuple2!4590) (t!8465 List!3506)) )
))
(declare-datatypes ((ListLongMap!3503 0))(
  ( (ListLongMap!3504 (toList!1767 List!3506)) )
))
(declare-fun lt!117683 () ListLongMap!3503)

(declare-fun contains!1635 (ListLongMap!3503 (_ BitVec 64)) Bool)

(assert (=> b!232751 (contains!1635 lt!117683 key!932)))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!117680 () array!11507)

(declare-fun lt!117682 () array!11505)

(declare-fun lt!117684 () Unit!7193)

(declare-fun lemmaValidKeyInArrayIsInListMap!150 (array!11507 array!11505 (_ BitVec 32) (_ BitVec 32) V!7821 V!7821 (_ BitVec 32) Int) Unit!7193)

(assert (=> b!232751 (= lt!117684 (lemmaValidKeyInArrayIsInListMap!150 lt!117680 lt!117682 (mask!10247 thiss!1504) (extraKeys!4068 thiss!1504) (zeroValue!4172 thiss!1504) (minValue!4172 thiss!1504) index!297 (defaultEntry!4331 thiss!1504)))))

(assert (=> b!232751 (= lt!117687 (LongMapFixedSize!3345 (defaultEntry!4331 thiss!1504) (mask!10247 thiss!1504) (extraKeys!4068 thiss!1504) (zeroValue!4172 thiss!1504) (minValue!4172 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1721 thiss!1504)) lt!117680 lt!117682 (_vacant!1721 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11507 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232751 (= (arrayCountValidKeys!0 lt!117680 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117681 () Unit!7193)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11507 (_ BitVec 32)) Unit!7193)

(assert (=> b!232751 (= lt!117681 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117680 index!297))))

(assert (=> b!232751 (arrayContainsKey!0 lt!117680 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117686 () Unit!7193)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11507 (_ BitVec 64) (_ BitVec 32)) Unit!7193)

(assert (=> b!232751 (= lt!117686 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117680 key!932 index!297))))

(declare-fun lt!117689 () ListLongMap!3503)

(assert (=> b!232751 (= lt!117689 lt!117683)))

(declare-fun getCurrentListMap!1295 (array!11507 array!11505 (_ BitVec 32) (_ BitVec 32) V!7821 V!7821 (_ BitVec 32) Int) ListLongMap!3503)

(assert (=> b!232751 (= lt!117683 (getCurrentListMap!1295 lt!117680 lt!117682 (mask!10247 thiss!1504) (extraKeys!4068 thiss!1504) (zeroValue!4172 thiss!1504) (minValue!4172 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4331 thiss!1504)))))

(declare-fun lt!117678 () ListLongMap!3503)

(declare-fun v!346 () V!7821)

(declare-fun +!628 (ListLongMap!3503 tuple2!4590) ListLongMap!3503)

(assert (=> b!232751 (= lt!117689 (+!628 lt!117678 (tuple2!4591 key!932 v!346)))))

(assert (=> b!232751 (= lt!117682 (array!11506 (store (arr!5472 (_values!4314 thiss!1504)) index!297 (ValueCellFull!2722 v!346)) (size!5805 (_values!4314 thiss!1504))))))

(declare-fun lt!117672 () Unit!7193)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!82 (array!11507 array!11505 (_ BitVec 32) (_ BitVec 32) V!7821 V!7821 (_ BitVec 32) (_ BitVec 64) V!7821 Int) Unit!7193)

(assert (=> b!232751 (= lt!117672 (lemmaAddValidKeyToArrayThenAddPairToListMap!82 (_keys!6385 thiss!1504) (_values!4314 thiss!1504) (mask!10247 thiss!1504) (extraKeys!4068 thiss!1504) (zeroValue!4172 thiss!1504) (minValue!4172 thiss!1504) index!297 key!932 v!346 (defaultEntry!4331 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11507 (_ BitVec 32)) Bool)

(assert (=> b!232751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117680 (mask!10247 thiss!1504))))

(declare-fun lt!117676 () Unit!7193)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11507 (_ BitVec 32) (_ BitVec 32)) Unit!7193)

(assert (=> b!232751 (= lt!117676 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6385 thiss!1504) index!297 (mask!10247 thiss!1504)))))

(assert (=> b!232751 (= (arrayCountValidKeys!0 lt!117680 #b00000000000000000000000000000000 (size!5806 (_keys!6385 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6385 thiss!1504) #b00000000000000000000000000000000 (size!5806 (_keys!6385 thiss!1504)))))))

(declare-fun lt!117674 () Unit!7193)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11507 (_ BitVec 32) (_ BitVec 64)) Unit!7193)

(assert (=> b!232751 (= lt!117674 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6385 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3507 0))(
  ( (Nil!3504) (Cons!3503 (h!4151 (_ BitVec 64)) (t!8466 List!3507)) )
))
(declare-fun arrayNoDuplicates!0 (array!11507 (_ BitVec 32) List!3507) Bool)

(assert (=> b!232751 (arrayNoDuplicates!0 lt!117680 #b00000000000000000000000000000000 Nil!3504)))

(assert (=> b!232751 (= lt!117680 (array!11508 (store (arr!5473 (_keys!6385 thiss!1504)) index!297 key!932) (size!5806 (_keys!6385 thiss!1504))))))

(declare-fun lt!117679 () Unit!7193)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11507 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3507) Unit!7193)

(assert (=> b!232751 (= lt!117679 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6385 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3504))))

(declare-fun lt!117688 () Unit!7193)

(declare-fun e!151166 () Unit!7193)

(assert (=> b!232751 (= lt!117688 e!151166)))

(declare-fun c!38709 () Bool)

(assert (=> b!232751 (= c!38709 (arrayContainsKey!0 (_keys!6385 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232752 () Bool)

(declare-fun e!151170 () Bool)

(assert (=> b!232752 (= e!151167 e!151170)))

(declare-fun res!114272 () Bool)

(assert (=> b!232752 (=> (not res!114272) (not e!151170))))

(declare-datatypes ((SeekEntryResult!969 0))(
  ( (MissingZero!969 (index!6046 (_ BitVec 32))) (Found!969 (index!6047 (_ BitVec 32))) (Intermediate!969 (undefined!1781 Bool) (index!6048 (_ BitVec 32)) (x!23573 (_ BitVec 32))) (Undefined!969) (MissingVacant!969 (index!6049 (_ BitVec 32))) )
))
(declare-fun lt!117670 () SeekEntryResult!969)

(assert (=> b!232752 (= res!114272 (or (= lt!117670 (MissingZero!969 index!297)) (= lt!117670 (MissingVacant!969 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11507 (_ BitVec 32)) SeekEntryResult!969)

(assert (=> b!232752 (= lt!117670 (seekEntryOrOpen!0 key!932 (_keys!6385 thiss!1504) (mask!10247 thiss!1504)))))

(declare-fun e!151169 () Bool)

(declare-fun e!151163 () Bool)

(declare-fun tp_is_empty!6131 () Bool)

(declare-fun array_inv!3607 (array!11507) Bool)

(declare-fun array_inv!3608 (array!11505) Bool)

(assert (=> b!232753 (= e!151163 (and tp!21949 tp_is_empty!6131 (array_inv!3607 (_keys!6385 thiss!1504)) (array_inv!3608 (_values!4314 thiss!1504)) e!151169))))

(declare-fun c!38710 () Bool)

(declare-fun bm!21639 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21639 (= call!21642 (inRange!0 (ite c!38710 (index!6046 lt!117670) (index!6049 lt!117670)) (mask!10247 thiss!1504)))))

(declare-fun res!114273 () Bool)

(assert (=> start!22202 (=> (not res!114273) (not e!151167))))

(assert (=> start!22202 (= res!114273 (valid!1322 thiss!1504))))

(assert (=> start!22202 e!151167))

(assert (=> start!22202 e!151163))

(assert (=> start!22202 true))

(assert (=> start!22202 tp_is_empty!6131))

(declare-fun b!232754 () Bool)

(declare-fun res!114268 () Bool)

(declare-fun e!151168 () Bool)

(assert (=> b!232754 (=> (not res!114268) (not e!151168))))

(assert (=> b!232754 (= res!114268 call!21642)))

(declare-fun e!151175 () Bool)

(assert (=> b!232754 (= e!151175 e!151168)))

(declare-fun b!232755 () Bool)

(declare-fun e!151162 () Bool)

(declare-fun mapRes!10366 () Bool)

(assert (=> b!232755 (= e!151169 (and e!151162 mapRes!10366))))

(declare-fun condMapEmpty!10366 () Bool)

(declare-fun mapDefault!10366 () ValueCell!2722)

