; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90056 () Bool)

(assert start!90056)

(declare-fun b!1031338 () Bool)

(declare-fun b_free!20665 () Bool)

(declare-fun b_next!20665 () Bool)

(assert (=> b!1031338 (= b_free!20665 (not b_next!20665))))

(declare-fun tp!73066 () Bool)

(declare-fun b_and!33071 () Bool)

(assert (=> b!1031338 (= tp!73066 b_and!33071)))

(declare-fun b!1031331 () Bool)

(declare-fun res!689607 () Bool)

(declare-fun e!582504 () Bool)

(assert (=> b!1031331 (=> (not res!689607) (not e!582504))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1031331 (= res!689607 (not (= key!909 (bvneg key!909))))))

(declare-fun res!689611 () Bool)

(assert (=> start!90056 (=> (not res!689611) (not e!582504))))

(declare-datatypes ((V!37387 0))(
  ( (V!37388 (val!12243 Int)) )
))
(declare-datatypes ((ValueCell!11489 0))(
  ( (ValueCellFull!11489 (v!14819 V!37387)) (EmptyCell!11489) )
))
(declare-datatypes ((array!64773 0))(
  ( (array!64774 (arr!31188 (Array (_ BitVec 32) (_ BitVec 64))) (size!31707 (_ BitVec 32))) )
))
(declare-datatypes ((array!64775 0))(
  ( (array!64776 (arr!31189 (Array (_ BitVec 32) ValueCell!11489)) (size!31708 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5572 0))(
  ( (LongMapFixedSize!5573 (defaultEntry!6160 Int) (mask!29953 (_ BitVec 32)) (extraKeys!5892 (_ BitVec 32)) (zeroValue!5996 V!37387) (minValue!5996 V!37387) (_size!2841 (_ BitVec 32)) (_keys!11329 array!64773) (_values!6183 array!64775) (_vacant!2841 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5572)

(declare-fun valid!2100 (LongMapFixedSize!5572) Bool)

(assert (=> start!90056 (= res!689611 (valid!2100 thiss!1427))))

(assert (=> start!90056 e!582504))

(declare-fun e!582502 () Bool)

(assert (=> start!90056 e!582502))

(assert (=> start!90056 true))

(declare-fun b!1031332 () Bool)

(declare-fun e!582506 () Bool)

(declare-fun tp_is_empty!24385 () Bool)

(assert (=> b!1031332 (= e!582506 tp_is_empty!24385)))

(declare-fun b!1031333 () Bool)

(declare-fun res!689606 () Bool)

(declare-fun e!582501 () Bool)

(assert (=> b!1031333 (=> res!689606 e!582501)))

(declare-datatypes ((Unit!33631 0))(
  ( (Unit!33632) )
))
(declare-datatypes ((tuple2!15754 0))(
  ( (tuple2!15755 (_1!7888 Unit!33631) (_2!7888 LongMapFixedSize!5572)) )
))
(declare-fun lt!455203 () tuple2!15754)

(assert (=> b!1031333 (= res!689606 (or (not (= (size!31708 (_values!6183 (_2!7888 lt!455203))) (bvadd #b00000000000000000000000000000001 (mask!29953 (_2!7888 lt!455203))))) (not (= (size!31707 (_keys!11329 (_2!7888 lt!455203))) (size!31708 (_values!6183 (_2!7888 lt!455203))))) (bvslt (mask!29953 (_2!7888 lt!455203)) #b00000000000000000000000000000000) (bvslt (extraKeys!5892 (_2!7888 lt!455203)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5892 (_2!7888 lt!455203)) #b00000000000000000000000000000011)))))

(declare-fun b!1031334 () Bool)

(declare-fun res!689609 () Bool)

(assert (=> b!1031334 (=> res!689609 e!582501)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64773 (_ BitVec 32)) Bool)

(assert (=> b!1031334 (= res!689609 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11329 (_2!7888 lt!455203)) (mask!29953 (_2!7888 lt!455203)))))))

(declare-fun b!1031335 () Bool)

(declare-fun e!582503 () Bool)

(assert (=> b!1031335 (= e!582503 tp_is_empty!24385)))

(declare-fun b!1031336 () Bool)

(declare-fun e!582500 () Bool)

(assert (=> b!1031336 (= e!582500 (not e!582501))))

(declare-fun res!689605 () Bool)

(assert (=> b!1031336 (=> res!689605 e!582501)))

(declare-datatypes ((tuple2!15756 0))(
  ( (tuple2!15757 (_1!7889 (_ BitVec 64)) (_2!7889 V!37387)) )
))
(declare-datatypes ((List!21906 0))(
  ( (Nil!21903) (Cons!21902 (h!23104 tuple2!15756) (t!31057 List!21906)) )
))
(declare-datatypes ((ListLongMap!13805 0))(
  ( (ListLongMap!13806 (toList!6918 List!21906)) )
))
(declare-fun contains!5974 (ListLongMap!13805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3885 (array!64773 array!64775 (_ BitVec 32) (_ BitVec 32) V!37387 V!37387 (_ BitVec 32) Int) ListLongMap!13805)

(assert (=> b!1031336 (= res!689605 (not (contains!5974 (getCurrentListMap!3885 (_keys!11329 (_2!7888 lt!455203)) (_values!6183 (_2!7888 lt!455203)) (mask!29953 (_2!7888 lt!455203)) (extraKeys!5892 (_2!7888 lt!455203)) (zeroValue!5996 (_2!7888 lt!455203)) (minValue!5996 (_2!7888 lt!455203)) #b00000000000000000000000000000000 (defaultEntry!6160 (_2!7888 lt!455203))) key!909)))))

(declare-fun lt!455204 () array!64775)

(declare-fun lt!455208 () array!64773)

(declare-fun Unit!33633 () Unit!33631)

(declare-fun Unit!33634 () Unit!33631)

(assert (=> b!1031336 (= lt!455203 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2841 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15755 Unit!33633 (LongMapFixedSize!5573 (defaultEntry!6160 thiss!1427) (mask!29953 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) (bvsub (_size!2841 thiss!1427) #b00000000000000000000000000000001) lt!455208 lt!455204 (bvadd #b00000000000000000000000000000001 (_vacant!2841 thiss!1427)))) (tuple2!15755 Unit!33634 (LongMapFixedSize!5573 (defaultEntry!6160 thiss!1427) (mask!29953 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) (bvsub (_size!2841 thiss!1427) #b00000000000000000000000000000001) lt!455208 lt!455204 (_vacant!2841 thiss!1427)))))))

(declare-fun -!510 (ListLongMap!13805 (_ BitVec 64)) ListLongMap!13805)

(assert (=> b!1031336 (= (-!510 (getCurrentListMap!3885 (_keys!11329 thiss!1427) (_values!6183 thiss!1427) (mask!29953 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6160 thiss!1427)) key!909) (getCurrentListMap!3885 lt!455208 lt!455204 (mask!29953 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6160 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9699 0))(
  ( (MissingZero!9699 (index!41167 (_ BitVec 32))) (Found!9699 (index!41168 (_ BitVec 32))) (Intermediate!9699 (undefined!10511 Bool) (index!41169 (_ BitVec 32)) (x!91846 (_ BitVec 32))) (Undefined!9699) (MissingVacant!9699 (index!41170 (_ BitVec 32))) )
))
(declare-fun lt!455205 () SeekEntryResult!9699)

(declare-fun dynLambda!1972 (Int (_ BitVec 64)) V!37387)

(assert (=> b!1031336 (= lt!455204 (array!64776 (store (arr!31189 (_values!6183 thiss!1427)) (index!41168 lt!455205) (ValueCellFull!11489 (dynLambda!1972 (defaultEntry!6160 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31708 (_values!6183 thiss!1427))))))

(declare-fun lt!455202 () Unit!33631)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!35 (array!64773 array!64775 (_ BitVec 32) (_ BitVec 32) V!37387 V!37387 (_ BitVec 32) (_ BitVec 64) Int) Unit!33631)

(assert (=> b!1031336 (= lt!455202 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!35 (_keys!11329 thiss!1427) (_values!6183 thiss!1427) (mask!29953 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) (index!41168 lt!455205) key!909 (defaultEntry!6160 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031336 (not (arrayContainsKey!0 lt!455208 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455209 () Unit!33631)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64773 (_ BitVec 32) (_ BitVec 64)) Unit!33631)

(assert (=> b!1031336 (= lt!455209 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11329 thiss!1427) (index!41168 lt!455205) key!909))))

(assert (=> b!1031336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455208 (mask!29953 thiss!1427))))

(declare-fun lt!455206 () Unit!33631)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64773 (_ BitVec 32) (_ BitVec 32)) Unit!33631)

(assert (=> b!1031336 (= lt!455206 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11329 thiss!1427) (index!41168 lt!455205) (mask!29953 thiss!1427)))))

(declare-datatypes ((List!21907 0))(
  ( (Nil!21904) (Cons!21903 (h!23105 (_ BitVec 64)) (t!31058 List!21907)) )
))
(declare-fun arrayNoDuplicates!0 (array!64773 (_ BitVec 32) List!21907) Bool)

(assert (=> b!1031336 (arrayNoDuplicates!0 lt!455208 #b00000000000000000000000000000000 Nil!21904)))

(declare-fun lt!455210 () Unit!33631)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64773 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21907) Unit!33631)

(assert (=> b!1031336 (= lt!455210 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11329 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41168 lt!455205) #b00000000000000000000000000000000 Nil!21904))))

(declare-fun arrayCountValidKeys!0 (array!64773 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031336 (= (arrayCountValidKeys!0 lt!455208 #b00000000000000000000000000000000 (size!31707 (_keys!11329 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11329 thiss!1427) #b00000000000000000000000000000000 (size!31707 (_keys!11329 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031336 (= lt!455208 (array!64774 (store (arr!31188 (_keys!11329 thiss!1427)) (index!41168 lt!455205) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31707 (_keys!11329 thiss!1427))))))

(declare-fun lt!455211 () Unit!33631)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64773 (_ BitVec 32) (_ BitVec 64)) Unit!33631)

(assert (=> b!1031336 (= lt!455211 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11329 thiss!1427) (index!41168 lt!455205) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031337 () Bool)

(declare-fun e!582505 () Bool)

(declare-fun mapRes!38031 () Bool)

(assert (=> b!1031337 (= e!582505 (and e!582503 mapRes!38031))))

(declare-fun condMapEmpty!38031 () Bool)

(declare-fun mapDefault!38031 () ValueCell!11489)

(assert (=> b!1031337 (= condMapEmpty!38031 (= (arr!31189 (_values!6183 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11489)) mapDefault!38031)))))

(declare-fun array_inv!24145 (array!64773) Bool)

(declare-fun array_inv!24146 (array!64775) Bool)

(assert (=> b!1031338 (= e!582502 (and tp!73066 tp_is_empty!24385 (array_inv!24145 (_keys!11329 thiss!1427)) (array_inv!24146 (_values!6183 thiss!1427)) e!582505))))

(declare-fun mapIsEmpty!38031 () Bool)

(assert (=> mapIsEmpty!38031 mapRes!38031))

(declare-fun mapNonEmpty!38031 () Bool)

(declare-fun tp!73065 () Bool)

(assert (=> mapNonEmpty!38031 (= mapRes!38031 (and tp!73065 e!582506))))

(declare-fun mapValue!38031 () ValueCell!11489)

(declare-fun mapKey!38031 () (_ BitVec 32))

(declare-fun mapRest!38031 () (Array (_ BitVec 32) ValueCell!11489))

(assert (=> mapNonEmpty!38031 (= (arr!31189 (_values!6183 thiss!1427)) (store mapRest!38031 mapKey!38031 mapValue!38031))))

(declare-fun b!1031339 () Bool)

(declare-fun res!689610 () Bool)

(assert (=> b!1031339 (=> res!689610 e!582501)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031339 (= res!689610 (not (validMask!0 (mask!29953 (_2!7888 lt!455203)))))))

(declare-fun b!1031340 () Bool)

(assert (=> b!1031340 (= e!582501 true)))

(declare-fun lt!455207 () Bool)

(assert (=> b!1031340 (= lt!455207 (arrayNoDuplicates!0 (_keys!11329 (_2!7888 lt!455203)) #b00000000000000000000000000000000 Nil!21904))))

(declare-fun b!1031341 () Bool)

(assert (=> b!1031341 (= e!582504 e!582500)))

(declare-fun res!689608 () Bool)

(assert (=> b!1031341 (=> (not res!689608) (not e!582500))))

(get-info :version)

(assert (=> b!1031341 (= res!689608 ((_ is Found!9699) lt!455205))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64773 (_ BitVec 32)) SeekEntryResult!9699)

(assert (=> b!1031341 (= lt!455205 (seekEntry!0 key!909 (_keys!11329 thiss!1427) (mask!29953 thiss!1427)))))

(assert (= (and start!90056 res!689611) b!1031331))

(assert (= (and b!1031331 res!689607) b!1031341))

(assert (= (and b!1031341 res!689608) b!1031336))

(assert (= (and b!1031336 (not res!689605)) b!1031339))

(assert (= (and b!1031339 (not res!689610)) b!1031333))

(assert (= (and b!1031333 (not res!689606)) b!1031334))

(assert (= (and b!1031334 (not res!689609)) b!1031340))

(assert (= (and b!1031337 condMapEmpty!38031) mapIsEmpty!38031))

(assert (= (and b!1031337 (not condMapEmpty!38031)) mapNonEmpty!38031))

(assert (= (and mapNonEmpty!38031 ((_ is ValueCellFull!11489) mapValue!38031)) b!1031332))

(assert (= (and b!1031337 ((_ is ValueCellFull!11489) mapDefault!38031)) b!1031335))

(assert (= b!1031338 b!1031337))

(assert (= start!90056 b!1031338))

(declare-fun b_lambda!15987 () Bool)

(assert (=> (not b_lambda!15987) (not b!1031336)))

(declare-fun t!31056 () Bool)

(declare-fun tb!6975 () Bool)

(assert (=> (and b!1031338 (= (defaultEntry!6160 thiss!1427) (defaultEntry!6160 thiss!1427)) t!31056) tb!6975))

(declare-fun result!14287 () Bool)

(assert (=> tb!6975 (= result!14287 tp_is_empty!24385)))

(assert (=> b!1031336 t!31056))

(declare-fun b_and!33073 () Bool)

(assert (= b_and!33071 (and (=> t!31056 result!14287) b_and!33073)))

(declare-fun m!951001 () Bool)

(assert (=> b!1031338 m!951001))

(declare-fun m!951003 () Bool)

(assert (=> b!1031338 m!951003))

(declare-fun m!951005 () Bool)

(assert (=> start!90056 m!951005))

(declare-fun m!951007 () Bool)

(assert (=> b!1031336 m!951007))

(declare-fun m!951009 () Bool)

(assert (=> b!1031336 m!951009))

(declare-fun m!951011 () Bool)

(assert (=> b!1031336 m!951011))

(declare-fun m!951013 () Bool)

(assert (=> b!1031336 m!951013))

(declare-fun m!951015 () Bool)

(assert (=> b!1031336 m!951015))

(declare-fun m!951017 () Bool)

(assert (=> b!1031336 m!951017))

(declare-fun m!951019 () Bool)

(assert (=> b!1031336 m!951019))

(declare-fun m!951021 () Bool)

(assert (=> b!1031336 m!951021))

(declare-fun m!951023 () Bool)

(assert (=> b!1031336 m!951023))

(declare-fun m!951025 () Bool)

(assert (=> b!1031336 m!951025))

(declare-fun m!951027 () Bool)

(assert (=> b!1031336 m!951027))

(declare-fun m!951029 () Bool)

(assert (=> b!1031336 m!951029))

(assert (=> b!1031336 m!951027))

(declare-fun m!951031 () Bool)

(assert (=> b!1031336 m!951031))

(declare-fun m!951033 () Bool)

(assert (=> b!1031336 m!951033))

(assert (=> b!1031336 m!951019))

(declare-fun m!951035 () Bool)

(assert (=> b!1031336 m!951035))

(declare-fun m!951037 () Bool)

(assert (=> b!1031336 m!951037))

(declare-fun m!951039 () Bool)

(assert (=> b!1031336 m!951039))

(declare-fun m!951041 () Bool)

(assert (=> b!1031336 m!951041))

(declare-fun m!951043 () Bool)

(assert (=> mapNonEmpty!38031 m!951043))

(declare-fun m!951045 () Bool)

(assert (=> b!1031339 m!951045))

(declare-fun m!951047 () Bool)

(assert (=> b!1031334 m!951047))

(declare-fun m!951049 () Bool)

(assert (=> b!1031340 m!951049))

(declare-fun m!951051 () Bool)

(assert (=> b!1031341 m!951051))

(check-sat (not b!1031334) b_and!33073 (not mapNonEmpty!38031) (not b!1031339) (not b_lambda!15987) (not b_next!20665) (not b!1031336) (not start!90056) tp_is_empty!24385 (not b!1031338) (not b!1031340) (not b!1031341))
(check-sat b_and!33073 (not b_next!20665))
