; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24558 () Bool)

(assert start!24558)

(declare-fun b!257106 () Bool)

(declare-fun b_free!6727 () Bool)

(declare-fun b_next!6727 () Bool)

(assert (=> b!257106 (= b_free!6727 (not b_next!6727))))

(declare-fun tp!23487 () Bool)

(declare-fun b_and!13793 () Bool)

(assert (=> b!257106 (= tp!23487 b_and!13793)))

(declare-fun b!257091 () Bool)

(declare-datatypes ((Unit!7981 0))(
  ( (Unit!7982) )
))
(declare-fun e!166658 () Unit!7981)

(declare-fun Unit!7983 () Unit!7981)

(assert (=> b!257091 (= e!166658 Unit!7983)))

(declare-fun lt!129194 () Unit!7981)

(declare-datatypes ((V!8433 0))(
  ( (V!8434 (val!3339 Int)) )
))
(declare-datatypes ((ValueCell!2951 0))(
  ( (ValueCellFull!2951 (v!5431 V!8433)) (EmptyCell!2951) )
))
(declare-datatypes ((array!12521 0))(
  ( (array!12522 (arr!5930 (Array (_ BitVec 32) ValueCell!2951)) (size!6277 (_ BitVec 32))) )
))
(declare-datatypes ((array!12523 0))(
  ( (array!12524 (arr!5931 (Array (_ BitVec 32) (_ BitVec 64))) (size!6278 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3802 0))(
  ( (LongMapFixedSize!3803 (defaultEntry!4744 Int) (mask!11028 (_ BitVec 32)) (extraKeys!4481 (_ BitVec 32)) (zeroValue!4585 V!8433) (minValue!4585 V!8433) (_size!1950 (_ BitVec 32)) (_keys!6910 array!12523) (_values!4727 array!12521) (_vacant!1950 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3802)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!237 (array!12523 array!12521 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) (_ BitVec 32) Int) Unit!7981)

(assert (=> b!257091 (= lt!129194 (lemmaArrayContainsKeyThenInListMap!237 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(assert (=> b!257091 false))

(declare-fun b!257092 () Bool)

(declare-fun c!43490 () Bool)

(declare-datatypes ((SeekEntryResult!1167 0))(
  ( (MissingZero!1167 (index!6838 (_ BitVec 32))) (Found!1167 (index!6839 (_ BitVec 32))) (Intermediate!1167 (undefined!1979 Bool) (index!6840 (_ BitVec 32)) (x!24999 (_ BitVec 32))) (Undefined!1167) (MissingVacant!1167 (index!6841 (_ BitVec 32))) )
))
(declare-fun lt!129195 () SeekEntryResult!1167)

(assert (=> b!257092 (= c!43490 (is-MissingVacant!1167 lt!129195))))

(declare-fun e!166661 () Bool)

(declare-fun e!166659 () Bool)

(assert (=> b!257092 (= e!166661 e!166659)))

(declare-fun b!257093 () Bool)

(assert (=> b!257093 (= e!166659 (is-Undefined!1167 lt!129195))))

(declare-fun b!257094 () Bool)

(declare-fun res!125769 () Bool)

(assert (=> b!257094 (= res!125769 (= (select (arr!5931 (_keys!6910 thiss!1504)) (index!6841 lt!129195)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166653 () Bool)

(assert (=> b!257094 (=> (not res!125769) (not e!166653))))

(declare-fun res!125768 () Bool)

(declare-fun e!166660 () Bool)

(assert (=> start!24558 (=> (not res!125768) (not e!166660))))

(declare-fun valid!1486 (LongMapFixedSize!3802) Bool)

(assert (=> start!24558 (= res!125768 (valid!1486 thiss!1504))))

(assert (=> start!24558 e!166660))

(declare-fun e!166656 () Bool)

(assert (=> start!24558 e!166656))

(assert (=> start!24558 true))

(declare-fun tp_is_empty!6589 () Bool)

(assert (=> start!24558 tp_is_empty!6589))

(declare-fun b!257095 () Bool)

(declare-fun e!166650 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!257095 (= e!166650 (not (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6277 (_values!4727 thiss!1504))))))))

(declare-fun lt!129188 () array!12523)

(declare-fun arrayCountValidKeys!0 (array!12523 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!257095 (= (arrayCountValidKeys!0 lt!129188 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!129191 () Unit!7981)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12523 (_ BitVec 32)) Unit!7981)

(assert (=> b!257095 (= lt!129191 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129188 index!297))))

(declare-fun arrayContainsKey!0 (array!12523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!257095 (arrayContainsKey!0 lt!129188 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129190 () Unit!7981)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12523 (_ BitVec 64) (_ BitVec 32)) Unit!7981)

(assert (=> b!257095 (= lt!129190 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129188 key!932 index!297))))

(declare-datatypes ((tuple2!4918 0))(
  ( (tuple2!4919 (_1!2470 (_ BitVec 64)) (_2!2470 V!8433)) )
))
(declare-datatypes ((List!3797 0))(
  ( (Nil!3794) (Cons!3793 (h!4455 tuple2!4918) (t!8856 List!3797)) )
))
(declare-datatypes ((ListLongMap!3831 0))(
  ( (ListLongMap!3832 (toList!1931 List!3797)) )
))
(declare-fun lt!129192 () ListLongMap!3831)

(declare-fun v!346 () V!8433)

(declare-fun +!685 (ListLongMap!3831 tuple2!4918) ListLongMap!3831)

(declare-fun getCurrentListMap!1459 (array!12523 array!12521 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 32) Int) ListLongMap!3831)

(assert (=> b!257095 (= (+!685 lt!129192 (tuple2!4919 key!932 v!346)) (getCurrentListMap!1459 lt!129188 (array!12522 (store (arr!5930 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6277 (_values!4727 thiss!1504))) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129189 () Unit!7981)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!95 (array!12523 array!12521 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 32) (_ BitVec 64) V!8433 Int) Unit!7981)

(assert (=> b!257095 (= lt!129189 (lemmaAddValidKeyToArrayThenAddPairToListMap!95 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) index!297 key!932 v!346 (defaultEntry!4744 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12523 (_ BitVec 32)) Bool)

(assert (=> b!257095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129188 (mask!11028 thiss!1504))))

(declare-fun lt!129187 () Unit!7981)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12523 (_ BitVec 32) (_ BitVec 32)) Unit!7981)

(assert (=> b!257095 (= lt!129187 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6910 thiss!1504) index!297 (mask!11028 thiss!1504)))))

(assert (=> b!257095 (= (arrayCountValidKeys!0 lt!129188 #b00000000000000000000000000000000 (size!6278 (_keys!6910 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6910 thiss!1504) #b00000000000000000000000000000000 (size!6278 (_keys!6910 thiss!1504)))))))

(declare-fun lt!129196 () Unit!7981)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12523 (_ BitVec 32) (_ BitVec 64)) Unit!7981)

(assert (=> b!257095 (= lt!129196 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6910 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3798 0))(
  ( (Nil!3795) (Cons!3794 (h!4456 (_ BitVec 64)) (t!8857 List!3798)) )
))
(declare-fun arrayNoDuplicates!0 (array!12523 (_ BitVec 32) List!3798) Bool)

(assert (=> b!257095 (arrayNoDuplicates!0 lt!129188 #b00000000000000000000000000000000 Nil!3795)))

(assert (=> b!257095 (= lt!129188 (array!12524 (store (arr!5931 (_keys!6910 thiss!1504)) index!297 key!932) (size!6278 (_keys!6910 thiss!1504))))))

(declare-fun lt!129197 () Unit!7981)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12523 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3798) Unit!7981)

(assert (=> b!257095 (= lt!129197 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6910 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3795))))

(declare-fun lt!129200 () Unit!7981)

(assert (=> b!257095 (= lt!129200 e!166658)))

(declare-fun c!43488 () Bool)

(assert (=> b!257095 (= c!43488 (arrayContainsKey!0 (_keys!6910 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24387 () Bool)

(declare-fun call!24390 () Bool)

(assert (=> bm!24387 (= call!24390 (arrayContainsKey!0 (_keys!6910 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257096 () Bool)

(assert (=> b!257096 (= e!166659 e!166653)))

(declare-fun res!125765 () Bool)

(declare-fun call!24391 () Bool)

(assert (=> b!257096 (= res!125765 call!24391)))

(assert (=> b!257096 (=> (not res!125765) (not e!166653))))

(declare-fun b!257097 () Bool)

(declare-fun e!166655 () Bool)

(assert (=> b!257097 (= e!166655 (not call!24390))))

(declare-fun b!257098 () Bool)

(declare-fun e!166651 () Bool)

(assert (=> b!257098 (= e!166651 tp_is_empty!6589)))

(declare-fun b!257099 () Bool)

(declare-fun e!166652 () Unit!7981)

(declare-fun lt!129193 () Unit!7981)

(assert (=> b!257099 (= e!166652 lt!129193)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!433 (array!12523 array!12521 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) Int) Unit!7981)

(assert (=> b!257099 (= lt!129193 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!433 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)))))

(declare-fun c!43487 () Bool)

(assert (=> b!257099 (= c!43487 (is-MissingZero!1167 lt!129195))))

(assert (=> b!257099 e!166661))

(declare-fun b!257100 () Bool)

(declare-fun res!125767 () Bool)

(assert (=> b!257100 (=> (not res!125767) (not e!166655))))

(assert (=> b!257100 (= res!125767 call!24391)))

(assert (=> b!257100 (= e!166661 e!166655)))

(declare-fun b!257101 () Bool)

(declare-fun Unit!7984 () Unit!7981)

(assert (=> b!257101 (= e!166658 Unit!7984)))

(declare-fun b!257102 () Bool)

(declare-fun e!166649 () Bool)

(assert (=> b!257102 (= e!166649 tp_is_empty!6589)))

(declare-fun b!257103 () Bool)

(declare-fun e!166654 () Bool)

(declare-fun mapRes!11217 () Bool)

(assert (=> b!257103 (= e!166654 (and e!166649 mapRes!11217))))

(declare-fun condMapEmpty!11217 () Bool)

(declare-fun mapDefault!11217 () ValueCell!2951)

