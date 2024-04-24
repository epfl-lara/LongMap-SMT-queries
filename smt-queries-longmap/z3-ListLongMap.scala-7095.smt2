; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90250 () Bool)

(assert start!90250)

(declare-fun b!1032070 () Bool)

(declare-fun b_free!20623 () Bool)

(declare-fun b_next!20623 () Bool)

(assert (=> b!1032070 (= b_free!20623 (not b_next!20623))))

(declare-fun tp!72939 () Bool)

(declare-fun b_and!33023 () Bool)

(assert (=> b!1032070 (= tp!72939 b_and!33023)))

(declare-fun b!1032062 () Bool)

(declare-fun res!689744 () Bool)

(declare-fun e!582935 () Bool)

(assert (=> b!1032062 (=> res!689744 e!582935)))

(declare-datatypes ((V!37331 0))(
  ( (V!37332 (val!12222 Int)) )
))
(declare-datatypes ((ValueCell!11468 0))(
  ( (ValueCellFull!11468 (v!14795 V!37331)) (EmptyCell!11468) )
))
(declare-datatypes ((Unit!33682 0))(
  ( (Unit!33683) )
))
(declare-datatypes ((array!64799 0))(
  ( (array!64800 (arr!31195 (Array (_ BitVec 32) (_ BitVec 64))) (size!31713 (_ BitVec 32))) )
))
(declare-datatypes ((array!64801 0))(
  ( (array!64802 (arr!31196 (Array (_ BitVec 32) ValueCell!11468)) (size!31714 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5530 0))(
  ( (LongMapFixedSize!5531 (defaultEntry!6139 Int) (mask!29983 (_ BitVec 32)) (extraKeys!5871 (_ BitVec 32)) (zeroValue!5975 V!37331) (minValue!5975 V!37331) (_size!2820 (_ BitVec 32)) (_keys!11350 array!64799) (_values!6162 array!64801) (_vacant!2820 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15606 0))(
  ( (tuple2!15607 (_1!7814 Unit!33682) (_2!7814 LongMapFixedSize!5530)) )
))
(declare-fun lt!455296 () tuple2!15606)

(assert (=> b!1032062 (= res!689744 (or (not (= (size!31714 (_values!6162 (_2!7814 lt!455296))) (bvadd #b00000000000000000000000000000001 (mask!29983 (_2!7814 lt!455296))))) (not (= (size!31713 (_keys!11350 (_2!7814 lt!455296))) (size!31714 (_values!6162 (_2!7814 lt!455296))))) (bvslt (mask!29983 (_2!7814 lt!455296)) #b00000000000000000000000000000000) (bvslt (extraKeys!5871 (_2!7814 lt!455296)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5871 (_2!7814 lt!455296)) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!37968 () Bool)

(declare-fun mapRes!37968 () Bool)

(declare-fun tp!72940 () Bool)

(declare-fun e!582931 () Bool)

(assert (=> mapNonEmpty!37968 (= mapRes!37968 (and tp!72940 e!582931))))

(declare-fun mapKey!37968 () (_ BitVec 32))

(declare-fun mapRest!37968 () (Array (_ BitVec 32) ValueCell!11468))

(declare-fun mapValue!37968 () ValueCell!11468)

(declare-fun thiss!1427 () LongMapFixedSize!5530)

(assert (=> mapNonEmpty!37968 (= (arr!31196 (_values!6162 thiss!1427)) (store mapRest!37968 mapKey!37968 mapValue!37968))))

(declare-fun res!689747 () Bool)

(declare-fun e!582929 () Bool)

(assert (=> start!90250 (=> (not res!689747) (not e!582929))))

(declare-fun valid!2100 (LongMapFixedSize!5530) Bool)

(assert (=> start!90250 (= res!689747 (valid!2100 thiss!1427))))

(assert (=> start!90250 e!582929))

(declare-fun e!582932 () Bool)

(assert (=> start!90250 e!582932))

(assert (=> start!90250 true))

(declare-fun b!1032063 () Bool)

(declare-fun e!582933 () Bool)

(declare-fun e!582936 () Bool)

(assert (=> b!1032063 (= e!582933 (and e!582936 mapRes!37968))))

(declare-fun condMapEmpty!37968 () Bool)

(declare-fun mapDefault!37968 () ValueCell!11468)

(assert (=> b!1032063 (= condMapEmpty!37968 (= (arr!31196 (_values!6162 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11468)) mapDefault!37968)))))

(declare-fun b!1032064 () Bool)

(declare-fun tp_is_empty!24343 () Bool)

(assert (=> b!1032064 (= e!582931 tp_is_empty!24343)))

(declare-fun b!1032065 () Bool)

(declare-fun e!582930 () Bool)

(assert (=> b!1032065 (= e!582930 (not e!582935))))

(declare-fun res!689745 () Bool)

(assert (=> b!1032065 (=> res!689745 e!582935)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15608 0))(
  ( (tuple2!15609 (_1!7815 (_ BitVec 64)) (_2!7815 V!37331)) )
))
(declare-datatypes ((List!21827 0))(
  ( (Nil!21824) (Cons!21823 (h!23034 tuple2!15608) (t!30937 List!21827)) )
))
(declare-datatypes ((ListLongMap!13709 0))(
  ( (ListLongMap!13710 (toList!6870 List!21827)) )
))
(declare-fun contains!6005 (ListLongMap!13709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3916 (array!64799 array!64801 (_ BitVec 32) (_ BitVec 32) V!37331 V!37331 (_ BitVec 32) Int) ListLongMap!13709)

(assert (=> b!1032065 (= res!689745 (not (contains!6005 (getCurrentListMap!3916 (_keys!11350 (_2!7814 lt!455296)) (_values!6162 (_2!7814 lt!455296)) (mask!29983 (_2!7814 lt!455296)) (extraKeys!5871 (_2!7814 lt!455296)) (zeroValue!5975 (_2!7814 lt!455296)) (minValue!5975 (_2!7814 lt!455296)) #b00000000000000000000000000000000 (defaultEntry!6139 (_2!7814 lt!455296))) key!909)))))

(declare-fun lt!455290 () array!64799)

(declare-fun lt!455288 () array!64801)

(declare-fun Unit!33684 () Unit!33682)

(declare-fun Unit!33685 () Unit!33682)

(assert (=> b!1032065 (= lt!455296 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2820 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33684 (LongMapFixedSize!5531 (defaultEntry!6139 thiss!1427) (mask!29983 thiss!1427) (extraKeys!5871 thiss!1427) (zeroValue!5975 thiss!1427) (minValue!5975 thiss!1427) (bvsub (_size!2820 thiss!1427) #b00000000000000000000000000000001) lt!455290 lt!455288 (bvadd #b00000000000000000000000000000001 (_vacant!2820 thiss!1427)))) (tuple2!15607 Unit!33685 (LongMapFixedSize!5531 (defaultEntry!6139 thiss!1427) (mask!29983 thiss!1427) (extraKeys!5871 thiss!1427) (zeroValue!5975 thiss!1427) (minValue!5975 thiss!1427) (bvsub (_size!2820 thiss!1427) #b00000000000000000000000000000001) lt!455290 lt!455288 (_vacant!2820 thiss!1427)))))))

(declare-fun -!493 (ListLongMap!13709 (_ BitVec 64)) ListLongMap!13709)

(assert (=> b!1032065 (= (-!493 (getCurrentListMap!3916 (_keys!11350 thiss!1427) (_values!6162 thiss!1427) (mask!29983 thiss!1427) (extraKeys!5871 thiss!1427) (zeroValue!5975 thiss!1427) (minValue!5975 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6139 thiss!1427)) key!909) (getCurrentListMap!3916 lt!455290 lt!455288 (mask!29983 thiss!1427) (extraKeys!5871 thiss!1427) (zeroValue!5975 thiss!1427) (minValue!5975 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6139 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9647 0))(
  ( (MissingZero!9647 (index!40959 (_ BitVec 32))) (Found!9647 (index!40960 (_ BitVec 32))) (Intermediate!9647 (undefined!10459 Bool) (index!40961 (_ BitVec 32)) (x!91721 (_ BitVec 32))) (Undefined!9647) (MissingVacant!9647 (index!40962 (_ BitVec 32))) )
))
(declare-fun lt!455295 () SeekEntryResult!9647)

(declare-fun dynLambda!1987 (Int (_ BitVec 64)) V!37331)

(assert (=> b!1032065 (= lt!455288 (array!64802 (store (arr!31196 (_values!6162 thiss!1427)) (index!40960 lt!455295) (ValueCellFull!11468 (dynLambda!1987 (defaultEntry!6139 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31714 (_values!6162 thiss!1427))))))

(declare-fun lt!455294 () Unit!33682)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!19 (array!64799 array!64801 (_ BitVec 32) (_ BitVec 32) V!37331 V!37331 (_ BitVec 32) (_ BitVec 64) Int) Unit!33682)

(assert (=> b!1032065 (= lt!455294 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!19 (_keys!11350 thiss!1427) (_values!6162 thiss!1427) (mask!29983 thiss!1427) (extraKeys!5871 thiss!1427) (zeroValue!5975 thiss!1427) (minValue!5975 thiss!1427) (index!40960 lt!455295) key!909 (defaultEntry!6139 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032065 (not (arrayContainsKey!0 lt!455290 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455289 () Unit!33682)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64799 (_ BitVec 32) (_ BitVec 64)) Unit!33682)

(assert (=> b!1032065 (= lt!455289 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11350 thiss!1427) (index!40960 lt!455295) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64799 (_ BitVec 32)) Bool)

(assert (=> b!1032065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455290 (mask!29983 thiss!1427))))

(declare-fun lt!455292 () Unit!33682)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64799 (_ BitVec 32) (_ BitVec 32)) Unit!33682)

(assert (=> b!1032065 (= lt!455292 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11350 thiss!1427) (index!40960 lt!455295) (mask!29983 thiss!1427)))))

(declare-datatypes ((List!21828 0))(
  ( (Nil!21825) (Cons!21824 (h!23035 (_ BitVec 64)) (t!30938 List!21828)) )
))
(declare-fun arrayNoDuplicates!0 (array!64799 (_ BitVec 32) List!21828) Bool)

(assert (=> b!1032065 (arrayNoDuplicates!0 lt!455290 #b00000000000000000000000000000000 Nil!21825)))

(declare-fun lt!455291 () Unit!33682)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64799 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21828) Unit!33682)

(assert (=> b!1032065 (= lt!455291 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11350 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40960 lt!455295) #b00000000000000000000000000000000 Nil!21825))))

(declare-fun arrayCountValidKeys!0 (array!64799 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032065 (= (arrayCountValidKeys!0 lt!455290 #b00000000000000000000000000000000 (size!31713 (_keys!11350 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11350 thiss!1427) #b00000000000000000000000000000000 (size!31713 (_keys!11350 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032065 (= lt!455290 (array!64800 (store (arr!31195 (_keys!11350 thiss!1427)) (index!40960 lt!455295) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31713 (_keys!11350 thiss!1427))))))

(declare-fun lt!455293 () Unit!33682)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64799 (_ BitVec 32) (_ BitVec 64)) Unit!33682)

(assert (=> b!1032065 (= lt!455293 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11350 thiss!1427) (index!40960 lt!455295) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1032066 () Bool)

(declare-fun res!689742 () Bool)

(assert (=> b!1032066 (=> res!689742 e!582935)))

(assert (=> b!1032066 (= res!689742 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11350 (_2!7814 lt!455296)) (mask!29983 (_2!7814 lt!455296)))))))

(declare-fun b!1032067 () Bool)

(assert (=> b!1032067 (= e!582929 e!582930)))

(declare-fun res!689743 () Bool)

(assert (=> b!1032067 (=> (not res!689743) (not e!582930))))

(get-info :version)

(assert (=> b!1032067 (= res!689743 ((_ is Found!9647) lt!455295))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64799 (_ BitVec 32)) SeekEntryResult!9647)

(assert (=> b!1032067 (= lt!455295 (seekEntry!0 key!909 (_keys!11350 thiss!1427) (mask!29983 thiss!1427)))))

(declare-fun b!1032068 () Bool)

(declare-fun res!689741 () Bool)

(assert (=> b!1032068 (=> res!689741 e!582935)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032068 (= res!689741 (not (validMask!0 (mask!29983 (_2!7814 lt!455296)))))))

(declare-fun mapIsEmpty!37968 () Bool)

(assert (=> mapIsEmpty!37968 mapRes!37968))

(declare-fun b!1032069 () Bool)

(assert (=> b!1032069 (= e!582936 tp_is_empty!24343)))

(declare-fun array_inv!24157 (array!64799) Bool)

(declare-fun array_inv!24158 (array!64801) Bool)

(assert (=> b!1032070 (= e!582932 (and tp!72939 tp_is_empty!24343 (array_inv!24157 (_keys!11350 thiss!1427)) (array_inv!24158 (_values!6162 thiss!1427)) e!582933))))

(declare-fun b!1032071 () Bool)

(declare-fun res!689746 () Bool)

(assert (=> b!1032071 (=> (not res!689746) (not e!582929))))

(assert (=> b!1032071 (= res!689746 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032072 () Bool)

(assert (=> b!1032072 (= e!582935 true)))

(declare-fun lt!455287 () Bool)

(assert (=> b!1032072 (= lt!455287 (arrayNoDuplicates!0 (_keys!11350 (_2!7814 lt!455296)) #b00000000000000000000000000000000 Nil!21825))))

(assert (= (and start!90250 res!689747) b!1032071))

(assert (= (and b!1032071 res!689746) b!1032067))

(assert (= (and b!1032067 res!689743) b!1032065))

(assert (= (and b!1032065 (not res!689745)) b!1032068))

(assert (= (and b!1032068 (not res!689741)) b!1032062))

(assert (= (and b!1032062 (not res!689744)) b!1032066))

(assert (= (and b!1032066 (not res!689742)) b!1032072))

(assert (= (and b!1032063 condMapEmpty!37968) mapIsEmpty!37968))

(assert (= (and b!1032063 (not condMapEmpty!37968)) mapNonEmpty!37968))

(assert (= (and mapNonEmpty!37968 ((_ is ValueCellFull!11468) mapValue!37968)) b!1032064))

(assert (= (and b!1032063 ((_ is ValueCellFull!11468) mapDefault!37968)) b!1032069))

(assert (= b!1032070 b!1032063))

(assert (= start!90250 b!1032070))

(declare-fun b_lambda!15977 () Bool)

(assert (=> (not b_lambda!15977) (not b!1032065)))

(declare-fun t!30936 () Bool)

(declare-fun tb!6933 () Bool)

(assert (=> (and b!1032070 (= (defaultEntry!6139 thiss!1427) (defaultEntry!6139 thiss!1427)) t!30936) tb!6933))

(declare-fun result!14203 () Bool)

(assert (=> tb!6933 (= result!14203 tp_is_empty!24343)))

(assert (=> b!1032065 t!30936))

(declare-fun b_and!33025 () Bool)

(assert (= b_and!33023 (and (=> t!30936 result!14203) b_and!33025)))

(declare-fun m!952193 () Bool)

(assert (=> b!1032066 m!952193))

(declare-fun m!952195 () Bool)

(assert (=> mapNonEmpty!37968 m!952195))

(declare-fun m!952197 () Bool)

(assert (=> b!1032070 m!952197))

(declare-fun m!952199 () Bool)

(assert (=> b!1032070 m!952199))

(declare-fun m!952201 () Bool)

(assert (=> b!1032065 m!952201))

(declare-fun m!952203 () Bool)

(assert (=> b!1032065 m!952203))

(declare-fun m!952205 () Bool)

(assert (=> b!1032065 m!952205))

(declare-fun m!952207 () Bool)

(assert (=> b!1032065 m!952207))

(declare-fun m!952209 () Bool)

(assert (=> b!1032065 m!952209))

(declare-fun m!952211 () Bool)

(assert (=> b!1032065 m!952211))

(declare-fun m!952213 () Bool)

(assert (=> b!1032065 m!952213))

(declare-fun m!952215 () Bool)

(assert (=> b!1032065 m!952215))

(declare-fun m!952217 () Bool)

(assert (=> b!1032065 m!952217))

(declare-fun m!952219 () Bool)

(assert (=> b!1032065 m!952219))

(declare-fun m!952221 () Bool)

(assert (=> b!1032065 m!952221))

(declare-fun m!952223 () Bool)

(assert (=> b!1032065 m!952223))

(assert (=> b!1032065 m!952221))

(declare-fun m!952225 () Bool)

(assert (=> b!1032065 m!952225))

(declare-fun m!952227 () Bool)

(assert (=> b!1032065 m!952227))

(declare-fun m!952229 () Bool)

(assert (=> b!1032065 m!952229))

(assert (=> b!1032065 m!952207))

(declare-fun m!952231 () Bool)

(assert (=> b!1032065 m!952231))

(declare-fun m!952233 () Bool)

(assert (=> b!1032065 m!952233))

(declare-fun m!952235 () Bool)

(assert (=> b!1032065 m!952235))

(declare-fun m!952237 () Bool)

(assert (=> b!1032067 m!952237))

(declare-fun m!952239 () Bool)

(assert (=> start!90250 m!952239))

(declare-fun m!952241 () Bool)

(assert (=> b!1032072 m!952241))

(declare-fun m!952243 () Bool)

(assert (=> b!1032068 m!952243))

(check-sat b_and!33025 tp_is_empty!24343 (not b!1032070) (not b!1032066) (not b!1032067) (not b!1032068) (not mapNonEmpty!37968) (not b_next!20623) (not b!1032065) (not start!90250) (not b!1032072) (not b_lambda!15977))
(check-sat b_and!33025 (not b_next!20623))
