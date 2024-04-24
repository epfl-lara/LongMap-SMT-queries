; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89648 () Bool)

(assert start!89648)

(declare-fun b!1026504 () Bool)

(declare-fun b_free!20413 () Bool)

(declare-fun b_next!20413 () Bool)

(assert (=> b!1026504 (= b_free!20413 (not b_next!20413))))

(declare-fun tp!72285 () Bool)

(declare-fun b_and!32669 () Bool)

(assert (=> b!1026504 (= tp!72285 b_and!32669)))

(declare-fun res!686882 () Bool)

(declare-fun e!578853 () Bool)

(assert (=> start!89648 (=> (not res!686882) (not e!578853))))

(declare-datatypes ((V!37051 0))(
  ( (V!37052 (val!12117 Int)) )
))
(declare-datatypes ((ValueCell!11363 0))(
  ( (ValueCellFull!11363 (v!14682 V!37051)) (EmptyCell!11363) )
))
(declare-datatypes ((array!64365 0))(
  ( (array!64366 (arr!30985 (Array (_ BitVec 32) (_ BitVec 64))) (size!31499 (_ BitVec 32))) )
))
(declare-datatypes ((array!64367 0))(
  ( (array!64368 (arr!30986 (Array (_ BitVec 32) ValueCell!11363)) (size!31500 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5320 0))(
  ( (LongMapFixedSize!5321 (defaultEntry!6012 Int) (mask!29738 (_ BitVec 32)) (extraKeys!5744 (_ BitVec 32)) (zeroValue!5848 V!37051) (minValue!5848 V!37051) (_size!2715 (_ BitVec 32)) (_keys!11197 array!64365) (_values!6035 array!64367) (_vacant!2715 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5320)

(declare-fun valid!2029 (LongMapFixedSize!5320) Bool)

(assert (=> start!89648 (= res!686882 (valid!2029 thiss!1427))))

(assert (=> start!89648 e!578853))

(declare-fun e!578854 () Bool)

(assert (=> start!89648 e!578854))

(assert (=> start!89648 true))

(declare-fun b!1026503 () Bool)

(declare-fun e!578855 () Bool)

(assert (=> b!1026503 (= e!578853 e!578855)))

(declare-fun res!686884 () Bool)

(assert (=> b!1026503 (=> (not res!686884) (not e!578855))))

(declare-datatypes ((SeekEntryResult!9569 0))(
  ( (MissingZero!9569 (index!40647 (_ BitVec 32))) (Found!9569 (index!40648 (_ BitVec 32))) (Intermediate!9569 (undefined!10381 Bool) (index!40649 (_ BitVec 32)) (x!91141 (_ BitVec 32))) (Undefined!9569) (MissingVacant!9569 (index!40650 (_ BitVec 32))) )
))
(declare-fun lt!451343 () SeekEntryResult!9569)

(get-info :version)

(assert (=> b!1026503 (= res!686884 ((_ is Found!9569) lt!451343))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64365 (_ BitVec 32)) SeekEntryResult!9569)

(assert (=> b!1026503 (= lt!451343 (seekEntry!0 key!909 (_keys!11197 thiss!1427) (mask!29738 thiss!1427)))))

(declare-fun e!578852 () Bool)

(declare-fun tp_is_empty!24133 () Bool)

(declare-fun array_inv!24017 (array!64365) Bool)

(declare-fun array_inv!24018 (array!64367) Bool)

(assert (=> b!1026504 (= e!578854 (and tp!72285 tp_is_empty!24133 (array_inv!24017 (_keys!11197 thiss!1427)) (array_inv!24018 (_values!6035 thiss!1427)) e!578852))))

(declare-fun mapNonEmpty!37628 () Bool)

(declare-fun mapRes!37628 () Bool)

(declare-fun tp!72284 () Bool)

(declare-fun e!578851 () Bool)

(assert (=> mapNonEmpty!37628 (= mapRes!37628 (and tp!72284 e!578851))))

(declare-fun mapValue!37628 () ValueCell!11363)

(declare-fun mapKey!37628 () (_ BitVec 32))

(declare-fun mapRest!37628 () (Array (_ BitVec 32) ValueCell!11363))

(assert (=> mapNonEmpty!37628 (= (arr!30986 (_values!6035 thiss!1427)) (store mapRest!37628 mapKey!37628 mapValue!37628))))

(declare-fun b!1026505 () Bool)

(declare-fun e!578856 () Bool)

(assert (=> b!1026505 (= e!578856 tp_is_empty!24133)))

(declare-fun b!1026506 () Bool)

(declare-fun e!578857 () Bool)

(assert (=> b!1026506 (= e!578855 (not e!578857))))

(declare-fun res!686886 () Bool)

(assert (=> b!1026506 (=> res!686886 e!578857)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026506 (= res!686886 (not (validMask!0 (mask!29738 thiss!1427))))))

(declare-fun lt!451340 () array!64365)

(declare-datatypes ((List!21734 0))(
  ( (Nil!21731) (Cons!21730 (h!22937 (_ BitVec 64)) (t!30788 List!21734)) )
))
(declare-fun arrayNoDuplicates!0 (array!64365 (_ BitVec 32) List!21734) Bool)

(assert (=> b!1026506 (arrayNoDuplicates!0 lt!451340 #b00000000000000000000000000000000 Nil!21731)))

(declare-datatypes ((Unit!33390 0))(
  ( (Unit!33391) )
))
(declare-fun lt!451339 () Unit!33390)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64365 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21734) Unit!33390)

(assert (=> b!1026506 (= lt!451339 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11197 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40648 lt!451343) #b00000000000000000000000000000000 Nil!21731))))

(declare-fun arrayCountValidKeys!0 (array!64365 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026506 (= (arrayCountValidKeys!0 lt!451340 #b00000000000000000000000000000000 (size!31499 (_keys!11197 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11197 thiss!1427) #b00000000000000000000000000000000 (size!31499 (_keys!11197 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026506 (= lt!451340 (array!64366 (store (arr!30985 (_keys!11197 thiss!1427)) (index!40648 lt!451343) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31499 (_keys!11197 thiss!1427))))))

(declare-fun lt!451342 () Unit!33390)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64365 (_ BitVec 32) (_ BitVec 64)) Unit!33390)

(assert (=> b!1026506 (= lt!451342 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11197 thiss!1427) (index!40648 lt!451343) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026507 () Bool)

(declare-fun res!686888 () Bool)

(assert (=> b!1026507 (=> res!686888 e!578857)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1026507 (= res!686888 (not (validKeyInArray!0 (select (arr!30985 (_keys!11197 thiss!1427)) (index!40648 lt!451343)))))))

(declare-fun mapIsEmpty!37628 () Bool)

(assert (=> mapIsEmpty!37628 mapRes!37628))

(declare-fun b!1026508 () Bool)

(assert (=> b!1026508 (= e!578857 true)))

(declare-fun lt!451341 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64365 (_ BitVec 32)) Bool)

(assert (=> b!1026508 (= lt!451341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11197 thiss!1427) (mask!29738 thiss!1427)))))

(declare-fun b!1026509 () Bool)

(declare-fun res!686887 () Bool)

(assert (=> b!1026509 (=> res!686887 e!578857)))

(assert (=> b!1026509 (= res!686887 (not (arrayNoDuplicates!0 (_keys!11197 thiss!1427) #b00000000000000000000000000000000 Nil!21731)))))

(declare-fun b!1026510 () Bool)

(declare-fun res!686885 () Bool)

(assert (=> b!1026510 (=> res!686885 e!578857)))

(assert (=> b!1026510 (= res!686885 (or (not (= (size!31499 (_keys!11197 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29738 thiss!1427)))) (bvslt (index!40648 lt!451343) #b00000000000000000000000000000000) (bvsge (index!40648 lt!451343) (size!31499 (_keys!11197 thiss!1427)))))))

(declare-fun b!1026511 () Bool)

(assert (=> b!1026511 (= e!578851 tp_is_empty!24133)))

(declare-fun b!1026512 () Bool)

(assert (=> b!1026512 (= e!578852 (and e!578856 mapRes!37628))))

(declare-fun condMapEmpty!37628 () Bool)

(declare-fun mapDefault!37628 () ValueCell!11363)

(assert (=> b!1026512 (= condMapEmpty!37628 (= (arr!30986 (_values!6035 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11363)) mapDefault!37628)))))

(declare-fun b!1026513 () Bool)

(declare-fun res!686883 () Bool)

(assert (=> b!1026513 (=> (not res!686883) (not e!578853))))

(assert (=> b!1026513 (= res!686883 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!89648 res!686882) b!1026513))

(assert (= (and b!1026513 res!686883) b!1026503))

(assert (= (and b!1026503 res!686884) b!1026506))

(assert (= (and b!1026506 (not res!686886)) b!1026510))

(assert (= (and b!1026510 (not res!686885)) b!1026507))

(assert (= (and b!1026507 (not res!686888)) b!1026509))

(assert (= (and b!1026509 (not res!686887)) b!1026508))

(assert (= (and b!1026512 condMapEmpty!37628) mapIsEmpty!37628))

(assert (= (and b!1026512 (not condMapEmpty!37628)) mapNonEmpty!37628))

(assert (= (and mapNonEmpty!37628 ((_ is ValueCellFull!11363) mapValue!37628)) b!1026511))

(assert (= (and b!1026512 ((_ is ValueCellFull!11363) mapDefault!37628)) b!1026505))

(assert (= b!1026504 b!1026512))

(assert (= start!89648 b!1026504))

(declare-fun m!945039 () Bool)

(assert (=> b!1026503 m!945039))

(declare-fun m!945041 () Bool)

(assert (=> b!1026504 m!945041))

(declare-fun m!945043 () Bool)

(assert (=> b!1026504 m!945043))

(declare-fun m!945045 () Bool)

(assert (=> b!1026507 m!945045))

(assert (=> b!1026507 m!945045))

(declare-fun m!945047 () Bool)

(assert (=> b!1026507 m!945047))

(declare-fun m!945049 () Bool)

(assert (=> mapNonEmpty!37628 m!945049))

(declare-fun m!945051 () Bool)

(assert (=> start!89648 m!945051))

(declare-fun m!945053 () Bool)

(assert (=> b!1026506 m!945053))

(declare-fun m!945055 () Bool)

(assert (=> b!1026506 m!945055))

(declare-fun m!945057 () Bool)

(assert (=> b!1026506 m!945057))

(declare-fun m!945059 () Bool)

(assert (=> b!1026506 m!945059))

(declare-fun m!945061 () Bool)

(assert (=> b!1026506 m!945061))

(declare-fun m!945063 () Bool)

(assert (=> b!1026506 m!945063))

(declare-fun m!945065 () Bool)

(assert (=> b!1026506 m!945065))

(declare-fun m!945067 () Bool)

(assert (=> b!1026509 m!945067))

(declare-fun m!945069 () Bool)

(assert (=> b!1026508 m!945069))

(check-sat (not b!1026506) (not b_next!20413) (not b!1026507) (not b!1026504) (not start!89648) (not b!1026508) (not b!1026509) tp_is_empty!24133 (not b!1026503) (not mapNonEmpty!37628) b_and!32669)
(check-sat b_and!32669 (not b_next!20413))
