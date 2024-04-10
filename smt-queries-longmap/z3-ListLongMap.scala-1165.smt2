; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24658 () Bool)

(assert start!24658)

(declare-fun b!258023 () Bool)

(declare-fun b_free!6741 () Bool)

(declare-fun b_next!6741 () Bool)

(assert (=> b!258023 (= b_free!6741 (not b_next!6741))))

(declare-fun tp!23534 () Bool)

(declare-fun b_and!13815 () Bool)

(assert (=> b!258023 (= tp!23534 b_and!13815)))

(declare-fun b!258012 () Bool)

(declare-fun e!167249 () Bool)

(declare-fun e!167257 () Bool)

(assert (=> b!258012 (= e!167249 (not e!167257))))

(declare-fun res!126185 () Bool)

(assert (=> b!258012 (=> res!126185 e!167257)))

(declare-datatypes ((V!8451 0))(
  ( (V!8452 (val!3346 Int)) )
))
(declare-datatypes ((ValueCell!2958 0))(
  ( (ValueCellFull!2958 (v!5444 V!8451)) (EmptyCell!2958) )
))
(declare-datatypes ((array!12553 0))(
  ( (array!12554 (arr!5944 (Array (_ BitVec 32) ValueCell!2958)) (size!6291 (_ BitVec 32))) )
))
(declare-datatypes ((array!12555 0))(
  ( (array!12556 (arr!5945 (Array (_ BitVec 32) (_ BitVec 64))) (size!6292 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3816 0))(
  ( (LongMapFixedSize!3817 (defaultEntry!4761 Int) (mask!11058 (_ BitVec 32)) (extraKeys!4498 (_ BitVec 32)) (zeroValue!4602 V!8451) (minValue!4602 V!8451) (_size!1957 (_ BitVec 32)) (_keys!6931 array!12555) (_values!4744 array!12553) (_vacant!1957 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3816)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!258012 (= res!126185 (not (validMask!0 (mask!11058 thiss!1504))))))

(declare-fun lt!129820 () array!12555)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!258012 (= (arrayCountValidKeys!0 lt!129820 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!8017 0))(
  ( (Unit!8018) )
))
(declare-fun lt!129822 () Unit!8017)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12555 (_ BitVec 32)) Unit!8017)

(assert (=> b!258012 (= lt!129822 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129820 index!297))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!258012 (arrayContainsKey!0 lt!129820 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129819 () Unit!8017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12555 (_ BitVec 64) (_ BitVec 32)) Unit!8017)

(assert (=> b!258012 (= lt!129819 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129820 key!932 index!297))))

(declare-datatypes ((tuple2!4932 0))(
  ( (tuple2!4933 (_1!2477 (_ BitVec 64)) (_2!2477 V!8451)) )
))
(declare-datatypes ((List!3811 0))(
  ( (Nil!3808) (Cons!3807 (h!4469 tuple2!4932) (t!8874 List!3811)) )
))
(declare-datatypes ((ListLongMap!3845 0))(
  ( (ListLongMap!3846 (toList!1938 List!3811)) )
))
(declare-fun lt!129825 () ListLongMap!3845)

(declare-fun v!346 () V!8451)

(declare-fun +!692 (ListLongMap!3845 tuple2!4932) ListLongMap!3845)

(declare-fun getCurrentListMap!1466 (array!12555 array!12553 (_ BitVec 32) (_ BitVec 32) V!8451 V!8451 (_ BitVec 32) Int) ListLongMap!3845)

(assert (=> b!258012 (= (+!692 lt!129825 (tuple2!4933 key!932 v!346)) (getCurrentListMap!1466 lt!129820 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!129823 () Unit!8017)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!102 (array!12555 array!12553 (_ BitVec 32) (_ BitVec 32) V!8451 V!8451 (_ BitVec 32) (_ BitVec 64) V!8451 Int) Unit!8017)

(assert (=> b!258012 (= lt!129823 (lemmaAddValidKeyToArrayThenAddPairToListMap!102 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) index!297 key!932 v!346 (defaultEntry!4761 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12555 (_ BitVec 32)) Bool)

(assert (=> b!258012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129820 (mask!11058 thiss!1504))))

(declare-fun lt!129821 () Unit!8017)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12555 (_ BitVec 32) (_ BitVec 32)) Unit!8017)

(assert (=> b!258012 (= lt!129821 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6931 thiss!1504) index!297 (mask!11058 thiss!1504)))))

(assert (=> b!258012 (= (arrayCountValidKeys!0 lt!129820 #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6931 thiss!1504) #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504)))))))

(declare-fun lt!129829 () Unit!8017)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12555 (_ BitVec 32) (_ BitVec 64)) Unit!8017)

(assert (=> b!258012 (= lt!129829 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6931 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3812 0))(
  ( (Nil!3809) (Cons!3808 (h!4470 (_ BitVec 64)) (t!8875 List!3812)) )
))
(declare-fun arrayNoDuplicates!0 (array!12555 (_ BitVec 32) List!3812) Bool)

(assert (=> b!258012 (arrayNoDuplicates!0 lt!129820 #b00000000000000000000000000000000 Nil!3809)))

(assert (=> b!258012 (= lt!129820 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun lt!129824 () Unit!8017)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12555 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3812) Unit!8017)

(assert (=> b!258012 (= lt!129824 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6931 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3809))))

(declare-fun lt!129826 () Unit!8017)

(declare-fun e!167250 () Unit!8017)

(assert (=> b!258012 (= lt!129826 e!167250)))

(declare-fun c!43689 () Bool)

(assert (=> b!258012 (= c!43689 (arrayContainsKey!0 (_keys!6931 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24519 () Bool)

(declare-fun call!24523 () Bool)

(declare-fun c!43687 () Bool)

(declare-datatypes ((SeekEntryResult!1174 0))(
  ( (MissingZero!1174 (index!6866 (_ BitVec 32))) (Found!1174 (index!6867 (_ BitVec 32))) (Intermediate!1174 (undefined!1986 Bool) (index!6868 (_ BitVec 32)) (x!25042 (_ BitVec 32))) (Undefined!1174) (MissingVacant!1174 (index!6869 (_ BitVec 32))) )
))
(declare-fun lt!129828 () SeekEntryResult!1174)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24519 (= call!24523 (inRange!0 (ite c!43687 (index!6866 lt!129828) (index!6869 lt!129828)) (mask!11058 thiss!1504)))))

(declare-fun b!258013 () Bool)

(declare-fun e!167263 () Bool)

(declare-fun tp_is_empty!6603 () Bool)

(assert (=> b!258013 (= e!167263 tp_is_empty!6603)))

(declare-fun mapIsEmpty!11244 () Bool)

(declare-fun mapRes!11244 () Bool)

(assert (=> mapIsEmpty!11244 mapRes!11244))

(declare-fun b!258014 () Bool)

(declare-fun e!167260 () Unit!8017)

(declare-fun Unit!8019 () Unit!8017)

(assert (=> b!258014 (= e!167260 Unit!8019)))

(declare-fun lt!129827 () Unit!8017)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!436 (array!12555 array!12553 (_ BitVec 32) (_ BitVec 32) V!8451 V!8451 (_ BitVec 64) Int) Unit!8017)

(assert (=> b!258014 (= lt!129827 (lemmaInListMapThenSeekEntryOrOpenFindsIt!436 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 (defaultEntry!4761 thiss!1504)))))

(assert (=> b!258014 false))

(declare-fun b!258015 () Bool)

(declare-fun Unit!8020 () Unit!8017)

(assert (=> b!258015 (= e!167250 Unit!8020)))

(declare-fun b!258016 () Bool)

(declare-fun Unit!8021 () Unit!8017)

(assert (=> b!258016 (= e!167250 Unit!8021)))

(declare-fun lt!129817 () Unit!8017)

(declare-fun lemmaArrayContainsKeyThenInListMap!243 (array!12555 array!12553 (_ BitVec 32) (_ BitVec 32) V!8451 V!8451 (_ BitVec 64) (_ BitVec 32) Int) Unit!8017)

(assert (=> b!258016 (= lt!129817 (lemmaArrayContainsKeyThenInListMap!243 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(assert (=> b!258016 false))

(declare-fun b!258017 () Bool)

(declare-fun e!167254 () Bool)

(declare-fun call!24522 () Bool)

(assert (=> b!258017 (= e!167254 (not call!24522))))

(declare-fun res!126182 () Bool)

(declare-fun e!167258 () Bool)

(assert (=> start!24658 (=> (not res!126182) (not e!167258))))

(declare-fun valid!1490 (LongMapFixedSize!3816) Bool)

(assert (=> start!24658 (= res!126182 (valid!1490 thiss!1504))))

(assert (=> start!24658 e!167258))

(declare-fun e!167262 () Bool)

(assert (=> start!24658 e!167262))

(assert (=> start!24658 true))

(assert (=> start!24658 tp_is_empty!6603))

(declare-fun b!258018 () Bool)

(declare-fun res!126183 () Bool)

(assert (=> b!258018 (= res!126183 (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6869 lt!129828)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258018 (=> (not res!126183) (not e!167254))))

(declare-fun mapNonEmpty!11244 () Bool)

(declare-fun tp!23535 () Bool)

(assert (=> mapNonEmpty!11244 (= mapRes!11244 (and tp!23535 e!167263))))

(declare-fun mapKey!11244 () (_ BitVec 32))

(declare-fun mapValue!11244 () ValueCell!2958)

(declare-fun mapRest!11244 () (Array (_ BitVec 32) ValueCell!2958))

(assert (=> mapNonEmpty!11244 (= (arr!5944 (_values!4744 thiss!1504)) (store mapRest!11244 mapKey!11244 mapValue!11244))))

(declare-fun b!258019 () Bool)

(declare-fun res!126181 () Bool)

(assert (=> b!258019 (=> (not res!126181) (not e!167258))))

(assert (=> b!258019 (= res!126181 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!258020 () Bool)

(declare-fun e!167255 () Bool)

(assert (=> b!258020 (= e!167255 e!167249)))

(declare-fun res!126184 () Bool)

(assert (=> b!258020 (=> (not res!126184) (not e!167249))))

(assert (=> b!258020 (= res!126184 (inRange!0 index!297 (mask!11058 thiss!1504)))))

(declare-fun lt!129830 () Unit!8017)

(assert (=> b!258020 (= lt!129830 e!167260)))

(declare-fun c!43688 () Bool)

(declare-fun contains!1878 (ListLongMap!3845 (_ BitVec 64)) Bool)

(assert (=> b!258020 (= c!43688 (contains!1878 lt!129825 key!932))))

(assert (=> b!258020 (= lt!129825 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun b!258021 () Bool)

(declare-fun res!126186 () Bool)

(declare-fun e!167261 () Bool)

(assert (=> b!258021 (=> (not res!126186) (not e!167261))))

(assert (=> b!258021 (= res!126186 call!24523)))

(declare-fun e!167253 () Bool)

(assert (=> b!258021 (= e!167253 e!167261)))

(declare-fun b!258022 () Bool)

(declare-fun e!167256 () Bool)

(assert (=> b!258022 (= e!167256 e!167254)))

(declare-fun res!126188 () Bool)

(assert (=> b!258022 (= res!126188 call!24523)))

(assert (=> b!258022 (=> (not res!126188) (not e!167254))))

(declare-fun e!167252 () Bool)

(declare-fun array_inv!3929 (array!12555) Bool)

(declare-fun array_inv!3930 (array!12553) Bool)

(assert (=> b!258023 (= e!167262 (and tp!23534 tp_is_empty!6603 (array_inv!3929 (_keys!6931 thiss!1504)) (array_inv!3930 (_values!4744 thiss!1504)) e!167252))))

(declare-fun b!258024 () Bool)

(declare-fun e!167259 () Bool)

(assert (=> b!258024 (= e!167252 (and e!167259 mapRes!11244))))

(declare-fun condMapEmpty!11244 () Bool)

(declare-fun mapDefault!11244 () ValueCell!2958)

(assert (=> b!258024 (= condMapEmpty!11244 (= (arr!5944 (_values!4744 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2958)) mapDefault!11244)))))

(declare-fun b!258025 () Bool)

(assert (=> b!258025 (= e!167258 e!167255)))

(declare-fun res!126187 () Bool)

(assert (=> b!258025 (=> (not res!126187) (not e!167255))))

(assert (=> b!258025 (= res!126187 (or (= lt!129828 (MissingZero!1174 index!297)) (= lt!129828 (MissingVacant!1174 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12555 (_ BitVec 32)) SeekEntryResult!1174)

(assert (=> b!258025 (= lt!129828 (seekEntryOrOpen!0 key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)))))

(declare-fun b!258026 () Bool)

(declare-fun lt!129818 () Unit!8017)

(assert (=> b!258026 (= e!167260 lt!129818)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!439 (array!12555 array!12553 (_ BitVec 32) (_ BitVec 32) V!8451 V!8451 (_ BitVec 64) Int) Unit!8017)

(assert (=> b!258026 (= lt!129818 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!439 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 (defaultEntry!4761 thiss!1504)))))

(get-info :version)

(assert (=> b!258026 (= c!43687 ((_ is MissingZero!1174) lt!129828))))

(assert (=> b!258026 e!167253))

(declare-fun b!258027 () Bool)

(assert (=> b!258027 (= e!167261 (not call!24522))))

(declare-fun b!258028 () Bool)

(assert (=> b!258028 (= e!167259 tp_is_empty!6603)))

(declare-fun b!258029 () Bool)

(declare-fun c!43690 () Bool)

(assert (=> b!258029 (= c!43690 ((_ is MissingVacant!1174) lt!129828))))

(assert (=> b!258029 (= e!167253 e!167256)))

(declare-fun b!258030 () Bool)

(assert (=> b!258030 (= e!167257 (= (size!6291 (_values!4744 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11058 thiss!1504))))))

(declare-fun b!258031 () Bool)

(declare-fun res!126180 () Bool)

(assert (=> b!258031 (=> (not res!126180) (not e!167261))))

(assert (=> b!258031 (= res!126180 (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6866 lt!129828)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258032 () Bool)

(assert (=> b!258032 (= e!167256 ((_ is Undefined!1174) lt!129828))))

(declare-fun bm!24520 () Bool)

(assert (=> bm!24520 (= call!24522 (arrayContainsKey!0 (_keys!6931 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!24658 res!126182) b!258019))

(assert (= (and b!258019 res!126181) b!258025))

(assert (= (and b!258025 res!126187) b!258020))

(assert (= (and b!258020 c!43688) b!258014))

(assert (= (and b!258020 (not c!43688)) b!258026))

(assert (= (and b!258026 c!43687) b!258021))

(assert (= (and b!258026 (not c!43687)) b!258029))

(assert (= (and b!258021 res!126186) b!258031))

(assert (= (and b!258031 res!126180) b!258027))

(assert (= (and b!258029 c!43690) b!258022))

(assert (= (and b!258029 (not c!43690)) b!258032))

(assert (= (and b!258022 res!126188) b!258018))

(assert (= (and b!258018 res!126183) b!258017))

(assert (= (or b!258021 b!258022) bm!24519))

(assert (= (or b!258027 b!258017) bm!24520))

(assert (= (and b!258020 res!126184) b!258012))

(assert (= (and b!258012 c!43689) b!258016))

(assert (= (and b!258012 (not c!43689)) b!258015))

(assert (= (and b!258012 (not res!126185)) b!258030))

(assert (= (and b!258024 condMapEmpty!11244) mapIsEmpty!11244))

(assert (= (and b!258024 (not condMapEmpty!11244)) mapNonEmpty!11244))

(assert (= (and mapNonEmpty!11244 ((_ is ValueCellFull!2958) mapValue!11244)) b!258013))

(assert (= (and b!258024 ((_ is ValueCellFull!2958) mapDefault!11244)) b!258028))

(assert (= b!258023 b!258024))

(assert (= start!24658 b!258023))

(declare-fun m!273319 () Bool)

(assert (=> b!258023 m!273319))

(declare-fun m!273321 () Bool)

(assert (=> b!258023 m!273321))

(declare-fun m!273323 () Bool)

(assert (=> b!258016 m!273323))

(declare-fun m!273325 () Bool)

(assert (=> b!258012 m!273325))

(declare-fun m!273327 () Bool)

(assert (=> b!258012 m!273327))

(declare-fun m!273329 () Bool)

(assert (=> b!258012 m!273329))

(declare-fun m!273331 () Bool)

(assert (=> b!258012 m!273331))

(declare-fun m!273333 () Bool)

(assert (=> b!258012 m!273333))

(declare-fun m!273335 () Bool)

(assert (=> b!258012 m!273335))

(declare-fun m!273337 () Bool)

(assert (=> b!258012 m!273337))

(declare-fun m!273339 () Bool)

(assert (=> b!258012 m!273339))

(declare-fun m!273341 () Bool)

(assert (=> b!258012 m!273341))

(declare-fun m!273343 () Bool)

(assert (=> b!258012 m!273343))

(declare-fun m!273345 () Bool)

(assert (=> b!258012 m!273345))

(declare-fun m!273347 () Bool)

(assert (=> b!258012 m!273347))

(declare-fun m!273349 () Bool)

(assert (=> b!258012 m!273349))

(declare-fun m!273351 () Bool)

(assert (=> b!258012 m!273351))

(declare-fun m!273353 () Bool)

(assert (=> b!258012 m!273353))

(declare-fun m!273355 () Bool)

(assert (=> b!258012 m!273355))

(declare-fun m!273357 () Bool)

(assert (=> b!258012 m!273357))

(declare-fun m!273359 () Bool)

(assert (=> b!258012 m!273359))

(declare-fun m!273361 () Bool)

(assert (=> b!258014 m!273361))

(declare-fun m!273363 () Bool)

(assert (=> start!24658 m!273363))

(declare-fun m!273365 () Bool)

(assert (=> b!258018 m!273365))

(declare-fun m!273367 () Bool)

(assert (=> b!258025 m!273367))

(declare-fun m!273369 () Bool)

(assert (=> mapNonEmpty!11244 m!273369))

(assert (=> bm!24520 m!273325))

(declare-fun m!273371 () Bool)

(assert (=> b!258020 m!273371))

(declare-fun m!273373 () Bool)

(assert (=> b!258020 m!273373))

(declare-fun m!273375 () Bool)

(assert (=> b!258020 m!273375))

(declare-fun m!273377 () Bool)

(assert (=> b!258031 m!273377))

(declare-fun m!273379 () Bool)

(assert (=> bm!24519 m!273379))

(declare-fun m!273381 () Bool)

(assert (=> b!258026 m!273381))

(check-sat (not b!258014) (not b!258012) (not b!258026) (not start!24658) (not bm!24519) (not b!258023) (not b!258016) (not b!258025) (not bm!24520) tp_is_empty!6603 (not b_next!6741) (not b!258020) (not mapNonEmpty!11244) b_and!13815)
(check-sat b_and!13815 (not b_next!6741))
(get-model)

(declare-fun d!61879 () Bool)

(assert (=> d!61879 (= (inRange!0 index!297 (mask!11058 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11058 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!258020 d!61879))

(declare-fun d!61881 () Bool)

(declare-fun e!167313 () Bool)

(assert (=> d!61881 e!167313))

(declare-fun res!126218 () Bool)

(assert (=> d!61881 (=> res!126218 e!167313)))

(declare-fun lt!129881 () Bool)

(assert (=> d!61881 (= res!126218 (not lt!129881))))

(declare-fun lt!129884 () Bool)

(assert (=> d!61881 (= lt!129881 lt!129884)))

(declare-fun lt!129882 () Unit!8017)

(declare-fun e!167314 () Unit!8017)

(assert (=> d!61881 (= lt!129882 e!167314)))

(declare-fun c!43705 () Bool)

(assert (=> d!61881 (= c!43705 lt!129884)))

(declare-fun containsKey!305 (List!3811 (_ BitVec 64)) Bool)

(assert (=> d!61881 (= lt!129884 (containsKey!305 (toList!1938 lt!129825) key!932))))

(assert (=> d!61881 (= (contains!1878 lt!129825 key!932) lt!129881)))

(declare-fun b!258102 () Bool)

(declare-fun lt!129883 () Unit!8017)

(assert (=> b!258102 (= e!167314 lt!129883)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!253 (List!3811 (_ BitVec 64)) Unit!8017)

(assert (=> b!258102 (= lt!129883 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 lt!129825) key!932))))

(declare-datatypes ((Option!319 0))(
  ( (Some!318 (v!5448 V!8451)) (None!317) )
))
(declare-fun isDefined!254 (Option!319) Bool)

(declare-fun getValueByKey!313 (List!3811 (_ BitVec 64)) Option!319)

(assert (=> b!258102 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129825) key!932))))

(declare-fun b!258103 () Bool)

(declare-fun Unit!8026 () Unit!8017)

(assert (=> b!258103 (= e!167314 Unit!8026)))

(declare-fun b!258104 () Bool)

(assert (=> b!258104 (= e!167313 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129825) key!932)))))

(assert (= (and d!61881 c!43705) b!258102))

(assert (= (and d!61881 (not c!43705)) b!258103))

(assert (= (and d!61881 (not res!126218)) b!258104))

(declare-fun m!273447 () Bool)

(assert (=> d!61881 m!273447))

(declare-fun m!273449 () Bool)

(assert (=> b!258102 m!273449))

(declare-fun m!273451 () Bool)

(assert (=> b!258102 m!273451))

(assert (=> b!258102 m!273451))

(declare-fun m!273453 () Bool)

(assert (=> b!258102 m!273453))

(assert (=> b!258104 m!273451))

(assert (=> b!258104 m!273451))

(assert (=> b!258104 m!273453))

(assert (=> b!258020 d!61881))

(declare-fun b!258147 () Bool)

(declare-fun res!126238 () Bool)

(declare-fun e!167342 () Bool)

(assert (=> b!258147 (=> (not res!126238) (not e!167342))))

(declare-fun e!167348 () Bool)

(assert (=> b!258147 (= res!126238 e!167348)))

(declare-fun c!43722 () Bool)

(assert (=> b!258147 (= c!43722 (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!258148 () Bool)

(declare-fun e!167347 () Bool)

(declare-fun e!167345 () Bool)

(assert (=> b!258148 (= e!167347 e!167345)))

(declare-fun res!126244 () Bool)

(declare-fun call!24545 () Bool)

(assert (=> b!258148 (= res!126244 call!24545)))

(assert (=> b!258148 (=> (not res!126244) (not e!167345))))

(declare-fun bm!24541 () Bool)

(declare-fun call!24544 () ListLongMap!3845)

(declare-fun call!24548 () ListLongMap!3845)

(assert (=> bm!24541 (= call!24544 call!24548)))

(declare-fun b!258149 () Bool)

(declare-fun call!24550 () Bool)

(assert (=> b!258149 (= e!167348 (not call!24550))))

(declare-fun b!258150 () Bool)

(declare-fun e!167349 () Bool)

(declare-fun e!167352 () Bool)

(assert (=> b!258150 (= e!167349 e!167352)))

(declare-fun res!126239 () Bool)

(assert (=> b!258150 (=> (not res!126239) (not e!167352))))

(declare-fun lt!129950 () ListLongMap!3845)

(assert (=> b!258150 (= res!126239 (contains!1878 lt!129950 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258150 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun d!61883 () Bool)

(assert (=> d!61883 e!167342))

(declare-fun res!126241 () Bool)

(assert (=> d!61883 (=> (not res!126241) (not e!167342))))

(assert (=> d!61883 (= res!126241 (or (bvsge #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))))

(declare-fun lt!129932 () ListLongMap!3845)

(assert (=> d!61883 (= lt!129950 lt!129932)))

(declare-fun lt!129943 () Unit!8017)

(declare-fun e!167351 () Unit!8017)

(assert (=> d!61883 (= lt!129943 e!167351)))

(declare-fun c!43723 () Bool)

(declare-fun e!167343 () Bool)

(assert (=> d!61883 (= c!43723 e!167343)))

(declare-fun res!126237 () Bool)

(assert (=> d!61883 (=> (not res!126237) (not e!167343))))

(assert (=> d!61883 (= res!126237 (bvslt #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun e!167346 () ListLongMap!3845)

(assert (=> d!61883 (= lt!129932 e!167346)))

(declare-fun c!43720 () Bool)

(assert (=> d!61883 (= c!43720 (and (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61883 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!61883 (= (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) lt!129950)))

(declare-fun bm!24542 () Bool)

(assert (=> bm!24542 (= call!24550 (contains!1878 lt!129950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258151 () Bool)

(declare-fun c!43721 () Bool)

(assert (=> b!258151 (= c!43721 (and (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167353 () ListLongMap!3845)

(declare-fun e!167341 () ListLongMap!3845)

(assert (=> b!258151 (= e!167353 e!167341)))

(declare-fun b!258152 () Bool)

(assert (=> b!258152 (= e!167346 (+!692 call!24548 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))

(declare-fun call!24547 () ListLongMap!3845)

(declare-fun bm!24543 () Bool)

(declare-fun call!24549 () ListLongMap!3845)

(declare-fun c!43719 () Bool)

(declare-fun call!24546 () ListLongMap!3845)

(assert (=> bm!24543 (= call!24548 (+!692 (ite c!43720 call!24549 (ite c!43719 call!24547 call!24546)) (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(declare-fun bm!24544 () Bool)

(assert (=> bm!24544 (= call!24545 (contains!1878 lt!129950 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258153 () Bool)

(declare-fun res!126240 () Bool)

(assert (=> b!258153 (=> (not res!126240) (not e!167342))))

(assert (=> b!258153 (= res!126240 e!167349)))

(declare-fun res!126243 () Bool)

(assert (=> b!258153 (=> res!126243 e!167349)))

(declare-fun e!167350 () Bool)

(assert (=> b!258153 (= res!126243 (not e!167350))))

(declare-fun res!126245 () Bool)

(assert (=> b!258153 (=> (not res!126245) (not e!167350))))

(assert (=> b!258153 (= res!126245 (bvslt #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun b!258154 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!258154 (= e!167343 (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258155 () Bool)

(assert (=> b!258155 (= e!167347 (not call!24545))))

(declare-fun b!258156 () Bool)

(declare-fun Unit!8027 () Unit!8017)

(assert (=> b!258156 (= e!167351 Unit!8027)))

(declare-fun bm!24545 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!577 (array!12555 array!12553 (_ BitVec 32) (_ BitVec 32) V!8451 V!8451 (_ BitVec 32) Int) ListLongMap!3845)

(assert (=> bm!24545 (= call!24549 (getCurrentListMapNoExtraKeys!577 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun b!258157 () Bool)

(declare-fun e!167344 () Bool)

(assert (=> b!258157 (= e!167348 e!167344)))

(declare-fun res!126242 () Bool)

(assert (=> b!258157 (= res!126242 call!24550)))

(assert (=> b!258157 (=> (not res!126242) (not e!167344))))

(declare-fun b!258158 () Bool)

(declare-fun apply!255 (ListLongMap!3845 (_ BitVec 64)) V!8451)

(assert (=> b!258158 (= e!167345 (= (apply!255 lt!129950 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4602 thiss!1504)))))

(declare-fun b!258159 () Bool)

(assert (=> b!258159 (= e!167353 call!24544)))

(declare-fun b!258160 () Bool)

(declare-fun lt!129930 () Unit!8017)

(assert (=> b!258160 (= e!167351 lt!129930)))

(declare-fun lt!129938 () ListLongMap!3845)

(assert (=> b!258160 (= lt!129938 (getCurrentListMapNoExtraKeys!577 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!129947 () (_ BitVec 64))

(assert (=> b!258160 (= lt!129947 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129934 () (_ BitVec 64))

(assert (=> b!258160 (= lt!129934 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129948 () Unit!8017)

(declare-fun addStillContains!231 (ListLongMap!3845 (_ BitVec 64) V!8451 (_ BitVec 64)) Unit!8017)

(assert (=> b!258160 (= lt!129948 (addStillContains!231 lt!129938 lt!129947 (zeroValue!4602 thiss!1504) lt!129934))))

(assert (=> b!258160 (contains!1878 (+!692 lt!129938 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504))) lt!129934)))

(declare-fun lt!129937 () Unit!8017)

(assert (=> b!258160 (= lt!129937 lt!129948)))

(declare-fun lt!129942 () ListLongMap!3845)

(assert (=> b!258160 (= lt!129942 (getCurrentListMapNoExtraKeys!577 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!129939 () (_ BitVec 64))

(assert (=> b!258160 (= lt!129939 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129940 () (_ BitVec 64))

(assert (=> b!258160 (= lt!129940 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129949 () Unit!8017)

(declare-fun addApplyDifferent!231 (ListLongMap!3845 (_ BitVec 64) V!8451 (_ BitVec 64)) Unit!8017)

(assert (=> b!258160 (= lt!129949 (addApplyDifferent!231 lt!129942 lt!129939 (minValue!4602 thiss!1504) lt!129940))))

(assert (=> b!258160 (= (apply!255 (+!692 lt!129942 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504))) lt!129940) (apply!255 lt!129942 lt!129940))))

(declare-fun lt!129929 () Unit!8017)

(assert (=> b!258160 (= lt!129929 lt!129949)))

(declare-fun lt!129946 () ListLongMap!3845)

(assert (=> b!258160 (= lt!129946 (getCurrentListMapNoExtraKeys!577 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!129935 () (_ BitVec 64))

(assert (=> b!258160 (= lt!129935 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129936 () (_ BitVec 64))

(assert (=> b!258160 (= lt!129936 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129944 () Unit!8017)

(assert (=> b!258160 (= lt!129944 (addApplyDifferent!231 lt!129946 lt!129935 (zeroValue!4602 thiss!1504) lt!129936))))

(assert (=> b!258160 (= (apply!255 (+!692 lt!129946 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504))) lt!129936) (apply!255 lt!129946 lt!129936))))

(declare-fun lt!129941 () Unit!8017)

(assert (=> b!258160 (= lt!129941 lt!129944)))

(declare-fun lt!129931 () ListLongMap!3845)

(assert (=> b!258160 (= lt!129931 (getCurrentListMapNoExtraKeys!577 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!129933 () (_ BitVec 64))

(assert (=> b!258160 (= lt!129933 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129945 () (_ BitVec 64))

(assert (=> b!258160 (= lt!129945 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258160 (= lt!129930 (addApplyDifferent!231 lt!129931 lt!129933 (minValue!4602 thiss!1504) lt!129945))))

(assert (=> b!258160 (= (apply!255 (+!692 lt!129931 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504))) lt!129945) (apply!255 lt!129931 lt!129945))))

(declare-fun bm!24546 () Bool)

(assert (=> bm!24546 (= call!24546 call!24547)))

(declare-fun b!258161 () Bool)

(assert (=> b!258161 (= e!167341 call!24546)))

(declare-fun b!258162 () Bool)

(declare-fun get!3056 (ValueCell!2958 V!8451) V!8451)

(declare-fun dynLambda!598 (Int (_ BitVec 64)) V!8451)

(assert (=> b!258162 (= e!167352 (= (apply!255 lt!129950 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)) (get!3056 (select (arr!5944 (_values!4744 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6291 (_values!4744 thiss!1504))))))

(assert (=> b!258162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun bm!24547 () Bool)

(assert (=> bm!24547 (= call!24547 call!24549)))

(declare-fun b!258163 () Bool)

(assert (=> b!258163 (= e!167346 e!167353)))

(assert (=> b!258163 (= c!43719 (and (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!258164 () Bool)

(assert (=> b!258164 (= e!167350 (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258165 () Bool)

(assert (=> b!258165 (= e!167341 call!24544)))

(declare-fun b!258166 () Bool)

(assert (=> b!258166 (= e!167344 (= (apply!255 lt!129950 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4602 thiss!1504)))))

(declare-fun b!258167 () Bool)

(assert (=> b!258167 (= e!167342 e!167347)))

(declare-fun c!43718 () Bool)

(assert (=> b!258167 (= c!43718 (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61883 c!43720) b!258152))

(assert (= (and d!61883 (not c!43720)) b!258163))

(assert (= (and b!258163 c!43719) b!258159))

(assert (= (and b!258163 (not c!43719)) b!258151))

(assert (= (and b!258151 c!43721) b!258165))

(assert (= (and b!258151 (not c!43721)) b!258161))

(assert (= (or b!258165 b!258161) bm!24546))

(assert (= (or b!258159 bm!24546) bm!24547))

(assert (= (or b!258159 b!258165) bm!24541))

(assert (= (or b!258152 bm!24547) bm!24545))

(assert (= (or b!258152 bm!24541) bm!24543))

(assert (= (and d!61883 res!126237) b!258154))

(assert (= (and d!61883 c!43723) b!258160))

(assert (= (and d!61883 (not c!43723)) b!258156))

(assert (= (and d!61883 res!126241) b!258153))

(assert (= (and b!258153 res!126245) b!258164))

(assert (= (and b!258153 (not res!126243)) b!258150))

(assert (= (and b!258150 res!126239) b!258162))

(assert (= (and b!258153 res!126240) b!258147))

(assert (= (and b!258147 c!43722) b!258157))

(assert (= (and b!258147 (not c!43722)) b!258149))

(assert (= (and b!258157 res!126242) b!258166))

(assert (= (or b!258157 b!258149) bm!24542))

(assert (= (and b!258147 res!126238) b!258167))

(assert (= (and b!258167 c!43718) b!258148))

(assert (= (and b!258167 (not c!43718)) b!258155))

(assert (= (and b!258148 res!126244) b!258158))

(assert (= (or b!258148 b!258155) bm!24544))

(declare-fun b_lambda!8195 () Bool)

(assert (=> (not b_lambda!8195) (not b!258162)))

(declare-fun t!8879 () Bool)

(declare-fun tb!3023 () Bool)

(assert (=> (and b!258023 (= (defaultEntry!4761 thiss!1504) (defaultEntry!4761 thiss!1504)) t!8879) tb!3023))

(declare-fun result!5391 () Bool)

(assert (=> tb!3023 (= result!5391 tp_is_empty!6603)))

(assert (=> b!258162 t!8879))

(declare-fun b_and!13819 () Bool)

(assert (= b_and!13815 (and (=> t!8879 result!5391) b_and!13819)))

(declare-fun m!273455 () Bool)

(assert (=> bm!24544 m!273455))

(declare-fun m!273457 () Bool)

(assert (=> b!258150 m!273457))

(assert (=> b!258150 m!273457))

(declare-fun m!273459 () Bool)

(assert (=> b!258150 m!273459))

(assert (=> b!258164 m!273457))

(assert (=> b!258164 m!273457))

(declare-fun m!273461 () Bool)

(assert (=> b!258164 m!273461))

(declare-fun m!273463 () Bool)

(assert (=> b!258160 m!273463))

(declare-fun m!273465 () Bool)

(assert (=> b!258160 m!273465))

(declare-fun m!273467 () Bool)

(assert (=> b!258160 m!273467))

(declare-fun m!273469 () Bool)

(assert (=> b!258160 m!273469))

(declare-fun m!273471 () Bool)

(assert (=> b!258160 m!273471))

(assert (=> b!258160 m!273463))

(declare-fun m!273473 () Bool)

(assert (=> b!258160 m!273473))

(declare-fun m!273475 () Bool)

(assert (=> b!258160 m!273475))

(declare-fun m!273477 () Bool)

(assert (=> b!258160 m!273477))

(assert (=> b!258160 m!273475))

(declare-fun m!273479 () Bool)

(assert (=> b!258160 m!273479))

(declare-fun m!273481 () Bool)

(assert (=> b!258160 m!273481))

(declare-fun m!273483 () Bool)

(assert (=> b!258160 m!273483))

(declare-fun m!273485 () Bool)

(assert (=> b!258160 m!273485))

(declare-fun m!273487 () Bool)

(assert (=> b!258160 m!273487))

(declare-fun m!273489 () Bool)

(assert (=> b!258160 m!273489))

(assert (=> b!258160 m!273479))

(declare-fun m!273491 () Bool)

(assert (=> b!258160 m!273491))

(declare-fun m!273493 () Bool)

(assert (=> b!258160 m!273493))

(assert (=> b!258160 m!273457))

(assert (=> b!258160 m!273483))

(declare-fun m!273495 () Bool)

(assert (=> bm!24542 m!273495))

(assert (=> bm!24545 m!273493))

(declare-fun m!273497 () Bool)

(assert (=> b!258166 m!273497))

(assert (=> b!258154 m!273457))

(assert (=> b!258154 m!273457))

(assert (=> b!258154 m!273461))

(declare-fun m!273499 () Bool)

(assert (=> b!258158 m!273499))

(declare-fun m!273501 () Bool)

(assert (=> b!258152 m!273501))

(declare-fun m!273503 () Bool)

(assert (=> b!258162 m!273503))

(declare-fun m!273505 () Bool)

(assert (=> b!258162 m!273505))

(declare-fun m!273507 () Bool)

(assert (=> b!258162 m!273507))

(assert (=> b!258162 m!273457))

(declare-fun m!273509 () Bool)

(assert (=> b!258162 m!273509))

(assert (=> b!258162 m!273503))

(assert (=> b!258162 m!273505))

(assert (=> b!258162 m!273457))

(declare-fun m!273511 () Bool)

(assert (=> bm!24543 m!273511))

(assert (=> d!61883 m!273351))

(assert (=> b!258020 d!61883))

(declare-fun d!61885 () Bool)

(declare-fun lt!129959 () SeekEntryResult!1174)

(assert (=> d!61885 (and (or ((_ is Undefined!1174) lt!129959) (not ((_ is Found!1174) lt!129959)) (and (bvsge (index!6867 lt!129959) #b00000000000000000000000000000000) (bvslt (index!6867 lt!129959) (size!6292 (_keys!6931 thiss!1504))))) (or ((_ is Undefined!1174) lt!129959) ((_ is Found!1174) lt!129959) (not ((_ is MissingZero!1174) lt!129959)) (and (bvsge (index!6866 lt!129959) #b00000000000000000000000000000000) (bvslt (index!6866 lt!129959) (size!6292 (_keys!6931 thiss!1504))))) (or ((_ is Undefined!1174) lt!129959) ((_ is Found!1174) lt!129959) ((_ is MissingZero!1174) lt!129959) (not ((_ is MissingVacant!1174) lt!129959)) (and (bvsge (index!6869 lt!129959) #b00000000000000000000000000000000) (bvslt (index!6869 lt!129959) (size!6292 (_keys!6931 thiss!1504))))) (or ((_ is Undefined!1174) lt!129959) (ite ((_ is Found!1174) lt!129959) (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6867 lt!129959)) key!932) (ite ((_ is MissingZero!1174) lt!129959) (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6866 lt!129959)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1174) lt!129959) (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6869 lt!129959)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!167362 () SeekEntryResult!1174)

(assert (=> d!61885 (= lt!129959 e!167362)))

(declare-fun c!43730 () Bool)

(declare-fun lt!129957 () SeekEntryResult!1174)

(assert (=> d!61885 (= c!43730 (and ((_ is Intermediate!1174) lt!129957) (undefined!1986 lt!129957)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12555 (_ BitVec 32)) SeekEntryResult!1174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61885 (= lt!129957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11058 thiss!1504)) key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)))))

(assert (=> d!61885 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!61885 (= (seekEntryOrOpen!0 key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)) lt!129959)))

(declare-fun b!258182 () Bool)

(declare-fun c!43731 () Bool)

(declare-fun lt!129958 () (_ BitVec 64))

(assert (=> b!258182 (= c!43731 (= lt!129958 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167361 () SeekEntryResult!1174)

(declare-fun e!167360 () SeekEntryResult!1174)

(assert (=> b!258182 (= e!167361 e!167360)))

(declare-fun b!258183 () Bool)

(assert (=> b!258183 (= e!167361 (Found!1174 (index!6868 lt!129957)))))

(declare-fun b!258184 () Bool)

(assert (=> b!258184 (= e!167362 e!167361)))

(assert (=> b!258184 (= lt!129958 (select (arr!5945 (_keys!6931 thiss!1504)) (index!6868 lt!129957)))))

(declare-fun c!43732 () Bool)

(assert (=> b!258184 (= c!43732 (= lt!129958 key!932))))

(declare-fun b!258185 () Bool)

(assert (=> b!258185 (= e!167360 (MissingZero!1174 (index!6868 lt!129957)))))

(declare-fun b!258186 () Bool)

(assert (=> b!258186 (= e!167362 Undefined!1174)))

(declare-fun b!258187 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12555 (_ BitVec 32)) SeekEntryResult!1174)

(assert (=> b!258187 (= e!167360 (seekKeyOrZeroReturnVacant!0 (x!25042 lt!129957) (index!6868 lt!129957) (index!6868 lt!129957) key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)))))

(assert (= (and d!61885 c!43730) b!258186))

(assert (= (and d!61885 (not c!43730)) b!258184))

(assert (= (and b!258184 c!43732) b!258183))

(assert (= (and b!258184 (not c!43732)) b!258182))

(assert (= (and b!258182 c!43731) b!258185))

(assert (= (and b!258182 (not c!43731)) b!258187))

(declare-fun m!273513 () Bool)

(assert (=> d!61885 m!273513))

(declare-fun m!273515 () Bool)

(assert (=> d!61885 m!273515))

(declare-fun m!273517 () Bool)

(assert (=> d!61885 m!273517))

(declare-fun m!273519 () Bool)

(assert (=> d!61885 m!273519))

(assert (=> d!61885 m!273351))

(declare-fun m!273521 () Bool)

(assert (=> d!61885 m!273521))

(assert (=> d!61885 m!273513))

(declare-fun m!273523 () Bool)

(assert (=> b!258184 m!273523))

(declare-fun m!273525 () Bool)

(assert (=> b!258187 m!273525))

(assert (=> b!258025 d!61885))

(declare-fun b!258188 () Bool)

(declare-fun res!126247 () Bool)

(declare-fun e!167364 () Bool)

(assert (=> b!258188 (=> (not res!126247) (not e!167364))))

(declare-fun e!167370 () Bool)

(assert (=> b!258188 (= res!126247 e!167370)))

(declare-fun c!43737 () Bool)

(assert (=> b!258188 (= c!43737 (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!258189 () Bool)

(declare-fun e!167369 () Bool)

(declare-fun e!167367 () Bool)

(assert (=> b!258189 (= e!167369 e!167367)))

(declare-fun res!126253 () Bool)

(declare-fun call!24552 () Bool)

(assert (=> b!258189 (= res!126253 call!24552)))

(assert (=> b!258189 (=> (not res!126253) (not e!167367))))

(declare-fun bm!24548 () Bool)

(declare-fun call!24551 () ListLongMap!3845)

(declare-fun call!24555 () ListLongMap!3845)

(assert (=> bm!24548 (= call!24551 call!24555)))

(declare-fun b!258190 () Bool)

(declare-fun call!24557 () Bool)

(assert (=> b!258190 (= e!167370 (not call!24557))))

(declare-fun b!258191 () Bool)

(declare-fun e!167371 () Bool)

(declare-fun e!167374 () Bool)

(assert (=> b!258191 (= e!167371 e!167374)))

(declare-fun res!126248 () Bool)

(assert (=> b!258191 (=> (not res!126248) (not e!167374))))

(declare-fun lt!129981 () ListLongMap!3845)

(assert (=> b!258191 (= res!126248 (contains!1878 lt!129981 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(assert (=> b!258191 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 lt!129820)))))

(declare-fun d!61887 () Bool)

(assert (=> d!61887 e!167364))

(declare-fun res!126250 () Bool)

(assert (=> d!61887 (=> (not res!126250) (not e!167364))))

(assert (=> d!61887 (= res!126250 (or (bvsge #b00000000000000000000000000000000 (size!6292 lt!129820)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 lt!129820)))))))

(declare-fun lt!129963 () ListLongMap!3845)

(assert (=> d!61887 (= lt!129981 lt!129963)))

(declare-fun lt!129974 () Unit!8017)

(declare-fun e!167373 () Unit!8017)

(assert (=> d!61887 (= lt!129974 e!167373)))

(declare-fun c!43738 () Bool)

(declare-fun e!167365 () Bool)

(assert (=> d!61887 (= c!43738 e!167365)))

(declare-fun res!126246 () Bool)

(assert (=> d!61887 (=> (not res!126246) (not e!167365))))

(assert (=> d!61887 (= res!126246 (bvslt #b00000000000000000000000000000000 (size!6292 lt!129820)))))

(declare-fun e!167368 () ListLongMap!3845)

(assert (=> d!61887 (= lt!129963 e!167368)))

(declare-fun c!43735 () Bool)

(assert (=> d!61887 (= c!43735 (and (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61887 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!61887 (= (getCurrentListMap!1466 lt!129820 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) lt!129981)))

(declare-fun bm!24549 () Bool)

(assert (=> bm!24549 (= call!24557 (contains!1878 lt!129981 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258192 () Bool)

(declare-fun c!43736 () Bool)

(assert (=> b!258192 (= c!43736 (and (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167375 () ListLongMap!3845)

(declare-fun e!167363 () ListLongMap!3845)

(assert (=> b!258192 (= e!167375 e!167363)))

(declare-fun b!258193 () Bool)

(assert (=> b!258193 (= e!167368 (+!692 call!24555 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))

(declare-fun c!43734 () Bool)

(declare-fun call!24554 () ListLongMap!3845)

(declare-fun bm!24550 () Bool)

(declare-fun call!24556 () ListLongMap!3845)

(declare-fun call!24553 () ListLongMap!3845)

(assert (=> bm!24550 (= call!24555 (+!692 (ite c!43735 call!24556 (ite c!43734 call!24554 call!24553)) (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(declare-fun bm!24551 () Bool)

(assert (=> bm!24551 (= call!24552 (contains!1878 lt!129981 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258194 () Bool)

(declare-fun res!126249 () Bool)

(assert (=> b!258194 (=> (not res!126249) (not e!167364))))

(assert (=> b!258194 (= res!126249 e!167371)))

(declare-fun res!126252 () Bool)

(assert (=> b!258194 (=> res!126252 e!167371)))

(declare-fun e!167372 () Bool)

(assert (=> b!258194 (= res!126252 (not e!167372))))

(declare-fun res!126254 () Bool)

(assert (=> b!258194 (=> (not res!126254) (not e!167372))))

(assert (=> b!258194 (= res!126254 (bvslt #b00000000000000000000000000000000 (size!6292 lt!129820)))))

(declare-fun b!258195 () Bool)

(assert (=> b!258195 (= e!167365 (validKeyInArray!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(declare-fun b!258196 () Bool)

(assert (=> b!258196 (= e!167369 (not call!24552))))

(declare-fun b!258197 () Bool)

(declare-fun Unit!8028 () Unit!8017)

(assert (=> b!258197 (= e!167373 Unit!8028)))

(declare-fun bm!24552 () Bool)

(assert (=> bm!24552 (= call!24556 (getCurrentListMapNoExtraKeys!577 lt!129820 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun b!258198 () Bool)

(declare-fun e!167366 () Bool)

(assert (=> b!258198 (= e!167370 e!167366)))

(declare-fun res!126251 () Bool)

(assert (=> b!258198 (= res!126251 call!24557)))

(assert (=> b!258198 (=> (not res!126251) (not e!167366))))

(declare-fun b!258199 () Bool)

(assert (=> b!258199 (= e!167367 (= (apply!255 lt!129981 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4602 thiss!1504)))))

(declare-fun b!258200 () Bool)

(assert (=> b!258200 (= e!167375 call!24551)))

(declare-fun b!258201 () Bool)

(declare-fun lt!129961 () Unit!8017)

(assert (=> b!258201 (= e!167373 lt!129961)))

(declare-fun lt!129969 () ListLongMap!3845)

(assert (=> b!258201 (= lt!129969 (getCurrentListMapNoExtraKeys!577 lt!129820 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!129978 () (_ BitVec 64))

(assert (=> b!258201 (= lt!129978 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129965 () (_ BitVec 64))

(assert (=> b!258201 (= lt!129965 (select (arr!5945 lt!129820) #b00000000000000000000000000000000))))

(declare-fun lt!129979 () Unit!8017)

(assert (=> b!258201 (= lt!129979 (addStillContains!231 lt!129969 lt!129978 (zeroValue!4602 thiss!1504) lt!129965))))

(assert (=> b!258201 (contains!1878 (+!692 lt!129969 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504))) lt!129965)))

(declare-fun lt!129968 () Unit!8017)

(assert (=> b!258201 (= lt!129968 lt!129979)))

(declare-fun lt!129973 () ListLongMap!3845)

(assert (=> b!258201 (= lt!129973 (getCurrentListMapNoExtraKeys!577 lt!129820 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!129970 () (_ BitVec 64))

(assert (=> b!258201 (= lt!129970 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129971 () (_ BitVec 64))

(assert (=> b!258201 (= lt!129971 (select (arr!5945 lt!129820) #b00000000000000000000000000000000))))

(declare-fun lt!129980 () Unit!8017)

(assert (=> b!258201 (= lt!129980 (addApplyDifferent!231 lt!129973 lt!129970 (minValue!4602 thiss!1504) lt!129971))))

(assert (=> b!258201 (= (apply!255 (+!692 lt!129973 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504))) lt!129971) (apply!255 lt!129973 lt!129971))))

(declare-fun lt!129960 () Unit!8017)

(assert (=> b!258201 (= lt!129960 lt!129980)))

(declare-fun lt!129977 () ListLongMap!3845)

(assert (=> b!258201 (= lt!129977 (getCurrentListMapNoExtraKeys!577 lt!129820 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!129966 () (_ BitVec 64))

(assert (=> b!258201 (= lt!129966 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129967 () (_ BitVec 64))

(assert (=> b!258201 (= lt!129967 (select (arr!5945 lt!129820) #b00000000000000000000000000000000))))

(declare-fun lt!129975 () Unit!8017)

(assert (=> b!258201 (= lt!129975 (addApplyDifferent!231 lt!129977 lt!129966 (zeroValue!4602 thiss!1504) lt!129967))))

(assert (=> b!258201 (= (apply!255 (+!692 lt!129977 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504))) lt!129967) (apply!255 lt!129977 lt!129967))))

(declare-fun lt!129972 () Unit!8017)

(assert (=> b!258201 (= lt!129972 lt!129975)))

(declare-fun lt!129962 () ListLongMap!3845)

(assert (=> b!258201 (= lt!129962 (getCurrentListMapNoExtraKeys!577 lt!129820 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!129964 () (_ BitVec 64))

(assert (=> b!258201 (= lt!129964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129976 () (_ BitVec 64))

(assert (=> b!258201 (= lt!129976 (select (arr!5945 lt!129820) #b00000000000000000000000000000000))))

(assert (=> b!258201 (= lt!129961 (addApplyDifferent!231 lt!129962 lt!129964 (minValue!4602 thiss!1504) lt!129976))))

(assert (=> b!258201 (= (apply!255 (+!692 lt!129962 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504))) lt!129976) (apply!255 lt!129962 lt!129976))))

(declare-fun bm!24553 () Bool)

(assert (=> bm!24553 (= call!24553 call!24554)))

(declare-fun b!258202 () Bool)

(assert (=> b!258202 (= e!167363 call!24553)))

(declare-fun b!258203 () Bool)

(assert (=> b!258203 (= e!167374 (= (apply!255 lt!129981 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)) (get!3056 (select (arr!5944 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258203 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6291 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))))))))

(assert (=> b!258203 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 lt!129820)))))

(declare-fun bm!24554 () Bool)

(assert (=> bm!24554 (= call!24554 call!24556)))

(declare-fun b!258204 () Bool)

(assert (=> b!258204 (= e!167368 e!167375)))

(assert (=> b!258204 (= c!43734 (and (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!258205 () Bool)

(assert (=> b!258205 (= e!167372 (validKeyInArray!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(declare-fun b!258206 () Bool)

(assert (=> b!258206 (= e!167363 call!24551)))

(declare-fun b!258207 () Bool)

(assert (=> b!258207 (= e!167366 (= (apply!255 lt!129981 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4602 thiss!1504)))))

(declare-fun b!258208 () Bool)

(assert (=> b!258208 (= e!167364 e!167369)))

(declare-fun c!43733 () Bool)

(assert (=> b!258208 (= c!43733 (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61887 c!43735) b!258193))

(assert (= (and d!61887 (not c!43735)) b!258204))

(assert (= (and b!258204 c!43734) b!258200))

(assert (= (and b!258204 (not c!43734)) b!258192))

(assert (= (and b!258192 c!43736) b!258206))

(assert (= (and b!258192 (not c!43736)) b!258202))

(assert (= (or b!258206 b!258202) bm!24553))

(assert (= (or b!258200 bm!24553) bm!24554))

(assert (= (or b!258200 b!258206) bm!24548))

(assert (= (or b!258193 bm!24554) bm!24552))

(assert (= (or b!258193 bm!24548) bm!24550))

(assert (= (and d!61887 res!126246) b!258195))

(assert (= (and d!61887 c!43738) b!258201))

(assert (= (and d!61887 (not c!43738)) b!258197))

(assert (= (and d!61887 res!126250) b!258194))

(assert (= (and b!258194 res!126254) b!258205))

(assert (= (and b!258194 (not res!126252)) b!258191))

(assert (= (and b!258191 res!126248) b!258203))

(assert (= (and b!258194 res!126249) b!258188))

(assert (= (and b!258188 c!43737) b!258198))

(assert (= (and b!258188 (not c!43737)) b!258190))

(assert (= (and b!258198 res!126251) b!258207))

(assert (= (or b!258198 b!258190) bm!24549))

(assert (= (and b!258188 res!126247) b!258208))

(assert (= (and b!258208 c!43733) b!258189))

(assert (= (and b!258208 (not c!43733)) b!258196))

(assert (= (and b!258189 res!126253) b!258199))

(assert (= (or b!258189 b!258196) bm!24551))

(declare-fun b_lambda!8197 () Bool)

(assert (=> (not b_lambda!8197) (not b!258203)))

(assert (=> b!258203 t!8879))

(declare-fun b_and!13821 () Bool)

(assert (= b_and!13819 (and (=> t!8879 result!5391) b_and!13821)))

(declare-fun m!273527 () Bool)

(assert (=> bm!24551 m!273527))

(declare-fun m!273529 () Bool)

(assert (=> b!258191 m!273529))

(assert (=> b!258191 m!273529))

(declare-fun m!273531 () Bool)

(assert (=> b!258191 m!273531))

(assert (=> b!258205 m!273529))

(assert (=> b!258205 m!273529))

(declare-fun m!273533 () Bool)

(assert (=> b!258205 m!273533))

(declare-fun m!273535 () Bool)

(assert (=> b!258201 m!273535))

(declare-fun m!273537 () Bool)

(assert (=> b!258201 m!273537))

(declare-fun m!273539 () Bool)

(assert (=> b!258201 m!273539))

(declare-fun m!273541 () Bool)

(assert (=> b!258201 m!273541))

(declare-fun m!273543 () Bool)

(assert (=> b!258201 m!273543))

(assert (=> b!258201 m!273535))

(declare-fun m!273545 () Bool)

(assert (=> b!258201 m!273545))

(declare-fun m!273547 () Bool)

(assert (=> b!258201 m!273547))

(declare-fun m!273549 () Bool)

(assert (=> b!258201 m!273549))

(assert (=> b!258201 m!273547))

(declare-fun m!273551 () Bool)

(assert (=> b!258201 m!273551))

(declare-fun m!273553 () Bool)

(assert (=> b!258201 m!273553))

(declare-fun m!273555 () Bool)

(assert (=> b!258201 m!273555))

(declare-fun m!273557 () Bool)

(assert (=> b!258201 m!273557))

(declare-fun m!273559 () Bool)

(assert (=> b!258201 m!273559))

(declare-fun m!273561 () Bool)

(assert (=> b!258201 m!273561))

(assert (=> b!258201 m!273551))

(declare-fun m!273563 () Bool)

(assert (=> b!258201 m!273563))

(declare-fun m!273565 () Bool)

(assert (=> b!258201 m!273565))

(assert (=> b!258201 m!273529))

(assert (=> b!258201 m!273555))

(declare-fun m!273567 () Bool)

(assert (=> bm!24549 m!273567))

(assert (=> bm!24552 m!273565))

(declare-fun m!273569 () Bool)

(assert (=> b!258207 m!273569))

(assert (=> b!258195 m!273529))

(assert (=> b!258195 m!273529))

(assert (=> b!258195 m!273533))

(declare-fun m!273571 () Bool)

(assert (=> b!258199 m!273571))

(declare-fun m!273573 () Bool)

(assert (=> b!258193 m!273573))

(declare-fun m!273575 () Bool)

(assert (=> b!258203 m!273575))

(assert (=> b!258203 m!273505))

(declare-fun m!273577 () Bool)

(assert (=> b!258203 m!273577))

(assert (=> b!258203 m!273529))

(declare-fun m!273579 () Bool)

(assert (=> b!258203 m!273579))

(assert (=> b!258203 m!273575))

(assert (=> b!258203 m!273505))

(assert (=> b!258203 m!273529))

(declare-fun m!273581 () Bool)

(assert (=> bm!24550 m!273581))

(assert (=> d!61887 m!273351))

(assert (=> b!258012 d!61887))

(declare-fun b!258217 () Bool)

(declare-fun res!126263 () Bool)

(declare-fun e!167381 () Bool)

(assert (=> b!258217 (=> (not res!126263) (not e!167381))))

(assert (=> b!258217 (= res!126263 (not (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) index!297))))))

(declare-fun d!61889 () Bool)

(declare-fun e!167380 () Bool)

(assert (=> d!61889 e!167380))

(declare-fun res!126264 () Bool)

(assert (=> d!61889 (=> (not res!126264) (not e!167380))))

(assert (=> d!61889 (= res!126264 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6292 (_keys!6931 thiss!1504)))))))

(declare-fun lt!129984 () Unit!8017)

(declare-fun choose!1 (array!12555 (_ BitVec 32) (_ BitVec 64)) Unit!8017)

(assert (=> d!61889 (= lt!129984 (choose!1 (_keys!6931 thiss!1504) index!297 key!932))))

(assert (=> d!61889 e!167381))

(declare-fun res!126266 () Bool)

(assert (=> d!61889 (=> (not res!126266) (not e!167381))))

(assert (=> d!61889 (= res!126266 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6292 (_keys!6931 thiss!1504)))))))

(assert (=> d!61889 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6931 thiss!1504) index!297 key!932) lt!129984)))

(declare-fun b!258218 () Bool)

(declare-fun res!126265 () Bool)

(assert (=> b!258218 (=> (not res!126265) (not e!167381))))

(assert (=> b!258218 (= res!126265 (validKeyInArray!0 key!932))))

(declare-fun b!258219 () Bool)

(assert (=> b!258219 (= e!167381 (bvslt (size!6292 (_keys!6931 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!258220 () Bool)

(assert (=> b!258220 (= e!167380 (= (arrayCountValidKeys!0 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6931 thiss!1504) #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!61889 res!126266) b!258217))

(assert (= (and b!258217 res!126263) b!258218))

(assert (= (and b!258218 res!126265) b!258219))

(assert (= (and d!61889 res!126264) b!258220))

(declare-fun m!273583 () Bool)

(assert (=> b!258217 m!273583))

(assert (=> b!258217 m!273583))

(declare-fun m!273585 () Bool)

(assert (=> b!258217 m!273585))

(declare-fun m!273587 () Bool)

(assert (=> d!61889 m!273587))

(declare-fun m!273589 () Bool)

(assert (=> b!258218 m!273589))

(assert (=> b!258220 m!273341))

(declare-fun m!273591 () Bool)

(assert (=> b!258220 m!273591))

(assert (=> b!258220 m!273343))

(assert (=> b!258012 d!61889))

(declare-fun d!61891 () Bool)

(declare-fun e!167384 () Bool)

(assert (=> d!61891 e!167384))

(declare-fun res!126271 () Bool)

(assert (=> d!61891 (=> (not res!126271) (not e!167384))))

(declare-fun lt!129996 () ListLongMap!3845)

(assert (=> d!61891 (= res!126271 (contains!1878 lt!129996 (_1!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun lt!129995 () List!3811)

(assert (=> d!61891 (= lt!129996 (ListLongMap!3846 lt!129995))))

(declare-fun lt!129993 () Unit!8017)

(declare-fun lt!129994 () Unit!8017)

(assert (=> d!61891 (= lt!129993 lt!129994)))

(assert (=> d!61891 (= (getValueByKey!313 lt!129995 (_1!2477 (tuple2!4933 key!932 v!346))) (Some!318 (_2!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!169 (List!3811 (_ BitVec 64) V!8451) Unit!8017)

(assert (=> d!61891 (= lt!129994 (lemmaContainsTupThenGetReturnValue!169 lt!129995 (_1!2477 (tuple2!4933 key!932 v!346)) (_2!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun insertStrictlySorted!172 (List!3811 (_ BitVec 64) V!8451) List!3811)

(assert (=> d!61891 (= lt!129995 (insertStrictlySorted!172 (toList!1938 lt!129825) (_1!2477 (tuple2!4933 key!932 v!346)) (_2!2477 (tuple2!4933 key!932 v!346))))))

(assert (=> d!61891 (= (+!692 lt!129825 (tuple2!4933 key!932 v!346)) lt!129996)))

(declare-fun b!258225 () Bool)

(declare-fun res!126272 () Bool)

(assert (=> b!258225 (=> (not res!126272) (not e!167384))))

(assert (=> b!258225 (= res!126272 (= (getValueByKey!313 (toList!1938 lt!129996) (_1!2477 (tuple2!4933 key!932 v!346))) (Some!318 (_2!2477 (tuple2!4933 key!932 v!346)))))))

(declare-fun b!258226 () Bool)

(declare-fun contains!1880 (List!3811 tuple2!4932) Bool)

(assert (=> b!258226 (= e!167384 (contains!1880 (toList!1938 lt!129996) (tuple2!4933 key!932 v!346)))))

(assert (= (and d!61891 res!126271) b!258225))

(assert (= (and b!258225 res!126272) b!258226))

(declare-fun m!273593 () Bool)

(assert (=> d!61891 m!273593))

(declare-fun m!273595 () Bool)

(assert (=> d!61891 m!273595))

(declare-fun m!273597 () Bool)

(assert (=> d!61891 m!273597))

(declare-fun m!273599 () Bool)

(assert (=> d!61891 m!273599))

(declare-fun m!273601 () Bool)

(assert (=> b!258225 m!273601))

(declare-fun m!273603 () Bool)

(assert (=> b!258226 m!273603))

(assert (=> b!258012 d!61891))

(declare-fun b!258235 () Bool)

(declare-fun e!167390 () (_ BitVec 32))

(declare-fun e!167389 () (_ BitVec 32))

(assert (=> b!258235 (= e!167390 e!167389)))

(declare-fun c!43744 () Bool)

(assert (=> b!258235 (= c!43744 (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258236 () Bool)

(declare-fun call!24560 () (_ BitVec 32))

(assert (=> b!258236 (= e!167389 call!24560)))

(declare-fun bm!24557 () Bool)

(assert (=> bm!24557 (= call!24560 (arrayCountValidKeys!0 (_keys!6931 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun b!258237 () Bool)

(assert (=> b!258237 (= e!167390 #b00000000000000000000000000000000)))

(declare-fun b!258238 () Bool)

(assert (=> b!258238 (= e!167389 (bvadd #b00000000000000000000000000000001 call!24560))))

(declare-fun d!61893 () Bool)

(declare-fun lt!129999 () (_ BitVec 32))

(assert (=> d!61893 (and (bvsge lt!129999 #b00000000000000000000000000000000) (bvsle lt!129999 (bvsub (size!6292 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61893 (= lt!129999 e!167390)))

(declare-fun c!43743 () Bool)

(assert (=> d!61893 (= c!43743 (bvsge #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> d!61893 (and (bvsle #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6292 (_keys!6931 thiss!1504)) (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> d!61893 (= (arrayCountValidKeys!0 (_keys!6931 thiss!1504) #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) lt!129999)))

(assert (= (and d!61893 c!43743) b!258237))

(assert (= (and d!61893 (not c!43743)) b!258235))

(assert (= (and b!258235 c!43744) b!258238))

(assert (= (and b!258235 (not c!43744)) b!258236))

(assert (= (or b!258238 b!258236) bm!24557))

(assert (=> b!258235 m!273457))

(assert (=> b!258235 m!273457))

(assert (=> b!258235 m!273461))

(declare-fun m!273605 () Bool)

(assert (=> bm!24557 m!273605))

(assert (=> b!258012 d!61893))

(declare-fun d!61895 () Bool)

(declare-fun e!167393 () Bool)

(assert (=> d!61895 e!167393))

(declare-fun res!126275 () Bool)

(assert (=> d!61895 (=> (not res!126275) (not e!167393))))

(assert (=> d!61895 (= res!126275 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6292 (_keys!6931 thiss!1504))) (bvslt index!297 (size!6291 (_values!4744 thiss!1504)))))))

(declare-fun lt!130002 () Unit!8017)

(declare-fun choose!1244 (array!12555 array!12553 (_ BitVec 32) (_ BitVec 32) V!8451 V!8451 (_ BitVec 32) (_ BitVec 64) V!8451 Int) Unit!8017)

(assert (=> d!61895 (= lt!130002 (choose!1244 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) index!297 key!932 v!346 (defaultEntry!4761 thiss!1504)))))

(assert (=> d!61895 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!61895 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!102 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) index!297 key!932 v!346 (defaultEntry!4761 thiss!1504)) lt!130002)))

(declare-fun b!258241 () Bool)

(assert (=> b!258241 (= e!167393 (= (+!692 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) (tuple2!4933 key!932 v!346)) (getCurrentListMap!1466 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504))))))

(assert (= (and d!61895 res!126275) b!258241))

(declare-fun m!273607 () Bool)

(assert (=> d!61895 m!273607))

(assert (=> d!61895 m!273351))

(assert (=> b!258241 m!273327))

(assert (=> b!258241 m!273375))

(declare-fun m!273609 () Bool)

(assert (=> b!258241 m!273609))

(declare-fun m!273611 () Bool)

(assert (=> b!258241 m!273611))

(assert (=> b!258241 m!273375))

(assert (=> b!258241 m!273341))

(assert (=> b!258012 d!61895))

(declare-fun d!61897 () Bool)

(assert (=> d!61897 (= (validMask!0 (mask!11058 thiss!1504)) (and (or (= (mask!11058 thiss!1504) #b00000000000000000000000000000111) (= (mask!11058 thiss!1504) #b00000000000000000000000000001111) (= (mask!11058 thiss!1504) #b00000000000000000000000000011111) (= (mask!11058 thiss!1504) #b00000000000000000000000000111111) (= (mask!11058 thiss!1504) #b00000000000000000000000001111111) (= (mask!11058 thiss!1504) #b00000000000000000000000011111111) (= (mask!11058 thiss!1504) #b00000000000000000000000111111111) (= (mask!11058 thiss!1504) #b00000000000000000000001111111111) (= (mask!11058 thiss!1504) #b00000000000000000000011111111111) (= (mask!11058 thiss!1504) #b00000000000000000000111111111111) (= (mask!11058 thiss!1504) #b00000000000000000001111111111111) (= (mask!11058 thiss!1504) #b00000000000000000011111111111111) (= (mask!11058 thiss!1504) #b00000000000000000111111111111111) (= (mask!11058 thiss!1504) #b00000000000000001111111111111111) (= (mask!11058 thiss!1504) #b00000000000000011111111111111111) (= (mask!11058 thiss!1504) #b00000000000000111111111111111111) (= (mask!11058 thiss!1504) #b00000000000001111111111111111111) (= (mask!11058 thiss!1504) #b00000000000011111111111111111111) (= (mask!11058 thiss!1504) #b00000000000111111111111111111111) (= (mask!11058 thiss!1504) #b00000000001111111111111111111111) (= (mask!11058 thiss!1504) #b00000000011111111111111111111111) (= (mask!11058 thiss!1504) #b00000000111111111111111111111111) (= (mask!11058 thiss!1504) #b00000001111111111111111111111111) (= (mask!11058 thiss!1504) #b00000011111111111111111111111111) (= (mask!11058 thiss!1504) #b00000111111111111111111111111111) (= (mask!11058 thiss!1504) #b00001111111111111111111111111111) (= (mask!11058 thiss!1504) #b00011111111111111111111111111111) (= (mask!11058 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11058 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!258012 d!61897))

(declare-fun d!61899 () Bool)

(assert (=> d!61899 (arrayContainsKey!0 lt!129820 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130005 () Unit!8017)

(declare-fun choose!13 (array!12555 (_ BitVec 64) (_ BitVec 32)) Unit!8017)

(assert (=> d!61899 (= lt!130005 (choose!13 lt!129820 key!932 index!297))))

(assert (=> d!61899 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61899 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129820 key!932 index!297) lt!130005)))

(declare-fun bs!9090 () Bool)

(assert (= bs!9090 d!61899))

(assert (=> bs!9090 m!273353))

(declare-fun m!273613 () Bool)

(assert (=> bs!9090 m!273613))

(assert (=> b!258012 d!61899))

(declare-fun d!61901 () Bool)

(declare-fun res!126280 () Bool)

(declare-fun e!167398 () Bool)

(assert (=> d!61901 (=> res!126280 e!167398)))

(assert (=> d!61901 (= res!126280 (= (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61901 (= (arrayContainsKey!0 (_keys!6931 thiss!1504) key!932 #b00000000000000000000000000000000) e!167398)))

(declare-fun b!258246 () Bool)

(declare-fun e!167399 () Bool)

(assert (=> b!258246 (= e!167398 e!167399)))

(declare-fun res!126281 () Bool)

(assert (=> b!258246 (=> (not res!126281) (not e!167399))))

(assert (=> b!258246 (= res!126281 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun b!258247 () Bool)

(assert (=> b!258247 (= e!167399 (arrayContainsKey!0 (_keys!6931 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61901 (not res!126280)) b!258246))

(assert (= (and b!258246 res!126281) b!258247))

(assert (=> d!61901 m!273457))

(declare-fun m!273615 () Bool)

(assert (=> b!258247 m!273615))

(assert (=> b!258012 d!61901))

(declare-fun d!61903 () Bool)

(declare-fun e!167402 () Bool)

(assert (=> d!61903 e!167402))

(declare-fun res!126284 () Bool)

(assert (=> d!61903 (=> (not res!126284) (not e!167402))))

(assert (=> d!61903 (= res!126284 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6292 (_keys!6931 thiss!1504)))))))

(declare-fun lt!130008 () Unit!8017)

(declare-fun choose!102 ((_ BitVec 64) array!12555 (_ BitVec 32) (_ BitVec 32)) Unit!8017)

(assert (=> d!61903 (= lt!130008 (choose!102 key!932 (_keys!6931 thiss!1504) index!297 (mask!11058 thiss!1504)))))

(assert (=> d!61903 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!61903 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6931 thiss!1504) index!297 (mask!11058 thiss!1504)) lt!130008)))

(declare-fun b!258250 () Bool)

(assert (=> b!258250 (= e!167402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (mask!11058 thiss!1504)))))

(assert (= (and d!61903 res!126284) b!258250))

(declare-fun m!273617 () Bool)

(assert (=> d!61903 m!273617))

(assert (=> d!61903 m!273351))

(assert (=> b!258250 m!273341))

(declare-fun m!273619 () Bool)

(assert (=> b!258250 m!273619))

(assert (=> b!258012 d!61903))

(declare-fun b!258261 () Bool)

(declare-fun e!167411 () Bool)

(declare-fun contains!1881 (List!3812 (_ BitVec 64)) Bool)

(assert (=> b!258261 (= e!167411 (contains!1881 Nil!3809 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(declare-fun d!61905 () Bool)

(declare-fun res!126291 () Bool)

(declare-fun e!167414 () Bool)

(assert (=> d!61905 (=> res!126291 e!167414)))

(assert (=> d!61905 (= res!126291 (bvsge #b00000000000000000000000000000000 (size!6292 lt!129820)))))

(assert (=> d!61905 (= (arrayNoDuplicates!0 lt!129820 #b00000000000000000000000000000000 Nil!3809) e!167414)))

(declare-fun b!258262 () Bool)

(declare-fun e!167413 () Bool)

(declare-fun e!167412 () Bool)

(assert (=> b!258262 (= e!167413 e!167412)))

(declare-fun c!43747 () Bool)

(assert (=> b!258262 (= c!43747 (validKeyInArray!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(declare-fun b!258263 () Bool)

(assert (=> b!258263 (= e!167414 e!167413)))

(declare-fun res!126292 () Bool)

(assert (=> b!258263 (=> (not res!126292) (not e!167413))))

(assert (=> b!258263 (= res!126292 (not e!167411))))

(declare-fun res!126293 () Bool)

(assert (=> b!258263 (=> (not res!126293) (not e!167411))))

(assert (=> b!258263 (= res!126293 (validKeyInArray!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(declare-fun b!258264 () Bool)

(declare-fun call!24563 () Bool)

(assert (=> b!258264 (= e!167412 call!24563)))

(declare-fun bm!24560 () Bool)

(assert (=> bm!24560 (= call!24563 (arrayNoDuplicates!0 lt!129820 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43747 (Cons!3808 (select (arr!5945 lt!129820) #b00000000000000000000000000000000) Nil!3809) Nil!3809)))))

(declare-fun b!258265 () Bool)

(assert (=> b!258265 (= e!167412 call!24563)))

(assert (= (and d!61905 (not res!126291)) b!258263))

(assert (= (and b!258263 res!126293) b!258261))

(assert (= (and b!258263 res!126292) b!258262))

(assert (= (and b!258262 c!43747) b!258265))

(assert (= (and b!258262 (not c!43747)) b!258264))

(assert (= (or b!258265 b!258264) bm!24560))

(assert (=> b!258261 m!273529))

(assert (=> b!258261 m!273529))

(declare-fun m!273621 () Bool)

(assert (=> b!258261 m!273621))

(assert (=> b!258262 m!273529))

(assert (=> b!258262 m!273529))

(assert (=> b!258262 m!273533))

(assert (=> b!258263 m!273529))

(assert (=> b!258263 m!273529))

(assert (=> b!258263 m!273533))

(assert (=> bm!24560 m!273529))

(declare-fun m!273623 () Bool)

(assert (=> bm!24560 m!273623))

(assert (=> b!258012 d!61905))

(declare-fun d!61907 () Bool)

(assert (=> d!61907 (= (arrayCountValidKeys!0 lt!129820 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!130011 () Unit!8017)

(declare-fun choose!2 (array!12555 (_ BitVec 32)) Unit!8017)

(assert (=> d!61907 (= lt!130011 (choose!2 lt!129820 index!297))))

(declare-fun e!167417 () Bool)

(assert (=> d!61907 e!167417))

(declare-fun res!126298 () Bool)

(assert (=> d!61907 (=> (not res!126298) (not e!167417))))

(assert (=> d!61907 (= res!126298 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6292 lt!129820))))))

(assert (=> d!61907 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129820 index!297) lt!130011)))

(declare-fun b!258270 () Bool)

(declare-fun res!126299 () Bool)

(assert (=> b!258270 (=> (not res!126299) (not e!167417))))

(assert (=> b!258270 (= res!126299 (validKeyInArray!0 (select (arr!5945 lt!129820) index!297)))))

(declare-fun b!258271 () Bool)

(assert (=> b!258271 (= e!167417 (bvslt (size!6292 lt!129820) #b01111111111111111111111111111111))))

(assert (= (and d!61907 res!126298) b!258270))

(assert (= (and b!258270 res!126299) b!258271))

(declare-fun m!273625 () Bool)

(assert (=> d!61907 m!273625))

(declare-fun m!273627 () Bool)

(assert (=> d!61907 m!273627))

(declare-fun m!273629 () Bool)

(assert (=> b!258270 m!273629))

(assert (=> b!258270 m!273629))

(declare-fun m!273631 () Bool)

(assert (=> b!258270 m!273631))

(assert (=> b!258012 d!61907))

(declare-fun b!258272 () Bool)

(declare-fun e!167419 () (_ BitVec 32))

(declare-fun e!167418 () (_ BitVec 32))

(assert (=> b!258272 (= e!167419 e!167418)))

(declare-fun c!43749 () Bool)

(assert (=> b!258272 (= c!43749 (validKeyInArray!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(declare-fun b!258273 () Bool)

(declare-fun call!24564 () (_ BitVec 32))

(assert (=> b!258273 (= e!167418 call!24564)))

(declare-fun bm!24561 () Bool)

(assert (=> bm!24561 (= call!24564 (arrayCountValidKeys!0 lt!129820 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun b!258274 () Bool)

(assert (=> b!258274 (= e!167419 #b00000000000000000000000000000000)))

(declare-fun b!258275 () Bool)

(assert (=> b!258275 (= e!167418 (bvadd #b00000000000000000000000000000001 call!24564))))

(declare-fun d!61909 () Bool)

(declare-fun lt!130012 () (_ BitVec 32))

(assert (=> d!61909 (and (bvsge lt!130012 #b00000000000000000000000000000000) (bvsle lt!130012 (bvsub (size!6292 lt!129820) #b00000000000000000000000000000000)))))

(assert (=> d!61909 (= lt!130012 e!167419)))

(declare-fun c!43748 () Bool)

(assert (=> d!61909 (= c!43748 (bvsge #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> d!61909 (and (bvsle #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6292 (_keys!6931 thiss!1504)) (size!6292 lt!129820)))))

(assert (=> d!61909 (= (arrayCountValidKeys!0 lt!129820 #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) lt!130012)))

(assert (= (and d!61909 c!43748) b!258274))

(assert (= (and d!61909 (not c!43748)) b!258272))

(assert (= (and b!258272 c!43749) b!258275))

(assert (= (and b!258272 (not c!43749)) b!258273))

(assert (= (or b!258275 b!258273) bm!24561))

(assert (=> b!258272 m!273529))

(assert (=> b!258272 m!273529))

(assert (=> b!258272 m!273533))

(declare-fun m!273633 () Bool)

(assert (=> bm!24561 m!273633))

(assert (=> b!258012 d!61909))

(declare-fun b!258276 () Bool)

(declare-fun e!167421 () (_ BitVec 32))

(declare-fun e!167420 () (_ BitVec 32))

(assert (=> b!258276 (= e!167421 e!167420)))

(declare-fun c!43751 () Bool)

(assert (=> b!258276 (= c!43751 (validKeyInArray!0 (select (arr!5945 lt!129820) index!297)))))

(declare-fun b!258277 () Bool)

(declare-fun call!24565 () (_ BitVec 32))

(assert (=> b!258277 (= e!167420 call!24565)))

(declare-fun bm!24562 () Bool)

(assert (=> bm!24562 (= call!24565 (arrayCountValidKeys!0 lt!129820 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!258278 () Bool)

(assert (=> b!258278 (= e!167421 #b00000000000000000000000000000000)))

(declare-fun b!258279 () Bool)

(assert (=> b!258279 (= e!167420 (bvadd #b00000000000000000000000000000001 call!24565))))

(declare-fun d!61911 () Bool)

(declare-fun lt!130013 () (_ BitVec 32))

(assert (=> d!61911 (and (bvsge lt!130013 #b00000000000000000000000000000000) (bvsle lt!130013 (bvsub (size!6292 lt!129820) index!297)))))

(assert (=> d!61911 (= lt!130013 e!167421)))

(declare-fun c!43750 () Bool)

(assert (=> d!61911 (= c!43750 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!61911 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6292 lt!129820)))))

(assert (=> d!61911 (= (arrayCountValidKeys!0 lt!129820 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!130013)))

(assert (= (and d!61911 c!43750) b!258278))

(assert (= (and d!61911 (not c!43750)) b!258276))

(assert (= (and b!258276 c!43751) b!258279))

(assert (= (and b!258276 (not c!43751)) b!258277))

(assert (= (or b!258279 b!258277) bm!24562))

(assert (=> b!258276 m!273629))

(assert (=> b!258276 m!273629))

(assert (=> b!258276 m!273631))

(declare-fun m!273635 () Bool)

(assert (=> bm!24562 m!273635))

(assert (=> b!258012 d!61911))

(declare-fun b!258288 () Bool)

(declare-fun e!167428 () Bool)

(declare-fun call!24568 () Bool)

(assert (=> b!258288 (= e!167428 call!24568)))

(declare-fun d!61913 () Bool)

(declare-fun res!126305 () Bool)

(declare-fun e!167430 () Bool)

(assert (=> d!61913 (=> res!126305 e!167430)))

(assert (=> d!61913 (= res!126305 (bvsge #b00000000000000000000000000000000 (size!6292 lt!129820)))))

(assert (=> d!61913 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129820 (mask!11058 thiss!1504)) e!167430)))

(declare-fun bm!24565 () Bool)

(assert (=> bm!24565 (= call!24568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129820 (mask!11058 thiss!1504)))))

(declare-fun b!258289 () Bool)

(declare-fun e!167429 () Bool)

(assert (=> b!258289 (= e!167428 e!167429)))

(declare-fun lt!130021 () (_ BitVec 64))

(assert (=> b!258289 (= lt!130021 (select (arr!5945 lt!129820) #b00000000000000000000000000000000))))

(declare-fun lt!130022 () Unit!8017)

(assert (=> b!258289 (= lt!130022 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129820 lt!130021 #b00000000000000000000000000000000))))

(assert (=> b!258289 (arrayContainsKey!0 lt!129820 lt!130021 #b00000000000000000000000000000000)))

(declare-fun lt!130020 () Unit!8017)

(assert (=> b!258289 (= lt!130020 lt!130022)))

(declare-fun res!126304 () Bool)

(assert (=> b!258289 (= res!126304 (= (seekEntryOrOpen!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000) lt!129820 (mask!11058 thiss!1504)) (Found!1174 #b00000000000000000000000000000000)))))

(assert (=> b!258289 (=> (not res!126304) (not e!167429))))

(declare-fun b!258290 () Bool)

(assert (=> b!258290 (= e!167430 e!167428)))

(declare-fun c!43754 () Bool)

(assert (=> b!258290 (= c!43754 (validKeyInArray!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(declare-fun b!258291 () Bool)

(assert (=> b!258291 (= e!167429 call!24568)))

(assert (= (and d!61913 (not res!126305)) b!258290))

(assert (= (and b!258290 c!43754) b!258289))

(assert (= (and b!258290 (not c!43754)) b!258288))

(assert (= (and b!258289 res!126304) b!258291))

(assert (= (or b!258291 b!258288) bm!24565))

(declare-fun m!273637 () Bool)

(assert (=> bm!24565 m!273637))

(assert (=> b!258289 m!273529))

(declare-fun m!273639 () Bool)

(assert (=> b!258289 m!273639))

(declare-fun m!273641 () Bool)

(assert (=> b!258289 m!273641))

(assert (=> b!258289 m!273529))

(declare-fun m!273643 () Bool)

(assert (=> b!258289 m!273643))

(assert (=> b!258290 m!273529))

(assert (=> b!258290 m!273529))

(assert (=> b!258290 m!273533))

(assert (=> b!258012 d!61913))

(declare-fun d!61915 () Bool)

(declare-fun e!167433 () Bool)

(assert (=> d!61915 e!167433))

(declare-fun res!126308 () Bool)

(assert (=> d!61915 (=> (not res!126308) (not e!167433))))

(assert (=> d!61915 (= res!126308 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6292 (_keys!6931 thiss!1504)))))))

(declare-fun lt!130025 () Unit!8017)

(declare-fun choose!41 (array!12555 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3812) Unit!8017)

(assert (=> d!61915 (= lt!130025 (choose!41 (_keys!6931 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3809))))

(assert (=> d!61915 (bvslt (size!6292 (_keys!6931 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61915 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6931 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3809) lt!130025)))

(declare-fun b!258294 () Bool)

(assert (=> b!258294 (= e!167433 (arrayNoDuplicates!0 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) #b00000000000000000000000000000000 Nil!3809))))

(assert (= (and d!61915 res!126308) b!258294))

(declare-fun m!273645 () Bool)

(assert (=> d!61915 m!273645))

(assert (=> b!258294 m!273341))

(declare-fun m!273647 () Bool)

(assert (=> b!258294 m!273647))

(assert (=> b!258012 d!61915))

(declare-fun d!61917 () Bool)

(declare-fun res!126309 () Bool)

(declare-fun e!167434 () Bool)

(assert (=> d!61917 (=> res!126309 e!167434)))

(assert (=> d!61917 (= res!126309 (= (select (arr!5945 lt!129820) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61917 (= (arrayContainsKey!0 lt!129820 key!932 #b00000000000000000000000000000000) e!167434)))

(declare-fun b!258295 () Bool)

(declare-fun e!167435 () Bool)

(assert (=> b!258295 (= e!167434 e!167435)))

(declare-fun res!126310 () Bool)

(assert (=> b!258295 (=> (not res!126310) (not e!167435))))

(assert (=> b!258295 (= res!126310 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 lt!129820)))))

(declare-fun b!258296 () Bool)

(assert (=> b!258296 (= e!167435 (arrayContainsKey!0 lt!129820 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61917 (not res!126309)) b!258295))

(assert (= (and b!258295 res!126310) b!258296))

(assert (=> d!61917 m!273529))

(declare-fun m!273649 () Bool)

(assert (=> b!258296 m!273649))

(assert (=> b!258012 d!61917))

(declare-fun call!24573 () Bool)

(declare-fun lt!130031 () SeekEntryResult!1174)

(declare-fun bm!24570 () Bool)

(declare-fun c!43760 () Bool)

(assert (=> bm!24570 (= call!24573 (inRange!0 (ite c!43760 (index!6866 lt!130031) (index!6869 lt!130031)) (mask!11058 thiss!1504)))))

(declare-fun b!258313 () Bool)

(declare-fun e!167444 () Bool)

(declare-fun e!167445 () Bool)

(assert (=> b!258313 (= e!167444 e!167445)))

(declare-fun c!43759 () Bool)

(assert (=> b!258313 (= c!43759 ((_ is MissingVacant!1174) lt!130031))))

(declare-fun b!258314 () Bool)

(declare-fun e!167446 () Bool)

(declare-fun call!24574 () Bool)

(assert (=> b!258314 (= e!167446 (not call!24574))))

(declare-fun b!258315 () Bool)

(declare-fun e!167447 () Bool)

(assert (=> b!258315 (= e!167444 e!167447)))

(declare-fun res!126321 () Bool)

(assert (=> b!258315 (= res!126321 call!24573)))

(assert (=> b!258315 (=> (not res!126321) (not e!167447))))

(declare-fun b!258316 () Bool)

(assert (=> b!258316 (= e!167445 ((_ is Undefined!1174) lt!130031))))

(declare-fun b!258317 () Bool)

(declare-fun res!126322 () Bool)

(assert (=> b!258317 (=> (not res!126322) (not e!167446))))

(assert (=> b!258317 (= res!126322 call!24573)))

(assert (=> b!258317 (= e!167445 e!167446)))

(declare-fun d!61919 () Bool)

(assert (=> d!61919 e!167444))

(assert (=> d!61919 (= c!43760 ((_ is MissingZero!1174) lt!130031))))

(assert (=> d!61919 (= lt!130031 (seekEntryOrOpen!0 key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)))))

(declare-fun lt!130030 () Unit!8017)

(declare-fun choose!1245 (array!12555 array!12553 (_ BitVec 32) (_ BitVec 32) V!8451 V!8451 (_ BitVec 64) Int) Unit!8017)

(assert (=> d!61919 (= lt!130030 (choose!1245 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 (defaultEntry!4761 thiss!1504)))))

(assert (=> d!61919 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!61919 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!439 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 (defaultEntry!4761 thiss!1504)) lt!130030)))

(declare-fun b!258318 () Bool)

(declare-fun res!126319 () Bool)

(assert (=> b!258318 (=> (not res!126319) (not e!167446))))

(assert (=> b!258318 (= res!126319 (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6869 lt!130031)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258318 (and (bvsge (index!6869 lt!130031) #b00000000000000000000000000000000) (bvslt (index!6869 lt!130031) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun b!258319 () Bool)

(assert (=> b!258319 (and (bvsge (index!6866 lt!130031) #b00000000000000000000000000000000) (bvslt (index!6866 lt!130031) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun res!126320 () Bool)

(assert (=> b!258319 (= res!126320 (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6866 lt!130031)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258319 (=> (not res!126320) (not e!167447))))

(declare-fun bm!24571 () Bool)

(assert (=> bm!24571 (= call!24574 (arrayContainsKey!0 (_keys!6931 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258320 () Bool)

(assert (=> b!258320 (= e!167447 (not call!24574))))

(assert (= (and d!61919 c!43760) b!258315))

(assert (= (and d!61919 (not c!43760)) b!258313))

(assert (= (and b!258315 res!126321) b!258319))

(assert (= (and b!258319 res!126320) b!258320))

(assert (= (and b!258313 c!43759) b!258317))

(assert (= (and b!258313 (not c!43759)) b!258316))

(assert (= (and b!258317 res!126322) b!258318))

(assert (= (and b!258318 res!126319) b!258314))

(assert (= (or b!258315 b!258317) bm!24570))

(assert (= (or b!258320 b!258314) bm!24571))

(declare-fun m!273651 () Bool)

(assert (=> b!258318 m!273651))

(assert (=> d!61919 m!273367))

(declare-fun m!273653 () Bool)

(assert (=> d!61919 m!273653))

(assert (=> d!61919 m!273351))

(declare-fun m!273655 () Bool)

(assert (=> b!258319 m!273655))

(assert (=> bm!24571 m!273325))

(declare-fun m!273657 () Bool)

(assert (=> bm!24570 m!273657))

(assert (=> b!258026 d!61919))

(declare-fun d!61921 () Bool)

(assert (=> d!61921 (= (inRange!0 (ite c!43687 (index!6866 lt!129828) (index!6869 lt!129828)) (mask!11058 thiss!1504)) (and (bvsge (ite c!43687 (index!6866 lt!129828) (index!6869 lt!129828)) #b00000000000000000000000000000000) (bvslt (ite c!43687 (index!6866 lt!129828) (index!6869 lt!129828)) (bvadd (mask!11058 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24519 d!61921))

(declare-fun d!61923 () Bool)

(assert (=> d!61923 (contains!1878 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) key!932)))

(declare-fun lt!130034 () Unit!8017)

(declare-fun choose!1246 (array!12555 array!12553 (_ BitVec 32) (_ BitVec 32) V!8451 V!8451 (_ BitVec 64) (_ BitVec 32) Int) Unit!8017)

(assert (=> d!61923 (= lt!130034 (choose!1246 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(assert (=> d!61923 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!61923 (= (lemmaArrayContainsKeyThenInListMap!243 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) lt!130034)))

(declare-fun bs!9091 () Bool)

(assert (= bs!9091 d!61923))

(assert (=> bs!9091 m!273375))

(assert (=> bs!9091 m!273375))

(declare-fun m!273659 () Bool)

(assert (=> bs!9091 m!273659))

(declare-fun m!273661 () Bool)

(assert (=> bs!9091 m!273661))

(assert (=> bs!9091 m!273351))

(assert (=> b!258016 d!61923))

(declare-fun d!61925 () Bool)

(declare-fun res!126329 () Bool)

(declare-fun e!167450 () Bool)

(assert (=> d!61925 (=> (not res!126329) (not e!167450))))

(declare-fun simpleValid!278 (LongMapFixedSize!3816) Bool)

(assert (=> d!61925 (= res!126329 (simpleValid!278 thiss!1504))))

(assert (=> d!61925 (= (valid!1490 thiss!1504) e!167450)))

(declare-fun b!258327 () Bool)

(declare-fun res!126330 () Bool)

(assert (=> b!258327 (=> (not res!126330) (not e!167450))))

(assert (=> b!258327 (= res!126330 (= (arrayCountValidKeys!0 (_keys!6931 thiss!1504) #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) (_size!1957 thiss!1504)))))

(declare-fun b!258328 () Bool)

(declare-fun res!126331 () Bool)

(assert (=> b!258328 (=> (not res!126331) (not e!167450))))

(assert (=> b!258328 (= res!126331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)))))

(declare-fun b!258329 () Bool)

(assert (=> b!258329 (= e!167450 (arrayNoDuplicates!0 (_keys!6931 thiss!1504) #b00000000000000000000000000000000 Nil!3809))))

(assert (= (and d!61925 res!126329) b!258327))

(assert (= (and b!258327 res!126330) b!258328))

(assert (= (and b!258328 res!126331) b!258329))

(declare-fun m!273663 () Bool)

(assert (=> d!61925 m!273663))

(assert (=> b!258327 m!273343))

(declare-fun m!273665 () Bool)

(assert (=> b!258328 m!273665))

(declare-fun m!273667 () Bool)

(assert (=> b!258329 m!273667))

(assert (=> start!24658 d!61925))

(declare-fun d!61927 () Bool)

(declare-fun e!167453 () Bool)

(assert (=> d!61927 e!167453))

(declare-fun res!126336 () Bool)

(assert (=> d!61927 (=> (not res!126336) (not e!167453))))

(declare-fun lt!130040 () SeekEntryResult!1174)

(assert (=> d!61927 (= res!126336 ((_ is Found!1174) lt!130040))))

(assert (=> d!61927 (= lt!130040 (seekEntryOrOpen!0 key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)))))

(declare-fun lt!130039 () Unit!8017)

(declare-fun choose!1247 (array!12555 array!12553 (_ BitVec 32) (_ BitVec 32) V!8451 V!8451 (_ BitVec 64) Int) Unit!8017)

(assert (=> d!61927 (= lt!130039 (choose!1247 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 (defaultEntry!4761 thiss!1504)))))

(assert (=> d!61927 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!61927 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!436 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 (defaultEntry!4761 thiss!1504)) lt!130039)))

(declare-fun b!258334 () Bool)

(declare-fun res!126337 () Bool)

(assert (=> b!258334 (=> (not res!126337) (not e!167453))))

(assert (=> b!258334 (= res!126337 (inRange!0 (index!6867 lt!130040) (mask!11058 thiss!1504)))))

(declare-fun b!258335 () Bool)

(assert (=> b!258335 (= e!167453 (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6867 lt!130040)) key!932))))

(assert (=> b!258335 (and (bvsge (index!6867 lt!130040) #b00000000000000000000000000000000) (bvslt (index!6867 lt!130040) (size!6292 (_keys!6931 thiss!1504))))))

(assert (= (and d!61927 res!126336) b!258334))

(assert (= (and b!258334 res!126337) b!258335))

(assert (=> d!61927 m!273367))

(declare-fun m!273669 () Bool)

(assert (=> d!61927 m!273669))

(assert (=> d!61927 m!273351))

(declare-fun m!273671 () Bool)

(assert (=> b!258334 m!273671))

(declare-fun m!273673 () Bool)

(assert (=> b!258335 m!273673))

(assert (=> b!258014 d!61927))

(assert (=> bm!24520 d!61901))

(declare-fun d!61929 () Bool)

(assert (=> d!61929 (= (array_inv!3929 (_keys!6931 thiss!1504)) (bvsge (size!6292 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258023 d!61929))

(declare-fun d!61931 () Bool)

(assert (=> d!61931 (= (array_inv!3930 (_values!4744 thiss!1504)) (bvsge (size!6291 (_values!4744 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258023 d!61931))

(declare-fun condMapEmpty!11250 () Bool)

(declare-fun mapDefault!11250 () ValueCell!2958)

(assert (=> mapNonEmpty!11244 (= condMapEmpty!11250 (= mapRest!11244 ((as const (Array (_ BitVec 32) ValueCell!2958)) mapDefault!11250)))))

(declare-fun e!167458 () Bool)

(declare-fun mapRes!11250 () Bool)

(assert (=> mapNonEmpty!11244 (= tp!23535 (and e!167458 mapRes!11250))))

(declare-fun b!258343 () Bool)

(assert (=> b!258343 (= e!167458 tp_is_empty!6603)))

(declare-fun mapNonEmpty!11250 () Bool)

(declare-fun tp!23544 () Bool)

(declare-fun e!167459 () Bool)

(assert (=> mapNonEmpty!11250 (= mapRes!11250 (and tp!23544 e!167459))))

(declare-fun mapRest!11250 () (Array (_ BitVec 32) ValueCell!2958))

(declare-fun mapValue!11250 () ValueCell!2958)

(declare-fun mapKey!11250 () (_ BitVec 32))

(assert (=> mapNonEmpty!11250 (= mapRest!11244 (store mapRest!11250 mapKey!11250 mapValue!11250))))

(declare-fun mapIsEmpty!11250 () Bool)

(assert (=> mapIsEmpty!11250 mapRes!11250))

(declare-fun b!258342 () Bool)

(assert (=> b!258342 (= e!167459 tp_is_empty!6603)))

(assert (= (and mapNonEmpty!11244 condMapEmpty!11250) mapIsEmpty!11250))

(assert (= (and mapNonEmpty!11244 (not condMapEmpty!11250)) mapNonEmpty!11250))

(assert (= (and mapNonEmpty!11250 ((_ is ValueCellFull!2958) mapValue!11250)) b!258342))

(assert (= (and mapNonEmpty!11244 ((_ is ValueCellFull!2958) mapDefault!11250)) b!258343))

(declare-fun m!273675 () Bool)

(assert (=> mapNonEmpty!11250 m!273675))

(declare-fun b_lambda!8199 () Bool)

(assert (= b_lambda!8197 (or (and b!258023 b_free!6741) b_lambda!8199)))

(declare-fun b_lambda!8201 () Bool)

(assert (= b_lambda!8195 (or (and b!258023 b_free!6741) b_lambda!8201)))

(check-sat (not b!258334) (not b!258261) (not b!258207) (not bm!24544) (not b!258225) (not bm!24571) (not b!258247) (not b!258195) (not b!258328) (not b!258272) (not b!258162) (not bm!24570) (not d!61891) (not bm!24550) (not b!258205) (not d!61919) b_and!13821 (not d!61883) (not b!258289) (not b!258160) (not bm!24552) (not b!258263) (not d!61907) (not b!258199) (not d!61925) (not b_lambda!8201) (not b!258191) (not b!258166) (not b!258217) (not b!258241) (not b_next!6741) (not b!258164) (not bm!24545) (not b!258226) (not d!61885) (not bm!24561) (not d!61923) (not b!258154) (not bm!24560) (not bm!24549) (not bm!24543) (not d!61915) (not b!258296) (not b!258262) (not b!258203) (not b!258270) (not b!258276) (not b!258250) tp_is_empty!6603 (not b!258218) (not b!258327) (not b!258104) (not d!61895) (not b!258329) (not bm!24557) (not bm!24565) (not d!61927) (not d!61903) (not b!258294) (not mapNonEmpty!11250) (not b!258290) (not d!61887) (not b!258150) (not b!258158) (not d!61881) (not d!61899) (not b!258235) (not bm!24551) (not b_lambda!8199) (not b!258102) (not b!258193) (not bm!24562) (not b!258152) (not b!258201) (not d!61889) (not b!258187) (not bm!24542) (not b!258220))
(check-sat b_and!13821 (not b_next!6741))
(get-model)

(declare-fun d!61933 () Bool)

(declare-fun res!126338 () Bool)

(declare-fun e!167460 () Bool)

(assert (=> d!61933 (=> res!126338 e!167460)))

(assert (=> d!61933 (= res!126338 (= (select (arr!5945 (_keys!6931 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!61933 (= (arrayContainsKey!0 (_keys!6931 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!167460)))

(declare-fun b!258344 () Bool)

(declare-fun e!167461 () Bool)

(assert (=> b!258344 (= e!167460 e!167461)))

(declare-fun res!126339 () Bool)

(assert (=> b!258344 (=> (not res!126339) (not e!167461))))

(assert (=> b!258344 (= res!126339 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun b!258345 () Bool)

(assert (=> b!258345 (= e!167461 (arrayContainsKey!0 (_keys!6931 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!61933 (not res!126338)) b!258344))

(assert (= (and b!258344 res!126339) b!258345))

(declare-fun m!273677 () Bool)

(assert (=> d!61933 m!273677))

(declare-fun m!273679 () Bool)

(assert (=> b!258345 m!273679))

(assert (=> b!258247 d!61933))

(declare-fun d!61935 () Bool)

(assert (=> d!61935 (contains!1878 (+!692 lt!129938 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504))) lt!129934)))

(declare-fun lt!130043 () Unit!8017)

(declare-fun choose!1248 (ListLongMap!3845 (_ BitVec 64) V!8451 (_ BitVec 64)) Unit!8017)

(assert (=> d!61935 (= lt!130043 (choose!1248 lt!129938 lt!129947 (zeroValue!4602 thiss!1504) lt!129934))))

(assert (=> d!61935 (contains!1878 lt!129938 lt!129934)))

(assert (=> d!61935 (= (addStillContains!231 lt!129938 lt!129947 (zeroValue!4602 thiss!1504) lt!129934) lt!130043)))

(declare-fun bs!9092 () Bool)

(assert (= bs!9092 d!61935))

(assert (=> bs!9092 m!273479))

(assert (=> bs!9092 m!273479))

(assert (=> bs!9092 m!273481))

(declare-fun m!273681 () Bool)

(assert (=> bs!9092 m!273681))

(declare-fun m!273683 () Bool)

(assert (=> bs!9092 m!273683))

(assert (=> b!258160 d!61935))

(declare-fun d!61937 () Bool)

(assert (=> d!61937 (= (apply!255 (+!692 lt!129946 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504))) lt!129936) (apply!255 lt!129946 lt!129936))))

(declare-fun lt!130046 () Unit!8017)

(declare-fun choose!1249 (ListLongMap!3845 (_ BitVec 64) V!8451 (_ BitVec 64)) Unit!8017)

(assert (=> d!61937 (= lt!130046 (choose!1249 lt!129946 lt!129935 (zeroValue!4602 thiss!1504) lt!129936))))

(declare-fun e!167464 () Bool)

(assert (=> d!61937 e!167464))

(declare-fun res!126342 () Bool)

(assert (=> d!61937 (=> (not res!126342) (not e!167464))))

(assert (=> d!61937 (= res!126342 (contains!1878 lt!129946 lt!129936))))

(assert (=> d!61937 (= (addApplyDifferent!231 lt!129946 lt!129935 (zeroValue!4602 thiss!1504) lt!129936) lt!130046)))

(declare-fun b!258350 () Bool)

(assert (=> b!258350 (= e!167464 (not (= lt!129936 lt!129935)))))

(assert (= (and d!61937 res!126342) b!258350))

(assert (=> d!61937 m!273483))

(assert (=> d!61937 m!273485))

(declare-fun m!273685 () Bool)

(assert (=> d!61937 m!273685))

(declare-fun m!273687 () Bool)

(assert (=> d!61937 m!273687))

(assert (=> d!61937 m!273483))

(assert (=> d!61937 m!273471))

(assert (=> b!258160 d!61937))

(declare-fun d!61939 () Bool)

(assert (=> d!61939 (= (apply!255 (+!692 lt!129942 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504))) lt!129940) (apply!255 lt!129942 lt!129940))))

(declare-fun lt!130047 () Unit!8017)

(assert (=> d!61939 (= lt!130047 (choose!1249 lt!129942 lt!129939 (minValue!4602 thiss!1504) lt!129940))))

(declare-fun e!167465 () Bool)

(assert (=> d!61939 e!167465))

(declare-fun res!126343 () Bool)

(assert (=> d!61939 (=> (not res!126343) (not e!167465))))

(assert (=> d!61939 (= res!126343 (contains!1878 lt!129942 lt!129940))))

(assert (=> d!61939 (= (addApplyDifferent!231 lt!129942 lt!129939 (minValue!4602 thiss!1504) lt!129940) lt!130047)))

(declare-fun b!258351 () Bool)

(assert (=> b!258351 (= e!167465 (not (= lt!129940 lt!129939)))))

(assert (= (and d!61939 res!126343) b!258351))

(assert (=> d!61939 m!273475))

(assert (=> d!61939 m!273477))

(declare-fun m!273689 () Bool)

(assert (=> d!61939 m!273689))

(declare-fun m!273691 () Bool)

(assert (=> d!61939 m!273691))

(assert (=> d!61939 m!273475))

(assert (=> d!61939 m!273467))

(assert (=> b!258160 d!61939))

(declare-fun d!61941 () Bool)

(declare-fun get!3057 (Option!319) V!8451)

(assert (=> d!61941 (= (apply!255 (+!692 lt!129942 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504))) lt!129940) (get!3057 (getValueByKey!313 (toList!1938 (+!692 lt!129942 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504)))) lt!129940)))))

(declare-fun bs!9093 () Bool)

(assert (= bs!9093 d!61941))

(declare-fun m!273693 () Bool)

(assert (=> bs!9093 m!273693))

(assert (=> bs!9093 m!273693))

(declare-fun m!273695 () Bool)

(assert (=> bs!9093 m!273695))

(assert (=> b!258160 d!61941))

(declare-fun d!61943 () Bool)

(declare-fun e!167466 () Bool)

(assert (=> d!61943 e!167466))

(declare-fun res!126344 () Bool)

(assert (=> d!61943 (=> (not res!126344) (not e!167466))))

(declare-fun lt!130051 () ListLongMap!3845)

(assert (=> d!61943 (= res!126344 (contains!1878 lt!130051 (_1!2477 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504)))))))

(declare-fun lt!130050 () List!3811)

(assert (=> d!61943 (= lt!130051 (ListLongMap!3846 lt!130050))))

(declare-fun lt!130048 () Unit!8017)

(declare-fun lt!130049 () Unit!8017)

(assert (=> d!61943 (= lt!130048 lt!130049)))

(assert (=> d!61943 (= (getValueByKey!313 lt!130050 (_1!2477 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!61943 (= lt!130049 (lemmaContainsTupThenGetReturnValue!169 lt!130050 (_1!2477 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!61943 (= lt!130050 (insertStrictlySorted!172 (toList!1938 lt!129938) (_1!2477 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!61943 (= (+!692 lt!129938 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504))) lt!130051)))

(declare-fun b!258352 () Bool)

(declare-fun res!126345 () Bool)

(assert (=> b!258352 (=> (not res!126345) (not e!167466))))

(assert (=> b!258352 (= res!126345 (= (getValueByKey!313 (toList!1938 lt!130051) (_1!2477 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504))))))))

(declare-fun b!258353 () Bool)

(assert (=> b!258353 (= e!167466 (contains!1880 (toList!1938 lt!130051) (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504))))))

(assert (= (and d!61943 res!126344) b!258352))

(assert (= (and b!258352 res!126345) b!258353))

(declare-fun m!273697 () Bool)

(assert (=> d!61943 m!273697))

(declare-fun m!273699 () Bool)

(assert (=> d!61943 m!273699))

(declare-fun m!273701 () Bool)

(assert (=> d!61943 m!273701))

(declare-fun m!273703 () Bool)

(assert (=> d!61943 m!273703))

(declare-fun m!273705 () Bool)

(assert (=> b!258352 m!273705))

(declare-fun m!273707 () Bool)

(assert (=> b!258353 m!273707))

(assert (=> b!258160 d!61943))

(declare-fun d!61945 () Bool)

(assert (=> d!61945 (= (apply!255 lt!129931 lt!129945) (get!3057 (getValueByKey!313 (toList!1938 lt!129931) lt!129945)))))

(declare-fun bs!9094 () Bool)

(assert (= bs!9094 d!61945))

(declare-fun m!273709 () Bool)

(assert (=> bs!9094 m!273709))

(assert (=> bs!9094 m!273709))

(declare-fun m!273711 () Bool)

(assert (=> bs!9094 m!273711))

(assert (=> b!258160 d!61945))

(declare-fun d!61947 () Bool)

(assert (=> d!61947 (= (apply!255 lt!129942 lt!129940) (get!3057 (getValueByKey!313 (toList!1938 lt!129942) lt!129940)))))

(declare-fun bs!9095 () Bool)

(assert (= bs!9095 d!61947))

(declare-fun m!273713 () Bool)

(assert (=> bs!9095 m!273713))

(assert (=> bs!9095 m!273713))

(declare-fun m!273715 () Bool)

(assert (=> bs!9095 m!273715))

(assert (=> b!258160 d!61947))

(declare-fun d!61949 () Bool)

(declare-fun e!167467 () Bool)

(assert (=> d!61949 e!167467))

(declare-fun res!126346 () Bool)

(assert (=> d!61949 (=> res!126346 e!167467)))

(declare-fun lt!130052 () Bool)

(assert (=> d!61949 (= res!126346 (not lt!130052))))

(declare-fun lt!130055 () Bool)

(assert (=> d!61949 (= lt!130052 lt!130055)))

(declare-fun lt!130053 () Unit!8017)

(declare-fun e!167468 () Unit!8017)

(assert (=> d!61949 (= lt!130053 e!167468)))

(declare-fun c!43761 () Bool)

(assert (=> d!61949 (= c!43761 lt!130055)))

(assert (=> d!61949 (= lt!130055 (containsKey!305 (toList!1938 (+!692 lt!129938 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504)))) lt!129934))))

(assert (=> d!61949 (= (contains!1878 (+!692 lt!129938 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504))) lt!129934) lt!130052)))

(declare-fun b!258354 () Bool)

(declare-fun lt!130054 () Unit!8017)

(assert (=> b!258354 (= e!167468 lt!130054)))

(assert (=> b!258354 (= lt!130054 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 (+!692 lt!129938 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504)))) lt!129934))))

(assert (=> b!258354 (isDefined!254 (getValueByKey!313 (toList!1938 (+!692 lt!129938 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504)))) lt!129934))))

(declare-fun b!258355 () Bool)

(declare-fun Unit!8029 () Unit!8017)

(assert (=> b!258355 (= e!167468 Unit!8029)))

(declare-fun b!258356 () Bool)

(assert (=> b!258356 (= e!167467 (isDefined!254 (getValueByKey!313 (toList!1938 (+!692 lt!129938 (tuple2!4933 lt!129947 (zeroValue!4602 thiss!1504)))) lt!129934)))))

(assert (= (and d!61949 c!43761) b!258354))

(assert (= (and d!61949 (not c!43761)) b!258355))

(assert (= (and d!61949 (not res!126346)) b!258356))

(declare-fun m!273717 () Bool)

(assert (=> d!61949 m!273717))

(declare-fun m!273719 () Bool)

(assert (=> b!258354 m!273719))

(declare-fun m!273721 () Bool)

(assert (=> b!258354 m!273721))

(assert (=> b!258354 m!273721))

(declare-fun m!273723 () Bool)

(assert (=> b!258354 m!273723))

(assert (=> b!258356 m!273721))

(assert (=> b!258356 m!273721))

(assert (=> b!258356 m!273723))

(assert (=> b!258160 d!61949))

(declare-fun d!61951 () Bool)

(declare-fun e!167469 () Bool)

(assert (=> d!61951 e!167469))

(declare-fun res!126347 () Bool)

(assert (=> d!61951 (=> (not res!126347) (not e!167469))))

(declare-fun lt!130059 () ListLongMap!3845)

(assert (=> d!61951 (= res!126347 (contains!1878 lt!130059 (_1!2477 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504)))))))

(declare-fun lt!130058 () List!3811)

(assert (=> d!61951 (= lt!130059 (ListLongMap!3846 lt!130058))))

(declare-fun lt!130056 () Unit!8017)

(declare-fun lt!130057 () Unit!8017)

(assert (=> d!61951 (= lt!130056 lt!130057)))

(assert (=> d!61951 (= (getValueByKey!313 lt!130058 (_1!2477 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504)))))))

(assert (=> d!61951 (= lt!130057 (lemmaContainsTupThenGetReturnValue!169 lt!130058 (_1!2477 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504)))))))

(assert (=> d!61951 (= lt!130058 (insertStrictlySorted!172 (toList!1938 lt!129931) (_1!2477 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504)))))))

(assert (=> d!61951 (= (+!692 lt!129931 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504))) lt!130059)))

(declare-fun b!258357 () Bool)

(declare-fun res!126348 () Bool)

(assert (=> b!258357 (=> (not res!126348) (not e!167469))))

(assert (=> b!258357 (= res!126348 (= (getValueByKey!313 (toList!1938 lt!130059) (_1!2477 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504))))))))

(declare-fun b!258358 () Bool)

(assert (=> b!258358 (= e!167469 (contains!1880 (toList!1938 lt!130059) (tuple2!4933 lt!129933 (minValue!4602 thiss!1504))))))

(assert (= (and d!61951 res!126347) b!258357))

(assert (= (and b!258357 res!126348) b!258358))

(declare-fun m!273725 () Bool)

(assert (=> d!61951 m!273725))

(declare-fun m!273727 () Bool)

(assert (=> d!61951 m!273727))

(declare-fun m!273729 () Bool)

(assert (=> d!61951 m!273729))

(declare-fun m!273731 () Bool)

(assert (=> d!61951 m!273731))

(declare-fun m!273733 () Bool)

(assert (=> b!258357 m!273733))

(declare-fun m!273735 () Bool)

(assert (=> b!258358 m!273735))

(assert (=> b!258160 d!61951))

(declare-fun d!61953 () Bool)

(assert (=> d!61953 (= (apply!255 (+!692 lt!129946 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504))) lt!129936) (get!3057 (getValueByKey!313 (toList!1938 (+!692 lt!129946 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504)))) lt!129936)))))

(declare-fun bs!9096 () Bool)

(assert (= bs!9096 d!61953))

(declare-fun m!273737 () Bool)

(assert (=> bs!9096 m!273737))

(assert (=> bs!9096 m!273737))

(declare-fun m!273739 () Bool)

(assert (=> bs!9096 m!273739))

(assert (=> b!258160 d!61953))

(declare-fun d!61955 () Bool)

(assert (=> d!61955 (= (apply!255 lt!129946 lt!129936) (get!3057 (getValueByKey!313 (toList!1938 lt!129946) lt!129936)))))

(declare-fun bs!9097 () Bool)

(assert (= bs!9097 d!61955))

(declare-fun m!273741 () Bool)

(assert (=> bs!9097 m!273741))

(assert (=> bs!9097 m!273741))

(declare-fun m!273743 () Bool)

(assert (=> bs!9097 m!273743))

(assert (=> b!258160 d!61955))

(declare-fun d!61957 () Bool)

(assert (=> d!61957 (= (apply!255 (+!692 lt!129931 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504))) lt!129945) (get!3057 (getValueByKey!313 (toList!1938 (+!692 lt!129931 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504)))) lt!129945)))))

(declare-fun bs!9098 () Bool)

(assert (= bs!9098 d!61957))

(declare-fun m!273745 () Bool)

(assert (=> bs!9098 m!273745))

(assert (=> bs!9098 m!273745))

(declare-fun m!273747 () Bool)

(assert (=> bs!9098 m!273747))

(assert (=> b!258160 d!61957))

(declare-fun d!61959 () Bool)

(declare-fun e!167470 () Bool)

(assert (=> d!61959 e!167470))

(declare-fun res!126349 () Bool)

(assert (=> d!61959 (=> (not res!126349) (not e!167470))))

(declare-fun lt!130063 () ListLongMap!3845)

(assert (=> d!61959 (= res!126349 (contains!1878 lt!130063 (_1!2477 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504)))))))

(declare-fun lt!130062 () List!3811)

(assert (=> d!61959 (= lt!130063 (ListLongMap!3846 lt!130062))))

(declare-fun lt!130060 () Unit!8017)

(declare-fun lt!130061 () Unit!8017)

(assert (=> d!61959 (= lt!130060 lt!130061)))

(assert (=> d!61959 (= (getValueByKey!313 lt!130062 (_1!2477 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!61959 (= lt!130061 (lemmaContainsTupThenGetReturnValue!169 lt!130062 (_1!2477 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!61959 (= lt!130062 (insertStrictlySorted!172 (toList!1938 lt!129946) (_1!2477 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!61959 (= (+!692 lt!129946 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504))) lt!130063)))

(declare-fun b!258359 () Bool)

(declare-fun res!126350 () Bool)

(assert (=> b!258359 (=> (not res!126350) (not e!167470))))

(assert (=> b!258359 (= res!126350 (= (getValueByKey!313 (toList!1938 lt!130063) (_1!2477 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504))))))))

(declare-fun b!258360 () Bool)

(assert (=> b!258360 (= e!167470 (contains!1880 (toList!1938 lt!130063) (tuple2!4933 lt!129935 (zeroValue!4602 thiss!1504))))))

(assert (= (and d!61959 res!126349) b!258359))

(assert (= (and b!258359 res!126350) b!258360))

(declare-fun m!273749 () Bool)

(assert (=> d!61959 m!273749))

(declare-fun m!273751 () Bool)

(assert (=> d!61959 m!273751))

(declare-fun m!273753 () Bool)

(assert (=> d!61959 m!273753))

(declare-fun m!273755 () Bool)

(assert (=> d!61959 m!273755))

(declare-fun m!273757 () Bool)

(assert (=> b!258359 m!273757))

(declare-fun m!273759 () Bool)

(assert (=> b!258360 m!273759))

(assert (=> b!258160 d!61959))

(declare-fun d!61961 () Bool)

(declare-fun e!167486 () Bool)

(assert (=> d!61961 e!167486))

(declare-fun res!126362 () Bool)

(assert (=> d!61961 (=> (not res!126362) (not e!167486))))

(declare-fun lt!130079 () ListLongMap!3845)

(assert (=> d!61961 (= res!126362 (not (contains!1878 lt!130079 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!167489 () ListLongMap!3845)

(assert (=> d!61961 (= lt!130079 e!167489)))

(declare-fun c!43773 () Bool)

(assert (=> d!61961 (= c!43773 (bvsge #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> d!61961 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!61961 (= (getCurrentListMapNoExtraKeys!577 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) lt!130079)))

(declare-fun bm!24574 () Bool)

(declare-fun call!24577 () ListLongMap!3845)

(assert (=> bm!24574 (= call!24577 (getCurrentListMapNoExtraKeys!577 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4761 thiss!1504)))))

(declare-fun b!258385 () Bool)

(declare-fun e!167490 () Bool)

(declare-fun e!167485 () Bool)

(assert (=> b!258385 (= e!167490 e!167485)))

(declare-fun c!43771 () Bool)

(assert (=> b!258385 (= c!43771 (bvslt #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun b!258386 () Bool)

(assert (=> b!258386 (= e!167489 (ListLongMap!3846 Nil!3808))))

(declare-fun b!258387 () Bool)

(assert (=> b!258387 (= e!167486 e!167490)))

(declare-fun c!43770 () Bool)

(declare-fun e!167488 () Bool)

(assert (=> b!258387 (= c!43770 e!167488)))

(declare-fun res!126359 () Bool)

(assert (=> b!258387 (=> (not res!126359) (not e!167488))))

(assert (=> b!258387 (= res!126359 (bvslt #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun b!258388 () Bool)

(declare-fun e!167487 () Bool)

(assert (=> b!258388 (= e!167490 e!167487)))

(assert (=> b!258388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun res!126360 () Bool)

(assert (=> b!258388 (= res!126360 (contains!1878 lt!130079 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258388 (=> (not res!126360) (not e!167487))))

(declare-fun b!258389 () Bool)

(declare-fun res!126361 () Bool)

(assert (=> b!258389 (=> (not res!126361) (not e!167486))))

(assert (=> b!258389 (= res!126361 (not (contains!1878 lt!130079 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258390 () Bool)

(declare-fun isEmpty!532 (ListLongMap!3845) Bool)

(assert (=> b!258390 (= e!167485 (isEmpty!532 lt!130079))))

(declare-fun b!258391 () Bool)

(declare-fun e!167491 () ListLongMap!3845)

(assert (=> b!258391 (= e!167491 call!24577)))

(declare-fun b!258392 () Bool)

(assert (=> b!258392 (= e!167485 (= lt!130079 (getCurrentListMapNoExtraKeys!577 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4761 thiss!1504))))))

(declare-fun b!258393 () Bool)

(assert (=> b!258393 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> b!258393 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6291 (_values!4744 thiss!1504))))))

(assert (=> b!258393 (= e!167487 (= (apply!255 lt!130079 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)) (get!3056 (select (arr!5944 (_values!4744 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!258394 () Bool)

(declare-fun lt!130082 () Unit!8017)

(declare-fun lt!130084 () Unit!8017)

(assert (=> b!258394 (= lt!130082 lt!130084)))

(declare-fun lt!130081 () (_ BitVec 64))

(declare-fun lt!130078 () V!8451)

(declare-fun lt!130080 () (_ BitVec 64))

(declare-fun lt!130083 () ListLongMap!3845)

(assert (=> b!258394 (not (contains!1878 (+!692 lt!130083 (tuple2!4933 lt!130080 lt!130078)) lt!130081))))

(declare-fun addStillNotContains!125 (ListLongMap!3845 (_ BitVec 64) V!8451 (_ BitVec 64)) Unit!8017)

(assert (=> b!258394 (= lt!130084 (addStillNotContains!125 lt!130083 lt!130080 lt!130078 lt!130081))))

(assert (=> b!258394 (= lt!130081 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!258394 (= lt!130078 (get!3056 (select (arr!5944 (_values!4744 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258394 (= lt!130080 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258394 (= lt!130083 call!24577)))

(assert (=> b!258394 (= e!167491 (+!692 call!24577 (tuple2!4933 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000) (get!3056 (select (arr!5944 (_values!4744 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!258395 () Bool)

(assert (=> b!258395 (= e!167488 (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258395 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!258396 () Bool)

(assert (=> b!258396 (= e!167489 e!167491)))

(declare-fun c!43772 () Bool)

(assert (=> b!258396 (= c!43772 (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61961 c!43773) b!258386))

(assert (= (and d!61961 (not c!43773)) b!258396))

(assert (= (and b!258396 c!43772) b!258394))

(assert (= (and b!258396 (not c!43772)) b!258391))

(assert (= (or b!258394 b!258391) bm!24574))

(assert (= (and d!61961 res!126362) b!258389))

(assert (= (and b!258389 res!126361) b!258387))

(assert (= (and b!258387 res!126359) b!258395))

(assert (= (and b!258387 c!43770) b!258388))

(assert (= (and b!258387 (not c!43770)) b!258385))

(assert (= (and b!258388 res!126360) b!258393))

(assert (= (and b!258385 c!43771) b!258392))

(assert (= (and b!258385 (not c!43771)) b!258390))

(declare-fun b_lambda!8203 () Bool)

(assert (=> (not b_lambda!8203) (not b!258393)))

(assert (=> b!258393 t!8879))

(declare-fun b_and!13823 () Bool)

(assert (= b_and!13821 (and (=> t!8879 result!5391) b_and!13823)))

(declare-fun b_lambda!8205 () Bool)

(assert (=> (not b_lambda!8205) (not b!258394)))

(assert (=> b!258394 t!8879))

(declare-fun b_and!13825 () Bool)

(assert (= b_and!13823 (and (=> t!8879 result!5391) b_and!13825)))

(declare-fun m!273761 () Bool)

(assert (=> bm!24574 m!273761))

(assert (=> b!258396 m!273457))

(assert (=> b!258396 m!273457))

(assert (=> b!258396 m!273461))

(declare-fun m!273763 () Bool)

(assert (=> b!258390 m!273763))

(declare-fun m!273765 () Bool)

(assert (=> b!258394 m!273765))

(assert (=> b!258394 m!273503))

(declare-fun m!273767 () Bool)

(assert (=> b!258394 m!273767))

(assert (=> b!258394 m!273767))

(declare-fun m!273769 () Bool)

(assert (=> b!258394 m!273769))

(assert (=> b!258394 m!273457))

(assert (=> b!258394 m!273503))

(assert (=> b!258394 m!273505))

(assert (=> b!258394 m!273507))

(assert (=> b!258394 m!273505))

(declare-fun m!273771 () Bool)

(assert (=> b!258394 m!273771))

(declare-fun m!273773 () Bool)

(assert (=> d!61961 m!273773))

(assert (=> d!61961 m!273351))

(assert (=> b!258395 m!273457))

(assert (=> b!258395 m!273457))

(assert (=> b!258395 m!273461))

(assert (=> b!258392 m!273761))

(assert (=> b!258393 m!273503))

(assert (=> b!258393 m!273457))

(assert (=> b!258393 m!273503))

(assert (=> b!258393 m!273505))

(assert (=> b!258393 m!273507))

(assert (=> b!258393 m!273457))

(declare-fun m!273775 () Bool)

(assert (=> b!258393 m!273775))

(assert (=> b!258393 m!273505))

(declare-fun m!273777 () Bool)

(assert (=> b!258389 m!273777))

(assert (=> b!258388 m!273457))

(assert (=> b!258388 m!273457))

(declare-fun m!273779 () Bool)

(assert (=> b!258388 m!273779))

(assert (=> b!258160 d!61961))

(declare-fun d!61963 () Bool)

(assert (=> d!61963 (= (apply!255 (+!692 lt!129931 (tuple2!4933 lt!129933 (minValue!4602 thiss!1504))) lt!129945) (apply!255 lt!129931 lt!129945))))

(declare-fun lt!130085 () Unit!8017)

(assert (=> d!61963 (= lt!130085 (choose!1249 lt!129931 lt!129933 (minValue!4602 thiss!1504) lt!129945))))

(declare-fun e!167492 () Bool)

(assert (=> d!61963 e!167492))

(declare-fun res!126363 () Bool)

(assert (=> d!61963 (=> (not res!126363) (not e!167492))))

(assert (=> d!61963 (= res!126363 (contains!1878 lt!129931 lt!129945))))

(assert (=> d!61963 (= (addApplyDifferent!231 lt!129931 lt!129933 (minValue!4602 thiss!1504) lt!129945) lt!130085)))

(declare-fun b!258397 () Bool)

(assert (=> b!258397 (= e!167492 (not (= lt!129945 lt!129933)))))

(assert (= (and d!61963 res!126363) b!258397))

(assert (=> d!61963 m!273463))

(assert (=> d!61963 m!273473))

(declare-fun m!273781 () Bool)

(assert (=> d!61963 m!273781))

(declare-fun m!273783 () Bool)

(assert (=> d!61963 m!273783))

(assert (=> d!61963 m!273463))

(assert (=> d!61963 m!273465))

(assert (=> b!258160 d!61963))

(declare-fun d!61965 () Bool)

(declare-fun e!167493 () Bool)

(assert (=> d!61965 e!167493))

(declare-fun res!126364 () Bool)

(assert (=> d!61965 (=> (not res!126364) (not e!167493))))

(declare-fun lt!130089 () ListLongMap!3845)

(assert (=> d!61965 (= res!126364 (contains!1878 lt!130089 (_1!2477 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504)))))))

(declare-fun lt!130088 () List!3811)

(assert (=> d!61965 (= lt!130089 (ListLongMap!3846 lt!130088))))

(declare-fun lt!130086 () Unit!8017)

(declare-fun lt!130087 () Unit!8017)

(assert (=> d!61965 (= lt!130086 lt!130087)))

(assert (=> d!61965 (= (getValueByKey!313 lt!130088 (_1!2477 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504)))))))

(assert (=> d!61965 (= lt!130087 (lemmaContainsTupThenGetReturnValue!169 lt!130088 (_1!2477 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504)))))))

(assert (=> d!61965 (= lt!130088 (insertStrictlySorted!172 (toList!1938 lt!129942) (_1!2477 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504)))))))

(assert (=> d!61965 (= (+!692 lt!129942 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504))) lt!130089)))

(declare-fun b!258398 () Bool)

(declare-fun res!126365 () Bool)

(assert (=> b!258398 (=> (not res!126365) (not e!167493))))

(assert (=> b!258398 (= res!126365 (= (getValueByKey!313 (toList!1938 lt!130089) (_1!2477 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129939 (minValue!4602 thiss!1504))))))))

(declare-fun b!258399 () Bool)

(assert (=> b!258399 (= e!167493 (contains!1880 (toList!1938 lt!130089) (tuple2!4933 lt!129939 (minValue!4602 thiss!1504))))))

(assert (= (and d!61965 res!126364) b!258398))

(assert (= (and b!258398 res!126365) b!258399))

(declare-fun m!273785 () Bool)

(assert (=> d!61965 m!273785))

(declare-fun m!273787 () Bool)

(assert (=> d!61965 m!273787))

(declare-fun m!273789 () Bool)

(assert (=> d!61965 m!273789))

(declare-fun m!273791 () Bool)

(assert (=> d!61965 m!273791))

(declare-fun m!273793 () Bool)

(assert (=> b!258398 m!273793))

(declare-fun m!273795 () Bool)

(assert (=> b!258399 m!273795))

(assert (=> b!258160 d!61965))

(assert (=> d!61883 d!61897))

(declare-fun d!61967 () Bool)

(declare-fun lt!130092 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!168 (List!3811) (InoxSet tuple2!4932))

(assert (=> d!61967 (= lt!130092 (select (content!168 (toList!1938 lt!129996)) (tuple2!4933 key!932 v!346)))))

(declare-fun e!167498 () Bool)

(assert (=> d!61967 (= lt!130092 e!167498)))

(declare-fun res!126371 () Bool)

(assert (=> d!61967 (=> (not res!126371) (not e!167498))))

(assert (=> d!61967 (= res!126371 ((_ is Cons!3807) (toList!1938 lt!129996)))))

(assert (=> d!61967 (= (contains!1880 (toList!1938 lt!129996) (tuple2!4933 key!932 v!346)) lt!130092)))

(declare-fun b!258404 () Bool)

(declare-fun e!167499 () Bool)

(assert (=> b!258404 (= e!167498 e!167499)))

(declare-fun res!126370 () Bool)

(assert (=> b!258404 (=> res!126370 e!167499)))

(assert (=> b!258404 (= res!126370 (= (h!4469 (toList!1938 lt!129996)) (tuple2!4933 key!932 v!346)))))

(declare-fun b!258405 () Bool)

(assert (=> b!258405 (= e!167499 (contains!1880 (t!8874 (toList!1938 lt!129996)) (tuple2!4933 key!932 v!346)))))

(assert (= (and d!61967 res!126371) b!258404))

(assert (= (and b!258404 (not res!126370)) b!258405))

(declare-fun m!273797 () Bool)

(assert (=> d!61967 m!273797))

(declare-fun m!273799 () Bool)

(assert (=> d!61967 m!273799))

(declare-fun m!273801 () Bool)

(assert (=> b!258405 m!273801))

(assert (=> b!258226 d!61967))

(declare-fun d!61969 () Bool)

(assert (=> d!61969 (= (apply!255 lt!129950 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3057 (getValueByKey!313 (toList!1938 lt!129950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9099 () Bool)

(assert (= bs!9099 d!61969))

(declare-fun m!273803 () Bool)

(assert (=> bs!9099 m!273803))

(assert (=> bs!9099 m!273803))

(declare-fun m!273805 () Bool)

(assert (=> bs!9099 m!273805))

(assert (=> b!258158 d!61969))

(declare-fun d!61971 () Bool)

(assert (=> d!61971 (= (validKeyInArray!0 (select (arr!5945 lt!129820) index!297)) (and (not (= (select (arr!5945 lt!129820) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5945 lt!129820) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258270 d!61971))

(declare-fun d!61973 () Bool)

(assert (=> d!61973 (= (apply!255 lt!129981 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)) (get!3057 (getValueByKey!313 (toList!1938 lt!129981) (select (arr!5945 lt!129820) #b00000000000000000000000000000000))))))

(declare-fun bs!9100 () Bool)

(assert (= bs!9100 d!61973))

(assert (=> bs!9100 m!273529))

(declare-fun m!273807 () Bool)

(assert (=> bs!9100 m!273807))

(assert (=> bs!9100 m!273807))

(declare-fun m!273809 () Bool)

(assert (=> bs!9100 m!273809))

(assert (=> b!258203 d!61973))

(declare-fun c!43776 () Bool)

(declare-fun d!61975 () Bool)

(assert (=> d!61975 (= c!43776 ((_ is ValueCellFull!2958) (select (arr!5944 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!167502 () V!8451)

(assert (=> d!61975 (= (get!3056 (select (arr!5944 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!167502)))

(declare-fun b!258410 () Bool)

(declare-fun get!3058 (ValueCell!2958 V!8451) V!8451)

(assert (=> b!258410 (= e!167502 (get!3058 (select (arr!5944 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258411 () Bool)

(declare-fun get!3059 (ValueCell!2958 V!8451) V!8451)

(assert (=> b!258411 (= e!167502 (get!3059 (select (arr!5944 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61975 c!43776) b!258410))

(assert (= (and d!61975 (not c!43776)) b!258411))

(assert (=> b!258410 m!273575))

(assert (=> b!258410 m!273505))

(declare-fun m!273811 () Bool)

(assert (=> b!258410 m!273811))

(assert (=> b!258411 m!273575))

(assert (=> b!258411 m!273505))

(declare-fun m!273813 () Bool)

(assert (=> b!258411 m!273813))

(assert (=> b!258203 d!61975))

(declare-fun b!258412 () Bool)

(declare-fun e!167504 () (_ BitVec 32))

(declare-fun e!167503 () (_ BitVec 32))

(assert (=> b!258412 (= e!167504 e!167503)))

(declare-fun c!43778 () Bool)

(assert (=> b!258412 (= c!43778 (validKeyInArray!0 (select (arr!5945 lt!129820) index!297)))))

(declare-fun b!258413 () Bool)

(declare-fun call!24578 () (_ BitVec 32))

(assert (=> b!258413 (= e!167503 call!24578)))

(declare-fun bm!24575 () Bool)

(assert (=> bm!24575 (= call!24578 (arrayCountValidKeys!0 lt!129820 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun b!258414 () Bool)

(assert (=> b!258414 (= e!167504 #b00000000000000000000000000000000)))

(declare-fun b!258415 () Bool)

(assert (=> b!258415 (= e!167503 (bvadd #b00000000000000000000000000000001 call!24578))))

(declare-fun d!61977 () Bool)

(declare-fun lt!130093 () (_ BitVec 32))

(assert (=> d!61977 (and (bvsge lt!130093 #b00000000000000000000000000000000) (bvsle lt!130093 (bvsub (size!6292 lt!129820) index!297)))))

(assert (=> d!61977 (= lt!130093 e!167504)))

(declare-fun c!43777 () Bool)

(assert (=> d!61977 (= c!43777 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!61977 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6292 lt!129820)))))

(assert (=> d!61977 (= (arrayCountValidKeys!0 lt!129820 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!130093)))

(assert (= (and d!61977 c!43777) b!258414))

(assert (= (and d!61977 (not c!43777)) b!258412))

(assert (= (and b!258412 c!43778) b!258415))

(assert (= (and b!258412 (not c!43778)) b!258413))

(assert (= (or b!258415 b!258413) bm!24575))

(assert (=> b!258412 m!273629))

(assert (=> b!258412 m!273629))

(assert (=> b!258412 m!273631))

(declare-fun m!273815 () Bool)

(assert (=> bm!24575 m!273815))

(assert (=> d!61907 d!61977))

(declare-fun d!61979 () Bool)

(assert (=> d!61979 (= (arrayCountValidKeys!0 lt!129820 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!61979 true))

(declare-fun _$85!21 () Unit!8017)

(assert (=> d!61979 (= (choose!2 lt!129820 index!297) _$85!21)))

(declare-fun bs!9101 () Bool)

(assert (= bs!9101 d!61979))

(assert (=> bs!9101 m!273625))

(assert (=> d!61907 d!61979))

(declare-fun b!258416 () Bool)

(declare-fun e!167505 () Bool)

(assert (=> b!258416 (= e!167505 (contains!1881 Nil!3809 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61981 () Bool)

(declare-fun res!126372 () Bool)

(declare-fun e!167508 () Bool)

(assert (=> d!61981 (=> res!126372 e!167508)))

(assert (=> d!61981 (= res!126372 (bvsge #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> d!61981 (= (arrayNoDuplicates!0 (_keys!6931 thiss!1504) #b00000000000000000000000000000000 Nil!3809) e!167508)))

(declare-fun b!258417 () Bool)

(declare-fun e!167507 () Bool)

(declare-fun e!167506 () Bool)

(assert (=> b!258417 (= e!167507 e!167506)))

(declare-fun c!43779 () Bool)

(assert (=> b!258417 (= c!43779 (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258418 () Bool)

(assert (=> b!258418 (= e!167508 e!167507)))

(declare-fun res!126373 () Bool)

(assert (=> b!258418 (=> (not res!126373) (not e!167507))))

(assert (=> b!258418 (= res!126373 (not e!167505))))

(declare-fun res!126374 () Bool)

(assert (=> b!258418 (=> (not res!126374) (not e!167505))))

(assert (=> b!258418 (= res!126374 (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258419 () Bool)

(declare-fun call!24579 () Bool)

(assert (=> b!258419 (= e!167506 call!24579)))

(declare-fun bm!24576 () Bool)

(assert (=> bm!24576 (= call!24579 (arrayNoDuplicates!0 (_keys!6931 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43779 (Cons!3808 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000) Nil!3809) Nil!3809)))))

(declare-fun b!258420 () Bool)

(assert (=> b!258420 (= e!167506 call!24579)))

(assert (= (and d!61981 (not res!126372)) b!258418))

(assert (= (and b!258418 res!126374) b!258416))

(assert (= (and b!258418 res!126373) b!258417))

(assert (= (and b!258417 c!43779) b!258420))

(assert (= (and b!258417 (not c!43779)) b!258419))

(assert (= (or b!258420 b!258419) bm!24576))

(assert (=> b!258416 m!273457))

(assert (=> b!258416 m!273457))

(declare-fun m!273817 () Bool)

(assert (=> b!258416 m!273817))

(assert (=> b!258417 m!273457))

(assert (=> b!258417 m!273457))

(assert (=> b!258417 m!273461))

(assert (=> b!258418 m!273457))

(assert (=> b!258418 m!273457))

(assert (=> b!258418 m!273461))

(assert (=> bm!24576 m!273457))

(declare-fun m!273819 () Bool)

(assert (=> bm!24576 m!273819))

(assert (=> b!258329 d!61981))

(assert (=> bm!24545 d!61961))

(declare-fun b!258421 () Bool)

(declare-fun e!167510 () (_ BitVec 32))

(declare-fun e!167509 () (_ BitVec 32))

(assert (=> b!258421 (= e!167510 e!167509)))

(declare-fun c!43781 () Bool)

(assert (=> b!258421 (= c!43781 (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258422 () Bool)

(declare-fun call!24580 () (_ BitVec 32))

(assert (=> b!258422 (= e!167509 call!24580)))

(declare-fun bm!24577 () Bool)

(assert (=> bm!24577 (= call!24580 (arrayCountValidKeys!0 (_keys!6931 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun b!258423 () Bool)

(assert (=> b!258423 (= e!167510 #b00000000000000000000000000000000)))

(declare-fun b!258424 () Bool)

(assert (=> b!258424 (= e!167509 (bvadd #b00000000000000000000000000000001 call!24580))))

(declare-fun d!61983 () Bool)

(declare-fun lt!130094 () (_ BitVec 32))

(assert (=> d!61983 (and (bvsge lt!130094 #b00000000000000000000000000000000) (bvsle lt!130094 (bvsub (size!6292 (_keys!6931 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!61983 (= lt!130094 e!167510)))

(declare-fun c!43780 () Bool)

(assert (=> d!61983 (= c!43780 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> d!61983 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6292 (_keys!6931 thiss!1504)) (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> d!61983 (= (arrayCountValidKeys!0 (_keys!6931 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))) lt!130094)))

(assert (= (and d!61983 c!43780) b!258423))

(assert (= (and d!61983 (not c!43780)) b!258421))

(assert (= (and b!258421 c!43781) b!258424))

(assert (= (and b!258421 (not c!43781)) b!258422))

(assert (= (or b!258424 b!258422) bm!24577))

(assert (=> b!258421 m!273677))

(assert (=> b!258421 m!273677))

(declare-fun m!273821 () Bool)

(assert (=> b!258421 m!273821))

(declare-fun m!273823 () Bool)

(assert (=> bm!24577 m!273823))

(assert (=> bm!24557 d!61983))

(declare-fun d!61985 () Bool)

(assert (=> d!61985 (= (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258235 d!61985))

(assert (=> d!61927 d!61885))

(declare-fun d!61987 () Bool)

(declare-fun e!167513 () Bool)

(assert (=> d!61987 e!167513))

(declare-fun res!126379 () Bool)

(assert (=> d!61987 (=> (not res!126379) (not e!167513))))

(declare-fun lt!130097 () SeekEntryResult!1174)

(assert (=> d!61987 (= res!126379 ((_ is Found!1174) lt!130097))))

(assert (=> d!61987 (= lt!130097 (seekEntryOrOpen!0 key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)))))

(assert (=> d!61987 true))

(declare-fun _$33!174 () Unit!8017)

(assert (=> d!61987 (= (choose!1247 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 (defaultEntry!4761 thiss!1504)) _$33!174)))

(declare-fun b!258429 () Bool)

(declare-fun res!126380 () Bool)

(assert (=> b!258429 (=> (not res!126380) (not e!167513))))

(assert (=> b!258429 (= res!126380 (inRange!0 (index!6867 lt!130097) (mask!11058 thiss!1504)))))

(declare-fun b!258430 () Bool)

(assert (=> b!258430 (= e!167513 (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6867 lt!130097)) key!932))))

(assert (= (and d!61987 res!126379) b!258429))

(assert (= (and b!258429 res!126380) b!258430))

(assert (=> d!61987 m!273367))

(declare-fun m!273825 () Bool)

(assert (=> b!258429 m!273825))

(declare-fun m!273827 () Bool)

(assert (=> b!258430 m!273827))

(assert (=> d!61927 d!61987))

(assert (=> d!61927 d!61897))

(declare-fun d!61989 () Bool)

(assert (=> d!61989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (mask!11058 thiss!1504))))

(assert (=> d!61989 true))

(declare-fun _$56!33 () Unit!8017)

(assert (=> d!61989 (= (choose!102 key!932 (_keys!6931 thiss!1504) index!297 (mask!11058 thiss!1504)) _$56!33)))

(declare-fun bs!9102 () Bool)

(assert (= bs!9102 d!61989))

(assert (=> bs!9102 m!273341))

(assert (=> bs!9102 m!273619))

(assert (=> d!61903 d!61989))

(assert (=> d!61903 d!61897))

(declare-fun d!61991 () Bool)

(declare-fun res!126381 () Bool)

(declare-fun e!167514 () Bool)

(assert (=> d!61991 (=> res!126381 e!167514)))

(assert (=> d!61991 (= res!126381 (= (select (arr!5945 lt!129820) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!61991 (= (arrayContainsKey!0 lt!129820 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!167514)))

(declare-fun b!258431 () Bool)

(declare-fun e!167515 () Bool)

(assert (=> b!258431 (= e!167514 e!167515)))

(declare-fun res!126382 () Bool)

(assert (=> b!258431 (=> (not res!126382) (not e!167515))))

(assert (=> b!258431 (= res!126382 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6292 lt!129820)))))

(declare-fun b!258432 () Bool)

(assert (=> b!258432 (= e!167515 (arrayContainsKey!0 lt!129820 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!61991 (not res!126381)) b!258431))

(assert (= (and b!258431 res!126382) b!258432))

(declare-fun m!273829 () Bool)

(assert (=> d!61991 m!273829))

(declare-fun m!273831 () Bool)

(assert (=> b!258432 m!273831))

(assert (=> b!258296 d!61991))

(declare-fun d!61993 () Bool)

(declare-fun e!167516 () Bool)

(assert (=> d!61993 e!167516))

(declare-fun res!126383 () Bool)

(assert (=> d!61993 (=> res!126383 e!167516)))

(declare-fun lt!130098 () Bool)

(assert (=> d!61993 (= res!126383 (not lt!130098))))

(declare-fun lt!130101 () Bool)

(assert (=> d!61993 (= lt!130098 lt!130101)))

(declare-fun lt!130099 () Unit!8017)

(declare-fun e!167517 () Unit!8017)

(assert (=> d!61993 (= lt!130099 e!167517)))

(declare-fun c!43782 () Bool)

(assert (=> d!61993 (= c!43782 lt!130101)))

(assert (=> d!61993 (= lt!130101 (containsKey!305 (toList!1938 lt!129981) (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(assert (=> d!61993 (= (contains!1878 lt!129981 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)) lt!130098)))

(declare-fun b!258433 () Bool)

(declare-fun lt!130100 () Unit!8017)

(assert (=> b!258433 (= e!167517 lt!130100)))

(assert (=> b!258433 (= lt!130100 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 lt!129981) (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(assert (=> b!258433 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129981) (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(declare-fun b!258434 () Bool)

(declare-fun Unit!8030 () Unit!8017)

(assert (=> b!258434 (= e!167517 Unit!8030)))

(declare-fun b!258435 () Bool)

(assert (=> b!258435 (= e!167516 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129981) (select (arr!5945 lt!129820) #b00000000000000000000000000000000))))))

(assert (= (and d!61993 c!43782) b!258433))

(assert (= (and d!61993 (not c!43782)) b!258434))

(assert (= (and d!61993 (not res!126383)) b!258435))

(assert (=> d!61993 m!273529))

(declare-fun m!273833 () Bool)

(assert (=> d!61993 m!273833))

(assert (=> b!258433 m!273529))

(declare-fun m!273835 () Bool)

(assert (=> b!258433 m!273835))

(assert (=> b!258433 m!273529))

(assert (=> b!258433 m!273807))

(assert (=> b!258433 m!273807))

(declare-fun m!273837 () Bool)

(assert (=> b!258433 m!273837))

(assert (=> b!258435 m!273529))

(assert (=> b!258435 m!273807))

(assert (=> b!258435 m!273807))

(assert (=> b!258435 m!273837))

(assert (=> b!258191 d!61993))

(declare-fun d!61995 () Bool)

(assert (=> d!61995 (= (validKeyInArray!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)) (and (not (= (select (arr!5945 lt!129820) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5945 lt!129820) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258290 d!61995))

(declare-fun b!258436 () Bool)

(declare-fun e!167518 () Bool)

(declare-fun call!24581 () Bool)

(assert (=> b!258436 (= e!167518 call!24581)))

(declare-fun d!61997 () Bool)

(declare-fun res!126385 () Bool)

(declare-fun e!167520 () Bool)

(assert (=> d!61997 (=> res!126385 e!167520)))

(assert (=> d!61997 (= res!126385 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 lt!129820)))))

(assert (=> d!61997 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129820 (mask!11058 thiss!1504)) e!167520)))

(declare-fun bm!24578 () Bool)

(assert (=> bm!24578 (= call!24581 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!129820 (mask!11058 thiss!1504)))))

(declare-fun b!258437 () Bool)

(declare-fun e!167519 () Bool)

(assert (=> b!258437 (= e!167518 e!167519)))

(declare-fun lt!130103 () (_ BitVec 64))

(assert (=> b!258437 (= lt!130103 (select (arr!5945 lt!129820) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!130104 () Unit!8017)

(assert (=> b!258437 (= lt!130104 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129820 lt!130103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!258437 (arrayContainsKey!0 lt!129820 lt!130103 #b00000000000000000000000000000000)))

(declare-fun lt!130102 () Unit!8017)

(assert (=> b!258437 (= lt!130102 lt!130104)))

(declare-fun res!126384 () Bool)

(assert (=> b!258437 (= res!126384 (= (seekEntryOrOpen!0 (select (arr!5945 lt!129820) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!129820 (mask!11058 thiss!1504)) (Found!1174 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!258437 (=> (not res!126384) (not e!167519))))

(declare-fun b!258438 () Bool)

(assert (=> b!258438 (= e!167520 e!167518)))

(declare-fun c!43783 () Bool)

(assert (=> b!258438 (= c!43783 (validKeyInArray!0 (select (arr!5945 lt!129820) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258439 () Bool)

(assert (=> b!258439 (= e!167519 call!24581)))

(assert (= (and d!61997 (not res!126385)) b!258438))

(assert (= (and b!258438 c!43783) b!258437))

(assert (= (and b!258438 (not c!43783)) b!258436))

(assert (= (and b!258437 res!126384) b!258439))

(assert (= (or b!258439 b!258436) bm!24578))

(declare-fun m!273839 () Bool)

(assert (=> bm!24578 m!273839))

(assert (=> b!258437 m!273829))

(declare-fun m!273841 () Bool)

(assert (=> b!258437 m!273841))

(declare-fun m!273843 () Bool)

(assert (=> b!258437 m!273843))

(assert (=> b!258437 m!273829))

(declare-fun m!273845 () Bool)

(assert (=> b!258437 m!273845))

(assert (=> b!258438 m!273829))

(assert (=> b!258438 m!273829))

(declare-fun m!273847 () Bool)

(assert (=> b!258438 m!273847))

(assert (=> bm!24565 d!61997))

(assert (=> b!258262 d!61995))

(declare-fun d!61999 () Bool)

(assert (=> d!61999 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129825) key!932))))

(declare-fun lt!130107 () Unit!8017)

(declare-fun choose!1250 (List!3811 (_ BitVec 64)) Unit!8017)

(assert (=> d!61999 (= lt!130107 (choose!1250 (toList!1938 lt!129825) key!932))))

(declare-fun e!167523 () Bool)

(assert (=> d!61999 e!167523))

(declare-fun res!126388 () Bool)

(assert (=> d!61999 (=> (not res!126388) (not e!167523))))

(declare-fun isStrictlySorted!373 (List!3811) Bool)

(assert (=> d!61999 (= res!126388 (isStrictlySorted!373 (toList!1938 lt!129825)))))

(assert (=> d!61999 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 lt!129825) key!932) lt!130107)))

(declare-fun b!258442 () Bool)

(assert (=> b!258442 (= e!167523 (containsKey!305 (toList!1938 lt!129825) key!932))))

(assert (= (and d!61999 res!126388) b!258442))

(assert (=> d!61999 m!273451))

(assert (=> d!61999 m!273451))

(assert (=> d!61999 m!273453))

(declare-fun m!273849 () Bool)

(assert (=> d!61999 m!273849))

(declare-fun m!273851 () Bool)

(assert (=> d!61999 m!273851))

(assert (=> b!258442 m!273447))

(assert (=> b!258102 d!61999))

(declare-fun d!62001 () Bool)

(declare-fun isEmpty!533 (Option!319) Bool)

(assert (=> d!62001 (= (isDefined!254 (getValueByKey!313 (toList!1938 lt!129825) key!932)) (not (isEmpty!533 (getValueByKey!313 (toList!1938 lt!129825) key!932))))))

(declare-fun bs!9103 () Bool)

(assert (= bs!9103 d!62001))

(assert (=> bs!9103 m!273451))

(declare-fun m!273853 () Bool)

(assert (=> bs!9103 m!273853))

(assert (=> b!258102 d!62001))

(declare-fun b!258451 () Bool)

(declare-fun e!167528 () Option!319)

(assert (=> b!258451 (= e!167528 (Some!318 (_2!2477 (h!4469 (toList!1938 lt!129825)))))))

(declare-fun d!62003 () Bool)

(declare-fun c!43788 () Bool)

(assert (=> d!62003 (= c!43788 (and ((_ is Cons!3807) (toList!1938 lt!129825)) (= (_1!2477 (h!4469 (toList!1938 lt!129825))) key!932)))))

(assert (=> d!62003 (= (getValueByKey!313 (toList!1938 lt!129825) key!932) e!167528)))

(declare-fun b!258452 () Bool)

(declare-fun e!167529 () Option!319)

(assert (=> b!258452 (= e!167528 e!167529)))

(declare-fun c!43789 () Bool)

(assert (=> b!258452 (= c!43789 (and ((_ is Cons!3807) (toList!1938 lt!129825)) (not (= (_1!2477 (h!4469 (toList!1938 lt!129825))) key!932))))))

(declare-fun b!258453 () Bool)

(assert (=> b!258453 (= e!167529 (getValueByKey!313 (t!8874 (toList!1938 lt!129825)) key!932))))

(declare-fun b!258454 () Bool)

(assert (=> b!258454 (= e!167529 None!317)))

(assert (= (and d!62003 c!43788) b!258451))

(assert (= (and d!62003 (not c!43788)) b!258452))

(assert (= (and b!258452 c!43789) b!258453))

(assert (= (and b!258452 (not c!43789)) b!258454))

(declare-fun m!273855 () Bool)

(assert (=> b!258453 m!273855))

(assert (=> b!258102 d!62003))

(declare-fun d!62005 () Bool)

(declare-fun e!167530 () Bool)

(assert (=> d!62005 e!167530))

(declare-fun res!126389 () Bool)

(assert (=> d!62005 (=> res!126389 e!167530)))

(declare-fun lt!130108 () Bool)

(assert (=> d!62005 (= res!126389 (not lt!130108))))

(declare-fun lt!130111 () Bool)

(assert (=> d!62005 (= lt!130108 lt!130111)))

(declare-fun lt!130109 () Unit!8017)

(declare-fun e!167531 () Unit!8017)

(assert (=> d!62005 (= lt!130109 e!167531)))

(declare-fun c!43790 () Bool)

(assert (=> d!62005 (= c!43790 lt!130111)))

(assert (=> d!62005 (= lt!130111 (containsKey!305 (toList!1938 lt!129996) (_1!2477 (tuple2!4933 key!932 v!346))))))

(assert (=> d!62005 (= (contains!1878 lt!129996 (_1!2477 (tuple2!4933 key!932 v!346))) lt!130108)))

(declare-fun b!258455 () Bool)

(declare-fun lt!130110 () Unit!8017)

(assert (=> b!258455 (= e!167531 lt!130110)))

(assert (=> b!258455 (= lt!130110 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 lt!129996) (_1!2477 (tuple2!4933 key!932 v!346))))))

(assert (=> b!258455 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129996) (_1!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun b!258456 () Bool)

(declare-fun Unit!8031 () Unit!8017)

(assert (=> b!258456 (= e!167531 Unit!8031)))

(declare-fun b!258457 () Bool)

(assert (=> b!258457 (= e!167530 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129996) (_1!2477 (tuple2!4933 key!932 v!346)))))))

(assert (= (and d!62005 c!43790) b!258455))

(assert (= (and d!62005 (not c!43790)) b!258456))

(assert (= (and d!62005 (not res!126389)) b!258457))

(declare-fun m!273857 () Bool)

(assert (=> d!62005 m!273857))

(declare-fun m!273859 () Bool)

(assert (=> b!258455 m!273859))

(assert (=> b!258455 m!273601))

(assert (=> b!258455 m!273601))

(declare-fun m!273861 () Bool)

(assert (=> b!258455 m!273861))

(assert (=> b!258457 m!273601))

(assert (=> b!258457 m!273601))

(assert (=> b!258457 m!273861))

(assert (=> d!61891 d!62005))

(declare-fun b!258458 () Bool)

(declare-fun e!167532 () Option!319)

(assert (=> b!258458 (= e!167532 (Some!318 (_2!2477 (h!4469 lt!129995))))))

(declare-fun d!62007 () Bool)

(declare-fun c!43791 () Bool)

(assert (=> d!62007 (= c!43791 (and ((_ is Cons!3807) lt!129995) (= (_1!2477 (h!4469 lt!129995)) (_1!2477 (tuple2!4933 key!932 v!346)))))))

(assert (=> d!62007 (= (getValueByKey!313 lt!129995 (_1!2477 (tuple2!4933 key!932 v!346))) e!167532)))

(declare-fun b!258459 () Bool)

(declare-fun e!167533 () Option!319)

(assert (=> b!258459 (= e!167532 e!167533)))

(declare-fun c!43792 () Bool)

(assert (=> b!258459 (= c!43792 (and ((_ is Cons!3807) lt!129995) (not (= (_1!2477 (h!4469 lt!129995)) (_1!2477 (tuple2!4933 key!932 v!346))))))))

(declare-fun b!258460 () Bool)

(assert (=> b!258460 (= e!167533 (getValueByKey!313 (t!8874 lt!129995) (_1!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun b!258461 () Bool)

(assert (=> b!258461 (= e!167533 None!317)))

(assert (= (and d!62007 c!43791) b!258458))

(assert (= (and d!62007 (not c!43791)) b!258459))

(assert (= (and b!258459 c!43792) b!258460))

(assert (= (and b!258459 (not c!43792)) b!258461))

(declare-fun m!273863 () Bool)

(assert (=> b!258460 m!273863))

(assert (=> d!61891 d!62007))

(declare-fun d!62009 () Bool)

(assert (=> d!62009 (= (getValueByKey!313 lt!129995 (_1!2477 (tuple2!4933 key!932 v!346))) (Some!318 (_2!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun lt!130114 () Unit!8017)

(declare-fun choose!1251 (List!3811 (_ BitVec 64) V!8451) Unit!8017)

(assert (=> d!62009 (= lt!130114 (choose!1251 lt!129995 (_1!2477 (tuple2!4933 key!932 v!346)) (_2!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun e!167536 () Bool)

(assert (=> d!62009 e!167536))

(declare-fun res!126394 () Bool)

(assert (=> d!62009 (=> (not res!126394) (not e!167536))))

(assert (=> d!62009 (= res!126394 (isStrictlySorted!373 lt!129995))))

(assert (=> d!62009 (= (lemmaContainsTupThenGetReturnValue!169 lt!129995 (_1!2477 (tuple2!4933 key!932 v!346)) (_2!2477 (tuple2!4933 key!932 v!346))) lt!130114)))

(declare-fun b!258466 () Bool)

(declare-fun res!126395 () Bool)

(assert (=> b!258466 (=> (not res!126395) (not e!167536))))

(assert (=> b!258466 (= res!126395 (containsKey!305 lt!129995 (_1!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun b!258467 () Bool)

(assert (=> b!258467 (= e!167536 (contains!1880 lt!129995 (tuple2!4933 (_1!2477 (tuple2!4933 key!932 v!346)) (_2!2477 (tuple2!4933 key!932 v!346)))))))

(assert (= (and d!62009 res!126394) b!258466))

(assert (= (and b!258466 res!126395) b!258467))

(assert (=> d!62009 m!273595))

(declare-fun m!273865 () Bool)

(assert (=> d!62009 m!273865))

(declare-fun m!273867 () Bool)

(assert (=> d!62009 m!273867))

(declare-fun m!273869 () Bool)

(assert (=> b!258466 m!273869))

(declare-fun m!273871 () Bool)

(assert (=> b!258467 m!273871))

(assert (=> d!61891 d!62009))

(declare-fun bm!24585 () Bool)

(declare-fun call!24588 () List!3811)

(declare-fun call!24589 () List!3811)

(assert (=> bm!24585 (= call!24588 call!24589)))

(declare-fun bm!24586 () Bool)

(declare-fun call!24590 () List!3811)

(assert (=> bm!24586 (= call!24590 call!24588)))

(declare-fun c!43802 () Bool)

(declare-fun c!43801 () Bool)

(declare-fun b!258488 () Bool)

(declare-fun e!167547 () List!3811)

(assert (=> b!258488 (= e!167547 (ite c!43801 (t!8874 (toList!1938 lt!129825)) (ite c!43802 (Cons!3807 (h!4469 (toList!1938 lt!129825)) (t!8874 (toList!1938 lt!129825))) Nil!3808)))))

(declare-fun b!258489 () Bool)

(declare-fun e!167548 () List!3811)

(assert (=> b!258489 (= e!167548 call!24588)))

(declare-fun b!258490 () Bool)

(declare-fun e!167549 () List!3811)

(assert (=> b!258490 (= e!167549 e!167548)))

(assert (=> b!258490 (= c!43801 (and ((_ is Cons!3807) (toList!1938 lt!129825)) (= (_1!2477 (h!4469 (toList!1938 lt!129825))) (_1!2477 (tuple2!4933 key!932 v!346)))))))

(declare-fun d!62011 () Bool)

(declare-fun e!167550 () Bool)

(assert (=> d!62011 e!167550))

(declare-fun res!126400 () Bool)

(assert (=> d!62011 (=> (not res!126400) (not e!167550))))

(declare-fun lt!130117 () List!3811)

(assert (=> d!62011 (= res!126400 (isStrictlySorted!373 lt!130117))))

(assert (=> d!62011 (= lt!130117 e!167549)))

(declare-fun c!43804 () Bool)

(assert (=> d!62011 (= c!43804 (and ((_ is Cons!3807) (toList!1938 lt!129825)) (bvslt (_1!2477 (h!4469 (toList!1938 lt!129825))) (_1!2477 (tuple2!4933 key!932 v!346)))))))

(assert (=> d!62011 (isStrictlySorted!373 (toList!1938 lt!129825))))

(assert (=> d!62011 (= (insertStrictlySorted!172 (toList!1938 lt!129825) (_1!2477 (tuple2!4933 key!932 v!346)) (_2!2477 (tuple2!4933 key!932 v!346))) lt!130117)))

(declare-fun bm!24587 () Bool)

(declare-fun $colon$colon!104 (List!3811 tuple2!4932) List!3811)

(assert (=> bm!24587 (= call!24589 ($colon$colon!104 e!167547 (ite c!43804 (h!4469 (toList!1938 lt!129825)) (tuple2!4933 (_1!2477 (tuple2!4933 key!932 v!346)) (_2!2477 (tuple2!4933 key!932 v!346))))))))

(declare-fun c!43803 () Bool)

(assert (=> bm!24587 (= c!43803 c!43804)))

(declare-fun b!258491 () Bool)

(assert (=> b!258491 (= e!167550 (contains!1880 lt!130117 (tuple2!4933 (_1!2477 (tuple2!4933 key!932 v!346)) (_2!2477 (tuple2!4933 key!932 v!346)))))))

(declare-fun b!258492 () Bool)

(declare-fun e!167551 () List!3811)

(assert (=> b!258492 (= e!167551 call!24590)))

(declare-fun b!258493 () Bool)

(assert (=> b!258493 (= e!167551 call!24590)))

(declare-fun b!258494 () Bool)

(declare-fun res!126401 () Bool)

(assert (=> b!258494 (=> (not res!126401) (not e!167550))))

(assert (=> b!258494 (= res!126401 (containsKey!305 lt!130117 (_1!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun b!258495 () Bool)

(assert (=> b!258495 (= e!167549 call!24589)))

(declare-fun b!258496 () Bool)

(assert (=> b!258496 (= e!167547 (insertStrictlySorted!172 (t!8874 (toList!1938 lt!129825)) (_1!2477 (tuple2!4933 key!932 v!346)) (_2!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun b!258497 () Bool)

(assert (=> b!258497 (= c!43802 (and ((_ is Cons!3807) (toList!1938 lt!129825)) (bvsgt (_1!2477 (h!4469 (toList!1938 lt!129825))) (_1!2477 (tuple2!4933 key!932 v!346)))))))

(assert (=> b!258497 (= e!167548 e!167551)))

(assert (= (and d!62011 c!43804) b!258495))

(assert (= (and d!62011 (not c!43804)) b!258490))

(assert (= (and b!258490 c!43801) b!258489))

(assert (= (and b!258490 (not c!43801)) b!258497))

(assert (= (and b!258497 c!43802) b!258493))

(assert (= (and b!258497 (not c!43802)) b!258492))

(assert (= (or b!258493 b!258492) bm!24586))

(assert (= (or b!258489 bm!24586) bm!24585))

(assert (= (or b!258495 bm!24585) bm!24587))

(assert (= (and bm!24587 c!43803) b!258496))

(assert (= (and bm!24587 (not c!43803)) b!258488))

(assert (= (and d!62011 res!126400) b!258494))

(assert (= (and b!258494 res!126401) b!258491))

(declare-fun m!273873 () Bool)

(assert (=> bm!24587 m!273873))

(declare-fun m!273875 () Bool)

(assert (=> b!258494 m!273875))

(declare-fun m!273877 () Bool)

(assert (=> b!258491 m!273877))

(declare-fun m!273879 () Bool)

(assert (=> d!62011 m!273879))

(assert (=> d!62011 m!273851))

(declare-fun m!273881 () Bool)

(assert (=> b!258496 m!273881))

(assert (=> d!61891 d!62011))

(assert (=> b!258195 d!61995))

(declare-fun d!62013 () Bool)

(declare-fun e!167552 () Bool)

(assert (=> d!62013 e!167552))

(declare-fun res!126402 () Bool)

(assert (=> d!62013 (=> res!126402 e!167552)))

(declare-fun lt!130118 () Bool)

(assert (=> d!62013 (= res!126402 (not lt!130118))))

(declare-fun lt!130121 () Bool)

(assert (=> d!62013 (= lt!130118 lt!130121)))

(declare-fun lt!130119 () Unit!8017)

(declare-fun e!167553 () Unit!8017)

(assert (=> d!62013 (= lt!130119 e!167553)))

(declare-fun c!43805 () Bool)

(assert (=> d!62013 (= c!43805 lt!130121)))

(assert (=> d!62013 (= lt!130121 (containsKey!305 (toList!1938 lt!129950) (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62013 (= (contains!1878 lt!129950 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)) lt!130118)))

(declare-fun b!258498 () Bool)

(declare-fun lt!130120 () Unit!8017)

(assert (=> b!258498 (= e!167553 lt!130120)))

(assert (=> b!258498 (= lt!130120 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 lt!129950) (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258498 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129950) (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258499 () Bool)

(declare-fun Unit!8032 () Unit!8017)

(assert (=> b!258499 (= e!167553 Unit!8032)))

(declare-fun b!258500 () Bool)

(assert (=> b!258500 (= e!167552 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129950) (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!62013 c!43805) b!258498))

(assert (= (and d!62013 (not c!43805)) b!258499))

(assert (= (and d!62013 (not res!126402)) b!258500))

(assert (=> d!62013 m!273457))

(declare-fun m!273883 () Bool)

(assert (=> d!62013 m!273883))

(assert (=> b!258498 m!273457))

(declare-fun m!273885 () Bool)

(assert (=> b!258498 m!273885))

(assert (=> b!258498 m!273457))

(declare-fun m!273887 () Bool)

(assert (=> b!258498 m!273887))

(assert (=> b!258498 m!273887))

(declare-fun m!273889 () Bool)

(assert (=> b!258498 m!273889))

(assert (=> b!258500 m!273457))

(assert (=> b!258500 m!273887))

(assert (=> b!258500 m!273887))

(assert (=> b!258500 m!273889))

(assert (=> b!258150 d!62013))

(declare-fun d!62015 () Bool)

(declare-fun e!167554 () Bool)

(assert (=> d!62015 e!167554))

(declare-fun res!126403 () Bool)

(assert (=> d!62015 (=> res!126403 e!167554)))

(declare-fun lt!130122 () Bool)

(assert (=> d!62015 (= res!126403 (not lt!130122))))

(declare-fun lt!130125 () Bool)

(assert (=> d!62015 (= lt!130122 lt!130125)))

(declare-fun lt!130123 () Unit!8017)

(declare-fun e!167555 () Unit!8017)

(assert (=> d!62015 (= lt!130123 e!167555)))

(declare-fun c!43806 () Bool)

(assert (=> d!62015 (= c!43806 lt!130125)))

(assert (=> d!62015 (= lt!130125 (containsKey!305 (toList!1938 lt!129981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62015 (= (contains!1878 lt!129981 #b1000000000000000000000000000000000000000000000000000000000000000) lt!130122)))

(declare-fun b!258501 () Bool)

(declare-fun lt!130124 () Unit!8017)

(assert (=> b!258501 (= e!167555 lt!130124)))

(assert (=> b!258501 (= lt!130124 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 lt!129981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258501 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258502 () Bool)

(declare-fun Unit!8033 () Unit!8017)

(assert (=> b!258502 (= e!167555 Unit!8033)))

(declare-fun b!258503 () Bool)

(assert (=> b!258503 (= e!167554 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62015 c!43806) b!258501))

(assert (= (and d!62015 (not c!43806)) b!258502))

(assert (= (and d!62015 (not res!126403)) b!258503))

(declare-fun m!273891 () Bool)

(assert (=> d!62015 m!273891))

(declare-fun m!273893 () Bool)

(assert (=> b!258501 m!273893))

(declare-fun m!273895 () Bool)

(assert (=> b!258501 m!273895))

(assert (=> b!258501 m!273895))

(declare-fun m!273897 () Bool)

(assert (=> b!258501 m!273897))

(assert (=> b!258503 m!273895))

(assert (=> b!258503 m!273895))

(assert (=> b!258503 m!273897))

(assert (=> bm!24551 d!62015))

(assert (=> b!258327 d!61893))

(declare-fun d!62017 () Bool)

(assert (=> d!62017 (= (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) index!297)) (and (not (= (select (arr!5945 (_keys!6931 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5945 (_keys!6931 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258217 d!62017))

(declare-fun d!62019 () Bool)

(assert (=> d!62019 (arrayNoDuplicates!0 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) #b00000000000000000000000000000000 Nil!3809)))

(assert (=> d!62019 true))

(declare-fun _$65!86 () Unit!8017)

(assert (=> d!62019 (= (choose!41 (_keys!6931 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3809) _$65!86)))

(declare-fun bs!9104 () Bool)

(assert (= bs!9104 d!62019))

(assert (=> bs!9104 m!273341))

(assert (=> bs!9104 m!273647))

(assert (=> d!61915 d!62019))

(declare-fun d!62021 () Bool)

(assert (=> d!62021 (= (inRange!0 (index!6867 lt!130040) (mask!11058 thiss!1504)) (and (bvsge (index!6867 lt!130040) #b00000000000000000000000000000000) (bvslt (index!6867 lt!130040) (bvadd (mask!11058 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!258334 d!62021))

(declare-fun d!62023 () Bool)

(declare-fun e!167556 () Bool)

(assert (=> d!62023 e!167556))

(declare-fun res!126404 () Bool)

(assert (=> d!62023 (=> (not res!126404) (not e!167556))))

(declare-fun lt!130129 () ListLongMap!3845)

(assert (=> d!62023 (= res!126404 (contains!1878 lt!130129 (_1!2477 (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))))

(declare-fun lt!130128 () List!3811)

(assert (=> d!62023 (= lt!130129 (ListLongMap!3846 lt!130128))))

(declare-fun lt!130126 () Unit!8017)

(declare-fun lt!130127 () Unit!8017)

(assert (=> d!62023 (= lt!130126 lt!130127)))

(assert (=> d!62023 (= (getValueByKey!313 lt!130128 (_1!2477 (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))) (Some!318 (_2!2477 (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))))

(assert (=> d!62023 (= lt!130127 (lemmaContainsTupThenGetReturnValue!169 lt!130128 (_1!2477 (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))) (_2!2477 (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))))

(assert (=> d!62023 (= lt!130128 (insertStrictlySorted!172 (toList!1938 (ite c!43720 call!24549 (ite c!43719 call!24547 call!24546))) (_1!2477 (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))) (_2!2477 (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))))

(assert (=> d!62023 (= (+!692 (ite c!43720 call!24549 (ite c!43719 call!24547 call!24546)) (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))) lt!130129)))

(declare-fun b!258504 () Bool)

(declare-fun res!126405 () Bool)

(assert (=> b!258504 (=> (not res!126405) (not e!167556))))

(assert (=> b!258504 (= res!126405 (= (getValueByKey!313 (toList!1938 lt!130129) (_1!2477 (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))) (Some!318 (_2!2477 (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))))

(declare-fun b!258505 () Bool)

(assert (=> b!258505 (= e!167556 (contains!1880 (toList!1938 lt!130129) (ite (or c!43720 c!43719) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(assert (= (and d!62023 res!126404) b!258504))

(assert (= (and b!258504 res!126405) b!258505))

(declare-fun m!273899 () Bool)

(assert (=> d!62023 m!273899))

(declare-fun m!273901 () Bool)

(assert (=> d!62023 m!273901))

(declare-fun m!273903 () Bool)

(assert (=> d!62023 m!273903))

(declare-fun m!273905 () Bool)

(assert (=> d!62023 m!273905))

(declare-fun m!273907 () Bool)

(assert (=> b!258504 m!273907))

(declare-fun m!273909 () Bool)

(assert (=> b!258505 m!273909))

(assert (=> bm!24543 d!62023))

(assert (=> b!258104 d!62001))

(assert (=> b!258104 d!62003))

(declare-fun b!258506 () Bool)

(declare-fun e!167557 () Bool)

(assert (=> b!258506 (= e!167557 (contains!1881 Nil!3809 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!62025 () Bool)

(declare-fun res!126406 () Bool)

(declare-fun e!167560 () Bool)

(assert (=> d!62025 (=> res!126406 e!167560)))

(assert (=> d!62025 (= res!126406 (bvsge #b00000000000000000000000000000000 (size!6292 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))))))))

(assert (=> d!62025 (= (arrayNoDuplicates!0 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) #b00000000000000000000000000000000 Nil!3809) e!167560)))

(declare-fun b!258507 () Bool)

(declare-fun e!167559 () Bool)

(declare-fun e!167558 () Bool)

(assert (=> b!258507 (= e!167559 e!167558)))

(declare-fun c!43807 () Bool)

(assert (=> b!258507 (= c!43807 (validKeyInArray!0 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258508 () Bool)

(assert (=> b!258508 (= e!167560 e!167559)))

(declare-fun res!126407 () Bool)

(assert (=> b!258508 (=> (not res!126407) (not e!167559))))

(assert (=> b!258508 (= res!126407 (not e!167557))))

(declare-fun res!126408 () Bool)

(assert (=> b!258508 (=> (not res!126408) (not e!167557))))

(assert (=> b!258508 (= res!126408 (validKeyInArray!0 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258509 () Bool)

(declare-fun call!24591 () Bool)

(assert (=> b!258509 (= e!167558 call!24591)))

(declare-fun bm!24588 () Bool)

(assert (=> bm!24588 (= call!24591 (arrayNoDuplicates!0 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43807 (Cons!3808 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000) Nil!3809) Nil!3809)))))

(declare-fun b!258510 () Bool)

(assert (=> b!258510 (= e!167558 call!24591)))

(assert (= (and d!62025 (not res!126406)) b!258508))

(assert (= (and b!258508 res!126408) b!258506))

(assert (= (and b!258508 res!126407) b!258507))

(assert (= (and b!258507 c!43807) b!258510))

(assert (= (and b!258507 (not c!43807)) b!258509))

(assert (= (or b!258510 b!258509) bm!24588))

(declare-fun m!273911 () Bool)

(assert (=> b!258506 m!273911))

(assert (=> b!258506 m!273911))

(declare-fun m!273913 () Bool)

(assert (=> b!258506 m!273913))

(assert (=> b!258507 m!273911))

(assert (=> b!258507 m!273911))

(declare-fun m!273915 () Bool)

(assert (=> b!258507 m!273915))

(assert (=> b!258508 m!273911))

(assert (=> b!258508 m!273911))

(assert (=> b!258508 m!273915))

(assert (=> bm!24588 m!273911))

(declare-fun m!273917 () Bool)

(assert (=> bm!24588 m!273917))

(assert (=> b!258294 d!62025))

(declare-fun b!258529 () Bool)

(declare-fun lt!130134 () SeekEntryResult!1174)

(assert (=> b!258529 (and (bvsge (index!6868 lt!130134) #b00000000000000000000000000000000) (bvslt (index!6868 lt!130134) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun res!126417 () Bool)

(assert (=> b!258529 (= res!126417 (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6868 lt!130134)) key!932))))

(declare-fun e!167572 () Bool)

(assert (=> b!258529 (=> res!126417 e!167572)))

(declare-fun e!167575 () Bool)

(assert (=> b!258529 (= e!167575 e!167572)))

(declare-fun b!258530 () Bool)

(declare-fun e!167571 () SeekEntryResult!1174)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!258530 (= e!167571 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11058 thiss!1504)) #b00000000000000000000000000000000 (mask!11058 thiss!1504)) key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)))))

(declare-fun b!258531 () Bool)

(declare-fun e!167574 () SeekEntryResult!1174)

(assert (=> b!258531 (= e!167574 e!167571)))

(declare-fun c!43815 () Bool)

(declare-fun lt!130135 () (_ BitVec 64))

(assert (=> b!258531 (= c!43815 (or (= lt!130135 key!932) (= (bvadd lt!130135 lt!130135) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258532 () Bool)

(assert (=> b!258532 (and (bvsge (index!6868 lt!130134) #b00000000000000000000000000000000) (bvslt (index!6868 lt!130134) (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> b!258532 (= e!167572 (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6868 lt!130134)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258533 () Bool)

(assert (=> b!258533 (= e!167571 (Intermediate!1174 false (toIndex!0 key!932 (mask!11058 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!258534 () Bool)

(assert (=> b!258534 (= e!167574 (Intermediate!1174 true (toIndex!0 key!932 (mask!11058 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!62027 () Bool)

(declare-fun e!167573 () Bool)

(assert (=> d!62027 e!167573))

(declare-fun c!43816 () Bool)

(assert (=> d!62027 (= c!43816 (and ((_ is Intermediate!1174) lt!130134) (undefined!1986 lt!130134)))))

(assert (=> d!62027 (= lt!130134 e!167574)))

(declare-fun c!43814 () Bool)

(assert (=> d!62027 (= c!43814 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!62027 (= lt!130135 (select (arr!5945 (_keys!6931 thiss!1504)) (toIndex!0 key!932 (mask!11058 thiss!1504))))))

(assert (=> d!62027 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!62027 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11058 thiss!1504)) key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)) lt!130134)))

(declare-fun b!258535 () Bool)

(assert (=> b!258535 (= e!167573 e!167575)))

(declare-fun res!126416 () Bool)

(assert (=> b!258535 (= res!126416 (and ((_ is Intermediate!1174) lt!130134) (not (undefined!1986 lt!130134)) (bvslt (x!25042 lt!130134) #b01111111111111111111111111111110) (bvsge (x!25042 lt!130134) #b00000000000000000000000000000000) (bvsge (x!25042 lt!130134) #b00000000000000000000000000000000)))))

(assert (=> b!258535 (=> (not res!126416) (not e!167575))))

(declare-fun b!258536 () Bool)

(assert (=> b!258536 (= e!167573 (bvsge (x!25042 lt!130134) #b01111111111111111111111111111110))))

(declare-fun b!258537 () Bool)

(assert (=> b!258537 (and (bvsge (index!6868 lt!130134) #b00000000000000000000000000000000) (bvslt (index!6868 lt!130134) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun res!126415 () Bool)

(assert (=> b!258537 (= res!126415 (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6868 lt!130134)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258537 (=> res!126415 e!167572)))

(assert (= (and d!62027 c!43814) b!258534))

(assert (= (and d!62027 (not c!43814)) b!258531))

(assert (= (and b!258531 c!43815) b!258533))

(assert (= (and b!258531 (not c!43815)) b!258530))

(assert (= (and d!62027 c!43816) b!258536))

(assert (= (and d!62027 (not c!43816)) b!258535))

(assert (= (and b!258535 res!126416) b!258529))

(assert (= (and b!258529 (not res!126417)) b!258537))

(assert (= (and b!258537 (not res!126415)) b!258532))

(declare-fun m!273919 () Bool)

(assert (=> b!258529 m!273919))

(assert (=> b!258530 m!273513))

(declare-fun m!273921 () Bool)

(assert (=> b!258530 m!273921))

(assert (=> b!258530 m!273921))

(declare-fun m!273923 () Bool)

(assert (=> b!258530 m!273923))

(assert (=> d!62027 m!273513))

(declare-fun m!273925 () Bool)

(assert (=> d!62027 m!273925))

(assert (=> d!62027 m!273351))

(assert (=> b!258537 m!273919))

(assert (=> b!258532 m!273919))

(assert (=> d!61885 d!62027))

(declare-fun d!62029 () Bool)

(declare-fun lt!130141 () (_ BitVec 32))

(declare-fun lt!130140 () (_ BitVec 32))

(assert (=> d!62029 (= lt!130141 (bvmul (bvxor lt!130140 (bvlshr lt!130140 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!62029 (= lt!130140 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!62029 (and (bvsge (mask!11058 thiss!1504) #b00000000000000000000000000000000) (let ((res!126418 (let ((h!4473 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25060 (bvmul (bvxor h!4473 (bvlshr h!4473 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25060 (bvlshr x!25060 #b00000000000000000000000000001101)) (mask!11058 thiss!1504)))))) (and (bvslt res!126418 (bvadd (mask!11058 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!126418 #b00000000000000000000000000000000))))))

(assert (=> d!62029 (= (toIndex!0 key!932 (mask!11058 thiss!1504)) (bvand (bvxor lt!130141 (bvlshr lt!130141 #b00000000000000000000000000001101)) (mask!11058 thiss!1504)))))

(assert (=> d!61885 d!62029))

(assert (=> d!61885 d!61897))

(declare-fun b!258538 () Bool)

(declare-fun e!167577 () (_ BitVec 32))

(declare-fun e!167576 () (_ BitVec 32))

(assert (=> b!258538 (= e!167577 e!167576)))

(declare-fun c!43818 () Bool)

(assert (=> b!258538 (= c!43818 (validKeyInArray!0 (select (arr!5945 lt!129820) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258539 () Bool)

(declare-fun call!24592 () (_ BitVec 32))

(assert (=> b!258539 (= e!167576 call!24592)))

(declare-fun bm!24589 () Bool)

(assert (=> bm!24589 (= call!24592 (arrayCountValidKeys!0 lt!129820 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun b!258540 () Bool)

(assert (=> b!258540 (= e!167577 #b00000000000000000000000000000000)))

(declare-fun b!258541 () Bool)

(assert (=> b!258541 (= e!167576 (bvadd #b00000000000000000000000000000001 call!24592))))

(declare-fun d!62031 () Bool)

(declare-fun lt!130142 () (_ BitVec 32))

(assert (=> d!62031 (and (bvsge lt!130142 #b00000000000000000000000000000000) (bvsle lt!130142 (bvsub (size!6292 lt!129820) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!62031 (= lt!130142 e!167577)))

(declare-fun c!43817 () Bool)

(assert (=> d!62031 (= c!43817 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> d!62031 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6292 (_keys!6931 thiss!1504)) (size!6292 lt!129820)))))

(assert (=> d!62031 (= (arrayCountValidKeys!0 lt!129820 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))) lt!130142)))

(assert (= (and d!62031 c!43817) b!258540))

(assert (= (and d!62031 (not c!43817)) b!258538))

(assert (= (and b!258538 c!43818) b!258541))

(assert (= (and b!258538 (not c!43818)) b!258539))

(assert (= (or b!258541 b!258539) bm!24589))

(assert (=> b!258538 m!273829))

(assert (=> b!258538 m!273829))

(assert (=> b!258538 m!273847))

(declare-fun m!273927 () Bool)

(assert (=> bm!24589 m!273927))

(assert (=> bm!24561 d!62031))

(declare-fun b!258542 () Bool)

(declare-fun e!167578 () Option!319)

(assert (=> b!258542 (= e!167578 (Some!318 (_2!2477 (h!4469 (toList!1938 lt!129996)))))))

(declare-fun d!62033 () Bool)

(declare-fun c!43819 () Bool)

(assert (=> d!62033 (= c!43819 (and ((_ is Cons!3807) (toList!1938 lt!129996)) (= (_1!2477 (h!4469 (toList!1938 lt!129996))) (_1!2477 (tuple2!4933 key!932 v!346)))))))

(assert (=> d!62033 (= (getValueByKey!313 (toList!1938 lt!129996) (_1!2477 (tuple2!4933 key!932 v!346))) e!167578)))

(declare-fun b!258543 () Bool)

(declare-fun e!167579 () Option!319)

(assert (=> b!258543 (= e!167578 e!167579)))

(declare-fun c!43820 () Bool)

(assert (=> b!258543 (= c!43820 (and ((_ is Cons!3807) (toList!1938 lt!129996)) (not (= (_1!2477 (h!4469 (toList!1938 lt!129996))) (_1!2477 (tuple2!4933 key!932 v!346))))))))

(declare-fun b!258544 () Bool)

(assert (=> b!258544 (= e!167579 (getValueByKey!313 (t!8874 (toList!1938 lt!129996)) (_1!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun b!258545 () Bool)

(assert (=> b!258545 (= e!167579 None!317)))

(assert (= (and d!62033 c!43819) b!258542))

(assert (= (and d!62033 (not c!43819)) b!258543))

(assert (= (and b!258543 c!43820) b!258544))

(assert (= (and b!258543 (not c!43820)) b!258545))

(declare-fun m!273929 () Bool)

(assert (=> b!258544 m!273929))

(assert (=> b!258225 d!62033))

(declare-fun b!258546 () Bool)

(declare-fun e!167581 () (_ BitVec 32))

(declare-fun e!167580 () (_ BitVec 32))

(assert (=> b!258546 (= e!167581 e!167580)))

(declare-fun c!43822 () Bool)

(assert (=> b!258546 (= c!43822 (validKeyInArray!0 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258547 () Bool)

(declare-fun call!24593 () (_ BitVec 32))

(assert (=> b!258547 (= e!167580 call!24593)))

(declare-fun bm!24590 () Bool)

(assert (=> bm!24590 (= call!24593 (arrayCountValidKeys!0 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 (_keys!6931 thiss!1504))))))

(declare-fun b!258548 () Bool)

(assert (=> b!258548 (= e!167581 #b00000000000000000000000000000000)))

(declare-fun b!258549 () Bool)

(assert (=> b!258549 (= e!167580 (bvadd #b00000000000000000000000000000001 call!24593))))

(declare-fun d!62035 () Bool)

(declare-fun lt!130143 () (_ BitVec 32))

(assert (=> d!62035 (and (bvsge lt!130143 #b00000000000000000000000000000000) (bvsle lt!130143 (bvsub (size!6292 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!62035 (= lt!130143 e!167581)))

(declare-fun c!43821 () Bool)

(assert (=> d!62035 (= c!43821 (bvsge #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> d!62035 (and (bvsle #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6292 (_keys!6931 thiss!1504)) (size!6292 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))))))))

(assert (=> d!62035 (= (arrayCountValidKeys!0 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) lt!130143)))

(assert (= (and d!62035 c!43821) b!258548))

(assert (= (and d!62035 (not c!43821)) b!258546))

(assert (= (and b!258546 c!43822) b!258549))

(assert (= (and b!258546 (not c!43822)) b!258547))

(assert (= (or b!258549 b!258547) bm!24590))

(assert (=> b!258546 m!273911))

(assert (=> b!258546 m!273911))

(assert (=> b!258546 m!273915))

(declare-fun m!273931 () Bool)

(assert (=> bm!24590 m!273931))

(assert (=> b!258220 d!62035))

(assert (=> b!258220 d!61893))

(declare-fun d!62037 () Bool)

(declare-fun res!126423 () Bool)

(declare-fun e!167586 () Bool)

(assert (=> d!62037 (=> res!126423 e!167586)))

(assert (=> d!62037 (= res!126423 (and ((_ is Cons!3807) (toList!1938 lt!129825)) (= (_1!2477 (h!4469 (toList!1938 lt!129825))) key!932)))))

(assert (=> d!62037 (= (containsKey!305 (toList!1938 lt!129825) key!932) e!167586)))

(declare-fun b!258554 () Bool)

(declare-fun e!167587 () Bool)

(assert (=> b!258554 (= e!167586 e!167587)))

(declare-fun res!126424 () Bool)

(assert (=> b!258554 (=> (not res!126424) (not e!167587))))

(assert (=> b!258554 (= res!126424 (and (or (not ((_ is Cons!3807) (toList!1938 lt!129825))) (bvsle (_1!2477 (h!4469 (toList!1938 lt!129825))) key!932)) ((_ is Cons!3807) (toList!1938 lt!129825)) (bvslt (_1!2477 (h!4469 (toList!1938 lt!129825))) key!932)))))

(declare-fun b!258555 () Bool)

(assert (=> b!258555 (= e!167587 (containsKey!305 (t!8874 (toList!1938 lt!129825)) key!932))))

(assert (= (and d!62037 (not res!126423)) b!258554))

(assert (= (and b!258554 res!126424) b!258555))

(declare-fun m!273933 () Bool)

(assert (=> b!258555 m!273933))

(assert (=> d!61881 d!62037))

(declare-fun d!62039 () Bool)

(assert (=> d!62039 (= (apply!255 (+!692 lt!129973 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504))) lt!129971) (apply!255 lt!129973 lt!129971))))

(declare-fun lt!130144 () Unit!8017)

(assert (=> d!62039 (= lt!130144 (choose!1249 lt!129973 lt!129970 (minValue!4602 thiss!1504) lt!129971))))

(declare-fun e!167588 () Bool)

(assert (=> d!62039 e!167588))

(declare-fun res!126425 () Bool)

(assert (=> d!62039 (=> (not res!126425) (not e!167588))))

(assert (=> d!62039 (= res!126425 (contains!1878 lt!129973 lt!129971))))

(assert (=> d!62039 (= (addApplyDifferent!231 lt!129973 lt!129970 (minValue!4602 thiss!1504) lt!129971) lt!130144)))

(declare-fun b!258556 () Bool)

(assert (=> b!258556 (= e!167588 (not (= lt!129971 lt!129970)))))

(assert (= (and d!62039 res!126425) b!258556))

(assert (=> d!62039 m!273547))

(assert (=> d!62039 m!273549))

(declare-fun m!273935 () Bool)

(assert (=> d!62039 m!273935))

(declare-fun m!273937 () Bool)

(assert (=> d!62039 m!273937))

(assert (=> d!62039 m!273547))

(assert (=> d!62039 m!273539))

(assert (=> b!258201 d!62039))

(declare-fun d!62041 () Bool)

(declare-fun e!167590 () Bool)

(assert (=> d!62041 e!167590))

(declare-fun res!126429 () Bool)

(assert (=> d!62041 (=> (not res!126429) (not e!167590))))

(declare-fun lt!130146 () ListLongMap!3845)

(assert (=> d!62041 (= res!126429 (not (contains!1878 lt!130146 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!167593 () ListLongMap!3845)

(assert (=> d!62041 (= lt!130146 e!167593)))

(declare-fun c!43826 () Bool)

(assert (=> d!62041 (= c!43826 (bvsge #b00000000000000000000000000000000 (size!6292 lt!129820)))))

(assert (=> d!62041 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!62041 (= (getCurrentListMapNoExtraKeys!577 lt!129820 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) lt!130146)))

(declare-fun call!24594 () ListLongMap!3845)

(declare-fun bm!24591 () Bool)

(assert (=> bm!24591 (= call!24594 (getCurrentListMapNoExtraKeys!577 lt!129820 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4761 thiss!1504)))))

(declare-fun b!258557 () Bool)

(declare-fun e!167594 () Bool)

(declare-fun e!167589 () Bool)

(assert (=> b!258557 (= e!167594 e!167589)))

(declare-fun c!43824 () Bool)

(assert (=> b!258557 (= c!43824 (bvslt #b00000000000000000000000000000000 (size!6292 lt!129820)))))

(declare-fun b!258558 () Bool)

(assert (=> b!258558 (= e!167593 (ListLongMap!3846 Nil!3808))))

(declare-fun b!258559 () Bool)

(assert (=> b!258559 (= e!167590 e!167594)))

(declare-fun c!43823 () Bool)

(declare-fun e!167592 () Bool)

(assert (=> b!258559 (= c!43823 e!167592)))

(declare-fun res!126426 () Bool)

(assert (=> b!258559 (=> (not res!126426) (not e!167592))))

(assert (=> b!258559 (= res!126426 (bvslt #b00000000000000000000000000000000 (size!6292 lt!129820)))))

(declare-fun b!258560 () Bool)

(declare-fun e!167591 () Bool)

(assert (=> b!258560 (= e!167594 e!167591)))

(assert (=> b!258560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 lt!129820)))))

(declare-fun res!126427 () Bool)

(assert (=> b!258560 (= res!126427 (contains!1878 lt!130146 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(assert (=> b!258560 (=> (not res!126427) (not e!167591))))

(declare-fun b!258561 () Bool)

(declare-fun res!126428 () Bool)

(assert (=> b!258561 (=> (not res!126428) (not e!167590))))

(assert (=> b!258561 (= res!126428 (not (contains!1878 lt!130146 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258562 () Bool)

(assert (=> b!258562 (= e!167589 (isEmpty!532 lt!130146))))

(declare-fun b!258563 () Bool)

(declare-fun e!167595 () ListLongMap!3845)

(assert (=> b!258563 (= e!167595 call!24594)))

(declare-fun b!258564 () Bool)

(assert (=> b!258564 (= e!167589 (= lt!130146 (getCurrentListMapNoExtraKeys!577 lt!129820 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4761 thiss!1504))))))

(declare-fun b!258565 () Bool)

(assert (=> b!258565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 lt!129820)))))

(assert (=> b!258565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6291 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))))))))

(assert (=> b!258565 (= e!167591 (= (apply!255 lt!130146 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)) (get!3056 (select (arr!5944 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!258566 () Bool)

(declare-fun lt!130149 () Unit!8017)

(declare-fun lt!130151 () Unit!8017)

(assert (=> b!258566 (= lt!130149 lt!130151)))

(declare-fun lt!130148 () (_ BitVec 64))

(declare-fun lt!130147 () (_ BitVec 64))

(declare-fun lt!130145 () V!8451)

(declare-fun lt!130150 () ListLongMap!3845)

(assert (=> b!258566 (not (contains!1878 (+!692 lt!130150 (tuple2!4933 lt!130147 lt!130145)) lt!130148))))

(assert (=> b!258566 (= lt!130151 (addStillNotContains!125 lt!130150 lt!130147 lt!130145 lt!130148))))

(assert (=> b!258566 (= lt!130148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!258566 (= lt!130145 (get!3056 (select (arr!5944 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258566 (= lt!130147 (select (arr!5945 lt!129820) #b00000000000000000000000000000000))))

(assert (=> b!258566 (= lt!130150 call!24594)))

(assert (=> b!258566 (= e!167595 (+!692 call!24594 (tuple2!4933 (select (arr!5945 lt!129820) #b00000000000000000000000000000000) (get!3056 (select (arr!5944 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!258567 () Bool)

(assert (=> b!258567 (= e!167592 (validKeyInArray!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(assert (=> b!258567 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!258568 () Bool)

(assert (=> b!258568 (= e!167593 e!167595)))

(declare-fun c!43825 () Bool)

(assert (=> b!258568 (= c!43825 (validKeyInArray!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(assert (= (and d!62041 c!43826) b!258558))

(assert (= (and d!62041 (not c!43826)) b!258568))

(assert (= (and b!258568 c!43825) b!258566))

(assert (= (and b!258568 (not c!43825)) b!258563))

(assert (= (or b!258566 b!258563) bm!24591))

(assert (= (and d!62041 res!126429) b!258561))

(assert (= (and b!258561 res!126428) b!258559))

(assert (= (and b!258559 res!126426) b!258567))

(assert (= (and b!258559 c!43823) b!258560))

(assert (= (and b!258559 (not c!43823)) b!258557))

(assert (= (and b!258560 res!126427) b!258565))

(assert (= (and b!258557 c!43824) b!258564))

(assert (= (and b!258557 (not c!43824)) b!258562))

(declare-fun b_lambda!8207 () Bool)

(assert (=> (not b_lambda!8207) (not b!258565)))

(assert (=> b!258565 t!8879))

(declare-fun b_and!13827 () Bool)

(assert (= b_and!13825 (and (=> t!8879 result!5391) b_and!13827)))

(declare-fun b_lambda!8209 () Bool)

(assert (=> (not b_lambda!8209) (not b!258566)))

(assert (=> b!258566 t!8879))

(declare-fun b_and!13829 () Bool)

(assert (= b_and!13827 (and (=> t!8879 result!5391) b_and!13829)))

(declare-fun m!273939 () Bool)

(assert (=> bm!24591 m!273939))

(assert (=> b!258568 m!273529))

(assert (=> b!258568 m!273529))

(assert (=> b!258568 m!273533))

(declare-fun m!273941 () Bool)

(assert (=> b!258562 m!273941))

(declare-fun m!273943 () Bool)

(assert (=> b!258566 m!273943))

(assert (=> b!258566 m!273575))

(declare-fun m!273945 () Bool)

(assert (=> b!258566 m!273945))

(assert (=> b!258566 m!273945))

(declare-fun m!273947 () Bool)

(assert (=> b!258566 m!273947))

(assert (=> b!258566 m!273529))

(assert (=> b!258566 m!273575))

(assert (=> b!258566 m!273505))

(assert (=> b!258566 m!273577))

(assert (=> b!258566 m!273505))

(declare-fun m!273949 () Bool)

(assert (=> b!258566 m!273949))

(declare-fun m!273951 () Bool)

(assert (=> d!62041 m!273951))

(assert (=> d!62041 m!273351))

(assert (=> b!258567 m!273529))

(assert (=> b!258567 m!273529))

(assert (=> b!258567 m!273533))

(assert (=> b!258564 m!273939))

(assert (=> b!258565 m!273575))

(assert (=> b!258565 m!273529))

(assert (=> b!258565 m!273575))

(assert (=> b!258565 m!273505))

(assert (=> b!258565 m!273577))

(assert (=> b!258565 m!273529))

(declare-fun m!273953 () Bool)

(assert (=> b!258565 m!273953))

(assert (=> b!258565 m!273505))

(declare-fun m!273955 () Bool)

(assert (=> b!258561 m!273955))

(assert (=> b!258560 m!273529))

(assert (=> b!258560 m!273529))

(declare-fun m!273957 () Bool)

(assert (=> b!258560 m!273957))

(assert (=> b!258201 d!62041))

(declare-fun d!62043 () Bool)

(assert (=> d!62043 (= (apply!255 (+!692 lt!129973 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504))) lt!129971) (get!3057 (getValueByKey!313 (toList!1938 (+!692 lt!129973 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504)))) lt!129971)))))

(declare-fun bs!9105 () Bool)

(assert (= bs!9105 d!62043))

(declare-fun m!273959 () Bool)

(assert (=> bs!9105 m!273959))

(assert (=> bs!9105 m!273959))

(declare-fun m!273961 () Bool)

(assert (=> bs!9105 m!273961))

(assert (=> b!258201 d!62043))

(declare-fun d!62045 () Bool)

(assert (=> d!62045 (contains!1878 (+!692 lt!129969 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504))) lt!129965)))

(declare-fun lt!130152 () Unit!8017)

(assert (=> d!62045 (= lt!130152 (choose!1248 lt!129969 lt!129978 (zeroValue!4602 thiss!1504) lt!129965))))

(assert (=> d!62045 (contains!1878 lt!129969 lt!129965)))

(assert (=> d!62045 (= (addStillContains!231 lt!129969 lt!129978 (zeroValue!4602 thiss!1504) lt!129965) lt!130152)))

(declare-fun bs!9106 () Bool)

(assert (= bs!9106 d!62045))

(assert (=> bs!9106 m!273551))

(assert (=> bs!9106 m!273551))

(assert (=> bs!9106 m!273553))

(declare-fun m!273963 () Bool)

(assert (=> bs!9106 m!273963))

(declare-fun m!273965 () Bool)

(assert (=> bs!9106 m!273965))

(assert (=> b!258201 d!62045))

(declare-fun d!62047 () Bool)

(declare-fun e!167596 () Bool)

(assert (=> d!62047 e!167596))

(declare-fun res!126430 () Bool)

(assert (=> d!62047 (=> (not res!126430) (not e!167596))))

(declare-fun lt!130156 () ListLongMap!3845)

(assert (=> d!62047 (= res!126430 (contains!1878 lt!130156 (_1!2477 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504)))))))

(declare-fun lt!130155 () List!3811)

(assert (=> d!62047 (= lt!130156 (ListLongMap!3846 lt!130155))))

(declare-fun lt!130153 () Unit!8017)

(declare-fun lt!130154 () Unit!8017)

(assert (=> d!62047 (= lt!130153 lt!130154)))

(assert (=> d!62047 (= (getValueByKey!313 lt!130155 (_1!2477 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!62047 (= lt!130154 (lemmaContainsTupThenGetReturnValue!169 lt!130155 (_1!2477 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!62047 (= lt!130155 (insertStrictlySorted!172 (toList!1938 lt!129977) (_1!2477 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!62047 (= (+!692 lt!129977 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504))) lt!130156)))

(declare-fun b!258569 () Bool)

(declare-fun res!126431 () Bool)

(assert (=> b!258569 (=> (not res!126431) (not e!167596))))

(assert (=> b!258569 (= res!126431 (= (getValueByKey!313 (toList!1938 lt!130156) (_1!2477 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504))))))))

(declare-fun b!258570 () Bool)

(assert (=> b!258570 (= e!167596 (contains!1880 (toList!1938 lt!130156) (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504))))))

(assert (= (and d!62047 res!126430) b!258569))

(assert (= (and b!258569 res!126431) b!258570))

(declare-fun m!273967 () Bool)

(assert (=> d!62047 m!273967))

(declare-fun m!273969 () Bool)

(assert (=> d!62047 m!273969))

(declare-fun m!273971 () Bool)

(assert (=> d!62047 m!273971))

(declare-fun m!273973 () Bool)

(assert (=> d!62047 m!273973))

(declare-fun m!273975 () Bool)

(assert (=> b!258569 m!273975))

(declare-fun m!273977 () Bool)

(assert (=> b!258570 m!273977))

(assert (=> b!258201 d!62047))

(declare-fun d!62049 () Bool)

(assert (=> d!62049 (= (apply!255 (+!692 lt!129977 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504))) lt!129967) (get!3057 (getValueByKey!313 (toList!1938 (+!692 lt!129977 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504)))) lt!129967)))))

(declare-fun bs!9107 () Bool)

(assert (= bs!9107 d!62049))

(declare-fun m!273979 () Bool)

(assert (=> bs!9107 m!273979))

(assert (=> bs!9107 m!273979))

(declare-fun m!273981 () Bool)

(assert (=> bs!9107 m!273981))

(assert (=> b!258201 d!62049))

(declare-fun d!62051 () Bool)

(declare-fun e!167597 () Bool)

(assert (=> d!62051 e!167597))

(declare-fun res!126432 () Bool)

(assert (=> d!62051 (=> res!126432 e!167597)))

(declare-fun lt!130157 () Bool)

(assert (=> d!62051 (= res!126432 (not lt!130157))))

(declare-fun lt!130160 () Bool)

(assert (=> d!62051 (= lt!130157 lt!130160)))

(declare-fun lt!130158 () Unit!8017)

(declare-fun e!167598 () Unit!8017)

(assert (=> d!62051 (= lt!130158 e!167598)))

(declare-fun c!43827 () Bool)

(assert (=> d!62051 (= c!43827 lt!130160)))

(assert (=> d!62051 (= lt!130160 (containsKey!305 (toList!1938 (+!692 lt!129969 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504)))) lt!129965))))

(assert (=> d!62051 (= (contains!1878 (+!692 lt!129969 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504))) lt!129965) lt!130157)))

(declare-fun b!258571 () Bool)

(declare-fun lt!130159 () Unit!8017)

(assert (=> b!258571 (= e!167598 lt!130159)))

(assert (=> b!258571 (= lt!130159 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 (+!692 lt!129969 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504)))) lt!129965))))

(assert (=> b!258571 (isDefined!254 (getValueByKey!313 (toList!1938 (+!692 lt!129969 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504)))) lt!129965))))

(declare-fun b!258572 () Bool)

(declare-fun Unit!8034 () Unit!8017)

(assert (=> b!258572 (= e!167598 Unit!8034)))

(declare-fun b!258573 () Bool)

(assert (=> b!258573 (= e!167597 (isDefined!254 (getValueByKey!313 (toList!1938 (+!692 lt!129969 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504)))) lt!129965)))))

(assert (= (and d!62051 c!43827) b!258571))

(assert (= (and d!62051 (not c!43827)) b!258572))

(assert (= (and d!62051 (not res!126432)) b!258573))

(declare-fun m!273983 () Bool)

(assert (=> d!62051 m!273983))

(declare-fun m!273985 () Bool)

(assert (=> b!258571 m!273985))

(declare-fun m!273987 () Bool)

(assert (=> b!258571 m!273987))

(assert (=> b!258571 m!273987))

(declare-fun m!273989 () Bool)

(assert (=> b!258571 m!273989))

(assert (=> b!258573 m!273987))

(assert (=> b!258573 m!273987))

(assert (=> b!258573 m!273989))

(assert (=> b!258201 d!62051))

(declare-fun d!62053 () Bool)

(declare-fun e!167599 () Bool)

(assert (=> d!62053 e!167599))

(declare-fun res!126433 () Bool)

(assert (=> d!62053 (=> (not res!126433) (not e!167599))))

(declare-fun lt!130164 () ListLongMap!3845)

(assert (=> d!62053 (= res!126433 (contains!1878 lt!130164 (_1!2477 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504)))))))

(declare-fun lt!130163 () List!3811)

(assert (=> d!62053 (= lt!130164 (ListLongMap!3846 lt!130163))))

(declare-fun lt!130161 () Unit!8017)

(declare-fun lt!130162 () Unit!8017)

(assert (=> d!62053 (= lt!130161 lt!130162)))

(assert (=> d!62053 (= (getValueByKey!313 lt!130163 (_1!2477 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504)))))))

(assert (=> d!62053 (= lt!130162 (lemmaContainsTupThenGetReturnValue!169 lt!130163 (_1!2477 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504)))))))

(assert (=> d!62053 (= lt!130163 (insertStrictlySorted!172 (toList!1938 lt!129962) (_1!2477 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504)))))))

(assert (=> d!62053 (= (+!692 lt!129962 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504))) lt!130164)))

(declare-fun b!258574 () Bool)

(declare-fun res!126434 () Bool)

(assert (=> b!258574 (=> (not res!126434) (not e!167599))))

(assert (=> b!258574 (= res!126434 (= (getValueByKey!313 (toList!1938 lt!130164) (_1!2477 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504))))))))

(declare-fun b!258575 () Bool)

(assert (=> b!258575 (= e!167599 (contains!1880 (toList!1938 lt!130164) (tuple2!4933 lt!129964 (minValue!4602 thiss!1504))))))

(assert (= (and d!62053 res!126433) b!258574))

(assert (= (and b!258574 res!126434) b!258575))

(declare-fun m!273991 () Bool)

(assert (=> d!62053 m!273991))

(declare-fun m!273993 () Bool)

(assert (=> d!62053 m!273993))

(declare-fun m!273995 () Bool)

(assert (=> d!62053 m!273995))

(declare-fun m!273997 () Bool)

(assert (=> d!62053 m!273997))

(declare-fun m!273999 () Bool)

(assert (=> b!258574 m!273999))

(declare-fun m!274001 () Bool)

(assert (=> b!258575 m!274001))

(assert (=> b!258201 d!62053))

(declare-fun d!62055 () Bool)

(assert (=> d!62055 (= (apply!255 lt!129977 lt!129967) (get!3057 (getValueByKey!313 (toList!1938 lt!129977) lt!129967)))))

(declare-fun bs!9108 () Bool)

(assert (= bs!9108 d!62055))

(declare-fun m!274003 () Bool)

(assert (=> bs!9108 m!274003))

(assert (=> bs!9108 m!274003))

(declare-fun m!274005 () Bool)

(assert (=> bs!9108 m!274005))

(assert (=> b!258201 d!62055))

(declare-fun d!62057 () Bool)

(assert (=> d!62057 (= (apply!255 (+!692 lt!129977 (tuple2!4933 lt!129966 (zeroValue!4602 thiss!1504))) lt!129967) (apply!255 lt!129977 lt!129967))))

(declare-fun lt!130165 () Unit!8017)

(assert (=> d!62057 (= lt!130165 (choose!1249 lt!129977 lt!129966 (zeroValue!4602 thiss!1504) lt!129967))))

(declare-fun e!167600 () Bool)

(assert (=> d!62057 e!167600))

(declare-fun res!126435 () Bool)

(assert (=> d!62057 (=> (not res!126435) (not e!167600))))

(assert (=> d!62057 (= res!126435 (contains!1878 lt!129977 lt!129967))))

(assert (=> d!62057 (= (addApplyDifferent!231 lt!129977 lt!129966 (zeroValue!4602 thiss!1504) lt!129967) lt!130165)))

(declare-fun b!258576 () Bool)

(assert (=> b!258576 (= e!167600 (not (= lt!129967 lt!129966)))))

(assert (= (and d!62057 res!126435) b!258576))

(assert (=> d!62057 m!273555))

(assert (=> d!62057 m!273557))

(declare-fun m!274007 () Bool)

(assert (=> d!62057 m!274007))

(declare-fun m!274009 () Bool)

(assert (=> d!62057 m!274009))

(assert (=> d!62057 m!273555))

(assert (=> d!62057 m!273543))

(assert (=> b!258201 d!62057))

(declare-fun d!62059 () Bool)

(assert (=> d!62059 (= (apply!255 (+!692 lt!129962 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504))) lt!129976) (get!3057 (getValueByKey!313 (toList!1938 (+!692 lt!129962 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504)))) lt!129976)))))

(declare-fun bs!9109 () Bool)

(assert (= bs!9109 d!62059))

(declare-fun m!274011 () Bool)

(assert (=> bs!9109 m!274011))

(assert (=> bs!9109 m!274011))

(declare-fun m!274013 () Bool)

(assert (=> bs!9109 m!274013))

(assert (=> b!258201 d!62059))

(declare-fun d!62061 () Bool)

(assert (=> d!62061 (= (apply!255 lt!129973 lt!129971) (get!3057 (getValueByKey!313 (toList!1938 lt!129973) lt!129971)))))

(declare-fun bs!9110 () Bool)

(assert (= bs!9110 d!62061))

(declare-fun m!274015 () Bool)

(assert (=> bs!9110 m!274015))

(assert (=> bs!9110 m!274015))

(declare-fun m!274017 () Bool)

(assert (=> bs!9110 m!274017))

(assert (=> b!258201 d!62061))

(declare-fun d!62063 () Bool)

(declare-fun e!167601 () Bool)

(assert (=> d!62063 e!167601))

(declare-fun res!126436 () Bool)

(assert (=> d!62063 (=> (not res!126436) (not e!167601))))

(declare-fun lt!130169 () ListLongMap!3845)

(assert (=> d!62063 (= res!126436 (contains!1878 lt!130169 (_1!2477 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504)))))))

(declare-fun lt!130168 () List!3811)

(assert (=> d!62063 (= lt!130169 (ListLongMap!3846 lt!130168))))

(declare-fun lt!130166 () Unit!8017)

(declare-fun lt!130167 () Unit!8017)

(assert (=> d!62063 (= lt!130166 lt!130167)))

(assert (=> d!62063 (= (getValueByKey!313 lt!130168 (_1!2477 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504)))))))

(assert (=> d!62063 (= lt!130167 (lemmaContainsTupThenGetReturnValue!169 lt!130168 (_1!2477 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504)))))))

(assert (=> d!62063 (= lt!130168 (insertStrictlySorted!172 (toList!1938 lt!129973) (_1!2477 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504)))))))

(assert (=> d!62063 (= (+!692 lt!129973 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504))) lt!130169)))

(declare-fun b!258577 () Bool)

(declare-fun res!126437 () Bool)

(assert (=> b!258577 (=> (not res!126437) (not e!167601))))

(assert (=> b!258577 (= res!126437 (= (getValueByKey!313 (toList!1938 lt!130169) (_1!2477 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129970 (minValue!4602 thiss!1504))))))))

(declare-fun b!258578 () Bool)

(assert (=> b!258578 (= e!167601 (contains!1880 (toList!1938 lt!130169) (tuple2!4933 lt!129970 (minValue!4602 thiss!1504))))))

(assert (= (and d!62063 res!126436) b!258577))

(assert (= (and b!258577 res!126437) b!258578))

(declare-fun m!274019 () Bool)

(assert (=> d!62063 m!274019))

(declare-fun m!274021 () Bool)

(assert (=> d!62063 m!274021))

(declare-fun m!274023 () Bool)

(assert (=> d!62063 m!274023))

(declare-fun m!274025 () Bool)

(assert (=> d!62063 m!274025))

(declare-fun m!274027 () Bool)

(assert (=> b!258577 m!274027))

(declare-fun m!274029 () Bool)

(assert (=> b!258578 m!274029))

(assert (=> b!258201 d!62063))

(declare-fun d!62065 () Bool)

(assert (=> d!62065 (= (apply!255 lt!129962 lt!129976) (get!3057 (getValueByKey!313 (toList!1938 lt!129962) lt!129976)))))

(declare-fun bs!9111 () Bool)

(assert (= bs!9111 d!62065))

(declare-fun m!274031 () Bool)

(assert (=> bs!9111 m!274031))

(assert (=> bs!9111 m!274031))

(declare-fun m!274033 () Bool)

(assert (=> bs!9111 m!274033))

(assert (=> b!258201 d!62065))

(declare-fun d!62067 () Bool)

(declare-fun e!167602 () Bool)

(assert (=> d!62067 e!167602))

(declare-fun res!126438 () Bool)

(assert (=> d!62067 (=> (not res!126438) (not e!167602))))

(declare-fun lt!130173 () ListLongMap!3845)

(assert (=> d!62067 (= res!126438 (contains!1878 lt!130173 (_1!2477 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504)))))))

(declare-fun lt!130172 () List!3811)

(assert (=> d!62067 (= lt!130173 (ListLongMap!3846 lt!130172))))

(declare-fun lt!130170 () Unit!8017)

(declare-fun lt!130171 () Unit!8017)

(assert (=> d!62067 (= lt!130170 lt!130171)))

(assert (=> d!62067 (= (getValueByKey!313 lt!130172 (_1!2477 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!62067 (= lt!130171 (lemmaContainsTupThenGetReturnValue!169 lt!130172 (_1!2477 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!62067 (= lt!130172 (insertStrictlySorted!172 (toList!1938 lt!129969) (_1!2477 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504)))))))

(assert (=> d!62067 (= (+!692 lt!129969 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504))) lt!130173)))

(declare-fun b!258579 () Bool)

(declare-fun res!126439 () Bool)

(assert (=> b!258579 (=> (not res!126439) (not e!167602))))

(assert (=> b!258579 (= res!126439 (= (getValueByKey!313 (toList!1938 lt!130173) (_1!2477 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504))))))))

(declare-fun b!258580 () Bool)

(assert (=> b!258580 (= e!167602 (contains!1880 (toList!1938 lt!130173) (tuple2!4933 lt!129978 (zeroValue!4602 thiss!1504))))))

(assert (= (and d!62067 res!126438) b!258579))

(assert (= (and b!258579 res!126439) b!258580))

(declare-fun m!274035 () Bool)

(assert (=> d!62067 m!274035))

(declare-fun m!274037 () Bool)

(assert (=> d!62067 m!274037))

(declare-fun m!274039 () Bool)

(assert (=> d!62067 m!274039))

(declare-fun m!274041 () Bool)

(assert (=> d!62067 m!274041))

(declare-fun m!274043 () Bool)

(assert (=> b!258579 m!274043))

(declare-fun m!274045 () Bool)

(assert (=> b!258580 m!274045))

(assert (=> b!258201 d!62067))

(declare-fun d!62069 () Bool)

(assert (=> d!62069 (= (apply!255 (+!692 lt!129962 (tuple2!4933 lt!129964 (minValue!4602 thiss!1504))) lt!129976) (apply!255 lt!129962 lt!129976))))

(declare-fun lt!130174 () Unit!8017)

(assert (=> d!62069 (= lt!130174 (choose!1249 lt!129962 lt!129964 (minValue!4602 thiss!1504) lt!129976))))

(declare-fun e!167603 () Bool)

(assert (=> d!62069 e!167603))

(declare-fun res!126440 () Bool)

(assert (=> d!62069 (=> (not res!126440) (not e!167603))))

(assert (=> d!62069 (= res!126440 (contains!1878 lt!129962 lt!129976))))

(assert (=> d!62069 (= (addApplyDifferent!231 lt!129962 lt!129964 (minValue!4602 thiss!1504) lt!129976) lt!130174)))

(declare-fun b!258581 () Bool)

(assert (=> b!258581 (= e!167603 (not (= lt!129976 lt!129964)))))

(assert (= (and d!62069 res!126440) b!258581))

(assert (=> d!62069 m!273535))

(assert (=> d!62069 m!273545))

(declare-fun m!274047 () Bool)

(assert (=> d!62069 m!274047))

(declare-fun m!274049 () Bool)

(assert (=> d!62069 m!274049))

(assert (=> d!62069 m!273535))

(assert (=> d!62069 m!273537))

(assert (=> b!258201 d!62069))

(declare-fun d!62071 () Bool)

(assert (=> d!62071 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258218 d!62071))

(assert (=> d!61887 d!61897))

(declare-fun d!62073 () Bool)

(declare-fun e!167604 () Bool)

(assert (=> d!62073 e!167604))

(declare-fun res!126441 () Bool)

(assert (=> d!62073 (=> (not res!126441) (not e!167604))))

(declare-fun lt!130178 () ListLongMap!3845)

(assert (=> d!62073 (= res!126441 (contains!1878 lt!130178 (_1!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(declare-fun lt!130177 () List!3811)

(assert (=> d!62073 (= lt!130178 (ListLongMap!3846 lt!130177))))

(declare-fun lt!130175 () Unit!8017)

(declare-fun lt!130176 () Unit!8017)

(assert (=> d!62073 (= lt!130175 lt!130176)))

(assert (=> d!62073 (= (getValueByKey!313 lt!130177 (_1!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(assert (=> d!62073 (= lt!130176 (lemmaContainsTupThenGetReturnValue!169 lt!130177 (_1!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(assert (=> d!62073 (= lt!130177 (insertStrictlySorted!172 (toList!1938 call!24555) (_1!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(assert (=> d!62073 (= (+!692 call!24555 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))) lt!130178)))

(declare-fun b!258582 () Bool)

(declare-fun res!126442 () Bool)

(assert (=> b!258582 (=> (not res!126442) (not e!167604))))

(assert (=> b!258582 (= res!126442 (= (getValueByKey!313 (toList!1938 lt!130178) (_1!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))))

(declare-fun b!258583 () Bool)

(assert (=> b!258583 (= e!167604 (contains!1880 (toList!1938 lt!130178) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))

(assert (= (and d!62073 res!126441) b!258582))

(assert (= (and b!258582 res!126442) b!258583))

(declare-fun m!274051 () Bool)

(assert (=> d!62073 m!274051))

(declare-fun m!274053 () Bool)

(assert (=> d!62073 m!274053))

(declare-fun m!274055 () Bool)

(assert (=> d!62073 m!274055))

(declare-fun m!274057 () Bool)

(assert (=> d!62073 m!274057))

(declare-fun m!274059 () Bool)

(assert (=> b!258582 m!274059))

(declare-fun m!274061 () Bool)

(assert (=> b!258583 m!274061))

(assert (=> b!258193 d!62073))

(declare-fun d!62075 () Bool)

(assert (=> d!62075 (= (apply!255 lt!129981 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3057 (getValueByKey!313 (toList!1938 lt!129981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9112 () Bool)

(assert (= bs!9112 d!62075))

(declare-fun m!274063 () Bool)

(assert (=> bs!9112 m!274063))

(assert (=> bs!9112 m!274063))

(declare-fun m!274065 () Bool)

(assert (=> bs!9112 m!274065))

(assert (=> b!258207 d!62075))

(declare-fun d!62077 () Bool)

(declare-fun e!167605 () Bool)

(assert (=> d!62077 e!167605))

(declare-fun res!126443 () Bool)

(assert (=> d!62077 (=> res!126443 e!167605)))

(declare-fun lt!130179 () Bool)

(assert (=> d!62077 (= res!126443 (not lt!130179))))

(declare-fun lt!130182 () Bool)

(assert (=> d!62077 (= lt!130179 lt!130182)))

(declare-fun lt!130180 () Unit!8017)

(declare-fun e!167606 () Unit!8017)

(assert (=> d!62077 (= lt!130180 e!167606)))

(declare-fun c!43828 () Bool)

(assert (=> d!62077 (= c!43828 lt!130182)))

(assert (=> d!62077 (= lt!130182 (containsKey!305 (toList!1938 lt!129981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62077 (= (contains!1878 lt!129981 #b0000000000000000000000000000000000000000000000000000000000000000) lt!130179)))

(declare-fun b!258584 () Bool)

(declare-fun lt!130181 () Unit!8017)

(assert (=> b!258584 (= e!167606 lt!130181)))

(assert (=> b!258584 (= lt!130181 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 lt!129981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258584 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258585 () Bool)

(declare-fun Unit!8035 () Unit!8017)

(assert (=> b!258585 (= e!167606 Unit!8035)))

(declare-fun b!258586 () Bool)

(assert (=> b!258586 (= e!167605 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62077 c!43828) b!258584))

(assert (= (and d!62077 (not c!43828)) b!258585))

(assert (= (and d!62077 (not res!126443)) b!258586))

(declare-fun m!274067 () Bool)

(assert (=> d!62077 m!274067))

(declare-fun m!274069 () Bool)

(assert (=> b!258584 m!274069))

(assert (=> b!258584 m!274063))

(assert (=> b!258584 m!274063))

(declare-fun m!274071 () Bool)

(assert (=> b!258584 m!274071))

(assert (=> b!258586 m!274063))

(assert (=> b!258586 m!274063))

(assert (=> b!258586 m!274071))

(assert (=> bm!24549 d!62077))

(assert (=> bm!24571 d!61901))

(declare-fun d!62079 () Bool)

(assert (=> d!62079 (arrayContainsKey!0 lt!129820 lt!130021 #b00000000000000000000000000000000)))

(declare-fun lt!130183 () Unit!8017)

(assert (=> d!62079 (= lt!130183 (choose!13 lt!129820 lt!130021 #b00000000000000000000000000000000))))

(assert (=> d!62079 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!62079 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129820 lt!130021 #b00000000000000000000000000000000) lt!130183)))

(declare-fun bs!9113 () Bool)

(assert (= bs!9113 d!62079))

(assert (=> bs!9113 m!273641))

(declare-fun m!274073 () Bool)

(assert (=> bs!9113 m!274073))

(assert (=> b!258289 d!62079))

(declare-fun d!62081 () Bool)

(declare-fun res!126444 () Bool)

(declare-fun e!167607 () Bool)

(assert (=> d!62081 (=> res!126444 e!167607)))

(assert (=> d!62081 (= res!126444 (= (select (arr!5945 lt!129820) #b00000000000000000000000000000000) lt!130021))))

(assert (=> d!62081 (= (arrayContainsKey!0 lt!129820 lt!130021 #b00000000000000000000000000000000) e!167607)))

(declare-fun b!258587 () Bool)

(declare-fun e!167608 () Bool)

(assert (=> b!258587 (= e!167607 e!167608)))

(declare-fun res!126445 () Bool)

(assert (=> b!258587 (=> (not res!126445) (not e!167608))))

(assert (=> b!258587 (= res!126445 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 lt!129820)))))

(declare-fun b!258588 () Bool)

(assert (=> b!258588 (= e!167608 (arrayContainsKey!0 lt!129820 lt!130021 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62081 (not res!126444)) b!258587))

(assert (= (and b!258587 res!126445) b!258588))

(assert (=> d!62081 m!273529))

(declare-fun m!274075 () Bool)

(assert (=> b!258588 m!274075))

(assert (=> b!258289 d!62081))

(declare-fun d!62083 () Bool)

(declare-fun lt!130186 () SeekEntryResult!1174)

(assert (=> d!62083 (and (or ((_ is Undefined!1174) lt!130186) (not ((_ is Found!1174) lt!130186)) (and (bvsge (index!6867 lt!130186) #b00000000000000000000000000000000) (bvslt (index!6867 lt!130186) (size!6292 lt!129820)))) (or ((_ is Undefined!1174) lt!130186) ((_ is Found!1174) lt!130186) (not ((_ is MissingZero!1174) lt!130186)) (and (bvsge (index!6866 lt!130186) #b00000000000000000000000000000000) (bvslt (index!6866 lt!130186) (size!6292 lt!129820)))) (or ((_ is Undefined!1174) lt!130186) ((_ is Found!1174) lt!130186) ((_ is MissingZero!1174) lt!130186) (not ((_ is MissingVacant!1174) lt!130186)) (and (bvsge (index!6869 lt!130186) #b00000000000000000000000000000000) (bvslt (index!6869 lt!130186) (size!6292 lt!129820)))) (or ((_ is Undefined!1174) lt!130186) (ite ((_ is Found!1174) lt!130186) (= (select (arr!5945 lt!129820) (index!6867 lt!130186)) (select (arr!5945 lt!129820) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1174) lt!130186) (= (select (arr!5945 lt!129820) (index!6866 lt!130186)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1174) lt!130186) (= (select (arr!5945 lt!129820) (index!6869 lt!130186)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!167611 () SeekEntryResult!1174)

(assert (=> d!62083 (= lt!130186 e!167611)))

(declare-fun c!43829 () Bool)

(declare-fun lt!130184 () SeekEntryResult!1174)

(assert (=> d!62083 (= c!43829 (and ((_ is Intermediate!1174) lt!130184) (undefined!1986 lt!130184)))))

(assert (=> d!62083 (= lt!130184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000) (mask!11058 thiss!1504)) (select (arr!5945 lt!129820) #b00000000000000000000000000000000) lt!129820 (mask!11058 thiss!1504)))))

(assert (=> d!62083 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!62083 (= (seekEntryOrOpen!0 (select (arr!5945 lt!129820) #b00000000000000000000000000000000) lt!129820 (mask!11058 thiss!1504)) lt!130186)))

(declare-fun b!258589 () Bool)

(declare-fun c!43830 () Bool)

(declare-fun lt!130185 () (_ BitVec 64))

(assert (=> b!258589 (= c!43830 (= lt!130185 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167610 () SeekEntryResult!1174)

(declare-fun e!167609 () SeekEntryResult!1174)

(assert (=> b!258589 (= e!167610 e!167609)))

(declare-fun b!258590 () Bool)

(assert (=> b!258590 (= e!167610 (Found!1174 (index!6868 lt!130184)))))

(declare-fun b!258591 () Bool)

(assert (=> b!258591 (= e!167611 e!167610)))

(assert (=> b!258591 (= lt!130185 (select (arr!5945 lt!129820) (index!6868 lt!130184)))))

(declare-fun c!43831 () Bool)

(assert (=> b!258591 (= c!43831 (= lt!130185 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(declare-fun b!258592 () Bool)

(assert (=> b!258592 (= e!167609 (MissingZero!1174 (index!6868 lt!130184)))))

(declare-fun b!258593 () Bool)

(assert (=> b!258593 (= e!167611 Undefined!1174)))

(declare-fun b!258594 () Bool)

(assert (=> b!258594 (= e!167609 (seekKeyOrZeroReturnVacant!0 (x!25042 lt!130184) (index!6868 lt!130184) (index!6868 lt!130184) (select (arr!5945 lt!129820) #b00000000000000000000000000000000) lt!129820 (mask!11058 thiss!1504)))))

(assert (= (and d!62083 c!43829) b!258593))

(assert (= (and d!62083 (not c!43829)) b!258591))

(assert (= (and b!258591 c!43831) b!258590))

(assert (= (and b!258591 (not c!43831)) b!258589))

(assert (= (and b!258589 c!43830) b!258592))

(assert (= (and b!258589 (not c!43830)) b!258594))

(declare-fun m!274077 () Bool)

(assert (=> d!62083 m!274077))

(assert (=> d!62083 m!273529))

(declare-fun m!274079 () Bool)

(assert (=> d!62083 m!274079))

(declare-fun m!274081 () Bool)

(assert (=> d!62083 m!274081))

(declare-fun m!274083 () Bool)

(assert (=> d!62083 m!274083))

(assert (=> d!62083 m!273351))

(declare-fun m!274085 () Bool)

(assert (=> d!62083 m!274085))

(assert (=> d!62083 m!273529))

(assert (=> d!62083 m!274077))

(declare-fun m!274087 () Bool)

(assert (=> b!258591 m!274087))

(assert (=> b!258594 m!273529))

(declare-fun m!274089 () Bool)

(assert (=> b!258594 m!274089))

(assert (=> b!258289 d!62083))

(declare-fun d!62085 () Bool)

(assert (=> d!62085 (= (arrayCountValidKeys!0 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6931 thiss!1504) #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!62085 true))

(declare-fun _$84!36 () Unit!8017)

(assert (=> d!62085 (= (choose!1 (_keys!6931 thiss!1504) index!297 key!932) _$84!36)))

(declare-fun bs!9114 () Bool)

(assert (= bs!9114 d!62085))

(assert (=> bs!9114 m!273341))

(assert (=> bs!9114 m!273591))

(assert (=> bs!9114 m!273343))

(assert (=> d!61889 d!62085))

(declare-fun d!62087 () Bool)

(assert (=> d!62087 (= (apply!255 lt!129950 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)) (get!3057 (getValueByKey!313 (toList!1938 lt!129950) (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9115 () Bool)

(assert (= bs!9115 d!62087))

(assert (=> bs!9115 m!273457))

(assert (=> bs!9115 m!273887))

(assert (=> bs!9115 m!273887))

(declare-fun m!274091 () Bool)

(assert (=> bs!9115 m!274091))

(assert (=> b!258162 d!62087))

(declare-fun d!62089 () Bool)

(declare-fun c!43832 () Bool)

(assert (=> d!62089 (= c!43832 ((_ is ValueCellFull!2958) (select (arr!5944 (_values!4744 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!167612 () V!8451)

(assert (=> d!62089 (= (get!3056 (select (arr!5944 (_values!4744 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!167612)))

(declare-fun b!258595 () Bool)

(assert (=> b!258595 (= e!167612 (get!3058 (select (arr!5944 (_values!4744 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258596 () Bool)

(assert (=> b!258596 (= e!167612 (get!3059 (select (arr!5944 (_values!4744 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62089 c!43832) b!258595))

(assert (= (and d!62089 (not c!43832)) b!258596))

(assert (=> b!258595 m!273503))

(assert (=> b!258595 m!273505))

(declare-fun m!274093 () Bool)

(assert (=> b!258595 m!274093))

(assert (=> b!258596 m!273503))

(assert (=> b!258596 m!273505))

(declare-fun m!274095 () Bool)

(assert (=> b!258596 m!274095))

(assert (=> b!258162 d!62089))

(declare-fun b!258597 () Bool)

(declare-fun e!167613 () Bool)

(declare-fun call!24595 () Bool)

(assert (=> b!258597 (= e!167613 call!24595)))

(declare-fun d!62091 () Bool)

(declare-fun res!126447 () Bool)

(declare-fun e!167615 () Bool)

(assert (=> d!62091 (=> res!126447 e!167615)))

(assert (=> d!62091 (= res!126447 (bvsge #b00000000000000000000000000000000 (size!6292 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))))))))

(assert (=> d!62091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (mask!11058 thiss!1504)) e!167615)))

(declare-fun bm!24592 () Bool)

(assert (=> bm!24592 (= call!24595 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (mask!11058 thiss!1504)))))

(declare-fun b!258598 () Bool)

(declare-fun e!167614 () Bool)

(assert (=> b!258598 (= e!167613 e!167614)))

(declare-fun lt!130188 () (_ BitVec 64))

(assert (=> b!258598 (= lt!130188 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130189 () Unit!8017)

(assert (=> b!258598 (= lt!130189 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) lt!130188 #b00000000000000000000000000000000))))

(assert (=> b!258598 (arrayContainsKey!0 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) lt!130188 #b00000000000000000000000000000000)))

(declare-fun lt!130187 () Unit!8017)

(assert (=> b!258598 (= lt!130187 lt!130189)))

(declare-fun res!126446 () Bool)

(assert (=> b!258598 (= res!126446 (= (seekEntryOrOpen!0 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000) (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (mask!11058 thiss!1504)) (Found!1174 #b00000000000000000000000000000000)))))

(assert (=> b!258598 (=> (not res!126446) (not e!167614))))

(declare-fun b!258599 () Bool)

(assert (=> b!258599 (= e!167615 e!167613)))

(declare-fun c!43833 () Bool)

(assert (=> b!258599 (= c!43833 (validKeyInArray!0 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258600 () Bool)

(assert (=> b!258600 (= e!167614 call!24595)))

(assert (= (and d!62091 (not res!126447)) b!258599))

(assert (= (and b!258599 c!43833) b!258598))

(assert (= (and b!258599 (not c!43833)) b!258597))

(assert (= (and b!258598 res!126446) b!258600))

(assert (= (or b!258600 b!258597) bm!24592))

(declare-fun m!274097 () Bool)

(assert (=> bm!24592 m!274097))

(assert (=> b!258598 m!273911))

(declare-fun m!274099 () Bool)

(assert (=> b!258598 m!274099))

(declare-fun m!274101 () Bool)

(assert (=> b!258598 m!274101))

(assert (=> b!258598 m!273911))

(declare-fun m!274103 () Bool)

(assert (=> b!258598 m!274103))

(assert (=> b!258599 m!273911))

(assert (=> b!258599 m!273911))

(assert (=> b!258599 m!273915))

(assert (=> b!258250 d!62091))

(assert (=> b!258205 d!61995))

(assert (=> b!258276 d!61971))

(declare-fun b!258613 () Bool)

(declare-fun e!167622 () SeekEntryResult!1174)

(assert (=> b!258613 (= e!167622 (MissingVacant!1174 (index!6868 lt!129957)))))

(declare-fun lt!130194 () SeekEntryResult!1174)

(declare-fun d!62093 () Bool)

(assert (=> d!62093 (and (or ((_ is Undefined!1174) lt!130194) (not ((_ is Found!1174) lt!130194)) (and (bvsge (index!6867 lt!130194) #b00000000000000000000000000000000) (bvslt (index!6867 lt!130194) (size!6292 (_keys!6931 thiss!1504))))) (or ((_ is Undefined!1174) lt!130194) ((_ is Found!1174) lt!130194) (not ((_ is MissingVacant!1174) lt!130194)) (not (= (index!6869 lt!130194) (index!6868 lt!129957))) (and (bvsge (index!6869 lt!130194) #b00000000000000000000000000000000) (bvslt (index!6869 lt!130194) (size!6292 (_keys!6931 thiss!1504))))) (or ((_ is Undefined!1174) lt!130194) (ite ((_ is Found!1174) lt!130194) (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6867 lt!130194)) key!932) (and ((_ is MissingVacant!1174) lt!130194) (= (index!6869 lt!130194) (index!6868 lt!129957)) (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6869 lt!130194)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!167624 () SeekEntryResult!1174)

(assert (=> d!62093 (= lt!130194 e!167624)))

(declare-fun c!43842 () Bool)

(assert (=> d!62093 (= c!43842 (bvsge (x!25042 lt!129957) #b01111111111111111111111111111110))))

(declare-fun lt!130195 () (_ BitVec 64))

(assert (=> d!62093 (= lt!130195 (select (arr!5945 (_keys!6931 thiss!1504)) (index!6868 lt!129957)))))

(assert (=> d!62093 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!62093 (= (seekKeyOrZeroReturnVacant!0 (x!25042 lt!129957) (index!6868 lt!129957) (index!6868 lt!129957) key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)) lt!130194)))

(declare-fun b!258614 () Bool)

(assert (=> b!258614 (= e!167622 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25042 lt!129957) #b00000000000000000000000000000001) (nextIndex!0 (index!6868 lt!129957) (x!25042 lt!129957) (mask!11058 thiss!1504)) (index!6868 lt!129957) key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)))))

(declare-fun b!258615 () Bool)

(declare-fun e!167623 () SeekEntryResult!1174)

(assert (=> b!258615 (= e!167623 (Found!1174 (index!6868 lt!129957)))))

(declare-fun b!258616 () Bool)

(declare-fun c!43841 () Bool)

(assert (=> b!258616 (= c!43841 (= lt!130195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258616 (= e!167623 e!167622)))

(declare-fun b!258617 () Bool)

(assert (=> b!258617 (= e!167624 e!167623)))

(declare-fun c!43840 () Bool)

(assert (=> b!258617 (= c!43840 (= lt!130195 key!932))))

(declare-fun b!258618 () Bool)

(assert (=> b!258618 (= e!167624 Undefined!1174)))

(assert (= (and d!62093 c!43842) b!258618))

(assert (= (and d!62093 (not c!43842)) b!258617))

(assert (= (and b!258617 c!43840) b!258615))

(assert (= (and b!258617 (not c!43840)) b!258616))

(assert (= (and b!258616 c!43841) b!258613))

(assert (= (and b!258616 (not c!43841)) b!258614))

(declare-fun m!274105 () Bool)

(assert (=> d!62093 m!274105))

(declare-fun m!274107 () Bool)

(assert (=> d!62093 m!274107))

(assert (=> d!62093 m!273523))

(assert (=> d!62093 m!273351))

(declare-fun m!274109 () Bool)

(assert (=> b!258614 m!274109))

(assert (=> b!258614 m!274109))

(declare-fun m!274111 () Bool)

(assert (=> b!258614 m!274111))

(assert (=> b!258187 d!62093))

(declare-fun d!62095 () Bool)

(declare-fun e!167625 () Bool)

(assert (=> d!62095 e!167625))

(declare-fun res!126448 () Bool)

(assert (=> d!62095 (=> (not res!126448) (not e!167625))))

(declare-fun lt!130199 () ListLongMap!3845)

(assert (=> d!62095 (= res!126448 (contains!1878 lt!130199 (_1!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(declare-fun lt!130198 () List!3811)

(assert (=> d!62095 (= lt!130199 (ListLongMap!3846 lt!130198))))

(declare-fun lt!130196 () Unit!8017)

(declare-fun lt!130197 () Unit!8017)

(assert (=> d!62095 (= lt!130196 lt!130197)))

(assert (=> d!62095 (= (getValueByKey!313 lt!130198 (_1!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(assert (=> d!62095 (= lt!130197 (lemmaContainsTupThenGetReturnValue!169 lt!130198 (_1!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(assert (=> d!62095 (= lt!130198 (insertStrictlySorted!172 (toList!1938 call!24548) (_1!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))) (_2!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(assert (=> d!62095 (= (+!692 call!24548 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))) lt!130199)))

(declare-fun b!258619 () Bool)

(declare-fun res!126449 () Bool)

(assert (=> b!258619 (=> (not res!126449) (not e!167625))))

(assert (=> b!258619 (= res!126449 (= (getValueByKey!313 (toList!1938 lt!130199) (_1!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))) (Some!318 (_2!2477 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))))

(declare-fun b!258620 () Bool)

(assert (=> b!258620 (= e!167625 (contains!1880 (toList!1938 lt!130199) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))

(assert (= (and d!62095 res!126448) b!258619))

(assert (= (and b!258619 res!126449) b!258620))

(declare-fun m!274113 () Bool)

(assert (=> d!62095 m!274113))

(declare-fun m!274115 () Bool)

(assert (=> d!62095 m!274115))

(declare-fun m!274117 () Bool)

(assert (=> d!62095 m!274117))

(declare-fun m!274119 () Bool)

(assert (=> d!62095 m!274119))

(declare-fun m!274121 () Bool)

(assert (=> b!258619 m!274121))

(declare-fun m!274123 () Bool)

(assert (=> b!258620 m!274123))

(assert (=> b!258152 d!62095))

(assert (=> b!258263 d!61995))

(declare-fun d!62097 () Bool)

(declare-fun lt!130202 () Bool)

(declare-fun content!169 (List!3812) (InoxSet (_ BitVec 64)))

(assert (=> d!62097 (= lt!130202 (select (content!169 Nil!3809) (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(declare-fun e!167630 () Bool)

(assert (=> d!62097 (= lt!130202 e!167630)))

(declare-fun res!126454 () Bool)

(assert (=> d!62097 (=> (not res!126454) (not e!167630))))

(assert (=> d!62097 (= res!126454 ((_ is Cons!3808) Nil!3809))))

(assert (=> d!62097 (= (contains!1881 Nil!3809 (select (arr!5945 lt!129820) #b00000000000000000000000000000000)) lt!130202)))

(declare-fun b!258625 () Bool)

(declare-fun e!167631 () Bool)

(assert (=> b!258625 (= e!167630 e!167631)))

(declare-fun res!126455 () Bool)

(assert (=> b!258625 (=> res!126455 e!167631)))

(assert (=> b!258625 (= res!126455 (= (h!4470 Nil!3809) (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(declare-fun b!258626 () Bool)

(assert (=> b!258626 (= e!167631 (contains!1881 (t!8875 Nil!3809) (select (arr!5945 lt!129820) #b00000000000000000000000000000000)))))

(assert (= (and d!62097 res!126454) b!258625))

(assert (= (and b!258625 (not res!126455)) b!258626))

(declare-fun m!274125 () Bool)

(assert (=> d!62097 m!274125))

(assert (=> d!62097 m!273529))

(declare-fun m!274127 () Bool)

(assert (=> d!62097 m!274127))

(assert (=> b!258626 m!273529))

(declare-fun m!274129 () Bool)

(assert (=> b!258626 m!274129))

(assert (=> b!258261 d!62097))

(declare-fun d!62099 () Bool)

(assert (=> d!62099 (= (apply!255 lt!129950 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3057 (getValueByKey!313 (toList!1938 lt!129950) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9116 () Bool)

(assert (= bs!9116 d!62099))

(declare-fun m!274131 () Bool)

(assert (=> bs!9116 m!274131))

(assert (=> bs!9116 m!274131))

(declare-fun m!274133 () Bool)

(assert (=> bs!9116 m!274133))

(assert (=> b!258166 d!62099))

(declare-fun d!62101 () Bool)

(declare-fun e!167632 () Bool)

(assert (=> d!62101 e!167632))

(declare-fun res!126456 () Bool)

(assert (=> d!62101 (=> res!126456 e!167632)))

(declare-fun lt!130203 () Bool)

(assert (=> d!62101 (= res!126456 (not lt!130203))))

(declare-fun lt!130206 () Bool)

(assert (=> d!62101 (= lt!130203 lt!130206)))

(declare-fun lt!130204 () Unit!8017)

(declare-fun e!167633 () Unit!8017)

(assert (=> d!62101 (= lt!130204 e!167633)))

(declare-fun c!43843 () Bool)

(assert (=> d!62101 (= c!43843 lt!130206)))

(assert (=> d!62101 (= lt!130206 (containsKey!305 (toList!1938 lt!129950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62101 (= (contains!1878 lt!129950 #b0000000000000000000000000000000000000000000000000000000000000000) lt!130203)))

(declare-fun b!258627 () Bool)

(declare-fun lt!130205 () Unit!8017)

(assert (=> b!258627 (= e!167633 lt!130205)))

(assert (=> b!258627 (= lt!130205 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 lt!129950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258627 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258628 () Bool)

(declare-fun Unit!8036 () Unit!8017)

(assert (=> b!258628 (= e!167633 Unit!8036)))

(declare-fun b!258629 () Bool)

(assert (=> b!258629 (= e!167632 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129950) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62101 c!43843) b!258627))

(assert (= (and d!62101 (not c!43843)) b!258628))

(assert (= (and d!62101 (not res!126456)) b!258629))

(declare-fun m!274135 () Bool)

(assert (=> d!62101 m!274135))

(declare-fun m!274137 () Bool)

(assert (=> b!258627 m!274137))

(assert (=> b!258627 m!274131))

(assert (=> b!258627 m!274131))

(declare-fun m!274139 () Bool)

(assert (=> b!258627 m!274139))

(assert (=> b!258629 m!274131))

(assert (=> b!258629 m!274131))

(assert (=> b!258629 m!274139))

(assert (=> bm!24542 d!62101))

(assert (=> b!258164 d!61985))

(assert (=> d!61919 d!61885))

(declare-fun bm!24597 () Bool)

(declare-fun c!43848 () Bool)

(declare-fun call!24600 () Bool)

(declare-fun lt!130209 () SeekEntryResult!1174)

(assert (=> bm!24597 (= call!24600 (inRange!0 (ite c!43848 (index!6866 lt!130209) (index!6869 lt!130209)) (mask!11058 thiss!1504)))))

(declare-fun d!62103 () Bool)

(declare-fun e!167642 () Bool)

(assert (=> d!62103 e!167642))

(assert (=> d!62103 (= c!43848 ((_ is MissingZero!1174) lt!130209))))

(assert (=> d!62103 (= lt!130209 (seekEntryOrOpen!0 key!932 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)))))

(assert (=> d!62103 true))

(declare-fun _$34!1119 () Unit!8017)

(assert (=> d!62103 (= (choose!1245 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 (defaultEntry!4761 thiss!1504)) _$34!1119)))

(declare-fun b!258646 () Bool)

(declare-fun res!126467 () Bool)

(declare-fun e!167645 () Bool)

(assert (=> b!258646 (=> (not res!126467) (not e!167645))))

(assert (=> b!258646 (= res!126467 (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6869 lt!130209)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24598 () Bool)

(declare-fun call!24601 () Bool)

(assert (=> bm!24598 (= call!24601 (arrayContainsKey!0 (_keys!6931 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258647 () Bool)

(declare-fun e!167643 () Bool)

(assert (=> b!258647 (= e!167643 ((_ is Undefined!1174) lt!130209))))

(declare-fun b!258648 () Bool)

(assert (=> b!258648 (= e!167642 e!167643)))

(declare-fun c!43849 () Bool)

(assert (=> b!258648 (= c!43849 ((_ is MissingVacant!1174) lt!130209))))

(declare-fun b!258649 () Bool)

(declare-fun res!126466 () Bool)

(assert (=> b!258649 (=> (not res!126466) (not e!167645))))

(assert (=> b!258649 (= res!126466 call!24600)))

(assert (=> b!258649 (= e!167643 e!167645)))

(declare-fun b!258650 () Bool)

(assert (=> b!258650 (= e!167645 (not call!24601))))

(declare-fun b!258651 () Bool)

(declare-fun e!167644 () Bool)

(assert (=> b!258651 (= e!167642 e!167644)))

(declare-fun res!126465 () Bool)

(assert (=> b!258651 (= res!126465 call!24600)))

(assert (=> b!258651 (=> (not res!126465) (not e!167644))))

(declare-fun b!258652 () Bool)

(declare-fun res!126468 () Bool)

(assert (=> b!258652 (= res!126468 (= (select (arr!5945 (_keys!6931 thiss!1504)) (index!6866 lt!130209)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258652 (=> (not res!126468) (not e!167644))))

(declare-fun b!258653 () Bool)

(assert (=> b!258653 (= e!167644 (not call!24601))))

(assert (= (and d!62103 c!43848) b!258651))

(assert (= (and d!62103 (not c!43848)) b!258648))

(assert (= (and b!258651 res!126465) b!258652))

(assert (= (and b!258652 res!126468) b!258653))

(assert (= (and b!258648 c!43849) b!258649))

(assert (= (and b!258648 (not c!43849)) b!258647))

(assert (= (and b!258649 res!126466) b!258646))

(assert (= (and b!258646 res!126467) b!258650))

(assert (= (or b!258651 b!258649) bm!24597))

(assert (= (or b!258653 b!258650) bm!24598))

(assert (=> bm!24598 m!273325))

(declare-fun m!274141 () Bool)

(assert (=> bm!24597 m!274141))

(declare-fun m!274143 () Bool)

(assert (=> b!258646 m!274143))

(declare-fun m!274145 () Bool)

(assert (=> b!258652 m!274145))

(assert (=> d!62103 m!273367))

(assert (=> d!61919 d!62103))

(assert (=> d!61919 d!61897))

(assert (=> d!61899 d!61917))

(declare-fun d!62105 () Bool)

(assert (=> d!62105 (arrayContainsKey!0 lt!129820 key!932 #b00000000000000000000000000000000)))

(assert (=> d!62105 true))

(declare-fun _$60!378 () Unit!8017)

(assert (=> d!62105 (= (choose!13 lt!129820 key!932 index!297) _$60!378)))

(declare-fun bs!9117 () Bool)

(assert (= bs!9117 d!62105))

(assert (=> bs!9117 m!273353))

(assert (=> d!61899 d!62105))

(declare-fun d!62107 () Bool)

(declare-fun e!167646 () Bool)

(assert (=> d!62107 e!167646))

(declare-fun res!126469 () Bool)

(assert (=> d!62107 (=> (not res!126469) (not e!167646))))

(declare-fun lt!130213 () ListLongMap!3845)

(assert (=> d!62107 (= res!126469 (contains!1878 lt!130213 (_1!2477 (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))))

(declare-fun lt!130212 () List!3811)

(assert (=> d!62107 (= lt!130213 (ListLongMap!3846 lt!130212))))

(declare-fun lt!130210 () Unit!8017)

(declare-fun lt!130211 () Unit!8017)

(assert (=> d!62107 (= lt!130210 lt!130211)))

(assert (=> d!62107 (= (getValueByKey!313 lt!130212 (_1!2477 (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))) (Some!318 (_2!2477 (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))))

(assert (=> d!62107 (= lt!130211 (lemmaContainsTupThenGetReturnValue!169 lt!130212 (_1!2477 (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))) (_2!2477 (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))))

(assert (=> d!62107 (= lt!130212 (insertStrictlySorted!172 (toList!1938 (ite c!43735 call!24556 (ite c!43734 call!24554 call!24553))) (_1!2477 (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))) (_2!2477 (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))))

(assert (=> d!62107 (= (+!692 (ite c!43735 call!24556 (ite c!43734 call!24554 call!24553)) (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))) lt!130213)))

(declare-fun b!258654 () Bool)

(declare-fun res!126470 () Bool)

(assert (=> b!258654 (=> (not res!126470) (not e!167646))))

(assert (=> b!258654 (= res!126470 (= (getValueByKey!313 (toList!1938 lt!130213) (_1!2477 (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))) (Some!318 (_2!2477 (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))))

(declare-fun b!258655 () Bool)

(assert (=> b!258655 (= e!167646 (contains!1880 (toList!1938 lt!130213) (ite (or c!43735 c!43734) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(assert (= (and d!62107 res!126469) b!258654))

(assert (= (and b!258654 res!126470) b!258655))

(declare-fun m!274147 () Bool)

(assert (=> d!62107 m!274147))

(declare-fun m!274149 () Bool)

(assert (=> d!62107 m!274149))

(declare-fun m!274151 () Bool)

(assert (=> d!62107 m!274151))

(declare-fun m!274153 () Bool)

(assert (=> d!62107 m!274153))

(declare-fun m!274155 () Bool)

(assert (=> b!258654 m!274155))

(declare-fun m!274157 () Bool)

(assert (=> b!258655 m!274157))

(assert (=> bm!24550 d!62107))

(declare-fun d!62109 () Bool)

(assert (=> d!62109 (= (inRange!0 (ite c!43760 (index!6866 lt!130031) (index!6869 lt!130031)) (mask!11058 thiss!1504)) (and (bvsge (ite c!43760 (index!6866 lt!130031) (index!6869 lt!130031)) #b00000000000000000000000000000000) (bvslt (ite c!43760 (index!6866 lt!130031) (index!6869 lt!130031)) (bvadd (mask!11058 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24570 d!62109))

(declare-fun b!258656 () Bool)

(declare-fun e!167647 () Bool)

(declare-fun call!24602 () Bool)

(assert (=> b!258656 (= e!167647 call!24602)))

(declare-fun d!62111 () Bool)

(declare-fun res!126472 () Bool)

(declare-fun e!167649 () Bool)

(assert (=> d!62111 (=> res!126472 e!167649)))

(assert (=> d!62111 (= res!126472 (bvsge #b00000000000000000000000000000000 (size!6292 (_keys!6931 thiss!1504))))))

(assert (=> d!62111 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6931 thiss!1504) (mask!11058 thiss!1504)) e!167649)))

(declare-fun bm!24599 () Bool)

(assert (=> bm!24599 (= call!24602 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6931 thiss!1504) (mask!11058 thiss!1504)))))

(declare-fun b!258657 () Bool)

(declare-fun e!167648 () Bool)

(assert (=> b!258657 (= e!167647 e!167648)))

(declare-fun lt!130215 () (_ BitVec 64))

(assert (=> b!258657 (= lt!130215 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130216 () Unit!8017)

(assert (=> b!258657 (= lt!130216 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6931 thiss!1504) lt!130215 #b00000000000000000000000000000000))))

(assert (=> b!258657 (arrayContainsKey!0 (_keys!6931 thiss!1504) lt!130215 #b00000000000000000000000000000000)))

(declare-fun lt!130214 () Unit!8017)

(assert (=> b!258657 (= lt!130214 lt!130216)))

(declare-fun res!126471 () Bool)

(assert (=> b!258657 (= res!126471 (= (seekEntryOrOpen!0 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000) (_keys!6931 thiss!1504) (mask!11058 thiss!1504)) (Found!1174 #b00000000000000000000000000000000)))))

(assert (=> b!258657 (=> (not res!126471) (not e!167648))))

(declare-fun b!258658 () Bool)

(assert (=> b!258658 (= e!167649 e!167647)))

(declare-fun c!43850 () Bool)

(assert (=> b!258658 (= c!43850 (validKeyInArray!0 (select (arr!5945 (_keys!6931 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258659 () Bool)

(assert (=> b!258659 (= e!167648 call!24602)))

(assert (= (and d!62111 (not res!126472)) b!258658))

(assert (= (and b!258658 c!43850) b!258657))

(assert (= (and b!258658 (not c!43850)) b!258656))

(assert (= (and b!258657 res!126471) b!258659))

(assert (= (or b!258659 b!258656) bm!24599))

(declare-fun m!274159 () Bool)

(assert (=> bm!24599 m!274159))

(assert (=> b!258657 m!273457))

(declare-fun m!274161 () Bool)

(assert (=> b!258657 m!274161))

(declare-fun m!274163 () Bool)

(assert (=> b!258657 m!274163))

(assert (=> b!258657 m!273457))

(declare-fun m!274165 () Bool)

(assert (=> b!258657 m!274165))

(assert (=> b!258658 m!273457))

(assert (=> b!258658 m!273457))

(assert (=> b!258658 m!273461))

(assert (=> b!258328 d!62111))

(assert (=> b!258272 d!61995))

(assert (=> b!258154 d!61985))

(declare-fun b!258668 () Bool)

(declare-fun res!126484 () Bool)

(declare-fun e!167652 () Bool)

(assert (=> b!258668 (=> (not res!126484) (not e!167652))))

(assert (=> b!258668 (= res!126484 (and (= (size!6291 (_values!4744 thiss!1504)) (bvadd (mask!11058 thiss!1504) #b00000000000000000000000000000001)) (= (size!6292 (_keys!6931 thiss!1504)) (size!6291 (_values!4744 thiss!1504))) (bvsge (_size!1957 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1957 thiss!1504) (bvadd (mask!11058 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!258669 () Bool)

(declare-fun res!126482 () Bool)

(assert (=> b!258669 (=> (not res!126482) (not e!167652))))

(declare-fun size!6295 (LongMapFixedSize!3816) (_ BitVec 32))

(assert (=> b!258669 (= res!126482 (bvsge (size!6295 thiss!1504) (_size!1957 thiss!1504)))))

(declare-fun b!258671 () Bool)

(assert (=> b!258671 (= e!167652 (and (bvsge (extraKeys!4498 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4498 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1957 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!258670 () Bool)

(declare-fun res!126483 () Bool)

(assert (=> b!258670 (=> (not res!126483) (not e!167652))))

(assert (=> b!258670 (= res!126483 (= (size!6295 thiss!1504) (bvadd (_size!1957 thiss!1504) (bvsdiv (bvadd (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!62113 () Bool)

(declare-fun res!126481 () Bool)

(assert (=> d!62113 (=> (not res!126481) (not e!167652))))

(assert (=> d!62113 (= res!126481 (validMask!0 (mask!11058 thiss!1504)))))

(assert (=> d!62113 (= (simpleValid!278 thiss!1504) e!167652)))

(assert (= (and d!62113 res!126481) b!258668))

(assert (= (and b!258668 res!126484) b!258669))

(assert (= (and b!258669 res!126482) b!258670))

(assert (= (and b!258670 res!126483) b!258671))

(declare-fun m!274167 () Bool)

(assert (=> b!258669 m!274167))

(assert (=> b!258670 m!274167))

(assert (=> d!62113 m!273351))

(assert (=> d!61925 d!62113))

(declare-fun d!62115 () Bool)

(assert (=> d!62115 (= (apply!255 lt!129981 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3057 (getValueByKey!313 (toList!1938 lt!129981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9118 () Bool)

(assert (= bs!9118 d!62115))

(assert (=> bs!9118 m!273895))

(assert (=> bs!9118 m!273895))

(declare-fun m!274169 () Bool)

(assert (=> bs!9118 m!274169))

(assert (=> b!258199 d!62115))

(declare-fun d!62117 () Bool)

(declare-fun e!167653 () Bool)

(assert (=> d!62117 e!167653))

(declare-fun res!126485 () Bool)

(assert (=> d!62117 (=> res!126485 e!167653)))

(declare-fun lt!130217 () Bool)

(assert (=> d!62117 (= res!126485 (not lt!130217))))

(declare-fun lt!130220 () Bool)

(assert (=> d!62117 (= lt!130217 lt!130220)))

(declare-fun lt!130218 () Unit!8017)

(declare-fun e!167654 () Unit!8017)

(assert (=> d!62117 (= lt!130218 e!167654)))

(declare-fun c!43851 () Bool)

(assert (=> d!62117 (= c!43851 lt!130220)))

(assert (=> d!62117 (= lt!130220 (containsKey!305 (toList!1938 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504))) key!932))))

(assert (=> d!62117 (= (contains!1878 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) key!932) lt!130217)))

(declare-fun b!258672 () Bool)

(declare-fun lt!130219 () Unit!8017)

(assert (=> b!258672 (= e!167654 lt!130219)))

(assert (=> b!258672 (= lt!130219 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504))) key!932))))

(assert (=> b!258672 (isDefined!254 (getValueByKey!313 (toList!1938 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504))) key!932))))

(declare-fun b!258673 () Bool)

(declare-fun Unit!8037 () Unit!8017)

(assert (=> b!258673 (= e!167654 Unit!8037)))

(declare-fun b!258674 () Bool)

(assert (=> b!258674 (= e!167653 (isDefined!254 (getValueByKey!313 (toList!1938 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504))) key!932)))))

(assert (= (and d!62117 c!43851) b!258672))

(assert (= (and d!62117 (not c!43851)) b!258673))

(assert (= (and d!62117 (not res!126485)) b!258674))

(declare-fun m!274171 () Bool)

(assert (=> d!62117 m!274171))

(declare-fun m!274173 () Bool)

(assert (=> b!258672 m!274173))

(declare-fun m!274175 () Bool)

(assert (=> b!258672 m!274175))

(assert (=> b!258672 m!274175))

(declare-fun m!274177 () Bool)

(assert (=> b!258672 m!274177))

(assert (=> b!258674 m!274175))

(assert (=> b!258674 m!274175))

(assert (=> b!258674 m!274177))

(assert (=> d!61923 d!62117))

(assert (=> d!61923 d!61883))

(declare-fun d!62119 () Bool)

(assert (=> d!62119 (contains!1878 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) key!932)))

(assert (=> d!62119 true))

(declare-fun _$17!83 () Unit!8017)

(assert (=> d!62119 (= (choose!1246 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) _$17!83)))

(declare-fun bs!9119 () Bool)

(assert (= bs!9119 d!62119))

(assert (=> bs!9119 m!273375))

(assert (=> bs!9119 m!273375))

(assert (=> bs!9119 m!273659))

(assert (=> d!61923 d!62119))

(assert (=> d!61923 d!61897))

(declare-fun d!62121 () Bool)

(declare-fun e!167655 () Bool)

(assert (=> d!62121 e!167655))

(declare-fun res!126486 () Bool)

(assert (=> d!62121 (=> (not res!126486) (not e!167655))))

(declare-fun lt!130224 () ListLongMap!3845)

(assert (=> d!62121 (= res!126486 (contains!1878 lt!130224 (_1!2477 (tuple2!4933 key!932 v!346))))))

(declare-fun lt!130223 () List!3811)

(assert (=> d!62121 (= lt!130224 (ListLongMap!3846 lt!130223))))

(declare-fun lt!130221 () Unit!8017)

(declare-fun lt!130222 () Unit!8017)

(assert (=> d!62121 (= lt!130221 lt!130222)))

(assert (=> d!62121 (= (getValueByKey!313 lt!130223 (_1!2477 (tuple2!4933 key!932 v!346))) (Some!318 (_2!2477 (tuple2!4933 key!932 v!346))))))

(assert (=> d!62121 (= lt!130222 (lemmaContainsTupThenGetReturnValue!169 lt!130223 (_1!2477 (tuple2!4933 key!932 v!346)) (_2!2477 (tuple2!4933 key!932 v!346))))))

(assert (=> d!62121 (= lt!130223 (insertStrictlySorted!172 (toList!1938 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504))) (_1!2477 (tuple2!4933 key!932 v!346)) (_2!2477 (tuple2!4933 key!932 v!346))))))

(assert (=> d!62121 (= (+!692 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) (tuple2!4933 key!932 v!346)) lt!130224)))

(declare-fun b!258675 () Bool)

(declare-fun res!126487 () Bool)

(assert (=> b!258675 (=> (not res!126487) (not e!167655))))

(assert (=> b!258675 (= res!126487 (= (getValueByKey!313 (toList!1938 lt!130224) (_1!2477 (tuple2!4933 key!932 v!346))) (Some!318 (_2!2477 (tuple2!4933 key!932 v!346)))))))

(declare-fun b!258676 () Bool)

(assert (=> b!258676 (= e!167655 (contains!1880 (toList!1938 lt!130224) (tuple2!4933 key!932 v!346)))))

(assert (= (and d!62121 res!126486) b!258675))

(assert (= (and b!258675 res!126487) b!258676))

(declare-fun m!274179 () Bool)

(assert (=> d!62121 m!274179))

(declare-fun m!274181 () Bool)

(assert (=> d!62121 m!274181))

(declare-fun m!274183 () Bool)

(assert (=> d!62121 m!274183))

(declare-fun m!274185 () Bool)

(assert (=> d!62121 m!274185))

(declare-fun m!274187 () Bool)

(assert (=> b!258675 m!274187))

(declare-fun m!274189 () Bool)

(assert (=> b!258676 m!274189))

(assert (=> b!258241 d!62121))

(assert (=> b!258241 d!61883))

(declare-fun b!258677 () Bool)

(declare-fun res!126489 () Bool)

(declare-fun e!167657 () Bool)

(assert (=> b!258677 (=> (not res!126489) (not e!167657))))

(declare-fun e!167663 () Bool)

(assert (=> b!258677 (= res!126489 e!167663)))

(declare-fun c!43856 () Bool)

(assert (=> b!258677 (= c!43856 (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!258678 () Bool)

(declare-fun e!167662 () Bool)

(declare-fun e!167660 () Bool)

(assert (=> b!258678 (= e!167662 e!167660)))

(declare-fun res!126495 () Bool)

(declare-fun call!24604 () Bool)

(assert (=> b!258678 (= res!126495 call!24604)))

(assert (=> b!258678 (=> (not res!126495) (not e!167660))))

(declare-fun bm!24600 () Bool)

(declare-fun call!24603 () ListLongMap!3845)

(declare-fun call!24607 () ListLongMap!3845)

(assert (=> bm!24600 (= call!24603 call!24607)))

(declare-fun b!258679 () Bool)

(declare-fun call!24609 () Bool)

(assert (=> b!258679 (= e!167663 (not call!24609))))

(declare-fun b!258680 () Bool)

(declare-fun e!167664 () Bool)

(declare-fun e!167667 () Bool)

(assert (=> b!258680 (= e!167664 e!167667)))

(declare-fun res!126490 () Bool)

(assert (=> b!258680 (=> (not res!126490) (not e!167667))))

(declare-fun lt!130246 () ListLongMap!3845)

(assert (=> b!258680 (= res!126490 (contains!1878 lt!130246 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!258680 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))))))))

(declare-fun d!62123 () Bool)

(assert (=> d!62123 e!167657))

(declare-fun res!126492 () Bool)

(assert (=> d!62123 (=> (not res!126492) (not e!167657))))

(assert (=> d!62123 (= res!126492 (or (bvsge #b00000000000000000000000000000000 (size!6292 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))))))))))

(declare-fun lt!130228 () ListLongMap!3845)

(assert (=> d!62123 (= lt!130246 lt!130228)))

(declare-fun lt!130239 () Unit!8017)

(declare-fun e!167666 () Unit!8017)

(assert (=> d!62123 (= lt!130239 e!167666)))

(declare-fun c!43857 () Bool)

(declare-fun e!167658 () Bool)

(assert (=> d!62123 (= c!43857 e!167658)))

(declare-fun res!126488 () Bool)

(assert (=> d!62123 (=> (not res!126488) (not e!167658))))

(assert (=> d!62123 (= res!126488 (bvslt #b00000000000000000000000000000000 (size!6292 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))))))))

(declare-fun e!167661 () ListLongMap!3845)

(assert (=> d!62123 (= lt!130228 e!167661)))

(declare-fun c!43854 () Bool)

(assert (=> d!62123 (= c!43854 (and (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62123 (validMask!0 (mask!11058 thiss!1504))))

(assert (=> d!62123 (= (getCurrentListMap!1466 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) lt!130246)))

(declare-fun bm!24601 () Bool)

(assert (=> bm!24601 (= call!24609 (contains!1878 lt!130246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258681 () Bool)

(declare-fun c!43855 () Bool)

(assert (=> b!258681 (= c!43855 (and (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167668 () ListLongMap!3845)

(declare-fun e!167656 () ListLongMap!3845)

(assert (=> b!258681 (= e!167668 e!167656)))

(declare-fun b!258682 () Bool)

(assert (=> b!258682 (= e!167661 (+!692 call!24607 (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504))))))

(declare-fun call!24606 () ListLongMap!3845)

(declare-fun call!24608 () ListLongMap!3845)

(declare-fun bm!24602 () Bool)

(declare-fun c!43853 () Bool)

(declare-fun call!24605 () ListLongMap!3845)

(assert (=> bm!24602 (= call!24607 (+!692 (ite c!43854 call!24608 (ite c!43853 call!24606 call!24605)) (ite (or c!43854 c!43853) (tuple2!4933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4602 thiss!1504)) (tuple2!4933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4602 thiss!1504)))))))

(declare-fun bm!24603 () Bool)

(assert (=> bm!24603 (= call!24604 (contains!1878 lt!130246 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258683 () Bool)

(declare-fun res!126491 () Bool)

(assert (=> b!258683 (=> (not res!126491) (not e!167657))))

(assert (=> b!258683 (= res!126491 e!167664)))

(declare-fun res!126494 () Bool)

(assert (=> b!258683 (=> res!126494 e!167664)))

(declare-fun e!167665 () Bool)

(assert (=> b!258683 (= res!126494 (not e!167665))))

(declare-fun res!126496 () Bool)

(assert (=> b!258683 (=> (not res!126496) (not e!167665))))

(assert (=> b!258683 (= res!126496 (bvslt #b00000000000000000000000000000000 (size!6292 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))))))))

(declare-fun b!258684 () Bool)

(assert (=> b!258684 (= e!167658 (validKeyInArray!0 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258685 () Bool)

(assert (=> b!258685 (= e!167662 (not call!24604))))

(declare-fun b!258686 () Bool)

(declare-fun Unit!8038 () Unit!8017)

(assert (=> b!258686 (= e!167666 Unit!8038)))

(declare-fun bm!24604 () Bool)

(assert (=> bm!24604 (= call!24608 (getCurrentListMapNoExtraKeys!577 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun b!258687 () Bool)

(declare-fun e!167659 () Bool)

(assert (=> b!258687 (= e!167663 e!167659)))

(declare-fun res!126493 () Bool)

(assert (=> b!258687 (= res!126493 call!24609)))

(assert (=> b!258687 (=> (not res!126493) (not e!167659))))

(declare-fun b!258688 () Bool)

(assert (=> b!258688 (= e!167660 (= (apply!255 lt!130246 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4602 thiss!1504)))))

(declare-fun b!258689 () Bool)

(assert (=> b!258689 (= e!167668 call!24603)))

(declare-fun b!258690 () Bool)

(declare-fun lt!130226 () Unit!8017)

(assert (=> b!258690 (= e!167666 lt!130226)))

(declare-fun lt!130234 () ListLongMap!3845)

(assert (=> b!258690 (= lt!130234 (getCurrentListMapNoExtraKeys!577 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!130243 () (_ BitVec 64))

(assert (=> b!258690 (= lt!130243 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130230 () (_ BitVec 64))

(assert (=> b!258690 (= lt!130230 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130244 () Unit!8017)

(assert (=> b!258690 (= lt!130244 (addStillContains!231 lt!130234 lt!130243 (zeroValue!4602 thiss!1504) lt!130230))))

(assert (=> b!258690 (contains!1878 (+!692 lt!130234 (tuple2!4933 lt!130243 (zeroValue!4602 thiss!1504))) lt!130230)))

(declare-fun lt!130233 () Unit!8017)

(assert (=> b!258690 (= lt!130233 lt!130244)))

(declare-fun lt!130238 () ListLongMap!3845)

(assert (=> b!258690 (= lt!130238 (getCurrentListMapNoExtraKeys!577 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!130235 () (_ BitVec 64))

(assert (=> b!258690 (= lt!130235 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130236 () (_ BitVec 64))

(assert (=> b!258690 (= lt!130236 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130245 () Unit!8017)

(assert (=> b!258690 (= lt!130245 (addApplyDifferent!231 lt!130238 lt!130235 (minValue!4602 thiss!1504) lt!130236))))

(assert (=> b!258690 (= (apply!255 (+!692 lt!130238 (tuple2!4933 lt!130235 (minValue!4602 thiss!1504))) lt!130236) (apply!255 lt!130238 lt!130236))))

(declare-fun lt!130225 () Unit!8017)

(assert (=> b!258690 (= lt!130225 lt!130245)))

(declare-fun lt!130242 () ListLongMap!3845)

(assert (=> b!258690 (= lt!130242 (getCurrentListMapNoExtraKeys!577 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!130231 () (_ BitVec 64))

(assert (=> b!258690 (= lt!130231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130232 () (_ BitVec 64))

(assert (=> b!258690 (= lt!130232 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130240 () Unit!8017)

(assert (=> b!258690 (= lt!130240 (addApplyDifferent!231 lt!130242 lt!130231 (zeroValue!4602 thiss!1504) lt!130232))))

(assert (=> b!258690 (= (apply!255 (+!692 lt!130242 (tuple2!4933 lt!130231 (zeroValue!4602 thiss!1504))) lt!130232) (apply!255 lt!130242 lt!130232))))

(declare-fun lt!130237 () Unit!8017)

(assert (=> b!258690 (= lt!130237 lt!130240)))

(declare-fun lt!130227 () ListLongMap!3845)

(assert (=> b!258690 (= lt!130227 (getCurrentListMapNoExtraKeys!577 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(declare-fun lt!130229 () (_ BitVec 64))

(assert (=> b!258690 (= lt!130229 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130241 () (_ BitVec 64))

(assert (=> b!258690 (= lt!130241 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!258690 (= lt!130226 (addApplyDifferent!231 lt!130227 lt!130229 (minValue!4602 thiss!1504) lt!130241))))

(assert (=> b!258690 (= (apply!255 (+!692 lt!130227 (tuple2!4933 lt!130229 (minValue!4602 thiss!1504))) lt!130241) (apply!255 lt!130227 lt!130241))))

(declare-fun bm!24605 () Bool)

(assert (=> bm!24605 (= call!24605 call!24606)))

(declare-fun b!258691 () Bool)

(assert (=> b!258691 (= e!167656 call!24605)))

(declare-fun b!258692 () Bool)

(assert (=> b!258692 (= e!167667 (= (apply!255 lt!130246 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000)) (get!3056 (select (arr!5944 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4761 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258692 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6291 (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))))))))

(assert (=> b!258692 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))))))))

(declare-fun bm!24606 () Bool)

(assert (=> bm!24606 (= call!24606 call!24608)))

(declare-fun b!258693 () Bool)

(assert (=> b!258693 (= e!167661 e!167668)))

(assert (=> b!258693 (= c!43853 (and (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!258694 () Bool)

(assert (=> b!258694 (= e!167665 (validKeyInArray!0 (select (arr!5945 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258695 () Bool)

(assert (=> b!258695 (= e!167656 call!24603)))

(declare-fun b!258696 () Bool)

(assert (=> b!258696 (= e!167659 (= (apply!255 lt!130246 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4602 thiss!1504)))))

(declare-fun b!258697 () Bool)

(assert (=> b!258697 (= e!167657 e!167662)))

(declare-fun c!43852 () Bool)

(assert (=> b!258697 (= c!43852 (not (= (bvand (extraKeys!4498 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!62123 c!43854) b!258682))

(assert (= (and d!62123 (not c!43854)) b!258693))

(assert (= (and b!258693 c!43853) b!258689))

(assert (= (and b!258693 (not c!43853)) b!258681))

(assert (= (and b!258681 c!43855) b!258695))

(assert (= (and b!258681 (not c!43855)) b!258691))

(assert (= (or b!258695 b!258691) bm!24605))

(assert (= (or b!258689 bm!24605) bm!24606))

(assert (= (or b!258689 b!258695) bm!24600))

(assert (= (or b!258682 bm!24606) bm!24604))

(assert (= (or b!258682 bm!24600) bm!24602))

(assert (= (and d!62123 res!126488) b!258684))

(assert (= (and d!62123 c!43857) b!258690))

(assert (= (and d!62123 (not c!43857)) b!258686))

(assert (= (and d!62123 res!126492) b!258683))

(assert (= (and b!258683 res!126496) b!258694))

(assert (= (and b!258683 (not res!126494)) b!258680))

(assert (= (and b!258680 res!126490) b!258692))

(assert (= (and b!258683 res!126491) b!258677))

(assert (= (and b!258677 c!43856) b!258687))

(assert (= (and b!258677 (not c!43856)) b!258679))

(assert (= (and b!258687 res!126493) b!258696))

(assert (= (or b!258687 b!258679) bm!24601))

(assert (= (and b!258677 res!126489) b!258697))

(assert (= (and b!258697 c!43852) b!258678))

(assert (= (and b!258697 (not c!43852)) b!258685))

(assert (= (and b!258678 res!126495) b!258688))

(assert (= (or b!258678 b!258685) bm!24603))

(declare-fun b_lambda!8211 () Bool)

(assert (=> (not b_lambda!8211) (not b!258692)))

(assert (=> b!258692 t!8879))

(declare-fun b_and!13831 () Bool)

(assert (= b_and!13829 (and (=> t!8879 result!5391) b_and!13831)))

(declare-fun m!274191 () Bool)

(assert (=> bm!24603 m!274191))

(assert (=> b!258680 m!273911))

(assert (=> b!258680 m!273911))

(declare-fun m!274193 () Bool)

(assert (=> b!258680 m!274193))

(assert (=> b!258694 m!273911))

(assert (=> b!258694 m!273911))

(assert (=> b!258694 m!273915))

(declare-fun m!274195 () Bool)

(assert (=> b!258690 m!274195))

(declare-fun m!274197 () Bool)

(assert (=> b!258690 m!274197))

(declare-fun m!274199 () Bool)

(assert (=> b!258690 m!274199))

(declare-fun m!274201 () Bool)

(assert (=> b!258690 m!274201))

(declare-fun m!274203 () Bool)

(assert (=> b!258690 m!274203))

(assert (=> b!258690 m!274195))

(declare-fun m!274205 () Bool)

(assert (=> b!258690 m!274205))

(declare-fun m!274207 () Bool)

(assert (=> b!258690 m!274207))

(declare-fun m!274209 () Bool)

(assert (=> b!258690 m!274209))

(assert (=> b!258690 m!274207))

(declare-fun m!274211 () Bool)

(assert (=> b!258690 m!274211))

(declare-fun m!274213 () Bool)

(assert (=> b!258690 m!274213))

(declare-fun m!274215 () Bool)

(assert (=> b!258690 m!274215))

(declare-fun m!274217 () Bool)

(assert (=> b!258690 m!274217))

(declare-fun m!274219 () Bool)

(assert (=> b!258690 m!274219))

(declare-fun m!274221 () Bool)

(assert (=> b!258690 m!274221))

(assert (=> b!258690 m!274211))

(declare-fun m!274223 () Bool)

(assert (=> b!258690 m!274223))

(declare-fun m!274225 () Bool)

(assert (=> b!258690 m!274225))

(assert (=> b!258690 m!273911))

(assert (=> b!258690 m!274215))

(declare-fun m!274227 () Bool)

(assert (=> bm!24601 m!274227))

(assert (=> bm!24604 m!274225))

(declare-fun m!274229 () Bool)

(assert (=> b!258696 m!274229))

(assert (=> b!258684 m!273911))

(assert (=> b!258684 m!273911))

(assert (=> b!258684 m!273915))

(declare-fun m!274231 () Bool)

(assert (=> b!258688 m!274231))

(declare-fun m!274233 () Bool)

(assert (=> b!258682 m!274233))

(assert (=> b!258692 m!273575))

(assert (=> b!258692 m!273505))

(assert (=> b!258692 m!273577))

(assert (=> b!258692 m!273911))

(declare-fun m!274235 () Bool)

(assert (=> b!258692 m!274235))

(assert (=> b!258692 m!273575))

(assert (=> b!258692 m!273505))

(assert (=> b!258692 m!273911))

(declare-fun m!274237 () Bool)

(assert (=> bm!24602 m!274237))

(assert (=> d!62123 m!273351))

(assert (=> b!258241 d!62123))

(assert (=> bm!24552 d!62041))

(declare-fun b!258698 () Bool)

(declare-fun e!167669 () Bool)

(assert (=> b!258698 (= e!167669 (contains!1881 (ite c!43747 (Cons!3808 (select (arr!5945 lt!129820) #b00000000000000000000000000000000) Nil!3809) Nil!3809) (select (arr!5945 lt!129820) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62125 () Bool)

(declare-fun res!126497 () Bool)

(declare-fun e!167672 () Bool)

(assert (=> d!62125 (=> res!126497 e!167672)))

(assert (=> d!62125 (= res!126497 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6292 lt!129820)))))

(assert (=> d!62125 (= (arrayNoDuplicates!0 lt!129820 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43747 (Cons!3808 (select (arr!5945 lt!129820) #b00000000000000000000000000000000) Nil!3809) Nil!3809)) e!167672)))

(declare-fun b!258699 () Bool)

(declare-fun e!167671 () Bool)

(declare-fun e!167670 () Bool)

(assert (=> b!258699 (= e!167671 e!167670)))

(declare-fun c!43858 () Bool)

(assert (=> b!258699 (= c!43858 (validKeyInArray!0 (select (arr!5945 lt!129820) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258700 () Bool)

(assert (=> b!258700 (= e!167672 e!167671)))

(declare-fun res!126498 () Bool)

(assert (=> b!258700 (=> (not res!126498) (not e!167671))))

(assert (=> b!258700 (= res!126498 (not e!167669))))

(declare-fun res!126499 () Bool)

(assert (=> b!258700 (=> (not res!126499) (not e!167669))))

(assert (=> b!258700 (= res!126499 (validKeyInArray!0 (select (arr!5945 lt!129820) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258701 () Bool)

(declare-fun call!24610 () Bool)

(assert (=> b!258701 (= e!167670 call!24610)))

(declare-fun bm!24607 () Bool)

(assert (=> bm!24607 (= call!24610 (arrayNoDuplicates!0 lt!129820 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!43858 (Cons!3808 (select (arr!5945 lt!129820) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!43747 (Cons!3808 (select (arr!5945 lt!129820) #b00000000000000000000000000000000) Nil!3809) Nil!3809)) (ite c!43747 (Cons!3808 (select (arr!5945 lt!129820) #b00000000000000000000000000000000) Nil!3809) Nil!3809))))))

(declare-fun b!258702 () Bool)

(assert (=> b!258702 (= e!167670 call!24610)))

(assert (= (and d!62125 (not res!126497)) b!258700))

(assert (= (and b!258700 res!126499) b!258698))

(assert (= (and b!258700 res!126498) b!258699))

(assert (= (and b!258699 c!43858) b!258702))

(assert (= (and b!258699 (not c!43858)) b!258701))

(assert (= (or b!258702 b!258701) bm!24607))

(assert (=> b!258698 m!273829))

(assert (=> b!258698 m!273829))

(declare-fun m!274239 () Bool)

(assert (=> b!258698 m!274239))

(assert (=> b!258699 m!273829))

(assert (=> b!258699 m!273829))

(assert (=> b!258699 m!273847))

(assert (=> b!258700 m!273829))

(assert (=> b!258700 m!273829))

(assert (=> b!258700 m!273847))

(assert (=> bm!24607 m!273829))

(declare-fun m!274241 () Bool)

(assert (=> bm!24607 m!274241))

(assert (=> bm!24560 d!62125))

(declare-fun d!62127 () Bool)

(assert (=> d!62127 (= (+!692 (getCurrentListMap!1466 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)) (tuple2!4933 key!932 v!346)) (getCurrentListMap!1466 (array!12556 (store (arr!5945 (_keys!6931 thiss!1504)) index!297 key!932) (size!6292 (_keys!6931 thiss!1504))) (array!12554 (store (arr!5944 (_values!4744 thiss!1504)) index!297 (ValueCellFull!2958 v!346)) (size!6291 (_values!4744 thiss!1504))) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4761 thiss!1504)))))

(assert (=> d!62127 true))

(declare-fun _$3!55 () Unit!8017)

(assert (=> d!62127 (= (choose!1244 (_keys!6931 thiss!1504) (_values!4744 thiss!1504) (mask!11058 thiss!1504) (extraKeys!4498 thiss!1504) (zeroValue!4602 thiss!1504) (minValue!4602 thiss!1504) index!297 key!932 v!346 (defaultEntry!4761 thiss!1504)) _$3!55)))

(declare-fun bs!9120 () Bool)

(assert (= bs!9120 d!62127))

(assert (=> bs!9120 m!273375))

(assert (=> bs!9120 m!273341))

(assert (=> bs!9120 m!273375))

(assert (=> bs!9120 m!273609))

(assert (=> bs!9120 m!273611))

(assert (=> bs!9120 m!273327))

(assert (=> d!61895 d!62127))

(assert (=> d!61895 d!61897))

(declare-fun b!258703 () Bool)

(declare-fun e!167674 () (_ BitVec 32))

(declare-fun e!167673 () (_ BitVec 32))

(assert (=> b!258703 (= e!167674 e!167673)))

(declare-fun c!43860 () Bool)

(assert (=> b!258703 (= c!43860 (validKeyInArray!0 (select (arr!5945 lt!129820) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun b!258704 () Bool)

(declare-fun call!24611 () (_ BitVec 32))

(assert (=> b!258704 (= e!167673 call!24611)))

(declare-fun bm!24608 () Bool)

(assert (=> bm!24608 (= call!24611 (arrayCountValidKeys!0 lt!129820 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!258705 () Bool)

(assert (=> b!258705 (= e!167674 #b00000000000000000000000000000000)))

(declare-fun b!258706 () Bool)

(assert (=> b!258706 (= e!167673 (bvadd #b00000000000000000000000000000001 call!24611))))

(declare-fun d!62129 () Bool)

(declare-fun lt!130247 () (_ BitVec 32))

(assert (=> d!62129 (and (bvsge lt!130247 #b00000000000000000000000000000000) (bvsle lt!130247 (bvsub (size!6292 lt!129820) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!62129 (= lt!130247 e!167674)))

(declare-fun c!43859 () Bool)

(assert (=> d!62129 (= c!43859 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62129 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6292 lt!129820)))))

(assert (=> d!62129 (= (arrayCountValidKeys!0 lt!129820 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!130247)))

(assert (= (and d!62129 c!43859) b!258705))

(assert (= (and d!62129 (not c!43859)) b!258703))

(assert (= (and b!258703 c!43860) b!258706))

(assert (= (and b!258703 (not c!43860)) b!258704))

(assert (= (or b!258706 b!258704) bm!24608))

(declare-fun m!274243 () Bool)

(assert (=> b!258703 m!274243))

(assert (=> b!258703 m!274243))

(declare-fun m!274245 () Bool)

(assert (=> b!258703 m!274245))

(declare-fun m!274247 () Bool)

(assert (=> bm!24608 m!274247))

(assert (=> bm!24562 d!62129))

(declare-fun d!62131 () Bool)

(declare-fun e!167675 () Bool)

(assert (=> d!62131 e!167675))

(declare-fun res!126500 () Bool)

(assert (=> d!62131 (=> res!126500 e!167675)))

(declare-fun lt!130248 () Bool)

(assert (=> d!62131 (= res!126500 (not lt!130248))))

(declare-fun lt!130251 () Bool)

(assert (=> d!62131 (= lt!130248 lt!130251)))

(declare-fun lt!130249 () Unit!8017)

(declare-fun e!167676 () Unit!8017)

(assert (=> d!62131 (= lt!130249 e!167676)))

(declare-fun c!43861 () Bool)

(assert (=> d!62131 (= c!43861 lt!130251)))

(assert (=> d!62131 (= lt!130251 (containsKey!305 (toList!1938 lt!129950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62131 (= (contains!1878 lt!129950 #b1000000000000000000000000000000000000000000000000000000000000000) lt!130248)))

(declare-fun b!258707 () Bool)

(declare-fun lt!130250 () Unit!8017)

(assert (=> b!258707 (= e!167676 lt!130250)))

(assert (=> b!258707 (= lt!130250 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1938 lt!129950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258707 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258708 () Bool)

(declare-fun Unit!8039 () Unit!8017)

(assert (=> b!258708 (= e!167676 Unit!8039)))

(declare-fun b!258709 () Bool)

(assert (=> b!258709 (= e!167675 (isDefined!254 (getValueByKey!313 (toList!1938 lt!129950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62131 c!43861) b!258707))

(assert (= (and d!62131 (not c!43861)) b!258708))

(assert (= (and d!62131 (not res!126500)) b!258709))

(declare-fun m!274249 () Bool)

(assert (=> d!62131 m!274249))

(declare-fun m!274251 () Bool)

(assert (=> b!258707 m!274251))

(assert (=> b!258707 m!273803))

(assert (=> b!258707 m!273803))

(declare-fun m!274253 () Bool)

(assert (=> b!258707 m!274253))

(assert (=> b!258709 m!273803))

(assert (=> b!258709 m!273803))

(assert (=> b!258709 m!274253))

(assert (=> bm!24544 d!62131))

(declare-fun condMapEmpty!11251 () Bool)

(declare-fun mapDefault!11251 () ValueCell!2958)

(assert (=> mapNonEmpty!11250 (= condMapEmpty!11251 (= mapRest!11250 ((as const (Array (_ BitVec 32) ValueCell!2958)) mapDefault!11251)))))

(declare-fun e!167677 () Bool)

(declare-fun mapRes!11251 () Bool)

(assert (=> mapNonEmpty!11250 (= tp!23544 (and e!167677 mapRes!11251))))

(declare-fun b!258711 () Bool)

(assert (=> b!258711 (= e!167677 tp_is_empty!6603)))

(declare-fun mapNonEmpty!11251 () Bool)

(declare-fun tp!23545 () Bool)

(declare-fun e!167678 () Bool)

(assert (=> mapNonEmpty!11251 (= mapRes!11251 (and tp!23545 e!167678))))

(declare-fun mapKey!11251 () (_ BitVec 32))

(declare-fun mapValue!11251 () ValueCell!2958)

(declare-fun mapRest!11251 () (Array (_ BitVec 32) ValueCell!2958))

(assert (=> mapNonEmpty!11251 (= mapRest!11250 (store mapRest!11251 mapKey!11251 mapValue!11251))))

(declare-fun mapIsEmpty!11251 () Bool)

(assert (=> mapIsEmpty!11251 mapRes!11251))

(declare-fun b!258710 () Bool)

(assert (=> b!258710 (= e!167678 tp_is_empty!6603)))

(assert (= (and mapNonEmpty!11250 condMapEmpty!11251) mapIsEmpty!11251))

(assert (= (and mapNonEmpty!11250 (not condMapEmpty!11251)) mapNonEmpty!11251))

(assert (= (and mapNonEmpty!11251 ((_ is ValueCellFull!2958) mapValue!11251)) b!258710))

(assert (= (and mapNonEmpty!11250 ((_ is ValueCellFull!2958) mapDefault!11251)) b!258711))

(declare-fun m!274255 () Bool)

(assert (=> mapNonEmpty!11251 m!274255))

(declare-fun b_lambda!8213 () Bool)

(assert (= b_lambda!8205 (or (and b!258023 b_free!6741) b_lambda!8213)))

(declare-fun b_lambda!8215 () Bool)

(assert (= b_lambda!8211 (or (and b!258023 b_free!6741) b_lambda!8215)))

(declare-fun b_lambda!8217 () Bool)

(assert (= b_lambda!8203 (or (and b!258023 b_free!6741) b_lambda!8217)))

(declare-fun b_lambda!8219 () Bool)

(assert (= b_lambda!8207 (or (and b!258023 b_free!6741) b_lambda!8219)))

(declare-fun b_lambda!8221 () Bool)

(assert (= b_lambda!8209 (or (and b!258023 b_free!6741) b_lambda!8221)))

(check-sat (not b!258503) (not b!258703) (not d!62103) (not bm!24574) (not d!62009) (not b!258466) (not b!258694) (not d!62041) (not b!258566) (not b!258596) (not d!62107) (not d!61973) (not b!258629) (not b_lambda!8217) (not d!62083) (not b!258584) (not b!258530) (not bm!24576) (not b!258538) (not b!258614) (not b!258389) (not d!62115) (not b!258396) (not d!62065) (not b_lambda!8221) (not b!258571) (not d!62131) (not d!62015) (not d!62075) (not b!258586) (not d!62087) (not d!61941) (not b!258457) (not bm!24578) (not b!258496) (not d!61967) (not b!258506) (not b!258700) (not b!258684) (not b!258569) (not b!258574) (not bm!24602) (not d!62121) (not b!258626) (not b!258395) (not d!61943) (not b!258599) (not b!258564) (not b!258582) (not d!62051) (not b!258438) (not b!258657) (not b!258546) (not bm!24590) (not b_lambda!8201) (not b!258544) (not b!258578) (not b!258680) (not b!258655) (not b!258588) (not d!62063) (not b!258353) (not bm!24608) (not b!258501) (not bm!24607) (not d!62095) (not b!258619) (not d!61937) (not b!258562) (not bm!24592) (not bm!24591) (not b!258676) (not d!61955) (not b!258699) (not b!258573) (not b!258429) (not d!62049) (not b!258555) (not b!258442) (not b!258688) (not b!258460) (not d!62057) (not b!258709) (not d!61979) (not b!258627) (not d!61951) (not b!258412) (not b_next!6741) (not d!62067) (not b!258561) (not b!258433) (not bm!24577) (not b!258393) (not d!62079) (not d!62039) (not b!258682) (not d!62027) (not d!62099) (not d!62101) (not b!258405) (not b!258500) (not b!258583) (not d!61939) (not d!62023) (not d!62119) (not b!258491) (not bm!24597) (not b!258417) (not b!258575) (not b!258579) (not d!61993) (not b!258421) (not b!258507) (not d!62061) (not d!62005) (not d!62073) (not d!62019) (not d!61947) (not d!62043) (not b!258696) (not d!61961) (not b!258411) (not b!258359) (not b!258565) (not b!258494) (not b!258598) (not d!61957) (not bm!24575) (not b!258692) (not b!258580) (not b!258455) (not b!258453) (not b!258577) tp_is_empty!6603 (not d!62085) (not bm!24601) (not b!258508) (not d!61969) (not b!258418) (not d!62053) (not b!258388) (not b!258410) (not b!258399) (not d!62059) (not b!258392) (not d!61965) (not d!61987) (not b!258570) (not bm!24587) (not b!258669) (not b!258690) (not d!62047) (not b_lambda!8219) (not d!62113) (not b!258698) (not b!258345) (not b!258567) (not d!61989) (not d!61959) (not b!258437) b_and!13831 (not d!61953) (not d!62013) (not b!258504) (not d!62127) (not b!258398) (not d!62097) (not b!258394) (not b!258435) (not bm!24598) (not d!62045) (not d!61999) (not b!258594) (not b!258356) (not b!258675) (not b!258416) (not b!258670) (not d!62077) (not b!258358) (not bm!24589) (not b!258560) (not d!61949) (not d!62069) (not bm!24588) (not b!258360) (not b_lambda!8213) (not d!62117) (not b!258595) (not b!258498) (not d!62123) (not bm!24604) (not b!258707) (not b_lambda!8199) (not b_lambda!8215) (not b!258505) (not d!62001) (not d!62055) (not bm!24599) (not b!258568) (not mapNonEmpty!11251) (not d!62105) (not b!258658) (not b!258352) (not bm!24603) (not d!61963) (not b!258432) (not b!258357) (not d!61945) (not d!62011) (not d!62093) (not b!258672) (not d!61935) (not b!258354) (not b!258620) (not b!258467) (not b!258654) (not b!258674) (not b!258390))
(check-sat b_and!13831 (not b_next!6741))
