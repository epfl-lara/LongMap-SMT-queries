; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89600 () Bool)

(assert start!89600)

(declare-fun b!1025713 () Bool)

(declare-fun b_free!20365 () Bool)

(declare-fun b_next!20365 () Bool)

(assert (=> b!1025713 (= b_free!20365 (not b_next!20365))))

(declare-fun tp!72141 () Bool)

(declare-fun b_and!32621 () Bool)

(assert (=> b!1025713 (= tp!72141 b_and!32621)))

(declare-fun res!686381 () Bool)

(declare-fun e!578280 () Bool)

(assert (=> start!89600 (=> (not res!686381) (not e!578280))))

(declare-datatypes ((V!36987 0))(
  ( (V!36988 (val!12093 Int)) )
))
(declare-datatypes ((ValueCell!11339 0))(
  ( (ValueCellFull!11339 (v!14658 V!36987)) (EmptyCell!11339) )
))
(declare-datatypes ((array!64269 0))(
  ( (array!64270 (arr!30937 (Array (_ BitVec 32) (_ BitVec 64))) (size!31451 (_ BitVec 32))) )
))
(declare-datatypes ((array!64271 0))(
  ( (array!64272 (arr!30938 (Array (_ BitVec 32) ValueCell!11339)) (size!31452 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5272 0))(
  ( (LongMapFixedSize!5273 (defaultEntry!5988 Int) (mask!29698 (_ BitVec 32)) (extraKeys!5720 (_ BitVec 32)) (zeroValue!5824 V!36987) (minValue!5824 V!36987) (_size!2691 (_ BitVec 32)) (_keys!11173 array!64269) (_values!6011 array!64271) (_vacant!2691 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5272)

(declare-fun valid!2011 (LongMapFixedSize!5272) Bool)

(assert (=> start!89600 (= res!686381 (valid!2011 thiss!1427))))

(assert (=> start!89600 e!578280))

(declare-fun e!578279 () Bool)

(assert (=> start!89600 e!578279))

(assert (=> start!89600 true))

(declare-fun b!1025711 () Bool)

(declare-fun e!578277 () Bool)

(declare-fun e!578281 () Bool)

(assert (=> b!1025711 (= e!578277 (not e!578281))))

(declare-fun res!686380 () Bool)

(assert (=> b!1025711 (=> res!686380 e!578281)))

(assert (=> b!1025711 (= res!686380 (or (bvsge (size!31451 (_keys!11173 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31451 (_keys!11173 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9548 0))(
  ( (MissingZero!9548 (index!40563 (_ BitVec 32))) (Found!9548 (index!40564 (_ BitVec 32))) (Intermediate!9548 (undefined!10360 Bool) (index!40565 (_ BitVec 32)) (x!91056 (_ BitVec 32))) (Undefined!9548) (MissingVacant!9548 (index!40566 (_ BitVec 32))) )
))
(declare-fun lt!451120 () SeekEntryResult!9548)

(declare-fun arrayCountValidKeys!0 (array!64269 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025711 (= (arrayCountValidKeys!0 (array!64270 (store (arr!30937 (_keys!11173 thiss!1427)) (index!40564 lt!451120) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31451 (_keys!11173 thiss!1427))) #b00000000000000000000000000000000 (size!31451 (_keys!11173 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11173 thiss!1427) #b00000000000000000000000000000000 (size!31451 (_keys!11173 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33352 0))(
  ( (Unit!33353) )
))
(declare-fun lt!451119 () Unit!33352)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64269 (_ BitVec 32) (_ BitVec 64)) Unit!33352)

(assert (=> b!1025711 (= lt!451119 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11173 thiss!1427) (index!40564 lt!451120) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025712 () Bool)

(declare-fun res!686382 () Bool)

(assert (=> b!1025712 (=> res!686382 e!578281)))

(declare-datatypes ((List!21715 0))(
  ( (Nil!21712) (Cons!21711 (h!22918 (_ BitVec 64)) (t!30769 List!21715)) )
))
(declare-fun contains!5968 (List!21715 (_ BitVec 64)) Bool)

(assert (=> b!1025712 (= res!686382 (contains!5968 Nil!21712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!578278 () Bool)

(declare-fun tp_is_empty!24085 () Bool)

(declare-fun array_inv!23981 (array!64269) Bool)

(declare-fun array_inv!23982 (array!64271) Bool)

(assert (=> b!1025713 (= e!578279 (and tp!72141 tp_is_empty!24085 (array_inv!23981 (_keys!11173 thiss!1427)) (array_inv!23982 (_values!6011 thiss!1427)) e!578278))))

(declare-fun b!1025714 () Bool)

(declare-fun e!578274 () Bool)

(declare-fun mapRes!37556 () Bool)

(assert (=> b!1025714 (= e!578278 (and e!578274 mapRes!37556))))

(declare-fun condMapEmpty!37556 () Bool)

(declare-fun mapDefault!37556 () ValueCell!11339)

(assert (=> b!1025714 (= condMapEmpty!37556 (= (arr!30938 (_values!6011 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11339)) mapDefault!37556)))))

(declare-fun b!1025715 () Bool)

(declare-fun res!686384 () Bool)

(assert (=> b!1025715 (=> res!686384 e!578281)))

(assert (=> b!1025715 (= res!686384 (contains!5968 Nil!21712 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025716 () Bool)

(assert (=> b!1025716 (= e!578280 e!578277)))

(declare-fun res!686378 () Bool)

(assert (=> b!1025716 (=> (not res!686378) (not e!578277))))

(get-info :version)

(assert (=> b!1025716 (= res!686378 ((_ is Found!9548) lt!451120))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64269 (_ BitVec 32)) SeekEntryResult!9548)

(assert (=> b!1025716 (= lt!451120 (seekEntry!0 key!909 (_keys!11173 thiss!1427) (mask!29698 thiss!1427)))))

(declare-fun b!1025717 () Bool)

(declare-fun res!686383 () Bool)

(assert (=> b!1025717 (=> res!686383 e!578281)))

(declare-fun noDuplicate!1472 (List!21715) Bool)

(assert (=> b!1025717 (= res!686383 (not (noDuplicate!1472 Nil!21712)))))

(declare-fun mapNonEmpty!37556 () Bool)

(declare-fun tp!72140 () Bool)

(declare-fun e!578276 () Bool)

(assert (=> mapNonEmpty!37556 (= mapRes!37556 (and tp!72140 e!578276))))

(declare-fun mapRest!37556 () (Array (_ BitVec 32) ValueCell!11339))

(declare-fun mapValue!37556 () ValueCell!11339)

(declare-fun mapKey!37556 () (_ BitVec 32))

(assert (=> mapNonEmpty!37556 (= (arr!30938 (_values!6011 thiss!1427)) (store mapRest!37556 mapKey!37556 mapValue!37556))))

(declare-fun b!1025718 () Bool)

(assert (=> b!1025718 (= e!578274 tp_is_empty!24085)))

(declare-fun b!1025719 () Bool)

(assert (=> b!1025719 (= e!578281 true)))

(declare-fun lt!451121 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64269 (_ BitVec 32) List!21715) Bool)

(assert (=> b!1025719 (= lt!451121 (arrayNoDuplicates!0 (_keys!11173 thiss!1427) #b00000000000000000000000000000000 Nil!21712))))

(declare-fun b!1025720 () Bool)

(declare-fun res!686379 () Bool)

(assert (=> b!1025720 (=> (not res!686379) (not e!578280))))

(assert (=> b!1025720 (= res!686379 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025721 () Bool)

(assert (=> b!1025721 (= e!578276 tp_is_empty!24085)))

(declare-fun mapIsEmpty!37556 () Bool)

(assert (=> mapIsEmpty!37556 mapRes!37556))

(assert (= (and start!89600 res!686381) b!1025720))

(assert (= (and b!1025720 res!686379) b!1025716))

(assert (= (and b!1025716 res!686378) b!1025711))

(assert (= (and b!1025711 (not res!686380)) b!1025717))

(assert (= (and b!1025717 (not res!686383)) b!1025712))

(assert (= (and b!1025712 (not res!686382)) b!1025715))

(assert (= (and b!1025715 (not res!686384)) b!1025719))

(assert (= (and b!1025714 condMapEmpty!37556) mapIsEmpty!37556))

(assert (= (and b!1025714 (not condMapEmpty!37556)) mapNonEmpty!37556))

(assert (= (and mapNonEmpty!37556 ((_ is ValueCellFull!11339) mapValue!37556)) b!1025721))

(assert (= (and b!1025714 ((_ is ValueCellFull!11339) mapDefault!37556)) b!1025718))

(assert (= b!1025713 b!1025714))

(assert (= start!89600 b!1025713))

(declare-fun m!944415 () Bool)

(assert (=> start!89600 m!944415))

(declare-fun m!944417 () Bool)

(assert (=> mapNonEmpty!37556 m!944417))

(declare-fun m!944419 () Bool)

(assert (=> b!1025719 m!944419))

(declare-fun m!944421 () Bool)

(assert (=> b!1025716 m!944421))

(declare-fun m!944423 () Bool)

(assert (=> b!1025717 m!944423))

(declare-fun m!944425 () Bool)

(assert (=> b!1025711 m!944425))

(declare-fun m!944427 () Bool)

(assert (=> b!1025711 m!944427))

(declare-fun m!944429 () Bool)

(assert (=> b!1025711 m!944429))

(declare-fun m!944431 () Bool)

(assert (=> b!1025711 m!944431))

(declare-fun m!944433 () Bool)

(assert (=> b!1025713 m!944433))

(declare-fun m!944435 () Bool)

(assert (=> b!1025713 m!944435))

(declare-fun m!944437 () Bool)

(assert (=> b!1025712 m!944437))

(declare-fun m!944439 () Bool)

(assert (=> b!1025715 m!944439))

(check-sat (not b!1025715) (not b!1025711) (not mapNonEmpty!37556) (not b!1025717) (not b!1025713) tp_is_empty!24085 (not start!89600) (not b_next!20365) (not b!1025712) b_and!32621 (not b!1025719) (not b!1025716))
(check-sat b_and!32621 (not b_next!20365))
