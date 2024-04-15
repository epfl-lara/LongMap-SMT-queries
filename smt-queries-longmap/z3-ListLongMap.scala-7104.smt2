; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90068 () Bool)

(assert start!90068)

(declare-fun b!1031546 () Bool)

(declare-fun b_free!20677 () Bool)

(declare-fun b_next!20677 () Bool)

(assert (=> b!1031546 (= b_free!20677 (not b_next!20677))))

(declare-fun tp!73101 () Bool)

(declare-fun b_and!33095 () Bool)

(assert (=> b!1031546 (= tp!73101 b_and!33095)))

(declare-fun b!1031543 () Bool)

(declare-fun e!582656 () Bool)

(declare-fun e!582653 () Bool)

(declare-fun mapRes!38049 () Bool)

(assert (=> b!1031543 (= e!582656 (and e!582653 mapRes!38049))))

(declare-fun condMapEmpty!38049 () Bool)

(declare-datatypes ((V!37403 0))(
  ( (V!37404 (val!12249 Int)) )
))
(declare-datatypes ((ValueCell!11495 0))(
  ( (ValueCellFull!11495 (v!14825 V!37403)) (EmptyCell!11495) )
))
(declare-datatypes ((array!64797 0))(
  ( (array!64798 (arr!31200 (Array (_ BitVec 32) (_ BitVec 64))) (size!31719 (_ BitVec 32))) )
))
(declare-datatypes ((array!64799 0))(
  ( (array!64800 (arr!31201 (Array (_ BitVec 32) ValueCell!11495)) (size!31720 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5584 0))(
  ( (LongMapFixedSize!5585 (defaultEntry!6166 Int) (mask!29963 (_ BitVec 32)) (extraKeys!5898 (_ BitVec 32)) (zeroValue!6002 V!37403) (minValue!6002 V!37403) (_size!2847 (_ BitVec 32)) (_keys!11335 array!64797) (_values!6189 array!64799) (_vacant!2847 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5584)

(declare-fun mapDefault!38049 () ValueCell!11495)

(assert (=> b!1031543 (= condMapEmpty!38049 (= (arr!31201 (_values!6189 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11495)) mapDefault!38049)))))

(declare-fun b!1031544 () Bool)

(declare-fun e!582649 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((Unit!33645 0))(
  ( (Unit!33646) )
))
(declare-datatypes ((tuple2!15768 0))(
  ( (tuple2!15769 (_1!7895 Unit!33645) (_2!7895 LongMapFixedSize!5584)) )
))
(declare-fun lt!455397 () tuple2!15768)

(assert (=> b!1031544 (= e!582649 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5898 (_2!7895 lt!455397)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5898 (_2!7895 lt!455397)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1031545 () Bool)

(declare-fun e!582648 () Bool)

(declare-fun tp_is_empty!24397 () Bool)

(assert (=> b!1031545 (= e!582648 tp_is_empty!24397)))

(declare-fun mapIsEmpty!38049 () Bool)

(assert (=> mapIsEmpty!38049 mapRes!38049))

(declare-fun e!582652 () Bool)

(declare-fun array_inv!24151 (array!64797) Bool)

(declare-fun array_inv!24152 (array!64799) Bool)

(assert (=> b!1031546 (= e!582652 (and tp!73101 tp_is_empty!24397 (array_inv!24151 (_keys!11335 thiss!1427)) (array_inv!24152 (_values!6189 thiss!1427)) e!582656))))

(declare-fun b!1031547 () Bool)

(declare-fun e!582655 () Bool)

(assert (=> b!1031547 (= e!582655 false)))

(declare-fun mapNonEmpty!38049 () Bool)

(declare-fun tp!73102 () Bool)

(assert (=> mapNonEmpty!38049 (= mapRes!38049 (and tp!73102 e!582648))))

(declare-fun mapKey!38049 () (_ BitVec 32))

(declare-fun mapRest!38049 () (Array (_ BitVec 32) ValueCell!11495))

(declare-fun mapValue!38049 () ValueCell!11495)

(assert (=> mapNonEmpty!38049 (= (arr!31201 (_values!6189 thiss!1427)) (store mapRest!38049 mapKey!38049 mapValue!38049))))

(declare-fun b!1031548 () Bool)

(declare-fun e!582651 () Bool)

(assert (=> b!1031548 (= e!582651 (not true))))

(declare-fun lt!455388 () Bool)

(declare-fun valid!2103 (LongMapFixedSize!5584) Bool)

(assert (=> b!1031548 (= lt!455388 (valid!2103 (_2!7895 lt!455397)))))

(declare-fun lt!455395 () Unit!33645)

(declare-fun e!582650 () Unit!33645)

(assert (=> b!1031548 (= lt!455395 e!582650)))

(declare-fun c!104196 () Bool)

(declare-datatypes ((tuple2!15770 0))(
  ( (tuple2!15771 (_1!7896 (_ BitVec 64)) (_2!7896 V!37403)) )
))
(declare-datatypes ((List!21913 0))(
  ( (Nil!21910) (Cons!21909 (h!23111 tuple2!15770) (t!31076 List!21913)) )
))
(declare-datatypes ((ListLongMap!13811 0))(
  ( (ListLongMap!13812 (toList!6921 List!21913)) )
))
(declare-fun contains!5977 (ListLongMap!13811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3888 (array!64797 array!64799 (_ BitVec 32) (_ BitVec 32) V!37403 V!37403 (_ BitVec 32) Int) ListLongMap!13811)

(assert (=> b!1031548 (= c!104196 (contains!5977 (getCurrentListMap!3888 (_keys!11335 (_2!7895 lt!455397)) (_values!6189 (_2!7895 lt!455397)) (mask!29963 (_2!7895 lt!455397)) (extraKeys!5898 (_2!7895 lt!455397)) (zeroValue!6002 (_2!7895 lt!455397)) (minValue!6002 (_2!7895 lt!455397)) #b00000000000000000000000000000000 (defaultEntry!6166 (_2!7895 lt!455397))) key!909))))

(declare-fun lt!455389 () array!64797)

(declare-fun lt!455391 () array!64799)

(declare-fun Unit!33647 () Unit!33645)

(declare-fun Unit!33648 () Unit!33645)

(assert (=> b!1031548 (= lt!455397 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2847 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15769 Unit!33647 (LongMapFixedSize!5585 (defaultEntry!6166 thiss!1427) (mask!29963 thiss!1427) (extraKeys!5898 thiss!1427) (zeroValue!6002 thiss!1427) (minValue!6002 thiss!1427) (bvsub (_size!2847 thiss!1427) #b00000000000000000000000000000001) lt!455389 lt!455391 (bvadd #b00000000000000000000000000000001 (_vacant!2847 thiss!1427)))) (tuple2!15769 Unit!33648 (LongMapFixedSize!5585 (defaultEntry!6166 thiss!1427) (mask!29963 thiss!1427) (extraKeys!5898 thiss!1427) (zeroValue!6002 thiss!1427) (minValue!6002 thiss!1427) (bvsub (_size!2847 thiss!1427) #b00000000000000000000000000000001) lt!455389 lt!455391 (_vacant!2847 thiss!1427)))))))

(declare-fun -!513 (ListLongMap!13811 (_ BitVec 64)) ListLongMap!13811)

(assert (=> b!1031548 (= (-!513 (getCurrentListMap!3888 (_keys!11335 thiss!1427) (_values!6189 thiss!1427) (mask!29963 thiss!1427) (extraKeys!5898 thiss!1427) (zeroValue!6002 thiss!1427) (minValue!6002 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6166 thiss!1427)) key!909) (getCurrentListMap!3888 lt!455389 lt!455391 (mask!29963 thiss!1427) (extraKeys!5898 thiss!1427) (zeroValue!6002 thiss!1427) (minValue!6002 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6166 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9704 0))(
  ( (MissingZero!9704 (index!41187 (_ BitVec 32))) (Found!9704 (index!41188 (_ BitVec 32))) (Intermediate!9704 (undefined!10516 Bool) (index!41189 (_ BitVec 32)) (x!91879 (_ BitVec 32))) (Undefined!9704) (MissingVacant!9704 (index!41190 (_ BitVec 32))) )
))
(declare-fun lt!455387 () SeekEntryResult!9704)

(declare-fun dynLambda!1975 (Int (_ BitVec 64)) V!37403)

(assert (=> b!1031548 (= lt!455391 (array!64800 (store (arr!31201 (_values!6189 thiss!1427)) (index!41188 lt!455387) (ValueCellFull!11495 (dynLambda!1975 (defaultEntry!6166 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31720 (_values!6189 thiss!1427))))))

(declare-fun lt!455394 () Unit!33645)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!38 (array!64797 array!64799 (_ BitVec 32) (_ BitVec 32) V!37403 V!37403 (_ BitVec 32) (_ BitVec 64) Int) Unit!33645)

(assert (=> b!1031548 (= lt!455394 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!38 (_keys!11335 thiss!1427) (_values!6189 thiss!1427) (mask!29963 thiss!1427) (extraKeys!5898 thiss!1427) (zeroValue!6002 thiss!1427) (minValue!6002 thiss!1427) (index!41188 lt!455387) key!909 (defaultEntry!6166 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031548 (not (arrayContainsKey!0 lt!455389 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455392 () Unit!33645)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64797 (_ BitVec 32) (_ BitVec 64)) Unit!33645)

(assert (=> b!1031548 (= lt!455392 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11335 thiss!1427) (index!41188 lt!455387) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64797 (_ BitVec 32)) Bool)

(assert (=> b!1031548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455389 (mask!29963 thiss!1427))))

(declare-fun lt!455390 () Unit!33645)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64797 (_ BitVec 32) (_ BitVec 32)) Unit!33645)

(assert (=> b!1031548 (= lt!455390 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11335 thiss!1427) (index!41188 lt!455387) (mask!29963 thiss!1427)))))

(declare-datatypes ((List!21914 0))(
  ( (Nil!21911) (Cons!21910 (h!23112 (_ BitVec 64)) (t!31077 List!21914)) )
))
(declare-fun arrayNoDuplicates!0 (array!64797 (_ BitVec 32) List!21914) Bool)

(assert (=> b!1031548 (arrayNoDuplicates!0 lt!455389 #b00000000000000000000000000000000 Nil!21911)))

(declare-fun lt!455393 () Unit!33645)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64797 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21914) Unit!33645)

(assert (=> b!1031548 (= lt!455393 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11335 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41188 lt!455387) #b00000000000000000000000000000000 Nil!21911))))

(declare-fun arrayCountValidKeys!0 (array!64797 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031548 (= (arrayCountValidKeys!0 lt!455389 #b00000000000000000000000000000000 (size!31719 (_keys!11335 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11335 thiss!1427) #b00000000000000000000000000000000 (size!31719 (_keys!11335 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031548 (= lt!455389 (array!64798 (store (arr!31200 (_keys!11335 thiss!1427)) (index!41188 lt!455387) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31719 (_keys!11335 thiss!1427))))))

(declare-fun lt!455386 () Unit!33645)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64797 (_ BitVec 32) (_ BitVec 64)) Unit!33645)

(assert (=> b!1031548 (= lt!455386 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11335 thiss!1427) (index!41188 lt!455387) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031549 () Bool)

(declare-fun e!582654 () Bool)

(assert (=> b!1031549 (= e!582654 e!582651)))

(declare-fun res!689728 () Bool)

(assert (=> b!1031549 (=> (not res!689728) (not e!582651))))

(get-info :version)

(assert (=> b!1031549 (= res!689728 ((_ is Found!9704) lt!455387))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64797 (_ BitVec 32)) SeekEntryResult!9704)

(assert (=> b!1031549 (= lt!455387 (seekEntry!0 key!909 (_keys!11335 thiss!1427) (mask!29963 thiss!1427)))))

(declare-fun b!1031550 () Bool)

(declare-fun Unit!33649 () Unit!33645)

(assert (=> b!1031550 (= e!582650 Unit!33649)))

(declare-fun lt!455396 () Unit!33645)

(declare-fun lemmaKeyInListMapIsInArray!325 (array!64797 array!64799 (_ BitVec 32) (_ BitVec 32) V!37403 V!37403 (_ BitVec 64) Int) Unit!33645)

(assert (=> b!1031550 (= lt!455396 (lemmaKeyInListMapIsInArray!325 (_keys!11335 (_2!7895 lt!455397)) (_values!6189 (_2!7895 lt!455397)) (mask!29963 (_2!7895 lt!455397)) (extraKeys!5898 (_2!7895 lt!455397)) (zeroValue!6002 (_2!7895 lt!455397)) (minValue!6002 (_2!7895 lt!455397)) key!909 (defaultEntry!6166 (_2!7895 lt!455397))))))

(declare-fun c!104195 () Bool)

(assert (=> b!1031550 (= c!104195 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689725 () Bool)

(assert (=> b!1031550 (= res!689725 e!582649)))

(assert (=> b!1031550 (=> (not res!689725) (not e!582655))))

(assert (=> b!1031550 e!582655))

(declare-fun b!1031551 () Bool)

(declare-fun res!689726 () Bool)

(assert (=> b!1031551 (=> (not res!689726) (not e!582654))))

(assert (=> b!1031551 (= res!689726 (not (= key!909 (bvneg key!909))))))

(declare-fun res!689727 () Bool)

(assert (=> start!90068 (=> (not res!689727) (not e!582654))))

(assert (=> start!90068 (= res!689727 (valid!2103 thiss!1427))))

(assert (=> start!90068 e!582654))

(assert (=> start!90068 e!582652))

(assert (=> start!90068 true))

(declare-fun b!1031552 () Bool)

(assert (=> b!1031552 (= e!582653 tp_is_empty!24397)))

(declare-fun b!1031553 () Bool)

(declare-fun Unit!33650 () Unit!33645)

(assert (=> b!1031553 (= e!582650 Unit!33650)))

(declare-fun b!1031554 () Bool)

(assert (=> b!1031554 (= e!582649 (arrayContainsKey!0 (_keys!11335 (_2!7895 lt!455397)) key!909 #b00000000000000000000000000000000))))

(assert (= (and start!90068 res!689727) b!1031551))

(assert (= (and b!1031551 res!689726) b!1031549))

(assert (= (and b!1031549 res!689728) b!1031548))

(assert (= (and b!1031548 c!104196) b!1031550))

(assert (= (and b!1031548 (not c!104196)) b!1031553))

(assert (= (and b!1031550 c!104195) b!1031554))

(assert (= (and b!1031550 (not c!104195)) b!1031544))

(assert (= (and b!1031550 res!689725) b!1031547))

(assert (= (and b!1031543 condMapEmpty!38049) mapIsEmpty!38049))

(assert (= (and b!1031543 (not condMapEmpty!38049)) mapNonEmpty!38049))

(assert (= (and mapNonEmpty!38049 ((_ is ValueCellFull!11495) mapValue!38049)) b!1031545))

(assert (= (and b!1031543 ((_ is ValueCellFull!11495) mapDefault!38049)) b!1031552))

(assert (= b!1031546 b!1031543))

(assert (= start!90068 b!1031546))

(declare-fun b_lambda!15999 () Bool)

(assert (=> (not b_lambda!15999) (not b!1031548)))

(declare-fun t!31075 () Bool)

(declare-fun tb!6987 () Bool)

(assert (=> (and b!1031546 (= (defaultEntry!6166 thiss!1427) (defaultEntry!6166 thiss!1427)) t!31075) tb!6987))

(declare-fun result!14311 () Bool)

(assert (=> tb!6987 (= result!14311 tp_is_empty!24397)))

(assert (=> b!1031548 t!31075))

(declare-fun b_and!33097 () Bool)

(assert (= b_and!33095 (and (=> t!31075 result!14311) b_and!33097)))

(declare-fun m!951313 () Bool)

(assert (=> b!1031554 m!951313))

(declare-fun m!951315 () Bool)

(assert (=> b!1031548 m!951315))

(declare-fun m!951317 () Bool)

(assert (=> b!1031548 m!951317))

(declare-fun m!951319 () Bool)

(assert (=> b!1031548 m!951319))

(declare-fun m!951321 () Bool)

(assert (=> b!1031548 m!951321))

(declare-fun m!951323 () Bool)

(assert (=> b!1031548 m!951323))

(declare-fun m!951325 () Bool)

(assert (=> b!1031548 m!951325))

(declare-fun m!951327 () Bool)

(assert (=> b!1031548 m!951327))

(assert (=> b!1031548 m!951319))

(declare-fun m!951329 () Bool)

(assert (=> b!1031548 m!951329))

(declare-fun m!951331 () Bool)

(assert (=> b!1031548 m!951331))

(declare-fun m!951333 () Bool)

(assert (=> b!1031548 m!951333))

(declare-fun m!951335 () Bool)

(assert (=> b!1031548 m!951335))

(assert (=> b!1031548 m!951333))

(declare-fun m!951337 () Bool)

(assert (=> b!1031548 m!951337))

(declare-fun m!951339 () Bool)

(assert (=> b!1031548 m!951339))

(declare-fun m!951341 () Bool)

(assert (=> b!1031548 m!951341))

(declare-fun m!951343 () Bool)

(assert (=> b!1031548 m!951343))

(declare-fun m!951345 () Bool)

(assert (=> b!1031548 m!951345))

(declare-fun m!951347 () Bool)

(assert (=> b!1031548 m!951347))

(declare-fun m!951349 () Bool)

(assert (=> b!1031548 m!951349))

(declare-fun m!951351 () Bool)

(assert (=> b!1031548 m!951351))

(declare-fun m!951353 () Bool)

(assert (=> mapNonEmpty!38049 m!951353))

(declare-fun m!951355 () Bool)

(assert (=> b!1031546 m!951355))

(declare-fun m!951357 () Bool)

(assert (=> b!1031546 m!951357))

(declare-fun m!951359 () Bool)

(assert (=> b!1031550 m!951359))

(declare-fun m!951361 () Bool)

(assert (=> b!1031549 m!951361))

(declare-fun m!951363 () Bool)

(assert (=> start!90068 m!951363))

(check-sat (not b_lambda!15999) (not b!1031546) (not b!1031548) (not mapNonEmpty!38049) (not b!1031549) (not b_next!20677) (not start!90068) (not b!1031550) (not b!1031554) tp_is_empty!24397 b_and!33097)
(check-sat b_and!33097 (not b_next!20677))
