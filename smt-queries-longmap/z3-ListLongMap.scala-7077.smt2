; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89514 () Bool)

(assert start!89514)

(declare-fun b!1026524 () Bool)

(declare-fun b_free!20515 () Bool)

(declare-fun b_next!20515 () Bool)

(assert (=> b!1026524 (= b_free!20515 (not b_next!20515))))

(declare-fun tp!72591 () Bool)

(declare-fun b_and!32735 () Bool)

(assert (=> b!1026524 (= tp!72591 b_and!32735)))

(declare-fun b!1026520 () Bool)

(declare-fun res!687181 () Bool)

(declare-fun e!579142 () Bool)

(assert (=> b!1026520 (=> (not res!687181) (not e!579142))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026520 (= res!687181 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026521 () Bool)

(declare-fun e!579144 () Bool)

(assert (=> b!1026521 (= e!579144 true)))

(declare-fun lt!451519 () Bool)

(declare-datatypes ((V!37187 0))(
  ( (V!37188 (val!12168 Int)) )
))
(declare-datatypes ((ValueCell!11414 0))(
  ( (ValueCellFull!11414 (v!14736 V!37187)) (EmptyCell!11414) )
))
(declare-datatypes ((array!64459 0))(
  ( (array!64460 (arr!31038 (Array (_ BitVec 32) (_ BitVec 64))) (size!31553 (_ BitVec 32))) )
))
(declare-datatypes ((array!64461 0))(
  ( (array!64462 (arr!31039 (Array (_ BitVec 32) ValueCell!11414)) (size!31554 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5422 0))(
  ( (LongMapFixedSize!5423 (defaultEntry!6063 Int) (mask!29758 (_ BitVec 32)) (extraKeys!5795 (_ BitVec 32)) (zeroValue!5899 V!37187) (minValue!5899 V!37187) (_size!2766 (_ BitVec 32)) (_keys!11206 array!64459) (_values!6086 array!64461) (_vacant!2766 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5422)

(declare-datatypes ((List!21820 0))(
  ( (Nil!21817) (Cons!21816 (h!23014 (_ BitVec 64)) (t!30873 List!21820)) )
))
(declare-fun arrayNoDuplicates!0 (array!64459 (_ BitVec 32) List!21820) Bool)

(assert (=> b!1026521 (= lt!451519 (arrayNoDuplicates!0 (_keys!11206 thiss!1427) #b00000000000000000000000000000000 Nil!21817))))

(declare-fun b!1026522 () Bool)

(declare-fun e!579147 () Bool)

(assert (=> b!1026522 (= e!579147 (not e!579144))))

(declare-fun res!687177 () Bool)

(assert (=> b!1026522 (=> res!687177 e!579144)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026522 (= res!687177 (not (validMask!0 (mask!29758 thiss!1427))))))

(declare-fun lt!451522 () array!64459)

(declare-fun arrayContainsKey!0 (array!64459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026522 (not (arrayContainsKey!0 lt!451522 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33345 0))(
  ( (Unit!33346) )
))
(declare-fun lt!451525 () Unit!33345)

(declare-datatypes ((SeekEntryResult!9647 0))(
  ( (MissingZero!9647 (index!40959 (_ BitVec 32))) (Found!9647 (index!40960 (_ BitVec 32))) (Intermediate!9647 (undefined!10459 Bool) (index!40961 (_ BitVec 32)) (x!91330 (_ BitVec 32))) (Undefined!9647) (MissingVacant!9647 (index!40962 (_ BitVec 32))) )
))
(declare-fun lt!451521 () SeekEntryResult!9647)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64459 (_ BitVec 32) (_ BitVec 64)) Unit!33345)

(assert (=> b!1026522 (= lt!451525 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11206 thiss!1427) (index!40960 lt!451521) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64459 (_ BitVec 32)) Bool)

(assert (=> b!1026522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451522 (mask!29758 thiss!1427))))

(declare-fun lt!451524 () Unit!33345)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64459 (_ BitVec 32) (_ BitVec 32)) Unit!33345)

(assert (=> b!1026522 (= lt!451524 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11206 thiss!1427) (index!40960 lt!451521) (mask!29758 thiss!1427)))))

(assert (=> b!1026522 (arrayNoDuplicates!0 lt!451522 #b00000000000000000000000000000000 Nil!21817)))

(declare-fun lt!451523 () Unit!33345)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64459 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21820) Unit!33345)

(assert (=> b!1026522 (= lt!451523 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11206 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40960 lt!451521) #b00000000000000000000000000000000 Nil!21817))))

(declare-fun arrayCountValidKeys!0 (array!64459 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026522 (= (arrayCountValidKeys!0 lt!451522 #b00000000000000000000000000000000 (size!31553 (_keys!11206 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11206 thiss!1427) #b00000000000000000000000000000000 (size!31553 (_keys!11206 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026522 (= lt!451522 (array!64460 (store (arr!31038 (_keys!11206 thiss!1427)) (index!40960 lt!451521) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31553 (_keys!11206 thiss!1427))))))

(declare-fun lt!451520 () Unit!33345)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64459 (_ BitVec 32) (_ BitVec 64)) Unit!33345)

(assert (=> b!1026522 (= lt!451520 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11206 thiss!1427) (index!40960 lt!451521) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026523 () Bool)

(declare-fun e!579145 () Bool)

(declare-fun tp_is_empty!24235 () Bool)

(assert (=> b!1026523 (= e!579145 tp_is_empty!24235)))

(declare-fun e!579143 () Bool)

(declare-fun e!579146 () Bool)

(declare-fun array_inv!24043 (array!64459) Bool)

(declare-fun array_inv!24044 (array!64461) Bool)

(assert (=> b!1026524 (= e!579143 (and tp!72591 tp_is_empty!24235 (array_inv!24043 (_keys!11206 thiss!1427)) (array_inv!24044 (_values!6086 thiss!1427)) e!579146))))

(declare-fun b!1026525 () Bool)

(declare-fun res!687176 () Bool)

(assert (=> b!1026525 (=> res!687176 e!579144)))

(assert (=> b!1026525 (= res!687176 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11206 thiss!1427) (mask!29758 thiss!1427))))))

(declare-fun b!1026526 () Bool)

(declare-fun res!687180 () Bool)

(assert (=> b!1026526 (=> res!687180 e!579144)))

(assert (=> b!1026526 (= res!687180 (or (not (= (size!31554 (_values!6086 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29758 thiss!1427)))) (not (= (size!31553 (_keys!11206 thiss!1427)) (size!31554 (_values!6086 thiss!1427)))) (bvslt (mask!29758 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5795 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5795 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun res!687178 () Bool)

(assert (=> start!89514 (=> (not res!687178) (not e!579142))))

(declare-fun valid!2052 (LongMapFixedSize!5422) Bool)

(assert (=> start!89514 (= res!687178 (valid!2052 thiss!1427))))

(assert (=> start!89514 e!579142))

(assert (=> start!89514 e!579143))

(assert (=> start!89514 true))

(declare-fun b!1026527 () Bool)

(declare-fun e!579140 () Bool)

(declare-fun mapRes!37781 () Bool)

(assert (=> b!1026527 (= e!579146 (and e!579140 mapRes!37781))))

(declare-fun condMapEmpty!37781 () Bool)

(declare-fun mapDefault!37781 () ValueCell!11414)

(assert (=> b!1026527 (= condMapEmpty!37781 (= (arr!31039 (_values!6086 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11414)) mapDefault!37781)))))

(declare-fun mapIsEmpty!37781 () Bool)

(assert (=> mapIsEmpty!37781 mapRes!37781))

(declare-fun b!1026528 () Bool)

(assert (=> b!1026528 (= e!579140 tp_is_empty!24235)))

(declare-fun mapNonEmpty!37781 () Bool)

(declare-fun tp!72590 () Bool)

(assert (=> mapNonEmpty!37781 (= mapRes!37781 (and tp!72590 e!579145))))

(declare-fun mapRest!37781 () (Array (_ BitVec 32) ValueCell!11414))

(declare-fun mapKey!37781 () (_ BitVec 32))

(declare-fun mapValue!37781 () ValueCell!11414)

(assert (=> mapNonEmpty!37781 (= (arr!31039 (_values!6086 thiss!1427)) (store mapRest!37781 mapKey!37781 mapValue!37781))))

(declare-fun b!1026529 () Bool)

(assert (=> b!1026529 (= e!579142 e!579147)))

(declare-fun res!687179 () Bool)

(assert (=> b!1026529 (=> (not res!687179) (not e!579147))))

(get-info :version)

(assert (=> b!1026529 (= res!687179 ((_ is Found!9647) lt!451521))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64459 (_ BitVec 32)) SeekEntryResult!9647)

(assert (=> b!1026529 (= lt!451521 (seekEntry!0 key!909 (_keys!11206 thiss!1427) (mask!29758 thiss!1427)))))

(assert (= (and start!89514 res!687178) b!1026520))

(assert (= (and b!1026520 res!687181) b!1026529))

(assert (= (and b!1026529 res!687179) b!1026522))

(assert (= (and b!1026522 (not res!687177)) b!1026526))

(assert (= (and b!1026526 (not res!687180)) b!1026525))

(assert (= (and b!1026525 (not res!687176)) b!1026521))

(assert (= (and b!1026527 condMapEmpty!37781) mapIsEmpty!37781))

(assert (= (and b!1026527 (not condMapEmpty!37781)) mapNonEmpty!37781))

(assert (= (and mapNonEmpty!37781 ((_ is ValueCellFull!11414) mapValue!37781)) b!1026523))

(assert (= (and b!1026527 ((_ is ValueCellFull!11414) mapDefault!37781)) b!1026528))

(assert (= b!1026524 b!1026527))

(assert (= start!89514 b!1026524))

(declare-fun m!944363 () Bool)

(assert (=> mapNonEmpty!37781 m!944363))

(declare-fun m!944365 () Bool)

(assert (=> b!1026521 m!944365))

(declare-fun m!944367 () Bool)

(assert (=> b!1026524 m!944367))

(declare-fun m!944369 () Bool)

(assert (=> b!1026524 m!944369))

(declare-fun m!944371 () Bool)

(assert (=> start!89514 m!944371))

(declare-fun m!944373 () Bool)

(assert (=> b!1026525 m!944373))

(declare-fun m!944375 () Bool)

(assert (=> b!1026522 m!944375))

(declare-fun m!944377 () Bool)

(assert (=> b!1026522 m!944377))

(declare-fun m!944379 () Bool)

(assert (=> b!1026522 m!944379))

(declare-fun m!944381 () Bool)

(assert (=> b!1026522 m!944381))

(declare-fun m!944383 () Bool)

(assert (=> b!1026522 m!944383))

(declare-fun m!944385 () Bool)

(assert (=> b!1026522 m!944385))

(declare-fun m!944387 () Bool)

(assert (=> b!1026522 m!944387))

(declare-fun m!944389 () Bool)

(assert (=> b!1026522 m!944389))

(declare-fun m!944391 () Bool)

(assert (=> b!1026522 m!944391))

(declare-fun m!944393 () Bool)

(assert (=> b!1026522 m!944393))

(declare-fun m!944395 () Bool)

(assert (=> b!1026522 m!944395))

(declare-fun m!944397 () Bool)

(assert (=> b!1026529 m!944397))

(check-sat (not b!1026521) (not b!1026524) (not start!89514) (not b!1026525) (not b!1026529) tp_is_empty!24235 b_and!32735 (not b!1026522) (not b_next!20515) (not mapNonEmpty!37781))
(check-sat b_and!32735 (not b_next!20515))
