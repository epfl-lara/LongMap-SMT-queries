; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89720 () Bool)

(assert start!89720)

(declare-fun b!1027557 () Bool)

(declare-fun b_free!20485 () Bool)

(declare-fun b_next!20485 () Bool)

(assert (=> b!1027557 (= b_free!20485 (not b_next!20485))))

(declare-fun tp!72500 () Bool)

(declare-fun b_and!32741 () Bool)

(assert (=> b!1027557 (= tp!72500 b_and!32741)))

(declare-fun b!1027550 () Bool)

(declare-fun e!579717 () Bool)

(declare-fun tp_is_empty!24205 () Bool)

(assert (=> b!1027550 (= e!579717 tp_is_empty!24205)))

(declare-fun b!1027551 () Bool)

(declare-fun e!579720 () Bool)

(declare-fun e!579716 () Bool)

(assert (=> b!1027551 (= e!579720 e!579716)))

(declare-fun res!687497 () Bool)

(assert (=> b!1027551 (=> (not res!687497) (not e!579716))))

(declare-datatypes ((SeekEntryResult!9597 0))(
  ( (MissingZero!9597 (index!40759 (_ BitVec 32))) (Found!9597 (index!40760 (_ BitVec 32))) (Intermediate!9597 (undefined!10409 Bool) (index!40761 (_ BitVec 32)) (x!91265 (_ BitVec 32))) (Undefined!9597) (MissingVacant!9597 (index!40762 (_ BitVec 32))) )
))
(declare-fun lt!451928 () SeekEntryResult!9597)

(get-info :version)

(assert (=> b!1027551 (= res!687497 ((_ is Found!9597) lt!451928))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37147 0))(
  ( (V!37148 (val!12153 Int)) )
))
(declare-datatypes ((ValueCell!11399 0))(
  ( (ValueCellFull!11399 (v!14718 V!37147)) (EmptyCell!11399) )
))
(declare-datatypes ((array!64509 0))(
  ( (array!64510 (arr!31057 (Array (_ BitVec 32) (_ BitVec 64))) (size!31571 (_ BitVec 32))) )
))
(declare-datatypes ((array!64511 0))(
  ( (array!64512 (arr!31058 (Array (_ BitVec 32) ValueCell!11399)) (size!31572 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5392 0))(
  ( (LongMapFixedSize!5393 (defaultEntry!6048 Int) (mask!29798 (_ BitVec 32)) (extraKeys!5780 (_ BitVec 32)) (zeroValue!5884 V!37147) (minValue!5884 V!37147) (_size!2751 (_ BitVec 32)) (_keys!11233 array!64509) (_values!6071 array!64511) (_vacant!2751 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5392)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64509 (_ BitVec 32)) SeekEntryResult!9597)

(assert (=> b!1027551 (= lt!451928 (seekEntry!0 key!909 (_keys!11233 thiss!1427) (mask!29798 thiss!1427)))))

(declare-fun mapNonEmpty!37736 () Bool)

(declare-fun mapRes!37736 () Bool)

(declare-fun tp!72501 () Bool)

(assert (=> mapNonEmpty!37736 (= mapRes!37736 (and tp!72501 e!579717))))

(declare-fun mapValue!37736 () ValueCell!11399)

(declare-fun mapKey!37736 () (_ BitVec 32))

(declare-fun mapRest!37736 () (Array (_ BitVec 32) ValueCell!11399))

(assert (=> mapNonEmpty!37736 (= (arr!31058 (_values!6071 thiss!1427)) (store mapRest!37736 mapKey!37736 mapValue!37736))))

(declare-fun mapIsEmpty!37736 () Bool)

(assert (=> mapIsEmpty!37736 mapRes!37736))

(declare-fun b!1027552 () Bool)

(declare-fun e!579714 () Bool)

(assert (=> b!1027552 (= e!579716 (not e!579714))))

(declare-fun res!687499 () Bool)

(assert (=> b!1027552 (=> res!687499 e!579714)))

(assert (=> b!1027552 (= res!687499 (or (bvslt (index!40760 lt!451928) #b00000000000000000000000000000000) (bvsge (index!40760 lt!451928) (size!31571 (_keys!11233 thiss!1427))) (bvsge (size!31571 (_keys!11233 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451926 () array!64509)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64509 (_ BitVec 32)) Bool)

(assert (=> b!1027552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451926 (mask!29798 thiss!1427))))

(declare-datatypes ((Unit!33442 0))(
  ( (Unit!33443) )
))
(declare-fun lt!451929 () Unit!33442)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64509 (_ BitVec 32) (_ BitVec 32)) Unit!33442)

(assert (=> b!1027552 (= lt!451929 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11233 thiss!1427) (index!40760 lt!451928) (mask!29798 thiss!1427)))))

(declare-datatypes ((List!21763 0))(
  ( (Nil!21760) (Cons!21759 (h!22966 (_ BitVec 64)) (t!30817 List!21763)) )
))
(declare-fun arrayNoDuplicates!0 (array!64509 (_ BitVec 32) List!21763) Bool)

(assert (=> b!1027552 (arrayNoDuplicates!0 lt!451926 #b00000000000000000000000000000000 Nil!21760)))

(declare-fun lt!451931 () Unit!33442)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64509 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21763) Unit!33442)

(assert (=> b!1027552 (= lt!451931 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11233 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40760 lt!451928) #b00000000000000000000000000000000 Nil!21760))))

(declare-fun arrayCountValidKeys!0 (array!64509 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027552 (= (arrayCountValidKeys!0 lt!451926 #b00000000000000000000000000000000 (size!31571 (_keys!11233 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11233 thiss!1427) #b00000000000000000000000000000000 (size!31571 (_keys!11233 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027552 (= lt!451926 (array!64510 (store (arr!31057 (_keys!11233 thiss!1427)) (index!40760 lt!451928) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31571 (_keys!11233 thiss!1427))))))

(declare-fun lt!451930 () Unit!33442)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64509 (_ BitVec 32) (_ BitVec 64)) Unit!33442)

(assert (=> b!1027552 (= lt!451930 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11233 thiss!1427) (index!40760 lt!451928) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027553 () Bool)

(assert (=> b!1027553 (= e!579714 true)))

(declare-fun lt!451927 () Bool)

(assert (=> b!1027553 (= lt!451927 (arrayNoDuplicates!0 (_keys!11233 thiss!1427) #b00000000000000000000000000000000 Nil!21760))))

(declare-fun res!687500 () Bool)

(assert (=> start!89720 (=> (not res!687500) (not e!579720))))

(declare-fun valid!2055 (LongMapFixedSize!5392) Bool)

(assert (=> start!89720 (= res!687500 (valid!2055 thiss!1427))))

(assert (=> start!89720 e!579720))

(declare-fun e!579721 () Bool)

(assert (=> start!89720 e!579721))

(assert (=> start!89720 true))

(declare-fun b!1027554 () Bool)

(declare-fun e!579715 () Bool)

(declare-fun e!579719 () Bool)

(assert (=> b!1027554 (= e!579715 (and e!579719 mapRes!37736))))

(declare-fun condMapEmpty!37736 () Bool)

(declare-fun mapDefault!37736 () ValueCell!11399)

(assert (=> b!1027554 (= condMapEmpty!37736 (= (arr!31058 (_values!6071 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11399)) mapDefault!37736)))))

(declare-fun b!1027555 () Bool)

(declare-fun res!687498 () Bool)

(assert (=> b!1027555 (=> (not res!687498) (not e!579720))))

(assert (=> b!1027555 (= res!687498 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027556 () Bool)

(assert (=> b!1027556 (= e!579719 tp_is_empty!24205)))

(declare-fun array_inv!24071 (array!64509) Bool)

(declare-fun array_inv!24072 (array!64511) Bool)

(assert (=> b!1027557 (= e!579721 (and tp!72500 tp_is_empty!24205 (array_inv!24071 (_keys!11233 thiss!1427)) (array_inv!24072 (_values!6071 thiss!1427)) e!579715))))

(assert (= (and start!89720 res!687500) b!1027555))

(assert (= (and b!1027555 res!687498) b!1027551))

(assert (= (and b!1027551 res!687497) b!1027552))

(assert (= (and b!1027552 (not res!687499)) b!1027553))

(assert (= (and b!1027554 condMapEmpty!37736) mapIsEmpty!37736))

(assert (= (and b!1027554 (not condMapEmpty!37736)) mapNonEmpty!37736))

(assert (= (and mapNonEmpty!37736 ((_ is ValueCellFull!11399) mapValue!37736)) b!1027550))

(assert (= (and b!1027554 ((_ is ValueCellFull!11399) mapDefault!37736)) b!1027556))

(assert (= b!1027557 b!1027554))

(assert (= start!89720 b!1027557))

(declare-fun m!946131 () Bool)

(assert (=> b!1027557 m!946131))

(declare-fun m!946133 () Bool)

(assert (=> b!1027557 m!946133))

(declare-fun m!946135 () Bool)

(assert (=> start!89720 m!946135))

(declare-fun m!946137 () Bool)

(assert (=> b!1027553 m!946137))

(declare-fun m!946139 () Bool)

(assert (=> mapNonEmpty!37736 m!946139))

(declare-fun m!946141 () Bool)

(assert (=> b!1027552 m!946141))

(declare-fun m!946143 () Bool)

(assert (=> b!1027552 m!946143))

(declare-fun m!946145 () Bool)

(assert (=> b!1027552 m!946145))

(declare-fun m!946147 () Bool)

(assert (=> b!1027552 m!946147))

(declare-fun m!946149 () Bool)

(assert (=> b!1027552 m!946149))

(declare-fun m!946151 () Bool)

(assert (=> b!1027552 m!946151))

(declare-fun m!946153 () Bool)

(assert (=> b!1027552 m!946153))

(declare-fun m!946155 () Bool)

(assert (=> b!1027552 m!946155))

(declare-fun m!946157 () Bool)

(assert (=> b!1027551 m!946157))

(check-sat (not start!89720) tp_is_empty!24205 (not b!1027553) (not b!1027552) (not b!1027551) b_and!32741 (not mapNonEmpty!37736) (not b_next!20485) (not b!1027557))
(check-sat b_and!32741 (not b_next!20485))
