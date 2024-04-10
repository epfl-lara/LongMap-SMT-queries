; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42512 () Bool)

(assert start!42512)

(declare-fun b_free!11967 () Bool)

(declare-fun b_next!11967 () Bool)

(assert (=> start!42512 (= b_free!11967 (not b_next!11967))))

(declare-fun tp!41938 () Bool)

(declare-fun b_and!20435 () Bool)

(assert (=> start!42512 (= tp!41938 b_and!20435)))

(declare-fun b!474357 () Bool)

(declare-fun res!283337 () Bool)

(declare-fun e!278419 () Bool)

(assert (=> b!474357 (=> (not res!283337) (not e!278419))))

(declare-datatypes ((array!30537 0))(
  ( (array!30538 (arr!14687 (Array (_ BitVec 32) (_ BitVec 64))) (size!15039 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30537)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30537 (_ BitVec 32)) Bool)

(assert (=> b!474357 (= res!283337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21808 () Bool)

(declare-fun mapRes!21808 () Bool)

(assert (=> mapIsEmpty!21808 mapRes!21808))

(declare-fun res!283340 () Bool)

(assert (=> start!42512 (=> (not res!283340) (not e!278419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42512 (= res!283340 (validMask!0 mask!1365))))

(assert (=> start!42512 e!278419))

(declare-fun tp_is_empty!13395 () Bool)

(assert (=> start!42512 tp_is_empty!13395))

(assert (=> start!42512 tp!41938))

(assert (=> start!42512 true))

(declare-fun array_inv!10598 (array!30537) Bool)

(assert (=> start!42512 (array_inv!10598 _keys!1025)))

(declare-datatypes ((V!18965 0))(
  ( (V!18966 (val!6742 Int)) )
))
(declare-datatypes ((ValueCell!6354 0))(
  ( (ValueCellFull!6354 (v!9034 V!18965)) (EmptyCell!6354) )
))
(declare-datatypes ((array!30539 0))(
  ( (array!30540 (arr!14688 (Array (_ BitVec 32) ValueCell!6354)) (size!15040 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30539)

(declare-fun e!278422 () Bool)

(declare-fun array_inv!10599 (array!30539) Bool)

(assert (=> start!42512 (and (array_inv!10599 _values!833) e!278422)))

(declare-fun b!474358 () Bool)

(declare-fun e!278418 () Bool)

(assert (=> b!474358 (= e!278422 (and e!278418 mapRes!21808))))

(declare-fun condMapEmpty!21808 () Bool)

(declare-fun mapDefault!21808 () ValueCell!6354)

(assert (=> b!474358 (= condMapEmpty!21808 (= (arr!14688 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6354)) mapDefault!21808)))))

(declare-fun b!474359 () Bool)

(declare-fun e!278417 () Bool)

(assert (=> b!474359 (= e!278417 tp_is_empty!13395)))

(declare-fun b!474360 () Bool)

(assert (=> b!474360 (= e!278418 tp_is_empty!13395)))

(declare-fun b!474361 () Bool)

(declare-fun res!283338 () Bool)

(assert (=> b!474361 (=> (not res!283338) (not e!278419))))

(declare-datatypes ((List!8967 0))(
  ( (Nil!8964) (Cons!8963 (h!9819 (_ BitVec 64)) (t!14939 List!8967)) )
))
(declare-fun arrayNoDuplicates!0 (array!30537 (_ BitVec 32) List!8967) Bool)

(assert (=> b!474361 (= res!283338 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8964))))

(declare-fun b!474362 () Bool)

(declare-fun e!278420 () Bool)

(assert (=> b!474362 (= e!278419 (not e!278420))))

(declare-fun res!283339 () Bool)

(assert (=> b!474362 (=> res!283339 e!278420)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474362 (= res!283339 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8890 0))(
  ( (tuple2!8891 (_1!4456 (_ BitVec 64)) (_2!4456 V!18965)) )
))
(declare-datatypes ((List!8968 0))(
  ( (Nil!8965) (Cons!8964 (h!9820 tuple2!8890) (t!14940 List!8968)) )
))
(declare-datatypes ((ListLongMap!7803 0))(
  ( (ListLongMap!7804 (toList!3917 List!8968)) )
))
(declare-fun lt!216032 () ListLongMap!7803)

(declare-fun lt!216036 () ListLongMap!7803)

(assert (=> b!474362 (= lt!216032 lt!216036)))

(declare-datatypes ((Unit!13992 0))(
  ( (Unit!13993) )
))
(declare-fun lt!216034 () Unit!13992)

(declare-fun minValueBefore!38 () V!18965)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18965)

(declare-fun minValueAfter!38 () V!18965)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!254 (array!30537 array!30539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18965 V!18965 V!18965 V!18965 (_ BitVec 32) Int) Unit!13992)

(assert (=> b!474362 (= lt!216034 (lemmaNoChangeToArrayThenSameMapNoExtras!254 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2074 (array!30537 array!30539 (_ BitVec 32) (_ BitVec 32) V!18965 V!18965 (_ BitVec 32) Int) ListLongMap!7803)

(assert (=> b!474362 (= lt!216036 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474362 (= lt!216032 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474363 () Bool)

(declare-fun res!283336 () Bool)

(assert (=> b!474363 (=> (not res!283336) (not e!278419))))

(assert (=> b!474363 (= res!283336 (and (= (size!15040 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15039 _keys!1025) (size!15040 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21808 () Bool)

(declare-fun tp!41937 () Bool)

(assert (=> mapNonEmpty!21808 (= mapRes!21808 (and tp!41937 e!278417))))

(declare-fun mapValue!21808 () ValueCell!6354)

(declare-fun mapRest!21808 () (Array (_ BitVec 32) ValueCell!6354))

(declare-fun mapKey!21808 () (_ BitVec 32))

(assert (=> mapNonEmpty!21808 (= (arr!14688 _values!833) (store mapRest!21808 mapKey!21808 mapValue!21808))))

(declare-fun b!474364 () Bool)

(assert (=> b!474364 (= e!278420 (bvsle #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun lt!216038 () ListLongMap!7803)

(declare-fun lt!216037 () tuple2!8890)

(declare-fun +!1752 (ListLongMap!7803 tuple2!8890) ListLongMap!7803)

(assert (=> b!474364 (= (+!1752 lt!216038 lt!216037) (+!1752 (+!1752 lt!216038 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216037))))

(assert (=> b!474364 (= lt!216037 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!216033 () Unit!13992)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!161 (ListLongMap!7803 (_ BitVec 64) V!18965 V!18965) Unit!13992)

(assert (=> b!474364 (= lt!216033 (addSameAsAddTwiceSameKeyDiffValues!161 lt!216038 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!474364 (= lt!216038 (+!1752 lt!216032 (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!216035 () ListLongMap!7803)

(declare-fun getCurrentListMap!2281 (array!30537 array!30539 (_ BitVec 32) (_ BitVec 32) V!18965 V!18965 (_ BitVec 32) Int) ListLongMap!7803)

(assert (=> b!474364 (= lt!216035 (getCurrentListMap!2281 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216039 () ListLongMap!7803)

(assert (=> b!474364 (= lt!216039 (getCurrentListMap!2281 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42512 res!283340) b!474363))

(assert (= (and b!474363 res!283336) b!474357))

(assert (= (and b!474357 res!283337) b!474361))

(assert (= (and b!474361 res!283338) b!474362))

(assert (= (and b!474362 (not res!283339)) b!474364))

(assert (= (and b!474358 condMapEmpty!21808) mapIsEmpty!21808))

(assert (= (and b!474358 (not condMapEmpty!21808)) mapNonEmpty!21808))

(get-info :version)

(assert (= (and mapNonEmpty!21808 ((_ is ValueCellFull!6354) mapValue!21808)) b!474359))

(assert (= (and b!474358 ((_ is ValueCellFull!6354) mapDefault!21808)) b!474360))

(assert (= start!42512 b!474358))

(declare-fun m!456685 () Bool)

(assert (=> b!474362 m!456685))

(declare-fun m!456687 () Bool)

(assert (=> b!474362 m!456687))

(declare-fun m!456689 () Bool)

(assert (=> b!474362 m!456689))

(declare-fun m!456691 () Bool)

(assert (=> b!474364 m!456691))

(assert (=> b!474364 m!456691))

(declare-fun m!456693 () Bool)

(assert (=> b!474364 m!456693))

(declare-fun m!456695 () Bool)

(assert (=> b!474364 m!456695))

(declare-fun m!456697 () Bool)

(assert (=> b!474364 m!456697))

(declare-fun m!456699 () Bool)

(assert (=> b!474364 m!456699))

(declare-fun m!456701 () Bool)

(assert (=> b!474364 m!456701))

(declare-fun m!456703 () Bool)

(assert (=> b!474364 m!456703))

(declare-fun m!456705 () Bool)

(assert (=> b!474361 m!456705))

(declare-fun m!456707 () Bool)

(assert (=> b!474357 m!456707))

(declare-fun m!456709 () Bool)

(assert (=> start!42512 m!456709))

(declare-fun m!456711 () Bool)

(assert (=> start!42512 m!456711))

(declare-fun m!456713 () Bool)

(assert (=> start!42512 m!456713))

(declare-fun m!456715 () Bool)

(assert (=> mapNonEmpty!21808 m!456715))

(check-sat (not b!474364) (not mapNonEmpty!21808) b_and!20435 tp_is_empty!13395 (not start!42512) (not b_next!11967) (not b!474361) (not b!474357) (not b!474362))
(check-sat b_and!20435 (not b_next!11967))
(get-model)

(declare-fun b!474431 () Bool)

(declare-fun e!278478 () ListLongMap!7803)

(declare-fun call!30545 () ListLongMap!7803)

(assert (=> b!474431 (= e!278478 call!30545)))

(declare-fun b!474432 () Bool)

(declare-fun res!283380 () Bool)

(declare-fun e!278473 () Bool)

(assert (=> b!474432 (=> (not res!283380) (not e!278473))))

(declare-fun e!278475 () Bool)

(assert (=> b!474432 (= res!283380 e!278475)))

(declare-fun c!57109 () Bool)

(assert (=> b!474432 (= c!57109 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!474433 () Bool)

(declare-fun e!278469 () Bool)

(assert (=> b!474433 (= e!278473 e!278469)))

(declare-fun c!57107 () Bool)

(assert (=> b!474433 (= c!57107 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30542 () Bool)

(declare-fun call!30548 () ListLongMap!7803)

(declare-fun call!30546 () ListLongMap!7803)

(assert (=> bm!30542 (= call!30548 call!30546)))

(declare-fun b!474434 () Bool)

(declare-fun e!278476 () Bool)

(declare-fun lt!216120 () ListLongMap!7803)

(declare-fun apply!333 (ListLongMap!7803 (_ BitVec 64)) V!18965)

(assert (=> b!474434 (= e!278476 (= (apply!333 lt!216120 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!474435 () Bool)

(declare-fun e!278470 () ListLongMap!7803)

(assert (=> b!474435 (= e!278470 (+!1752 call!30546 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!474436 () Bool)

(declare-fun e!278477 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!474436 (= e!278477 (validKeyInArray!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474437 () Bool)

(declare-fun e!278467 () Bool)

(assert (=> b!474437 (= e!278467 (validKeyInArray!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474438 () Bool)

(declare-fun e!278468 () Unit!13992)

(declare-fun lt!216118 () Unit!13992)

(assert (=> b!474438 (= e!278468 lt!216118)))

(declare-fun lt!216116 () ListLongMap!7803)

(assert (=> b!474438 (= lt!216116 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216110 () (_ BitVec 64))

(assert (=> b!474438 (= lt!216110 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216108 () (_ BitVec 64))

(assert (=> b!474438 (= lt!216108 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216129 () Unit!13992)

(declare-fun addStillContains!292 (ListLongMap!7803 (_ BitVec 64) V!18965 (_ BitVec 64)) Unit!13992)

(assert (=> b!474438 (= lt!216129 (addStillContains!292 lt!216116 lt!216110 zeroValue!794 lt!216108))))

(declare-fun contains!2551 (ListLongMap!7803 (_ BitVec 64)) Bool)

(assert (=> b!474438 (contains!2551 (+!1752 lt!216116 (tuple2!8891 lt!216110 zeroValue!794)) lt!216108)))

(declare-fun lt!216112 () Unit!13992)

(assert (=> b!474438 (= lt!216112 lt!216129)))

(declare-fun lt!216128 () ListLongMap!7803)

(assert (=> b!474438 (= lt!216128 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216119 () (_ BitVec 64))

(assert (=> b!474438 (= lt!216119 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216121 () (_ BitVec 64))

(assert (=> b!474438 (= lt!216121 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216109 () Unit!13992)

(declare-fun addApplyDifferent!292 (ListLongMap!7803 (_ BitVec 64) V!18965 (_ BitVec 64)) Unit!13992)

(assert (=> b!474438 (= lt!216109 (addApplyDifferent!292 lt!216128 lt!216119 minValueAfter!38 lt!216121))))

(assert (=> b!474438 (= (apply!333 (+!1752 lt!216128 (tuple2!8891 lt!216119 minValueAfter!38)) lt!216121) (apply!333 lt!216128 lt!216121))))

(declare-fun lt!216125 () Unit!13992)

(assert (=> b!474438 (= lt!216125 lt!216109)))

(declare-fun lt!216127 () ListLongMap!7803)

(assert (=> b!474438 (= lt!216127 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216122 () (_ BitVec 64))

(assert (=> b!474438 (= lt!216122 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216126 () (_ BitVec 64))

(assert (=> b!474438 (= lt!216126 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216111 () Unit!13992)

(assert (=> b!474438 (= lt!216111 (addApplyDifferent!292 lt!216127 lt!216122 zeroValue!794 lt!216126))))

(assert (=> b!474438 (= (apply!333 (+!1752 lt!216127 (tuple2!8891 lt!216122 zeroValue!794)) lt!216126) (apply!333 lt!216127 lt!216126))))

(declare-fun lt!216123 () Unit!13992)

(assert (=> b!474438 (= lt!216123 lt!216111)))

(declare-fun lt!216115 () ListLongMap!7803)

(assert (=> b!474438 (= lt!216115 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216113 () (_ BitVec 64))

(assert (=> b!474438 (= lt!216113 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216124 () (_ BitVec 64))

(assert (=> b!474438 (= lt!216124 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474438 (= lt!216118 (addApplyDifferent!292 lt!216115 lt!216113 minValueAfter!38 lt!216124))))

(assert (=> b!474438 (= (apply!333 (+!1752 lt!216115 (tuple2!8891 lt!216113 minValueAfter!38)) lt!216124) (apply!333 lt!216115 lt!216124))))

(declare-fun bm!30543 () Bool)

(declare-fun call!30550 () ListLongMap!7803)

(assert (=> bm!30543 (= call!30545 call!30550)))

(declare-fun b!474439 () Bool)

(declare-fun call!30549 () Bool)

(assert (=> b!474439 (= e!278469 (not call!30549))))

(declare-fun d!75551 () Bool)

(assert (=> d!75551 e!278473))

(declare-fun res!283378 () Bool)

(assert (=> d!75551 (=> (not res!283378) (not e!278473))))

(assert (=> d!75551 (= res!283378 (or (bvsge #b00000000000000000000000000000000 (size!15039 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))))

(declare-fun lt!216114 () ListLongMap!7803)

(assert (=> d!75551 (= lt!216120 lt!216114)))

(declare-fun lt!216117 () Unit!13992)

(assert (=> d!75551 (= lt!216117 e!278468)))

(declare-fun c!57108 () Bool)

(assert (=> d!75551 (= c!57108 e!278467)))

(declare-fun res!283377 () Bool)

(assert (=> d!75551 (=> (not res!283377) (not e!278467))))

(assert (=> d!75551 (= res!283377 (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(assert (=> d!75551 (= lt!216114 e!278470)))

(declare-fun c!57110 () Bool)

(assert (=> d!75551 (= c!57110 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75551 (validMask!0 mask!1365)))

(assert (=> d!75551 (= (getCurrentListMap!2281 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216120)))

(declare-fun b!474440 () Bool)

(declare-fun e!278474 () Bool)

(assert (=> b!474440 (= e!278474 (= (apply!333 lt!216120 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!474441 () Bool)

(declare-fun e!278472 () ListLongMap!7803)

(assert (=> b!474441 (= e!278470 e!278472)))

(declare-fun c!57111 () Bool)

(assert (=> b!474441 (= c!57111 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30544 () Bool)

(declare-fun call!30551 () Bool)

(assert (=> bm!30544 (= call!30551 (contains!2551 lt!216120 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!474442 () Bool)

(assert (=> b!474442 (= e!278475 (not call!30551))))

(declare-fun b!474443 () Bool)

(assert (=> b!474443 (= e!278472 call!30548)))

(declare-fun bm!30545 () Bool)

(declare-fun call!30547 () ListLongMap!7803)

(assert (=> bm!30545 (= call!30550 call!30547)))

(declare-fun b!474444 () Bool)

(declare-fun Unit!13996 () Unit!13992)

(assert (=> b!474444 (= e!278468 Unit!13996)))

(declare-fun e!278471 () Bool)

(declare-fun b!474445 () Bool)

(declare-fun get!7134 (ValueCell!6354 V!18965) V!18965)

(declare-fun dynLambda!926 (Int (_ BitVec 64)) V!18965)

(assert (=> b!474445 (= e!278471 (= (apply!333 lt!216120 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)) (get!7134 (select (arr!14688 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!474445 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15040 _values!833)))))

(assert (=> b!474445 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun b!474446 () Bool)

(assert (=> b!474446 (= e!278469 e!278474)))

(declare-fun res!283376 () Bool)

(assert (=> b!474446 (= res!283376 call!30549)))

(assert (=> b!474446 (=> (not res!283376) (not e!278474))))

(declare-fun b!474447 () Bool)

(declare-fun e!278479 () Bool)

(assert (=> b!474447 (= e!278479 e!278471)))

(declare-fun res!283375 () Bool)

(assert (=> b!474447 (=> (not res!283375) (not e!278471))))

(assert (=> b!474447 (= res!283375 (contains!2551 lt!216120 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474447 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun bm!30546 () Bool)

(assert (=> bm!30546 (= call!30549 (contains!2551 lt!216120 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!474448 () Bool)

(assert (=> b!474448 (= e!278478 call!30548)))

(declare-fun b!474449 () Bool)

(declare-fun c!57112 () Bool)

(assert (=> b!474449 (= c!57112 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!474449 (= e!278472 e!278478)))

(declare-fun bm!30547 () Bool)

(assert (=> bm!30547 (= call!30547 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474450 () Bool)

(declare-fun res!283379 () Bool)

(assert (=> b!474450 (=> (not res!283379) (not e!278473))))

(assert (=> b!474450 (= res!283379 e!278479)))

(declare-fun res!283374 () Bool)

(assert (=> b!474450 (=> res!283374 e!278479)))

(assert (=> b!474450 (= res!283374 (not e!278477))))

(declare-fun res!283382 () Bool)

(assert (=> b!474450 (=> (not res!283382) (not e!278477))))

(assert (=> b!474450 (= res!283382 (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun bm!30548 () Bool)

(assert (=> bm!30548 (= call!30546 (+!1752 (ite c!57110 call!30547 (ite c!57111 call!30550 call!30545)) (ite (or c!57110 c!57111) (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!474451 () Bool)

(assert (=> b!474451 (= e!278475 e!278476)))

(declare-fun res!283381 () Bool)

(assert (=> b!474451 (= res!283381 call!30551)))

(assert (=> b!474451 (=> (not res!283381) (not e!278476))))

(assert (= (and d!75551 c!57110) b!474435))

(assert (= (and d!75551 (not c!57110)) b!474441))

(assert (= (and b!474441 c!57111) b!474443))

(assert (= (and b!474441 (not c!57111)) b!474449))

(assert (= (and b!474449 c!57112) b!474448))

(assert (= (and b!474449 (not c!57112)) b!474431))

(assert (= (or b!474448 b!474431) bm!30543))

(assert (= (or b!474443 bm!30543) bm!30545))

(assert (= (or b!474443 b!474448) bm!30542))

(assert (= (or b!474435 bm!30545) bm!30547))

(assert (= (or b!474435 bm!30542) bm!30548))

(assert (= (and d!75551 res!283377) b!474437))

(assert (= (and d!75551 c!57108) b!474438))

(assert (= (and d!75551 (not c!57108)) b!474444))

(assert (= (and d!75551 res!283378) b!474450))

(assert (= (and b!474450 res!283382) b!474436))

(assert (= (and b!474450 (not res!283374)) b!474447))

(assert (= (and b!474447 res!283375) b!474445))

(assert (= (and b!474450 res!283379) b!474432))

(assert (= (and b!474432 c!57109) b!474451))

(assert (= (and b!474432 (not c!57109)) b!474442))

(assert (= (and b!474451 res!283381) b!474434))

(assert (= (or b!474451 b!474442) bm!30544))

(assert (= (and b!474432 res!283380) b!474433))

(assert (= (and b!474433 c!57107) b!474446))

(assert (= (and b!474433 (not c!57107)) b!474439))

(assert (= (and b!474446 res!283376) b!474440))

(assert (= (or b!474446 b!474439) bm!30546))

(declare-fun b_lambda!10229 () Bool)

(assert (=> (not b_lambda!10229) (not b!474445)))

(declare-fun t!14943 () Bool)

(declare-fun tb!3931 () Bool)

(assert (=> (and start!42512 (= defaultEntry!841 defaultEntry!841) t!14943) tb!3931))

(declare-fun result!7451 () Bool)

(assert (=> tb!3931 (= result!7451 tp_is_empty!13395)))

(assert (=> b!474445 t!14943))

(declare-fun b_and!20439 () Bool)

(assert (= b_and!20435 (and (=> t!14943 result!7451) b_and!20439)))

(declare-fun m!456749 () Bool)

(assert (=> b!474436 m!456749))

(assert (=> b!474436 m!456749))

(declare-fun m!456751 () Bool)

(assert (=> b!474436 m!456751))

(assert (=> d!75551 m!456709))

(declare-fun m!456753 () Bool)

(assert (=> bm!30544 m!456753))

(declare-fun m!456755 () Bool)

(assert (=> b!474438 m!456755))

(declare-fun m!456757 () Bool)

(assert (=> b!474438 m!456757))

(declare-fun m!456759 () Bool)

(assert (=> b!474438 m!456759))

(declare-fun m!456761 () Bool)

(assert (=> b!474438 m!456761))

(declare-fun m!456763 () Bool)

(assert (=> b!474438 m!456763))

(declare-fun m!456765 () Bool)

(assert (=> b!474438 m!456765))

(declare-fun m!456767 () Bool)

(assert (=> b!474438 m!456767))

(declare-fun m!456769 () Bool)

(assert (=> b!474438 m!456769))

(declare-fun m!456771 () Bool)

(assert (=> b!474438 m!456771))

(declare-fun m!456773 () Bool)

(assert (=> b!474438 m!456773))

(assert (=> b!474438 m!456757))

(assert (=> b!474438 m!456687))

(declare-fun m!456775 () Bool)

(assert (=> b!474438 m!456775))

(assert (=> b!474438 m!456763))

(assert (=> b!474438 m!456769))

(declare-fun m!456777 () Bool)

(assert (=> b!474438 m!456777))

(declare-fun m!456779 () Bool)

(assert (=> b!474438 m!456779))

(declare-fun m!456781 () Bool)

(assert (=> b!474438 m!456781))

(assert (=> b!474438 m!456749))

(declare-fun m!456783 () Bool)

(assert (=> b!474438 m!456783))

(assert (=> b!474438 m!456777))

(declare-fun m!456785 () Bool)

(assert (=> bm!30546 m!456785))

(declare-fun m!456787 () Bool)

(assert (=> b!474435 m!456787))

(assert (=> b!474447 m!456749))

(assert (=> b!474447 m!456749))

(declare-fun m!456789 () Bool)

(assert (=> b!474447 m!456789))

(declare-fun m!456791 () Bool)

(assert (=> bm!30548 m!456791))

(assert (=> bm!30547 m!456687))

(declare-fun m!456793 () Bool)

(assert (=> b!474445 m!456793))

(declare-fun m!456795 () Bool)

(assert (=> b!474445 m!456795))

(assert (=> b!474445 m!456795))

(assert (=> b!474445 m!456793))

(declare-fun m!456797 () Bool)

(assert (=> b!474445 m!456797))

(assert (=> b!474445 m!456749))

(declare-fun m!456799 () Bool)

(assert (=> b!474445 m!456799))

(assert (=> b!474445 m!456749))

(declare-fun m!456801 () Bool)

(assert (=> b!474434 m!456801))

(assert (=> b!474437 m!456749))

(assert (=> b!474437 m!456749))

(assert (=> b!474437 m!456751))

(declare-fun m!456803 () Bool)

(assert (=> b!474440 m!456803))

(assert (=> b!474364 d!75551))

(declare-fun d!75553 () Bool)

(declare-fun e!278482 () Bool)

(assert (=> d!75553 e!278482))

(declare-fun res!283388 () Bool)

(assert (=> d!75553 (=> (not res!283388) (not e!278482))))

(declare-fun lt!216139 () ListLongMap!7803)

(assert (=> d!75553 (= res!283388 (contains!2551 lt!216139 (_1!4456 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!216140 () List!8968)

(assert (=> d!75553 (= lt!216139 (ListLongMap!7804 lt!216140))))

(declare-fun lt!216138 () Unit!13992)

(declare-fun lt!216141 () Unit!13992)

(assert (=> d!75553 (= lt!216138 lt!216141)))

(declare-datatypes ((Option!387 0))(
  ( (Some!386 (v!9036 V!18965)) (None!385) )
))
(declare-fun getValueByKey!381 (List!8968 (_ BitVec 64)) Option!387)

(assert (=> d!75553 (= (getValueByKey!381 lt!216140 (_1!4456 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!386 (_2!4456 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!203 (List!8968 (_ BitVec 64) V!18965) Unit!13992)

(assert (=> d!75553 (= lt!216141 (lemmaContainsTupThenGetReturnValue!203 lt!216140 (_1!4456 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4456 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun insertStrictlySorted!206 (List!8968 (_ BitVec 64) V!18965) List!8968)

(assert (=> d!75553 (= lt!216140 (insertStrictlySorted!206 (toList!3917 lt!216038) (_1!4456 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4456 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75553 (= (+!1752 lt!216038 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216139)))

(declare-fun b!474458 () Bool)

(declare-fun res!283387 () Bool)

(assert (=> b!474458 (=> (not res!283387) (not e!278482))))

(assert (=> b!474458 (= res!283387 (= (getValueByKey!381 (toList!3917 lt!216139) (_1!4456 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!386 (_2!4456 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!474459 () Bool)

(declare-fun contains!2552 (List!8968 tuple2!8890) Bool)

(assert (=> b!474459 (= e!278482 (contains!2552 (toList!3917 lt!216139) (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75553 res!283388) b!474458))

(assert (= (and b!474458 res!283387) b!474459))

(declare-fun m!456805 () Bool)

(assert (=> d!75553 m!456805))

(declare-fun m!456807 () Bool)

(assert (=> d!75553 m!456807))

(declare-fun m!456809 () Bool)

(assert (=> d!75553 m!456809))

(declare-fun m!456811 () Bool)

(assert (=> d!75553 m!456811))

(declare-fun m!456813 () Bool)

(assert (=> b!474458 m!456813))

(declare-fun m!456815 () Bool)

(assert (=> b!474459 m!456815))

(assert (=> b!474364 d!75553))

(declare-fun d!75555 () Bool)

(declare-fun e!278483 () Bool)

(assert (=> d!75555 e!278483))

(declare-fun res!283390 () Bool)

(assert (=> d!75555 (=> (not res!283390) (not e!278483))))

(declare-fun lt!216143 () ListLongMap!7803)

(assert (=> d!75555 (= res!283390 (contains!2551 lt!216143 (_1!4456 lt!216037)))))

(declare-fun lt!216144 () List!8968)

(assert (=> d!75555 (= lt!216143 (ListLongMap!7804 lt!216144))))

(declare-fun lt!216142 () Unit!13992)

(declare-fun lt!216145 () Unit!13992)

(assert (=> d!75555 (= lt!216142 lt!216145)))

(assert (=> d!75555 (= (getValueByKey!381 lt!216144 (_1!4456 lt!216037)) (Some!386 (_2!4456 lt!216037)))))

(assert (=> d!75555 (= lt!216145 (lemmaContainsTupThenGetReturnValue!203 lt!216144 (_1!4456 lt!216037) (_2!4456 lt!216037)))))

(assert (=> d!75555 (= lt!216144 (insertStrictlySorted!206 (toList!3917 lt!216038) (_1!4456 lt!216037) (_2!4456 lt!216037)))))

(assert (=> d!75555 (= (+!1752 lt!216038 lt!216037) lt!216143)))

(declare-fun b!474460 () Bool)

(declare-fun res!283389 () Bool)

(assert (=> b!474460 (=> (not res!283389) (not e!278483))))

(assert (=> b!474460 (= res!283389 (= (getValueByKey!381 (toList!3917 lt!216143) (_1!4456 lt!216037)) (Some!386 (_2!4456 lt!216037))))))

(declare-fun b!474461 () Bool)

(assert (=> b!474461 (= e!278483 (contains!2552 (toList!3917 lt!216143) lt!216037))))

(assert (= (and d!75555 res!283390) b!474460))

(assert (= (and b!474460 res!283389) b!474461))

(declare-fun m!456817 () Bool)

(assert (=> d!75555 m!456817))

(declare-fun m!456819 () Bool)

(assert (=> d!75555 m!456819))

(declare-fun m!456821 () Bool)

(assert (=> d!75555 m!456821))

(declare-fun m!456823 () Bool)

(assert (=> d!75555 m!456823))

(declare-fun m!456825 () Bool)

(assert (=> b!474460 m!456825))

(declare-fun m!456827 () Bool)

(assert (=> b!474461 m!456827))

(assert (=> b!474364 d!75555))

(declare-fun d!75557 () Bool)

(declare-fun e!278484 () Bool)

(assert (=> d!75557 e!278484))

(declare-fun res!283392 () Bool)

(assert (=> d!75557 (=> (not res!283392) (not e!278484))))

(declare-fun lt!216147 () ListLongMap!7803)

(assert (=> d!75557 (= res!283392 (contains!2551 lt!216147 (_1!4456 lt!216037)))))

(declare-fun lt!216148 () List!8968)

(assert (=> d!75557 (= lt!216147 (ListLongMap!7804 lt!216148))))

(declare-fun lt!216146 () Unit!13992)

(declare-fun lt!216149 () Unit!13992)

(assert (=> d!75557 (= lt!216146 lt!216149)))

(assert (=> d!75557 (= (getValueByKey!381 lt!216148 (_1!4456 lt!216037)) (Some!386 (_2!4456 lt!216037)))))

(assert (=> d!75557 (= lt!216149 (lemmaContainsTupThenGetReturnValue!203 lt!216148 (_1!4456 lt!216037) (_2!4456 lt!216037)))))

(assert (=> d!75557 (= lt!216148 (insertStrictlySorted!206 (toList!3917 (+!1752 lt!216038 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4456 lt!216037) (_2!4456 lt!216037)))))

(assert (=> d!75557 (= (+!1752 (+!1752 lt!216038 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216037) lt!216147)))

(declare-fun b!474462 () Bool)

(declare-fun res!283391 () Bool)

(assert (=> b!474462 (=> (not res!283391) (not e!278484))))

(assert (=> b!474462 (= res!283391 (= (getValueByKey!381 (toList!3917 lt!216147) (_1!4456 lt!216037)) (Some!386 (_2!4456 lt!216037))))))

(declare-fun b!474463 () Bool)

(assert (=> b!474463 (= e!278484 (contains!2552 (toList!3917 lt!216147) lt!216037))))

(assert (= (and d!75557 res!283392) b!474462))

(assert (= (and b!474462 res!283391) b!474463))

(declare-fun m!456829 () Bool)

(assert (=> d!75557 m!456829))

(declare-fun m!456831 () Bool)

(assert (=> d!75557 m!456831))

(declare-fun m!456833 () Bool)

(assert (=> d!75557 m!456833))

(declare-fun m!456835 () Bool)

(assert (=> d!75557 m!456835))

(declare-fun m!456837 () Bool)

(assert (=> b!474462 m!456837))

(declare-fun m!456839 () Bool)

(assert (=> b!474463 m!456839))

(assert (=> b!474364 d!75557))

(declare-fun d!75559 () Bool)

(declare-fun e!278485 () Bool)

(assert (=> d!75559 e!278485))

(declare-fun res!283394 () Bool)

(assert (=> d!75559 (=> (not res!283394) (not e!278485))))

(declare-fun lt!216151 () ListLongMap!7803)

(assert (=> d!75559 (= res!283394 (contains!2551 lt!216151 (_1!4456 (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(declare-fun lt!216152 () List!8968)

(assert (=> d!75559 (= lt!216151 (ListLongMap!7804 lt!216152))))

(declare-fun lt!216150 () Unit!13992)

(declare-fun lt!216153 () Unit!13992)

(assert (=> d!75559 (= lt!216150 lt!216153)))

(assert (=> d!75559 (= (getValueByKey!381 lt!216152 (_1!4456 (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!386 (_2!4456 (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75559 (= lt!216153 (lemmaContainsTupThenGetReturnValue!203 lt!216152 (_1!4456 (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4456 (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75559 (= lt!216152 (insertStrictlySorted!206 (toList!3917 lt!216032) (_1!4456 (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4456 (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75559 (= (+!1752 lt!216032 (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) lt!216151)))

(declare-fun b!474464 () Bool)

(declare-fun res!283393 () Bool)

(assert (=> b!474464 (=> (not res!283393) (not e!278485))))

(assert (=> b!474464 (= res!283393 (= (getValueByKey!381 (toList!3917 lt!216151) (_1!4456 (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!386 (_2!4456 (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))))

(declare-fun b!474465 () Bool)

(assert (=> b!474465 (= e!278485 (contains!2552 (toList!3917 lt!216151) (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(assert (= (and d!75559 res!283394) b!474464))

(assert (= (and b!474464 res!283393) b!474465))

(declare-fun m!456841 () Bool)

(assert (=> d!75559 m!456841))

(declare-fun m!456843 () Bool)

(assert (=> d!75559 m!456843))

(declare-fun m!456845 () Bool)

(assert (=> d!75559 m!456845))

(declare-fun m!456847 () Bool)

(assert (=> d!75559 m!456847))

(declare-fun m!456849 () Bool)

(assert (=> b!474464 m!456849))

(declare-fun m!456851 () Bool)

(assert (=> b!474465 m!456851))

(assert (=> b!474364 d!75559))

(declare-fun b!474466 () Bool)

(declare-fun e!278497 () ListLongMap!7803)

(declare-fun call!30552 () ListLongMap!7803)

(assert (=> b!474466 (= e!278497 call!30552)))

(declare-fun b!474467 () Bool)

(declare-fun res!283401 () Bool)

(declare-fun e!278492 () Bool)

(assert (=> b!474467 (=> (not res!283401) (not e!278492))))

(declare-fun e!278494 () Bool)

(assert (=> b!474467 (= res!283401 e!278494)))

(declare-fun c!57115 () Bool)

(assert (=> b!474467 (= c!57115 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!474468 () Bool)

(declare-fun e!278488 () Bool)

(assert (=> b!474468 (= e!278492 e!278488)))

(declare-fun c!57113 () Bool)

(assert (=> b!474468 (= c!57113 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30549 () Bool)

(declare-fun call!30555 () ListLongMap!7803)

(declare-fun call!30553 () ListLongMap!7803)

(assert (=> bm!30549 (= call!30555 call!30553)))

(declare-fun b!474469 () Bool)

(declare-fun e!278495 () Bool)

(declare-fun lt!216166 () ListLongMap!7803)

(assert (=> b!474469 (= e!278495 (= (apply!333 lt!216166 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!474470 () Bool)

(declare-fun e!278489 () ListLongMap!7803)

(assert (=> b!474470 (= e!278489 (+!1752 call!30553 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!474471 () Bool)

(declare-fun e!278496 () Bool)

(assert (=> b!474471 (= e!278496 (validKeyInArray!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474472 () Bool)

(declare-fun e!278486 () Bool)

(assert (=> b!474472 (= e!278486 (validKeyInArray!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474473 () Bool)

(declare-fun e!278487 () Unit!13992)

(declare-fun lt!216164 () Unit!13992)

(assert (=> b!474473 (= e!278487 lt!216164)))

(declare-fun lt!216162 () ListLongMap!7803)

(assert (=> b!474473 (= lt!216162 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216156 () (_ BitVec 64))

(assert (=> b!474473 (= lt!216156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216154 () (_ BitVec 64))

(assert (=> b!474473 (= lt!216154 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216175 () Unit!13992)

(assert (=> b!474473 (= lt!216175 (addStillContains!292 lt!216162 lt!216156 zeroValue!794 lt!216154))))

(assert (=> b!474473 (contains!2551 (+!1752 lt!216162 (tuple2!8891 lt!216156 zeroValue!794)) lt!216154)))

(declare-fun lt!216158 () Unit!13992)

(assert (=> b!474473 (= lt!216158 lt!216175)))

(declare-fun lt!216174 () ListLongMap!7803)

(assert (=> b!474473 (= lt!216174 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216165 () (_ BitVec 64))

(assert (=> b!474473 (= lt!216165 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216167 () (_ BitVec 64))

(assert (=> b!474473 (= lt!216167 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216155 () Unit!13992)

(assert (=> b!474473 (= lt!216155 (addApplyDifferent!292 lt!216174 lt!216165 minValueBefore!38 lt!216167))))

(assert (=> b!474473 (= (apply!333 (+!1752 lt!216174 (tuple2!8891 lt!216165 minValueBefore!38)) lt!216167) (apply!333 lt!216174 lt!216167))))

(declare-fun lt!216171 () Unit!13992)

(assert (=> b!474473 (= lt!216171 lt!216155)))

(declare-fun lt!216173 () ListLongMap!7803)

(assert (=> b!474473 (= lt!216173 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216168 () (_ BitVec 64))

(assert (=> b!474473 (= lt!216168 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216172 () (_ BitVec 64))

(assert (=> b!474473 (= lt!216172 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216157 () Unit!13992)

(assert (=> b!474473 (= lt!216157 (addApplyDifferent!292 lt!216173 lt!216168 zeroValue!794 lt!216172))))

(assert (=> b!474473 (= (apply!333 (+!1752 lt!216173 (tuple2!8891 lt!216168 zeroValue!794)) lt!216172) (apply!333 lt!216173 lt!216172))))

(declare-fun lt!216169 () Unit!13992)

(assert (=> b!474473 (= lt!216169 lt!216157)))

(declare-fun lt!216161 () ListLongMap!7803)

(assert (=> b!474473 (= lt!216161 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216159 () (_ BitVec 64))

(assert (=> b!474473 (= lt!216159 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216170 () (_ BitVec 64))

(assert (=> b!474473 (= lt!216170 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474473 (= lt!216164 (addApplyDifferent!292 lt!216161 lt!216159 minValueBefore!38 lt!216170))))

(assert (=> b!474473 (= (apply!333 (+!1752 lt!216161 (tuple2!8891 lt!216159 minValueBefore!38)) lt!216170) (apply!333 lt!216161 lt!216170))))

(declare-fun bm!30550 () Bool)

(declare-fun call!30557 () ListLongMap!7803)

(assert (=> bm!30550 (= call!30552 call!30557)))

(declare-fun b!474474 () Bool)

(declare-fun call!30556 () Bool)

(assert (=> b!474474 (= e!278488 (not call!30556))))

(declare-fun d!75561 () Bool)

(assert (=> d!75561 e!278492))

(declare-fun res!283399 () Bool)

(assert (=> d!75561 (=> (not res!283399) (not e!278492))))

(assert (=> d!75561 (= res!283399 (or (bvsge #b00000000000000000000000000000000 (size!15039 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))))

(declare-fun lt!216160 () ListLongMap!7803)

(assert (=> d!75561 (= lt!216166 lt!216160)))

(declare-fun lt!216163 () Unit!13992)

(assert (=> d!75561 (= lt!216163 e!278487)))

(declare-fun c!57114 () Bool)

(assert (=> d!75561 (= c!57114 e!278486)))

(declare-fun res!283398 () Bool)

(assert (=> d!75561 (=> (not res!283398) (not e!278486))))

(assert (=> d!75561 (= res!283398 (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(assert (=> d!75561 (= lt!216160 e!278489)))

(declare-fun c!57116 () Bool)

(assert (=> d!75561 (= c!57116 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75561 (validMask!0 mask!1365)))

(assert (=> d!75561 (= (getCurrentListMap!2281 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216166)))

(declare-fun b!474475 () Bool)

(declare-fun e!278493 () Bool)

(assert (=> b!474475 (= e!278493 (= (apply!333 lt!216166 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!474476 () Bool)

(declare-fun e!278491 () ListLongMap!7803)

(assert (=> b!474476 (= e!278489 e!278491)))

(declare-fun c!57117 () Bool)

(assert (=> b!474476 (= c!57117 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30551 () Bool)

(declare-fun call!30558 () Bool)

(assert (=> bm!30551 (= call!30558 (contains!2551 lt!216166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!474477 () Bool)

(assert (=> b!474477 (= e!278494 (not call!30558))))

(declare-fun b!474478 () Bool)

(assert (=> b!474478 (= e!278491 call!30555)))

(declare-fun bm!30552 () Bool)

(declare-fun call!30554 () ListLongMap!7803)

(assert (=> bm!30552 (= call!30557 call!30554)))

(declare-fun b!474479 () Bool)

(declare-fun Unit!13997 () Unit!13992)

(assert (=> b!474479 (= e!278487 Unit!13997)))

(declare-fun e!278490 () Bool)

(declare-fun b!474480 () Bool)

(assert (=> b!474480 (= e!278490 (= (apply!333 lt!216166 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)) (get!7134 (select (arr!14688 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!474480 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15040 _values!833)))))

(assert (=> b!474480 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun b!474481 () Bool)

(assert (=> b!474481 (= e!278488 e!278493)))

(declare-fun res!283397 () Bool)

(assert (=> b!474481 (= res!283397 call!30556)))

(assert (=> b!474481 (=> (not res!283397) (not e!278493))))

(declare-fun b!474482 () Bool)

(declare-fun e!278498 () Bool)

(assert (=> b!474482 (= e!278498 e!278490)))

(declare-fun res!283396 () Bool)

(assert (=> b!474482 (=> (not res!283396) (not e!278490))))

(assert (=> b!474482 (= res!283396 (contains!2551 lt!216166 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474482 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun bm!30553 () Bool)

(assert (=> bm!30553 (= call!30556 (contains!2551 lt!216166 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!474483 () Bool)

(assert (=> b!474483 (= e!278497 call!30555)))

(declare-fun b!474484 () Bool)

(declare-fun c!57118 () Bool)

(assert (=> b!474484 (= c!57118 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!474484 (= e!278491 e!278497)))

(declare-fun bm!30554 () Bool)

(assert (=> bm!30554 (= call!30554 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474485 () Bool)

(declare-fun res!283400 () Bool)

(assert (=> b!474485 (=> (not res!283400) (not e!278492))))

(assert (=> b!474485 (= res!283400 e!278498)))

(declare-fun res!283395 () Bool)

(assert (=> b!474485 (=> res!283395 e!278498)))

(assert (=> b!474485 (= res!283395 (not e!278496))))

(declare-fun res!283403 () Bool)

(assert (=> b!474485 (=> (not res!283403) (not e!278496))))

(assert (=> b!474485 (= res!283403 (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun bm!30555 () Bool)

(assert (=> bm!30555 (= call!30553 (+!1752 (ite c!57116 call!30554 (ite c!57117 call!30557 call!30552)) (ite (or c!57116 c!57117) (tuple2!8891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!474486 () Bool)

(assert (=> b!474486 (= e!278494 e!278495)))

(declare-fun res!283402 () Bool)

(assert (=> b!474486 (= res!283402 call!30558)))

(assert (=> b!474486 (=> (not res!283402) (not e!278495))))

(assert (= (and d!75561 c!57116) b!474470))

(assert (= (and d!75561 (not c!57116)) b!474476))

(assert (= (and b!474476 c!57117) b!474478))

(assert (= (and b!474476 (not c!57117)) b!474484))

(assert (= (and b!474484 c!57118) b!474483))

(assert (= (and b!474484 (not c!57118)) b!474466))

(assert (= (or b!474483 b!474466) bm!30550))

(assert (= (or b!474478 bm!30550) bm!30552))

(assert (= (or b!474478 b!474483) bm!30549))

(assert (= (or b!474470 bm!30552) bm!30554))

(assert (= (or b!474470 bm!30549) bm!30555))

(assert (= (and d!75561 res!283398) b!474472))

(assert (= (and d!75561 c!57114) b!474473))

(assert (= (and d!75561 (not c!57114)) b!474479))

(assert (= (and d!75561 res!283399) b!474485))

(assert (= (and b!474485 res!283403) b!474471))

(assert (= (and b!474485 (not res!283395)) b!474482))

(assert (= (and b!474482 res!283396) b!474480))

(assert (= (and b!474485 res!283400) b!474467))

(assert (= (and b!474467 c!57115) b!474486))

(assert (= (and b!474467 (not c!57115)) b!474477))

(assert (= (and b!474486 res!283402) b!474469))

(assert (= (or b!474486 b!474477) bm!30551))

(assert (= (and b!474467 res!283401) b!474468))

(assert (= (and b!474468 c!57113) b!474481))

(assert (= (and b!474468 (not c!57113)) b!474474))

(assert (= (and b!474481 res!283397) b!474475))

(assert (= (or b!474481 b!474474) bm!30553))

(declare-fun b_lambda!10231 () Bool)

(assert (=> (not b_lambda!10231) (not b!474480)))

(assert (=> b!474480 t!14943))

(declare-fun b_and!20441 () Bool)

(assert (= b_and!20439 (and (=> t!14943 result!7451) b_and!20441)))

(assert (=> b!474471 m!456749))

(assert (=> b!474471 m!456749))

(assert (=> b!474471 m!456751))

(assert (=> d!75561 m!456709))

(declare-fun m!456853 () Bool)

(assert (=> bm!30551 m!456853))

(declare-fun m!456855 () Bool)

(assert (=> b!474473 m!456855))

(declare-fun m!456857 () Bool)

(assert (=> b!474473 m!456857))

(declare-fun m!456859 () Bool)

(assert (=> b!474473 m!456859))

(declare-fun m!456861 () Bool)

(assert (=> b!474473 m!456861))

(declare-fun m!456863 () Bool)

(assert (=> b!474473 m!456863))

(declare-fun m!456865 () Bool)

(assert (=> b!474473 m!456865))

(declare-fun m!456867 () Bool)

(assert (=> b!474473 m!456867))

(declare-fun m!456869 () Bool)

(assert (=> b!474473 m!456869))

(declare-fun m!456871 () Bool)

(assert (=> b!474473 m!456871))

(declare-fun m!456873 () Bool)

(assert (=> b!474473 m!456873))

(assert (=> b!474473 m!456857))

(assert (=> b!474473 m!456689))

(declare-fun m!456875 () Bool)

(assert (=> b!474473 m!456875))

(assert (=> b!474473 m!456863))

(assert (=> b!474473 m!456869))

(declare-fun m!456877 () Bool)

(assert (=> b!474473 m!456877))

(declare-fun m!456879 () Bool)

(assert (=> b!474473 m!456879))

(declare-fun m!456881 () Bool)

(assert (=> b!474473 m!456881))

(assert (=> b!474473 m!456749))

(declare-fun m!456883 () Bool)

(assert (=> b!474473 m!456883))

(assert (=> b!474473 m!456877))

(declare-fun m!456885 () Bool)

(assert (=> bm!30553 m!456885))

(declare-fun m!456887 () Bool)

(assert (=> b!474470 m!456887))

(assert (=> b!474482 m!456749))

(assert (=> b!474482 m!456749))

(declare-fun m!456889 () Bool)

(assert (=> b!474482 m!456889))

(declare-fun m!456891 () Bool)

(assert (=> bm!30555 m!456891))

(assert (=> bm!30554 m!456689))

(assert (=> b!474480 m!456793))

(assert (=> b!474480 m!456795))

(assert (=> b!474480 m!456795))

(assert (=> b!474480 m!456793))

(assert (=> b!474480 m!456797))

(assert (=> b!474480 m!456749))

(declare-fun m!456893 () Bool)

(assert (=> b!474480 m!456893))

(assert (=> b!474480 m!456749))

(declare-fun m!456895 () Bool)

(assert (=> b!474469 m!456895))

(assert (=> b!474472 m!456749))

(assert (=> b!474472 m!456749))

(assert (=> b!474472 m!456751))

(declare-fun m!456897 () Bool)

(assert (=> b!474475 m!456897))

(assert (=> b!474364 d!75561))

(declare-fun d!75563 () Bool)

(assert (=> d!75563 (= (+!1752 lt!216038 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1752 (+!1752 lt!216038 (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!216178 () Unit!13992)

(declare-fun choose!1353 (ListLongMap!7803 (_ BitVec 64) V!18965 V!18965) Unit!13992)

(assert (=> d!75563 (= lt!216178 (choose!1353 lt!216038 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75563 (= (addSameAsAddTwiceSameKeyDiffValues!161 lt!216038 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!216178)))

(declare-fun bs!15061 () Bool)

(assert (= bs!15061 d!75563))

(declare-fun m!456899 () Bool)

(assert (=> bs!15061 m!456899))

(assert (=> bs!15061 m!456691))

(assert (=> bs!15061 m!456691))

(declare-fun m!456901 () Bool)

(assert (=> bs!15061 m!456901))

(declare-fun m!456903 () Bool)

(assert (=> bs!15061 m!456903))

(assert (=> b!474364 d!75563))

(declare-fun d!75565 () Bool)

(assert (=> d!75565 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42512 d!75565))

(declare-fun d!75567 () Bool)

(assert (=> d!75567 (= (array_inv!10598 _keys!1025) (bvsge (size!15039 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42512 d!75567))

(declare-fun d!75569 () Bool)

(assert (=> d!75569 (= (array_inv!10599 _values!833) (bvsge (size!15040 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42512 d!75569))

(declare-fun d!75571 () Bool)

(assert (=> d!75571 (= (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216181 () Unit!13992)

(declare-fun choose!1354 (array!30537 array!30539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18965 V!18965 V!18965 V!18965 (_ BitVec 32) Int) Unit!13992)

(assert (=> d!75571 (= lt!216181 (choose!1354 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75571 (validMask!0 mask!1365)))

(assert (=> d!75571 (= (lemmaNoChangeToArrayThenSameMapNoExtras!254 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216181)))

(declare-fun bs!15062 () Bool)

(assert (= bs!15062 d!75571))

(assert (=> bs!15062 m!456689))

(assert (=> bs!15062 m!456687))

(declare-fun m!456905 () Bool)

(assert (=> bs!15062 m!456905))

(assert (=> bs!15062 m!456709))

(assert (=> b!474362 d!75571))

(declare-fun b!474511 () Bool)

(declare-fun e!278514 () Bool)

(declare-fun lt!216200 () ListLongMap!7803)

(assert (=> b!474511 (= e!278514 (= lt!216200 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!474512 () Bool)

(declare-fun e!278513 () ListLongMap!7803)

(declare-fun call!30561 () ListLongMap!7803)

(assert (=> b!474512 (= e!278513 call!30561)))

(declare-fun b!474513 () Bool)

(assert (=> b!474513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(assert (=> b!474513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15040 _values!833)))))

(declare-fun e!278515 () Bool)

(assert (=> b!474513 (= e!278515 (= (apply!333 lt!216200 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)) (get!7134 (select (arr!14688 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!474514 () Bool)

(declare-fun e!278516 () ListLongMap!7803)

(assert (=> b!474514 (= e!278516 (ListLongMap!7804 Nil!8965))))

(declare-fun b!474515 () Bool)

(declare-fun lt!216201 () Unit!13992)

(declare-fun lt!216202 () Unit!13992)

(assert (=> b!474515 (= lt!216201 lt!216202)))

(declare-fun lt!216199 () (_ BitVec 64))

(declare-fun lt!216198 () V!18965)

(declare-fun lt!216197 () (_ BitVec 64))

(declare-fun lt!216196 () ListLongMap!7803)

(assert (=> b!474515 (not (contains!2551 (+!1752 lt!216196 (tuple2!8891 lt!216197 lt!216198)) lt!216199))))

(declare-fun addStillNotContains!166 (ListLongMap!7803 (_ BitVec 64) V!18965 (_ BitVec 64)) Unit!13992)

(assert (=> b!474515 (= lt!216202 (addStillNotContains!166 lt!216196 lt!216197 lt!216198 lt!216199))))

(assert (=> b!474515 (= lt!216199 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!474515 (= lt!216198 (get!7134 (select (arr!14688 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!474515 (= lt!216197 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474515 (= lt!216196 call!30561)))

(assert (=> b!474515 (= e!278513 (+!1752 call!30561 (tuple2!8891 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000) (get!7134 (select (arr!14688 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30558 () Bool)

(assert (=> bm!30558 (= call!30561 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!474516 () Bool)

(declare-fun e!278517 () Bool)

(assert (=> b!474516 (= e!278517 e!278515)))

(assert (=> b!474516 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun res!283413 () Bool)

(assert (=> b!474516 (= res!283413 (contains!2551 lt!216200 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474516 (=> (not res!283413) (not e!278515))))

(declare-fun b!474517 () Bool)

(declare-fun e!278518 () Bool)

(assert (=> b!474517 (= e!278518 e!278517)))

(declare-fun c!57129 () Bool)

(declare-fun e!278519 () Bool)

(assert (=> b!474517 (= c!57129 e!278519)))

(declare-fun res!283415 () Bool)

(assert (=> b!474517 (=> (not res!283415) (not e!278519))))

(assert (=> b!474517 (= res!283415 (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun b!474518 () Bool)

(assert (=> b!474518 (= e!278519 (validKeyInArray!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474518 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!474519 () Bool)

(declare-fun isEmpty!580 (ListLongMap!7803) Bool)

(assert (=> b!474519 (= e!278514 (isEmpty!580 lt!216200))))

(declare-fun b!474520 () Bool)

(declare-fun res!283412 () Bool)

(assert (=> b!474520 (=> (not res!283412) (not e!278518))))

(assert (=> b!474520 (= res!283412 (not (contains!2551 lt!216200 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!75573 () Bool)

(assert (=> d!75573 e!278518))

(declare-fun res!283414 () Bool)

(assert (=> d!75573 (=> (not res!283414) (not e!278518))))

(assert (=> d!75573 (= res!283414 (not (contains!2551 lt!216200 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75573 (= lt!216200 e!278516)))

(declare-fun c!57128 () Bool)

(assert (=> d!75573 (= c!57128 (bvsge #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(assert (=> d!75573 (validMask!0 mask!1365)))

(assert (=> d!75573 (= (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216200)))

(declare-fun b!474521 () Bool)

(assert (=> b!474521 (= e!278517 e!278514)))

(declare-fun c!57127 () Bool)

(assert (=> b!474521 (= c!57127 (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun b!474522 () Bool)

(assert (=> b!474522 (= e!278516 e!278513)))

(declare-fun c!57130 () Bool)

(assert (=> b!474522 (= c!57130 (validKeyInArray!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75573 c!57128) b!474514))

(assert (= (and d!75573 (not c!57128)) b!474522))

(assert (= (and b!474522 c!57130) b!474515))

(assert (= (and b!474522 (not c!57130)) b!474512))

(assert (= (or b!474515 b!474512) bm!30558))

(assert (= (and d!75573 res!283414) b!474520))

(assert (= (and b!474520 res!283412) b!474517))

(assert (= (and b!474517 res!283415) b!474518))

(assert (= (and b!474517 c!57129) b!474516))

(assert (= (and b!474517 (not c!57129)) b!474521))

(assert (= (and b!474516 res!283413) b!474513))

(assert (= (and b!474521 c!57127) b!474511))

(assert (= (and b!474521 (not c!57127)) b!474519))

(declare-fun b_lambda!10233 () Bool)

(assert (=> (not b_lambda!10233) (not b!474513)))

(assert (=> b!474513 t!14943))

(declare-fun b_and!20443 () Bool)

(assert (= b_and!20441 (and (=> t!14943 result!7451) b_and!20443)))

(declare-fun b_lambda!10235 () Bool)

(assert (=> (not b_lambda!10235) (not b!474515)))

(assert (=> b!474515 t!14943))

(declare-fun b_and!20445 () Bool)

(assert (= b_and!20443 (and (=> t!14943 result!7451) b_and!20445)))

(assert (=> b!474522 m!456749))

(assert (=> b!474522 m!456749))

(assert (=> b!474522 m!456751))

(declare-fun m!456907 () Bool)

(assert (=> bm!30558 m!456907))

(declare-fun m!456909 () Bool)

(assert (=> d!75573 m!456909))

(assert (=> d!75573 m!456709))

(assert (=> b!474513 m!456749))

(declare-fun m!456911 () Bool)

(assert (=> b!474513 m!456911))

(assert (=> b!474513 m!456793))

(assert (=> b!474513 m!456795))

(assert (=> b!474513 m!456749))

(assert (=> b!474513 m!456795))

(assert (=> b!474513 m!456793))

(assert (=> b!474513 m!456797))

(assert (=> b!474511 m!456907))

(assert (=> b!474518 m!456749))

(assert (=> b!474518 m!456749))

(assert (=> b!474518 m!456751))

(assert (=> b!474516 m!456749))

(assert (=> b!474516 m!456749))

(declare-fun m!456913 () Bool)

(assert (=> b!474516 m!456913))

(declare-fun m!456915 () Bool)

(assert (=> b!474519 m!456915))

(assert (=> b!474515 m!456793))

(declare-fun m!456917 () Bool)

(assert (=> b!474515 m!456917))

(assert (=> b!474515 m!456795))

(declare-fun m!456919 () Bool)

(assert (=> b!474515 m!456919))

(declare-fun m!456921 () Bool)

(assert (=> b!474515 m!456921))

(declare-fun m!456923 () Bool)

(assert (=> b!474515 m!456923))

(assert (=> b!474515 m!456795))

(assert (=> b!474515 m!456793))

(assert (=> b!474515 m!456797))

(assert (=> b!474515 m!456749))

(assert (=> b!474515 m!456921))

(declare-fun m!456925 () Bool)

(assert (=> b!474520 m!456925))

(assert (=> b!474362 d!75573))

(declare-fun lt!216207 () ListLongMap!7803)

(declare-fun b!474523 () Bool)

(declare-fun e!278521 () Bool)

(assert (=> b!474523 (= e!278521 (= lt!216207 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!474524 () Bool)

(declare-fun e!278520 () ListLongMap!7803)

(declare-fun call!30562 () ListLongMap!7803)

(assert (=> b!474524 (= e!278520 call!30562)))

(declare-fun b!474525 () Bool)

(assert (=> b!474525 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(assert (=> b!474525 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15040 _values!833)))))

(declare-fun e!278522 () Bool)

(assert (=> b!474525 (= e!278522 (= (apply!333 lt!216207 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)) (get!7134 (select (arr!14688 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!474526 () Bool)

(declare-fun e!278523 () ListLongMap!7803)

(assert (=> b!474526 (= e!278523 (ListLongMap!7804 Nil!8965))))

(declare-fun b!474527 () Bool)

(declare-fun lt!216208 () Unit!13992)

(declare-fun lt!216209 () Unit!13992)

(assert (=> b!474527 (= lt!216208 lt!216209)))

(declare-fun lt!216206 () (_ BitVec 64))

(declare-fun lt!216203 () ListLongMap!7803)

(declare-fun lt!216204 () (_ BitVec 64))

(declare-fun lt!216205 () V!18965)

(assert (=> b!474527 (not (contains!2551 (+!1752 lt!216203 (tuple2!8891 lt!216204 lt!216205)) lt!216206))))

(assert (=> b!474527 (= lt!216209 (addStillNotContains!166 lt!216203 lt!216204 lt!216205 lt!216206))))

(assert (=> b!474527 (= lt!216206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!474527 (= lt!216205 (get!7134 (select (arr!14688 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!474527 (= lt!216204 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474527 (= lt!216203 call!30562)))

(assert (=> b!474527 (= e!278520 (+!1752 call!30562 (tuple2!8891 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000) (get!7134 (select (arr!14688 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30559 () Bool)

(assert (=> bm!30559 (= call!30562 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!474528 () Bool)

(declare-fun e!278524 () Bool)

(assert (=> b!474528 (= e!278524 e!278522)))

(assert (=> b!474528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun res!283417 () Bool)

(assert (=> b!474528 (= res!283417 (contains!2551 lt!216207 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474528 (=> (not res!283417) (not e!278522))))

(declare-fun b!474529 () Bool)

(declare-fun e!278525 () Bool)

(assert (=> b!474529 (= e!278525 e!278524)))

(declare-fun c!57133 () Bool)

(declare-fun e!278526 () Bool)

(assert (=> b!474529 (= c!57133 e!278526)))

(declare-fun res!283419 () Bool)

(assert (=> b!474529 (=> (not res!283419) (not e!278526))))

(assert (=> b!474529 (= res!283419 (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun b!474530 () Bool)

(assert (=> b!474530 (= e!278526 (validKeyInArray!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474530 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!474531 () Bool)

(assert (=> b!474531 (= e!278521 (isEmpty!580 lt!216207))))

(declare-fun b!474532 () Bool)

(declare-fun res!283416 () Bool)

(assert (=> b!474532 (=> (not res!283416) (not e!278525))))

(assert (=> b!474532 (= res!283416 (not (contains!2551 lt!216207 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!75575 () Bool)

(assert (=> d!75575 e!278525))

(declare-fun res!283418 () Bool)

(assert (=> d!75575 (=> (not res!283418) (not e!278525))))

(assert (=> d!75575 (= res!283418 (not (contains!2551 lt!216207 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75575 (= lt!216207 e!278523)))

(declare-fun c!57132 () Bool)

(assert (=> d!75575 (= c!57132 (bvsge #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(assert (=> d!75575 (validMask!0 mask!1365)))

(assert (=> d!75575 (= (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216207)))

(declare-fun b!474533 () Bool)

(assert (=> b!474533 (= e!278524 e!278521)))

(declare-fun c!57131 () Bool)

(assert (=> b!474533 (= c!57131 (bvslt #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(declare-fun b!474534 () Bool)

(assert (=> b!474534 (= e!278523 e!278520)))

(declare-fun c!57134 () Bool)

(assert (=> b!474534 (= c!57134 (validKeyInArray!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75575 c!57132) b!474526))

(assert (= (and d!75575 (not c!57132)) b!474534))

(assert (= (and b!474534 c!57134) b!474527))

(assert (= (and b!474534 (not c!57134)) b!474524))

(assert (= (or b!474527 b!474524) bm!30559))

(assert (= (and d!75575 res!283418) b!474532))

(assert (= (and b!474532 res!283416) b!474529))

(assert (= (and b!474529 res!283419) b!474530))

(assert (= (and b!474529 c!57133) b!474528))

(assert (= (and b!474529 (not c!57133)) b!474533))

(assert (= (and b!474528 res!283417) b!474525))

(assert (= (and b!474533 c!57131) b!474523))

(assert (= (and b!474533 (not c!57131)) b!474531))

(declare-fun b_lambda!10237 () Bool)

(assert (=> (not b_lambda!10237) (not b!474525)))

(assert (=> b!474525 t!14943))

(declare-fun b_and!20447 () Bool)

(assert (= b_and!20445 (and (=> t!14943 result!7451) b_and!20447)))

(declare-fun b_lambda!10239 () Bool)

(assert (=> (not b_lambda!10239) (not b!474527)))

(assert (=> b!474527 t!14943))

(declare-fun b_and!20449 () Bool)

(assert (= b_and!20447 (and (=> t!14943 result!7451) b_and!20449)))

(assert (=> b!474534 m!456749))

(assert (=> b!474534 m!456749))

(assert (=> b!474534 m!456751))

(declare-fun m!456927 () Bool)

(assert (=> bm!30559 m!456927))

(declare-fun m!456929 () Bool)

(assert (=> d!75575 m!456929))

(assert (=> d!75575 m!456709))

(assert (=> b!474525 m!456749))

(declare-fun m!456931 () Bool)

(assert (=> b!474525 m!456931))

(assert (=> b!474525 m!456793))

(assert (=> b!474525 m!456795))

(assert (=> b!474525 m!456749))

(assert (=> b!474525 m!456795))

(assert (=> b!474525 m!456793))

(assert (=> b!474525 m!456797))

(assert (=> b!474523 m!456927))

(assert (=> b!474530 m!456749))

(assert (=> b!474530 m!456749))

(assert (=> b!474530 m!456751))

(assert (=> b!474528 m!456749))

(assert (=> b!474528 m!456749))

(declare-fun m!456933 () Bool)

(assert (=> b!474528 m!456933))

(declare-fun m!456935 () Bool)

(assert (=> b!474531 m!456935))

(assert (=> b!474527 m!456793))

(declare-fun m!456937 () Bool)

(assert (=> b!474527 m!456937))

(assert (=> b!474527 m!456795))

(declare-fun m!456939 () Bool)

(assert (=> b!474527 m!456939))

(declare-fun m!456941 () Bool)

(assert (=> b!474527 m!456941))

(declare-fun m!456943 () Bool)

(assert (=> b!474527 m!456943))

(assert (=> b!474527 m!456795))

(assert (=> b!474527 m!456793))

(assert (=> b!474527 m!456797))

(assert (=> b!474527 m!456749))

(assert (=> b!474527 m!456941))

(declare-fun m!456945 () Bool)

(assert (=> b!474532 m!456945))

(assert (=> b!474362 d!75575))

(declare-fun b!474545 () Bool)

(declare-fun e!278535 () Bool)

(declare-fun call!30565 () Bool)

(assert (=> b!474545 (= e!278535 call!30565)))

(declare-fun b!474546 () Bool)

(declare-fun e!278536 () Bool)

(declare-fun contains!2553 (List!8967 (_ BitVec 64)) Bool)

(assert (=> b!474546 (= e!278536 (contains!2553 Nil!8964 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30562 () Bool)

(declare-fun c!57137 () Bool)

(assert (=> bm!30562 (= call!30565 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57137 (Cons!8963 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000) Nil!8964) Nil!8964)))))

(declare-fun b!474547 () Bool)

(assert (=> b!474547 (= e!278535 call!30565)))

(declare-fun b!474548 () Bool)

(declare-fun e!278537 () Bool)

(assert (=> b!474548 (= e!278537 e!278535)))

(assert (=> b!474548 (= c!57137 (validKeyInArray!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75577 () Bool)

(declare-fun res!283428 () Bool)

(declare-fun e!278538 () Bool)

(assert (=> d!75577 (=> res!283428 e!278538)))

(assert (=> d!75577 (= res!283428 (bvsge #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(assert (=> d!75577 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8964) e!278538)))

(declare-fun b!474549 () Bool)

(assert (=> b!474549 (= e!278538 e!278537)))

(declare-fun res!283427 () Bool)

(assert (=> b!474549 (=> (not res!283427) (not e!278537))))

(assert (=> b!474549 (= res!283427 (not e!278536))))

(declare-fun res!283426 () Bool)

(assert (=> b!474549 (=> (not res!283426) (not e!278536))))

(assert (=> b!474549 (= res!283426 (validKeyInArray!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75577 (not res!283428)) b!474549))

(assert (= (and b!474549 res!283426) b!474546))

(assert (= (and b!474549 res!283427) b!474548))

(assert (= (and b!474548 c!57137) b!474545))

(assert (= (and b!474548 (not c!57137)) b!474547))

(assert (= (or b!474545 b!474547) bm!30562))

(assert (=> b!474546 m!456749))

(assert (=> b!474546 m!456749))

(declare-fun m!456947 () Bool)

(assert (=> b!474546 m!456947))

(assert (=> bm!30562 m!456749))

(declare-fun m!456949 () Bool)

(assert (=> bm!30562 m!456949))

(assert (=> b!474548 m!456749))

(assert (=> b!474548 m!456749))

(assert (=> b!474548 m!456751))

(assert (=> b!474549 m!456749))

(assert (=> b!474549 m!456749))

(assert (=> b!474549 m!456751))

(assert (=> b!474361 d!75577))

(declare-fun b!474559 () Bool)

(declare-fun e!278546 () Bool)

(declare-fun call!30568 () Bool)

(assert (=> b!474559 (= e!278546 call!30568)))

(declare-fun b!474560 () Bool)

(declare-fun e!278547 () Bool)

(assert (=> b!474560 (= e!278547 e!278546)))

(declare-fun lt!216217 () (_ BitVec 64))

(assert (=> b!474560 (= lt!216217 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216218 () Unit!13992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30537 (_ BitVec 64) (_ BitVec 32)) Unit!13992)

(assert (=> b!474560 (= lt!216218 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216217 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!474560 (arrayContainsKey!0 _keys!1025 lt!216217 #b00000000000000000000000000000000)))

(declare-fun lt!216216 () Unit!13992)

(assert (=> b!474560 (= lt!216216 lt!216218)))

(declare-fun res!283434 () Bool)

(declare-datatypes ((SeekEntryResult!3557 0))(
  ( (MissingZero!3557 (index!16407 (_ BitVec 32))) (Found!3557 (index!16408 (_ BitVec 32))) (Intermediate!3557 (undefined!4369 Bool) (index!16409 (_ BitVec 32)) (x!44508 (_ BitVec 32))) (Undefined!3557) (MissingVacant!3557 (index!16410 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30537 (_ BitVec 32)) SeekEntryResult!3557)

(assert (=> b!474560 (= res!283434 (= (seekEntryOrOpen!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3557 #b00000000000000000000000000000000)))))

(assert (=> b!474560 (=> (not res!283434) (not e!278546))))

(declare-fun b!474561 () Bool)

(assert (=> b!474561 (= e!278547 call!30568)))

(declare-fun bm!30565 () Bool)

(assert (=> bm!30565 (= call!30568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!75579 () Bool)

(declare-fun res!283433 () Bool)

(declare-fun e!278545 () Bool)

(assert (=> d!75579 (=> res!283433 e!278545)))

(assert (=> d!75579 (= res!283433 (bvsge #b00000000000000000000000000000000 (size!15039 _keys!1025)))))

(assert (=> d!75579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!278545)))

(declare-fun b!474558 () Bool)

(assert (=> b!474558 (= e!278545 e!278547)))

(declare-fun c!57140 () Bool)

(assert (=> b!474558 (= c!57140 (validKeyInArray!0 (select (arr!14687 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75579 (not res!283433)) b!474558))

(assert (= (and b!474558 c!57140) b!474560))

(assert (= (and b!474558 (not c!57140)) b!474561))

(assert (= (and b!474560 res!283434) b!474559))

(assert (= (or b!474559 b!474561) bm!30565))

(assert (=> b!474560 m!456749))

(declare-fun m!456951 () Bool)

(assert (=> b!474560 m!456951))

(declare-fun m!456953 () Bool)

(assert (=> b!474560 m!456953))

(assert (=> b!474560 m!456749))

(declare-fun m!456955 () Bool)

(assert (=> b!474560 m!456955))

(declare-fun m!456957 () Bool)

(assert (=> bm!30565 m!456957))

(assert (=> b!474558 m!456749))

(assert (=> b!474558 m!456749))

(assert (=> b!474558 m!456751))

(assert (=> b!474357 d!75579))

(declare-fun mapNonEmpty!21814 () Bool)

(declare-fun mapRes!21814 () Bool)

(declare-fun tp!41947 () Bool)

(declare-fun e!278552 () Bool)

(assert (=> mapNonEmpty!21814 (= mapRes!21814 (and tp!41947 e!278552))))

(declare-fun mapKey!21814 () (_ BitVec 32))

(declare-fun mapValue!21814 () ValueCell!6354)

(declare-fun mapRest!21814 () (Array (_ BitVec 32) ValueCell!6354))

(assert (=> mapNonEmpty!21814 (= mapRest!21808 (store mapRest!21814 mapKey!21814 mapValue!21814))))

(declare-fun condMapEmpty!21814 () Bool)

(declare-fun mapDefault!21814 () ValueCell!6354)

(assert (=> mapNonEmpty!21808 (= condMapEmpty!21814 (= mapRest!21808 ((as const (Array (_ BitVec 32) ValueCell!6354)) mapDefault!21814)))))

(declare-fun e!278553 () Bool)

(assert (=> mapNonEmpty!21808 (= tp!41937 (and e!278553 mapRes!21814))))

(declare-fun b!474569 () Bool)

(assert (=> b!474569 (= e!278553 tp_is_empty!13395)))

(declare-fun b!474568 () Bool)

(assert (=> b!474568 (= e!278552 tp_is_empty!13395)))

(declare-fun mapIsEmpty!21814 () Bool)

(assert (=> mapIsEmpty!21814 mapRes!21814))

(assert (= (and mapNonEmpty!21808 condMapEmpty!21814) mapIsEmpty!21814))

(assert (= (and mapNonEmpty!21808 (not condMapEmpty!21814)) mapNonEmpty!21814))

(assert (= (and mapNonEmpty!21814 ((_ is ValueCellFull!6354) mapValue!21814)) b!474568))

(assert (= (and mapNonEmpty!21808 ((_ is ValueCellFull!6354) mapDefault!21814)) b!474569))

(declare-fun m!456959 () Bool)

(assert (=> mapNonEmpty!21814 m!456959))

(declare-fun b_lambda!10241 () Bool)

(assert (= b_lambda!10231 (or (and start!42512 b_free!11967) b_lambda!10241)))

(declare-fun b_lambda!10243 () Bool)

(assert (= b_lambda!10237 (or (and start!42512 b_free!11967) b_lambda!10243)))

(declare-fun b_lambda!10245 () Bool)

(assert (= b_lambda!10239 (or (and start!42512 b_free!11967) b_lambda!10245)))

(declare-fun b_lambda!10247 () Bool)

(assert (= b_lambda!10235 (or (and start!42512 b_free!11967) b_lambda!10247)))

(declare-fun b_lambda!10249 () Bool)

(assert (= b_lambda!10229 (or (and start!42512 b_free!11967) b_lambda!10249)))

(declare-fun b_lambda!10251 () Bool)

(assert (= b_lambda!10233 (or (and start!42512 b_free!11967) b_lambda!10251)))

(check-sat (not b!474549) (not d!75555) (not b_lambda!10251) (not b!474463) (not d!75563) (not bm!30559) (not b!474531) (not b!474534) (not b!474470) (not b!474519) (not b!474471) (not b!474525) (not b!474437) (not b!474458) (not b!474546) (not b!474520) (not b!474511) (not b!474469) (not b!474438) (not b!474528) (not b!474475) (not b!474465) (not b_lambda!10249) (not bm!30548) (not b_lambda!10243) (not d!75573) (not b!474464) (not b!474527) (not bm!30555) (not b!474482) (not b!474548) (not bm!30546) (not d!75561) (not b!474515) (not b!474558) (not bm!30547) tp_is_empty!13395 (not b!474522) (not bm!30544) (not b!474434) (not b_lambda!10247) (not b!474462) (not bm!30558) (not bm!30562) (not mapNonEmpty!21814) (not b!474530) (not bm!30565) (not d!75559) (not b!474461) (not b!474447) b_and!20449 (not b!474445) (not bm!30553) (not b_lambda!10245) (not b!474435) (not b!474436) (not b!474459) (not b!474523) (not b!474473) (not b!474516) (not b!474532) (not b_next!11967) (not b!474560) (not b!474440) (not d!75553) (not b!474480) (not b!474513) (not b!474472) (not d!75551) (not bm!30551) (not d!75571) (not bm!30554) (not b!474460) (not b_lambda!10241) (not d!75575) (not b!474518) (not d!75557))
(check-sat b_and!20449 (not b_next!11967))
