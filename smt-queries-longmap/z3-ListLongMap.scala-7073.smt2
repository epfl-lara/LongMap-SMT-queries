; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89494 () Bool)

(assert start!89494)

(declare-fun b!1026342 () Bool)

(declare-fun b_free!20493 () Bool)

(declare-fun b_next!20493 () Bool)

(assert (=> b!1026342 (= b_free!20493 (not b_next!20493))))

(declare-fun tp!72524 () Bool)

(declare-fun b_and!32739 () Bool)

(assert (=> b!1026342 (= tp!72524 b_and!32739)))

(declare-fun b!1026341 () Bool)

(declare-fun e!578967 () Bool)

(declare-fun e!578970 () Bool)

(assert (=> b!1026341 (= e!578967 (not e!578970))))

(declare-fun res!687045 () Bool)

(assert (=> b!1026341 (=> res!687045 e!578970)))

(declare-datatypes ((V!37157 0))(
  ( (V!37158 (val!12157 Int)) )
))
(declare-datatypes ((ValueCell!11403 0))(
  ( (ValueCellFull!11403 (v!14726 V!37157)) (EmptyCell!11403) )
))
(declare-datatypes ((array!64476 0))(
  ( (array!64477 (arr!31047 (Array (_ BitVec 32) (_ BitVec 64))) (size!31560 (_ BitVec 32))) )
))
(declare-datatypes ((array!64478 0))(
  ( (array!64479 (arr!31048 (Array (_ BitVec 32) ValueCell!11403)) (size!31561 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5400 0))(
  ( (LongMapFixedSize!5401 (defaultEntry!6052 Int) (mask!29744 (_ BitVec 32)) (extraKeys!5784 (_ BitVec 32)) (zeroValue!5888 V!37157) (minValue!5888 V!37157) (_size!2755 (_ BitVec 32)) (_keys!11199 array!64476) (_values!6075 array!64478) (_vacant!2755 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5400)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026341 (= res!687045 (not (validMask!0 (mask!29744 thiss!1427))))))

(declare-fun lt!451493 () array!64476)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026341 (not (arrayContainsKey!0 lt!451493 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9645 0))(
  ( (MissingZero!9645 (index!40951 (_ BitVec 32))) (Found!9645 (index!40952 (_ BitVec 32))) (Intermediate!9645 (undefined!10457 Bool) (index!40953 (_ BitVec 32)) (x!91299 (_ BitVec 32))) (Undefined!9645) (MissingVacant!9645 (index!40954 (_ BitVec 32))) )
))
(declare-fun lt!451488 () SeekEntryResult!9645)

(declare-datatypes ((Unit!33435 0))(
  ( (Unit!33436) )
))
(declare-fun lt!451494 () Unit!33435)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64476 (_ BitVec 32) (_ BitVec 64)) Unit!33435)

(assert (=> b!1026341 (= lt!451494 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11199 thiss!1427) (index!40952 lt!451488) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64476 (_ BitVec 32)) Bool)

(assert (=> b!1026341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451493 (mask!29744 thiss!1427))))

(declare-fun lt!451491 () Unit!33435)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64476 (_ BitVec 32) (_ BitVec 32)) Unit!33435)

(assert (=> b!1026341 (= lt!451491 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11199 thiss!1427) (index!40952 lt!451488) (mask!29744 thiss!1427)))))

(declare-datatypes ((List!21778 0))(
  ( (Nil!21775) (Cons!21774 (h!22972 (_ BitVec 64)) (t!30840 List!21778)) )
))
(declare-fun arrayNoDuplicates!0 (array!64476 (_ BitVec 32) List!21778) Bool)

(assert (=> b!1026341 (arrayNoDuplicates!0 lt!451493 #b00000000000000000000000000000000 Nil!21775)))

(declare-fun lt!451489 () Unit!33435)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64476 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21778) Unit!33435)

(assert (=> b!1026341 (= lt!451489 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11199 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40952 lt!451488) #b00000000000000000000000000000000 Nil!21775))))

(declare-fun arrayCountValidKeys!0 (array!64476 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026341 (= (arrayCountValidKeys!0 lt!451493 #b00000000000000000000000000000000 (size!31560 (_keys!11199 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11199 thiss!1427) #b00000000000000000000000000000000 (size!31560 (_keys!11199 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026341 (= lt!451493 (array!64477 (store (arr!31047 (_keys!11199 thiss!1427)) (index!40952 lt!451488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31560 (_keys!11199 thiss!1427))))))

(declare-fun lt!451490 () Unit!33435)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64476 (_ BitVec 32) (_ BitVec 64)) Unit!33435)

(assert (=> b!1026341 (= lt!451490 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11199 thiss!1427) (index!40952 lt!451488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!578972 () Bool)

(declare-fun tp_is_empty!24213 () Bool)

(declare-fun e!578973 () Bool)

(declare-fun array_inv!24041 (array!64476) Bool)

(declare-fun array_inv!24042 (array!64478) Bool)

(assert (=> b!1026342 (= e!578972 (and tp!72524 tp_is_empty!24213 (array_inv!24041 (_keys!11199 thiss!1427)) (array_inv!24042 (_values!6075 thiss!1427)) e!578973))))

(declare-fun b!1026343 () Bool)

(declare-fun e!578971 () Bool)

(declare-fun mapRes!37748 () Bool)

(assert (=> b!1026343 (= e!578973 (and e!578971 mapRes!37748))))

(declare-fun condMapEmpty!37748 () Bool)

(declare-fun mapDefault!37748 () ValueCell!11403)

(assert (=> b!1026343 (= condMapEmpty!37748 (= (arr!31048 (_values!6075 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11403)) mapDefault!37748)))))

(declare-fun mapNonEmpty!37748 () Bool)

(declare-fun tp!72525 () Bool)

(declare-fun e!578969 () Bool)

(assert (=> mapNonEmpty!37748 (= mapRes!37748 (and tp!72525 e!578969))))

(declare-fun mapRest!37748 () (Array (_ BitVec 32) ValueCell!11403))

(declare-fun mapValue!37748 () ValueCell!11403)

(declare-fun mapKey!37748 () (_ BitVec 32))

(assert (=> mapNonEmpty!37748 (= (arr!31048 (_values!6075 thiss!1427)) (store mapRest!37748 mapKey!37748 mapValue!37748))))

(declare-fun b!1026344 () Bool)

(declare-fun res!687049 () Bool)

(assert (=> b!1026344 (=> res!687049 e!578970)))

(assert (=> b!1026344 (= res!687049 (or (not (= (size!31561 (_values!6075 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29744 thiss!1427)))) (not (= (size!31560 (_keys!11199 thiss!1427)) (size!31561 (_values!6075 thiss!1427)))) (bvslt (mask!29744 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5784 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5784 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026345 () Bool)

(declare-fun res!687050 () Bool)

(declare-fun e!578974 () Bool)

(assert (=> b!1026345 (=> (not res!687050) (not e!578974))))

(assert (=> b!1026345 (= res!687050 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026346 () Bool)

(assert (=> b!1026346 (= e!578974 e!578967)))

(declare-fun res!687047 () Bool)

(assert (=> b!1026346 (=> (not res!687047) (not e!578967))))

(get-info :version)

(assert (=> b!1026346 (= res!687047 ((_ is Found!9645) lt!451488))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64476 (_ BitVec 32)) SeekEntryResult!9645)

(assert (=> b!1026346 (= lt!451488 (seekEntry!0 key!909 (_keys!11199 thiss!1427) (mask!29744 thiss!1427)))))

(declare-fun res!687048 () Bool)

(assert (=> start!89494 (=> (not res!687048) (not e!578974))))

(declare-fun valid!2051 (LongMapFixedSize!5400) Bool)

(assert (=> start!89494 (= res!687048 (valid!2051 thiss!1427))))

(assert (=> start!89494 e!578974))

(assert (=> start!89494 e!578972))

(assert (=> start!89494 true))

(declare-fun b!1026347 () Bool)

(declare-fun res!687046 () Bool)

(assert (=> b!1026347 (=> res!687046 e!578970)))

(assert (=> b!1026347 (= res!687046 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11199 thiss!1427) (mask!29744 thiss!1427))))))

(declare-fun b!1026348 () Bool)

(assert (=> b!1026348 (= e!578970 true)))

(declare-fun lt!451492 () Bool)

(assert (=> b!1026348 (= lt!451492 (arrayNoDuplicates!0 (_keys!11199 thiss!1427) #b00000000000000000000000000000000 Nil!21775))))

(declare-fun mapIsEmpty!37748 () Bool)

(assert (=> mapIsEmpty!37748 mapRes!37748))

(declare-fun b!1026349 () Bool)

(assert (=> b!1026349 (= e!578969 tp_is_empty!24213)))

(declare-fun b!1026350 () Bool)

(assert (=> b!1026350 (= e!578971 tp_is_empty!24213)))

(assert (= (and start!89494 res!687048) b!1026345))

(assert (= (and b!1026345 res!687050) b!1026346))

(assert (= (and b!1026346 res!687047) b!1026341))

(assert (= (and b!1026341 (not res!687045)) b!1026344))

(assert (= (and b!1026344 (not res!687049)) b!1026347))

(assert (= (and b!1026347 (not res!687046)) b!1026348))

(assert (= (and b!1026343 condMapEmpty!37748) mapIsEmpty!37748))

(assert (= (and b!1026343 (not condMapEmpty!37748)) mapNonEmpty!37748))

(assert (= (and mapNonEmpty!37748 ((_ is ValueCellFull!11403) mapValue!37748)) b!1026349))

(assert (= (and b!1026343 ((_ is ValueCellFull!11403) mapDefault!37748)) b!1026350))

(assert (= b!1026342 b!1026343))

(assert (= start!89494 b!1026342))

(declare-fun m!944587 () Bool)

(assert (=> b!1026348 m!944587))

(declare-fun m!944589 () Bool)

(assert (=> b!1026342 m!944589))

(declare-fun m!944591 () Bool)

(assert (=> b!1026342 m!944591))

(declare-fun m!944593 () Bool)

(assert (=> b!1026346 m!944593))

(declare-fun m!944595 () Bool)

(assert (=> mapNonEmpty!37748 m!944595))

(declare-fun m!944597 () Bool)

(assert (=> b!1026347 m!944597))

(declare-fun m!944599 () Bool)

(assert (=> b!1026341 m!944599))

(declare-fun m!944601 () Bool)

(assert (=> b!1026341 m!944601))

(declare-fun m!944603 () Bool)

(assert (=> b!1026341 m!944603))

(declare-fun m!944605 () Bool)

(assert (=> b!1026341 m!944605))

(declare-fun m!944607 () Bool)

(assert (=> b!1026341 m!944607))

(declare-fun m!944609 () Bool)

(assert (=> b!1026341 m!944609))

(declare-fun m!944611 () Bool)

(assert (=> b!1026341 m!944611))

(declare-fun m!944613 () Bool)

(assert (=> b!1026341 m!944613))

(declare-fun m!944615 () Bool)

(assert (=> b!1026341 m!944615))

(declare-fun m!944617 () Bool)

(assert (=> b!1026341 m!944617))

(declare-fun m!944619 () Bool)

(assert (=> b!1026341 m!944619))

(declare-fun m!944621 () Bool)

(assert (=> start!89494 m!944621))

(check-sat (not mapNonEmpty!37748) (not b!1026348) b_and!32739 (not b!1026342) (not b!1026346) (not b!1026347) tp_is_empty!24213 (not b!1026341) (not start!89494) (not b_next!20493))
(check-sat b_and!32739 (not b_next!20493))
