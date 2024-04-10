; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90084 () Bool)

(assert start!90084)

(declare-fun b!1031963 () Bool)

(declare-fun b_free!20691 () Bool)

(declare-fun b_next!20691 () Bool)

(assert (=> b!1031963 (= b_free!20691 (not b_next!20691))))

(declare-fun tp!73144 () Bool)

(declare-fun b_and!33149 () Bool)

(assert (=> b!1031963 (= tp!73144 b_and!33149)))

(declare-fun mapIsEmpty!38070 () Bool)

(declare-fun mapRes!38070 () Bool)

(assert (=> mapIsEmpty!38070 mapRes!38070))

(declare-fun b!1031960 () Bool)

(declare-fun e!582949 () Bool)

(assert (=> b!1031960 (= e!582949 (not true))))

(declare-fun lt!455839 () Bool)

(declare-datatypes ((V!37421 0))(
  ( (V!37422 (val!12256 Int)) )
))
(declare-datatypes ((ValueCell!11502 0))(
  ( (ValueCellFull!11502 (v!14833 V!37421)) (EmptyCell!11502) )
))
(declare-datatypes ((Unit!33789 0))(
  ( (Unit!33790) )
))
(declare-datatypes ((array!64886 0))(
  ( (array!64887 (arr!31245 (Array (_ BitVec 32) (_ BitVec 64))) (size!31762 (_ BitVec 32))) )
))
(declare-datatypes ((array!64888 0))(
  ( (array!64889 (arr!31246 (Array (_ BitVec 32) ValueCell!11502)) (size!31763 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5598 0))(
  ( (LongMapFixedSize!5599 (defaultEntry!6173 Int) (mask!29979 (_ BitVec 32)) (extraKeys!5905 (_ BitVec 32)) (zeroValue!6009 V!37421) (minValue!6009 V!37421) (_size!2854 (_ BitVec 32)) (_keys!11346 array!64886) (_values!6196 array!64888) (_vacant!2854 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15706 0))(
  ( (tuple2!15707 (_1!7864 Unit!33789) (_2!7864 LongMapFixedSize!5598)) )
))
(declare-fun lt!455848 () tuple2!15706)

(declare-fun valid!2119 (LongMapFixedSize!5598) Bool)

(assert (=> b!1031960 (= lt!455839 (valid!2119 (_2!7864 lt!455848)))))

(declare-fun lt!455842 () Unit!33789)

(declare-fun e!582956 () Unit!33789)

(assert (=> b!1031960 (= lt!455842 e!582956)))

(declare-fun c!104277 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15708 0))(
  ( (tuple2!15709 (_1!7865 (_ BitVec 64)) (_2!7865 V!37421)) )
))
(declare-datatypes ((List!21887 0))(
  ( (Nil!21884) (Cons!21883 (h!23085 tuple2!15708) (t!31073 List!21887)) )
))
(declare-datatypes ((ListLongMap!13745 0))(
  ( (ListLongMap!13746 (toList!6888 List!21887)) )
))
(declare-fun contains!6002 (ListLongMap!13745 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3936 (array!64886 array!64888 (_ BitVec 32) (_ BitVec 32) V!37421 V!37421 (_ BitVec 32) Int) ListLongMap!13745)

(assert (=> b!1031960 (= c!104277 (contains!6002 (getCurrentListMap!3936 (_keys!11346 (_2!7864 lt!455848)) (_values!6196 (_2!7864 lt!455848)) (mask!29979 (_2!7864 lt!455848)) (extraKeys!5905 (_2!7864 lt!455848)) (zeroValue!6009 (_2!7864 lt!455848)) (minValue!6009 (_2!7864 lt!455848)) #b00000000000000000000000000000000 (defaultEntry!6173 (_2!7864 lt!455848))) key!909))))

(declare-fun lt!455838 () array!64888)

(declare-fun lt!455847 () array!64886)

(declare-fun thiss!1427 () LongMapFixedSize!5598)

(declare-fun Unit!33791 () Unit!33789)

(declare-fun Unit!33792 () Unit!33789)

(assert (=> b!1031960 (= lt!455848 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2854 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15707 Unit!33791 (LongMapFixedSize!5599 (defaultEntry!6173 thiss!1427) (mask!29979 thiss!1427) (extraKeys!5905 thiss!1427) (zeroValue!6009 thiss!1427) (minValue!6009 thiss!1427) (bvsub (_size!2854 thiss!1427) #b00000000000000000000000000000001) lt!455847 lt!455838 (bvadd #b00000000000000000000000000000001 (_vacant!2854 thiss!1427)))) (tuple2!15707 Unit!33792 (LongMapFixedSize!5599 (defaultEntry!6173 thiss!1427) (mask!29979 thiss!1427) (extraKeys!5905 thiss!1427) (zeroValue!6009 thiss!1427) (minValue!6009 thiss!1427) (bvsub (_size!2854 thiss!1427) #b00000000000000000000000000000001) lt!455847 lt!455838 (_vacant!2854 thiss!1427)))))))

(declare-fun -!515 (ListLongMap!13745 (_ BitVec 64)) ListLongMap!13745)

(assert (=> b!1031960 (= (-!515 (getCurrentListMap!3936 (_keys!11346 thiss!1427) (_values!6196 thiss!1427) (mask!29979 thiss!1427) (extraKeys!5905 thiss!1427) (zeroValue!6009 thiss!1427) (minValue!6009 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6173 thiss!1427)) key!909) (getCurrentListMap!3936 lt!455847 lt!455838 (mask!29979 thiss!1427) (extraKeys!5905 thiss!1427) (zeroValue!6009 thiss!1427) (minValue!6009 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6173 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9719 0))(
  ( (MissingZero!9719 (index!41247 (_ BitVec 32))) (Found!9719 (index!41248 (_ BitVec 32))) (Intermediate!9719 (undefined!10531 Bool) (index!41249 (_ BitVec 32)) (x!91927 (_ BitVec 32))) (Undefined!9719) (MissingVacant!9719 (index!41250 (_ BitVec 32))) )
))
(declare-fun lt!455841 () SeekEntryResult!9719)

(declare-fun dynLambda!1985 (Int (_ BitVec 64)) V!37421)

(assert (=> b!1031960 (= lt!455838 (array!64889 (store (arr!31246 (_values!6196 thiss!1427)) (index!41248 lt!455841) (ValueCellFull!11502 (dynLambda!1985 (defaultEntry!6173 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31763 (_values!6196 thiss!1427))))))

(declare-fun lt!455849 () Unit!33789)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!41 (array!64886 array!64888 (_ BitVec 32) (_ BitVec 32) V!37421 V!37421 (_ BitVec 32) (_ BitVec 64) Int) Unit!33789)

(assert (=> b!1031960 (= lt!455849 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!41 (_keys!11346 thiss!1427) (_values!6196 thiss!1427) (mask!29979 thiss!1427) (extraKeys!5905 thiss!1427) (zeroValue!6009 thiss!1427) (minValue!6009 thiss!1427) (index!41248 lt!455841) key!909 (defaultEntry!6173 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031960 (not (arrayContainsKey!0 lt!455847 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455843 () Unit!33789)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64886 (_ BitVec 32) (_ BitVec 64)) Unit!33789)

(assert (=> b!1031960 (= lt!455843 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11346 thiss!1427) (index!41248 lt!455841) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64886 (_ BitVec 32)) Bool)

(assert (=> b!1031960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455847 (mask!29979 thiss!1427))))

(declare-fun lt!455846 () Unit!33789)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64886 (_ BitVec 32) (_ BitVec 32)) Unit!33789)

(assert (=> b!1031960 (= lt!455846 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11346 thiss!1427) (index!41248 lt!455841) (mask!29979 thiss!1427)))))

(declare-datatypes ((List!21888 0))(
  ( (Nil!21885) (Cons!21884 (h!23086 (_ BitVec 64)) (t!31074 List!21888)) )
))
(declare-fun arrayNoDuplicates!0 (array!64886 (_ BitVec 32) List!21888) Bool)

(assert (=> b!1031960 (arrayNoDuplicates!0 lt!455847 #b00000000000000000000000000000000 Nil!21885)))

(declare-fun lt!455844 () Unit!33789)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64886 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21888) Unit!33789)

(assert (=> b!1031960 (= lt!455844 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11346 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41248 lt!455841) #b00000000000000000000000000000000 Nil!21885))))

(declare-fun arrayCountValidKeys!0 (array!64886 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031960 (= (arrayCountValidKeys!0 lt!455847 #b00000000000000000000000000000000 (size!31762 (_keys!11346 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11346 thiss!1427) #b00000000000000000000000000000000 (size!31762 (_keys!11346 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031960 (= lt!455847 (array!64887 (store (arr!31245 (_keys!11346 thiss!1427)) (index!41248 lt!455841) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31762 (_keys!11346 thiss!1427))))))

(declare-fun lt!455845 () Unit!33789)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64886 (_ BitVec 32) (_ BitVec 64)) Unit!33789)

(assert (=> b!1031960 (= lt!455845 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11346 thiss!1427) (index!41248 lt!455841) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031961 () Bool)

(declare-fun e!582948 () Bool)

(assert (=> b!1031961 (= e!582948 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5905 (_2!7864 lt!455848)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5905 (_2!7864 lt!455848)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1031962 () Bool)

(declare-fun e!582957 () Bool)

(assert (=> b!1031962 (= e!582957 e!582949)))

(declare-fun res!689877 () Bool)

(assert (=> b!1031962 (=> (not res!689877) (not e!582949))))

(get-info :version)

(assert (=> b!1031962 (= res!689877 ((_ is Found!9719) lt!455841))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64886 (_ BitVec 32)) SeekEntryResult!9719)

(assert (=> b!1031962 (= lt!455841 (seekEntry!0 key!909 (_keys!11346 thiss!1427) (mask!29979 thiss!1427)))))

(declare-fun e!582951 () Bool)

(declare-fun e!582950 () Bool)

(declare-fun tp_is_empty!24411 () Bool)

(declare-fun array_inv!24187 (array!64886) Bool)

(declare-fun array_inv!24188 (array!64888) Bool)

(assert (=> b!1031963 (= e!582951 (and tp!73144 tp_is_empty!24411 (array_inv!24187 (_keys!11346 thiss!1427)) (array_inv!24188 (_values!6196 thiss!1427)) e!582950))))

(declare-fun b!1031964 () Bool)

(declare-fun Unit!33793 () Unit!33789)

(assert (=> b!1031964 (= e!582956 Unit!33793)))

(declare-fun b!1031965 () Bool)

(declare-fun e!582953 () Bool)

(assert (=> b!1031965 (= e!582950 (and e!582953 mapRes!38070))))

(declare-fun condMapEmpty!38070 () Bool)

(declare-fun mapDefault!38070 () ValueCell!11502)

(assert (=> b!1031965 (= condMapEmpty!38070 (= (arr!31246 (_values!6196 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11502)) mapDefault!38070)))))

(declare-fun b!1031966 () Bool)

(assert (=> b!1031966 (= e!582953 tp_is_empty!24411)))

(declare-fun b!1031967 () Bool)

(declare-fun Unit!33794 () Unit!33789)

(assert (=> b!1031967 (= e!582956 Unit!33794)))

(declare-fun lt!455840 () Unit!33789)

(declare-fun lemmaKeyInListMapIsInArray!350 (array!64886 array!64888 (_ BitVec 32) (_ BitVec 32) V!37421 V!37421 (_ BitVec 64) Int) Unit!33789)

(assert (=> b!1031967 (= lt!455840 (lemmaKeyInListMapIsInArray!350 (_keys!11346 (_2!7864 lt!455848)) (_values!6196 (_2!7864 lt!455848)) (mask!29979 (_2!7864 lt!455848)) (extraKeys!5905 (_2!7864 lt!455848)) (zeroValue!6009 (_2!7864 lt!455848)) (minValue!6009 (_2!7864 lt!455848)) key!909 (defaultEntry!6173 (_2!7864 lt!455848))))))

(declare-fun c!104276 () Bool)

(assert (=> b!1031967 (= c!104276 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689876 () Bool)

(assert (=> b!1031967 (= res!689876 e!582948)))

(declare-fun e!582952 () Bool)

(assert (=> b!1031967 (=> (not res!689876) (not e!582952))))

(assert (=> b!1031967 e!582952))

(declare-fun b!1031968 () Bool)

(declare-fun e!582954 () Bool)

(assert (=> b!1031968 (= e!582954 tp_is_empty!24411)))

(declare-fun res!689879 () Bool)

(assert (=> start!90084 (=> (not res!689879) (not e!582957))))

(assert (=> start!90084 (= res!689879 (valid!2119 thiss!1427))))

(assert (=> start!90084 e!582957))

(assert (=> start!90084 e!582951))

(assert (=> start!90084 true))

(declare-fun b!1031969 () Bool)

(assert (=> b!1031969 (= e!582948 (arrayContainsKey!0 (_keys!11346 (_2!7864 lt!455848)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1031970 () Bool)

(assert (=> b!1031970 (= e!582952 false)))

(declare-fun b!1031971 () Bool)

(declare-fun res!689878 () Bool)

(assert (=> b!1031971 (=> (not res!689878) (not e!582957))))

(assert (=> b!1031971 (= res!689878 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38070 () Bool)

(declare-fun tp!73143 () Bool)

(assert (=> mapNonEmpty!38070 (= mapRes!38070 (and tp!73143 e!582954))))

(declare-fun mapRest!38070 () (Array (_ BitVec 32) ValueCell!11502))

(declare-fun mapKey!38070 () (_ BitVec 32))

(declare-fun mapValue!38070 () ValueCell!11502)

(assert (=> mapNonEmpty!38070 (= (arr!31246 (_values!6196 thiss!1427)) (store mapRest!38070 mapKey!38070 mapValue!38070))))

(assert (= (and start!90084 res!689879) b!1031971))

(assert (= (and b!1031971 res!689878) b!1031962))

(assert (= (and b!1031962 res!689877) b!1031960))

(assert (= (and b!1031960 c!104277) b!1031967))

(assert (= (and b!1031960 (not c!104277)) b!1031964))

(assert (= (and b!1031967 c!104276) b!1031969))

(assert (= (and b!1031967 (not c!104276)) b!1031961))

(assert (= (and b!1031967 res!689876) b!1031970))

(assert (= (and b!1031965 condMapEmpty!38070) mapIsEmpty!38070))

(assert (= (and b!1031965 (not condMapEmpty!38070)) mapNonEmpty!38070))

(assert (= (and mapNonEmpty!38070 ((_ is ValueCellFull!11502) mapValue!38070)) b!1031968))

(assert (= (and b!1031965 ((_ is ValueCellFull!11502) mapDefault!38070)) b!1031966))

(assert (= b!1031963 b!1031965))

(assert (= start!90084 b!1031963))

(declare-fun b_lambda!16035 () Bool)

(assert (=> (not b_lambda!16035) (not b!1031960)))

(declare-fun t!31072 () Bool)

(declare-fun tb!7009 () Bool)

(assert (=> (and b!1031963 (= (defaultEntry!6173 thiss!1427) (defaultEntry!6173 thiss!1427)) t!31072) tb!7009))

(declare-fun result!14347 () Bool)

(assert (=> tb!7009 (= result!14347 tp_is_empty!24411)))

(assert (=> b!1031960 t!31072))

(declare-fun b_and!33151 () Bool)

(assert (= b_and!33149 (and (=> t!31072 result!14347) b_and!33151)))

(declare-fun m!952297 () Bool)

(assert (=> b!1031967 m!952297))

(declare-fun m!952299 () Bool)

(assert (=> b!1031962 m!952299))

(declare-fun m!952301 () Bool)

(assert (=> mapNonEmpty!38070 m!952301))

(declare-fun m!952303 () Bool)

(assert (=> b!1031963 m!952303))

(declare-fun m!952305 () Bool)

(assert (=> b!1031963 m!952305))

(declare-fun m!952307 () Bool)

(assert (=> b!1031960 m!952307))

(declare-fun m!952309 () Bool)

(assert (=> b!1031960 m!952309))

(declare-fun m!952311 () Bool)

(assert (=> b!1031960 m!952311))

(declare-fun m!952313 () Bool)

(assert (=> b!1031960 m!952313))

(declare-fun m!952315 () Bool)

(assert (=> b!1031960 m!952315))

(declare-fun m!952317 () Bool)

(assert (=> b!1031960 m!952317))

(declare-fun m!952319 () Bool)

(assert (=> b!1031960 m!952319))

(declare-fun m!952321 () Bool)

(assert (=> b!1031960 m!952321))

(declare-fun m!952323 () Bool)

(assert (=> b!1031960 m!952323))

(declare-fun m!952325 () Bool)

(assert (=> b!1031960 m!952325))

(assert (=> b!1031960 m!952311))

(declare-fun m!952327 () Bool)

(assert (=> b!1031960 m!952327))

(declare-fun m!952329 () Bool)

(assert (=> b!1031960 m!952329))

(declare-fun m!952331 () Bool)

(assert (=> b!1031960 m!952331))

(declare-fun m!952333 () Bool)

(assert (=> b!1031960 m!952333))

(declare-fun m!952335 () Bool)

(assert (=> b!1031960 m!952335))

(declare-fun m!952337 () Bool)

(assert (=> b!1031960 m!952337))

(declare-fun m!952339 () Bool)

(assert (=> b!1031960 m!952339))

(declare-fun m!952341 () Bool)

(assert (=> b!1031960 m!952341))

(declare-fun m!952343 () Bool)

(assert (=> b!1031960 m!952343))

(assert (=> b!1031960 m!952339))

(declare-fun m!952345 () Bool)

(assert (=> b!1031969 m!952345))

(declare-fun m!952347 () Bool)

(assert (=> start!90084 m!952347))

(check-sat (not b_lambda!16035) (not b!1031960) tp_is_empty!24411 (not b!1031962) (not b!1031969) (not start!90084) b_and!33151 (not b!1031967) (not b_next!20691) (not b!1031963) (not mapNonEmpty!38070))
(check-sat b_and!33151 (not b_next!20691))
