; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90020 () Bool)

(assert start!90020)

(declare-fun b!1030823 () Bool)

(declare-fun b_free!20627 () Bool)

(declare-fun b_next!20627 () Bool)

(assert (=> b!1030823 (= b_free!20627 (not b_next!20627))))

(declare-fun tp!72952 () Bool)

(declare-fun b_and!33021 () Bool)

(assert (=> b!1030823 (= tp!72952 b_and!33021)))

(declare-fun b!1030817 () Bool)

(declare-fun res!689274 () Bool)

(declare-fun e!582134 () Bool)

(assert (=> b!1030817 (=> (not res!689274) (not e!582134))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1030817 (= res!689274 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37974 () Bool)

(declare-fun mapRes!37974 () Bool)

(assert (=> mapIsEmpty!37974 mapRes!37974))

(declare-fun b!1030818 () Bool)

(declare-fun e!582140 () Bool)

(assert (=> b!1030818 (= e!582140 true)))

(declare-fun lt!454833 () Bool)

(declare-datatypes ((V!37335 0))(
  ( (V!37336 (val!12224 Int)) )
))
(declare-datatypes ((ValueCell!11470 0))(
  ( (ValueCellFull!11470 (v!14801 V!37335)) (EmptyCell!11470) )
))
(declare-datatypes ((Unit!33675 0))(
  ( (Unit!33676) )
))
(declare-datatypes ((array!64758 0))(
  ( (array!64759 (arr!31181 (Array (_ BitVec 32) (_ BitVec 64))) (size!31698 (_ BitVec 32))) )
))
(declare-datatypes ((array!64760 0))(
  ( (array!64761 (arr!31182 (Array (_ BitVec 32) ValueCell!11470)) (size!31699 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5534 0))(
  ( (LongMapFixedSize!5535 (defaultEntry!6141 Int) (mask!29925 (_ BitVec 32)) (extraKeys!5873 (_ BitVec 32)) (zeroValue!5977 V!37335) (minValue!5977 V!37335) (_size!2822 (_ BitVec 32)) (_keys!11314 array!64758) (_values!6164 array!64760) (_vacant!2822 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15602 0))(
  ( (tuple2!15603 (_1!7812 Unit!33675) (_2!7812 LongMapFixedSize!5534)) )
))
(declare-fun lt!454838 () tuple2!15602)

(declare-datatypes ((List!21843 0))(
  ( (Nil!21840) (Cons!21839 (h!23041 (_ BitVec 64)) (t!30965 List!21843)) )
))
(declare-fun arrayNoDuplicates!0 (array!64758 (_ BitVec 32) List!21843) Bool)

(assert (=> b!1030818 (= lt!454833 (arrayNoDuplicates!0 (_keys!11314 (_2!7812 lt!454838)) #b00000000000000000000000000000000 Nil!21840))))

(declare-fun b!1030819 () Bool)

(declare-fun res!689273 () Bool)

(assert (=> b!1030819 (=> res!689273 e!582140)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64758 (_ BitVec 32)) Bool)

(assert (=> b!1030819 (= res!689273 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11314 (_2!7812 lt!454838)) (mask!29925 (_2!7812 lt!454838)))))))

(declare-fun b!1030820 () Bool)

(declare-fun e!582137 () Bool)

(declare-fun tp_is_empty!24347 () Bool)

(assert (=> b!1030820 (= e!582137 tp_is_empty!24347)))

(declare-fun mapNonEmpty!37974 () Bool)

(declare-fun tp!72951 () Bool)

(declare-fun e!582138 () Bool)

(assert (=> mapNonEmpty!37974 (= mapRes!37974 (and tp!72951 e!582138))))

(declare-fun mapKey!37974 () (_ BitVec 32))

(declare-fun mapValue!37974 () ValueCell!11470)

(declare-fun thiss!1427 () LongMapFixedSize!5534)

(declare-fun mapRest!37974 () (Array (_ BitVec 32) ValueCell!11470))

(assert (=> mapNonEmpty!37974 (= (arr!31182 (_values!6164 thiss!1427)) (store mapRest!37974 mapKey!37974 mapValue!37974))))

(declare-fun b!1030821 () Bool)

(declare-fun e!582139 () Bool)

(assert (=> b!1030821 (= e!582139 (not e!582140))))

(declare-fun res!689279 () Bool)

(assert (=> b!1030821 (=> res!689279 e!582140)))

(declare-datatypes ((tuple2!15604 0))(
  ( (tuple2!15605 (_1!7813 (_ BitVec 64)) (_2!7813 V!37335)) )
))
(declare-datatypes ((List!21844 0))(
  ( (Nil!21841) (Cons!21840 (h!23042 tuple2!15604) (t!30966 List!21844)) )
))
(declare-datatypes ((ListLongMap!13703 0))(
  ( (ListLongMap!13704 (toList!6867 List!21844)) )
))
(declare-fun contains!5981 (ListLongMap!13703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3915 (array!64758 array!64760 (_ BitVec 32) (_ BitVec 32) V!37335 V!37335 (_ BitVec 32) Int) ListLongMap!13703)

(assert (=> b!1030821 (= res!689279 (not (contains!5981 (getCurrentListMap!3915 (_keys!11314 (_2!7812 lt!454838)) (_values!6164 (_2!7812 lt!454838)) (mask!29925 (_2!7812 lt!454838)) (extraKeys!5873 (_2!7812 lt!454838)) (zeroValue!5977 (_2!7812 lt!454838)) (minValue!5977 (_2!7812 lt!454838)) #b00000000000000000000000000000000 (defaultEntry!6141 (_2!7812 lt!454838))) key!909)))))

(declare-fun lt!454832 () array!64760)

(declare-fun lt!454841 () array!64758)

(declare-fun Unit!33677 () Unit!33675)

(declare-fun Unit!33678 () Unit!33675)

(assert (=> b!1030821 (= lt!454838 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2822 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15603 Unit!33677 (LongMapFixedSize!5535 (defaultEntry!6141 thiss!1427) (mask!29925 thiss!1427) (extraKeys!5873 thiss!1427) (zeroValue!5977 thiss!1427) (minValue!5977 thiss!1427) (bvsub (_size!2822 thiss!1427) #b00000000000000000000000000000001) lt!454841 lt!454832 (bvadd #b00000000000000000000000000000001 (_vacant!2822 thiss!1427)))) (tuple2!15603 Unit!33678 (LongMapFixedSize!5535 (defaultEntry!6141 thiss!1427) (mask!29925 thiss!1427) (extraKeys!5873 thiss!1427) (zeroValue!5977 thiss!1427) (minValue!5977 thiss!1427) (bvsub (_size!2822 thiss!1427) #b00000000000000000000000000000001) lt!454841 lt!454832 (_vacant!2822 thiss!1427)))))))

(declare-fun -!494 (ListLongMap!13703 (_ BitVec 64)) ListLongMap!13703)

(assert (=> b!1030821 (= (-!494 (getCurrentListMap!3915 (_keys!11314 thiss!1427) (_values!6164 thiss!1427) (mask!29925 thiss!1427) (extraKeys!5873 thiss!1427) (zeroValue!5977 thiss!1427) (minValue!5977 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6141 thiss!1427)) key!909) (getCurrentListMap!3915 lt!454841 lt!454832 (mask!29925 thiss!1427) (extraKeys!5873 thiss!1427) (zeroValue!5977 thiss!1427) (minValue!5977 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6141 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9694 0))(
  ( (MissingZero!9694 (index!41147 (_ BitVec 32))) (Found!9694 (index!41148 (_ BitVec 32))) (Intermediate!9694 (undefined!10506 Bool) (index!41149 (_ BitVec 32)) (x!91750 (_ BitVec 32))) (Undefined!9694) (MissingVacant!9694 (index!41150 (_ BitVec 32))) )
))
(declare-fun lt!454839 () SeekEntryResult!9694)

(declare-fun dynLambda!1964 (Int (_ BitVec 64)) V!37335)

(assert (=> b!1030821 (= lt!454832 (array!64761 (store (arr!31182 (_values!6164 thiss!1427)) (index!41148 lt!454839) (ValueCellFull!11470 (dynLambda!1964 (defaultEntry!6141 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31699 (_values!6164 thiss!1427))))))

(declare-fun lt!454840 () Unit!33675)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!20 (array!64758 array!64760 (_ BitVec 32) (_ BitVec 32) V!37335 V!37335 (_ BitVec 32) (_ BitVec 64) Int) Unit!33675)

(assert (=> b!1030821 (= lt!454840 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!20 (_keys!11314 thiss!1427) (_values!6164 thiss!1427) (mask!29925 thiss!1427) (extraKeys!5873 thiss!1427) (zeroValue!5977 thiss!1427) (minValue!5977 thiss!1427) (index!41148 lt!454839) key!909 (defaultEntry!6141 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030821 (not (arrayContainsKey!0 lt!454841 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454837 () Unit!33675)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64758 (_ BitVec 32) (_ BitVec 64)) Unit!33675)

(assert (=> b!1030821 (= lt!454837 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11314 thiss!1427) (index!41148 lt!454839) key!909))))

(assert (=> b!1030821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454841 (mask!29925 thiss!1427))))

(declare-fun lt!454834 () Unit!33675)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64758 (_ BitVec 32) (_ BitVec 32)) Unit!33675)

(assert (=> b!1030821 (= lt!454834 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11314 thiss!1427) (index!41148 lt!454839) (mask!29925 thiss!1427)))))

(assert (=> b!1030821 (arrayNoDuplicates!0 lt!454841 #b00000000000000000000000000000000 Nil!21840)))

(declare-fun lt!454835 () Unit!33675)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64758 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21843) Unit!33675)

(assert (=> b!1030821 (= lt!454835 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11314 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41148 lt!454839) #b00000000000000000000000000000000 Nil!21840))))

(declare-fun arrayCountValidKeys!0 (array!64758 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030821 (= (arrayCountValidKeys!0 lt!454841 #b00000000000000000000000000000000 (size!31698 (_keys!11314 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11314 thiss!1427) #b00000000000000000000000000000000 (size!31698 (_keys!11314 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030821 (= lt!454841 (array!64759 (store (arr!31181 (_keys!11314 thiss!1427)) (index!41148 lt!454839) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31698 (_keys!11314 thiss!1427))))))

(declare-fun lt!454836 () Unit!33675)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64758 (_ BitVec 32) (_ BitVec 64)) Unit!33675)

(assert (=> b!1030821 (= lt!454836 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11314 thiss!1427) (index!41148 lt!454839) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030822 () Bool)

(assert (=> b!1030822 (= e!582134 e!582139)))

(declare-fun res!689277 () Bool)

(assert (=> b!1030822 (=> (not res!689277) (not e!582139))))

(assert (=> b!1030822 (= res!689277 (is-Found!9694 lt!454839))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64758 (_ BitVec 32)) SeekEntryResult!9694)

(assert (=> b!1030822 (= lt!454839 (seekEntry!0 key!909 (_keys!11314 thiss!1427) (mask!29925 thiss!1427)))))

(declare-fun e!582136 () Bool)

(declare-fun e!582141 () Bool)

(declare-fun array_inv!24137 (array!64758) Bool)

(declare-fun array_inv!24138 (array!64760) Bool)

(assert (=> b!1030823 (= e!582141 (and tp!72952 tp_is_empty!24347 (array_inv!24137 (_keys!11314 thiss!1427)) (array_inv!24138 (_values!6164 thiss!1427)) e!582136))))

(declare-fun res!689276 () Bool)

(assert (=> start!90020 (=> (not res!689276) (not e!582134))))

(declare-fun valid!2095 (LongMapFixedSize!5534) Bool)

(assert (=> start!90020 (= res!689276 (valid!2095 thiss!1427))))

(assert (=> start!90020 e!582134))

(assert (=> start!90020 e!582141))

(assert (=> start!90020 true))

(declare-fun b!1030824 () Bool)

(declare-fun res!689275 () Bool)

(assert (=> b!1030824 (=> res!689275 e!582140)))

(assert (=> b!1030824 (= res!689275 (or (not (= (size!31699 (_values!6164 (_2!7812 lt!454838))) (bvadd #b00000000000000000000000000000001 (mask!29925 (_2!7812 lt!454838))))) (not (= (size!31698 (_keys!11314 (_2!7812 lt!454838))) (size!31699 (_values!6164 (_2!7812 lt!454838))))) (bvslt (mask!29925 (_2!7812 lt!454838)) #b00000000000000000000000000000000) (bvslt (extraKeys!5873 (_2!7812 lt!454838)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5873 (_2!7812 lt!454838)) #b00000000000000000000000000000011)))))

(declare-fun b!1030825 () Bool)

(assert (=> b!1030825 (= e!582136 (and e!582137 mapRes!37974))))

(declare-fun condMapEmpty!37974 () Bool)

(declare-fun mapDefault!37974 () ValueCell!11470)

