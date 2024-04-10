; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89548 () Bool)

(assert start!89548)

(declare-fun b!1027155 () Bool)

(declare-fun b_free!20547 () Bool)

(declare-fun b_next!20547 () Bool)

(assert (=> b!1027155 (= b_free!20547 (not b_next!20547))))

(declare-fun tp!72687 () Bool)

(declare-fun b_and!32793 () Bool)

(assert (=> b!1027155 (= tp!72687 b_and!32793)))

(declare-fun b!1027151 () Bool)

(declare-fun e!579617 () Bool)

(assert (=> b!1027151 (= e!579617 true)))

(declare-fun lt!452057 () Bool)

(declare-datatypes ((V!37229 0))(
  ( (V!37230 (val!12184 Int)) )
))
(declare-datatypes ((ValueCell!11430 0))(
  ( (ValueCellFull!11430 (v!14753 V!37229)) (EmptyCell!11430) )
))
(declare-datatypes ((array!64584 0))(
  ( (array!64585 (arr!31101 (Array (_ BitVec 32) (_ BitVec 64))) (size!31614 (_ BitVec 32))) )
))
(declare-datatypes ((array!64586 0))(
  ( (array!64587 (arr!31102 (Array (_ BitVec 32) ValueCell!11430)) (size!31615 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5454 0))(
  ( (LongMapFixedSize!5455 (defaultEntry!6079 Int) (mask!29789 (_ BitVec 32)) (extraKeys!5811 (_ BitVec 32)) (zeroValue!5915 V!37229) (minValue!5915 V!37229) (_size!2782 (_ BitVec 32)) (_keys!11226 array!64584) (_values!6102 array!64586) (_vacant!2782 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5454)

(declare-datatypes ((List!21799 0))(
  ( (Nil!21796) (Cons!21795 (h!22993 (_ BitVec 64)) (t!30861 List!21799)) )
))
(declare-fun arrayNoDuplicates!0 (array!64584 (_ BitVec 32) List!21799) Bool)

(assert (=> b!1027151 (= lt!452057 (arrayNoDuplicates!0 (_keys!11226 thiss!1427) #b00000000000000000000000000000000 Nil!21796))))

(declare-fun mapIsEmpty!37829 () Bool)

(declare-fun mapRes!37829 () Bool)

(assert (=> mapIsEmpty!37829 mapRes!37829))

(declare-fun b!1027152 () Bool)

(declare-fun e!579615 () Bool)

(declare-fun tp_is_empty!24267 () Bool)

(assert (=> b!1027152 (= e!579615 tp_is_empty!24267)))

(declare-fun b!1027153 () Bool)

(declare-fun res!687533 () Bool)

(declare-fun e!579620 () Bool)

(assert (=> b!1027153 (=> (not res!687533) (not e!579620))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027153 (= res!687533 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027154 () Bool)

(declare-fun e!579622 () Bool)

(assert (=> b!1027154 (= e!579622 tp_is_empty!24267)))

(declare-fun e!579621 () Bool)

(declare-fun e!579619 () Bool)

(declare-fun array_inv!24081 (array!64584) Bool)

(declare-fun array_inv!24082 (array!64586) Bool)

(assert (=> b!1027155 (= e!579619 (and tp!72687 tp_is_empty!24267 (array_inv!24081 (_keys!11226 thiss!1427)) (array_inv!24082 (_values!6102 thiss!1427)) e!579621))))

(declare-fun res!687532 () Bool)

(assert (=> start!89548 (=> (not res!687532) (not e!579620))))

(declare-fun valid!2068 (LongMapFixedSize!5454) Bool)

(assert (=> start!89548 (= res!687532 (valid!2068 thiss!1427))))

(assert (=> start!89548 e!579620))

(assert (=> start!89548 e!579619))

(assert (=> start!89548 true))

(declare-fun b!1027156 () Bool)

(declare-fun e!579618 () Bool)

(assert (=> b!1027156 (= e!579620 e!579618)))

(declare-fun res!687536 () Bool)

(assert (=> b!1027156 (=> (not res!687536) (not e!579618))))

(declare-datatypes ((SeekEntryResult!9666 0))(
  ( (MissingZero!9666 (index!41035 (_ BitVec 32))) (Found!9666 (index!41036 (_ BitVec 32))) (Intermediate!9666 (undefined!10478 Bool) (index!41037 (_ BitVec 32)) (x!91392 (_ BitVec 32))) (Undefined!9666) (MissingVacant!9666 (index!41038 (_ BitVec 32))) )
))
(declare-fun lt!452058 () SeekEntryResult!9666)

(get-info :version)

(assert (=> b!1027156 (= res!687536 ((_ is Found!9666) lt!452058))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64584 (_ BitVec 32)) SeekEntryResult!9666)

(assert (=> b!1027156 (= lt!452058 (seekEntry!0 key!909 (_keys!11226 thiss!1427) (mask!29789 thiss!1427)))))

(declare-fun b!1027157 () Bool)

(assert (=> b!1027157 (= e!579621 (and e!579615 mapRes!37829))))

(declare-fun condMapEmpty!37829 () Bool)

(declare-fun mapDefault!37829 () ValueCell!11430)

(assert (=> b!1027157 (= condMapEmpty!37829 (= (arr!31102 (_values!6102 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11430)) mapDefault!37829)))))

(declare-fun b!1027158 () Bool)

(declare-fun res!687531 () Bool)

(assert (=> b!1027158 (=> res!687531 e!579617)))

(assert (=> b!1027158 (= res!687531 (or (not (= (size!31615 (_values!6102 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29789 thiss!1427)))) (not (= (size!31614 (_keys!11226 thiss!1427)) (size!31615 (_values!6102 thiss!1427)))) (bvslt (mask!29789 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5811 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5811 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027159 () Bool)

(declare-fun res!687534 () Bool)

(assert (=> b!1027159 (=> res!687534 e!579617)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64584 (_ BitVec 32)) Bool)

(assert (=> b!1027159 (= res!687534 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11226 thiss!1427) (mask!29789 thiss!1427))))))

(declare-fun b!1027160 () Bool)

(assert (=> b!1027160 (= e!579618 (not e!579617))))

(declare-fun res!687535 () Bool)

(assert (=> b!1027160 (=> res!687535 e!579617)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027160 (= res!687535 (not (validMask!0 (mask!29789 thiss!1427))))))

(declare-fun lt!452059 () array!64584)

(declare-fun arrayContainsKey!0 (array!64584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027160 (not (arrayContainsKey!0 lt!452059 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33471 0))(
  ( (Unit!33472) )
))
(declare-fun lt!452060 () Unit!33471)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64584 (_ BitVec 32) (_ BitVec 64)) Unit!33471)

(assert (=> b!1027160 (= lt!452060 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11226 thiss!1427) (index!41036 lt!452058) key!909))))

(assert (=> b!1027160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452059 (mask!29789 thiss!1427))))

(declare-fun lt!452056 () Unit!33471)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64584 (_ BitVec 32) (_ BitVec 32)) Unit!33471)

(assert (=> b!1027160 (= lt!452056 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11226 thiss!1427) (index!41036 lt!452058) (mask!29789 thiss!1427)))))

(assert (=> b!1027160 (arrayNoDuplicates!0 lt!452059 #b00000000000000000000000000000000 Nil!21796)))

(declare-fun lt!452061 () Unit!33471)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64584 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21799) Unit!33471)

(assert (=> b!1027160 (= lt!452061 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11226 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41036 lt!452058) #b00000000000000000000000000000000 Nil!21796))))

(declare-fun arrayCountValidKeys!0 (array!64584 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027160 (= (arrayCountValidKeys!0 lt!452059 #b00000000000000000000000000000000 (size!31614 (_keys!11226 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11226 thiss!1427) #b00000000000000000000000000000000 (size!31614 (_keys!11226 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027160 (= lt!452059 (array!64585 (store (arr!31101 (_keys!11226 thiss!1427)) (index!41036 lt!452058) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31614 (_keys!11226 thiss!1427))))))

(declare-fun lt!452055 () Unit!33471)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64584 (_ BitVec 32) (_ BitVec 64)) Unit!33471)

(assert (=> b!1027160 (= lt!452055 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11226 thiss!1427) (index!41036 lt!452058) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37829 () Bool)

(declare-fun tp!72686 () Bool)

(assert (=> mapNonEmpty!37829 (= mapRes!37829 (and tp!72686 e!579622))))

(declare-fun mapKey!37829 () (_ BitVec 32))

(declare-fun mapValue!37829 () ValueCell!11430)

(declare-fun mapRest!37829 () (Array (_ BitVec 32) ValueCell!11430))

(assert (=> mapNonEmpty!37829 (= (arr!31102 (_values!6102 thiss!1427)) (store mapRest!37829 mapKey!37829 mapValue!37829))))

(assert (= (and start!89548 res!687532) b!1027153))

(assert (= (and b!1027153 res!687533) b!1027156))

(assert (= (and b!1027156 res!687536) b!1027160))

(assert (= (and b!1027160 (not res!687535)) b!1027158))

(assert (= (and b!1027158 (not res!687531)) b!1027159))

(assert (= (and b!1027159 (not res!687534)) b!1027151))

(assert (= (and b!1027157 condMapEmpty!37829) mapIsEmpty!37829))

(assert (= (and b!1027157 (not condMapEmpty!37829)) mapNonEmpty!37829))

(assert (= (and mapNonEmpty!37829 ((_ is ValueCellFull!11430) mapValue!37829)) b!1027154))

(assert (= (and b!1027157 ((_ is ValueCellFull!11430) mapDefault!37829)) b!1027152))

(assert (= b!1027155 b!1027157))

(assert (= start!89548 b!1027155))

(declare-fun m!945559 () Bool)

(assert (=> b!1027159 m!945559))

(declare-fun m!945561 () Bool)

(assert (=> mapNonEmpty!37829 m!945561))

(declare-fun m!945563 () Bool)

(assert (=> start!89548 m!945563))

(declare-fun m!945565 () Bool)

(assert (=> b!1027160 m!945565))

(declare-fun m!945567 () Bool)

(assert (=> b!1027160 m!945567))

(declare-fun m!945569 () Bool)

(assert (=> b!1027160 m!945569))

(declare-fun m!945571 () Bool)

(assert (=> b!1027160 m!945571))

(declare-fun m!945573 () Bool)

(assert (=> b!1027160 m!945573))

(declare-fun m!945575 () Bool)

(assert (=> b!1027160 m!945575))

(declare-fun m!945577 () Bool)

(assert (=> b!1027160 m!945577))

(declare-fun m!945579 () Bool)

(assert (=> b!1027160 m!945579))

(declare-fun m!945581 () Bool)

(assert (=> b!1027160 m!945581))

(declare-fun m!945583 () Bool)

(assert (=> b!1027160 m!945583))

(declare-fun m!945585 () Bool)

(assert (=> b!1027160 m!945585))

(declare-fun m!945587 () Bool)

(assert (=> b!1027156 m!945587))

(declare-fun m!945589 () Bool)

(assert (=> b!1027155 m!945589))

(declare-fun m!945591 () Bool)

(assert (=> b!1027155 m!945591))

(declare-fun m!945593 () Bool)

(assert (=> b!1027151 m!945593))

(check-sat (not b!1027155) (not b!1027159) b_and!32793 (not b_next!20547) (not b!1027151) (not b!1027160) (not start!89548) (not b!1027156) tp_is_empty!24267 (not mapNonEmpty!37829))
(check-sat b_and!32793 (not b_next!20547))
