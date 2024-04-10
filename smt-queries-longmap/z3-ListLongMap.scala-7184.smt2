; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91986 () Bool)

(assert start!91986)

(declare-fun b!1046091 () Bool)

(declare-fun b_free!21159 () Bool)

(declare-fun b_next!21159 () Bool)

(assert (=> b!1046091 (= b_free!21159 (not b_next!21159))))

(declare-fun tp!74738 () Bool)

(declare-fun b_and!33813 () Bool)

(assert (=> b!1046091 (= tp!74738 b_and!33813)))

(declare-fun b!1046088 () Bool)

(declare-fun e!593058 () Bool)

(declare-fun e!593061 () Bool)

(assert (=> b!1046088 (= e!593058 (not e!593061))))

(declare-fun res!696441 () Bool)

(assert (=> b!1046088 (=> res!696441 e!593061)))

(declare-datatypes ((V!38045 0))(
  ( (V!38046 (val!12490 Int)) )
))
(declare-datatypes ((ValueCell!11736 0))(
  ( (ValueCellFull!11736 (v!15087 V!38045)) (EmptyCell!11736) )
))
(declare-datatypes ((Unit!34185 0))(
  ( (Unit!34186) )
))
(declare-datatypes ((array!65936 0))(
  ( (array!65937 (arr!31713 (Array (_ BitVec 32) (_ BitVec 64))) (size!32248 (_ BitVec 32))) )
))
(declare-datatypes ((array!65938 0))(
  ( (array!65939 (arr!31714 (Array (_ BitVec 32) ValueCell!11736)) (size!32249 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6066 0))(
  ( (LongMapFixedSize!6067 (defaultEntry!6431 Int) (mask!30572 (_ BitVec 32)) (extraKeys!6159 (_ BitVec 32)) (zeroValue!6265 V!38045) (minValue!6265 V!38045) (_size!3088 (_ BitVec 32)) (_keys!11705 array!65936) (_values!6454 array!65938) (_vacant!3088 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15822 0))(
  ( (tuple2!15823 (_1!7922 Unit!34185) (_2!7922 LongMapFixedSize!6066)) )
))
(declare-fun lt!462037 () tuple2!15822)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15824 0))(
  ( (tuple2!15825 (_1!7923 (_ BitVec 64)) (_2!7923 V!38045)) )
))
(declare-datatypes ((List!22032 0))(
  ( (Nil!22029) (Cons!22028 (h!23236 tuple2!15824) (t!31322 List!22032)) )
))
(declare-datatypes ((ListLongMap!13807 0))(
  ( (ListLongMap!13808 (toList!6919 List!22032)) )
))
(declare-fun contains!6089 (ListLongMap!13807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3967 (array!65936 array!65938 (_ BitVec 32) (_ BitVec 32) V!38045 V!38045 (_ BitVec 32) Int) ListLongMap!13807)

(assert (=> b!1046088 (= res!696441 (not (contains!6089 (getCurrentListMap!3967 (_keys!11705 (_2!7922 lt!462037)) (_values!6454 (_2!7922 lt!462037)) (mask!30572 (_2!7922 lt!462037)) (extraKeys!6159 (_2!7922 lt!462037)) (zeroValue!6265 (_2!7922 lt!462037)) (minValue!6265 (_2!7922 lt!462037)) #b00000000000000000000000000000000 (defaultEntry!6431 (_2!7922 lt!462037))) key!909)))))

(declare-fun thiss!1427 () LongMapFixedSize!6066)

(declare-fun lt!462041 () array!65938)

(declare-fun lt!462032 () array!65936)

(declare-fun Unit!34187 () Unit!34185)

(declare-fun Unit!34188 () Unit!34185)

(assert (=> b!1046088 (= lt!462037 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3088 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15823 Unit!34187 (LongMapFixedSize!6067 (defaultEntry!6431 thiss!1427) (mask!30572 thiss!1427) (extraKeys!6159 thiss!1427) (zeroValue!6265 thiss!1427) (minValue!6265 thiss!1427) (bvsub (_size!3088 thiss!1427) #b00000000000000000000000000000001) lt!462032 lt!462041 (bvadd #b00000000000000000000000000000001 (_vacant!3088 thiss!1427)))) (tuple2!15823 Unit!34188 (LongMapFixedSize!6067 (defaultEntry!6431 thiss!1427) (mask!30572 thiss!1427) (extraKeys!6159 thiss!1427) (zeroValue!6265 thiss!1427) (minValue!6265 thiss!1427) (bvsub (_size!3088 thiss!1427) #b00000000000000000000000000000001) lt!462032 lt!462041 (_vacant!3088 thiss!1427)))))))

(declare-fun -!546 (ListLongMap!13807 (_ BitVec 64)) ListLongMap!13807)

(assert (=> b!1046088 (= (-!546 (getCurrentListMap!3967 (_keys!11705 thiss!1427) (_values!6454 thiss!1427) (mask!30572 thiss!1427) (extraKeys!6159 thiss!1427) (zeroValue!6265 thiss!1427) (minValue!6265 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6431 thiss!1427)) key!909) (getCurrentListMap!3967 lt!462032 lt!462041 (mask!30572 thiss!1427) (extraKeys!6159 thiss!1427) (zeroValue!6265 thiss!1427) (minValue!6265 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6431 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9855 0))(
  ( (MissingZero!9855 (index!41791 (_ BitVec 32))) (Found!9855 (index!41792 (_ BitVec 32))) (Intermediate!9855 (undefined!10667 Bool) (index!41793 (_ BitVec 32)) (x!93459 (_ BitVec 32))) (Undefined!9855) (MissingVacant!9855 (index!41794 (_ BitVec 32))) )
))
(declare-fun lt!462040 () SeekEntryResult!9855)

(declare-fun dynLambda!2016 (Int (_ BitVec 64)) V!38045)

(assert (=> b!1046088 (= lt!462041 (array!65939 (store (arr!31714 (_values!6454 thiss!1427)) (index!41792 lt!462040) (ValueCellFull!11736 (dynLambda!2016 (defaultEntry!6431 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32249 (_values!6454 thiss!1427))))))

(declare-fun lt!462036 () Unit!34185)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!67 (array!65936 array!65938 (_ BitVec 32) (_ BitVec 32) V!38045 V!38045 (_ BitVec 32) (_ BitVec 64) Int) Unit!34185)

(assert (=> b!1046088 (= lt!462036 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!67 (_keys!11705 thiss!1427) (_values!6454 thiss!1427) (mask!30572 thiss!1427) (extraKeys!6159 thiss!1427) (zeroValue!6265 thiss!1427) (minValue!6265 thiss!1427) (index!41792 lt!462040) key!909 (defaultEntry!6431 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046088 (not (arrayContainsKey!0 lt!462032 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462034 () Unit!34185)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65936 (_ BitVec 32) (_ BitVec 64)) Unit!34185)

(assert (=> b!1046088 (= lt!462034 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11705 thiss!1427) (index!41792 lt!462040) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65936 (_ BitVec 32)) Bool)

(assert (=> b!1046088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462032 (mask!30572 thiss!1427))))

(declare-fun lt!462038 () Unit!34185)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65936 (_ BitVec 32) (_ BitVec 32)) Unit!34185)

(assert (=> b!1046088 (= lt!462038 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11705 thiss!1427) (index!41792 lt!462040) (mask!30572 thiss!1427)))))

(declare-datatypes ((List!22033 0))(
  ( (Nil!22030) (Cons!22029 (h!23237 (_ BitVec 64)) (t!31323 List!22033)) )
))
(declare-fun arrayNoDuplicates!0 (array!65936 (_ BitVec 32) List!22033) Bool)

(assert (=> b!1046088 (arrayNoDuplicates!0 lt!462032 #b00000000000000000000000000000000 Nil!22030)))

(declare-fun lt!462033 () Unit!34185)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65936 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22033) Unit!34185)

(assert (=> b!1046088 (= lt!462033 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11705 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41792 lt!462040) #b00000000000000000000000000000000 Nil!22030))))

(declare-fun arrayCountValidKeys!0 (array!65936 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046088 (= (arrayCountValidKeys!0 lt!462032 #b00000000000000000000000000000000 (size!32248 (_keys!11705 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11705 thiss!1427) #b00000000000000000000000000000000 (size!32248 (_keys!11705 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046088 (= lt!462032 (array!65937 (store (arr!31713 (_keys!11705 thiss!1427)) (index!41792 lt!462040) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32248 (_keys!11705 thiss!1427))))))

(declare-fun lt!462035 () Unit!34185)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65936 (_ BitVec 32) (_ BitVec 64)) Unit!34185)

(assert (=> b!1046088 (= lt!462035 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11705 thiss!1427) (index!41792 lt!462040) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38963 () Bool)

(declare-fun mapRes!38963 () Bool)

(declare-fun tp!74739 () Bool)

(declare-fun e!593055 () Bool)

(assert (=> mapNonEmpty!38963 (= mapRes!38963 (and tp!74739 e!593055))))

(declare-fun mapRest!38963 () (Array (_ BitVec 32) ValueCell!11736))

(declare-fun mapValue!38963 () ValueCell!11736)

(declare-fun mapKey!38963 () (_ BitVec 32))

(assert (=> mapNonEmpty!38963 (= (arr!31714 (_values!6454 thiss!1427)) (store mapRest!38963 mapKey!38963 mapValue!38963))))

(declare-fun mapIsEmpty!38963 () Bool)

(assert (=> mapIsEmpty!38963 mapRes!38963))

(declare-fun b!1046089 () Bool)

(declare-fun e!593054 () Bool)

(assert (=> b!1046089 (= e!593054 e!593058)))

(declare-fun res!696444 () Bool)

(assert (=> b!1046089 (=> (not res!696444) (not e!593058))))

(get-info :version)

(assert (=> b!1046089 (= res!696444 ((_ is Found!9855) lt!462040))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65936 (_ BitVec 32)) SeekEntryResult!9855)

(assert (=> b!1046089 (= lt!462040 (seekEntry!0 key!909 (_keys!11705 thiss!1427) (mask!30572 thiss!1427)))))

(declare-fun b!1046090 () Bool)

(declare-fun res!696439 () Bool)

(assert (=> b!1046090 (=> (not res!696439) (not e!593054))))

(assert (=> b!1046090 (= res!696439 (not (= key!909 (bvneg key!909))))))

(declare-fun tp_is_empty!24879 () Bool)

(declare-fun e!593056 () Bool)

(declare-fun e!593057 () Bool)

(declare-fun array_inv!24495 (array!65936) Bool)

(declare-fun array_inv!24496 (array!65938) Bool)

(assert (=> b!1046091 (= e!593056 (and tp!74738 tp_is_empty!24879 (array_inv!24495 (_keys!11705 thiss!1427)) (array_inv!24496 (_values!6454 thiss!1427)) e!593057))))

(declare-fun b!1046092 () Bool)

(assert (=> b!1046092 (= e!593055 tp_is_empty!24879)))

(declare-fun b!1046093 () Bool)

(declare-fun res!696438 () Bool)

(assert (=> b!1046093 (=> res!696438 e!593061)))

(assert (=> b!1046093 (= res!696438 (or (not (= (size!32249 (_values!6454 (_2!7922 lt!462037))) (bvadd #b00000000000000000000000000000001 (mask!30572 (_2!7922 lt!462037))))) (not (= (size!32248 (_keys!11705 (_2!7922 lt!462037))) (size!32249 (_values!6454 (_2!7922 lt!462037))))) (bvslt (mask!30572 (_2!7922 lt!462037)) #b00000000000000000000000000000000) (bvslt (extraKeys!6159 (_2!7922 lt!462037)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6159 (_2!7922 lt!462037)) #b00000000000000000000000000000011)))))

(declare-fun b!1046094 () Bool)

(assert (=> b!1046094 (= e!593061 true)))

(declare-fun lt!462039 () Bool)

(assert (=> b!1046094 (= lt!462039 (arrayNoDuplicates!0 (_keys!11705 (_2!7922 lt!462037)) #b00000000000000000000000000000000 Nil!22030))))

(declare-fun b!1046095 () Bool)

(declare-fun res!696440 () Bool)

(assert (=> b!1046095 (=> res!696440 e!593061)))

(assert (=> b!1046095 (= res!696440 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11705 (_2!7922 lt!462037)) (mask!30572 (_2!7922 lt!462037)))))))

(declare-fun b!1046097 () Bool)

(declare-fun res!696443 () Bool)

(assert (=> b!1046097 (=> res!696443 e!593061)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1046097 (= res!696443 (not (validMask!0 (mask!30572 (_2!7922 lt!462037)))))))

(declare-fun b!1046098 () Bool)

(declare-fun e!593060 () Bool)

(assert (=> b!1046098 (= e!593060 tp_is_empty!24879)))

(declare-fun b!1046096 () Bool)

(assert (=> b!1046096 (= e!593057 (and e!593060 mapRes!38963))))

(declare-fun condMapEmpty!38963 () Bool)

(declare-fun mapDefault!38963 () ValueCell!11736)

(assert (=> b!1046096 (= condMapEmpty!38963 (= (arr!31714 (_values!6454 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11736)) mapDefault!38963)))))

(declare-fun res!696442 () Bool)

(assert (=> start!91986 (=> (not res!696442) (not e!593054))))

(declare-fun valid!2276 (LongMapFixedSize!6066) Bool)

(assert (=> start!91986 (= res!696442 (valid!2276 thiss!1427))))

(assert (=> start!91986 e!593054))

(assert (=> start!91986 e!593056))

(assert (=> start!91986 true))

(assert (= (and start!91986 res!696442) b!1046090))

(assert (= (and b!1046090 res!696439) b!1046089))

(assert (= (and b!1046089 res!696444) b!1046088))

(assert (= (and b!1046088 (not res!696441)) b!1046097))

(assert (= (and b!1046097 (not res!696443)) b!1046093))

(assert (= (and b!1046093 (not res!696438)) b!1046095))

(assert (= (and b!1046095 (not res!696440)) b!1046094))

(assert (= (and b!1046096 condMapEmpty!38963) mapIsEmpty!38963))

(assert (= (and b!1046096 (not condMapEmpty!38963)) mapNonEmpty!38963))

(assert (= (and mapNonEmpty!38963 ((_ is ValueCellFull!11736) mapValue!38963)) b!1046092))

(assert (= (and b!1046096 ((_ is ValueCellFull!11736) mapDefault!38963)) b!1046098))

(assert (= b!1046091 b!1046096))

(assert (= start!91986 b!1046091))

(declare-fun b_lambda!16343 () Bool)

(assert (=> (not b_lambda!16343) (not b!1046088)))

(declare-fun t!31321 () Bool)

(declare-fun tb!7111 () Bool)

(assert (=> (and b!1046091 (= (defaultEntry!6431 thiss!1427) (defaultEntry!6431 thiss!1427)) t!31321) tb!7111))

(declare-fun result!14647 () Bool)

(assert (=> tb!7111 (= result!14647 tp_is_empty!24879)))

(assert (=> b!1046088 t!31321))

(declare-fun b_and!33815 () Bool)

(assert (= b_and!33813 (and (=> t!31321 result!14647) b_and!33815)))

(declare-fun m!966009 () Bool)

(assert (=> b!1046088 m!966009))

(declare-fun m!966011 () Bool)

(assert (=> b!1046088 m!966011))

(declare-fun m!966013 () Bool)

(assert (=> b!1046088 m!966013))

(declare-fun m!966015 () Bool)

(assert (=> b!1046088 m!966015))

(declare-fun m!966017 () Bool)

(assert (=> b!1046088 m!966017))

(declare-fun m!966019 () Bool)

(assert (=> b!1046088 m!966019))

(declare-fun m!966021 () Bool)

(assert (=> b!1046088 m!966021))

(declare-fun m!966023 () Bool)

(assert (=> b!1046088 m!966023))

(declare-fun m!966025 () Bool)

(assert (=> b!1046088 m!966025))

(declare-fun m!966027 () Bool)

(assert (=> b!1046088 m!966027))

(declare-fun m!966029 () Bool)

(assert (=> b!1046088 m!966029))

(declare-fun m!966031 () Bool)

(assert (=> b!1046088 m!966031))

(declare-fun m!966033 () Bool)

(assert (=> b!1046088 m!966033))

(declare-fun m!966035 () Bool)

(assert (=> b!1046088 m!966035))

(declare-fun m!966037 () Bool)

(assert (=> b!1046088 m!966037))

(declare-fun m!966039 () Bool)

(assert (=> b!1046088 m!966039))

(assert (=> b!1046088 m!966025))

(declare-fun m!966041 () Bool)

(assert (=> b!1046088 m!966041))

(declare-fun m!966043 () Bool)

(assert (=> b!1046088 m!966043))

(assert (=> b!1046088 m!966027))

(declare-fun m!966045 () Bool)

(assert (=> mapNonEmpty!38963 m!966045))

(declare-fun m!966047 () Bool)

(assert (=> b!1046097 m!966047))

(declare-fun m!966049 () Bool)

(assert (=> b!1046089 m!966049))

(declare-fun m!966051 () Bool)

(assert (=> start!91986 m!966051))

(declare-fun m!966053 () Bool)

(assert (=> b!1046091 m!966053))

(declare-fun m!966055 () Bool)

(assert (=> b!1046091 m!966055))

(declare-fun m!966057 () Bool)

(assert (=> b!1046094 m!966057))

(declare-fun m!966059 () Bool)

(assert (=> b!1046095 m!966059))

(check-sat (not b_next!21159) tp_is_empty!24879 (not b!1046095) (not start!91986) (not b!1046097) b_and!33815 (not b_lambda!16343) (not b!1046089) (not mapNonEmpty!38963) (not b!1046088) (not b!1046091) (not b!1046094))
(check-sat b_and!33815 (not b_next!21159))
