; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91982 () Bool)

(assert start!91982)

(declare-fun b!1045908 () Bool)

(declare-fun b_free!21157 () Bool)

(declare-fun b_next!21157 () Bool)

(assert (=> b!1045908 (= b_free!21157 (not b_next!21157))))

(declare-fun tp!74732 () Bool)

(declare-fun b_and!33783 () Bool)

(assert (=> b!1045908 (= tp!74732 b_and!33783)))

(declare-fun b!1045902 () Bool)

(declare-fun e!592946 () Bool)

(declare-fun tp_is_empty!24877 () Bool)

(assert (=> b!1045902 (= e!592946 tp_is_empty!24877)))

(declare-fun mapNonEmpty!38960 () Bool)

(declare-fun mapRes!38960 () Bool)

(declare-fun tp!74733 () Bool)

(declare-fun e!592939 () Bool)

(assert (=> mapNonEmpty!38960 (= mapRes!38960 (and tp!74733 e!592939))))

(declare-fun mapKey!38960 () (_ BitVec 32))

(declare-datatypes ((V!38043 0))(
  ( (V!38044 (val!12489 Int)) )
))
(declare-datatypes ((ValueCell!11735 0))(
  ( (ValueCellFull!11735 (v!15085 V!38043)) (EmptyCell!11735) )
))
(declare-fun mapValue!38960 () ValueCell!11735)

(declare-datatypes ((array!65871 0))(
  ( (array!65872 (arr!31680 (Array (_ BitVec 32) (_ BitVec 64))) (size!32217 (_ BitVec 32))) )
))
(declare-datatypes ((array!65873 0))(
  ( (array!65874 (arr!31681 (Array (_ BitVec 32) ValueCell!11735)) (size!32218 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6064 0))(
  ( (LongMapFixedSize!6065 (defaultEntry!6430 Int) (mask!30566 (_ BitVec 32)) (extraKeys!6158 (_ BitVec 32)) (zeroValue!6264 V!38043) (minValue!6264 V!38043) (_size!3087 (_ BitVec 32)) (_keys!11700 array!65871) (_values!6453 array!65873) (_vacant!3087 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6064)

(declare-fun mapRest!38960 () (Array (_ BitVec 32) ValueCell!11735))

(assert (=> mapNonEmpty!38960 (= (arr!31681 (_values!6453 thiss!1427)) (store mapRest!38960 mapKey!38960 mapValue!38960))))

(declare-fun b!1045904 () Bool)

(declare-fun res!696350 () Bool)

(declare-fun e!592945 () Bool)

(assert (=> b!1045904 (=> (not res!696350) (not e!592945))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1045904 (= res!696350 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1045905 () Bool)

(declare-fun e!592941 () Bool)

(assert (=> b!1045905 (= e!592941 true)))

(declare-fun lt!461803 () Bool)

(declare-datatypes ((Unit!34063 0))(
  ( (Unit!34064) )
))
(declare-datatypes ((tuple2!15886 0))(
  ( (tuple2!15887 (_1!7954 Unit!34063) (_2!7954 LongMapFixedSize!6064)) )
))
(declare-fun lt!461802 () tuple2!15886)

(declare-datatypes ((List!22065 0))(
  ( (Nil!22062) (Cons!22061 (h!23269 (_ BitVec 64)) (t!31344 List!22065)) )
))
(declare-fun arrayNoDuplicates!0 (array!65871 (_ BitVec 32) List!22065) Bool)

(assert (=> b!1045905 (= lt!461803 (arrayNoDuplicates!0 (_keys!11700 (_2!7954 lt!461802)) #b00000000000000000000000000000000 Nil!22062))))

(declare-fun b!1045906 () Bool)

(declare-fun e!592940 () Bool)

(assert (=> b!1045906 (= e!592940 (and e!592946 mapRes!38960))))

(declare-fun condMapEmpty!38960 () Bool)

(declare-fun mapDefault!38960 () ValueCell!11735)

(assert (=> b!1045906 (= condMapEmpty!38960 (= (arr!31681 (_values!6453 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11735)) mapDefault!38960)))))

(declare-fun mapIsEmpty!38960 () Bool)

(assert (=> mapIsEmpty!38960 mapRes!38960))

(declare-fun b!1045907 () Bool)

(declare-fun res!696355 () Bool)

(assert (=> b!1045907 (=> res!696355 e!592941)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045907 (= res!696355 (not (validMask!0 (mask!30566 (_2!7954 lt!461802)))))))

(declare-fun e!592942 () Bool)

(declare-fun array_inv!24477 (array!65871) Bool)

(declare-fun array_inv!24478 (array!65873) Bool)

(assert (=> b!1045908 (= e!592942 (and tp!74732 tp_is_empty!24877 (array_inv!24477 (_keys!11700 thiss!1427)) (array_inv!24478 (_values!6453 thiss!1427)) e!592940))))

(declare-fun res!696353 () Bool)

(assert (=> start!91982 (=> (not res!696353) (not e!592945))))

(declare-fun valid!2271 (LongMapFixedSize!6064) Bool)

(assert (=> start!91982 (= res!696353 (valid!2271 thiss!1427))))

(assert (=> start!91982 e!592945))

(assert (=> start!91982 e!592942))

(assert (=> start!91982 true))

(declare-fun b!1045903 () Bool)

(assert (=> b!1045903 (= e!592939 tp_is_empty!24877)))

(declare-fun b!1045909 () Bool)

(declare-fun res!696351 () Bool)

(assert (=> b!1045909 (=> res!696351 e!592941)))

(assert (=> b!1045909 (= res!696351 (or (not (= (size!32218 (_values!6453 (_2!7954 lt!461802))) (bvadd #b00000000000000000000000000000001 (mask!30566 (_2!7954 lt!461802))))) (not (= (size!32217 (_keys!11700 (_2!7954 lt!461802))) (size!32218 (_values!6453 (_2!7954 lt!461802))))) (bvslt (mask!30566 (_2!7954 lt!461802)) #b00000000000000000000000000000000) (bvslt (extraKeys!6158 (_2!7954 lt!461802)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6158 (_2!7954 lt!461802)) #b00000000000000000000000000000011)))))

(declare-fun b!1045910 () Bool)

(declare-fun e!592944 () Bool)

(assert (=> b!1045910 (= e!592944 (not e!592941))))

(declare-fun res!696356 () Bool)

(assert (=> b!1045910 (=> res!696356 e!592941)))

(declare-datatypes ((tuple2!15888 0))(
  ( (tuple2!15889 (_1!7955 (_ BitVec 64)) (_2!7955 V!38043)) )
))
(declare-datatypes ((List!22066 0))(
  ( (Nil!22063) (Cons!22062 (h!23270 tuple2!15888) (t!31345 List!22066)) )
))
(declare-datatypes ((ListLongMap!13871 0))(
  ( (ListLongMap!13872 (toList!6951 List!22066)) )
))
(declare-fun contains!6065 (ListLongMap!13871 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3917 (array!65871 array!65873 (_ BitVec 32) (_ BitVec 32) V!38043 V!38043 (_ BitVec 32) Int) ListLongMap!13871)

(assert (=> b!1045910 (= res!696356 (not (contains!6065 (getCurrentListMap!3917 (_keys!11700 (_2!7954 lt!461802)) (_values!6453 (_2!7954 lt!461802)) (mask!30566 (_2!7954 lt!461802)) (extraKeys!6158 (_2!7954 lt!461802)) (zeroValue!6264 (_2!7954 lt!461802)) (minValue!6264 (_2!7954 lt!461802)) #b00000000000000000000000000000000 (defaultEntry!6430 (_2!7954 lt!461802))) key!909)))))

(declare-fun lt!461811 () array!65873)

(declare-fun lt!461806 () array!65871)

(declare-fun Unit!34065 () Unit!34063)

(declare-fun Unit!34066 () Unit!34063)

(assert (=> b!1045910 (= lt!461802 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3087 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15887 Unit!34065 (LongMapFixedSize!6065 (defaultEntry!6430 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) (bvsub (_size!3087 thiss!1427) #b00000000000000000000000000000001) lt!461806 lt!461811 (bvadd #b00000000000000000000000000000001 (_vacant!3087 thiss!1427)))) (tuple2!15887 Unit!34066 (LongMapFixedSize!6065 (defaultEntry!6430 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) (bvsub (_size!3087 thiss!1427) #b00000000000000000000000000000001) lt!461806 lt!461811 (_vacant!3087 thiss!1427)))))))

(declare-fun -!543 (ListLongMap!13871 (_ BitVec 64)) ListLongMap!13871)

(assert (=> b!1045910 (= (-!543 (getCurrentListMap!3917 (_keys!11700 thiss!1427) (_values!6453 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6430 thiss!1427)) key!909) (getCurrentListMap!3917 lt!461806 lt!461811 (mask!30566 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6430 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9856 0))(
  ( (MissingZero!9856 (index!41795 (_ BitVec 32))) (Found!9856 (index!41796 (_ BitVec 32))) (Intermediate!9856 (undefined!10668 Bool) (index!41797 (_ BitVec 32)) (x!93455 (_ BitVec 32))) (Undefined!9856) (MissingVacant!9856 (index!41798 (_ BitVec 32))) )
))
(declare-fun lt!461808 () SeekEntryResult!9856)

(declare-fun dynLambda!2004 (Int (_ BitVec 64)) V!38043)

(assert (=> b!1045910 (= lt!461811 (array!65874 (store (arr!31681 (_values!6453 thiss!1427)) (index!41796 lt!461808) (ValueCellFull!11735 (dynLambda!2004 (defaultEntry!6430 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32218 (_values!6453 thiss!1427))))))

(declare-fun lt!461804 () Unit!34063)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!65 (array!65871 array!65873 (_ BitVec 32) (_ BitVec 32) V!38043 V!38043 (_ BitVec 32) (_ BitVec 64) Int) Unit!34063)

(assert (=> b!1045910 (= lt!461804 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!65 (_keys!11700 thiss!1427) (_values!6453 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) (index!41796 lt!461808) key!909 (defaultEntry!6430 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045910 (not (arrayContainsKey!0 lt!461806 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461810 () Unit!34063)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65871 (_ BitVec 32) (_ BitVec 64)) Unit!34063)

(assert (=> b!1045910 (= lt!461810 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11700 thiss!1427) (index!41796 lt!461808) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65871 (_ BitVec 32)) Bool)

(assert (=> b!1045910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461806 (mask!30566 thiss!1427))))

(declare-fun lt!461805 () Unit!34063)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65871 (_ BitVec 32) (_ BitVec 32)) Unit!34063)

(assert (=> b!1045910 (= lt!461805 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11700 thiss!1427) (index!41796 lt!461808) (mask!30566 thiss!1427)))))

(assert (=> b!1045910 (arrayNoDuplicates!0 lt!461806 #b00000000000000000000000000000000 Nil!22062)))

(declare-fun lt!461809 () Unit!34063)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65871 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22065) Unit!34063)

(assert (=> b!1045910 (= lt!461809 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11700 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41796 lt!461808) #b00000000000000000000000000000000 Nil!22062))))

(declare-fun arrayCountValidKeys!0 (array!65871 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045910 (= (arrayCountValidKeys!0 lt!461806 #b00000000000000000000000000000000 (size!32217 (_keys!11700 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11700 thiss!1427) #b00000000000000000000000000000000 (size!32217 (_keys!11700 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045910 (= lt!461806 (array!65872 (store (arr!31680 (_keys!11700 thiss!1427)) (index!41796 lt!461808) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32217 (_keys!11700 thiss!1427))))))

(declare-fun lt!461807 () Unit!34063)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65871 (_ BitVec 32) (_ BitVec 64)) Unit!34063)

(assert (=> b!1045910 (= lt!461807 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11700 thiss!1427) (index!41796 lt!461808) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045911 () Bool)

(declare-fun res!696352 () Bool)

(assert (=> b!1045911 (=> res!696352 e!592941)))

(assert (=> b!1045911 (= res!696352 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11700 (_2!7954 lt!461802)) (mask!30566 (_2!7954 lt!461802)))))))

(declare-fun b!1045912 () Bool)

(assert (=> b!1045912 (= e!592945 e!592944)))

(declare-fun res!696354 () Bool)

(assert (=> b!1045912 (=> (not res!696354) (not e!592944))))

(get-info :version)

(assert (=> b!1045912 (= res!696354 ((_ is Found!9856) lt!461808))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65871 (_ BitVec 32)) SeekEntryResult!9856)

(assert (=> b!1045912 (= lt!461808 (seekEntry!0 key!909 (_keys!11700 thiss!1427) (mask!30566 thiss!1427)))))

(assert (= (and start!91982 res!696353) b!1045904))

(assert (= (and b!1045904 res!696350) b!1045912))

(assert (= (and b!1045912 res!696354) b!1045910))

(assert (= (and b!1045910 (not res!696356)) b!1045907))

(assert (= (and b!1045907 (not res!696355)) b!1045909))

(assert (= (and b!1045909 (not res!696351)) b!1045911))

(assert (= (and b!1045911 (not res!696352)) b!1045905))

(assert (= (and b!1045906 condMapEmpty!38960) mapIsEmpty!38960))

(assert (= (and b!1045906 (not condMapEmpty!38960)) mapNonEmpty!38960))

(assert (= (and mapNonEmpty!38960 ((_ is ValueCellFull!11735) mapValue!38960)) b!1045903))

(assert (= (and b!1045906 ((_ is ValueCellFull!11735) mapDefault!38960)) b!1045902))

(assert (= b!1045908 b!1045906))

(assert (= start!91982 b!1045908))

(declare-fun b_lambda!16319 () Bool)

(assert (=> (not b_lambda!16319) (not b!1045910)))

(declare-fun t!31343 () Bool)

(declare-fun tb!7101 () Bool)

(assert (=> (and b!1045908 (= (defaultEntry!6430 thiss!1427) (defaultEntry!6430 thiss!1427)) t!31343) tb!7101))

(declare-fun result!14635 () Bool)

(assert (=> tb!7101 (= result!14635 tp_is_empty!24877)))

(assert (=> b!1045910 t!31343))

(declare-fun b_and!33785 () Bool)

(assert (= b_and!33783 (and (=> t!31343 result!14635) b_and!33785)))

(declare-fun m!965337 () Bool)

(assert (=> start!91982 m!965337))

(declare-fun m!965339 () Bool)

(assert (=> mapNonEmpty!38960 m!965339))

(declare-fun m!965341 () Bool)

(assert (=> b!1045905 m!965341))

(declare-fun m!965343 () Bool)

(assert (=> b!1045907 m!965343))

(declare-fun m!965345 () Bool)

(assert (=> b!1045911 m!965345))

(declare-fun m!965347 () Bool)

(assert (=> b!1045912 m!965347))

(declare-fun m!965349 () Bool)

(assert (=> b!1045908 m!965349))

(declare-fun m!965351 () Bool)

(assert (=> b!1045908 m!965351))

(declare-fun m!965353 () Bool)

(assert (=> b!1045910 m!965353))

(declare-fun m!965355 () Bool)

(assert (=> b!1045910 m!965355))

(declare-fun m!965357 () Bool)

(assert (=> b!1045910 m!965357))

(declare-fun m!965359 () Bool)

(assert (=> b!1045910 m!965359))

(declare-fun m!965361 () Bool)

(assert (=> b!1045910 m!965361))

(declare-fun m!965363 () Bool)

(assert (=> b!1045910 m!965363))

(declare-fun m!965365 () Bool)

(assert (=> b!1045910 m!965365))

(declare-fun m!965367 () Bool)

(assert (=> b!1045910 m!965367))

(declare-fun m!965369 () Bool)

(assert (=> b!1045910 m!965369))

(declare-fun m!965371 () Bool)

(assert (=> b!1045910 m!965371))

(declare-fun m!965373 () Bool)

(assert (=> b!1045910 m!965373))

(assert (=> b!1045910 m!965371))

(declare-fun m!965375 () Bool)

(assert (=> b!1045910 m!965375))

(declare-fun m!965377 () Bool)

(assert (=> b!1045910 m!965377))

(declare-fun m!965379 () Bool)

(assert (=> b!1045910 m!965379))

(declare-fun m!965381 () Bool)

(assert (=> b!1045910 m!965381))

(assert (=> b!1045910 m!965353))

(declare-fun m!965383 () Bool)

(assert (=> b!1045910 m!965383))

(declare-fun m!965385 () Bool)

(assert (=> b!1045910 m!965385))

(declare-fun m!965387 () Bool)

(assert (=> b!1045910 m!965387))

(check-sat (not b_next!21157) (not b!1045908) (not start!91982) tp_is_empty!24877 (not b!1045907) (not b_lambda!16319) (not b!1045912) (not mapNonEmpty!38960) (not b!1045905) (not b!1045910) (not b!1045911) b_and!33785)
(check-sat b_and!33785 (not b_next!21157))
