; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89404 () Bool)

(assert start!89404)

(declare-fun b!1025030 () Bool)

(declare-fun b_free!20403 () Bool)

(declare-fun b_next!20403 () Bool)

(assert (=> b!1025030 (= b_free!20403 (not b_next!20403))))

(declare-fun tp!72254 () Bool)

(declare-fun b_and!32649 () Bool)

(assert (=> b!1025030 (= tp!72254 b_and!32649)))

(declare-fun b!1025023 () Bool)

(declare-fun res!686270 () Bool)

(declare-fun e!577888 () Bool)

(assert (=> b!1025023 (=> (not res!686270) (not e!577888))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025023 (= res!686270 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025024 () Bool)

(declare-fun e!577890 () Bool)

(declare-fun e!577893 () Bool)

(declare-fun mapRes!37613 () Bool)

(assert (=> b!1025024 (= e!577890 (and e!577893 mapRes!37613))))

(declare-fun condMapEmpty!37613 () Bool)

(declare-datatypes ((V!37037 0))(
  ( (V!37038 (val!12112 Int)) )
))
(declare-datatypes ((ValueCell!11358 0))(
  ( (ValueCellFull!11358 (v!14681 V!37037)) (EmptyCell!11358) )
))
(declare-datatypes ((array!64296 0))(
  ( (array!64297 (arr!30957 (Array (_ BitVec 32) (_ BitVec 64))) (size!31470 (_ BitVec 32))) )
))
(declare-datatypes ((array!64298 0))(
  ( (array!64299 (arr!30958 (Array (_ BitVec 32) ValueCell!11358)) (size!31471 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5310 0))(
  ( (LongMapFixedSize!5311 (defaultEntry!6007 Int) (mask!29669 (_ BitVec 32)) (extraKeys!5739 (_ BitVec 32)) (zeroValue!5843 V!37037) (minValue!5843 V!37037) (_size!2710 (_ BitVec 32)) (_keys!11154 array!64296) (_values!6030 array!64298) (_vacant!2710 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5310)

(declare-fun mapDefault!37613 () ValueCell!11358)

(assert (=> b!1025024 (= condMapEmpty!37613 (= (arr!30958 (_values!6030 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11358)) mapDefault!37613)))))

(declare-fun b!1025025 () Bool)

(declare-fun e!577892 () Bool)

(declare-fun tp_is_empty!24123 () Bool)

(assert (=> b!1025025 (= e!577892 tp_is_empty!24123)))

(declare-fun b!1025026 () Bool)

(declare-fun res!686267 () Bool)

(declare-fun e!577889 () Bool)

(assert (=> b!1025026 (=> res!686267 e!577889)))

(declare-datatypes ((List!21741 0))(
  ( (Nil!21738) (Cons!21737 (h!22935 (_ BitVec 64)) (t!30803 List!21741)) )
))
(declare-fun contains!5957 (List!21741 (_ BitVec 64)) Bool)

(assert (=> b!1025026 (= res!686267 (contains!5957 Nil!21738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!686268 () Bool)

(assert (=> start!89404 (=> (not res!686268) (not e!577888))))

(declare-fun valid!2019 (LongMapFixedSize!5310) Bool)

(assert (=> start!89404 (= res!686268 (valid!2019 thiss!1427))))

(assert (=> start!89404 e!577888))

(declare-fun e!577894 () Bool)

(assert (=> start!89404 e!577894))

(assert (=> start!89404 true))

(declare-fun b!1025027 () Bool)

(declare-fun e!577887 () Bool)

(assert (=> b!1025027 (= e!577887 (not e!577889))))

(declare-fun res!686273 () Bool)

(assert (=> b!1025027 (=> res!686273 e!577889)))

(assert (=> b!1025027 (= res!686273 (or (bvsge (size!31470 (_keys!11154 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31470 (_keys!11154 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9606 0))(
  ( (MissingZero!9606 (index!40795 (_ BitVec 32))) (Found!9606 (index!40796 (_ BitVec 32))) (Intermediate!9606 (undefined!10418 Bool) (index!40797 (_ BitVec 32)) (x!91140 (_ BitVec 32))) (Undefined!9606) (MissingVacant!9606 (index!40798 (_ BitVec 32))) )
))
(declare-fun lt!450777 () SeekEntryResult!9606)

(declare-fun arrayCountValidKeys!0 (array!64296 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025027 (= (arrayCountValidKeys!0 (array!64297 (store (arr!30957 (_keys!11154 thiss!1427)) (index!40796 lt!450777) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31470 (_keys!11154 thiss!1427))) #b00000000000000000000000000000000 (size!31470 (_keys!11154 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11154 thiss!1427) #b00000000000000000000000000000000 (size!31470 (_keys!11154 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33369 0))(
  ( (Unit!33370) )
))
(declare-fun lt!450776 () Unit!33369)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64296 (_ BitVec 32) (_ BitVec 64)) Unit!33369)

(assert (=> b!1025027 (= lt!450776 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11154 thiss!1427) (index!40796 lt!450777) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37613 () Bool)

(declare-fun tp!72255 () Bool)

(assert (=> mapNonEmpty!37613 (= mapRes!37613 (and tp!72255 e!577892))))

(declare-fun mapRest!37613 () (Array (_ BitVec 32) ValueCell!11358))

(declare-fun mapValue!37613 () ValueCell!11358)

(declare-fun mapKey!37613 () (_ BitVec 32))

(assert (=> mapNonEmpty!37613 (= (arr!30958 (_values!6030 thiss!1427)) (store mapRest!37613 mapKey!37613 mapValue!37613))))

(declare-fun b!1025028 () Bool)

(assert (=> b!1025028 (= e!577888 e!577887)))

(declare-fun res!686269 () Bool)

(assert (=> b!1025028 (=> (not res!686269) (not e!577887))))

(get-info :version)

(assert (=> b!1025028 (= res!686269 ((_ is Found!9606) lt!450777))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64296 (_ BitVec 32)) SeekEntryResult!9606)

(assert (=> b!1025028 (= lt!450777 (seekEntry!0 key!909 (_keys!11154 thiss!1427) (mask!29669 thiss!1427)))))

(declare-fun b!1025029 () Bool)

(assert (=> b!1025029 (= e!577893 tp_is_empty!24123)))

(declare-fun array_inv!23973 (array!64296) Bool)

(declare-fun array_inv!23974 (array!64298) Bool)

(assert (=> b!1025030 (= e!577894 (and tp!72254 tp_is_empty!24123 (array_inv!23973 (_keys!11154 thiss!1427)) (array_inv!23974 (_values!6030 thiss!1427)) e!577890))))

(declare-fun mapIsEmpty!37613 () Bool)

(assert (=> mapIsEmpty!37613 mapRes!37613))

(declare-fun b!1025031 () Bool)

(declare-fun res!686271 () Bool)

(assert (=> b!1025031 (=> res!686271 e!577889)))

(assert (=> b!1025031 (= res!686271 (contains!5957 Nil!21738 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025032 () Bool)

(assert (=> b!1025032 (= e!577889 true)))

(declare-fun lt!450775 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64296 (_ BitVec 32) List!21741) Bool)

(assert (=> b!1025032 (= lt!450775 (arrayNoDuplicates!0 (_keys!11154 thiss!1427) #b00000000000000000000000000000000 Nil!21738))))

(declare-fun b!1025033 () Bool)

(declare-fun res!686272 () Bool)

(assert (=> b!1025033 (=> res!686272 e!577889)))

(declare-fun noDuplicate!1471 (List!21741) Bool)

(assert (=> b!1025033 (= res!686272 (not (noDuplicate!1471 Nil!21738)))))

(assert (= (and start!89404 res!686268) b!1025023))

(assert (= (and b!1025023 res!686270) b!1025028))

(assert (= (and b!1025028 res!686269) b!1025027))

(assert (= (and b!1025027 (not res!686273)) b!1025033))

(assert (= (and b!1025033 (not res!686272)) b!1025026))

(assert (= (and b!1025026 (not res!686267)) b!1025031))

(assert (= (and b!1025031 (not res!686271)) b!1025032))

(assert (= (and b!1025024 condMapEmpty!37613) mapIsEmpty!37613))

(assert (= (and b!1025024 (not condMapEmpty!37613)) mapNonEmpty!37613))

(assert (= (and mapNonEmpty!37613 ((_ is ValueCellFull!11358) mapValue!37613)) b!1025025))

(assert (= (and b!1025024 ((_ is ValueCellFull!11358) mapDefault!37613)) b!1025029))

(assert (= b!1025030 b!1025024))

(assert (= start!89404 b!1025030))

(declare-fun m!943245 () Bool)

(assert (=> b!1025030 m!943245))

(declare-fun m!943247 () Bool)

(assert (=> b!1025030 m!943247))

(declare-fun m!943249 () Bool)

(assert (=> b!1025027 m!943249))

(declare-fun m!943251 () Bool)

(assert (=> b!1025027 m!943251))

(declare-fun m!943253 () Bool)

(assert (=> b!1025027 m!943253))

(declare-fun m!943255 () Bool)

(assert (=> b!1025027 m!943255))

(declare-fun m!943257 () Bool)

(assert (=> b!1025028 m!943257))

(declare-fun m!943259 () Bool)

(assert (=> b!1025032 m!943259))

(declare-fun m!943261 () Bool)

(assert (=> b!1025026 m!943261))

(declare-fun m!943263 () Bool)

(assert (=> b!1025033 m!943263))

(declare-fun m!943265 () Bool)

(assert (=> b!1025031 m!943265))

(declare-fun m!943267 () Bool)

(assert (=> start!89404 m!943267))

(declare-fun m!943269 () Bool)

(assert (=> mapNonEmpty!37613 m!943269))

(check-sat (not b!1025026) (not b!1025032) (not b!1025028) (not b!1025030) (not b_next!20403) b_and!32649 tp_is_empty!24123 (not b!1025031) (not b!1025033) (not b!1025027) (not start!89404) (not mapNonEmpty!37613))
(check-sat b_and!32649 (not b_next!20403))
