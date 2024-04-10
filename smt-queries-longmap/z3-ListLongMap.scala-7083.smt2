; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89554 () Bool)

(assert start!89554)

(declare-fun b!1027244 () Bool)

(declare-fun b_free!20553 () Bool)

(declare-fun b_next!20553 () Bool)

(assert (=> b!1027244 (= b_free!20553 (not b_next!20553))))

(declare-fun tp!72705 () Bool)

(declare-fun b_and!32799 () Bool)

(assert (=> b!1027244 (= tp!72705 b_and!32799)))

(declare-fun b!1027241 () Bool)

(declare-fun e!579689 () Bool)

(declare-fun e!579693 () Bool)

(assert (=> b!1027241 (= e!579689 (not e!579693))))

(declare-fun res!687585 () Bool)

(assert (=> b!1027241 (=> res!687585 e!579693)))

(declare-datatypes ((V!37237 0))(
  ( (V!37238 (val!12187 Int)) )
))
(declare-datatypes ((ValueCell!11433 0))(
  ( (ValueCellFull!11433 (v!14756 V!37237)) (EmptyCell!11433) )
))
(declare-datatypes ((array!64596 0))(
  ( (array!64597 (arr!31107 (Array (_ BitVec 32) (_ BitVec 64))) (size!31620 (_ BitVec 32))) )
))
(declare-datatypes ((array!64598 0))(
  ( (array!64599 (arr!31108 (Array (_ BitVec 32) ValueCell!11433)) (size!31621 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5460 0))(
  ( (LongMapFixedSize!5461 (defaultEntry!6082 Int) (mask!29794 (_ BitVec 32)) (extraKeys!5814 (_ BitVec 32)) (zeroValue!5918 V!37237) (minValue!5918 V!37237) (_size!2785 (_ BitVec 32)) (_keys!11229 array!64596) (_values!6105 array!64598) (_vacant!2785 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5460)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027241 (= res!687585 (not (validMask!0 (mask!29794 thiss!1427))))))

(declare-fun lt!452122 () array!64596)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027241 (not (arrayContainsKey!0 lt!452122 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33475 0))(
  ( (Unit!33476) )
))
(declare-fun lt!452120 () Unit!33475)

(declare-datatypes ((SeekEntryResult!9668 0))(
  ( (MissingZero!9668 (index!41043 (_ BitVec 32))) (Found!9668 (index!41044 (_ BitVec 32))) (Intermediate!9668 (undefined!10480 Bool) (index!41045 (_ BitVec 32)) (x!91402 (_ BitVec 32))) (Undefined!9668) (MissingVacant!9668 (index!41046 (_ BitVec 32))) )
))
(declare-fun lt!452121 () SeekEntryResult!9668)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64596 (_ BitVec 32) (_ BitVec 64)) Unit!33475)

(assert (=> b!1027241 (= lt!452120 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11229 thiss!1427) (index!41044 lt!452121) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64596 (_ BitVec 32)) Bool)

(assert (=> b!1027241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452122 (mask!29794 thiss!1427))))

(declare-fun lt!452124 () Unit!33475)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64596 (_ BitVec 32) (_ BitVec 32)) Unit!33475)

(assert (=> b!1027241 (= lt!452124 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11229 thiss!1427) (index!41044 lt!452121) (mask!29794 thiss!1427)))))

(declare-datatypes ((List!21802 0))(
  ( (Nil!21799) (Cons!21798 (h!22996 (_ BitVec 64)) (t!30864 List!21802)) )
))
(declare-fun arrayNoDuplicates!0 (array!64596 (_ BitVec 32) List!21802) Bool)

(assert (=> b!1027241 (arrayNoDuplicates!0 lt!452122 #b00000000000000000000000000000000 Nil!21799)))

(declare-fun lt!452119 () Unit!33475)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64596 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21802) Unit!33475)

(assert (=> b!1027241 (= lt!452119 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11229 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41044 lt!452121) #b00000000000000000000000000000000 Nil!21799))))

(declare-fun arrayCountValidKeys!0 (array!64596 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027241 (= (arrayCountValidKeys!0 lt!452122 #b00000000000000000000000000000000 (size!31620 (_keys!11229 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11229 thiss!1427) #b00000000000000000000000000000000 (size!31620 (_keys!11229 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027241 (= lt!452122 (array!64597 (store (arr!31107 (_keys!11229 thiss!1427)) (index!41044 lt!452121) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11229 thiss!1427))))))

(declare-fun lt!452123 () Unit!33475)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64596 (_ BitVec 32) (_ BitVec 64)) Unit!33475)

(assert (=> b!1027241 (= lt!452123 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11229 thiss!1427) (index!41044 lt!452121) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027242 () Bool)

(declare-fun e!579691 () Bool)

(assert (=> b!1027242 (= e!579691 e!579689)))

(declare-fun res!687589 () Bool)

(assert (=> b!1027242 (=> (not res!687589) (not e!579689))))

(get-info :version)

(assert (=> b!1027242 (= res!687589 ((_ is Found!9668) lt!452121))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64596 (_ BitVec 32)) SeekEntryResult!9668)

(assert (=> b!1027242 (= lt!452121 (seekEntry!0 key!909 (_keys!11229 thiss!1427) (mask!29794 thiss!1427)))))

(declare-fun b!1027243 () Bool)

(declare-fun res!687588 () Bool)

(assert (=> b!1027243 (=> res!687588 e!579693)))

(assert (=> b!1027243 (= res!687588 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11229 thiss!1427) (mask!29794 thiss!1427))))))

(declare-fun mapNonEmpty!37838 () Bool)

(declare-fun mapRes!37838 () Bool)

(declare-fun tp!72704 () Bool)

(declare-fun e!579694 () Bool)

(assert (=> mapNonEmpty!37838 (= mapRes!37838 (and tp!72704 e!579694))))

(declare-fun mapRest!37838 () (Array (_ BitVec 32) ValueCell!11433))

(declare-fun mapValue!37838 () ValueCell!11433)

(declare-fun mapKey!37838 () (_ BitVec 32))

(assert (=> mapNonEmpty!37838 (= (arr!31108 (_values!6105 thiss!1427)) (store mapRest!37838 mapKey!37838 mapValue!37838))))

(declare-fun tp_is_empty!24273 () Bool)

(declare-fun e!579692 () Bool)

(declare-fun e!579687 () Bool)

(declare-fun array_inv!24085 (array!64596) Bool)

(declare-fun array_inv!24086 (array!64598) Bool)

(assert (=> b!1027244 (= e!579692 (and tp!72705 tp_is_empty!24273 (array_inv!24085 (_keys!11229 thiss!1427)) (array_inv!24086 (_values!6105 thiss!1427)) e!579687))))

(declare-fun mapIsEmpty!37838 () Bool)

(assert (=> mapIsEmpty!37838 mapRes!37838))

(declare-fun res!687590 () Bool)

(assert (=> start!89554 (=> (not res!687590) (not e!579691))))

(declare-fun valid!2069 (LongMapFixedSize!5460) Bool)

(assert (=> start!89554 (= res!687590 (valid!2069 thiss!1427))))

(assert (=> start!89554 e!579691))

(assert (=> start!89554 e!579692))

(assert (=> start!89554 true))

(declare-fun b!1027245 () Bool)

(assert (=> b!1027245 (= e!579694 tp_is_empty!24273)))

(declare-fun b!1027246 () Bool)

(assert (=> b!1027246 (= e!579693 true)))

(declare-fun lt!452118 () Bool)

(assert (=> b!1027246 (= lt!452118 (arrayNoDuplicates!0 (_keys!11229 thiss!1427) #b00000000000000000000000000000000 Nil!21799))))

(declare-fun b!1027247 () Bool)

(declare-fun e!579690 () Bool)

(assert (=> b!1027247 (= e!579687 (and e!579690 mapRes!37838))))

(declare-fun condMapEmpty!37838 () Bool)

(declare-fun mapDefault!37838 () ValueCell!11433)

(assert (=> b!1027247 (= condMapEmpty!37838 (= (arr!31108 (_values!6105 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11433)) mapDefault!37838)))))

(declare-fun b!1027248 () Bool)

(declare-fun res!687586 () Bool)

(assert (=> b!1027248 (=> (not res!687586) (not e!579691))))

(assert (=> b!1027248 (= res!687586 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027249 () Bool)

(declare-fun res!687587 () Bool)

(assert (=> b!1027249 (=> res!687587 e!579693)))

(assert (=> b!1027249 (= res!687587 (or (not (= (size!31621 (_values!6105 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29794 thiss!1427)))) (not (= (size!31620 (_keys!11229 thiss!1427)) (size!31621 (_values!6105 thiss!1427)))) (bvslt (mask!29794 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5814 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5814 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027250 () Bool)

(assert (=> b!1027250 (= e!579690 tp_is_empty!24273)))

(assert (= (and start!89554 res!687590) b!1027248))

(assert (= (and b!1027248 res!687586) b!1027242))

(assert (= (and b!1027242 res!687589) b!1027241))

(assert (= (and b!1027241 (not res!687585)) b!1027249))

(assert (= (and b!1027249 (not res!687587)) b!1027243))

(assert (= (and b!1027243 (not res!687588)) b!1027246))

(assert (= (and b!1027247 condMapEmpty!37838) mapIsEmpty!37838))

(assert (= (and b!1027247 (not condMapEmpty!37838)) mapNonEmpty!37838))

(assert (= (and mapNonEmpty!37838 ((_ is ValueCellFull!11433) mapValue!37838)) b!1027245))

(assert (= (and b!1027247 ((_ is ValueCellFull!11433) mapDefault!37838)) b!1027250))

(assert (= b!1027244 b!1027247))

(assert (= start!89554 b!1027244))

(declare-fun m!945667 () Bool)

(assert (=> b!1027242 m!945667))

(declare-fun m!945669 () Bool)

(assert (=> start!89554 m!945669))

(declare-fun m!945671 () Bool)

(assert (=> b!1027244 m!945671))

(declare-fun m!945673 () Bool)

(assert (=> b!1027244 m!945673))

(declare-fun m!945675 () Bool)

(assert (=> b!1027243 m!945675))

(declare-fun m!945677 () Bool)

(assert (=> mapNonEmpty!37838 m!945677))

(declare-fun m!945679 () Bool)

(assert (=> b!1027246 m!945679))

(declare-fun m!945681 () Bool)

(assert (=> b!1027241 m!945681))

(declare-fun m!945683 () Bool)

(assert (=> b!1027241 m!945683))

(declare-fun m!945685 () Bool)

(assert (=> b!1027241 m!945685))

(declare-fun m!945687 () Bool)

(assert (=> b!1027241 m!945687))

(declare-fun m!945689 () Bool)

(assert (=> b!1027241 m!945689))

(declare-fun m!945691 () Bool)

(assert (=> b!1027241 m!945691))

(declare-fun m!945693 () Bool)

(assert (=> b!1027241 m!945693))

(declare-fun m!945695 () Bool)

(assert (=> b!1027241 m!945695))

(declare-fun m!945697 () Bool)

(assert (=> b!1027241 m!945697))

(declare-fun m!945699 () Bool)

(assert (=> b!1027241 m!945699))

(declare-fun m!945701 () Bool)

(assert (=> b!1027241 m!945701))

(check-sat (not b!1027246) (not b_next!20553) (not b!1027242) b_and!32799 (not b!1027241) (not start!89554) tp_is_empty!24273 (not b!1027243) (not b!1027244) (not mapNonEmpty!37838))
(check-sat b_and!32799 (not b_next!20553))
