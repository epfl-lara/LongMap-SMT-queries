; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89506 () Bool)

(assert start!89506)

(declare-fun b!1026523 () Bool)

(declare-fun b_free!20505 () Bool)

(declare-fun b_next!20505 () Bool)

(assert (=> b!1026523 (= b_free!20505 (not b_next!20505))))

(declare-fun tp!72560 () Bool)

(declare-fun b_and!32751 () Bool)

(assert (=> b!1026523 (= tp!72560 b_and!32751)))

(declare-fun b!1026521 () Bool)

(declare-fun e!579116 () Bool)

(declare-fun e!579111 () Bool)

(declare-fun mapRes!37766 () Bool)

(assert (=> b!1026521 (= e!579116 (and e!579111 mapRes!37766))))

(declare-fun condMapEmpty!37766 () Bool)

(declare-datatypes ((V!37173 0))(
  ( (V!37174 (val!12163 Int)) )
))
(declare-datatypes ((ValueCell!11409 0))(
  ( (ValueCellFull!11409 (v!14732 V!37173)) (EmptyCell!11409) )
))
(declare-datatypes ((array!64500 0))(
  ( (array!64501 (arr!31059 (Array (_ BitVec 32) (_ BitVec 64))) (size!31572 (_ BitVec 32))) )
))
(declare-datatypes ((array!64502 0))(
  ( (array!64503 (arr!31060 (Array (_ BitVec 32) ValueCell!11409)) (size!31573 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5412 0))(
  ( (LongMapFixedSize!5413 (defaultEntry!6058 Int) (mask!29754 (_ BitVec 32)) (extraKeys!5790 (_ BitVec 32)) (zeroValue!5894 V!37173) (minValue!5894 V!37173) (_size!2761 (_ BitVec 32)) (_keys!11205 array!64500) (_values!6081 array!64502) (_vacant!2761 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5412)

(declare-fun mapDefault!37766 () ValueCell!11409)

(assert (=> b!1026521 (= condMapEmpty!37766 (= (arr!31060 (_values!6081 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11409)) mapDefault!37766)))))

(declare-fun b!1026522 () Bool)

(declare-fun e!579117 () Bool)

(declare-fun e!579113 () Bool)

(assert (=> b!1026522 (= e!579117 (not e!579113))))

(declare-fun res!687158 () Bool)

(assert (=> b!1026522 (=> res!687158 e!579113)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026522 (= res!687158 (not (validMask!0 (mask!29754 thiss!1427))))))

(declare-fun lt!451619 () array!64500)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026522 (not (arrayContainsKey!0 lt!451619 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33441 0))(
  ( (Unit!33442) )
))
(declare-fun lt!451620 () Unit!33441)

(declare-datatypes ((SeekEntryResult!9649 0))(
  ( (MissingZero!9649 (index!40967 (_ BitVec 32))) (Found!9649 (index!40968 (_ BitVec 32))) (Intermediate!9649 (undefined!10461 Bool) (index!40969 (_ BitVec 32)) (x!91319 (_ BitVec 32))) (Undefined!9649) (MissingVacant!9649 (index!40970 (_ BitVec 32))) )
))
(declare-fun lt!451614 () SeekEntryResult!9649)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64500 (_ BitVec 32) (_ BitVec 64)) Unit!33441)

(assert (=> b!1026522 (= lt!451620 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11205 thiss!1427) (index!40968 lt!451614) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64500 (_ BitVec 32)) Bool)

(assert (=> b!1026522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451619 (mask!29754 thiss!1427))))

(declare-fun lt!451618 () Unit!33441)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64500 (_ BitVec 32) (_ BitVec 32)) Unit!33441)

(assert (=> b!1026522 (= lt!451618 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11205 thiss!1427) (index!40968 lt!451614) (mask!29754 thiss!1427)))))

(declare-datatypes ((List!21783 0))(
  ( (Nil!21780) (Cons!21779 (h!22977 (_ BitVec 64)) (t!30845 List!21783)) )
))
(declare-fun arrayNoDuplicates!0 (array!64500 (_ BitVec 32) List!21783) Bool)

(assert (=> b!1026522 (arrayNoDuplicates!0 lt!451619 #b00000000000000000000000000000000 Nil!21780)))

(declare-fun lt!451617 () Unit!33441)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64500 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21783) Unit!33441)

(assert (=> b!1026522 (= lt!451617 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11205 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40968 lt!451614) #b00000000000000000000000000000000 Nil!21780))))

(declare-fun arrayCountValidKeys!0 (array!64500 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026522 (= (arrayCountValidKeys!0 lt!451619 #b00000000000000000000000000000000 (size!31572 (_keys!11205 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11205 thiss!1427) #b00000000000000000000000000000000 (size!31572 (_keys!11205 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026522 (= lt!451619 (array!64501 (store (arr!31059 (_keys!11205 thiss!1427)) (index!40968 lt!451614) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31572 (_keys!11205 thiss!1427))))))

(declare-fun lt!451616 () Unit!33441)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64500 (_ BitVec 32) (_ BitVec 64)) Unit!33441)

(assert (=> b!1026522 (= lt!451616 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11205 thiss!1427) (index!40968 lt!451614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!579115 () Bool)

(declare-fun tp_is_empty!24225 () Bool)

(declare-fun array_inv!24049 (array!64500) Bool)

(declare-fun array_inv!24050 (array!64502) Bool)

(assert (=> b!1026523 (= e!579115 (and tp!72560 tp_is_empty!24225 (array_inv!24049 (_keys!11205 thiss!1427)) (array_inv!24050 (_values!6081 thiss!1427)) e!579116))))

(declare-fun mapIsEmpty!37766 () Bool)

(assert (=> mapIsEmpty!37766 mapRes!37766))

(declare-fun b!1026525 () Bool)

(declare-fun res!687154 () Bool)

(declare-fun e!579118 () Bool)

(assert (=> b!1026525 (=> (not res!687154) (not e!579118))))

(assert (=> b!1026525 (= res!687154 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026526 () Bool)

(assert (=> b!1026526 (= e!579113 true)))

(declare-fun lt!451615 () Bool)

(assert (=> b!1026526 (= lt!451615 (arrayNoDuplicates!0 (_keys!11205 thiss!1427) #b00000000000000000000000000000000 Nil!21780))))

(declare-fun b!1026527 () Bool)

(assert (=> b!1026527 (= e!579118 e!579117)))

(declare-fun res!687156 () Bool)

(assert (=> b!1026527 (=> (not res!687156) (not e!579117))))

(get-info :version)

(assert (=> b!1026527 (= res!687156 ((_ is Found!9649) lt!451614))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64500 (_ BitVec 32)) SeekEntryResult!9649)

(assert (=> b!1026527 (= lt!451614 (seekEntry!0 key!909 (_keys!11205 thiss!1427) (mask!29754 thiss!1427)))))

(declare-fun mapNonEmpty!37766 () Bool)

(declare-fun tp!72561 () Bool)

(declare-fun e!579114 () Bool)

(assert (=> mapNonEmpty!37766 (= mapRes!37766 (and tp!72561 e!579114))))

(declare-fun mapValue!37766 () ValueCell!11409)

(declare-fun mapRest!37766 () (Array (_ BitVec 32) ValueCell!11409))

(declare-fun mapKey!37766 () (_ BitVec 32))

(assert (=> mapNonEmpty!37766 (= (arr!31060 (_values!6081 thiss!1427)) (store mapRest!37766 mapKey!37766 mapValue!37766))))

(declare-fun b!1026528 () Bool)

(assert (=> b!1026528 (= e!579111 tp_is_empty!24225)))

(declare-fun res!687157 () Bool)

(assert (=> start!89506 (=> (not res!687157) (not e!579118))))

(declare-fun valid!2055 (LongMapFixedSize!5412) Bool)

(assert (=> start!89506 (= res!687157 (valid!2055 thiss!1427))))

(assert (=> start!89506 e!579118))

(assert (=> start!89506 e!579115))

(assert (=> start!89506 true))

(declare-fun b!1026524 () Bool)

(declare-fun res!687153 () Bool)

(assert (=> b!1026524 (=> res!687153 e!579113)))

(assert (=> b!1026524 (= res!687153 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11205 thiss!1427) (mask!29754 thiss!1427))))))

(declare-fun b!1026529 () Bool)

(assert (=> b!1026529 (= e!579114 tp_is_empty!24225)))

(declare-fun b!1026530 () Bool)

(declare-fun res!687155 () Bool)

(assert (=> b!1026530 (=> res!687155 e!579113)))

(assert (=> b!1026530 (= res!687155 (or (not (= (size!31573 (_values!6081 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29754 thiss!1427)))) (not (= (size!31572 (_keys!11205 thiss!1427)) (size!31573 (_values!6081 thiss!1427)))) (bvslt (mask!29754 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5790 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5790 thiss!1427) #b00000000000000000000000000000011)))))

(assert (= (and start!89506 res!687157) b!1026525))

(assert (= (and b!1026525 res!687154) b!1026527))

(assert (= (and b!1026527 res!687156) b!1026522))

(assert (= (and b!1026522 (not res!687158)) b!1026530))

(assert (= (and b!1026530 (not res!687155)) b!1026524))

(assert (= (and b!1026524 (not res!687153)) b!1026526))

(assert (= (and b!1026521 condMapEmpty!37766) mapIsEmpty!37766))

(assert (= (and b!1026521 (not condMapEmpty!37766)) mapNonEmpty!37766))

(assert (= (and mapNonEmpty!37766 ((_ is ValueCellFull!11409) mapValue!37766)) b!1026529))

(assert (= (and b!1026521 ((_ is ValueCellFull!11409) mapDefault!37766)) b!1026528))

(assert (= b!1026523 b!1026521))

(assert (= start!89506 b!1026523))

(declare-fun m!944803 () Bool)

(assert (=> b!1026524 m!944803))

(declare-fun m!944805 () Bool)

(assert (=> b!1026527 m!944805))

(declare-fun m!944807 () Bool)

(assert (=> start!89506 m!944807))

(declare-fun m!944809 () Bool)

(assert (=> b!1026523 m!944809))

(declare-fun m!944811 () Bool)

(assert (=> b!1026523 m!944811))

(declare-fun m!944813 () Bool)

(assert (=> b!1026526 m!944813))

(declare-fun m!944815 () Bool)

(assert (=> mapNonEmpty!37766 m!944815))

(declare-fun m!944817 () Bool)

(assert (=> b!1026522 m!944817))

(declare-fun m!944819 () Bool)

(assert (=> b!1026522 m!944819))

(declare-fun m!944821 () Bool)

(assert (=> b!1026522 m!944821))

(declare-fun m!944823 () Bool)

(assert (=> b!1026522 m!944823))

(declare-fun m!944825 () Bool)

(assert (=> b!1026522 m!944825))

(declare-fun m!944827 () Bool)

(assert (=> b!1026522 m!944827))

(declare-fun m!944829 () Bool)

(assert (=> b!1026522 m!944829))

(declare-fun m!944831 () Bool)

(assert (=> b!1026522 m!944831))

(declare-fun m!944833 () Bool)

(assert (=> b!1026522 m!944833))

(declare-fun m!944835 () Bool)

(assert (=> b!1026522 m!944835))

(declare-fun m!944837 () Bool)

(assert (=> b!1026522 m!944837))

(check-sat (not b_next!20505) b_and!32751 (not b!1026526) (not b!1026524) (not mapNonEmpty!37766) tp_is_empty!24225 (not b!1026527) (not b!1026523) (not start!89506) (not b!1026522))
(check-sat b_and!32751 (not b_next!20505))
