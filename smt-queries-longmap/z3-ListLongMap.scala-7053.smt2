; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89374 () Bool)

(assert start!89374)

(declare-fun b!1024531 () Bool)

(declare-fun b_free!20373 () Bool)

(declare-fun b_next!20373 () Bool)

(assert (=> b!1024531 (= b_free!20373 (not b_next!20373))))

(declare-fun tp!72165 () Bool)

(declare-fun b_and!32619 () Bool)

(assert (=> b!1024531 (= tp!72165 b_and!32619)))

(declare-fun b!1024528 () Bool)

(declare-fun e!577530 () Bool)

(declare-fun tp_is_empty!24093 () Bool)

(assert (=> b!1024528 (= e!577530 tp_is_empty!24093)))

(declare-fun b!1024529 () Bool)

(declare-fun res!685954 () Bool)

(declare-fun e!577528 () Bool)

(assert (=> b!1024529 (=> res!685954 e!577528)))

(declare-datatypes ((List!21732 0))(
  ( (Nil!21729) (Cons!21728 (h!22926 (_ BitVec 64)) (t!30794 List!21732)) )
))
(declare-fun noDuplicate!1464 (List!21732) Bool)

(assert (=> b!1024529 (= res!685954 (not (noDuplicate!1464 Nil!21729)))))

(declare-fun b!1024530 () Bool)

(declare-fun e!577534 () Bool)

(assert (=> b!1024530 (= e!577534 (not e!577528))))

(declare-fun res!685956 () Bool)

(assert (=> b!1024530 (=> res!685956 e!577528)))

(declare-datatypes ((V!36997 0))(
  ( (V!36998 (val!12097 Int)) )
))
(declare-datatypes ((ValueCell!11343 0))(
  ( (ValueCellFull!11343 (v!14666 V!36997)) (EmptyCell!11343) )
))
(declare-datatypes ((array!64236 0))(
  ( (array!64237 (arr!30927 (Array (_ BitVec 32) (_ BitVec 64))) (size!31440 (_ BitVec 32))) )
))
(declare-datatypes ((array!64238 0))(
  ( (array!64239 (arr!30928 (Array (_ BitVec 32) ValueCell!11343)) (size!31441 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5280 0))(
  ( (LongMapFixedSize!5281 (defaultEntry!5992 Int) (mask!29644 (_ BitVec 32)) (extraKeys!5724 (_ BitVec 32)) (zeroValue!5828 V!36997) (minValue!5828 V!36997) (_size!2695 (_ BitVec 32)) (_keys!11139 array!64236) (_values!6015 array!64238) (_vacant!2695 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5280)

(assert (=> b!1024530 (= res!685956 (or (bvsge (size!31440 (_keys!11139 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31440 (_keys!11139 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9597 0))(
  ( (MissingZero!9597 (index!40759 (_ BitVec 32))) (Found!9597 (index!40760 (_ BitVec 32))) (Intermediate!9597 (undefined!10409 Bool) (index!40761 (_ BitVec 32)) (x!91091 (_ BitVec 32))) (Undefined!9597) (MissingVacant!9597 (index!40762 (_ BitVec 32))) )
))
(declare-fun lt!450641 () SeekEntryResult!9597)

(declare-fun arrayCountValidKeys!0 (array!64236 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024530 (= (arrayCountValidKeys!0 (array!64237 (store (arr!30927 (_keys!11139 thiss!1427)) (index!40760 lt!450641) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31440 (_keys!11139 thiss!1427))) #b00000000000000000000000000000000 (size!31440 (_keys!11139 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11139 thiss!1427) #b00000000000000000000000000000000 (size!31440 (_keys!11139 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33353 0))(
  ( (Unit!33354) )
))
(declare-fun lt!450640 () Unit!33353)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64236 (_ BitVec 32) (_ BitVec 64)) Unit!33353)

(assert (=> b!1024530 (= lt!450640 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11139 thiss!1427) (index!40760 lt!450641) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37568 () Bool)

(declare-fun mapRes!37568 () Bool)

(assert (=> mapIsEmpty!37568 mapRes!37568))

(declare-fun e!577533 () Bool)

(declare-fun e!577532 () Bool)

(declare-fun array_inv!23959 (array!64236) Bool)

(declare-fun array_inv!23960 (array!64238) Bool)

(assert (=> b!1024531 (= e!577533 (and tp!72165 tp_is_empty!24093 (array_inv!23959 (_keys!11139 thiss!1427)) (array_inv!23960 (_values!6015 thiss!1427)) e!577532))))

(declare-fun b!1024532 () Bool)

(declare-fun e!577531 () Bool)

(assert (=> b!1024532 (= e!577531 e!577534)))

(declare-fun res!685958 () Bool)

(assert (=> b!1024532 (=> (not res!685958) (not e!577534))))

(get-info :version)

(assert (=> b!1024532 (= res!685958 ((_ is Found!9597) lt!450641))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64236 (_ BitVec 32)) SeekEntryResult!9597)

(assert (=> b!1024532 (= lt!450641 (seekEntry!0 key!909 (_keys!11139 thiss!1427) (mask!29644 thiss!1427)))))

(declare-fun b!1024533 () Bool)

(assert (=> b!1024533 (= e!577528 true)))

(declare-fun lt!450642 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64236 (_ BitVec 32) List!21732) Bool)

(assert (=> b!1024533 (= lt!450642 (arrayNoDuplicates!0 (_keys!11139 thiss!1427) #b00000000000000000000000000000000 Nil!21729))))

(declare-fun b!1024534 () Bool)

(assert (=> b!1024534 (= e!577532 (and e!577530 mapRes!37568))))

(declare-fun condMapEmpty!37568 () Bool)

(declare-fun mapDefault!37568 () ValueCell!11343)

(assert (=> b!1024534 (= condMapEmpty!37568 (= (arr!30928 (_values!6015 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11343)) mapDefault!37568)))))

(declare-fun b!1024535 () Bool)

(declare-fun res!685952 () Bool)

(assert (=> b!1024535 (=> res!685952 e!577528)))

(declare-fun contains!5948 (List!21732 (_ BitVec 64)) Bool)

(assert (=> b!1024535 (= res!685952 (contains!5948 Nil!21729 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024536 () Bool)

(declare-fun res!685957 () Bool)

(assert (=> b!1024536 (=> (not res!685957) (not e!577531))))

(assert (=> b!1024536 (= res!685957 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024537 () Bool)

(declare-fun res!685955 () Bool)

(assert (=> b!1024537 (=> res!685955 e!577528)))

(assert (=> b!1024537 (= res!685955 (contains!5948 Nil!21729 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024538 () Bool)

(declare-fun e!577527 () Bool)

(assert (=> b!1024538 (= e!577527 tp_is_empty!24093)))

(declare-fun mapNonEmpty!37568 () Bool)

(declare-fun tp!72164 () Bool)

(assert (=> mapNonEmpty!37568 (= mapRes!37568 (and tp!72164 e!577527))))

(declare-fun mapKey!37568 () (_ BitVec 32))

(declare-fun mapValue!37568 () ValueCell!11343)

(declare-fun mapRest!37568 () (Array (_ BitVec 32) ValueCell!11343))

(assert (=> mapNonEmpty!37568 (= (arr!30928 (_values!6015 thiss!1427)) (store mapRest!37568 mapKey!37568 mapValue!37568))))

(declare-fun res!685953 () Bool)

(assert (=> start!89374 (=> (not res!685953) (not e!577531))))

(declare-fun valid!2010 (LongMapFixedSize!5280) Bool)

(assert (=> start!89374 (= res!685953 (valid!2010 thiss!1427))))

(assert (=> start!89374 e!577531))

(assert (=> start!89374 e!577533))

(assert (=> start!89374 true))

(assert (= (and start!89374 res!685953) b!1024536))

(assert (= (and b!1024536 res!685957) b!1024532))

(assert (= (and b!1024532 res!685958) b!1024530))

(assert (= (and b!1024530 (not res!685956)) b!1024529))

(assert (= (and b!1024529 (not res!685954)) b!1024535))

(assert (= (and b!1024535 (not res!685952)) b!1024537))

(assert (= (and b!1024537 (not res!685955)) b!1024533))

(assert (= (and b!1024534 condMapEmpty!37568) mapIsEmpty!37568))

(assert (= (and b!1024534 (not condMapEmpty!37568)) mapNonEmpty!37568))

(assert (= (and mapNonEmpty!37568 ((_ is ValueCellFull!11343) mapValue!37568)) b!1024538))

(assert (= (and b!1024534 ((_ is ValueCellFull!11343) mapDefault!37568)) b!1024528))

(assert (= b!1024531 b!1024534))

(assert (= start!89374 b!1024531))

(declare-fun m!942855 () Bool)

(assert (=> start!89374 m!942855))

(declare-fun m!942857 () Bool)

(assert (=> b!1024532 m!942857))

(declare-fun m!942859 () Bool)

(assert (=> b!1024537 m!942859))

(declare-fun m!942861 () Bool)

(assert (=> b!1024535 m!942861))

(declare-fun m!942863 () Bool)

(assert (=> b!1024529 m!942863))

(declare-fun m!942865 () Bool)

(assert (=> b!1024531 m!942865))

(declare-fun m!942867 () Bool)

(assert (=> b!1024531 m!942867))

(declare-fun m!942869 () Bool)

(assert (=> b!1024533 m!942869))

(declare-fun m!942871 () Bool)

(assert (=> b!1024530 m!942871))

(declare-fun m!942873 () Bool)

(assert (=> b!1024530 m!942873))

(declare-fun m!942875 () Bool)

(assert (=> b!1024530 m!942875))

(declare-fun m!942877 () Bool)

(assert (=> b!1024530 m!942877))

(declare-fun m!942879 () Bool)

(assert (=> mapNonEmpty!37568 m!942879))

(check-sat (not b!1024537) (not b!1024535) (not mapNonEmpty!37568) (not b!1024531) (not b!1024530) (not b_next!20373) (not b!1024532) (not b!1024529) tp_is_empty!24093 (not b!1024533) (not start!89374) b_and!32619)
(check-sat b_and!32619 (not b_next!20373))
