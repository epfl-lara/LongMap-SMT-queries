; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89804 () Bool)

(assert start!89804)

(declare-fun b!1028794 () Bool)

(declare-fun b_free!20569 () Bool)

(declare-fun b_next!20569 () Bool)

(assert (=> b!1028794 (= b_free!20569 (not b_next!20569))))

(declare-fun tp!72753 () Bool)

(declare-fun b_and!32825 () Bool)

(assert (=> b!1028794 (= tp!72753 b_and!32825)))

(declare-fun mapNonEmpty!37862 () Bool)

(declare-fun mapRes!37862 () Bool)

(declare-fun tp!72752 () Bool)

(declare-fun e!580723 () Bool)

(assert (=> mapNonEmpty!37862 (= mapRes!37862 (and tp!72752 e!580723))))

(declare-datatypes ((V!37259 0))(
  ( (V!37260 (val!12195 Int)) )
))
(declare-datatypes ((ValueCell!11441 0))(
  ( (ValueCellFull!11441 (v!14760 V!37259)) (EmptyCell!11441) )
))
(declare-fun mapValue!37862 () ValueCell!11441)

(declare-datatypes ((array!64677 0))(
  ( (array!64678 (arr!31141 (Array (_ BitVec 32) (_ BitVec 64))) (size!31655 (_ BitVec 32))) )
))
(declare-datatypes ((array!64679 0))(
  ( (array!64680 (arr!31142 (Array (_ BitVec 32) ValueCell!11441)) (size!31656 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5476 0))(
  ( (LongMapFixedSize!5477 (defaultEntry!6090 Int) (mask!29868 (_ BitVec 32)) (extraKeys!5822 (_ BitVec 32)) (zeroValue!5926 V!37259) (minValue!5926 V!37259) (_size!2793 (_ BitVec 32)) (_keys!11275 array!64677) (_values!6113 array!64679) (_vacant!2793 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5476)

(declare-fun mapKey!37862 () (_ BitVec 32))

(declare-fun mapRest!37862 () (Array (_ BitVec 32) ValueCell!11441))

(assert (=> mapNonEmpty!37862 (= (arr!31142 (_values!6113 thiss!1427)) (store mapRest!37862 mapKey!37862 mapValue!37862))))

(declare-fun res!688235 () Bool)

(declare-fun e!580726 () Bool)

(assert (=> start!89804 (=> (not res!688235) (not e!580726))))

(declare-fun valid!2082 (LongMapFixedSize!5476) Bool)

(assert (=> start!89804 (= res!688235 (valid!2082 thiss!1427))))

(assert (=> start!89804 e!580726))

(declare-fun e!580722 () Bool)

(assert (=> start!89804 e!580722))

(assert (=> start!89804 true))

(declare-fun b!1028790 () Bool)

(declare-fun e!580725 () Bool)

(assert (=> b!1028790 (= e!580726 e!580725)))

(declare-fun res!688234 () Bool)

(assert (=> b!1028790 (=> (not res!688234) (not e!580725))))

(declare-datatypes ((SeekEntryResult!9628 0))(
  ( (MissingZero!9628 (index!40883 (_ BitVec 32))) (Found!9628 (index!40884 (_ BitVec 32))) (Intermediate!9628 (undefined!10440 Bool) (index!40885 (_ BitVec 32)) (x!91410 (_ BitVec 32))) (Undefined!9628) (MissingVacant!9628 (index!40886 (_ BitVec 32))) )
))
(declare-fun lt!452806 () SeekEntryResult!9628)

(get-info :version)

(assert (=> b!1028790 (= res!688234 ((_ is Found!9628) lt!452806))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64677 (_ BitVec 32)) SeekEntryResult!9628)

(assert (=> b!1028790 (= lt!452806 (seekEntry!0 key!909 (_keys!11275 thiss!1427) (mask!29868 thiss!1427)))))

(declare-fun mapIsEmpty!37862 () Bool)

(assert (=> mapIsEmpty!37862 mapRes!37862))

(declare-fun b!1028791 () Bool)

(declare-fun e!580721 () Bool)

(declare-fun e!580724 () Bool)

(assert (=> b!1028791 (= e!580721 (and e!580724 mapRes!37862))))

(declare-fun condMapEmpty!37862 () Bool)

(declare-fun mapDefault!37862 () ValueCell!11441)

(assert (=> b!1028791 (= condMapEmpty!37862 (= (arr!31142 (_values!6113 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11441)) mapDefault!37862)))))

(declare-fun b!1028792 () Bool)

(declare-fun res!688233 () Bool)

(assert (=> b!1028792 (=> (not res!688233) (not e!580726))))

(assert (=> b!1028792 (= res!688233 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1028793 () Bool)

(declare-fun tp_is_empty!24289 () Bool)

(assert (=> b!1028793 (= e!580723 tp_is_empty!24289)))

(declare-fun array_inv!24123 (array!64677) Bool)

(declare-fun array_inv!24124 (array!64679) Bool)

(assert (=> b!1028794 (= e!580722 (and tp!72753 tp_is_empty!24289 (array_inv!24123 (_keys!11275 thiss!1427)) (array_inv!24124 (_values!6113 thiss!1427)) e!580721))))

(declare-fun lt!452805 () array!64679)

(declare-fun lt!452809 () array!64677)

(declare-fun b!1028795 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(declare-datatypes ((Unit!33492 0))(
  ( (Unit!33493) )
))
(declare-datatypes ((tuple2!15530 0))(
  ( (tuple2!15531 (_1!7776 Unit!33492) (_2!7776 LongMapFixedSize!5476)) )
))
(declare-fun Unit!33494 () Unit!33492)

(declare-fun Unit!33495 () Unit!33492)

(assert (=> b!1028795 (= e!580725 (not (validMask!0 (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33494 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33495 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))))))))

(declare-datatypes ((tuple2!15532 0))(
  ( (tuple2!15533 (_1!7777 (_ BitVec 64)) (_2!7777 V!37259)) )
))
(declare-datatypes ((List!21792 0))(
  ( (Nil!21789) (Cons!21788 (h!22995 tuple2!15532) (t!30848 List!21792)) )
))
(declare-datatypes ((ListLongMap!13675 0))(
  ( (ListLongMap!13676 (toList!6853 List!21792)) )
))
(declare-fun -!476 (ListLongMap!13675 (_ BitVec 64)) ListLongMap!13675)

(declare-fun getCurrentListMap!3899 (array!64677 array!64679 (_ BitVec 32) (_ BitVec 32) V!37259 V!37259 (_ BitVec 32) Int) ListLongMap!13675)

(assert (=> b!1028795 (= (-!476 (getCurrentListMap!3899 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)) key!909) (getCurrentListMap!3899 lt!452809 lt!452805 (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun dynLambda!1970 (Int (_ BitVec 64)) V!37259)

(assert (=> b!1028795 (= lt!452805 (array!64680 (store (arr!31142 (_values!6113 thiss!1427)) (index!40884 lt!452806) (ValueCellFull!11441 (dynLambda!1970 (defaultEntry!6090 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31656 (_values!6113 thiss!1427))))))

(declare-fun lt!452803 () Unit!33492)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!2 (array!64677 array!64679 (_ BitVec 32) (_ BitVec 32) V!37259 V!37259 (_ BitVec 32) (_ BitVec 64) Int) Unit!33492)

(assert (=> b!1028795 (= lt!452803 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!2 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (index!40884 lt!452806) key!909 (defaultEntry!6090 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028795 (not (arrayContainsKey!0 lt!452809 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!452804 () Unit!33492)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64677 (_ BitVec 32) (_ BitVec 64)) Unit!33492)

(assert (=> b!1028795 (= lt!452804 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11275 thiss!1427) (index!40884 lt!452806) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64677 (_ BitVec 32)) Bool)

(assert (=> b!1028795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452809 (mask!29868 thiss!1427))))

(declare-fun lt!452807 () Unit!33492)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64677 (_ BitVec 32) (_ BitVec 32)) Unit!33492)

(assert (=> b!1028795 (= lt!452807 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11275 thiss!1427) (index!40884 lt!452806) (mask!29868 thiss!1427)))))

(declare-datatypes ((List!21793 0))(
  ( (Nil!21790) (Cons!21789 (h!22996 (_ BitVec 64)) (t!30849 List!21793)) )
))
(declare-fun arrayNoDuplicates!0 (array!64677 (_ BitVec 32) List!21793) Bool)

(assert (=> b!1028795 (arrayNoDuplicates!0 lt!452809 #b00000000000000000000000000000000 Nil!21790)))

(declare-fun lt!452810 () Unit!33492)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64677 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21793) Unit!33492)

(assert (=> b!1028795 (= lt!452810 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11275 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40884 lt!452806) #b00000000000000000000000000000000 Nil!21790))))

(declare-fun arrayCountValidKeys!0 (array!64677 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028795 (= (arrayCountValidKeys!0 lt!452809 #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11275 thiss!1427) #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028795 (= lt!452809 (array!64678 (store (arr!31141 (_keys!11275 thiss!1427)) (index!40884 lt!452806) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31655 (_keys!11275 thiss!1427))))))

(declare-fun lt!452808 () Unit!33492)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64677 (_ BitVec 32) (_ BitVec 64)) Unit!33492)

(assert (=> b!1028795 (= lt!452808 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11275 thiss!1427) (index!40884 lt!452806) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028796 () Bool)

(assert (=> b!1028796 (= e!580724 tp_is_empty!24289)))

(assert (= (and start!89804 res!688235) b!1028792))

(assert (= (and b!1028792 res!688233) b!1028790))

(assert (= (and b!1028790 res!688234) b!1028795))

(assert (= (and b!1028791 condMapEmpty!37862) mapIsEmpty!37862))

(assert (= (and b!1028791 (not condMapEmpty!37862)) mapNonEmpty!37862))

(assert (= (and mapNonEmpty!37862 ((_ is ValueCellFull!11441) mapValue!37862)) b!1028793))

(assert (= (and b!1028791 ((_ is ValueCellFull!11441) mapDefault!37862)) b!1028796))

(assert (= b!1028794 b!1028791))

(assert (= start!89804 b!1028794))

(declare-fun b_lambda!15729 () Bool)

(assert (=> (not b_lambda!15729) (not b!1028795)))

(declare-fun t!30847 () Bool)

(declare-fun tb!6879 () Bool)

(assert (=> (and b!1028794 (= (defaultEntry!6090 thiss!1427) (defaultEntry!6090 thiss!1427)) t!30847) tb!6879))

(declare-fun result!14081 () Bool)

(assert (=> tb!6879 (= result!14081 tp_is_empty!24289)))

(assert (=> b!1028795 t!30847))

(declare-fun b_and!32827 () Bool)

(assert (= b_and!32825 (and (=> t!30847 result!14081) b_and!32827)))

(declare-fun m!947619 () Bool)

(assert (=> b!1028790 m!947619))

(declare-fun m!947621 () Bool)

(assert (=> b!1028794 m!947621))

(declare-fun m!947623 () Bool)

(assert (=> b!1028794 m!947623))

(declare-fun m!947625 () Bool)

(assert (=> b!1028795 m!947625))

(declare-fun m!947627 () Bool)

(assert (=> b!1028795 m!947627))

(declare-fun m!947629 () Bool)

(assert (=> b!1028795 m!947629))

(declare-fun m!947631 () Bool)

(assert (=> b!1028795 m!947631))

(declare-fun m!947633 () Bool)

(assert (=> b!1028795 m!947633))

(declare-fun m!947635 () Bool)

(assert (=> b!1028795 m!947635))

(declare-fun m!947637 () Bool)

(assert (=> b!1028795 m!947637))

(declare-fun m!947639 () Bool)

(assert (=> b!1028795 m!947639))

(declare-fun m!947641 () Bool)

(assert (=> b!1028795 m!947641))

(declare-fun m!947643 () Bool)

(assert (=> b!1028795 m!947643))

(declare-fun m!947645 () Bool)

(assert (=> b!1028795 m!947645))

(declare-fun m!947647 () Bool)

(assert (=> b!1028795 m!947647))

(declare-fun m!947649 () Bool)

(assert (=> b!1028795 m!947649))

(assert (=> b!1028795 m!947645))

(declare-fun m!947651 () Bool)

(assert (=> b!1028795 m!947651))

(declare-fun m!947653 () Bool)

(assert (=> b!1028795 m!947653))

(declare-fun m!947655 () Bool)

(assert (=> b!1028795 m!947655))

(declare-fun m!947657 () Bool)

(assert (=> b!1028795 m!947657))

(declare-fun m!947659 () Bool)

(assert (=> mapNonEmpty!37862 m!947659))

(declare-fun m!947661 () Bool)

(assert (=> start!89804 m!947661))

(check-sat tp_is_empty!24289 (not b!1028794) (not b_next!20569) (not b_lambda!15729) b_and!32827 (not b!1028790) (not b!1028795) (not mapNonEmpty!37862) (not start!89804))
(check-sat b_and!32827 (not b_next!20569))
(get-model)

(declare-fun b_lambda!15735 () Bool)

(assert (= b_lambda!15729 (or (and b!1028794 b_free!20569) b_lambda!15735)))

(check-sat tp_is_empty!24289 (not b!1028794) (not b_next!20569) (not b_lambda!15735) b_and!32827 (not b!1028790) (not b!1028795) (not mapNonEmpty!37862) (not start!89804))
(check-sat b_and!32827 (not b_next!20569))
(get-model)

(declare-fun d!123169 () Bool)

(assert (=> d!123169 (= (array_inv!24123 (_keys!11275 thiss!1427)) (bvsge (size!31655 (_keys!11275 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028794 d!123169))

(declare-fun d!123171 () Bool)

(assert (=> d!123171 (= (array_inv!24124 (_values!6113 thiss!1427)) (bvsge (size!31656 (_values!6113 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028794 d!123171))

(declare-fun b!1028857 () Bool)

(declare-fun e!580777 () SeekEntryResult!9628)

(declare-fun lt!452867 () SeekEntryResult!9628)

(assert (=> b!1028857 (= e!580777 (MissingZero!9628 (index!40885 lt!452867)))))

(declare-fun b!1028858 () Bool)

(declare-fun c!103988 () Bool)

(declare-fun lt!452868 () (_ BitVec 64))

(assert (=> b!1028858 (= c!103988 (= lt!452868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580775 () SeekEntryResult!9628)

(assert (=> b!1028858 (= e!580775 e!580777)))

(declare-fun b!1028859 () Bool)

(declare-fun e!580776 () SeekEntryResult!9628)

(assert (=> b!1028859 (= e!580776 Undefined!9628)))

(declare-fun d!123173 () Bool)

(declare-fun lt!452870 () SeekEntryResult!9628)

(assert (=> d!123173 (and (or ((_ is MissingVacant!9628) lt!452870) (not ((_ is Found!9628) lt!452870)) (and (bvsge (index!40884 lt!452870) #b00000000000000000000000000000000) (bvslt (index!40884 lt!452870) (size!31655 (_keys!11275 thiss!1427))))) (not ((_ is MissingVacant!9628) lt!452870)) (or (not ((_ is Found!9628) lt!452870)) (= (select (arr!31141 (_keys!11275 thiss!1427)) (index!40884 lt!452870)) key!909)))))

(assert (=> d!123173 (= lt!452870 e!580776)))

(declare-fun c!103989 () Bool)

(assert (=> d!123173 (= c!103989 (and ((_ is Intermediate!9628) lt!452867) (undefined!10440 lt!452867)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64677 (_ BitVec 32)) SeekEntryResult!9628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123173 (= lt!452867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29868 thiss!1427)) key!909 (_keys!11275 thiss!1427) (mask!29868 thiss!1427)))))

(assert (=> d!123173 (validMask!0 (mask!29868 thiss!1427))))

(assert (=> d!123173 (= (seekEntry!0 key!909 (_keys!11275 thiss!1427) (mask!29868 thiss!1427)) lt!452870)))

(declare-fun b!1028860 () Bool)

(assert (=> b!1028860 (= e!580775 (Found!9628 (index!40885 lt!452867)))))

(declare-fun b!1028861 () Bool)

(declare-fun lt!452869 () SeekEntryResult!9628)

(assert (=> b!1028861 (= e!580777 (ite ((_ is MissingVacant!9628) lt!452869) (MissingZero!9628 (index!40886 lt!452869)) lt!452869))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64677 (_ BitVec 32)) SeekEntryResult!9628)

(assert (=> b!1028861 (= lt!452869 (seekKeyOrZeroReturnVacant!0 (x!91410 lt!452867) (index!40885 lt!452867) (index!40885 lt!452867) key!909 (_keys!11275 thiss!1427) (mask!29868 thiss!1427)))))

(declare-fun b!1028862 () Bool)

(assert (=> b!1028862 (= e!580776 e!580775)))

(assert (=> b!1028862 (= lt!452868 (select (arr!31141 (_keys!11275 thiss!1427)) (index!40885 lt!452867)))))

(declare-fun c!103987 () Bool)

(assert (=> b!1028862 (= c!103987 (= lt!452868 key!909))))

(assert (= (and d!123173 c!103989) b!1028859))

(assert (= (and d!123173 (not c!103989)) b!1028862))

(assert (= (and b!1028862 c!103987) b!1028860))

(assert (= (and b!1028862 (not c!103987)) b!1028858))

(assert (= (and b!1028858 c!103988) b!1028857))

(assert (= (and b!1028858 (not c!103988)) b!1028861))

(declare-fun m!947751 () Bool)

(assert (=> d!123173 m!947751))

(declare-fun m!947753 () Bool)

(assert (=> d!123173 m!947753))

(assert (=> d!123173 m!947753))

(declare-fun m!947755 () Bool)

(assert (=> d!123173 m!947755))

(declare-fun m!947757 () Bool)

(assert (=> d!123173 m!947757))

(declare-fun m!947759 () Bool)

(assert (=> b!1028861 m!947759))

(declare-fun m!947761 () Bool)

(assert (=> b!1028862 m!947761))

(assert (=> b!1028790 d!123173))

(declare-fun d!123175 () Bool)

(declare-fun res!688260 () Bool)

(declare-fun e!580780 () Bool)

(assert (=> d!123175 (=> (not res!688260) (not e!580780))))

(declare-fun simpleValid!390 (LongMapFixedSize!5476) Bool)

(assert (=> d!123175 (= res!688260 (simpleValid!390 thiss!1427))))

(assert (=> d!123175 (= (valid!2082 thiss!1427) e!580780)))

(declare-fun b!1028869 () Bool)

(declare-fun res!688261 () Bool)

(assert (=> b!1028869 (=> (not res!688261) (not e!580780))))

(assert (=> b!1028869 (= res!688261 (= (arrayCountValidKeys!0 (_keys!11275 thiss!1427) #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))) (_size!2793 thiss!1427)))))

(declare-fun b!1028870 () Bool)

(declare-fun res!688262 () Bool)

(assert (=> b!1028870 (=> (not res!688262) (not e!580780))))

(assert (=> b!1028870 (= res!688262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11275 thiss!1427) (mask!29868 thiss!1427)))))

(declare-fun b!1028871 () Bool)

(assert (=> b!1028871 (= e!580780 (arrayNoDuplicates!0 (_keys!11275 thiss!1427) #b00000000000000000000000000000000 Nil!21790))))

(assert (= (and d!123175 res!688260) b!1028869))

(assert (= (and b!1028869 res!688261) b!1028870))

(assert (= (and b!1028870 res!688262) b!1028871))

(declare-fun m!947763 () Bool)

(assert (=> d!123175 m!947763))

(assert (=> b!1028869 m!947637))

(declare-fun m!947765 () Bool)

(assert (=> b!1028870 m!947765))

(declare-fun m!947767 () Bool)

(assert (=> b!1028871 m!947767))

(assert (=> start!89804 d!123175))

(declare-fun d!123177 () Bool)

(declare-fun Unit!33500 () Unit!33492)

(declare-fun Unit!33501 () Unit!33492)

(declare-fun Unit!33502 () Unit!33492)

(declare-fun Unit!33503 () Unit!33492)

(declare-fun Unit!33504 () Unit!33492)

(declare-fun Unit!33505 () Unit!33492)

(declare-fun Unit!33506 () Unit!33492)

(declare-fun Unit!33507 () Unit!33492)

(declare-fun Unit!33508 () Unit!33492)

(declare-fun Unit!33509 () Unit!33492)

(declare-fun Unit!33510 () Unit!33492)

(declare-fun Unit!33511 () Unit!33492)

(declare-fun Unit!33512 () Unit!33492)

(declare-fun Unit!33513 () Unit!33492)

(declare-fun Unit!33514 () Unit!33492)

(declare-fun Unit!33515 () Unit!33492)

(declare-fun Unit!33516 () Unit!33492)

(declare-fun Unit!33517 () Unit!33492)

(declare-fun Unit!33518 () Unit!33492)

(declare-fun Unit!33519 () Unit!33492)

(declare-fun Unit!33520 () Unit!33492)

(declare-fun Unit!33521 () Unit!33492)

(declare-fun Unit!33522 () Unit!33492)

(declare-fun Unit!33523 () Unit!33492)

(declare-fun Unit!33524 () Unit!33492)

(declare-fun Unit!33525 () Unit!33492)

(declare-fun Unit!33526 () Unit!33492)

(declare-fun Unit!33527 () Unit!33492)

(declare-fun Unit!33528 () Unit!33492)

(declare-fun Unit!33529 () Unit!33492)

(declare-fun Unit!33530 () Unit!33492)

(declare-fun Unit!33531 () Unit!33492)

(declare-fun Unit!33532 () Unit!33492)

(declare-fun Unit!33533 () Unit!33492)

(declare-fun Unit!33534 () Unit!33492)

(declare-fun Unit!33535 () Unit!33492)

(declare-fun Unit!33536 () Unit!33492)

(declare-fun Unit!33537 () Unit!33492)

(declare-fun Unit!33538 () Unit!33492)

(declare-fun Unit!33539 () Unit!33492)

(declare-fun Unit!33540 () Unit!33492)

(declare-fun Unit!33541 () Unit!33492)

(declare-fun Unit!33542 () Unit!33492)

(declare-fun Unit!33543 () Unit!33492)

(declare-fun Unit!33544 () Unit!33492)

(declare-fun Unit!33545 () Unit!33492)

(declare-fun Unit!33546 () Unit!33492)

(declare-fun Unit!33547 () Unit!33492)

(declare-fun Unit!33548 () Unit!33492)

(declare-fun Unit!33549 () Unit!33492)

(declare-fun Unit!33550 () Unit!33492)

(declare-fun Unit!33551 () Unit!33492)

(declare-fun Unit!33552 () Unit!33492)

(declare-fun Unit!33553 () Unit!33492)

(declare-fun Unit!33554 () Unit!33492)

(declare-fun Unit!33555 () Unit!33492)

(declare-fun Unit!33556 () Unit!33492)

(declare-fun Unit!33557 () Unit!33492)

(declare-fun Unit!33558 () Unit!33492)

(declare-fun Unit!33559 () Unit!33492)

(assert (=> d!123177 (= (validMask!0 (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33500 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33501 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427))))))) (and (or (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33502 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33503 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000000000111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33504 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33505 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000000001111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33506 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33507 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000000011111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33508 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33509 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000000111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33510 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33511 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000001111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33512 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33513 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000011111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33514 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33515 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33516 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33517 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000000001111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33518 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33519 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000000011111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33520 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33521 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000000111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33522 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33523 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000001111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33524 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33525 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000011111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33526 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33527 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000000111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33528 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33529 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000001111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33530 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33531 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000011111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33532 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33533 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000000111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33534 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33535 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000001111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33536 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33537 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000011111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33538 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33539 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000000111111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33540 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33541 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000001111111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33542 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33543 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000011111111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33544 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33545 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000000111111111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33546 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33547 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000001111111111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33548 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33549 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000011111111111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33550 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33551 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00000111111111111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33552 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33553 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00001111111111111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33554 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33555 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00011111111111111111111111111111) (= (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33556 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33557 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00111111111111111111111111111111)) (bvsle (mask!29868 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33558 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15531 Unit!33559 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452809 lt!452805 (_vacant!2793 thiss!1427)))))) #b00111111111111111111111111111111)))))

(assert (=> b!1028795 d!123177))

(declare-fun b!1028914 () Bool)

(declare-fun c!104005 () Bool)

(assert (=> b!1028914 (= c!104005 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!580809 () ListLongMap!13675)

(declare-fun e!580817 () ListLongMap!13675)

(assert (=> b!1028914 (= e!580809 e!580817)))

(declare-fun bm!43321 () Bool)

(declare-fun call!43325 () ListLongMap!13675)

(declare-fun call!43328 () ListLongMap!13675)

(assert (=> bm!43321 (= call!43325 call!43328)))

(declare-fun b!1028915 () Bool)

(declare-fun e!580808 () Unit!33492)

(declare-fun lt!452930 () Unit!33492)

(assert (=> b!1028915 (= e!580808 lt!452930)))

(declare-fun lt!452923 () ListLongMap!13675)

(declare-fun getCurrentListMapNoExtraKeys!3559 (array!64677 array!64679 (_ BitVec 32) (_ BitVec 32) V!37259 V!37259 (_ BitVec 32) Int) ListLongMap!13675)

(assert (=> b!1028915 (= lt!452923 (getCurrentListMapNoExtraKeys!3559 lt!452809 lt!452805 (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452920 () (_ BitVec 64))

(assert (=> b!1028915 (= lt!452920 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452918 () (_ BitVec 64))

(assert (=> b!1028915 (= lt!452918 (select (arr!31141 lt!452809) #b00000000000000000000000000000000))))

(declare-fun lt!452922 () Unit!33492)

(declare-fun addStillContains!618 (ListLongMap!13675 (_ BitVec 64) V!37259 (_ BitVec 64)) Unit!33492)

(assert (=> b!1028915 (= lt!452922 (addStillContains!618 lt!452923 lt!452920 (zeroValue!5926 thiss!1427) lt!452918))))

(declare-fun contains!5987 (ListLongMap!13675 (_ BitVec 64)) Bool)

(declare-fun +!3119 (ListLongMap!13675 tuple2!15532) ListLongMap!13675)

(assert (=> b!1028915 (contains!5987 (+!3119 lt!452923 (tuple2!15533 lt!452920 (zeroValue!5926 thiss!1427))) lt!452918)))

(declare-fun lt!452915 () Unit!33492)

(assert (=> b!1028915 (= lt!452915 lt!452922)))

(declare-fun lt!452917 () ListLongMap!13675)

(assert (=> b!1028915 (= lt!452917 (getCurrentListMapNoExtraKeys!3559 lt!452809 lt!452805 (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452919 () (_ BitVec 64))

(assert (=> b!1028915 (= lt!452919 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452932 () (_ BitVec 64))

(assert (=> b!1028915 (= lt!452932 (select (arr!31141 lt!452809) #b00000000000000000000000000000000))))

(declare-fun lt!452935 () Unit!33492)

(declare-fun addApplyDifferent!474 (ListLongMap!13675 (_ BitVec 64) V!37259 (_ BitVec 64)) Unit!33492)

(assert (=> b!1028915 (= lt!452935 (addApplyDifferent!474 lt!452917 lt!452919 (minValue!5926 thiss!1427) lt!452932))))

(declare-fun apply!908 (ListLongMap!13675 (_ BitVec 64)) V!37259)

(assert (=> b!1028915 (= (apply!908 (+!3119 lt!452917 (tuple2!15533 lt!452919 (minValue!5926 thiss!1427))) lt!452932) (apply!908 lt!452917 lt!452932))))

(declare-fun lt!452928 () Unit!33492)

(assert (=> b!1028915 (= lt!452928 lt!452935)))

(declare-fun lt!452931 () ListLongMap!13675)

(assert (=> b!1028915 (= lt!452931 (getCurrentListMapNoExtraKeys!3559 lt!452809 lt!452805 (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452927 () (_ BitVec 64))

(assert (=> b!1028915 (= lt!452927 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452933 () (_ BitVec 64))

(assert (=> b!1028915 (= lt!452933 (select (arr!31141 lt!452809) #b00000000000000000000000000000000))))

(declare-fun lt!452924 () Unit!33492)

(assert (=> b!1028915 (= lt!452924 (addApplyDifferent!474 lt!452931 lt!452927 (zeroValue!5926 thiss!1427) lt!452933))))

(assert (=> b!1028915 (= (apply!908 (+!3119 lt!452931 (tuple2!15533 lt!452927 (zeroValue!5926 thiss!1427))) lt!452933) (apply!908 lt!452931 lt!452933))))

(declare-fun lt!452925 () Unit!33492)

(assert (=> b!1028915 (= lt!452925 lt!452924)))

(declare-fun lt!452921 () ListLongMap!13675)

(assert (=> b!1028915 (= lt!452921 (getCurrentListMapNoExtraKeys!3559 lt!452809 lt!452805 (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452916 () (_ BitVec 64))

(assert (=> b!1028915 (= lt!452916 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452934 () (_ BitVec 64))

(assert (=> b!1028915 (= lt!452934 (select (arr!31141 lt!452809) #b00000000000000000000000000000000))))

(assert (=> b!1028915 (= lt!452930 (addApplyDifferent!474 lt!452921 lt!452916 (minValue!5926 thiss!1427) lt!452934))))

(assert (=> b!1028915 (= (apply!908 (+!3119 lt!452921 (tuple2!15533 lt!452916 (minValue!5926 thiss!1427))) lt!452934) (apply!908 lt!452921 lt!452934))))

(declare-fun b!1028916 () Bool)

(declare-fun res!688282 () Bool)

(declare-fun e!580810 () Bool)

(assert (=> b!1028916 (=> (not res!688282) (not e!580810))))

(declare-fun e!580814 () Bool)

(assert (=> b!1028916 (= res!688282 e!580814)))

(declare-fun res!688281 () Bool)

(assert (=> b!1028916 (=> res!688281 e!580814)))

(declare-fun e!580819 () Bool)

(assert (=> b!1028916 (= res!688281 (not e!580819))))

(declare-fun res!688285 () Bool)

(assert (=> b!1028916 (=> (not res!688285) (not e!580819))))

(assert (=> b!1028916 (= res!688285 (bvslt #b00000000000000000000000000000000 (size!31655 lt!452809)))))

(declare-fun b!1028917 () Bool)

(declare-fun e!580813 () ListLongMap!13675)

(assert (=> b!1028917 (= e!580813 e!580809)))

(declare-fun c!104007 () Bool)

(assert (=> b!1028917 (= c!104007 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!123179 () Bool)

(assert (=> d!123179 e!580810))

(declare-fun res!688288 () Bool)

(assert (=> d!123179 (=> (not res!688288) (not e!580810))))

(assert (=> d!123179 (= res!688288 (or (bvsge #b00000000000000000000000000000000 (size!31655 lt!452809)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31655 lt!452809)))))))

(declare-fun lt!452929 () ListLongMap!13675)

(declare-fun lt!452926 () ListLongMap!13675)

(assert (=> d!123179 (= lt!452929 lt!452926)))

(declare-fun lt!452936 () Unit!33492)

(assert (=> d!123179 (= lt!452936 e!580808)))

(declare-fun c!104003 () Bool)

(declare-fun e!580807 () Bool)

(assert (=> d!123179 (= c!104003 e!580807)))

(declare-fun res!688286 () Bool)

(assert (=> d!123179 (=> (not res!688286) (not e!580807))))

(assert (=> d!123179 (= res!688286 (bvslt #b00000000000000000000000000000000 (size!31655 lt!452809)))))

(assert (=> d!123179 (= lt!452926 e!580813)))

(declare-fun c!104004 () Bool)

(assert (=> d!123179 (= c!104004 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123179 (validMask!0 (mask!29868 thiss!1427))))

(assert (=> d!123179 (= (getCurrentListMap!3899 lt!452809 lt!452805 (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)) lt!452929)))

(declare-fun b!1028918 () Bool)

(declare-fun e!580816 () Bool)

(assert (=> b!1028918 (= e!580816 (= (apply!908 lt!452929 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5926 thiss!1427)))))

(declare-fun bm!43322 () Bool)

(declare-fun call!43327 () ListLongMap!13675)

(declare-fun call!43326 () ListLongMap!13675)

(assert (=> bm!43322 (= call!43327 (+!3119 (ite c!104004 call!43328 (ite c!104007 call!43325 call!43326)) (ite (or c!104004 c!104007) (tuple2!15533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5926 thiss!1427)) (tuple2!15533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5926 thiss!1427)))))))

(declare-fun b!1028919 () Bool)

(declare-fun e!580815 () Bool)

(assert (=> b!1028919 (= e!580815 (= (apply!908 lt!452929 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5926 thiss!1427)))))

(declare-fun b!1028920 () Bool)

(declare-fun call!43324 () ListLongMap!13675)

(assert (=> b!1028920 (= e!580817 call!43324)))

(declare-fun b!1028921 () Bool)

(assert (=> b!1028921 (= e!580817 call!43326)))

(declare-fun b!1028922 () Bool)

(assert (=> b!1028922 (= e!580813 (+!3119 call!43327 (tuple2!15533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5926 thiss!1427))))))

(declare-fun b!1028923 () Bool)

(declare-fun e!580811 () Bool)

(declare-fun call!43329 () Bool)

(assert (=> b!1028923 (= e!580811 (not call!43329))))

(declare-fun b!1028924 () Bool)

(declare-fun Unit!33560 () Unit!33492)

(assert (=> b!1028924 (= e!580808 Unit!33560)))

(declare-fun b!1028925 () Bool)

(assert (=> b!1028925 (= e!580809 call!43324)))

(declare-fun bm!43323 () Bool)

(assert (=> bm!43323 (= call!43328 (getCurrentListMapNoExtraKeys!3559 lt!452809 lt!452805 (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun b!1028926 () Bool)

(declare-fun e!580812 () Bool)

(assert (=> b!1028926 (= e!580814 e!580812)))

(declare-fun res!688283 () Bool)

(assert (=> b!1028926 (=> (not res!688283) (not e!580812))))

(assert (=> b!1028926 (= res!688283 (contains!5987 lt!452929 (select (arr!31141 lt!452809) #b00000000000000000000000000000000)))))

(assert (=> b!1028926 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31655 lt!452809)))))

(declare-fun bm!43324 () Bool)

(assert (=> bm!43324 (= call!43324 call!43327)))

(declare-fun b!1028927 () Bool)

(assert (=> b!1028927 (= e!580810 e!580811)))

(declare-fun c!104002 () Bool)

(assert (=> b!1028927 (= c!104002 (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1028928 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1028928 (= e!580807 (validKeyInArray!0 (select (arr!31141 lt!452809) #b00000000000000000000000000000000)))))

(declare-fun b!1028929 () Bool)

(declare-fun e!580818 () Bool)

(assert (=> b!1028929 (= e!580818 e!580815)))

(declare-fun res!688287 () Bool)

(declare-fun call!43330 () Bool)

(assert (=> b!1028929 (= res!688287 call!43330)))

(assert (=> b!1028929 (=> (not res!688287) (not e!580815))))

(declare-fun bm!43325 () Bool)

(assert (=> bm!43325 (= call!43326 call!43325)))

(declare-fun bm!43326 () Bool)

(assert (=> bm!43326 (= call!43330 (contains!5987 lt!452929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028930 () Bool)

(assert (=> b!1028930 (= e!580819 (validKeyInArray!0 (select (arr!31141 lt!452809) #b00000000000000000000000000000000)))))

(declare-fun b!1028931 () Bool)

(assert (=> b!1028931 (= e!580818 (not call!43330))))

(declare-fun b!1028932 () Bool)

(declare-fun res!688289 () Bool)

(assert (=> b!1028932 (=> (not res!688289) (not e!580810))))

(assert (=> b!1028932 (= res!688289 e!580818)))

(declare-fun c!104006 () Bool)

(assert (=> b!1028932 (= c!104006 (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028933 () Bool)

(assert (=> b!1028933 (= e!580811 e!580816)))

(declare-fun res!688284 () Bool)

(assert (=> b!1028933 (= res!688284 call!43329)))

(assert (=> b!1028933 (=> (not res!688284) (not e!580816))))

(declare-fun bm!43327 () Bool)

(assert (=> bm!43327 (= call!43329 (contains!5987 lt!452929 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028934 () Bool)

(declare-fun get!16367 (ValueCell!11441 V!37259) V!37259)

(assert (=> b!1028934 (= e!580812 (= (apply!908 lt!452929 (select (arr!31141 lt!452809) #b00000000000000000000000000000000)) (get!16367 (select (arr!31142 lt!452805) #b00000000000000000000000000000000) (dynLambda!1970 (defaultEntry!6090 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31656 lt!452805)))))

(assert (=> b!1028934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31655 lt!452809)))))

(assert (= (and d!123179 c!104004) b!1028922))

(assert (= (and d!123179 (not c!104004)) b!1028917))

(assert (= (and b!1028917 c!104007) b!1028925))

(assert (= (and b!1028917 (not c!104007)) b!1028914))

(assert (= (and b!1028914 c!104005) b!1028920))

(assert (= (and b!1028914 (not c!104005)) b!1028921))

(assert (= (or b!1028920 b!1028921) bm!43325))

(assert (= (or b!1028925 bm!43325) bm!43321))

(assert (= (or b!1028925 b!1028920) bm!43324))

(assert (= (or b!1028922 bm!43321) bm!43323))

(assert (= (or b!1028922 bm!43324) bm!43322))

(assert (= (and d!123179 res!688286) b!1028928))

(assert (= (and d!123179 c!104003) b!1028915))

(assert (= (and d!123179 (not c!104003)) b!1028924))

(assert (= (and d!123179 res!688288) b!1028916))

(assert (= (and b!1028916 res!688285) b!1028930))

(assert (= (and b!1028916 (not res!688281)) b!1028926))

(assert (= (and b!1028926 res!688283) b!1028934))

(assert (= (and b!1028916 res!688282) b!1028932))

(assert (= (and b!1028932 c!104006) b!1028929))

(assert (= (and b!1028932 (not c!104006)) b!1028931))

(assert (= (and b!1028929 res!688287) b!1028919))

(assert (= (or b!1028929 b!1028931) bm!43326))

(assert (= (and b!1028932 res!688289) b!1028927))

(assert (= (and b!1028927 c!104002) b!1028933))

(assert (= (and b!1028927 (not c!104002)) b!1028923))

(assert (= (and b!1028933 res!688284) b!1028918))

(assert (= (or b!1028933 b!1028923) bm!43327))

(declare-fun b_lambda!15737 () Bool)

(assert (=> (not b_lambda!15737) (not b!1028934)))

(assert (=> b!1028934 t!30847))

(declare-fun b_and!32837 () Bool)

(assert (= b_and!32827 (and (=> t!30847 result!14081) b_and!32837)))

(declare-fun m!947769 () Bool)

(assert (=> b!1028928 m!947769))

(assert (=> b!1028928 m!947769))

(declare-fun m!947771 () Bool)

(assert (=> b!1028928 m!947771))

(declare-fun m!947773 () Bool)

(assert (=> bm!43322 m!947773))

(assert (=> d!123179 m!947757))

(assert (=> b!1028926 m!947769))

(assert (=> b!1028926 m!947769))

(declare-fun m!947775 () Bool)

(assert (=> b!1028926 m!947775))

(assert (=> b!1028930 m!947769))

(assert (=> b!1028930 m!947769))

(assert (=> b!1028930 m!947771))

(assert (=> b!1028934 m!947653))

(assert (=> b!1028934 m!947769))

(declare-fun m!947777 () Bool)

(assert (=> b!1028934 m!947777))

(declare-fun m!947779 () Bool)

(assert (=> b!1028934 m!947779))

(assert (=> b!1028934 m!947653))

(declare-fun m!947781 () Bool)

(assert (=> b!1028934 m!947781))

(assert (=> b!1028934 m!947779))

(assert (=> b!1028934 m!947769))

(declare-fun m!947783 () Bool)

(assert (=> bm!43323 m!947783))

(declare-fun m!947785 () Bool)

(assert (=> bm!43326 m!947785))

(declare-fun m!947787 () Bool)

(assert (=> b!1028919 m!947787))

(declare-fun m!947789 () Bool)

(assert (=> bm!43327 m!947789))

(declare-fun m!947791 () Bool)

(assert (=> b!1028915 m!947791))

(declare-fun m!947793 () Bool)

(assert (=> b!1028915 m!947793))

(declare-fun m!947795 () Bool)

(assert (=> b!1028915 m!947795))

(declare-fun m!947797 () Bool)

(assert (=> b!1028915 m!947797))

(declare-fun m!947799 () Bool)

(assert (=> b!1028915 m!947799))

(declare-fun m!947801 () Bool)

(assert (=> b!1028915 m!947801))

(declare-fun m!947803 () Bool)

(assert (=> b!1028915 m!947803))

(declare-fun m!947805 () Bool)

(assert (=> b!1028915 m!947805))

(declare-fun m!947807 () Bool)

(assert (=> b!1028915 m!947807))

(declare-fun m!947809 () Bool)

(assert (=> b!1028915 m!947809))

(assert (=> b!1028915 m!947807))

(assert (=> b!1028915 m!947799))

(assert (=> b!1028915 m!947797))

(declare-fun m!947811 () Bool)

(assert (=> b!1028915 m!947811))

(declare-fun m!947813 () Bool)

(assert (=> b!1028915 m!947813))

(assert (=> b!1028915 m!947769))

(declare-fun m!947815 () Bool)

(assert (=> b!1028915 m!947815))

(declare-fun m!947817 () Bool)

(assert (=> b!1028915 m!947817))

(assert (=> b!1028915 m!947793))

(assert (=> b!1028915 m!947783))

(declare-fun m!947819 () Bool)

(assert (=> b!1028915 m!947819))

(declare-fun m!947821 () Bool)

(assert (=> b!1028918 m!947821))

(declare-fun m!947823 () Bool)

(assert (=> b!1028922 m!947823))

(assert (=> b!1028795 d!123179))

(declare-fun d!123181 () Bool)

(declare-fun lt!452939 () ListLongMap!13675)

(assert (=> d!123181 (not (contains!5987 lt!452939 key!909))))

(declare-fun removeStrictlySorted!48 (List!21792 (_ BitVec 64)) List!21792)

(assert (=> d!123181 (= lt!452939 (ListLongMap!13676 (removeStrictlySorted!48 (toList!6853 (getCurrentListMap!3899 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427))) key!909)))))

(assert (=> d!123181 (= (-!476 (getCurrentListMap!3899 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)) key!909) lt!452939)))

(declare-fun bs!30010 () Bool)

(assert (= bs!30010 d!123181))

(declare-fun m!947825 () Bool)

(assert (=> bs!30010 m!947825))

(declare-fun m!947827 () Bool)

(assert (=> bs!30010 m!947827))

(assert (=> b!1028795 d!123181))

(declare-fun d!123183 () Bool)

(declare-fun res!688294 () Bool)

(declare-fun e!580824 () Bool)

(assert (=> d!123183 (=> res!688294 e!580824)))

(assert (=> d!123183 (= res!688294 (= (select (arr!31141 lt!452809) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123183 (= (arrayContainsKey!0 lt!452809 key!909 #b00000000000000000000000000000000) e!580824)))

(declare-fun b!1028939 () Bool)

(declare-fun e!580825 () Bool)

(assert (=> b!1028939 (= e!580824 e!580825)))

(declare-fun res!688295 () Bool)

(assert (=> b!1028939 (=> (not res!688295) (not e!580825))))

(assert (=> b!1028939 (= res!688295 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31655 lt!452809)))))

(declare-fun b!1028940 () Bool)

(assert (=> b!1028940 (= e!580825 (arrayContainsKey!0 lt!452809 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123183 (not res!688294)) b!1028939))

(assert (= (and b!1028939 res!688295) b!1028940))

(assert (=> d!123183 m!947769))

(declare-fun m!947829 () Bool)

(assert (=> b!1028940 m!947829))

(assert (=> b!1028795 d!123183))

(declare-fun b!1028949 () Bool)

(declare-fun e!580833 () Bool)

(declare-fun call!43333 () Bool)

(assert (=> b!1028949 (= e!580833 call!43333)))

(declare-fun d!123185 () Bool)

(declare-fun res!688300 () Bool)

(declare-fun e!580834 () Bool)

(assert (=> d!123185 (=> res!688300 e!580834)))

(assert (=> d!123185 (= res!688300 (bvsge #b00000000000000000000000000000000 (size!31655 lt!452809)))))

(assert (=> d!123185 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452809 (mask!29868 thiss!1427)) e!580834)))

(declare-fun bm!43330 () Bool)

(assert (=> bm!43330 (= call!43333 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!452809 (mask!29868 thiss!1427)))))

(declare-fun b!1028950 () Bool)

(assert (=> b!1028950 (= e!580834 e!580833)))

(declare-fun c!104010 () Bool)

(assert (=> b!1028950 (= c!104010 (validKeyInArray!0 (select (arr!31141 lt!452809) #b00000000000000000000000000000000)))))

(declare-fun b!1028951 () Bool)

(declare-fun e!580832 () Bool)

(assert (=> b!1028951 (= e!580832 call!43333)))

(declare-fun b!1028952 () Bool)

(assert (=> b!1028952 (= e!580833 e!580832)))

(declare-fun lt!452947 () (_ BitVec 64))

(assert (=> b!1028952 (= lt!452947 (select (arr!31141 lt!452809) #b00000000000000000000000000000000))))

(declare-fun lt!452946 () Unit!33492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64677 (_ BitVec 64) (_ BitVec 32)) Unit!33492)

(assert (=> b!1028952 (= lt!452946 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452809 lt!452947 #b00000000000000000000000000000000))))

(assert (=> b!1028952 (arrayContainsKey!0 lt!452809 lt!452947 #b00000000000000000000000000000000)))

(declare-fun lt!452948 () Unit!33492)

(assert (=> b!1028952 (= lt!452948 lt!452946)))

(declare-fun res!688301 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64677 (_ BitVec 32)) SeekEntryResult!9628)

(assert (=> b!1028952 (= res!688301 (= (seekEntryOrOpen!0 (select (arr!31141 lt!452809) #b00000000000000000000000000000000) lt!452809 (mask!29868 thiss!1427)) (Found!9628 #b00000000000000000000000000000000)))))

(assert (=> b!1028952 (=> (not res!688301) (not e!580832))))

(assert (= (and d!123185 (not res!688300)) b!1028950))

(assert (= (and b!1028950 c!104010) b!1028952))

(assert (= (and b!1028950 (not c!104010)) b!1028949))

(assert (= (and b!1028952 res!688301) b!1028951))

(assert (= (or b!1028951 b!1028949) bm!43330))

(declare-fun m!947831 () Bool)

(assert (=> bm!43330 m!947831))

(assert (=> b!1028950 m!947769))

(assert (=> b!1028950 m!947769))

(assert (=> b!1028950 m!947771))

(assert (=> b!1028952 m!947769))

(declare-fun m!947833 () Bool)

(assert (=> b!1028952 m!947833))

(declare-fun m!947835 () Bool)

(assert (=> b!1028952 m!947835))

(assert (=> b!1028952 m!947769))

(declare-fun m!947837 () Bool)

(assert (=> b!1028952 m!947837))

(assert (=> b!1028795 d!123185))

(declare-fun bm!43333 () Bool)

(declare-fun call!43336 () (_ BitVec 32))

(assert (=> bm!43333 (= call!43336 (arrayCountValidKeys!0 (_keys!11275 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31655 (_keys!11275 thiss!1427))))))

(declare-fun b!1028962 () Bool)

(declare-fun e!580839 () (_ BitVec 32))

(assert (=> b!1028962 (= e!580839 call!43336)))

(declare-fun b!1028963 () Bool)

(declare-fun e!580840 () (_ BitVec 32))

(assert (=> b!1028963 (= e!580840 #b00000000000000000000000000000000)))

(declare-fun b!1028964 () Bool)

(assert (=> b!1028964 (= e!580839 (bvadd #b00000000000000000000000000000001 call!43336))))

(declare-fun d!123187 () Bool)

(declare-fun lt!452951 () (_ BitVec 32))

(assert (=> d!123187 (and (bvsge lt!452951 #b00000000000000000000000000000000) (bvsle lt!452951 (bvsub (size!31655 (_keys!11275 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123187 (= lt!452951 e!580840)))

(declare-fun c!104016 () Bool)

(assert (=> d!123187 (= c!104016 (bvsge #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))))))

(assert (=> d!123187 (and (bvsle #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31655 (_keys!11275 thiss!1427)) (size!31655 (_keys!11275 thiss!1427))))))

(assert (=> d!123187 (= (arrayCountValidKeys!0 (_keys!11275 thiss!1427) #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))) lt!452951)))

(declare-fun b!1028961 () Bool)

(assert (=> b!1028961 (= e!580840 e!580839)))

(declare-fun c!104015 () Bool)

(assert (=> b!1028961 (= c!104015 (validKeyInArray!0 (select (arr!31141 (_keys!11275 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123187 c!104016) b!1028963))

(assert (= (and d!123187 (not c!104016)) b!1028961))

(assert (= (and b!1028961 c!104015) b!1028964))

(assert (= (and b!1028961 (not c!104015)) b!1028962))

(assert (= (or b!1028964 b!1028962) bm!43333))

(declare-fun m!947839 () Bool)

(assert (=> bm!43333 m!947839))

(declare-fun m!947841 () Bool)

(assert (=> b!1028961 m!947841))

(assert (=> b!1028961 m!947841))

(declare-fun m!947843 () Bool)

(assert (=> b!1028961 m!947843))

(assert (=> b!1028795 d!123187))

(declare-fun bm!43334 () Bool)

(declare-fun call!43337 () (_ BitVec 32))

(assert (=> bm!43334 (= call!43337 (arrayCountValidKeys!0 lt!452809 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31655 (_keys!11275 thiss!1427))))))

(declare-fun b!1028966 () Bool)

(declare-fun e!580841 () (_ BitVec 32))

(assert (=> b!1028966 (= e!580841 call!43337)))

(declare-fun b!1028967 () Bool)

(declare-fun e!580842 () (_ BitVec 32))

(assert (=> b!1028967 (= e!580842 #b00000000000000000000000000000000)))

(declare-fun b!1028968 () Bool)

(assert (=> b!1028968 (= e!580841 (bvadd #b00000000000000000000000000000001 call!43337))))

(declare-fun d!123189 () Bool)

(declare-fun lt!452952 () (_ BitVec 32))

(assert (=> d!123189 (and (bvsge lt!452952 #b00000000000000000000000000000000) (bvsle lt!452952 (bvsub (size!31655 lt!452809) #b00000000000000000000000000000000)))))

(assert (=> d!123189 (= lt!452952 e!580842)))

(declare-fun c!104018 () Bool)

(assert (=> d!123189 (= c!104018 (bvsge #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))))))

(assert (=> d!123189 (and (bvsle #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31655 (_keys!11275 thiss!1427)) (size!31655 lt!452809)))))

(assert (=> d!123189 (= (arrayCountValidKeys!0 lt!452809 #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))) lt!452952)))

(declare-fun b!1028965 () Bool)

(assert (=> b!1028965 (= e!580842 e!580841)))

(declare-fun c!104017 () Bool)

(assert (=> b!1028965 (= c!104017 (validKeyInArray!0 (select (arr!31141 lt!452809) #b00000000000000000000000000000000)))))

(assert (= (and d!123189 c!104018) b!1028967))

(assert (= (and d!123189 (not c!104018)) b!1028965))

(assert (= (and b!1028965 c!104017) b!1028968))

(assert (= (and b!1028965 (not c!104017)) b!1028966))

(assert (= (or b!1028968 b!1028966) bm!43334))

(declare-fun m!947845 () Bool)

(assert (=> bm!43334 m!947845))

(assert (=> b!1028965 m!947769))

(assert (=> b!1028965 m!947769))

(assert (=> b!1028965 m!947771))

(assert (=> b!1028795 d!123189))

(declare-fun d!123191 () Bool)

(declare-fun e!580845 () Bool)

(assert (=> d!123191 e!580845))

(declare-fun res!688304 () Bool)

(assert (=> d!123191 (=> (not res!688304) (not e!580845))))

(assert (=> d!123191 (= res!688304 (bvslt (index!40884 lt!452806) (size!31655 (_keys!11275 thiss!1427))))))

(declare-fun lt!452955 () Unit!33492)

(declare-fun choose!121 (array!64677 (_ BitVec 32) (_ BitVec 64)) Unit!33492)

(assert (=> d!123191 (= lt!452955 (choose!121 (_keys!11275 thiss!1427) (index!40884 lt!452806) key!909))))

(assert (=> d!123191 (bvsge (index!40884 lt!452806) #b00000000000000000000000000000000)))

(assert (=> d!123191 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11275 thiss!1427) (index!40884 lt!452806) key!909) lt!452955)))

(declare-fun b!1028971 () Bool)

(assert (=> b!1028971 (= e!580845 (not (arrayContainsKey!0 (array!64678 (store (arr!31141 (_keys!11275 thiss!1427)) (index!40884 lt!452806) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31655 (_keys!11275 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123191 res!688304) b!1028971))

(declare-fun m!947847 () Bool)

(assert (=> d!123191 m!947847))

(assert (=> b!1028971 m!947651))

(declare-fun m!947849 () Bool)

(assert (=> b!1028971 m!947849))

(assert (=> b!1028795 d!123191))

(declare-fun b!1028972 () Bool)

(declare-fun c!104022 () Bool)

(assert (=> b!1028972 (= c!104022 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!580848 () ListLongMap!13675)

(declare-fun e!580856 () ListLongMap!13675)

(assert (=> b!1028972 (= e!580848 e!580856)))

(declare-fun bm!43335 () Bool)

(declare-fun call!43339 () ListLongMap!13675)

(declare-fun call!43342 () ListLongMap!13675)

(assert (=> bm!43335 (= call!43339 call!43342)))

(declare-fun b!1028973 () Bool)

(declare-fun e!580847 () Unit!33492)

(declare-fun lt!452971 () Unit!33492)

(assert (=> b!1028973 (= e!580847 lt!452971)))

(declare-fun lt!452964 () ListLongMap!13675)

(assert (=> b!1028973 (= lt!452964 (getCurrentListMapNoExtraKeys!3559 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452961 () (_ BitVec 64))

(assert (=> b!1028973 (= lt!452961 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452959 () (_ BitVec 64))

(assert (=> b!1028973 (= lt!452959 (select (arr!31141 (_keys!11275 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452963 () Unit!33492)

(assert (=> b!1028973 (= lt!452963 (addStillContains!618 lt!452964 lt!452961 (zeroValue!5926 thiss!1427) lt!452959))))

(assert (=> b!1028973 (contains!5987 (+!3119 lt!452964 (tuple2!15533 lt!452961 (zeroValue!5926 thiss!1427))) lt!452959)))

(declare-fun lt!452956 () Unit!33492)

(assert (=> b!1028973 (= lt!452956 lt!452963)))

(declare-fun lt!452958 () ListLongMap!13675)

(assert (=> b!1028973 (= lt!452958 (getCurrentListMapNoExtraKeys!3559 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452960 () (_ BitVec 64))

(assert (=> b!1028973 (= lt!452960 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452973 () (_ BitVec 64))

(assert (=> b!1028973 (= lt!452973 (select (arr!31141 (_keys!11275 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452976 () Unit!33492)

(assert (=> b!1028973 (= lt!452976 (addApplyDifferent!474 lt!452958 lt!452960 (minValue!5926 thiss!1427) lt!452973))))

(assert (=> b!1028973 (= (apply!908 (+!3119 lt!452958 (tuple2!15533 lt!452960 (minValue!5926 thiss!1427))) lt!452973) (apply!908 lt!452958 lt!452973))))

(declare-fun lt!452969 () Unit!33492)

(assert (=> b!1028973 (= lt!452969 lt!452976)))

(declare-fun lt!452972 () ListLongMap!13675)

(assert (=> b!1028973 (= lt!452972 (getCurrentListMapNoExtraKeys!3559 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452968 () (_ BitVec 64))

(assert (=> b!1028973 (= lt!452968 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452974 () (_ BitVec 64))

(assert (=> b!1028973 (= lt!452974 (select (arr!31141 (_keys!11275 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452965 () Unit!33492)

(assert (=> b!1028973 (= lt!452965 (addApplyDifferent!474 lt!452972 lt!452968 (zeroValue!5926 thiss!1427) lt!452974))))

(assert (=> b!1028973 (= (apply!908 (+!3119 lt!452972 (tuple2!15533 lt!452968 (zeroValue!5926 thiss!1427))) lt!452974) (apply!908 lt!452972 lt!452974))))

(declare-fun lt!452966 () Unit!33492)

(assert (=> b!1028973 (= lt!452966 lt!452965)))

(declare-fun lt!452962 () ListLongMap!13675)

(assert (=> b!1028973 (= lt!452962 (getCurrentListMapNoExtraKeys!3559 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452957 () (_ BitVec 64))

(assert (=> b!1028973 (= lt!452957 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452975 () (_ BitVec 64))

(assert (=> b!1028973 (= lt!452975 (select (arr!31141 (_keys!11275 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028973 (= lt!452971 (addApplyDifferent!474 lt!452962 lt!452957 (minValue!5926 thiss!1427) lt!452975))))

(assert (=> b!1028973 (= (apply!908 (+!3119 lt!452962 (tuple2!15533 lt!452957 (minValue!5926 thiss!1427))) lt!452975) (apply!908 lt!452962 lt!452975))))

(declare-fun b!1028974 () Bool)

(declare-fun res!688306 () Bool)

(declare-fun e!580849 () Bool)

(assert (=> b!1028974 (=> (not res!688306) (not e!580849))))

(declare-fun e!580853 () Bool)

(assert (=> b!1028974 (= res!688306 e!580853)))

(declare-fun res!688305 () Bool)

(assert (=> b!1028974 (=> res!688305 e!580853)))

(declare-fun e!580858 () Bool)

(assert (=> b!1028974 (= res!688305 (not e!580858))))

(declare-fun res!688309 () Bool)

(assert (=> b!1028974 (=> (not res!688309) (not e!580858))))

(assert (=> b!1028974 (= res!688309 (bvslt #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))))))

(declare-fun b!1028975 () Bool)

(declare-fun e!580852 () ListLongMap!13675)

(assert (=> b!1028975 (= e!580852 e!580848)))

(declare-fun c!104024 () Bool)

(assert (=> b!1028975 (= c!104024 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!123193 () Bool)

(assert (=> d!123193 e!580849))

(declare-fun res!688312 () Bool)

(assert (=> d!123193 (=> (not res!688312) (not e!580849))))

(assert (=> d!123193 (= res!688312 (or (bvsge #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))))))))

(declare-fun lt!452970 () ListLongMap!13675)

(declare-fun lt!452967 () ListLongMap!13675)

(assert (=> d!123193 (= lt!452970 lt!452967)))

(declare-fun lt!452977 () Unit!33492)

(assert (=> d!123193 (= lt!452977 e!580847)))

(declare-fun c!104020 () Bool)

(declare-fun e!580846 () Bool)

(assert (=> d!123193 (= c!104020 e!580846)))

(declare-fun res!688310 () Bool)

(assert (=> d!123193 (=> (not res!688310) (not e!580846))))

(assert (=> d!123193 (= res!688310 (bvslt #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))))))

(assert (=> d!123193 (= lt!452967 e!580852)))

(declare-fun c!104021 () Bool)

(assert (=> d!123193 (= c!104021 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123193 (validMask!0 (mask!29868 thiss!1427))))

(assert (=> d!123193 (= (getCurrentListMap!3899 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)) lt!452970)))

(declare-fun b!1028976 () Bool)

(declare-fun e!580855 () Bool)

(assert (=> b!1028976 (= e!580855 (= (apply!908 lt!452970 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5926 thiss!1427)))))

(declare-fun bm!43336 () Bool)

(declare-fun call!43340 () ListLongMap!13675)

(declare-fun call!43341 () ListLongMap!13675)

(assert (=> bm!43336 (= call!43341 (+!3119 (ite c!104021 call!43342 (ite c!104024 call!43339 call!43340)) (ite (or c!104021 c!104024) (tuple2!15533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5926 thiss!1427)) (tuple2!15533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5926 thiss!1427)))))))

(declare-fun b!1028977 () Bool)

(declare-fun e!580854 () Bool)

(assert (=> b!1028977 (= e!580854 (= (apply!908 lt!452970 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5926 thiss!1427)))))

(declare-fun b!1028978 () Bool)

(declare-fun call!43338 () ListLongMap!13675)

(assert (=> b!1028978 (= e!580856 call!43338)))

(declare-fun b!1028979 () Bool)

(assert (=> b!1028979 (= e!580856 call!43340)))

(declare-fun b!1028980 () Bool)

(assert (=> b!1028980 (= e!580852 (+!3119 call!43341 (tuple2!15533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5926 thiss!1427))))))

(declare-fun b!1028981 () Bool)

(declare-fun e!580850 () Bool)

(declare-fun call!43343 () Bool)

(assert (=> b!1028981 (= e!580850 (not call!43343))))

(declare-fun b!1028982 () Bool)

(declare-fun Unit!33561 () Unit!33492)

(assert (=> b!1028982 (= e!580847 Unit!33561)))

(declare-fun b!1028983 () Bool)

(assert (=> b!1028983 (= e!580848 call!43338)))

(declare-fun bm!43337 () Bool)

(assert (=> bm!43337 (= call!43342 (getCurrentListMapNoExtraKeys!3559 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun b!1028984 () Bool)

(declare-fun e!580851 () Bool)

(assert (=> b!1028984 (= e!580853 e!580851)))

(declare-fun res!688307 () Bool)

(assert (=> b!1028984 (=> (not res!688307) (not e!580851))))

(assert (=> b!1028984 (= res!688307 (contains!5987 lt!452970 (select (arr!31141 (_keys!11275 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028984 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))))))

(declare-fun bm!43338 () Bool)

(assert (=> bm!43338 (= call!43338 call!43341)))

(declare-fun b!1028985 () Bool)

(assert (=> b!1028985 (= e!580849 e!580850)))

(declare-fun c!104019 () Bool)

(assert (=> b!1028985 (= c!104019 (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1028986 () Bool)

(assert (=> b!1028986 (= e!580846 (validKeyInArray!0 (select (arr!31141 (_keys!11275 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028987 () Bool)

(declare-fun e!580857 () Bool)

(assert (=> b!1028987 (= e!580857 e!580854)))

(declare-fun res!688311 () Bool)

(declare-fun call!43344 () Bool)

(assert (=> b!1028987 (= res!688311 call!43344)))

(assert (=> b!1028987 (=> (not res!688311) (not e!580854))))

(declare-fun bm!43339 () Bool)

(assert (=> bm!43339 (= call!43340 call!43339)))

(declare-fun bm!43340 () Bool)

(assert (=> bm!43340 (= call!43344 (contains!5987 lt!452970 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028988 () Bool)

(assert (=> b!1028988 (= e!580858 (validKeyInArray!0 (select (arr!31141 (_keys!11275 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028989 () Bool)

(assert (=> b!1028989 (= e!580857 (not call!43344))))

(declare-fun b!1028990 () Bool)

(declare-fun res!688313 () Bool)

(assert (=> b!1028990 (=> (not res!688313) (not e!580849))))

(assert (=> b!1028990 (= res!688313 e!580857)))

(declare-fun c!104023 () Bool)

(assert (=> b!1028990 (= c!104023 (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028991 () Bool)

(assert (=> b!1028991 (= e!580850 e!580855)))

(declare-fun res!688308 () Bool)

(assert (=> b!1028991 (= res!688308 call!43343)))

(assert (=> b!1028991 (=> (not res!688308) (not e!580855))))

(declare-fun bm!43341 () Bool)

(assert (=> bm!43341 (= call!43343 (contains!5987 lt!452970 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028992 () Bool)

(assert (=> b!1028992 (= e!580851 (= (apply!908 lt!452970 (select (arr!31141 (_keys!11275 thiss!1427)) #b00000000000000000000000000000000)) (get!16367 (select (arr!31142 (_values!6113 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1970 (defaultEntry!6090 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028992 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31656 (_values!6113 thiss!1427))))))

(assert (=> b!1028992 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))))))

(assert (= (and d!123193 c!104021) b!1028980))

(assert (= (and d!123193 (not c!104021)) b!1028975))

(assert (= (and b!1028975 c!104024) b!1028983))

(assert (= (and b!1028975 (not c!104024)) b!1028972))

(assert (= (and b!1028972 c!104022) b!1028978))

(assert (= (and b!1028972 (not c!104022)) b!1028979))

(assert (= (or b!1028978 b!1028979) bm!43339))

(assert (= (or b!1028983 bm!43339) bm!43335))

(assert (= (or b!1028983 b!1028978) bm!43338))

(assert (= (or b!1028980 bm!43335) bm!43337))

(assert (= (or b!1028980 bm!43338) bm!43336))

(assert (= (and d!123193 res!688310) b!1028986))

(assert (= (and d!123193 c!104020) b!1028973))

(assert (= (and d!123193 (not c!104020)) b!1028982))

(assert (= (and d!123193 res!688312) b!1028974))

(assert (= (and b!1028974 res!688309) b!1028988))

(assert (= (and b!1028974 (not res!688305)) b!1028984))

(assert (= (and b!1028984 res!688307) b!1028992))

(assert (= (and b!1028974 res!688306) b!1028990))

(assert (= (and b!1028990 c!104023) b!1028987))

(assert (= (and b!1028990 (not c!104023)) b!1028989))

(assert (= (and b!1028987 res!688311) b!1028977))

(assert (= (or b!1028987 b!1028989) bm!43340))

(assert (= (and b!1028990 res!688313) b!1028985))

(assert (= (and b!1028985 c!104019) b!1028991))

(assert (= (and b!1028985 (not c!104019)) b!1028981))

(assert (= (and b!1028991 res!688308) b!1028976))

(assert (= (or b!1028991 b!1028981) bm!43341))

(declare-fun b_lambda!15739 () Bool)

(assert (=> (not b_lambda!15739) (not b!1028992)))

(assert (=> b!1028992 t!30847))

(declare-fun b_and!32839 () Bool)

(assert (= b_and!32837 (and (=> t!30847 result!14081) b_and!32839)))

(assert (=> b!1028986 m!947841))

(assert (=> b!1028986 m!947841))

(assert (=> b!1028986 m!947843))

(declare-fun m!947851 () Bool)

(assert (=> bm!43336 m!947851))

(assert (=> d!123193 m!947757))

(assert (=> b!1028984 m!947841))

(assert (=> b!1028984 m!947841))

(declare-fun m!947853 () Bool)

(assert (=> b!1028984 m!947853))

(assert (=> b!1028988 m!947841))

(assert (=> b!1028988 m!947841))

(assert (=> b!1028988 m!947843))

(assert (=> b!1028992 m!947653))

(assert (=> b!1028992 m!947841))

(declare-fun m!947855 () Bool)

(assert (=> b!1028992 m!947855))

(declare-fun m!947857 () Bool)

(assert (=> b!1028992 m!947857))

(assert (=> b!1028992 m!947653))

(declare-fun m!947859 () Bool)

(assert (=> b!1028992 m!947859))

(assert (=> b!1028992 m!947857))

(assert (=> b!1028992 m!947841))

(declare-fun m!947861 () Bool)

(assert (=> bm!43337 m!947861))

(declare-fun m!947863 () Bool)

(assert (=> bm!43340 m!947863))

(declare-fun m!947865 () Bool)

(assert (=> b!1028977 m!947865))

(declare-fun m!947867 () Bool)

(assert (=> bm!43341 m!947867))

(declare-fun m!947869 () Bool)

(assert (=> b!1028973 m!947869))

(declare-fun m!947871 () Bool)

(assert (=> b!1028973 m!947871))

(declare-fun m!947873 () Bool)

(assert (=> b!1028973 m!947873))

(declare-fun m!947875 () Bool)

(assert (=> b!1028973 m!947875))

(declare-fun m!947877 () Bool)

(assert (=> b!1028973 m!947877))

(declare-fun m!947879 () Bool)

(assert (=> b!1028973 m!947879))

(declare-fun m!947881 () Bool)

(assert (=> b!1028973 m!947881))

(declare-fun m!947883 () Bool)

(assert (=> b!1028973 m!947883))

(declare-fun m!947885 () Bool)

(assert (=> b!1028973 m!947885))

(declare-fun m!947887 () Bool)

(assert (=> b!1028973 m!947887))

(assert (=> b!1028973 m!947885))

(assert (=> b!1028973 m!947877))

(assert (=> b!1028973 m!947875))

(declare-fun m!947889 () Bool)

(assert (=> b!1028973 m!947889))

(declare-fun m!947891 () Bool)

(assert (=> b!1028973 m!947891))

(assert (=> b!1028973 m!947841))

(declare-fun m!947893 () Bool)

(assert (=> b!1028973 m!947893))

(declare-fun m!947895 () Bool)

(assert (=> b!1028973 m!947895))

(assert (=> b!1028973 m!947871))

(assert (=> b!1028973 m!947861))

(declare-fun m!947897 () Bool)

(assert (=> b!1028973 m!947897))

(declare-fun m!947899 () Bool)

(assert (=> b!1028976 m!947899))

(declare-fun m!947901 () Bool)

(assert (=> b!1028980 m!947901))

(assert (=> b!1028795 d!123193))

(declare-fun d!123195 () Bool)

(declare-fun e!580861 () Bool)

(assert (=> d!123195 e!580861))

(declare-fun res!688316 () Bool)

(assert (=> d!123195 (=> (not res!688316) (not e!580861))))

(assert (=> d!123195 (= res!688316 (and (bvsge (index!40884 lt!452806) #b00000000000000000000000000000000) (bvslt (index!40884 lt!452806) (size!31655 (_keys!11275 thiss!1427)))))))

(declare-fun lt!452980 () Unit!33492)

(declare-fun choose!25 (array!64677 (_ BitVec 32) (_ BitVec 32)) Unit!33492)

(assert (=> d!123195 (= lt!452980 (choose!25 (_keys!11275 thiss!1427) (index!40884 lt!452806) (mask!29868 thiss!1427)))))

(assert (=> d!123195 (validMask!0 (mask!29868 thiss!1427))))

(assert (=> d!123195 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11275 thiss!1427) (index!40884 lt!452806) (mask!29868 thiss!1427)) lt!452980)))

(declare-fun b!1028995 () Bool)

(assert (=> b!1028995 (= e!580861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64678 (store (arr!31141 (_keys!11275 thiss!1427)) (index!40884 lt!452806) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31655 (_keys!11275 thiss!1427))) (mask!29868 thiss!1427)))))

(assert (= (and d!123195 res!688316) b!1028995))

(declare-fun m!947903 () Bool)

(assert (=> d!123195 m!947903))

(assert (=> d!123195 m!947757))

(assert (=> b!1028995 m!947651))

(declare-fun m!947905 () Bool)

(assert (=> b!1028995 m!947905))

(assert (=> b!1028795 d!123195))

(declare-fun b!1029004 () Bool)

(declare-fun res!688325 () Bool)

(declare-fun e!580867 () Bool)

(assert (=> b!1029004 (=> (not res!688325) (not e!580867))))

(assert (=> b!1029004 (= res!688325 (validKeyInArray!0 (select (arr!31141 (_keys!11275 thiss!1427)) (index!40884 lt!452806))))))

(declare-fun d!123197 () Bool)

(declare-fun e!580866 () Bool)

(assert (=> d!123197 e!580866))

(declare-fun res!688326 () Bool)

(assert (=> d!123197 (=> (not res!688326) (not e!580866))))

(assert (=> d!123197 (= res!688326 (and (bvsge (index!40884 lt!452806) #b00000000000000000000000000000000) (bvslt (index!40884 lt!452806) (size!31655 (_keys!11275 thiss!1427)))))))

(declare-fun lt!452983 () Unit!33492)

(declare-fun choose!82 (array!64677 (_ BitVec 32) (_ BitVec 64)) Unit!33492)

(assert (=> d!123197 (= lt!452983 (choose!82 (_keys!11275 thiss!1427) (index!40884 lt!452806) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123197 e!580867))

(declare-fun res!688327 () Bool)

(assert (=> d!123197 (=> (not res!688327) (not e!580867))))

(assert (=> d!123197 (= res!688327 (and (bvsge (index!40884 lt!452806) #b00000000000000000000000000000000) (bvslt (index!40884 lt!452806) (size!31655 (_keys!11275 thiss!1427)))))))

(assert (=> d!123197 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11275 thiss!1427) (index!40884 lt!452806) #b1000000000000000000000000000000000000000000000000000000000000000) lt!452983)))

(declare-fun b!1029006 () Bool)

(assert (=> b!1029006 (= e!580867 (bvslt (size!31655 (_keys!11275 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1029005 () Bool)

(declare-fun res!688328 () Bool)

(assert (=> b!1029005 (=> (not res!688328) (not e!580867))))

(assert (=> b!1029005 (= res!688328 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029007 () Bool)

(assert (=> b!1029007 (= e!580866 (= (arrayCountValidKeys!0 (array!64678 (store (arr!31141 (_keys!11275 thiss!1427)) (index!40884 lt!452806) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31655 (_keys!11275 thiss!1427))) #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11275 thiss!1427) #b00000000000000000000000000000000 (size!31655 (_keys!11275 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!123197 res!688327) b!1029004))

(assert (= (and b!1029004 res!688325) b!1029005))

(assert (= (and b!1029005 res!688328) b!1029006))

(assert (= (and d!123197 res!688326) b!1029007))

(declare-fun m!947907 () Bool)

(assert (=> b!1029004 m!947907))

(assert (=> b!1029004 m!947907))

(declare-fun m!947909 () Bool)

(assert (=> b!1029004 m!947909))

(declare-fun m!947911 () Bool)

(assert (=> d!123197 m!947911))

(declare-fun m!947913 () Bool)

(assert (=> b!1029005 m!947913))

(assert (=> b!1029007 m!947651))

(declare-fun m!947915 () Bool)

(assert (=> b!1029007 m!947915))

(assert (=> b!1029007 m!947637))

(assert (=> b!1028795 d!123197))

(declare-fun b!1029018 () Bool)

(declare-fun e!580877 () Bool)

(declare-fun contains!5988 (List!21793 (_ BitVec 64)) Bool)

(assert (=> b!1029018 (= e!580877 (contains!5988 Nil!21790 (select (arr!31141 lt!452809) #b00000000000000000000000000000000)))))

(declare-fun b!1029019 () Bool)

(declare-fun e!580876 () Bool)

(declare-fun call!43347 () Bool)

(assert (=> b!1029019 (= e!580876 call!43347)))

(declare-fun b!1029020 () Bool)

(assert (=> b!1029020 (= e!580876 call!43347)))

(declare-fun d!123199 () Bool)

(declare-fun res!688337 () Bool)

(declare-fun e!580878 () Bool)

(assert (=> d!123199 (=> res!688337 e!580878)))

(assert (=> d!123199 (= res!688337 (bvsge #b00000000000000000000000000000000 (size!31655 lt!452809)))))

(assert (=> d!123199 (= (arrayNoDuplicates!0 lt!452809 #b00000000000000000000000000000000 Nil!21790) e!580878)))

(declare-fun b!1029021 () Bool)

(declare-fun e!580879 () Bool)

(assert (=> b!1029021 (= e!580878 e!580879)))

(declare-fun res!688335 () Bool)

(assert (=> b!1029021 (=> (not res!688335) (not e!580879))))

(assert (=> b!1029021 (= res!688335 (not e!580877))))

(declare-fun res!688336 () Bool)

(assert (=> b!1029021 (=> (not res!688336) (not e!580877))))

(assert (=> b!1029021 (= res!688336 (validKeyInArray!0 (select (arr!31141 lt!452809) #b00000000000000000000000000000000)))))

(declare-fun bm!43344 () Bool)

(declare-fun c!104027 () Bool)

(assert (=> bm!43344 (= call!43347 (arrayNoDuplicates!0 lt!452809 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104027 (Cons!21789 (select (arr!31141 lt!452809) #b00000000000000000000000000000000) Nil!21790) Nil!21790)))))

(declare-fun b!1029022 () Bool)

(assert (=> b!1029022 (= e!580879 e!580876)))

(assert (=> b!1029022 (= c!104027 (validKeyInArray!0 (select (arr!31141 lt!452809) #b00000000000000000000000000000000)))))

(assert (= (and d!123199 (not res!688337)) b!1029021))

(assert (= (and b!1029021 res!688336) b!1029018))

(assert (= (and b!1029021 res!688335) b!1029022))

(assert (= (and b!1029022 c!104027) b!1029019))

(assert (= (and b!1029022 (not c!104027)) b!1029020))

(assert (= (or b!1029019 b!1029020) bm!43344))

(assert (=> b!1029018 m!947769))

(assert (=> b!1029018 m!947769))

(declare-fun m!947917 () Bool)

(assert (=> b!1029018 m!947917))

(assert (=> b!1029021 m!947769))

(assert (=> b!1029021 m!947769))

(assert (=> b!1029021 m!947771))

(assert (=> bm!43344 m!947769))

(declare-fun m!947919 () Bool)

(assert (=> bm!43344 m!947919))

(assert (=> b!1029022 m!947769))

(assert (=> b!1029022 m!947769))

(assert (=> b!1029022 m!947771))

(assert (=> b!1028795 d!123199))

(declare-fun d!123201 () Bool)

(declare-fun e!580882 () Bool)

(assert (=> d!123201 e!580882))

(declare-fun res!688340 () Bool)

(assert (=> d!123201 (=> (not res!688340) (not e!580882))))

(assert (=> d!123201 (= res!688340 (and (bvsge (index!40884 lt!452806) #b00000000000000000000000000000000) (bvslt (index!40884 lt!452806) (size!31655 (_keys!11275 thiss!1427)))))))

(declare-fun lt!452986 () Unit!33492)

(declare-fun choose!53 (array!64677 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21793) Unit!33492)

(assert (=> d!123201 (= lt!452986 (choose!53 (_keys!11275 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40884 lt!452806) #b00000000000000000000000000000000 Nil!21790))))

(assert (=> d!123201 (bvslt (size!31655 (_keys!11275 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123201 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11275 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40884 lt!452806) #b00000000000000000000000000000000 Nil!21790) lt!452986)))

(declare-fun b!1029025 () Bool)

(assert (=> b!1029025 (= e!580882 (arrayNoDuplicates!0 (array!64678 (store (arr!31141 (_keys!11275 thiss!1427)) (index!40884 lt!452806) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31655 (_keys!11275 thiss!1427))) #b00000000000000000000000000000000 Nil!21790))))

(assert (= (and d!123201 res!688340) b!1029025))

(declare-fun m!947921 () Bool)

(assert (=> d!123201 m!947921))

(assert (=> b!1029025 m!947651))

(declare-fun m!947923 () Bool)

(assert (=> b!1029025 m!947923))

(assert (=> b!1028795 d!123201))

(declare-fun d!123203 () Bool)

(declare-fun e!580885 () Bool)

(assert (=> d!123203 e!580885))

(declare-fun res!688343 () Bool)

(assert (=> d!123203 (=> (not res!688343) (not e!580885))))

(assert (=> d!123203 (= res!688343 (and (bvsge (index!40884 lt!452806) #b00000000000000000000000000000000) (bvslt (index!40884 lt!452806) (size!31655 (_keys!11275 thiss!1427)))))))

(declare-fun lt!452989 () Unit!33492)

(declare-fun choose!1685 (array!64677 array!64679 (_ BitVec 32) (_ BitVec 32) V!37259 V!37259 (_ BitVec 32) (_ BitVec 64) Int) Unit!33492)

(assert (=> d!123203 (= lt!452989 (choose!1685 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (index!40884 lt!452806) key!909 (defaultEntry!6090 thiss!1427)))))

(assert (=> d!123203 (validMask!0 (mask!29868 thiss!1427))))

(assert (=> d!123203 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!2 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (index!40884 lt!452806) key!909 (defaultEntry!6090 thiss!1427)) lt!452989)))

(declare-fun b!1029028 () Bool)

(assert (=> b!1029028 (= e!580885 (= (-!476 (getCurrentListMap!3899 (_keys!11275 thiss!1427) (_values!6113 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)) key!909) (getCurrentListMap!3899 (array!64678 (store (arr!31141 (_keys!11275 thiss!1427)) (index!40884 lt!452806) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31655 (_keys!11275 thiss!1427))) (array!64680 (store (arr!31142 (_values!6113 thiss!1427)) (index!40884 lt!452806) (ValueCellFull!11441 (dynLambda!1970 (defaultEntry!6090 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31656 (_values!6113 thiss!1427))) (mask!29868 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427))))))

(assert (=> b!1029028 (bvslt (index!40884 lt!452806) (size!31656 (_values!6113 thiss!1427)))))

(assert (= (and d!123203 res!688343) b!1029028))

(declare-fun b_lambda!15741 () Bool)

(assert (=> (not b_lambda!15741) (not b!1029028)))

(assert (=> b!1029028 t!30847))

(declare-fun b_and!32841 () Bool)

(assert (= b_and!32839 (and (=> t!30847 result!14081) b_and!32841)))

(declare-fun m!947925 () Bool)

(assert (=> d!123203 m!947925))

(assert (=> d!123203 m!947757))

(assert (=> b!1029028 m!947635))

(assert (=> b!1029028 m!947645))

(assert (=> b!1029028 m!947647))

(assert (=> b!1029028 m!947651))

(declare-fun m!947927 () Bool)

(assert (=> b!1029028 m!947927))

(assert (=> b!1029028 m!947653))

(assert (=> b!1029028 m!947645))

(assert (=> b!1028795 d!123203))

(declare-fun b!1029036 () Bool)

(declare-fun e!580890 () Bool)

(assert (=> b!1029036 (= e!580890 tp_is_empty!24289)))

(declare-fun mapNonEmpty!37871 () Bool)

(declare-fun mapRes!37871 () Bool)

(declare-fun tp!72768 () Bool)

(declare-fun e!580891 () Bool)

(assert (=> mapNonEmpty!37871 (= mapRes!37871 (and tp!72768 e!580891))))

(declare-fun mapRest!37871 () (Array (_ BitVec 32) ValueCell!11441))

(declare-fun mapKey!37871 () (_ BitVec 32))

(declare-fun mapValue!37871 () ValueCell!11441)

(assert (=> mapNonEmpty!37871 (= mapRest!37862 (store mapRest!37871 mapKey!37871 mapValue!37871))))

(declare-fun condMapEmpty!37871 () Bool)

(declare-fun mapDefault!37871 () ValueCell!11441)

(assert (=> mapNonEmpty!37862 (= condMapEmpty!37871 (= mapRest!37862 ((as const (Array (_ BitVec 32) ValueCell!11441)) mapDefault!37871)))))

(assert (=> mapNonEmpty!37862 (= tp!72752 (and e!580890 mapRes!37871))))

(declare-fun mapIsEmpty!37871 () Bool)

(assert (=> mapIsEmpty!37871 mapRes!37871))

(declare-fun b!1029035 () Bool)

(assert (=> b!1029035 (= e!580891 tp_is_empty!24289)))

(assert (= (and mapNonEmpty!37862 condMapEmpty!37871) mapIsEmpty!37871))

(assert (= (and mapNonEmpty!37862 (not condMapEmpty!37871)) mapNonEmpty!37871))

(assert (= (and mapNonEmpty!37871 ((_ is ValueCellFull!11441) mapValue!37871)) b!1029035))

(assert (= (and mapNonEmpty!37862 ((_ is ValueCellFull!11441) mapDefault!37871)) b!1029036))

(declare-fun m!947929 () Bool)

(assert (=> mapNonEmpty!37871 m!947929))

(declare-fun b_lambda!15743 () Bool)

(assert (= b_lambda!15741 (or (and b!1028794 b_free!20569) b_lambda!15743)))

(declare-fun b_lambda!15745 () Bool)

(assert (= b_lambda!15737 (or (and b!1028794 b_free!20569) b_lambda!15745)))

(declare-fun b_lambda!15747 () Bool)

(assert (= b_lambda!15739 (or (and b!1028794 b_free!20569) b_lambda!15747)))

(check-sat (not b!1028973) (not b!1029018) (not b!1028919) (not b!1028918) b_and!32841 (not b!1028986) (not b!1028952) (not bm!43344) (not b!1028976) (not b!1028915) (not b!1028940) (not bm!43326) (not d!123195) (not b!1028971) (not b!1029022) (not b!1028992) (not d!123201) (not bm!43330) (not b!1028928) (not bm!43337) tp_is_empty!24289 (not b!1029007) (not b!1028965) (not d!123173) (not b_lambda!15743) (not b!1028926) (not b_next!20569) (not b!1028984) (not d!123181) (not d!123197) (not b!1028950) (not b!1029021) (not b!1028922) (not b!1028988) (not b_lambda!15735) (not b!1028861) (not d!123203) (not b!1028930) (not b!1029004) (not bm!43327) (not b!1028980) (not mapNonEmpty!37871) (not b!1028977) (not b!1028934) (not d!123175) (not b!1029028) (not bm!43323) (not b!1028871) (not d!123179) (not bm!43340) (not bm!43334) (not d!123191) (not bm!43333) (not b!1028961) (not b!1029025) (not b!1028870) (not b!1028869) (not bm!43341) (not b_lambda!15745) (not bm!43336) (not b_lambda!15747) (not b!1028995) (not bm!43322) (not d!123193) (not b!1029005))
(check-sat b_and!32841 (not b_next!20569))
