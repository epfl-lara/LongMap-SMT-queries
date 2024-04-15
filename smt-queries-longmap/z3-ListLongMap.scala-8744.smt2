; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106062 () Bool)

(assert start!106062)

(declare-fun b_free!27499 () Bool)

(declare-fun b_next!27499 () Bool)

(assert (=> start!106062 (= b_free!27499 (not b_next!27499))))

(declare-fun tp!96046 () Bool)

(declare-fun b_and!45455 () Bool)

(assert (=> start!106062 (= tp!96046 b_and!45455)))

(declare-fun b!1262960 () Bool)

(declare-fun e!719000 () Bool)

(declare-fun tp_is_empty!32401 () Bool)

(assert (=> b!1262960 (= e!719000 tp_is_empty!32401)))

(declare-fun b!1262961 () Bool)

(declare-fun e!718996 () Bool)

(assert (=> b!1262961 (= e!718996 tp_is_empty!32401)))

(declare-fun defaultEntry!922 () Int)

(declare-fun b!1262962 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!48567 0))(
  ( (V!48568 (val!16263 Int)) )
))
(declare-fun zeroValue!871 () V!48567)

(declare-datatypes ((array!82345 0))(
  ( (array!82346 (arr!39720 (Array (_ BitVec 32) (_ BitVec 64))) (size!40258 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82345)

(declare-datatypes ((ValueCell!15437 0))(
  ( (ValueCellFull!15437 (v!18971 V!48567)) (EmptyCell!15437) )
))
(declare-datatypes ((array!82347 0))(
  ( (array!82348 (arr!39721 (Array (_ BitVec 32) ValueCell!15437)) (size!40259 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82347)

(declare-fun minValueBefore!43 () V!48567)

(declare-fun e!718998 () Bool)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((tuple2!21132 0))(
  ( (tuple2!21133 (_1!10577 (_ BitVec 64)) (_2!10577 V!48567)) )
))
(declare-datatypes ((List!28332 0))(
  ( (Nil!28329) (Cons!28328 (h!29537 tuple2!21132) (t!41834 List!28332)) )
))
(declare-datatypes ((ListLongMap!19005 0))(
  ( (ListLongMap!19006 (toList!9518 List!28332)) )
))
(declare-fun contains!7569 (ListLongMap!19005 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4573 (array!82345 array!82347 (_ BitVec 32) (_ BitVec 32) V!48567 V!48567 (_ BitVec 32) Int) ListLongMap!19005)

(assert (=> b!1262962 (= e!718998 (not (contains!7569 (getCurrentListMap!4573 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!841333 () Bool)

(declare-fun e!718997 () Bool)

(assert (=> start!106062 (=> (not res!841333) (not e!718997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106062 (= res!841333 (validMask!0 mask!1466))))

(assert (=> start!106062 e!718997))

(assert (=> start!106062 true))

(assert (=> start!106062 tp!96046))

(assert (=> start!106062 tp_is_empty!32401))

(declare-fun array_inv!30387 (array!82345) Bool)

(assert (=> start!106062 (array_inv!30387 _keys!1118)))

(declare-fun e!719001 () Bool)

(declare-fun array_inv!30388 (array!82347) Bool)

(assert (=> start!106062 (and (array_inv!30388 _values!914) e!719001)))

(declare-fun b!1262963 () Bool)

(declare-fun res!841332 () Bool)

(assert (=> b!1262963 (=> (not res!841332) (not e!718997))))

(declare-datatypes ((List!28333 0))(
  ( (Nil!28330) (Cons!28329 (h!29538 (_ BitVec 64)) (t!41835 List!28333)) )
))
(declare-fun arrayNoDuplicates!0 (array!82345 (_ BitVec 32) List!28333) Bool)

(assert (=> b!1262963 (= res!841332 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28330))))

(declare-fun b!1262964 () Bool)

(declare-fun mapRes!50422 () Bool)

(assert (=> b!1262964 (= e!719001 (and e!719000 mapRes!50422))))

(declare-fun condMapEmpty!50422 () Bool)

(declare-fun mapDefault!50422 () ValueCell!15437)

(assert (=> b!1262964 (= condMapEmpty!50422 (= (arr!39721 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15437)) mapDefault!50422)))))

(declare-fun mapIsEmpty!50422 () Bool)

(assert (=> mapIsEmpty!50422 mapRes!50422))

(declare-fun b!1262965 () Bool)

(declare-fun res!841335 () Bool)

(assert (=> b!1262965 (=> (not res!841335) (not e!718997))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1262965 (= res!841335 (and (= (size!40259 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40258 _keys!1118) (size!40259 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50422 () Bool)

(declare-fun tp!96047 () Bool)

(assert (=> mapNonEmpty!50422 (= mapRes!50422 (and tp!96047 e!718996))))

(declare-fun mapRest!50422 () (Array (_ BitVec 32) ValueCell!15437))

(declare-fun mapKey!50422 () (_ BitVec 32))

(declare-fun mapValue!50422 () ValueCell!15437)

(assert (=> mapNonEmpty!50422 (= (arr!39721 _values!914) (store mapRest!50422 mapKey!50422 mapValue!50422))))

(declare-fun b!1262966 () Bool)

(declare-fun res!841334 () Bool)

(assert (=> b!1262966 (=> (not res!841334) (not e!718997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82345 (_ BitVec 32)) Bool)

(assert (=> b!1262966 (= res!841334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262967 () Bool)

(assert (=> b!1262967 (= e!718997 (not e!718998))))

(declare-fun res!841331 () Bool)

(assert (=> b!1262967 (=> res!841331 e!718998)))

(assert (=> b!1262967 (= res!841331 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!572538 () ListLongMap!19005)

(declare-fun lt!572539 () ListLongMap!19005)

(assert (=> b!1262967 (= lt!572538 lt!572539)))

(declare-fun minValueAfter!43 () V!48567)

(declare-datatypes ((Unit!41950 0))(
  ( (Unit!41951) )
))
(declare-fun lt!572540 () Unit!41950)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1185 (array!82345 array!82347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48567 V!48567 V!48567 V!48567 (_ BitVec 32) Int) Unit!41950)

(assert (=> b!1262967 (= lt!572540 (lemmaNoChangeToArrayThenSameMapNoExtras!1185 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5885 (array!82345 array!82347 (_ BitVec 32) (_ BitVec 32) V!48567 V!48567 (_ BitVec 32) Int) ListLongMap!19005)

(assert (=> b!1262967 (= lt!572539 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262967 (= lt!572538 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!106062 res!841333) b!1262965))

(assert (= (and b!1262965 res!841335) b!1262966))

(assert (= (and b!1262966 res!841334) b!1262963))

(assert (= (and b!1262963 res!841332) b!1262967))

(assert (= (and b!1262967 (not res!841331)) b!1262962))

(assert (= (and b!1262964 condMapEmpty!50422) mapIsEmpty!50422))

(assert (= (and b!1262964 (not condMapEmpty!50422)) mapNonEmpty!50422))

(get-info :version)

(assert (= (and mapNonEmpty!50422 ((_ is ValueCellFull!15437) mapValue!50422)) b!1262961))

(assert (= (and b!1262964 ((_ is ValueCellFull!15437) mapDefault!50422)) b!1262960))

(assert (= start!106062 b!1262964))

(declare-fun m!1163051 () Bool)

(assert (=> b!1262967 m!1163051))

(declare-fun m!1163053 () Bool)

(assert (=> b!1262967 m!1163053))

(declare-fun m!1163055 () Bool)

(assert (=> b!1262967 m!1163055))

(declare-fun m!1163057 () Bool)

(assert (=> b!1262962 m!1163057))

(assert (=> b!1262962 m!1163057))

(declare-fun m!1163059 () Bool)

(assert (=> b!1262962 m!1163059))

(declare-fun m!1163061 () Bool)

(assert (=> b!1262963 m!1163061))

(declare-fun m!1163063 () Bool)

(assert (=> start!106062 m!1163063))

(declare-fun m!1163065 () Bool)

(assert (=> start!106062 m!1163065))

(declare-fun m!1163067 () Bool)

(assert (=> start!106062 m!1163067))

(declare-fun m!1163069 () Bool)

(assert (=> b!1262966 m!1163069))

(declare-fun m!1163071 () Bool)

(assert (=> mapNonEmpty!50422 m!1163071))

(check-sat (not b_next!27499) tp_is_empty!32401 (not b!1262967) b_and!45455 (not start!106062) (not mapNonEmpty!50422) (not b!1262963) (not b!1262966) (not b!1262962))
(check-sat b_and!45455 (not b_next!27499))
(get-model)

(declare-fun d!138459 () Bool)

(assert (=> d!138459 (= (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572561 () Unit!41950)

(declare-fun choose!1883 (array!82345 array!82347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48567 V!48567 V!48567 V!48567 (_ BitVec 32) Int) Unit!41950)

(assert (=> d!138459 (= lt!572561 (choose!1883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138459 (validMask!0 mask!1466)))

(assert (=> d!138459 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1185 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572561)))

(declare-fun bs!35712 () Bool)

(assert (= bs!35712 d!138459))

(assert (=> bs!35712 m!1163055))

(assert (=> bs!35712 m!1163053))

(declare-fun m!1163117 () Bool)

(assert (=> bs!35712 m!1163117))

(assert (=> bs!35712 m!1163063))

(assert (=> b!1262967 d!138459))

(declare-fun b!1263040 () Bool)

(declare-fun e!719055 () ListLongMap!19005)

(assert (=> b!1263040 (= e!719055 (ListLongMap!19006 Nil!28329))))

(declare-fun call!62133 () ListLongMap!19005)

(declare-fun bm!62130 () Bool)

(assert (=> bm!62130 (= call!62133 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263041 () Bool)

(declare-fun e!719054 () ListLongMap!19005)

(assert (=> b!1263041 (= e!719054 call!62133)))

(declare-fun b!1263042 () Bool)

(declare-fun e!719052 () Bool)

(declare-fun e!719057 () Bool)

(assert (=> b!1263042 (= e!719052 e!719057)))

(declare-fun c!122896 () Bool)

(declare-fun e!719058 () Bool)

(assert (=> b!1263042 (= c!122896 e!719058)))

(declare-fun res!841376 () Bool)

(assert (=> b!1263042 (=> (not res!841376) (not e!719058))))

(assert (=> b!1263042 (= res!841376 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun b!1263043 () Bool)

(assert (=> b!1263043 (= e!719055 e!719054)))

(declare-fun c!122897 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263043 (= c!122897 (validKeyInArray!0 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263044 () Bool)

(declare-fun res!841374 () Bool)

(assert (=> b!1263044 (=> (not res!841374) (not e!719052))))

(declare-fun lt!572577 () ListLongMap!19005)

(assert (=> b!1263044 (= res!841374 (not (contains!7569 lt!572577 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138461 () Bool)

(assert (=> d!138461 e!719052))

(declare-fun res!841375 () Bool)

(assert (=> d!138461 (=> (not res!841375) (not e!719052))))

(assert (=> d!138461 (= res!841375 (not (contains!7569 lt!572577 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138461 (= lt!572577 e!719055)))

(declare-fun c!122894 () Bool)

(assert (=> d!138461 (= c!122894 (bvsge #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> d!138461 (validMask!0 mask!1466)))

(assert (=> d!138461 (= (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572577)))

(declare-fun b!1263045 () Bool)

(declare-fun e!719053 () Bool)

(declare-fun isEmpty!1048 (ListLongMap!19005) Bool)

(assert (=> b!1263045 (= e!719053 (isEmpty!1048 lt!572577))))

(declare-fun b!1263046 () Bool)

(assert (=> b!1263046 (= e!719058 (validKeyInArray!0 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263046 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263047 () Bool)

(assert (=> b!1263047 (= e!719057 e!719053)))

(declare-fun c!122895 () Bool)

(assert (=> b!1263047 (= c!122895 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun b!1263048 () Bool)

(declare-fun lt!572578 () Unit!41950)

(declare-fun lt!572579 () Unit!41950)

(assert (=> b!1263048 (= lt!572578 lt!572579)))

(declare-fun lt!572581 () (_ BitVec 64))

(declare-fun lt!572576 () (_ BitVec 64))

(declare-fun lt!572580 () V!48567)

(declare-fun lt!572582 () ListLongMap!19005)

(declare-fun +!4290 (ListLongMap!19005 tuple2!21132) ListLongMap!19005)

(assert (=> b!1263048 (not (contains!7569 (+!4290 lt!572582 (tuple2!21133 lt!572576 lt!572580)) lt!572581))))

(declare-fun addStillNotContains!329 (ListLongMap!19005 (_ BitVec 64) V!48567 (_ BitVec 64)) Unit!41950)

(assert (=> b!1263048 (= lt!572579 (addStillNotContains!329 lt!572582 lt!572576 lt!572580 lt!572581))))

(assert (=> b!1263048 (= lt!572581 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20286 (ValueCell!15437 V!48567) V!48567)

(declare-fun dynLambda!3423 (Int (_ BitVec 64)) V!48567)

(assert (=> b!1263048 (= lt!572580 (get!20286 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3423 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263048 (= lt!572576 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263048 (= lt!572582 call!62133)))

(assert (=> b!1263048 (= e!719054 (+!4290 call!62133 (tuple2!21133 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000) (get!20286 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3423 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263049 () Bool)

(declare-fun e!719056 () Bool)

(assert (=> b!1263049 (= e!719057 e!719056)))

(assert (=> b!1263049 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun res!841377 () Bool)

(assert (=> b!1263049 (= res!841377 (contains!7569 lt!572577 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263049 (=> (not res!841377) (not e!719056))))

(declare-fun b!1263050 () Bool)

(assert (=> b!1263050 (= e!719053 (= lt!572577 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263051 () Bool)

(assert (=> b!1263051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> b!1263051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40259 _values!914)))))

(declare-fun apply!993 (ListLongMap!19005 (_ BitVec 64)) V!48567)

(assert (=> b!1263051 (= e!719056 (= (apply!993 lt!572577 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)) (get!20286 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3423 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!138461 c!122894) b!1263040))

(assert (= (and d!138461 (not c!122894)) b!1263043))

(assert (= (and b!1263043 c!122897) b!1263048))

(assert (= (and b!1263043 (not c!122897)) b!1263041))

(assert (= (or b!1263048 b!1263041) bm!62130))

(assert (= (and d!138461 res!841375) b!1263044))

(assert (= (and b!1263044 res!841374) b!1263042))

(assert (= (and b!1263042 res!841376) b!1263046))

(assert (= (and b!1263042 c!122896) b!1263049))

(assert (= (and b!1263042 (not c!122896)) b!1263047))

(assert (= (and b!1263049 res!841377) b!1263051))

(assert (= (and b!1263047 c!122895) b!1263050))

(assert (= (and b!1263047 (not c!122895)) b!1263045))

(declare-fun b_lambda!22913 () Bool)

(assert (=> (not b_lambda!22913) (not b!1263048)))

(declare-fun t!41838 () Bool)

(declare-fun tb!11319 () Bool)

(assert (=> (and start!106062 (= defaultEntry!922 defaultEntry!922) t!41838) tb!11319))

(declare-fun result!23381 () Bool)

(assert (=> tb!11319 (= result!23381 tp_is_empty!32401)))

(assert (=> b!1263048 t!41838))

(declare-fun b_and!45461 () Bool)

(assert (= b_and!45455 (and (=> t!41838 result!23381) b_and!45461)))

(declare-fun b_lambda!22915 () Bool)

(assert (=> (not b_lambda!22915) (not b!1263051)))

(assert (=> b!1263051 t!41838))

(declare-fun b_and!45463 () Bool)

(assert (= b_and!45461 (and (=> t!41838 result!23381) b_and!45463)))

(declare-fun m!1163119 () Bool)

(assert (=> d!138461 m!1163119))

(assert (=> d!138461 m!1163063))

(declare-fun m!1163121 () Bool)

(assert (=> b!1263046 m!1163121))

(assert (=> b!1263046 m!1163121))

(declare-fun m!1163123 () Bool)

(assert (=> b!1263046 m!1163123))

(declare-fun m!1163125 () Bool)

(assert (=> b!1263050 m!1163125))

(declare-fun m!1163127 () Bool)

(assert (=> b!1263045 m!1163127))

(declare-fun m!1163129 () Bool)

(assert (=> b!1263044 m!1163129))

(assert (=> bm!62130 m!1163125))

(assert (=> b!1263043 m!1163121))

(assert (=> b!1263043 m!1163121))

(assert (=> b!1263043 m!1163123))

(assert (=> b!1263049 m!1163121))

(assert (=> b!1263049 m!1163121))

(declare-fun m!1163131 () Bool)

(assert (=> b!1263049 m!1163131))

(assert (=> b!1263051 m!1163121))

(declare-fun m!1163133 () Bool)

(assert (=> b!1263051 m!1163133))

(declare-fun m!1163135 () Bool)

(assert (=> b!1263051 m!1163135))

(declare-fun m!1163137 () Bool)

(assert (=> b!1263051 m!1163137))

(declare-fun m!1163139 () Bool)

(assert (=> b!1263051 m!1163139))

(assert (=> b!1263051 m!1163121))

(assert (=> b!1263051 m!1163135))

(assert (=> b!1263051 m!1163137))

(declare-fun m!1163141 () Bool)

(assert (=> b!1263048 m!1163141))

(assert (=> b!1263048 m!1163135))

(assert (=> b!1263048 m!1163137))

(assert (=> b!1263048 m!1163139))

(declare-fun m!1163143 () Bool)

(assert (=> b!1263048 m!1163143))

(assert (=> b!1263048 m!1163121))

(assert (=> b!1263048 m!1163135))

(assert (=> b!1263048 m!1163137))

(declare-fun m!1163145 () Bool)

(assert (=> b!1263048 m!1163145))

(assert (=> b!1263048 m!1163141))

(declare-fun m!1163147 () Bool)

(assert (=> b!1263048 m!1163147))

(assert (=> b!1262967 d!138461))

(declare-fun b!1263054 () Bool)

(declare-fun e!719062 () ListLongMap!19005)

(assert (=> b!1263054 (= e!719062 (ListLongMap!19006 Nil!28329))))

(declare-fun bm!62131 () Bool)

(declare-fun call!62134 () ListLongMap!19005)

(assert (=> bm!62131 (= call!62134 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263055 () Bool)

(declare-fun e!719061 () ListLongMap!19005)

(assert (=> b!1263055 (= e!719061 call!62134)))

(declare-fun b!1263056 () Bool)

(declare-fun e!719059 () Bool)

(declare-fun e!719064 () Bool)

(assert (=> b!1263056 (= e!719059 e!719064)))

(declare-fun c!122900 () Bool)

(declare-fun e!719065 () Bool)

(assert (=> b!1263056 (= c!122900 e!719065)))

(declare-fun res!841380 () Bool)

(assert (=> b!1263056 (=> (not res!841380) (not e!719065))))

(assert (=> b!1263056 (= res!841380 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun b!1263057 () Bool)

(assert (=> b!1263057 (= e!719062 e!719061)))

(declare-fun c!122901 () Bool)

(assert (=> b!1263057 (= c!122901 (validKeyInArray!0 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263058 () Bool)

(declare-fun res!841378 () Bool)

(assert (=> b!1263058 (=> (not res!841378) (not e!719059))))

(declare-fun lt!572584 () ListLongMap!19005)

(assert (=> b!1263058 (= res!841378 (not (contains!7569 lt!572584 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138463 () Bool)

(assert (=> d!138463 e!719059))

(declare-fun res!841379 () Bool)

(assert (=> d!138463 (=> (not res!841379) (not e!719059))))

(assert (=> d!138463 (= res!841379 (not (contains!7569 lt!572584 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138463 (= lt!572584 e!719062)))

(declare-fun c!122898 () Bool)

(assert (=> d!138463 (= c!122898 (bvsge #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> d!138463 (validMask!0 mask!1466)))

(assert (=> d!138463 (= (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572584)))

(declare-fun b!1263059 () Bool)

(declare-fun e!719060 () Bool)

(assert (=> b!1263059 (= e!719060 (isEmpty!1048 lt!572584))))

(declare-fun b!1263060 () Bool)

(assert (=> b!1263060 (= e!719065 (validKeyInArray!0 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263060 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263061 () Bool)

(assert (=> b!1263061 (= e!719064 e!719060)))

(declare-fun c!122899 () Bool)

(assert (=> b!1263061 (= c!122899 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun b!1263062 () Bool)

(declare-fun lt!572585 () Unit!41950)

(declare-fun lt!572586 () Unit!41950)

(assert (=> b!1263062 (= lt!572585 lt!572586)))

(declare-fun lt!572589 () ListLongMap!19005)

(declare-fun lt!572587 () V!48567)

(declare-fun lt!572583 () (_ BitVec 64))

(declare-fun lt!572588 () (_ BitVec 64))

(assert (=> b!1263062 (not (contains!7569 (+!4290 lt!572589 (tuple2!21133 lt!572583 lt!572587)) lt!572588))))

(assert (=> b!1263062 (= lt!572586 (addStillNotContains!329 lt!572589 lt!572583 lt!572587 lt!572588))))

(assert (=> b!1263062 (= lt!572588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263062 (= lt!572587 (get!20286 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3423 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263062 (= lt!572583 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263062 (= lt!572589 call!62134)))

(assert (=> b!1263062 (= e!719061 (+!4290 call!62134 (tuple2!21133 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000) (get!20286 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3423 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263063 () Bool)

(declare-fun e!719063 () Bool)

(assert (=> b!1263063 (= e!719064 e!719063)))

(assert (=> b!1263063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun res!841381 () Bool)

(assert (=> b!1263063 (= res!841381 (contains!7569 lt!572584 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263063 (=> (not res!841381) (not e!719063))))

(declare-fun b!1263064 () Bool)

(assert (=> b!1263064 (= e!719060 (= lt!572584 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263065 () Bool)

(assert (=> b!1263065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> b!1263065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40259 _values!914)))))

(assert (=> b!1263065 (= e!719063 (= (apply!993 lt!572584 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)) (get!20286 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3423 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!138463 c!122898) b!1263054))

(assert (= (and d!138463 (not c!122898)) b!1263057))

(assert (= (and b!1263057 c!122901) b!1263062))

(assert (= (and b!1263057 (not c!122901)) b!1263055))

(assert (= (or b!1263062 b!1263055) bm!62131))

(assert (= (and d!138463 res!841379) b!1263058))

(assert (= (and b!1263058 res!841378) b!1263056))

(assert (= (and b!1263056 res!841380) b!1263060))

(assert (= (and b!1263056 c!122900) b!1263063))

(assert (= (and b!1263056 (not c!122900)) b!1263061))

(assert (= (and b!1263063 res!841381) b!1263065))

(assert (= (and b!1263061 c!122899) b!1263064))

(assert (= (and b!1263061 (not c!122899)) b!1263059))

(declare-fun b_lambda!22917 () Bool)

(assert (=> (not b_lambda!22917) (not b!1263062)))

(assert (=> b!1263062 t!41838))

(declare-fun b_and!45465 () Bool)

(assert (= b_and!45463 (and (=> t!41838 result!23381) b_and!45465)))

(declare-fun b_lambda!22919 () Bool)

(assert (=> (not b_lambda!22919) (not b!1263065)))

(assert (=> b!1263065 t!41838))

(declare-fun b_and!45467 () Bool)

(assert (= b_and!45465 (and (=> t!41838 result!23381) b_and!45467)))

(declare-fun m!1163149 () Bool)

(assert (=> d!138463 m!1163149))

(assert (=> d!138463 m!1163063))

(assert (=> b!1263060 m!1163121))

(assert (=> b!1263060 m!1163121))

(assert (=> b!1263060 m!1163123))

(declare-fun m!1163151 () Bool)

(assert (=> b!1263064 m!1163151))

(declare-fun m!1163153 () Bool)

(assert (=> b!1263059 m!1163153))

(declare-fun m!1163155 () Bool)

(assert (=> b!1263058 m!1163155))

(assert (=> bm!62131 m!1163151))

(assert (=> b!1263057 m!1163121))

(assert (=> b!1263057 m!1163121))

(assert (=> b!1263057 m!1163123))

(assert (=> b!1263063 m!1163121))

(assert (=> b!1263063 m!1163121))

(declare-fun m!1163157 () Bool)

(assert (=> b!1263063 m!1163157))

(assert (=> b!1263065 m!1163121))

(declare-fun m!1163159 () Bool)

(assert (=> b!1263065 m!1163159))

(assert (=> b!1263065 m!1163135))

(assert (=> b!1263065 m!1163137))

(assert (=> b!1263065 m!1163139))

(assert (=> b!1263065 m!1163121))

(assert (=> b!1263065 m!1163135))

(assert (=> b!1263065 m!1163137))

(declare-fun m!1163161 () Bool)

(assert (=> b!1263062 m!1163161))

(assert (=> b!1263062 m!1163135))

(assert (=> b!1263062 m!1163137))

(assert (=> b!1263062 m!1163139))

(declare-fun m!1163163 () Bool)

(assert (=> b!1263062 m!1163163))

(assert (=> b!1263062 m!1163121))

(assert (=> b!1263062 m!1163135))

(assert (=> b!1263062 m!1163137))

(declare-fun m!1163165 () Bool)

(assert (=> b!1263062 m!1163165))

(assert (=> b!1263062 m!1163161))

(declare-fun m!1163167 () Bool)

(assert (=> b!1263062 m!1163167))

(assert (=> b!1262967 d!138463))

(declare-fun d!138465 () Bool)

(assert (=> d!138465 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106062 d!138465))

(declare-fun d!138467 () Bool)

(assert (=> d!138467 (= (array_inv!30387 _keys!1118) (bvsge (size!40258 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106062 d!138467))

(declare-fun d!138469 () Bool)

(assert (=> d!138469 (= (array_inv!30388 _values!914) (bvsge (size!40259 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106062 d!138469))

(declare-fun d!138471 () Bool)

(declare-fun res!841386 () Bool)

(declare-fun e!719072 () Bool)

(assert (=> d!138471 (=> res!841386 e!719072)))

(assert (=> d!138471 (= res!841386 (bvsge #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> d!138471 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719072)))

(declare-fun b!1263074 () Bool)

(declare-fun e!719073 () Bool)

(assert (=> b!1263074 (= e!719072 e!719073)))

(declare-fun c!122904 () Bool)

(assert (=> b!1263074 (= c!122904 (validKeyInArray!0 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263075 () Bool)

(declare-fun call!62137 () Bool)

(assert (=> b!1263075 (= e!719073 call!62137)))

(declare-fun b!1263076 () Bool)

(declare-fun e!719074 () Bool)

(assert (=> b!1263076 (= e!719073 e!719074)))

(declare-fun lt!572597 () (_ BitVec 64))

(assert (=> b!1263076 (= lt!572597 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572596 () Unit!41950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82345 (_ BitVec 64) (_ BitVec 32)) Unit!41950)

(assert (=> b!1263076 (= lt!572596 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572597 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263076 (arrayContainsKey!0 _keys!1118 lt!572597 #b00000000000000000000000000000000)))

(declare-fun lt!572598 () Unit!41950)

(assert (=> b!1263076 (= lt!572598 lt!572596)))

(declare-fun res!841387 () Bool)

(declare-datatypes ((SeekEntryResult!9977 0))(
  ( (MissingZero!9977 (index!42279 (_ BitVec 32))) (Found!9977 (index!42280 (_ BitVec 32))) (Intermediate!9977 (undefined!10789 Bool) (index!42281 (_ BitVec 32)) (x!111301 (_ BitVec 32))) (Undefined!9977) (MissingVacant!9977 (index!42282 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82345 (_ BitVec 32)) SeekEntryResult!9977)

(assert (=> b!1263076 (= res!841387 (= (seekEntryOrOpen!0 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9977 #b00000000000000000000000000000000)))))

(assert (=> b!1263076 (=> (not res!841387) (not e!719074))))

(declare-fun b!1263077 () Bool)

(assert (=> b!1263077 (= e!719074 call!62137)))

(declare-fun bm!62134 () Bool)

(assert (=> bm!62134 (= call!62137 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138471 (not res!841386)) b!1263074))

(assert (= (and b!1263074 c!122904) b!1263076))

(assert (= (and b!1263074 (not c!122904)) b!1263075))

(assert (= (and b!1263076 res!841387) b!1263077))

(assert (= (or b!1263077 b!1263075) bm!62134))

(assert (=> b!1263074 m!1163121))

(assert (=> b!1263074 m!1163121))

(assert (=> b!1263074 m!1163123))

(assert (=> b!1263076 m!1163121))

(declare-fun m!1163169 () Bool)

(assert (=> b!1263076 m!1163169))

(declare-fun m!1163171 () Bool)

(assert (=> b!1263076 m!1163171))

(assert (=> b!1263076 m!1163121))

(declare-fun m!1163173 () Bool)

(assert (=> b!1263076 m!1163173))

(declare-fun m!1163175 () Bool)

(assert (=> bm!62134 m!1163175))

(assert (=> b!1262966 d!138471))

(declare-fun d!138473 () Bool)

(declare-fun res!841395 () Bool)

(declare-fun e!719085 () Bool)

(assert (=> d!138473 (=> res!841395 e!719085)))

(assert (=> d!138473 (= res!841395 (bvsge #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> d!138473 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28330) e!719085)))

(declare-fun b!1263088 () Bool)

(declare-fun e!719084 () Bool)

(declare-fun e!719086 () Bool)

(assert (=> b!1263088 (= e!719084 e!719086)))

(declare-fun c!122907 () Bool)

(assert (=> b!1263088 (= c!122907 (validKeyInArray!0 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263089 () Bool)

(declare-fun call!62140 () Bool)

(assert (=> b!1263089 (= e!719086 call!62140)))

(declare-fun b!1263090 () Bool)

(assert (=> b!1263090 (= e!719086 call!62140)))

(declare-fun b!1263091 () Bool)

(assert (=> b!1263091 (= e!719085 e!719084)))

(declare-fun res!841394 () Bool)

(assert (=> b!1263091 (=> (not res!841394) (not e!719084))))

(declare-fun e!719083 () Bool)

(assert (=> b!1263091 (= res!841394 (not e!719083))))

(declare-fun res!841396 () Bool)

(assert (=> b!1263091 (=> (not res!841396) (not e!719083))))

(assert (=> b!1263091 (= res!841396 (validKeyInArray!0 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62137 () Bool)

(assert (=> bm!62137 (= call!62140 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122907 (Cons!28329 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000) Nil!28330) Nil!28330)))))

(declare-fun b!1263092 () Bool)

(declare-fun contains!7571 (List!28333 (_ BitVec 64)) Bool)

(assert (=> b!1263092 (= e!719083 (contains!7571 Nil!28330 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138473 (not res!841395)) b!1263091))

(assert (= (and b!1263091 res!841396) b!1263092))

(assert (= (and b!1263091 res!841394) b!1263088))

(assert (= (and b!1263088 c!122907) b!1263090))

(assert (= (and b!1263088 (not c!122907)) b!1263089))

(assert (= (or b!1263090 b!1263089) bm!62137))

(assert (=> b!1263088 m!1163121))

(assert (=> b!1263088 m!1163121))

(assert (=> b!1263088 m!1163123))

(assert (=> b!1263091 m!1163121))

(assert (=> b!1263091 m!1163121))

(assert (=> b!1263091 m!1163123))

(assert (=> bm!62137 m!1163121))

(declare-fun m!1163177 () Bool)

(assert (=> bm!62137 m!1163177))

(assert (=> b!1263092 m!1163121))

(assert (=> b!1263092 m!1163121))

(declare-fun m!1163179 () Bool)

(assert (=> b!1263092 m!1163179))

(assert (=> b!1262963 d!138473))

(declare-fun d!138475 () Bool)

(declare-fun e!719091 () Bool)

(assert (=> d!138475 e!719091))

(declare-fun res!841399 () Bool)

(assert (=> d!138475 (=> res!841399 e!719091)))

(declare-fun lt!572609 () Bool)

(assert (=> d!138475 (= res!841399 (not lt!572609))))

(declare-fun lt!572608 () Bool)

(assert (=> d!138475 (= lt!572609 lt!572608)))

(declare-fun lt!572607 () Unit!41950)

(declare-fun e!719092 () Unit!41950)

(assert (=> d!138475 (= lt!572607 e!719092)))

(declare-fun c!122910 () Bool)

(assert (=> d!138475 (= c!122910 lt!572608)))

(declare-fun containsKey!623 (List!28332 (_ BitVec 64)) Bool)

(assert (=> d!138475 (= lt!572608 (containsKey!623 (toList!9518 (getCurrentListMap!4573 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138475 (= (contains!7569 (getCurrentListMap!4573 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000) lt!572609)))

(declare-fun b!1263099 () Bool)

(declare-fun lt!572610 () Unit!41950)

(assert (=> b!1263099 (= e!719092 lt!572610)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!433 (List!28332 (_ BitVec 64)) Unit!41950)

(assert (=> b!1263099 (= lt!572610 (lemmaContainsKeyImpliesGetValueByKeyDefined!433 (toList!9518 (getCurrentListMap!4573 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!718 0))(
  ( (Some!717 (v!18974 V!48567)) (None!716) )
))
(declare-fun isDefined!476 (Option!718) Bool)

(declare-fun getValueByKey!667 (List!28332 (_ BitVec 64)) Option!718)

(assert (=> b!1263099 (isDefined!476 (getValueByKey!667 (toList!9518 (getCurrentListMap!4573 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263100 () Bool)

(declare-fun Unit!41954 () Unit!41950)

(assert (=> b!1263100 (= e!719092 Unit!41954)))

(declare-fun b!1263101 () Bool)

(assert (=> b!1263101 (= e!719091 (isDefined!476 (getValueByKey!667 (toList!9518 (getCurrentListMap!4573 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138475 c!122910) b!1263099))

(assert (= (and d!138475 (not c!122910)) b!1263100))

(assert (= (and d!138475 (not res!841399)) b!1263101))

(declare-fun m!1163181 () Bool)

(assert (=> d!138475 m!1163181))

(declare-fun m!1163183 () Bool)

(assert (=> b!1263099 m!1163183))

(declare-fun m!1163185 () Bool)

(assert (=> b!1263099 m!1163185))

(assert (=> b!1263099 m!1163185))

(declare-fun m!1163187 () Bool)

(assert (=> b!1263099 m!1163187))

(assert (=> b!1263101 m!1163185))

(assert (=> b!1263101 m!1163185))

(assert (=> b!1263101 m!1163187))

(assert (=> b!1262962 d!138475))

(declare-fun b!1263144 () Bool)

(declare-fun e!719120 () Bool)

(assert (=> b!1263144 (= e!719120 (validKeyInArray!0 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263145 () Bool)

(declare-fun e!719124 () Bool)

(declare-fun call!62156 () Bool)

(assert (=> b!1263145 (= e!719124 (not call!62156))))

(declare-fun b!1263146 () Bool)

(declare-fun e!719130 () Bool)

(assert (=> b!1263146 (= e!719130 e!719124)))

(declare-fun c!122923 () Bool)

(assert (=> b!1263146 (= c!122923 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263147 () Bool)

(declare-fun e!719119 () Bool)

(declare-fun lt!572659 () ListLongMap!19005)

(assert (=> b!1263147 (= e!719119 (= (apply!993 lt!572659 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun d!138477 () Bool)

(assert (=> d!138477 e!719130))

(declare-fun res!841420 () Bool)

(assert (=> d!138477 (=> (not res!841420) (not e!719130))))

(assert (=> d!138477 (= res!841420 (or (bvsge #b00000000000000000000000000000000 (size!40258 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))))

(declare-fun lt!572658 () ListLongMap!19005)

(assert (=> d!138477 (= lt!572659 lt!572658)))

(declare-fun lt!572662 () Unit!41950)

(declare-fun e!719125 () Unit!41950)

(assert (=> d!138477 (= lt!572662 e!719125)))

(declare-fun c!122926 () Bool)

(declare-fun e!719121 () Bool)

(assert (=> d!138477 (= c!122926 e!719121)))

(declare-fun res!841424 () Bool)

(assert (=> d!138477 (=> (not res!841424) (not e!719121))))

(assert (=> d!138477 (= res!841424 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun e!719122 () ListLongMap!19005)

(assert (=> d!138477 (= lt!572658 e!719122)))

(declare-fun c!122924 () Bool)

(assert (=> d!138477 (= c!122924 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138477 (validMask!0 mask!1466)))

(assert (=> d!138477 (= (getCurrentListMap!4573 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572659)))

(declare-fun call!62160 () ListLongMap!19005)

(declare-fun bm!62152 () Bool)

(assert (=> bm!62152 (= call!62160 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263148 () Bool)

(declare-fun e!719127 () ListLongMap!19005)

(declare-fun call!62161 () ListLongMap!19005)

(assert (=> b!1263148 (= e!719127 call!62161)))

(declare-fun bm!62153 () Bool)

(declare-fun call!62158 () ListLongMap!19005)

(assert (=> bm!62153 (= call!62158 call!62160)))

(declare-fun b!1263149 () Bool)

(declare-fun res!841423 () Bool)

(assert (=> b!1263149 (=> (not res!841423) (not e!719130))))

(declare-fun e!719126 () Bool)

(assert (=> b!1263149 (= res!841423 e!719126)))

(declare-fun c!122928 () Bool)

(assert (=> b!1263149 (= c!122928 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62154 () Bool)

(declare-fun call!62159 () ListLongMap!19005)

(assert (=> bm!62154 (= call!62159 call!62158)))

(declare-fun b!1263150 () Bool)

(declare-fun e!719129 () ListLongMap!19005)

(assert (=> b!1263150 (= e!719129 call!62161)))

(declare-fun b!1263151 () Bool)

(declare-fun call!62155 () Bool)

(assert (=> b!1263151 (= e!719126 (not call!62155))))

(declare-fun bm!62155 () Bool)

(declare-fun call!62157 () ListLongMap!19005)

(assert (=> bm!62155 (= call!62161 call!62157)))

(declare-fun b!1263152 () Bool)

(declare-fun Unit!41955 () Unit!41950)

(assert (=> b!1263152 (= e!719125 Unit!41955)))

(declare-fun b!1263153 () Bool)

(assert (=> b!1263153 (= e!719122 (+!4290 call!62157 (tuple2!21133 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1263154 () Bool)

(assert (=> b!1263154 (= e!719126 e!719119)))

(declare-fun res!841426 () Bool)

(assert (=> b!1263154 (= res!841426 call!62155)))

(assert (=> b!1263154 (=> (not res!841426) (not e!719119))))

(declare-fun b!1263155 () Bool)

(declare-fun e!719128 () Bool)

(declare-fun e!719131 () Bool)

(assert (=> b!1263155 (= e!719128 e!719131)))

(declare-fun res!841425 () Bool)

(assert (=> b!1263155 (=> (not res!841425) (not e!719131))))

(assert (=> b!1263155 (= res!841425 (contains!7569 lt!572659 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun b!1263156 () Bool)

(assert (=> b!1263156 (= e!719121 (validKeyInArray!0 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263157 () Bool)

(declare-fun e!719123 () Bool)

(assert (=> b!1263157 (= e!719124 e!719123)))

(declare-fun res!841419 () Bool)

(assert (=> b!1263157 (= res!841419 call!62156)))

(assert (=> b!1263157 (=> (not res!841419) (not e!719123))))

(declare-fun b!1263158 () Bool)

(assert (=> b!1263158 (= e!719122 e!719127)))

(declare-fun c!122927 () Bool)

(assert (=> b!1263158 (= c!122927 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62156 () Bool)

(assert (=> bm!62156 (= call!62155 (contains!7569 lt!572659 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263159 () Bool)

(declare-fun lt!572670 () Unit!41950)

(assert (=> b!1263159 (= e!719125 lt!572670)))

(declare-fun lt!572667 () ListLongMap!19005)

(assert (=> b!1263159 (= lt!572667 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572657 () (_ BitVec 64))

(assert (=> b!1263159 (= lt!572657 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572675 () (_ BitVec 64))

(assert (=> b!1263159 (= lt!572675 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572660 () Unit!41950)

(declare-fun addStillContains!1090 (ListLongMap!19005 (_ BitVec 64) V!48567 (_ BitVec 64)) Unit!41950)

(assert (=> b!1263159 (= lt!572660 (addStillContains!1090 lt!572667 lt!572657 zeroValue!871 lt!572675))))

(assert (=> b!1263159 (contains!7569 (+!4290 lt!572667 (tuple2!21133 lt!572657 zeroValue!871)) lt!572675)))

(declare-fun lt!572668 () Unit!41950)

(assert (=> b!1263159 (= lt!572668 lt!572660)))

(declare-fun lt!572655 () ListLongMap!19005)

(assert (=> b!1263159 (= lt!572655 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572666 () (_ BitVec 64))

(assert (=> b!1263159 (= lt!572666 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572664 () (_ BitVec 64))

(assert (=> b!1263159 (= lt!572664 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572656 () Unit!41950)

(declare-fun addApplyDifferent!533 (ListLongMap!19005 (_ BitVec 64) V!48567 (_ BitVec 64)) Unit!41950)

(assert (=> b!1263159 (= lt!572656 (addApplyDifferent!533 lt!572655 lt!572666 minValueBefore!43 lt!572664))))

(assert (=> b!1263159 (= (apply!993 (+!4290 lt!572655 (tuple2!21133 lt!572666 minValueBefore!43)) lt!572664) (apply!993 lt!572655 lt!572664))))

(declare-fun lt!572673 () Unit!41950)

(assert (=> b!1263159 (= lt!572673 lt!572656)))

(declare-fun lt!572669 () ListLongMap!19005)

(assert (=> b!1263159 (= lt!572669 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572671 () (_ BitVec 64))

(assert (=> b!1263159 (= lt!572671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572663 () (_ BitVec 64))

(assert (=> b!1263159 (= lt!572663 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572672 () Unit!41950)

(assert (=> b!1263159 (= lt!572672 (addApplyDifferent!533 lt!572669 lt!572671 zeroValue!871 lt!572663))))

(assert (=> b!1263159 (= (apply!993 (+!4290 lt!572669 (tuple2!21133 lt!572671 zeroValue!871)) lt!572663) (apply!993 lt!572669 lt!572663))))

(declare-fun lt!572674 () Unit!41950)

(assert (=> b!1263159 (= lt!572674 lt!572672)))

(declare-fun lt!572661 () ListLongMap!19005)

(assert (=> b!1263159 (= lt!572661 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572676 () (_ BitVec 64))

(assert (=> b!1263159 (= lt!572676 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572665 () (_ BitVec 64))

(assert (=> b!1263159 (= lt!572665 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263159 (= lt!572670 (addApplyDifferent!533 lt!572661 lt!572676 minValueBefore!43 lt!572665))))

(assert (=> b!1263159 (= (apply!993 (+!4290 lt!572661 (tuple2!21133 lt!572676 minValueBefore!43)) lt!572665) (apply!993 lt!572661 lt!572665))))

(declare-fun bm!62157 () Bool)

(assert (=> bm!62157 (= call!62156 (contains!7569 lt!572659 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263160 () Bool)

(assert (=> b!1263160 (= e!719129 call!62159)))

(declare-fun b!1263161 () Bool)

(declare-fun c!122925 () Bool)

(assert (=> b!1263161 (= c!122925 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263161 (= e!719127 e!719129)))

(declare-fun b!1263162 () Bool)

(assert (=> b!1263162 (= e!719123 (= (apply!993 lt!572659 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1263163 () Bool)

(assert (=> b!1263163 (= e!719131 (= (apply!993 lt!572659 (select (arr!39720 _keys!1118) #b00000000000000000000000000000000)) (get!20286 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3423 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40259 _values!914)))))

(assert (=> b!1263163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun bm!62158 () Bool)

(assert (=> bm!62158 (= call!62157 (+!4290 (ite c!122924 call!62160 (ite c!122927 call!62158 call!62159)) (ite (or c!122924 c!122927) (tuple2!21133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21133 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1263164 () Bool)

(declare-fun res!841418 () Bool)

(assert (=> b!1263164 (=> (not res!841418) (not e!719130))))

(assert (=> b!1263164 (= res!841418 e!719128)))

(declare-fun res!841421 () Bool)

(assert (=> b!1263164 (=> res!841421 e!719128)))

(assert (=> b!1263164 (= res!841421 (not e!719120))))

(declare-fun res!841422 () Bool)

(assert (=> b!1263164 (=> (not res!841422) (not e!719120))))

(assert (=> b!1263164 (= res!841422 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (= (and d!138477 c!122924) b!1263153))

(assert (= (and d!138477 (not c!122924)) b!1263158))

(assert (= (and b!1263158 c!122927) b!1263148))

(assert (= (and b!1263158 (not c!122927)) b!1263161))

(assert (= (and b!1263161 c!122925) b!1263150))

(assert (= (and b!1263161 (not c!122925)) b!1263160))

(assert (= (or b!1263150 b!1263160) bm!62154))

(assert (= (or b!1263148 bm!62154) bm!62153))

(assert (= (or b!1263148 b!1263150) bm!62155))

(assert (= (or b!1263153 bm!62153) bm!62152))

(assert (= (or b!1263153 bm!62155) bm!62158))

(assert (= (and d!138477 res!841424) b!1263156))

(assert (= (and d!138477 c!122926) b!1263159))

(assert (= (and d!138477 (not c!122926)) b!1263152))

(assert (= (and d!138477 res!841420) b!1263164))

(assert (= (and b!1263164 res!841422) b!1263144))

(assert (= (and b!1263164 (not res!841421)) b!1263155))

(assert (= (and b!1263155 res!841425) b!1263163))

(assert (= (and b!1263164 res!841418) b!1263149))

(assert (= (and b!1263149 c!122928) b!1263154))

(assert (= (and b!1263149 (not c!122928)) b!1263151))

(assert (= (and b!1263154 res!841426) b!1263147))

(assert (= (or b!1263154 b!1263151) bm!62156))

(assert (= (and b!1263149 res!841423) b!1263146))

(assert (= (and b!1263146 c!122923) b!1263157))

(assert (= (and b!1263146 (not c!122923)) b!1263145))

(assert (= (and b!1263157 res!841419) b!1263162))

(assert (= (or b!1263157 b!1263145) bm!62157))

(declare-fun b_lambda!22921 () Bool)

(assert (=> (not b_lambda!22921) (not b!1263163)))

(assert (=> b!1263163 t!41838))

(declare-fun b_and!45469 () Bool)

(assert (= b_and!45467 (and (=> t!41838 result!23381) b_and!45469)))

(declare-fun m!1163189 () Bool)

(assert (=> b!1263159 m!1163189))

(declare-fun m!1163191 () Bool)

(assert (=> b!1263159 m!1163191))

(declare-fun m!1163193 () Bool)

(assert (=> b!1263159 m!1163193))

(declare-fun m!1163195 () Bool)

(assert (=> b!1263159 m!1163195))

(declare-fun m!1163197 () Bool)

(assert (=> b!1263159 m!1163197))

(declare-fun m!1163199 () Bool)

(assert (=> b!1263159 m!1163199))

(declare-fun m!1163201 () Bool)

(assert (=> b!1263159 m!1163201))

(declare-fun m!1163203 () Bool)

(assert (=> b!1263159 m!1163203))

(declare-fun m!1163205 () Bool)

(assert (=> b!1263159 m!1163205))

(declare-fun m!1163207 () Bool)

(assert (=> b!1263159 m!1163207))

(assert (=> b!1263159 m!1163121))

(assert (=> b!1263159 m!1163189))

(declare-fun m!1163209 () Bool)

(assert (=> b!1263159 m!1163209))

(assert (=> b!1263159 m!1163205))

(assert (=> b!1263159 m!1163199))

(assert (=> b!1263159 m!1163055))

(declare-fun m!1163211 () Bool)

(assert (=> b!1263159 m!1163211))

(declare-fun m!1163213 () Bool)

(assert (=> b!1263159 m!1163213))

(declare-fun m!1163215 () Bool)

(assert (=> b!1263159 m!1163215))

(assert (=> b!1263159 m!1163203))

(declare-fun m!1163217 () Bool)

(assert (=> b!1263159 m!1163217))

(declare-fun m!1163219 () Bool)

(assert (=> b!1263162 m!1163219))

(assert (=> b!1263144 m!1163121))

(assert (=> b!1263144 m!1163121))

(assert (=> b!1263144 m!1163123))

(declare-fun m!1163221 () Bool)

(assert (=> b!1263147 m!1163221))

(assert (=> b!1263155 m!1163121))

(assert (=> b!1263155 m!1163121))

(declare-fun m!1163223 () Bool)

(assert (=> b!1263155 m!1163223))

(assert (=> bm!62152 m!1163055))

(declare-fun m!1163225 () Bool)

(assert (=> b!1263153 m!1163225))

(declare-fun m!1163227 () Bool)

(assert (=> bm!62158 m!1163227))

(declare-fun m!1163229 () Bool)

(assert (=> bm!62157 m!1163229))

(assert (=> b!1263156 m!1163121))

(assert (=> b!1263156 m!1163121))

(assert (=> b!1263156 m!1163123))

(assert (=> b!1263163 m!1163137))

(assert (=> b!1263163 m!1163135))

(assert (=> b!1263163 m!1163135))

(assert (=> b!1263163 m!1163137))

(assert (=> b!1263163 m!1163139))

(assert (=> b!1263163 m!1163121))

(declare-fun m!1163231 () Bool)

(assert (=> b!1263163 m!1163231))

(assert (=> b!1263163 m!1163121))

(assert (=> d!138477 m!1163063))

(declare-fun m!1163233 () Bool)

(assert (=> bm!62156 m!1163233))

(assert (=> b!1262962 d!138477))

(declare-fun mapIsEmpty!50431 () Bool)

(declare-fun mapRes!50431 () Bool)

(assert (=> mapIsEmpty!50431 mapRes!50431))

(declare-fun condMapEmpty!50431 () Bool)

(declare-fun mapDefault!50431 () ValueCell!15437)

(assert (=> mapNonEmpty!50422 (= condMapEmpty!50431 (= mapRest!50422 ((as const (Array (_ BitVec 32) ValueCell!15437)) mapDefault!50431)))))

(declare-fun e!719137 () Bool)

(assert (=> mapNonEmpty!50422 (= tp!96047 (and e!719137 mapRes!50431))))

(declare-fun mapNonEmpty!50431 () Bool)

(declare-fun tp!96062 () Bool)

(declare-fun e!719136 () Bool)

(assert (=> mapNonEmpty!50431 (= mapRes!50431 (and tp!96062 e!719136))))

(declare-fun mapRest!50431 () (Array (_ BitVec 32) ValueCell!15437))

(declare-fun mapKey!50431 () (_ BitVec 32))

(declare-fun mapValue!50431 () ValueCell!15437)

(assert (=> mapNonEmpty!50431 (= mapRest!50422 (store mapRest!50431 mapKey!50431 mapValue!50431))))

(declare-fun b!1263171 () Bool)

(assert (=> b!1263171 (= e!719136 tp_is_empty!32401)))

(declare-fun b!1263172 () Bool)

(assert (=> b!1263172 (= e!719137 tp_is_empty!32401)))

(assert (= (and mapNonEmpty!50422 condMapEmpty!50431) mapIsEmpty!50431))

(assert (= (and mapNonEmpty!50422 (not condMapEmpty!50431)) mapNonEmpty!50431))

(assert (= (and mapNonEmpty!50431 ((_ is ValueCellFull!15437) mapValue!50431)) b!1263171))

(assert (= (and mapNonEmpty!50422 ((_ is ValueCellFull!15437) mapDefault!50431)) b!1263172))

(declare-fun m!1163235 () Bool)

(assert (=> mapNonEmpty!50431 m!1163235))

(declare-fun b_lambda!22923 () Bool)

(assert (= b_lambda!22913 (or (and start!106062 b_free!27499) b_lambda!22923)))

(declare-fun b_lambda!22925 () Bool)

(assert (= b_lambda!22917 (or (and start!106062 b_free!27499) b_lambda!22925)))

(declare-fun b_lambda!22927 () Bool)

(assert (= b_lambda!22921 (or (and start!106062 b_free!27499) b_lambda!22927)))

(declare-fun b_lambda!22929 () Bool)

(assert (= b_lambda!22919 (or (and start!106062 b_free!27499) b_lambda!22929)))

(declare-fun b_lambda!22931 () Bool)

(assert (= b_lambda!22915 (or (and start!106062 b_free!27499) b_lambda!22931)))

(check-sat (not b!1263088) (not b!1263049) (not b!1263144) (not d!138475) (not b!1263059) (not b!1263043) (not b!1263101) (not b!1263044) (not b!1263162) (not b_lambda!22929) (not d!138461) (not bm!62130) (not b!1263057) (not bm!62158) (not bm!62137) (not mapNonEmpty!50431) (not b!1263051) (not b!1263050) (not d!138463) (not b!1263074) (not b_next!27499) (not b!1263076) tp_is_empty!32401 (not b!1263058) (not b!1263153) (not bm!62152) (not bm!62134) (not b_lambda!22931) (not b!1263060) (not b!1263159) (not b_lambda!22927) (not bm!62157) (not b!1263048) (not d!138459) (not b!1263046) (not bm!62156) b_and!45469 (not bm!62131) (not b_lambda!22923) (not b!1263156) (not b!1263063) (not b!1263099) (not b!1263064) (not b_lambda!22925) (not b!1263091) (not b!1263155) (not b!1263062) (not b!1263163) (not b!1263045) (not b!1263147) (not d!138477) (not b!1263065) (not b!1263092))
(check-sat b_and!45469 (not b_next!27499))
