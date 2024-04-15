; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90026 () Bool)

(assert start!90026)

(declare-fun b!1030806 () Bool)

(declare-fun b_free!20635 () Bool)

(declare-fun b_next!20635 () Bool)

(assert (=> b!1030806 (= b_free!20635 (not b_next!20635))))

(declare-fun tp!72975 () Bool)

(declare-fun b_and!33011 () Bool)

(assert (=> b!1030806 (= tp!72975 b_and!33011)))

(declare-fun b!1030807 () Bool)

(declare-fun e!582143 () Bool)

(declare-fun tp_is_empty!24355 () Bool)

(assert (=> b!1030807 (= e!582143 tp_is_empty!24355)))

(declare-fun mapNonEmpty!37986 () Bool)

(declare-fun mapRes!37986 () Bool)

(declare-fun tp!72976 () Bool)

(assert (=> mapNonEmpty!37986 (= mapRes!37986 (and tp!72976 e!582143))))

(declare-fun mapKey!37986 () (_ BitVec 32))

(declare-datatypes ((V!37347 0))(
  ( (V!37348 (val!12228 Int)) )
))
(declare-datatypes ((ValueCell!11474 0))(
  ( (ValueCellFull!11474 (v!14804 V!37347)) (EmptyCell!11474) )
))
(declare-fun mapValue!37986 () ValueCell!11474)

(declare-datatypes ((array!64713 0))(
  ( (array!64714 (arr!31158 (Array (_ BitVec 32) (_ BitVec 64))) (size!31677 (_ BitVec 32))) )
))
(declare-datatypes ((array!64715 0))(
  ( (array!64716 (arr!31159 (Array (_ BitVec 32) ValueCell!11474)) (size!31678 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5542 0))(
  ( (LongMapFixedSize!5543 (defaultEntry!6145 Int) (mask!29928 (_ BitVec 32)) (extraKeys!5877 (_ BitVec 32)) (zeroValue!5981 V!37347) (minValue!5981 V!37347) (_size!2826 (_ BitVec 32)) (_keys!11314 array!64713) (_values!6168 array!64715) (_vacant!2826 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5542)

(declare-fun mapRest!37986 () (Array (_ BitVec 32) ValueCell!11474))

(assert (=> mapNonEmpty!37986 (= (arr!31159 (_values!6168 thiss!1427)) (store mapRest!37986 mapKey!37986 mapValue!37986))))

(declare-fun b!1030808 () Bool)

(declare-fun e!582145 () Bool)

(assert (=> b!1030808 (= e!582145 true)))

(declare-fun lt!454754 () Bool)

(declare-datatypes ((Unit!33579 0))(
  ( (Unit!33580) )
))
(declare-datatypes ((tuple2!15702 0))(
  ( (tuple2!15703 (_1!7862 Unit!33579) (_2!7862 LongMapFixedSize!5542)) )
))
(declare-fun lt!454752 () tuple2!15702)

(declare-datatypes ((List!21882 0))(
  ( (Nil!21879) (Cons!21878 (h!23080 (_ BitVec 64)) (t!31003 List!21882)) )
))
(declare-fun arrayNoDuplicates!0 (array!64713 (_ BitVec 32) List!21882) Bool)

(assert (=> b!1030808 (= lt!454754 (arrayNoDuplicates!0 (_keys!11314 (_2!7862 lt!454752)) #b00000000000000000000000000000000 Nil!21879))))

(declare-fun b!1030809 () Bool)

(declare-fun res!689295 () Bool)

(declare-fun e!582144 () Bool)

(assert (=> b!1030809 (=> (not res!689295) (not e!582144))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1030809 (= res!689295 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1030810 () Bool)

(declare-fun e!582142 () Bool)

(declare-fun e!582141 () Bool)

(assert (=> b!1030810 (= e!582142 (and e!582141 mapRes!37986))))

(declare-fun condMapEmpty!37986 () Bool)

(declare-fun mapDefault!37986 () ValueCell!11474)

(assert (=> b!1030810 (= condMapEmpty!37986 (= (arr!31159 (_values!6168 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11474)) mapDefault!37986)))))

(declare-fun b!1030811 () Bool)

(declare-fun res!689291 () Bool)

(assert (=> b!1030811 (=> res!689291 e!582145)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64713 (_ BitVec 32)) Bool)

(assert (=> b!1030811 (= res!689291 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11314 (_2!7862 lt!454752)) (mask!29928 (_2!7862 lt!454752)))))))

(declare-fun b!1030812 () Bool)

(declare-fun e!582139 () Bool)

(assert (=> b!1030812 (= e!582144 e!582139)))

(declare-fun res!689294 () Bool)

(assert (=> b!1030812 (=> (not res!689294) (not e!582139))))

(declare-datatypes ((SeekEntryResult!9687 0))(
  ( (MissingZero!9687 (index!41119 (_ BitVec 32))) (Found!9687 (index!41120 (_ BitVec 32))) (Intermediate!9687 (undefined!10499 Bool) (index!41121 (_ BitVec 32)) (x!91764 (_ BitVec 32))) (Undefined!9687) (MissingVacant!9687 (index!41122 (_ BitVec 32))) )
))
(declare-fun lt!454755 () SeekEntryResult!9687)

(get-info :version)

(assert (=> b!1030812 (= res!689294 ((_ is Found!9687) lt!454755))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64713 (_ BitVec 32)) SeekEntryResult!9687)

(assert (=> b!1030812 (= lt!454755 (seekEntry!0 key!909 (_keys!11314 thiss!1427) (mask!29928 thiss!1427)))))

(declare-fun b!1030813 () Bool)

(assert (=> b!1030813 (= e!582141 tp_is_empty!24355)))

(declare-fun res!689296 () Bool)

(assert (=> start!90026 (=> (not res!689296) (not e!582144))))

(declare-fun valid!2088 (LongMapFixedSize!5542) Bool)

(assert (=> start!90026 (= res!689296 (valid!2088 thiss!1427))))

(assert (=> start!90026 e!582144))

(declare-fun e!582140 () Bool)

(assert (=> start!90026 e!582140))

(assert (=> start!90026 true))

(declare-fun array_inv!24121 (array!64713) Bool)

(declare-fun array_inv!24122 (array!64715) Bool)

(assert (=> b!1030806 (= e!582140 (and tp!72975 tp_is_empty!24355 (array_inv!24121 (_keys!11314 thiss!1427)) (array_inv!24122 (_values!6168 thiss!1427)) e!582142))))

(declare-fun b!1030814 () Bool)

(assert (=> b!1030814 (= e!582139 (not e!582145))))

(declare-fun res!689293 () Bool)

(assert (=> b!1030814 (=> res!689293 e!582145)))

(declare-datatypes ((tuple2!15704 0))(
  ( (tuple2!15705 (_1!7863 (_ BitVec 64)) (_2!7863 V!37347)) )
))
(declare-datatypes ((List!21883 0))(
  ( (Nil!21880) (Cons!21879 (h!23081 tuple2!15704) (t!31004 List!21883)) )
))
(declare-datatypes ((ListLongMap!13783 0))(
  ( (ListLongMap!13784 (toList!6907 List!21883)) )
))
(declare-fun contains!5963 (ListLongMap!13783 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3874 (array!64713 array!64715 (_ BitVec 32) (_ BitVec 32) V!37347 V!37347 (_ BitVec 32) Int) ListLongMap!13783)

(assert (=> b!1030814 (= res!689293 (not (contains!5963 (getCurrentListMap!3874 (_keys!11314 (_2!7862 lt!454752)) (_values!6168 (_2!7862 lt!454752)) (mask!29928 (_2!7862 lt!454752)) (extraKeys!5877 (_2!7862 lt!454752)) (zeroValue!5981 (_2!7862 lt!454752)) (minValue!5981 (_2!7862 lt!454752)) #b00000000000000000000000000000000 (defaultEntry!6145 (_2!7862 lt!454752))) key!909)))))

(declare-fun lt!454757 () array!64713)

(declare-fun lt!454759 () array!64715)

(declare-fun Unit!33581 () Unit!33579)

(declare-fun Unit!33582 () Unit!33579)

(assert (=> b!1030814 (= lt!454752 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2826 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15703 Unit!33581 (LongMapFixedSize!5543 (defaultEntry!6145 thiss!1427) (mask!29928 thiss!1427) (extraKeys!5877 thiss!1427) (zeroValue!5981 thiss!1427) (minValue!5981 thiss!1427) (bvsub (_size!2826 thiss!1427) #b00000000000000000000000000000001) lt!454757 lt!454759 (bvadd #b00000000000000000000000000000001 (_vacant!2826 thiss!1427)))) (tuple2!15703 Unit!33582 (LongMapFixedSize!5543 (defaultEntry!6145 thiss!1427) (mask!29928 thiss!1427) (extraKeys!5877 thiss!1427) (zeroValue!5981 thiss!1427) (minValue!5981 thiss!1427) (bvsub (_size!2826 thiss!1427) #b00000000000000000000000000000001) lt!454757 lt!454759 (_vacant!2826 thiss!1427)))))))

(declare-fun -!499 (ListLongMap!13783 (_ BitVec 64)) ListLongMap!13783)

(assert (=> b!1030814 (= (-!499 (getCurrentListMap!3874 (_keys!11314 thiss!1427) (_values!6168 thiss!1427) (mask!29928 thiss!1427) (extraKeys!5877 thiss!1427) (zeroValue!5981 thiss!1427) (minValue!5981 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6145 thiss!1427)) key!909) (getCurrentListMap!3874 lt!454757 lt!454759 (mask!29928 thiss!1427) (extraKeys!5877 thiss!1427) (zeroValue!5981 thiss!1427) (minValue!5981 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6145 thiss!1427)))))

(declare-fun dynLambda!1961 (Int (_ BitVec 64)) V!37347)

(assert (=> b!1030814 (= lt!454759 (array!64716 (store (arr!31159 (_values!6168 thiss!1427)) (index!41120 lt!454755) (ValueCellFull!11474 (dynLambda!1961 (defaultEntry!6145 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31678 (_values!6168 thiss!1427))))))

(declare-fun lt!454753 () Unit!33579)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!24 (array!64713 array!64715 (_ BitVec 32) (_ BitVec 32) V!37347 V!37347 (_ BitVec 32) (_ BitVec 64) Int) Unit!33579)

(assert (=> b!1030814 (= lt!454753 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!24 (_keys!11314 thiss!1427) (_values!6168 thiss!1427) (mask!29928 thiss!1427) (extraKeys!5877 thiss!1427) (zeroValue!5981 thiss!1427) (minValue!5981 thiss!1427) (index!41120 lt!454755) key!909 (defaultEntry!6145 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030814 (not (arrayContainsKey!0 lt!454757 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454756 () Unit!33579)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64713 (_ BitVec 32) (_ BitVec 64)) Unit!33579)

(assert (=> b!1030814 (= lt!454756 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11314 thiss!1427) (index!41120 lt!454755) key!909))))

(assert (=> b!1030814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454757 (mask!29928 thiss!1427))))

(declare-fun lt!454760 () Unit!33579)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64713 (_ BitVec 32) (_ BitVec 32)) Unit!33579)

(assert (=> b!1030814 (= lt!454760 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11314 thiss!1427) (index!41120 lt!454755) (mask!29928 thiss!1427)))))

(assert (=> b!1030814 (arrayNoDuplicates!0 lt!454757 #b00000000000000000000000000000000 Nil!21879)))

(declare-fun lt!454761 () Unit!33579)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64713 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21882) Unit!33579)

(assert (=> b!1030814 (= lt!454761 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11314 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41120 lt!454755) #b00000000000000000000000000000000 Nil!21879))))

(declare-fun arrayCountValidKeys!0 (array!64713 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030814 (= (arrayCountValidKeys!0 lt!454757 #b00000000000000000000000000000000 (size!31677 (_keys!11314 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11314 thiss!1427) #b00000000000000000000000000000000 (size!31677 (_keys!11314 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030814 (= lt!454757 (array!64714 (store (arr!31158 (_keys!11314 thiss!1427)) (index!41120 lt!454755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31677 (_keys!11314 thiss!1427))))))

(declare-fun lt!454758 () Unit!33579)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64713 (_ BitVec 32) (_ BitVec 64)) Unit!33579)

(assert (=> b!1030814 (= lt!454758 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11314 thiss!1427) (index!41120 lt!454755) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030815 () Bool)

(declare-fun res!689290 () Bool)

(assert (=> b!1030815 (=> res!689290 e!582145)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030815 (= res!689290 (not (validMask!0 (mask!29928 (_2!7862 lt!454752)))))))

(declare-fun mapIsEmpty!37986 () Bool)

(assert (=> mapIsEmpty!37986 mapRes!37986))

(declare-fun b!1030816 () Bool)

(declare-fun res!689292 () Bool)

(assert (=> b!1030816 (=> res!689292 e!582145)))

(assert (=> b!1030816 (= res!689292 (or (not (= (size!31678 (_values!6168 (_2!7862 lt!454752))) (bvadd #b00000000000000000000000000000001 (mask!29928 (_2!7862 lt!454752))))) (not (= (size!31677 (_keys!11314 (_2!7862 lt!454752))) (size!31678 (_values!6168 (_2!7862 lt!454752))))) (bvslt (mask!29928 (_2!7862 lt!454752)) #b00000000000000000000000000000000) (bvslt (extraKeys!5877 (_2!7862 lt!454752)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5877 (_2!7862 lt!454752)) #b00000000000000000000000000000011)))))

(assert (= (and start!90026 res!689296) b!1030809))

(assert (= (and b!1030809 res!689295) b!1030812))

(assert (= (and b!1030812 res!689294) b!1030814))

(assert (= (and b!1030814 (not res!689293)) b!1030815))

(assert (= (and b!1030815 (not res!689290)) b!1030816))

(assert (= (and b!1030816 (not res!689292)) b!1030811))

(assert (= (and b!1030811 (not res!689291)) b!1030808))

(assert (= (and b!1030810 condMapEmpty!37986) mapIsEmpty!37986))

(assert (= (and b!1030810 (not condMapEmpty!37986)) mapNonEmpty!37986))

(assert (= (and mapNonEmpty!37986 ((_ is ValueCellFull!11474) mapValue!37986)) b!1030807))

(assert (= (and b!1030810 ((_ is ValueCellFull!11474) mapDefault!37986)) b!1030813))

(assert (= b!1030806 b!1030810))

(assert (= start!90026 b!1030806))

(declare-fun b_lambda!15957 () Bool)

(assert (=> (not b_lambda!15957) (not b!1030814)))

(declare-fun t!31002 () Bool)

(declare-fun tb!6945 () Bool)

(assert (=> (and b!1030806 (= (defaultEntry!6145 thiss!1427) (defaultEntry!6145 thiss!1427)) t!31002) tb!6945))

(declare-fun result!14227 () Bool)

(assert (=> tb!6945 (= result!14227 tp_is_empty!24355)))

(assert (=> b!1030814 t!31002))

(declare-fun b_and!33013 () Bool)

(assert (= b_and!33011 (and (=> t!31002 result!14227) b_and!33013)))

(declare-fun m!950221 () Bool)

(assert (=> start!90026 m!950221))

(declare-fun m!950223 () Bool)

(assert (=> b!1030811 m!950223))

(declare-fun m!950225 () Bool)

(assert (=> b!1030814 m!950225))

(declare-fun m!950227 () Bool)

(assert (=> b!1030814 m!950227))

(declare-fun m!950229 () Bool)

(assert (=> b!1030814 m!950229))

(declare-fun m!950231 () Bool)

(assert (=> b!1030814 m!950231))

(declare-fun m!950233 () Bool)

(assert (=> b!1030814 m!950233))

(declare-fun m!950235 () Bool)

(assert (=> b!1030814 m!950235))

(declare-fun m!950237 () Bool)

(assert (=> b!1030814 m!950237))

(declare-fun m!950239 () Bool)

(assert (=> b!1030814 m!950239))

(declare-fun m!950241 () Bool)

(assert (=> b!1030814 m!950241))

(declare-fun m!950243 () Bool)

(assert (=> b!1030814 m!950243))

(declare-fun m!950245 () Bool)

(assert (=> b!1030814 m!950245))

(declare-fun m!950247 () Bool)

(assert (=> b!1030814 m!950247))

(declare-fun m!950249 () Bool)

(assert (=> b!1030814 m!950249))

(declare-fun m!950251 () Bool)

(assert (=> b!1030814 m!950251))

(declare-fun m!950253 () Bool)

(assert (=> b!1030814 m!950253))

(assert (=> b!1030814 m!950251))

(declare-fun m!950255 () Bool)

(assert (=> b!1030814 m!950255))

(assert (=> b!1030814 m!950237))

(declare-fun m!950257 () Bool)

(assert (=> b!1030814 m!950257))

(declare-fun m!950259 () Bool)

(assert (=> b!1030814 m!950259))

(declare-fun m!950261 () Bool)

(assert (=> b!1030806 m!950261))

(declare-fun m!950263 () Bool)

(assert (=> b!1030806 m!950263))

(declare-fun m!950265 () Bool)

(assert (=> b!1030815 m!950265))

(declare-fun m!950267 () Bool)

(assert (=> b!1030812 m!950267))

(declare-fun m!950269 () Bool)

(assert (=> mapNonEmpty!37986 m!950269))

(declare-fun m!950271 () Bool)

(assert (=> b!1030808 m!950271))

(check-sat b_and!33013 (not b!1030812) (not b_lambda!15957) (not start!90026) (not b!1030808) (not b_next!20635) (not b!1030806) tp_is_empty!24355 (not b!1030814) (not b!1030815) (not mapNonEmpty!37986) (not b!1030811))
(check-sat b_and!33013 (not b_next!20635))
