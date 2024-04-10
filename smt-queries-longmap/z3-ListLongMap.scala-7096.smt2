; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90024 () Bool)

(assert start!90024)

(declare-fun b!1030891 () Bool)

(declare-fun b_free!20631 () Bool)

(declare-fun b_next!20631 () Bool)

(assert (=> b!1030891 (= b_free!20631 (not b_next!20631))))

(declare-fun tp!72964 () Bool)

(declare-fun b_and!33029 () Bool)

(assert (=> b!1030891 (= tp!72964 b_and!33029)))

(declare-fun b!1030887 () Bool)

(declare-fun res!689317 () Bool)

(declare-fun e!582183 () Bool)

(assert (=> b!1030887 (=> res!689317 e!582183)))

(declare-datatypes ((V!37341 0))(
  ( (V!37342 (val!12226 Int)) )
))
(declare-datatypes ((ValueCell!11472 0))(
  ( (ValueCellFull!11472 (v!14803 V!37341)) (EmptyCell!11472) )
))
(declare-datatypes ((Unit!33681 0))(
  ( (Unit!33682) )
))
(declare-datatypes ((array!64766 0))(
  ( (array!64767 (arr!31185 (Array (_ BitVec 32) (_ BitVec 64))) (size!31702 (_ BitVec 32))) )
))
(declare-datatypes ((array!64768 0))(
  ( (array!64769 (arr!31186 (Array (_ BitVec 32) ValueCell!11472)) (size!31703 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5538 0))(
  ( (LongMapFixedSize!5539 (defaultEntry!6143 Int) (mask!29929 (_ BitVec 32)) (extraKeys!5875 (_ BitVec 32)) (zeroValue!5979 V!37341) (minValue!5979 V!37341) (_size!2824 (_ BitVec 32)) (_keys!11316 array!64766) (_values!6166 array!64768) (_vacant!2824 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15608 0))(
  ( (tuple2!15609 (_1!7815 Unit!33681) (_2!7815 LongMapFixedSize!5538)) )
))
(declare-fun lt!454900 () tuple2!15608)

(assert (=> b!1030887 (= res!689317 (or (not (= (size!31703 (_values!6166 (_2!7815 lt!454900))) (bvadd #b00000000000000000000000000000001 (mask!29929 (_2!7815 lt!454900))))) (not (= (size!31702 (_keys!11316 (_2!7815 lt!454900))) (size!31703 (_values!6166 (_2!7815 lt!454900))))) (bvslt (mask!29929 (_2!7815 lt!454900)) #b00000000000000000000000000000000) (bvslt (extraKeys!5875 (_2!7815 lt!454900)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5875 (_2!7815 lt!454900)) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!37980 () Bool)

(declare-fun mapRes!37980 () Bool)

(assert (=> mapIsEmpty!37980 mapRes!37980))

(declare-fun b!1030888 () Bool)

(declare-fun res!689321 () Bool)

(declare-fun e!582187 () Bool)

(assert (=> b!1030888 (=> (not res!689321) (not e!582187))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1030888 (= res!689321 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1030889 () Bool)

(declare-fun e!582188 () Bool)

(assert (=> b!1030889 (= e!582188 (not e!582183))))

(declare-fun res!689318 () Bool)

(assert (=> b!1030889 (=> res!689318 e!582183)))

(declare-datatypes ((tuple2!15610 0))(
  ( (tuple2!15611 (_1!7816 (_ BitVec 64)) (_2!7816 V!37341)) )
))
(declare-datatypes ((List!21846 0))(
  ( (Nil!21843) (Cons!21842 (h!23044 tuple2!15610) (t!30972 List!21846)) )
))
(declare-datatypes ((ListLongMap!13705 0))(
  ( (ListLongMap!13706 (toList!6868 List!21846)) )
))
(declare-fun contains!5982 (ListLongMap!13705 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3916 (array!64766 array!64768 (_ BitVec 32) (_ BitVec 32) V!37341 V!37341 (_ BitVec 32) Int) ListLongMap!13705)

(assert (=> b!1030889 (= res!689318 (not (contains!5982 (getCurrentListMap!3916 (_keys!11316 (_2!7815 lt!454900)) (_values!6166 (_2!7815 lt!454900)) (mask!29929 (_2!7815 lt!454900)) (extraKeys!5875 (_2!7815 lt!454900)) (zeroValue!5979 (_2!7815 lt!454900)) (minValue!5979 (_2!7815 lt!454900)) #b00000000000000000000000000000000 (defaultEntry!6143 (_2!7815 lt!454900))) key!909)))))

(declare-fun lt!454899 () array!64768)

(declare-fun thiss!1427 () LongMapFixedSize!5538)

(declare-fun lt!454892 () array!64766)

(declare-fun Unit!33683 () Unit!33681)

(declare-fun Unit!33684 () Unit!33681)

(assert (=> b!1030889 (= lt!454900 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2824 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15609 Unit!33683 (LongMapFixedSize!5539 (defaultEntry!6143 thiss!1427) (mask!29929 thiss!1427) (extraKeys!5875 thiss!1427) (zeroValue!5979 thiss!1427) (minValue!5979 thiss!1427) (bvsub (_size!2824 thiss!1427) #b00000000000000000000000000000001) lt!454892 lt!454899 (bvadd #b00000000000000000000000000000001 (_vacant!2824 thiss!1427)))) (tuple2!15609 Unit!33684 (LongMapFixedSize!5539 (defaultEntry!6143 thiss!1427) (mask!29929 thiss!1427) (extraKeys!5875 thiss!1427) (zeroValue!5979 thiss!1427) (minValue!5979 thiss!1427) (bvsub (_size!2824 thiss!1427) #b00000000000000000000000000000001) lt!454892 lt!454899 (_vacant!2824 thiss!1427)))))))

(declare-fun -!495 (ListLongMap!13705 (_ BitVec 64)) ListLongMap!13705)

(assert (=> b!1030889 (= (-!495 (getCurrentListMap!3916 (_keys!11316 thiss!1427) (_values!6166 thiss!1427) (mask!29929 thiss!1427) (extraKeys!5875 thiss!1427) (zeroValue!5979 thiss!1427) (minValue!5979 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6143 thiss!1427)) key!909) (getCurrentListMap!3916 lt!454892 lt!454899 (mask!29929 thiss!1427) (extraKeys!5875 thiss!1427) (zeroValue!5979 thiss!1427) (minValue!5979 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6143 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9696 0))(
  ( (MissingZero!9696 (index!41155 (_ BitVec 32))) (Found!9696 (index!41156 (_ BitVec 32))) (Intermediate!9696 (undefined!10508 Bool) (index!41157 (_ BitVec 32)) (x!91764 (_ BitVec 32))) (Undefined!9696) (MissingVacant!9696 (index!41158 (_ BitVec 32))) )
))
(declare-fun lt!454896 () SeekEntryResult!9696)

(declare-fun dynLambda!1965 (Int (_ BitVec 64)) V!37341)

(assert (=> b!1030889 (= lt!454899 (array!64769 (store (arr!31186 (_values!6166 thiss!1427)) (index!41156 lt!454896) (ValueCellFull!11472 (dynLambda!1965 (defaultEntry!6143 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31703 (_values!6166 thiss!1427))))))

(declare-fun lt!454893 () Unit!33681)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!21 (array!64766 array!64768 (_ BitVec 32) (_ BitVec 32) V!37341 V!37341 (_ BitVec 32) (_ BitVec 64) Int) Unit!33681)

(assert (=> b!1030889 (= lt!454893 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!21 (_keys!11316 thiss!1427) (_values!6166 thiss!1427) (mask!29929 thiss!1427) (extraKeys!5875 thiss!1427) (zeroValue!5979 thiss!1427) (minValue!5979 thiss!1427) (index!41156 lt!454896) key!909 (defaultEntry!6143 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030889 (not (arrayContainsKey!0 lt!454892 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454894 () Unit!33681)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64766 (_ BitVec 32) (_ BitVec 64)) Unit!33681)

(assert (=> b!1030889 (= lt!454894 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11316 thiss!1427) (index!41156 lt!454896) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64766 (_ BitVec 32)) Bool)

(assert (=> b!1030889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454892 (mask!29929 thiss!1427))))

(declare-fun lt!454901 () Unit!33681)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64766 (_ BitVec 32) (_ BitVec 32)) Unit!33681)

(assert (=> b!1030889 (= lt!454901 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11316 thiss!1427) (index!41156 lt!454896) (mask!29929 thiss!1427)))))

(declare-datatypes ((List!21847 0))(
  ( (Nil!21844) (Cons!21843 (h!23045 (_ BitVec 64)) (t!30973 List!21847)) )
))
(declare-fun arrayNoDuplicates!0 (array!64766 (_ BitVec 32) List!21847) Bool)

(assert (=> b!1030889 (arrayNoDuplicates!0 lt!454892 #b00000000000000000000000000000000 Nil!21844)))

(declare-fun lt!454897 () Unit!33681)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64766 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21847) Unit!33681)

(assert (=> b!1030889 (= lt!454897 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11316 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41156 lt!454896) #b00000000000000000000000000000000 Nil!21844))))

(declare-fun arrayCountValidKeys!0 (array!64766 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030889 (= (arrayCountValidKeys!0 lt!454892 #b00000000000000000000000000000000 (size!31702 (_keys!11316 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11316 thiss!1427) #b00000000000000000000000000000000 (size!31702 (_keys!11316 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030889 (= lt!454892 (array!64767 (store (arr!31185 (_keys!11316 thiss!1427)) (index!41156 lt!454896) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31702 (_keys!11316 thiss!1427))))))

(declare-fun lt!454898 () Unit!33681)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64766 (_ BitVec 32) (_ BitVec 64)) Unit!33681)

(assert (=> b!1030889 (= lt!454898 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11316 thiss!1427) (index!41156 lt!454896) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030890 () Bool)

(declare-fun e!582184 () Bool)

(declare-fun e!582182 () Bool)

(assert (=> b!1030890 (= e!582184 (and e!582182 mapRes!37980))))

(declare-fun condMapEmpty!37980 () Bool)

(declare-fun mapDefault!37980 () ValueCell!11472)

(assert (=> b!1030890 (= condMapEmpty!37980 (= (arr!31186 (_values!6166 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11472)) mapDefault!37980)))))

(declare-fun e!582185 () Bool)

(declare-fun tp_is_empty!24351 () Bool)

(declare-fun array_inv!24141 (array!64766) Bool)

(declare-fun array_inv!24142 (array!64768) Bool)

(assert (=> b!1030891 (= e!582185 (and tp!72964 tp_is_empty!24351 (array_inv!24141 (_keys!11316 thiss!1427)) (array_inv!24142 (_values!6166 thiss!1427)) e!582184))))

(declare-fun b!1030892 () Bool)

(declare-fun res!689315 () Bool)

(assert (=> b!1030892 (=> res!689315 e!582183)))

(assert (=> b!1030892 (= res!689315 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11316 (_2!7815 lt!454900)) (mask!29929 (_2!7815 lt!454900)))))))

(declare-fun b!1030893 () Bool)

(declare-fun e!582189 () Bool)

(assert (=> b!1030893 (= e!582189 tp_is_empty!24351)))

(declare-fun b!1030895 () Bool)

(declare-fun res!689319 () Bool)

(assert (=> b!1030895 (=> res!689319 e!582183)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030895 (= res!689319 (not (validMask!0 (mask!29929 (_2!7815 lt!454900)))))))

(declare-fun b!1030896 () Bool)

(assert (=> b!1030896 (= e!582187 e!582188)))

(declare-fun res!689320 () Bool)

(assert (=> b!1030896 (=> (not res!689320) (not e!582188))))

(get-info :version)

(assert (=> b!1030896 (= res!689320 ((_ is Found!9696) lt!454896))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64766 (_ BitVec 32)) SeekEntryResult!9696)

(assert (=> b!1030896 (= lt!454896 (seekEntry!0 key!909 (_keys!11316 thiss!1427) (mask!29929 thiss!1427)))))

(declare-fun mapNonEmpty!37980 () Bool)

(declare-fun tp!72963 () Bool)

(assert (=> mapNonEmpty!37980 (= mapRes!37980 (and tp!72963 e!582189))))

(declare-fun mapKey!37980 () (_ BitVec 32))

(declare-fun mapValue!37980 () ValueCell!11472)

(declare-fun mapRest!37980 () (Array (_ BitVec 32) ValueCell!11472))

(assert (=> mapNonEmpty!37980 (= (arr!31186 (_values!6166 thiss!1427)) (store mapRest!37980 mapKey!37980 mapValue!37980))))

(declare-fun b!1030897 () Bool)

(assert (=> b!1030897 (= e!582182 tp_is_empty!24351)))

(declare-fun res!689316 () Bool)

(assert (=> start!90024 (=> (not res!689316) (not e!582187))))

(declare-fun valid!2097 (LongMapFixedSize!5538) Bool)

(assert (=> start!90024 (= res!689316 (valid!2097 thiss!1427))))

(assert (=> start!90024 e!582187))

(assert (=> start!90024 e!582185))

(assert (=> start!90024 true))

(declare-fun b!1030894 () Bool)

(assert (=> b!1030894 (= e!582183 true)))

(declare-fun lt!454895 () Bool)

(assert (=> b!1030894 (= lt!454895 (arrayNoDuplicates!0 (_keys!11316 (_2!7815 lt!454900)) #b00000000000000000000000000000000 Nil!21844))))

(assert (= (and start!90024 res!689316) b!1030888))

(assert (= (and b!1030888 res!689321) b!1030896))

(assert (= (and b!1030896 res!689320) b!1030889))

(assert (= (and b!1030889 (not res!689318)) b!1030895))

(assert (= (and b!1030895 (not res!689319)) b!1030887))

(assert (= (and b!1030887 (not res!689317)) b!1030892))

(assert (= (and b!1030892 (not res!689315)) b!1030894))

(assert (= (and b!1030890 condMapEmpty!37980) mapIsEmpty!37980))

(assert (= (and b!1030890 (not condMapEmpty!37980)) mapNonEmpty!37980))

(assert (= (and mapNonEmpty!37980 ((_ is ValueCellFull!11472) mapValue!37980)) b!1030893))

(assert (= (and b!1030890 ((_ is ValueCellFull!11472) mapDefault!37980)) b!1030897))

(assert (= b!1030891 b!1030890))

(assert (= start!90024 b!1030891))

(declare-fun b_lambda!15975 () Bool)

(assert (=> (not b_lambda!15975) (not b!1030889)))

(declare-fun t!30971 () Bool)

(declare-fun tb!6949 () Bool)

(assert (=> (and b!1030891 (= (defaultEntry!6143 thiss!1427) (defaultEntry!6143 thiss!1427)) t!30971) tb!6949))

(declare-fun result!14227 () Bool)

(assert (=> tb!6949 (= result!14227 tp_is_empty!24351)))

(assert (=> b!1030889 t!30971))

(declare-fun b_and!33031 () Bool)

(assert (= b_and!33029 (and (=> t!30971 result!14227) b_and!33031)))

(declare-fun m!950737 () Bool)

(assert (=> b!1030896 m!950737))

(declare-fun m!950739 () Bool)

(assert (=> b!1030895 m!950739))

(declare-fun m!950741 () Bool)

(assert (=> b!1030894 m!950741))

(declare-fun m!950743 () Bool)

(assert (=> b!1030891 m!950743))

(declare-fun m!950745 () Bool)

(assert (=> b!1030891 m!950745))

(declare-fun m!950747 () Bool)

(assert (=> b!1030892 m!950747))

(declare-fun m!950749 () Bool)

(assert (=> mapNonEmpty!37980 m!950749))

(declare-fun m!950751 () Bool)

(assert (=> start!90024 m!950751))

(declare-fun m!950753 () Bool)

(assert (=> b!1030889 m!950753))

(declare-fun m!950755 () Bool)

(assert (=> b!1030889 m!950755))

(declare-fun m!950757 () Bool)

(assert (=> b!1030889 m!950757))

(declare-fun m!950759 () Bool)

(assert (=> b!1030889 m!950759))

(declare-fun m!950761 () Bool)

(assert (=> b!1030889 m!950761))

(declare-fun m!950763 () Bool)

(assert (=> b!1030889 m!950763))

(declare-fun m!950765 () Bool)

(assert (=> b!1030889 m!950765))

(assert (=> b!1030889 m!950761))

(declare-fun m!950767 () Bool)

(assert (=> b!1030889 m!950767))

(declare-fun m!950769 () Bool)

(assert (=> b!1030889 m!950769))

(declare-fun m!950771 () Bool)

(assert (=> b!1030889 m!950771))

(declare-fun m!950773 () Bool)

(assert (=> b!1030889 m!950773))

(declare-fun m!950775 () Bool)

(assert (=> b!1030889 m!950775))

(declare-fun m!950777 () Bool)

(assert (=> b!1030889 m!950777))

(declare-fun m!950779 () Bool)

(assert (=> b!1030889 m!950779))

(assert (=> b!1030889 m!950769))

(declare-fun m!950781 () Bool)

(assert (=> b!1030889 m!950781))

(declare-fun m!950783 () Bool)

(assert (=> b!1030889 m!950783))

(declare-fun m!950785 () Bool)

(assert (=> b!1030889 m!950785))

(declare-fun m!950787 () Bool)

(assert (=> b!1030889 m!950787))

(check-sat (not b!1030894) (not mapNonEmpty!37980) (not b!1030895) b_and!33031 (not b!1030889) (not b_lambda!15975) (not start!90024) (not b!1030891) (not b!1030892) (not b!1030896) tp_is_empty!24351 (not b_next!20631))
(check-sat b_and!33031 (not b_next!20631))
