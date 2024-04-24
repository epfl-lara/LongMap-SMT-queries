; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89630 () Bool)

(assert start!89630)

(declare-fun b!1026214 () Bool)

(declare-fun b_free!20395 () Bool)

(declare-fun b_next!20395 () Bool)

(assert (=> b!1026214 (= b_free!20395 (not b_next!20395))))

(declare-fun tp!72230 () Bool)

(declare-fun b_and!32651 () Bool)

(assert (=> b!1026214 (= tp!72230 b_and!32651)))

(declare-fun b!1026206 () Bool)

(declare-fun e!578640 () Bool)

(declare-fun e!578637 () Bool)

(assert (=> b!1026206 (= e!578640 e!578637)))

(declare-fun res!686693 () Bool)

(assert (=> b!1026206 (=> (not res!686693) (not e!578637))))

(declare-datatypes ((SeekEntryResult!9563 0))(
  ( (MissingZero!9563 (index!40623 (_ BitVec 32))) (Found!9563 (index!40624 (_ BitVec 32))) (Intermediate!9563 (undefined!10375 Bool) (index!40625 (_ BitVec 32)) (x!91111 (_ BitVec 32))) (Undefined!9563) (MissingVacant!9563 (index!40626 (_ BitVec 32))) )
))
(declare-fun lt!451255 () SeekEntryResult!9563)

(get-info :version)

(assert (=> b!1026206 (= res!686693 ((_ is Found!9563) lt!451255))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37027 0))(
  ( (V!37028 (val!12108 Int)) )
))
(declare-datatypes ((ValueCell!11354 0))(
  ( (ValueCellFull!11354 (v!14673 V!37027)) (EmptyCell!11354) )
))
(declare-datatypes ((array!64329 0))(
  ( (array!64330 (arr!30967 (Array (_ BitVec 32) (_ BitVec 64))) (size!31481 (_ BitVec 32))) )
))
(declare-datatypes ((array!64331 0))(
  ( (array!64332 (arr!30968 (Array (_ BitVec 32) ValueCell!11354)) (size!31482 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5302 0))(
  ( (LongMapFixedSize!5303 (defaultEntry!6003 Int) (mask!29723 (_ BitVec 32)) (extraKeys!5735 (_ BitVec 32)) (zeroValue!5839 V!37027) (minValue!5839 V!37027) (_size!2706 (_ BitVec 32)) (_keys!11188 array!64329) (_values!6026 array!64331) (_vacant!2706 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5302)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64329 (_ BitVec 32)) SeekEntryResult!9563)

(assert (=> b!1026206 (= lt!451255 (seekEntry!0 key!909 (_keys!11188 thiss!1427) (mask!29723 thiss!1427)))))

(declare-fun mapIsEmpty!37601 () Bool)

(declare-fun mapRes!37601 () Bool)

(assert (=> mapIsEmpty!37601 mapRes!37601))

(declare-fun b!1026207 () Bool)

(declare-fun res!686699 () Bool)

(declare-fun e!578638 () Bool)

(assert (=> b!1026207 (=> res!686699 e!578638)))

(declare-datatypes ((List!21728 0))(
  ( (Nil!21725) (Cons!21724 (h!22931 (_ BitVec 64)) (t!30782 List!21728)) )
))
(declare-fun noDuplicate!1483 (List!21728) Bool)

(assert (=> b!1026207 (= res!686699 (not (noDuplicate!1483 Nil!21725)))))

(declare-fun b!1026208 () Bool)

(declare-fun res!686698 () Bool)

(assert (=> b!1026208 (=> (not res!686698) (not e!578640))))

(assert (=> b!1026208 (= res!686698 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026209 () Bool)

(declare-fun res!686695 () Bool)

(assert (=> b!1026209 (=> res!686695 e!578638)))

(declare-fun contains!5981 (List!21728 (_ BitVec 64)) Bool)

(assert (=> b!1026209 (= res!686695 (contains!5981 Nil!21725 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026210 () Bool)

(assert (=> b!1026210 (= e!578638 true)))

(declare-fun lt!451256 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64329 (_ BitVec 32) List!21728) Bool)

(assert (=> b!1026210 (= lt!451256 (arrayNoDuplicates!0 (_keys!11188 thiss!1427) #b00000000000000000000000000000000 Nil!21725))))

(declare-fun b!1026211 () Bool)

(declare-fun e!578635 () Bool)

(declare-fun tp_is_empty!24115 () Bool)

(assert (=> b!1026211 (= e!578635 tp_is_empty!24115)))

(declare-fun mapNonEmpty!37601 () Bool)

(declare-fun tp!72231 () Bool)

(assert (=> mapNonEmpty!37601 (= mapRes!37601 (and tp!72231 e!578635))))

(declare-fun mapKey!37601 () (_ BitVec 32))

(declare-fun mapValue!37601 () ValueCell!11354)

(declare-fun mapRest!37601 () (Array (_ BitVec 32) ValueCell!11354))

(assert (=> mapNonEmpty!37601 (= (arr!30968 (_values!6026 thiss!1427)) (store mapRest!37601 mapKey!37601 mapValue!37601))))

(declare-fun b!1026212 () Bool)

(declare-fun res!686696 () Bool)

(assert (=> b!1026212 (=> res!686696 e!578638)))

(assert (=> b!1026212 (= res!686696 (contains!5981 Nil!21725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!578641 () Bool)

(declare-fun e!578639 () Bool)

(declare-fun array_inv!24009 (array!64329) Bool)

(declare-fun array_inv!24010 (array!64331) Bool)

(assert (=> b!1026214 (= e!578641 (and tp!72230 tp_is_empty!24115 (array_inv!24009 (_keys!11188 thiss!1427)) (array_inv!24010 (_values!6026 thiss!1427)) e!578639))))

(declare-fun b!1026215 () Bool)

(assert (=> b!1026215 (= e!578637 (not e!578638))))

(declare-fun res!686694 () Bool)

(assert (=> b!1026215 (=> res!686694 e!578638)))

(assert (=> b!1026215 (= res!686694 (or (bvsge (size!31481 (_keys!11188 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31481 (_keys!11188 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64329 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026215 (= (arrayCountValidKeys!0 (array!64330 (store (arr!30967 (_keys!11188 thiss!1427)) (index!40624 lt!451255) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31481 (_keys!11188 thiss!1427))) #b00000000000000000000000000000000 (size!31481 (_keys!11188 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11188 thiss!1427) #b00000000000000000000000000000000 (size!31481 (_keys!11188 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33380 0))(
  ( (Unit!33381) )
))
(declare-fun lt!451254 () Unit!33380)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64329 (_ BitVec 32) (_ BitVec 64)) Unit!33380)

(assert (=> b!1026215 (= lt!451254 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11188 thiss!1427) (index!40624 lt!451255) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026216 () Bool)

(declare-fun e!578636 () Bool)

(assert (=> b!1026216 (= e!578639 (and e!578636 mapRes!37601))))

(declare-fun condMapEmpty!37601 () Bool)

(declare-fun mapDefault!37601 () ValueCell!11354)

(assert (=> b!1026216 (= condMapEmpty!37601 (= (arr!30968 (_values!6026 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11354)) mapDefault!37601)))))

(declare-fun b!1026213 () Bool)

(assert (=> b!1026213 (= e!578636 tp_is_empty!24115)))

(declare-fun res!686697 () Bool)

(assert (=> start!89630 (=> (not res!686697) (not e!578640))))

(declare-fun valid!2024 (LongMapFixedSize!5302) Bool)

(assert (=> start!89630 (= res!686697 (valid!2024 thiss!1427))))

(assert (=> start!89630 e!578640))

(assert (=> start!89630 e!578641))

(assert (=> start!89630 true))

(assert (= (and start!89630 res!686697) b!1026208))

(assert (= (and b!1026208 res!686698) b!1026206))

(assert (= (and b!1026206 res!686693) b!1026215))

(assert (= (and b!1026215 (not res!686694)) b!1026207))

(assert (= (and b!1026207 (not res!686699)) b!1026212))

(assert (= (and b!1026212 (not res!686696)) b!1026209))

(assert (= (and b!1026209 (not res!686695)) b!1026210))

(assert (= (and b!1026216 condMapEmpty!37601) mapIsEmpty!37601))

(assert (= (and b!1026216 (not condMapEmpty!37601)) mapNonEmpty!37601))

(assert (= (and mapNonEmpty!37601 ((_ is ValueCellFull!11354) mapValue!37601)) b!1026211))

(assert (= (and b!1026216 ((_ is ValueCellFull!11354) mapDefault!37601)) b!1026213))

(assert (= b!1026214 b!1026216))

(assert (= start!89630 b!1026214))

(declare-fun m!944805 () Bool)

(assert (=> b!1026214 m!944805))

(declare-fun m!944807 () Bool)

(assert (=> b!1026214 m!944807))

(declare-fun m!944809 () Bool)

(assert (=> b!1026209 m!944809))

(declare-fun m!944811 () Bool)

(assert (=> start!89630 m!944811))

(declare-fun m!944813 () Bool)

(assert (=> b!1026212 m!944813))

(declare-fun m!944815 () Bool)

(assert (=> b!1026210 m!944815))

(declare-fun m!944817 () Bool)

(assert (=> mapNonEmpty!37601 m!944817))

(declare-fun m!944819 () Bool)

(assert (=> b!1026215 m!944819))

(declare-fun m!944821 () Bool)

(assert (=> b!1026215 m!944821))

(declare-fun m!944823 () Bool)

(assert (=> b!1026215 m!944823))

(declare-fun m!944825 () Bool)

(assert (=> b!1026215 m!944825))

(declare-fun m!944827 () Bool)

(assert (=> b!1026207 m!944827))

(declare-fun m!944829 () Bool)

(assert (=> b!1026206 m!944829))

(check-sat (not b!1026209) (not start!89630) (not b!1026210) (not b!1026207) (not b!1026206) tp_is_empty!24115 (not b!1026215) (not b!1026214) (not b!1026212) (not mapNonEmpty!37601) b_and!32651 (not b_next!20395))
(check-sat b_and!32651 (not b_next!20395))
