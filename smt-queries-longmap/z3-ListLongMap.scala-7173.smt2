; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91888 () Bool)

(assert start!91888)

(declare-fun b!1044714 () Bool)

(declare-fun b_free!21091 () Bool)

(declare-fun b_next!21091 () Bool)

(assert (=> b!1044714 (= b_free!21091 (not b_next!21091))))

(declare-fun tp!74511 () Bool)

(declare-fun b_and!33633 () Bool)

(assert (=> b!1044714 (= tp!74511 b_and!33633)))

(declare-fun mapNonEmpty!38837 () Bool)

(declare-fun mapRes!38837 () Bool)

(declare-fun tp!74510 () Bool)

(declare-fun e!592004 () Bool)

(assert (=> mapNonEmpty!38837 (= mapRes!38837 (and tp!74510 e!592004))))

(declare-fun mapKey!38837 () (_ BitVec 32))

(declare-datatypes ((V!37955 0))(
  ( (V!37956 (val!12456 Int)) )
))
(declare-datatypes ((ValueCell!11702 0))(
  ( (ValueCellFull!11702 (v!15043 V!37955)) (EmptyCell!11702) )
))
(declare-fun mapRest!38837 () (Array (_ BitVec 32) ValueCell!11702))

(declare-fun mapValue!38837 () ValueCell!11702)

(declare-datatypes ((array!65833 0))(
  ( (array!65834 (arr!31663 (Array (_ BitVec 32) (_ BitVec 64))) (size!32199 (_ BitVec 32))) )
))
(declare-datatypes ((array!65835 0))(
  ( (array!65836 (arr!31664 (Array (_ BitVec 32) ValueCell!11702)) (size!32200 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5998 0))(
  ( (LongMapFixedSize!5999 (defaultEntry!6381 Int) (mask!30530 (_ BitVec 32)) (extraKeys!6109 (_ BitVec 32)) (zeroValue!6215 V!37955) (minValue!6215 V!37955) (_size!3054 (_ BitVec 32)) (_keys!11677 array!65833) (_values!6404 array!65835) (_vacant!3054 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5998)

(assert (=> mapNonEmpty!38837 (= (arr!31664 (_values!6404 thiss!1427)) (store mapRest!38837 mapKey!38837 mapValue!38837))))

(declare-fun mapIsEmpty!38837 () Bool)

(assert (=> mapIsEmpty!38837 mapRes!38837))

(declare-fun b!1044708 () Bool)

(declare-fun e!592001 () Bool)

(assert (=> b!1044708 (= e!592001 true)))

(declare-fun lt!460425 () Bool)

(declare-datatypes ((List!21979 0))(
  ( (Nil!21976) (Cons!21975 (h!23192 (_ BitVec 64)) (t!31185 List!21979)) )
))
(declare-fun arrayNoDuplicates!0 (array!65833 (_ BitVec 32) List!21979) Bool)

(assert (=> b!1044708 (= lt!460425 (arrayNoDuplicates!0 (_keys!11677 thiss!1427) #b00000000000000000000000000000000 Nil!21976))))

(declare-fun b!1044709 () Bool)

(declare-fun res!695651 () Bool)

(declare-fun e!592003 () Bool)

(assert (=> b!1044709 (=> (not res!695651) (not e!592003))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1044709 (= res!695651 (not (= key!909 (bvneg key!909))))))

(declare-fun res!695650 () Bool)

(assert (=> start!91888 (=> (not res!695650) (not e!592003))))

(declare-fun valid!2257 (LongMapFixedSize!5998) Bool)

(assert (=> start!91888 (= res!695650 (valid!2257 thiss!1427))))

(assert (=> start!91888 e!592003))

(declare-fun e!592005 () Bool)

(assert (=> start!91888 e!592005))

(assert (=> start!91888 true))

(declare-fun b!1044710 () Bool)

(declare-fun res!695647 () Bool)

(assert (=> b!1044710 (=> res!695647 e!592001)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65833 (_ BitVec 32)) Bool)

(assert (=> b!1044710 (= res!695647 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11677 thiss!1427) (mask!30530 thiss!1427))))))

(declare-fun b!1044711 () Bool)

(declare-fun e!592006 () Bool)

(declare-fun e!592002 () Bool)

(assert (=> b!1044711 (= e!592006 (and e!592002 mapRes!38837))))

(declare-fun condMapEmpty!38837 () Bool)

(declare-fun mapDefault!38837 () ValueCell!11702)

(assert (=> b!1044711 (= condMapEmpty!38837 (= (arr!31664 (_values!6404 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11702)) mapDefault!38837)))))

(declare-fun b!1044712 () Bool)

(declare-fun e!592007 () Bool)

(assert (=> b!1044712 (= e!592007 (not e!592001))))

(declare-fun res!695649 () Bool)

(assert (=> b!1044712 (=> res!695649 e!592001)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044712 (= res!695649 (not (validMask!0 (mask!30530 thiss!1427))))))

(declare-fun lt!460426 () array!65833)

(declare-fun arrayContainsKey!0 (array!65833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044712 (not (arrayContainsKey!0 lt!460426 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9785 0))(
  ( (MissingZero!9785 (index!41511 (_ BitVec 32))) (Found!9785 (index!41512 (_ BitVec 32))) (Intermediate!9785 (undefined!10597 Bool) (index!41513 (_ BitVec 32)) (x!93131 (_ BitVec 32))) (Undefined!9785) (MissingVacant!9785 (index!41514 (_ BitVec 32))) )
))
(declare-fun lt!460424 () SeekEntryResult!9785)

(declare-datatypes ((Unit!34081 0))(
  ( (Unit!34082) )
))
(declare-fun lt!460422 () Unit!34081)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65833 (_ BitVec 32) (_ BitVec 64)) Unit!34081)

(assert (=> b!1044712 (= lt!460422 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11677 thiss!1427) (index!41512 lt!460424) key!909))))

(assert (=> b!1044712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460426 (mask!30530 thiss!1427))))

(declare-fun lt!460428 () Unit!34081)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65833 (_ BitVec 32) (_ BitVec 32)) Unit!34081)

(assert (=> b!1044712 (= lt!460428 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11677 thiss!1427) (index!41512 lt!460424) (mask!30530 thiss!1427)))))

(assert (=> b!1044712 (arrayNoDuplicates!0 lt!460426 #b00000000000000000000000000000000 Nil!21976)))

(declare-fun lt!460427 () Unit!34081)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65833 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21979) Unit!34081)

(assert (=> b!1044712 (= lt!460427 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11677 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41512 lt!460424) #b00000000000000000000000000000000 Nil!21976))))

(declare-fun arrayCountValidKeys!0 (array!65833 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044712 (= (arrayCountValidKeys!0 lt!460426 #b00000000000000000000000000000000 (size!32199 (_keys!11677 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11677 thiss!1427) #b00000000000000000000000000000000 (size!32199 (_keys!11677 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044712 (= lt!460426 (array!65834 (store (arr!31663 (_keys!11677 thiss!1427)) (index!41512 lt!460424) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32199 (_keys!11677 thiss!1427))))))

(declare-fun lt!460423 () Unit!34081)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65833 (_ BitVec 32) (_ BitVec 64)) Unit!34081)

(assert (=> b!1044712 (= lt!460423 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11677 thiss!1427) (index!41512 lt!460424) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044713 () Bool)

(declare-fun res!695648 () Bool)

(assert (=> b!1044713 (=> res!695648 e!592001)))

(assert (=> b!1044713 (= res!695648 (or (not (= (size!32200 (_values!6404 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30530 thiss!1427)))) (not (= (size!32199 (_keys!11677 thiss!1427)) (size!32200 (_values!6404 thiss!1427)))) (bvslt (mask!30530 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6109 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6109 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!24811 () Bool)

(declare-fun array_inv!24471 (array!65833) Bool)

(declare-fun array_inv!24472 (array!65835) Bool)

(assert (=> b!1044714 (= e!592005 (and tp!74511 tp_is_empty!24811 (array_inv!24471 (_keys!11677 thiss!1427)) (array_inv!24472 (_values!6404 thiss!1427)) e!592006))))

(declare-fun b!1044715 () Bool)

(assert (=> b!1044715 (= e!592002 tp_is_empty!24811)))

(declare-fun b!1044716 () Bool)

(assert (=> b!1044716 (= e!592004 tp_is_empty!24811)))

(declare-fun b!1044717 () Bool)

(assert (=> b!1044717 (= e!592003 e!592007)))

(declare-fun res!695652 () Bool)

(assert (=> b!1044717 (=> (not res!695652) (not e!592007))))

(get-info :version)

(assert (=> b!1044717 (= res!695652 ((_ is Found!9785) lt!460424))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65833 (_ BitVec 32)) SeekEntryResult!9785)

(assert (=> b!1044717 (= lt!460424 (seekEntry!0 key!909 (_keys!11677 thiss!1427) (mask!30530 thiss!1427)))))

(assert (= (and start!91888 res!695650) b!1044709))

(assert (= (and b!1044709 res!695651) b!1044717))

(assert (= (and b!1044717 res!695652) b!1044712))

(assert (= (and b!1044712 (not res!695649)) b!1044713))

(assert (= (and b!1044713 (not res!695648)) b!1044710))

(assert (= (and b!1044710 (not res!695647)) b!1044708))

(assert (= (and b!1044711 condMapEmpty!38837) mapIsEmpty!38837))

(assert (= (and b!1044711 (not condMapEmpty!38837)) mapNonEmpty!38837))

(assert (= (and mapNonEmpty!38837 ((_ is ValueCellFull!11702) mapValue!38837)) b!1044716))

(assert (= (and b!1044711 ((_ is ValueCellFull!11702) mapDefault!38837)) b!1044715))

(assert (= b!1044714 b!1044711))

(assert (= start!91888 b!1044714))

(declare-fun m!964255 () Bool)

(assert (=> start!91888 m!964255))

(declare-fun m!964257 () Bool)

(assert (=> mapNonEmpty!38837 m!964257))

(declare-fun m!964259 () Bool)

(assert (=> b!1044708 m!964259))

(declare-fun m!964261 () Bool)

(assert (=> b!1044710 m!964261))

(declare-fun m!964263 () Bool)

(assert (=> b!1044714 m!964263))

(declare-fun m!964265 () Bool)

(assert (=> b!1044714 m!964265))

(declare-fun m!964267 () Bool)

(assert (=> b!1044717 m!964267))

(declare-fun m!964269 () Bool)

(assert (=> b!1044712 m!964269))

(declare-fun m!964271 () Bool)

(assert (=> b!1044712 m!964271))

(declare-fun m!964273 () Bool)

(assert (=> b!1044712 m!964273))

(declare-fun m!964275 () Bool)

(assert (=> b!1044712 m!964275))

(declare-fun m!964277 () Bool)

(assert (=> b!1044712 m!964277))

(declare-fun m!964279 () Bool)

(assert (=> b!1044712 m!964279))

(declare-fun m!964281 () Bool)

(assert (=> b!1044712 m!964281))

(declare-fun m!964283 () Bool)

(assert (=> b!1044712 m!964283))

(declare-fun m!964285 () Bool)

(assert (=> b!1044712 m!964285))

(declare-fun m!964287 () Bool)

(assert (=> b!1044712 m!964287))

(declare-fun m!964289 () Bool)

(assert (=> b!1044712 m!964289))

(check-sat (not b!1044710) b_and!33633 (not start!91888) (not b!1044714) (not b!1044712) tp_is_empty!24811 (not mapNonEmpty!38837) (not b!1044717) (not b_next!21091) (not b!1044708))
(check-sat b_and!33633 (not b_next!21091))
