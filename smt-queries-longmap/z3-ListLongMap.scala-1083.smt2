; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22184 () Bool)

(assert start!22184)

(declare-fun b!231952 () Bool)

(declare-fun b_free!6247 () Bool)

(declare-fun b_next!6247 () Bool)

(assert (=> b!231952 (= b_free!6247 (not b_next!6247))))

(declare-fun tp!21882 () Bool)

(declare-fun b_and!13119 () Bool)

(assert (=> b!231952 (= tp!21882 b_and!13119)))

(declare-datatypes ((SeekEntryResult!962 0))(
  ( (MissingZero!962 (index!6018 (_ BitVec 32))) (Found!962 (index!6019 (_ BitVec 32))) (Intermediate!962 (undefined!1774 Bool) (index!6020 (_ BitVec 32)) (x!23541 (_ BitVec 32))) (Undefined!962) (MissingVacant!962 (index!6021 (_ BitVec 32))) )
))
(declare-fun lt!116943 () SeekEntryResult!962)

(declare-fun bm!21548 () Bool)

(declare-datatypes ((V!7793 0))(
  ( (V!7794 (val!3099 Int)) )
))
(declare-datatypes ((ValueCell!2711 0))(
  ( (ValueCellFull!2711 (v!5113 V!7793)) (EmptyCell!2711) )
))
(declare-datatypes ((array!11453 0))(
  ( (array!11454 (arr!5445 (Array (_ BitVec 32) ValueCell!2711)) (size!5779 (_ BitVec 32))) )
))
(declare-datatypes ((array!11455 0))(
  ( (array!11456 (arr!5446 (Array (_ BitVec 32) (_ BitVec 64))) (size!5780 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3322 0))(
  ( (LongMapFixedSize!3323 (defaultEntry!4320 Int) (mask!10229 (_ BitVec 32)) (extraKeys!4057 (_ BitVec 32)) (zeroValue!4161 V!7793) (minValue!4161 V!7793) (_size!1710 (_ BitVec 32)) (_keys!6373 array!11455) (_values!4303 array!11453) (_vacant!1710 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3322)

(declare-fun c!38553 () Bool)

(declare-fun call!21551 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21548 (= call!21551 (inRange!0 (ite c!38553 (index!6018 lt!116943) (index!6021 lt!116943)) (mask!10229 thiss!1504)))))

(declare-fun b!231933 () Bool)

(declare-fun res!113905 () Bool)

(assert (=> b!231933 (= res!113905 (= (select (arr!5446 (_keys!6373 thiss!1504)) (index!6021 lt!116943)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!150596 () Bool)

(assert (=> b!231933 (=> (not res!113905) (not e!150596))))

(declare-fun b!231934 () Bool)

(declare-fun res!113904 () Bool)

(declare-fun e!150601 () Bool)

(assert (=> b!231934 (=> (not res!113904) (not e!150601))))

(assert (=> b!231934 (= res!113904 call!21551)))

(declare-fun e!150590 () Bool)

(assert (=> b!231934 (= e!150590 e!150601)))

(declare-fun mapIsEmpty!10333 () Bool)

(declare-fun mapRes!10333 () Bool)

(assert (=> mapIsEmpty!10333 mapRes!10333))

(declare-fun b!231935 () Bool)

(declare-fun e!150591 () Bool)

(declare-fun e!150603 () Bool)

(assert (=> b!231935 (= e!150591 e!150603)))

(declare-fun res!113902 () Bool)

(assert (=> b!231935 (=> (not res!113902) (not e!150603))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231935 (= res!113902 (inRange!0 index!297 (mask!10229 thiss!1504)))))

(declare-datatypes ((Unit!7136 0))(
  ( (Unit!7137) )
))
(declare-fun lt!116942 () Unit!7136)

(declare-fun e!150592 () Unit!7136)

(assert (=> b!231935 (= lt!116942 e!150592)))

(declare-fun c!38551 () Bool)

(declare-datatypes ((tuple2!4548 0))(
  ( (tuple2!4549 (_1!2285 (_ BitVec 64)) (_2!2285 V!7793)) )
))
(declare-datatypes ((List!3485 0))(
  ( (Nil!3482) (Cons!3481 (h!4129 tuple2!4548) (t!8435 List!3485)) )
))
(declare-datatypes ((ListLongMap!3451 0))(
  ( (ListLongMap!3452 (toList!1741 List!3485)) )
))
(declare-fun lt!116936 () ListLongMap!3451)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1613 (ListLongMap!3451 (_ BitVec 64)) Bool)

(assert (=> b!231935 (= c!38551 (contains!1613 lt!116936 key!932))))

(declare-fun getCurrentListMap!1250 (array!11455 array!11453 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 32) Int) ListLongMap!3451)

(assert (=> b!231935 (= lt!116936 (getCurrentListMap!1250 (_keys!6373 thiss!1504) (_values!4303 thiss!1504) (mask!10229 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4320 thiss!1504)))))

(declare-fun b!231936 () Bool)

(declare-fun e!150598 () Bool)

(declare-fun tp_is_empty!6109 () Bool)

(assert (=> b!231936 (= e!150598 tp_is_empty!6109)))

(declare-fun b!231937 () Bool)

(declare-fun lt!116937 () Unit!7136)

(assert (=> b!231937 (= e!150592 lt!116937)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!307 (array!11455 array!11453 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 64) Int) Unit!7136)

(assert (=> b!231937 (= lt!116937 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!307 (_keys!6373 thiss!1504) (_values!4303 thiss!1504) (mask!10229 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) key!932 (defaultEntry!4320 thiss!1504)))))

(get-info :version)

(assert (=> b!231937 (= c!38553 ((_ is MissingZero!962) lt!116943))))

(assert (=> b!231937 e!150590))

(declare-fun b!231938 () Bool)

(declare-fun res!113906 () Bool)

(assert (=> b!231938 (=> (not res!113906) (not e!150601))))

(assert (=> b!231938 (= res!113906 (= (select (arr!5446 (_keys!6373 thiss!1504)) (index!6018 lt!116943)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231939 () Bool)

(declare-fun e!150594 () Unit!7136)

(declare-fun Unit!7138 () Unit!7136)

(assert (=> b!231939 (= e!150594 Unit!7138)))

(declare-fun b!231940 () Bool)

(declare-fun e!150602 () Bool)

(assert (=> b!231940 (= e!150602 tp_is_empty!6109)))

(declare-fun b!231941 () Bool)

(declare-fun e!150595 () Bool)

(assert (=> b!231941 (= e!150595 ((_ is Undefined!962) lt!116943))))

(declare-fun b!231942 () Bool)

(declare-fun call!21552 () Bool)

(assert (=> b!231942 (= e!150596 (not call!21552))))

(declare-fun bm!21549 () Bool)

(declare-fun arrayContainsKey!0 (array!11455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21549 (= call!21552 (arrayContainsKey!0 (_keys!6373 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231943 () Bool)

(declare-fun e!150599 () Bool)

(assert (=> b!231943 (= e!150599 e!150591)))

(declare-fun res!113899 () Bool)

(assert (=> b!231943 (=> (not res!113899) (not e!150591))))

(assert (=> b!231943 (= res!113899 (or (= lt!116943 (MissingZero!962 index!297)) (= lt!116943 (MissingVacant!962 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11455 (_ BitVec 32)) SeekEntryResult!962)

(assert (=> b!231943 (= lt!116943 (seekEntryOrOpen!0 key!932 (_keys!6373 thiss!1504) (mask!10229 thiss!1504)))))

(declare-fun b!231944 () Bool)

(declare-fun Unit!7139 () Unit!7136)

(assert (=> b!231944 (= e!150592 Unit!7139)))

(declare-fun lt!116934 () Unit!7136)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!312 (array!11455 array!11453 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 64) Int) Unit!7136)

(assert (=> b!231944 (= lt!116934 (lemmaInListMapThenSeekEntryOrOpenFindsIt!312 (_keys!6373 thiss!1504) (_values!4303 thiss!1504) (mask!10229 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) key!932 (defaultEntry!4320 thiss!1504)))))

(assert (=> b!231944 false))

(declare-fun b!231945 () Bool)

(assert (=> b!231945 (= e!150595 e!150596)))

(declare-fun res!113903 () Bool)

(assert (=> b!231945 (= res!113903 call!21551)))

(assert (=> b!231945 (=> (not res!113903) (not e!150596))))

(declare-fun b!231946 () Bool)

(declare-fun c!38552 () Bool)

(assert (=> b!231946 (= c!38552 ((_ is MissingVacant!962) lt!116943))))

(assert (=> b!231946 (= e!150590 e!150595)))

(declare-fun b!231947 () Bool)

(assert (=> b!231947 (= e!150603 (not true))))

(declare-fun lt!116944 () array!11455)

(declare-fun arrayCountValidKeys!0 (array!11455 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231947 (= (arrayCountValidKeys!0 lt!116944 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116940 () Unit!7136)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11455 (_ BitVec 32)) Unit!7136)

(assert (=> b!231947 (= lt!116940 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116944 index!297))))

(assert (=> b!231947 (arrayContainsKey!0 lt!116944 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116938 () Unit!7136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11455 (_ BitVec 64) (_ BitVec 32)) Unit!7136)

(assert (=> b!231947 (= lt!116938 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116944 key!932 index!297))))

(declare-fun v!346 () V!7793)

(declare-fun +!626 (ListLongMap!3451 tuple2!4548) ListLongMap!3451)

(assert (=> b!231947 (= (+!626 lt!116936 (tuple2!4549 key!932 v!346)) (getCurrentListMap!1250 lt!116944 (array!11454 (store (arr!5445 (_values!4303 thiss!1504)) index!297 (ValueCellFull!2711 v!346)) (size!5779 (_values!4303 thiss!1504))) (mask!10229 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4320 thiss!1504)))))

(declare-fun lt!116941 () Unit!7136)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!81 (array!11455 array!11453 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 32) (_ BitVec 64) V!7793 Int) Unit!7136)

(assert (=> b!231947 (= lt!116941 (lemmaAddValidKeyToArrayThenAddPairToListMap!81 (_keys!6373 thiss!1504) (_values!4303 thiss!1504) (mask!10229 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) index!297 key!932 v!346 (defaultEntry!4320 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11455 (_ BitVec 32)) Bool)

(assert (=> b!231947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116944 (mask!10229 thiss!1504))))

(declare-fun lt!116947 () Unit!7136)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11455 (_ BitVec 32) (_ BitVec 32)) Unit!7136)

(assert (=> b!231947 (= lt!116947 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6373 thiss!1504) index!297 (mask!10229 thiss!1504)))))

(assert (=> b!231947 (= (arrayCountValidKeys!0 lt!116944 #b00000000000000000000000000000000 (size!5780 (_keys!6373 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6373 thiss!1504) #b00000000000000000000000000000000 (size!5780 (_keys!6373 thiss!1504)))))))

(declare-fun lt!116939 () Unit!7136)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11455 (_ BitVec 32) (_ BitVec 64)) Unit!7136)

(assert (=> b!231947 (= lt!116939 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6373 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3486 0))(
  ( (Nil!3483) (Cons!3482 (h!4130 (_ BitVec 64)) (t!8436 List!3486)) )
))
(declare-fun arrayNoDuplicates!0 (array!11455 (_ BitVec 32) List!3486) Bool)

(assert (=> b!231947 (arrayNoDuplicates!0 lt!116944 #b00000000000000000000000000000000 Nil!3483)))

(assert (=> b!231947 (= lt!116944 (array!11456 (store (arr!5446 (_keys!6373 thiss!1504)) index!297 key!932) (size!5780 (_keys!6373 thiss!1504))))))

(declare-fun lt!116935 () Unit!7136)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11455 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3486) Unit!7136)

(assert (=> b!231947 (= lt!116935 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6373 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3483))))

(declare-fun lt!116946 () Unit!7136)

(assert (=> b!231947 (= lt!116946 e!150594)))

(declare-fun c!38554 () Bool)

(assert (=> b!231947 (= c!38554 (arrayContainsKey!0 (_keys!6373 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231948 () Bool)

(declare-fun e!150600 () Bool)

(assert (=> b!231948 (= e!150600 (and e!150598 mapRes!10333))))

(declare-fun condMapEmpty!10333 () Bool)

(declare-fun mapDefault!10333 () ValueCell!2711)

(assert (=> b!231948 (= condMapEmpty!10333 (= (arr!5445 (_values!4303 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2711)) mapDefault!10333)))))

(declare-fun res!113900 () Bool)

(assert (=> start!22184 (=> (not res!113900) (not e!150599))))

(declare-fun valid!1331 (LongMapFixedSize!3322) Bool)

(assert (=> start!22184 (= res!113900 (valid!1331 thiss!1504))))

(assert (=> start!22184 e!150599))

(declare-fun e!150597 () Bool)

(assert (=> start!22184 e!150597))

(assert (=> start!22184 true))

(assert (=> start!22184 tp_is_empty!6109))

(declare-fun mapNonEmpty!10333 () Bool)

(declare-fun tp!21883 () Bool)

(assert (=> mapNonEmpty!10333 (= mapRes!10333 (and tp!21883 e!150602))))

(declare-fun mapKey!10333 () (_ BitVec 32))

(declare-fun mapRest!10333 () (Array (_ BitVec 32) ValueCell!2711))

(declare-fun mapValue!10333 () ValueCell!2711)

(assert (=> mapNonEmpty!10333 (= (arr!5445 (_values!4303 thiss!1504)) (store mapRest!10333 mapKey!10333 mapValue!10333))))

(declare-fun b!231949 () Bool)

(declare-fun res!113901 () Bool)

(assert (=> b!231949 (=> (not res!113901) (not e!150599))))

(assert (=> b!231949 (= res!113901 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231950 () Bool)

(assert (=> b!231950 (= e!150601 (not call!21552))))

(declare-fun b!231951 () Bool)

(declare-fun Unit!7140 () Unit!7136)

(assert (=> b!231951 (= e!150594 Unit!7140)))

(declare-fun lt!116945 () Unit!7136)

(declare-fun lemmaArrayContainsKeyThenInListMap!150 (array!11455 array!11453 (_ BitVec 32) (_ BitVec 32) V!7793 V!7793 (_ BitVec 64) (_ BitVec 32) Int) Unit!7136)

(assert (=> b!231951 (= lt!116945 (lemmaArrayContainsKeyThenInListMap!150 (_keys!6373 thiss!1504) (_values!4303 thiss!1504) (mask!10229 thiss!1504) (extraKeys!4057 thiss!1504) (zeroValue!4161 thiss!1504) (minValue!4161 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4320 thiss!1504)))))

(assert (=> b!231951 false))

(declare-fun array_inv!3593 (array!11455) Bool)

(declare-fun array_inv!3594 (array!11453) Bool)

(assert (=> b!231952 (= e!150597 (and tp!21882 tp_is_empty!6109 (array_inv!3593 (_keys!6373 thiss!1504)) (array_inv!3594 (_values!4303 thiss!1504)) e!150600))))

(assert (= (and start!22184 res!113900) b!231949))

(assert (= (and b!231949 res!113901) b!231943))

(assert (= (and b!231943 res!113899) b!231935))

(assert (= (and b!231935 c!38551) b!231944))

(assert (= (and b!231935 (not c!38551)) b!231937))

(assert (= (and b!231937 c!38553) b!231934))

(assert (= (and b!231937 (not c!38553)) b!231946))

(assert (= (and b!231934 res!113904) b!231938))

(assert (= (and b!231938 res!113906) b!231950))

(assert (= (and b!231946 c!38552) b!231945))

(assert (= (and b!231946 (not c!38552)) b!231941))

(assert (= (and b!231945 res!113903) b!231933))

(assert (= (and b!231933 res!113905) b!231942))

(assert (= (or b!231934 b!231945) bm!21548))

(assert (= (or b!231950 b!231942) bm!21549))

(assert (= (and b!231935 res!113902) b!231947))

(assert (= (and b!231947 c!38554) b!231951))

(assert (= (and b!231947 (not c!38554)) b!231939))

(assert (= (and b!231948 condMapEmpty!10333) mapIsEmpty!10333))

(assert (= (and b!231948 (not condMapEmpty!10333)) mapNonEmpty!10333))

(assert (= (and mapNonEmpty!10333 ((_ is ValueCellFull!2711) mapValue!10333)) b!231940))

(assert (= (and b!231948 ((_ is ValueCellFull!2711) mapDefault!10333)) b!231936))

(assert (= b!231952 b!231948))

(assert (= start!22184 b!231952))

(declare-fun m!252877 () Bool)

(assert (=> b!231947 m!252877))

(declare-fun m!252879 () Bool)

(assert (=> b!231947 m!252879))

(declare-fun m!252881 () Bool)

(assert (=> b!231947 m!252881))

(declare-fun m!252883 () Bool)

(assert (=> b!231947 m!252883))

(declare-fun m!252885 () Bool)

(assert (=> b!231947 m!252885))

(declare-fun m!252887 () Bool)

(assert (=> b!231947 m!252887))

(declare-fun m!252889 () Bool)

(assert (=> b!231947 m!252889))

(declare-fun m!252891 () Bool)

(assert (=> b!231947 m!252891))

(declare-fun m!252893 () Bool)

(assert (=> b!231947 m!252893))

(declare-fun m!252895 () Bool)

(assert (=> b!231947 m!252895))

(declare-fun m!252897 () Bool)

(assert (=> b!231947 m!252897))

(declare-fun m!252899 () Bool)

(assert (=> b!231947 m!252899))

(declare-fun m!252901 () Bool)

(assert (=> b!231947 m!252901))

(declare-fun m!252903 () Bool)

(assert (=> b!231947 m!252903))

(declare-fun m!252905 () Bool)

(assert (=> b!231947 m!252905))

(declare-fun m!252907 () Bool)

(assert (=> b!231947 m!252907))

(declare-fun m!252909 () Bool)

(assert (=> b!231947 m!252909))

(declare-fun m!252911 () Bool)

(assert (=> b!231952 m!252911))

(declare-fun m!252913 () Bool)

(assert (=> b!231952 m!252913))

(declare-fun m!252915 () Bool)

(assert (=> b!231937 m!252915))

(declare-fun m!252917 () Bool)

(assert (=> b!231933 m!252917))

(declare-fun m!252919 () Bool)

(assert (=> bm!21548 m!252919))

(declare-fun m!252921 () Bool)

(assert (=> mapNonEmpty!10333 m!252921))

(declare-fun m!252923 () Bool)

(assert (=> b!231943 m!252923))

(assert (=> bm!21549 m!252877))

(declare-fun m!252925 () Bool)

(assert (=> b!231938 m!252925))

(declare-fun m!252927 () Bool)

(assert (=> b!231951 m!252927))

(declare-fun m!252929 () Bool)

(assert (=> start!22184 m!252929))

(declare-fun m!252931 () Bool)

(assert (=> b!231935 m!252931))

(declare-fun m!252933 () Bool)

(assert (=> b!231935 m!252933))

(declare-fun m!252935 () Bool)

(assert (=> b!231935 m!252935))

(declare-fun m!252937 () Bool)

(assert (=> b!231944 m!252937))

(check-sat b_and!13119 (not b!231937) (not b!231951) (not b!231943) (not bm!21549) (not b_next!6247) (not b!231952) (not b!231947) (not start!22184) (not bm!21548) tp_is_empty!6109 (not b!231944) (not mapNonEmpty!10333) (not b!231935))
(check-sat b_and!13119 (not b_next!6247))
