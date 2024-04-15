; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89556 () Bool)

(assert start!89556)

(declare-fun b!1027156 () Bool)

(declare-fun b_free!20557 () Bool)

(declare-fun b_next!20557 () Bool)

(assert (=> b!1027156 (= b_free!20557 (not b_next!20557))))

(declare-fun tp!72717 () Bool)

(declare-fun b_and!32777 () Bool)

(assert (=> b!1027156 (= tp!72717 b_and!32777)))

(declare-fun b!1027150 () Bool)

(declare-fun e!579648 () Bool)

(declare-fun e!579650 () Bool)

(assert (=> b!1027150 (= e!579648 (not e!579650))))

(declare-fun res!687557 () Bool)

(assert (=> b!1027150 (=> res!687557 e!579650)))

(declare-datatypes ((V!37243 0))(
  ( (V!37244 (val!12189 Int)) )
))
(declare-datatypes ((ValueCell!11435 0))(
  ( (ValueCellFull!11435 (v!14757 V!37243)) (EmptyCell!11435) )
))
(declare-datatypes ((array!64543 0))(
  ( (array!64544 (arr!31080 (Array (_ BitVec 32) (_ BitVec 64))) (size!31595 (_ BitVec 32))) )
))
(declare-datatypes ((array!64545 0))(
  ( (array!64546 (arr!31081 (Array (_ BitVec 32) ValueCell!11435)) (size!31596 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5464 0))(
  ( (LongMapFixedSize!5465 (defaultEntry!6084 Int) (mask!29793 (_ BitVec 32)) (extraKeys!5816 (_ BitVec 32)) (zeroValue!5920 V!37243) (minValue!5920 V!37243) (_size!2787 (_ BitVec 32)) (_keys!11227 array!64543) (_values!6107 array!64545) (_vacant!2787 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5464)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027150 (= res!687557 (not (validMask!0 (mask!29793 thiss!1427))))))

(declare-fun lt!451965 () array!64543)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027150 (not (arrayContainsKey!0 lt!451965 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33361 0))(
  ( (Unit!33362) )
))
(declare-fun lt!451962 () Unit!33361)

(declare-datatypes ((SeekEntryResult!9659 0))(
  ( (MissingZero!9659 (index!41007 (_ BitVec 32))) (Found!9659 (index!41008 (_ BitVec 32))) (Intermediate!9659 (undefined!10471 Bool) (index!41009 (_ BitVec 32)) (x!91398 (_ BitVec 32))) (Undefined!9659) (MissingVacant!9659 (index!41010 (_ BitVec 32))) )
))
(declare-fun lt!451961 () SeekEntryResult!9659)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64543 (_ BitVec 32) (_ BitVec 64)) Unit!33361)

(assert (=> b!1027150 (= lt!451962 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11227 thiss!1427) (index!41008 lt!451961) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64543 (_ BitVec 32)) Bool)

(assert (=> b!1027150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451965 (mask!29793 thiss!1427))))

(declare-fun lt!451966 () Unit!33361)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64543 (_ BitVec 32) (_ BitVec 32)) Unit!33361)

(assert (=> b!1027150 (= lt!451966 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11227 thiss!1427) (index!41008 lt!451961) (mask!29793 thiss!1427)))))

(declare-datatypes ((List!21834 0))(
  ( (Nil!21831) (Cons!21830 (h!23028 (_ BitVec 64)) (t!30887 List!21834)) )
))
(declare-fun arrayNoDuplicates!0 (array!64543 (_ BitVec 32) List!21834) Bool)

(assert (=> b!1027150 (arrayNoDuplicates!0 lt!451965 #b00000000000000000000000000000000 Nil!21831)))

(declare-fun lt!451963 () Unit!33361)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21834) Unit!33361)

(assert (=> b!1027150 (= lt!451963 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11227 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41008 lt!451961) #b00000000000000000000000000000000 Nil!21831))))

(declare-fun arrayCountValidKeys!0 (array!64543 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027150 (= (arrayCountValidKeys!0 lt!451965 #b00000000000000000000000000000000 (size!31595 (_keys!11227 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11227 thiss!1427) #b00000000000000000000000000000000 (size!31595 (_keys!11227 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027150 (= lt!451965 (array!64544 (store (arr!31080 (_keys!11227 thiss!1427)) (index!41008 lt!451961) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31595 (_keys!11227 thiss!1427))))))

(declare-fun lt!451960 () Unit!33361)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64543 (_ BitVec 32) (_ BitVec 64)) Unit!33361)

(assert (=> b!1027150 (= lt!451960 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11227 thiss!1427) (index!41008 lt!451961) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027151 () Bool)

(declare-fun e!579651 () Bool)

(assert (=> b!1027151 (= e!579651 e!579648)))

(declare-fun res!687558 () Bool)

(assert (=> b!1027151 (=> (not res!687558) (not e!579648))))

(get-info :version)

(assert (=> b!1027151 (= res!687558 ((_ is Found!9659) lt!451961))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64543 (_ BitVec 32)) SeekEntryResult!9659)

(assert (=> b!1027151 (= lt!451961 (seekEntry!0 key!909 (_keys!11227 thiss!1427) (mask!29793 thiss!1427)))))

(declare-fun mapIsEmpty!37844 () Bool)

(declare-fun mapRes!37844 () Bool)

(assert (=> mapIsEmpty!37844 mapRes!37844))

(declare-fun b!1027152 () Bool)

(declare-fun e!579646 () Bool)

(declare-fun tp_is_empty!24277 () Bool)

(assert (=> b!1027152 (= e!579646 tp_is_empty!24277)))

(declare-fun b!1027153 () Bool)

(declare-fun res!687559 () Bool)

(assert (=> b!1027153 (=> res!687559 e!579650)))

(assert (=> b!1027153 (= res!687559 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11227 thiss!1427) (mask!29793 thiss!1427))))))

(declare-fun b!1027154 () Bool)

(declare-fun res!687554 () Bool)

(assert (=> b!1027154 (=> res!687554 e!579650)))

(assert (=> b!1027154 (= res!687554 (or (not (= (size!31596 (_values!6107 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29793 thiss!1427)))) (not (= (size!31595 (_keys!11227 thiss!1427)) (size!31596 (_values!6107 thiss!1427)))) (bvslt (mask!29793 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5816 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5816 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027155 () Bool)

(declare-fun e!579649 () Bool)

(assert (=> b!1027155 (= e!579649 (and e!579646 mapRes!37844))))

(declare-fun condMapEmpty!37844 () Bool)

(declare-fun mapDefault!37844 () ValueCell!11435)

(assert (=> b!1027155 (= condMapEmpty!37844 (= (arr!31081 (_values!6107 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11435)) mapDefault!37844)))))

(declare-fun e!579647 () Bool)

(declare-fun array_inv!24065 (array!64543) Bool)

(declare-fun array_inv!24066 (array!64545) Bool)

(assert (=> b!1027156 (= e!579647 (and tp!72717 tp_is_empty!24277 (array_inv!24065 (_keys!11227 thiss!1427)) (array_inv!24066 (_values!6107 thiss!1427)) e!579649))))

(declare-fun res!687555 () Bool)

(assert (=> start!89556 (=> (not res!687555) (not e!579651))))

(declare-fun valid!2062 (LongMapFixedSize!5464) Bool)

(assert (=> start!89556 (= res!687555 (valid!2062 thiss!1427))))

(assert (=> start!89556 e!579651))

(assert (=> start!89556 e!579647))

(assert (=> start!89556 true))

(declare-fun b!1027157 () Bool)

(declare-fun res!687556 () Bool)

(assert (=> b!1027157 (=> (not res!687556) (not e!579651))))

(assert (=> b!1027157 (= res!687556 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027158 () Bool)

(assert (=> b!1027158 (= e!579650 true)))

(declare-fun lt!451964 () Bool)

(assert (=> b!1027158 (= lt!451964 (arrayNoDuplicates!0 (_keys!11227 thiss!1427) #b00000000000000000000000000000000 Nil!21831))))

(declare-fun mapNonEmpty!37844 () Bool)

(declare-fun tp!72716 () Bool)

(declare-fun e!579645 () Bool)

(assert (=> mapNonEmpty!37844 (= mapRes!37844 (and tp!72716 e!579645))))

(declare-fun mapKey!37844 () (_ BitVec 32))

(declare-fun mapRest!37844 () (Array (_ BitVec 32) ValueCell!11435))

(declare-fun mapValue!37844 () ValueCell!11435)

(assert (=> mapNonEmpty!37844 (= (arr!31081 (_values!6107 thiss!1427)) (store mapRest!37844 mapKey!37844 mapValue!37844))))

(declare-fun b!1027159 () Bool)

(assert (=> b!1027159 (= e!579645 tp_is_empty!24277)))

(assert (= (and start!89556 res!687555) b!1027157))

(assert (= (and b!1027157 res!687556) b!1027151))

(assert (= (and b!1027151 res!687558) b!1027150))

(assert (= (and b!1027150 (not res!687557)) b!1027154))

(assert (= (and b!1027154 (not res!687554)) b!1027153))

(assert (= (and b!1027153 (not res!687559)) b!1027158))

(assert (= (and b!1027155 condMapEmpty!37844) mapIsEmpty!37844))

(assert (= (and b!1027155 (not condMapEmpty!37844)) mapNonEmpty!37844))

(assert (= (and mapNonEmpty!37844 ((_ is ValueCellFull!11435) mapValue!37844)) b!1027159))

(assert (= (and b!1027155 ((_ is ValueCellFull!11435) mapDefault!37844)) b!1027152))

(assert (= b!1027156 b!1027155))

(assert (= start!89556 b!1027156))

(declare-fun m!945119 () Bool)

(assert (=> b!1027158 m!945119))

(declare-fun m!945121 () Bool)

(assert (=> start!89556 m!945121))

(declare-fun m!945123 () Bool)

(assert (=> b!1027153 m!945123))

(declare-fun m!945125 () Bool)

(assert (=> b!1027150 m!945125))

(declare-fun m!945127 () Bool)

(assert (=> b!1027150 m!945127))

(declare-fun m!945129 () Bool)

(assert (=> b!1027150 m!945129))

(declare-fun m!945131 () Bool)

(assert (=> b!1027150 m!945131))

(declare-fun m!945133 () Bool)

(assert (=> b!1027150 m!945133))

(declare-fun m!945135 () Bool)

(assert (=> b!1027150 m!945135))

(declare-fun m!945137 () Bool)

(assert (=> b!1027150 m!945137))

(declare-fun m!945139 () Bool)

(assert (=> b!1027150 m!945139))

(declare-fun m!945141 () Bool)

(assert (=> b!1027150 m!945141))

(declare-fun m!945143 () Bool)

(assert (=> b!1027150 m!945143))

(declare-fun m!945145 () Bool)

(assert (=> b!1027150 m!945145))

(declare-fun m!945147 () Bool)

(assert (=> mapNonEmpty!37844 m!945147))

(declare-fun m!945149 () Bool)

(assert (=> b!1027156 m!945149))

(declare-fun m!945151 () Bool)

(assert (=> b!1027156 m!945151))

(declare-fun m!945153 () Bool)

(assert (=> b!1027151 m!945153))

(check-sat (not b!1027153) b_and!32777 tp_is_empty!24277 (not start!89556) (not b!1027156) (not b!1027158) (not b_next!20557) (not b!1027151) (not b!1027150) (not mapNonEmpty!37844))
(check-sat b_and!32777 (not b_next!20557))
