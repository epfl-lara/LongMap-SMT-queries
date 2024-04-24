; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89732 () Bool)

(assert start!89732)

(declare-fun b!1027719 () Bool)

(declare-fun b_free!20497 () Bool)

(declare-fun b_next!20497 () Bool)

(assert (=> b!1027719 (= b_free!20497 (not b_next!20497))))

(declare-fun tp!72537 () Bool)

(declare-fun b_and!32753 () Bool)

(assert (=> b!1027719 (= tp!72537 b_and!32753)))

(declare-fun b!1027716 () Bool)

(declare-fun e!579862 () Bool)

(assert (=> b!1027716 (= e!579862 true)))

(declare-fun lt!452048 () Bool)

(declare-datatypes ((V!37163 0))(
  ( (V!37164 (val!12159 Int)) )
))
(declare-datatypes ((ValueCell!11405 0))(
  ( (ValueCellFull!11405 (v!14724 V!37163)) (EmptyCell!11405) )
))
(declare-datatypes ((array!64533 0))(
  ( (array!64534 (arr!31069 (Array (_ BitVec 32) (_ BitVec 64))) (size!31583 (_ BitVec 32))) )
))
(declare-datatypes ((array!64535 0))(
  ( (array!64536 (arr!31070 (Array (_ BitVec 32) ValueCell!11405)) (size!31584 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5404 0))(
  ( (LongMapFixedSize!5405 (defaultEntry!6054 Int) (mask!29808 (_ BitVec 32)) (extraKeys!5786 (_ BitVec 32)) (zeroValue!5890 V!37163) (minValue!5890 V!37163) (_size!2757 (_ BitVec 32)) (_keys!11239 array!64533) (_values!6077 array!64535) (_vacant!2757 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5404)

(declare-datatypes ((List!21766 0))(
  ( (Nil!21763) (Cons!21762 (h!22969 (_ BitVec 64)) (t!30820 List!21766)) )
))
(declare-fun arrayNoDuplicates!0 (array!64533 (_ BitVec 32) List!21766) Bool)

(assert (=> b!1027716 (= lt!452048 (arrayNoDuplicates!0 (_keys!11239 thiss!1427) #b00000000000000000000000000000000 Nil!21763))))

(declare-fun b!1027717 () Bool)

(declare-fun res!687595 () Bool)

(assert (=> b!1027717 (=> res!687595 e!579862)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64533 (_ BitVec 32)) Bool)

(assert (=> b!1027717 (= res!687595 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11239 thiss!1427) (mask!29808 thiss!1427))))))

(declare-fun b!1027718 () Bool)

(declare-fun res!687593 () Bool)

(declare-fun e!579860 () Bool)

(assert (=> b!1027718 (=> (not res!687593) (not e!579860))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027718 (= res!687593 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37754 () Bool)

(declare-fun mapRes!37754 () Bool)

(assert (=> mapIsEmpty!37754 mapRes!37754))

(declare-fun e!579859 () Bool)

(declare-fun e!579863 () Bool)

(declare-fun tp_is_empty!24217 () Bool)

(declare-fun array_inv!24075 (array!64533) Bool)

(declare-fun array_inv!24076 (array!64535) Bool)

(assert (=> b!1027719 (= e!579863 (and tp!72537 tp_is_empty!24217 (array_inv!24075 (_keys!11239 thiss!1427)) (array_inv!24076 (_values!6077 thiss!1427)) e!579859))))

(declare-fun res!687592 () Bool)

(assert (=> start!89732 (=> (not res!687592) (not e!579860))))

(declare-fun valid!2059 (LongMapFixedSize!5404) Bool)

(assert (=> start!89732 (= res!687592 (valid!2059 thiss!1427))))

(assert (=> start!89732 e!579860))

(assert (=> start!89732 e!579863))

(assert (=> start!89732 true))

(declare-fun b!1027720 () Bool)

(declare-fun res!687591 () Bool)

(assert (=> b!1027720 (=> res!687591 e!579862)))

(assert (=> b!1027720 (= res!687591 (or (not (= (size!31584 (_values!6077 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29808 thiss!1427)))) (not (= (size!31583 (_keys!11239 thiss!1427)) (size!31584 (_values!6077 thiss!1427)))) (bvslt (mask!29808 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5786 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5786 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027721 () Bool)

(declare-fun e!579858 () Bool)

(assert (=> b!1027721 (= e!579860 e!579858)))

(declare-fun res!687596 () Bool)

(assert (=> b!1027721 (=> (not res!687596) (not e!579858))))

(declare-datatypes ((SeekEntryResult!9600 0))(
  ( (MissingZero!9600 (index!40771 (_ BitVec 32))) (Found!9600 (index!40772 (_ BitVec 32))) (Intermediate!9600 (undefined!10412 Bool) (index!40773 (_ BitVec 32)) (x!91284 (_ BitVec 32))) (Undefined!9600) (MissingVacant!9600 (index!40774 (_ BitVec 32))) )
))
(declare-fun lt!452045 () SeekEntryResult!9600)

(get-info :version)

(assert (=> b!1027721 (= res!687596 ((_ is Found!9600) lt!452045))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64533 (_ BitVec 32)) SeekEntryResult!9600)

(assert (=> b!1027721 (= lt!452045 (seekEntry!0 key!909 (_keys!11239 thiss!1427) (mask!29808 thiss!1427)))))

(declare-fun b!1027722 () Bool)

(assert (=> b!1027722 (= e!579858 (not e!579862))))

(declare-fun res!687594 () Bool)

(assert (=> b!1027722 (=> res!687594 e!579862)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027722 (= res!687594 (not (validMask!0 (mask!29808 thiss!1427))))))

(declare-fun lt!452046 () array!64533)

(declare-fun arrayContainsKey!0 (array!64533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027722 (not (arrayContainsKey!0 lt!452046 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33448 0))(
  ( (Unit!33449) )
))
(declare-fun lt!452051 () Unit!33448)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64533 (_ BitVec 32) (_ BitVec 64)) Unit!33448)

(assert (=> b!1027722 (= lt!452051 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11239 thiss!1427) (index!40772 lt!452045) key!909))))

(assert (=> b!1027722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452046 (mask!29808 thiss!1427))))

(declare-fun lt!452049 () Unit!33448)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64533 (_ BitVec 32) (_ BitVec 32)) Unit!33448)

(assert (=> b!1027722 (= lt!452049 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11239 thiss!1427) (index!40772 lt!452045) (mask!29808 thiss!1427)))))

(assert (=> b!1027722 (arrayNoDuplicates!0 lt!452046 #b00000000000000000000000000000000 Nil!21763)))

(declare-fun lt!452047 () Unit!33448)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64533 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21766) Unit!33448)

(assert (=> b!1027722 (= lt!452047 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11239 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40772 lt!452045) #b00000000000000000000000000000000 Nil!21763))))

(declare-fun arrayCountValidKeys!0 (array!64533 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027722 (= (arrayCountValidKeys!0 lt!452046 #b00000000000000000000000000000000 (size!31583 (_keys!11239 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11239 thiss!1427) #b00000000000000000000000000000000 (size!31583 (_keys!11239 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027722 (= lt!452046 (array!64534 (store (arr!31069 (_keys!11239 thiss!1427)) (index!40772 lt!452045) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31583 (_keys!11239 thiss!1427))))))

(declare-fun lt!452050 () Unit!33448)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64533 (_ BitVec 32) (_ BitVec 64)) Unit!33448)

(assert (=> b!1027722 (= lt!452050 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11239 thiss!1427) (index!40772 lt!452045) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027723 () Bool)

(declare-fun e!579865 () Bool)

(assert (=> b!1027723 (= e!579859 (and e!579865 mapRes!37754))))

(declare-fun condMapEmpty!37754 () Bool)

(declare-fun mapDefault!37754 () ValueCell!11405)

(assert (=> b!1027723 (= condMapEmpty!37754 (= (arr!31070 (_values!6077 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11405)) mapDefault!37754)))))

(declare-fun mapNonEmpty!37754 () Bool)

(declare-fun tp!72536 () Bool)

(declare-fun e!579861 () Bool)

(assert (=> mapNonEmpty!37754 (= mapRes!37754 (and tp!72536 e!579861))))

(declare-fun mapKey!37754 () (_ BitVec 32))

(declare-fun mapRest!37754 () (Array (_ BitVec 32) ValueCell!11405))

(declare-fun mapValue!37754 () ValueCell!11405)

(assert (=> mapNonEmpty!37754 (= (arr!31070 (_values!6077 thiss!1427)) (store mapRest!37754 mapKey!37754 mapValue!37754))))

(declare-fun b!1027724 () Bool)

(assert (=> b!1027724 (= e!579865 tp_is_empty!24217)))

(declare-fun b!1027725 () Bool)

(assert (=> b!1027725 (= e!579861 tp_is_empty!24217)))

(assert (= (and start!89732 res!687592) b!1027718))

(assert (= (and b!1027718 res!687593) b!1027721))

(assert (= (and b!1027721 res!687596) b!1027722))

(assert (= (and b!1027722 (not res!687594)) b!1027720))

(assert (= (and b!1027720 (not res!687591)) b!1027717))

(assert (= (and b!1027717 (not res!687595)) b!1027716))

(assert (= (and b!1027723 condMapEmpty!37754) mapIsEmpty!37754))

(assert (= (and b!1027723 (not condMapEmpty!37754)) mapNonEmpty!37754))

(assert (= (and mapNonEmpty!37754 ((_ is ValueCellFull!11405) mapValue!37754)) b!1027725))

(assert (= (and b!1027723 ((_ is ValueCellFull!11405) mapDefault!37754)) b!1027724))

(assert (= b!1027719 b!1027723))

(assert (= start!89732 b!1027719))

(declare-fun m!946323 () Bool)

(assert (=> b!1027716 m!946323))

(declare-fun m!946325 () Bool)

(assert (=> b!1027719 m!946325))

(declare-fun m!946327 () Bool)

(assert (=> b!1027719 m!946327))

(declare-fun m!946329 () Bool)

(assert (=> b!1027721 m!946329))

(declare-fun m!946331 () Bool)

(assert (=> mapNonEmpty!37754 m!946331))

(declare-fun m!946333 () Bool)

(assert (=> b!1027717 m!946333))

(declare-fun m!946335 () Bool)

(assert (=> start!89732 m!946335))

(declare-fun m!946337 () Bool)

(assert (=> b!1027722 m!946337))

(declare-fun m!946339 () Bool)

(assert (=> b!1027722 m!946339))

(declare-fun m!946341 () Bool)

(assert (=> b!1027722 m!946341))

(declare-fun m!946343 () Bool)

(assert (=> b!1027722 m!946343))

(declare-fun m!946345 () Bool)

(assert (=> b!1027722 m!946345))

(declare-fun m!946347 () Bool)

(assert (=> b!1027722 m!946347))

(declare-fun m!946349 () Bool)

(assert (=> b!1027722 m!946349))

(declare-fun m!946351 () Bool)

(assert (=> b!1027722 m!946351))

(declare-fun m!946353 () Bool)

(assert (=> b!1027722 m!946353))

(declare-fun m!946355 () Bool)

(assert (=> b!1027722 m!946355))

(declare-fun m!946357 () Bool)

(assert (=> b!1027722 m!946357))

(check-sat (not b_next!20497) b_and!32753 (not mapNonEmpty!37754) (not b!1027722) (not b!1027721) (not b!1027716) (not start!89732) (not b!1027717) (not b!1027719) tp_is_empty!24217)
(check-sat b_and!32753 (not b_next!20497))
