; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90020 () Bool)

(assert start!90020)

(declare-fun b!1030702 () Bool)

(declare-fun b_free!20629 () Bool)

(declare-fun b_next!20629 () Bool)

(assert (=> b!1030702 (= b_free!20629 (not b_next!20629))))

(declare-fun tp!72957 () Bool)

(declare-fun b_and!32999 () Bool)

(assert (=> b!1030702 (= tp!72957 b_and!32999)))

(declare-fun b!1030701 () Bool)

(declare-fun e!582069 () Bool)

(declare-fun e!582073 () Bool)

(assert (=> b!1030701 (= e!582069 (not e!582073))))

(declare-fun res!689227 () Bool)

(assert (=> b!1030701 (=> res!689227 e!582073)))

(declare-datatypes ((V!37339 0))(
  ( (V!37340 (val!12225 Int)) )
))
(declare-datatypes ((ValueCell!11471 0))(
  ( (ValueCellFull!11471 (v!14801 V!37339)) (EmptyCell!11471) )
))
(declare-datatypes ((Unit!33569 0))(
  ( (Unit!33570) )
))
(declare-datatypes ((array!64701 0))(
  ( (array!64702 (arr!31152 (Array (_ BitVec 32) (_ BitVec 64))) (size!31671 (_ BitVec 32))) )
))
(declare-datatypes ((array!64703 0))(
  ( (array!64704 (arr!31153 (Array (_ BitVec 32) ValueCell!11471)) (size!31672 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5536 0))(
  ( (LongMapFixedSize!5537 (defaultEntry!6142 Int) (mask!29923 (_ BitVec 32)) (extraKeys!5874 (_ BitVec 32)) (zeroValue!5978 V!37339) (minValue!5978 V!37339) (_size!2823 (_ BitVec 32)) (_keys!11311 array!64701) (_values!6165 array!64703) (_vacant!2823 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15692 0))(
  ( (tuple2!15693 (_1!7857 Unit!33569) (_2!7857 LongMapFixedSize!5536)) )
))
(declare-fun lt!454664 () tuple2!15692)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15694 0))(
  ( (tuple2!15695 (_1!7858 (_ BitVec 64)) (_2!7858 V!37339)) )
))
(declare-datatypes ((List!21878 0))(
  ( (Nil!21875) (Cons!21874 (h!23076 tuple2!15694) (t!30993 List!21878)) )
))
(declare-datatypes ((ListLongMap!13779 0))(
  ( (ListLongMap!13780 (toList!6905 List!21878)) )
))
(declare-fun contains!5961 (ListLongMap!13779 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3872 (array!64701 array!64703 (_ BitVec 32) (_ BitVec 32) V!37339 V!37339 (_ BitVec 32) Int) ListLongMap!13779)

(assert (=> b!1030701 (= res!689227 (not (contains!5961 (getCurrentListMap!3872 (_keys!11311 (_2!7857 lt!454664)) (_values!6165 (_2!7857 lt!454664)) (mask!29923 (_2!7857 lt!454664)) (extraKeys!5874 (_2!7857 lt!454664)) (zeroValue!5978 (_2!7857 lt!454664)) (minValue!5978 (_2!7857 lt!454664)) #b00000000000000000000000000000000 (defaultEntry!6142 (_2!7857 lt!454664))) key!909)))))

(declare-fun lt!454669 () array!64701)

(declare-fun thiss!1427 () LongMapFixedSize!5536)

(declare-fun lt!454665 () array!64703)

(declare-fun Unit!33571 () Unit!33569)

(declare-fun Unit!33572 () Unit!33569)

(assert (=> b!1030701 (= lt!454664 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2823 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15693 Unit!33571 (LongMapFixedSize!5537 (defaultEntry!6142 thiss!1427) (mask!29923 thiss!1427) (extraKeys!5874 thiss!1427) (zeroValue!5978 thiss!1427) (minValue!5978 thiss!1427) (bvsub (_size!2823 thiss!1427) #b00000000000000000000000000000001) lt!454669 lt!454665 (bvadd #b00000000000000000000000000000001 (_vacant!2823 thiss!1427)))) (tuple2!15693 Unit!33572 (LongMapFixedSize!5537 (defaultEntry!6142 thiss!1427) (mask!29923 thiss!1427) (extraKeys!5874 thiss!1427) (zeroValue!5978 thiss!1427) (minValue!5978 thiss!1427) (bvsub (_size!2823 thiss!1427) #b00000000000000000000000000000001) lt!454669 lt!454665 (_vacant!2823 thiss!1427)))))))

(declare-fun -!497 (ListLongMap!13779 (_ BitVec 64)) ListLongMap!13779)

(assert (=> b!1030701 (= (-!497 (getCurrentListMap!3872 (_keys!11311 thiss!1427) (_values!6165 thiss!1427) (mask!29923 thiss!1427) (extraKeys!5874 thiss!1427) (zeroValue!5978 thiss!1427) (minValue!5978 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6142 thiss!1427)) key!909) (getCurrentListMap!3872 lt!454669 lt!454665 (mask!29923 thiss!1427) (extraKeys!5874 thiss!1427) (zeroValue!5978 thiss!1427) (minValue!5978 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6142 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9684 0))(
  ( (MissingZero!9684 (index!41107 (_ BitVec 32))) (Found!9684 (index!41108 (_ BitVec 32))) (Intermediate!9684 (undefined!10496 Bool) (index!41109 (_ BitVec 32)) (x!91747 (_ BitVec 32))) (Undefined!9684) (MissingVacant!9684 (index!41110 (_ BitVec 32))) )
))
(declare-fun lt!454670 () SeekEntryResult!9684)

(declare-fun dynLambda!1959 (Int (_ BitVec 64)) V!37339)

(assert (=> b!1030701 (= lt!454665 (array!64704 (store (arr!31153 (_values!6165 thiss!1427)) (index!41108 lt!454670) (ValueCellFull!11471 (dynLambda!1959 (defaultEntry!6142 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6165 thiss!1427))))))

(declare-fun lt!454671 () Unit!33569)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!22 (array!64701 array!64703 (_ BitVec 32) (_ BitVec 32) V!37339 V!37339 (_ BitVec 32) (_ BitVec 64) Int) Unit!33569)

(assert (=> b!1030701 (= lt!454671 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!22 (_keys!11311 thiss!1427) (_values!6165 thiss!1427) (mask!29923 thiss!1427) (extraKeys!5874 thiss!1427) (zeroValue!5978 thiss!1427) (minValue!5978 thiss!1427) (index!41108 lt!454670) key!909 (defaultEntry!6142 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030701 (not (arrayContainsKey!0 lt!454669 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454668 () Unit!33569)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64701 (_ BitVec 32) (_ BitVec 64)) Unit!33569)

(assert (=> b!1030701 (= lt!454668 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11311 thiss!1427) (index!41108 lt!454670) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64701 (_ BitVec 32)) Bool)

(assert (=> b!1030701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454669 (mask!29923 thiss!1427))))

(declare-fun lt!454666 () Unit!33569)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64701 (_ BitVec 32) (_ BitVec 32)) Unit!33569)

(assert (=> b!1030701 (= lt!454666 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11311 thiss!1427) (index!41108 lt!454670) (mask!29923 thiss!1427)))))

(declare-datatypes ((List!21879 0))(
  ( (Nil!21876) (Cons!21875 (h!23077 (_ BitVec 64)) (t!30994 List!21879)) )
))
(declare-fun arrayNoDuplicates!0 (array!64701 (_ BitVec 32) List!21879) Bool)

(assert (=> b!1030701 (arrayNoDuplicates!0 lt!454669 #b00000000000000000000000000000000 Nil!21876)))

(declare-fun lt!454662 () Unit!33569)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64701 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21879) Unit!33569)

(assert (=> b!1030701 (= lt!454662 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11311 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41108 lt!454670) #b00000000000000000000000000000000 Nil!21876))))

(declare-fun arrayCountValidKeys!0 (array!64701 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030701 (= (arrayCountValidKeys!0 lt!454669 #b00000000000000000000000000000000 (size!31671 (_keys!11311 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11311 thiss!1427) #b00000000000000000000000000000000 (size!31671 (_keys!11311 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030701 (= lt!454669 (array!64702 (store (arr!31152 (_keys!11311 thiss!1427)) (index!41108 lt!454670) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11311 thiss!1427))))))

(declare-fun lt!454663 () Unit!33569)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64701 (_ BitVec 32) (_ BitVec 64)) Unit!33569)

(assert (=> b!1030701 (= lt!454663 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11311 thiss!1427) (index!41108 lt!454670) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582068 () Bool)

(declare-fun tp_is_empty!24349 () Bool)

(declare-fun e!582074 () Bool)

(declare-fun array_inv!24115 (array!64701) Bool)

(declare-fun array_inv!24116 (array!64703) Bool)

(assert (=> b!1030702 (= e!582068 (and tp!72957 tp_is_empty!24349 (array_inv!24115 (_keys!11311 thiss!1427)) (array_inv!24116 (_values!6165 thiss!1427)) e!582074))))

(declare-fun b!1030703 () Bool)

(declare-fun e!582067 () Bool)

(assert (=> b!1030703 (= e!582067 tp_is_empty!24349)))

(declare-fun b!1030704 () Bool)

(declare-fun e!582071 () Bool)

(assert (=> b!1030704 (= e!582071 tp_is_empty!24349)))

(declare-fun b!1030705 () Bool)

(declare-fun res!689233 () Bool)

(declare-fun e!582072 () Bool)

(assert (=> b!1030705 (=> (not res!689233) (not e!582072))))

(assert (=> b!1030705 (= res!689233 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!37977 () Bool)

(declare-fun mapRes!37977 () Bool)

(declare-fun tp!72958 () Bool)

(assert (=> mapNonEmpty!37977 (= mapRes!37977 (and tp!72958 e!582071))))

(declare-fun mapValue!37977 () ValueCell!11471)

(declare-fun mapKey!37977 () (_ BitVec 32))

(declare-fun mapRest!37977 () (Array (_ BitVec 32) ValueCell!11471))

(assert (=> mapNonEmpty!37977 (= (arr!31153 (_values!6165 thiss!1427)) (store mapRest!37977 mapKey!37977 mapValue!37977))))

(declare-fun b!1030706 () Bool)

(assert (=> b!1030706 (= e!582073 true)))

(declare-fun lt!454667 () Bool)

(assert (=> b!1030706 (= lt!454667 (arrayNoDuplicates!0 (_keys!11311 (_2!7857 lt!454664)) #b00000000000000000000000000000000 Nil!21876))))

(declare-fun mapIsEmpty!37977 () Bool)

(assert (=> mapIsEmpty!37977 mapRes!37977))

(declare-fun b!1030707 () Bool)

(assert (=> b!1030707 (= e!582072 e!582069)))

(declare-fun res!689229 () Bool)

(assert (=> b!1030707 (=> (not res!689229) (not e!582069))))

(get-info :version)

(assert (=> b!1030707 (= res!689229 ((_ is Found!9684) lt!454670))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64701 (_ BitVec 32)) SeekEntryResult!9684)

(assert (=> b!1030707 (= lt!454670 (seekEntry!0 key!909 (_keys!11311 thiss!1427) (mask!29923 thiss!1427)))))

(declare-fun b!1030708 () Bool)

(declare-fun res!689228 () Bool)

(assert (=> b!1030708 (=> res!689228 e!582073)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030708 (= res!689228 (not (validMask!0 (mask!29923 (_2!7857 lt!454664)))))))

(declare-fun b!1030709 () Bool)

(declare-fun res!689230 () Bool)

(assert (=> b!1030709 (=> res!689230 e!582073)))

(assert (=> b!1030709 (= res!689230 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11311 (_2!7857 lt!454664)) (mask!29923 (_2!7857 lt!454664)))))))

(declare-fun res!689231 () Bool)

(assert (=> start!90020 (=> (not res!689231) (not e!582072))))

(declare-fun valid!2086 (LongMapFixedSize!5536) Bool)

(assert (=> start!90020 (= res!689231 (valid!2086 thiss!1427))))

(assert (=> start!90020 e!582072))

(assert (=> start!90020 e!582068))

(assert (=> start!90020 true))

(declare-fun b!1030710 () Bool)

(assert (=> b!1030710 (= e!582074 (and e!582067 mapRes!37977))))

(declare-fun condMapEmpty!37977 () Bool)

(declare-fun mapDefault!37977 () ValueCell!11471)

(assert (=> b!1030710 (= condMapEmpty!37977 (= (arr!31153 (_values!6165 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11471)) mapDefault!37977)))))

(declare-fun b!1030711 () Bool)

(declare-fun res!689232 () Bool)

(assert (=> b!1030711 (=> res!689232 e!582073)))

(assert (=> b!1030711 (= res!689232 (or (not (= (size!31672 (_values!6165 (_2!7857 lt!454664))) (bvadd #b00000000000000000000000000000001 (mask!29923 (_2!7857 lt!454664))))) (not (= (size!31671 (_keys!11311 (_2!7857 lt!454664))) (size!31672 (_values!6165 (_2!7857 lt!454664))))) (bvslt (mask!29923 (_2!7857 lt!454664)) #b00000000000000000000000000000000) (bvslt (extraKeys!5874 (_2!7857 lt!454664)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5874 (_2!7857 lt!454664)) #b00000000000000000000000000000011)))))

(assert (= (and start!90020 res!689231) b!1030705))

(assert (= (and b!1030705 res!689233) b!1030707))

(assert (= (and b!1030707 res!689229) b!1030701))

(assert (= (and b!1030701 (not res!689227)) b!1030708))

(assert (= (and b!1030708 (not res!689228)) b!1030711))

(assert (= (and b!1030711 (not res!689232)) b!1030709))

(assert (= (and b!1030709 (not res!689230)) b!1030706))

(assert (= (and b!1030710 condMapEmpty!37977) mapIsEmpty!37977))

(assert (= (and b!1030710 (not condMapEmpty!37977)) mapNonEmpty!37977))

(assert (= (and mapNonEmpty!37977 ((_ is ValueCellFull!11471) mapValue!37977)) b!1030704))

(assert (= (and b!1030710 ((_ is ValueCellFull!11471) mapDefault!37977)) b!1030703))

(assert (= b!1030702 b!1030710))

(assert (= start!90020 b!1030702))

(declare-fun b_lambda!15951 () Bool)

(assert (=> (not b_lambda!15951) (not b!1030701)))

(declare-fun t!30992 () Bool)

(declare-fun tb!6939 () Bool)

(assert (=> (and b!1030702 (= (defaultEntry!6142 thiss!1427) (defaultEntry!6142 thiss!1427)) t!30992) tb!6939))

(declare-fun result!14215 () Bool)

(assert (=> tb!6939 (= result!14215 tp_is_empty!24349)))

(assert (=> b!1030701 t!30992))

(declare-fun b_and!33001 () Bool)

(assert (= b_and!32999 (and (=> t!30992 result!14215) b_and!33001)))

(declare-fun m!950065 () Bool)

(assert (=> b!1030707 m!950065))

(declare-fun m!950067 () Bool)

(assert (=> mapNonEmpty!37977 m!950067))

(declare-fun m!950069 () Bool)

(assert (=> b!1030708 m!950069))

(declare-fun m!950071 () Bool)

(assert (=> b!1030706 m!950071))

(declare-fun m!950073 () Bool)

(assert (=> start!90020 m!950073))

(declare-fun m!950075 () Bool)

(assert (=> b!1030702 m!950075))

(declare-fun m!950077 () Bool)

(assert (=> b!1030702 m!950077))

(declare-fun m!950079 () Bool)

(assert (=> b!1030709 m!950079))

(declare-fun m!950081 () Bool)

(assert (=> b!1030701 m!950081))

(declare-fun m!950083 () Bool)

(assert (=> b!1030701 m!950083))

(declare-fun m!950085 () Bool)

(assert (=> b!1030701 m!950085))

(declare-fun m!950087 () Bool)

(assert (=> b!1030701 m!950087))

(declare-fun m!950089 () Bool)

(assert (=> b!1030701 m!950089))

(declare-fun m!950091 () Bool)

(assert (=> b!1030701 m!950091))

(declare-fun m!950093 () Bool)

(assert (=> b!1030701 m!950093))

(assert (=> b!1030701 m!950091))

(declare-fun m!950095 () Bool)

(assert (=> b!1030701 m!950095))

(declare-fun m!950097 () Bool)

(assert (=> b!1030701 m!950097))

(declare-fun m!950099 () Bool)

(assert (=> b!1030701 m!950099))

(declare-fun m!950101 () Bool)

(assert (=> b!1030701 m!950101))

(declare-fun m!950103 () Bool)

(assert (=> b!1030701 m!950103))

(declare-fun m!950105 () Bool)

(assert (=> b!1030701 m!950105))

(declare-fun m!950107 () Bool)

(assert (=> b!1030701 m!950107))

(declare-fun m!950109 () Bool)

(assert (=> b!1030701 m!950109))

(declare-fun m!950111 () Bool)

(assert (=> b!1030701 m!950111))

(declare-fun m!950113 () Bool)

(assert (=> b!1030701 m!950113))

(assert (=> b!1030701 m!950085))

(declare-fun m!950115 () Bool)

(assert (=> b!1030701 m!950115))

(check-sat (not b!1030702) (not b!1030706) (not b_next!20629) (not b!1030709) (not b!1030701) (not b!1030707) (not b!1030708) b_and!33001 tp_is_empty!24349 (not b_lambda!15951) (not mapNonEmpty!37977) (not start!90020))
(check-sat b_and!33001 (not b_next!20629))
