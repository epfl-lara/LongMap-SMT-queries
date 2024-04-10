; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89770 () Bool)

(assert start!89770)

(declare-fun b!1028889 () Bool)

(declare-fun b_free!20589 () Bool)

(declare-fun b_next!20589 () Bool)

(assert (=> b!1028889 (= b_free!20589 (not b_next!20589))))

(declare-fun tp!72823 () Bool)

(declare-fun b_and!32897 () Bool)

(assert (=> b!1028889 (= tp!72823 b_and!32897)))

(declare-fun mapIsEmpty!37903 () Bool)

(declare-fun mapRes!37903 () Bool)

(assert (=> mapIsEmpty!37903 mapRes!37903))

(declare-fun mapNonEmpty!37903 () Bool)

(declare-fun tp!72824 () Bool)

(declare-fun e!580830 () Bool)

(assert (=> mapNonEmpty!37903 (= mapRes!37903 (and tp!72824 e!580830))))

(declare-datatypes ((V!37285 0))(
  ( (V!37286 (val!12205 Int)) )
))
(declare-datatypes ((ValueCell!11451 0))(
  ( (ValueCellFull!11451 (v!14778 V!37285)) (EmptyCell!11451) )
))
(declare-fun mapValue!37903 () ValueCell!11451)

(declare-datatypes ((array!64674 0))(
  ( (array!64675 (arr!31143 (Array (_ BitVec 32) (_ BitVec 64))) (size!31658 (_ BitVec 32))) )
))
(declare-datatypes ((array!64676 0))(
  ( (array!64677 (arr!31144 (Array (_ BitVec 32) ValueCell!11451)) (size!31659 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5496 0))(
  ( (LongMapFixedSize!5497 (defaultEntry!6110 Int) (mask!29856 (_ BitVec 32)) (extraKeys!5842 (_ BitVec 32)) (zeroValue!5946 V!37285) (minValue!5946 V!37285) (_size!2803 (_ BitVec 32)) (_keys!11269 array!64674) (_values!6133 array!64676) (_vacant!2803 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5496)

(declare-fun mapRest!37903 () (Array (_ BitVec 32) ValueCell!11451))

(declare-fun mapKey!37903 () (_ BitVec 32))

(assert (=> mapNonEmpty!37903 (= (arr!31144 (_values!6133 thiss!1427)) (store mapRest!37903 mapKey!37903 mapValue!37903))))

(declare-fun b!1028886 () Bool)

(declare-fun e!580836 () Bool)

(declare-fun e!580835 () Bool)

(assert (=> b!1028886 (= e!580836 (not e!580835))))

(declare-fun res!688354 () Bool)

(assert (=> b!1028886 (=> res!688354 e!580835)))

(declare-datatypes ((Unit!33595 0))(
  ( (Unit!33596) )
))
(declare-datatypes ((tuple2!15550 0))(
  ( (tuple2!15551 (_1!7786 Unit!33595) (_2!7786 LongMapFixedSize!5496)) )
))
(declare-fun lt!453369 () tuple2!15550)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028886 (= res!688354 (not (validMask!0 (mask!29856 (_2!7786 lt!453369)))))))

(declare-fun lt!453364 () array!64676)

(declare-fun lt!453370 () array!64674)

(declare-fun Unit!33597 () Unit!33595)

(declare-fun Unit!33598 () Unit!33595)

(assert (=> b!1028886 (= lt!453369 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2803 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15551 Unit!33597 (LongMapFixedSize!5497 (defaultEntry!6110 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) (bvsub (_size!2803 thiss!1427) #b00000000000000000000000000000001) lt!453370 lt!453364 (bvadd #b00000000000000000000000000000001 (_vacant!2803 thiss!1427)))) (tuple2!15551 Unit!33598 (LongMapFixedSize!5497 (defaultEntry!6110 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) (bvsub (_size!2803 thiss!1427) #b00000000000000000000000000000001) lt!453370 lt!453364 (_vacant!2803 thiss!1427)))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15552 0))(
  ( (tuple2!15553 (_1!7787 (_ BitVec 64)) (_2!7787 V!37285)) )
))
(declare-datatypes ((List!21819 0))(
  ( (Nil!21816) (Cons!21815 (h!23015 tuple2!15552) (t!30903 List!21819)) )
))
(declare-datatypes ((ListLongMap!13679 0))(
  ( (ListLongMap!13680 (toList!6855 List!21819)) )
))
(declare-fun -!482 (ListLongMap!13679 (_ BitVec 64)) ListLongMap!13679)

(declare-fun getCurrentListMap!3903 (array!64674 array!64676 (_ BitVec 32) (_ BitVec 32) V!37285 V!37285 (_ BitVec 32) Int) ListLongMap!13679)

(assert (=> b!1028886 (= (-!482 (getCurrentListMap!3903 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)) key!909) (getCurrentListMap!3903 lt!453370 lt!453364 (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9681 0))(
  ( (MissingZero!9681 (index!41095 (_ BitVec 32))) (Found!9681 (index!41096 (_ BitVec 32))) (Intermediate!9681 (undefined!10493 Bool) (index!41097 (_ BitVec 32)) (x!91555 (_ BitVec 32))) (Undefined!9681) (MissingVacant!9681 (index!41098 (_ BitVec 32))) )
))
(declare-fun lt!453365 () SeekEntryResult!9681)

(declare-fun dynLambda!1952 (Int (_ BitVec 64)) V!37285)

(assert (=> b!1028886 (= lt!453364 (array!64677 (store (arr!31144 (_values!6133 thiss!1427)) (index!41096 lt!453365) (ValueCellFull!11451 (dynLambda!1952 (defaultEntry!6110 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31659 (_values!6133 thiss!1427))))))

(declare-fun lt!453366 () Unit!33595)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!8 (array!64674 array!64676 (_ BitVec 32) (_ BitVec 32) V!37285 V!37285 (_ BitVec 32) (_ BitVec 64) Int) Unit!33595)

(assert (=> b!1028886 (= lt!453366 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!8 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) (index!41096 lt!453365) key!909 (defaultEntry!6110 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028886 (not (arrayContainsKey!0 lt!453370 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453372 () Unit!33595)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64674 (_ BitVec 32) (_ BitVec 64)) Unit!33595)

(assert (=> b!1028886 (= lt!453372 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11269 thiss!1427) (index!41096 lt!453365) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64674 (_ BitVec 32)) Bool)

(assert (=> b!1028886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453370 (mask!29856 thiss!1427))))

(declare-fun lt!453367 () Unit!33595)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64674 (_ BitVec 32) (_ BitVec 32)) Unit!33595)

(assert (=> b!1028886 (= lt!453367 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11269 thiss!1427) (index!41096 lt!453365) (mask!29856 thiss!1427)))))

(declare-datatypes ((List!21820 0))(
  ( (Nil!21817) (Cons!21816 (h!23016 (_ BitVec 64)) (t!30904 List!21820)) )
))
(declare-fun arrayNoDuplicates!0 (array!64674 (_ BitVec 32) List!21820) Bool)

(assert (=> b!1028886 (arrayNoDuplicates!0 lt!453370 #b00000000000000000000000000000000 Nil!21817)))

(declare-fun lt!453368 () Unit!33595)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64674 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21820) Unit!33595)

(assert (=> b!1028886 (= lt!453368 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11269 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41096 lt!453365) #b00000000000000000000000000000000 Nil!21817))))

(declare-fun arrayCountValidKeys!0 (array!64674 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028886 (= (arrayCountValidKeys!0 lt!453370 #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11269 thiss!1427) #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028886 (= lt!453370 (array!64675 (store (arr!31143 (_keys!11269 thiss!1427)) (index!41096 lt!453365) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31658 (_keys!11269 thiss!1427))))))

(declare-fun lt!453371 () Unit!33595)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64674 (_ BitVec 32) (_ BitVec 64)) Unit!33595)

(assert (=> b!1028886 (= lt!453371 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11269 thiss!1427) (index!41096 lt!453365) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028887 () Bool)

(declare-fun tp_is_empty!24309 () Bool)

(assert (=> b!1028887 (= e!580830 tp_is_empty!24309)))

(declare-fun b!1028888 () Bool)

(declare-fun e!580831 () Bool)

(assert (=> b!1028888 (= e!580831 e!580836)))

(declare-fun res!688355 () Bool)

(assert (=> b!1028888 (=> (not res!688355) (not e!580836))))

(get-info :version)

(assert (=> b!1028888 (= res!688355 ((_ is Found!9681) lt!453365))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64674 (_ BitVec 32)) SeekEntryResult!9681)

(assert (=> b!1028888 (= lt!453365 (seekEntry!0 key!909 (_keys!11269 thiss!1427) (mask!29856 thiss!1427)))))

(declare-fun b!1028890 () Bool)

(declare-fun e!580832 () Bool)

(declare-fun e!580833 () Bool)

(assert (=> b!1028890 (= e!580832 (and e!580833 mapRes!37903))))

(declare-fun condMapEmpty!37903 () Bool)

(declare-fun mapDefault!37903 () ValueCell!11451)

(assert (=> b!1028890 (= condMapEmpty!37903 (= (arr!31144 (_values!6133 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11451)) mapDefault!37903)))))

(declare-fun b!1028891 () Bool)

(declare-fun res!688357 () Bool)

(assert (=> b!1028891 (=> (not res!688357) (not e!580831))))

(assert (=> b!1028891 (= res!688357 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1028892 () Bool)

(assert (=> b!1028892 (= e!580835 (or (not (= (size!31659 (_values!6133 (_2!7786 lt!453369))) (bvadd #b00000000000000000000000000000001 (mask!29856 (_2!7786 lt!453369))))) (not (= (size!31658 (_keys!11269 (_2!7786 lt!453369))) (size!31659 (_values!6133 (_2!7786 lt!453369))))) (bvsge (mask!29856 (_2!7786 lt!453369)) #b00000000000000000000000000000000)))))

(declare-fun b!1028893 () Bool)

(assert (=> b!1028893 (= e!580833 tp_is_empty!24309)))

(declare-fun res!688356 () Bool)

(assert (=> start!89770 (=> (not res!688356) (not e!580831))))

(declare-fun valid!2081 (LongMapFixedSize!5496) Bool)

(assert (=> start!89770 (= res!688356 (valid!2081 thiss!1427))))

(assert (=> start!89770 e!580831))

(declare-fun e!580829 () Bool)

(assert (=> start!89770 e!580829))

(assert (=> start!89770 true))

(declare-fun array_inv!24107 (array!64674) Bool)

(declare-fun array_inv!24108 (array!64676) Bool)

(assert (=> b!1028889 (= e!580829 (and tp!72823 tp_is_empty!24309 (array_inv!24107 (_keys!11269 thiss!1427)) (array_inv!24108 (_values!6133 thiss!1427)) e!580832))))

(assert (= (and start!89770 res!688356) b!1028891))

(assert (= (and b!1028891 res!688357) b!1028888))

(assert (= (and b!1028888 res!688355) b!1028886))

(assert (= (and b!1028886 (not res!688354)) b!1028892))

(assert (= (and b!1028890 condMapEmpty!37903) mapIsEmpty!37903))

(assert (= (and b!1028890 (not condMapEmpty!37903)) mapNonEmpty!37903))

(assert (= (and mapNonEmpty!37903 ((_ is ValueCellFull!11451) mapValue!37903)) b!1028887))

(assert (= (and b!1028890 ((_ is ValueCellFull!11451) mapDefault!37903)) b!1028893))

(assert (= b!1028889 b!1028890))

(assert (= start!89770 b!1028889))

(declare-fun b_lambda!15829 () Bool)

(assert (=> (not b_lambda!15829) (not b!1028886)))

(declare-fun t!30902 () Bool)

(declare-fun tb!6907 () Bool)

(assert (=> (and b!1028889 (= (defaultEntry!6110 thiss!1427) (defaultEntry!6110 thiss!1427)) t!30902) tb!6907))

(declare-fun result!14135 () Bool)

(assert (=> tb!6907 (= result!14135 tp_is_empty!24309)))

(assert (=> b!1028886 t!30902))

(declare-fun b_and!32899 () Bool)

(assert (= b_and!32897 (and (=> t!30902 result!14135) b_and!32899)))

(declare-fun m!947975 () Bool)

(assert (=> b!1028889 m!947975))

(declare-fun m!947977 () Bool)

(assert (=> b!1028889 m!947977))

(declare-fun m!947979 () Bool)

(assert (=> b!1028886 m!947979))

(declare-fun m!947981 () Bool)

(assert (=> b!1028886 m!947981))

(declare-fun m!947983 () Bool)

(assert (=> b!1028886 m!947983))

(declare-fun m!947985 () Bool)

(assert (=> b!1028886 m!947985))

(declare-fun m!947987 () Bool)

(assert (=> b!1028886 m!947987))

(declare-fun m!947989 () Bool)

(assert (=> b!1028886 m!947989))

(declare-fun m!947991 () Bool)

(assert (=> b!1028886 m!947991))

(declare-fun m!947993 () Bool)

(assert (=> b!1028886 m!947993))

(declare-fun m!947995 () Bool)

(assert (=> b!1028886 m!947995))

(declare-fun m!947997 () Bool)

(assert (=> b!1028886 m!947997))

(declare-fun m!947999 () Bool)

(assert (=> b!1028886 m!947999))

(declare-fun m!948001 () Bool)

(assert (=> b!1028886 m!948001))

(declare-fun m!948003 () Bool)

(assert (=> b!1028886 m!948003))

(declare-fun m!948005 () Bool)

(assert (=> b!1028886 m!948005))

(assert (=> b!1028886 m!947993))

(declare-fun m!948007 () Bool)

(assert (=> b!1028886 m!948007))

(declare-fun m!948009 () Bool)

(assert (=> b!1028886 m!948009))

(declare-fun m!948011 () Bool)

(assert (=> b!1028886 m!948011))

(declare-fun m!948013 () Bool)

(assert (=> b!1028888 m!948013))

(declare-fun m!948015 () Bool)

(assert (=> mapNonEmpty!37903 m!948015))

(declare-fun m!948017 () Bool)

(assert (=> start!89770 m!948017))

(check-sat (not b!1028888) (not b!1028886) tp_is_empty!24309 (not mapNonEmpty!37903) (not b_next!20589) (not b_lambda!15829) b_and!32899 (not b!1028889) (not start!89770))
(check-sat b_and!32899 (not b_next!20589))
(get-model)

(declare-fun b_lambda!15833 () Bool)

(assert (= b_lambda!15829 (or (and b!1028889 b_free!20589) b_lambda!15833)))

(check-sat (not b!1028888) (not b!1028886) b_and!32899 (not b_lambda!15833) tp_is_empty!24309 (not mapNonEmpty!37903) (not b_next!20589) (not b!1028889) (not start!89770))
(check-sat b_and!32899 (not b_next!20589))
(get-model)

(declare-fun d!123149 () Bool)

(assert (=> d!123149 (= (array_inv!24107 (_keys!11269 thiss!1427)) (bvsge (size!31658 (_keys!11269 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028889 d!123149))

(declare-fun d!123151 () Bool)

(assert (=> d!123151 (= (array_inv!24108 (_values!6133 thiss!1427)) (bvsge (size!31659 (_values!6133 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028889 d!123151))

(declare-fun b!1028934 () Bool)

(declare-fun e!580869 () SeekEntryResult!9681)

(declare-fun e!580867 () SeekEntryResult!9681)

(assert (=> b!1028934 (= e!580869 e!580867)))

(declare-fun lt!453408 () (_ BitVec 64))

(declare-fun lt!453410 () SeekEntryResult!9681)

(assert (=> b!1028934 (= lt!453408 (select (arr!31143 (_keys!11269 thiss!1427)) (index!41097 lt!453410)))))

(declare-fun c!103883 () Bool)

(assert (=> b!1028934 (= c!103883 (= lt!453408 key!909))))

(declare-fun b!1028935 () Bool)

(declare-fun c!103882 () Bool)

(assert (=> b!1028935 (= c!103882 (= lt!453408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580868 () SeekEntryResult!9681)

(assert (=> b!1028935 (= e!580867 e!580868)))

(declare-fun b!1028936 () Bool)

(assert (=> b!1028936 (= e!580868 (MissingZero!9681 (index!41097 lt!453410)))))

(declare-fun b!1028937 () Bool)

(declare-fun lt!453411 () SeekEntryResult!9681)

(assert (=> b!1028937 (= e!580868 (ite ((_ is MissingVacant!9681) lt!453411) (MissingZero!9681 (index!41098 lt!453411)) lt!453411))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64674 (_ BitVec 32)) SeekEntryResult!9681)

(assert (=> b!1028937 (= lt!453411 (seekKeyOrZeroReturnVacant!0 (x!91555 lt!453410) (index!41097 lt!453410) (index!41097 lt!453410) key!909 (_keys!11269 thiss!1427) (mask!29856 thiss!1427)))))

(declare-fun b!1028938 () Bool)

(assert (=> b!1028938 (= e!580867 (Found!9681 (index!41097 lt!453410)))))

(declare-fun d!123153 () Bool)

(declare-fun lt!453409 () SeekEntryResult!9681)

(assert (=> d!123153 (and (or ((_ is MissingVacant!9681) lt!453409) (not ((_ is Found!9681) lt!453409)) (and (bvsge (index!41096 lt!453409) #b00000000000000000000000000000000) (bvslt (index!41096 lt!453409) (size!31658 (_keys!11269 thiss!1427))))) (not ((_ is MissingVacant!9681) lt!453409)) (or (not ((_ is Found!9681) lt!453409)) (= (select (arr!31143 (_keys!11269 thiss!1427)) (index!41096 lt!453409)) key!909)))))

(assert (=> d!123153 (= lt!453409 e!580869)))

(declare-fun c!103884 () Bool)

(assert (=> d!123153 (= c!103884 (and ((_ is Intermediate!9681) lt!453410) (undefined!10493 lt!453410)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64674 (_ BitVec 32)) SeekEntryResult!9681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123153 (= lt!453410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29856 thiss!1427)) key!909 (_keys!11269 thiss!1427) (mask!29856 thiss!1427)))))

(assert (=> d!123153 (validMask!0 (mask!29856 thiss!1427))))

(assert (=> d!123153 (= (seekEntry!0 key!909 (_keys!11269 thiss!1427) (mask!29856 thiss!1427)) lt!453409)))

(declare-fun b!1028939 () Bool)

(assert (=> b!1028939 (= e!580869 Undefined!9681)))

(assert (= (and d!123153 c!103884) b!1028939))

(assert (= (and d!123153 (not c!103884)) b!1028934))

(assert (= (and b!1028934 c!103883) b!1028938))

(assert (= (and b!1028934 (not c!103883)) b!1028935))

(assert (= (and b!1028935 c!103882) b!1028936))

(assert (= (and b!1028935 (not c!103882)) b!1028937))

(declare-fun m!948063 () Bool)

(assert (=> b!1028934 m!948063))

(declare-fun m!948065 () Bool)

(assert (=> b!1028937 m!948065))

(declare-fun m!948067 () Bool)

(assert (=> d!123153 m!948067))

(declare-fun m!948069 () Bool)

(assert (=> d!123153 m!948069))

(assert (=> d!123153 m!948069))

(declare-fun m!948071 () Bool)

(assert (=> d!123153 m!948071))

(declare-fun m!948073 () Bool)

(assert (=> d!123153 m!948073))

(assert (=> b!1028888 d!123153))

(declare-fun d!123155 () Bool)

(declare-fun res!688374 () Bool)

(declare-fun e!580874 () Bool)

(assert (=> d!123155 (=> res!688374 e!580874)))

(assert (=> d!123155 (= res!688374 (= (select (arr!31143 lt!453370) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123155 (= (arrayContainsKey!0 lt!453370 key!909 #b00000000000000000000000000000000) e!580874)))

(declare-fun b!1028944 () Bool)

(declare-fun e!580875 () Bool)

(assert (=> b!1028944 (= e!580874 e!580875)))

(declare-fun res!688375 () Bool)

(assert (=> b!1028944 (=> (not res!688375) (not e!580875))))

(assert (=> b!1028944 (= res!688375 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31658 lt!453370)))))

(declare-fun b!1028945 () Bool)

(assert (=> b!1028945 (= e!580875 (arrayContainsKey!0 lt!453370 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123155 (not res!688374)) b!1028944))

(assert (= (and b!1028944 res!688375) b!1028945))

(declare-fun m!948075 () Bool)

(assert (=> d!123155 m!948075))

(declare-fun m!948077 () Bool)

(assert (=> b!1028945 m!948077))

(assert (=> b!1028886 d!123155))

(declare-fun d!123157 () Bool)

(declare-fun e!580878 () Bool)

(assert (=> d!123157 e!580878))

(declare-fun res!688378 () Bool)

(assert (=> d!123157 (=> (not res!688378) (not e!580878))))

(assert (=> d!123157 (= res!688378 (and (bvsge (index!41096 lt!453365) #b00000000000000000000000000000000) (bvslt (index!41096 lt!453365) (size!31658 (_keys!11269 thiss!1427)))))))

(declare-fun lt!453414 () Unit!33595)

(declare-fun choose!53 (array!64674 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21820) Unit!33595)

(assert (=> d!123157 (= lt!453414 (choose!53 (_keys!11269 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41096 lt!453365) #b00000000000000000000000000000000 Nil!21817))))

(assert (=> d!123157 (bvslt (size!31658 (_keys!11269 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123157 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11269 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41096 lt!453365) #b00000000000000000000000000000000 Nil!21817) lt!453414)))

(declare-fun b!1028948 () Bool)

(assert (=> b!1028948 (= e!580878 (arrayNoDuplicates!0 (array!64675 (store (arr!31143 (_keys!11269 thiss!1427)) (index!41096 lt!453365) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31658 (_keys!11269 thiss!1427))) #b00000000000000000000000000000000 Nil!21817))))

(assert (= (and d!123157 res!688378) b!1028948))

(declare-fun m!948079 () Bool)

(assert (=> d!123157 m!948079))

(assert (=> b!1028948 m!947979))

(declare-fun m!948081 () Bool)

(assert (=> b!1028948 m!948081))

(assert (=> b!1028886 d!123157))

(declare-fun d!123159 () Bool)

(declare-fun lt!453417 () ListLongMap!13679)

(declare-fun contains!5970 (ListLongMap!13679 (_ BitVec 64)) Bool)

(assert (=> d!123159 (not (contains!5970 lt!453417 key!909))))

(declare-fun removeStrictlySorted!52 (List!21819 (_ BitVec 64)) List!21819)

(assert (=> d!123159 (= lt!453417 (ListLongMap!13680 (removeStrictlySorted!52 (toList!6855 (getCurrentListMap!3903 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427))) key!909)))))

(assert (=> d!123159 (= (-!482 (getCurrentListMap!3903 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)) key!909) lt!453417)))

(declare-fun bs!30052 () Bool)

(assert (= bs!30052 d!123159))

(declare-fun m!948083 () Bool)

(assert (=> bs!30052 m!948083))

(declare-fun m!948085 () Bool)

(assert (=> bs!30052 m!948085))

(assert (=> b!1028886 d!123159))

(declare-fun d!123161 () Bool)

(assert (=> d!123161 (= (validMask!0 (mask!29856 (_2!7786 lt!453369))) (and (or (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000000000000000111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000000000000001111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000000000000011111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000000000000111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000000000001111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000000000011111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000000000111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000000001111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000000011111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000000111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000001111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000011111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000000111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000001111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000011111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000000111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000001111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000011111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000000111111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000001111111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000011111111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000000111111111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000001111111111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000011111111111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00000111111111111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00001111111111111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00011111111111111111111111111111) (= (mask!29856 (_2!7786 lt!453369)) #b00111111111111111111111111111111)) (bvsle (mask!29856 (_2!7786 lt!453369)) #b00111111111111111111111111111111)))))

(assert (=> b!1028886 d!123161))

(declare-fun b!1028991 () Bool)

(declare-fun e!580908 () ListLongMap!13679)

(declare-fun e!580910 () ListLongMap!13679)

(assert (=> b!1028991 (= e!580908 e!580910)))

(declare-fun c!103898 () Bool)

(assert (=> b!1028991 (= c!103898 (and (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1028992 () Bool)

(declare-fun e!580911 () Bool)

(declare-fun call!43417 () Bool)

(assert (=> b!1028992 (= e!580911 (not call!43417))))

(declare-fun b!1028994 () Bool)

(declare-fun e!580909 () Bool)

(declare-fun lt!453462 () ListLongMap!13679)

(declare-fun apply!902 (ListLongMap!13679 (_ BitVec 64)) V!37285)

(assert (=> b!1028994 (= e!580909 (= (apply!902 lt!453462 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5946 thiss!1427)))))

(declare-fun b!1028995 () Bool)

(declare-fun e!580906 () Bool)

(declare-fun call!43412 () Bool)

(assert (=> b!1028995 (= e!580906 (not call!43412))))

(declare-fun bm!43408 () Bool)

(assert (=> bm!43408 (= call!43417 (contains!5970 lt!453462 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028996 () Bool)

(declare-fun res!688405 () Bool)

(declare-fun e!580907 () Bool)

(assert (=> b!1028996 (=> (not res!688405) (not e!580907))))

(assert (=> b!1028996 (= res!688405 e!580906)))

(declare-fun c!103899 () Bool)

(assert (=> b!1028996 (= c!103899 (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028997 () Bool)

(declare-fun e!580917 () Bool)

(declare-fun get!16353 (ValueCell!11451 V!37285) V!37285)

(assert (=> b!1028997 (= e!580917 (= (apply!902 lt!453462 (select (arr!31143 lt!453370) #b00000000000000000000000000000000)) (get!16353 (select (arr!31144 lt!453364) #b00000000000000000000000000000000) (dynLambda!1952 (defaultEntry!6110 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31659 lt!453364)))))

(assert (=> b!1028997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31658 lt!453370)))))

(declare-fun b!1028998 () Bool)

(declare-fun e!580915 () Bool)

(assert (=> b!1028998 (= e!580911 e!580915)))

(declare-fun res!688404 () Bool)

(assert (=> b!1028998 (= res!688404 call!43417)))

(assert (=> b!1028998 (=> (not res!688404) (not e!580915))))

(declare-fun b!1028999 () Bool)

(declare-fun call!43415 () ListLongMap!13679)

(declare-fun +!3100 (ListLongMap!13679 tuple2!15552) ListLongMap!13679)

(assert (=> b!1028999 (= e!580908 (+!3100 call!43415 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5946 thiss!1427))))))

(declare-fun d!123163 () Bool)

(assert (=> d!123163 e!580907))

(declare-fun res!688402 () Bool)

(assert (=> d!123163 (=> (not res!688402) (not e!580907))))

(assert (=> d!123163 (= res!688402 (or (bvsge #b00000000000000000000000000000000 (size!31658 lt!453370)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31658 lt!453370)))))))

(declare-fun lt!453478 () ListLongMap!13679)

(assert (=> d!123163 (= lt!453462 lt!453478)))

(declare-fun lt!453479 () Unit!33595)

(declare-fun e!580912 () Unit!33595)

(assert (=> d!123163 (= lt!453479 e!580912)))

(declare-fun c!103901 () Bool)

(declare-fun e!580913 () Bool)

(assert (=> d!123163 (= c!103901 e!580913)))

(declare-fun res!688403 () Bool)

(assert (=> d!123163 (=> (not res!688403) (not e!580913))))

(assert (=> d!123163 (= res!688403 (bvslt #b00000000000000000000000000000000 (size!31658 lt!453370)))))

(assert (=> d!123163 (= lt!453478 e!580908)))

(declare-fun c!103900 () Bool)

(assert (=> d!123163 (= c!103900 (and (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123163 (validMask!0 (mask!29856 thiss!1427))))

(assert (=> d!123163 (= (getCurrentListMap!3903 lt!453370 lt!453364 (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)) lt!453462)))

(declare-fun b!1028993 () Bool)

(declare-fun lt!453467 () Unit!33595)

(assert (=> b!1028993 (= e!580912 lt!453467)))

(declare-fun lt!453466 () ListLongMap!13679)

(declare-fun getCurrentListMapNoExtraKeys!3516 (array!64674 array!64676 (_ BitVec 32) (_ BitVec 32) V!37285 V!37285 (_ BitVec 32) Int) ListLongMap!13679)

(assert (=> b!1028993 (= lt!453466 (getCurrentListMapNoExtraKeys!3516 lt!453370 lt!453364 (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)))))

(declare-fun lt!453480 () (_ BitVec 64))

(assert (=> b!1028993 (= lt!453480 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453476 () (_ BitVec 64))

(assert (=> b!1028993 (= lt!453476 (select (arr!31143 lt!453370) #b00000000000000000000000000000000))))

(declare-fun lt!453469 () Unit!33595)

(declare-fun addStillContains!621 (ListLongMap!13679 (_ BitVec 64) V!37285 (_ BitVec 64)) Unit!33595)

(assert (=> b!1028993 (= lt!453469 (addStillContains!621 lt!453466 lt!453480 (zeroValue!5946 thiss!1427) lt!453476))))

(assert (=> b!1028993 (contains!5970 (+!3100 lt!453466 (tuple2!15553 lt!453480 (zeroValue!5946 thiss!1427))) lt!453476)))

(declare-fun lt!453472 () Unit!33595)

(assert (=> b!1028993 (= lt!453472 lt!453469)))

(declare-fun lt!453475 () ListLongMap!13679)

(assert (=> b!1028993 (= lt!453475 (getCurrentListMapNoExtraKeys!3516 lt!453370 lt!453364 (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)))))

(declare-fun lt!453463 () (_ BitVec 64))

(assert (=> b!1028993 (= lt!453463 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453483 () (_ BitVec 64))

(assert (=> b!1028993 (= lt!453483 (select (arr!31143 lt!453370) #b00000000000000000000000000000000))))

(declare-fun lt!453468 () Unit!33595)

(declare-fun addApplyDifferent!481 (ListLongMap!13679 (_ BitVec 64) V!37285 (_ BitVec 64)) Unit!33595)

(assert (=> b!1028993 (= lt!453468 (addApplyDifferent!481 lt!453475 lt!453463 (minValue!5946 thiss!1427) lt!453483))))

(assert (=> b!1028993 (= (apply!902 (+!3100 lt!453475 (tuple2!15553 lt!453463 (minValue!5946 thiss!1427))) lt!453483) (apply!902 lt!453475 lt!453483))))

(declare-fun lt!453464 () Unit!33595)

(assert (=> b!1028993 (= lt!453464 lt!453468)))

(declare-fun lt!453482 () ListLongMap!13679)

(assert (=> b!1028993 (= lt!453482 (getCurrentListMapNoExtraKeys!3516 lt!453370 lt!453364 (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)))))

(declare-fun lt!453473 () (_ BitVec 64))

(assert (=> b!1028993 (= lt!453473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453465 () (_ BitVec 64))

(assert (=> b!1028993 (= lt!453465 (select (arr!31143 lt!453370) #b00000000000000000000000000000000))))

(declare-fun lt!453481 () Unit!33595)

(assert (=> b!1028993 (= lt!453481 (addApplyDifferent!481 lt!453482 lt!453473 (zeroValue!5946 thiss!1427) lt!453465))))

(assert (=> b!1028993 (= (apply!902 (+!3100 lt!453482 (tuple2!15553 lt!453473 (zeroValue!5946 thiss!1427))) lt!453465) (apply!902 lt!453482 lt!453465))))

(declare-fun lt!453474 () Unit!33595)

(assert (=> b!1028993 (= lt!453474 lt!453481)))

(declare-fun lt!453470 () ListLongMap!13679)

(assert (=> b!1028993 (= lt!453470 (getCurrentListMapNoExtraKeys!3516 lt!453370 lt!453364 (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)))))

(declare-fun lt!453471 () (_ BitVec 64))

(assert (=> b!1028993 (= lt!453471 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453477 () (_ BitVec 64))

(assert (=> b!1028993 (= lt!453477 (select (arr!31143 lt!453370) #b00000000000000000000000000000000))))

(assert (=> b!1028993 (= lt!453467 (addApplyDifferent!481 lt!453470 lt!453471 (minValue!5946 thiss!1427) lt!453477))))

(assert (=> b!1028993 (= (apply!902 (+!3100 lt!453470 (tuple2!15553 lt!453471 (minValue!5946 thiss!1427))) lt!453477) (apply!902 lt!453470 lt!453477))))

(declare-fun b!1029000 () Bool)

(declare-fun e!580916 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1029000 (= e!580916 (validKeyInArray!0 (select (arr!31143 lt!453370) #b00000000000000000000000000000000)))))

(declare-fun b!1029001 () Bool)

(assert (=> b!1029001 (= e!580907 e!580911)))

(declare-fun c!103902 () Bool)

(assert (=> b!1029001 (= c!103902 (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43409 () Bool)

(declare-fun call!43416 () ListLongMap!13679)

(declare-fun call!43411 () ListLongMap!13679)

(declare-fun call!43414 () ListLongMap!13679)

(assert (=> bm!43409 (= call!43415 (+!3100 (ite c!103900 call!43416 (ite c!103898 call!43411 call!43414)) (ite (or c!103900 c!103898) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5946 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5946 thiss!1427)))))))

(declare-fun b!1029002 () Bool)

(declare-fun c!103897 () Bool)

(assert (=> b!1029002 (= c!103897 (and (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!580914 () ListLongMap!13679)

(assert (=> b!1029002 (= e!580910 e!580914)))

(declare-fun bm!43410 () Bool)

(declare-fun call!43413 () ListLongMap!13679)

(assert (=> bm!43410 (= call!43413 call!43415)))

(declare-fun b!1029003 () Bool)

(declare-fun e!580905 () Bool)

(assert (=> b!1029003 (= e!580905 e!580917)))

(declare-fun res!688399 () Bool)

(assert (=> b!1029003 (=> (not res!688399) (not e!580917))))

(assert (=> b!1029003 (= res!688399 (contains!5970 lt!453462 (select (arr!31143 lt!453370) #b00000000000000000000000000000000)))))

(assert (=> b!1029003 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31658 lt!453370)))))

(declare-fun bm!43411 () Bool)

(assert (=> bm!43411 (= call!43412 (contains!5970 lt!453462 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029004 () Bool)

(assert (=> b!1029004 (= e!580914 call!43413)))

(declare-fun b!1029005 () Bool)

(assert (=> b!1029005 (= e!580915 (= (apply!902 lt!453462 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5946 thiss!1427)))))

(declare-fun b!1029006 () Bool)

(assert (=> b!1029006 (= e!580906 e!580909)))

(declare-fun res!688400 () Bool)

(assert (=> b!1029006 (= res!688400 call!43412)))

(assert (=> b!1029006 (=> (not res!688400) (not e!580909))))

(declare-fun b!1029007 () Bool)

(assert (=> b!1029007 (= e!580910 call!43413)))

(declare-fun b!1029008 () Bool)

(assert (=> b!1029008 (= e!580913 (validKeyInArray!0 (select (arr!31143 lt!453370) #b00000000000000000000000000000000)))))

(declare-fun bm!43412 () Bool)

(assert (=> bm!43412 (= call!43414 call!43411)))

(declare-fun b!1029009 () Bool)

(declare-fun Unit!33599 () Unit!33595)

(assert (=> b!1029009 (= e!580912 Unit!33599)))

(declare-fun bm!43413 () Bool)

(assert (=> bm!43413 (= call!43411 call!43416)))

(declare-fun bm!43414 () Bool)

(assert (=> bm!43414 (= call!43416 (getCurrentListMapNoExtraKeys!3516 lt!453370 lt!453364 (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)))))

(declare-fun b!1029010 () Bool)

(declare-fun res!688401 () Bool)

(assert (=> b!1029010 (=> (not res!688401) (not e!580907))))

(assert (=> b!1029010 (= res!688401 e!580905)))

(declare-fun res!688398 () Bool)

(assert (=> b!1029010 (=> res!688398 e!580905)))

(assert (=> b!1029010 (= res!688398 (not e!580916))))

(declare-fun res!688397 () Bool)

(assert (=> b!1029010 (=> (not res!688397) (not e!580916))))

(assert (=> b!1029010 (= res!688397 (bvslt #b00000000000000000000000000000000 (size!31658 lt!453370)))))

(declare-fun b!1029011 () Bool)

(assert (=> b!1029011 (= e!580914 call!43414)))

(assert (= (and d!123163 c!103900) b!1028999))

(assert (= (and d!123163 (not c!103900)) b!1028991))

(assert (= (and b!1028991 c!103898) b!1029007))

(assert (= (and b!1028991 (not c!103898)) b!1029002))

(assert (= (and b!1029002 c!103897) b!1029004))

(assert (= (and b!1029002 (not c!103897)) b!1029011))

(assert (= (or b!1029004 b!1029011) bm!43412))

(assert (= (or b!1029007 bm!43412) bm!43413))

(assert (= (or b!1029007 b!1029004) bm!43410))

(assert (= (or b!1028999 bm!43413) bm!43414))

(assert (= (or b!1028999 bm!43410) bm!43409))

(assert (= (and d!123163 res!688403) b!1029008))

(assert (= (and d!123163 c!103901) b!1028993))

(assert (= (and d!123163 (not c!103901)) b!1029009))

(assert (= (and d!123163 res!688402) b!1029010))

(assert (= (and b!1029010 res!688397) b!1029000))

(assert (= (and b!1029010 (not res!688398)) b!1029003))

(assert (= (and b!1029003 res!688399) b!1028997))

(assert (= (and b!1029010 res!688401) b!1028996))

(assert (= (and b!1028996 c!103899) b!1029006))

(assert (= (and b!1028996 (not c!103899)) b!1028995))

(assert (= (and b!1029006 res!688400) b!1028994))

(assert (= (or b!1029006 b!1028995) bm!43411))

(assert (= (and b!1028996 res!688405) b!1029001))

(assert (= (and b!1029001 c!103902) b!1028998))

(assert (= (and b!1029001 (not c!103902)) b!1028992))

(assert (= (and b!1028998 res!688404) b!1029005))

(assert (= (or b!1028998 b!1028992) bm!43408))

(declare-fun b_lambda!15835 () Bool)

(assert (=> (not b_lambda!15835) (not b!1028997)))

(assert (=> b!1028997 t!30902))

(declare-fun b_and!32905 () Bool)

(assert (= b_and!32899 (and (=> t!30902 result!14135) b_and!32905)))

(assert (=> b!1029000 m!948075))

(assert (=> b!1029000 m!948075))

(declare-fun m!948087 () Bool)

(assert (=> b!1029000 m!948087))

(declare-fun m!948089 () Bool)

(assert (=> b!1028994 m!948089))

(declare-fun m!948091 () Bool)

(assert (=> b!1028993 m!948091))

(declare-fun m!948093 () Bool)

(assert (=> b!1028993 m!948093))

(assert (=> b!1028993 m!948091))

(declare-fun m!948095 () Bool)

(assert (=> b!1028993 m!948095))

(declare-fun m!948097 () Bool)

(assert (=> b!1028993 m!948097))

(declare-fun m!948099 () Bool)

(assert (=> b!1028993 m!948099))

(declare-fun m!948101 () Bool)

(assert (=> b!1028993 m!948101))

(declare-fun m!948103 () Bool)

(assert (=> b!1028993 m!948103))

(declare-fun m!948105 () Bool)

(assert (=> b!1028993 m!948105))

(declare-fun m!948107 () Bool)

(assert (=> b!1028993 m!948107))

(declare-fun m!948109 () Bool)

(assert (=> b!1028993 m!948109))

(declare-fun m!948111 () Bool)

(assert (=> b!1028993 m!948111))

(assert (=> b!1028993 m!948105))

(declare-fun m!948113 () Bool)

(assert (=> b!1028993 m!948113))

(assert (=> b!1028993 m!948113))

(declare-fun m!948115 () Bool)

(assert (=> b!1028993 m!948115))

(assert (=> b!1028993 m!948075))

(declare-fun m!948117 () Bool)

(assert (=> b!1028993 m!948117))

(assert (=> b!1028993 m!948111))

(declare-fun m!948119 () Bool)

(assert (=> b!1028993 m!948119))

(declare-fun m!948121 () Bool)

(assert (=> b!1028993 m!948121))

(declare-fun m!948123 () Bool)

(assert (=> b!1028999 m!948123))

(declare-fun m!948125 () Bool)

(assert (=> bm!43408 m!948125))

(declare-fun m!948127 () Bool)

(assert (=> bm!43411 m!948127))

(declare-fun m!948129 () Bool)

(assert (=> bm!43409 m!948129))

(assert (=> d!123163 m!948073))

(assert (=> bm!43414 m!948117))

(declare-fun m!948131 () Bool)

(assert (=> b!1029005 m!948131))

(assert (=> b!1029003 m!948075))

(assert (=> b!1029003 m!948075))

(declare-fun m!948133 () Bool)

(assert (=> b!1029003 m!948133))

(assert (=> b!1028997 m!948011))

(declare-fun m!948135 () Bool)

(assert (=> b!1028997 m!948135))

(assert (=> b!1028997 m!948011))

(declare-fun m!948137 () Bool)

(assert (=> b!1028997 m!948137))

(assert (=> b!1028997 m!948075))

(declare-fun m!948139 () Bool)

(assert (=> b!1028997 m!948139))

(assert (=> b!1028997 m!948075))

(assert (=> b!1028997 m!948135))

(assert (=> b!1029008 m!948075))

(assert (=> b!1029008 m!948075))

(assert (=> b!1029008 m!948087))

(assert (=> b!1028886 d!123163))

(declare-fun d!123165 () Bool)

(declare-fun lt!453486 () (_ BitVec 32))

(assert (=> d!123165 (and (bvsge lt!453486 #b00000000000000000000000000000000) (bvsle lt!453486 (bvsub (size!31658 lt!453370) #b00000000000000000000000000000000)))))

(declare-fun e!580923 () (_ BitVec 32))

(assert (=> d!123165 (= lt!453486 e!580923)))

(declare-fun c!103907 () Bool)

(assert (=> d!123165 (= c!103907 (bvsge #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))))))

(assert (=> d!123165 (and (bvsle #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31658 (_keys!11269 thiss!1427)) (size!31658 lt!453370)))))

(assert (=> d!123165 (= (arrayCountValidKeys!0 lt!453370 #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))) lt!453486)))

(declare-fun b!1029020 () Bool)

(assert (=> b!1029020 (= e!580923 #b00000000000000000000000000000000)))

(declare-fun bm!43417 () Bool)

(declare-fun call!43420 () (_ BitVec 32))

(assert (=> bm!43417 (= call!43420 (arrayCountValidKeys!0 lt!453370 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31658 (_keys!11269 thiss!1427))))))

(declare-fun b!1029021 () Bool)

(declare-fun e!580922 () (_ BitVec 32))

(assert (=> b!1029021 (= e!580922 call!43420)))

(declare-fun b!1029022 () Bool)

(assert (=> b!1029022 (= e!580922 (bvadd #b00000000000000000000000000000001 call!43420))))

(declare-fun b!1029023 () Bool)

(assert (=> b!1029023 (= e!580923 e!580922)))

(declare-fun c!103908 () Bool)

(assert (=> b!1029023 (= c!103908 (validKeyInArray!0 (select (arr!31143 lt!453370) #b00000000000000000000000000000000)))))

(assert (= (and d!123165 c!103907) b!1029020))

(assert (= (and d!123165 (not c!103907)) b!1029023))

(assert (= (and b!1029023 c!103908) b!1029022))

(assert (= (and b!1029023 (not c!103908)) b!1029021))

(assert (= (or b!1029022 b!1029021) bm!43417))

(declare-fun m!948141 () Bool)

(assert (=> bm!43417 m!948141))

(assert (=> b!1029023 m!948075))

(assert (=> b!1029023 m!948075))

(assert (=> b!1029023 m!948087))

(assert (=> b!1028886 d!123165))

(declare-fun b!1029032 () Bool)

(declare-fun res!688415 () Bool)

(declare-fun e!580929 () Bool)

(assert (=> b!1029032 (=> (not res!688415) (not e!580929))))

(assert (=> b!1029032 (= res!688415 (validKeyInArray!0 (select (arr!31143 (_keys!11269 thiss!1427)) (index!41096 lt!453365))))))

(declare-fun b!1029034 () Bool)

(assert (=> b!1029034 (= e!580929 (bvslt (size!31658 (_keys!11269 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!123167 () Bool)

(declare-fun e!580928 () Bool)

(assert (=> d!123167 e!580928))

(declare-fun res!688417 () Bool)

(assert (=> d!123167 (=> (not res!688417) (not e!580928))))

(assert (=> d!123167 (= res!688417 (and (bvsge (index!41096 lt!453365) #b00000000000000000000000000000000) (bvslt (index!41096 lt!453365) (size!31658 (_keys!11269 thiss!1427)))))))

(declare-fun lt!453489 () Unit!33595)

(declare-fun choose!82 (array!64674 (_ BitVec 32) (_ BitVec 64)) Unit!33595)

(assert (=> d!123167 (= lt!453489 (choose!82 (_keys!11269 thiss!1427) (index!41096 lt!453365) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123167 e!580929))

(declare-fun res!688414 () Bool)

(assert (=> d!123167 (=> (not res!688414) (not e!580929))))

(assert (=> d!123167 (= res!688414 (and (bvsge (index!41096 lt!453365) #b00000000000000000000000000000000) (bvslt (index!41096 lt!453365) (size!31658 (_keys!11269 thiss!1427)))))))

(assert (=> d!123167 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11269 thiss!1427) (index!41096 lt!453365) #b1000000000000000000000000000000000000000000000000000000000000000) lt!453489)))

(declare-fun b!1029035 () Bool)

(assert (=> b!1029035 (= e!580928 (= (arrayCountValidKeys!0 (array!64675 (store (arr!31143 (_keys!11269 thiss!1427)) (index!41096 lt!453365) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31658 (_keys!11269 thiss!1427))) #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11269 thiss!1427) #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1029033 () Bool)

(declare-fun res!688416 () Bool)

(assert (=> b!1029033 (=> (not res!688416) (not e!580929))))

(assert (=> b!1029033 (= res!688416 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123167 res!688414) b!1029032))

(assert (= (and b!1029032 res!688415) b!1029033))

(assert (= (and b!1029033 res!688416) b!1029034))

(assert (= (and d!123167 res!688417) b!1029035))

(declare-fun m!948143 () Bool)

(assert (=> b!1029032 m!948143))

(assert (=> b!1029032 m!948143))

(declare-fun m!948145 () Bool)

(assert (=> b!1029032 m!948145))

(declare-fun m!948147 () Bool)

(assert (=> d!123167 m!948147))

(assert (=> b!1029035 m!947979))

(declare-fun m!948149 () Bool)

(assert (=> b!1029035 m!948149))

(assert (=> b!1029035 m!947987))

(declare-fun m!948151 () Bool)

(assert (=> b!1029033 m!948151))

(assert (=> b!1028886 d!123167))

(declare-fun d!123169 () Bool)

(declare-fun e!580932 () Bool)

(assert (=> d!123169 e!580932))

(declare-fun res!688420 () Bool)

(assert (=> d!123169 (=> (not res!688420) (not e!580932))))

(assert (=> d!123169 (= res!688420 (and (bvsge (index!41096 lt!453365) #b00000000000000000000000000000000) (bvslt (index!41096 lt!453365) (size!31658 (_keys!11269 thiss!1427)))))))

(declare-fun lt!453492 () Unit!33595)

(declare-fun choose!25 (array!64674 (_ BitVec 32) (_ BitVec 32)) Unit!33595)

(assert (=> d!123169 (= lt!453492 (choose!25 (_keys!11269 thiss!1427) (index!41096 lt!453365) (mask!29856 thiss!1427)))))

(assert (=> d!123169 (validMask!0 (mask!29856 thiss!1427))))

(assert (=> d!123169 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11269 thiss!1427) (index!41096 lt!453365) (mask!29856 thiss!1427)) lt!453492)))

(declare-fun b!1029038 () Bool)

(assert (=> b!1029038 (= e!580932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64675 (store (arr!31143 (_keys!11269 thiss!1427)) (index!41096 lt!453365) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31658 (_keys!11269 thiss!1427))) (mask!29856 thiss!1427)))))

(assert (= (and d!123169 res!688420) b!1029038))

(declare-fun m!948153 () Bool)

(assert (=> d!123169 m!948153))

(assert (=> d!123169 m!948073))

(assert (=> b!1029038 m!947979))

(declare-fun m!948155 () Bool)

(assert (=> b!1029038 m!948155))

(assert (=> b!1028886 d!123169))

(declare-fun b!1029047 () Bool)

(declare-fun e!580940 () Bool)

(declare-fun e!580939 () Bool)

(assert (=> b!1029047 (= e!580940 e!580939)))

(declare-fun lt!453499 () (_ BitVec 64))

(assert (=> b!1029047 (= lt!453499 (select (arr!31143 lt!453370) #b00000000000000000000000000000000))))

(declare-fun lt!453500 () Unit!33595)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64674 (_ BitVec 64) (_ BitVec 32)) Unit!33595)

(assert (=> b!1029047 (= lt!453500 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453370 lt!453499 #b00000000000000000000000000000000))))

(assert (=> b!1029047 (arrayContainsKey!0 lt!453370 lt!453499 #b00000000000000000000000000000000)))

(declare-fun lt!453501 () Unit!33595)

(assert (=> b!1029047 (= lt!453501 lt!453500)))

(declare-fun res!688425 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64674 (_ BitVec 32)) SeekEntryResult!9681)

(assert (=> b!1029047 (= res!688425 (= (seekEntryOrOpen!0 (select (arr!31143 lt!453370) #b00000000000000000000000000000000) lt!453370 (mask!29856 thiss!1427)) (Found!9681 #b00000000000000000000000000000000)))))

(assert (=> b!1029047 (=> (not res!688425) (not e!580939))))

(declare-fun d!123171 () Bool)

(declare-fun res!688426 () Bool)

(declare-fun e!580941 () Bool)

(assert (=> d!123171 (=> res!688426 e!580941)))

(assert (=> d!123171 (= res!688426 (bvsge #b00000000000000000000000000000000 (size!31658 lt!453370)))))

(assert (=> d!123171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453370 (mask!29856 thiss!1427)) e!580941)))

(declare-fun bm!43420 () Bool)

(declare-fun call!43423 () Bool)

(assert (=> bm!43420 (= call!43423 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453370 (mask!29856 thiss!1427)))))

(declare-fun b!1029048 () Bool)

(assert (=> b!1029048 (= e!580941 e!580940)))

(declare-fun c!103911 () Bool)

(assert (=> b!1029048 (= c!103911 (validKeyInArray!0 (select (arr!31143 lt!453370) #b00000000000000000000000000000000)))))

(declare-fun b!1029049 () Bool)

(assert (=> b!1029049 (= e!580940 call!43423)))

(declare-fun b!1029050 () Bool)

(assert (=> b!1029050 (= e!580939 call!43423)))

(assert (= (and d!123171 (not res!688426)) b!1029048))

(assert (= (and b!1029048 c!103911) b!1029047))

(assert (= (and b!1029048 (not c!103911)) b!1029049))

(assert (= (and b!1029047 res!688425) b!1029050))

(assert (= (or b!1029050 b!1029049) bm!43420))

(assert (=> b!1029047 m!948075))

(declare-fun m!948157 () Bool)

(assert (=> b!1029047 m!948157))

(declare-fun m!948159 () Bool)

(assert (=> b!1029047 m!948159))

(assert (=> b!1029047 m!948075))

(declare-fun m!948161 () Bool)

(assert (=> b!1029047 m!948161))

(declare-fun m!948163 () Bool)

(assert (=> bm!43420 m!948163))

(assert (=> b!1029048 m!948075))

(assert (=> b!1029048 m!948075))

(assert (=> b!1029048 m!948087))

(assert (=> b!1028886 d!123171))

(declare-fun b!1029061 () Bool)

(declare-fun e!580952 () Bool)

(declare-fun call!43426 () Bool)

(assert (=> b!1029061 (= e!580952 call!43426)))

(declare-fun d!123173 () Bool)

(declare-fun res!688434 () Bool)

(declare-fun e!580951 () Bool)

(assert (=> d!123173 (=> res!688434 e!580951)))

(assert (=> d!123173 (= res!688434 (bvsge #b00000000000000000000000000000000 (size!31658 lt!453370)))))

(assert (=> d!123173 (= (arrayNoDuplicates!0 lt!453370 #b00000000000000000000000000000000 Nil!21817) e!580951)))

(declare-fun b!1029062 () Bool)

(declare-fun e!580950 () Bool)

(assert (=> b!1029062 (= e!580950 e!580952)))

(declare-fun c!103914 () Bool)

(assert (=> b!1029062 (= c!103914 (validKeyInArray!0 (select (arr!31143 lt!453370) #b00000000000000000000000000000000)))))

(declare-fun b!1029063 () Bool)

(assert (=> b!1029063 (= e!580951 e!580950)))

(declare-fun res!688433 () Bool)

(assert (=> b!1029063 (=> (not res!688433) (not e!580950))))

(declare-fun e!580953 () Bool)

(assert (=> b!1029063 (= res!688433 (not e!580953))))

(declare-fun res!688435 () Bool)

(assert (=> b!1029063 (=> (not res!688435) (not e!580953))))

(assert (=> b!1029063 (= res!688435 (validKeyInArray!0 (select (arr!31143 lt!453370) #b00000000000000000000000000000000)))))

(declare-fun b!1029064 () Bool)

(assert (=> b!1029064 (= e!580952 call!43426)))

(declare-fun b!1029065 () Bool)

(declare-fun contains!5971 (List!21820 (_ BitVec 64)) Bool)

(assert (=> b!1029065 (= e!580953 (contains!5971 Nil!21817 (select (arr!31143 lt!453370) #b00000000000000000000000000000000)))))

(declare-fun bm!43423 () Bool)

(assert (=> bm!43423 (= call!43426 (arrayNoDuplicates!0 lt!453370 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103914 (Cons!21816 (select (arr!31143 lt!453370) #b00000000000000000000000000000000) Nil!21817) Nil!21817)))))

(assert (= (and d!123173 (not res!688434)) b!1029063))

(assert (= (and b!1029063 res!688435) b!1029065))

(assert (= (and b!1029063 res!688433) b!1029062))

(assert (= (and b!1029062 c!103914) b!1029064))

(assert (= (and b!1029062 (not c!103914)) b!1029061))

(assert (= (or b!1029064 b!1029061) bm!43423))

(assert (=> b!1029062 m!948075))

(assert (=> b!1029062 m!948075))

(assert (=> b!1029062 m!948087))

(assert (=> b!1029063 m!948075))

(assert (=> b!1029063 m!948075))

(assert (=> b!1029063 m!948087))

(assert (=> b!1029065 m!948075))

(assert (=> b!1029065 m!948075))

(declare-fun m!948165 () Bool)

(assert (=> b!1029065 m!948165))

(assert (=> bm!43423 m!948075))

(declare-fun m!948167 () Bool)

(assert (=> bm!43423 m!948167))

(assert (=> b!1028886 d!123173))

(declare-fun d!123175 () Bool)

(declare-fun e!580956 () Bool)

(assert (=> d!123175 e!580956))

(declare-fun res!688438 () Bool)

(assert (=> d!123175 (=> (not res!688438) (not e!580956))))

(assert (=> d!123175 (= res!688438 (and (bvsge (index!41096 lt!453365) #b00000000000000000000000000000000) (bvslt (index!41096 lt!453365) (size!31658 (_keys!11269 thiss!1427)))))))

(declare-fun lt!453504 () Unit!33595)

(declare-fun choose!1688 (array!64674 array!64676 (_ BitVec 32) (_ BitVec 32) V!37285 V!37285 (_ BitVec 32) (_ BitVec 64) Int) Unit!33595)

(assert (=> d!123175 (= lt!453504 (choose!1688 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) (index!41096 lt!453365) key!909 (defaultEntry!6110 thiss!1427)))))

(assert (=> d!123175 (validMask!0 (mask!29856 thiss!1427))))

(assert (=> d!123175 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!8 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) (index!41096 lt!453365) key!909 (defaultEntry!6110 thiss!1427)) lt!453504)))

(declare-fun b!1029068 () Bool)

(assert (=> b!1029068 (= e!580956 (= (-!482 (getCurrentListMap!3903 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)) key!909) (getCurrentListMap!3903 (array!64675 (store (arr!31143 (_keys!11269 thiss!1427)) (index!41096 lt!453365) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31658 (_keys!11269 thiss!1427))) (array!64677 (store (arr!31144 (_values!6133 thiss!1427)) (index!41096 lt!453365) (ValueCellFull!11451 (dynLambda!1952 (defaultEntry!6110 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31659 (_values!6133 thiss!1427))) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427))))))

(assert (=> b!1029068 (bvslt (index!41096 lt!453365) (size!31659 (_values!6133 thiss!1427)))))

(assert (= (and d!123175 res!688438) b!1029068))

(declare-fun b_lambda!15837 () Bool)

(assert (=> (not b_lambda!15837) (not b!1029068)))

(assert (=> b!1029068 t!30902))

(declare-fun b_and!32907 () Bool)

(assert (= b_and!32905 (and (=> t!30902 result!14135) b_and!32907)))

(declare-fun m!948169 () Bool)

(assert (=> d!123175 m!948169))

(assert (=> d!123175 m!948073))

(assert (=> b!1029068 m!947979))

(declare-fun m!948171 () Bool)

(assert (=> b!1029068 m!948171))

(assert (=> b!1029068 m!948001))

(assert (=> b!1029068 m!947993))

(assert (=> b!1029068 m!948007))

(assert (=> b!1029068 m!948011))

(assert (=> b!1029068 m!947993))

(assert (=> b!1028886 d!123175))

(declare-fun b!1029069 () Bool)

(declare-fun e!580960 () ListLongMap!13679)

(declare-fun e!580962 () ListLongMap!13679)

(assert (=> b!1029069 (= e!580960 e!580962)))

(declare-fun c!103916 () Bool)

(assert (=> b!1029069 (= c!103916 (and (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029070 () Bool)

(declare-fun e!580963 () Bool)

(declare-fun call!43433 () Bool)

(assert (=> b!1029070 (= e!580963 (not call!43433))))

(declare-fun b!1029072 () Bool)

(declare-fun e!580961 () Bool)

(declare-fun lt!453505 () ListLongMap!13679)

(assert (=> b!1029072 (= e!580961 (= (apply!902 lt!453505 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5946 thiss!1427)))))

(declare-fun b!1029073 () Bool)

(declare-fun e!580958 () Bool)

(declare-fun call!43428 () Bool)

(assert (=> b!1029073 (= e!580958 (not call!43428))))

(declare-fun bm!43424 () Bool)

(assert (=> bm!43424 (= call!43433 (contains!5970 lt!453505 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029074 () Bool)

(declare-fun res!688447 () Bool)

(declare-fun e!580959 () Bool)

(assert (=> b!1029074 (=> (not res!688447) (not e!580959))))

(assert (=> b!1029074 (= res!688447 e!580958)))

(declare-fun c!103917 () Bool)

(assert (=> b!1029074 (= c!103917 (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1029075 () Bool)

(declare-fun e!580969 () Bool)

(assert (=> b!1029075 (= e!580969 (= (apply!902 lt!453505 (select (arr!31143 (_keys!11269 thiss!1427)) #b00000000000000000000000000000000)) (get!16353 (select (arr!31144 (_values!6133 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1952 (defaultEntry!6110 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31659 (_values!6133 thiss!1427))))))

(assert (=> b!1029075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))))))

(declare-fun b!1029076 () Bool)

(declare-fun e!580967 () Bool)

(assert (=> b!1029076 (= e!580963 e!580967)))

(declare-fun res!688446 () Bool)

(assert (=> b!1029076 (= res!688446 call!43433)))

(assert (=> b!1029076 (=> (not res!688446) (not e!580967))))

(declare-fun b!1029077 () Bool)

(declare-fun call!43431 () ListLongMap!13679)

(assert (=> b!1029077 (= e!580960 (+!3100 call!43431 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5946 thiss!1427))))))

(declare-fun d!123177 () Bool)

(assert (=> d!123177 e!580959))

(declare-fun res!688444 () Bool)

(assert (=> d!123177 (=> (not res!688444) (not e!580959))))

(assert (=> d!123177 (= res!688444 (or (bvsge #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))))))))

(declare-fun lt!453521 () ListLongMap!13679)

(assert (=> d!123177 (= lt!453505 lt!453521)))

(declare-fun lt!453522 () Unit!33595)

(declare-fun e!580964 () Unit!33595)

(assert (=> d!123177 (= lt!453522 e!580964)))

(declare-fun c!103919 () Bool)

(declare-fun e!580965 () Bool)

(assert (=> d!123177 (= c!103919 e!580965)))

(declare-fun res!688445 () Bool)

(assert (=> d!123177 (=> (not res!688445) (not e!580965))))

(assert (=> d!123177 (= res!688445 (bvslt #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))))))

(assert (=> d!123177 (= lt!453521 e!580960)))

(declare-fun c!103918 () Bool)

(assert (=> d!123177 (= c!103918 (and (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123177 (validMask!0 (mask!29856 thiss!1427))))

(assert (=> d!123177 (= (getCurrentListMap!3903 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)) lt!453505)))

(declare-fun b!1029071 () Bool)

(declare-fun lt!453510 () Unit!33595)

(assert (=> b!1029071 (= e!580964 lt!453510)))

(declare-fun lt!453509 () ListLongMap!13679)

(assert (=> b!1029071 (= lt!453509 (getCurrentListMapNoExtraKeys!3516 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)))))

(declare-fun lt!453523 () (_ BitVec 64))

(assert (=> b!1029071 (= lt!453523 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453519 () (_ BitVec 64))

(assert (=> b!1029071 (= lt!453519 (select (arr!31143 (_keys!11269 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453512 () Unit!33595)

(assert (=> b!1029071 (= lt!453512 (addStillContains!621 lt!453509 lt!453523 (zeroValue!5946 thiss!1427) lt!453519))))

(assert (=> b!1029071 (contains!5970 (+!3100 lt!453509 (tuple2!15553 lt!453523 (zeroValue!5946 thiss!1427))) lt!453519)))

(declare-fun lt!453515 () Unit!33595)

(assert (=> b!1029071 (= lt!453515 lt!453512)))

(declare-fun lt!453518 () ListLongMap!13679)

(assert (=> b!1029071 (= lt!453518 (getCurrentListMapNoExtraKeys!3516 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)))))

(declare-fun lt!453506 () (_ BitVec 64))

(assert (=> b!1029071 (= lt!453506 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453526 () (_ BitVec 64))

(assert (=> b!1029071 (= lt!453526 (select (arr!31143 (_keys!11269 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453511 () Unit!33595)

(assert (=> b!1029071 (= lt!453511 (addApplyDifferent!481 lt!453518 lt!453506 (minValue!5946 thiss!1427) lt!453526))))

(assert (=> b!1029071 (= (apply!902 (+!3100 lt!453518 (tuple2!15553 lt!453506 (minValue!5946 thiss!1427))) lt!453526) (apply!902 lt!453518 lt!453526))))

(declare-fun lt!453507 () Unit!33595)

(assert (=> b!1029071 (= lt!453507 lt!453511)))

(declare-fun lt!453525 () ListLongMap!13679)

(assert (=> b!1029071 (= lt!453525 (getCurrentListMapNoExtraKeys!3516 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)))))

(declare-fun lt!453516 () (_ BitVec 64))

(assert (=> b!1029071 (= lt!453516 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453508 () (_ BitVec 64))

(assert (=> b!1029071 (= lt!453508 (select (arr!31143 (_keys!11269 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453524 () Unit!33595)

(assert (=> b!1029071 (= lt!453524 (addApplyDifferent!481 lt!453525 lt!453516 (zeroValue!5946 thiss!1427) lt!453508))))

(assert (=> b!1029071 (= (apply!902 (+!3100 lt!453525 (tuple2!15553 lt!453516 (zeroValue!5946 thiss!1427))) lt!453508) (apply!902 lt!453525 lt!453508))))

(declare-fun lt!453517 () Unit!33595)

(assert (=> b!1029071 (= lt!453517 lt!453524)))

(declare-fun lt!453513 () ListLongMap!13679)

(assert (=> b!1029071 (= lt!453513 (getCurrentListMapNoExtraKeys!3516 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)))))

(declare-fun lt!453514 () (_ BitVec 64))

(assert (=> b!1029071 (= lt!453514 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453520 () (_ BitVec 64))

(assert (=> b!1029071 (= lt!453520 (select (arr!31143 (_keys!11269 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029071 (= lt!453510 (addApplyDifferent!481 lt!453513 lt!453514 (minValue!5946 thiss!1427) lt!453520))))

(assert (=> b!1029071 (= (apply!902 (+!3100 lt!453513 (tuple2!15553 lt!453514 (minValue!5946 thiss!1427))) lt!453520) (apply!902 lt!453513 lt!453520))))

(declare-fun b!1029078 () Bool)

(declare-fun e!580968 () Bool)

(assert (=> b!1029078 (= e!580968 (validKeyInArray!0 (select (arr!31143 (_keys!11269 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029079 () Bool)

(assert (=> b!1029079 (= e!580959 e!580963)))

(declare-fun c!103920 () Bool)

(assert (=> b!1029079 (= c!103920 (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43425 () Bool)

(declare-fun call!43427 () ListLongMap!13679)

(declare-fun call!43432 () ListLongMap!13679)

(declare-fun call!43430 () ListLongMap!13679)

(assert (=> bm!43425 (= call!43431 (+!3100 (ite c!103918 call!43432 (ite c!103916 call!43427 call!43430)) (ite (or c!103918 c!103916) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5946 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5946 thiss!1427)))))))

(declare-fun b!1029080 () Bool)

(declare-fun c!103915 () Bool)

(assert (=> b!1029080 (= c!103915 (and (not (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5842 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!580966 () ListLongMap!13679)

(assert (=> b!1029080 (= e!580962 e!580966)))

(declare-fun bm!43426 () Bool)

(declare-fun call!43429 () ListLongMap!13679)

(assert (=> bm!43426 (= call!43429 call!43431)))

(declare-fun b!1029081 () Bool)

(declare-fun e!580957 () Bool)

(assert (=> b!1029081 (= e!580957 e!580969)))

(declare-fun res!688441 () Bool)

(assert (=> b!1029081 (=> (not res!688441) (not e!580969))))

(assert (=> b!1029081 (= res!688441 (contains!5970 lt!453505 (select (arr!31143 (_keys!11269 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029081 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))))))

(declare-fun bm!43427 () Bool)

(assert (=> bm!43427 (= call!43428 (contains!5970 lt!453505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029082 () Bool)

(assert (=> b!1029082 (= e!580966 call!43429)))

(declare-fun b!1029083 () Bool)

(assert (=> b!1029083 (= e!580967 (= (apply!902 lt!453505 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5946 thiss!1427)))))

(declare-fun b!1029084 () Bool)

(assert (=> b!1029084 (= e!580958 e!580961)))

(declare-fun res!688442 () Bool)

(assert (=> b!1029084 (= res!688442 call!43428)))

(assert (=> b!1029084 (=> (not res!688442) (not e!580961))))

(declare-fun b!1029085 () Bool)

(assert (=> b!1029085 (= e!580962 call!43429)))

(declare-fun b!1029086 () Bool)

(assert (=> b!1029086 (= e!580965 (validKeyInArray!0 (select (arr!31143 (_keys!11269 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43428 () Bool)

(assert (=> bm!43428 (= call!43430 call!43427)))

(declare-fun b!1029087 () Bool)

(declare-fun Unit!33600 () Unit!33595)

(assert (=> b!1029087 (= e!580964 Unit!33600)))

(declare-fun bm!43429 () Bool)

(assert (=> bm!43429 (= call!43427 call!43432)))

(declare-fun bm!43430 () Bool)

(assert (=> bm!43430 (= call!43432 (getCurrentListMapNoExtraKeys!3516 (_keys!11269 thiss!1427) (_values!6133 thiss!1427) (mask!29856 thiss!1427) (extraKeys!5842 thiss!1427) (zeroValue!5946 thiss!1427) (minValue!5946 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6110 thiss!1427)))))

(declare-fun b!1029088 () Bool)

(declare-fun res!688443 () Bool)

(assert (=> b!1029088 (=> (not res!688443) (not e!580959))))

(assert (=> b!1029088 (= res!688443 e!580957)))

(declare-fun res!688440 () Bool)

(assert (=> b!1029088 (=> res!688440 e!580957)))

(assert (=> b!1029088 (= res!688440 (not e!580968))))

(declare-fun res!688439 () Bool)

(assert (=> b!1029088 (=> (not res!688439) (not e!580968))))

(assert (=> b!1029088 (= res!688439 (bvslt #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))))))

(declare-fun b!1029089 () Bool)

(assert (=> b!1029089 (= e!580966 call!43430)))

(assert (= (and d!123177 c!103918) b!1029077))

(assert (= (and d!123177 (not c!103918)) b!1029069))

(assert (= (and b!1029069 c!103916) b!1029085))

(assert (= (and b!1029069 (not c!103916)) b!1029080))

(assert (= (and b!1029080 c!103915) b!1029082))

(assert (= (and b!1029080 (not c!103915)) b!1029089))

(assert (= (or b!1029082 b!1029089) bm!43428))

(assert (= (or b!1029085 bm!43428) bm!43429))

(assert (= (or b!1029085 b!1029082) bm!43426))

(assert (= (or b!1029077 bm!43429) bm!43430))

(assert (= (or b!1029077 bm!43426) bm!43425))

(assert (= (and d!123177 res!688445) b!1029086))

(assert (= (and d!123177 c!103919) b!1029071))

(assert (= (and d!123177 (not c!103919)) b!1029087))

(assert (= (and d!123177 res!688444) b!1029088))

(assert (= (and b!1029088 res!688439) b!1029078))

(assert (= (and b!1029088 (not res!688440)) b!1029081))

(assert (= (and b!1029081 res!688441) b!1029075))

(assert (= (and b!1029088 res!688443) b!1029074))

(assert (= (and b!1029074 c!103917) b!1029084))

(assert (= (and b!1029074 (not c!103917)) b!1029073))

(assert (= (and b!1029084 res!688442) b!1029072))

(assert (= (or b!1029084 b!1029073) bm!43427))

(assert (= (and b!1029074 res!688447) b!1029079))

(assert (= (and b!1029079 c!103920) b!1029076))

(assert (= (and b!1029079 (not c!103920)) b!1029070))

(assert (= (and b!1029076 res!688446) b!1029083))

(assert (= (or b!1029076 b!1029070) bm!43424))

(declare-fun b_lambda!15839 () Bool)

(assert (=> (not b_lambda!15839) (not b!1029075)))

(assert (=> b!1029075 t!30902))

(declare-fun b_and!32909 () Bool)

(assert (= b_and!32907 (and (=> t!30902 result!14135) b_and!32909)))

(declare-fun m!948173 () Bool)

(assert (=> b!1029078 m!948173))

(assert (=> b!1029078 m!948173))

(declare-fun m!948175 () Bool)

(assert (=> b!1029078 m!948175))

(declare-fun m!948177 () Bool)

(assert (=> b!1029072 m!948177))

(declare-fun m!948179 () Bool)

(assert (=> b!1029071 m!948179))

(declare-fun m!948181 () Bool)

(assert (=> b!1029071 m!948181))

(assert (=> b!1029071 m!948179))

(declare-fun m!948183 () Bool)

(assert (=> b!1029071 m!948183))

(declare-fun m!948185 () Bool)

(assert (=> b!1029071 m!948185))

(declare-fun m!948187 () Bool)

(assert (=> b!1029071 m!948187))

(declare-fun m!948189 () Bool)

(assert (=> b!1029071 m!948189))

(declare-fun m!948191 () Bool)

(assert (=> b!1029071 m!948191))

(declare-fun m!948193 () Bool)

(assert (=> b!1029071 m!948193))

(declare-fun m!948195 () Bool)

(assert (=> b!1029071 m!948195))

(declare-fun m!948197 () Bool)

(assert (=> b!1029071 m!948197))

(declare-fun m!948199 () Bool)

(assert (=> b!1029071 m!948199))

(assert (=> b!1029071 m!948193))

(declare-fun m!948201 () Bool)

(assert (=> b!1029071 m!948201))

(assert (=> b!1029071 m!948201))

(declare-fun m!948203 () Bool)

(assert (=> b!1029071 m!948203))

(assert (=> b!1029071 m!948173))

(declare-fun m!948205 () Bool)

(assert (=> b!1029071 m!948205))

(assert (=> b!1029071 m!948199))

(declare-fun m!948207 () Bool)

(assert (=> b!1029071 m!948207))

(declare-fun m!948209 () Bool)

(assert (=> b!1029071 m!948209))

(declare-fun m!948211 () Bool)

(assert (=> b!1029077 m!948211))

(declare-fun m!948213 () Bool)

(assert (=> bm!43424 m!948213))

(declare-fun m!948215 () Bool)

(assert (=> bm!43427 m!948215))

(declare-fun m!948217 () Bool)

(assert (=> bm!43425 m!948217))

(assert (=> d!123177 m!948073))

(assert (=> bm!43430 m!948205))

(declare-fun m!948219 () Bool)

(assert (=> b!1029083 m!948219))

(assert (=> b!1029081 m!948173))

(assert (=> b!1029081 m!948173))

(declare-fun m!948221 () Bool)

(assert (=> b!1029081 m!948221))

(assert (=> b!1029075 m!948011))

(declare-fun m!948223 () Bool)

(assert (=> b!1029075 m!948223))

(assert (=> b!1029075 m!948011))

(declare-fun m!948225 () Bool)

(assert (=> b!1029075 m!948225))

(assert (=> b!1029075 m!948173))

(declare-fun m!948227 () Bool)

(assert (=> b!1029075 m!948227))

(assert (=> b!1029075 m!948173))

(assert (=> b!1029075 m!948223))

(assert (=> b!1029086 m!948173))

(assert (=> b!1029086 m!948173))

(assert (=> b!1029086 m!948175))

(assert (=> b!1028886 d!123177))

(declare-fun d!123179 () Bool)

(declare-fun lt!453527 () (_ BitVec 32))

(assert (=> d!123179 (and (bvsge lt!453527 #b00000000000000000000000000000000) (bvsle lt!453527 (bvsub (size!31658 (_keys!11269 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!580971 () (_ BitVec 32))

(assert (=> d!123179 (= lt!453527 e!580971)))

(declare-fun c!103921 () Bool)

(assert (=> d!123179 (= c!103921 (bvsge #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))))))

(assert (=> d!123179 (and (bvsle #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31658 (_keys!11269 thiss!1427)) (size!31658 (_keys!11269 thiss!1427))))))

(assert (=> d!123179 (= (arrayCountValidKeys!0 (_keys!11269 thiss!1427) #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))) lt!453527)))

(declare-fun b!1029090 () Bool)

(assert (=> b!1029090 (= e!580971 #b00000000000000000000000000000000)))

(declare-fun bm!43431 () Bool)

(declare-fun call!43434 () (_ BitVec 32))

(assert (=> bm!43431 (= call!43434 (arrayCountValidKeys!0 (_keys!11269 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31658 (_keys!11269 thiss!1427))))))

(declare-fun b!1029091 () Bool)

(declare-fun e!580970 () (_ BitVec 32))

(assert (=> b!1029091 (= e!580970 call!43434)))

(declare-fun b!1029092 () Bool)

(assert (=> b!1029092 (= e!580970 (bvadd #b00000000000000000000000000000001 call!43434))))

(declare-fun b!1029093 () Bool)

(assert (=> b!1029093 (= e!580971 e!580970)))

(declare-fun c!103922 () Bool)

(assert (=> b!1029093 (= c!103922 (validKeyInArray!0 (select (arr!31143 (_keys!11269 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123179 c!103921) b!1029090))

(assert (= (and d!123179 (not c!103921)) b!1029093))

(assert (= (and b!1029093 c!103922) b!1029092))

(assert (= (and b!1029093 (not c!103922)) b!1029091))

(assert (= (or b!1029092 b!1029091) bm!43431))

(declare-fun m!948229 () Bool)

(assert (=> bm!43431 m!948229))

(assert (=> b!1029093 m!948173))

(assert (=> b!1029093 m!948173))

(assert (=> b!1029093 m!948175))

(assert (=> b!1028886 d!123179))

(declare-fun d!123181 () Bool)

(declare-fun e!580974 () Bool)

(assert (=> d!123181 e!580974))

(declare-fun res!688450 () Bool)

(assert (=> d!123181 (=> (not res!688450) (not e!580974))))

(assert (=> d!123181 (= res!688450 (bvslt (index!41096 lt!453365) (size!31658 (_keys!11269 thiss!1427))))))

(declare-fun lt!453530 () Unit!33595)

(declare-fun choose!121 (array!64674 (_ BitVec 32) (_ BitVec 64)) Unit!33595)

(assert (=> d!123181 (= lt!453530 (choose!121 (_keys!11269 thiss!1427) (index!41096 lt!453365) key!909))))

(assert (=> d!123181 (bvsge (index!41096 lt!453365) #b00000000000000000000000000000000)))

(assert (=> d!123181 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11269 thiss!1427) (index!41096 lt!453365) key!909) lt!453530)))

(declare-fun b!1029096 () Bool)

(assert (=> b!1029096 (= e!580974 (not (arrayContainsKey!0 (array!64675 (store (arr!31143 (_keys!11269 thiss!1427)) (index!41096 lt!453365) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31658 (_keys!11269 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123181 res!688450) b!1029096))

(declare-fun m!948231 () Bool)

(assert (=> d!123181 m!948231))

(assert (=> b!1029096 m!947979))

(declare-fun m!948233 () Bool)

(assert (=> b!1029096 m!948233))

(assert (=> b!1028886 d!123181))

(declare-fun d!123183 () Bool)

(declare-fun res!688457 () Bool)

(declare-fun e!580977 () Bool)

(assert (=> d!123183 (=> (not res!688457) (not e!580977))))

(declare-fun simpleValid!393 (LongMapFixedSize!5496) Bool)

(assert (=> d!123183 (= res!688457 (simpleValid!393 thiss!1427))))

(assert (=> d!123183 (= (valid!2081 thiss!1427) e!580977)))

(declare-fun b!1029103 () Bool)

(declare-fun res!688458 () Bool)

(assert (=> b!1029103 (=> (not res!688458) (not e!580977))))

(assert (=> b!1029103 (= res!688458 (= (arrayCountValidKeys!0 (_keys!11269 thiss!1427) #b00000000000000000000000000000000 (size!31658 (_keys!11269 thiss!1427))) (_size!2803 thiss!1427)))))

(declare-fun b!1029104 () Bool)

(declare-fun res!688459 () Bool)

(assert (=> b!1029104 (=> (not res!688459) (not e!580977))))

(assert (=> b!1029104 (= res!688459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11269 thiss!1427) (mask!29856 thiss!1427)))))

(declare-fun b!1029105 () Bool)

(assert (=> b!1029105 (= e!580977 (arrayNoDuplicates!0 (_keys!11269 thiss!1427) #b00000000000000000000000000000000 Nil!21817))))

(assert (= (and d!123183 res!688457) b!1029103))

(assert (= (and b!1029103 res!688458) b!1029104))

(assert (= (and b!1029104 res!688459) b!1029105))

(declare-fun m!948235 () Bool)

(assert (=> d!123183 m!948235))

(assert (=> b!1029103 m!947987))

(declare-fun m!948237 () Bool)

(assert (=> b!1029104 m!948237))

(declare-fun m!948239 () Bool)

(assert (=> b!1029105 m!948239))

(assert (=> start!89770 d!123183))

(declare-fun mapNonEmpty!37909 () Bool)

(declare-fun mapRes!37909 () Bool)

(declare-fun tp!72833 () Bool)

(declare-fun e!580983 () Bool)

(assert (=> mapNonEmpty!37909 (= mapRes!37909 (and tp!72833 e!580983))))

(declare-fun mapKey!37909 () (_ BitVec 32))

(declare-fun mapRest!37909 () (Array (_ BitVec 32) ValueCell!11451))

(declare-fun mapValue!37909 () ValueCell!11451)

(assert (=> mapNonEmpty!37909 (= mapRest!37903 (store mapRest!37909 mapKey!37909 mapValue!37909))))

(declare-fun b!1029112 () Bool)

(assert (=> b!1029112 (= e!580983 tp_is_empty!24309)))

(declare-fun condMapEmpty!37909 () Bool)

(declare-fun mapDefault!37909 () ValueCell!11451)

(assert (=> mapNonEmpty!37903 (= condMapEmpty!37909 (= mapRest!37903 ((as const (Array (_ BitVec 32) ValueCell!11451)) mapDefault!37909)))))

(declare-fun e!580982 () Bool)

(assert (=> mapNonEmpty!37903 (= tp!72824 (and e!580982 mapRes!37909))))

(declare-fun mapIsEmpty!37909 () Bool)

(assert (=> mapIsEmpty!37909 mapRes!37909))

(declare-fun b!1029113 () Bool)

(assert (=> b!1029113 (= e!580982 tp_is_empty!24309)))

(assert (= (and mapNonEmpty!37903 condMapEmpty!37909) mapIsEmpty!37909))

(assert (= (and mapNonEmpty!37903 (not condMapEmpty!37909)) mapNonEmpty!37909))

(assert (= (and mapNonEmpty!37909 ((_ is ValueCellFull!11451) mapValue!37909)) b!1029112))

(assert (= (and mapNonEmpty!37903 ((_ is ValueCellFull!11451) mapDefault!37909)) b!1029113))

(declare-fun m!948241 () Bool)

(assert (=> mapNonEmpty!37909 m!948241))

(declare-fun b_lambda!15841 () Bool)

(assert (= b_lambda!15839 (or (and b!1028889 b_free!20589) b_lambda!15841)))

(declare-fun b_lambda!15843 () Bool)

(assert (= b_lambda!15835 (or (and b!1028889 b_free!20589) b_lambda!15843)))

(declare-fun b_lambda!15845 () Bool)

(assert (= b_lambda!15837 (or (and b!1028889 b_free!20589) b_lambda!15845)))

(check-sat (not d!123181) (not bm!43408) (not d!123169) tp_is_empty!24309 (not b!1029047) (not b_lambda!15841) (not b!1029078) (not b!1029048) (not d!123175) (not d!123157) (not b!1029062) (not d!123159) (not bm!43423) (not bm!43424) (not d!123153) (not b!1029093) (not b!1028997) (not b!1029038) (not b!1028994) (not bm!43409) (not b_lambda!15843) (not b!1028993) (not b!1029103) (not bm!43427) (not b!1029033) (not b!1029008) (not b_lambda!15833) (not b!1029035) (not bm!43430) (not b!1029077) (not d!123167) (not b!1029065) (not b!1029104) (not d!123183) (not b!1029096) (not b_lambda!15845) (not bm!43411) (not b!1029105) b_and!32909 (not b!1029003) (not b!1029032) (not b!1029081) (not b!1028937) (not bm!43431) (not d!123163) (not b!1029000) (not b!1029086) (not bm!43414) (not b!1029071) (not b!1028945) (not b_next!20589) (not b!1029063) (not b!1029072) (not bm!43417) (not d!123177) (not b!1029068) (not bm!43420) (not b!1028999) (not bm!43425) (not b!1029083) (not b!1029075) (not b!1028948) (not b!1029023) (not mapNonEmpty!37909) (not b!1029005))
(check-sat b_and!32909 (not b_next!20589))
