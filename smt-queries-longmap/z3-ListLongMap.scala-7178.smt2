; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91814 () Bool)

(assert start!91814)

(declare-fun b!1044642 () Bool)

(declare-fun b_free!21123 () Bool)

(declare-fun b_next!21123 () Bool)

(assert (=> b!1044642 (= b_free!21123 (not b_next!21123))))

(declare-fun tp!74618 () Bool)

(declare-fun b_and!33709 () Bool)

(assert (=> b!1044642 (= tp!74618 b_and!33709)))

(declare-fun b!1044641 () Bool)

(declare-fun res!695726 () Bool)

(declare-fun e!592054 () Bool)

(assert (=> b!1044641 (=> (not res!695726) (not e!592054))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1044641 (= res!695726 (not (= key!909 (bvneg key!909))))))

(declare-fun tp_is_empty!24843 () Bool)

(declare-fun e!592056 () Bool)

(declare-datatypes ((V!37997 0))(
  ( (V!37998 (val!12472 Int)) )
))
(declare-datatypes ((ValueCell!11718 0))(
  ( (ValueCellFull!11718 (v!15065 V!37997)) (EmptyCell!11718) )
))
(declare-datatypes ((array!65856 0))(
  ( (array!65857 (arr!31677 (Array (_ BitVec 32) (_ BitVec 64))) (size!32212 (_ BitVec 32))) )
))
(declare-datatypes ((array!65858 0))(
  ( (array!65859 (arr!31678 (Array (_ BitVec 32) ValueCell!11718)) (size!32213 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6030 0))(
  ( (LongMapFixedSize!6031 (defaultEntry!6405 Int) (mask!30518 (_ BitVec 32)) (extraKeys!6133 (_ BitVec 32)) (zeroValue!6239 V!37997) (minValue!6239 V!37997) (_size!3070 (_ BitVec 32)) (_keys!11671 array!65856) (_values!6428 array!65858) (_vacant!3070 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6030)

(declare-fun e!592059 () Bool)

(declare-fun array_inv!24467 (array!65856) Bool)

(declare-fun array_inv!24468 (array!65858) Bool)

(assert (=> b!1044642 (= e!592056 (and tp!74618 tp_is_empty!24843 (array_inv!24467 (_keys!11671 thiss!1427)) (array_inv!24468 (_values!6428 thiss!1427)) e!592059))))

(declare-fun res!695727 () Bool)

(assert (=> start!91814 (=> (not res!695727) (not e!592054))))

(declare-fun valid!2262 (LongMapFixedSize!6030) Bool)

(assert (=> start!91814 (= res!695727 (valid!2262 thiss!1427))))

(assert (=> start!91814 e!592054))

(assert (=> start!91814 e!592056))

(assert (=> start!91814 true))

(declare-fun mapIsEmpty!38897 () Bool)

(declare-fun mapRes!38897 () Bool)

(assert (=> mapIsEmpty!38897 mapRes!38897))

(declare-fun b!1044643 () Bool)

(declare-fun e!592061 () Bool)

(assert (=> b!1044643 (= e!592054 e!592061)))

(declare-fun res!695724 () Bool)

(assert (=> b!1044643 (=> (not res!695724) (not e!592061))))

(declare-datatypes ((SeekEntryResult!9842 0))(
  ( (MissingZero!9842 (index!41739 (_ BitVec 32))) (Found!9842 (index!41740 (_ BitVec 32))) (Intermediate!9842 (undefined!10654 Bool) (index!41741 (_ BitVec 32)) (x!93290 (_ BitVec 32))) (Undefined!9842) (MissingVacant!9842 (index!41742 (_ BitVec 32))) )
))
(declare-fun lt!460882 () SeekEntryResult!9842)

(get-info :version)

(assert (=> b!1044643 (= res!695724 ((_ is Found!9842) lt!460882))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65856 (_ BitVec 32)) SeekEntryResult!9842)

(assert (=> b!1044643 (= lt!460882 (seekEntry!0 key!909 (_keys!11671 thiss!1427) (mask!30518 thiss!1427)))))

(declare-fun b!1044644 () Bool)

(declare-fun res!695723 () Bool)

(declare-fun e!592057 () Bool)

(assert (=> b!1044644 (=> res!695723 e!592057)))

(declare-datatypes ((Unit!34111 0))(
  ( (Unit!34112) )
))
(declare-datatypes ((tuple2!15764 0))(
  ( (tuple2!15765 (_1!7893 Unit!34111) (_2!7893 LongMapFixedSize!6030)) )
))
(declare-fun lt!460888 () tuple2!15764)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044644 (= res!695723 (not (validMask!0 (mask!30518 (_2!7893 lt!460888)))))))

(declare-fun mapNonEmpty!38897 () Bool)

(declare-fun tp!74619 () Bool)

(declare-fun e!592060 () Bool)

(assert (=> mapNonEmpty!38897 (= mapRes!38897 (and tp!74619 e!592060))))

(declare-fun mapRest!38897 () (Array (_ BitVec 32) ValueCell!11718))

(declare-fun mapValue!38897 () ValueCell!11718)

(declare-fun mapKey!38897 () (_ BitVec 32))

(assert (=> mapNonEmpty!38897 (= (arr!31678 (_values!6428 thiss!1427)) (store mapRest!38897 mapKey!38897 mapValue!38897))))

(declare-fun b!1044645 () Bool)

(assert (=> b!1044645 (= e!592060 tp_is_empty!24843)))

(declare-fun b!1044646 () Bool)

(assert (=> b!1044646 (= e!592061 (not e!592057))))

(declare-fun res!695725 () Bool)

(assert (=> b!1044646 (=> res!695725 e!592057)))

(declare-datatypes ((tuple2!15766 0))(
  ( (tuple2!15767 (_1!7894 (_ BitVec 64)) (_2!7894 V!37997)) )
))
(declare-datatypes ((List!22008 0))(
  ( (Nil!22005) (Cons!22004 (h!23212 tuple2!15766) (t!31254 List!22008)) )
))
(declare-datatypes ((ListLongMap!13783 0))(
  ( (ListLongMap!13784 (toList!6907 List!22008)) )
))
(declare-fun contains!6073 (ListLongMap!13783 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3955 (array!65856 array!65858 (_ BitVec 32) (_ BitVec 32) V!37997 V!37997 (_ BitVec 32) Int) ListLongMap!13783)

(assert (=> b!1044646 (= res!695725 (not (contains!6073 (getCurrentListMap!3955 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888))) key!909)))))

(declare-fun lt!460881 () array!65858)

(declare-fun lt!460889 () array!65856)

(declare-fun Unit!34113 () Unit!34111)

(declare-fun Unit!34114 () Unit!34111)

(assert (=> b!1044646 (= lt!460888 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3070 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15765 Unit!34113 (LongMapFixedSize!6031 (defaultEntry!6405 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) (bvsub (_size!3070 thiss!1427) #b00000000000000000000000000000001) lt!460889 lt!460881 (bvadd #b00000000000000000000000000000001 (_vacant!3070 thiss!1427)))) (tuple2!15765 Unit!34114 (LongMapFixedSize!6031 (defaultEntry!6405 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) (bvsub (_size!3070 thiss!1427) #b00000000000000000000000000000001) lt!460889 lt!460881 (_vacant!3070 thiss!1427)))))))

(declare-fun -!534 (ListLongMap!13783 (_ BitVec 64)) ListLongMap!13783)

(assert (=> b!1044646 (= (-!534 (getCurrentListMap!3955 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)) key!909) (getCurrentListMap!3955 lt!460889 lt!460881 (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)))))

(declare-fun dynLambda!2004 (Int (_ BitVec 64)) V!37997)

(assert (=> b!1044646 (= lt!460881 (array!65859 (store (arr!31678 (_values!6428 thiss!1427)) (index!41740 lt!460882) (ValueCellFull!11718 (dynLambda!2004 (defaultEntry!6405 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32213 (_values!6428 thiss!1427))))))

(declare-fun lt!460883 () Unit!34111)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!55 (array!65856 array!65858 (_ BitVec 32) (_ BitVec 32) V!37997 V!37997 (_ BitVec 32) (_ BitVec 64) Int) Unit!34111)

(assert (=> b!1044646 (= lt!460883 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!55 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) (index!41740 lt!460882) key!909 (defaultEntry!6405 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044646 (not (arrayContainsKey!0 lt!460889 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460884 () Unit!34111)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65856 (_ BitVec 32) (_ BitVec 64)) Unit!34111)

(assert (=> b!1044646 (= lt!460884 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11671 thiss!1427) (index!41740 lt!460882) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65856 (_ BitVec 32)) Bool)

(assert (=> b!1044646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460889 (mask!30518 thiss!1427))))

(declare-fun lt!460886 () Unit!34111)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65856 (_ BitVec 32) (_ BitVec 32)) Unit!34111)

(assert (=> b!1044646 (= lt!460886 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11671 thiss!1427) (index!41740 lt!460882) (mask!30518 thiss!1427)))))

(declare-datatypes ((List!22009 0))(
  ( (Nil!22006) (Cons!22005 (h!23213 (_ BitVec 64)) (t!31255 List!22009)) )
))
(declare-fun arrayNoDuplicates!0 (array!65856 (_ BitVec 32) List!22009) Bool)

(assert (=> b!1044646 (arrayNoDuplicates!0 lt!460889 #b00000000000000000000000000000000 Nil!22006)))

(declare-fun lt!460885 () Unit!34111)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65856 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22009) Unit!34111)

(assert (=> b!1044646 (= lt!460885 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11671 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41740 lt!460882) #b00000000000000000000000000000000 Nil!22006))))

(declare-fun arrayCountValidKeys!0 (array!65856 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044646 (= (arrayCountValidKeys!0 lt!460889 #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11671 thiss!1427) #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044646 (= lt!460889 (array!65857 (store (arr!31677 (_keys!11671 thiss!1427)) (index!41740 lt!460882) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32212 (_keys!11671 thiss!1427))))))

(declare-fun lt!460887 () Unit!34111)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65856 (_ BitVec 32) (_ BitVec 64)) Unit!34111)

(assert (=> b!1044646 (= lt!460887 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11671 thiss!1427) (index!41740 lt!460882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044647 () Bool)

(declare-fun e!592055 () Bool)

(assert (=> b!1044647 (= e!592055 tp_is_empty!24843)))

(declare-fun b!1044648 () Bool)

(assert (=> b!1044648 (= e!592057 (or (not (= (size!32213 (_values!6428 (_2!7893 lt!460888))) (bvadd #b00000000000000000000000000000001 (mask!30518 (_2!7893 lt!460888))))) (= (size!32212 (_keys!11671 (_2!7893 lt!460888))) (size!32213 (_values!6428 (_2!7893 lt!460888))))))))

(declare-fun b!1044649 () Bool)

(assert (=> b!1044649 (= e!592059 (and e!592055 mapRes!38897))))

(declare-fun condMapEmpty!38897 () Bool)

(declare-fun mapDefault!38897 () ValueCell!11718)

(assert (=> b!1044649 (= condMapEmpty!38897 (= (arr!31678 (_values!6428 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11718)) mapDefault!38897)))))

(assert (= (and start!91814 res!695727) b!1044641))

(assert (= (and b!1044641 res!695726) b!1044643))

(assert (= (and b!1044643 res!695724) b!1044646))

(assert (= (and b!1044646 (not res!695725)) b!1044644))

(assert (= (and b!1044644 (not res!695723)) b!1044648))

(assert (= (and b!1044649 condMapEmpty!38897) mapIsEmpty!38897))

(assert (= (and b!1044649 (not condMapEmpty!38897)) mapNonEmpty!38897))

(assert (= (and mapNonEmpty!38897 ((_ is ValueCellFull!11718) mapValue!38897)) b!1044645))

(assert (= (and b!1044649 ((_ is ValueCellFull!11718) mapDefault!38897)) b!1044647))

(assert (= b!1044642 b!1044649))

(assert (= start!91814 b!1044642))

(declare-fun b_lambda!16243 () Bool)

(assert (=> (not b_lambda!16243) (not b!1044646)))

(declare-fun t!31253 () Bool)

(declare-fun tb!7067 () Bool)

(assert (=> (and b!1044642 (= (defaultEntry!6405 thiss!1427) (defaultEntry!6405 thiss!1427)) t!31253) tb!7067))

(declare-fun result!14559 () Bool)

(assert (=> tb!7067 (= result!14559 tp_is_empty!24843)))

(assert (=> b!1044646 t!31253))

(declare-fun b_and!33711 () Bool)

(assert (= b_and!33709 (and (=> t!31253 result!14559) b_and!33711)))

(declare-fun m!964139 () Bool)

(assert (=> b!1044642 m!964139))

(declare-fun m!964141 () Bool)

(assert (=> b!1044642 m!964141))

(declare-fun m!964143 () Bool)

(assert (=> mapNonEmpty!38897 m!964143))

(declare-fun m!964145 () Bool)

(assert (=> b!1044643 m!964145))

(declare-fun m!964147 () Bool)

(assert (=> b!1044646 m!964147))

(declare-fun m!964149 () Bool)

(assert (=> b!1044646 m!964149))

(declare-fun m!964151 () Bool)

(assert (=> b!1044646 m!964151))

(declare-fun m!964153 () Bool)

(assert (=> b!1044646 m!964153))

(declare-fun m!964155 () Bool)

(assert (=> b!1044646 m!964155))

(declare-fun m!964157 () Bool)

(assert (=> b!1044646 m!964157))

(declare-fun m!964159 () Bool)

(assert (=> b!1044646 m!964159))

(declare-fun m!964161 () Bool)

(assert (=> b!1044646 m!964161))

(declare-fun m!964163 () Bool)

(assert (=> b!1044646 m!964163))

(declare-fun m!964165 () Bool)

(assert (=> b!1044646 m!964165))

(declare-fun m!964167 () Bool)

(assert (=> b!1044646 m!964167))

(declare-fun m!964169 () Bool)

(assert (=> b!1044646 m!964169))

(declare-fun m!964171 () Bool)

(assert (=> b!1044646 m!964171))

(declare-fun m!964173 () Bool)

(assert (=> b!1044646 m!964173))

(assert (=> b!1044646 m!964169))

(assert (=> b!1044646 m!964157))

(declare-fun m!964175 () Bool)

(assert (=> b!1044646 m!964175))

(declare-fun m!964177 () Bool)

(assert (=> b!1044646 m!964177))

(declare-fun m!964179 () Bool)

(assert (=> b!1044646 m!964179))

(declare-fun m!964181 () Bool)

(assert (=> b!1044646 m!964181))

(declare-fun m!964183 () Bool)

(assert (=> start!91814 m!964183))

(declare-fun m!964185 () Bool)

(assert (=> b!1044644 m!964185))

(check-sat (not b!1044644) (not mapNonEmpty!38897) (not b!1044646) tp_is_empty!24843 (not start!91814) (not b_next!21123) (not b_lambda!16243) b_and!33711 (not b!1044642) (not b!1044643))
(check-sat b_and!33711 (not b_next!21123))
(get-model)

(declare-fun b_lambda!16247 () Bool)

(assert (= b_lambda!16243 (or (and b!1044642 b_free!21123) b_lambda!16247)))

(check-sat (not b!1044644) (not mapNonEmpty!38897) tp_is_empty!24843 (not start!91814) (not b_next!21123) b_and!33711 (not b!1044646) (not b_lambda!16247) (not b!1044642) (not b!1044643))
(check-sat b_and!33711 (not b_next!21123))
(get-model)

(declare-fun d!126417 () Bool)

(assert (=> d!126417 (= (validMask!0 (mask!30518 (_2!7893 lt!460888))) (and (or (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000000000000000111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000000000000001111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000000000000011111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000000000000111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000000000001111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000000000011111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000000000111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000000001111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000000011111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000000111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000001111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000011111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000000111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000001111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000011111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000000111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000001111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000011111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000000111111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000001111111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000011111111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000000111111111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000001111111111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000011111111111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00000111111111111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00001111111111111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00011111111111111111111111111111) (= (mask!30518 (_2!7893 lt!460888)) #b00111111111111111111111111111111)) (bvsle (mask!30518 (_2!7893 lt!460888)) #b00111111111111111111111111111111)))))

(assert (=> b!1044644 d!126417))

(declare-fun d!126419 () Bool)

(assert (=> d!126419 (= (array_inv!24467 (_keys!11671 thiss!1427)) (bvsge (size!32212 (_keys!11671 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044642 d!126419))

(declare-fun d!126421 () Bool)

(assert (=> d!126421 (= (array_inv!24468 (_values!6428 thiss!1427)) (bvsge (size!32213 (_values!6428 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044642 d!126421))

(declare-fun d!126423 () Bool)

(declare-fun res!695749 () Bool)

(declare-fun e!592088 () Bool)

(assert (=> d!126423 (=> (not res!695749) (not e!592088))))

(declare-fun simpleValid!450 (LongMapFixedSize!6030) Bool)

(assert (=> d!126423 (= res!695749 (simpleValid!450 thiss!1427))))

(assert (=> d!126423 (= (valid!2262 thiss!1427) e!592088)))

(declare-fun b!1044687 () Bool)

(declare-fun res!695750 () Bool)

(assert (=> b!1044687 (=> (not res!695750) (not e!592088))))

(assert (=> b!1044687 (= res!695750 (= (arrayCountValidKeys!0 (_keys!11671 thiss!1427) #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))) (_size!3070 thiss!1427)))))

(declare-fun b!1044688 () Bool)

(declare-fun res!695751 () Bool)

(assert (=> b!1044688 (=> (not res!695751) (not e!592088))))

(assert (=> b!1044688 (= res!695751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11671 thiss!1427) (mask!30518 thiss!1427)))))

(declare-fun b!1044689 () Bool)

(assert (=> b!1044689 (= e!592088 (arrayNoDuplicates!0 (_keys!11671 thiss!1427) #b00000000000000000000000000000000 Nil!22006))))

(assert (= (and d!126423 res!695749) b!1044687))

(assert (= (and b!1044687 res!695750) b!1044688))

(assert (= (and b!1044688 res!695751) b!1044689))

(declare-fun m!964235 () Bool)

(assert (=> d!126423 m!964235))

(assert (=> b!1044687 m!964161))

(declare-fun m!964237 () Bool)

(assert (=> b!1044688 m!964237))

(declare-fun m!964239 () Bool)

(assert (=> b!1044689 m!964239))

(assert (=> start!91814 d!126423))

(declare-fun d!126425 () Bool)

(declare-fun res!695756 () Bool)

(declare-fun e!592093 () Bool)

(assert (=> d!126425 (=> res!695756 e!592093)))

(assert (=> d!126425 (= res!695756 (= (select (arr!31677 lt!460889) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126425 (= (arrayContainsKey!0 lt!460889 key!909 #b00000000000000000000000000000000) e!592093)))

(declare-fun b!1044694 () Bool)

(declare-fun e!592094 () Bool)

(assert (=> b!1044694 (= e!592093 e!592094)))

(declare-fun res!695757 () Bool)

(assert (=> b!1044694 (=> (not res!695757) (not e!592094))))

(assert (=> b!1044694 (= res!695757 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32212 lt!460889)))))

(declare-fun b!1044695 () Bool)

(assert (=> b!1044695 (= e!592094 (arrayContainsKey!0 lt!460889 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126425 (not res!695756)) b!1044694))

(assert (= (and b!1044694 res!695757) b!1044695))

(declare-fun m!964241 () Bool)

(assert (=> d!126425 m!964241))

(declare-fun m!964243 () Bool)

(assert (=> b!1044695 m!964243))

(assert (=> b!1044646 d!126425))

(declare-fun b!1044738 () Bool)

(declare-fun e!592124 () Bool)

(declare-fun e!592128 () Bool)

(assert (=> b!1044738 (= e!592124 e!592128)))

(declare-fun res!695780 () Bool)

(declare-fun call!44407 () Bool)

(assert (=> b!1044738 (= res!695780 call!44407)))

(assert (=> b!1044738 (=> (not res!695780) (not e!592128))))

(declare-fun b!1044739 () Bool)

(declare-fun e!592127 () ListLongMap!13783)

(declare-fun call!44404 () ListLongMap!13783)

(assert (=> b!1044739 (= e!592127 call!44404)))

(declare-fun b!1044740 () Bool)

(declare-fun e!592123 () ListLongMap!13783)

(declare-fun e!592131 () ListLongMap!13783)

(assert (=> b!1044740 (= e!592123 e!592131)))

(declare-fun c!106156 () Bool)

(assert (=> b!1044740 (= c!106156 (and (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044741 () Bool)

(declare-fun e!592126 () Bool)

(declare-fun e!592133 () Bool)

(assert (=> b!1044741 (= e!592126 e!592133)))

(declare-fun res!695782 () Bool)

(assert (=> b!1044741 (=> (not res!695782) (not e!592133))))

(declare-fun lt!460971 () ListLongMap!13783)

(assert (=> b!1044741 (= res!695782 (contains!6073 lt!460971 (select (arr!31677 (_keys!11671 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1044741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))))))

(declare-fun b!1044742 () Bool)

(declare-fun e!592129 () Unit!34111)

(declare-fun lt!460966 () Unit!34111)

(assert (=> b!1044742 (= e!592129 lt!460966)))

(declare-fun lt!460974 () ListLongMap!13783)

(declare-fun getCurrentListMapNoExtraKeys!3526 (array!65856 array!65858 (_ BitVec 32) (_ BitVec 32) V!37997 V!37997 (_ BitVec 32) Int) ListLongMap!13783)

(assert (=> b!1044742 (= lt!460974 (getCurrentListMapNoExtraKeys!3526 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)))))

(declare-fun lt!460975 () (_ BitVec 64))

(assert (=> b!1044742 (= lt!460975 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460977 () (_ BitVec 64))

(assert (=> b!1044742 (= lt!460977 (select (arr!31677 (_keys!11671 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460978 () Unit!34111)

(declare-fun addStillContains!631 (ListLongMap!13783 (_ BitVec 64) V!37997 (_ BitVec 64)) Unit!34111)

(assert (=> b!1044742 (= lt!460978 (addStillContains!631 lt!460974 lt!460975 (zeroValue!6239 thiss!1427) lt!460977))))

(declare-fun +!3110 (ListLongMap!13783 tuple2!15766) ListLongMap!13783)

(assert (=> b!1044742 (contains!6073 (+!3110 lt!460974 (tuple2!15767 lt!460975 (zeroValue!6239 thiss!1427))) lt!460977)))

(declare-fun lt!460968 () Unit!34111)

(assert (=> b!1044742 (= lt!460968 lt!460978)))

(declare-fun lt!460969 () ListLongMap!13783)

(assert (=> b!1044742 (= lt!460969 (getCurrentListMapNoExtraKeys!3526 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)))))

(declare-fun lt!460970 () (_ BitVec 64))

(assert (=> b!1044742 (= lt!460970 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460979 () (_ BitVec 64))

(assert (=> b!1044742 (= lt!460979 (select (arr!31677 (_keys!11671 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460982 () Unit!34111)

(declare-fun addApplyDifferent!491 (ListLongMap!13783 (_ BitVec 64) V!37997 (_ BitVec 64)) Unit!34111)

(assert (=> b!1044742 (= lt!460982 (addApplyDifferent!491 lt!460969 lt!460970 (minValue!6239 thiss!1427) lt!460979))))

(declare-fun apply!912 (ListLongMap!13783 (_ BitVec 64)) V!37997)

(assert (=> b!1044742 (= (apply!912 (+!3110 lt!460969 (tuple2!15767 lt!460970 (minValue!6239 thiss!1427))) lt!460979) (apply!912 lt!460969 lt!460979))))

(declare-fun lt!460963 () Unit!34111)

(assert (=> b!1044742 (= lt!460963 lt!460982)))

(declare-fun lt!460976 () ListLongMap!13783)

(assert (=> b!1044742 (= lt!460976 (getCurrentListMapNoExtraKeys!3526 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)))))

(declare-fun lt!460961 () (_ BitVec 64))

(assert (=> b!1044742 (= lt!460961 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460973 () (_ BitVec 64))

(assert (=> b!1044742 (= lt!460973 (select (arr!31677 (_keys!11671 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460964 () Unit!34111)

(assert (=> b!1044742 (= lt!460964 (addApplyDifferent!491 lt!460976 lt!460961 (zeroValue!6239 thiss!1427) lt!460973))))

(assert (=> b!1044742 (= (apply!912 (+!3110 lt!460976 (tuple2!15767 lt!460961 (zeroValue!6239 thiss!1427))) lt!460973) (apply!912 lt!460976 lt!460973))))

(declare-fun lt!460972 () Unit!34111)

(assert (=> b!1044742 (= lt!460972 lt!460964)))

(declare-fun lt!460962 () ListLongMap!13783)

(assert (=> b!1044742 (= lt!460962 (getCurrentListMapNoExtraKeys!3526 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)))))

(declare-fun lt!460980 () (_ BitVec 64))

(assert (=> b!1044742 (= lt!460980 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460981 () (_ BitVec 64))

(assert (=> b!1044742 (= lt!460981 (select (arr!31677 (_keys!11671 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044742 (= lt!460966 (addApplyDifferent!491 lt!460962 lt!460980 (minValue!6239 thiss!1427) lt!460981))))

(assert (=> b!1044742 (= (apply!912 (+!3110 lt!460962 (tuple2!15767 lt!460980 (minValue!6239 thiss!1427))) lt!460981) (apply!912 lt!460962 lt!460981))))

(declare-fun b!1044743 () Bool)

(declare-fun c!106155 () Bool)

(assert (=> b!1044743 (= c!106155 (and (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1044743 (= e!592131 e!592127)))

(declare-fun bm!44400 () Bool)

(assert (=> bm!44400 (= call!44407 (contains!6073 lt!460971 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44401 () Bool)

(declare-fun call!44409 () ListLongMap!13783)

(assert (=> bm!44401 (= call!44404 call!44409)))

(declare-fun bm!44402 () Bool)

(declare-fun call!44403 () Bool)

(assert (=> bm!44402 (= call!44403 (contains!6073 lt!460971 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!44408 () ListLongMap!13783)

(declare-fun call!44405 () ListLongMap!13783)

(declare-fun bm!44403 () Bool)

(declare-fun c!106153 () Bool)

(assert (=> bm!44403 (= call!44405 (+!3110 (ite c!106153 call!44408 (ite c!106156 call!44409 call!44404)) (ite (or c!106153 c!106156) (tuple2!15767 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6239 thiss!1427)) (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6239 thiss!1427)))))))

(declare-fun b!1044744 () Bool)

(declare-fun e!592132 () Bool)

(declare-fun e!592130 () Bool)

(assert (=> b!1044744 (= e!592132 e!592130)))

(declare-fun c!106152 () Bool)

(assert (=> b!1044744 (= c!106152 (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44404 () Bool)

(declare-fun call!44406 () ListLongMap!13783)

(assert (=> bm!44404 (= call!44406 call!44405)))

(declare-fun bm!44405 () Bool)

(assert (=> bm!44405 (= call!44408 (getCurrentListMapNoExtraKeys!3526 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)))))

(declare-fun b!1044745 () Bool)

(declare-fun res!695777 () Bool)

(assert (=> b!1044745 (=> (not res!695777) (not e!592132))))

(assert (=> b!1044745 (= res!695777 e!592124)))

(declare-fun c!106151 () Bool)

(assert (=> b!1044745 (= c!106151 (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1044746 () Bool)

(declare-fun Unit!34119 () Unit!34111)

(assert (=> b!1044746 (= e!592129 Unit!34119)))

(declare-fun bm!44406 () Bool)

(assert (=> bm!44406 (= call!44409 call!44408)))

(declare-fun b!1044747 () Bool)

(assert (=> b!1044747 (= e!592131 call!44406)))

(declare-fun b!1044748 () Bool)

(declare-fun e!592125 () Bool)

(assert (=> b!1044748 (= e!592130 e!592125)))

(declare-fun res!695778 () Bool)

(assert (=> b!1044748 (= res!695778 call!44403)))

(assert (=> b!1044748 (=> (not res!695778) (not e!592125))))

(declare-fun b!1044749 () Bool)

(assert (=> b!1044749 (= e!592128 (= (apply!912 lt!460971 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6239 thiss!1427)))))

(declare-fun b!1044750 () Bool)

(declare-fun get!16553 (ValueCell!11718 V!37997) V!37997)

(assert (=> b!1044750 (= e!592133 (= (apply!912 lt!460971 (select (arr!31677 (_keys!11671 thiss!1427)) #b00000000000000000000000000000000)) (get!16553 (select (arr!31678 (_values!6428 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2004 (defaultEntry!6405 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044750 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32213 (_values!6428 thiss!1427))))))

(assert (=> b!1044750 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))))))

(declare-fun b!1044751 () Bool)

(assert (=> b!1044751 (= e!592124 (not call!44407))))

(declare-fun b!1044752 () Bool)

(assert (=> b!1044752 (= e!592125 (= (apply!912 lt!460971 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6239 thiss!1427)))))

(declare-fun b!1044753 () Bool)

(declare-fun res!695783 () Bool)

(assert (=> b!1044753 (=> (not res!695783) (not e!592132))))

(assert (=> b!1044753 (= res!695783 e!592126)))

(declare-fun res!695779 () Bool)

(assert (=> b!1044753 (=> res!695779 e!592126)))

(declare-fun e!592121 () Bool)

(assert (=> b!1044753 (= res!695779 (not e!592121))))

(declare-fun res!695776 () Bool)

(assert (=> b!1044753 (=> (not res!695776) (not e!592121))))

(assert (=> b!1044753 (= res!695776 (bvslt #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))))))

(declare-fun b!1044754 () Bool)

(assert (=> b!1044754 (= e!592123 (+!3110 call!44405 (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6239 thiss!1427))))))

(declare-fun b!1044755 () Bool)

(declare-fun e!592122 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1044755 (= e!592122 (validKeyInArray!0 (select (arr!31677 (_keys!11671 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044756 () Bool)

(assert (=> b!1044756 (= e!592127 call!44406)))

(declare-fun d!126427 () Bool)

(assert (=> d!126427 e!592132))

(declare-fun res!695784 () Bool)

(assert (=> d!126427 (=> (not res!695784) (not e!592132))))

(assert (=> d!126427 (= res!695784 (or (bvsge #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))))))))

(declare-fun lt!460965 () ListLongMap!13783)

(assert (=> d!126427 (= lt!460971 lt!460965)))

(declare-fun lt!460967 () Unit!34111)

(assert (=> d!126427 (= lt!460967 e!592129)))

(declare-fun c!106154 () Bool)

(assert (=> d!126427 (= c!106154 e!592122)))

(declare-fun res!695781 () Bool)

(assert (=> d!126427 (=> (not res!695781) (not e!592122))))

(assert (=> d!126427 (= res!695781 (bvslt #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))))))

(assert (=> d!126427 (= lt!460965 e!592123)))

(assert (=> d!126427 (= c!106153 (and (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126427 (validMask!0 (mask!30518 thiss!1427))))

(assert (=> d!126427 (= (getCurrentListMap!3955 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)) lt!460971)))

(declare-fun b!1044757 () Bool)

(assert (=> b!1044757 (= e!592130 (not call!44403))))

(declare-fun b!1044758 () Bool)

(assert (=> b!1044758 (= e!592121 (validKeyInArray!0 (select (arr!31677 (_keys!11671 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126427 c!106153) b!1044754))

(assert (= (and d!126427 (not c!106153)) b!1044740))

(assert (= (and b!1044740 c!106156) b!1044747))

(assert (= (and b!1044740 (not c!106156)) b!1044743))

(assert (= (and b!1044743 c!106155) b!1044756))

(assert (= (and b!1044743 (not c!106155)) b!1044739))

(assert (= (or b!1044756 b!1044739) bm!44401))

(assert (= (or b!1044747 bm!44401) bm!44406))

(assert (= (or b!1044747 b!1044756) bm!44404))

(assert (= (or b!1044754 bm!44406) bm!44405))

(assert (= (or b!1044754 bm!44404) bm!44403))

(assert (= (and d!126427 res!695781) b!1044755))

(assert (= (and d!126427 c!106154) b!1044742))

(assert (= (and d!126427 (not c!106154)) b!1044746))

(assert (= (and d!126427 res!695784) b!1044753))

(assert (= (and b!1044753 res!695776) b!1044758))

(assert (= (and b!1044753 (not res!695779)) b!1044741))

(assert (= (and b!1044741 res!695782) b!1044750))

(assert (= (and b!1044753 res!695783) b!1044745))

(assert (= (and b!1044745 c!106151) b!1044738))

(assert (= (and b!1044745 (not c!106151)) b!1044751))

(assert (= (and b!1044738 res!695780) b!1044749))

(assert (= (or b!1044738 b!1044751) bm!44400))

(assert (= (and b!1044745 res!695777) b!1044744))

(assert (= (and b!1044744 c!106152) b!1044748))

(assert (= (and b!1044744 (not c!106152)) b!1044757))

(assert (= (and b!1044748 res!695778) b!1044752))

(assert (= (or b!1044748 b!1044757) bm!44402))

(declare-fun b_lambda!16249 () Bool)

(assert (=> (not b_lambda!16249) (not b!1044750)))

(assert (=> b!1044750 t!31253))

(declare-fun b_and!33717 () Bool)

(assert (= b_and!33711 (and (=> t!31253 result!14559) b_and!33717)))

(declare-fun m!964245 () Bool)

(assert (=> b!1044741 m!964245))

(assert (=> b!1044741 m!964245))

(declare-fun m!964247 () Bool)

(assert (=> b!1044741 m!964247))

(declare-fun m!964249 () Bool)

(assert (=> b!1044742 m!964249))

(declare-fun m!964251 () Bool)

(assert (=> b!1044742 m!964251))

(declare-fun m!964253 () Bool)

(assert (=> b!1044742 m!964253))

(assert (=> b!1044742 m!964249))

(declare-fun m!964255 () Bool)

(assert (=> b!1044742 m!964255))

(declare-fun m!964257 () Bool)

(assert (=> b!1044742 m!964257))

(declare-fun m!964259 () Bool)

(assert (=> b!1044742 m!964259))

(declare-fun m!964261 () Bool)

(assert (=> b!1044742 m!964261))

(assert (=> b!1044742 m!964251))

(declare-fun m!964263 () Bool)

(assert (=> b!1044742 m!964263))

(declare-fun m!964265 () Bool)

(assert (=> b!1044742 m!964265))

(declare-fun m!964267 () Bool)

(assert (=> b!1044742 m!964267))

(declare-fun m!964269 () Bool)

(assert (=> b!1044742 m!964269))

(declare-fun m!964271 () Bool)

(assert (=> b!1044742 m!964271))

(assert (=> b!1044742 m!964263))

(declare-fun m!964273 () Bool)

(assert (=> b!1044742 m!964273))

(declare-fun m!964275 () Bool)

(assert (=> b!1044742 m!964275))

(assert (=> b!1044742 m!964265))

(declare-fun m!964277 () Bool)

(assert (=> b!1044742 m!964277))

(assert (=> b!1044742 m!964245))

(declare-fun m!964279 () Bool)

(assert (=> b!1044742 m!964279))

(assert (=> b!1044758 m!964245))

(assert (=> b!1044758 m!964245))

(declare-fun m!964281 () Bool)

(assert (=> b!1044758 m!964281))

(assert (=> b!1044750 m!964181))

(declare-fun m!964283 () Bool)

(assert (=> b!1044750 m!964283))

(assert (=> b!1044750 m!964245))

(assert (=> b!1044750 m!964245))

(declare-fun m!964285 () Bool)

(assert (=> b!1044750 m!964285))

(assert (=> b!1044750 m!964283))

(assert (=> b!1044750 m!964181))

(declare-fun m!964287 () Bool)

(assert (=> b!1044750 m!964287))

(assert (=> b!1044755 m!964245))

(assert (=> b!1044755 m!964245))

(assert (=> b!1044755 m!964281))

(declare-fun m!964289 () Bool)

(assert (=> bm!44400 m!964289))

(declare-fun m!964291 () Bool)

(assert (=> b!1044754 m!964291))

(declare-fun m!964293 () Bool)

(assert (=> d!126427 m!964293))

(declare-fun m!964295 () Bool)

(assert (=> b!1044749 m!964295))

(assert (=> bm!44405 m!964277))

(declare-fun m!964297 () Bool)

(assert (=> bm!44402 m!964297))

(declare-fun m!964299 () Bool)

(assert (=> b!1044752 m!964299))

(declare-fun m!964301 () Bool)

(assert (=> bm!44403 m!964301))

(assert (=> b!1044646 d!126427))

(declare-fun d!126429 () Bool)

(declare-fun lt!460985 () ListLongMap!13783)

(assert (=> d!126429 (not (contains!6073 lt!460985 key!909))))

(declare-fun removeStrictlySorted!62 (List!22008 (_ BitVec 64)) List!22008)

(assert (=> d!126429 (= lt!460985 (ListLongMap!13784 (removeStrictlySorted!62 (toList!6907 (getCurrentListMap!3955 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427))) key!909)))))

(assert (=> d!126429 (= (-!534 (getCurrentListMap!3955 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)) key!909) lt!460985)))

(declare-fun bs!30519 () Bool)

(assert (= bs!30519 d!126429))

(declare-fun m!964303 () Bool)

(assert (=> bs!30519 m!964303))

(declare-fun m!964305 () Bool)

(assert (=> bs!30519 m!964305))

(assert (=> b!1044646 d!126429))

(declare-fun d!126431 () Bool)

(declare-fun e!592139 () Bool)

(assert (=> d!126431 e!592139))

(declare-fun res!695787 () Bool)

(assert (=> d!126431 (=> res!695787 e!592139)))

(declare-fun lt!460994 () Bool)

(assert (=> d!126431 (= res!695787 (not lt!460994))))

(declare-fun lt!460996 () Bool)

(assert (=> d!126431 (= lt!460994 lt!460996)))

(declare-fun lt!460997 () Unit!34111)

(declare-fun e!592138 () Unit!34111)

(assert (=> d!126431 (= lt!460997 e!592138)))

(declare-fun c!106159 () Bool)

(assert (=> d!126431 (= c!106159 lt!460996)))

(declare-fun containsKey!567 (List!22008 (_ BitVec 64)) Bool)

(assert (=> d!126431 (= lt!460996 (containsKey!567 (toList!6907 (getCurrentListMap!3955 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888)))) key!909))))

(assert (=> d!126431 (= (contains!6073 (getCurrentListMap!3955 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888))) key!909) lt!460994)))

(declare-fun b!1044765 () Bool)

(declare-fun lt!460995 () Unit!34111)

(assert (=> b!1044765 (= e!592138 lt!460995)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!400 (List!22008 (_ BitVec 64)) Unit!34111)

(assert (=> b!1044765 (= lt!460995 (lemmaContainsKeyImpliesGetValueByKeyDefined!400 (toList!6907 (getCurrentListMap!3955 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888)))) key!909))))

(declare-datatypes ((Option!643 0))(
  ( (Some!642 (v!15067 V!37997)) (None!641) )
))
(declare-fun isDefined!439 (Option!643) Bool)

(declare-fun getValueByKey!592 (List!22008 (_ BitVec 64)) Option!643)

(assert (=> b!1044765 (isDefined!439 (getValueByKey!592 (toList!6907 (getCurrentListMap!3955 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888)))) key!909))))

(declare-fun b!1044766 () Bool)

(declare-fun Unit!34120 () Unit!34111)

(assert (=> b!1044766 (= e!592138 Unit!34120)))

(declare-fun b!1044767 () Bool)

(assert (=> b!1044767 (= e!592139 (isDefined!439 (getValueByKey!592 (toList!6907 (getCurrentListMap!3955 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888)))) key!909)))))

(assert (= (and d!126431 c!106159) b!1044765))

(assert (= (and d!126431 (not c!106159)) b!1044766))

(assert (= (and d!126431 (not res!695787)) b!1044767))

(declare-fun m!964307 () Bool)

(assert (=> d!126431 m!964307))

(declare-fun m!964309 () Bool)

(assert (=> b!1044765 m!964309))

(declare-fun m!964311 () Bool)

(assert (=> b!1044765 m!964311))

(assert (=> b!1044765 m!964311))

(declare-fun m!964313 () Bool)

(assert (=> b!1044765 m!964313))

(assert (=> b!1044767 m!964311))

(assert (=> b!1044767 m!964311))

(assert (=> b!1044767 m!964313))

(assert (=> b!1044646 d!126431))

(declare-fun d!126433 () Bool)

(declare-fun e!592142 () Bool)

(assert (=> d!126433 e!592142))

(declare-fun res!695790 () Bool)

(assert (=> d!126433 (=> (not res!695790) (not e!592142))))

(assert (=> d!126433 (= res!695790 (and (bvsge (index!41740 lt!460882) #b00000000000000000000000000000000) (bvslt (index!41740 lt!460882) (size!32212 (_keys!11671 thiss!1427)))))))

(declare-fun lt!461000 () Unit!34111)

(declare-fun choose!1712 (array!65856 array!65858 (_ BitVec 32) (_ BitVec 32) V!37997 V!37997 (_ BitVec 32) (_ BitVec 64) Int) Unit!34111)

(assert (=> d!126433 (= lt!461000 (choose!1712 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) (index!41740 lt!460882) key!909 (defaultEntry!6405 thiss!1427)))))

(assert (=> d!126433 (validMask!0 (mask!30518 thiss!1427))))

(assert (=> d!126433 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!55 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) (index!41740 lt!460882) key!909 (defaultEntry!6405 thiss!1427)) lt!461000)))

(declare-fun b!1044770 () Bool)

(assert (=> b!1044770 (= e!592142 (= (-!534 (getCurrentListMap!3955 (_keys!11671 thiss!1427) (_values!6428 thiss!1427) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)) key!909) (getCurrentListMap!3955 (array!65857 (store (arr!31677 (_keys!11671 thiss!1427)) (index!41740 lt!460882) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32212 (_keys!11671 thiss!1427))) (array!65859 (store (arr!31678 (_values!6428 thiss!1427)) (index!41740 lt!460882) (ValueCellFull!11718 (dynLambda!2004 (defaultEntry!6405 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32213 (_values!6428 thiss!1427))) (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427))))))

(assert (=> b!1044770 (bvslt (index!41740 lt!460882) (size!32213 (_values!6428 thiss!1427)))))

(assert (= (and d!126433 res!695790) b!1044770))

(declare-fun b_lambda!16251 () Bool)

(assert (=> (not b_lambda!16251) (not b!1044770)))

(assert (=> b!1044770 t!31253))

(declare-fun b_and!33719 () Bool)

(assert (= b_and!33717 (and (=> t!31253 result!14559) b_and!33719)))

(declare-fun m!964315 () Bool)

(assert (=> d!126433 m!964315))

(assert (=> d!126433 m!964293))

(assert (=> b!1044770 m!964175))

(assert (=> b!1044770 m!964181))

(assert (=> b!1044770 m!964169))

(declare-fun m!964317 () Bool)

(assert (=> b!1044770 m!964317))

(assert (=> b!1044770 m!964167))

(assert (=> b!1044770 m!964169))

(assert (=> b!1044770 m!964171))

(assert (=> b!1044646 d!126433))

(declare-fun bm!44409 () Bool)

(declare-fun call!44412 () Bool)

(assert (=> bm!44409 (= call!44412 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460889 (mask!30518 thiss!1427)))))

(declare-fun b!1044779 () Bool)

(declare-fun e!592149 () Bool)

(declare-fun e!592151 () Bool)

(assert (=> b!1044779 (= e!592149 e!592151)))

(declare-fun lt!461009 () (_ BitVec 64))

(assert (=> b!1044779 (= lt!461009 (select (arr!31677 lt!460889) #b00000000000000000000000000000000))))

(declare-fun lt!461007 () Unit!34111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65856 (_ BitVec 64) (_ BitVec 32)) Unit!34111)

(assert (=> b!1044779 (= lt!461007 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460889 lt!461009 #b00000000000000000000000000000000))))

(assert (=> b!1044779 (arrayContainsKey!0 lt!460889 lt!461009 #b00000000000000000000000000000000)))

(declare-fun lt!461008 () Unit!34111)

(assert (=> b!1044779 (= lt!461008 lt!461007)))

(declare-fun res!695796 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65856 (_ BitVec 32)) SeekEntryResult!9842)

(assert (=> b!1044779 (= res!695796 (= (seekEntryOrOpen!0 (select (arr!31677 lt!460889) #b00000000000000000000000000000000) lt!460889 (mask!30518 thiss!1427)) (Found!9842 #b00000000000000000000000000000000)))))

(assert (=> b!1044779 (=> (not res!695796) (not e!592151))))

(declare-fun b!1044780 () Bool)

(assert (=> b!1044780 (= e!592149 call!44412)))

(declare-fun b!1044782 () Bool)

(declare-fun e!592150 () Bool)

(assert (=> b!1044782 (= e!592150 e!592149)))

(declare-fun c!106162 () Bool)

(assert (=> b!1044782 (= c!106162 (validKeyInArray!0 (select (arr!31677 lt!460889) #b00000000000000000000000000000000)))))

(declare-fun b!1044781 () Bool)

(assert (=> b!1044781 (= e!592151 call!44412)))

(declare-fun d!126435 () Bool)

(declare-fun res!695795 () Bool)

(assert (=> d!126435 (=> res!695795 e!592150)))

(assert (=> d!126435 (= res!695795 (bvsge #b00000000000000000000000000000000 (size!32212 lt!460889)))))

(assert (=> d!126435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460889 (mask!30518 thiss!1427)) e!592150)))

(assert (= (and d!126435 (not res!695795)) b!1044782))

(assert (= (and b!1044782 c!106162) b!1044779))

(assert (= (and b!1044782 (not c!106162)) b!1044780))

(assert (= (and b!1044779 res!695796) b!1044781))

(assert (= (or b!1044781 b!1044780) bm!44409))

(declare-fun m!964319 () Bool)

(assert (=> bm!44409 m!964319))

(assert (=> b!1044779 m!964241))

(declare-fun m!964321 () Bool)

(assert (=> b!1044779 m!964321))

(declare-fun m!964323 () Bool)

(assert (=> b!1044779 m!964323))

(assert (=> b!1044779 m!964241))

(declare-fun m!964325 () Bool)

(assert (=> b!1044779 m!964325))

(assert (=> b!1044782 m!964241))

(assert (=> b!1044782 m!964241))

(declare-fun m!964327 () Bool)

(assert (=> b!1044782 m!964327))

(assert (=> b!1044646 d!126435))

(declare-fun d!126437 () Bool)

(declare-fun e!592154 () Bool)

(assert (=> d!126437 e!592154))

(declare-fun res!695799 () Bool)

(assert (=> d!126437 (=> (not res!695799) (not e!592154))))

(assert (=> d!126437 (= res!695799 (bvslt (index!41740 lt!460882) (size!32212 (_keys!11671 thiss!1427))))))

(declare-fun lt!461012 () Unit!34111)

(declare-fun choose!121 (array!65856 (_ BitVec 32) (_ BitVec 64)) Unit!34111)

(assert (=> d!126437 (= lt!461012 (choose!121 (_keys!11671 thiss!1427) (index!41740 lt!460882) key!909))))

(assert (=> d!126437 (bvsge (index!41740 lt!460882) #b00000000000000000000000000000000)))

(assert (=> d!126437 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11671 thiss!1427) (index!41740 lt!460882) key!909) lt!461012)))

(declare-fun b!1044785 () Bool)

(assert (=> b!1044785 (= e!592154 (not (arrayContainsKey!0 (array!65857 (store (arr!31677 (_keys!11671 thiss!1427)) (index!41740 lt!460882) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32212 (_keys!11671 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126437 res!695799) b!1044785))

(declare-fun m!964329 () Bool)

(assert (=> d!126437 m!964329))

(assert (=> b!1044785 m!964175))

(declare-fun m!964331 () Bool)

(assert (=> b!1044785 m!964331))

(assert (=> b!1044646 d!126437))

(declare-fun bm!44412 () Bool)

(declare-fun call!44415 () (_ BitVec 32))

(assert (=> bm!44412 (= call!44415 (arrayCountValidKeys!0 (_keys!11671 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32212 (_keys!11671 thiss!1427))))))

(declare-fun b!1044794 () Bool)

(declare-fun e!592160 () (_ BitVec 32))

(assert (=> b!1044794 (= e!592160 #b00000000000000000000000000000000)))

(declare-fun b!1044795 () Bool)

(declare-fun e!592159 () (_ BitVec 32))

(assert (=> b!1044795 (= e!592160 e!592159)))

(declare-fun c!106167 () Bool)

(assert (=> b!1044795 (= c!106167 (validKeyInArray!0 (select (arr!31677 (_keys!11671 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044796 () Bool)

(assert (=> b!1044796 (= e!592159 call!44415)))

(declare-fun d!126439 () Bool)

(declare-fun lt!461015 () (_ BitVec 32))

(assert (=> d!126439 (and (bvsge lt!461015 #b00000000000000000000000000000000) (bvsle lt!461015 (bvsub (size!32212 (_keys!11671 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126439 (= lt!461015 e!592160)))

(declare-fun c!106168 () Bool)

(assert (=> d!126439 (= c!106168 (bvsge #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))))))

(assert (=> d!126439 (and (bvsle #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32212 (_keys!11671 thiss!1427)) (size!32212 (_keys!11671 thiss!1427))))))

(assert (=> d!126439 (= (arrayCountValidKeys!0 (_keys!11671 thiss!1427) #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))) lt!461015)))

(declare-fun b!1044797 () Bool)

(assert (=> b!1044797 (= e!592159 (bvadd #b00000000000000000000000000000001 call!44415))))

(assert (= (and d!126439 c!106168) b!1044794))

(assert (= (and d!126439 (not c!106168)) b!1044795))

(assert (= (and b!1044795 c!106167) b!1044797))

(assert (= (and b!1044795 (not c!106167)) b!1044796))

(assert (= (or b!1044797 b!1044796) bm!44412))

(declare-fun m!964333 () Bool)

(assert (=> bm!44412 m!964333))

(assert (=> b!1044795 m!964245))

(assert (=> b!1044795 m!964245))

(assert (=> b!1044795 m!964281))

(assert (=> b!1044646 d!126439))

(declare-fun d!126441 () Bool)

(declare-fun e!592163 () Bool)

(assert (=> d!126441 e!592163))

(declare-fun res!695802 () Bool)

(assert (=> d!126441 (=> (not res!695802) (not e!592163))))

(assert (=> d!126441 (= res!695802 (and (bvsge (index!41740 lt!460882) #b00000000000000000000000000000000) (bvslt (index!41740 lt!460882) (size!32212 (_keys!11671 thiss!1427)))))))

(declare-fun lt!461018 () Unit!34111)

(declare-fun choose!25 (array!65856 (_ BitVec 32) (_ BitVec 32)) Unit!34111)

(assert (=> d!126441 (= lt!461018 (choose!25 (_keys!11671 thiss!1427) (index!41740 lt!460882) (mask!30518 thiss!1427)))))

(assert (=> d!126441 (validMask!0 (mask!30518 thiss!1427))))

(assert (=> d!126441 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11671 thiss!1427) (index!41740 lt!460882) (mask!30518 thiss!1427)) lt!461018)))

(declare-fun b!1044800 () Bool)

(assert (=> b!1044800 (= e!592163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65857 (store (arr!31677 (_keys!11671 thiss!1427)) (index!41740 lt!460882) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32212 (_keys!11671 thiss!1427))) (mask!30518 thiss!1427)))))

(assert (= (and d!126441 res!695802) b!1044800))

(declare-fun m!964335 () Bool)

(assert (=> d!126441 m!964335))

(assert (=> d!126441 m!964293))

(assert (=> b!1044800 m!964175))

(declare-fun m!964337 () Bool)

(assert (=> b!1044800 m!964337))

(assert (=> b!1044646 d!126441))

(declare-fun b!1044810 () Bool)

(declare-fun res!695814 () Bool)

(declare-fun e!592168 () Bool)

(assert (=> b!1044810 (=> (not res!695814) (not e!592168))))

(assert (=> b!1044810 (= res!695814 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1044811 () Bool)

(assert (=> b!1044811 (= e!592168 (bvslt (size!32212 (_keys!11671 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1044812 () Bool)

(declare-fun e!592169 () Bool)

(assert (=> b!1044812 (= e!592169 (= (arrayCountValidKeys!0 (array!65857 (store (arr!31677 (_keys!11671 thiss!1427)) (index!41740 lt!460882) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32212 (_keys!11671 thiss!1427))) #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11671 thiss!1427) #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126443 () Bool)

(assert (=> d!126443 e!592169))

(declare-fun res!695812 () Bool)

(assert (=> d!126443 (=> (not res!695812) (not e!592169))))

(assert (=> d!126443 (= res!695812 (and (bvsge (index!41740 lt!460882) #b00000000000000000000000000000000) (bvslt (index!41740 lt!460882) (size!32212 (_keys!11671 thiss!1427)))))))

(declare-fun lt!461021 () Unit!34111)

(declare-fun choose!82 (array!65856 (_ BitVec 32) (_ BitVec 64)) Unit!34111)

(assert (=> d!126443 (= lt!461021 (choose!82 (_keys!11671 thiss!1427) (index!41740 lt!460882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126443 e!592168))

(declare-fun res!695811 () Bool)

(assert (=> d!126443 (=> (not res!695811) (not e!592168))))

(assert (=> d!126443 (= res!695811 (and (bvsge (index!41740 lt!460882) #b00000000000000000000000000000000) (bvslt (index!41740 lt!460882) (size!32212 (_keys!11671 thiss!1427)))))))

(assert (=> d!126443 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11671 thiss!1427) (index!41740 lt!460882) #b1000000000000000000000000000000000000000000000000000000000000000) lt!461021)))

(declare-fun b!1044809 () Bool)

(declare-fun res!695813 () Bool)

(assert (=> b!1044809 (=> (not res!695813) (not e!592168))))

(assert (=> b!1044809 (= res!695813 (validKeyInArray!0 (select (arr!31677 (_keys!11671 thiss!1427)) (index!41740 lt!460882))))))

(assert (= (and d!126443 res!695811) b!1044809))

(assert (= (and b!1044809 res!695813) b!1044810))

(assert (= (and b!1044810 res!695814) b!1044811))

(assert (= (and d!126443 res!695812) b!1044812))

(declare-fun m!964339 () Bool)

(assert (=> b!1044810 m!964339))

(assert (=> b!1044812 m!964175))

(declare-fun m!964341 () Bool)

(assert (=> b!1044812 m!964341))

(assert (=> b!1044812 m!964161))

(declare-fun m!964343 () Bool)

(assert (=> d!126443 m!964343))

(declare-fun m!964345 () Bool)

(assert (=> b!1044809 m!964345))

(assert (=> b!1044809 m!964345))

(declare-fun m!964347 () Bool)

(assert (=> b!1044809 m!964347))

(assert (=> b!1044646 d!126443))

(declare-fun b!1044813 () Bool)

(declare-fun e!592173 () Bool)

(declare-fun e!592177 () Bool)

(assert (=> b!1044813 (= e!592173 e!592177)))

(declare-fun res!695819 () Bool)

(declare-fun call!44420 () Bool)

(assert (=> b!1044813 (= res!695819 call!44420)))

(assert (=> b!1044813 (=> (not res!695819) (not e!592177))))

(declare-fun b!1044814 () Bool)

(declare-fun e!592176 () ListLongMap!13783)

(declare-fun call!44417 () ListLongMap!13783)

(assert (=> b!1044814 (= e!592176 call!44417)))

(declare-fun b!1044815 () Bool)

(declare-fun e!592172 () ListLongMap!13783)

(declare-fun e!592180 () ListLongMap!13783)

(assert (=> b!1044815 (= e!592172 e!592180)))

(declare-fun c!106174 () Bool)

(assert (=> b!1044815 (= c!106174 (and (not (= (bvand (extraKeys!6133 (_2!7893 lt!460888)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6133 (_2!7893 lt!460888)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044816 () Bool)

(declare-fun e!592175 () Bool)

(declare-fun e!592182 () Bool)

(assert (=> b!1044816 (= e!592175 e!592182)))

(declare-fun res!695821 () Bool)

(assert (=> b!1044816 (=> (not res!695821) (not e!592182))))

(declare-fun lt!461032 () ListLongMap!13783)

(assert (=> b!1044816 (= res!695821 (contains!6073 lt!461032 (select (arr!31677 (_keys!11671 (_2!7893 lt!460888))) #b00000000000000000000000000000000)))))

(assert (=> b!1044816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32212 (_keys!11671 (_2!7893 lt!460888)))))))

(declare-fun b!1044817 () Bool)

(declare-fun e!592178 () Unit!34111)

(declare-fun lt!461027 () Unit!34111)

(assert (=> b!1044817 (= e!592178 lt!461027)))

(declare-fun lt!461035 () ListLongMap!13783)

(assert (=> b!1044817 (= lt!461035 (getCurrentListMapNoExtraKeys!3526 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888))))))

(declare-fun lt!461036 () (_ BitVec 64))

(assert (=> b!1044817 (= lt!461036 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461038 () (_ BitVec 64))

(assert (=> b!1044817 (= lt!461038 (select (arr!31677 (_keys!11671 (_2!7893 lt!460888))) #b00000000000000000000000000000000))))

(declare-fun lt!461039 () Unit!34111)

(assert (=> b!1044817 (= lt!461039 (addStillContains!631 lt!461035 lt!461036 (zeroValue!6239 (_2!7893 lt!460888)) lt!461038))))

(assert (=> b!1044817 (contains!6073 (+!3110 lt!461035 (tuple2!15767 lt!461036 (zeroValue!6239 (_2!7893 lt!460888)))) lt!461038)))

(declare-fun lt!461029 () Unit!34111)

(assert (=> b!1044817 (= lt!461029 lt!461039)))

(declare-fun lt!461030 () ListLongMap!13783)

(assert (=> b!1044817 (= lt!461030 (getCurrentListMapNoExtraKeys!3526 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888))))))

(declare-fun lt!461031 () (_ BitVec 64))

(assert (=> b!1044817 (= lt!461031 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461040 () (_ BitVec 64))

(assert (=> b!1044817 (= lt!461040 (select (arr!31677 (_keys!11671 (_2!7893 lt!460888))) #b00000000000000000000000000000000))))

(declare-fun lt!461043 () Unit!34111)

(assert (=> b!1044817 (= lt!461043 (addApplyDifferent!491 lt!461030 lt!461031 (minValue!6239 (_2!7893 lt!460888)) lt!461040))))

(assert (=> b!1044817 (= (apply!912 (+!3110 lt!461030 (tuple2!15767 lt!461031 (minValue!6239 (_2!7893 lt!460888)))) lt!461040) (apply!912 lt!461030 lt!461040))))

(declare-fun lt!461024 () Unit!34111)

(assert (=> b!1044817 (= lt!461024 lt!461043)))

(declare-fun lt!461037 () ListLongMap!13783)

(assert (=> b!1044817 (= lt!461037 (getCurrentListMapNoExtraKeys!3526 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888))))))

(declare-fun lt!461022 () (_ BitVec 64))

(assert (=> b!1044817 (= lt!461022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461034 () (_ BitVec 64))

(assert (=> b!1044817 (= lt!461034 (select (arr!31677 (_keys!11671 (_2!7893 lt!460888))) #b00000000000000000000000000000000))))

(declare-fun lt!461025 () Unit!34111)

(assert (=> b!1044817 (= lt!461025 (addApplyDifferent!491 lt!461037 lt!461022 (zeroValue!6239 (_2!7893 lt!460888)) lt!461034))))

(assert (=> b!1044817 (= (apply!912 (+!3110 lt!461037 (tuple2!15767 lt!461022 (zeroValue!6239 (_2!7893 lt!460888)))) lt!461034) (apply!912 lt!461037 lt!461034))))

(declare-fun lt!461033 () Unit!34111)

(assert (=> b!1044817 (= lt!461033 lt!461025)))

(declare-fun lt!461023 () ListLongMap!13783)

(assert (=> b!1044817 (= lt!461023 (getCurrentListMapNoExtraKeys!3526 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888))))))

(declare-fun lt!461041 () (_ BitVec 64))

(assert (=> b!1044817 (= lt!461041 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461042 () (_ BitVec 64))

(assert (=> b!1044817 (= lt!461042 (select (arr!31677 (_keys!11671 (_2!7893 lt!460888))) #b00000000000000000000000000000000))))

(assert (=> b!1044817 (= lt!461027 (addApplyDifferent!491 lt!461023 lt!461041 (minValue!6239 (_2!7893 lt!460888)) lt!461042))))

(assert (=> b!1044817 (= (apply!912 (+!3110 lt!461023 (tuple2!15767 lt!461041 (minValue!6239 (_2!7893 lt!460888)))) lt!461042) (apply!912 lt!461023 lt!461042))))

(declare-fun b!1044818 () Bool)

(declare-fun c!106173 () Bool)

(assert (=> b!1044818 (= c!106173 (and (not (= (bvand (extraKeys!6133 (_2!7893 lt!460888)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6133 (_2!7893 lt!460888)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1044818 (= e!592180 e!592176)))

(declare-fun bm!44413 () Bool)

(assert (=> bm!44413 (= call!44420 (contains!6073 lt!461032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44414 () Bool)

(declare-fun call!44422 () ListLongMap!13783)

(assert (=> bm!44414 (= call!44417 call!44422)))

(declare-fun bm!44415 () Bool)

(declare-fun call!44416 () Bool)

(assert (=> bm!44415 (= call!44416 (contains!6073 lt!461032 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!44421 () ListLongMap!13783)

(declare-fun c!106171 () Bool)

(declare-fun bm!44416 () Bool)

(declare-fun call!44418 () ListLongMap!13783)

(assert (=> bm!44416 (= call!44418 (+!3110 (ite c!106171 call!44421 (ite c!106174 call!44422 call!44417)) (ite (or c!106171 c!106174) (tuple2!15767 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6239 (_2!7893 lt!460888))) (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6239 (_2!7893 lt!460888))))))))

(declare-fun b!1044819 () Bool)

(declare-fun e!592181 () Bool)

(declare-fun e!592179 () Bool)

(assert (=> b!1044819 (= e!592181 e!592179)))

(declare-fun c!106170 () Bool)

(assert (=> b!1044819 (= c!106170 (not (= (bvand (extraKeys!6133 (_2!7893 lt!460888)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44417 () Bool)

(declare-fun call!44419 () ListLongMap!13783)

(assert (=> bm!44417 (= call!44419 call!44418)))

(declare-fun bm!44418 () Bool)

(assert (=> bm!44418 (= call!44421 (getCurrentListMapNoExtraKeys!3526 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888))))))

(declare-fun b!1044820 () Bool)

(declare-fun res!695816 () Bool)

(assert (=> b!1044820 (=> (not res!695816) (not e!592181))))

(assert (=> b!1044820 (= res!695816 e!592173)))

(declare-fun c!106169 () Bool)

(assert (=> b!1044820 (= c!106169 (not (= (bvand (extraKeys!6133 (_2!7893 lt!460888)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1044821 () Bool)

(declare-fun Unit!34121 () Unit!34111)

(assert (=> b!1044821 (= e!592178 Unit!34121)))

(declare-fun bm!44419 () Bool)

(assert (=> bm!44419 (= call!44422 call!44421)))

(declare-fun b!1044822 () Bool)

(assert (=> b!1044822 (= e!592180 call!44419)))

(declare-fun b!1044823 () Bool)

(declare-fun e!592174 () Bool)

(assert (=> b!1044823 (= e!592179 e!592174)))

(declare-fun res!695817 () Bool)

(assert (=> b!1044823 (= res!695817 call!44416)))

(assert (=> b!1044823 (=> (not res!695817) (not e!592174))))

(declare-fun b!1044824 () Bool)

(assert (=> b!1044824 (= e!592177 (= (apply!912 lt!461032 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6239 (_2!7893 lt!460888))))))

(declare-fun b!1044825 () Bool)

(assert (=> b!1044825 (= e!592182 (= (apply!912 lt!461032 (select (arr!31677 (_keys!11671 (_2!7893 lt!460888))) #b00000000000000000000000000000000)) (get!16553 (select (arr!31678 (_values!6428 (_2!7893 lt!460888))) #b00000000000000000000000000000000) (dynLambda!2004 (defaultEntry!6405 (_2!7893 lt!460888)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32213 (_values!6428 (_2!7893 lt!460888)))))))

(assert (=> b!1044825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32212 (_keys!11671 (_2!7893 lt!460888)))))))

(declare-fun b!1044826 () Bool)

(assert (=> b!1044826 (= e!592173 (not call!44420))))

(declare-fun b!1044827 () Bool)

(assert (=> b!1044827 (= e!592174 (= (apply!912 lt!461032 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6239 (_2!7893 lt!460888))))))

(declare-fun b!1044828 () Bool)

(declare-fun res!695822 () Bool)

(assert (=> b!1044828 (=> (not res!695822) (not e!592181))))

(assert (=> b!1044828 (= res!695822 e!592175)))

(declare-fun res!695818 () Bool)

(assert (=> b!1044828 (=> res!695818 e!592175)))

(declare-fun e!592170 () Bool)

(assert (=> b!1044828 (= res!695818 (not e!592170))))

(declare-fun res!695815 () Bool)

(assert (=> b!1044828 (=> (not res!695815) (not e!592170))))

(assert (=> b!1044828 (= res!695815 (bvslt #b00000000000000000000000000000000 (size!32212 (_keys!11671 (_2!7893 lt!460888)))))))

(declare-fun b!1044829 () Bool)

(assert (=> b!1044829 (= e!592172 (+!3110 call!44418 (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6239 (_2!7893 lt!460888)))))))

(declare-fun b!1044830 () Bool)

(declare-fun e!592171 () Bool)

(assert (=> b!1044830 (= e!592171 (validKeyInArray!0 (select (arr!31677 (_keys!11671 (_2!7893 lt!460888))) #b00000000000000000000000000000000)))))

(declare-fun b!1044831 () Bool)

(assert (=> b!1044831 (= e!592176 call!44419)))

(declare-fun d!126445 () Bool)

(assert (=> d!126445 e!592181))

(declare-fun res!695823 () Bool)

(assert (=> d!126445 (=> (not res!695823) (not e!592181))))

(assert (=> d!126445 (= res!695823 (or (bvsge #b00000000000000000000000000000000 (size!32212 (_keys!11671 (_2!7893 lt!460888)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32212 (_keys!11671 (_2!7893 lt!460888)))))))))

(declare-fun lt!461026 () ListLongMap!13783)

(assert (=> d!126445 (= lt!461032 lt!461026)))

(declare-fun lt!461028 () Unit!34111)

(assert (=> d!126445 (= lt!461028 e!592178)))

(declare-fun c!106172 () Bool)

(assert (=> d!126445 (= c!106172 e!592171)))

(declare-fun res!695820 () Bool)

(assert (=> d!126445 (=> (not res!695820) (not e!592171))))

(assert (=> d!126445 (= res!695820 (bvslt #b00000000000000000000000000000000 (size!32212 (_keys!11671 (_2!7893 lt!460888)))))))

(assert (=> d!126445 (= lt!461026 e!592172)))

(assert (=> d!126445 (= c!106171 (and (not (= (bvand (extraKeys!6133 (_2!7893 lt!460888)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6133 (_2!7893 lt!460888)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126445 (validMask!0 (mask!30518 (_2!7893 lt!460888)))))

(assert (=> d!126445 (= (getCurrentListMap!3955 (_keys!11671 (_2!7893 lt!460888)) (_values!6428 (_2!7893 lt!460888)) (mask!30518 (_2!7893 lt!460888)) (extraKeys!6133 (_2!7893 lt!460888)) (zeroValue!6239 (_2!7893 lt!460888)) (minValue!6239 (_2!7893 lt!460888)) #b00000000000000000000000000000000 (defaultEntry!6405 (_2!7893 lt!460888))) lt!461032)))

(declare-fun b!1044832 () Bool)

(assert (=> b!1044832 (= e!592179 (not call!44416))))

(declare-fun b!1044833 () Bool)

(assert (=> b!1044833 (= e!592170 (validKeyInArray!0 (select (arr!31677 (_keys!11671 (_2!7893 lt!460888))) #b00000000000000000000000000000000)))))

(assert (= (and d!126445 c!106171) b!1044829))

(assert (= (and d!126445 (not c!106171)) b!1044815))

(assert (= (and b!1044815 c!106174) b!1044822))

(assert (= (and b!1044815 (not c!106174)) b!1044818))

(assert (= (and b!1044818 c!106173) b!1044831))

(assert (= (and b!1044818 (not c!106173)) b!1044814))

(assert (= (or b!1044831 b!1044814) bm!44414))

(assert (= (or b!1044822 bm!44414) bm!44419))

(assert (= (or b!1044822 b!1044831) bm!44417))

(assert (= (or b!1044829 bm!44419) bm!44418))

(assert (= (or b!1044829 bm!44417) bm!44416))

(assert (= (and d!126445 res!695820) b!1044830))

(assert (= (and d!126445 c!106172) b!1044817))

(assert (= (and d!126445 (not c!106172)) b!1044821))

(assert (= (and d!126445 res!695823) b!1044828))

(assert (= (and b!1044828 res!695815) b!1044833))

(assert (= (and b!1044828 (not res!695818)) b!1044816))

(assert (= (and b!1044816 res!695821) b!1044825))

(assert (= (and b!1044828 res!695822) b!1044820))

(assert (= (and b!1044820 c!106169) b!1044813))

(assert (= (and b!1044820 (not c!106169)) b!1044826))

(assert (= (and b!1044813 res!695819) b!1044824))

(assert (= (or b!1044813 b!1044826) bm!44413))

(assert (= (and b!1044820 res!695816) b!1044819))

(assert (= (and b!1044819 c!106170) b!1044823))

(assert (= (and b!1044819 (not c!106170)) b!1044832))

(assert (= (and b!1044823 res!695817) b!1044827))

(assert (= (or b!1044823 b!1044832) bm!44415))

(declare-fun b_lambda!16253 () Bool)

(assert (=> (not b_lambda!16253) (not b!1044825)))

(declare-fun t!31261 () Bool)

(declare-fun tb!7071 () Bool)

(assert (=> (and b!1044642 (= (defaultEntry!6405 thiss!1427) (defaultEntry!6405 (_2!7893 lt!460888))) t!31261) tb!7071))

(declare-fun result!14567 () Bool)

(assert (=> tb!7071 (= result!14567 tp_is_empty!24843)))

(assert (=> b!1044825 t!31261))

(declare-fun b_and!33721 () Bool)

(assert (= b_and!33719 (and (=> t!31261 result!14567) b_and!33721)))

(declare-fun m!964349 () Bool)

(assert (=> b!1044816 m!964349))

(assert (=> b!1044816 m!964349))

(declare-fun m!964351 () Bool)

(assert (=> b!1044816 m!964351))

(declare-fun m!964353 () Bool)

(assert (=> b!1044817 m!964353))

(declare-fun m!964355 () Bool)

(assert (=> b!1044817 m!964355))

(declare-fun m!964357 () Bool)

(assert (=> b!1044817 m!964357))

(assert (=> b!1044817 m!964353))

(declare-fun m!964359 () Bool)

(assert (=> b!1044817 m!964359))

(declare-fun m!964361 () Bool)

(assert (=> b!1044817 m!964361))

(declare-fun m!964363 () Bool)

(assert (=> b!1044817 m!964363))

(declare-fun m!964365 () Bool)

(assert (=> b!1044817 m!964365))

(assert (=> b!1044817 m!964355))

(declare-fun m!964367 () Bool)

(assert (=> b!1044817 m!964367))

(declare-fun m!964369 () Bool)

(assert (=> b!1044817 m!964369))

(declare-fun m!964371 () Bool)

(assert (=> b!1044817 m!964371))

(declare-fun m!964373 () Bool)

(assert (=> b!1044817 m!964373))

(declare-fun m!964375 () Bool)

(assert (=> b!1044817 m!964375))

(assert (=> b!1044817 m!964367))

(declare-fun m!964377 () Bool)

(assert (=> b!1044817 m!964377))

(declare-fun m!964379 () Bool)

(assert (=> b!1044817 m!964379))

(assert (=> b!1044817 m!964369))

(declare-fun m!964381 () Bool)

(assert (=> b!1044817 m!964381))

(assert (=> b!1044817 m!964349))

(declare-fun m!964383 () Bool)

(assert (=> b!1044817 m!964383))

(assert (=> b!1044833 m!964349))

(assert (=> b!1044833 m!964349))

(declare-fun m!964385 () Bool)

(assert (=> b!1044833 m!964385))

(declare-fun m!964387 () Bool)

(assert (=> b!1044825 m!964387))

(declare-fun m!964389 () Bool)

(assert (=> b!1044825 m!964389))

(assert (=> b!1044825 m!964349))

(assert (=> b!1044825 m!964349))

(declare-fun m!964391 () Bool)

(assert (=> b!1044825 m!964391))

(assert (=> b!1044825 m!964389))

(assert (=> b!1044825 m!964387))

(declare-fun m!964393 () Bool)

(assert (=> b!1044825 m!964393))

(assert (=> b!1044830 m!964349))

(assert (=> b!1044830 m!964349))

(assert (=> b!1044830 m!964385))

(declare-fun m!964395 () Bool)

(assert (=> bm!44413 m!964395))

(declare-fun m!964397 () Bool)

(assert (=> b!1044829 m!964397))

(assert (=> d!126445 m!964185))

(declare-fun m!964399 () Bool)

(assert (=> b!1044824 m!964399))

(assert (=> bm!44418 m!964381))

(declare-fun m!964401 () Bool)

(assert (=> bm!44415 m!964401))

(declare-fun m!964403 () Bool)

(assert (=> b!1044827 m!964403))

(declare-fun m!964405 () Bool)

(assert (=> bm!44416 m!964405))

(assert (=> b!1044646 d!126445))

(declare-fun b!1044834 () Bool)

(declare-fun e!592186 () Bool)

(declare-fun e!592190 () Bool)

(assert (=> b!1044834 (= e!592186 e!592190)))

(declare-fun res!695828 () Bool)

(declare-fun call!44427 () Bool)

(assert (=> b!1044834 (= res!695828 call!44427)))

(assert (=> b!1044834 (=> (not res!695828) (not e!592190))))

(declare-fun b!1044835 () Bool)

(declare-fun e!592189 () ListLongMap!13783)

(declare-fun call!44424 () ListLongMap!13783)

(assert (=> b!1044835 (= e!592189 call!44424)))

(declare-fun b!1044836 () Bool)

(declare-fun e!592185 () ListLongMap!13783)

(declare-fun e!592193 () ListLongMap!13783)

(assert (=> b!1044836 (= e!592185 e!592193)))

(declare-fun c!106180 () Bool)

(assert (=> b!1044836 (= c!106180 (and (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044837 () Bool)

(declare-fun e!592188 () Bool)

(declare-fun e!592195 () Bool)

(assert (=> b!1044837 (= e!592188 e!592195)))

(declare-fun res!695830 () Bool)

(assert (=> b!1044837 (=> (not res!695830) (not e!592195))))

(declare-fun lt!461054 () ListLongMap!13783)

(assert (=> b!1044837 (= res!695830 (contains!6073 lt!461054 (select (arr!31677 lt!460889) #b00000000000000000000000000000000)))))

(assert (=> b!1044837 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32212 lt!460889)))))

(declare-fun b!1044838 () Bool)

(declare-fun e!592191 () Unit!34111)

(declare-fun lt!461049 () Unit!34111)

(assert (=> b!1044838 (= e!592191 lt!461049)))

(declare-fun lt!461057 () ListLongMap!13783)

(assert (=> b!1044838 (= lt!461057 (getCurrentListMapNoExtraKeys!3526 lt!460889 lt!460881 (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)))))

(declare-fun lt!461058 () (_ BitVec 64))

(assert (=> b!1044838 (= lt!461058 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461060 () (_ BitVec 64))

(assert (=> b!1044838 (= lt!461060 (select (arr!31677 lt!460889) #b00000000000000000000000000000000))))

(declare-fun lt!461061 () Unit!34111)

(assert (=> b!1044838 (= lt!461061 (addStillContains!631 lt!461057 lt!461058 (zeroValue!6239 thiss!1427) lt!461060))))

(assert (=> b!1044838 (contains!6073 (+!3110 lt!461057 (tuple2!15767 lt!461058 (zeroValue!6239 thiss!1427))) lt!461060)))

(declare-fun lt!461051 () Unit!34111)

(assert (=> b!1044838 (= lt!461051 lt!461061)))

(declare-fun lt!461052 () ListLongMap!13783)

(assert (=> b!1044838 (= lt!461052 (getCurrentListMapNoExtraKeys!3526 lt!460889 lt!460881 (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)))))

(declare-fun lt!461053 () (_ BitVec 64))

(assert (=> b!1044838 (= lt!461053 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461062 () (_ BitVec 64))

(assert (=> b!1044838 (= lt!461062 (select (arr!31677 lt!460889) #b00000000000000000000000000000000))))

(declare-fun lt!461065 () Unit!34111)

(assert (=> b!1044838 (= lt!461065 (addApplyDifferent!491 lt!461052 lt!461053 (minValue!6239 thiss!1427) lt!461062))))

(assert (=> b!1044838 (= (apply!912 (+!3110 lt!461052 (tuple2!15767 lt!461053 (minValue!6239 thiss!1427))) lt!461062) (apply!912 lt!461052 lt!461062))))

(declare-fun lt!461046 () Unit!34111)

(assert (=> b!1044838 (= lt!461046 lt!461065)))

(declare-fun lt!461059 () ListLongMap!13783)

(assert (=> b!1044838 (= lt!461059 (getCurrentListMapNoExtraKeys!3526 lt!460889 lt!460881 (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)))))

(declare-fun lt!461044 () (_ BitVec 64))

(assert (=> b!1044838 (= lt!461044 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461056 () (_ BitVec 64))

(assert (=> b!1044838 (= lt!461056 (select (arr!31677 lt!460889) #b00000000000000000000000000000000))))

(declare-fun lt!461047 () Unit!34111)

(assert (=> b!1044838 (= lt!461047 (addApplyDifferent!491 lt!461059 lt!461044 (zeroValue!6239 thiss!1427) lt!461056))))

(assert (=> b!1044838 (= (apply!912 (+!3110 lt!461059 (tuple2!15767 lt!461044 (zeroValue!6239 thiss!1427))) lt!461056) (apply!912 lt!461059 lt!461056))))

(declare-fun lt!461055 () Unit!34111)

(assert (=> b!1044838 (= lt!461055 lt!461047)))

(declare-fun lt!461045 () ListLongMap!13783)

(assert (=> b!1044838 (= lt!461045 (getCurrentListMapNoExtraKeys!3526 lt!460889 lt!460881 (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)))))

(declare-fun lt!461063 () (_ BitVec 64))

(assert (=> b!1044838 (= lt!461063 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461064 () (_ BitVec 64))

(assert (=> b!1044838 (= lt!461064 (select (arr!31677 lt!460889) #b00000000000000000000000000000000))))

(assert (=> b!1044838 (= lt!461049 (addApplyDifferent!491 lt!461045 lt!461063 (minValue!6239 thiss!1427) lt!461064))))

(assert (=> b!1044838 (= (apply!912 (+!3110 lt!461045 (tuple2!15767 lt!461063 (minValue!6239 thiss!1427))) lt!461064) (apply!912 lt!461045 lt!461064))))

(declare-fun b!1044839 () Bool)

(declare-fun c!106179 () Bool)

(assert (=> b!1044839 (= c!106179 (and (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1044839 (= e!592193 e!592189)))

(declare-fun bm!44420 () Bool)

(assert (=> bm!44420 (= call!44427 (contains!6073 lt!461054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44421 () Bool)

(declare-fun call!44429 () ListLongMap!13783)

(assert (=> bm!44421 (= call!44424 call!44429)))

(declare-fun bm!44422 () Bool)

(declare-fun call!44423 () Bool)

(assert (=> bm!44422 (= call!44423 (contains!6073 lt!461054 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!44428 () ListLongMap!13783)

(declare-fun bm!44423 () Bool)

(declare-fun c!106177 () Bool)

(declare-fun call!44425 () ListLongMap!13783)

(assert (=> bm!44423 (= call!44425 (+!3110 (ite c!106177 call!44428 (ite c!106180 call!44429 call!44424)) (ite (or c!106177 c!106180) (tuple2!15767 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6239 thiss!1427)) (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6239 thiss!1427)))))))

(declare-fun b!1044840 () Bool)

(declare-fun e!592194 () Bool)

(declare-fun e!592192 () Bool)

(assert (=> b!1044840 (= e!592194 e!592192)))

(declare-fun c!106176 () Bool)

(assert (=> b!1044840 (= c!106176 (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44424 () Bool)

(declare-fun call!44426 () ListLongMap!13783)

(assert (=> bm!44424 (= call!44426 call!44425)))

(declare-fun bm!44425 () Bool)

(assert (=> bm!44425 (= call!44428 (getCurrentListMapNoExtraKeys!3526 lt!460889 lt!460881 (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)))))

(declare-fun b!1044841 () Bool)

(declare-fun res!695825 () Bool)

(assert (=> b!1044841 (=> (not res!695825) (not e!592194))))

(assert (=> b!1044841 (= res!695825 e!592186)))

(declare-fun c!106175 () Bool)

(assert (=> b!1044841 (= c!106175 (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1044842 () Bool)

(declare-fun Unit!34122 () Unit!34111)

(assert (=> b!1044842 (= e!592191 Unit!34122)))

(declare-fun bm!44426 () Bool)

(assert (=> bm!44426 (= call!44429 call!44428)))

(declare-fun b!1044843 () Bool)

(assert (=> b!1044843 (= e!592193 call!44426)))

(declare-fun b!1044844 () Bool)

(declare-fun e!592187 () Bool)

(assert (=> b!1044844 (= e!592192 e!592187)))

(declare-fun res!695826 () Bool)

(assert (=> b!1044844 (= res!695826 call!44423)))

(assert (=> b!1044844 (=> (not res!695826) (not e!592187))))

(declare-fun b!1044845 () Bool)

(assert (=> b!1044845 (= e!592190 (= (apply!912 lt!461054 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6239 thiss!1427)))))

(declare-fun b!1044846 () Bool)

(assert (=> b!1044846 (= e!592195 (= (apply!912 lt!461054 (select (arr!31677 lt!460889) #b00000000000000000000000000000000)) (get!16553 (select (arr!31678 lt!460881) #b00000000000000000000000000000000) (dynLambda!2004 (defaultEntry!6405 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044846 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32213 lt!460881)))))

(assert (=> b!1044846 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32212 lt!460889)))))

(declare-fun b!1044847 () Bool)

(assert (=> b!1044847 (= e!592186 (not call!44427))))

(declare-fun b!1044848 () Bool)

(assert (=> b!1044848 (= e!592187 (= (apply!912 lt!461054 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6239 thiss!1427)))))

(declare-fun b!1044849 () Bool)

(declare-fun res!695831 () Bool)

(assert (=> b!1044849 (=> (not res!695831) (not e!592194))))

(assert (=> b!1044849 (= res!695831 e!592188)))

(declare-fun res!695827 () Bool)

(assert (=> b!1044849 (=> res!695827 e!592188)))

(declare-fun e!592183 () Bool)

(assert (=> b!1044849 (= res!695827 (not e!592183))))

(declare-fun res!695824 () Bool)

(assert (=> b!1044849 (=> (not res!695824) (not e!592183))))

(assert (=> b!1044849 (= res!695824 (bvslt #b00000000000000000000000000000000 (size!32212 lt!460889)))))

(declare-fun b!1044850 () Bool)

(assert (=> b!1044850 (= e!592185 (+!3110 call!44425 (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6239 thiss!1427))))))

(declare-fun b!1044851 () Bool)

(declare-fun e!592184 () Bool)

(assert (=> b!1044851 (= e!592184 (validKeyInArray!0 (select (arr!31677 lt!460889) #b00000000000000000000000000000000)))))

(declare-fun b!1044852 () Bool)

(assert (=> b!1044852 (= e!592189 call!44426)))

(declare-fun d!126447 () Bool)

(assert (=> d!126447 e!592194))

(declare-fun res!695832 () Bool)

(assert (=> d!126447 (=> (not res!695832) (not e!592194))))

(assert (=> d!126447 (= res!695832 (or (bvsge #b00000000000000000000000000000000 (size!32212 lt!460889)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32212 lt!460889)))))))

(declare-fun lt!461048 () ListLongMap!13783)

(assert (=> d!126447 (= lt!461054 lt!461048)))

(declare-fun lt!461050 () Unit!34111)

(assert (=> d!126447 (= lt!461050 e!592191)))

(declare-fun c!106178 () Bool)

(assert (=> d!126447 (= c!106178 e!592184)))

(declare-fun res!695829 () Bool)

(assert (=> d!126447 (=> (not res!695829) (not e!592184))))

(assert (=> d!126447 (= res!695829 (bvslt #b00000000000000000000000000000000 (size!32212 lt!460889)))))

(assert (=> d!126447 (= lt!461048 e!592185)))

(assert (=> d!126447 (= c!106177 (and (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6133 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126447 (validMask!0 (mask!30518 thiss!1427))))

(assert (=> d!126447 (= (getCurrentListMap!3955 lt!460889 lt!460881 (mask!30518 thiss!1427) (extraKeys!6133 thiss!1427) (zeroValue!6239 thiss!1427) (minValue!6239 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6405 thiss!1427)) lt!461054)))

(declare-fun b!1044853 () Bool)

(assert (=> b!1044853 (= e!592192 (not call!44423))))

(declare-fun b!1044854 () Bool)

(assert (=> b!1044854 (= e!592183 (validKeyInArray!0 (select (arr!31677 lt!460889) #b00000000000000000000000000000000)))))

(assert (= (and d!126447 c!106177) b!1044850))

(assert (= (and d!126447 (not c!106177)) b!1044836))

(assert (= (and b!1044836 c!106180) b!1044843))

(assert (= (and b!1044836 (not c!106180)) b!1044839))

(assert (= (and b!1044839 c!106179) b!1044852))

(assert (= (and b!1044839 (not c!106179)) b!1044835))

(assert (= (or b!1044852 b!1044835) bm!44421))

(assert (= (or b!1044843 bm!44421) bm!44426))

(assert (= (or b!1044843 b!1044852) bm!44424))

(assert (= (or b!1044850 bm!44426) bm!44425))

(assert (= (or b!1044850 bm!44424) bm!44423))

(assert (= (and d!126447 res!695829) b!1044851))

(assert (= (and d!126447 c!106178) b!1044838))

(assert (= (and d!126447 (not c!106178)) b!1044842))

(assert (= (and d!126447 res!695832) b!1044849))

(assert (= (and b!1044849 res!695824) b!1044854))

(assert (= (and b!1044849 (not res!695827)) b!1044837))

(assert (= (and b!1044837 res!695830) b!1044846))

(assert (= (and b!1044849 res!695831) b!1044841))

(assert (= (and b!1044841 c!106175) b!1044834))

(assert (= (and b!1044841 (not c!106175)) b!1044847))

(assert (= (and b!1044834 res!695828) b!1044845))

(assert (= (or b!1044834 b!1044847) bm!44420))

(assert (= (and b!1044841 res!695825) b!1044840))

(assert (= (and b!1044840 c!106176) b!1044844))

(assert (= (and b!1044840 (not c!106176)) b!1044853))

(assert (= (and b!1044844 res!695826) b!1044848))

(assert (= (or b!1044844 b!1044853) bm!44422))

(declare-fun b_lambda!16255 () Bool)

(assert (=> (not b_lambda!16255) (not b!1044846)))

(assert (=> b!1044846 t!31253))

(declare-fun b_and!33723 () Bool)

(assert (= b_and!33721 (and (=> t!31253 result!14559) b_and!33723)))

(assert (=> b!1044837 m!964241))

(assert (=> b!1044837 m!964241))

(declare-fun m!964407 () Bool)

(assert (=> b!1044837 m!964407))

(declare-fun m!964409 () Bool)

(assert (=> b!1044838 m!964409))

(declare-fun m!964411 () Bool)

(assert (=> b!1044838 m!964411))

(declare-fun m!964413 () Bool)

(assert (=> b!1044838 m!964413))

(assert (=> b!1044838 m!964409))

(declare-fun m!964415 () Bool)

(assert (=> b!1044838 m!964415))

(declare-fun m!964417 () Bool)

(assert (=> b!1044838 m!964417))

(declare-fun m!964419 () Bool)

(assert (=> b!1044838 m!964419))

(declare-fun m!964421 () Bool)

(assert (=> b!1044838 m!964421))

(assert (=> b!1044838 m!964411))

(declare-fun m!964423 () Bool)

(assert (=> b!1044838 m!964423))

(declare-fun m!964425 () Bool)

(assert (=> b!1044838 m!964425))

(declare-fun m!964427 () Bool)

(assert (=> b!1044838 m!964427))

(declare-fun m!964429 () Bool)

(assert (=> b!1044838 m!964429))

(declare-fun m!964431 () Bool)

(assert (=> b!1044838 m!964431))

(assert (=> b!1044838 m!964423))

(declare-fun m!964433 () Bool)

(assert (=> b!1044838 m!964433))

(declare-fun m!964435 () Bool)

(assert (=> b!1044838 m!964435))

(assert (=> b!1044838 m!964425))

(declare-fun m!964437 () Bool)

(assert (=> b!1044838 m!964437))

(assert (=> b!1044838 m!964241))

(declare-fun m!964439 () Bool)

(assert (=> b!1044838 m!964439))

(assert (=> b!1044854 m!964241))

(assert (=> b!1044854 m!964241))

(assert (=> b!1044854 m!964327))

(assert (=> b!1044846 m!964181))

(declare-fun m!964441 () Bool)

(assert (=> b!1044846 m!964441))

(assert (=> b!1044846 m!964241))

(assert (=> b!1044846 m!964241))

(declare-fun m!964443 () Bool)

(assert (=> b!1044846 m!964443))

(assert (=> b!1044846 m!964441))

(assert (=> b!1044846 m!964181))

(declare-fun m!964445 () Bool)

(assert (=> b!1044846 m!964445))

(assert (=> b!1044851 m!964241))

(assert (=> b!1044851 m!964241))

(assert (=> b!1044851 m!964327))

(declare-fun m!964447 () Bool)

(assert (=> bm!44420 m!964447))

(declare-fun m!964449 () Bool)

(assert (=> b!1044850 m!964449))

(assert (=> d!126447 m!964293))

(declare-fun m!964451 () Bool)

(assert (=> b!1044845 m!964451))

(assert (=> bm!44425 m!964437))

(declare-fun m!964453 () Bool)

(assert (=> bm!44422 m!964453))

(declare-fun m!964455 () Bool)

(assert (=> b!1044848 m!964455))

(declare-fun m!964457 () Bool)

(assert (=> bm!44423 m!964457))

(assert (=> b!1044646 d!126447))

(declare-fun bm!44427 () Bool)

(declare-fun call!44430 () (_ BitVec 32))

(assert (=> bm!44427 (= call!44430 (arrayCountValidKeys!0 lt!460889 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32212 (_keys!11671 thiss!1427))))))

(declare-fun b!1044855 () Bool)

(declare-fun e!592197 () (_ BitVec 32))

(assert (=> b!1044855 (= e!592197 #b00000000000000000000000000000000)))

(declare-fun b!1044856 () Bool)

(declare-fun e!592196 () (_ BitVec 32))

(assert (=> b!1044856 (= e!592197 e!592196)))

(declare-fun c!106181 () Bool)

(assert (=> b!1044856 (= c!106181 (validKeyInArray!0 (select (arr!31677 lt!460889) #b00000000000000000000000000000000)))))

(declare-fun b!1044857 () Bool)

(assert (=> b!1044857 (= e!592196 call!44430)))

(declare-fun d!126449 () Bool)

(declare-fun lt!461066 () (_ BitVec 32))

(assert (=> d!126449 (and (bvsge lt!461066 #b00000000000000000000000000000000) (bvsle lt!461066 (bvsub (size!32212 lt!460889) #b00000000000000000000000000000000)))))

(assert (=> d!126449 (= lt!461066 e!592197)))

(declare-fun c!106182 () Bool)

(assert (=> d!126449 (= c!106182 (bvsge #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))))))

(assert (=> d!126449 (and (bvsle #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32212 (_keys!11671 thiss!1427)) (size!32212 lt!460889)))))

(assert (=> d!126449 (= (arrayCountValidKeys!0 lt!460889 #b00000000000000000000000000000000 (size!32212 (_keys!11671 thiss!1427))) lt!461066)))

(declare-fun b!1044858 () Bool)

(assert (=> b!1044858 (= e!592196 (bvadd #b00000000000000000000000000000001 call!44430))))

(assert (= (and d!126449 c!106182) b!1044855))

(assert (= (and d!126449 (not c!106182)) b!1044856))

(assert (= (and b!1044856 c!106181) b!1044858))

(assert (= (and b!1044856 (not c!106181)) b!1044857))

(assert (= (or b!1044858 b!1044857) bm!44427))

(declare-fun m!964459 () Bool)

(assert (=> bm!44427 m!964459))

(assert (=> b!1044856 m!964241))

(assert (=> b!1044856 m!964241))

(assert (=> b!1044856 m!964327))

(assert (=> b!1044646 d!126449))

(declare-fun b!1044869 () Bool)

(declare-fun e!592208 () Bool)

(declare-fun e!592209 () Bool)

(assert (=> b!1044869 (= e!592208 e!592209)))

(declare-fun res!695841 () Bool)

(assert (=> b!1044869 (=> (not res!695841) (not e!592209))))

(declare-fun e!592206 () Bool)

(assert (=> b!1044869 (= res!695841 (not e!592206))))

(declare-fun res!695839 () Bool)

(assert (=> b!1044869 (=> (not res!695839) (not e!592206))))

(assert (=> b!1044869 (= res!695839 (validKeyInArray!0 (select (arr!31677 lt!460889) #b00000000000000000000000000000000)))))

(declare-fun bm!44430 () Bool)

(declare-fun call!44433 () Bool)

(declare-fun c!106185 () Bool)

(assert (=> bm!44430 (= call!44433 (arrayNoDuplicates!0 lt!460889 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106185 (Cons!22005 (select (arr!31677 lt!460889) #b00000000000000000000000000000000) Nil!22006) Nil!22006)))))

(declare-fun b!1044870 () Bool)

(declare-fun e!592207 () Bool)

(assert (=> b!1044870 (= e!592207 call!44433)))

(declare-fun d!126451 () Bool)

(declare-fun res!695840 () Bool)

(assert (=> d!126451 (=> res!695840 e!592208)))

(assert (=> d!126451 (= res!695840 (bvsge #b00000000000000000000000000000000 (size!32212 lt!460889)))))

(assert (=> d!126451 (= (arrayNoDuplicates!0 lt!460889 #b00000000000000000000000000000000 Nil!22006) e!592208)))

(declare-fun b!1044871 () Bool)

(assert (=> b!1044871 (= e!592207 call!44433)))

(declare-fun b!1044872 () Bool)

(declare-fun contains!6075 (List!22009 (_ BitVec 64)) Bool)

(assert (=> b!1044872 (= e!592206 (contains!6075 Nil!22006 (select (arr!31677 lt!460889) #b00000000000000000000000000000000)))))

(declare-fun b!1044873 () Bool)

(assert (=> b!1044873 (= e!592209 e!592207)))

(assert (=> b!1044873 (= c!106185 (validKeyInArray!0 (select (arr!31677 lt!460889) #b00000000000000000000000000000000)))))

(assert (= (and d!126451 (not res!695840)) b!1044869))

(assert (= (and b!1044869 res!695839) b!1044872))

(assert (= (and b!1044869 res!695841) b!1044873))

(assert (= (and b!1044873 c!106185) b!1044871))

(assert (= (and b!1044873 (not c!106185)) b!1044870))

(assert (= (or b!1044871 b!1044870) bm!44430))

(assert (=> b!1044869 m!964241))

(assert (=> b!1044869 m!964241))

(assert (=> b!1044869 m!964327))

(assert (=> bm!44430 m!964241))

(declare-fun m!964461 () Bool)

(assert (=> bm!44430 m!964461))

(assert (=> b!1044872 m!964241))

(assert (=> b!1044872 m!964241))

(declare-fun m!964463 () Bool)

(assert (=> b!1044872 m!964463))

(assert (=> b!1044873 m!964241))

(assert (=> b!1044873 m!964241))

(assert (=> b!1044873 m!964327))

(assert (=> b!1044646 d!126451))

(declare-fun d!126453 () Bool)

(declare-fun e!592212 () Bool)

(assert (=> d!126453 e!592212))

(declare-fun res!695844 () Bool)

(assert (=> d!126453 (=> (not res!695844) (not e!592212))))

(assert (=> d!126453 (= res!695844 (and (bvsge (index!41740 lt!460882) #b00000000000000000000000000000000) (bvslt (index!41740 lt!460882) (size!32212 (_keys!11671 thiss!1427)))))))

(declare-fun lt!461069 () Unit!34111)

(declare-fun choose!53 (array!65856 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22009) Unit!34111)

(assert (=> d!126453 (= lt!461069 (choose!53 (_keys!11671 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41740 lt!460882) #b00000000000000000000000000000000 Nil!22006))))

(assert (=> d!126453 (bvslt (size!32212 (_keys!11671 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126453 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11671 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41740 lt!460882) #b00000000000000000000000000000000 Nil!22006) lt!461069)))

(declare-fun b!1044876 () Bool)

(assert (=> b!1044876 (= e!592212 (arrayNoDuplicates!0 (array!65857 (store (arr!31677 (_keys!11671 thiss!1427)) (index!41740 lt!460882) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32212 (_keys!11671 thiss!1427))) #b00000000000000000000000000000000 Nil!22006))))

(assert (= (and d!126453 res!695844) b!1044876))

(declare-fun m!964465 () Bool)

(assert (=> d!126453 m!964465))

(assert (=> b!1044876 m!964175))

(declare-fun m!964467 () Bool)

(assert (=> b!1044876 m!964467))

(assert (=> b!1044646 d!126453))

(declare-fun b!1044889 () Bool)

(declare-fun e!592220 () SeekEntryResult!9842)

(declare-fun lt!461081 () SeekEntryResult!9842)

(assert (=> b!1044889 (= e!592220 (Found!9842 (index!41741 lt!461081)))))

(declare-fun b!1044890 () Bool)

(declare-fun c!106194 () Bool)

(declare-fun lt!461079 () (_ BitVec 64))

(assert (=> b!1044890 (= c!106194 (= lt!461079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!592221 () SeekEntryResult!9842)

(assert (=> b!1044890 (= e!592220 e!592221)))

(declare-fun d!126455 () Bool)

(declare-fun lt!461078 () SeekEntryResult!9842)

(assert (=> d!126455 (and (or ((_ is MissingVacant!9842) lt!461078) (not ((_ is Found!9842) lt!461078)) (and (bvsge (index!41740 lt!461078) #b00000000000000000000000000000000) (bvslt (index!41740 lt!461078) (size!32212 (_keys!11671 thiss!1427))))) (not ((_ is MissingVacant!9842) lt!461078)) (or (not ((_ is Found!9842) lt!461078)) (= (select (arr!31677 (_keys!11671 thiss!1427)) (index!41740 lt!461078)) key!909)))))

(declare-fun e!592219 () SeekEntryResult!9842)

(assert (=> d!126455 (= lt!461078 e!592219)))

(declare-fun c!106192 () Bool)

(assert (=> d!126455 (= c!106192 (and ((_ is Intermediate!9842) lt!461081) (undefined!10654 lt!461081)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65856 (_ BitVec 32)) SeekEntryResult!9842)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126455 (= lt!461081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30518 thiss!1427)) key!909 (_keys!11671 thiss!1427) (mask!30518 thiss!1427)))))

(assert (=> d!126455 (validMask!0 (mask!30518 thiss!1427))))

(assert (=> d!126455 (= (seekEntry!0 key!909 (_keys!11671 thiss!1427) (mask!30518 thiss!1427)) lt!461078)))

(declare-fun b!1044891 () Bool)

(assert (=> b!1044891 (= e!592221 (MissingZero!9842 (index!41741 lt!461081)))))

(declare-fun b!1044892 () Bool)

(declare-fun lt!461080 () SeekEntryResult!9842)

(assert (=> b!1044892 (= e!592221 (ite ((_ is MissingVacant!9842) lt!461080) (MissingZero!9842 (index!41742 lt!461080)) lt!461080))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65856 (_ BitVec 32)) SeekEntryResult!9842)

(assert (=> b!1044892 (= lt!461080 (seekKeyOrZeroReturnVacant!0 (x!93290 lt!461081) (index!41741 lt!461081) (index!41741 lt!461081) key!909 (_keys!11671 thiss!1427) (mask!30518 thiss!1427)))))

(declare-fun b!1044893 () Bool)

(assert (=> b!1044893 (= e!592219 Undefined!9842)))

(declare-fun b!1044894 () Bool)

(assert (=> b!1044894 (= e!592219 e!592220)))

(assert (=> b!1044894 (= lt!461079 (select (arr!31677 (_keys!11671 thiss!1427)) (index!41741 lt!461081)))))

(declare-fun c!106193 () Bool)

(assert (=> b!1044894 (= c!106193 (= lt!461079 key!909))))

(assert (= (and d!126455 c!106192) b!1044893))

(assert (= (and d!126455 (not c!106192)) b!1044894))

(assert (= (and b!1044894 c!106193) b!1044889))

(assert (= (and b!1044894 (not c!106193)) b!1044890))

(assert (= (and b!1044890 c!106194) b!1044891))

(assert (= (and b!1044890 (not c!106194)) b!1044892))

(declare-fun m!964469 () Bool)

(assert (=> d!126455 m!964469))

(declare-fun m!964471 () Bool)

(assert (=> d!126455 m!964471))

(assert (=> d!126455 m!964471))

(declare-fun m!964473 () Bool)

(assert (=> d!126455 m!964473))

(assert (=> d!126455 m!964293))

(declare-fun m!964475 () Bool)

(assert (=> b!1044892 m!964475))

(declare-fun m!964477 () Bool)

(assert (=> b!1044894 m!964477))

(assert (=> b!1044643 d!126455))

(declare-fun b!1044902 () Bool)

(declare-fun e!592226 () Bool)

(assert (=> b!1044902 (= e!592226 tp_is_empty!24843)))

(declare-fun condMapEmpty!38903 () Bool)

(declare-fun mapDefault!38903 () ValueCell!11718)

(assert (=> mapNonEmpty!38897 (= condMapEmpty!38903 (= mapRest!38897 ((as const (Array (_ BitVec 32) ValueCell!11718)) mapDefault!38903)))))

(declare-fun mapRes!38903 () Bool)

(assert (=> mapNonEmpty!38897 (= tp!74619 (and e!592226 mapRes!38903))))

(declare-fun mapIsEmpty!38903 () Bool)

(assert (=> mapIsEmpty!38903 mapRes!38903))

(declare-fun mapNonEmpty!38903 () Bool)

(declare-fun tp!74628 () Bool)

(declare-fun e!592227 () Bool)

(assert (=> mapNonEmpty!38903 (= mapRes!38903 (and tp!74628 e!592227))))

(declare-fun mapRest!38903 () (Array (_ BitVec 32) ValueCell!11718))

(declare-fun mapValue!38903 () ValueCell!11718)

(declare-fun mapKey!38903 () (_ BitVec 32))

(assert (=> mapNonEmpty!38903 (= mapRest!38897 (store mapRest!38903 mapKey!38903 mapValue!38903))))

(declare-fun b!1044901 () Bool)

(assert (=> b!1044901 (= e!592227 tp_is_empty!24843)))

(assert (= (and mapNonEmpty!38897 condMapEmpty!38903) mapIsEmpty!38903))

(assert (= (and mapNonEmpty!38897 (not condMapEmpty!38903)) mapNonEmpty!38903))

(assert (= (and mapNonEmpty!38903 ((_ is ValueCellFull!11718) mapValue!38903)) b!1044901))

(assert (= (and mapNonEmpty!38897 ((_ is ValueCellFull!11718) mapDefault!38903)) b!1044902))

(declare-fun m!964479 () Bool)

(assert (=> mapNonEmpty!38903 m!964479))

(declare-fun b_lambda!16257 () Bool)

(assert (= b_lambda!16251 (or (and b!1044642 b_free!21123) b_lambda!16257)))

(declare-fun b_lambda!16259 () Bool)

(assert (= b_lambda!16255 (or (and b!1044642 b_free!21123) b_lambda!16259)))

(declare-fun b_lambda!16261 () Bool)

(assert (= b_lambda!16249 (or (and b!1044642 b_free!21123) b_lambda!16261)))

(check-sat (not bm!44402) (not d!126445) (not b!1044876) (not b!1044872) (not bm!44427) (not bm!44405) (not d!126437) (not d!126443) (not bm!44412) (not b!1044854) (not b!1044795) (not d!126441) (not b!1044848) (not b!1044825) (not b!1044810) (not b_lambda!16259) (not bm!44420) (not b!1044851) (not b!1044850) (not bm!44423) (not d!126433) (not b!1044689) (not b!1044869) (not b!1044749) (not b!1044687) (not b!1044695) (not b!1044750) (not d!126453) b_and!33723 (not d!126423) (not b!1044779) (not bm!44415) (not b_lambda!16247) (not b!1044827) (not b!1044752) (not bm!44413) (not b!1044837) (not b!1044856) (not b!1044817) tp_is_empty!24843 (not bm!44430) (not b!1044829) (not d!126447) (not bm!44400) (not b_lambda!16257) (not b!1044800) (not b!1044755) (not bm!44425) (not b!1044741) (not bm!44403) (not bm!44422) (not b!1044758) (not b!1044892) (not b!1044812) (not b_lambda!16261) (not b!1044845) (not b!1044846) (not b_lambda!16253) (not d!126455) (not bm!44409) (not bm!44416) (not bm!44418) (not b!1044782) (not b!1044754) (not b!1044809) (not b_next!21123) (not b!1044833) (not d!126429) (not d!126427) (not b!1044830) (not b!1044742) (not b!1044688) (not d!126431) (not mapNonEmpty!38903) (not b!1044824) (not b!1044765) (not b!1044816) (not b!1044838) (not b!1044873) (not b!1044767) (not b!1044785) (not b!1044770))
(check-sat b_and!33723 (not b_next!21123))
