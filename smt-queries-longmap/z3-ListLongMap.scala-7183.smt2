; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92212 () Bool)

(assert start!92212)

(declare-fun b!1047267 () Bool)

(declare-fun b_free!21151 () Bool)

(declare-fun b_next!21151 () Bool)

(assert (=> b!1047267 (= b_free!21151 (not b_next!21151))))

(declare-fun tp!74715 () Bool)

(declare-fun b_and!33807 () Bool)

(assert (=> b!1047267 (= tp!74715 b_and!33807)))

(declare-fun b!1047263 () Bool)

(declare-fun e!593808 () Bool)

(declare-fun e!593807 () Bool)

(declare-fun mapRes!38951 () Bool)

(assert (=> b!1047263 (= e!593808 (and e!593807 mapRes!38951))))

(declare-fun condMapEmpty!38951 () Bool)

(declare-datatypes ((V!38035 0))(
  ( (V!38036 (val!12486 Int)) )
))
(declare-datatypes ((ValueCell!11732 0))(
  ( (ValueCellFull!11732 (v!15079 V!38035)) (EmptyCell!11732) )
))
(declare-datatypes ((array!65969 0))(
  ( (array!65970 (arr!31723 (Array (_ BitVec 32) (_ BitVec 64))) (size!32259 (_ BitVec 32))) )
))
(declare-datatypes ((array!65971 0))(
  ( (array!65972 (arr!31724 (Array (_ BitVec 32) ValueCell!11732)) (size!32260 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6058 0))(
  ( (LongMapFixedSize!6059 (defaultEntry!6427 Int) (mask!30626 (_ BitVec 32)) (extraKeys!6155 (_ BitVec 32)) (zeroValue!6261 V!38035) (minValue!6261 V!38035) (_size!3084 (_ BitVec 32)) (_keys!11739 array!65969) (_values!6450 array!65971) (_vacant!3084 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6058)

(declare-fun mapDefault!38951 () ValueCell!11732)

(assert (=> b!1047263 (= condMapEmpty!38951 (= (arr!31724 (_values!6450 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11732)) mapDefault!38951)))))

(declare-fun b!1047264 () Bool)

(declare-fun res!696868 () Bool)

(declare-fun e!593805 () Bool)

(assert (=> b!1047264 (=> res!696868 e!593805)))

(declare-datatypes ((Unit!34189 0))(
  ( (Unit!34190) )
))
(declare-datatypes ((tuple2!15810 0))(
  ( (tuple2!15811 (_1!7916 Unit!34189) (_2!7916 LongMapFixedSize!6058)) )
))
(declare-fun lt!462440 () tuple2!15810)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1047264 (= res!696868 (not (validMask!0 (mask!30626 (_2!7916 lt!462440)))))))

(declare-fun res!696870 () Bool)

(declare-fun e!593806 () Bool)

(assert (=> start!92212 (=> (not res!696870) (not e!593806))))

(declare-fun valid!2279 (LongMapFixedSize!6058) Bool)

(assert (=> start!92212 (= res!696870 (valid!2279 thiss!1427))))

(assert (=> start!92212 e!593806))

(declare-fun e!593803 () Bool)

(assert (=> start!92212 e!593803))

(assert (=> start!92212 true))

(declare-fun b!1047265 () Bool)

(declare-fun res!696865 () Bool)

(assert (=> b!1047265 (=> (not res!696865) (not e!593806))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1047265 (= res!696865 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1047266 () Bool)

(declare-fun e!593801 () Bool)

(declare-fun tp_is_empty!24871 () Bool)

(assert (=> b!1047266 (= e!593801 tp_is_empty!24871)))

(declare-fun mapNonEmpty!38951 () Bool)

(declare-fun tp!74714 () Bool)

(assert (=> mapNonEmpty!38951 (= mapRes!38951 (and tp!74714 e!593801))))

(declare-fun mapRest!38951 () (Array (_ BitVec 32) ValueCell!11732))

(declare-fun mapKey!38951 () (_ BitVec 32))

(declare-fun mapValue!38951 () ValueCell!11732)

(assert (=> mapNonEmpty!38951 (= (arr!31724 (_values!6450 thiss!1427)) (store mapRest!38951 mapKey!38951 mapValue!38951))))

(declare-fun array_inv!24515 (array!65969) Bool)

(declare-fun array_inv!24516 (array!65971) Bool)

(assert (=> b!1047267 (= e!593803 (and tp!74715 tp_is_empty!24871 (array_inv!24515 (_keys!11739 thiss!1427)) (array_inv!24516 (_values!6450 thiss!1427)) e!593808))))

(declare-fun b!1047268 () Bool)

(declare-datatypes ((List!22021 0))(
  ( (Nil!22018) (Cons!22017 (h!23234 (_ BitVec 64)) (t!31295 List!22021)) )
))
(declare-fun arrayNoDuplicates!0 (array!65969 (_ BitVec 32) List!22021) Bool)

(assert (=> b!1047268 (= e!593805 (arrayNoDuplicates!0 (_keys!11739 (_2!7916 lt!462440)) #b00000000000000000000000000000000 Nil!22018))))

(declare-fun mapIsEmpty!38951 () Bool)

(assert (=> mapIsEmpty!38951 mapRes!38951))

(declare-fun b!1047269 () Bool)

(assert (=> b!1047269 (= e!593807 tp_is_empty!24871)))

(declare-fun b!1047270 () Bool)

(declare-fun e!593804 () Bool)

(assert (=> b!1047270 (= e!593806 e!593804)))

(declare-fun res!696866 () Bool)

(assert (=> b!1047270 (=> (not res!696866) (not e!593804))))

(declare-datatypes ((SeekEntryResult!9810 0))(
  ( (MissingZero!9810 (index!41611 (_ BitVec 32))) (Found!9810 (index!41612 (_ BitVec 32))) (Intermediate!9810 (undefined!10622 Bool) (index!41613 (_ BitVec 32)) (x!93420 (_ BitVec 32))) (Undefined!9810) (MissingVacant!9810 (index!41614 (_ BitVec 32))) )
))
(declare-fun lt!462439 () SeekEntryResult!9810)

(get-info :version)

(assert (=> b!1047270 (= res!696866 ((_ is Found!9810) lt!462439))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65969 (_ BitVec 32)) SeekEntryResult!9810)

(assert (=> b!1047270 (= lt!462439 (seekEntry!0 key!909 (_keys!11739 thiss!1427) (mask!30626 thiss!1427)))))

(declare-fun b!1047271 () Bool)

(declare-fun res!696864 () Bool)

(assert (=> b!1047271 (=> res!696864 e!593805)))

(assert (=> b!1047271 (= res!696864 (or (not (= (size!32260 (_values!6450 (_2!7916 lt!462440))) (bvadd #b00000000000000000000000000000001 (mask!30626 (_2!7916 lt!462440))))) (not (= (size!32259 (_keys!11739 (_2!7916 lt!462440))) (size!32260 (_values!6450 (_2!7916 lt!462440))))) (bvslt (mask!30626 (_2!7916 lt!462440)) #b00000000000000000000000000000000) (bvslt (extraKeys!6155 (_2!7916 lt!462440)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6155 (_2!7916 lt!462440)) #b00000000000000000000000000000011)))))

(declare-fun b!1047272 () Bool)

(assert (=> b!1047272 (= e!593804 (not e!593805))))

(declare-fun res!696869 () Bool)

(assert (=> b!1047272 (=> res!696869 e!593805)))

(declare-datatypes ((tuple2!15812 0))(
  ( (tuple2!15813 (_1!7917 (_ BitVec 64)) (_2!7917 V!38035)) )
))
(declare-datatypes ((List!22022 0))(
  ( (Nil!22019) (Cons!22018 (h!23235 tuple2!15812) (t!31296 List!22022)) )
))
(declare-datatypes ((ListLongMap!13809 0))(
  ( (ListLongMap!13810 (toList!6920 List!22022)) )
))
(declare-fun contains!6115 (ListLongMap!13809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3964 (array!65969 array!65971 (_ BitVec 32) (_ BitVec 32) V!38035 V!38035 (_ BitVec 32) Int) ListLongMap!13809)

(assert (=> b!1047272 (= res!696869 (not (contains!6115 (getCurrentListMap!3964 (_keys!11739 (_2!7916 lt!462440)) (_values!6450 (_2!7916 lt!462440)) (mask!30626 (_2!7916 lt!462440)) (extraKeys!6155 (_2!7916 lt!462440)) (zeroValue!6261 (_2!7916 lt!462440)) (minValue!6261 (_2!7916 lt!462440)) #b00000000000000000000000000000000 (defaultEntry!6427 (_2!7916 lt!462440))) key!909)))))

(declare-fun lt!462438 () array!65969)

(declare-fun lt!462441 () array!65971)

(declare-fun Unit!34191 () Unit!34189)

(declare-fun Unit!34192 () Unit!34189)

(assert (=> b!1047272 (= lt!462440 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3084 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15811 Unit!34191 (LongMapFixedSize!6059 (defaultEntry!6427 thiss!1427) (mask!30626 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) (bvsub (_size!3084 thiss!1427) #b00000000000000000000000000000001) lt!462438 lt!462441 (bvadd #b00000000000000000000000000000001 (_vacant!3084 thiss!1427)))) (tuple2!15811 Unit!34192 (LongMapFixedSize!6059 (defaultEntry!6427 thiss!1427) (mask!30626 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) (bvsub (_size!3084 thiss!1427) #b00000000000000000000000000000001) lt!462438 lt!462441 (_vacant!3084 thiss!1427)))))))

(declare-fun -!543 (ListLongMap!13809 (_ BitVec 64)) ListLongMap!13809)

(assert (=> b!1047272 (= (-!543 (getCurrentListMap!3964 (_keys!11739 thiss!1427) (_values!6450 thiss!1427) (mask!30626 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6427 thiss!1427)) key!909) (getCurrentListMap!3964 lt!462438 lt!462441 (mask!30626 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6427 thiss!1427)))))

(declare-fun dynLambda!2035 (Int (_ BitVec 64)) V!38035)

(assert (=> b!1047272 (= lt!462441 (array!65972 (store (arr!31724 (_values!6450 thiss!1427)) (index!41612 lt!462439) (ValueCellFull!11732 (dynLambda!2035 (defaultEntry!6427 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32260 (_values!6450 thiss!1427))))))

(declare-fun lt!462437 () Unit!34189)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!65 (array!65969 array!65971 (_ BitVec 32) (_ BitVec 32) V!38035 V!38035 (_ BitVec 32) (_ BitVec 64) Int) Unit!34189)

(assert (=> b!1047272 (= lt!462437 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!65 (_keys!11739 thiss!1427) (_values!6450 thiss!1427) (mask!30626 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) (index!41612 lt!462439) key!909 (defaultEntry!6427 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1047272 (not (arrayContainsKey!0 lt!462438 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462434 () Unit!34189)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65969 (_ BitVec 32) (_ BitVec 64)) Unit!34189)

(assert (=> b!1047272 (= lt!462434 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11739 thiss!1427) (index!41612 lt!462439) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65969 (_ BitVec 32)) Bool)

(assert (=> b!1047272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462438 (mask!30626 thiss!1427))))

(declare-fun lt!462442 () Unit!34189)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65969 (_ BitVec 32) (_ BitVec 32)) Unit!34189)

(assert (=> b!1047272 (= lt!462442 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11739 thiss!1427) (index!41612 lt!462439) (mask!30626 thiss!1427)))))

(assert (=> b!1047272 (arrayNoDuplicates!0 lt!462438 #b00000000000000000000000000000000 Nil!22018)))

(declare-fun lt!462436 () Unit!34189)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65969 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22021) Unit!34189)

(assert (=> b!1047272 (= lt!462436 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11739 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41612 lt!462439) #b00000000000000000000000000000000 Nil!22018))))

(declare-fun arrayCountValidKeys!0 (array!65969 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1047272 (= (arrayCountValidKeys!0 lt!462438 #b00000000000000000000000000000000 (size!32259 (_keys!11739 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11739 thiss!1427) #b00000000000000000000000000000000 (size!32259 (_keys!11739 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1047272 (= lt!462438 (array!65970 (store (arr!31723 (_keys!11739 thiss!1427)) (index!41612 lt!462439) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32259 (_keys!11739 thiss!1427))))))

(declare-fun lt!462435 () Unit!34189)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65969 (_ BitVec 32) (_ BitVec 64)) Unit!34189)

(assert (=> b!1047272 (= lt!462435 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11739 thiss!1427) (index!41612 lt!462439) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047273 () Bool)

(declare-fun res!696867 () Bool)

(assert (=> b!1047273 (=> res!696867 e!593805)))

(assert (=> b!1047273 (= res!696867 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11739 (_2!7916 lt!462440)) (mask!30626 (_2!7916 lt!462440)))))))

(assert (= (and start!92212 res!696870) b!1047265))

(assert (= (and b!1047265 res!696865) b!1047270))

(assert (= (and b!1047270 res!696866) b!1047272))

(assert (= (and b!1047272 (not res!696869)) b!1047264))

(assert (= (and b!1047264 (not res!696868)) b!1047271))

(assert (= (and b!1047271 (not res!696864)) b!1047273))

(assert (= (and b!1047273 (not res!696867)) b!1047268))

(assert (= (and b!1047263 condMapEmpty!38951) mapIsEmpty!38951))

(assert (= (and b!1047263 (not condMapEmpty!38951)) mapNonEmpty!38951))

(assert (= (and mapNonEmpty!38951 ((_ is ValueCellFull!11732) mapValue!38951)) b!1047266))

(assert (= (and b!1047263 ((_ is ValueCellFull!11732) mapDefault!38951)) b!1047269))

(assert (= b!1047267 b!1047263))

(assert (= start!92212 b!1047267))

(declare-fun b_lambda!16345 () Bool)

(assert (=> (not b_lambda!16345) (not b!1047272)))

(declare-fun t!31294 () Bool)

(declare-fun tb!7095 () Bool)

(assert (=> (and b!1047267 (= (defaultEntry!6427 thiss!1427) (defaultEntry!6427 thiss!1427)) t!31294) tb!7095))

(declare-fun result!14623 () Bool)

(assert (=> tb!7095 (= result!14623 tp_is_empty!24871)))

(assert (=> b!1047272 t!31294))

(declare-fun b_and!33809 () Bool)

(assert (= b_and!33807 (and (=> t!31294 result!14623) b_and!33809)))

(declare-fun m!967465 () Bool)

(assert (=> b!1047267 m!967465))

(declare-fun m!967467 () Bool)

(assert (=> b!1047267 m!967467))

(declare-fun m!967469 () Bool)

(assert (=> b!1047270 m!967469))

(declare-fun m!967471 () Bool)

(assert (=> b!1047264 m!967471))

(declare-fun m!967473 () Bool)

(assert (=> b!1047272 m!967473))

(declare-fun m!967475 () Bool)

(assert (=> b!1047272 m!967475))

(declare-fun m!967477 () Bool)

(assert (=> b!1047272 m!967477))

(declare-fun m!967479 () Bool)

(assert (=> b!1047272 m!967479))

(declare-fun m!967481 () Bool)

(assert (=> b!1047272 m!967481))

(declare-fun m!967483 () Bool)

(assert (=> b!1047272 m!967483))

(declare-fun m!967485 () Bool)

(assert (=> b!1047272 m!967485))

(declare-fun m!967487 () Bool)

(assert (=> b!1047272 m!967487))

(declare-fun m!967489 () Bool)

(assert (=> b!1047272 m!967489))

(declare-fun m!967491 () Bool)

(assert (=> b!1047272 m!967491))

(declare-fun m!967493 () Bool)

(assert (=> b!1047272 m!967493))

(declare-fun m!967495 () Bool)

(assert (=> b!1047272 m!967495))

(declare-fun m!967497 () Bool)

(assert (=> b!1047272 m!967497))

(declare-fun m!967499 () Bool)

(assert (=> b!1047272 m!967499))

(declare-fun m!967501 () Bool)

(assert (=> b!1047272 m!967501))

(assert (=> b!1047272 m!967493))

(declare-fun m!967503 () Bool)

(assert (=> b!1047272 m!967503))

(declare-fun m!967505 () Bool)

(assert (=> b!1047272 m!967505))

(assert (=> b!1047272 m!967491))

(declare-fun m!967507 () Bool)

(assert (=> b!1047272 m!967507))

(declare-fun m!967509 () Bool)

(assert (=> start!92212 m!967509))

(declare-fun m!967511 () Bool)

(assert (=> mapNonEmpty!38951 m!967511))

(declare-fun m!967513 () Bool)

(assert (=> b!1047273 m!967513))

(declare-fun m!967515 () Bool)

(assert (=> b!1047268 m!967515))

(check-sat (not b!1047268) (not b!1047264) (not mapNonEmpty!38951) (not b!1047267) (not b!1047272) (not b_next!21151) (not b_lambda!16345) tp_is_empty!24871 (not start!92212) (not b!1047270) (not b!1047273) b_and!33809)
(check-sat b_and!33809 (not b_next!21151))
