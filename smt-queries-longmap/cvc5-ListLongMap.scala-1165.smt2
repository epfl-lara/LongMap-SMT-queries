; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24656 () Bool)

(assert start!24656)

(declare-fun b!257952 () Bool)

(declare-fun b_free!6739 () Bool)

(declare-fun b_next!6739 () Bool)

(assert (=> b!257952 (= b_free!6739 (not b_next!6739))))

(declare-fun tp!23528 () Bool)

(declare-fun b_and!13813 () Bool)

(assert (=> b!257952 (= tp!23528 b_and!13813)))

(declare-fun b!257949 () Bool)

(declare-fun e!167206 () Bool)

(declare-fun e!167218 () Bool)

(assert (=> b!257949 (= e!167206 (not e!167218))))

(declare-fun res!126154 () Bool)

(assert (=> b!257949 (=> res!126154 e!167218)))

(declare-datatypes ((V!8449 0))(
  ( (V!8450 (val!3345 Int)) )
))
(declare-datatypes ((ValueCell!2957 0))(
  ( (ValueCellFull!2957 (v!5443 V!8449)) (EmptyCell!2957) )
))
(declare-datatypes ((array!12549 0))(
  ( (array!12550 (arr!5942 (Array (_ BitVec 32) ValueCell!2957)) (size!6289 (_ BitVec 32))) )
))
(declare-datatypes ((array!12551 0))(
  ( (array!12552 (arr!5943 (Array (_ BitVec 32) (_ BitVec 64))) (size!6290 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3814 0))(
  ( (LongMapFixedSize!3815 (defaultEntry!4760 Int) (mask!11057 (_ BitVec 32)) (extraKeys!4497 (_ BitVec 32)) (zeroValue!4601 V!8449) (minValue!4601 V!8449) (_size!1956 (_ BitVec 32)) (_keys!6930 array!12551) (_values!4743 array!12549) (_vacant!1956 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3814)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!257949 (= res!126154 (not (validMask!0 (mask!11057 thiss!1504))))))

(declare-fun lt!129777 () array!12551)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12551 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!257949 (= (arrayCountValidKeys!0 lt!129777 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!8014 0))(
  ( (Unit!8015) )
))
(declare-fun lt!129775 () Unit!8014)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12551 (_ BitVec 32)) Unit!8014)

(assert (=> b!257949 (= lt!129775 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129777 index!297))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!257949 (arrayContainsKey!0 lt!129777 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129776 () Unit!8014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12551 (_ BitVec 64) (_ BitVec 32)) Unit!8014)

(assert (=> b!257949 (= lt!129776 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129777 key!932 index!297))))

(declare-datatypes ((tuple2!4930 0))(
  ( (tuple2!4931 (_1!2476 (_ BitVec 64)) (_2!2476 V!8449)) )
))
(declare-datatypes ((List!3809 0))(
  ( (Nil!3806) (Cons!3805 (h!4467 tuple2!4930) (t!8872 List!3809)) )
))
(declare-datatypes ((ListLongMap!3843 0))(
  ( (ListLongMap!3844 (toList!1937 List!3809)) )
))
(declare-fun lt!129780 () ListLongMap!3843)

(declare-fun v!346 () V!8449)

(declare-fun +!691 (ListLongMap!3843 tuple2!4930) ListLongMap!3843)

(declare-fun getCurrentListMap!1465 (array!12551 array!12549 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 32) Int) ListLongMap!3843)

(assert (=> b!257949 (= (+!691 lt!129780 (tuple2!4931 key!932 v!346)) (getCurrentListMap!1465 lt!129777 (array!12550 (store (arr!5942 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6289 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129787 () Unit!8014)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!101 (array!12551 array!12549 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 32) (_ BitVec 64) V!8449 Int) Unit!8014)

(assert (=> b!257949 (= lt!129787 (lemmaAddValidKeyToArrayThenAddPairToListMap!101 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) index!297 key!932 v!346 (defaultEntry!4760 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12551 (_ BitVec 32)) Bool)

(assert (=> b!257949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129777 (mask!11057 thiss!1504))))

(declare-fun lt!129785 () Unit!8014)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12551 (_ BitVec 32) (_ BitVec 32)) Unit!8014)

(assert (=> b!257949 (= lt!129785 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6930 thiss!1504) index!297 (mask!11057 thiss!1504)))))

(assert (=> b!257949 (= (arrayCountValidKeys!0 lt!129777 #b00000000000000000000000000000000 (size!6290 (_keys!6930 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6930 thiss!1504) #b00000000000000000000000000000000 (size!6290 (_keys!6930 thiss!1504)))))))

(declare-fun lt!129788 () Unit!8014)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12551 (_ BitVec 32) (_ BitVec 64)) Unit!8014)

(assert (=> b!257949 (= lt!129788 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6930 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3810 0))(
  ( (Nil!3807) (Cons!3806 (h!4468 (_ BitVec 64)) (t!8873 List!3810)) )
))
(declare-fun arrayNoDuplicates!0 (array!12551 (_ BitVec 32) List!3810) Bool)

(assert (=> b!257949 (arrayNoDuplicates!0 lt!129777 #b00000000000000000000000000000000 Nil!3807)))

(assert (=> b!257949 (= lt!129777 (array!12552 (store (arr!5943 (_keys!6930 thiss!1504)) index!297 key!932) (size!6290 (_keys!6930 thiss!1504))))))

(declare-fun lt!129786 () Unit!8014)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3810) Unit!8014)

(assert (=> b!257949 (= lt!129786 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6930 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3807))))

(declare-fun lt!129778 () Unit!8014)

(declare-fun e!167213 () Unit!8014)

(assert (=> b!257949 (= lt!129778 e!167213)))

(declare-fun c!43678 () Bool)

(assert (=> b!257949 (= c!43678 (arrayContainsKey!0 (_keys!6930 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24513 () Bool)

(declare-fun call!24516 () Bool)

(assert (=> bm!24513 (= call!24516 (arrayContainsKey!0 (_keys!6930 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257950 () Bool)

(declare-fun e!167217 () Bool)

(declare-fun e!167204 () Bool)

(assert (=> b!257950 (= e!167217 e!167204)))

(declare-fun res!126158 () Bool)

(assert (=> b!257950 (=> (not res!126158) (not e!167204))))

(declare-datatypes ((SeekEntryResult!1173 0))(
  ( (MissingZero!1173 (index!6862 (_ BitVec 32))) (Found!1173 (index!6863 (_ BitVec 32))) (Intermediate!1173 (undefined!1985 Bool) (index!6864 (_ BitVec 32)) (x!25041 (_ BitVec 32))) (Undefined!1173) (MissingVacant!1173 (index!6865 (_ BitVec 32))) )
))
(declare-fun lt!129783 () SeekEntryResult!1173)

(assert (=> b!257950 (= res!126158 (or (= lt!129783 (MissingZero!1173 index!297)) (= lt!129783 (MissingVacant!1173 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12551 (_ BitVec 32)) SeekEntryResult!1173)

(assert (=> b!257950 (= lt!129783 (seekEntryOrOpen!0 key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(declare-fun b!257951 () Bool)

(declare-fun e!167214 () Bool)

(declare-fun tp_is_empty!6601 () Bool)

(assert (=> b!257951 (= e!167214 tp_is_empty!6601)))

(declare-fun e!167205 () Bool)

(declare-fun e!167208 () Bool)

(declare-fun array_inv!3927 (array!12551) Bool)

(declare-fun array_inv!3928 (array!12549) Bool)

(assert (=> b!257952 (= e!167208 (and tp!23528 tp_is_empty!6601 (array_inv!3927 (_keys!6930 thiss!1504)) (array_inv!3928 (_values!4743 thiss!1504)) e!167205))))

(declare-fun b!257953 () Bool)

(declare-fun Unit!8016 () Unit!8014)

(assert (=> b!257953 (= e!167213 Unit!8016)))

(declare-fun b!257954 () Bool)

(declare-fun res!126155 () Bool)

(declare-fun e!167215 () Bool)

(assert (=> b!257954 (=> (not res!126155) (not e!167215))))

(assert (=> b!257954 (= res!126155 (= (select (arr!5943 (_keys!6930 thiss!1504)) (index!6862 lt!129783)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257955 () Bool)

(declare-fun e!167212 () Bool)

(declare-fun e!167209 () Bool)

(assert (=> b!257955 (= e!167212 e!167209)))

(declare-fun res!126157 () Bool)

(declare-fun call!24517 () Bool)

(assert (=> b!257955 (= res!126157 call!24517)))

(assert (=> b!257955 (=> (not res!126157) (not e!167209))))

(declare-fun b!257956 () Bool)

(declare-fun res!126153 () Bool)

(assert (=> b!257956 (= res!126153 (= (select (arr!5943 (_keys!6930 thiss!1504)) (index!6865 lt!129783)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257956 (=> (not res!126153) (not e!167209))))

(declare-fun b!257957 () Bool)

(declare-fun e!167207 () Bool)

(assert (=> b!257957 (= e!167207 tp_is_empty!6601)))

(declare-fun bm!24514 () Bool)

(declare-fun c!43675 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24514 (= call!24517 (inRange!0 (ite c!43675 (index!6862 lt!129783) (index!6865 lt!129783)) (mask!11057 thiss!1504)))))

(declare-fun b!257958 () Bool)

(declare-fun mapRes!11241 () Bool)

(assert (=> b!257958 (= e!167205 (and e!167207 mapRes!11241))))

(declare-fun condMapEmpty!11241 () Bool)

(declare-fun mapDefault!11241 () ValueCell!2957)

