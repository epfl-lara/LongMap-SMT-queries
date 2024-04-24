; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89756 () Bool)

(assert start!89756)

(declare-fun b!1028076 () Bool)

(declare-fun b_free!20521 () Bool)

(declare-fun b_next!20521 () Bool)

(assert (=> b!1028076 (= b_free!20521 (not b_next!20521))))

(declare-fun tp!72608 () Bool)

(declare-fun b_and!32777 () Bool)

(assert (=> b!1028076 (= tp!72608 b_and!32777)))

(declare-fun mapNonEmpty!37790 () Bool)

(declare-fun mapRes!37790 () Bool)

(declare-fun tp!72609 () Bool)

(declare-fun e!580150 () Bool)

(assert (=> mapNonEmpty!37790 (= mapRes!37790 (and tp!72609 e!580150))))

(declare-datatypes ((V!37195 0))(
  ( (V!37196 (val!12171 Int)) )
))
(declare-datatypes ((ValueCell!11417 0))(
  ( (ValueCellFull!11417 (v!14736 V!37195)) (EmptyCell!11417) )
))
(declare-datatypes ((array!64581 0))(
  ( (array!64582 (arr!31093 (Array (_ BitVec 32) (_ BitVec 64))) (size!31607 (_ BitVec 32))) )
))
(declare-datatypes ((array!64583 0))(
  ( (array!64584 (arr!31094 (Array (_ BitVec 32) ValueCell!11417)) (size!31608 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5428 0))(
  ( (LongMapFixedSize!5429 (defaultEntry!6066 Int) (mask!29828 (_ BitVec 32)) (extraKeys!5798 (_ BitVec 32)) (zeroValue!5902 V!37195) (minValue!5902 V!37195) (_size!2769 (_ BitVec 32)) (_keys!11251 array!64581) (_values!6089 array!64583) (_vacant!2769 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5428)

(declare-fun mapKey!37790 () (_ BitVec 32))

(declare-fun mapValue!37790 () ValueCell!11417)

(declare-fun mapRest!37790 () (Array (_ BitVec 32) ValueCell!11417))

(assert (=> mapNonEmpty!37790 (= (arr!31094 (_values!6089 thiss!1427)) (store mapRest!37790 mapKey!37790 mapValue!37790))))

(declare-fun mapIsEmpty!37790 () Bool)

(assert (=> mapIsEmpty!37790 mapRes!37790))

(declare-fun tp_is_empty!24241 () Bool)

(declare-fun e!580152 () Bool)

(declare-fun e!580147 () Bool)

(declare-fun array_inv!24087 (array!64581) Bool)

(declare-fun array_inv!24088 (array!64583) Bool)

(assert (=> b!1028076 (= e!580147 (and tp!72608 tp_is_empty!24241 (array_inv!24087 (_keys!11251 thiss!1427)) (array_inv!24088 (_values!6089 thiss!1427)) e!580152))))

(declare-fun b!1028077 () Bool)

(declare-fun e!580148 () Bool)

(declare-fun e!580146 () Bool)

(assert (=> b!1028077 (= e!580148 (not e!580146))))

(declare-fun res!687810 () Bool)

(assert (=> b!1028077 (=> res!687810 e!580146)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028077 (= res!687810 (not (validMask!0 (mask!29828 thiss!1427))))))

(declare-fun lt!452298 () array!64581)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028077 (not (arrayContainsKey!0 lt!452298 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9611 0))(
  ( (MissingZero!9611 (index!40815 (_ BitVec 32))) (Found!9611 (index!40816 (_ BitVec 32))) (Intermediate!9611 (undefined!10423 Bool) (index!40817 (_ BitVec 32)) (x!91327 (_ BitVec 32))) (Undefined!9611) (MissingVacant!9611 (index!40818 (_ BitVec 32))) )
))
(declare-fun lt!452300 () SeekEntryResult!9611)

(declare-datatypes ((Unit!33464 0))(
  ( (Unit!33465) )
))
(declare-fun lt!452303 () Unit!33464)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64581 (_ BitVec 32) (_ BitVec 64)) Unit!33464)

(assert (=> b!1028077 (= lt!452303 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11251 thiss!1427) (index!40816 lt!452300) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64581 (_ BitVec 32)) Bool)

(assert (=> b!1028077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452298 (mask!29828 thiss!1427))))

(declare-fun lt!452299 () Unit!33464)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64581 (_ BitVec 32) (_ BitVec 32)) Unit!33464)

(assert (=> b!1028077 (= lt!452299 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11251 thiss!1427) (index!40816 lt!452300) (mask!29828 thiss!1427)))))

(declare-datatypes ((List!21776 0))(
  ( (Nil!21773) (Cons!21772 (h!22979 (_ BitVec 64)) (t!30830 List!21776)) )
))
(declare-fun arrayNoDuplicates!0 (array!64581 (_ BitVec 32) List!21776) Bool)

(assert (=> b!1028077 (arrayNoDuplicates!0 lt!452298 #b00000000000000000000000000000000 Nil!21773)))

(declare-fun lt!452297 () Unit!33464)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64581 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21776) Unit!33464)

(assert (=> b!1028077 (= lt!452297 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11251 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40816 lt!452300) #b00000000000000000000000000000000 Nil!21773))))

(declare-fun arrayCountValidKeys!0 (array!64581 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028077 (= (arrayCountValidKeys!0 lt!452298 #b00000000000000000000000000000000 (size!31607 (_keys!11251 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11251 thiss!1427) #b00000000000000000000000000000000 (size!31607 (_keys!11251 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028077 (= lt!452298 (array!64582 (store (arr!31093 (_keys!11251 thiss!1427)) (index!40816 lt!452300) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31607 (_keys!11251 thiss!1427))))))

(declare-fun lt!452301 () Unit!33464)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64581 (_ BitVec 32) (_ BitVec 64)) Unit!33464)

(assert (=> b!1028077 (= lt!452301 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11251 thiss!1427) (index!40816 lt!452300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028078 () Bool)

(assert (=> b!1028078 (= e!580150 tp_is_empty!24241)))

(declare-fun b!1028079 () Bool)

(assert (=> b!1028079 (= e!580146 true)))

(declare-fun lt!452302 () Bool)

(assert (=> b!1028079 (= lt!452302 (arrayNoDuplicates!0 (_keys!11251 thiss!1427) #b00000000000000000000000000000000 Nil!21773))))

(declare-fun b!1028080 () Bool)

(declare-fun res!687808 () Bool)

(declare-fun e!580151 () Bool)

(assert (=> b!1028080 (=> (not res!687808) (not e!580151))))

(assert (=> b!1028080 (= res!687808 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1028082 () Bool)

(declare-fun res!687812 () Bool)

(assert (=> b!1028082 (=> res!687812 e!580146)))

(assert (=> b!1028082 (= res!687812 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11251 thiss!1427) (mask!29828 thiss!1427))))))

(declare-fun b!1028083 () Bool)

(declare-fun e!580153 () Bool)

(assert (=> b!1028083 (= e!580153 tp_is_empty!24241)))

(declare-fun b!1028084 () Bool)

(assert (=> b!1028084 (= e!580151 e!580148)))

(declare-fun res!687807 () Bool)

(assert (=> b!1028084 (=> (not res!687807) (not e!580148))))

(get-info :version)

(assert (=> b!1028084 (= res!687807 ((_ is Found!9611) lt!452300))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64581 (_ BitVec 32)) SeekEntryResult!9611)

(assert (=> b!1028084 (= lt!452300 (seekEntry!0 key!909 (_keys!11251 thiss!1427) (mask!29828 thiss!1427)))))

(declare-fun b!1028085 () Bool)

(declare-fun res!687811 () Bool)

(assert (=> b!1028085 (=> res!687811 e!580146)))

(assert (=> b!1028085 (= res!687811 (or (not (= (size!31608 (_values!6089 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29828 thiss!1427)))) (not (= (size!31607 (_keys!11251 thiss!1427)) (size!31608 (_values!6089 thiss!1427)))) (bvslt (mask!29828 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5798 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5798 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun res!687809 () Bool)

(assert (=> start!89756 (=> (not res!687809) (not e!580151))))

(declare-fun valid!2066 (LongMapFixedSize!5428) Bool)

(assert (=> start!89756 (= res!687809 (valid!2066 thiss!1427))))

(assert (=> start!89756 e!580151))

(assert (=> start!89756 e!580147))

(assert (=> start!89756 true))

(declare-fun b!1028081 () Bool)

(assert (=> b!1028081 (= e!580152 (and e!580153 mapRes!37790))))

(declare-fun condMapEmpty!37790 () Bool)

(declare-fun mapDefault!37790 () ValueCell!11417)

(assert (=> b!1028081 (= condMapEmpty!37790 (= (arr!31094 (_values!6089 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11417)) mapDefault!37790)))))

(assert (= (and start!89756 res!687809) b!1028080))

(assert (= (and b!1028080 res!687808) b!1028084))

(assert (= (and b!1028084 res!687807) b!1028077))

(assert (= (and b!1028077 (not res!687810)) b!1028085))

(assert (= (and b!1028085 (not res!687811)) b!1028082))

(assert (= (and b!1028082 (not res!687812)) b!1028079))

(assert (= (and b!1028081 condMapEmpty!37790) mapIsEmpty!37790))

(assert (= (and b!1028081 (not condMapEmpty!37790)) mapNonEmpty!37790))

(assert (= (and mapNonEmpty!37790 ((_ is ValueCellFull!11417) mapValue!37790)) b!1028078))

(assert (= (and b!1028081 ((_ is ValueCellFull!11417) mapDefault!37790)) b!1028083))

(assert (= b!1028076 b!1028081))

(assert (= start!89756 b!1028076))

(declare-fun m!946755 () Bool)

(assert (=> b!1028082 m!946755))

(declare-fun m!946757 () Bool)

(assert (=> b!1028076 m!946757))

(declare-fun m!946759 () Bool)

(assert (=> b!1028076 m!946759))

(declare-fun m!946761 () Bool)

(assert (=> b!1028084 m!946761))

(declare-fun m!946763 () Bool)

(assert (=> b!1028077 m!946763))

(declare-fun m!946765 () Bool)

(assert (=> b!1028077 m!946765))

(declare-fun m!946767 () Bool)

(assert (=> b!1028077 m!946767))

(declare-fun m!946769 () Bool)

(assert (=> b!1028077 m!946769))

(declare-fun m!946771 () Bool)

(assert (=> b!1028077 m!946771))

(declare-fun m!946773 () Bool)

(assert (=> b!1028077 m!946773))

(declare-fun m!946775 () Bool)

(assert (=> b!1028077 m!946775))

(declare-fun m!946777 () Bool)

(assert (=> b!1028077 m!946777))

(declare-fun m!946779 () Bool)

(assert (=> b!1028077 m!946779))

(declare-fun m!946781 () Bool)

(assert (=> b!1028077 m!946781))

(declare-fun m!946783 () Bool)

(assert (=> b!1028077 m!946783))

(declare-fun m!946785 () Bool)

(assert (=> b!1028079 m!946785))

(declare-fun m!946787 () Bool)

(assert (=> mapNonEmpty!37790 m!946787))

(declare-fun m!946789 () Bool)

(assert (=> start!89756 m!946789))

(check-sat (not b!1028079) tp_is_empty!24241 (not b!1028084) (not b!1028076) (not start!89756) (not mapNonEmpty!37790) (not b!1028082) b_and!32777 (not b!1028077) (not b_next!20521))
(check-sat b_and!32777 (not b_next!20521))
