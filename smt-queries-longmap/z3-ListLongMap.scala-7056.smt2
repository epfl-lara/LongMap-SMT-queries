; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89392 () Bool)

(assert start!89392)

(declare-fun b!1024829 () Bool)

(declare-fun b_free!20391 () Bool)

(declare-fun b_next!20391 () Bool)

(assert (=> b!1024829 (= b_free!20391 (not b_next!20391))))

(declare-fun tp!72218 () Bool)

(declare-fun b_and!32637 () Bool)

(assert (=> b!1024829 (= tp!72218 b_and!32637)))

(declare-fun b!1024825 () Bool)

(declare-fun res!686144 () Bool)

(declare-fun e!577746 () Bool)

(assert (=> b!1024825 (=> res!686144 e!577746)))

(declare-datatypes ((List!21738 0))(
  ( (Nil!21735) (Cons!21734 (h!22932 (_ BitVec 64)) (t!30800 List!21738)) )
))
(declare-fun contains!5954 (List!21738 (_ BitVec 64)) Bool)

(assert (=> b!1024825 (= res!686144 (contains!5954 Nil!21735 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024826 () Bool)

(declare-fun e!577749 () Bool)

(declare-fun e!577745 () Bool)

(declare-fun mapRes!37595 () Bool)

(assert (=> b!1024826 (= e!577749 (and e!577745 mapRes!37595))))

(declare-fun condMapEmpty!37595 () Bool)

(declare-datatypes ((V!37021 0))(
  ( (V!37022 (val!12106 Int)) )
))
(declare-datatypes ((ValueCell!11352 0))(
  ( (ValueCellFull!11352 (v!14675 V!37021)) (EmptyCell!11352) )
))
(declare-datatypes ((array!64272 0))(
  ( (array!64273 (arr!30945 (Array (_ BitVec 32) (_ BitVec 64))) (size!31458 (_ BitVec 32))) )
))
(declare-datatypes ((array!64274 0))(
  ( (array!64275 (arr!30946 (Array (_ BitVec 32) ValueCell!11352)) (size!31459 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5298 0))(
  ( (LongMapFixedSize!5299 (defaultEntry!6001 Int) (mask!29659 (_ BitVec 32)) (extraKeys!5733 (_ BitVec 32)) (zeroValue!5837 V!37021) (minValue!5837 V!37021) (_size!2704 (_ BitVec 32)) (_keys!11148 array!64272) (_values!6024 array!64274) (_vacant!2704 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5298)

(declare-fun mapDefault!37595 () ValueCell!11352)

(assert (=> b!1024826 (= condMapEmpty!37595 (= (arr!30946 (_values!6024 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11352)) mapDefault!37595)))))

(declare-fun b!1024827 () Bool)

(declare-fun e!577743 () Bool)

(declare-fun tp_is_empty!24111 () Bool)

(assert (=> b!1024827 (= e!577743 tp_is_empty!24111)))

(declare-fun b!1024828 () Bool)

(declare-fun e!577748 () Bool)

(assert (=> b!1024828 (= e!577748 (not e!577746))))

(declare-fun res!686147 () Bool)

(assert (=> b!1024828 (=> res!686147 e!577746)))

(assert (=> b!1024828 (= res!686147 (or (bvsge (size!31458 (_keys!11148 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31458 (_keys!11148 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9603 0))(
  ( (MissingZero!9603 (index!40783 (_ BitVec 32))) (Found!9603 (index!40784 (_ BitVec 32))) (Intermediate!9603 (undefined!10415 Bool) (index!40785 (_ BitVec 32)) (x!91121 (_ BitVec 32))) (Undefined!9603) (MissingVacant!9603 (index!40786 (_ BitVec 32))) )
))
(declare-fun lt!450721 () SeekEntryResult!9603)

(declare-fun arrayCountValidKeys!0 (array!64272 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024828 (= (arrayCountValidKeys!0 (array!64273 (store (arr!30945 (_keys!11148 thiss!1427)) (index!40784 lt!450721) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31458 (_keys!11148 thiss!1427))) #b00000000000000000000000000000000 (size!31458 (_keys!11148 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11148 thiss!1427) #b00000000000000000000000000000000 (size!31458 (_keys!11148 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33363 0))(
  ( (Unit!33364) )
))
(declare-fun lt!450723 () Unit!33363)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64272 (_ BitVec 32) (_ BitVec 64)) Unit!33363)

(assert (=> b!1024828 (= lt!450723 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11148 thiss!1427) (index!40784 lt!450721) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!577747 () Bool)

(declare-fun array_inv!23967 (array!64272) Bool)

(declare-fun array_inv!23968 (array!64274) Bool)

(assert (=> b!1024829 (= e!577747 (and tp!72218 tp_is_empty!24111 (array_inv!23967 (_keys!11148 thiss!1427)) (array_inv!23968 (_values!6024 thiss!1427)) e!577749))))

(declare-fun b!1024830 () Bool)

(assert (=> b!1024830 (= e!577746 true)))

(declare-fun lt!450722 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64272 (_ BitVec 32) List!21738) Bool)

(assert (=> b!1024830 (= lt!450722 (arrayNoDuplicates!0 (_keys!11148 thiss!1427) #b00000000000000000000000000000000 Nil!21735))))

(declare-fun b!1024831 () Bool)

(assert (=> b!1024831 (= e!577745 tp_is_empty!24111)))

(declare-fun b!1024832 () Bool)

(declare-fun res!686143 () Bool)

(declare-fun e!577750 () Bool)

(assert (=> b!1024832 (=> (not res!686143) (not e!577750))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024832 (= res!686143 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024833 () Bool)

(assert (=> b!1024833 (= e!577750 e!577748)))

(declare-fun res!686141 () Bool)

(assert (=> b!1024833 (=> (not res!686141) (not e!577748))))

(get-info :version)

(assert (=> b!1024833 (= res!686141 ((_ is Found!9603) lt!450721))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64272 (_ BitVec 32)) SeekEntryResult!9603)

(assert (=> b!1024833 (= lt!450721 (seekEntry!0 key!909 (_keys!11148 thiss!1427) (mask!29659 thiss!1427)))))

(declare-fun mapIsEmpty!37595 () Bool)

(assert (=> mapIsEmpty!37595 mapRes!37595))

(declare-fun mapNonEmpty!37595 () Bool)

(declare-fun tp!72219 () Bool)

(assert (=> mapNonEmpty!37595 (= mapRes!37595 (and tp!72219 e!577743))))

(declare-fun mapKey!37595 () (_ BitVec 32))

(declare-fun mapValue!37595 () ValueCell!11352)

(declare-fun mapRest!37595 () (Array (_ BitVec 32) ValueCell!11352))

(assert (=> mapNonEmpty!37595 (= (arr!30946 (_values!6024 thiss!1427)) (store mapRest!37595 mapKey!37595 mapValue!37595))))

(declare-fun res!686146 () Bool)

(assert (=> start!89392 (=> (not res!686146) (not e!577750))))

(declare-fun valid!2015 (LongMapFixedSize!5298) Bool)

(assert (=> start!89392 (= res!686146 (valid!2015 thiss!1427))))

(assert (=> start!89392 e!577750))

(assert (=> start!89392 e!577747))

(assert (=> start!89392 true))

(declare-fun b!1024834 () Bool)

(declare-fun res!686142 () Bool)

(assert (=> b!1024834 (=> res!686142 e!577746)))

(declare-fun noDuplicate!1469 (List!21738) Bool)

(assert (=> b!1024834 (= res!686142 (not (noDuplicate!1469 Nil!21735)))))

(declare-fun b!1024835 () Bool)

(declare-fun res!686145 () Bool)

(assert (=> b!1024835 (=> res!686145 e!577746)))

(assert (=> b!1024835 (= res!686145 (contains!5954 Nil!21735 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89392 res!686146) b!1024832))

(assert (= (and b!1024832 res!686143) b!1024833))

(assert (= (and b!1024833 res!686141) b!1024828))

(assert (= (and b!1024828 (not res!686147)) b!1024834))

(assert (= (and b!1024834 (not res!686142)) b!1024825))

(assert (= (and b!1024825 (not res!686144)) b!1024835))

(assert (= (and b!1024835 (not res!686145)) b!1024830))

(assert (= (and b!1024826 condMapEmpty!37595) mapIsEmpty!37595))

(assert (= (and b!1024826 (not condMapEmpty!37595)) mapNonEmpty!37595))

(assert (= (and mapNonEmpty!37595 ((_ is ValueCellFull!11352) mapValue!37595)) b!1024827))

(assert (= (and b!1024826 ((_ is ValueCellFull!11352) mapDefault!37595)) b!1024831))

(assert (= b!1024829 b!1024826))

(assert (= start!89392 b!1024829))

(declare-fun m!943089 () Bool)

(assert (=> mapNonEmpty!37595 m!943089))

(declare-fun m!943091 () Bool)

(assert (=> b!1024825 m!943091))

(declare-fun m!943093 () Bool)

(assert (=> b!1024835 m!943093))

(declare-fun m!943095 () Bool)

(assert (=> b!1024830 m!943095))

(declare-fun m!943097 () Bool)

(assert (=> b!1024834 m!943097))

(declare-fun m!943099 () Bool)

(assert (=> b!1024833 m!943099))

(declare-fun m!943101 () Bool)

(assert (=> b!1024828 m!943101))

(declare-fun m!943103 () Bool)

(assert (=> b!1024828 m!943103))

(declare-fun m!943105 () Bool)

(assert (=> b!1024828 m!943105))

(declare-fun m!943107 () Bool)

(assert (=> b!1024828 m!943107))

(declare-fun m!943109 () Bool)

(assert (=> b!1024829 m!943109))

(declare-fun m!943111 () Bool)

(assert (=> b!1024829 m!943111))

(declare-fun m!943113 () Bool)

(assert (=> start!89392 m!943113))

(check-sat (not start!89392) (not b!1024835) (not b!1024825) (not b!1024834) tp_is_empty!24111 (not b!1024828) b_and!32637 (not mapNonEmpty!37595) (not b_next!20391) (not b!1024830) (not b!1024829) (not b!1024833))
(check-sat b_and!32637 (not b_next!20391))
