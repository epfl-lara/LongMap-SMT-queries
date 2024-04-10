; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90054 () Bool)

(assert start!90054)

(declare-fun b!1031418 () Bool)

(declare-fun b_free!20661 () Bool)

(declare-fun b_next!20661 () Bool)

(assert (=> b!1031418 (= b_free!20661 (not b_next!20661))))

(declare-fun tp!73054 () Bool)

(declare-fun b_and!33089 () Bool)

(assert (=> b!1031418 (= tp!73054 b_and!33089)))

(declare-fun mapNonEmpty!38025 () Bool)

(declare-fun mapRes!38025 () Bool)

(declare-fun tp!73053 () Bool)

(declare-fun e!582547 () Bool)

(assert (=> mapNonEmpty!38025 (= mapRes!38025 (and tp!73053 e!582547))))

(declare-datatypes ((V!37381 0))(
  ( (V!37382 (val!12241 Int)) )
))
(declare-datatypes ((ValueCell!11487 0))(
  ( (ValueCellFull!11487 (v!14818 V!37381)) (EmptyCell!11487) )
))
(declare-fun mapValue!38025 () ValueCell!11487)

(declare-fun mapRest!38025 () (Array (_ BitVec 32) ValueCell!11487))

(declare-datatypes ((array!64826 0))(
  ( (array!64827 (arr!31215 (Array (_ BitVec 32) (_ BitVec 64))) (size!31732 (_ BitVec 32))) )
))
(declare-datatypes ((array!64828 0))(
  ( (array!64829 (arr!31216 (Array (_ BitVec 32) ValueCell!11487)) (size!31733 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5568 0))(
  ( (LongMapFixedSize!5569 (defaultEntry!6158 Int) (mask!29954 (_ BitVec 32)) (extraKeys!5890 (_ BitVec 32)) (zeroValue!5994 V!37381) (minValue!5994 V!37381) (_size!2839 (_ BitVec 32)) (_keys!11331 array!64826) (_values!6181 array!64828) (_vacant!2839 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5568)

(declare-fun mapKey!38025 () (_ BitVec 32))

(assert (=> mapNonEmpty!38025 (= (arr!31216 (_values!6181 thiss!1427)) (store mapRest!38025 mapKey!38025 mapValue!38025))))

(declare-fun res!689635 () Bool)

(declare-fun e!582549 () Bool)

(assert (=> start!90054 (=> (not res!689635) (not e!582549))))

(declare-fun valid!2108 (LongMapFixedSize!5568) Bool)

(assert (=> start!90054 (= res!689635 (valid!2108 thiss!1427))))

(assert (=> start!90054 e!582549))

(declare-fun e!582545 () Bool)

(assert (=> start!90054 e!582545))

(assert (=> start!90054 true))

(declare-fun b!1031412 () Bool)

(declare-fun e!582544 () Bool)

(declare-fun tp_is_empty!24381 () Bool)

(assert (=> b!1031412 (= e!582544 tp_is_empty!24381)))

(declare-fun b!1031413 () Bool)

(declare-fun res!689631 () Bool)

(declare-fun e!582542 () Bool)

(assert (=> b!1031413 (=> res!689631 e!582542)))

(declare-datatypes ((Unit!33727 0))(
  ( (Unit!33728) )
))
(declare-datatypes ((tuple2!15654 0))(
  ( (tuple2!15655 (_1!7838 Unit!33727) (_2!7838 LongMapFixedSize!5568)) )
))
(declare-fun lt!455349 () tuple2!15654)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031413 (= res!689631 (not (validMask!0 (mask!29954 (_2!7838 lt!455349)))))))

(declare-fun b!1031414 () Bool)

(declare-fun e!582543 () Bool)

(assert (=> b!1031414 (= e!582543 (not e!582542))))

(declare-fun res!689633 () Bool)

(assert (=> b!1031414 (=> res!689633 e!582542)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15656 0))(
  ( (tuple2!15657 (_1!7839 (_ BitVec 64)) (_2!7839 V!37381)) )
))
(declare-datatypes ((List!21865 0))(
  ( (Nil!21862) (Cons!21861 (h!23063 tuple2!15656) (t!31021 List!21865)) )
))
(declare-datatypes ((ListLongMap!13723 0))(
  ( (ListLongMap!13724 (toList!6877 List!21865)) )
))
(declare-fun contains!5991 (ListLongMap!13723 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3925 (array!64826 array!64828 (_ BitVec 32) (_ BitVec 32) V!37381 V!37381 (_ BitVec 32) Int) ListLongMap!13723)

(assert (=> b!1031414 (= res!689633 (not (contains!5991 (getCurrentListMap!3925 (_keys!11331 (_2!7838 lt!455349)) (_values!6181 (_2!7838 lt!455349)) (mask!29954 (_2!7838 lt!455349)) (extraKeys!5890 (_2!7838 lt!455349)) (zeroValue!5994 (_2!7838 lt!455349)) (minValue!5994 (_2!7838 lt!455349)) #b00000000000000000000000000000000 (defaultEntry!6158 (_2!7838 lt!455349))) key!909)))))

(declare-fun lt!455347 () array!64826)

(declare-fun lt!455343 () array!64828)

(declare-fun Unit!33729 () Unit!33727)

(declare-fun Unit!33730 () Unit!33727)

(assert (=> b!1031414 (= lt!455349 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2839 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15655 Unit!33729 (LongMapFixedSize!5569 (defaultEntry!6158 thiss!1427) (mask!29954 thiss!1427) (extraKeys!5890 thiss!1427) (zeroValue!5994 thiss!1427) (minValue!5994 thiss!1427) (bvsub (_size!2839 thiss!1427) #b00000000000000000000000000000001) lt!455347 lt!455343 (bvadd #b00000000000000000000000000000001 (_vacant!2839 thiss!1427)))) (tuple2!15655 Unit!33730 (LongMapFixedSize!5569 (defaultEntry!6158 thiss!1427) (mask!29954 thiss!1427) (extraKeys!5890 thiss!1427) (zeroValue!5994 thiss!1427) (minValue!5994 thiss!1427) (bvsub (_size!2839 thiss!1427) #b00000000000000000000000000000001) lt!455347 lt!455343 (_vacant!2839 thiss!1427)))))))

(declare-fun -!504 (ListLongMap!13723 (_ BitVec 64)) ListLongMap!13723)

(assert (=> b!1031414 (= (-!504 (getCurrentListMap!3925 (_keys!11331 thiss!1427) (_values!6181 thiss!1427) (mask!29954 thiss!1427) (extraKeys!5890 thiss!1427) (zeroValue!5994 thiss!1427) (minValue!5994 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6158 thiss!1427)) key!909) (getCurrentListMap!3925 lt!455347 lt!455343 (mask!29954 thiss!1427) (extraKeys!5890 thiss!1427) (zeroValue!5994 thiss!1427) (minValue!5994 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6158 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9707 0))(
  ( (MissingZero!9707 (index!41199 (_ BitVec 32))) (Found!9707 (index!41200 (_ BitVec 32))) (Intermediate!9707 (undefined!10519 Bool) (index!41201 (_ BitVec 32)) (x!91845 (_ BitVec 32))) (Undefined!9707) (MissingVacant!9707 (index!41202 (_ BitVec 32))) )
))
(declare-fun lt!455350 () SeekEntryResult!9707)

(declare-fun dynLambda!1974 (Int (_ BitVec 64)) V!37381)

(assert (=> b!1031414 (= lt!455343 (array!64829 (store (arr!31216 (_values!6181 thiss!1427)) (index!41200 lt!455350) (ValueCellFull!11487 (dynLambda!1974 (defaultEntry!6158 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31733 (_values!6181 thiss!1427))))))

(declare-fun lt!455344 () Unit!33727)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!30 (array!64826 array!64828 (_ BitVec 32) (_ BitVec 32) V!37381 V!37381 (_ BitVec 32) (_ BitVec 64) Int) Unit!33727)

(assert (=> b!1031414 (= lt!455344 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!30 (_keys!11331 thiss!1427) (_values!6181 thiss!1427) (mask!29954 thiss!1427) (extraKeys!5890 thiss!1427) (zeroValue!5994 thiss!1427) (minValue!5994 thiss!1427) (index!41200 lt!455350) key!909 (defaultEntry!6158 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031414 (not (arrayContainsKey!0 lt!455347 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455346 () Unit!33727)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64826 (_ BitVec 32) (_ BitVec 64)) Unit!33727)

(assert (=> b!1031414 (= lt!455346 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11331 thiss!1427) (index!41200 lt!455350) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64826 (_ BitVec 32)) Bool)

(assert (=> b!1031414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455347 (mask!29954 thiss!1427))))

(declare-fun lt!455342 () Unit!33727)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64826 (_ BitVec 32) (_ BitVec 32)) Unit!33727)

(assert (=> b!1031414 (= lt!455342 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11331 thiss!1427) (index!41200 lt!455350) (mask!29954 thiss!1427)))))

(declare-datatypes ((List!21866 0))(
  ( (Nil!21863) (Cons!21862 (h!23064 (_ BitVec 64)) (t!31022 List!21866)) )
))
(declare-fun arrayNoDuplicates!0 (array!64826 (_ BitVec 32) List!21866) Bool)

(assert (=> b!1031414 (arrayNoDuplicates!0 lt!455347 #b00000000000000000000000000000000 Nil!21863)))

(declare-fun lt!455345 () Unit!33727)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64826 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21866) Unit!33727)

(assert (=> b!1031414 (= lt!455345 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11331 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41200 lt!455350) #b00000000000000000000000000000000 Nil!21863))))

(declare-fun arrayCountValidKeys!0 (array!64826 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031414 (= (arrayCountValidKeys!0 lt!455347 #b00000000000000000000000000000000 (size!31732 (_keys!11331 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11331 thiss!1427) #b00000000000000000000000000000000 (size!31732 (_keys!11331 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031414 (= lt!455347 (array!64827 (store (arr!31215 (_keys!11331 thiss!1427)) (index!41200 lt!455350) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31732 (_keys!11331 thiss!1427))))))

(declare-fun lt!455351 () Unit!33727)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64826 (_ BitVec 32) (_ BitVec 64)) Unit!33727)

(assert (=> b!1031414 (= lt!455351 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11331 thiss!1427) (index!41200 lt!455350) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031415 () Bool)

(assert (=> b!1031415 (= e!582549 e!582543)))

(declare-fun res!689636 () Bool)

(assert (=> b!1031415 (=> (not res!689636) (not e!582543))))

(get-info :version)

(assert (=> b!1031415 (= res!689636 ((_ is Found!9707) lt!455350))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64826 (_ BitVec 32)) SeekEntryResult!9707)

(assert (=> b!1031415 (= lt!455350 (seekEntry!0 key!909 (_keys!11331 thiss!1427) (mask!29954 thiss!1427)))))

(declare-fun b!1031416 () Bool)

(declare-fun res!689632 () Bool)

(assert (=> b!1031416 (=> res!689632 e!582542)))

(assert (=> b!1031416 (= res!689632 (or (not (= (size!31733 (_values!6181 (_2!7838 lt!455349))) (bvadd #b00000000000000000000000000000001 (mask!29954 (_2!7838 lt!455349))))) (not (= (size!31732 (_keys!11331 (_2!7838 lt!455349))) (size!31733 (_values!6181 (_2!7838 lt!455349))))) (bvslt (mask!29954 (_2!7838 lt!455349)) #b00000000000000000000000000000000) (bvslt (extraKeys!5890 (_2!7838 lt!455349)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5890 (_2!7838 lt!455349)) #b00000000000000000000000000000011)))))

(declare-fun b!1031417 () Bool)

(assert (=> b!1031417 (= e!582542 true)))

(declare-fun lt!455348 () Bool)

(assert (=> b!1031417 (= lt!455348 (arrayNoDuplicates!0 (_keys!11331 (_2!7838 lt!455349)) #b00000000000000000000000000000000 Nil!21863))))

(declare-fun e!582546 () Bool)

(declare-fun array_inv!24161 (array!64826) Bool)

(declare-fun array_inv!24162 (array!64828) Bool)

(assert (=> b!1031418 (= e!582545 (and tp!73054 tp_is_empty!24381 (array_inv!24161 (_keys!11331 thiss!1427)) (array_inv!24162 (_values!6181 thiss!1427)) e!582546))))

(declare-fun b!1031419 () Bool)

(assert (=> b!1031419 (= e!582546 (and e!582544 mapRes!38025))))

(declare-fun condMapEmpty!38025 () Bool)

(declare-fun mapDefault!38025 () ValueCell!11487)

(assert (=> b!1031419 (= condMapEmpty!38025 (= (arr!31216 (_values!6181 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11487)) mapDefault!38025)))))

(declare-fun b!1031420 () Bool)

(declare-fun res!689634 () Bool)

(assert (=> b!1031420 (=> (not res!689634) (not e!582549))))

(assert (=> b!1031420 (= res!689634 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38025 () Bool)

(assert (=> mapIsEmpty!38025 mapRes!38025))

(declare-fun b!1031421 () Bool)

(declare-fun res!689630 () Bool)

(assert (=> b!1031421 (=> res!689630 e!582542)))

(assert (=> b!1031421 (= res!689630 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11331 (_2!7838 lt!455349)) (mask!29954 (_2!7838 lt!455349)))))))

(declare-fun b!1031422 () Bool)

(assert (=> b!1031422 (= e!582547 tp_is_empty!24381)))

(assert (= (and start!90054 res!689635) b!1031420))

(assert (= (and b!1031420 res!689634) b!1031415))

(assert (= (and b!1031415 res!689636) b!1031414))

(assert (= (and b!1031414 (not res!689633)) b!1031413))

(assert (= (and b!1031413 (not res!689631)) b!1031416))

(assert (= (and b!1031416 (not res!689632)) b!1031421))

(assert (= (and b!1031421 (not res!689630)) b!1031417))

(assert (= (and b!1031419 condMapEmpty!38025) mapIsEmpty!38025))

(assert (= (and b!1031419 (not condMapEmpty!38025)) mapNonEmpty!38025))

(assert (= (and mapNonEmpty!38025 ((_ is ValueCellFull!11487) mapValue!38025)) b!1031422))

(assert (= (and b!1031419 ((_ is ValueCellFull!11487) mapDefault!38025)) b!1031412))

(assert (= b!1031418 b!1031419))

(assert (= start!90054 b!1031418))

(declare-fun b_lambda!16005 () Bool)

(assert (=> (not b_lambda!16005) (not b!1031414)))

(declare-fun t!31020 () Bool)

(declare-fun tb!6979 () Bool)

(assert (=> (and b!1031418 (= (defaultEntry!6158 thiss!1427) (defaultEntry!6158 thiss!1427)) t!31020) tb!6979))

(declare-fun result!14287 () Bool)

(assert (=> tb!6979 (= result!14287 tp_is_empty!24381)))

(assert (=> b!1031414 t!31020))

(declare-fun b_and!33091 () Bool)

(assert (= b_and!33089 (and (=> t!31020 result!14287) b_and!33091)))

(declare-fun m!951517 () Bool)

(assert (=> b!1031415 m!951517))

(declare-fun m!951519 () Bool)

(assert (=> start!90054 m!951519))

(declare-fun m!951521 () Bool)

(assert (=> b!1031421 m!951521))

(declare-fun m!951523 () Bool)

(assert (=> mapNonEmpty!38025 m!951523))

(declare-fun m!951525 () Bool)

(assert (=> b!1031414 m!951525))

(declare-fun m!951527 () Bool)

(assert (=> b!1031414 m!951527))

(declare-fun m!951529 () Bool)

(assert (=> b!1031414 m!951529))

(declare-fun m!951531 () Bool)

(assert (=> b!1031414 m!951531))

(declare-fun m!951533 () Bool)

(assert (=> b!1031414 m!951533))

(declare-fun m!951535 () Bool)

(assert (=> b!1031414 m!951535))

(assert (=> b!1031414 m!951531))

(declare-fun m!951537 () Bool)

(assert (=> b!1031414 m!951537))

(declare-fun m!951539 () Bool)

(assert (=> b!1031414 m!951539))

(declare-fun m!951541 () Bool)

(assert (=> b!1031414 m!951541))

(declare-fun m!951543 () Bool)

(assert (=> b!1031414 m!951543))

(declare-fun m!951545 () Bool)

(assert (=> b!1031414 m!951545))

(declare-fun m!951547 () Bool)

(assert (=> b!1031414 m!951547))

(declare-fun m!951549 () Bool)

(assert (=> b!1031414 m!951549))

(declare-fun m!951551 () Bool)

(assert (=> b!1031414 m!951551))

(declare-fun m!951553 () Bool)

(assert (=> b!1031414 m!951553))

(declare-fun m!951555 () Bool)

(assert (=> b!1031414 m!951555))

(declare-fun m!951557 () Bool)

(assert (=> b!1031414 m!951557))

(assert (=> b!1031414 m!951545))

(declare-fun m!951559 () Bool)

(assert (=> b!1031414 m!951559))

(declare-fun m!951561 () Bool)

(assert (=> b!1031417 m!951561))

(declare-fun m!951563 () Bool)

(assert (=> b!1031418 m!951563))

(declare-fun m!951565 () Bool)

(assert (=> b!1031418 m!951565))

(declare-fun m!951567 () Bool)

(assert (=> b!1031413 m!951567))

(check-sat (not start!90054) (not mapNonEmpty!38025) b_and!33091 (not b_next!20661) (not b!1031417) (not b!1031418) (not b!1031421) (not b_lambda!16005) tp_is_empty!24381 (not b!1031415) (not b!1031413) (not b!1031414))
(check-sat b_and!33091 (not b_next!20661))
