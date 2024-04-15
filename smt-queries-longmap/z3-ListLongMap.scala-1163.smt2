; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24562 () Bool)

(assert start!24562)

(declare-fun b!256963 () Bool)

(declare-fun b_free!6727 () Bool)

(declare-fun b_next!6727 () Bool)

(assert (=> b!256963 (= b_free!6727 (not b_next!6727))))

(declare-fun tp!23487 () Bool)

(declare-fun b_and!13767 () Bool)

(assert (=> b!256963 (= tp!23487 b_and!13767)))

(declare-fun call!24366 () Bool)

(declare-fun bm!24363 () Bool)

(declare-datatypes ((SeekEntryResult!1164 0))(
  ( (MissingZero!1164 (index!6826 (_ BitVec 32))) (Found!1164 (index!6827 (_ BitVec 32))) (Intermediate!1164 (undefined!1976 Bool) (index!6828 (_ BitVec 32)) (x!24995 (_ BitVec 32))) (Undefined!1164) (MissingVacant!1164 (index!6829 (_ BitVec 32))) )
))
(declare-fun lt!129010 () SeekEntryResult!1164)

(declare-datatypes ((V!8433 0))(
  ( (V!8434 (val!3339 Int)) )
))
(declare-datatypes ((ValueCell!2951 0))(
  ( (ValueCellFull!2951 (v!5425 V!8433)) (EmptyCell!2951) )
))
(declare-datatypes ((array!12513 0))(
  ( (array!12514 (arr!5925 (Array (_ BitVec 32) ValueCell!2951)) (size!6273 (_ BitVec 32))) )
))
(declare-datatypes ((array!12515 0))(
  ( (array!12516 (arr!5926 (Array (_ BitVec 32) (_ BitVec 64))) (size!6274 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3802 0))(
  ( (LongMapFixedSize!3803 (defaultEntry!4744 Int) (mask!11027 (_ BitVec 32)) (extraKeys!4481 (_ BitVec 32)) (zeroValue!4585 V!8433) (minValue!4585 V!8433) (_size!1950 (_ BitVec 32)) (_keys!6909 array!12515) (_values!4727 array!12513) (_vacant!1950 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3802)

(declare-fun c!43463 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24363 (= call!24366 (inRange!0 (ite c!43463 (index!6826 lt!129010) (index!6829 lt!129010)) (mask!11027 thiss!1504)))))

(declare-fun res!125668 () Bool)

(declare-fun e!166548 () Bool)

(assert (=> start!24562 (=> (not res!125668) (not e!166548))))

(declare-fun valid!1490 (LongMapFixedSize!3802) Bool)

(assert (=> start!24562 (= res!125668 (valid!1490 thiss!1504))))

(assert (=> start!24562 e!166548))

(declare-fun e!166551 () Bool)

(assert (=> start!24562 e!166551))

(assert (=> start!24562 true))

(declare-fun tp_is_empty!6589 () Bool)

(assert (=> start!24562 tp_is_empty!6589))

(declare-fun b!256944 () Bool)

(declare-fun e!166560 () Bool)

(declare-fun call!24367 () Bool)

(assert (=> b!256944 (= e!166560 (not call!24367))))

(declare-fun b!256945 () Bool)

(declare-datatypes ((Unit!7946 0))(
  ( (Unit!7947) )
))
(declare-fun e!166553 () Unit!7946)

(declare-fun Unit!7948 () Unit!7946)

(assert (=> b!256945 (= e!166553 Unit!7948)))

(declare-fun lt!129009 () Unit!7946)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!240 (array!12515 array!12513 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) (_ BitVec 32) Int) Unit!7946)

(assert (=> b!256945 (= lt!129009 (lemmaArrayContainsKeyThenInListMap!240 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(assert (=> b!256945 false))

(declare-fun b!256946 () Bool)

(declare-fun e!166554 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!256946 (= e!166554 (not (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6273 (_values!4727 thiss!1504))))))))

(declare-fun lt!129012 () array!12515)

(declare-fun arrayCountValidKeys!0 (array!12515 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!256946 (= (arrayCountValidKeys!0 lt!129012 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!129008 () Unit!7946)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12515 (_ BitVec 32)) Unit!7946)

(assert (=> b!256946 (= lt!129008 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129012 index!297))))

(declare-fun arrayContainsKey!0 (array!12515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!256946 (arrayContainsKey!0 lt!129012 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129016 () Unit!7946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12515 (_ BitVec 64) (_ BitVec 32)) Unit!7946)

(assert (=> b!256946 (= lt!129016 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129012 key!932 index!297))))

(declare-datatypes ((tuple2!4870 0))(
  ( (tuple2!4871 (_1!2446 (_ BitVec 64)) (_2!2446 V!8433)) )
))
(declare-datatypes ((List!3771 0))(
  ( (Nil!3768) (Cons!3767 (h!4429 tuple2!4870) (t!8821 List!3771)) )
))
(declare-datatypes ((ListLongMap!3773 0))(
  ( (ListLongMap!3774 (toList!1902 List!3771)) )
))
(declare-fun lt!129017 () ListLongMap!3773)

(declare-fun v!346 () V!8433)

(declare-fun +!692 (ListLongMap!3773 tuple2!4870) ListLongMap!3773)

(declare-fun getCurrentListMap!1411 (array!12515 array!12513 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 32) Int) ListLongMap!3773)

(assert (=> b!256946 (= (+!692 lt!129017 (tuple2!4871 key!932 v!346)) (getCurrentListMap!1411 lt!129012 (array!12514 (store (arr!5925 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6273 (_values!4727 thiss!1504))) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129018 () Unit!7946)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!103 (array!12515 array!12513 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 32) (_ BitVec 64) V!8433 Int) Unit!7946)

(assert (=> b!256946 (= lt!129018 (lemmaAddValidKeyToArrayThenAddPairToListMap!103 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) index!297 key!932 v!346 (defaultEntry!4744 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12515 (_ BitVec 32)) Bool)

(assert (=> b!256946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129012 (mask!11027 thiss!1504))))

(declare-fun lt!129019 () Unit!7946)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12515 (_ BitVec 32) (_ BitVec 32)) Unit!7946)

(assert (=> b!256946 (= lt!129019 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6909 thiss!1504) index!297 (mask!11027 thiss!1504)))))

(assert (=> b!256946 (= (arrayCountValidKeys!0 lt!129012 #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6909 thiss!1504) #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504)))))))

(declare-fun lt!129013 () Unit!7946)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12515 (_ BitVec 32) (_ BitVec 64)) Unit!7946)

(assert (=> b!256946 (= lt!129013 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6909 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3772 0))(
  ( (Nil!3769) (Cons!3768 (h!4430 (_ BitVec 64)) (t!8822 List!3772)) )
))
(declare-fun arrayNoDuplicates!0 (array!12515 (_ BitVec 32) List!3772) Bool)

(assert (=> b!256946 (arrayNoDuplicates!0 lt!129012 #b00000000000000000000000000000000 Nil!3769)))

(assert (=> b!256946 (= lt!129012 (array!12516 (store (arr!5926 (_keys!6909 thiss!1504)) index!297 key!932) (size!6274 (_keys!6909 thiss!1504))))))

(declare-fun lt!129015 () Unit!7946)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12515 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3772) Unit!7946)

(assert (=> b!256946 (= lt!129015 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6909 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3769))))

(declare-fun lt!129006 () Unit!7946)

(assert (=> b!256946 (= lt!129006 e!166553)))

(declare-fun c!43462 () Bool)

(assert (=> b!256946 (= c!43462 (arrayContainsKey!0 (_keys!6909 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256947 () Bool)

(declare-fun e!166550 () Unit!7946)

(declare-fun Unit!7949 () Unit!7946)

(assert (=> b!256947 (= e!166550 Unit!7949)))

(declare-fun lt!129007 () Unit!7946)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!429 (array!12515 array!12513 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) Int) Unit!7946)

(assert (=> b!256947 (= lt!129007 (lemmaInListMapThenSeekEntryOrOpenFindsIt!429 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)))))

(assert (=> b!256947 false))

(declare-fun b!256948 () Bool)

(declare-fun res!125670 () Bool)

(assert (=> b!256948 (=> (not res!125670) (not e!166560))))

(assert (=> b!256948 (= res!125670 call!24366)))

(declare-fun e!166552 () Bool)

(assert (=> b!256948 (= e!166552 e!166560)))

(declare-fun b!256949 () Bool)

(declare-fun e!166558 () Bool)

(declare-fun e!166559 () Bool)

(declare-fun mapRes!11217 () Bool)

(assert (=> b!256949 (= e!166558 (and e!166559 mapRes!11217))))

(declare-fun condMapEmpty!11217 () Bool)

(declare-fun mapDefault!11217 () ValueCell!2951)

(assert (=> b!256949 (= condMapEmpty!11217 (= (arr!5925 (_values!4727 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2951)) mapDefault!11217)))))

(declare-fun b!256950 () Bool)

(declare-fun c!43461 () Bool)

(get-info :version)

(assert (=> b!256950 (= c!43461 ((_ is MissingVacant!1164) lt!129010))))

(declare-fun e!166549 () Bool)

(assert (=> b!256950 (= e!166552 e!166549)))

(declare-fun b!256951 () Bool)

(assert (=> b!256951 (= e!166559 tp_is_empty!6589)))

(declare-fun b!256952 () Bool)

(declare-fun e!166557 () Bool)

(assert (=> b!256952 (= e!166549 e!166557)))

(declare-fun res!125669 () Bool)

(assert (=> b!256952 (= res!125669 call!24366)))

(assert (=> b!256952 (=> (not res!125669) (not e!166557))))

(declare-fun bm!24364 () Bool)

(assert (=> bm!24364 (= call!24367 (arrayContainsKey!0 (_keys!6909 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256953 () Bool)

(declare-fun Unit!7950 () Unit!7946)

(assert (=> b!256953 (= e!166553 Unit!7950)))

(declare-fun b!256954 () Bool)

(declare-fun res!125674 () Bool)

(assert (=> b!256954 (=> (not res!125674) (not e!166548))))

(assert (=> b!256954 (= res!125674 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!256955 () Bool)

(declare-fun res!125671 () Bool)

(assert (=> b!256955 (= res!125671 (= (select (arr!5926 (_keys!6909 thiss!1504)) (index!6829 lt!129010)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256955 (=> (not res!125671) (not e!166557))))

(declare-fun b!256956 () Bool)

(assert (=> b!256956 (= e!166549 ((_ is Undefined!1164) lt!129010))))

(declare-fun b!256957 () Bool)

(assert (=> b!256957 (= e!166557 (not call!24367))))

(declare-fun b!256958 () Bool)

(declare-fun res!125675 () Bool)

(assert (=> b!256958 (=> (not res!125675) (not e!166560))))

(assert (=> b!256958 (= res!125675 (= (select (arr!5926 (_keys!6909 thiss!1504)) (index!6826 lt!129010)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!11217 () Bool)

(declare-fun tp!23486 () Bool)

(declare-fun e!166547 () Bool)

(assert (=> mapNonEmpty!11217 (= mapRes!11217 (and tp!23486 e!166547))))

(declare-fun mapKey!11217 () (_ BitVec 32))

(declare-fun mapRest!11217 () (Array (_ BitVec 32) ValueCell!2951))

(declare-fun mapValue!11217 () ValueCell!2951)

(assert (=> mapNonEmpty!11217 (= (arr!5925 (_values!4727 thiss!1504)) (store mapRest!11217 mapKey!11217 mapValue!11217))))

(declare-fun b!256959 () Bool)

(declare-fun e!166556 () Bool)

(assert (=> b!256959 (= e!166548 e!166556)))

(declare-fun res!125673 () Bool)

(assert (=> b!256959 (=> (not res!125673) (not e!166556))))

(assert (=> b!256959 (= res!125673 (or (= lt!129010 (MissingZero!1164 index!297)) (= lt!129010 (MissingVacant!1164 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12515 (_ BitVec 32)) SeekEntryResult!1164)

(assert (=> b!256959 (= lt!129010 (seekEntryOrOpen!0 key!932 (_keys!6909 thiss!1504) (mask!11027 thiss!1504)))))

(declare-fun mapIsEmpty!11217 () Bool)

(assert (=> mapIsEmpty!11217 mapRes!11217))

(declare-fun b!256960 () Bool)

(declare-fun lt!129014 () Unit!7946)

(assert (=> b!256960 (= e!166550 lt!129014)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!430 (array!12515 array!12513 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) Int) Unit!7946)

(assert (=> b!256960 (= lt!129014 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!430 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)))))

(assert (=> b!256960 (= c!43463 ((_ is MissingZero!1164) lt!129010))))

(assert (=> b!256960 e!166552))

(declare-fun b!256961 () Bool)

(assert (=> b!256961 (= e!166547 tp_is_empty!6589)))

(declare-fun b!256962 () Bool)

(assert (=> b!256962 (= e!166556 e!166554)))

(declare-fun res!125672 () Bool)

(assert (=> b!256962 (=> (not res!125672) (not e!166554))))

(assert (=> b!256962 (= res!125672 (inRange!0 index!297 (mask!11027 thiss!1504)))))

(declare-fun lt!129011 () Unit!7946)

(assert (=> b!256962 (= lt!129011 e!166550)))

(declare-fun c!43464 () Bool)

(declare-fun contains!1848 (ListLongMap!3773 (_ BitVec 64)) Bool)

(assert (=> b!256962 (= c!43464 (contains!1848 lt!129017 key!932))))

(assert (=> b!256962 (= lt!129017 (getCurrentListMap!1411 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun array_inv!3921 (array!12515) Bool)

(declare-fun array_inv!3922 (array!12513) Bool)

(assert (=> b!256963 (= e!166551 (and tp!23487 tp_is_empty!6589 (array_inv!3921 (_keys!6909 thiss!1504)) (array_inv!3922 (_values!4727 thiss!1504)) e!166558))))

(assert (= (and start!24562 res!125668) b!256954))

(assert (= (and b!256954 res!125674) b!256959))

(assert (= (and b!256959 res!125673) b!256962))

(assert (= (and b!256962 c!43464) b!256947))

(assert (= (and b!256962 (not c!43464)) b!256960))

(assert (= (and b!256960 c!43463) b!256948))

(assert (= (and b!256960 (not c!43463)) b!256950))

(assert (= (and b!256948 res!125670) b!256958))

(assert (= (and b!256958 res!125675) b!256944))

(assert (= (and b!256950 c!43461) b!256952))

(assert (= (and b!256950 (not c!43461)) b!256956))

(assert (= (and b!256952 res!125669) b!256955))

(assert (= (and b!256955 res!125671) b!256957))

(assert (= (or b!256948 b!256952) bm!24363))

(assert (= (or b!256944 b!256957) bm!24364))

(assert (= (and b!256962 res!125672) b!256946))

(assert (= (and b!256946 c!43462) b!256945))

(assert (= (and b!256946 (not c!43462)) b!256953))

(assert (= (and b!256949 condMapEmpty!11217) mapIsEmpty!11217))

(assert (= (and b!256949 (not condMapEmpty!11217)) mapNonEmpty!11217))

(assert (= (and mapNonEmpty!11217 ((_ is ValueCellFull!2951) mapValue!11217)) b!256961))

(assert (= (and b!256949 ((_ is ValueCellFull!2951) mapDefault!11217)) b!256951))

(assert (= b!256963 b!256949))

(assert (= start!24562 b!256963))

(declare-fun m!271799 () Bool)

(assert (=> b!256963 m!271799))

(declare-fun m!271801 () Bool)

(assert (=> b!256963 m!271801))

(declare-fun m!271803 () Bool)

(assert (=> bm!24363 m!271803))

(declare-fun m!271805 () Bool)

(assert (=> b!256947 m!271805))

(declare-fun m!271807 () Bool)

(assert (=> bm!24364 m!271807))

(declare-fun m!271809 () Bool)

(assert (=> b!256945 m!271809))

(declare-fun m!271811 () Bool)

(assert (=> b!256960 m!271811))

(declare-fun m!271813 () Bool)

(assert (=> b!256959 m!271813))

(assert (=> b!256946 m!271807))

(declare-fun m!271815 () Bool)

(assert (=> b!256946 m!271815))

(declare-fun m!271817 () Bool)

(assert (=> b!256946 m!271817))

(declare-fun m!271819 () Bool)

(assert (=> b!256946 m!271819))

(declare-fun m!271821 () Bool)

(assert (=> b!256946 m!271821))

(declare-fun m!271823 () Bool)

(assert (=> b!256946 m!271823))

(declare-fun m!271825 () Bool)

(assert (=> b!256946 m!271825))

(declare-fun m!271827 () Bool)

(assert (=> b!256946 m!271827))

(declare-fun m!271829 () Bool)

(assert (=> b!256946 m!271829))

(declare-fun m!271831 () Bool)

(assert (=> b!256946 m!271831))

(declare-fun m!271833 () Bool)

(assert (=> b!256946 m!271833))

(declare-fun m!271835 () Bool)

(assert (=> b!256946 m!271835))

(declare-fun m!271837 () Bool)

(assert (=> b!256946 m!271837))

(declare-fun m!271839 () Bool)

(assert (=> b!256946 m!271839))

(declare-fun m!271841 () Bool)

(assert (=> b!256946 m!271841))

(declare-fun m!271843 () Bool)

(assert (=> b!256946 m!271843))

(declare-fun m!271845 () Bool)

(assert (=> b!256946 m!271845))

(declare-fun m!271847 () Bool)

(assert (=> mapNonEmpty!11217 m!271847))

(declare-fun m!271849 () Bool)

(assert (=> start!24562 m!271849))

(declare-fun m!271851 () Bool)

(assert (=> b!256958 m!271851))

(declare-fun m!271853 () Bool)

(assert (=> b!256955 m!271853))

(declare-fun m!271855 () Bool)

(assert (=> b!256962 m!271855))

(declare-fun m!271857 () Bool)

(assert (=> b!256962 m!271857))

(declare-fun m!271859 () Bool)

(assert (=> b!256962 m!271859))

(check-sat (not b_next!6727) (not b!256962) b_and!13767 (not b!256946) (not bm!24363) (not b!256959) (not bm!24364) (not b!256963) tp_is_empty!6589 (not b!256945) (not b!256947) (not mapNonEmpty!11217) (not start!24562) (not b!256960))
(check-sat b_and!13767 (not b_next!6727))
(get-model)

(declare-fun d!61621 () Bool)

(declare-fun res!125728 () Bool)

(declare-fun e!166649 () Bool)

(assert (=> d!61621 (=> res!125728 e!166649)))

(assert (=> d!61621 (= res!125728 (= (select (arr!5926 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61621 (= (arrayContainsKey!0 (_keys!6909 thiss!1504) key!932 #b00000000000000000000000000000000) e!166649)))

(declare-fun b!257088 () Bool)

(declare-fun e!166650 () Bool)

(assert (=> b!257088 (= e!166649 e!166650)))

(declare-fun res!125729 () Bool)

(assert (=> b!257088 (=> (not res!125729) (not e!166650))))

(assert (=> b!257088 (= res!125729 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6274 (_keys!6909 thiss!1504))))))

(declare-fun b!257089 () Bool)

(assert (=> b!257089 (= e!166650 (arrayContainsKey!0 (_keys!6909 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61621 (not res!125728)) b!257088))

(assert (= (and b!257088 res!125729) b!257089))

(declare-fun m!271985 () Bool)

(assert (=> d!61621 m!271985))

(declare-fun m!271987 () Bool)

(assert (=> b!257089 m!271987))

(assert (=> bm!24364 d!61621))

(declare-fun d!61623 () Bool)

(assert (=> d!61623 (= (inRange!0 (ite c!43463 (index!6826 lt!129010) (index!6829 lt!129010)) (mask!11027 thiss!1504)) (and (bvsge (ite c!43463 (index!6826 lt!129010) (index!6829 lt!129010)) #b00000000000000000000000000000000) (bvslt (ite c!43463 (index!6826 lt!129010) (index!6829 lt!129010)) (bvadd (mask!11027 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24363 d!61623))

(declare-fun b!257106 () Bool)

(declare-fun res!125741 () Bool)

(declare-fun e!166662 () Bool)

(assert (=> b!257106 (=> (not res!125741) (not e!166662))))

(declare-fun lt!129108 () SeekEntryResult!1164)

(assert (=> b!257106 (= res!125741 (= (select (arr!5926 (_keys!6909 thiss!1504)) (index!6829 lt!129108)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257106 (and (bvsge (index!6829 lt!129108) #b00000000000000000000000000000000) (bvslt (index!6829 lt!129108) (size!6274 (_keys!6909 thiss!1504))))))

(declare-fun d!61625 () Bool)

(declare-fun e!166659 () Bool)

(assert (=> d!61625 e!166659))

(declare-fun c!43493 () Bool)

(assert (=> d!61625 (= c!43493 ((_ is MissingZero!1164) lt!129108))))

(assert (=> d!61625 (= lt!129108 (seekEntryOrOpen!0 key!932 (_keys!6909 thiss!1504) (mask!11027 thiss!1504)))))

(declare-fun lt!129109 () Unit!7946)

(declare-fun choose!1243 (array!12515 array!12513 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) Int) Unit!7946)

(assert (=> d!61625 (= lt!129109 (choose!1243 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61625 (validMask!0 (mask!11027 thiss!1504))))

(assert (=> d!61625 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!430 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)) lt!129109)))

(declare-fun b!257107 () Bool)

(declare-fun e!166661 () Bool)

(declare-fun call!24384 () Bool)

(assert (=> b!257107 (= e!166661 (not call!24384))))

(declare-fun b!257108 () Bool)

(declare-fun e!166660 () Bool)

(assert (=> b!257108 (= e!166660 ((_ is Undefined!1164) lt!129108))))

(declare-fun b!257109 () Bool)

(assert (=> b!257109 (= e!166662 (not call!24384))))

(declare-fun b!257110 () Bool)

(assert (=> b!257110 (and (bvsge (index!6826 lt!129108) #b00000000000000000000000000000000) (bvslt (index!6826 lt!129108) (size!6274 (_keys!6909 thiss!1504))))))

(declare-fun res!125738 () Bool)

(assert (=> b!257110 (= res!125738 (= (select (arr!5926 (_keys!6909 thiss!1504)) (index!6826 lt!129108)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257110 (=> (not res!125738) (not e!166661))))

(declare-fun b!257111 () Bool)

(declare-fun res!125740 () Bool)

(assert (=> b!257111 (=> (not res!125740) (not e!166662))))

(declare-fun call!24385 () Bool)

(assert (=> b!257111 (= res!125740 call!24385)))

(assert (=> b!257111 (= e!166660 e!166662)))

(declare-fun bm!24381 () Bool)

(assert (=> bm!24381 (= call!24385 (inRange!0 (ite c!43493 (index!6826 lt!129108) (index!6829 lt!129108)) (mask!11027 thiss!1504)))))

(declare-fun bm!24382 () Bool)

(assert (=> bm!24382 (= call!24384 (arrayContainsKey!0 (_keys!6909 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257112 () Bool)

(assert (=> b!257112 (= e!166659 e!166660)))

(declare-fun c!43494 () Bool)

(assert (=> b!257112 (= c!43494 ((_ is MissingVacant!1164) lt!129108))))

(declare-fun b!257113 () Bool)

(assert (=> b!257113 (= e!166659 e!166661)))

(declare-fun res!125739 () Bool)

(assert (=> b!257113 (= res!125739 call!24385)))

(assert (=> b!257113 (=> (not res!125739) (not e!166661))))

(assert (= (and d!61625 c!43493) b!257113))

(assert (= (and d!61625 (not c!43493)) b!257112))

(assert (= (and b!257113 res!125739) b!257110))

(assert (= (and b!257110 res!125738) b!257107))

(assert (= (and b!257112 c!43494) b!257111))

(assert (= (and b!257112 (not c!43494)) b!257108))

(assert (= (and b!257111 res!125740) b!257106))

(assert (= (and b!257106 res!125741) b!257109))

(assert (= (or b!257113 b!257111) bm!24381))

(assert (= (or b!257107 b!257109) bm!24382))

(assert (=> bm!24382 m!271807))

(declare-fun m!271989 () Bool)

(assert (=> b!257106 m!271989))

(declare-fun m!271991 () Bool)

(assert (=> bm!24381 m!271991))

(assert (=> d!61625 m!271813))

(declare-fun m!271993 () Bool)

(assert (=> d!61625 m!271993))

(declare-fun m!271995 () Bool)

(assert (=> d!61625 m!271995))

(declare-fun m!271997 () Bool)

(assert (=> b!257110 m!271997))

(assert (=> b!256960 d!61625))

(declare-fun d!61627 () Bool)

(declare-fun e!166665 () Bool)

(assert (=> d!61627 e!166665))

(declare-fun res!125747 () Bool)

(assert (=> d!61627 (=> (not res!125747) (not e!166665))))

(declare-fun lt!129115 () SeekEntryResult!1164)

(assert (=> d!61627 (= res!125747 ((_ is Found!1164) lt!129115))))

(assert (=> d!61627 (= lt!129115 (seekEntryOrOpen!0 key!932 (_keys!6909 thiss!1504) (mask!11027 thiss!1504)))))

(declare-fun lt!129114 () Unit!7946)

(declare-fun choose!1244 (array!12515 array!12513 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) Int) Unit!7946)

(assert (=> d!61627 (= lt!129114 (choose!1244 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)))))

(assert (=> d!61627 (validMask!0 (mask!11027 thiss!1504))))

(assert (=> d!61627 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!429 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)) lt!129114)))

(declare-fun b!257118 () Bool)

(declare-fun res!125746 () Bool)

(assert (=> b!257118 (=> (not res!125746) (not e!166665))))

(assert (=> b!257118 (= res!125746 (inRange!0 (index!6827 lt!129115) (mask!11027 thiss!1504)))))

(declare-fun b!257119 () Bool)

(assert (=> b!257119 (= e!166665 (= (select (arr!5926 (_keys!6909 thiss!1504)) (index!6827 lt!129115)) key!932))))

(assert (=> b!257119 (and (bvsge (index!6827 lt!129115) #b00000000000000000000000000000000) (bvslt (index!6827 lt!129115) (size!6274 (_keys!6909 thiss!1504))))))

(assert (= (and d!61627 res!125747) b!257118))

(assert (= (and b!257118 res!125746) b!257119))

(assert (=> d!61627 m!271813))

(declare-fun m!271999 () Bool)

(assert (=> d!61627 m!271999))

(assert (=> d!61627 m!271995))

(declare-fun m!272001 () Bool)

(assert (=> b!257118 m!272001))

(declare-fun m!272003 () Bool)

(assert (=> b!257119 m!272003))

(assert (=> b!256947 d!61627))

(declare-fun b!257132 () Bool)

(declare-fun c!43501 () Bool)

(declare-fun lt!129123 () (_ BitVec 64))

(assert (=> b!257132 (= c!43501 (= lt!129123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166673 () SeekEntryResult!1164)

(declare-fun e!166674 () SeekEntryResult!1164)

(assert (=> b!257132 (= e!166673 e!166674)))

(declare-fun b!257133 () Bool)

(declare-fun lt!129124 () SeekEntryResult!1164)

(assert (=> b!257133 (= e!166673 (Found!1164 (index!6828 lt!129124)))))

(declare-fun d!61629 () Bool)

(declare-fun lt!129122 () SeekEntryResult!1164)

(assert (=> d!61629 (and (or ((_ is Undefined!1164) lt!129122) (not ((_ is Found!1164) lt!129122)) (and (bvsge (index!6827 lt!129122) #b00000000000000000000000000000000) (bvslt (index!6827 lt!129122) (size!6274 (_keys!6909 thiss!1504))))) (or ((_ is Undefined!1164) lt!129122) ((_ is Found!1164) lt!129122) (not ((_ is MissingZero!1164) lt!129122)) (and (bvsge (index!6826 lt!129122) #b00000000000000000000000000000000) (bvslt (index!6826 lt!129122) (size!6274 (_keys!6909 thiss!1504))))) (or ((_ is Undefined!1164) lt!129122) ((_ is Found!1164) lt!129122) ((_ is MissingZero!1164) lt!129122) (not ((_ is MissingVacant!1164) lt!129122)) (and (bvsge (index!6829 lt!129122) #b00000000000000000000000000000000) (bvslt (index!6829 lt!129122) (size!6274 (_keys!6909 thiss!1504))))) (or ((_ is Undefined!1164) lt!129122) (ite ((_ is Found!1164) lt!129122) (= (select (arr!5926 (_keys!6909 thiss!1504)) (index!6827 lt!129122)) key!932) (ite ((_ is MissingZero!1164) lt!129122) (= (select (arr!5926 (_keys!6909 thiss!1504)) (index!6826 lt!129122)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1164) lt!129122) (= (select (arr!5926 (_keys!6909 thiss!1504)) (index!6829 lt!129122)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!166672 () SeekEntryResult!1164)

(assert (=> d!61629 (= lt!129122 e!166672)))

(declare-fun c!43502 () Bool)

(assert (=> d!61629 (= c!43502 (and ((_ is Intermediate!1164) lt!129124) (undefined!1976 lt!129124)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12515 (_ BitVec 32)) SeekEntryResult!1164)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61629 (= lt!129124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11027 thiss!1504)) key!932 (_keys!6909 thiss!1504) (mask!11027 thiss!1504)))))

(assert (=> d!61629 (validMask!0 (mask!11027 thiss!1504))))

(assert (=> d!61629 (= (seekEntryOrOpen!0 key!932 (_keys!6909 thiss!1504) (mask!11027 thiss!1504)) lt!129122)))

(declare-fun b!257134 () Bool)

(assert (=> b!257134 (= e!166672 e!166673)))

(assert (=> b!257134 (= lt!129123 (select (arr!5926 (_keys!6909 thiss!1504)) (index!6828 lt!129124)))))

(declare-fun c!43503 () Bool)

(assert (=> b!257134 (= c!43503 (= lt!129123 key!932))))

(declare-fun b!257135 () Bool)

(assert (=> b!257135 (= e!166672 Undefined!1164)))

(declare-fun b!257136 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12515 (_ BitVec 32)) SeekEntryResult!1164)

(assert (=> b!257136 (= e!166674 (seekKeyOrZeroReturnVacant!0 (x!24995 lt!129124) (index!6828 lt!129124) (index!6828 lt!129124) key!932 (_keys!6909 thiss!1504) (mask!11027 thiss!1504)))))

(declare-fun b!257137 () Bool)

(assert (=> b!257137 (= e!166674 (MissingZero!1164 (index!6828 lt!129124)))))

(assert (= (and d!61629 c!43502) b!257135))

(assert (= (and d!61629 (not c!43502)) b!257134))

(assert (= (and b!257134 c!43503) b!257133))

(assert (= (and b!257134 (not c!43503)) b!257132))

(assert (= (and b!257132 c!43501) b!257137))

(assert (= (and b!257132 (not c!43501)) b!257136))

(assert (=> d!61629 m!271995))

(declare-fun m!272005 () Bool)

(assert (=> d!61629 m!272005))

(declare-fun m!272007 () Bool)

(assert (=> d!61629 m!272007))

(declare-fun m!272009 () Bool)

(assert (=> d!61629 m!272009))

(declare-fun m!272011 () Bool)

(assert (=> d!61629 m!272011))

(assert (=> d!61629 m!272009))

(declare-fun m!272013 () Bool)

(assert (=> d!61629 m!272013))

(declare-fun m!272015 () Bool)

(assert (=> b!257134 m!272015))

(declare-fun m!272017 () Bool)

(assert (=> b!257136 m!272017))

(assert (=> b!256959 d!61629))

(declare-fun d!61631 () Bool)

(assert (=> d!61631 (contains!1848 (getCurrentListMap!1411 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)) key!932)))

(declare-fun lt!129127 () Unit!7946)

(declare-fun choose!1245 (array!12515 array!12513 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) (_ BitVec 32) Int) Unit!7946)

(assert (=> d!61631 (= lt!129127 (choose!1245 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(assert (=> d!61631 (validMask!0 (mask!11027 thiss!1504))))

(assert (=> d!61631 (= (lemmaArrayContainsKeyThenInListMap!240 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)) lt!129127)))

(declare-fun bs!9055 () Bool)

(assert (= bs!9055 d!61631))

(assert (=> bs!9055 m!271859))

(assert (=> bs!9055 m!271859))

(declare-fun m!272019 () Bool)

(assert (=> bs!9055 m!272019))

(declare-fun m!272021 () Bool)

(assert (=> bs!9055 m!272021))

(assert (=> bs!9055 m!271995))

(assert (=> b!256945 d!61631))

(declare-fun d!61633 () Bool)

(declare-fun res!125752 () Bool)

(declare-fun e!166683 () Bool)

(assert (=> d!61633 (=> res!125752 e!166683)))

(assert (=> d!61633 (= res!125752 (bvsge #b00000000000000000000000000000000 (size!6274 lt!129012)))))

(assert (=> d!61633 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129012 (mask!11027 thiss!1504)) e!166683)))

(declare-fun b!257146 () Bool)

(declare-fun e!166681 () Bool)

(assert (=> b!257146 (= e!166683 e!166681)))

(declare-fun c!43506 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!257146 (= c!43506 (validKeyInArray!0 (select (arr!5926 lt!129012) #b00000000000000000000000000000000)))))

(declare-fun b!257147 () Bool)

(declare-fun e!166682 () Bool)

(declare-fun call!24388 () Bool)

(assert (=> b!257147 (= e!166682 call!24388)))

(declare-fun bm!24385 () Bool)

(assert (=> bm!24385 (= call!24388 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129012 (mask!11027 thiss!1504)))))

(declare-fun b!257148 () Bool)

(assert (=> b!257148 (= e!166681 e!166682)))

(declare-fun lt!129134 () (_ BitVec 64))

(assert (=> b!257148 (= lt!129134 (select (arr!5926 lt!129012) #b00000000000000000000000000000000))))

(declare-fun lt!129136 () Unit!7946)

(assert (=> b!257148 (= lt!129136 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129012 lt!129134 #b00000000000000000000000000000000))))

(assert (=> b!257148 (arrayContainsKey!0 lt!129012 lt!129134 #b00000000000000000000000000000000)))

(declare-fun lt!129135 () Unit!7946)

(assert (=> b!257148 (= lt!129135 lt!129136)))

(declare-fun res!125753 () Bool)

(assert (=> b!257148 (= res!125753 (= (seekEntryOrOpen!0 (select (arr!5926 lt!129012) #b00000000000000000000000000000000) lt!129012 (mask!11027 thiss!1504)) (Found!1164 #b00000000000000000000000000000000)))))

(assert (=> b!257148 (=> (not res!125753) (not e!166682))))

(declare-fun b!257149 () Bool)

(assert (=> b!257149 (= e!166681 call!24388)))

(assert (= (and d!61633 (not res!125752)) b!257146))

(assert (= (and b!257146 c!43506) b!257148))

(assert (= (and b!257146 (not c!43506)) b!257149))

(assert (= (and b!257148 res!125753) b!257147))

(assert (= (or b!257147 b!257149) bm!24385))

(declare-fun m!272023 () Bool)

(assert (=> b!257146 m!272023))

(assert (=> b!257146 m!272023))

(declare-fun m!272025 () Bool)

(assert (=> b!257146 m!272025))

(declare-fun m!272027 () Bool)

(assert (=> bm!24385 m!272027))

(assert (=> b!257148 m!272023))

(declare-fun m!272029 () Bool)

(assert (=> b!257148 m!272029))

(declare-fun m!272031 () Bool)

(assert (=> b!257148 m!272031))

(assert (=> b!257148 m!272023))

(declare-fun m!272033 () Bool)

(assert (=> b!257148 m!272033))

(assert (=> b!256946 d!61633))

(declare-fun d!61635 () Bool)

(declare-fun e!166689 () Bool)

(assert (=> d!61635 e!166689))

(declare-fun res!125764 () Bool)

(assert (=> d!61635 (=> (not res!125764) (not e!166689))))

(assert (=> d!61635 (= res!125764 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 (_keys!6909 thiss!1504)))))))

(declare-fun lt!129139 () Unit!7946)

(declare-fun choose!1 (array!12515 (_ BitVec 32) (_ BitVec 64)) Unit!7946)

(assert (=> d!61635 (= lt!129139 (choose!1 (_keys!6909 thiss!1504) index!297 key!932))))

(declare-fun e!166688 () Bool)

(assert (=> d!61635 e!166688))

(declare-fun res!125762 () Bool)

(assert (=> d!61635 (=> (not res!125762) (not e!166688))))

(assert (=> d!61635 (= res!125762 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 (_keys!6909 thiss!1504)))))))

(assert (=> d!61635 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6909 thiss!1504) index!297 key!932) lt!129139)))

(declare-fun b!257158 () Bool)

(declare-fun res!125763 () Bool)

(assert (=> b!257158 (=> (not res!125763) (not e!166688))))

(assert (=> b!257158 (= res!125763 (not (validKeyInArray!0 (select (arr!5926 (_keys!6909 thiss!1504)) index!297))))))

(declare-fun b!257159 () Bool)

(declare-fun res!125765 () Bool)

(assert (=> b!257159 (=> (not res!125765) (not e!166688))))

(assert (=> b!257159 (= res!125765 (validKeyInArray!0 key!932))))

(declare-fun b!257160 () Bool)

(assert (=> b!257160 (= e!166688 (bvslt (size!6274 (_keys!6909 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!257161 () Bool)

(assert (=> b!257161 (= e!166689 (= (arrayCountValidKeys!0 (array!12516 (store (arr!5926 (_keys!6909 thiss!1504)) index!297 key!932) (size!6274 (_keys!6909 thiss!1504))) #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6909 thiss!1504) #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!61635 res!125762) b!257158))

(assert (= (and b!257158 res!125763) b!257159))

(assert (= (and b!257159 res!125765) b!257160))

(assert (= (and d!61635 res!125764) b!257161))

(declare-fun m!272035 () Bool)

(assert (=> d!61635 m!272035))

(declare-fun m!272037 () Bool)

(assert (=> b!257158 m!272037))

(assert (=> b!257158 m!272037))

(declare-fun m!272039 () Bool)

(assert (=> b!257158 m!272039))

(declare-fun m!272041 () Bool)

(assert (=> b!257159 m!272041))

(assert (=> b!257161 m!271835))

(declare-fun m!272043 () Bool)

(assert (=> b!257161 m!272043))

(assert (=> b!257161 m!271837))

(assert (=> b!256946 d!61635))

(declare-fun b!257204 () Bool)

(declare-fun e!166719 () Bool)

(declare-fun e!166721 () Bool)

(assert (=> b!257204 (= e!166719 e!166721)))

(declare-fun res!125785 () Bool)

(declare-fun call!24407 () Bool)

(assert (=> b!257204 (= res!125785 call!24407)))

(assert (=> b!257204 (=> (not res!125785) (not e!166721))))

(declare-fun b!257205 () Bool)

(declare-fun lt!129186 () ListLongMap!3773)

(declare-fun apply!253 (ListLongMap!3773 (_ BitVec 64)) V!8433)

(assert (=> b!257205 (= e!166721 (= (apply!253 lt!129186 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4585 thiss!1504)))))

(declare-fun call!24404 () ListLongMap!3773)

(declare-fun call!24408 () ListLongMap!3773)

(declare-fun bm!24400 () Bool)

(declare-fun c!43521 () Bool)

(declare-fun call!24403 () ListLongMap!3773)

(declare-fun c!43519 () Bool)

(declare-fun call!24405 () ListLongMap!3773)

(assert (=> bm!24400 (= call!24403 (+!692 (ite c!43519 call!24408 (ite c!43521 call!24404 call!24405)) (ite (or c!43519 c!43521) (tuple2!4871 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4585 thiss!1504)) (tuple2!4871 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4585 thiss!1504)))))))

(declare-fun b!257206 () Bool)

(declare-fun e!166727 () Bool)

(assert (=> b!257206 (= e!166727 (validKeyInArray!0 (select (arr!5926 lt!129012) #b00000000000000000000000000000000)))))

(declare-fun b!257207 () Bool)

(assert (=> b!257207 (= e!166719 (not call!24407))))

(declare-fun bm!24401 () Bool)

(assert (=> bm!24401 (= call!24407 (contains!1848 lt!129186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24402 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!569 (array!12515 array!12513 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 32) Int) ListLongMap!3773)

(assert (=> bm!24402 (= call!24408 (getCurrentListMapNoExtraKeys!569 lt!129012 (array!12514 (store (arr!5925 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6273 (_values!4727 thiss!1504))) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun b!257208 () Bool)

(declare-fun e!166725 () Unit!7946)

(declare-fun Unit!7958 () Unit!7946)

(assert (=> b!257208 (= e!166725 Unit!7958)))

(declare-fun b!257209 () Bool)

(declare-fun e!166716 () ListLongMap!3773)

(declare-fun call!24409 () ListLongMap!3773)

(assert (=> b!257209 (= e!166716 call!24409)))

(declare-fun bm!24403 () Bool)

(assert (=> bm!24403 (= call!24409 call!24403)))

(declare-fun b!257210 () Bool)

(declare-fun e!166728 () Bool)

(declare-fun e!166726 () Bool)

(assert (=> b!257210 (= e!166728 e!166726)))

(declare-fun c!43524 () Bool)

(assert (=> b!257210 (= c!43524 (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24404 () Bool)

(assert (=> bm!24404 (= call!24404 call!24408)))

(declare-fun bm!24405 () Bool)

(declare-fun call!24406 () Bool)

(assert (=> bm!24405 (= call!24406 (contains!1848 lt!129186 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24406 () Bool)

(assert (=> bm!24406 (= call!24405 call!24404)))

(declare-fun b!257211 () Bool)

(declare-fun e!166722 () ListLongMap!3773)

(assert (=> b!257211 (= e!166722 call!24405)))

(declare-fun b!257212 () Bool)

(declare-fun e!166720 () Bool)

(assert (=> b!257212 (= e!166720 (= (apply!253 lt!129186 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4585 thiss!1504)))))

(declare-fun b!257213 () Bool)

(declare-fun e!166718 () Bool)

(declare-fun get!3044 (ValueCell!2951 V!8433) V!8433)

(declare-fun dynLambda!587 (Int (_ BitVec 64)) V!8433)

(assert (=> b!257213 (= e!166718 (= (apply!253 lt!129186 (select (arr!5926 lt!129012) #b00000000000000000000000000000000)) (get!3044 (select (arr!5925 (array!12514 (store (arr!5925 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6273 (_values!4727 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!587 (defaultEntry!4744 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6273 (array!12514 (store (arr!5925 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6273 (_values!4727 thiss!1504))))))))

(assert (=> b!257213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 lt!129012)))))

(declare-fun b!257214 () Bool)

(declare-fun e!166724 () Bool)

(assert (=> b!257214 (= e!166724 (validKeyInArray!0 (select (arr!5926 lt!129012) #b00000000000000000000000000000000)))))

(declare-fun b!257215 () Bool)

(declare-fun e!166723 () Bool)

(assert (=> b!257215 (= e!166723 e!166718)))

(declare-fun res!125792 () Bool)

(assert (=> b!257215 (=> (not res!125792) (not e!166718))))

(assert (=> b!257215 (= res!125792 (contains!1848 lt!129186 (select (arr!5926 lt!129012) #b00000000000000000000000000000000)))))

(assert (=> b!257215 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 lt!129012)))))

(declare-fun b!257216 () Bool)

(assert (=> b!257216 (= e!166726 e!166720)))

(declare-fun res!125784 () Bool)

(assert (=> b!257216 (= res!125784 call!24406)))

(assert (=> b!257216 (=> (not res!125784) (not e!166720))))

(declare-fun b!257217 () Bool)

(declare-fun e!166717 () ListLongMap!3773)

(assert (=> b!257217 (= e!166717 e!166716)))

(assert (=> b!257217 (= c!43521 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257218 () Bool)

(declare-fun c!43523 () Bool)

(assert (=> b!257218 (= c!43523 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!257218 (= e!166716 e!166722)))

(declare-fun d!61637 () Bool)

(assert (=> d!61637 e!166728))

(declare-fun res!125787 () Bool)

(assert (=> d!61637 (=> (not res!125787) (not e!166728))))

(assert (=> d!61637 (= res!125787 (or (bvsge #b00000000000000000000000000000000 (size!6274 lt!129012)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 lt!129012)))))))

(declare-fun lt!129198 () ListLongMap!3773)

(assert (=> d!61637 (= lt!129186 lt!129198)))

(declare-fun lt!129187 () Unit!7946)

(assert (=> d!61637 (= lt!129187 e!166725)))

(declare-fun c!43522 () Bool)

(assert (=> d!61637 (= c!43522 e!166727)))

(declare-fun res!125786 () Bool)

(assert (=> d!61637 (=> (not res!125786) (not e!166727))))

(assert (=> d!61637 (= res!125786 (bvslt #b00000000000000000000000000000000 (size!6274 lt!129012)))))

(assert (=> d!61637 (= lt!129198 e!166717)))

(assert (=> d!61637 (= c!43519 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61637 (validMask!0 (mask!11027 thiss!1504))))

(assert (=> d!61637 (= (getCurrentListMap!1411 lt!129012 (array!12514 (store (arr!5925 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6273 (_values!4727 thiss!1504))) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)) lt!129186)))

(declare-fun b!257219 () Bool)

(assert (=> b!257219 (= e!166722 call!24409)))

(declare-fun b!257220 () Bool)

(assert (=> b!257220 (= e!166717 (+!692 call!24403 (tuple2!4871 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4585 thiss!1504))))))

(declare-fun b!257221 () Bool)

(declare-fun res!125788 () Bool)

(assert (=> b!257221 (=> (not res!125788) (not e!166728))))

(assert (=> b!257221 (= res!125788 e!166723)))

(declare-fun res!125789 () Bool)

(assert (=> b!257221 (=> res!125789 e!166723)))

(assert (=> b!257221 (= res!125789 (not e!166724))))

(declare-fun res!125791 () Bool)

(assert (=> b!257221 (=> (not res!125791) (not e!166724))))

(assert (=> b!257221 (= res!125791 (bvslt #b00000000000000000000000000000000 (size!6274 lt!129012)))))

(declare-fun b!257222 () Bool)

(declare-fun res!125790 () Bool)

(assert (=> b!257222 (=> (not res!125790) (not e!166728))))

(assert (=> b!257222 (= res!125790 e!166719)))

(declare-fun c!43520 () Bool)

(assert (=> b!257222 (= c!43520 (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!257223 () Bool)

(assert (=> b!257223 (= e!166726 (not call!24406))))

(declare-fun b!257224 () Bool)

(declare-fun lt!129188 () Unit!7946)

(assert (=> b!257224 (= e!166725 lt!129188)))

(declare-fun lt!129196 () ListLongMap!3773)

(assert (=> b!257224 (= lt!129196 (getCurrentListMapNoExtraKeys!569 lt!129012 (array!12514 (store (arr!5925 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6273 (_values!4727 thiss!1504))) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129201 () (_ BitVec 64))

(assert (=> b!257224 (= lt!129201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129200 () (_ BitVec 64))

(assert (=> b!257224 (= lt!129200 (select (arr!5926 lt!129012) #b00000000000000000000000000000000))))

(declare-fun lt!129197 () Unit!7946)

(declare-fun addStillContains!229 (ListLongMap!3773 (_ BitVec 64) V!8433 (_ BitVec 64)) Unit!7946)

(assert (=> b!257224 (= lt!129197 (addStillContains!229 lt!129196 lt!129201 (zeroValue!4585 thiss!1504) lt!129200))))

(assert (=> b!257224 (contains!1848 (+!692 lt!129196 (tuple2!4871 lt!129201 (zeroValue!4585 thiss!1504))) lt!129200)))

(declare-fun lt!129199 () Unit!7946)

(assert (=> b!257224 (= lt!129199 lt!129197)))

(declare-fun lt!129185 () ListLongMap!3773)

(assert (=> b!257224 (= lt!129185 (getCurrentListMapNoExtraKeys!569 lt!129012 (array!12514 (store (arr!5925 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6273 (_values!4727 thiss!1504))) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129204 () (_ BitVec 64))

(assert (=> b!257224 (= lt!129204 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129190 () (_ BitVec 64))

(assert (=> b!257224 (= lt!129190 (select (arr!5926 lt!129012) #b00000000000000000000000000000000))))

(declare-fun lt!129195 () Unit!7946)

(declare-fun addApplyDifferent!229 (ListLongMap!3773 (_ BitVec 64) V!8433 (_ BitVec 64)) Unit!7946)

(assert (=> b!257224 (= lt!129195 (addApplyDifferent!229 lt!129185 lt!129204 (minValue!4585 thiss!1504) lt!129190))))

(assert (=> b!257224 (= (apply!253 (+!692 lt!129185 (tuple2!4871 lt!129204 (minValue!4585 thiss!1504))) lt!129190) (apply!253 lt!129185 lt!129190))))

(declare-fun lt!129189 () Unit!7946)

(assert (=> b!257224 (= lt!129189 lt!129195)))

(declare-fun lt!129184 () ListLongMap!3773)

(assert (=> b!257224 (= lt!129184 (getCurrentListMapNoExtraKeys!569 lt!129012 (array!12514 (store (arr!5925 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6273 (_values!4727 thiss!1504))) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129194 () (_ BitVec 64))

(assert (=> b!257224 (= lt!129194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129203 () (_ BitVec 64))

(assert (=> b!257224 (= lt!129203 (select (arr!5926 lt!129012) #b00000000000000000000000000000000))))

(declare-fun lt!129191 () Unit!7946)

(assert (=> b!257224 (= lt!129191 (addApplyDifferent!229 lt!129184 lt!129194 (zeroValue!4585 thiss!1504) lt!129203))))

(assert (=> b!257224 (= (apply!253 (+!692 lt!129184 (tuple2!4871 lt!129194 (zeroValue!4585 thiss!1504))) lt!129203) (apply!253 lt!129184 lt!129203))))

(declare-fun lt!129193 () Unit!7946)

(assert (=> b!257224 (= lt!129193 lt!129191)))

(declare-fun lt!129205 () ListLongMap!3773)

(assert (=> b!257224 (= lt!129205 (getCurrentListMapNoExtraKeys!569 lt!129012 (array!12514 (store (arr!5925 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6273 (_values!4727 thiss!1504))) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129192 () (_ BitVec 64))

(assert (=> b!257224 (= lt!129192 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129202 () (_ BitVec 64))

(assert (=> b!257224 (= lt!129202 (select (arr!5926 lt!129012) #b00000000000000000000000000000000))))

(assert (=> b!257224 (= lt!129188 (addApplyDifferent!229 lt!129205 lt!129192 (minValue!4585 thiss!1504) lt!129202))))

(assert (=> b!257224 (= (apply!253 (+!692 lt!129205 (tuple2!4871 lt!129192 (minValue!4585 thiss!1504))) lt!129202) (apply!253 lt!129205 lt!129202))))

(assert (= (and d!61637 c!43519) b!257220))

(assert (= (and d!61637 (not c!43519)) b!257217))

(assert (= (and b!257217 c!43521) b!257209))

(assert (= (and b!257217 (not c!43521)) b!257218))

(assert (= (and b!257218 c!43523) b!257219))

(assert (= (and b!257218 (not c!43523)) b!257211))

(assert (= (or b!257219 b!257211) bm!24406))

(assert (= (or b!257209 bm!24406) bm!24404))

(assert (= (or b!257209 b!257219) bm!24403))

(assert (= (or b!257220 bm!24404) bm!24402))

(assert (= (or b!257220 bm!24403) bm!24400))

(assert (= (and d!61637 res!125786) b!257206))

(assert (= (and d!61637 c!43522) b!257224))

(assert (= (and d!61637 (not c!43522)) b!257208))

(assert (= (and d!61637 res!125787) b!257221))

(assert (= (and b!257221 res!125791) b!257214))

(assert (= (and b!257221 (not res!125789)) b!257215))

(assert (= (and b!257215 res!125792) b!257213))

(assert (= (and b!257221 res!125788) b!257222))

(assert (= (and b!257222 c!43520) b!257204))

(assert (= (and b!257222 (not c!43520)) b!257207))

(assert (= (and b!257204 res!125785) b!257205))

(assert (= (or b!257204 b!257207) bm!24401))

(assert (= (and b!257222 res!125790) b!257210))

(assert (= (and b!257210 c!43524) b!257216))

(assert (= (and b!257210 (not c!43524)) b!257223))

(assert (= (and b!257216 res!125784) b!257212))

(assert (= (or b!257216 b!257223) bm!24405))

(declare-fun b_lambda!8161 () Bool)

(assert (=> (not b_lambda!8161) (not b!257213)))

(declare-fun t!8825 () Bool)

(declare-fun tb!3011 () Bool)

(assert (=> (and b!256963 (= (defaultEntry!4744 thiss!1504) (defaultEntry!4744 thiss!1504)) t!8825) tb!3011))

(declare-fun result!5371 () Bool)

(assert (=> tb!3011 (= result!5371 tp_is_empty!6589)))

(assert (=> b!257213 t!8825))

(declare-fun b_and!13773 () Bool)

(assert (= b_and!13767 (and (=> t!8825 result!5371) b_and!13773)))

(declare-fun m!272045 () Bool)

(assert (=> b!257224 m!272045))

(declare-fun m!272047 () Bool)

(assert (=> b!257224 m!272047))

(declare-fun m!272049 () Bool)

(assert (=> b!257224 m!272049))

(declare-fun m!272051 () Bool)

(assert (=> b!257224 m!272051))

(declare-fun m!272053 () Bool)

(assert (=> b!257224 m!272053))

(assert (=> b!257224 m!272047))

(declare-fun m!272055 () Bool)

(assert (=> b!257224 m!272055))

(declare-fun m!272057 () Bool)

(assert (=> b!257224 m!272057))

(assert (=> b!257224 m!272023))

(declare-fun m!272059 () Bool)

(assert (=> b!257224 m!272059))

(declare-fun m!272061 () Bool)

(assert (=> b!257224 m!272061))

(declare-fun m!272063 () Bool)

(assert (=> b!257224 m!272063))

(assert (=> b!257224 m!272061))

(declare-fun m!272065 () Bool)

(assert (=> b!257224 m!272065))

(declare-fun m!272067 () Bool)

(assert (=> b!257224 m!272067))

(declare-fun m!272069 () Bool)

(assert (=> b!257224 m!272069))

(assert (=> b!257224 m!272067))

(assert (=> b!257224 m!272049))

(declare-fun m!272071 () Bool)

(assert (=> b!257224 m!272071))

(declare-fun m!272073 () Bool)

(assert (=> b!257224 m!272073))

(declare-fun m!272075 () Bool)

(assert (=> b!257224 m!272075))

(assert (=> b!257213 m!272023))

(declare-fun m!272077 () Bool)

(assert (=> b!257213 m!272077))

(declare-fun m!272079 () Bool)

(assert (=> b!257213 m!272079))

(declare-fun m!272081 () Bool)

(assert (=> b!257213 m!272081))

(assert (=> b!257213 m!272023))

(assert (=> b!257213 m!272081))

(assert (=> b!257213 m!272079))

(declare-fun m!272083 () Bool)

(assert (=> b!257213 m!272083))

(assert (=> b!257215 m!272023))

(assert (=> b!257215 m!272023))

(declare-fun m!272085 () Bool)

(assert (=> b!257215 m!272085))

(declare-fun m!272087 () Bool)

(assert (=> bm!24405 m!272087))

(assert (=> b!257206 m!272023))

(assert (=> b!257206 m!272023))

(assert (=> b!257206 m!272025))

(declare-fun m!272089 () Bool)

(assert (=> b!257205 m!272089))

(assert (=> bm!24402 m!272075))

(declare-fun m!272091 () Bool)

(assert (=> bm!24400 m!272091))

(declare-fun m!272093 () Bool)

(assert (=> b!257212 m!272093))

(declare-fun m!272095 () Bool)

(assert (=> bm!24401 m!272095))

(assert (=> d!61637 m!271995))

(assert (=> b!257214 m!272023))

(assert (=> b!257214 m!272023))

(assert (=> b!257214 m!272025))

(declare-fun m!272097 () Bool)

(assert (=> b!257220 m!272097))

(assert (=> b!256946 d!61637))

(declare-fun b!257235 () Bool)

(declare-fun e!166733 () (_ BitVec 32))

(declare-fun call!24412 () (_ BitVec 32))

(assert (=> b!257235 (= e!166733 (bvadd #b00000000000000000000000000000001 call!24412))))

(declare-fun bm!24409 () Bool)

(assert (=> bm!24409 (= call!24412 (arrayCountValidKeys!0 (_keys!6909 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6274 (_keys!6909 thiss!1504))))))

(declare-fun b!257237 () Bool)

(declare-fun e!166734 () (_ BitVec 32))

(assert (=> b!257237 (= e!166734 e!166733)))

(declare-fun c!43530 () Bool)

(assert (=> b!257237 (= c!43530 (validKeyInArray!0 (select (arr!5926 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257238 () Bool)

(assert (=> b!257238 (= e!166733 call!24412)))

(declare-fun d!61639 () Bool)

(declare-fun lt!129208 () (_ BitVec 32))

(assert (=> d!61639 (and (bvsge lt!129208 #b00000000000000000000000000000000) (bvsle lt!129208 (bvsub (size!6274 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61639 (= lt!129208 e!166734)))

(declare-fun c!43529 () Bool)

(assert (=> d!61639 (= c!43529 (bvsge #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))))))

(assert (=> d!61639 (and (bvsle #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6274 (_keys!6909 thiss!1504)) (size!6274 (_keys!6909 thiss!1504))))))

(assert (=> d!61639 (= (arrayCountValidKeys!0 (_keys!6909 thiss!1504) #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))) lt!129208)))

(declare-fun b!257236 () Bool)

(assert (=> b!257236 (= e!166734 #b00000000000000000000000000000000)))

(assert (= (and d!61639 c!43529) b!257236))

(assert (= (and d!61639 (not c!43529)) b!257237))

(assert (= (and b!257237 c!43530) b!257235))

(assert (= (and b!257237 (not c!43530)) b!257238))

(assert (= (or b!257235 b!257238) bm!24409))

(declare-fun m!272099 () Bool)

(assert (=> bm!24409 m!272099))

(assert (=> b!257237 m!271985))

(assert (=> b!257237 m!271985))

(declare-fun m!272101 () Bool)

(assert (=> b!257237 m!272101))

(assert (=> b!256946 d!61639))

(declare-fun d!61641 () Bool)

(declare-fun e!166737 () Bool)

(assert (=> d!61641 e!166737))

(declare-fun res!125795 () Bool)

(assert (=> d!61641 (=> (not res!125795) (not e!166737))))

(assert (=> d!61641 (= res!125795 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 (_keys!6909 thiss!1504))) (bvslt index!297 (size!6273 (_values!4727 thiss!1504)))))))

(declare-fun lt!129211 () Unit!7946)

(declare-fun choose!1246 (array!12515 array!12513 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 32) (_ BitVec 64) V!8433 Int) Unit!7946)

(assert (=> d!61641 (= lt!129211 (choose!1246 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) index!297 key!932 v!346 (defaultEntry!4744 thiss!1504)))))

(assert (=> d!61641 (validMask!0 (mask!11027 thiss!1504))))

(assert (=> d!61641 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!103 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) index!297 key!932 v!346 (defaultEntry!4744 thiss!1504)) lt!129211)))

(declare-fun b!257241 () Bool)

(assert (=> b!257241 (= e!166737 (= (+!692 (getCurrentListMap!1411 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)) (tuple2!4871 key!932 v!346)) (getCurrentListMap!1411 (array!12516 (store (arr!5926 (_keys!6909 thiss!1504)) index!297 key!932) (size!6274 (_keys!6909 thiss!1504))) (array!12514 (store (arr!5925 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6273 (_values!4727 thiss!1504))) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504))))))

(assert (= (and d!61641 res!125795) b!257241))

(declare-fun m!272103 () Bool)

(assert (=> d!61641 m!272103))

(assert (=> d!61641 m!271995))

(assert (=> b!257241 m!271819))

(assert (=> b!257241 m!271859))

(assert (=> b!257241 m!271859))

(declare-fun m!272105 () Bool)

(assert (=> b!257241 m!272105))

(declare-fun m!272107 () Bool)

(assert (=> b!257241 m!272107))

(assert (=> b!257241 m!271835))

(assert (=> b!256946 d!61641))

(declare-fun b!257242 () Bool)

(declare-fun e!166738 () (_ BitVec 32))

(declare-fun call!24413 () (_ BitVec 32))

(assert (=> b!257242 (= e!166738 (bvadd #b00000000000000000000000000000001 call!24413))))

(declare-fun bm!24410 () Bool)

(assert (=> bm!24410 (= call!24413 (arrayCountValidKeys!0 lt!129012 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!257244 () Bool)

(declare-fun e!166739 () (_ BitVec 32))

(assert (=> b!257244 (= e!166739 e!166738)))

(declare-fun c!43532 () Bool)

(assert (=> b!257244 (= c!43532 (validKeyInArray!0 (select (arr!5926 lt!129012) index!297)))))

(declare-fun b!257245 () Bool)

(assert (=> b!257245 (= e!166738 call!24413)))

(declare-fun d!61643 () Bool)

(declare-fun lt!129212 () (_ BitVec 32))

(assert (=> d!61643 (and (bvsge lt!129212 #b00000000000000000000000000000000) (bvsle lt!129212 (bvsub (size!6274 lt!129012) index!297)))))

(assert (=> d!61643 (= lt!129212 e!166739)))

(declare-fun c!43531 () Bool)

(assert (=> d!61643 (= c!43531 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!61643 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6274 lt!129012)))))

(assert (=> d!61643 (= (arrayCountValidKeys!0 lt!129012 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!129212)))

(declare-fun b!257243 () Bool)

(assert (=> b!257243 (= e!166739 #b00000000000000000000000000000000)))

(assert (= (and d!61643 c!43531) b!257243))

(assert (= (and d!61643 (not c!43531)) b!257244))

(assert (= (and b!257244 c!43532) b!257242))

(assert (= (and b!257244 (not c!43532)) b!257245))

(assert (= (or b!257242 b!257245) bm!24410))

(declare-fun m!272109 () Bool)

(assert (=> bm!24410 m!272109))

(declare-fun m!272111 () Bool)

(assert (=> b!257244 m!272111))

(assert (=> b!257244 m!272111))

(declare-fun m!272113 () Bool)

(assert (=> b!257244 m!272113))

(assert (=> b!256946 d!61643))

(declare-fun d!61645 () Bool)

(assert (=> d!61645 (= (arrayCountValidKeys!0 lt!129012 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!129215 () Unit!7946)

(declare-fun choose!2 (array!12515 (_ BitVec 32)) Unit!7946)

(assert (=> d!61645 (= lt!129215 (choose!2 lt!129012 index!297))))

(declare-fun e!166742 () Bool)

(assert (=> d!61645 e!166742))

(declare-fun res!125800 () Bool)

(assert (=> d!61645 (=> (not res!125800) (not e!166742))))

(assert (=> d!61645 (= res!125800 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 lt!129012))))))

(assert (=> d!61645 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129012 index!297) lt!129215)))

(declare-fun b!257250 () Bool)

(declare-fun res!125801 () Bool)

(assert (=> b!257250 (=> (not res!125801) (not e!166742))))

(assert (=> b!257250 (= res!125801 (validKeyInArray!0 (select (arr!5926 lt!129012) index!297)))))

(declare-fun b!257251 () Bool)

(assert (=> b!257251 (= e!166742 (bvslt (size!6274 lt!129012) #b01111111111111111111111111111111))))

(assert (= (and d!61645 res!125800) b!257250))

(assert (= (and b!257250 res!125801) b!257251))

(declare-fun m!272115 () Bool)

(assert (=> d!61645 m!272115))

(declare-fun m!272117 () Bool)

(assert (=> d!61645 m!272117))

(assert (=> b!257250 m!272111))

(assert (=> b!257250 m!272111))

(assert (=> b!257250 m!272113))

(assert (=> b!256946 d!61645))

(declare-fun b!257262 () Bool)

(declare-fun e!166754 () Bool)

(declare-fun e!166753 () Bool)

(assert (=> b!257262 (= e!166754 e!166753)))

(declare-fun res!125809 () Bool)

(assert (=> b!257262 (=> (not res!125809) (not e!166753))))

(declare-fun e!166751 () Bool)

(assert (=> b!257262 (= res!125809 (not e!166751))))

(declare-fun res!125810 () Bool)

(assert (=> b!257262 (=> (not res!125810) (not e!166751))))

(assert (=> b!257262 (= res!125810 (validKeyInArray!0 (select (arr!5926 lt!129012) #b00000000000000000000000000000000)))))

(declare-fun b!257263 () Bool)

(declare-fun contains!1850 (List!3772 (_ BitVec 64)) Bool)

(assert (=> b!257263 (= e!166751 (contains!1850 Nil!3769 (select (arr!5926 lt!129012) #b00000000000000000000000000000000)))))

(declare-fun d!61647 () Bool)

(declare-fun res!125808 () Bool)

(assert (=> d!61647 (=> res!125808 e!166754)))

(assert (=> d!61647 (= res!125808 (bvsge #b00000000000000000000000000000000 (size!6274 lt!129012)))))

(assert (=> d!61647 (= (arrayNoDuplicates!0 lt!129012 #b00000000000000000000000000000000 Nil!3769) e!166754)))

(declare-fun b!257264 () Bool)

(declare-fun e!166752 () Bool)

(declare-fun call!24416 () Bool)

(assert (=> b!257264 (= e!166752 call!24416)))

(declare-fun b!257265 () Bool)

(assert (=> b!257265 (= e!166753 e!166752)))

(declare-fun c!43535 () Bool)

(assert (=> b!257265 (= c!43535 (validKeyInArray!0 (select (arr!5926 lt!129012) #b00000000000000000000000000000000)))))

(declare-fun bm!24413 () Bool)

(assert (=> bm!24413 (= call!24416 (arrayNoDuplicates!0 lt!129012 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43535 (Cons!3768 (select (arr!5926 lt!129012) #b00000000000000000000000000000000) Nil!3769) Nil!3769)))))

(declare-fun b!257266 () Bool)

(assert (=> b!257266 (= e!166752 call!24416)))

(assert (= (and d!61647 (not res!125808)) b!257262))

(assert (= (and b!257262 res!125810) b!257263))

(assert (= (and b!257262 res!125809) b!257265))

(assert (= (and b!257265 c!43535) b!257264))

(assert (= (and b!257265 (not c!43535)) b!257266))

(assert (= (or b!257264 b!257266) bm!24413))

(assert (=> b!257262 m!272023))

(assert (=> b!257262 m!272023))

(assert (=> b!257262 m!272025))

(assert (=> b!257263 m!272023))

(assert (=> b!257263 m!272023))

(declare-fun m!272119 () Bool)

(assert (=> b!257263 m!272119))

(assert (=> b!257265 m!272023))

(assert (=> b!257265 m!272023))

(assert (=> b!257265 m!272025))

(assert (=> bm!24413 m!272023))

(declare-fun m!272121 () Bool)

(assert (=> bm!24413 m!272121))

(assert (=> b!256946 d!61647))

(declare-fun d!61649 () Bool)

(declare-fun e!166757 () Bool)

(assert (=> d!61649 e!166757))

(declare-fun res!125813 () Bool)

(assert (=> d!61649 (=> (not res!125813) (not e!166757))))

(assert (=> d!61649 (= res!125813 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 (_keys!6909 thiss!1504)))))))

(declare-fun lt!129218 () Unit!7946)

(declare-fun choose!41 (array!12515 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3772) Unit!7946)

(assert (=> d!61649 (= lt!129218 (choose!41 (_keys!6909 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3769))))

(assert (=> d!61649 (bvslt (size!6274 (_keys!6909 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61649 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6909 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3769) lt!129218)))

(declare-fun b!257269 () Bool)

(assert (=> b!257269 (= e!166757 (arrayNoDuplicates!0 (array!12516 (store (arr!5926 (_keys!6909 thiss!1504)) index!297 key!932) (size!6274 (_keys!6909 thiss!1504))) #b00000000000000000000000000000000 Nil!3769))))

(assert (= (and d!61649 res!125813) b!257269))

(declare-fun m!272123 () Bool)

(assert (=> d!61649 m!272123))

(assert (=> b!257269 m!271835))

(declare-fun m!272125 () Bool)

(assert (=> b!257269 m!272125))

(assert (=> b!256946 d!61649))

(declare-fun d!61651 () Bool)

(declare-fun res!125814 () Bool)

(declare-fun e!166758 () Bool)

(assert (=> d!61651 (=> res!125814 e!166758)))

(assert (=> d!61651 (= res!125814 (= (select (arr!5926 lt!129012) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61651 (= (arrayContainsKey!0 lt!129012 key!932 #b00000000000000000000000000000000) e!166758)))

(declare-fun b!257270 () Bool)

(declare-fun e!166759 () Bool)

(assert (=> b!257270 (= e!166758 e!166759)))

(declare-fun res!125815 () Bool)

(assert (=> b!257270 (=> (not res!125815) (not e!166759))))

(assert (=> b!257270 (= res!125815 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6274 lt!129012)))))

(declare-fun b!257271 () Bool)

(assert (=> b!257271 (= e!166759 (arrayContainsKey!0 lt!129012 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61651 (not res!125814)) b!257270))

(assert (= (and b!257270 res!125815) b!257271))

(assert (=> d!61651 m!272023))

(declare-fun m!272127 () Bool)

(assert (=> b!257271 m!272127))

(assert (=> b!256946 d!61651))

(assert (=> b!256946 d!61621))

(declare-fun d!61653 () Bool)

(declare-fun e!166762 () Bool)

(assert (=> d!61653 e!166762))

(declare-fun res!125818 () Bool)

(assert (=> d!61653 (=> (not res!125818) (not e!166762))))

(assert (=> d!61653 (= res!125818 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 (_keys!6909 thiss!1504)))))))

(declare-fun lt!129221 () Unit!7946)

(declare-fun choose!102 ((_ BitVec 64) array!12515 (_ BitVec 32) (_ BitVec 32)) Unit!7946)

(assert (=> d!61653 (= lt!129221 (choose!102 key!932 (_keys!6909 thiss!1504) index!297 (mask!11027 thiss!1504)))))

(assert (=> d!61653 (validMask!0 (mask!11027 thiss!1504))))

(assert (=> d!61653 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6909 thiss!1504) index!297 (mask!11027 thiss!1504)) lt!129221)))

(declare-fun b!257274 () Bool)

(assert (=> b!257274 (= e!166762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12516 (store (arr!5926 (_keys!6909 thiss!1504)) index!297 key!932) (size!6274 (_keys!6909 thiss!1504))) (mask!11027 thiss!1504)))))

(assert (= (and d!61653 res!125818) b!257274))

(declare-fun m!272129 () Bool)

(assert (=> d!61653 m!272129))

(assert (=> d!61653 m!271995))

(assert (=> b!257274 m!271835))

(declare-fun m!272131 () Bool)

(assert (=> b!257274 m!272131))

(assert (=> b!256946 d!61653))

(declare-fun d!61655 () Bool)

(assert (=> d!61655 (arrayContainsKey!0 lt!129012 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129224 () Unit!7946)

(declare-fun choose!13 (array!12515 (_ BitVec 64) (_ BitVec 32)) Unit!7946)

(assert (=> d!61655 (= lt!129224 (choose!13 lt!129012 key!932 index!297))))

(assert (=> d!61655 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61655 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129012 key!932 index!297) lt!129224)))

(declare-fun bs!9056 () Bool)

(assert (= bs!9056 d!61655))

(assert (=> bs!9056 m!271827))

(declare-fun m!272133 () Bool)

(assert (=> bs!9056 m!272133))

(assert (=> b!256946 d!61655))

(declare-fun d!61657 () Bool)

(declare-fun e!166765 () Bool)

(assert (=> d!61657 e!166765))

(declare-fun res!125823 () Bool)

(assert (=> d!61657 (=> (not res!125823) (not e!166765))))

(declare-fun lt!129233 () ListLongMap!3773)

(assert (=> d!61657 (= res!125823 (contains!1848 lt!129233 (_1!2446 (tuple2!4871 key!932 v!346))))))

(declare-fun lt!129235 () List!3771)

(assert (=> d!61657 (= lt!129233 (ListLongMap!3774 lt!129235))))

(declare-fun lt!129236 () Unit!7946)

(declare-fun lt!129234 () Unit!7946)

(assert (=> d!61657 (= lt!129236 lt!129234)))

(declare-datatypes ((Option!315 0))(
  ( (Some!314 (v!5430 V!8433)) (None!313) )
))
(declare-fun getValueByKey!309 (List!3771 (_ BitVec 64)) Option!315)

(assert (=> d!61657 (= (getValueByKey!309 lt!129235 (_1!2446 (tuple2!4871 key!932 v!346))) (Some!314 (_2!2446 (tuple2!4871 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!168 (List!3771 (_ BitVec 64) V!8433) Unit!7946)

(assert (=> d!61657 (= lt!129234 (lemmaContainsTupThenGetReturnValue!168 lt!129235 (_1!2446 (tuple2!4871 key!932 v!346)) (_2!2446 (tuple2!4871 key!932 v!346))))))

(declare-fun insertStrictlySorted!171 (List!3771 (_ BitVec 64) V!8433) List!3771)

(assert (=> d!61657 (= lt!129235 (insertStrictlySorted!171 (toList!1902 lt!129017) (_1!2446 (tuple2!4871 key!932 v!346)) (_2!2446 (tuple2!4871 key!932 v!346))))))

(assert (=> d!61657 (= (+!692 lt!129017 (tuple2!4871 key!932 v!346)) lt!129233)))

(declare-fun b!257279 () Bool)

(declare-fun res!125824 () Bool)

(assert (=> b!257279 (=> (not res!125824) (not e!166765))))

(assert (=> b!257279 (= res!125824 (= (getValueByKey!309 (toList!1902 lt!129233) (_1!2446 (tuple2!4871 key!932 v!346))) (Some!314 (_2!2446 (tuple2!4871 key!932 v!346)))))))

(declare-fun b!257280 () Bool)

(declare-fun contains!1851 (List!3771 tuple2!4870) Bool)

(assert (=> b!257280 (= e!166765 (contains!1851 (toList!1902 lt!129233) (tuple2!4871 key!932 v!346)))))

(assert (= (and d!61657 res!125823) b!257279))

(assert (= (and b!257279 res!125824) b!257280))

(declare-fun m!272135 () Bool)

(assert (=> d!61657 m!272135))

(declare-fun m!272137 () Bool)

(assert (=> d!61657 m!272137))

(declare-fun m!272139 () Bool)

(assert (=> d!61657 m!272139))

(declare-fun m!272141 () Bool)

(assert (=> d!61657 m!272141))

(declare-fun m!272143 () Bool)

(assert (=> b!257279 m!272143))

(declare-fun m!272145 () Bool)

(assert (=> b!257280 m!272145))

(assert (=> b!256946 d!61657))

(declare-fun b!257281 () Bool)

(declare-fun e!166766 () (_ BitVec 32))

(declare-fun call!24417 () (_ BitVec 32))

(assert (=> b!257281 (= e!166766 (bvadd #b00000000000000000000000000000001 call!24417))))

(declare-fun bm!24414 () Bool)

(assert (=> bm!24414 (= call!24417 (arrayCountValidKeys!0 lt!129012 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6274 (_keys!6909 thiss!1504))))))

(declare-fun b!257283 () Bool)

(declare-fun e!166767 () (_ BitVec 32))

(assert (=> b!257283 (= e!166767 e!166766)))

(declare-fun c!43537 () Bool)

(assert (=> b!257283 (= c!43537 (validKeyInArray!0 (select (arr!5926 lt!129012) #b00000000000000000000000000000000)))))

(declare-fun b!257284 () Bool)

(assert (=> b!257284 (= e!166766 call!24417)))

(declare-fun d!61659 () Bool)

(declare-fun lt!129237 () (_ BitVec 32))

(assert (=> d!61659 (and (bvsge lt!129237 #b00000000000000000000000000000000) (bvsle lt!129237 (bvsub (size!6274 lt!129012) #b00000000000000000000000000000000)))))

(assert (=> d!61659 (= lt!129237 e!166767)))

(declare-fun c!43536 () Bool)

(assert (=> d!61659 (= c!43536 (bvsge #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))))))

(assert (=> d!61659 (and (bvsle #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6274 (_keys!6909 thiss!1504)) (size!6274 lt!129012)))))

(assert (=> d!61659 (= (arrayCountValidKeys!0 lt!129012 #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))) lt!129237)))

(declare-fun b!257282 () Bool)

(assert (=> b!257282 (= e!166767 #b00000000000000000000000000000000)))

(assert (= (and d!61659 c!43536) b!257282))

(assert (= (and d!61659 (not c!43536)) b!257283))

(assert (= (and b!257283 c!43537) b!257281))

(assert (= (and b!257283 (not c!43537)) b!257284))

(assert (= (or b!257281 b!257284) bm!24414))

(declare-fun m!272147 () Bool)

(assert (=> bm!24414 m!272147))

(assert (=> b!257283 m!272023))

(assert (=> b!257283 m!272023))

(assert (=> b!257283 m!272025))

(assert (=> b!256946 d!61659))

(declare-fun d!61661 () Bool)

(assert (=> d!61661 (= (inRange!0 index!297 (mask!11027 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11027 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!256962 d!61661))

(declare-fun d!61663 () Bool)

(declare-fun e!166773 () Bool)

(assert (=> d!61663 e!166773))

(declare-fun res!125827 () Bool)

(assert (=> d!61663 (=> res!125827 e!166773)))

(declare-fun lt!129249 () Bool)

(assert (=> d!61663 (= res!125827 (not lt!129249))))

(declare-fun lt!129246 () Bool)

(assert (=> d!61663 (= lt!129249 lt!129246)))

(declare-fun lt!129248 () Unit!7946)

(declare-fun e!166772 () Unit!7946)

(assert (=> d!61663 (= lt!129248 e!166772)))

(declare-fun c!43540 () Bool)

(assert (=> d!61663 (= c!43540 lt!129246)))

(declare-fun containsKey!301 (List!3771 (_ BitVec 64)) Bool)

(assert (=> d!61663 (= lt!129246 (containsKey!301 (toList!1902 lt!129017) key!932))))

(assert (=> d!61663 (= (contains!1848 lt!129017 key!932) lt!129249)))

(declare-fun b!257291 () Bool)

(declare-fun lt!129247 () Unit!7946)

(assert (=> b!257291 (= e!166772 lt!129247)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!250 (List!3771 (_ BitVec 64)) Unit!7946)

(assert (=> b!257291 (= lt!129247 (lemmaContainsKeyImpliesGetValueByKeyDefined!250 (toList!1902 lt!129017) key!932))))

(declare-fun isDefined!251 (Option!315) Bool)

(assert (=> b!257291 (isDefined!251 (getValueByKey!309 (toList!1902 lt!129017) key!932))))

(declare-fun b!257292 () Bool)

(declare-fun Unit!7959 () Unit!7946)

(assert (=> b!257292 (= e!166772 Unit!7959)))

(declare-fun b!257293 () Bool)

(assert (=> b!257293 (= e!166773 (isDefined!251 (getValueByKey!309 (toList!1902 lt!129017) key!932)))))

(assert (= (and d!61663 c!43540) b!257291))

(assert (= (and d!61663 (not c!43540)) b!257292))

(assert (= (and d!61663 (not res!125827)) b!257293))

(declare-fun m!272149 () Bool)

(assert (=> d!61663 m!272149))

(declare-fun m!272151 () Bool)

(assert (=> b!257291 m!272151))

(declare-fun m!272153 () Bool)

(assert (=> b!257291 m!272153))

(assert (=> b!257291 m!272153))

(declare-fun m!272155 () Bool)

(assert (=> b!257291 m!272155))

(assert (=> b!257293 m!272153))

(assert (=> b!257293 m!272153))

(assert (=> b!257293 m!272155))

(assert (=> b!256962 d!61663))

(declare-fun b!257294 () Bool)

(declare-fun e!166777 () Bool)

(declare-fun e!166779 () Bool)

(assert (=> b!257294 (= e!166777 e!166779)))

(declare-fun res!125829 () Bool)

(declare-fun call!24422 () Bool)

(assert (=> b!257294 (= res!125829 call!24422)))

(assert (=> b!257294 (=> (not res!125829) (not e!166779))))

(declare-fun b!257295 () Bool)

(declare-fun lt!129252 () ListLongMap!3773)

(assert (=> b!257295 (= e!166779 (= (apply!253 lt!129252 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4585 thiss!1504)))))

(declare-fun c!43541 () Bool)

(declare-fun call!24418 () ListLongMap!3773)

(declare-fun call!24423 () ListLongMap!3773)

(declare-fun call!24420 () ListLongMap!3773)

(declare-fun call!24419 () ListLongMap!3773)

(declare-fun c!43543 () Bool)

(declare-fun bm!24415 () Bool)

(assert (=> bm!24415 (= call!24418 (+!692 (ite c!43541 call!24423 (ite c!43543 call!24419 call!24420)) (ite (or c!43541 c!43543) (tuple2!4871 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4585 thiss!1504)) (tuple2!4871 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4585 thiss!1504)))))))

(declare-fun b!257296 () Bool)

(declare-fun e!166785 () Bool)

(assert (=> b!257296 (= e!166785 (validKeyInArray!0 (select (arr!5926 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257297 () Bool)

(assert (=> b!257297 (= e!166777 (not call!24422))))

(declare-fun bm!24416 () Bool)

(assert (=> bm!24416 (= call!24422 (contains!1848 lt!129252 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24417 () Bool)

(assert (=> bm!24417 (= call!24423 (getCurrentListMapNoExtraKeys!569 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun b!257298 () Bool)

(declare-fun e!166783 () Unit!7946)

(declare-fun Unit!7960 () Unit!7946)

(assert (=> b!257298 (= e!166783 Unit!7960)))

(declare-fun b!257299 () Bool)

(declare-fun e!166774 () ListLongMap!3773)

(declare-fun call!24424 () ListLongMap!3773)

(assert (=> b!257299 (= e!166774 call!24424)))

(declare-fun bm!24418 () Bool)

(assert (=> bm!24418 (= call!24424 call!24418)))

(declare-fun b!257300 () Bool)

(declare-fun e!166786 () Bool)

(declare-fun e!166784 () Bool)

(assert (=> b!257300 (= e!166786 e!166784)))

(declare-fun c!43546 () Bool)

(assert (=> b!257300 (= c!43546 (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24419 () Bool)

(assert (=> bm!24419 (= call!24419 call!24423)))

(declare-fun bm!24420 () Bool)

(declare-fun call!24421 () Bool)

(assert (=> bm!24420 (= call!24421 (contains!1848 lt!129252 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24421 () Bool)

(assert (=> bm!24421 (= call!24420 call!24419)))

(declare-fun b!257301 () Bool)

(declare-fun e!166780 () ListLongMap!3773)

(assert (=> b!257301 (= e!166780 call!24420)))

(declare-fun b!257302 () Bool)

(declare-fun e!166778 () Bool)

(assert (=> b!257302 (= e!166778 (= (apply!253 lt!129252 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4585 thiss!1504)))))

(declare-fun b!257303 () Bool)

(declare-fun e!166776 () Bool)

(assert (=> b!257303 (= e!166776 (= (apply!253 lt!129252 (select (arr!5926 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000)) (get!3044 (select (arr!5925 (_values!4727 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!587 (defaultEntry!4744 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6273 (_values!4727 thiss!1504))))))

(assert (=> b!257303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))))))

(declare-fun b!257304 () Bool)

(declare-fun e!166782 () Bool)

(assert (=> b!257304 (= e!166782 (validKeyInArray!0 (select (arr!5926 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257305 () Bool)

(declare-fun e!166781 () Bool)

(assert (=> b!257305 (= e!166781 e!166776)))

(declare-fun res!125836 () Bool)

(assert (=> b!257305 (=> (not res!125836) (not e!166776))))

(assert (=> b!257305 (= res!125836 (contains!1848 lt!129252 (select (arr!5926 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!257305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))))))

(declare-fun b!257306 () Bool)

(assert (=> b!257306 (= e!166784 e!166778)))

(declare-fun res!125828 () Bool)

(assert (=> b!257306 (= res!125828 call!24421)))

(assert (=> b!257306 (=> (not res!125828) (not e!166778))))

(declare-fun b!257307 () Bool)

(declare-fun e!166775 () ListLongMap!3773)

(assert (=> b!257307 (= e!166775 e!166774)))

(assert (=> b!257307 (= c!43543 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257308 () Bool)

(declare-fun c!43545 () Bool)

(assert (=> b!257308 (= c!43545 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!257308 (= e!166774 e!166780)))

(declare-fun d!61665 () Bool)

(assert (=> d!61665 e!166786))

(declare-fun res!125831 () Bool)

(assert (=> d!61665 (=> (not res!125831) (not e!166786))))

(assert (=> d!61665 (= res!125831 (or (bvsge #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))))))))

(declare-fun lt!129264 () ListLongMap!3773)

(assert (=> d!61665 (= lt!129252 lt!129264)))

(declare-fun lt!129253 () Unit!7946)

(assert (=> d!61665 (= lt!129253 e!166783)))

(declare-fun c!43544 () Bool)

(assert (=> d!61665 (= c!43544 e!166785)))

(declare-fun res!125830 () Bool)

(assert (=> d!61665 (=> (not res!125830) (not e!166785))))

(assert (=> d!61665 (= res!125830 (bvslt #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))))))

(assert (=> d!61665 (= lt!129264 e!166775)))

(assert (=> d!61665 (= c!43541 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61665 (validMask!0 (mask!11027 thiss!1504))))

(assert (=> d!61665 (= (getCurrentListMap!1411 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)) lt!129252)))

(declare-fun b!257309 () Bool)

(assert (=> b!257309 (= e!166780 call!24424)))

(declare-fun b!257310 () Bool)

(assert (=> b!257310 (= e!166775 (+!692 call!24418 (tuple2!4871 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4585 thiss!1504))))))

(declare-fun b!257311 () Bool)

(declare-fun res!125832 () Bool)

(assert (=> b!257311 (=> (not res!125832) (not e!166786))))

(assert (=> b!257311 (= res!125832 e!166781)))

(declare-fun res!125833 () Bool)

(assert (=> b!257311 (=> res!125833 e!166781)))

(assert (=> b!257311 (= res!125833 (not e!166782))))

(declare-fun res!125835 () Bool)

(assert (=> b!257311 (=> (not res!125835) (not e!166782))))

(assert (=> b!257311 (= res!125835 (bvslt #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))))))

(declare-fun b!257312 () Bool)

(declare-fun res!125834 () Bool)

(assert (=> b!257312 (=> (not res!125834) (not e!166786))))

(assert (=> b!257312 (= res!125834 e!166777)))

(declare-fun c!43542 () Bool)

(assert (=> b!257312 (= c!43542 (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!257313 () Bool)

(assert (=> b!257313 (= e!166784 (not call!24421))))

(declare-fun b!257314 () Bool)

(declare-fun lt!129254 () Unit!7946)

(assert (=> b!257314 (= e!166783 lt!129254)))

(declare-fun lt!129262 () ListLongMap!3773)

(assert (=> b!257314 (= lt!129262 (getCurrentListMapNoExtraKeys!569 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129267 () (_ BitVec 64))

(assert (=> b!257314 (= lt!129267 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129266 () (_ BitVec 64))

(assert (=> b!257314 (= lt!129266 (select (arr!5926 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129263 () Unit!7946)

(assert (=> b!257314 (= lt!129263 (addStillContains!229 lt!129262 lt!129267 (zeroValue!4585 thiss!1504) lt!129266))))

(assert (=> b!257314 (contains!1848 (+!692 lt!129262 (tuple2!4871 lt!129267 (zeroValue!4585 thiss!1504))) lt!129266)))

(declare-fun lt!129265 () Unit!7946)

(assert (=> b!257314 (= lt!129265 lt!129263)))

(declare-fun lt!129251 () ListLongMap!3773)

(assert (=> b!257314 (= lt!129251 (getCurrentListMapNoExtraKeys!569 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129270 () (_ BitVec 64))

(assert (=> b!257314 (= lt!129270 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129256 () (_ BitVec 64))

(assert (=> b!257314 (= lt!129256 (select (arr!5926 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129261 () Unit!7946)

(assert (=> b!257314 (= lt!129261 (addApplyDifferent!229 lt!129251 lt!129270 (minValue!4585 thiss!1504) lt!129256))))

(assert (=> b!257314 (= (apply!253 (+!692 lt!129251 (tuple2!4871 lt!129270 (minValue!4585 thiss!1504))) lt!129256) (apply!253 lt!129251 lt!129256))))

(declare-fun lt!129255 () Unit!7946)

(assert (=> b!257314 (= lt!129255 lt!129261)))

(declare-fun lt!129250 () ListLongMap!3773)

(assert (=> b!257314 (= lt!129250 (getCurrentListMapNoExtraKeys!569 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129260 () (_ BitVec 64))

(assert (=> b!257314 (= lt!129260 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129269 () (_ BitVec 64))

(assert (=> b!257314 (= lt!129269 (select (arr!5926 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129257 () Unit!7946)

(assert (=> b!257314 (= lt!129257 (addApplyDifferent!229 lt!129250 lt!129260 (zeroValue!4585 thiss!1504) lt!129269))))

(assert (=> b!257314 (= (apply!253 (+!692 lt!129250 (tuple2!4871 lt!129260 (zeroValue!4585 thiss!1504))) lt!129269) (apply!253 lt!129250 lt!129269))))

(declare-fun lt!129259 () Unit!7946)

(assert (=> b!257314 (= lt!129259 lt!129257)))

(declare-fun lt!129271 () ListLongMap!3773)

(assert (=> b!257314 (= lt!129271 (getCurrentListMapNoExtraKeys!569 (_keys!6909 thiss!1504) (_values!4727 thiss!1504) (mask!11027 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129258 () (_ BitVec 64))

(assert (=> b!257314 (= lt!129258 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129268 () (_ BitVec 64))

(assert (=> b!257314 (= lt!129268 (select (arr!5926 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257314 (= lt!129254 (addApplyDifferent!229 lt!129271 lt!129258 (minValue!4585 thiss!1504) lt!129268))))

(assert (=> b!257314 (= (apply!253 (+!692 lt!129271 (tuple2!4871 lt!129258 (minValue!4585 thiss!1504))) lt!129268) (apply!253 lt!129271 lt!129268))))

(assert (= (and d!61665 c!43541) b!257310))

(assert (= (and d!61665 (not c!43541)) b!257307))

(assert (= (and b!257307 c!43543) b!257299))

(assert (= (and b!257307 (not c!43543)) b!257308))

(assert (= (and b!257308 c!43545) b!257309))

(assert (= (and b!257308 (not c!43545)) b!257301))

(assert (= (or b!257309 b!257301) bm!24421))

(assert (= (or b!257299 bm!24421) bm!24419))

(assert (= (or b!257299 b!257309) bm!24418))

(assert (= (or b!257310 bm!24419) bm!24417))

(assert (= (or b!257310 bm!24418) bm!24415))

(assert (= (and d!61665 res!125830) b!257296))

(assert (= (and d!61665 c!43544) b!257314))

(assert (= (and d!61665 (not c!43544)) b!257298))

(assert (= (and d!61665 res!125831) b!257311))

(assert (= (and b!257311 res!125835) b!257304))

(assert (= (and b!257311 (not res!125833)) b!257305))

(assert (= (and b!257305 res!125836) b!257303))

(assert (= (and b!257311 res!125832) b!257312))

(assert (= (and b!257312 c!43542) b!257294))

(assert (= (and b!257312 (not c!43542)) b!257297))

(assert (= (and b!257294 res!125829) b!257295))

(assert (= (or b!257294 b!257297) bm!24416))

(assert (= (and b!257312 res!125834) b!257300))

(assert (= (and b!257300 c!43546) b!257306))

(assert (= (and b!257300 (not c!43546)) b!257313))

(assert (= (and b!257306 res!125828) b!257302))

(assert (= (or b!257306 b!257313) bm!24420))

(declare-fun b_lambda!8163 () Bool)

(assert (=> (not b_lambda!8163) (not b!257303)))

(assert (=> b!257303 t!8825))

(declare-fun b_and!13775 () Bool)

(assert (= b_and!13773 (and (=> t!8825 result!5371) b_and!13775)))

(declare-fun m!272157 () Bool)

(assert (=> b!257314 m!272157))

(declare-fun m!272159 () Bool)

(assert (=> b!257314 m!272159))

(declare-fun m!272161 () Bool)

(assert (=> b!257314 m!272161))

(declare-fun m!272163 () Bool)

(assert (=> b!257314 m!272163))

(declare-fun m!272165 () Bool)

(assert (=> b!257314 m!272165))

(assert (=> b!257314 m!272159))

(declare-fun m!272167 () Bool)

(assert (=> b!257314 m!272167))

(declare-fun m!272169 () Bool)

(assert (=> b!257314 m!272169))

(assert (=> b!257314 m!271985))

(declare-fun m!272171 () Bool)

(assert (=> b!257314 m!272171))

(declare-fun m!272173 () Bool)

(assert (=> b!257314 m!272173))

(declare-fun m!272175 () Bool)

(assert (=> b!257314 m!272175))

(assert (=> b!257314 m!272173))

(declare-fun m!272177 () Bool)

(assert (=> b!257314 m!272177))

(declare-fun m!272179 () Bool)

(assert (=> b!257314 m!272179))

(declare-fun m!272181 () Bool)

(assert (=> b!257314 m!272181))

(assert (=> b!257314 m!272179))

(assert (=> b!257314 m!272161))

(declare-fun m!272183 () Bool)

(assert (=> b!257314 m!272183))

(declare-fun m!272185 () Bool)

(assert (=> b!257314 m!272185))

(declare-fun m!272187 () Bool)

(assert (=> b!257314 m!272187))

(assert (=> b!257303 m!271985))

(declare-fun m!272189 () Bool)

(assert (=> b!257303 m!272189))

(assert (=> b!257303 m!272079))

(declare-fun m!272191 () Bool)

(assert (=> b!257303 m!272191))

(assert (=> b!257303 m!271985))

(assert (=> b!257303 m!272191))

(assert (=> b!257303 m!272079))

(declare-fun m!272193 () Bool)

(assert (=> b!257303 m!272193))

(assert (=> b!257305 m!271985))

(assert (=> b!257305 m!271985))

(declare-fun m!272195 () Bool)

(assert (=> b!257305 m!272195))

(declare-fun m!272197 () Bool)

(assert (=> bm!24420 m!272197))

(assert (=> b!257296 m!271985))

(assert (=> b!257296 m!271985))

(assert (=> b!257296 m!272101))

(declare-fun m!272199 () Bool)

(assert (=> b!257295 m!272199))

(assert (=> bm!24417 m!272187))

(declare-fun m!272201 () Bool)

(assert (=> bm!24415 m!272201))

(declare-fun m!272203 () Bool)

(assert (=> b!257302 m!272203))

(declare-fun m!272205 () Bool)

(assert (=> bm!24416 m!272205))

(assert (=> d!61665 m!271995))

(assert (=> b!257304 m!271985))

(assert (=> b!257304 m!271985))

(assert (=> b!257304 m!272101))

(declare-fun m!272207 () Bool)

(assert (=> b!257310 m!272207))

(assert (=> b!256962 d!61665))

(declare-fun d!61667 () Bool)

(assert (=> d!61667 (= (array_inv!3921 (_keys!6909 thiss!1504)) (bvsge (size!6274 (_keys!6909 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256963 d!61667))

(declare-fun d!61669 () Bool)

(assert (=> d!61669 (= (array_inv!3922 (_values!4727 thiss!1504)) (bvsge (size!6273 (_values!4727 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256963 d!61669))

(declare-fun d!61671 () Bool)

(declare-fun res!125843 () Bool)

(declare-fun e!166789 () Bool)

(assert (=> d!61671 (=> (not res!125843) (not e!166789))))

(declare-fun simpleValid!276 (LongMapFixedSize!3802) Bool)

(assert (=> d!61671 (= res!125843 (simpleValid!276 thiss!1504))))

(assert (=> d!61671 (= (valid!1490 thiss!1504) e!166789)))

(declare-fun b!257321 () Bool)

(declare-fun res!125844 () Bool)

(assert (=> b!257321 (=> (not res!125844) (not e!166789))))

(assert (=> b!257321 (= res!125844 (= (arrayCountValidKeys!0 (_keys!6909 thiss!1504) #b00000000000000000000000000000000 (size!6274 (_keys!6909 thiss!1504))) (_size!1950 thiss!1504)))))

(declare-fun b!257322 () Bool)

(declare-fun res!125845 () Bool)

(assert (=> b!257322 (=> (not res!125845) (not e!166789))))

(assert (=> b!257322 (= res!125845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6909 thiss!1504) (mask!11027 thiss!1504)))))

(declare-fun b!257323 () Bool)

(assert (=> b!257323 (= e!166789 (arrayNoDuplicates!0 (_keys!6909 thiss!1504) #b00000000000000000000000000000000 Nil!3769))))

(assert (= (and d!61671 res!125843) b!257321))

(assert (= (and b!257321 res!125844) b!257322))

(assert (= (and b!257322 res!125845) b!257323))

(declare-fun m!272209 () Bool)

(assert (=> d!61671 m!272209))

(assert (=> b!257321 m!271837))

(declare-fun m!272211 () Bool)

(assert (=> b!257322 m!272211))

(declare-fun m!272213 () Bool)

(assert (=> b!257323 m!272213))

(assert (=> start!24562 d!61671))

(declare-fun condMapEmpty!11226 () Bool)

(declare-fun mapDefault!11226 () ValueCell!2951)

(assert (=> mapNonEmpty!11217 (= condMapEmpty!11226 (= mapRest!11217 ((as const (Array (_ BitVec 32) ValueCell!2951)) mapDefault!11226)))))

(declare-fun e!166795 () Bool)

(declare-fun mapRes!11226 () Bool)

(assert (=> mapNonEmpty!11217 (= tp!23486 (and e!166795 mapRes!11226))))

(declare-fun b!257331 () Bool)

(assert (=> b!257331 (= e!166795 tp_is_empty!6589)))

(declare-fun b!257330 () Bool)

(declare-fun e!166794 () Bool)

(assert (=> b!257330 (= e!166794 tp_is_empty!6589)))

(declare-fun mapNonEmpty!11226 () Bool)

(declare-fun tp!23502 () Bool)

(assert (=> mapNonEmpty!11226 (= mapRes!11226 (and tp!23502 e!166794))))

(declare-fun mapKey!11226 () (_ BitVec 32))

(declare-fun mapRest!11226 () (Array (_ BitVec 32) ValueCell!2951))

(declare-fun mapValue!11226 () ValueCell!2951)

(assert (=> mapNonEmpty!11226 (= mapRest!11217 (store mapRest!11226 mapKey!11226 mapValue!11226))))

(declare-fun mapIsEmpty!11226 () Bool)

(assert (=> mapIsEmpty!11226 mapRes!11226))

(assert (= (and mapNonEmpty!11217 condMapEmpty!11226) mapIsEmpty!11226))

(assert (= (and mapNonEmpty!11217 (not condMapEmpty!11226)) mapNonEmpty!11226))

(assert (= (and mapNonEmpty!11226 ((_ is ValueCellFull!2951) mapValue!11226)) b!257330))

(assert (= (and mapNonEmpty!11217 ((_ is ValueCellFull!2951) mapDefault!11226)) b!257331))

(declare-fun m!272215 () Bool)

(assert (=> mapNonEmpty!11226 m!272215))

(declare-fun b_lambda!8165 () Bool)

(assert (= b_lambda!8163 (or (and b!256963 b_free!6727) b_lambda!8165)))

(declare-fun b_lambda!8167 () Bool)

(assert (= b_lambda!8161 (or (and b!256963 b_free!6727) b_lambda!8167)))

(check-sat (not b!257269) (not b!257215) (not d!61653) (not b!257213) (not d!61641) (not b!257136) (not b!257322) (not b_next!6727) (not b!257118) (not bm!24414) (not bm!24405) (not d!61645) (not b!257241) (not bm!24416) (not b!257291) (not bm!24415) b_and!13775 (not b!257237) (not b!257244) (not d!61625) (not b!257321) (not b!257148) (not b!257305) (not bm!24410) (not b_lambda!8167) (not d!61635) tp_is_empty!6589 (not b!257224) (not b!257303) (not b!257161) (not b!257206) (not b!257262) (not b!257158) (not b!257302) (not b!257310) (not b!257146) (not b!257089) (not b!257220) (not b!257283) (not bm!24417) (not b!257250) (not bm!24400) (not bm!24385) (not b!257263) (not b!257205) (not d!61655) (not b!257265) (not bm!24401) (not bm!24420) (not b!257274) (not d!61663) (not d!61665) (not b!257314) (not bm!24382) (not bm!24402) (not mapNonEmpty!11226) (not d!61649) (not bm!24381) (not b!257295) (not d!61627) (not b!257296) (not b!257212) (not b!257159) (not d!61671) (not b!257304) (not b_lambda!8165) (not d!61629) (not d!61631) (not b!257271) (not bm!24413) (not d!61657) (not b!257293) (not bm!24409) (not b!257323) (not b!257280) (not b!257214) (not b!257279) (not d!61637))
(check-sat b_and!13775 (not b_next!6727))
