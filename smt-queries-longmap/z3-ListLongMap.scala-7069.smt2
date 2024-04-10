; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89470 () Bool)

(assert start!89470)

(declare-fun b!1026049 () Bool)

(declare-fun b_free!20469 () Bool)

(declare-fun b_next!20469 () Bool)

(assert (=> b!1026049 (= b_free!20469 (not b_next!20469))))

(declare-fun tp!72453 () Bool)

(declare-fun b_and!32715 () Bool)

(assert (=> b!1026049 (= tp!72453 b_and!32715)))

(declare-fun b!1026043 () Bool)

(declare-fun e!578682 () Bool)

(declare-fun tp_is_empty!24189 () Bool)

(assert (=> b!1026043 (= e!578682 tp_is_empty!24189)))

(declare-fun b!1026044 () Bool)

(declare-fun e!578681 () Bool)

(declare-fun e!578683 () Bool)

(declare-fun mapRes!37712 () Bool)

(assert (=> b!1026044 (= e!578681 (and e!578683 mapRes!37712))))

(declare-fun condMapEmpty!37712 () Bool)

(declare-datatypes ((V!37125 0))(
  ( (V!37126 (val!12145 Int)) )
))
(declare-datatypes ((ValueCell!11391 0))(
  ( (ValueCellFull!11391 (v!14714 V!37125)) (EmptyCell!11391) )
))
(declare-datatypes ((array!64428 0))(
  ( (array!64429 (arr!31023 (Array (_ BitVec 32) (_ BitVec 64))) (size!31536 (_ BitVec 32))) )
))
(declare-datatypes ((array!64430 0))(
  ( (array!64431 (arr!31024 (Array (_ BitVec 32) ValueCell!11391)) (size!31537 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5376 0))(
  ( (LongMapFixedSize!5377 (defaultEntry!6040 Int) (mask!29724 (_ BitVec 32)) (extraKeys!5772 (_ BitVec 32)) (zeroValue!5876 V!37125) (minValue!5876 V!37125) (_size!2743 (_ BitVec 32)) (_keys!11187 array!64428) (_values!6063 array!64430) (_vacant!2743 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5376)

(declare-fun mapDefault!37712 () ValueCell!11391)

(assert (=> b!1026044 (= condMapEmpty!37712 (= (arr!31024 (_values!6063 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11391)) mapDefault!37712)))))

(declare-fun mapIsEmpty!37712 () Bool)

(assert (=> mapIsEmpty!37712 mapRes!37712))

(declare-fun b!1026045 () Bool)

(declare-fun e!578679 () Bool)

(declare-fun e!578685 () Bool)

(assert (=> b!1026045 (= e!578679 (not e!578685))))

(declare-fun res!686892 () Bool)

(assert (=> b!1026045 (=> res!686892 e!578685)))

(declare-datatypes ((SeekEntryResult!9638 0))(
  ( (MissingZero!9638 (index!40923 (_ BitVec 32))) (Found!9638 (index!40924 (_ BitVec 32))) (Intermediate!9638 (undefined!10450 Bool) (index!40925 (_ BitVec 32)) (x!91260 (_ BitVec 32))) (Undefined!9638) (MissingVacant!9638 (index!40926 (_ BitVec 32))) )
))
(declare-fun lt!451269 () SeekEntryResult!9638)

(assert (=> b!1026045 (= res!686892 (or (bvslt (index!40924 lt!451269) #b00000000000000000000000000000000) (bvsge (index!40924 lt!451269) (size!31536 (_keys!11187 thiss!1427))) (bvsge (size!31536 (_keys!11187 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451268 () array!64428)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64428 (_ BitVec 32)) Bool)

(assert (=> b!1026045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451268 (mask!29724 thiss!1427))))

(declare-datatypes ((Unit!33421 0))(
  ( (Unit!33422) )
))
(declare-fun lt!451270 () Unit!33421)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64428 (_ BitVec 32) (_ BitVec 32)) Unit!33421)

(assert (=> b!1026045 (= lt!451270 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11187 thiss!1427) (index!40924 lt!451269) (mask!29724 thiss!1427)))))

(declare-datatypes ((List!21768 0))(
  ( (Nil!21765) (Cons!21764 (h!22962 (_ BitVec 64)) (t!30830 List!21768)) )
))
(declare-fun arrayNoDuplicates!0 (array!64428 (_ BitVec 32) List!21768) Bool)

(assert (=> b!1026045 (arrayNoDuplicates!0 lt!451268 #b00000000000000000000000000000000 Nil!21765)))

(declare-fun lt!451267 () Unit!33421)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64428 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21768) Unit!33421)

(assert (=> b!1026045 (= lt!451267 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11187 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40924 lt!451269) #b00000000000000000000000000000000 Nil!21765))))

(declare-fun arrayCountValidKeys!0 (array!64428 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026045 (= (arrayCountValidKeys!0 lt!451268 #b00000000000000000000000000000000 (size!31536 (_keys!11187 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11187 thiss!1427) #b00000000000000000000000000000000 (size!31536 (_keys!11187 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026045 (= lt!451268 (array!64429 (store (arr!31023 (_keys!11187 thiss!1427)) (index!40924 lt!451269) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31536 (_keys!11187 thiss!1427))))))

(declare-fun lt!451272 () Unit!33421)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64428 (_ BitVec 32) (_ BitVec 64)) Unit!33421)

(assert (=> b!1026045 (= lt!451272 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11187 thiss!1427) (index!40924 lt!451269) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026046 () Bool)

(assert (=> b!1026046 (= e!578685 true)))

(declare-fun lt!451271 () Bool)

(assert (=> b!1026046 (= lt!451271 (arrayNoDuplicates!0 (_keys!11187 thiss!1427) #b00000000000000000000000000000000 Nil!21765))))

(declare-fun b!1026047 () Bool)

(declare-fun res!686893 () Bool)

(declare-fun e!578686 () Bool)

(assert (=> b!1026047 (=> (not res!686893) (not e!578686))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026047 (= res!686893 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026048 () Bool)

(assert (=> b!1026048 (= e!578686 e!578679)))

(declare-fun res!686891 () Bool)

(assert (=> b!1026048 (=> (not res!686891) (not e!578679))))

(get-info :version)

(assert (=> b!1026048 (= res!686891 ((_ is Found!9638) lt!451269))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64428 (_ BitVec 32)) SeekEntryResult!9638)

(assert (=> b!1026048 (= lt!451269 (seekEntry!0 key!909 (_keys!11187 thiss!1427) (mask!29724 thiss!1427)))))

(declare-fun e!578684 () Bool)

(declare-fun array_inv!24027 (array!64428) Bool)

(declare-fun array_inv!24028 (array!64430) Bool)

(assert (=> b!1026049 (= e!578684 (and tp!72453 tp_is_empty!24189 (array_inv!24027 (_keys!11187 thiss!1427)) (array_inv!24028 (_values!6063 thiss!1427)) e!578681))))

(declare-fun res!686894 () Bool)

(assert (=> start!89470 (=> (not res!686894) (not e!578686))))

(declare-fun valid!2044 (LongMapFixedSize!5376) Bool)

(assert (=> start!89470 (= res!686894 (valid!2044 thiss!1427))))

(assert (=> start!89470 e!578686))

(assert (=> start!89470 e!578684))

(assert (=> start!89470 true))

(declare-fun b!1026050 () Bool)

(assert (=> b!1026050 (= e!578683 tp_is_empty!24189)))

(declare-fun mapNonEmpty!37712 () Bool)

(declare-fun tp!72452 () Bool)

(assert (=> mapNonEmpty!37712 (= mapRes!37712 (and tp!72452 e!578682))))

(declare-fun mapKey!37712 () (_ BitVec 32))

(declare-fun mapRest!37712 () (Array (_ BitVec 32) ValueCell!11391))

(declare-fun mapValue!37712 () ValueCell!11391)

(assert (=> mapNonEmpty!37712 (= (arr!31024 (_values!6063 thiss!1427)) (store mapRest!37712 mapKey!37712 mapValue!37712))))

(assert (= (and start!89470 res!686894) b!1026047))

(assert (= (and b!1026047 res!686893) b!1026048))

(assert (= (and b!1026048 res!686891) b!1026045))

(assert (= (and b!1026045 (not res!686892)) b!1026046))

(assert (= (and b!1026044 condMapEmpty!37712) mapIsEmpty!37712))

(assert (= (and b!1026044 (not condMapEmpty!37712)) mapNonEmpty!37712))

(assert (= (and mapNonEmpty!37712 ((_ is ValueCellFull!11391) mapValue!37712)) b!1026043))

(assert (= (and b!1026044 ((_ is ValueCellFull!11391) mapDefault!37712)) b!1026050))

(assert (= b!1026049 b!1026044))

(assert (= start!89470 b!1026049))

(declare-fun m!944243 () Bool)

(assert (=> start!89470 m!944243))

(declare-fun m!944245 () Bool)

(assert (=> b!1026048 m!944245))

(declare-fun m!944247 () Bool)

(assert (=> b!1026046 m!944247))

(declare-fun m!944249 () Bool)

(assert (=> b!1026045 m!944249))

(declare-fun m!944251 () Bool)

(assert (=> b!1026045 m!944251))

(declare-fun m!944253 () Bool)

(assert (=> b!1026045 m!944253))

(declare-fun m!944255 () Bool)

(assert (=> b!1026045 m!944255))

(declare-fun m!944257 () Bool)

(assert (=> b!1026045 m!944257))

(declare-fun m!944259 () Bool)

(assert (=> b!1026045 m!944259))

(declare-fun m!944261 () Bool)

(assert (=> b!1026045 m!944261))

(declare-fun m!944263 () Bool)

(assert (=> b!1026045 m!944263))

(declare-fun m!944265 () Bool)

(assert (=> mapNonEmpty!37712 m!944265))

(declare-fun m!944267 () Bool)

(assert (=> b!1026049 m!944267))

(declare-fun m!944269 () Bool)

(assert (=> b!1026049 m!944269))

(check-sat tp_is_empty!24189 (not b!1026046) (not b_next!20469) b_and!32715 (not mapNonEmpty!37712) (not b!1026048) (not b!1026045) (not b!1026049) (not start!89470))
(check-sat b_and!32715 (not b_next!20469))
