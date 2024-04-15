; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89804 () Bool)

(assert start!89804)

(declare-fun b!1028980 () Bool)

(declare-fun b_free!20593 () Bool)

(declare-fun b_next!20593 () Bool)

(assert (=> b!1028980 (= b_free!20593 (not b_next!20593))))

(declare-fun tp!72839 () Bool)

(declare-fun b_and!32885 () Bool)

(assert (=> b!1028980 (= tp!72839 b_and!32885)))

(declare-fun b!1028979 () Bool)

(declare-fun e!580914 () Bool)

(declare-fun e!580913 () Bool)

(assert (=> b!1028979 (= e!580914 (not e!580913))))

(declare-fun res!688402 () Bool)

(assert (=> b!1028979 (=> res!688402 e!580913)))

(declare-datatypes ((V!37291 0))(
  ( (V!37292 (val!12207 Int)) )
))
(declare-datatypes ((ValueCell!11453 0))(
  ( (ValueCellFull!11453 (v!14779 V!37291)) (EmptyCell!11453) )
))
(declare-datatypes ((Unit!33495 0))(
  ( (Unit!33496) )
))
(declare-datatypes ((array!64623 0))(
  ( (array!64624 (arr!31116 (Array (_ BitVec 32) (_ BitVec 64))) (size!31633 (_ BitVec 32))) )
))
(declare-datatypes ((array!64625 0))(
  ( (array!64626 (arr!31117 (Array (_ BitVec 32) ValueCell!11453)) (size!31634 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5500 0))(
  ( (LongMapFixedSize!5501 (defaultEntry!6114 Int) (mask!29861 (_ BitVec 32)) (extraKeys!5846 (_ BitVec 32)) (zeroValue!5950 V!37291) (minValue!5950 V!37291) (_size!2805 (_ BitVec 32)) (_keys!11271 array!64623) (_values!6137 array!64625) (_vacant!2805 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15644 0))(
  ( (tuple2!15645 (_1!7833 Unit!33495) (_2!7833 LongMapFixedSize!5500)) )
))
(declare-fun lt!453353 () tuple2!15644)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028979 (= res!688402 (not (validMask!0 (mask!29861 (_2!7833 lt!453353)))))))

(declare-fun lt!453350 () array!64625)

(declare-fun thiss!1427 () LongMapFixedSize!5500)

(declare-fun lt!453355 () array!64623)

(declare-fun Unit!33497 () Unit!33495)

(declare-fun Unit!33498 () Unit!33495)

(assert (=> b!1028979 (= lt!453353 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2805 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15645 Unit!33497 (LongMapFixedSize!5501 (defaultEntry!6114 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvsub (_size!2805 thiss!1427) #b00000000000000000000000000000001) lt!453355 lt!453350 (bvadd #b00000000000000000000000000000001 (_vacant!2805 thiss!1427)))) (tuple2!15645 Unit!33498 (LongMapFixedSize!5501 (defaultEntry!6114 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvsub (_size!2805 thiss!1427) #b00000000000000000000000000000001) lt!453355 lt!453350 (_vacant!2805 thiss!1427)))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15646 0))(
  ( (tuple2!15647 (_1!7834 (_ BitVec 64)) (_2!7834 V!37291)) )
))
(declare-datatypes ((List!21856 0))(
  ( (Nil!21853) (Cons!21852 (h!23052 tuple2!15646) (t!30935 List!21856)) )
))
(declare-datatypes ((ListLongMap!13757 0))(
  ( (ListLongMap!13758 (toList!6894 List!21856)) )
))
(declare-fun -!486 (ListLongMap!13757 (_ BitVec 64)) ListLongMap!13757)

(declare-fun getCurrentListMap!3861 (array!64623 array!64625 (_ BitVec 32) (_ BitVec 32) V!37291 V!37291 (_ BitVec 32) Int) ListLongMap!13757)

(assert (=> b!1028979 (= (-!486 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) key!909) (getCurrentListMap!3861 lt!453355 lt!453350 (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9672 0))(
  ( (MissingZero!9672 (index!41059 (_ BitVec 32))) (Found!9672 (index!41060 (_ BitVec 32))) (Intermediate!9672 (undefined!10484 Bool) (index!41061 (_ BitVec 32)) (x!91573 (_ BitVec 32))) (Undefined!9672) (MissingVacant!9672 (index!41062 (_ BitVec 32))) )
))
(declare-fun lt!453354 () SeekEntryResult!9672)

(declare-fun dynLambda!1948 (Int (_ BitVec 64)) V!37291)

(assert (=> b!1028979 (= lt!453350 (array!64626 (store (arr!31117 (_values!6137 thiss!1427)) (index!41060 lt!453354) (ValueCellFull!11453 (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31634 (_values!6137 thiss!1427))))))

(declare-fun lt!453357 () Unit!33495)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!11 (array!64623 array!64625 (_ BitVec 32) (_ BitVec 32) V!37291 V!37291 (_ BitVec 32) (_ BitVec 64) Int) Unit!33495)

(assert (=> b!1028979 (= lt!453357 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!11 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (index!41060 lt!453354) key!909 (defaultEntry!6114 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028979 (not (arrayContainsKey!0 lt!453355 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453349 () Unit!33495)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64623 (_ BitVec 32) (_ BitVec 64)) Unit!33495)

(assert (=> b!1028979 (= lt!453349 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11271 thiss!1427) (index!41060 lt!453354) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64623 (_ BitVec 32)) Bool)

(assert (=> b!1028979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453355 (mask!29861 thiss!1427))))

(declare-fun lt!453352 () Unit!33495)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64623 (_ BitVec 32) (_ BitVec 32)) Unit!33495)

(assert (=> b!1028979 (= lt!453352 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11271 thiss!1427) (index!41060 lt!453354) (mask!29861 thiss!1427)))))

(declare-datatypes ((List!21857 0))(
  ( (Nil!21854) (Cons!21853 (h!23053 (_ BitVec 64)) (t!30936 List!21857)) )
))
(declare-fun arrayNoDuplicates!0 (array!64623 (_ BitVec 32) List!21857) Bool)

(assert (=> b!1028979 (arrayNoDuplicates!0 lt!453355 #b00000000000000000000000000000000 Nil!21854)))

(declare-fun lt!453356 () Unit!33495)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64623 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21857) Unit!33495)

(assert (=> b!1028979 (= lt!453356 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11271 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41060 lt!453354) #b00000000000000000000000000000000 Nil!21854))))

(declare-fun arrayCountValidKeys!0 (array!64623 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028979 (= (arrayCountValidKeys!0 lt!453355 #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11271 thiss!1427) #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028979 (= lt!453355 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun lt!453351 () Unit!33495)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64623 (_ BitVec 32) (_ BitVec 64)) Unit!33495)

(assert (=> b!1028979 (= lt!453351 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11271 thiss!1427) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!688403 () Bool)

(declare-fun e!580916 () Bool)

(assert (=> start!89804 (=> (not res!688403) (not e!580916))))

(declare-fun valid!2075 (LongMapFixedSize!5500) Bool)

(assert (=> start!89804 (= res!688403 (valid!2075 thiss!1427))))

(assert (=> start!89804 e!580916))

(declare-fun e!580911 () Bool)

(assert (=> start!89804 e!580911))

(assert (=> start!89804 true))

(declare-fun tp_is_empty!24313 () Bool)

(declare-fun e!580912 () Bool)

(declare-fun array_inv!24091 (array!64623) Bool)

(declare-fun array_inv!24092 (array!64625) Bool)

(assert (=> b!1028980 (= e!580911 (and tp!72839 tp_is_empty!24313 (array_inv!24091 (_keys!11271 thiss!1427)) (array_inv!24092 (_values!6137 thiss!1427)) e!580912))))

(declare-fun mapNonEmpty!37912 () Bool)

(declare-fun mapRes!37912 () Bool)

(declare-fun tp!72838 () Bool)

(declare-fun e!580910 () Bool)

(assert (=> mapNonEmpty!37912 (= mapRes!37912 (and tp!72838 e!580910))))

(declare-fun mapValue!37912 () ValueCell!11453)

(declare-fun mapRest!37912 () (Array (_ BitVec 32) ValueCell!11453))

(declare-fun mapKey!37912 () (_ BitVec 32))

(assert (=> mapNonEmpty!37912 (= (arr!31117 (_values!6137 thiss!1427)) (store mapRest!37912 mapKey!37912 mapValue!37912))))

(declare-fun mapIsEmpty!37912 () Bool)

(assert (=> mapIsEmpty!37912 mapRes!37912))

(declare-fun b!1028981 () Bool)

(declare-fun res!688404 () Bool)

(assert (=> b!1028981 (=> (not res!688404) (not e!580916))))

(assert (=> b!1028981 (= res!688404 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1028982 () Bool)

(assert (=> b!1028982 (= e!580910 tp_is_empty!24313)))

(declare-fun b!1028983 () Bool)

(declare-fun e!580915 () Bool)

(assert (=> b!1028983 (= e!580912 (and e!580915 mapRes!37912))))

(declare-fun condMapEmpty!37912 () Bool)

(declare-fun mapDefault!37912 () ValueCell!11453)

(assert (=> b!1028983 (= condMapEmpty!37912 (= (arr!31117 (_values!6137 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11453)) mapDefault!37912)))))

(declare-fun b!1028984 () Bool)

(assert (=> b!1028984 (= e!580913 (or (not (= (size!31634 (_values!6137 (_2!7833 lt!453353))) (bvadd #b00000000000000000000000000000001 (mask!29861 (_2!7833 lt!453353))))) (not (= (size!31633 (_keys!11271 (_2!7833 lt!453353))) (size!31634 (_values!6137 (_2!7833 lt!453353))))) (bvslt (mask!29861 (_2!7833 lt!453353)) #b00000000000000000000000000000000) (bvsge (extraKeys!5846 (_2!7833 lt!453353)) #b00000000000000000000000000000000)))))

(declare-fun b!1028985 () Bool)

(assert (=> b!1028985 (= e!580916 e!580914)))

(declare-fun res!688401 () Bool)

(assert (=> b!1028985 (=> (not res!688401) (not e!580914))))

(get-info :version)

(assert (=> b!1028985 (= res!688401 ((_ is Found!9672) lt!453354))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64623 (_ BitVec 32)) SeekEntryResult!9672)

(assert (=> b!1028985 (= lt!453354 (seekEntry!0 key!909 (_keys!11271 thiss!1427) (mask!29861 thiss!1427)))))

(declare-fun b!1028986 () Bool)

(assert (=> b!1028986 (= e!580915 tp_is_empty!24313)))

(assert (= (and start!89804 res!688403) b!1028981))

(assert (= (and b!1028981 res!688404) b!1028985))

(assert (= (and b!1028985 res!688401) b!1028979))

(assert (= (and b!1028979 (not res!688402)) b!1028984))

(assert (= (and b!1028983 condMapEmpty!37912) mapIsEmpty!37912))

(assert (= (and b!1028983 (not condMapEmpty!37912)) mapNonEmpty!37912))

(assert (= (and mapNonEmpty!37912 ((_ is ValueCellFull!11453) mapValue!37912)) b!1028982))

(assert (= (and b!1028983 ((_ is ValueCellFull!11453) mapDefault!37912)) b!1028986))

(assert (= b!1028980 b!1028983))

(assert (= start!89804 b!1028980))

(declare-fun b_lambda!15825 () Bool)

(assert (=> (not b_lambda!15825) (not b!1028979)))

(declare-fun t!30934 () Bool)

(declare-fun tb!6903 () Bool)

(assert (=> (and b!1028980 (= (defaultEntry!6114 thiss!1427) (defaultEntry!6114 thiss!1427)) t!30934) tb!6903))

(declare-fun result!14137 () Bool)

(assert (=> tb!6903 (= result!14137 tp_is_empty!24313)))

(assert (=> b!1028979 t!30934))

(declare-fun b_and!32887 () Bool)

(assert (= b_and!32885 (and (=> t!30934 result!14137) b_and!32887)))

(declare-fun m!947623 () Bool)

(assert (=> start!89804 m!947623))

(declare-fun m!947625 () Bool)

(assert (=> b!1028979 m!947625))

(declare-fun m!947627 () Bool)

(assert (=> b!1028979 m!947627))

(declare-fun m!947629 () Bool)

(assert (=> b!1028979 m!947629))

(declare-fun m!947631 () Bool)

(assert (=> b!1028979 m!947631))

(declare-fun m!947633 () Bool)

(assert (=> b!1028979 m!947633))

(declare-fun m!947635 () Bool)

(assert (=> b!1028979 m!947635))

(declare-fun m!947637 () Bool)

(assert (=> b!1028979 m!947637))

(declare-fun m!947639 () Bool)

(assert (=> b!1028979 m!947639))

(declare-fun m!947641 () Bool)

(assert (=> b!1028979 m!947641))

(declare-fun m!947643 () Bool)

(assert (=> b!1028979 m!947643))

(declare-fun m!947645 () Bool)

(assert (=> b!1028979 m!947645))

(declare-fun m!947647 () Bool)

(assert (=> b!1028979 m!947647))

(declare-fun m!947649 () Bool)

(assert (=> b!1028979 m!947649))

(assert (=> b!1028979 m!947647))

(declare-fun m!947651 () Bool)

(assert (=> b!1028979 m!947651))

(declare-fun m!947653 () Bool)

(assert (=> b!1028979 m!947653))

(declare-fun m!947655 () Bool)

(assert (=> b!1028979 m!947655))

(declare-fun m!947657 () Bool)

(assert (=> b!1028979 m!947657))

(declare-fun m!947659 () Bool)

(assert (=> b!1028985 m!947659))

(declare-fun m!947661 () Bool)

(assert (=> b!1028980 m!947661))

(declare-fun m!947663 () Bool)

(assert (=> b!1028980 m!947663))

(declare-fun m!947665 () Bool)

(assert (=> mapNonEmpty!37912 m!947665))

(check-sat (not start!89804) (not b!1028985) (not b!1028980) tp_is_empty!24313 (not mapNonEmpty!37912) (not b!1028979) b_and!32887 (not b_lambda!15825) (not b_next!20593))
(check-sat b_and!32887 (not b_next!20593))
(get-model)

(declare-fun b_lambda!15831 () Bool)

(assert (= b_lambda!15825 (or (and b!1028980 b_free!20593) b_lambda!15831)))

(check-sat (not start!89804) (not b_lambda!15831) (not b!1028985) (not b!1028980) tp_is_empty!24313 (not mapNonEmpty!37912) (not b!1028979) b_and!32887 (not b_next!20593))
(check-sat b_and!32887 (not b_next!20593))
(get-model)

(declare-fun b!1029054 () Bool)

(declare-fun c!103892 () Bool)

(declare-fun lt!453423 () (_ BitVec 64))

(assert (=> b!1029054 (= c!103892 (= lt!453423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580972 () SeekEntryResult!9672)

(declare-fun e!580971 () SeekEntryResult!9672)

(assert (=> b!1029054 (= e!580972 e!580971)))

(declare-fun b!1029055 () Bool)

(declare-fun lt!453421 () SeekEntryResult!9672)

(assert (=> b!1029055 (= e!580971 (MissingZero!9672 (index!41061 lt!453421)))))

(declare-fun b!1029056 () Bool)

(declare-fun e!580973 () SeekEntryResult!9672)

(assert (=> b!1029056 (= e!580973 e!580972)))

(assert (=> b!1029056 (= lt!453423 (select (arr!31116 (_keys!11271 thiss!1427)) (index!41061 lt!453421)))))

(declare-fun c!103890 () Bool)

(assert (=> b!1029056 (= c!103890 (= lt!453423 key!909))))

(declare-fun b!1029057 () Bool)

(assert (=> b!1029057 (= e!580972 (Found!9672 (index!41061 lt!453421)))))

(declare-fun b!1029058 () Bool)

(assert (=> b!1029058 (= e!580973 Undefined!9672)))

(declare-fun b!1029053 () Bool)

(declare-fun lt!453422 () SeekEntryResult!9672)

(assert (=> b!1029053 (= e!580971 (ite ((_ is MissingVacant!9672) lt!453422) (MissingZero!9672 (index!41062 lt!453422)) lt!453422))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64623 (_ BitVec 32)) SeekEntryResult!9672)

(assert (=> b!1029053 (= lt!453422 (seekKeyOrZeroReturnVacant!0 (x!91573 lt!453421) (index!41061 lt!453421) (index!41061 lt!453421) key!909 (_keys!11271 thiss!1427) (mask!29861 thiss!1427)))))

(declare-fun d!123037 () Bool)

(declare-fun lt!453420 () SeekEntryResult!9672)

(assert (=> d!123037 (and (or ((_ is MissingVacant!9672) lt!453420) (not ((_ is Found!9672) lt!453420)) (and (bvsge (index!41060 lt!453420) #b00000000000000000000000000000000) (bvslt (index!41060 lt!453420) (size!31633 (_keys!11271 thiss!1427))))) (not ((_ is MissingVacant!9672) lt!453420)) (or (not ((_ is Found!9672) lt!453420)) (= (select (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453420)) key!909)))))

(assert (=> d!123037 (= lt!453420 e!580973)))

(declare-fun c!103891 () Bool)

(assert (=> d!123037 (= c!103891 (and ((_ is Intermediate!9672) lt!453421) (undefined!10484 lt!453421)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64623 (_ BitVec 32)) SeekEntryResult!9672)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123037 (= lt!453421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29861 thiss!1427)) key!909 (_keys!11271 thiss!1427) (mask!29861 thiss!1427)))))

(assert (=> d!123037 (validMask!0 (mask!29861 thiss!1427))))

(assert (=> d!123037 (= (seekEntry!0 key!909 (_keys!11271 thiss!1427) (mask!29861 thiss!1427)) lt!453420)))

(assert (= (and d!123037 c!103891) b!1029058))

(assert (= (and d!123037 (not c!103891)) b!1029056))

(assert (= (and b!1029056 c!103890) b!1029057))

(assert (= (and b!1029056 (not c!103890)) b!1029054))

(assert (= (and b!1029054 c!103892) b!1029055))

(assert (= (and b!1029054 (not c!103892)) b!1029053))

(declare-fun m!947755 () Bool)

(assert (=> b!1029056 m!947755))

(declare-fun m!947757 () Bool)

(assert (=> b!1029053 m!947757))

(declare-fun m!947759 () Bool)

(assert (=> d!123037 m!947759))

(declare-fun m!947761 () Bool)

(assert (=> d!123037 m!947761))

(assert (=> d!123037 m!947761))

(declare-fun m!947763 () Bool)

(assert (=> d!123037 m!947763))

(declare-fun m!947765 () Bool)

(assert (=> d!123037 m!947765))

(assert (=> b!1028985 d!123037))

(declare-fun d!123039 () Bool)

(declare-fun res!688435 () Bool)

(declare-fun e!580976 () Bool)

(assert (=> d!123039 (=> (not res!688435) (not e!580976))))

(declare-fun simpleValid!394 (LongMapFixedSize!5500) Bool)

(assert (=> d!123039 (= res!688435 (simpleValid!394 thiss!1427))))

(assert (=> d!123039 (= (valid!2075 thiss!1427) e!580976)))

(declare-fun b!1029065 () Bool)

(declare-fun res!688436 () Bool)

(assert (=> b!1029065 (=> (not res!688436) (not e!580976))))

(assert (=> b!1029065 (= res!688436 (= (arrayCountValidKeys!0 (_keys!11271 thiss!1427) #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) (_size!2805 thiss!1427)))))

(declare-fun b!1029066 () Bool)

(declare-fun res!688437 () Bool)

(assert (=> b!1029066 (=> (not res!688437) (not e!580976))))

(assert (=> b!1029066 (= res!688437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11271 thiss!1427) (mask!29861 thiss!1427)))))

(declare-fun b!1029067 () Bool)

(assert (=> b!1029067 (= e!580976 (arrayNoDuplicates!0 (_keys!11271 thiss!1427) #b00000000000000000000000000000000 Nil!21854))))

(assert (= (and d!123039 res!688435) b!1029065))

(assert (= (and b!1029065 res!688436) b!1029066))

(assert (= (and b!1029066 res!688437) b!1029067))

(declare-fun m!947767 () Bool)

(assert (=> d!123039 m!947767))

(assert (=> b!1029065 m!947639))

(declare-fun m!947769 () Bool)

(assert (=> b!1029066 m!947769))

(declare-fun m!947771 () Bool)

(assert (=> b!1029067 m!947771))

(assert (=> start!89804 d!123039))

(declare-fun d!123041 () Bool)

(assert (=> d!123041 (= (array_inv!24091 (_keys!11271 thiss!1427)) (bvsge (size!31633 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028980 d!123041))

(declare-fun d!123043 () Bool)

(assert (=> d!123043 (= (array_inv!24092 (_values!6137 thiss!1427)) (bvsge (size!31634 (_values!6137 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028980 d!123043))

(declare-fun d!123045 () Bool)

(assert (=> d!123045 (= (validMask!0 (mask!29861 (_2!7833 lt!453353))) (and (or (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000000000000000111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000000000000001111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000000000000011111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000000000000111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000000000001111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000000000011111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000000000111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000000001111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000000011111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000000111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000001111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000011111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000000111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000001111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000011111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000000111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000001111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000011111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000000111111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000001111111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000011111111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000000111111111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000001111111111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000011111111111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00000111111111111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00001111111111111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00011111111111111111111111111111) (= (mask!29861 (_2!7833 lt!453353)) #b00111111111111111111111111111111)) (bvsle (mask!29861 (_2!7833 lt!453353)) #b00111111111111111111111111111111)))))

(assert (=> b!1028979 d!123045))

(declare-fun d!123047 () Bool)

(declare-fun e!580979 () Bool)

(assert (=> d!123047 e!580979))

(declare-fun res!688440 () Bool)

(assert (=> d!123047 (=> (not res!688440) (not e!580979))))

(assert (=> d!123047 (= res!688440 (and (bvsge (index!41060 lt!453354) #b00000000000000000000000000000000) (bvslt (index!41060 lt!453354) (size!31633 (_keys!11271 thiss!1427)))))))

(declare-fun lt!453426 () Unit!33495)

(declare-fun choose!53 (array!64623 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21857) Unit!33495)

(assert (=> d!123047 (= lt!453426 (choose!53 (_keys!11271 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41060 lt!453354) #b00000000000000000000000000000000 Nil!21854))))

(assert (=> d!123047 (bvslt (size!31633 (_keys!11271 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123047 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11271 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41060 lt!453354) #b00000000000000000000000000000000 Nil!21854) lt!453426)))

(declare-fun b!1029070 () Bool)

(assert (=> b!1029070 (= e!580979 (arrayNoDuplicates!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) #b00000000000000000000000000000000 Nil!21854))))

(assert (= (and d!123047 res!688440) b!1029070))

(declare-fun m!947773 () Bool)

(assert (=> d!123047 m!947773))

(assert (=> b!1029070 m!947633))

(declare-fun m!947775 () Bool)

(assert (=> b!1029070 m!947775))

(assert (=> b!1028979 d!123047))

(declare-fun b!1029113 () Bool)

(declare-fun e!581008 () Bool)

(declare-fun e!581007 () Bool)

(assert (=> b!1029113 (= e!581008 e!581007)))

(declare-fun c!103910 () Bool)

(assert (=> b!1029113 (= c!103910 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43423 () Bool)

(declare-fun call!43432 () ListLongMap!13757)

(declare-fun getCurrentListMapNoExtraKeys!3562 (array!64623 array!64625 (_ BitVec 32) (_ BitVec 32) V!37291 V!37291 (_ BitVec 32) Int) ListLongMap!13757)

(assert (=> bm!43423 (= call!43432 (getCurrentListMapNoExtraKeys!3562 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun b!1029114 () Bool)

(declare-fun e!581016 () Bool)

(declare-fun lt!453484 () ListLongMap!13757)

(declare-fun apply!896 (ListLongMap!13757 (_ BitVec 64)) V!37291)

(assert (=> b!1029114 (= e!581016 (= (apply!896 lt!453484 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5950 thiss!1427)))))

(declare-fun b!1029115 () Bool)

(declare-fun e!581012 () ListLongMap!13757)

(declare-fun call!43430 () ListLongMap!13757)

(assert (=> b!1029115 (= e!581012 call!43430)))

(declare-fun b!1029116 () Bool)

(declare-fun e!581018 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1029116 (= e!581018 (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029117 () Bool)

(declare-fun e!581015 () ListLongMap!13757)

(declare-fun call!43426 () ListLongMap!13757)

(assert (=> b!1029117 (= e!581015 call!43426)))

(declare-fun b!1029118 () Bool)

(declare-fun e!581017 () Unit!33495)

(declare-fun lt!453486 () Unit!33495)

(assert (=> b!1029118 (= e!581017 lt!453486)))

(declare-fun lt!453481 () ListLongMap!13757)

(assert (=> b!1029118 (= lt!453481 (getCurrentListMapNoExtraKeys!3562 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453474 () (_ BitVec 64))

(assert (=> b!1029118 (= lt!453474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453485 () (_ BitVec 64))

(assert (=> b!1029118 (= lt!453485 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453473 () Unit!33495)

(declare-fun addStillContains!615 (ListLongMap!13757 (_ BitVec 64) V!37291 (_ BitVec 64)) Unit!33495)

(assert (=> b!1029118 (= lt!453473 (addStillContains!615 lt!453481 lt!453474 (zeroValue!5950 thiss!1427) lt!453485))))

(declare-fun contains!5951 (ListLongMap!13757 (_ BitVec 64)) Bool)

(declare-fun +!3127 (ListLongMap!13757 tuple2!15646) ListLongMap!13757)

(assert (=> b!1029118 (contains!5951 (+!3127 lt!453481 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427))) lt!453485)))

(declare-fun lt!453479 () Unit!33495)

(assert (=> b!1029118 (= lt!453479 lt!453473)))

(declare-fun lt!453472 () ListLongMap!13757)

(assert (=> b!1029118 (= lt!453472 (getCurrentListMapNoExtraKeys!3562 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453482 () (_ BitVec 64))

(assert (=> b!1029118 (= lt!453482 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453483 () (_ BitVec 64))

(assert (=> b!1029118 (= lt!453483 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453488 () Unit!33495)

(declare-fun addApplyDifferent!471 (ListLongMap!13757 (_ BitVec 64) V!37291 (_ BitVec 64)) Unit!33495)

(assert (=> b!1029118 (= lt!453488 (addApplyDifferent!471 lt!453472 lt!453482 (minValue!5950 thiss!1427) lt!453483))))

(assert (=> b!1029118 (= (apply!896 (+!3127 lt!453472 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427))) lt!453483) (apply!896 lt!453472 lt!453483))))

(declare-fun lt!453471 () Unit!33495)

(assert (=> b!1029118 (= lt!453471 lt!453488)))

(declare-fun lt!453478 () ListLongMap!13757)

(assert (=> b!1029118 (= lt!453478 (getCurrentListMapNoExtraKeys!3562 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453489 () (_ BitVec 64))

(assert (=> b!1029118 (= lt!453489 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453480 () (_ BitVec 64))

(assert (=> b!1029118 (= lt!453480 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453491 () Unit!33495)

(assert (=> b!1029118 (= lt!453491 (addApplyDifferent!471 lt!453478 lt!453489 (zeroValue!5950 thiss!1427) lt!453480))))

(assert (=> b!1029118 (= (apply!896 (+!3127 lt!453478 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427))) lt!453480) (apply!896 lt!453478 lt!453480))))

(declare-fun lt!453492 () Unit!33495)

(assert (=> b!1029118 (= lt!453492 lt!453491)))

(declare-fun lt!453487 () ListLongMap!13757)

(assert (=> b!1029118 (= lt!453487 (getCurrentListMapNoExtraKeys!3562 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453477 () (_ BitVec 64))

(assert (=> b!1029118 (= lt!453477 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453490 () (_ BitVec 64))

(assert (=> b!1029118 (= lt!453490 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029118 (= lt!453486 (addApplyDifferent!471 lt!453487 lt!453477 (minValue!5950 thiss!1427) lt!453490))))

(assert (=> b!1029118 (= (apply!896 (+!3127 lt!453487 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427))) lt!453490) (apply!896 lt!453487 lt!453490))))

(declare-fun c!103909 () Bool)

(declare-fun call!43427 () ListLongMap!13757)

(declare-fun bm!43424 () Bool)

(declare-fun c!103907 () Bool)

(declare-fun call!43431 () ListLongMap!13757)

(assert (=> bm!43424 (= call!43431 (+!3127 (ite c!103907 call!43432 (ite c!103909 call!43427 call!43426)) (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(declare-fun b!1029119 () Bool)

(declare-fun e!581014 () Bool)

(assert (=> b!1029119 (= e!581014 (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029120 () Bool)

(declare-fun e!581010 () ListLongMap!13757)

(assert (=> b!1029120 (= e!581010 e!581012)))

(assert (=> b!1029120 (= c!103909 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029121 () Bool)

(declare-fun e!581013 () Bool)

(assert (=> b!1029121 (= e!581013 (= (apply!896 lt!453484 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5950 thiss!1427)))))

(declare-fun bm!43425 () Bool)

(assert (=> bm!43425 (= call!43430 call!43431)))

(declare-fun bm!43426 () Bool)

(declare-fun call!43428 () Bool)

(assert (=> bm!43426 (= call!43428 (contains!5951 lt!453484 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029122 () Bool)

(assert (=> b!1029122 (= e!581007 (not call!43428))))

(declare-fun bm!43427 () Bool)

(assert (=> bm!43427 (= call!43427 call!43432)))

(declare-fun b!1029123 () Bool)

(declare-fun e!581011 () Bool)

(declare-fun get!16351 (ValueCell!11453 V!37291) V!37291)

(assert (=> b!1029123 (= e!581011 (= (apply!896 lt!453484 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)) (get!16351 (select (arr!31117 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029123 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31634 (_values!6137 thiss!1427))))))

(assert (=> b!1029123 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun b!1029124 () Bool)

(assert (=> b!1029124 (= e!581010 (+!3127 call!43431 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))

(declare-fun b!1029125 () Bool)

(declare-fun c!103905 () Bool)

(assert (=> b!1029125 (= c!103905 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1029125 (= e!581012 e!581015)))

(declare-fun bm!43428 () Bool)

(assert (=> bm!43428 (= call!43426 call!43427)))

(declare-fun b!1029126 () Bool)

(declare-fun res!688463 () Bool)

(assert (=> b!1029126 (=> (not res!688463) (not e!581008))))

(declare-fun e!581006 () Bool)

(assert (=> b!1029126 (= res!688463 e!581006)))

(declare-fun res!688460 () Bool)

(assert (=> b!1029126 (=> res!688460 e!581006)))

(assert (=> b!1029126 (= res!688460 (not e!581018))))

(declare-fun res!688466 () Bool)

(assert (=> b!1029126 (=> (not res!688466) (not e!581018))))

(assert (=> b!1029126 (= res!688466 (bvslt #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun b!1029127 () Bool)

(assert (=> b!1029127 (= e!581007 e!581013)))

(declare-fun res!688462 () Bool)

(assert (=> b!1029127 (= res!688462 call!43428)))

(assert (=> b!1029127 (=> (not res!688462) (not e!581013))))

(declare-fun b!1029128 () Bool)

(declare-fun e!581009 () Bool)

(assert (=> b!1029128 (= e!581009 e!581016)))

(declare-fun res!688465 () Bool)

(declare-fun call!43429 () Bool)

(assert (=> b!1029128 (= res!688465 call!43429)))

(assert (=> b!1029128 (=> (not res!688465) (not e!581016))))

(declare-fun bm!43429 () Bool)

(assert (=> bm!43429 (= call!43429 (contains!5951 lt!453484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029129 () Bool)

(assert (=> b!1029129 (= e!581015 call!43430)))

(declare-fun b!1029130 () Bool)

(declare-fun res!688461 () Bool)

(assert (=> b!1029130 (=> (not res!688461) (not e!581008))))

(assert (=> b!1029130 (= res!688461 e!581009)))

(declare-fun c!103908 () Bool)

(assert (=> b!1029130 (= c!103908 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1029131 () Bool)

(declare-fun Unit!33503 () Unit!33495)

(assert (=> b!1029131 (= e!581017 Unit!33503)))

(declare-fun b!1029132 () Bool)

(assert (=> b!1029132 (= e!581009 (not call!43429))))

(declare-fun d!123049 () Bool)

(assert (=> d!123049 e!581008))

(declare-fun res!688467 () Bool)

(assert (=> d!123049 (=> (not res!688467) (not e!581008))))

(assert (=> d!123049 (= res!688467 (or (bvsge #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))))

(declare-fun lt!453476 () ListLongMap!13757)

(assert (=> d!123049 (= lt!453484 lt!453476)))

(declare-fun lt!453475 () Unit!33495)

(assert (=> d!123049 (= lt!453475 e!581017)))

(declare-fun c!103906 () Bool)

(assert (=> d!123049 (= c!103906 e!581014)))

(declare-fun res!688459 () Bool)

(assert (=> d!123049 (=> (not res!688459) (not e!581014))))

(assert (=> d!123049 (= res!688459 (bvslt #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> d!123049 (= lt!453476 e!581010)))

(assert (=> d!123049 (= c!103907 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123049 (validMask!0 (mask!29861 thiss!1427))))

(assert (=> d!123049 (= (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) lt!453484)))

(declare-fun b!1029133 () Bool)

(assert (=> b!1029133 (= e!581006 e!581011)))

(declare-fun res!688464 () Bool)

(assert (=> b!1029133 (=> (not res!688464) (not e!581011))))

(assert (=> b!1029133 (= res!688464 (contains!5951 lt!453484 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029133 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(assert (= (and d!123049 c!103907) b!1029124))

(assert (= (and d!123049 (not c!103907)) b!1029120))

(assert (= (and b!1029120 c!103909) b!1029115))

(assert (= (and b!1029120 (not c!103909)) b!1029125))

(assert (= (and b!1029125 c!103905) b!1029129))

(assert (= (and b!1029125 (not c!103905)) b!1029117))

(assert (= (or b!1029129 b!1029117) bm!43428))

(assert (= (or b!1029115 bm!43428) bm!43427))

(assert (= (or b!1029115 b!1029129) bm!43425))

(assert (= (or b!1029124 bm!43427) bm!43423))

(assert (= (or b!1029124 bm!43425) bm!43424))

(assert (= (and d!123049 res!688459) b!1029119))

(assert (= (and d!123049 c!103906) b!1029118))

(assert (= (and d!123049 (not c!103906)) b!1029131))

(assert (= (and d!123049 res!688467) b!1029126))

(assert (= (and b!1029126 res!688466) b!1029116))

(assert (= (and b!1029126 (not res!688460)) b!1029133))

(assert (= (and b!1029133 res!688464) b!1029123))

(assert (= (and b!1029126 res!688463) b!1029130))

(assert (= (and b!1029130 c!103908) b!1029128))

(assert (= (and b!1029130 (not c!103908)) b!1029132))

(assert (= (and b!1029128 res!688465) b!1029114))

(assert (= (or b!1029128 b!1029132) bm!43429))

(assert (= (and b!1029130 res!688461) b!1029113))

(assert (= (and b!1029113 c!103910) b!1029127))

(assert (= (and b!1029113 (not c!103910)) b!1029122))

(assert (= (and b!1029127 res!688462) b!1029121))

(assert (= (or b!1029127 b!1029122) bm!43426))

(declare-fun b_lambda!15833 () Bool)

(assert (=> (not b_lambda!15833) (not b!1029123)))

(assert (=> b!1029123 t!30934))

(declare-fun b_and!32897 () Bool)

(assert (= b_and!32887 (and (=> t!30934 result!14137) b_and!32897)))

(declare-fun m!947777 () Bool)

(assert (=> bm!43426 m!947777))

(declare-fun m!947779 () Bool)

(assert (=> bm!43424 m!947779))

(assert (=> d!123049 m!947765))

(declare-fun m!947781 () Bool)

(assert (=> b!1029119 m!947781))

(assert (=> b!1029119 m!947781))

(declare-fun m!947783 () Bool)

(assert (=> b!1029119 m!947783))

(declare-fun m!947785 () Bool)

(assert (=> bm!43423 m!947785))

(declare-fun m!947787 () Bool)

(assert (=> b!1029118 m!947787))

(declare-fun m!947789 () Bool)

(assert (=> b!1029118 m!947789))

(declare-fun m!947791 () Bool)

(assert (=> b!1029118 m!947791))

(declare-fun m!947793 () Bool)

(assert (=> b!1029118 m!947793))

(assert (=> b!1029118 m!947785))

(declare-fun m!947795 () Bool)

(assert (=> b!1029118 m!947795))

(declare-fun m!947797 () Bool)

(assert (=> b!1029118 m!947797))

(declare-fun m!947799 () Bool)

(assert (=> b!1029118 m!947799))

(declare-fun m!947801 () Bool)

(assert (=> b!1029118 m!947801))

(declare-fun m!947803 () Bool)

(assert (=> b!1029118 m!947803))

(declare-fun m!947805 () Bool)

(assert (=> b!1029118 m!947805))

(declare-fun m!947807 () Bool)

(assert (=> b!1029118 m!947807))

(assert (=> b!1029118 m!947801))

(declare-fun m!947809 () Bool)

(assert (=> b!1029118 m!947809))

(assert (=> b!1029118 m!947781))

(declare-fun m!947811 () Bool)

(assert (=> b!1029118 m!947811))

(declare-fun m!947813 () Bool)

(assert (=> b!1029118 m!947813))

(assert (=> b!1029118 m!947789))

(assert (=> b!1029118 m!947793))

(declare-fun m!947815 () Bool)

(assert (=> b!1029118 m!947815))

(assert (=> b!1029118 m!947797))

(declare-fun m!947817 () Bool)

(assert (=> bm!43429 m!947817))

(declare-fun m!947819 () Bool)

(assert (=> b!1029124 m!947819))

(assert (=> b!1029116 m!947781))

(assert (=> b!1029116 m!947781))

(assert (=> b!1029116 m!947783))

(assert (=> b!1029123 m!947781))

(declare-fun m!947821 () Bool)

(assert (=> b!1029123 m!947821))

(declare-fun m!947823 () Bool)

(assert (=> b!1029123 m!947823))

(assert (=> b!1029123 m!947653))

(declare-fun m!947825 () Bool)

(assert (=> b!1029123 m!947825))

(assert (=> b!1029123 m!947823))

(assert (=> b!1029123 m!947653))

(assert (=> b!1029123 m!947781))

(declare-fun m!947827 () Bool)

(assert (=> b!1029114 m!947827))

(assert (=> b!1029133 m!947781))

(assert (=> b!1029133 m!947781))

(declare-fun m!947829 () Bool)

(assert (=> b!1029133 m!947829))

(declare-fun m!947831 () Bool)

(assert (=> b!1029121 m!947831))

(assert (=> b!1028979 d!123049))

(declare-fun d!123051 () Bool)

(declare-fun lt!453495 () ListLongMap!13757)

(assert (=> d!123051 (not (contains!5951 lt!453495 key!909))))

(declare-fun removeStrictlySorted!53 (List!21856 (_ BitVec 64)) List!21856)

(assert (=> d!123051 (= lt!453495 (ListLongMap!13758 (removeStrictlySorted!53 (toList!6894 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))) key!909)))))

(assert (=> d!123051 (= (-!486 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) key!909) lt!453495)))

(declare-fun bs!30027 () Bool)

(assert (= bs!30027 d!123051))

(declare-fun m!947833 () Bool)

(assert (=> bs!30027 m!947833))

(declare-fun m!947835 () Bool)

(assert (=> bs!30027 m!947835))

(assert (=> b!1028979 d!123051))

(declare-fun d!123053 () Bool)

(declare-fun e!581021 () Bool)

(assert (=> d!123053 e!581021))

(declare-fun res!688470 () Bool)

(assert (=> d!123053 (=> (not res!688470) (not e!581021))))

(assert (=> d!123053 (= res!688470 (and (bvsge (index!41060 lt!453354) #b00000000000000000000000000000000) (bvslt (index!41060 lt!453354) (size!31633 (_keys!11271 thiss!1427)))))))

(declare-fun lt!453498 () Unit!33495)

(declare-fun choose!25 (array!64623 (_ BitVec 32) (_ BitVec 32)) Unit!33495)

(assert (=> d!123053 (= lt!453498 (choose!25 (_keys!11271 thiss!1427) (index!41060 lt!453354) (mask!29861 thiss!1427)))))

(assert (=> d!123053 (validMask!0 (mask!29861 thiss!1427))))

(assert (=> d!123053 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11271 thiss!1427) (index!41060 lt!453354) (mask!29861 thiss!1427)) lt!453498)))

(declare-fun b!1029136 () Bool)

(assert (=> b!1029136 (= e!581021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (mask!29861 thiss!1427)))))

(assert (= (and d!123053 res!688470) b!1029136))

(declare-fun m!947837 () Bool)

(assert (=> d!123053 m!947837))

(assert (=> d!123053 m!947765))

(assert (=> b!1029136 m!947633))

(declare-fun m!947839 () Bool)

(assert (=> b!1029136 m!947839))

(assert (=> b!1028979 d!123053))

(declare-fun b!1029145 () Bool)

(declare-fun e!581028 () Bool)

(declare-fun call!43435 () Bool)

(assert (=> b!1029145 (= e!581028 call!43435)))

(declare-fun b!1029146 () Bool)

(declare-fun e!581030 () Bool)

(assert (=> b!1029146 (= e!581030 call!43435)))

(declare-fun b!1029147 () Bool)

(declare-fun e!581029 () Bool)

(assert (=> b!1029147 (= e!581029 e!581030)))

(declare-fun c!103913 () Bool)

(assert (=> b!1029147 (= c!103913 (validKeyInArray!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun d!123055 () Bool)

(declare-fun res!688475 () Bool)

(assert (=> d!123055 (=> res!688475 e!581029)))

(assert (=> d!123055 (= res!688475 (bvsge #b00000000000000000000000000000000 (size!31633 lt!453355)))))

(assert (=> d!123055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453355 (mask!29861 thiss!1427)) e!581029)))

(declare-fun b!1029148 () Bool)

(assert (=> b!1029148 (= e!581030 e!581028)))

(declare-fun lt!453506 () (_ BitVec 64))

(assert (=> b!1029148 (= lt!453506 (select (arr!31116 lt!453355) #b00000000000000000000000000000000))))

(declare-fun lt!453505 () Unit!33495)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64623 (_ BitVec 64) (_ BitVec 32)) Unit!33495)

(assert (=> b!1029148 (= lt!453505 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453355 lt!453506 #b00000000000000000000000000000000))))

(assert (=> b!1029148 (arrayContainsKey!0 lt!453355 lt!453506 #b00000000000000000000000000000000)))

(declare-fun lt!453507 () Unit!33495)

(assert (=> b!1029148 (= lt!453507 lt!453505)))

(declare-fun res!688476 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64623 (_ BitVec 32)) SeekEntryResult!9672)

(assert (=> b!1029148 (= res!688476 (= (seekEntryOrOpen!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000) lt!453355 (mask!29861 thiss!1427)) (Found!9672 #b00000000000000000000000000000000)))))

(assert (=> b!1029148 (=> (not res!688476) (not e!581028))))

(declare-fun bm!43432 () Bool)

(assert (=> bm!43432 (= call!43435 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453355 (mask!29861 thiss!1427)))))

(assert (= (and d!123055 (not res!688475)) b!1029147))

(assert (= (and b!1029147 c!103913) b!1029148))

(assert (= (and b!1029147 (not c!103913)) b!1029146))

(assert (= (and b!1029148 res!688476) b!1029145))

(assert (= (or b!1029145 b!1029146) bm!43432))

(declare-fun m!947841 () Bool)

(assert (=> b!1029147 m!947841))

(assert (=> b!1029147 m!947841))

(declare-fun m!947843 () Bool)

(assert (=> b!1029147 m!947843))

(assert (=> b!1029148 m!947841))

(declare-fun m!947845 () Bool)

(assert (=> b!1029148 m!947845))

(declare-fun m!947847 () Bool)

(assert (=> b!1029148 m!947847))

(assert (=> b!1029148 m!947841))

(declare-fun m!947849 () Bool)

(assert (=> b!1029148 m!947849))

(declare-fun m!947851 () Bool)

(assert (=> bm!43432 m!947851))

(assert (=> b!1028979 d!123055))

(declare-fun d!123057 () Bool)

(declare-fun lt!453510 () (_ BitVec 32))

(assert (=> d!123057 (and (bvsge lt!453510 #b00000000000000000000000000000000) (bvsle lt!453510 (bvsub (size!31633 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun e!581036 () (_ BitVec 32))

(assert (=> d!123057 (= lt!453510 e!581036)))

(declare-fun c!103919 () Bool)

(assert (=> d!123057 (= c!103919 (bvsge #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> d!123057 (and (bvsle #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31633 (_keys!11271 thiss!1427)) (size!31633 lt!453355)))))

(assert (=> d!123057 (= (arrayCountValidKeys!0 lt!453355 #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) lt!453510)))

(declare-fun b!1029157 () Bool)

(declare-fun e!581035 () (_ BitVec 32))

(declare-fun call!43438 () (_ BitVec 32))

(assert (=> b!1029157 (= e!581035 (bvadd #b00000000000000000000000000000001 call!43438))))

(declare-fun b!1029158 () Bool)

(assert (=> b!1029158 (= e!581036 e!581035)))

(declare-fun c!103918 () Bool)

(assert (=> b!1029158 (= c!103918 (validKeyInArray!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun b!1029159 () Bool)

(assert (=> b!1029159 (= e!581036 #b00000000000000000000000000000000)))

(declare-fun bm!43435 () Bool)

(assert (=> bm!43435 (= call!43438 (arrayCountValidKeys!0 lt!453355 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun b!1029160 () Bool)

(assert (=> b!1029160 (= e!581035 call!43438)))

(assert (= (and d!123057 c!103919) b!1029159))

(assert (= (and d!123057 (not c!103919)) b!1029158))

(assert (= (and b!1029158 c!103918) b!1029157))

(assert (= (and b!1029158 (not c!103918)) b!1029160))

(assert (= (or b!1029157 b!1029160) bm!43435))

(assert (=> b!1029158 m!947841))

(assert (=> b!1029158 m!947841))

(assert (=> b!1029158 m!947843))

(declare-fun m!947853 () Bool)

(assert (=> bm!43435 m!947853))

(assert (=> b!1028979 d!123057))

(declare-fun d!123059 () Bool)

(declare-fun e!581039 () Bool)

(assert (=> d!123059 e!581039))

(declare-fun res!688479 () Bool)

(assert (=> d!123059 (=> (not res!688479) (not e!581039))))

(assert (=> d!123059 (= res!688479 (bvslt (index!41060 lt!453354) (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun lt!453513 () Unit!33495)

(declare-fun choose!121 (array!64623 (_ BitVec 32) (_ BitVec 64)) Unit!33495)

(assert (=> d!123059 (= lt!453513 (choose!121 (_keys!11271 thiss!1427) (index!41060 lt!453354) key!909))))

(assert (=> d!123059 (bvsge (index!41060 lt!453354) #b00000000000000000000000000000000)))

(assert (=> d!123059 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11271 thiss!1427) (index!41060 lt!453354) key!909) lt!453513)))

(declare-fun b!1029163 () Bool)

(assert (=> b!1029163 (= e!581039 (not (arrayContainsKey!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123059 res!688479) b!1029163))

(declare-fun m!947855 () Bool)

(assert (=> d!123059 m!947855))

(assert (=> b!1029163 m!947633))

(declare-fun m!947857 () Bool)

(assert (=> b!1029163 m!947857))

(assert (=> b!1028979 d!123059))

(declare-fun b!1029174 () Bool)

(declare-fun e!581044 () Bool)

(assert (=> b!1029174 (= e!581044 (bvslt (size!31633 (_keys!11271 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1029175 () Bool)

(declare-fun e!581045 () Bool)

(assert (=> b!1029175 (= e!581045 (= (arrayCountValidKeys!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11271 thiss!1427) #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1029173 () Bool)

(declare-fun res!688488 () Bool)

(assert (=> b!1029173 (=> (not res!688488) (not e!581044))))

(assert (=> b!1029173 (= res!688488 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123061 () Bool)

(assert (=> d!123061 e!581045))

(declare-fun res!688489 () Bool)

(assert (=> d!123061 (=> (not res!688489) (not e!581045))))

(assert (=> d!123061 (= res!688489 (and (bvsge (index!41060 lt!453354) #b00000000000000000000000000000000) (bvslt (index!41060 lt!453354) (size!31633 (_keys!11271 thiss!1427)))))))

(declare-fun lt!453516 () Unit!33495)

(declare-fun choose!82 (array!64623 (_ BitVec 32) (_ BitVec 64)) Unit!33495)

(assert (=> d!123061 (= lt!453516 (choose!82 (_keys!11271 thiss!1427) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123061 e!581044))

(declare-fun res!688491 () Bool)

(assert (=> d!123061 (=> (not res!688491) (not e!581044))))

(assert (=> d!123061 (= res!688491 (and (bvsge (index!41060 lt!453354) #b00000000000000000000000000000000) (bvslt (index!41060 lt!453354) (size!31633 (_keys!11271 thiss!1427)))))))

(assert (=> d!123061 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11271 thiss!1427) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) lt!453516)))

(declare-fun b!1029172 () Bool)

(declare-fun res!688490 () Bool)

(assert (=> b!1029172 (=> (not res!688490) (not e!581044))))

(assert (=> b!1029172 (= res!688490 (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354))))))

(assert (= (and d!123061 res!688491) b!1029172))

(assert (= (and b!1029172 res!688490) b!1029173))

(assert (= (and b!1029173 res!688488) b!1029174))

(assert (= (and d!123061 res!688489) b!1029175))

(assert (=> b!1029175 m!947633))

(declare-fun m!947859 () Bool)

(assert (=> b!1029175 m!947859))

(assert (=> b!1029175 m!947639))

(declare-fun m!947861 () Bool)

(assert (=> b!1029173 m!947861))

(declare-fun m!947863 () Bool)

(assert (=> d!123061 m!947863))

(declare-fun m!947865 () Bool)

(assert (=> b!1029172 m!947865))

(assert (=> b!1029172 m!947865))

(declare-fun m!947867 () Bool)

(assert (=> b!1029172 m!947867))

(assert (=> b!1028979 d!123061))

(declare-fun d!123063 () Bool)

(declare-fun res!688496 () Bool)

(declare-fun e!581050 () Bool)

(assert (=> d!123063 (=> res!688496 e!581050)))

(assert (=> d!123063 (= res!688496 (= (select (arr!31116 lt!453355) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123063 (= (arrayContainsKey!0 lt!453355 key!909 #b00000000000000000000000000000000) e!581050)))

(declare-fun b!1029180 () Bool)

(declare-fun e!581051 () Bool)

(assert (=> b!1029180 (= e!581050 e!581051)))

(declare-fun res!688497 () Bool)

(assert (=> b!1029180 (=> (not res!688497) (not e!581051))))

(assert (=> b!1029180 (= res!688497 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 lt!453355)))))

(declare-fun b!1029181 () Bool)

(assert (=> b!1029181 (= e!581051 (arrayContainsKey!0 lt!453355 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123063 (not res!688496)) b!1029180))

(assert (= (and b!1029180 res!688497) b!1029181))

(assert (=> d!123063 m!947841))

(declare-fun m!947869 () Bool)

(assert (=> b!1029181 m!947869))

(assert (=> b!1028979 d!123063))

(declare-fun d!123065 () Bool)

(declare-fun e!581054 () Bool)

(assert (=> d!123065 e!581054))

(declare-fun res!688500 () Bool)

(assert (=> d!123065 (=> (not res!688500) (not e!581054))))

(assert (=> d!123065 (= res!688500 (and (bvsge (index!41060 lt!453354) #b00000000000000000000000000000000) (bvslt (index!41060 lt!453354) (size!31633 (_keys!11271 thiss!1427)))))))

(declare-fun lt!453519 () Unit!33495)

(declare-fun choose!1696 (array!64623 array!64625 (_ BitVec 32) (_ BitVec 32) V!37291 V!37291 (_ BitVec 32) (_ BitVec 64) Int) Unit!33495)

(assert (=> d!123065 (= lt!453519 (choose!1696 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (index!41060 lt!453354) key!909 (defaultEntry!6114 thiss!1427)))))

(assert (=> d!123065 (validMask!0 (mask!29861 thiss!1427))))

(assert (=> d!123065 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!11 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (index!41060 lt!453354) key!909 (defaultEntry!6114 thiss!1427)) lt!453519)))

(declare-fun b!1029184 () Bool)

(assert (=> b!1029184 (= e!581054 (= (-!486 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) key!909) (getCurrentListMap!3861 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (array!64626 (store (arr!31117 (_values!6137 thiss!1427)) (index!41060 lt!453354) (ValueCellFull!11453 (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31634 (_values!6137 thiss!1427))) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))))))

(assert (=> b!1029184 (bvslt (index!41060 lt!453354) (size!31634 (_values!6137 thiss!1427)))))

(assert (= (and d!123065 res!688500) b!1029184))

(declare-fun b_lambda!15835 () Bool)

(assert (=> (not b_lambda!15835) (not b!1029184)))

(assert (=> b!1029184 t!30934))

(declare-fun b_and!32899 () Bool)

(assert (= b_and!32897 (and (=> t!30934 result!14137) b_and!32899)))

(declare-fun m!947871 () Bool)

(assert (=> d!123065 m!947871))

(assert (=> d!123065 m!947765))

(assert (=> b!1029184 m!947637))

(assert (=> b!1029184 m!947653))

(assert (=> b!1029184 m!947633))

(assert (=> b!1029184 m!947647))

(assert (=> b!1029184 m!947649))

(declare-fun m!947873 () Bool)

(assert (=> b!1029184 m!947873))

(assert (=> b!1029184 m!947647))

(assert (=> b!1028979 d!123065))

(declare-fun b!1029185 () Bool)

(declare-fun e!581057 () Bool)

(declare-fun e!581056 () Bool)

(assert (=> b!1029185 (= e!581057 e!581056)))

(declare-fun c!103925 () Bool)

(assert (=> b!1029185 (= c!103925 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!43445 () ListLongMap!13757)

(declare-fun bm!43436 () Bool)

(assert (=> bm!43436 (= call!43445 (getCurrentListMapNoExtraKeys!3562 lt!453355 lt!453350 (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun b!1029186 () Bool)

(declare-fun e!581065 () Bool)

(declare-fun lt!453533 () ListLongMap!13757)

(assert (=> b!1029186 (= e!581065 (= (apply!896 lt!453533 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5950 thiss!1427)))))

(declare-fun b!1029187 () Bool)

(declare-fun e!581061 () ListLongMap!13757)

(declare-fun call!43443 () ListLongMap!13757)

(assert (=> b!1029187 (= e!581061 call!43443)))

(declare-fun b!1029188 () Bool)

(declare-fun e!581067 () Bool)

(assert (=> b!1029188 (= e!581067 (validKeyInArray!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun b!1029189 () Bool)

(declare-fun e!581064 () ListLongMap!13757)

(declare-fun call!43439 () ListLongMap!13757)

(assert (=> b!1029189 (= e!581064 call!43439)))

(declare-fun b!1029190 () Bool)

(declare-fun e!581066 () Unit!33495)

(declare-fun lt!453535 () Unit!33495)

(assert (=> b!1029190 (= e!581066 lt!453535)))

(declare-fun lt!453530 () ListLongMap!13757)

(assert (=> b!1029190 (= lt!453530 (getCurrentListMapNoExtraKeys!3562 lt!453355 lt!453350 (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453523 () (_ BitVec 64))

(assert (=> b!1029190 (= lt!453523 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453534 () (_ BitVec 64))

(assert (=> b!1029190 (= lt!453534 (select (arr!31116 lt!453355) #b00000000000000000000000000000000))))

(declare-fun lt!453522 () Unit!33495)

(assert (=> b!1029190 (= lt!453522 (addStillContains!615 lt!453530 lt!453523 (zeroValue!5950 thiss!1427) lt!453534))))

(assert (=> b!1029190 (contains!5951 (+!3127 lt!453530 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427))) lt!453534)))

(declare-fun lt!453528 () Unit!33495)

(assert (=> b!1029190 (= lt!453528 lt!453522)))

(declare-fun lt!453521 () ListLongMap!13757)

(assert (=> b!1029190 (= lt!453521 (getCurrentListMapNoExtraKeys!3562 lt!453355 lt!453350 (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453531 () (_ BitVec 64))

(assert (=> b!1029190 (= lt!453531 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453532 () (_ BitVec 64))

(assert (=> b!1029190 (= lt!453532 (select (arr!31116 lt!453355) #b00000000000000000000000000000000))))

(declare-fun lt!453537 () Unit!33495)

(assert (=> b!1029190 (= lt!453537 (addApplyDifferent!471 lt!453521 lt!453531 (minValue!5950 thiss!1427) lt!453532))))

(assert (=> b!1029190 (= (apply!896 (+!3127 lt!453521 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427))) lt!453532) (apply!896 lt!453521 lt!453532))))

(declare-fun lt!453520 () Unit!33495)

(assert (=> b!1029190 (= lt!453520 lt!453537)))

(declare-fun lt!453527 () ListLongMap!13757)

(assert (=> b!1029190 (= lt!453527 (getCurrentListMapNoExtraKeys!3562 lt!453355 lt!453350 (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453538 () (_ BitVec 64))

(assert (=> b!1029190 (= lt!453538 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453529 () (_ BitVec 64))

(assert (=> b!1029190 (= lt!453529 (select (arr!31116 lt!453355) #b00000000000000000000000000000000))))

(declare-fun lt!453540 () Unit!33495)

(assert (=> b!1029190 (= lt!453540 (addApplyDifferent!471 lt!453527 lt!453538 (zeroValue!5950 thiss!1427) lt!453529))))

(assert (=> b!1029190 (= (apply!896 (+!3127 lt!453527 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427))) lt!453529) (apply!896 lt!453527 lt!453529))))

(declare-fun lt!453541 () Unit!33495)

(assert (=> b!1029190 (= lt!453541 lt!453540)))

(declare-fun lt!453536 () ListLongMap!13757)

(assert (=> b!1029190 (= lt!453536 (getCurrentListMapNoExtraKeys!3562 lt!453355 lt!453350 (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453526 () (_ BitVec 64))

(assert (=> b!1029190 (= lt!453526 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453539 () (_ BitVec 64))

(assert (=> b!1029190 (= lt!453539 (select (arr!31116 lt!453355) #b00000000000000000000000000000000))))

(assert (=> b!1029190 (= lt!453535 (addApplyDifferent!471 lt!453536 lt!453526 (minValue!5950 thiss!1427) lt!453539))))

(assert (=> b!1029190 (= (apply!896 (+!3127 lt!453536 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427))) lt!453539) (apply!896 lt!453536 lt!453539))))

(declare-fun call!43444 () ListLongMap!13757)

(declare-fun call!43440 () ListLongMap!13757)

(declare-fun c!103922 () Bool)

(declare-fun bm!43437 () Bool)

(declare-fun c!103924 () Bool)

(assert (=> bm!43437 (= call!43444 (+!3127 (ite c!103922 call!43445 (ite c!103924 call!43440 call!43439)) (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(declare-fun b!1029191 () Bool)

(declare-fun e!581063 () Bool)

(assert (=> b!1029191 (= e!581063 (validKeyInArray!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun b!1029192 () Bool)

(declare-fun e!581059 () ListLongMap!13757)

(assert (=> b!1029192 (= e!581059 e!581061)))

(assert (=> b!1029192 (= c!103924 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029193 () Bool)

(declare-fun e!581062 () Bool)

(assert (=> b!1029193 (= e!581062 (= (apply!896 lt!453533 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5950 thiss!1427)))))

(declare-fun bm!43438 () Bool)

(assert (=> bm!43438 (= call!43443 call!43444)))

(declare-fun bm!43439 () Bool)

(declare-fun call!43441 () Bool)

(assert (=> bm!43439 (= call!43441 (contains!5951 lt!453533 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029194 () Bool)

(assert (=> b!1029194 (= e!581056 (not call!43441))))

(declare-fun bm!43440 () Bool)

(assert (=> bm!43440 (= call!43440 call!43445)))

(declare-fun b!1029195 () Bool)

(declare-fun e!581060 () Bool)

(assert (=> b!1029195 (= e!581060 (= (apply!896 lt!453533 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)) (get!16351 (select (arr!31117 lt!453350) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029195 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31634 lt!453350)))))

(assert (=> b!1029195 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 lt!453355)))))

(declare-fun b!1029196 () Bool)

(assert (=> b!1029196 (= e!581059 (+!3127 call!43444 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))

(declare-fun b!1029197 () Bool)

(declare-fun c!103920 () Bool)

(assert (=> b!1029197 (= c!103920 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1029197 (= e!581061 e!581064)))

(declare-fun bm!43441 () Bool)

(assert (=> bm!43441 (= call!43439 call!43440)))

(declare-fun b!1029198 () Bool)

(declare-fun res!688505 () Bool)

(assert (=> b!1029198 (=> (not res!688505) (not e!581057))))

(declare-fun e!581055 () Bool)

(assert (=> b!1029198 (= res!688505 e!581055)))

(declare-fun res!688502 () Bool)

(assert (=> b!1029198 (=> res!688502 e!581055)))

(assert (=> b!1029198 (= res!688502 (not e!581067))))

(declare-fun res!688508 () Bool)

(assert (=> b!1029198 (=> (not res!688508) (not e!581067))))

(assert (=> b!1029198 (= res!688508 (bvslt #b00000000000000000000000000000000 (size!31633 lt!453355)))))

(declare-fun b!1029199 () Bool)

(assert (=> b!1029199 (= e!581056 e!581062)))

(declare-fun res!688504 () Bool)

(assert (=> b!1029199 (= res!688504 call!43441)))

(assert (=> b!1029199 (=> (not res!688504) (not e!581062))))

(declare-fun b!1029200 () Bool)

(declare-fun e!581058 () Bool)

(assert (=> b!1029200 (= e!581058 e!581065)))

(declare-fun res!688507 () Bool)

(declare-fun call!43442 () Bool)

(assert (=> b!1029200 (= res!688507 call!43442)))

(assert (=> b!1029200 (=> (not res!688507) (not e!581065))))

(declare-fun bm!43442 () Bool)

(assert (=> bm!43442 (= call!43442 (contains!5951 lt!453533 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029201 () Bool)

(assert (=> b!1029201 (= e!581064 call!43443)))

(declare-fun b!1029202 () Bool)

(declare-fun res!688503 () Bool)

(assert (=> b!1029202 (=> (not res!688503) (not e!581057))))

(assert (=> b!1029202 (= res!688503 e!581058)))

(declare-fun c!103923 () Bool)

(assert (=> b!1029202 (= c!103923 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1029203 () Bool)

(declare-fun Unit!33504 () Unit!33495)

(assert (=> b!1029203 (= e!581066 Unit!33504)))

(declare-fun b!1029204 () Bool)

(assert (=> b!1029204 (= e!581058 (not call!43442))))

(declare-fun d!123067 () Bool)

(assert (=> d!123067 e!581057))

(declare-fun res!688509 () Bool)

(assert (=> d!123067 (=> (not res!688509) (not e!581057))))

(assert (=> d!123067 (= res!688509 (or (bvsge #b00000000000000000000000000000000 (size!31633 lt!453355)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 lt!453355)))))))

(declare-fun lt!453525 () ListLongMap!13757)

(assert (=> d!123067 (= lt!453533 lt!453525)))

(declare-fun lt!453524 () Unit!33495)

(assert (=> d!123067 (= lt!453524 e!581066)))

(declare-fun c!103921 () Bool)

(assert (=> d!123067 (= c!103921 e!581063)))

(declare-fun res!688501 () Bool)

(assert (=> d!123067 (=> (not res!688501) (not e!581063))))

(assert (=> d!123067 (= res!688501 (bvslt #b00000000000000000000000000000000 (size!31633 lt!453355)))))

(assert (=> d!123067 (= lt!453525 e!581059)))

(assert (=> d!123067 (= c!103922 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123067 (validMask!0 (mask!29861 thiss!1427))))

(assert (=> d!123067 (= (getCurrentListMap!3861 lt!453355 lt!453350 (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) lt!453533)))

(declare-fun b!1029205 () Bool)

(assert (=> b!1029205 (= e!581055 e!581060)))

(declare-fun res!688506 () Bool)

(assert (=> b!1029205 (=> (not res!688506) (not e!581060))))

(assert (=> b!1029205 (= res!688506 (contains!5951 lt!453533 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(assert (=> b!1029205 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 lt!453355)))))

(assert (= (and d!123067 c!103922) b!1029196))

(assert (= (and d!123067 (not c!103922)) b!1029192))

(assert (= (and b!1029192 c!103924) b!1029187))

(assert (= (and b!1029192 (not c!103924)) b!1029197))

(assert (= (and b!1029197 c!103920) b!1029201))

(assert (= (and b!1029197 (not c!103920)) b!1029189))

(assert (= (or b!1029201 b!1029189) bm!43441))

(assert (= (or b!1029187 bm!43441) bm!43440))

(assert (= (or b!1029187 b!1029201) bm!43438))

(assert (= (or b!1029196 bm!43440) bm!43436))

(assert (= (or b!1029196 bm!43438) bm!43437))

(assert (= (and d!123067 res!688501) b!1029191))

(assert (= (and d!123067 c!103921) b!1029190))

(assert (= (and d!123067 (not c!103921)) b!1029203))

(assert (= (and d!123067 res!688509) b!1029198))

(assert (= (and b!1029198 res!688508) b!1029188))

(assert (= (and b!1029198 (not res!688502)) b!1029205))

(assert (= (and b!1029205 res!688506) b!1029195))

(assert (= (and b!1029198 res!688505) b!1029202))

(assert (= (and b!1029202 c!103923) b!1029200))

(assert (= (and b!1029202 (not c!103923)) b!1029204))

(assert (= (and b!1029200 res!688507) b!1029186))

(assert (= (or b!1029200 b!1029204) bm!43442))

(assert (= (and b!1029202 res!688503) b!1029185))

(assert (= (and b!1029185 c!103925) b!1029199))

(assert (= (and b!1029185 (not c!103925)) b!1029194))

(assert (= (and b!1029199 res!688504) b!1029193))

(assert (= (or b!1029199 b!1029194) bm!43439))

(declare-fun b_lambda!15837 () Bool)

(assert (=> (not b_lambda!15837) (not b!1029195)))

(assert (=> b!1029195 t!30934))

(declare-fun b_and!32901 () Bool)

(assert (= b_and!32899 (and (=> t!30934 result!14137) b_and!32901)))

(declare-fun m!947875 () Bool)

(assert (=> bm!43439 m!947875))

(declare-fun m!947877 () Bool)

(assert (=> bm!43437 m!947877))

(assert (=> d!123067 m!947765))

(assert (=> b!1029191 m!947841))

(assert (=> b!1029191 m!947841))

(assert (=> b!1029191 m!947843))

(declare-fun m!947879 () Bool)

(assert (=> bm!43436 m!947879))

(declare-fun m!947881 () Bool)

(assert (=> b!1029190 m!947881))

(declare-fun m!947883 () Bool)

(assert (=> b!1029190 m!947883))

(declare-fun m!947885 () Bool)

(assert (=> b!1029190 m!947885))

(declare-fun m!947887 () Bool)

(assert (=> b!1029190 m!947887))

(assert (=> b!1029190 m!947879))

(declare-fun m!947889 () Bool)

(assert (=> b!1029190 m!947889))

(declare-fun m!947891 () Bool)

(assert (=> b!1029190 m!947891))

(declare-fun m!947893 () Bool)

(assert (=> b!1029190 m!947893))

(declare-fun m!947895 () Bool)

(assert (=> b!1029190 m!947895))

(declare-fun m!947897 () Bool)

(assert (=> b!1029190 m!947897))

(declare-fun m!947899 () Bool)

(assert (=> b!1029190 m!947899))

(declare-fun m!947901 () Bool)

(assert (=> b!1029190 m!947901))

(assert (=> b!1029190 m!947895))

(declare-fun m!947903 () Bool)

(assert (=> b!1029190 m!947903))

(assert (=> b!1029190 m!947841))

(declare-fun m!947905 () Bool)

(assert (=> b!1029190 m!947905))

(declare-fun m!947907 () Bool)

(assert (=> b!1029190 m!947907))

(assert (=> b!1029190 m!947883))

(assert (=> b!1029190 m!947887))

(declare-fun m!947909 () Bool)

(assert (=> b!1029190 m!947909))

(assert (=> b!1029190 m!947891))

(declare-fun m!947911 () Bool)

(assert (=> bm!43442 m!947911))

(declare-fun m!947913 () Bool)

(assert (=> b!1029196 m!947913))

(assert (=> b!1029188 m!947841))

(assert (=> b!1029188 m!947841))

(assert (=> b!1029188 m!947843))

(assert (=> b!1029195 m!947841))

(declare-fun m!947915 () Bool)

(assert (=> b!1029195 m!947915))

(declare-fun m!947917 () Bool)

(assert (=> b!1029195 m!947917))

(assert (=> b!1029195 m!947653))

(declare-fun m!947919 () Bool)

(assert (=> b!1029195 m!947919))

(assert (=> b!1029195 m!947917))

(assert (=> b!1029195 m!947653))

(assert (=> b!1029195 m!947841))

(declare-fun m!947921 () Bool)

(assert (=> b!1029186 m!947921))

(assert (=> b!1029205 m!947841))

(assert (=> b!1029205 m!947841))

(declare-fun m!947923 () Bool)

(assert (=> b!1029205 m!947923))

(declare-fun m!947925 () Bool)

(assert (=> b!1029193 m!947925))

(assert (=> b!1028979 d!123067))

(declare-fun d!123069 () Bool)

(declare-fun lt!453542 () (_ BitVec 32))

(assert (=> d!123069 (and (bvsge lt!453542 #b00000000000000000000000000000000) (bvsle lt!453542 (bvsub (size!31633 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!581069 () (_ BitVec 32))

(assert (=> d!123069 (= lt!453542 e!581069)))

(declare-fun c!103927 () Bool)

(assert (=> d!123069 (= c!103927 (bvsge #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> d!123069 (and (bvsle #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31633 (_keys!11271 thiss!1427)) (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> d!123069 (= (arrayCountValidKeys!0 (_keys!11271 thiss!1427) #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) lt!453542)))

(declare-fun b!1029206 () Bool)

(declare-fun e!581068 () (_ BitVec 32))

(declare-fun call!43446 () (_ BitVec 32))

(assert (=> b!1029206 (= e!581068 (bvadd #b00000000000000000000000000000001 call!43446))))

(declare-fun b!1029207 () Bool)

(assert (=> b!1029207 (= e!581069 e!581068)))

(declare-fun c!103926 () Bool)

(assert (=> b!1029207 (= c!103926 (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029208 () Bool)

(assert (=> b!1029208 (= e!581069 #b00000000000000000000000000000000)))

(declare-fun bm!43443 () Bool)

(assert (=> bm!43443 (= call!43446 (arrayCountValidKeys!0 (_keys!11271 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun b!1029209 () Bool)

(assert (=> b!1029209 (= e!581068 call!43446)))

(assert (= (and d!123069 c!103927) b!1029208))

(assert (= (and d!123069 (not c!103927)) b!1029207))

(assert (= (and b!1029207 c!103926) b!1029206))

(assert (= (and b!1029207 (not c!103926)) b!1029209))

(assert (= (or b!1029206 b!1029209) bm!43443))

(assert (=> b!1029207 m!947781))

(assert (=> b!1029207 m!947781))

(assert (=> b!1029207 m!947783))

(declare-fun m!947927 () Bool)

(assert (=> bm!43443 m!947927))

(assert (=> b!1028979 d!123069))

(declare-fun b!1029220 () Bool)

(declare-fun e!581080 () Bool)

(declare-fun e!581078 () Bool)

(assert (=> b!1029220 (= e!581080 e!581078)))

(declare-fun c!103930 () Bool)

(assert (=> b!1029220 (= c!103930 (validKeyInArray!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun b!1029221 () Bool)

(declare-fun e!581081 () Bool)

(declare-fun contains!5952 (List!21857 (_ BitVec 64)) Bool)

(assert (=> b!1029221 (= e!581081 (contains!5952 Nil!21854 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun b!1029222 () Bool)

(declare-fun call!43449 () Bool)

(assert (=> b!1029222 (= e!581078 call!43449)))

(declare-fun d!123071 () Bool)

(declare-fun res!688518 () Bool)

(declare-fun e!581079 () Bool)

(assert (=> d!123071 (=> res!688518 e!581079)))

(assert (=> d!123071 (= res!688518 (bvsge #b00000000000000000000000000000000 (size!31633 lt!453355)))))

(assert (=> d!123071 (= (arrayNoDuplicates!0 lt!453355 #b00000000000000000000000000000000 Nil!21854) e!581079)))

(declare-fun bm!43446 () Bool)

(assert (=> bm!43446 (= call!43449 (arrayNoDuplicates!0 lt!453355 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103930 (Cons!21853 (select (arr!31116 lt!453355) #b00000000000000000000000000000000) Nil!21854) Nil!21854)))))

(declare-fun b!1029223 () Bool)

(assert (=> b!1029223 (= e!581078 call!43449)))

(declare-fun b!1029224 () Bool)

(assert (=> b!1029224 (= e!581079 e!581080)))

(declare-fun res!688516 () Bool)

(assert (=> b!1029224 (=> (not res!688516) (not e!581080))))

(assert (=> b!1029224 (= res!688516 (not e!581081))))

(declare-fun res!688517 () Bool)

(assert (=> b!1029224 (=> (not res!688517) (not e!581081))))

(assert (=> b!1029224 (= res!688517 (validKeyInArray!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(assert (= (and d!123071 (not res!688518)) b!1029224))

(assert (= (and b!1029224 res!688517) b!1029221))

(assert (= (and b!1029224 res!688516) b!1029220))

(assert (= (and b!1029220 c!103930) b!1029223))

(assert (= (and b!1029220 (not c!103930)) b!1029222))

(assert (= (or b!1029223 b!1029222) bm!43446))

(assert (=> b!1029220 m!947841))

(assert (=> b!1029220 m!947841))

(assert (=> b!1029220 m!947843))

(assert (=> b!1029221 m!947841))

(assert (=> b!1029221 m!947841))

(declare-fun m!947929 () Bool)

(assert (=> b!1029221 m!947929))

(assert (=> bm!43446 m!947841))

(declare-fun m!947931 () Bool)

(assert (=> bm!43446 m!947931))

(assert (=> b!1029224 m!947841))

(assert (=> b!1029224 m!947841))

(assert (=> b!1029224 m!947843))

(assert (=> b!1028979 d!123071))

(declare-fun mapIsEmpty!37921 () Bool)

(declare-fun mapRes!37921 () Bool)

(assert (=> mapIsEmpty!37921 mapRes!37921))

(declare-fun mapNonEmpty!37921 () Bool)

(declare-fun tp!72854 () Bool)

(declare-fun e!581087 () Bool)

(assert (=> mapNonEmpty!37921 (= mapRes!37921 (and tp!72854 e!581087))))

(declare-fun mapRest!37921 () (Array (_ BitVec 32) ValueCell!11453))

(declare-fun mapValue!37921 () ValueCell!11453)

(declare-fun mapKey!37921 () (_ BitVec 32))

(assert (=> mapNonEmpty!37921 (= mapRest!37912 (store mapRest!37921 mapKey!37921 mapValue!37921))))

(declare-fun condMapEmpty!37921 () Bool)

(declare-fun mapDefault!37921 () ValueCell!11453)

(assert (=> mapNonEmpty!37912 (= condMapEmpty!37921 (= mapRest!37912 ((as const (Array (_ BitVec 32) ValueCell!11453)) mapDefault!37921)))))

(declare-fun e!581086 () Bool)

(assert (=> mapNonEmpty!37912 (= tp!72838 (and e!581086 mapRes!37921))))

(declare-fun b!1029232 () Bool)

(assert (=> b!1029232 (= e!581086 tp_is_empty!24313)))

(declare-fun b!1029231 () Bool)

(assert (=> b!1029231 (= e!581087 tp_is_empty!24313)))

(assert (= (and mapNonEmpty!37912 condMapEmpty!37921) mapIsEmpty!37921))

(assert (= (and mapNonEmpty!37912 (not condMapEmpty!37921)) mapNonEmpty!37921))

(assert (= (and mapNonEmpty!37921 ((_ is ValueCellFull!11453) mapValue!37921)) b!1029231))

(assert (= (and mapNonEmpty!37912 ((_ is ValueCellFull!11453) mapDefault!37921)) b!1029232))

(declare-fun m!947933 () Bool)

(assert (=> mapNonEmpty!37921 m!947933))

(declare-fun b_lambda!15839 () Bool)

(assert (= b_lambda!15837 (or (and b!1028980 b_free!20593) b_lambda!15839)))

(declare-fun b_lambda!15841 () Bool)

(assert (= b_lambda!15833 (or (and b!1028980 b_free!20593) b_lambda!15841)))

(declare-fun b_lambda!15843 () Bool)

(assert (= b_lambda!15835 (or (and b!1028980 b_free!20593) b_lambda!15843)))

(check-sat (not d!123049) (not b!1029191) (not b!1029118) (not b!1029147) (not b!1029195) (not b_lambda!15843) (not bm!43437) (not bm!43426) (not bm!43442) (not b!1029121) (not b!1029224) (not bm!43432) (not b!1029173) (not bm!43423) (not b!1029221) (not b_lambda!15831) (not b!1029220) (not b!1029172) (not b!1029190) (not b!1029070) (not b_lambda!15841) (not b!1029133) (not d!123061) (not b!1029148) (not b!1029066) (not b!1029188) (not d!123065) (not bm!43436) (not b!1029136) (not b!1029053) (not bm!43429) (not b!1029207) tp_is_empty!24313 (not b!1029163) (not b!1029193) (not bm!43446) (not b!1029116) (not bm!43439) (not d!123059) (not b!1029123) (not b!1029119) (not b!1029196) (not b!1029158) (not bm!43443) (not b!1029114) b_and!32901 (not b!1029067) (not d!123047) (not b!1029205) (not d!123067) (not bm!43424) (not d!123039) (not bm!43435) (not b_lambda!15839) (not d!123037) (not b!1029175) (not b!1029065) (not b!1029124) (not d!123053) (not mapNonEmpty!37921) (not b!1029186) (not d!123051) (not b!1029184) (not b!1029181) (not b_next!20593))
(check-sat b_and!32901 (not b_next!20593))
(get-model)

(assert (=> b!1029065 d!123069))

(declare-fun d!123073 () Bool)

(declare-datatypes ((Option!639 0))(
  ( (Some!638 (v!14783 V!37291)) (None!637) )
))
(declare-fun get!16352 (Option!639) V!37291)

(declare-fun getValueByKey!588 (List!21856 (_ BitVec 64)) Option!639)

(assert (=> d!123073 (= (apply!896 lt!453484 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16352 (getValueByKey!588 (toList!6894 lt!453484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30028 () Bool)

(assert (= bs!30028 d!123073))

(declare-fun m!947935 () Bool)

(assert (=> bs!30028 m!947935))

(assert (=> bs!30028 m!947935))

(declare-fun m!947937 () Bool)

(assert (=> bs!30028 m!947937))

(assert (=> b!1029121 d!123073))

(declare-fun d!123075 () Bool)

(assert (=> d!123075 (= (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029119 d!123075))

(declare-fun d!123077 () Bool)

(declare-fun lt!453543 () (_ BitVec 32))

(assert (=> d!123077 (and (bvsge lt!453543 #b00000000000000000000000000000000) (bvsle lt!453543 (bvsub (size!31633 (_keys!11271 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!581089 () (_ BitVec 32))

(assert (=> d!123077 (= lt!453543 e!581089)))

(declare-fun c!103932 () Bool)

(assert (=> d!123077 (= c!103932 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> d!123077 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 (_keys!11271 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31633 (_keys!11271 thiss!1427)) (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> d!123077 (= (arrayCountValidKeys!0 (_keys!11271 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 (_keys!11271 thiss!1427))) lt!453543)))

(declare-fun b!1029233 () Bool)

(declare-fun e!581088 () (_ BitVec 32))

(declare-fun call!43450 () (_ BitVec 32))

(assert (=> b!1029233 (= e!581088 (bvadd #b00000000000000000000000000000001 call!43450))))

(declare-fun b!1029234 () Bool)

(assert (=> b!1029234 (= e!581089 e!581088)))

(declare-fun c!103931 () Bool)

(assert (=> b!1029234 (= c!103931 (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029235 () Bool)

(assert (=> b!1029235 (= e!581089 #b00000000000000000000000000000000)))

(declare-fun bm!43447 () Bool)

(assert (=> bm!43447 (= call!43450 (arrayCountValidKeys!0 (_keys!11271 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun b!1029236 () Bool)

(assert (=> b!1029236 (= e!581088 call!43450)))

(assert (= (and d!123077 c!103932) b!1029235))

(assert (= (and d!123077 (not c!103932)) b!1029234))

(assert (= (and b!1029234 c!103931) b!1029233))

(assert (= (and b!1029234 (not c!103931)) b!1029236))

(assert (= (or b!1029233 b!1029236) bm!43447))

(declare-fun m!947939 () Bool)

(assert (=> b!1029234 m!947939))

(assert (=> b!1029234 m!947939))

(declare-fun m!947941 () Bool)

(assert (=> b!1029234 m!947941))

(declare-fun m!947943 () Bool)

(assert (=> bm!43447 m!947943))

(assert (=> bm!43443 d!123077))

(declare-fun d!123079 () Bool)

(assert (=> d!123079 (= (apply!896 lt!453478 lt!453480) (get!16352 (getValueByKey!588 (toList!6894 lt!453478) lt!453480)))))

(declare-fun bs!30029 () Bool)

(assert (= bs!30029 d!123079))

(declare-fun m!947945 () Bool)

(assert (=> bs!30029 m!947945))

(assert (=> bs!30029 m!947945))

(declare-fun m!947947 () Bool)

(assert (=> bs!30029 m!947947))

(assert (=> b!1029118 d!123079))

(declare-fun d!123081 () Bool)

(assert (=> d!123081 (= (apply!896 lt!453472 lt!453483) (get!16352 (getValueByKey!588 (toList!6894 lt!453472) lt!453483)))))

(declare-fun bs!30030 () Bool)

(assert (= bs!30030 d!123081))

(declare-fun m!947949 () Bool)

(assert (=> bs!30030 m!947949))

(assert (=> bs!30030 m!947949))

(declare-fun m!947951 () Bool)

(assert (=> bs!30030 m!947951))

(assert (=> b!1029118 d!123081))

(declare-fun d!123083 () Bool)

(declare-fun e!581092 () Bool)

(assert (=> d!123083 e!581092))

(declare-fun res!688524 () Bool)

(assert (=> d!123083 (=> (not res!688524) (not e!581092))))

(declare-fun lt!453554 () ListLongMap!13757)

(assert (=> d!123083 (= res!688524 (contains!5951 lt!453554 (_1!7834 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427)))))))

(declare-fun lt!453555 () List!21856)

(assert (=> d!123083 (= lt!453554 (ListLongMap!13758 lt!453555))))

(declare-fun lt!453552 () Unit!33495)

(declare-fun lt!453553 () Unit!33495)

(assert (=> d!123083 (= lt!453552 lt!453553)))

(assert (=> d!123083 (= (getValueByKey!588 lt!453555 (_1!7834 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!278 (List!21856 (_ BitVec 64) V!37291) Unit!33495)

(assert (=> d!123083 (= lt!453553 (lemmaContainsTupThenGetReturnValue!278 lt!453555 (_1!7834 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427)))))))

(declare-fun insertStrictlySorted!371 (List!21856 (_ BitVec 64) V!37291) List!21856)

(assert (=> d!123083 (= lt!453555 (insertStrictlySorted!371 (toList!6894 lt!453481) (_1!7834 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123083 (= (+!3127 lt!453481 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427))) lt!453554)))

(declare-fun b!1029241 () Bool)

(declare-fun res!688523 () Bool)

(assert (=> b!1029241 (=> (not res!688523) (not e!581092))))

(assert (=> b!1029241 (= res!688523 (= (getValueByKey!588 (toList!6894 lt!453554) (_1!7834 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427))))))))

(declare-fun b!1029242 () Bool)

(declare-fun contains!5953 (List!21856 tuple2!15646) Bool)

(assert (=> b!1029242 (= e!581092 (contains!5953 (toList!6894 lt!453554) (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427))))))

(assert (= (and d!123083 res!688524) b!1029241))

(assert (= (and b!1029241 res!688523) b!1029242))

(declare-fun m!947953 () Bool)

(assert (=> d!123083 m!947953))

(declare-fun m!947955 () Bool)

(assert (=> d!123083 m!947955))

(declare-fun m!947957 () Bool)

(assert (=> d!123083 m!947957))

(declare-fun m!947959 () Bool)

(assert (=> d!123083 m!947959))

(declare-fun m!947961 () Bool)

(assert (=> b!1029241 m!947961))

(declare-fun m!947963 () Bool)

(assert (=> b!1029242 m!947963))

(assert (=> b!1029118 d!123083))

(declare-fun d!123085 () Bool)

(assert (=> d!123085 (= (apply!896 (+!3127 lt!453478 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427))) lt!453480) (apply!896 lt!453478 lt!453480))))

(declare-fun lt!453558 () Unit!33495)

(declare-fun choose!1697 (ListLongMap!13757 (_ BitVec 64) V!37291 (_ BitVec 64)) Unit!33495)

(assert (=> d!123085 (= lt!453558 (choose!1697 lt!453478 lt!453489 (zeroValue!5950 thiss!1427) lt!453480))))

(declare-fun e!581095 () Bool)

(assert (=> d!123085 e!581095))

(declare-fun res!688527 () Bool)

(assert (=> d!123085 (=> (not res!688527) (not e!581095))))

(assert (=> d!123085 (= res!688527 (contains!5951 lt!453478 lt!453480))))

(assert (=> d!123085 (= (addApplyDifferent!471 lt!453478 lt!453489 (zeroValue!5950 thiss!1427) lt!453480) lt!453558)))

(declare-fun b!1029246 () Bool)

(assert (=> b!1029246 (= e!581095 (not (= lt!453480 lt!453489)))))

(assert (= (and d!123085 res!688527) b!1029246))

(declare-fun m!947965 () Bool)

(assert (=> d!123085 m!947965))

(assert (=> d!123085 m!947793))

(assert (=> d!123085 m!947815))

(declare-fun m!947967 () Bool)

(assert (=> d!123085 m!947967))

(assert (=> d!123085 m!947793))

(assert (=> d!123085 m!947795))

(assert (=> b!1029118 d!123085))

(declare-fun d!123087 () Bool)

(assert (=> d!123087 (= (apply!896 (+!3127 lt!453472 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427))) lt!453483) (get!16352 (getValueByKey!588 (toList!6894 (+!3127 lt!453472 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427)))) lt!453483)))))

(declare-fun bs!30031 () Bool)

(assert (= bs!30031 d!123087))

(declare-fun m!947969 () Bool)

(assert (=> bs!30031 m!947969))

(assert (=> bs!30031 m!947969))

(declare-fun m!947971 () Bool)

(assert (=> bs!30031 m!947971))

(assert (=> b!1029118 d!123087))

(declare-fun d!123089 () Bool)

(declare-fun e!581096 () Bool)

(assert (=> d!123089 e!581096))

(declare-fun res!688529 () Bool)

(assert (=> d!123089 (=> (not res!688529) (not e!581096))))

(declare-fun lt!453561 () ListLongMap!13757)

(assert (=> d!123089 (= res!688529 (contains!5951 lt!453561 (_1!7834 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427)))))))

(declare-fun lt!453562 () List!21856)

(assert (=> d!123089 (= lt!453561 (ListLongMap!13758 lt!453562))))

(declare-fun lt!453559 () Unit!33495)

(declare-fun lt!453560 () Unit!33495)

(assert (=> d!123089 (= lt!453559 lt!453560)))

(assert (=> d!123089 (= (getValueByKey!588 lt!453562 (_1!7834 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427)))))))

(assert (=> d!123089 (= lt!453560 (lemmaContainsTupThenGetReturnValue!278 lt!453562 (_1!7834 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427)))))))

(assert (=> d!123089 (= lt!453562 (insertStrictlySorted!371 (toList!6894 lt!453487) (_1!7834 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427)))))))

(assert (=> d!123089 (= (+!3127 lt!453487 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427))) lt!453561)))

(declare-fun b!1029247 () Bool)

(declare-fun res!688528 () Bool)

(assert (=> b!1029247 (=> (not res!688528) (not e!581096))))

(assert (=> b!1029247 (= res!688528 (= (getValueByKey!588 (toList!6894 lt!453561) (_1!7834 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427))))))))

(declare-fun b!1029248 () Bool)

(assert (=> b!1029248 (= e!581096 (contains!5953 (toList!6894 lt!453561) (tuple2!15647 lt!453477 (minValue!5950 thiss!1427))))))

(assert (= (and d!123089 res!688529) b!1029247))

(assert (= (and b!1029247 res!688528) b!1029248))

(declare-fun m!947973 () Bool)

(assert (=> d!123089 m!947973))

(declare-fun m!947975 () Bool)

(assert (=> d!123089 m!947975))

(declare-fun m!947977 () Bool)

(assert (=> d!123089 m!947977))

(declare-fun m!947979 () Bool)

(assert (=> d!123089 m!947979))

(declare-fun m!947981 () Bool)

(assert (=> b!1029247 m!947981))

(declare-fun m!947983 () Bool)

(assert (=> b!1029248 m!947983))

(assert (=> b!1029118 d!123089))

(declare-fun d!123091 () Bool)

(assert (=> d!123091 (= (apply!896 (+!3127 lt!453487 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427))) lt!453490) (get!16352 (getValueByKey!588 (toList!6894 (+!3127 lt!453487 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427)))) lt!453490)))))

(declare-fun bs!30032 () Bool)

(assert (= bs!30032 d!123091))

(declare-fun m!947985 () Bool)

(assert (=> bs!30032 m!947985))

(assert (=> bs!30032 m!947985))

(declare-fun m!947987 () Bool)

(assert (=> bs!30032 m!947987))

(assert (=> b!1029118 d!123091))

(declare-fun d!123093 () Bool)

(declare-fun e!581097 () Bool)

(assert (=> d!123093 e!581097))

(declare-fun res!688531 () Bool)

(assert (=> d!123093 (=> (not res!688531) (not e!581097))))

(declare-fun lt!453565 () ListLongMap!13757)

(assert (=> d!123093 (= res!688531 (contains!5951 lt!453565 (_1!7834 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427)))))))

(declare-fun lt!453566 () List!21856)

(assert (=> d!123093 (= lt!453565 (ListLongMap!13758 lt!453566))))

(declare-fun lt!453563 () Unit!33495)

(declare-fun lt!453564 () Unit!33495)

(assert (=> d!123093 (= lt!453563 lt!453564)))

(assert (=> d!123093 (= (getValueByKey!588 lt!453566 (_1!7834 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123093 (= lt!453564 (lemmaContainsTupThenGetReturnValue!278 lt!453566 (_1!7834 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123093 (= lt!453566 (insertStrictlySorted!371 (toList!6894 lt!453478) (_1!7834 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123093 (= (+!3127 lt!453478 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427))) lt!453565)))

(declare-fun b!1029249 () Bool)

(declare-fun res!688530 () Bool)

(assert (=> b!1029249 (=> (not res!688530) (not e!581097))))

(assert (=> b!1029249 (= res!688530 (= (getValueByKey!588 (toList!6894 lt!453565) (_1!7834 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427))))))))

(declare-fun b!1029250 () Bool)

(assert (=> b!1029250 (= e!581097 (contains!5953 (toList!6894 lt!453565) (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427))))))

(assert (= (and d!123093 res!688531) b!1029249))

(assert (= (and b!1029249 res!688530) b!1029250))

(declare-fun m!947989 () Bool)

(assert (=> d!123093 m!947989))

(declare-fun m!947991 () Bool)

(assert (=> d!123093 m!947991))

(declare-fun m!947993 () Bool)

(assert (=> d!123093 m!947993))

(declare-fun m!947995 () Bool)

(assert (=> d!123093 m!947995))

(declare-fun m!947997 () Bool)

(assert (=> b!1029249 m!947997))

(declare-fun m!947999 () Bool)

(assert (=> b!1029250 m!947999))

(assert (=> b!1029118 d!123093))

(declare-fun d!123095 () Bool)

(assert (=> d!123095 (= (apply!896 (+!3127 lt!453472 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427))) lt!453483) (apply!896 lt!453472 lt!453483))))

(declare-fun lt!453567 () Unit!33495)

(assert (=> d!123095 (= lt!453567 (choose!1697 lt!453472 lt!453482 (minValue!5950 thiss!1427) lt!453483))))

(declare-fun e!581098 () Bool)

(assert (=> d!123095 e!581098))

(declare-fun res!688532 () Bool)

(assert (=> d!123095 (=> (not res!688532) (not e!581098))))

(assert (=> d!123095 (= res!688532 (contains!5951 lt!453472 lt!453483))))

(assert (=> d!123095 (= (addApplyDifferent!471 lt!453472 lt!453482 (minValue!5950 thiss!1427) lt!453483) lt!453567)))

(declare-fun b!1029251 () Bool)

(assert (=> b!1029251 (= e!581098 (not (= lt!453483 lt!453482)))))

(assert (= (and d!123095 res!688532) b!1029251))

(declare-fun m!948001 () Bool)

(assert (=> d!123095 m!948001))

(assert (=> d!123095 m!947797))

(assert (=> d!123095 m!947799))

(declare-fun m!948003 () Bool)

(assert (=> d!123095 m!948003))

(assert (=> d!123095 m!947797))

(assert (=> d!123095 m!947805))

(assert (=> b!1029118 d!123095))

(declare-fun d!123097 () Bool)

(assert (=> d!123097 (= (apply!896 (+!3127 lt!453478 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427))) lt!453480) (get!16352 (getValueByKey!588 (toList!6894 (+!3127 lt!453478 (tuple2!15647 lt!453489 (zeroValue!5950 thiss!1427)))) lt!453480)))))

(declare-fun bs!30033 () Bool)

(assert (= bs!30033 d!123097))

(declare-fun m!948005 () Bool)

(assert (=> bs!30033 m!948005))

(assert (=> bs!30033 m!948005))

(declare-fun m!948007 () Bool)

(assert (=> bs!30033 m!948007))

(assert (=> b!1029118 d!123097))

(declare-fun d!123099 () Bool)

(declare-fun e!581103 () Bool)

(assert (=> d!123099 e!581103))

(declare-fun res!688535 () Bool)

(assert (=> d!123099 (=> res!688535 e!581103)))

(declare-fun lt!453577 () Bool)

(assert (=> d!123099 (= res!688535 (not lt!453577))))

(declare-fun lt!453578 () Bool)

(assert (=> d!123099 (= lt!453577 lt!453578)))

(declare-fun lt!453576 () Unit!33495)

(declare-fun e!581104 () Unit!33495)

(assert (=> d!123099 (= lt!453576 e!581104)))

(declare-fun c!103935 () Bool)

(assert (=> d!123099 (= c!103935 lt!453578)))

(declare-fun containsKey!561 (List!21856 (_ BitVec 64)) Bool)

(assert (=> d!123099 (= lt!453578 (containsKey!561 (toList!6894 (+!3127 lt!453481 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427)))) lt!453485))))

(assert (=> d!123099 (= (contains!5951 (+!3127 lt!453481 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427))) lt!453485) lt!453577)))

(declare-fun b!1029258 () Bool)

(declare-fun lt!453579 () Unit!33495)

(assert (=> b!1029258 (= e!581104 lt!453579)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!393 (List!21856 (_ BitVec 64)) Unit!33495)

(assert (=> b!1029258 (= lt!453579 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6894 (+!3127 lt!453481 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427)))) lt!453485))))

(declare-fun isDefined!436 (Option!639) Bool)

(assert (=> b!1029258 (isDefined!436 (getValueByKey!588 (toList!6894 (+!3127 lt!453481 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427)))) lt!453485))))

(declare-fun b!1029259 () Bool)

(declare-fun Unit!33505 () Unit!33495)

(assert (=> b!1029259 (= e!581104 Unit!33505)))

(declare-fun b!1029260 () Bool)

(assert (=> b!1029260 (= e!581103 (isDefined!436 (getValueByKey!588 (toList!6894 (+!3127 lt!453481 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427)))) lt!453485)))))

(assert (= (and d!123099 c!103935) b!1029258))

(assert (= (and d!123099 (not c!103935)) b!1029259))

(assert (= (and d!123099 (not res!688535)) b!1029260))

(declare-fun m!948009 () Bool)

(assert (=> d!123099 m!948009))

(declare-fun m!948011 () Bool)

(assert (=> b!1029258 m!948011))

(declare-fun m!948013 () Bool)

(assert (=> b!1029258 m!948013))

(assert (=> b!1029258 m!948013))

(declare-fun m!948015 () Bool)

(assert (=> b!1029258 m!948015))

(assert (=> b!1029260 m!948013))

(assert (=> b!1029260 m!948013))

(assert (=> b!1029260 m!948015))

(assert (=> b!1029118 d!123099))

(declare-fun d!123101 () Bool)

(assert (=> d!123101 (= (apply!896 lt!453487 lt!453490) (get!16352 (getValueByKey!588 (toList!6894 lt!453487) lt!453490)))))

(declare-fun bs!30034 () Bool)

(assert (= bs!30034 d!123101))

(declare-fun m!948017 () Bool)

(assert (=> bs!30034 m!948017))

(assert (=> bs!30034 m!948017))

(declare-fun m!948019 () Bool)

(assert (=> bs!30034 m!948019))

(assert (=> b!1029118 d!123101))

(declare-fun d!123103 () Bool)

(assert (=> d!123103 (= (apply!896 (+!3127 lt!453487 (tuple2!15647 lt!453477 (minValue!5950 thiss!1427))) lt!453490) (apply!896 lt!453487 lt!453490))))

(declare-fun lt!453580 () Unit!33495)

(assert (=> d!123103 (= lt!453580 (choose!1697 lt!453487 lt!453477 (minValue!5950 thiss!1427) lt!453490))))

(declare-fun e!581105 () Bool)

(assert (=> d!123103 e!581105))

(declare-fun res!688536 () Bool)

(assert (=> d!123103 (=> (not res!688536) (not e!581105))))

(assert (=> d!123103 (= res!688536 (contains!5951 lt!453487 lt!453490))))

(assert (=> d!123103 (= (addApplyDifferent!471 lt!453487 lt!453477 (minValue!5950 thiss!1427) lt!453490) lt!453580)))

(declare-fun b!1029261 () Bool)

(assert (=> b!1029261 (= e!581105 (not (= lt!453490 lt!453477)))))

(assert (= (and d!123103 res!688536) b!1029261))

(declare-fun m!948021 () Bool)

(assert (=> d!123103 m!948021))

(assert (=> d!123103 m!947789))

(assert (=> d!123103 m!947791))

(declare-fun m!948023 () Bool)

(assert (=> d!123103 m!948023))

(assert (=> d!123103 m!947789))

(assert (=> d!123103 m!947811))

(assert (=> b!1029118 d!123103))

(declare-fun d!123105 () Bool)

(declare-fun e!581106 () Bool)

(assert (=> d!123105 e!581106))

(declare-fun res!688538 () Bool)

(assert (=> d!123105 (=> (not res!688538) (not e!581106))))

(declare-fun lt!453583 () ListLongMap!13757)

(assert (=> d!123105 (= res!688538 (contains!5951 lt!453583 (_1!7834 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427)))))))

(declare-fun lt!453584 () List!21856)

(assert (=> d!123105 (= lt!453583 (ListLongMap!13758 lt!453584))))

(declare-fun lt!453581 () Unit!33495)

(declare-fun lt!453582 () Unit!33495)

(assert (=> d!123105 (= lt!453581 lt!453582)))

(assert (=> d!123105 (= (getValueByKey!588 lt!453584 (_1!7834 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427)))))))

(assert (=> d!123105 (= lt!453582 (lemmaContainsTupThenGetReturnValue!278 lt!453584 (_1!7834 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427)))))))

(assert (=> d!123105 (= lt!453584 (insertStrictlySorted!371 (toList!6894 lt!453472) (_1!7834 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427)))))))

(assert (=> d!123105 (= (+!3127 lt!453472 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427))) lt!453583)))

(declare-fun b!1029262 () Bool)

(declare-fun res!688537 () Bool)

(assert (=> b!1029262 (=> (not res!688537) (not e!581106))))

(assert (=> b!1029262 (= res!688537 (= (getValueByKey!588 (toList!6894 lt!453583) (_1!7834 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453482 (minValue!5950 thiss!1427))))))))

(declare-fun b!1029263 () Bool)

(assert (=> b!1029263 (= e!581106 (contains!5953 (toList!6894 lt!453583) (tuple2!15647 lt!453482 (minValue!5950 thiss!1427))))))

(assert (= (and d!123105 res!688538) b!1029262))

(assert (= (and b!1029262 res!688537) b!1029263))

(declare-fun m!948025 () Bool)

(assert (=> d!123105 m!948025))

(declare-fun m!948027 () Bool)

(assert (=> d!123105 m!948027))

(declare-fun m!948029 () Bool)

(assert (=> d!123105 m!948029))

(declare-fun m!948031 () Bool)

(assert (=> d!123105 m!948031))

(declare-fun m!948033 () Bool)

(assert (=> b!1029262 m!948033))

(declare-fun m!948035 () Bool)

(assert (=> b!1029263 m!948035))

(assert (=> b!1029118 d!123105))

(declare-fun d!123107 () Bool)

(assert (=> d!123107 (contains!5951 (+!3127 lt!453481 (tuple2!15647 lt!453474 (zeroValue!5950 thiss!1427))) lt!453485)))

(declare-fun lt!453587 () Unit!33495)

(declare-fun choose!1698 (ListLongMap!13757 (_ BitVec 64) V!37291 (_ BitVec 64)) Unit!33495)

(assert (=> d!123107 (= lt!453587 (choose!1698 lt!453481 lt!453474 (zeroValue!5950 thiss!1427) lt!453485))))

(assert (=> d!123107 (contains!5951 lt!453481 lt!453485)))

(assert (=> d!123107 (= (addStillContains!615 lt!453481 lt!453474 (zeroValue!5950 thiss!1427) lt!453485) lt!453587)))

(declare-fun bs!30035 () Bool)

(assert (= bs!30035 d!123107))

(assert (=> bs!30035 m!947801))

(assert (=> bs!30035 m!947801))

(assert (=> bs!30035 m!947809))

(declare-fun m!948037 () Bool)

(assert (=> bs!30035 m!948037))

(declare-fun m!948039 () Bool)

(assert (=> bs!30035 m!948039))

(assert (=> b!1029118 d!123107))

(declare-fun b!1029289 () Bool)

(declare-fun res!688550 () Bool)

(declare-fun e!581127 () Bool)

(assert (=> b!1029289 (=> (not res!688550) (not e!581127))))

(declare-fun lt!453606 () ListLongMap!13757)

(assert (=> b!1029289 (= res!688550 (not (contains!5951 lt!453606 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123109 () Bool)

(assert (=> d!123109 e!581127))

(declare-fun res!688548 () Bool)

(assert (=> d!123109 (=> (not res!688548) (not e!581127))))

(assert (=> d!123109 (= res!688548 (not (contains!5951 lt!453606 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!581122 () ListLongMap!13757)

(assert (=> d!123109 (= lt!453606 e!581122)))

(declare-fun c!103946 () Bool)

(assert (=> d!123109 (= c!103946 (bvsge #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> d!123109 (validMask!0 (mask!29861 thiss!1427))))

(assert (=> d!123109 (= (getCurrentListMapNoExtraKeys!3562 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) lt!453606)))

(declare-fun b!1029290 () Bool)

(assert (=> b!1029290 (= e!581122 (ListLongMap!13758 Nil!21853))))

(declare-fun b!1029291 () Bool)

(declare-fun e!581125 () ListLongMap!13757)

(assert (=> b!1029291 (= e!581122 e!581125)))

(declare-fun c!103945 () Bool)

(assert (=> b!1029291 (= c!103945 (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029292 () Bool)

(declare-fun e!581121 () Bool)

(declare-fun e!581124 () Bool)

(assert (=> b!1029292 (= e!581121 e!581124)))

(declare-fun c!103947 () Bool)

(assert (=> b!1029292 (= c!103947 (bvslt #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun b!1029293 () Bool)

(declare-fun lt!453602 () Unit!33495)

(declare-fun lt!453603 () Unit!33495)

(assert (=> b!1029293 (= lt!453602 lt!453603)))

(declare-fun lt!453604 () ListLongMap!13757)

(declare-fun lt!453607 () V!37291)

(declare-fun lt!453605 () (_ BitVec 64))

(declare-fun lt!453608 () (_ BitVec 64))

(assert (=> b!1029293 (not (contains!5951 (+!3127 lt!453604 (tuple2!15647 lt!453605 lt!453607)) lt!453608))))

(declare-fun addStillNotContains!241 (ListLongMap!13757 (_ BitVec 64) V!37291 (_ BitVec 64)) Unit!33495)

(assert (=> b!1029293 (= lt!453603 (addStillNotContains!241 lt!453604 lt!453605 lt!453607 lt!453608))))

(assert (=> b!1029293 (= lt!453608 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1029293 (= lt!453607 (get!16351 (select (arr!31117 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1029293 (= lt!453605 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun call!43453 () ListLongMap!13757)

(assert (=> b!1029293 (= lt!453604 call!43453)))

(assert (=> b!1029293 (= e!581125 (+!3127 call!43453 (tuple2!15647 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000) (get!16351 (select (arr!31117 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1029294 () Bool)

(assert (=> b!1029294 (= e!581125 call!43453)))

(declare-fun b!1029295 () Bool)

(assert (=> b!1029295 (= e!581127 e!581121)))

(declare-fun c!103944 () Bool)

(declare-fun e!581126 () Bool)

(assert (=> b!1029295 (= c!103944 e!581126)))

(declare-fun res!688549 () Bool)

(assert (=> b!1029295 (=> (not res!688549) (not e!581126))))

(assert (=> b!1029295 (= res!688549 (bvslt #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun bm!43450 () Bool)

(assert (=> bm!43450 (= call!43453 (getCurrentListMapNoExtraKeys!3562 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6114 thiss!1427)))))

(declare-fun b!1029296 () Bool)

(assert (=> b!1029296 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> b!1029296 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31634 (_values!6137 thiss!1427))))))

(declare-fun e!581123 () Bool)

(assert (=> b!1029296 (= e!581123 (= (apply!896 lt!453606 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)) (get!16351 (select (arr!31117 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1029297 () Bool)

(assert (=> b!1029297 (= e!581124 (= lt!453606 (getCurrentListMapNoExtraKeys!3562 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6114 thiss!1427))))))

(declare-fun b!1029298 () Bool)

(assert (=> b!1029298 (= e!581121 e!581123)))

(assert (=> b!1029298 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun res!688547 () Bool)

(assert (=> b!1029298 (= res!688547 (contains!5951 lt!453606 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029298 (=> (not res!688547) (not e!581123))))

(declare-fun b!1029299 () Bool)

(declare-fun isEmpty!929 (ListLongMap!13757) Bool)

(assert (=> b!1029299 (= e!581124 (isEmpty!929 lt!453606))))

(declare-fun b!1029300 () Bool)

(assert (=> b!1029300 (= e!581126 (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029300 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!123109 c!103946) b!1029290))

(assert (= (and d!123109 (not c!103946)) b!1029291))

(assert (= (and b!1029291 c!103945) b!1029293))

(assert (= (and b!1029291 (not c!103945)) b!1029294))

(assert (= (or b!1029293 b!1029294) bm!43450))

(assert (= (and d!123109 res!688548) b!1029289))

(assert (= (and b!1029289 res!688550) b!1029295))

(assert (= (and b!1029295 res!688549) b!1029300))

(assert (= (and b!1029295 c!103944) b!1029298))

(assert (= (and b!1029295 (not c!103944)) b!1029292))

(assert (= (and b!1029298 res!688547) b!1029296))

(assert (= (and b!1029292 c!103947) b!1029297))

(assert (= (and b!1029292 (not c!103947)) b!1029299))

(declare-fun b_lambda!15845 () Bool)

(assert (=> (not b_lambda!15845) (not b!1029293)))

(assert (=> b!1029293 t!30934))

(declare-fun b_and!32903 () Bool)

(assert (= b_and!32901 (and (=> t!30934 result!14137) b_and!32903)))

(declare-fun b_lambda!15847 () Bool)

(assert (=> (not b_lambda!15847) (not b!1029296)))

(assert (=> b!1029296 t!30934))

(declare-fun b_and!32905 () Bool)

(assert (= b_and!32903 (and (=> t!30934 result!14137) b_and!32905)))

(assert (=> b!1029293 m!947781))

(declare-fun m!948041 () Bool)

(assert (=> b!1029293 m!948041))

(assert (=> b!1029293 m!947823))

(assert (=> b!1029293 m!947823))

(assert (=> b!1029293 m!947653))

(assert (=> b!1029293 m!947825))

(declare-fun m!948043 () Bool)

(assert (=> b!1029293 m!948043))

(declare-fun m!948045 () Bool)

(assert (=> b!1029293 m!948045))

(declare-fun m!948047 () Bool)

(assert (=> b!1029293 m!948047))

(assert (=> b!1029293 m!948043))

(assert (=> b!1029293 m!947653))

(assert (=> b!1029298 m!947781))

(assert (=> b!1029298 m!947781))

(declare-fun m!948049 () Bool)

(assert (=> b!1029298 m!948049))

(assert (=> b!1029296 m!947781))

(assert (=> b!1029296 m!947781))

(declare-fun m!948051 () Bool)

(assert (=> b!1029296 m!948051))

(assert (=> b!1029296 m!947823))

(assert (=> b!1029296 m!947823))

(assert (=> b!1029296 m!947653))

(assert (=> b!1029296 m!947825))

(assert (=> b!1029296 m!947653))

(declare-fun m!948053 () Bool)

(assert (=> b!1029299 m!948053))

(declare-fun m!948055 () Bool)

(assert (=> b!1029297 m!948055))

(assert (=> bm!43450 m!948055))

(declare-fun m!948057 () Bool)

(assert (=> d!123109 m!948057))

(assert (=> d!123109 m!947765))

(assert (=> b!1029300 m!947781))

(assert (=> b!1029300 m!947781))

(assert (=> b!1029300 m!947783))

(assert (=> b!1029291 m!947781))

(assert (=> b!1029291 m!947781))

(assert (=> b!1029291 m!947783))

(declare-fun m!948059 () Bool)

(assert (=> b!1029289 m!948059))

(assert (=> b!1029118 d!123109))

(declare-fun b!1029319 () Bool)

(declare-fun lt!453613 () SeekEntryResult!9672)

(assert (=> b!1029319 (and (bvsge (index!41061 lt!453613) #b00000000000000000000000000000000) (bvslt (index!41061 lt!453613) (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun res!688559 () Bool)

(assert (=> b!1029319 (= res!688559 (= (select (arr!31116 (_keys!11271 thiss!1427)) (index!41061 lt!453613)) key!909))))

(declare-fun e!581138 () Bool)

(assert (=> b!1029319 (=> res!688559 e!581138)))

(declare-fun e!581139 () Bool)

(assert (=> b!1029319 (= e!581139 e!581138)))

(declare-fun b!1029320 () Bool)

(declare-fun e!581141 () SeekEntryResult!9672)

(assert (=> b!1029320 (= e!581141 (Intermediate!9672 true (toIndex!0 key!909 (mask!29861 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1029321 () Bool)

(declare-fun e!581142 () SeekEntryResult!9672)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029321 (= e!581142 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29861 thiss!1427)) #b00000000000000000000000000000000 (mask!29861 thiss!1427)) key!909 (_keys!11271 thiss!1427) (mask!29861 thiss!1427)))))

(declare-fun b!1029322 () Bool)

(assert (=> b!1029322 (and (bvsge (index!41061 lt!453613) #b00000000000000000000000000000000) (bvslt (index!41061 lt!453613) (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> b!1029322 (= e!581138 (= (select (arr!31116 (_keys!11271 thiss!1427)) (index!41061 lt!453613)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029323 () Bool)

(declare-fun e!581140 () Bool)

(assert (=> b!1029323 (= e!581140 (bvsge (x!91573 lt!453613) #b01111111111111111111111111111110))))

(declare-fun d!123111 () Bool)

(assert (=> d!123111 e!581140))

(declare-fun c!103954 () Bool)

(assert (=> d!123111 (= c!103954 (and ((_ is Intermediate!9672) lt!453613) (undefined!10484 lt!453613)))))

(assert (=> d!123111 (= lt!453613 e!581141)))

(declare-fun c!103955 () Bool)

(assert (=> d!123111 (= c!103955 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!453614 () (_ BitVec 64))

(assert (=> d!123111 (= lt!453614 (select (arr!31116 (_keys!11271 thiss!1427)) (toIndex!0 key!909 (mask!29861 thiss!1427))))))

(assert (=> d!123111 (validMask!0 (mask!29861 thiss!1427))))

(assert (=> d!123111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29861 thiss!1427)) key!909 (_keys!11271 thiss!1427) (mask!29861 thiss!1427)) lt!453613)))

(declare-fun b!1029324 () Bool)

(assert (=> b!1029324 (= e!581140 e!581139)))

(declare-fun res!688557 () Bool)

(assert (=> b!1029324 (= res!688557 (and ((_ is Intermediate!9672) lt!453613) (not (undefined!10484 lt!453613)) (bvslt (x!91573 lt!453613) #b01111111111111111111111111111110) (bvsge (x!91573 lt!453613) #b00000000000000000000000000000000) (bvsge (x!91573 lt!453613) #b00000000000000000000000000000000)))))

(assert (=> b!1029324 (=> (not res!688557) (not e!581139))))

(declare-fun b!1029325 () Bool)

(assert (=> b!1029325 (= e!581141 e!581142)))

(declare-fun c!103956 () Bool)

(assert (=> b!1029325 (= c!103956 (or (= lt!453614 key!909) (= (bvadd lt!453614 lt!453614) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029326 () Bool)

(assert (=> b!1029326 (= e!581142 (Intermediate!9672 false (toIndex!0 key!909 (mask!29861 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1029327 () Bool)

(assert (=> b!1029327 (and (bvsge (index!41061 lt!453613) #b00000000000000000000000000000000) (bvslt (index!41061 lt!453613) (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun res!688558 () Bool)

(assert (=> b!1029327 (= res!688558 (= (select (arr!31116 (_keys!11271 thiss!1427)) (index!41061 lt!453613)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029327 (=> res!688558 e!581138)))

(assert (= (and d!123111 c!103955) b!1029320))

(assert (= (and d!123111 (not c!103955)) b!1029325))

(assert (= (and b!1029325 c!103956) b!1029326))

(assert (= (and b!1029325 (not c!103956)) b!1029321))

(assert (= (and d!123111 c!103954) b!1029323))

(assert (= (and d!123111 (not c!103954)) b!1029324))

(assert (= (and b!1029324 res!688557) b!1029319))

(assert (= (and b!1029319 (not res!688559)) b!1029327))

(assert (= (and b!1029327 (not res!688558)) b!1029322))

(declare-fun m!948061 () Bool)

(assert (=> b!1029322 m!948061))

(assert (=> b!1029327 m!948061))

(assert (=> d!123111 m!947761))

(declare-fun m!948063 () Bool)

(assert (=> d!123111 m!948063))

(assert (=> d!123111 m!947765))

(assert (=> b!1029321 m!947761))

(declare-fun m!948065 () Bool)

(assert (=> b!1029321 m!948065))

(assert (=> b!1029321 m!948065))

(declare-fun m!948067 () Bool)

(assert (=> b!1029321 m!948067))

(assert (=> b!1029319 m!948061))

(assert (=> d!123037 d!123111))

(declare-fun d!123113 () Bool)

(declare-fun lt!453620 () (_ BitVec 32))

(declare-fun lt!453619 () (_ BitVec 32))

(assert (=> d!123113 (= lt!453620 (bvmul (bvxor lt!453619 (bvlshr lt!453619 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!123113 (= lt!453619 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!123113 (and (bvsge (mask!29861 thiss!1427) #b00000000000000000000000000000000) (let ((res!688560 (let ((h!23056 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91607 (bvmul (bvxor h!23056 (bvlshr h!23056 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91607 (bvlshr x!91607 #b00000000000000000000000000001101)) (mask!29861 thiss!1427)))))) (and (bvslt res!688560 (bvadd (mask!29861 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!688560 #b00000000000000000000000000000000))))))

(assert (=> d!123113 (= (toIndex!0 key!909 (mask!29861 thiss!1427)) (bvand (bvxor lt!453620 (bvlshr lt!453620 #b00000000000000000000000000001101)) (mask!29861 thiss!1427)))))

(assert (=> d!123037 d!123113))

(declare-fun d!123115 () Bool)

(assert (=> d!123115 (= (validMask!0 (mask!29861 thiss!1427)) (and (or (= (mask!29861 thiss!1427) #b00000000000000000000000000000111) (= (mask!29861 thiss!1427) #b00000000000000000000000000001111) (= (mask!29861 thiss!1427) #b00000000000000000000000000011111) (= (mask!29861 thiss!1427) #b00000000000000000000000000111111) (= (mask!29861 thiss!1427) #b00000000000000000000000001111111) (= (mask!29861 thiss!1427) #b00000000000000000000000011111111) (= (mask!29861 thiss!1427) #b00000000000000000000000111111111) (= (mask!29861 thiss!1427) #b00000000000000000000001111111111) (= (mask!29861 thiss!1427) #b00000000000000000000011111111111) (= (mask!29861 thiss!1427) #b00000000000000000000111111111111) (= (mask!29861 thiss!1427) #b00000000000000000001111111111111) (= (mask!29861 thiss!1427) #b00000000000000000011111111111111) (= (mask!29861 thiss!1427) #b00000000000000000111111111111111) (= (mask!29861 thiss!1427) #b00000000000000001111111111111111) (= (mask!29861 thiss!1427) #b00000000000000011111111111111111) (= (mask!29861 thiss!1427) #b00000000000000111111111111111111) (= (mask!29861 thiss!1427) #b00000000000001111111111111111111) (= (mask!29861 thiss!1427) #b00000000000011111111111111111111) (= (mask!29861 thiss!1427) #b00000000000111111111111111111111) (= (mask!29861 thiss!1427) #b00000000001111111111111111111111) (= (mask!29861 thiss!1427) #b00000000011111111111111111111111) (= (mask!29861 thiss!1427) #b00000000111111111111111111111111) (= (mask!29861 thiss!1427) #b00000001111111111111111111111111) (= (mask!29861 thiss!1427) #b00000011111111111111111111111111) (= (mask!29861 thiss!1427) #b00000111111111111111111111111111) (= (mask!29861 thiss!1427) #b00001111111111111111111111111111) (= (mask!29861 thiss!1427) #b00011111111111111111111111111111) (= (mask!29861 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29861 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!123037 d!123115))

(declare-fun b!1029328 () Bool)

(declare-fun e!581143 () Bool)

(declare-fun call!43454 () Bool)

(assert (=> b!1029328 (= e!581143 call!43454)))

(declare-fun b!1029329 () Bool)

(declare-fun e!581145 () Bool)

(assert (=> b!1029329 (= e!581145 call!43454)))

(declare-fun b!1029330 () Bool)

(declare-fun e!581144 () Bool)

(assert (=> b!1029330 (= e!581144 e!581145)))

(declare-fun c!103957 () Bool)

(assert (=> b!1029330 (= c!103957 (validKeyInArray!0 (select (arr!31116 lt!453355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!123117 () Bool)

(declare-fun res!688561 () Bool)

(assert (=> d!123117 (=> res!688561 e!581144)))

(assert (=> d!123117 (= res!688561 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 lt!453355)))))

(assert (=> d!123117 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453355 (mask!29861 thiss!1427)) e!581144)))

(declare-fun b!1029331 () Bool)

(assert (=> b!1029331 (= e!581145 e!581143)))

(declare-fun lt!453622 () (_ BitVec 64))

(assert (=> b!1029331 (= lt!453622 (select (arr!31116 lt!453355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!453621 () Unit!33495)

(assert (=> b!1029331 (= lt!453621 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453355 lt!453622 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1029331 (arrayContainsKey!0 lt!453355 lt!453622 #b00000000000000000000000000000000)))

(declare-fun lt!453623 () Unit!33495)

(assert (=> b!1029331 (= lt!453623 lt!453621)))

(declare-fun res!688562 () Bool)

(assert (=> b!1029331 (= res!688562 (= (seekEntryOrOpen!0 (select (arr!31116 lt!453355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!453355 (mask!29861 thiss!1427)) (Found!9672 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1029331 (=> (not res!688562) (not e!581143))))

(declare-fun bm!43451 () Bool)

(assert (=> bm!43451 (= call!43454 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!453355 (mask!29861 thiss!1427)))))

(assert (= (and d!123117 (not res!688561)) b!1029330))

(assert (= (and b!1029330 c!103957) b!1029331))

(assert (= (and b!1029330 (not c!103957)) b!1029329))

(assert (= (and b!1029331 res!688562) b!1029328))

(assert (= (or b!1029328 b!1029329) bm!43451))

(declare-fun m!948069 () Bool)

(assert (=> b!1029330 m!948069))

(assert (=> b!1029330 m!948069))

(declare-fun m!948071 () Bool)

(assert (=> b!1029330 m!948071))

(assert (=> b!1029331 m!948069))

(declare-fun m!948073 () Bool)

(assert (=> b!1029331 m!948073))

(declare-fun m!948075 () Bool)

(assert (=> b!1029331 m!948075))

(assert (=> b!1029331 m!948069))

(declare-fun m!948077 () Bool)

(assert (=> b!1029331 m!948077))

(declare-fun m!948079 () Bool)

(assert (=> bm!43451 m!948079))

(assert (=> bm!43432 d!123117))

(declare-fun d!123119 () Bool)

(declare-fun e!581146 () Bool)

(assert (=> d!123119 e!581146))

(declare-fun res!688563 () Bool)

(assert (=> d!123119 (=> res!688563 e!581146)))

(declare-fun lt!453625 () Bool)

(assert (=> d!123119 (= res!688563 (not lt!453625))))

(declare-fun lt!453626 () Bool)

(assert (=> d!123119 (= lt!453625 lt!453626)))

(declare-fun lt!453624 () Unit!33495)

(declare-fun e!581147 () Unit!33495)

(assert (=> d!123119 (= lt!453624 e!581147)))

(declare-fun c!103958 () Bool)

(assert (=> d!123119 (= c!103958 lt!453626)))

(assert (=> d!123119 (= lt!453626 (containsKey!561 (toList!6894 lt!453484) (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123119 (= (contains!5951 lt!453484 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)) lt!453625)))

(declare-fun b!1029332 () Bool)

(declare-fun lt!453627 () Unit!33495)

(assert (=> b!1029332 (= e!581147 lt!453627)))

(assert (=> b!1029332 (= lt!453627 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6894 lt!453484) (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029332 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453484) (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029333 () Bool)

(declare-fun Unit!33506 () Unit!33495)

(assert (=> b!1029333 (= e!581147 Unit!33506)))

(declare-fun b!1029334 () Bool)

(assert (=> b!1029334 (= e!581146 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453484) (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123119 c!103958) b!1029332))

(assert (= (and d!123119 (not c!103958)) b!1029333))

(assert (= (and d!123119 (not res!688563)) b!1029334))

(assert (=> d!123119 m!947781))

(declare-fun m!948081 () Bool)

(assert (=> d!123119 m!948081))

(assert (=> b!1029332 m!947781))

(declare-fun m!948083 () Bool)

(assert (=> b!1029332 m!948083))

(assert (=> b!1029332 m!947781))

(declare-fun m!948085 () Bool)

(assert (=> b!1029332 m!948085))

(assert (=> b!1029332 m!948085))

(declare-fun m!948087 () Bool)

(assert (=> b!1029332 m!948087))

(assert (=> b!1029334 m!947781))

(assert (=> b!1029334 m!948085))

(assert (=> b!1029334 m!948085))

(assert (=> b!1029334 m!948087))

(assert (=> b!1029133 d!123119))

(assert (=> b!1029116 d!123075))

(declare-fun d!123121 () Bool)

(declare-fun e!581148 () Bool)

(assert (=> d!123121 e!581148))

(declare-fun res!688565 () Bool)

(assert (=> d!123121 (=> (not res!688565) (not e!581148))))

(declare-fun lt!453630 () ListLongMap!13757)

(assert (=> d!123121 (= res!688565 (contains!5951 lt!453630 (_1!7834 (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(declare-fun lt!453631 () List!21856)

(assert (=> d!123121 (= lt!453630 (ListLongMap!13758 lt!453631))))

(declare-fun lt!453628 () Unit!33495)

(declare-fun lt!453629 () Unit!33495)

(assert (=> d!123121 (= lt!453628 lt!453629)))

(assert (=> d!123121 (= (getValueByKey!588 lt!453631 (_1!7834 (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))) (Some!638 (_2!7834 (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(assert (=> d!123121 (= lt!453629 (lemmaContainsTupThenGetReturnValue!278 lt!453631 (_1!7834 (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (_2!7834 (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(assert (=> d!123121 (= lt!453631 (insertStrictlySorted!371 (toList!6894 (ite c!103922 call!43445 (ite c!103924 call!43440 call!43439))) (_1!7834 (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (_2!7834 (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(assert (=> d!123121 (= (+!3127 (ite c!103922 call!43445 (ite c!103924 call!43440 call!43439)) (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) lt!453630)))

(declare-fun b!1029335 () Bool)

(declare-fun res!688564 () Bool)

(assert (=> b!1029335 (=> (not res!688564) (not e!581148))))

(assert (=> b!1029335 (= res!688564 (= (getValueByKey!588 (toList!6894 lt!453630) (_1!7834 (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))) (Some!638 (_2!7834 (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))))

(declare-fun b!1029336 () Bool)

(assert (=> b!1029336 (= e!581148 (contains!5953 (toList!6894 lt!453630) (ite (or c!103922 c!103924) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (= (and d!123121 res!688565) b!1029335))

(assert (= (and b!1029335 res!688564) b!1029336))

(declare-fun m!948089 () Bool)

(assert (=> d!123121 m!948089))

(declare-fun m!948091 () Bool)

(assert (=> d!123121 m!948091))

(declare-fun m!948093 () Bool)

(assert (=> d!123121 m!948093))

(declare-fun m!948095 () Bool)

(assert (=> d!123121 m!948095))

(declare-fun m!948097 () Bool)

(assert (=> b!1029335 m!948097))

(declare-fun m!948099 () Bool)

(assert (=> b!1029336 m!948099))

(assert (=> bm!43437 d!123121))

(declare-fun d!123123 () Bool)

(assert (=> d!123123 (= (validKeyInArray!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)) (and (not (= (select (arr!31116 lt!453355) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31116 lt!453355) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029147 d!123123))

(assert (=> b!1029207 d!123075))

(assert (=> d!123067 d!123115))

(declare-fun d!123125 () Bool)

(assert (=> d!123125 (= (apply!896 lt!453484 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16352 (getValueByKey!588 (toList!6894 lt!453484) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30036 () Bool)

(assert (= bs!30036 d!123125))

(declare-fun m!948101 () Bool)

(assert (=> bs!30036 m!948101))

(assert (=> bs!30036 m!948101))

(declare-fun m!948103 () Bool)

(assert (=> bs!30036 m!948103))

(assert (=> b!1029114 d!123125))

(assert (=> b!1029188 d!123123))

(declare-fun d!123127 () Bool)

(assert (=> d!123127 (= (apply!896 lt!453533 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16352 (getValueByKey!588 (toList!6894 lt!453533) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30037 () Bool)

(assert (= bs!30037 d!123127))

(declare-fun m!948105 () Bool)

(assert (=> bs!30037 m!948105))

(assert (=> bs!30037 m!948105))

(declare-fun m!948107 () Bool)

(assert (=> bs!30037 m!948107))

(assert (=> b!1029186 d!123127))

(declare-fun d!123129 () Bool)

(assert (=> d!123129 (= (arrayCountValidKeys!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11271 thiss!1427) #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!123129 true))

(declare-fun _$79!14 () Unit!33495)

(assert (=> d!123129 (= (choose!82 (_keys!11271 thiss!1427) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!14)))

(declare-fun bs!30038 () Bool)

(assert (= bs!30038 d!123129))

(assert (=> bs!30038 m!947633))

(assert (=> bs!30038 m!947859))

(assert (=> bs!30038 m!947639))

(assert (=> d!123061 d!123129))

(declare-fun d!123131 () Bool)

(assert (=> d!123131 (not (arrayContainsKey!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!123131 true))

(declare-fun _$59!17 () Unit!33495)

(assert (=> d!123131 (= (choose!121 (_keys!11271 thiss!1427) (index!41060 lt!453354) key!909) _$59!17)))

(declare-fun bs!30039 () Bool)

(assert (= bs!30039 d!123131))

(assert (=> bs!30039 m!947633))

(assert (=> bs!30039 m!947857))

(assert (=> d!123059 d!123131))

(assert (=> d!123049 d!123115))

(declare-fun d!123133 () Bool)

(declare-fun e!581149 () Bool)

(assert (=> d!123133 e!581149))

(declare-fun res!688567 () Bool)

(assert (=> d!123133 (=> (not res!688567) (not e!581149))))

(declare-fun lt!453634 () ListLongMap!13757)

(assert (=> d!123133 (= res!688567 (contains!5951 lt!453634 (_1!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(declare-fun lt!453635 () List!21856)

(assert (=> d!123133 (= lt!453634 (ListLongMap!13758 lt!453635))))

(declare-fun lt!453632 () Unit!33495)

(declare-fun lt!453633 () Unit!33495)

(assert (=> d!123133 (= lt!453632 lt!453633)))

(assert (=> d!123133 (= (getValueByKey!588 lt!453635 (_1!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123133 (= lt!453633 (lemmaContainsTupThenGetReturnValue!278 lt!453635 (_1!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123133 (= lt!453635 (insertStrictlySorted!371 (toList!6894 call!43431) (_1!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123133 (= (+!3127 call!43431 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) lt!453634)))

(declare-fun b!1029337 () Bool)

(declare-fun res!688566 () Bool)

(assert (=> b!1029337 (=> (not res!688566) (not e!581149))))

(assert (=> b!1029337 (= res!688566 (= (getValueByKey!588 (toList!6894 lt!453634) (_1!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(declare-fun b!1029338 () Bool)

(assert (=> b!1029338 (= e!581149 (contains!5953 (toList!6894 lt!453634) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))

(assert (= (and d!123133 res!688567) b!1029337))

(assert (= (and b!1029337 res!688566) b!1029338))

(declare-fun m!948109 () Bool)

(assert (=> d!123133 m!948109))

(declare-fun m!948111 () Bool)

(assert (=> d!123133 m!948111))

(declare-fun m!948113 () Bool)

(assert (=> d!123133 m!948113))

(declare-fun m!948115 () Bool)

(assert (=> d!123133 m!948115))

(declare-fun m!948117 () Bool)

(assert (=> b!1029337 m!948117))

(declare-fun m!948119 () Bool)

(assert (=> b!1029338 m!948119))

(assert (=> b!1029124 d!123133))

(declare-fun d!123135 () Bool)

(declare-fun lt!453636 () (_ BitVec 32))

(assert (=> d!123135 (and (bvsge lt!453636 #b00000000000000000000000000000000) (bvsle lt!453636 (bvsub (size!31633 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!581151 () (_ BitVec 32))

(assert (=> d!123135 (= lt!453636 e!581151)))

(declare-fun c!103960 () Bool)

(assert (=> d!123135 (= c!103960 (bvsge #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> d!123135 (and (bvsle #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31633 (_keys!11271 thiss!1427)) (size!31633 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))))))))

(assert (=> d!123135 (= (arrayCountValidKeys!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))) lt!453636)))

(declare-fun b!1029339 () Bool)

(declare-fun e!581150 () (_ BitVec 32))

(declare-fun call!43455 () (_ BitVec 32))

(assert (=> b!1029339 (= e!581150 (bvadd #b00000000000000000000000000000001 call!43455))))

(declare-fun b!1029340 () Bool)

(assert (=> b!1029340 (= e!581151 e!581150)))

(declare-fun c!103959 () Bool)

(assert (=> b!1029340 (= c!103959 (validKeyInArray!0 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029341 () Bool)

(assert (=> b!1029341 (= e!581151 #b00000000000000000000000000000000)))

(declare-fun bm!43452 () Bool)

(assert (=> bm!43452 (= call!43455 (arrayCountValidKeys!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun b!1029342 () Bool)

(assert (=> b!1029342 (= e!581150 call!43455)))

(assert (= (and d!123135 c!103960) b!1029341))

(assert (= (and d!123135 (not c!103960)) b!1029340))

(assert (= (and b!1029340 c!103959) b!1029339))

(assert (= (and b!1029340 (not c!103959)) b!1029342))

(assert (= (or b!1029339 b!1029342) bm!43452))

(declare-fun m!948121 () Bool)

(assert (=> b!1029340 m!948121))

(assert (=> b!1029340 m!948121))

(declare-fun m!948123 () Bool)

(assert (=> b!1029340 m!948123))

(declare-fun m!948125 () Bool)

(assert (=> bm!43452 m!948125))

(assert (=> b!1029175 d!123135))

(assert (=> b!1029175 d!123069))

(declare-fun d!123137 () Bool)

(declare-fun res!688568 () Bool)

(declare-fun e!581152 () Bool)

(assert (=> d!123137 (=> res!688568 e!581152)))

(assert (=> d!123137 (= res!688568 (= (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123137 (= (arrayContainsKey!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) key!909 #b00000000000000000000000000000000) e!581152)))

(declare-fun b!1029343 () Bool)

(declare-fun e!581153 () Bool)

(assert (=> b!1029343 (= e!581152 e!581153)))

(declare-fun res!688569 () Bool)

(assert (=> b!1029343 (=> (not res!688569) (not e!581153))))

(assert (=> b!1029343 (= res!688569 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))))))))

(declare-fun b!1029344 () Bool)

(assert (=> b!1029344 (= e!581153 (arrayContainsKey!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123137 (not res!688568)) b!1029343))

(assert (= (and b!1029343 res!688569) b!1029344))

(assert (=> d!123137 m!948121))

(declare-fun m!948127 () Bool)

(assert (=> b!1029344 m!948127))

(assert (=> b!1029163 d!123137))

(declare-fun d!123139 () Bool)

(assert (=> d!123139 (arrayNoDuplicates!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) #b00000000000000000000000000000000 Nil!21854)))

(assert (=> d!123139 true))

(declare-fun _$66!38 () Unit!33495)

(assert (=> d!123139 (= (choose!53 (_keys!11271 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41060 lt!453354) #b00000000000000000000000000000000 Nil!21854) _$66!38)))

(declare-fun bs!30040 () Bool)

(assert (= bs!30040 d!123139))

(assert (=> bs!30040 m!947633))

(assert (=> bs!30040 m!947775))

(assert (=> d!123047 d!123139))

(declare-fun b!1029345 () Bool)

(declare-fun e!581156 () Bool)

(declare-fun e!581154 () Bool)

(assert (=> b!1029345 (= e!581156 e!581154)))

(declare-fun c!103961 () Bool)

(assert (=> b!1029345 (= c!103961 (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029346 () Bool)

(declare-fun e!581157 () Bool)

(assert (=> b!1029346 (= e!581157 (contains!5952 Nil!21854 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029347 () Bool)

(declare-fun call!43456 () Bool)

(assert (=> b!1029347 (= e!581154 call!43456)))

(declare-fun d!123141 () Bool)

(declare-fun res!688572 () Bool)

(declare-fun e!581155 () Bool)

(assert (=> d!123141 (=> res!688572 e!581155)))

(assert (=> d!123141 (= res!688572 (bvsge #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> d!123141 (= (arrayNoDuplicates!0 (_keys!11271 thiss!1427) #b00000000000000000000000000000000 Nil!21854) e!581155)))

(declare-fun bm!43453 () Bool)

(assert (=> bm!43453 (= call!43456 (arrayNoDuplicates!0 (_keys!11271 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103961 (Cons!21853 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000) Nil!21854) Nil!21854)))))

(declare-fun b!1029348 () Bool)

(assert (=> b!1029348 (= e!581154 call!43456)))

(declare-fun b!1029349 () Bool)

(assert (=> b!1029349 (= e!581155 e!581156)))

(declare-fun res!688570 () Bool)

(assert (=> b!1029349 (=> (not res!688570) (not e!581156))))

(assert (=> b!1029349 (= res!688570 (not e!581157))))

(declare-fun res!688571 () Bool)

(assert (=> b!1029349 (=> (not res!688571) (not e!581157))))

(assert (=> b!1029349 (= res!688571 (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123141 (not res!688572)) b!1029349))

(assert (= (and b!1029349 res!688571) b!1029346))

(assert (= (and b!1029349 res!688570) b!1029345))

(assert (= (and b!1029345 c!103961) b!1029348))

(assert (= (and b!1029345 (not c!103961)) b!1029347))

(assert (= (or b!1029348 b!1029347) bm!43453))

(assert (=> b!1029345 m!947781))

(assert (=> b!1029345 m!947781))

(assert (=> b!1029345 m!947783))

(assert (=> b!1029346 m!947781))

(assert (=> b!1029346 m!947781))

(declare-fun m!948129 () Bool)

(assert (=> b!1029346 m!948129))

(assert (=> bm!43453 m!947781))

(declare-fun m!948131 () Bool)

(assert (=> bm!43453 m!948131))

(assert (=> b!1029349 m!947781))

(assert (=> b!1029349 m!947781))

(assert (=> b!1029349 m!947783))

(assert (=> b!1029067 d!123141))

(declare-fun d!123143 () Bool)

(assert (=> d!123143 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1029173 d!123143))

(assert (=> b!1029220 d!123123))

(declare-fun d!123145 () Bool)

(declare-fun e!581158 () Bool)

(assert (=> d!123145 e!581158))

(declare-fun res!688573 () Bool)

(assert (=> d!123145 (=> res!688573 e!581158)))

(declare-fun lt!453638 () Bool)

(assert (=> d!123145 (= res!688573 (not lt!453638))))

(declare-fun lt!453639 () Bool)

(assert (=> d!123145 (= lt!453638 lt!453639)))

(declare-fun lt!453637 () Unit!33495)

(declare-fun e!581159 () Unit!33495)

(assert (=> d!123145 (= lt!453637 e!581159)))

(declare-fun c!103962 () Bool)

(assert (=> d!123145 (= c!103962 lt!453639)))

(assert (=> d!123145 (= lt!453639 (containsKey!561 (toList!6894 lt!453484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123145 (= (contains!5951 lt!453484 #b1000000000000000000000000000000000000000000000000000000000000000) lt!453638)))

(declare-fun b!1029350 () Bool)

(declare-fun lt!453640 () Unit!33495)

(assert (=> b!1029350 (= e!581159 lt!453640)))

(assert (=> b!1029350 (= lt!453640 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6894 lt!453484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029350 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029351 () Bool)

(declare-fun Unit!33507 () Unit!33495)

(assert (=> b!1029351 (= e!581159 Unit!33507)))

(declare-fun b!1029352 () Bool)

(assert (=> b!1029352 (= e!581158 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123145 c!103962) b!1029350))

(assert (= (and d!123145 (not c!103962)) b!1029351))

(assert (= (and d!123145 (not res!688573)) b!1029352))

(declare-fun m!948133 () Bool)

(assert (=> d!123145 m!948133))

(declare-fun m!948135 () Bool)

(assert (=> b!1029350 m!948135))

(assert (=> b!1029350 m!947935))

(assert (=> b!1029350 m!947935))

(declare-fun m!948137 () Bool)

(assert (=> b!1029350 m!948137))

(assert (=> b!1029352 m!947935))

(assert (=> b!1029352 m!947935))

(assert (=> b!1029352 m!948137))

(assert (=> bm!43426 d!123145))

(declare-fun b!1029353 () Bool)

(declare-fun e!581162 () Bool)

(declare-fun e!581160 () Bool)

(assert (=> b!1029353 (= e!581162 e!581160)))

(declare-fun c!103963 () Bool)

(assert (=> b!1029353 (= c!103963 (validKeyInArray!0 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029354 () Bool)

(declare-fun e!581163 () Bool)

(assert (=> b!1029354 (= e!581163 (contains!5952 Nil!21854 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029355 () Bool)

(declare-fun call!43457 () Bool)

(assert (=> b!1029355 (= e!581160 call!43457)))

(declare-fun d!123147 () Bool)

(declare-fun res!688576 () Bool)

(declare-fun e!581161 () Bool)

(assert (=> d!123147 (=> res!688576 e!581161)))

(assert (=> d!123147 (= res!688576 (bvsge #b00000000000000000000000000000000 (size!31633 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))))))))

(assert (=> d!123147 (= (arrayNoDuplicates!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) #b00000000000000000000000000000000 Nil!21854) e!581161)))

(declare-fun bm!43454 () Bool)

(assert (=> bm!43454 (= call!43457 (arrayNoDuplicates!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103963 (Cons!21853 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000) Nil!21854) Nil!21854)))))

(declare-fun b!1029356 () Bool)

(assert (=> b!1029356 (= e!581160 call!43457)))

(declare-fun b!1029357 () Bool)

(assert (=> b!1029357 (= e!581161 e!581162)))

(declare-fun res!688574 () Bool)

(assert (=> b!1029357 (=> (not res!688574) (not e!581162))))

(assert (=> b!1029357 (= res!688574 (not e!581163))))

(declare-fun res!688575 () Bool)

(assert (=> b!1029357 (=> (not res!688575) (not e!581163))))

(assert (=> b!1029357 (= res!688575 (validKeyInArray!0 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!123147 (not res!688576)) b!1029357))

(assert (= (and b!1029357 res!688575) b!1029354))

(assert (= (and b!1029357 res!688574) b!1029353))

(assert (= (and b!1029353 c!103963) b!1029356))

(assert (= (and b!1029353 (not c!103963)) b!1029355))

(assert (= (or b!1029356 b!1029355) bm!43454))

(assert (=> b!1029353 m!948121))

(assert (=> b!1029353 m!948121))

(assert (=> b!1029353 m!948123))

(assert (=> b!1029354 m!948121))

(assert (=> b!1029354 m!948121))

(declare-fun m!948139 () Bool)

(assert (=> b!1029354 m!948139))

(assert (=> bm!43454 m!948121))

(declare-fun m!948141 () Bool)

(assert (=> bm!43454 m!948141))

(assert (=> b!1029357 m!948121))

(assert (=> b!1029357 m!948121))

(assert (=> b!1029357 m!948123))

(assert (=> b!1029070 d!123147))

(declare-fun d!123149 () Bool)

(assert (=> d!123149 (= (apply!896 lt!453533 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)) (get!16352 (getValueByKey!588 (toList!6894 lt!453533) (select (arr!31116 lt!453355) #b00000000000000000000000000000000))))))

(declare-fun bs!30041 () Bool)

(assert (= bs!30041 d!123149))

(assert (=> bs!30041 m!947841))

(declare-fun m!948143 () Bool)

(assert (=> bs!30041 m!948143))

(assert (=> bs!30041 m!948143))

(declare-fun m!948145 () Bool)

(assert (=> bs!30041 m!948145))

(assert (=> b!1029195 d!123149))

(declare-fun d!123151 () Bool)

(declare-fun c!103966 () Bool)

(assert (=> d!123151 (= c!103966 ((_ is ValueCellFull!11453) (select (arr!31117 lt!453350) #b00000000000000000000000000000000)))))

(declare-fun e!581166 () V!37291)

(assert (=> d!123151 (= (get!16351 (select (arr!31117 lt!453350) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581166)))

(declare-fun b!1029362 () Bool)

(declare-fun get!16353 (ValueCell!11453 V!37291) V!37291)

(assert (=> b!1029362 (= e!581166 (get!16353 (select (arr!31117 lt!453350) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029363 () Bool)

(declare-fun get!16354 (ValueCell!11453 V!37291) V!37291)

(assert (=> b!1029363 (= e!581166 (get!16354 (select (arr!31117 lt!453350) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123151 c!103966) b!1029362))

(assert (= (and d!123151 (not c!103966)) b!1029363))

(assert (=> b!1029362 m!947917))

(assert (=> b!1029362 m!947653))

(declare-fun m!948147 () Bool)

(assert (=> b!1029362 m!948147))

(assert (=> b!1029363 m!947917))

(assert (=> b!1029363 m!947653))

(declare-fun m!948149 () Bool)

(assert (=> b!1029363 m!948149))

(assert (=> b!1029195 d!123151))

(declare-fun b!1029373 () Bool)

(declare-fun res!688585 () Bool)

(declare-fun e!581169 () Bool)

(assert (=> b!1029373 (=> (not res!688585) (not e!581169))))

(declare-fun size!31639 (LongMapFixedSize!5500) (_ BitVec 32))

(assert (=> b!1029373 (= res!688585 (bvsge (size!31639 thiss!1427) (_size!2805 thiss!1427)))))

(declare-fun b!1029374 () Bool)

(declare-fun res!688588 () Bool)

(assert (=> b!1029374 (=> (not res!688588) (not e!581169))))

(assert (=> b!1029374 (= res!688588 (= (size!31639 thiss!1427) (bvadd (_size!2805 thiss!1427) (bvsdiv (bvadd (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!123153 () Bool)

(declare-fun res!688586 () Bool)

(assert (=> d!123153 (=> (not res!688586) (not e!581169))))

(assert (=> d!123153 (= res!688586 (validMask!0 (mask!29861 thiss!1427)))))

(assert (=> d!123153 (= (simpleValid!394 thiss!1427) e!581169)))

(declare-fun b!1029372 () Bool)

(declare-fun res!688587 () Bool)

(assert (=> b!1029372 (=> (not res!688587) (not e!581169))))

(assert (=> b!1029372 (= res!688587 (and (= (size!31634 (_values!6137 thiss!1427)) (bvadd (mask!29861 thiss!1427) #b00000000000000000000000000000001)) (= (size!31633 (_keys!11271 thiss!1427)) (size!31634 (_values!6137 thiss!1427))) (bvsge (_size!2805 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2805 thiss!1427) (bvadd (mask!29861 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1029375 () Bool)

(assert (=> b!1029375 (= e!581169 (and (bvsge (extraKeys!5846 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5846 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2805 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!123153 res!688586) b!1029372))

(assert (= (and b!1029372 res!688587) b!1029373))

(assert (= (and b!1029373 res!688585) b!1029374))

(assert (= (and b!1029374 res!688588) b!1029375))

(declare-fun m!948151 () Bool)

(assert (=> b!1029373 m!948151))

(assert (=> b!1029374 m!948151))

(assert (=> d!123153 m!947765))

(assert (=> d!123039 d!123153))

(declare-fun d!123155 () Bool)

(declare-fun e!581170 () Bool)

(assert (=> d!123155 e!581170))

(declare-fun res!688589 () Bool)

(assert (=> d!123155 (=> res!688589 e!581170)))

(declare-fun lt!453642 () Bool)

(assert (=> d!123155 (= res!688589 (not lt!453642))))

(declare-fun lt!453643 () Bool)

(assert (=> d!123155 (= lt!453642 lt!453643)))

(declare-fun lt!453641 () Unit!33495)

(declare-fun e!581171 () Unit!33495)

(assert (=> d!123155 (= lt!453641 e!581171)))

(declare-fun c!103967 () Bool)

(assert (=> d!123155 (= c!103967 lt!453643)))

(assert (=> d!123155 (= lt!453643 (containsKey!561 (toList!6894 lt!453533) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123155 (= (contains!5951 lt!453533 #b1000000000000000000000000000000000000000000000000000000000000000) lt!453642)))

(declare-fun b!1029376 () Bool)

(declare-fun lt!453644 () Unit!33495)

(assert (=> b!1029376 (= e!581171 lt!453644)))

(assert (=> b!1029376 (= lt!453644 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6894 lt!453533) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029376 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453533) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029377 () Bool)

(declare-fun Unit!33508 () Unit!33495)

(assert (=> b!1029377 (= e!581171 Unit!33508)))

(declare-fun b!1029378 () Bool)

(assert (=> b!1029378 (= e!581170 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123155 c!103967) b!1029376))

(assert (= (and d!123155 (not c!103967)) b!1029377))

(assert (= (and d!123155 (not res!688589)) b!1029378))

(declare-fun m!948153 () Bool)

(assert (=> d!123155 m!948153))

(declare-fun m!948155 () Bool)

(assert (=> b!1029376 m!948155))

(declare-fun m!948157 () Bool)

(assert (=> b!1029376 m!948157))

(assert (=> b!1029376 m!948157))

(declare-fun m!948159 () Bool)

(assert (=> b!1029376 m!948159))

(assert (=> b!1029378 m!948157))

(assert (=> b!1029378 m!948157))

(assert (=> b!1029378 m!948159))

(assert (=> bm!43439 d!123155))

(declare-fun d!123157 () Bool)

(declare-fun res!688590 () Bool)

(declare-fun e!581172 () Bool)

(assert (=> d!123157 (=> res!688590 e!581172)))

(assert (=> d!123157 (= res!688590 (= (select (arr!31116 lt!453355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!123157 (= (arrayContainsKey!0 lt!453355 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!581172)))

(declare-fun b!1029379 () Bool)

(declare-fun e!581173 () Bool)

(assert (=> b!1029379 (= e!581172 e!581173)))

(declare-fun res!688591 () Bool)

(assert (=> b!1029379 (=> (not res!688591) (not e!581173))))

(assert (=> b!1029379 (= res!688591 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31633 lt!453355)))))

(declare-fun b!1029380 () Bool)

(assert (=> b!1029380 (= e!581173 (arrayContainsKey!0 lt!453355 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!123157 (not res!688590)) b!1029379))

(assert (= (and b!1029379 res!688591) b!1029380))

(assert (=> d!123157 m!948069))

(declare-fun m!948161 () Bool)

(assert (=> b!1029380 m!948161))

(assert (=> b!1029181 d!123157))

(declare-fun d!123159 () Bool)

(assert (=> d!123159 (= (apply!896 lt!453533 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16352 (getValueByKey!588 (toList!6894 lt!453533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30042 () Bool)

(assert (= bs!30042 d!123159))

(assert (=> bs!30042 m!948157))

(assert (=> bs!30042 m!948157))

(declare-fun m!948163 () Bool)

(assert (=> bs!30042 m!948163))

(assert (=> b!1029193 d!123159))

(declare-fun d!123161 () Bool)

(declare-fun e!581174 () Bool)

(assert (=> d!123161 e!581174))

(declare-fun res!688593 () Bool)

(assert (=> d!123161 (=> (not res!688593) (not e!581174))))

(declare-fun lt!453647 () ListLongMap!13757)

(assert (=> d!123161 (= res!688593 (contains!5951 lt!453647 (_1!7834 (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(declare-fun lt!453648 () List!21856)

(assert (=> d!123161 (= lt!453647 (ListLongMap!13758 lt!453648))))

(declare-fun lt!453645 () Unit!33495)

(declare-fun lt!453646 () Unit!33495)

(assert (=> d!123161 (= lt!453645 lt!453646)))

(assert (=> d!123161 (= (getValueByKey!588 lt!453648 (_1!7834 (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))) (Some!638 (_2!7834 (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(assert (=> d!123161 (= lt!453646 (lemmaContainsTupThenGetReturnValue!278 lt!453648 (_1!7834 (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (_2!7834 (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(assert (=> d!123161 (= lt!453648 (insertStrictlySorted!371 (toList!6894 (ite c!103907 call!43432 (ite c!103909 call!43427 call!43426))) (_1!7834 (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (_2!7834 (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(assert (=> d!123161 (= (+!3127 (ite c!103907 call!43432 (ite c!103909 call!43427 call!43426)) (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) lt!453647)))

(declare-fun b!1029381 () Bool)

(declare-fun res!688592 () Bool)

(assert (=> b!1029381 (=> (not res!688592) (not e!581174))))

(assert (=> b!1029381 (= res!688592 (= (getValueByKey!588 (toList!6894 lt!453647) (_1!7834 (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))) (Some!638 (_2!7834 (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))))

(declare-fun b!1029382 () Bool)

(assert (=> b!1029382 (= e!581174 (contains!5953 (toList!6894 lt!453647) (ite (or c!103907 c!103909) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (= (and d!123161 res!688593) b!1029381))

(assert (= (and b!1029381 res!688592) b!1029382))

(declare-fun m!948165 () Bool)

(assert (=> d!123161 m!948165))

(declare-fun m!948167 () Bool)

(assert (=> d!123161 m!948167))

(declare-fun m!948169 () Bool)

(assert (=> d!123161 m!948169))

(declare-fun m!948171 () Bool)

(assert (=> d!123161 m!948171))

(declare-fun m!948173 () Bool)

(assert (=> b!1029381 m!948173))

(declare-fun m!948175 () Bool)

(assert (=> b!1029382 m!948175))

(assert (=> bm!43424 d!123161))

(declare-fun d!123163 () Bool)

(assert (=> d!123163 (arrayContainsKey!0 lt!453355 lt!453506 #b00000000000000000000000000000000)))

(declare-fun lt!453651 () Unit!33495)

(declare-fun choose!13 (array!64623 (_ BitVec 64) (_ BitVec 32)) Unit!33495)

(assert (=> d!123163 (= lt!453651 (choose!13 lt!453355 lt!453506 #b00000000000000000000000000000000))))

(assert (=> d!123163 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!123163 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453355 lt!453506 #b00000000000000000000000000000000) lt!453651)))

(declare-fun bs!30043 () Bool)

(assert (= bs!30043 d!123163))

(assert (=> bs!30043 m!947847))

(declare-fun m!948177 () Bool)

(assert (=> bs!30043 m!948177))

(assert (=> b!1029148 d!123163))

(declare-fun d!123165 () Bool)

(declare-fun res!688594 () Bool)

(declare-fun e!581175 () Bool)

(assert (=> d!123165 (=> res!688594 e!581175)))

(assert (=> d!123165 (= res!688594 (= (select (arr!31116 lt!453355) #b00000000000000000000000000000000) lt!453506))))

(assert (=> d!123165 (= (arrayContainsKey!0 lt!453355 lt!453506 #b00000000000000000000000000000000) e!581175)))

(declare-fun b!1029383 () Bool)

(declare-fun e!581176 () Bool)

(assert (=> b!1029383 (= e!581175 e!581176)))

(declare-fun res!688595 () Bool)

(assert (=> b!1029383 (=> (not res!688595) (not e!581176))))

(assert (=> b!1029383 (= res!688595 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 lt!453355)))))

(declare-fun b!1029384 () Bool)

(assert (=> b!1029384 (= e!581176 (arrayContainsKey!0 lt!453355 lt!453506 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123165 (not res!688594)) b!1029383))

(assert (= (and b!1029383 res!688595) b!1029384))

(assert (=> d!123165 m!947841))

(declare-fun m!948179 () Bool)

(assert (=> b!1029384 m!948179))

(assert (=> b!1029148 d!123165))

(declare-fun d!123167 () Bool)

(declare-fun lt!453659 () SeekEntryResult!9672)

(assert (=> d!123167 (and (or ((_ is Undefined!9672) lt!453659) (not ((_ is Found!9672) lt!453659)) (and (bvsge (index!41060 lt!453659) #b00000000000000000000000000000000) (bvslt (index!41060 lt!453659) (size!31633 lt!453355)))) (or ((_ is Undefined!9672) lt!453659) ((_ is Found!9672) lt!453659) (not ((_ is MissingZero!9672) lt!453659)) (and (bvsge (index!41059 lt!453659) #b00000000000000000000000000000000) (bvslt (index!41059 lt!453659) (size!31633 lt!453355)))) (or ((_ is Undefined!9672) lt!453659) ((_ is Found!9672) lt!453659) ((_ is MissingZero!9672) lt!453659) (not ((_ is MissingVacant!9672) lt!453659)) (and (bvsge (index!41062 lt!453659) #b00000000000000000000000000000000) (bvslt (index!41062 lt!453659) (size!31633 lt!453355)))) (or ((_ is Undefined!9672) lt!453659) (ite ((_ is Found!9672) lt!453659) (= (select (arr!31116 lt!453355) (index!41060 lt!453659)) (select (arr!31116 lt!453355) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9672) lt!453659) (= (select (arr!31116 lt!453355) (index!41059 lt!453659)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9672) lt!453659) (= (select (arr!31116 lt!453355) (index!41062 lt!453659)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!581184 () SeekEntryResult!9672)

(assert (=> d!123167 (= lt!453659 e!581184)))

(declare-fun c!103974 () Bool)

(declare-fun lt!453660 () SeekEntryResult!9672)

(assert (=> d!123167 (= c!103974 (and ((_ is Intermediate!9672) lt!453660) (undefined!10484 lt!453660)))))

(assert (=> d!123167 (= lt!453660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000) (mask!29861 thiss!1427)) (select (arr!31116 lt!453355) #b00000000000000000000000000000000) lt!453355 (mask!29861 thiss!1427)))))

(assert (=> d!123167 (validMask!0 (mask!29861 thiss!1427))))

(assert (=> d!123167 (= (seekEntryOrOpen!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000) lt!453355 (mask!29861 thiss!1427)) lt!453659)))

(declare-fun b!1029397 () Bool)

(assert (=> b!1029397 (= e!581184 Undefined!9672)))

(declare-fun b!1029398 () Bool)

(declare-fun e!581185 () SeekEntryResult!9672)

(assert (=> b!1029398 (= e!581184 e!581185)))

(declare-fun lt!453658 () (_ BitVec 64))

(assert (=> b!1029398 (= lt!453658 (select (arr!31116 lt!453355) (index!41061 lt!453660)))))

(declare-fun c!103976 () Bool)

(assert (=> b!1029398 (= c!103976 (= lt!453658 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun b!1029399 () Bool)

(declare-fun c!103975 () Bool)

(assert (=> b!1029399 (= c!103975 (= lt!453658 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581183 () SeekEntryResult!9672)

(assert (=> b!1029399 (= e!581185 e!581183)))

(declare-fun b!1029400 () Bool)

(assert (=> b!1029400 (= e!581183 (seekKeyOrZeroReturnVacant!0 (x!91573 lt!453660) (index!41061 lt!453660) (index!41061 lt!453660) (select (arr!31116 lt!453355) #b00000000000000000000000000000000) lt!453355 (mask!29861 thiss!1427)))))

(declare-fun b!1029401 () Bool)

(assert (=> b!1029401 (= e!581185 (Found!9672 (index!41061 lt!453660)))))

(declare-fun b!1029402 () Bool)

(assert (=> b!1029402 (= e!581183 (MissingZero!9672 (index!41061 lt!453660)))))

(assert (= (and d!123167 c!103974) b!1029397))

(assert (= (and d!123167 (not c!103974)) b!1029398))

(assert (= (and b!1029398 c!103976) b!1029401))

(assert (= (and b!1029398 (not c!103976)) b!1029399))

(assert (= (and b!1029399 c!103975) b!1029402))

(assert (= (and b!1029399 (not c!103975)) b!1029400))

(declare-fun m!948181 () Bool)

(assert (=> d!123167 m!948181))

(assert (=> d!123167 m!947765))

(declare-fun m!948183 () Bool)

(assert (=> d!123167 m!948183))

(assert (=> d!123167 m!947841))

(declare-fun m!948185 () Bool)

(assert (=> d!123167 m!948185))

(assert (=> d!123167 m!947841))

(assert (=> d!123167 m!948183))

(declare-fun m!948187 () Bool)

(assert (=> d!123167 m!948187))

(declare-fun m!948189 () Bool)

(assert (=> d!123167 m!948189))

(declare-fun m!948191 () Bool)

(assert (=> b!1029398 m!948191))

(assert (=> b!1029400 m!947841))

(declare-fun m!948193 () Bool)

(assert (=> b!1029400 m!948193))

(assert (=> b!1029148 d!123167))

(assert (=> b!1029191 d!123123))

(declare-fun d!123169 () Bool)

(declare-fun e!581186 () Bool)

(assert (=> d!123169 e!581186))

(declare-fun res!688596 () Bool)

(assert (=> d!123169 (=> res!688596 e!581186)))

(declare-fun lt!453662 () Bool)

(assert (=> d!123169 (= res!688596 (not lt!453662))))

(declare-fun lt!453663 () Bool)

(assert (=> d!123169 (= lt!453662 lt!453663)))

(declare-fun lt!453661 () Unit!33495)

(declare-fun e!581187 () Unit!33495)

(assert (=> d!123169 (= lt!453661 e!581187)))

(declare-fun c!103977 () Bool)

(assert (=> d!123169 (= c!103977 lt!453663)))

(assert (=> d!123169 (= lt!453663 (containsKey!561 (toList!6894 lt!453495) key!909))))

(assert (=> d!123169 (= (contains!5951 lt!453495 key!909) lt!453662)))

(declare-fun b!1029403 () Bool)

(declare-fun lt!453664 () Unit!33495)

(assert (=> b!1029403 (= e!581187 lt!453664)))

(assert (=> b!1029403 (= lt!453664 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6894 lt!453495) key!909))))

(assert (=> b!1029403 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453495) key!909))))

(declare-fun b!1029404 () Bool)

(declare-fun Unit!33509 () Unit!33495)

(assert (=> b!1029404 (= e!581187 Unit!33509)))

(declare-fun b!1029405 () Bool)

(assert (=> b!1029405 (= e!581186 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453495) key!909)))))

(assert (= (and d!123169 c!103977) b!1029403))

(assert (= (and d!123169 (not c!103977)) b!1029404))

(assert (= (and d!123169 (not res!688596)) b!1029405))

(declare-fun m!948195 () Bool)

(assert (=> d!123169 m!948195))

(declare-fun m!948197 () Bool)

(assert (=> b!1029403 m!948197))

(declare-fun m!948199 () Bool)

(assert (=> b!1029403 m!948199))

(assert (=> b!1029403 m!948199))

(declare-fun m!948201 () Bool)

(assert (=> b!1029403 m!948201))

(assert (=> b!1029405 m!948199))

(assert (=> b!1029405 m!948199))

(assert (=> b!1029405 m!948201))

(assert (=> d!123051 d!123169))

(declare-fun d!123171 () Bool)

(declare-fun e!581195 () Bool)

(assert (=> d!123171 e!581195))

(declare-fun res!688599 () Bool)

(assert (=> d!123171 (=> (not res!688599) (not e!581195))))

(declare-fun lt!453667 () List!21856)

(declare-fun isStrictlySorted!712 (List!21856) Bool)

(assert (=> d!123171 (= res!688599 (isStrictlySorted!712 lt!453667))))

(declare-fun e!581194 () List!21856)

(assert (=> d!123171 (= lt!453667 e!581194)))

(declare-fun c!103982 () Bool)

(assert (=> d!123171 (= c!103982 (and ((_ is Cons!21852) (toList!6894 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))) (= (_1!7834 (h!23052 (toList!6894 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))))) key!909)))))

(assert (=> d!123171 (isStrictlySorted!712 (toList!6894 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))))))

(assert (=> d!123171 (= (removeStrictlySorted!53 (toList!6894 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))) key!909) lt!453667)))

(declare-fun b!1029416 () Bool)

(assert (=> b!1029416 (= e!581194 (t!30935 (toList!6894 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))))

(declare-fun b!1029417 () Bool)

(declare-fun e!581196 () List!21856)

(assert (=> b!1029417 (= e!581196 Nil!21853)))

(declare-fun b!1029418 () Bool)

(declare-fun $colon$colon!602 (List!21856 tuple2!15646) List!21856)

(assert (=> b!1029418 (= e!581196 ($colon$colon!602 (removeStrictlySorted!53 (t!30935 (toList!6894 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))) key!909) (h!23052 (toList!6894 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))))))))

(declare-fun b!1029419 () Bool)

(assert (=> b!1029419 (= e!581194 e!581196)))

(declare-fun c!103983 () Bool)

(assert (=> b!1029419 (= c!103983 (and ((_ is Cons!21852) (toList!6894 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))) (not (= (_1!7834 (h!23052 (toList!6894 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))))) key!909))))))

(declare-fun b!1029420 () Bool)

(assert (=> b!1029420 (= e!581195 (not (containsKey!561 lt!453667 key!909)))))

(assert (= (and d!123171 c!103982) b!1029416))

(assert (= (and d!123171 (not c!103982)) b!1029419))

(assert (= (and b!1029419 c!103983) b!1029418))

(assert (= (and b!1029419 (not c!103983)) b!1029417))

(assert (= (and d!123171 res!688599) b!1029420))

(declare-fun m!948203 () Bool)

(assert (=> d!123171 m!948203))

(declare-fun m!948205 () Bool)

(assert (=> d!123171 m!948205))

(declare-fun m!948207 () Bool)

(assert (=> b!1029418 m!948207))

(assert (=> b!1029418 m!948207))

(declare-fun m!948209 () Bool)

(assert (=> b!1029418 m!948209))

(declare-fun m!948211 () Bool)

(assert (=> b!1029420 m!948211))

(assert (=> d!123051 d!123171))

(declare-fun d!123173 () Bool)

(assert (=> d!123173 (= (apply!896 (+!3127 lt!453536 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427))) lt!453539) (apply!896 lt!453536 lt!453539))))

(declare-fun lt!453668 () Unit!33495)

(assert (=> d!123173 (= lt!453668 (choose!1697 lt!453536 lt!453526 (minValue!5950 thiss!1427) lt!453539))))

(declare-fun e!581197 () Bool)

(assert (=> d!123173 e!581197))

(declare-fun res!688600 () Bool)

(assert (=> d!123173 (=> (not res!688600) (not e!581197))))

(assert (=> d!123173 (= res!688600 (contains!5951 lt!453536 lt!453539))))

(assert (=> d!123173 (= (addApplyDifferent!471 lt!453536 lt!453526 (minValue!5950 thiss!1427) lt!453539) lt!453668)))

(declare-fun b!1029421 () Bool)

(assert (=> b!1029421 (= e!581197 (not (= lt!453539 lt!453526)))))

(assert (= (and d!123173 res!688600) b!1029421))

(declare-fun m!948213 () Bool)

(assert (=> d!123173 m!948213))

(assert (=> d!123173 m!947883))

(assert (=> d!123173 m!947885))

(declare-fun m!948215 () Bool)

(assert (=> d!123173 m!948215))

(assert (=> d!123173 m!947883))

(assert (=> d!123173 m!947905))

(assert (=> b!1029190 d!123173))

(declare-fun d!123175 () Bool)

(declare-fun e!581198 () Bool)

(assert (=> d!123175 e!581198))

(declare-fun res!688602 () Bool)

(assert (=> d!123175 (=> (not res!688602) (not e!581198))))

(declare-fun lt!453671 () ListLongMap!13757)

(assert (=> d!123175 (= res!688602 (contains!5951 lt!453671 (_1!7834 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427)))))))

(declare-fun lt!453672 () List!21856)

(assert (=> d!123175 (= lt!453671 (ListLongMap!13758 lt!453672))))

(declare-fun lt!453669 () Unit!33495)

(declare-fun lt!453670 () Unit!33495)

(assert (=> d!123175 (= lt!453669 lt!453670)))

(assert (=> d!123175 (= (getValueByKey!588 lt!453672 (_1!7834 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123175 (= lt!453670 (lemmaContainsTupThenGetReturnValue!278 lt!453672 (_1!7834 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123175 (= lt!453672 (insertStrictlySorted!371 (toList!6894 lt!453530) (_1!7834 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123175 (= (+!3127 lt!453530 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427))) lt!453671)))

(declare-fun b!1029422 () Bool)

(declare-fun res!688601 () Bool)

(assert (=> b!1029422 (=> (not res!688601) (not e!581198))))

(assert (=> b!1029422 (= res!688601 (= (getValueByKey!588 (toList!6894 lt!453671) (_1!7834 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427))))))))

(declare-fun b!1029423 () Bool)

(assert (=> b!1029423 (= e!581198 (contains!5953 (toList!6894 lt!453671) (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427))))))

(assert (= (and d!123175 res!688602) b!1029422))

(assert (= (and b!1029422 res!688601) b!1029423))

(declare-fun m!948217 () Bool)

(assert (=> d!123175 m!948217))

(declare-fun m!948219 () Bool)

(assert (=> d!123175 m!948219))

(declare-fun m!948221 () Bool)

(assert (=> d!123175 m!948221))

(declare-fun m!948223 () Bool)

(assert (=> d!123175 m!948223))

(declare-fun m!948225 () Bool)

(assert (=> b!1029422 m!948225))

(declare-fun m!948227 () Bool)

(assert (=> b!1029423 m!948227))

(assert (=> b!1029190 d!123175))

(declare-fun d!123177 () Bool)

(declare-fun e!581199 () Bool)

(assert (=> d!123177 e!581199))

(declare-fun res!688603 () Bool)

(assert (=> d!123177 (=> res!688603 e!581199)))

(declare-fun lt!453674 () Bool)

(assert (=> d!123177 (= res!688603 (not lt!453674))))

(declare-fun lt!453675 () Bool)

(assert (=> d!123177 (= lt!453674 lt!453675)))

(declare-fun lt!453673 () Unit!33495)

(declare-fun e!581200 () Unit!33495)

(assert (=> d!123177 (= lt!453673 e!581200)))

(declare-fun c!103984 () Bool)

(assert (=> d!123177 (= c!103984 lt!453675)))

(assert (=> d!123177 (= lt!453675 (containsKey!561 (toList!6894 (+!3127 lt!453530 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427)))) lt!453534))))

(assert (=> d!123177 (= (contains!5951 (+!3127 lt!453530 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427))) lt!453534) lt!453674)))

(declare-fun b!1029424 () Bool)

(declare-fun lt!453676 () Unit!33495)

(assert (=> b!1029424 (= e!581200 lt!453676)))

(assert (=> b!1029424 (= lt!453676 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6894 (+!3127 lt!453530 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427)))) lt!453534))))

(assert (=> b!1029424 (isDefined!436 (getValueByKey!588 (toList!6894 (+!3127 lt!453530 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427)))) lt!453534))))

(declare-fun b!1029425 () Bool)

(declare-fun Unit!33510 () Unit!33495)

(assert (=> b!1029425 (= e!581200 Unit!33510)))

(declare-fun b!1029426 () Bool)

(assert (=> b!1029426 (= e!581199 (isDefined!436 (getValueByKey!588 (toList!6894 (+!3127 lt!453530 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427)))) lt!453534)))))

(assert (= (and d!123177 c!103984) b!1029424))

(assert (= (and d!123177 (not c!103984)) b!1029425))

(assert (= (and d!123177 (not res!688603)) b!1029426))

(declare-fun m!948229 () Bool)

(assert (=> d!123177 m!948229))

(declare-fun m!948231 () Bool)

(assert (=> b!1029424 m!948231))

(declare-fun m!948233 () Bool)

(assert (=> b!1029424 m!948233))

(assert (=> b!1029424 m!948233))

(declare-fun m!948235 () Bool)

(assert (=> b!1029424 m!948235))

(assert (=> b!1029426 m!948233))

(assert (=> b!1029426 m!948233))

(assert (=> b!1029426 m!948235))

(assert (=> b!1029190 d!123177))

(declare-fun d!123179 () Bool)

(assert (=> d!123179 (= (apply!896 lt!453536 lt!453539) (get!16352 (getValueByKey!588 (toList!6894 lt!453536) lt!453539)))))

(declare-fun bs!30044 () Bool)

(assert (= bs!30044 d!123179))

(declare-fun m!948237 () Bool)

(assert (=> bs!30044 m!948237))

(assert (=> bs!30044 m!948237))

(declare-fun m!948239 () Bool)

(assert (=> bs!30044 m!948239))

(assert (=> b!1029190 d!123179))

(declare-fun d!123181 () Bool)

(declare-fun e!581201 () Bool)

(assert (=> d!123181 e!581201))

(declare-fun res!688605 () Bool)

(assert (=> d!123181 (=> (not res!688605) (not e!581201))))

(declare-fun lt!453679 () ListLongMap!13757)

(assert (=> d!123181 (= res!688605 (contains!5951 lt!453679 (_1!7834 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427)))))))

(declare-fun lt!453680 () List!21856)

(assert (=> d!123181 (= lt!453679 (ListLongMap!13758 lt!453680))))

(declare-fun lt!453677 () Unit!33495)

(declare-fun lt!453678 () Unit!33495)

(assert (=> d!123181 (= lt!453677 lt!453678)))

(assert (=> d!123181 (= (getValueByKey!588 lt!453680 (_1!7834 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427)))))))

(assert (=> d!123181 (= lt!453678 (lemmaContainsTupThenGetReturnValue!278 lt!453680 (_1!7834 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427)))))))

(assert (=> d!123181 (= lt!453680 (insertStrictlySorted!371 (toList!6894 lt!453521) (_1!7834 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427)))))))

(assert (=> d!123181 (= (+!3127 lt!453521 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427))) lt!453679)))

(declare-fun b!1029427 () Bool)

(declare-fun res!688604 () Bool)

(assert (=> b!1029427 (=> (not res!688604) (not e!581201))))

(assert (=> b!1029427 (= res!688604 (= (getValueByKey!588 (toList!6894 lt!453679) (_1!7834 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427))))))))

(declare-fun b!1029428 () Bool)

(assert (=> b!1029428 (= e!581201 (contains!5953 (toList!6894 lt!453679) (tuple2!15647 lt!453531 (minValue!5950 thiss!1427))))))

(assert (= (and d!123181 res!688605) b!1029427))

(assert (= (and b!1029427 res!688604) b!1029428))

(declare-fun m!948241 () Bool)

(assert (=> d!123181 m!948241))

(declare-fun m!948243 () Bool)

(assert (=> d!123181 m!948243))

(declare-fun m!948245 () Bool)

(assert (=> d!123181 m!948245))

(declare-fun m!948247 () Bool)

(assert (=> d!123181 m!948247))

(declare-fun m!948249 () Bool)

(assert (=> b!1029427 m!948249))

(declare-fun m!948251 () Bool)

(assert (=> b!1029428 m!948251))

(assert (=> b!1029190 d!123181))

(declare-fun d!123183 () Bool)

(assert (=> d!123183 (= (apply!896 (+!3127 lt!453527 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427))) lt!453529) (apply!896 lt!453527 lt!453529))))

(declare-fun lt!453681 () Unit!33495)

(assert (=> d!123183 (= lt!453681 (choose!1697 lt!453527 lt!453538 (zeroValue!5950 thiss!1427) lt!453529))))

(declare-fun e!581202 () Bool)

(assert (=> d!123183 e!581202))

(declare-fun res!688606 () Bool)

(assert (=> d!123183 (=> (not res!688606) (not e!581202))))

(assert (=> d!123183 (= res!688606 (contains!5951 lt!453527 lt!453529))))

(assert (=> d!123183 (= (addApplyDifferent!471 lt!453527 lt!453538 (zeroValue!5950 thiss!1427) lt!453529) lt!453681)))

(declare-fun b!1029429 () Bool)

(assert (=> b!1029429 (= e!581202 (not (= lt!453529 lt!453538)))))

(assert (= (and d!123183 res!688606) b!1029429))

(declare-fun m!948253 () Bool)

(assert (=> d!123183 m!948253))

(assert (=> d!123183 m!947887))

(assert (=> d!123183 m!947909))

(declare-fun m!948255 () Bool)

(assert (=> d!123183 m!948255))

(assert (=> d!123183 m!947887))

(assert (=> d!123183 m!947889))

(assert (=> b!1029190 d!123183))

(declare-fun d!123185 () Bool)

(assert (=> d!123185 (= (apply!896 (+!3127 lt!453527 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427))) lt!453529) (get!16352 (getValueByKey!588 (toList!6894 (+!3127 lt!453527 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427)))) lt!453529)))))

(declare-fun bs!30045 () Bool)

(assert (= bs!30045 d!123185))

(declare-fun m!948257 () Bool)

(assert (=> bs!30045 m!948257))

(assert (=> bs!30045 m!948257))

(declare-fun m!948259 () Bool)

(assert (=> bs!30045 m!948259))

(assert (=> b!1029190 d!123185))

(declare-fun d!123187 () Bool)

(declare-fun e!581203 () Bool)

(assert (=> d!123187 e!581203))

(declare-fun res!688608 () Bool)

(assert (=> d!123187 (=> (not res!688608) (not e!581203))))

(declare-fun lt!453684 () ListLongMap!13757)

(assert (=> d!123187 (= res!688608 (contains!5951 lt!453684 (_1!7834 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427)))))))

(declare-fun lt!453685 () List!21856)

(assert (=> d!123187 (= lt!453684 (ListLongMap!13758 lt!453685))))

(declare-fun lt!453682 () Unit!33495)

(declare-fun lt!453683 () Unit!33495)

(assert (=> d!123187 (= lt!453682 lt!453683)))

(assert (=> d!123187 (= (getValueByKey!588 lt!453685 (_1!7834 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123187 (= lt!453683 (lemmaContainsTupThenGetReturnValue!278 lt!453685 (_1!7834 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123187 (= lt!453685 (insertStrictlySorted!371 (toList!6894 lt!453527) (_1!7834 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123187 (= (+!3127 lt!453527 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427))) lt!453684)))

(declare-fun b!1029430 () Bool)

(declare-fun res!688607 () Bool)

(assert (=> b!1029430 (=> (not res!688607) (not e!581203))))

(assert (=> b!1029430 (= res!688607 (= (getValueByKey!588 (toList!6894 lt!453684) (_1!7834 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427))))))))

(declare-fun b!1029431 () Bool)

(assert (=> b!1029431 (= e!581203 (contains!5953 (toList!6894 lt!453684) (tuple2!15647 lt!453538 (zeroValue!5950 thiss!1427))))))

(assert (= (and d!123187 res!688608) b!1029430))

(assert (= (and b!1029430 res!688607) b!1029431))

(declare-fun m!948261 () Bool)

(assert (=> d!123187 m!948261))

(declare-fun m!948263 () Bool)

(assert (=> d!123187 m!948263))

(declare-fun m!948265 () Bool)

(assert (=> d!123187 m!948265))

(declare-fun m!948267 () Bool)

(assert (=> d!123187 m!948267))

(declare-fun m!948269 () Bool)

(assert (=> b!1029430 m!948269))

(declare-fun m!948271 () Bool)

(assert (=> b!1029431 m!948271))

(assert (=> b!1029190 d!123187))

(declare-fun d!123189 () Bool)

(assert (=> d!123189 (= (apply!896 (+!3127 lt!453536 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427))) lt!453539) (get!16352 (getValueByKey!588 (toList!6894 (+!3127 lt!453536 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427)))) lt!453539)))))

(declare-fun bs!30046 () Bool)

(assert (= bs!30046 d!123189))

(declare-fun m!948273 () Bool)

(assert (=> bs!30046 m!948273))

(assert (=> bs!30046 m!948273))

(declare-fun m!948275 () Bool)

(assert (=> bs!30046 m!948275))

(assert (=> b!1029190 d!123189))

(declare-fun d!123191 () Bool)

(assert (=> d!123191 (= (apply!896 (+!3127 lt!453521 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427))) lt!453532) (apply!896 lt!453521 lt!453532))))

(declare-fun lt!453686 () Unit!33495)

(assert (=> d!123191 (= lt!453686 (choose!1697 lt!453521 lt!453531 (minValue!5950 thiss!1427) lt!453532))))

(declare-fun e!581204 () Bool)

(assert (=> d!123191 e!581204))

(declare-fun res!688609 () Bool)

(assert (=> d!123191 (=> (not res!688609) (not e!581204))))

(assert (=> d!123191 (= res!688609 (contains!5951 lt!453521 lt!453532))))

(assert (=> d!123191 (= (addApplyDifferent!471 lt!453521 lt!453531 (minValue!5950 thiss!1427) lt!453532) lt!453686)))

(declare-fun b!1029432 () Bool)

(assert (=> b!1029432 (= e!581204 (not (= lt!453532 lt!453531)))))

(assert (= (and d!123191 res!688609) b!1029432))

(declare-fun m!948277 () Bool)

(assert (=> d!123191 m!948277))

(assert (=> d!123191 m!947891))

(assert (=> d!123191 m!947893))

(declare-fun m!948279 () Bool)

(assert (=> d!123191 m!948279))

(assert (=> d!123191 m!947891))

(assert (=> d!123191 m!947899))

(assert (=> b!1029190 d!123191))

(declare-fun d!123193 () Bool)

(assert (=> d!123193 (contains!5951 (+!3127 lt!453530 (tuple2!15647 lt!453523 (zeroValue!5950 thiss!1427))) lt!453534)))

(declare-fun lt!453687 () Unit!33495)

(assert (=> d!123193 (= lt!453687 (choose!1698 lt!453530 lt!453523 (zeroValue!5950 thiss!1427) lt!453534))))

(assert (=> d!123193 (contains!5951 lt!453530 lt!453534)))

(assert (=> d!123193 (= (addStillContains!615 lt!453530 lt!453523 (zeroValue!5950 thiss!1427) lt!453534) lt!453687)))

(declare-fun bs!30047 () Bool)

(assert (= bs!30047 d!123193))

(assert (=> bs!30047 m!947895))

(assert (=> bs!30047 m!947895))

(assert (=> bs!30047 m!947903))

(declare-fun m!948281 () Bool)

(assert (=> bs!30047 m!948281))

(declare-fun m!948283 () Bool)

(assert (=> bs!30047 m!948283))

(assert (=> b!1029190 d!123193))

(declare-fun d!123195 () Bool)

(assert (=> d!123195 (= (apply!896 lt!453527 lt!453529) (get!16352 (getValueByKey!588 (toList!6894 lt!453527) lt!453529)))))

(declare-fun bs!30048 () Bool)

(assert (= bs!30048 d!123195))

(declare-fun m!948285 () Bool)

(assert (=> bs!30048 m!948285))

(assert (=> bs!30048 m!948285))

(declare-fun m!948287 () Bool)

(assert (=> bs!30048 m!948287))

(assert (=> b!1029190 d!123195))

(declare-fun d!123197 () Bool)

(assert (=> d!123197 (= (apply!896 lt!453521 lt!453532) (get!16352 (getValueByKey!588 (toList!6894 lt!453521) lt!453532)))))

(declare-fun bs!30049 () Bool)

(assert (= bs!30049 d!123197))

(declare-fun m!948289 () Bool)

(assert (=> bs!30049 m!948289))

(assert (=> bs!30049 m!948289))

(declare-fun m!948291 () Bool)

(assert (=> bs!30049 m!948291))

(assert (=> b!1029190 d!123197))

(declare-fun d!123199 () Bool)

(assert (=> d!123199 (= (apply!896 (+!3127 lt!453521 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427))) lt!453532) (get!16352 (getValueByKey!588 (toList!6894 (+!3127 lt!453521 (tuple2!15647 lt!453531 (minValue!5950 thiss!1427)))) lt!453532)))))

(declare-fun bs!30050 () Bool)

(assert (= bs!30050 d!123199))

(declare-fun m!948293 () Bool)

(assert (=> bs!30050 m!948293))

(assert (=> bs!30050 m!948293))

(declare-fun m!948295 () Bool)

(assert (=> bs!30050 m!948295))

(assert (=> b!1029190 d!123199))

(declare-fun b!1029433 () Bool)

(declare-fun res!688613 () Bool)

(declare-fun e!581211 () Bool)

(assert (=> b!1029433 (=> (not res!688613) (not e!581211))))

(declare-fun lt!453692 () ListLongMap!13757)

(assert (=> b!1029433 (= res!688613 (not (contains!5951 lt!453692 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123201 () Bool)

(assert (=> d!123201 e!581211))

(declare-fun res!688611 () Bool)

(assert (=> d!123201 (=> (not res!688611) (not e!581211))))

(assert (=> d!123201 (= res!688611 (not (contains!5951 lt!453692 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!581206 () ListLongMap!13757)

(assert (=> d!123201 (= lt!453692 e!581206)))

(declare-fun c!103987 () Bool)

(assert (=> d!123201 (= c!103987 (bvsge #b00000000000000000000000000000000 (size!31633 lt!453355)))))

(assert (=> d!123201 (validMask!0 (mask!29861 thiss!1427))))

(assert (=> d!123201 (= (getCurrentListMapNoExtraKeys!3562 lt!453355 lt!453350 (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) lt!453692)))

(declare-fun b!1029434 () Bool)

(assert (=> b!1029434 (= e!581206 (ListLongMap!13758 Nil!21853))))

(declare-fun b!1029435 () Bool)

(declare-fun e!581209 () ListLongMap!13757)

(assert (=> b!1029435 (= e!581206 e!581209)))

(declare-fun c!103986 () Bool)

(assert (=> b!1029435 (= c!103986 (validKeyInArray!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun b!1029436 () Bool)

(declare-fun e!581205 () Bool)

(declare-fun e!581208 () Bool)

(assert (=> b!1029436 (= e!581205 e!581208)))

(declare-fun c!103988 () Bool)

(assert (=> b!1029436 (= c!103988 (bvslt #b00000000000000000000000000000000 (size!31633 lt!453355)))))

(declare-fun b!1029437 () Bool)

(declare-fun lt!453688 () Unit!33495)

(declare-fun lt!453689 () Unit!33495)

(assert (=> b!1029437 (= lt!453688 lt!453689)))

(declare-fun lt!453694 () (_ BitVec 64))

(declare-fun lt!453693 () V!37291)

(declare-fun lt!453690 () ListLongMap!13757)

(declare-fun lt!453691 () (_ BitVec 64))

(assert (=> b!1029437 (not (contains!5951 (+!3127 lt!453690 (tuple2!15647 lt!453691 lt!453693)) lt!453694))))

(assert (=> b!1029437 (= lt!453689 (addStillNotContains!241 lt!453690 lt!453691 lt!453693 lt!453694))))

(assert (=> b!1029437 (= lt!453694 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1029437 (= lt!453693 (get!16351 (select (arr!31117 lt!453350) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1029437 (= lt!453691 (select (arr!31116 lt!453355) #b00000000000000000000000000000000))))

(declare-fun call!43458 () ListLongMap!13757)

(assert (=> b!1029437 (= lt!453690 call!43458)))

(assert (=> b!1029437 (= e!581209 (+!3127 call!43458 (tuple2!15647 (select (arr!31116 lt!453355) #b00000000000000000000000000000000) (get!16351 (select (arr!31117 lt!453350) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1029438 () Bool)

(assert (=> b!1029438 (= e!581209 call!43458)))

(declare-fun b!1029439 () Bool)

(assert (=> b!1029439 (= e!581211 e!581205)))

(declare-fun c!103985 () Bool)

(declare-fun e!581210 () Bool)

(assert (=> b!1029439 (= c!103985 e!581210)))

(declare-fun res!688612 () Bool)

(assert (=> b!1029439 (=> (not res!688612) (not e!581210))))

(assert (=> b!1029439 (= res!688612 (bvslt #b00000000000000000000000000000000 (size!31633 lt!453355)))))

(declare-fun bm!43455 () Bool)

(assert (=> bm!43455 (= call!43458 (getCurrentListMapNoExtraKeys!3562 lt!453355 lt!453350 (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6114 thiss!1427)))))

(declare-fun b!1029440 () Bool)

(assert (=> b!1029440 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 lt!453355)))))

(assert (=> b!1029440 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31634 lt!453350)))))

(declare-fun e!581207 () Bool)

(assert (=> b!1029440 (= e!581207 (= (apply!896 lt!453692 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)) (get!16351 (select (arr!31117 lt!453350) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1029441 () Bool)

(assert (=> b!1029441 (= e!581208 (= lt!453692 (getCurrentListMapNoExtraKeys!3562 lt!453355 lt!453350 (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6114 thiss!1427))))))

(declare-fun b!1029442 () Bool)

(assert (=> b!1029442 (= e!581205 e!581207)))

(assert (=> b!1029442 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 lt!453355)))))

(declare-fun res!688610 () Bool)

(assert (=> b!1029442 (= res!688610 (contains!5951 lt!453692 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(assert (=> b!1029442 (=> (not res!688610) (not e!581207))))

(declare-fun b!1029443 () Bool)

(assert (=> b!1029443 (= e!581208 (isEmpty!929 lt!453692))))

(declare-fun b!1029444 () Bool)

(assert (=> b!1029444 (= e!581210 (validKeyInArray!0 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(assert (=> b!1029444 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!123201 c!103987) b!1029434))

(assert (= (and d!123201 (not c!103987)) b!1029435))

(assert (= (and b!1029435 c!103986) b!1029437))

(assert (= (and b!1029435 (not c!103986)) b!1029438))

(assert (= (or b!1029437 b!1029438) bm!43455))

(assert (= (and d!123201 res!688611) b!1029433))

(assert (= (and b!1029433 res!688613) b!1029439))

(assert (= (and b!1029439 res!688612) b!1029444))

(assert (= (and b!1029439 c!103985) b!1029442))

(assert (= (and b!1029439 (not c!103985)) b!1029436))

(assert (= (and b!1029442 res!688610) b!1029440))

(assert (= (and b!1029436 c!103988) b!1029441))

(assert (= (and b!1029436 (not c!103988)) b!1029443))

(declare-fun b_lambda!15849 () Bool)

(assert (=> (not b_lambda!15849) (not b!1029437)))

(assert (=> b!1029437 t!30934))

(declare-fun b_and!32907 () Bool)

(assert (= b_and!32905 (and (=> t!30934 result!14137) b_and!32907)))

(declare-fun b_lambda!15851 () Bool)

(assert (=> (not b_lambda!15851) (not b!1029440)))

(assert (=> b!1029440 t!30934))

(declare-fun b_and!32909 () Bool)

(assert (= b_and!32907 (and (=> t!30934 result!14137) b_and!32909)))

(assert (=> b!1029437 m!947841))

(declare-fun m!948297 () Bool)

(assert (=> b!1029437 m!948297))

(assert (=> b!1029437 m!947917))

(assert (=> b!1029437 m!947917))

(assert (=> b!1029437 m!947653))

(assert (=> b!1029437 m!947919))

(declare-fun m!948299 () Bool)

(assert (=> b!1029437 m!948299))

(declare-fun m!948301 () Bool)

(assert (=> b!1029437 m!948301))

(declare-fun m!948303 () Bool)

(assert (=> b!1029437 m!948303))

(assert (=> b!1029437 m!948299))

(assert (=> b!1029437 m!947653))

(assert (=> b!1029442 m!947841))

(assert (=> b!1029442 m!947841))

(declare-fun m!948305 () Bool)

(assert (=> b!1029442 m!948305))

(assert (=> b!1029440 m!947841))

(assert (=> b!1029440 m!947841))

(declare-fun m!948307 () Bool)

(assert (=> b!1029440 m!948307))

(assert (=> b!1029440 m!947917))

(assert (=> b!1029440 m!947917))

(assert (=> b!1029440 m!947653))

(assert (=> b!1029440 m!947919))

(assert (=> b!1029440 m!947653))

(declare-fun m!948309 () Bool)

(assert (=> b!1029443 m!948309))

(declare-fun m!948311 () Bool)

(assert (=> b!1029441 m!948311))

(assert (=> bm!43455 m!948311))

(declare-fun m!948313 () Bool)

(assert (=> d!123201 m!948313))

(assert (=> d!123201 m!947765))

(assert (=> b!1029444 m!947841))

(assert (=> b!1029444 m!947841))

(assert (=> b!1029444 m!947843))

(assert (=> b!1029435 m!947841))

(assert (=> b!1029435 m!947841))

(assert (=> b!1029435 m!947843))

(declare-fun m!948315 () Bool)

(assert (=> b!1029433 m!948315))

(assert (=> b!1029190 d!123201))

(declare-fun d!123203 () Bool)

(declare-fun e!581212 () Bool)

(assert (=> d!123203 e!581212))

(declare-fun res!688615 () Bool)

(assert (=> d!123203 (=> (not res!688615) (not e!581212))))

(declare-fun lt!453697 () ListLongMap!13757)

(assert (=> d!123203 (= res!688615 (contains!5951 lt!453697 (_1!7834 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427)))))))

(declare-fun lt!453698 () List!21856)

(assert (=> d!123203 (= lt!453697 (ListLongMap!13758 lt!453698))))

(declare-fun lt!453695 () Unit!33495)

(declare-fun lt!453696 () Unit!33495)

(assert (=> d!123203 (= lt!453695 lt!453696)))

(assert (=> d!123203 (= (getValueByKey!588 lt!453698 (_1!7834 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427)))))))

(assert (=> d!123203 (= lt!453696 (lemmaContainsTupThenGetReturnValue!278 lt!453698 (_1!7834 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427)))))))

(assert (=> d!123203 (= lt!453698 (insertStrictlySorted!371 (toList!6894 lt!453536) (_1!7834 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427)))))))

(assert (=> d!123203 (= (+!3127 lt!453536 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427))) lt!453697)))

(declare-fun b!1029445 () Bool)

(declare-fun res!688614 () Bool)

(assert (=> b!1029445 (=> (not res!688614) (not e!581212))))

(assert (=> b!1029445 (= res!688614 (= (getValueByKey!588 (toList!6894 lt!453697) (_1!7834 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 lt!453526 (minValue!5950 thiss!1427))))))))

(declare-fun b!1029446 () Bool)

(assert (=> b!1029446 (= e!581212 (contains!5953 (toList!6894 lt!453697) (tuple2!15647 lt!453526 (minValue!5950 thiss!1427))))))

(assert (= (and d!123203 res!688615) b!1029445))

(assert (= (and b!1029445 res!688614) b!1029446))

(declare-fun m!948317 () Bool)

(assert (=> d!123203 m!948317))

(declare-fun m!948319 () Bool)

(assert (=> d!123203 m!948319))

(declare-fun m!948321 () Bool)

(assert (=> d!123203 m!948321))

(declare-fun m!948323 () Bool)

(assert (=> d!123203 m!948323))

(declare-fun m!948325 () Bool)

(assert (=> b!1029445 m!948325))

(declare-fun m!948327 () Bool)

(assert (=> b!1029446 m!948327))

(assert (=> b!1029190 d!123203))

(declare-fun d!123205 () Bool)

(declare-fun e!581213 () Bool)

(assert (=> d!123205 e!581213))

(declare-fun res!688616 () Bool)

(assert (=> d!123205 (=> res!688616 e!581213)))

(declare-fun lt!453700 () Bool)

(assert (=> d!123205 (= res!688616 (not lt!453700))))

(declare-fun lt!453701 () Bool)

(assert (=> d!123205 (= lt!453700 lt!453701)))

(declare-fun lt!453699 () Unit!33495)

(declare-fun e!581214 () Unit!33495)

(assert (=> d!123205 (= lt!453699 e!581214)))

(declare-fun c!103989 () Bool)

(assert (=> d!123205 (= c!103989 lt!453701)))

(assert (=> d!123205 (= lt!453701 (containsKey!561 (toList!6894 lt!453533) (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(assert (=> d!123205 (= (contains!5951 lt!453533 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)) lt!453700)))

(declare-fun b!1029447 () Bool)

(declare-fun lt!453702 () Unit!33495)

(assert (=> b!1029447 (= e!581214 lt!453702)))

(assert (=> b!1029447 (= lt!453702 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6894 lt!453533) (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(assert (=> b!1029447 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453533) (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun b!1029448 () Bool)

(declare-fun Unit!33511 () Unit!33495)

(assert (=> b!1029448 (= e!581214 Unit!33511)))

(declare-fun b!1029449 () Bool)

(assert (=> b!1029449 (= e!581213 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453533) (select (arr!31116 lt!453355) #b00000000000000000000000000000000))))))

(assert (= (and d!123205 c!103989) b!1029447))

(assert (= (and d!123205 (not c!103989)) b!1029448))

(assert (= (and d!123205 (not res!688616)) b!1029449))

(assert (=> d!123205 m!947841))

(declare-fun m!948329 () Bool)

(assert (=> d!123205 m!948329))

(assert (=> b!1029447 m!947841))

(declare-fun m!948331 () Bool)

(assert (=> b!1029447 m!948331))

(assert (=> b!1029447 m!947841))

(assert (=> b!1029447 m!948143))

(assert (=> b!1029447 m!948143))

(declare-fun m!948333 () Bool)

(assert (=> b!1029447 m!948333))

(assert (=> b!1029449 m!947841))

(assert (=> b!1029449 m!948143))

(assert (=> b!1029449 m!948143))

(assert (=> b!1029449 m!948333))

(assert (=> b!1029205 d!123205))

(declare-fun d!123207 () Bool)

(declare-fun e!581215 () Bool)

(assert (=> d!123207 e!581215))

(declare-fun res!688617 () Bool)

(assert (=> d!123207 (=> res!688617 e!581215)))

(declare-fun lt!453704 () Bool)

(assert (=> d!123207 (= res!688617 (not lt!453704))))

(declare-fun lt!453705 () Bool)

(assert (=> d!123207 (= lt!453704 lt!453705)))

(declare-fun lt!453703 () Unit!33495)

(declare-fun e!581216 () Unit!33495)

(assert (=> d!123207 (= lt!453703 e!581216)))

(declare-fun c!103990 () Bool)

(assert (=> d!123207 (= c!103990 lt!453705)))

(assert (=> d!123207 (= lt!453705 (containsKey!561 (toList!6894 lt!453484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123207 (= (contains!5951 lt!453484 #b0000000000000000000000000000000000000000000000000000000000000000) lt!453704)))

(declare-fun b!1029450 () Bool)

(declare-fun lt!453706 () Unit!33495)

(assert (=> b!1029450 (= e!581216 lt!453706)))

(assert (=> b!1029450 (= lt!453706 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6894 lt!453484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029450 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029451 () Bool)

(declare-fun Unit!33512 () Unit!33495)

(assert (=> b!1029451 (= e!581216 Unit!33512)))

(declare-fun b!1029452 () Bool)

(assert (=> b!1029452 (= e!581215 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453484) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123207 c!103990) b!1029450))

(assert (= (and d!123207 (not c!103990)) b!1029451))

(assert (= (and d!123207 (not res!688617)) b!1029452))

(declare-fun m!948335 () Bool)

(assert (=> d!123207 m!948335))

(declare-fun m!948337 () Bool)

(assert (=> b!1029450 m!948337))

(assert (=> b!1029450 m!948101))

(assert (=> b!1029450 m!948101))

(declare-fun m!948339 () Bool)

(assert (=> b!1029450 m!948339))

(assert (=> b!1029452 m!948101))

(assert (=> b!1029452 m!948101))

(assert (=> b!1029452 m!948339))

(assert (=> bm!43429 d!123207))

(assert (=> bm!43423 d!123109))

(assert (=> b!1029224 d!123123))

(declare-fun d!123209 () Bool)

(declare-fun e!581217 () Bool)

(assert (=> d!123209 e!581217))

(declare-fun res!688618 () Bool)

(assert (=> d!123209 (=> res!688618 e!581217)))

(declare-fun lt!453708 () Bool)

(assert (=> d!123209 (= res!688618 (not lt!453708))))

(declare-fun lt!453709 () Bool)

(assert (=> d!123209 (= lt!453708 lt!453709)))

(declare-fun lt!453707 () Unit!33495)

(declare-fun e!581218 () Unit!33495)

(assert (=> d!123209 (= lt!453707 e!581218)))

(declare-fun c!103991 () Bool)

(assert (=> d!123209 (= c!103991 lt!453709)))

(assert (=> d!123209 (= lt!453709 (containsKey!561 (toList!6894 lt!453533) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123209 (= (contains!5951 lt!453533 #b0000000000000000000000000000000000000000000000000000000000000000) lt!453708)))

(declare-fun b!1029453 () Bool)

(declare-fun lt!453710 () Unit!33495)

(assert (=> b!1029453 (= e!581218 lt!453710)))

(assert (=> b!1029453 (= lt!453710 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6894 lt!453533) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029453 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453533) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029454 () Bool)

(declare-fun Unit!33513 () Unit!33495)

(assert (=> b!1029454 (= e!581218 Unit!33513)))

(declare-fun b!1029455 () Bool)

(assert (=> b!1029455 (= e!581217 (isDefined!436 (getValueByKey!588 (toList!6894 lt!453533) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123209 c!103991) b!1029453))

(assert (= (and d!123209 (not c!103991)) b!1029454))

(assert (= (and d!123209 (not res!688618)) b!1029455))

(declare-fun m!948341 () Bool)

(assert (=> d!123209 m!948341))

(declare-fun m!948343 () Bool)

(assert (=> b!1029453 m!948343))

(assert (=> b!1029453 m!948105))

(assert (=> b!1029453 m!948105))

(declare-fun m!948345 () Bool)

(assert (=> b!1029453 m!948345))

(assert (=> b!1029455 m!948105))

(assert (=> b!1029455 m!948105))

(assert (=> b!1029455 m!948345))

(assert (=> bm!43442 d!123209))

(assert (=> bm!43436 d!123201))

(declare-fun d!123211 () Bool)

(assert (=> d!123211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (mask!29861 thiss!1427))))

(assert (=> d!123211 true))

(declare-fun _$44!15 () Unit!33495)

(assert (=> d!123211 (= (choose!25 (_keys!11271 thiss!1427) (index!41060 lt!453354) (mask!29861 thiss!1427)) _$44!15)))

(declare-fun bs!30051 () Bool)

(assert (= bs!30051 d!123211))

(assert (=> bs!30051 m!947633))

(assert (=> bs!30051 m!947839))

(assert (=> d!123053 d!123211))

(assert (=> d!123053 d!123115))

(declare-fun b!1029456 () Bool)

(declare-fun e!581221 () Bool)

(declare-fun e!581219 () Bool)

(assert (=> b!1029456 (= e!581221 e!581219)))

(declare-fun c!103992 () Bool)

(assert (=> b!1029456 (= c!103992 (validKeyInArray!0 (select (arr!31116 lt!453355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029457 () Bool)

(declare-fun e!581222 () Bool)

(assert (=> b!1029457 (= e!581222 (contains!5952 (ite c!103930 (Cons!21853 (select (arr!31116 lt!453355) #b00000000000000000000000000000000) Nil!21854) Nil!21854) (select (arr!31116 lt!453355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029458 () Bool)

(declare-fun call!43459 () Bool)

(assert (=> b!1029458 (= e!581219 call!43459)))

(declare-fun d!123213 () Bool)

(declare-fun res!688621 () Bool)

(declare-fun e!581220 () Bool)

(assert (=> d!123213 (=> res!688621 e!581220)))

(assert (=> d!123213 (= res!688621 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 lt!453355)))))

(assert (=> d!123213 (= (arrayNoDuplicates!0 lt!453355 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103930 (Cons!21853 (select (arr!31116 lt!453355) #b00000000000000000000000000000000) Nil!21854) Nil!21854)) e!581220)))

(declare-fun bm!43456 () Bool)

(assert (=> bm!43456 (= call!43459 (arrayNoDuplicates!0 lt!453355 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!103992 (Cons!21853 (select (arr!31116 lt!453355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!103930 (Cons!21853 (select (arr!31116 lt!453355) #b00000000000000000000000000000000) Nil!21854) Nil!21854)) (ite c!103930 (Cons!21853 (select (arr!31116 lt!453355) #b00000000000000000000000000000000) Nil!21854) Nil!21854))))))

(declare-fun b!1029459 () Bool)

(assert (=> b!1029459 (= e!581219 call!43459)))

(declare-fun b!1029460 () Bool)

(assert (=> b!1029460 (= e!581220 e!581221)))

(declare-fun res!688619 () Bool)

(assert (=> b!1029460 (=> (not res!688619) (not e!581221))))

(assert (=> b!1029460 (= res!688619 (not e!581222))))

(declare-fun res!688620 () Bool)

(assert (=> b!1029460 (=> (not res!688620) (not e!581222))))

(assert (=> b!1029460 (= res!688620 (validKeyInArray!0 (select (arr!31116 lt!453355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!123213 (not res!688621)) b!1029460))

(assert (= (and b!1029460 res!688620) b!1029457))

(assert (= (and b!1029460 res!688619) b!1029456))

(assert (= (and b!1029456 c!103992) b!1029459))

(assert (= (and b!1029456 (not c!103992)) b!1029458))

(assert (= (or b!1029459 b!1029458) bm!43456))

(assert (=> b!1029456 m!948069))

(assert (=> b!1029456 m!948069))

(assert (=> b!1029456 m!948071))

(assert (=> b!1029457 m!948069))

(assert (=> b!1029457 m!948069))

(declare-fun m!948347 () Bool)

(assert (=> b!1029457 m!948347))

(assert (=> bm!43456 m!948069))

(declare-fun m!948349 () Bool)

(assert (=> bm!43456 m!948349))

(assert (=> b!1029460 m!948069))

(assert (=> b!1029460 m!948069))

(assert (=> b!1029460 m!948071))

(assert (=> bm!43446 d!123213))

(declare-fun d!123215 () Bool)

(declare-fun lt!453713 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!510 (List!21857) (InoxSet (_ BitVec 64)))

(assert (=> d!123215 (= lt!453713 (select (content!510 Nil!21854) (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun e!581227 () Bool)

(assert (=> d!123215 (= lt!453713 e!581227)))

(declare-fun res!688627 () Bool)

(assert (=> d!123215 (=> (not res!688627) (not e!581227))))

(assert (=> d!123215 (= res!688627 ((_ is Cons!21853) Nil!21854))))

(assert (=> d!123215 (= (contains!5952 Nil!21854 (select (arr!31116 lt!453355) #b00000000000000000000000000000000)) lt!453713)))

(declare-fun b!1029465 () Bool)

(declare-fun e!581228 () Bool)

(assert (=> b!1029465 (= e!581227 e!581228)))

(declare-fun res!688626 () Bool)

(assert (=> b!1029465 (=> res!688626 e!581228)))

(assert (=> b!1029465 (= res!688626 (= (h!23053 Nil!21854) (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(declare-fun b!1029466 () Bool)

(assert (=> b!1029466 (= e!581228 (contains!5952 (t!30936 Nil!21854) (select (arr!31116 lt!453355) #b00000000000000000000000000000000)))))

(assert (= (and d!123215 res!688627) b!1029465))

(assert (= (and b!1029465 (not res!688626)) b!1029466))

(declare-fun m!948351 () Bool)

(assert (=> d!123215 m!948351))

(assert (=> d!123215 m!947841))

(declare-fun m!948353 () Bool)

(assert (=> d!123215 m!948353))

(assert (=> b!1029466 m!947841))

(declare-fun m!948355 () Bool)

(assert (=> b!1029466 m!948355))

(assert (=> b!1029221 d!123215))

(declare-fun d!123217 () Bool)

(assert (=> d!123217 (= (apply!896 lt!453484 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)) (get!16352 (getValueByKey!588 (toList!6894 lt!453484) (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30052 () Bool)

(assert (= bs!30052 d!123217))

(assert (=> bs!30052 m!947781))

(assert (=> bs!30052 m!948085))

(assert (=> bs!30052 m!948085))

(declare-fun m!948357 () Bool)

(assert (=> bs!30052 m!948357))

(assert (=> b!1029123 d!123217))

(declare-fun d!123219 () Bool)

(declare-fun c!103993 () Bool)

(assert (=> d!123219 (= c!103993 ((_ is ValueCellFull!11453) (select (arr!31117 (_values!6137 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!581229 () V!37291)

(assert (=> d!123219 (= (get!16351 (select (arr!31117 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581229)))

(declare-fun b!1029467 () Bool)

(assert (=> b!1029467 (= e!581229 (get!16353 (select (arr!31117 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029468 () Bool)

(assert (=> b!1029468 (= e!581229 (get!16354 (select (arr!31117 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123219 c!103993) b!1029467))

(assert (= (and d!123219 (not c!103993)) b!1029468))

(assert (=> b!1029467 m!947823))

(assert (=> b!1029467 m!947653))

(declare-fun m!948359 () Bool)

(assert (=> b!1029467 m!948359))

(assert (=> b!1029468 m!947823))

(assert (=> b!1029468 m!947653))

(declare-fun m!948361 () Bool)

(assert (=> b!1029468 m!948361))

(assert (=> b!1029123 d!123219))

(declare-fun b!1029469 () Bool)

(declare-fun e!581230 () Bool)

(declare-fun call!43460 () Bool)

(assert (=> b!1029469 (= e!581230 call!43460)))

(declare-fun b!1029470 () Bool)

(declare-fun e!581232 () Bool)

(assert (=> b!1029470 (= e!581232 call!43460)))

(declare-fun b!1029471 () Bool)

(declare-fun e!581231 () Bool)

(assert (=> b!1029471 (= e!581231 e!581232)))

(declare-fun c!103994 () Bool)

(assert (=> b!1029471 (= c!103994 (validKeyInArray!0 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!123221 () Bool)

(declare-fun res!688628 () Bool)

(assert (=> d!123221 (=> res!688628 e!581231)))

(assert (=> d!123221 (= res!688628 (bvsge #b00000000000000000000000000000000 (size!31633 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))))))))

(assert (=> d!123221 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (mask!29861 thiss!1427)) e!581231)))

(declare-fun b!1029472 () Bool)

(assert (=> b!1029472 (= e!581232 e!581230)))

(declare-fun lt!453715 () (_ BitVec 64))

(assert (=> b!1029472 (= lt!453715 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453714 () Unit!33495)

(assert (=> b!1029472 (= lt!453714 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) lt!453715 #b00000000000000000000000000000000))))

(assert (=> b!1029472 (arrayContainsKey!0 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) lt!453715 #b00000000000000000000000000000000)))

(declare-fun lt!453716 () Unit!33495)

(assert (=> b!1029472 (= lt!453716 lt!453714)))

(declare-fun res!688629 () Bool)

(assert (=> b!1029472 (= res!688629 (= (seekEntryOrOpen!0 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000) (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (mask!29861 thiss!1427)) (Found!9672 #b00000000000000000000000000000000)))))

(assert (=> b!1029472 (=> (not res!688629) (not e!581230))))

(declare-fun bm!43457 () Bool)

(assert (=> bm!43457 (= call!43460 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (mask!29861 thiss!1427)))))

(assert (= (and d!123221 (not res!688628)) b!1029471))

(assert (= (and b!1029471 c!103994) b!1029472))

(assert (= (and b!1029471 (not c!103994)) b!1029470))

(assert (= (and b!1029472 res!688629) b!1029469))

(assert (= (or b!1029469 b!1029470) bm!43457))

(assert (=> b!1029471 m!948121))

(assert (=> b!1029471 m!948121))

(assert (=> b!1029471 m!948123))

(assert (=> b!1029472 m!948121))

(declare-fun m!948363 () Bool)

(assert (=> b!1029472 m!948363))

(declare-fun m!948365 () Bool)

(assert (=> b!1029472 m!948365))

(assert (=> b!1029472 m!948121))

(declare-fun m!948367 () Bool)

(assert (=> b!1029472 m!948367))

(declare-fun m!948369 () Bool)

(assert (=> bm!43457 m!948369))

(assert (=> b!1029136 d!123221))

(declare-fun d!123223 () Bool)

(declare-fun lt!453717 () (_ BitVec 32))

(assert (=> d!123223 (and (bvsge lt!453717 #b00000000000000000000000000000000) (bvsle lt!453717 (bvsub (size!31633 lt!453355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!581234 () (_ BitVec 32))

(assert (=> d!123223 (= lt!453717 e!581234)))

(declare-fun c!103996 () Bool)

(assert (=> d!123223 (= c!103996 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> d!123223 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 (_keys!11271 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31633 (_keys!11271 thiss!1427)) (size!31633 lt!453355)))))

(assert (=> d!123223 (= (arrayCountValidKeys!0 lt!453355 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31633 (_keys!11271 thiss!1427))) lt!453717)))

(declare-fun b!1029473 () Bool)

(declare-fun e!581233 () (_ BitVec 32))

(declare-fun call!43461 () (_ BitVec 32))

(assert (=> b!1029473 (= e!581233 (bvadd #b00000000000000000000000000000001 call!43461))))

(declare-fun b!1029474 () Bool)

(assert (=> b!1029474 (= e!581234 e!581233)))

(declare-fun c!103995 () Bool)

(assert (=> b!1029474 (= c!103995 (validKeyInArray!0 (select (arr!31116 lt!453355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029475 () Bool)

(assert (=> b!1029475 (= e!581234 #b00000000000000000000000000000000)))

(declare-fun bm!43458 () Bool)

(assert (=> bm!43458 (= call!43461 (arrayCountValidKeys!0 lt!453355 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31633 (_keys!11271 thiss!1427))))))

(declare-fun b!1029476 () Bool)

(assert (=> b!1029476 (= e!581233 call!43461)))

(assert (= (and d!123223 c!103996) b!1029475))

(assert (= (and d!123223 (not c!103996)) b!1029474))

(assert (= (and b!1029474 c!103995) b!1029473))

(assert (= (and b!1029474 (not c!103995)) b!1029476))

(assert (= (or b!1029473 b!1029476) bm!43458))

(assert (=> b!1029474 m!948069))

(assert (=> b!1029474 m!948069))

(assert (=> b!1029474 m!948071))

(declare-fun m!948371 () Bool)

(assert (=> bm!43458 m!948371))

(assert (=> bm!43435 d!123223))

(declare-fun d!123225 () Bool)

(assert (=> d!123225 (= (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354))) (and (not (= (select (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029172 d!123225))

(assert (=> b!1029184 d!123051))

(assert (=> b!1029184 d!123049))

(declare-fun b!1029477 () Bool)

(declare-fun e!581237 () Bool)

(declare-fun e!581236 () Bool)

(assert (=> b!1029477 (= e!581237 e!581236)))

(declare-fun c!104002 () Bool)

(assert (=> b!1029477 (= c!104002 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43459 () Bool)

(declare-fun call!43468 () ListLongMap!13757)

(assert (=> bm!43459 (= call!43468 (getCurrentListMapNoExtraKeys!3562 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (array!64626 (store (arr!31117 (_values!6137 thiss!1427)) (index!41060 lt!453354) (ValueCellFull!11453 (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31634 (_values!6137 thiss!1427))) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun b!1029478 () Bool)

(declare-fun e!581245 () Bool)

(declare-fun lt!453731 () ListLongMap!13757)

(assert (=> b!1029478 (= e!581245 (= (apply!896 lt!453731 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5950 thiss!1427)))))

(declare-fun b!1029479 () Bool)

(declare-fun e!581241 () ListLongMap!13757)

(declare-fun call!43466 () ListLongMap!13757)

(assert (=> b!1029479 (= e!581241 call!43466)))

(declare-fun b!1029480 () Bool)

(declare-fun e!581247 () Bool)

(assert (=> b!1029480 (= e!581247 (validKeyInArray!0 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029481 () Bool)

(declare-fun e!581244 () ListLongMap!13757)

(declare-fun call!43462 () ListLongMap!13757)

(assert (=> b!1029481 (= e!581244 call!43462)))

(declare-fun b!1029482 () Bool)

(declare-fun e!581246 () Unit!33495)

(declare-fun lt!453733 () Unit!33495)

(assert (=> b!1029482 (= e!581246 lt!453733)))

(declare-fun lt!453728 () ListLongMap!13757)

(assert (=> b!1029482 (= lt!453728 (getCurrentListMapNoExtraKeys!3562 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (array!64626 (store (arr!31117 (_values!6137 thiss!1427)) (index!41060 lt!453354) (ValueCellFull!11453 (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31634 (_values!6137 thiss!1427))) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453721 () (_ BitVec 64))

(assert (=> b!1029482 (= lt!453721 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453732 () (_ BitVec 64))

(assert (=> b!1029482 (= lt!453732 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453720 () Unit!33495)

(assert (=> b!1029482 (= lt!453720 (addStillContains!615 lt!453728 lt!453721 (zeroValue!5950 thiss!1427) lt!453732))))

(assert (=> b!1029482 (contains!5951 (+!3127 lt!453728 (tuple2!15647 lt!453721 (zeroValue!5950 thiss!1427))) lt!453732)))

(declare-fun lt!453726 () Unit!33495)

(assert (=> b!1029482 (= lt!453726 lt!453720)))

(declare-fun lt!453719 () ListLongMap!13757)

(assert (=> b!1029482 (= lt!453719 (getCurrentListMapNoExtraKeys!3562 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (array!64626 (store (arr!31117 (_values!6137 thiss!1427)) (index!41060 lt!453354) (ValueCellFull!11453 (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31634 (_values!6137 thiss!1427))) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453729 () (_ BitVec 64))

(assert (=> b!1029482 (= lt!453729 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453730 () (_ BitVec 64))

(assert (=> b!1029482 (= lt!453730 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453735 () Unit!33495)

(assert (=> b!1029482 (= lt!453735 (addApplyDifferent!471 lt!453719 lt!453729 (minValue!5950 thiss!1427) lt!453730))))

(assert (=> b!1029482 (= (apply!896 (+!3127 lt!453719 (tuple2!15647 lt!453729 (minValue!5950 thiss!1427))) lt!453730) (apply!896 lt!453719 lt!453730))))

(declare-fun lt!453718 () Unit!33495)

(assert (=> b!1029482 (= lt!453718 lt!453735)))

(declare-fun lt!453725 () ListLongMap!13757)

(assert (=> b!1029482 (= lt!453725 (getCurrentListMapNoExtraKeys!3562 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (array!64626 (store (arr!31117 (_values!6137 thiss!1427)) (index!41060 lt!453354) (ValueCellFull!11453 (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31634 (_values!6137 thiss!1427))) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453736 () (_ BitVec 64))

(assert (=> b!1029482 (= lt!453736 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453727 () (_ BitVec 64))

(assert (=> b!1029482 (= lt!453727 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453738 () Unit!33495)

(assert (=> b!1029482 (= lt!453738 (addApplyDifferent!471 lt!453725 lt!453736 (zeroValue!5950 thiss!1427) lt!453727))))

(assert (=> b!1029482 (= (apply!896 (+!3127 lt!453725 (tuple2!15647 lt!453736 (zeroValue!5950 thiss!1427))) lt!453727) (apply!896 lt!453725 lt!453727))))

(declare-fun lt!453739 () Unit!33495)

(assert (=> b!1029482 (= lt!453739 lt!453738)))

(declare-fun lt!453734 () ListLongMap!13757)

(assert (=> b!1029482 (= lt!453734 (getCurrentListMapNoExtraKeys!3562 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (array!64626 (store (arr!31117 (_values!6137 thiss!1427)) (index!41060 lt!453354) (ValueCellFull!11453 (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31634 (_values!6137 thiss!1427))) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!453724 () (_ BitVec 64))

(assert (=> b!1029482 (= lt!453724 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453737 () (_ BitVec 64))

(assert (=> b!1029482 (= lt!453737 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1029482 (= lt!453733 (addApplyDifferent!471 lt!453734 lt!453724 (minValue!5950 thiss!1427) lt!453737))))

(assert (=> b!1029482 (= (apply!896 (+!3127 lt!453734 (tuple2!15647 lt!453724 (minValue!5950 thiss!1427))) lt!453737) (apply!896 lt!453734 lt!453737))))

(declare-fun call!43463 () ListLongMap!13757)

(declare-fun bm!43460 () Bool)

(declare-fun call!43467 () ListLongMap!13757)

(declare-fun c!104001 () Bool)

(declare-fun c!103999 () Bool)

(assert (=> bm!43460 (= call!43467 (+!3127 (ite c!103999 call!43468 (ite c!104001 call!43463 call!43462)) (ite (or c!103999 c!104001) (tuple2!15647 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(declare-fun b!1029483 () Bool)

(declare-fun e!581243 () Bool)

(assert (=> b!1029483 (= e!581243 (validKeyInArray!0 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029484 () Bool)

(declare-fun e!581239 () ListLongMap!13757)

(assert (=> b!1029484 (= e!581239 e!581241)))

(assert (=> b!1029484 (= c!104001 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029485 () Bool)

(declare-fun e!581242 () Bool)

(assert (=> b!1029485 (= e!581242 (= (apply!896 lt!453731 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5950 thiss!1427)))))

(declare-fun bm!43461 () Bool)

(assert (=> bm!43461 (= call!43466 call!43467)))

(declare-fun bm!43462 () Bool)

(declare-fun call!43464 () Bool)

(assert (=> bm!43462 (= call!43464 (contains!5951 lt!453731 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029486 () Bool)

(assert (=> b!1029486 (= e!581236 (not call!43464))))

(declare-fun bm!43463 () Bool)

(assert (=> bm!43463 (= call!43463 call!43468)))

(declare-fun e!581240 () Bool)

(declare-fun b!1029487 () Bool)

(assert (=> b!1029487 (= e!581240 (= (apply!896 lt!453731 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000)) (get!16351 (select (arr!31117 (array!64626 (store (arr!31117 (_values!6137 thiss!1427)) (index!41060 lt!453354) (ValueCellFull!11453 (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31634 (_values!6137 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029487 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31634 (array!64626 (store (arr!31117 (_values!6137 thiss!1427)) (index!41060 lt!453354) (ValueCellFull!11453 (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31634 (_values!6137 thiss!1427))))))))

(assert (=> b!1029487 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))))))))

(declare-fun b!1029488 () Bool)

(assert (=> b!1029488 (= e!581239 (+!3127 call!43467 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))

(declare-fun b!1029489 () Bool)

(declare-fun c!103997 () Bool)

(assert (=> b!1029489 (= c!103997 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1029489 (= e!581241 e!581244)))

(declare-fun bm!43464 () Bool)

(assert (=> bm!43464 (= call!43462 call!43463)))

(declare-fun b!1029490 () Bool)

(declare-fun res!688634 () Bool)

(assert (=> b!1029490 (=> (not res!688634) (not e!581237))))

(declare-fun e!581235 () Bool)

(assert (=> b!1029490 (= res!688634 e!581235)))

(declare-fun res!688631 () Bool)

(assert (=> b!1029490 (=> res!688631 e!581235)))

(assert (=> b!1029490 (= res!688631 (not e!581247))))

(declare-fun res!688637 () Bool)

(assert (=> b!1029490 (=> (not res!688637) (not e!581247))))

(assert (=> b!1029490 (= res!688637 (bvslt #b00000000000000000000000000000000 (size!31633 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))))))))

(declare-fun b!1029491 () Bool)

(assert (=> b!1029491 (= e!581236 e!581242)))

(declare-fun res!688633 () Bool)

(assert (=> b!1029491 (= res!688633 call!43464)))

(assert (=> b!1029491 (=> (not res!688633) (not e!581242))))

(declare-fun b!1029492 () Bool)

(declare-fun e!581238 () Bool)

(assert (=> b!1029492 (= e!581238 e!581245)))

(declare-fun res!688636 () Bool)

(declare-fun call!43465 () Bool)

(assert (=> b!1029492 (= res!688636 call!43465)))

(assert (=> b!1029492 (=> (not res!688636) (not e!581245))))

(declare-fun bm!43465 () Bool)

(assert (=> bm!43465 (= call!43465 (contains!5951 lt!453731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029493 () Bool)

(assert (=> b!1029493 (= e!581244 call!43466)))

(declare-fun b!1029494 () Bool)

(declare-fun res!688632 () Bool)

(assert (=> b!1029494 (=> (not res!688632) (not e!581237))))

(assert (=> b!1029494 (= res!688632 e!581238)))

(declare-fun c!104000 () Bool)

(assert (=> b!1029494 (= c!104000 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1029495 () Bool)

(declare-fun Unit!33514 () Unit!33495)

(assert (=> b!1029495 (= e!581246 Unit!33514)))

(declare-fun b!1029496 () Bool)

(assert (=> b!1029496 (= e!581238 (not call!43465))))

(declare-fun d!123227 () Bool)

(assert (=> d!123227 e!581237))

(declare-fun res!688638 () Bool)

(assert (=> d!123227 (=> (not res!688638) (not e!581237))))

(assert (=> d!123227 (= res!688638 (or (bvsge #b00000000000000000000000000000000 (size!31633 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))))))))))

(declare-fun lt!453723 () ListLongMap!13757)

(assert (=> d!123227 (= lt!453731 lt!453723)))

(declare-fun lt!453722 () Unit!33495)

(assert (=> d!123227 (= lt!453722 e!581246)))

(declare-fun c!103998 () Bool)

(assert (=> d!123227 (= c!103998 e!581243)))

(declare-fun res!688630 () Bool)

(assert (=> d!123227 (=> (not res!688630) (not e!581243))))

(assert (=> d!123227 (= res!688630 (bvslt #b00000000000000000000000000000000 (size!31633 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))))))))

(assert (=> d!123227 (= lt!453723 e!581239)))

(assert (=> d!123227 (= c!103999 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123227 (validMask!0 (mask!29861 thiss!1427))))

(assert (=> d!123227 (= (getCurrentListMap!3861 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (array!64626 (store (arr!31117 (_values!6137 thiss!1427)) (index!41060 lt!453354) (ValueCellFull!11453 (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31634 (_values!6137 thiss!1427))) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) lt!453731)))

(declare-fun b!1029497 () Bool)

(assert (=> b!1029497 (= e!581235 e!581240)))

(declare-fun res!688635 () Bool)

(assert (=> b!1029497 (=> (not res!688635) (not e!581240))))

(assert (=> b!1029497 (= res!688635 (contains!5951 lt!453731 (select (arr!31116 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1029497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31633 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))))))))

(assert (= (and d!123227 c!103999) b!1029488))

(assert (= (and d!123227 (not c!103999)) b!1029484))

(assert (= (and b!1029484 c!104001) b!1029479))

(assert (= (and b!1029484 (not c!104001)) b!1029489))

(assert (= (and b!1029489 c!103997) b!1029493))

(assert (= (and b!1029489 (not c!103997)) b!1029481))

(assert (= (or b!1029493 b!1029481) bm!43464))

(assert (= (or b!1029479 bm!43464) bm!43463))

(assert (= (or b!1029479 b!1029493) bm!43461))

(assert (= (or b!1029488 bm!43463) bm!43459))

(assert (= (or b!1029488 bm!43461) bm!43460))

(assert (= (and d!123227 res!688630) b!1029483))

(assert (= (and d!123227 c!103998) b!1029482))

(assert (= (and d!123227 (not c!103998)) b!1029495))

(assert (= (and d!123227 res!688638) b!1029490))

(assert (= (and b!1029490 res!688637) b!1029480))

(assert (= (and b!1029490 (not res!688631)) b!1029497))

(assert (= (and b!1029497 res!688635) b!1029487))

(assert (= (and b!1029490 res!688634) b!1029494))

(assert (= (and b!1029494 c!104000) b!1029492))

(assert (= (and b!1029494 (not c!104000)) b!1029496))

(assert (= (and b!1029492 res!688636) b!1029478))

(assert (= (or b!1029492 b!1029496) bm!43465))

(assert (= (and b!1029494 res!688632) b!1029477))

(assert (= (and b!1029477 c!104002) b!1029491))

(assert (= (and b!1029477 (not c!104002)) b!1029486))

(assert (= (and b!1029491 res!688633) b!1029485))

(assert (= (or b!1029491 b!1029486) bm!43462))

(declare-fun b_lambda!15853 () Bool)

(assert (=> (not b_lambda!15853) (not b!1029487)))

(assert (=> b!1029487 t!30934))

(declare-fun b_and!32911 () Bool)

(assert (= b_and!32909 (and (=> t!30934 result!14137) b_and!32911)))

(declare-fun m!948373 () Bool)

(assert (=> bm!43462 m!948373))

(declare-fun m!948375 () Bool)

(assert (=> bm!43460 m!948375))

(assert (=> d!123227 m!947765))

(assert (=> b!1029483 m!948121))

(assert (=> b!1029483 m!948121))

(assert (=> b!1029483 m!948123))

(declare-fun m!948377 () Bool)

(assert (=> bm!43459 m!948377))

(declare-fun m!948379 () Bool)

(assert (=> b!1029482 m!948379))

(declare-fun m!948381 () Bool)

(assert (=> b!1029482 m!948381))

(declare-fun m!948383 () Bool)

(assert (=> b!1029482 m!948383))

(declare-fun m!948385 () Bool)

(assert (=> b!1029482 m!948385))

(assert (=> b!1029482 m!948377))

(declare-fun m!948387 () Bool)

(assert (=> b!1029482 m!948387))

(declare-fun m!948389 () Bool)

(assert (=> b!1029482 m!948389))

(declare-fun m!948391 () Bool)

(assert (=> b!1029482 m!948391))

(declare-fun m!948393 () Bool)

(assert (=> b!1029482 m!948393))

(declare-fun m!948395 () Bool)

(assert (=> b!1029482 m!948395))

(declare-fun m!948397 () Bool)

(assert (=> b!1029482 m!948397))

(declare-fun m!948399 () Bool)

(assert (=> b!1029482 m!948399))

(assert (=> b!1029482 m!948393))

(declare-fun m!948401 () Bool)

(assert (=> b!1029482 m!948401))

(assert (=> b!1029482 m!948121))

(declare-fun m!948403 () Bool)

(assert (=> b!1029482 m!948403))

(declare-fun m!948405 () Bool)

(assert (=> b!1029482 m!948405))

(assert (=> b!1029482 m!948381))

(assert (=> b!1029482 m!948385))

(declare-fun m!948407 () Bool)

(assert (=> b!1029482 m!948407))

(assert (=> b!1029482 m!948389))

(declare-fun m!948409 () Bool)

(assert (=> bm!43465 m!948409))

(declare-fun m!948411 () Bool)

(assert (=> b!1029488 m!948411))

(assert (=> b!1029480 m!948121))

(assert (=> b!1029480 m!948121))

(assert (=> b!1029480 m!948123))

(assert (=> b!1029487 m!948121))

(declare-fun m!948413 () Bool)

(assert (=> b!1029487 m!948413))

(declare-fun m!948415 () Bool)

(assert (=> b!1029487 m!948415))

(assert (=> b!1029487 m!947653))

(declare-fun m!948417 () Bool)

(assert (=> b!1029487 m!948417))

(assert (=> b!1029487 m!948415))

(assert (=> b!1029487 m!947653))

(assert (=> b!1029487 m!948121))

(declare-fun m!948419 () Bool)

(assert (=> b!1029478 m!948419))

(assert (=> b!1029497 m!948121))

(assert (=> b!1029497 m!948121))

(declare-fun m!948421 () Bool)

(assert (=> b!1029497 m!948421))

(declare-fun m!948423 () Bool)

(assert (=> b!1029485 m!948423))

(assert (=> b!1029184 d!123227))

(declare-fun b!1029510 () Bool)

(declare-fun e!581256 () SeekEntryResult!9672)

(assert (=> b!1029510 (= e!581256 (MissingVacant!9672 (index!41061 lt!453421)))))

(declare-fun b!1029511 () Bool)

(assert (=> b!1029511 (= e!581256 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91573 lt!453421) #b00000000000000000000000000000001) (nextIndex!0 (index!41061 lt!453421) (x!91573 lt!453421) (mask!29861 thiss!1427)) (index!41061 lt!453421) key!909 (_keys!11271 thiss!1427) (mask!29861 thiss!1427)))))

(declare-fun b!1029512 () Bool)

(declare-fun e!581254 () SeekEntryResult!9672)

(assert (=> b!1029512 (= e!581254 Undefined!9672)))

(declare-fun b!1029513 () Bool)

(declare-fun c!104010 () Bool)

(declare-fun lt!453745 () (_ BitVec 64))

(assert (=> b!1029513 (= c!104010 (= lt!453745 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581255 () SeekEntryResult!9672)

(assert (=> b!1029513 (= e!581255 e!581256)))

(declare-fun b!1029514 () Bool)

(assert (=> b!1029514 (= e!581255 (Found!9672 (index!41061 lt!453421)))))

(declare-fun b!1029515 () Bool)

(assert (=> b!1029515 (= e!581254 e!581255)))

(declare-fun c!104009 () Bool)

(assert (=> b!1029515 (= c!104009 (= lt!453745 key!909))))

(declare-fun d!123229 () Bool)

(declare-fun lt!453744 () SeekEntryResult!9672)

(assert (=> d!123229 (and (or ((_ is Undefined!9672) lt!453744) (not ((_ is Found!9672) lt!453744)) (and (bvsge (index!41060 lt!453744) #b00000000000000000000000000000000) (bvslt (index!41060 lt!453744) (size!31633 (_keys!11271 thiss!1427))))) (or ((_ is Undefined!9672) lt!453744) ((_ is Found!9672) lt!453744) (not ((_ is MissingVacant!9672) lt!453744)) (not (= (index!41062 lt!453744) (index!41061 lt!453421))) (and (bvsge (index!41062 lt!453744) #b00000000000000000000000000000000) (bvslt (index!41062 lt!453744) (size!31633 (_keys!11271 thiss!1427))))) (or ((_ is Undefined!9672) lt!453744) (ite ((_ is Found!9672) lt!453744) (= (select (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453744)) key!909) (and ((_ is MissingVacant!9672) lt!453744) (= (index!41062 lt!453744) (index!41061 lt!453421)) (= (select (arr!31116 (_keys!11271 thiss!1427)) (index!41062 lt!453744)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!123229 (= lt!453744 e!581254)))

(declare-fun c!104011 () Bool)

(assert (=> d!123229 (= c!104011 (bvsge (x!91573 lt!453421) #b01111111111111111111111111111110))))

(assert (=> d!123229 (= lt!453745 (select (arr!31116 (_keys!11271 thiss!1427)) (index!41061 lt!453421)))))

(assert (=> d!123229 (validMask!0 (mask!29861 thiss!1427))))

(assert (=> d!123229 (= (seekKeyOrZeroReturnVacant!0 (x!91573 lt!453421) (index!41061 lt!453421) (index!41061 lt!453421) key!909 (_keys!11271 thiss!1427) (mask!29861 thiss!1427)) lt!453744)))

(assert (= (and d!123229 c!104011) b!1029512))

(assert (= (and d!123229 (not c!104011)) b!1029515))

(assert (= (and b!1029515 c!104009) b!1029514))

(assert (= (and b!1029515 (not c!104009)) b!1029513))

(assert (= (and b!1029513 c!104010) b!1029510))

(assert (= (and b!1029513 (not c!104010)) b!1029511))

(declare-fun m!948425 () Bool)

(assert (=> b!1029511 m!948425))

(assert (=> b!1029511 m!948425))

(declare-fun m!948427 () Bool)

(assert (=> b!1029511 m!948427))

(declare-fun m!948429 () Bool)

(assert (=> d!123229 m!948429))

(declare-fun m!948431 () Bool)

(assert (=> d!123229 m!948431))

(assert (=> d!123229 m!947755))

(assert (=> d!123229 m!947765))

(assert (=> b!1029053 d!123229))

(declare-fun d!123231 () Bool)

(declare-fun e!581257 () Bool)

(assert (=> d!123231 e!581257))

(declare-fun res!688640 () Bool)

(assert (=> d!123231 (=> (not res!688640) (not e!581257))))

(declare-fun lt!453748 () ListLongMap!13757)

(assert (=> d!123231 (= res!688640 (contains!5951 lt!453748 (_1!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(declare-fun lt!453749 () List!21856)

(assert (=> d!123231 (= lt!453748 (ListLongMap!13758 lt!453749))))

(declare-fun lt!453746 () Unit!33495)

(declare-fun lt!453747 () Unit!33495)

(assert (=> d!123231 (= lt!453746 lt!453747)))

(assert (=> d!123231 (= (getValueByKey!588 lt!453749 (_1!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123231 (= lt!453747 (lemmaContainsTupThenGetReturnValue!278 lt!453749 (_1!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123231 (= lt!453749 (insertStrictlySorted!371 (toList!6894 call!43444) (_1!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) (_2!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123231 (= (+!3127 call!43444 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) lt!453748)))

(declare-fun b!1029516 () Bool)

(declare-fun res!688639 () Bool)

(assert (=> b!1029516 (=> (not res!688639) (not e!581257))))

(assert (=> b!1029516 (= res!688639 (= (getValueByKey!588 (toList!6894 lt!453748) (_1!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (Some!638 (_2!7834 (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(declare-fun b!1029517 () Bool)

(assert (=> b!1029517 (= e!581257 (contains!5953 (toList!6894 lt!453748) (tuple2!15647 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))

(assert (= (and d!123231 res!688640) b!1029516))

(assert (= (and b!1029516 res!688639) b!1029517))

(declare-fun m!948433 () Bool)

(assert (=> d!123231 m!948433))

(declare-fun m!948435 () Bool)

(assert (=> d!123231 m!948435))

(declare-fun m!948437 () Bool)

(assert (=> d!123231 m!948437))

(declare-fun m!948439 () Bool)

(assert (=> d!123231 m!948439))

(declare-fun m!948441 () Bool)

(assert (=> b!1029516 m!948441))

(declare-fun m!948443 () Bool)

(assert (=> b!1029517 m!948443))

(assert (=> b!1029196 d!123231))

(assert (=> b!1029158 d!123123))

(declare-fun b!1029518 () Bool)

(declare-fun e!581258 () Bool)

(declare-fun call!43469 () Bool)

(assert (=> b!1029518 (= e!581258 call!43469)))

(declare-fun b!1029519 () Bool)

(declare-fun e!581260 () Bool)

(assert (=> b!1029519 (= e!581260 call!43469)))

(declare-fun b!1029520 () Bool)

(declare-fun e!581259 () Bool)

(assert (=> b!1029520 (= e!581259 e!581260)))

(declare-fun c!104012 () Bool)

(assert (=> b!1029520 (= c!104012 (validKeyInArray!0 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123233 () Bool)

(declare-fun res!688641 () Bool)

(assert (=> d!123233 (=> res!688641 e!581259)))

(assert (=> d!123233 (= res!688641 (bvsge #b00000000000000000000000000000000 (size!31633 (_keys!11271 thiss!1427))))))

(assert (=> d!123233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11271 thiss!1427) (mask!29861 thiss!1427)) e!581259)))

(declare-fun b!1029521 () Bool)

(assert (=> b!1029521 (= e!581260 e!581258)))

(declare-fun lt!453751 () (_ BitVec 64))

(assert (=> b!1029521 (= lt!453751 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453750 () Unit!33495)

(assert (=> b!1029521 (= lt!453750 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11271 thiss!1427) lt!453751 #b00000000000000000000000000000000))))

(assert (=> b!1029521 (arrayContainsKey!0 (_keys!11271 thiss!1427) lt!453751 #b00000000000000000000000000000000)))

(declare-fun lt!453752 () Unit!33495)

(assert (=> b!1029521 (= lt!453752 lt!453750)))

(declare-fun res!688642 () Bool)

(assert (=> b!1029521 (= res!688642 (= (seekEntryOrOpen!0 (select (arr!31116 (_keys!11271 thiss!1427)) #b00000000000000000000000000000000) (_keys!11271 thiss!1427) (mask!29861 thiss!1427)) (Found!9672 #b00000000000000000000000000000000)))))

(assert (=> b!1029521 (=> (not res!688642) (not e!581258))))

(declare-fun bm!43466 () Bool)

(assert (=> bm!43466 (= call!43469 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11271 thiss!1427) (mask!29861 thiss!1427)))))

(assert (= (and d!123233 (not res!688641)) b!1029520))

(assert (= (and b!1029520 c!104012) b!1029521))

(assert (= (and b!1029520 (not c!104012)) b!1029519))

(assert (= (and b!1029521 res!688642) b!1029518))

(assert (= (or b!1029518 b!1029519) bm!43466))

(assert (=> b!1029520 m!947781))

(assert (=> b!1029520 m!947781))

(assert (=> b!1029520 m!947783))

(assert (=> b!1029521 m!947781))

(declare-fun m!948445 () Bool)

(assert (=> b!1029521 m!948445))

(declare-fun m!948447 () Bool)

(assert (=> b!1029521 m!948447))

(assert (=> b!1029521 m!947781))

(declare-fun m!948449 () Bool)

(assert (=> b!1029521 m!948449))

(declare-fun m!948451 () Bool)

(assert (=> bm!43466 m!948451))

(assert (=> b!1029066 d!123233))

(declare-fun d!123235 () Bool)

(assert (=> d!123235 (= (-!486 (getCurrentListMap!3861 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) key!909) (getCurrentListMap!3861 (array!64624 (store (arr!31116 (_keys!11271 thiss!1427)) (index!41060 lt!453354) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31633 (_keys!11271 thiss!1427))) (array!64626 (store (arr!31117 (_values!6137 thiss!1427)) (index!41060 lt!453354) (ValueCellFull!11453 (dynLambda!1948 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31634 (_values!6137 thiss!1427))) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(assert (=> d!123235 true))

(declare-fun _$9!41 () Unit!33495)

(assert (=> d!123235 (= (choose!1696 (_keys!11271 thiss!1427) (_values!6137 thiss!1427) (mask!29861 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (index!41060 lt!453354) key!909 (defaultEntry!6114 thiss!1427)) _$9!41)))

(declare-fun b_lambda!15855 () Bool)

(assert (=> (not b_lambda!15855) (not d!123235)))

(assert (=> d!123235 t!30934))

(declare-fun b_and!32913 () Bool)

(assert (= b_and!32911 (and (=> t!30934 result!14137) b_and!32913)))

(assert (=> d!123235 m!947873))

(assert (=> d!123235 m!947647))

(assert (=> d!123235 m!947653))

(assert (=> d!123235 m!947637))

(assert (=> d!123235 m!947633))

(assert (=> d!123235 m!947647))

(assert (=> d!123235 m!947649))

(assert (=> d!123065 d!123235))

(assert (=> d!123065 d!123115))

(declare-fun mapIsEmpty!37922 () Bool)

(declare-fun mapRes!37922 () Bool)

(assert (=> mapIsEmpty!37922 mapRes!37922))

(declare-fun mapNonEmpty!37922 () Bool)

(declare-fun tp!72855 () Bool)

(declare-fun e!581262 () Bool)

(assert (=> mapNonEmpty!37922 (= mapRes!37922 (and tp!72855 e!581262))))

(declare-fun mapKey!37922 () (_ BitVec 32))

(declare-fun mapRest!37922 () (Array (_ BitVec 32) ValueCell!11453))

(declare-fun mapValue!37922 () ValueCell!11453)

(assert (=> mapNonEmpty!37922 (= mapRest!37921 (store mapRest!37922 mapKey!37922 mapValue!37922))))

(declare-fun condMapEmpty!37922 () Bool)

(declare-fun mapDefault!37922 () ValueCell!11453)

(assert (=> mapNonEmpty!37921 (= condMapEmpty!37922 (= mapRest!37921 ((as const (Array (_ BitVec 32) ValueCell!11453)) mapDefault!37922)))))

(declare-fun e!581261 () Bool)

(assert (=> mapNonEmpty!37921 (= tp!72854 (and e!581261 mapRes!37922))))

(declare-fun b!1029523 () Bool)

(assert (=> b!1029523 (= e!581261 tp_is_empty!24313)))

(declare-fun b!1029522 () Bool)

(assert (=> b!1029522 (= e!581262 tp_is_empty!24313)))

(assert (= (and mapNonEmpty!37921 condMapEmpty!37922) mapIsEmpty!37922))

(assert (= (and mapNonEmpty!37921 (not condMapEmpty!37922)) mapNonEmpty!37922))

(assert (= (and mapNonEmpty!37922 ((_ is ValueCellFull!11453) mapValue!37922)) b!1029522))

(assert (= (and mapNonEmpty!37921 ((_ is ValueCellFull!11453) mapDefault!37922)) b!1029523))

(declare-fun m!948453 () Bool)

(assert (=> mapNonEmpty!37922 m!948453))

(declare-fun b_lambda!15857 () Bool)

(assert (= b_lambda!15851 (or (and b!1028980 b_free!20593) b_lambda!15857)))

(declare-fun b_lambda!15859 () Bool)

(assert (= b_lambda!15853 (or (and b!1028980 b_free!20593) b_lambda!15859)))

(declare-fun b_lambda!15861 () Bool)

(assert (= b_lambda!15847 (or (and b!1028980 b_free!20593) b_lambda!15861)))

(declare-fun b_lambda!15863 () Bool)

(assert (= b_lambda!15855 (or (and b!1028980 b_free!20593) b_lambda!15863)))

(declare-fun b_lambda!15865 () Bool)

(assert (= b_lambda!15849 (or (and b!1028980 b_free!20593) b_lambda!15865)))

(declare-fun b_lambda!15867 () Bool)

(assert (= b_lambda!15845 (or (and b!1028980 b_free!20593) b_lambda!15867)))

(check-sat (not d!123085) (not bm!43450) (not b!1029440) (not b!1029442) (not d!123187) (not b!1029291) (not b!1029293) (not b!1029296) (not b!1029430) (not b!1029248) (not b!1029466) (not b!1029363) (not d!123171) (not d!123189) (not d!123175) (not b!1029426) (not b!1029297) (not d!123211) (not b!1029446) (not d!123177) (not d!123207) (not b!1029428) (not d!123155) (not d!123073) (not b_lambda!15863) (not d!123095) (not b!1029497) (not d!123167) (not b_lambda!15859) (not b!1029376) (not d!123105) (not b_lambda!15831) (not d!123197) (not d!123169) (not b!1029516) (not b!1029331) (not d!123081) (not b_lambda!15865) (not bm!43460) (not d!123185) (not b!1029260) (not b!1029241) (not b!1029378) (not b_lambda!15841) (not b!1029349) (not b!1029300) (not d!123217) (not b!1029400) (not b!1029423) (not bm!43454) (not b!1029435) (not d!123109) (not bm!43451) (not d!123101) (not bm!43466) (not b!1029332) (not b!1029460) (not b!1029456) (not b!1029472) (not d!123203) (not d!123181) (not b!1029427) (not b!1029467) (not b!1029520) (not b!1029474) (not b!1029485) (not b!1029437) (not d!123131) (not b!1029321) (not b!1029424) (not b!1029299) (not b!1029344) (not d!123215) (not d!123091) (not d!123139) (not d!123125) (not b!1029298) (not b!1029258) (not d!123149) tp_is_empty!24313 (not b!1029453) (not d!123107) (not b!1029483) (not b_lambda!15861) (not b!1029420) (not b!1029330) (not bm!43462) (not b!1029384) (not b!1029354) (not b!1029374) (not b_lambda!15857) (not d!123089) (not d!123133) (not bm!43456) (not b_lambda!15843) (not d!123083) (not b!1029488) (not d!123121) (not b!1029405) b_and!32913 (not d!123227) (not d!123099) (not d!123163) (not d!123079) (not d!123183) (not d!123093) (not b!1029422) (not b!1029353) (not b!1029444) (not bm!43453) (not b!1029337) (not d!123161) (not b!1029403) (not b!1029357) (not d!123119) (not b!1029450) (not b!1029242) (not b!1029441) (not b!1029452) (not b!1029517) (not d!123103) (not d!123199) (not b!1029433) (not d!123159) (not b!1029249) (not b_lambda!15867) (not mapNonEmpty!37922) (not b!1029482) (not bm!43457) (not d!123127) (not d!123195) (not b!1029373) (not b!1029340) (not d!123111) (not b!1029345) (not b!1029336) (not b!1029468) (not d!123087) (not b_lambda!15839) (not d!123235) (not bm!43452) (not b!1029471) (not b!1029234) (not b!1029445) (not bm!43455) (not b!1029511) (not b!1029352) (not b!1029250) (not d!123209) (not b!1029380) (not d!123179) (not b!1029418) (not b!1029362) (not b!1029334) (not b!1029289) (not bm!43465) (not b!1029478) (not b!1029443) (not b!1029262) (not d!123129) (not b!1029521) (not d!123205) (not d!123145) (not bm!43458) (not b!1029381) (not b!1029449) (not d!123153) (not b!1029346) (not b!1029263) (not b!1029480) (not b!1029487) (not bm!43459) (not b!1029247) (not d!123193) (not b!1029338) (not d!123191) (not b!1029382) (not b!1029335) (not d!123231) (not bm!43447) (not b!1029447) (not d!123097) (not b!1029455) (not d!123173) (not b!1029350) (not d!123229) (not d!123201) (not b!1029457) (not b!1029431) (not b_next!20593))
(check-sat b_and!32913 (not b_next!20593))
