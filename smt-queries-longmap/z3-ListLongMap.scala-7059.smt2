; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89410 () Bool)

(assert start!89410)

(declare-fun b!1025129 () Bool)

(declare-fun b_free!20409 () Bool)

(declare-fun b_next!20409 () Bool)

(assert (=> b!1025129 (= b_free!20409 (not b_next!20409))))

(declare-fun tp!72272 () Bool)

(declare-fun b_and!32655 () Bool)

(assert (=> b!1025129 (= tp!72272 b_and!32655)))

(declare-fun res!686330 () Bool)

(declare-fun e!577963 () Bool)

(assert (=> start!89410 (=> (not res!686330) (not e!577963))))

(declare-datatypes ((V!37045 0))(
  ( (V!37046 (val!12115 Int)) )
))
(declare-datatypes ((ValueCell!11361 0))(
  ( (ValueCellFull!11361 (v!14684 V!37045)) (EmptyCell!11361) )
))
(declare-datatypes ((array!64308 0))(
  ( (array!64309 (arr!30963 (Array (_ BitVec 32) (_ BitVec 64))) (size!31476 (_ BitVec 32))) )
))
(declare-datatypes ((array!64310 0))(
  ( (array!64311 (arr!30964 (Array (_ BitVec 32) ValueCell!11361)) (size!31477 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5316 0))(
  ( (LongMapFixedSize!5317 (defaultEntry!6010 Int) (mask!29674 (_ BitVec 32)) (extraKeys!5742 (_ BitVec 32)) (zeroValue!5846 V!37045) (minValue!5846 V!37045) (_size!2713 (_ BitVec 32)) (_keys!11157 array!64308) (_values!6033 array!64310) (_vacant!2713 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5316)

(declare-fun valid!2021 (LongMapFixedSize!5316) Bool)

(assert (=> start!89410 (= res!686330 (valid!2021 thiss!1427))))

(assert (=> start!89410 e!577963))

(declare-fun e!577959 () Bool)

(assert (=> start!89410 e!577959))

(assert (=> start!89410 true))

(declare-fun b!1025122 () Bool)

(declare-fun res!686331 () Bool)

(declare-fun e!577966 () Bool)

(assert (=> b!1025122 (=> res!686331 e!577966)))

(declare-datatypes ((List!21744 0))(
  ( (Nil!21741) (Cons!21740 (h!22938 (_ BitVec 64)) (t!30806 List!21744)) )
))
(declare-fun noDuplicate!1473 (List!21744) Bool)

(assert (=> b!1025122 (= res!686331 (not (noDuplicate!1473 Nil!21741)))))

(declare-fun b!1025123 () Bool)

(declare-fun e!577960 () Bool)

(declare-fun e!577962 () Bool)

(declare-fun mapRes!37622 () Bool)

(assert (=> b!1025123 (= e!577960 (and e!577962 mapRes!37622))))

(declare-fun condMapEmpty!37622 () Bool)

(declare-fun mapDefault!37622 () ValueCell!11361)

(assert (=> b!1025123 (= condMapEmpty!37622 (= (arr!30964 (_values!6033 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11361)) mapDefault!37622)))))

(declare-fun b!1025124 () Bool)

(declare-fun e!577965 () Bool)

(assert (=> b!1025124 (= e!577963 e!577965)))

(declare-fun res!686334 () Bool)

(assert (=> b!1025124 (=> (not res!686334) (not e!577965))))

(declare-datatypes ((SeekEntryResult!9609 0))(
  ( (MissingZero!9609 (index!40807 (_ BitVec 32))) (Found!9609 (index!40808 (_ BitVec 32))) (Intermediate!9609 (undefined!10421 Bool) (index!40809 (_ BitVec 32)) (x!91151 (_ BitVec 32))) (Undefined!9609) (MissingVacant!9609 (index!40810 (_ BitVec 32))) )
))
(declare-fun lt!450802 () SeekEntryResult!9609)

(get-info :version)

(assert (=> b!1025124 (= res!686334 ((_ is Found!9609) lt!450802))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64308 (_ BitVec 32)) SeekEntryResult!9609)

(assert (=> b!1025124 (= lt!450802 (seekEntry!0 key!909 (_keys!11157 thiss!1427) (mask!29674 thiss!1427)))))

(declare-fun mapIsEmpty!37622 () Bool)

(assert (=> mapIsEmpty!37622 mapRes!37622))

(declare-fun b!1025125 () Bool)

(declare-fun tp_is_empty!24129 () Bool)

(assert (=> b!1025125 (= e!577962 tp_is_empty!24129)))

(declare-fun b!1025126 () Bool)

(declare-fun res!686333 () Bool)

(assert (=> b!1025126 (=> res!686333 e!577966)))

(declare-fun contains!5960 (List!21744 (_ BitVec 64)) Bool)

(assert (=> b!1025126 (= res!686333 (contains!5960 Nil!21741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025127 () Bool)

(declare-fun res!686336 () Bool)

(assert (=> b!1025127 (=> (not res!686336) (not e!577963))))

(assert (=> b!1025127 (= res!686336 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025128 () Bool)

(declare-fun e!577964 () Bool)

(assert (=> b!1025128 (= e!577964 tp_is_empty!24129)))

(declare-fun array_inv!23979 (array!64308) Bool)

(declare-fun array_inv!23980 (array!64310) Bool)

(assert (=> b!1025129 (= e!577959 (and tp!72272 tp_is_empty!24129 (array_inv!23979 (_keys!11157 thiss!1427)) (array_inv!23980 (_values!6033 thiss!1427)) e!577960))))

(declare-fun b!1025130 () Bool)

(declare-fun res!686335 () Bool)

(assert (=> b!1025130 (=> res!686335 e!577966)))

(assert (=> b!1025130 (= res!686335 (contains!5960 Nil!21741 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025131 () Bool)

(assert (=> b!1025131 (= e!577965 (not e!577966))))

(declare-fun res!686332 () Bool)

(assert (=> b!1025131 (=> res!686332 e!577966)))

(assert (=> b!1025131 (= res!686332 (or (bvsge (size!31476 (_keys!11157 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31476 (_keys!11157 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64308 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025131 (= (arrayCountValidKeys!0 (array!64309 (store (arr!30963 (_keys!11157 thiss!1427)) (index!40808 lt!450802) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31476 (_keys!11157 thiss!1427))) #b00000000000000000000000000000000 (size!31476 (_keys!11157 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11157 thiss!1427) #b00000000000000000000000000000000 (size!31476 (_keys!11157 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33375 0))(
  ( (Unit!33376) )
))
(declare-fun lt!450803 () Unit!33375)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64308 (_ BitVec 32) (_ BitVec 64)) Unit!33375)

(assert (=> b!1025131 (= lt!450803 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11157 thiss!1427) (index!40808 lt!450802) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37622 () Bool)

(declare-fun tp!72273 () Bool)

(assert (=> mapNonEmpty!37622 (= mapRes!37622 (and tp!72273 e!577964))))

(declare-fun mapValue!37622 () ValueCell!11361)

(declare-fun mapKey!37622 () (_ BitVec 32))

(declare-fun mapRest!37622 () (Array (_ BitVec 32) ValueCell!11361))

(assert (=> mapNonEmpty!37622 (= (arr!30964 (_values!6033 thiss!1427)) (store mapRest!37622 mapKey!37622 mapValue!37622))))

(declare-fun b!1025132 () Bool)

(assert (=> b!1025132 (= e!577966 true)))

(declare-fun lt!450804 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64308 (_ BitVec 32) List!21744) Bool)

(assert (=> b!1025132 (= lt!450804 (arrayNoDuplicates!0 (_keys!11157 thiss!1427) #b00000000000000000000000000000000 Nil!21741))))

(assert (= (and start!89410 res!686330) b!1025127))

(assert (= (and b!1025127 res!686336) b!1025124))

(assert (= (and b!1025124 res!686334) b!1025131))

(assert (= (and b!1025131 (not res!686332)) b!1025122))

(assert (= (and b!1025122 (not res!686331)) b!1025126))

(assert (= (and b!1025126 (not res!686333)) b!1025130))

(assert (= (and b!1025130 (not res!686335)) b!1025132))

(assert (= (and b!1025123 condMapEmpty!37622) mapIsEmpty!37622))

(assert (= (and b!1025123 (not condMapEmpty!37622)) mapNonEmpty!37622))

(assert (= (and mapNonEmpty!37622 ((_ is ValueCellFull!11361) mapValue!37622)) b!1025128))

(assert (= (and b!1025123 ((_ is ValueCellFull!11361) mapDefault!37622)) b!1025125))

(assert (= b!1025129 b!1025123))

(assert (= start!89410 b!1025129))

(declare-fun m!943323 () Bool)

(assert (=> b!1025132 m!943323))

(declare-fun m!943325 () Bool)

(assert (=> b!1025131 m!943325))

(declare-fun m!943327 () Bool)

(assert (=> b!1025131 m!943327))

(declare-fun m!943329 () Bool)

(assert (=> b!1025131 m!943329))

(declare-fun m!943331 () Bool)

(assert (=> b!1025131 m!943331))

(declare-fun m!943333 () Bool)

(assert (=> b!1025126 m!943333))

(declare-fun m!943335 () Bool)

(assert (=> mapNonEmpty!37622 m!943335))

(declare-fun m!943337 () Bool)

(assert (=> b!1025129 m!943337))

(declare-fun m!943339 () Bool)

(assert (=> b!1025129 m!943339))

(declare-fun m!943341 () Bool)

(assert (=> b!1025130 m!943341))

(declare-fun m!943343 () Bool)

(assert (=> b!1025124 m!943343))

(declare-fun m!943345 () Bool)

(assert (=> start!89410 m!943345))

(declare-fun m!943347 () Bool)

(assert (=> b!1025122 m!943347))

(check-sat (not b!1025122) (not start!89410) b_and!32655 tp_is_empty!24129 (not b!1025126) (not b!1025132) (not b_next!20409) (not b!1025124) (not b!1025129) (not b!1025131) (not mapNonEmpty!37622) (not b!1025130))
(check-sat b_and!32655 (not b_next!20409))
