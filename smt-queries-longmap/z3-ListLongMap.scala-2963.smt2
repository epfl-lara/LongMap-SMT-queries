; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42016 () Bool)

(assert start!42016)

(declare-fun b_free!11589 () Bool)

(declare-fun b_next!11589 () Bool)

(assert (=> start!42016 (= b_free!11589 (not b_next!11589))))

(declare-fun tp!40783 () Bool)

(declare-fun b_and!19987 () Bool)

(assert (=> start!42016 (= tp!40783 b_and!19987)))

(declare-fun b!469122 () Bool)

(declare-fun res!280363 () Bool)

(declare-fun e!274667 () Bool)

(assert (=> b!469122 (=> (not res!280363) (not e!274667))))

(declare-datatypes ((array!29805 0))(
  ( (array!29806 (arr!14328 (Array (_ BitVec 32) (_ BitVec 64))) (size!14680 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29805)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29805 (_ BitVec 32)) Bool)

(assert (=> b!469122 (= res!280363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21220 () Bool)

(declare-fun mapRes!21220 () Bool)

(assert (=> mapIsEmpty!21220 mapRes!21220))

(declare-fun b!469123 () Bool)

(declare-fun res!280360 () Bool)

(assert (=> b!469123 (=> (not res!280360) (not e!274667))))

(declare-datatypes ((List!8701 0))(
  ( (Nil!8698) (Cons!8697 (h!9553 (_ BitVec 64)) (t!14659 List!8701)) )
))
(declare-fun arrayNoDuplicates!0 (array!29805 (_ BitVec 32) List!8701) Bool)

(assert (=> b!469123 (= res!280360 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8698))))

(declare-fun res!280362 () Bool)

(assert (=> start!42016 (=> (not res!280362) (not e!274667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42016 (= res!280362 (validMask!0 mask!1365))))

(assert (=> start!42016 e!274667))

(declare-fun tp_is_empty!13017 () Bool)

(assert (=> start!42016 tp_is_empty!13017))

(assert (=> start!42016 tp!40783))

(assert (=> start!42016 true))

(declare-fun array_inv!10340 (array!29805) Bool)

(assert (=> start!42016 (array_inv!10340 _keys!1025)))

(declare-datatypes ((V!18461 0))(
  ( (V!18462 (val!6553 Int)) )
))
(declare-datatypes ((ValueCell!6165 0))(
  ( (ValueCellFull!6165 (v!8842 V!18461)) (EmptyCell!6165) )
))
(declare-datatypes ((array!29807 0))(
  ( (array!29808 (arr!14329 (Array (_ BitVec 32) ValueCell!6165)) (size!14681 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29807)

(declare-fun e!274663 () Bool)

(declare-fun array_inv!10341 (array!29807) Bool)

(assert (=> start!42016 (and (array_inv!10341 _values!833) e!274663)))

(declare-fun b!469124 () Bool)

(declare-fun e!274662 () Bool)

(assert (=> b!469124 (= e!274662 tp_is_empty!13017)))

(declare-fun b!469125 () Bool)

(assert (=> b!469125 (= e!274663 (and e!274662 mapRes!21220))))

(declare-fun condMapEmpty!21220 () Bool)

(declare-fun mapDefault!21220 () ValueCell!6165)

(assert (=> b!469125 (= condMapEmpty!21220 (= (arr!14329 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6165)) mapDefault!21220)))))

(declare-fun b!469126 () Bool)

(declare-fun e!274665 () Bool)

(assert (=> b!469126 (= e!274665 (bvsle #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-datatypes ((tuple2!8620 0))(
  ( (tuple2!8621 (_1!4321 (_ BitVec 64)) (_2!4321 V!18461)) )
))
(declare-datatypes ((List!8702 0))(
  ( (Nil!8699) (Cons!8698 (h!9554 tuple2!8620) (t!14660 List!8702)) )
))
(declare-datatypes ((ListLongMap!7533 0))(
  ( (ListLongMap!7534 (toList!3782 List!8702)) )
))
(declare-fun lt!212440 () ListLongMap!7533)

(declare-fun lt!212438 () tuple2!8620)

(declare-fun minValueBefore!38 () V!18461)

(declare-fun +!1692 (ListLongMap!7533 tuple2!8620) ListLongMap!7533)

(assert (=> b!469126 (= (+!1692 lt!212440 lt!212438) (+!1692 (+!1692 lt!212440 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212438))))

(declare-fun minValueAfter!38 () V!18461)

(assert (=> b!469126 (= lt!212438 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13719 0))(
  ( (Unit!13720) )
))
(declare-fun lt!212437 () Unit!13719)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!105 (ListLongMap!7533 (_ BitVec 64) V!18461 V!18461) Unit!13719)

(assert (=> b!469126 (= lt!212437 (addSameAsAddTwiceSameKeyDiffValues!105 lt!212440 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18461)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212443 () ListLongMap!7533)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2206 (array!29805 array!29807 (_ BitVec 32) (_ BitVec 32) V!18461 V!18461 (_ BitVec 32) Int) ListLongMap!7533)

(assert (=> b!469126 (= lt!212443 (getCurrentListMap!2206 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212441 () ListLongMap!7533)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469126 (= lt!212441 (getCurrentListMap!2206 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469127 () Bool)

(assert (=> b!469127 (= e!274667 (not e!274665))))

(declare-fun res!280361 () Bool)

(assert (=> b!469127 (=> res!280361 e!274665)))

(assert (=> b!469127 (= res!280361 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212442 () ListLongMap!7533)

(assert (=> b!469127 (= lt!212440 lt!212442)))

(declare-fun lt!212439 () Unit!13719)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!131 (array!29805 array!29807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18461 V!18461 V!18461 V!18461 (_ BitVec 32) Int) Unit!13719)

(assert (=> b!469127 (= lt!212439 (lemmaNoChangeToArrayThenSameMapNoExtras!131 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1951 (array!29805 array!29807 (_ BitVec 32) (_ BitVec 32) V!18461 V!18461 (_ BitVec 32) Int) ListLongMap!7533)

(assert (=> b!469127 (= lt!212442 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469127 (= lt!212440 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469128 () Bool)

(declare-fun res!280364 () Bool)

(assert (=> b!469128 (=> (not res!280364) (not e!274667))))

(assert (=> b!469128 (= res!280364 (and (= (size!14681 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14680 _keys!1025) (size!14681 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469129 () Bool)

(declare-fun e!274666 () Bool)

(assert (=> b!469129 (= e!274666 tp_is_empty!13017)))

(declare-fun mapNonEmpty!21220 () Bool)

(declare-fun tp!40782 () Bool)

(assert (=> mapNonEmpty!21220 (= mapRes!21220 (and tp!40782 e!274666))))

(declare-fun mapKey!21220 () (_ BitVec 32))

(declare-fun mapValue!21220 () ValueCell!6165)

(declare-fun mapRest!21220 () (Array (_ BitVec 32) ValueCell!6165))

(assert (=> mapNonEmpty!21220 (= (arr!14329 _values!833) (store mapRest!21220 mapKey!21220 mapValue!21220))))

(assert (= (and start!42016 res!280362) b!469128))

(assert (= (and b!469128 res!280364) b!469122))

(assert (= (and b!469122 res!280363) b!469123))

(assert (= (and b!469123 res!280360) b!469127))

(assert (= (and b!469127 (not res!280361)) b!469126))

(assert (= (and b!469125 condMapEmpty!21220) mapIsEmpty!21220))

(assert (= (and b!469125 (not condMapEmpty!21220)) mapNonEmpty!21220))

(get-info :version)

(assert (= (and mapNonEmpty!21220 ((_ is ValueCellFull!6165) mapValue!21220)) b!469129))

(assert (= (and b!469125 ((_ is ValueCellFull!6165) mapDefault!21220)) b!469124))

(assert (= start!42016 b!469125))

(declare-fun m!451231 () Bool)

(assert (=> b!469126 m!451231))

(declare-fun m!451233 () Bool)

(assert (=> b!469126 m!451233))

(declare-fun m!451235 () Bool)

(assert (=> b!469126 m!451235))

(declare-fun m!451237 () Bool)

(assert (=> b!469126 m!451237))

(assert (=> b!469126 m!451233))

(declare-fun m!451239 () Bool)

(assert (=> b!469126 m!451239))

(declare-fun m!451241 () Bool)

(assert (=> b!469126 m!451241))

(declare-fun m!451243 () Bool)

(assert (=> b!469122 m!451243))

(declare-fun m!451245 () Bool)

(assert (=> mapNonEmpty!21220 m!451245))

(declare-fun m!451247 () Bool)

(assert (=> start!42016 m!451247))

(declare-fun m!451249 () Bool)

(assert (=> start!42016 m!451249))

(declare-fun m!451251 () Bool)

(assert (=> start!42016 m!451251))

(declare-fun m!451253 () Bool)

(assert (=> b!469127 m!451253))

(declare-fun m!451255 () Bool)

(assert (=> b!469127 m!451255))

(declare-fun m!451257 () Bool)

(assert (=> b!469127 m!451257))

(declare-fun m!451259 () Bool)

(assert (=> b!469123 m!451259))

(check-sat (not b_next!11589) (not start!42016) (not b!469127) tp_is_empty!13017 b_and!19987 (not b!469123) (not b!469126) (not b!469122) (not mapNonEmpty!21220))
(check-sat b_and!19987 (not b_next!11589))
(get-model)

(declare-fun b!469164 () Bool)

(declare-fun e!274697 () Bool)

(declare-fun call!30358 () Bool)

(assert (=> b!469164 (= e!274697 call!30358)))

(declare-fun b!469165 () Bool)

(declare-fun e!274694 () Bool)

(declare-fun contains!2534 (List!8701 (_ BitVec 64)) Bool)

(assert (=> b!469165 (= e!274694 (contains!2534 Nil!8698 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75273 () Bool)

(declare-fun res!280388 () Bool)

(declare-fun e!274696 () Bool)

(assert (=> d!75273 (=> res!280388 e!274696)))

(assert (=> d!75273 (= res!280388 (bvsge #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(assert (=> d!75273 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8698) e!274696)))

(declare-fun b!469166 () Bool)

(assert (=> b!469166 (= e!274697 call!30358)))

(declare-fun b!469167 () Bool)

(declare-fun e!274695 () Bool)

(assert (=> b!469167 (= e!274696 e!274695)))

(declare-fun res!280386 () Bool)

(assert (=> b!469167 (=> (not res!280386) (not e!274695))))

(assert (=> b!469167 (= res!280386 (not e!274694))))

(declare-fun res!280387 () Bool)

(assert (=> b!469167 (=> (not res!280387) (not e!274694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!469167 (= res!280387 (validKeyInArray!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30355 () Bool)

(declare-fun c!56853 () Bool)

(assert (=> bm!30355 (= call!30358 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56853 (Cons!8697 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000) Nil!8698) Nil!8698)))))

(declare-fun b!469168 () Bool)

(assert (=> b!469168 (= e!274695 e!274697)))

(assert (=> b!469168 (= c!56853 (validKeyInArray!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75273 (not res!280388)) b!469167))

(assert (= (and b!469167 res!280387) b!469165))

(assert (= (and b!469167 res!280386) b!469168))

(assert (= (and b!469168 c!56853) b!469166))

(assert (= (and b!469168 (not c!56853)) b!469164))

(assert (= (or b!469166 b!469164) bm!30355))

(declare-fun m!451291 () Bool)

(assert (=> b!469165 m!451291))

(assert (=> b!469165 m!451291))

(declare-fun m!451293 () Bool)

(assert (=> b!469165 m!451293))

(assert (=> b!469167 m!451291))

(assert (=> b!469167 m!451291))

(declare-fun m!451295 () Bool)

(assert (=> b!469167 m!451295))

(assert (=> bm!30355 m!451291))

(declare-fun m!451297 () Bool)

(assert (=> bm!30355 m!451297))

(assert (=> b!469168 m!451291))

(assert (=> b!469168 m!451291))

(assert (=> b!469168 m!451295))

(assert (=> b!469123 d!75273))

(declare-fun b!469211 () Bool)

(declare-fun e!274724 () Bool)

(declare-fun e!274726 () Bool)

(assert (=> b!469211 (= e!274724 e!274726)))

(declare-fun res!280413 () Bool)

(declare-fun call!30375 () Bool)

(assert (=> b!469211 (= res!280413 call!30375)))

(assert (=> b!469211 (=> (not res!280413) (not e!274726))))

(declare-fun b!469212 () Bool)

(declare-fun e!274734 () ListLongMap!7533)

(declare-fun e!274729 () ListLongMap!7533)

(assert (=> b!469212 (= e!274734 e!274729)))

(declare-fun c!56866 () Bool)

(assert (=> b!469212 (= c!56866 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469213 () Bool)

(declare-fun e!274733 () ListLongMap!7533)

(declare-fun call!30374 () ListLongMap!7533)

(assert (=> b!469213 (= e!274733 call!30374)))

(declare-fun bm!30370 () Bool)

(declare-fun lt!212520 () ListLongMap!7533)

(declare-fun contains!2535 (ListLongMap!7533 (_ BitVec 64)) Bool)

(assert (=> bm!30370 (= call!30375 (contains!2535 lt!212520 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469214 () Bool)

(declare-fun e!274728 () Bool)

(declare-fun e!274725 () Bool)

(assert (=> b!469214 (= e!274728 e!274725)))

(declare-fun res!280412 () Bool)

(assert (=> b!469214 (=> (not res!280412) (not e!274725))))

(assert (=> b!469214 (= res!280412 (contains!2535 lt!212520 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469214 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun b!469215 () Bool)

(declare-fun apply!326 (ListLongMap!7533 (_ BitVec 64)) V!18461)

(assert (=> b!469215 (= e!274726 (= (apply!326 lt!212520 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!469216 () Bool)

(declare-fun e!274732 () Bool)

(assert (=> b!469216 (= e!274732 e!274724)))

(declare-fun c!56869 () Bool)

(assert (=> b!469216 (= c!56869 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30372 () Bool)

(declare-fun call!30376 () ListLongMap!7533)

(assert (=> bm!30372 (= call!30376 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469217 () Bool)

(declare-fun e!274735 () Bool)

(declare-fun call!30378 () Bool)

(assert (=> b!469217 (= e!274735 (not call!30378))))

(declare-fun b!469218 () Bool)

(declare-fun call!30377 () ListLongMap!7533)

(assert (=> b!469218 (= e!274733 call!30377)))

(declare-fun b!469219 () Bool)

(declare-fun e!274731 () Bool)

(assert (=> b!469219 (= e!274731 (validKeyInArray!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469220 () Bool)

(declare-fun res!280407 () Bool)

(assert (=> b!469220 (=> (not res!280407) (not e!274732))))

(assert (=> b!469220 (= res!280407 e!274728)))

(declare-fun res!280414 () Bool)

(assert (=> b!469220 (=> res!280414 e!274728)))

(declare-fun e!274727 () Bool)

(assert (=> b!469220 (= res!280414 (not e!274727))))

(declare-fun res!280408 () Bool)

(assert (=> b!469220 (=> (not res!280408) (not e!274727))))

(assert (=> b!469220 (= res!280408 (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun bm!30373 () Bool)

(declare-fun call!30379 () ListLongMap!7533)

(assert (=> bm!30373 (= call!30379 call!30376)))

(declare-fun b!469221 () Bool)

(declare-fun e!274730 () Bool)

(assert (=> b!469221 (= e!274735 e!274730)))

(declare-fun res!280411 () Bool)

(assert (=> b!469221 (= res!280411 call!30378)))

(assert (=> b!469221 (=> (not res!280411) (not e!274730))))

(declare-fun b!469222 () Bool)

(declare-fun e!274736 () Unit!13719)

(declare-fun Unit!13723 () Unit!13719)

(assert (=> b!469222 (= e!274736 Unit!13723)))

(declare-fun b!469223 () Bool)

(declare-fun get!7001 (ValueCell!6165 V!18461) V!18461)

(declare-fun dynLambda!919 (Int (_ BitVec 64)) V!18461)

(assert (=> b!469223 (= e!274725 (= (apply!326 lt!212520 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)) (get!7001 (select (arr!14329 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!469223 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14681 _values!833)))))

(assert (=> b!469223 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun b!469224 () Bool)

(declare-fun lt!212519 () Unit!13719)

(assert (=> b!469224 (= e!274736 lt!212519)))

(declare-fun lt!212516 () ListLongMap!7533)

(assert (=> b!469224 (= lt!212516 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212526 () (_ BitVec 64))

(assert (=> b!469224 (= lt!212526 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212518 () (_ BitVec 64))

(assert (=> b!469224 (= lt!212518 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212529 () Unit!13719)

(declare-fun addStillContains!288 (ListLongMap!7533 (_ BitVec 64) V!18461 (_ BitVec 64)) Unit!13719)

(assert (=> b!469224 (= lt!212529 (addStillContains!288 lt!212516 lt!212526 zeroValue!794 lt!212518))))

(assert (=> b!469224 (contains!2535 (+!1692 lt!212516 (tuple2!8621 lt!212526 zeroValue!794)) lt!212518)))

(declare-fun lt!212512 () Unit!13719)

(assert (=> b!469224 (= lt!212512 lt!212529)))

(declare-fun lt!212521 () ListLongMap!7533)

(assert (=> b!469224 (= lt!212521 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212509 () (_ BitVec 64))

(assert (=> b!469224 (= lt!212509 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212523 () (_ BitVec 64))

(assert (=> b!469224 (= lt!212523 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212528 () Unit!13719)

(declare-fun addApplyDifferent!288 (ListLongMap!7533 (_ BitVec 64) V!18461 (_ BitVec 64)) Unit!13719)

(assert (=> b!469224 (= lt!212528 (addApplyDifferent!288 lt!212521 lt!212509 minValueAfter!38 lt!212523))))

(assert (=> b!469224 (= (apply!326 (+!1692 lt!212521 (tuple2!8621 lt!212509 minValueAfter!38)) lt!212523) (apply!326 lt!212521 lt!212523))))

(declare-fun lt!212510 () Unit!13719)

(assert (=> b!469224 (= lt!212510 lt!212528)))

(declare-fun lt!212513 () ListLongMap!7533)

(assert (=> b!469224 (= lt!212513 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212524 () (_ BitVec 64))

(assert (=> b!469224 (= lt!212524 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212511 () (_ BitVec 64))

(assert (=> b!469224 (= lt!212511 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212514 () Unit!13719)

(assert (=> b!469224 (= lt!212514 (addApplyDifferent!288 lt!212513 lt!212524 zeroValue!794 lt!212511))))

(assert (=> b!469224 (= (apply!326 (+!1692 lt!212513 (tuple2!8621 lt!212524 zeroValue!794)) lt!212511) (apply!326 lt!212513 lt!212511))))

(declare-fun lt!212530 () Unit!13719)

(assert (=> b!469224 (= lt!212530 lt!212514)))

(declare-fun lt!212515 () ListLongMap!7533)

(assert (=> b!469224 (= lt!212515 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212527 () (_ BitVec 64))

(assert (=> b!469224 (= lt!212527 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212517 () (_ BitVec 64))

(assert (=> b!469224 (= lt!212517 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469224 (= lt!212519 (addApplyDifferent!288 lt!212515 lt!212527 minValueAfter!38 lt!212517))))

(assert (=> b!469224 (= (apply!326 (+!1692 lt!212515 (tuple2!8621 lt!212527 minValueAfter!38)) lt!212517) (apply!326 lt!212515 lt!212517))))

(declare-fun b!469225 () Bool)

(declare-fun call!30373 () ListLongMap!7533)

(assert (=> b!469225 (= e!274734 (+!1692 call!30373 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!469226 () Bool)

(declare-fun res!280415 () Bool)

(assert (=> b!469226 (=> (not res!280415) (not e!274732))))

(assert (=> b!469226 (= res!280415 e!274735)))

(declare-fun c!56870 () Bool)

(assert (=> b!469226 (= c!56870 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!469227 () Bool)

(assert (=> b!469227 (= e!274730 (= (apply!326 lt!212520 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!469228 () Bool)

(assert (=> b!469228 (= e!274727 (validKeyInArray!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun c!56867 () Bool)

(declare-fun bm!30374 () Bool)

(assert (=> bm!30374 (= call!30373 (+!1692 (ite c!56867 call!30376 (ite c!56866 call!30379 call!30377)) (ite (or c!56867 c!56866) (tuple2!8621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!469229 () Bool)

(assert (=> b!469229 (= e!274729 call!30374)))

(declare-fun bm!30371 () Bool)

(assert (=> bm!30371 (= call!30374 call!30373)))

(declare-fun d!75275 () Bool)

(assert (=> d!75275 e!274732))

(declare-fun res!280410 () Bool)

(assert (=> d!75275 (=> (not res!280410) (not e!274732))))

(assert (=> d!75275 (= res!280410 (or (bvsge #b00000000000000000000000000000000 (size!14680 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))))

(declare-fun lt!212525 () ListLongMap!7533)

(assert (=> d!75275 (= lt!212520 lt!212525)))

(declare-fun lt!212522 () Unit!13719)

(assert (=> d!75275 (= lt!212522 e!274736)))

(declare-fun c!56868 () Bool)

(assert (=> d!75275 (= c!56868 e!274731)))

(declare-fun res!280409 () Bool)

(assert (=> d!75275 (=> (not res!280409) (not e!274731))))

(assert (=> d!75275 (= res!280409 (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(assert (=> d!75275 (= lt!212525 e!274734)))

(assert (=> d!75275 (= c!56867 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75275 (validMask!0 mask!1365)))

(assert (=> d!75275 (= (getCurrentListMap!2206 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212520)))

(declare-fun b!469230 () Bool)

(assert (=> b!469230 (= e!274724 (not call!30375))))

(declare-fun bm!30375 () Bool)

(assert (=> bm!30375 (= call!30378 (contains!2535 lt!212520 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469231 () Bool)

(declare-fun c!56871 () Bool)

(assert (=> b!469231 (= c!56871 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!469231 (= e!274729 e!274733)))

(declare-fun bm!30376 () Bool)

(assert (=> bm!30376 (= call!30377 call!30379)))

(assert (= (and d!75275 c!56867) b!469225))

(assert (= (and d!75275 (not c!56867)) b!469212))

(assert (= (and b!469212 c!56866) b!469229))

(assert (= (and b!469212 (not c!56866)) b!469231))

(assert (= (and b!469231 c!56871) b!469213))

(assert (= (and b!469231 (not c!56871)) b!469218))

(assert (= (or b!469213 b!469218) bm!30376))

(assert (= (or b!469229 bm!30376) bm!30373))

(assert (= (or b!469229 b!469213) bm!30371))

(assert (= (or b!469225 bm!30373) bm!30372))

(assert (= (or b!469225 bm!30371) bm!30374))

(assert (= (and d!75275 res!280409) b!469219))

(assert (= (and d!75275 c!56868) b!469224))

(assert (= (and d!75275 (not c!56868)) b!469222))

(assert (= (and d!75275 res!280410) b!469220))

(assert (= (and b!469220 res!280408) b!469228))

(assert (= (and b!469220 (not res!280414)) b!469214))

(assert (= (and b!469214 res!280412) b!469223))

(assert (= (and b!469220 res!280407) b!469226))

(assert (= (and b!469226 c!56870) b!469221))

(assert (= (and b!469226 (not c!56870)) b!469217))

(assert (= (and b!469221 res!280411) b!469227))

(assert (= (or b!469221 b!469217) bm!30375))

(assert (= (and b!469226 res!280415) b!469216))

(assert (= (and b!469216 c!56869) b!469211))

(assert (= (and b!469216 (not c!56869)) b!469230))

(assert (= (and b!469211 res!280413) b!469215))

(assert (= (or b!469211 b!469230) bm!30370))

(declare-fun b_lambda!10089 () Bool)

(assert (=> (not b_lambda!10089) (not b!469223)))

(declare-fun t!14664 () Bool)

(declare-fun tb!3917 () Bool)

(assert (=> (and start!42016 (= defaultEntry!841 defaultEntry!841) t!14664) tb!3917))

(declare-fun result!7409 () Bool)

(assert (=> tb!3917 (= result!7409 tp_is_empty!13017)))

(assert (=> b!469223 t!14664))

(declare-fun b_and!19991 () Bool)

(assert (= b_and!19987 (and (=> t!14664 result!7409) b_and!19991)))

(assert (=> d!75275 m!451247))

(declare-fun m!451299 () Bool)

(assert (=> b!469227 m!451299))

(assert (=> b!469214 m!451291))

(assert (=> b!469214 m!451291))

(declare-fun m!451301 () Bool)

(assert (=> b!469214 m!451301))

(declare-fun m!451303 () Bool)

(assert (=> b!469215 m!451303))

(declare-fun m!451305 () Bool)

(assert (=> b!469223 m!451305))

(assert (=> b!469223 m!451291))

(assert (=> b!469223 m!451291))

(declare-fun m!451307 () Bool)

(assert (=> b!469223 m!451307))

(declare-fun m!451309 () Bool)

(assert (=> b!469223 m!451309))

(assert (=> b!469223 m!451305))

(assert (=> b!469223 m!451309))

(declare-fun m!451311 () Bool)

(assert (=> b!469223 m!451311))

(declare-fun m!451313 () Bool)

(assert (=> b!469224 m!451313))

(declare-fun m!451315 () Bool)

(assert (=> b!469224 m!451315))

(declare-fun m!451317 () Bool)

(assert (=> b!469224 m!451317))

(declare-fun m!451319 () Bool)

(assert (=> b!469224 m!451319))

(declare-fun m!451321 () Bool)

(assert (=> b!469224 m!451321))

(assert (=> b!469224 m!451291))

(assert (=> b!469224 m!451319))

(declare-fun m!451323 () Bool)

(assert (=> b!469224 m!451323))

(declare-fun m!451325 () Bool)

(assert (=> b!469224 m!451325))

(declare-fun m!451327 () Bool)

(assert (=> b!469224 m!451327))

(assert (=> b!469224 m!451313))

(declare-fun m!451329 () Bool)

(assert (=> b!469224 m!451329))

(declare-fun m!451331 () Bool)

(assert (=> b!469224 m!451331))

(declare-fun m!451333 () Bool)

(assert (=> b!469224 m!451333))

(declare-fun m!451335 () Bool)

(assert (=> b!469224 m!451335))

(assert (=> b!469224 m!451255))

(declare-fun m!451337 () Bool)

(assert (=> b!469224 m!451337))

(declare-fun m!451339 () Bool)

(assert (=> b!469224 m!451339))

(assert (=> b!469224 m!451321))

(declare-fun m!451341 () Bool)

(assert (=> b!469224 m!451341))

(assert (=> b!469224 m!451329))

(assert (=> b!469228 m!451291))

(assert (=> b!469228 m!451291))

(assert (=> b!469228 m!451295))

(assert (=> bm!30372 m!451255))

(declare-fun m!451343 () Bool)

(assert (=> bm!30374 m!451343))

(assert (=> b!469219 m!451291))

(assert (=> b!469219 m!451291))

(assert (=> b!469219 m!451295))

(declare-fun m!451345 () Bool)

(assert (=> bm!30375 m!451345))

(declare-fun m!451347 () Bool)

(assert (=> bm!30370 m!451347))

(declare-fun m!451349 () Bool)

(assert (=> b!469225 m!451349))

(assert (=> b!469126 d!75275))

(declare-fun d!75277 () Bool)

(assert (=> d!75277 (= (+!1692 lt!212440 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1692 (+!1692 lt!212440 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!212533 () Unit!13719)

(declare-fun choose!1343 (ListLongMap!7533 (_ BitVec 64) V!18461 V!18461) Unit!13719)

(assert (=> d!75277 (= lt!212533 (choose!1343 lt!212440 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75277 (= (addSameAsAddTwiceSameKeyDiffValues!105 lt!212440 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!212533)))

(declare-fun bs!14862 () Bool)

(assert (= bs!14862 d!75277))

(declare-fun m!451351 () Bool)

(assert (=> bs!14862 m!451351))

(assert (=> bs!14862 m!451233))

(assert (=> bs!14862 m!451233))

(declare-fun m!451353 () Bool)

(assert (=> bs!14862 m!451353))

(declare-fun m!451355 () Bool)

(assert (=> bs!14862 m!451355))

(assert (=> b!469126 d!75277))

(declare-fun d!75279 () Bool)

(declare-fun e!274739 () Bool)

(assert (=> d!75279 e!274739))

(declare-fun res!280421 () Bool)

(assert (=> d!75279 (=> (not res!280421) (not e!274739))))

(declare-fun lt!212543 () ListLongMap!7533)

(assert (=> d!75279 (= res!280421 (contains!2535 lt!212543 (_1!4321 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!212544 () List!8702)

(assert (=> d!75279 (= lt!212543 (ListLongMap!7534 lt!212544))))

(declare-fun lt!212542 () Unit!13719)

(declare-fun lt!212545 () Unit!13719)

(assert (=> d!75279 (= lt!212542 lt!212545)))

(declare-datatypes ((Option!384 0))(
  ( (Some!383 (v!8844 V!18461)) (None!382) )
))
(declare-fun getValueByKey!378 (List!8702 (_ BitVec 64)) Option!384)

(assert (=> d!75279 (= (getValueByKey!378 lt!212544 (_1!4321 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!383 (_2!4321 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!200 (List!8702 (_ BitVec 64) V!18461) Unit!13719)

(assert (=> d!75279 (= lt!212545 (lemmaContainsTupThenGetReturnValue!200 lt!212544 (_1!4321 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4321 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun insertStrictlySorted!203 (List!8702 (_ BitVec 64) V!18461) List!8702)

(assert (=> d!75279 (= lt!212544 (insertStrictlySorted!203 (toList!3782 lt!212440) (_1!4321 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4321 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75279 (= (+!1692 lt!212440 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212543)))

(declare-fun b!469238 () Bool)

(declare-fun res!280420 () Bool)

(assert (=> b!469238 (=> (not res!280420) (not e!274739))))

(assert (=> b!469238 (= res!280420 (= (getValueByKey!378 (toList!3782 lt!212543) (_1!4321 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!383 (_2!4321 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!469239 () Bool)

(declare-fun contains!2536 (List!8702 tuple2!8620) Bool)

(assert (=> b!469239 (= e!274739 (contains!2536 (toList!3782 lt!212543) (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75279 res!280421) b!469238))

(assert (= (and b!469238 res!280420) b!469239))

(declare-fun m!451357 () Bool)

(assert (=> d!75279 m!451357))

(declare-fun m!451359 () Bool)

(assert (=> d!75279 m!451359))

(declare-fun m!451361 () Bool)

(assert (=> d!75279 m!451361))

(declare-fun m!451363 () Bool)

(assert (=> d!75279 m!451363))

(declare-fun m!451365 () Bool)

(assert (=> b!469238 m!451365))

(declare-fun m!451367 () Bool)

(assert (=> b!469239 m!451367))

(assert (=> b!469126 d!75279))

(declare-fun d!75281 () Bool)

(declare-fun e!274740 () Bool)

(assert (=> d!75281 e!274740))

(declare-fun res!280423 () Bool)

(assert (=> d!75281 (=> (not res!280423) (not e!274740))))

(declare-fun lt!212547 () ListLongMap!7533)

(assert (=> d!75281 (= res!280423 (contains!2535 lt!212547 (_1!4321 lt!212438)))))

(declare-fun lt!212548 () List!8702)

(assert (=> d!75281 (= lt!212547 (ListLongMap!7534 lt!212548))))

(declare-fun lt!212546 () Unit!13719)

(declare-fun lt!212549 () Unit!13719)

(assert (=> d!75281 (= lt!212546 lt!212549)))

(assert (=> d!75281 (= (getValueByKey!378 lt!212548 (_1!4321 lt!212438)) (Some!383 (_2!4321 lt!212438)))))

(assert (=> d!75281 (= lt!212549 (lemmaContainsTupThenGetReturnValue!200 lt!212548 (_1!4321 lt!212438) (_2!4321 lt!212438)))))

(assert (=> d!75281 (= lt!212548 (insertStrictlySorted!203 (toList!3782 lt!212440) (_1!4321 lt!212438) (_2!4321 lt!212438)))))

(assert (=> d!75281 (= (+!1692 lt!212440 lt!212438) lt!212547)))

(declare-fun b!469240 () Bool)

(declare-fun res!280422 () Bool)

(assert (=> b!469240 (=> (not res!280422) (not e!274740))))

(assert (=> b!469240 (= res!280422 (= (getValueByKey!378 (toList!3782 lt!212547) (_1!4321 lt!212438)) (Some!383 (_2!4321 lt!212438))))))

(declare-fun b!469241 () Bool)

(assert (=> b!469241 (= e!274740 (contains!2536 (toList!3782 lt!212547) lt!212438))))

(assert (= (and d!75281 res!280423) b!469240))

(assert (= (and b!469240 res!280422) b!469241))

(declare-fun m!451369 () Bool)

(assert (=> d!75281 m!451369))

(declare-fun m!451371 () Bool)

(assert (=> d!75281 m!451371))

(declare-fun m!451373 () Bool)

(assert (=> d!75281 m!451373))

(declare-fun m!451375 () Bool)

(assert (=> d!75281 m!451375))

(declare-fun m!451377 () Bool)

(assert (=> b!469240 m!451377))

(declare-fun m!451379 () Bool)

(assert (=> b!469241 m!451379))

(assert (=> b!469126 d!75281))

(declare-fun b!469242 () Bool)

(declare-fun e!274741 () Bool)

(declare-fun e!274743 () Bool)

(assert (=> b!469242 (= e!274741 e!274743)))

(declare-fun res!280430 () Bool)

(declare-fun call!30382 () Bool)

(assert (=> b!469242 (= res!280430 call!30382)))

(assert (=> b!469242 (=> (not res!280430) (not e!274743))))

(declare-fun b!469243 () Bool)

(declare-fun e!274751 () ListLongMap!7533)

(declare-fun e!274746 () ListLongMap!7533)

(assert (=> b!469243 (= e!274751 e!274746)))

(declare-fun c!56872 () Bool)

(assert (=> b!469243 (= c!56872 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469244 () Bool)

(declare-fun e!274750 () ListLongMap!7533)

(declare-fun call!30381 () ListLongMap!7533)

(assert (=> b!469244 (= e!274750 call!30381)))

(declare-fun bm!30377 () Bool)

(declare-fun lt!212561 () ListLongMap!7533)

(assert (=> bm!30377 (= call!30382 (contains!2535 lt!212561 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469245 () Bool)

(declare-fun e!274745 () Bool)

(declare-fun e!274742 () Bool)

(assert (=> b!469245 (= e!274745 e!274742)))

(declare-fun res!280429 () Bool)

(assert (=> b!469245 (=> (not res!280429) (not e!274742))))

(assert (=> b!469245 (= res!280429 (contains!2535 lt!212561 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469245 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun b!469246 () Bool)

(assert (=> b!469246 (= e!274743 (= (apply!326 lt!212561 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!469247 () Bool)

(declare-fun e!274749 () Bool)

(assert (=> b!469247 (= e!274749 e!274741)))

(declare-fun c!56875 () Bool)

(assert (=> b!469247 (= c!56875 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30379 () Bool)

(declare-fun call!30383 () ListLongMap!7533)

(assert (=> bm!30379 (= call!30383 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469248 () Bool)

(declare-fun e!274752 () Bool)

(declare-fun call!30385 () Bool)

(assert (=> b!469248 (= e!274752 (not call!30385))))

(declare-fun b!469249 () Bool)

(declare-fun call!30384 () ListLongMap!7533)

(assert (=> b!469249 (= e!274750 call!30384)))

(declare-fun b!469250 () Bool)

(declare-fun e!274748 () Bool)

(assert (=> b!469250 (= e!274748 (validKeyInArray!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469251 () Bool)

(declare-fun res!280424 () Bool)

(assert (=> b!469251 (=> (not res!280424) (not e!274749))))

(assert (=> b!469251 (= res!280424 e!274745)))

(declare-fun res!280431 () Bool)

(assert (=> b!469251 (=> res!280431 e!274745)))

(declare-fun e!274744 () Bool)

(assert (=> b!469251 (= res!280431 (not e!274744))))

(declare-fun res!280425 () Bool)

(assert (=> b!469251 (=> (not res!280425) (not e!274744))))

(assert (=> b!469251 (= res!280425 (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun bm!30380 () Bool)

(declare-fun call!30386 () ListLongMap!7533)

(assert (=> bm!30380 (= call!30386 call!30383)))

(declare-fun b!469252 () Bool)

(declare-fun e!274747 () Bool)

(assert (=> b!469252 (= e!274752 e!274747)))

(declare-fun res!280428 () Bool)

(assert (=> b!469252 (= res!280428 call!30385)))

(assert (=> b!469252 (=> (not res!280428) (not e!274747))))

(declare-fun b!469253 () Bool)

(declare-fun e!274753 () Unit!13719)

(declare-fun Unit!13724 () Unit!13719)

(assert (=> b!469253 (= e!274753 Unit!13724)))

(declare-fun b!469254 () Bool)

(assert (=> b!469254 (= e!274742 (= (apply!326 lt!212561 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)) (get!7001 (select (arr!14329 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!469254 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14681 _values!833)))))

(assert (=> b!469254 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun b!469255 () Bool)

(declare-fun lt!212560 () Unit!13719)

(assert (=> b!469255 (= e!274753 lt!212560)))

(declare-fun lt!212557 () ListLongMap!7533)

(assert (=> b!469255 (= lt!212557 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212567 () (_ BitVec 64))

(assert (=> b!469255 (= lt!212567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212559 () (_ BitVec 64))

(assert (=> b!469255 (= lt!212559 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212570 () Unit!13719)

(assert (=> b!469255 (= lt!212570 (addStillContains!288 lt!212557 lt!212567 zeroValue!794 lt!212559))))

(assert (=> b!469255 (contains!2535 (+!1692 lt!212557 (tuple2!8621 lt!212567 zeroValue!794)) lt!212559)))

(declare-fun lt!212553 () Unit!13719)

(assert (=> b!469255 (= lt!212553 lt!212570)))

(declare-fun lt!212562 () ListLongMap!7533)

(assert (=> b!469255 (= lt!212562 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212550 () (_ BitVec 64))

(assert (=> b!469255 (= lt!212550 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212564 () (_ BitVec 64))

(assert (=> b!469255 (= lt!212564 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212569 () Unit!13719)

(assert (=> b!469255 (= lt!212569 (addApplyDifferent!288 lt!212562 lt!212550 minValueBefore!38 lt!212564))))

(assert (=> b!469255 (= (apply!326 (+!1692 lt!212562 (tuple2!8621 lt!212550 minValueBefore!38)) lt!212564) (apply!326 lt!212562 lt!212564))))

(declare-fun lt!212551 () Unit!13719)

(assert (=> b!469255 (= lt!212551 lt!212569)))

(declare-fun lt!212554 () ListLongMap!7533)

(assert (=> b!469255 (= lt!212554 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212565 () (_ BitVec 64))

(assert (=> b!469255 (= lt!212565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212552 () (_ BitVec 64))

(assert (=> b!469255 (= lt!212552 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212555 () Unit!13719)

(assert (=> b!469255 (= lt!212555 (addApplyDifferent!288 lt!212554 lt!212565 zeroValue!794 lt!212552))))

(assert (=> b!469255 (= (apply!326 (+!1692 lt!212554 (tuple2!8621 lt!212565 zeroValue!794)) lt!212552) (apply!326 lt!212554 lt!212552))))

(declare-fun lt!212571 () Unit!13719)

(assert (=> b!469255 (= lt!212571 lt!212555)))

(declare-fun lt!212556 () ListLongMap!7533)

(assert (=> b!469255 (= lt!212556 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212568 () (_ BitVec 64))

(assert (=> b!469255 (= lt!212568 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212558 () (_ BitVec 64))

(assert (=> b!469255 (= lt!212558 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469255 (= lt!212560 (addApplyDifferent!288 lt!212556 lt!212568 minValueBefore!38 lt!212558))))

(assert (=> b!469255 (= (apply!326 (+!1692 lt!212556 (tuple2!8621 lt!212568 minValueBefore!38)) lt!212558) (apply!326 lt!212556 lt!212558))))

(declare-fun b!469256 () Bool)

(declare-fun call!30380 () ListLongMap!7533)

(assert (=> b!469256 (= e!274751 (+!1692 call!30380 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!469257 () Bool)

(declare-fun res!280432 () Bool)

(assert (=> b!469257 (=> (not res!280432) (not e!274749))))

(assert (=> b!469257 (= res!280432 e!274752)))

(declare-fun c!56876 () Bool)

(assert (=> b!469257 (= c!56876 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!469258 () Bool)

(assert (=> b!469258 (= e!274747 (= (apply!326 lt!212561 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!469259 () Bool)

(assert (=> b!469259 (= e!274744 (validKeyInArray!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30381 () Bool)

(declare-fun c!56873 () Bool)

(assert (=> bm!30381 (= call!30380 (+!1692 (ite c!56873 call!30383 (ite c!56872 call!30386 call!30384)) (ite (or c!56873 c!56872) (tuple2!8621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!469260 () Bool)

(assert (=> b!469260 (= e!274746 call!30381)))

(declare-fun bm!30378 () Bool)

(assert (=> bm!30378 (= call!30381 call!30380)))

(declare-fun d!75283 () Bool)

(assert (=> d!75283 e!274749))

(declare-fun res!280427 () Bool)

(assert (=> d!75283 (=> (not res!280427) (not e!274749))))

(assert (=> d!75283 (= res!280427 (or (bvsge #b00000000000000000000000000000000 (size!14680 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))))

(declare-fun lt!212566 () ListLongMap!7533)

(assert (=> d!75283 (= lt!212561 lt!212566)))

(declare-fun lt!212563 () Unit!13719)

(assert (=> d!75283 (= lt!212563 e!274753)))

(declare-fun c!56874 () Bool)

(assert (=> d!75283 (= c!56874 e!274748)))

(declare-fun res!280426 () Bool)

(assert (=> d!75283 (=> (not res!280426) (not e!274748))))

(assert (=> d!75283 (= res!280426 (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(assert (=> d!75283 (= lt!212566 e!274751)))

(assert (=> d!75283 (= c!56873 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75283 (validMask!0 mask!1365)))

(assert (=> d!75283 (= (getCurrentListMap!2206 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212561)))

(declare-fun b!469261 () Bool)

(assert (=> b!469261 (= e!274741 (not call!30382))))

(declare-fun bm!30382 () Bool)

(assert (=> bm!30382 (= call!30385 (contains!2535 lt!212561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469262 () Bool)

(declare-fun c!56877 () Bool)

(assert (=> b!469262 (= c!56877 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!469262 (= e!274746 e!274750)))

(declare-fun bm!30383 () Bool)

(assert (=> bm!30383 (= call!30384 call!30386)))

(assert (= (and d!75283 c!56873) b!469256))

(assert (= (and d!75283 (not c!56873)) b!469243))

(assert (= (and b!469243 c!56872) b!469260))

(assert (= (and b!469243 (not c!56872)) b!469262))

(assert (= (and b!469262 c!56877) b!469244))

(assert (= (and b!469262 (not c!56877)) b!469249))

(assert (= (or b!469244 b!469249) bm!30383))

(assert (= (or b!469260 bm!30383) bm!30380))

(assert (= (or b!469260 b!469244) bm!30378))

(assert (= (or b!469256 bm!30380) bm!30379))

(assert (= (or b!469256 bm!30378) bm!30381))

(assert (= (and d!75283 res!280426) b!469250))

(assert (= (and d!75283 c!56874) b!469255))

(assert (= (and d!75283 (not c!56874)) b!469253))

(assert (= (and d!75283 res!280427) b!469251))

(assert (= (and b!469251 res!280425) b!469259))

(assert (= (and b!469251 (not res!280431)) b!469245))

(assert (= (and b!469245 res!280429) b!469254))

(assert (= (and b!469251 res!280424) b!469257))

(assert (= (and b!469257 c!56876) b!469252))

(assert (= (and b!469257 (not c!56876)) b!469248))

(assert (= (and b!469252 res!280428) b!469258))

(assert (= (or b!469252 b!469248) bm!30382))

(assert (= (and b!469257 res!280432) b!469247))

(assert (= (and b!469247 c!56875) b!469242))

(assert (= (and b!469247 (not c!56875)) b!469261))

(assert (= (and b!469242 res!280430) b!469246))

(assert (= (or b!469242 b!469261) bm!30377))

(declare-fun b_lambda!10091 () Bool)

(assert (=> (not b_lambda!10091) (not b!469254)))

(assert (=> b!469254 t!14664))

(declare-fun b_and!19993 () Bool)

(assert (= b_and!19991 (and (=> t!14664 result!7409) b_and!19993)))

(assert (=> d!75283 m!451247))

(declare-fun m!451381 () Bool)

(assert (=> b!469258 m!451381))

(assert (=> b!469245 m!451291))

(assert (=> b!469245 m!451291))

(declare-fun m!451383 () Bool)

(assert (=> b!469245 m!451383))

(declare-fun m!451385 () Bool)

(assert (=> b!469246 m!451385))

(assert (=> b!469254 m!451305))

(assert (=> b!469254 m!451291))

(assert (=> b!469254 m!451291))

(declare-fun m!451387 () Bool)

(assert (=> b!469254 m!451387))

(assert (=> b!469254 m!451309))

(assert (=> b!469254 m!451305))

(assert (=> b!469254 m!451309))

(assert (=> b!469254 m!451311))

(declare-fun m!451389 () Bool)

(assert (=> b!469255 m!451389))

(declare-fun m!451391 () Bool)

(assert (=> b!469255 m!451391))

(declare-fun m!451393 () Bool)

(assert (=> b!469255 m!451393))

(declare-fun m!451395 () Bool)

(assert (=> b!469255 m!451395))

(declare-fun m!451397 () Bool)

(assert (=> b!469255 m!451397))

(assert (=> b!469255 m!451291))

(assert (=> b!469255 m!451395))

(declare-fun m!451399 () Bool)

(assert (=> b!469255 m!451399))

(declare-fun m!451401 () Bool)

(assert (=> b!469255 m!451401))

(declare-fun m!451403 () Bool)

(assert (=> b!469255 m!451403))

(assert (=> b!469255 m!451389))

(declare-fun m!451405 () Bool)

(assert (=> b!469255 m!451405))

(declare-fun m!451407 () Bool)

(assert (=> b!469255 m!451407))

(declare-fun m!451409 () Bool)

(assert (=> b!469255 m!451409))

(declare-fun m!451411 () Bool)

(assert (=> b!469255 m!451411))

(assert (=> b!469255 m!451257))

(declare-fun m!451413 () Bool)

(assert (=> b!469255 m!451413))

(declare-fun m!451415 () Bool)

(assert (=> b!469255 m!451415))

(assert (=> b!469255 m!451397))

(declare-fun m!451417 () Bool)

(assert (=> b!469255 m!451417))

(assert (=> b!469255 m!451405))

(assert (=> b!469259 m!451291))

(assert (=> b!469259 m!451291))

(assert (=> b!469259 m!451295))

(assert (=> bm!30379 m!451257))

(declare-fun m!451419 () Bool)

(assert (=> bm!30381 m!451419))

(assert (=> b!469250 m!451291))

(assert (=> b!469250 m!451291))

(assert (=> b!469250 m!451295))

(declare-fun m!451421 () Bool)

(assert (=> bm!30382 m!451421))

(declare-fun m!451423 () Bool)

(assert (=> bm!30377 m!451423))

(declare-fun m!451425 () Bool)

(assert (=> b!469256 m!451425))

(assert (=> b!469126 d!75283))

(declare-fun d!75285 () Bool)

(declare-fun e!274754 () Bool)

(assert (=> d!75285 e!274754))

(declare-fun res!280434 () Bool)

(assert (=> d!75285 (=> (not res!280434) (not e!274754))))

(declare-fun lt!212573 () ListLongMap!7533)

(assert (=> d!75285 (= res!280434 (contains!2535 lt!212573 (_1!4321 lt!212438)))))

(declare-fun lt!212574 () List!8702)

(assert (=> d!75285 (= lt!212573 (ListLongMap!7534 lt!212574))))

(declare-fun lt!212572 () Unit!13719)

(declare-fun lt!212575 () Unit!13719)

(assert (=> d!75285 (= lt!212572 lt!212575)))

(assert (=> d!75285 (= (getValueByKey!378 lt!212574 (_1!4321 lt!212438)) (Some!383 (_2!4321 lt!212438)))))

(assert (=> d!75285 (= lt!212575 (lemmaContainsTupThenGetReturnValue!200 lt!212574 (_1!4321 lt!212438) (_2!4321 lt!212438)))))

(assert (=> d!75285 (= lt!212574 (insertStrictlySorted!203 (toList!3782 (+!1692 lt!212440 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4321 lt!212438) (_2!4321 lt!212438)))))

(assert (=> d!75285 (= (+!1692 (+!1692 lt!212440 (tuple2!8621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212438) lt!212573)))

(declare-fun b!469263 () Bool)

(declare-fun res!280433 () Bool)

(assert (=> b!469263 (=> (not res!280433) (not e!274754))))

(assert (=> b!469263 (= res!280433 (= (getValueByKey!378 (toList!3782 lt!212573) (_1!4321 lt!212438)) (Some!383 (_2!4321 lt!212438))))))

(declare-fun b!469264 () Bool)

(assert (=> b!469264 (= e!274754 (contains!2536 (toList!3782 lt!212573) lt!212438))))

(assert (= (and d!75285 res!280434) b!469263))

(assert (= (and b!469263 res!280433) b!469264))

(declare-fun m!451427 () Bool)

(assert (=> d!75285 m!451427))

(declare-fun m!451429 () Bool)

(assert (=> d!75285 m!451429))

(declare-fun m!451431 () Bool)

(assert (=> d!75285 m!451431))

(declare-fun m!451433 () Bool)

(assert (=> d!75285 m!451433))

(declare-fun m!451435 () Bool)

(assert (=> b!469263 m!451435))

(declare-fun m!451437 () Bool)

(assert (=> b!469264 m!451437))

(assert (=> b!469126 d!75285))

(declare-fun d!75287 () Bool)

(assert (=> d!75287 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42016 d!75287))

(declare-fun d!75289 () Bool)

(assert (=> d!75289 (= (array_inv!10340 _keys!1025) (bvsge (size!14680 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42016 d!75289))

(declare-fun d!75291 () Bool)

(assert (=> d!75291 (= (array_inv!10341 _values!833) (bvsge (size!14681 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42016 d!75291))

(declare-fun b!469273 () Bool)

(declare-fun e!274762 () Bool)

(declare-fun e!274761 () Bool)

(assert (=> b!469273 (= e!274762 e!274761)))

(declare-fun c!56880 () Bool)

(assert (=> b!469273 (= c!56880 (validKeyInArray!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469274 () Bool)

(declare-fun e!274763 () Bool)

(declare-fun call!30389 () Bool)

(assert (=> b!469274 (= e!274763 call!30389)))

(declare-fun d!75293 () Bool)

(declare-fun res!280439 () Bool)

(assert (=> d!75293 (=> res!280439 e!274762)))

(assert (=> d!75293 (= res!280439 (bvsge #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(assert (=> d!75293 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!274762)))

(declare-fun bm!30386 () Bool)

(assert (=> bm!30386 (= call!30389 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!469275 () Bool)

(assert (=> b!469275 (= e!274761 call!30389)))

(declare-fun b!469276 () Bool)

(assert (=> b!469276 (= e!274761 e!274763)))

(declare-fun lt!212582 () (_ BitVec 64))

(assert (=> b!469276 (= lt!212582 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212584 () Unit!13719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29805 (_ BitVec 64) (_ BitVec 32)) Unit!13719)

(assert (=> b!469276 (= lt!212584 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!212582 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!469276 (arrayContainsKey!0 _keys!1025 lt!212582 #b00000000000000000000000000000000)))

(declare-fun lt!212583 () Unit!13719)

(assert (=> b!469276 (= lt!212583 lt!212584)))

(declare-fun res!280440 () Bool)

(declare-datatypes ((SeekEntryResult!3550 0))(
  ( (MissingZero!3550 (index!16379 (_ BitVec 32))) (Found!3550 (index!16380 (_ BitVec 32))) (Intermediate!3550 (undefined!4362 Bool) (index!16381 (_ BitVec 32)) (x!43920 (_ BitVec 32))) (Undefined!3550) (MissingVacant!3550 (index!16382 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29805 (_ BitVec 32)) SeekEntryResult!3550)

(assert (=> b!469276 (= res!280440 (= (seekEntryOrOpen!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3550 #b00000000000000000000000000000000)))))

(assert (=> b!469276 (=> (not res!280440) (not e!274763))))

(assert (= (and d!75293 (not res!280439)) b!469273))

(assert (= (and b!469273 c!56880) b!469276))

(assert (= (and b!469273 (not c!56880)) b!469275))

(assert (= (and b!469276 res!280440) b!469274))

(assert (= (or b!469274 b!469275) bm!30386))

(assert (=> b!469273 m!451291))

(assert (=> b!469273 m!451291))

(assert (=> b!469273 m!451295))

(declare-fun m!451439 () Bool)

(assert (=> bm!30386 m!451439))

(assert (=> b!469276 m!451291))

(declare-fun m!451441 () Bool)

(assert (=> b!469276 m!451441))

(declare-fun m!451443 () Bool)

(assert (=> b!469276 m!451443))

(assert (=> b!469276 m!451291))

(declare-fun m!451445 () Bool)

(assert (=> b!469276 m!451445))

(assert (=> b!469122 d!75293))

(declare-fun d!75295 () Bool)

(assert (=> d!75295 (= (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212587 () Unit!13719)

(declare-fun choose!1344 (array!29805 array!29807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18461 V!18461 V!18461 V!18461 (_ BitVec 32) Int) Unit!13719)

(assert (=> d!75295 (= lt!212587 (choose!1344 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75295 (validMask!0 mask!1365)))

(assert (=> d!75295 (= (lemmaNoChangeToArrayThenSameMapNoExtras!131 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212587)))

(declare-fun bs!14863 () Bool)

(assert (= bs!14863 d!75295))

(assert (=> bs!14863 m!451257))

(assert (=> bs!14863 m!451255))

(declare-fun m!451447 () Bool)

(assert (=> bs!14863 m!451447))

(assert (=> bs!14863 m!451247))

(assert (=> b!469127 d!75295))

(declare-fun d!75297 () Bool)

(declare-fun e!274782 () Bool)

(assert (=> d!75297 e!274782))

(declare-fun res!280450 () Bool)

(assert (=> d!75297 (=> (not res!280450) (not e!274782))))

(declare-fun lt!212605 () ListLongMap!7533)

(assert (=> d!75297 (= res!280450 (not (contains!2535 lt!212605 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!274783 () ListLongMap!7533)

(assert (=> d!75297 (= lt!212605 e!274783)))

(declare-fun c!56889 () Bool)

(assert (=> d!75297 (= c!56889 (bvsge #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(assert (=> d!75297 (validMask!0 mask!1365)))

(assert (=> d!75297 (= (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212605)))

(declare-fun b!469301 () Bool)

(declare-fun res!280449 () Bool)

(assert (=> b!469301 (=> (not res!280449) (not e!274782))))

(assert (=> b!469301 (= res!280449 (not (contains!2535 lt!212605 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!469302 () Bool)

(declare-fun e!274784 () Bool)

(assert (=> b!469302 (= e!274784 (= lt!212605 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!469303 () Bool)

(assert (=> b!469303 (= e!274783 (ListLongMap!7534 Nil!8699))))

(declare-fun b!469304 () Bool)

(declare-fun e!274778 () Bool)

(assert (=> b!469304 (= e!274778 (validKeyInArray!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469304 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!469305 () Bool)

(declare-fun e!274781 () Bool)

(assert (=> b!469305 (= e!274781 e!274784)))

(declare-fun c!56892 () Bool)

(assert (=> b!469305 (= c!56892 (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun b!469306 () Bool)

(assert (=> b!469306 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(assert (=> b!469306 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14681 _values!833)))))

(declare-fun e!274780 () Bool)

(assert (=> b!469306 (= e!274780 (= (apply!326 lt!212605 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)) (get!7001 (select (arr!14329 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!30392 () ListLongMap!7533)

(declare-fun bm!30389 () Bool)

(assert (=> bm!30389 (= call!30392 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!469307 () Bool)

(declare-fun e!274779 () ListLongMap!7533)

(assert (=> b!469307 (= e!274779 call!30392)))

(declare-fun b!469308 () Bool)

(assert (=> b!469308 (= e!274782 e!274781)))

(declare-fun c!56891 () Bool)

(assert (=> b!469308 (= c!56891 e!274778)))

(declare-fun res!280451 () Bool)

(assert (=> b!469308 (=> (not res!280451) (not e!274778))))

(assert (=> b!469308 (= res!280451 (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun b!469309 () Bool)

(declare-fun lt!212607 () Unit!13719)

(declare-fun lt!212606 () Unit!13719)

(assert (=> b!469309 (= lt!212607 lt!212606)))

(declare-fun lt!212602 () V!18461)

(declare-fun lt!212604 () (_ BitVec 64))

(declare-fun lt!212608 () (_ BitVec 64))

(declare-fun lt!212603 () ListLongMap!7533)

(assert (=> b!469309 (not (contains!2535 (+!1692 lt!212603 (tuple2!8621 lt!212608 lt!212602)) lt!212604))))

(declare-fun addStillNotContains!159 (ListLongMap!7533 (_ BitVec 64) V!18461 (_ BitVec 64)) Unit!13719)

(assert (=> b!469309 (= lt!212606 (addStillNotContains!159 lt!212603 lt!212608 lt!212602 lt!212604))))

(assert (=> b!469309 (= lt!212604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!469309 (= lt!212602 (get!7001 (select (arr!14329 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!469309 (= lt!212608 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469309 (= lt!212603 call!30392)))

(assert (=> b!469309 (= e!274779 (+!1692 call!30392 (tuple2!8621 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000) (get!7001 (select (arr!14329 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!469310 () Bool)

(assert (=> b!469310 (= e!274781 e!274780)))

(assert (=> b!469310 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun res!280452 () Bool)

(assert (=> b!469310 (= res!280452 (contains!2535 lt!212605 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469310 (=> (not res!280452) (not e!274780))))

(declare-fun b!469311 () Bool)

(assert (=> b!469311 (= e!274783 e!274779)))

(declare-fun c!56890 () Bool)

(assert (=> b!469311 (= c!56890 (validKeyInArray!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469312 () Bool)

(declare-fun isEmpty!573 (ListLongMap!7533) Bool)

(assert (=> b!469312 (= e!274784 (isEmpty!573 lt!212605))))

(assert (= (and d!75297 c!56889) b!469303))

(assert (= (and d!75297 (not c!56889)) b!469311))

(assert (= (and b!469311 c!56890) b!469309))

(assert (= (and b!469311 (not c!56890)) b!469307))

(assert (= (or b!469309 b!469307) bm!30389))

(assert (= (and d!75297 res!280450) b!469301))

(assert (= (and b!469301 res!280449) b!469308))

(assert (= (and b!469308 res!280451) b!469304))

(assert (= (and b!469308 c!56891) b!469310))

(assert (= (and b!469308 (not c!56891)) b!469305))

(assert (= (and b!469310 res!280452) b!469306))

(assert (= (and b!469305 c!56892) b!469302))

(assert (= (and b!469305 (not c!56892)) b!469312))

(declare-fun b_lambda!10093 () Bool)

(assert (=> (not b_lambda!10093) (not b!469306)))

(assert (=> b!469306 t!14664))

(declare-fun b_and!19995 () Bool)

(assert (= b_and!19993 (and (=> t!14664 result!7409) b_and!19995)))

(declare-fun b_lambda!10095 () Bool)

(assert (=> (not b_lambda!10095) (not b!469309)))

(assert (=> b!469309 t!14664))

(declare-fun b_and!19997 () Bool)

(assert (= b_and!19995 (and (=> t!14664 result!7409) b_and!19997)))

(declare-fun m!451449 () Bool)

(assert (=> b!469302 m!451449))

(assert (=> b!469306 m!451291))

(assert (=> b!469306 m!451305))

(assert (=> b!469306 m!451309))

(assert (=> b!469306 m!451311))

(assert (=> b!469306 m!451291))

(declare-fun m!451451 () Bool)

(assert (=> b!469306 m!451451))

(assert (=> b!469306 m!451305))

(assert (=> b!469306 m!451309))

(assert (=> b!469311 m!451291))

(assert (=> b!469311 m!451291))

(assert (=> b!469311 m!451295))

(declare-fun m!451453 () Bool)

(assert (=> b!469309 m!451453))

(assert (=> b!469309 m!451291))

(assert (=> b!469309 m!451305))

(assert (=> b!469309 m!451309))

(assert (=> b!469309 m!451311))

(declare-fun m!451455 () Bool)

(assert (=> b!469309 m!451455))

(assert (=> b!469309 m!451305))

(declare-fun m!451457 () Bool)

(assert (=> b!469309 m!451457))

(assert (=> b!469309 m!451309))

(assert (=> b!469309 m!451457))

(declare-fun m!451459 () Bool)

(assert (=> b!469309 m!451459))

(declare-fun m!451461 () Bool)

(assert (=> d!75297 m!451461))

(assert (=> d!75297 m!451247))

(declare-fun m!451463 () Bool)

(assert (=> b!469301 m!451463))

(assert (=> b!469310 m!451291))

(assert (=> b!469310 m!451291))

(declare-fun m!451465 () Bool)

(assert (=> b!469310 m!451465))

(declare-fun m!451467 () Bool)

(assert (=> b!469312 m!451467))

(assert (=> b!469304 m!451291))

(assert (=> b!469304 m!451291))

(assert (=> b!469304 m!451295))

(assert (=> bm!30389 m!451449))

(assert (=> b!469127 d!75297))

(declare-fun d!75299 () Bool)

(declare-fun e!274789 () Bool)

(assert (=> d!75299 e!274789))

(declare-fun res!280454 () Bool)

(assert (=> d!75299 (=> (not res!280454) (not e!274789))))

(declare-fun lt!212612 () ListLongMap!7533)

(assert (=> d!75299 (= res!280454 (not (contains!2535 lt!212612 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!274790 () ListLongMap!7533)

(assert (=> d!75299 (= lt!212612 e!274790)))

(declare-fun c!56893 () Bool)

(assert (=> d!75299 (= c!56893 (bvsge #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(assert (=> d!75299 (validMask!0 mask!1365)))

(assert (=> d!75299 (= (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212612)))

(declare-fun b!469313 () Bool)

(declare-fun res!280453 () Bool)

(assert (=> b!469313 (=> (not res!280453) (not e!274789))))

(assert (=> b!469313 (= res!280453 (not (contains!2535 lt!212612 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!274791 () Bool)

(declare-fun b!469314 () Bool)

(assert (=> b!469314 (= e!274791 (= lt!212612 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!469315 () Bool)

(assert (=> b!469315 (= e!274790 (ListLongMap!7534 Nil!8699))))

(declare-fun b!469316 () Bool)

(declare-fun e!274785 () Bool)

(assert (=> b!469316 (= e!274785 (validKeyInArray!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469316 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!469317 () Bool)

(declare-fun e!274788 () Bool)

(assert (=> b!469317 (= e!274788 e!274791)))

(declare-fun c!56896 () Bool)

(assert (=> b!469317 (= c!56896 (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun b!469318 () Bool)

(assert (=> b!469318 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(assert (=> b!469318 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14681 _values!833)))))

(declare-fun e!274787 () Bool)

(assert (=> b!469318 (= e!274787 (= (apply!326 lt!212612 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)) (get!7001 (select (arr!14329 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!30393 () ListLongMap!7533)

(declare-fun bm!30390 () Bool)

(assert (=> bm!30390 (= call!30393 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!469319 () Bool)

(declare-fun e!274786 () ListLongMap!7533)

(assert (=> b!469319 (= e!274786 call!30393)))

(declare-fun b!469320 () Bool)

(assert (=> b!469320 (= e!274789 e!274788)))

(declare-fun c!56895 () Bool)

(assert (=> b!469320 (= c!56895 e!274785)))

(declare-fun res!280455 () Bool)

(assert (=> b!469320 (=> (not res!280455) (not e!274785))))

(assert (=> b!469320 (= res!280455 (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun b!469321 () Bool)

(declare-fun lt!212614 () Unit!13719)

(declare-fun lt!212613 () Unit!13719)

(assert (=> b!469321 (= lt!212614 lt!212613)))

(declare-fun lt!212609 () V!18461)

(declare-fun lt!212615 () (_ BitVec 64))

(declare-fun lt!212610 () ListLongMap!7533)

(declare-fun lt!212611 () (_ BitVec 64))

(assert (=> b!469321 (not (contains!2535 (+!1692 lt!212610 (tuple2!8621 lt!212615 lt!212609)) lt!212611))))

(assert (=> b!469321 (= lt!212613 (addStillNotContains!159 lt!212610 lt!212615 lt!212609 lt!212611))))

(assert (=> b!469321 (= lt!212611 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!469321 (= lt!212609 (get!7001 (select (arr!14329 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!469321 (= lt!212615 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469321 (= lt!212610 call!30393)))

(assert (=> b!469321 (= e!274786 (+!1692 call!30393 (tuple2!8621 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000) (get!7001 (select (arr!14329 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!469322 () Bool)

(assert (=> b!469322 (= e!274788 e!274787)))

(assert (=> b!469322 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14680 _keys!1025)))))

(declare-fun res!280456 () Bool)

(assert (=> b!469322 (= res!280456 (contains!2535 lt!212612 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469322 (=> (not res!280456) (not e!274787))))

(declare-fun b!469323 () Bool)

(assert (=> b!469323 (= e!274790 e!274786)))

(declare-fun c!56894 () Bool)

(assert (=> b!469323 (= c!56894 (validKeyInArray!0 (select (arr!14328 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469324 () Bool)

(assert (=> b!469324 (= e!274791 (isEmpty!573 lt!212612))))

(assert (= (and d!75299 c!56893) b!469315))

(assert (= (and d!75299 (not c!56893)) b!469323))

(assert (= (and b!469323 c!56894) b!469321))

(assert (= (and b!469323 (not c!56894)) b!469319))

(assert (= (or b!469321 b!469319) bm!30390))

(assert (= (and d!75299 res!280454) b!469313))

(assert (= (and b!469313 res!280453) b!469320))

(assert (= (and b!469320 res!280455) b!469316))

(assert (= (and b!469320 c!56895) b!469322))

(assert (= (and b!469320 (not c!56895)) b!469317))

(assert (= (and b!469322 res!280456) b!469318))

(assert (= (and b!469317 c!56896) b!469314))

(assert (= (and b!469317 (not c!56896)) b!469324))

(declare-fun b_lambda!10097 () Bool)

(assert (=> (not b_lambda!10097) (not b!469318)))

(assert (=> b!469318 t!14664))

(declare-fun b_and!19999 () Bool)

(assert (= b_and!19997 (and (=> t!14664 result!7409) b_and!19999)))

(declare-fun b_lambda!10099 () Bool)

(assert (=> (not b_lambda!10099) (not b!469321)))

(assert (=> b!469321 t!14664))

(declare-fun b_and!20001 () Bool)

(assert (= b_and!19999 (and (=> t!14664 result!7409) b_and!20001)))

(declare-fun m!451469 () Bool)

(assert (=> b!469314 m!451469))

(assert (=> b!469318 m!451291))

(assert (=> b!469318 m!451305))

(assert (=> b!469318 m!451309))

(assert (=> b!469318 m!451311))

(assert (=> b!469318 m!451291))

(declare-fun m!451471 () Bool)

(assert (=> b!469318 m!451471))

(assert (=> b!469318 m!451305))

(assert (=> b!469318 m!451309))

(assert (=> b!469323 m!451291))

(assert (=> b!469323 m!451291))

(assert (=> b!469323 m!451295))

(declare-fun m!451473 () Bool)

(assert (=> b!469321 m!451473))

(assert (=> b!469321 m!451291))

(assert (=> b!469321 m!451305))

(assert (=> b!469321 m!451309))

(assert (=> b!469321 m!451311))

(declare-fun m!451475 () Bool)

(assert (=> b!469321 m!451475))

(assert (=> b!469321 m!451305))

(declare-fun m!451477 () Bool)

(assert (=> b!469321 m!451477))

(assert (=> b!469321 m!451309))

(assert (=> b!469321 m!451477))

(declare-fun m!451479 () Bool)

(assert (=> b!469321 m!451479))

(declare-fun m!451481 () Bool)

(assert (=> d!75299 m!451481))

(assert (=> d!75299 m!451247))

(declare-fun m!451483 () Bool)

(assert (=> b!469313 m!451483))

(assert (=> b!469322 m!451291))

(assert (=> b!469322 m!451291))

(declare-fun m!451485 () Bool)

(assert (=> b!469322 m!451485))

(declare-fun m!451487 () Bool)

(assert (=> b!469324 m!451487))

(assert (=> b!469316 m!451291))

(assert (=> b!469316 m!451291))

(assert (=> b!469316 m!451295))

(assert (=> bm!30390 m!451469))

(assert (=> b!469127 d!75299))

(declare-fun mapNonEmpty!21226 () Bool)

(declare-fun mapRes!21226 () Bool)

(declare-fun tp!40792 () Bool)

(declare-fun e!274797 () Bool)

(assert (=> mapNonEmpty!21226 (= mapRes!21226 (and tp!40792 e!274797))))

(declare-fun mapRest!21226 () (Array (_ BitVec 32) ValueCell!6165))

(declare-fun mapValue!21226 () ValueCell!6165)

(declare-fun mapKey!21226 () (_ BitVec 32))

(assert (=> mapNonEmpty!21226 (= mapRest!21220 (store mapRest!21226 mapKey!21226 mapValue!21226))))

(declare-fun b!469332 () Bool)

(declare-fun e!274796 () Bool)

(assert (=> b!469332 (= e!274796 tp_is_empty!13017)))

(declare-fun b!469331 () Bool)

(assert (=> b!469331 (= e!274797 tp_is_empty!13017)))

(declare-fun condMapEmpty!21226 () Bool)

(declare-fun mapDefault!21226 () ValueCell!6165)

(assert (=> mapNonEmpty!21220 (= condMapEmpty!21226 (= mapRest!21220 ((as const (Array (_ BitVec 32) ValueCell!6165)) mapDefault!21226)))))

(assert (=> mapNonEmpty!21220 (= tp!40782 (and e!274796 mapRes!21226))))

(declare-fun mapIsEmpty!21226 () Bool)

(assert (=> mapIsEmpty!21226 mapRes!21226))

(assert (= (and mapNonEmpty!21220 condMapEmpty!21226) mapIsEmpty!21226))

(assert (= (and mapNonEmpty!21220 (not condMapEmpty!21226)) mapNonEmpty!21226))

(assert (= (and mapNonEmpty!21226 ((_ is ValueCellFull!6165) mapValue!21226)) b!469331))

(assert (= (and mapNonEmpty!21220 ((_ is ValueCellFull!6165) mapDefault!21226)) b!469332))

(declare-fun m!451489 () Bool)

(assert (=> mapNonEmpty!21226 m!451489))

(declare-fun b_lambda!10101 () Bool)

(assert (= b_lambda!10095 (or (and start!42016 b_free!11589) b_lambda!10101)))

(declare-fun b_lambda!10103 () Bool)

(assert (= b_lambda!10097 (or (and start!42016 b_free!11589) b_lambda!10103)))

(declare-fun b_lambda!10105 () Bool)

(assert (= b_lambda!10089 (or (and start!42016 b_free!11589) b_lambda!10105)))

(declare-fun b_lambda!10107 () Bool)

(assert (= b_lambda!10093 (or (and start!42016 b_free!11589) b_lambda!10107)))

(declare-fun b_lambda!10109 () Bool)

(assert (= b_lambda!10091 (or (and start!42016 b_free!11589) b_lambda!10109)))

(declare-fun b_lambda!10111 () Bool)

(assert (= b_lambda!10099 (or (and start!42016 b_free!11589) b_lambda!10111)))

(check-sat (not b!469240) (not b!469259) (not bm!30370) (not b_lambda!10101) (not b!469309) (not bm!30381) (not d!75295) (not b_lambda!10107) (not b!469316) (not b!469168) (not b_lambda!10109) (not bm!30390) (not b!469324) (not b!469321) (not b!469322) (not b!469245) (not bm!30377) (not d!75283) (not b!469255) (not b!469302) (not b!469228) (not b!469311) (not b!469323) (not b_next!11589) (not d!75285) (not b_lambda!10111) (not d!75279) (not b!469225) (not bm!30389) (not b!469306) (not b!469273) (not b!469301) (not b!469241) (not b!469223) (not bm!30374) (not bm!30386) (not b!469310) (not b!469312) (not b!469250) (not b!469276) (not b!469238) (not b!469246) (not b!469165) tp_is_empty!13017 (not bm!30375) (not b!469258) (not b!469227) (not d!75277) b_and!20001 (not bm!30372) (not b!469256) (not mapNonEmpty!21226) (not b!469224) (not b!469254) (not b_lambda!10103) (not d!75281) (not bm!30379) (not d!75275) (not d!75299) (not b!469304) (not b!469314) (not d!75297) (not b!469263) (not b!469215) (not bm!30382) (not b!469239) (not b!469167) (not b_lambda!10105) (not b!469219) (not b!469313) (not bm!30355) (not b!469264) (not b!469214) (not b!469318))
(check-sat b_and!20001 (not b_next!11589))
