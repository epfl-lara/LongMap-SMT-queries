; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89500 () Bool)

(assert start!89500)

(declare-fun b!1026431 () Bool)

(declare-fun b_free!20499 () Bool)

(declare-fun b_next!20499 () Bool)

(assert (=> b!1026431 (= b_free!20499 (not b_next!20499))))

(declare-fun tp!72542 () Bool)

(declare-fun b_and!32745 () Bool)

(assert (=> b!1026431 (= tp!72542 b_and!32745)))

(declare-fun mapIsEmpty!37757 () Bool)

(declare-fun mapRes!37757 () Bool)

(assert (=> mapIsEmpty!37757 mapRes!37757))

(declare-fun e!579043 () Bool)

(declare-fun tp_is_empty!24219 () Bool)

(declare-datatypes ((V!37165 0))(
  ( (V!37166 (val!12160 Int)) )
))
(declare-datatypes ((ValueCell!11406 0))(
  ( (ValueCellFull!11406 (v!14729 V!37165)) (EmptyCell!11406) )
))
(declare-datatypes ((array!64488 0))(
  ( (array!64489 (arr!31053 (Array (_ BitVec 32) (_ BitVec 64))) (size!31566 (_ BitVec 32))) )
))
(declare-datatypes ((array!64490 0))(
  ( (array!64491 (arr!31054 (Array (_ BitVec 32) ValueCell!11406)) (size!31567 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5406 0))(
  ( (LongMapFixedSize!5407 (defaultEntry!6055 Int) (mask!29749 (_ BitVec 32)) (extraKeys!5787 (_ BitVec 32)) (zeroValue!5891 V!37165) (minValue!5891 V!37165) (_size!2758 (_ BitVec 32)) (_keys!11202 array!64488) (_values!6078 array!64490) (_vacant!2758 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5406)

(declare-fun e!579040 () Bool)

(declare-fun array_inv!24043 (array!64488) Bool)

(declare-fun array_inv!24044 (array!64490) Bool)

(assert (=> b!1026431 (= e!579043 (and tp!72542 tp_is_empty!24219 (array_inv!24043 (_keys!11202 thiss!1427)) (array_inv!24044 (_values!6078 thiss!1427)) e!579040))))

(declare-fun b!1026432 () Bool)

(declare-fun e!579044 () Bool)

(declare-fun e!579039 () Bool)

(assert (=> b!1026432 (= e!579044 (not e!579039))))

(declare-fun res!687100 () Bool)

(assert (=> b!1026432 (=> res!687100 e!579039)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026432 (= res!687100 (not (validMask!0 (mask!29749 thiss!1427))))))

(declare-fun lt!451553 () array!64488)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026432 (not (arrayContainsKey!0 lt!451553 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33437 0))(
  ( (Unit!33438) )
))
(declare-fun lt!451552 () Unit!33437)

(declare-datatypes ((SeekEntryResult!9647 0))(
  ( (MissingZero!9647 (index!40959 (_ BitVec 32))) (Found!9647 (index!40960 (_ BitVec 32))) (Intermediate!9647 (undefined!10459 Bool) (index!40961 (_ BitVec 32)) (x!91309 (_ BitVec 32))) (Undefined!9647) (MissingVacant!9647 (index!40962 (_ BitVec 32))) )
))
(declare-fun lt!451557 () SeekEntryResult!9647)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64488 (_ BitVec 32) (_ BitVec 64)) Unit!33437)

(assert (=> b!1026432 (= lt!451552 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11202 thiss!1427) (index!40960 lt!451557) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64488 (_ BitVec 32)) Bool)

(assert (=> b!1026432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451553 (mask!29749 thiss!1427))))

(declare-fun lt!451556 () Unit!33437)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64488 (_ BitVec 32) (_ BitVec 32)) Unit!33437)

(assert (=> b!1026432 (= lt!451556 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11202 thiss!1427) (index!40960 lt!451557) (mask!29749 thiss!1427)))))

(declare-datatypes ((List!21780 0))(
  ( (Nil!21777) (Cons!21776 (h!22974 (_ BitVec 64)) (t!30842 List!21780)) )
))
(declare-fun arrayNoDuplicates!0 (array!64488 (_ BitVec 32) List!21780) Bool)

(assert (=> b!1026432 (arrayNoDuplicates!0 lt!451553 #b00000000000000000000000000000000 Nil!21777)))

(declare-fun lt!451555 () Unit!33437)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64488 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21780) Unit!33437)

(assert (=> b!1026432 (= lt!451555 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11202 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40960 lt!451557) #b00000000000000000000000000000000 Nil!21777))))

(declare-fun arrayCountValidKeys!0 (array!64488 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026432 (= (arrayCountValidKeys!0 lt!451553 #b00000000000000000000000000000000 (size!31566 (_keys!11202 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11202 thiss!1427) #b00000000000000000000000000000000 (size!31566 (_keys!11202 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026432 (= lt!451553 (array!64489 (store (arr!31053 (_keys!11202 thiss!1427)) (index!40960 lt!451557) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31566 (_keys!11202 thiss!1427))))))

(declare-fun lt!451554 () Unit!33437)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64488 (_ BitVec 32) (_ BitVec 64)) Unit!33437)

(assert (=> b!1026432 (= lt!451554 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11202 thiss!1427) (index!40960 lt!451557) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026433 () Bool)

(declare-fun res!687102 () Bool)

(assert (=> b!1026433 (=> res!687102 e!579039)))

(assert (=> b!1026433 (= res!687102 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11202 thiss!1427) (mask!29749 thiss!1427))))))

(declare-fun b!1026434 () Bool)

(declare-fun e!579046 () Bool)

(assert (=> b!1026434 (= e!579040 (and e!579046 mapRes!37757))))

(declare-fun condMapEmpty!37757 () Bool)

(declare-fun mapDefault!37757 () ValueCell!11406)

(assert (=> b!1026434 (= condMapEmpty!37757 (= (arr!31054 (_values!6078 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11406)) mapDefault!37757)))))

(declare-fun b!1026435 () Bool)

(declare-fun e!579041 () Bool)

(assert (=> b!1026435 (= e!579041 tp_is_empty!24219)))

(declare-fun b!1026436 () Bool)

(declare-fun res!687101 () Bool)

(assert (=> b!1026436 (=> res!687101 e!579039)))

(assert (=> b!1026436 (= res!687101 (or (not (= (size!31567 (_values!6078 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29749 thiss!1427)))) (not (= (size!31566 (_keys!11202 thiss!1427)) (size!31567 (_values!6078 thiss!1427)))) (bvslt (mask!29749 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5787 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5787 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!37757 () Bool)

(declare-fun tp!72543 () Bool)

(assert (=> mapNonEmpty!37757 (= mapRes!37757 (and tp!72543 e!579041))))

(declare-fun mapValue!37757 () ValueCell!11406)

(declare-fun mapKey!37757 () (_ BitVec 32))

(declare-fun mapRest!37757 () (Array (_ BitVec 32) ValueCell!11406))

(assert (=> mapNonEmpty!37757 (= (arr!31054 (_values!6078 thiss!1427)) (store mapRest!37757 mapKey!37757 mapValue!37757))))

(declare-fun res!687103 () Bool)

(declare-fun e!579045 () Bool)

(assert (=> start!89500 (=> (not res!687103) (not e!579045))))

(declare-fun valid!2052 (LongMapFixedSize!5406) Bool)

(assert (=> start!89500 (= res!687103 (valid!2052 thiss!1427))))

(assert (=> start!89500 e!579045))

(assert (=> start!89500 e!579043))

(assert (=> start!89500 true))

(declare-fun b!1026437 () Bool)

(declare-fun res!687104 () Bool)

(assert (=> b!1026437 (=> (not res!687104) (not e!579045))))

(assert (=> b!1026437 (= res!687104 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026438 () Bool)

(assert (=> b!1026438 (= e!579039 true)))

(declare-fun lt!451551 () Bool)

(assert (=> b!1026438 (= lt!451551 (arrayNoDuplicates!0 (_keys!11202 thiss!1427) #b00000000000000000000000000000000 Nil!21777))))

(declare-fun b!1026439 () Bool)

(assert (=> b!1026439 (= e!579045 e!579044)))

(declare-fun res!687099 () Bool)

(assert (=> b!1026439 (=> (not res!687099) (not e!579044))))

(get-info :version)

(assert (=> b!1026439 (= res!687099 ((_ is Found!9647) lt!451557))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64488 (_ BitVec 32)) SeekEntryResult!9647)

(assert (=> b!1026439 (= lt!451557 (seekEntry!0 key!909 (_keys!11202 thiss!1427) (mask!29749 thiss!1427)))))

(declare-fun b!1026440 () Bool)

(assert (=> b!1026440 (= e!579046 tp_is_empty!24219)))

(assert (= (and start!89500 res!687103) b!1026437))

(assert (= (and b!1026437 res!687104) b!1026439))

(assert (= (and b!1026439 res!687099) b!1026432))

(assert (= (and b!1026432 (not res!687100)) b!1026436))

(assert (= (and b!1026436 (not res!687101)) b!1026433))

(assert (= (and b!1026433 (not res!687102)) b!1026438))

(assert (= (and b!1026434 condMapEmpty!37757) mapIsEmpty!37757))

(assert (= (and b!1026434 (not condMapEmpty!37757)) mapNonEmpty!37757))

(assert (= (and mapNonEmpty!37757 ((_ is ValueCellFull!11406) mapValue!37757)) b!1026435))

(assert (= (and b!1026434 ((_ is ValueCellFull!11406) mapDefault!37757)) b!1026440))

(assert (= b!1026431 b!1026434))

(assert (= start!89500 b!1026431))

(declare-fun m!944695 () Bool)

(assert (=> start!89500 m!944695))

(declare-fun m!944697 () Bool)

(assert (=> b!1026438 m!944697))

(declare-fun m!944699 () Bool)

(assert (=> mapNonEmpty!37757 m!944699))

(declare-fun m!944701 () Bool)

(assert (=> b!1026431 m!944701))

(declare-fun m!944703 () Bool)

(assert (=> b!1026431 m!944703))

(declare-fun m!944705 () Bool)

(assert (=> b!1026439 m!944705))

(declare-fun m!944707 () Bool)

(assert (=> b!1026432 m!944707))

(declare-fun m!944709 () Bool)

(assert (=> b!1026432 m!944709))

(declare-fun m!944711 () Bool)

(assert (=> b!1026432 m!944711))

(declare-fun m!944713 () Bool)

(assert (=> b!1026432 m!944713))

(declare-fun m!944715 () Bool)

(assert (=> b!1026432 m!944715))

(declare-fun m!944717 () Bool)

(assert (=> b!1026432 m!944717))

(declare-fun m!944719 () Bool)

(assert (=> b!1026432 m!944719))

(declare-fun m!944721 () Bool)

(assert (=> b!1026432 m!944721))

(declare-fun m!944723 () Bool)

(assert (=> b!1026432 m!944723))

(declare-fun m!944725 () Bool)

(assert (=> b!1026432 m!944725))

(declare-fun m!944727 () Bool)

(assert (=> b!1026432 m!944727))

(declare-fun m!944729 () Bool)

(assert (=> b!1026433 m!944729))

(check-sat (not mapNonEmpty!37757) (not start!89500) tp_is_empty!24219 (not b!1026438) (not b!1026432) (not b!1026431) b_and!32745 (not b!1026439) (not b_next!20499) (not b!1026433))
(check-sat b_and!32745 (not b_next!20499))
