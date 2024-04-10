; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91980 () Bool)

(assert start!91980)

(declare-fun b!1045988 () Bool)

(declare-fun b_free!21153 () Bool)

(declare-fun b_next!21153 () Bool)

(assert (=> b!1045988 (= b_free!21153 (not b_next!21153))))

(declare-fun tp!74721 () Bool)

(declare-fun b_and!33801 () Bool)

(assert (=> b!1045988 (= tp!74721 b_and!33801)))

(declare-fun b!1045983 () Bool)

(declare-fun e!592985 () Bool)

(declare-fun e!592983 () Bool)

(assert (=> b!1045983 (= e!592985 e!592983)))

(declare-fun res!696381 () Bool)

(assert (=> b!1045983 (=> (not res!696381) (not e!592983))))

(declare-datatypes ((SeekEntryResult!9852 0))(
  ( (MissingZero!9852 (index!41779 (_ BitVec 32))) (Found!9852 (index!41780 (_ BitVec 32))) (Intermediate!9852 (undefined!10664 Bool) (index!41781 (_ BitVec 32)) (x!93442 (_ BitVec 32))) (Undefined!9852) (MissingVacant!9852 (index!41782 (_ BitVec 32))) )
))
(declare-fun lt!461947 () SeekEntryResult!9852)

(get-info :version)

(assert (=> b!1045983 (= res!696381 ((_ is Found!9852) lt!461947))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!38037 0))(
  ( (V!38038 (val!12487 Int)) )
))
(declare-datatypes ((ValueCell!11733 0))(
  ( (ValueCellFull!11733 (v!15084 V!38037)) (EmptyCell!11733) )
))
(declare-datatypes ((array!65924 0))(
  ( (array!65925 (arr!31707 (Array (_ BitVec 32) (_ BitVec 64))) (size!32242 (_ BitVec 32))) )
))
(declare-datatypes ((array!65926 0))(
  ( (array!65927 (arr!31708 (Array (_ BitVec 32) ValueCell!11733)) (size!32243 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6060 0))(
  ( (LongMapFixedSize!6061 (defaultEntry!6428 Int) (mask!30567 (_ BitVec 32)) (extraKeys!6156 (_ BitVec 32)) (zeroValue!6262 V!38037) (minValue!6262 V!38037) (_size!3085 (_ BitVec 32)) (_keys!11702 array!65924) (_values!6451 array!65926) (_vacant!3085 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6060)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65924 (_ BitVec 32)) SeekEntryResult!9852)

(assert (=> b!1045983 (= lt!461947 (seekEntry!0 key!909 (_keys!11702 thiss!1427) (mask!30567 thiss!1427)))))

(declare-fun b!1045984 () Bool)

(declare-fun e!592987 () Bool)

(declare-fun tp_is_empty!24873 () Bool)

(assert (=> b!1045984 (= e!592987 tp_is_empty!24873)))

(declare-fun b!1045985 () Bool)

(declare-fun res!696380 () Bool)

(declare-fun e!592986 () Bool)

(assert (=> b!1045985 (=> res!696380 e!592986)))

(declare-datatypes ((Unit!34173 0))(
  ( (Unit!34174) )
))
(declare-datatypes ((tuple2!15810 0))(
  ( (tuple2!15811 (_1!7916 Unit!34173) (_2!7916 LongMapFixedSize!6060)) )
))
(declare-fun lt!461952 () tuple2!15810)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65924 (_ BitVec 32)) Bool)

(assert (=> b!1045985 (= res!696380 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11702 (_2!7916 lt!461952)) (mask!30567 (_2!7916 lt!461952)))))))

(declare-fun b!1045986 () Bool)

(assert (=> b!1045986 (= e!592983 (not e!592986))))

(declare-fun res!696376 () Bool)

(assert (=> b!1045986 (=> res!696376 e!592986)))

(declare-datatypes ((tuple2!15812 0))(
  ( (tuple2!15813 (_1!7917 (_ BitVec 64)) (_2!7917 V!38037)) )
))
(declare-datatypes ((List!22026 0))(
  ( (Nil!22023) (Cons!22022 (h!23230 tuple2!15812) (t!31310 List!22026)) )
))
(declare-datatypes ((ListLongMap!13801 0))(
  ( (ListLongMap!13802 (toList!6916 List!22026)) )
))
(declare-fun contains!6086 (ListLongMap!13801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3964 (array!65924 array!65926 (_ BitVec 32) (_ BitVec 32) V!38037 V!38037 (_ BitVec 32) Int) ListLongMap!13801)

(assert (=> b!1045986 (= res!696376 (not (contains!6086 (getCurrentListMap!3964 (_keys!11702 (_2!7916 lt!461952)) (_values!6451 (_2!7916 lt!461952)) (mask!30567 (_2!7916 lt!461952)) (extraKeys!6156 (_2!7916 lt!461952)) (zeroValue!6262 (_2!7916 lt!461952)) (minValue!6262 (_2!7916 lt!461952)) #b00000000000000000000000000000000 (defaultEntry!6428 (_2!7916 lt!461952))) key!909)))))

(declare-fun lt!461949 () array!65926)

(declare-fun lt!461953 () array!65924)

(declare-fun Unit!34175 () Unit!34173)

(declare-fun Unit!34176 () Unit!34173)

(assert (=> b!1045986 (= lt!461952 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3085 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15811 Unit!34175 (LongMapFixedSize!6061 (defaultEntry!6428 thiss!1427) (mask!30567 thiss!1427) (extraKeys!6156 thiss!1427) (zeroValue!6262 thiss!1427) (minValue!6262 thiss!1427) (bvsub (_size!3085 thiss!1427) #b00000000000000000000000000000001) lt!461953 lt!461949 (bvadd #b00000000000000000000000000000001 (_vacant!3085 thiss!1427)))) (tuple2!15811 Unit!34176 (LongMapFixedSize!6061 (defaultEntry!6428 thiss!1427) (mask!30567 thiss!1427) (extraKeys!6156 thiss!1427) (zeroValue!6262 thiss!1427) (minValue!6262 thiss!1427) (bvsub (_size!3085 thiss!1427) #b00000000000000000000000000000001) lt!461953 lt!461949 (_vacant!3085 thiss!1427)))))))

(declare-fun -!543 (ListLongMap!13801 (_ BitVec 64)) ListLongMap!13801)

(assert (=> b!1045986 (= (-!543 (getCurrentListMap!3964 (_keys!11702 thiss!1427) (_values!6451 thiss!1427) (mask!30567 thiss!1427) (extraKeys!6156 thiss!1427) (zeroValue!6262 thiss!1427) (minValue!6262 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6428 thiss!1427)) key!909) (getCurrentListMap!3964 lt!461953 lt!461949 (mask!30567 thiss!1427) (extraKeys!6156 thiss!1427) (zeroValue!6262 thiss!1427) (minValue!6262 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6428 thiss!1427)))))

(declare-fun dynLambda!2013 (Int (_ BitVec 64)) V!38037)

(assert (=> b!1045986 (= lt!461949 (array!65927 (store (arr!31708 (_values!6451 thiss!1427)) (index!41780 lt!461947) (ValueCellFull!11733 (dynLambda!2013 (defaultEntry!6428 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32243 (_values!6451 thiss!1427))))))

(declare-fun lt!461946 () Unit!34173)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!64 (array!65924 array!65926 (_ BitVec 32) (_ BitVec 32) V!38037 V!38037 (_ BitVec 32) (_ BitVec 64) Int) Unit!34173)

(assert (=> b!1045986 (= lt!461946 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!64 (_keys!11702 thiss!1427) (_values!6451 thiss!1427) (mask!30567 thiss!1427) (extraKeys!6156 thiss!1427) (zeroValue!6262 thiss!1427) (minValue!6262 thiss!1427) (index!41780 lt!461947) key!909 (defaultEntry!6428 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045986 (not (arrayContainsKey!0 lt!461953 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461948 () Unit!34173)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65924 (_ BitVec 32) (_ BitVec 64)) Unit!34173)

(assert (=> b!1045986 (= lt!461948 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11702 thiss!1427) (index!41780 lt!461947) key!909))))

(assert (=> b!1045986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461953 (mask!30567 thiss!1427))))

(declare-fun lt!461954 () Unit!34173)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65924 (_ BitVec 32) (_ BitVec 32)) Unit!34173)

(assert (=> b!1045986 (= lt!461954 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11702 thiss!1427) (index!41780 lt!461947) (mask!30567 thiss!1427)))))

(declare-datatypes ((List!22027 0))(
  ( (Nil!22024) (Cons!22023 (h!23231 (_ BitVec 64)) (t!31311 List!22027)) )
))
(declare-fun arrayNoDuplicates!0 (array!65924 (_ BitVec 32) List!22027) Bool)

(assert (=> b!1045986 (arrayNoDuplicates!0 lt!461953 #b00000000000000000000000000000000 Nil!22024)))

(declare-fun lt!461951 () Unit!34173)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65924 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22027) Unit!34173)

(assert (=> b!1045986 (= lt!461951 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11702 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41780 lt!461947) #b00000000000000000000000000000000 Nil!22024))))

(declare-fun arrayCountValidKeys!0 (array!65924 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045986 (= (arrayCountValidKeys!0 lt!461953 #b00000000000000000000000000000000 (size!32242 (_keys!11702 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11702 thiss!1427) #b00000000000000000000000000000000 (size!32242 (_keys!11702 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045986 (= lt!461953 (array!65925 (store (arr!31707 (_keys!11702 thiss!1427)) (index!41780 lt!461947) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32242 (_keys!11702 thiss!1427))))))

(declare-fun lt!461950 () Unit!34173)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65924 (_ BitVec 32) (_ BitVec 64)) Unit!34173)

(assert (=> b!1045986 (= lt!461950 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11702 thiss!1427) (index!41780 lt!461947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045987 () Bool)

(declare-fun res!696378 () Bool)

(assert (=> b!1045987 (=> (not res!696378) (not e!592985))))

(assert (=> b!1045987 (= res!696378 (not (= key!909 (bvneg key!909))))))

(declare-fun e!592988 () Bool)

(declare-fun e!592982 () Bool)

(declare-fun array_inv!24489 (array!65924) Bool)

(declare-fun array_inv!24490 (array!65926) Bool)

(assert (=> b!1045988 (= e!592988 (and tp!74721 tp_is_empty!24873 (array_inv!24489 (_keys!11702 thiss!1427)) (array_inv!24490 (_values!6451 thiss!1427)) e!592982))))

(declare-fun mapNonEmpty!38954 () Bool)

(declare-fun mapRes!38954 () Bool)

(declare-fun tp!74720 () Bool)

(declare-fun e!592989 () Bool)

(assert (=> mapNonEmpty!38954 (= mapRes!38954 (and tp!74720 e!592989))))

(declare-fun mapKey!38954 () (_ BitVec 32))

(declare-fun mapRest!38954 () (Array (_ BitVec 32) ValueCell!11733))

(declare-fun mapValue!38954 () ValueCell!11733)

(assert (=> mapNonEmpty!38954 (= (arr!31708 (_values!6451 thiss!1427)) (store mapRest!38954 mapKey!38954 mapValue!38954))))

(declare-fun res!696377 () Bool)

(assert (=> start!91980 (=> (not res!696377) (not e!592985))))

(declare-fun valid!2273 (LongMapFixedSize!6060) Bool)

(assert (=> start!91980 (= res!696377 (valid!2273 thiss!1427))))

(assert (=> start!91980 e!592985))

(assert (=> start!91980 e!592988))

(assert (=> start!91980 true))

(declare-fun b!1045989 () Bool)

(assert (=> b!1045989 (= e!592986 (arrayNoDuplicates!0 (_keys!11702 (_2!7916 lt!461952)) #b00000000000000000000000000000000 Nil!22024))))

(declare-fun b!1045990 () Bool)

(declare-fun res!696379 () Bool)

(assert (=> b!1045990 (=> res!696379 e!592986)))

(assert (=> b!1045990 (= res!696379 (or (not (= (size!32243 (_values!6451 (_2!7916 lt!461952))) (bvadd #b00000000000000000000000000000001 (mask!30567 (_2!7916 lt!461952))))) (not (= (size!32242 (_keys!11702 (_2!7916 lt!461952))) (size!32243 (_values!6451 (_2!7916 lt!461952))))) (bvslt (mask!30567 (_2!7916 lt!461952)) #b00000000000000000000000000000000) (bvslt (extraKeys!6156 (_2!7916 lt!461952)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6156 (_2!7916 lt!461952)) #b00000000000000000000000000000011)))))

(declare-fun b!1045991 () Bool)

(assert (=> b!1045991 (= e!592989 tp_is_empty!24873)))

(declare-fun mapIsEmpty!38954 () Bool)

(assert (=> mapIsEmpty!38954 mapRes!38954))

(declare-fun b!1045992 () Bool)

(assert (=> b!1045992 (= e!592982 (and e!592987 mapRes!38954))))

(declare-fun condMapEmpty!38954 () Bool)

(declare-fun mapDefault!38954 () ValueCell!11733)

(assert (=> b!1045992 (= condMapEmpty!38954 (= (arr!31708 (_values!6451 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11733)) mapDefault!38954)))))

(declare-fun b!1045993 () Bool)

(declare-fun res!696375 () Bool)

(assert (=> b!1045993 (=> res!696375 e!592986)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045993 (= res!696375 (not (validMask!0 (mask!30567 (_2!7916 lt!461952)))))))

(assert (= (and start!91980 res!696377) b!1045987))

(assert (= (and b!1045987 res!696378) b!1045983))

(assert (= (and b!1045983 res!696381) b!1045986))

(assert (= (and b!1045986 (not res!696376)) b!1045993))

(assert (= (and b!1045993 (not res!696375)) b!1045990))

(assert (= (and b!1045990 (not res!696379)) b!1045985))

(assert (= (and b!1045985 (not res!696380)) b!1045989))

(assert (= (and b!1045992 condMapEmpty!38954) mapIsEmpty!38954))

(assert (= (and b!1045992 (not condMapEmpty!38954)) mapNonEmpty!38954))

(assert (= (and mapNonEmpty!38954 ((_ is ValueCellFull!11733) mapValue!38954)) b!1045991))

(assert (= (and b!1045992 ((_ is ValueCellFull!11733) mapDefault!38954)) b!1045984))

(assert (= b!1045988 b!1045992))

(assert (= start!91980 b!1045988))

(declare-fun b_lambda!16337 () Bool)

(assert (=> (not b_lambda!16337) (not b!1045986)))

(declare-fun t!31309 () Bool)

(declare-fun tb!7105 () Bool)

(assert (=> (and b!1045988 (= (defaultEntry!6428 thiss!1427) (defaultEntry!6428 thiss!1427)) t!31309) tb!7105))

(declare-fun result!14635 () Bool)

(assert (=> tb!7105 (= result!14635 tp_is_empty!24873)))

(assert (=> b!1045986 t!31309))

(declare-fun b_and!33803 () Bool)

(assert (= b_and!33801 (and (=> t!31309 result!14635) b_and!33803)))

(declare-fun m!965853 () Bool)

(assert (=> b!1045983 m!965853))

(declare-fun m!965855 () Bool)

(assert (=> start!91980 m!965855))

(declare-fun m!965857 () Bool)

(assert (=> b!1045989 m!965857))

(declare-fun m!965859 () Bool)

(assert (=> b!1045988 m!965859))

(declare-fun m!965861 () Bool)

(assert (=> b!1045988 m!965861))

(declare-fun m!965863 () Bool)

(assert (=> b!1045986 m!965863))

(declare-fun m!965865 () Bool)

(assert (=> b!1045986 m!965865))

(declare-fun m!965867 () Bool)

(assert (=> b!1045986 m!965867))

(declare-fun m!965869 () Bool)

(assert (=> b!1045986 m!965869))

(declare-fun m!965871 () Bool)

(assert (=> b!1045986 m!965871))

(declare-fun m!965873 () Bool)

(assert (=> b!1045986 m!965873))

(declare-fun m!965875 () Bool)

(assert (=> b!1045986 m!965875))

(declare-fun m!965877 () Bool)

(assert (=> b!1045986 m!965877))

(declare-fun m!965879 () Bool)

(assert (=> b!1045986 m!965879))

(assert (=> b!1045986 m!965877))

(declare-fun m!965881 () Bool)

(assert (=> b!1045986 m!965881))

(declare-fun m!965883 () Bool)

(assert (=> b!1045986 m!965883))

(declare-fun m!965885 () Bool)

(assert (=> b!1045986 m!965885))

(declare-fun m!965887 () Bool)

(assert (=> b!1045986 m!965887))

(declare-fun m!965889 () Bool)

(assert (=> b!1045986 m!965889))

(declare-fun m!965891 () Bool)

(assert (=> b!1045986 m!965891))

(declare-fun m!965893 () Bool)

(assert (=> b!1045986 m!965893))

(declare-fun m!965895 () Bool)

(assert (=> b!1045986 m!965895))

(declare-fun m!965897 () Bool)

(assert (=> b!1045986 m!965897))

(assert (=> b!1045986 m!965893))

(declare-fun m!965899 () Bool)

(assert (=> b!1045993 m!965899))

(declare-fun m!965901 () Bool)

(assert (=> mapNonEmpty!38954 m!965901))

(declare-fun m!965903 () Bool)

(assert (=> b!1045985 m!965903))

(check-sat (not b!1045985) tp_is_empty!24873 b_and!33803 (not b_lambda!16337) (not b!1045993) (not mapNonEmpty!38954) (not b!1045986) (not b!1045983) (not b!1045989) (not start!91980) (not b!1045988) (not b_next!21153))
(check-sat b_and!33803 (not b_next!21153))
