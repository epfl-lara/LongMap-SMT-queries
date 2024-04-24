; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90256 () Bool)

(assert start!90256)

(declare-fun b!1032168 () Bool)

(declare-fun b_free!20629 () Bool)

(declare-fun b_next!20629 () Bool)

(assert (=> b!1032168 (= b_free!20629 (not b_next!20629))))

(declare-fun tp!72957 () Bool)

(declare-fun b_and!33035 () Bool)

(assert (=> b!1032168 (= tp!72957 b_and!33035)))

(declare-fun b!1032167 () Bool)

(declare-fun e!583004 () Bool)

(declare-fun e!583003 () Bool)

(assert (=> b!1032167 (= e!583004 e!583003)))

(declare-fun res!689805 () Bool)

(assert (=> b!1032167 (=> (not res!689805) (not e!583003))))

(declare-datatypes ((SeekEntryResult!9650 0))(
  ( (MissingZero!9650 (index!40971 (_ BitVec 32))) (Found!9650 (index!40972 (_ BitVec 32))) (Intermediate!9650 (undefined!10462 Bool) (index!40973 (_ BitVec 32)) (x!91738 (_ BitVec 32))) (Undefined!9650) (MissingVacant!9650 (index!40974 (_ BitVec 32))) )
))
(declare-fun lt!455378 () SeekEntryResult!9650)

(get-info :version)

(assert (=> b!1032167 (= res!689805 ((_ is Found!9650) lt!455378))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37339 0))(
  ( (V!37340 (val!12225 Int)) )
))
(declare-datatypes ((ValueCell!11471 0))(
  ( (ValueCellFull!11471 (v!14798 V!37339)) (EmptyCell!11471) )
))
(declare-datatypes ((array!64811 0))(
  ( (array!64812 (arr!31201 (Array (_ BitVec 32) (_ BitVec 64))) (size!31719 (_ BitVec 32))) )
))
(declare-datatypes ((array!64813 0))(
  ( (array!64814 (arr!31202 (Array (_ BitVec 32) ValueCell!11471)) (size!31720 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5536 0))(
  ( (LongMapFixedSize!5537 (defaultEntry!6142 Int) (mask!29988 (_ BitVec 32)) (extraKeys!5874 (_ BitVec 32)) (zeroValue!5978 V!37339) (minValue!5978 V!37339) (_size!2823 (_ BitVec 32)) (_keys!11353 array!64811) (_values!6165 array!64813) (_vacant!2823 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5536)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64811 (_ BitVec 32)) SeekEntryResult!9650)

(assert (=> b!1032167 (= lt!455378 (seekEntry!0 key!909 (_keys!11353 thiss!1427) (mask!29988 thiss!1427)))))

(declare-fun res!689808 () Bool)

(assert (=> start!90256 (=> (not res!689808) (not e!583004))))

(declare-fun valid!2103 (LongMapFixedSize!5536) Bool)

(assert (=> start!90256 (= res!689808 (valid!2103 thiss!1427))))

(assert (=> start!90256 e!583004))

(declare-fun e!583001 () Bool)

(assert (=> start!90256 e!583001))

(assert (=> start!90256 true))

(declare-fun tp_is_empty!24349 () Bool)

(declare-fun e!583007 () Bool)

(declare-fun array_inv!24163 (array!64811) Bool)

(declare-fun array_inv!24164 (array!64813) Bool)

(assert (=> b!1032168 (= e!583001 (and tp!72957 tp_is_empty!24349 (array_inv!24163 (_keys!11353 thiss!1427)) (array_inv!24164 (_values!6165 thiss!1427)) e!583007))))

(declare-fun b!1032169 () Bool)

(declare-fun res!689804 () Bool)

(declare-fun e!583008 () Bool)

(assert (=> b!1032169 (=> res!689804 e!583008)))

(declare-datatypes ((Unit!33694 0))(
  ( (Unit!33695) )
))
(declare-datatypes ((tuple2!15618 0))(
  ( (tuple2!15619 (_1!7820 Unit!33694) (_2!7820 LongMapFixedSize!5536)) )
))
(declare-fun lt!455377 () tuple2!15618)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64811 (_ BitVec 32)) Bool)

(assert (=> b!1032169 (= res!689804 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11353 (_2!7820 lt!455377)) (mask!29988 (_2!7820 lt!455377)))))))

(declare-fun b!1032170 () Bool)

(declare-fun res!689806 () Bool)

(assert (=> b!1032170 (=> res!689806 e!583008)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032170 (= res!689806 (not (validMask!0 (mask!29988 (_2!7820 lt!455377)))))))

(declare-fun b!1032171 () Bool)

(assert (=> b!1032171 (= e!583003 (not e!583008))))

(declare-fun res!689809 () Bool)

(assert (=> b!1032171 (=> res!689809 e!583008)))

(declare-datatypes ((tuple2!15620 0))(
  ( (tuple2!15621 (_1!7821 (_ BitVec 64)) (_2!7821 V!37339)) )
))
(declare-datatypes ((List!21833 0))(
  ( (Nil!21830) (Cons!21829 (h!23040 tuple2!15620) (t!30949 List!21833)) )
))
(declare-datatypes ((ListLongMap!13715 0))(
  ( (ListLongMap!13716 (toList!6873 List!21833)) )
))
(declare-fun contains!6008 (ListLongMap!13715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3919 (array!64811 array!64813 (_ BitVec 32) (_ BitVec 32) V!37339 V!37339 (_ BitVec 32) Int) ListLongMap!13715)

(assert (=> b!1032171 (= res!689809 (not (contains!6008 (getCurrentListMap!3919 (_keys!11353 (_2!7820 lt!455377)) (_values!6165 (_2!7820 lt!455377)) (mask!29988 (_2!7820 lt!455377)) (extraKeys!5874 (_2!7820 lt!455377)) (zeroValue!5978 (_2!7820 lt!455377)) (minValue!5978 (_2!7820 lt!455377)) #b00000000000000000000000000000000 (defaultEntry!6142 (_2!7820 lt!455377))) key!909)))))

(declare-fun lt!455379 () array!64813)

(declare-fun lt!455381 () array!64811)

(declare-fun Unit!33696 () Unit!33694)

(declare-fun Unit!33697 () Unit!33694)

(assert (=> b!1032171 (= lt!455377 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2823 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15619 Unit!33696 (LongMapFixedSize!5537 (defaultEntry!6142 thiss!1427) (mask!29988 thiss!1427) (extraKeys!5874 thiss!1427) (zeroValue!5978 thiss!1427) (minValue!5978 thiss!1427) (bvsub (_size!2823 thiss!1427) #b00000000000000000000000000000001) lt!455381 lt!455379 (bvadd #b00000000000000000000000000000001 (_vacant!2823 thiss!1427)))) (tuple2!15619 Unit!33697 (LongMapFixedSize!5537 (defaultEntry!6142 thiss!1427) (mask!29988 thiss!1427) (extraKeys!5874 thiss!1427) (zeroValue!5978 thiss!1427) (minValue!5978 thiss!1427) (bvsub (_size!2823 thiss!1427) #b00000000000000000000000000000001) lt!455381 lt!455379 (_vacant!2823 thiss!1427)))))))

(declare-fun -!496 (ListLongMap!13715 (_ BitVec 64)) ListLongMap!13715)

(assert (=> b!1032171 (= (-!496 (getCurrentListMap!3919 (_keys!11353 thiss!1427) (_values!6165 thiss!1427) (mask!29988 thiss!1427) (extraKeys!5874 thiss!1427) (zeroValue!5978 thiss!1427) (minValue!5978 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6142 thiss!1427)) key!909) (getCurrentListMap!3919 lt!455381 lt!455379 (mask!29988 thiss!1427) (extraKeys!5874 thiss!1427) (zeroValue!5978 thiss!1427) (minValue!5978 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6142 thiss!1427)))))

(declare-fun dynLambda!1990 (Int (_ BitVec 64)) V!37339)

(assert (=> b!1032171 (= lt!455379 (array!64814 (store (arr!31202 (_values!6165 thiss!1427)) (index!40972 lt!455378) (ValueCellFull!11471 (dynLambda!1990 (defaultEntry!6142 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31720 (_values!6165 thiss!1427))))))

(declare-fun lt!455384 () Unit!33694)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!22 (array!64811 array!64813 (_ BitVec 32) (_ BitVec 32) V!37339 V!37339 (_ BitVec 32) (_ BitVec 64) Int) Unit!33694)

(assert (=> b!1032171 (= lt!455384 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!22 (_keys!11353 thiss!1427) (_values!6165 thiss!1427) (mask!29988 thiss!1427) (extraKeys!5874 thiss!1427) (zeroValue!5978 thiss!1427) (minValue!5978 thiss!1427) (index!40972 lt!455378) key!909 (defaultEntry!6142 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032171 (not (arrayContainsKey!0 lt!455381 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455386 () Unit!33694)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64811 (_ BitVec 32) (_ BitVec 64)) Unit!33694)

(assert (=> b!1032171 (= lt!455386 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11353 thiss!1427) (index!40972 lt!455378) key!909))))

(assert (=> b!1032171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455381 (mask!29988 thiss!1427))))

(declare-fun lt!455380 () Unit!33694)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64811 (_ BitVec 32) (_ BitVec 32)) Unit!33694)

(assert (=> b!1032171 (= lt!455380 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11353 thiss!1427) (index!40972 lt!455378) (mask!29988 thiss!1427)))))

(declare-datatypes ((List!21834 0))(
  ( (Nil!21831) (Cons!21830 (h!23041 (_ BitVec 64)) (t!30950 List!21834)) )
))
(declare-fun arrayNoDuplicates!0 (array!64811 (_ BitVec 32) List!21834) Bool)

(assert (=> b!1032171 (arrayNoDuplicates!0 lt!455381 #b00000000000000000000000000000000 Nil!21831)))

(declare-fun lt!455382 () Unit!33694)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64811 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21834) Unit!33694)

(assert (=> b!1032171 (= lt!455382 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11353 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40972 lt!455378) #b00000000000000000000000000000000 Nil!21831))))

(declare-fun arrayCountValidKeys!0 (array!64811 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032171 (= (arrayCountValidKeys!0 lt!455381 #b00000000000000000000000000000000 (size!31719 (_keys!11353 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11353 thiss!1427) #b00000000000000000000000000000000 (size!31719 (_keys!11353 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032171 (= lt!455381 (array!64812 (store (arr!31201 (_keys!11353 thiss!1427)) (index!40972 lt!455378) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31719 (_keys!11353 thiss!1427))))))

(declare-fun lt!455383 () Unit!33694)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64811 (_ BitVec 32) (_ BitVec 64)) Unit!33694)

(assert (=> b!1032171 (= lt!455383 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11353 thiss!1427) (index!40972 lt!455378) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37977 () Bool)

(declare-fun mapRes!37977 () Bool)

(declare-fun tp!72958 () Bool)

(declare-fun e!583005 () Bool)

(assert (=> mapNonEmpty!37977 (= mapRes!37977 (and tp!72958 e!583005))))

(declare-fun mapRest!37977 () (Array (_ BitVec 32) ValueCell!11471))

(declare-fun mapValue!37977 () ValueCell!11471)

(declare-fun mapKey!37977 () (_ BitVec 32))

(assert (=> mapNonEmpty!37977 (= (arr!31202 (_values!6165 thiss!1427)) (store mapRest!37977 mapKey!37977 mapValue!37977))))

(declare-fun b!1032172 () Bool)

(declare-fun e!583002 () Bool)

(assert (=> b!1032172 (= e!583007 (and e!583002 mapRes!37977))))

(declare-fun condMapEmpty!37977 () Bool)

(declare-fun mapDefault!37977 () ValueCell!11471)

(assert (=> b!1032172 (= condMapEmpty!37977 (= (arr!31202 (_values!6165 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11471)) mapDefault!37977)))))

(declare-fun b!1032173 () Bool)

(declare-fun res!689807 () Bool)

(assert (=> b!1032173 (=> res!689807 e!583008)))

(assert (=> b!1032173 (= res!689807 (or (not (= (size!31720 (_values!6165 (_2!7820 lt!455377))) (bvadd #b00000000000000000000000000000001 (mask!29988 (_2!7820 lt!455377))))) (not (= (size!31719 (_keys!11353 (_2!7820 lt!455377))) (size!31720 (_values!6165 (_2!7820 lt!455377))))) (bvslt (mask!29988 (_2!7820 lt!455377)) #b00000000000000000000000000000000) (bvslt (extraKeys!5874 (_2!7820 lt!455377)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5874 (_2!7820 lt!455377)) #b00000000000000000000000000000011)))))

(declare-fun b!1032174 () Bool)

(assert (=> b!1032174 (= e!583008 true)))

(declare-fun lt!455385 () Bool)

(assert (=> b!1032174 (= lt!455385 (arrayNoDuplicates!0 (_keys!11353 (_2!7820 lt!455377)) #b00000000000000000000000000000000 Nil!21831))))

(declare-fun mapIsEmpty!37977 () Bool)

(assert (=> mapIsEmpty!37977 mapRes!37977))

(declare-fun b!1032175 () Bool)

(declare-fun res!689810 () Bool)

(assert (=> b!1032175 (=> (not res!689810) (not e!583004))))

(assert (=> b!1032175 (= res!689810 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032176 () Bool)

(assert (=> b!1032176 (= e!583002 tp_is_empty!24349)))

(declare-fun b!1032177 () Bool)

(assert (=> b!1032177 (= e!583005 tp_is_empty!24349)))

(assert (= (and start!90256 res!689808) b!1032175))

(assert (= (and b!1032175 res!689810) b!1032167))

(assert (= (and b!1032167 res!689805) b!1032171))

(assert (= (and b!1032171 (not res!689809)) b!1032170))

(assert (= (and b!1032170 (not res!689806)) b!1032173))

(assert (= (and b!1032173 (not res!689807)) b!1032169))

(assert (= (and b!1032169 (not res!689804)) b!1032174))

(assert (= (and b!1032172 condMapEmpty!37977) mapIsEmpty!37977))

(assert (= (and b!1032172 (not condMapEmpty!37977)) mapNonEmpty!37977))

(assert (= (and mapNonEmpty!37977 ((_ is ValueCellFull!11471) mapValue!37977)) b!1032177))

(assert (= (and b!1032172 ((_ is ValueCellFull!11471) mapDefault!37977)) b!1032176))

(assert (= b!1032168 b!1032172))

(assert (= start!90256 b!1032168))

(declare-fun b_lambda!15983 () Bool)

(assert (=> (not b_lambda!15983) (not b!1032171)))

(declare-fun t!30948 () Bool)

(declare-fun tb!6939 () Bool)

(assert (=> (and b!1032168 (= (defaultEntry!6142 thiss!1427) (defaultEntry!6142 thiss!1427)) t!30948) tb!6939))

(declare-fun result!14215 () Bool)

(assert (=> tb!6939 (= result!14215 tp_is_empty!24349)))

(assert (=> b!1032171 t!30948))

(declare-fun b_and!33037 () Bool)

(assert (= b_and!33035 (and (=> t!30948 result!14215) b_and!33037)))

(declare-fun m!952349 () Bool)

(assert (=> b!1032167 m!952349))

(declare-fun m!952351 () Bool)

(assert (=> start!90256 m!952351))

(declare-fun m!952353 () Bool)

(assert (=> b!1032174 m!952353))

(declare-fun m!952355 () Bool)

(assert (=> b!1032170 m!952355))

(declare-fun m!952357 () Bool)

(assert (=> b!1032169 m!952357))

(declare-fun m!952359 () Bool)

(assert (=> mapNonEmpty!37977 m!952359))

(declare-fun m!952361 () Bool)

(assert (=> b!1032171 m!952361))

(declare-fun m!952363 () Bool)

(assert (=> b!1032171 m!952363))

(declare-fun m!952365 () Bool)

(assert (=> b!1032171 m!952365))

(declare-fun m!952367 () Bool)

(assert (=> b!1032171 m!952367))

(declare-fun m!952369 () Bool)

(assert (=> b!1032171 m!952369))

(declare-fun m!952371 () Bool)

(assert (=> b!1032171 m!952371))

(declare-fun m!952373 () Bool)

(assert (=> b!1032171 m!952373))

(declare-fun m!952375 () Bool)

(assert (=> b!1032171 m!952375))

(declare-fun m!952377 () Bool)

(assert (=> b!1032171 m!952377))

(declare-fun m!952379 () Bool)

(assert (=> b!1032171 m!952379))

(declare-fun m!952381 () Bool)

(assert (=> b!1032171 m!952381))

(declare-fun m!952383 () Bool)

(assert (=> b!1032171 m!952383))

(declare-fun m!952385 () Bool)

(assert (=> b!1032171 m!952385))

(declare-fun m!952387 () Bool)

(assert (=> b!1032171 m!952387))

(declare-fun m!952389 () Bool)

(assert (=> b!1032171 m!952389))

(declare-fun m!952391 () Bool)

(assert (=> b!1032171 m!952391))

(assert (=> b!1032171 m!952361))

(assert (=> b!1032171 m!952389))

(declare-fun m!952393 () Bool)

(assert (=> b!1032171 m!952393))

(declare-fun m!952395 () Bool)

(assert (=> b!1032171 m!952395))

(declare-fun m!952397 () Bool)

(assert (=> b!1032168 m!952397))

(declare-fun m!952399 () Bool)

(assert (=> b!1032168 m!952399))

(check-sat (not b!1032168) (not b!1032174) (not mapNonEmpty!37977) tp_is_empty!24349 (not b_lambda!15983) (not b!1032171) (not b_next!20629) (not b!1032167) b_and!33037 (not b!1032169) (not start!90256) (not b!1032170))
(check-sat b_and!33037 (not b_next!20629))
