; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91040 () Bool)

(assert start!91040)

(declare-fun b!1039333 () Bool)

(declare-fun b_free!20923 () Bool)

(declare-fun b_next!20923 () Bool)

(assert (=> b!1039333 (= b_free!20923 (not b_next!20923))))

(declare-fun tp!73926 () Bool)

(declare-fun b_and!33465 () Bool)

(assert (=> b!1039333 (= tp!73926 b_and!33465)))

(declare-fun b!1039323 () Bool)

(declare-fun res!692988 () Bool)

(declare-fun e!588113 () Bool)

(assert (=> b!1039323 (=> (not res!692988) (not e!588113))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039323 (= res!692988 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039324 () Bool)

(declare-fun res!692984 () Bool)

(declare-fun e!588116 () Bool)

(assert (=> b!1039324 (=> res!692984 e!588116)))

(declare-datatypes ((List!21916 0))(
  ( (Nil!21913) (Cons!21912 (h!23124 (_ BitVec 64)) (t!31122 List!21916)) )
))
(declare-fun contains!6056 (List!21916 (_ BitVec 64)) Bool)

(assert (=> b!1039324 (= res!692984 (contains!6056 Nil!21913 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039325 () Bool)

(declare-fun res!692985 () Bool)

(assert (=> b!1039325 (=> res!692985 e!588116)))

(assert (=> b!1039325 (= res!692985 (contains!6056 Nil!21913 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039326 () Bool)

(declare-fun e!588117 () Bool)

(assert (=> b!1039326 (= e!588113 e!588117)))

(declare-fun res!692986 () Bool)

(assert (=> b!1039326 (=> (not res!692986) (not e!588117))))

(declare-datatypes ((SeekEntryResult!9717 0))(
  ( (MissingZero!9717 (index!41239 (_ BitVec 32))) (Found!9717 (index!41240 (_ BitVec 32))) (Intermediate!9717 (undefined!10529 Bool) (index!41241 (_ BitVec 32)) (x!92594 (_ BitVec 32))) (Undefined!9717) (MissingVacant!9717 (index!41242 (_ BitVec 32))) )
))
(declare-fun lt!458147 () SeekEntryResult!9717)

(get-info :version)

(assert (=> b!1039326 (= res!692986 ((_ is Found!9717) lt!458147))))

(declare-datatypes ((V!37731 0))(
  ( (V!37732 (val!12372 Int)) )
))
(declare-datatypes ((ValueCell!11618 0))(
  ( (ValueCellFull!11618 (v!14953 V!37731)) (EmptyCell!11618) )
))
(declare-datatypes ((array!65447 0))(
  ( (array!65448 (arr!31495 (Array (_ BitVec 32) (_ BitVec 64))) (size!32026 (_ BitVec 32))) )
))
(declare-datatypes ((array!65449 0))(
  ( (array!65450 (arr!31496 (Array (_ BitVec 32) ValueCell!11618)) (size!32027 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5830 0))(
  ( (LongMapFixedSize!5831 (defaultEntry!6297 Int) (mask!30288 (_ BitVec 32)) (extraKeys!6025 (_ BitVec 32)) (zeroValue!6131 V!37731) (minValue!6131 V!37731) (_size!2970 (_ BitVec 32)) (_keys!11535 array!65447) (_values!6320 array!65449) (_vacant!2970 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5830)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65447 (_ BitVec 32)) SeekEntryResult!9717)

(assert (=> b!1039326 (= lt!458147 (seekEntry!0 key!909 (_keys!11535 thiss!1427) (mask!30288 thiss!1427)))))

(declare-fun b!1039327 () Bool)

(assert (=> b!1039327 (= e!588117 (not e!588116))))

(declare-fun res!692987 () Bool)

(assert (=> b!1039327 (=> res!692987 e!588116)))

(assert (=> b!1039327 (= res!692987 (or (bvsge (size!32026 (_keys!11535 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32026 (_keys!11535 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65447 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039327 (= (arrayCountValidKeys!0 (array!65448 (store (arr!31495 (_keys!11535 thiss!1427)) (index!41240 lt!458147) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32026 (_keys!11535 thiss!1427))) #b00000000000000000000000000000000 (size!32026 (_keys!11535 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 (size!32026 (_keys!11535 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33963 0))(
  ( (Unit!33964) )
))
(declare-fun lt!458148 () Unit!33963)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65447 (_ BitVec 32) (_ BitVec 64)) Unit!33963)

(assert (=> b!1039327 (= lt!458148 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11535 thiss!1427) (index!41240 lt!458147) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38505 () Bool)

(declare-fun mapRes!38505 () Bool)

(assert (=> mapIsEmpty!38505 mapRes!38505))

(declare-fun b!1039328 () Bool)

(declare-fun e!588114 () Bool)

(declare-fun e!588115 () Bool)

(assert (=> b!1039328 (= e!588114 (and e!588115 mapRes!38505))))

(declare-fun condMapEmpty!38505 () Bool)

(declare-fun mapDefault!38505 () ValueCell!11618)

(assert (=> b!1039328 (= condMapEmpty!38505 (= (arr!31496 (_values!6320 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11618)) mapDefault!38505)))))

(declare-fun b!1039329 () Bool)

(declare-fun tp_is_empty!24643 () Bool)

(assert (=> b!1039329 (= e!588115 tp_is_empty!24643)))

(declare-fun b!1039330 () Bool)

(declare-fun res!692983 () Bool)

(assert (=> b!1039330 (=> res!692983 e!588116)))

(declare-fun noDuplicate!1493 (List!21916) Bool)

(assert (=> b!1039330 (= res!692983 (not (noDuplicate!1493 Nil!21913)))))

(declare-fun b!1039331 () Bool)

(declare-fun e!588112 () Bool)

(assert (=> b!1039331 (= e!588112 tp_is_empty!24643)))

(declare-fun mapNonEmpty!38505 () Bool)

(declare-fun tp!73927 () Bool)

(assert (=> mapNonEmpty!38505 (= mapRes!38505 (and tp!73927 e!588112))))

(declare-fun mapValue!38505 () ValueCell!11618)

(declare-fun mapRest!38505 () (Array (_ BitVec 32) ValueCell!11618))

(declare-fun mapKey!38505 () (_ BitVec 32))

(assert (=> mapNonEmpty!38505 (= (arr!31496 (_values!6320 thiss!1427)) (store mapRest!38505 mapKey!38505 mapValue!38505))))

(declare-fun res!692989 () Bool)

(assert (=> start!91040 (=> (not res!692989) (not e!588113))))

(declare-fun valid!2202 (LongMapFixedSize!5830) Bool)

(assert (=> start!91040 (= res!692989 (valid!2202 thiss!1427))))

(assert (=> start!91040 e!588113))

(declare-fun e!588111 () Bool)

(assert (=> start!91040 e!588111))

(assert (=> start!91040 true))

(declare-fun b!1039332 () Bool)

(assert (=> b!1039332 (= e!588116 true)))

(declare-fun lt!458149 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65447 (_ BitVec 32) List!21916) Bool)

(assert (=> b!1039332 (= lt!458149 (arrayNoDuplicates!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 Nil!21913))))

(declare-fun array_inv!24363 (array!65447) Bool)

(declare-fun array_inv!24364 (array!65449) Bool)

(assert (=> b!1039333 (= e!588111 (and tp!73926 tp_is_empty!24643 (array_inv!24363 (_keys!11535 thiss!1427)) (array_inv!24364 (_values!6320 thiss!1427)) e!588114))))

(assert (= (and start!91040 res!692989) b!1039323))

(assert (= (and b!1039323 res!692988) b!1039326))

(assert (= (and b!1039326 res!692986) b!1039327))

(assert (= (and b!1039327 (not res!692987)) b!1039330))

(assert (= (and b!1039330 (not res!692983)) b!1039325))

(assert (= (and b!1039325 (not res!692985)) b!1039324))

(assert (= (and b!1039324 (not res!692984)) b!1039332))

(assert (= (and b!1039328 condMapEmpty!38505) mapIsEmpty!38505))

(assert (= (and b!1039328 (not condMapEmpty!38505)) mapNonEmpty!38505))

(assert (= (and mapNonEmpty!38505 ((_ is ValueCellFull!11618) mapValue!38505)) b!1039331))

(assert (= (and b!1039328 ((_ is ValueCellFull!11618) mapDefault!38505)) b!1039329))

(assert (= b!1039333 b!1039328))

(assert (= start!91040 b!1039333))

(declare-fun m!959723 () Bool)

(assert (=> b!1039327 m!959723))

(declare-fun m!959725 () Bool)

(assert (=> b!1039327 m!959725))

(declare-fun m!959727 () Bool)

(assert (=> b!1039327 m!959727))

(declare-fun m!959729 () Bool)

(assert (=> b!1039327 m!959729))

(declare-fun m!959731 () Bool)

(assert (=> b!1039333 m!959731))

(declare-fun m!959733 () Bool)

(assert (=> b!1039333 m!959733))

(declare-fun m!959735 () Bool)

(assert (=> b!1039324 m!959735))

(declare-fun m!959737 () Bool)

(assert (=> b!1039330 m!959737))

(declare-fun m!959739 () Bool)

(assert (=> start!91040 m!959739))

(declare-fun m!959741 () Bool)

(assert (=> mapNonEmpty!38505 m!959741))

(declare-fun m!959743 () Bool)

(assert (=> b!1039325 m!959743))

(declare-fun m!959745 () Bool)

(assert (=> b!1039326 m!959745))

(declare-fun m!959747 () Bool)

(assert (=> b!1039332 m!959747))

(check-sat (not b!1039327) (not b!1039325) (not b!1039326) (not b!1039333) (not b!1039332) (not mapNonEmpty!38505) (not b_next!20923) (not start!91040) (not b!1039330) (not b!1039324) b_and!33465 tp_is_empty!24643)
(check-sat b_and!33465 (not b_next!20923))
