; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33758 () Bool)

(assert start!33758)

(declare-fun b_free!6993 () Bool)

(declare-fun b_next!6993 () Bool)

(assert (=> start!33758 (= b_free!6993 (not b_next!6993))))

(declare-fun tp!24482 () Bool)

(declare-fun b_and!14173 () Bool)

(assert (=> start!33758 (= tp!24482 b_and!14173)))

(declare-fun b!335861 () Bool)

(declare-fun res!185403 () Bool)

(declare-fun e!206164 () Bool)

(assert (=> b!335861 (=> (not res!185403) (not e!206164))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10237 0))(
  ( (V!10238 (val!3517 Int)) )
))
(declare-datatypes ((ValueCell!3129 0))(
  ( (ValueCellFull!3129 (v!5679 V!10237)) (EmptyCell!3129) )
))
(declare-datatypes ((array!17483 0))(
  ( (array!17484 (arr!8272 (Array (_ BitVec 32) ValueCell!3129)) (size!8624 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17483)

(declare-datatypes ((array!17485 0))(
  ( (array!17486 (arr!8273 (Array (_ BitVec 32) (_ BitVec 64))) (size!8625 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17485)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335861 (= res!185403 (and (= (size!8624 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8625 _keys!1895) (size!8624 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11814 () Bool)

(declare-fun mapRes!11814 () Bool)

(declare-fun tp!24483 () Bool)

(declare-fun e!206165 () Bool)

(assert (=> mapNonEmpty!11814 (= mapRes!11814 (and tp!24483 e!206165))))

(declare-fun mapRest!11814 () (Array (_ BitVec 32) ValueCell!3129))

(declare-fun mapValue!11814 () ValueCell!3129)

(declare-fun mapKey!11814 () (_ BitVec 32))

(assert (=> mapNonEmpty!11814 (= (arr!8272 _values!1525) (store mapRest!11814 mapKey!11814 mapValue!11814))))

(declare-fun b!335862 () Bool)

(declare-fun res!185401 () Bool)

(assert (=> b!335862 (=> (not res!185401) (not e!206164))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335862 (= res!185401 (validKeyInArray!0 k0!1348))))

(declare-fun res!185405 () Bool)

(assert (=> start!33758 (=> (not res!185405) (not e!206164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33758 (= res!185405 (validMask!0 mask!2385))))

(assert (=> start!33758 e!206164))

(assert (=> start!33758 true))

(declare-fun tp_is_empty!6945 () Bool)

(assert (=> start!33758 tp_is_empty!6945))

(assert (=> start!33758 tp!24482))

(declare-fun e!206163 () Bool)

(declare-fun array_inv!6142 (array!17483) Bool)

(assert (=> start!33758 (and (array_inv!6142 _values!1525) e!206163)))

(declare-fun array_inv!6143 (array!17485) Bool)

(assert (=> start!33758 (array_inv!6143 _keys!1895)))

(declare-fun b!335863 () Bool)

(declare-fun e!206166 () Bool)

(assert (=> b!335863 (= e!206166 tp_is_empty!6945)))

(declare-fun b!335864 () Bool)

(declare-fun res!185400 () Bool)

(assert (=> b!335864 (=> (not res!185400) (not e!206164))))

(declare-datatypes ((List!4727 0))(
  ( (Nil!4724) (Cons!4723 (h!5579 (_ BitVec 64)) (t!9815 List!4727)) )
))
(declare-fun arrayNoDuplicates!0 (array!17485 (_ BitVec 32) List!4727) Bool)

(assert (=> b!335864 (= res!185400 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4724))))

(declare-fun mapIsEmpty!11814 () Bool)

(assert (=> mapIsEmpty!11814 mapRes!11814))

(declare-fun b!335865 () Bool)

(declare-fun res!185404 () Bool)

(assert (=> b!335865 (=> (not res!185404) (not e!206164))))

(declare-fun zeroValue!1467 () V!10237)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10237)

(declare-datatypes ((tuple2!5110 0))(
  ( (tuple2!5111 (_1!2566 (_ BitVec 64)) (_2!2566 V!10237)) )
))
(declare-datatypes ((List!4728 0))(
  ( (Nil!4725) (Cons!4724 (h!5580 tuple2!5110) (t!9816 List!4728)) )
))
(declare-datatypes ((ListLongMap!4023 0))(
  ( (ListLongMap!4024 (toList!2027 List!4728)) )
))
(declare-fun contains!2071 (ListLongMap!4023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1548 (array!17485 array!17483 (_ BitVec 32) (_ BitVec 32) V!10237 V!10237 (_ BitVec 32) Int) ListLongMap!4023)

(assert (=> b!335865 (= res!185404 (not (contains!2071 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!335866 () Bool)

(declare-fun res!185402 () Bool)

(assert (=> b!335866 (=> (not res!185402) (not e!206164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17485 (_ BitVec 32)) Bool)

(assert (=> b!335866 (= res!185402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335867 () Bool)

(assert (=> b!335867 (= e!206165 tp_is_empty!6945)))

(declare-fun b!335868 () Bool)

(assert (=> b!335868 (= e!206163 (and e!206166 mapRes!11814))))

(declare-fun condMapEmpty!11814 () Bool)

(declare-fun mapDefault!11814 () ValueCell!3129)

(assert (=> b!335868 (= condMapEmpty!11814 (= (arr!8272 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3129)) mapDefault!11814)))))

(declare-fun b!335869 () Bool)

(declare-datatypes ((SeekEntryResult!3198 0))(
  ( (MissingZero!3198 (index!14971 (_ BitVec 32))) (Found!3198 (index!14972 (_ BitVec 32))) (Intermediate!3198 (undefined!4010 Bool) (index!14973 (_ BitVec 32)) (x!33476 (_ BitVec 32))) (Undefined!3198) (MissingVacant!3198 (index!14974 (_ BitVec 32))) )
))
(declare-fun lt!159952 () SeekEntryResult!3198)

(get-info :version)

(assert (=> b!335869 (= e!206164 (and (not ((_ is Found!3198) lt!159952)) ((_ is MissingZero!3198) lt!159952) (bvsge #b00000000000000000000000000000000 (size!8625 _keys!1895))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17485 (_ BitVec 32)) SeekEntryResult!3198)

(assert (=> b!335869 (= lt!159952 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!33758 res!185405) b!335861))

(assert (= (and b!335861 res!185403) b!335866))

(assert (= (and b!335866 res!185402) b!335864))

(assert (= (and b!335864 res!185400) b!335862))

(assert (= (and b!335862 res!185401) b!335865))

(assert (= (and b!335865 res!185404) b!335869))

(assert (= (and b!335868 condMapEmpty!11814) mapIsEmpty!11814))

(assert (= (and b!335868 (not condMapEmpty!11814)) mapNonEmpty!11814))

(assert (= (and mapNonEmpty!11814 ((_ is ValueCellFull!3129) mapValue!11814)) b!335867))

(assert (= (and b!335868 ((_ is ValueCellFull!3129) mapDefault!11814)) b!335863))

(assert (= start!33758 b!335868))

(declare-fun m!339821 () Bool)

(assert (=> b!335866 m!339821))

(declare-fun m!339823 () Bool)

(assert (=> b!335869 m!339823))

(declare-fun m!339825 () Bool)

(assert (=> b!335862 m!339825))

(declare-fun m!339827 () Bool)

(assert (=> b!335864 m!339827))

(declare-fun m!339829 () Bool)

(assert (=> start!33758 m!339829))

(declare-fun m!339831 () Bool)

(assert (=> start!33758 m!339831))

(declare-fun m!339833 () Bool)

(assert (=> start!33758 m!339833))

(declare-fun m!339835 () Bool)

(assert (=> b!335865 m!339835))

(assert (=> b!335865 m!339835))

(declare-fun m!339837 () Bool)

(assert (=> b!335865 m!339837))

(declare-fun m!339839 () Bool)

(assert (=> mapNonEmpty!11814 m!339839))

(check-sat (not mapNonEmpty!11814) (not b!335865) b_and!14173 tp_is_empty!6945 (not start!33758) (not b!335864) (not b!335869) (not b!335862) (not b_next!6993) (not b!335866))
(check-sat b_and!14173 (not b_next!6993))
(get-model)

(declare-fun d!70653 () Bool)

(declare-fun res!185428 () Bool)

(declare-fun e!206189 () Bool)

(assert (=> d!70653 (=> res!185428 e!206189)))

(assert (=> d!70653 (= res!185428 (bvsge #b00000000000000000000000000000000 (size!8625 _keys!1895)))))

(assert (=> d!70653 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!206189)))

(declare-fun b!335905 () Bool)

(declare-fun e!206190 () Bool)

(assert (=> b!335905 (= e!206189 e!206190)))

(declare-fun c!52197 () Bool)

(assert (=> b!335905 (= c!52197 (validKeyInArray!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26296 () Bool)

(declare-fun call!26299 () Bool)

(assert (=> bm!26296 (= call!26299 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!335906 () Bool)

(assert (=> b!335906 (= e!206190 call!26299)))

(declare-fun b!335907 () Bool)

(declare-fun e!206188 () Bool)

(assert (=> b!335907 (= e!206188 call!26299)))

(declare-fun b!335908 () Bool)

(assert (=> b!335908 (= e!206190 e!206188)))

(declare-fun lt!159962 () (_ BitVec 64))

(assert (=> b!335908 (= lt!159962 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10455 0))(
  ( (Unit!10456) )
))
(declare-fun lt!159963 () Unit!10455)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17485 (_ BitVec 64) (_ BitVec 32)) Unit!10455)

(assert (=> b!335908 (= lt!159963 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159962 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335908 (arrayContainsKey!0 _keys!1895 lt!159962 #b00000000000000000000000000000000)))

(declare-fun lt!159964 () Unit!10455)

(assert (=> b!335908 (= lt!159964 lt!159963)))

(declare-fun res!185429 () Bool)

(assert (=> b!335908 (= res!185429 (= (seekEntryOrOpen!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3198 #b00000000000000000000000000000000)))))

(assert (=> b!335908 (=> (not res!185429) (not e!206188))))

(assert (= (and d!70653 (not res!185428)) b!335905))

(assert (= (and b!335905 c!52197) b!335908))

(assert (= (and b!335905 (not c!52197)) b!335906))

(assert (= (and b!335908 res!185429) b!335907))

(assert (= (or b!335907 b!335906) bm!26296))

(declare-fun m!339861 () Bool)

(assert (=> b!335905 m!339861))

(assert (=> b!335905 m!339861))

(declare-fun m!339863 () Bool)

(assert (=> b!335905 m!339863))

(declare-fun m!339865 () Bool)

(assert (=> bm!26296 m!339865))

(assert (=> b!335908 m!339861))

(declare-fun m!339867 () Bool)

(assert (=> b!335908 m!339867))

(declare-fun m!339869 () Bool)

(assert (=> b!335908 m!339869))

(assert (=> b!335908 m!339861))

(declare-fun m!339871 () Bool)

(assert (=> b!335908 m!339871))

(assert (=> b!335866 d!70653))

(declare-fun d!70655 () Bool)

(assert (=> d!70655 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!335862 d!70655))

(declare-fun d!70657 () Bool)

(assert (=> d!70657 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33758 d!70657))

(declare-fun d!70659 () Bool)

(assert (=> d!70659 (= (array_inv!6142 _values!1525) (bvsge (size!8624 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33758 d!70659))

(declare-fun d!70661 () Bool)

(assert (=> d!70661 (= (array_inv!6143 _keys!1895) (bvsge (size!8625 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33758 d!70661))

(declare-fun d!70663 () Bool)

(declare-fun e!206195 () Bool)

(assert (=> d!70663 e!206195))

(declare-fun res!185432 () Bool)

(assert (=> d!70663 (=> res!185432 e!206195)))

(declare-fun lt!159976 () Bool)

(assert (=> d!70663 (= res!185432 (not lt!159976))))

(declare-fun lt!159974 () Bool)

(assert (=> d!70663 (= lt!159976 lt!159974)))

(declare-fun lt!159975 () Unit!10455)

(declare-fun e!206196 () Unit!10455)

(assert (=> d!70663 (= lt!159975 e!206196)))

(declare-fun c!52200 () Bool)

(assert (=> d!70663 (= c!52200 lt!159974)))

(declare-fun containsKey!316 (List!4728 (_ BitVec 64)) Bool)

(assert (=> d!70663 (= lt!159974 (containsKey!316 (toList!2027 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70663 (= (contains!2071 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159976)))

(declare-fun b!335915 () Bool)

(declare-fun lt!159973 () Unit!10455)

(assert (=> b!335915 (= e!206196 lt!159973)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!264 (List!4728 (_ BitVec 64)) Unit!10455)

(assert (=> b!335915 (= lt!159973 (lemmaContainsKeyImpliesGetValueByKeyDefined!264 (toList!2027 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!330 0))(
  ( (Some!329 (v!5681 V!10237)) (None!328) )
))
(declare-fun isDefined!265 (Option!330) Bool)

(declare-fun getValueByKey!324 (List!4728 (_ BitVec 64)) Option!330)

(assert (=> b!335915 (isDefined!265 (getValueByKey!324 (toList!2027 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!335916 () Bool)

(declare-fun Unit!10457 () Unit!10455)

(assert (=> b!335916 (= e!206196 Unit!10457)))

(declare-fun b!335917 () Bool)

(assert (=> b!335917 (= e!206195 (isDefined!265 (getValueByKey!324 (toList!2027 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70663 c!52200) b!335915))

(assert (= (and d!70663 (not c!52200)) b!335916))

(assert (= (and d!70663 (not res!185432)) b!335917))

(declare-fun m!339873 () Bool)

(assert (=> d!70663 m!339873))

(declare-fun m!339875 () Bool)

(assert (=> b!335915 m!339875))

(declare-fun m!339877 () Bool)

(assert (=> b!335915 m!339877))

(assert (=> b!335915 m!339877))

(declare-fun m!339879 () Bool)

(assert (=> b!335915 m!339879))

(assert (=> b!335917 m!339877))

(assert (=> b!335917 m!339877))

(assert (=> b!335917 m!339879))

(assert (=> b!335865 d!70663))

(declare-fun b!335960 () Bool)

(declare-fun e!206225 () Bool)

(assert (=> b!335960 (= e!206225 (validKeyInArray!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun call!26319 () ListLongMap!4023)

(declare-fun bm!26311 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!588 (array!17485 array!17483 (_ BitVec 32) (_ BitVec 32) V!10237 V!10237 (_ BitVec 32) Int) ListLongMap!4023)

(assert (=> bm!26311 (= call!26319 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26312 () Bool)

(declare-fun call!26315 () Bool)

(declare-fun lt!160028 () ListLongMap!4023)

(assert (=> bm!26312 (= call!26315 (contains!2071 lt!160028 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!335961 () Bool)

(declare-fun e!206235 () ListLongMap!4023)

(declare-fun e!206227 () ListLongMap!4023)

(assert (=> b!335961 (= e!206235 e!206227)))

(declare-fun c!52215 () Bool)

(assert (=> b!335961 (= c!52215 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26313 () Bool)

(declare-fun call!26316 () ListLongMap!4023)

(declare-fun call!26317 () ListLongMap!4023)

(assert (=> bm!26313 (= call!26316 call!26317)))

(declare-fun b!335962 () Bool)

(declare-fun +!715 (ListLongMap!4023 tuple2!5110) ListLongMap!4023)

(assert (=> b!335962 (= e!206235 (+!715 call!26317 (tuple2!5111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun d!70665 () Bool)

(declare-fun e!206233 () Bool)

(assert (=> d!70665 e!206233))

(declare-fun res!185458 () Bool)

(assert (=> d!70665 (=> (not res!185458) (not e!206233))))

(assert (=> d!70665 (= res!185458 (or (bvsge #b00000000000000000000000000000000 (size!8625 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8625 _keys!1895)))))))

(declare-fun lt!160035 () ListLongMap!4023)

(assert (=> d!70665 (= lt!160028 lt!160035)))

(declare-fun lt!160038 () Unit!10455)

(declare-fun e!206228 () Unit!10455)

(assert (=> d!70665 (= lt!160038 e!206228)))

(declare-fun c!52218 () Bool)

(declare-fun e!206226 () Bool)

(assert (=> d!70665 (= c!52218 e!206226)))

(declare-fun res!185451 () Bool)

(assert (=> d!70665 (=> (not res!185451) (not e!206226))))

(assert (=> d!70665 (= res!185451 (bvslt #b00000000000000000000000000000000 (size!8625 _keys!1895)))))

(assert (=> d!70665 (= lt!160035 e!206235)))

(declare-fun c!52216 () Bool)

(assert (=> d!70665 (= c!52216 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70665 (validMask!0 mask!2385)))

(assert (=> d!70665 (= (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160028)))

(declare-fun b!335963 () Bool)

(declare-fun e!206229 () Bool)

(declare-fun e!206224 () Bool)

(assert (=> b!335963 (= e!206229 e!206224)))

(declare-fun res!185459 () Bool)

(declare-fun call!26318 () Bool)

(assert (=> b!335963 (= res!185459 call!26318)))

(assert (=> b!335963 (=> (not res!185459) (not e!206224))))

(declare-fun b!335964 () Bool)

(declare-fun apply!266 (ListLongMap!4023 (_ BitVec 64)) V!10237)

(assert (=> b!335964 (= e!206224 (= (apply!266 lt!160028 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!335965 () Bool)

(assert (=> b!335965 (= e!206227 call!26316)))

(declare-fun b!335966 () Bool)

(declare-fun res!185457 () Bool)

(assert (=> b!335966 (=> (not res!185457) (not e!206233))))

(assert (=> b!335966 (= res!185457 e!206229)))

(declare-fun c!52213 () Bool)

(assert (=> b!335966 (= c!52213 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26314 () Bool)

(assert (=> bm!26314 (= call!26318 (contains!2071 lt!160028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!335967 () Bool)

(assert (=> b!335967 (= e!206229 (not call!26318))))

(declare-fun bm!26315 () Bool)

(declare-fun call!26314 () ListLongMap!4023)

(declare-fun call!26320 () ListLongMap!4023)

(assert (=> bm!26315 (= call!26314 call!26320)))

(declare-fun b!335968 () Bool)

(declare-fun e!206223 () Bool)

(declare-fun e!206234 () Bool)

(assert (=> b!335968 (= e!206223 e!206234)))

(declare-fun res!185452 () Bool)

(assert (=> b!335968 (=> (not res!185452) (not e!206234))))

(assert (=> b!335968 (= res!185452 (contains!2071 lt!160028 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!335968 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8625 _keys!1895)))))

(declare-fun bm!26316 () Bool)

(assert (=> bm!26316 (= call!26320 call!26319)))

(declare-fun b!335969 () Bool)

(declare-fun e!206230 () Bool)

(assert (=> b!335969 (= e!206233 e!206230)))

(declare-fun c!52214 () Bool)

(assert (=> b!335969 (= c!52214 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!335970 () Bool)

(declare-fun e!206232 () ListLongMap!4023)

(assert (=> b!335970 (= e!206232 call!26314)))

(declare-fun b!335971 () Bool)

(declare-fun res!185453 () Bool)

(assert (=> b!335971 (=> (not res!185453) (not e!206233))))

(assert (=> b!335971 (= res!185453 e!206223)))

(declare-fun res!185454 () Bool)

(assert (=> b!335971 (=> res!185454 e!206223)))

(assert (=> b!335971 (= res!185454 (not e!206225))))

(declare-fun res!185456 () Bool)

(assert (=> b!335971 (=> (not res!185456) (not e!206225))))

(assert (=> b!335971 (= res!185456 (bvslt #b00000000000000000000000000000000 (size!8625 _keys!1895)))))

(declare-fun b!335972 () Bool)

(declare-fun lt!160026 () Unit!10455)

(assert (=> b!335972 (= e!206228 lt!160026)))

(declare-fun lt!160024 () ListLongMap!4023)

(assert (=> b!335972 (= lt!160024 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160033 () (_ BitVec 64))

(assert (=> b!335972 (= lt!160033 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160025 () (_ BitVec 64))

(assert (=> b!335972 (= lt!160025 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160039 () Unit!10455)

(declare-fun addStillContains!242 (ListLongMap!4023 (_ BitVec 64) V!10237 (_ BitVec 64)) Unit!10455)

(assert (=> b!335972 (= lt!160039 (addStillContains!242 lt!160024 lt!160033 zeroValue!1467 lt!160025))))

(assert (=> b!335972 (contains!2071 (+!715 lt!160024 (tuple2!5111 lt!160033 zeroValue!1467)) lt!160025)))

(declare-fun lt!160031 () Unit!10455)

(assert (=> b!335972 (= lt!160031 lt!160039)))

(declare-fun lt!160040 () ListLongMap!4023)

(assert (=> b!335972 (= lt!160040 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160030 () (_ BitVec 64))

(assert (=> b!335972 (= lt!160030 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160041 () (_ BitVec 64))

(assert (=> b!335972 (= lt!160041 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160029 () Unit!10455)

(declare-fun addApplyDifferent!242 (ListLongMap!4023 (_ BitVec 64) V!10237 (_ BitVec 64)) Unit!10455)

(assert (=> b!335972 (= lt!160029 (addApplyDifferent!242 lt!160040 lt!160030 minValue!1467 lt!160041))))

(assert (=> b!335972 (= (apply!266 (+!715 lt!160040 (tuple2!5111 lt!160030 minValue!1467)) lt!160041) (apply!266 lt!160040 lt!160041))))

(declare-fun lt!160037 () Unit!10455)

(assert (=> b!335972 (= lt!160037 lt!160029)))

(declare-fun lt!160021 () ListLongMap!4023)

(assert (=> b!335972 (= lt!160021 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160032 () (_ BitVec 64))

(assert (=> b!335972 (= lt!160032 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160042 () (_ BitVec 64))

(assert (=> b!335972 (= lt!160042 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160036 () Unit!10455)

(assert (=> b!335972 (= lt!160036 (addApplyDifferent!242 lt!160021 lt!160032 zeroValue!1467 lt!160042))))

(assert (=> b!335972 (= (apply!266 (+!715 lt!160021 (tuple2!5111 lt!160032 zeroValue!1467)) lt!160042) (apply!266 lt!160021 lt!160042))))

(declare-fun lt!160027 () Unit!10455)

(assert (=> b!335972 (= lt!160027 lt!160036)))

(declare-fun lt!160022 () ListLongMap!4023)

(assert (=> b!335972 (= lt!160022 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160023 () (_ BitVec 64))

(assert (=> b!335972 (= lt!160023 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160034 () (_ BitVec 64))

(assert (=> b!335972 (= lt!160034 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!335972 (= lt!160026 (addApplyDifferent!242 lt!160022 lt!160023 minValue!1467 lt!160034))))

(assert (=> b!335972 (= (apply!266 (+!715 lt!160022 (tuple2!5111 lt!160023 minValue!1467)) lt!160034) (apply!266 lt!160022 lt!160034))))

(declare-fun b!335973 () Bool)

(assert (=> b!335973 (= e!206226 (validKeyInArray!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335974 () Bool)

(assert (=> b!335974 (= e!206230 (not call!26315))))

(declare-fun b!335975 () Bool)

(declare-fun e!206231 () Bool)

(assert (=> b!335975 (= e!206230 e!206231)))

(declare-fun res!185455 () Bool)

(assert (=> b!335975 (= res!185455 call!26315)))

(assert (=> b!335975 (=> (not res!185455) (not e!206231))))

(declare-fun b!335976 () Bool)

(assert (=> b!335976 (= e!206231 (= (apply!266 lt!160028 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!335977 () Bool)

(declare-fun get!4526 (ValueCell!3129 V!10237) V!10237)

(declare-fun dynLambda!609 (Int (_ BitVec 64)) V!10237)

(assert (=> b!335977 (= e!206234 (= (apply!266 lt!160028 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)) (get!4526 (select (arr!8272 _values!1525) #b00000000000000000000000000000000) (dynLambda!609 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!335977 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8624 _values!1525)))))

(assert (=> b!335977 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8625 _keys!1895)))))

(declare-fun b!335978 () Bool)

(declare-fun Unit!10458 () Unit!10455)

(assert (=> b!335978 (= e!206228 Unit!10458)))

(declare-fun bm!26317 () Bool)

(assert (=> bm!26317 (= call!26317 (+!715 (ite c!52216 call!26319 (ite c!52215 call!26320 call!26314)) (ite (or c!52216 c!52215) (tuple2!5111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!335979 () Bool)

(declare-fun c!52217 () Bool)

(assert (=> b!335979 (= c!52217 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!335979 (= e!206227 e!206232)))

(declare-fun b!335980 () Bool)

(assert (=> b!335980 (= e!206232 call!26316)))

(assert (= (and d!70665 c!52216) b!335962))

(assert (= (and d!70665 (not c!52216)) b!335961))

(assert (= (and b!335961 c!52215) b!335965))

(assert (= (and b!335961 (not c!52215)) b!335979))

(assert (= (and b!335979 c!52217) b!335980))

(assert (= (and b!335979 (not c!52217)) b!335970))

(assert (= (or b!335980 b!335970) bm!26315))

(assert (= (or b!335965 bm!26315) bm!26316))

(assert (= (or b!335965 b!335980) bm!26313))

(assert (= (or b!335962 bm!26316) bm!26311))

(assert (= (or b!335962 bm!26313) bm!26317))

(assert (= (and d!70665 res!185451) b!335973))

(assert (= (and d!70665 c!52218) b!335972))

(assert (= (and d!70665 (not c!52218)) b!335978))

(assert (= (and d!70665 res!185458) b!335971))

(assert (= (and b!335971 res!185456) b!335960))

(assert (= (and b!335971 (not res!185454)) b!335968))

(assert (= (and b!335968 res!185452) b!335977))

(assert (= (and b!335971 res!185453) b!335966))

(assert (= (and b!335966 c!52213) b!335963))

(assert (= (and b!335966 (not c!52213)) b!335967))

(assert (= (and b!335963 res!185459) b!335964))

(assert (= (or b!335963 b!335967) bm!26314))

(assert (= (and b!335966 res!185457) b!335969))

(assert (= (and b!335969 c!52214) b!335975))

(assert (= (and b!335969 (not c!52214)) b!335974))

(assert (= (and b!335975 res!185455) b!335976))

(assert (= (or b!335975 b!335974) bm!26312))

(declare-fun b_lambda!8403 () Bool)

(assert (=> (not b_lambda!8403) (not b!335977)))

(declare-fun t!9820 () Bool)

(declare-fun tb!3047 () Bool)

(assert (=> (and start!33758 (= defaultEntry!1528 defaultEntry!1528) t!9820) tb!3047))

(declare-fun result!5471 () Bool)

(assert (=> tb!3047 (= result!5471 tp_is_empty!6945)))

(assert (=> b!335977 t!9820))

(declare-fun b_and!14177 () Bool)

(assert (= b_and!14173 (and (=> t!9820 result!5471) b_and!14177)))

(assert (=> b!335977 m!339861))

(declare-fun m!339881 () Bool)

(assert (=> b!335977 m!339881))

(assert (=> b!335977 m!339861))

(declare-fun m!339883 () Bool)

(assert (=> b!335977 m!339883))

(assert (=> b!335977 m!339883))

(declare-fun m!339885 () Bool)

(assert (=> b!335977 m!339885))

(declare-fun m!339887 () Bool)

(assert (=> b!335977 m!339887))

(assert (=> b!335977 m!339885))

(assert (=> d!70665 m!339829))

(assert (=> b!335973 m!339861))

(assert (=> b!335973 m!339861))

(assert (=> b!335973 m!339863))

(declare-fun m!339889 () Bool)

(assert (=> b!335964 m!339889))

(assert (=> b!335960 m!339861))

(assert (=> b!335960 m!339861))

(assert (=> b!335960 m!339863))

(declare-fun m!339891 () Bool)

(assert (=> b!335972 m!339891))

(declare-fun m!339893 () Bool)

(assert (=> b!335972 m!339893))

(declare-fun m!339895 () Bool)

(assert (=> b!335972 m!339895))

(assert (=> b!335972 m!339893))

(declare-fun m!339897 () Bool)

(assert (=> b!335972 m!339897))

(declare-fun m!339899 () Bool)

(assert (=> b!335972 m!339899))

(declare-fun m!339901 () Bool)

(assert (=> b!335972 m!339901))

(declare-fun m!339903 () Bool)

(assert (=> b!335972 m!339903))

(declare-fun m!339905 () Bool)

(assert (=> b!335972 m!339905))

(declare-fun m!339907 () Bool)

(assert (=> b!335972 m!339907))

(assert (=> b!335972 m!339891))

(declare-fun m!339909 () Bool)

(assert (=> b!335972 m!339909))

(assert (=> b!335972 m!339895))

(declare-fun m!339911 () Bool)

(assert (=> b!335972 m!339911))

(declare-fun m!339913 () Bool)

(assert (=> b!335972 m!339913))

(declare-fun m!339915 () Bool)

(assert (=> b!335972 m!339915))

(declare-fun m!339917 () Bool)

(assert (=> b!335972 m!339917))

(declare-fun m!339919 () Bool)

(assert (=> b!335972 m!339919))

(assert (=> b!335972 m!339861))

(assert (=> b!335972 m!339907))

(declare-fun m!339921 () Bool)

(assert (=> b!335972 m!339921))

(declare-fun m!339923 () Bool)

(assert (=> b!335962 m!339923))

(declare-fun m!339925 () Bool)

(assert (=> bm!26317 m!339925))

(declare-fun m!339927 () Bool)

(assert (=> bm!26314 m!339927))

(declare-fun m!339929 () Bool)

(assert (=> b!335976 m!339929))

(assert (=> b!335968 m!339861))

(assert (=> b!335968 m!339861))

(declare-fun m!339931 () Bool)

(assert (=> b!335968 m!339931))

(declare-fun m!339933 () Bool)

(assert (=> bm!26312 m!339933))

(assert (=> bm!26311 m!339919))

(assert (=> b!335865 d!70665))

(declare-fun bm!26320 () Bool)

(declare-fun call!26323 () Bool)

(declare-fun c!52221 () Bool)

(assert (=> bm!26320 (= call!26323 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52221 (Cons!4723 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000) Nil!4724) Nil!4724)))))

(declare-fun b!335993 () Bool)

(declare-fun e!206244 () Bool)

(assert (=> b!335993 (= e!206244 call!26323)))

(declare-fun b!335994 () Bool)

(declare-fun e!206245 () Bool)

(assert (=> b!335994 (= e!206245 e!206244)))

(assert (=> b!335994 (= c!52221 (validKeyInArray!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335995 () Bool)

(assert (=> b!335995 (= e!206244 call!26323)))

(declare-fun b!335996 () Bool)

(declare-fun e!206247 () Bool)

(assert (=> b!335996 (= e!206247 e!206245)))

(declare-fun res!185468 () Bool)

(assert (=> b!335996 (=> (not res!185468) (not e!206245))))

(declare-fun e!206246 () Bool)

(assert (=> b!335996 (= res!185468 (not e!206246))))

(declare-fun res!185467 () Bool)

(assert (=> b!335996 (=> (not res!185467) (not e!206246))))

(assert (=> b!335996 (= res!185467 (validKeyInArray!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335997 () Bool)

(declare-fun contains!2073 (List!4727 (_ BitVec 64)) Bool)

(assert (=> b!335997 (= e!206246 (contains!2073 Nil!4724 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70667 () Bool)

(declare-fun res!185466 () Bool)

(assert (=> d!70667 (=> res!185466 e!206247)))

(assert (=> d!70667 (= res!185466 (bvsge #b00000000000000000000000000000000 (size!8625 _keys!1895)))))

(assert (=> d!70667 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4724) e!206247)))

(assert (= (and d!70667 (not res!185466)) b!335996))

(assert (= (and b!335996 res!185467) b!335997))

(assert (= (and b!335996 res!185468) b!335994))

(assert (= (and b!335994 c!52221) b!335993))

(assert (= (and b!335994 (not c!52221)) b!335995))

(assert (= (or b!335993 b!335995) bm!26320))

(assert (=> bm!26320 m!339861))

(declare-fun m!339935 () Bool)

(assert (=> bm!26320 m!339935))

(assert (=> b!335994 m!339861))

(assert (=> b!335994 m!339861))

(assert (=> b!335994 m!339863))

(assert (=> b!335996 m!339861))

(assert (=> b!335996 m!339861))

(assert (=> b!335996 m!339863))

(assert (=> b!335997 m!339861))

(assert (=> b!335997 m!339861))

(declare-fun m!339937 () Bool)

(assert (=> b!335997 m!339937))

(assert (=> b!335864 d!70667))

(declare-fun b!336010 () Bool)

(declare-fun e!206256 () SeekEntryResult!3198)

(declare-fun e!206255 () SeekEntryResult!3198)

(assert (=> b!336010 (= e!206256 e!206255)))

(declare-fun lt!160050 () (_ BitVec 64))

(declare-fun lt!160049 () SeekEntryResult!3198)

(assert (=> b!336010 (= lt!160050 (select (arr!8273 _keys!1895) (index!14973 lt!160049)))))

(declare-fun c!52229 () Bool)

(assert (=> b!336010 (= c!52229 (= lt!160050 k0!1348))))

(declare-fun b!336011 () Bool)

(assert (=> b!336011 (= e!206255 (Found!3198 (index!14973 lt!160049)))))

(declare-fun e!206254 () SeekEntryResult!3198)

(declare-fun b!336012 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17485 (_ BitVec 32)) SeekEntryResult!3198)

(assert (=> b!336012 (= e!206254 (seekKeyOrZeroReturnVacant!0 (x!33476 lt!160049) (index!14973 lt!160049) (index!14973 lt!160049) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336013 () Bool)

(declare-fun c!52228 () Bool)

(assert (=> b!336013 (= c!52228 (= lt!160050 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!336013 (= e!206255 e!206254)))

(declare-fun b!336014 () Bool)

(assert (=> b!336014 (= e!206256 Undefined!3198)))

(declare-fun b!336015 () Bool)

(assert (=> b!336015 (= e!206254 (MissingZero!3198 (index!14973 lt!160049)))))

(declare-fun d!70669 () Bool)

(declare-fun lt!160051 () SeekEntryResult!3198)

(assert (=> d!70669 (and (or ((_ is Undefined!3198) lt!160051) (not ((_ is Found!3198) lt!160051)) (and (bvsge (index!14972 lt!160051) #b00000000000000000000000000000000) (bvslt (index!14972 lt!160051) (size!8625 _keys!1895)))) (or ((_ is Undefined!3198) lt!160051) ((_ is Found!3198) lt!160051) (not ((_ is MissingZero!3198) lt!160051)) (and (bvsge (index!14971 lt!160051) #b00000000000000000000000000000000) (bvslt (index!14971 lt!160051) (size!8625 _keys!1895)))) (or ((_ is Undefined!3198) lt!160051) ((_ is Found!3198) lt!160051) ((_ is MissingZero!3198) lt!160051) (not ((_ is MissingVacant!3198) lt!160051)) (and (bvsge (index!14974 lt!160051) #b00000000000000000000000000000000) (bvslt (index!14974 lt!160051) (size!8625 _keys!1895)))) (or ((_ is Undefined!3198) lt!160051) (ite ((_ is Found!3198) lt!160051) (= (select (arr!8273 _keys!1895) (index!14972 lt!160051)) k0!1348) (ite ((_ is MissingZero!3198) lt!160051) (= (select (arr!8273 _keys!1895) (index!14971 lt!160051)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3198) lt!160051) (= (select (arr!8273 _keys!1895) (index!14974 lt!160051)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70669 (= lt!160051 e!206256)))

(declare-fun c!52230 () Bool)

(assert (=> d!70669 (= c!52230 (and ((_ is Intermediate!3198) lt!160049) (undefined!4010 lt!160049)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17485 (_ BitVec 32)) SeekEntryResult!3198)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70669 (= lt!160049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70669 (validMask!0 mask!2385)))

(assert (=> d!70669 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160051)))

(assert (= (and d!70669 c!52230) b!336014))

(assert (= (and d!70669 (not c!52230)) b!336010))

(assert (= (and b!336010 c!52229) b!336011))

(assert (= (and b!336010 (not c!52229)) b!336013))

(assert (= (and b!336013 c!52228) b!336015))

(assert (= (and b!336013 (not c!52228)) b!336012))

(declare-fun m!339939 () Bool)

(assert (=> b!336010 m!339939))

(declare-fun m!339941 () Bool)

(assert (=> b!336012 m!339941))

(assert (=> d!70669 m!339829))

(declare-fun m!339943 () Bool)

(assert (=> d!70669 m!339943))

(declare-fun m!339945 () Bool)

(assert (=> d!70669 m!339945))

(assert (=> d!70669 m!339945))

(declare-fun m!339947 () Bool)

(assert (=> d!70669 m!339947))

(declare-fun m!339949 () Bool)

(assert (=> d!70669 m!339949))

(declare-fun m!339951 () Bool)

(assert (=> d!70669 m!339951))

(assert (=> b!335869 d!70669))

(declare-fun condMapEmpty!11820 () Bool)

(declare-fun mapDefault!11820 () ValueCell!3129)

(assert (=> mapNonEmpty!11814 (= condMapEmpty!11820 (= mapRest!11814 ((as const (Array (_ BitVec 32) ValueCell!3129)) mapDefault!11820)))))

(declare-fun e!206261 () Bool)

(declare-fun mapRes!11820 () Bool)

(assert (=> mapNonEmpty!11814 (= tp!24483 (and e!206261 mapRes!11820))))

(declare-fun b!336022 () Bool)

(declare-fun e!206262 () Bool)

(assert (=> b!336022 (= e!206262 tp_is_empty!6945)))

(declare-fun mapNonEmpty!11820 () Bool)

(declare-fun tp!24492 () Bool)

(assert (=> mapNonEmpty!11820 (= mapRes!11820 (and tp!24492 e!206262))))

(declare-fun mapValue!11820 () ValueCell!3129)

(declare-fun mapKey!11820 () (_ BitVec 32))

(declare-fun mapRest!11820 () (Array (_ BitVec 32) ValueCell!3129))

(assert (=> mapNonEmpty!11820 (= mapRest!11814 (store mapRest!11820 mapKey!11820 mapValue!11820))))

(declare-fun mapIsEmpty!11820 () Bool)

(assert (=> mapIsEmpty!11820 mapRes!11820))

(declare-fun b!336023 () Bool)

(assert (=> b!336023 (= e!206261 tp_is_empty!6945)))

(assert (= (and mapNonEmpty!11814 condMapEmpty!11820) mapIsEmpty!11820))

(assert (= (and mapNonEmpty!11814 (not condMapEmpty!11820)) mapNonEmpty!11820))

(assert (= (and mapNonEmpty!11820 ((_ is ValueCellFull!3129) mapValue!11820)) b!336022))

(assert (= (and mapNonEmpty!11814 ((_ is ValueCellFull!3129) mapDefault!11820)) b!336023))

(declare-fun m!339953 () Bool)

(assert (=> mapNonEmpty!11820 m!339953))

(declare-fun b_lambda!8405 () Bool)

(assert (= b_lambda!8403 (or (and start!33758 b_free!6993) b_lambda!8405)))

(check-sat (not bm!26314) (not b!335964) (not bm!26312) (not b!336012) (not b_lambda!8405) (not d!70669) (not bm!26317) (not b!335968) (not bm!26320) (not b!335997) b_and!14177 (not b!335960) (not b!335972) (not b!335996) (not b!335917) (not b_next!6993) (not b!335905) (not b!335915) (not b!335962) (not b!335976) (not bm!26296) (not bm!26311) tp_is_empty!6945 (not b!335908) (not b!335973) (not b!335977) (not d!70663) (not b!335994) (not d!70665) (not mapNonEmpty!11820))
(check-sat b_and!14177 (not b_next!6993))
