; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34834 () Bool)

(assert start!34834)

(declare-fun b_free!7633 () Bool)

(declare-fun b_next!7633 () Bool)

(assert (=> start!34834 (= b_free!7633 (not b_next!7633))))

(declare-fun tp!26466 () Bool)

(declare-fun b_and!14869 () Bool)

(assert (=> start!34834 (= tp!26466 b_and!14869)))

(declare-fun b!348951 () Bool)

(declare-fun e!213755 () Bool)

(declare-fun e!213757 () Bool)

(declare-fun mapRes!12837 () Bool)

(assert (=> b!348951 (= e!213755 (and e!213757 mapRes!12837))))

(declare-fun condMapEmpty!12837 () Bool)

(declare-datatypes ((V!11091 0))(
  ( (V!11092 (val!3837 Int)) )
))
(declare-datatypes ((ValueCell!3449 0))(
  ( (ValueCellFull!3449 (v!6021 V!11091)) (EmptyCell!3449) )
))
(declare-datatypes ((array!18740 0))(
  ( (array!18741 (arr!8879 (Array (_ BitVec 32) ValueCell!3449)) (size!9231 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18740)

(declare-fun mapDefault!12837 () ValueCell!3449)

(assert (=> b!348951 (= condMapEmpty!12837 (= (arr!8879 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3449)) mapDefault!12837)))))

(declare-fun b!348952 () Bool)

(declare-fun e!213760 () Bool)

(declare-fun tp_is_empty!7585 () Bool)

(assert (=> b!348952 (= e!213760 tp_is_empty!7585)))

(declare-fun res!193422 () Bool)

(declare-fun e!213756 () Bool)

(assert (=> start!34834 (=> (not res!193422) (not e!213756))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34834 (= res!193422 (validMask!0 mask!2385))))

(assert (=> start!34834 e!213756))

(assert (=> start!34834 true))

(assert (=> start!34834 tp_is_empty!7585))

(assert (=> start!34834 tp!26466))

(declare-fun array_inv!6560 (array!18740) Bool)

(assert (=> start!34834 (and (array_inv!6560 _values!1525) e!213755)))

(declare-datatypes ((array!18742 0))(
  ( (array!18743 (arr!8880 (Array (_ BitVec 32) (_ BitVec 64))) (size!9232 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18742)

(declare-fun array_inv!6561 (array!18742) Bool)

(assert (=> start!34834 (array_inv!6561 _keys!1895)))

(declare-fun b!348953 () Bool)

(declare-fun res!193428 () Bool)

(assert (=> b!348953 (=> (not res!193428) (not e!213756))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11091)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11091)

(declare-datatypes ((tuple2!5460 0))(
  ( (tuple2!5461 (_1!2741 (_ BitVec 64)) (_2!2741 V!11091)) )
))
(declare-datatypes ((List!5067 0))(
  ( (Nil!5064) (Cons!5063 (h!5919 tuple2!5460) (t!10189 List!5067)) )
))
(declare-datatypes ((ListLongMap!4375 0))(
  ( (ListLongMap!4376 (toList!2203 List!5067)) )
))
(declare-fun contains!2287 (ListLongMap!4375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1731 (array!18742 array!18740 (_ BitVec 32) (_ BitVec 32) V!11091 V!11091 (_ BitVec 32) Int) ListLongMap!4375)

(assert (=> b!348953 (= res!193428 (not (contains!2287 (getCurrentListMap!1731 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348954 () Bool)

(declare-fun res!193424 () Bool)

(assert (=> b!348954 (=> (not res!193424) (not e!213756))))

(declare-datatypes ((List!5068 0))(
  ( (Nil!5065) (Cons!5064 (h!5920 (_ BitVec 64)) (t!10190 List!5068)) )
))
(declare-fun arrayNoDuplicates!0 (array!18742 (_ BitVec 32) List!5068) Bool)

(assert (=> b!348954 (= res!193424 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5065))))

(declare-fun b!348955 () Bool)

(declare-fun res!193423 () Bool)

(assert (=> b!348955 (=> (not res!193423) (not e!213756))))

(assert (=> b!348955 (= res!193423 (and (= (size!9231 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9232 _keys!1895) (size!9231 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12837 () Bool)

(assert (=> mapIsEmpty!12837 mapRes!12837))

(declare-fun b!348956 () Bool)

(declare-fun e!213758 () Bool)

(assert (=> b!348956 (= e!213756 e!213758)))

(declare-fun res!193425 () Bool)

(assert (=> b!348956 (=> (not res!193425) (not e!213758))))

(declare-datatypes ((SeekEntryResult!3377 0))(
  ( (MissingZero!3377 (index!15687 (_ BitVec 32))) (Found!3377 (index!15688 (_ BitVec 32))) (Intermediate!3377 (undefined!4189 Bool) (index!15689 (_ BitVec 32)) (x!34718 (_ BitVec 32))) (Undefined!3377) (MissingVacant!3377 (index!15690 (_ BitVec 32))) )
))
(declare-fun lt!163999 () SeekEntryResult!3377)

(get-info :version)

(assert (=> b!348956 (= res!193425 (and (not ((_ is Found!3377) lt!163999)) ((_ is MissingZero!3377) lt!163999)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18742 (_ BitVec 32)) SeekEntryResult!3377)

(assert (=> b!348956 (= lt!163999 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348957 () Bool)

(declare-fun res!193427 () Bool)

(assert (=> b!348957 (=> (not res!193427) (not e!213756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348957 (= res!193427 (validKeyInArray!0 k0!1348))))

(declare-fun b!348958 () Bool)

(assert (=> b!348958 (= e!213757 tp_is_empty!7585)))

(declare-fun b!348959 () Bool)

(declare-fun lt!163998 () (_ BitVec 32))

(assert (=> b!348959 (= e!213758 (or (bvslt lt!163998 #b00000000000000000000000000000000) (bvsge lt!163998 (size!9232 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18742 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348959 (= lt!163998 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12837 () Bool)

(declare-fun tp!26465 () Bool)

(assert (=> mapNonEmpty!12837 (= mapRes!12837 (and tp!26465 e!213760))))

(declare-fun mapRest!12837 () (Array (_ BitVec 32) ValueCell!3449))

(declare-fun mapValue!12837 () ValueCell!3449)

(declare-fun mapKey!12837 () (_ BitVec 32))

(assert (=> mapNonEmpty!12837 (= (arr!8879 _values!1525) (store mapRest!12837 mapKey!12837 mapValue!12837))))

(declare-fun b!348960 () Bool)

(declare-fun res!193429 () Bool)

(assert (=> b!348960 (=> (not res!193429) (not e!213758))))

(declare-fun arrayContainsKey!0 (array!18742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348960 (= res!193429 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348961 () Bool)

(declare-fun res!193426 () Bool)

(assert (=> b!348961 (=> (not res!193426) (not e!213756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18742 (_ BitVec 32)) Bool)

(assert (=> b!348961 (= res!193426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34834 res!193422) b!348955))

(assert (= (and b!348955 res!193423) b!348961))

(assert (= (and b!348961 res!193426) b!348954))

(assert (= (and b!348954 res!193424) b!348957))

(assert (= (and b!348957 res!193427) b!348953))

(assert (= (and b!348953 res!193428) b!348956))

(assert (= (and b!348956 res!193425) b!348960))

(assert (= (and b!348960 res!193429) b!348959))

(assert (= (and b!348951 condMapEmpty!12837) mapIsEmpty!12837))

(assert (= (and b!348951 (not condMapEmpty!12837)) mapNonEmpty!12837))

(assert (= (and mapNonEmpty!12837 ((_ is ValueCellFull!3449) mapValue!12837)) b!348952))

(assert (= (and b!348951 ((_ is ValueCellFull!3449) mapDefault!12837)) b!348958))

(assert (= start!34834 b!348951))

(declare-fun m!349845 () Bool)

(assert (=> b!348959 m!349845))

(declare-fun m!349847 () Bool)

(assert (=> start!34834 m!349847))

(declare-fun m!349849 () Bool)

(assert (=> start!34834 m!349849))

(declare-fun m!349851 () Bool)

(assert (=> start!34834 m!349851))

(declare-fun m!349853 () Bool)

(assert (=> b!348961 m!349853))

(declare-fun m!349855 () Bool)

(assert (=> b!348956 m!349855))

(declare-fun m!349857 () Bool)

(assert (=> b!348960 m!349857))

(declare-fun m!349859 () Bool)

(assert (=> b!348954 m!349859))

(declare-fun m!349861 () Bool)

(assert (=> mapNonEmpty!12837 m!349861))

(declare-fun m!349863 () Bool)

(assert (=> b!348953 m!349863))

(assert (=> b!348953 m!349863))

(declare-fun m!349865 () Bool)

(assert (=> b!348953 m!349865))

(declare-fun m!349867 () Bool)

(assert (=> b!348957 m!349867))

(check-sat (not b!348956) (not b!348960) (not b!348957) (not b!348959) (not start!34834) (not b!348961) (not b_next!7633) (not b!348954) (not mapNonEmpty!12837) (not b!348953) b_and!14869 tp_is_empty!7585)
(check-sat b_and!14869 (not b_next!7633))
(get-model)

(declare-fun b!349036 () Bool)

(declare-fun e!213804 () Bool)

(declare-fun call!26852 () Bool)

(assert (=> b!349036 (= e!213804 call!26852)))

(declare-fun bm!26849 () Bool)

(assert (=> bm!26849 (= call!26852 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71347 () Bool)

(declare-fun res!193483 () Bool)

(declare-fun e!213805 () Bool)

(assert (=> d!71347 (=> res!193483 e!213805)))

(assert (=> d!71347 (= res!193483 (bvsge #b00000000000000000000000000000000 (size!9232 _keys!1895)))))

(assert (=> d!71347 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!213805)))

(declare-fun b!349037 () Bool)

(declare-fun e!213803 () Bool)

(assert (=> b!349037 (= e!213803 call!26852)))

(declare-fun b!349038 () Bool)

(assert (=> b!349038 (= e!213805 e!213804)))

(declare-fun c!53186 () Bool)

(assert (=> b!349038 (= c!53186 (validKeyInArray!0 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349039 () Bool)

(assert (=> b!349039 (= e!213804 e!213803)))

(declare-fun lt!164020 () (_ BitVec 64))

(assert (=> b!349039 (= lt!164020 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10777 0))(
  ( (Unit!10778) )
))
(declare-fun lt!164018 () Unit!10777)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18742 (_ BitVec 64) (_ BitVec 32)) Unit!10777)

(assert (=> b!349039 (= lt!164018 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164020 #b00000000000000000000000000000000))))

(assert (=> b!349039 (arrayContainsKey!0 _keys!1895 lt!164020 #b00000000000000000000000000000000)))

(declare-fun lt!164019 () Unit!10777)

(assert (=> b!349039 (= lt!164019 lt!164018)))

(declare-fun res!193482 () Bool)

(assert (=> b!349039 (= res!193482 (= (seekEntryOrOpen!0 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3377 #b00000000000000000000000000000000)))))

(assert (=> b!349039 (=> (not res!193482) (not e!213803))))

(assert (= (and d!71347 (not res!193483)) b!349038))

(assert (= (and b!349038 c!53186) b!349039))

(assert (= (and b!349038 (not c!53186)) b!349036))

(assert (= (and b!349039 res!193482) b!349037))

(assert (= (or b!349037 b!349036) bm!26849))

(declare-fun m!349917 () Bool)

(assert (=> bm!26849 m!349917))

(declare-fun m!349919 () Bool)

(assert (=> b!349038 m!349919))

(assert (=> b!349038 m!349919))

(declare-fun m!349921 () Bool)

(assert (=> b!349038 m!349921))

(assert (=> b!349039 m!349919))

(declare-fun m!349923 () Bool)

(assert (=> b!349039 m!349923))

(declare-fun m!349925 () Bool)

(assert (=> b!349039 m!349925))

(assert (=> b!349039 m!349919))

(declare-fun m!349927 () Bool)

(assert (=> b!349039 m!349927))

(assert (=> b!348961 d!71347))

(declare-fun d!71349 () Bool)

(assert (=> d!71349 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!348957 d!71349))

(declare-fun d!71351 () Bool)

(declare-fun e!213810 () Bool)

(assert (=> d!71351 e!213810))

(declare-fun res!193486 () Bool)

(assert (=> d!71351 (=> res!193486 e!213810)))

(declare-fun lt!164031 () Bool)

(assert (=> d!71351 (= res!193486 (not lt!164031))))

(declare-fun lt!164029 () Bool)

(assert (=> d!71351 (= lt!164031 lt!164029)))

(declare-fun lt!164032 () Unit!10777)

(declare-fun e!213811 () Unit!10777)

(assert (=> d!71351 (= lt!164032 e!213811)))

(declare-fun c!53189 () Bool)

(assert (=> d!71351 (= c!53189 lt!164029)))

(declare-fun containsKey!337 (List!5067 (_ BitVec 64)) Bool)

(assert (=> d!71351 (= lt!164029 (containsKey!337 (toList!2203 (getCurrentListMap!1731 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71351 (= (contains!2287 (getCurrentListMap!1731 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164031)))

(declare-fun b!349046 () Bool)

(declare-fun lt!164030 () Unit!10777)

(assert (=> b!349046 (= e!213811 lt!164030)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!285 (List!5067 (_ BitVec 64)) Unit!10777)

(assert (=> b!349046 (= lt!164030 (lemmaContainsKeyImpliesGetValueByKeyDefined!285 (toList!2203 (getCurrentListMap!1731 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!352 0))(
  ( (Some!351 (v!6024 V!11091)) (None!350) )
))
(declare-fun isDefined!286 (Option!352) Bool)

(declare-fun getValueByKey!346 (List!5067 (_ BitVec 64)) Option!352)

(assert (=> b!349046 (isDefined!286 (getValueByKey!346 (toList!2203 (getCurrentListMap!1731 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!349047 () Bool)

(declare-fun Unit!10779 () Unit!10777)

(assert (=> b!349047 (= e!213811 Unit!10779)))

(declare-fun b!349048 () Bool)

(assert (=> b!349048 (= e!213810 (isDefined!286 (getValueByKey!346 (toList!2203 (getCurrentListMap!1731 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71351 c!53189) b!349046))

(assert (= (and d!71351 (not c!53189)) b!349047))

(assert (= (and d!71351 (not res!193486)) b!349048))

(declare-fun m!349929 () Bool)

(assert (=> d!71351 m!349929))

(declare-fun m!349931 () Bool)

(assert (=> b!349046 m!349931))

(declare-fun m!349933 () Bool)

(assert (=> b!349046 m!349933))

(assert (=> b!349046 m!349933))

(declare-fun m!349935 () Bool)

(assert (=> b!349046 m!349935))

(assert (=> b!349048 m!349933))

(assert (=> b!349048 m!349933))

(assert (=> b!349048 m!349935))

(assert (=> b!348953 d!71351))

(declare-fun b!349091 () Bool)

(declare-fun lt!164091 () ListLongMap!4375)

(declare-fun e!213848 () Bool)

(declare-fun apply!287 (ListLongMap!4375 (_ BitVec 64)) V!11091)

(declare-fun get!4767 (ValueCell!3449 V!11091) V!11091)

(declare-fun dynLambda!630 (Int (_ BitVec 64)) V!11091)

(assert (=> b!349091 (= e!213848 (= (apply!287 lt!164091 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000)) (get!4767 (select (arr!8879 _values!1525) #b00000000000000000000000000000000) (dynLambda!630 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349091 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9231 _values!1525)))))

(assert (=> b!349091 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9232 _keys!1895)))))

(declare-fun b!349092 () Bool)

(declare-fun res!193507 () Bool)

(declare-fun e!213843 () Bool)

(assert (=> b!349092 (=> (not res!193507) (not e!213843))))

(declare-fun e!213841 () Bool)

(assert (=> b!349092 (= res!193507 e!213841)))

(declare-fun c!53207 () Bool)

(assert (=> b!349092 (= c!53207 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!349093 () Bool)

(declare-fun e!213839 () Bool)

(assert (=> b!349093 (= e!213839 (= (apply!287 lt!164091 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!349094 () Bool)

(declare-fun e!213838 () Bool)

(assert (=> b!349094 (= e!213841 e!213838)))

(declare-fun res!193513 () Bool)

(declare-fun call!26868 () Bool)

(assert (=> b!349094 (= res!193513 call!26868)))

(assert (=> b!349094 (=> (not res!193513) (not e!213838))))

(declare-fun bm!26864 () Bool)

(declare-fun call!26872 () Bool)

(assert (=> bm!26864 (= call!26872 (contains!2287 lt!164091 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26865 () Bool)

(declare-fun call!26870 () ListLongMap!4375)

(declare-fun getCurrentListMapNoExtraKeys!603 (array!18742 array!18740 (_ BitVec 32) (_ BitVec 32) V!11091 V!11091 (_ BitVec 32) Int) ListLongMap!4375)

(assert (=> bm!26865 (= call!26870 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!349095 () Bool)

(declare-fun e!213844 () ListLongMap!4375)

(declare-fun call!26871 () ListLongMap!4375)

(assert (=> b!349095 (= e!213844 call!26871)))

(declare-fun b!349096 () Bool)

(declare-fun e!213846 () Unit!10777)

(declare-fun Unit!10780 () Unit!10777)

(assert (=> b!349096 (= e!213846 Unit!10780)))

(declare-fun b!349097 () Bool)

(declare-fun e!213840 () Bool)

(assert (=> b!349097 (= e!213840 (not call!26872))))

(declare-fun b!349098 () Bool)

(declare-fun e!213847 () ListLongMap!4375)

(declare-fun e!213850 () ListLongMap!4375)

(assert (=> b!349098 (= e!213847 e!213850)))

(declare-fun c!53206 () Bool)

(assert (=> b!349098 (= c!53206 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!349099 () Bool)

(assert (=> b!349099 (= e!213850 call!26871)))

(declare-fun b!349100 () Bool)

(declare-fun e!213849 () Bool)

(assert (=> b!349100 (= e!213849 e!213848)))

(declare-fun res!193512 () Bool)

(assert (=> b!349100 (=> (not res!193512) (not e!213848))))

(assert (=> b!349100 (= res!193512 (contains!2287 lt!164091 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!349100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9232 _keys!1895)))))

(declare-fun b!349101 () Bool)

(declare-fun c!53203 () Bool)

(assert (=> b!349101 (= c!53203 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!349101 (= e!213850 e!213844)))

(declare-fun d!71353 () Bool)

(assert (=> d!71353 e!213843))

(declare-fun res!193509 () Bool)

(assert (=> d!71353 (=> (not res!193509) (not e!213843))))

(assert (=> d!71353 (= res!193509 (or (bvsge #b00000000000000000000000000000000 (size!9232 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9232 _keys!1895)))))))

(declare-fun lt!164077 () ListLongMap!4375)

(assert (=> d!71353 (= lt!164091 lt!164077)))

(declare-fun lt!164096 () Unit!10777)

(assert (=> d!71353 (= lt!164096 e!213846)))

(declare-fun c!53202 () Bool)

(declare-fun e!213845 () Bool)

(assert (=> d!71353 (= c!53202 e!213845)))

(declare-fun res!193510 () Bool)

(assert (=> d!71353 (=> (not res!193510) (not e!213845))))

(assert (=> d!71353 (= res!193510 (bvslt #b00000000000000000000000000000000 (size!9232 _keys!1895)))))

(assert (=> d!71353 (= lt!164077 e!213847)))

(declare-fun c!53205 () Bool)

(assert (=> d!71353 (= c!53205 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71353 (validMask!0 mask!2385)))

(assert (=> d!71353 (= (getCurrentListMap!1731 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164091)))

(declare-fun b!349102 () Bool)

(declare-fun e!213842 () Bool)

(assert (=> b!349102 (= e!213842 (validKeyInArray!0 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349103 () Bool)

(assert (=> b!349103 (= e!213843 e!213840)))

(declare-fun c!53204 () Bool)

(assert (=> b!349103 (= c!53204 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!349104 () Bool)

(assert (=> b!349104 (= e!213841 (not call!26868))))

(declare-fun b!349105 () Bool)

(assert (=> b!349105 (= e!213840 e!213839)))

(declare-fun res!193511 () Bool)

(assert (=> b!349105 (= res!193511 call!26872)))

(assert (=> b!349105 (=> (not res!193511) (not e!213839))))

(declare-fun b!349106 () Bool)

(assert (=> b!349106 (= e!213845 (validKeyInArray!0 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26866 () Bool)

(declare-fun call!26873 () ListLongMap!4375)

(assert (=> bm!26866 (= call!26873 call!26870)))

(declare-fun bm!26867 () Bool)

(assert (=> bm!26867 (= call!26868 (contains!2287 lt!164091 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!349107 () Bool)

(declare-fun lt!164080 () Unit!10777)

(assert (=> b!349107 (= e!213846 lt!164080)))

(declare-fun lt!164081 () ListLongMap!4375)

(assert (=> b!349107 (= lt!164081 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164087 () (_ BitVec 64))

(assert (=> b!349107 (= lt!164087 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164083 () (_ BitVec 64))

(assert (=> b!349107 (= lt!164083 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164095 () Unit!10777)

(declare-fun addStillContains!263 (ListLongMap!4375 (_ BitVec 64) V!11091 (_ BitVec 64)) Unit!10777)

(assert (=> b!349107 (= lt!164095 (addStillContains!263 lt!164081 lt!164087 zeroValue!1467 lt!164083))))

(declare-fun +!738 (ListLongMap!4375 tuple2!5460) ListLongMap!4375)

(assert (=> b!349107 (contains!2287 (+!738 lt!164081 (tuple2!5461 lt!164087 zeroValue!1467)) lt!164083)))

(declare-fun lt!164094 () Unit!10777)

(assert (=> b!349107 (= lt!164094 lt!164095)))

(declare-fun lt!164098 () ListLongMap!4375)

(assert (=> b!349107 (= lt!164098 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164082 () (_ BitVec 64))

(assert (=> b!349107 (= lt!164082 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164085 () (_ BitVec 64))

(assert (=> b!349107 (= lt!164085 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164097 () Unit!10777)

(declare-fun addApplyDifferent!263 (ListLongMap!4375 (_ BitVec 64) V!11091 (_ BitVec 64)) Unit!10777)

(assert (=> b!349107 (= lt!164097 (addApplyDifferent!263 lt!164098 lt!164082 minValue!1467 lt!164085))))

(assert (=> b!349107 (= (apply!287 (+!738 lt!164098 (tuple2!5461 lt!164082 minValue!1467)) lt!164085) (apply!287 lt!164098 lt!164085))))

(declare-fun lt!164086 () Unit!10777)

(assert (=> b!349107 (= lt!164086 lt!164097)))

(declare-fun lt!164090 () ListLongMap!4375)

(assert (=> b!349107 (= lt!164090 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164078 () (_ BitVec 64))

(assert (=> b!349107 (= lt!164078 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164093 () (_ BitVec 64))

(assert (=> b!349107 (= lt!164093 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164079 () Unit!10777)

(assert (=> b!349107 (= lt!164079 (addApplyDifferent!263 lt!164090 lt!164078 zeroValue!1467 lt!164093))))

(assert (=> b!349107 (= (apply!287 (+!738 lt!164090 (tuple2!5461 lt!164078 zeroValue!1467)) lt!164093) (apply!287 lt!164090 lt!164093))))

(declare-fun lt!164089 () Unit!10777)

(assert (=> b!349107 (= lt!164089 lt!164079)))

(declare-fun lt!164092 () ListLongMap!4375)

(assert (=> b!349107 (= lt!164092 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164084 () (_ BitVec 64))

(assert (=> b!349107 (= lt!164084 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164088 () (_ BitVec 64))

(assert (=> b!349107 (= lt!164088 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!349107 (= lt!164080 (addApplyDifferent!263 lt!164092 lt!164084 minValue!1467 lt!164088))))

(assert (=> b!349107 (= (apply!287 (+!738 lt!164092 (tuple2!5461 lt!164084 minValue!1467)) lt!164088) (apply!287 lt!164092 lt!164088))))

(declare-fun b!349108 () Bool)

(declare-fun call!26869 () ListLongMap!4375)

(assert (=> b!349108 (= e!213844 call!26869)))

(declare-fun bm!26868 () Bool)

(assert (=> bm!26868 (= call!26869 call!26873)))

(declare-fun call!26867 () ListLongMap!4375)

(declare-fun bm!26869 () Bool)

(assert (=> bm!26869 (= call!26867 (+!738 (ite c!53205 call!26870 (ite c!53206 call!26873 call!26869)) (ite (or c!53205 c!53206) (tuple2!5461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!349109 () Bool)

(assert (=> b!349109 (= e!213847 (+!738 call!26867 (tuple2!5461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26870 () Bool)

(assert (=> bm!26870 (= call!26871 call!26867)))

(declare-fun b!349110 () Bool)

(assert (=> b!349110 (= e!213838 (= (apply!287 lt!164091 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!349111 () Bool)

(declare-fun res!193506 () Bool)

(assert (=> b!349111 (=> (not res!193506) (not e!213843))))

(assert (=> b!349111 (= res!193506 e!213849)))

(declare-fun res!193508 () Bool)

(assert (=> b!349111 (=> res!193508 e!213849)))

(assert (=> b!349111 (= res!193508 (not e!213842))))

(declare-fun res!193505 () Bool)

(assert (=> b!349111 (=> (not res!193505) (not e!213842))))

(assert (=> b!349111 (= res!193505 (bvslt #b00000000000000000000000000000000 (size!9232 _keys!1895)))))

(assert (= (and d!71353 c!53205) b!349109))

(assert (= (and d!71353 (not c!53205)) b!349098))

(assert (= (and b!349098 c!53206) b!349099))

(assert (= (and b!349098 (not c!53206)) b!349101))

(assert (= (and b!349101 c!53203) b!349095))

(assert (= (and b!349101 (not c!53203)) b!349108))

(assert (= (or b!349095 b!349108) bm!26868))

(assert (= (or b!349099 bm!26868) bm!26866))

(assert (= (or b!349099 b!349095) bm!26870))

(assert (= (or b!349109 bm!26866) bm!26865))

(assert (= (or b!349109 bm!26870) bm!26869))

(assert (= (and d!71353 res!193510) b!349106))

(assert (= (and d!71353 c!53202) b!349107))

(assert (= (and d!71353 (not c!53202)) b!349096))

(assert (= (and d!71353 res!193509) b!349111))

(assert (= (and b!349111 res!193505) b!349102))

(assert (= (and b!349111 (not res!193508)) b!349100))

(assert (= (and b!349100 res!193512) b!349091))

(assert (= (and b!349111 res!193506) b!349092))

(assert (= (and b!349092 c!53207) b!349094))

(assert (= (and b!349092 (not c!53207)) b!349104))

(assert (= (and b!349094 res!193513) b!349110))

(assert (= (or b!349094 b!349104) bm!26867))

(assert (= (and b!349092 res!193507) b!349103))

(assert (= (and b!349103 c!53204) b!349105))

(assert (= (and b!349103 (not c!53204)) b!349097))

(assert (= (and b!349105 res!193511) b!349093))

(assert (= (or b!349105 b!349097) bm!26864))

(declare-fun b_lambda!8509 () Bool)

(assert (=> (not b_lambda!8509) (not b!349091)))

(declare-fun t!10192 () Bool)

(declare-fun tb!3081 () Bool)

(assert (=> (and start!34834 (= defaultEntry!1528 defaultEntry!1528) t!10192) tb!3081))

(declare-fun result!5589 () Bool)

(assert (=> tb!3081 (= result!5589 tp_is_empty!7585)))

(assert (=> b!349091 t!10192))

(declare-fun b_and!14875 () Bool)

(assert (= b_and!14869 (and (=> t!10192 result!5589) b_and!14875)))

(declare-fun m!349937 () Bool)

(assert (=> b!349110 m!349937))

(declare-fun m!349939 () Bool)

(assert (=> bm!26869 m!349939))

(assert (=> b!349102 m!349919))

(assert (=> b!349102 m!349919))

(assert (=> b!349102 m!349921))

(assert (=> b!349106 m!349919))

(assert (=> b!349106 m!349919))

(assert (=> b!349106 m!349921))

(declare-fun m!349941 () Bool)

(assert (=> bm!26864 m!349941))

(declare-fun m!349943 () Bool)

(assert (=> bm!26865 m!349943))

(declare-fun m!349945 () Bool)

(assert (=> b!349093 m!349945))

(declare-fun m!349947 () Bool)

(assert (=> b!349091 m!349947))

(declare-fun m!349949 () Bool)

(assert (=> b!349091 m!349949))

(declare-fun m!349951 () Bool)

(assert (=> b!349091 m!349951))

(assert (=> b!349091 m!349949))

(assert (=> b!349091 m!349947))

(assert (=> b!349091 m!349919))

(assert (=> b!349091 m!349919))

(declare-fun m!349953 () Bool)

(assert (=> b!349091 m!349953))

(declare-fun m!349955 () Bool)

(assert (=> bm!26867 m!349955))

(declare-fun m!349957 () Bool)

(assert (=> b!349107 m!349957))

(declare-fun m!349959 () Bool)

(assert (=> b!349107 m!349959))

(declare-fun m!349961 () Bool)

(assert (=> b!349107 m!349961))

(declare-fun m!349963 () Bool)

(assert (=> b!349107 m!349963))

(declare-fun m!349965 () Bool)

(assert (=> b!349107 m!349965))

(declare-fun m!349967 () Bool)

(assert (=> b!349107 m!349967))

(assert (=> b!349107 m!349943))

(assert (=> b!349107 m!349967))

(declare-fun m!349969 () Bool)

(assert (=> b!349107 m!349969))

(declare-fun m!349971 () Bool)

(assert (=> b!349107 m!349971))

(declare-fun m!349973 () Bool)

(assert (=> b!349107 m!349973))

(declare-fun m!349975 () Bool)

(assert (=> b!349107 m!349975))

(declare-fun m!349977 () Bool)

(assert (=> b!349107 m!349977))

(assert (=> b!349107 m!349919))

(declare-fun m!349979 () Bool)

(assert (=> b!349107 m!349979))

(assert (=> b!349107 m!349957))

(declare-fun m!349981 () Bool)

(assert (=> b!349107 m!349981))

(assert (=> b!349107 m!349971))

(assert (=> b!349107 m!349963))

(declare-fun m!349983 () Bool)

(assert (=> b!349107 m!349983))

(declare-fun m!349985 () Bool)

(assert (=> b!349107 m!349985))

(assert (=> d!71353 m!349847))

(declare-fun m!349987 () Bool)

(assert (=> b!349109 m!349987))

(assert (=> b!349100 m!349919))

(assert (=> b!349100 m!349919))

(declare-fun m!349989 () Bool)

(assert (=> b!349100 m!349989))

(assert (=> b!348953 d!71353))

(declare-fun d!71355 () Bool)

(declare-fun res!193518 () Bool)

(declare-fun e!213855 () Bool)

(assert (=> d!71355 (=> res!193518 e!213855)))

(assert (=> d!71355 (= res!193518 (= (select (arr!8880 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71355 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!213855)))

(declare-fun b!349118 () Bool)

(declare-fun e!213856 () Bool)

(assert (=> b!349118 (= e!213855 e!213856)))

(declare-fun res!193519 () Bool)

(assert (=> b!349118 (=> (not res!193519) (not e!213856))))

(assert (=> b!349118 (= res!193519 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9232 _keys!1895)))))

(declare-fun b!349119 () Bool)

(assert (=> b!349119 (= e!213856 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71355 (not res!193518)) b!349118))

(assert (= (and b!349118 res!193519) b!349119))

(assert (=> d!71355 m!349919))

(declare-fun m!349991 () Bool)

(assert (=> b!349119 m!349991))

(assert (=> b!348960 d!71355))

(declare-fun d!71357 () Bool)

(assert (=> d!71357 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34834 d!71357))

(declare-fun d!71359 () Bool)

(assert (=> d!71359 (= (array_inv!6560 _values!1525) (bvsge (size!9231 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34834 d!71359))

(declare-fun d!71361 () Bool)

(assert (=> d!71361 (= (array_inv!6561 _keys!1895) (bvsge (size!9232 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34834 d!71361))

(declare-fun b!349132 () Bool)

(declare-fun c!53216 () Bool)

(declare-fun lt!164106 () (_ BitVec 64))

(assert (=> b!349132 (= c!53216 (= lt!164106 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!213865 () SeekEntryResult!3377)

(declare-fun e!213863 () SeekEntryResult!3377)

(assert (=> b!349132 (= e!213865 e!213863)))

(declare-fun b!349133 () Bool)

(declare-fun lt!164105 () SeekEntryResult!3377)

(assert (=> b!349133 (= e!213865 (Found!3377 (index!15689 lt!164105)))))

(declare-fun b!349134 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18742 (_ BitVec 32)) SeekEntryResult!3377)

(assert (=> b!349134 (= e!213863 (seekKeyOrZeroReturnVacant!0 (x!34718 lt!164105) (index!15689 lt!164105) (index!15689 lt!164105) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349135 () Bool)

(declare-fun e!213864 () SeekEntryResult!3377)

(assert (=> b!349135 (= e!213864 Undefined!3377)))

(declare-fun d!71363 () Bool)

(declare-fun lt!164107 () SeekEntryResult!3377)

(assert (=> d!71363 (and (or ((_ is Undefined!3377) lt!164107) (not ((_ is Found!3377) lt!164107)) (and (bvsge (index!15688 lt!164107) #b00000000000000000000000000000000) (bvslt (index!15688 lt!164107) (size!9232 _keys!1895)))) (or ((_ is Undefined!3377) lt!164107) ((_ is Found!3377) lt!164107) (not ((_ is MissingZero!3377) lt!164107)) (and (bvsge (index!15687 lt!164107) #b00000000000000000000000000000000) (bvslt (index!15687 lt!164107) (size!9232 _keys!1895)))) (or ((_ is Undefined!3377) lt!164107) ((_ is Found!3377) lt!164107) ((_ is MissingZero!3377) lt!164107) (not ((_ is MissingVacant!3377) lt!164107)) (and (bvsge (index!15690 lt!164107) #b00000000000000000000000000000000) (bvslt (index!15690 lt!164107) (size!9232 _keys!1895)))) (or ((_ is Undefined!3377) lt!164107) (ite ((_ is Found!3377) lt!164107) (= (select (arr!8880 _keys!1895) (index!15688 lt!164107)) k0!1348) (ite ((_ is MissingZero!3377) lt!164107) (= (select (arr!8880 _keys!1895) (index!15687 lt!164107)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3377) lt!164107) (= (select (arr!8880 _keys!1895) (index!15690 lt!164107)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71363 (= lt!164107 e!213864)))

(declare-fun c!53214 () Bool)

(assert (=> d!71363 (= c!53214 (and ((_ is Intermediate!3377) lt!164105) (undefined!4189 lt!164105)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18742 (_ BitVec 32)) SeekEntryResult!3377)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71363 (= lt!164105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71363 (validMask!0 mask!2385)))

(assert (=> d!71363 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164107)))

(declare-fun b!349136 () Bool)

(assert (=> b!349136 (= e!213864 e!213865)))

(assert (=> b!349136 (= lt!164106 (select (arr!8880 _keys!1895) (index!15689 lt!164105)))))

(declare-fun c!53215 () Bool)

(assert (=> b!349136 (= c!53215 (= lt!164106 k0!1348))))

(declare-fun b!349137 () Bool)

(assert (=> b!349137 (= e!213863 (MissingZero!3377 (index!15689 lt!164105)))))

(assert (= (and d!71363 c!53214) b!349135))

(assert (= (and d!71363 (not c!53214)) b!349136))

(assert (= (and b!349136 c!53215) b!349133))

(assert (= (and b!349136 (not c!53215)) b!349132))

(assert (= (and b!349132 c!53216) b!349137))

(assert (= (and b!349132 (not c!53216)) b!349134))

(declare-fun m!349993 () Bool)

(assert (=> b!349134 m!349993))

(declare-fun m!349995 () Bool)

(assert (=> d!71363 m!349995))

(declare-fun m!349997 () Bool)

(assert (=> d!71363 m!349997))

(declare-fun m!349999 () Bool)

(assert (=> d!71363 m!349999))

(declare-fun m!350001 () Bool)

(assert (=> d!71363 m!350001))

(assert (=> d!71363 m!349847))

(assert (=> d!71363 m!349995))

(declare-fun m!350003 () Bool)

(assert (=> d!71363 m!350003))

(declare-fun m!350005 () Bool)

(assert (=> b!349136 m!350005))

(assert (=> b!348956 d!71363))

(declare-fun b!349148 () Bool)

(declare-fun e!213874 () Bool)

(declare-fun contains!2288 (List!5068 (_ BitVec 64)) Bool)

(assert (=> b!349148 (= e!213874 (contains!2288 Nil!5065 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349149 () Bool)

(declare-fun e!213875 () Bool)

(declare-fun call!26876 () Bool)

(assert (=> b!349149 (= e!213875 call!26876)))

(declare-fun b!349150 () Bool)

(assert (=> b!349150 (= e!213875 call!26876)))

(declare-fun b!349152 () Bool)

(declare-fun e!213877 () Bool)

(declare-fun e!213876 () Bool)

(assert (=> b!349152 (= e!213877 e!213876)))

(declare-fun res!193526 () Bool)

(assert (=> b!349152 (=> (not res!193526) (not e!213876))))

(assert (=> b!349152 (= res!193526 (not e!213874))))

(declare-fun res!193528 () Bool)

(assert (=> b!349152 (=> (not res!193528) (not e!213874))))

(assert (=> b!349152 (= res!193528 (validKeyInArray!0 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26873 () Bool)

(declare-fun c!53219 () Bool)

(assert (=> bm!26873 (= call!26876 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53219 (Cons!5064 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000) Nil!5065) Nil!5065)))))

(declare-fun d!71365 () Bool)

(declare-fun res!193527 () Bool)

(assert (=> d!71365 (=> res!193527 e!213877)))

(assert (=> d!71365 (= res!193527 (bvsge #b00000000000000000000000000000000 (size!9232 _keys!1895)))))

(assert (=> d!71365 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5065) e!213877)))

(declare-fun b!349151 () Bool)

(assert (=> b!349151 (= e!213876 e!213875)))

(assert (=> b!349151 (= c!53219 (validKeyInArray!0 (select (arr!8880 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71365 (not res!193527)) b!349152))

(assert (= (and b!349152 res!193528) b!349148))

(assert (= (and b!349152 res!193526) b!349151))

(assert (= (and b!349151 c!53219) b!349150))

(assert (= (and b!349151 (not c!53219)) b!349149))

(assert (= (or b!349150 b!349149) bm!26873))

(assert (=> b!349148 m!349919))

(assert (=> b!349148 m!349919))

(declare-fun m!350007 () Bool)

(assert (=> b!349148 m!350007))

(assert (=> b!349152 m!349919))

(assert (=> b!349152 m!349919))

(assert (=> b!349152 m!349921))

(assert (=> bm!26873 m!349919))

(declare-fun m!350009 () Bool)

(assert (=> bm!26873 m!350009))

(assert (=> b!349151 m!349919))

(assert (=> b!349151 m!349919))

(assert (=> b!349151 m!349921))

(assert (=> b!348954 d!71365))

(declare-fun d!71367 () Bool)

(declare-fun lt!164110 () (_ BitVec 32))

(assert (=> d!71367 (and (or (bvslt lt!164110 #b00000000000000000000000000000000) (bvsge lt!164110 (size!9232 _keys!1895)) (and (bvsge lt!164110 #b00000000000000000000000000000000) (bvslt lt!164110 (size!9232 _keys!1895)))) (bvsge lt!164110 #b00000000000000000000000000000000) (bvslt lt!164110 (size!9232 _keys!1895)) (= (select (arr!8880 _keys!1895) lt!164110) k0!1348))))

(declare-fun e!213880 () (_ BitVec 32))

(assert (=> d!71367 (= lt!164110 e!213880)))

(declare-fun c!53222 () Bool)

(assert (=> d!71367 (= c!53222 (= (select (arr!8880 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71367 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9232 _keys!1895)) (bvslt (size!9232 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71367 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164110)))

(declare-fun b!349157 () Bool)

(assert (=> b!349157 (= e!213880 #b00000000000000000000000000000000)))

(declare-fun b!349158 () Bool)

(assert (=> b!349158 (= e!213880 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71367 c!53222) b!349157))

(assert (= (and d!71367 (not c!53222)) b!349158))

(declare-fun m!350011 () Bool)

(assert (=> d!71367 m!350011))

(assert (=> d!71367 m!349919))

(declare-fun m!350013 () Bool)

(assert (=> b!349158 m!350013))

(assert (=> b!348959 d!71367))

(declare-fun b!349166 () Bool)

(declare-fun e!213885 () Bool)

(assert (=> b!349166 (= e!213885 tp_is_empty!7585)))

(declare-fun mapNonEmpty!12846 () Bool)

(declare-fun mapRes!12846 () Bool)

(declare-fun tp!26481 () Bool)

(declare-fun e!213886 () Bool)

(assert (=> mapNonEmpty!12846 (= mapRes!12846 (and tp!26481 e!213886))))

(declare-fun mapRest!12846 () (Array (_ BitVec 32) ValueCell!3449))

(declare-fun mapValue!12846 () ValueCell!3449)

(declare-fun mapKey!12846 () (_ BitVec 32))

(assert (=> mapNonEmpty!12846 (= mapRest!12837 (store mapRest!12846 mapKey!12846 mapValue!12846))))

(declare-fun b!349165 () Bool)

(assert (=> b!349165 (= e!213886 tp_is_empty!7585)))

(declare-fun condMapEmpty!12846 () Bool)

(declare-fun mapDefault!12846 () ValueCell!3449)

(assert (=> mapNonEmpty!12837 (= condMapEmpty!12846 (= mapRest!12837 ((as const (Array (_ BitVec 32) ValueCell!3449)) mapDefault!12846)))))

(assert (=> mapNonEmpty!12837 (= tp!26465 (and e!213885 mapRes!12846))))

(declare-fun mapIsEmpty!12846 () Bool)

(assert (=> mapIsEmpty!12846 mapRes!12846))

(assert (= (and mapNonEmpty!12837 condMapEmpty!12846) mapIsEmpty!12846))

(assert (= (and mapNonEmpty!12837 (not condMapEmpty!12846)) mapNonEmpty!12846))

(assert (= (and mapNonEmpty!12846 ((_ is ValueCellFull!3449) mapValue!12846)) b!349165))

(assert (= (and mapNonEmpty!12837 ((_ is ValueCellFull!3449) mapDefault!12846)) b!349166))

(declare-fun m!350015 () Bool)

(assert (=> mapNonEmpty!12846 m!350015))

(declare-fun b_lambda!8511 () Bool)

(assert (= b_lambda!8509 (or (and start!34834 b_free!7633) b_lambda!8511)))

(check-sat (not b!349119) (not b!349109) (not d!71363) (not bm!26865) (not d!71353) (not b!349046) (not b!349152) b_and!14875 (not b!349038) (not bm!26869) (not b!349048) (not b!349100) (not b!349134) (not b!349102) (not b_lambda!8511) (not b!349110) (not b!349107) (not bm!26864) (not b!349039) (not b!349158) (not bm!26873) (not bm!26849) (not b!349148) (not d!71351) (not b_next!7633) (not b!349093) (not b!349091) (not b!349151) (not b!349106) (not bm!26867) tp_is_empty!7585 (not mapNonEmpty!12846))
(check-sat b_and!14875 (not b_next!7633))
