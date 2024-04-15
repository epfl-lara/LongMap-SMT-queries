; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89550 () Bool)

(assert start!89550)

(declare-fun b!1027064 () Bool)

(declare-fun b_free!20551 () Bool)

(declare-fun b_next!20551 () Bool)

(assert (=> b!1027064 (= b_free!20551 (not b_next!20551))))

(declare-fun tp!72698 () Bool)

(declare-fun b_and!32771 () Bool)

(assert (=> b!1027064 (= tp!72698 b_and!32771)))

(declare-fun b!1027060 () Bool)

(declare-fun e!579575 () Bool)

(declare-fun tp_is_empty!24271 () Bool)

(assert (=> b!1027060 (= e!579575 tp_is_empty!24271)))

(declare-fun b!1027061 () Bool)

(declare-fun res!687505 () Bool)

(declare-fun e!579573 () Bool)

(assert (=> b!1027061 (=> res!687505 e!579573)))

(declare-datatypes ((V!37235 0))(
  ( (V!37236 (val!12186 Int)) )
))
(declare-datatypes ((ValueCell!11432 0))(
  ( (ValueCellFull!11432 (v!14754 V!37235)) (EmptyCell!11432) )
))
(declare-datatypes ((array!64531 0))(
  ( (array!64532 (arr!31074 (Array (_ BitVec 32) (_ BitVec 64))) (size!31589 (_ BitVec 32))) )
))
(declare-datatypes ((array!64533 0))(
  ( (array!64534 (arr!31075 (Array (_ BitVec 32) ValueCell!11432)) (size!31590 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5458 0))(
  ( (LongMapFixedSize!5459 (defaultEntry!6081 Int) (mask!29788 (_ BitVec 32)) (extraKeys!5813 (_ BitVec 32)) (zeroValue!5917 V!37235) (minValue!5917 V!37235) (_size!2784 (_ BitVec 32)) (_keys!11224 array!64531) (_values!6104 array!64533) (_vacant!2784 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5458)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64531 (_ BitVec 32)) Bool)

(assert (=> b!1027061 (= res!687505 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11224 thiss!1427) (mask!29788 thiss!1427))))))

(declare-fun b!1027062 () Bool)

(declare-fun e!579572 () Bool)

(assert (=> b!1027062 (= e!579572 (not e!579573))))

(declare-fun res!687502 () Bool)

(assert (=> b!1027062 (=> res!687502 e!579573)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027062 (= res!687502 (not (validMask!0 (mask!29788 thiss!1427))))))

(declare-fun lt!451902 () array!64531)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027062 (not (arrayContainsKey!0 lt!451902 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9657 0))(
  ( (MissingZero!9657 (index!40999 (_ BitVec 32))) (Found!9657 (index!41000 (_ BitVec 32))) (Intermediate!9657 (undefined!10469 Bool) (index!41001 (_ BitVec 32)) (x!91388 (_ BitVec 32))) (Undefined!9657) (MissingVacant!9657 (index!41002 (_ BitVec 32))) )
))
(declare-fun lt!451897 () SeekEntryResult!9657)

(declare-datatypes ((Unit!33359 0))(
  ( (Unit!33360) )
))
(declare-fun lt!451900 () Unit!33359)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64531 (_ BitVec 32) (_ BitVec 64)) Unit!33359)

(assert (=> b!1027062 (= lt!451900 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11224 thiss!1427) (index!41000 lt!451897) key!909))))

(assert (=> b!1027062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451902 (mask!29788 thiss!1427))))

(declare-fun lt!451899 () Unit!33359)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64531 (_ BitVec 32) (_ BitVec 32)) Unit!33359)

(assert (=> b!1027062 (= lt!451899 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11224 thiss!1427) (index!41000 lt!451897) (mask!29788 thiss!1427)))))

(declare-datatypes ((List!21832 0))(
  ( (Nil!21829) (Cons!21828 (h!23026 (_ BitVec 64)) (t!30885 List!21832)) )
))
(declare-fun arrayNoDuplicates!0 (array!64531 (_ BitVec 32) List!21832) Bool)

(assert (=> b!1027062 (arrayNoDuplicates!0 lt!451902 #b00000000000000000000000000000000 Nil!21829)))

(declare-fun lt!451901 () Unit!33359)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64531 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21832) Unit!33359)

(assert (=> b!1027062 (= lt!451901 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11224 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41000 lt!451897) #b00000000000000000000000000000000 Nil!21829))))

(declare-fun arrayCountValidKeys!0 (array!64531 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027062 (= (arrayCountValidKeys!0 lt!451902 #b00000000000000000000000000000000 (size!31589 (_keys!11224 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11224 thiss!1427) #b00000000000000000000000000000000 (size!31589 (_keys!11224 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027062 (= lt!451902 (array!64532 (store (arr!31074 (_keys!11224 thiss!1427)) (index!41000 lt!451897) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31589 (_keys!11224 thiss!1427))))))

(declare-fun lt!451903 () Unit!33359)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64531 (_ BitVec 32) (_ BitVec 64)) Unit!33359)

(assert (=> b!1027062 (= lt!451903 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11224 thiss!1427) (index!41000 lt!451897) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027063 () Bool)

(declare-fun e!579577 () Bool)

(assert (=> b!1027063 (= e!579577 e!579572)))

(declare-fun res!687504 () Bool)

(assert (=> b!1027063 (=> (not res!687504) (not e!579572))))

(get-info :version)

(assert (=> b!1027063 (= res!687504 ((_ is Found!9657) lt!451897))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64531 (_ BitVec 32)) SeekEntryResult!9657)

(assert (=> b!1027063 (= lt!451897 (seekEntry!0 key!909 (_keys!11224 thiss!1427) (mask!29788 thiss!1427)))))

(declare-fun e!579579 () Bool)

(declare-fun e!579578 () Bool)

(declare-fun array_inv!24061 (array!64531) Bool)

(declare-fun array_inv!24062 (array!64533) Bool)

(assert (=> b!1027064 (= e!579578 (and tp!72698 tp_is_empty!24271 (array_inv!24061 (_keys!11224 thiss!1427)) (array_inv!24062 (_values!6104 thiss!1427)) e!579579))))

(declare-fun res!687500 () Bool)

(assert (=> start!89550 (=> (not res!687500) (not e!579577))))

(declare-fun valid!2060 (LongMapFixedSize!5458) Bool)

(assert (=> start!89550 (= res!687500 (valid!2060 thiss!1427))))

(assert (=> start!89550 e!579577))

(assert (=> start!89550 e!579578))

(assert (=> start!89550 true))

(declare-fun mapIsEmpty!37835 () Bool)

(declare-fun mapRes!37835 () Bool)

(assert (=> mapIsEmpty!37835 mapRes!37835))

(declare-fun b!1027065 () Bool)

(assert (=> b!1027065 (= e!579579 (and e!579575 mapRes!37835))))

(declare-fun condMapEmpty!37835 () Bool)

(declare-fun mapDefault!37835 () ValueCell!11432)

(assert (=> b!1027065 (= condMapEmpty!37835 (= (arr!31075 (_values!6104 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11432)) mapDefault!37835)))))

(declare-fun b!1027066 () Bool)

(declare-fun e!579576 () Bool)

(assert (=> b!1027066 (= e!579576 tp_is_empty!24271)))

(declare-fun b!1027067 () Bool)

(declare-fun res!687503 () Bool)

(assert (=> b!1027067 (=> (not res!687503) (not e!579577))))

(assert (=> b!1027067 (= res!687503 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027068 () Bool)

(assert (=> b!1027068 (= e!579573 true)))

(declare-fun lt!451898 () Bool)

(assert (=> b!1027068 (= lt!451898 (arrayNoDuplicates!0 (_keys!11224 thiss!1427) #b00000000000000000000000000000000 Nil!21829))))

(declare-fun b!1027069 () Bool)

(declare-fun res!687501 () Bool)

(assert (=> b!1027069 (=> res!687501 e!579573)))

(assert (=> b!1027069 (= res!687501 (or (not (= (size!31590 (_values!6104 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29788 thiss!1427)))) (not (= (size!31589 (_keys!11224 thiss!1427)) (size!31590 (_values!6104 thiss!1427)))) (bvslt (mask!29788 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5813 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5813 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!37835 () Bool)

(declare-fun tp!72699 () Bool)

(assert (=> mapNonEmpty!37835 (= mapRes!37835 (and tp!72699 e!579576))))

(declare-fun mapKey!37835 () (_ BitVec 32))

(declare-fun mapRest!37835 () (Array (_ BitVec 32) ValueCell!11432))

(declare-fun mapValue!37835 () ValueCell!11432)

(assert (=> mapNonEmpty!37835 (= (arr!31075 (_values!6104 thiss!1427)) (store mapRest!37835 mapKey!37835 mapValue!37835))))

(assert (= (and start!89550 res!687500) b!1027067))

(assert (= (and b!1027067 res!687503) b!1027063))

(assert (= (and b!1027063 res!687504) b!1027062))

(assert (= (and b!1027062 (not res!687502)) b!1027069))

(assert (= (and b!1027069 (not res!687501)) b!1027061))

(assert (= (and b!1027061 (not res!687505)) b!1027068))

(assert (= (and b!1027065 condMapEmpty!37835) mapIsEmpty!37835))

(assert (= (and b!1027065 (not condMapEmpty!37835)) mapNonEmpty!37835))

(assert (= (and mapNonEmpty!37835 ((_ is ValueCellFull!11432) mapValue!37835)) b!1027066))

(assert (= (and b!1027065 ((_ is ValueCellFull!11432) mapDefault!37835)) b!1027060))

(assert (= b!1027064 b!1027065))

(assert (= start!89550 b!1027064))

(declare-fun m!945011 () Bool)

(assert (=> b!1027064 m!945011))

(declare-fun m!945013 () Bool)

(assert (=> b!1027064 m!945013))

(declare-fun m!945015 () Bool)

(assert (=> b!1027062 m!945015))

(declare-fun m!945017 () Bool)

(assert (=> b!1027062 m!945017))

(declare-fun m!945019 () Bool)

(assert (=> b!1027062 m!945019))

(declare-fun m!945021 () Bool)

(assert (=> b!1027062 m!945021))

(declare-fun m!945023 () Bool)

(assert (=> b!1027062 m!945023))

(declare-fun m!945025 () Bool)

(assert (=> b!1027062 m!945025))

(declare-fun m!945027 () Bool)

(assert (=> b!1027062 m!945027))

(declare-fun m!945029 () Bool)

(assert (=> b!1027062 m!945029))

(declare-fun m!945031 () Bool)

(assert (=> b!1027062 m!945031))

(declare-fun m!945033 () Bool)

(assert (=> b!1027062 m!945033))

(declare-fun m!945035 () Bool)

(assert (=> b!1027062 m!945035))

(declare-fun m!945037 () Bool)

(assert (=> b!1027061 m!945037))

(declare-fun m!945039 () Bool)

(assert (=> start!89550 m!945039))

(declare-fun m!945041 () Bool)

(assert (=> b!1027068 m!945041))

(declare-fun m!945043 () Bool)

(assert (=> b!1027063 m!945043))

(declare-fun m!945045 () Bool)

(assert (=> mapNonEmpty!37835 m!945045))

(check-sat (not b!1027061) (not mapNonEmpty!37835) tp_is_empty!24271 (not b_next!20551) b_and!32771 (not b!1027064) (not b!1027068) (not b!1027063) (not start!89550) (not b!1027062))
(check-sat b_and!32771 (not b_next!20551))
