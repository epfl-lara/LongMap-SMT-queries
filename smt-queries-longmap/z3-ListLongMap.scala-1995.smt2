; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34862 () Bool)

(assert start!34862)

(declare-fun b_free!7639 () Bool)

(declare-fun b_next!7639 () Bool)

(assert (=> start!34862 (= b_free!7639 (not b_next!7639))))

(declare-fun tp!26486 () Bool)

(declare-fun b_and!14837 () Bool)

(assert (=> start!34862 (= tp!26486 b_and!14837)))

(declare-fun b!348969 () Bool)

(declare-fun res!193423 () Bool)

(declare-fun e!213764 () Bool)

(assert (=> b!348969 (=> (not res!193423) (not e!213764))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11099 0))(
  ( (V!11100 (val!3840 Int)) )
))
(declare-fun zeroValue!1467 () V!11099)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3452 0))(
  ( (ValueCellFull!3452 (v!6018 V!11099)) (EmptyCell!3452) )
))
(declare-datatypes ((array!18747 0))(
  ( (array!18748 (arr!8882 (Array (_ BitVec 32) ValueCell!3452)) (size!9235 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18747)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11099)

(declare-datatypes ((array!18749 0))(
  ( (array!18750 (arr!8883 (Array (_ BitVec 32) (_ BitVec 64))) (size!9236 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18749)

(declare-datatypes ((tuple2!5514 0))(
  ( (tuple2!5515 (_1!2768 (_ BitVec 64)) (_2!2768 V!11099)) )
))
(declare-datatypes ((List!5128 0))(
  ( (Nil!5125) (Cons!5124 (h!5980 tuple2!5514) (t!10251 List!5128)) )
))
(declare-datatypes ((ListLongMap!4417 0))(
  ( (ListLongMap!4418 (toList!2224 List!5128)) )
))
(declare-fun contains!2301 (ListLongMap!4417 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1729 (array!18749 array!18747 (_ BitVec 32) (_ BitVec 32) V!11099 V!11099 (_ BitVec 32) Int) ListLongMap!4417)

(assert (=> b!348969 (= res!193423 (not (contains!2301 (getCurrentListMap!1729 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348970 () Bool)

(declare-fun e!213759 () Bool)

(declare-fun e!213760 () Bool)

(assert (=> b!348970 (= e!213759 e!213760)))

(declare-fun res!193428 () Bool)

(assert (=> b!348970 (=> (not res!193428) (not e!213760))))

(declare-fun lt!163862 () (_ BitVec 32))

(assert (=> b!348970 (= res!193428 (and (bvsge lt!163862 #b00000000000000000000000000000000) (bvslt lt!163862 (size!9236 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18749 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348970 (= lt!163862 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348971 () Bool)

(assert (=> b!348971 (= e!213764 e!213759)))

(declare-fun res!193424 () Bool)

(assert (=> b!348971 (=> (not res!193424) (not e!213759))))

(declare-datatypes ((SeekEntryResult!3423 0))(
  ( (MissingZero!3423 (index!15871 (_ BitVec 32))) (Found!3423 (index!15872 (_ BitVec 32))) (Intermediate!3423 (undefined!4235 Bool) (index!15873 (_ BitVec 32)) (x!34780 (_ BitVec 32))) (Undefined!3423) (MissingVacant!3423 (index!15874 (_ BitVec 32))) )
))
(declare-fun lt!163863 () SeekEntryResult!3423)

(get-info :version)

(assert (=> b!348971 (= res!193424 (and (not ((_ is Found!3423) lt!163863)) ((_ is MissingZero!3423) lt!163863)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18749 (_ BitVec 32)) SeekEntryResult!3423)

(assert (=> b!348971 (= lt!163863 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348972 () Bool)

(declare-fun res!193429 () Bool)

(assert (=> b!348972 (=> (not res!193429) (not e!213759))))

(declare-fun arrayContainsKey!0 (array!18749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348972 (= res!193429 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12849 () Bool)

(declare-fun mapRes!12849 () Bool)

(declare-fun tp!26487 () Bool)

(declare-fun e!213763 () Bool)

(assert (=> mapNonEmpty!12849 (= mapRes!12849 (and tp!26487 e!213763))))

(declare-fun mapRest!12849 () (Array (_ BitVec 32) ValueCell!3452))

(declare-fun mapKey!12849 () (_ BitVec 32))

(declare-fun mapValue!12849 () ValueCell!3452)

(assert (=> mapNonEmpty!12849 (= (arr!8882 _values!1525) (store mapRest!12849 mapKey!12849 mapValue!12849))))

(declare-fun mapIsEmpty!12849 () Bool)

(assert (=> mapIsEmpty!12849 mapRes!12849))

(declare-fun b!348973 () Bool)

(declare-fun res!193427 () Bool)

(assert (=> b!348973 (=> (not res!193427) (not e!213764))))

(declare-datatypes ((List!5129 0))(
  ( (Nil!5126) (Cons!5125 (h!5981 (_ BitVec 64)) (t!10252 List!5129)) )
))
(declare-fun arrayNoDuplicates!0 (array!18749 (_ BitVec 32) List!5129) Bool)

(assert (=> b!348973 (= res!193427 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5126))))

(declare-fun b!348974 () Bool)

(declare-fun e!213765 () Bool)

(declare-fun e!213761 () Bool)

(assert (=> b!348974 (= e!213765 (and e!213761 mapRes!12849))))

(declare-fun condMapEmpty!12849 () Bool)

(declare-fun mapDefault!12849 () ValueCell!3452)

(assert (=> b!348974 (= condMapEmpty!12849 (= (arr!8882 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3452)) mapDefault!12849)))))

(declare-fun res!193425 () Bool)

(assert (=> start!34862 (=> (not res!193425) (not e!213764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34862 (= res!193425 (validMask!0 mask!2385))))

(assert (=> start!34862 e!213764))

(assert (=> start!34862 true))

(declare-fun tp_is_empty!7591 () Bool)

(assert (=> start!34862 tp_is_empty!7591))

(assert (=> start!34862 tp!26486))

(declare-fun array_inv!6588 (array!18747) Bool)

(assert (=> start!34862 (and (array_inv!6588 _values!1525) e!213765)))

(declare-fun array_inv!6589 (array!18749) Bool)

(assert (=> start!34862 (array_inv!6589 _keys!1895)))

(declare-fun b!348975 () Bool)

(assert (=> b!348975 (= e!213760 (not (arrayContainsKey!0 _keys!1895 k0!1348 lt!163862)))))

(declare-fun b!348976 () Bool)

(assert (=> b!348976 (= e!213761 tp_is_empty!7591)))

(declare-fun b!348977 () Bool)

(declare-fun res!193426 () Bool)

(assert (=> b!348977 (=> (not res!193426) (not e!213764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18749 (_ BitVec 32)) Bool)

(assert (=> b!348977 (= res!193426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348978 () Bool)

(assert (=> b!348978 (= e!213763 tp_is_empty!7591)))

(declare-fun b!348979 () Bool)

(declare-fun res!193422 () Bool)

(assert (=> b!348979 (=> (not res!193422) (not e!213764))))

(assert (=> b!348979 (= res!193422 (and (= (size!9235 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9236 _keys!1895) (size!9235 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348980 () Bool)

(declare-fun res!193421 () Bool)

(assert (=> b!348980 (=> (not res!193421) (not e!213764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348980 (= res!193421 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34862 res!193425) b!348979))

(assert (= (and b!348979 res!193422) b!348977))

(assert (= (and b!348977 res!193426) b!348973))

(assert (= (and b!348973 res!193427) b!348980))

(assert (= (and b!348980 res!193421) b!348969))

(assert (= (and b!348969 res!193423) b!348971))

(assert (= (and b!348971 res!193424) b!348972))

(assert (= (and b!348972 res!193429) b!348970))

(assert (= (and b!348970 res!193428) b!348975))

(assert (= (and b!348974 condMapEmpty!12849) mapIsEmpty!12849))

(assert (= (and b!348974 (not condMapEmpty!12849)) mapNonEmpty!12849))

(assert (= (and mapNonEmpty!12849 ((_ is ValueCellFull!3452) mapValue!12849)) b!348978))

(assert (= (and b!348974 ((_ is ValueCellFull!3452) mapDefault!12849)) b!348976))

(assert (= start!34862 b!348974))

(declare-fun m!349063 () Bool)

(assert (=> b!348972 m!349063))

(declare-fun m!349065 () Bool)

(assert (=> b!348971 m!349065))

(declare-fun m!349067 () Bool)

(assert (=> mapNonEmpty!12849 m!349067))

(declare-fun m!349069 () Bool)

(assert (=> b!348975 m!349069))

(declare-fun m!349071 () Bool)

(assert (=> b!348977 m!349071))

(declare-fun m!349073 () Bool)

(assert (=> start!34862 m!349073))

(declare-fun m!349075 () Bool)

(assert (=> start!34862 m!349075))

(declare-fun m!349077 () Bool)

(assert (=> start!34862 m!349077))

(declare-fun m!349079 () Bool)

(assert (=> b!348980 m!349079))

(declare-fun m!349081 () Bool)

(assert (=> b!348973 m!349081))

(declare-fun m!349083 () Bool)

(assert (=> b!348970 m!349083))

(declare-fun m!349085 () Bool)

(assert (=> b!348969 m!349085))

(assert (=> b!348969 m!349085))

(declare-fun m!349087 () Bool)

(assert (=> b!348969 m!349087))

(check-sat (not b!348969) (not b!348977) (not mapNonEmpty!12849) (not b!348975) (not b!348973) (not b!348971) (not b!348970) b_and!14837 (not b_next!7639) (not b!348980) tp_is_empty!7591 (not b!348972) (not start!34862))
(check-sat b_and!14837 (not b_next!7639))
(get-model)

(declare-fun e!213814 () SeekEntryResult!3423)

(declare-fun b!349065 () Bool)

(declare-fun lt!163883 () SeekEntryResult!3423)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18749 (_ BitVec 32)) SeekEntryResult!3423)

(assert (=> b!349065 (= e!213814 (seekKeyOrZeroReturnVacant!0 (x!34780 lt!163883) (index!15873 lt!163883) (index!15873 lt!163883) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349066 () Bool)

(declare-fun c!53182 () Bool)

(declare-fun lt!163884 () (_ BitVec 64))

(assert (=> b!349066 (= c!53182 (= lt!163884 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!213815 () SeekEntryResult!3423)

(assert (=> b!349066 (= e!213815 e!213814)))

(declare-fun b!349067 () Bool)

(assert (=> b!349067 (= e!213814 (MissingZero!3423 (index!15873 lt!163883)))))

(declare-fun b!349068 () Bool)

(declare-fun e!213816 () SeekEntryResult!3423)

(assert (=> b!349068 (= e!213816 Undefined!3423)))

(declare-fun b!349069 () Bool)

(assert (=> b!349069 (= e!213816 e!213815)))

(assert (=> b!349069 (= lt!163884 (select (arr!8883 _keys!1895) (index!15873 lt!163883)))))

(declare-fun c!53181 () Bool)

(assert (=> b!349069 (= c!53181 (= lt!163884 k0!1348))))

(declare-fun b!349070 () Bool)

(assert (=> b!349070 (= e!213815 (Found!3423 (index!15873 lt!163883)))))

(declare-fun d!71137 () Bool)

(declare-fun lt!163882 () SeekEntryResult!3423)

(assert (=> d!71137 (and (or ((_ is Undefined!3423) lt!163882) (not ((_ is Found!3423) lt!163882)) (and (bvsge (index!15872 lt!163882) #b00000000000000000000000000000000) (bvslt (index!15872 lt!163882) (size!9236 _keys!1895)))) (or ((_ is Undefined!3423) lt!163882) ((_ is Found!3423) lt!163882) (not ((_ is MissingZero!3423) lt!163882)) (and (bvsge (index!15871 lt!163882) #b00000000000000000000000000000000) (bvslt (index!15871 lt!163882) (size!9236 _keys!1895)))) (or ((_ is Undefined!3423) lt!163882) ((_ is Found!3423) lt!163882) ((_ is MissingZero!3423) lt!163882) (not ((_ is MissingVacant!3423) lt!163882)) (and (bvsge (index!15874 lt!163882) #b00000000000000000000000000000000) (bvslt (index!15874 lt!163882) (size!9236 _keys!1895)))) (or ((_ is Undefined!3423) lt!163882) (ite ((_ is Found!3423) lt!163882) (= (select (arr!8883 _keys!1895) (index!15872 lt!163882)) k0!1348) (ite ((_ is MissingZero!3423) lt!163882) (= (select (arr!8883 _keys!1895) (index!15871 lt!163882)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3423) lt!163882) (= (select (arr!8883 _keys!1895) (index!15874 lt!163882)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71137 (= lt!163882 e!213816)))

(declare-fun c!53183 () Bool)

(assert (=> d!71137 (= c!53183 (and ((_ is Intermediate!3423) lt!163883) (undefined!4235 lt!163883)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18749 (_ BitVec 32)) SeekEntryResult!3423)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71137 (= lt!163883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71137 (validMask!0 mask!2385)))

(assert (=> d!71137 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163882)))

(assert (= (and d!71137 c!53183) b!349068))

(assert (= (and d!71137 (not c!53183)) b!349069))

(assert (= (and b!349069 c!53181) b!349070))

(assert (= (and b!349069 (not c!53181)) b!349066))

(assert (= (and b!349066 c!53182) b!349067))

(assert (= (and b!349066 (not c!53182)) b!349065))

(declare-fun m!349141 () Bool)

(assert (=> b!349065 m!349141))

(declare-fun m!349143 () Bool)

(assert (=> b!349069 m!349143))

(declare-fun m!349145 () Bool)

(assert (=> d!71137 m!349145))

(declare-fun m!349147 () Bool)

(assert (=> d!71137 m!349147))

(declare-fun m!349149 () Bool)

(assert (=> d!71137 m!349149))

(assert (=> d!71137 m!349147))

(declare-fun m!349151 () Bool)

(assert (=> d!71137 m!349151))

(assert (=> d!71137 m!349073))

(declare-fun m!349153 () Bool)

(assert (=> d!71137 m!349153))

(assert (=> b!348971 d!71137))

(declare-fun d!71139 () Bool)

(assert (=> d!71139 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!348980 d!71139))

(declare-fun d!71141 () Bool)

(declare-fun res!193488 () Bool)

(declare-fun e!213821 () Bool)

(assert (=> d!71141 (=> res!193488 e!213821)))

(assert (=> d!71141 (= res!193488 (= (select (arr!8883 _keys!1895) lt!163862) k0!1348))))

(assert (=> d!71141 (= (arrayContainsKey!0 _keys!1895 k0!1348 lt!163862) e!213821)))

(declare-fun b!349075 () Bool)

(declare-fun e!213822 () Bool)

(assert (=> b!349075 (= e!213821 e!213822)))

(declare-fun res!193489 () Bool)

(assert (=> b!349075 (=> (not res!193489) (not e!213822))))

(assert (=> b!349075 (= res!193489 (bvslt (bvadd lt!163862 #b00000000000000000000000000000001) (size!9236 _keys!1895)))))

(declare-fun b!349076 () Bool)

(assert (=> b!349076 (= e!213822 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd lt!163862 #b00000000000000000000000000000001)))))

(assert (= (and d!71141 (not res!193488)) b!349075))

(assert (= (and b!349075 res!193489) b!349076))

(declare-fun m!349155 () Bool)

(assert (=> d!71141 m!349155))

(declare-fun m!349157 () Bool)

(assert (=> b!349076 m!349157))

(assert (=> b!348975 d!71141))

(declare-fun b!349087 () Bool)

(declare-fun e!213832 () Bool)

(declare-fun call!26867 () Bool)

(assert (=> b!349087 (= e!213832 call!26867)))

(declare-fun b!349088 () Bool)

(assert (=> b!349088 (= e!213832 call!26867)))

(declare-fun b!349089 () Bool)

(declare-fun e!213831 () Bool)

(declare-fun e!213833 () Bool)

(assert (=> b!349089 (= e!213831 e!213833)))

(declare-fun res!193497 () Bool)

(assert (=> b!349089 (=> (not res!193497) (not e!213833))))

(declare-fun e!213834 () Bool)

(assert (=> b!349089 (= res!193497 (not e!213834))))

(declare-fun res!193498 () Bool)

(assert (=> b!349089 (=> (not res!193498) (not e!213834))))

(assert (=> b!349089 (= res!193498 (validKeyInArray!0 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71143 () Bool)

(declare-fun res!193496 () Bool)

(assert (=> d!71143 (=> res!193496 e!213831)))

(assert (=> d!71143 (= res!193496 (bvsge #b00000000000000000000000000000000 (size!9236 _keys!1895)))))

(assert (=> d!71143 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5126) e!213831)))

(declare-fun bm!26864 () Bool)

(declare-fun c!53186 () Bool)

(assert (=> bm!26864 (= call!26867 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53186 (Cons!5125 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000) Nil!5126) Nil!5126)))))

(declare-fun b!349090 () Bool)

(assert (=> b!349090 (= e!213833 e!213832)))

(assert (=> b!349090 (= c!53186 (validKeyInArray!0 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349091 () Bool)

(declare-fun contains!2302 (List!5129 (_ BitVec 64)) Bool)

(assert (=> b!349091 (= e!213834 (contains!2302 Nil!5126 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71143 (not res!193496)) b!349089))

(assert (= (and b!349089 res!193498) b!349091))

(assert (= (and b!349089 res!193497) b!349090))

(assert (= (and b!349090 c!53186) b!349088))

(assert (= (and b!349090 (not c!53186)) b!349087))

(assert (= (or b!349088 b!349087) bm!26864))

(declare-fun m!349159 () Bool)

(assert (=> b!349089 m!349159))

(assert (=> b!349089 m!349159))

(declare-fun m!349161 () Bool)

(assert (=> b!349089 m!349161))

(assert (=> bm!26864 m!349159))

(declare-fun m!349163 () Bool)

(assert (=> bm!26864 m!349163))

(assert (=> b!349090 m!349159))

(assert (=> b!349090 m!349159))

(assert (=> b!349090 m!349161))

(assert (=> b!349091 m!349159))

(assert (=> b!349091 m!349159))

(declare-fun m!349165 () Bool)

(assert (=> b!349091 m!349165))

(assert (=> b!348973 d!71143))

(declare-fun d!71145 () Bool)

(declare-fun lt!163887 () (_ BitVec 32))

(assert (=> d!71145 (and (or (bvslt lt!163887 #b00000000000000000000000000000000) (bvsge lt!163887 (size!9236 _keys!1895)) (and (bvsge lt!163887 #b00000000000000000000000000000000) (bvslt lt!163887 (size!9236 _keys!1895)))) (bvsge lt!163887 #b00000000000000000000000000000000) (bvslt lt!163887 (size!9236 _keys!1895)) (= (select (arr!8883 _keys!1895) lt!163887) k0!1348))))

(declare-fun e!213837 () (_ BitVec 32))

(assert (=> d!71145 (= lt!163887 e!213837)))

(declare-fun c!53189 () Bool)

(assert (=> d!71145 (= c!53189 (= (select (arr!8883 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71145 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9236 _keys!1895)) (bvslt (size!9236 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71145 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!163887)))

(declare-fun b!349096 () Bool)

(assert (=> b!349096 (= e!213837 #b00000000000000000000000000000000)))

(declare-fun b!349097 () Bool)

(assert (=> b!349097 (= e!213837 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71145 c!53189) b!349096))

(assert (= (and d!71145 (not c!53189)) b!349097))

(declare-fun m!349167 () Bool)

(assert (=> d!71145 m!349167))

(assert (=> d!71145 m!349159))

(declare-fun m!349169 () Bool)

(assert (=> b!349097 m!349169))

(assert (=> b!348970 d!71145))

(declare-fun b!349106 () Bool)

(declare-fun e!213846 () Bool)

(declare-fun e!213845 () Bool)

(assert (=> b!349106 (= e!213846 e!213845)))

(declare-fun c!53192 () Bool)

(assert (=> b!349106 (= c!53192 (validKeyInArray!0 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349107 () Bool)

(declare-fun e!213844 () Bool)

(declare-fun call!26870 () Bool)

(assert (=> b!349107 (= e!213844 call!26870)))

(declare-fun b!349108 () Bool)

(assert (=> b!349108 (= e!213845 e!213844)))

(declare-fun lt!163894 () (_ BitVec 64))

(assert (=> b!349108 (= lt!163894 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10796 0))(
  ( (Unit!10797) )
))
(declare-fun lt!163896 () Unit!10796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18749 (_ BitVec 64) (_ BitVec 32)) Unit!10796)

(assert (=> b!349108 (= lt!163896 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163894 #b00000000000000000000000000000000))))

(assert (=> b!349108 (arrayContainsKey!0 _keys!1895 lt!163894 #b00000000000000000000000000000000)))

(declare-fun lt!163895 () Unit!10796)

(assert (=> b!349108 (= lt!163895 lt!163896)))

(declare-fun res!193503 () Bool)

(assert (=> b!349108 (= res!193503 (= (seekEntryOrOpen!0 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3423 #b00000000000000000000000000000000)))))

(assert (=> b!349108 (=> (not res!193503) (not e!213844))))

(declare-fun b!349109 () Bool)

(assert (=> b!349109 (= e!213845 call!26870)))

(declare-fun d!71147 () Bool)

(declare-fun res!193504 () Bool)

(assert (=> d!71147 (=> res!193504 e!213846)))

(assert (=> d!71147 (= res!193504 (bvsge #b00000000000000000000000000000000 (size!9236 _keys!1895)))))

(assert (=> d!71147 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!213846)))

(declare-fun bm!26867 () Bool)

(assert (=> bm!26867 (= call!26870 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!71147 (not res!193504)) b!349106))

(assert (= (and b!349106 c!53192) b!349108))

(assert (= (and b!349106 (not c!53192)) b!349109))

(assert (= (and b!349108 res!193503) b!349107))

(assert (= (or b!349107 b!349109) bm!26867))

(assert (=> b!349106 m!349159))

(assert (=> b!349106 m!349159))

(assert (=> b!349106 m!349161))

(assert (=> b!349108 m!349159))

(declare-fun m!349171 () Bool)

(assert (=> b!349108 m!349171))

(declare-fun m!349173 () Bool)

(assert (=> b!349108 m!349173))

(assert (=> b!349108 m!349159))

(declare-fun m!349175 () Bool)

(assert (=> b!349108 m!349175))

(declare-fun m!349177 () Bool)

(assert (=> bm!26867 m!349177))

(assert (=> b!348977 d!71147))

(declare-fun d!71149 () Bool)

(declare-fun e!213851 () Bool)

(assert (=> d!71149 e!213851))

(declare-fun res!193507 () Bool)

(assert (=> d!71149 (=> res!193507 e!213851)))

(declare-fun lt!163905 () Bool)

(assert (=> d!71149 (= res!193507 (not lt!163905))))

(declare-fun lt!163906 () Bool)

(assert (=> d!71149 (= lt!163905 lt!163906)))

(declare-fun lt!163908 () Unit!10796)

(declare-fun e!213852 () Unit!10796)

(assert (=> d!71149 (= lt!163908 e!213852)))

(declare-fun c!53195 () Bool)

(assert (=> d!71149 (= c!53195 lt!163906)))

(declare-fun containsKey!336 (List!5128 (_ BitVec 64)) Bool)

(assert (=> d!71149 (= lt!163906 (containsKey!336 (toList!2224 (getCurrentListMap!1729 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71149 (= (contains!2301 (getCurrentListMap!1729 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163905)))

(declare-fun b!349116 () Bool)

(declare-fun lt!163907 () Unit!10796)

(assert (=> b!349116 (= e!213852 lt!163907)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!285 (List!5128 (_ BitVec 64)) Unit!10796)

(assert (=> b!349116 (= lt!163907 (lemmaContainsKeyImpliesGetValueByKeyDefined!285 (toList!2224 (getCurrentListMap!1729 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!350 0))(
  ( (Some!349 (v!6021 V!11099)) (None!348) )
))
(declare-fun isDefined!286 (Option!350) Bool)

(declare-fun getValueByKey!344 (List!5128 (_ BitVec 64)) Option!350)

(assert (=> b!349116 (isDefined!286 (getValueByKey!344 (toList!2224 (getCurrentListMap!1729 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!349117 () Bool)

(declare-fun Unit!10798 () Unit!10796)

(assert (=> b!349117 (= e!213852 Unit!10798)))

(declare-fun b!349118 () Bool)

(assert (=> b!349118 (= e!213851 (isDefined!286 (getValueByKey!344 (toList!2224 (getCurrentListMap!1729 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71149 c!53195) b!349116))

(assert (= (and d!71149 (not c!53195)) b!349117))

(assert (= (and d!71149 (not res!193507)) b!349118))

(declare-fun m!349179 () Bool)

(assert (=> d!71149 m!349179))

(declare-fun m!349181 () Bool)

(assert (=> b!349116 m!349181))

(declare-fun m!349183 () Bool)

(assert (=> b!349116 m!349183))

(assert (=> b!349116 m!349183))

(declare-fun m!349185 () Bool)

(assert (=> b!349116 m!349185))

(assert (=> b!349118 m!349183))

(assert (=> b!349118 m!349183))

(assert (=> b!349118 m!349185))

(assert (=> b!348969 d!71149))

(declare-fun b!349161 () Bool)

(declare-fun e!213879 () Bool)

(assert (=> b!349161 (= e!213879 (validKeyInArray!0 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349162 () Bool)

(declare-fun e!213884 () Bool)

(declare-fun e!213890 () Bool)

(assert (=> b!349162 (= e!213884 e!213890)))

(declare-fun res!193530 () Bool)

(declare-fun call!26891 () Bool)

(assert (=> b!349162 (= res!193530 call!26891)))

(assert (=> b!349162 (=> (not res!193530) (not e!213890))))

(declare-fun b!349163 () Bool)

(declare-fun lt!163959 () ListLongMap!4417)

(declare-fun apply!288 (ListLongMap!4417 (_ BitVec 64)) V!11099)

(assert (=> b!349163 (= e!213890 (= (apply!288 lt!163959 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!349164 () Bool)

(declare-fun res!193531 () Bool)

(declare-fun e!213886 () Bool)

(assert (=> b!349164 (=> (not res!193531) (not e!213886))))

(declare-fun e!213882 () Bool)

(assert (=> b!349164 (= res!193531 e!213882)))

(declare-fun res!193532 () Bool)

(assert (=> b!349164 (=> res!193532 e!213882)))

(declare-fun e!213880 () Bool)

(assert (=> b!349164 (= res!193532 (not e!213880))))

(declare-fun res!193526 () Bool)

(assert (=> b!349164 (=> (not res!193526) (not e!213880))))

(assert (=> b!349164 (= res!193526 (bvslt #b00000000000000000000000000000000 (size!9236 _keys!1895)))))

(declare-fun bm!26882 () Bool)

(declare-fun call!26888 () Bool)

(assert (=> bm!26882 (= call!26888 (contains!2301 lt!163959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26883 () Bool)

(declare-fun call!26886 () ListLongMap!4417)

(declare-fun call!26885 () ListLongMap!4417)

(assert (=> bm!26883 (= call!26886 call!26885)))

(declare-fun b!349165 () Bool)

(declare-fun e!213891 () ListLongMap!4417)

(declare-fun call!26890 () ListLongMap!4417)

(assert (=> b!349165 (= e!213891 call!26890)))

(declare-fun b!349166 () Bool)

(declare-fun e!213887 () ListLongMap!4417)

(declare-fun call!26889 () ListLongMap!4417)

(declare-fun +!741 (ListLongMap!4417 tuple2!5514) ListLongMap!4417)

(assert (=> b!349166 (= e!213887 (+!741 call!26889 (tuple2!5515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26884 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!604 (array!18749 array!18747 (_ BitVec 32) (_ BitVec 32) V!11099 V!11099 (_ BitVec 32) Int) ListLongMap!4417)

(assert (=> bm!26884 (= call!26885 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun call!26887 () ListLongMap!4417)

(declare-fun c!53209 () Bool)

(declare-fun c!53213 () Bool)

(declare-fun bm!26885 () Bool)

(assert (=> bm!26885 (= call!26889 (+!741 (ite c!53209 call!26885 (ite c!53213 call!26886 call!26887)) (ite (or c!53209 c!53213) (tuple2!5515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!349167 () Bool)

(declare-fun e!213888 () ListLongMap!4417)

(assert (=> b!349167 (= e!213887 e!213888)))

(assert (=> b!349167 (= c!53213 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!349168 () Bool)

(declare-fun e!213881 () Bool)

(assert (=> b!349168 (= e!213881 (= (apply!288 lt!163959 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!349169 () Bool)

(declare-fun e!213885 () Bool)

(assert (=> b!349169 (= e!213885 (not call!26888))))

(declare-fun b!349170 () Bool)

(assert (=> b!349170 (= e!213884 (not call!26891))))

(declare-fun b!349171 () Bool)

(assert (=> b!349171 (= e!213886 e!213884)))

(declare-fun c!53212 () Bool)

(assert (=> b!349171 (= c!53212 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!349172 () Bool)

(assert (=> b!349172 (= e!213880 (validKeyInArray!0 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71151 () Bool)

(assert (=> d!71151 e!213886))

(declare-fun res!193528 () Bool)

(assert (=> d!71151 (=> (not res!193528) (not e!213886))))

(assert (=> d!71151 (= res!193528 (or (bvsge #b00000000000000000000000000000000 (size!9236 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9236 _keys!1895)))))))

(declare-fun lt!163956 () ListLongMap!4417)

(assert (=> d!71151 (= lt!163959 lt!163956)))

(declare-fun lt!163969 () Unit!10796)

(declare-fun e!213883 () Unit!10796)

(assert (=> d!71151 (= lt!163969 e!213883)))

(declare-fun c!53211 () Bool)

(assert (=> d!71151 (= c!53211 e!213879)))

(declare-fun res!193527 () Bool)

(assert (=> d!71151 (=> (not res!193527) (not e!213879))))

(assert (=> d!71151 (= res!193527 (bvslt #b00000000000000000000000000000000 (size!9236 _keys!1895)))))

(assert (=> d!71151 (= lt!163956 e!213887)))

(assert (=> d!71151 (= c!53209 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71151 (validMask!0 mask!2385)))

(assert (=> d!71151 (= (getCurrentListMap!1729 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163959)))

(declare-fun b!349173 () Bool)

(declare-fun e!213889 () Bool)

(declare-fun get!4758 (ValueCell!3452 V!11099) V!11099)

(declare-fun dynLambda!622 (Int (_ BitVec 64)) V!11099)

(assert (=> b!349173 (= e!213889 (= (apply!288 lt!163959 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000)) (get!4758 (select (arr!8882 _values!1525) #b00000000000000000000000000000000) (dynLambda!622 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9235 _values!1525)))))

(assert (=> b!349173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9236 _keys!1895)))))

(declare-fun b!349174 () Bool)

(assert (=> b!349174 (= e!213882 e!213889)))

(declare-fun res!193534 () Bool)

(assert (=> b!349174 (=> (not res!193534) (not e!213889))))

(assert (=> b!349174 (= res!193534 (contains!2301 lt!163959 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!349174 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9236 _keys!1895)))))

(declare-fun b!349175 () Bool)

(assert (=> b!349175 (= e!213885 e!213881)))

(declare-fun res!193533 () Bool)

(assert (=> b!349175 (= res!193533 call!26888)))

(assert (=> b!349175 (=> (not res!193533) (not e!213881))))

(declare-fun b!349176 () Bool)

(declare-fun Unit!10799 () Unit!10796)

(assert (=> b!349176 (= e!213883 Unit!10799)))

(declare-fun b!349177 () Bool)

(declare-fun res!193529 () Bool)

(assert (=> b!349177 (=> (not res!193529) (not e!213886))))

(assert (=> b!349177 (= res!193529 e!213885)))

(declare-fun c!53210 () Bool)

(assert (=> b!349177 (= c!53210 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!349178 () Bool)

(assert (=> b!349178 (= e!213888 call!26890)))

(declare-fun bm!26886 () Bool)

(assert (=> bm!26886 (= call!26891 (contains!2301 lt!163959 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26887 () Bool)

(assert (=> bm!26887 (= call!26887 call!26886)))

(declare-fun b!349179 () Bool)

(assert (=> b!349179 (= e!213891 call!26887)))

(declare-fun bm!26888 () Bool)

(assert (=> bm!26888 (= call!26890 call!26889)))

(declare-fun b!349180 () Bool)

(declare-fun c!53208 () Bool)

(assert (=> b!349180 (= c!53208 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!349180 (= e!213888 e!213891)))

(declare-fun b!349181 () Bool)

(declare-fun lt!163961 () Unit!10796)

(assert (=> b!349181 (= e!213883 lt!163961)))

(declare-fun lt!163962 () ListLongMap!4417)

(assert (=> b!349181 (= lt!163962 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163965 () (_ BitVec 64))

(assert (=> b!349181 (= lt!163965 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163955 () (_ BitVec 64))

(assert (=> b!349181 (= lt!163955 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163972 () Unit!10796)

(declare-fun addStillContains!264 (ListLongMap!4417 (_ BitVec 64) V!11099 (_ BitVec 64)) Unit!10796)

(assert (=> b!349181 (= lt!163972 (addStillContains!264 lt!163962 lt!163965 zeroValue!1467 lt!163955))))

(assert (=> b!349181 (contains!2301 (+!741 lt!163962 (tuple2!5515 lt!163965 zeroValue!1467)) lt!163955)))

(declare-fun lt!163974 () Unit!10796)

(assert (=> b!349181 (= lt!163974 lt!163972)))

(declare-fun lt!163966 () ListLongMap!4417)

(assert (=> b!349181 (= lt!163966 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163964 () (_ BitVec 64))

(assert (=> b!349181 (= lt!163964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163967 () (_ BitVec 64))

(assert (=> b!349181 (= lt!163967 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163954 () Unit!10796)

(declare-fun addApplyDifferent!264 (ListLongMap!4417 (_ BitVec 64) V!11099 (_ BitVec 64)) Unit!10796)

(assert (=> b!349181 (= lt!163954 (addApplyDifferent!264 lt!163966 lt!163964 minValue!1467 lt!163967))))

(assert (=> b!349181 (= (apply!288 (+!741 lt!163966 (tuple2!5515 lt!163964 minValue!1467)) lt!163967) (apply!288 lt!163966 lt!163967))))

(declare-fun lt!163970 () Unit!10796)

(assert (=> b!349181 (= lt!163970 lt!163954)))

(declare-fun lt!163968 () ListLongMap!4417)

(assert (=> b!349181 (= lt!163968 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163953 () (_ BitVec 64))

(assert (=> b!349181 (= lt!163953 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163963 () (_ BitVec 64))

(assert (=> b!349181 (= lt!163963 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163957 () Unit!10796)

(assert (=> b!349181 (= lt!163957 (addApplyDifferent!264 lt!163968 lt!163953 zeroValue!1467 lt!163963))))

(assert (=> b!349181 (= (apply!288 (+!741 lt!163968 (tuple2!5515 lt!163953 zeroValue!1467)) lt!163963) (apply!288 lt!163968 lt!163963))))

(declare-fun lt!163973 () Unit!10796)

(assert (=> b!349181 (= lt!163973 lt!163957)))

(declare-fun lt!163971 () ListLongMap!4417)

(assert (=> b!349181 (= lt!163971 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163960 () (_ BitVec 64))

(assert (=> b!349181 (= lt!163960 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163958 () (_ BitVec 64))

(assert (=> b!349181 (= lt!163958 (select (arr!8883 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!349181 (= lt!163961 (addApplyDifferent!264 lt!163971 lt!163960 minValue!1467 lt!163958))))

(assert (=> b!349181 (= (apply!288 (+!741 lt!163971 (tuple2!5515 lt!163960 minValue!1467)) lt!163958) (apply!288 lt!163971 lt!163958))))

(assert (= (and d!71151 c!53209) b!349166))

(assert (= (and d!71151 (not c!53209)) b!349167))

(assert (= (and b!349167 c!53213) b!349178))

(assert (= (and b!349167 (not c!53213)) b!349180))

(assert (= (and b!349180 c!53208) b!349165))

(assert (= (and b!349180 (not c!53208)) b!349179))

(assert (= (or b!349165 b!349179) bm!26887))

(assert (= (or b!349178 bm!26887) bm!26883))

(assert (= (or b!349178 b!349165) bm!26888))

(assert (= (or b!349166 bm!26883) bm!26884))

(assert (= (or b!349166 bm!26888) bm!26885))

(assert (= (and d!71151 res!193527) b!349161))

(assert (= (and d!71151 c!53211) b!349181))

(assert (= (and d!71151 (not c!53211)) b!349176))

(assert (= (and d!71151 res!193528) b!349164))

(assert (= (and b!349164 res!193526) b!349172))

(assert (= (and b!349164 (not res!193532)) b!349174))

(assert (= (and b!349174 res!193534) b!349173))

(assert (= (and b!349164 res!193531) b!349177))

(assert (= (and b!349177 c!53210) b!349175))

(assert (= (and b!349177 (not c!53210)) b!349169))

(assert (= (and b!349175 res!193533) b!349168))

(assert (= (or b!349175 b!349169) bm!26882))

(assert (= (and b!349177 res!193529) b!349171))

(assert (= (and b!349171 c!53212) b!349162))

(assert (= (and b!349171 (not c!53212)) b!349170))

(assert (= (and b!349162 res!193530) b!349163))

(assert (= (or b!349162 b!349170) bm!26886))

(declare-fun b_lambda!8473 () Bool)

(assert (=> (not b_lambda!8473) (not b!349173)))

(declare-fun t!10254 () Bool)

(declare-fun tb!3083 () Bool)

(assert (=> (and start!34862 (= defaultEntry!1528 defaultEntry!1528) t!10254) tb!3083))

(declare-fun result!5595 () Bool)

(assert (=> tb!3083 (= result!5595 tp_is_empty!7591)))

(assert (=> b!349173 t!10254))

(declare-fun b_and!14843 () Bool)

(assert (= b_and!14837 (and (=> t!10254 result!5595) b_and!14843)))

(declare-fun m!349187 () Bool)

(assert (=> b!349166 m!349187))

(assert (=> b!349172 m!349159))

(assert (=> b!349172 m!349159))

(assert (=> b!349172 m!349161))

(assert (=> b!349174 m!349159))

(assert (=> b!349174 m!349159))

(declare-fun m!349189 () Bool)

(assert (=> b!349174 m!349189))

(declare-fun m!349191 () Bool)

(assert (=> bm!26884 m!349191))

(declare-fun m!349193 () Bool)

(assert (=> b!349163 m!349193))

(declare-fun m!349195 () Bool)

(assert (=> b!349181 m!349195))

(declare-fun m!349197 () Bool)

(assert (=> b!349181 m!349197))

(declare-fun m!349199 () Bool)

(assert (=> b!349181 m!349199))

(declare-fun m!349201 () Bool)

(assert (=> b!349181 m!349201))

(declare-fun m!349203 () Bool)

(assert (=> b!349181 m!349203))

(assert (=> b!349181 m!349191))

(declare-fun m!349205 () Bool)

(assert (=> b!349181 m!349205))

(declare-fun m!349207 () Bool)

(assert (=> b!349181 m!349207))

(declare-fun m!349209 () Bool)

(assert (=> b!349181 m!349209))

(declare-fun m!349211 () Bool)

(assert (=> b!349181 m!349211))

(declare-fun m!349213 () Bool)

(assert (=> b!349181 m!349213))

(declare-fun m!349215 () Bool)

(assert (=> b!349181 m!349215))

(declare-fun m!349217 () Bool)

(assert (=> b!349181 m!349217))

(declare-fun m!349219 () Bool)

(assert (=> b!349181 m!349219))

(assert (=> b!349181 m!349159))

(assert (=> b!349181 m!349213))

(assert (=> b!349181 m!349199))

(assert (=> b!349181 m!349195))

(assert (=> b!349181 m!349209))

(declare-fun m!349221 () Bool)

(assert (=> b!349181 m!349221))

(declare-fun m!349223 () Bool)

(assert (=> b!349181 m!349223))

(declare-fun m!349225 () Bool)

(assert (=> bm!26886 m!349225))

(assert (=> b!349161 m!349159))

(assert (=> b!349161 m!349159))

(assert (=> b!349161 m!349161))

(declare-fun m!349227 () Bool)

(assert (=> b!349168 m!349227))

(declare-fun m!349229 () Bool)

(assert (=> bm!26885 m!349229))

(assert (=> d!71151 m!349073))

(declare-fun m!349231 () Bool)

(assert (=> b!349173 m!349231))

(declare-fun m!349233 () Bool)

(assert (=> b!349173 m!349233))

(assert (=> b!349173 m!349231))

(declare-fun m!349235 () Bool)

(assert (=> b!349173 m!349235))

(assert (=> b!349173 m!349159))

(declare-fun m!349237 () Bool)

(assert (=> b!349173 m!349237))

(assert (=> b!349173 m!349159))

(assert (=> b!349173 m!349233))

(declare-fun m!349239 () Bool)

(assert (=> bm!26882 m!349239))

(assert (=> b!348969 d!71151))

(declare-fun d!71153 () Bool)

(declare-fun res!193535 () Bool)

(declare-fun e!213892 () Bool)

(assert (=> d!71153 (=> res!193535 e!213892)))

(assert (=> d!71153 (= res!193535 (= (select (arr!8883 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71153 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!213892)))

(declare-fun b!349184 () Bool)

(declare-fun e!213893 () Bool)

(assert (=> b!349184 (= e!213892 e!213893)))

(declare-fun res!193536 () Bool)

(assert (=> b!349184 (=> (not res!193536) (not e!213893))))

(assert (=> b!349184 (= res!193536 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9236 _keys!1895)))))

(declare-fun b!349185 () Bool)

(assert (=> b!349185 (= e!213893 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71153 (not res!193535)) b!349184))

(assert (= (and b!349184 res!193536) b!349185))

(assert (=> d!71153 m!349159))

(declare-fun m!349241 () Bool)

(assert (=> b!349185 m!349241))

(assert (=> b!348972 d!71153))

(declare-fun d!71155 () Bool)

(assert (=> d!71155 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34862 d!71155))

(declare-fun d!71157 () Bool)

(assert (=> d!71157 (= (array_inv!6588 _values!1525) (bvsge (size!9235 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34862 d!71157))

(declare-fun d!71159 () Bool)

(assert (=> d!71159 (= (array_inv!6589 _keys!1895) (bvsge (size!9236 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34862 d!71159))

(declare-fun b!349192 () Bool)

(declare-fun e!213898 () Bool)

(assert (=> b!349192 (= e!213898 tp_is_empty!7591)))

(declare-fun b!349193 () Bool)

(declare-fun e!213899 () Bool)

(assert (=> b!349193 (= e!213899 tp_is_empty!7591)))

(declare-fun condMapEmpty!12858 () Bool)

(declare-fun mapDefault!12858 () ValueCell!3452)

(assert (=> mapNonEmpty!12849 (= condMapEmpty!12858 (= mapRest!12849 ((as const (Array (_ BitVec 32) ValueCell!3452)) mapDefault!12858)))))

(declare-fun mapRes!12858 () Bool)

(assert (=> mapNonEmpty!12849 (= tp!26487 (and e!213899 mapRes!12858))))

(declare-fun mapIsEmpty!12858 () Bool)

(assert (=> mapIsEmpty!12858 mapRes!12858))

(declare-fun mapNonEmpty!12858 () Bool)

(declare-fun tp!26502 () Bool)

(assert (=> mapNonEmpty!12858 (= mapRes!12858 (and tp!26502 e!213898))))

(declare-fun mapValue!12858 () ValueCell!3452)

(declare-fun mapRest!12858 () (Array (_ BitVec 32) ValueCell!3452))

(declare-fun mapKey!12858 () (_ BitVec 32))

(assert (=> mapNonEmpty!12858 (= mapRest!12849 (store mapRest!12858 mapKey!12858 mapValue!12858))))

(assert (= (and mapNonEmpty!12849 condMapEmpty!12858) mapIsEmpty!12858))

(assert (= (and mapNonEmpty!12849 (not condMapEmpty!12858)) mapNonEmpty!12858))

(assert (= (and mapNonEmpty!12858 ((_ is ValueCellFull!3452) mapValue!12858)) b!349192))

(assert (= (and mapNonEmpty!12849 ((_ is ValueCellFull!3452) mapDefault!12858)) b!349193))

(declare-fun m!349243 () Bool)

(assert (=> mapNonEmpty!12858 m!349243))

(declare-fun b_lambda!8475 () Bool)

(assert (= b_lambda!8473 (or (and start!34862 b_free!7639) b_lambda!8475)))

(check-sat (not bm!26886) (not b_lambda!8475) (not b!349161) (not b!349106) (not b!349181) (not b!349091) (not d!71137) (not d!71151) (not bm!26882) (not b!349163) (not b!349168) b_and!14843 (not b!349089) (not bm!26867) (not b!349173) (not b!349174) (not b!349116) (not b!349090) (not b!349166) (not bm!26884) (not b!349065) (not b!349118) (not bm!26864) (not b!349108) (not bm!26885) (not b!349076) (not mapNonEmpty!12858) (not b!349097) (not b_next!7639) (not b!349185) (not b!349172) tp_is_empty!7591 (not d!71149))
(check-sat b_and!14843 (not b_next!7639))
