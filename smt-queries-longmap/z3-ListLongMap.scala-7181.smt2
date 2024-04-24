; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92166 () Bool)

(assert start!92166)

(declare-fun b!1046860 () Bool)

(declare-fun b_free!21139 () Bool)

(declare-fun b_next!21139 () Bool)

(assert (=> b!1046860 (= b_free!21139 (not b_next!21139))))

(declare-fun tp!74676 () Bool)

(declare-fun b_and!33775 () Bool)

(assert (=> b!1046860 (= tp!74676 b_and!33775)))

(declare-fun b!1046854 () Bool)

(declare-fun e!593518 () Bool)

(declare-fun e!593516 () Bool)

(assert (=> b!1046854 (= e!593518 (not e!593516))))

(declare-fun res!696659 () Bool)

(assert (=> b!1046854 (=> res!696659 e!593516)))

(declare-datatypes ((V!38019 0))(
  ( (V!38020 (val!12480 Int)) )
))
(declare-datatypes ((ValueCell!11726 0))(
  ( (ValueCellFull!11726 (v!15072 V!38019)) (EmptyCell!11726) )
))
(declare-datatypes ((Unit!34165 0))(
  ( (Unit!34166) )
))
(declare-datatypes ((array!65943 0))(
  ( (array!65944 (arr!31711 (Array (_ BitVec 32) (_ BitVec 64))) (size!32247 (_ BitVec 32))) )
))
(declare-datatypes ((array!65945 0))(
  ( (array!65946 (arr!31712 (Array (_ BitVec 32) ValueCell!11726)) (size!32248 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6046 0))(
  ( (LongMapFixedSize!6047 (defaultEntry!6419 Int) (mask!30610 (_ BitVec 32)) (extraKeys!6147 (_ BitVec 32)) (zeroValue!6253 V!38019) (minValue!6253 V!38019) (_size!3078 (_ BitVec 32)) (_keys!11729 array!65943) (_values!6442 array!65945) (_vacant!3078 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15790 0))(
  ( (tuple2!15791 (_1!7906 Unit!34165) (_2!7906 LongMapFixedSize!6046)) )
))
(declare-fun lt!462111 () tuple2!15790)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15792 0))(
  ( (tuple2!15793 (_1!7907 (_ BitVec 64)) (_2!7907 V!38019)) )
))
(declare-datatypes ((List!22011 0))(
  ( (Nil!22008) (Cons!22007 (h!23224 tuple2!15792) (t!31271 List!22011)) )
))
(declare-datatypes ((ListLongMap!13799 0))(
  ( (ListLongMap!13800 (toList!6915 List!22011)) )
))
(declare-fun contains!6109 (ListLongMap!13799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3959 (array!65943 array!65945 (_ BitVec 32) (_ BitVec 32) V!38019 V!38019 (_ BitVec 32) Int) ListLongMap!13799)

(assert (=> b!1046854 (= res!696659 (not (contains!6109 (getCurrentListMap!3959 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111))) key!909)))))

(declare-fun lt!462109 () array!65943)

(declare-fun thiss!1427 () LongMapFixedSize!6046)

(declare-fun lt!462112 () array!65945)

(declare-fun Unit!34167 () Unit!34165)

(declare-fun Unit!34168 () Unit!34165)

(assert (=> b!1046854 (= lt!462111 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3078 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15791 Unit!34167 (LongMapFixedSize!6047 (defaultEntry!6419 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) (bvsub (_size!3078 thiss!1427) #b00000000000000000000000000000001) lt!462109 lt!462112 (bvadd #b00000000000000000000000000000001 (_vacant!3078 thiss!1427)))) (tuple2!15791 Unit!34168 (LongMapFixedSize!6047 (defaultEntry!6419 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) (bvsub (_size!3078 thiss!1427) #b00000000000000000000000000000001) lt!462109 lt!462112 (_vacant!3078 thiss!1427)))))))

(declare-fun -!538 (ListLongMap!13799 (_ BitVec 64)) ListLongMap!13799)

(assert (=> b!1046854 (= (-!538 (getCurrentListMap!3959 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)) key!909) (getCurrentListMap!3959 lt!462109 lt!462112 (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9804 0))(
  ( (MissingZero!9804 (index!41587 (_ BitVec 32))) (Found!9804 (index!41588 (_ BitVec 32))) (Intermediate!9804 (undefined!10616 Bool) (index!41589 (_ BitVec 32)) (x!93368 (_ BitVec 32))) (Undefined!9804) (MissingVacant!9804 (index!41590 (_ BitVec 32))) )
))
(declare-fun lt!462114 () SeekEntryResult!9804)

(declare-fun dynLambda!2030 (Int (_ BitVec 64)) V!38019)

(assert (=> b!1046854 (= lt!462112 (array!65946 (store (arr!31712 (_values!6442 thiss!1427)) (index!41588 lt!462114) (ValueCellFull!11726 (dynLambda!2030 (defaultEntry!6419 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32248 (_values!6442 thiss!1427))))))

(declare-fun lt!462110 () Unit!34165)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!60 (array!65943 array!65945 (_ BitVec 32) (_ BitVec 32) V!38019 V!38019 (_ BitVec 32) (_ BitVec 64) Int) Unit!34165)

(assert (=> b!1046854 (= lt!462110 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!60 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) (index!41588 lt!462114) key!909 (defaultEntry!6419 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046854 (not (arrayContainsKey!0 lt!462109 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462113 () Unit!34165)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65943 (_ BitVec 32) (_ BitVec 64)) Unit!34165)

(assert (=> b!1046854 (= lt!462113 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11729 thiss!1427) (index!41588 lt!462114) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65943 (_ BitVec 32)) Bool)

(assert (=> b!1046854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462109 (mask!30610 thiss!1427))))

(declare-fun lt!462107 () Unit!34165)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65943 (_ BitVec 32) (_ BitVec 32)) Unit!34165)

(assert (=> b!1046854 (= lt!462107 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11729 thiss!1427) (index!41588 lt!462114) (mask!30610 thiss!1427)))))

(declare-datatypes ((List!22012 0))(
  ( (Nil!22009) (Cons!22008 (h!23225 (_ BitVec 64)) (t!31272 List!22012)) )
))
(declare-fun arrayNoDuplicates!0 (array!65943 (_ BitVec 32) List!22012) Bool)

(assert (=> b!1046854 (arrayNoDuplicates!0 lt!462109 #b00000000000000000000000000000000 Nil!22009)))

(declare-fun lt!462115 () Unit!34165)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65943 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22012) Unit!34165)

(assert (=> b!1046854 (= lt!462115 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11729 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41588 lt!462114) #b00000000000000000000000000000000 Nil!22009))))

(declare-fun arrayCountValidKeys!0 (array!65943 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046854 (= (arrayCountValidKeys!0 lt!462109 #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11729 thiss!1427) #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046854 (= lt!462109 (array!65944 (store (arr!31711 (_keys!11729 thiss!1427)) (index!41588 lt!462114) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32247 (_keys!11729 thiss!1427))))))

(declare-fun lt!462108 () Unit!34165)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65943 (_ BitVec 32) (_ BitVec 64)) Unit!34165)

(assert (=> b!1046854 (= lt!462108 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11729 thiss!1427) (index!41588 lt!462114) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046855 () Bool)

(declare-fun e!593522 () Bool)

(declare-fun e!593521 () Bool)

(declare-fun mapRes!38930 () Bool)

(assert (=> b!1046855 (= e!593522 (and e!593521 mapRes!38930))))

(declare-fun condMapEmpty!38930 () Bool)

(declare-fun mapDefault!38930 () ValueCell!11726)

(assert (=> b!1046855 (= condMapEmpty!38930 (= (arr!31712 (_values!6442 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11726)) mapDefault!38930)))))

(declare-fun b!1046856 () Bool)

(declare-fun res!696661 () Bool)

(declare-fun e!593515 () Bool)

(assert (=> b!1046856 (=> (not res!696661) (not e!593515))))

(assert (=> b!1046856 (= res!696661 (not (= key!909 (bvneg key!909))))))

(declare-fun res!696660 () Bool)

(assert (=> start!92166 (=> (not res!696660) (not e!593515))))

(declare-fun valid!2274 (LongMapFixedSize!6046) Bool)

(assert (=> start!92166 (= res!696660 (valid!2274 thiss!1427))))

(assert (=> start!92166 e!593515))

(declare-fun e!593517 () Bool)

(assert (=> start!92166 e!593517))

(assert (=> start!92166 true))

(declare-fun b!1046857 () Bool)

(assert (=> b!1046857 (= e!593515 e!593518)))

(declare-fun res!696662 () Bool)

(assert (=> b!1046857 (=> (not res!696662) (not e!593518))))

(get-info :version)

(assert (=> b!1046857 (= res!696662 ((_ is Found!9804) lt!462114))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65943 (_ BitVec 32)) SeekEntryResult!9804)

(assert (=> b!1046857 (= lt!462114 (seekEntry!0 key!909 (_keys!11729 thiss!1427) (mask!30610 thiss!1427)))))

(declare-fun mapNonEmpty!38930 () Bool)

(declare-fun tp!74675 () Bool)

(declare-fun e!593520 () Bool)

(assert (=> mapNonEmpty!38930 (= mapRes!38930 (and tp!74675 e!593520))))

(declare-fun mapValue!38930 () ValueCell!11726)

(declare-fun mapKey!38930 () (_ BitVec 32))

(declare-fun mapRest!38930 () (Array (_ BitVec 32) ValueCell!11726))

(assert (=> mapNonEmpty!38930 (= (arr!31712 (_values!6442 thiss!1427)) (store mapRest!38930 mapKey!38930 mapValue!38930))))

(declare-fun b!1046858 () Bool)

(assert (=> b!1046858 (= e!593516 (or (not (= (size!32248 (_values!6442 (_2!7906 lt!462111))) (bvadd #b00000000000000000000000000000001 (mask!30610 (_2!7906 lt!462111))))) (not (= (size!32247 (_keys!11729 (_2!7906 lt!462111))) (size!32248 (_values!6442 (_2!7906 lt!462111))))) (bvslt (mask!30610 (_2!7906 lt!462111)) #b00000000000000000000000000000000) (bvslt (extraKeys!6147 (_2!7906 lt!462111)) #b00000000000000000000000000000000) (bvsle (extraKeys!6147 (_2!7906 lt!462111)) #b00000000000000000000000000000011)))))

(declare-fun b!1046859 () Bool)

(declare-fun tp_is_empty!24859 () Bool)

(assert (=> b!1046859 (= e!593521 tp_is_empty!24859)))

(declare-fun array_inv!24505 (array!65943) Bool)

(declare-fun array_inv!24506 (array!65945) Bool)

(assert (=> b!1046860 (= e!593517 (and tp!74676 tp_is_empty!24859 (array_inv!24505 (_keys!11729 thiss!1427)) (array_inv!24506 (_values!6442 thiss!1427)) e!593522))))

(declare-fun mapIsEmpty!38930 () Bool)

(assert (=> mapIsEmpty!38930 mapRes!38930))

(declare-fun b!1046861 () Bool)

(assert (=> b!1046861 (= e!593520 tp_is_empty!24859)))

(declare-fun b!1046862 () Bool)

(declare-fun res!696663 () Bool)

(assert (=> b!1046862 (=> res!696663 e!593516)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1046862 (= res!696663 (not (validMask!0 (mask!30610 (_2!7906 lt!462111)))))))

(assert (= (and start!92166 res!696660) b!1046856))

(assert (= (and b!1046856 res!696661) b!1046857))

(assert (= (and b!1046857 res!696662) b!1046854))

(assert (= (and b!1046854 (not res!696659)) b!1046862))

(assert (= (and b!1046862 (not res!696663)) b!1046858))

(assert (= (and b!1046855 condMapEmpty!38930) mapIsEmpty!38930))

(assert (= (and b!1046855 (not condMapEmpty!38930)) mapNonEmpty!38930))

(assert (= (and mapNonEmpty!38930 ((_ is ValueCellFull!11726) mapValue!38930)) b!1046861))

(assert (= (and b!1046855 ((_ is ValueCellFull!11726) mapDefault!38930)) b!1046859))

(assert (= b!1046860 b!1046855))

(assert (= start!92166 b!1046860))

(declare-fun b_lambda!16317 () Bool)

(assert (=> (not b_lambda!16317) (not b!1046854)))

(declare-fun t!31270 () Bool)

(declare-fun tb!7081 () Bool)

(assert (=> (and b!1046860 (= (defaultEntry!6419 thiss!1427) (defaultEntry!6419 thiss!1427)) t!31270) tb!7081))

(declare-fun result!14595 () Bool)

(assert (=> tb!7081 (= result!14595 tp_is_empty!24859)))

(assert (=> b!1046854 t!31270))

(declare-fun b_and!33777 () Bool)

(assert (= b_and!33775 (and (=> t!31270 result!14595) b_and!33777)))

(declare-fun m!966925 () Bool)

(assert (=> b!1046862 m!966925))

(declare-fun m!966927 () Bool)

(assert (=> b!1046854 m!966927))

(declare-fun m!966929 () Bool)

(assert (=> b!1046854 m!966929))

(declare-fun m!966931 () Bool)

(assert (=> b!1046854 m!966931))

(declare-fun m!966933 () Bool)

(assert (=> b!1046854 m!966933))

(declare-fun m!966935 () Bool)

(assert (=> b!1046854 m!966935))

(declare-fun m!966937 () Bool)

(assert (=> b!1046854 m!966937))

(declare-fun m!966939 () Bool)

(assert (=> b!1046854 m!966939))

(declare-fun m!966941 () Bool)

(assert (=> b!1046854 m!966941))

(declare-fun m!966943 () Bool)

(assert (=> b!1046854 m!966943))

(declare-fun m!966945 () Bool)

(assert (=> b!1046854 m!966945))

(declare-fun m!966947 () Bool)

(assert (=> b!1046854 m!966947))

(assert (=> b!1046854 m!966945))

(assert (=> b!1046854 m!966939))

(declare-fun m!966949 () Bool)

(assert (=> b!1046854 m!966949))

(declare-fun m!966951 () Bool)

(assert (=> b!1046854 m!966951))

(declare-fun m!966953 () Bool)

(assert (=> b!1046854 m!966953))

(declare-fun m!966955 () Bool)

(assert (=> b!1046854 m!966955))

(declare-fun m!966957 () Bool)

(assert (=> b!1046854 m!966957))

(declare-fun m!966959 () Bool)

(assert (=> b!1046854 m!966959))

(declare-fun m!966961 () Bool)

(assert (=> b!1046854 m!966961))

(declare-fun m!966963 () Bool)

(assert (=> mapNonEmpty!38930 m!966963))

(declare-fun m!966965 () Bool)

(assert (=> b!1046860 m!966965))

(declare-fun m!966967 () Bool)

(assert (=> b!1046860 m!966967))

(declare-fun m!966969 () Bool)

(assert (=> start!92166 m!966969))

(declare-fun m!966971 () Bool)

(assert (=> b!1046857 m!966971))

(check-sat (not b!1046857) (not start!92166) (not b_next!21139) tp_is_empty!24859 (not b!1046860) b_and!33777 (not b!1046854) (not mapNonEmpty!38930) (not b_lambda!16317) (not b!1046862))
(check-sat b_and!33777 (not b_next!21139))
(get-model)

(declare-fun b_lambda!16323 () Bool)

(assert (= b_lambda!16317 (or (and b!1046860 b_free!21139) b_lambda!16323)))

(check-sat (not b!1046857) (not start!92166) (not b_next!21139) (not b!1046862) tp_is_empty!24859 (not b_lambda!16323) (not b!1046860) b_and!33777 (not b!1046854) (not mapNonEmpty!38930))
(check-sat b_and!33777 (not b_next!21139))
(get-model)

(declare-fun d!127005 () Bool)

(assert (=> d!127005 (= (validMask!0 (mask!30610 (_2!7906 lt!462111))) (and (or (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000000000000000111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000000000000001111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000000000000011111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000000000000111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000000000001111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000000000011111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000000000111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000000001111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000000011111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000000111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000001111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000011111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000000111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000001111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000011111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000000111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000001111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000011111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000000111111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000001111111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000011111111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000000111111111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000001111111111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000011111111111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00000111111111111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00001111111111111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00011111111111111111111111111111) (= (mask!30610 (_2!7906 lt!462111)) #b00111111111111111111111111111111)) (bvsle (mask!30610 (_2!7906 lt!462111)) #b00111111111111111111111111111111)))))

(assert (=> b!1046862 d!127005))

(declare-fun b!1046935 () Bool)

(declare-fun e!593577 () SeekEntryResult!9804)

(declare-fun lt!462180 () SeekEntryResult!9804)

(assert (=> b!1046935 (= e!593577 (Found!9804 (index!41589 lt!462180)))))

(declare-fun d!127007 () Bool)

(declare-fun lt!462179 () SeekEntryResult!9804)

(assert (=> d!127007 (and (or ((_ is MissingVacant!9804) lt!462179) (not ((_ is Found!9804) lt!462179)) (and (bvsge (index!41588 lt!462179) #b00000000000000000000000000000000) (bvslt (index!41588 lt!462179) (size!32247 (_keys!11729 thiss!1427))))) (not ((_ is MissingVacant!9804) lt!462179)) (or (not ((_ is Found!9804) lt!462179)) (= (select (arr!31711 (_keys!11729 thiss!1427)) (index!41588 lt!462179)) key!909)))))

(declare-fun e!593578 () SeekEntryResult!9804)

(assert (=> d!127007 (= lt!462179 e!593578)))

(declare-fun c!106725 () Bool)

(assert (=> d!127007 (= c!106725 (and ((_ is Intermediate!9804) lt!462180) (undefined!10616 lt!462180)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65943 (_ BitVec 32)) SeekEntryResult!9804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!127007 (= lt!462180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30610 thiss!1427)) key!909 (_keys!11729 thiss!1427) (mask!30610 thiss!1427)))))

(assert (=> d!127007 (validMask!0 (mask!30610 thiss!1427))))

(assert (=> d!127007 (= (seekEntry!0 key!909 (_keys!11729 thiss!1427) (mask!30610 thiss!1427)) lt!462179)))

(declare-fun b!1046936 () Bool)

(declare-fun e!593579 () SeekEntryResult!9804)

(assert (=> b!1046936 (= e!593579 (MissingZero!9804 (index!41589 lt!462180)))))

(declare-fun b!1046937 () Bool)

(assert (=> b!1046937 (= e!593578 Undefined!9804)))

(declare-fun b!1046938 () Bool)

(declare-fun lt!462178 () SeekEntryResult!9804)

(assert (=> b!1046938 (= e!593579 (ite ((_ is MissingVacant!9804) lt!462178) (MissingZero!9804 (index!41590 lt!462178)) lt!462178))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65943 (_ BitVec 32)) SeekEntryResult!9804)

(assert (=> b!1046938 (= lt!462178 (seekKeyOrZeroReturnVacant!0 (x!93368 lt!462180) (index!41589 lt!462180) (index!41589 lt!462180) key!909 (_keys!11729 thiss!1427) (mask!30610 thiss!1427)))))

(declare-fun b!1046939 () Bool)

(assert (=> b!1046939 (= e!593578 e!593577)))

(declare-fun lt!462181 () (_ BitVec 64))

(assert (=> b!1046939 (= lt!462181 (select (arr!31711 (_keys!11729 thiss!1427)) (index!41589 lt!462180)))))

(declare-fun c!106723 () Bool)

(assert (=> b!1046939 (= c!106723 (= lt!462181 key!909))))

(declare-fun b!1046940 () Bool)

(declare-fun c!106724 () Bool)

(assert (=> b!1046940 (= c!106724 (= lt!462181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1046940 (= e!593577 e!593579)))

(assert (= (and d!127007 c!106725) b!1046937))

(assert (= (and d!127007 (not c!106725)) b!1046939))

(assert (= (and b!1046939 c!106723) b!1046935))

(assert (= (and b!1046939 (not c!106723)) b!1046940))

(assert (= (and b!1046940 c!106724) b!1046936))

(assert (= (and b!1046940 (not c!106724)) b!1046938))

(declare-fun m!967069 () Bool)

(assert (=> d!127007 m!967069))

(declare-fun m!967071 () Bool)

(assert (=> d!127007 m!967071))

(assert (=> d!127007 m!967071))

(declare-fun m!967073 () Bool)

(assert (=> d!127007 m!967073))

(declare-fun m!967075 () Bool)

(assert (=> d!127007 m!967075))

(declare-fun m!967077 () Bool)

(assert (=> b!1046938 m!967077))

(declare-fun m!967079 () Bool)

(assert (=> b!1046939 m!967079))

(assert (=> b!1046857 d!127007))

(declare-fun d!127009 () Bool)

(declare-fun res!696700 () Bool)

(declare-fun e!593582 () Bool)

(assert (=> d!127009 (=> (not res!696700) (not e!593582))))

(declare-fun simpleValid!453 (LongMapFixedSize!6046) Bool)

(assert (=> d!127009 (= res!696700 (simpleValid!453 thiss!1427))))

(assert (=> d!127009 (= (valid!2274 thiss!1427) e!593582)))

(declare-fun b!1046947 () Bool)

(declare-fun res!696701 () Bool)

(assert (=> b!1046947 (=> (not res!696701) (not e!593582))))

(assert (=> b!1046947 (= res!696701 (= (arrayCountValidKeys!0 (_keys!11729 thiss!1427) #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))) (_size!3078 thiss!1427)))))

(declare-fun b!1046948 () Bool)

(declare-fun res!696702 () Bool)

(assert (=> b!1046948 (=> (not res!696702) (not e!593582))))

(assert (=> b!1046948 (= res!696702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11729 thiss!1427) (mask!30610 thiss!1427)))))

(declare-fun b!1046949 () Bool)

(assert (=> b!1046949 (= e!593582 (arrayNoDuplicates!0 (_keys!11729 thiss!1427) #b00000000000000000000000000000000 Nil!22009))))

(assert (= (and d!127009 res!696700) b!1046947))

(assert (= (and b!1046947 res!696701) b!1046948))

(assert (= (and b!1046948 res!696702) b!1046949))

(declare-fun m!967081 () Bool)

(assert (=> d!127009 m!967081))

(assert (=> b!1046947 m!966935))

(declare-fun m!967083 () Bool)

(assert (=> b!1046948 m!967083))

(declare-fun m!967085 () Bool)

(assert (=> b!1046949 m!967085))

(assert (=> start!92166 d!127009))

(declare-fun d!127011 () Bool)

(assert (=> d!127011 (= (array_inv!24505 (_keys!11729 thiss!1427)) (bvsge (size!32247 (_keys!11729 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1046860 d!127011))

(declare-fun d!127013 () Bool)

(assert (=> d!127013 (= (array_inv!24506 (_values!6442 thiss!1427)) (bvsge (size!32248 (_values!6442 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1046860 d!127013))

(declare-fun d!127015 () Bool)

(declare-fun e!593585 () Bool)

(assert (=> d!127015 e!593585))

(declare-fun res!696705 () Bool)

(assert (=> d!127015 (=> (not res!696705) (not e!593585))))

(assert (=> d!127015 (= res!696705 (and (bvsge (index!41588 lt!462114) #b00000000000000000000000000000000) (bvslt (index!41588 lt!462114) (size!32247 (_keys!11729 thiss!1427)))))))

(declare-fun lt!462184 () Unit!34165)

(declare-fun choose!25 (array!65943 (_ BitVec 32) (_ BitVec 32)) Unit!34165)

(assert (=> d!127015 (= lt!462184 (choose!25 (_keys!11729 thiss!1427) (index!41588 lt!462114) (mask!30610 thiss!1427)))))

(assert (=> d!127015 (validMask!0 (mask!30610 thiss!1427))))

(assert (=> d!127015 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11729 thiss!1427) (index!41588 lt!462114) (mask!30610 thiss!1427)) lt!462184)))

(declare-fun b!1046952 () Bool)

(assert (=> b!1046952 (= e!593585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65944 (store (arr!31711 (_keys!11729 thiss!1427)) (index!41588 lt!462114) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32247 (_keys!11729 thiss!1427))) (mask!30610 thiss!1427)))))

(assert (= (and d!127015 res!696705) b!1046952))

(declare-fun m!967087 () Bool)

(assert (=> d!127015 m!967087))

(assert (=> d!127015 m!967075))

(assert (=> b!1046952 m!966927))

(declare-fun m!967089 () Bool)

(assert (=> b!1046952 m!967089))

(assert (=> b!1046854 d!127015))

(declare-fun b!1046961 () Bool)

(declare-fun e!593590 () (_ BitVec 32))

(declare-fun e!593591 () (_ BitVec 32))

(assert (=> b!1046961 (= e!593590 e!593591)))

(declare-fun c!106731 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1046961 (= c!106731 (validKeyInArray!0 (select (arr!31711 lt!462109) #b00000000000000000000000000000000)))))

(declare-fun bm!44590 () Bool)

(declare-fun call!44593 () (_ BitVec 32))

(assert (=> bm!44590 (= call!44593 (arrayCountValidKeys!0 lt!462109 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32247 (_keys!11729 thiss!1427))))))

(declare-fun d!127017 () Bool)

(declare-fun lt!462187 () (_ BitVec 32))

(assert (=> d!127017 (and (bvsge lt!462187 #b00000000000000000000000000000000) (bvsle lt!462187 (bvsub (size!32247 lt!462109) #b00000000000000000000000000000000)))))

(assert (=> d!127017 (= lt!462187 e!593590)))

(declare-fun c!106730 () Bool)

(assert (=> d!127017 (= c!106730 (bvsge #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))))))

(assert (=> d!127017 (and (bvsle #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32247 (_keys!11729 thiss!1427)) (size!32247 lt!462109)))))

(assert (=> d!127017 (= (arrayCountValidKeys!0 lt!462109 #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))) lt!462187)))

(declare-fun b!1046962 () Bool)

(assert (=> b!1046962 (= e!593591 (bvadd #b00000000000000000000000000000001 call!44593))))

(declare-fun b!1046963 () Bool)

(assert (=> b!1046963 (= e!593590 #b00000000000000000000000000000000)))

(declare-fun b!1046964 () Bool)

(assert (=> b!1046964 (= e!593591 call!44593)))

(assert (= (and d!127017 c!106730) b!1046963))

(assert (= (and d!127017 (not c!106730)) b!1046961))

(assert (= (and b!1046961 c!106731) b!1046962))

(assert (= (and b!1046961 (not c!106731)) b!1046964))

(assert (= (or b!1046962 b!1046964) bm!44590))

(declare-fun m!967091 () Bool)

(assert (=> b!1046961 m!967091))

(assert (=> b!1046961 m!967091))

(declare-fun m!967093 () Bool)

(assert (=> b!1046961 m!967093))

(declare-fun m!967095 () Bool)

(assert (=> bm!44590 m!967095))

(assert (=> b!1046854 d!127017))

(declare-fun b!1047007 () Bool)

(declare-fun e!593620 () Bool)

(declare-fun lt!462243 () ListLongMap!13799)

(declare-fun apply!924 (ListLongMap!13799 (_ BitVec 64)) V!38019)

(assert (=> b!1047007 (= e!593620 (= (apply!924 lt!462243 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6253 thiss!1427)))))

(declare-fun b!1047008 () Bool)

(declare-fun e!593621 () Bool)

(assert (=> b!1047008 (= e!593621 e!593620)))

(declare-fun res!696729 () Bool)

(declare-fun call!44608 () Bool)

(assert (=> b!1047008 (= res!696729 call!44608)))

(assert (=> b!1047008 (=> (not res!696729) (not e!593620))))

(declare-fun b!1047009 () Bool)

(declare-fun e!593628 () Bool)

(declare-fun e!593622 () Bool)

(assert (=> b!1047009 (= e!593628 e!593622)))

(declare-fun res!696728 () Bool)

(assert (=> b!1047009 (=> (not res!696728) (not e!593622))))

(assert (=> b!1047009 (= res!696728 (contains!6109 lt!462243 (select (arr!31711 (_keys!11729 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1047009 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))))))

(declare-fun bm!44605 () Bool)

(assert (=> bm!44605 (= call!44608 (contains!6109 lt!462243 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047010 () Bool)

(assert (=> b!1047010 (= e!593621 (not call!44608))))

(declare-fun b!1047011 () Bool)

(declare-fun res!696726 () Bool)

(declare-fun e!593625 () Bool)

(assert (=> b!1047011 (=> (not res!696726) (not e!593625))))

(assert (=> b!1047011 (= res!696726 e!593628)))

(declare-fun res!696727 () Bool)

(assert (=> b!1047011 (=> res!696727 e!593628)))

(declare-fun e!593627 () Bool)

(assert (=> b!1047011 (= res!696727 (not e!593627))))

(declare-fun res!696732 () Bool)

(assert (=> b!1047011 (=> (not res!696732) (not e!593627))))

(assert (=> b!1047011 (= res!696732 (bvslt #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))))))

(declare-fun b!1047012 () Bool)

(declare-fun e!593626 () ListLongMap!13799)

(declare-fun call!44613 () ListLongMap!13799)

(declare-fun +!3135 (ListLongMap!13799 tuple2!15792) ListLongMap!13799)

(assert (=> b!1047012 (= e!593626 (+!3135 call!44613 (tuple2!15793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 thiss!1427))))))

(declare-fun b!1047013 () Bool)

(assert (=> b!1047013 (= e!593627 (validKeyInArray!0 (select (arr!31711 (_keys!11729 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1047014 () Bool)

(declare-fun e!593624 () Bool)

(declare-fun call!44609 () Bool)

(assert (=> b!1047014 (= e!593624 (not call!44609))))

(declare-fun b!1047015 () Bool)

(declare-fun e!593618 () ListLongMap!13799)

(declare-fun call!44614 () ListLongMap!13799)

(assert (=> b!1047015 (= e!593618 call!44614)))

(declare-fun b!1047016 () Bool)

(declare-fun e!593630 () ListLongMap!13799)

(declare-fun call!44610 () ListLongMap!13799)

(assert (=> b!1047016 (= e!593630 call!44610)))

(declare-fun b!1047017 () Bool)

(declare-fun e!593623 () Bool)

(assert (=> b!1047017 (= e!593623 (validKeyInArray!0 (select (arr!31711 (_keys!11729 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44607 () Bool)

(declare-fun call!44611 () ListLongMap!13799)

(assert (=> bm!44607 (= call!44614 call!44611)))

(declare-fun c!106746 () Bool)

(declare-fun c!106749 () Bool)

(declare-fun bm!44608 () Bool)

(declare-fun call!44612 () ListLongMap!13799)

(assert (=> bm!44608 (= call!44613 (+!3135 (ite c!106749 call!44612 (ite c!106746 call!44611 call!44614)) (ite (or c!106749 c!106746) (tuple2!15793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6253 thiss!1427)) (tuple2!15793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 thiss!1427)))))))

(declare-fun b!1047018 () Bool)

(declare-fun res!696730 () Bool)

(assert (=> b!1047018 (=> (not res!696730) (not e!593625))))

(assert (=> b!1047018 (= res!696730 e!593624)))

(declare-fun c!106744 () Bool)

(assert (=> b!1047018 (= c!106744 (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1047019 () Bool)

(assert (=> b!1047019 (= e!593626 e!593630)))

(assert (=> b!1047019 (= c!106746 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1047020 () Bool)

(assert (=> b!1047020 (= e!593618 call!44610)))

(declare-fun b!1047021 () Bool)

(declare-fun c!106745 () Bool)

(assert (=> b!1047021 (= c!106745 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1047021 (= e!593630 e!593618)))

(declare-fun b!1047022 () Bool)

(declare-fun e!593619 () Bool)

(assert (=> b!1047022 (= e!593619 (= (apply!924 lt!462243 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6253 thiss!1427)))))

(declare-fun bm!44609 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3575 (array!65943 array!65945 (_ BitVec 32) (_ BitVec 32) V!38019 V!38019 (_ BitVec 32) Int) ListLongMap!13799)

(assert (=> bm!44609 (= call!44612 (getCurrentListMapNoExtraKeys!3575 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun bm!44606 () Bool)

(assert (=> bm!44606 (= call!44610 call!44613)))

(declare-fun d!127019 () Bool)

(assert (=> d!127019 e!593625))

(declare-fun res!696725 () Bool)

(assert (=> d!127019 (=> (not res!696725) (not e!593625))))

(assert (=> d!127019 (= res!696725 (or (bvsge #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))))))))

(declare-fun lt!462234 () ListLongMap!13799)

(assert (=> d!127019 (= lt!462243 lt!462234)))

(declare-fun lt!462239 () Unit!34165)

(declare-fun e!593629 () Unit!34165)

(assert (=> d!127019 (= lt!462239 e!593629)))

(declare-fun c!106747 () Bool)

(assert (=> d!127019 (= c!106747 e!593623)))

(declare-fun res!696724 () Bool)

(assert (=> d!127019 (=> (not res!696724) (not e!593623))))

(assert (=> d!127019 (= res!696724 (bvslt #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))))))

(assert (=> d!127019 (= lt!462234 e!593626)))

(assert (=> d!127019 (= c!106749 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!127019 (validMask!0 (mask!30610 thiss!1427))))

(assert (=> d!127019 (= (getCurrentListMap!3959 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)) lt!462243)))

(declare-fun b!1047023 () Bool)

(assert (=> b!1047023 (= e!593624 e!593619)))

(declare-fun res!696731 () Bool)

(assert (=> b!1047023 (= res!696731 call!44609)))

(assert (=> b!1047023 (=> (not res!696731) (not e!593619))))

(declare-fun b!1047024 () Bool)

(declare-fun lt!462235 () Unit!34165)

(assert (=> b!1047024 (= e!593629 lt!462235)))

(declare-fun lt!462251 () ListLongMap!13799)

(assert (=> b!1047024 (= lt!462251 (getCurrentListMapNoExtraKeys!3575 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!462244 () (_ BitVec 64))

(assert (=> b!1047024 (= lt!462244 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462240 () (_ BitVec 64))

(assert (=> b!1047024 (= lt!462240 (select (arr!31711 (_keys!11729 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!462232 () Unit!34165)

(declare-fun addStillContains!634 (ListLongMap!13799 (_ BitVec 64) V!38019 (_ BitVec 64)) Unit!34165)

(assert (=> b!1047024 (= lt!462232 (addStillContains!634 lt!462251 lt!462244 (zeroValue!6253 thiss!1427) lt!462240))))

(assert (=> b!1047024 (contains!6109 (+!3135 lt!462251 (tuple2!15793 lt!462244 (zeroValue!6253 thiss!1427))) lt!462240)))

(declare-fun lt!462249 () Unit!34165)

(assert (=> b!1047024 (= lt!462249 lt!462232)))

(declare-fun lt!462236 () ListLongMap!13799)

(assert (=> b!1047024 (= lt!462236 (getCurrentListMapNoExtraKeys!3575 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!462237 () (_ BitVec 64))

(assert (=> b!1047024 (= lt!462237 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462248 () (_ BitVec 64))

(assert (=> b!1047024 (= lt!462248 (select (arr!31711 (_keys!11729 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!462245 () Unit!34165)

(declare-fun addApplyDifferent!490 (ListLongMap!13799 (_ BitVec 64) V!38019 (_ BitVec 64)) Unit!34165)

(assert (=> b!1047024 (= lt!462245 (addApplyDifferent!490 lt!462236 lt!462237 (minValue!6253 thiss!1427) lt!462248))))

(assert (=> b!1047024 (= (apply!924 (+!3135 lt!462236 (tuple2!15793 lt!462237 (minValue!6253 thiss!1427))) lt!462248) (apply!924 lt!462236 lt!462248))))

(declare-fun lt!462246 () Unit!34165)

(assert (=> b!1047024 (= lt!462246 lt!462245)))

(declare-fun lt!462250 () ListLongMap!13799)

(assert (=> b!1047024 (= lt!462250 (getCurrentListMapNoExtraKeys!3575 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!462252 () (_ BitVec 64))

(assert (=> b!1047024 (= lt!462252 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462242 () (_ BitVec 64))

(assert (=> b!1047024 (= lt!462242 (select (arr!31711 (_keys!11729 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!462253 () Unit!34165)

(assert (=> b!1047024 (= lt!462253 (addApplyDifferent!490 lt!462250 lt!462252 (zeroValue!6253 thiss!1427) lt!462242))))

(assert (=> b!1047024 (= (apply!924 (+!3135 lt!462250 (tuple2!15793 lt!462252 (zeroValue!6253 thiss!1427))) lt!462242) (apply!924 lt!462250 lt!462242))))

(declare-fun lt!462247 () Unit!34165)

(assert (=> b!1047024 (= lt!462247 lt!462253)))

(declare-fun lt!462238 () ListLongMap!13799)

(assert (=> b!1047024 (= lt!462238 (getCurrentListMapNoExtraKeys!3575 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!462233 () (_ BitVec 64))

(assert (=> b!1047024 (= lt!462233 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462241 () (_ BitVec 64))

(assert (=> b!1047024 (= lt!462241 (select (arr!31711 (_keys!11729 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1047024 (= lt!462235 (addApplyDifferent!490 lt!462238 lt!462233 (minValue!6253 thiss!1427) lt!462241))))

(assert (=> b!1047024 (= (apply!924 (+!3135 lt!462238 (tuple2!15793 lt!462233 (minValue!6253 thiss!1427))) lt!462241) (apply!924 lt!462238 lt!462241))))

(declare-fun bm!44610 () Bool)

(assert (=> bm!44610 (= call!44609 (contains!6109 lt!462243 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047025 () Bool)

(declare-fun get!16591 (ValueCell!11726 V!38019) V!38019)

(assert (=> b!1047025 (= e!593622 (= (apply!924 lt!462243 (select (arr!31711 (_keys!11729 thiss!1427)) #b00000000000000000000000000000000)) (get!16591 (select (arr!31712 (_values!6442 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2030 (defaultEntry!6419 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1047025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32248 (_values!6442 thiss!1427))))))

(assert (=> b!1047025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))))))

(declare-fun b!1047026 () Bool)

(declare-fun Unit!34173 () Unit!34165)

(assert (=> b!1047026 (= e!593629 Unit!34173)))

(declare-fun bm!44611 () Bool)

(assert (=> bm!44611 (= call!44611 call!44612)))

(declare-fun b!1047027 () Bool)

(assert (=> b!1047027 (= e!593625 e!593621)))

(declare-fun c!106748 () Bool)

(assert (=> b!1047027 (= c!106748 (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!127019 c!106749) b!1047012))

(assert (= (and d!127019 (not c!106749)) b!1047019))

(assert (= (and b!1047019 c!106746) b!1047016))

(assert (= (and b!1047019 (not c!106746)) b!1047021))

(assert (= (and b!1047021 c!106745) b!1047020))

(assert (= (and b!1047021 (not c!106745)) b!1047015))

(assert (= (or b!1047020 b!1047015) bm!44607))

(assert (= (or b!1047016 bm!44607) bm!44611))

(assert (= (or b!1047016 b!1047020) bm!44606))

(assert (= (or b!1047012 bm!44611) bm!44609))

(assert (= (or b!1047012 bm!44606) bm!44608))

(assert (= (and d!127019 res!696724) b!1047017))

(assert (= (and d!127019 c!106747) b!1047024))

(assert (= (and d!127019 (not c!106747)) b!1047026))

(assert (= (and d!127019 res!696725) b!1047011))

(assert (= (and b!1047011 res!696732) b!1047013))

(assert (= (and b!1047011 (not res!696727)) b!1047009))

(assert (= (and b!1047009 res!696728) b!1047025))

(assert (= (and b!1047011 res!696726) b!1047018))

(assert (= (and b!1047018 c!106744) b!1047023))

(assert (= (and b!1047018 (not c!106744)) b!1047014))

(assert (= (and b!1047023 res!696731) b!1047022))

(assert (= (or b!1047023 b!1047014) bm!44610))

(assert (= (and b!1047018 res!696730) b!1047027))

(assert (= (and b!1047027 c!106748) b!1047008))

(assert (= (and b!1047027 (not c!106748)) b!1047010))

(assert (= (and b!1047008 res!696729) b!1047007))

(assert (= (or b!1047008 b!1047010) bm!44605))

(declare-fun b_lambda!16325 () Bool)

(assert (=> (not b_lambda!16325) (not b!1047025)))

(assert (=> b!1047025 t!31270))

(declare-fun b_and!33787 () Bool)

(assert (= b_and!33777 (and (=> t!31270 result!14595) b_and!33787)))

(declare-fun m!967097 () Bool)

(assert (=> bm!44608 m!967097))

(declare-fun m!967099 () Bool)

(assert (=> b!1047025 m!967099))

(assert (=> b!1047025 m!966955))

(declare-fun m!967101 () Bool)

(assert (=> b!1047025 m!967101))

(declare-fun m!967103 () Bool)

(assert (=> b!1047025 m!967103))

(assert (=> b!1047025 m!967099))

(assert (=> b!1047025 m!966955))

(assert (=> b!1047025 m!967103))

(declare-fun m!967105 () Bool)

(assert (=> b!1047025 m!967105))

(assert (=> b!1047009 m!967103))

(assert (=> b!1047009 m!967103))

(declare-fun m!967107 () Bool)

(assert (=> b!1047009 m!967107))

(declare-fun m!967109 () Bool)

(assert (=> bm!44609 m!967109))

(declare-fun m!967111 () Bool)

(assert (=> b!1047022 m!967111))

(declare-fun m!967113 () Bool)

(assert (=> b!1047007 m!967113))

(assert (=> b!1047017 m!967103))

(assert (=> b!1047017 m!967103))

(declare-fun m!967115 () Bool)

(assert (=> b!1047017 m!967115))

(declare-fun m!967117 () Bool)

(assert (=> b!1047024 m!967117))

(declare-fun m!967119 () Bool)

(assert (=> b!1047024 m!967119))

(declare-fun m!967121 () Bool)

(assert (=> b!1047024 m!967121))

(declare-fun m!967123 () Bool)

(assert (=> b!1047024 m!967123))

(declare-fun m!967125 () Bool)

(assert (=> b!1047024 m!967125))

(declare-fun m!967127 () Bool)

(assert (=> b!1047024 m!967127))

(assert (=> b!1047024 m!967103))

(declare-fun m!967129 () Bool)

(assert (=> b!1047024 m!967129))

(declare-fun m!967131 () Bool)

(assert (=> b!1047024 m!967131))

(declare-fun m!967133 () Bool)

(assert (=> b!1047024 m!967133))

(assert (=> b!1047024 m!967125))

(assert (=> b!1047024 m!967129))

(declare-fun m!967135 () Bool)

(assert (=> b!1047024 m!967135))

(declare-fun m!967137 () Bool)

(assert (=> b!1047024 m!967137))

(declare-fun m!967139 () Bool)

(assert (=> b!1047024 m!967139))

(assert (=> b!1047024 m!967123))

(declare-fun m!967141 () Bool)

(assert (=> b!1047024 m!967141))

(assert (=> b!1047024 m!967109))

(assert (=> b!1047024 m!967139))

(declare-fun m!967143 () Bool)

(assert (=> b!1047024 m!967143))

(declare-fun m!967145 () Bool)

(assert (=> b!1047024 m!967145))

(assert (=> b!1047013 m!967103))

(assert (=> b!1047013 m!967103))

(assert (=> b!1047013 m!967115))

(declare-fun m!967147 () Bool)

(assert (=> b!1047012 m!967147))

(assert (=> d!127019 m!967075))

(declare-fun m!967149 () Bool)

(assert (=> bm!44610 m!967149))

(declare-fun m!967151 () Bool)

(assert (=> bm!44605 m!967151))

(assert (=> b!1046854 d!127019))

(declare-fun d!127021 () Bool)

(declare-fun lt!462256 () ListLongMap!13799)

(assert (=> d!127021 (not (contains!6109 lt!462256 key!909))))

(declare-fun removeStrictlySorted!64 (List!22011 (_ BitVec 64)) List!22011)

(assert (=> d!127021 (= lt!462256 (ListLongMap!13800 (removeStrictlySorted!64 (toList!6915 (getCurrentListMap!3959 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427))) key!909)))))

(assert (=> d!127021 (= (-!538 (getCurrentListMap!3959 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)) key!909) lt!462256)))

(declare-fun bs!30551 () Bool)

(assert (= bs!30551 d!127021))

(declare-fun m!967153 () Bool)

(assert (=> bs!30551 m!967153))

(declare-fun m!967155 () Bool)

(assert (=> bs!30551 m!967155))

(assert (=> b!1046854 d!127021))

(declare-fun b!1047028 () Bool)

(declare-fun e!593633 () Bool)

(declare-fun lt!462268 () ListLongMap!13799)

(assert (=> b!1047028 (= e!593633 (= (apply!924 lt!462268 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6253 (_2!7906 lt!462111))))))

(declare-fun b!1047029 () Bool)

(declare-fun e!593634 () Bool)

(assert (=> b!1047029 (= e!593634 e!593633)))

(declare-fun res!696738 () Bool)

(declare-fun call!44615 () Bool)

(assert (=> b!1047029 (= res!696738 call!44615)))

(assert (=> b!1047029 (=> (not res!696738) (not e!593633))))

(declare-fun b!1047030 () Bool)

(declare-fun e!593641 () Bool)

(declare-fun e!593635 () Bool)

(assert (=> b!1047030 (= e!593641 e!593635)))

(declare-fun res!696737 () Bool)

(assert (=> b!1047030 (=> (not res!696737) (not e!593635))))

(assert (=> b!1047030 (= res!696737 (contains!6109 lt!462268 (select (arr!31711 (_keys!11729 (_2!7906 lt!462111))) #b00000000000000000000000000000000)))))

(assert (=> b!1047030 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32247 (_keys!11729 (_2!7906 lt!462111)))))))

(declare-fun bm!44612 () Bool)

(assert (=> bm!44612 (= call!44615 (contains!6109 lt!462268 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047031 () Bool)

(assert (=> b!1047031 (= e!593634 (not call!44615))))

(declare-fun b!1047032 () Bool)

(declare-fun res!696735 () Bool)

(declare-fun e!593638 () Bool)

(assert (=> b!1047032 (=> (not res!696735) (not e!593638))))

(assert (=> b!1047032 (= res!696735 e!593641)))

(declare-fun res!696736 () Bool)

(assert (=> b!1047032 (=> res!696736 e!593641)))

(declare-fun e!593640 () Bool)

(assert (=> b!1047032 (= res!696736 (not e!593640))))

(declare-fun res!696741 () Bool)

(assert (=> b!1047032 (=> (not res!696741) (not e!593640))))

(assert (=> b!1047032 (= res!696741 (bvslt #b00000000000000000000000000000000 (size!32247 (_keys!11729 (_2!7906 lt!462111)))))))

(declare-fun b!1047033 () Bool)

(declare-fun e!593639 () ListLongMap!13799)

(declare-fun call!44620 () ListLongMap!13799)

(assert (=> b!1047033 (= e!593639 (+!3135 call!44620 (tuple2!15793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 (_2!7906 lt!462111)))))))

(declare-fun b!1047034 () Bool)

(assert (=> b!1047034 (= e!593640 (validKeyInArray!0 (select (arr!31711 (_keys!11729 (_2!7906 lt!462111))) #b00000000000000000000000000000000)))))

(declare-fun b!1047035 () Bool)

(declare-fun e!593637 () Bool)

(declare-fun call!44616 () Bool)

(assert (=> b!1047035 (= e!593637 (not call!44616))))

(declare-fun b!1047036 () Bool)

(declare-fun e!593631 () ListLongMap!13799)

(declare-fun call!44621 () ListLongMap!13799)

(assert (=> b!1047036 (= e!593631 call!44621)))

(declare-fun b!1047037 () Bool)

(declare-fun e!593643 () ListLongMap!13799)

(declare-fun call!44617 () ListLongMap!13799)

(assert (=> b!1047037 (= e!593643 call!44617)))

(declare-fun b!1047038 () Bool)

(declare-fun e!593636 () Bool)

(assert (=> b!1047038 (= e!593636 (validKeyInArray!0 (select (arr!31711 (_keys!11729 (_2!7906 lt!462111))) #b00000000000000000000000000000000)))))

(declare-fun bm!44614 () Bool)

(declare-fun call!44618 () ListLongMap!13799)

(assert (=> bm!44614 (= call!44621 call!44618)))

(declare-fun bm!44615 () Bool)

(declare-fun call!44619 () ListLongMap!13799)

(declare-fun c!106752 () Bool)

(declare-fun c!106755 () Bool)

(assert (=> bm!44615 (= call!44620 (+!3135 (ite c!106755 call!44619 (ite c!106752 call!44618 call!44621)) (ite (or c!106755 c!106752) (tuple2!15793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6253 (_2!7906 lt!462111))) (tuple2!15793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 (_2!7906 lt!462111))))))))

(declare-fun b!1047039 () Bool)

(declare-fun res!696739 () Bool)

(assert (=> b!1047039 (=> (not res!696739) (not e!593638))))

(assert (=> b!1047039 (= res!696739 e!593637)))

(declare-fun c!106750 () Bool)

(assert (=> b!1047039 (= c!106750 (not (= (bvand (extraKeys!6147 (_2!7906 lt!462111)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1047040 () Bool)

(assert (=> b!1047040 (= e!593639 e!593643)))

(assert (=> b!1047040 (= c!106752 (and (not (= (bvand (extraKeys!6147 (_2!7906 lt!462111)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 (_2!7906 lt!462111)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1047041 () Bool)

(assert (=> b!1047041 (= e!593631 call!44617)))

(declare-fun b!1047042 () Bool)

(declare-fun c!106751 () Bool)

(assert (=> b!1047042 (= c!106751 (and (not (= (bvand (extraKeys!6147 (_2!7906 lt!462111)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 (_2!7906 lt!462111)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1047042 (= e!593643 e!593631)))

(declare-fun b!1047043 () Bool)

(declare-fun e!593632 () Bool)

(assert (=> b!1047043 (= e!593632 (= (apply!924 lt!462268 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6253 (_2!7906 lt!462111))))))

(declare-fun bm!44616 () Bool)

(assert (=> bm!44616 (= call!44619 (getCurrentListMapNoExtraKeys!3575 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111))))))

(declare-fun bm!44613 () Bool)

(assert (=> bm!44613 (= call!44617 call!44620)))

(declare-fun d!127023 () Bool)

(assert (=> d!127023 e!593638))

(declare-fun res!696734 () Bool)

(assert (=> d!127023 (=> (not res!696734) (not e!593638))))

(assert (=> d!127023 (= res!696734 (or (bvsge #b00000000000000000000000000000000 (size!32247 (_keys!11729 (_2!7906 lt!462111)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32247 (_keys!11729 (_2!7906 lt!462111)))))))))

(declare-fun lt!462259 () ListLongMap!13799)

(assert (=> d!127023 (= lt!462268 lt!462259)))

(declare-fun lt!462264 () Unit!34165)

(declare-fun e!593642 () Unit!34165)

(assert (=> d!127023 (= lt!462264 e!593642)))

(declare-fun c!106753 () Bool)

(assert (=> d!127023 (= c!106753 e!593636)))

(declare-fun res!696733 () Bool)

(assert (=> d!127023 (=> (not res!696733) (not e!593636))))

(assert (=> d!127023 (= res!696733 (bvslt #b00000000000000000000000000000000 (size!32247 (_keys!11729 (_2!7906 lt!462111)))))))

(assert (=> d!127023 (= lt!462259 e!593639)))

(assert (=> d!127023 (= c!106755 (and (not (= (bvand (extraKeys!6147 (_2!7906 lt!462111)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6147 (_2!7906 lt!462111)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!127023 (validMask!0 (mask!30610 (_2!7906 lt!462111)))))

(assert (=> d!127023 (= (getCurrentListMap!3959 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111))) lt!462268)))

(declare-fun b!1047044 () Bool)

(assert (=> b!1047044 (= e!593637 e!593632)))

(declare-fun res!696740 () Bool)

(assert (=> b!1047044 (= res!696740 call!44616)))

(assert (=> b!1047044 (=> (not res!696740) (not e!593632))))

(declare-fun b!1047045 () Bool)

(declare-fun lt!462260 () Unit!34165)

(assert (=> b!1047045 (= e!593642 lt!462260)))

(declare-fun lt!462276 () ListLongMap!13799)

(assert (=> b!1047045 (= lt!462276 (getCurrentListMapNoExtraKeys!3575 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111))))))

(declare-fun lt!462269 () (_ BitVec 64))

(assert (=> b!1047045 (= lt!462269 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462265 () (_ BitVec 64))

(assert (=> b!1047045 (= lt!462265 (select (arr!31711 (_keys!11729 (_2!7906 lt!462111))) #b00000000000000000000000000000000))))

(declare-fun lt!462257 () Unit!34165)

(assert (=> b!1047045 (= lt!462257 (addStillContains!634 lt!462276 lt!462269 (zeroValue!6253 (_2!7906 lt!462111)) lt!462265))))

(assert (=> b!1047045 (contains!6109 (+!3135 lt!462276 (tuple2!15793 lt!462269 (zeroValue!6253 (_2!7906 lt!462111)))) lt!462265)))

(declare-fun lt!462274 () Unit!34165)

(assert (=> b!1047045 (= lt!462274 lt!462257)))

(declare-fun lt!462261 () ListLongMap!13799)

(assert (=> b!1047045 (= lt!462261 (getCurrentListMapNoExtraKeys!3575 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111))))))

(declare-fun lt!462262 () (_ BitVec 64))

(assert (=> b!1047045 (= lt!462262 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462273 () (_ BitVec 64))

(assert (=> b!1047045 (= lt!462273 (select (arr!31711 (_keys!11729 (_2!7906 lt!462111))) #b00000000000000000000000000000000))))

(declare-fun lt!462270 () Unit!34165)

(assert (=> b!1047045 (= lt!462270 (addApplyDifferent!490 lt!462261 lt!462262 (minValue!6253 (_2!7906 lt!462111)) lt!462273))))

(assert (=> b!1047045 (= (apply!924 (+!3135 lt!462261 (tuple2!15793 lt!462262 (minValue!6253 (_2!7906 lt!462111)))) lt!462273) (apply!924 lt!462261 lt!462273))))

(declare-fun lt!462271 () Unit!34165)

(assert (=> b!1047045 (= lt!462271 lt!462270)))

(declare-fun lt!462275 () ListLongMap!13799)

(assert (=> b!1047045 (= lt!462275 (getCurrentListMapNoExtraKeys!3575 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111))))))

(declare-fun lt!462277 () (_ BitVec 64))

(assert (=> b!1047045 (= lt!462277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462267 () (_ BitVec 64))

(assert (=> b!1047045 (= lt!462267 (select (arr!31711 (_keys!11729 (_2!7906 lt!462111))) #b00000000000000000000000000000000))))

(declare-fun lt!462278 () Unit!34165)

(assert (=> b!1047045 (= lt!462278 (addApplyDifferent!490 lt!462275 lt!462277 (zeroValue!6253 (_2!7906 lt!462111)) lt!462267))))

(assert (=> b!1047045 (= (apply!924 (+!3135 lt!462275 (tuple2!15793 lt!462277 (zeroValue!6253 (_2!7906 lt!462111)))) lt!462267) (apply!924 lt!462275 lt!462267))))

(declare-fun lt!462272 () Unit!34165)

(assert (=> b!1047045 (= lt!462272 lt!462278)))

(declare-fun lt!462263 () ListLongMap!13799)

(assert (=> b!1047045 (= lt!462263 (getCurrentListMapNoExtraKeys!3575 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111))))))

(declare-fun lt!462258 () (_ BitVec 64))

(assert (=> b!1047045 (= lt!462258 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462266 () (_ BitVec 64))

(assert (=> b!1047045 (= lt!462266 (select (arr!31711 (_keys!11729 (_2!7906 lt!462111))) #b00000000000000000000000000000000))))

(assert (=> b!1047045 (= lt!462260 (addApplyDifferent!490 lt!462263 lt!462258 (minValue!6253 (_2!7906 lt!462111)) lt!462266))))

(assert (=> b!1047045 (= (apply!924 (+!3135 lt!462263 (tuple2!15793 lt!462258 (minValue!6253 (_2!7906 lt!462111)))) lt!462266) (apply!924 lt!462263 lt!462266))))

(declare-fun bm!44617 () Bool)

(assert (=> bm!44617 (= call!44616 (contains!6109 lt!462268 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047046 () Bool)

(assert (=> b!1047046 (= e!593635 (= (apply!924 lt!462268 (select (arr!31711 (_keys!11729 (_2!7906 lt!462111))) #b00000000000000000000000000000000)) (get!16591 (select (arr!31712 (_values!6442 (_2!7906 lt!462111))) #b00000000000000000000000000000000) (dynLambda!2030 (defaultEntry!6419 (_2!7906 lt!462111)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1047046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32248 (_values!6442 (_2!7906 lt!462111)))))))

(assert (=> b!1047046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32247 (_keys!11729 (_2!7906 lt!462111)))))))

(declare-fun b!1047047 () Bool)

(declare-fun Unit!34174 () Unit!34165)

(assert (=> b!1047047 (= e!593642 Unit!34174)))

(declare-fun bm!44618 () Bool)

(assert (=> bm!44618 (= call!44618 call!44619)))

(declare-fun b!1047048 () Bool)

(assert (=> b!1047048 (= e!593638 e!593634)))

(declare-fun c!106754 () Bool)

(assert (=> b!1047048 (= c!106754 (not (= (bvand (extraKeys!6147 (_2!7906 lt!462111)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!127023 c!106755) b!1047033))

(assert (= (and d!127023 (not c!106755)) b!1047040))

(assert (= (and b!1047040 c!106752) b!1047037))

(assert (= (and b!1047040 (not c!106752)) b!1047042))

(assert (= (and b!1047042 c!106751) b!1047041))

(assert (= (and b!1047042 (not c!106751)) b!1047036))

(assert (= (or b!1047041 b!1047036) bm!44614))

(assert (= (or b!1047037 bm!44614) bm!44618))

(assert (= (or b!1047037 b!1047041) bm!44613))

(assert (= (or b!1047033 bm!44618) bm!44616))

(assert (= (or b!1047033 bm!44613) bm!44615))

(assert (= (and d!127023 res!696733) b!1047038))

(assert (= (and d!127023 c!106753) b!1047045))

(assert (= (and d!127023 (not c!106753)) b!1047047))

(assert (= (and d!127023 res!696734) b!1047032))

(assert (= (and b!1047032 res!696741) b!1047034))

(assert (= (and b!1047032 (not res!696736)) b!1047030))

(assert (= (and b!1047030 res!696737) b!1047046))

(assert (= (and b!1047032 res!696735) b!1047039))

(assert (= (and b!1047039 c!106750) b!1047044))

(assert (= (and b!1047039 (not c!106750)) b!1047035))

(assert (= (and b!1047044 res!696740) b!1047043))

(assert (= (or b!1047044 b!1047035) bm!44617))

(assert (= (and b!1047039 res!696739) b!1047048))

(assert (= (and b!1047048 c!106754) b!1047029))

(assert (= (and b!1047048 (not c!106754)) b!1047031))

(assert (= (and b!1047029 res!696738) b!1047028))

(assert (= (or b!1047029 b!1047031) bm!44612))

(declare-fun b_lambda!16327 () Bool)

(assert (=> (not b_lambda!16327) (not b!1047046)))

(declare-fun t!31280 () Bool)

(declare-fun tb!7087 () Bool)

(assert (=> (and b!1046860 (= (defaultEntry!6419 thiss!1427) (defaultEntry!6419 (_2!7906 lt!462111))) t!31280) tb!7087))

(declare-fun result!14607 () Bool)

(assert (=> tb!7087 (= result!14607 tp_is_empty!24859)))

(assert (=> b!1047046 t!31280))

(declare-fun b_and!33789 () Bool)

(assert (= b_and!33787 (and (=> t!31280 result!14607) b_and!33789)))

(declare-fun m!967157 () Bool)

(assert (=> bm!44615 m!967157))

(declare-fun m!967159 () Bool)

(assert (=> b!1047046 m!967159))

(declare-fun m!967161 () Bool)

(assert (=> b!1047046 m!967161))

(declare-fun m!967163 () Bool)

(assert (=> b!1047046 m!967163))

(declare-fun m!967165 () Bool)

(assert (=> b!1047046 m!967165))

(assert (=> b!1047046 m!967159))

(assert (=> b!1047046 m!967161))

(assert (=> b!1047046 m!967165))

(declare-fun m!967167 () Bool)

(assert (=> b!1047046 m!967167))

(assert (=> b!1047030 m!967165))

(assert (=> b!1047030 m!967165))

(declare-fun m!967169 () Bool)

(assert (=> b!1047030 m!967169))

(declare-fun m!967171 () Bool)

(assert (=> bm!44616 m!967171))

(declare-fun m!967173 () Bool)

(assert (=> b!1047043 m!967173))

(declare-fun m!967175 () Bool)

(assert (=> b!1047028 m!967175))

(assert (=> b!1047038 m!967165))

(assert (=> b!1047038 m!967165))

(declare-fun m!967177 () Bool)

(assert (=> b!1047038 m!967177))

(declare-fun m!967179 () Bool)

(assert (=> b!1047045 m!967179))

(declare-fun m!967181 () Bool)

(assert (=> b!1047045 m!967181))

(declare-fun m!967183 () Bool)

(assert (=> b!1047045 m!967183))

(declare-fun m!967185 () Bool)

(assert (=> b!1047045 m!967185))

(declare-fun m!967187 () Bool)

(assert (=> b!1047045 m!967187))

(declare-fun m!967189 () Bool)

(assert (=> b!1047045 m!967189))

(assert (=> b!1047045 m!967165))

(declare-fun m!967191 () Bool)

(assert (=> b!1047045 m!967191))

(declare-fun m!967193 () Bool)

(assert (=> b!1047045 m!967193))

(declare-fun m!967195 () Bool)

(assert (=> b!1047045 m!967195))

(assert (=> b!1047045 m!967187))

(assert (=> b!1047045 m!967191))

(declare-fun m!967197 () Bool)

(assert (=> b!1047045 m!967197))

(declare-fun m!967199 () Bool)

(assert (=> b!1047045 m!967199))

(declare-fun m!967201 () Bool)

(assert (=> b!1047045 m!967201))

(assert (=> b!1047045 m!967185))

(declare-fun m!967203 () Bool)

(assert (=> b!1047045 m!967203))

(assert (=> b!1047045 m!967171))

(assert (=> b!1047045 m!967201))

(declare-fun m!967205 () Bool)

(assert (=> b!1047045 m!967205))

(declare-fun m!967207 () Bool)

(assert (=> b!1047045 m!967207))

(assert (=> b!1047034 m!967165))

(assert (=> b!1047034 m!967165))

(assert (=> b!1047034 m!967177))

(declare-fun m!967209 () Bool)

(assert (=> b!1047033 m!967209))

(assert (=> d!127023 m!966925))

(declare-fun m!967211 () Bool)

(assert (=> bm!44617 m!967211))

(declare-fun m!967213 () Bool)

(assert (=> bm!44612 m!967213))

(assert (=> b!1046854 d!127023))

(declare-fun d!127025 () Bool)

(declare-fun e!593646 () Bool)

(assert (=> d!127025 e!593646))

(declare-fun res!696744 () Bool)

(assert (=> d!127025 (=> (not res!696744) (not e!593646))))

(assert (=> d!127025 (= res!696744 (and (bvsge (index!41588 lt!462114) #b00000000000000000000000000000000) (bvslt (index!41588 lt!462114) (size!32247 (_keys!11729 thiss!1427)))))))

(declare-fun lt!462281 () Unit!34165)

(declare-fun choose!1719 (array!65943 array!65945 (_ BitVec 32) (_ BitVec 32) V!38019 V!38019 (_ BitVec 32) (_ BitVec 64) Int) Unit!34165)

(assert (=> d!127025 (= lt!462281 (choose!1719 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) (index!41588 lt!462114) key!909 (defaultEntry!6419 thiss!1427)))))

(assert (=> d!127025 (validMask!0 (mask!30610 thiss!1427))))

(assert (=> d!127025 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!60 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) (index!41588 lt!462114) key!909 (defaultEntry!6419 thiss!1427)) lt!462281)))

(declare-fun b!1047051 () Bool)

(assert (=> b!1047051 (= e!593646 (= (-!538 (getCurrentListMap!3959 (_keys!11729 thiss!1427) (_values!6442 thiss!1427) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)) key!909) (getCurrentListMap!3959 (array!65944 (store (arr!31711 (_keys!11729 thiss!1427)) (index!41588 lt!462114) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32247 (_keys!11729 thiss!1427))) (array!65946 (store (arr!31712 (_values!6442 thiss!1427)) (index!41588 lt!462114) (ValueCellFull!11726 (dynLambda!2030 (defaultEntry!6419 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32248 (_values!6442 thiss!1427))) (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427))))))

(assert (=> b!1047051 (bvslt (index!41588 lt!462114) (size!32248 (_values!6442 thiss!1427)))))

(assert (= (and d!127025 res!696744) b!1047051))

(declare-fun b_lambda!16329 () Bool)

(assert (=> (not b_lambda!16329) (not b!1047051)))

(assert (=> b!1047051 t!31270))

(declare-fun b_and!33791 () Bool)

(assert (= b_and!33789 (and (=> t!31270 result!14595) b_and!33791)))

(declare-fun m!967215 () Bool)

(assert (=> d!127025 m!967215))

(assert (=> d!127025 m!967075))

(assert (=> b!1047051 m!966955))

(assert (=> b!1047051 m!966927))

(declare-fun m!967217 () Bool)

(assert (=> b!1047051 m!967217))

(assert (=> b!1047051 m!966957))

(assert (=> b!1047051 m!966945))

(assert (=> b!1047051 m!966947))

(assert (=> b!1047051 m!966945))

(assert (=> b!1046854 d!127025))

(declare-fun bm!44621 () Bool)

(declare-fun call!44624 () Bool)

(declare-fun c!106758 () Bool)

(assert (=> bm!44621 (= call!44624 (arrayNoDuplicates!0 lt!462109 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106758 (Cons!22008 (select (arr!31711 lt!462109) #b00000000000000000000000000000000) Nil!22009) Nil!22009)))))

(declare-fun b!1047062 () Bool)

(declare-fun e!593657 () Bool)

(declare-fun e!593655 () Bool)

(assert (=> b!1047062 (= e!593657 e!593655)))

(declare-fun res!696751 () Bool)

(assert (=> b!1047062 (=> (not res!696751) (not e!593655))))

(declare-fun e!593658 () Bool)

(assert (=> b!1047062 (= res!696751 (not e!593658))))

(declare-fun res!696753 () Bool)

(assert (=> b!1047062 (=> (not res!696753) (not e!593658))))

(assert (=> b!1047062 (= res!696753 (validKeyInArray!0 (select (arr!31711 lt!462109) #b00000000000000000000000000000000)))))

(declare-fun b!1047063 () Bool)

(declare-fun contains!6111 (List!22012 (_ BitVec 64)) Bool)

(assert (=> b!1047063 (= e!593658 (contains!6111 Nil!22009 (select (arr!31711 lt!462109) #b00000000000000000000000000000000)))))

(declare-fun b!1047064 () Bool)

(declare-fun e!593656 () Bool)

(assert (=> b!1047064 (= e!593656 call!44624)))

(declare-fun b!1047065 () Bool)

(assert (=> b!1047065 (= e!593656 call!44624)))

(declare-fun d!127027 () Bool)

(declare-fun res!696752 () Bool)

(assert (=> d!127027 (=> res!696752 e!593657)))

(assert (=> d!127027 (= res!696752 (bvsge #b00000000000000000000000000000000 (size!32247 lt!462109)))))

(assert (=> d!127027 (= (arrayNoDuplicates!0 lt!462109 #b00000000000000000000000000000000 Nil!22009) e!593657)))

(declare-fun b!1047066 () Bool)

(assert (=> b!1047066 (= e!593655 e!593656)))

(assert (=> b!1047066 (= c!106758 (validKeyInArray!0 (select (arr!31711 lt!462109) #b00000000000000000000000000000000)))))

(assert (= (and d!127027 (not res!696752)) b!1047062))

(assert (= (and b!1047062 res!696753) b!1047063))

(assert (= (and b!1047062 res!696751) b!1047066))

(assert (= (and b!1047066 c!106758) b!1047065))

(assert (= (and b!1047066 (not c!106758)) b!1047064))

(assert (= (or b!1047065 b!1047064) bm!44621))

(assert (=> bm!44621 m!967091))

(declare-fun m!967219 () Bool)

(assert (=> bm!44621 m!967219))

(assert (=> b!1047062 m!967091))

(assert (=> b!1047062 m!967091))

(assert (=> b!1047062 m!967093))

(assert (=> b!1047063 m!967091))

(assert (=> b!1047063 m!967091))

(declare-fun m!967221 () Bool)

(assert (=> b!1047063 m!967221))

(assert (=> b!1047066 m!967091))

(assert (=> b!1047066 m!967091))

(assert (=> b!1047066 m!967093))

(assert (=> b!1046854 d!127027))

(declare-fun d!127029 () Bool)

(declare-fun e!593661 () Bool)

(assert (=> d!127029 e!593661))

(declare-fun res!696756 () Bool)

(assert (=> d!127029 (=> (not res!696756) (not e!593661))))

(assert (=> d!127029 (= res!696756 (bvslt (index!41588 lt!462114) (size!32247 (_keys!11729 thiss!1427))))))

(declare-fun lt!462284 () Unit!34165)

(declare-fun choose!121 (array!65943 (_ BitVec 32) (_ BitVec 64)) Unit!34165)

(assert (=> d!127029 (= lt!462284 (choose!121 (_keys!11729 thiss!1427) (index!41588 lt!462114) key!909))))

(assert (=> d!127029 (bvsge (index!41588 lt!462114) #b00000000000000000000000000000000)))

(assert (=> d!127029 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11729 thiss!1427) (index!41588 lt!462114) key!909) lt!462284)))

(declare-fun b!1047069 () Bool)

(assert (=> b!1047069 (= e!593661 (not (arrayContainsKey!0 (array!65944 (store (arr!31711 (_keys!11729 thiss!1427)) (index!41588 lt!462114) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32247 (_keys!11729 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!127029 res!696756) b!1047069))

(declare-fun m!967223 () Bool)

(assert (=> d!127029 m!967223))

(assert (=> b!1047069 m!966927))

(declare-fun m!967225 () Bool)

(assert (=> b!1047069 m!967225))

(assert (=> b!1046854 d!127029))

(declare-fun d!127031 () Bool)

(declare-fun res!696761 () Bool)

(declare-fun e!593666 () Bool)

(assert (=> d!127031 (=> res!696761 e!593666)))

(assert (=> d!127031 (= res!696761 (= (select (arr!31711 lt!462109) #b00000000000000000000000000000000) key!909))))

(assert (=> d!127031 (= (arrayContainsKey!0 lt!462109 key!909 #b00000000000000000000000000000000) e!593666)))

(declare-fun b!1047074 () Bool)

(declare-fun e!593667 () Bool)

(assert (=> b!1047074 (= e!593666 e!593667)))

(declare-fun res!696762 () Bool)

(assert (=> b!1047074 (=> (not res!696762) (not e!593667))))

(assert (=> b!1047074 (= res!696762 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32247 lt!462109)))))

(declare-fun b!1047075 () Bool)

(assert (=> b!1047075 (= e!593667 (arrayContainsKey!0 lt!462109 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127031 (not res!696761)) b!1047074))

(assert (= (and b!1047074 res!696762) b!1047075))

(assert (=> d!127031 m!967091))

(declare-fun m!967227 () Bool)

(assert (=> b!1047075 m!967227))

(assert (=> b!1046854 d!127031))

(declare-fun b!1047076 () Bool)

(declare-fun e!593670 () Bool)

(declare-fun lt!462296 () ListLongMap!13799)

(assert (=> b!1047076 (= e!593670 (= (apply!924 lt!462296 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6253 thiss!1427)))))

(declare-fun b!1047077 () Bool)

(declare-fun e!593671 () Bool)

(assert (=> b!1047077 (= e!593671 e!593670)))

(declare-fun res!696768 () Bool)

(declare-fun call!44625 () Bool)

(assert (=> b!1047077 (= res!696768 call!44625)))

(assert (=> b!1047077 (=> (not res!696768) (not e!593670))))

(declare-fun b!1047078 () Bool)

(declare-fun e!593678 () Bool)

(declare-fun e!593672 () Bool)

(assert (=> b!1047078 (= e!593678 e!593672)))

(declare-fun res!696767 () Bool)

(assert (=> b!1047078 (=> (not res!696767) (not e!593672))))

(assert (=> b!1047078 (= res!696767 (contains!6109 lt!462296 (select (arr!31711 lt!462109) #b00000000000000000000000000000000)))))

(assert (=> b!1047078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32247 lt!462109)))))

(declare-fun bm!44622 () Bool)

(assert (=> bm!44622 (= call!44625 (contains!6109 lt!462296 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047079 () Bool)

(assert (=> b!1047079 (= e!593671 (not call!44625))))

(declare-fun b!1047080 () Bool)

(declare-fun res!696765 () Bool)

(declare-fun e!593675 () Bool)

(assert (=> b!1047080 (=> (not res!696765) (not e!593675))))

(assert (=> b!1047080 (= res!696765 e!593678)))

(declare-fun res!696766 () Bool)

(assert (=> b!1047080 (=> res!696766 e!593678)))

(declare-fun e!593677 () Bool)

(assert (=> b!1047080 (= res!696766 (not e!593677))))

(declare-fun res!696771 () Bool)

(assert (=> b!1047080 (=> (not res!696771) (not e!593677))))

(assert (=> b!1047080 (= res!696771 (bvslt #b00000000000000000000000000000000 (size!32247 lt!462109)))))

(declare-fun b!1047081 () Bool)

(declare-fun e!593676 () ListLongMap!13799)

(declare-fun call!44630 () ListLongMap!13799)

(assert (=> b!1047081 (= e!593676 (+!3135 call!44630 (tuple2!15793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 thiss!1427))))))

(declare-fun b!1047082 () Bool)

(assert (=> b!1047082 (= e!593677 (validKeyInArray!0 (select (arr!31711 lt!462109) #b00000000000000000000000000000000)))))

(declare-fun b!1047083 () Bool)

(declare-fun e!593674 () Bool)

(declare-fun call!44626 () Bool)

(assert (=> b!1047083 (= e!593674 (not call!44626))))

(declare-fun b!1047084 () Bool)

(declare-fun e!593668 () ListLongMap!13799)

(declare-fun call!44631 () ListLongMap!13799)

(assert (=> b!1047084 (= e!593668 call!44631)))

(declare-fun b!1047085 () Bool)

(declare-fun e!593680 () ListLongMap!13799)

(declare-fun call!44627 () ListLongMap!13799)

(assert (=> b!1047085 (= e!593680 call!44627)))

(declare-fun b!1047086 () Bool)

(declare-fun e!593673 () Bool)

(assert (=> b!1047086 (= e!593673 (validKeyInArray!0 (select (arr!31711 lt!462109) #b00000000000000000000000000000000)))))

(declare-fun bm!44624 () Bool)

(declare-fun call!44628 () ListLongMap!13799)

(assert (=> bm!44624 (= call!44631 call!44628)))

(declare-fun bm!44625 () Bool)

(declare-fun c!106764 () Bool)

(declare-fun c!106761 () Bool)

(declare-fun call!44629 () ListLongMap!13799)

(assert (=> bm!44625 (= call!44630 (+!3135 (ite c!106764 call!44629 (ite c!106761 call!44628 call!44631)) (ite (or c!106764 c!106761) (tuple2!15793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6253 thiss!1427)) (tuple2!15793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 thiss!1427)))))))

(declare-fun b!1047087 () Bool)

(declare-fun res!696769 () Bool)

(assert (=> b!1047087 (=> (not res!696769) (not e!593675))))

(assert (=> b!1047087 (= res!696769 e!593674)))

(declare-fun c!106759 () Bool)

(assert (=> b!1047087 (= c!106759 (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1047088 () Bool)

(assert (=> b!1047088 (= e!593676 e!593680)))

(assert (=> b!1047088 (= c!106761 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1047089 () Bool)

(assert (=> b!1047089 (= e!593668 call!44627)))

(declare-fun b!1047090 () Bool)

(declare-fun c!106760 () Bool)

(assert (=> b!1047090 (= c!106760 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1047090 (= e!593680 e!593668)))

(declare-fun b!1047091 () Bool)

(declare-fun e!593669 () Bool)

(assert (=> b!1047091 (= e!593669 (= (apply!924 lt!462296 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6253 thiss!1427)))))

(declare-fun bm!44626 () Bool)

(assert (=> bm!44626 (= call!44629 (getCurrentListMapNoExtraKeys!3575 lt!462109 lt!462112 (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun bm!44623 () Bool)

(assert (=> bm!44623 (= call!44627 call!44630)))

(declare-fun d!127033 () Bool)

(assert (=> d!127033 e!593675))

(declare-fun res!696764 () Bool)

(assert (=> d!127033 (=> (not res!696764) (not e!593675))))

(assert (=> d!127033 (= res!696764 (or (bvsge #b00000000000000000000000000000000 (size!32247 lt!462109)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32247 lt!462109)))))))

(declare-fun lt!462287 () ListLongMap!13799)

(assert (=> d!127033 (= lt!462296 lt!462287)))

(declare-fun lt!462292 () Unit!34165)

(declare-fun e!593679 () Unit!34165)

(assert (=> d!127033 (= lt!462292 e!593679)))

(declare-fun c!106762 () Bool)

(assert (=> d!127033 (= c!106762 e!593673)))

(declare-fun res!696763 () Bool)

(assert (=> d!127033 (=> (not res!696763) (not e!593673))))

(assert (=> d!127033 (= res!696763 (bvslt #b00000000000000000000000000000000 (size!32247 lt!462109)))))

(assert (=> d!127033 (= lt!462287 e!593676)))

(assert (=> d!127033 (= c!106764 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!127033 (validMask!0 (mask!30610 thiss!1427))))

(assert (=> d!127033 (= (getCurrentListMap!3959 lt!462109 lt!462112 (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)) lt!462296)))

(declare-fun b!1047092 () Bool)

(assert (=> b!1047092 (= e!593674 e!593669)))

(declare-fun res!696770 () Bool)

(assert (=> b!1047092 (= res!696770 call!44626)))

(assert (=> b!1047092 (=> (not res!696770) (not e!593669))))

(declare-fun b!1047093 () Bool)

(declare-fun lt!462288 () Unit!34165)

(assert (=> b!1047093 (= e!593679 lt!462288)))

(declare-fun lt!462304 () ListLongMap!13799)

(assert (=> b!1047093 (= lt!462304 (getCurrentListMapNoExtraKeys!3575 lt!462109 lt!462112 (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!462297 () (_ BitVec 64))

(assert (=> b!1047093 (= lt!462297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462293 () (_ BitVec 64))

(assert (=> b!1047093 (= lt!462293 (select (arr!31711 lt!462109) #b00000000000000000000000000000000))))

(declare-fun lt!462285 () Unit!34165)

(assert (=> b!1047093 (= lt!462285 (addStillContains!634 lt!462304 lt!462297 (zeroValue!6253 thiss!1427) lt!462293))))

(assert (=> b!1047093 (contains!6109 (+!3135 lt!462304 (tuple2!15793 lt!462297 (zeroValue!6253 thiss!1427))) lt!462293)))

(declare-fun lt!462302 () Unit!34165)

(assert (=> b!1047093 (= lt!462302 lt!462285)))

(declare-fun lt!462289 () ListLongMap!13799)

(assert (=> b!1047093 (= lt!462289 (getCurrentListMapNoExtraKeys!3575 lt!462109 lt!462112 (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!462290 () (_ BitVec 64))

(assert (=> b!1047093 (= lt!462290 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462301 () (_ BitVec 64))

(assert (=> b!1047093 (= lt!462301 (select (arr!31711 lt!462109) #b00000000000000000000000000000000))))

(declare-fun lt!462298 () Unit!34165)

(assert (=> b!1047093 (= lt!462298 (addApplyDifferent!490 lt!462289 lt!462290 (minValue!6253 thiss!1427) lt!462301))))

(assert (=> b!1047093 (= (apply!924 (+!3135 lt!462289 (tuple2!15793 lt!462290 (minValue!6253 thiss!1427))) lt!462301) (apply!924 lt!462289 lt!462301))))

(declare-fun lt!462299 () Unit!34165)

(assert (=> b!1047093 (= lt!462299 lt!462298)))

(declare-fun lt!462303 () ListLongMap!13799)

(assert (=> b!1047093 (= lt!462303 (getCurrentListMapNoExtraKeys!3575 lt!462109 lt!462112 (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!462305 () (_ BitVec 64))

(assert (=> b!1047093 (= lt!462305 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462295 () (_ BitVec 64))

(assert (=> b!1047093 (= lt!462295 (select (arr!31711 lt!462109) #b00000000000000000000000000000000))))

(declare-fun lt!462306 () Unit!34165)

(assert (=> b!1047093 (= lt!462306 (addApplyDifferent!490 lt!462303 lt!462305 (zeroValue!6253 thiss!1427) lt!462295))))

(assert (=> b!1047093 (= (apply!924 (+!3135 lt!462303 (tuple2!15793 lt!462305 (zeroValue!6253 thiss!1427))) lt!462295) (apply!924 lt!462303 lt!462295))))

(declare-fun lt!462300 () Unit!34165)

(assert (=> b!1047093 (= lt!462300 lt!462306)))

(declare-fun lt!462291 () ListLongMap!13799)

(assert (=> b!1047093 (= lt!462291 (getCurrentListMapNoExtraKeys!3575 lt!462109 lt!462112 (mask!30610 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!462286 () (_ BitVec 64))

(assert (=> b!1047093 (= lt!462286 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462294 () (_ BitVec 64))

(assert (=> b!1047093 (= lt!462294 (select (arr!31711 lt!462109) #b00000000000000000000000000000000))))

(assert (=> b!1047093 (= lt!462288 (addApplyDifferent!490 lt!462291 lt!462286 (minValue!6253 thiss!1427) lt!462294))))

(assert (=> b!1047093 (= (apply!924 (+!3135 lt!462291 (tuple2!15793 lt!462286 (minValue!6253 thiss!1427))) lt!462294) (apply!924 lt!462291 lt!462294))))

(declare-fun bm!44627 () Bool)

(assert (=> bm!44627 (= call!44626 (contains!6109 lt!462296 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047094 () Bool)

(assert (=> b!1047094 (= e!593672 (= (apply!924 lt!462296 (select (arr!31711 lt!462109) #b00000000000000000000000000000000)) (get!16591 (select (arr!31712 lt!462112) #b00000000000000000000000000000000) (dynLambda!2030 (defaultEntry!6419 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1047094 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32248 lt!462112)))))

(assert (=> b!1047094 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32247 lt!462109)))))

(declare-fun b!1047095 () Bool)

(declare-fun Unit!34175 () Unit!34165)

(assert (=> b!1047095 (= e!593679 Unit!34175)))

(declare-fun bm!44628 () Bool)

(assert (=> bm!44628 (= call!44628 call!44629)))

(declare-fun b!1047096 () Bool)

(assert (=> b!1047096 (= e!593675 e!593671)))

(declare-fun c!106763 () Bool)

(assert (=> b!1047096 (= c!106763 (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!127033 c!106764) b!1047081))

(assert (= (and d!127033 (not c!106764)) b!1047088))

(assert (= (and b!1047088 c!106761) b!1047085))

(assert (= (and b!1047088 (not c!106761)) b!1047090))

(assert (= (and b!1047090 c!106760) b!1047089))

(assert (= (and b!1047090 (not c!106760)) b!1047084))

(assert (= (or b!1047089 b!1047084) bm!44624))

(assert (= (or b!1047085 bm!44624) bm!44628))

(assert (= (or b!1047085 b!1047089) bm!44623))

(assert (= (or b!1047081 bm!44628) bm!44626))

(assert (= (or b!1047081 bm!44623) bm!44625))

(assert (= (and d!127033 res!696763) b!1047086))

(assert (= (and d!127033 c!106762) b!1047093))

(assert (= (and d!127033 (not c!106762)) b!1047095))

(assert (= (and d!127033 res!696764) b!1047080))

(assert (= (and b!1047080 res!696771) b!1047082))

(assert (= (and b!1047080 (not res!696766)) b!1047078))

(assert (= (and b!1047078 res!696767) b!1047094))

(assert (= (and b!1047080 res!696765) b!1047087))

(assert (= (and b!1047087 c!106759) b!1047092))

(assert (= (and b!1047087 (not c!106759)) b!1047083))

(assert (= (and b!1047092 res!696770) b!1047091))

(assert (= (or b!1047092 b!1047083) bm!44627))

(assert (= (and b!1047087 res!696769) b!1047096))

(assert (= (and b!1047096 c!106763) b!1047077))

(assert (= (and b!1047096 (not c!106763)) b!1047079))

(assert (= (and b!1047077 res!696768) b!1047076))

(assert (= (or b!1047077 b!1047079) bm!44622))

(declare-fun b_lambda!16331 () Bool)

(assert (=> (not b_lambda!16331) (not b!1047094)))

(assert (=> b!1047094 t!31270))

(declare-fun b_and!33793 () Bool)

(assert (= b_and!33791 (and (=> t!31270 result!14595) b_and!33793)))

(declare-fun m!967229 () Bool)

(assert (=> bm!44625 m!967229))

(declare-fun m!967231 () Bool)

(assert (=> b!1047094 m!967231))

(assert (=> b!1047094 m!966955))

(declare-fun m!967233 () Bool)

(assert (=> b!1047094 m!967233))

(assert (=> b!1047094 m!967091))

(assert (=> b!1047094 m!967231))

(assert (=> b!1047094 m!966955))

(assert (=> b!1047094 m!967091))

(declare-fun m!967235 () Bool)

(assert (=> b!1047094 m!967235))

(assert (=> b!1047078 m!967091))

(assert (=> b!1047078 m!967091))

(declare-fun m!967237 () Bool)

(assert (=> b!1047078 m!967237))

(declare-fun m!967239 () Bool)

(assert (=> bm!44626 m!967239))

(declare-fun m!967241 () Bool)

(assert (=> b!1047091 m!967241))

(declare-fun m!967243 () Bool)

(assert (=> b!1047076 m!967243))

(assert (=> b!1047086 m!967091))

(assert (=> b!1047086 m!967091))

(assert (=> b!1047086 m!967093))

(declare-fun m!967245 () Bool)

(assert (=> b!1047093 m!967245))

(declare-fun m!967247 () Bool)

(assert (=> b!1047093 m!967247))

(declare-fun m!967249 () Bool)

(assert (=> b!1047093 m!967249))

(declare-fun m!967251 () Bool)

(assert (=> b!1047093 m!967251))

(declare-fun m!967253 () Bool)

(assert (=> b!1047093 m!967253))

(declare-fun m!967255 () Bool)

(assert (=> b!1047093 m!967255))

(assert (=> b!1047093 m!967091))

(declare-fun m!967257 () Bool)

(assert (=> b!1047093 m!967257))

(declare-fun m!967259 () Bool)

(assert (=> b!1047093 m!967259))

(declare-fun m!967261 () Bool)

(assert (=> b!1047093 m!967261))

(assert (=> b!1047093 m!967253))

(assert (=> b!1047093 m!967257))

(declare-fun m!967263 () Bool)

(assert (=> b!1047093 m!967263))

(declare-fun m!967265 () Bool)

(assert (=> b!1047093 m!967265))

(declare-fun m!967267 () Bool)

(assert (=> b!1047093 m!967267))

(assert (=> b!1047093 m!967251))

(declare-fun m!967269 () Bool)

(assert (=> b!1047093 m!967269))

(assert (=> b!1047093 m!967239))

(assert (=> b!1047093 m!967267))

(declare-fun m!967271 () Bool)

(assert (=> b!1047093 m!967271))

(declare-fun m!967273 () Bool)

(assert (=> b!1047093 m!967273))

(assert (=> b!1047082 m!967091))

(assert (=> b!1047082 m!967091))

(assert (=> b!1047082 m!967093))

(declare-fun m!967275 () Bool)

(assert (=> b!1047081 m!967275))

(assert (=> d!127033 m!967075))

(declare-fun m!967277 () Bool)

(assert (=> bm!44627 m!967277))

(declare-fun m!967279 () Bool)

(assert (=> bm!44622 m!967279))

(assert (=> b!1046854 d!127033))

(declare-fun bm!44631 () Bool)

(declare-fun call!44634 () Bool)

(assert (=> bm!44631 (= call!44634 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!462109 (mask!30610 thiss!1427)))))

(declare-fun b!1047105 () Bool)

(declare-fun e!593688 () Bool)

(assert (=> b!1047105 (= e!593688 call!44634)))

(declare-fun b!1047106 () Bool)

(declare-fun e!593689 () Bool)

(declare-fun e!593687 () Bool)

(assert (=> b!1047106 (= e!593689 e!593687)))

(declare-fun c!106767 () Bool)

(assert (=> b!1047106 (= c!106767 (validKeyInArray!0 (select (arr!31711 lt!462109) #b00000000000000000000000000000000)))))

(declare-fun d!127035 () Bool)

(declare-fun res!696777 () Bool)

(assert (=> d!127035 (=> res!696777 e!593689)))

(assert (=> d!127035 (= res!696777 (bvsge #b00000000000000000000000000000000 (size!32247 lt!462109)))))

(assert (=> d!127035 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462109 (mask!30610 thiss!1427)) e!593689)))

(declare-fun b!1047107 () Bool)

(assert (=> b!1047107 (= e!593687 e!593688)))

(declare-fun lt!462314 () (_ BitVec 64))

(assert (=> b!1047107 (= lt!462314 (select (arr!31711 lt!462109) #b00000000000000000000000000000000))))

(declare-fun lt!462313 () Unit!34165)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65943 (_ BitVec 64) (_ BitVec 32)) Unit!34165)

(assert (=> b!1047107 (= lt!462313 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!462109 lt!462314 #b00000000000000000000000000000000))))

(assert (=> b!1047107 (arrayContainsKey!0 lt!462109 lt!462314 #b00000000000000000000000000000000)))

(declare-fun lt!462315 () Unit!34165)

(assert (=> b!1047107 (= lt!462315 lt!462313)))

(declare-fun res!696776 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65943 (_ BitVec 32)) SeekEntryResult!9804)

(assert (=> b!1047107 (= res!696776 (= (seekEntryOrOpen!0 (select (arr!31711 lt!462109) #b00000000000000000000000000000000) lt!462109 (mask!30610 thiss!1427)) (Found!9804 #b00000000000000000000000000000000)))))

(assert (=> b!1047107 (=> (not res!696776) (not e!593688))))

(declare-fun b!1047108 () Bool)

(assert (=> b!1047108 (= e!593687 call!44634)))

(assert (= (and d!127035 (not res!696777)) b!1047106))

(assert (= (and b!1047106 c!106767) b!1047107))

(assert (= (and b!1047106 (not c!106767)) b!1047108))

(assert (= (and b!1047107 res!696776) b!1047105))

(assert (= (or b!1047105 b!1047108) bm!44631))

(declare-fun m!967281 () Bool)

(assert (=> bm!44631 m!967281))

(assert (=> b!1047106 m!967091))

(assert (=> b!1047106 m!967091))

(assert (=> b!1047106 m!967093))

(assert (=> b!1047107 m!967091))

(declare-fun m!967283 () Bool)

(assert (=> b!1047107 m!967283))

(declare-fun m!967285 () Bool)

(assert (=> b!1047107 m!967285))

(assert (=> b!1047107 m!967091))

(declare-fun m!967287 () Bool)

(assert (=> b!1047107 m!967287))

(assert (=> b!1046854 d!127035))

(declare-fun d!127037 () Bool)

(declare-fun e!593692 () Bool)

(assert (=> d!127037 e!593692))

(declare-fun res!696780 () Bool)

(assert (=> d!127037 (=> (not res!696780) (not e!593692))))

(assert (=> d!127037 (= res!696780 (and (bvsge (index!41588 lt!462114) #b00000000000000000000000000000000) (bvslt (index!41588 lt!462114) (size!32247 (_keys!11729 thiss!1427)))))))

(declare-fun lt!462318 () Unit!34165)

(declare-fun choose!53 (array!65943 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22012) Unit!34165)

(assert (=> d!127037 (= lt!462318 (choose!53 (_keys!11729 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41588 lt!462114) #b00000000000000000000000000000000 Nil!22009))))

(assert (=> d!127037 (bvslt (size!32247 (_keys!11729 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!127037 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11729 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41588 lt!462114) #b00000000000000000000000000000000 Nil!22009) lt!462318)))

(declare-fun b!1047111 () Bool)

(assert (=> b!1047111 (= e!593692 (arrayNoDuplicates!0 (array!65944 (store (arr!31711 (_keys!11729 thiss!1427)) (index!41588 lt!462114) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32247 (_keys!11729 thiss!1427))) #b00000000000000000000000000000000 Nil!22009))))

(assert (= (and d!127037 res!696780) b!1047111))

(declare-fun m!967289 () Bool)

(assert (=> d!127037 m!967289))

(assert (=> b!1047111 m!966927))

(declare-fun m!967291 () Bool)

(assert (=> b!1047111 m!967291))

(assert (=> b!1046854 d!127037))

(declare-fun b!1047123 () Bool)

(declare-fun e!593697 () Bool)

(assert (=> b!1047123 (= e!593697 (= (arrayCountValidKeys!0 (array!65944 (store (arr!31711 (_keys!11729 thiss!1427)) (index!41588 lt!462114) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32247 (_keys!11729 thiss!1427))) #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11729 thiss!1427) #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!127039 () Bool)

(assert (=> d!127039 e!593697))

(declare-fun res!696791 () Bool)

(assert (=> d!127039 (=> (not res!696791) (not e!593697))))

(assert (=> d!127039 (= res!696791 (and (bvsge (index!41588 lt!462114) #b00000000000000000000000000000000) (bvslt (index!41588 lt!462114) (size!32247 (_keys!11729 thiss!1427)))))))

(declare-fun lt!462321 () Unit!34165)

(declare-fun choose!82 (array!65943 (_ BitVec 32) (_ BitVec 64)) Unit!34165)

(assert (=> d!127039 (= lt!462321 (choose!82 (_keys!11729 thiss!1427) (index!41588 lt!462114) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!593698 () Bool)

(assert (=> d!127039 e!593698))

(declare-fun res!696792 () Bool)

(assert (=> d!127039 (=> (not res!696792) (not e!593698))))

(assert (=> d!127039 (= res!696792 (and (bvsge (index!41588 lt!462114) #b00000000000000000000000000000000) (bvslt (index!41588 lt!462114) (size!32247 (_keys!11729 thiss!1427)))))))

(assert (=> d!127039 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11729 thiss!1427) (index!41588 lt!462114) #b1000000000000000000000000000000000000000000000000000000000000000) lt!462321)))

(declare-fun b!1047122 () Bool)

(assert (=> b!1047122 (= e!593698 (bvslt (size!32247 (_keys!11729 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1047121 () Bool)

(declare-fun res!696790 () Bool)

(assert (=> b!1047121 (=> (not res!696790) (not e!593698))))

(assert (=> b!1047121 (= res!696790 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1047120 () Bool)

(declare-fun res!696789 () Bool)

(assert (=> b!1047120 (=> (not res!696789) (not e!593698))))

(assert (=> b!1047120 (= res!696789 (validKeyInArray!0 (select (arr!31711 (_keys!11729 thiss!1427)) (index!41588 lt!462114))))))

(assert (= (and d!127039 res!696792) b!1047120))

(assert (= (and b!1047120 res!696789) b!1047121))

(assert (= (and b!1047121 res!696790) b!1047122))

(assert (= (and d!127039 res!696791) b!1047123))

(assert (=> b!1047123 m!966927))

(declare-fun m!967293 () Bool)

(assert (=> b!1047123 m!967293))

(assert (=> b!1047123 m!966935))

(declare-fun m!967295 () Bool)

(assert (=> d!127039 m!967295))

(declare-fun m!967297 () Bool)

(assert (=> b!1047121 m!967297))

(declare-fun m!967299 () Bool)

(assert (=> b!1047120 m!967299))

(assert (=> b!1047120 m!967299))

(declare-fun m!967301 () Bool)

(assert (=> b!1047120 m!967301))

(assert (=> b!1046854 d!127039))

(declare-fun b!1047124 () Bool)

(declare-fun e!593699 () (_ BitVec 32))

(declare-fun e!593700 () (_ BitVec 32))

(assert (=> b!1047124 (= e!593699 e!593700)))

(declare-fun c!106769 () Bool)

(assert (=> b!1047124 (= c!106769 (validKeyInArray!0 (select (arr!31711 (_keys!11729 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44632 () Bool)

(declare-fun call!44635 () (_ BitVec 32))

(assert (=> bm!44632 (= call!44635 (arrayCountValidKeys!0 (_keys!11729 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32247 (_keys!11729 thiss!1427))))))

(declare-fun d!127041 () Bool)

(declare-fun lt!462322 () (_ BitVec 32))

(assert (=> d!127041 (and (bvsge lt!462322 #b00000000000000000000000000000000) (bvsle lt!462322 (bvsub (size!32247 (_keys!11729 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!127041 (= lt!462322 e!593699)))

(declare-fun c!106768 () Bool)

(assert (=> d!127041 (= c!106768 (bvsge #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))))))

(assert (=> d!127041 (and (bvsle #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32247 (_keys!11729 thiss!1427)) (size!32247 (_keys!11729 thiss!1427))))))

(assert (=> d!127041 (= (arrayCountValidKeys!0 (_keys!11729 thiss!1427) #b00000000000000000000000000000000 (size!32247 (_keys!11729 thiss!1427))) lt!462322)))

(declare-fun b!1047125 () Bool)

(assert (=> b!1047125 (= e!593700 (bvadd #b00000000000000000000000000000001 call!44635))))

(declare-fun b!1047126 () Bool)

(assert (=> b!1047126 (= e!593699 #b00000000000000000000000000000000)))

(declare-fun b!1047127 () Bool)

(assert (=> b!1047127 (= e!593700 call!44635)))

(assert (= (and d!127041 c!106768) b!1047126))

(assert (= (and d!127041 (not c!106768)) b!1047124))

(assert (= (and b!1047124 c!106769) b!1047125))

(assert (= (and b!1047124 (not c!106769)) b!1047127))

(assert (= (or b!1047125 b!1047127) bm!44632))

(assert (=> b!1047124 m!967103))

(assert (=> b!1047124 m!967103))

(assert (=> b!1047124 m!967115))

(declare-fun m!967303 () Bool)

(assert (=> bm!44632 m!967303))

(assert (=> b!1046854 d!127041))

(declare-fun d!127043 () Bool)

(declare-fun e!593705 () Bool)

(assert (=> d!127043 e!593705))

(declare-fun res!696795 () Bool)

(assert (=> d!127043 (=> res!696795 e!593705)))

(declare-fun lt!462333 () Bool)

(assert (=> d!127043 (= res!696795 (not lt!462333))))

(declare-fun lt!462334 () Bool)

(assert (=> d!127043 (= lt!462333 lt!462334)))

(declare-fun lt!462331 () Unit!34165)

(declare-fun e!593706 () Unit!34165)

(assert (=> d!127043 (= lt!462331 e!593706)))

(declare-fun c!106772 () Bool)

(assert (=> d!127043 (= c!106772 lt!462334)))

(declare-fun containsKey!572 (List!22011 (_ BitVec 64)) Bool)

(assert (=> d!127043 (= lt!462334 (containsKey!572 (toList!6915 (getCurrentListMap!3959 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111)))) key!909))))

(assert (=> d!127043 (= (contains!6109 (getCurrentListMap!3959 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111))) key!909) lt!462333)))

(declare-fun b!1047134 () Bool)

(declare-fun lt!462332 () Unit!34165)

(assert (=> b!1047134 (= e!593706 lt!462332)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!403 (List!22011 (_ BitVec 64)) Unit!34165)

(assert (=> b!1047134 (= lt!462332 (lemmaContainsKeyImpliesGetValueByKeyDefined!403 (toList!6915 (getCurrentListMap!3959 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111)))) key!909))))

(declare-datatypes ((Option!642 0))(
  ( (Some!641 (v!15075 V!38019)) (None!640) )
))
(declare-fun isDefined!441 (Option!642) Bool)

(declare-fun getValueByKey!591 (List!22011 (_ BitVec 64)) Option!642)

(assert (=> b!1047134 (isDefined!441 (getValueByKey!591 (toList!6915 (getCurrentListMap!3959 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111)))) key!909))))

(declare-fun b!1047135 () Bool)

(declare-fun Unit!34176 () Unit!34165)

(assert (=> b!1047135 (= e!593706 Unit!34176)))

(declare-fun b!1047136 () Bool)

(assert (=> b!1047136 (= e!593705 (isDefined!441 (getValueByKey!591 (toList!6915 (getCurrentListMap!3959 (_keys!11729 (_2!7906 lt!462111)) (_values!6442 (_2!7906 lt!462111)) (mask!30610 (_2!7906 lt!462111)) (extraKeys!6147 (_2!7906 lt!462111)) (zeroValue!6253 (_2!7906 lt!462111)) (minValue!6253 (_2!7906 lt!462111)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7906 lt!462111)))) key!909)))))

(assert (= (and d!127043 c!106772) b!1047134))

(assert (= (and d!127043 (not c!106772)) b!1047135))

(assert (= (and d!127043 (not res!696795)) b!1047136))

(declare-fun m!967305 () Bool)

(assert (=> d!127043 m!967305))

(declare-fun m!967307 () Bool)

(assert (=> b!1047134 m!967307))

(declare-fun m!967309 () Bool)

(assert (=> b!1047134 m!967309))

(assert (=> b!1047134 m!967309))

(declare-fun m!967311 () Bool)

(assert (=> b!1047134 m!967311))

(assert (=> b!1047136 m!967309))

(assert (=> b!1047136 m!967309))

(assert (=> b!1047136 m!967311))

(assert (=> b!1046854 d!127043))

(declare-fun b!1047144 () Bool)

(declare-fun e!593711 () Bool)

(assert (=> b!1047144 (= e!593711 tp_is_empty!24859)))

(declare-fun mapNonEmpty!38939 () Bool)

(declare-fun mapRes!38939 () Bool)

(declare-fun tp!74691 () Bool)

(declare-fun e!593712 () Bool)

(assert (=> mapNonEmpty!38939 (= mapRes!38939 (and tp!74691 e!593712))))

(declare-fun mapRest!38939 () (Array (_ BitVec 32) ValueCell!11726))

(declare-fun mapValue!38939 () ValueCell!11726)

(declare-fun mapKey!38939 () (_ BitVec 32))

(assert (=> mapNonEmpty!38939 (= mapRest!38930 (store mapRest!38939 mapKey!38939 mapValue!38939))))

(declare-fun mapIsEmpty!38939 () Bool)

(assert (=> mapIsEmpty!38939 mapRes!38939))

(declare-fun condMapEmpty!38939 () Bool)

(declare-fun mapDefault!38939 () ValueCell!11726)

(assert (=> mapNonEmpty!38930 (= condMapEmpty!38939 (= mapRest!38930 ((as const (Array (_ BitVec 32) ValueCell!11726)) mapDefault!38939)))))

(assert (=> mapNonEmpty!38930 (= tp!74675 (and e!593711 mapRes!38939))))

(declare-fun b!1047143 () Bool)

(assert (=> b!1047143 (= e!593712 tp_is_empty!24859)))

(assert (= (and mapNonEmpty!38930 condMapEmpty!38939) mapIsEmpty!38939))

(assert (= (and mapNonEmpty!38930 (not condMapEmpty!38939)) mapNonEmpty!38939))

(assert (= (and mapNonEmpty!38939 ((_ is ValueCellFull!11726) mapValue!38939)) b!1047143))

(assert (= (and mapNonEmpty!38930 ((_ is ValueCellFull!11726) mapDefault!38939)) b!1047144))

(declare-fun m!967313 () Bool)

(assert (=> mapNonEmpty!38939 m!967313))

(declare-fun b_lambda!16333 () Bool)

(assert (= b_lambda!16329 (or (and b!1046860 b_free!21139) b_lambda!16333)))

(declare-fun b_lambda!16335 () Bool)

(assert (= b_lambda!16331 (or (and b!1046860 b_free!21139) b_lambda!16335)))

(declare-fun b_lambda!16337 () Bool)

(assert (= b_lambda!16325 (or (and b!1046860 b_free!21139) b_lambda!16337)))

(check-sat (not d!127019) (not b_lambda!16333) (not d!127015) (not bm!44627) (not bm!44612) (not b!1046949) (not bm!44610) (not b!1047045) (not d!127007) (not b!1046961) (not b!1046952) (not b!1047120) (not d!127029) (not b!1047063) (not b!1047046) (not b!1047121) (not bm!44615) (not b!1047024) (not b!1047012) (not b!1046947) (not d!127033) (not b!1047025) (not b!1047066) (not bm!44617) (not b!1047007) (not b!1047075) (not b!1047043) (not b!1046938) (not b!1047078) (not d!127009) (not d!127039) (not b!1047136) (not bm!44631) (not b_lambda!16327) (not b!1047091) (not b!1047086) (not b!1047062) (not b!1047076) (not b!1047034) (not bm!44590) (not b!1047030) (not b_lambda!16335) (not bm!44626) (not b_next!21139) (not d!127043) (not b!1047038) (not b!1047009) (not bm!44616) (not b!1046948) (not b!1047106) (not b!1047051) (not b!1047124) (not bm!44632) (not d!127021) b_and!33793 (not bm!44608) (not d!127037) tp_is_empty!24859 (not b_lambda!16337) (not d!127025) (not b!1047093) (not bm!44621) (not b!1047111) (not b!1047082) (not bm!44622) (not b!1047013) (not b!1047028) (not b!1047081) (not bm!44609) (not bm!44605) (not b!1047094) (not bm!44625) (not b!1047107) (not b!1047123) (not b!1047017) (not b_lambda!16323) (not mapNonEmpty!38939) (not d!127023) (not b!1047134) (not b!1047033) (not b!1047069) (not b!1047022))
(check-sat b_and!33793 (not b_next!21139))
