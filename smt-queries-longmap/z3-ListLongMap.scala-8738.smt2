; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106176 () Bool)

(assert start!106176)

(declare-fun b_free!27463 () Bool)

(declare-fun b_next!27463 () Bool)

(assert (=> start!106176 (= b_free!27463 (not b_next!27463))))

(declare-fun tp!95926 () Bool)

(declare-fun b_and!45391 () Bool)

(assert (=> start!106176 (= tp!95926 b_and!45391)))

(declare-fun b!1263169 () Bool)

(declare-fun e!719082 () Bool)

(declare-fun e!719087 () Bool)

(assert (=> b!1263169 (= e!719082 (not e!719087))))

(declare-fun res!841297 () Bool)

(assert (=> b!1263169 (=> res!841297 e!719087)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1263169 (= res!841297 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!48519 0))(
  ( (V!48520 (val!16245 Int)) )
))
(declare-datatypes ((tuple2!21036 0))(
  ( (tuple2!21037 (_1!10529 (_ BitVec 64)) (_2!10529 V!48519)) )
))
(declare-datatypes ((List!28259 0))(
  ( (Nil!28256) (Cons!28255 (h!29473 tuple2!21036) (t!41754 List!28259)) )
))
(declare-datatypes ((ListLongMap!18917 0))(
  ( (ListLongMap!18918 (toList!9474 List!28259)) )
))
(declare-fun lt!572336 () ListLongMap!18917)

(declare-fun lt!572332 () ListLongMap!18917)

(assert (=> b!1263169 (= lt!572336 lt!572332)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48519)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48519)

(declare-datatypes ((array!82391 0))(
  ( (array!82392 (arr!39742 (Array (_ BitVec 32) (_ BitVec 64))) (size!40279 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82391)

(declare-datatypes ((ValueCell!15419 0))(
  ( (ValueCellFull!15419 (v!18946 V!48519)) (EmptyCell!15419) )
))
(declare-datatypes ((array!82393 0))(
  ( (array!82394 (arr!39743 (Array (_ BitVec 32) ValueCell!15419)) (size!40280 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82393)

(declare-datatypes ((Unit!42042 0))(
  ( (Unit!42043) )
))
(declare-fun lt!572337 () Unit!42042)

(declare-fun minValueBefore!43 () V!48519)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1170 (array!82391 array!82393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48519 V!48519 V!48519 V!48519 (_ BitVec 32) Int) Unit!42042)

(assert (=> b!1263169 (= lt!572337 (lemmaNoChangeToArrayThenSameMapNoExtras!1170 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5880 (array!82391 array!82393 (_ BitVec 32) (_ BitVec 32) V!48519 V!48519 (_ BitVec 32) Int) ListLongMap!18917)

(assert (=> b!1263169 (= lt!572332 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263169 (= lt!572336 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!841295 () Bool)

(assert (=> start!106176 (=> (not res!841295) (not e!719082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106176 (= res!841295 (validMask!0 mask!1466))))

(assert (=> start!106176 e!719082))

(assert (=> start!106176 true))

(assert (=> start!106176 tp!95926))

(declare-fun tp_is_empty!32365 () Bool)

(assert (=> start!106176 tp_is_empty!32365))

(declare-fun array_inv!30407 (array!82391) Bool)

(assert (=> start!106176 (array_inv!30407 _keys!1118)))

(declare-fun e!719084 () Bool)

(declare-fun array_inv!30408 (array!82393) Bool)

(assert (=> start!106176 (and (array_inv!30408 _values!914) e!719084)))

(declare-fun b!1263170 () Bool)

(declare-fun res!841299 () Bool)

(assert (=> b!1263170 (=> (not res!841299) (not e!719082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82391 (_ BitVec 32)) Bool)

(assert (=> b!1263170 (= res!841299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1263171 () Bool)

(declare-fun e!719085 () Bool)

(assert (=> b!1263171 (= e!719087 e!719085)))

(declare-fun res!841298 () Bool)

(assert (=> b!1263171 (=> res!841298 e!719085)))

(declare-fun lt!572335 () ListLongMap!18917)

(declare-fun contains!7611 (ListLongMap!18917 (_ BitVec 64)) Bool)

(assert (=> b!1263171 (= res!841298 (contains!7611 lt!572335 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4627 (array!82391 array!82393 (_ BitVec 32) (_ BitVec 32) V!48519 V!48519 (_ BitVec 32) Int) ListLongMap!18917)

(assert (=> b!1263171 (= lt!572335 (getCurrentListMap!4627 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263172 () Bool)

(declare-fun e!719083 () Bool)

(assert (=> b!1263172 (= e!719083 tp_is_empty!32365)))

(declare-fun b!1263173 () Bool)

(declare-fun lt!572334 () ListLongMap!18917)

(assert (=> b!1263173 (= e!719085 (= lt!572334 (getCurrentListMap!4627 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922)))))

(assert (=> b!1263173 (= lt!572334 lt!572335)))

(declare-fun -!2114 (ListLongMap!18917 (_ BitVec 64)) ListLongMap!18917)

(assert (=> b!1263173 (= lt!572334 (-!2114 lt!572335 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!572333 () Unit!42042)

(declare-fun removeNotPresentStillSame!149 (ListLongMap!18917 (_ BitVec 64)) Unit!42042)

(assert (=> b!1263173 (= lt!572333 (removeNotPresentStillSame!149 lt!572335 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263174 () Bool)

(declare-fun res!841300 () Bool)

(assert (=> b!1263174 (=> (not res!841300) (not e!719082))))

(declare-datatypes ((List!28260 0))(
  ( (Nil!28257) (Cons!28256 (h!29474 (_ BitVec 64)) (t!41755 List!28260)) )
))
(declare-fun arrayNoDuplicates!0 (array!82391 (_ BitVec 32) List!28260) Bool)

(assert (=> b!1263174 (= res!841300 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28257))))

(declare-fun b!1263175 () Bool)

(declare-fun e!719081 () Bool)

(declare-fun mapRes!50356 () Bool)

(assert (=> b!1263175 (= e!719084 (and e!719081 mapRes!50356))))

(declare-fun condMapEmpty!50356 () Bool)

(declare-fun mapDefault!50356 () ValueCell!15419)

(assert (=> b!1263175 (= condMapEmpty!50356 (= (arr!39743 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15419)) mapDefault!50356)))))

(declare-fun mapNonEmpty!50356 () Bool)

(declare-fun tp!95927 () Bool)

(assert (=> mapNonEmpty!50356 (= mapRes!50356 (and tp!95927 e!719083))))

(declare-fun mapKey!50356 () (_ BitVec 32))

(declare-fun mapValue!50356 () ValueCell!15419)

(declare-fun mapRest!50356 () (Array (_ BitVec 32) ValueCell!15419))

(assert (=> mapNonEmpty!50356 (= (arr!39743 _values!914) (store mapRest!50356 mapKey!50356 mapValue!50356))))

(declare-fun b!1263176 () Bool)

(assert (=> b!1263176 (= e!719081 tp_is_empty!32365)))

(declare-fun b!1263177 () Bool)

(declare-fun res!841296 () Bool)

(assert (=> b!1263177 (=> (not res!841296) (not e!719082))))

(assert (=> b!1263177 (= res!841296 (and (= (size!40280 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40279 _keys!1118) (size!40280 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50356 () Bool)

(assert (=> mapIsEmpty!50356 mapRes!50356))

(assert (= (and start!106176 res!841295) b!1263177))

(assert (= (and b!1263177 res!841296) b!1263170))

(assert (= (and b!1263170 res!841299) b!1263174))

(assert (= (and b!1263174 res!841300) b!1263169))

(assert (= (and b!1263169 (not res!841297)) b!1263171))

(assert (= (and b!1263171 (not res!841298)) b!1263173))

(assert (= (and b!1263175 condMapEmpty!50356) mapIsEmpty!50356))

(assert (= (and b!1263175 (not condMapEmpty!50356)) mapNonEmpty!50356))

(get-info :version)

(assert (= (and mapNonEmpty!50356 ((_ is ValueCellFull!15419) mapValue!50356)) b!1263172))

(assert (= (and b!1263175 ((_ is ValueCellFull!15419) mapDefault!50356)) b!1263176))

(assert (= start!106176 b!1263175))

(declare-fun m!1164007 () Bool)

(assert (=> b!1263174 m!1164007))

(declare-fun m!1164009 () Bool)

(assert (=> b!1263171 m!1164009))

(declare-fun m!1164011 () Bool)

(assert (=> b!1263171 m!1164011))

(declare-fun m!1164013 () Bool)

(assert (=> mapNonEmpty!50356 m!1164013))

(declare-fun m!1164015 () Bool)

(assert (=> b!1263173 m!1164015))

(declare-fun m!1164017 () Bool)

(assert (=> b!1263173 m!1164017))

(declare-fun m!1164019 () Bool)

(assert (=> b!1263173 m!1164019))

(declare-fun m!1164021 () Bool)

(assert (=> b!1263169 m!1164021))

(declare-fun m!1164023 () Bool)

(assert (=> b!1263169 m!1164023))

(declare-fun m!1164025 () Bool)

(assert (=> b!1263169 m!1164025))

(declare-fun m!1164027 () Bool)

(assert (=> start!106176 m!1164027))

(declare-fun m!1164029 () Bool)

(assert (=> start!106176 m!1164029))

(declare-fun m!1164031 () Bool)

(assert (=> start!106176 m!1164031))

(declare-fun m!1164033 () Bool)

(assert (=> b!1263170 m!1164033))

(check-sat tp_is_empty!32365 (not mapNonEmpty!50356) b_and!45391 (not b!1263170) (not b!1263169) (not start!106176) (not b_next!27463) (not b!1263174) (not b!1263171) (not b!1263173))
(check-sat b_and!45391 (not b_next!27463))
(get-model)

(declare-fun bm!62074 () Bool)

(declare-fun call!62082 () ListLongMap!18917)

(declare-fun call!62079 () ListLongMap!18917)

(assert (=> bm!62074 (= call!62082 call!62079)))

(declare-fun e!719161 () Bool)

(declare-fun lt!572434 () ListLongMap!18917)

(declare-fun b!1263274 () Bool)

(declare-fun apply!1005 (ListLongMap!18917 (_ BitVec 64)) V!48519)

(declare-fun get!20320 (ValueCell!15419 V!48519) V!48519)

(declare-fun dynLambda!3457 (Int (_ BitVec 64)) V!48519)

(assert (=> b!1263274 (= e!719161 (= (apply!1005 lt!572434 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)) (get!20320 (select (arr!39743 _values!914) #b00000000000000000000000000000000) (dynLambda!3457 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263274 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40280 _values!914)))))

(assert (=> b!1263274 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1263275 () Bool)

(declare-fun e!719167 () Bool)

(declare-fun call!62081 () Bool)

(assert (=> b!1263275 (= e!719167 (not call!62081))))

(declare-fun b!1263276 () Bool)

(declare-fun e!719158 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263276 (= e!719158 (validKeyInArray!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263277 () Bool)

(declare-fun res!841358 () Bool)

(declare-fun e!719168 () Bool)

(assert (=> b!1263277 (=> (not res!841358) (not e!719168))))

(declare-fun e!719164 () Bool)

(assert (=> b!1263277 (= res!841358 e!719164)))

(declare-fun res!841357 () Bool)

(assert (=> b!1263277 (=> res!841357 e!719164)))

(declare-fun e!719157 () Bool)

(assert (=> b!1263277 (= res!841357 (not e!719157))))

(declare-fun res!841356 () Bool)

(assert (=> b!1263277 (=> (not res!841356) (not e!719157))))

(assert (=> b!1263277 (= res!841356 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1263278 () Bool)

(declare-fun e!719159 () ListLongMap!18917)

(declare-fun call!62080 () ListLongMap!18917)

(assert (=> b!1263278 (= e!719159 call!62080)))

(declare-fun b!1263279 () Bool)

(declare-fun e!719163 () Bool)

(declare-fun call!62078 () Bool)

(assert (=> b!1263279 (= e!719163 (not call!62078))))

(declare-fun b!1263280 () Bool)

(declare-fun e!719165 () ListLongMap!18917)

(declare-fun call!62083 () ListLongMap!18917)

(declare-fun +!4288 (ListLongMap!18917 tuple2!21036) ListLongMap!18917)

(assert (=> b!1263280 (= e!719165 (+!4288 call!62083 (tuple2!21037 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1263281 () Bool)

(declare-fun e!719162 () ListLongMap!18917)

(assert (=> b!1263281 (= e!719162 call!62080)))

(declare-fun bm!62076 () Bool)

(assert (=> bm!62076 (= call!62080 call!62083)))

(declare-fun b!1263282 () Bool)

(declare-fun e!719166 () Unit!42042)

(declare-fun lt!572425 () Unit!42042)

(assert (=> b!1263282 (= e!719166 lt!572425)))

(declare-fun lt!572439 () ListLongMap!18917)

(assert (=> b!1263282 (= lt!572439 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572430 () (_ BitVec 64))

(assert (=> b!1263282 (= lt!572430 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572436 () (_ BitVec 64))

(assert (=> b!1263282 (= lt!572436 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572422 () Unit!42042)

(declare-fun addStillContains!1094 (ListLongMap!18917 (_ BitVec 64) V!48519 (_ BitVec 64)) Unit!42042)

(assert (=> b!1263282 (= lt!572422 (addStillContains!1094 lt!572439 lt!572430 zeroValue!871 lt!572436))))

(assert (=> b!1263282 (contains!7611 (+!4288 lt!572439 (tuple2!21037 lt!572430 zeroValue!871)) lt!572436)))

(declare-fun lt!572438 () Unit!42042)

(assert (=> b!1263282 (= lt!572438 lt!572422)))

(declare-fun lt!572437 () ListLongMap!18917)

(assert (=> b!1263282 (= lt!572437 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572424 () (_ BitVec 64))

(assert (=> b!1263282 (= lt!572424 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572433 () (_ BitVec 64))

(assert (=> b!1263282 (= lt!572433 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572435 () Unit!42042)

(declare-fun addApplyDifferent!536 (ListLongMap!18917 (_ BitVec 64) V!48519 (_ BitVec 64)) Unit!42042)

(assert (=> b!1263282 (= lt!572435 (addApplyDifferent!536 lt!572437 lt!572424 minValueAfter!43 lt!572433))))

(assert (=> b!1263282 (= (apply!1005 (+!4288 lt!572437 (tuple2!21037 lt!572424 minValueAfter!43)) lt!572433) (apply!1005 lt!572437 lt!572433))))

(declare-fun lt!572420 () Unit!42042)

(assert (=> b!1263282 (= lt!572420 lt!572435)))

(declare-fun lt!572431 () ListLongMap!18917)

(assert (=> b!1263282 (= lt!572431 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572428 () (_ BitVec 64))

(assert (=> b!1263282 (= lt!572428 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572421 () (_ BitVec 64))

(assert (=> b!1263282 (= lt!572421 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572432 () Unit!42042)

(assert (=> b!1263282 (= lt!572432 (addApplyDifferent!536 lt!572431 lt!572428 zeroValue!871 lt!572421))))

(assert (=> b!1263282 (= (apply!1005 (+!4288 lt!572431 (tuple2!21037 lt!572428 zeroValue!871)) lt!572421) (apply!1005 lt!572431 lt!572421))))

(declare-fun lt!572423 () Unit!42042)

(assert (=> b!1263282 (= lt!572423 lt!572432)))

(declare-fun lt!572427 () ListLongMap!18917)

(assert (=> b!1263282 (= lt!572427 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572429 () (_ BitVec 64))

(assert (=> b!1263282 (= lt!572429 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572418 () (_ BitVec 64))

(assert (=> b!1263282 (= lt!572418 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263282 (= lt!572425 (addApplyDifferent!536 lt!572427 lt!572429 minValueAfter!43 lt!572418))))

(assert (=> b!1263282 (= (apply!1005 (+!4288 lt!572427 (tuple2!21037 lt!572429 minValueAfter!43)) lt!572418) (apply!1005 lt!572427 lt!572418))))

(declare-fun bm!62077 () Bool)

(declare-fun call!62077 () ListLongMap!18917)

(declare-fun c!123129 () Bool)

(declare-fun c!123126 () Bool)

(assert (=> bm!62077 (= call!62083 (+!4288 (ite c!123126 call!62079 (ite c!123129 call!62082 call!62077)) (ite (or c!123126 c!123129) (tuple2!21037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21037 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1263283 () Bool)

(declare-fun c!123127 () Bool)

(assert (=> b!1263283 (= c!123127 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263283 (= e!719162 e!719159)))

(declare-fun b!1263284 () Bool)

(assert (=> b!1263284 (= e!719159 call!62077)))

(declare-fun b!1263285 () Bool)

(declare-fun e!719156 () Bool)

(assert (=> b!1263285 (= e!719156 (= (apply!1005 lt!572434 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62078 () Bool)

(assert (=> bm!62078 (= call!62077 call!62082)))

(declare-fun b!1263286 () Bool)

(assert (=> b!1263286 (= e!719165 e!719162)))

(assert (=> b!1263286 (= c!123129 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263287 () Bool)

(assert (=> b!1263287 (= e!719168 e!719163)))

(declare-fun c!123131 () Bool)

(assert (=> b!1263287 (= c!123131 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62079 () Bool)

(assert (=> bm!62079 (= call!62081 (contains!7611 lt!572434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263288 () Bool)

(declare-fun e!719160 () Bool)

(assert (=> b!1263288 (= e!719163 e!719160)))

(declare-fun res!841362 () Bool)

(assert (=> b!1263288 (= res!841362 call!62078)))

(assert (=> b!1263288 (=> (not res!841362) (not e!719160))))

(declare-fun b!1263289 () Bool)

(assert (=> b!1263289 (= e!719164 e!719161)))

(declare-fun res!841355 () Bool)

(assert (=> b!1263289 (=> (not res!841355) (not e!719161))))

(assert (=> b!1263289 (= res!841355 (contains!7611 lt!572434 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263289 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1263290 () Bool)

(declare-fun res!841359 () Bool)

(assert (=> b!1263290 (=> (not res!841359) (not e!719168))))

(assert (=> b!1263290 (= res!841359 e!719167)))

(declare-fun c!123128 () Bool)

(assert (=> b!1263290 (= c!123128 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62075 () Bool)

(assert (=> bm!62075 (= call!62078 (contains!7611 lt!572434 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!138933 () Bool)

(assert (=> d!138933 e!719168))

(declare-fun res!841361 () Bool)

(assert (=> d!138933 (=> (not res!841361) (not e!719168))))

(assert (=> d!138933 (= res!841361 (or (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))))

(declare-fun lt!572426 () ListLongMap!18917)

(assert (=> d!138933 (= lt!572434 lt!572426)))

(declare-fun lt!572419 () Unit!42042)

(assert (=> d!138933 (= lt!572419 e!719166)))

(declare-fun c!123130 () Bool)

(assert (=> d!138933 (= c!123130 e!719158)))

(declare-fun res!841363 () Bool)

(assert (=> d!138933 (=> (not res!841363) (not e!719158))))

(assert (=> d!138933 (= res!841363 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138933 (= lt!572426 e!719165)))

(assert (=> d!138933 (= c!123126 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138933 (validMask!0 mask!1466)))

(assert (=> d!138933 (= (getCurrentListMap!4627 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572434)))

(declare-fun bm!62080 () Bool)

(assert (=> bm!62080 (= call!62079 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263291 () Bool)

(assert (=> b!1263291 (= e!719160 (= (apply!1005 lt!572434 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1263292 () Bool)

(assert (=> b!1263292 (= e!719167 e!719156)))

(declare-fun res!841360 () Bool)

(assert (=> b!1263292 (= res!841360 call!62081)))

(assert (=> b!1263292 (=> (not res!841360) (not e!719156))))

(declare-fun b!1263293 () Bool)

(assert (=> b!1263293 (= e!719157 (validKeyInArray!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263294 () Bool)

(declare-fun Unit!42048 () Unit!42042)

(assert (=> b!1263294 (= e!719166 Unit!42048)))

(assert (= (and d!138933 c!123126) b!1263280))

(assert (= (and d!138933 (not c!123126)) b!1263286))

(assert (= (and b!1263286 c!123129) b!1263281))

(assert (= (and b!1263286 (not c!123129)) b!1263283))

(assert (= (and b!1263283 c!123127) b!1263278))

(assert (= (and b!1263283 (not c!123127)) b!1263284))

(assert (= (or b!1263278 b!1263284) bm!62078))

(assert (= (or b!1263281 bm!62078) bm!62074))

(assert (= (or b!1263281 b!1263278) bm!62076))

(assert (= (or b!1263280 bm!62074) bm!62080))

(assert (= (or b!1263280 bm!62076) bm!62077))

(assert (= (and d!138933 res!841363) b!1263276))

(assert (= (and d!138933 c!123130) b!1263282))

(assert (= (and d!138933 (not c!123130)) b!1263294))

(assert (= (and d!138933 res!841361) b!1263277))

(assert (= (and b!1263277 res!841356) b!1263293))

(assert (= (and b!1263277 (not res!841357)) b!1263289))

(assert (= (and b!1263289 res!841355) b!1263274))

(assert (= (and b!1263277 res!841358) b!1263290))

(assert (= (and b!1263290 c!123128) b!1263292))

(assert (= (and b!1263290 (not c!123128)) b!1263275))

(assert (= (and b!1263292 res!841360) b!1263285))

(assert (= (or b!1263292 b!1263275) bm!62079))

(assert (= (and b!1263290 res!841359) b!1263287))

(assert (= (and b!1263287 c!123131) b!1263288))

(assert (= (and b!1263287 (not c!123131)) b!1263279))

(assert (= (and b!1263288 res!841362) b!1263291))

(assert (= (or b!1263288 b!1263279) bm!62075))

(declare-fun b_lambda!22821 () Bool)

(assert (=> (not b_lambda!22821) (not b!1263274)))

(declare-fun t!41761 () Bool)

(declare-fun tb!11311 () Bool)

(assert (=> (and start!106176 (= defaultEntry!922 defaultEntry!922) t!41761) tb!11311))

(declare-fun result!23357 () Bool)

(assert (=> tb!11311 (= result!23357 tp_is_empty!32365)))

(assert (=> b!1263274 t!41761))

(declare-fun b_and!45397 () Bool)

(assert (= b_and!45391 (and (=> t!41761 result!23357) b_and!45397)))

(assert (=> bm!62080 m!1164023))

(declare-fun m!1164091 () Bool)

(assert (=> b!1263293 m!1164091))

(assert (=> b!1263293 m!1164091))

(declare-fun m!1164093 () Bool)

(assert (=> b!1263293 m!1164093))

(declare-fun m!1164095 () Bool)

(assert (=> b!1263291 m!1164095))

(declare-fun m!1164097 () Bool)

(assert (=> b!1263285 m!1164097))

(assert (=> b!1263276 m!1164091))

(assert (=> b!1263276 m!1164091))

(assert (=> b!1263276 m!1164093))

(assert (=> b!1263289 m!1164091))

(assert (=> b!1263289 m!1164091))

(declare-fun m!1164099 () Bool)

(assert (=> b!1263289 m!1164099))

(declare-fun m!1164101 () Bool)

(assert (=> b!1263282 m!1164101))

(declare-fun m!1164103 () Bool)

(assert (=> b!1263282 m!1164103))

(declare-fun m!1164105 () Bool)

(assert (=> b!1263282 m!1164105))

(declare-fun m!1164107 () Bool)

(assert (=> b!1263282 m!1164107))

(declare-fun m!1164109 () Bool)

(assert (=> b!1263282 m!1164109))

(declare-fun m!1164111 () Bool)

(assert (=> b!1263282 m!1164111))

(declare-fun m!1164113 () Bool)

(assert (=> b!1263282 m!1164113))

(assert (=> b!1263282 m!1164109))

(declare-fun m!1164115 () Bool)

(assert (=> b!1263282 m!1164115))

(declare-fun m!1164117 () Bool)

(assert (=> b!1263282 m!1164117))

(assert (=> b!1263282 m!1164023))

(declare-fun m!1164119 () Bool)

(assert (=> b!1263282 m!1164119))

(declare-fun m!1164121 () Bool)

(assert (=> b!1263282 m!1164121))

(assert (=> b!1263282 m!1164117))

(declare-fun m!1164123 () Bool)

(assert (=> b!1263282 m!1164123))

(assert (=> b!1263282 m!1164091))

(assert (=> b!1263282 m!1164101))

(declare-fun m!1164125 () Bool)

(assert (=> b!1263282 m!1164125))

(declare-fun m!1164127 () Bool)

(assert (=> b!1263282 m!1164127))

(declare-fun m!1164129 () Bool)

(assert (=> b!1263282 m!1164129))

(assert (=> b!1263282 m!1164111))

(declare-fun m!1164131 () Bool)

(assert (=> bm!62075 m!1164131))

(declare-fun m!1164133 () Bool)

(assert (=> b!1263274 m!1164133))

(declare-fun m!1164135 () Bool)

(assert (=> b!1263274 m!1164135))

(declare-fun m!1164137 () Bool)

(assert (=> b!1263274 m!1164137))

(assert (=> b!1263274 m!1164135))

(assert (=> b!1263274 m!1164133))

(assert (=> b!1263274 m!1164091))

(assert (=> b!1263274 m!1164091))

(declare-fun m!1164139 () Bool)

(assert (=> b!1263274 m!1164139))

(declare-fun m!1164141 () Bool)

(assert (=> bm!62079 m!1164141))

(assert (=> d!138933 m!1164027))

(declare-fun m!1164143 () Bool)

(assert (=> bm!62077 m!1164143))

(declare-fun m!1164145 () Bool)

(assert (=> b!1263280 m!1164145))

(assert (=> b!1263173 d!138933))

(declare-fun d!138935 () Bool)

(declare-fun lt!572442 () ListLongMap!18917)

(assert (=> d!138935 (not (contains!7611 lt!572442 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!143 (List!28259 (_ BitVec 64)) List!28259)

(assert (=> d!138935 (= lt!572442 (ListLongMap!18918 (removeStrictlySorted!143 (toList!9474 lt!572335) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138935 (= (-!2114 lt!572335 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572442)))

(declare-fun bs!35732 () Bool)

(assert (= bs!35732 d!138935))

(declare-fun m!1164147 () Bool)

(assert (=> bs!35732 m!1164147))

(declare-fun m!1164149 () Bool)

(assert (=> bs!35732 m!1164149))

(assert (=> b!1263173 d!138935))

(declare-fun d!138937 () Bool)

(assert (=> d!138937 (= (-!2114 lt!572335 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572335)))

(declare-fun lt!572445 () Unit!42042)

(declare-fun choose!1873 (ListLongMap!18917 (_ BitVec 64)) Unit!42042)

(assert (=> d!138937 (= lt!572445 (choose!1873 lt!572335 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138937 (not (contains!7611 lt!572335 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138937 (= (removeNotPresentStillSame!149 lt!572335 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572445)))

(declare-fun bs!35733 () Bool)

(assert (= bs!35733 d!138937))

(assert (=> bs!35733 m!1164017))

(declare-fun m!1164151 () Bool)

(assert (=> bs!35733 m!1164151))

(assert (=> bs!35733 m!1164009))

(assert (=> b!1263173 d!138937))

(declare-fun d!138939 () Bool)

(assert (=> d!138939 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106176 d!138939))

(declare-fun d!138941 () Bool)

(assert (=> d!138941 (= (array_inv!30407 _keys!1118) (bvsge (size!40279 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106176 d!138941))

(declare-fun d!138943 () Bool)

(assert (=> d!138943 (= (array_inv!30408 _values!914) (bvsge (size!40280 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106176 d!138943))

(declare-fun d!138945 () Bool)

(assert (=> d!138945 (= (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572448 () Unit!42042)

(declare-fun choose!1874 (array!82391 array!82393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48519 V!48519 V!48519 V!48519 (_ BitVec 32) Int) Unit!42042)

(assert (=> d!138945 (= lt!572448 (choose!1874 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138945 (validMask!0 mask!1466)))

(assert (=> d!138945 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1170 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572448)))

(declare-fun bs!35734 () Bool)

(assert (= bs!35734 d!138945))

(assert (=> bs!35734 m!1164025))

(assert (=> bs!35734 m!1164023))

(declare-fun m!1164153 () Bool)

(assert (=> bs!35734 m!1164153))

(assert (=> bs!35734 m!1164027))

(assert (=> b!1263169 d!138945))

(declare-fun b!1263321 () Bool)

(declare-fun e!719183 () ListLongMap!18917)

(declare-fun call!62086 () ListLongMap!18917)

(assert (=> b!1263321 (= e!719183 call!62086)))

(declare-fun lt!572465 () ListLongMap!18917)

(declare-fun b!1263322 () Bool)

(declare-fun e!719184 () Bool)

(assert (=> b!1263322 (= e!719184 (= lt!572465 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138947 () Bool)

(declare-fun e!719186 () Bool)

(assert (=> d!138947 e!719186))

(declare-fun res!841373 () Bool)

(assert (=> d!138947 (=> (not res!841373) (not e!719186))))

(assert (=> d!138947 (= res!841373 (not (contains!7611 lt!572465 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719188 () ListLongMap!18917)

(assert (=> d!138947 (= lt!572465 e!719188)))

(declare-fun c!123142 () Bool)

(assert (=> d!138947 (= c!123142 (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138947 (validMask!0 mask!1466)))

(assert (=> d!138947 (= (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572465)))

(declare-fun b!1263323 () Bool)

(assert (=> b!1263323 (= e!719188 (ListLongMap!18918 Nil!28256))))

(declare-fun b!1263324 () Bool)

(declare-fun e!719189 () Bool)

(assert (=> b!1263324 (= e!719186 e!719189)))

(declare-fun c!123143 () Bool)

(declare-fun e!719185 () Bool)

(assert (=> b!1263324 (= c!123143 e!719185)))

(declare-fun res!841372 () Bool)

(assert (=> b!1263324 (=> (not res!841372) (not e!719185))))

(assert (=> b!1263324 (= res!841372 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1263325 () Bool)

(declare-fun res!841374 () Bool)

(assert (=> b!1263325 (=> (not res!841374) (not e!719186))))

(assert (=> b!1263325 (= res!841374 (not (contains!7611 lt!572465 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263326 () Bool)

(declare-fun lt!572468 () Unit!42042)

(declare-fun lt!572466 () Unit!42042)

(assert (=> b!1263326 (= lt!572468 lt!572466)))

(declare-fun lt!572467 () (_ BitVec 64))

(declare-fun lt!572464 () V!48519)

(declare-fun lt!572469 () ListLongMap!18917)

(declare-fun lt!572463 () (_ BitVec 64))

(assert (=> b!1263326 (not (contains!7611 (+!4288 lt!572469 (tuple2!21037 lt!572467 lt!572464)) lt!572463))))

(declare-fun addStillNotContains!326 (ListLongMap!18917 (_ BitVec 64) V!48519 (_ BitVec 64)) Unit!42042)

(assert (=> b!1263326 (= lt!572466 (addStillNotContains!326 lt!572469 lt!572467 lt!572464 lt!572463))))

(assert (=> b!1263326 (= lt!572463 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263326 (= lt!572464 (get!20320 (select (arr!39743 _values!914) #b00000000000000000000000000000000) (dynLambda!3457 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263326 (= lt!572467 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263326 (= lt!572469 call!62086)))

(assert (=> b!1263326 (= e!719183 (+!4288 call!62086 (tuple2!21037 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000) (get!20320 (select (arr!39743 _values!914) #b00000000000000000000000000000000) (dynLambda!3457 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263327 () Bool)

(declare-fun e!719187 () Bool)

(assert (=> b!1263327 (= e!719189 e!719187)))

(assert (=> b!1263327 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun res!841375 () Bool)

(assert (=> b!1263327 (= res!841375 (contains!7611 lt!572465 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263327 (=> (not res!841375) (not e!719187))))

(declare-fun b!1263328 () Bool)

(assert (=> b!1263328 (= e!719188 e!719183)))

(declare-fun c!123141 () Bool)

(assert (=> b!1263328 (= c!123141 (validKeyInArray!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263329 () Bool)

(assert (=> b!1263329 (= e!719189 e!719184)))

(declare-fun c!123140 () Bool)

(assert (=> b!1263329 (= c!123140 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1263330 () Bool)

(assert (=> b!1263330 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> b!1263330 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40280 _values!914)))))

(assert (=> b!1263330 (= e!719187 (= (apply!1005 lt!572465 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)) (get!20320 (select (arr!39743 _values!914) #b00000000000000000000000000000000) (dynLambda!3457 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263331 () Bool)

(declare-fun isEmpty!1042 (ListLongMap!18917) Bool)

(assert (=> b!1263331 (= e!719184 (isEmpty!1042 lt!572465))))

(declare-fun b!1263332 () Bool)

(assert (=> b!1263332 (= e!719185 (validKeyInArray!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263332 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!62083 () Bool)

(assert (=> bm!62083 (= call!62086 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!138947 c!123142) b!1263323))

(assert (= (and d!138947 (not c!123142)) b!1263328))

(assert (= (and b!1263328 c!123141) b!1263326))

(assert (= (and b!1263328 (not c!123141)) b!1263321))

(assert (= (or b!1263326 b!1263321) bm!62083))

(assert (= (and d!138947 res!841373) b!1263325))

(assert (= (and b!1263325 res!841374) b!1263324))

(assert (= (and b!1263324 res!841372) b!1263332))

(assert (= (and b!1263324 c!123143) b!1263327))

(assert (= (and b!1263324 (not c!123143)) b!1263329))

(assert (= (and b!1263327 res!841375) b!1263330))

(assert (= (and b!1263329 c!123140) b!1263322))

(assert (= (and b!1263329 (not c!123140)) b!1263331))

(declare-fun b_lambda!22823 () Bool)

(assert (=> (not b_lambda!22823) (not b!1263326)))

(assert (=> b!1263326 t!41761))

(declare-fun b_and!45399 () Bool)

(assert (= b_and!45397 (and (=> t!41761 result!23357) b_and!45399)))

(declare-fun b_lambda!22825 () Bool)

(assert (=> (not b_lambda!22825) (not b!1263330)))

(assert (=> b!1263330 t!41761))

(declare-fun b_and!45401 () Bool)

(assert (= b_and!45399 (and (=> t!41761 result!23357) b_and!45401)))

(assert (=> b!1263332 m!1164091))

(assert (=> b!1263332 m!1164091))

(assert (=> b!1263332 m!1164093))

(declare-fun m!1164155 () Bool)

(assert (=> b!1263326 m!1164155))

(declare-fun m!1164157 () Bool)

(assert (=> b!1263326 m!1164157))

(assert (=> b!1263326 m!1164157))

(declare-fun m!1164159 () Bool)

(assert (=> b!1263326 m!1164159))

(declare-fun m!1164161 () Bool)

(assert (=> b!1263326 m!1164161))

(assert (=> b!1263326 m!1164133))

(assert (=> b!1263326 m!1164135))

(assert (=> b!1263326 m!1164137))

(assert (=> b!1263326 m!1164091))

(assert (=> b!1263326 m!1164135))

(assert (=> b!1263326 m!1164133))

(assert (=> b!1263330 m!1164091))

(declare-fun m!1164163 () Bool)

(assert (=> b!1263330 m!1164163))

(assert (=> b!1263330 m!1164133))

(assert (=> b!1263330 m!1164135))

(assert (=> b!1263330 m!1164137))

(assert (=> b!1263330 m!1164091))

(assert (=> b!1263330 m!1164135))

(assert (=> b!1263330 m!1164133))

(declare-fun m!1164165 () Bool)

(assert (=> b!1263325 m!1164165))

(assert (=> b!1263328 m!1164091))

(assert (=> b!1263328 m!1164091))

(assert (=> b!1263328 m!1164093))

(declare-fun m!1164167 () Bool)

(assert (=> b!1263331 m!1164167))

(declare-fun m!1164169 () Bool)

(assert (=> bm!62083 m!1164169))

(declare-fun m!1164171 () Bool)

(assert (=> d!138947 m!1164171))

(assert (=> d!138947 m!1164027))

(assert (=> b!1263322 m!1164169))

(assert (=> b!1263327 m!1164091))

(assert (=> b!1263327 m!1164091))

(declare-fun m!1164173 () Bool)

(assert (=> b!1263327 m!1164173))

(assert (=> b!1263169 d!138947))

(declare-fun b!1263333 () Bool)

(declare-fun e!719190 () ListLongMap!18917)

(declare-fun call!62087 () ListLongMap!18917)

(assert (=> b!1263333 (= e!719190 call!62087)))

(declare-fun lt!572472 () ListLongMap!18917)

(declare-fun b!1263334 () Bool)

(declare-fun e!719191 () Bool)

(assert (=> b!1263334 (= e!719191 (= lt!572472 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138949 () Bool)

(declare-fun e!719193 () Bool)

(assert (=> d!138949 e!719193))

(declare-fun res!841377 () Bool)

(assert (=> d!138949 (=> (not res!841377) (not e!719193))))

(assert (=> d!138949 (= res!841377 (not (contains!7611 lt!572472 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719195 () ListLongMap!18917)

(assert (=> d!138949 (= lt!572472 e!719195)))

(declare-fun c!123146 () Bool)

(assert (=> d!138949 (= c!123146 (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138949 (validMask!0 mask!1466)))

(assert (=> d!138949 (= (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572472)))

(declare-fun b!1263335 () Bool)

(assert (=> b!1263335 (= e!719195 (ListLongMap!18918 Nil!28256))))

(declare-fun b!1263336 () Bool)

(declare-fun e!719196 () Bool)

(assert (=> b!1263336 (= e!719193 e!719196)))

(declare-fun c!123147 () Bool)

(declare-fun e!719192 () Bool)

(assert (=> b!1263336 (= c!123147 e!719192)))

(declare-fun res!841376 () Bool)

(assert (=> b!1263336 (=> (not res!841376) (not e!719192))))

(assert (=> b!1263336 (= res!841376 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1263337 () Bool)

(declare-fun res!841378 () Bool)

(assert (=> b!1263337 (=> (not res!841378) (not e!719193))))

(assert (=> b!1263337 (= res!841378 (not (contains!7611 lt!572472 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263338 () Bool)

(declare-fun lt!572475 () Unit!42042)

(declare-fun lt!572473 () Unit!42042)

(assert (=> b!1263338 (= lt!572475 lt!572473)))

(declare-fun lt!572474 () (_ BitVec 64))

(declare-fun lt!572470 () (_ BitVec 64))

(declare-fun lt!572476 () ListLongMap!18917)

(declare-fun lt!572471 () V!48519)

(assert (=> b!1263338 (not (contains!7611 (+!4288 lt!572476 (tuple2!21037 lt!572474 lt!572471)) lt!572470))))

(assert (=> b!1263338 (= lt!572473 (addStillNotContains!326 lt!572476 lt!572474 lt!572471 lt!572470))))

(assert (=> b!1263338 (= lt!572470 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263338 (= lt!572471 (get!20320 (select (arr!39743 _values!914) #b00000000000000000000000000000000) (dynLambda!3457 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263338 (= lt!572474 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263338 (= lt!572476 call!62087)))

(assert (=> b!1263338 (= e!719190 (+!4288 call!62087 (tuple2!21037 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000) (get!20320 (select (arr!39743 _values!914) #b00000000000000000000000000000000) (dynLambda!3457 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263339 () Bool)

(declare-fun e!719194 () Bool)

(assert (=> b!1263339 (= e!719196 e!719194)))

(assert (=> b!1263339 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun res!841379 () Bool)

(assert (=> b!1263339 (= res!841379 (contains!7611 lt!572472 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263339 (=> (not res!841379) (not e!719194))))

(declare-fun b!1263340 () Bool)

(assert (=> b!1263340 (= e!719195 e!719190)))

(declare-fun c!123145 () Bool)

(assert (=> b!1263340 (= c!123145 (validKeyInArray!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263341 () Bool)

(assert (=> b!1263341 (= e!719196 e!719191)))

(declare-fun c!123144 () Bool)

(assert (=> b!1263341 (= c!123144 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1263342 () Bool)

(assert (=> b!1263342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> b!1263342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40280 _values!914)))))

(assert (=> b!1263342 (= e!719194 (= (apply!1005 lt!572472 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)) (get!20320 (select (arr!39743 _values!914) #b00000000000000000000000000000000) (dynLambda!3457 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263343 () Bool)

(assert (=> b!1263343 (= e!719191 (isEmpty!1042 lt!572472))))

(declare-fun b!1263344 () Bool)

(assert (=> b!1263344 (= e!719192 (validKeyInArray!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263344 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!62084 () Bool)

(assert (=> bm!62084 (= call!62087 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!138949 c!123146) b!1263335))

(assert (= (and d!138949 (not c!123146)) b!1263340))

(assert (= (and b!1263340 c!123145) b!1263338))

(assert (= (and b!1263340 (not c!123145)) b!1263333))

(assert (= (or b!1263338 b!1263333) bm!62084))

(assert (= (and d!138949 res!841377) b!1263337))

(assert (= (and b!1263337 res!841378) b!1263336))

(assert (= (and b!1263336 res!841376) b!1263344))

(assert (= (and b!1263336 c!123147) b!1263339))

(assert (= (and b!1263336 (not c!123147)) b!1263341))

(assert (= (and b!1263339 res!841379) b!1263342))

(assert (= (and b!1263341 c!123144) b!1263334))

(assert (= (and b!1263341 (not c!123144)) b!1263343))

(declare-fun b_lambda!22827 () Bool)

(assert (=> (not b_lambda!22827) (not b!1263338)))

(assert (=> b!1263338 t!41761))

(declare-fun b_and!45403 () Bool)

(assert (= b_and!45401 (and (=> t!41761 result!23357) b_and!45403)))

(declare-fun b_lambda!22829 () Bool)

(assert (=> (not b_lambda!22829) (not b!1263342)))

(assert (=> b!1263342 t!41761))

(declare-fun b_and!45405 () Bool)

(assert (= b_and!45403 (and (=> t!41761 result!23357) b_and!45405)))

(assert (=> b!1263344 m!1164091))

(assert (=> b!1263344 m!1164091))

(assert (=> b!1263344 m!1164093))

(declare-fun m!1164175 () Bool)

(assert (=> b!1263338 m!1164175))

(declare-fun m!1164177 () Bool)

(assert (=> b!1263338 m!1164177))

(assert (=> b!1263338 m!1164177))

(declare-fun m!1164179 () Bool)

(assert (=> b!1263338 m!1164179))

(declare-fun m!1164181 () Bool)

(assert (=> b!1263338 m!1164181))

(assert (=> b!1263338 m!1164133))

(assert (=> b!1263338 m!1164135))

(assert (=> b!1263338 m!1164137))

(assert (=> b!1263338 m!1164091))

(assert (=> b!1263338 m!1164135))

(assert (=> b!1263338 m!1164133))

(assert (=> b!1263342 m!1164091))

(declare-fun m!1164183 () Bool)

(assert (=> b!1263342 m!1164183))

(assert (=> b!1263342 m!1164133))

(assert (=> b!1263342 m!1164135))

(assert (=> b!1263342 m!1164137))

(assert (=> b!1263342 m!1164091))

(assert (=> b!1263342 m!1164135))

(assert (=> b!1263342 m!1164133))

(declare-fun m!1164185 () Bool)

(assert (=> b!1263337 m!1164185))

(assert (=> b!1263340 m!1164091))

(assert (=> b!1263340 m!1164091))

(assert (=> b!1263340 m!1164093))

(declare-fun m!1164187 () Bool)

(assert (=> b!1263343 m!1164187))

(declare-fun m!1164189 () Bool)

(assert (=> bm!62084 m!1164189))

(declare-fun m!1164191 () Bool)

(assert (=> d!138949 m!1164191))

(assert (=> d!138949 m!1164027))

(assert (=> b!1263334 m!1164189))

(assert (=> b!1263339 m!1164091))

(assert (=> b!1263339 m!1164091))

(declare-fun m!1164193 () Bool)

(assert (=> b!1263339 m!1164193))

(assert (=> b!1263169 d!138949))

(declare-fun d!138951 () Bool)

(declare-fun res!841388 () Bool)

(declare-fun e!719206 () Bool)

(assert (=> d!138951 (=> res!841388 e!719206)))

(assert (=> d!138951 (= res!841388 (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138951 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28257) e!719206)))

(declare-fun b!1263355 () Bool)

(declare-fun e!719205 () Bool)

(assert (=> b!1263355 (= e!719206 e!719205)))

(declare-fun res!841387 () Bool)

(assert (=> b!1263355 (=> (not res!841387) (not e!719205))))

(declare-fun e!719208 () Bool)

(assert (=> b!1263355 (= res!841387 (not e!719208))))

(declare-fun res!841386 () Bool)

(assert (=> b!1263355 (=> (not res!841386) (not e!719208))))

(assert (=> b!1263355 (= res!841386 (validKeyInArray!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62087 () Bool)

(declare-fun call!62090 () Bool)

(declare-fun c!123150 () Bool)

(assert (=> bm!62087 (= call!62090 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123150 (Cons!28256 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000) Nil!28257) Nil!28257)))))

(declare-fun b!1263356 () Bool)

(declare-fun e!719207 () Bool)

(assert (=> b!1263356 (= e!719207 call!62090)))

(declare-fun b!1263357 () Bool)

(assert (=> b!1263357 (= e!719205 e!719207)))

(assert (=> b!1263357 (= c!123150 (validKeyInArray!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263358 () Bool)

(declare-fun contains!7614 (List!28260 (_ BitVec 64)) Bool)

(assert (=> b!1263358 (= e!719208 (contains!7614 Nil!28257 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263359 () Bool)

(assert (=> b!1263359 (= e!719207 call!62090)))

(assert (= (and d!138951 (not res!841388)) b!1263355))

(assert (= (and b!1263355 res!841386) b!1263358))

(assert (= (and b!1263355 res!841387) b!1263357))

(assert (= (and b!1263357 c!123150) b!1263356))

(assert (= (and b!1263357 (not c!123150)) b!1263359))

(assert (= (or b!1263356 b!1263359) bm!62087))

(assert (=> b!1263355 m!1164091))

(assert (=> b!1263355 m!1164091))

(assert (=> b!1263355 m!1164093))

(assert (=> bm!62087 m!1164091))

(declare-fun m!1164195 () Bool)

(assert (=> bm!62087 m!1164195))

(assert (=> b!1263357 m!1164091))

(assert (=> b!1263357 m!1164091))

(assert (=> b!1263357 m!1164093))

(assert (=> b!1263358 m!1164091))

(assert (=> b!1263358 m!1164091))

(declare-fun m!1164197 () Bool)

(assert (=> b!1263358 m!1164197))

(assert (=> b!1263174 d!138951))

(declare-fun d!138953 () Bool)

(declare-fun e!719213 () Bool)

(assert (=> d!138953 e!719213))

(declare-fun res!841391 () Bool)

(assert (=> d!138953 (=> res!841391 e!719213)))

(declare-fun lt!572485 () Bool)

(assert (=> d!138953 (= res!841391 (not lt!572485))))

(declare-fun lt!572488 () Bool)

(assert (=> d!138953 (= lt!572485 lt!572488)))

(declare-fun lt!572486 () Unit!42042)

(declare-fun e!719214 () Unit!42042)

(assert (=> d!138953 (= lt!572486 e!719214)))

(declare-fun c!123153 () Bool)

(assert (=> d!138953 (= c!123153 lt!572488)))

(declare-fun containsKey!623 (List!28259 (_ BitVec 64)) Bool)

(assert (=> d!138953 (= lt!572488 (containsKey!623 (toList!9474 lt!572335) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138953 (= (contains!7611 lt!572335 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572485)))

(declare-fun b!1263366 () Bool)

(declare-fun lt!572487 () Unit!42042)

(assert (=> b!1263366 (= e!719214 lt!572487)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!432 (List!28259 (_ BitVec 64)) Unit!42042)

(assert (=> b!1263366 (= lt!572487 (lemmaContainsKeyImpliesGetValueByKeyDefined!432 (toList!9474 lt!572335) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!708 0))(
  ( (Some!707 (v!18949 V!48519)) (None!706) )
))
(declare-fun isDefined!470 (Option!708) Bool)

(declare-fun getValueByKey!657 (List!28259 (_ BitVec 64)) Option!708)

(assert (=> b!1263366 (isDefined!470 (getValueByKey!657 (toList!9474 lt!572335) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263367 () Bool)

(declare-fun Unit!42049 () Unit!42042)

(assert (=> b!1263367 (= e!719214 Unit!42049)))

(declare-fun b!1263368 () Bool)

(assert (=> b!1263368 (= e!719213 (isDefined!470 (getValueByKey!657 (toList!9474 lt!572335) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138953 c!123153) b!1263366))

(assert (= (and d!138953 (not c!123153)) b!1263367))

(assert (= (and d!138953 (not res!841391)) b!1263368))

(declare-fun m!1164199 () Bool)

(assert (=> d!138953 m!1164199))

(declare-fun m!1164201 () Bool)

(assert (=> b!1263366 m!1164201))

(declare-fun m!1164203 () Bool)

(assert (=> b!1263366 m!1164203))

(assert (=> b!1263366 m!1164203))

(declare-fun m!1164205 () Bool)

(assert (=> b!1263366 m!1164205))

(assert (=> b!1263368 m!1164203))

(assert (=> b!1263368 m!1164203))

(assert (=> b!1263368 m!1164205))

(assert (=> b!1263171 d!138953))

(declare-fun bm!62088 () Bool)

(declare-fun call!62096 () ListLongMap!18917)

(declare-fun call!62093 () ListLongMap!18917)

(assert (=> bm!62088 (= call!62096 call!62093)))

(declare-fun b!1263369 () Bool)

(declare-fun lt!572505 () ListLongMap!18917)

(declare-fun e!719220 () Bool)

(assert (=> b!1263369 (= e!719220 (= (apply!1005 lt!572505 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)) (get!20320 (select (arr!39743 _values!914) #b00000000000000000000000000000000) (dynLambda!3457 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40280 _values!914)))))

(assert (=> b!1263369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1263370 () Bool)

(declare-fun e!719226 () Bool)

(declare-fun call!62095 () Bool)

(assert (=> b!1263370 (= e!719226 (not call!62095))))

(declare-fun b!1263371 () Bool)

(declare-fun e!719217 () Bool)

(assert (=> b!1263371 (= e!719217 (validKeyInArray!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263372 () Bool)

(declare-fun res!841395 () Bool)

(declare-fun e!719227 () Bool)

(assert (=> b!1263372 (=> (not res!841395) (not e!719227))))

(declare-fun e!719223 () Bool)

(assert (=> b!1263372 (= res!841395 e!719223)))

(declare-fun res!841394 () Bool)

(assert (=> b!1263372 (=> res!841394 e!719223)))

(declare-fun e!719216 () Bool)

(assert (=> b!1263372 (= res!841394 (not e!719216))))

(declare-fun res!841393 () Bool)

(assert (=> b!1263372 (=> (not res!841393) (not e!719216))))

(assert (=> b!1263372 (= res!841393 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1263373 () Bool)

(declare-fun e!719218 () ListLongMap!18917)

(declare-fun call!62094 () ListLongMap!18917)

(assert (=> b!1263373 (= e!719218 call!62094)))

(declare-fun b!1263374 () Bool)

(declare-fun e!719222 () Bool)

(declare-fun call!62092 () Bool)

(assert (=> b!1263374 (= e!719222 (not call!62092))))

(declare-fun b!1263375 () Bool)

(declare-fun e!719224 () ListLongMap!18917)

(declare-fun call!62097 () ListLongMap!18917)

(assert (=> b!1263375 (= e!719224 (+!4288 call!62097 (tuple2!21037 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1263376 () Bool)

(declare-fun e!719221 () ListLongMap!18917)

(assert (=> b!1263376 (= e!719221 call!62094)))

(declare-fun bm!62090 () Bool)

(assert (=> bm!62090 (= call!62094 call!62097)))

(declare-fun b!1263377 () Bool)

(declare-fun e!719225 () Unit!42042)

(declare-fun lt!572496 () Unit!42042)

(assert (=> b!1263377 (= e!719225 lt!572496)))

(declare-fun lt!572510 () ListLongMap!18917)

(assert (=> b!1263377 (= lt!572510 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572501 () (_ BitVec 64))

(assert (=> b!1263377 (= lt!572501 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572507 () (_ BitVec 64))

(assert (=> b!1263377 (= lt!572507 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572493 () Unit!42042)

(assert (=> b!1263377 (= lt!572493 (addStillContains!1094 lt!572510 lt!572501 zeroValue!871 lt!572507))))

(assert (=> b!1263377 (contains!7611 (+!4288 lt!572510 (tuple2!21037 lt!572501 zeroValue!871)) lt!572507)))

(declare-fun lt!572509 () Unit!42042)

(assert (=> b!1263377 (= lt!572509 lt!572493)))

(declare-fun lt!572508 () ListLongMap!18917)

(assert (=> b!1263377 (= lt!572508 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572495 () (_ BitVec 64))

(assert (=> b!1263377 (= lt!572495 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572504 () (_ BitVec 64))

(assert (=> b!1263377 (= lt!572504 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572506 () Unit!42042)

(assert (=> b!1263377 (= lt!572506 (addApplyDifferent!536 lt!572508 lt!572495 minValueBefore!43 lt!572504))))

(assert (=> b!1263377 (= (apply!1005 (+!4288 lt!572508 (tuple2!21037 lt!572495 minValueBefore!43)) lt!572504) (apply!1005 lt!572508 lt!572504))))

(declare-fun lt!572491 () Unit!42042)

(assert (=> b!1263377 (= lt!572491 lt!572506)))

(declare-fun lt!572502 () ListLongMap!18917)

(assert (=> b!1263377 (= lt!572502 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572499 () (_ BitVec 64))

(assert (=> b!1263377 (= lt!572499 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572492 () (_ BitVec 64))

(assert (=> b!1263377 (= lt!572492 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572503 () Unit!42042)

(assert (=> b!1263377 (= lt!572503 (addApplyDifferent!536 lt!572502 lt!572499 zeroValue!871 lt!572492))))

(assert (=> b!1263377 (= (apply!1005 (+!4288 lt!572502 (tuple2!21037 lt!572499 zeroValue!871)) lt!572492) (apply!1005 lt!572502 lt!572492))))

(declare-fun lt!572494 () Unit!42042)

(assert (=> b!1263377 (= lt!572494 lt!572503)))

(declare-fun lt!572498 () ListLongMap!18917)

(assert (=> b!1263377 (= lt!572498 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572500 () (_ BitVec 64))

(assert (=> b!1263377 (= lt!572500 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572489 () (_ BitVec 64))

(assert (=> b!1263377 (= lt!572489 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263377 (= lt!572496 (addApplyDifferent!536 lt!572498 lt!572500 minValueBefore!43 lt!572489))))

(assert (=> b!1263377 (= (apply!1005 (+!4288 lt!572498 (tuple2!21037 lt!572500 minValueBefore!43)) lt!572489) (apply!1005 lt!572498 lt!572489))))

(declare-fun c!123154 () Bool)

(declare-fun bm!62091 () Bool)

(declare-fun c!123157 () Bool)

(declare-fun call!62091 () ListLongMap!18917)

(assert (=> bm!62091 (= call!62097 (+!4288 (ite c!123154 call!62093 (ite c!123157 call!62096 call!62091)) (ite (or c!123154 c!123157) (tuple2!21037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21037 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1263378 () Bool)

(declare-fun c!123155 () Bool)

(assert (=> b!1263378 (= c!123155 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263378 (= e!719221 e!719218)))

(declare-fun b!1263379 () Bool)

(assert (=> b!1263379 (= e!719218 call!62091)))

(declare-fun b!1263380 () Bool)

(declare-fun e!719215 () Bool)

(assert (=> b!1263380 (= e!719215 (= (apply!1005 lt!572505 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62092 () Bool)

(assert (=> bm!62092 (= call!62091 call!62096)))

(declare-fun b!1263381 () Bool)

(assert (=> b!1263381 (= e!719224 e!719221)))

(assert (=> b!1263381 (= c!123157 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263382 () Bool)

(assert (=> b!1263382 (= e!719227 e!719222)))

(declare-fun c!123159 () Bool)

(assert (=> b!1263382 (= c!123159 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62093 () Bool)

(assert (=> bm!62093 (= call!62095 (contains!7611 lt!572505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263383 () Bool)

(declare-fun e!719219 () Bool)

(assert (=> b!1263383 (= e!719222 e!719219)))

(declare-fun res!841399 () Bool)

(assert (=> b!1263383 (= res!841399 call!62092)))

(assert (=> b!1263383 (=> (not res!841399) (not e!719219))))

(declare-fun b!1263384 () Bool)

(assert (=> b!1263384 (= e!719223 e!719220)))

(declare-fun res!841392 () Bool)

(assert (=> b!1263384 (=> (not res!841392) (not e!719220))))

(assert (=> b!1263384 (= res!841392 (contains!7611 lt!572505 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263384 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1263385 () Bool)

(declare-fun res!841396 () Bool)

(assert (=> b!1263385 (=> (not res!841396) (not e!719227))))

(assert (=> b!1263385 (= res!841396 e!719226)))

(declare-fun c!123156 () Bool)

(assert (=> b!1263385 (= c!123156 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62089 () Bool)

(assert (=> bm!62089 (= call!62092 (contains!7611 lt!572505 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!138955 () Bool)

(assert (=> d!138955 e!719227))

(declare-fun res!841398 () Bool)

(assert (=> d!138955 (=> (not res!841398) (not e!719227))))

(assert (=> d!138955 (= res!841398 (or (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))))

(declare-fun lt!572497 () ListLongMap!18917)

(assert (=> d!138955 (= lt!572505 lt!572497)))

(declare-fun lt!572490 () Unit!42042)

(assert (=> d!138955 (= lt!572490 e!719225)))

(declare-fun c!123158 () Bool)

(assert (=> d!138955 (= c!123158 e!719217)))

(declare-fun res!841400 () Bool)

(assert (=> d!138955 (=> (not res!841400) (not e!719217))))

(assert (=> d!138955 (= res!841400 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138955 (= lt!572497 e!719224)))

(assert (=> d!138955 (= c!123154 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138955 (validMask!0 mask!1466)))

(assert (=> d!138955 (= (getCurrentListMap!4627 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572505)))

(declare-fun bm!62094 () Bool)

(assert (=> bm!62094 (= call!62093 (getCurrentListMapNoExtraKeys!5880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263386 () Bool)

(assert (=> b!1263386 (= e!719219 (= (apply!1005 lt!572505 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1263387 () Bool)

(assert (=> b!1263387 (= e!719226 e!719215)))

(declare-fun res!841397 () Bool)

(assert (=> b!1263387 (= res!841397 call!62095)))

(assert (=> b!1263387 (=> (not res!841397) (not e!719215))))

(declare-fun b!1263388 () Bool)

(assert (=> b!1263388 (= e!719216 (validKeyInArray!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263389 () Bool)

(declare-fun Unit!42050 () Unit!42042)

(assert (=> b!1263389 (= e!719225 Unit!42050)))

(assert (= (and d!138955 c!123154) b!1263375))

(assert (= (and d!138955 (not c!123154)) b!1263381))

(assert (= (and b!1263381 c!123157) b!1263376))

(assert (= (and b!1263381 (not c!123157)) b!1263378))

(assert (= (and b!1263378 c!123155) b!1263373))

(assert (= (and b!1263378 (not c!123155)) b!1263379))

(assert (= (or b!1263373 b!1263379) bm!62092))

(assert (= (or b!1263376 bm!62092) bm!62088))

(assert (= (or b!1263376 b!1263373) bm!62090))

(assert (= (or b!1263375 bm!62088) bm!62094))

(assert (= (or b!1263375 bm!62090) bm!62091))

(assert (= (and d!138955 res!841400) b!1263371))

(assert (= (and d!138955 c!123158) b!1263377))

(assert (= (and d!138955 (not c!123158)) b!1263389))

(assert (= (and d!138955 res!841398) b!1263372))

(assert (= (and b!1263372 res!841393) b!1263388))

(assert (= (and b!1263372 (not res!841394)) b!1263384))

(assert (= (and b!1263384 res!841392) b!1263369))

(assert (= (and b!1263372 res!841395) b!1263385))

(assert (= (and b!1263385 c!123156) b!1263387))

(assert (= (and b!1263385 (not c!123156)) b!1263370))

(assert (= (and b!1263387 res!841397) b!1263380))

(assert (= (or b!1263387 b!1263370) bm!62093))

(assert (= (and b!1263385 res!841396) b!1263382))

(assert (= (and b!1263382 c!123159) b!1263383))

(assert (= (and b!1263382 (not c!123159)) b!1263374))

(assert (= (and b!1263383 res!841399) b!1263386))

(assert (= (or b!1263383 b!1263374) bm!62089))

(declare-fun b_lambda!22831 () Bool)

(assert (=> (not b_lambda!22831) (not b!1263369)))

(assert (=> b!1263369 t!41761))

(declare-fun b_and!45407 () Bool)

(assert (= b_and!45405 (and (=> t!41761 result!23357) b_and!45407)))

(assert (=> bm!62094 m!1164025))

(assert (=> b!1263388 m!1164091))

(assert (=> b!1263388 m!1164091))

(assert (=> b!1263388 m!1164093))

(declare-fun m!1164207 () Bool)

(assert (=> b!1263386 m!1164207))

(declare-fun m!1164209 () Bool)

(assert (=> b!1263380 m!1164209))

(assert (=> b!1263371 m!1164091))

(assert (=> b!1263371 m!1164091))

(assert (=> b!1263371 m!1164093))

(assert (=> b!1263384 m!1164091))

(assert (=> b!1263384 m!1164091))

(declare-fun m!1164211 () Bool)

(assert (=> b!1263384 m!1164211))

(declare-fun m!1164213 () Bool)

(assert (=> b!1263377 m!1164213))

(declare-fun m!1164215 () Bool)

(assert (=> b!1263377 m!1164215))

(declare-fun m!1164217 () Bool)

(assert (=> b!1263377 m!1164217))

(declare-fun m!1164219 () Bool)

(assert (=> b!1263377 m!1164219))

(declare-fun m!1164221 () Bool)

(assert (=> b!1263377 m!1164221))

(declare-fun m!1164223 () Bool)

(assert (=> b!1263377 m!1164223))

(declare-fun m!1164225 () Bool)

(assert (=> b!1263377 m!1164225))

(assert (=> b!1263377 m!1164221))

(declare-fun m!1164227 () Bool)

(assert (=> b!1263377 m!1164227))

(declare-fun m!1164229 () Bool)

(assert (=> b!1263377 m!1164229))

(assert (=> b!1263377 m!1164025))

(declare-fun m!1164231 () Bool)

(assert (=> b!1263377 m!1164231))

(declare-fun m!1164233 () Bool)

(assert (=> b!1263377 m!1164233))

(assert (=> b!1263377 m!1164229))

(declare-fun m!1164235 () Bool)

(assert (=> b!1263377 m!1164235))

(assert (=> b!1263377 m!1164091))

(assert (=> b!1263377 m!1164213))

(declare-fun m!1164237 () Bool)

(assert (=> b!1263377 m!1164237))

(declare-fun m!1164239 () Bool)

(assert (=> b!1263377 m!1164239))

(declare-fun m!1164241 () Bool)

(assert (=> b!1263377 m!1164241))

(assert (=> b!1263377 m!1164223))

(declare-fun m!1164243 () Bool)

(assert (=> bm!62089 m!1164243))

(assert (=> b!1263369 m!1164133))

(assert (=> b!1263369 m!1164135))

(assert (=> b!1263369 m!1164137))

(assert (=> b!1263369 m!1164135))

(assert (=> b!1263369 m!1164133))

(assert (=> b!1263369 m!1164091))

(assert (=> b!1263369 m!1164091))

(declare-fun m!1164245 () Bool)

(assert (=> b!1263369 m!1164245))

(declare-fun m!1164247 () Bool)

(assert (=> bm!62093 m!1164247))

(assert (=> d!138955 m!1164027))

(declare-fun m!1164249 () Bool)

(assert (=> bm!62091 m!1164249))

(declare-fun m!1164251 () Bool)

(assert (=> b!1263375 m!1164251))

(assert (=> b!1263171 d!138955))

(declare-fun b!1263398 () Bool)

(declare-fun e!719235 () Bool)

(declare-fun e!719234 () Bool)

(assert (=> b!1263398 (= e!719235 e!719234)))

(declare-fun c!123162 () Bool)

(assert (=> b!1263398 (= c!123162 (validKeyInArray!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263399 () Bool)

(declare-fun e!719236 () Bool)

(assert (=> b!1263399 (= e!719234 e!719236)))

(declare-fun lt!572517 () (_ BitVec 64))

(assert (=> b!1263399 (= lt!572517 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572519 () Unit!42042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82391 (_ BitVec 64) (_ BitVec 32)) Unit!42042)

(assert (=> b!1263399 (= lt!572519 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572517 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263399 (arrayContainsKey!0 _keys!1118 lt!572517 #b00000000000000000000000000000000)))

(declare-fun lt!572518 () Unit!42042)

(assert (=> b!1263399 (= lt!572518 lt!572519)))

(declare-fun res!841406 () Bool)

(declare-datatypes ((SeekEntryResult!9930 0))(
  ( (MissingZero!9930 (index!42091 (_ BitVec 32))) (Found!9930 (index!42092 (_ BitVec 32))) (Intermediate!9930 (undefined!10742 Bool) (index!42093 (_ BitVec 32)) (x!111187 (_ BitVec 32))) (Undefined!9930) (MissingVacant!9930 (index!42094 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82391 (_ BitVec 32)) SeekEntryResult!9930)

(assert (=> b!1263399 (= res!841406 (= (seekEntryOrOpen!0 (select (arr!39742 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9930 #b00000000000000000000000000000000)))))

(assert (=> b!1263399 (=> (not res!841406) (not e!719236))))

(declare-fun b!1263400 () Bool)

(declare-fun call!62100 () Bool)

(assert (=> b!1263400 (= e!719236 call!62100)))

(declare-fun bm!62097 () Bool)

(assert (=> bm!62097 (= call!62100 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!138957 () Bool)

(declare-fun res!841405 () Bool)

(assert (=> d!138957 (=> res!841405 e!719235)))

(assert (=> d!138957 (= res!841405 (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719235)))

(declare-fun b!1263401 () Bool)

(assert (=> b!1263401 (= e!719234 call!62100)))

(assert (= (and d!138957 (not res!841405)) b!1263398))

(assert (= (and b!1263398 c!123162) b!1263399))

(assert (= (and b!1263398 (not c!123162)) b!1263401))

(assert (= (and b!1263399 res!841406) b!1263400))

(assert (= (or b!1263400 b!1263401) bm!62097))

(assert (=> b!1263398 m!1164091))

(assert (=> b!1263398 m!1164091))

(assert (=> b!1263398 m!1164093))

(assert (=> b!1263399 m!1164091))

(declare-fun m!1164253 () Bool)

(assert (=> b!1263399 m!1164253))

(declare-fun m!1164255 () Bool)

(assert (=> b!1263399 m!1164255))

(assert (=> b!1263399 m!1164091))

(declare-fun m!1164257 () Bool)

(assert (=> b!1263399 m!1164257))

(declare-fun m!1164259 () Bool)

(assert (=> bm!62097 m!1164259))

(assert (=> b!1263170 d!138957))

(declare-fun condMapEmpty!50365 () Bool)

(declare-fun mapDefault!50365 () ValueCell!15419)

(assert (=> mapNonEmpty!50356 (= condMapEmpty!50365 (= mapRest!50356 ((as const (Array (_ BitVec 32) ValueCell!15419)) mapDefault!50365)))))

(declare-fun e!719241 () Bool)

(declare-fun mapRes!50365 () Bool)

(assert (=> mapNonEmpty!50356 (= tp!95927 (and e!719241 mapRes!50365))))

(declare-fun b!1263409 () Bool)

(assert (=> b!1263409 (= e!719241 tp_is_empty!32365)))

(declare-fun b!1263408 () Bool)

(declare-fun e!719242 () Bool)

(assert (=> b!1263408 (= e!719242 tp_is_empty!32365)))

(declare-fun mapNonEmpty!50365 () Bool)

(declare-fun tp!95942 () Bool)

(assert (=> mapNonEmpty!50365 (= mapRes!50365 (and tp!95942 e!719242))))

(declare-fun mapValue!50365 () ValueCell!15419)

(declare-fun mapRest!50365 () (Array (_ BitVec 32) ValueCell!15419))

(declare-fun mapKey!50365 () (_ BitVec 32))

(assert (=> mapNonEmpty!50365 (= mapRest!50356 (store mapRest!50365 mapKey!50365 mapValue!50365))))

(declare-fun mapIsEmpty!50365 () Bool)

(assert (=> mapIsEmpty!50365 mapRes!50365))

(assert (= (and mapNonEmpty!50356 condMapEmpty!50365) mapIsEmpty!50365))

(assert (= (and mapNonEmpty!50356 (not condMapEmpty!50365)) mapNonEmpty!50365))

(assert (= (and mapNonEmpty!50365 ((_ is ValueCellFull!15419) mapValue!50365)) b!1263408))

(assert (= (and mapNonEmpty!50356 ((_ is ValueCellFull!15419) mapDefault!50365)) b!1263409))

(declare-fun m!1164261 () Bool)

(assert (=> mapNonEmpty!50365 m!1164261))

(declare-fun b_lambda!22833 () Bool)

(assert (= b_lambda!22827 (or (and start!106176 b_free!27463) b_lambda!22833)))

(declare-fun b_lambda!22835 () Bool)

(assert (= b_lambda!22823 (or (and start!106176 b_free!27463) b_lambda!22835)))

(declare-fun b_lambda!22837 () Bool)

(assert (= b_lambda!22825 (or (and start!106176 b_free!27463) b_lambda!22837)))

(declare-fun b_lambda!22839 () Bool)

(assert (= b_lambda!22829 (or (and start!106176 b_free!27463) b_lambda!22839)))

(declare-fun b_lambda!22841 () Bool)

(assert (= b_lambda!22831 (or (and start!106176 b_free!27463) b_lambda!22841)))

(declare-fun b_lambda!22843 () Bool)

(assert (= b_lambda!22821 (or (and start!106176 b_free!27463) b_lambda!22843)))

(check-sat (not bm!62075) (not b_lambda!22839) (not b!1263380) (not b!1263340) (not b!1263327) (not b!1263386) (not bm!62093) (not b!1263285) (not bm!62094) tp_is_empty!32365 (not b!1263342) (not b!1263357) (not bm!62077) (not b!1263355) (not bm!62080) (not bm!62079) (not b_lambda!22843) (not b_lambda!22835) (not b!1263334) (not d!138933) (not d!138947) (not b!1263325) (not b!1263344) (not d!138945) (not b!1263293) (not b!1263375) (not b!1263282) (not b!1263328) (not b!1263276) (not b!1263388) (not b!1263326) (not d!138955) (not b!1263366) (not d!138937) (not b!1263332) (not b_lambda!22833) (not d!138935) (not b!1263291) (not b!1263331) b_and!45407 (not d!138949) (not b!1263338) (not b!1263330) (not mapNonEmpty!50365) (not b!1263384) (not b!1263322) (not b!1263289) (not bm!62089) (not b!1263358) (not bm!62097) (not bm!62084) (not b!1263371) (not b!1263280) (not b!1263377) (not b_lambda!22837) (not b_next!27463) (not b!1263399) (not b!1263398) (not bm!62083) (not b!1263368) (not d!138953) (not bm!62087) (not b!1263337) (not b_lambda!22841) (not b!1263369) (not b!1263274) (not b!1263343) (not b!1263339) (not bm!62091))
(check-sat b_and!45407 (not b_next!27463))
