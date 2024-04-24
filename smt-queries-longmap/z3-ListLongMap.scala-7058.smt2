; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89636 () Bool)

(assert start!89636)

(declare-fun b!1026313 () Bool)

(declare-fun b_free!20401 () Bool)

(declare-fun b_next!20401 () Bool)

(assert (=> b!1026313 (= b_free!20401 (not b_next!20401))))

(declare-fun tp!72248 () Bool)

(declare-fun b_and!32657 () Bool)

(assert (=> b!1026313 (= tp!72248 b_and!32657)))

(declare-fun b!1026305 () Bool)

(declare-fun res!686759 () Bool)

(declare-fun e!578707 () Bool)

(assert (=> b!1026305 (=> res!686759 e!578707)))

(declare-datatypes ((List!21731 0))(
  ( (Nil!21728) (Cons!21727 (h!22934 (_ BitVec 64)) (t!30785 List!21731)) )
))
(declare-fun contains!5984 (List!21731 (_ BitVec 64)) Bool)

(assert (=> b!1026305 (= res!686759 (contains!5984 Nil!21728 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026306 () Bool)

(assert (=> b!1026306 (= e!578707 true)))

(declare-fun lt!451283 () Bool)

(declare-datatypes ((V!37035 0))(
  ( (V!37036 (val!12111 Int)) )
))
(declare-datatypes ((ValueCell!11357 0))(
  ( (ValueCellFull!11357 (v!14676 V!37035)) (EmptyCell!11357) )
))
(declare-datatypes ((array!64341 0))(
  ( (array!64342 (arr!30973 (Array (_ BitVec 32) (_ BitVec 64))) (size!31487 (_ BitVec 32))) )
))
(declare-datatypes ((array!64343 0))(
  ( (array!64344 (arr!30974 (Array (_ BitVec 32) ValueCell!11357)) (size!31488 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5308 0))(
  ( (LongMapFixedSize!5309 (defaultEntry!6006 Int) (mask!29728 (_ BitVec 32)) (extraKeys!5738 (_ BitVec 32)) (zeroValue!5842 V!37035) (minValue!5842 V!37035) (_size!2709 (_ BitVec 32)) (_keys!11191 array!64341) (_values!6029 array!64343) (_vacant!2709 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5308)

(declare-fun arrayNoDuplicates!0 (array!64341 (_ BitVec 32) List!21731) Bool)

(assert (=> b!1026306 (= lt!451283 (arrayNoDuplicates!0 (_keys!11191 thiss!1427) #b00000000000000000000000000000000 Nil!21728))))

(declare-fun b!1026307 () Bool)

(declare-fun e!578709 () Bool)

(assert (=> b!1026307 (= e!578709 (not e!578707))))

(declare-fun res!686762 () Bool)

(assert (=> b!1026307 (=> res!686762 e!578707)))

(assert (=> b!1026307 (= res!686762 (or (bvsge (size!31487 (_keys!11191 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31487 (_keys!11191 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9565 0))(
  ( (MissingZero!9565 (index!40631 (_ BitVec 32))) (Found!9565 (index!40632 (_ BitVec 32))) (Intermediate!9565 (undefined!10377 Bool) (index!40633 (_ BitVec 32)) (x!91121 (_ BitVec 32))) (Undefined!9565) (MissingVacant!9565 (index!40634 (_ BitVec 32))) )
))
(declare-fun lt!451282 () SeekEntryResult!9565)

(declare-fun arrayCountValidKeys!0 (array!64341 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026307 (= (arrayCountValidKeys!0 (array!64342 (store (arr!30973 (_keys!11191 thiss!1427)) (index!40632 lt!451282) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31487 (_keys!11191 thiss!1427))) #b00000000000000000000000000000000 (size!31487 (_keys!11191 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11191 thiss!1427) #b00000000000000000000000000000000 (size!31487 (_keys!11191 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33384 0))(
  ( (Unit!33385) )
))
(declare-fun lt!451281 () Unit!33384)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64341 (_ BitVec 32) (_ BitVec 64)) Unit!33384)

(assert (=> b!1026307 (= lt!451281 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11191 thiss!1427) (index!40632 lt!451282) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026308 () Bool)

(declare-fun res!686757 () Bool)

(assert (=> b!1026308 (=> res!686757 e!578707)))

(declare-fun noDuplicate!1484 (List!21731) Bool)

(assert (=> b!1026308 (= res!686757 (not (noDuplicate!1484 Nil!21728)))))

(declare-fun b!1026309 () Bool)

(declare-fun res!686760 () Bool)

(assert (=> b!1026309 (=> res!686760 e!578707)))

(assert (=> b!1026309 (= res!686760 (contains!5984 Nil!21728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026310 () Bool)

(declare-fun e!578711 () Bool)

(assert (=> b!1026310 (= e!578711 e!578709)))

(declare-fun res!686758 () Bool)

(assert (=> b!1026310 (=> (not res!686758) (not e!578709))))

(get-info :version)

(assert (=> b!1026310 (= res!686758 ((_ is Found!9565) lt!451282))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64341 (_ BitVec 32)) SeekEntryResult!9565)

(assert (=> b!1026310 (= lt!451282 (seekEntry!0 key!909 (_keys!11191 thiss!1427) (mask!29728 thiss!1427)))))

(declare-fun mapIsEmpty!37610 () Bool)

(declare-fun mapRes!37610 () Bool)

(assert (=> mapIsEmpty!37610 mapRes!37610))

(declare-fun b!1026311 () Bool)

(declare-fun e!578706 () Bool)

(declare-fun tp_is_empty!24121 () Bool)

(assert (=> b!1026311 (= e!578706 tp_is_empty!24121)))

(declare-fun mapNonEmpty!37610 () Bool)

(declare-fun tp!72249 () Bool)

(assert (=> mapNonEmpty!37610 (= mapRes!37610 (and tp!72249 e!578706))))

(declare-fun mapKey!37610 () (_ BitVec 32))

(declare-fun mapRest!37610 () (Array (_ BitVec 32) ValueCell!11357))

(declare-fun mapValue!37610 () ValueCell!11357)

(assert (=> mapNonEmpty!37610 (= (arr!30974 (_values!6029 thiss!1427)) (store mapRest!37610 mapKey!37610 mapValue!37610))))

(declare-fun res!686761 () Bool)

(assert (=> start!89636 (=> (not res!686761) (not e!578711))))

(declare-fun valid!2026 (LongMapFixedSize!5308) Bool)

(assert (=> start!89636 (= res!686761 (valid!2026 thiss!1427))))

(assert (=> start!89636 e!578711))

(declare-fun e!578710 () Bool)

(assert (=> start!89636 e!578710))

(assert (=> start!89636 true))

(declare-fun b!1026312 () Bool)

(declare-fun e!578712 () Bool)

(assert (=> b!1026312 (= e!578712 tp_is_empty!24121)))

(declare-fun e!578713 () Bool)

(declare-fun array_inv!24011 (array!64341) Bool)

(declare-fun array_inv!24012 (array!64343) Bool)

(assert (=> b!1026313 (= e!578710 (and tp!72248 tp_is_empty!24121 (array_inv!24011 (_keys!11191 thiss!1427)) (array_inv!24012 (_values!6029 thiss!1427)) e!578713))))

(declare-fun b!1026314 () Bool)

(declare-fun res!686756 () Bool)

(assert (=> b!1026314 (=> (not res!686756) (not e!578711))))

(assert (=> b!1026314 (= res!686756 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026315 () Bool)

(assert (=> b!1026315 (= e!578713 (and e!578712 mapRes!37610))))

(declare-fun condMapEmpty!37610 () Bool)

(declare-fun mapDefault!37610 () ValueCell!11357)

(assert (=> b!1026315 (= condMapEmpty!37610 (= (arr!30974 (_values!6029 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11357)) mapDefault!37610)))))

(assert (= (and start!89636 res!686761) b!1026314))

(assert (= (and b!1026314 res!686756) b!1026310))

(assert (= (and b!1026310 res!686758) b!1026307))

(assert (= (and b!1026307 (not res!686762)) b!1026308))

(assert (= (and b!1026308 (not res!686757)) b!1026309))

(assert (= (and b!1026309 (not res!686760)) b!1026305))

(assert (= (and b!1026305 (not res!686759)) b!1026306))

(assert (= (and b!1026315 condMapEmpty!37610) mapIsEmpty!37610))

(assert (= (and b!1026315 (not condMapEmpty!37610)) mapNonEmpty!37610))

(assert (= (and mapNonEmpty!37610 ((_ is ValueCellFull!11357) mapValue!37610)) b!1026311))

(assert (= (and b!1026315 ((_ is ValueCellFull!11357) mapDefault!37610)) b!1026312))

(assert (= b!1026313 b!1026315))

(assert (= start!89636 b!1026313))

(declare-fun m!944883 () Bool)

(assert (=> b!1026309 m!944883))

(declare-fun m!944885 () Bool)

(assert (=> start!89636 m!944885))

(declare-fun m!944887 () Bool)

(assert (=> b!1026307 m!944887))

(declare-fun m!944889 () Bool)

(assert (=> b!1026307 m!944889))

(declare-fun m!944891 () Bool)

(assert (=> b!1026307 m!944891))

(declare-fun m!944893 () Bool)

(assert (=> b!1026307 m!944893))

(declare-fun m!944895 () Bool)

(assert (=> b!1026305 m!944895))

(declare-fun m!944897 () Bool)

(assert (=> b!1026306 m!944897))

(declare-fun m!944899 () Bool)

(assert (=> mapNonEmpty!37610 m!944899))

(declare-fun m!944901 () Bool)

(assert (=> b!1026310 m!944901))

(declare-fun m!944903 () Bool)

(assert (=> b!1026308 m!944903))

(declare-fun m!944905 () Bool)

(assert (=> b!1026313 m!944905))

(declare-fun m!944907 () Bool)

(assert (=> b!1026313 m!944907))

(check-sat (not b!1026307) (not b!1026309) (not b!1026306) (not b!1026313) (not b!1026305) tp_is_empty!24121 (not b!1026310) (not b!1026308) (not b_next!20401) (not start!89636) b_and!32657 (not mapNonEmpty!37610))
(check-sat b_and!32657 (not b_next!20401))
