; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90042 () Bool)

(assert start!90042)

(declare-fun b!1031204 () Bool)

(declare-fun b_free!20649 () Bool)

(declare-fun b_next!20649 () Bool)

(assert (=> b!1031204 (= b_free!20649 (not b_next!20649))))

(declare-fun tp!73018 () Bool)

(declare-fun b_and!33065 () Bool)

(assert (=> b!1031204 (= tp!73018 b_and!33065)))

(declare-fun mapNonEmpty!38007 () Bool)

(declare-fun mapRes!38007 () Bool)

(declare-fun tp!73017 () Bool)

(declare-fun e!582401 () Bool)

(assert (=> mapNonEmpty!38007 (= mapRes!38007 (and tp!73017 e!582401))))

(declare-datatypes ((V!37365 0))(
  ( (V!37366 (val!12235 Int)) )
))
(declare-datatypes ((ValueCell!11481 0))(
  ( (ValueCellFull!11481 (v!14812 V!37365)) (EmptyCell!11481) )
))
(declare-fun mapValue!38007 () ValueCell!11481)

(declare-datatypes ((array!64802 0))(
  ( (array!64803 (arr!31203 (Array (_ BitVec 32) (_ BitVec 64))) (size!31720 (_ BitVec 32))) )
))
(declare-datatypes ((array!64804 0))(
  ( (array!64805 (arr!31204 (Array (_ BitVec 32) ValueCell!11481)) (size!31721 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5556 0))(
  ( (LongMapFixedSize!5557 (defaultEntry!6152 Int) (mask!29944 (_ BitVec 32)) (extraKeys!5884 (_ BitVec 32)) (zeroValue!5988 V!37365) (minValue!5988 V!37365) (_size!2833 (_ BitVec 32)) (_keys!11325 array!64802) (_values!6175 array!64804) (_vacant!2833 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5556)

(declare-fun mapKey!38007 () (_ BitVec 32))

(declare-fun mapRest!38007 () (Array (_ BitVec 32) ValueCell!11481))

(assert (=> mapNonEmpty!38007 (= (arr!31204 (_values!6175 thiss!1427)) (store mapRest!38007 mapKey!38007 mapValue!38007))))

(declare-fun b!1031202 () Bool)

(declare-fun e!582404 () Bool)

(declare-fun tp_is_empty!24369 () Bool)

(assert (=> b!1031202 (= e!582404 tp_is_empty!24369)))

(declare-fun b!1031203 () Bool)

(declare-fun res!689506 () Bool)

(declare-fun e!582399 () Bool)

(assert (=> b!1031203 (=> res!689506 e!582399)))

(declare-datatypes ((Unit!33709 0))(
  ( (Unit!33710) )
))
(declare-datatypes ((tuple2!15636 0))(
  ( (tuple2!15637 (_1!7829 Unit!33709) (_2!7829 LongMapFixedSize!5556)) )
))
(declare-fun lt!455166 () tuple2!15636)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031203 (= res!689506 (not (validMask!0 (mask!29944 (_2!7829 lt!455166)))))))

(declare-fun e!582400 () Bool)

(declare-fun e!582403 () Bool)

(declare-fun array_inv!24153 (array!64802) Bool)

(declare-fun array_inv!24154 (array!64804) Bool)

(assert (=> b!1031204 (= e!582403 (and tp!73018 tp_is_empty!24369 (array_inv!24153 (_keys!11325 thiss!1427)) (array_inv!24154 (_values!6175 thiss!1427)) e!582400))))

(declare-fun res!689504 () Bool)

(declare-fun e!582398 () Bool)

(assert (=> start!90042 (=> (not res!689504) (not e!582398))))

(declare-fun valid!2104 (LongMapFixedSize!5556) Bool)

(assert (=> start!90042 (= res!689504 (valid!2104 thiss!1427))))

(assert (=> start!90042 e!582398))

(assert (=> start!90042 e!582403))

(assert (=> start!90042 true))

(declare-fun mapIsEmpty!38007 () Bool)

(assert (=> mapIsEmpty!38007 mapRes!38007))

(declare-fun b!1031205 () Bool)

(declare-fun res!689509 () Bool)

(assert (=> b!1031205 (=> (not res!689509) (not e!582398))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1031205 (= res!689509 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031206 () Bool)

(declare-fun res!689508 () Bool)

(assert (=> b!1031206 (=> res!689508 e!582399)))

(assert (=> b!1031206 (= res!689508 (or (not (= (size!31721 (_values!6175 (_2!7829 lt!455166))) (bvadd #b00000000000000000000000000000001 (mask!29944 (_2!7829 lt!455166))))) (not (= (size!31720 (_keys!11325 (_2!7829 lt!455166))) (size!31721 (_values!6175 (_2!7829 lt!455166))))) (bvslt (mask!29944 (_2!7829 lt!455166)) #b00000000000000000000000000000000) (bvslt (extraKeys!5884 (_2!7829 lt!455166)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5884 (_2!7829 lt!455166)) #b00000000000000000000000000000011)))))

(declare-fun b!1031207 () Bool)

(declare-fun e!582402 () Bool)

(assert (=> b!1031207 (= e!582402 (not e!582399))))

(declare-fun res!689505 () Bool)

(assert (=> b!1031207 (=> res!689505 e!582399)))

(declare-datatypes ((tuple2!15638 0))(
  ( (tuple2!15639 (_1!7830 (_ BitVec 64)) (_2!7830 V!37365)) )
))
(declare-datatypes ((List!21857 0))(
  ( (Nil!21854) (Cons!21853 (h!23055 tuple2!15638) (t!31001 List!21857)) )
))
(declare-datatypes ((ListLongMap!13715 0))(
  ( (ListLongMap!13716 (toList!6873 List!21857)) )
))
(declare-fun contains!5987 (ListLongMap!13715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3921 (array!64802 array!64804 (_ BitVec 32) (_ BitVec 32) V!37365 V!37365 (_ BitVec 32) Int) ListLongMap!13715)

(assert (=> b!1031207 (= res!689505 (not (contains!5987 (getCurrentListMap!3921 (_keys!11325 (_2!7829 lt!455166)) (_values!6175 (_2!7829 lt!455166)) (mask!29944 (_2!7829 lt!455166)) (extraKeys!5884 (_2!7829 lt!455166)) (zeroValue!5988 (_2!7829 lt!455166)) (minValue!5988 (_2!7829 lt!455166)) #b00000000000000000000000000000000 (defaultEntry!6152 (_2!7829 lt!455166))) key!909)))))

(declare-fun lt!455163 () array!64802)

(declare-fun lt!455169 () array!64804)

(declare-fun Unit!33711 () Unit!33709)

(declare-fun Unit!33712 () Unit!33709)

(assert (=> b!1031207 (= lt!455166 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2833 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15637 Unit!33711 (LongMapFixedSize!5557 (defaultEntry!6152 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5884 thiss!1427) (zeroValue!5988 thiss!1427) (minValue!5988 thiss!1427) (bvsub (_size!2833 thiss!1427) #b00000000000000000000000000000001) lt!455163 lt!455169 (bvadd #b00000000000000000000000000000001 (_vacant!2833 thiss!1427)))) (tuple2!15637 Unit!33712 (LongMapFixedSize!5557 (defaultEntry!6152 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5884 thiss!1427) (zeroValue!5988 thiss!1427) (minValue!5988 thiss!1427) (bvsub (_size!2833 thiss!1427) #b00000000000000000000000000000001) lt!455163 lt!455169 (_vacant!2833 thiss!1427)))))))

(declare-fun -!500 (ListLongMap!13715 (_ BitVec 64)) ListLongMap!13715)

(assert (=> b!1031207 (= (-!500 (getCurrentListMap!3921 (_keys!11325 thiss!1427) (_values!6175 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5884 thiss!1427) (zeroValue!5988 thiss!1427) (minValue!5988 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6152 thiss!1427)) key!909) (getCurrentListMap!3921 lt!455163 lt!455169 (mask!29944 thiss!1427) (extraKeys!5884 thiss!1427) (zeroValue!5988 thiss!1427) (minValue!5988 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6152 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9701 0))(
  ( (MissingZero!9701 (index!41175 (_ BitVec 32))) (Found!9701 (index!41176 (_ BitVec 32))) (Intermediate!9701 (undefined!10513 Bool) (index!41177 (_ BitVec 32)) (x!91811 (_ BitVec 32))) (Undefined!9701) (MissingVacant!9701 (index!41178 (_ BitVec 32))) )
))
(declare-fun lt!455165 () SeekEntryResult!9701)

(declare-fun dynLambda!1970 (Int (_ BitVec 64)) V!37365)

(assert (=> b!1031207 (= lt!455169 (array!64805 (store (arr!31204 (_values!6175 thiss!1427)) (index!41176 lt!455165) (ValueCellFull!11481 (dynLambda!1970 (defaultEntry!6152 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31721 (_values!6175 thiss!1427))))))

(declare-fun lt!455170 () Unit!33709)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!26 (array!64802 array!64804 (_ BitVec 32) (_ BitVec 32) V!37365 V!37365 (_ BitVec 32) (_ BitVec 64) Int) Unit!33709)

(assert (=> b!1031207 (= lt!455170 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!26 (_keys!11325 thiss!1427) (_values!6175 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5884 thiss!1427) (zeroValue!5988 thiss!1427) (minValue!5988 thiss!1427) (index!41176 lt!455165) key!909 (defaultEntry!6152 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031207 (not (arrayContainsKey!0 lt!455163 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455162 () Unit!33709)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64802 (_ BitVec 32) (_ BitVec 64)) Unit!33709)

(assert (=> b!1031207 (= lt!455162 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11325 thiss!1427) (index!41176 lt!455165) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64802 (_ BitVec 32)) Bool)

(assert (=> b!1031207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455163 (mask!29944 thiss!1427))))

(declare-fun lt!455164 () Unit!33709)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64802 (_ BitVec 32) (_ BitVec 32)) Unit!33709)

(assert (=> b!1031207 (= lt!455164 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11325 thiss!1427) (index!41176 lt!455165) (mask!29944 thiss!1427)))))

(declare-datatypes ((List!21858 0))(
  ( (Nil!21855) (Cons!21854 (h!23056 (_ BitVec 64)) (t!31002 List!21858)) )
))
(declare-fun arrayNoDuplicates!0 (array!64802 (_ BitVec 32) List!21858) Bool)

(assert (=> b!1031207 (arrayNoDuplicates!0 lt!455163 #b00000000000000000000000000000000 Nil!21855)))

(declare-fun lt!455168 () Unit!33709)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64802 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21858) Unit!33709)

(assert (=> b!1031207 (= lt!455168 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11325 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41176 lt!455165) #b00000000000000000000000000000000 Nil!21855))))

(declare-fun arrayCountValidKeys!0 (array!64802 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031207 (= (arrayCountValidKeys!0 lt!455163 #b00000000000000000000000000000000 (size!31720 (_keys!11325 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11325 thiss!1427) #b00000000000000000000000000000000 (size!31720 (_keys!11325 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031207 (= lt!455163 (array!64803 (store (arr!31203 (_keys!11325 thiss!1427)) (index!41176 lt!455165) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31720 (_keys!11325 thiss!1427))))))

(declare-fun lt!455167 () Unit!33709)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64802 (_ BitVec 32) (_ BitVec 64)) Unit!33709)

(assert (=> b!1031207 (= lt!455167 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11325 thiss!1427) (index!41176 lt!455165) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031208 () Bool)

(assert (=> b!1031208 (= e!582401 tp_is_empty!24369)))

(declare-fun b!1031209 () Bool)

(assert (=> b!1031209 (= e!582398 e!582402)))

(declare-fun res!689510 () Bool)

(assert (=> b!1031209 (=> (not res!689510) (not e!582402))))

(get-info :version)

(assert (=> b!1031209 (= res!689510 ((_ is Found!9701) lt!455165))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64802 (_ BitVec 32)) SeekEntryResult!9701)

(assert (=> b!1031209 (= lt!455165 (seekEntry!0 key!909 (_keys!11325 thiss!1427) (mask!29944 thiss!1427)))))

(declare-fun b!1031210 () Bool)

(assert (=> b!1031210 (= e!582399 true)))

(declare-fun lt!455171 () Bool)

(assert (=> b!1031210 (= lt!455171 (arrayNoDuplicates!0 (_keys!11325 (_2!7829 lt!455166)) #b00000000000000000000000000000000 Nil!21855))))

(declare-fun b!1031211 () Bool)

(declare-fun res!689507 () Bool)

(assert (=> b!1031211 (=> res!689507 e!582399)))

(assert (=> b!1031211 (= res!689507 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11325 (_2!7829 lt!455166)) (mask!29944 (_2!7829 lt!455166)))))))

(declare-fun b!1031212 () Bool)

(assert (=> b!1031212 (= e!582400 (and e!582404 mapRes!38007))))

(declare-fun condMapEmpty!38007 () Bool)

(declare-fun mapDefault!38007 () ValueCell!11481)

(assert (=> b!1031212 (= condMapEmpty!38007 (= (arr!31204 (_values!6175 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11481)) mapDefault!38007)))))

(assert (= (and start!90042 res!689504) b!1031205))

(assert (= (and b!1031205 res!689509) b!1031209))

(assert (= (and b!1031209 res!689510) b!1031207))

(assert (= (and b!1031207 (not res!689505)) b!1031203))

(assert (= (and b!1031203 (not res!689506)) b!1031206))

(assert (= (and b!1031206 (not res!689508)) b!1031211))

(assert (= (and b!1031211 (not res!689507)) b!1031210))

(assert (= (and b!1031212 condMapEmpty!38007) mapIsEmpty!38007))

(assert (= (and b!1031212 (not condMapEmpty!38007)) mapNonEmpty!38007))

(assert (= (and mapNonEmpty!38007 ((_ is ValueCellFull!11481) mapValue!38007)) b!1031208))

(assert (= (and b!1031212 ((_ is ValueCellFull!11481) mapDefault!38007)) b!1031202))

(assert (= b!1031204 b!1031212))

(assert (= start!90042 b!1031204))

(declare-fun b_lambda!15993 () Bool)

(assert (=> (not b_lambda!15993) (not b!1031207)))

(declare-fun t!31000 () Bool)

(declare-fun tb!6967 () Bool)

(assert (=> (and b!1031204 (= (defaultEntry!6152 thiss!1427) (defaultEntry!6152 thiss!1427)) t!31000) tb!6967))

(declare-fun result!14263 () Bool)

(assert (=> tb!6967 (= result!14263 tp_is_empty!24369)))

(assert (=> b!1031207 t!31000))

(declare-fun b_and!33067 () Bool)

(assert (= b_and!33065 (and (=> t!31000 result!14263) b_and!33067)))

(declare-fun m!951205 () Bool)

(assert (=> mapNonEmpty!38007 m!951205))

(declare-fun m!951207 () Bool)

(assert (=> b!1031207 m!951207))

(declare-fun m!951209 () Bool)

(assert (=> b!1031207 m!951209))

(declare-fun m!951211 () Bool)

(assert (=> b!1031207 m!951211))

(declare-fun m!951213 () Bool)

(assert (=> b!1031207 m!951213))

(declare-fun m!951215 () Bool)

(assert (=> b!1031207 m!951215))

(declare-fun m!951217 () Bool)

(assert (=> b!1031207 m!951217))

(declare-fun m!951219 () Bool)

(assert (=> b!1031207 m!951219))

(declare-fun m!951221 () Bool)

(assert (=> b!1031207 m!951221))

(declare-fun m!951223 () Bool)

(assert (=> b!1031207 m!951223))

(declare-fun m!951225 () Bool)

(assert (=> b!1031207 m!951225))

(declare-fun m!951227 () Bool)

(assert (=> b!1031207 m!951227))

(declare-fun m!951229 () Bool)

(assert (=> b!1031207 m!951229))

(assert (=> b!1031207 m!951223))

(declare-fun m!951231 () Bool)

(assert (=> b!1031207 m!951231))

(declare-fun m!951233 () Bool)

(assert (=> b!1031207 m!951233))

(declare-fun m!951235 () Bool)

(assert (=> b!1031207 m!951235))

(assert (=> b!1031207 m!951227))

(declare-fun m!951237 () Bool)

(assert (=> b!1031207 m!951237))

(declare-fun m!951239 () Bool)

(assert (=> b!1031207 m!951239))

(declare-fun m!951241 () Bool)

(assert (=> b!1031207 m!951241))

(declare-fun m!951243 () Bool)

(assert (=> b!1031210 m!951243))

(declare-fun m!951245 () Bool)

(assert (=> start!90042 m!951245))

(declare-fun m!951247 () Bool)

(assert (=> b!1031209 m!951247))

(declare-fun m!951249 () Bool)

(assert (=> b!1031211 m!951249))

(declare-fun m!951251 () Bool)

(assert (=> b!1031203 m!951251))

(declare-fun m!951253 () Bool)

(assert (=> b!1031204 m!951253))

(declare-fun m!951255 () Bool)

(assert (=> b!1031204 m!951255))

(check-sat (not start!90042) (not b!1031203) (not b_lambda!15993) (not b_next!20649) (not b!1031210) (not b!1031209) b_and!33067 (not b!1031211) (not mapNonEmpty!38007) (not b!1031207) tp_is_empty!24369 (not b!1031204))
(check-sat b_and!33067 (not b_next!20649))
