; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89524 () Bool)

(assert start!89524)

(declare-fun b!1026792 () Bool)

(declare-fun b_free!20523 () Bool)

(declare-fun b_next!20523 () Bool)

(assert (=> b!1026792 (= b_free!20523 (not b_next!20523))))

(declare-fun tp!72615 () Bool)

(declare-fun b_and!32769 () Bool)

(assert (=> b!1026792 (= tp!72615 b_and!32769)))

(declare-fun b!1026791 () Bool)

(declare-fun e!579329 () Bool)

(declare-fun e!579333 () Bool)

(declare-fun mapRes!37793 () Bool)

(assert (=> b!1026791 (= e!579329 (and e!579333 mapRes!37793))))

(declare-fun condMapEmpty!37793 () Bool)

(declare-datatypes ((V!37197 0))(
  ( (V!37198 (val!12172 Int)) )
))
(declare-datatypes ((ValueCell!11418 0))(
  ( (ValueCellFull!11418 (v!14741 V!37197)) (EmptyCell!11418) )
))
(declare-datatypes ((array!64536 0))(
  ( (array!64537 (arr!31077 (Array (_ BitVec 32) (_ BitVec 64))) (size!31590 (_ BitVec 32))) )
))
(declare-datatypes ((array!64538 0))(
  ( (array!64539 (arr!31078 (Array (_ BitVec 32) ValueCell!11418)) (size!31591 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5430 0))(
  ( (LongMapFixedSize!5431 (defaultEntry!6067 Int) (mask!29769 (_ BitVec 32)) (extraKeys!5799 (_ BitVec 32)) (zeroValue!5903 V!37197) (minValue!5903 V!37197) (_size!2770 (_ BitVec 32)) (_keys!11214 array!64536) (_values!6090 array!64538) (_vacant!2770 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5430)

(declare-fun mapDefault!37793 () ValueCell!11418)

(assert (=> b!1026791 (= condMapEmpty!37793 (= (arr!31078 (_values!6090 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11418)) mapDefault!37793)))))

(declare-fun e!579327 () Bool)

(declare-fun tp_is_empty!24243 () Bool)

(declare-fun array_inv!24065 (array!64536) Bool)

(declare-fun array_inv!24066 (array!64538) Bool)

(assert (=> b!1026792 (= e!579327 (and tp!72615 tp_is_empty!24243 (array_inv!24065 (_keys!11214 thiss!1427)) (array_inv!24066 (_values!6090 thiss!1427)) e!579329))))

(declare-fun b!1026793 () Bool)

(declare-fun res!687315 () Bool)

(declare-fun e!579328 () Bool)

(assert (=> b!1026793 (=> res!687315 e!579328)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64536 (_ BitVec 32)) Bool)

(assert (=> b!1026793 (= res!687315 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11214 thiss!1427) (mask!29769 thiss!1427))))))

(declare-fun res!687319 () Bool)

(declare-fun e!579332 () Bool)

(assert (=> start!89524 (=> (not res!687319) (not e!579332))))

(declare-fun valid!2061 (LongMapFixedSize!5430) Bool)

(assert (=> start!89524 (= res!687319 (valid!2061 thiss!1427))))

(assert (=> start!89524 e!579332))

(assert (=> start!89524 e!579327))

(assert (=> start!89524 true))

(declare-fun b!1026794 () Bool)

(declare-fun res!687318 () Bool)

(assert (=> b!1026794 (=> res!687318 e!579328)))

(assert (=> b!1026794 (= res!687318 (or (not (= (size!31591 (_values!6090 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29769 thiss!1427)))) (not (= (size!31590 (_keys!11214 thiss!1427)) (size!31591 (_values!6090 thiss!1427)))) (bvslt (mask!29769 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5799 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5799 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026795 () Bool)

(assert (=> b!1026795 (= e!579328 true)))

(declare-fun lt!451808 () Bool)

(declare-datatypes ((List!21790 0))(
  ( (Nil!21787) (Cons!21786 (h!22984 (_ BitVec 64)) (t!30852 List!21790)) )
))
(declare-fun arrayNoDuplicates!0 (array!64536 (_ BitVec 32) List!21790) Bool)

(assert (=> b!1026795 (= lt!451808 (arrayNoDuplicates!0 (_keys!11214 thiss!1427) #b00000000000000000000000000000000 Nil!21787))))

(declare-fun b!1026796 () Bool)

(declare-fun e!579331 () Bool)

(assert (=> b!1026796 (= e!579332 e!579331)))

(declare-fun res!687317 () Bool)

(assert (=> b!1026796 (=> (not res!687317) (not e!579331))))

(declare-datatypes ((SeekEntryResult!9656 0))(
  ( (MissingZero!9656 (index!40995 (_ BitVec 32))) (Found!9656 (index!40996 (_ BitVec 32))) (Intermediate!9656 (undefined!10468 Bool) (index!40997 (_ BitVec 32)) (x!91350 (_ BitVec 32))) (Undefined!9656) (MissingVacant!9656 (index!40998 (_ BitVec 32))) )
))
(declare-fun lt!451806 () SeekEntryResult!9656)

(get-info :version)

(assert (=> b!1026796 (= res!687317 ((_ is Found!9656) lt!451806))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64536 (_ BitVec 32)) SeekEntryResult!9656)

(assert (=> b!1026796 (= lt!451806 (seekEntry!0 key!909 (_keys!11214 thiss!1427) (mask!29769 thiss!1427)))))

(declare-fun b!1026797 () Bool)

(assert (=> b!1026797 (= e!579333 tp_is_empty!24243)))

(declare-fun b!1026798 () Bool)

(assert (=> b!1026798 (= e!579331 (not e!579328))))

(declare-fun res!687316 () Bool)

(assert (=> b!1026798 (=> res!687316 e!579328)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026798 (= res!687316 (not (validMask!0 (mask!29769 thiss!1427))))))

(declare-fun lt!451804 () array!64536)

(declare-fun arrayContainsKey!0 (array!64536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026798 (not (arrayContainsKey!0 lt!451804 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33455 0))(
  ( (Unit!33456) )
))
(declare-fun lt!451803 () Unit!33455)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64536 (_ BitVec 32) (_ BitVec 64)) Unit!33455)

(assert (=> b!1026798 (= lt!451803 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11214 thiss!1427) (index!40996 lt!451806) key!909))))

(assert (=> b!1026798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451804 (mask!29769 thiss!1427))))

(declare-fun lt!451805 () Unit!33455)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64536 (_ BitVec 32) (_ BitVec 32)) Unit!33455)

(assert (=> b!1026798 (= lt!451805 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11214 thiss!1427) (index!40996 lt!451806) (mask!29769 thiss!1427)))))

(assert (=> b!1026798 (arrayNoDuplicates!0 lt!451804 #b00000000000000000000000000000000 Nil!21787)))

(declare-fun lt!451807 () Unit!33455)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64536 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21790) Unit!33455)

(assert (=> b!1026798 (= lt!451807 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11214 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40996 lt!451806) #b00000000000000000000000000000000 Nil!21787))))

(declare-fun arrayCountValidKeys!0 (array!64536 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026798 (= (arrayCountValidKeys!0 lt!451804 #b00000000000000000000000000000000 (size!31590 (_keys!11214 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11214 thiss!1427) #b00000000000000000000000000000000 (size!31590 (_keys!11214 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026798 (= lt!451804 (array!64537 (store (arr!31077 (_keys!11214 thiss!1427)) (index!40996 lt!451806) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31590 (_keys!11214 thiss!1427))))))

(declare-fun lt!451809 () Unit!33455)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64536 (_ BitVec 32) (_ BitVec 64)) Unit!33455)

(assert (=> b!1026798 (= lt!451809 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11214 thiss!1427) (index!40996 lt!451806) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37793 () Bool)

(declare-fun tp!72614 () Bool)

(declare-fun e!579334 () Bool)

(assert (=> mapNonEmpty!37793 (= mapRes!37793 (and tp!72614 e!579334))))

(declare-fun mapValue!37793 () ValueCell!11418)

(declare-fun mapKey!37793 () (_ BitVec 32))

(declare-fun mapRest!37793 () (Array (_ BitVec 32) ValueCell!11418))

(assert (=> mapNonEmpty!37793 (= (arr!31078 (_values!6090 thiss!1427)) (store mapRest!37793 mapKey!37793 mapValue!37793))))

(declare-fun b!1026799 () Bool)

(assert (=> b!1026799 (= e!579334 tp_is_empty!24243)))

(declare-fun b!1026800 () Bool)

(declare-fun res!687320 () Bool)

(assert (=> b!1026800 (=> (not res!687320) (not e!579332))))

(assert (=> b!1026800 (= res!687320 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37793 () Bool)

(assert (=> mapIsEmpty!37793 mapRes!37793))

(assert (= (and start!89524 res!687319) b!1026800))

(assert (= (and b!1026800 res!687320) b!1026796))

(assert (= (and b!1026796 res!687317) b!1026798))

(assert (= (and b!1026798 (not res!687316)) b!1026794))

(assert (= (and b!1026794 (not res!687318)) b!1026793))

(assert (= (and b!1026793 (not res!687315)) b!1026795))

(assert (= (and b!1026791 condMapEmpty!37793) mapIsEmpty!37793))

(assert (= (and b!1026791 (not condMapEmpty!37793)) mapNonEmpty!37793))

(assert (= (and mapNonEmpty!37793 ((_ is ValueCellFull!11418) mapValue!37793)) b!1026799))

(assert (= (and b!1026791 ((_ is ValueCellFull!11418) mapDefault!37793)) b!1026797))

(assert (= b!1026792 b!1026791))

(assert (= start!89524 b!1026792))

(declare-fun m!945127 () Bool)

(assert (=> b!1026796 m!945127))

(declare-fun m!945129 () Bool)

(assert (=> b!1026795 m!945129))

(declare-fun m!945131 () Bool)

(assert (=> b!1026798 m!945131))

(declare-fun m!945133 () Bool)

(assert (=> b!1026798 m!945133))

(declare-fun m!945135 () Bool)

(assert (=> b!1026798 m!945135))

(declare-fun m!945137 () Bool)

(assert (=> b!1026798 m!945137))

(declare-fun m!945139 () Bool)

(assert (=> b!1026798 m!945139))

(declare-fun m!945141 () Bool)

(assert (=> b!1026798 m!945141))

(declare-fun m!945143 () Bool)

(assert (=> b!1026798 m!945143))

(declare-fun m!945145 () Bool)

(assert (=> b!1026798 m!945145))

(declare-fun m!945147 () Bool)

(assert (=> b!1026798 m!945147))

(declare-fun m!945149 () Bool)

(assert (=> b!1026798 m!945149))

(declare-fun m!945151 () Bool)

(assert (=> b!1026798 m!945151))

(declare-fun m!945153 () Bool)

(assert (=> start!89524 m!945153))

(declare-fun m!945155 () Bool)

(assert (=> b!1026793 m!945155))

(declare-fun m!945157 () Bool)

(assert (=> mapNonEmpty!37793 m!945157))

(declare-fun m!945159 () Bool)

(assert (=> b!1026792 m!945159))

(declare-fun m!945161 () Bool)

(assert (=> b!1026792 m!945161))

(check-sat (not start!89524) (not b!1026793) (not b!1026795) (not mapNonEmpty!37793) (not b!1026796) b_and!32769 (not b!1026798) tp_is_empty!24243 (not b!1026792) (not b_next!20523))
(check-sat b_and!32769 (not b_next!20523))
