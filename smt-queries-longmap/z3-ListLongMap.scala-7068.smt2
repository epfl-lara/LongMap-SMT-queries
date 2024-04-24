; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89696 () Bool)

(assert start!89696)

(declare-fun b!1027266 () Bool)

(declare-fun b_free!20461 () Bool)

(declare-fun b_next!20461 () Bool)

(assert (=> b!1027266 (= b_free!20461 (not b_next!20461))))

(declare-fun tp!72428 () Bool)

(declare-fun b_and!32717 () Bool)

(assert (=> b!1027266 (= tp!72428 b_and!32717)))

(declare-fun b!1027262 () Bool)

(declare-fun res!687355 () Bool)

(declare-fun e!579426 () Bool)

(assert (=> b!1027262 (=> (not res!687355) (not e!579426))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027262 (= res!687355 (not (= key!909 (bvneg key!909))))))

(declare-fun res!687356 () Bool)

(assert (=> start!89696 (=> (not res!687356) (not e!579426))))

(declare-datatypes ((V!37115 0))(
  ( (V!37116 (val!12141 Int)) )
))
(declare-datatypes ((ValueCell!11387 0))(
  ( (ValueCellFull!11387 (v!14706 V!37115)) (EmptyCell!11387) )
))
(declare-datatypes ((array!64461 0))(
  ( (array!64462 (arr!31033 (Array (_ BitVec 32) (_ BitVec 64))) (size!31547 (_ BitVec 32))) )
))
(declare-datatypes ((array!64463 0))(
  ( (array!64464 (arr!31034 (Array (_ BitVec 32) ValueCell!11387)) (size!31548 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5368 0))(
  ( (LongMapFixedSize!5369 (defaultEntry!6036 Int) (mask!29778 (_ BitVec 32)) (extraKeys!5768 (_ BitVec 32)) (zeroValue!5872 V!37115) (minValue!5872 V!37115) (_size!2739 (_ BitVec 32)) (_keys!11221 array!64461) (_values!6059 array!64463) (_vacant!2739 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5368)

(declare-fun valid!2048 (LongMapFixedSize!5368) Bool)

(assert (=> start!89696 (= res!687356 (valid!2048 thiss!1427))))

(assert (=> start!89696 e!579426))

(declare-fun e!579429 () Bool)

(assert (=> start!89696 e!579429))

(assert (=> start!89696 true))

(declare-fun b!1027263 () Bool)

(declare-fun e!579427 () Bool)

(declare-fun e!579433 () Bool)

(declare-fun mapRes!37700 () Bool)

(assert (=> b!1027263 (= e!579427 (and e!579433 mapRes!37700))))

(declare-fun condMapEmpty!37700 () Bool)

(declare-fun mapDefault!37700 () ValueCell!11387)

(assert (=> b!1027263 (= condMapEmpty!37700 (= (arr!31034 (_values!6059 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11387)) mapDefault!37700)))))

(declare-fun b!1027264 () Bool)

(declare-fun tp_is_empty!24181 () Bool)

(assert (=> b!1027264 (= e!579433 tp_is_empty!24181)))

(declare-fun b!1027265 () Bool)

(declare-fun e!579432 () Bool)

(assert (=> b!1027265 (= e!579426 e!579432)))

(declare-fun res!687354 () Bool)

(assert (=> b!1027265 (=> (not res!687354) (not e!579432))))

(declare-datatypes ((SeekEntryResult!9588 0))(
  ( (MissingZero!9588 (index!40723 (_ BitVec 32))) (Found!9588 (index!40724 (_ BitVec 32))) (Intermediate!9588 (undefined!10400 Bool) (index!40725 (_ BitVec 32)) (x!91224 (_ BitVec 32))) (Undefined!9588) (MissingVacant!9588 (index!40726 (_ BitVec 32))) )
))
(declare-fun lt!451710 () SeekEntryResult!9588)

(get-info :version)

(assert (=> b!1027265 (= res!687354 ((_ is Found!9588) lt!451710))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64461 (_ BitVec 32)) SeekEntryResult!9588)

(assert (=> b!1027265 (= lt!451710 (seekEntry!0 key!909 (_keys!11221 thiss!1427) (mask!29778 thiss!1427)))))

(declare-fun mapIsEmpty!37700 () Bool)

(assert (=> mapIsEmpty!37700 mapRes!37700))

(declare-fun array_inv!24051 (array!64461) Bool)

(declare-fun array_inv!24052 (array!64463) Bool)

(assert (=> b!1027266 (= e!579429 (and tp!72428 tp_is_empty!24181 (array_inv!24051 (_keys!11221 thiss!1427)) (array_inv!24052 (_values!6059 thiss!1427)) e!579427))))

(declare-fun mapNonEmpty!37700 () Bool)

(declare-fun tp!72429 () Bool)

(declare-fun e!579431 () Bool)

(assert (=> mapNonEmpty!37700 (= mapRes!37700 (and tp!72429 e!579431))))

(declare-fun mapRest!37700 () (Array (_ BitVec 32) ValueCell!11387))

(declare-fun mapKey!37700 () (_ BitVec 32))

(declare-fun mapValue!37700 () ValueCell!11387)

(assert (=> mapNonEmpty!37700 (= (arr!31034 (_values!6059 thiss!1427)) (store mapRest!37700 mapKey!37700 mapValue!37700))))

(declare-fun b!1027267 () Bool)

(assert (=> b!1027267 (= e!579431 tp_is_empty!24181)))

(declare-fun b!1027268 () Bool)

(declare-fun e!579428 () Bool)

(assert (=> b!1027268 (= e!579428 true)))

(declare-fun lt!451712 () Bool)

(declare-datatypes ((List!21753 0))(
  ( (Nil!21750) (Cons!21749 (h!22956 (_ BitVec 64)) (t!30807 List!21753)) )
))
(declare-fun arrayNoDuplicates!0 (array!64461 (_ BitVec 32) List!21753) Bool)

(assert (=> b!1027268 (= lt!451712 (arrayNoDuplicates!0 (_keys!11221 thiss!1427) #b00000000000000000000000000000000 Nil!21750))))

(declare-fun b!1027269 () Bool)

(assert (=> b!1027269 (= e!579432 (not e!579428))))

(declare-fun res!687353 () Bool)

(assert (=> b!1027269 (=> res!687353 e!579428)))

(assert (=> b!1027269 (= res!687353 (or (bvslt (index!40724 lt!451710) #b00000000000000000000000000000000) (bvsge (index!40724 lt!451710) (size!31547 (_keys!11221 thiss!1427))) (bvsge (size!31547 (_keys!11221 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451711 () array!64461)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64461 (_ BitVec 32)) Bool)

(assert (=> b!1027269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451711 (mask!29778 thiss!1427))))

(declare-datatypes ((Unit!33424 0))(
  ( (Unit!33425) )
))
(declare-fun lt!451715 () Unit!33424)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64461 (_ BitVec 32) (_ BitVec 32)) Unit!33424)

(assert (=> b!1027269 (= lt!451715 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11221 thiss!1427) (index!40724 lt!451710) (mask!29778 thiss!1427)))))

(assert (=> b!1027269 (arrayNoDuplicates!0 lt!451711 #b00000000000000000000000000000000 Nil!21750)))

(declare-fun lt!451714 () Unit!33424)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64461 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21753) Unit!33424)

(assert (=> b!1027269 (= lt!451714 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11221 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40724 lt!451710) #b00000000000000000000000000000000 Nil!21750))))

(declare-fun arrayCountValidKeys!0 (array!64461 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027269 (= (arrayCountValidKeys!0 lt!451711 #b00000000000000000000000000000000 (size!31547 (_keys!11221 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11221 thiss!1427) #b00000000000000000000000000000000 (size!31547 (_keys!11221 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027269 (= lt!451711 (array!64462 (store (arr!31033 (_keys!11221 thiss!1427)) (index!40724 lt!451710) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31547 (_keys!11221 thiss!1427))))))

(declare-fun lt!451713 () Unit!33424)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64461 (_ BitVec 32) (_ BitVec 64)) Unit!33424)

(assert (=> b!1027269 (= lt!451713 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11221 thiss!1427) (index!40724 lt!451710) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89696 res!687356) b!1027262))

(assert (= (and b!1027262 res!687355) b!1027265))

(assert (= (and b!1027265 res!687354) b!1027269))

(assert (= (and b!1027269 (not res!687353)) b!1027268))

(assert (= (and b!1027263 condMapEmpty!37700) mapIsEmpty!37700))

(assert (= (and b!1027263 (not condMapEmpty!37700)) mapNonEmpty!37700))

(assert (= (and mapNonEmpty!37700 ((_ is ValueCellFull!11387) mapValue!37700)) b!1027267))

(assert (= (and b!1027263 ((_ is ValueCellFull!11387) mapDefault!37700)) b!1027264))

(assert (= b!1027266 b!1027263))

(assert (= start!89696 b!1027266))

(declare-fun m!945795 () Bool)

(assert (=> b!1027265 m!945795))

(declare-fun m!945797 () Bool)

(assert (=> b!1027266 m!945797))

(declare-fun m!945799 () Bool)

(assert (=> b!1027266 m!945799))

(declare-fun m!945801 () Bool)

(assert (=> b!1027269 m!945801))

(declare-fun m!945803 () Bool)

(assert (=> b!1027269 m!945803))

(declare-fun m!945805 () Bool)

(assert (=> b!1027269 m!945805))

(declare-fun m!945807 () Bool)

(assert (=> b!1027269 m!945807))

(declare-fun m!945809 () Bool)

(assert (=> b!1027269 m!945809))

(declare-fun m!945811 () Bool)

(assert (=> b!1027269 m!945811))

(declare-fun m!945813 () Bool)

(assert (=> b!1027269 m!945813))

(declare-fun m!945815 () Bool)

(assert (=> b!1027269 m!945815))

(declare-fun m!945817 () Bool)

(assert (=> mapNonEmpty!37700 m!945817))

(declare-fun m!945819 () Bool)

(assert (=> start!89696 m!945819))

(declare-fun m!945821 () Bool)

(assert (=> b!1027268 m!945821))

(check-sat (not b!1027266) b_and!32717 (not b_next!20461) (not start!89696) (not b!1027269) (not b!1027268) (not b!1027265) (not mapNonEmpty!37700) tp_is_empty!24181)
(check-sat b_and!32717 (not b_next!20461))
