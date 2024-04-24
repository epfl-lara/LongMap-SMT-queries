; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42496 () Bool)

(assert start!42496)

(declare-fun b_free!11965 () Bool)

(declare-fun b_next!11965 () Bool)

(assert (=> start!42496 (= b_free!11965 (not b_next!11965))))

(declare-fun tp!41931 () Bool)

(declare-fun b_and!20443 () Bool)

(assert (=> start!42496 (= tp!41931 b_and!20443)))

(declare-fun b!474272 () Bool)

(declare-fun e!278363 () Bool)

(declare-fun e!278360 () Bool)

(assert (=> b!474272 (= e!278363 (not e!278360))))

(declare-fun res!283315 () Bool)

(assert (=> b!474272 (=> res!283315 e!278360)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474272 (= res!283315 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18963 0))(
  ( (V!18964 (val!6741 Int)) )
))
(declare-datatypes ((tuple2!8810 0))(
  ( (tuple2!8811 (_1!4416 (_ BitVec 64)) (_2!4416 V!18963)) )
))
(declare-datatypes ((List!8871 0))(
  ( (Nil!8868) (Cons!8867 (h!9723 tuple2!8810) (t!14835 List!8871)) )
))
(declare-datatypes ((ListLongMap!7725 0))(
  ( (ListLongMap!7726 (toList!3878 List!8871)) )
))
(declare-fun lt!216024 () ListLongMap!7725)

(declare-fun lt!216022 () ListLongMap!7725)

(assert (=> b!474272 (= lt!216024 lt!216022)))

(declare-fun minValueBefore!38 () V!18963)

(declare-fun zeroValue!794 () V!18963)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30512 0))(
  ( (array!30513 (arr!14674 (Array (_ BitVec 32) (_ BitVec 64))) (size!15026 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30512)

(declare-datatypes ((ValueCell!6353 0))(
  ( (ValueCellFull!6353 (v!9034 V!18963)) (EmptyCell!6353) )
))
(declare-datatypes ((array!30514 0))(
  ( (array!30515 (arr!14675 (Array (_ BitVec 32) ValueCell!6353)) (size!15027 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30514)

(declare-fun minValueAfter!38 () V!18963)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((Unit!13962 0))(
  ( (Unit!13963) )
))
(declare-fun lt!216026 () Unit!13962)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!246 (array!30512 array!30514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18963 V!18963 V!18963 V!18963 (_ BitVec 32) Int) Unit!13962)

(assert (=> b!474272 (= lt!216026 (lemmaNoChangeToArrayThenSameMapNoExtras!246 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2086 (array!30512 array!30514 (_ BitVec 32) (_ BitVec 32) V!18963 V!18963 (_ BitVec 32) Int) ListLongMap!7725)

(assert (=> b!474272 (= lt!216022 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474272 (= lt!216024 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474273 () Bool)

(declare-fun res!283316 () Bool)

(assert (=> b!474273 (=> (not res!283316) (not e!278363))))

(assert (=> b!474273 (= res!283316 (and (= (size!15027 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15026 _keys!1025) (size!15027 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21805 () Bool)

(declare-fun mapRes!21805 () Bool)

(declare-fun tp!41932 () Bool)

(declare-fun e!278364 () Bool)

(assert (=> mapNonEmpty!21805 (= mapRes!21805 (and tp!41932 e!278364))))

(declare-fun mapKey!21805 () (_ BitVec 32))

(declare-fun mapRest!21805 () (Array (_ BitVec 32) ValueCell!6353))

(declare-fun mapValue!21805 () ValueCell!6353)

(assert (=> mapNonEmpty!21805 (= (arr!14675 _values!833) (store mapRest!21805 mapKey!21805 mapValue!21805))))

(declare-fun b!474274 () Bool)

(assert (=> b!474274 (= e!278360 (bvsle #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun lt!216020 () ListLongMap!7725)

(declare-fun lt!216023 () tuple2!8810)

(declare-fun +!1760 (ListLongMap!7725 tuple2!8810) ListLongMap!7725)

(assert (=> b!474274 (= (+!1760 lt!216020 lt!216023) (+!1760 (+!1760 lt!216020 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216023))))

(assert (=> b!474274 (= lt!216023 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!216021 () Unit!13962)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!162 (ListLongMap!7725 (_ BitVec 64) V!18963 V!18963) Unit!13962)

(assert (=> b!474274 (= lt!216021 (addSameAsAddTwiceSameKeyDiffValues!162 lt!216020 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!474274 (= lt!216020 (+!1760 lt!216024 (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!216027 () ListLongMap!7725)

(declare-fun getCurrentListMap!2240 (array!30512 array!30514 (_ BitVec 32) (_ BitVec 32) V!18963 V!18963 (_ BitVec 32) Int) ListLongMap!7725)

(assert (=> b!474274 (= lt!216027 (getCurrentListMap!2240 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216025 () ListLongMap!7725)

(assert (=> b!474274 (= lt!216025 (getCurrentListMap!2240 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474275 () Bool)

(declare-fun res!283318 () Bool)

(assert (=> b!474275 (=> (not res!283318) (not e!278363))))

(declare-datatypes ((List!8872 0))(
  ( (Nil!8869) (Cons!8868 (h!9724 (_ BitVec 64)) (t!14836 List!8872)) )
))
(declare-fun arrayNoDuplicates!0 (array!30512 (_ BitVec 32) List!8872) Bool)

(assert (=> b!474275 (= res!283318 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8869))))

(declare-fun b!474276 () Bool)

(declare-fun e!278361 () Bool)

(declare-fun tp_is_empty!13393 () Bool)

(assert (=> b!474276 (= e!278361 tp_is_empty!13393)))

(declare-fun b!474277 () Bool)

(declare-fun res!283314 () Bool)

(assert (=> b!474277 (=> (not res!283314) (not e!278363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30512 (_ BitVec 32)) Bool)

(assert (=> b!474277 (= res!283314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474278 () Bool)

(declare-fun e!278365 () Bool)

(assert (=> b!474278 (= e!278365 (and e!278361 mapRes!21805))))

(declare-fun condMapEmpty!21805 () Bool)

(declare-fun mapDefault!21805 () ValueCell!6353)

(assert (=> b!474278 (= condMapEmpty!21805 (= (arr!14675 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6353)) mapDefault!21805)))))

(declare-fun res!283317 () Bool)

(assert (=> start!42496 (=> (not res!283317) (not e!278363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42496 (= res!283317 (validMask!0 mask!1365))))

(assert (=> start!42496 e!278363))

(assert (=> start!42496 tp_is_empty!13393))

(assert (=> start!42496 tp!41931))

(assert (=> start!42496 true))

(declare-fun array_inv!10668 (array!30512) Bool)

(assert (=> start!42496 (array_inv!10668 _keys!1025)))

(declare-fun array_inv!10669 (array!30514) Bool)

(assert (=> start!42496 (and (array_inv!10669 _values!833) e!278365)))

(declare-fun b!474279 () Bool)

(assert (=> b!474279 (= e!278364 tp_is_empty!13393)))

(declare-fun mapIsEmpty!21805 () Bool)

(assert (=> mapIsEmpty!21805 mapRes!21805))

(assert (= (and start!42496 res!283317) b!474273))

(assert (= (and b!474273 res!283316) b!474277))

(assert (= (and b!474277 res!283314) b!474275))

(assert (= (and b!474275 res!283318) b!474272))

(assert (= (and b!474272 (not res!283315)) b!474274))

(assert (= (and b!474278 condMapEmpty!21805) mapIsEmpty!21805))

(assert (= (and b!474278 (not condMapEmpty!21805)) mapNonEmpty!21805))

(get-info :version)

(assert (= (and mapNonEmpty!21805 ((_ is ValueCellFull!6353) mapValue!21805)) b!474279))

(assert (= (and b!474278 ((_ is ValueCellFull!6353) mapDefault!21805)) b!474276))

(assert (= start!42496 b!474278))

(declare-fun m!456835 () Bool)

(assert (=> mapNonEmpty!21805 m!456835))

(declare-fun m!456837 () Bool)

(assert (=> b!474277 m!456837))

(declare-fun m!456839 () Bool)

(assert (=> start!42496 m!456839))

(declare-fun m!456841 () Bool)

(assert (=> start!42496 m!456841))

(declare-fun m!456843 () Bool)

(assert (=> start!42496 m!456843))

(declare-fun m!456845 () Bool)

(assert (=> b!474272 m!456845))

(declare-fun m!456847 () Bool)

(assert (=> b!474272 m!456847))

(declare-fun m!456849 () Bool)

(assert (=> b!474272 m!456849))

(declare-fun m!456851 () Bool)

(assert (=> b!474275 m!456851))

(declare-fun m!456853 () Bool)

(assert (=> b!474274 m!456853))

(declare-fun m!456855 () Bool)

(assert (=> b!474274 m!456855))

(declare-fun m!456857 () Bool)

(assert (=> b!474274 m!456857))

(declare-fun m!456859 () Bool)

(assert (=> b!474274 m!456859))

(declare-fun m!456861 () Bool)

(assert (=> b!474274 m!456861))

(declare-fun m!456863 () Bool)

(assert (=> b!474274 m!456863))

(declare-fun m!456865 () Bool)

(assert (=> b!474274 m!456865))

(assert (=> b!474274 m!456863))

(check-sat (not mapNonEmpty!21805) (not b!474274) (not b!474277) (not b!474272) tp_is_empty!13393 (not b_next!11965) (not start!42496) (not b!474275) b_and!20443)
(check-sat b_and!20443 (not b_next!11965))
(get-model)

(declare-fun d!75579 () Bool)

(assert (=> d!75579 (= (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216078 () Unit!13962)

(declare-fun choose!1360 (array!30512 array!30514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18963 V!18963 V!18963 V!18963 (_ BitVec 32) Int) Unit!13962)

(assert (=> d!75579 (= lt!216078 (choose!1360 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75579 (validMask!0 mask!1365)))

(assert (=> d!75579 (= (lemmaNoChangeToArrayThenSameMapNoExtras!246 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216078)))

(declare-fun bs!15077 () Bool)

(assert (= bs!15077 d!75579))

(assert (=> bs!15077 m!456849))

(assert (=> bs!15077 m!456847))

(declare-fun m!456931 () Bool)

(assert (=> bs!15077 m!456931))

(assert (=> bs!15077 m!456839))

(assert (=> b!474272 d!75579))

(declare-fun d!75581 () Bool)

(declare-fun e!278420 () Bool)

(assert (=> d!75581 e!278420))

(declare-fun res!283357 () Bool)

(assert (=> d!75581 (=> (not res!283357) (not e!278420))))

(declare-fun lt!216097 () ListLongMap!7725)

(declare-fun contains!2532 (ListLongMap!7725 (_ BitVec 64)) Bool)

(assert (=> d!75581 (= res!283357 (not (contains!2532 lt!216097 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!278416 () ListLongMap!7725)

(assert (=> d!75581 (= lt!216097 e!278416)))

(declare-fun c!57079 () Bool)

(assert (=> d!75581 (= c!57079 (bvsge #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(assert (=> d!75581 (validMask!0 mask!1365)))

(assert (=> d!75581 (= (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216097)))

(declare-fun b!474352 () Bool)

(declare-fun e!278417 () ListLongMap!7725)

(declare-fun call!30519 () ListLongMap!7725)

(assert (=> b!474352 (= e!278417 call!30519)))

(declare-fun b!474353 () Bool)

(declare-fun e!278418 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!474353 (= e!278418 (validKeyInArray!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474353 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!474354 () Bool)

(assert (=> b!474354 (= e!278416 (ListLongMap!7726 Nil!8868))))

(declare-fun b!474355 () Bool)

(declare-fun e!278421 () Bool)

(declare-fun isEmpty!586 (ListLongMap!7725) Bool)

(assert (=> b!474355 (= e!278421 (isEmpty!586 lt!216097))))

(declare-fun b!474356 () Bool)

(declare-fun e!278422 () Bool)

(assert (=> b!474356 (= e!278422 e!278421)))

(declare-fun c!57078 () Bool)

(assert (=> b!474356 (= c!57078 (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun b!474357 () Bool)

(assert (=> b!474357 (= e!278420 e!278422)))

(declare-fun c!57077 () Bool)

(assert (=> b!474357 (= c!57077 e!278418)))

(declare-fun res!283358 () Bool)

(assert (=> b!474357 (=> (not res!283358) (not e!278418))))

(assert (=> b!474357 (= res!283358 (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun b!474358 () Bool)

(assert (=> b!474358 (= e!278416 e!278417)))

(declare-fun c!57076 () Bool)

(assert (=> b!474358 (= c!57076 (validKeyInArray!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474359 () Bool)

(declare-fun e!278419 () Bool)

(assert (=> b!474359 (= e!278422 e!278419)))

(assert (=> b!474359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun res!283359 () Bool)

(assert (=> b!474359 (= res!283359 (contains!2532 lt!216097 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474359 (=> (not res!283359) (not e!278419))))

(declare-fun b!474360 () Bool)

(declare-fun res!283360 () Bool)

(assert (=> b!474360 (=> (not res!283360) (not e!278420))))

(assert (=> b!474360 (= res!283360 (not (contains!2532 lt!216097 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!474361 () Bool)

(assert (=> b!474361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(assert (=> b!474361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15027 _values!833)))))

(declare-fun apply!333 (ListLongMap!7725 (_ BitVec 64)) V!18963)

(declare-fun get!7137 (ValueCell!6353 V!18963) V!18963)

(declare-fun dynLambda!923 (Int (_ BitVec 64)) V!18963)

(assert (=> b!474361 (= e!278419 (= (apply!333 lt!216097 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)) (get!7137 (select (arr!14675 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!474362 () Bool)

(assert (=> b!474362 (= e!278421 (= lt!216097 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30516 () Bool)

(assert (=> bm!30516 (= call!30519 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!474363 () Bool)

(declare-fun lt!216095 () Unit!13962)

(declare-fun lt!216099 () Unit!13962)

(assert (=> b!474363 (= lt!216095 lt!216099)))

(declare-fun lt!216098 () V!18963)

(declare-fun lt!216094 () (_ BitVec 64))

(declare-fun lt!216096 () ListLongMap!7725)

(declare-fun lt!216093 () (_ BitVec 64))

(assert (=> b!474363 (not (contains!2532 (+!1760 lt!216096 (tuple2!8811 lt!216093 lt!216098)) lt!216094))))

(declare-fun addStillNotContains!168 (ListLongMap!7725 (_ BitVec 64) V!18963 (_ BitVec 64)) Unit!13962)

(assert (=> b!474363 (= lt!216099 (addStillNotContains!168 lt!216096 lt!216093 lt!216098 lt!216094))))

(assert (=> b!474363 (= lt!216094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!474363 (= lt!216098 (get!7137 (select (arr!14675 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!474363 (= lt!216093 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474363 (= lt!216096 call!30519)))

(assert (=> b!474363 (= e!278417 (+!1760 call!30519 (tuple2!8811 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000) (get!7137 (select (arr!14675 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!75581 c!57079) b!474354))

(assert (= (and d!75581 (not c!57079)) b!474358))

(assert (= (and b!474358 c!57076) b!474363))

(assert (= (and b!474358 (not c!57076)) b!474352))

(assert (= (or b!474363 b!474352) bm!30516))

(assert (= (and d!75581 res!283357) b!474360))

(assert (= (and b!474360 res!283360) b!474357))

(assert (= (and b!474357 res!283358) b!474353))

(assert (= (and b!474357 c!57077) b!474359))

(assert (= (and b!474357 (not c!57077)) b!474356))

(assert (= (and b!474359 res!283359) b!474361))

(assert (= (and b!474356 c!57078) b!474362))

(assert (= (and b!474356 (not c!57078)) b!474355))

(declare-fun b_lambda!10243 () Bool)

(assert (=> (not b_lambda!10243) (not b!474361)))

(declare-fun t!14841 () Bool)

(declare-fun tb!3923 () Bool)

(assert (=> (and start!42496 (= defaultEntry!841 defaultEntry!841) t!14841) tb!3923))

(declare-fun result!7443 () Bool)

(assert (=> tb!3923 (= result!7443 tp_is_empty!13393)))

(assert (=> b!474361 t!14841))

(declare-fun b_and!20449 () Bool)

(assert (= b_and!20443 (and (=> t!14841 result!7443) b_and!20449)))

(declare-fun b_lambda!10245 () Bool)

(assert (=> (not b_lambda!10245) (not b!474363)))

(assert (=> b!474363 t!14841))

(declare-fun b_and!20451 () Bool)

(assert (= b_and!20449 (and (=> t!14841 result!7443) b_and!20451)))

(declare-fun m!456933 () Bool)

(assert (=> b!474353 m!456933))

(assert (=> b!474353 m!456933))

(declare-fun m!456935 () Bool)

(assert (=> b!474353 m!456935))

(assert (=> b!474359 m!456933))

(assert (=> b!474359 m!456933))

(declare-fun m!456937 () Bool)

(assert (=> b!474359 m!456937))

(declare-fun m!456939 () Bool)

(assert (=> b!474361 m!456939))

(assert (=> b!474361 m!456933))

(declare-fun m!456941 () Bool)

(assert (=> b!474361 m!456941))

(declare-fun m!456943 () Bool)

(assert (=> b!474361 m!456943))

(assert (=> b!474361 m!456939))

(declare-fun m!456945 () Bool)

(assert (=> b!474361 m!456945))

(assert (=> b!474361 m!456943))

(assert (=> b!474361 m!456933))

(declare-fun m!456947 () Bool)

(assert (=> b!474363 m!456947))

(assert (=> b!474363 m!456939))

(declare-fun m!456949 () Bool)

(assert (=> b!474363 m!456949))

(declare-fun m!456951 () Bool)

(assert (=> b!474363 m!456951))

(declare-fun m!456953 () Bool)

(assert (=> b!474363 m!456953))

(assert (=> b!474363 m!456949))

(assert (=> b!474363 m!456943))

(assert (=> b!474363 m!456939))

(assert (=> b!474363 m!456945))

(assert (=> b!474363 m!456943))

(assert (=> b!474363 m!456933))

(declare-fun m!456955 () Bool)

(assert (=> b!474362 m!456955))

(declare-fun m!456957 () Bool)

(assert (=> d!75581 m!456957))

(assert (=> d!75581 m!456839))

(assert (=> b!474358 m!456933))

(assert (=> b!474358 m!456933))

(assert (=> b!474358 m!456935))

(declare-fun m!456959 () Bool)

(assert (=> b!474355 m!456959))

(assert (=> bm!30516 m!456955))

(declare-fun m!456961 () Bool)

(assert (=> b!474360 m!456961))

(assert (=> b!474272 d!75581))

(declare-fun d!75583 () Bool)

(declare-fun e!278427 () Bool)

(assert (=> d!75583 e!278427))

(declare-fun res!283361 () Bool)

(assert (=> d!75583 (=> (not res!283361) (not e!278427))))

(declare-fun lt!216104 () ListLongMap!7725)

(assert (=> d!75583 (= res!283361 (not (contains!2532 lt!216104 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!278423 () ListLongMap!7725)

(assert (=> d!75583 (= lt!216104 e!278423)))

(declare-fun c!57083 () Bool)

(assert (=> d!75583 (= c!57083 (bvsge #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(assert (=> d!75583 (validMask!0 mask!1365)))

(assert (=> d!75583 (= (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216104)))

(declare-fun b!474366 () Bool)

(declare-fun e!278424 () ListLongMap!7725)

(declare-fun call!30520 () ListLongMap!7725)

(assert (=> b!474366 (= e!278424 call!30520)))

(declare-fun b!474367 () Bool)

(declare-fun e!278425 () Bool)

(assert (=> b!474367 (= e!278425 (validKeyInArray!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474367 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!474368 () Bool)

(assert (=> b!474368 (= e!278423 (ListLongMap!7726 Nil!8868))))

(declare-fun b!474369 () Bool)

(declare-fun e!278428 () Bool)

(assert (=> b!474369 (= e!278428 (isEmpty!586 lt!216104))))

(declare-fun b!474370 () Bool)

(declare-fun e!278429 () Bool)

(assert (=> b!474370 (= e!278429 e!278428)))

(declare-fun c!57082 () Bool)

(assert (=> b!474370 (= c!57082 (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun b!474371 () Bool)

(assert (=> b!474371 (= e!278427 e!278429)))

(declare-fun c!57081 () Bool)

(assert (=> b!474371 (= c!57081 e!278425)))

(declare-fun res!283362 () Bool)

(assert (=> b!474371 (=> (not res!283362) (not e!278425))))

(assert (=> b!474371 (= res!283362 (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun b!474372 () Bool)

(assert (=> b!474372 (= e!278423 e!278424)))

(declare-fun c!57080 () Bool)

(assert (=> b!474372 (= c!57080 (validKeyInArray!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474373 () Bool)

(declare-fun e!278426 () Bool)

(assert (=> b!474373 (= e!278429 e!278426)))

(assert (=> b!474373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun res!283363 () Bool)

(assert (=> b!474373 (= res!283363 (contains!2532 lt!216104 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474373 (=> (not res!283363) (not e!278426))))

(declare-fun b!474374 () Bool)

(declare-fun res!283364 () Bool)

(assert (=> b!474374 (=> (not res!283364) (not e!278427))))

(assert (=> b!474374 (= res!283364 (not (contains!2532 lt!216104 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!474375 () Bool)

(assert (=> b!474375 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(assert (=> b!474375 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15027 _values!833)))))

(assert (=> b!474375 (= e!278426 (= (apply!333 lt!216104 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)) (get!7137 (select (arr!14675 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!474376 () Bool)

(assert (=> b!474376 (= e!278428 (= lt!216104 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30517 () Bool)

(assert (=> bm!30517 (= call!30520 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!474377 () Bool)

(declare-fun lt!216102 () Unit!13962)

(declare-fun lt!216106 () Unit!13962)

(assert (=> b!474377 (= lt!216102 lt!216106)))

(declare-fun lt!216103 () ListLongMap!7725)

(declare-fun lt!216100 () (_ BitVec 64))

(declare-fun lt!216101 () (_ BitVec 64))

(declare-fun lt!216105 () V!18963)

(assert (=> b!474377 (not (contains!2532 (+!1760 lt!216103 (tuple2!8811 lt!216100 lt!216105)) lt!216101))))

(assert (=> b!474377 (= lt!216106 (addStillNotContains!168 lt!216103 lt!216100 lt!216105 lt!216101))))

(assert (=> b!474377 (= lt!216101 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!474377 (= lt!216105 (get!7137 (select (arr!14675 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!474377 (= lt!216100 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474377 (= lt!216103 call!30520)))

(assert (=> b!474377 (= e!278424 (+!1760 call!30520 (tuple2!8811 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000) (get!7137 (select (arr!14675 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!75583 c!57083) b!474368))

(assert (= (and d!75583 (not c!57083)) b!474372))

(assert (= (and b!474372 c!57080) b!474377))

(assert (= (and b!474372 (not c!57080)) b!474366))

(assert (= (or b!474377 b!474366) bm!30517))

(assert (= (and d!75583 res!283361) b!474374))

(assert (= (and b!474374 res!283364) b!474371))

(assert (= (and b!474371 res!283362) b!474367))

(assert (= (and b!474371 c!57081) b!474373))

(assert (= (and b!474371 (not c!57081)) b!474370))

(assert (= (and b!474373 res!283363) b!474375))

(assert (= (and b!474370 c!57082) b!474376))

(assert (= (and b!474370 (not c!57082)) b!474369))

(declare-fun b_lambda!10247 () Bool)

(assert (=> (not b_lambda!10247) (not b!474375)))

(assert (=> b!474375 t!14841))

(declare-fun b_and!20453 () Bool)

(assert (= b_and!20451 (and (=> t!14841 result!7443) b_and!20453)))

(declare-fun b_lambda!10249 () Bool)

(assert (=> (not b_lambda!10249) (not b!474377)))

(assert (=> b!474377 t!14841))

(declare-fun b_and!20455 () Bool)

(assert (= b_and!20453 (and (=> t!14841 result!7443) b_and!20455)))

(assert (=> b!474367 m!456933))

(assert (=> b!474367 m!456933))

(assert (=> b!474367 m!456935))

(assert (=> b!474373 m!456933))

(assert (=> b!474373 m!456933))

(declare-fun m!456963 () Bool)

(assert (=> b!474373 m!456963))

(assert (=> b!474375 m!456939))

(assert (=> b!474375 m!456933))

(declare-fun m!456965 () Bool)

(assert (=> b!474375 m!456965))

(assert (=> b!474375 m!456943))

(assert (=> b!474375 m!456939))

(assert (=> b!474375 m!456945))

(assert (=> b!474375 m!456943))

(assert (=> b!474375 m!456933))

(declare-fun m!456967 () Bool)

(assert (=> b!474377 m!456967))

(assert (=> b!474377 m!456939))

(declare-fun m!456969 () Bool)

(assert (=> b!474377 m!456969))

(declare-fun m!456971 () Bool)

(assert (=> b!474377 m!456971))

(declare-fun m!456973 () Bool)

(assert (=> b!474377 m!456973))

(assert (=> b!474377 m!456969))

(assert (=> b!474377 m!456943))

(assert (=> b!474377 m!456939))

(assert (=> b!474377 m!456945))

(assert (=> b!474377 m!456943))

(assert (=> b!474377 m!456933))

(declare-fun m!456975 () Bool)

(assert (=> b!474376 m!456975))

(declare-fun m!456977 () Bool)

(assert (=> d!75583 m!456977))

(assert (=> d!75583 m!456839))

(assert (=> b!474372 m!456933))

(assert (=> b!474372 m!456933))

(assert (=> b!474372 m!456935))

(declare-fun m!456979 () Bool)

(assert (=> b!474369 m!456979))

(assert (=> bm!30517 m!456975))

(declare-fun m!456981 () Bool)

(assert (=> b!474374 m!456981))

(assert (=> b!474272 d!75583))

(declare-fun b!474386 () Bool)

(declare-fun e!278437 () Bool)

(declare-fun e!278438 () Bool)

(assert (=> b!474386 (= e!278437 e!278438)))

(declare-fun lt!216114 () (_ BitVec 64))

(assert (=> b!474386 (= lt!216114 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216113 () Unit!13962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30512 (_ BitVec 64) (_ BitVec 32)) Unit!13962)

(assert (=> b!474386 (= lt!216113 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216114 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!474386 (arrayContainsKey!0 _keys!1025 lt!216114 #b00000000000000000000000000000000)))

(declare-fun lt!216115 () Unit!13962)

(assert (=> b!474386 (= lt!216115 lt!216113)))

(declare-fun res!283369 () Bool)

(declare-datatypes ((SeekEntryResult!3506 0))(
  ( (MissingZero!3506 (index!16203 (_ BitVec 32))) (Found!3506 (index!16204 (_ BitVec 32))) (Intermediate!3506 (undefined!4318 Bool) (index!16205 (_ BitVec 32)) (x!44454 (_ BitVec 32))) (Undefined!3506) (MissingVacant!3506 (index!16206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30512 (_ BitVec 32)) SeekEntryResult!3506)

(assert (=> b!474386 (= res!283369 (= (seekEntryOrOpen!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3506 #b00000000000000000000000000000000)))))

(assert (=> b!474386 (=> (not res!283369) (not e!278438))))

(declare-fun b!474387 () Bool)

(declare-fun call!30523 () Bool)

(assert (=> b!474387 (= e!278438 call!30523)))

(declare-fun d!75585 () Bool)

(declare-fun res!283370 () Bool)

(declare-fun e!278436 () Bool)

(assert (=> d!75585 (=> res!283370 e!278436)))

(assert (=> d!75585 (= res!283370 (bvsge #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(assert (=> d!75585 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!278436)))

(declare-fun b!474388 () Bool)

(assert (=> b!474388 (= e!278436 e!278437)))

(declare-fun c!57086 () Bool)

(assert (=> b!474388 (= c!57086 (validKeyInArray!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474389 () Bool)

(assert (=> b!474389 (= e!278437 call!30523)))

(declare-fun bm!30520 () Bool)

(assert (=> bm!30520 (= call!30523 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(assert (= (and d!75585 (not res!283370)) b!474388))

(assert (= (and b!474388 c!57086) b!474386))

(assert (= (and b!474388 (not c!57086)) b!474389))

(assert (= (and b!474386 res!283369) b!474387))

(assert (= (or b!474387 b!474389) bm!30520))

(assert (=> b!474386 m!456933))

(declare-fun m!456983 () Bool)

(assert (=> b!474386 m!456983))

(declare-fun m!456985 () Bool)

(assert (=> b!474386 m!456985))

(assert (=> b!474386 m!456933))

(declare-fun m!456987 () Bool)

(assert (=> b!474386 m!456987))

(assert (=> b!474388 m!456933))

(assert (=> b!474388 m!456933))

(assert (=> b!474388 m!456935))

(declare-fun m!456989 () Bool)

(assert (=> bm!30520 m!456989))

(assert (=> b!474277 d!75585))

(declare-fun d!75587 () Bool)

(assert (=> d!75587 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42496 d!75587))

(declare-fun d!75589 () Bool)

(assert (=> d!75589 (= (array_inv!10668 _keys!1025) (bvsge (size!15026 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42496 d!75589))

(declare-fun d!75591 () Bool)

(assert (=> d!75591 (= (array_inv!10669 _values!833) (bvsge (size!15027 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42496 d!75591))

(declare-fun b!474432 () Bool)

(declare-fun e!278475 () Bool)

(declare-fun e!278477 () Bool)

(assert (=> b!474432 (= e!278475 e!278477)))

(declare-fun res!283391 () Bool)

(declare-fun call!30540 () Bool)

(assert (=> b!474432 (= res!283391 call!30540)))

(assert (=> b!474432 (=> (not res!283391) (not e!278477))))

(declare-fun bm!30535 () Bool)

(declare-fun call!30543 () Bool)

(declare-fun lt!216180 () ListLongMap!7725)

(assert (=> bm!30535 (= call!30543 (contains!2532 lt!216180 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!474433 () Bool)

(declare-fun res!283390 () Bool)

(declare-fun e!278465 () Bool)

(assert (=> b!474433 (=> (not res!283390) (not e!278465))))

(declare-fun e!278470 () Bool)

(assert (=> b!474433 (= res!283390 e!278470)))

(declare-fun res!283389 () Bool)

(assert (=> b!474433 (=> res!283389 e!278470)))

(declare-fun e!278472 () Bool)

(assert (=> b!474433 (= res!283389 (not e!278472))))

(declare-fun res!283397 () Bool)

(assert (=> b!474433 (=> (not res!283397) (not e!278472))))

(assert (=> b!474433 (= res!283397 (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun e!278473 () Bool)

(declare-fun b!474434 () Bool)

(assert (=> b!474434 (= e!278473 (= (apply!333 lt!216180 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)) (get!7137 (select (arr!14675 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!474434 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15027 _values!833)))))

(assert (=> b!474434 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun b!474435 () Bool)

(declare-fun e!278469 () ListLongMap!7725)

(declare-fun call!30542 () ListLongMap!7725)

(assert (=> b!474435 (= e!278469 call!30542)))

(declare-fun b!474436 () Bool)

(assert (=> b!474436 (= e!278472 (validKeyInArray!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474437 () Bool)

(declare-fun e!278466 () Bool)

(declare-fun e!278471 () Bool)

(assert (=> b!474437 (= e!278466 e!278471)))

(declare-fun res!283392 () Bool)

(assert (=> b!474437 (= res!283392 call!30543)))

(assert (=> b!474437 (=> (not res!283392) (not e!278471))))

(declare-fun b!474439 () Bool)

(declare-fun e!278468 () ListLongMap!7725)

(assert (=> b!474439 (= e!278468 e!278469)))

(declare-fun c!57102 () Bool)

(assert (=> b!474439 (= c!57102 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!474440 () Bool)

(assert (=> b!474440 (= e!278477 (= (apply!333 lt!216180 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!474441 () Bool)

(declare-fun e!278476 () ListLongMap!7725)

(assert (=> b!474441 (= e!278476 call!30542)))

(declare-fun bm!30536 () Bool)

(declare-fun call!30544 () ListLongMap!7725)

(declare-fun call!30539 () ListLongMap!7725)

(assert (=> bm!30536 (= call!30544 call!30539)))

(declare-fun b!474442 () Bool)

(assert (=> b!474442 (= e!278471 (= (apply!333 lt!216180 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!474443 () Bool)

(assert (=> b!474443 (= e!278465 e!278466)))

(declare-fun c!57103 () Bool)

(assert (=> b!474443 (= c!57103 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!474444 () Bool)

(assert (=> b!474444 (= e!278475 (not call!30540))))

(declare-fun bm!30537 () Bool)

(declare-fun call!30541 () ListLongMap!7725)

(assert (=> bm!30537 (= call!30541 call!30544)))

(declare-fun b!474445 () Bool)

(declare-fun call!30538 () ListLongMap!7725)

(assert (=> b!474445 (= e!278468 (+!1760 call!30538 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun bm!30538 () Bool)

(assert (=> bm!30538 (= call!30539 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30539 () Bool)

(assert (=> bm!30539 (= call!30540 (contains!2532 lt!216180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!474446 () Bool)

(declare-fun e!278467 () Unit!13962)

(declare-fun lt!216168 () Unit!13962)

(assert (=> b!474446 (= e!278467 lt!216168)))

(declare-fun lt!216178 () ListLongMap!7725)

(assert (=> b!474446 (= lt!216178 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216173 () (_ BitVec 64))

(assert (=> b!474446 (= lt!216173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216176 () (_ BitVec 64))

(assert (=> b!474446 (= lt!216176 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216175 () Unit!13962)

(declare-fun addStillContains!292 (ListLongMap!7725 (_ BitVec 64) V!18963 (_ BitVec 64)) Unit!13962)

(assert (=> b!474446 (= lt!216175 (addStillContains!292 lt!216178 lt!216173 zeroValue!794 lt!216176))))

(assert (=> b!474446 (contains!2532 (+!1760 lt!216178 (tuple2!8811 lt!216173 zeroValue!794)) lt!216176)))

(declare-fun lt!216162 () Unit!13962)

(assert (=> b!474446 (= lt!216162 lt!216175)))

(declare-fun lt!216177 () ListLongMap!7725)

(assert (=> b!474446 (= lt!216177 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216165 () (_ BitVec 64))

(assert (=> b!474446 (= lt!216165 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216166 () (_ BitVec 64))

(assert (=> b!474446 (= lt!216166 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216161 () Unit!13962)

(declare-fun addApplyDifferent!292 (ListLongMap!7725 (_ BitVec 64) V!18963 (_ BitVec 64)) Unit!13962)

(assert (=> b!474446 (= lt!216161 (addApplyDifferent!292 lt!216177 lt!216165 minValueAfter!38 lt!216166))))

(assert (=> b!474446 (= (apply!333 (+!1760 lt!216177 (tuple2!8811 lt!216165 minValueAfter!38)) lt!216166) (apply!333 lt!216177 lt!216166))))

(declare-fun lt!216170 () Unit!13962)

(assert (=> b!474446 (= lt!216170 lt!216161)))

(declare-fun lt!216179 () ListLongMap!7725)

(assert (=> b!474446 (= lt!216179 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216169 () (_ BitVec 64))

(assert (=> b!474446 (= lt!216169 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216167 () (_ BitVec 64))

(assert (=> b!474446 (= lt!216167 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216181 () Unit!13962)

(assert (=> b!474446 (= lt!216181 (addApplyDifferent!292 lt!216179 lt!216169 zeroValue!794 lt!216167))))

(assert (=> b!474446 (= (apply!333 (+!1760 lt!216179 (tuple2!8811 lt!216169 zeroValue!794)) lt!216167) (apply!333 lt!216179 lt!216167))))

(declare-fun lt!216163 () Unit!13962)

(assert (=> b!474446 (= lt!216163 lt!216181)))

(declare-fun lt!216164 () ListLongMap!7725)

(assert (=> b!474446 (= lt!216164 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216171 () (_ BitVec 64))

(assert (=> b!474446 (= lt!216171 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216172 () (_ BitVec 64))

(assert (=> b!474446 (= lt!216172 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474446 (= lt!216168 (addApplyDifferent!292 lt!216164 lt!216171 minValueAfter!38 lt!216172))))

(assert (=> b!474446 (= (apply!333 (+!1760 lt!216164 (tuple2!8811 lt!216171 minValueAfter!38)) lt!216172) (apply!333 lt!216164 lt!216172))))

(declare-fun b!474438 () Bool)

(assert (=> b!474438 (= e!278476 call!30541)))

(declare-fun d!75593 () Bool)

(assert (=> d!75593 e!278465))

(declare-fun res!283394 () Bool)

(assert (=> d!75593 (=> (not res!283394) (not e!278465))))

(assert (=> d!75593 (= res!283394 (or (bvsge #b00000000000000000000000000000000 (size!15026 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))))

(declare-fun lt!216174 () ListLongMap!7725)

(assert (=> d!75593 (= lt!216180 lt!216174)))

(declare-fun lt!216160 () Unit!13962)

(assert (=> d!75593 (= lt!216160 e!278467)))

(declare-fun c!57101 () Bool)

(declare-fun e!278474 () Bool)

(assert (=> d!75593 (= c!57101 e!278474)))

(declare-fun res!283396 () Bool)

(assert (=> d!75593 (=> (not res!283396) (not e!278474))))

(assert (=> d!75593 (= res!283396 (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(assert (=> d!75593 (= lt!216174 e!278468)))

(declare-fun c!57099 () Bool)

(assert (=> d!75593 (= c!57099 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75593 (validMask!0 mask!1365)))

(assert (=> d!75593 (= (getCurrentListMap!2240 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216180)))

(declare-fun bm!30540 () Bool)

(assert (=> bm!30540 (= call!30538 (+!1760 (ite c!57099 call!30539 (ite c!57102 call!30544 call!30541)) (ite (or c!57099 c!57102) (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun bm!30541 () Bool)

(assert (=> bm!30541 (= call!30542 call!30538)))

(declare-fun b!474447 () Bool)

(assert (=> b!474447 (= e!278466 (not call!30543))))

(declare-fun b!474448 () Bool)

(declare-fun Unit!13968 () Unit!13962)

(assert (=> b!474448 (= e!278467 Unit!13968)))

(declare-fun b!474449 () Bool)

(declare-fun c!57104 () Bool)

(assert (=> b!474449 (= c!57104 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!474449 (= e!278469 e!278476)))

(declare-fun b!474450 () Bool)

(assert (=> b!474450 (= e!278474 (validKeyInArray!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474451 () Bool)

(assert (=> b!474451 (= e!278470 e!278473)))

(declare-fun res!283395 () Bool)

(assert (=> b!474451 (=> (not res!283395) (not e!278473))))

(assert (=> b!474451 (= res!283395 (contains!2532 lt!216180 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474451 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun b!474452 () Bool)

(declare-fun res!283393 () Bool)

(assert (=> b!474452 (=> (not res!283393) (not e!278465))))

(assert (=> b!474452 (= res!283393 e!278475)))

(declare-fun c!57100 () Bool)

(assert (=> b!474452 (= c!57100 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!75593 c!57099) b!474445))

(assert (= (and d!75593 (not c!57099)) b!474439))

(assert (= (and b!474439 c!57102) b!474435))

(assert (= (and b!474439 (not c!57102)) b!474449))

(assert (= (and b!474449 c!57104) b!474441))

(assert (= (and b!474449 (not c!57104)) b!474438))

(assert (= (or b!474441 b!474438) bm!30537))

(assert (= (or b!474435 bm!30537) bm!30536))

(assert (= (or b!474435 b!474441) bm!30541))

(assert (= (or b!474445 bm!30536) bm!30538))

(assert (= (or b!474445 bm!30541) bm!30540))

(assert (= (and d!75593 res!283396) b!474450))

(assert (= (and d!75593 c!57101) b!474446))

(assert (= (and d!75593 (not c!57101)) b!474448))

(assert (= (and d!75593 res!283394) b!474433))

(assert (= (and b!474433 res!283397) b!474436))

(assert (= (and b!474433 (not res!283389)) b!474451))

(assert (= (and b!474451 res!283395) b!474434))

(assert (= (and b!474433 res!283390) b!474452))

(assert (= (and b!474452 c!57100) b!474432))

(assert (= (and b!474452 (not c!57100)) b!474444))

(assert (= (and b!474432 res!283391) b!474440))

(assert (= (or b!474432 b!474444) bm!30539))

(assert (= (and b!474452 res!283393) b!474443))

(assert (= (and b!474443 c!57103) b!474437))

(assert (= (and b!474443 (not c!57103)) b!474447))

(assert (= (and b!474437 res!283392) b!474442))

(assert (= (or b!474437 b!474447) bm!30535))

(declare-fun b_lambda!10251 () Bool)

(assert (=> (not b_lambda!10251) (not b!474434)))

(assert (=> b!474434 t!14841))

(declare-fun b_and!20457 () Bool)

(assert (= b_and!20455 (and (=> t!14841 result!7443) b_and!20457)))

(assert (=> b!474436 m!456933))

(assert (=> b!474436 m!456933))

(assert (=> b!474436 m!456935))

(declare-fun m!456991 () Bool)

(assert (=> bm!30535 m!456991))

(assert (=> bm!30538 m!456847))

(declare-fun m!456993 () Bool)

(assert (=> b!474445 m!456993))

(declare-fun m!456995 () Bool)

(assert (=> bm!30540 m!456995))

(assert (=> b!474450 m!456933))

(assert (=> b!474450 m!456933))

(assert (=> b!474450 m!456935))

(declare-fun m!456997 () Bool)

(assert (=> b!474442 m!456997))

(declare-fun m!456999 () Bool)

(assert (=> bm!30539 m!456999))

(declare-fun m!457001 () Bool)

(assert (=> b!474440 m!457001))

(assert (=> b!474434 m!456943))

(assert (=> b!474434 m!456939))

(assert (=> b!474434 m!456945))

(assert (=> b!474434 m!456933))

(declare-fun m!457003 () Bool)

(assert (=> b!474434 m!457003))

(assert (=> b!474434 m!456939))

(assert (=> b!474434 m!456933))

(assert (=> b!474434 m!456943))

(assert (=> b!474451 m!456933))

(assert (=> b!474451 m!456933))

(declare-fun m!457005 () Bool)

(assert (=> b!474451 m!457005))

(declare-fun m!457007 () Bool)

(assert (=> b!474446 m!457007))

(declare-fun m!457009 () Bool)

(assert (=> b!474446 m!457009))

(declare-fun m!457011 () Bool)

(assert (=> b!474446 m!457011))

(declare-fun m!457013 () Bool)

(assert (=> b!474446 m!457013))

(declare-fun m!457015 () Bool)

(assert (=> b!474446 m!457015))

(declare-fun m!457017 () Bool)

(assert (=> b!474446 m!457017))

(declare-fun m!457019 () Bool)

(assert (=> b!474446 m!457019))

(declare-fun m!457021 () Bool)

(assert (=> b!474446 m!457021))

(assert (=> b!474446 m!456847))

(declare-fun m!457023 () Bool)

(assert (=> b!474446 m!457023))

(declare-fun m!457025 () Bool)

(assert (=> b!474446 m!457025))

(declare-fun m!457027 () Bool)

(assert (=> b!474446 m!457027))

(assert (=> b!474446 m!457007))

(declare-fun m!457029 () Bool)

(assert (=> b!474446 m!457029))

(assert (=> b!474446 m!457017))

(declare-fun m!457031 () Bool)

(assert (=> b!474446 m!457031))

(declare-fun m!457033 () Bool)

(assert (=> b!474446 m!457033))

(assert (=> b!474446 m!457031))

(declare-fun m!457035 () Bool)

(assert (=> b!474446 m!457035))

(assert (=> b!474446 m!456933))

(assert (=> b!474446 m!457013))

(assert (=> d!75593 m!456839))

(assert (=> b!474274 d!75593))

(declare-fun d!75595 () Bool)

(declare-fun e!278480 () Bool)

(assert (=> d!75595 e!278480))

(declare-fun res!283403 () Bool)

(assert (=> d!75595 (=> (not res!283403) (not e!278480))))

(declare-fun lt!216192 () ListLongMap!7725)

(assert (=> d!75595 (= res!283403 (contains!2532 lt!216192 (_1!4416 lt!216023)))))

(declare-fun lt!216190 () List!8871)

(assert (=> d!75595 (= lt!216192 (ListLongMap!7726 lt!216190))))

(declare-fun lt!216193 () Unit!13962)

(declare-fun lt!216191 () Unit!13962)

(assert (=> d!75595 (= lt!216193 lt!216191)))

(declare-datatypes ((Option!388 0))(
  ( (Some!387 (v!9037 V!18963)) (None!386) )
))
(declare-fun getValueByKey!382 (List!8871 (_ BitVec 64)) Option!388)

(assert (=> d!75595 (= (getValueByKey!382 lt!216190 (_1!4416 lt!216023)) (Some!387 (_2!4416 lt!216023)))))

(declare-fun lemmaContainsTupThenGetReturnValue!204 (List!8871 (_ BitVec 64) V!18963) Unit!13962)

(assert (=> d!75595 (= lt!216191 (lemmaContainsTupThenGetReturnValue!204 lt!216190 (_1!4416 lt!216023) (_2!4416 lt!216023)))))

(declare-fun insertStrictlySorted!207 (List!8871 (_ BitVec 64) V!18963) List!8871)

(assert (=> d!75595 (= lt!216190 (insertStrictlySorted!207 (toList!3878 lt!216020) (_1!4416 lt!216023) (_2!4416 lt!216023)))))

(assert (=> d!75595 (= (+!1760 lt!216020 lt!216023) lt!216192)))

(declare-fun b!474457 () Bool)

(declare-fun res!283402 () Bool)

(assert (=> b!474457 (=> (not res!283402) (not e!278480))))

(assert (=> b!474457 (= res!283402 (= (getValueByKey!382 (toList!3878 lt!216192) (_1!4416 lt!216023)) (Some!387 (_2!4416 lt!216023))))))

(declare-fun b!474458 () Bool)

(declare-fun contains!2533 (List!8871 tuple2!8810) Bool)

(assert (=> b!474458 (= e!278480 (contains!2533 (toList!3878 lt!216192) lt!216023))))

(assert (= (and d!75595 res!283403) b!474457))

(assert (= (and b!474457 res!283402) b!474458))

(declare-fun m!457037 () Bool)

(assert (=> d!75595 m!457037))

(declare-fun m!457039 () Bool)

(assert (=> d!75595 m!457039))

(declare-fun m!457041 () Bool)

(assert (=> d!75595 m!457041))

(declare-fun m!457043 () Bool)

(assert (=> d!75595 m!457043))

(declare-fun m!457045 () Bool)

(assert (=> b!474457 m!457045))

(declare-fun m!457047 () Bool)

(assert (=> b!474458 m!457047))

(assert (=> b!474274 d!75595))

(declare-fun d!75597 () Bool)

(declare-fun e!278481 () Bool)

(assert (=> d!75597 e!278481))

(declare-fun res!283405 () Bool)

(assert (=> d!75597 (=> (not res!283405) (not e!278481))))

(declare-fun lt!216196 () ListLongMap!7725)

(assert (=> d!75597 (= res!283405 (contains!2532 lt!216196 (_1!4416 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!216194 () List!8871)

(assert (=> d!75597 (= lt!216196 (ListLongMap!7726 lt!216194))))

(declare-fun lt!216197 () Unit!13962)

(declare-fun lt!216195 () Unit!13962)

(assert (=> d!75597 (= lt!216197 lt!216195)))

(assert (=> d!75597 (= (getValueByKey!382 lt!216194 (_1!4416 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!387 (_2!4416 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75597 (= lt!216195 (lemmaContainsTupThenGetReturnValue!204 lt!216194 (_1!4416 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4416 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75597 (= lt!216194 (insertStrictlySorted!207 (toList!3878 lt!216020) (_1!4416 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4416 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75597 (= (+!1760 lt!216020 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216196)))

(declare-fun b!474459 () Bool)

(declare-fun res!283404 () Bool)

(assert (=> b!474459 (=> (not res!283404) (not e!278481))))

(assert (=> b!474459 (= res!283404 (= (getValueByKey!382 (toList!3878 lt!216196) (_1!4416 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!387 (_2!4416 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!474460 () Bool)

(assert (=> b!474460 (= e!278481 (contains!2533 (toList!3878 lt!216196) (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75597 res!283405) b!474459))

(assert (= (and b!474459 res!283404) b!474460))

(declare-fun m!457049 () Bool)

(assert (=> d!75597 m!457049))

(declare-fun m!457051 () Bool)

(assert (=> d!75597 m!457051))

(declare-fun m!457053 () Bool)

(assert (=> d!75597 m!457053))

(declare-fun m!457055 () Bool)

(assert (=> d!75597 m!457055))

(declare-fun m!457057 () Bool)

(assert (=> b!474459 m!457057))

(declare-fun m!457059 () Bool)

(assert (=> b!474460 m!457059))

(assert (=> b!474274 d!75597))

(declare-fun d!75599 () Bool)

(assert (=> d!75599 (= (+!1760 lt!216020 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1760 (+!1760 lt!216020 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!216200 () Unit!13962)

(declare-fun choose!1361 (ListLongMap!7725 (_ BitVec 64) V!18963 V!18963) Unit!13962)

(assert (=> d!75599 (= lt!216200 (choose!1361 lt!216020 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75599 (= (addSameAsAddTwiceSameKeyDiffValues!162 lt!216020 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!216200)))

(declare-fun bs!15078 () Bool)

(assert (= bs!15078 d!75599))

(declare-fun m!457061 () Bool)

(assert (=> bs!15078 m!457061))

(assert (=> bs!15078 m!456863))

(assert (=> bs!15078 m!456863))

(declare-fun m!457063 () Bool)

(assert (=> bs!15078 m!457063))

(declare-fun m!457065 () Bool)

(assert (=> bs!15078 m!457065))

(assert (=> b!474274 d!75599))

(declare-fun d!75601 () Bool)

(declare-fun e!278482 () Bool)

(assert (=> d!75601 e!278482))

(declare-fun res!283407 () Bool)

(assert (=> d!75601 (=> (not res!283407) (not e!278482))))

(declare-fun lt!216203 () ListLongMap!7725)

(assert (=> d!75601 (= res!283407 (contains!2532 lt!216203 (_1!4416 (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(declare-fun lt!216201 () List!8871)

(assert (=> d!75601 (= lt!216203 (ListLongMap!7726 lt!216201))))

(declare-fun lt!216204 () Unit!13962)

(declare-fun lt!216202 () Unit!13962)

(assert (=> d!75601 (= lt!216204 lt!216202)))

(assert (=> d!75601 (= (getValueByKey!382 lt!216201 (_1!4416 (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!387 (_2!4416 (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75601 (= lt!216202 (lemmaContainsTupThenGetReturnValue!204 lt!216201 (_1!4416 (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4416 (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75601 (= lt!216201 (insertStrictlySorted!207 (toList!3878 lt!216024) (_1!4416 (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4416 (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75601 (= (+!1760 lt!216024 (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) lt!216203)))

(declare-fun b!474461 () Bool)

(declare-fun res!283406 () Bool)

(assert (=> b!474461 (=> (not res!283406) (not e!278482))))

(assert (=> b!474461 (= res!283406 (= (getValueByKey!382 (toList!3878 lt!216203) (_1!4416 (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!387 (_2!4416 (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))))

(declare-fun b!474462 () Bool)

(assert (=> b!474462 (= e!278482 (contains!2533 (toList!3878 lt!216203) (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(assert (= (and d!75601 res!283407) b!474461))

(assert (= (and b!474461 res!283406) b!474462))

(declare-fun m!457067 () Bool)

(assert (=> d!75601 m!457067))

(declare-fun m!457069 () Bool)

(assert (=> d!75601 m!457069))

(declare-fun m!457071 () Bool)

(assert (=> d!75601 m!457071))

(declare-fun m!457073 () Bool)

(assert (=> d!75601 m!457073))

(declare-fun m!457075 () Bool)

(assert (=> b!474461 m!457075))

(declare-fun m!457077 () Bool)

(assert (=> b!474462 m!457077))

(assert (=> b!474274 d!75601))

(declare-fun b!474463 () Bool)

(declare-fun e!278493 () Bool)

(declare-fun e!278495 () Bool)

(assert (=> b!474463 (= e!278493 e!278495)))

(declare-fun res!283410 () Bool)

(declare-fun call!30547 () Bool)

(assert (=> b!474463 (= res!283410 call!30547)))

(assert (=> b!474463 (=> (not res!283410) (not e!278495))))

(declare-fun bm!30542 () Bool)

(declare-fun call!30550 () Bool)

(declare-fun lt!216225 () ListLongMap!7725)

(assert (=> bm!30542 (= call!30550 (contains!2532 lt!216225 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!474464 () Bool)

(declare-fun res!283409 () Bool)

(declare-fun e!278483 () Bool)

(assert (=> b!474464 (=> (not res!283409) (not e!278483))))

(declare-fun e!278488 () Bool)

(assert (=> b!474464 (= res!283409 e!278488)))

(declare-fun res!283408 () Bool)

(assert (=> b!474464 (=> res!283408 e!278488)))

(declare-fun e!278490 () Bool)

(assert (=> b!474464 (= res!283408 (not e!278490))))

(declare-fun res!283416 () Bool)

(assert (=> b!474464 (=> (not res!283416) (not e!278490))))

(assert (=> b!474464 (= res!283416 (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun e!278491 () Bool)

(declare-fun b!474465 () Bool)

(assert (=> b!474465 (= e!278491 (= (apply!333 lt!216225 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)) (get!7137 (select (arr!14675 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!474465 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15027 _values!833)))))

(assert (=> b!474465 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun b!474466 () Bool)

(declare-fun e!278487 () ListLongMap!7725)

(declare-fun call!30549 () ListLongMap!7725)

(assert (=> b!474466 (= e!278487 call!30549)))

(declare-fun b!474467 () Bool)

(assert (=> b!474467 (= e!278490 (validKeyInArray!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474468 () Bool)

(declare-fun e!278484 () Bool)

(declare-fun e!278489 () Bool)

(assert (=> b!474468 (= e!278484 e!278489)))

(declare-fun res!283411 () Bool)

(assert (=> b!474468 (= res!283411 call!30550)))

(assert (=> b!474468 (=> (not res!283411) (not e!278489))))

(declare-fun b!474470 () Bool)

(declare-fun e!278486 () ListLongMap!7725)

(assert (=> b!474470 (= e!278486 e!278487)))

(declare-fun c!57108 () Bool)

(assert (=> b!474470 (= c!57108 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!474471 () Bool)

(assert (=> b!474471 (= e!278495 (= (apply!333 lt!216225 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!474472 () Bool)

(declare-fun e!278494 () ListLongMap!7725)

(assert (=> b!474472 (= e!278494 call!30549)))

(declare-fun bm!30543 () Bool)

(declare-fun call!30551 () ListLongMap!7725)

(declare-fun call!30546 () ListLongMap!7725)

(assert (=> bm!30543 (= call!30551 call!30546)))

(declare-fun b!474473 () Bool)

(assert (=> b!474473 (= e!278489 (= (apply!333 lt!216225 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!474474 () Bool)

(assert (=> b!474474 (= e!278483 e!278484)))

(declare-fun c!57109 () Bool)

(assert (=> b!474474 (= c!57109 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!474475 () Bool)

(assert (=> b!474475 (= e!278493 (not call!30547))))

(declare-fun bm!30544 () Bool)

(declare-fun call!30548 () ListLongMap!7725)

(assert (=> bm!30544 (= call!30548 call!30551)))

(declare-fun b!474476 () Bool)

(declare-fun call!30545 () ListLongMap!7725)

(assert (=> b!474476 (= e!278486 (+!1760 call!30545 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun bm!30545 () Bool)

(assert (=> bm!30545 (= call!30546 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30546 () Bool)

(assert (=> bm!30546 (= call!30547 (contains!2532 lt!216225 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!474477 () Bool)

(declare-fun e!278485 () Unit!13962)

(declare-fun lt!216213 () Unit!13962)

(assert (=> b!474477 (= e!278485 lt!216213)))

(declare-fun lt!216223 () ListLongMap!7725)

(assert (=> b!474477 (= lt!216223 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216218 () (_ BitVec 64))

(assert (=> b!474477 (= lt!216218 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216221 () (_ BitVec 64))

(assert (=> b!474477 (= lt!216221 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216220 () Unit!13962)

(assert (=> b!474477 (= lt!216220 (addStillContains!292 lt!216223 lt!216218 zeroValue!794 lt!216221))))

(assert (=> b!474477 (contains!2532 (+!1760 lt!216223 (tuple2!8811 lt!216218 zeroValue!794)) lt!216221)))

(declare-fun lt!216207 () Unit!13962)

(assert (=> b!474477 (= lt!216207 lt!216220)))

(declare-fun lt!216222 () ListLongMap!7725)

(assert (=> b!474477 (= lt!216222 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216210 () (_ BitVec 64))

(assert (=> b!474477 (= lt!216210 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216211 () (_ BitVec 64))

(assert (=> b!474477 (= lt!216211 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216206 () Unit!13962)

(assert (=> b!474477 (= lt!216206 (addApplyDifferent!292 lt!216222 lt!216210 minValueBefore!38 lt!216211))))

(assert (=> b!474477 (= (apply!333 (+!1760 lt!216222 (tuple2!8811 lt!216210 minValueBefore!38)) lt!216211) (apply!333 lt!216222 lt!216211))))

(declare-fun lt!216215 () Unit!13962)

(assert (=> b!474477 (= lt!216215 lt!216206)))

(declare-fun lt!216224 () ListLongMap!7725)

(assert (=> b!474477 (= lt!216224 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216214 () (_ BitVec 64))

(assert (=> b!474477 (= lt!216214 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216212 () (_ BitVec 64))

(assert (=> b!474477 (= lt!216212 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216226 () Unit!13962)

(assert (=> b!474477 (= lt!216226 (addApplyDifferent!292 lt!216224 lt!216214 zeroValue!794 lt!216212))))

(assert (=> b!474477 (= (apply!333 (+!1760 lt!216224 (tuple2!8811 lt!216214 zeroValue!794)) lt!216212) (apply!333 lt!216224 lt!216212))))

(declare-fun lt!216208 () Unit!13962)

(assert (=> b!474477 (= lt!216208 lt!216226)))

(declare-fun lt!216209 () ListLongMap!7725)

(assert (=> b!474477 (= lt!216209 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216216 () (_ BitVec 64))

(assert (=> b!474477 (= lt!216216 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216217 () (_ BitVec 64))

(assert (=> b!474477 (= lt!216217 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474477 (= lt!216213 (addApplyDifferent!292 lt!216209 lt!216216 minValueBefore!38 lt!216217))))

(assert (=> b!474477 (= (apply!333 (+!1760 lt!216209 (tuple2!8811 lt!216216 minValueBefore!38)) lt!216217) (apply!333 lt!216209 lt!216217))))

(declare-fun b!474469 () Bool)

(assert (=> b!474469 (= e!278494 call!30548)))

(declare-fun d!75603 () Bool)

(assert (=> d!75603 e!278483))

(declare-fun res!283413 () Bool)

(assert (=> d!75603 (=> (not res!283413) (not e!278483))))

(assert (=> d!75603 (= res!283413 (or (bvsge #b00000000000000000000000000000000 (size!15026 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))))

(declare-fun lt!216219 () ListLongMap!7725)

(assert (=> d!75603 (= lt!216225 lt!216219)))

(declare-fun lt!216205 () Unit!13962)

(assert (=> d!75603 (= lt!216205 e!278485)))

(declare-fun c!57107 () Bool)

(declare-fun e!278492 () Bool)

(assert (=> d!75603 (= c!57107 e!278492)))

(declare-fun res!283415 () Bool)

(assert (=> d!75603 (=> (not res!283415) (not e!278492))))

(assert (=> d!75603 (= res!283415 (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(assert (=> d!75603 (= lt!216219 e!278486)))

(declare-fun c!57105 () Bool)

(assert (=> d!75603 (= c!57105 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75603 (validMask!0 mask!1365)))

(assert (=> d!75603 (= (getCurrentListMap!2240 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216225)))

(declare-fun bm!30547 () Bool)

(assert (=> bm!30547 (= call!30545 (+!1760 (ite c!57105 call!30546 (ite c!57108 call!30551 call!30548)) (ite (or c!57105 c!57108) (tuple2!8811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun bm!30548 () Bool)

(assert (=> bm!30548 (= call!30549 call!30545)))

(declare-fun b!474478 () Bool)

(assert (=> b!474478 (= e!278484 (not call!30550))))

(declare-fun b!474479 () Bool)

(declare-fun Unit!13969 () Unit!13962)

(assert (=> b!474479 (= e!278485 Unit!13969)))

(declare-fun b!474480 () Bool)

(declare-fun c!57110 () Bool)

(assert (=> b!474480 (= c!57110 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!474480 (= e!278487 e!278494)))

(declare-fun b!474481 () Bool)

(assert (=> b!474481 (= e!278492 (validKeyInArray!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474482 () Bool)

(assert (=> b!474482 (= e!278488 e!278491)))

(declare-fun res!283414 () Bool)

(assert (=> b!474482 (=> (not res!283414) (not e!278491))))

(assert (=> b!474482 (= res!283414 (contains!2532 lt!216225 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474482 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(declare-fun b!474483 () Bool)

(declare-fun res!283412 () Bool)

(assert (=> b!474483 (=> (not res!283412) (not e!278483))))

(assert (=> b!474483 (= res!283412 e!278493)))

(declare-fun c!57106 () Bool)

(assert (=> b!474483 (= c!57106 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!75603 c!57105) b!474476))

(assert (= (and d!75603 (not c!57105)) b!474470))

(assert (= (and b!474470 c!57108) b!474466))

(assert (= (and b!474470 (not c!57108)) b!474480))

(assert (= (and b!474480 c!57110) b!474472))

(assert (= (and b!474480 (not c!57110)) b!474469))

(assert (= (or b!474472 b!474469) bm!30544))

(assert (= (or b!474466 bm!30544) bm!30543))

(assert (= (or b!474466 b!474472) bm!30548))

(assert (= (or b!474476 bm!30543) bm!30545))

(assert (= (or b!474476 bm!30548) bm!30547))

(assert (= (and d!75603 res!283415) b!474481))

(assert (= (and d!75603 c!57107) b!474477))

(assert (= (and d!75603 (not c!57107)) b!474479))

(assert (= (and d!75603 res!283413) b!474464))

(assert (= (and b!474464 res!283416) b!474467))

(assert (= (and b!474464 (not res!283408)) b!474482))

(assert (= (and b!474482 res!283414) b!474465))

(assert (= (and b!474464 res!283409) b!474483))

(assert (= (and b!474483 c!57106) b!474463))

(assert (= (and b!474483 (not c!57106)) b!474475))

(assert (= (and b!474463 res!283410) b!474471))

(assert (= (or b!474463 b!474475) bm!30546))

(assert (= (and b!474483 res!283412) b!474474))

(assert (= (and b!474474 c!57109) b!474468))

(assert (= (and b!474474 (not c!57109)) b!474478))

(assert (= (and b!474468 res!283411) b!474473))

(assert (= (or b!474468 b!474478) bm!30542))

(declare-fun b_lambda!10253 () Bool)

(assert (=> (not b_lambda!10253) (not b!474465)))

(assert (=> b!474465 t!14841))

(declare-fun b_and!20459 () Bool)

(assert (= b_and!20457 (and (=> t!14841 result!7443) b_and!20459)))

(assert (=> b!474467 m!456933))

(assert (=> b!474467 m!456933))

(assert (=> b!474467 m!456935))

(declare-fun m!457079 () Bool)

(assert (=> bm!30542 m!457079))

(assert (=> bm!30545 m!456849))

(declare-fun m!457081 () Bool)

(assert (=> b!474476 m!457081))

(declare-fun m!457083 () Bool)

(assert (=> bm!30547 m!457083))

(assert (=> b!474481 m!456933))

(assert (=> b!474481 m!456933))

(assert (=> b!474481 m!456935))

(declare-fun m!457085 () Bool)

(assert (=> b!474473 m!457085))

(declare-fun m!457087 () Bool)

(assert (=> bm!30546 m!457087))

(declare-fun m!457089 () Bool)

(assert (=> b!474471 m!457089))

(assert (=> b!474465 m!456943))

(assert (=> b!474465 m!456939))

(assert (=> b!474465 m!456945))

(assert (=> b!474465 m!456933))

(declare-fun m!457091 () Bool)

(assert (=> b!474465 m!457091))

(assert (=> b!474465 m!456939))

(assert (=> b!474465 m!456933))

(assert (=> b!474465 m!456943))

(assert (=> b!474482 m!456933))

(assert (=> b!474482 m!456933))

(declare-fun m!457093 () Bool)

(assert (=> b!474482 m!457093))

(declare-fun m!457095 () Bool)

(assert (=> b!474477 m!457095))

(declare-fun m!457097 () Bool)

(assert (=> b!474477 m!457097))

(declare-fun m!457099 () Bool)

(assert (=> b!474477 m!457099))

(declare-fun m!457101 () Bool)

(assert (=> b!474477 m!457101))

(declare-fun m!457103 () Bool)

(assert (=> b!474477 m!457103))

(declare-fun m!457105 () Bool)

(assert (=> b!474477 m!457105))

(declare-fun m!457107 () Bool)

(assert (=> b!474477 m!457107))

(declare-fun m!457109 () Bool)

(assert (=> b!474477 m!457109))

(assert (=> b!474477 m!456849))

(declare-fun m!457111 () Bool)

(assert (=> b!474477 m!457111))

(declare-fun m!457113 () Bool)

(assert (=> b!474477 m!457113))

(declare-fun m!457115 () Bool)

(assert (=> b!474477 m!457115))

(assert (=> b!474477 m!457095))

(declare-fun m!457117 () Bool)

(assert (=> b!474477 m!457117))

(assert (=> b!474477 m!457105))

(declare-fun m!457119 () Bool)

(assert (=> b!474477 m!457119))

(declare-fun m!457121 () Bool)

(assert (=> b!474477 m!457121))

(assert (=> b!474477 m!457119))

(declare-fun m!457123 () Bool)

(assert (=> b!474477 m!457123))

(assert (=> b!474477 m!456933))

(assert (=> b!474477 m!457101))

(assert (=> d!75603 m!456839))

(assert (=> b!474274 d!75603))

(declare-fun d!75605 () Bool)

(declare-fun e!278496 () Bool)

(assert (=> d!75605 e!278496))

(declare-fun res!283418 () Bool)

(assert (=> d!75605 (=> (not res!283418) (not e!278496))))

(declare-fun lt!216229 () ListLongMap!7725)

(assert (=> d!75605 (= res!283418 (contains!2532 lt!216229 (_1!4416 lt!216023)))))

(declare-fun lt!216227 () List!8871)

(assert (=> d!75605 (= lt!216229 (ListLongMap!7726 lt!216227))))

(declare-fun lt!216230 () Unit!13962)

(declare-fun lt!216228 () Unit!13962)

(assert (=> d!75605 (= lt!216230 lt!216228)))

(assert (=> d!75605 (= (getValueByKey!382 lt!216227 (_1!4416 lt!216023)) (Some!387 (_2!4416 lt!216023)))))

(assert (=> d!75605 (= lt!216228 (lemmaContainsTupThenGetReturnValue!204 lt!216227 (_1!4416 lt!216023) (_2!4416 lt!216023)))))

(assert (=> d!75605 (= lt!216227 (insertStrictlySorted!207 (toList!3878 (+!1760 lt!216020 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4416 lt!216023) (_2!4416 lt!216023)))))

(assert (=> d!75605 (= (+!1760 (+!1760 lt!216020 (tuple2!8811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216023) lt!216229)))

(declare-fun b!474484 () Bool)

(declare-fun res!283417 () Bool)

(assert (=> b!474484 (=> (not res!283417) (not e!278496))))

(assert (=> b!474484 (= res!283417 (= (getValueByKey!382 (toList!3878 lt!216229) (_1!4416 lt!216023)) (Some!387 (_2!4416 lt!216023))))))

(declare-fun b!474485 () Bool)

(assert (=> b!474485 (= e!278496 (contains!2533 (toList!3878 lt!216229) lt!216023))))

(assert (= (and d!75605 res!283418) b!474484))

(assert (= (and b!474484 res!283417) b!474485))

(declare-fun m!457125 () Bool)

(assert (=> d!75605 m!457125))

(declare-fun m!457127 () Bool)

(assert (=> d!75605 m!457127))

(declare-fun m!457129 () Bool)

(assert (=> d!75605 m!457129))

(declare-fun m!457131 () Bool)

(assert (=> d!75605 m!457131))

(declare-fun m!457133 () Bool)

(assert (=> b!474484 m!457133))

(declare-fun m!457135 () Bool)

(assert (=> b!474485 m!457135))

(assert (=> b!474274 d!75605))

(declare-fun b!474496 () Bool)

(declare-fun e!278507 () Bool)

(declare-fun e!278505 () Bool)

(assert (=> b!474496 (= e!278507 e!278505)))

(declare-fun c!57113 () Bool)

(assert (=> b!474496 (= c!57113 (validKeyInArray!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474497 () Bool)

(declare-fun call!30554 () Bool)

(assert (=> b!474497 (= e!278505 call!30554)))

(declare-fun b!474498 () Bool)

(declare-fun e!278508 () Bool)

(assert (=> b!474498 (= e!278508 e!278507)))

(declare-fun res!283426 () Bool)

(assert (=> b!474498 (=> (not res!283426) (not e!278507))))

(declare-fun e!278506 () Bool)

(assert (=> b!474498 (= res!283426 (not e!278506))))

(declare-fun res!283425 () Bool)

(assert (=> b!474498 (=> (not res!283425) (not e!278506))))

(assert (=> b!474498 (= res!283425 (validKeyInArray!0 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75607 () Bool)

(declare-fun res!283427 () Bool)

(assert (=> d!75607 (=> res!283427 e!278508)))

(assert (=> d!75607 (= res!283427 (bvsge #b00000000000000000000000000000000 (size!15026 _keys!1025)))))

(assert (=> d!75607 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8869) e!278508)))

(declare-fun b!474499 () Bool)

(declare-fun contains!2534 (List!8872 (_ BitVec 64)) Bool)

(assert (=> b!474499 (= e!278506 (contains!2534 Nil!8869 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474500 () Bool)

(assert (=> b!474500 (= e!278505 call!30554)))

(declare-fun bm!30551 () Bool)

(assert (=> bm!30551 (= call!30554 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57113 (Cons!8868 (select (arr!14674 _keys!1025) #b00000000000000000000000000000000) Nil!8869) Nil!8869)))))

(assert (= (and d!75607 (not res!283427)) b!474498))

(assert (= (and b!474498 res!283425) b!474499))

(assert (= (and b!474498 res!283426) b!474496))

(assert (= (and b!474496 c!57113) b!474497))

(assert (= (and b!474496 (not c!57113)) b!474500))

(assert (= (or b!474497 b!474500) bm!30551))

(assert (=> b!474496 m!456933))

(assert (=> b!474496 m!456933))

(assert (=> b!474496 m!456935))

(assert (=> b!474498 m!456933))

(assert (=> b!474498 m!456933))

(assert (=> b!474498 m!456935))

(assert (=> b!474499 m!456933))

(assert (=> b!474499 m!456933))

(declare-fun m!457137 () Bool)

(assert (=> b!474499 m!457137))

(assert (=> bm!30551 m!456933))

(declare-fun m!457139 () Bool)

(assert (=> bm!30551 m!457139))

(assert (=> b!474275 d!75607))

(declare-fun condMapEmpty!21814 () Bool)

(declare-fun mapDefault!21814 () ValueCell!6353)

(assert (=> mapNonEmpty!21805 (= condMapEmpty!21814 (= mapRest!21805 ((as const (Array (_ BitVec 32) ValueCell!6353)) mapDefault!21814)))))

(declare-fun e!278514 () Bool)

(declare-fun mapRes!21814 () Bool)

(assert (=> mapNonEmpty!21805 (= tp!41932 (and e!278514 mapRes!21814))))

(declare-fun mapIsEmpty!21814 () Bool)

(assert (=> mapIsEmpty!21814 mapRes!21814))

(declare-fun b!474508 () Bool)

(assert (=> b!474508 (= e!278514 tp_is_empty!13393)))

(declare-fun b!474507 () Bool)

(declare-fun e!278513 () Bool)

(assert (=> b!474507 (= e!278513 tp_is_empty!13393)))

(declare-fun mapNonEmpty!21814 () Bool)

(declare-fun tp!41947 () Bool)

(assert (=> mapNonEmpty!21814 (= mapRes!21814 (and tp!41947 e!278513))))

(declare-fun mapKey!21814 () (_ BitVec 32))

(declare-fun mapRest!21814 () (Array (_ BitVec 32) ValueCell!6353))

(declare-fun mapValue!21814 () ValueCell!6353)

(assert (=> mapNonEmpty!21814 (= mapRest!21805 (store mapRest!21814 mapKey!21814 mapValue!21814))))

(assert (= (and mapNonEmpty!21805 condMapEmpty!21814) mapIsEmpty!21814))

(assert (= (and mapNonEmpty!21805 (not condMapEmpty!21814)) mapNonEmpty!21814))

(assert (= (and mapNonEmpty!21814 ((_ is ValueCellFull!6353) mapValue!21814)) b!474507))

(assert (= (and mapNonEmpty!21805 ((_ is ValueCellFull!6353) mapDefault!21814)) b!474508))

(declare-fun m!457141 () Bool)

(assert (=> mapNonEmpty!21814 m!457141))

(declare-fun b_lambda!10255 () Bool)

(assert (= b_lambda!10251 (or (and start!42496 b_free!11965) b_lambda!10255)))

(declare-fun b_lambda!10257 () Bool)

(assert (= b_lambda!10249 (or (and start!42496 b_free!11965) b_lambda!10257)))

(declare-fun b_lambda!10259 () Bool)

(assert (= b_lambda!10253 (or (and start!42496 b_free!11965) b_lambda!10259)))

(declare-fun b_lambda!10261 () Bool)

(assert (= b_lambda!10245 (or (and start!42496 b_free!11965) b_lambda!10261)))

(declare-fun b_lambda!10263 () Bool)

(assert (= b_lambda!10247 (or (and start!42496 b_free!11965) b_lambda!10263)))

(declare-fun b_lambda!10265 () Bool)

(assert (= b_lambda!10243 (or (and start!42496 b_free!11965) b_lambda!10265)))

(check-sat (not b!474358) (not b!474440) (not bm!30538) (not bm!30545) (not b!474359) (not b!474361) (not d!75583) (not b_lambda!10257) (not b!474373) b_and!20459 (not bm!30535) (not bm!30517) (not d!75605) (not b!474442) (not b!474482) (not b!474465) (not b!474386) (not b!474477) (not b!474353) (not b_lambda!10261) (not b!474436) (not d!75599) (not bm!30539) (not b!474374) (not b!474496) (not bm!30520) (not b!474461) (not b_lambda!10265) (not b!474445) (not b!474363) (not b!474484) (not b!474451) (not b_lambda!10255) (not b!474355) (not b!474498) (not b!474471) (not b!474458) (not d!75597) (not b!474367) (not d!75581) (not b!474375) (not b!474388) (not bm!30516) (not b!474460) (not b!474362) (not bm!30546) (not b!474450) (not b!474376) (not d!75593) (not b!474462) (not b!474446) (not b!474372) tp_is_empty!13393 (not d!75579) (not bm!30542) (not b_next!11965) (not bm!30551) (not b_lambda!10259) (not b!474476) (not d!75595) (not b!474377) (not b!474369) (not b!474434) (not d!75603) (not b!474360) (not bm!30547) (not bm!30540) (not b!474467) (not b!474499) (not b_lambda!10263) (not b!474457) (not b!474473) (not d!75601) (not b!474485) (not mapNonEmpty!21814) (not b!474481) (not b!474459))
(check-sat b_and!20459 (not b_next!11965))
