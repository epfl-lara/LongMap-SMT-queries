; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42622 () Bool)

(assert start!42622)

(declare-fun b_free!12045 () Bool)

(declare-fun b_next!12045 () Bool)

(assert (=> start!42622 (= b_free!12045 (not b_next!12045))))

(declare-fun tp!42177 () Bool)

(declare-fun b_and!20533 () Bool)

(assert (=> start!42622 (= tp!42177 b_and!20533)))

(declare-fun b!475451 () Bool)

(declare-fun res!283926 () Bool)

(declare-fun e!279184 () Bool)

(assert (=> b!475451 (=> (not res!283926) (not e!279184))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30683 0))(
  ( (array!30684 (arr!14758 (Array (_ BitVec 32) (_ BitVec 64))) (size!15110 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30683)

(declare-datatypes ((V!19069 0))(
  ( (V!19070 (val!6781 Int)) )
))
(declare-datatypes ((ValueCell!6393 0))(
  ( (ValueCellFull!6393 (v!9074 V!19069)) (EmptyCell!6393) )
))
(declare-datatypes ((array!30685 0))(
  ( (array!30686 (arr!14759 (Array (_ BitVec 32) ValueCell!6393)) (size!15111 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30685)

(declare-fun mask!1365 () (_ BitVec 32))

(assert (=> b!475451 (= res!283926 (and (= (size!15111 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15110 _keys!1025) (size!15111 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun minValueBefore!38 () V!19069)

(declare-fun zeroValue!794 () V!19069)

(declare-fun defaultEntry!841 () Int)

(declare-fun b!475452 () Bool)

(declare-fun e!279180 () Bool)

(declare-fun minValueAfter!38 () V!19069)

(declare-datatypes ((tuple2!8940 0))(
  ( (tuple2!8941 (_1!4481 (_ BitVec 64)) (_2!4481 V!19069)) )
))
(declare-datatypes ((List!9019 0))(
  ( (Nil!9016) (Cons!9015 (h!9871 tuple2!8940) (t!14995 List!9019)) )
))
(declare-datatypes ((ListLongMap!7853 0))(
  ( (ListLongMap!7854 (toList!3942 List!9019)) )
))
(declare-fun +!1756 (ListLongMap!7853 tuple2!8940) ListLongMap!7853)

(declare-fun getCurrentListMap!2284 (array!30683 array!30685 (_ BitVec 32) (_ BitVec 32) V!19069 V!19069 (_ BitVec 32) Int) ListLongMap!7853)

(assert (=> b!475452 (= e!279180 (= (+!1756 (getCurrentListMap!2284 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2284 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun b!475453 () Bool)

(declare-fun res!283924 () Bool)

(assert (=> b!475453 (=> (not res!283924) (not e!279184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30683 (_ BitVec 32)) Bool)

(assert (=> b!475453 (= res!283924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475454 () Bool)

(declare-fun res!283925 () Bool)

(assert (=> b!475454 (=> (not res!283925) (not e!279184))))

(declare-datatypes ((List!9020 0))(
  ( (Nil!9017) (Cons!9016 (h!9872 (_ BitVec 64)) (t!14996 List!9020)) )
))
(declare-fun arrayNoDuplicates!0 (array!30683 (_ BitVec 32) List!9020) Bool)

(assert (=> b!475454 (= res!283925 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9017))))

(declare-fun b!475455 () Bool)

(assert (=> b!475455 (= e!279184 (not e!279180))))

(declare-fun res!283927 () Bool)

(assert (=> b!475455 (=> res!283927 e!279180)))

(assert (=> b!475455 (= res!283927 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!216496 () ListLongMap!7853)

(declare-fun lt!216497 () ListLongMap!7853)

(assert (=> b!475455 (= lt!216496 lt!216497)))

(declare-datatypes ((Unit!14004 0))(
  ( (Unit!14005) )
))
(declare-fun lt!216498 () Unit!14004)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!258 (array!30683 array!30685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19069 V!19069 V!19069 V!19069 (_ BitVec 32) Int) Unit!14004)

(assert (=> b!475455 (= lt!216498 (lemmaNoChangeToArrayThenSameMapNoExtras!258 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2098 (array!30683 array!30685 (_ BitVec 32) (_ BitVec 32) V!19069 V!19069 (_ BitVec 32) Int) ListLongMap!7853)

(assert (=> b!475455 (= lt!216497 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475455 (= lt!216496 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!283923 () Bool)

(assert (=> start!42622 (=> (not res!283923) (not e!279184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42622 (= res!283923 (validMask!0 mask!1365))))

(assert (=> start!42622 e!279184))

(declare-fun tp_is_empty!13473 () Bool)

(assert (=> start!42622 tp_is_empty!13473))

(assert (=> start!42622 tp!42177))

(assert (=> start!42622 true))

(declare-fun array_inv!10650 (array!30683) Bool)

(assert (=> start!42622 (array_inv!10650 _keys!1025)))

(declare-fun e!279182 () Bool)

(declare-fun array_inv!10651 (array!30685) Bool)

(assert (=> start!42622 (and (array_inv!10651 _values!833) e!279182)))

(declare-fun mapNonEmpty!21931 () Bool)

(declare-fun mapRes!21931 () Bool)

(declare-fun tp!42178 () Bool)

(declare-fun e!279181 () Bool)

(assert (=> mapNonEmpty!21931 (= mapRes!21931 (and tp!42178 e!279181))))

(declare-fun mapValue!21931 () ValueCell!6393)

(declare-fun mapKey!21931 () (_ BitVec 32))

(declare-fun mapRest!21931 () (Array (_ BitVec 32) ValueCell!6393))

(assert (=> mapNonEmpty!21931 (= (arr!14759 _values!833) (store mapRest!21931 mapKey!21931 mapValue!21931))))

(declare-fun b!475456 () Bool)

(assert (=> b!475456 (= e!279181 tp_is_empty!13473)))

(declare-fun b!475457 () Bool)

(declare-fun e!279179 () Bool)

(assert (=> b!475457 (= e!279179 tp_is_empty!13473)))

(declare-fun b!475458 () Bool)

(assert (=> b!475458 (= e!279182 (and e!279179 mapRes!21931))))

(declare-fun condMapEmpty!21931 () Bool)

(declare-fun mapDefault!21931 () ValueCell!6393)

(assert (=> b!475458 (= condMapEmpty!21931 (= (arr!14759 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6393)) mapDefault!21931)))))

(declare-fun mapIsEmpty!21931 () Bool)

(assert (=> mapIsEmpty!21931 mapRes!21931))

(assert (= (and start!42622 res!283923) b!475451))

(assert (= (and b!475451 res!283926) b!475453))

(assert (= (and b!475453 res!283924) b!475454))

(assert (= (and b!475454 res!283925) b!475455))

(assert (= (and b!475455 (not res!283927)) b!475452))

(assert (= (and b!475458 condMapEmpty!21931) mapIsEmpty!21931))

(assert (= (and b!475458 (not condMapEmpty!21931)) mapNonEmpty!21931))

(get-info :version)

(assert (= (and mapNonEmpty!21931 ((_ is ValueCellFull!6393) mapValue!21931)) b!475456))

(assert (= (and b!475458 ((_ is ValueCellFull!6393) mapDefault!21931)) b!475457))

(assert (= start!42622 b!475458))

(declare-fun m!457631 () Bool)

(assert (=> start!42622 m!457631))

(declare-fun m!457633 () Bool)

(assert (=> start!42622 m!457633))

(declare-fun m!457635 () Bool)

(assert (=> start!42622 m!457635))

(declare-fun m!457637 () Bool)

(assert (=> b!475455 m!457637))

(declare-fun m!457639 () Bool)

(assert (=> b!475455 m!457639))

(declare-fun m!457641 () Bool)

(assert (=> b!475455 m!457641))

(declare-fun m!457643 () Bool)

(assert (=> b!475452 m!457643))

(assert (=> b!475452 m!457643))

(declare-fun m!457645 () Bool)

(assert (=> b!475452 m!457645))

(declare-fun m!457647 () Bool)

(assert (=> b!475452 m!457647))

(declare-fun m!457649 () Bool)

(assert (=> mapNonEmpty!21931 m!457649))

(declare-fun m!457651 () Bool)

(assert (=> b!475454 m!457651))

(declare-fun m!457653 () Bool)

(assert (=> b!475453 m!457653))

(check-sat tp_is_empty!13473 (not b!475453) (not b!475454) b_and!20533 (not b_next!12045) (not start!42622) (not mapNonEmpty!21931) (not b!475455) (not b!475452))
(check-sat b_and!20533 (not b_next!12045))
(get-model)

(declare-fun d!75621 () Bool)

(assert (=> d!75621 (= (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216510 () Unit!14004)

(declare-fun choose!1355 (array!30683 array!30685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19069 V!19069 V!19069 V!19069 (_ BitVec 32) Int) Unit!14004)

(assert (=> d!75621 (= lt!216510 (choose!1355 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75621 (validMask!0 mask!1365)))

(assert (=> d!75621 (= (lemmaNoChangeToArrayThenSameMapNoExtras!258 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216510)))

(declare-fun bs!15102 () Bool)

(assert (= bs!15102 d!75621))

(assert (=> bs!15102 m!457641))

(assert (=> bs!15102 m!457639))

(declare-fun m!457679 () Bool)

(assert (=> bs!15102 m!457679))

(assert (=> bs!15102 m!457631))

(assert (=> b!475455 d!75621))

(declare-fun b!475507 () Bool)

(declare-fun e!279221 () Bool)

(declare-fun lt!216530 () ListLongMap!7853)

(assert (=> b!475507 (= e!279221 (= lt!216530 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475508 () Bool)

(declare-fun e!279219 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!475508 (= e!279219 (validKeyInArray!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475508 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475509 () Bool)

(declare-fun res!283954 () Bool)

(declare-fun e!279223 () Bool)

(assert (=> b!475509 (=> (not res!283954) (not e!279223))))

(declare-fun contains!2556 (ListLongMap!7853 (_ BitVec 64)) Bool)

(assert (=> b!475509 (= res!283954 (not (contains!2556 lt!216530 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475510 () Bool)

(declare-fun e!279217 () Bool)

(assert (=> b!475510 (= e!279223 e!279217)))

(declare-fun c!57173 () Bool)

(assert (=> b!475510 (= c!57173 e!279219)))

(declare-fun res!283953 () Bool)

(assert (=> b!475510 (=> (not res!283953) (not e!279219))))

(assert (=> b!475510 (= res!283953 (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun b!475511 () Bool)

(declare-fun e!279222 () ListLongMap!7853)

(assert (=> b!475511 (= e!279222 (ListLongMap!7854 Nil!9016))))

(declare-fun d!75623 () Bool)

(assert (=> d!75623 e!279223))

(declare-fun res!283951 () Bool)

(assert (=> d!75623 (=> (not res!283951) (not e!279223))))

(assert (=> d!75623 (= res!283951 (not (contains!2556 lt!216530 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75623 (= lt!216530 e!279222)))

(declare-fun c!57171 () Bool)

(assert (=> d!75623 (= c!57171 (bvsge #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(assert (=> d!75623 (validMask!0 mask!1365)))

(assert (=> d!75623 (= (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216530)))

(declare-fun b!475512 () Bool)

(declare-fun isEmpty!582 (ListLongMap!7853) Bool)

(assert (=> b!475512 (= e!279221 (isEmpty!582 lt!216530))))

(declare-fun b!475513 () Bool)

(declare-fun e!279220 () Bool)

(assert (=> b!475513 (= e!279217 e!279220)))

(assert (=> b!475513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun res!283952 () Bool)

(assert (=> b!475513 (= res!283952 (contains!2556 lt!216530 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475513 (=> (not res!283952) (not e!279220))))

(declare-fun b!475514 () Bool)

(assert (=> b!475514 (= e!279217 e!279221)))

(declare-fun c!57174 () Bool)

(assert (=> b!475514 (= c!57174 (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun b!475515 () Bool)

(declare-fun lt!216529 () Unit!14004)

(declare-fun lt!216526 () Unit!14004)

(assert (=> b!475515 (= lt!216529 lt!216526)))

(declare-fun lt!216528 () V!19069)

(declare-fun lt!216531 () (_ BitVec 64))

(declare-fun lt!216527 () (_ BitVec 64))

(declare-fun lt!216525 () ListLongMap!7853)

(assert (=> b!475515 (not (contains!2556 (+!1756 lt!216525 (tuple2!8941 lt!216531 lt!216528)) lt!216527))))

(declare-fun addStillNotContains!168 (ListLongMap!7853 (_ BitVec 64) V!19069 (_ BitVec 64)) Unit!14004)

(assert (=> b!475515 (= lt!216526 (addStillNotContains!168 lt!216525 lt!216531 lt!216528 lt!216527))))

(assert (=> b!475515 (= lt!216527 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!7162 (ValueCell!6393 V!19069) V!19069)

(declare-fun dynLambda!928 (Int (_ BitVec 64)) V!19069)

(assert (=> b!475515 (= lt!216528 (get!7162 (select (arr!14759 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475515 (= lt!216531 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30581 () ListLongMap!7853)

(assert (=> b!475515 (= lt!216525 call!30581)))

(declare-fun e!279218 () ListLongMap!7853)

(assert (=> b!475515 (= e!279218 (+!1756 call!30581 (tuple2!8941 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000) (get!7162 (select (arr!14759 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30578 () Bool)

(assert (=> bm!30578 (= call!30581 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475516 () Bool)

(assert (=> b!475516 (= e!279222 e!279218)))

(declare-fun c!57172 () Bool)

(assert (=> b!475516 (= c!57172 (validKeyInArray!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475517 () Bool)

(assert (=> b!475517 (= e!279218 call!30581)))

(declare-fun b!475518 () Bool)

(assert (=> b!475518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(assert (=> b!475518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15111 _values!833)))))

(declare-fun apply!335 (ListLongMap!7853 (_ BitVec 64)) V!19069)

(assert (=> b!475518 (= e!279220 (= (apply!335 lt!216530 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)) (get!7162 (select (arr!14759 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!75623 c!57171) b!475511))

(assert (= (and d!75623 (not c!57171)) b!475516))

(assert (= (and b!475516 c!57172) b!475515))

(assert (= (and b!475516 (not c!57172)) b!475517))

(assert (= (or b!475515 b!475517) bm!30578))

(assert (= (and d!75623 res!283951) b!475509))

(assert (= (and b!475509 res!283954) b!475510))

(assert (= (and b!475510 res!283953) b!475508))

(assert (= (and b!475510 c!57173) b!475513))

(assert (= (and b!475510 (not c!57173)) b!475514))

(assert (= (and b!475513 res!283952) b!475518))

(assert (= (and b!475514 c!57174) b!475507))

(assert (= (and b!475514 (not c!57174)) b!475512))

(declare-fun b_lambda!10269 () Bool)

(assert (=> (not b_lambda!10269) (not b!475515)))

(declare-fun t!14999 () Bool)

(declare-fun tb!3935 () Bool)

(assert (=> (and start!42622 (= defaultEntry!841 defaultEntry!841) t!14999) tb!3935))

(declare-fun result!7463 () Bool)

(assert (=> tb!3935 (= result!7463 tp_is_empty!13473)))

(assert (=> b!475515 t!14999))

(declare-fun b_and!20537 () Bool)

(assert (= b_and!20533 (and (=> t!14999 result!7463) b_and!20537)))

(declare-fun b_lambda!10271 () Bool)

(assert (=> (not b_lambda!10271) (not b!475518)))

(assert (=> b!475518 t!14999))

(declare-fun b_and!20539 () Bool)

(assert (= b_and!20537 (and (=> t!14999 result!7463) b_and!20539)))

(declare-fun m!457681 () Bool)

(assert (=> d!75623 m!457681))

(assert (=> d!75623 m!457631))

(declare-fun m!457683 () Bool)

(assert (=> b!475509 m!457683))

(declare-fun m!457685 () Bool)

(assert (=> b!475515 m!457685))

(declare-fun m!457687 () Bool)

(assert (=> b!475515 m!457687))

(declare-fun m!457689 () Bool)

(assert (=> b!475515 m!457689))

(declare-fun m!457691 () Bool)

(assert (=> b!475515 m!457691))

(assert (=> b!475515 m!457687))

(declare-fun m!457693 () Bool)

(assert (=> b!475515 m!457693))

(declare-fun m!457695 () Bool)

(assert (=> b!475515 m!457695))

(declare-fun m!457697 () Bool)

(assert (=> b!475515 m!457697))

(assert (=> b!475515 m!457693))

(assert (=> b!475515 m!457689))

(declare-fun m!457699 () Bool)

(assert (=> b!475515 m!457699))

(assert (=> b!475508 m!457691))

(assert (=> b!475508 m!457691))

(declare-fun m!457701 () Bool)

(assert (=> b!475508 m!457701))

(assert (=> b!475516 m!457691))

(assert (=> b!475516 m!457691))

(assert (=> b!475516 m!457701))

(declare-fun m!457703 () Bool)

(assert (=> b!475512 m!457703))

(assert (=> b!475518 m!457687))

(assert (=> b!475518 m!457691))

(assert (=> b!475518 m!457687))

(assert (=> b!475518 m!457693))

(assert (=> b!475518 m!457695))

(assert (=> b!475518 m!457691))

(declare-fun m!457705 () Bool)

(assert (=> b!475518 m!457705))

(assert (=> b!475518 m!457693))

(assert (=> b!475513 m!457691))

(assert (=> b!475513 m!457691))

(declare-fun m!457707 () Bool)

(assert (=> b!475513 m!457707))

(declare-fun m!457709 () Bool)

(assert (=> b!475507 m!457709))

(assert (=> bm!30578 m!457709))

(assert (=> b!475455 d!75623))

(declare-fun b!475521 () Bool)

(declare-fun e!279228 () Bool)

(declare-fun lt!216537 () ListLongMap!7853)

(assert (=> b!475521 (= e!279228 (= lt!216537 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475522 () Bool)

(declare-fun e!279226 () Bool)

(assert (=> b!475522 (= e!279226 (validKeyInArray!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475522 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475523 () Bool)

(declare-fun res!283958 () Bool)

(declare-fun e!279230 () Bool)

(assert (=> b!475523 (=> (not res!283958) (not e!279230))))

(assert (=> b!475523 (= res!283958 (not (contains!2556 lt!216537 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475524 () Bool)

(declare-fun e!279224 () Bool)

(assert (=> b!475524 (= e!279230 e!279224)))

(declare-fun c!57177 () Bool)

(assert (=> b!475524 (= c!57177 e!279226)))

(declare-fun res!283957 () Bool)

(assert (=> b!475524 (=> (not res!283957) (not e!279226))))

(assert (=> b!475524 (= res!283957 (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun b!475525 () Bool)

(declare-fun e!279229 () ListLongMap!7853)

(assert (=> b!475525 (= e!279229 (ListLongMap!7854 Nil!9016))))

(declare-fun d!75625 () Bool)

(assert (=> d!75625 e!279230))

(declare-fun res!283955 () Bool)

(assert (=> d!75625 (=> (not res!283955) (not e!279230))))

(assert (=> d!75625 (= res!283955 (not (contains!2556 lt!216537 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75625 (= lt!216537 e!279229)))

(declare-fun c!57175 () Bool)

(assert (=> d!75625 (= c!57175 (bvsge #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(assert (=> d!75625 (validMask!0 mask!1365)))

(assert (=> d!75625 (= (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216537)))

(declare-fun b!475526 () Bool)

(assert (=> b!475526 (= e!279228 (isEmpty!582 lt!216537))))

(declare-fun b!475527 () Bool)

(declare-fun e!279227 () Bool)

(assert (=> b!475527 (= e!279224 e!279227)))

(assert (=> b!475527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun res!283956 () Bool)

(assert (=> b!475527 (= res!283956 (contains!2556 lt!216537 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475527 (=> (not res!283956) (not e!279227))))

(declare-fun b!475528 () Bool)

(assert (=> b!475528 (= e!279224 e!279228)))

(declare-fun c!57178 () Bool)

(assert (=> b!475528 (= c!57178 (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun b!475529 () Bool)

(declare-fun lt!216536 () Unit!14004)

(declare-fun lt!216533 () Unit!14004)

(assert (=> b!475529 (= lt!216536 lt!216533)))

(declare-fun lt!216535 () V!19069)

(declare-fun lt!216534 () (_ BitVec 64))

(declare-fun lt!216538 () (_ BitVec 64))

(declare-fun lt!216532 () ListLongMap!7853)

(assert (=> b!475529 (not (contains!2556 (+!1756 lt!216532 (tuple2!8941 lt!216538 lt!216535)) lt!216534))))

(assert (=> b!475529 (= lt!216533 (addStillNotContains!168 lt!216532 lt!216538 lt!216535 lt!216534))))

(assert (=> b!475529 (= lt!216534 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475529 (= lt!216535 (get!7162 (select (arr!14759 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475529 (= lt!216538 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30582 () ListLongMap!7853)

(assert (=> b!475529 (= lt!216532 call!30582)))

(declare-fun e!279225 () ListLongMap!7853)

(assert (=> b!475529 (= e!279225 (+!1756 call!30582 (tuple2!8941 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000) (get!7162 (select (arr!14759 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30579 () Bool)

(assert (=> bm!30579 (= call!30582 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475530 () Bool)

(assert (=> b!475530 (= e!279229 e!279225)))

(declare-fun c!57176 () Bool)

(assert (=> b!475530 (= c!57176 (validKeyInArray!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475531 () Bool)

(assert (=> b!475531 (= e!279225 call!30582)))

(declare-fun b!475532 () Bool)

(assert (=> b!475532 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(assert (=> b!475532 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15111 _values!833)))))

(assert (=> b!475532 (= e!279227 (= (apply!335 lt!216537 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)) (get!7162 (select (arr!14759 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!75625 c!57175) b!475525))

(assert (= (and d!75625 (not c!57175)) b!475530))

(assert (= (and b!475530 c!57176) b!475529))

(assert (= (and b!475530 (not c!57176)) b!475531))

(assert (= (or b!475529 b!475531) bm!30579))

(assert (= (and d!75625 res!283955) b!475523))

(assert (= (and b!475523 res!283958) b!475524))

(assert (= (and b!475524 res!283957) b!475522))

(assert (= (and b!475524 c!57177) b!475527))

(assert (= (and b!475524 (not c!57177)) b!475528))

(assert (= (and b!475527 res!283956) b!475532))

(assert (= (and b!475528 c!57178) b!475521))

(assert (= (and b!475528 (not c!57178)) b!475526))

(declare-fun b_lambda!10273 () Bool)

(assert (=> (not b_lambda!10273) (not b!475529)))

(assert (=> b!475529 t!14999))

(declare-fun b_and!20541 () Bool)

(assert (= b_and!20539 (and (=> t!14999 result!7463) b_and!20541)))

(declare-fun b_lambda!10275 () Bool)

(assert (=> (not b_lambda!10275) (not b!475532)))

(assert (=> b!475532 t!14999))

(declare-fun b_and!20543 () Bool)

(assert (= b_and!20541 (and (=> t!14999 result!7463) b_and!20543)))

(declare-fun m!457711 () Bool)

(assert (=> d!75625 m!457711))

(assert (=> d!75625 m!457631))

(declare-fun m!457713 () Bool)

(assert (=> b!475523 m!457713))

(declare-fun m!457715 () Bool)

(assert (=> b!475529 m!457715))

(assert (=> b!475529 m!457687))

(declare-fun m!457717 () Bool)

(assert (=> b!475529 m!457717))

(assert (=> b!475529 m!457691))

(assert (=> b!475529 m!457687))

(assert (=> b!475529 m!457693))

(assert (=> b!475529 m!457695))

(declare-fun m!457719 () Bool)

(assert (=> b!475529 m!457719))

(assert (=> b!475529 m!457693))

(assert (=> b!475529 m!457717))

(declare-fun m!457721 () Bool)

(assert (=> b!475529 m!457721))

(assert (=> b!475522 m!457691))

(assert (=> b!475522 m!457691))

(assert (=> b!475522 m!457701))

(assert (=> b!475530 m!457691))

(assert (=> b!475530 m!457691))

(assert (=> b!475530 m!457701))

(declare-fun m!457723 () Bool)

(assert (=> b!475526 m!457723))

(assert (=> b!475532 m!457687))

(assert (=> b!475532 m!457691))

(assert (=> b!475532 m!457687))

(assert (=> b!475532 m!457693))

(assert (=> b!475532 m!457695))

(assert (=> b!475532 m!457691))

(declare-fun m!457725 () Bool)

(assert (=> b!475532 m!457725))

(assert (=> b!475532 m!457693))

(assert (=> b!475527 m!457691))

(assert (=> b!475527 m!457691))

(declare-fun m!457727 () Bool)

(assert (=> b!475527 m!457727))

(declare-fun m!457729 () Bool)

(assert (=> b!475521 m!457729))

(assert (=> bm!30579 m!457729))

(assert (=> b!475455 d!75625))

(declare-fun b!475543 () Bool)

(declare-fun e!279242 () Bool)

(declare-fun call!30585 () Bool)

(assert (=> b!475543 (= e!279242 call!30585)))

(declare-fun b!475544 () Bool)

(assert (=> b!475544 (= e!279242 call!30585)))

(declare-fun b!475545 () Bool)

(declare-fun e!279240 () Bool)

(declare-fun contains!2557 (List!9020 (_ BitVec 64)) Bool)

(assert (=> b!475545 (= e!279240 (contains!2557 Nil!9017 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75627 () Bool)

(declare-fun res!283967 () Bool)

(declare-fun e!279241 () Bool)

(assert (=> d!75627 (=> res!283967 e!279241)))

(assert (=> d!75627 (= res!283967 (bvsge #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(assert (=> d!75627 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9017) e!279241)))

(declare-fun b!475546 () Bool)

(declare-fun e!279239 () Bool)

(assert (=> b!475546 (= e!279241 e!279239)))

(declare-fun res!283966 () Bool)

(assert (=> b!475546 (=> (not res!283966) (not e!279239))))

(assert (=> b!475546 (= res!283966 (not e!279240))))

(declare-fun res!283965 () Bool)

(assert (=> b!475546 (=> (not res!283965) (not e!279240))))

(assert (=> b!475546 (= res!283965 (validKeyInArray!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30582 () Bool)

(declare-fun c!57181 () Bool)

(assert (=> bm!30582 (= call!30585 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57181 (Cons!9016 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000) Nil!9017) Nil!9017)))))

(declare-fun b!475547 () Bool)

(assert (=> b!475547 (= e!279239 e!279242)))

(assert (=> b!475547 (= c!57181 (validKeyInArray!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75627 (not res!283967)) b!475546))

(assert (= (and b!475546 res!283965) b!475545))

(assert (= (and b!475546 res!283966) b!475547))

(assert (= (and b!475547 c!57181) b!475543))

(assert (= (and b!475547 (not c!57181)) b!475544))

(assert (= (or b!475543 b!475544) bm!30582))

(assert (=> b!475545 m!457691))

(assert (=> b!475545 m!457691))

(declare-fun m!457731 () Bool)

(assert (=> b!475545 m!457731))

(assert (=> b!475546 m!457691))

(assert (=> b!475546 m!457691))

(assert (=> b!475546 m!457701))

(assert (=> bm!30582 m!457691))

(declare-fun m!457733 () Bool)

(assert (=> bm!30582 m!457733))

(assert (=> b!475547 m!457691))

(assert (=> b!475547 m!457691))

(assert (=> b!475547 m!457701))

(assert (=> b!475454 d!75627))

(declare-fun d!75629 () Bool)

(assert (=> d!75629 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42622 d!75629))

(declare-fun d!75631 () Bool)

(assert (=> d!75631 (= (array_inv!10650 _keys!1025) (bvsge (size!15110 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42622 d!75631))

(declare-fun d!75633 () Bool)

(assert (=> d!75633 (= (array_inv!10651 _values!833) (bvsge (size!15111 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42622 d!75633))

(declare-fun bm!30585 () Bool)

(declare-fun call!30588 () Bool)

(assert (=> bm!30585 (= call!30588 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!475556 () Bool)

(declare-fun e!279249 () Bool)

(declare-fun e!279251 () Bool)

(assert (=> b!475556 (= e!279249 e!279251)))

(declare-fun c!57184 () Bool)

(assert (=> b!475556 (= c!57184 (validKeyInArray!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475557 () Bool)

(assert (=> b!475557 (= e!279251 call!30588)))

(declare-fun d!75635 () Bool)

(declare-fun res!283972 () Bool)

(assert (=> d!75635 (=> res!283972 e!279249)))

(assert (=> d!75635 (= res!283972 (bvsge #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(assert (=> d!75635 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279249)))

(declare-fun b!475558 () Bool)

(declare-fun e!279250 () Bool)

(assert (=> b!475558 (= e!279250 call!30588)))

(declare-fun b!475559 () Bool)

(assert (=> b!475559 (= e!279251 e!279250)))

(declare-fun lt!216546 () (_ BitVec 64))

(assert (=> b!475559 (= lt!216546 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216547 () Unit!14004)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30683 (_ BitVec 64) (_ BitVec 32)) Unit!14004)

(assert (=> b!475559 (= lt!216547 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216546 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!475559 (arrayContainsKey!0 _keys!1025 lt!216546 #b00000000000000000000000000000000)))

(declare-fun lt!216545 () Unit!14004)

(assert (=> b!475559 (= lt!216545 lt!216547)))

(declare-fun res!283973 () Bool)

(declare-datatypes ((SeekEntryResult!3559 0))(
  ( (MissingZero!3559 (index!16415 (_ BitVec 32))) (Found!3559 (index!16416 (_ BitVec 32))) (Intermediate!3559 (undefined!4371 Bool) (index!16417 (_ BitVec 32)) (x!44636 (_ BitVec 32))) (Undefined!3559) (MissingVacant!3559 (index!16418 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30683 (_ BitVec 32)) SeekEntryResult!3559)

(assert (=> b!475559 (= res!283973 (= (seekEntryOrOpen!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3559 #b00000000000000000000000000000000)))))

(assert (=> b!475559 (=> (not res!283973) (not e!279250))))

(assert (= (and d!75635 (not res!283972)) b!475556))

(assert (= (and b!475556 c!57184) b!475559))

(assert (= (and b!475556 (not c!57184)) b!475557))

(assert (= (and b!475559 res!283973) b!475558))

(assert (= (or b!475558 b!475557) bm!30585))

(declare-fun m!457735 () Bool)

(assert (=> bm!30585 m!457735))

(assert (=> b!475556 m!457691))

(assert (=> b!475556 m!457691))

(assert (=> b!475556 m!457701))

(assert (=> b!475559 m!457691))

(declare-fun m!457737 () Bool)

(assert (=> b!475559 m!457737))

(declare-fun m!457739 () Bool)

(assert (=> b!475559 m!457739))

(assert (=> b!475559 m!457691))

(declare-fun m!457741 () Bool)

(assert (=> b!475559 m!457741))

(assert (=> b!475453 d!75635))

(declare-fun d!75637 () Bool)

(declare-fun e!279254 () Bool)

(assert (=> d!75637 e!279254))

(declare-fun res!283979 () Bool)

(assert (=> d!75637 (=> (not res!283979) (not e!279254))))

(declare-fun lt!216557 () ListLongMap!7853)

(assert (=> d!75637 (= res!283979 (contains!2556 lt!216557 (_1!4481 (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!216556 () List!9019)

(assert (=> d!75637 (= lt!216557 (ListLongMap!7854 lt!216556))))

(declare-fun lt!216559 () Unit!14004)

(declare-fun lt!216558 () Unit!14004)

(assert (=> d!75637 (= lt!216559 lt!216558)))

(declare-datatypes ((Option!388 0))(
  ( (Some!387 (v!9076 V!19069)) (None!386) )
))
(declare-fun getValueByKey!382 (List!9019 (_ BitVec 64)) Option!388)

(assert (=> d!75637 (= (getValueByKey!382 lt!216556 (_1!4481 (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!387 (_2!4481 (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!204 (List!9019 (_ BitVec 64) V!19069) Unit!14004)

(assert (=> d!75637 (= lt!216558 (lemmaContainsTupThenGetReturnValue!204 lt!216556 (_1!4481 (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4481 (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!207 (List!9019 (_ BitVec 64) V!19069) List!9019)

(assert (=> d!75637 (= lt!216556 (insertStrictlySorted!207 (toList!3942 (getCurrentListMap!2284 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4481 (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4481 (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!75637 (= (+!1756 (getCurrentListMap!2284 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!216557)))

(declare-fun b!475564 () Bool)

(declare-fun res!283978 () Bool)

(assert (=> b!475564 (=> (not res!283978) (not e!279254))))

(assert (=> b!475564 (= res!283978 (= (getValueByKey!382 (toList!3942 lt!216557) (_1!4481 (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!387 (_2!4481 (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!475565 () Bool)

(declare-fun contains!2558 (List!9019 tuple2!8940) Bool)

(assert (=> b!475565 (= e!279254 (contains!2558 (toList!3942 lt!216557) (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75637 res!283979) b!475564))

(assert (= (and b!475564 res!283978) b!475565))

(declare-fun m!457743 () Bool)

(assert (=> d!75637 m!457743))

(declare-fun m!457745 () Bool)

(assert (=> d!75637 m!457745))

(declare-fun m!457747 () Bool)

(assert (=> d!75637 m!457747))

(declare-fun m!457749 () Bool)

(assert (=> d!75637 m!457749))

(declare-fun m!457751 () Bool)

(assert (=> b!475564 m!457751))

(declare-fun m!457753 () Bool)

(assert (=> b!475565 m!457753))

(assert (=> b!475452 d!75637))

(declare-fun b!475608 () Bool)

(declare-fun e!279282 () Bool)

(declare-fun call!30605 () Bool)

(assert (=> b!475608 (= e!279282 (not call!30605))))

(declare-fun b!475609 () Bool)

(declare-fun e!279286 () ListLongMap!7853)

(declare-fun call!30609 () ListLongMap!7853)

(assert (=> b!475609 (= e!279286 call!30609)))

(declare-fun b!475610 () Bool)

(declare-fun e!279285 () Unit!14004)

(declare-fun Unit!14008 () Unit!14004)

(assert (=> b!475610 (= e!279285 Unit!14008)))

(declare-fun bm!30600 () Bool)

(declare-fun call!30603 () ListLongMap!7853)

(declare-fun call!30604 () ListLongMap!7853)

(assert (=> bm!30600 (= call!30603 call!30604)))

(declare-fun b!475611 () Bool)

(declare-fun e!279289 () Bool)

(declare-fun lt!216608 () ListLongMap!7853)

(assert (=> b!475611 (= e!279289 (= (apply!335 lt!216608 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!475612 () Bool)

(declare-fun e!279293 () Bool)

(assert (=> b!475612 (= e!279293 (validKeyInArray!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75639 () Bool)

(declare-fun e!279281 () Bool)

(assert (=> d!75639 e!279281))

(declare-fun res!284004 () Bool)

(assert (=> d!75639 (=> (not res!284004) (not e!279281))))

(assert (=> d!75639 (= res!284004 (or (bvsge #b00000000000000000000000000000000 (size!15110 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))))

(declare-fun lt!216625 () ListLongMap!7853)

(assert (=> d!75639 (= lt!216608 lt!216625)))

(declare-fun lt!216609 () Unit!14004)

(assert (=> d!75639 (= lt!216609 e!279285)))

(declare-fun c!57199 () Bool)

(declare-fun e!279283 () Bool)

(assert (=> d!75639 (= c!57199 e!279283)))

(declare-fun res!283999 () Bool)

(assert (=> d!75639 (=> (not res!283999) (not e!279283))))

(assert (=> d!75639 (= res!283999 (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun e!279288 () ListLongMap!7853)

(assert (=> d!75639 (= lt!216625 e!279288)))

(declare-fun c!57197 () Bool)

(assert (=> d!75639 (= c!57197 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75639 (validMask!0 mask!1365)))

(assert (=> d!75639 (= (getCurrentListMap!2284 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216608)))

(declare-fun b!475613 () Bool)

(assert (=> b!475613 (= e!279281 e!279282)))

(declare-fun c!57200 () Bool)

(assert (=> b!475613 (= c!57200 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475614 () Bool)

(declare-fun e!279287 () ListLongMap!7853)

(assert (=> b!475614 (= e!279287 call!30609)))

(declare-fun b!475615 () Bool)

(assert (=> b!475615 (= e!279282 e!279289)))

(declare-fun res!283998 () Bool)

(assert (=> b!475615 (= res!283998 call!30605)))

(assert (=> b!475615 (=> (not res!283998) (not e!279289))))

(declare-fun b!475616 () Bool)

(assert (=> b!475616 (= e!279286 call!30603)))

(declare-fun b!475617 () Bool)

(declare-fun e!279291 () Bool)

(assert (=> b!475617 (= e!279291 (= (apply!335 lt!216608 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475618 () Bool)

(declare-fun lt!216604 () Unit!14004)

(assert (=> b!475618 (= e!279285 lt!216604)))

(declare-fun lt!216624 () ListLongMap!7853)

(assert (=> b!475618 (= lt!216624 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216610 () (_ BitVec 64))

(assert (=> b!475618 (= lt!216610 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216621 () (_ BitVec 64))

(assert (=> b!475618 (= lt!216621 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216620 () Unit!14004)

(declare-fun addStillContains!293 (ListLongMap!7853 (_ BitVec 64) V!19069 (_ BitVec 64)) Unit!14004)

(assert (=> b!475618 (= lt!216620 (addStillContains!293 lt!216624 lt!216610 zeroValue!794 lt!216621))))

(assert (=> b!475618 (contains!2556 (+!1756 lt!216624 (tuple2!8941 lt!216610 zeroValue!794)) lt!216621)))

(declare-fun lt!216623 () Unit!14004)

(assert (=> b!475618 (= lt!216623 lt!216620)))

(declare-fun lt!216615 () ListLongMap!7853)

(assert (=> b!475618 (= lt!216615 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216619 () (_ BitVec 64))

(assert (=> b!475618 (= lt!216619 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216614 () (_ BitVec 64))

(assert (=> b!475618 (= lt!216614 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216618 () Unit!14004)

(declare-fun addApplyDifferent!293 (ListLongMap!7853 (_ BitVec 64) V!19069 (_ BitVec 64)) Unit!14004)

(assert (=> b!475618 (= lt!216618 (addApplyDifferent!293 lt!216615 lt!216619 minValueBefore!38 lt!216614))))

(assert (=> b!475618 (= (apply!335 (+!1756 lt!216615 (tuple2!8941 lt!216619 minValueBefore!38)) lt!216614) (apply!335 lt!216615 lt!216614))))

(declare-fun lt!216622 () Unit!14004)

(assert (=> b!475618 (= lt!216622 lt!216618)))

(declare-fun lt!216607 () ListLongMap!7853)

(assert (=> b!475618 (= lt!216607 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216605 () (_ BitVec 64))

(assert (=> b!475618 (= lt!216605 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216606 () (_ BitVec 64))

(assert (=> b!475618 (= lt!216606 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216617 () Unit!14004)

(assert (=> b!475618 (= lt!216617 (addApplyDifferent!293 lt!216607 lt!216605 zeroValue!794 lt!216606))))

(assert (=> b!475618 (= (apply!335 (+!1756 lt!216607 (tuple2!8941 lt!216605 zeroValue!794)) lt!216606) (apply!335 lt!216607 lt!216606))))

(declare-fun lt!216611 () Unit!14004)

(assert (=> b!475618 (= lt!216611 lt!216617)))

(declare-fun lt!216616 () ListLongMap!7853)

(assert (=> b!475618 (= lt!216616 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216612 () (_ BitVec 64))

(assert (=> b!475618 (= lt!216612 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216613 () (_ BitVec 64))

(assert (=> b!475618 (= lt!216613 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475618 (= lt!216604 (addApplyDifferent!293 lt!216616 lt!216612 minValueBefore!38 lt!216613))))

(assert (=> b!475618 (= (apply!335 (+!1756 lt!216616 (tuple2!8941 lt!216612 minValueBefore!38)) lt!216613) (apply!335 lt!216616 lt!216613))))

(declare-fun call!30608 () ListLongMap!7853)

(declare-fun c!57202 () Bool)

(declare-fun call!30607 () ListLongMap!7853)

(declare-fun bm!30601 () Bool)

(assert (=> bm!30601 (= call!30607 (+!1756 (ite c!57197 call!30608 (ite c!57202 call!30604 call!30603)) (ite (or c!57197 c!57202) (tuple2!8941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!475619 () Bool)

(declare-fun res!284003 () Bool)

(assert (=> b!475619 (=> (not res!284003) (not e!279281))))

(declare-fun e!279292 () Bool)

(assert (=> b!475619 (= res!284003 e!279292)))

(declare-fun res!284002 () Bool)

(assert (=> b!475619 (=> res!284002 e!279292)))

(assert (=> b!475619 (= res!284002 (not e!279293))))

(declare-fun res!284006 () Bool)

(assert (=> b!475619 (=> (not res!284006) (not e!279293))))

(assert (=> b!475619 (= res!284006 (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun b!475620 () Bool)

(declare-fun e!279290 () Bool)

(assert (=> b!475620 (= e!279290 e!279291)))

(declare-fun res!284000 () Bool)

(declare-fun call!30606 () Bool)

(assert (=> b!475620 (= res!284000 call!30606)))

(assert (=> b!475620 (=> (not res!284000) (not e!279291))))

(declare-fun b!475621 () Bool)

(declare-fun e!279284 () Bool)

(assert (=> b!475621 (= e!279292 e!279284)))

(declare-fun res!284001 () Bool)

(assert (=> b!475621 (=> (not res!284001) (not e!279284))))

(assert (=> b!475621 (= res!284001 (contains!2556 lt!216608 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475621 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun b!475622 () Bool)

(assert (=> b!475622 (= e!279290 (not call!30606))))

(declare-fun b!475623 () Bool)

(assert (=> b!475623 (= e!279288 (+!1756 call!30607 (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!475624 () Bool)

(assert (=> b!475624 (= e!279284 (= (apply!335 lt!216608 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)) (get!7162 (select (arr!14759 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15111 _values!833)))))

(assert (=> b!475624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun b!475625 () Bool)

(declare-fun c!57198 () Bool)

(assert (=> b!475625 (= c!57198 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!475625 (= e!279287 e!279286)))

(declare-fun b!475626 () Bool)

(declare-fun res!284005 () Bool)

(assert (=> b!475626 (=> (not res!284005) (not e!279281))))

(assert (=> b!475626 (= res!284005 e!279290)))

(declare-fun c!57201 () Bool)

(assert (=> b!475626 (= c!57201 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30602 () Bool)

(assert (=> bm!30602 (= call!30609 call!30607)))

(declare-fun bm!30603 () Bool)

(assert (=> bm!30603 (= call!30605 (contains!2556 lt!216608 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30604 () Bool)

(assert (=> bm!30604 (= call!30604 call!30608)))

(declare-fun bm!30605 () Bool)

(assert (=> bm!30605 (= call!30606 (contains!2556 lt!216608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!475627 () Bool)

(assert (=> b!475627 (= e!279283 (validKeyInArray!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30606 () Bool)

(assert (=> bm!30606 (= call!30608 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475628 () Bool)

(assert (=> b!475628 (= e!279288 e!279287)))

(assert (=> b!475628 (= c!57202 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!75639 c!57197) b!475623))

(assert (= (and d!75639 (not c!57197)) b!475628))

(assert (= (and b!475628 c!57202) b!475614))

(assert (= (and b!475628 (not c!57202)) b!475625))

(assert (= (and b!475625 c!57198) b!475609))

(assert (= (and b!475625 (not c!57198)) b!475616))

(assert (= (or b!475609 b!475616) bm!30600))

(assert (= (or b!475614 bm!30600) bm!30604))

(assert (= (or b!475614 b!475609) bm!30602))

(assert (= (or b!475623 bm!30604) bm!30606))

(assert (= (or b!475623 bm!30602) bm!30601))

(assert (= (and d!75639 res!283999) b!475627))

(assert (= (and d!75639 c!57199) b!475618))

(assert (= (and d!75639 (not c!57199)) b!475610))

(assert (= (and d!75639 res!284004) b!475619))

(assert (= (and b!475619 res!284006) b!475612))

(assert (= (and b!475619 (not res!284002)) b!475621))

(assert (= (and b!475621 res!284001) b!475624))

(assert (= (and b!475619 res!284003) b!475626))

(assert (= (and b!475626 c!57201) b!475620))

(assert (= (and b!475626 (not c!57201)) b!475622))

(assert (= (and b!475620 res!284000) b!475617))

(assert (= (or b!475620 b!475622) bm!30605))

(assert (= (and b!475626 res!284005) b!475613))

(assert (= (and b!475613 c!57200) b!475615))

(assert (= (and b!475613 (not c!57200)) b!475608))

(assert (= (and b!475615 res!283998) b!475611))

(assert (= (or b!475615 b!475608) bm!30603))

(declare-fun b_lambda!10277 () Bool)

(assert (=> (not b_lambda!10277) (not b!475624)))

(assert (=> b!475624 t!14999))

(declare-fun b_and!20545 () Bool)

(assert (= b_and!20543 (and (=> t!14999 result!7463) b_and!20545)))

(declare-fun m!457755 () Bool)

(assert (=> bm!30603 m!457755))

(assert (=> b!475621 m!457691))

(assert (=> b!475621 m!457691))

(declare-fun m!457757 () Bool)

(assert (=> b!475621 m!457757))

(declare-fun m!457759 () Bool)

(assert (=> b!475623 m!457759))

(declare-fun m!457761 () Bool)

(assert (=> b!475611 m!457761))

(declare-fun m!457763 () Bool)

(assert (=> b!475618 m!457763))

(declare-fun m!457765 () Bool)

(assert (=> b!475618 m!457765))

(declare-fun m!457767 () Bool)

(assert (=> b!475618 m!457767))

(declare-fun m!457769 () Bool)

(assert (=> b!475618 m!457769))

(declare-fun m!457771 () Bool)

(assert (=> b!475618 m!457771))

(declare-fun m!457773 () Bool)

(assert (=> b!475618 m!457773))

(assert (=> b!475618 m!457691))

(declare-fun m!457775 () Bool)

(assert (=> b!475618 m!457775))

(assert (=> b!475618 m!457771))

(declare-fun m!457777 () Bool)

(assert (=> b!475618 m!457777))

(assert (=> b!475618 m!457763))

(declare-fun m!457779 () Bool)

(assert (=> b!475618 m!457779))

(declare-fun m!457781 () Bool)

(assert (=> b!475618 m!457781))

(declare-fun m!457783 () Bool)

(assert (=> b!475618 m!457783))

(assert (=> b!475618 m!457641))

(declare-fun m!457785 () Bool)

(assert (=> b!475618 m!457785))

(declare-fun m!457787 () Bool)

(assert (=> b!475618 m!457787))

(assert (=> b!475618 m!457785))

(declare-fun m!457789 () Bool)

(assert (=> b!475618 m!457789))

(assert (=> b!475618 m!457767))

(declare-fun m!457791 () Bool)

(assert (=> b!475618 m!457791))

(declare-fun m!457793 () Bool)

(assert (=> bm!30605 m!457793))

(assert (=> bm!30606 m!457641))

(assert (=> b!475624 m!457687))

(assert (=> b!475624 m!457693))

(assert (=> b!475624 m!457695))

(assert (=> b!475624 m!457693))

(assert (=> b!475624 m!457691))

(declare-fun m!457795 () Bool)

(assert (=> b!475624 m!457795))

(assert (=> b!475624 m!457691))

(assert (=> b!475624 m!457687))

(assert (=> b!475627 m!457691))

(assert (=> b!475627 m!457691))

(assert (=> b!475627 m!457701))

(assert (=> b!475612 m!457691))

(assert (=> b!475612 m!457691))

(assert (=> b!475612 m!457701))

(declare-fun m!457797 () Bool)

(assert (=> bm!30601 m!457797))

(declare-fun m!457799 () Bool)

(assert (=> b!475617 m!457799))

(assert (=> d!75639 m!457631))

(assert (=> b!475452 d!75639))

(declare-fun b!475629 () Bool)

(declare-fun e!279295 () Bool)

(declare-fun call!30612 () Bool)

(assert (=> b!475629 (= e!279295 (not call!30612))))

(declare-fun b!475630 () Bool)

(declare-fun e!279299 () ListLongMap!7853)

(declare-fun call!30616 () ListLongMap!7853)

(assert (=> b!475630 (= e!279299 call!30616)))

(declare-fun b!475631 () Bool)

(declare-fun e!279298 () Unit!14004)

(declare-fun Unit!14009 () Unit!14004)

(assert (=> b!475631 (= e!279298 Unit!14009)))

(declare-fun bm!30607 () Bool)

(declare-fun call!30610 () ListLongMap!7853)

(declare-fun call!30611 () ListLongMap!7853)

(assert (=> bm!30607 (= call!30610 call!30611)))

(declare-fun b!475632 () Bool)

(declare-fun e!279302 () Bool)

(declare-fun lt!216630 () ListLongMap!7853)

(assert (=> b!475632 (= e!279302 (= (apply!335 lt!216630 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!475633 () Bool)

(declare-fun e!279306 () Bool)

(assert (=> b!475633 (= e!279306 (validKeyInArray!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75641 () Bool)

(declare-fun e!279294 () Bool)

(assert (=> d!75641 e!279294))

(declare-fun res!284013 () Bool)

(assert (=> d!75641 (=> (not res!284013) (not e!279294))))

(assert (=> d!75641 (= res!284013 (or (bvsge #b00000000000000000000000000000000 (size!15110 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))))

(declare-fun lt!216647 () ListLongMap!7853)

(assert (=> d!75641 (= lt!216630 lt!216647)))

(declare-fun lt!216631 () Unit!14004)

(assert (=> d!75641 (= lt!216631 e!279298)))

(declare-fun c!57205 () Bool)

(declare-fun e!279296 () Bool)

(assert (=> d!75641 (= c!57205 e!279296)))

(declare-fun res!284008 () Bool)

(assert (=> d!75641 (=> (not res!284008) (not e!279296))))

(assert (=> d!75641 (= res!284008 (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun e!279301 () ListLongMap!7853)

(assert (=> d!75641 (= lt!216647 e!279301)))

(declare-fun c!57203 () Bool)

(assert (=> d!75641 (= c!57203 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75641 (validMask!0 mask!1365)))

(assert (=> d!75641 (= (getCurrentListMap!2284 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216630)))

(declare-fun b!475634 () Bool)

(assert (=> b!475634 (= e!279294 e!279295)))

(declare-fun c!57206 () Bool)

(assert (=> b!475634 (= c!57206 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475635 () Bool)

(declare-fun e!279300 () ListLongMap!7853)

(assert (=> b!475635 (= e!279300 call!30616)))

(declare-fun b!475636 () Bool)

(assert (=> b!475636 (= e!279295 e!279302)))

(declare-fun res!284007 () Bool)

(assert (=> b!475636 (= res!284007 call!30612)))

(assert (=> b!475636 (=> (not res!284007) (not e!279302))))

(declare-fun b!475637 () Bool)

(assert (=> b!475637 (= e!279299 call!30610)))

(declare-fun b!475638 () Bool)

(declare-fun e!279304 () Bool)

(assert (=> b!475638 (= e!279304 (= (apply!335 lt!216630 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475639 () Bool)

(declare-fun lt!216626 () Unit!14004)

(assert (=> b!475639 (= e!279298 lt!216626)))

(declare-fun lt!216646 () ListLongMap!7853)

(assert (=> b!475639 (= lt!216646 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216632 () (_ BitVec 64))

(assert (=> b!475639 (= lt!216632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216643 () (_ BitVec 64))

(assert (=> b!475639 (= lt!216643 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216642 () Unit!14004)

(assert (=> b!475639 (= lt!216642 (addStillContains!293 lt!216646 lt!216632 zeroValue!794 lt!216643))))

(assert (=> b!475639 (contains!2556 (+!1756 lt!216646 (tuple2!8941 lt!216632 zeroValue!794)) lt!216643)))

(declare-fun lt!216645 () Unit!14004)

(assert (=> b!475639 (= lt!216645 lt!216642)))

(declare-fun lt!216637 () ListLongMap!7853)

(assert (=> b!475639 (= lt!216637 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216641 () (_ BitVec 64))

(assert (=> b!475639 (= lt!216641 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216636 () (_ BitVec 64))

(assert (=> b!475639 (= lt!216636 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216640 () Unit!14004)

(assert (=> b!475639 (= lt!216640 (addApplyDifferent!293 lt!216637 lt!216641 minValueAfter!38 lt!216636))))

(assert (=> b!475639 (= (apply!335 (+!1756 lt!216637 (tuple2!8941 lt!216641 minValueAfter!38)) lt!216636) (apply!335 lt!216637 lt!216636))))

(declare-fun lt!216644 () Unit!14004)

(assert (=> b!475639 (= lt!216644 lt!216640)))

(declare-fun lt!216629 () ListLongMap!7853)

(assert (=> b!475639 (= lt!216629 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216627 () (_ BitVec 64))

(assert (=> b!475639 (= lt!216627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216628 () (_ BitVec 64))

(assert (=> b!475639 (= lt!216628 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216639 () Unit!14004)

(assert (=> b!475639 (= lt!216639 (addApplyDifferent!293 lt!216629 lt!216627 zeroValue!794 lt!216628))))

(assert (=> b!475639 (= (apply!335 (+!1756 lt!216629 (tuple2!8941 lt!216627 zeroValue!794)) lt!216628) (apply!335 lt!216629 lt!216628))))

(declare-fun lt!216633 () Unit!14004)

(assert (=> b!475639 (= lt!216633 lt!216639)))

(declare-fun lt!216638 () ListLongMap!7853)

(assert (=> b!475639 (= lt!216638 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216634 () (_ BitVec 64))

(assert (=> b!475639 (= lt!216634 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216635 () (_ BitVec 64))

(assert (=> b!475639 (= lt!216635 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475639 (= lt!216626 (addApplyDifferent!293 lt!216638 lt!216634 minValueAfter!38 lt!216635))))

(assert (=> b!475639 (= (apply!335 (+!1756 lt!216638 (tuple2!8941 lt!216634 minValueAfter!38)) lt!216635) (apply!335 lt!216638 lt!216635))))

(declare-fun bm!30608 () Bool)

(declare-fun call!30615 () ListLongMap!7853)

(declare-fun call!30614 () ListLongMap!7853)

(declare-fun c!57208 () Bool)

(assert (=> bm!30608 (= call!30614 (+!1756 (ite c!57203 call!30615 (ite c!57208 call!30611 call!30610)) (ite (or c!57203 c!57208) (tuple2!8941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!475640 () Bool)

(declare-fun res!284012 () Bool)

(assert (=> b!475640 (=> (not res!284012) (not e!279294))))

(declare-fun e!279305 () Bool)

(assert (=> b!475640 (= res!284012 e!279305)))

(declare-fun res!284011 () Bool)

(assert (=> b!475640 (=> res!284011 e!279305)))

(assert (=> b!475640 (= res!284011 (not e!279306))))

(declare-fun res!284015 () Bool)

(assert (=> b!475640 (=> (not res!284015) (not e!279306))))

(assert (=> b!475640 (= res!284015 (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun b!475641 () Bool)

(declare-fun e!279303 () Bool)

(assert (=> b!475641 (= e!279303 e!279304)))

(declare-fun res!284009 () Bool)

(declare-fun call!30613 () Bool)

(assert (=> b!475641 (= res!284009 call!30613)))

(assert (=> b!475641 (=> (not res!284009) (not e!279304))))

(declare-fun b!475642 () Bool)

(declare-fun e!279297 () Bool)

(assert (=> b!475642 (= e!279305 e!279297)))

(declare-fun res!284010 () Bool)

(assert (=> b!475642 (=> (not res!284010) (not e!279297))))

(assert (=> b!475642 (= res!284010 (contains!2556 lt!216630 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun b!475643 () Bool)

(assert (=> b!475643 (= e!279303 (not call!30613))))

(declare-fun b!475644 () Bool)

(assert (=> b!475644 (= e!279301 (+!1756 call!30614 (tuple2!8941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!475645 () Bool)

(assert (=> b!475645 (= e!279297 (= (apply!335 lt!216630 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)) (get!7162 (select (arr!14759 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475645 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15111 _values!833)))))

(assert (=> b!475645 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15110 _keys!1025)))))

(declare-fun b!475646 () Bool)

(declare-fun c!57204 () Bool)

(assert (=> b!475646 (= c!57204 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!475646 (= e!279300 e!279299)))

(declare-fun b!475647 () Bool)

(declare-fun res!284014 () Bool)

(assert (=> b!475647 (=> (not res!284014) (not e!279294))))

(assert (=> b!475647 (= res!284014 e!279303)))

(declare-fun c!57207 () Bool)

(assert (=> b!475647 (= c!57207 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30609 () Bool)

(assert (=> bm!30609 (= call!30616 call!30614)))

(declare-fun bm!30610 () Bool)

(assert (=> bm!30610 (= call!30612 (contains!2556 lt!216630 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30611 () Bool)

(assert (=> bm!30611 (= call!30611 call!30615)))

(declare-fun bm!30612 () Bool)

(assert (=> bm!30612 (= call!30613 (contains!2556 lt!216630 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!475648 () Bool)

(assert (=> b!475648 (= e!279296 (validKeyInArray!0 (select (arr!14758 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30613 () Bool)

(assert (=> bm!30613 (= call!30615 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475649 () Bool)

(assert (=> b!475649 (= e!279301 e!279300)))

(assert (=> b!475649 (= c!57208 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!75641 c!57203) b!475644))

(assert (= (and d!75641 (not c!57203)) b!475649))

(assert (= (and b!475649 c!57208) b!475635))

(assert (= (and b!475649 (not c!57208)) b!475646))

(assert (= (and b!475646 c!57204) b!475630))

(assert (= (and b!475646 (not c!57204)) b!475637))

(assert (= (or b!475630 b!475637) bm!30607))

(assert (= (or b!475635 bm!30607) bm!30611))

(assert (= (or b!475635 b!475630) bm!30609))

(assert (= (or b!475644 bm!30611) bm!30613))

(assert (= (or b!475644 bm!30609) bm!30608))

(assert (= (and d!75641 res!284008) b!475648))

(assert (= (and d!75641 c!57205) b!475639))

(assert (= (and d!75641 (not c!57205)) b!475631))

(assert (= (and d!75641 res!284013) b!475640))

(assert (= (and b!475640 res!284015) b!475633))

(assert (= (and b!475640 (not res!284011)) b!475642))

(assert (= (and b!475642 res!284010) b!475645))

(assert (= (and b!475640 res!284012) b!475647))

(assert (= (and b!475647 c!57207) b!475641))

(assert (= (and b!475647 (not c!57207)) b!475643))

(assert (= (and b!475641 res!284009) b!475638))

(assert (= (or b!475641 b!475643) bm!30612))

(assert (= (and b!475647 res!284014) b!475634))

(assert (= (and b!475634 c!57206) b!475636))

(assert (= (and b!475634 (not c!57206)) b!475629))

(assert (= (and b!475636 res!284007) b!475632))

(assert (= (or b!475636 b!475629) bm!30610))

(declare-fun b_lambda!10279 () Bool)

(assert (=> (not b_lambda!10279) (not b!475645)))

(assert (=> b!475645 t!14999))

(declare-fun b_and!20547 () Bool)

(assert (= b_and!20545 (and (=> t!14999 result!7463) b_and!20547)))

(declare-fun m!457801 () Bool)

(assert (=> bm!30610 m!457801))

(assert (=> b!475642 m!457691))

(assert (=> b!475642 m!457691))

(declare-fun m!457803 () Bool)

(assert (=> b!475642 m!457803))

(declare-fun m!457805 () Bool)

(assert (=> b!475644 m!457805))

(declare-fun m!457807 () Bool)

(assert (=> b!475632 m!457807))

(declare-fun m!457809 () Bool)

(assert (=> b!475639 m!457809))

(declare-fun m!457811 () Bool)

(assert (=> b!475639 m!457811))

(declare-fun m!457813 () Bool)

(assert (=> b!475639 m!457813))

(declare-fun m!457815 () Bool)

(assert (=> b!475639 m!457815))

(declare-fun m!457817 () Bool)

(assert (=> b!475639 m!457817))

(declare-fun m!457819 () Bool)

(assert (=> b!475639 m!457819))

(assert (=> b!475639 m!457691))

(declare-fun m!457821 () Bool)

(assert (=> b!475639 m!457821))

(assert (=> b!475639 m!457817))

(declare-fun m!457823 () Bool)

(assert (=> b!475639 m!457823))

(assert (=> b!475639 m!457809))

(declare-fun m!457825 () Bool)

(assert (=> b!475639 m!457825))

(declare-fun m!457827 () Bool)

(assert (=> b!475639 m!457827))

(declare-fun m!457829 () Bool)

(assert (=> b!475639 m!457829))

(assert (=> b!475639 m!457639))

(declare-fun m!457831 () Bool)

(assert (=> b!475639 m!457831))

(declare-fun m!457833 () Bool)

(assert (=> b!475639 m!457833))

(assert (=> b!475639 m!457831))

(declare-fun m!457835 () Bool)

(assert (=> b!475639 m!457835))

(assert (=> b!475639 m!457813))

(declare-fun m!457837 () Bool)

(assert (=> b!475639 m!457837))

(declare-fun m!457839 () Bool)

(assert (=> bm!30612 m!457839))

(assert (=> bm!30613 m!457639))

(assert (=> b!475645 m!457687))

(assert (=> b!475645 m!457693))

(assert (=> b!475645 m!457695))

(assert (=> b!475645 m!457693))

(assert (=> b!475645 m!457691))

(declare-fun m!457841 () Bool)

(assert (=> b!475645 m!457841))

(assert (=> b!475645 m!457691))

(assert (=> b!475645 m!457687))

(assert (=> b!475648 m!457691))

(assert (=> b!475648 m!457691))

(assert (=> b!475648 m!457701))

(assert (=> b!475633 m!457691))

(assert (=> b!475633 m!457691))

(assert (=> b!475633 m!457701))

(declare-fun m!457843 () Bool)

(assert (=> bm!30608 m!457843))

(declare-fun m!457845 () Bool)

(assert (=> b!475638 m!457845))

(assert (=> d!75641 m!457631))

(assert (=> b!475452 d!75641))

(declare-fun b!475656 () Bool)

(declare-fun e!279312 () Bool)

(assert (=> b!475656 (= e!279312 tp_is_empty!13473)))

(declare-fun condMapEmpty!21937 () Bool)

(declare-fun mapDefault!21937 () ValueCell!6393)

(assert (=> mapNonEmpty!21931 (= condMapEmpty!21937 (= mapRest!21931 ((as const (Array (_ BitVec 32) ValueCell!6393)) mapDefault!21937)))))

(declare-fun e!279311 () Bool)

(declare-fun mapRes!21937 () Bool)

(assert (=> mapNonEmpty!21931 (= tp!42178 (and e!279311 mapRes!21937))))

(declare-fun mapNonEmpty!21937 () Bool)

(declare-fun tp!42187 () Bool)

(assert (=> mapNonEmpty!21937 (= mapRes!21937 (and tp!42187 e!279312))))

(declare-fun mapKey!21937 () (_ BitVec 32))

(declare-fun mapValue!21937 () ValueCell!6393)

(declare-fun mapRest!21937 () (Array (_ BitVec 32) ValueCell!6393))

(assert (=> mapNonEmpty!21937 (= mapRest!21931 (store mapRest!21937 mapKey!21937 mapValue!21937))))

(declare-fun b!475657 () Bool)

(assert (=> b!475657 (= e!279311 tp_is_empty!13473)))

(declare-fun mapIsEmpty!21937 () Bool)

(assert (=> mapIsEmpty!21937 mapRes!21937))

(assert (= (and mapNonEmpty!21931 condMapEmpty!21937) mapIsEmpty!21937))

(assert (= (and mapNonEmpty!21931 (not condMapEmpty!21937)) mapNonEmpty!21937))

(assert (= (and mapNonEmpty!21937 ((_ is ValueCellFull!6393) mapValue!21937)) b!475656))

(assert (= (and mapNonEmpty!21931 ((_ is ValueCellFull!6393) mapDefault!21937)) b!475657))

(declare-fun m!457847 () Bool)

(assert (=> mapNonEmpty!21937 m!457847))

(declare-fun b_lambda!10281 () Bool)

(assert (= b_lambda!10275 (or (and start!42622 b_free!12045) b_lambda!10281)))

(declare-fun b_lambda!10283 () Bool)

(assert (= b_lambda!10271 (or (and start!42622 b_free!12045) b_lambda!10283)))

(declare-fun b_lambda!10285 () Bool)

(assert (= b_lambda!10279 (or (and start!42622 b_free!12045) b_lambda!10285)))

(declare-fun b_lambda!10287 () Bool)

(assert (= b_lambda!10277 (or (and start!42622 b_free!12045) b_lambda!10287)))

(declare-fun b_lambda!10289 () Bool)

(assert (= b_lambda!10273 (or (and start!42622 b_free!12045) b_lambda!10289)))

(declare-fun b_lambda!10291 () Bool)

(assert (= b_lambda!10269 (or (and start!42622 b_free!12045) b_lambda!10291)))

(check-sat (not b!475639) (not b!475547) (not b!475565) (not b_lambda!10285) (not bm!30601) (not bm!30603) (not b!475621) (not b!475648) (not bm!30605) (not b!475526) (not b!475564) (not b!475623) (not mapNonEmpty!21937) (not b!475513) tp_is_empty!13473 (not b!475546) (not b_lambda!10281) (not bm!30606) (not b_lambda!10289) (not bm!30610) (not b!475529) (not bm!30608) (not b!475618) (not b!475617) (not d!75637) (not b_lambda!10287) (not b!475624) (not bm!30578) (not d!75621) (not bm!30612) (not d!75639) (not b!475545) (not b!475642) (not b!475532) (not b!475522) (not bm!30582) (not b!475638) (not b!475521) (not d!75625) (not b!475633) (not bm!30585) (not b_next!12045) (not b!475516) (not bm!30613) (not b!475612) (not b_lambda!10283) (not b!475556) (not b!475527) (not b!475645) (not b!475644) (not d!75623) (not b!475530) (not b!475509) (not d!75641) (not b!475507) (not b!475515) (not b!475632) (not b!475512) (not b!475508) b_and!20547 (not b!475627) (not b_lambda!10291) (not bm!30579) (not b!475559) (not b!475523) (not b!475611) (not b!475518))
(check-sat b_and!20547 (not b_next!12045))
