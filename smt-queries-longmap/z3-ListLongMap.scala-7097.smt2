; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90262 () Bool)

(assert start!90262)

(declare-fun b!1032273 () Bool)

(declare-fun b_free!20635 () Bool)

(declare-fun b_next!20635 () Bool)

(assert (=> b!1032273 (= b_free!20635 (not b_next!20635))))

(declare-fun tp!72975 () Bool)

(declare-fun b_and!33047 () Bool)

(assert (=> b!1032273 (= tp!72975 b_and!33047)))

(declare-fun b!1032272 () Bool)

(declare-fun e!583073 () Bool)

(declare-fun e!583075 () Bool)

(assert (=> b!1032272 (= e!583073 (not e!583075))))

(declare-fun res!689873 () Bool)

(assert (=> b!1032272 (=> res!689873 e!583075)))

(declare-datatypes ((V!37347 0))(
  ( (V!37348 (val!12228 Int)) )
))
(declare-datatypes ((ValueCell!11474 0))(
  ( (ValueCellFull!11474 (v!14801 V!37347)) (EmptyCell!11474) )
))
(declare-datatypes ((Unit!33704 0))(
  ( (Unit!33705) )
))
(declare-datatypes ((array!64823 0))(
  ( (array!64824 (arr!31207 (Array (_ BitVec 32) (_ BitVec 64))) (size!31725 (_ BitVec 32))) )
))
(declare-datatypes ((array!64825 0))(
  ( (array!64826 (arr!31208 (Array (_ BitVec 32) ValueCell!11474)) (size!31726 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5542 0))(
  ( (LongMapFixedSize!5543 (defaultEntry!6145 Int) (mask!29993 (_ BitVec 32)) (extraKeys!5877 (_ BitVec 32)) (zeroValue!5981 V!37347) (minValue!5981 V!37347) (_size!2826 (_ BitVec 32)) (_keys!11356 array!64823) (_values!6168 array!64825) (_vacant!2826 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15628 0))(
  ( (tuple2!15629 (_1!7825 Unit!33704) (_2!7825 LongMapFixedSize!5542)) )
))
(declare-fun lt!455471 () tuple2!15628)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15630 0))(
  ( (tuple2!15631 (_1!7826 (_ BitVec 64)) (_2!7826 V!37347)) )
))
(declare-datatypes ((List!21838 0))(
  ( (Nil!21835) (Cons!21834 (h!23045 tuple2!15630) (t!30960 List!21838)) )
))
(declare-datatypes ((ListLongMap!13719 0))(
  ( (ListLongMap!13720 (toList!6875 List!21838)) )
))
(declare-fun contains!6010 (ListLongMap!13719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3921 (array!64823 array!64825 (_ BitVec 32) (_ BitVec 32) V!37347 V!37347 (_ BitVec 32) Int) ListLongMap!13719)

(assert (=> b!1032272 (= res!689873 (not (contains!6010 (getCurrentListMap!3921 (_keys!11356 (_2!7825 lt!455471)) (_values!6168 (_2!7825 lt!455471)) (mask!29993 (_2!7825 lt!455471)) (extraKeys!5877 (_2!7825 lt!455471)) (zeroValue!5981 (_2!7825 lt!455471)) (minValue!5981 (_2!7825 lt!455471)) #b00000000000000000000000000000000 (defaultEntry!6145 (_2!7825 lt!455471))) key!909)))))

(declare-fun lt!455467 () array!64825)

(declare-fun thiss!1427 () LongMapFixedSize!5542)

(declare-fun lt!455470 () array!64823)

(declare-fun Unit!33706 () Unit!33704)

(declare-fun Unit!33707 () Unit!33704)

(assert (=> b!1032272 (= lt!455471 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2826 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15629 Unit!33706 (LongMapFixedSize!5543 (defaultEntry!6145 thiss!1427) (mask!29993 thiss!1427) (extraKeys!5877 thiss!1427) (zeroValue!5981 thiss!1427) (minValue!5981 thiss!1427) (bvsub (_size!2826 thiss!1427) #b00000000000000000000000000000001) lt!455470 lt!455467 (bvadd #b00000000000000000000000000000001 (_vacant!2826 thiss!1427)))) (tuple2!15629 Unit!33707 (LongMapFixedSize!5543 (defaultEntry!6145 thiss!1427) (mask!29993 thiss!1427) (extraKeys!5877 thiss!1427) (zeroValue!5981 thiss!1427) (minValue!5981 thiss!1427) (bvsub (_size!2826 thiss!1427) #b00000000000000000000000000000001) lt!455470 lt!455467 (_vacant!2826 thiss!1427)))))))

(declare-fun -!498 (ListLongMap!13719 (_ BitVec 64)) ListLongMap!13719)

(assert (=> b!1032272 (= (-!498 (getCurrentListMap!3921 (_keys!11356 thiss!1427) (_values!6168 thiss!1427) (mask!29993 thiss!1427) (extraKeys!5877 thiss!1427) (zeroValue!5981 thiss!1427) (minValue!5981 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6145 thiss!1427)) key!909) (getCurrentListMap!3921 lt!455470 lt!455467 (mask!29993 thiss!1427) (extraKeys!5877 thiss!1427) (zeroValue!5981 thiss!1427) (minValue!5981 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6145 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9652 0))(
  ( (MissingZero!9652 (index!40979 (_ BitVec 32))) (Found!9652 (index!40980 (_ BitVec 32))) (Intermediate!9652 (undefined!10464 Bool) (index!40981 (_ BitVec 32)) (x!91754 (_ BitVec 32))) (Undefined!9652) (MissingVacant!9652 (index!40982 (_ BitVec 32))) )
))
(declare-fun lt!455474 () SeekEntryResult!9652)

(declare-fun dynLambda!1992 (Int (_ BitVec 64)) V!37347)

(assert (=> b!1032272 (= lt!455467 (array!64826 (store (arr!31208 (_values!6168 thiss!1427)) (index!40980 lt!455474) (ValueCellFull!11474 (dynLambda!1992 (defaultEntry!6145 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31726 (_values!6168 thiss!1427))))))

(declare-fun lt!455472 () Unit!33704)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!24 (array!64823 array!64825 (_ BitVec 32) (_ BitVec 32) V!37347 V!37347 (_ BitVec 32) (_ BitVec 64) Int) Unit!33704)

(assert (=> b!1032272 (= lt!455472 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!24 (_keys!11356 thiss!1427) (_values!6168 thiss!1427) (mask!29993 thiss!1427) (extraKeys!5877 thiss!1427) (zeroValue!5981 thiss!1427) (minValue!5981 thiss!1427) (index!40980 lt!455474) key!909 (defaultEntry!6145 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032272 (not (arrayContainsKey!0 lt!455470 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455468 () Unit!33704)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64823 (_ BitVec 32) (_ BitVec 64)) Unit!33704)

(assert (=> b!1032272 (= lt!455468 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11356 thiss!1427) (index!40980 lt!455474) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64823 (_ BitVec 32)) Bool)

(assert (=> b!1032272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455470 (mask!29993 thiss!1427))))

(declare-fun lt!455475 () Unit!33704)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64823 (_ BitVec 32) (_ BitVec 32)) Unit!33704)

(assert (=> b!1032272 (= lt!455475 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11356 thiss!1427) (index!40980 lt!455474) (mask!29993 thiss!1427)))))

(declare-datatypes ((List!21839 0))(
  ( (Nil!21836) (Cons!21835 (h!23046 (_ BitVec 64)) (t!30961 List!21839)) )
))
(declare-fun arrayNoDuplicates!0 (array!64823 (_ BitVec 32) List!21839) Bool)

(assert (=> b!1032272 (arrayNoDuplicates!0 lt!455470 #b00000000000000000000000000000000 Nil!21836)))

(declare-fun lt!455469 () Unit!33704)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64823 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21839) Unit!33704)

(assert (=> b!1032272 (= lt!455469 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11356 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40980 lt!455474) #b00000000000000000000000000000000 Nil!21836))))

(declare-fun arrayCountValidKeys!0 (array!64823 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032272 (= (arrayCountValidKeys!0 lt!455470 #b00000000000000000000000000000000 (size!31725 (_keys!11356 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11356 thiss!1427) #b00000000000000000000000000000000 (size!31725 (_keys!11356 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032272 (= lt!455470 (array!64824 (store (arr!31207 (_keys!11356 thiss!1427)) (index!40980 lt!455474) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31725 (_keys!11356 thiss!1427))))))

(declare-fun lt!455473 () Unit!33704)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64823 (_ BitVec 32) (_ BitVec 64)) Unit!33704)

(assert (=> b!1032272 (= lt!455473 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11356 thiss!1427) (index!40980 lt!455474) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!583080 () Bool)

(declare-fun tp_is_empty!24355 () Bool)

(declare-fun e!583074 () Bool)

(declare-fun array_inv!24165 (array!64823) Bool)

(declare-fun array_inv!24166 (array!64825) Bool)

(assert (=> b!1032273 (= e!583074 (and tp!72975 tp_is_empty!24355 (array_inv!24165 (_keys!11356 thiss!1427)) (array_inv!24166 (_values!6168 thiss!1427)) e!583080))))

(declare-fun b!1032274 () Bool)

(declare-fun e!583079 () Bool)

(declare-fun mapRes!37986 () Bool)

(assert (=> b!1032274 (= e!583080 (and e!583079 mapRes!37986))))

(declare-fun condMapEmpty!37986 () Bool)

(declare-fun mapDefault!37986 () ValueCell!11474)

(assert (=> b!1032274 (= condMapEmpty!37986 (= (arr!31208 (_values!6168 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11474)) mapDefault!37986)))))

(declare-fun res!689867 () Bool)

(declare-fun e!583078 () Bool)

(assert (=> start!90262 (=> (not res!689867) (not e!583078))))

(declare-fun valid!2105 (LongMapFixedSize!5542) Bool)

(assert (=> start!90262 (= res!689867 (valid!2105 thiss!1427))))

(assert (=> start!90262 e!583078))

(assert (=> start!90262 e!583074))

(assert (=> start!90262 true))

(declare-fun b!1032275 () Bool)

(declare-fun e!583076 () Bool)

(assert (=> b!1032275 (= e!583076 tp_is_empty!24355)))

(declare-fun b!1032276 () Bool)

(assert (=> b!1032276 (= e!583078 e!583073)))

(declare-fun res!689871 () Bool)

(assert (=> b!1032276 (=> (not res!689871) (not e!583073))))

(get-info :version)

(assert (=> b!1032276 (= res!689871 ((_ is Found!9652) lt!455474))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64823 (_ BitVec 32)) SeekEntryResult!9652)

(assert (=> b!1032276 (= lt!455474 (seekEntry!0 key!909 (_keys!11356 thiss!1427) (mask!29993 thiss!1427)))))

(declare-fun b!1032277 () Bool)

(declare-fun res!689868 () Bool)

(assert (=> b!1032277 (=> res!689868 e!583075)))

(assert (=> b!1032277 (= res!689868 (or (not (= (size!31726 (_values!6168 (_2!7825 lt!455471))) (bvadd #b00000000000000000000000000000001 (mask!29993 (_2!7825 lt!455471))))) (not (= (size!31725 (_keys!11356 (_2!7825 lt!455471))) (size!31726 (_values!6168 (_2!7825 lt!455471))))) (bvslt (mask!29993 (_2!7825 lt!455471)) #b00000000000000000000000000000000) (bvslt (extraKeys!5877 (_2!7825 lt!455471)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5877 (_2!7825 lt!455471)) #b00000000000000000000000000000011)))))

(declare-fun b!1032278 () Bool)

(declare-fun res!689870 () Bool)

(assert (=> b!1032278 (=> (not res!689870) (not e!583078))))

(assert (=> b!1032278 (= res!689870 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37986 () Bool)

(assert (=> mapIsEmpty!37986 mapRes!37986))

(declare-fun b!1032279 () Bool)

(declare-fun res!689869 () Bool)

(assert (=> b!1032279 (=> res!689869 e!583075)))

(assert (=> b!1032279 (= res!689869 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11356 (_2!7825 lt!455471)) (mask!29993 (_2!7825 lt!455471)))))))

(declare-fun b!1032280 () Bool)

(assert (=> b!1032280 (= e!583075 true)))

(declare-fun lt!455476 () Bool)

(assert (=> b!1032280 (= lt!455476 (arrayNoDuplicates!0 (_keys!11356 (_2!7825 lt!455471)) #b00000000000000000000000000000000 Nil!21836))))

(declare-fun mapNonEmpty!37986 () Bool)

(declare-fun tp!72976 () Bool)

(assert (=> mapNonEmpty!37986 (= mapRes!37986 (and tp!72976 e!583076))))

(declare-fun mapKey!37986 () (_ BitVec 32))

(declare-fun mapRest!37986 () (Array (_ BitVec 32) ValueCell!11474))

(declare-fun mapValue!37986 () ValueCell!11474)

(assert (=> mapNonEmpty!37986 (= (arr!31208 (_values!6168 thiss!1427)) (store mapRest!37986 mapKey!37986 mapValue!37986))))

(declare-fun b!1032281 () Bool)

(assert (=> b!1032281 (= e!583079 tp_is_empty!24355)))

(declare-fun b!1032282 () Bool)

(declare-fun res!689872 () Bool)

(assert (=> b!1032282 (=> res!689872 e!583075)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032282 (= res!689872 (not (validMask!0 (mask!29993 (_2!7825 lt!455471)))))))

(assert (= (and start!90262 res!689867) b!1032278))

(assert (= (and b!1032278 res!689870) b!1032276))

(assert (= (and b!1032276 res!689871) b!1032272))

(assert (= (and b!1032272 (not res!689873)) b!1032282))

(assert (= (and b!1032282 (not res!689872)) b!1032277))

(assert (= (and b!1032277 (not res!689868)) b!1032279))

(assert (= (and b!1032279 (not res!689869)) b!1032280))

(assert (= (and b!1032274 condMapEmpty!37986) mapIsEmpty!37986))

(assert (= (and b!1032274 (not condMapEmpty!37986)) mapNonEmpty!37986))

(assert (= (and mapNonEmpty!37986 ((_ is ValueCellFull!11474) mapValue!37986)) b!1032275))

(assert (= (and b!1032274 ((_ is ValueCellFull!11474) mapDefault!37986)) b!1032281))

(assert (= b!1032273 b!1032274))

(assert (= start!90262 b!1032273))

(declare-fun b_lambda!15989 () Bool)

(assert (=> (not b_lambda!15989) (not b!1032272)))

(declare-fun t!30959 () Bool)

(declare-fun tb!6945 () Bool)

(assert (=> (and b!1032273 (= (defaultEntry!6145 thiss!1427) (defaultEntry!6145 thiss!1427)) t!30959) tb!6945))

(declare-fun result!14227 () Bool)

(assert (=> tb!6945 (= result!14227 tp_is_empty!24355)))

(assert (=> b!1032272 t!30959))

(declare-fun b_and!33049 () Bool)

(assert (= b_and!33047 (and (=> t!30959 result!14227) b_and!33049)))

(declare-fun m!952505 () Bool)

(assert (=> b!1032280 m!952505))

(declare-fun m!952507 () Bool)

(assert (=> b!1032272 m!952507))

(declare-fun m!952509 () Bool)

(assert (=> b!1032272 m!952509))

(declare-fun m!952511 () Bool)

(assert (=> b!1032272 m!952511))

(declare-fun m!952513 () Bool)

(assert (=> b!1032272 m!952513))

(declare-fun m!952515 () Bool)

(assert (=> b!1032272 m!952515))

(declare-fun m!952517 () Bool)

(assert (=> b!1032272 m!952517))

(declare-fun m!952519 () Bool)

(assert (=> b!1032272 m!952519))

(declare-fun m!952521 () Bool)

(assert (=> b!1032272 m!952521))

(declare-fun m!952523 () Bool)

(assert (=> b!1032272 m!952523))

(declare-fun m!952525 () Bool)

(assert (=> b!1032272 m!952525))

(declare-fun m!952527 () Bool)

(assert (=> b!1032272 m!952527))

(assert (=> b!1032272 m!952509))

(declare-fun m!952529 () Bool)

(assert (=> b!1032272 m!952529))

(declare-fun m!952531 () Bool)

(assert (=> b!1032272 m!952531))

(declare-fun m!952533 () Bool)

(assert (=> b!1032272 m!952533))

(declare-fun m!952535 () Bool)

(assert (=> b!1032272 m!952535))

(assert (=> b!1032272 m!952531))

(declare-fun m!952537 () Bool)

(assert (=> b!1032272 m!952537))

(declare-fun m!952539 () Bool)

(assert (=> b!1032272 m!952539))

(declare-fun m!952541 () Bool)

(assert (=> b!1032272 m!952541))

(declare-fun m!952543 () Bool)

(assert (=> b!1032273 m!952543))

(declare-fun m!952545 () Bool)

(assert (=> b!1032273 m!952545))

(declare-fun m!952547 () Bool)

(assert (=> start!90262 m!952547))

(declare-fun m!952549 () Bool)

(assert (=> mapNonEmpty!37986 m!952549))

(declare-fun m!952551 () Bool)

(assert (=> b!1032276 m!952551))

(declare-fun m!952553 () Bool)

(assert (=> b!1032282 m!952553))

(declare-fun m!952555 () Bool)

(assert (=> b!1032279 m!952555))

(check-sat (not b!1032282) (not b_next!20635) (not b!1032279) (not b!1032272) (not start!90262) (not b!1032280) (not b!1032276) tp_is_empty!24355 (not b!1032273) b_and!33049 (not b_lambda!15989) (not mapNonEmpty!37986))
(check-sat b_and!33049 (not b_next!20635))
