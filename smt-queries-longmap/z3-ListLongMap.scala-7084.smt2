; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89792 () Bool)

(assert start!89792)

(declare-fun b!1028622 () Bool)

(declare-fun b_free!20557 () Bool)

(declare-fun b_next!20557 () Bool)

(assert (=> b!1028622 (= b_free!20557 (not b_next!20557))))

(declare-fun tp!72717 () Bool)

(declare-fun b_and!32813 () Bool)

(assert (=> b!1028622 (= tp!72717 b_and!32813)))

(declare-fun b!1028616 () Bool)

(declare-fun e!580578 () Bool)

(declare-fun tp_is_empty!24277 () Bool)

(assert (=> b!1028616 (= e!580578 tp_is_empty!24277)))

(declare-fun b!1028617 () Bool)

(declare-fun res!688132 () Bool)

(declare-fun e!580585 () Bool)

(assert (=> b!1028617 (=> (not res!688132) (not e!580585))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1028617 (= res!688132 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1028618 () Bool)

(declare-fun e!580584 () Bool)

(assert (=> b!1028618 (= e!580584 true)))

(declare-fun lt!452679 () Bool)

(declare-datatypes ((V!37243 0))(
  ( (V!37244 (val!12189 Int)) )
))
(declare-datatypes ((ValueCell!11435 0))(
  ( (ValueCellFull!11435 (v!14754 V!37243)) (EmptyCell!11435) )
))
(declare-datatypes ((array!64653 0))(
  ( (array!64654 (arr!31129 (Array (_ BitVec 32) (_ BitVec 64))) (size!31643 (_ BitVec 32))) )
))
(declare-datatypes ((array!64655 0))(
  ( (array!64656 (arr!31130 (Array (_ BitVec 32) ValueCell!11435)) (size!31644 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5464 0))(
  ( (LongMapFixedSize!5465 (defaultEntry!6084 Int) (mask!29858 (_ BitVec 32)) (extraKeys!5816 (_ BitVec 32)) (zeroValue!5920 V!37243) (minValue!5920 V!37243) (_size!2787 (_ BitVec 32)) (_keys!11269 array!64653) (_values!6107 array!64655) (_vacant!2787 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5464)

(declare-datatypes ((List!21787 0))(
  ( (Nil!21784) (Cons!21783 (h!22990 (_ BitVec 64)) (t!30841 List!21787)) )
))
(declare-fun arrayNoDuplicates!0 (array!64653 (_ BitVec 32) List!21787) Bool)

(assert (=> b!1028618 (= lt!452679 (arrayNoDuplicates!0 (_keys!11269 thiss!1427) #b00000000000000000000000000000000 Nil!21784))))

(declare-fun res!688135 () Bool)

(assert (=> start!89792 (=> (not res!688135) (not e!580585))))

(declare-fun valid!2078 (LongMapFixedSize!5464) Bool)

(assert (=> start!89792 (= res!688135 (valid!2078 thiss!1427))))

(assert (=> start!89792 e!580585))

(declare-fun e!580579 () Bool)

(assert (=> start!89792 e!580579))

(assert (=> start!89792 true))

(declare-fun mapIsEmpty!37844 () Bool)

(declare-fun mapRes!37844 () Bool)

(assert (=> mapIsEmpty!37844 mapRes!37844))

(declare-fun mapNonEmpty!37844 () Bool)

(declare-fun tp!72716 () Bool)

(declare-fun e!580581 () Bool)

(assert (=> mapNonEmpty!37844 (= mapRes!37844 (and tp!72716 e!580581))))

(declare-fun mapValue!37844 () ValueCell!11435)

(declare-fun mapKey!37844 () (_ BitVec 32))

(declare-fun mapRest!37844 () (Array (_ BitVec 32) ValueCell!11435))

(assert (=> mapNonEmpty!37844 (= (arr!31130 (_values!6107 thiss!1427)) (store mapRest!37844 mapKey!37844 mapValue!37844))))

(declare-fun b!1028619 () Bool)

(declare-fun res!688131 () Bool)

(assert (=> b!1028619 (=> res!688131 e!580584)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64653 (_ BitVec 32)) Bool)

(assert (=> b!1028619 (= res!688131 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11269 thiss!1427) (mask!29858 thiss!1427))))))

(declare-fun b!1028620 () Bool)

(assert (=> b!1028620 (= e!580581 tp_is_empty!24277)))

(declare-fun b!1028621 () Bool)

(declare-fun e!580580 () Bool)

(assert (=> b!1028621 (= e!580580 (not e!580584))))

(declare-fun res!688136 () Bool)

(assert (=> b!1028621 (=> res!688136 e!580584)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028621 (= res!688136 (not (validMask!0 (mask!29858 thiss!1427))))))

(declare-fun lt!452676 () array!64653)

(declare-fun arrayContainsKey!0 (array!64653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028621 (not (arrayContainsKey!0 lt!452676 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9623 0))(
  ( (MissingZero!9623 (index!40863 (_ BitVec 32))) (Found!9623 (index!40864 (_ BitVec 32))) (Intermediate!9623 (undefined!10435 Bool) (index!40865 (_ BitVec 32)) (x!91387 (_ BitVec 32))) (Undefined!9623) (MissingVacant!9623 (index!40866 (_ BitVec 32))) )
))
(declare-fun lt!452677 () SeekEntryResult!9623)

(declare-datatypes ((Unit!33484 0))(
  ( (Unit!33485) )
))
(declare-fun lt!452675 () Unit!33484)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64653 (_ BitVec 32) (_ BitVec 64)) Unit!33484)

(assert (=> b!1028621 (= lt!452675 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11269 thiss!1427) (index!40864 lt!452677) key!909))))

(assert (=> b!1028621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452676 (mask!29858 thiss!1427))))

(declare-fun lt!452678 () Unit!33484)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64653 (_ BitVec 32) (_ BitVec 32)) Unit!33484)

(assert (=> b!1028621 (= lt!452678 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11269 thiss!1427) (index!40864 lt!452677) (mask!29858 thiss!1427)))))

(assert (=> b!1028621 (arrayNoDuplicates!0 lt!452676 #b00000000000000000000000000000000 Nil!21784)))

(declare-fun lt!452680 () Unit!33484)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64653 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21787) Unit!33484)

(assert (=> b!1028621 (= lt!452680 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11269 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40864 lt!452677) #b00000000000000000000000000000000 Nil!21784))))

(declare-fun arrayCountValidKeys!0 (array!64653 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028621 (= (arrayCountValidKeys!0 lt!452676 #b00000000000000000000000000000000 (size!31643 (_keys!11269 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11269 thiss!1427) #b00000000000000000000000000000000 (size!31643 (_keys!11269 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028621 (= lt!452676 (array!64654 (store (arr!31129 (_keys!11269 thiss!1427)) (index!40864 lt!452677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31643 (_keys!11269 thiss!1427))))))

(declare-fun lt!452681 () Unit!33484)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64653 (_ BitVec 32) (_ BitVec 64)) Unit!33484)

(assert (=> b!1028621 (= lt!452681 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11269 thiss!1427) (index!40864 lt!452677) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580582 () Bool)

(declare-fun array_inv!24113 (array!64653) Bool)

(declare-fun array_inv!24114 (array!64655) Bool)

(assert (=> b!1028622 (= e!580579 (and tp!72717 tp_is_empty!24277 (array_inv!24113 (_keys!11269 thiss!1427)) (array_inv!24114 (_values!6107 thiss!1427)) e!580582))))

(declare-fun b!1028623 () Bool)

(assert (=> b!1028623 (= e!580585 e!580580)))

(declare-fun res!688133 () Bool)

(assert (=> b!1028623 (=> (not res!688133) (not e!580580))))

(get-info :version)

(assert (=> b!1028623 (= res!688133 ((_ is Found!9623) lt!452677))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64653 (_ BitVec 32)) SeekEntryResult!9623)

(assert (=> b!1028623 (= lt!452677 (seekEntry!0 key!909 (_keys!11269 thiss!1427) (mask!29858 thiss!1427)))))

(declare-fun b!1028624 () Bool)

(assert (=> b!1028624 (= e!580582 (and e!580578 mapRes!37844))))

(declare-fun condMapEmpty!37844 () Bool)

(declare-fun mapDefault!37844 () ValueCell!11435)

(assert (=> b!1028624 (= condMapEmpty!37844 (= (arr!31130 (_values!6107 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11435)) mapDefault!37844)))))

(declare-fun b!1028625 () Bool)

(declare-fun res!688134 () Bool)

(assert (=> b!1028625 (=> res!688134 e!580584)))

(assert (=> b!1028625 (= res!688134 (or (not (= (size!31644 (_values!6107 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29858 thiss!1427)))) (not (= (size!31643 (_keys!11269 thiss!1427)) (size!31644 (_values!6107 thiss!1427)))) (bvslt (mask!29858 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5816 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5816 thiss!1427) #b00000000000000000000000000000011)))))

(assert (= (and start!89792 res!688135) b!1028617))

(assert (= (and b!1028617 res!688132) b!1028623))

(assert (= (and b!1028623 res!688133) b!1028621))

(assert (= (and b!1028621 (not res!688136)) b!1028625))

(assert (= (and b!1028625 (not res!688134)) b!1028619))

(assert (= (and b!1028619 (not res!688131)) b!1028618))

(assert (= (and b!1028624 condMapEmpty!37844) mapIsEmpty!37844))

(assert (= (and b!1028624 (not condMapEmpty!37844)) mapNonEmpty!37844))

(assert (= (and mapNonEmpty!37844 ((_ is ValueCellFull!11435) mapValue!37844)) b!1028620))

(assert (= (and b!1028624 ((_ is ValueCellFull!11435) mapDefault!37844)) b!1028616))

(assert (= b!1028622 b!1028624))

(assert (= start!89792 b!1028622))

(declare-fun m!947403 () Bool)

(assert (=> b!1028618 m!947403))

(declare-fun m!947405 () Bool)

(assert (=> start!89792 m!947405))

(declare-fun m!947407 () Bool)

(assert (=> mapNonEmpty!37844 m!947407))

(declare-fun m!947409 () Bool)

(assert (=> b!1028621 m!947409))

(declare-fun m!947411 () Bool)

(assert (=> b!1028621 m!947411))

(declare-fun m!947413 () Bool)

(assert (=> b!1028621 m!947413))

(declare-fun m!947415 () Bool)

(assert (=> b!1028621 m!947415))

(declare-fun m!947417 () Bool)

(assert (=> b!1028621 m!947417))

(declare-fun m!947419 () Bool)

(assert (=> b!1028621 m!947419))

(declare-fun m!947421 () Bool)

(assert (=> b!1028621 m!947421))

(declare-fun m!947423 () Bool)

(assert (=> b!1028621 m!947423))

(declare-fun m!947425 () Bool)

(assert (=> b!1028621 m!947425))

(declare-fun m!947427 () Bool)

(assert (=> b!1028621 m!947427))

(declare-fun m!947429 () Bool)

(assert (=> b!1028621 m!947429))

(declare-fun m!947431 () Bool)

(assert (=> b!1028622 m!947431))

(declare-fun m!947433 () Bool)

(assert (=> b!1028622 m!947433))

(declare-fun m!947435 () Bool)

(assert (=> b!1028623 m!947435))

(declare-fun m!947437 () Bool)

(assert (=> b!1028619 m!947437))

(check-sat (not b!1028619) (not b_next!20557) (not start!89792) (not b!1028622) (not b!1028621) tp_is_empty!24277 (not mapNonEmpty!37844) b_and!32813 (not b!1028618) (not b!1028623))
(check-sat b_and!32813 (not b_next!20557))
