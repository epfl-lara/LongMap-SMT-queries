; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106086 () Bool)

(assert start!106086)

(declare-fun b_free!27505 () Bool)

(declare-fun b_next!27505 () Bool)

(assert (=> start!106086 (= b_free!27505 (not b_next!27505))))

(declare-fun tp!96067 () Bool)

(declare-fun b_and!45471 () Bool)

(assert (=> start!106086 (= tp!96067 b_and!45471)))

(declare-fun res!841443 () Bool)

(declare-fun e!719152 () Bool)

(assert (=> start!106086 (=> (not res!841443) (not e!719152))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106086 (= res!841443 (validMask!0 mask!1466))))

(assert (=> start!106086 e!719152))

(assert (=> start!106086 true))

(assert (=> start!106086 tp!96067))

(declare-fun tp_is_empty!32407 () Bool)

(assert (=> start!106086 tp_is_empty!32407))

(declare-datatypes ((array!82359 0))(
  ( (array!82360 (arr!39726 (Array (_ BitVec 32) (_ BitVec 64))) (size!40264 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82359)

(declare-fun array_inv!30393 (array!82359) Bool)

(assert (=> start!106086 (array_inv!30393 _keys!1118)))

(declare-datatypes ((V!48575 0))(
  ( (V!48576 (val!16266 Int)) )
))
(declare-datatypes ((ValueCell!15440 0))(
  ( (ValueCellFull!15440 (v!18975 V!48575)) (EmptyCell!15440) )
))
(declare-datatypes ((array!82361 0))(
  ( (array!82362 (arr!39727 (Array (_ BitVec 32) ValueCell!15440)) (size!40265 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82361)

(declare-fun e!719157 () Bool)

(declare-fun array_inv!30394 (array!82361) Bool)

(assert (=> start!106086 (and (array_inv!30394 _values!914) e!719157)))

(declare-fun b!1263191 () Bool)

(declare-fun e!719158 () Bool)

(assert (=> b!1263191 (= e!719158 tp_is_empty!32407)))

(declare-fun mapIsEmpty!50434 () Bool)

(declare-fun mapRes!50434 () Bool)

(assert (=> mapIsEmpty!50434 mapRes!50434))

(declare-fun b!1263192 () Bool)

(declare-fun res!841444 () Bool)

(assert (=> b!1263192 (=> (not res!841444) (not e!719152))))

(declare-datatypes ((List!28335 0))(
  ( (Nil!28332) (Cons!28331 (h!29540 (_ BitVec 64)) (t!41839 List!28335)) )
))
(declare-fun arrayNoDuplicates!0 (array!82359 (_ BitVec 32) List!28335) Bool)

(assert (=> b!1263192 (= res!841444 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28332))))

(declare-fun b!1263193 () Bool)

(declare-fun e!719156 () Bool)

(assert (=> b!1263193 (= e!719156 tp_is_empty!32407)))

(declare-fun b!1263194 () Bool)

(declare-fun e!719153 () Bool)

(declare-fun e!719154 () Bool)

(assert (=> b!1263194 (= e!719153 e!719154)))

(declare-fun res!841442 () Bool)

(assert (=> b!1263194 (=> res!841442 e!719154)))

(declare-datatypes ((tuple2!21136 0))(
  ( (tuple2!21137 (_1!10579 (_ BitVec 64)) (_2!10579 V!48575)) )
))
(declare-datatypes ((List!28336 0))(
  ( (Nil!28333) (Cons!28332 (h!29541 tuple2!21136) (t!41840 List!28336)) )
))
(declare-datatypes ((ListLongMap!19009 0))(
  ( (ListLongMap!19010 (toList!9520 List!28336)) )
))
(declare-fun lt!572690 () ListLongMap!19009)

(declare-fun contains!7572 (ListLongMap!19009 (_ BitVec 64)) Bool)

(assert (=> b!1263194 (= res!841442 (contains!7572 lt!572690 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48575)

(declare-fun minValueBefore!43 () V!48575)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun getCurrentListMap!4575 (array!82359 array!82361 (_ BitVec 32) (_ BitVec 32) V!48575 V!48575 (_ BitVec 32) Int) ListLongMap!19009)

(assert (=> b!1263194 (= lt!572690 (getCurrentListMap!4575 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50434 () Bool)

(declare-fun tp!96068 () Bool)

(assert (=> mapNonEmpty!50434 (= mapRes!50434 (and tp!96068 e!719156))))

(declare-fun mapKey!50434 () (_ BitVec 32))

(declare-fun mapRest!50434 () (Array (_ BitVec 32) ValueCell!15440))

(declare-fun mapValue!50434 () ValueCell!15440)

(assert (=> mapNonEmpty!50434 (= (arr!39727 _values!914) (store mapRest!50434 mapKey!50434 mapValue!50434))))

(declare-fun b!1263195 () Bool)

(declare-fun res!841441 () Bool)

(assert (=> b!1263195 (=> (not res!841441) (not e!719152))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1263195 (= res!841441 (and (= (size!40265 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40264 _keys!1118) (size!40265 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263196 () Bool)

(assert (=> b!1263196 (= e!719157 (and e!719158 mapRes!50434))))

(declare-fun condMapEmpty!50434 () Bool)

(declare-fun mapDefault!50434 () ValueCell!15440)

(assert (=> b!1263196 (= condMapEmpty!50434 (= (arr!39727 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15440)) mapDefault!50434)))))

(declare-fun b!1263197 () Bool)

(declare-fun res!841440 () Bool)

(assert (=> b!1263197 (=> (not res!841440) (not e!719152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82359 (_ BitVec 32)) Bool)

(assert (=> b!1263197 (= res!841440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun minValueAfter!43 () V!48575)

(declare-fun lt!572694 () ListLongMap!19009)

(declare-fun b!1263198 () Bool)

(assert (=> b!1263198 (= e!719154 (= lt!572694 (getCurrentListMap!4575 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922)))))

(assert (=> b!1263198 (= lt!572694 lt!572690)))

(declare-fun -!2099 (ListLongMap!19009 (_ BitVec 64)) ListLongMap!19009)

(assert (=> b!1263198 (= lt!572694 (-!2099 lt!572690 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!41956 0))(
  ( (Unit!41957) )
))
(declare-fun lt!572689 () Unit!41956)

(declare-fun removeNotPresentStillSame!151 (ListLongMap!19009 (_ BitVec 64)) Unit!41956)

(assert (=> b!1263198 (= lt!572689 (removeNotPresentStillSame!151 lt!572690 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263199 () Bool)

(assert (=> b!1263199 (= e!719152 (not e!719153))))

(declare-fun res!841439 () Bool)

(assert (=> b!1263199 (=> res!841439 e!719153)))

(assert (=> b!1263199 (= res!841439 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!572691 () ListLongMap!19009)

(declare-fun lt!572692 () ListLongMap!19009)

(assert (=> b!1263199 (= lt!572691 lt!572692)))

(declare-fun lt!572693 () Unit!41956)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1187 (array!82359 array!82361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48575 V!48575 V!48575 V!48575 (_ BitVec 32) Int) Unit!41956)

(assert (=> b!1263199 (= lt!572693 (lemmaNoChangeToArrayThenSameMapNoExtras!1187 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5887 (array!82359 array!82361 (_ BitVec 32) (_ BitVec 32) V!48575 V!48575 (_ BitVec 32) Int) ListLongMap!19009)

(assert (=> b!1263199 (= lt!572692 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263199 (= lt!572691 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!106086 res!841443) b!1263195))

(assert (= (and b!1263195 res!841441) b!1263197))

(assert (= (and b!1263197 res!841440) b!1263192))

(assert (= (and b!1263192 res!841444) b!1263199))

(assert (= (and b!1263199 (not res!841439)) b!1263194))

(assert (= (and b!1263194 (not res!841442)) b!1263198))

(assert (= (and b!1263196 condMapEmpty!50434) mapIsEmpty!50434))

(assert (= (and b!1263196 (not condMapEmpty!50434)) mapNonEmpty!50434))

(get-info :version)

(assert (= (and mapNonEmpty!50434 ((_ is ValueCellFull!15440) mapValue!50434)) b!1263193))

(assert (= (and b!1263196 ((_ is ValueCellFull!15440) mapDefault!50434)) b!1263191))

(assert (= start!106086 b!1263196))

(declare-fun m!1163237 () Bool)

(assert (=> b!1263199 m!1163237))

(declare-fun m!1163239 () Bool)

(assert (=> b!1263199 m!1163239))

(declare-fun m!1163241 () Bool)

(assert (=> b!1263199 m!1163241))

(declare-fun m!1163243 () Bool)

(assert (=> start!106086 m!1163243))

(declare-fun m!1163245 () Bool)

(assert (=> start!106086 m!1163245))

(declare-fun m!1163247 () Bool)

(assert (=> start!106086 m!1163247))

(declare-fun m!1163249 () Bool)

(assert (=> mapNonEmpty!50434 m!1163249))

(declare-fun m!1163251 () Bool)

(assert (=> b!1263198 m!1163251))

(declare-fun m!1163253 () Bool)

(assert (=> b!1263198 m!1163253))

(declare-fun m!1163255 () Bool)

(assert (=> b!1263198 m!1163255))

(declare-fun m!1163257 () Bool)

(assert (=> b!1263194 m!1163257))

(declare-fun m!1163259 () Bool)

(assert (=> b!1263194 m!1163259))

(declare-fun m!1163261 () Bool)

(assert (=> b!1263197 m!1163261))

(declare-fun m!1163263 () Bool)

(assert (=> b!1263192 m!1163263))

(check-sat (not b!1263197) (not b!1263194) (not b!1263199) (not start!106086) (not mapNonEmpty!50434) b_and!45471 (not b_next!27505) tp_is_empty!32407 (not b!1263192) (not b!1263198))
(check-sat b_and!45471 (not b_next!27505))
(get-model)

(declare-fun d!138481 () Bool)

(assert (=> d!138481 (= (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572733 () Unit!41956)

(declare-fun choose!1884 (array!82359 array!82361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48575 V!48575 V!48575 V!48575 (_ BitVec 32) Int) Unit!41956)

(assert (=> d!138481 (= lt!572733 (choose!1884 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138481 (validMask!0 mask!1466)))

(assert (=> d!138481 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1187 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572733)))

(declare-fun bs!35716 () Bool)

(assert (= bs!35716 d!138481))

(assert (=> bs!35716 m!1163241))

(assert (=> bs!35716 m!1163239))

(declare-fun m!1163321 () Bool)

(assert (=> bs!35716 m!1163321))

(assert (=> bs!35716 m!1163243))

(assert (=> b!1263199 d!138481))

(declare-fun b!1263278 () Bool)

(declare-fun lt!572752 () Unit!41956)

(declare-fun lt!572748 () Unit!41956)

(assert (=> b!1263278 (= lt!572752 lt!572748)))

(declare-fun lt!572754 () ListLongMap!19009)

(declare-fun lt!572751 () (_ BitVec 64))

(declare-fun lt!572753 () V!48575)

(declare-fun lt!572750 () (_ BitVec 64))

(declare-fun +!4291 (ListLongMap!19009 tuple2!21136) ListLongMap!19009)

(assert (=> b!1263278 (not (contains!7572 (+!4291 lt!572754 (tuple2!21137 lt!572750 lt!572753)) lt!572751))))

(declare-fun addStillNotContains!330 (ListLongMap!19009 (_ BitVec 64) V!48575 (_ BitVec 64)) Unit!41956)

(assert (=> b!1263278 (= lt!572748 (addStillNotContains!330 lt!572754 lt!572750 lt!572753 lt!572751))))

(assert (=> b!1263278 (= lt!572751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20289 (ValueCell!15440 V!48575) V!48575)

(declare-fun dynLambda!3424 (Int (_ BitVec 64)) V!48575)

(assert (=> b!1263278 (= lt!572753 (get!20289 (select (arr!39727 _values!914) #b00000000000000000000000000000000) (dynLambda!3424 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263278 (= lt!572750 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62164 () ListLongMap!19009)

(assert (=> b!1263278 (= lt!572754 call!62164)))

(declare-fun e!719221 () ListLongMap!19009)

(assert (=> b!1263278 (= e!719221 (+!4291 call!62164 (tuple2!21137 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000) (get!20289 (select (arr!39727 _values!914) #b00000000000000000000000000000000) (dynLambda!3424 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263279 () Bool)

(declare-fun e!719215 () ListLongMap!19009)

(assert (=> b!1263279 (= e!719215 e!719221)))

(declare-fun c!122937 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263279 (= c!122937 (validKeyInArray!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263280 () Bool)

(declare-fun e!719220 () Bool)

(declare-fun e!719216 () Bool)

(assert (=> b!1263280 (= e!719220 e!719216)))

(declare-fun c!122940 () Bool)

(declare-fun e!719218 () Bool)

(assert (=> b!1263280 (= c!122940 e!719218)))

(declare-fun res!841492 () Bool)

(assert (=> b!1263280 (=> (not res!841492) (not e!719218))))

(assert (=> b!1263280 (= res!841492 (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun b!1263281 () Bool)

(assert (=> b!1263281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(assert (=> b!1263281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40265 _values!914)))))

(declare-fun e!719219 () Bool)

(declare-fun lt!572749 () ListLongMap!19009)

(declare-fun apply!994 (ListLongMap!19009 (_ BitVec 64)) V!48575)

(assert (=> b!1263281 (= e!719219 (= (apply!994 lt!572749 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)) (get!20289 (select (arr!39727 _values!914) #b00000000000000000000000000000000) (dynLambda!3424 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263282 () Bool)

(declare-fun e!719217 () Bool)

(assert (=> b!1263282 (= e!719217 (= lt!572749 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!62161 () Bool)

(assert (=> bm!62161 (= call!62164 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263284 () Bool)

(assert (=> b!1263284 (= e!719218 (validKeyInArray!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263284 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263285 () Bool)

(assert (=> b!1263285 (= e!719215 (ListLongMap!19010 Nil!28333))))

(declare-fun b!1263286 () Bool)

(assert (=> b!1263286 (= e!719221 call!62164)))

(declare-fun b!1263287 () Bool)

(declare-fun isEmpty!1049 (ListLongMap!19009) Bool)

(assert (=> b!1263287 (= e!719217 (isEmpty!1049 lt!572749))))

(declare-fun b!1263283 () Bool)

(assert (=> b!1263283 (= e!719216 e!719217)))

(declare-fun c!122938 () Bool)

(assert (=> b!1263283 (= c!122938 (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun d!138483 () Bool)

(assert (=> d!138483 e!719220))

(declare-fun res!841490 () Bool)

(assert (=> d!138483 (=> (not res!841490) (not e!719220))))

(assert (=> d!138483 (= res!841490 (not (contains!7572 lt!572749 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138483 (= lt!572749 e!719215)))

(declare-fun c!122939 () Bool)

(assert (=> d!138483 (= c!122939 (bvsge #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(assert (=> d!138483 (validMask!0 mask!1466)))

(assert (=> d!138483 (= (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572749)))

(declare-fun b!1263288 () Bool)

(declare-fun res!841491 () Bool)

(assert (=> b!1263288 (=> (not res!841491) (not e!719220))))

(assert (=> b!1263288 (= res!841491 (not (contains!7572 lt!572749 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263289 () Bool)

(assert (=> b!1263289 (= e!719216 e!719219)))

(assert (=> b!1263289 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun res!841489 () Bool)

(assert (=> b!1263289 (= res!841489 (contains!7572 lt!572749 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263289 (=> (not res!841489) (not e!719219))))

(assert (= (and d!138483 c!122939) b!1263285))

(assert (= (and d!138483 (not c!122939)) b!1263279))

(assert (= (and b!1263279 c!122937) b!1263278))

(assert (= (and b!1263279 (not c!122937)) b!1263286))

(assert (= (or b!1263278 b!1263286) bm!62161))

(assert (= (and d!138483 res!841490) b!1263288))

(assert (= (and b!1263288 res!841491) b!1263280))

(assert (= (and b!1263280 res!841492) b!1263284))

(assert (= (and b!1263280 c!122940) b!1263289))

(assert (= (and b!1263280 (not c!122940)) b!1263283))

(assert (= (and b!1263289 res!841489) b!1263281))

(assert (= (and b!1263283 c!122938) b!1263282))

(assert (= (and b!1263283 (not c!122938)) b!1263287))

(declare-fun b_lambda!22933 () Bool)

(assert (=> (not b_lambda!22933) (not b!1263278)))

(declare-fun t!41844 () Bool)

(declare-fun tb!11321 () Bool)

(assert (=> (and start!106086 (= defaultEntry!922 defaultEntry!922) t!41844) tb!11321))

(declare-fun result!23387 () Bool)

(assert (=> tb!11321 (= result!23387 tp_is_empty!32407)))

(assert (=> b!1263278 t!41844))

(declare-fun b_and!45477 () Bool)

(assert (= b_and!45471 (and (=> t!41844 result!23387) b_and!45477)))

(declare-fun b_lambda!22935 () Bool)

(assert (=> (not b_lambda!22935) (not b!1263281)))

(assert (=> b!1263281 t!41844))

(declare-fun b_and!45479 () Bool)

(assert (= b_and!45477 (and (=> t!41844 result!23387) b_and!45479)))

(declare-fun m!1163323 () Bool)

(assert (=> bm!62161 m!1163323))

(assert (=> b!1263282 m!1163323))

(declare-fun m!1163325 () Bool)

(assert (=> b!1263287 m!1163325))

(declare-fun m!1163327 () Bool)

(assert (=> b!1263278 m!1163327))

(declare-fun m!1163329 () Bool)

(assert (=> b!1263278 m!1163329))

(declare-fun m!1163331 () Bool)

(assert (=> b!1263278 m!1163331))

(declare-fun m!1163333 () Bool)

(assert (=> b!1263278 m!1163333))

(declare-fun m!1163335 () Bool)

(assert (=> b!1263278 m!1163335))

(declare-fun m!1163337 () Bool)

(assert (=> b!1263278 m!1163337))

(declare-fun m!1163339 () Bool)

(assert (=> b!1263278 m!1163339))

(assert (=> b!1263278 m!1163331))

(assert (=> b!1263278 m!1163335))

(declare-fun m!1163341 () Bool)

(assert (=> b!1263278 m!1163341))

(assert (=> b!1263278 m!1163329))

(declare-fun m!1163343 () Bool)

(assert (=> d!138483 m!1163343))

(assert (=> d!138483 m!1163243))

(assert (=> b!1263281 m!1163339))

(declare-fun m!1163345 () Bool)

(assert (=> b!1263281 m!1163345))

(assert (=> b!1263281 m!1163329))

(assert (=> b!1263281 m!1163331))

(assert (=> b!1263281 m!1163333))

(assert (=> b!1263281 m!1163329))

(assert (=> b!1263281 m!1163339))

(assert (=> b!1263281 m!1163331))

(assert (=> b!1263279 m!1163339))

(assert (=> b!1263279 m!1163339))

(declare-fun m!1163347 () Bool)

(assert (=> b!1263279 m!1163347))

(assert (=> b!1263289 m!1163339))

(assert (=> b!1263289 m!1163339))

(declare-fun m!1163349 () Bool)

(assert (=> b!1263289 m!1163349))

(declare-fun m!1163351 () Bool)

(assert (=> b!1263288 m!1163351))

(assert (=> b!1263284 m!1163339))

(assert (=> b!1263284 m!1163339))

(assert (=> b!1263284 m!1163347))

(assert (=> b!1263199 d!138483))

(declare-fun b!1263292 () Bool)

(declare-fun lt!572759 () Unit!41956)

(declare-fun lt!572755 () Unit!41956)

(assert (=> b!1263292 (= lt!572759 lt!572755)))

(declare-fun lt!572761 () ListLongMap!19009)

(declare-fun lt!572760 () V!48575)

(declare-fun lt!572757 () (_ BitVec 64))

(declare-fun lt!572758 () (_ BitVec 64))

(assert (=> b!1263292 (not (contains!7572 (+!4291 lt!572761 (tuple2!21137 lt!572757 lt!572760)) lt!572758))))

(assert (=> b!1263292 (= lt!572755 (addStillNotContains!330 lt!572761 lt!572757 lt!572760 lt!572758))))

(assert (=> b!1263292 (= lt!572758 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263292 (= lt!572760 (get!20289 (select (arr!39727 _values!914) #b00000000000000000000000000000000) (dynLambda!3424 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263292 (= lt!572757 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62165 () ListLongMap!19009)

(assert (=> b!1263292 (= lt!572761 call!62165)))

(declare-fun e!719228 () ListLongMap!19009)

(assert (=> b!1263292 (= e!719228 (+!4291 call!62165 (tuple2!21137 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000) (get!20289 (select (arr!39727 _values!914) #b00000000000000000000000000000000) (dynLambda!3424 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263293 () Bool)

(declare-fun e!719222 () ListLongMap!19009)

(assert (=> b!1263293 (= e!719222 e!719228)))

(declare-fun c!122941 () Bool)

(assert (=> b!1263293 (= c!122941 (validKeyInArray!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263294 () Bool)

(declare-fun e!719227 () Bool)

(declare-fun e!719223 () Bool)

(assert (=> b!1263294 (= e!719227 e!719223)))

(declare-fun c!122944 () Bool)

(declare-fun e!719225 () Bool)

(assert (=> b!1263294 (= c!122944 e!719225)))

(declare-fun res!841496 () Bool)

(assert (=> b!1263294 (=> (not res!841496) (not e!719225))))

(assert (=> b!1263294 (= res!841496 (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun b!1263295 () Bool)

(assert (=> b!1263295 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(assert (=> b!1263295 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40265 _values!914)))))

(declare-fun lt!572756 () ListLongMap!19009)

(declare-fun e!719226 () Bool)

(assert (=> b!1263295 (= e!719226 (= (apply!994 lt!572756 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)) (get!20289 (select (arr!39727 _values!914) #b00000000000000000000000000000000) (dynLambda!3424 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263296 () Bool)

(declare-fun e!719224 () Bool)

(assert (=> b!1263296 (= e!719224 (= lt!572756 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!62162 () Bool)

(assert (=> bm!62162 (= call!62165 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263298 () Bool)

(assert (=> b!1263298 (= e!719225 (validKeyInArray!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263298 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263299 () Bool)

(assert (=> b!1263299 (= e!719222 (ListLongMap!19010 Nil!28333))))

(declare-fun b!1263300 () Bool)

(assert (=> b!1263300 (= e!719228 call!62165)))

(declare-fun b!1263301 () Bool)

(assert (=> b!1263301 (= e!719224 (isEmpty!1049 lt!572756))))

(declare-fun b!1263297 () Bool)

(assert (=> b!1263297 (= e!719223 e!719224)))

(declare-fun c!122942 () Bool)

(assert (=> b!1263297 (= c!122942 (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun d!138485 () Bool)

(assert (=> d!138485 e!719227))

(declare-fun res!841494 () Bool)

(assert (=> d!138485 (=> (not res!841494) (not e!719227))))

(assert (=> d!138485 (= res!841494 (not (contains!7572 lt!572756 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138485 (= lt!572756 e!719222)))

(declare-fun c!122943 () Bool)

(assert (=> d!138485 (= c!122943 (bvsge #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(assert (=> d!138485 (validMask!0 mask!1466)))

(assert (=> d!138485 (= (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572756)))

(declare-fun b!1263302 () Bool)

(declare-fun res!841495 () Bool)

(assert (=> b!1263302 (=> (not res!841495) (not e!719227))))

(assert (=> b!1263302 (= res!841495 (not (contains!7572 lt!572756 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263303 () Bool)

(assert (=> b!1263303 (= e!719223 e!719226)))

(assert (=> b!1263303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun res!841493 () Bool)

(assert (=> b!1263303 (= res!841493 (contains!7572 lt!572756 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263303 (=> (not res!841493) (not e!719226))))

(assert (= (and d!138485 c!122943) b!1263299))

(assert (= (and d!138485 (not c!122943)) b!1263293))

(assert (= (and b!1263293 c!122941) b!1263292))

(assert (= (and b!1263293 (not c!122941)) b!1263300))

(assert (= (or b!1263292 b!1263300) bm!62162))

(assert (= (and d!138485 res!841494) b!1263302))

(assert (= (and b!1263302 res!841495) b!1263294))

(assert (= (and b!1263294 res!841496) b!1263298))

(assert (= (and b!1263294 c!122944) b!1263303))

(assert (= (and b!1263294 (not c!122944)) b!1263297))

(assert (= (and b!1263303 res!841493) b!1263295))

(assert (= (and b!1263297 c!122942) b!1263296))

(assert (= (and b!1263297 (not c!122942)) b!1263301))

(declare-fun b_lambda!22937 () Bool)

(assert (=> (not b_lambda!22937) (not b!1263292)))

(assert (=> b!1263292 t!41844))

(declare-fun b_and!45481 () Bool)

(assert (= b_and!45479 (and (=> t!41844 result!23387) b_and!45481)))

(declare-fun b_lambda!22939 () Bool)

(assert (=> (not b_lambda!22939) (not b!1263295)))

(assert (=> b!1263295 t!41844))

(declare-fun b_and!45483 () Bool)

(assert (= b_and!45481 (and (=> t!41844 result!23387) b_and!45483)))

(declare-fun m!1163353 () Bool)

(assert (=> bm!62162 m!1163353))

(assert (=> b!1263296 m!1163353))

(declare-fun m!1163355 () Bool)

(assert (=> b!1263301 m!1163355))

(declare-fun m!1163357 () Bool)

(assert (=> b!1263292 m!1163357))

(assert (=> b!1263292 m!1163329))

(assert (=> b!1263292 m!1163331))

(assert (=> b!1263292 m!1163333))

(declare-fun m!1163359 () Bool)

(assert (=> b!1263292 m!1163359))

(declare-fun m!1163361 () Bool)

(assert (=> b!1263292 m!1163361))

(assert (=> b!1263292 m!1163339))

(assert (=> b!1263292 m!1163331))

(assert (=> b!1263292 m!1163359))

(declare-fun m!1163363 () Bool)

(assert (=> b!1263292 m!1163363))

(assert (=> b!1263292 m!1163329))

(declare-fun m!1163365 () Bool)

(assert (=> d!138485 m!1163365))

(assert (=> d!138485 m!1163243))

(assert (=> b!1263295 m!1163339))

(declare-fun m!1163367 () Bool)

(assert (=> b!1263295 m!1163367))

(assert (=> b!1263295 m!1163329))

(assert (=> b!1263295 m!1163331))

(assert (=> b!1263295 m!1163333))

(assert (=> b!1263295 m!1163329))

(assert (=> b!1263295 m!1163339))

(assert (=> b!1263295 m!1163331))

(assert (=> b!1263293 m!1163339))

(assert (=> b!1263293 m!1163339))

(assert (=> b!1263293 m!1163347))

(assert (=> b!1263303 m!1163339))

(assert (=> b!1263303 m!1163339))

(declare-fun m!1163369 () Bool)

(assert (=> b!1263303 m!1163369))

(declare-fun m!1163371 () Bool)

(assert (=> b!1263302 m!1163371))

(assert (=> b!1263298 m!1163339))

(assert (=> b!1263298 m!1163339))

(assert (=> b!1263298 m!1163347))

(assert (=> b!1263199 d!138485))

(declare-fun d!138487 () Bool)

(assert (=> d!138487 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106086 d!138487))

(declare-fun d!138489 () Bool)

(assert (=> d!138489 (= (array_inv!30393 _keys!1118) (bvsge (size!40264 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106086 d!138489))

(declare-fun d!138491 () Bool)

(assert (=> d!138491 (= (array_inv!30394 _values!914) (bvsge (size!40265 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106086 d!138491))

(declare-fun b!1263314 () Bool)

(declare-fun e!719237 () Bool)

(declare-fun e!719238 () Bool)

(assert (=> b!1263314 (= e!719237 e!719238)))

(declare-fun c!122947 () Bool)

(assert (=> b!1263314 (= c!122947 (validKeyInArray!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263315 () Bool)

(declare-fun call!62168 () Bool)

(assert (=> b!1263315 (= e!719238 call!62168)))

(declare-fun b!1263316 () Bool)

(declare-fun e!719239 () Bool)

(declare-fun contains!7574 (List!28335 (_ BitVec 64)) Bool)

(assert (=> b!1263316 (= e!719239 (contains!7574 Nil!28332 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263317 () Bool)

(declare-fun e!719240 () Bool)

(assert (=> b!1263317 (= e!719240 e!719237)))

(declare-fun res!841503 () Bool)

(assert (=> b!1263317 (=> (not res!841503) (not e!719237))))

(assert (=> b!1263317 (= res!841503 (not e!719239))))

(declare-fun res!841505 () Bool)

(assert (=> b!1263317 (=> (not res!841505) (not e!719239))))

(assert (=> b!1263317 (= res!841505 (validKeyInArray!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62165 () Bool)

(assert (=> bm!62165 (= call!62168 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122947 (Cons!28331 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000) Nil!28332) Nil!28332)))))

(declare-fun b!1263318 () Bool)

(assert (=> b!1263318 (= e!719238 call!62168)))

(declare-fun d!138493 () Bool)

(declare-fun res!841504 () Bool)

(assert (=> d!138493 (=> res!841504 e!719240)))

(assert (=> d!138493 (= res!841504 (bvsge #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(assert (=> d!138493 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28332) e!719240)))

(assert (= (and d!138493 (not res!841504)) b!1263317))

(assert (= (and b!1263317 res!841505) b!1263316))

(assert (= (and b!1263317 res!841503) b!1263314))

(assert (= (and b!1263314 c!122947) b!1263318))

(assert (= (and b!1263314 (not c!122947)) b!1263315))

(assert (= (or b!1263318 b!1263315) bm!62165))

(assert (=> b!1263314 m!1163339))

(assert (=> b!1263314 m!1163339))

(assert (=> b!1263314 m!1163347))

(assert (=> b!1263316 m!1163339))

(assert (=> b!1263316 m!1163339))

(declare-fun m!1163373 () Bool)

(assert (=> b!1263316 m!1163373))

(assert (=> b!1263317 m!1163339))

(assert (=> b!1263317 m!1163339))

(assert (=> b!1263317 m!1163347))

(assert (=> bm!62165 m!1163339))

(declare-fun m!1163375 () Bool)

(assert (=> bm!62165 m!1163375))

(assert (=> b!1263192 d!138493))

(declare-fun b!1263327 () Bool)

(declare-fun e!719247 () Bool)

(declare-fun e!719249 () Bool)

(assert (=> b!1263327 (= e!719247 e!719249)))

(declare-fun lt!572770 () (_ BitVec 64))

(assert (=> b!1263327 (= lt!572770 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572768 () Unit!41956)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82359 (_ BitVec 64) (_ BitVec 32)) Unit!41956)

(assert (=> b!1263327 (= lt!572768 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572770 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263327 (arrayContainsKey!0 _keys!1118 lt!572770 #b00000000000000000000000000000000)))

(declare-fun lt!572769 () Unit!41956)

(assert (=> b!1263327 (= lt!572769 lt!572768)))

(declare-fun res!841511 () Bool)

(declare-datatypes ((SeekEntryResult!9978 0))(
  ( (MissingZero!9978 (index!42283 (_ BitVec 32))) (Found!9978 (index!42284 (_ BitVec 32))) (Intermediate!9978 (undefined!10790 Bool) (index!42285 (_ BitVec 32)) (x!111321 (_ BitVec 32))) (Undefined!9978) (MissingVacant!9978 (index!42286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82359 (_ BitVec 32)) SeekEntryResult!9978)

(assert (=> b!1263327 (= res!841511 (= (seekEntryOrOpen!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9978 #b00000000000000000000000000000000)))))

(assert (=> b!1263327 (=> (not res!841511) (not e!719249))))

(declare-fun b!1263328 () Bool)

(declare-fun call!62171 () Bool)

(assert (=> b!1263328 (= e!719249 call!62171)))

(declare-fun b!1263329 () Bool)

(assert (=> b!1263329 (= e!719247 call!62171)))

(declare-fun d!138495 () Bool)

(declare-fun res!841510 () Bool)

(declare-fun e!719248 () Bool)

(assert (=> d!138495 (=> res!841510 e!719248)))

(assert (=> d!138495 (= res!841510 (bvsge #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(assert (=> d!138495 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719248)))

(declare-fun bm!62168 () Bool)

(assert (=> bm!62168 (= call!62171 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1263330 () Bool)

(assert (=> b!1263330 (= e!719248 e!719247)))

(declare-fun c!122950 () Bool)

(assert (=> b!1263330 (= c!122950 (validKeyInArray!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138495 (not res!841510)) b!1263330))

(assert (= (and b!1263330 c!122950) b!1263327))

(assert (= (and b!1263330 (not c!122950)) b!1263329))

(assert (= (and b!1263327 res!841511) b!1263328))

(assert (= (or b!1263328 b!1263329) bm!62168))

(assert (=> b!1263327 m!1163339))

(declare-fun m!1163377 () Bool)

(assert (=> b!1263327 m!1163377))

(declare-fun m!1163379 () Bool)

(assert (=> b!1263327 m!1163379))

(assert (=> b!1263327 m!1163339))

(declare-fun m!1163381 () Bool)

(assert (=> b!1263327 m!1163381))

(declare-fun m!1163383 () Bool)

(assert (=> bm!62168 m!1163383))

(assert (=> b!1263330 m!1163339))

(assert (=> b!1263330 m!1163339))

(assert (=> b!1263330 m!1163347))

(assert (=> b!1263197 d!138495))

(declare-fun d!138497 () Bool)

(declare-fun e!719254 () Bool)

(assert (=> d!138497 e!719254))

(declare-fun res!841514 () Bool)

(assert (=> d!138497 (=> res!841514 e!719254)))

(declare-fun lt!572781 () Bool)

(assert (=> d!138497 (= res!841514 (not lt!572781))))

(declare-fun lt!572782 () Bool)

(assert (=> d!138497 (= lt!572781 lt!572782)))

(declare-fun lt!572780 () Unit!41956)

(declare-fun e!719255 () Unit!41956)

(assert (=> d!138497 (= lt!572780 e!719255)))

(declare-fun c!122953 () Bool)

(assert (=> d!138497 (= c!122953 lt!572782)))

(declare-fun containsKey!624 (List!28336 (_ BitVec 64)) Bool)

(assert (=> d!138497 (= lt!572782 (containsKey!624 (toList!9520 lt!572690) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138497 (= (contains!7572 lt!572690 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572781)))

(declare-fun b!1263337 () Bool)

(declare-fun lt!572779 () Unit!41956)

(assert (=> b!1263337 (= e!719255 lt!572779)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!434 (List!28336 (_ BitVec 64)) Unit!41956)

(assert (=> b!1263337 (= lt!572779 (lemmaContainsKeyImpliesGetValueByKeyDefined!434 (toList!9520 lt!572690) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!719 0))(
  ( (Some!718 (v!18978 V!48575)) (None!717) )
))
(declare-fun isDefined!477 (Option!719) Bool)

(declare-fun getValueByKey!668 (List!28336 (_ BitVec 64)) Option!719)

(assert (=> b!1263337 (isDefined!477 (getValueByKey!668 (toList!9520 lt!572690) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263338 () Bool)

(declare-fun Unit!41960 () Unit!41956)

(assert (=> b!1263338 (= e!719255 Unit!41960)))

(declare-fun b!1263339 () Bool)

(assert (=> b!1263339 (= e!719254 (isDefined!477 (getValueByKey!668 (toList!9520 lt!572690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138497 c!122953) b!1263337))

(assert (= (and d!138497 (not c!122953)) b!1263338))

(assert (= (and d!138497 (not res!841514)) b!1263339))

(declare-fun m!1163385 () Bool)

(assert (=> d!138497 m!1163385))

(declare-fun m!1163387 () Bool)

(assert (=> b!1263337 m!1163387))

(declare-fun m!1163389 () Bool)

(assert (=> b!1263337 m!1163389))

(assert (=> b!1263337 m!1163389))

(declare-fun m!1163391 () Bool)

(assert (=> b!1263337 m!1163391))

(assert (=> b!1263339 m!1163389))

(assert (=> b!1263339 m!1163389))

(assert (=> b!1263339 m!1163391))

(assert (=> b!1263194 d!138497))

(declare-fun b!1263382 () Bool)

(declare-fun e!719289 () Bool)

(declare-fun lt!572831 () ListLongMap!19009)

(assert (=> b!1263382 (= e!719289 (= (apply!994 lt!572831 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)) (get!20289 (select (arr!39727 _values!914) #b00000000000000000000000000000000) (dynLambda!3424 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263382 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40265 _values!914)))))

(assert (=> b!1263382 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun b!1263383 () Bool)

(declare-fun e!719284 () ListLongMap!19009)

(declare-fun call!62191 () ListLongMap!19009)

(assert (=> b!1263383 (= e!719284 call!62191)))

(declare-fun bm!62183 () Bool)

(declare-fun call!62190 () ListLongMap!19009)

(declare-fun call!62192 () ListLongMap!19009)

(assert (=> bm!62183 (= call!62190 call!62192)))

(declare-fun c!122967 () Bool)

(declare-fun c!122969 () Bool)

(declare-fun call!62188 () ListLongMap!19009)

(declare-fun bm!62184 () Bool)

(assert (=> bm!62184 (= call!62188 (+!4291 (ite c!122967 call!62192 (ite c!122969 call!62190 call!62191)) (ite (or c!122967 c!122969) (tuple2!21137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21137 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1263385 () Bool)

(declare-fun e!719294 () ListLongMap!19009)

(declare-fun call!62189 () ListLongMap!19009)

(assert (=> b!1263385 (= e!719294 call!62189)))

(declare-fun b!1263386 () Bool)

(declare-fun e!719282 () Bool)

(assert (=> b!1263386 (= e!719282 (validKeyInArray!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263387 () Bool)

(declare-fun e!719291 () Unit!41956)

(declare-fun lt!572842 () Unit!41956)

(assert (=> b!1263387 (= e!719291 lt!572842)))

(declare-fun lt!572848 () ListLongMap!19009)

(assert (=> b!1263387 (= lt!572848 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572834 () (_ BitVec 64))

(assert (=> b!1263387 (= lt!572834 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572845 () (_ BitVec 64))

(assert (=> b!1263387 (= lt!572845 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572828 () Unit!41956)

(declare-fun addStillContains!1091 (ListLongMap!19009 (_ BitVec 64) V!48575 (_ BitVec 64)) Unit!41956)

(assert (=> b!1263387 (= lt!572828 (addStillContains!1091 lt!572848 lt!572834 zeroValue!871 lt!572845))))

(assert (=> b!1263387 (contains!7572 (+!4291 lt!572848 (tuple2!21137 lt!572834 zeroValue!871)) lt!572845)))

(declare-fun lt!572833 () Unit!41956)

(assert (=> b!1263387 (= lt!572833 lt!572828)))

(declare-fun lt!572830 () ListLongMap!19009)

(assert (=> b!1263387 (= lt!572830 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572836 () (_ BitVec 64))

(assert (=> b!1263387 (= lt!572836 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572838 () (_ BitVec 64))

(assert (=> b!1263387 (= lt!572838 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572835 () Unit!41956)

(declare-fun addApplyDifferent!534 (ListLongMap!19009 (_ BitVec 64) V!48575 (_ BitVec 64)) Unit!41956)

(assert (=> b!1263387 (= lt!572835 (addApplyDifferent!534 lt!572830 lt!572836 minValueBefore!43 lt!572838))))

(assert (=> b!1263387 (= (apply!994 (+!4291 lt!572830 (tuple2!21137 lt!572836 minValueBefore!43)) lt!572838) (apply!994 lt!572830 lt!572838))))

(declare-fun lt!572846 () Unit!41956)

(assert (=> b!1263387 (= lt!572846 lt!572835)))

(declare-fun lt!572844 () ListLongMap!19009)

(assert (=> b!1263387 (= lt!572844 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572841 () (_ BitVec 64))

(assert (=> b!1263387 (= lt!572841 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572827 () (_ BitVec 64))

(assert (=> b!1263387 (= lt!572827 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572832 () Unit!41956)

(assert (=> b!1263387 (= lt!572832 (addApplyDifferent!534 lt!572844 lt!572841 zeroValue!871 lt!572827))))

(assert (=> b!1263387 (= (apply!994 (+!4291 lt!572844 (tuple2!21137 lt!572841 zeroValue!871)) lt!572827) (apply!994 lt!572844 lt!572827))))

(declare-fun lt!572843 () Unit!41956)

(assert (=> b!1263387 (= lt!572843 lt!572832)))

(declare-fun lt!572847 () ListLongMap!19009)

(assert (=> b!1263387 (= lt!572847 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572829 () (_ BitVec 64))

(assert (=> b!1263387 (= lt!572829 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572839 () (_ BitVec 64))

(assert (=> b!1263387 (= lt!572839 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263387 (= lt!572842 (addApplyDifferent!534 lt!572847 lt!572829 minValueBefore!43 lt!572839))))

(assert (=> b!1263387 (= (apply!994 (+!4291 lt!572847 (tuple2!21137 lt!572829 minValueBefore!43)) lt!572839) (apply!994 lt!572847 lt!572839))))

(declare-fun b!1263388 () Bool)

(declare-fun res!841538 () Bool)

(declare-fun e!719286 () Bool)

(assert (=> b!1263388 (=> (not res!841538) (not e!719286))))

(declare-fun e!719283 () Bool)

(assert (=> b!1263388 (= res!841538 e!719283)))

(declare-fun c!122968 () Bool)

(assert (=> b!1263388 (= c!122968 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62185 () Bool)

(declare-fun call!62186 () Bool)

(assert (=> bm!62185 (= call!62186 (contains!7572 lt!572831 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263389 () Bool)

(declare-fun e!719288 () Bool)

(assert (=> b!1263389 (= e!719288 (not call!62186))))

(declare-fun b!1263390 () Bool)

(declare-fun e!719285 () Bool)

(assert (=> b!1263390 (= e!719285 (= (apply!994 lt!572831 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62186 () Bool)

(assert (=> bm!62186 (= call!62192 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!62187 () Bool)

(assert (=> bm!62187 (= call!62189 call!62188)))

(declare-fun bm!62188 () Bool)

(declare-fun call!62187 () Bool)

(assert (=> bm!62188 (= call!62187 (contains!7572 lt!572831 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263391 () Bool)

(declare-fun e!719290 () Bool)

(assert (=> b!1263391 (= e!719288 e!719290)))

(declare-fun res!841537 () Bool)

(assert (=> b!1263391 (= res!841537 call!62186)))

(assert (=> b!1263391 (=> (not res!841537) (not e!719290))))

(declare-fun b!1263392 () Bool)

(assert (=> b!1263392 (= e!719283 (not call!62187))))

(declare-fun b!1263393 () Bool)

(declare-fun e!719292 () ListLongMap!19009)

(assert (=> b!1263393 (= e!719292 e!719294)))

(assert (=> b!1263393 (= c!122969 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263394 () Bool)

(assert (=> b!1263394 (= e!719284 call!62189)))

(declare-fun bm!62189 () Bool)

(assert (=> bm!62189 (= call!62191 call!62190)))

(declare-fun b!1263395 () Bool)

(declare-fun e!719293 () Bool)

(assert (=> b!1263395 (= e!719293 (validKeyInArray!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263396 () Bool)

(declare-fun res!841541 () Bool)

(assert (=> b!1263396 (=> (not res!841541) (not e!719286))))

(declare-fun e!719287 () Bool)

(assert (=> b!1263396 (= res!841541 e!719287)))

(declare-fun res!841536 () Bool)

(assert (=> b!1263396 (=> res!841536 e!719287)))

(assert (=> b!1263396 (= res!841536 (not e!719282))))

(declare-fun res!841535 () Bool)

(assert (=> b!1263396 (=> (not res!841535) (not e!719282))))

(assert (=> b!1263396 (= res!841535 (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun b!1263397 () Bool)

(assert (=> b!1263397 (= e!719290 (= (apply!994 lt!572831 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1263398 () Bool)

(assert (=> b!1263398 (= e!719292 (+!4291 call!62188 (tuple2!21137 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun d!138499 () Bool)

(assert (=> d!138499 e!719286))

(declare-fun res!841540 () Bool)

(assert (=> d!138499 (=> (not res!841540) (not e!719286))))

(assert (=> d!138499 (= res!841540 (or (bvsge #b00000000000000000000000000000000 (size!40264 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))))

(declare-fun lt!572837 () ListLongMap!19009)

(assert (=> d!138499 (= lt!572831 lt!572837)))

(declare-fun lt!572840 () Unit!41956)

(assert (=> d!138499 (= lt!572840 e!719291)))

(declare-fun c!122966 () Bool)

(assert (=> d!138499 (= c!122966 e!719293)))

(declare-fun res!841533 () Bool)

(assert (=> d!138499 (=> (not res!841533) (not e!719293))))

(assert (=> d!138499 (= res!841533 (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(assert (=> d!138499 (= lt!572837 e!719292)))

(assert (=> d!138499 (= c!122967 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138499 (validMask!0 mask!1466)))

(assert (=> d!138499 (= (getCurrentListMap!4575 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572831)))

(declare-fun b!1263384 () Bool)

(declare-fun c!122971 () Bool)

(assert (=> b!1263384 (= c!122971 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263384 (= e!719294 e!719284)))

(declare-fun b!1263399 () Bool)

(assert (=> b!1263399 (= e!719286 e!719288)))

(declare-fun c!122970 () Bool)

(assert (=> b!1263399 (= c!122970 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263400 () Bool)

(assert (=> b!1263400 (= e!719287 e!719289)))

(declare-fun res!841539 () Bool)

(assert (=> b!1263400 (=> (not res!841539) (not e!719289))))

(assert (=> b!1263400 (= res!841539 (contains!7572 lt!572831 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263400 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun b!1263401 () Bool)

(assert (=> b!1263401 (= e!719283 e!719285)))

(declare-fun res!841534 () Bool)

(assert (=> b!1263401 (= res!841534 call!62187)))

(assert (=> b!1263401 (=> (not res!841534) (not e!719285))))

(declare-fun b!1263402 () Bool)

(declare-fun Unit!41961 () Unit!41956)

(assert (=> b!1263402 (= e!719291 Unit!41961)))

(assert (= (and d!138499 c!122967) b!1263398))

(assert (= (and d!138499 (not c!122967)) b!1263393))

(assert (= (and b!1263393 c!122969) b!1263385))

(assert (= (and b!1263393 (not c!122969)) b!1263384))

(assert (= (and b!1263384 c!122971) b!1263394))

(assert (= (and b!1263384 (not c!122971)) b!1263383))

(assert (= (or b!1263394 b!1263383) bm!62189))

(assert (= (or b!1263385 bm!62189) bm!62183))

(assert (= (or b!1263385 b!1263394) bm!62187))

(assert (= (or b!1263398 bm!62183) bm!62186))

(assert (= (or b!1263398 bm!62187) bm!62184))

(assert (= (and d!138499 res!841533) b!1263395))

(assert (= (and d!138499 c!122966) b!1263387))

(assert (= (and d!138499 (not c!122966)) b!1263402))

(assert (= (and d!138499 res!841540) b!1263396))

(assert (= (and b!1263396 res!841535) b!1263386))

(assert (= (and b!1263396 (not res!841536)) b!1263400))

(assert (= (and b!1263400 res!841539) b!1263382))

(assert (= (and b!1263396 res!841541) b!1263388))

(assert (= (and b!1263388 c!122968) b!1263401))

(assert (= (and b!1263388 (not c!122968)) b!1263392))

(assert (= (and b!1263401 res!841534) b!1263390))

(assert (= (or b!1263401 b!1263392) bm!62188))

(assert (= (and b!1263388 res!841538) b!1263399))

(assert (= (and b!1263399 c!122970) b!1263391))

(assert (= (and b!1263399 (not c!122970)) b!1263389))

(assert (= (and b!1263391 res!841537) b!1263397))

(assert (= (or b!1263391 b!1263389) bm!62185))

(declare-fun b_lambda!22941 () Bool)

(assert (=> (not b_lambda!22941) (not b!1263382)))

(assert (=> b!1263382 t!41844))

(declare-fun b_and!45485 () Bool)

(assert (= b_and!45483 (and (=> t!41844 result!23387) b_and!45485)))

(declare-fun m!1163393 () Bool)

(assert (=> bm!62185 m!1163393))

(assert (=> b!1263386 m!1163339))

(assert (=> b!1263386 m!1163339))

(assert (=> b!1263386 m!1163347))

(assert (=> b!1263400 m!1163339))

(assert (=> b!1263400 m!1163339))

(declare-fun m!1163395 () Bool)

(assert (=> b!1263400 m!1163395))

(assert (=> d!138499 m!1163243))

(declare-fun m!1163397 () Bool)

(assert (=> b!1263387 m!1163397))

(declare-fun m!1163399 () Bool)

(assert (=> b!1263387 m!1163399))

(declare-fun m!1163401 () Bool)

(assert (=> b!1263387 m!1163401))

(declare-fun m!1163403 () Bool)

(assert (=> b!1263387 m!1163403))

(declare-fun m!1163405 () Bool)

(assert (=> b!1263387 m!1163405))

(assert (=> b!1263387 m!1163241))

(declare-fun m!1163407 () Bool)

(assert (=> b!1263387 m!1163407))

(assert (=> b!1263387 m!1163339))

(declare-fun m!1163409 () Bool)

(assert (=> b!1263387 m!1163409))

(declare-fun m!1163411 () Bool)

(assert (=> b!1263387 m!1163411))

(declare-fun m!1163413 () Bool)

(assert (=> b!1263387 m!1163413))

(declare-fun m!1163415 () Bool)

(assert (=> b!1263387 m!1163415))

(declare-fun m!1163417 () Bool)

(assert (=> b!1263387 m!1163417))

(assert (=> b!1263387 m!1163397))

(assert (=> b!1263387 m!1163411))

(declare-fun m!1163419 () Bool)

(assert (=> b!1263387 m!1163419))

(assert (=> b!1263387 m!1163419))

(declare-fun m!1163421 () Bool)

(assert (=> b!1263387 m!1163421))

(assert (=> b!1263387 m!1163401))

(declare-fun m!1163423 () Bool)

(assert (=> b!1263387 m!1163423))

(declare-fun m!1163425 () Bool)

(assert (=> b!1263387 m!1163425))

(assert (=> bm!62186 m!1163241))

(declare-fun m!1163427 () Bool)

(assert (=> b!1263397 m!1163427))

(declare-fun m!1163429 () Bool)

(assert (=> bm!62184 m!1163429))

(declare-fun m!1163431 () Bool)

(assert (=> b!1263390 m!1163431))

(declare-fun m!1163433 () Bool)

(assert (=> bm!62188 m!1163433))

(assert (=> b!1263395 m!1163339))

(assert (=> b!1263395 m!1163339))

(assert (=> b!1263395 m!1163347))

(assert (=> b!1263382 m!1163329))

(assert (=> b!1263382 m!1163331))

(assert (=> b!1263382 m!1163339))

(declare-fun m!1163435 () Bool)

(assert (=> b!1263382 m!1163435))

(assert (=> b!1263382 m!1163329))

(assert (=> b!1263382 m!1163331))

(assert (=> b!1263382 m!1163333))

(assert (=> b!1263382 m!1163339))

(declare-fun m!1163437 () Bool)

(assert (=> b!1263398 m!1163437))

(assert (=> b!1263194 d!138499))

(declare-fun e!719302 () Bool)

(declare-fun lt!572853 () ListLongMap!19009)

(declare-fun b!1263403 () Bool)

(assert (=> b!1263403 (= e!719302 (= (apply!994 lt!572853 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)) (get!20289 (select (arr!39727 _values!914) #b00000000000000000000000000000000) (dynLambda!3424 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263403 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40265 _values!914)))))

(assert (=> b!1263403 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun b!1263404 () Bool)

(declare-fun e!719297 () ListLongMap!19009)

(declare-fun call!62198 () ListLongMap!19009)

(assert (=> b!1263404 (= e!719297 call!62198)))

(declare-fun bm!62190 () Bool)

(declare-fun call!62197 () ListLongMap!19009)

(declare-fun call!62199 () ListLongMap!19009)

(assert (=> bm!62190 (= call!62197 call!62199)))

(declare-fun c!122975 () Bool)

(declare-fun bm!62191 () Bool)

(declare-fun c!122973 () Bool)

(declare-fun call!62195 () ListLongMap!19009)

(assert (=> bm!62191 (= call!62195 (+!4291 (ite c!122973 call!62199 (ite c!122975 call!62197 call!62198)) (ite (or c!122973 c!122975) (tuple2!21137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21137 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1263406 () Bool)

(declare-fun e!719307 () ListLongMap!19009)

(declare-fun call!62196 () ListLongMap!19009)

(assert (=> b!1263406 (= e!719307 call!62196)))

(declare-fun b!1263407 () Bool)

(declare-fun e!719295 () Bool)

(assert (=> b!1263407 (= e!719295 (validKeyInArray!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263408 () Bool)

(declare-fun e!719304 () Unit!41956)

(declare-fun lt!572864 () Unit!41956)

(assert (=> b!1263408 (= e!719304 lt!572864)))

(declare-fun lt!572870 () ListLongMap!19009)

(assert (=> b!1263408 (= lt!572870 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572856 () (_ BitVec 64))

(assert (=> b!1263408 (= lt!572856 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572867 () (_ BitVec 64))

(assert (=> b!1263408 (= lt!572867 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572850 () Unit!41956)

(assert (=> b!1263408 (= lt!572850 (addStillContains!1091 lt!572870 lt!572856 zeroValue!871 lt!572867))))

(assert (=> b!1263408 (contains!7572 (+!4291 lt!572870 (tuple2!21137 lt!572856 zeroValue!871)) lt!572867)))

(declare-fun lt!572855 () Unit!41956)

(assert (=> b!1263408 (= lt!572855 lt!572850)))

(declare-fun lt!572852 () ListLongMap!19009)

(assert (=> b!1263408 (= lt!572852 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572858 () (_ BitVec 64))

(assert (=> b!1263408 (= lt!572858 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572860 () (_ BitVec 64))

(assert (=> b!1263408 (= lt!572860 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572857 () Unit!41956)

(assert (=> b!1263408 (= lt!572857 (addApplyDifferent!534 lt!572852 lt!572858 minValueAfter!43 lt!572860))))

(assert (=> b!1263408 (= (apply!994 (+!4291 lt!572852 (tuple2!21137 lt!572858 minValueAfter!43)) lt!572860) (apply!994 lt!572852 lt!572860))))

(declare-fun lt!572868 () Unit!41956)

(assert (=> b!1263408 (= lt!572868 lt!572857)))

(declare-fun lt!572866 () ListLongMap!19009)

(assert (=> b!1263408 (= lt!572866 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572863 () (_ BitVec 64))

(assert (=> b!1263408 (= lt!572863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572849 () (_ BitVec 64))

(assert (=> b!1263408 (= lt!572849 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572854 () Unit!41956)

(assert (=> b!1263408 (= lt!572854 (addApplyDifferent!534 lt!572866 lt!572863 zeroValue!871 lt!572849))))

(assert (=> b!1263408 (= (apply!994 (+!4291 lt!572866 (tuple2!21137 lt!572863 zeroValue!871)) lt!572849) (apply!994 lt!572866 lt!572849))))

(declare-fun lt!572865 () Unit!41956)

(assert (=> b!1263408 (= lt!572865 lt!572854)))

(declare-fun lt!572869 () ListLongMap!19009)

(assert (=> b!1263408 (= lt!572869 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572851 () (_ BitVec 64))

(assert (=> b!1263408 (= lt!572851 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572861 () (_ BitVec 64))

(assert (=> b!1263408 (= lt!572861 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263408 (= lt!572864 (addApplyDifferent!534 lt!572869 lt!572851 minValueAfter!43 lt!572861))))

(assert (=> b!1263408 (= (apply!994 (+!4291 lt!572869 (tuple2!21137 lt!572851 minValueAfter!43)) lt!572861) (apply!994 lt!572869 lt!572861))))

(declare-fun b!1263409 () Bool)

(declare-fun res!841547 () Bool)

(declare-fun e!719299 () Bool)

(assert (=> b!1263409 (=> (not res!841547) (not e!719299))))

(declare-fun e!719296 () Bool)

(assert (=> b!1263409 (= res!841547 e!719296)))

(declare-fun c!122974 () Bool)

(assert (=> b!1263409 (= c!122974 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62192 () Bool)

(declare-fun call!62193 () Bool)

(assert (=> bm!62192 (= call!62193 (contains!7572 lt!572853 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263410 () Bool)

(declare-fun e!719301 () Bool)

(assert (=> b!1263410 (= e!719301 (not call!62193))))

(declare-fun b!1263411 () Bool)

(declare-fun e!719298 () Bool)

(assert (=> b!1263411 (= e!719298 (= (apply!994 lt!572853 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62193 () Bool)

(assert (=> bm!62193 (= call!62199 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!62194 () Bool)

(assert (=> bm!62194 (= call!62196 call!62195)))

(declare-fun bm!62195 () Bool)

(declare-fun call!62194 () Bool)

(assert (=> bm!62195 (= call!62194 (contains!7572 lt!572853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263412 () Bool)

(declare-fun e!719303 () Bool)

(assert (=> b!1263412 (= e!719301 e!719303)))

(declare-fun res!841546 () Bool)

(assert (=> b!1263412 (= res!841546 call!62193)))

(assert (=> b!1263412 (=> (not res!841546) (not e!719303))))

(declare-fun b!1263413 () Bool)

(assert (=> b!1263413 (= e!719296 (not call!62194))))

(declare-fun b!1263414 () Bool)

(declare-fun e!719305 () ListLongMap!19009)

(assert (=> b!1263414 (= e!719305 e!719307)))

(assert (=> b!1263414 (= c!122975 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263415 () Bool)

(assert (=> b!1263415 (= e!719297 call!62196)))

(declare-fun bm!62196 () Bool)

(assert (=> bm!62196 (= call!62198 call!62197)))

(declare-fun b!1263416 () Bool)

(declare-fun e!719306 () Bool)

(assert (=> b!1263416 (= e!719306 (validKeyInArray!0 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263417 () Bool)

(declare-fun res!841550 () Bool)

(assert (=> b!1263417 (=> (not res!841550) (not e!719299))))

(declare-fun e!719300 () Bool)

(assert (=> b!1263417 (= res!841550 e!719300)))

(declare-fun res!841545 () Bool)

(assert (=> b!1263417 (=> res!841545 e!719300)))

(assert (=> b!1263417 (= res!841545 (not e!719295))))

(declare-fun res!841544 () Bool)

(assert (=> b!1263417 (=> (not res!841544) (not e!719295))))

(assert (=> b!1263417 (= res!841544 (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun b!1263418 () Bool)

(assert (=> b!1263418 (= e!719303 (= (apply!994 lt!572853 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1263419 () Bool)

(assert (=> b!1263419 (= e!719305 (+!4291 call!62195 (tuple2!21137 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun d!138501 () Bool)

(assert (=> d!138501 e!719299))

(declare-fun res!841549 () Bool)

(assert (=> d!138501 (=> (not res!841549) (not e!719299))))

(assert (=> d!138501 (= res!841549 (or (bvsge #b00000000000000000000000000000000 (size!40264 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))))

(declare-fun lt!572859 () ListLongMap!19009)

(assert (=> d!138501 (= lt!572853 lt!572859)))

(declare-fun lt!572862 () Unit!41956)

(assert (=> d!138501 (= lt!572862 e!719304)))

(declare-fun c!122972 () Bool)

(assert (=> d!138501 (= c!122972 e!719306)))

(declare-fun res!841542 () Bool)

(assert (=> d!138501 (=> (not res!841542) (not e!719306))))

(assert (=> d!138501 (= res!841542 (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(assert (=> d!138501 (= lt!572859 e!719305)))

(assert (=> d!138501 (= c!122973 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138501 (validMask!0 mask!1466)))

(assert (=> d!138501 (= (getCurrentListMap!4575 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572853)))

(declare-fun b!1263405 () Bool)

(declare-fun c!122977 () Bool)

(assert (=> b!1263405 (= c!122977 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263405 (= e!719307 e!719297)))

(declare-fun b!1263420 () Bool)

(assert (=> b!1263420 (= e!719299 e!719301)))

(declare-fun c!122976 () Bool)

(assert (=> b!1263420 (= c!122976 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263421 () Bool)

(assert (=> b!1263421 (= e!719300 e!719302)))

(declare-fun res!841548 () Bool)

(assert (=> b!1263421 (=> (not res!841548) (not e!719302))))

(assert (=> b!1263421 (= res!841548 (contains!7572 lt!572853 (select (arr!39726 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263421 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _keys!1118)))))

(declare-fun b!1263422 () Bool)

(assert (=> b!1263422 (= e!719296 e!719298)))

(declare-fun res!841543 () Bool)

(assert (=> b!1263422 (= res!841543 call!62194)))

(assert (=> b!1263422 (=> (not res!841543) (not e!719298))))

(declare-fun b!1263423 () Bool)

(declare-fun Unit!41962 () Unit!41956)

(assert (=> b!1263423 (= e!719304 Unit!41962)))

(assert (= (and d!138501 c!122973) b!1263419))

(assert (= (and d!138501 (not c!122973)) b!1263414))

(assert (= (and b!1263414 c!122975) b!1263406))

(assert (= (and b!1263414 (not c!122975)) b!1263405))

(assert (= (and b!1263405 c!122977) b!1263415))

(assert (= (and b!1263405 (not c!122977)) b!1263404))

(assert (= (or b!1263415 b!1263404) bm!62196))

(assert (= (or b!1263406 bm!62196) bm!62190))

(assert (= (or b!1263406 b!1263415) bm!62194))

(assert (= (or b!1263419 bm!62190) bm!62193))

(assert (= (or b!1263419 bm!62194) bm!62191))

(assert (= (and d!138501 res!841542) b!1263416))

(assert (= (and d!138501 c!122972) b!1263408))

(assert (= (and d!138501 (not c!122972)) b!1263423))

(assert (= (and d!138501 res!841549) b!1263417))

(assert (= (and b!1263417 res!841544) b!1263407))

(assert (= (and b!1263417 (not res!841545)) b!1263421))

(assert (= (and b!1263421 res!841548) b!1263403))

(assert (= (and b!1263417 res!841550) b!1263409))

(assert (= (and b!1263409 c!122974) b!1263422))

(assert (= (and b!1263409 (not c!122974)) b!1263413))

(assert (= (and b!1263422 res!841543) b!1263411))

(assert (= (or b!1263422 b!1263413) bm!62195))

(assert (= (and b!1263409 res!841547) b!1263420))

(assert (= (and b!1263420 c!122976) b!1263412))

(assert (= (and b!1263420 (not c!122976)) b!1263410))

(assert (= (and b!1263412 res!841546) b!1263418))

(assert (= (or b!1263412 b!1263410) bm!62192))

(declare-fun b_lambda!22943 () Bool)

(assert (=> (not b_lambda!22943) (not b!1263403)))

(assert (=> b!1263403 t!41844))

(declare-fun b_and!45487 () Bool)

(assert (= b_and!45485 (and (=> t!41844 result!23387) b_and!45487)))

(declare-fun m!1163439 () Bool)

(assert (=> bm!62192 m!1163439))

(assert (=> b!1263407 m!1163339))

(assert (=> b!1263407 m!1163339))

(assert (=> b!1263407 m!1163347))

(assert (=> b!1263421 m!1163339))

(assert (=> b!1263421 m!1163339))

(declare-fun m!1163441 () Bool)

(assert (=> b!1263421 m!1163441))

(assert (=> d!138501 m!1163243))

(declare-fun m!1163443 () Bool)

(assert (=> b!1263408 m!1163443))

(declare-fun m!1163445 () Bool)

(assert (=> b!1263408 m!1163445))

(declare-fun m!1163447 () Bool)

(assert (=> b!1263408 m!1163447))

(declare-fun m!1163449 () Bool)

(assert (=> b!1263408 m!1163449))

(declare-fun m!1163451 () Bool)

(assert (=> b!1263408 m!1163451))

(assert (=> b!1263408 m!1163239))

(declare-fun m!1163453 () Bool)

(assert (=> b!1263408 m!1163453))

(assert (=> b!1263408 m!1163339))

(declare-fun m!1163455 () Bool)

(assert (=> b!1263408 m!1163455))

(declare-fun m!1163457 () Bool)

(assert (=> b!1263408 m!1163457))

(declare-fun m!1163459 () Bool)

(assert (=> b!1263408 m!1163459))

(declare-fun m!1163461 () Bool)

(assert (=> b!1263408 m!1163461))

(declare-fun m!1163463 () Bool)

(assert (=> b!1263408 m!1163463))

(assert (=> b!1263408 m!1163443))

(assert (=> b!1263408 m!1163457))

(declare-fun m!1163465 () Bool)

(assert (=> b!1263408 m!1163465))

(assert (=> b!1263408 m!1163465))

(declare-fun m!1163467 () Bool)

(assert (=> b!1263408 m!1163467))

(assert (=> b!1263408 m!1163447))

(declare-fun m!1163469 () Bool)

(assert (=> b!1263408 m!1163469))

(declare-fun m!1163471 () Bool)

(assert (=> b!1263408 m!1163471))

(assert (=> bm!62193 m!1163239))

(declare-fun m!1163473 () Bool)

(assert (=> b!1263418 m!1163473))

(declare-fun m!1163475 () Bool)

(assert (=> bm!62191 m!1163475))

(declare-fun m!1163477 () Bool)

(assert (=> b!1263411 m!1163477))

(declare-fun m!1163479 () Bool)

(assert (=> bm!62195 m!1163479))

(assert (=> b!1263416 m!1163339))

(assert (=> b!1263416 m!1163339))

(assert (=> b!1263416 m!1163347))

(assert (=> b!1263403 m!1163329))

(assert (=> b!1263403 m!1163331))

(assert (=> b!1263403 m!1163339))

(declare-fun m!1163481 () Bool)

(assert (=> b!1263403 m!1163481))

(assert (=> b!1263403 m!1163329))

(assert (=> b!1263403 m!1163331))

(assert (=> b!1263403 m!1163333))

(assert (=> b!1263403 m!1163339))

(declare-fun m!1163483 () Bool)

(assert (=> b!1263419 m!1163483))

(assert (=> b!1263198 d!138501))

(declare-fun d!138503 () Bool)

(declare-fun lt!572873 () ListLongMap!19009)

(assert (=> d!138503 (not (contains!7572 lt!572873 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!145 (List!28336 (_ BitVec 64)) List!28336)

(assert (=> d!138503 (= lt!572873 (ListLongMap!19010 (removeStrictlySorted!145 (toList!9520 lt!572690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138503 (= (-!2099 lt!572690 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572873)))

(declare-fun bs!35717 () Bool)

(assert (= bs!35717 d!138503))

(declare-fun m!1163485 () Bool)

(assert (=> bs!35717 m!1163485))

(declare-fun m!1163487 () Bool)

(assert (=> bs!35717 m!1163487))

(assert (=> b!1263198 d!138503))

(declare-fun d!138505 () Bool)

(assert (=> d!138505 (= (-!2099 lt!572690 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572690)))

(declare-fun lt!572876 () Unit!41956)

(declare-fun choose!1885 (ListLongMap!19009 (_ BitVec 64)) Unit!41956)

(assert (=> d!138505 (= lt!572876 (choose!1885 lt!572690 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138505 (not (contains!7572 lt!572690 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138505 (= (removeNotPresentStillSame!151 lt!572690 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572876)))

(declare-fun bs!35718 () Bool)

(assert (= bs!35718 d!138505))

(assert (=> bs!35718 m!1163253))

(declare-fun m!1163489 () Bool)

(assert (=> bs!35718 m!1163489))

(assert (=> bs!35718 m!1163257))

(assert (=> b!1263198 d!138505))

(declare-fun mapIsEmpty!50443 () Bool)

(declare-fun mapRes!50443 () Bool)

(assert (=> mapIsEmpty!50443 mapRes!50443))

(declare-fun mapNonEmpty!50443 () Bool)

(declare-fun tp!96083 () Bool)

(declare-fun e!719313 () Bool)

(assert (=> mapNonEmpty!50443 (= mapRes!50443 (and tp!96083 e!719313))))

(declare-fun mapKey!50443 () (_ BitVec 32))

(declare-fun mapRest!50443 () (Array (_ BitVec 32) ValueCell!15440))

(declare-fun mapValue!50443 () ValueCell!15440)

(assert (=> mapNonEmpty!50443 (= mapRest!50434 (store mapRest!50443 mapKey!50443 mapValue!50443))))

(declare-fun b!1263430 () Bool)

(assert (=> b!1263430 (= e!719313 tp_is_empty!32407)))

(declare-fun b!1263431 () Bool)

(declare-fun e!719312 () Bool)

(assert (=> b!1263431 (= e!719312 tp_is_empty!32407)))

(declare-fun condMapEmpty!50443 () Bool)

(declare-fun mapDefault!50443 () ValueCell!15440)

(assert (=> mapNonEmpty!50434 (= condMapEmpty!50443 (= mapRest!50434 ((as const (Array (_ BitVec 32) ValueCell!15440)) mapDefault!50443)))))

(assert (=> mapNonEmpty!50434 (= tp!96068 (and e!719312 mapRes!50443))))

(assert (= (and mapNonEmpty!50434 condMapEmpty!50443) mapIsEmpty!50443))

(assert (= (and mapNonEmpty!50434 (not condMapEmpty!50443)) mapNonEmpty!50443))

(assert (= (and mapNonEmpty!50443 ((_ is ValueCellFull!15440) mapValue!50443)) b!1263430))

(assert (= (and mapNonEmpty!50434 ((_ is ValueCellFull!15440) mapDefault!50443)) b!1263431))

(declare-fun m!1163491 () Bool)

(assert (=> mapNonEmpty!50443 m!1163491))

(declare-fun b_lambda!22945 () Bool)

(assert (= b_lambda!22939 (or (and start!106086 b_free!27505) b_lambda!22945)))

(declare-fun b_lambda!22947 () Bool)

(assert (= b_lambda!22937 (or (and start!106086 b_free!27505) b_lambda!22947)))

(declare-fun b_lambda!22949 () Bool)

(assert (= b_lambda!22943 (or (and start!106086 b_free!27505) b_lambda!22949)))

(declare-fun b_lambda!22951 () Bool)

(assert (= b_lambda!22933 (or (and start!106086 b_free!27505) b_lambda!22951)))

(declare-fun b_lambda!22953 () Bool)

(assert (= b_lambda!22941 (or (and start!106086 b_free!27505) b_lambda!22953)))

(declare-fun b_lambda!22955 () Bool)

(assert (= b_lambda!22935 (or (and start!106086 b_free!27505) b_lambda!22955)))

(check-sat (not d!138503) (not b!1263288) (not d!138485) (not b_next!27505) (not b_lambda!22947) (not b!1263296) (not b!1263403) (not b!1263407) (not d!138499) (not bm!62191) (not b!1263398) (not bm!62165) (not b_lambda!22953) (not b!1263397) (not bm!62184) (not b!1263421) (not d!138481) (not d!138505) (not bm!62188) (not b!1263316) (not b!1263386) (not d!138501) (not b!1263418) (not b!1263416) (not b!1263390) (not bm!62186) (not bm!62185) (not b!1263279) (not bm!62195) (not b!1263292) (not bm!62168) (not mapNonEmpty!50443) (not b_lambda!22951) b_and!45487 (not b!1263400) (not b!1263289) (not b!1263387) (not b!1263278) (not bm!62192) (not b_lambda!22955) (not b!1263281) (not bm!62193) (not b_lambda!22949) (not b!1263303) (not b_lambda!22945) (not bm!62161) (not b!1263382) (not b!1263284) (not b!1263337) (not b!1263317) (not b!1263282) (not b!1263295) (not b!1263314) (not b!1263408) (not b!1263419) (not b!1263327) (not b!1263287) tp_is_empty!32407 (not b!1263395) (not b!1263293) (not b!1263339) (not b!1263302) (not b!1263411) (not bm!62162) (not b!1263301) (not d!138497) (not b!1263330) (not b!1263298) (not d!138483))
(check-sat b_and!45487 (not b_next!27505))
