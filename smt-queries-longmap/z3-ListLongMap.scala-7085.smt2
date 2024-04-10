; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89566 () Bool)

(assert start!89566)

(declare-fun b!1027427 () Bool)

(declare-fun b_free!20565 () Bool)

(declare-fun b_next!20565 () Bool)

(assert (=> b!1027427 (= b_free!20565 (not b_next!20565))))

(declare-fun tp!72740 () Bool)

(declare-fun b_and!32811 () Bool)

(assert (=> b!1027427 (= tp!72740 b_and!32811)))

(declare-fun b!1027421 () Bool)

(declare-fun res!687695 () Bool)

(declare-fun e!579834 () Bool)

(assert (=> b!1027421 (=> res!687695 e!579834)))

(declare-datatypes ((V!37253 0))(
  ( (V!37254 (val!12193 Int)) )
))
(declare-datatypes ((ValueCell!11439 0))(
  ( (ValueCellFull!11439 (v!14762 V!37253)) (EmptyCell!11439) )
))
(declare-datatypes ((array!64620 0))(
  ( (array!64621 (arr!31119 (Array (_ BitVec 32) (_ BitVec 64))) (size!31632 (_ BitVec 32))) )
))
(declare-datatypes ((array!64622 0))(
  ( (array!64623 (arr!31120 (Array (_ BitVec 32) ValueCell!11439)) (size!31633 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5472 0))(
  ( (LongMapFixedSize!5473 (defaultEntry!6088 Int) (mask!29804 (_ BitVec 32)) (extraKeys!5820 (_ BitVec 32)) (zeroValue!5924 V!37253) (minValue!5924 V!37253) (_size!2791 (_ BitVec 32)) (_keys!11235 array!64620) (_values!6111 array!64622) (_vacant!2791 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5472)

(assert (=> b!1027421 (= res!687695 (or (not (= (size!31633 (_values!6111 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29804 thiss!1427)))) (not (= (size!31632 (_keys!11235 thiss!1427)) (size!31633 (_values!6111 thiss!1427)))) (bvslt (mask!29804 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5820 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5820 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027423 () Bool)

(declare-fun e!579831 () Bool)

(declare-fun e!579835 () Bool)

(declare-fun mapRes!37856 () Bool)

(assert (=> b!1027423 (= e!579831 (and e!579835 mapRes!37856))))

(declare-fun condMapEmpty!37856 () Bool)

(declare-fun mapDefault!37856 () ValueCell!11439)

(assert (=> b!1027423 (= condMapEmpty!37856 (= (arr!31120 (_values!6111 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11439)) mapDefault!37856)))))

(declare-fun b!1027424 () Bool)

(declare-fun res!687693 () Bool)

(declare-fun e!579833 () Bool)

(assert (=> b!1027424 (=> (not res!687693) (not e!579833))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027424 (= res!687693 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027425 () Bool)

(declare-fun tp_is_empty!24285 () Bool)

(assert (=> b!1027425 (= e!579835 tp_is_empty!24285)))

(declare-fun mapIsEmpty!37856 () Bool)

(assert (=> mapIsEmpty!37856 mapRes!37856))

(declare-fun b!1027426 () Bool)

(declare-fun e!579832 () Bool)

(assert (=> b!1027426 (= e!579832 tp_is_empty!24285)))

(declare-fun e!579836 () Bool)

(declare-fun array_inv!24093 (array!64620) Bool)

(declare-fun array_inv!24094 (array!64622) Bool)

(assert (=> b!1027427 (= e!579836 (and tp!72740 tp_is_empty!24285 (array_inv!24093 (_keys!11235 thiss!1427)) (array_inv!24094 (_values!6111 thiss!1427)) e!579831))))

(declare-fun b!1027428 () Bool)

(assert (=> b!1027428 (= e!579834 true)))

(declare-fun lt!452244 () Bool)

(declare-datatypes ((List!21806 0))(
  ( (Nil!21803) (Cons!21802 (h!23000 (_ BitVec 64)) (t!30868 List!21806)) )
))
(declare-fun arrayNoDuplicates!0 (array!64620 (_ BitVec 32) List!21806) Bool)

(assert (=> b!1027428 (= lt!452244 (arrayNoDuplicates!0 (_keys!11235 thiss!1427) #b00000000000000000000000000000000 Nil!21803))))

(declare-fun b!1027429 () Bool)

(declare-fun e!579838 () Bool)

(assert (=> b!1027429 (= e!579838 (not e!579834))))

(declare-fun res!687694 () Bool)

(assert (=> b!1027429 (=> res!687694 e!579834)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027429 (= res!687694 (not (validMask!0 (mask!29804 thiss!1427))))))

(declare-fun lt!452248 () array!64620)

(declare-fun arrayContainsKey!0 (array!64620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027429 (not (arrayContainsKey!0 lt!452248 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9672 0))(
  ( (MissingZero!9672 (index!41059 (_ BitVec 32))) (Found!9672 (index!41060 (_ BitVec 32))) (Intermediate!9672 (undefined!10484 Bool) (index!41061 (_ BitVec 32)) (x!91422 (_ BitVec 32))) (Undefined!9672) (MissingVacant!9672 (index!41062 (_ BitVec 32))) )
))
(declare-fun lt!452246 () SeekEntryResult!9672)

(declare-datatypes ((Unit!33483 0))(
  ( (Unit!33484) )
))
(declare-fun lt!452250 () Unit!33483)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64620 (_ BitVec 32) (_ BitVec 64)) Unit!33483)

(assert (=> b!1027429 (= lt!452250 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11235 thiss!1427) (index!41060 lt!452246) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64620 (_ BitVec 32)) Bool)

(assert (=> b!1027429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452248 (mask!29804 thiss!1427))))

(declare-fun lt!452249 () Unit!33483)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64620 (_ BitVec 32) (_ BitVec 32)) Unit!33483)

(assert (=> b!1027429 (= lt!452249 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11235 thiss!1427) (index!41060 lt!452246) (mask!29804 thiss!1427)))))

(assert (=> b!1027429 (arrayNoDuplicates!0 lt!452248 #b00000000000000000000000000000000 Nil!21803)))

(declare-fun lt!452245 () Unit!33483)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64620 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21806) Unit!33483)

(assert (=> b!1027429 (= lt!452245 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11235 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41060 lt!452246) #b00000000000000000000000000000000 Nil!21803))))

(declare-fun arrayCountValidKeys!0 (array!64620 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027429 (= (arrayCountValidKeys!0 lt!452248 #b00000000000000000000000000000000 (size!31632 (_keys!11235 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11235 thiss!1427) #b00000000000000000000000000000000 (size!31632 (_keys!11235 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027429 (= lt!452248 (array!64621 (store (arr!31119 (_keys!11235 thiss!1427)) (index!41060 lt!452246) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31632 (_keys!11235 thiss!1427))))))

(declare-fun lt!452247 () Unit!33483)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64620 (_ BitVec 32) (_ BitVec 64)) Unit!33483)

(assert (=> b!1027429 (= lt!452247 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11235 thiss!1427) (index!41060 lt!452246) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027422 () Bool)

(declare-fun res!687696 () Bool)

(assert (=> b!1027422 (=> res!687696 e!579834)))

(assert (=> b!1027422 (= res!687696 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11235 thiss!1427) (mask!29804 thiss!1427))))))

(declare-fun res!687698 () Bool)

(assert (=> start!89566 (=> (not res!687698) (not e!579833))))

(declare-fun valid!2072 (LongMapFixedSize!5472) Bool)

(assert (=> start!89566 (= res!687698 (valid!2072 thiss!1427))))

(assert (=> start!89566 e!579833))

(assert (=> start!89566 e!579836))

(assert (=> start!89566 true))

(declare-fun mapNonEmpty!37856 () Bool)

(declare-fun tp!72741 () Bool)

(assert (=> mapNonEmpty!37856 (= mapRes!37856 (and tp!72741 e!579832))))

(declare-fun mapRest!37856 () (Array (_ BitVec 32) ValueCell!11439))

(declare-fun mapKey!37856 () (_ BitVec 32))

(declare-fun mapValue!37856 () ValueCell!11439)

(assert (=> mapNonEmpty!37856 (= (arr!31120 (_values!6111 thiss!1427)) (store mapRest!37856 mapKey!37856 mapValue!37856))))

(declare-fun b!1027430 () Bool)

(assert (=> b!1027430 (= e!579833 e!579838)))

(declare-fun res!687697 () Bool)

(assert (=> b!1027430 (=> (not res!687697) (not e!579838))))

(get-info :version)

(assert (=> b!1027430 (= res!687697 ((_ is Found!9672) lt!452246))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64620 (_ BitVec 32)) SeekEntryResult!9672)

(assert (=> b!1027430 (= lt!452246 (seekEntry!0 key!909 (_keys!11235 thiss!1427) (mask!29804 thiss!1427)))))

(assert (= (and start!89566 res!687698) b!1027424))

(assert (= (and b!1027424 res!687693) b!1027430))

(assert (= (and b!1027430 res!687697) b!1027429))

(assert (= (and b!1027429 (not res!687694)) b!1027421))

(assert (= (and b!1027421 (not res!687695)) b!1027422))

(assert (= (and b!1027422 (not res!687696)) b!1027428))

(assert (= (and b!1027423 condMapEmpty!37856) mapIsEmpty!37856))

(assert (= (and b!1027423 (not condMapEmpty!37856)) mapNonEmpty!37856))

(assert (= (and mapNonEmpty!37856 ((_ is ValueCellFull!11439) mapValue!37856)) b!1027426))

(assert (= (and b!1027423 ((_ is ValueCellFull!11439) mapDefault!37856)) b!1027425))

(assert (= b!1027427 b!1027423))

(assert (= start!89566 b!1027427))

(declare-fun m!945883 () Bool)

(assert (=> mapNonEmpty!37856 m!945883))

(declare-fun m!945885 () Bool)

(assert (=> start!89566 m!945885))

(declare-fun m!945887 () Bool)

(assert (=> b!1027427 m!945887))

(declare-fun m!945889 () Bool)

(assert (=> b!1027427 m!945889))

(declare-fun m!945891 () Bool)

(assert (=> b!1027429 m!945891))

(declare-fun m!945893 () Bool)

(assert (=> b!1027429 m!945893))

(declare-fun m!945895 () Bool)

(assert (=> b!1027429 m!945895))

(declare-fun m!945897 () Bool)

(assert (=> b!1027429 m!945897))

(declare-fun m!945899 () Bool)

(assert (=> b!1027429 m!945899))

(declare-fun m!945901 () Bool)

(assert (=> b!1027429 m!945901))

(declare-fun m!945903 () Bool)

(assert (=> b!1027429 m!945903))

(declare-fun m!945905 () Bool)

(assert (=> b!1027429 m!945905))

(declare-fun m!945907 () Bool)

(assert (=> b!1027429 m!945907))

(declare-fun m!945909 () Bool)

(assert (=> b!1027429 m!945909))

(declare-fun m!945911 () Bool)

(assert (=> b!1027429 m!945911))

(declare-fun m!945913 () Bool)

(assert (=> b!1027428 m!945913))

(declare-fun m!945915 () Bool)

(assert (=> b!1027430 m!945915))

(declare-fun m!945917 () Bool)

(assert (=> b!1027422 m!945917))

(check-sat b_and!32811 (not b!1027422) (not b!1027429) (not b!1027430) (not b_next!20565) (not b!1027428) (not b!1027427) tp_is_empty!24285 (not mapNonEmpty!37856) (not start!89566))
(check-sat b_and!32811 (not b_next!20565))
