; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89472 () Bool)

(assert start!89472)

(declare-fun b!1025943 () Bool)

(declare-fun b_free!20473 () Bool)

(declare-fun b_next!20473 () Bool)

(assert (=> b!1025943 (= b_free!20473 (not b_next!20473))))

(declare-fun tp!72464 () Bool)

(declare-fun b_and!32693 () Bool)

(assert (=> b!1025943 (= tp!72464 b_and!32693)))

(declare-fun b!1025940 () Bool)

(declare-fun e!578640 () Bool)

(declare-fun tp_is_empty!24193 () Bool)

(assert (=> b!1025940 (= e!578640 tp_is_empty!24193)))

(declare-fun res!686848 () Bool)

(declare-fun e!578636 () Bool)

(assert (=> start!89472 (=> (not res!686848) (not e!578636))))

(declare-datatypes ((V!37131 0))(
  ( (V!37132 (val!12147 Int)) )
))
(declare-datatypes ((ValueCell!11393 0))(
  ( (ValueCellFull!11393 (v!14715 V!37131)) (EmptyCell!11393) )
))
(declare-datatypes ((array!64375 0))(
  ( (array!64376 (arr!30996 (Array (_ BitVec 32) (_ BitVec 64))) (size!31511 (_ BitVec 32))) )
))
(declare-datatypes ((array!64377 0))(
  ( (array!64378 (arr!30997 (Array (_ BitVec 32) ValueCell!11393)) (size!31512 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5380 0))(
  ( (LongMapFixedSize!5381 (defaultEntry!6042 Int) (mask!29723 (_ BitVec 32)) (extraKeys!5774 (_ BitVec 32)) (zeroValue!5878 V!37131) (minValue!5878 V!37131) (_size!2745 (_ BitVec 32)) (_keys!11185 array!64375) (_values!6065 array!64377) (_vacant!2745 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5380)

(declare-fun valid!2040 (LongMapFixedSize!5380) Bool)

(assert (=> start!89472 (= res!686848 (valid!2040 thiss!1427))))

(assert (=> start!89472 e!578636))

(declare-fun e!578639 () Bool)

(assert (=> start!89472 e!578639))

(assert (=> start!89472 true))

(declare-fun b!1025941 () Bool)

(declare-fun e!578642 () Bool)

(assert (=> b!1025941 (= e!578636 e!578642)))

(declare-fun res!686851 () Bool)

(assert (=> b!1025941 (=> (not res!686851) (not e!578642))))

(declare-datatypes ((SeekEntryResult!9633 0))(
  ( (MissingZero!9633 (index!40903 (_ BitVec 32))) (Found!9633 (index!40904 (_ BitVec 32))) (Intermediate!9633 (undefined!10445 Bool) (index!40905 (_ BitVec 32)) (x!91260 (_ BitVec 32))) (Undefined!9633) (MissingVacant!9633 (index!40906 (_ BitVec 32))) )
))
(declare-fun lt!451103 () SeekEntryResult!9633)

(get-info :version)

(assert (=> b!1025941 (= res!686851 ((_ is Found!9633) lt!451103))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64375 (_ BitVec 32)) SeekEntryResult!9633)

(assert (=> b!1025941 (= lt!451103 (seekEntry!0 key!909 (_keys!11185 thiss!1427) (mask!29723 thiss!1427)))))

(declare-fun mapNonEmpty!37718 () Bool)

(declare-fun mapRes!37718 () Bool)

(declare-fun tp!72465 () Bool)

(assert (=> mapNonEmpty!37718 (= mapRes!37718 (and tp!72465 e!578640))))

(declare-fun mapRest!37718 () (Array (_ BitVec 32) ValueCell!11393))

(declare-fun mapKey!37718 () (_ BitVec 32))

(declare-fun mapValue!37718 () ValueCell!11393)

(assert (=> mapNonEmpty!37718 (= (arr!30997 (_values!6065 thiss!1427)) (store mapRest!37718 mapKey!37718 mapValue!37718))))

(declare-fun b!1025942 () Bool)

(declare-fun e!578638 () Bool)

(assert (=> b!1025942 (= e!578638 tp_is_empty!24193)))

(declare-fun e!578643 () Bool)

(declare-fun array_inv!24019 (array!64375) Bool)

(declare-fun array_inv!24020 (array!64377) Bool)

(assert (=> b!1025943 (= e!578639 (and tp!72464 tp_is_empty!24193 (array_inv!24019 (_keys!11185 thiss!1427)) (array_inv!24020 (_values!6065 thiss!1427)) e!578643))))

(declare-fun b!1025944 () Bool)

(declare-fun res!686849 () Bool)

(assert (=> b!1025944 (=> (not res!686849) (not e!578636))))

(assert (=> b!1025944 (= res!686849 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025945 () Bool)

(assert (=> b!1025945 (= e!578643 (and e!578638 mapRes!37718))))

(declare-fun condMapEmpty!37718 () Bool)

(declare-fun mapDefault!37718 () ValueCell!11393)

(assert (=> b!1025945 (= condMapEmpty!37718 (= (arr!30997 (_values!6065 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11393)) mapDefault!37718)))))

(declare-fun b!1025946 () Bool)

(declare-fun e!578637 () Bool)

(assert (=> b!1025946 (= e!578642 (not e!578637))))

(declare-fun res!686850 () Bool)

(assert (=> b!1025946 (=> res!686850 e!578637)))

(assert (=> b!1025946 (= res!686850 (or (bvslt (index!40904 lt!451103) #b00000000000000000000000000000000) (bvsge (index!40904 lt!451103) (size!31511 (_keys!11185 thiss!1427))) (bvsge (size!31511 (_keys!11185 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451106 () array!64375)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64375 (_ BitVec 32)) Bool)

(assert (=> b!1025946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451106 (mask!29723 thiss!1427))))

(declare-datatypes ((Unit!33319 0))(
  ( (Unit!33320) )
))
(declare-fun lt!451108 () Unit!33319)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64375 (_ BitVec 32) (_ BitVec 32)) Unit!33319)

(assert (=> b!1025946 (= lt!451108 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11185 thiss!1427) (index!40904 lt!451103) (mask!29723 thiss!1427)))))

(declare-datatypes ((List!21805 0))(
  ( (Nil!21802) (Cons!21801 (h!22999 (_ BitVec 64)) (t!30858 List!21805)) )
))
(declare-fun arrayNoDuplicates!0 (array!64375 (_ BitVec 32) List!21805) Bool)

(assert (=> b!1025946 (arrayNoDuplicates!0 lt!451106 #b00000000000000000000000000000000 Nil!21802)))

(declare-fun lt!451107 () Unit!33319)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64375 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21805) Unit!33319)

(assert (=> b!1025946 (= lt!451107 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11185 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40904 lt!451103) #b00000000000000000000000000000000 Nil!21802))))

(declare-fun arrayCountValidKeys!0 (array!64375 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025946 (= (arrayCountValidKeys!0 lt!451106 #b00000000000000000000000000000000 (size!31511 (_keys!11185 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11185 thiss!1427) #b00000000000000000000000000000000 (size!31511 (_keys!11185 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025946 (= lt!451106 (array!64376 (store (arr!30996 (_keys!11185 thiss!1427)) (index!40904 lt!451103) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31511 (_keys!11185 thiss!1427))))))

(declare-fun lt!451104 () Unit!33319)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64375 (_ BitVec 32) (_ BitVec 64)) Unit!33319)

(assert (=> b!1025946 (= lt!451104 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11185 thiss!1427) (index!40904 lt!451103) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025947 () Bool)

(assert (=> b!1025947 (= e!578637 true)))

(declare-fun lt!451105 () Bool)

(assert (=> b!1025947 (= lt!451105 (arrayNoDuplicates!0 (_keys!11185 thiss!1427) #b00000000000000000000000000000000 Nil!21802))))

(declare-fun mapIsEmpty!37718 () Bool)

(assert (=> mapIsEmpty!37718 mapRes!37718))

(assert (= (and start!89472 res!686848) b!1025944))

(assert (= (and b!1025944 res!686849) b!1025941))

(assert (= (and b!1025941 res!686851) b!1025946))

(assert (= (and b!1025946 (not res!686850)) b!1025947))

(assert (= (and b!1025945 condMapEmpty!37718) mapIsEmpty!37718))

(assert (= (and b!1025945 (not condMapEmpty!37718)) mapNonEmpty!37718))

(assert (= (and mapNonEmpty!37718 ((_ is ValueCellFull!11393) mapValue!37718)) b!1025940))

(assert (= (and b!1025945 ((_ is ValueCellFull!11393) mapDefault!37718)) b!1025942))

(assert (= b!1025943 b!1025945))

(assert (= start!89472 b!1025943))

(declare-fun m!943679 () Bool)

(assert (=> b!1025941 m!943679))

(declare-fun m!943681 () Bool)

(assert (=> b!1025943 m!943681))

(declare-fun m!943683 () Bool)

(assert (=> b!1025943 m!943683))

(declare-fun m!943685 () Bool)

(assert (=> b!1025947 m!943685))

(declare-fun m!943687 () Bool)

(assert (=> b!1025946 m!943687))

(declare-fun m!943689 () Bool)

(assert (=> b!1025946 m!943689))

(declare-fun m!943691 () Bool)

(assert (=> b!1025946 m!943691))

(declare-fun m!943693 () Bool)

(assert (=> b!1025946 m!943693))

(declare-fun m!943695 () Bool)

(assert (=> b!1025946 m!943695))

(declare-fun m!943697 () Bool)

(assert (=> b!1025946 m!943697))

(declare-fun m!943699 () Bool)

(assert (=> b!1025946 m!943699))

(declare-fun m!943701 () Bool)

(assert (=> b!1025946 m!943701))

(declare-fun m!943703 () Bool)

(assert (=> start!89472 m!943703))

(declare-fun m!943705 () Bool)

(assert (=> mapNonEmpty!37718 m!943705))

(check-sat (not b!1025947) (not mapNonEmpty!37718) (not b_next!20473) (not b!1025941) b_and!32693 (not b!1025943) tp_is_empty!24193 (not start!89472) (not b!1025946))
(check-sat b_and!32693 (not b_next!20473))
