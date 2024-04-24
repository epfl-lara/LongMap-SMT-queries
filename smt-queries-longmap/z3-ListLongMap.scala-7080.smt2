; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89768 () Bool)

(assert start!89768)

(declare-fun b!1028261 () Bool)

(declare-fun b_free!20533 () Bool)

(declare-fun b_next!20533 () Bool)

(assert (=> b!1028261 (= b_free!20533 (not b_next!20533))))

(declare-fun tp!72644 () Bool)

(declare-fun b_and!32789 () Bool)

(assert (=> b!1028261 (= tp!72644 b_and!32789)))

(declare-fun b!1028256 () Bool)

(declare-fun e!580297 () Bool)

(declare-fun e!580290 () Bool)

(declare-fun mapRes!37808 () Bool)

(assert (=> b!1028256 (= e!580297 (and e!580290 mapRes!37808))))

(declare-fun condMapEmpty!37808 () Bool)

(declare-datatypes ((V!37211 0))(
  ( (V!37212 (val!12177 Int)) )
))
(declare-datatypes ((ValueCell!11423 0))(
  ( (ValueCellFull!11423 (v!14742 V!37211)) (EmptyCell!11423) )
))
(declare-datatypes ((array!64605 0))(
  ( (array!64606 (arr!31105 (Array (_ BitVec 32) (_ BitVec 64))) (size!31619 (_ BitVec 32))) )
))
(declare-datatypes ((array!64607 0))(
  ( (array!64608 (arr!31106 (Array (_ BitVec 32) ValueCell!11423)) (size!31620 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5440 0))(
  ( (LongMapFixedSize!5441 (defaultEntry!6072 Int) (mask!29838 (_ BitVec 32)) (extraKeys!5804 (_ BitVec 32)) (zeroValue!5908 V!37211) (minValue!5908 V!37211) (_size!2775 (_ BitVec 32)) (_keys!11257 array!64605) (_values!6095 array!64607) (_vacant!2775 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5440)

(declare-fun mapDefault!37808 () ValueCell!11423)

(assert (=> b!1028256 (= condMapEmpty!37808 (= (arr!31106 (_values!6095 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11423)) mapDefault!37808)))))

(declare-fun b!1028257 () Bool)

(declare-fun res!687915 () Bool)

(declare-fun e!580291 () Bool)

(assert (=> b!1028257 (=> res!687915 e!580291)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64605 (_ BitVec 32)) Bool)

(assert (=> b!1028257 (= res!687915 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11257 thiss!1427) (mask!29838 thiss!1427))))))

(declare-fun b!1028258 () Bool)

(declare-fun e!580293 () Bool)

(assert (=> b!1028258 (= e!580293 (not e!580291))))

(declare-fun res!687916 () Bool)

(assert (=> b!1028258 (=> res!687916 e!580291)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028258 (= res!687916 (not (validMask!0 (mask!29838 thiss!1427))))))

(declare-fun lt!452423 () array!64605)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028258 (not (arrayContainsKey!0 lt!452423 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9616 0))(
  ( (MissingZero!9616 (index!40835 (_ BitVec 32))) (Found!9616 (index!40836 (_ BitVec 32))) (Intermediate!9616 (undefined!10428 Bool) (index!40837 (_ BitVec 32)) (x!91348 (_ BitVec 32))) (Undefined!9616) (MissingVacant!9616 (index!40838 (_ BitVec 32))) )
))
(declare-fun lt!452425 () SeekEntryResult!9616)

(declare-datatypes ((Unit!33474 0))(
  ( (Unit!33475) )
))
(declare-fun lt!452424 () Unit!33474)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64605 (_ BitVec 32) (_ BitVec 64)) Unit!33474)

(assert (=> b!1028258 (= lt!452424 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11257 thiss!1427) (index!40836 lt!452425) key!909))))

(assert (=> b!1028258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452423 (mask!29838 thiss!1427))))

(declare-fun lt!452429 () Unit!33474)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64605 (_ BitVec 32) (_ BitVec 32)) Unit!33474)

(assert (=> b!1028258 (= lt!452429 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11257 thiss!1427) (index!40836 lt!452425) (mask!29838 thiss!1427)))))

(declare-datatypes ((List!21781 0))(
  ( (Nil!21778) (Cons!21777 (h!22984 (_ BitVec 64)) (t!30835 List!21781)) )
))
(declare-fun arrayNoDuplicates!0 (array!64605 (_ BitVec 32) List!21781) Bool)

(assert (=> b!1028258 (arrayNoDuplicates!0 lt!452423 #b00000000000000000000000000000000 Nil!21778)))

(declare-fun lt!452428 () Unit!33474)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64605 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21781) Unit!33474)

(assert (=> b!1028258 (= lt!452428 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11257 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40836 lt!452425) #b00000000000000000000000000000000 Nil!21778))))

(declare-fun arrayCountValidKeys!0 (array!64605 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028258 (= (arrayCountValidKeys!0 lt!452423 #b00000000000000000000000000000000 (size!31619 (_keys!11257 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11257 thiss!1427) #b00000000000000000000000000000000 (size!31619 (_keys!11257 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028258 (= lt!452423 (array!64606 (store (arr!31105 (_keys!11257 thiss!1427)) (index!40836 lt!452425) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31619 (_keys!11257 thiss!1427))))))

(declare-fun lt!452427 () Unit!33474)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64605 (_ BitVec 32) (_ BitVec 64)) Unit!33474)

(assert (=> b!1028258 (= lt!452427 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11257 thiss!1427) (index!40836 lt!452425) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028259 () Bool)

(declare-fun tp_is_empty!24253 () Bool)

(assert (=> b!1028259 (= e!580290 tp_is_empty!24253)))

(declare-fun b!1028260 () Bool)

(declare-fun res!687920 () Bool)

(declare-fun e!580296 () Bool)

(assert (=> b!1028260 (=> (not res!687920) (not e!580296))))

(assert (=> b!1028260 (= res!687920 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37808 () Bool)

(assert (=> mapIsEmpty!37808 mapRes!37808))

(declare-fun mapNonEmpty!37808 () Bool)

(declare-fun tp!72645 () Bool)

(declare-fun e!580295 () Bool)

(assert (=> mapNonEmpty!37808 (= mapRes!37808 (and tp!72645 e!580295))))

(declare-fun mapRest!37808 () (Array (_ BitVec 32) ValueCell!11423))

(declare-fun mapKey!37808 () (_ BitVec 32))

(declare-fun mapValue!37808 () ValueCell!11423)

(assert (=> mapNonEmpty!37808 (= (arr!31106 (_values!6095 thiss!1427)) (store mapRest!37808 mapKey!37808 mapValue!37808))))

(declare-fun e!580294 () Bool)

(declare-fun array_inv!24097 (array!64605) Bool)

(declare-fun array_inv!24098 (array!64607) Bool)

(assert (=> b!1028261 (= e!580294 (and tp!72644 tp_is_empty!24253 (array_inv!24097 (_keys!11257 thiss!1427)) (array_inv!24098 (_values!6095 thiss!1427)) e!580297))))

(declare-fun b!1028262 () Bool)

(declare-fun res!687917 () Bool)

(assert (=> b!1028262 (=> res!687917 e!580291)))

(assert (=> b!1028262 (= res!687917 (or (not (= (size!31620 (_values!6095 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29838 thiss!1427)))) (not (= (size!31619 (_keys!11257 thiss!1427)) (size!31620 (_values!6095 thiss!1427)))) (bvslt (mask!29838 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5804 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5804 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1028263 () Bool)

(assert (=> b!1028263 (= e!580295 tp_is_empty!24253)))

(declare-fun res!687918 () Bool)

(assert (=> start!89768 (=> (not res!687918) (not e!580296))))

(declare-fun valid!2071 (LongMapFixedSize!5440) Bool)

(assert (=> start!89768 (= res!687918 (valid!2071 thiss!1427))))

(assert (=> start!89768 e!580296))

(assert (=> start!89768 e!580294))

(assert (=> start!89768 true))

(declare-fun b!1028264 () Bool)

(assert (=> b!1028264 (= e!580291 true)))

(declare-fun lt!452426 () Bool)

(assert (=> b!1028264 (= lt!452426 (arrayNoDuplicates!0 (_keys!11257 thiss!1427) #b00000000000000000000000000000000 Nil!21778))))

(declare-fun b!1028265 () Bool)

(assert (=> b!1028265 (= e!580296 e!580293)))

(declare-fun res!687919 () Bool)

(assert (=> b!1028265 (=> (not res!687919) (not e!580293))))

(get-info :version)

(assert (=> b!1028265 (= res!687919 ((_ is Found!9616) lt!452425))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64605 (_ BitVec 32)) SeekEntryResult!9616)

(assert (=> b!1028265 (= lt!452425 (seekEntry!0 key!909 (_keys!11257 thiss!1427) (mask!29838 thiss!1427)))))

(assert (= (and start!89768 res!687918) b!1028260))

(assert (= (and b!1028260 res!687920) b!1028265))

(assert (= (and b!1028265 res!687919) b!1028258))

(assert (= (and b!1028258 (not res!687916)) b!1028262))

(assert (= (and b!1028262 (not res!687917)) b!1028257))

(assert (= (and b!1028257 (not res!687915)) b!1028264))

(assert (= (and b!1028256 condMapEmpty!37808) mapIsEmpty!37808))

(assert (= (and b!1028256 (not condMapEmpty!37808)) mapNonEmpty!37808))

(assert (= (and mapNonEmpty!37808 ((_ is ValueCellFull!11423) mapValue!37808)) b!1028263))

(assert (= (and b!1028256 ((_ is ValueCellFull!11423) mapDefault!37808)) b!1028259))

(assert (= b!1028261 b!1028256))

(assert (= start!89768 b!1028261))

(declare-fun m!946971 () Bool)

(assert (=> b!1028258 m!946971))

(declare-fun m!946973 () Bool)

(assert (=> b!1028258 m!946973))

(declare-fun m!946975 () Bool)

(assert (=> b!1028258 m!946975))

(declare-fun m!946977 () Bool)

(assert (=> b!1028258 m!946977))

(declare-fun m!946979 () Bool)

(assert (=> b!1028258 m!946979))

(declare-fun m!946981 () Bool)

(assert (=> b!1028258 m!946981))

(declare-fun m!946983 () Bool)

(assert (=> b!1028258 m!946983))

(declare-fun m!946985 () Bool)

(assert (=> b!1028258 m!946985))

(declare-fun m!946987 () Bool)

(assert (=> b!1028258 m!946987))

(declare-fun m!946989 () Bool)

(assert (=> b!1028258 m!946989))

(declare-fun m!946991 () Bool)

(assert (=> b!1028258 m!946991))

(declare-fun m!946993 () Bool)

(assert (=> b!1028261 m!946993))

(declare-fun m!946995 () Bool)

(assert (=> b!1028261 m!946995))

(declare-fun m!946997 () Bool)

(assert (=> b!1028264 m!946997))

(declare-fun m!946999 () Bool)

(assert (=> start!89768 m!946999))

(declare-fun m!947001 () Bool)

(assert (=> mapNonEmpty!37808 m!947001))

(declare-fun m!947003 () Bool)

(assert (=> b!1028257 m!947003))

(declare-fun m!947005 () Bool)

(assert (=> b!1028265 m!947005))

(check-sat (not b_next!20533) tp_is_empty!24253 (not b!1028265) (not b!1028264) (not b!1028258) (not start!89768) b_and!32789 (not b!1028261) (not mapNonEmpty!37808) (not b!1028257))
(check-sat b_and!32789 (not b_next!20533))
