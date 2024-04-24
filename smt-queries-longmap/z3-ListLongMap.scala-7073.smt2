; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89726 () Bool)

(assert start!89726)

(declare-fun b!1027626 () Bool)

(declare-fun b_free!20491 () Bool)

(declare-fun b_next!20491 () Bool)

(assert (=> b!1027626 (= b_free!20491 (not b_next!20491))))

(declare-fun tp!72518 () Bool)

(declare-fun b_and!32747 () Bool)

(assert (=> b!1027626 (= tp!72518 b_and!32747)))

(declare-fun tp_is_empty!24211 () Bool)

(declare-fun e!579790 () Bool)

(declare-datatypes ((V!37155 0))(
  ( (V!37156 (val!12156 Int)) )
))
(declare-datatypes ((ValueCell!11402 0))(
  ( (ValueCellFull!11402 (v!14721 V!37155)) (EmptyCell!11402) )
))
(declare-datatypes ((array!64521 0))(
  ( (array!64522 (arr!31063 (Array (_ BitVec 32) (_ BitVec 64))) (size!31577 (_ BitVec 32))) )
))
(declare-datatypes ((array!64523 0))(
  ( (array!64524 (arr!31064 (Array (_ BitVec 32) ValueCell!11402)) (size!31578 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5398 0))(
  ( (LongMapFixedSize!5399 (defaultEntry!6051 Int) (mask!29803 (_ BitVec 32)) (extraKeys!5783 (_ BitVec 32)) (zeroValue!5887 V!37155) (minValue!5887 V!37155) (_size!2754 (_ BitVec 32)) (_keys!11236 array!64521) (_values!6074 array!64523) (_vacant!2754 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5398)

(declare-fun e!579793 () Bool)

(declare-fun array_inv!24073 (array!64521) Bool)

(declare-fun array_inv!24074 (array!64523) Bool)

(assert (=> b!1027626 (= e!579790 (and tp!72518 tp_is_empty!24211 (array_inv!24073 (_keys!11236 thiss!1427)) (array_inv!24074 (_values!6074 thiss!1427)) e!579793))))

(declare-fun b!1027627 () Bool)

(declare-fun res!687539 () Bool)

(declare-fun e!579789 () Bool)

(assert (=> b!1027627 (=> res!687539 e!579789)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64521 (_ BitVec 32)) Bool)

(assert (=> b!1027627 (= res!687539 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11236 thiss!1427) (mask!29803 thiss!1427))))))

(declare-fun b!1027629 () Bool)

(declare-fun res!687538 () Bool)

(declare-fun e!579788 () Bool)

(assert (=> b!1027629 (=> (not res!687538) (not e!579788))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027629 (= res!687538 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027630 () Bool)

(declare-fun e!579792 () Bool)

(assert (=> b!1027630 (= e!579792 (not e!579789))))

(declare-fun res!687542 () Bool)

(assert (=> b!1027630 (=> res!687542 e!579789)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027630 (= res!687542 (not (validMask!0 (mask!29803 thiss!1427))))))

(declare-fun lt!451986 () array!64521)

(declare-fun arrayContainsKey!0 (array!64521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027630 (not (arrayContainsKey!0 lt!451986 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9598 0))(
  ( (MissingZero!9598 (index!40763 (_ BitVec 32))) (Found!9598 (index!40764 (_ BitVec 32))) (Intermediate!9598 (undefined!10410 Bool) (index!40765 (_ BitVec 32)) (x!91274 (_ BitVec 32))) (Undefined!9598) (MissingVacant!9598 (index!40766 (_ BitVec 32))) )
))
(declare-fun lt!451983 () SeekEntryResult!9598)

(declare-datatypes ((Unit!33444 0))(
  ( (Unit!33445) )
))
(declare-fun lt!451984 () Unit!33444)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64521 (_ BitVec 32) (_ BitVec 64)) Unit!33444)

(assert (=> b!1027630 (= lt!451984 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11236 thiss!1427) (index!40764 lt!451983) key!909))))

(assert (=> b!1027630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451986 (mask!29803 thiss!1427))))

(declare-fun lt!451987 () Unit!33444)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64521 (_ BitVec 32) (_ BitVec 32)) Unit!33444)

(assert (=> b!1027630 (= lt!451987 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11236 thiss!1427) (index!40764 lt!451983) (mask!29803 thiss!1427)))))

(declare-datatypes ((List!21764 0))(
  ( (Nil!21761) (Cons!21760 (h!22967 (_ BitVec 64)) (t!30818 List!21764)) )
))
(declare-fun arrayNoDuplicates!0 (array!64521 (_ BitVec 32) List!21764) Bool)

(assert (=> b!1027630 (arrayNoDuplicates!0 lt!451986 #b00000000000000000000000000000000 Nil!21761)))

(declare-fun lt!451982 () Unit!33444)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64521 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21764) Unit!33444)

(assert (=> b!1027630 (= lt!451982 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11236 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40764 lt!451983) #b00000000000000000000000000000000 Nil!21761))))

(declare-fun arrayCountValidKeys!0 (array!64521 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027630 (= (arrayCountValidKeys!0 lt!451986 #b00000000000000000000000000000000 (size!31577 (_keys!11236 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11236 thiss!1427) #b00000000000000000000000000000000 (size!31577 (_keys!11236 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027630 (= lt!451986 (array!64522 (store (arr!31063 (_keys!11236 thiss!1427)) (index!40764 lt!451983) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31577 (_keys!11236 thiss!1427))))))

(declare-fun lt!451985 () Unit!33444)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64521 (_ BitVec 32) (_ BitVec 64)) Unit!33444)

(assert (=> b!1027630 (= lt!451985 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11236 thiss!1427) (index!40764 lt!451983) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027631 () Bool)

(assert (=> b!1027631 (= e!579789 true)))

(declare-fun lt!451988 () Bool)

(assert (=> b!1027631 (= lt!451988 (arrayNoDuplicates!0 (_keys!11236 thiss!1427) #b00000000000000000000000000000000 Nil!21761))))

(declare-fun b!1027632 () Bool)

(assert (=> b!1027632 (= e!579788 e!579792)))

(declare-fun res!687537 () Bool)

(assert (=> b!1027632 (=> (not res!687537) (not e!579792))))

(get-info :version)

(assert (=> b!1027632 (= res!687537 ((_ is Found!9598) lt!451983))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64521 (_ BitVec 32)) SeekEntryResult!9598)

(assert (=> b!1027632 (= lt!451983 (seekEntry!0 key!909 (_keys!11236 thiss!1427) (mask!29803 thiss!1427)))))

(declare-fun mapIsEmpty!37745 () Bool)

(declare-fun mapRes!37745 () Bool)

(assert (=> mapIsEmpty!37745 mapRes!37745))

(declare-fun mapNonEmpty!37745 () Bool)

(declare-fun tp!72519 () Bool)

(declare-fun e!579787 () Bool)

(assert (=> mapNonEmpty!37745 (= mapRes!37745 (and tp!72519 e!579787))))

(declare-fun mapKey!37745 () (_ BitVec 32))

(declare-fun mapRest!37745 () (Array (_ BitVec 32) ValueCell!11402))

(declare-fun mapValue!37745 () ValueCell!11402)

(assert (=> mapNonEmpty!37745 (= (arr!31064 (_values!6074 thiss!1427)) (store mapRest!37745 mapKey!37745 mapValue!37745))))

(declare-fun b!1027633 () Bool)

(declare-fun e!579786 () Bool)

(assert (=> b!1027633 (= e!579793 (and e!579786 mapRes!37745))))

(declare-fun condMapEmpty!37745 () Bool)

(declare-fun mapDefault!37745 () ValueCell!11402)

(assert (=> b!1027633 (= condMapEmpty!37745 (= (arr!31064 (_values!6074 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11402)) mapDefault!37745)))))

(declare-fun res!687540 () Bool)

(assert (=> start!89726 (=> (not res!687540) (not e!579788))))

(declare-fun valid!2057 (LongMapFixedSize!5398) Bool)

(assert (=> start!89726 (= res!687540 (valid!2057 thiss!1427))))

(assert (=> start!89726 e!579788))

(assert (=> start!89726 e!579790))

(assert (=> start!89726 true))

(declare-fun b!1027628 () Bool)

(declare-fun res!687541 () Bool)

(assert (=> b!1027628 (=> res!687541 e!579789)))

(assert (=> b!1027628 (= res!687541 (or (not (= (size!31578 (_values!6074 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29803 thiss!1427)))) (not (= (size!31577 (_keys!11236 thiss!1427)) (size!31578 (_values!6074 thiss!1427)))) (bvslt (mask!29803 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5783 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5783 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027634 () Bool)

(assert (=> b!1027634 (= e!579786 tp_is_empty!24211)))

(declare-fun b!1027635 () Bool)

(assert (=> b!1027635 (= e!579787 tp_is_empty!24211)))

(assert (= (and start!89726 res!687540) b!1027629))

(assert (= (and b!1027629 res!687538) b!1027632))

(assert (= (and b!1027632 res!687537) b!1027630))

(assert (= (and b!1027630 (not res!687542)) b!1027628))

(assert (= (and b!1027628 (not res!687541)) b!1027627))

(assert (= (and b!1027627 (not res!687539)) b!1027631))

(assert (= (and b!1027633 condMapEmpty!37745) mapIsEmpty!37745))

(assert (= (and b!1027633 (not condMapEmpty!37745)) mapNonEmpty!37745))

(assert (= (and mapNonEmpty!37745 ((_ is ValueCellFull!11402) mapValue!37745)) b!1027635))

(assert (= (and b!1027633 ((_ is ValueCellFull!11402) mapDefault!37745)) b!1027634))

(assert (= b!1027626 b!1027633))

(assert (= start!89726 b!1027626))

(declare-fun m!946215 () Bool)

(assert (=> b!1027631 m!946215))

(declare-fun m!946217 () Bool)

(assert (=> b!1027630 m!946217))

(declare-fun m!946219 () Bool)

(assert (=> b!1027630 m!946219))

(declare-fun m!946221 () Bool)

(assert (=> b!1027630 m!946221))

(declare-fun m!946223 () Bool)

(assert (=> b!1027630 m!946223))

(declare-fun m!946225 () Bool)

(assert (=> b!1027630 m!946225))

(declare-fun m!946227 () Bool)

(assert (=> b!1027630 m!946227))

(declare-fun m!946229 () Bool)

(assert (=> b!1027630 m!946229))

(declare-fun m!946231 () Bool)

(assert (=> b!1027630 m!946231))

(declare-fun m!946233 () Bool)

(assert (=> b!1027630 m!946233))

(declare-fun m!946235 () Bool)

(assert (=> b!1027630 m!946235))

(declare-fun m!946237 () Bool)

(assert (=> b!1027630 m!946237))

(declare-fun m!946239 () Bool)

(assert (=> start!89726 m!946239))

(declare-fun m!946241 () Bool)

(assert (=> b!1027632 m!946241))

(declare-fun m!946243 () Bool)

(assert (=> b!1027627 m!946243))

(declare-fun m!946245 () Bool)

(assert (=> b!1027626 m!946245))

(declare-fun m!946247 () Bool)

(assert (=> b!1027626 m!946247))

(declare-fun m!946249 () Bool)

(assert (=> mapNonEmpty!37745 m!946249))

(check-sat (not b!1027632) tp_is_empty!24211 (not start!89726) (not b!1027626) (not b!1027631) (not b!1027630) b_and!32747 (not b!1027627) (not mapNonEmpty!37745) (not b_next!20491))
(check-sat b_and!32747 (not b_next!20491))
