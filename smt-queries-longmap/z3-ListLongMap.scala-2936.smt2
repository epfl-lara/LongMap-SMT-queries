; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41790 () Bool)

(assert start!41790)

(declare-fun b_free!11425 () Bool)

(declare-fun b_next!11425 () Bool)

(assert (=> start!41790 (= b_free!11425 (not b_next!11425))))

(declare-fun tp!40281 () Bool)

(declare-fun b_and!19767 () Bool)

(assert (=> start!41790 (= tp!40281 b_and!19767)))

(declare-fun mapNonEmpty!20965 () Bool)

(declare-fun mapRes!20965 () Bool)

(declare-fun tp!40282 () Bool)

(declare-fun e!272835 () Bool)

(assert (=> mapNonEmpty!20965 (= mapRes!20965 (and tp!40282 e!272835))))

(declare-datatypes ((V!18243 0))(
  ( (V!18244 (val!6471 Int)) )
))
(declare-datatypes ((ValueCell!6083 0))(
  ( (ValueCellFull!6083 (v!8753 V!18243)) (EmptyCell!6083) )
))
(declare-fun mapRest!20965 () (Array (_ BitVec 32) ValueCell!6083))

(declare-datatypes ((array!29481 0))(
  ( (array!29482 (arr!14169 (Array (_ BitVec 32) ValueCell!6083)) (size!14522 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29481)

(declare-fun mapKey!20965 () (_ BitVec 32))

(declare-fun mapValue!20965 () ValueCell!6083)

(assert (=> mapNonEmpty!20965 (= (arr!14169 _values!833) (store mapRest!20965 mapKey!20965 mapValue!20965))))

(declare-fun mapIsEmpty!20965 () Bool)

(assert (=> mapIsEmpty!20965 mapRes!20965))

(declare-fun b!466549 () Bool)

(declare-fun res!278915 () Bool)

(declare-fun e!272839 () Bool)

(assert (=> b!466549 (=> (not res!278915) (not e!272839))))

(declare-datatypes ((array!29483 0))(
  ( (array!29484 (arr!14170 (Array (_ BitVec 32) (_ BitVec 64))) (size!14523 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29483)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29483 (_ BitVec 32)) Bool)

(assert (=> b!466549 (= res!278915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466550 () Bool)

(declare-fun tp_is_empty!12853 () Bool)

(assert (=> b!466550 (= e!272835 tp_is_empty!12853)))

(declare-fun b!466551 () Bool)

(declare-fun res!278917 () Bool)

(assert (=> b!466551 (=> (not res!278917) (not e!272839))))

(declare-datatypes ((List!8615 0))(
  ( (Nil!8612) (Cons!8611 (h!9467 (_ BitVec 64)) (t!14558 List!8615)) )
))
(declare-fun arrayNoDuplicates!0 (array!29483 (_ BitVec 32) List!8615) Bool)

(assert (=> b!466551 (= res!278917 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8612))))

(declare-fun b!466553 () Bool)

(declare-fun e!272836 () Bool)

(assert (=> b!466553 (= e!272839 (not e!272836))))

(declare-fun res!278918 () Bool)

(assert (=> b!466553 (=> res!278918 e!272836)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466553 (= res!278918 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8534 0))(
  ( (tuple2!8535 (_1!4278 (_ BitVec 64)) (_2!4278 V!18243)) )
))
(declare-datatypes ((List!8616 0))(
  ( (Nil!8613) (Cons!8612 (h!9468 tuple2!8534) (t!14559 List!8616)) )
))
(declare-datatypes ((ListLongMap!7437 0))(
  ( (ListLongMap!7438 (toList!3734 List!8616)) )
))
(declare-fun lt!210791 () ListLongMap!7437)

(declare-fun lt!210790 () ListLongMap!7437)

(assert (=> b!466553 (= lt!210791 lt!210790)))

(declare-fun minValueBefore!38 () V!18243)

(declare-fun zeroValue!794 () V!18243)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13570 0))(
  ( (Unit!13571) )
))
(declare-fun lt!210792 () Unit!13570)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18243)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!75 (array!29483 array!29481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18243 V!18243 V!18243 V!18243 (_ BitVec 32) Int) Unit!13570)

(assert (=> b!466553 (= lt!210792 (lemmaNoChangeToArrayThenSameMapNoExtras!75 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1918 (array!29483 array!29481 (_ BitVec 32) (_ BitVec 32) V!18243 V!18243 (_ BitVec 32) Int) ListLongMap!7437)

(assert (=> b!466553 (= lt!210790 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466553 (= lt!210791 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466554 () Bool)

(declare-fun res!278916 () Bool)

(assert (=> b!466554 (=> (not res!278916) (not e!272839))))

(assert (=> b!466554 (= res!278916 (and (= (size!14522 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14523 _keys!1025) (size!14522 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466555 () Bool)

(declare-fun res!278913 () Bool)

(assert (=> b!466555 (=> res!278913 e!272836)))

(declare-fun +!1705 (ListLongMap!7437 tuple2!8534) ListLongMap!7437)

(declare-fun getCurrentListMap!2124 (array!29483 array!29481 (_ BitVec 32) (_ BitVec 32) V!18243 V!18243 (_ BitVec 32) Int) ListLongMap!7437)

(assert (=> b!466555 (= res!278913 (not (= (+!1705 (getCurrentListMap!2124 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2124 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))))

(declare-fun b!466556 () Bool)

(declare-fun e!272837 () Bool)

(declare-fun e!272834 () Bool)

(assert (=> b!466556 (= e!272837 (and e!272834 mapRes!20965))))

(declare-fun condMapEmpty!20965 () Bool)

(declare-fun mapDefault!20965 () ValueCell!6083)

(assert (=> b!466556 (= condMapEmpty!20965 (= (arr!14169 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6083)) mapDefault!20965)))))

(declare-fun b!466557 () Bool)

(assert (=> b!466557 (= e!272834 tp_is_empty!12853)))

(declare-fun b!466552 () Bool)

(assert (=> b!466552 (= e!272836 (bvsle #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun res!278914 () Bool)

(assert (=> start!41790 (=> (not res!278914) (not e!272839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41790 (= res!278914 (validMask!0 mask!1365))))

(assert (=> start!41790 e!272839))

(assert (=> start!41790 tp_is_empty!12853))

(assert (=> start!41790 tp!40281))

(assert (=> start!41790 true))

(declare-fun array_inv!10316 (array!29483) Bool)

(assert (=> start!41790 (array_inv!10316 _keys!1025)))

(declare-fun array_inv!10317 (array!29481) Bool)

(assert (=> start!41790 (and (array_inv!10317 _values!833) e!272837)))

(assert (= (and start!41790 res!278914) b!466554))

(assert (= (and b!466554 res!278916) b!466549))

(assert (= (and b!466549 res!278915) b!466551))

(assert (= (and b!466551 res!278917) b!466553))

(assert (= (and b!466553 (not res!278918)) b!466555))

(assert (= (and b!466555 (not res!278913)) b!466552))

(assert (= (and b!466556 condMapEmpty!20965) mapIsEmpty!20965))

(assert (= (and b!466556 (not condMapEmpty!20965)) mapNonEmpty!20965))

(get-info :version)

(assert (= (and mapNonEmpty!20965 ((_ is ValueCellFull!6083) mapValue!20965)) b!466550))

(assert (= (and b!466556 ((_ is ValueCellFull!6083) mapDefault!20965)) b!466557))

(assert (= start!41790 b!466556))

(declare-fun m!448301 () Bool)

(assert (=> start!41790 m!448301))

(declare-fun m!448303 () Bool)

(assert (=> start!41790 m!448303))

(declare-fun m!448305 () Bool)

(assert (=> start!41790 m!448305))

(declare-fun m!448307 () Bool)

(assert (=> b!466551 m!448307))

(declare-fun m!448309 () Bool)

(assert (=> b!466549 m!448309))

(declare-fun m!448311 () Bool)

(assert (=> b!466555 m!448311))

(assert (=> b!466555 m!448311))

(declare-fun m!448313 () Bool)

(assert (=> b!466555 m!448313))

(declare-fun m!448315 () Bool)

(assert (=> b!466555 m!448315))

(declare-fun m!448317 () Bool)

(assert (=> mapNonEmpty!20965 m!448317))

(declare-fun m!448319 () Bool)

(assert (=> b!466553 m!448319))

(declare-fun m!448321 () Bool)

(assert (=> b!466553 m!448321))

(declare-fun m!448323 () Bool)

(assert (=> b!466553 m!448323))

(check-sat b_and!19767 (not b!466555) (not b!466553) (not b!466549) tp_is_empty!12853 (not b_next!11425) (not start!41790) (not b!466551) (not mapNonEmpty!20965))
(check-sat b_and!19767 (not b_next!11425))
(get-model)

(declare-fun d!74959 () Bool)

(declare-fun res!278962 () Bool)

(declare-fun e!272886 () Bool)

(assert (=> d!74959 (=> res!278962 e!272886)))

(assert (=> d!74959 (= res!278962 (bvsge #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(assert (=> d!74959 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8612) e!272886)))

(declare-fun b!466622 () Bool)

(declare-fun e!272884 () Bool)

(assert (=> b!466622 (= e!272886 e!272884)))

(declare-fun res!278961 () Bool)

(assert (=> b!466622 (=> (not res!278961) (not e!272884))))

(declare-fun e!272887 () Bool)

(assert (=> b!466622 (= res!278961 (not e!272887))))

(declare-fun res!278963 () Bool)

(assert (=> b!466622 (=> (not res!278963) (not e!272887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!466622 (= res!278963 (validKeyInArray!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30251 () Bool)

(declare-fun call!30254 () Bool)

(declare-fun c!56674 () Bool)

(assert (=> bm!30251 (= call!30254 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56674 (Cons!8611 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000) Nil!8612) Nil!8612)))))

(declare-fun b!466623 () Bool)

(declare-fun contains!2518 (List!8615 (_ BitVec 64)) Bool)

(assert (=> b!466623 (= e!272887 (contains!2518 Nil!8612 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466624 () Bool)

(declare-fun e!272885 () Bool)

(assert (=> b!466624 (= e!272884 e!272885)))

(assert (=> b!466624 (= c!56674 (validKeyInArray!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466625 () Bool)

(assert (=> b!466625 (= e!272885 call!30254)))

(declare-fun b!466626 () Bool)

(assert (=> b!466626 (= e!272885 call!30254)))

(assert (= (and d!74959 (not res!278962)) b!466622))

(assert (= (and b!466622 res!278963) b!466623))

(assert (= (and b!466622 res!278961) b!466624))

(assert (= (and b!466624 c!56674) b!466626))

(assert (= (and b!466624 (not c!56674)) b!466625))

(assert (= (or b!466626 b!466625) bm!30251))

(declare-fun m!448373 () Bool)

(assert (=> b!466622 m!448373))

(assert (=> b!466622 m!448373))

(declare-fun m!448375 () Bool)

(assert (=> b!466622 m!448375))

(assert (=> bm!30251 m!448373))

(declare-fun m!448377 () Bool)

(assert (=> bm!30251 m!448377))

(assert (=> b!466623 m!448373))

(assert (=> b!466623 m!448373))

(declare-fun m!448379 () Bool)

(assert (=> b!466623 m!448379))

(assert (=> b!466624 m!448373))

(assert (=> b!466624 m!448373))

(assert (=> b!466624 m!448375))

(assert (=> b!466551 d!74959))

(declare-fun b!466635 () Bool)

(declare-fun e!272895 () Bool)

(declare-fun call!30257 () Bool)

(assert (=> b!466635 (= e!272895 call!30257)))

(declare-fun b!466636 () Bool)

(declare-fun e!272894 () Bool)

(declare-fun e!272896 () Bool)

(assert (=> b!466636 (= e!272894 e!272896)))

(declare-fun c!56677 () Bool)

(assert (=> b!466636 (= c!56677 (validKeyInArray!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!74961 () Bool)

(declare-fun res!278969 () Bool)

(assert (=> d!74961 (=> res!278969 e!272894)))

(assert (=> d!74961 (= res!278969 (bvsge #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(assert (=> d!74961 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!272894)))

(declare-fun bm!30254 () Bool)

(assert (=> bm!30254 (= call!30257 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!466637 () Bool)

(assert (=> b!466637 (= e!272896 e!272895)))

(declare-fun lt!210819 () (_ BitVec 64))

(assert (=> b!466637 (= lt!210819 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210818 () Unit!13570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29483 (_ BitVec 64) (_ BitVec 32)) Unit!13570)

(assert (=> b!466637 (= lt!210818 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!210819 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!466637 (arrayContainsKey!0 _keys!1025 lt!210819 #b00000000000000000000000000000000)))

(declare-fun lt!210817 () Unit!13570)

(assert (=> b!466637 (= lt!210817 lt!210818)))

(declare-fun res!278968 () Bool)

(declare-datatypes ((SeekEntryResult!3542 0))(
  ( (MissingZero!3542 (index!16347 (_ BitVec 32))) (Found!3542 (index!16348 (_ BitVec 32))) (Intermediate!3542 (undefined!4354 Bool) (index!16349 (_ BitVec 32)) (x!43658 (_ BitVec 32))) (Undefined!3542) (MissingVacant!3542 (index!16350 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29483 (_ BitVec 32)) SeekEntryResult!3542)

(assert (=> b!466637 (= res!278968 (= (seekEntryOrOpen!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3542 #b00000000000000000000000000000000)))))

(assert (=> b!466637 (=> (not res!278968) (not e!272895))))

(declare-fun b!466638 () Bool)

(assert (=> b!466638 (= e!272896 call!30257)))

(assert (= (and d!74961 (not res!278969)) b!466636))

(assert (= (and b!466636 c!56677) b!466637))

(assert (= (and b!466636 (not c!56677)) b!466638))

(assert (= (and b!466637 res!278968) b!466635))

(assert (= (or b!466635 b!466638) bm!30254))

(assert (=> b!466636 m!448373))

(assert (=> b!466636 m!448373))

(assert (=> b!466636 m!448375))

(declare-fun m!448381 () Bool)

(assert (=> bm!30254 m!448381))

(assert (=> b!466637 m!448373))

(declare-fun m!448383 () Bool)

(assert (=> b!466637 m!448383))

(declare-fun m!448385 () Bool)

(assert (=> b!466637 m!448385))

(assert (=> b!466637 m!448373))

(declare-fun m!448387 () Bool)

(assert (=> b!466637 m!448387))

(assert (=> b!466549 d!74961))

(declare-fun d!74963 () Bool)

(assert (=> d!74963 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41790 d!74963))

(declare-fun d!74965 () Bool)

(assert (=> d!74965 (= (array_inv!10316 _keys!1025) (bvsge (size!14523 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41790 d!74965))

(declare-fun d!74967 () Bool)

(assert (=> d!74967 (= (array_inv!10317 _values!833) (bvsge (size!14522 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41790 d!74967))

(declare-fun d!74969 () Bool)

(declare-fun e!272899 () Bool)

(assert (=> d!74969 e!272899))

(declare-fun res!278974 () Bool)

(assert (=> d!74969 (=> (not res!278974) (not e!272899))))

(declare-fun lt!210828 () ListLongMap!7437)

(declare-fun contains!2519 (ListLongMap!7437 (_ BitVec 64)) Bool)

(assert (=> d!74969 (= res!278974 (contains!2519 lt!210828 (_1!4278 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!210830 () List!8616)

(assert (=> d!74969 (= lt!210828 (ListLongMap!7438 lt!210830))))

(declare-fun lt!210829 () Unit!13570)

(declare-fun lt!210831 () Unit!13570)

(assert (=> d!74969 (= lt!210829 lt!210831)))

(declare-datatypes ((Option!381 0))(
  ( (Some!380 (v!8756 V!18243)) (None!379) )
))
(declare-fun getValueByKey!375 (List!8616 (_ BitVec 64)) Option!381)

(assert (=> d!74969 (= (getValueByKey!375 lt!210830 (_1!4278 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!380 (_2!4278 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!200 (List!8616 (_ BitVec 64) V!18243) Unit!13570)

(assert (=> d!74969 (= lt!210831 (lemmaContainsTupThenGetReturnValue!200 lt!210830 (_1!4278 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4278 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!203 (List!8616 (_ BitVec 64) V!18243) List!8616)

(assert (=> d!74969 (= lt!210830 (insertStrictlySorted!203 (toList!3734 (getCurrentListMap!2124 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4278 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4278 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!74969 (= (+!1705 (getCurrentListMap!2124 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!210828)))

(declare-fun b!466643 () Bool)

(declare-fun res!278975 () Bool)

(assert (=> b!466643 (=> (not res!278975) (not e!272899))))

(assert (=> b!466643 (= res!278975 (= (getValueByKey!375 (toList!3734 lt!210828) (_1!4278 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!380 (_2!4278 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!466644 () Bool)

(declare-fun contains!2520 (List!8616 tuple2!8534) Bool)

(assert (=> b!466644 (= e!272899 (contains!2520 (toList!3734 lt!210828) (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!74969 res!278974) b!466643))

(assert (= (and b!466643 res!278975) b!466644))

(declare-fun m!448389 () Bool)

(assert (=> d!74969 m!448389))

(declare-fun m!448391 () Bool)

(assert (=> d!74969 m!448391))

(declare-fun m!448393 () Bool)

(assert (=> d!74969 m!448393))

(declare-fun m!448395 () Bool)

(assert (=> d!74969 m!448395))

(declare-fun m!448397 () Bool)

(assert (=> b!466643 m!448397))

(declare-fun m!448399 () Bool)

(assert (=> b!466644 m!448399))

(assert (=> b!466555 d!74969))

(declare-fun lt!210888 () ListLongMap!7437)

(declare-fun b!466687 () Bool)

(declare-fun e!272931 () Bool)

(declare-fun apply!323 (ListLongMap!7437 (_ BitVec 64)) V!18243)

(declare-fun get!6950 (ValueCell!6083 V!18243) V!18243)

(declare-fun dynLambda!919 (Int (_ BitVec 64)) V!18243)

(assert (=> b!466687 (= e!272931 (= (apply!323 lt!210888 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)) (get!6950 (select (arr!14169 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!466687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14522 _values!833)))))

(assert (=> b!466687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun b!466688 () Bool)

(declare-fun e!272934 () Bool)

(assert (=> b!466688 (= e!272934 (= (apply!323 lt!210888 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!466690 () Bool)

(declare-fun e!272927 () ListLongMap!7437)

(declare-fun call!30273 () ListLongMap!7437)

(assert (=> b!466690 (= e!272927 call!30273)))

(declare-fun b!466691 () Bool)

(declare-fun e!272932 () Unit!13570)

(declare-fun Unit!13574 () Unit!13570)

(assert (=> b!466691 (= e!272932 Unit!13574)))

(declare-fun bm!30269 () Bool)

(declare-fun call!30275 () ListLongMap!7437)

(assert (=> bm!30269 (= call!30273 call!30275)))

(declare-fun call!30278 () ListLongMap!7437)

(declare-fun bm!30270 () Bool)

(assert (=> bm!30270 (= call!30278 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30271 () Bool)

(declare-fun call!30276 () Bool)

(assert (=> bm!30271 (= call!30276 (contains!2519 lt!210888 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!466692 () Bool)

(declare-fun e!272933 () Bool)

(assert (=> b!466692 (= e!272933 (= (apply!323 lt!210888 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun c!56695 () Bool)

(declare-fun bm!30272 () Bool)

(declare-fun call!30272 () ListLongMap!7437)

(declare-fun c!56692 () Bool)

(declare-fun call!30274 () ListLongMap!7437)

(assert (=> bm!30272 (= call!30275 (+!1705 (ite c!56695 call!30278 (ite c!56692 call!30272 call!30274)) (ite (or c!56695 c!56692) (tuple2!8535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun bm!30273 () Bool)

(declare-fun call!30277 () Bool)

(assert (=> bm!30273 (= call!30277 (contains!2519 lt!210888 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!466693 () Bool)

(declare-fun e!272930 () Bool)

(assert (=> b!466693 (= e!272930 (not call!30276))))

(declare-fun b!466694 () Bool)

(declare-fun e!272937 () ListLongMap!7437)

(assert (=> b!466694 (= e!272937 call!30273)))

(declare-fun b!466695 () Bool)

(declare-fun e!272929 () Bool)

(declare-fun e!272935 () Bool)

(assert (=> b!466695 (= e!272929 e!272935)))

(declare-fun c!56694 () Bool)

(assert (=> b!466695 (= c!56694 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466696 () Bool)

(declare-fun e!272936 () Bool)

(assert (=> b!466696 (= e!272936 (validKeyInArray!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466697 () Bool)

(declare-fun e!272928 () Bool)

(assert (=> b!466697 (= e!272928 (validKeyInArray!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466689 () Bool)

(assert (=> b!466689 (= e!272930 e!272933)))

(declare-fun res!279002 () Bool)

(assert (=> b!466689 (= res!279002 call!30276)))

(assert (=> b!466689 (=> (not res!279002) (not e!272933))))

(declare-fun d!74971 () Bool)

(assert (=> d!74971 e!272929))

(declare-fun res!278995 () Bool)

(assert (=> d!74971 (=> (not res!278995) (not e!272929))))

(assert (=> d!74971 (= res!278995 (or (bvsge #b00000000000000000000000000000000 (size!14523 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))))

(declare-fun lt!210887 () ListLongMap!7437)

(assert (=> d!74971 (= lt!210888 lt!210887)))

(declare-fun lt!210876 () Unit!13570)

(assert (=> d!74971 (= lt!210876 e!272932)))

(declare-fun c!56690 () Bool)

(assert (=> d!74971 (= c!56690 e!272936)))

(declare-fun res!278999 () Bool)

(assert (=> d!74971 (=> (not res!278999) (not e!272936))))

(assert (=> d!74971 (= res!278999 (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun e!272938 () ListLongMap!7437)

(assert (=> d!74971 (= lt!210887 e!272938)))

(assert (=> d!74971 (= c!56695 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!74971 (validMask!0 mask!1365)))

(assert (=> d!74971 (= (getCurrentListMap!2124 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210888)))

(declare-fun b!466698 () Bool)

(declare-fun lt!210894 () Unit!13570)

(assert (=> b!466698 (= e!272932 lt!210894)))

(declare-fun lt!210893 () ListLongMap!7437)

(assert (=> b!466698 (= lt!210893 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210881 () (_ BitVec 64))

(assert (=> b!466698 (= lt!210881 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210890 () (_ BitVec 64))

(assert (=> b!466698 (= lt!210890 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210880 () Unit!13570)

(declare-fun addStillContains!286 (ListLongMap!7437 (_ BitVec 64) V!18243 (_ BitVec 64)) Unit!13570)

(assert (=> b!466698 (= lt!210880 (addStillContains!286 lt!210893 lt!210881 zeroValue!794 lt!210890))))

(assert (=> b!466698 (contains!2519 (+!1705 lt!210893 (tuple2!8535 lt!210881 zeroValue!794)) lt!210890)))

(declare-fun lt!210891 () Unit!13570)

(assert (=> b!466698 (= lt!210891 lt!210880)))

(declare-fun lt!210884 () ListLongMap!7437)

(assert (=> b!466698 (= lt!210884 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210895 () (_ BitVec 64))

(assert (=> b!466698 (= lt!210895 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210896 () (_ BitVec 64))

(assert (=> b!466698 (= lt!210896 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210883 () Unit!13570)

(declare-fun addApplyDifferent!286 (ListLongMap!7437 (_ BitVec 64) V!18243 (_ BitVec 64)) Unit!13570)

(assert (=> b!466698 (= lt!210883 (addApplyDifferent!286 lt!210884 lt!210895 minValueBefore!38 lt!210896))))

(assert (=> b!466698 (= (apply!323 (+!1705 lt!210884 (tuple2!8535 lt!210895 minValueBefore!38)) lt!210896) (apply!323 lt!210884 lt!210896))))

(declare-fun lt!210879 () Unit!13570)

(assert (=> b!466698 (= lt!210879 lt!210883)))

(declare-fun lt!210877 () ListLongMap!7437)

(assert (=> b!466698 (= lt!210877 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210889 () (_ BitVec 64))

(assert (=> b!466698 (= lt!210889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210885 () (_ BitVec 64))

(assert (=> b!466698 (= lt!210885 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210886 () Unit!13570)

(assert (=> b!466698 (= lt!210886 (addApplyDifferent!286 lt!210877 lt!210889 zeroValue!794 lt!210885))))

(assert (=> b!466698 (= (apply!323 (+!1705 lt!210877 (tuple2!8535 lt!210889 zeroValue!794)) lt!210885) (apply!323 lt!210877 lt!210885))))

(declare-fun lt!210878 () Unit!13570)

(assert (=> b!466698 (= lt!210878 lt!210886)))

(declare-fun lt!210882 () ListLongMap!7437)

(assert (=> b!466698 (= lt!210882 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210892 () (_ BitVec 64))

(assert (=> b!466698 (= lt!210892 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210897 () (_ BitVec 64))

(assert (=> b!466698 (= lt!210897 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!466698 (= lt!210894 (addApplyDifferent!286 lt!210882 lt!210892 minValueBefore!38 lt!210897))))

(assert (=> b!466698 (= (apply!323 (+!1705 lt!210882 (tuple2!8535 lt!210892 minValueBefore!38)) lt!210897) (apply!323 lt!210882 lt!210897))))

(declare-fun bm!30274 () Bool)

(assert (=> bm!30274 (= call!30274 call!30272)))

(declare-fun b!466699 () Bool)

(declare-fun res!278998 () Bool)

(assert (=> b!466699 (=> (not res!278998) (not e!272929))))

(assert (=> b!466699 (= res!278998 e!272930)))

(declare-fun c!56691 () Bool)

(assert (=> b!466699 (= c!56691 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!466700 () Bool)

(declare-fun c!56693 () Bool)

(assert (=> b!466700 (= c!56693 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!466700 (= e!272937 e!272927)))

(declare-fun b!466701 () Bool)

(assert (=> b!466701 (= e!272938 e!272937)))

(assert (=> b!466701 (= c!56692 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466702 () Bool)

(assert (=> b!466702 (= e!272927 call!30274)))

(declare-fun b!466703 () Bool)

(assert (=> b!466703 (= e!272935 e!272934)))

(declare-fun res!278997 () Bool)

(assert (=> b!466703 (= res!278997 call!30277)))

(assert (=> b!466703 (=> (not res!278997) (not e!272934))))

(declare-fun bm!30275 () Bool)

(assert (=> bm!30275 (= call!30272 call!30278)))

(declare-fun b!466704 () Bool)

(declare-fun e!272926 () Bool)

(assert (=> b!466704 (= e!272926 e!272931)))

(declare-fun res!278996 () Bool)

(assert (=> b!466704 (=> (not res!278996) (not e!272931))))

(assert (=> b!466704 (= res!278996 (contains!2519 lt!210888 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466704 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun b!466705 () Bool)

(declare-fun res!278994 () Bool)

(assert (=> b!466705 (=> (not res!278994) (not e!272929))))

(assert (=> b!466705 (= res!278994 e!272926)))

(declare-fun res!279001 () Bool)

(assert (=> b!466705 (=> res!279001 e!272926)))

(assert (=> b!466705 (= res!279001 (not e!272928))))

(declare-fun res!279000 () Bool)

(assert (=> b!466705 (=> (not res!279000) (not e!272928))))

(assert (=> b!466705 (= res!279000 (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun b!466706 () Bool)

(assert (=> b!466706 (= e!272935 (not call!30277))))

(declare-fun b!466707 () Bool)

(assert (=> b!466707 (= e!272938 (+!1705 call!30275 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!74971 c!56695) b!466707))

(assert (= (and d!74971 (not c!56695)) b!466701))

(assert (= (and b!466701 c!56692) b!466694))

(assert (= (and b!466701 (not c!56692)) b!466700))

(assert (= (and b!466700 c!56693) b!466690))

(assert (= (and b!466700 (not c!56693)) b!466702))

(assert (= (or b!466690 b!466702) bm!30274))

(assert (= (or b!466694 bm!30274) bm!30275))

(assert (= (or b!466694 b!466690) bm!30269))

(assert (= (or b!466707 bm!30275) bm!30270))

(assert (= (or b!466707 bm!30269) bm!30272))

(assert (= (and d!74971 res!278999) b!466696))

(assert (= (and d!74971 c!56690) b!466698))

(assert (= (and d!74971 (not c!56690)) b!466691))

(assert (= (and d!74971 res!278995) b!466705))

(assert (= (and b!466705 res!279000) b!466697))

(assert (= (and b!466705 (not res!279001)) b!466704))

(assert (= (and b!466704 res!278996) b!466687))

(assert (= (and b!466705 res!278994) b!466699))

(assert (= (and b!466699 c!56691) b!466689))

(assert (= (and b!466699 (not c!56691)) b!466693))

(assert (= (and b!466689 res!279002) b!466692))

(assert (= (or b!466689 b!466693) bm!30271))

(assert (= (and b!466699 res!278998) b!466695))

(assert (= (and b!466695 c!56694) b!466703))

(assert (= (and b!466695 (not c!56694)) b!466706))

(assert (= (and b!466703 res!278997) b!466688))

(assert (= (or b!466703 b!466706) bm!30273))

(declare-fun b_lambda!10011 () Bool)

(assert (=> (not b_lambda!10011) (not b!466687)))

(declare-fun t!14562 () Bool)

(declare-fun tb!3903 () Bool)

(assert (=> (and start!41790 (= defaultEntry!841 defaultEntry!841) t!14562) tb!3903))

(declare-fun result!7383 () Bool)

(assert (=> tb!3903 (= result!7383 tp_is_empty!12853)))

(assert (=> b!466687 t!14562))

(declare-fun b_and!19773 () Bool)

(assert (= b_and!19767 (and (=> t!14562 result!7383) b_and!19773)))

(declare-fun m!448401 () Bool)

(assert (=> bm!30273 m!448401))

(assert (=> d!74971 m!448301))

(declare-fun m!448403 () Bool)

(assert (=> b!466692 m!448403))

(declare-fun m!448405 () Bool)

(assert (=> b!466707 m!448405))

(assert (=> bm!30270 m!448323))

(declare-fun m!448407 () Bool)

(assert (=> b!466698 m!448407))

(declare-fun m!448409 () Bool)

(assert (=> b!466698 m!448409))

(declare-fun m!448411 () Bool)

(assert (=> b!466698 m!448411))

(declare-fun m!448413 () Bool)

(assert (=> b!466698 m!448413))

(declare-fun m!448415 () Bool)

(assert (=> b!466698 m!448415))

(assert (=> b!466698 m!448413))

(declare-fun m!448417 () Bool)

(assert (=> b!466698 m!448417))

(declare-fun m!448419 () Bool)

(assert (=> b!466698 m!448419))

(assert (=> b!466698 m!448373))

(declare-fun m!448421 () Bool)

(assert (=> b!466698 m!448421))

(declare-fun m!448423 () Bool)

(assert (=> b!466698 m!448423))

(declare-fun m!448425 () Bool)

(assert (=> b!466698 m!448425))

(declare-fun m!448427 () Bool)

(assert (=> b!466698 m!448427))

(assert (=> b!466698 m!448323))

(declare-fun m!448429 () Bool)

(assert (=> b!466698 m!448429))

(declare-fun m!448431 () Bool)

(assert (=> b!466698 m!448431))

(assert (=> b!466698 m!448425))

(assert (=> b!466698 m!448417))

(declare-fun m!448433 () Bool)

(assert (=> b!466698 m!448433))

(declare-fun m!448435 () Bool)

(assert (=> b!466698 m!448435))

(assert (=> b!466698 m!448409))

(assert (=> b!466696 m!448373))

(assert (=> b!466696 m!448373))

(assert (=> b!466696 m!448375))

(declare-fun m!448437 () Bool)

(assert (=> bm!30272 m!448437))

(assert (=> b!466704 m!448373))

(assert (=> b!466704 m!448373))

(declare-fun m!448439 () Bool)

(assert (=> b!466704 m!448439))

(declare-fun m!448441 () Bool)

(assert (=> b!466688 m!448441))

(declare-fun m!448443 () Bool)

(assert (=> bm!30271 m!448443))

(assert (=> b!466697 m!448373))

(assert (=> b!466697 m!448373))

(assert (=> b!466697 m!448375))

(declare-fun m!448445 () Bool)

(assert (=> b!466687 m!448445))

(assert (=> b!466687 m!448445))

(declare-fun m!448447 () Bool)

(assert (=> b!466687 m!448447))

(declare-fun m!448449 () Bool)

(assert (=> b!466687 m!448449))

(assert (=> b!466687 m!448373))

(declare-fun m!448451 () Bool)

(assert (=> b!466687 m!448451))

(assert (=> b!466687 m!448373))

(assert (=> b!466687 m!448447))

(assert (=> b!466555 d!74971))

(declare-fun e!272944 () Bool)

(declare-fun b!466710 () Bool)

(declare-fun lt!210910 () ListLongMap!7437)

(assert (=> b!466710 (= e!272944 (= (apply!323 lt!210910 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)) (get!6950 (select (arr!14169 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!466710 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14522 _values!833)))))

(assert (=> b!466710 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun b!466711 () Bool)

(declare-fun e!272947 () Bool)

(assert (=> b!466711 (= e!272947 (= (apply!323 lt!210910 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!466713 () Bool)

(declare-fun e!272940 () ListLongMap!7437)

(declare-fun call!30280 () ListLongMap!7437)

(assert (=> b!466713 (= e!272940 call!30280)))

(declare-fun b!466714 () Bool)

(declare-fun e!272945 () Unit!13570)

(declare-fun Unit!13575 () Unit!13570)

(assert (=> b!466714 (= e!272945 Unit!13575)))

(declare-fun bm!30276 () Bool)

(declare-fun call!30282 () ListLongMap!7437)

(assert (=> bm!30276 (= call!30280 call!30282)))

(declare-fun bm!30277 () Bool)

(declare-fun call!30285 () ListLongMap!7437)

(assert (=> bm!30277 (= call!30285 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30278 () Bool)

(declare-fun call!30283 () Bool)

(assert (=> bm!30278 (= call!30283 (contains!2519 lt!210910 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!466715 () Bool)

(declare-fun e!272946 () Bool)

(assert (=> b!466715 (= e!272946 (= (apply!323 lt!210910 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun c!56701 () Bool)

(declare-fun bm!30279 () Bool)

(declare-fun call!30279 () ListLongMap!7437)

(declare-fun call!30281 () ListLongMap!7437)

(declare-fun c!56698 () Bool)

(assert (=> bm!30279 (= call!30282 (+!1705 (ite c!56701 call!30285 (ite c!56698 call!30279 call!30281)) (ite (or c!56701 c!56698) (tuple2!8535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun bm!30280 () Bool)

(declare-fun call!30284 () Bool)

(assert (=> bm!30280 (= call!30284 (contains!2519 lt!210910 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!466716 () Bool)

(declare-fun e!272943 () Bool)

(assert (=> b!466716 (= e!272943 (not call!30283))))

(declare-fun b!466717 () Bool)

(declare-fun e!272950 () ListLongMap!7437)

(assert (=> b!466717 (= e!272950 call!30280)))

(declare-fun b!466718 () Bool)

(declare-fun e!272942 () Bool)

(declare-fun e!272948 () Bool)

(assert (=> b!466718 (= e!272942 e!272948)))

(declare-fun c!56700 () Bool)

(assert (=> b!466718 (= c!56700 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466719 () Bool)

(declare-fun e!272949 () Bool)

(assert (=> b!466719 (= e!272949 (validKeyInArray!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466720 () Bool)

(declare-fun e!272941 () Bool)

(assert (=> b!466720 (= e!272941 (validKeyInArray!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466712 () Bool)

(assert (=> b!466712 (= e!272943 e!272946)))

(declare-fun res!279011 () Bool)

(assert (=> b!466712 (= res!279011 call!30283)))

(assert (=> b!466712 (=> (not res!279011) (not e!272946))))

(declare-fun d!74973 () Bool)

(assert (=> d!74973 e!272942))

(declare-fun res!279004 () Bool)

(assert (=> d!74973 (=> (not res!279004) (not e!272942))))

(assert (=> d!74973 (= res!279004 (or (bvsge #b00000000000000000000000000000000 (size!14523 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))))

(declare-fun lt!210909 () ListLongMap!7437)

(assert (=> d!74973 (= lt!210910 lt!210909)))

(declare-fun lt!210898 () Unit!13570)

(assert (=> d!74973 (= lt!210898 e!272945)))

(declare-fun c!56696 () Bool)

(assert (=> d!74973 (= c!56696 e!272949)))

(declare-fun res!279008 () Bool)

(assert (=> d!74973 (=> (not res!279008) (not e!272949))))

(assert (=> d!74973 (= res!279008 (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun e!272951 () ListLongMap!7437)

(assert (=> d!74973 (= lt!210909 e!272951)))

(assert (=> d!74973 (= c!56701 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!74973 (validMask!0 mask!1365)))

(assert (=> d!74973 (= (getCurrentListMap!2124 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210910)))

(declare-fun b!466721 () Bool)

(declare-fun lt!210916 () Unit!13570)

(assert (=> b!466721 (= e!272945 lt!210916)))

(declare-fun lt!210915 () ListLongMap!7437)

(assert (=> b!466721 (= lt!210915 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210903 () (_ BitVec 64))

(assert (=> b!466721 (= lt!210903 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210912 () (_ BitVec 64))

(assert (=> b!466721 (= lt!210912 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210902 () Unit!13570)

(assert (=> b!466721 (= lt!210902 (addStillContains!286 lt!210915 lt!210903 zeroValue!794 lt!210912))))

(assert (=> b!466721 (contains!2519 (+!1705 lt!210915 (tuple2!8535 lt!210903 zeroValue!794)) lt!210912)))

(declare-fun lt!210913 () Unit!13570)

(assert (=> b!466721 (= lt!210913 lt!210902)))

(declare-fun lt!210906 () ListLongMap!7437)

(assert (=> b!466721 (= lt!210906 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210917 () (_ BitVec 64))

(assert (=> b!466721 (= lt!210917 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210918 () (_ BitVec 64))

(assert (=> b!466721 (= lt!210918 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210905 () Unit!13570)

(assert (=> b!466721 (= lt!210905 (addApplyDifferent!286 lt!210906 lt!210917 minValueAfter!38 lt!210918))))

(assert (=> b!466721 (= (apply!323 (+!1705 lt!210906 (tuple2!8535 lt!210917 minValueAfter!38)) lt!210918) (apply!323 lt!210906 lt!210918))))

(declare-fun lt!210901 () Unit!13570)

(assert (=> b!466721 (= lt!210901 lt!210905)))

(declare-fun lt!210899 () ListLongMap!7437)

(assert (=> b!466721 (= lt!210899 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210911 () (_ BitVec 64))

(assert (=> b!466721 (= lt!210911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210907 () (_ BitVec 64))

(assert (=> b!466721 (= lt!210907 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210908 () Unit!13570)

(assert (=> b!466721 (= lt!210908 (addApplyDifferent!286 lt!210899 lt!210911 zeroValue!794 lt!210907))))

(assert (=> b!466721 (= (apply!323 (+!1705 lt!210899 (tuple2!8535 lt!210911 zeroValue!794)) lt!210907) (apply!323 lt!210899 lt!210907))))

(declare-fun lt!210900 () Unit!13570)

(assert (=> b!466721 (= lt!210900 lt!210908)))

(declare-fun lt!210904 () ListLongMap!7437)

(assert (=> b!466721 (= lt!210904 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210914 () (_ BitVec 64))

(assert (=> b!466721 (= lt!210914 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210919 () (_ BitVec 64))

(assert (=> b!466721 (= lt!210919 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!466721 (= lt!210916 (addApplyDifferent!286 lt!210904 lt!210914 minValueAfter!38 lt!210919))))

(assert (=> b!466721 (= (apply!323 (+!1705 lt!210904 (tuple2!8535 lt!210914 minValueAfter!38)) lt!210919) (apply!323 lt!210904 lt!210919))))

(declare-fun bm!30281 () Bool)

(assert (=> bm!30281 (= call!30281 call!30279)))

(declare-fun b!466722 () Bool)

(declare-fun res!279007 () Bool)

(assert (=> b!466722 (=> (not res!279007) (not e!272942))))

(assert (=> b!466722 (= res!279007 e!272943)))

(declare-fun c!56697 () Bool)

(assert (=> b!466722 (= c!56697 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!466723 () Bool)

(declare-fun c!56699 () Bool)

(assert (=> b!466723 (= c!56699 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!466723 (= e!272950 e!272940)))

(declare-fun b!466724 () Bool)

(assert (=> b!466724 (= e!272951 e!272950)))

(assert (=> b!466724 (= c!56698 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466725 () Bool)

(assert (=> b!466725 (= e!272940 call!30281)))

(declare-fun b!466726 () Bool)

(assert (=> b!466726 (= e!272948 e!272947)))

(declare-fun res!279006 () Bool)

(assert (=> b!466726 (= res!279006 call!30284)))

(assert (=> b!466726 (=> (not res!279006) (not e!272947))))

(declare-fun bm!30282 () Bool)

(assert (=> bm!30282 (= call!30279 call!30285)))

(declare-fun b!466727 () Bool)

(declare-fun e!272939 () Bool)

(assert (=> b!466727 (= e!272939 e!272944)))

(declare-fun res!279005 () Bool)

(assert (=> b!466727 (=> (not res!279005) (not e!272944))))

(assert (=> b!466727 (= res!279005 (contains!2519 lt!210910 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun b!466728 () Bool)

(declare-fun res!279003 () Bool)

(assert (=> b!466728 (=> (not res!279003) (not e!272942))))

(assert (=> b!466728 (= res!279003 e!272939)))

(declare-fun res!279010 () Bool)

(assert (=> b!466728 (=> res!279010 e!272939)))

(assert (=> b!466728 (= res!279010 (not e!272941))))

(declare-fun res!279009 () Bool)

(assert (=> b!466728 (=> (not res!279009) (not e!272941))))

(assert (=> b!466728 (= res!279009 (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun b!466729 () Bool)

(assert (=> b!466729 (= e!272948 (not call!30284))))

(declare-fun b!466730 () Bool)

(assert (=> b!466730 (= e!272951 (+!1705 call!30282 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!74973 c!56701) b!466730))

(assert (= (and d!74973 (not c!56701)) b!466724))

(assert (= (and b!466724 c!56698) b!466717))

(assert (= (and b!466724 (not c!56698)) b!466723))

(assert (= (and b!466723 c!56699) b!466713))

(assert (= (and b!466723 (not c!56699)) b!466725))

(assert (= (or b!466713 b!466725) bm!30281))

(assert (= (or b!466717 bm!30281) bm!30282))

(assert (= (or b!466717 b!466713) bm!30276))

(assert (= (or b!466730 bm!30282) bm!30277))

(assert (= (or b!466730 bm!30276) bm!30279))

(assert (= (and d!74973 res!279008) b!466719))

(assert (= (and d!74973 c!56696) b!466721))

(assert (= (and d!74973 (not c!56696)) b!466714))

(assert (= (and d!74973 res!279004) b!466728))

(assert (= (and b!466728 res!279009) b!466720))

(assert (= (and b!466728 (not res!279010)) b!466727))

(assert (= (and b!466727 res!279005) b!466710))

(assert (= (and b!466728 res!279003) b!466722))

(assert (= (and b!466722 c!56697) b!466712))

(assert (= (and b!466722 (not c!56697)) b!466716))

(assert (= (and b!466712 res!279011) b!466715))

(assert (= (or b!466712 b!466716) bm!30278))

(assert (= (and b!466722 res!279007) b!466718))

(assert (= (and b!466718 c!56700) b!466726))

(assert (= (and b!466718 (not c!56700)) b!466729))

(assert (= (and b!466726 res!279006) b!466711))

(assert (= (or b!466726 b!466729) bm!30280))

(declare-fun b_lambda!10013 () Bool)

(assert (=> (not b_lambda!10013) (not b!466710)))

(assert (=> b!466710 t!14562))

(declare-fun b_and!19775 () Bool)

(assert (= b_and!19773 (and (=> t!14562 result!7383) b_and!19775)))

(declare-fun m!448453 () Bool)

(assert (=> bm!30280 m!448453))

(assert (=> d!74973 m!448301))

(declare-fun m!448455 () Bool)

(assert (=> b!466715 m!448455))

(declare-fun m!448457 () Bool)

(assert (=> b!466730 m!448457))

(assert (=> bm!30277 m!448321))

(declare-fun m!448459 () Bool)

(assert (=> b!466721 m!448459))

(declare-fun m!448461 () Bool)

(assert (=> b!466721 m!448461))

(declare-fun m!448463 () Bool)

(assert (=> b!466721 m!448463))

(declare-fun m!448465 () Bool)

(assert (=> b!466721 m!448465))

(declare-fun m!448467 () Bool)

(assert (=> b!466721 m!448467))

(assert (=> b!466721 m!448465))

(declare-fun m!448469 () Bool)

(assert (=> b!466721 m!448469))

(declare-fun m!448471 () Bool)

(assert (=> b!466721 m!448471))

(assert (=> b!466721 m!448373))

(declare-fun m!448473 () Bool)

(assert (=> b!466721 m!448473))

(declare-fun m!448475 () Bool)

(assert (=> b!466721 m!448475))

(declare-fun m!448477 () Bool)

(assert (=> b!466721 m!448477))

(declare-fun m!448479 () Bool)

(assert (=> b!466721 m!448479))

(assert (=> b!466721 m!448321))

(declare-fun m!448481 () Bool)

(assert (=> b!466721 m!448481))

(declare-fun m!448483 () Bool)

(assert (=> b!466721 m!448483))

(assert (=> b!466721 m!448477))

(assert (=> b!466721 m!448469))

(declare-fun m!448485 () Bool)

(assert (=> b!466721 m!448485))

(declare-fun m!448487 () Bool)

(assert (=> b!466721 m!448487))

(assert (=> b!466721 m!448461))

(assert (=> b!466719 m!448373))

(assert (=> b!466719 m!448373))

(assert (=> b!466719 m!448375))

(declare-fun m!448489 () Bool)

(assert (=> bm!30279 m!448489))

(assert (=> b!466727 m!448373))

(assert (=> b!466727 m!448373))

(declare-fun m!448491 () Bool)

(assert (=> b!466727 m!448491))

(declare-fun m!448493 () Bool)

(assert (=> b!466711 m!448493))

(declare-fun m!448495 () Bool)

(assert (=> bm!30278 m!448495))

(assert (=> b!466720 m!448373))

(assert (=> b!466720 m!448373))

(assert (=> b!466720 m!448375))

(assert (=> b!466710 m!448445))

(assert (=> b!466710 m!448445))

(assert (=> b!466710 m!448447))

(assert (=> b!466710 m!448449))

(assert (=> b!466710 m!448373))

(declare-fun m!448497 () Bool)

(assert (=> b!466710 m!448497))

(assert (=> b!466710 m!448373))

(assert (=> b!466710 m!448447))

(assert (=> b!466555 d!74973))

(declare-fun d!74975 () Bool)

(assert (=> d!74975 (= (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210922 () Unit!13570)

(declare-fun choose!1347 (array!29483 array!29481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18243 V!18243 V!18243 V!18243 (_ BitVec 32) Int) Unit!13570)

(assert (=> d!74975 (= lt!210922 (choose!1347 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!74975 (validMask!0 mask!1365)))

(assert (=> d!74975 (= (lemmaNoChangeToArrayThenSameMapNoExtras!75 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210922)))

(declare-fun bs!14748 () Bool)

(assert (= bs!14748 d!74975))

(assert (=> bs!14748 m!448323))

(assert (=> bs!14748 m!448321))

(declare-fun m!448499 () Bool)

(assert (=> bs!14748 m!448499))

(assert (=> bs!14748 m!448301))

(assert (=> b!466553 d!74975))

(declare-fun b!466755 () Bool)

(assert (=> b!466755 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(assert (=> b!466755 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14522 _values!833)))))

(declare-fun e!272968 () Bool)

(declare-fun lt!210938 () ListLongMap!7437)

(assert (=> b!466755 (= e!272968 (= (apply!323 lt!210938 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)) (get!6950 (select (arr!14169 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!272972 () Bool)

(declare-fun b!466756 () Bool)

(assert (=> b!466756 (= e!272972 (= lt!210938 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!466757 () Bool)

(declare-fun isEmpty!574 (ListLongMap!7437) Bool)

(assert (=> b!466757 (= e!272972 (isEmpty!574 lt!210938))))

(declare-fun b!466758 () Bool)

(declare-fun res!279020 () Bool)

(declare-fun e!272970 () Bool)

(assert (=> b!466758 (=> (not res!279020) (not e!272970))))

(assert (=> b!466758 (= res!279020 (not (contains!2519 lt!210938 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!466759 () Bool)

(declare-fun e!272967 () ListLongMap!7437)

(declare-fun e!272966 () ListLongMap!7437)

(assert (=> b!466759 (= e!272967 e!272966)))

(declare-fun c!56710 () Bool)

(assert (=> b!466759 (= c!56710 (validKeyInArray!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466760 () Bool)

(assert (=> b!466760 (= e!272967 (ListLongMap!7438 Nil!8613))))

(declare-fun b!466762 () Bool)

(declare-fun lt!210939 () Unit!13570)

(declare-fun lt!210937 () Unit!13570)

(assert (=> b!466762 (= lt!210939 lt!210937)))

(declare-fun lt!210943 () (_ BitVec 64))

(declare-fun lt!210940 () V!18243)

(declare-fun lt!210941 () (_ BitVec 64))

(declare-fun lt!210942 () ListLongMap!7437)

(assert (=> b!466762 (not (contains!2519 (+!1705 lt!210942 (tuple2!8535 lt!210941 lt!210940)) lt!210943))))

(declare-fun addStillNotContains!157 (ListLongMap!7437 (_ BitVec 64) V!18243 (_ BitVec 64)) Unit!13570)

(assert (=> b!466762 (= lt!210937 (addStillNotContains!157 lt!210942 lt!210941 lt!210940 lt!210943))))

(assert (=> b!466762 (= lt!210943 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!466762 (= lt!210940 (get!6950 (select (arr!14169 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!466762 (= lt!210941 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30288 () ListLongMap!7437)

(assert (=> b!466762 (= lt!210942 call!30288)))

(assert (=> b!466762 (= e!272966 (+!1705 call!30288 (tuple2!8535 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000) (get!6950 (select (arr!14169 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!466763 () Bool)

(declare-fun e!272969 () Bool)

(assert (=> b!466763 (= e!272969 (validKeyInArray!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466763 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!30285 () Bool)

(assert (=> bm!30285 (= call!30288 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!466764 () Bool)

(declare-fun e!272971 () Bool)

(assert (=> b!466764 (= e!272971 e!272972)))

(declare-fun c!56711 () Bool)

(assert (=> b!466764 (= c!56711 (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun b!466761 () Bool)

(assert (=> b!466761 (= e!272966 call!30288)))

(declare-fun d!74977 () Bool)

(assert (=> d!74977 e!272970))

(declare-fun res!279023 () Bool)

(assert (=> d!74977 (=> (not res!279023) (not e!272970))))

(assert (=> d!74977 (= res!279023 (not (contains!2519 lt!210938 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74977 (= lt!210938 e!272967)))

(declare-fun c!56713 () Bool)

(assert (=> d!74977 (= c!56713 (bvsge #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(assert (=> d!74977 (validMask!0 mask!1365)))

(assert (=> d!74977 (= (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210938)))

(declare-fun b!466765 () Bool)

(assert (=> b!466765 (= e!272971 e!272968)))

(assert (=> b!466765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun res!279022 () Bool)

(assert (=> b!466765 (= res!279022 (contains!2519 lt!210938 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466765 (=> (not res!279022) (not e!272968))))

(declare-fun b!466766 () Bool)

(assert (=> b!466766 (= e!272970 e!272971)))

(declare-fun c!56712 () Bool)

(assert (=> b!466766 (= c!56712 e!272969)))

(declare-fun res!279021 () Bool)

(assert (=> b!466766 (=> (not res!279021) (not e!272969))))

(assert (=> b!466766 (= res!279021 (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(assert (= (and d!74977 c!56713) b!466760))

(assert (= (and d!74977 (not c!56713)) b!466759))

(assert (= (and b!466759 c!56710) b!466762))

(assert (= (and b!466759 (not c!56710)) b!466761))

(assert (= (or b!466762 b!466761) bm!30285))

(assert (= (and d!74977 res!279023) b!466758))

(assert (= (and b!466758 res!279020) b!466766))

(assert (= (and b!466766 res!279021) b!466763))

(assert (= (and b!466766 c!56712) b!466765))

(assert (= (and b!466766 (not c!56712)) b!466764))

(assert (= (and b!466765 res!279022) b!466755))

(assert (= (and b!466764 c!56711) b!466756))

(assert (= (and b!466764 (not c!56711)) b!466757))

(declare-fun b_lambda!10015 () Bool)

(assert (=> (not b_lambda!10015) (not b!466755)))

(assert (=> b!466755 t!14562))

(declare-fun b_and!19777 () Bool)

(assert (= b_and!19775 (and (=> t!14562 result!7383) b_and!19777)))

(declare-fun b_lambda!10017 () Bool)

(assert (=> (not b_lambda!10017) (not b!466762)))

(assert (=> b!466762 t!14562))

(declare-fun b_and!19779 () Bool)

(assert (= b_and!19777 (and (=> t!14562 result!7383) b_and!19779)))

(declare-fun m!448501 () Bool)

(assert (=> b!466757 m!448501))

(declare-fun m!448503 () Bool)

(assert (=> d!74977 m!448503))

(assert (=> d!74977 m!448301))

(assert (=> b!466765 m!448373))

(assert (=> b!466765 m!448373))

(declare-fun m!448505 () Bool)

(assert (=> b!466765 m!448505))

(assert (=> b!466755 m!448445))

(assert (=> b!466755 m!448447))

(assert (=> b!466755 m!448449))

(assert (=> b!466755 m!448447))

(assert (=> b!466755 m!448373))

(assert (=> b!466755 m!448373))

(declare-fun m!448507 () Bool)

(assert (=> b!466755 m!448507))

(assert (=> b!466755 m!448445))

(declare-fun m!448509 () Bool)

(assert (=> bm!30285 m!448509))

(assert (=> b!466763 m!448373))

(assert (=> b!466763 m!448373))

(assert (=> b!466763 m!448375))

(declare-fun m!448511 () Bool)

(assert (=> b!466758 m!448511))

(assert (=> b!466756 m!448509))

(declare-fun m!448513 () Bool)

(assert (=> b!466762 m!448513))

(declare-fun m!448515 () Bool)

(assert (=> b!466762 m!448515))

(assert (=> b!466762 m!448445))

(assert (=> b!466762 m!448513))

(assert (=> b!466762 m!448445))

(assert (=> b!466762 m!448447))

(assert (=> b!466762 m!448449))

(assert (=> b!466762 m!448447))

(assert (=> b!466762 m!448373))

(declare-fun m!448517 () Bool)

(assert (=> b!466762 m!448517))

(declare-fun m!448519 () Bool)

(assert (=> b!466762 m!448519))

(assert (=> b!466759 m!448373))

(assert (=> b!466759 m!448373))

(assert (=> b!466759 m!448375))

(assert (=> b!466553 d!74977))

(declare-fun b!466767 () Bool)

(assert (=> b!466767 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(assert (=> b!466767 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14522 _values!833)))))

(declare-fun lt!210945 () ListLongMap!7437)

(declare-fun e!272975 () Bool)

(assert (=> b!466767 (= e!272975 (= (apply!323 lt!210945 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)) (get!6950 (select (arr!14169 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!272979 () Bool)

(declare-fun b!466768 () Bool)

(assert (=> b!466768 (= e!272979 (= lt!210945 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!466769 () Bool)

(assert (=> b!466769 (= e!272979 (isEmpty!574 lt!210945))))

(declare-fun b!466770 () Bool)

(declare-fun res!279024 () Bool)

(declare-fun e!272977 () Bool)

(assert (=> b!466770 (=> (not res!279024) (not e!272977))))

(assert (=> b!466770 (= res!279024 (not (contains!2519 lt!210945 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!466771 () Bool)

(declare-fun e!272974 () ListLongMap!7437)

(declare-fun e!272973 () ListLongMap!7437)

(assert (=> b!466771 (= e!272974 e!272973)))

(declare-fun c!56714 () Bool)

(assert (=> b!466771 (= c!56714 (validKeyInArray!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466772 () Bool)

(assert (=> b!466772 (= e!272974 (ListLongMap!7438 Nil!8613))))

(declare-fun b!466774 () Bool)

(declare-fun lt!210946 () Unit!13570)

(declare-fun lt!210944 () Unit!13570)

(assert (=> b!466774 (= lt!210946 lt!210944)))

(declare-fun lt!210949 () ListLongMap!7437)

(declare-fun lt!210947 () V!18243)

(declare-fun lt!210948 () (_ BitVec 64))

(declare-fun lt!210950 () (_ BitVec 64))

(assert (=> b!466774 (not (contains!2519 (+!1705 lt!210949 (tuple2!8535 lt!210948 lt!210947)) lt!210950))))

(assert (=> b!466774 (= lt!210944 (addStillNotContains!157 lt!210949 lt!210948 lt!210947 lt!210950))))

(assert (=> b!466774 (= lt!210950 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!466774 (= lt!210947 (get!6950 (select (arr!14169 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!466774 (= lt!210948 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30289 () ListLongMap!7437)

(assert (=> b!466774 (= lt!210949 call!30289)))

(assert (=> b!466774 (= e!272973 (+!1705 call!30289 (tuple2!8535 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000) (get!6950 (select (arr!14169 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!466775 () Bool)

(declare-fun e!272976 () Bool)

(assert (=> b!466775 (= e!272976 (validKeyInArray!0 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466775 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!30286 () Bool)

(assert (=> bm!30286 (= call!30289 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!466776 () Bool)

(declare-fun e!272978 () Bool)

(assert (=> b!466776 (= e!272978 e!272979)))

(declare-fun c!56715 () Bool)

(assert (=> b!466776 (= c!56715 (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun b!466773 () Bool)

(assert (=> b!466773 (= e!272973 call!30289)))

(declare-fun d!74979 () Bool)

(assert (=> d!74979 e!272977))

(declare-fun res!279027 () Bool)

(assert (=> d!74979 (=> (not res!279027) (not e!272977))))

(assert (=> d!74979 (= res!279027 (not (contains!2519 lt!210945 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74979 (= lt!210945 e!272974)))

(declare-fun c!56717 () Bool)

(assert (=> d!74979 (= c!56717 (bvsge #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(assert (=> d!74979 (validMask!0 mask!1365)))

(assert (=> d!74979 (= (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210945)))

(declare-fun b!466777 () Bool)

(assert (=> b!466777 (= e!272978 e!272975)))

(assert (=> b!466777 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(declare-fun res!279026 () Bool)

(assert (=> b!466777 (= res!279026 (contains!2519 lt!210945 (select (arr!14170 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466777 (=> (not res!279026) (not e!272975))))

(declare-fun b!466778 () Bool)

(assert (=> b!466778 (= e!272977 e!272978)))

(declare-fun c!56716 () Bool)

(assert (=> b!466778 (= c!56716 e!272976)))

(declare-fun res!279025 () Bool)

(assert (=> b!466778 (=> (not res!279025) (not e!272976))))

(assert (=> b!466778 (= res!279025 (bvslt #b00000000000000000000000000000000 (size!14523 _keys!1025)))))

(assert (= (and d!74979 c!56717) b!466772))

(assert (= (and d!74979 (not c!56717)) b!466771))

(assert (= (and b!466771 c!56714) b!466774))

(assert (= (and b!466771 (not c!56714)) b!466773))

(assert (= (or b!466774 b!466773) bm!30286))

(assert (= (and d!74979 res!279027) b!466770))

(assert (= (and b!466770 res!279024) b!466778))

(assert (= (and b!466778 res!279025) b!466775))

(assert (= (and b!466778 c!56716) b!466777))

(assert (= (and b!466778 (not c!56716)) b!466776))

(assert (= (and b!466777 res!279026) b!466767))

(assert (= (and b!466776 c!56715) b!466768))

(assert (= (and b!466776 (not c!56715)) b!466769))

(declare-fun b_lambda!10019 () Bool)

(assert (=> (not b_lambda!10019) (not b!466767)))

(assert (=> b!466767 t!14562))

(declare-fun b_and!19781 () Bool)

(assert (= b_and!19779 (and (=> t!14562 result!7383) b_and!19781)))

(declare-fun b_lambda!10021 () Bool)

(assert (=> (not b_lambda!10021) (not b!466774)))

(assert (=> b!466774 t!14562))

(declare-fun b_and!19783 () Bool)

(assert (= b_and!19781 (and (=> t!14562 result!7383) b_and!19783)))

(declare-fun m!448521 () Bool)

(assert (=> b!466769 m!448521))

(declare-fun m!448523 () Bool)

(assert (=> d!74979 m!448523))

(assert (=> d!74979 m!448301))

(assert (=> b!466777 m!448373))

(assert (=> b!466777 m!448373))

(declare-fun m!448525 () Bool)

(assert (=> b!466777 m!448525))

(assert (=> b!466767 m!448445))

(assert (=> b!466767 m!448447))

(assert (=> b!466767 m!448449))

(assert (=> b!466767 m!448447))

(assert (=> b!466767 m!448373))

(assert (=> b!466767 m!448373))

(declare-fun m!448527 () Bool)

(assert (=> b!466767 m!448527))

(assert (=> b!466767 m!448445))

(declare-fun m!448529 () Bool)

(assert (=> bm!30286 m!448529))

(assert (=> b!466775 m!448373))

(assert (=> b!466775 m!448373))

(assert (=> b!466775 m!448375))

(declare-fun m!448531 () Bool)

(assert (=> b!466770 m!448531))

(assert (=> b!466768 m!448529))

(declare-fun m!448533 () Bool)

(assert (=> b!466774 m!448533))

(declare-fun m!448535 () Bool)

(assert (=> b!466774 m!448535))

(assert (=> b!466774 m!448445))

(assert (=> b!466774 m!448533))

(assert (=> b!466774 m!448445))

(assert (=> b!466774 m!448447))

(assert (=> b!466774 m!448449))

(assert (=> b!466774 m!448447))

(assert (=> b!466774 m!448373))

(declare-fun m!448537 () Bool)

(assert (=> b!466774 m!448537))

(declare-fun m!448539 () Bool)

(assert (=> b!466774 m!448539))

(assert (=> b!466771 m!448373))

(assert (=> b!466771 m!448373))

(assert (=> b!466771 m!448375))

(assert (=> b!466553 d!74979))

(declare-fun condMapEmpty!20974 () Bool)

(declare-fun mapDefault!20974 () ValueCell!6083)

(assert (=> mapNonEmpty!20965 (= condMapEmpty!20974 (= mapRest!20965 ((as const (Array (_ BitVec 32) ValueCell!6083)) mapDefault!20974)))))

(declare-fun e!272984 () Bool)

(declare-fun mapRes!20974 () Bool)

(assert (=> mapNonEmpty!20965 (= tp!40282 (and e!272984 mapRes!20974))))

(declare-fun mapNonEmpty!20974 () Bool)

(declare-fun tp!40297 () Bool)

(declare-fun e!272985 () Bool)

(assert (=> mapNonEmpty!20974 (= mapRes!20974 (and tp!40297 e!272985))))

(declare-fun mapValue!20974 () ValueCell!6083)

(declare-fun mapKey!20974 () (_ BitVec 32))

(declare-fun mapRest!20974 () (Array (_ BitVec 32) ValueCell!6083))

(assert (=> mapNonEmpty!20974 (= mapRest!20965 (store mapRest!20974 mapKey!20974 mapValue!20974))))

(declare-fun b!466786 () Bool)

(assert (=> b!466786 (= e!272984 tp_is_empty!12853)))

(declare-fun b!466785 () Bool)

(assert (=> b!466785 (= e!272985 tp_is_empty!12853)))

(declare-fun mapIsEmpty!20974 () Bool)

(assert (=> mapIsEmpty!20974 mapRes!20974))

(assert (= (and mapNonEmpty!20965 condMapEmpty!20974) mapIsEmpty!20974))

(assert (= (and mapNonEmpty!20965 (not condMapEmpty!20974)) mapNonEmpty!20974))

(assert (= (and mapNonEmpty!20974 ((_ is ValueCellFull!6083) mapValue!20974)) b!466785))

(assert (= (and mapNonEmpty!20965 ((_ is ValueCellFull!6083) mapDefault!20974)) b!466786))

(declare-fun m!448541 () Bool)

(assert (=> mapNonEmpty!20974 m!448541))

(declare-fun b_lambda!10023 () Bool)

(assert (= b_lambda!10017 (or (and start!41790 b_free!11425) b_lambda!10023)))

(declare-fun b_lambda!10025 () Bool)

(assert (= b_lambda!10021 (or (and start!41790 b_free!11425) b_lambda!10025)))

(declare-fun b_lambda!10027 () Bool)

(assert (= b_lambda!10011 (or (and start!41790 b_free!11425) b_lambda!10027)))

(declare-fun b_lambda!10029 () Bool)

(assert (= b_lambda!10013 (or (and start!41790 b_free!11425) b_lambda!10029)))

(declare-fun b_lambda!10031 () Bool)

(assert (= b_lambda!10019 (or (and start!41790 b_free!11425) b_lambda!10031)))

(declare-fun b_lambda!10033 () Bool)

(assert (= b_lambda!10015 (or (and start!41790 b_free!11425) b_lambda!10033)))

(check-sat (not bm!30277) (not b_lambda!10033) (not b!466767) (not bm!30279) (not d!74969) (not b!466757) (not b!466622) (not bm!30251) (not d!74979) (not bm!30272) tp_is_empty!12853 (not d!74975) (not b_next!11425) (not b!466687) (not b!466769) (not b!466763) (not b!466643) (not b!466730) (not b!466755) (not b_lambda!10027) (not b!466637) (not bm!30271) (not b!466765) (not bm!30270) (not b!466770) (not b!466719) (not b!466711) (not b!466720) (not b!466692) (not b_lambda!10025) b_and!19783 (not b!466698) (not b!466696) (not b!466623) (not b_lambda!10031) (not d!74971) (not b_lambda!10029) (not b!466710) (not bm!30278) (not b!466624) (not bm!30280) (not b!466697) (not b!466775) (not b!466644) (not b!466768) (not b!466707) (not b!466721) (not b!466777) (not b!466756) (not b!466759) (not b!466715) (not d!74973) (not bm!30286) (not b!466762) (not b!466774) (not b!466636) (not b_lambda!10023) (not b!466727) (not bm!30273) (not b!466704) (not b!466688) (not b!466758) (not bm!30285) (not bm!30254) (not b!466771) (not d!74977) (not mapNonEmpty!20974))
(check-sat b_and!19783 (not b_next!11425))
