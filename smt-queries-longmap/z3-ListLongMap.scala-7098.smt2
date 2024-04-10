; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90036 () Bool)

(assert start!90036)

(declare-fun b!1031100 () Bool)

(declare-fun b_free!20643 () Bool)

(declare-fun b_next!20643 () Bool)

(assert (=> b!1031100 (= b_free!20643 (not b_next!20643))))

(declare-fun tp!72999 () Bool)

(declare-fun b_and!33053 () Bool)

(assert (=> b!1031100 (= tp!72999 b_and!33053)))

(declare-fun b!1031097 () Bool)

(declare-fun res!689442 () Bool)

(declare-fun e!582332 () Bool)

(assert (=> b!1031097 (=> (not res!689442) (not e!582332))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1031097 (= res!689442 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37998 () Bool)

(declare-fun mapRes!37998 () Bool)

(assert (=> mapIsEmpty!37998 mapRes!37998))

(declare-fun b!1031098 () Bool)

(declare-fun e!582326 () Bool)

(declare-fun e!582333 () Bool)

(assert (=> b!1031098 (= e!582326 (and e!582333 mapRes!37998))))

(declare-fun condMapEmpty!37998 () Bool)

(declare-datatypes ((V!37357 0))(
  ( (V!37358 (val!12232 Int)) )
))
(declare-datatypes ((ValueCell!11478 0))(
  ( (ValueCellFull!11478 (v!14809 V!37357)) (EmptyCell!11478) )
))
(declare-datatypes ((array!64790 0))(
  ( (array!64791 (arr!31197 (Array (_ BitVec 32) (_ BitVec 64))) (size!31714 (_ BitVec 32))) )
))
(declare-datatypes ((array!64792 0))(
  ( (array!64793 (arr!31198 (Array (_ BitVec 32) ValueCell!11478)) (size!31715 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5550 0))(
  ( (LongMapFixedSize!5551 (defaultEntry!6149 Int) (mask!29939 (_ BitVec 32)) (extraKeys!5881 (_ BitVec 32)) (zeroValue!5985 V!37357) (minValue!5985 V!37357) (_size!2830 (_ BitVec 32)) (_keys!11322 array!64790) (_values!6172 array!64792) (_vacant!2830 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5550)

(declare-fun mapDefault!37998 () ValueCell!11478)

(assert (=> b!1031098 (= condMapEmpty!37998 (= (arr!31198 (_values!6172 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11478)) mapDefault!37998)))))

(declare-fun b!1031099 () Bool)

(declare-fun res!689445 () Bool)

(declare-fun e!582328 () Bool)

(assert (=> b!1031099 (=> res!689445 e!582328)))

(declare-datatypes ((Unit!33701 0))(
  ( (Unit!33702) )
))
(declare-datatypes ((tuple2!15628 0))(
  ( (tuple2!15629 (_1!7825 Unit!33701) (_2!7825 LongMapFixedSize!5550)) )
))
(declare-fun lt!455079 () tuple2!15628)

(assert (=> b!1031099 (= res!689445 (or (not (= (size!31715 (_values!6172 (_2!7825 lt!455079))) (bvadd #b00000000000000000000000000000001 (mask!29939 (_2!7825 lt!455079))))) (not (= (size!31714 (_keys!11322 (_2!7825 lt!455079))) (size!31715 (_values!6172 (_2!7825 lt!455079))))) (bvslt (mask!29939 (_2!7825 lt!455079)) #b00000000000000000000000000000000) (bvslt (extraKeys!5881 (_2!7825 lt!455079)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5881 (_2!7825 lt!455079)) #b00000000000000000000000000000011)))))

(declare-fun b!1031101 () Bool)

(declare-fun e!582331 () Bool)

(declare-fun tp_is_empty!24363 () Bool)

(assert (=> b!1031101 (= e!582331 tp_is_empty!24363)))

(declare-fun b!1031102 () Bool)

(assert (=> b!1031102 (= e!582333 tp_is_empty!24363)))

(declare-fun mapNonEmpty!37998 () Bool)

(declare-fun tp!73000 () Bool)

(assert (=> mapNonEmpty!37998 (= mapRes!37998 (and tp!73000 e!582331))))

(declare-fun mapRest!37998 () (Array (_ BitVec 32) ValueCell!11478))

(declare-fun mapKey!37998 () (_ BitVec 32))

(declare-fun mapValue!37998 () ValueCell!11478)

(assert (=> mapNonEmpty!37998 (= (arr!31198 (_values!6172 thiss!1427)) (store mapRest!37998 mapKey!37998 mapValue!37998))))

(declare-fun b!1031103 () Bool)

(declare-fun e!582327 () Bool)

(assert (=> b!1031103 (= e!582332 e!582327)))

(declare-fun res!689441 () Bool)

(assert (=> b!1031103 (=> (not res!689441) (not e!582327))))

(declare-datatypes ((SeekEntryResult!9700 0))(
  ( (MissingZero!9700 (index!41171 (_ BitVec 32))) (Found!9700 (index!41172 (_ BitVec 32))) (Intermediate!9700 (undefined!10512 Bool) (index!41173 (_ BitVec 32)) (x!91796 (_ BitVec 32))) (Undefined!9700) (MissingVacant!9700 (index!41174 (_ BitVec 32))) )
))
(declare-fun lt!455076 () SeekEntryResult!9700)

(get-info :version)

(assert (=> b!1031103 (= res!689441 ((_ is Found!9700) lt!455076))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64790 (_ BitVec 32)) SeekEntryResult!9700)

(assert (=> b!1031103 (= lt!455076 (seekEntry!0 key!909 (_keys!11322 thiss!1427) (mask!29939 thiss!1427)))))

(declare-fun b!1031104 () Bool)

(assert (=> b!1031104 (= e!582328 true)))

(declare-fun lt!455077 () Bool)

(declare-datatypes ((List!21854 0))(
  ( (Nil!21851) (Cons!21850 (h!23052 (_ BitVec 64)) (t!30992 List!21854)) )
))
(declare-fun arrayNoDuplicates!0 (array!64790 (_ BitVec 32) List!21854) Bool)

(assert (=> b!1031104 (= lt!455077 (arrayNoDuplicates!0 (_keys!11322 (_2!7825 lt!455079)) #b00000000000000000000000000000000 Nil!21851))))

(declare-fun b!1031105 () Bool)

(declare-fun res!689447 () Bool)

(assert (=> b!1031105 (=> res!689447 e!582328)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031105 (= res!689447 (not (validMask!0 (mask!29939 (_2!7825 lt!455079)))))))

(declare-fun res!689443 () Bool)

(assert (=> start!90036 (=> (not res!689443) (not e!582332))))

(declare-fun valid!2102 (LongMapFixedSize!5550) Bool)

(assert (=> start!90036 (= res!689443 (valid!2102 thiss!1427))))

(assert (=> start!90036 e!582332))

(declare-fun e!582329 () Bool)

(assert (=> start!90036 e!582329))

(assert (=> start!90036 true))

(declare-fun array_inv!24149 (array!64790) Bool)

(declare-fun array_inv!24150 (array!64792) Bool)

(assert (=> b!1031100 (= e!582329 (and tp!72999 tp_is_empty!24363 (array_inv!24149 (_keys!11322 thiss!1427)) (array_inv!24150 (_values!6172 thiss!1427)) e!582326))))

(declare-fun b!1031106 () Bool)

(assert (=> b!1031106 (= e!582327 (not e!582328))))

(declare-fun res!689444 () Bool)

(assert (=> b!1031106 (=> res!689444 e!582328)))

(declare-datatypes ((tuple2!15630 0))(
  ( (tuple2!15631 (_1!7826 (_ BitVec 64)) (_2!7826 V!37357)) )
))
(declare-datatypes ((List!21855 0))(
  ( (Nil!21852) (Cons!21851 (h!23053 tuple2!15630) (t!30993 List!21855)) )
))
(declare-datatypes ((ListLongMap!13713 0))(
  ( (ListLongMap!13714 (toList!6872 List!21855)) )
))
(declare-fun contains!5986 (ListLongMap!13713 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3920 (array!64790 array!64792 (_ BitVec 32) (_ BitVec 32) V!37357 V!37357 (_ BitVec 32) Int) ListLongMap!13713)

(assert (=> b!1031106 (= res!689444 (not (contains!5986 (getCurrentListMap!3920 (_keys!11322 (_2!7825 lt!455079)) (_values!6172 (_2!7825 lt!455079)) (mask!29939 (_2!7825 lt!455079)) (extraKeys!5881 (_2!7825 lt!455079)) (zeroValue!5985 (_2!7825 lt!455079)) (minValue!5985 (_2!7825 lt!455079)) #b00000000000000000000000000000000 (defaultEntry!6149 (_2!7825 lt!455079))) key!909)))))

(declare-fun lt!455073 () array!64792)

(declare-fun lt!455081 () array!64790)

(declare-fun Unit!33703 () Unit!33701)

(declare-fun Unit!33704 () Unit!33701)

(assert (=> b!1031106 (= lt!455079 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2830 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15629 Unit!33703 (LongMapFixedSize!5551 (defaultEntry!6149 thiss!1427) (mask!29939 thiss!1427) (extraKeys!5881 thiss!1427) (zeroValue!5985 thiss!1427) (minValue!5985 thiss!1427) (bvsub (_size!2830 thiss!1427) #b00000000000000000000000000000001) lt!455081 lt!455073 (bvadd #b00000000000000000000000000000001 (_vacant!2830 thiss!1427)))) (tuple2!15629 Unit!33704 (LongMapFixedSize!5551 (defaultEntry!6149 thiss!1427) (mask!29939 thiss!1427) (extraKeys!5881 thiss!1427) (zeroValue!5985 thiss!1427) (minValue!5985 thiss!1427) (bvsub (_size!2830 thiss!1427) #b00000000000000000000000000000001) lt!455081 lt!455073 (_vacant!2830 thiss!1427)))))))

(declare-fun -!499 (ListLongMap!13713 (_ BitVec 64)) ListLongMap!13713)

(assert (=> b!1031106 (= (-!499 (getCurrentListMap!3920 (_keys!11322 thiss!1427) (_values!6172 thiss!1427) (mask!29939 thiss!1427) (extraKeys!5881 thiss!1427) (zeroValue!5985 thiss!1427) (minValue!5985 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6149 thiss!1427)) key!909) (getCurrentListMap!3920 lt!455081 lt!455073 (mask!29939 thiss!1427) (extraKeys!5881 thiss!1427) (zeroValue!5985 thiss!1427) (minValue!5985 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6149 thiss!1427)))))

(declare-fun dynLambda!1969 (Int (_ BitVec 64)) V!37357)

(assert (=> b!1031106 (= lt!455073 (array!64793 (store (arr!31198 (_values!6172 thiss!1427)) (index!41172 lt!455076) (ValueCellFull!11478 (dynLambda!1969 (defaultEntry!6149 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31715 (_values!6172 thiss!1427))))))

(declare-fun lt!455074 () Unit!33701)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!25 (array!64790 array!64792 (_ BitVec 32) (_ BitVec 32) V!37357 V!37357 (_ BitVec 32) (_ BitVec 64) Int) Unit!33701)

(assert (=> b!1031106 (= lt!455074 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!25 (_keys!11322 thiss!1427) (_values!6172 thiss!1427) (mask!29939 thiss!1427) (extraKeys!5881 thiss!1427) (zeroValue!5985 thiss!1427) (minValue!5985 thiss!1427) (index!41172 lt!455076) key!909 (defaultEntry!6149 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031106 (not (arrayContainsKey!0 lt!455081 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455080 () Unit!33701)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64790 (_ BitVec 32) (_ BitVec 64)) Unit!33701)

(assert (=> b!1031106 (= lt!455080 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11322 thiss!1427) (index!41172 lt!455076) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64790 (_ BitVec 32)) Bool)

(assert (=> b!1031106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455081 (mask!29939 thiss!1427))))

(declare-fun lt!455075 () Unit!33701)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64790 (_ BitVec 32) (_ BitVec 32)) Unit!33701)

(assert (=> b!1031106 (= lt!455075 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11322 thiss!1427) (index!41172 lt!455076) (mask!29939 thiss!1427)))))

(assert (=> b!1031106 (arrayNoDuplicates!0 lt!455081 #b00000000000000000000000000000000 Nil!21851)))

(declare-fun lt!455072 () Unit!33701)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64790 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21854) Unit!33701)

(assert (=> b!1031106 (= lt!455072 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11322 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41172 lt!455076) #b00000000000000000000000000000000 Nil!21851))))

(declare-fun arrayCountValidKeys!0 (array!64790 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031106 (= (arrayCountValidKeys!0 lt!455081 #b00000000000000000000000000000000 (size!31714 (_keys!11322 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11322 thiss!1427) #b00000000000000000000000000000000 (size!31714 (_keys!11322 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031106 (= lt!455081 (array!64791 (store (arr!31197 (_keys!11322 thiss!1427)) (index!41172 lt!455076) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31714 (_keys!11322 thiss!1427))))))

(declare-fun lt!455078 () Unit!33701)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64790 (_ BitVec 32) (_ BitVec 64)) Unit!33701)

(assert (=> b!1031106 (= lt!455078 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11322 thiss!1427) (index!41172 lt!455076) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031107 () Bool)

(declare-fun res!689446 () Bool)

(assert (=> b!1031107 (=> res!689446 e!582328)))

(assert (=> b!1031107 (= res!689446 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11322 (_2!7825 lt!455079)) (mask!29939 (_2!7825 lt!455079)))))))

(assert (= (and start!90036 res!689443) b!1031097))

(assert (= (and b!1031097 res!689442) b!1031103))

(assert (= (and b!1031103 res!689441) b!1031106))

(assert (= (and b!1031106 (not res!689444)) b!1031105))

(assert (= (and b!1031105 (not res!689447)) b!1031099))

(assert (= (and b!1031099 (not res!689445)) b!1031107))

(assert (= (and b!1031107 (not res!689446)) b!1031104))

(assert (= (and b!1031098 condMapEmpty!37998) mapIsEmpty!37998))

(assert (= (and b!1031098 (not condMapEmpty!37998)) mapNonEmpty!37998))

(assert (= (and mapNonEmpty!37998 ((_ is ValueCellFull!11478) mapValue!37998)) b!1031101))

(assert (= (and b!1031098 ((_ is ValueCellFull!11478) mapDefault!37998)) b!1031102))

(assert (= b!1031100 b!1031098))

(assert (= start!90036 b!1031100))

(declare-fun b_lambda!15987 () Bool)

(assert (=> (not b_lambda!15987) (not b!1031106)))

(declare-fun t!30991 () Bool)

(declare-fun tb!6961 () Bool)

(assert (=> (and b!1031100 (= (defaultEntry!6149 thiss!1427) (defaultEntry!6149 thiss!1427)) t!30991) tb!6961))

(declare-fun result!14251 () Bool)

(assert (=> tb!6961 (= result!14251 tp_is_empty!24363)))

(assert (=> b!1031106 t!30991))

(declare-fun b_and!33055 () Bool)

(assert (= b_and!33053 (and (=> t!30991 result!14251) b_and!33055)))

(declare-fun m!951049 () Bool)

(assert (=> b!1031103 m!951049))

(declare-fun m!951051 () Bool)

(assert (=> b!1031106 m!951051))

(declare-fun m!951053 () Bool)

(assert (=> b!1031106 m!951053))

(declare-fun m!951055 () Bool)

(assert (=> b!1031106 m!951055))

(declare-fun m!951057 () Bool)

(assert (=> b!1031106 m!951057))

(declare-fun m!951059 () Bool)

(assert (=> b!1031106 m!951059))

(declare-fun m!951061 () Bool)

(assert (=> b!1031106 m!951061))

(declare-fun m!951063 () Bool)

(assert (=> b!1031106 m!951063))

(declare-fun m!951065 () Bool)

(assert (=> b!1031106 m!951065))

(declare-fun m!951067 () Bool)

(assert (=> b!1031106 m!951067))

(declare-fun m!951069 () Bool)

(assert (=> b!1031106 m!951069))

(declare-fun m!951071 () Bool)

(assert (=> b!1031106 m!951071))

(declare-fun m!951073 () Bool)

(assert (=> b!1031106 m!951073))

(declare-fun m!951075 () Bool)

(assert (=> b!1031106 m!951075))

(declare-fun m!951077 () Bool)

(assert (=> b!1031106 m!951077))

(declare-fun m!951079 () Bool)

(assert (=> b!1031106 m!951079))

(declare-fun m!951081 () Bool)

(assert (=> b!1031106 m!951081))

(assert (=> b!1031106 m!951051))

(declare-fun m!951083 () Bool)

(assert (=> b!1031106 m!951083))

(assert (=> b!1031106 m!951063))

(declare-fun m!951085 () Bool)

(assert (=> b!1031106 m!951085))

(declare-fun m!951087 () Bool)

(assert (=> mapNonEmpty!37998 m!951087))

(declare-fun m!951089 () Bool)

(assert (=> b!1031104 m!951089))

(declare-fun m!951091 () Bool)

(assert (=> b!1031105 m!951091))

(declare-fun m!951093 () Bool)

(assert (=> b!1031107 m!951093))

(declare-fun m!951095 () Bool)

(assert (=> start!90036 m!951095))

(declare-fun m!951097 () Bool)

(assert (=> b!1031100 m!951097))

(declare-fun m!951099 () Bool)

(assert (=> b!1031100 m!951099))

(check-sat (not mapNonEmpty!37998) (not start!90036) (not b_lambda!15987) (not b!1031105) (not b!1031107) (not b_next!20643) b_and!33055 (not b!1031106) tp_is_empty!24363 (not b!1031104) (not b!1031100) (not b!1031103))
(check-sat b_and!33055 (not b_next!20643))
