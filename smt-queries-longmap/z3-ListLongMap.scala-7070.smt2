; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89476 () Bool)

(assert start!89476)

(declare-fun b!1026115 () Bool)

(declare-fun b_free!20475 () Bool)

(declare-fun b_next!20475 () Bool)

(assert (=> b!1026115 (= b_free!20475 (not b_next!20475))))

(declare-fun tp!72470 () Bool)

(declare-fun b_and!32721 () Bool)

(assert (=> b!1026115 (= tp!72470 b_and!32721)))

(declare-fun mapIsEmpty!37721 () Bool)

(declare-fun mapRes!37721 () Bool)

(assert (=> mapIsEmpty!37721 mapRes!37721))

(declare-fun e!578756 () Bool)

(declare-fun e!578753 () Bool)

(declare-datatypes ((V!37133 0))(
  ( (V!37134 (val!12148 Int)) )
))
(declare-datatypes ((ValueCell!11394 0))(
  ( (ValueCellFull!11394 (v!14717 V!37133)) (EmptyCell!11394) )
))
(declare-datatypes ((array!64440 0))(
  ( (array!64441 (arr!31029 (Array (_ BitVec 32) (_ BitVec 64))) (size!31542 (_ BitVec 32))) )
))
(declare-datatypes ((array!64442 0))(
  ( (array!64443 (arr!31030 (Array (_ BitVec 32) ValueCell!11394)) (size!31543 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5382 0))(
  ( (LongMapFixedSize!5383 (defaultEntry!6043 Int) (mask!29729 (_ BitVec 32)) (extraKeys!5775 (_ BitVec 32)) (zeroValue!5879 V!37133) (minValue!5879 V!37133) (_size!2746 (_ BitVec 32)) (_keys!11190 array!64440) (_values!6066 array!64442) (_vacant!2746 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5382)

(declare-fun tp_is_empty!24195 () Bool)

(declare-fun array_inv!24029 (array!64440) Bool)

(declare-fun array_inv!24030 (array!64442) Bool)

(assert (=> b!1026115 (= e!578753 (and tp!72470 tp_is_empty!24195 (array_inv!24029 (_keys!11190 thiss!1427)) (array_inv!24030 (_values!6066 thiss!1427)) e!578756))))

(declare-fun b!1026116 () Bool)

(declare-fun e!578757 () Bool)

(declare-fun e!578751 () Bool)

(assert (=> b!1026116 (= e!578757 e!578751)))

(declare-fun res!686930 () Bool)

(assert (=> b!1026116 (=> (not res!686930) (not e!578751))))

(declare-datatypes ((SeekEntryResult!9639 0))(
  ( (MissingZero!9639 (index!40927 (_ BitVec 32))) (Found!9639 (index!40928 (_ BitVec 32))) (Intermediate!9639 (undefined!10451 Bool) (index!40929 (_ BitVec 32)) (x!91269 (_ BitVec 32))) (Undefined!9639) (MissingVacant!9639 (index!40930 (_ BitVec 32))) )
))
(declare-fun lt!451325 () SeekEntryResult!9639)

(get-info :version)

(assert (=> b!1026116 (= res!686930 ((_ is Found!9639) lt!451325))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64440 (_ BitVec 32)) SeekEntryResult!9639)

(assert (=> b!1026116 (= lt!451325 (seekEntry!0 key!909 (_keys!11190 thiss!1427) (mask!29729 thiss!1427)))))

(declare-fun b!1026117 () Bool)

(declare-fun res!686927 () Bool)

(assert (=> b!1026117 (=> (not res!686927) (not e!578757))))

(assert (=> b!1026117 (= res!686927 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026118 () Bool)

(declare-fun e!578754 () Bool)

(assert (=> b!1026118 (= e!578754 tp_is_empty!24195)))

(declare-fun res!686928 () Bool)

(assert (=> start!89476 (=> (not res!686928) (not e!578757))))

(declare-fun valid!2045 (LongMapFixedSize!5382) Bool)

(assert (=> start!89476 (= res!686928 (valid!2045 thiss!1427))))

(assert (=> start!89476 e!578757))

(assert (=> start!89476 e!578753))

(assert (=> start!89476 true))

(declare-fun b!1026119 () Bool)

(declare-fun e!578755 () Bool)

(assert (=> b!1026119 (= e!578751 (not e!578755))))

(declare-fun res!686929 () Bool)

(assert (=> b!1026119 (=> res!686929 e!578755)))

(assert (=> b!1026119 (= res!686929 (or (bvslt (index!40928 lt!451325) #b00000000000000000000000000000000) (bvsge (index!40928 lt!451325) (size!31542 (_keys!11190 thiss!1427))) (bvsge (size!31542 (_keys!11190 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451322 () array!64440)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64440 (_ BitVec 32)) Bool)

(assert (=> b!1026119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451322 (mask!29729 thiss!1427))))

(declare-datatypes ((Unit!33423 0))(
  ( (Unit!33424) )
))
(declare-fun lt!451326 () Unit!33423)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64440 (_ BitVec 32) (_ BitVec 32)) Unit!33423)

(assert (=> b!1026119 (= lt!451326 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11190 thiss!1427) (index!40928 lt!451325) (mask!29729 thiss!1427)))))

(declare-datatypes ((List!21770 0))(
  ( (Nil!21767) (Cons!21766 (h!22964 (_ BitVec 64)) (t!30832 List!21770)) )
))
(declare-fun arrayNoDuplicates!0 (array!64440 (_ BitVec 32) List!21770) Bool)

(assert (=> b!1026119 (arrayNoDuplicates!0 lt!451322 #b00000000000000000000000000000000 Nil!21767)))

(declare-fun lt!451321 () Unit!33423)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64440 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21770) Unit!33423)

(assert (=> b!1026119 (= lt!451321 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11190 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40928 lt!451325) #b00000000000000000000000000000000 Nil!21767))))

(declare-fun arrayCountValidKeys!0 (array!64440 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026119 (= (arrayCountValidKeys!0 lt!451322 #b00000000000000000000000000000000 (size!31542 (_keys!11190 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11190 thiss!1427) #b00000000000000000000000000000000 (size!31542 (_keys!11190 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026119 (= lt!451322 (array!64441 (store (arr!31029 (_keys!11190 thiss!1427)) (index!40928 lt!451325) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31542 (_keys!11190 thiss!1427))))))

(declare-fun lt!451323 () Unit!33423)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64440 (_ BitVec 32) (_ BitVec 64)) Unit!33423)

(assert (=> b!1026119 (= lt!451323 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11190 thiss!1427) (index!40928 lt!451325) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026120 () Bool)

(assert (=> b!1026120 (= e!578755 true)))

(declare-fun lt!451324 () Bool)

(assert (=> b!1026120 (= lt!451324 (arrayNoDuplicates!0 (_keys!11190 thiss!1427) #b00000000000000000000000000000000 Nil!21767))))

(declare-fun b!1026121 () Bool)

(assert (=> b!1026121 (= e!578756 (and e!578754 mapRes!37721))))

(declare-fun condMapEmpty!37721 () Bool)

(declare-fun mapDefault!37721 () ValueCell!11394)

(assert (=> b!1026121 (= condMapEmpty!37721 (= (arr!31030 (_values!6066 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11394)) mapDefault!37721)))))

(declare-fun b!1026122 () Bool)

(declare-fun e!578752 () Bool)

(assert (=> b!1026122 (= e!578752 tp_is_empty!24195)))

(declare-fun mapNonEmpty!37721 () Bool)

(declare-fun tp!72471 () Bool)

(assert (=> mapNonEmpty!37721 (= mapRes!37721 (and tp!72471 e!578752))))

(declare-fun mapRest!37721 () (Array (_ BitVec 32) ValueCell!11394))

(declare-fun mapKey!37721 () (_ BitVec 32))

(declare-fun mapValue!37721 () ValueCell!11394)

(assert (=> mapNonEmpty!37721 (= (arr!31030 (_values!6066 thiss!1427)) (store mapRest!37721 mapKey!37721 mapValue!37721))))

(assert (= (and start!89476 res!686928) b!1026117))

(assert (= (and b!1026117 res!686927) b!1026116))

(assert (= (and b!1026116 res!686930) b!1026119))

(assert (= (and b!1026119 (not res!686929)) b!1026120))

(assert (= (and b!1026121 condMapEmpty!37721) mapIsEmpty!37721))

(assert (= (and b!1026121 (not condMapEmpty!37721)) mapNonEmpty!37721))

(assert (= (and mapNonEmpty!37721 ((_ is ValueCellFull!11394) mapValue!37721)) b!1026122))

(assert (= (and b!1026121 ((_ is ValueCellFull!11394) mapDefault!37721)) b!1026118))

(assert (= b!1026115 b!1026121))

(assert (= start!89476 b!1026115))

(declare-fun m!944327 () Bool)

(assert (=> b!1026119 m!944327))

(declare-fun m!944329 () Bool)

(assert (=> b!1026119 m!944329))

(declare-fun m!944331 () Bool)

(assert (=> b!1026119 m!944331))

(declare-fun m!944333 () Bool)

(assert (=> b!1026119 m!944333))

(declare-fun m!944335 () Bool)

(assert (=> b!1026119 m!944335))

(declare-fun m!944337 () Bool)

(assert (=> b!1026119 m!944337))

(declare-fun m!944339 () Bool)

(assert (=> b!1026119 m!944339))

(declare-fun m!944341 () Bool)

(assert (=> b!1026119 m!944341))

(declare-fun m!944343 () Bool)

(assert (=> mapNonEmpty!37721 m!944343))

(declare-fun m!944345 () Bool)

(assert (=> b!1026116 m!944345))

(declare-fun m!944347 () Bool)

(assert (=> b!1026120 m!944347))

(declare-fun m!944349 () Bool)

(assert (=> start!89476 m!944349))

(declare-fun m!944351 () Bool)

(assert (=> b!1026115 m!944351))

(declare-fun m!944353 () Bool)

(assert (=> b!1026115 m!944353))

(check-sat (not b!1026120) (not b_next!20475) b_and!32721 (not b!1026115) (not mapNonEmpty!37721) tp_is_empty!24195 (not start!89476) (not b!1026119) (not b!1026116))
(check-sat b_and!32721 (not b_next!20475))
