; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91976 () Bool)

(assert start!91976)

(declare-fun b!1045797 () Bool)

(declare-fun b_free!21151 () Bool)

(declare-fun b_next!21151 () Bool)

(assert (=> b!1045797 (= b_free!21151 (not b_next!21151))))

(declare-fun tp!74714 () Bool)

(declare-fun b_and!33771 () Bool)

(assert (=> b!1045797 (= tp!74714 b_and!33771)))

(declare-fun res!696291 () Bool)

(declare-fun e!592873 () Bool)

(assert (=> start!91976 (=> (not res!696291) (not e!592873))))

(declare-datatypes ((V!38035 0))(
  ( (V!38036 (val!12486 Int)) )
))
(declare-datatypes ((ValueCell!11732 0))(
  ( (ValueCellFull!11732 (v!15082 V!38035)) (EmptyCell!11732) )
))
(declare-datatypes ((array!65859 0))(
  ( (array!65860 (arr!31674 (Array (_ BitVec 32) (_ BitVec 64))) (size!32211 (_ BitVec 32))) )
))
(declare-datatypes ((array!65861 0))(
  ( (array!65862 (arr!31675 (Array (_ BitVec 32) ValueCell!11732)) (size!32212 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6058 0))(
  ( (LongMapFixedSize!6059 (defaultEntry!6427 Int) (mask!30561 (_ BitVec 32)) (extraKeys!6155 (_ BitVec 32)) (zeroValue!6261 V!38035) (minValue!6261 V!38035) (_size!3084 (_ BitVec 32)) (_keys!11697 array!65859) (_values!6450 array!65861) (_vacant!3084 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6058)

(declare-fun valid!2268 (LongMapFixedSize!6058) Bool)

(assert (=> start!91976 (= res!696291 (valid!2268 thiss!1427))))

(assert (=> start!91976 e!592873))

(declare-fun e!592869 () Bool)

(assert (=> start!91976 e!592869))

(assert (=> start!91976 true))

(declare-fun tp_is_empty!24871 () Bool)

(declare-fun e!592868 () Bool)

(declare-fun array_inv!24475 (array!65859) Bool)

(declare-fun array_inv!24476 (array!65861) Bool)

(assert (=> b!1045797 (= e!592869 (and tp!74714 tp_is_empty!24871 (array_inv!24475 (_keys!11697 thiss!1427)) (array_inv!24476 (_values!6450 thiss!1427)) e!592868))))

(declare-fun b!1045798 () Bool)

(declare-fun e!592874 () Bool)

(assert (=> b!1045798 (= e!592874 tp_is_empty!24871)))

(declare-fun b!1045799 () Bool)

(declare-fun res!696290 () Bool)

(declare-fun e!592867 () Bool)

(assert (=> b!1045799 (=> res!696290 e!592867)))

(declare-datatypes ((Unit!34053 0))(
  ( (Unit!34054) )
))
(declare-datatypes ((tuple2!15876 0))(
  ( (tuple2!15877 (_1!7949 Unit!34053) (_2!7949 LongMapFixedSize!6058)) )
))
(declare-fun lt!461726 () tuple2!15876)

(assert (=> b!1045799 (= res!696290 (or (not (= (size!32212 (_values!6450 (_2!7949 lt!461726))) (bvadd #b00000000000000000000000000000001 (mask!30561 (_2!7949 lt!461726))))) (not (= (size!32211 (_keys!11697 (_2!7949 lt!461726))) (size!32212 (_values!6450 (_2!7949 lt!461726))))) (bvslt (mask!30561 (_2!7949 lt!461726)) #b00000000000000000000000000000000) (bvslt (extraKeys!6155 (_2!7949 lt!461726)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6155 (_2!7949 lt!461726)) #b00000000000000000000000000000011)))))

(declare-fun b!1045800 () Bool)

(declare-datatypes ((List!22060 0))(
  ( (Nil!22057) (Cons!22056 (h!23264 (_ BitVec 64)) (t!31333 List!22060)) )
))
(declare-fun arrayNoDuplicates!0 (array!65859 (_ BitVec 32) List!22060) Bool)

(assert (=> b!1045800 (= e!592867 (arrayNoDuplicates!0 (_keys!11697 (_2!7949 lt!461726)) #b00000000000000000000000000000000 Nil!22057))))

(declare-fun b!1045801 () Bool)

(declare-fun e!592870 () Bool)

(assert (=> b!1045801 (= e!592873 e!592870)))

(declare-fun res!696287 () Bool)

(assert (=> b!1045801 (=> (not res!696287) (not e!592870))))

(declare-datatypes ((SeekEntryResult!9853 0))(
  ( (MissingZero!9853 (index!41783 (_ BitVec 32))) (Found!9853 (index!41784 (_ BitVec 32))) (Intermediate!9853 (undefined!10665 Bool) (index!41785 (_ BitVec 32)) (x!93438 (_ BitVec 32))) (Undefined!9853) (MissingVacant!9853 (index!41786 (_ BitVec 32))) )
))
(declare-fun lt!461723 () SeekEntryResult!9853)

(get-info :version)

(assert (=> b!1045801 (= res!696287 ((_ is Found!9853) lt!461723))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65859 (_ BitVec 32)) SeekEntryResult!9853)

(assert (=> b!1045801 (= lt!461723 (seekEntry!0 key!909 (_keys!11697 thiss!1427) (mask!30561 thiss!1427)))))

(declare-fun mapNonEmpty!38951 () Bool)

(declare-fun mapRes!38951 () Bool)

(declare-fun tp!74715 () Bool)

(declare-fun e!592871 () Bool)

(assert (=> mapNonEmpty!38951 (= mapRes!38951 (and tp!74715 e!592871))))

(declare-fun mapKey!38951 () (_ BitVec 32))

(declare-fun mapValue!38951 () ValueCell!11732)

(declare-fun mapRest!38951 () (Array (_ BitVec 32) ValueCell!11732))

(assert (=> mapNonEmpty!38951 (= (arr!31675 (_values!6450 thiss!1427)) (store mapRest!38951 mapKey!38951 mapValue!38951))))

(declare-fun b!1045802 () Bool)

(declare-fun res!696288 () Bool)

(assert (=> b!1045802 (=> (not res!696288) (not e!592873))))

(assert (=> b!1045802 (= res!696288 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38951 () Bool)

(assert (=> mapIsEmpty!38951 mapRes!38951))

(declare-fun b!1045803 () Bool)

(declare-fun res!696292 () Bool)

(assert (=> b!1045803 (=> res!696292 e!592867)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045803 (= res!696292 (not (validMask!0 (mask!30561 (_2!7949 lt!461726)))))))

(declare-fun b!1045804 () Bool)

(assert (=> b!1045804 (= e!592868 (and e!592874 mapRes!38951))))

(declare-fun condMapEmpty!38951 () Bool)

(declare-fun mapDefault!38951 () ValueCell!11732)

(assert (=> b!1045804 (= condMapEmpty!38951 (= (arr!31675 (_values!6450 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11732)) mapDefault!38951)))))

(declare-fun b!1045805 () Bool)

(assert (=> b!1045805 (= e!592871 tp_is_empty!24871)))

(declare-fun b!1045806 () Bool)

(assert (=> b!1045806 (= e!592870 (not e!592867))))

(declare-fun res!696289 () Bool)

(assert (=> b!1045806 (=> res!696289 e!592867)))

(declare-datatypes ((tuple2!15878 0))(
  ( (tuple2!15879 (_1!7950 (_ BitVec 64)) (_2!7950 V!38035)) )
))
(declare-datatypes ((List!22061 0))(
  ( (Nil!22058) (Cons!22057 (h!23265 tuple2!15878) (t!31334 List!22061)) )
))
(declare-datatypes ((ListLongMap!13867 0))(
  ( (ListLongMap!13868 (toList!6949 List!22061)) )
))
(declare-fun contains!6063 (ListLongMap!13867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3915 (array!65859 array!65861 (_ BitVec 32) (_ BitVec 32) V!38035 V!38035 (_ BitVec 32) Int) ListLongMap!13867)

(assert (=> b!1045806 (= res!696289 (not (contains!6063 (getCurrentListMap!3915 (_keys!11697 (_2!7949 lt!461726)) (_values!6450 (_2!7949 lt!461726)) (mask!30561 (_2!7949 lt!461726)) (extraKeys!6155 (_2!7949 lt!461726)) (zeroValue!6261 (_2!7949 lt!461726)) (minValue!6261 (_2!7949 lt!461726)) #b00000000000000000000000000000000 (defaultEntry!6427 (_2!7949 lt!461726))) key!909)))))

(declare-fun lt!461719 () array!65861)

(declare-fun lt!461725 () array!65859)

(declare-fun Unit!34055 () Unit!34053)

(declare-fun Unit!34056 () Unit!34053)

(assert (=> b!1045806 (= lt!461726 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3084 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15877 Unit!34055 (LongMapFixedSize!6059 (defaultEntry!6427 thiss!1427) (mask!30561 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) (bvsub (_size!3084 thiss!1427) #b00000000000000000000000000000001) lt!461725 lt!461719 (bvadd #b00000000000000000000000000000001 (_vacant!3084 thiss!1427)))) (tuple2!15877 Unit!34056 (LongMapFixedSize!6059 (defaultEntry!6427 thiss!1427) (mask!30561 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) (bvsub (_size!3084 thiss!1427) #b00000000000000000000000000000001) lt!461725 lt!461719 (_vacant!3084 thiss!1427)))))))

(declare-fun -!541 (ListLongMap!13867 (_ BitVec 64)) ListLongMap!13867)

(assert (=> b!1045806 (= (-!541 (getCurrentListMap!3915 (_keys!11697 thiss!1427) (_values!6450 thiss!1427) (mask!30561 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6427 thiss!1427)) key!909) (getCurrentListMap!3915 lt!461725 lt!461719 (mask!30561 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6427 thiss!1427)))))

(declare-fun dynLambda!2002 (Int (_ BitVec 64)) V!38035)

(assert (=> b!1045806 (= lt!461719 (array!65862 (store (arr!31675 (_values!6450 thiss!1427)) (index!41784 lt!461723) (ValueCellFull!11732 (dynLambda!2002 (defaultEntry!6427 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32212 (_values!6450 thiss!1427))))))

(declare-fun lt!461724 () Unit!34053)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!63 (array!65859 array!65861 (_ BitVec 32) (_ BitVec 32) V!38035 V!38035 (_ BitVec 32) (_ BitVec 64) Int) Unit!34053)

(assert (=> b!1045806 (= lt!461724 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!63 (_keys!11697 thiss!1427) (_values!6450 thiss!1427) (mask!30561 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) (index!41784 lt!461723) key!909 (defaultEntry!6427 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045806 (not (arrayContainsKey!0 lt!461725 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461721 () Unit!34053)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65859 (_ BitVec 32) (_ BitVec 64)) Unit!34053)

(assert (=> b!1045806 (= lt!461721 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11697 thiss!1427) (index!41784 lt!461723) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65859 (_ BitVec 32)) Bool)

(assert (=> b!1045806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461725 (mask!30561 thiss!1427))))

(declare-fun lt!461727 () Unit!34053)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65859 (_ BitVec 32) (_ BitVec 32)) Unit!34053)

(assert (=> b!1045806 (= lt!461727 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11697 thiss!1427) (index!41784 lt!461723) (mask!30561 thiss!1427)))))

(assert (=> b!1045806 (arrayNoDuplicates!0 lt!461725 #b00000000000000000000000000000000 Nil!22057)))

(declare-fun lt!461722 () Unit!34053)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65859 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22060) Unit!34053)

(assert (=> b!1045806 (= lt!461722 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11697 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41784 lt!461723) #b00000000000000000000000000000000 Nil!22057))))

(declare-fun arrayCountValidKeys!0 (array!65859 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045806 (= (arrayCountValidKeys!0 lt!461725 #b00000000000000000000000000000000 (size!32211 (_keys!11697 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11697 thiss!1427) #b00000000000000000000000000000000 (size!32211 (_keys!11697 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045806 (= lt!461725 (array!65860 (store (arr!31674 (_keys!11697 thiss!1427)) (index!41784 lt!461723) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32211 (_keys!11697 thiss!1427))))))

(declare-fun lt!461720 () Unit!34053)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65859 (_ BitVec 32) (_ BitVec 64)) Unit!34053)

(assert (=> b!1045806 (= lt!461720 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11697 thiss!1427) (index!41784 lt!461723) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045807 () Bool)

(declare-fun res!696293 () Bool)

(assert (=> b!1045807 (=> res!696293 e!592867)))

(assert (=> b!1045807 (= res!696293 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11697 (_2!7949 lt!461726)) (mask!30561 (_2!7949 lt!461726)))))))

(assert (= (and start!91976 res!696291) b!1045802))

(assert (= (and b!1045802 res!696288) b!1045801))

(assert (= (and b!1045801 res!696287) b!1045806))

(assert (= (and b!1045806 (not res!696289)) b!1045803))

(assert (= (and b!1045803 (not res!696292)) b!1045799))

(assert (= (and b!1045799 (not res!696290)) b!1045807))

(assert (= (and b!1045807 (not res!696293)) b!1045800))

(assert (= (and b!1045804 condMapEmpty!38951) mapIsEmpty!38951))

(assert (= (and b!1045804 (not condMapEmpty!38951)) mapNonEmpty!38951))

(assert (= (and mapNonEmpty!38951 ((_ is ValueCellFull!11732) mapValue!38951)) b!1045805))

(assert (= (and b!1045804 ((_ is ValueCellFull!11732) mapDefault!38951)) b!1045798))

(assert (= b!1045797 b!1045804))

(assert (= start!91976 b!1045797))

(declare-fun b_lambda!16313 () Bool)

(assert (=> (not b_lambda!16313) (not b!1045806)))

(declare-fun t!31332 () Bool)

(declare-fun tb!7095 () Bool)

(assert (=> (and b!1045797 (= (defaultEntry!6427 thiss!1427) (defaultEntry!6427 thiss!1427)) t!31332) tb!7095))

(declare-fun result!14623 () Bool)

(assert (=> tb!7095 (= result!14623 tp_is_empty!24871)))

(assert (=> b!1045806 t!31332))

(declare-fun b_and!33773 () Bool)

(assert (= b_and!33771 (and (=> t!31332 result!14623) b_and!33773)))

(declare-fun m!965181 () Bool)

(assert (=> b!1045800 m!965181))

(declare-fun m!965183 () Bool)

(assert (=> mapNonEmpty!38951 m!965183))

(declare-fun m!965185 () Bool)

(assert (=> b!1045797 m!965185))

(declare-fun m!965187 () Bool)

(assert (=> b!1045797 m!965187))

(declare-fun m!965189 () Bool)

(assert (=> b!1045807 m!965189))

(declare-fun m!965191 () Bool)

(assert (=> b!1045803 m!965191))

(declare-fun m!965193 () Bool)

(assert (=> b!1045806 m!965193))

(declare-fun m!965195 () Bool)

(assert (=> b!1045806 m!965195))

(declare-fun m!965197 () Bool)

(assert (=> b!1045806 m!965197))

(declare-fun m!965199 () Bool)

(assert (=> b!1045806 m!965199))

(declare-fun m!965201 () Bool)

(assert (=> b!1045806 m!965201))

(declare-fun m!965203 () Bool)

(assert (=> b!1045806 m!965203))

(declare-fun m!965205 () Bool)

(assert (=> b!1045806 m!965205))

(declare-fun m!965207 () Bool)

(assert (=> b!1045806 m!965207))

(declare-fun m!965209 () Bool)

(assert (=> b!1045806 m!965209))

(declare-fun m!965211 () Bool)

(assert (=> b!1045806 m!965211))

(declare-fun m!965213 () Bool)

(assert (=> b!1045806 m!965213))

(declare-fun m!965215 () Bool)

(assert (=> b!1045806 m!965215))

(declare-fun m!965217 () Bool)

(assert (=> b!1045806 m!965217))

(declare-fun m!965219 () Bool)

(assert (=> b!1045806 m!965219))

(declare-fun m!965221 () Bool)

(assert (=> b!1045806 m!965221))

(declare-fun m!965223 () Bool)

(assert (=> b!1045806 m!965223))

(assert (=> b!1045806 m!965209))

(declare-fun m!965225 () Bool)

(assert (=> b!1045806 m!965225))

(assert (=> b!1045806 m!965205))

(declare-fun m!965227 () Bool)

(assert (=> b!1045806 m!965227))

(declare-fun m!965229 () Bool)

(assert (=> b!1045801 m!965229))

(declare-fun m!965231 () Bool)

(assert (=> start!91976 m!965231))

(check-sat (not mapNonEmpty!38951) (not b_lambda!16313) (not b_next!21151) (not b!1045807) b_and!33773 tp_is_empty!24871 (not b!1045797) (not b!1045800) (not start!91976) (not b!1045803) (not b!1045801) (not b!1045806))
(check-sat b_and!33773 (not b_next!21151))
