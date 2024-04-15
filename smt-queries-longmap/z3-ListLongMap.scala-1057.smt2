; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22028 () Bool)

(assert start!22028)

(declare-fun b!226912 () Bool)

(declare-fun b_free!6091 () Bool)

(declare-fun b_next!6091 () Bool)

(assert (=> b!226912 (= b_free!6091 (not b_next!6091))))

(declare-fun tp!21414 () Bool)

(declare-fun b_and!12963 () Bool)

(assert (=> b!226912 (= tp!21414 b_and!12963)))

(declare-fun b!226908 () Bool)

(declare-datatypes ((Unit!6836 0))(
  ( (Unit!6837) )
))
(declare-fun e!147213 () Unit!6836)

(declare-fun Unit!6838 () Unit!6836)

(assert (=> b!226908 (= e!147213 Unit!6838)))

(declare-fun lt!114088 () Unit!6836)

(declare-datatypes ((V!7585 0))(
  ( (V!7586 (val!3021 Int)) )
))
(declare-datatypes ((ValueCell!2633 0))(
  ( (ValueCellFull!2633 (v!5035 V!7585)) (EmptyCell!2633) )
))
(declare-datatypes ((array!11141 0))(
  ( (array!11142 (arr!5289 (Array (_ BitVec 32) ValueCell!2633)) (size!5623 (_ BitVec 32))) )
))
(declare-datatypes ((array!11143 0))(
  ( (array!11144 (arr!5290 (Array (_ BitVec 32) (_ BitVec 64))) (size!5624 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3166 0))(
  ( (LongMapFixedSize!3167 (defaultEntry!4242 Int) (mask!10099 (_ BitVec 32)) (extraKeys!3979 (_ BitVec 32)) (zeroValue!4083 V!7585) (minValue!4083 V!7585) (_size!1632 (_ BitVec 32)) (_keys!6295 array!11143) (_values!4225 array!11141) (_vacant!1632 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3166)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!98 (array!11143 array!11141 (_ BitVec 32) (_ BitVec 32) V!7585 V!7585 (_ BitVec 64) (_ BitVec 32) Int) Unit!6836)

(assert (=> b!226908 (= lt!114088 (lemmaArrayContainsKeyThenInListMap!98 (_keys!6295 thiss!1504) (_values!4225 thiss!1504) (mask!10099 thiss!1504) (extraKeys!3979 thiss!1504) (zeroValue!4083 thiss!1504) (minValue!4083 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4242 thiss!1504)))))

(assert (=> b!226908 false))

(declare-fun b!226909 () Bool)

(declare-fun e!147204 () Bool)

(declare-fun call!21084 () Bool)

(assert (=> b!226909 (= e!147204 (not call!21084))))

(declare-fun b!226910 () Bool)

(declare-fun res!111685 () Bool)

(declare-fun e!147206 () Bool)

(assert (=> b!226910 (=> res!111685 e!147206)))

(assert (=> b!226910 (= res!111685 (or (not (= (size!5623 (_values!4225 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10099 thiss!1504)))) (not (= (size!5624 (_keys!6295 thiss!1504)) (size!5623 (_values!4225 thiss!1504)))) (bvslt (mask!10099 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3979 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3979 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!10099 () Bool)

(declare-fun mapRes!10099 () Bool)

(assert (=> mapIsEmpty!10099 mapRes!10099))

(declare-fun b!226911 () Bool)

(declare-fun e!147203 () Bool)

(declare-fun e!147209 () Bool)

(assert (=> b!226911 (= e!147203 e!147209)))

(declare-fun res!111682 () Bool)

(assert (=> b!226911 (=> (not res!111682) (not e!147209))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226911 (= res!111682 (inRange!0 index!297 (mask!10099 thiss!1504)))))

(declare-fun lt!114089 () Unit!6836)

(declare-fun e!147211 () Unit!6836)

(assert (=> b!226911 (= lt!114089 e!147211)))

(declare-fun c!37615 () Bool)

(declare-datatypes ((tuple2!4442 0))(
  ( (tuple2!4443 (_1!2232 (_ BitVec 64)) (_2!2232 V!7585)) )
))
(declare-datatypes ((List!3373 0))(
  ( (Nil!3370) (Cons!3369 (h!4017 tuple2!4442) (t!8323 List!3373)) )
))
(declare-datatypes ((ListLongMap!3345 0))(
  ( (ListLongMap!3346 (toList!1688 List!3373)) )
))
(declare-fun contains!1563 (ListLongMap!3345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1197 (array!11143 array!11141 (_ BitVec 32) (_ BitVec 32) V!7585 V!7585 (_ BitVec 32) Int) ListLongMap!3345)

(assert (=> b!226911 (= c!37615 (contains!1563 (getCurrentListMap!1197 (_keys!6295 thiss!1504) (_values!4225 thiss!1504) (mask!10099 thiss!1504) (extraKeys!3979 thiss!1504) (zeroValue!4083 thiss!1504) (minValue!4083 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4242 thiss!1504)) key!932))))

(declare-fun e!147205 () Bool)

(declare-fun tp_is_empty!5953 () Bool)

(declare-fun e!147210 () Bool)

(declare-fun array_inv!3493 (array!11143) Bool)

(declare-fun array_inv!3494 (array!11141) Bool)

(assert (=> b!226912 (= e!147205 (and tp!21414 tp_is_empty!5953 (array_inv!3493 (_keys!6295 thiss!1504)) (array_inv!3494 (_values!4225 thiss!1504)) e!147210))))

(declare-fun b!226913 () Bool)

(declare-fun e!147199 () Bool)

(assert (=> b!226913 (= e!147199 e!147203)))

(declare-fun res!111689 () Bool)

(assert (=> b!226913 (=> (not res!111689) (not e!147203))))

(declare-datatypes ((SeekEntryResult!889 0))(
  ( (MissingZero!889 (index!5726 (_ BitVec 32))) (Found!889 (index!5727 (_ BitVec 32))) (Intermediate!889 (undefined!1701 Bool) (index!5728 (_ BitVec 32)) (x!23260 (_ BitVec 32))) (Undefined!889) (MissingVacant!889 (index!5729 (_ BitVec 32))) )
))
(declare-fun lt!114093 () SeekEntryResult!889)

(assert (=> b!226913 (= res!111689 (or (= lt!114093 (MissingZero!889 index!297)) (= lt!114093 (MissingVacant!889 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11143 (_ BitVec 32)) SeekEntryResult!889)

(assert (=> b!226913 (= lt!114093 (seekEntryOrOpen!0 key!932 (_keys!6295 thiss!1504) (mask!10099 thiss!1504)))))

(declare-fun b!226914 () Bool)

(declare-fun res!111692 () Bool)

(declare-fun e!147208 () Bool)

(assert (=> b!226914 (=> (not res!111692) (not e!147208))))

(assert (=> b!226914 (= res!111692 (= (select (arr!5290 (_keys!6295 thiss!1504)) (index!5726 lt!114093)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226915 () Bool)

(declare-fun res!111686 () Bool)

(assert (=> b!226915 (=> (not res!111686) (not e!147199))))

(assert (=> b!226915 (= res!111686 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226916 () Bool)

(declare-fun res!111691 () Bool)

(assert (=> b!226916 (=> res!111691 e!147206)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11143 (_ BitVec 32)) Bool)

(assert (=> b!226916 (= res!111691 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6295 thiss!1504) (mask!10099 thiss!1504))))))

(declare-fun b!226917 () Bool)

(declare-fun res!111688 () Bool)

(assert (=> b!226917 (= res!111688 (= (select (arr!5290 (_keys!6295 thiss!1504)) (index!5729 lt!114093)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226917 (=> (not res!111688) (not e!147204))))

(declare-fun b!226919 () Bool)

(declare-fun e!147200 () Bool)

(assert (=> b!226919 (= e!147210 (and e!147200 mapRes!10099))))

(declare-fun condMapEmpty!10099 () Bool)

(declare-fun mapDefault!10099 () ValueCell!2633)

(assert (=> b!226919 (= condMapEmpty!10099 (= (arr!5289 (_values!4225 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2633)) mapDefault!10099)))))

(declare-fun b!226920 () Bool)

(declare-fun e!147212 () Bool)

(get-info :version)

(assert (=> b!226920 (= e!147212 ((_ is Undefined!889) lt!114093))))

(declare-fun b!226921 () Bool)

(declare-fun res!111683 () Bool)

(assert (=> b!226921 (=> (not res!111683) (not e!147208))))

(declare-fun call!21083 () Bool)

(assert (=> b!226921 (= res!111683 call!21083)))

(declare-fun e!147207 () Bool)

(assert (=> b!226921 (= e!147207 e!147208)))

(declare-fun b!226922 () Bool)

(declare-fun Unit!6839 () Unit!6836)

(assert (=> b!226922 (= e!147213 Unit!6839)))

(declare-fun bm!21080 () Bool)

(declare-fun c!37616 () Bool)

(assert (=> bm!21080 (= call!21083 (inRange!0 (ite c!37616 (index!5726 lt!114093) (index!5729 lt!114093)) (mask!10099 thiss!1504)))))

(declare-fun b!226923 () Bool)

(assert (=> b!226923 (= e!147208 (not call!21084))))

(declare-fun b!226924 () Bool)

(assert (=> b!226924 (= e!147212 e!147204)))

(declare-fun res!111690 () Bool)

(assert (=> b!226924 (= res!111690 call!21083)))

(assert (=> b!226924 (=> (not res!111690) (not e!147204))))

(declare-fun b!226925 () Bool)

(assert (=> b!226925 (= e!147206 true)))

(declare-fun lt!114092 () Bool)

(declare-datatypes ((List!3374 0))(
  ( (Nil!3371) (Cons!3370 (h!4018 (_ BitVec 64)) (t!8324 List!3374)) )
))
(declare-fun arrayNoDuplicates!0 (array!11143 (_ BitVec 32) List!3374) Bool)

(assert (=> b!226925 (= lt!114092 (arrayNoDuplicates!0 (_keys!6295 thiss!1504) #b00000000000000000000000000000000 Nil!3371))))

(declare-fun b!226926 () Bool)

(declare-fun lt!114087 () Unit!6836)

(assert (=> b!226926 (= e!147211 lt!114087)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!256 (array!11143 array!11141 (_ BitVec 32) (_ BitVec 32) V!7585 V!7585 (_ BitVec 64) Int) Unit!6836)

(assert (=> b!226926 (= lt!114087 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!256 (_keys!6295 thiss!1504) (_values!4225 thiss!1504) (mask!10099 thiss!1504) (extraKeys!3979 thiss!1504) (zeroValue!4083 thiss!1504) (minValue!4083 thiss!1504) key!932 (defaultEntry!4242 thiss!1504)))))

(assert (=> b!226926 (= c!37616 ((_ is MissingZero!889) lt!114093))))

(assert (=> b!226926 e!147207))

(declare-fun b!226927 () Bool)

(declare-fun c!37618 () Bool)

(assert (=> b!226927 (= c!37618 ((_ is MissingVacant!889) lt!114093))))

(assert (=> b!226927 (= e!147207 e!147212)))

(declare-fun bm!21081 () Bool)

(declare-fun arrayContainsKey!0 (array!11143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21081 (= call!21084 (arrayContainsKey!0 (_keys!6295 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10099 () Bool)

(declare-fun tp!21415 () Bool)

(declare-fun e!147202 () Bool)

(assert (=> mapNonEmpty!10099 (= mapRes!10099 (and tp!21415 e!147202))))

(declare-fun mapRest!10099 () (Array (_ BitVec 32) ValueCell!2633))

(declare-fun mapValue!10099 () ValueCell!2633)

(declare-fun mapKey!10099 () (_ BitVec 32))

(assert (=> mapNonEmpty!10099 (= (arr!5289 (_values!4225 thiss!1504)) (store mapRest!10099 mapKey!10099 mapValue!10099))))

(declare-fun b!226928 () Bool)

(assert (=> b!226928 (= e!147200 tp_is_empty!5953)))

(declare-fun b!226929 () Bool)

(assert (=> b!226929 (= e!147202 tp_is_empty!5953)))

(declare-fun b!226930 () Bool)

(declare-fun Unit!6840 () Unit!6836)

(assert (=> b!226930 (= e!147211 Unit!6840)))

(declare-fun lt!114086 () Unit!6836)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!259 (array!11143 array!11141 (_ BitVec 32) (_ BitVec 32) V!7585 V!7585 (_ BitVec 64) Int) Unit!6836)

(assert (=> b!226930 (= lt!114086 (lemmaInListMapThenSeekEntryOrOpenFindsIt!259 (_keys!6295 thiss!1504) (_values!4225 thiss!1504) (mask!10099 thiss!1504) (extraKeys!3979 thiss!1504) (zeroValue!4083 thiss!1504) (minValue!4083 thiss!1504) key!932 (defaultEntry!4242 thiss!1504)))))

(assert (=> b!226930 false))

(declare-fun b!226918 () Bool)

(assert (=> b!226918 (= e!147209 (not e!147206))))

(declare-fun res!111684 () Bool)

(assert (=> b!226918 (=> res!111684 e!147206)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226918 (= res!111684 (not (validMask!0 (mask!10099 thiss!1504))))))

(declare-fun lt!114090 () array!11143)

(assert (=> b!226918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114090 (mask!10099 thiss!1504))))

(declare-fun lt!114084 () Unit!6836)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11143 (_ BitVec 32) (_ BitVec 32)) Unit!6836)

(assert (=> b!226918 (= lt!114084 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6295 thiss!1504) index!297 (mask!10099 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11143 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226918 (= (arrayCountValidKeys!0 lt!114090 #b00000000000000000000000000000000 (size!5624 (_keys!6295 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6295 thiss!1504) #b00000000000000000000000000000000 (size!5624 (_keys!6295 thiss!1504)))))))

(declare-fun lt!114094 () Unit!6836)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11143 (_ BitVec 32) (_ BitVec 64)) Unit!6836)

(assert (=> b!226918 (= lt!114094 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6295 thiss!1504) index!297 key!932))))

(assert (=> b!226918 (arrayNoDuplicates!0 lt!114090 #b00000000000000000000000000000000 Nil!3371)))

(assert (=> b!226918 (= lt!114090 (array!11144 (store (arr!5290 (_keys!6295 thiss!1504)) index!297 key!932) (size!5624 (_keys!6295 thiss!1504))))))

(declare-fun lt!114085 () Unit!6836)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11143 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3374) Unit!6836)

(assert (=> b!226918 (= lt!114085 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6295 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3371))))

(declare-fun lt!114091 () Unit!6836)

(assert (=> b!226918 (= lt!114091 e!147213)))

(declare-fun c!37617 () Bool)

(assert (=> b!226918 (= c!37617 (arrayContainsKey!0 (_keys!6295 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!111687 () Bool)

(assert (=> start!22028 (=> (not res!111687) (not e!147199))))

(declare-fun valid!1283 (LongMapFixedSize!3166) Bool)

(assert (=> start!22028 (= res!111687 (valid!1283 thiss!1504))))

(assert (=> start!22028 e!147199))

(assert (=> start!22028 e!147205))

(assert (=> start!22028 true))

(assert (= (and start!22028 res!111687) b!226915))

(assert (= (and b!226915 res!111686) b!226913))

(assert (= (and b!226913 res!111689) b!226911))

(assert (= (and b!226911 c!37615) b!226930))

(assert (= (and b!226911 (not c!37615)) b!226926))

(assert (= (and b!226926 c!37616) b!226921))

(assert (= (and b!226926 (not c!37616)) b!226927))

(assert (= (and b!226921 res!111683) b!226914))

(assert (= (and b!226914 res!111692) b!226923))

(assert (= (and b!226927 c!37618) b!226924))

(assert (= (and b!226927 (not c!37618)) b!226920))

(assert (= (and b!226924 res!111690) b!226917))

(assert (= (and b!226917 res!111688) b!226909))

(assert (= (or b!226921 b!226924) bm!21080))

(assert (= (or b!226923 b!226909) bm!21081))

(assert (= (and b!226911 res!111682) b!226918))

(assert (= (and b!226918 c!37617) b!226908))

(assert (= (and b!226918 (not c!37617)) b!226922))

(assert (= (and b!226918 (not res!111684)) b!226910))

(assert (= (and b!226910 (not res!111685)) b!226916))

(assert (= (and b!226916 (not res!111691)) b!226925))

(assert (= (and b!226919 condMapEmpty!10099) mapIsEmpty!10099))

(assert (= (and b!226919 (not condMapEmpty!10099)) mapNonEmpty!10099))

(assert (= (and mapNonEmpty!10099 ((_ is ValueCellFull!2633) mapValue!10099)) b!226929))

(assert (= (and b!226919 ((_ is ValueCellFull!2633) mapDefault!10099)) b!226928))

(assert (= b!226912 b!226919))

(assert (= start!22028 b!226912))

(declare-fun m!248539 () Bool)

(assert (=> b!226913 m!248539))

(declare-fun m!248541 () Bool)

(assert (=> b!226930 m!248541))

(declare-fun m!248543 () Bool)

(assert (=> mapNonEmpty!10099 m!248543))

(declare-fun m!248545 () Bool)

(assert (=> b!226926 m!248545))

(declare-fun m!248547 () Bool)

(assert (=> b!226911 m!248547))

(declare-fun m!248549 () Bool)

(assert (=> b!226911 m!248549))

(assert (=> b!226911 m!248549))

(declare-fun m!248551 () Bool)

(assert (=> b!226911 m!248551))

(declare-fun m!248553 () Bool)

(assert (=> b!226912 m!248553))

(declare-fun m!248555 () Bool)

(assert (=> b!226912 m!248555))

(declare-fun m!248557 () Bool)

(assert (=> b!226908 m!248557))

(declare-fun m!248559 () Bool)

(assert (=> bm!21080 m!248559))

(declare-fun m!248561 () Bool)

(assert (=> b!226925 m!248561))

(declare-fun m!248563 () Bool)

(assert (=> b!226914 m!248563))

(declare-fun m!248565 () Bool)

(assert (=> bm!21081 m!248565))

(declare-fun m!248567 () Bool)

(assert (=> start!22028 m!248567))

(declare-fun m!248569 () Bool)

(assert (=> b!226916 m!248569))

(declare-fun m!248571 () Bool)

(assert (=> b!226918 m!248571))

(assert (=> b!226918 m!248565))

(declare-fun m!248573 () Bool)

(assert (=> b!226918 m!248573))

(declare-fun m!248575 () Bool)

(assert (=> b!226918 m!248575))

(declare-fun m!248577 () Bool)

(assert (=> b!226918 m!248577))

(declare-fun m!248579 () Bool)

(assert (=> b!226918 m!248579))

(declare-fun m!248581 () Bool)

(assert (=> b!226918 m!248581))

(declare-fun m!248583 () Bool)

(assert (=> b!226918 m!248583))

(declare-fun m!248585 () Bool)

(assert (=> b!226918 m!248585))

(declare-fun m!248587 () Bool)

(assert (=> b!226918 m!248587))

(declare-fun m!248589 () Bool)

(assert (=> b!226917 m!248589))

(check-sat (not bm!21081) (not b!226913) tp_is_empty!5953 b_and!12963 (not mapNonEmpty!10099) (not b!226926) (not b!226930) (not start!22028) (not b_next!6091) (not b!226912) (not b!226911) (not b!226918) (not b!226908) (not b!226925) (not b!226916) (not bm!21080))
(check-sat b_and!12963 (not b_next!6091))
