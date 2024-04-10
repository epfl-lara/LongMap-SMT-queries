; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90718 () Bool)

(assert start!90718)

(declare-fun b!1037335 () Bool)

(declare-fun b_free!20895 () Bool)

(declare-fun b_next!20895 () Bool)

(assert (=> b!1037335 (= b_free!20895 (not b_next!20895))))

(declare-fun tp!73830 () Bool)

(declare-fun b_and!33427 () Bool)

(assert (=> b!1037335 (= tp!73830 b_and!33427)))

(declare-fun b!1037334 () Bool)

(declare-fun e!586766 () Bool)

(declare-fun e!586764 () Bool)

(declare-fun mapRes!38451 () Bool)

(assert (=> b!1037334 (= e!586766 (and e!586764 mapRes!38451))))

(declare-fun condMapEmpty!38451 () Bool)

(declare-datatypes ((V!37693 0))(
  ( (V!37694 (val!12358 Int)) )
))
(declare-datatypes ((ValueCell!11604 0))(
  ( (ValueCellFull!11604 (v!14941 V!37693)) (EmptyCell!11604) )
))
(declare-datatypes ((array!65334 0))(
  ( (array!65335 (arr!31449 (Array (_ BitVec 32) (_ BitVec 64))) (size!31979 (_ BitVec 32))) )
))
(declare-datatypes ((array!65336 0))(
  ( (array!65337 (arr!31450 (Array (_ BitVec 32) ValueCell!11604)) (size!31980 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5802 0))(
  ( (LongMapFixedSize!5803 (defaultEntry!6283 Int) (mask!30200 (_ BitVec 32)) (extraKeys!6011 (_ BitVec 32)) (zeroValue!6117 V!37693) (minValue!6117 V!37693) (_size!2956 (_ BitVec 32)) (_keys!11479 array!65334) (_values!6306 array!65336) (_vacant!2956 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5802)

(declare-fun mapDefault!38451 () ValueCell!11604)

(assert (=> b!1037334 (= condMapEmpty!38451 (= (arr!31450 (_values!6306 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11604)) mapDefault!38451)))))

(declare-fun tp_is_empty!24615 () Bool)

(declare-fun e!586762 () Bool)

(declare-fun array_inv!24325 (array!65334) Bool)

(declare-fun array_inv!24326 (array!65336) Bool)

(assert (=> b!1037335 (= e!586762 (and tp!73830 tp_is_empty!24615 (array_inv!24325 (_keys!11479 thiss!1427)) (array_inv!24326 (_values!6306 thiss!1427)) e!586766))))

(declare-fun b!1037336 () Bool)

(assert (=> b!1037336 (= e!586764 tp_is_empty!24615)))

(declare-fun b!1037337 () Bool)

(declare-fun e!586768 () Bool)

(assert (=> b!1037337 (= e!586768 (not true))))

(declare-datatypes ((SeekEntryResult!9752 0))(
  ( (MissingZero!9752 (index!41379 (_ BitVec 32))) (Found!9752 (index!41380 (_ BitVec 32))) (Intermediate!9752 (undefined!10564 Bool) (index!41381 (_ BitVec 32)) (x!92535 (_ BitVec 32))) (Undefined!9752) (MissingVacant!9752 (index!41382 (_ BitVec 32))) )
))
(declare-fun lt!457462 () SeekEntryResult!9752)

(declare-fun arrayCountValidKeys!0 (array!65334 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037337 (= (arrayCountValidKeys!0 (array!65335 (store (arr!31449 (_keys!11479 thiss!1427)) (index!41380 lt!457462) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31979 (_keys!11479 thiss!1427))) #b00000000000000000000000000000000 (size!31979 (_keys!11479 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11479 thiss!1427) #b00000000000000000000000000000000 (size!31979 (_keys!11479 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33949 0))(
  ( (Unit!33950) )
))
(declare-fun lt!457463 () Unit!33949)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65334 (_ BitVec 32) (_ BitVec 64)) Unit!33949)

(assert (=> b!1037337 (= lt!457463 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11479 thiss!1427) (index!41380 lt!457462) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38451 () Bool)

(assert (=> mapIsEmpty!38451 mapRes!38451))

(declare-fun b!1037338 () Bool)

(declare-fun res!692140 () Bool)

(declare-fun e!586767 () Bool)

(assert (=> b!1037338 (=> (not res!692140) (not e!586767))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037338 (= res!692140 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037339 () Bool)

(declare-fun e!586765 () Bool)

(assert (=> b!1037339 (= e!586765 tp_is_empty!24615)))

(declare-fun mapNonEmpty!38451 () Bool)

(declare-fun tp!73831 () Bool)

(assert (=> mapNonEmpty!38451 (= mapRes!38451 (and tp!73831 e!586765))))

(declare-fun mapKey!38451 () (_ BitVec 32))

(declare-fun mapValue!38451 () ValueCell!11604)

(declare-fun mapRest!38451 () (Array (_ BitVec 32) ValueCell!11604))

(assert (=> mapNonEmpty!38451 (= (arr!31450 (_values!6306 thiss!1427)) (store mapRest!38451 mapKey!38451 mapValue!38451))))

(declare-fun b!1037333 () Bool)

(assert (=> b!1037333 (= e!586767 e!586768)))

(declare-fun res!692142 () Bool)

(assert (=> b!1037333 (=> (not res!692142) (not e!586768))))

(get-info :version)

(assert (=> b!1037333 (= res!692142 ((_ is Found!9752) lt!457462))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65334 (_ BitVec 32)) SeekEntryResult!9752)

(assert (=> b!1037333 (= lt!457462 (seekEntry!0 key!909 (_keys!11479 thiss!1427) (mask!30200 thiss!1427)))))

(declare-fun res!692141 () Bool)

(assert (=> start!90718 (=> (not res!692141) (not e!586767))))

(declare-fun valid!2188 (LongMapFixedSize!5802) Bool)

(assert (=> start!90718 (= res!692141 (valid!2188 thiss!1427))))

(assert (=> start!90718 e!586767))

(assert (=> start!90718 e!586762))

(assert (=> start!90718 true))

(assert (= (and start!90718 res!692141) b!1037338))

(assert (= (and b!1037338 res!692140) b!1037333))

(assert (= (and b!1037333 res!692142) b!1037337))

(assert (= (and b!1037334 condMapEmpty!38451) mapIsEmpty!38451))

(assert (= (and b!1037334 (not condMapEmpty!38451)) mapNonEmpty!38451))

(assert (= (and mapNonEmpty!38451 ((_ is ValueCellFull!11604) mapValue!38451)) b!1037339))

(assert (= (and b!1037334 ((_ is ValueCellFull!11604) mapDefault!38451)) b!1037336))

(assert (= b!1037335 b!1037334))

(assert (= start!90718 b!1037335))

(declare-fun m!957565 () Bool)

(assert (=> b!1037337 m!957565))

(declare-fun m!957567 () Bool)

(assert (=> b!1037337 m!957567))

(declare-fun m!957569 () Bool)

(assert (=> b!1037337 m!957569))

(declare-fun m!957571 () Bool)

(assert (=> b!1037337 m!957571))

(declare-fun m!957573 () Bool)

(assert (=> b!1037335 m!957573))

(declare-fun m!957575 () Bool)

(assert (=> b!1037335 m!957575))

(declare-fun m!957577 () Bool)

(assert (=> b!1037333 m!957577))

(declare-fun m!957579 () Bool)

(assert (=> mapNonEmpty!38451 m!957579))

(declare-fun m!957581 () Bool)

(assert (=> start!90718 m!957581))

(check-sat b_and!33427 (not b!1037335) tp_is_empty!24615 (not b_next!20895) (not b!1037337) (not start!90718) (not mapNonEmpty!38451) (not b!1037333))
(check-sat b_and!33427 (not b_next!20895))
