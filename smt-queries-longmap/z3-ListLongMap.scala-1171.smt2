; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25130 () Bool)

(assert start!25130)

(declare-fun b!261845 () Bool)

(declare-fun b_free!6777 () Bool)

(declare-fun b_next!6777 () Bool)

(assert (=> b!261845 (= b_free!6777 (not b_next!6777))))

(declare-fun tp!23662 () Bool)

(declare-fun b_and!13911 () Bool)

(assert (=> b!261845 (= tp!23662 b_and!13911)))

(declare-fun bm!25000 () Bool)

(declare-fun call!25003 () Bool)

(declare-datatypes ((V!8499 0))(
  ( (V!8500 (val!3364 Int)) )
))
(declare-datatypes ((ValueCell!2976 0))(
  ( (ValueCellFull!2976 (v!5489 V!8499)) (EmptyCell!2976) )
))
(declare-datatypes ((array!12635 0))(
  ( (array!12636 (arr!5980 (Array (_ BitVec 32) ValueCell!2976)) (size!6331 (_ BitVec 32))) )
))
(declare-datatypes ((array!12637 0))(
  ( (array!12638 (arr!5981 (Array (_ BitVec 32) (_ BitVec 64))) (size!6332 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3852 0))(
  ( (LongMapFixedSize!3853 (defaultEntry!4824 Int) (mask!11174 (_ BitVec 32)) (extraKeys!4561 (_ BitVec 32)) (zeroValue!4665 V!8499) (minValue!4665 V!8499) (_size!1975 (_ BitVec 32)) (_keys!7012 array!12637) (_values!4807 array!12635) (_vacant!1975 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3852)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!25000 (= call!25003 (arrayContainsKey!0 (_keys!7012 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261844 () Bool)

(declare-fun e!169689 () Bool)

(assert (=> b!261844 (= e!169689 (not call!25003))))

(declare-fun tp_is_empty!6639 () Bool)

(declare-fun e!169688 () Bool)

(declare-fun e!169687 () Bool)

(declare-fun array_inv!3951 (array!12637) Bool)

(declare-fun array_inv!3952 (array!12635) Bool)

(assert (=> b!261845 (= e!169687 (and tp!23662 tp_is_empty!6639 (array_inv!3951 (_keys!7012 thiss!1504)) (array_inv!3952 (_values!4807 thiss!1504)) e!169688))))

(declare-fun b!261846 () Bool)

(declare-fun e!169681 () Bool)

(assert (=> b!261846 (= e!169681 (not true))))

(declare-fun lt!132258 () array!12637)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12637 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261846 (= (arrayCountValidKeys!0 lt!132258 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!8147 0))(
  ( (Unit!8148) )
))
(declare-fun lt!132260 () Unit!8147)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12637 (_ BitVec 32)) Unit!8147)

(assert (=> b!261846 (= lt!132260 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132258 index!297))))

(assert (=> b!261846 (arrayContainsKey!0 lt!132258 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132268 () Unit!8147)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12637 (_ BitVec 64) (_ BitVec 32)) Unit!8147)

(assert (=> b!261846 (= lt!132268 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132258 key!932 index!297))))

(declare-fun v!346 () V!8499)

(declare-datatypes ((tuple2!4962 0))(
  ( (tuple2!4963 (_1!2492 (_ BitVec 64)) (_2!2492 V!8499)) )
))
(declare-datatypes ((List!3838 0))(
  ( (Nil!3835) (Cons!3834 (h!4500 tuple2!4962) (t!8911 List!3838)) )
))
(declare-datatypes ((ListLongMap!3875 0))(
  ( (ListLongMap!3876 (toList!1953 List!3838)) )
))
(declare-fun lt!132267 () ListLongMap!3875)

(declare-fun +!704 (ListLongMap!3875 tuple2!4962) ListLongMap!3875)

(declare-fun getCurrentListMap!1481 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8499 V!8499 (_ BitVec 32) Int) ListLongMap!3875)

(assert (=> b!261846 (= (+!704 lt!132267 (tuple2!4963 key!932 v!346)) (getCurrentListMap!1481 lt!132258 (array!12636 (store (arr!5980 (_values!4807 thiss!1504)) index!297 (ValueCellFull!2976 v!346)) (size!6331 (_values!4807 thiss!1504))) (mask!11174 thiss!1504) (extraKeys!4561 thiss!1504) (zeroValue!4665 thiss!1504) (minValue!4665 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4824 thiss!1504)))))

(declare-fun lt!132266 () Unit!8147)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!114 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8499 V!8499 (_ BitVec 32) (_ BitVec 64) V!8499 Int) Unit!8147)

(assert (=> b!261846 (= lt!132266 (lemmaAddValidKeyToArrayThenAddPairToListMap!114 (_keys!7012 thiss!1504) (_values!4807 thiss!1504) (mask!11174 thiss!1504) (extraKeys!4561 thiss!1504) (zeroValue!4665 thiss!1504) (minValue!4665 thiss!1504) index!297 key!932 v!346 (defaultEntry!4824 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12637 (_ BitVec 32)) Bool)

(assert (=> b!261846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132258 (mask!11174 thiss!1504))))

(declare-fun lt!132264 () Unit!8147)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12637 (_ BitVec 32) (_ BitVec 32)) Unit!8147)

(assert (=> b!261846 (= lt!132264 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7012 thiss!1504) index!297 (mask!11174 thiss!1504)))))

(assert (=> b!261846 (= (arrayCountValidKeys!0 lt!132258 #b00000000000000000000000000000000 (size!6332 (_keys!7012 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7012 thiss!1504) #b00000000000000000000000000000000 (size!6332 (_keys!7012 thiss!1504)))))))

(declare-fun lt!132259 () Unit!8147)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12637 (_ BitVec 32) (_ BitVec 64)) Unit!8147)

(assert (=> b!261846 (= lt!132259 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7012 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3839 0))(
  ( (Nil!3836) (Cons!3835 (h!4501 (_ BitVec 64)) (t!8912 List!3839)) )
))
(declare-fun arrayNoDuplicates!0 (array!12637 (_ BitVec 32) List!3839) Bool)

(assert (=> b!261846 (arrayNoDuplicates!0 lt!132258 #b00000000000000000000000000000000 Nil!3836)))

(assert (=> b!261846 (= lt!132258 (array!12638 (store (arr!5981 (_keys!7012 thiss!1504)) index!297 key!932) (size!6332 (_keys!7012 thiss!1504))))))

(declare-fun lt!132261 () Unit!8147)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12637 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3839) Unit!8147)

(assert (=> b!261846 (= lt!132261 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7012 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3836))))

(declare-fun lt!132270 () Unit!8147)

(declare-fun e!169684 () Unit!8147)

(assert (=> b!261846 (= lt!132270 e!169684)))

(declare-fun c!44599 () Bool)

(assert (=> b!261846 (= c!44599 (arrayContainsKey!0 (_keys!7012 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261848 () Bool)

(declare-fun e!169685 () Bool)

(declare-fun e!169676 () Bool)

(assert (=> b!261848 (= e!169685 e!169676)))

(declare-fun res!127917 () Bool)

(declare-fun call!25004 () Bool)

(assert (=> b!261848 (= res!127917 call!25004)))

(assert (=> b!261848 (=> (not res!127917) (not e!169676))))

(declare-fun b!261849 () Bool)

(declare-fun e!169680 () Unit!8147)

(declare-fun Unit!8149 () Unit!8147)

(assert (=> b!261849 (= e!169680 Unit!8149)))

(declare-fun lt!132263 () Unit!8147)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!448 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8499 V!8499 (_ BitVec 64) Int) Unit!8147)

(assert (=> b!261849 (= lt!132263 (lemmaInListMapThenSeekEntryOrOpenFindsIt!448 (_keys!7012 thiss!1504) (_values!4807 thiss!1504) (mask!11174 thiss!1504) (extraKeys!4561 thiss!1504) (zeroValue!4665 thiss!1504) (minValue!4665 thiss!1504) key!932 (defaultEntry!4824 thiss!1504)))))

(assert (=> b!261849 false))

(declare-fun b!261850 () Bool)

(declare-fun e!169679 () Bool)

(declare-fun e!169682 () Bool)

(assert (=> b!261850 (= e!169679 e!169682)))

(declare-fun res!127914 () Bool)

(assert (=> b!261850 (=> (not res!127914) (not e!169682))))

(declare-datatypes ((SeekEntryResult!1191 0))(
  ( (MissingZero!1191 (index!6934 (_ BitVec 32))) (Found!1191 (index!6935 (_ BitVec 32))) (Intermediate!1191 (undefined!2003 Bool) (index!6936 (_ BitVec 32)) (x!25189 (_ BitVec 32))) (Undefined!1191) (MissingVacant!1191 (index!6937 (_ BitVec 32))) )
))
(declare-fun lt!132257 () SeekEntryResult!1191)

(assert (=> b!261850 (= res!127914 (or (= lt!132257 (MissingZero!1191 index!297)) (= lt!132257 (MissingVacant!1191 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12637 (_ BitVec 32)) SeekEntryResult!1191)

(assert (=> b!261850 (= lt!132257 (seekEntryOrOpen!0 key!932 (_keys!7012 thiss!1504) (mask!11174 thiss!1504)))))

(declare-fun b!261851 () Bool)

(declare-fun Unit!8150 () Unit!8147)

(assert (=> b!261851 (= e!169684 Unit!8150)))

(declare-fun lt!132262 () Unit!8147)

(declare-fun lemmaArrayContainsKeyThenInListMap!256 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8499 V!8499 (_ BitVec 64) (_ BitVec 32) Int) Unit!8147)

(assert (=> b!261851 (= lt!132262 (lemmaArrayContainsKeyThenInListMap!256 (_keys!7012 thiss!1504) (_values!4807 thiss!1504) (mask!11174 thiss!1504) (extraKeys!4561 thiss!1504) (zeroValue!4665 thiss!1504) (minValue!4665 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4824 thiss!1504)))))

(assert (=> b!261851 false))

(declare-fun b!261852 () Bool)

(declare-fun res!127921 () Bool)

(assert (=> b!261852 (=> (not res!127921) (not e!169679))))

(assert (=> b!261852 (= res!127921 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261853 () Bool)

(declare-fun Unit!8151 () Unit!8147)

(assert (=> b!261853 (= e!169684 Unit!8151)))

(declare-fun mapNonEmpty!11317 () Bool)

(declare-fun mapRes!11317 () Bool)

(declare-fun tp!23661 () Bool)

(declare-fun e!169686 () Bool)

(assert (=> mapNonEmpty!11317 (= mapRes!11317 (and tp!23661 e!169686))))

(declare-fun mapRest!11317 () (Array (_ BitVec 32) ValueCell!2976))

(declare-fun mapKey!11317 () (_ BitVec 32))

(declare-fun mapValue!11317 () ValueCell!2976)

(assert (=> mapNonEmpty!11317 (= (arr!5980 (_values!4807 thiss!1504)) (store mapRest!11317 mapKey!11317 mapValue!11317))))

(declare-fun b!261854 () Bool)

(declare-fun lt!132269 () Unit!8147)

(assert (=> b!261854 (= e!169680 lt!132269)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!450 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8499 V!8499 (_ BitVec 64) Int) Unit!8147)

(assert (=> b!261854 (= lt!132269 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!450 (_keys!7012 thiss!1504) (_values!4807 thiss!1504) (mask!11174 thiss!1504) (extraKeys!4561 thiss!1504) (zeroValue!4665 thiss!1504) (minValue!4665 thiss!1504) key!932 (defaultEntry!4824 thiss!1504)))))

(declare-fun c!44597 () Bool)

(get-info :version)

(assert (=> b!261854 (= c!44597 ((_ is MissingZero!1191) lt!132257))))

(declare-fun e!169678 () Bool)

(assert (=> b!261854 e!169678))

(declare-fun b!261855 () Bool)

(assert (=> b!261855 (= e!169682 e!169681)))

(declare-fun res!127916 () Bool)

(assert (=> b!261855 (=> (not res!127916) (not e!169681))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261855 (= res!127916 (inRange!0 index!297 (mask!11174 thiss!1504)))))

(declare-fun lt!132265 () Unit!8147)

(assert (=> b!261855 (= lt!132265 e!169680)))

(declare-fun c!44600 () Bool)

(declare-fun contains!1900 (ListLongMap!3875 (_ BitVec 64)) Bool)

(assert (=> b!261855 (= c!44600 (contains!1900 lt!132267 key!932))))

(assert (=> b!261855 (= lt!132267 (getCurrentListMap!1481 (_keys!7012 thiss!1504) (_values!4807 thiss!1504) (mask!11174 thiss!1504) (extraKeys!4561 thiss!1504) (zeroValue!4665 thiss!1504) (minValue!4665 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4824 thiss!1504)))))

(declare-fun b!261856 () Bool)

(declare-fun c!44598 () Bool)

(assert (=> b!261856 (= c!44598 ((_ is MissingVacant!1191) lt!132257))))

(assert (=> b!261856 (= e!169678 e!169685)))

(declare-fun b!261857 () Bool)

(declare-fun e!169677 () Bool)

(assert (=> b!261857 (= e!169677 tp_is_empty!6639)))

(declare-fun b!261858 () Bool)

(assert (=> b!261858 (= e!169685 ((_ is Undefined!1191) lt!132257))))

(declare-fun b!261859 () Bool)

(assert (=> b!261859 (= e!169686 tp_is_empty!6639)))

(declare-fun b!261860 () Bool)

(declare-fun res!127920 () Bool)

(assert (=> b!261860 (= res!127920 (= (select (arr!5981 (_keys!7012 thiss!1504)) (index!6937 lt!132257)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261860 (=> (not res!127920) (not e!169676))))

(declare-fun b!261861 () Bool)

(assert (=> b!261861 (= e!169688 (and e!169677 mapRes!11317))))

(declare-fun condMapEmpty!11317 () Bool)

(declare-fun mapDefault!11317 () ValueCell!2976)

(assert (=> b!261861 (= condMapEmpty!11317 (= (arr!5980 (_values!4807 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2976)) mapDefault!11317)))))

(declare-fun mapIsEmpty!11317 () Bool)

(assert (=> mapIsEmpty!11317 mapRes!11317))

(declare-fun b!261862 () Bool)

(declare-fun res!127915 () Bool)

(assert (=> b!261862 (=> (not res!127915) (not e!169689))))

(assert (=> b!261862 (= res!127915 call!25004)))

(assert (=> b!261862 (= e!169678 e!169689)))

(declare-fun b!261863 () Bool)

(declare-fun res!127919 () Bool)

(assert (=> b!261863 (=> (not res!127919) (not e!169689))))

(assert (=> b!261863 (= res!127919 (= (select (arr!5981 (_keys!7012 thiss!1504)) (index!6934 lt!132257)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25001 () Bool)

(assert (=> bm!25001 (= call!25004 (inRange!0 (ite c!44597 (index!6934 lt!132257) (index!6937 lt!132257)) (mask!11174 thiss!1504)))))

(declare-fun res!127918 () Bool)

(assert (=> start!25130 (=> (not res!127918) (not e!169679))))

(declare-fun valid!1502 (LongMapFixedSize!3852) Bool)

(assert (=> start!25130 (= res!127918 (valid!1502 thiss!1504))))

(assert (=> start!25130 e!169679))

(assert (=> start!25130 e!169687))

(assert (=> start!25130 true))

(assert (=> start!25130 tp_is_empty!6639))

(declare-fun b!261847 () Bool)

(assert (=> b!261847 (= e!169676 (not call!25003))))

(assert (= (and start!25130 res!127918) b!261852))

(assert (= (and b!261852 res!127921) b!261850))

(assert (= (and b!261850 res!127914) b!261855))

(assert (= (and b!261855 c!44600) b!261849))

(assert (= (and b!261855 (not c!44600)) b!261854))

(assert (= (and b!261854 c!44597) b!261862))

(assert (= (and b!261854 (not c!44597)) b!261856))

(assert (= (and b!261862 res!127915) b!261863))

(assert (= (and b!261863 res!127919) b!261844))

(assert (= (and b!261856 c!44598) b!261848))

(assert (= (and b!261856 (not c!44598)) b!261858))

(assert (= (and b!261848 res!127917) b!261860))

(assert (= (and b!261860 res!127920) b!261847))

(assert (= (or b!261862 b!261848) bm!25001))

(assert (= (or b!261844 b!261847) bm!25000))

(assert (= (and b!261855 res!127916) b!261846))

(assert (= (and b!261846 c!44599) b!261851))

(assert (= (and b!261846 (not c!44599)) b!261853))

(assert (= (and b!261861 condMapEmpty!11317) mapIsEmpty!11317))

(assert (= (and b!261861 (not condMapEmpty!11317)) mapNonEmpty!11317))

(assert (= (and mapNonEmpty!11317 ((_ is ValueCellFull!2976) mapValue!11317)) b!261859))

(assert (= (and b!261861 ((_ is ValueCellFull!2976) mapDefault!11317)) b!261857))

(assert (= b!261845 b!261861))

(assert (= start!25130 b!261845))

(declare-fun m!277933 () Bool)

(assert (=> mapNonEmpty!11317 m!277933))

(declare-fun m!277935 () Bool)

(assert (=> b!261855 m!277935))

(declare-fun m!277937 () Bool)

(assert (=> b!261855 m!277937))

(declare-fun m!277939 () Bool)

(assert (=> b!261855 m!277939))

(declare-fun m!277941 () Bool)

(assert (=> b!261849 m!277941))

(declare-fun m!277943 () Bool)

(assert (=> b!261863 m!277943))

(declare-fun m!277945 () Bool)

(assert (=> b!261851 m!277945))

(declare-fun m!277947 () Bool)

(assert (=> b!261846 m!277947))

(declare-fun m!277949 () Bool)

(assert (=> b!261846 m!277949))

(declare-fun m!277951 () Bool)

(assert (=> b!261846 m!277951))

(declare-fun m!277953 () Bool)

(assert (=> b!261846 m!277953))

(declare-fun m!277955 () Bool)

(assert (=> b!261846 m!277955))

(declare-fun m!277957 () Bool)

(assert (=> b!261846 m!277957))

(declare-fun m!277959 () Bool)

(assert (=> b!261846 m!277959))

(declare-fun m!277961 () Bool)

(assert (=> b!261846 m!277961))

(declare-fun m!277963 () Bool)

(assert (=> b!261846 m!277963))

(declare-fun m!277965 () Bool)

(assert (=> b!261846 m!277965))

(declare-fun m!277967 () Bool)

(assert (=> b!261846 m!277967))

(declare-fun m!277969 () Bool)

(assert (=> b!261846 m!277969))

(declare-fun m!277971 () Bool)

(assert (=> b!261846 m!277971))

(declare-fun m!277973 () Bool)

(assert (=> b!261846 m!277973))

(declare-fun m!277975 () Bool)

(assert (=> b!261846 m!277975))

(declare-fun m!277977 () Bool)

(assert (=> b!261846 m!277977))

(declare-fun m!277979 () Bool)

(assert (=> b!261846 m!277979))

(assert (=> bm!25000 m!277947))

(declare-fun m!277981 () Bool)

(assert (=> b!261845 m!277981))

(declare-fun m!277983 () Bool)

(assert (=> b!261845 m!277983))

(declare-fun m!277985 () Bool)

(assert (=> b!261854 m!277985))

(declare-fun m!277987 () Bool)

(assert (=> start!25130 m!277987))

(declare-fun m!277989 () Bool)

(assert (=> bm!25001 m!277989))

(declare-fun m!277991 () Bool)

(assert (=> b!261850 m!277991))

(declare-fun m!277993 () Bool)

(assert (=> b!261860 m!277993))

(check-sat (not bm!25000) (not bm!25001) (not start!25130) (not b!261854) (not b!261855) (not b!261850) (not b!261851) (not b_next!6777) (not b!261849) (not mapNonEmpty!11317) tp_is_empty!6639 (not b!261846) b_and!13911 (not b!261845))
(check-sat b_and!13911 (not b_next!6777))
