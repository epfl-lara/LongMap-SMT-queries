; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89454 () Bool)

(assert start!89454)

(declare-fun b!1025730 () Bool)

(declare-fun b_free!20455 () Bool)

(declare-fun b_next!20455 () Bool)

(assert (=> b!1025730 (= b_free!20455 (not b_next!20455))))

(declare-fun tp!72410 () Bool)

(declare-fun b_and!32675 () Bool)

(assert (=> b!1025730 (= tp!72410 b_and!32675)))

(declare-fun b!1025724 () Bool)

(declare-fun e!578426 () Bool)

(declare-fun tp_is_empty!24175 () Bool)

(assert (=> b!1025724 (= e!578426 tp_is_empty!24175)))

(declare-fun b!1025725 () Bool)

(declare-fun e!578425 () Bool)

(declare-fun e!578421 () Bool)

(assert (=> b!1025725 (= e!578425 (not e!578421))))

(declare-fun res!686741 () Bool)

(assert (=> b!1025725 (=> res!686741 e!578421)))

(declare-datatypes ((SeekEntryResult!9626 0))(
  ( (MissingZero!9626 (index!40875 (_ BitVec 32))) (Found!9626 (index!40876 (_ BitVec 32))) (Intermediate!9626 (undefined!10438 Bool) (index!40877 (_ BitVec 32)) (x!91229 (_ BitVec 32))) (Undefined!9626) (MissingVacant!9626 (index!40878 (_ BitVec 32))) )
))
(declare-fun lt!450942 () SeekEntryResult!9626)

(declare-datatypes ((V!37107 0))(
  ( (V!37108 (val!12138 Int)) )
))
(declare-datatypes ((ValueCell!11384 0))(
  ( (ValueCellFull!11384 (v!14706 V!37107)) (EmptyCell!11384) )
))
(declare-datatypes ((array!64339 0))(
  ( (array!64340 (arr!30978 (Array (_ BitVec 32) (_ BitVec 64))) (size!31493 (_ BitVec 32))) )
))
(declare-datatypes ((array!64341 0))(
  ( (array!64342 (arr!30979 (Array (_ BitVec 32) ValueCell!11384)) (size!31494 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5362 0))(
  ( (LongMapFixedSize!5363 (defaultEntry!6033 Int) (mask!29708 (_ BitVec 32)) (extraKeys!5765 (_ BitVec 32)) (zeroValue!5869 V!37107) (minValue!5869 V!37107) (_size!2736 (_ BitVec 32)) (_keys!11176 array!64339) (_values!6056 array!64341) (_vacant!2736 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5362)

(assert (=> b!1025725 (= res!686741 (or (bvslt (index!40876 lt!450942) #b00000000000000000000000000000000) (bvsge (index!40876 lt!450942) (size!31493 (_keys!11176 thiss!1427))) (bvsge (size!31493 (_keys!11176 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!450944 () array!64339)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64339 (_ BitVec 32)) Bool)

(assert (=> b!1025725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!450944 (mask!29708 thiss!1427))))

(declare-datatypes ((Unit!33309 0))(
  ( (Unit!33310) )
))
(declare-fun lt!450943 () Unit!33309)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64339 (_ BitVec 32) (_ BitVec 32)) Unit!33309)

(assert (=> b!1025725 (= lt!450943 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11176 thiss!1427) (index!40876 lt!450942) (mask!29708 thiss!1427)))))

(declare-datatypes ((List!21798 0))(
  ( (Nil!21795) (Cons!21794 (h!22992 (_ BitVec 64)) (t!30851 List!21798)) )
))
(declare-fun arrayNoDuplicates!0 (array!64339 (_ BitVec 32) List!21798) Bool)

(assert (=> b!1025725 (arrayNoDuplicates!0 lt!450944 #b00000000000000000000000000000000 Nil!21795)))

(declare-fun lt!450945 () Unit!33309)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64339 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21798) Unit!33309)

(assert (=> b!1025725 (= lt!450945 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11176 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40876 lt!450942) #b00000000000000000000000000000000 Nil!21795))))

(declare-fun arrayCountValidKeys!0 (array!64339 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025725 (= (arrayCountValidKeys!0 lt!450944 #b00000000000000000000000000000000 (size!31493 (_keys!11176 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11176 thiss!1427) #b00000000000000000000000000000000 (size!31493 (_keys!11176 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025725 (= lt!450944 (array!64340 (store (arr!30978 (_keys!11176 thiss!1427)) (index!40876 lt!450942) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31493 (_keys!11176 thiss!1427))))))

(declare-fun lt!450946 () Unit!33309)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64339 (_ BitVec 32) (_ BitVec 64)) Unit!33309)

(assert (=> b!1025725 (= lt!450946 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11176 thiss!1427) (index!40876 lt!450942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025726 () Bool)

(declare-fun res!686742 () Bool)

(declare-fun e!578423 () Bool)

(assert (=> b!1025726 (=> (not res!686742) (not e!578423))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025726 (= res!686742 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025727 () Bool)

(assert (=> b!1025727 (= e!578423 e!578425)))

(declare-fun res!686743 () Bool)

(assert (=> b!1025727 (=> (not res!686743) (not e!578425))))

(get-info :version)

(assert (=> b!1025727 (= res!686743 ((_ is Found!9626) lt!450942))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64339 (_ BitVec 32)) SeekEntryResult!9626)

(assert (=> b!1025727 (= lt!450942 (seekEntry!0 key!909 (_keys!11176 thiss!1427) (mask!29708 thiss!1427)))))

(declare-fun mapNonEmpty!37691 () Bool)

(declare-fun mapRes!37691 () Bool)

(declare-fun tp!72411 () Bool)

(declare-fun e!578420 () Bool)

(assert (=> mapNonEmpty!37691 (= mapRes!37691 (and tp!72411 e!578420))))

(declare-fun mapKey!37691 () (_ BitVec 32))

(declare-fun mapRest!37691 () (Array (_ BitVec 32) ValueCell!11384))

(declare-fun mapValue!37691 () ValueCell!11384)

(assert (=> mapNonEmpty!37691 (= (arr!30979 (_values!6056 thiss!1427)) (store mapRest!37691 mapKey!37691 mapValue!37691))))

(declare-fun b!1025728 () Bool)

(assert (=> b!1025728 (= e!578421 true)))

(declare-fun lt!450941 () Bool)

(assert (=> b!1025728 (= lt!450941 (arrayNoDuplicates!0 (_keys!11176 thiss!1427) #b00000000000000000000000000000000 Nil!21795))))

(declare-fun b!1025729 () Bool)

(declare-fun e!578424 () Bool)

(assert (=> b!1025729 (= e!578424 (and e!578426 mapRes!37691))))

(declare-fun condMapEmpty!37691 () Bool)

(declare-fun mapDefault!37691 () ValueCell!11384)

(assert (=> b!1025729 (= condMapEmpty!37691 (= (arr!30979 (_values!6056 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11384)) mapDefault!37691)))))

(declare-fun res!686740 () Bool)

(assert (=> start!89454 (=> (not res!686740) (not e!578423))))

(declare-fun valid!2032 (LongMapFixedSize!5362) Bool)

(assert (=> start!89454 (= res!686740 (valid!2032 thiss!1427))))

(assert (=> start!89454 e!578423))

(declare-fun e!578422 () Bool)

(assert (=> start!89454 e!578422))

(assert (=> start!89454 true))

(declare-fun array_inv!24003 (array!64339) Bool)

(declare-fun array_inv!24004 (array!64341) Bool)

(assert (=> b!1025730 (= e!578422 (and tp!72410 tp_is_empty!24175 (array_inv!24003 (_keys!11176 thiss!1427)) (array_inv!24004 (_values!6056 thiss!1427)) e!578424))))

(declare-fun b!1025731 () Bool)

(assert (=> b!1025731 (= e!578420 tp_is_empty!24175)))

(declare-fun mapIsEmpty!37691 () Bool)

(assert (=> mapIsEmpty!37691 mapRes!37691))

(assert (= (and start!89454 res!686740) b!1025726))

(assert (= (and b!1025726 res!686742) b!1025727))

(assert (= (and b!1025727 res!686743) b!1025725))

(assert (= (and b!1025725 (not res!686741)) b!1025728))

(assert (= (and b!1025729 condMapEmpty!37691) mapIsEmpty!37691))

(assert (= (and b!1025729 (not condMapEmpty!37691)) mapNonEmpty!37691))

(assert (= (and mapNonEmpty!37691 ((_ is ValueCellFull!11384) mapValue!37691)) b!1025731))

(assert (= (and b!1025729 ((_ is ValueCellFull!11384) mapDefault!37691)) b!1025724))

(assert (= b!1025730 b!1025729))

(assert (= start!89454 b!1025730))

(declare-fun m!943427 () Bool)

(assert (=> b!1025728 m!943427))

(declare-fun m!943429 () Bool)

(assert (=> b!1025725 m!943429))

(declare-fun m!943431 () Bool)

(assert (=> b!1025725 m!943431))

(declare-fun m!943433 () Bool)

(assert (=> b!1025725 m!943433))

(declare-fun m!943435 () Bool)

(assert (=> b!1025725 m!943435))

(declare-fun m!943437 () Bool)

(assert (=> b!1025725 m!943437))

(declare-fun m!943439 () Bool)

(assert (=> b!1025725 m!943439))

(declare-fun m!943441 () Bool)

(assert (=> b!1025725 m!943441))

(declare-fun m!943443 () Bool)

(assert (=> b!1025725 m!943443))

(declare-fun m!943445 () Bool)

(assert (=> b!1025730 m!943445))

(declare-fun m!943447 () Bool)

(assert (=> b!1025730 m!943447))

(declare-fun m!943449 () Bool)

(assert (=> mapNonEmpty!37691 m!943449))

(declare-fun m!943451 () Bool)

(assert (=> b!1025727 m!943451))

(declare-fun m!943453 () Bool)

(assert (=> start!89454 m!943453))

(check-sat (not b!1025725) (not b_next!20455) (not b!1025730) (not b!1025727) b_and!32675 (not mapNonEmpty!37691) (not start!89454) tp_is_empty!24175 (not b!1025728))
(check-sat b_and!32675 (not b_next!20455))
