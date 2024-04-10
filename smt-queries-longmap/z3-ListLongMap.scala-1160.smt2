; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24424 () Bool)

(assert start!24424)

(declare-fun b!255885 () Bool)

(declare-fun b_free!6711 () Bool)

(declare-fun b_next!6711 () Bool)

(assert (=> b!255885 (= b_free!6711 (not b_next!6711))))

(declare-fun tp!23430 () Bool)

(declare-fun b_and!13765 () Bool)

(assert (=> b!255885 (= tp!23430 b_and!13765)))

(declare-fun b!255872 () Bool)

(declare-fun c!43224 () Bool)

(declare-datatypes ((SeekEntryResult!1160 0))(
  ( (MissingZero!1160 (index!6810 (_ BitVec 32))) (Found!1160 (index!6811 (_ BitVec 32))) (Intermediate!1160 (undefined!1972 Bool) (index!6812 (_ BitVec 32)) (x!24938 (_ BitVec 32))) (Undefined!1160) (MissingVacant!1160 (index!6813 (_ BitVec 32))) )
))
(declare-fun lt!128409 () SeekEntryResult!1160)

(get-info :version)

(assert (=> b!255872 (= c!43224 ((_ is MissingVacant!1160) lt!128409))))

(declare-fun e!165861 () Bool)

(declare-fun e!165865 () Bool)

(assert (=> b!255872 (= e!165861 e!165865)))

(declare-fun b!255873 () Bool)

(declare-fun e!165871 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8411 0))(
  ( (V!8412 (val!3331 Int)) )
))
(declare-datatypes ((ValueCell!2943 0))(
  ( (ValueCellFull!2943 (v!5414 V!8411)) (EmptyCell!2943) )
))
(declare-datatypes ((array!12483 0))(
  ( (array!12484 (arr!5914 (Array (_ BitVec 32) ValueCell!2943)) (size!6261 (_ BitVec 32))) )
))
(declare-datatypes ((array!12485 0))(
  ( (array!12486 (arr!5915 (Array (_ BitVec 32) (_ BitVec 64))) (size!6262 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3786 0))(
  ( (LongMapFixedSize!3787 (defaultEntry!4721 Int) (mask!10987 (_ BitVec 32)) (extraKeys!4458 (_ BitVec 32)) (zeroValue!4562 V!8411) (minValue!4562 V!8411) (_size!1942 (_ BitVec 32)) (_keys!6881 array!12485) (_values!4704 array!12483) (_vacant!1942 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3786)

(assert (=> b!255873 (= e!165871 (not (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6262 (_keys!6881 thiss!1504))) (bvslt (size!6262 (_keys!6881 thiss!1504)) #b01111111111111111111111111111111))))))

(declare-fun lt!128407 () array!12485)

(declare-datatypes ((tuple2!4906 0))(
  ( (tuple2!4907 (_1!2464 (_ BitVec 64)) (_2!2464 V!8411)) )
))
(declare-datatypes ((List!3786 0))(
  ( (Nil!3783) (Cons!3782 (h!4444 tuple2!4906) (t!8839 List!3786)) )
))
(declare-datatypes ((ListLongMap!3819 0))(
  ( (ListLongMap!3820 (toList!1925 List!3786)) )
))
(declare-fun lt!128404 () ListLongMap!3819)

(declare-fun v!346 () V!8411)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun +!680 (ListLongMap!3819 tuple2!4906) ListLongMap!3819)

(declare-fun getCurrentListMap!1453 (array!12485 array!12483 (_ BitVec 32) (_ BitVec 32) V!8411 V!8411 (_ BitVec 32) Int) ListLongMap!3819)

(assert (=> b!255873 (= (+!680 lt!128404 (tuple2!4907 key!932 v!346)) (getCurrentListMap!1453 lt!128407 (array!12484 (store (arr!5914 (_values!4704 thiss!1504)) index!297 (ValueCellFull!2943 v!346)) (size!6261 (_values!4704 thiss!1504))) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-datatypes ((Unit!7941 0))(
  ( (Unit!7942) )
))
(declare-fun lt!128400 () Unit!7941)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!90 (array!12485 array!12483 (_ BitVec 32) (_ BitVec 32) V!8411 V!8411 (_ BitVec 32) (_ BitVec 64) V!8411 Int) Unit!7941)

(assert (=> b!255873 (= lt!128400 (lemmaAddValidKeyToArrayThenAddPairToListMap!90 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) index!297 key!932 v!346 (defaultEntry!4721 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12485 (_ BitVec 32)) Bool)

(assert (=> b!255873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128407 (mask!10987 thiss!1504))))

(declare-fun lt!128403 () Unit!7941)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12485 (_ BitVec 32) (_ BitVec 32)) Unit!7941)

(assert (=> b!255873 (= lt!128403 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6881 thiss!1504) index!297 (mask!10987 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12485 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!255873 (= (arrayCountValidKeys!0 lt!128407 #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6881 thiss!1504) #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504)))))))

(declare-fun lt!128402 () Unit!7941)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12485 (_ BitVec 32) (_ BitVec 64)) Unit!7941)

(assert (=> b!255873 (= lt!128402 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6881 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3787 0))(
  ( (Nil!3784) (Cons!3783 (h!4445 (_ BitVec 64)) (t!8840 List!3787)) )
))
(declare-fun arrayNoDuplicates!0 (array!12485 (_ BitVec 32) List!3787) Bool)

(assert (=> b!255873 (arrayNoDuplicates!0 lt!128407 #b00000000000000000000000000000000 Nil!3784)))

(assert (=> b!255873 (= lt!128407 (array!12486 (store (arr!5915 (_keys!6881 thiss!1504)) index!297 key!932) (size!6262 (_keys!6881 thiss!1504))))))

(declare-fun lt!128401 () Unit!7941)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3787) Unit!7941)

(assert (=> b!255873 (= lt!128401 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6881 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3784))))

(declare-fun lt!128406 () Unit!7941)

(declare-fun e!165866 () Unit!7941)

(assert (=> b!255873 (= lt!128406 e!165866)))

(declare-fun c!43225 () Bool)

(declare-fun arrayContainsKey!0 (array!12485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!255873 (= c!43225 (arrayContainsKey!0 (_keys!6881 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24207 () Bool)

(declare-fun c!43226 () Bool)

(declare-fun call!24210 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24207 (= call!24210 (inRange!0 (ite c!43226 (index!6810 lt!128409) (index!6813 lt!128409)) (mask!10987 thiss!1504)))))

(declare-fun b!255874 () Bool)

(declare-fun e!165867 () Bool)

(declare-fun e!165864 () Bool)

(declare-fun mapRes!11184 () Bool)

(assert (=> b!255874 (= e!165867 (and e!165864 mapRes!11184))))

(declare-fun condMapEmpty!11184 () Bool)

(declare-fun mapDefault!11184 () ValueCell!2943)

(assert (=> b!255874 (= condMapEmpty!11184 (= (arr!5914 (_values!4704 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2943)) mapDefault!11184)))))

(declare-fun mapNonEmpty!11184 () Bool)

(declare-fun tp!23429 () Bool)

(declare-fun e!165868 () Bool)

(assert (=> mapNonEmpty!11184 (= mapRes!11184 (and tp!23429 e!165868))))

(declare-fun mapKey!11184 () (_ BitVec 32))

(declare-fun mapRest!11184 () (Array (_ BitVec 32) ValueCell!2943))

(declare-fun mapValue!11184 () ValueCell!2943)

(assert (=> mapNonEmpty!11184 (= (arr!5914 (_values!4704 thiss!1504)) (store mapRest!11184 mapKey!11184 mapValue!11184))))

(declare-fun bm!24208 () Bool)

(declare-fun call!24211 () Bool)

(assert (=> bm!24208 (= call!24211 (arrayContainsKey!0 (_keys!6881 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255876 () Bool)

(declare-fun e!165870 () Bool)

(declare-fun e!165862 () Bool)

(assert (=> b!255876 (= e!165870 e!165862)))

(declare-fun res!125204 () Bool)

(assert (=> b!255876 (=> (not res!125204) (not e!165862))))

(assert (=> b!255876 (= res!125204 (or (= lt!128409 (MissingZero!1160 index!297)) (= lt!128409 (MissingVacant!1160 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12485 (_ BitVec 32)) SeekEntryResult!1160)

(assert (=> b!255876 (= lt!128409 (seekEntryOrOpen!0 key!932 (_keys!6881 thiss!1504) (mask!10987 thiss!1504)))))

(declare-fun b!255877 () Bool)

(declare-fun Unit!7943 () Unit!7941)

(assert (=> b!255877 (= e!165866 Unit!7943)))

(declare-fun b!255878 () Bool)

(declare-fun res!125198 () Bool)

(assert (=> b!255878 (= res!125198 (= (select (arr!5915 (_keys!6881 thiss!1504)) (index!6813 lt!128409)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165858 () Bool)

(assert (=> b!255878 (=> (not res!125198) (not e!165858))))

(declare-fun b!255879 () Bool)

(declare-fun tp_is_empty!6573 () Bool)

(assert (=> b!255879 (= e!165868 tp_is_empty!6573)))

(declare-fun b!255880 () Bool)

(assert (=> b!255880 (= e!165862 e!165871)))

(declare-fun res!125200 () Bool)

(assert (=> b!255880 (=> (not res!125200) (not e!165871))))

(assert (=> b!255880 (= res!125200 (inRange!0 index!297 (mask!10987 thiss!1504)))))

(declare-fun lt!128410 () Unit!7941)

(declare-fun e!165869 () Unit!7941)

(assert (=> b!255880 (= lt!128410 e!165869)))

(declare-fun c!43223 () Bool)

(declare-fun contains!1861 (ListLongMap!3819 (_ BitVec 64)) Bool)

(assert (=> b!255880 (= c!43223 (contains!1861 lt!128404 key!932))))

(assert (=> b!255880 (= lt!128404 (getCurrentListMap!1453 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-fun b!255881 () Bool)

(declare-fun res!125202 () Bool)

(assert (=> b!255881 (=> (not res!125202) (not e!165870))))

(assert (=> b!255881 (= res!125202 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!255882 () Bool)

(declare-fun Unit!7944 () Unit!7941)

(assert (=> b!255882 (= e!165866 Unit!7944)))

(declare-fun lt!128408 () Unit!7941)

(declare-fun lemmaArrayContainsKeyThenInListMap!232 (array!12485 array!12483 (_ BitVec 32) (_ BitVec 32) V!8411 V!8411 (_ BitVec 64) (_ BitVec 32) Int) Unit!7941)

(assert (=> b!255882 (= lt!128408 (lemmaArrayContainsKeyThenInListMap!232 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(assert (=> b!255882 false))

(declare-fun b!255883 () Bool)

(assert (=> b!255883 (= e!165865 ((_ is Undefined!1160) lt!128409))))

(declare-fun b!255884 () Bool)

(assert (=> b!255884 (= e!165865 e!165858)))

(declare-fun res!125205 () Bool)

(assert (=> b!255884 (= res!125205 call!24210)))

(assert (=> b!255884 (=> (not res!125205) (not e!165858))))

(declare-fun e!165863 () Bool)

(declare-fun array_inv!3911 (array!12485) Bool)

(declare-fun array_inv!3912 (array!12483) Bool)

(assert (=> b!255885 (= e!165863 (and tp!23430 tp_is_empty!6573 (array_inv!3911 (_keys!6881 thiss!1504)) (array_inv!3912 (_values!4704 thiss!1504)) e!165867))))

(declare-fun b!255886 () Bool)

(declare-fun Unit!7945 () Unit!7941)

(assert (=> b!255886 (= e!165869 Unit!7945)))

(declare-fun lt!128411 () Unit!7941)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!425 (array!12485 array!12483 (_ BitVec 32) (_ BitVec 32) V!8411 V!8411 (_ BitVec 64) Int) Unit!7941)

(assert (=> b!255886 (= lt!128411 (lemmaInListMapThenSeekEntryOrOpenFindsIt!425 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) key!932 (defaultEntry!4721 thiss!1504)))))

(assert (=> b!255886 false))

(declare-fun b!255887 () Bool)

(declare-fun lt!128405 () Unit!7941)

(assert (=> b!255887 (= e!165869 lt!128405)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!429 (array!12485 array!12483 (_ BitVec 32) (_ BitVec 32) V!8411 V!8411 (_ BitVec 64) Int) Unit!7941)

(assert (=> b!255887 (= lt!128405 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!429 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) key!932 (defaultEntry!4721 thiss!1504)))))

(assert (=> b!255887 (= c!43226 ((_ is MissingZero!1160) lt!128409))))

(assert (=> b!255887 e!165861))

(declare-fun res!125203 () Bool)

(assert (=> start!24424 (=> (not res!125203) (not e!165870))))

(declare-fun valid!1480 (LongMapFixedSize!3786) Bool)

(assert (=> start!24424 (= res!125203 (valid!1480 thiss!1504))))

(assert (=> start!24424 e!165870))

(assert (=> start!24424 e!165863))

(assert (=> start!24424 true))

(assert (=> start!24424 tp_is_empty!6573))

(declare-fun b!255875 () Bool)

(assert (=> b!255875 (= e!165858 (not call!24211))))

(declare-fun b!255888 () Bool)

(declare-fun res!125201 () Bool)

(declare-fun e!165859 () Bool)

(assert (=> b!255888 (=> (not res!125201) (not e!165859))))

(assert (=> b!255888 (= res!125201 (= (select (arr!5915 (_keys!6881 thiss!1504)) (index!6810 lt!128409)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255889 () Bool)

(assert (=> b!255889 (= e!165859 (not call!24211))))

(declare-fun b!255890 () Bool)

(declare-fun res!125199 () Bool)

(assert (=> b!255890 (=> (not res!125199) (not e!165859))))

(assert (=> b!255890 (= res!125199 call!24210)))

(assert (=> b!255890 (= e!165861 e!165859)))

(declare-fun b!255891 () Bool)

(assert (=> b!255891 (= e!165864 tp_is_empty!6573)))

(declare-fun mapIsEmpty!11184 () Bool)

(assert (=> mapIsEmpty!11184 mapRes!11184))

(assert (= (and start!24424 res!125203) b!255881))

(assert (= (and b!255881 res!125202) b!255876))

(assert (= (and b!255876 res!125204) b!255880))

(assert (= (and b!255880 c!43223) b!255886))

(assert (= (and b!255880 (not c!43223)) b!255887))

(assert (= (and b!255887 c!43226) b!255890))

(assert (= (and b!255887 (not c!43226)) b!255872))

(assert (= (and b!255890 res!125199) b!255888))

(assert (= (and b!255888 res!125201) b!255889))

(assert (= (and b!255872 c!43224) b!255884))

(assert (= (and b!255872 (not c!43224)) b!255883))

(assert (= (and b!255884 res!125205) b!255878))

(assert (= (and b!255878 res!125198) b!255875))

(assert (= (or b!255890 b!255884) bm!24207))

(assert (= (or b!255889 b!255875) bm!24208))

(assert (= (and b!255880 res!125200) b!255873))

(assert (= (and b!255873 c!43225) b!255882))

(assert (= (and b!255873 (not c!43225)) b!255877))

(assert (= (and b!255874 condMapEmpty!11184) mapIsEmpty!11184))

(assert (= (and b!255874 (not condMapEmpty!11184)) mapNonEmpty!11184))

(assert (= (and mapNonEmpty!11184 ((_ is ValueCellFull!2943) mapValue!11184)) b!255879))

(assert (= (and b!255874 ((_ is ValueCellFull!2943) mapDefault!11184)) b!255891))

(assert (= b!255885 b!255874))

(assert (= start!24424 b!255885))

(declare-fun m!271299 () Bool)

(assert (=> b!255873 m!271299))

(declare-fun m!271301 () Bool)

(assert (=> b!255873 m!271301))

(declare-fun m!271303 () Bool)

(assert (=> b!255873 m!271303))

(declare-fun m!271305 () Bool)

(assert (=> b!255873 m!271305))

(declare-fun m!271307 () Bool)

(assert (=> b!255873 m!271307))

(declare-fun m!271309 () Bool)

(assert (=> b!255873 m!271309))

(declare-fun m!271311 () Bool)

(assert (=> b!255873 m!271311))

(declare-fun m!271313 () Bool)

(assert (=> b!255873 m!271313))

(declare-fun m!271315 () Bool)

(assert (=> b!255873 m!271315))

(declare-fun m!271317 () Bool)

(assert (=> b!255873 m!271317))

(declare-fun m!271319 () Bool)

(assert (=> b!255873 m!271319))

(declare-fun m!271321 () Bool)

(assert (=> b!255873 m!271321))

(declare-fun m!271323 () Bool)

(assert (=> b!255873 m!271323))

(declare-fun m!271325 () Bool)

(assert (=> b!255887 m!271325))

(declare-fun m!271327 () Bool)

(assert (=> b!255882 m!271327))

(declare-fun m!271329 () Bool)

(assert (=> b!255885 m!271329))

(declare-fun m!271331 () Bool)

(assert (=> b!255885 m!271331))

(declare-fun m!271333 () Bool)

(assert (=> b!255886 m!271333))

(declare-fun m!271335 () Bool)

(assert (=> b!255888 m!271335))

(declare-fun m!271337 () Bool)

(assert (=> b!255880 m!271337))

(declare-fun m!271339 () Bool)

(assert (=> b!255880 m!271339))

(declare-fun m!271341 () Bool)

(assert (=> b!255880 m!271341))

(declare-fun m!271343 () Bool)

(assert (=> b!255876 m!271343))

(declare-fun m!271345 () Bool)

(assert (=> bm!24207 m!271345))

(declare-fun m!271347 () Bool)

(assert (=> b!255878 m!271347))

(declare-fun m!271349 () Bool)

(assert (=> start!24424 m!271349))

(assert (=> bm!24208 m!271317))

(declare-fun m!271351 () Bool)

(assert (=> mapNonEmpty!11184 m!271351))

(check-sat (not b!255876) (not b_next!6711) (not mapNonEmpty!11184) tp_is_empty!6573 (not b!255873) (not b!255880) (not bm!24207) (not b!255882) (not b!255885) (not b!255887) (not start!24424) b_and!13765 (not b!255886) (not bm!24208))
(check-sat b_and!13765 (not b_next!6711))
(get-model)

(declare-fun d!61623 () Bool)

(declare-fun res!125234 () Bool)

(declare-fun e!165918 () Bool)

(assert (=> d!61623 (=> res!125234 e!165918)))

(assert (=> d!61623 (= res!125234 (= (select (arr!5915 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61623 (= (arrayContainsKey!0 (_keys!6881 thiss!1504) key!932 #b00000000000000000000000000000000) e!165918)))

(declare-fun b!255956 () Bool)

(declare-fun e!165919 () Bool)

(assert (=> b!255956 (= e!165918 e!165919)))

(declare-fun res!125235 () Bool)

(assert (=> b!255956 (=> (not res!125235) (not e!165919))))

(assert (=> b!255956 (= res!125235 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6262 (_keys!6881 thiss!1504))))))

(declare-fun b!255957 () Bool)

(assert (=> b!255957 (= e!165919 (arrayContainsKey!0 (_keys!6881 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61623 (not res!125234)) b!255956))

(assert (= (and b!255956 res!125235) b!255957))

(declare-fun m!271407 () Bool)

(assert (=> d!61623 m!271407))

(declare-fun m!271409 () Bool)

(assert (=> b!255957 m!271409))

(assert (=> bm!24208 d!61623))

(declare-fun d!61625 () Bool)

(assert (=> d!61625 (= (inRange!0 index!297 (mask!10987 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10987 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!255880 d!61625))

(declare-fun d!61627 () Bool)

(declare-fun e!165925 () Bool)

(assert (=> d!61627 e!165925))

(declare-fun res!125238 () Bool)

(assert (=> d!61627 (=> res!125238 e!165925)))

(declare-fun lt!128459 () Bool)

(assert (=> d!61627 (= res!125238 (not lt!128459))))

(declare-fun lt!128458 () Bool)

(assert (=> d!61627 (= lt!128459 lt!128458)))

(declare-fun lt!128457 () Unit!7941)

(declare-fun e!165924 () Unit!7941)

(assert (=> d!61627 (= lt!128457 e!165924)))

(declare-fun c!43241 () Bool)

(assert (=> d!61627 (= c!43241 lt!128458)))

(declare-fun containsKey!300 (List!3786 (_ BitVec 64)) Bool)

(assert (=> d!61627 (= lt!128458 (containsKey!300 (toList!1925 lt!128404) key!932))))

(assert (=> d!61627 (= (contains!1861 lt!128404 key!932) lt!128459)))

(declare-fun b!255964 () Bool)

(declare-fun lt!128456 () Unit!7941)

(assert (=> b!255964 (= e!165924 lt!128456)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!248 (List!3786 (_ BitVec 64)) Unit!7941)

(assert (=> b!255964 (= lt!128456 (lemmaContainsKeyImpliesGetValueByKeyDefined!248 (toList!1925 lt!128404) key!932))))

(declare-datatypes ((Option!314 0))(
  ( (Some!313 (v!5418 V!8411)) (None!312) )
))
(declare-fun isDefined!249 (Option!314) Bool)

(declare-fun getValueByKey!308 (List!3786 (_ BitVec 64)) Option!314)

(assert (=> b!255964 (isDefined!249 (getValueByKey!308 (toList!1925 lt!128404) key!932))))

(declare-fun b!255965 () Bool)

(declare-fun Unit!7946 () Unit!7941)

(assert (=> b!255965 (= e!165924 Unit!7946)))

(declare-fun b!255966 () Bool)

(assert (=> b!255966 (= e!165925 (isDefined!249 (getValueByKey!308 (toList!1925 lt!128404) key!932)))))

(assert (= (and d!61627 c!43241) b!255964))

(assert (= (and d!61627 (not c!43241)) b!255965))

(assert (= (and d!61627 (not res!125238)) b!255966))

(declare-fun m!271411 () Bool)

(assert (=> d!61627 m!271411))

(declare-fun m!271413 () Bool)

(assert (=> b!255964 m!271413))

(declare-fun m!271415 () Bool)

(assert (=> b!255964 m!271415))

(assert (=> b!255964 m!271415))

(declare-fun m!271417 () Bool)

(assert (=> b!255964 m!271417))

(assert (=> b!255966 m!271415))

(assert (=> b!255966 m!271415))

(assert (=> b!255966 m!271417))

(assert (=> b!255880 d!61627))

(declare-fun call!24238 () ListLongMap!3819)

(declare-fun call!24233 () ListLongMap!3819)

(declare-fun c!43259 () Bool)

(declare-fun call!24236 () ListLongMap!3819)

(declare-fun call!24232 () ListLongMap!3819)

(declare-fun c!43258 () Bool)

(declare-fun bm!24229 () Bool)

(assert (=> bm!24229 (= call!24232 (+!680 (ite c!43259 call!24236 (ite c!43258 call!24238 call!24233)) (ite (or c!43259 c!43258) (tuple2!4907 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4562 thiss!1504)) (tuple2!4907 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4562 thiss!1504)))))))

(declare-fun bm!24230 () Bool)

(assert (=> bm!24230 (= call!24238 call!24236)))

(declare-fun b!256009 () Bool)

(declare-fun e!165955 () ListLongMap!3819)

(declare-fun call!24235 () ListLongMap!3819)

(assert (=> b!256009 (= e!165955 call!24235)))

(declare-fun b!256010 () Bool)

(declare-fun e!165952 () Bool)

(declare-fun lt!128518 () ListLongMap!3819)

(declare-fun apply!250 (ListLongMap!3819 (_ BitVec 64)) V!8411)

(assert (=> b!256010 (= e!165952 (= (apply!250 lt!128518 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4562 thiss!1504)))))

(declare-fun b!256011 () Bool)

(declare-fun e!165956 () ListLongMap!3819)

(assert (=> b!256011 (= e!165956 call!24235)))

(declare-fun bm!24231 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!572 (array!12485 array!12483 (_ BitVec 32) (_ BitVec 32) V!8411 V!8411 (_ BitVec 32) Int) ListLongMap!3819)

(assert (=> bm!24231 (= call!24236 (getCurrentListMapNoExtraKeys!572 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-fun b!256012 () Bool)

(declare-fun e!165964 () Bool)

(declare-fun e!165961 () Bool)

(assert (=> b!256012 (= e!165964 e!165961)))

(declare-fun res!125262 () Bool)

(assert (=> b!256012 (=> (not res!125262) (not e!165961))))

(assert (=> b!256012 (= res!125262 (contains!1861 lt!128518 (select (arr!5915 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!256012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))))))

(declare-fun b!256013 () Bool)

(declare-fun c!43255 () Bool)

(assert (=> b!256013 (= c!43255 (and (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!256013 (= e!165956 e!165955)))

(declare-fun b!256014 () Bool)

(declare-fun e!165953 () Bool)

(declare-fun e!165954 () Bool)

(assert (=> b!256014 (= e!165953 e!165954)))

(declare-fun c!43257 () Bool)

(assert (=> b!256014 (= c!43257 (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256015 () Bool)

(assert (=> b!256015 (= e!165954 e!165952)))

(declare-fun res!125261 () Bool)

(declare-fun call!24237 () Bool)

(assert (=> b!256015 (= res!125261 call!24237)))

(assert (=> b!256015 (=> (not res!125261) (not e!165952))))

(declare-fun bm!24232 () Bool)

(assert (=> bm!24232 (= call!24233 call!24238)))

(declare-fun d!61629 () Bool)

(assert (=> d!61629 e!165953))

(declare-fun res!125259 () Bool)

(assert (=> d!61629 (=> (not res!125259) (not e!165953))))

(assert (=> d!61629 (= res!125259 (or (bvsge #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))))))))

(declare-fun lt!128514 () ListLongMap!3819)

(assert (=> d!61629 (= lt!128518 lt!128514)))

(declare-fun lt!128522 () Unit!7941)

(declare-fun e!165960 () Unit!7941)

(assert (=> d!61629 (= lt!128522 e!165960)))

(declare-fun c!43256 () Bool)

(declare-fun e!165963 () Bool)

(assert (=> d!61629 (= c!43256 e!165963)))

(declare-fun res!125260 () Bool)

(assert (=> d!61629 (=> (not res!125260) (not e!165963))))

(assert (=> d!61629 (= res!125260 (bvslt #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))))))

(declare-fun e!165959 () ListLongMap!3819)

(assert (=> d!61629 (= lt!128514 e!165959)))

(assert (=> d!61629 (= c!43259 (and (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61629 (validMask!0 (mask!10987 thiss!1504))))

(assert (=> d!61629 (= (getCurrentListMap!1453 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)) lt!128518)))

(declare-fun b!256016 () Bool)

(declare-fun e!165962 () Bool)

(assert (=> b!256016 (= e!165962 (= (apply!250 lt!128518 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4562 thiss!1504)))))

(declare-fun b!256017 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!256017 (= e!165963 (validKeyInArray!0 (select (arr!5915 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256018 () Bool)

(declare-fun lt!128504 () Unit!7941)

(assert (=> b!256018 (= e!165960 lt!128504)))

(declare-fun lt!128513 () ListLongMap!3819)

(assert (=> b!256018 (= lt!128513 (getCurrentListMapNoExtraKeys!572 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-fun lt!128512 () (_ BitVec 64))

(assert (=> b!256018 (= lt!128512 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128511 () (_ BitVec 64))

(assert (=> b!256018 (= lt!128511 (select (arr!5915 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128525 () Unit!7941)

(declare-fun addStillContains!226 (ListLongMap!3819 (_ BitVec 64) V!8411 (_ BitVec 64)) Unit!7941)

(assert (=> b!256018 (= lt!128525 (addStillContains!226 lt!128513 lt!128512 (zeroValue!4562 thiss!1504) lt!128511))))

(assert (=> b!256018 (contains!1861 (+!680 lt!128513 (tuple2!4907 lt!128512 (zeroValue!4562 thiss!1504))) lt!128511)))

(declare-fun lt!128506 () Unit!7941)

(assert (=> b!256018 (= lt!128506 lt!128525)))

(declare-fun lt!128509 () ListLongMap!3819)

(assert (=> b!256018 (= lt!128509 (getCurrentListMapNoExtraKeys!572 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-fun lt!128508 () (_ BitVec 64))

(assert (=> b!256018 (= lt!128508 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128516 () (_ BitVec 64))

(assert (=> b!256018 (= lt!128516 (select (arr!5915 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128510 () Unit!7941)

(declare-fun addApplyDifferent!226 (ListLongMap!3819 (_ BitVec 64) V!8411 (_ BitVec 64)) Unit!7941)

(assert (=> b!256018 (= lt!128510 (addApplyDifferent!226 lt!128509 lt!128508 (minValue!4562 thiss!1504) lt!128516))))

(assert (=> b!256018 (= (apply!250 (+!680 lt!128509 (tuple2!4907 lt!128508 (minValue!4562 thiss!1504))) lt!128516) (apply!250 lt!128509 lt!128516))))

(declare-fun lt!128523 () Unit!7941)

(assert (=> b!256018 (= lt!128523 lt!128510)))

(declare-fun lt!128521 () ListLongMap!3819)

(assert (=> b!256018 (= lt!128521 (getCurrentListMapNoExtraKeys!572 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-fun lt!128515 () (_ BitVec 64))

(assert (=> b!256018 (= lt!128515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128524 () (_ BitVec 64))

(assert (=> b!256018 (= lt!128524 (select (arr!5915 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128519 () Unit!7941)

(assert (=> b!256018 (= lt!128519 (addApplyDifferent!226 lt!128521 lt!128515 (zeroValue!4562 thiss!1504) lt!128524))))

(assert (=> b!256018 (= (apply!250 (+!680 lt!128521 (tuple2!4907 lt!128515 (zeroValue!4562 thiss!1504))) lt!128524) (apply!250 lt!128521 lt!128524))))

(declare-fun lt!128517 () Unit!7941)

(assert (=> b!256018 (= lt!128517 lt!128519)))

(declare-fun lt!128505 () ListLongMap!3819)

(assert (=> b!256018 (= lt!128505 (getCurrentListMapNoExtraKeys!572 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-fun lt!128520 () (_ BitVec 64))

(assert (=> b!256018 (= lt!128520 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128507 () (_ BitVec 64))

(assert (=> b!256018 (= lt!128507 (select (arr!5915 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256018 (= lt!128504 (addApplyDifferent!226 lt!128505 lt!128520 (minValue!4562 thiss!1504) lt!128507))))

(assert (=> b!256018 (= (apply!250 (+!680 lt!128505 (tuple2!4907 lt!128520 (minValue!4562 thiss!1504))) lt!128507) (apply!250 lt!128505 lt!128507))))

(declare-fun bm!24233 () Bool)

(assert (=> bm!24233 (= call!24235 call!24232)))

(declare-fun b!256019 () Bool)

(declare-fun e!165958 () Bool)

(declare-fun call!24234 () Bool)

(assert (=> b!256019 (= e!165958 (not call!24234))))

(declare-fun b!256020 () Bool)

(assert (=> b!256020 (= e!165959 (+!680 call!24232 (tuple2!4907 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4562 thiss!1504))))))

(declare-fun b!256021 () Bool)

(assert (=> b!256021 (= e!165955 call!24233)))

(declare-fun b!256022 () Bool)

(declare-fun Unit!7947 () Unit!7941)

(assert (=> b!256022 (= e!165960 Unit!7947)))

(declare-fun b!256023 () Bool)

(declare-fun res!125257 () Bool)

(assert (=> b!256023 (=> (not res!125257) (not e!165953))))

(assert (=> b!256023 (= res!125257 e!165958)))

(declare-fun c!43254 () Bool)

(assert (=> b!256023 (= c!43254 (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!256024 () Bool)

(declare-fun res!125258 () Bool)

(assert (=> b!256024 (=> (not res!125258) (not e!165953))))

(assert (=> b!256024 (= res!125258 e!165964)))

(declare-fun res!125263 () Bool)

(assert (=> b!256024 (=> res!125263 e!165964)))

(declare-fun e!165957 () Bool)

(assert (=> b!256024 (= res!125263 (not e!165957))))

(declare-fun res!125265 () Bool)

(assert (=> b!256024 (=> (not res!125265) (not e!165957))))

(assert (=> b!256024 (= res!125265 (bvslt #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))))))

(declare-fun b!256025 () Bool)

(assert (=> b!256025 (= e!165958 e!165962)))

(declare-fun res!125264 () Bool)

(assert (=> b!256025 (= res!125264 call!24234)))

(assert (=> b!256025 (=> (not res!125264) (not e!165962))))

(declare-fun bm!24234 () Bool)

(assert (=> bm!24234 (= call!24237 (contains!1861 lt!128518 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256026 () Bool)

(assert (=> b!256026 (= e!165954 (not call!24237))))

(declare-fun b!256027 () Bool)

(assert (=> b!256027 (= e!165957 (validKeyInArray!0 (select (arr!5915 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256028 () Bool)

(declare-fun get!3041 (ValueCell!2943 V!8411) V!8411)

(declare-fun dynLambda!593 (Int (_ BitVec 64)) V!8411)

(assert (=> b!256028 (= e!165961 (= (apply!250 lt!128518 (select (arr!5915 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000)) (get!3041 (select (arr!5914 (_values!4704 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4721 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6261 (_values!4704 thiss!1504))))))

(assert (=> b!256028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))))))

(declare-fun bm!24235 () Bool)

(assert (=> bm!24235 (= call!24234 (contains!1861 lt!128518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256029 () Bool)

(assert (=> b!256029 (= e!165959 e!165956)))

(assert (=> b!256029 (= c!43258 (and (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61629 c!43259) b!256020))

(assert (= (and d!61629 (not c!43259)) b!256029))

(assert (= (and b!256029 c!43258) b!256011))

(assert (= (and b!256029 (not c!43258)) b!256013))

(assert (= (and b!256013 c!43255) b!256009))

(assert (= (and b!256013 (not c!43255)) b!256021))

(assert (= (or b!256009 b!256021) bm!24232))

(assert (= (or b!256011 bm!24232) bm!24230))

(assert (= (or b!256011 b!256009) bm!24233))

(assert (= (or b!256020 bm!24230) bm!24231))

(assert (= (or b!256020 bm!24233) bm!24229))

(assert (= (and d!61629 res!125260) b!256017))

(assert (= (and d!61629 c!43256) b!256018))

(assert (= (and d!61629 (not c!43256)) b!256022))

(assert (= (and d!61629 res!125259) b!256024))

(assert (= (and b!256024 res!125265) b!256027))

(assert (= (and b!256024 (not res!125263)) b!256012))

(assert (= (and b!256012 res!125262) b!256028))

(assert (= (and b!256024 res!125258) b!256023))

(assert (= (and b!256023 c!43254) b!256025))

(assert (= (and b!256023 (not c!43254)) b!256019))

(assert (= (and b!256025 res!125264) b!256016))

(assert (= (or b!256025 b!256019) bm!24235))

(assert (= (and b!256023 res!125257) b!256014))

(assert (= (and b!256014 c!43257) b!256015))

(assert (= (and b!256014 (not c!43257)) b!256026))

(assert (= (and b!256015 res!125261) b!256010))

(assert (= (or b!256015 b!256026) bm!24234))

(declare-fun b_lambda!8155 () Bool)

(assert (=> (not b_lambda!8155) (not b!256028)))

(declare-fun t!8842 () Bool)

(declare-fun tb!3013 () Bool)

(assert (=> (and b!255885 (= (defaultEntry!4721 thiss!1504) (defaultEntry!4721 thiss!1504)) t!8842) tb!3013))

(declare-fun result!5361 () Bool)

(assert (=> tb!3013 (= result!5361 tp_is_empty!6573)))

(assert (=> b!256028 t!8842))

(declare-fun b_and!13769 () Bool)

(assert (= b_and!13765 (and (=> t!8842 result!5361) b_and!13769)))

(declare-fun m!271419 () Bool)

(assert (=> b!256010 m!271419))

(declare-fun m!271421 () Bool)

(assert (=> b!256018 m!271421))

(declare-fun m!271423 () Bool)

(assert (=> b!256018 m!271423))

(declare-fun m!271425 () Bool)

(assert (=> b!256018 m!271425))

(declare-fun m!271427 () Bool)

(assert (=> b!256018 m!271427))

(declare-fun m!271429 () Bool)

(assert (=> b!256018 m!271429))

(assert (=> b!256018 m!271423))

(declare-fun m!271431 () Bool)

(assert (=> b!256018 m!271431))

(declare-fun m!271433 () Bool)

(assert (=> b!256018 m!271433))

(declare-fun m!271435 () Bool)

(assert (=> b!256018 m!271435))

(declare-fun m!271437 () Bool)

(assert (=> b!256018 m!271437))

(declare-fun m!271439 () Bool)

(assert (=> b!256018 m!271439))

(declare-fun m!271441 () Bool)

(assert (=> b!256018 m!271441))

(assert (=> b!256018 m!271433))

(declare-fun m!271443 () Bool)

(assert (=> b!256018 m!271443))

(declare-fun m!271445 () Bool)

(assert (=> b!256018 m!271445))

(assert (=> b!256018 m!271407))

(declare-fun m!271447 () Bool)

(assert (=> b!256018 m!271447))

(declare-fun m!271449 () Bool)

(assert (=> b!256018 m!271449))

(assert (=> b!256018 m!271437))

(assert (=> b!256018 m!271445))

(declare-fun m!271451 () Bool)

(assert (=> b!256018 m!271451))

(declare-fun m!271453 () Bool)

(assert (=> bm!24235 m!271453))

(declare-fun m!271455 () Bool)

(assert (=> b!256016 m!271455))

(declare-fun m!271457 () Bool)

(assert (=> bm!24234 m!271457))

(assert (=> b!256012 m!271407))

(assert (=> b!256012 m!271407))

(declare-fun m!271459 () Bool)

(assert (=> b!256012 m!271459))

(declare-fun m!271461 () Bool)

(assert (=> b!256028 m!271461))

(assert (=> b!256028 m!271407))

(declare-fun m!271463 () Bool)

(assert (=> b!256028 m!271463))

(assert (=> b!256028 m!271407))

(declare-fun m!271465 () Bool)

(assert (=> b!256028 m!271465))

(assert (=> b!256028 m!271465))

(assert (=> b!256028 m!271461))

(declare-fun m!271467 () Bool)

(assert (=> b!256028 m!271467))

(declare-fun m!271469 () Bool)

(assert (=> d!61629 m!271469))

(assert (=> bm!24231 m!271443))

(assert (=> b!256027 m!271407))

(assert (=> b!256027 m!271407))

(declare-fun m!271471 () Bool)

(assert (=> b!256027 m!271471))

(declare-fun m!271473 () Bool)

(assert (=> b!256020 m!271473))

(assert (=> b!256017 m!271407))

(assert (=> b!256017 m!271407))

(assert (=> b!256017 m!271471))

(declare-fun m!271475 () Bool)

(assert (=> bm!24229 m!271475))

(assert (=> b!255880 d!61629))

(declare-fun d!61631 () Bool)

(declare-fun e!165967 () Bool)

(assert (=> d!61631 e!165967))

(declare-fun res!125270 () Bool)

(assert (=> d!61631 (=> (not res!125270) (not e!165967))))

(declare-fun lt!128530 () SeekEntryResult!1160)

(assert (=> d!61631 (= res!125270 ((_ is Found!1160) lt!128530))))

(assert (=> d!61631 (= lt!128530 (seekEntryOrOpen!0 key!932 (_keys!6881 thiss!1504) (mask!10987 thiss!1504)))))

(declare-fun lt!128531 () Unit!7941)

(declare-fun choose!1224 (array!12485 array!12483 (_ BitVec 32) (_ BitVec 32) V!8411 V!8411 (_ BitVec 64) Int) Unit!7941)

(assert (=> d!61631 (= lt!128531 (choose!1224 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) key!932 (defaultEntry!4721 thiss!1504)))))

(assert (=> d!61631 (validMask!0 (mask!10987 thiss!1504))))

(assert (=> d!61631 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!425 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) key!932 (defaultEntry!4721 thiss!1504)) lt!128531)))

(declare-fun b!256036 () Bool)

(declare-fun res!125271 () Bool)

(assert (=> b!256036 (=> (not res!125271) (not e!165967))))

(assert (=> b!256036 (= res!125271 (inRange!0 (index!6811 lt!128530) (mask!10987 thiss!1504)))))

(declare-fun b!256037 () Bool)

(assert (=> b!256037 (= e!165967 (= (select (arr!5915 (_keys!6881 thiss!1504)) (index!6811 lt!128530)) key!932))))

(assert (=> b!256037 (and (bvsge (index!6811 lt!128530) #b00000000000000000000000000000000) (bvslt (index!6811 lt!128530) (size!6262 (_keys!6881 thiss!1504))))))

(assert (= (and d!61631 res!125270) b!256036))

(assert (= (and b!256036 res!125271) b!256037))

(assert (=> d!61631 m!271343))

(declare-fun m!271477 () Bool)

(assert (=> d!61631 m!271477))

(assert (=> d!61631 m!271469))

(declare-fun m!271479 () Bool)

(assert (=> b!256036 m!271479))

(declare-fun m!271481 () Bool)

(assert (=> b!256037 m!271481))

(assert (=> b!255886 d!61631))

(declare-fun b!256046 () Bool)

(declare-fun e!165973 () (_ BitVec 32))

(declare-fun e!165972 () (_ BitVec 32))

(assert (=> b!256046 (= e!165973 e!165972)))

(declare-fun c!43264 () Bool)

(assert (=> b!256046 (= c!43264 (validKeyInArray!0 (select (arr!5915 lt!128407) #b00000000000000000000000000000000)))))

(declare-fun bm!24238 () Bool)

(declare-fun call!24241 () (_ BitVec 32))

(assert (=> bm!24238 (= call!24241 (arrayCountValidKeys!0 lt!128407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6262 (_keys!6881 thiss!1504))))))

(declare-fun d!61633 () Bool)

(declare-fun lt!128534 () (_ BitVec 32))

(assert (=> d!61633 (and (bvsge lt!128534 #b00000000000000000000000000000000) (bvsle lt!128534 (bvsub (size!6262 lt!128407) #b00000000000000000000000000000000)))))

(assert (=> d!61633 (= lt!128534 e!165973)))

(declare-fun c!43265 () Bool)

(assert (=> d!61633 (= c!43265 (bvsge #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))))))

(assert (=> d!61633 (and (bvsle #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6262 (_keys!6881 thiss!1504)) (size!6262 lt!128407)))))

(assert (=> d!61633 (= (arrayCountValidKeys!0 lt!128407 #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))) lt!128534)))

(declare-fun b!256047 () Bool)

(assert (=> b!256047 (= e!165972 call!24241)))

(declare-fun b!256048 () Bool)

(assert (=> b!256048 (= e!165972 (bvadd #b00000000000000000000000000000001 call!24241))))

(declare-fun b!256049 () Bool)

(assert (=> b!256049 (= e!165973 #b00000000000000000000000000000000)))

(assert (= (and d!61633 c!43265) b!256049))

(assert (= (and d!61633 (not c!43265)) b!256046))

(assert (= (and b!256046 c!43264) b!256048))

(assert (= (and b!256046 (not c!43264)) b!256047))

(assert (= (or b!256048 b!256047) bm!24238))

(declare-fun m!271483 () Bool)

(assert (=> b!256046 m!271483))

(assert (=> b!256046 m!271483))

(declare-fun m!271485 () Bool)

(assert (=> b!256046 m!271485))

(declare-fun m!271487 () Bool)

(assert (=> bm!24238 m!271487))

(assert (=> b!255873 d!61633))

(declare-fun b!256061 () Bool)

(declare-fun e!165979 () Bool)

(assert (=> b!256061 (= e!165979 (= (arrayCountValidKeys!0 (array!12486 (store (arr!5915 (_keys!6881 thiss!1504)) index!297 key!932) (size!6262 (_keys!6881 thiss!1504))) #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6881 thiss!1504) #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!256059 () Bool)

(declare-fun res!125283 () Bool)

(declare-fun e!165978 () Bool)

(assert (=> b!256059 (=> (not res!125283) (not e!165978))))

(assert (=> b!256059 (= res!125283 (validKeyInArray!0 key!932))))

(declare-fun d!61635 () Bool)

(assert (=> d!61635 e!165979))

(declare-fun res!125282 () Bool)

(assert (=> d!61635 (=> (not res!125282) (not e!165979))))

(assert (=> d!61635 (= res!125282 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6262 (_keys!6881 thiss!1504)))))))

(declare-fun lt!128537 () Unit!7941)

(declare-fun choose!1 (array!12485 (_ BitVec 32) (_ BitVec 64)) Unit!7941)

(assert (=> d!61635 (= lt!128537 (choose!1 (_keys!6881 thiss!1504) index!297 key!932))))

(assert (=> d!61635 e!165978))

(declare-fun res!125280 () Bool)

(assert (=> d!61635 (=> (not res!125280) (not e!165978))))

(assert (=> d!61635 (= res!125280 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6262 (_keys!6881 thiss!1504)))))))

(assert (=> d!61635 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6881 thiss!1504) index!297 key!932) lt!128537)))

(declare-fun b!256058 () Bool)

(declare-fun res!125281 () Bool)

(assert (=> b!256058 (=> (not res!125281) (not e!165978))))

(assert (=> b!256058 (= res!125281 (not (validKeyInArray!0 (select (arr!5915 (_keys!6881 thiss!1504)) index!297))))))

(declare-fun b!256060 () Bool)

(assert (=> b!256060 (= e!165978 (bvslt (size!6262 (_keys!6881 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!61635 res!125280) b!256058))

(assert (= (and b!256058 res!125281) b!256059))

(assert (= (and b!256059 res!125283) b!256060))

(assert (= (and d!61635 res!125282) b!256061))

(assert (=> b!256061 m!271309))

(declare-fun m!271489 () Bool)

(assert (=> b!256061 m!271489))

(assert (=> b!256061 m!271311))

(declare-fun m!271491 () Bool)

(assert (=> b!256059 m!271491))

(declare-fun m!271493 () Bool)

(assert (=> d!61635 m!271493))

(declare-fun m!271495 () Bool)

(assert (=> b!256058 m!271495))

(assert (=> b!256058 m!271495))

(declare-fun m!271497 () Bool)

(assert (=> b!256058 m!271497))

(assert (=> b!255873 d!61635))

(declare-fun b!256062 () Bool)

(declare-fun e!165981 () (_ BitVec 32))

(declare-fun e!165980 () (_ BitVec 32))

(assert (=> b!256062 (= e!165981 e!165980)))

(declare-fun c!43266 () Bool)

(assert (=> b!256062 (= c!43266 (validKeyInArray!0 (select (arr!5915 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24239 () Bool)

(declare-fun call!24242 () (_ BitVec 32))

(assert (=> bm!24239 (= call!24242 (arrayCountValidKeys!0 (_keys!6881 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6262 (_keys!6881 thiss!1504))))))

(declare-fun d!61637 () Bool)

(declare-fun lt!128538 () (_ BitVec 32))

(assert (=> d!61637 (and (bvsge lt!128538 #b00000000000000000000000000000000) (bvsle lt!128538 (bvsub (size!6262 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61637 (= lt!128538 e!165981)))

(declare-fun c!43267 () Bool)

(assert (=> d!61637 (= c!43267 (bvsge #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))))))

(assert (=> d!61637 (and (bvsle #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6262 (_keys!6881 thiss!1504)) (size!6262 (_keys!6881 thiss!1504))))))

(assert (=> d!61637 (= (arrayCountValidKeys!0 (_keys!6881 thiss!1504) #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))) lt!128538)))

(declare-fun b!256063 () Bool)

(assert (=> b!256063 (= e!165980 call!24242)))

(declare-fun b!256064 () Bool)

(assert (=> b!256064 (= e!165980 (bvadd #b00000000000000000000000000000001 call!24242))))

(declare-fun b!256065 () Bool)

(assert (=> b!256065 (= e!165981 #b00000000000000000000000000000000)))

(assert (= (and d!61637 c!43267) b!256065))

(assert (= (and d!61637 (not c!43267)) b!256062))

(assert (= (and b!256062 c!43266) b!256064))

(assert (= (and b!256062 (not c!43266)) b!256063))

(assert (= (or b!256064 b!256063) bm!24239))

(assert (=> b!256062 m!271407))

(assert (=> b!256062 m!271407))

(assert (=> b!256062 m!271471))

(declare-fun m!271499 () Bool)

(assert (=> bm!24239 m!271499))

(assert (=> b!255873 d!61637))

(declare-fun d!61639 () Bool)

(declare-fun e!165984 () Bool)

(assert (=> d!61639 e!165984))

(declare-fun res!125286 () Bool)

(assert (=> d!61639 (=> (not res!125286) (not e!165984))))

(assert (=> d!61639 (= res!125286 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6262 (_keys!6881 thiss!1504))) (bvslt index!297 (size!6261 (_values!4704 thiss!1504)))))))

(declare-fun lt!128541 () Unit!7941)

(declare-fun choose!1225 (array!12485 array!12483 (_ BitVec 32) (_ BitVec 32) V!8411 V!8411 (_ BitVec 32) (_ BitVec 64) V!8411 Int) Unit!7941)

(assert (=> d!61639 (= lt!128541 (choose!1225 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) index!297 key!932 v!346 (defaultEntry!4721 thiss!1504)))))

(assert (=> d!61639 (validMask!0 (mask!10987 thiss!1504))))

(assert (=> d!61639 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!90 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) index!297 key!932 v!346 (defaultEntry!4721 thiss!1504)) lt!128541)))

(declare-fun b!256068 () Bool)

(assert (=> b!256068 (= e!165984 (= (+!680 (getCurrentListMap!1453 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)) (tuple2!4907 key!932 v!346)) (getCurrentListMap!1453 (array!12486 (store (arr!5915 (_keys!6881 thiss!1504)) index!297 key!932) (size!6262 (_keys!6881 thiss!1504))) (array!12484 (store (arr!5914 (_values!4704 thiss!1504)) index!297 (ValueCellFull!2943 v!346)) (size!6261 (_values!4704 thiss!1504))) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504))))))

(assert (= (and d!61639 res!125286) b!256068))

(declare-fun m!271501 () Bool)

(assert (=> d!61639 m!271501))

(assert (=> d!61639 m!271469))

(declare-fun m!271503 () Bool)

(assert (=> b!256068 m!271503))

(assert (=> b!256068 m!271309))

(assert (=> b!256068 m!271341))

(assert (=> b!256068 m!271299))

(assert (=> b!256068 m!271341))

(declare-fun m!271505 () Bool)

(assert (=> b!256068 m!271505))

(assert (=> b!255873 d!61639))

(declare-fun d!61641 () Bool)

(declare-fun e!165987 () Bool)

(assert (=> d!61641 e!165987))

(declare-fun res!125292 () Bool)

(assert (=> d!61641 (=> (not res!125292) (not e!165987))))

(declare-fun lt!128550 () ListLongMap!3819)

(assert (=> d!61641 (= res!125292 (contains!1861 lt!128550 (_1!2464 (tuple2!4907 key!932 v!346))))))

(declare-fun lt!128553 () List!3786)

(assert (=> d!61641 (= lt!128550 (ListLongMap!3820 lt!128553))))

(declare-fun lt!128552 () Unit!7941)

(declare-fun lt!128551 () Unit!7941)

(assert (=> d!61641 (= lt!128552 lt!128551)))

(assert (=> d!61641 (= (getValueByKey!308 lt!128553 (_1!2464 (tuple2!4907 key!932 v!346))) (Some!313 (_2!2464 (tuple2!4907 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!164 (List!3786 (_ BitVec 64) V!8411) Unit!7941)

(assert (=> d!61641 (= lt!128551 (lemmaContainsTupThenGetReturnValue!164 lt!128553 (_1!2464 (tuple2!4907 key!932 v!346)) (_2!2464 (tuple2!4907 key!932 v!346))))))

(declare-fun insertStrictlySorted!167 (List!3786 (_ BitVec 64) V!8411) List!3786)

(assert (=> d!61641 (= lt!128553 (insertStrictlySorted!167 (toList!1925 lt!128404) (_1!2464 (tuple2!4907 key!932 v!346)) (_2!2464 (tuple2!4907 key!932 v!346))))))

(assert (=> d!61641 (= (+!680 lt!128404 (tuple2!4907 key!932 v!346)) lt!128550)))

(declare-fun b!256073 () Bool)

(declare-fun res!125291 () Bool)

(assert (=> b!256073 (=> (not res!125291) (not e!165987))))

(assert (=> b!256073 (= res!125291 (= (getValueByKey!308 (toList!1925 lt!128550) (_1!2464 (tuple2!4907 key!932 v!346))) (Some!313 (_2!2464 (tuple2!4907 key!932 v!346)))))))

(declare-fun b!256074 () Bool)

(declare-fun contains!1862 (List!3786 tuple2!4906) Bool)

(assert (=> b!256074 (= e!165987 (contains!1862 (toList!1925 lt!128550) (tuple2!4907 key!932 v!346)))))

(assert (= (and d!61641 res!125292) b!256073))

(assert (= (and b!256073 res!125291) b!256074))

(declare-fun m!271507 () Bool)

(assert (=> d!61641 m!271507))

(declare-fun m!271509 () Bool)

(assert (=> d!61641 m!271509))

(declare-fun m!271511 () Bool)

(assert (=> d!61641 m!271511))

(declare-fun m!271513 () Bool)

(assert (=> d!61641 m!271513))

(declare-fun m!271515 () Bool)

(assert (=> b!256073 m!271515))

(declare-fun m!271517 () Bool)

(assert (=> b!256074 m!271517))

(assert (=> b!255873 d!61641))

(declare-fun bm!24240 () Bool)

(declare-fun call!24249 () ListLongMap!3819)

(declare-fun call!24243 () ListLongMap!3819)

(declare-fun call!24247 () ListLongMap!3819)

(declare-fun c!43272 () Bool)

(declare-fun c!43273 () Bool)

(declare-fun call!24244 () ListLongMap!3819)

(assert (=> bm!24240 (= call!24243 (+!680 (ite c!43273 call!24247 (ite c!43272 call!24249 call!24244)) (ite (or c!43273 c!43272) (tuple2!4907 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4562 thiss!1504)) (tuple2!4907 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4562 thiss!1504)))))))

(declare-fun bm!24241 () Bool)

(assert (=> bm!24241 (= call!24249 call!24247)))

(declare-fun b!256075 () Bool)

(declare-fun e!165991 () ListLongMap!3819)

(declare-fun call!24246 () ListLongMap!3819)

(assert (=> b!256075 (= e!165991 call!24246)))

(declare-fun b!256076 () Bool)

(declare-fun e!165988 () Bool)

(declare-fun lt!128568 () ListLongMap!3819)

(assert (=> b!256076 (= e!165988 (= (apply!250 lt!128568 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4562 thiss!1504)))))

(declare-fun b!256077 () Bool)

(declare-fun e!165992 () ListLongMap!3819)

(assert (=> b!256077 (= e!165992 call!24246)))

(declare-fun bm!24242 () Bool)

(assert (=> bm!24242 (= call!24247 (getCurrentListMapNoExtraKeys!572 lt!128407 (array!12484 (store (arr!5914 (_values!4704 thiss!1504)) index!297 (ValueCellFull!2943 v!346)) (size!6261 (_values!4704 thiss!1504))) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-fun b!256078 () Bool)

(declare-fun e!166000 () Bool)

(declare-fun e!165997 () Bool)

(assert (=> b!256078 (= e!166000 e!165997)))

(declare-fun res!125298 () Bool)

(assert (=> b!256078 (=> (not res!125298) (not e!165997))))

(assert (=> b!256078 (= res!125298 (contains!1861 lt!128568 (select (arr!5915 lt!128407) #b00000000000000000000000000000000)))))

(assert (=> b!256078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 lt!128407)))))

(declare-fun b!256079 () Bool)

(declare-fun c!43269 () Bool)

(assert (=> b!256079 (= c!43269 (and (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!256079 (= e!165992 e!165991)))

(declare-fun b!256080 () Bool)

(declare-fun e!165989 () Bool)

(declare-fun e!165990 () Bool)

(assert (=> b!256080 (= e!165989 e!165990)))

(declare-fun c!43271 () Bool)

(assert (=> b!256080 (= c!43271 (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256081 () Bool)

(assert (=> b!256081 (= e!165990 e!165988)))

(declare-fun res!125297 () Bool)

(declare-fun call!24248 () Bool)

(assert (=> b!256081 (= res!125297 call!24248)))

(assert (=> b!256081 (=> (not res!125297) (not e!165988))))

(declare-fun bm!24243 () Bool)

(assert (=> bm!24243 (= call!24244 call!24249)))

(declare-fun d!61643 () Bool)

(assert (=> d!61643 e!165989))

(declare-fun res!125295 () Bool)

(assert (=> d!61643 (=> (not res!125295) (not e!165989))))

(assert (=> d!61643 (= res!125295 (or (bvsge #b00000000000000000000000000000000 (size!6262 lt!128407)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 lt!128407)))))))

(declare-fun lt!128564 () ListLongMap!3819)

(assert (=> d!61643 (= lt!128568 lt!128564)))

(declare-fun lt!128572 () Unit!7941)

(declare-fun e!165996 () Unit!7941)

(assert (=> d!61643 (= lt!128572 e!165996)))

(declare-fun c!43270 () Bool)

(declare-fun e!165999 () Bool)

(assert (=> d!61643 (= c!43270 e!165999)))

(declare-fun res!125296 () Bool)

(assert (=> d!61643 (=> (not res!125296) (not e!165999))))

(assert (=> d!61643 (= res!125296 (bvslt #b00000000000000000000000000000000 (size!6262 lt!128407)))))

(declare-fun e!165995 () ListLongMap!3819)

(assert (=> d!61643 (= lt!128564 e!165995)))

(assert (=> d!61643 (= c!43273 (and (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61643 (validMask!0 (mask!10987 thiss!1504))))

(assert (=> d!61643 (= (getCurrentListMap!1453 lt!128407 (array!12484 (store (arr!5914 (_values!4704 thiss!1504)) index!297 (ValueCellFull!2943 v!346)) (size!6261 (_values!4704 thiss!1504))) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)) lt!128568)))

(declare-fun b!256082 () Bool)

(declare-fun e!165998 () Bool)

(assert (=> b!256082 (= e!165998 (= (apply!250 lt!128568 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4562 thiss!1504)))))

(declare-fun b!256083 () Bool)

(assert (=> b!256083 (= e!165999 (validKeyInArray!0 (select (arr!5915 lt!128407) #b00000000000000000000000000000000)))))

(declare-fun b!256084 () Bool)

(declare-fun lt!128554 () Unit!7941)

(assert (=> b!256084 (= e!165996 lt!128554)))

(declare-fun lt!128563 () ListLongMap!3819)

(assert (=> b!256084 (= lt!128563 (getCurrentListMapNoExtraKeys!572 lt!128407 (array!12484 (store (arr!5914 (_values!4704 thiss!1504)) index!297 (ValueCellFull!2943 v!346)) (size!6261 (_values!4704 thiss!1504))) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-fun lt!128562 () (_ BitVec 64))

(assert (=> b!256084 (= lt!128562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128561 () (_ BitVec 64))

(assert (=> b!256084 (= lt!128561 (select (arr!5915 lt!128407) #b00000000000000000000000000000000))))

(declare-fun lt!128575 () Unit!7941)

(assert (=> b!256084 (= lt!128575 (addStillContains!226 lt!128563 lt!128562 (zeroValue!4562 thiss!1504) lt!128561))))

(assert (=> b!256084 (contains!1861 (+!680 lt!128563 (tuple2!4907 lt!128562 (zeroValue!4562 thiss!1504))) lt!128561)))

(declare-fun lt!128556 () Unit!7941)

(assert (=> b!256084 (= lt!128556 lt!128575)))

(declare-fun lt!128559 () ListLongMap!3819)

(assert (=> b!256084 (= lt!128559 (getCurrentListMapNoExtraKeys!572 lt!128407 (array!12484 (store (arr!5914 (_values!4704 thiss!1504)) index!297 (ValueCellFull!2943 v!346)) (size!6261 (_values!4704 thiss!1504))) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-fun lt!128558 () (_ BitVec 64))

(assert (=> b!256084 (= lt!128558 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128566 () (_ BitVec 64))

(assert (=> b!256084 (= lt!128566 (select (arr!5915 lt!128407) #b00000000000000000000000000000000))))

(declare-fun lt!128560 () Unit!7941)

(assert (=> b!256084 (= lt!128560 (addApplyDifferent!226 lt!128559 lt!128558 (minValue!4562 thiss!1504) lt!128566))))

(assert (=> b!256084 (= (apply!250 (+!680 lt!128559 (tuple2!4907 lt!128558 (minValue!4562 thiss!1504))) lt!128566) (apply!250 lt!128559 lt!128566))))

(declare-fun lt!128573 () Unit!7941)

(assert (=> b!256084 (= lt!128573 lt!128560)))

(declare-fun lt!128571 () ListLongMap!3819)

(assert (=> b!256084 (= lt!128571 (getCurrentListMapNoExtraKeys!572 lt!128407 (array!12484 (store (arr!5914 (_values!4704 thiss!1504)) index!297 (ValueCellFull!2943 v!346)) (size!6261 (_values!4704 thiss!1504))) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-fun lt!128565 () (_ BitVec 64))

(assert (=> b!256084 (= lt!128565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128574 () (_ BitVec 64))

(assert (=> b!256084 (= lt!128574 (select (arr!5915 lt!128407) #b00000000000000000000000000000000))))

(declare-fun lt!128569 () Unit!7941)

(assert (=> b!256084 (= lt!128569 (addApplyDifferent!226 lt!128571 lt!128565 (zeroValue!4562 thiss!1504) lt!128574))))

(assert (=> b!256084 (= (apply!250 (+!680 lt!128571 (tuple2!4907 lt!128565 (zeroValue!4562 thiss!1504))) lt!128574) (apply!250 lt!128571 lt!128574))))

(declare-fun lt!128567 () Unit!7941)

(assert (=> b!256084 (= lt!128567 lt!128569)))

(declare-fun lt!128555 () ListLongMap!3819)

(assert (=> b!256084 (= lt!128555 (getCurrentListMapNoExtraKeys!572 lt!128407 (array!12484 (store (arr!5914 (_values!4704 thiss!1504)) index!297 (ValueCellFull!2943 v!346)) (size!6261 (_values!4704 thiss!1504))) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(declare-fun lt!128570 () (_ BitVec 64))

(assert (=> b!256084 (= lt!128570 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128557 () (_ BitVec 64))

(assert (=> b!256084 (= lt!128557 (select (arr!5915 lt!128407) #b00000000000000000000000000000000))))

(assert (=> b!256084 (= lt!128554 (addApplyDifferent!226 lt!128555 lt!128570 (minValue!4562 thiss!1504) lt!128557))))

(assert (=> b!256084 (= (apply!250 (+!680 lt!128555 (tuple2!4907 lt!128570 (minValue!4562 thiss!1504))) lt!128557) (apply!250 lt!128555 lt!128557))))

(declare-fun bm!24244 () Bool)

(assert (=> bm!24244 (= call!24246 call!24243)))

(declare-fun b!256085 () Bool)

(declare-fun e!165994 () Bool)

(declare-fun call!24245 () Bool)

(assert (=> b!256085 (= e!165994 (not call!24245))))

(declare-fun b!256086 () Bool)

(assert (=> b!256086 (= e!165995 (+!680 call!24243 (tuple2!4907 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4562 thiss!1504))))))

(declare-fun b!256087 () Bool)

(assert (=> b!256087 (= e!165991 call!24244)))

(declare-fun b!256088 () Bool)

(declare-fun Unit!7948 () Unit!7941)

(assert (=> b!256088 (= e!165996 Unit!7948)))

(declare-fun b!256089 () Bool)

(declare-fun res!125293 () Bool)

(assert (=> b!256089 (=> (not res!125293) (not e!165989))))

(assert (=> b!256089 (= res!125293 e!165994)))

(declare-fun c!43268 () Bool)

(assert (=> b!256089 (= c!43268 (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!256090 () Bool)

(declare-fun res!125294 () Bool)

(assert (=> b!256090 (=> (not res!125294) (not e!165989))))

(assert (=> b!256090 (= res!125294 e!166000)))

(declare-fun res!125299 () Bool)

(assert (=> b!256090 (=> res!125299 e!166000)))

(declare-fun e!165993 () Bool)

(assert (=> b!256090 (= res!125299 (not e!165993))))

(declare-fun res!125301 () Bool)

(assert (=> b!256090 (=> (not res!125301) (not e!165993))))

(assert (=> b!256090 (= res!125301 (bvslt #b00000000000000000000000000000000 (size!6262 lt!128407)))))

(declare-fun b!256091 () Bool)

(assert (=> b!256091 (= e!165994 e!165998)))

(declare-fun res!125300 () Bool)

(assert (=> b!256091 (= res!125300 call!24245)))

(assert (=> b!256091 (=> (not res!125300) (not e!165998))))

(declare-fun bm!24245 () Bool)

(assert (=> bm!24245 (= call!24248 (contains!1861 lt!128568 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256092 () Bool)

(assert (=> b!256092 (= e!165990 (not call!24248))))

(declare-fun b!256093 () Bool)

(assert (=> b!256093 (= e!165993 (validKeyInArray!0 (select (arr!5915 lt!128407) #b00000000000000000000000000000000)))))

(declare-fun b!256094 () Bool)

(assert (=> b!256094 (= e!165997 (= (apply!250 lt!128568 (select (arr!5915 lt!128407) #b00000000000000000000000000000000)) (get!3041 (select (arr!5914 (array!12484 (store (arr!5914 (_values!4704 thiss!1504)) index!297 (ValueCellFull!2943 v!346)) (size!6261 (_values!4704 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4721 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256094 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6261 (array!12484 (store (arr!5914 (_values!4704 thiss!1504)) index!297 (ValueCellFull!2943 v!346)) (size!6261 (_values!4704 thiss!1504))))))))

(assert (=> b!256094 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6262 lt!128407)))))

(declare-fun bm!24246 () Bool)

(assert (=> bm!24246 (= call!24245 (contains!1861 lt!128568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256095 () Bool)

(assert (=> b!256095 (= e!165995 e!165992)))

(assert (=> b!256095 (= c!43272 (and (not (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4458 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61643 c!43273) b!256086))

(assert (= (and d!61643 (not c!43273)) b!256095))

(assert (= (and b!256095 c!43272) b!256077))

(assert (= (and b!256095 (not c!43272)) b!256079))

(assert (= (and b!256079 c!43269) b!256075))

(assert (= (and b!256079 (not c!43269)) b!256087))

(assert (= (or b!256075 b!256087) bm!24243))

(assert (= (or b!256077 bm!24243) bm!24241))

(assert (= (or b!256077 b!256075) bm!24244))

(assert (= (or b!256086 bm!24241) bm!24242))

(assert (= (or b!256086 bm!24244) bm!24240))

(assert (= (and d!61643 res!125296) b!256083))

(assert (= (and d!61643 c!43270) b!256084))

(assert (= (and d!61643 (not c!43270)) b!256088))

(assert (= (and d!61643 res!125295) b!256090))

(assert (= (and b!256090 res!125301) b!256093))

(assert (= (and b!256090 (not res!125299)) b!256078))

(assert (= (and b!256078 res!125298) b!256094))

(assert (= (and b!256090 res!125294) b!256089))

(assert (= (and b!256089 c!43268) b!256091))

(assert (= (and b!256089 (not c!43268)) b!256085))

(assert (= (and b!256091 res!125300) b!256082))

(assert (= (or b!256091 b!256085) bm!24246))

(assert (= (and b!256089 res!125293) b!256080))

(assert (= (and b!256080 c!43271) b!256081))

(assert (= (and b!256080 (not c!43271)) b!256092))

(assert (= (and b!256081 res!125297) b!256076))

(assert (= (or b!256081 b!256092) bm!24245))

(declare-fun b_lambda!8157 () Bool)

(assert (=> (not b_lambda!8157) (not b!256094)))

(assert (=> b!256094 t!8842))

(declare-fun b_and!13771 () Bool)

(assert (= b_and!13769 (and (=> t!8842 result!5361) b_and!13771)))

(declare-fun m!271519 () Bool)

(assert (=> b!256076 m!271519))

(declare-fun m!271521 () Bool)

(assert (=> b!256084 m!271521))

(declare-fun m!271523 () Bool)

(assert (=> b!256084 m!271523))

(declare-fun m!271525 () Bool)

(assert (=> b!256084 m!271525))

(declare-fun m!271527 () Bool)

(assert (=> b!256084 m!271527))

(declare-fun m!271529 () Bool)

(assert (=> b!256084 m!271529))

(assert (=> b!256084 m!271523))

(declare-fun m!271531 () Bool)

(assert (=> b!256084 m!271531))

(declare-fun m!271533 () Bool)

(assert (=> b!256084 m!271533))

(declare-fun m!271535 () Bool)

(assert (=> b!256084 m!271535))

(declare-fun m!271537 () Bool)

(assert (=> b!256084 m!271537))

(declare-fun m!271539 () Bool)

(assert (=> b!256084 m!271539))

(declare-fun m!271541 () Bool)

(assert (=> b!256084 m!271541))

(assert (=> b!256084 m!271533))

(declare-fun m!271543 () Bool)

(assert (=> b!256084 m!271543))

(declare-fun m!271545 () Bool)

(assert (=> b!256084 m!271545))

(assert (=> b!256084 m!271483))

(declare-fun m!271547 () Bool)

(assert (=> b!256084 m!271547))

(declare-fun m!271549 () Bool)

(assert (=> b!256084 m!271549))

(assert (=> b!256084 m!271537))

(assert (=> b!256084 m!271545))

(declare-fun m!271551 () Bool)

(assert (=> b!256084 m!271551))

(declare-fun m!271553 () Bool)

(assert (=> bm!24246 m!271553))

(declare-fun m!271555 () Bool)

(assert (=> b!256082 m!271555))

(declare-fun m!271557 () Bool)

(assert (=> bm!24245 m!271557))

(assert (=> b!256078 m!271483))

(assert (=> b!256078 m!271483))

(declare-fun m!271559 () Bool)

(assert (=> b!256078 m!271559))

(assert (=> b!256094 m!271461))

(assert (=> b!256094 m!271483))

(declare-fun m!271561 () Bool)

(assert (=> b!256094 m!271561))

(assert (=> b!256094 m!271483))

(declare-fun m!271563 () Bool)

(assert (=> b!256094 m!271563))

(assert (=> b!256094 m!271563))

(assert (=> b!256094 m!271461))

(declare-fun m!271565 () Bool)

(assert (=> b!256094 m!271565))

(assert (=> d!61643 m!271469))

(assert (=> bm!24242 m!271543))

(assert (=> b!256093 m!271483))

(assert (=> b!256093 m!271483))

(assert (=> b!256093 m!271485))

(declare-fun m!271567 () Bool)

(assert (=> b!256086 m!271567))

(assert (=> b!256083 m!271483))

(assert (=> b!256083 m!271483))

(assert (=> b!256083 m!271485))

(declare-fun m!271569 () Bool)

(assert (=> bm!24240 m!271569))

(assert (=> b!255873 d!61643))

(declare-fun bm!24249 () Bool)

(declare-fun call!24252 () Bool)

(assert (=> bm!24249 (= call!24252 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!128407 (mask!10987 thiss!1504)))))

(declare-fun b!256104 () Bool)

(declare-fun e!166007 () Bool)

(assert (=> b!256104 (= e!166007 call!24252)))

(declare-fun b!256105 () Bool)

(declare-fun e!166009 () Bool)

(assert (=> b!256105 (= e!166007 e!166009)))

(declare-fun lt!128584 () (_ BitVec 64))

(assert (=> b!256105 (= lt!128584 (select (arr!5915 lt!128407) #b00000000000000000000000000000000))))

(declare-fun lt!128582 () Unit!7941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12485 (_ BitVec 64) (_ BitVec 32)) Unit!7941)

(assert (=> b!256105 (= lt!128582 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128407 lt!128584 #b00000000000000000000000000000000))))

(assert (=> b!256105 (arrayContainsKey!0 lt!128407 lt!128584 #b00000000000000000000000000000000)))

(declare-fun lt!128583 () Unit!7941)

(assert (=> b!256105 (= lt!128583 lt!128582)))

(declare-fun res!125307 () Bool)

(assert (=> b!256105 (= res!125307 (= (seekEntryOrOpen!0 (select (arr!5915 lt!128407) #b00000000000000000000000000000000) lt!128407 (mask!10987 thiss!1504)) (Found!1160 #b00000000000000000000000000000000)))))

(assert (=> b!256105 (=> (not res!125307) (not e!166009))))

(declare-fun b!256106 () Bool)

(assert (=> b!256106 (= e!166009 call!24252)))

(declare-fun d!61645 () Bool)

(declare-fun res!125306 () Bool)

(declare-fun e!166008 () Bool)

(assert (=> d!61645 (=> res!125306 e!166008)))

(assert (=> d!61645 (= res!125306 (bvsge #b00000000000000000000000000000000 (size!6262 lt!128407)))))

(assert (=> d!61645 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128407 (mask!10987 thiss!1504)) e!166008)))

(declare-fun b!256107 () Bool)

(assert (=> b!256107 (= e!166008 e!166007)))

(declare-fun c!43276 () Bool)

(assert (=> b!256107 (= c!43276 (validKeyInArray!0 (select (arr!5915 lt!128407) #b00000000000000000000000000000000)))))

(assert (= (and d!61645 (not res!125306)) b!256107))

(assert (= (and b!256107 c!43276) b!256105))

(assert (= (and b!256107 (not c!43276)) b!256104))

(assert (= (and b!256105 res!125307) b!256106))

(assert (= (or b!256106 b!256104) bm!24249))

(declare-fun m!271571 () Bool)

(assert (=> bm!24249 m!271571))

(assert (=> b!256105 m!271483))

(declare-fun m!271573 () Bool)

(assert (=> b!256105 m!271573))

(declare-fun m!271575 () Bool)

(assert (=> b!256105 m!271575))

(assert (=> b!256105 m!271483))

(declare-fun m!271577 () Bool)

(assert (=> b!256105 m!271577))

(assert (=> b!256107 m!271483))

(assert (=> b!256107 m!271483))

(assert (=> b!256107 m!271485))

(assert (=> b!255873 d!61645))

(assert (=> b!255873 d!61623))

(declare-fun d!61647 () Bool)

(declare-fun e!166012 () Bool)

(assert (=> d!61647 e!166012))

(declare-fun res!125310 () Bool)

(assert (=> d!61647 (=> (not res!125310) (not e!166012))))

(assert (=> d!61647 (= res!125310 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6262 (_keys!6881 thiss!1504)))))))

(declare-fun lt!128587 () Unit!7941)

(declare-fun choose!102 ((_ BitVec 64) array!12485 (_ BitVec 32) (_ BitVec 32)) Unit!7941)

(assert (=> d!61647 (= lt!128587 (choose!102 key!932 (_keys!6881 thiss!1504) index!297 (mask!10987 thiss!1504)))))

(assert (=> d!61647 (validMask!0 (mask!10987 thiss!1504))))

(assert (=> d!61647 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6881 thiss!1504) index!297 (mask!10987 thiss!1504)) lt!128587)))

(declare-fun b!256110 () Bool)

(assert (=> b!256110 (= e!166012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12486 (store (arr!5915 (_keys!6881 thiss!1504)) index!297 key!932) (size!6262 (_keys!6881 thiss!1504))) (mask!10987 thiss!1504)))))

(assert (= (and d!61647 res!125310) b!256110))

(declare-fun m!271579 () Bool)

(assert (=> d!61647 m!271579))

(assert (=> d!61647 m!271469))

(assert (=> b!256110 m!271309))

(declare-fun m!271581 () Bool)

(assert (=> b!256110 m!271581))

(assert (=> b!255873 d!61647))

(declare-fun d!61649 () Bool)

(declare-fun e!166015 () Bool)

(assert (=> d!61649 e!166015))

(declare-fun res!125313 () Bool)

(assert (=> d!61649 (=> (not res!125313) (not e!166015))))

(assert (=> d!61649 (= res!125313 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6262 (_keys!6881 thiss!1504)))))))

(declare-fun lt!128590 () Unit!7941)

(declare-fun choose!41 (array!12485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3787) Unit!7941)

(assert (=> d!61649 (= lt!128590 (choose!41 (_keys!6881 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3784))))

(assert (=> d!61649 (bvslt (size!6262 (_keys!6881 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61649 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6881 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3784) lt!128590)))

(declare-fun b!256113 () Bool)

(assert (=> b!256113 (= e!166015 (arrayNoDuplicates!0 (array!12486 (store (arr!5915 (_keys!6881 thiss!1504)) index!297 key!932) (size!6262 (_keys!6881 thiss!1504))) #b00000000000000000000000000000000 Nil!3784))))

(assert (= (and d!61649 res!125313) b!256113))

(declare-fun m!271583 () Bool)

(assert (=> d!61649 m!271583))

(assert (=> b!256113 m!271309))

(declare-fun m!271585 () Bool)

(assert (=> b!256113 m!271585))

(assert (=> b!255873 d!61649))

(declare-fun b!256124 () Bool)

(declare-fun e!166027 () Bool)

(declare-fun call!24255 () Bool)

(assert (=> b!256124 (= e!166027 call!24255)))

(declare-fun b!256125 () Bool)

(declare-fun e!166026 () Bool)

(assert (=> b!256125 (= e!166026 e!166027)))

(declare-fun c!43279 () Bool)

(assert (=> b!256125 (= c!43279 (validKeyInArray!0 (select (arr!5915 lt!128407) #b00000000000000000000000000000000)))))

(declare-fun bm!24252 () Bool)

(assert (=> bm!24252 (= call!24255 (arrayNoDuplicates!0 lt!128407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43279 (Cons!3783 (select (arr!5915 lt!128407) #b00000000000000000000000000000000) Nil!3784) Nil!3784)))))

(declare-fun b!256126 () Bool)

(assert (=> b!256126 (= e!166027 call!24255)))

(declare-fun d!61651 () Bool)

(declare-fun res!125320 () Bool)

(declare-fun e!166025 () Bool)

(assert (=> d!61651 (=> res!125320 e!166025)))

(assert (=> d!61651 (= res!125320 (bvsge #b00000000000000000000000000000000 (size!6262 lt!128407)))))

(assert (=> d!61651 (= (arrayNoDuplicates!0 lt!128407 #b00000000000000000000000000000000 Nil!3784) e!166025)))

(declare-fun b!256127 () Bool)

(declare-fun e!166024 () Bool)

(declare-fun contains!1863 (List!3787 (_ BitVec 64)) Bool)

(assert (=> b!256127 (= e!166024 (contains!1863 Nil!3784 (select (arr!5915 lt!128407) #b00000000000000000000000000000000)))))

(declare-fun b!256128 () Bool)

(assert (=> b!256128 (= e!166025 e!166026)))

(declare-fun res!125322 () Bool)

(assert (=> b!256128 (=> (not res!125322) (not e!166026))))

(assert (=> b!256128 (= res!125322 (not e!166024))))

(declare-fun res!125321 () Bool)

(assert (=> b!256128 (=> (not res!125321) (not e!166024))))

(assert (=> b!256128 (= res!125321 (validKeyInArray!0 (select (arr!5915 lt!128407) #b00000000000000000000000000000000)))))

(assert (= (and d!61651 (not res!125320)) b!256128))

(assert (= (and b!256128 res!125321) b!256127))

(assert (= (and b!256128 res!125322) b!256125))

(assert (= (and b!256125 c!43279) b!256124))

(assert (= (and b!256125 (not c!43279)) b!256126))

(assert (= (or b!256124 b!256126) bm!24252))

(assert (=> b!256125 m!271483))

(assert (=> b!256125 m!271483))

(assert (=> b!256125 m!271485))

(assert (=> bm!24252 m!271483))

(declare-fun m!271587 () Bool)

(assert (=> bm!24252 m!271587))

(assert (=> b!256127 m!271483))

(assert (=> b!256127 m!271483))

(declare-fun m!271589 () Bool)

(assert (=> b!256127 m!271589))

(assert (=> b!256128 m!271483))

(assert (=> b!256128 m!271483))

(assert (=> b!256128 m!271485))

(assert (=> b!255873 d!61651))

(declare-fun b!256145 () Bool)

(declare-fun e!166039 () Bool)

(declare-fun lt!128595 () SeekEntryResult!1160)

(assert (=> b!256145 (= e!166039 ((_ is Undefined!1160) lt!128595))))

(declare-fun b!256146 () Bool)

(declare-fun e!166036 () Bool)

(assert (=> b!256146 (= e!166036 e!166039)))

(declare-fun c!43285 () Bool)

(assert (=> b!256146 (= c!43285 ((_ is MissingVacant!1160) lt!128595))))

(declare-fun b!256147 () Bool)

(declare-fun e!166038 () Bool)

(declare-fun call!24260 () Bool)

(assert (=> b!256147 (= e!166038 (not call!24260))))

(declare-fun d!61653 () Bool)

(assert (=> d!61653 e!166036))

(declare-fun c!43284 () Bool)

(assert (=> d!61653 (= c!43284 ((_ is MissingZero!1160) lt!128595))))

(assert (=> d!61653 (= lt!128595 (seekEntryOrOpen!0 key!932 (_keys!6881 thiss!1504) (mask!10987 thiss!1504)))))

(declare-fun lt!128596 () Unit!7941)

(declare-fun choose!1226 (array!12485 array!12483 (_ BitVec 32) (_ BitVec 32) V!8411 V!8411 (_ BitVec 64) Int) Unit!7941)

(assert (=> d!61653 (= lt!128596 (choose!1226 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) key!932 (defaultEntry!4721 thiss!1504)))))

(assert (=> d!61653 (validMask!0 (mask!10987 thiss!1504))))

(assert (=> d!61653 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!429 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) key!932 (defaultEntry!4721 thiss!1504)) lt!128596)))

(declare-fun b!256148 () Bool)

(assert (=> b!256148 (and (bvsge (index!6810 lt!128595) #b00000000000000000000000000000000) (bvslt (index!6810 lt!128595) (size!6262 (_keys!6881 thiss!1504))))))

(declare-fun res!125334 () Bool)

(assert (=> b!256148 (= res!125334 (= (select (arr!5915 (_keys!6881 thiss!1504)) (index!6810 lt!128595)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166037 () Bool)

(assert (=> b!256148 (=> (not res!125334) (not e!166037))))

(declare-fun b!256149 () Bool)

(declare-fun res!125332 () Bool)

(assert (=> b!256149 (=> (not res!125332) (not e!166038))))

(declare-fun call!24261 () Bool)

(assert (=> b!256149 (= res!125332 call!24261)))

(assert (=> b!256149 (= e!166039 e!166038)))

(declare-fun b!256150 () Bool)

(declare-fun res!125331 () Bool)

(assert (=> b!256150 (=> (not res!125331) (not e!166038))))

(assert (=> b!256150 (= res!125331 (= (select (arr!5915 (_keys!6881 thiss!1504)) (index!6813 lt!128595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256150 (and (bvsge (index!6813 lt!128595) #b00000000000000000000000000000000) (bvslt (index!6813 lt!128595) (size!6262 (_keys!6881 thiss!1504))))))

(declare-fun bm!24257 () Bool)

(assert (=> bm!24257 (= call!24261 (inRange!0 (ite c!43284 (index!6810 lt!128595) (index!6813 lt!128595)) (mask!10987 thiss!1504)))))

(declare-fun b!256151 () Bool)

(assert (=> b!256151 (= e!166036 e!166037)))

(declare-fun res!125333 () Bool)

(assert (=> b!256151 (= res!125333 call!24261)))

(assert (=> b!256151 (=> (not res!125333) (not e!166037))))

(declare-fun b!256152 () Bool)

(assert (=> b!256152 (= e!166037 (not call!24260))))

(declare-fun bm!24258 () Bool)

(assert (=> bm!24258 (= call!24260 (arrayContainsKey!0 (_keys!6881 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!61653 c!43284) b!256151))

(assert (= (and d!61653 (not c!43284)) b!256146))

(assert (= (and b!256151 res!125333) b!256148))

(assert (= (and b!256148 res!125334) b!256152))

(assert (= (and b!256146 c!43285) b!256149))

(assert (= (and b!256146 (not c!43285)) b!256145))

(assert (= (and b!256149 res!125332) b!256150))

(assert (= (and b!256150 res!125331) b!256147))

(assert (= (or b!256151 b!256149) bm!24257))

(assert (= (or b!256152 b!256147) bm!24258))

(assert (=> d!61653 m!271343))

(declare-fun m!271591 () Bool)

(assert (=> d!61653 m!271591))

(assert (=> d!61653 m!271469))

(declare-fun m!271593 () Bool)

(assert (=> b!256150 m!271593))

(assert (=> bm!24258 m!271317))

(declare-fun m!271595 () Bool)

(assert (=> bm!24257 m!271595))

(declare-fun m!271597 () Bool)

(assert (=> b!256148 m!271597))

(assert (=> b!255887 d!61653))

(declare-fun d!61655 () Bool)

(assert (=> d!61655 (= (inRange!0 (ite c!43226 (index!6810 lt!128409) (index!6813 lt!128409)) (mask!10987 thiss!1504)) (and (bvsge (ite c!43226 (index!6810 lt!128409) (index!6813 lt!128409)) #b00000000000000000000000000000000) (bvslt (ite c!43226 (index!6810 lt!128409) (index!6813 lt!128409)) (bvadd (mask!10987 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24207 d!61655))

(declare-fun b!256165 () Bool)

(declare-fun e!166048 () SeekEntryResult!1160)

(declare-fun lt!128605 () SeekEntryResult!1160)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12485 (_ BitVec 32)) SeekEntryResult!1160)

(assert (=> b!256165 (= e!166048 (seekKeyOrZeroReturnVacant!0 (x!24938 lt!128605) (index!6812 lt!128605) (index!6812 lt!128605) key!932 (_keys!6881 thiss!1504) (mask!10987 thiss!1504)))))

(declare-fun b!256166 () Bool)

(assert (=> b!256166 (= e!166048 (MissingZero!1160 (index!6812 lt!128605)))))

(declare-fun b!256167 () Bool)

(declare-fun c!43294 () Bool)

(declare-fun lt!128604 () (_ BitVec 64))

(assert (=> b!256167 (= c!43294 (= lt!128604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166047 () SeekEntryResult!1160)

(assert (=> b!256167 (= e!166047 e!166048)))

(declare-fun d!61657 () Bool)

(declare-fun lt!128603 () SeekEntryResult!1160)

(assert (=> d!61657 (and (or ((_ is Undefined!1160) lt!128603) (not ((_ is Found!1160) lt!128603)) (and (bvsge (index!6811 lt!128603) #b00000000000000000000000000000000) (bvslt (index!6811 lt!128603) (size!6262 (_keys!6881 thiss!1504))))) (or ((_ is Undefined!1160) lt!128603) ((_ is Found!1160) lt!128603) (not ((_ is MissingZero!1160) lt!128603)) (and (bvsge (index!6810 lt!128603) #b00000000000000000000000000000000) (bvslt (index!6810 lt!128603) (size!6262 (_keys!6881 thiss!1504))))) (or ((_ is Undefined!1160) lt!128603) ((_ is Found!1160) lt!128603) ((_ is MissingZero!1160) lt!128603) (not ((_ is MissingVacant!1160) lt!128603)) (and (bvsge (index!6813 lt!128603) #b00000000000000000000000000000000) (bvslt (index!6813 lt!128603) (size!6262 (_keys!6881 thiss!1504))))) (or ((_ is Undefined!1160) lt!128603) (ite ((_ is Found!1160) lt!128603) (= (select (arr!5915 (_keys!6881 thiss!1504)) (index!6811 lt!128603)) key!932) (ite ((_ is MissingZero!1160) lt!128603) (= (select (arr!5915 (_keys!6881 thiss!1504)) (index!6810 lt!128603)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1160) lt!128603) (= (select (arr!5915 (_keys!6881 thiss!1504)) (index!6813 lt!128603)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!166046 () SeekEntryResult!1160)

(assert (=> d!61657 (= lt!128603 e!166046)))

(declare-fun c!43292 () Bool)

(assert (=> d!61657 (= c!43292 (and ((_ is Intermediate!1160) lt!128605) (undefined!1972 lt!128605)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12485 (_ BitVec 32)) SeekEntryResult!1160)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61657 (= lt!128605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10987 thiss!1504)) key!932 (_keys!6881 thiss!1504) (mask!10987 thiss!1504)))))

(assert (=> d!61657 (validMask!0 (mask!10987 thiss!1504))))

(assert (=> d!61657 (= (seekEntryOrOpen!0 key!932 (_keys!6881 thiss!1504) (mask!10987 thiss!1504)) lt!128603)))

(declare-fun b!256168 () Bool)

(assert (=> b!256168 (= e!166046 Undefined!1160)))

(declare-fun b!256169 () Bool)

(assert (=> b!256169 (= e!166046 e!166047)))

(assert (=> b!256169 (= lt!128604 (select (arr!5915 (_keys!6881 thiss!1504)) (index!6812 lt!128605)))))

(declare-fun c!43293 () Bool)

(assert (=> b!256169 (= c!43293 (= lt!128604 key!932))))

(declare-fun b!256170 () Bool)

(assert (=> b!256170 (= e!166047 (Found!1160 (index!6812 lt!128605)))))

(assert (= (and d!61657 c!43292) b!256168))

(assert (= (and d!61657 (not c!43292)) b!256169))

(assert (= (and b!256169 c!43293) b!256170))

(assert (= (and b!256169 (not c!43293)) b!256167))

(assert (= (and b!256167 c!43294) b!256166))

(assert (= (and b!256167 (not c!43294)) b!256165))

(declare-fun m!271599 () Bool)

(assert (=> b!256165 m!271599))

(assert (=> d!61657 m!271469))

(declare-fun m!271601 () Bool)

(assert (=> d!61657 m!271601))

(declare-fun m!271603 () Bool)

(assert (=> d!61657 m!271603))

(assert (=> d!61657 m!271601))

(declare-fun m!271605 () Bool)

(assert (=> d!61657 m!271605))

(declare-fun m!271607 () Bool)

(assert (=> d!61657 m!271607))

(declare-fun m!271609 () Bool)

(assert (=> d!61657 m!271609))

(declare-fun m!271611 () Bool)

(assert (=> b!256169 m!271611))

(assert (=> b!255876 d!61657))

(declare-fun d!61659 () Bool)

(assert (=> d!61659 (contains!1861 (getCurrentListMap!1453 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)) key!932)))

(declare-fun lt!128608 () Unit!7941)

(declare-fun choose!1227 (array!12485 array!12483 (_ BitVec 32) (_ BitVec 32) V!8411 V!8411 (_ BitVec 64) (_ BitVec 32) Int) Unit!7941)

(assert (=> d!61659 (= lt!128608 (choose!1227 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)))))

(assert (=> d!61659 (validMask!0 (mask!10987 thiss!1504))))

(assert (=> d!61659 (= (lemmaArrayContainsKeyThenInListMap!232 (_keys!6881 thiss!1504) (_values!4704 thiss!1504) (mask!10987 thiss!1504) (extraKeys!4458 thiss!1504) (zeroValue!4562 thiss!1504) (minValue!4562 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4721 thiss!1504)) lt!128608)))

(declare-fun bs!9067 () Bool)

(assert (= bs!9067 d!61659))

(assert (=> bs!9067 m!271341))

(assert (=> bs!9067 m!271341))

(declare-fun m!271613 () Bool)

(assert (=> bs!9067 m!271613))

(declare-fun m!271615 () Bool)

(assert (=> bs!9067 m!271615))

(assert (=> bs!9067 m!271469))

(assert (=> b!255882 d!61659))

(declare-fun d!61661 () Bool)

(declare-fun res!125341 () Bool)

(declare-fun e!166051 () Bool)

(assert (=> d!61661 (=> (not res!125341) (not e!166051))))

(declare-fun simpleValid!273 (LongMapFixedSize!3786) Bool)

(assert (=> d!61661 (= res!125341 (simpleValid!273 thiss!1504))))

(assert (=> d!61661 (= (valid!1480 thiss!1504) e!166051)))

(declare-fun b!256177 () Bool)

(declare-fun res!125342 () Bool)

(assert (=> b!256177 (=> (not res!125342) (not e!166051))))

(assert (=> b!256177 (= res!125342 (= (arrayCountValidKeys!0 (_keys!6881 thiss!1504) #b00000000000000000000000000000000 (size!6262 (_keys!6881 thiss!1504))) (_size!1942 thiss!1504)))))

(declare-fun b!256178 () Bool)

(declare-fun res!125343 () Bool)

(assert (=> b!256178 (=> (not res!125343) (not e!166051))))

(assert (=> b!256178 (= res!125343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6881 thiss!1504) (mask!10987 thiss!1504)))))

(declare-fun b!256179 () Bool)

(assert (=> b!256179 (= e!166051 (arrayNoDuplicates!0 (_keys!6881 thiss!1504) #b00000000000000000000000000000000 Nil!3784))))

(assert (= (and d!61661 res!125341) b!256177))

(assert (= (and b!256177 res!125342) b!256178))

(assert (= (and b!256178 res!125343) b!256179))

(declare-fun m!271617 () Bool)

(assert (=> d!61661 m!271617))

(assert (=> b!256177 m!271311))

(declare-fun m!271619 () Bool)

(assert (=> b!256178 m!271619))

(declare-fun m!271621 () Bool)

(assert (=> b!256179 m!271621))

(assert (=> start!24424 d!61661))

(declare-fun d!61663 () Bool)

(assert (=> d!61663 (= (array_inv!3911 (_keys!6881 thiss!1504)) (bvsge (size!6262 (_keys!6881 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255885 d!61663))

(declare-fun d!61665 () Bool)

(assert (=> d!61665 (= (array_inv!3912 (_values!4704 thiss!1504)) (bvsge (size!6261 (_values!4704 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255885 d!61665))

(declare-fun condMapEmpty!11190 () Bool)

(declare-fun mapDefault!11190 () ValueCell!2943)

(assert (=> mapNonEmpty!11184 (= condMapEmpty!11190 (= mapRest!11184 ((as const (Array (_ BitVec 32) ValueCell!2943)) mapDefault!11190)))))

(declare-fun e!166056 () Bool)

(declare-fun mapRes!11190 () Bool)

(assert (=> mapNonEmpty!11184 (= tp!23429 (and e!166056 mapRes!11190))))

(declare-fun mapIsEmpty!11190 () Bool)

(assert (=> mapIsEmpty!11190 mapRes!11190))

(declare-fun mapNonEmpty!11190 () Bool)

(declare-fun tp!23439 () Bool)

(declare-fun e!166057 () Bool)

(assert (=> mapNonEmpty!11190 (= mapRes!11190 (and tp!23439 e!166057))))

(declare-fun mapValue!11190 () ValueCell!2943)

(declare-fun mapRest!11190 () (Array (_ BitVec 32) ValueCell!2943))

(declare-fun mapKey!11190 () (_ BitVec 32))

(assert (=> mapNonEmpty!11190 (= mapRest!11184 (store mapRest!11190 mapKey!11190 mapValue!11190))))

(declare-fun b!256187 () Bool)

(assert (=> b!256187 (= e!166056 tp_is_empty!6573)))

(declare-fun b!256186 () Bool)

(assert (=> b!256186 (= e!166057 tp_is_empty!6573)))

(assert (= (and mapNonEmpty!11184 condMapEmpty!11190) mapIsEmpty!11190))

(assert (= (and mapNonEmpty!11184 (not condMapEmpty!11190)) mapNonEmpty!11190))

(assert (= (and mapNonEmpty!11190 ((_ is ValueCellFull!2943) mapValue!11190)) b!256186))

(assert (= (and mapNonEmpty!11184 ((_ is ValueCellFull!2943) mapDefault!11190)) b!256187))

(declare-fun m!271623 () Bool)

(assert (=> mapNonEmpty!11190 m!271623))

(declare-fun b_lambda!8159 () Bool)

(assert (= b_lambda!8155 (or (and b!255885 b_free!6711) b_lambda!8159)))

(declare-fun b_lambda!8161 () Bool)

(assert (= b_lambda!8157 (or (and b!255885 b_free!6711) b_lambda!8161)))

(check-sat (not bm!24239) (not b!256078) (not bm!24242) (not d!61659) (not b!256073) (not b!256093) (not b!256059) (not b!256082) (not bm!24235) (not bm!24231) (not b!256110) (not mapNonEmpty!11190) (not d!61643) (not b!255964) (not b!256016) (not bm!24238) (not d!61657) (not bm!24257) (not d!61635) (not b!256179) (not b!256177) (not b_next!6711) (not d!61639) (not b!256018) (not bm!24249) (not b!256125) (not d!61629) (not b!256083) tp_is_empty!6573 (not bm!24240) (not bm!24229) (not d!61649) (not b!256046) (not b!256074) (not b!256012) (not b!256107) (not b!256028) (not b!256094) (not b!256127) (not bm!24234) (not b!256178) (not bm!24252) (not d!61661) (not d!61647) (not b!256036) (not bm!24246) (not b_lambda!8161) (not bm!24258) (not b!256076) (not b!256062) (not b!256010) (not b!256020) (not b!255957) (not d!61653) (not b!256068) (not b!255966) (not b!256061) (not d!61631) (not b!256027) (not b!256113) (not b!256128) (not d!61627) (not b!256165) (not d!61641) (not b_lambda!8159) (not b!256086) (not b!256084) (not b!256017) (not b!256105) (not bm!24245) b_and!13771 (not b!256058))
(check-sat b_and!13771 (not b_next!6711))
