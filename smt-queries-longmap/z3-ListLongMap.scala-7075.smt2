; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89738 () Bool)

(assert start!89738)

(declare-fun b!1027808 () Bool)

(declare-fun b_free!20503 () Bool)

(declare-fun b_next!20503 () Bool)

(assert (=> b!1027808 (= b_free!20503 (not b_next!20503))))

(declare-fun tp!72555 () Bool)

(declare-fun b_and!32759 () Bool)

(assert (=> b!1027808 (= tp!72555 b_and!32759)))

(declare-fun b!1027806 () Bool)

(declare-fun e!579937 () Bool)

(declare-fun e!579931 () Bool)

(assert (=> b!1027806 (= e!579937 e!579931)))

(declare-fun res!687648 () Bool)

(assert (=> b!1027806 (=> (not res!687648) (not e!579931))))

(declare-datatypes ((SeekEntryResult!9603 0))(
  ( (MissingZero!9603 (index!40783 (_ BitVec 32))) (Found!9603 (index!40784 (_ BitVec 32))) (Intermediate!9603 (undefined!10415 Bool) (index!40785 (_ BitVec 32)) (x!91295 (_ BitVec 32))) (Undefined!9603) (MissingVacant!9603 (index!40786 (_ BitVec 32))) )
))
(declare-fun lt!452112 () SeekEntryResult!9603)

(get-info :version)

(assert (=> b!1027806 (= res!687648 ((_ is Found!9603) lt!452112))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37171 0))(
  ( (V!37172 (val!12162 Int)) )
))
(declare-datatypes ((ValueCell!11408 0))(
  ( (ValueCellFull!11408 (v!14727 V!37171)) (EmptyCell!11408) )
))
(declare-datatypes ((array!64545 0))(
  ( (array!64546 (arr!31075 (Array (_ BitVec 32) (_ BitVec 64))) (size!31589 (_ BitVec 32))) )
))
(declare-datatypes ((array!64547 0))(
  ( (array!64548 (arr!31076 (Array (_ BitVec 32) ValueCell!11408)) (size!31590 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5410 0))(
  ( (LongMapFixedSize!5411 (defaultEntry!6057 Int) (mask!29813 (_ BitVec 32)) (extraKeys!5789 (_ BitVec 32)) (zeroValue!5893 V!37171) (minValue!5893 V!37171) (_size!2760 (_ BitVec 32)) (_keys!11242 array!64545) (_values!6080 array!64547) (_vacant!2760 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5410)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64545 (_ BitVec 32)) SeekEntryResult!9603)

(assert (=> b!1027806 (= lt!452112 (seekEntry!0 key!909 (_keys!11242 thiss!1427) (mask!29813 thiss!1427)))))

(declare-fun res!687646 () Bool)

(assert (=> start!89738 (=> (not res!687646) (not e!579937))))

(declare-fun valid!2061 (LongMapFixedSize!5410) Bool)

(assert (=> start!89738 (= res!687646 (valid!2061 thiss!1427))))

(assert (=> start!89738 e!579937))

(declare-fun e!579934 () Bool)

(assert (=> start!89738 e!579934))

(assert (=> start!89738 true))

(declare-fun mapIsEmpty!37763 () Bool)

(declare-fun mapRes!37763 () Bool)

(assert (=> mapIsEmpty!37763 mapRes!37763))

(declare-fun b!1027807 () Bool)

(declare-fun e!579932 () Bool)

(declare-fun tp_is_empty!24223 () Bool)

(assert (=> b!1027807 (= e!579932 tp_is_empty!24223)))

(declare-fun mapNonEmpty!37763 () Bool)

(declare-fun tp!72554 () Bool)

(assert (=> mapNonEmpty!37763 (= mapRes!37763 (and tp!72554 e!579932))))

(declare-fun mapValue!37763 () ValueCell!11408)

(declare-fun mapKey!37763 () (_ BitVec 32))

(declare-fun mapRest!37763 () (Array (_ BitVec 32) ValueCell!11408))

(assert (=> mapNonEmpty!37763 (= (arr!31076 (_values!6080 thiss!1427)) (store mapRest!37763 mapKey!37763 mapValue!37763))))

(declare-fun e!579936 () Bool)

(declare-fun array_inv!24079 (array!64545) Bool)

(declare-fun array_inv!24080 (array!64547) Bool)

(assert (=> b!1027808 (= e!579934 (and tp!72555 tp_is_empty!24223 (array_inv!24079 (_keys!11242 thiss!1427)) (array_inv!24080 (_values!6080 thiss!1427)) e!579936))))

(declare-fun b!1027809 () Bool)

(declare-fun e!579933 () Bool)

(assert (=> b!1027809 (= e!579933 tp_is_empty!24223)))

(declare-fun b!1027810 () Bool)

(declare-fun res!687650 () Bool)

(declare-fun e!579935 () Bool)

(assert (=> b!1027810 (=> res!687650 e!579935)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64545 (_ BitVec 32)) Bool)

(assert (=> b!1027810 (= res!687650 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11242 thiss!1427) (mask!29813 thiss!1427))))))

(declare-fun b!1027811 () Bool)

(assert (=> b!1027811 (= e!579935 true)))

(declare-fun lt!452114 () Bool)

(declare-datatypes ((List!21769 0))(
  ( (Nil!21766) (Cons!21765 (h!22972 (_ BitVec 64)) (t!30823 List!21769)) )
))
(declare-fun arrayNoDuplicates!0 (array!64545 (_ BitVec 32) List!21769) Bool)

(assert (=> b!1027811 (= lt!452114 (arrayNoDuplicates!0 (_keys!11242 thiss!1427) #b00000000000000000000000000000000 Nil!21766))))

(declare-fun b!1027812 () Bool)

(declare-fun res!687649 () Bool)

(assert (=> b!1027812 (=> res!687649 e!579935)))

(assert (=> b!1027812 (= res!687649 (or (not (= (size!31590 (_values!6080 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29813 thiss!1427)))) (not (= (size!31589 (_keys!11242 thiss!1427)) (size!31590 (_values!6080 thiss!1427)))) (bvslt (mask!29813 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5789 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5789 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027813 () Bool)

(assert (=> b!1027813 (= e!579931 (not e!579935))))

(declare-fun res!687647 () Bool)

(assert (=> b!1027813 (=> res!687647 e!579935)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027813 (= res!687647 (not (validMask!0 (mask!29813 thiss!1427))))))

(declare-fun lt!452109 () array!64545)

(declare-fun arrayContainsKey!0 (array!64545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027813 (not (arrayContainsKey!0 lt!452109 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33452 0))(
  ( (Unit!33453) )
))
(declare-fun lt!452111 () Unit!33452)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64545 (_ BitVec 32) (_ BitVec 64)) Unit!33452)

(assert (=> b!1027813 (= lt!452111 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11242 thiss!1427) (index!40784 lt!452112) key!909))))

(assert (=> b!1027813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452109 (mask!29813 thiss!1427))))

(declare-fun lt!452113 () Unit!33452)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64545 (_ BitVec 32) (_ BitVec 32)) Unit!33452)

(assert (=> b!1027813 (= lt!452113 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11242 thiss!1427) (index!40784 lt!452112) (mask!29813 thiss!1427)))))

(assert (=> b!1027813 (arrayNoDuplicates!0 lt!452109 #b00000000000000000000000000000000 Nil!21766)))

(declare-fun lt!452110 () Unit!33452)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64545 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21769) Unit!33452)

(assert (=> b!1027813 (= lt!452110 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11242 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40784 lt!452112) #b00000000000000000000000000000000 Nil!21766))))

(declare-fun arrayCountValidKeys!0 (array!64545 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027813 (= (arrayCountValidKeys!0 lt!452109 #b00000000000000000000000000000000 (size!31589 (_keys!11242 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11242 thiss!1427) #b00000000000000000000000000000000 (size!31589 (_keys!11242 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027813 (= lt!452109 (array!64546 (store (arr!31075 (_keys!11242 thiss!1427)) (index!40784 lt!452112) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31589 (_keys!11242 thiss!1427))))))

(declare-fun lt!452108 () Unit!33452)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64545 (_ BitVec 32) (_ BitVec 64)) Unit!33452)

(assert (=> b!1027813 (= lt!452108 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11242 thiss!1427) (index!40784 lt!452112) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027814 () Bool)

(declare-fun res!687645 () Bool)

(assert (=> b!1027814 (=> (not res!687645) (not e!579937))))

(assert (=> b!1027814 (= res!687645 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027815 () Bool)

(assert (=> b!1027815 (= e!579936 (and e!579933 mapRes!37763))))

(declare-fun condMapEmpty!37763 () Bool)

(declare-fun mapDefault!37763 () ValueCell!11408)

(assert (=> b!1027815 (= condMapEmpty!37763 (= (arr!31076 (_values!6080 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11408)) mapDefault!37763)))))

(assert (= (and start!89738 res!687646) b!1027814))

(assert (= (and b!1027814 res!687645) b!1027806))

(assert (= (and b!1027806 res!687648) b!1027813))

(assert (= (and b!1027813 (not res!687647)) b!1027812))

(assert (= (and b!1027812 (not res!687649)) b!1027810))

(assert (= (and b!1027810 (not res!687650)) b!1027811))

(assert (= (and b!1027815 condMapEmpty!37763) mapIsEmpty!37763))

(assert (= (and b!1027815 (not condMapEmpty!37763)) mapNonEmpty!37763))

(assert (= (and mapNonEmpty!37763 ((_ is ValueCellFull!11408) mapValue!37763)) b!1027807))

(assert (= (and b!1027815 ((_ is ValueCellFull!11408) mapDefault!37763)) b!1027809))

(assert (= b!1027808 b!1027815))

(assert (= start!89738 b!1027808))

(declare-fun m!946431 () Bool)

(assert (=> b!1027811 m!946431))

(declare-fun m!946433 () Bool)

(assert (=> b!1027808 m!946433))

(declare-fun m!946435 () Bool)

(assert (=> b!1027808 m!946435))

(declare-fun m!946437 () Bool)

(assert (=> b!1027806 m!946437))

(declare-fun m!946439 () Bool)

(assert (=> b!1027813 m!946439))

(declare-fun m!946441 () Bool)

(assert (=> b!1027813 m!946441))

(declare-fun m!946443 () Bool)

(assert (=> b!1027813 m!946443))

(declare-fun m!946445 () Bool)

(assert (=> b!1027813 m!946445))

(declare-fun m!946447 () Bool)

(assert (=> b!1027813 m!946447))

(declare-fun m!946449 () Bool)

(assert (=> b!1027813 m!946449))

(declare-fun m!946451 () Bool)

(assert (=> b!1027813 m!946451))

(declare-fun m!946453 () Bool)

(assert (=> b!1027813 m!946453))

(declare-fun m!946455 () Bool)

(assert (=> b!1027813 m!946455))

(declare-fun m!946457 () Bool)

(assert (=> b!1027813 m!946457))

(declare-fun m!946459 () Bool)

(assert (=> b!1027813 m!946459))

(declare-fun m!946461 () Bool)

(assert (=> start!89738 m!946461))

(declare-fun m!946463 () Bool)

(assert (=> b!1027810 m!946463))

(declare-fun m!946465 () Bool)

(assert (=> mapNonEmpty!37763 m!946465))

(check-sat (not mapNonEmpty!37763) b_and!32759 (not b!1027811) (not b!1027808) (not b!1027806) (not b!1027813) tp_is_empty!24223 (not start!89738) (not b!1027810) (not b_next!20503))
(check-sat b_and!32759 (not b_next!20503))
