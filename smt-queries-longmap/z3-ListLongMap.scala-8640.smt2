; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105144 () Bool)

(assert start!105144)

(declare-fun b_free!26877 () Bool)

(declare-fun b_next!26877 () Bool)

(assert (=> start!105144 (= b_free!26877 (not b_next!26877))))

(declare-fun tp!94132 () Bool)

(declare-fun b_and!44681 () Bool)

(assert (=> start!105144 (= tp!94132 b_and!44681)))

(declare-fun b!1252992 () Bool)

(declare-fun e!711755 () Bool)

(declare-fun tp_is_empty!31779 () Bool)

(assert (=> b!1252992 (= e!711755 tp_is_empty!31779)))

(declare-fun b!1252993 () Bool)

(declare-fun e!711757 () Bool)

(declare-datatypes ((array!81218 0))(
  ( (array!81219 (arr!39172 (Array (_ BitVec 32) (_ BitVec 64))) (size!39708 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81218)

(assert (=> b!1252993 (= e!711757 (bvsle #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!47737 0))(
  ( (V!47738 (val!15952 Int)) )
))
(declare-fun zeroValue!871 () V!47737)

(declare-datatypes ((ValueCell!15126 0))(
  ( (ValueCellFull!15126 (v!18650 V!47737)) (EmptyCell!15126) )
))
(declare-datatypes ((array!81220 0))(
  ( (array!81221 (arr!39173 (Array (_ BitVec 32) ValueCell!15126)) (size!39709 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81220)

(declare-datatypes ((tuple2!20582 0))(
  ( (tuple2!20583 (_1!10302 (_ BitVec 64)) (_2!10302 V!47737)) )
))
(declare-datatypes ((List!27814 0))(
  ( (Nil!27811) (Cons!27810 (h!29019 tuple2!20582) (t!41293 List!27814)) )
))
(declare-datatypes ((ListLongMap!18455 0))(
  ( (ListLongMap!18456 (toList!9243 List!27814)) )
))
(declare-fun lt!565610 () ListLongMap!18455)

(declare-fun minValueBefore!43 () V!47737)

(declare-fun getCurrentListMap!4488 (array!81218 array!81220 (_ BitVec 32) (_ BitVec 32) V!47737 V!47737 (_ BitVec 32) Int) ListLongMap!18455)

(assert (=> b!1252993 (= lt!565610 (getCurrentListMap!4488 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252995 () Bool)

(declare-fun res!835578 () Bool)

(declare-fun e!711754 () Bool)

(assert (=> b!1252995 (=> (not res!835578) (not e!711754))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252995 (= res!835578 (and (= (size!39709 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39708 _keys!1118) (size!39709 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252996 () Bool)

(declare-fun e!711756 () Bool)

(assert (=> b!1252996 (= e!711756 tp_is_empty!31779)))

(declare-fun mapNonEmpty!49441 () Bool)

(declare-fun mapRes!49441 () Bool)

(declare-fun tp!94133 () Bool)

(assert (=> mapNonEmpty!49441 (= mapRes!49441 (and tp!94133 e!711756))))

(declare-fun mapKey!49441 () (_ BitVec 32))

(declare-fun mapValue!49441 () ValueCell!15126)

(declare-fun mapRest!49441 () (Array (_ BitVec 32) ValueCell!15126))

(assert (=> mapNonEmpty!49441 (= (arr!39173 _values!914) (store mapRest!49441 mapKey!49441 mapValue!49441))))

(declare-fun b!1252997 () Bool)

(declare-fun res!835579 () Bool)

(assert (=> b!1252997 (=> (not res!835579) (not e!711754))))

(declare-datatypes ((List!27815 0))(
  ( (Nil!27812) (Cons!27811 (h!29020 (_ BitVec 64)) (t!41294 List!27815)) )
))
(declare-fun arrayNoDuplicates!0 (array!81218 (_ BitVec 32) List!27815) Bool)

(assert (=> b!1252997 (= res!835579 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27812))))

(declare-fun b!1252998 () Bool)

(assert (=> b!1252998 (= e!711754 (not e!711757))))

(declare-fun res!835582 () Bool)

(assert (=> b!1252998 (=> res!835582 e!711757)))

(assert (=> b!1252998 (= res!835582 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565609 () ListLongMap!18455)

(declare-fun lt!565608 () ListLongMap!18455)

(assert (=> b!1252998 (= lt!565609 lt!565608)))

(declare-fun minValueAfter!43 () V!47737)

(declare-datatypes ((Unit!41671 0))(
  ( (Unit!41672) )
))
(declare-fun lt!565607 () Unit!41671)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1001 (array!81218 array!81220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47737 V!47737 V!47737 V!47737 (_ BitVec 32) Int) Unit!41671)

(assert (=> b!1252998 (= lt!565607 (lemmaNoChangeToArrayThenSameMapNoExtras!1001 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5637 (array!81218 array!81220 (_ BitVec 32) (_ BitVec 32) V!47737 V!47737 (_ BitVec 32) Int) ListLongMap!18455)

(assert (=> b!1252998 (= lt!565608 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252998 (= lt!565609 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252999 () Bool)

(declare-fun res!835581 () Bool)

(assert (=> b!1252999 (=> (not res!835581) (not e!711754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81218 (_ BitVec 32)) Bool)

(assert (=> b!1252999 (= res!835581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49441 () Bool)

(assert (=> mapIsEmpty!49441 mapRes!49441))

(declare-fun res!835580 () Bool)

(assert (=> start!105144 (=> (not res!835580) (not e!711754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105144 (= res!835580 (validMask!0 mask!1466))))

(assert (=> start!105144 e!711754))

(assert (=> start!105144 true))

(assert (=> start!105144 tp!94132))

(assert (=> start!105144 tp_is_empty!31779))

(declare-fun array_inv!29871 (array!81218) Bool)

(assert (=> start!105144 (array_inv!29871 _keys!1118)))

(declare-fun e!711753 () Bool)

(declare-fun array_inv!29872 (array!81220) Bool)

(assert (=> start!105144 (and (array_inv!29872 _values!914) e!711753)))

(declare-fun b!1252994 () Bool)

(assert (=> b!1252994 (= e!711753 (and e!711755 mapRes!49441))))

(declare-fun condMapEmpty!49441 () Bool)

(declare-fun mapDefault!49441 () ValueCell!15126)

(assert (=> b!1252994 (= condMapEmpty!49441 (= (arr!39173 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15126)) mapDefault!49441)))))

(assert (= (and start!105144 res!835580) b!1252995))

(assert (= (and b!1252995 res!835578) b!1252999))

(assert (= (and b!1252999 res!835581) b!1252997))

(assert (= (and b!1252997 res!835579) b!1252998))

(assert (= (and b!1252998 (not res!835582)) b!1252993))

(assert (= (and b!1252994 condMapEmpty!49441) mapIsEmpty!49441))

(assert (= (and b!1252994 (not condMapEmpty!49441)) mapNonEmpty!49441))

(get-info :version)

(assert (= (and mapNonEmpty!49441 ((_ is ValueCellFull!15126) mapValue!49441)) b!1252996))

(assert (= (and b!1252994 ((_ is ValueCellFull!15126) mapDefault!49441)) b!1252992))

(assert (= start!105144 b!1252994))

(declare-fun m!1153525 () Bool)

(assert (=> b!1252999 m!1153525))

(declare-fun m!1153527 () Bool)

(assert (=> b!1252998 m!1153527))

(declare-fun m!1153529 () Bool)

(assert (=> b!1252998 m!1153529))

(declare-fun m!1153531 () Bool)

(assert (=> b!1252998 m!1153531))

(declare-fun m!1153533 () Bool)

(assert (=> b!1252993 m!1153533))

(declare-fun m!1153535 () Bool)

(assert (=> b!1252997 m!1153535))

(declare-fun m!1153537 () Bool)

(assert (=> mapNonEmpty!49441 m!1153537))

(declare-fun m!1153539 () Bool)

(assert (=> start!105144 m!1153539))

(declare-fun m!1153541 () Bool)

(assert (=> start!105144 m!1153541))

(declare-fun m!1153543 () Bool)

(assert (=> start!105144 m!1153543))

(check-sat b_and!44681 tp_is_empty!31779 (not mapNonEmpty!49441) (not start!105144) (not b_next!26877) (not b!1252998) (not b!1252997) (not b!1252993) (not b!1252999))
(check-sat b_and!44681 (not b_next!26877))
(get-model)

(declare-fun d!138019 () Bool)

(assert (=> d!138019 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105144 d!138019))

(declare-fun d!138021 () Bool)

(assert (=> d!138021 (= (array_inv!29871 _keys!1118) (bvsge (size!39708 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105144 d!138021))

(declare-fun d!138023 () Bool)

(assert (=> d!138023 (= (array_inv!29872 _values!914) (bvsge (size!39709 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105144 d!138023))

(declare-fun d!138025 () Bool)

(declare-fun res!835603 () Bool)

(declare-fun e!711784 () Bool)

(assert (=> d!138025 (=> res!835603 e!711784)))

(assert (=> d!138025 (= res!835603 (bvsge #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(assert (=> d!138025 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!711784)))

(declare-fun b!1253032 () Bool)

(declare-fun e!711785 () Bool)

(declare-fun e!711783 () Bool)

(assert (=> b!1253032 (= e!711785 e!711783)))

(declare-fun lt!565629 () (_ BitVec 64))

(assert (=> b!1253032 (= lt!565629 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565630 () Unit!41671)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81218 (_ BitVec 64) (_ BitVec 32)) Unit!41671)

(assert (=> b!1253032 (= lt!565630 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!565629 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1253032 (arrayContainsKey!0 _keys!1118 lt!565629 #b00000000000000000000000000000000)))

(declare-fun lt!565631 () Unit!41671)

(assert (=> b!1253032 (= lt!565631 lt!565630)))

(declare-fun res!835602 () Bool)

(declare-datatypes ((SeekEntryResult!9962 0))(
  ( (MissingZero!9962 (index!42219 (_ BitVec 32))) (Found!9962 (index!42220 (_ BitVec 32))) (Intermediate!9962 (undefined!10774 Bool) (index!42221 (_ BitVec 32)) (x!110281 (_ BitVec 32))) (Undefined!9962) (MissingVacant!9962 (index!42222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81218 (_ BitVec 32)) SeekEntryResult!9962)

(assert (=> b!1253032 (= res!835602 (= (seekEntryOrOpen!0 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9962 #b00000000000000000000000000000000)))))

(assert (=> b!1253032 (=> (not res!835602) (not e!711783))))

(declare-fun b!1253033 () Bool)

(declare-fun call!61663 () Bool)

(assert (=> b!1253033 (= e!711785 call!61663)))

(declare-fun b!1253034 () Bool)

(assert (=> b!1253034 (= e!711784 e!711785)))

(declare-fun c!122257 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1253034 (= c!122257 (validKeyInArray!0 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253035 () Bool)

(assert (=> b!1253035 (= e!711783 call!61663)))

(declare-fun bm!61660 () Bool)

(assert (=> bm!61660 (= call!61663 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138025 (not res!835603)) b!1253034))

(assert (= (and b!1253034 c!122257) b!1253032))

(assert (= (and b!1253034 (not c!122257)) b!1253033))

(assert (= (and b!1253032 res!835602) b!1253035))

(assert (= (or b!1253035 b!1253033) bm!61660))

(declare-fun m!1153565 () Bool)

(assert (=> b!1253032 m!1153565))

(declare-fun m!1153567 () Bool)

(assert (=> b!1253032 m!1153567))

(declare-fun m!1153569 () Bool)

(assert (=> b!1253032 m!1153569))

(assert (=> b!1253032 m!1153565))

(declare-fun m!1153571 () Bool)

(assert (=> b!1253032 m!1153571))

(assert (=> b!1253034 m!1153565))

(assert (=> b!1253034 m!1153565))

(declare-fun m!1153573 () Bool)

(assert (=> b!1253034 m!1153573))

(declare-fun m!1153575 () Bool)

(assert (=> bm!61660 m!1153575))

(assert (=> b!1252999 d!138025))

(declare-fun d!138027 () Bool)

(assert (=> d!138027 (= (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565634 () Unit!41671)

(declare-fun choose!1852 (array!81218 array!81220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47737 V!47737 V!47737 V!47737 (_ BitVec 32) Int) Unit!41671)

(assert (=> d!138027 (= lt!565634 (choose!1852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138027 (validMask!0 mask!1466)))

(assert (=> d!138027 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1001 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565634)))

(declare-fun bs!35395 () Bool)

(assert (= bs!35395 d!138027))

(assert (=> bs!35395 m!1153531))

(assert (=> bs!35395 m!1153529))

(declare-fun m!1153577 () Bool)

(assert (=> bs!35395 m!1153577))

(assert (=> bs!35395 m!1153539))

(assert (=> b!1252998 d!138027))

(declare-fun b!1253060 () Bool)

(declare-fun lt!565654 () Unit!41671)

(declare-fun lt!565651 () Unit!41671)

(assert (=> b!1253060 (= lt!565654 lt!565651)))

(declare-fun lt!565655 () (_ BitVec 64))

(declare-fun lt!565653 () ListLongMap!18455)

(declare-fun lt!565650 () V!47737)

(declare-fun lt!565649 () (_ BitVec 64))

(declare-fun contains!7515 (ListLongMap!18455 (_ BitVec 64)) Bool)

(declare-fun +!4140 (ListLongMap!18455 tuple2!20582) ListLongMap!18455)

(assert (=> b!1253060 (not (contains!7515 (+!4140 lt!565653 (tuple2!20583 lt!565649 lt!565650)) lt!565655))))

(declare-fun addStillNotContains!312 (ListLongMap!18455 (_ BitVec 64) V!47737 (_ BitVec 64)) Unit!41671)

(assert (=> b!1253060 (= lt!565651 (addStillNotContains!312 lt!565653 lt!565649 lt!565650 lt!565655))))

(assert (=> b!1253060 (= lt!565655 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20061 (ValueCell!15126 V!47737) V!47737)

(declare-fun dynLambda!3382 (Int (_ BitVec 64)) V!47737)

(assert (=> b!1253060 (= lt!565650 (get!20061 (select (arr!39173 _values!914) #b00000000000000000000000000000000) (dynLambda!3382 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1253060 (= lt!565649 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61666 () ListLongMap!18455)

(assert (=> b!1253060 (= lt!565653 call!61666)))

(declare-fun e!711806 () ListLongMap!18455)

(assert (=> b!1253060 (= e!711806 (+!4140 call!61666 (tuple2!20583 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000) (get!20061 (select (arr!39173 _values!914) #b00000000000000000000000000000000) (dynLambda!3382 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1253061 () Bool)

(declare-fun e!711803 () Bool)

(declare-fun e!711802 () Bool)

(assert (=> b!1253061 (= e!711803 e!711802)))

(declare-fun c!122269 () Bool)

(declare-fun e!711804 () Bool)

(assert (=> b!1253061 (= c!122269 e!711804)))

(declare-fun res!835614 () Bool)

(assert (=> b!1253061 (=> (not res!835614) (not e!711804))))

(assert (=> b!1253061 (= res!835614 (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(declare-fun b!1253062 () Bool)

(declare-fun e!711801 () Bool)

(assert (=> b!1253062 (= e!711802 e!711801)))

(declare-fun c!122266 () Bool)

(assert (=> b!1253062 (= c!122266 (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(declare-fun b!1253063 () Bool)

(assert (=> b!1253063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(assert (=> b!1253063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39709 _values!914)))))

(declare-fun e!711805 () Bool)

(declare-fun lt!565652 () ListLongMap!18455)

(declare-fun apply!984 (ListLongMap!18455 (_ BitVec 64)) V!47737)

(assert (=> b!1253063 (= e!711805 (= (apply!984 lt!565652 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)) (get!20061 (select (arr!39173 _values!914) #b00000000000000000000000000000000) (dynLambda!3382 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1253064 () Bool)

(assert (=> b!1253064 (= e!711804 (validKeyInArray!0 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253064 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1253066 () Bool)

(assert (=> b!1253066 (= e!711802 e!711805)))

(assert (=> b!1253066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(declare-fun res!835615 () Bool)

(assert (=> b!1253066 (= res!835615 (contains!7515 lt!565652 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253066 (=> (not res!835615) (not e!711805))))

(declare-fun b!1253067 () Bool)

(declare-fun e!711800 () ListLongMap!18455)

(assert (=> b!1253067 (= e!711800 e!711806)))

(declare-fun c!122268 () Bool)

(assert (=> b!1253067 (= c!122268 (validKeyInArray!0 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253068 () Bool)

(assert (=> b!1253068 (= e!711800 (ListLongMap!18456 Nil!27811))))

(declare-fun b!1253069 () Bool)

(assert (=> b!1253069 (= e!711801 (= lt!565652 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!61663 () Bool)

(assert (=> bm!61663 (= call!61666 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1253070 () Bool)

(assert (=> b!1253070 (= e!711806 call!61666)))

(declare-fun b!1253071 () Bool)

(declare-fun res!835613 () Bool)

(assert (=> b!1253071 (=> (not res!835613) (not e!711803))))

(assert (=> b!1253071 (= res!835613 (not (contains!7515 lt!565652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1253065 () Bool)

(declare-fun isEmpty!1026 (ListLongMap!18455) Bool)

(assert (=> b!1253065 (= e!711801 (isEmpty!1026 lt!565652))))

(declare-fun d!138029 () Bool)

(assert (=> d!138029 e!711803))

(declare-fun res!835612 () Bool)

(assert (=> d!138029 (=> (not res!835612) (not e!711803))))

(assert (=> d!138029 (= res!835612 (not (contains!7515 lt!565652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138029 (= lt!565652 e!711800)))

(declare-fun c!122267 () Bool)

(assert (=> d!138029 (= c!122267 (bvsge #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(assert (=> d!138029 (validMask!0 mask!1466)))

(assert (=> d!138029 (= (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565652)))

(assert (= (and d!138029 c!122267) b!1253068))

(assert (= (and d!138029 (not c!122267)) b!1253067))

(assert (= (and b!1253067 c!122268) b!1253060))

(assert (= (and b!1253067 (not c!122268)) b!1253070))

(assert (= (or b!1253060 b!1253070) bm!61663))

(assert (= (and d!138029 res!835612) b!1253071))

(assert (= (and b!1253071 res!835613) b!1253061))

(assert (= (and b!1253061 res!835614) b!1253064))

(assert (= (and b!1253061 c!122269) b!1253066))

(assert (= (and b!1253061 (not c!122269)) b!1253062))

(assert (= (and b!1253066 res!835615) b!1253063))

(assert (= (and b!1253062 c!122266) b!1253069))

(assert (= (and b!1253062 (not c!122266)) b!1253065))

(declare-fun b_lambda!22583 () Bool)

(assert (=> (not b_lambda!22583) (not b!1253060)))

(declare-fun t!41296 () Bool)

(declare-fun tb!11295 () Bool)

(assert (=> (and start!105144 (= defaultEntry!922 defaultEntry!922) t!41296) tb!11295))

(declare-fun result!23293 () Bool)

(assert (=> tb!11295 (= result!23293 tp_is_empty!31779)))

(assert (=> b!1253060 t!41296))

(declare-fun b_and!44685 () Bool)

(assert (= b_and!44681 (and (=> t!41296 result!23293) b_and!44685)))

(declare-fun b_lambda!22585 () Bool)

(assert (=> (not b_lambda!22585) (not b!1253063)))

(assert (=> b!1253063 t!41296))

(declare-fun b_and!44687 () Bool)

(assert (= b_and!44685 (and (=> t!41296 result!23293) b_and!44687)))

(declare-fun m!1153579 () Bool)

(assert (=> b!1253063 m!1153579))

(assert (=> b!1253063 m!1153565))

(declare-fun m!1153581 () Bool)

(assert (=> b!1253063 m!1153581))

(assert (=> b!1253063 m!1153565))

(assert (=> b!1253063 m!1153579))

(declare-fun m!1153583 () Bool)

(assert (=> b!1253063 m!1153583))

(declare-fun m!1153585 () Bool)

(assert (=> b!1253063 m!1153585))

(assert (=> b!1253063 m!1153583))

(declare-fun m!1153587 () Bool)

(assert (=> d!138029 m!1153587))

(assert (=> d!138029 m!1153539))

(declare-fun m!1153589 () Bool)

(assert (=> bm!61663 m!1153589))

(declare-fun m!1153591 () Bool)

(assert (=> b!1253065 m!1153591))

(declare-fun m!1153593 () Bool)

(assert (=> b!1253060 m!1153593))

(assert (=> b!1253060 m!1153579))

(assert (=> b!1253060 m!1153565))

(assert (=> b!1253060 m!1153579))

(assert (=> b!1253060 m!1153583))

(assert (=> b!1253060 m!1153585))

(declare-fun m!1153595 () Bool)

(assert (=> b!1253060 m!1153595))

(assert (=> b!1253060 m!1153593))

(declare-fun m!1153597 () Bool)

(assert (=> b!1253060 m!1153597))

(declare-fun m!1153599 () Bool)

(assert (=> b!1253060 m!1153599))

(assert (=> b!1253060 m!1153583))

(declare-fun m!1153601 () Bool)

(assert (=> b!1253071 m!1153601))

(assert (=> b!1253064 m!1153565))

(assert (=> b!1253064 m!1153565))

(assert (=> b!1253064 m!1153573))

(assert (=> b!1253066 m!1153565))

(assert (=> b!1253066 m!1153565))

(declare-fun m!1153603 () Bool)

(assert (=> b!1253066 m!1153603))

(assert (=> b!1253069 m!1153589))

(assert (=> b!1253067 m!1153565))

(assert (=> b!1253067 m!1153565))

(assert (=> b!1253067 m!1153573))

(assert (=> b!1252998 d!138029))

(declare-fun b!1253074 () Bool)

(declare-fun lt!565661 () Unit!41671)

(declare-fun lt!565658 () Unit!41671)

(assert (=> b!1253074 (= lt!565661 lt!565658)))

(declare-fun lt!565656 () (_ BitVec 64))

(declare-fun lt!565660 () ListLongMap!18455)

(declare-fun lt!565657 () V!47737)

(declare-fun lt!565662 () (_ BitVec 64))

(assert (=> b!1253074 (not (contains!7515 (+!4140 lt!565660 (tuple2!20583 lt!565656 lt!565657)) lt!565662))))

(assert (=> b!1253074 (= lt!565658 (addStillNotContains!312 lt!565660 lt!565656 lt!565657 lt!565662))))

(assert (=> b!1253074 (= lt!565662 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1253074 (= lt!565657 (get!20061 (select (arr!39173 _values!914) #b00000000000000000000000000000000) (dynLambda!3382 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1253074 (= lt!565656 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61667 () ListLongMap!18455)

(assert (=> b!1253074 (= lt!565660 call!61667)))

(declare-fun e!711813 () ListLongMap!18455)

(assert (=> b!1253074 (= e!711813 (+!4140 call!61667 (tuple2!20583 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000) (get!20061 (select (arr!39173 _values!914) #b00000000000000000000000000000000) (dynLambda!3382 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1253075 () Bool)

(declare-fun e!711810 () Bool)

(declare-fun e!711809 () Bool)

(assert (=> b!1253075 (= e!711810 e!711809)))

(declare-fun c!122273 () Bool)

(declare-fun e!711811 () Bool)

(assert (=> b!1253075 (= c!122273 e!711811)))

(declare-fun res!835618 () Bool)

(assert (=> b!1253075 (=> (not res!835618) (not e!711811))))

(assert (=> b!1253075 (= res!835618 (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(declare-fun b!1253076 () Bool)

(declare-fun e!711808 () Bool)

(assert (=> b!1253076 (= e!711809 e!711808)))

(declare-fun c!122270 () Bool)

(assert (=> b!1253076 (= c!122270 (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(declare-fun b!1253077 () Bool)

(assert (=> b!1253077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(assert (=> b!1253077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39709 _values!914)))))

(declare-fun e!711812 () Bool)

(declare-fun lt!565659 () ListLongMap!18455)

(assert (=> b!1253077 (= e!711812 (= (apply!984 lt!565659 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)) (get!20061 (select (arr!39173 _values!914) #b00000000000000000000000000000000) (dynLambda!3382 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1253078 () Bool)

(assert (=> b!1253078 (= e!711811 (validKeyInArray!0 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253078 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1253080 () Bool)

(assert (=> b!1253080 (= e!711809 e!711812)))

(assert (=> b!1253080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(declare-fun res!835619 () Bool)

(assert (=> b!1253080 (= res!835619 (contains!7515 lt!565659 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253080 (=> (not res!835619) (not e!711812))))

(declare-fun b!1253081 () Bool)

(declare-fun e!711807 () ListLongMap!18455)

(assert (=> b!1253081 (= e!711807 e!711813)))

(declare-fun c!122272 () Bool)

(assert (=> b!1253081 (= c!122272 (validKeyInArray!0 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253082 () Bool)

(assert (=> b!1253082 (= e!711807 (ListLongMap!18456 Nil!27811))))

(declare-fun b!1253083 () Bool)

(assert (=> b!1253083 (= e!711808 (= lt!565659 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!61664 () Bool)

(assert (=> bm!61664 (= call!61667 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1253084 () Bool)

(assert (=> b!1253084 (= e!711813 call!61667)))

(declare-fun b!1253085 () Bool)

(declare-fun res!835617 () Bool)

(assert (=> b!1253085 (=> (not res!835617) (not e!711810))))

(assert (=> b!1253085 (= res!835617 (not (contains!7515 lt!565659 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1253079 () Bool)

(assert (=> b!1253079 (= e!711808 (isEmpty!1026 lt!565659))))

(declare-fun d!138031 () Bool)

(assert (=> d!138031 e!711810))

(declare-fun res!835616 () Bool)

(assert (=> d!138031 (=> (not res!835616) (not e!711810))))

(assert (=> d!138031 (= res!835616 (not (contains!7515 lt!565659 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138031 (= lt!565659 e!711807)))

(declare-fun c!122271 () Bool)

(assert (=> d!138031 (= c!122271 (bvsge #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(assert (=> d!138031 (validMask!0 mask!1466)))

(assert (=> d!138031 (= (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565659)))

(assert (= (and d!138031 c!122271) b!1253082))

(assert (= (and d!138031 (not c!122271)) b!1253081))

(assert (= (and b!1253081 c!122272) b!1253074))

(assert (= (and b!1253081 (not c!122272)) b!1253084))

(assert (= (or b!1253074 b!1253084) bm!61664))

(assert (= (and d!138031 res!835616) b!1253085))

(assert (= (and b!1253085 res!835617) b!1253075))

(assert (= (and b!1253075 res!835618) b!1253078))

(assert (= (and b!1253075 c!122273) b!1253080))

(assert (= (and b!1253075 (not c!122273)) b!1253076))

(assert (= (and b!1253080 res!835619) b!1253077))

(assert (= (and b!1253076 c!122270) b!1253083))

(assert (= (and b!1253076 (not c!122270)) b!1253079))

(declare-fun b_lambda!22587 () Bool)

(assert (=> (not b_lambda!22587) (not b!1253074)))

(assert (=> b!1253074 t!41296))

(declare-fun b_and!44689 () Bool)

(assert (= b_and!44687 (and (=> t!41296 result!23293) b_and!44689)))

(declare-fun b_lambda!22589 () Bool)

(assert (=> (not b_lambda!22589) (not b!1253077)))

(assert (=> b!1253077 t!41296))

(declare-fun b_and!44691 () Bool)

(assert (= b_and!44689 (and (=> t!41296 result!23293) b_and!44691)))

(assert (=> b!1253077 m!1153579))

(assert (=> b!1253077 m!1153565))

(declare-fun m!1153605 () Bool)

(assert (=> b!1253077 m!1153605))

(assert (=> b!1253077 m!1153565))

(assert (=> b!1253077 m!1153579))

(assert (=> b!1253077 m!1153583))

(assert (=> b!1253077 m!1153585))

(assert (=> b!1253077 m!1153583))

(declare-fun m!1153607 () Bool)

(assert (=> d!138031 m!1153607))

(assert (=> d!138031 m!1153539))

(declare-fun m!1153609 () Bool)

(assert (=> bm!61664 m!1153609))

(declare-fun m!1153611 () Bool)

(assert (=> b!1253079 m!1153611))

(declare-fun m!1153613 () Bool)

(assert (=> b!1253074 m!1153613))

(assert (=> b!1253074 m!1153579))

(assert (=> b!1253074 m!1153565))

(assert (=> b!1253074 m!1153579))

(assert (=> b!1253074 m!1153583))

(assert (=> b!1253074 m!1153585))

(declare-fun m!1153615 () Bool)

(assert (=> b!1253074 m!1153615))

(assert (=> b!1253074 m!1153613))

(declare-fun m!1153617 () Bool)

(assert (=> b!1253074 m!1153617))

(declare-fun m!1153619 () Bool)

(assert (=> b!1253074 m!1153619))

(assert (=> b!1253074 m!1153583))

(declare-fun m!1153621 () Bool)

(assert (=> b!1253085 m!1153621))

(assert (=> b!1253078 m!1153565))

(assert (=> b!1253078 m!1153565))

(assert (=> b!1253078 m!1153573))

(assert (=> b!1253080 m!1153565))

(assert (=> b!1253080 m!1153565))

(declare-fun m!1153623 () Bool)

(assert (=> b!1253080 m!1153623))

(assert (=> b!1253083 m!1153609))

(assert (=> b!1253081 m!1153565))

(assert (=> b!1253081 m!1153565))

(assert (=> b!1253081 m!1153573))

(assert (=> b!1252998 d!138031))

(declare-fun b!1253128 () Bool)

(declare-fun e!711843 () Bool)

(declare-fun call!61684 () Bool)

(assert (=> b!1253128 (= e!711843 (not call!61684))))

(declare-fun call!61687 () ListLongMap!18455)

(declare-fun bm!61679 () Bool)

(assert (=> bm!61679 (= call!61687 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565715 () ListLongMap!18455)

(declare-fun e!711844 () Bool)

(declare-fun b!1253129 () Bool)

(assert (=> b!1253129 (= e!711844 (= (apply!984 lt!565715 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)) (get!20061 (select (arr!39173 _values!914) #b00000000000000000000000000000000) (dynLambda!3382 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1253129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39709 _values!914)))))

(assert (=> b!1253129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(declare-fun b!1253130 () Bool)

(declare-fun e!711850 () ListLongMap!18455)

(declare-fun call!61683 () ListLongMap!18455)

(assert (=> b!1253130 (= e!711850 call!61683)))

(declare-fun bm!61680 () Bool)

(declare-fun call!61686 () ListLongMap!18455)

(declare-fun call!61688 () ListLongMap!18455)

(assert (=> bm!61680 (= call!61686 call!61688)))

(declare-fun b!1253131 () Bool)

(declare-fun e!711840 () Bool)

(assert (=> b!1253131 (= e!711840 (validKeyInArray!0 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253132 () Bool)

(declare-fun e!711851 () Bool)

(assert (=> b!1253132 (= e!711843 e!711851)))

(declare-fun res!835643 () Bool)

(assert (=> b!1253132 (= res!835643 call!61684)))

(assert (=> b!1253132 (=> (not res!835643) (not e!711851))))

(declare-fun b!1253133 () Bool)

(declare-fun c!122287 () Bool)

(assert (=> b!1253133 (= c!122287 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!711842 () ListLongMap!18455)

(assert (=> b!1253133 (= e!711842 e!711850)))

(declare-fun b!1253134 () Bool)

(assert (=> b!1253134 (= e!711851 (= (apply!984 lt!565715 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1253135 () Bool)

(declare-fun e!711847 () Bool)

(assert (=> b!1253135 (= e!711847 (= (apply!984 lt!565715 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!61681 () Bool)

(declare-fun call!61685 () ListLongMap!18455)

(assert (=> bm!61681 (= call!61683 call!61685)))

(declare-fun b!1253136 () Bool)

(declare-fun e!711845 () Bool)

(assert (=> b!1253136 (= e!711845 e!711847)))

(declare-fun res!835641 () Bool)

(declare-fun call!61682 () Bool)

(assert (=> b!1253136 (= res!835641 call!61682)))

(assert (=> b!1253136 (=> (not res!835641) (not e!711847))))

(declare-fun b!1253137 () Bool)

(declare-fun res!835642 () Bool)

(declare-fun e!711849 () Bool)

(assert (=> b!1253137 (=> (not res!835642) (not e!711849))))

(declare-fun e!711841 () Bool)

(assert (=> b!1253137 (= res!835642 e!711841)))

(declare-fun res!835646 () Bool)

(assert (=> b!1253137 (=> res!835646 e!711841)))

(declare-fun e!711846 () Bool)

(assert (=> b!1253137 (= res!835646 (not e!711846))))

(declare-fun res!835645 () Bool)

(assert (=> b!1253137 (=> (not res!835645) (not e!711846))))

(assert (=> b!1253137 (= res!835645 (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(declare-fun b!1253138 () Bool)

(declare-fun e!711852 () ListLongMap!18455)

(assert (=> b!1253138 (= e!711852 (+!4140 call!61688 (tuple2!20583 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1253139 () Bool)

(assert (=> b!1253139 (= e!711842 call!61686)))

(declare-fun b!1253140 () Bool)

(assert (=> b!1253140 (= e!711849 e!711843)))

(declare-fun c!122289 () Bool)

(assert (=> b!1253140 (= c!122289 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253141 () Bool)

(assert (=> b!1253141 (= e!711852 e!711842)))

(declare-fun c!122288 () Bool)

(assert (=> b!1253141 (= c!122288 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253142 () Bool)

(declare-fun res!835638 () Bool)

(assert (=> b!1253142 (=> (not res!835638) (not e!711849))))

(assert (=> b!1253142 (= res!835638 e!711845)))

(declare-fun c!122290 () Bool)

(assert (=> b!1253142 (= c!122290 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1253143 () Bool)

(declare-fun e!711848 () Unit!41671)

(declare-fun Unit!41673 () Unit!41671)

(assert (=> b!1253143 (= e!711848 Unit!41673)))

(declare-fun b!1253144 () Bool)

(declare-fun lt!565718 () Unit!41671)

(assert (=> b!1253144 (= e!711848 lt!565718)))

(declare-fun lt!565708 () ListLongMap!18455)

(assert (=> b!1253144 (= lt!565708 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565716 () (_ BitVec 64))

(assert (=> b!1253144 (= lt!565716 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565707 () (_ BitVec 64))

(assert (=> b!1253144 (= lt!565707 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565713 () Unit!41671)

(declare-fun addStillContains!1077 (ListLongMap!18455 (_ BitVec 64) V!47737 (_ BitVec 64)) Unit!41671)

(assert (=> b!1253144 (= lt!565713 (addStillContains!1077 lt!565708 lt!565716 zeroValue!871 lt!565707))))

(assert (=> b!1253144 (contains!7515 (+!4140 lt!565708 (tuple2!20583 lt!565716 zeroValue!871)) lt!565707)))

(declare-fun lt!565722 () Unit!41671)

(assert (=> b!1253144 (= lt!565722 lt!565713)))

(declare-fun lt!565720 () ListLongMap!18455)

(assert (=> b!1253144 (= lt!565720 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565711 () (_ BitVec 64))

(assert (=> b!1253144 (= lt!565711 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565717 () (_ BitVec 64))

(assert (=> b!1253144 (= lt!565717 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565712 () Unit!41671)

(declare-fun addApplyDifferent!531 (ListLongMap!18455 (_ BitVec 64) V!47737 (_ BitVec 64)) Unit!41671)

(assert (=> b!1253144 (= lt!565712 (addApplyDifferent!531 lt!565720 lt!565711 minValueBefore!43 lt!565717))))

(assert (=> b!1253144 (= (apply!984 (+!4140 lt!565720 (tuple2!20583 lt!565711 minValueBefore!43)) lt!565717) (apply!984 lt!565720 lt!565717))))

(declare-fun lt!565728 () Unit!41671)

(assert (=> b!1253144 (= lt!565728 lt!565712)))

(declare-fun lt!565710 () ListLongMap!18455)

(assert (=> b!1253144 (= lt!565710 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565709 () (_ BitVec 64))

(assert (=> b!1253144 (= lt!565709 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565725 () (_ BitVec 64))

(assert (=> b!1253144 (= lt!565725 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565721 () Unit!41671)

(assert (=> b!1253144 (= lt!565721 (addApplyDifferent!531 lt!565710 lt!565709 zeroValue!871 lt!565725))))

(assert (=> b!1253144 (= (apply!984 (+!4140 lt!565710 (tuple2!20583 lt!565709 zeroValue!871)) lt!565725) (apply!984 lt!565710 lt!565725))))

(declare-fun lt!565724 () Unit!41671)

(assert (=> b!1253144 (= lt!565724 lt!565721)))

(declare-fun lt!565726 () ListLongMap!18455)

(assert (=> b!1253144 (= lt!565726 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565723 () (_ BitVec 64))

(assert (=> b!1253144 (= lt!565723 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565714 () (_ BitVec 64))

(assert (=> b!1253144 (= lt!565714 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1253144 (= lt!565718 (addApplyDifferent!531 lt!565726 lt!565723 minValueBefore!43 lt!565714))))

(assert (=> b!1253144 (= (apply!984 (+!4140 lt!565726 (tuple2!20583 lt!565723 minValueBefore!43)) lt!565714) (apply!984 lt!565726 lt!565714))))

(declare-fun bm!61682 () Bool)

(assert (=> bm!61682 (= call!61685 call!61687)))

(declare-fun c!122291 () Bool)

(declare-fun bm!61683 () Bool)

(assert (=> bm!61683 (= call!61688 (+!4140 (ite c!122291 call!61687 (ite c!122288 call!61685 call!61683)) (ite (or c!122291 c!122288) (tuple2!20583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20583 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1253145 () Bool)

(assert (=> b!1253145 (= e!711846 (validKeyInArray!0 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253146 () Bool)

(assert (=> b!1253146 (= e!711841 e!711844)))

(declare-fun res!835644 () Bool)

(assert (=> b!1253146 (=> (not res!835644) (not e!711844))))

(assert (=> b!1253146 (= res!835644 (contains!7515 lt!565715 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253146 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(declare-fun d!138033 () Bool)

(assert (=> d!138033 e!711849))

(declare-fun res!835639 () Bool)

(assert (=> d!138033 (=> (not res!835639) (not e!711849))))

(assert (=> d!138033 (= res!835639 (or (bvsge #b00000000000000000000000000000000 (size!39708 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))))

(declare-fun lt!565727 () ListLongMap!18455)

(assert (=> d!138033 (= lt!565715 lt!565727)))

(declare-fun lt!565719 () Unit!41671)

(assert (=> d!138033 (= lt!565719 e!711848)))

(declare-fun c!122286 () Bool)

(assert (=> d!138033 (= c!122286 e!711840)))

(declare-fun res!835640 () Bool)

(assert (=> d!138033 (=> (not res!835640) (not e!711840))))

(assert (=> d!138033 (= res!835640 (bvslt #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(assert (=> d!138033 (= lt!565727 e!711852)))

(assert (=> d!138033 (= c!122291 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138033 (validMask!0 mask!1466)))

(assert (=> d!138033 (= (getCurrentListMap!4488 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565715)))

(declare-fun b!1253147 () Bool)

(assert (=> b!1253147 (= e!711845 (not call!61682))))

(declare-fun b!1253148 () Bool)

(assert (=> b!1253148 (= e!711850 call!61686)))

(declare-fun bm!61684 () Bool)

(assert (=> bm!61684 (= call!61682 (contains!7515 lt!565715 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61685 () Bool)

(assert (=> bm!61685 (= call!61684 (contains!7515 lt!565715 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!138033 c!122291) b!1253138))

(assert (= (and d!138033 (not c!122291)) b!1253141))

(assert (= (and b!1253141 c!122288) b!1253139))

(assert (= (and b!1253141 (not c!122288)) b!1253133))

(assert (= (and b!1253133 c!122287) b!1253148))

(assert (= (and b!1253133 (not c!122287)) b!1253130))

(assert (= (or b!1253148 b!1253130) bm!61681))

(assert (= (or b!1253139 bm!61681) bm!61682))

(assert (= (or b!1253139 b!1253148) bm!61680))

(assert (= (or b!1253138 bm!61682) bm!61679))

(assert (= (or b!1253138 bm!61680) bm!61683))

(assert (= (and d!138033 res!835640) b!1253131))

(assert (= (and d!138033 c!122286) b!1253144))

(assert (= (and d!138033 (not c!122286)) b!1253143))

(assert (= (and d!138033 res!835639) b!1253137))

(assert (= (and b!1253137 res!835645) b!1253145))

(assert (= (and b!1253137 (not res!835646)) b!1253146))

(assert (= (and b!1253146 res!835644) b!1253129))

(assert (= (and b!1253137 res!835642) b!1253142))

(assert (= (and b!1253142 c!122290) b!1253136))

(assert (= (and b!1253142 (not c!122290)) b!1253147))

(assert (= (and b!1253136 res!835641) b!1253135))

(assert (= (or b!1253136 b!1253147) bm!61684))

(assert (= (and b!1253142 res!835638) b!1253140))

(assert (= (and b!1253140 c!122289) b!1253132))

(assert (= (and b!1253140 (not c!122289)) b!1253128))

(assert (= (and b!1253132 res!835643) b!1253134))

(assert (= (or b!1253132 b!1253128) bm!61685))

(declare-fun b_lambda!22591 () Bool)

(assert (=> (not b_lambda!22591) (not b!1253129)))

(assert (=> b!1253129 t!41296))

(declare-fun b_and!44693 () Bool)

(assert (= b_and!44691 (and (=> t!41296 result!23293) b_and!44693)))

(declare-fun m!1153625 () Bool)

(assert (=> b!1253135 m!1153625))

(assert (=> bm!61679 m!1153531))

(assert (=> b!1253131 m!1153565))

(assert (=> b!1253131 m!1153565))

(assert (=> b!1253131 m!1153573))

(declare-fun m!1153627 () Bool)

(assert (=> bm!61684 m!1153627))

(assert (=> b!1253129 m!1153583))

(assert (=> b!1253129 m!1153565))

(assert (=> b!1253129 m!1153579))

(assert (=> b!1253129 m!1153565))

(declare-fun m!1153629 () Bool)

(assert (=> b!1253129 m!1153629))

(assert (=> b!1253129 m!1153579))

(assert (=> b!1253129 m!1153583))

(assert (=> b!1253129 m!1153585))

(declare-fun m!1153631 () Bool)

(assert (=> b!1253134 m!1153631))

(assert (=> b!1253145 m!1153565))

(assert (=> b!1253145 m!1153565))

(assert (=> b!1253145 m!1153573))

(assert (=> b!1253146 m!1153565))

(assert (=> b!1253146 m!1153565))

(declare-fun m!1153633 () Bool)

(assert (=> b!1253146 m!1153633))

(declare-fun m!1153635 () Bool)

(assert (=> b!1253144 m!1153635))

(declare-fun m!1153637 () Bool)

(assert (=> b!1253144 m!1153637))

(assert (=> b!1253144 m!1153531))

(declare-fun m!1153639 () Bool)

(assert (=> b!1253144 m!1153639))

(declare-fun m!1153641 () Bool)

(assert (=> b!1253144 m!1153641))

(declare-fun m!1153643 () Bool)

(assert (=> b!1253144 m!1153643))

(assert (=> b!1253144 m!1153639))

(declare-fun m!1153645 () Bool)

(assert (=> b!1253144 m!1153645))

(declare-fun m!1153647 () Bool)

(assert (=> b!1253144 m!1153647))

(declare-fun m!1153649 () Bool)

(assert (=> b!1253144 m!1153649))

(assert (=> b!1253144 m!1153647))

(declare-fun m!1153651 () Bool)

(assert (=> b!1253144 m!1153651))

(assert (=> b!1253144 m!1153635))

(declare-fun m!1153653 () Bool)

(assert (=> b!1253144 m!1153653))

(declare-fun m!1153655 () Bool)

(assert (=> b!1253144 m!1153655))

(assert (=> b!1253144 m!1153637))

(declare-fun m!1153657 () Bool)

(assert (=> b!1253144 m!1153657))

(assert (=> b!1253144 m!1153565))

(declare-fun m!1153659 () Bool)

(assert (=> b!1253144 m!1153659))

(declare-fun m!1153661 () Bool)

(assert (=> b!1253144 m!1153661))

(declare-fun m!1153663 () Bool)

(assert (=> b!1253144 m!1153663))

(declare-fun m!1153665 () Bool)

(assert (=> bm!61683 m!1153665))

(declare-fun m!1153667 () Bool)

(assert (=> b!1253138 m!1153667))

(declare-fun m!1153669 () Bool)

(assert (=> bm!61685 m!1153669))

(assert (=> d!138033 m!1153539))

(assert (=> b!1252993 d!138033))

(declare-fun b!1253159 () Bool)

(declare-fun e!711861 () Bool)

(declare-fun e!711864 () Bool)

(assert (=> b!1253159 (= e!711861 e!711864)))

(declare-fun res!835655 () Bool)

(assert (=> b!1253159 (=> (not res!835655) (not e!711864))))

(declare-fun e!711862 () Bool)

(assert (=> b!1253159 (= res!835655 (not e!711862))))

(declare-fun res!835654 () Bool)

(assert (=> b!1253159 (=> (not res!835654) (not e!711862))))

(assert (=> b!1253159 (= res!835654 (validKeyInArray!0 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253160 () Bool)

(declare-fun e!711863 () Bool)

(declare-fun call!61691 () Bool)

(assert (=> b!1253160 (= e!711863 call!61691)))

(declare-fun b!1253161 () Bool)

(assert (=> b!1253161 (= e!711864 e!711863)))

(declare-fun c!122294 () Bool)

(assert (=> b!1253161 (= c!122294 (validKeyInArray!0 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253162 () Bool)

(declare-fun contains!7516 (List!27815 (_ BitVec 64)) Bool)

(assert (=> b!1253162 (= e!711862 (contains!7516 Nil!27812 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61688 () Bool)

(assert (=> bm!61688 (= call!61691 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122294 (Cons!27811 (select (arr!39172 _keys!1118) #b00000000000000000000000000000000) Nil!27812) Nil!27812)))))

(declare-fun d!138035 () Bool)

(declare-fun res!835653 () Bool)

(assert (=> d!138035 (=> res!835653 e!711861)))

(assert (=> d!138035 (= res!835653 (bvsge #b00000000000000000000000000000000 (size!39708 _keys!1118)))))

(assert (=> d!138035 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27812) e!711861)))

(declare-fun b!1253163 () Bool)

(assert (=> b!1253163 (= e!711863 call!61691)))

(assert (= (and d!138035 (not res!835653)) b!1253159))

(assert (= (and b!1253159 res!835654) b!1253162))

(assert (= (and b!1253159 res!835655) b!1253161))

(assert (= (and b!1253161 c!122294) b!1253160))

(assert (= (and b!1253161 (not c!122294)) b!1253163))

(assert (= (or b!1253160 b!1253163) bm!61688))

(assert (=> b!1253159 m!1153565))

(assert (=> b!1253159 m!1153565))

(assert (=> b!1253159 m!1153573))

(assert (=> b!1253161 m!1153565))

(assert (=> b!1253161 m!1153565))

(assert (=> b!1253161 m!1153573))

(assert (=> b!1253162 m!1153565))

(assert (=> b!1253162 m!1153565))

(declare-fun m!1153671 () Bool)

(assert (=> b!1253162 m!1153671))

(assert (=> bm!61688 m!1153565))

(declare-fun m!1153673 () Bool)

(assert (=> bm!61688 m!1153673))

(assert (=> b!1252997 d!138035))

(declare-fun b!1253171 () Bool)

(declare-fun e!711869 () Bool)

(assert (=> b!1253171 (= e!711869 tp_is_empty!31779)))

(declare-fun condMapEmpty!49447 () Bool)

(declare-fun mapDefault!49447 () ValueCell!15126)

(assert (=> mapNonEmpty!49441 (= condMapEmpty!49447 (= mapRest!49441 ((as const (Array (_ BitVec 32) ValueCell!15126)) mapDefault!49447)))))

(declare-fun mapRes!49447 () Bool)

(assert (=> mapNonEmpty!49441 (= tp!94133 (and e!711869 mapRes!49447))))

(declare-fun mapIsEmpty!49447 () Bool)

(assert (=> mapIsEmpty!49447 mapRes!49447))

(declare-fun mapNonEmpty!49447 () Bool)

(declare-fun tp!94142 () Bool)

(declare-fun e!711870 () Bool)

(assert (=> mapNonEmpty!49447 (= mapRes!49447 (and tp!94142 e!711870))))

(declare-fun mapValue!49447 () ValueCell!15126)

(declare-fun mapKey!49447 () (_ BitVec 32))

(declare-fun mapRest!49447 () (Array (_ BitVec 32) ValueCell!15126))

(assert (=> mapNonEmpty!49447 (= mapRest!49441 (store mapRest!49447 mapKey!49447 mapValue!49447))))

(declare-fun b!1253170 () Bool)

(assert (=> b!1253170 (= e!711870 tp_is_empty!31779)))

(assert (= (and mapNonEmpty!49441 condMapEmpty!49447) mapIsEmpty!49447))

(assert (= (and mapNonEmpty!49441 (not condMapEmpty!49447)) mapNonEmpty!49447))

(assert (= (and mapNonEmpty!49447 ((_ is ValueCellFull!15126) mapValue!49447)) b!1253170))

(assert (= (and mapNonEmpty!49441 ((_ is ValueCellFull!15126) mapDefault!49447)) b!1253171))

(declare-fun m!1153675 () Bool)

(assert (=> mapNonEmpty!49447 m!1153675))

(declare-fun b_lambda!22593 () Bool)

(assert (= b_lambda!22585 (or (and start!105144 b_free!26877) b_lambda!22593)))

(declare-fun b_lambda!22595 () Bool)

(assert (= b_lambda!22589 (or (and start!105144 b_free!26877) b_lambda!22595)))

(declare-fun b_lambda!22597 () Bool)

(assert (= b_lambda!22587 (or (and start!105144 b_free!26877) b_lambda!22597)))

(declare-fun b_lambda!22599 () Bool)

(assert (= b_lambda!22591 (or (and start!105144 b_free!26877) b_lambda!22599)))

(declare-fun b_lambda!22601 () Bool)

(assert (= b_lambda!22583 (or (and start!105144 b_free!26877) b_lambda!22601)))

(check-sat (not b_lambda!22593) (not bm!61679) (not bm!61684) (not b!1253083) (not bm!61683) (not bm!61660) (not b!1253069) (not b_next!26877) (not b!1253131) (not b_lambda!22597) (not b!1253085) (not b!1253144) (not b!1253066) (not d!138027) (not b!1253161) (not b!1253079) (not bm!61663) (not b!1253135) (not b!1253034) (not b_lambda!22601) (not b_lambda!22599) (not b!1253081) (not b!1253134) (not b!1253032) (not d!138031) (not b!1253159) (not b!1253145) (not b!1253138) (not b!1253077) (not b!1253162) (not d!138029) (not b!1253129) (not bm!61664) tp_is_empty!31779 (not b!1253071) (not b!1253060) (not bm!61685) b_and!44693 (not b!1253074) (not b!1253078) (not mapNonEmpty!49447) (not b!1253063) (not b!1253067) (not b!1253146) (not b!1253064) (not bm!61688) (not d!138033) (not b!1253065) (not b!1253080) (not b_lambda!22595))
(check-sat b_and!44693 (not b_next!26877))
