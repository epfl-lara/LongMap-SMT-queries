; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89690 () Bool)

(assert start!89690)

(declare-fun b!1027192 () Bool)

(declare-fun b_free!20455 () Bool)

(declare-fun b_next!20455 () Bool)

(assert (=> b!1027192 (= b_free!20455 (not b_next!20455))))

(declare-fun tp!72410 () Bool)

(declare-fun b_and!32711 () Bool)

(assert (=> b!1027192 (= tp!72410 b_and!32711)))

(declare-fun mapNonEmpty!37691 () Bool)

(declare-fun mapRes!37691 () Bool)

(declare-fun tp!72411 () Bool)

(declare-fun e!579359 () Bool)

(assert (=> mapNonEmpty!37691 (= mapRes!37691 (and tp!72411 e!579359))))

(declare-fun mapKey!37691 () (_ BitVec 32))

(declare-datatypes ((V!37107 0))(
  ( (V!37108 (val!12138 Int)) )
))
(declare-datatypes ((ValueCell!11384 0))(
  ( (ValueCellFull!11384 (v!14703 V!37107)) (EmptyCell!11384) )
))
(declare-fun mapValue!37691 () ValueCell!11384)

(declare-fun mapRest!37691 () (Array (_ BitVec 32) ValueCell!11384))

(declare-datatypes ((array!64449 0))(
  ( (array!64450 (arr!31027 (Array (_ BitVec 32) (_ BitVec 64))) (size!31541 (_ BitVec 32))) )
))
(declare-datatypes ((array!64451 0))(
  ( (array!64452 (arr!31028 (Array (_ BitVec 32) ValueCell!11384)) (size!31542 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5362 0))(
  ( (LongMapFixedSize!5363 (defaultEntry!6033 Int) (mask!29773 (_ BitVec 32)) (extraKeys!5765 (_ BitVec 32)) (zeroValue!5869 V!37107) (minValue!5869 V!37107) (_size!2736 (_ BitVec 32)) (_keys!11218 array!64449) (_values!6056 array!64451) (_vacant!2736 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5362)

(assert (=> mapNonEmpty!37691 (= (arr!31028 (_values!6056 thiss!1427)) (store mapRest!37691 mapKey!37691 mapValue!37691))))

(declare-fun res!687318 () Bool)

(declare-fun e!579354 () Bool)

(assert (=> start!89690 (=> (not res!687318) (not e!579354))))

(declare-fun valid!2045 (LongMapFixedSize!5362) Bool)

(assert (=> start!89690 (= res!687318 (valid!2045 thiss!1427))))

(assert (=> start!89690 e!579354))

(declare-fun e!579360 () Bool)

(assert (=> start!89690 e!579360))

(assert (=> start!89690 true))

(declare-fun b!1027190 () Bool)

(declare-fun e!579358 () Bool)

(assert (=> b!1027190 (= e!579358 true)))

(declare-fun lt!451659 () Bool)

(declare-datatypes ((List!21750 0))(
  ( (Nil!21747) (Cons!21746 (h!22953 (_ BitVec 64)) (t!30804 List!21750)) )
))
(declare-fun arrayNoDuplicates!0 (array!64449 (_ BitVec 32) List!21750) Bool)

(assert (=> b!1027190 (= lt!451659 (arrayNoDuplicates!0 (_keys!11218 thiss!1427) #b00000000000000000000000000000000 Nil!21747))))

(declare-fun b!1027191 () Bool)

(declare-fun e!579357 () Bool)

(assert (=> b!1027191 (= e!579357 (not e!579358))))

(declare-fun res!687317 () Bool)

(assert (=> b!1027191 (=> res!687317 e!579358)))

(declare-datatypes ((SeekEntryResult!9586 0))(
  ( (MissingZero!9586 (index!40715 (_ BitVec 32))) (Found!9586 (index!40716 (_ BitVec 32))) (Intermediate!9586 (undefined!10398 Bool) (index!40717 (_ BitVec 32)) (x!91214 (_ BitVec 32))) (Undefined!9586) (MissingVacant!9586 (index!40718 (_ BitVec 32))) )
))
(declare-fun lt!451657 () SeekEntryResult!9586)

(assert (=> b!1027191 (= res!687317 (or (bvslt (index!40716 lt!451657) #b00000000000000000000000000000000) (bvsge (index!40716 lt!451657) (size!31541 (_keys!11218 thiss!1427))) (bvsge (size!31541 (_keys!11218 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451656 () array!64449)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64449 (_ BitVec 32)) Bool)

(assert (=> b!1027191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451656 (mask!29773 thiss!1427))))

(declare-datatypes ((Unit!33420 0))(
  ( (Unit!33421) )
))
(declare-fun lt!451660 () Unit!33420)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64449 (_ BitVec 32) (_ BitVec 32)) Unit!33420)

(assert (=> b!1027191 (= lt!451660 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11218 thiss!1427) (index!40716 lt!451657) (mask!29773 thiss!1427)))))

(assert (=> b!1027191 (arrayNoDuplicates!0 lt!451656 #b00000000000000000000000000000000 Nil!21747)))

(declare-fun lt!451658 () Unit!33420)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64449 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21750) Unit!33420)

(assert (=> b!1027191 (= lt!451658 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11218 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40716 lt!451657) #b00000000000000000000000000000000 Nil!21747))))

(declare-fun arrayCountValidKeys!0 (array!64449 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027191 (= (arrayCountValidKeys!0 lt!451656 #b00000000000000000000000000000000 (size!31541 (_keys!11218 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11218 thiss!1427) #b00000000000000000000000000000000 (size!31541 (_keys!11218 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027191 (= lt!451656 (array!64450 (store (arr!31027 (_keys!11218 thiss!1427)) (index!40716 lt!451657) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31541 (_keys!11218 thiss!1427))))))

(declare-fun lt!451661 () Unit!33420)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64449 (_ BitVec 32) (_ BitVec 64)) Unit!33420)

(assert (=> b!1027191 (= lt!451661 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11218 thiss!1427) (index!40716 lt!451657) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun tp_is_empty!24175 () Bool)

(declare-fun e!579355 () Bool)

(declare-fun array_inv!24049 (array!64449) Bool)

(declare-fun array_inv!24050 (array!64451) Bool)

(assert (=> b!1027192 (= e!579360 (and tp!72410 tp_is_empty!24175 (array_inv!24049 (_keys!11218 thiss!1427)) (array_inv!24050 (_values!6056 thiss!1427)) e!579355))))

(declare-fun b!1027193 () Bool)

(assert (=> b!1027193 (= e!579359 tp_is_empty!24175)))

(declare-fun b!1027194 () Bool)

(declare-fun e!579361 () Bool)

(assert (=> b!1027194 (= e!579361 tp_is_empty!24175)))

(declare-fun b!1027195 () Bool)

(assert (=> b!1027195 (= e!579355 (and e!579361 mapRes!37691))))

(declare-fun condMapEmpty!37691 () Bool)

(declare-fun mapDefault!37691 () ValueCell!11384)

(assert (=> b!1027195 (= condMapEmpty!37691 (= (arr!31028 (_values!6056 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11384)) mapDefault!37691)))))

(declare-fun b!1027196 () Bool)

(assert (=> b!1027196 (= e!579354 e!579357)))

(declare-fun res!687319 () Bool)

(assert (=> b!1027196 (=> (not res!687319) (not e!579357))))

(get-info :version)

(assert (=> b!1027196 (= res!687319 ((_ is Found!9586) lt!451657))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64449 (_ BitVec 32)) SeekEntryResult!9586)

(assert (=> b!1027196 (= lt!451657 (seekEntry!0 key!909 (_keys!11218 thiss!1427) (mask!29773 thiss!1427)))))

(declare-fun mapIsEmpty!37691 () Bool)

(assert (=> mapIsEmpty!37691 mapRes!37691))

(declare-fun b!1027197 () Bool)

(declare-fun res!687320 () Bool)

(assert (=> b!1027197 (=> (not res!687320) (not e!579354))))

(assert (=> b!1027197 (= res!687320 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!89690 res!687318) b!1027197))

(assert (= (and b!1027197 res!687320) b!1027196))

(assert (= (and b!1027196 res!687319) b!1027191))

(assert (= (and b!1027191 (not res!687317)) b!1027190))

(assert (= (and b!1027195 condMapEmpty!37691) mapIsEmpty!37691))

(assert (= (and b!1027195 (not condMapEmpty!37691)) mapNonEmpty!37691))

(assert (= (and mapNonEmpty!37691 ((_ is ValueCellFull!11384) mapValue!37691)) b!1027193))

(assert (= (and b!1027195 ((_ is ValueCellFull!11384) mapDefault!37691)) b!1027194))

(assert (= b!1027192 b!1027195))

(assert (= start!89690 b!1027192))

(declare-fun m!945711 () Bool)

(assert (=> start!89690 m!945711))

(declare-fun m!945713 () Bool)

(assert (=> b!1027191 m!945713))

(declare-fun m!945715 () Bool)

(assert (=> b!1027191 m!945715))

(declare-fun m!945717 () Bool)

(assert (=> b!1027191 m!945717))

(declare-fun m!945719 () Bool)

(assert (=> b!1027191 m!945719))

(declare-fun m!945721 () Bool)

(assert (=> b!1027191 m!945721))

(declare-fun m!945723 () Bool)

(assert (=> b!1027191 m!945723))

(declare-fun m!945725 () Bool)

(assert (=> b!1027191 m!945725))

(declare-fun m!945727 () Bool)

(assert (=> b!1027191 m!945727))

(declare-fun m!945729 () Bool)

(assert (=> mapNonEmpty!37691 m!945729))

(declare-fun m!945731 () Bool)

(assert (=> b!1027196 m!945731))

(declare-fun m!945733 () Bool)

(assert (=> b!1027192 m!945733))

(declare-fun m!945735 () Bool)

(assert (=> b!1027192 m!945735))

(declare-fun m!945737 () Bool)

(assert (=> b!1027190 m!945737))

(check-sat (not b!1027191) (not b!1027192) (not b!1027196) (not b!1027190) (not mapNonEmpty!37691) tp_is_empty!24175 b_and!32711 (not b_next!20455) (not start!89690))
(check-sat b_and!32711 (not b_next!20455))
