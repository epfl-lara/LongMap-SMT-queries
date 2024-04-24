; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25132 () Bool)

(assert start!25132)

(declare-fun b!261847 () Bool)

(declare-fun b_free!6775 () Bool)

(declare-fun b_next!6775 () Bool)

(assert (=> b!261847 (= b_free!6775 (not b_next!6775))))

(declare-fun tp!23655 () Bool)

(declare-fun b_and!13923 () Bool)

(assert (=> b!261847 (= tp!23655 b_and!13923)))

(declare-fun b!261831 () Bool)

(declare-datatypes ((Unit!8124 0))(
  ( (Unit!8125) )
))
(declare-fun e!169666 () Unit!8124)

(declare-fun Unit!8126 () Unit!8124)

(assert (=> b!261831 (= e!169666 Unit!8126)))

(declare-fun lt!132285 () Unit!8124)

(declare-datatypes ((V!8497 0))(
  ( (V!8498 (val!3363 Int)) )
))
(declare-datatypes ((ValueCell!2975 0))(
  ( (ValueCellFull!2975 (v!5489 V!8497)) (EmptyCell!2975) )
))
(declare-datatypes ((array!12629 0))(
  ( (array!12630 (arr!5977 (Array (_ BitVec 32) ValueCell!2975)) (size!6328 (_ BitVec 32))) )
))
(declare-datatypes ((array!12631 0))(
  ( (array!12632 (arr!5978 (Array (_ BitVec 32) (_ BitVec 64))) (size!6329 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3850 0))(
  ( (LongMapFixedSize!3851 (defaultEntry!4823 Int) (mask!11173 (_ BitVec 32)) (extraKeys!4560 (_ BitVec 32)) (zeroValue!4664 V!8497) (minValue!4664 V!8497) (_size!1974 (_ BitVec 32)) (_keys!7011 array!12631) (_values!4806 array!12629) (_vacant!1974 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3850)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!445 (array!12631 array!12629 (_ BitVec 32) (_ BitVec 32) V!8497 V!8497 (_ BitVec 64) Int) Unit!8124)

(assert (=> b!261831 (= lt!132285 (lemmaInListMapThenSeekEntryOrOpenFindsIt!445 (_keys!7011 thiss!1504) (_values!4806 thiss!1504) (mask!11173 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) key!932 (defaultEntry!4823 thiss!1504)))))

(assert (=> b!261831 false))

(declare-fun b!261832 () Bool)

(declare-fun lt!132277 () Unit!8124)

(assert (=> b!261832 (= e!169666 lt!132277)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!434 (array!12631 array!12629 (_ BitVec 32) (_ BitVec 32) V!8497 V!8497 (_ BitVec 64) Int) Unit!8124)

(assert (=> b!261832 (= lt!132277 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!434 (_keys!7011 thiss!1504) (_values!4806 thiss!1504) (mask!11173 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) key!932 (defaultEntry!4823 thiss!1504)))))

(declare-fun c!44598 () Bool)

(declare-datatypes ((SeekEntryResult!1156 0))(
  ( (MissingZero!1156 (index!6794 (_ BitVec 32))) (Found!1156 (index!6795 (_ BitVec 32))) (Intermediate!1156 (undefined!1968 Bool) (index!6796 (_ BitVec 32)) (x!25154 (_ BitVec 32))) (Undefined!1156) (MissingVacant!1156 (index!6797 (_ BitVec 32))) )
))
(declare-fun lt!132276 () SeekEntryResult!1156)

(get-info :version)

(assert (=> b!261832 (= c!44598 ((_ is MissingZero!1156) lt!132276))))

(declare-fun e!169667 () Bool)

(assert (=> b!261832 e!169667))

(declare-fun b!261833 () Bool)

(declare-fun res!127912 () Bool)

(assert (=> b!261833 (= res!127912 (= (select (arr!5978 (_keys!7011 thiss!1504)) (index!6797 lt!132276)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169660 () Bool)

(assert (=> b!261833 (=> (not res!127912) (not e!169660))))

(declare-fun b!261834 () Bool)

(declare-fun e!169662 () Bool)

(declare-fun tp_is_empty!6637 () Bool)

(assert (=> b!261834 (= e!169662 tp_is_empty!6637)))

(declare-fun b!261835 () Bool)

(declare-fun e!169659 () Bool)

(assert (=> b!261835 (= e!169659 e!169660)))

(declare-fun res!127911 () Bool)

(declare-fun call!24985 () Bool)

(assert (=> b!261835 (= res!127911 call!24985)))

(assert (=> b!261835 (=> (not res!127911) (not e!169660))))

(declare-fun res!127913 () Bool)

(declare-fun e!169668 () Bool)

(assert (=> start!25132 (=> (not res!127913) (not e!169668))))

(declare-fun valid!1508 (LongMapFixedSize!3850) Bool)

(assert (=> start!25132 (= res!127913 (valid!1508 thiss!1504))))

(assert (=> start!25132 e!169668))

(declare-fun e!169663 () Bool)

(assert (=> start!25132 e!169663))

(assert (=> start!25132 true))

(assert (=> start!25132 tp_is_empty!6637))

(declare-fun mapIsEmpty!11314 () Bool)

(declare-fun mapRes!11314 () Bool)

(assert (=> mapIsEmpty!11314 mapRes!11314))

(declare-fun b!261836 () Bool)

(declare-fun e!169664 () Bool)

(declare-fun e!169661 () Bool)

(assert (=> b!261836 (= e!169664 (and e!169661 mapRes!11314))))

(declare-fun condMapEmpty!11314 () Bool)

(declare-fun mapDefault!11314 () ValueCell!2975)

(assert (=> b!261836 (= condMapEmpty!11314 (= (arr!5977 (_values!4806 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2975)) mapDefault!11314)))))

(declare-fun b!261837 () Bool)

(declare-fun e!169665 () Bool)

(declare-fun call!24986 () Bool)

(assert (=> b!261837 (= e!169665 (not call!24986))))

(declare-fun bm!24982 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24982 (= call!24985 (inRange!0 (ite c!44598 (index!6794 lt!132276) (index!6797 lt!132276)) (mask!11173 thiss!1504)))))

(declare-fun b!261838 () Bool)

(declare-fun e!169670 () Bool)

(declare-fun e!169671 () Bool)

(assert (=> b!261838 (= e!169670 e!169671)))

(declare-fun res!127918 () Bool)

(assert (=> b!261838 (=> (not res!127918) (not e!169671))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!261838 (= res!127918 (inRange!0 index!297 (mask!11173 thiss!1504)))))

(declare-fun lt!132281 () Unit!8124)

(assert (=> b!261838 (= lt!132281 e!169666)))

(declare-fun c!44600 () Bool)

(declare-datatypes ((tuple2!4870 0))(
  ( (tuple2!4871 (_1!2446 (_ BitVec 64)) (_2!2446 V!8497)) )
))
(declare-datatypes ((List!3747 0))(
  ( (Nil!3744) (Cons!3743 (h!4409 tuple2!4870) (t!8812 List!3747)) )
))
(declare-datatypes ((ListLongMap!3785 0))(
  ( (ListLongMap!3786 (toList!1908 List!3747)) )
))
(declare-fun lt!132283 () ListLongMap!3785)

(declare-fun contains!1876 (ListLongMap!3785 (_ BitVec 64)) Bool)

(assert (=> b!261838 (= c!44600 (contains!1876 lt!132283 key!932))))

(declare-fun getCurrentListMap!1440 (array!12631 array!12629 (_ BitVec 32) (_ BitVec 32) V!8497 V!8497 (_ BitVec 32) Int) ListLongMap!3785)

(assert (=> b!261838 (= lt!132283 (getCurrentListMap!1440 (_keys!7011 thiss!1504) (_values!4806 thiss!1504) (mask!11173 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4823 thiss!1504)))))

(declare-fun b!261839 () Bool)

(declare-fun res!127916 () Bool)

(assert (=> b!261839 (=> (not res!127916) (not e!169665))))

(assert (=> b!261839 (= res!127916 call!24985)))

(assert (=> b!261839 (= e!169667 e!169665)))

(declare-fun b!261840 () Bool)

(declare-fun res!127917 () Bool)

(assert (=> b!261840 (=> (not res!127917) (not e!169668))))

(assert (=> b!261840 (= res!127917 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261841 () Bool)

(declare-fun e!169669 () Unit!8124)

(declare-fun Unit!8127 () Unit!8124)

(assert (=> b!261841 (= e!169669 Unit!8127)))

(declare-fun lt!132280 () Unit!8124)

(declare-fun lemmaArrayContainsKeyThenInListMap!263 (array!12631 array!12629 (_ BitVec 32) (_ BitVec 32) V!8497 V!8497 (_ BitVec 64) (_ BitVec 32) Int) Unit!8124)

(assert (=> b!261841 (= lt!132280 (lemmaArrayContainsKeyThenInListMap!263 (_keys!7011 thiss!1504) (_values!4806 thiss!1504) (mask!11173 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4823 thiss!1504)))))

(assert (=> b!261841 false))

(declare-fun b!261842 () Bool)

(declare-fun res!127914 () Bool)

(assert (=> b!261842 (=> (not res!127914) (not e!169665))))

(assert (=> b!261842 (= res!127914 (= (select (arr!5978 (_keys!7011 thiss!1504)) (index!6794 lt!132276)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261843 () Bool)

(assert (=> b!261843 (= e!169660 (not call!24986))))

(declare-fun b!261844 () Bool)

(assert (=> b!261844 (= e!169661 tp_is_empty!6637)))

(declare-fun b!261845 () Bool)

(assert (=> b!261845 (= e!169671 (not true))))

(declare-fun lt!132275 () array!12631)

(declare-fun arrayCountValidKeys!0 (array!12631 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261845 (= (arrayCountValidKeys!0 lt!132275 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132287 () Unit!8124)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12631 (_ BitVec 32)) Unit!8124)

(assert (=> b!261845 (= lt!132287 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132275 index!297))))

(declare-fun arrayContainsKey!0 (array!12631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!261845 (arrayContainsKey!0 lt!132275 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132279 () Unit!8124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12631 (_ BitVec 64) (_ BitVec 32)) Unit!8124)

(assert (=> b!261845 (= lt!132279 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132275 key!932 index!297))))

(declare-fun v!346 () V!8497)

(declare-fun +!704 (ListLongMap!3785 tuple2!4870) ListLongMap!3785)

(assert (=> b!261845 (= (+!704 lt!132283 (tuple2!4871 key!932 v!346)) (getCurrentListMap!1440 lt!132275 (array!12630 (store (arr!5977 (_values!4806 thiss!1504)) index!297 (ValueCellFull!2975 v!346)) (size!6328 (_values!4806 thiss!1504))) (mask!11173 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4823 thiss!1504)))))

(declare-fun lt!132284 () Unit!8124)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!119 (array!12631 array!12629 (_ BitVec 32) (_ BitVec 32) V!8497 V!8497 (_ BitVec 32) (_ BitVec 64) V!8497 Int) Unit!8124)

(assert (=> b!261845 (= lt!132284 (lemmaAddValidKeyToArrayThenAddPairToListMap!119 (_keys!7011 thiss!1504) (_values!4806 thiss!1504) (mask!11173 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) index!297 key!932 v!346 (defaultEntry!4823 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12631 (_ BitVec 32)) Bool)

(assert (=> b!261845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132275 (mask!11173 thiss!1504))))

(declare-fun lt!132282 () Unit!8124)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12631 (_ BitVec 32) (_ BitVec 32)) Unit!8124)

(assert (=> b!261845 (= lt!132282 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7011 thiss!1504) index!297 (mask!11173 thiss!1504)))))

(assert (=> b!261845 (= (arrayCountValidKeys!0 lt!132275 #b00000000000000000000000000000000 (size!6329 (_keys!7011 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7011 thiss!1504) #b00000000000000000000000000000000 (size!6329 (_keys!7011 thiss!1504)))))))

(declare-fun lt!132286 () Unit!8124)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12631 (_ BitVec 32) (_ BitVec 64)) Unit!8124)

(assert (=> b!261845 (= lt!132286 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7011 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3748 0))(
  ( (Nil!3745) (Cons!3744 (h!4410 (_ BitVec 64)) (t!8813 List!3748)) )
))
(declare-fun arrayNoDuplicates!0 (array!12631 (_ BitVec 32) List!3748) Bool)

(assert (=> b!261845 (arrayNoDuplicates!0 lt!132275 #b00000000000000000000000000000000 Nil!3745)))

(assert (=> b!261845 (= lt!132275 (array!12632 (store (arr!5978 (_keys!7011 thiss!1504)) index!297 key!932) (size!6329 (_keys!7011 thiss!1504))))))

(declare-fun lt!132278 () Unit!8124)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12631 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3748) Unit!8124)

(assert (=> b!261845 (= lt!132278 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7011 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3745))))

(declare-fun lt!132274 () Unit!8124)

(assert (=> b!261845 (= lt!132274 e!169669)))

(declare-fun c!44601 () Bool)

(assert (=> b!261845 (= c!44601 (arrayContainsKey!0 (_keys!7011 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261846 () Bool)

(assert (=> b!261846 (= e!169668 e!169670)))

(declare-fun res!127915 () Bool)

(assert (=> b!261846 (=> (not res!127915) (not e!169670))))

(assert (=> b!261846 (= res!127915 (or (= lt!132276 (MissingZero!1156 index!297)) (= lt!132276 (MissingVacant!1156 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12631 (_ BitVec 32)) SeekEntryResult!1156)

(assert (=> b!261846 (= lt!132276 (seekEntryOrOpen!0 key!932 (_keys!7011 thiss!1504) (mask!11173 thiss!1504)))))

(declare-fun array_inv!3935 (array!12631) Bool)

(declare-fun array_inv!3936 (array!12629) Bool)

(assert (=> b!261847 (= e!169663 (and tp!23655 tp_is_empty!6637 (array_inv!3935 (_keys!7011 thiss!1504)) (array_inv!3936 (_values!4806 thiss!1504)) e!169664))))

(declare-fun mapNonEmpty!11314 () Bool)

(declare-fun tp!23656 () Bool)

(assert (=> mapNonEmpty!11314 (= mapRes!11314 (and tp!23656 e!169662))))

(declare-fun mapValue!11314 () ValueCell!2975)

(declare-fun mapRest!11314 () (Array (_ BitVec 32) ValueCell!2975))

(declare-fun mapKey!11314 () (_ BitVec 32))

(assert (=> mapNonEmpty!11314 (= (arr!5977 (_values!4806 thiss!1504)) (store mapRest!11314 mapKey!11314 mapValue!11314))))

(declare-fun b!261848 () Bool)

(declare-fun Unit!8128 () Unit!8124)

(assert (=> b!261848 (= e!169669 Unit!8128)))

(declare-fun bm!24983 () Bool)

(assert (=> bm!24983 (= call!24986 (arrayContainsKey!0 (_keys!7011 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261849 () Bool)

(declare-fun c!44599 () Bool)

(assert (=> b!261849 (= c!44599 ((_ is MissingVacant!1156) lt!132276))))

(assert (=> b!261849 (= e!169667 e!169659)))

(declare-fun b!261850 () Bool)

(assert (=> b!261850 (= e!169659 ((_ is Undefined!1156) lt!132276))))

(assert (= (and start!25132 res!127913) b!261840))

(assert (= (and b!261840 res!127917) b!261846))

(assert (= (and b!261846 res!127915) b!261838))

(assert (= (and b!261838 c!44600) b!261831))

(assert (= (and b!261838 (not c!44600)) b!261832))

(assert (= (and b!261832 c!44598) b!261839))

(assert (= (and b!261832 (not c!44598)) b!261849))

(assert (= (and b!261839 res!127916) b!261842))

(assert (= (and b!261842 res!127914) b!261837))

(assert (= (and b!261849 c!44599) b!261835))

(assert (= (and b!261849 (not c!44599)) b!261850))

(assert (= (and b!261835 res!127911) b!261833))

(assert (= (and b!261833 res!127912) b!261843))

(assert (= (or b!261839 b!261835) bm!24982))

(assert (= (or b!261837 b!261843) bm!24983))

(assert (= (and b!261838 res!127918) b!261845))

(assert (= (and b!261845 c!44601) b!261841))

(assert (= (and b!261845 (not c!44601)) b!261848))

(assert (= (and b!261836 condMapEmpty!11314) mapIsEmpty!11314))

(assert (= (and b!261836 (not condMapEmpty!11314)) mapNonEmpty!11314))

(assert (= (and mapNonEmpty!11314 ((_ is ValueCellFull!2975) mapValue!11314)) b!261834))

(assert (= (and b!261836 ((_ is ValueCellFull!2975) mapDefault!11314)) b!261844))

(assert (= b!261847 b!261836))

(assert (= start!25132 b!261847))

(declare-fun m!278053 () Bool)

(assert (=> b!261847 m!278053))

(declare-fun m!278055 () Bool)

(assert (=> b!261847 m!278055))

(declare-fun m!278057 () Bool)

(assert (=> b!261841 m!278057))

(declare-fun m!278059 () Bool)

(assert (=> mapNonEmpty!11314 m!278059))

(declare-fun m!278061 () Bool)

(assert (=> b!261833 m!278061))

(declare-fun m!278063 () Bool)

(assert (=> b!261842 m!278063))

(declare-fun m!278065 () Bool)

(assert (=> b!261832 m!278065))

(declare-fun m!278067 () Bool)

(assert (=> b!261846 m!278067))

(declare-fun m!278069 () Bool)

(assert (=> bm!24982 m!278069))

(declare-fun m!278071 () Bool)

(assert (=> b!261845 m!278071))

(declare-fun m!278073 () Bool)

(assert (=> b!261845 m!278073))

(declare-fun m!278075 () Bool)

(assert (=> b!261845 m!278075))

(declare-fun m!278077 () Bool)

(assert (=> b!261845 m!278077))

(declare-fun m!278079 () Bool)

(assert (=> b!261845 m!278079))

(declare-fun m!278081 () Bool)

(assert (=> b!261845 m!278081))

(declare-fun m!278083 () Bool)

(assert (=> b!261845 m!278083))

(declare-fun m!278085 () Bool)

(assert (=> b!261845 m!278085))

(declare-fun m!278087 () Bool)

(assert (=> b!261845 m!278087))

(declare-fun m!278089 () Bool)

(assert (=> b!261845 m!278089))

(declare-fun m!278091 () Bool)

(assert (=> b!261845 m!278091))

(declare-fun m!278093 () Bool)

(assert (=> b!261845 m!278093))

(declare-fun m!278095 () Bool)

(assert (=> b!261845 m!278095))

(declare-fun m!278097 () Bool)

(assert (=> b!261845 m!278097))

(declare-fun m!278099 () Bool)

(assert (=> b!261845 m!278099))

(declare-fun m!278101 () Bool)

(assert (=> b!261845 m!278101))

(declare-fun m!278103 () Bool)

(assert (=> b!261845 m!278103))

(declare-fun m!278105 () Bool)

(assert (=> b!261838 m!278105))

(declare-fun m!278107 () Bool)

(assert (=> b!261838 m!278107))

(declare-fun m!278109 () Bool)

(assert (=> b!261838 m!278109))

(declare-fun m!278111 () Bool)

(assert (=> b!261831 m!278111))

(declare-fun m!278113 () Bool)

(assert (=> start!25132 m!278113))

(assert (=> bm!24983 m!278073))

(check-sat (not b!261847) (not start!25132) (not b!261832) (not b_next!6775) (not bm!24982) tp_is_empty!6637 (not b!261841) (not b!261838) (not mapNonEmpty!11314) (not bm!24983) (not b!261845) b_and!13923 (not b!261831) (not b!261846))
(check-sat b_and!13923 (not b_next!6775))
