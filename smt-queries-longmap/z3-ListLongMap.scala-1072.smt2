; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22118 () Bool)

(assert start!22118)

(declare-fun b!229957 () Bool)

(declare-fun b_free!6181 () Bool)

(declare-fun b_next!6181 () Bool)

(assert (=> b!229957 (= b_free!6181 (not b_next!6181))))

(declare-fun tp!21684 () Bool)

(declare-fun b_and!13053 () Bool)

(assert (=> b!229957 (= tp!21684 b_and!13053)))

(declare-fun b!229953 () Bool)

(declare-fun e!149216 () Bool)

(declare-fun tp_is_empty!6043 () Bool)

(assert (=> b!229953 (= e!149216 tp_is_empty!6043)))

(declare-fun b!229954 () Bool)

(declare-fun res!113113 () Bool)

(declare-fun e!149217 () Bool)

(assert (=> b!229954 (=> (not res!113113) (not e!149217))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!229954 (= res!113113 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229955 () Bool)

(declare-fun e!149210 () Bool)

(declare-fun e!149211 () Bool)

(assert (=> b!229955 (= e!149210 e!149211)))

(declare-fun res!113112 () Bool)

(assert (=> b!229955 (=> (not res!113112) (not e!149211))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7705 0))(
  ( (V!7706 (val!3066 Int)) )
))
(declare-datatypes ((ValueCell!2678 0))(
  ( (ValueCellFull!2678 (v!5080 V!7705)) (EmptyCell!2678) )
))
(declare-datatypes ((array!11321 0))(
  ( (array!11322 (arr!5379 (Array (_ BitVec 32) ValueCell!2678)) (size!5713 (_ BitVec 32))) )
))
(declare-datatypes ((array!11323 0))(
  ( (array!11324 (arr!5380 (Array (_ BitVec 32) (_ BitVec 64))) (size!5714 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3256 0))(
  ( (LongMapFixedSize!3257 (defaultEntry!4287 Int) (mask!10174 (_ BitVec 32)) (extraKeys!4024 (_ BitVec 32)) (zeroValue!4128 V!7705) (minValue!4128 V!7705) (_size!1677 (_ BitVec 32)) (_keys!6340 array!11323) (_values!4270 array!11321) (_vacant!1677 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3256)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229955 (= res!113112 (inRange!0 index!297 (mask!10174 thiss!1504)))))

(declare-datatypes ((Unit!7007 0))(
  ( (Unit!7008) )
))
(declare-fun lt!115599 () Unit!7007)

(declare-fun e!149207 () Unit!7007)

(assert (=> b!229955 (= lt!115599 e!149207)))

(declare-fun c!38155 () Bool)

(declare-datatypes ((tuple2!4494 0))(
  ( (tuple2!4495 (_1!2258 (_ BitVec 64)) (_2!2258 V!7705)) )
))
(declare-datatypes ((List!3432 0))(
  ( (Nil!3429) (Cons!3428 (h!4076 tuple2!4494) (t!8382 List!3432)) )
))
(declare-datatypes ((ListLongMap!3397 0))(
  ( (ListLongMap!3398 (toList!1714 List!3432)) )
))
(declare-fun lt!115591 () ListLongMap!3397)

(declare-fun contains!1589 (ListLongMap!3397 (_ BitVec 64)) Bool)

(assert (=> b!229955 (= c!38155 (contains!1589 lt!115591 key!932))))

(declare-fun getCurrentListMap!1223 (array!11323 array!11321 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 32) Int) ListLongMap!3397)

(assert (=> b!229955 (= lt!115591 (getCurrentListMap!1223 (_keys!6340 thiss!1504) (_values!4270 thiss!1504) (mask!10174 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4287 thiss!1504)))))

(declare-fun b!229956 () Bool)

(declare-fun e!149205 () Unit!7007)

(declare-fun Unit!7009 () Unit!7007)

(assert (=> b!229956 (= e!149205 Unit!7009)))

(declare-fun lt!115600 () Unit!7007)

(declare-fun lemmaArrayContainsKeyThenInListMap!128 (array!11323 array!11321 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 64) (_ BitVec 32) Int) Unit!7007)

(assert (=> b!229956 (= lt!115600 (lemmaArrayContainsKeyThenInListMap!128 (_keys!6340 thiss!1504) (_values!4270 thiss!1504) (mask!10174 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4287 thiss!1504)))))

(assert (=> b!229956 false))

(declare-fun e!149206 () Bool)

(declare-fun e!149215 () Bool)

(declare-fun array_inv!3547 (array!11323) Bool)

(declare-fun array_inv!3548 (array!11321) Bool)

(assert (=> b!229957 (= e!149215 (and tp!21684 tp_is_empty!6043 (array_inv!3547 (_keys!6340 thiss!1504)) (array_inv!3548 (_values!4270 thiss!1504)) e!149206))))

(declare-fun b!229958 () Bool)

(declare-fun c!38157 () Bool)

(declare-datatypes ((SeekEntryResult!929 0))(
  ( (MissingZero!929 (index!5886 (_ BitVec 32))) (Found!929 (index!5887 (_ BitVec 32))) (Intermediate!929 (undefined!1741 Bool) (index!5888 (_ BitVec 32)) (x!23420 (_ BitVec 32))) (Undefined!929) (MissingVacant!929 (index!5889 (_ BitVec 32))) )
))
(declare-fun lt!115589 () SeekEntryResult!929)

(get-info :version)

(assert (=> b!229958 (= c!38157 ((_ is MissingVacant!929) lt!115589))))

(declare-fun e!149214 () Bool)

(declare-fun e!149212 () Bool)

(assert (=> b!229958 (= e!149214 e!149212)))

(declare-fun b!229959 () Bool)

(declare-fun e!149213 () Bool)

(assert (=> b!229959 (= e!149213 tp_is_empty!6043)))

(declare-fun b!229960 () Bool)

(assert (=> b!229960 (= e!149211 (not true))))

(declare-fun lt!115590 () array!11323)

(declare-fun v!346 () V!7705)

(declare-fun +!600 (ListLongMap!3397 tuple2!4494) ListLongMap!3397)

(assert (=> b!229960 (= (+!600 lt!115591 (tuple2!4495 key!932 v!346)) (getCurrentListMap!1223 lt!115590 (array!11322 (store (arr!5379 (_values!4270 thiss!1504)) index!297 (ValueCellFull!2678 v!346)) (size!5713 (_values!4270 thiss!1504))) (mask!10174 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4287 thiss!1504)))))

(declare-fun lt!115592 () Unit!7007)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!55 (array!11323 array!11321 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 32) (_ BitVec 64) V!7705 Int) Unit!7007)

(assert (=> b!229960 (= lt!115592 (lemmaAddValidKeyToArrayThenAddPairToListMap!55 (_keys!6340 thiss!1504) (_values!4270 thiss!1504) (mask!10174 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) index!297 key!932 v!346 (defaultEntry!4287 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11323 (_ BitVec 32)) Bool)

(assert (=> b!229960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115590 (mask!10174 thiss!1504))))

(declare-fun lt!115597 () Unit!7007)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11323 (_ BitVec 32) (_ BitVec 32)) Unit!7007)

(assert (=> b!229960 (= lt!115597 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6340 thiss!1504) index!297 (mask!10174 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11323 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229960 (= (arrayCountValidKeys!0 lt!115590 #b00000000000000000000000000000000 (size!5714 (_keys!6340 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6340 thiss!1504) #b00000000000000000000000000000000 (size!5714 (_keys!6340 thiss!1504)))))))

(declare-fun lt!115598 () Unit!7007)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11323 (_ BitVec 32) (_ BitVec 64)) Unit!7007)

(assert (=> b!229960 (= lt!115598 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6340 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3433 0))(
  ( (Nil!3430) (Cons!3429 (h!4077 (_ BitVec 64)) (t!8383 List!3433)) )
))
(declare-fun arrayNoDuplicates!0 (array!11323 (_ BitVec 32) List!3433) Bool)

(assert (=> b!229960 (arrayNoDuplicates!0 lt!115590 #b00000000000000000000000000000000 Nil!3430)))

(assert (=> b!229960 (= lt!115590 (array!11324 (store (arr!5380 (_keys!6340 thiss!1504)) index!297 key!932) (size!5714 (_keys!6340 thiss!1504))))))

(declare-fun lt!115593 () Unit!7007)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11323 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3433) Unit!7007)

(assert (=> b!229960 (= lt!115593 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6340 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3430))))

(declare-fun lt!115595 () Unit!7007)

(assert (=> b!229960 (= lt!115595 e!149205)))

(declare-fun c!38158 () Bool)

(declare-fun arrayContainsKey!0 (array!11323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229960 (= c!38158 (arrayContainsKey!0 (_keys!6340 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229961 () Bool)

(assert (=> b!229961 (= e!149217 e!149210)))

(declare-fun res!113114 () Bool)

(assert (=> b!229961 (=> (not res!113114) (not e!149210))))

(assert (=> b!229961 (= res!113114 (or (= lt!115589 (MissingZero!929 index!297)) (= lt!115589 (MissingVacant!929 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11323 (_ BitVec 32)) SeekEntryResult!929)

(assert (=> b!229961 (= lt!115589 (seekEntryOrOpen!0 key!932 (_keys!6340 thiss!1504) (mask!10174 thiss!1504)))))

(declare-fun mapNonEmpty!10234 () Bool)

(declare-fun mapRes!10234 () Bool)

(declare-fun tp!21685 () Bool)

(assert (=> mapNonEmpty!10234 (= mapRes!10234 (and tp!21685 e!149213))))

(declare-fun mapKey!10234 () (_ BitVec 32))

(declare-fun mapRest!10234 () (Array (_ BitVec 32) ValueCell!2678))

(declare-fun mapValue!10234 () ValueCell!2678)

(assert (=> mapNonEmpty!10234 (= (arr!5379 (_values!4270 thiss!1504)) (store mapRest!10234 mapKey!10234 mapValue!10234))))

(declare-fun b!229963 () Bool)

(assert (=> b!229963 (= e!149206 (and e!149216 mapRes!10234))))

(declare-fun condMapEmpty!10234 () Bool)

(declare-fun mapDefault!10234 () ValueCell!2678)

(assert (=> b!229963 (= condMapEmpty!10234 (= (arr!5379 (_values!4270 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2678)) mapDefault!10234)))))

(declare-fun mapIsEmpty!10234 () Bool)

(assert (=> mapIsEmpty!10234 mapRes!10234))

(declare-fun b!229964 () Bool)

(declare-fun lt!115596 () Unit!7007)

(assert (=> b!229964 (= e!149207 lt!115596)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!284 (array!11323 array!11321 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 64) Int) Unit!7007)

(assert (=> b!229964 (= lt!115596 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!284 (_keys!6340 thiss!1504) (_values!4270 thiss!1504) (mask!10174 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) key!932 (defaultEntry!4287 thiss!1504)))))

(declare-fun c!38156 () Bool)

(assert (=> b!229964 (= c!38156 ((_ is MissingZero!929) lt!115589))))

(assert (=> b!229964 e!149214))

(declare-fun b!229965 () Bool)

(declare-fun res!113111 () Bool)

(declare-fun e!149204 () Bool)

(assert (=> b!229965 (=> (not res!113111) (not e!149204))))

(assert (=> b!229965 (= res!113111 (= (select (arr!5380 (_keys!6340 thiss!1504)) (index!5886 lt!115589)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21350 () Bool)

(declare-fun call!21354 () Bool)

(assert (=> bm!21350 (= call!21354 (arrayContainsKey!0 (_keys!6340 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229966 () Bool)

(declare-fun e!149208 () Bool)

(assert (=> b!229966 (= e!149212 e!149208)))

(declare-fun res!113108 () Bool)

(declare-fun call!21353 () Bool)

(assert (=> b!229966 (= res!113108 call!21353)))

(assert (=> b!229966 (=> (not res!113108) (not e!149208))))

(declare-fun b!229967 () Bool)

(declare-fun res!113110 () Bool)

(assert (=> b!229967 (=> (not res!113110) (not e!149204))))

(assert (=> b!229967 (= res!113110 call!21353)))

(assert (=> b!229967 (= e!149214 e!149204)))

(declare-fun b!229968 () Bool)

(declare-fun Unit!7010 () Unit!7007)

(assert (=> b!229968 (= e!149207 Unit!7010)))

(declare-fun lt!115594 () Unit!7007)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!287 (array!11323 array!11321 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 64) Int) Unit!7007)

(assert (=> b!229968 (= lt!115594 (lemmaInListMapThenSeekEntryOrOpenFindsIt!287 (_keys!6340 thiss!1504) (_values!4270 thiss!1504) (mask!10174 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) key!932 (defaultEntry!4287 thiss!1504)))))

(assert (=> b!229968 false))

(declare-fun res!113107 () Bool)

(assert (=> start!22118 (=> (not res!113107) (not e!149217))))

(declare-fun valid!1310 (LongMapFixedSize!3256) Bool)

(assert (=> start!22118 (= res!113107 (valid!1310 thiss!1504))))

(assert (=> start!22118 e!149217))

(assert (=> start!22118 e!149215))

(assert (=> start!22118 true))

(assert (=> start!22118 tp_is_empty!6043))

(declare-fun b!229962 () Bool)

(assert (=> b!229962 (= e!149208 (not call!21354))))

(declare-fun bm!21351 () Bool)

(assert (=> bm!21351 (= call!21353 (inRange!0 (ite c!38156 (index!5886 lt!115589) (index!5889 lt!115589)) (mask!10174 thiss!1504)))))

(declare-fun b!229969 () Bool)

(assert (=> b!229969 (= e!149204 (not call!21354))))

(declare-fun b!229970 () Bool)

(declare-fun Unit!7011 () Unit!7007)

(assert (=> b!229970 (= e!149205 Unit!7011)))

(declare-fun b!229971 () Bool)

(assert (=> b!229971 (= e!149212 ((_ is Undefined!929) lt!115589))))

(declare-fun b!229972 () Bool)

(declare-fun res!113109 () Bool)

(assert (=> b!229972 (= res!113109 (= (select (arr!5380 (_keys!6340 thiss!1504)) (index!5889 lt!115589)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!229972 (=> (not res!113109) (not e!149208))))

(assert (= (and start!22118 res!113107) b!229954))

(assert (= (and b!229954 res!113113) b!229961))

(assert (= (and b!229961 res!113114) b!229955))

(assert (= (and b!229955 c!38155) b!229968))

(assert (= (and b!229955 (not c!38155)) b!229964))

(assert (= (and b!229964 c!38156) b!229967))

(assert (= (and b!229964 (not c!38156)) b!229958))

(assert (= (and b!229967 res!113110) b!229965))

(assert (= (and b!229965 res!113111) b!229969))

(assert (= (and b!229958 c!38157) b!229966))

(assert (= (and b!229958 (not c!38157)) b!229971))

(assert (= (and b!229966 res!113108) b!229972))

(assert (= (and b!229972 res!113109) b!229962))

(assert (= (or b!229967 b!229966) bm!21351))

(assert (= (or b!229969 b!229962) bm!21350))

(assert (= (and b!229955 res!113112) b!229960))

(assert (= (and b!229960 c!38158) b!229956))

(assert (= (and b!229960 (not c!38158)) b!229970))

(assert (= (and b!229963 condMapEmpty!10234) mapIsEmpty!10234))

(assert (= (and b!229963 (not condMapEmpty!10234)) mapNonEmpty!10234))

(assert (= (and mapNonEmpty!10234 ((_ is ValueCellFull!2678) mapValue!10234)) b!229959))

(assert (= (and b!229963 ((_ is ValueCellFull!2678) mapDefault!10234)) b!229953))

(assert (= b!229957 b!229963))

(assert (= start!22118 b!229957))

(declare-fun m!250891 () Bool)

(assert (=> b!229957 m!250891))

(declare-fun m!250893 () Bool)

(assert (=> b!229957 m!250893))

(declare-fun m!250895 () Bool)

(assert (=> bm!21351 m!250895))

(declare-fun m!250897 () Bool)

(assert (=> b!229955 m!250897))

(declare-fun m!250899 () Bool)

(assert (=> b!229955 m!250899))

(declare-fun m!250901 () Bool)

(assert (=> b!229955 m!250901))

(declare-fun m!250903 () Bool)

(assert (=> b!229956 m!250903))

(declare-fun m!250905 () Bool)

(assert (=> b!229965 m!250905))

(declare-fun m!250907 () Bool)

(assert (=> b!229972 m!250907))

(declare-fun m!250909 () Bool)

(assert (=> b!229968 m!250909))

(declare-fun m!250911 () Bool)

(assert (=> start!22118 m!250911))

(declare-fun m!250913 () Bool)

(assert (=> b!229961 m!250913))

(declare-fun m!250915 () Bool)

(assert (=> b!229960 m!250915))

(declare-fun m!250917 () Bool)

(assert (=> b!229960 m!250917))

(declare-fun m!250919 () Bool)

(assert (=> b!229960 m!250919))

(declare-fun m!250921 () Bool)

(assert (=> b!229960 m!250921))

(declare-fun m!250923 () Bool)

(assert (=> b!229960 m!250923))

(declare-fun m!250925 () Bool)

(assert (=> b!229960 m!250925))

(declare-fun m!250927 () Bool)

(assert (=> b!229960 m!250927))

(declare-fun m!250929 () Bool)

(assert (=> b!229960 m!250929))

(declare-fun m!250931 () Bool)

(assert (=> b!229960 m!250931))

(declare-fun m!250933 () Bool)

(assert (=> b!229960 m!250933))

(declare-fun m!250935 () Bool)

(assert (=> b!229960 m!250935))

(declare-fun m!250937 () Bool)

(assert (=> b!229960 m!250937))

(declare-fun m!250939 () Bool)

(assert (=> b!229960 m!250939))

(assert (=> bm!21350 m!250915))

(declare-fun m!250941 () Bool)

(assert (=> b!229964 m!250941))

(declare-fun m!250943 () Bool)

(assert (=> mapNonEmpty!10234 m!250943))

(check-sat b_and!13053 (not b!229968) (not b!229957) (not b!229964) (not b_next!6181) (not mapNonEmpty!10234) (not b!229956) (not b!229960) (not b!229955) (not b!229961) (not bm!21350) (not bm!21351) tp_is_empty!6043 (not start!22118))
(check-sat b_and!13053 (not b_next!6181))
