; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89526 () Bool)

(assert start!89526)

(declare-fun b!1026706 () Bool)

(declare-fun b_free!20527 () Bool)

(declare-fun b_next!20527 () Bool)

(assert (=> b!1026706 (= b_free!20527 (not b_next!20527))))

(declare-fun tp!72627 () Bool)

(declare-fun b_and!32747 () Bool)

(assert (=> b!1026706 (= tp!72627 b_and!32747)))

(declare-fun res!687285 () Bool)

(declare-fun e!579287 () Bool)

(assert (=> start!89526 (=> (not res!687285) (not e!579287))))

(declare-datatypes ((V!37203 0))(
  ( (V!37204 (val!12174 Int)) )
))
(declare-datatypes ((ValueCell!11420 0))(
  ( (ValueCellFull!11420 (v!14742 V!37203)) (EmptyCell!11420) )
))
(declare-datatypes ((array!64483 0))(
  ( (array!64484 (arr!31050 (Array (_ BitVec 32) (_ BitVec 64))) (size!31565 (_ BitVec 32))) )
))
(declare-datatypes ((array!64485 0))(
  ( (array!64486 (arr!31051 (Array (_ BitVec 32) ValueCell!11420)) (size!31566 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5434 0))(
  ( (LongMapFixedSize!5435 (defaultEntry!6069 Int) (mask!29768 (_ BitVec 32)) (extraKeys!5801 (_ BitVec 32)) (zeroValue!5905 V!37203) (minValue!5905 V!37203) (_size!2772 (_ BitVec 32)) (_keys!11212 array!64483) (_values!6092 array!64485) (_vacant!2772 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5434)

(declare-fun valid!2055 (LongMapFixedSize!5434) Bool)

(assert (=> start!89526 (= res!687285 (valid!2055 thiss!1427))))

(assert (=> start!89526 e!579287))

(declare-fun e!579286 () Bool)

(assert (=> start!89526 e!579286))

(assert (=> start!89526 true))

(declare-fun b!1026700 () Bool)

(declare-fun e!579291 () Bool)

(assert (=> b!1026700 (= e!579291 true)))

(declare-fun lt!451651 () Bool)

(declare-datatypes ((List!21824 0))(
  ( (Nil!21821) (Cons!21820 (h!23018 (_ BitVec 64)) (t!30877 List!21824)) )
))
(declare-fun arrayNoDuplicates!0 (array!64483 (_ BitVec 32) List!21824) Bool)

(assert (=> b!1026700 (= lt!451651 (arrayNoDuplicates!0 (_keys!11212 thiss!1427) #b00000000000000000000000000000000 Nil!21821))))

(declare-fun b!1026701 () Bool)

(declare-fun res!687287 () Bool)

(assert (=> b!1026701 (=> (not res!687287) (not e!579287))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026701 (= res!687287 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026702 () Bool)

(declare-fun e!579289 () Bool)

(declare-fun e!579284 () Bool)

(declare-fun mapRes!37799 () Bool)

(assert (=> b!1026702 (= e!579289 (and e!579284 mapRes!37799))))

(declare-fun condMapEmpty!37799 () Bool)

(declare-fun mapDefault!37799 () ValueCell!11420)

(assert (=> b!1026702 (= condMapEmpty!37799 (= (arr!31051 (_values!6092 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11420)) mapDefault!37799)))))

(declare-fun b!1026703 () Bool)

(declare-fun e!579288 () Bool)

(declare-fun tp_is_empty!24247 () Bool)

(assert (=> b!1026703 (= e!579288 tp_is_empty!24247)))

(declare-fun b!1026704 () Bool)

(declare-fun res!687284 () Bool)

(assert (=> b!1026704 (=> res!687284 e!579291)))

(assert (=> b!1026704 (= res!687284 (or (not (= (size!31566 (_values!6092 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29768 thiss!1427)))) (not (= (size!31565 (_keys!11212 thiss!1427)) (size!31566 (_values!6092 thiss!1427)))) (bvslt (mask!29768 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5801 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5801 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026705 () Bool)

(declare-fun res!687286 () Bool)

(assert (=> b!1026705 (=> res!687286 e!579291)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64483 (_ BitVec 32)) Bool)

(assert (=> b!1026705 (= res!687286 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11212 thiss!1427) (mask!29768 thiss!1427))))))

(declare-fun array_inv!24051 (array!64483) Bool)

(declare-fun array_inv!24052 (array!64485) Bool)

(assert (=> b!1026706 (= e!579286 (and tp!72627 tp_is_empty!24247 (array_inv!24051 (_keys!11212 thiss!1427)) (array_inv!24052 (_values!6092 thiss!1427)) e!579289))))

(declare-fun b!1026707 () Bool)

(assert (=> b!1026707 (= e!579284 tp_is_empty!24247)))

(declare-fun b!1026708 () Bool)

(declare-fun e!579285 () Bool)

(assert (=> b!1026708 (= e!579285 (not e!579291))))

(declare-fun res!687288 () Bool)

(assert (=> b!1026708 (=> res!687288 e!579291)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026708 (= res!687288 (not (validMask!0 (mask!29768 thiss!1427))))))

(declare-fun lt!451646 () array!64483)

(declare-fun arrayContainsKey!0 (array!64483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026708 (not (arrayContainsKey!0 lt!451646 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9650 0))(
  ( (MissingZero!9650 (index!40971 (_ BitVec 32))) (Found!9650 (index!40972 (_ BitVec 32))) (Intermediate!9650 (undefined!10462 Bool) (index!40973 (_ BitVec 32)) (x!91349 (_ BitVec 32))) (Undefined!9650) (MissingVacant!9650 (index!40974 (_ BitVec 32))) )
))
(declare-fun lt!451645 () SeekEntryResult!9650)

(declare-datatypes ((Unit!33349 0))(
  ( (Unit!33350) )
))
(declare-fun lt!451648 () Unit!33349)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64483 (_ BitVec 32) (_ BitVec 64)) Unit!33349)

(assert (=> b!1026708 (= lt!451648 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11212 thiss!1427) (index!40972 lt!451645) key!909))))

(assert (=> b!1026708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451646 (mask!29768 thiss!1427))))

(declare-fun lt!451649 () Unit!33349)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64483 (_ BitVec 32) (_ BitVec 32)) Unit!33349)

(assert (=> b!1026708 (= lt!451649 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11212 thiss!1427) (index!40972 lt!451645) (mask!29768 thiss!1427)))))

(assert (=> b!1026708 (arrayNoDuplicates!0 lt!451646 #b00000000000000000000000000000000 Nil!21821)))

(declare-fun lt!451647 () Unit!33349)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64483 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21824) Unit!33349)

(assert (=> b!1026708 (= lt!451647 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11212 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40972 lt!451645) #b00000000000000000000000000000000 Nil!21821))))

(declare-fun arrayCountValidKeys!0 (array!64483 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026708 (= (arrayCountValidKeys!0 lt!451646 #b00000000000000000000000000000000 (size!31565 (_keys!11212 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11212 thiss!1427) #b00000000000000000000000000000000 (size!31565 (_keys!11212 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026708 (= lt!451646 (array!64484 (store (arr!31050 (_keys!11212 thiss!1427)) (index!40972 lt!451645) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31565 (_keys!11212 thiss!1427))))))

(declare-fun lt!451650 () Unit!33349)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64483 (_ BitVec 32) (_ BitVec 64)) Unit!33349)

(assert (=> b!1026708 (= lt!451650 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11212 thiss!1427) (index!40972 lt!451645) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37799 () Bool)

(assert (=> mapIsEmpty!37799 mapRes!37799))

(declare-fun b!1026709 () Bool)

(assert (=> b!1026709 (= e!579287 e!579285)))

(declare-fun res!687289 () Bool)

(assert (=> b!1026709 (=> (not res!687289) (not e!579285))))

(get-info :version)

(assert (=> b!1026709 (= res!687289 ((_ is Found!9650) lt!451645))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64483 (_ BitVec 32)) SeekEntryResult!9650)

(assert (=> b!1026709 (= lt!451645 (seekEntry!0 key!909 (_keys!11212 thiss!1427) (mask!29768 thiss!1427)))))

(declare-fun mapNonEmpty!37799 () Bool)

(declare-fun tp!72626 () Bool)

(assert (=> mapNonEmpty!37799 (= mapRes!37799 (and tp!72626 e!579288))))

(declare-fun mapKey!37799 () (_ BitVec 32))

(declare-fun mapValue!37799 () ValueCell!11420)

(declare-fun mapRest!37799 () (Array (_ BitVec 32) ValueCell!11420))

(assert (=> mapNonEmpty!37799 (= (arr!31051 (_values!6092 thiss!1427)) (store mapRest!37799 mapKey!37799 mapValue!37799))))

(assert (= (and start!89526 res!687285) b!1026701))

(assert (= (and b!1026701 res!687287) b!1026709))

(assert (= (and b!1026709 res!687289) b!1026708))

(assert (= (and b!1026708 (not res!687288)) b!1026704))

(assert (= (and b!1026704 (not res!687284)) b!1026705))

(assert (= (and b!1026705 (not res!687286)) b!1026700))

(assert (= (and b!1026702 condMapEmpty!37799) mapIsEmpty!37799))

(assert (= (and b!1026702 (not condMapEmpty!37799)) mapNonEmpty!37799))

(assert (= (and mapNonEmpty!37799 ((_ is ValueCellFull!11420) mapValue!37799)) b!1026703))

(assert (= (and b!1026702 ((_ is ValueCellFull!11420) mapDefault!37799)) b!1026707))

(assert (= b!1026706 b!1026702))

(assert (= start!89526 b!1026706))

(declare-fun m!944579 () Bool)

(assert (=> mapNonEmpty!37799 m!944579))

(declare-fun m!944581 () Bool)

(assert (=> b!1026709 m!944581))

(declare-fun m!944583 () Bool)

(assert (=> b!1026708 m!944583))

(declare-fun m!944585 () Bool)

(assert (=> b!1026708 m!944585))

(declare-fun m!944587 () Bool)

(assert (=> b!1026708 m!944587))

(declare-fun m!944589 () Bool)

(assert (=> b!1026708 m!944589))

(declare-fun m!944591 () Bool)

(assert (=> b!1026708 m!944591))

(declare-fun m!944593 () Bool)

(assert (=> b!1026708 m!944593))

(declare-fun m!944595 () Bool)

(assert (=> b!1026708 m!944595))

(declare-fun m!944597 () Bool)

(assert (=> b!1026708 m!944597))

(declare-fun m!944599 () Bool)

(assert (=> b!1026708 m!944599))

(declare-fun m!944601 () Bool)

(assert (=> b!1026708 m!944601))

(declare-fun m!944603 () Bool)

(assert (=> b!1026708 m!944603))

(declare-fun m!944605 () Bool)

(assert (=> b!1026700 m!944605))

(declare-fun m!944607 () Bool)

(assert (=> b!1026706 m!944607))

(declare-fun m!944609 () Bool)

(assert (=> b!1026706 m!944609))

(declare-fun m!944611 () Bool)

(assert (=> b!1026705 m!944611))

(declare-fun m!944613 () Bool)

(assert (=> start!89526 m!944613))

(check-sat (not b!1026706) (not mapNonEmpty!37799) (not b!1026700) (not b!1026709) (not b!1026705) (not b_next!20527) b_and!32747 (not b!1026708) tp_is_empty!24247 (not start!89526))
(check-sat b_and!32747 (not b_next!20527))
