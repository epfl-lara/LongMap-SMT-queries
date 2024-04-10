; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105818 () Bool)

(assert start!105818)

(declare-fun b_free!27381 () Bool)

(declare-fun b_next!27381 () Bool)

(assert (=> start!105818 (= b_free!27381 (not b_next!27381))))

(declare-fun tp!95671 () Bool)

(declare-fun b_and!45277 () Bool)

(assert (=> start!105818 (= tp!95671 b_and!45277)))

(declare-fun b!1260557 () Bool)

(declare-fun res!840094 () Bool)

(declare-fun e!717329 () Bool)

(assert (=> b!1260557 (=> (not res!840094) (not e!717329))))

(declare-datatypes ((array!82184 0))(
  ( (array!82185 (arr!39646 (Array (_ BitVec 32) (_ BitVec 64))) (size!40182 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82184)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82184 (_ BitVec 32)) Bool)

(assert (=> b!1260557 (= res!840094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260558 () Bool)

(declare-fun e!717332 () Bool)

(declare-fun e!717333 () Bool)

(declare-fun mapRes!50224 () Bool)

(assert (=> b!1260558 (= e!717332 (and e!717333 mapRes!50224))))

(declare-fun condMapEmpty!50224 () Bool)

(declare-datatypes ((V!48409 0))(
  ( (V!48410 (val!16204 Int)) )
))
(declare-datatypes ((ValueCell!15378 0))(
  ( (ValueCellFull!15378 (v!18907 V!48409)) (EmptyCell!15378) )
))
(declare-datatypes ((array!82186 0))(
  ( (array!82187 (arr!39647 (Array (_ BitVec 32) ValueCell!15378)) (size!40183 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82186)

(declare-fun mapDefault!50224 () ValueCell!15378)

(assert (=> b!1260558 (= condMapEmpty!50224 (= (arr!39647 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15378)) mapDefault!50224)))))

(declare-fun b!1260559 () Bool)

(declare-fun e!717327 () Bool)

(declare-fun tp_is_empty!32283 () Bool)

(assert (=> b!1260559 (= e!717327 tp_is_empty!32283)))

(declare-fun b!1260560 () Bool)

(declare-fun e!717334 () Bool)

(assert (=> b!1260560 (= e!717334 (bvsle #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun mapNonEmpty!50224 () Bool)

(declare-fun tp!95672 () Bool)

(assert (=> mapNonEmpty!50224 (= mapRes!50224 (and tp!95672 e!717327))))

(declare-fun mapRest!50224 () (Array (_ BitVec 32) ValueCell!15378))

(declare-fun mapValue!50224 () ValueCell!15378)

(declare-fun mapKey!50224 () (_ BitVec 32))

(assert (=> mapNonEmpty!50224 (= (arr!39647 _values!914) (store mapRest!50224 mapKey!50224 mapValue!50224))))

(declare-fun res!840093 () Bool)

(assert (=> start!105818 (=> (not res!840093) (not e!717329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105818 (= res!840093 (validMask!0 mask!1466))))

(assert (=> start!105818 e!717329))

(assert (=> start!105818 true))

(assert (=> start!105818 tp!95671))

(assert (=> start!105818 tp_is_empty!32283))

(declare-fun array_inv!30181 (array!82184) Bool)

(assert (=> start!105818 (array_inv!30181 _keys!1118)))

(declare-fun array_inv!30182 (array!82186) Bool)

(assert (=> start!105818 (and (array_inv!30182 _values!914) e!717332)))

(declare-fun b!1260561 () Bool)

(declare-fun e!717328 () Bool)

(assert (=> b!1260561 (= e!717328 e!717334)))

(declare-fun res!840092 () Bool)

(assert (=> b!1260561 (=> res!840092 e!717334)))

(declare-datatypes ((tuple2!20966 0))(
  ( (tuple2!20967 (_1!10494 (_ BitVec 64)) (_2!10494 V!48409)) )
))
(declare-datatypes ((List!28164 0))(
  ( (Nil!28161) (Cons!28160 (h!29369 tuple2!20966) (t!41661 List!28164)) )
))
(declare-datatypes ((ListLongMap!18839 0))(
  ( (ListLongMap!18840 (toList!9435 List!28164)) )
))
(declare-fun lt!571241 () ListLongMap!18839)

(declare-fun lt!571238 () ListLongMap!18839)

(declare-fun -!2138 (ListLongMap!18839 (_ BitVec 64)) ListLongMap!18839)

(assert (=> b!1260561 (= res!840092 (not (= (-!2138 lt!571241 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571238)))))

(declare-fun lt!571244 () ListLongMap!18839)

(declare-fun lt!571239 () ListLongMap!18839)

(assert (=> b!1260561 (= (-!2138 lt!571244 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571239)))

(declare-datatypes ((Unit!42051 0))(
  ( (Unit!42052) )
))
(declare-fun lt!571246 () Unit!42051)

(declare-fun minValueBefore!43 () V!48409)

(declare-fun addThenRemoveForNewKeyIsSame!375 (ListLongMap!18839 (_ BitVec 64) V!48409) Unit!42051)

(assert (=> b!1260561 (= lt!571246 (addThenRemoveForNewKeyIsSame!375 lt!571239 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717330 () Bool)

(assert (=> b!1260561 e!717330))

(declare-fun res!840090 () Bool)

(assert (=> b!1260561 (=> (not res!840090) (not e!717330))))

(assert (=> b!1260561 (= res!840090 (= lt!571241 lt!571244))))

(declare-fun +!4238 (ListLongMap!18839 tuple2!20966) ListLongMap!18839)

(assert (=> b!1260561 (= lt!571244 (+!4238 lt!571239 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571242 () ListLongMap!18839)

(declare-fun lt!571245 () tuple2!20966)

(assert (=> b!1260561 (= lt!571239 (+!4238 lt!571242 lt!571245))))

(declare-fun zeroValue!871 () V!48409)

(assert (=> b!1260561 (= lt!571245 (tuple2!20967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48409)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4629 (array!82184 array!82186 (_ BitVec 32) (_ BitVec 32) V!48409 V!48409 (_ BitVec 32) Int) ListLongMap!18839)

(assert (=> b!1260561 (= lt!571238 (getCurrentListMap!4629 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260561 (= lt!571241 (getCurrentListMap!4629 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260562 () Bool)

(declare-fun res!840095 () Bool)

(assert (=> b!1260562 (=> (not res!840095) (not e!717329))))

(assert (=> b!1260562 (= res!840095 (and (= (size!40183 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40182 _keys!1118) (size!40183 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260563 () Bool)

(assert (=> b!1260563 (= e!717333 tp_is_empty!32283)))

(declare-fun b!1260564 () Bool)

(declare-fun res!840089 () Bool)

(assert (=> b!1260564 (=> (not res!840089) (not e!717329))))

(declare-datatypes ((List!28165 0))(
  ( (Nil!28162) (Cons!28161 (h!29370 (_ BitVec 64)) (t!41662 List!28165)) )
))
(declare-fun arrayNoDuplicates!0 (array!82184 (_ BitVec 32) List!28165) Bool)

(assert (=> b!1260564 (= res!840089 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28162))))

(declare-fun lt!571240 () ListLongMap!18839)

(declare-fun b!1260565 () Bool)

(assert (=> b!1260565 (= e!717330 (= lt!571238 (+!4238 lt!571240 lt!571245)))))

(declare-fun b!1260566 () Bool)

(assert (=> b!1260566 (= e!717329 (not e!717328))))

(declare-fun res!840091 () Bool)

(assert (=> b!1260566 (=> res!840091 e!717328)))

(assert (=> b!1260566 (= res!840091 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1260566 (= lt!571242 lt!571240)))

(declare-fun lt!571243 () Unit!42051)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1168 (array!82184 array!82186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48409 V!48409 V!48409 V!48409 (_ BitVec 32) Int) Unit!42051)

(assert (=> b!1260566 (= lt!571243 (lemmaNoChangeToArrayThenSameMapNoExtras!1168 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5804 (array!82184 array!82186 (_ BitVec 32) (_ BitVec 32) V!48409 V!48409 (_ BitVec 32) Int) ListLongMap!18839)

(assert (=> b!1260566 (= lt!571240 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260566 (= lt!571242 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50224 () Bool)

(assert (=> mapIsEmpty!50224 mapRes!50224))

(assert (= (and start!105818 res!840093) b!1260562))

(assert (= (and b!1260562 res!840095) b!1260557))

(assert (= (and b!1260557 res!840094) b!1260564))

(assert (= (and b!1260564 res!840089) b!1260566))

(assert (= (and b!1260566 (not res!840091)) b!1260561))

(assert (= (and b!1260561 res!840090) b!1260565))

(assert (= (and b!1260561 (not res!840092)) b!1260560))

(assert (= (and b!1260558 condMapEmpty!50224) mapIsEmpty!50224))

(assert (= (and b!1260558 (not condMapEmpty!50224)) mapNonEmpty!50224))

(get-info :version)

(assert (= (and mapNonEmpty!50224 ((_ is ValueCellFull!15378) mapValue!50224)) b!1260559))

(assert (= (and b!1260558 ((_ is ValueCellFull!15378) mapDefault!50224)) b!1260563))

(assert (= start!105818 b!1260558))

(declare-fun m!1161287 () Bool)

(assert (=> b!1260565 m!1161287))

(declare-fun m!1161289 () Bool)

(assert (=> mapNonEmpty!50224 m!1161289))

(declare-fun m!1161291 () Bool)

(assert (=> start!105818 m!1161291))

(declare-fun m!1161293 () Bool)

(assert (=> start!105818 m!1161293))

(declare-fun m!1161295 () Bool)

(assert (=> start!105818 m!1161295))

(declare-fun m!1161297 () Bool)

(assert (=> b!1260561 m!1161297))

(declare-fun m!1161299 () Bool)

(assert (=> b!1260561 m!1161299))

(declare-fun m!1161301 () Bool)

(assert (=> b!1260561 m!1161301))

(declare-fun m!1161303 () Bool)

(assert (=> b!1260561 m!1161303))

(declare-fun m!1161305 () Bool)

(assert (=> b!1260561 m!1161305))

(declare-fun m!1161307 () Bool)

(assert (=> b!1260561 m!1161307))

(declare-fun m!1161309 () Bool)

(assert (=> b!1260561 m!1161309))

(declare-fun m!1161311 () Bool)

(assert (=> b!1260564 m!1161311))

(declare-fun m!1161313 () Bool)

(assert (=> b!1260566 m!1161313))

(declare-fun m!1161315 () Bool)

(assert (=> b!1260566 m!1161315))

(declare-fun m!1161317 () Bool)

(assert (=> b!1260566 m!1161317))

(declare-fun m!1161319 () Bool)

(assert (=> b!1260557 m!1161319))

(check-sat tp_is_empty!32283 (not b!1260564) (not start!105818) (not b!1260557) b_and!45277 (not b_next!27381) (not b!1260565) (not b!1260561) (not b!1260566) (not mapNonEmpty!50224))
(check-sat b_and!45277 (not b_next!27381))
(get-model)

(declare-fun b!1260607 () Bool)

(declare-fun e!717367 () Bool)

(declare-fun e!717368 () Bool)

(assert (=> b!1260607 (= e!717367 e!717368)))

(declare-fun res!840125 () Bool)

(assert (=> b!1260607 (=> (not res!840125) (not e!717368))))

(declare-fun e!717370 () Bool)

(assert (=> b!1260607 (= res!840125 (not e!717370))))

(declare-fun res!840123 () Bool)

(assert (=> b!1260607 (=> (not res!840123) (not e!717370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1260607 (= res!840123 (validKeyInArray!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260608 () Bool)

(declare-fun contains!7576 (List!28165 (_ BitVec 64)) Bool)

(assert (=> b!1260608 (= e!717370 (contains!7576 Nil!28162 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61918 () Bool)

(declare-fun call!61921 () Bool)

(declare-fun c!122605 () Bool)

(assert (=> bm!61918 (= call!61921 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122605 (Cons!28161 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000) Nil!28162) Nil!28162)))))

(declare-fun d!138391 () Bool)

(declare-fun res!840124 () Bool)

(assert (=> d!138391 (=> res!840124 e!717367)))

(assert (=> d!138391 (= res!840124 (bvsge #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(assert (=> d!138391 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28162) e!717367)))

(declare-fun b!1260609 () Bool)

(declare-fun e!717369 () Bool)

(assert (=> b!1260609 (= e!717369 call!61921)))

(declare-fun b!1260610 () Bool)

(assert (=> b!1260610 (= e!717368 e!717369)))

(assert (=> b!1260610 (= c!122605 (validKeyInArray!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260611 () Bool)

(assert (=> b!1260611 (= e!717369 call!61921)))

(assert (= (and d!138391 (not res!840124)) b!1260607))

(assert (= (and b!1260607 res!840123) b!1260608))

(assert (= (and b!1260607 res!840125) b!1260610))

(assert (= (and b!1260610 c!122605) b!1260609))

(assert (= (and b!1260610 (not c!122605)) b!1260611))

(assert (= (or b!1260609 b!1260611) bm!61918))

(declare-fun m!1161355 () Bool)

(assert (=> b!1260607 m!1161355))

(assert (=> b!1260607 m!1161355))

(declare-fun m!1161357 () Bool)

(assert (=> b!1260607 m!1161357))

(assert (=> b!1260608 m!1161355))

(assert (=> b!1260608 m!1161355))

(declare-fun m!1161359 () Bool)

(assert (=> b!1260608 m!1161359))

(assert (=> bm!61918 m!1161355))

(declare-fun m!1161361 () Bool)

(assert (=> bm!61918 m!1161361))

(assert (=> b!1260610 m!1161355))

(assert (=> b!1260610 m!1161355))

(assert (=> b!1260610 m!1161357))

(assert (=> b!1260564 d!138391))

(declare-fun d!138393 () Bool)

(declare-fun e!717373 () Bool)

(assert (=> d!138393 e!717373))

(declare-fun res!840130 () Bool)

(assert (=> d!138393 (=> (not res!840130) (not e!717373))))

(declare-fun lt!571282 () ListLongMap!18839)

(declare-fun contains!7577 (ListLongMap!18839 (_ BitVec 64)) Bool)

(assert (=> d!138393 (= res!840130 (contains!7577 lt!571282 (_1!10494 lt!571245)))))

(declare-fun lt!571284 () List!28164)

(assert (=> d!138393 (= lt!571282 (ListLongMap!18840 lt!571284))))

(declare-fun lt!571283 () Unit!42051)

(declare-fun lt!571285 () Unit!42051)

(assert (=> d!138393 (= lt!571283 lt!571285)))

(declare-datatypes ((Option!710 0))(
  ( (Some!709 (v!18909 V!48409)) (None!708) )
))
(declare-fun getValueByKey!659 (List!28164 (_ BitVec 64)) Option!710)

(assert (=> d!138393 (= (getValueByKey!659 lt!571284 (_1!10494 lt!571245)) (Some!709 (_2!10494 lt!571245)))))

(declare-fun lemmaContainsTupThenGetReturnValue!332 (List!28164 (_ BitVec 64) V!48409) Unit!42051)

(assert (=> d!138393 (= lt!571285 (lemmaContainsTupThenGetReturnValue!332 lt!571284 (_1!10494 lt!571245) (_2!10494 lt!571245)))))

(declare-fun insertStrictlySorted!446 (List!28164 (_ BitVec 64) V!48409) List!28164)

(assert (=> d!138393 (= lt!571284 (insertStrictlySorted!446 (toList!9435 lt!571240) (_1!10494 lt!571245) (_2!10494 lt!571245)))))

(assert (=> d!138393 (= (+!4238 lt!571240 lt!571245) lt!571282)))

(declare-fun b!1260616 () Bool)

(declare-fun res!840131 () Bool)

(assert (=> b!1260616 (=> (not res!840131) (not e!717373))))

(assert (=> b!1260616 (= res!840131 (= (getValueByKey!659 (toList!9435 lt!571282) (_1!10494 lt!571245)) (Some!709 (_2!10494 lt!571245))))))

(declare-fun b!1260617 () Bool)

(declare-fun contains!7578 (List!28164 tuple2!20966) Bool)

(assert (=> b!1260617 (= e!717373 (contains!7578 (toList!9435 lt!571282) lt!571245))))

(assert (= (and d!138393 res!840130) b!1260616))

(assert (= (and b!1260616 res!840131) b!1260617))

(declare-fun m!1161363 () Bool)

(assert (=> d!138393 m!1161363))

(declare-fun m!1161365 () Bool)

(assert (=> d!138393 m!1161365))

(declare-fun m!1161367 () Bool)

(assert (=> d!138393 m!1161367))

(declare-fun m!1161369 () Bool)

(assert (=> d!138393 m!1161369))

(declare-fun m!1161371 () Bool)

(assert (=> b!1260616 m!1161371))

(declare-fun m!1161373 () Bool)

(assert (=> b!1260617 m!1161373))

(assert (=> b!1260565 d!138393))

(declare-fun b!1260626 () Bool)

(declare-fun e!717381 () Bool)

(declare-fun e!717380 () Bool)

(assert (=> b!1260626 (= e!717381 e!717380)))

(declare-fun lt!571294 () (_ BitVec 64))

(assert (=> b!1260626 (= lt!571294 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571292 () Unit!42051)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82184 (_ BitVec 64) (_ BitVec 32)) Unit!42051)

(assert (=> b!1260626 (= lt!571292 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!571294 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1260626 (arrayContainsKey!0 _keys!1118 lt!571294 #b00000000000000000000000000000000)))

(declare-fun lt!571293 () Unit!42051)

(assert (=> b!1260626 (= lt!571293 lt!571292)))

(declare-fun res!840137 () Bool)

(declare-datatypes ((SeekEntryResult!9971 0))(
  ( (MissingZero!9971 (index!42255 (_ BitVec 32))) (Found!9971 (index!42256 (_ BitVec 32))) (Intermediate!9971 (undefined!10783 Bool) (index!42257 (_ BitVec 32)) (x!111061 (_ BitVec 32))) (Undefined!9971) (MissingVacant!9971 (index!42258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82184 (_ BitVec 32)) SeekEntryResult!9971)

(assert (=> b!1260626 (= res!840137 (= (seekEntryOrOpen!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9971 #b00000000000000000000000000000000)))))

(assert (=> b!1260626 (=> (not res!840137) (not e!717380))))

(declare-fun bm!61921 () Bool)

(declare-fun call!61924 () Bool)

(assert (=> bm!61921 (= call!61924 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1260628 () Bool)

(assert (=> b!1260628 (= e!717380 call!61924)))

(declare-fun b!1260629 () Bool)

(assert (=> b!1260629 (= e!717381 call!61924)))

(declare-fun d!138395 () Bool)

(declare-fun res!840136 () Bool)

(declare-fun e!717382 () Bool)

(assert (=> d!138395 (=> res!840136 e!717382)))

(assert (=> d!138395 (= res!840136 (bvsge #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(assert (=> d!138395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!717382)))

(declare-fun b!1260627 () Bool)

(assert (=> b!1260627 (= e!717382 e!717381)))

(declare-fun c!122608 () Bool)

(assert (=> b!1260627 (= c!122608 (validKeyInArray!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138395 (not res!840136)) b!1260627))

(assert (= (and b!1260627 c!122608) b!1260626))

(assert (= (and b!1260627 (not c!122608)) b!1260629))

(assert (= (and b!1260626 res!840137) b!1260628))

(assert (= (or b!1260628 b!1260629) bm!61921))

(assert (=> b!1260626 m!1161355))

(declare-fun m!1161375 () Bool)

(assert (=> b!1260626 m!1161375))

(declare-fun m!1161377 () Bool)

(assert (=> b!1260626 m!1161377))

(assert (=> b!1260626 m!1161355))

(declare-fun m!1161379 () Bool)

(assert (=> b!1260626 m!1161379))

(declare-fun m!1161381 () Bool)

(assert (=> bm!61921 m!1161381))

(assert (=> b!1260627 m!1161355))

(assert (=> b!1260627 m!1161355))

(assert (=> b!1260627 m!1161357))

(assert (=> b!1260557 d!138395))

(declare-fun d!138397 () Bool)

(assert (=> d!138397 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105818 d!138397))

(declare-fun d!138399 () Bool)

(assert (=> d!138399 (= (array_inv!30181 _keys!1118) (bvsge (size!40182 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105818 d!138399))

(declare-fun d!138401 () Bool)

(assert (=> d!138401 (= (array_inv!30182 _values!914) (bvsge (size!40183 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105818 d!138401))

(declare-fun d!138403 () Bool)

(declare-fun e!717383 () Bool)

(assert (=> d!138403 e!717383))

(declare-fun res!840138 () Bool)

(assert (=> d!138403 (=> (not res!840138) (not e!717383))))

(declare-fun lt!571295 () ListLongMap!18839)

(assert (=> d!138403 (= res!840138 (contains!7577 lt!571295 (_1!10494 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!571297 () List!28164)

(assert (=> d!138403 (= lt!571295 (ListLongMap!18840 lt!571297))))

(declare-fun lt!571296 () Unit!42051)

(declare-fun lt!571298 () Unit!42051)

(assert (=> d!138403 (= lt!571296 lt!571298)))

(assert (=> d!138403 (= (getValueByKey!659 lt!571297 (_1!10494 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!709 (_2!10494 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138403 (= lt!571298 (lemmaContainsTupThenGetReturnValue!332 lt!571297 (_1!10494 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10494 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138403 (= lt!571297 (insertStrictlySorted!446 (toList!9435 lt!571239) (_1!10494 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10494 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138403 (= (+!4238 lt!571239 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!571295)))

(declare-fun b!1260630 () Bool)

(declare-fun res!840139 () Bool)

(assert (=> b!1260630 (=> (not res!840139) (not e!717383))))

(assert (=> b!1260630 (= res!840139 (= (getValueByKey!659 (toList!9435 lt!571295) (_1!10494 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!709 (_2!10494 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1260631 () Bool)

(assert (=> b!1260631 (= e!717383 (contains!7578 (toList!9435 lt!571295) (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138403 res!840138) b!1260630))

(assert (= (and b!1260630 res!840139) b!1260631))

(declare-fun m!1161383 () Bool)

(assert (=> d!138403 m!1161383))

(declare-fun m!1161385 () Bool)

(assert (=> d!138403 m!1161385))

(declare-fun m!1161387 () Bool)

(assert (=> d!138403 m!1161387))

(declare-fun m!1161389 () Bool)

(assert (=> d!138403 m!1161389))

(declare-fun m!1161391 () Bool)

(assert (=> b!1260630 m!1161391))

(declare-fun m!1161393 () Bool)

(assert (=> b!1260631 m!1161393))

(assert (=> b!1260561 d!138403))

(declare-fun d!138405 () Bool)

(assert (=> d!138405 (= (-!2138 (+!4238 lt!571239 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!571239)))

(declare-fun lt!571301 () Unit!42051)

(declare-fun choose!1866 (ListLongMap!18839 (_ BitVec 64) V!48409) Unit!42051)

(assert (=> d!138405 (= lt!571301 (choose!1866 lt!571239 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!138405 (not (contains!7577 lt!571239 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138405 (= (addThenRemoveForNewKeyIsSame!375 lt!571239 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!571301)))

(declare-fun bs!35669 () Bool)

(assert (= bs!35669 d!138405))

(assert (=> bs!35669 m!1161299))

(assert (=> bs!35669 m!1161299))

(declare-fun m!1161395 () Bool)

(assert (=> bs!35669 m!1161395))

(declare-fun m!1161397 () Bool)

(assert (=> bs!35669 m!1161397))

(declare-fun m!1161399 () Bool)

(assert (=> bs!35669 m!1161399))

(assert (=> b!1260561 d!138405))

(declare-fun d!138407 () Bool)

(declare-fun lt!571304 () ListLongMap!18839)

(assert (=> d!138407 (not (contains!7577 lt!571304 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!143 (List!28164 (_ BitVec 64)) List!28164)

(assert (=> d!138407 (= lt!571304 (ListLongMap!18840 (removeStrictlySorted!143 (toList!9435 lt!571244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138407 (= (-!2138 lt!571244 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571304)))

(declare-fun bs!35670 () Bool)

(assert (= bs!35670 d!138407))

(declare-fun m!1161401 () Bool)

(assert (=> bs!35670 m!1161401))

(declare-fun m!1161403 () Bool)

(assert (=> bs!35670 m!1161403))

(assert (=> b!1260561 d!138407))

(declare-fun b!1260674 () Bool)

(declare-fun e!717411 () Bool)

(declare-fun call!61943 () Bool)

(assert (=> b!1260674 (= e!717411 (not call!61943))))

(declare-fun b!1260675 () Bool)

(declare-fun e!717420 () ListLongMap!18839)

(declare-fun e!717415 () ListLongMap!18839)

(assert (=> b!1260675 (= e!717420 e!717415)))

(declare-fun c!122624 () Bool)

(assert (=> b!1260675 (= c!122624 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61936 () Bool)

(declare-fun lt!571362 () ListLongMap!18839)

(assert (=> bm!61936 (= call!61943 (contains!7577 lt!571362 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1260676 () Bool)

(declare-fun res!840165 () Bool)

(declare-fun e!717413 () Bool)

(assert (=> b!1260676 (=> (not res!840165) (not e!717413))))

(assert (=> b!1260676 (= res!840165 e!717411)))

(declare-fun c!122621 () Bool)

(assert (=> b!1260676 (= c!122621 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1260678 () Bool)

(declare-fun e!717419 () Bool)

(declare-fun call!61945 () Bool)

(assert (=> b!1260678 (= e!717419 (not call!61945))))

(declare-fun b!1260679 () Bool)

(declare-fun e!717422 () Bool)

(assert (=> b!1260679 (= e!717411 e!717422)))

(declare-fun res!840160 () Bool)

(assert (=> b!1260679 (= res!840160 call!61943)))

(assert (=> b!1260679 (=> (not res!840160) (not e!717422))))

(declare-fun bm!61937 () Bool)

(declare-fun call!61941 () ListLongMap!18839)

(declare-fun call!61940 () ListLongMap!18839)

(assert (=> bm!61937 (= call!61941 call!61940)))

(declare-fun b!1260680 () Bool)

(declare-fun call!61944 () ListLongMap!18839)

(assert (=> b!1260680 (= e!717420 (+!4238 call!61944 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1260681 () Bool)

(declare-fun e!717418 () Bool)

(assert (=> b!1260681 (= e!717418 (validKeyInArray!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61938 () Bool)

(declare-fun call!61942 () ListLongMap!18839)

(assert (=> bm!61938 (= call!61942 call!61944)))

(declare-fun b!1260682 () Bool)

(declare-fun c!122623 () Bool)

(assert (=> b!1260682 (= c!122623 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!717414 () ListLongMap!18839)

(assert (=> b!1260682 (= e!717415 e!717414)))

(declare-fun e!717421 () Bool)

(declare-fun b!1260683 () Bool)

(declare-fun apply!993 (ListLongMap!18839 (_ BitVec 64)) V!48409)

(declare-fun get!20238 (ValueCell!15378 V!48409) V!48409)

(declare-fun dynLambda!3391 (Int (_ BitVec 64)) V!48409)

(assert (=> b!1260683 (= e!717421 (= (apply!993 lt!571362 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)) (get!20238 (select (arr!39647 _values!914) #b00000000000000000000000000000000) (dynLambda!3391 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1260683 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40183 _values!914)))))

(assert (=> b!1260683 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun b!1260684 () Bool)

(declare-fun res!840163 () Bool)

(assert (=> b!1260684 (=> (not res!840163) (not e!717413))))

(declare-fun e!717416 () Bool)

(assert (=> b!1260684 (= res!840163 e!717416)))

(declare-fun res!840161 () Bool)

(assert (=> b!1260684 (=> res!840161 e!717416)))

(assert (=> b!1260684 (= res!840161 (not e!717418))))

(declare-fun res!840159 () Bool)

(assert (=> b!1260684 (=> (not res!840159) (not e!717418))))

(assert (=> b!1260684 (= res!840159 (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun b!1260685 () Bool)

(assert (=> b!1260685 (= e!717414 call!61941)))

(declare-fun b!1260686 () Bool)

(declare-fun e!717417 () Bool)

(assert (=> b!1260686 (= e!717419 e!717417)))

(declare-fun res!840164 () Bool)

(assert (=> b!1260686 (= res!840164 call!61945)))

(assert (=> b!1260686 (=> (not res!840164) (not e!717417))))

(declare-fun b!1260677 () Bool)

(declare-fun e!717412 () Bool)

(assert (=> b!1260677 (= e!717412 (validKeyInArray!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138409 () Bool)

(assert (=> d!138409 e!717413))

(declare-fun res!840158 () Bool)

(assert (=> d!138409 (=> (not res!840158) (not e!717413))))

(assert (=> d!138409 (= res!840158 (or (bvsge #b00000000000000000000000000000000 (size!40182 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))))

(declare-fun lt!571365 () ListLongMap!18839)

(assert (=> d!138409 (= lt!571362 lt!571365)))

(declare-fun lt!571352 () Unit!42051)

(declare-fun e!717410 () Unit!42051)

(assert (=> d!138409 (= lt!571352 e!717410)))

(declare-fun c!122625 () Bool)

(assert (=> d!138409 (= c!122625 e!717412)))

(declare-fun res!840162 () Bool)

(assert (=> d!138409 (=> (not res!840162) (not e!717412))))

(assert (=> d!138409 (= res!840162 (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(assert (=> d!138409 (= lt!571365 e!717420)))

(declare-fun c!122622 () Bool)

(assert (=> d!138409 (= c!122622 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138409 (validMask!0 mask!1466)))

(assert (=> d!138409 (= (getCurrentListMap!4629 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571362)))

(declare-fun call!61939 () ListLongMap!18839)

(declare-fun bm!61939 () Bool)

(assert (=> bm!61939 (= call!61939 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260687 () Bool)

(assert (=> b!1260687 (= e!717413 e!717419)))

(declare-fun c!122626 () Bool)

(assert (=> b!1260687 (= c!122626 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61940 () Bool)

(assert (=> bm!61940 (= call!61940 call!61939)))

(declare-fun b!1260688 () Bool)

(assert (=> b!1260688 (= e!717417 (= (apply!993 lt!571362 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun bm!61941 () Bool)

(assert (=> bm!61941 (= call!61944 (+!4238 (ite c!122622 call!61939 (ite c!122624 call!61940 call!61941)) (ite (or c!122622 c!122624) (tuple2!20967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1260689 () Bool)

(declare-fun lt!571349 () Unit!42051)

(assert (=> b!1260689 (= e!717410 lt!571349)))

(declare-fun lt!571367 () ListLongMap!18839)

(assert (=> b!1260689 (= lt!571367 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571350 () (_ BitVec 64))

(assert (=> b!1260689 (= lt!571350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571363 () (_ BitVec 64))

(assert (=> b!1260689 (= lt!571363 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571368 () Unit!42051)

(declare-fun addStillContains!1084 (ListLongMap!18839 (_ BitVec 64) V!48409 (_ BitVec 64)) Unit!42051)

(assert (=> b!1260689 (= lt!571368 (addStillContains!1084 lt!571367 lt!571350 zeroValue!871 lt!571363))))

(assert (=> b!1260689 (contains!7577 (+!4238 lt!571367 (tuple2!20967 lt!571350 zeroValue!871)) lt!571363)))

(declare-fun lt!571369 () Unit!42051)

(assert (=> b!1260689 (= lt!571369 lt!571368)))

(declare-fun lt!571351 () ListLongMap!18839)

(assert (=> b!1260689 (= lt!571351 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571358 () (_ BitVec 64))

(assert (=> b!1260689 (= lt!571358 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571357 () (_ BitVec 64))

(assert (=> b!1260689 (= lt!571357 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571366 () Unit!42051)

(declare-fun addApplyDifferent!538 (ListLongMap!18839 (_ BitVec 64) V!48409 (_ BitVec 64)) Unit!42051)

(assert (=> b!1260689 (= lt!571366 (addApplyDifferent!538 lt!571351 lt!571358 minValueAfter!43 lt!571357))))

(assert (=> b!1260689 (= (apply!993 (+!4238 lt!571351 (tuple2!20967 lt!571358 minValueAfter!43)) lt!571357) (apply!993 lt!571351 lt!571357))))

(declare-fun lt!571355 () Unit!42051)

(assert (=> b!1260689 (= lt!571355 lt!571366)))

(declare-fun lt!571356 () ListLongMap!18839)

(assert (=> b!1260689 (= lt!571356 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571359 () (_ BitVec 64))

(assert (=> b!1260689 (= lt!571359 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571360 () (_ BitVec 64))

(assert (=> b!1260689 (= lt!571360 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571354 () Unit!42051)

(assert (=> b!1260689 (= lt!571354 (addApplyDifferent!538 lt!571356 lt!571359 zeroValue!871 lt!571360))))

(assert (=> b!1260689 (= (apply!993 (+!4238 lt!571356 (tuple2!20967 lt!571359 zeroValue!871)) lt!571360) (apply!993 lt!571356 lt!571360))))

(declare-fun lt!571353 () Unit!42051)

(assert (=> b!1260689 (= lt!571353 lt!571354)))

(declare-fun lt!571361 () ListLongMap!18839)

(assert (=> b!1260689 (= lt!571361 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571370 () (_ BitVec 64))

(assert (=> b!1260689 (= lt!571370 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571364 () (_ BitVec 64))

(assert (=> b!1260689 (= lt!571364 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1260689 (= lt!571349 (addApplyDifferent!538 lt!571361 lt!571370 minValueAfter!43 lt!571364))))

(assert (=> b!1260689 (= (apply!993 (+!4238 lt!571361 (tuple2!20967 lt!571370 minValueAfter!43)) lt!571364) (apply!993 lt!571361 lt!571364))))

(declare-fun b!1260690 () Bool)

(assert (=> b!1260690 (= e!717416 e!717421)))

(declare-fun res!840166 () Bool)

(assert (=> b!1260690 (=> (not res!840166) (not e!717421))))

(assert (=> b!1260690 (= res!840166 (contains!7577 lt!571362 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun b!1260691 () Bool)

(assert (=> b!1260691 (= e!717414 call!61942)))

(declare-fun b!1260692 () Bool)

(assert (=> b!1260692 (= e!717415 call!61942)))

(declare-fun b!1260693 () Bool)

(declare-fun Unit!42055 () Unit!42051)

(assert (=> b!1260693 (= e!717410 Unit!42055)))

(declare-fun bm!61942 () Bool)

(assert (=> bm!61942 (= call!61945 (contains!7577 lt!571362 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1260694 () Bool)

(assert (=> b!1260694 (= e!717422 (= (apply!993 lt!571362 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(assert (= (and d!138409 c!122622) b!1260680))

(assert (= (and d!138409 (not c!122622)) b!1260675))

(assert (= (and b!1260675 c!122624) b!1260692))

(assert (= (and b!1260675 (not c!122624)) b!1260682))

(assert (= (and b!1260682 c!122623) b!1260691))

(assert (= (and b!1260682 (not c!122623)) b!1260685))

(assert (= (or b!1260691 b!1260685) bm!61937))

(assert (= (or b!1260692 bm!61937) bm!61940))

(assert (= (or b!1260692 b!1260691) bm!61938))

(assert (= (or b!1260680 bm!61940) bm!61939))

(assert (= (or b!1260680 bm!61938) bm!61941))

(assert (= (and d!138409 res!840162) b!1260677))

(assert (= (and d!138409 c!122625) b!1260689))

(assert (= (and d!138409 (not c!122625)) b!1260693))

(assert (= (and d!138409 res!840158) b!1260684))

(assert (= (and b!1260684 res!840159) b!1260681))

(assert (= (and b!1260684 (not res!840161)) b!1260690))

(assert (= (and b!1260690 res!840166) b!1260683))

(assert (= (and b!1260684 res!840163) b!1260676))

(assert (= (and b!1260676 c!122621) b!1260679))

(assert (= (and b!1260676 (not c!122621)) b!1260674))

(assert (= (and b!1260679 res!840160) b!1260694))

(assert (= (or b!1260679 b!1260674) bm!61936))

(assert (= (and b!1260676 res!840165) b!1260687))

(assert (= (and b!1260687 c!122626) b!1260686))

(assert (= (and b!1260687 (not c!122626)) b!1260678))

(assert (= (and b!1260686 res!840164) b!1260688))

(assert (= (or b!1260686 b!1260678) bm!61942))

(declare-fun b_lambda!22767 () Bool)

(assert (=> (not b_lambda!22767) (not b!1260683)))

(declare-fun t!41666 () Bool)

(declare-fun tb!11313 () Bool)

(assert (=> (and start!105818 (= defaultEntry!922 defaultEntry!922) t!41666) tb!11313))

(declare-fun result!23347 () Bool)

(assert (=> tb!11313 (= result!23347 tp_is_empty!32283)))

(assert (=> b!1260683 t!41666))

(declare-fun b_and!45281 () Bool)

(assert (= b_and!45277 (and (=> t!41666 result!23347) b_and!45281)))

(assert (=> b!1260690 m!1161355))

(assert (=> b!1260690 m!1161355))

(declare-fun m!1161405 () Bool)

(assert (=> b!1260690 m!1161405))

(declare-fun m!1161407 () Bool)

(assert (=> b!1260688 m!1161407))

(assert (=> b!1260677 m!1161355))

(assert (=> b!1260677 m!1161355))

(assert (=> b!1260677 m!1161357))

(declare-fun m!1161409 () Bool)

(assert (=> bm!61941 m!1161409))

(declare-fun m!1161411 () Bool)

(assert (=> b!1260694 m!1161411))

(assert (=> b!1260683 m!1161355))

(assert (=> b!1260683 m!1161355))

(declare-fun m!1161413 () Bool)

(assert (=> b!1260683 m!1161413))

(declare-fun m!1161415 () Bool)

(assert (=> b!1260683 m!1161415))

(declare-fun m!1161417 () Bool)

(assert (=> b!1260683 m!1161417))

(declare-fun m!1161419 () Bool)

(assert (=> b!1260683 m!1161419))

(assert (=> b!1260683 m!1161417))

(assert (=> b!1260683 m!1161415))

(assert (=> bm!61939 m!1161315))

(assert (=> b!1260681 m!1161355))

(assert (=> b!1260681 m!1161355))

(assert (=> b!1260681 m!1161357))

(declare-fun m!1161421 () Bool)

(assert (=> bm!61936 m!1161421))

(declare-fun m!1161423 () Bool)

(assert (=> bm!61942 m!1161423))

(declare-fun m!1161425 () Bool)

(assert (=> b!1260680 m!1161425))

(declare-fun m!1161427 () Bool)

(assert (=> b!1260689 m!1161427))

(declare-fun m!1161429 () Bool)

(assert (=> b!1260689 m!1161429))

(declare-fun m!1161431 () Bool)

(assert (=> b!1260689 m!1161431))

(assert (=> b!1260689 m!1161429))

(declare-fun m!1161433 () Bool)

(assert (=> b!1260689 m!1161433))

(declare-fun m!1161435 () Bool)

(assert (=> b!1260689 m!1161435))

(declare-fun m!1161437 () Bool)

(assert (=> b!1260689 m!1161437))

(declare-fun m!1161439 () Bool)

(assert (=> b!1260689 m!1161439))

(declare-fun m!1161441 () Bool)

(assert (=> b!1260689 m!1161441))

(declare-fun m!1161443 () Bool)

(assert (=> b!1260689 m!1161443))

(declare-fun m!1161445 () Bool)

(assert (=> b!1260689 m!1161445))

(declare-fun m!1161447 () Bool)

(assert (=> b!1260689 m!1161447))

(declare-fun m!1161449 () Bool)

(assert (=> b!1260689 m!1161449))

(assert (=> b!1260689 m!1161355))

(declare-fun m!1161451 () Bool)

(assert (=> b!1260689 m!1161451))

(declare-fun m!1161453 () Bool)

(assert (=> b!1260689 m!1161453))

(assert (=> b!1260689 m!1161435))

(assert (=> b!1260689 m!1161439))

(assert (=> b!1260689 m!1161315))

(assert (=> b!1260689 m!1161451))

(declare-fun m!1161455 () Bool)

(assert (=> b!1260689 m!1161455))

(assert (=> d!138409 m!1161291))

(assert (=> b!1260561 d!138409))

(declare-fun d!138411 () Bool)

(declare-fun lt!571371 () ListLongMap!18839)

(assert (=> d!138411 (not (contains!7577 lt!571371 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138411 (= lt!571371 (ListLongMap!18840 (removeStrictlySorted!143 (toList!9435 lt!571241) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138411 (= (-!2138 lt!571241 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571371)))

(declare-fun bs!35671 () Bool)

(assert (= bs!35671 d!138411))

(declare-fun m!1161457 () Bool)

(assert (=> bs!35671 m!1161457))

(declare-fun m!1161459 () Bool)

(assert (=> bs!35671 m!1161459))

(assert (=> b!1260561 d!138411))

(declare-fun b!1260697 () Bool)

(declare-fun e!717424 () Bool)

(declare-fun call!61950 () Bool)

(assert (=> b!1260697 (= e!717424 (not call!61950))))

(declare-fun b!1260698 () Bool)

(declare-fun e!717433 () ListLongMap!18839)

(declare-fun e!717428 () ListLongMap!18839)

(assert (=> b!1260698 (= e!717433 e!717428)))

(declare-fun c!122630 () Bool)

(assert (=> b!1260698 (= c!122630 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61943 () Bool)

(declare-fun lt!571385 () ListLongMap!18839)

(assert (=> bm!61943 (= call!61950 (contains!7577 lt!571385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1260699 () Bool)

(declare-fun res!840174 () Bool)

(declare-fun e!717426 () Bool)

(assert (=> b!1260699 (=> (not res!840174) (not e!717426))))

(assert (=> b!1260699 (= res!840174 e!717424)))

(declare-fun c!122627 () Bool)

(assert (=> b!1260699 (= c!122627 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1260701 () Bool)

(declare-fun e!717432 () Bool)

(declare-fun call!61952 () Bool)

(assert (=> b!1260701 (= e!717432 (not call!61952))))

(declare-fun b!1260702 () Bool)

(declare-fun e!717435 () Bool)

(assert (=> b!1260702 (= e!717424 e!717435)))

(declare-fun res!840169 () Bool)

(assert (=> b!1260702 (= res!840169 call!61950)))

(assert (=> b!1260702 (=> (not res!840169) (not e!717435))))

(declare-fun bm!61944 () Bool)

(declare-fun call!61948 () ListLongMap!18839)

(declare-fun call!61947 () ListLongMap!18839)

(assert (=> bm!61944 (= call!61948 call!61947)))

(declare-fun b!1260703 () Bool)

(declare-fun call!61951 () ListLongMap!18839)

(assert (=> b!1260703 (= e!717433 (+!4238 call!61951 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1260704 () Bool)

(declare-fun e!717431 () Bool)

(assert (=> b!1260704 (= e!717431 (validKeyInArray!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61945 () Bool)

(declare-fun call!61949 () ListLongMap!18839)

(assert (=> bm!61945 (= call!61949 call!61951)))

(declare-fun b!1260705 () Bool)

(declare-fun c!122629 () Bool)

(assert (=> b!1260705 (= c!122629 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!717427 () ListLongMap!18839)

(assert (=> b!1260705 (= e!717428 e!717427)))

(declare-fun e!717434 () Bool)

(declare-fun b!1260706 () Bool)

(assert (=> b!1260706 (= e!717434 (= (apply!993 lt!571385 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)) (get!20238 (select (arr!39647 _values!914) #b00000000000000000000000000000000) (dynLambda!3391 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1260706 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40183 _values!914)))))

(assert (=> b!1260706 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun b!1260707 () Bool)

(declare-fun res!840172 () Bool)

(assert (=> b!1260707 (=> (not res!840172) (not e!717426))))

(declare-fun e!717429 () Bool)

(assert (=> b!1260707 (= res!840172 e!717429)))

(declare-fun res!840170 () Bool)

(assert (=> b!1260707 (=> res!840170 e!717429)))

(assert (=> b!1260707 (= res!840170 (not e!717431))))

(declare-fun res!840168 () Bool)

(assert (=> b!1260707 (=> (not res!840168) (not e!717431))))

(assert (=> b!1260707 (= res!840168 (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun b!1260708 () Bool)

(assert (=> b!1260708 (= e!717427 call!61948)))

(declare-fun b!1260709 () Bool)

(declare-fun e!717430 () Bool)

(assert (=> b!1260709 (= e!717432 e!717430)))

(declare-fun res!840173 () Bool)

(assert (=> b!1260709 (= res!840173 call!61952)))

(assert (=> b!1260709 (=> (not res!840173) (not e!717430))))

(declare-fun b!1260700 () Bool)

(declare-fun e!717425 () Bool)

(assert (=> b!1260700 (= e!717425 (validKeyInArray!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138413 () Bool)

(assert (=> d!138413 e!717426))

(declare-fun res!840167 () Bool)

(assert (=> d!138413 (=> (not res!840167) (not e!717426))))

(assert (=> d!138413 (= res!840167 (or (bvsge #b00000000000000000000000000000000 (size!40182 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))))

(declare-fun lt!571388 () ListLongMap!18839)

(assert (=> d!138413 (= lt!571385 lt!571388)))

(declare-fun lt!571375 () Unit!42051)

(declare-fun e!717423 () Unit!42051)

(assert (=> d!138413 (= lt!571375 e!717423)))

(declare-fun c!122631 () Bool)

(assert (=> d!138413 (= c!122631 e!717425)))

(declare-fun res!840171 () Bool)

(assert (=> d!138413 (=> (not res!840171) (not e!717425))))

(assert (=> d!138413 (= res!840171 (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(assert (=> d!138413 (= lt!571388 e!717433)))

(declare-fun c!122628 () Bool)

(assert (=> d!138413 (= c!122628 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138413 (validMask!0 mask!1466)))

(assert (=> d!138413 (= (getCurrentListMap!4629 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571385)))

(declare-fun bm!61946 () Bool)

(declare-fun call!61946 () ListLongMap!18839)

(assert (=> bm!61946 (= call!61946 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260710 () Bool)

(assert (=> b!1260710 (= e!717426 e!717432)))

(declare-fun c!122632 () Bool)

(assert (=> b!1260710 (= c!122632 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61947 () Bool)

(assert (=> bm!61947 (= call!61947 call!61946)))

(declare-fun b!1260711 () Bool)

(assert (=> b!1260711 (= e!717430 (= (apply!993 lt!571385 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!61948 () Bool)

(assert (=> bm!61948 (= call!61951 (+!4238 (ite c!122628 call!61946 (ite c!122630 call!61947 call!61948)) (ite (or c!122628 c!122630) (tuple2!20967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1260712 () Bool)

(declare-fun lt!571372 () Unit!42051)

(assert (=> b!1260712 (= e!717423 lt!571372)))

(declare-fun lt!571390 () ListLongMap!18839)

(assert (=> b!1260712 (= lt!571390 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571373 () (_ BitVec 64))

(assert (=> b!1260712 (= lt!571373 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571386 () (_ BitVec 64))

(assert (=> b!1260712 (= lt!571386 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571391 () Unit!42051)

(assert (=> b!1260712 (= lt!571391 (addStillContains!1084 lt!571390 lt!571373 zeroValue!871 lt!571386))))

(assert (=> b!1260712 (contains!7577 (+!4238 lt!571390 (tuple2!20967 lt!571373 zeroValue!871)) lt!571386)))

(declare-fun lt!571392 () Unit!42051)

(assert (=> b!1260712 (= lt!571392 lt!571391)))

(declare-fun lt!571374 () ListLongMap!18839)

(assert (=> b!1260712 (= lt!571374 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571381 () (_ BitVec 64))

(assert (=> b!1260712 (= lt!571381 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571380 () (_ BitVec 64))

(assert (=> b!1260712 (= lt!571380 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571389 () Unit!42051)

(assert (=> b!1260712 (= lt!571389 (addApplyDifferent!538 lt!571374 lt!571381 minValueBefore!43 lt!571380))))

(assert (=> b!1260712 (= (apply!993 (+!4238 lt!571374 (tuple2!20967 lt!571381 minValueBefore!43)) lt!571380) (apply!993 lt!571374 lt!571380))))

(declare-fun lt!571378 () Unit!42051)

(assert (=> b!1260712 (= lt!571378 lt!571389)))

(declare-fun lt!571379 () ListLongMap!18839)

(assert (=> b!1260712 (= lt!571379 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571382 () (_ BitVec 64))

(assert (=> b!1260712 (= lt!571382 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571383 () (_ BitVec 64))

(assert (=> b!1260712 (= lt!571383 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571377 () Unit!42051)

(assert (=> b!1260712 (= lt!571377 (addApplyDifferent!538 lt!571379 lt!571382 zeroValue!871 lt!571383))))

(assert (=> b!1260712 (= (apply!993 (+!4238 lt!571379 (tuple2!20967 lt!571382 zeroValue!871)) lt!571383) (apply!993 lt!571379 lt!571383))))

(declare-fun lt!571376 () Unit!42051)

(assert (=> b!1260712 (= lt!571376 lt!571377)))

(declare-fun lt!571384 () ListLongMap!18839)

(assert (=> b!1260712 (= lt!571384 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571393 () (_ BitVec 64))

(assert (=> b!1260712 (= lt!571393 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571387 () (_ BitVec 64))

(assert (=> b!1260712 (= lt!571387 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1260712 (= lt!571372 (addApplyDifferent!538 lt!571384 lt!571393 minValueBefore!43 lt!571387))))

(assert (=> b!1260712 (= (apply!993 (+!4238 lt!571384 (tuple2!20967 lt!571393 minValueBefore!43)) lt!571387) (apply!993 lt!571384 lt!571387))))

(declare-fun b!1260713 () Bool)

(assert (=> b!1260713 (= e!717429 e!717434)))

(declare-fun res!840175 () Bool)

(assert (=> b!1260713 (=> (not res!840175) (not e!717434))))

(assert (=> b!1260713 (= res!840175 (contains!7577 lt!571385 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260713 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun b!1260714 () Bool)

(assert (=> b!1260714 (= e!717427 call!61949)))

(declare-fun b!1260715 () Bool)

(assert (=> b!1260715 (= e!717428 call!61949)))

(declare-fun b!1260716 () Bool)

(declare-fun Unit!42056 () Unit!42051)

(assert (=> b!1260716 (= e!717423 Unit!42056)))

(declare-fun bm!61949 () Bool)

(assert (=> bm!61949 (= call!61952 (contains!7577 lt!571385 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1260717 () Bool)

(assert (=> b!1260717 (= e!717435 (= (apply!993 lt!571385 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(assert (= (and d!138413 c!122628) b!1260703))

(assert (= (and d!138413 (not c!122628)) b!1260698))

(assert (= (and b!1260698 c!122630) b!1260715))

(assert (= (and b!1260698 (not c!122630)) b!1260705))

(assert (= (and b!1260705 c!122629) b!1260714))

(assert (= (and b!1260705 (not c!122629)) b!1260708))

(assert (= (or b!1260714 b!1260708) bm!61944))

(assert (= (or b!1260715 bm!61944) bm!61947))

(assert (= (or b!1260715 b!1260714) bm!61945))

(assert (= (or b!1260703 bm!61947) bm!61946))

(assert (= (or b!1260703 bm!61945) bm!61948))

(assert (= (and d!138413 res!840171) b!1260700))

(assert (= (and d!138413 c!122631) b!1260712))

(assert (= (and d!138413 (not c!122631)) b!1260716))

(assert (= (and d!138413 res!840167) b!1260707))

(assert (= (and b!1260707 res!840168) b!1260704))

(assert (= (and b!1260707 (not res!840170)) b!1260713))

(assert (= (and b!1260713 res!840175) b!1260706))

(assert (= (and b!1260707 res!840172) b!1260699))

(assert (= (and b!1260699 c!122627) b!1260702))

(assert (= (and b!1260699 (not c!122627)) b!1260697))

(assert (= (and b!1260702 res!840169) b!1260717))

(assert (= (or b!1260702 b!1260697) bm!61943))

(assert (= (and b!1260699 res!840174) b!1260710))

(assert (= (and b!1260710 c!122632) b!1260709))

(assert (= (and b!1260710 (not c!122632)) b!1260701))

(assert (= (and b!1260709 res!840173) b!1260711))

(assert (= (or b!1260709 b!1260701) bm!61949))

(declare-fun b_lambda!22769 () Bool)

(assert (=> (not b_lambda!22769) (not b!1260706)))

(assert (=> b!1260706 t!41666))

(declare-fun b_and!45283 () Bool)

(assert (= b_and!45281 (and (=> t!41666 result!23347) b_and!45283)))

(assert (=> b!1260713 m!1161355))

(assert (=> b!1260713 m!1161355))

(declare-fun m!1161461 () Bool)

(assert (=> b!1260713 m!1161461))

(declare-fun m!1161463 () Bool)

(assert (=> b!1260711 m!1161463))

(assert (=> b!1260700 m!1161355))

(assert (=> b!1260700 m!1161355))

(assert (=> b!1260700 m!1161357))

(declare-fun m!1161465 () Bool)

(assert (=> bm!61948 m!1161465))

(declare-fun m!1161467 () Bool)

(assert (=> b!1260717 m!1161467))

(assert (=> b!1260706 m!1161355))

(assert (=> b!1260706 m!1161355))

(declare-fun m!1161469 () Bool)

(assert (=> b!1260706 m!1161469))

(assert (=> b!1260706 m!1161415))

(assert (=> b!1260706 m!1161417))

(assert (=> b!1260706 m!1161419))

(assert (=> b!1260706 m!1161417))

(assert (=> b!1260706 m!1161415))

(assert (=> bm!61946 m!1161317))

(assert (=> b!1260704 m!1161355))

(assert (=> b!1260704 m!1161355))

(assert (=> b!1260704 m!1161357))

(declare-fun m!1161471 () Bool)

(assert (=> bm!61943 m!1161471))

(declare-fun m!1161473 () Bool)

(assert (=> bm!61949 m!1161473))

(declare-fun m!1161475 () Bool)

(assert (=> b!1260703 m!1161475))

(declare-fun m!1161477 () Bool)

(assert (=> b!1260712 m!1161477))

(declare-fun m!1161479 () Bool)

(assert (=> b!1260712 m!1161479))

(declare-fun m!1161481 () Bool)

(assert (=> b!1260712 m!1161481))

(assert (=> b!1260712 m!1161479))

(declare-fun m!1161483 () Bool)

(assert (=> b!1260712 m!1161483))

(declare-fun m!1161485 () Bool)

(assert (=> b!1260712 m!1161485))

(declare-fun m!1161487 () Bool)

(assert (=> b!1260712 m!1161487))

(declare-fun m!1161489 () Bool)

(assert (=> b!1260712 m!1161489))

(declare-fun m!1161491 () Bool)

(assert (=> b!1260712 m!1161491))

(declare-fun m!1161493 () Bool)

(assert (=> b!1260712 m!1161493))

(declare-fun m!1161495 () Bool)

(assert (=> b!1260712 m!1161495))

(declare-fun m!1161497 () Bool)

(assert (=> b!1260712 m!1161497))

(declare-fun m!1161499 () Bool)

(assert (=> b!1260712 m!1161499))

(assert (=> b!1260712 m!1161355))

(declare-fun m!1161501 () Bool)

(assert (=> b!1260712 m!1161501))

(declare-fun m!1161503 () Bool)

(assert (=> b!1260712 m!1161503))

(assert (=> b!1260712 m!1161485))

(assert (=> b!1260712 m!1161489))

(assert (=> b!1260712 m!1161317))

(assert (=> b!1260712 m!1161501))

(declare-fun m!1161505 () Bool)

(assert (=> b!1260712 m!1161505))

(assert (=> d!138413 m!1161291))

(assert (=> b!1260561 d!138413))

(declare-fun d!138415 () Bool)

(declare-fun e!717436 () Bool)

(assert (=> d!138415 e!717436))

(declare-fun res!840176 () Bool)

(assert (=> d!138415 (=> (not res!840176) (not e!717436))))

(declare-fun lt!571394 () ListLongMap!18839)

(assert (=> d!138415 (= res!840176 (contains!7577 lt!571394 (_1!10494 lt!571245)))))

(declare-fun lt!571396 () List!28164)

(assert (=> d!138415 (= lt!571394 (ListLongMap!18840 lt!571396))))

(declare-fun lt!571395 () Unit!42051)

(declare-fun lt!571397 () Unit!42051)

(assert (=> d!138415 (= lt!571395 lt!571397)))

(assert (=> d!138415 (= (getValueByKey!659 lt!571396 (_1!10494 lt!571245)) (Some!709 (_2!10494 lt!571245)))))

(assert (=> d!138415 (= lt!571397 (lemmaContainsTupThenGetReturnValue!332 lt!571396 (_1!10494 lt!571245) (_2!10494 lt!571245)))))

(assert (=> d!138415 (= lt!571396 (insertStrictlySorted!446 (toList!9435 lt!571242) (_1!10494 lt!571245) (_2!10494 lt!571245)))))

(assert (=> d!138415 (= (+!4238 lt!571242 lt!571245) lt!571394)))

(declare-fun b!1260718 () Bool)

(declare-fun res!840177 () Bool)

(assert (=> b!1260718 (=> (not res!840177) (not e!717436))))

(assert (=> b!1260718 (= res!840177 (= (getValueByKey!659 (toList!9435 lt!571394) (_1!10494 lt!571245)) (Some!709 (_2!10494 lt!571245))))))

(declare-fun b!1260719 () Bool)

(assert (=> b!1260719 (= e!717436 (contains!7578 (toList!9435 lt!571394) lt!571245))))

(assert (= (and d!138415 res!840176) b!1260718))

(assert (= (and b!1260718 res!840177) b!1260719))

(declare-fun m!1161507 () Bool)

(assert (=> d!138415 m!1161507))

(declare-fun m!1161509 () Bool)

(assert (=> d!138415 m!1161509))

(declare-fun m!1161511 () Bool)

(assert (=> d!138415 m!1161511))

(declare-fun m!1161513 () Bool)

(assert (=> d!138415 m!1161513))

(declare-fun m!1161515 () Bool)

(assert (=> b!1260718 m!1161515))

(declare-fun m!1161517 () Bool)

(assert (=> b!1260719 m!1161517))

(assert (=> b!1260561 d!138415))

(declare-fun d!138417 () Bool)

(assert (=> d!138417 (= (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571400 () Unit!42051)

(declare-fun choose!1867 (array!82184 array!82186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48409 V!48409 V!48409 V!48409 (_ BitVec 32) Int) Unit!42051)

(assert (=> d!138417 (= lt!571400 (choose!1867 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138417 (validMask!0 mask!1466)))

(assert (=> d!138417 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1168 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571400)))

(declare-fun bs!35672 () Bool)

(assert (= bs!35672 d!138417))

(assert (=> bs!35672 m!1161317))

(assert (=> bs!35672 m!1161315))

(declare-fun m!1161519 () Bool)

(assert (=> bs!35672 m!1161519))

(assert (=> bs!35672 m!1161291))

(assert (=> b!1260566 d!138417))

(declare-fun b!1260744 () Bool)

(declare-fun e!717455 () ListLongMap!18839)

(declare-fun e!717453 () ListLongMap!18839)

(assert (=> b!1260744 (= e!717455 e!717453)))

(declare-fun c!122641 () Bool)

(assert (=> b!1260744 (= c!122641 (validKeyInArray!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260745 () Bool)

(declare-fun res!840189 () Bool)

(declare-fun e!717456 () Bool)

(assert (=> b!1260745 (=> (not res!840189) (not e!717456))))

(declare-fun lt!571415 () ListLongMap!18839)

(assert (=> b!1260745 (= res!840189 (not (contains!7577 lt!571415 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1260746 () Bool)

(declare-fun e!717454 () Bool)

(declare-fun e!717452 () Bool)

(assert (=> b!1260746 (= e!717454 e!717452)))

(declare-fun c!122644 () Bool)

(assert (=> b!1260746 (= c!122644 (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun b!1260747 () Bool)

(assert (=> b!1260747 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(assert (=> b!1260747 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40183 _values!914)))))

(declare-fun e!717451 () Bool)

(assert (=> b!1260747 (= e!717451 (= (apply!993 lt!571415 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)) (get!20238 (select (arr!39647 _values!914) #b00000000000000000000000000000000) (dynLambda!3391 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1260748 () Bool)

(declare-fun call!61955 () ListLongMap!18839)

(assert (=> b!1260748 (= e!717453 call!61955)))

(declare-fun d!138419 () Bool)

(assert (=> d!138419 e!717456))

(declare-fun res!840187 () Bool)

(assert (=> d!138419 (=> (not res!840187) (not e!717456))))

(assert (=> d!138419 (= res!840187 (not (contains!7577 lt!571415 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138419 (= lt!571415 e!717455)))

(declare-fun c!122643 () Bool)

(assert (=> d!138419 (= c!122643 (bvsge #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(assert (=> d!138419 (validMask!0 mask!1466)))

(assert (=> d!138419 (= (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571415)))

(declare-fun b!1260749 () Bool)

(assert (=> b!1260749 (= e!717454 e!717451)))

(assert (=> b!1260749 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun res!840188 () Bool)

(assert (=> b!1260749 (= res!840188 (contains!7577 lt!571415 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260749 (=> (not res!840188) (not e!717451))))

(declare-fun b!1260750 () Bool)

(assert (=> b!1260750 (= e!717455 (ListLongMap!18840 Nil!28161))))

(declare-fun b!1260751 () Bool)

(declare-fun e!717457 () Bool)

(assert (=> b!1260751 (= e!717457 (validKeyInArray!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260751 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1260752 () Bool)

(declare-fun lt!571417 () Unit!42051)

(declare-fun lt!571420 () Unit!42051)

(assert (=> b!1260752 (= lt!571417 lt!571420)))

(declare-fun lt!571421 () (_ BitVec 64))

(declare-fun lt!571416 () ListLongMap!18839)

(declare-fun lt!571419 () V!48409)

(declare-fun lt!571418 () (_ BitVec 64))

(assert (=> b!1260752 (not (contains!7577 (+!4238 lt!571416 (tuple2!20967 lt!571421 lt!571419)) lt!571418))))

(declare-fun addStillNotContains!321 (ListLongMap!18839 (_ BitVec 64) V!48409 (_ BitVec 64)) Unit!42051)

(assert (=> b!1260752 (= lt!571420 (addStillNotContains!321 lt!571416 lt!571421 lt!571419 lt!571418))))

(assert (=> b!1260752 (= lt!571418 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1260752 (= lt!571419 (get!20238 (select (arr!39647 _values!914) #b00000000000000000000000000000000) (dynLambda!3391 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1260752 (= lt!571421 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1260752 (= lt!571416 call!61955)))

(assert (=> b!1260752 (= e!717453 (+!4238 call!61955 (tuple2!20967 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000) (get!20238 (select (arr!39647 _values!914) #b00000000000000000000000000000000) (dynLambda!3391 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1260753 () Bool)

(assert (=> b!1260753 (= e!717456 e!717454)))

(declare-fun c!122642 () Bool)

(assert (=> b!1260753 (= c!122642 e!717457)))

(declare-fun res!840186 () Bool)

(assert (=> b!1260753 (=> (not res!840186) (not e!717457))))

(assert (=> b!1260753 (= res!840186 (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun b!1260754 () Bool)

(declare-fun isEmpty!1035 (ListLongMap!18839) Bool)

(assert (=> b!1260754 (= e!717452 (isEmpty!1035 lt!571415))))

(declare-fun bm!61952 () Bool)

(assert (=> bm!61952 (= call!61955 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1260755 () Bool)

(assert (=> b!1260755 (= e!717452 (= lt!571415 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138419 c!122643) b!1260750))

(assert (= (and d!138419 (not c!122643)) b!1260744))

(assert (= (and b!1260744 c!122641) b!1260752))

(assert (= (and b!1260744 (not c!122641)) b!1260748))

(assert (= (or b!1260752 b!1260748) bm!61952))

(assert (= (and d!138419 res!840187) b!1260745))

(assert (= (and b!1260745 res!840189) b!1260753))

(assert (= (and b!1260753 res!840186) b!1260751))

(assert (= (and b!1260753 c!122642) b!1260749))

(assert (= (and b!1260753 (not c!122642)) b!1260746))

(assert (= (and b!1260749 res!840188) b!1260747))

(assert (= (and b!1260746 c!122644) b!1260755))

(assert (= (and b!1260746 (not c!122644)) b!1260754))

(declare-fun b_lambda!22771 () Bool)

(assert (=> (not b_lambda!22771) (not b!1260747)))

(assert (=> b!1260747 t!41666))

(declare-fun b_and!45285 () Bool)

(assert (= b_and!45283 (and (=> t!41666 result!23347) b_and!45285)))

(declare-fun b_lambda!22773 () Bool)

(assert (=> (not b_lambda!22773) (not b!1260752)))

(assert (=> b!1260752 t!41666))

(declare-fun b_and!45287 () Bool)

(assert (= b_and!45285 (and (=> t!41666 result!23347) b_and!45287)))

(assert (=> b!1260744 m!1161355))

(assert (=> b!1260744 m!1161355))

(assert (=> b!1260744 m!1161357))

(declare-fun m!1161521 () Bool)

(assert (=> b!1260745 m!1161521))

(declare-fun m!1161523 () Bool)

(assert (=> d!138419 m!1161523))

(assert (=> d!138419 m!1161291))

(assert (=> b!1260751 m!1161355))

(assert (=> b!1260751 m!1161355))

(assert (=> b!1260751 m!1161357))

(declare-fun m!1161525 () Bool)

(assert (=> bm!61952 m!1161525))

(assert (=> b!1260752 m!1161417))

(declare-fun m!1161527 () Bool)

(assert (=> b!1260752 m!1161527))

(declare-fun m!1161529 () Bool)

(assert (=> b!1260752 m!1161529))

(assert (=> b!1260752 m!1161355))

(assert (=> b!1260752 m!1161529))

(declare-fun m!1161531 () Bool)

(assert (=> b!1260752 m!1161531))

(assert (=> b!1260752 m!1161415))

(assert (=> b!1260752 m!1161415))

(assert (=> b!1260752 m!1161417))

(assert (=> b!1260752 m!1161419))

(declare-fun m!1161533 () Bool)

(assert (=> b!1260752 m!1161533))

(assert (=> b!1260749 m!1161355))

(assert (=> b!1260749 m!1161355))

(declare-fun m!1161535 () Bool)

(assert (=> b!1260749 m!1161535))

(assert (=> b!1260755 m!1161525))

(assert (=> b!1260747 m!1161417))

(assert (=> b!1260747 m!1161355))

(assert (=> b!1260747 m!1161415))

(assert (=> b!1260747 m!1161355))

(declare-fun m!1161537 () Bool)

(assert (=> b!1260747 m!1161537))

(assert (=> b!1260747 m!1161415))

(assert (=> b!1260747 m!1161417))

(assert (=> b!1260747 m!1161419))

(declare-fun m!1161539 () Bool)

(assert (=> b!1260754 m!1161539))

(assert (=> b!1260566 d!138419))

(declare-fun b!1260756 () Bool)

(declare-fun e!717462 () ListLongMap!18839)

(declare-fun e!717460 () ListLongMap!18839)

(assert (=> b!1260756 (= e!717462 e!717460)))

(declare-fun c!122645 () Bool)

(assert (=> b!1260756 (= c!122645 (validKeyInArray!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260757 () Bool)

(declare-fun res!840193 () Bool)

(declare-fun e!717463 () Bool)

(assert (=> b!1260757 (=> (not res!840193) (not e!717463))))

(declare-fun lt!571422 () ListLongMap!18839)

(assert (=> b!1260757 (= res!840193 (not (contains!7577 lt!571422 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1260758 () Bool)

(declare-fun e!717461 () Bool)

(declare-fun e!717459 () Bool)

(assert (=> b!1260758 (= e!717461 e!717459)))

(declare-fun c!122648 () Bool)

(assert (=> b!1260758 (= c!122648 (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun b!1260759 () Bool)

(assert (=> b!1260759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(assert (=> b!1260759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40183 _values!914)))))

(declare-fun e!717458 () Bool)

(assert (=> b!1260759 (= e!717458 (= (apply!993 lt!571422 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)) (get!20238 (select (arr!39647 _values!914) #b00000000000000000000000000000000) (dynLambda!3391 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1260760 () Bool)

(declare-fun call!61956 () ListLongMap!18839)

(assert (=> b!1260760 (= e!717460 call!61956)))

(declare-fun d!138421 () Bool)

(assert (=> d!138421 e!717463))

(declare-fun res!840191 () Bool)

(assert (=> d!138421 (=> (not res!840191) (not e!717463))))

(assert (=> d!138421 (= res!840191 (not (contains!7577 lt!571422 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138421 (= lt!571422 e!717462)))

(declare-fun c!122647 () Bool)

(assert (=> d!138421 (= c!122647 (bvsge #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(assert (=> d!138421 (validMask!0 mask!1466)))

(assert (=> d!138421 (= (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571422)))

(declare-fun b!1260761 () Bool)

(assert (=> b!1260761 (= e!717461 e!717458)))

(assert (=> b!1260761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun res!840192 () Bool)

(assert (=> b!1260761 (= res!840192 (contains!7577 lt!571422 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260761 (=> (not res!840192) (not e!717458))))

(declare-fun b!1260762 () Bool)

(assert (=> b!1260762 (= e!717462 (ListLongMap!18840 Nil!28161))))

(declare-fun b!1260763 () Bool)

(declare-fun e!717464 () Bool)

(assert (=> b!1260763 (= e!717464 (validKeyInArray!0 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260763 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1260764 () Bool)

(declare-fun lt!571424 () Unit!42051)

(declare-fun lt!571427 () Unit!42051)

(assert (=> b!1260764 (= lt!571424 lt!571427)))

(declare-fun lt!571426 () V!48409)

(declare-fun lt!571425 () (_ BitVec 64))

(declare-fun lt!571423 () ListLongMap!18839)

(declare-fun lt!571428 () (_ BitVec 64))

(assert (=> b!1260764 (not (contains!7577 (+!4238 lt!571423 (tuple2!20967 lt!571428 lt!571426)) lt!571425))))

(assert (=> b!1260764 (= lt!571427 (addStillNotContains!321 lt!571423 lt!571428 lt!571426 lt!571425))))

(assert (=> b!1260764 (= lt!571425 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1260764 (= lt!571426 (get!20238 (select (arr!39647 _values!914) #b00000000000000000000000000000000) (dynLambda!3391 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1260764 (= lt!571428 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1260764 (= lt!571423 call!61956)))

(assert (=> b!1260764 (= e!717460 (+!4238 call!61956 (tuple2!20967 (select (arr!39646 _keys!1118) #b00000000000000000000000000000000) (get!20238 (select (arr!39647 _values!914) #b00000000000000000000000000000000) (dynLambda!3391 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1260765 () Bool)

(assert (=> b!1260765 (= e!717463 e!717461)))

(declare-fun c!122646 () Bool)

(assert (=> b!1260765 (= c!122646 e!717464)))

(declare-fun res!840190 () Bool)

(assert (=> b!1260765 (=> (not res!840190) (not e!717464))))

(assert (=> b!1260765 (= res!840190 (bvslt #b00000000000000000000000000000000 (size!40182 _keys!1118)))))

(declare-fun b!1260766 () Bool)

(assert (=> b!1260766 (= e!717459 (isEmpty!1035 lt!571422))))

(declare-fun bm!61953 () Bool)

(assert (=> bm!61953 (= call!61956 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1260767 () Bool)

(assert (=> b!1260767 (= e!717459 (= lt!571422 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138421 c!122647) b!1260762))

(assert (= (and d!138421 (not c!122647)) b!1260756))

(assert (= (and b!1260756 c!122645) b!1260764))

(assert (= (and b!1260756 (not c!122645)) b!1260760))

(assert (= (or b!1260764 b!1260760) bm!61953))

(assert (= (and d!138421 res!840191) b!1260757))

(assert (= (and b!1260757 res!840193) b!1260765))

(assert (= (and b!1260765 res!840190) b!1260763))

(assert (= (and b!1260765 c!122646) b!1260761))

(assert (= (and b!1260765 (not c!122646)) b!1260758))

(assert (= (and b!1260761 res!840192) b!1260759))

(assert (= (and b!1260758 c!122648) b!1260767))

(assert (= (and b!1260758 (not c!122648)) b!1260766))

(declare-fun b_lambda!22775 () Bool)

(assert (=> (not b_lambda!22775) (not b!1260759)))

(assert (=> b!1260759 t!41666))

(declare-fun b_and!45289 () Bool)

(assert (= b_and!45287 (and (=> t!41666 result!23347) b_and!45289)))

(declare-fun b_lambda!22777 () Bool)

(assert (=> (not b_lambda!22777) (not b!1260764)))

(assert (=> b!1260764 t!41666))

(declare-fun b_and!45291 () Bool)

(assert (= b_and!45289 (and (=> t!41666 result!23347) b_and!45291)))

(assert (=> b!1260756 m!1161355))

(assert (=> b!1260756 m!1161355))

(assert (=> b!1260756 m!1161357))

(declare-fun m!1161541 () Bool)

(assert (=> b!1260757 m!1161541))

(declare-fun m!1161543 () Bool)

(assert (=> d!138421 m!1161543))

(assert (=> d!138421 m!1161291))

(assert (=> b!1260763 m!1161355))

(assert (=> b!1260763 m!1161355))

(assert (=> b!1260763 m!1161357))

(declare-fun m!1161545 () Bool)

(assert (=> bm!61953 m!1161545))

(assert (=> b!1260764 m!1161417))

(declare-fun m!1161547 () Bool)

(assert (=> b!1260764 m!1161547))

(declare-fun m!1161549 () Bool)

(assert (=> b!1260764 m!1161549))

(assert (=> b!1260764 m!1161355))

(assert (=> b!1260764 m!1161549))

(declare-fun m!1161551 () Bool)

(assert (=> b!1260764 m!1161551))

(assert (=> b!1260764 m!1161415))

(assert (=> b!1260764 m!1161415))

(assert (=> b!1260764 m!1161417))

(assert (=> b!1260764 m!1161419))

(declare-fun m!1161553 () Bool)

(assert (=> b!1260764 m!1161553))

(assert (=> b!1260761 m!1161355))

(assert (=> b!1260761 m!1161355))

(declare-fun m!1161555 () Bool)

(assert (=> b!1260761 m!1161555))

(assert (=> b!1260767 m!1161545))

(assert (=> b!1260759 m!1161417))

(assert (=> b!1260759 m!1161355))

(assert (=> b!1260759 m!1161415))

(assert (=> b!1260759 m!1161355))

(declare-fun m!1161557 () Bool)

(assert (=> b!1260759 m!1161557))

(assert (=> b!1260759 m!1161415))

(assert (=> b!1260759 m!1161417))

(assert (=> b!1260759 m!1161419))

(declare-fun m!1161559 () Bool)

(assert (=> b!1260766 m!1161559))

(assert (=> b!1260566 d!138421))

(declare-fun b!1260774 () Bool)

(declare-fun e!717469 () Bool)

(assert (=> b!1260774 (= e!717469 tp_is_empty!32283)))

(declare-fun b!1260775 () Bool)

(declare-fun e!717470 () Bool)

(assert (=> b!1260775 (= e!717470 tp_is_empty!32283)))

(declare-fun condMapEmpty!50230 () Bool)

(declare-fun mapDefault!50230 () ValueCell!15378)

(assert (=> mapNonEmpty!50224 (= condMapEmpty!50230 (= mapRest!50224 ((as const (Array (_ BitVec 32) ValueCell!15378)) mapDefault!50230)))))

(declare-fun mapRes!50230 () Bool)

(assert (=> mapNonEmpty!50224 (= tp!95672 (and e!717470 mapRes!50230))))

(declare-fun mapNonEmpty!50230 () Bool)

(declare-fun tp!95681 () Bool)

(assert (=> mapNonEmpty!50230 (= mapRes!50230 (and tp!95681 e!717469))))

(declare-fun mapValue!50230 () ValueCell!15378)

(declare-fun mapKey!50230 () (_ BitVec 32))

(declare-fun mapRest!50230 () (Array (_ BitVec 32) ValueCell!15378))

(assert (=> mapNonEmpty!50230 (= mapRest!50224 (store mapRest!50230 mapKey!50230 mapValue!50230))))

(declare-fun mapIsEmpty!50230 () Bool)

(assert (=> mapIsEmpty!50230 mapRes!50230))

(assert (= (and mapNonEmpty!50224 condMapEmpty!50230) mapIsEmpty!50230))

(assert (= (and mapNonEmpty!50224 (not condMapEmpty!50230)) mapNonEmpty!50230))

(assert (= (and mapNonEmpty!50230 ((_ is ValueCellFull!15378) mapValue!50230)) b!1260774))

(assert (= (and mapNonEmpty!50224 ((_ is ValueCellFull!15378) mapDefault!50230)) b!1260775))

(declare-fun m!1161561 () Bool)

(assert (=> mapNonEmpty!50230 m!1161561))

(declare-fun b_lambda!22779 () Bool)

(assert (= b_lambda!22771 (or (and start!105818 b_free!27381) b_lambda!22779)))

(declare-fun b_lambda!22781 () Bool)

(assert (= b_lambda!22769 (or (and start!105818 b_free!27381) b_lambda!22781)))

(declare-fun b_lambda!22783 () Bool)

(assert (= b_lambda!22767 (or (and start!105818 b_free!27381) b_lambda!22783)))

(declare-fun b_lambda!22785 () Bool)

(assert (= b_lambda!22777 (or (and start!105818 b_free!27381) b_lambda!22785)))

(declare-fun b_lambda!22787 () Bool)

(assert (= b_lambda!22775 (or (and start!105818 b_free!27381) b_lambda!22787)))

(declare-fun b_lambda!22789 () Bool)

(assert (= b_lambda!22773 (or (and start!105818 b_free!27381) b_lambda!22789)))

(check-sat (not b!1260764) (not b_lambda!22789) (not b!1260757) (not bm!61949) (not b!1260745) (not bm!61942) (not b_lambda!22783) (not b!1260610) (not b!1260607) (not b!1260755) b_and!45291 (not d!138411) (not d!138407) (not b!1260690) (not bm!61948) (not b!1260711) (not bm!61939) (not bm!61918) tp_is_empty!32283 (not b!1260754) (not b!1260681) (not b!1260703) (not d!138405) (not d!138413) (not b!1260713) (not b!1260617) (not d!138403) (not bm!61941) (not b!1260608) (not b!1260627) (not b!1260719) (not b!1260689) (not b!1260704) (not b!1260683) (not b!1260630) (not bm!61936) (not d!138419) (not b!1260717) (not b!1260712) (not d!138393) (not b!1260677) (not d!138409) (not bm!61946) (not b!1260626) (not mapNonEmpty!50230) (not b!1260680) (not d!138417) (not b!1260761) (not b!1260749) (not b!1260756) (not bm!61943) (not b!1260700) (not b!1260718) (not b_lambda!22781) (not b!1260767) (not b!1260747) (not b!1260766) (not b!1260694) (not b!1260759) (not b!1260763) (not b!1260744) (not d!138415) (not b!1260706) (not bm!61921) (not d!138421) (not b!1260688) (not bm!61952) (not b!1260631) (not b_lambda!22785) (not b_next!27381) (not b!1260751) (not bm!61953) (not b_lambda!22779) (not b_lambda!22787) (not b!1260616) (not b!1260752))
(check-sat b_and!45291 (not b_next!27381))
