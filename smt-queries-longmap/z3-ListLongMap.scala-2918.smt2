; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41666 () Bool)

(assert start!41666)

(declare-fun b_free!11319 () Bool)

(declare-fun b_next!11319 () Bool)

(assert (=> start!41666 (= b_free!11319 (not b_next!11319))))

(declare-fun tp!39957 () Bool)

(declare-fun b_and!19667 () Bool)

(assert (=> start!41666 (= tp!39957 b_and!19667)))

(declare-fun b!465281 () Bool)

(declare-fun e!271897 () Bool)

(declare-fun tp_is_empty!12747 () Bool)

(assert (=> b!465281 (= e!271897 tp_is_empty!12747)))

(declare-fun b!465282 () Bool)

(declare-fun e!271894 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29277 0))(
  ( (array!29278 (arr!14069 (Array (_ BitVec 32) (_ BitVec 64))) (size!14421 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29277)

(assert (=> b!465282 (= e!271894 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14421 _keys!1025)))))))

(declare-datatypes ((V!18101 0))(
  ( (V!18102 (val!6418 Int)) )
))
(declare-datatypes ((tuple2!8408 0))(
  ( (tuple2!8409 (_1!4215 (_ BitVec 64)) (_2!4215 V!18101)) )
))
(declare-datatypes ((List!8502 0))(
  ( (Nil!8499) (Cons!8498 (h!9354 tuple2!8408) (t!14450 List!8502)) )
))
(declare-datatypes ((ListLongMap!7321 0))(
  ( (ListLongMap!7322 (toList!3676 List!8502)) )
))
(declare-fun lt!210080 () ListLongMap!7321)

(declare-fun lt!210081 () ListLongMap!7321)

(assert (=> b!465282 (= lt!210080 lt!210081)))

(declare-fun minValueBefore!38 () V!18101)

(declare-datatypes ((Unit!13520 0))(
  ( (Unit!13521) )
))
(declare-fun lt!210079 () Unit!13520)

(declare-fun zeroValue!794 () V!18101)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6030 0))(
  ( (ValueCellFull!6030 (v!8705 V!18101)) (EmptyCell!6030) )
))
(declare-datatypes ((array!29279 0))(
  ( (array!29280 (arr!14070 (Array (_ BitVec 32) ValueCell!6030)) (size!14422 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29279)

(declare-fun minValueAfter!38 () V!18101)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!36 (array!29277 array!29279 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18101 V!18101 V!18101 V!18101 (_ BitVec 32) Int) Unit!13520)

(assert (=> b!465282 (= lt!210079 (lemmaNoChangeToArrayThenSameMapNoExtras!36 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1856 (array!29277 array!29279 (_ BitVec 32) (_ BitVec 32) V!18101 V!18101 (_ BitVec 32) Int) ListLongMap!7321)

(assert (=> b!465282 (= lt!210081 (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465282 (= lt!210080 (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465283 () Bool)

(declare-fun res!278137 () Bool)

(assert (=> b!465283 (=> (not res!278137) (not e!271894))))

(declare-datatypes ((List!8503 0))(
  ( (Nil!8500) (Cons!8499 (h!9355 (_ BitVec 64)) (t!14451 List!8503)) )
))
(declare-fun arrayNoDuplicates!0 (array!29277 (_ BitVec 32) List!8503) Bool)

(assert (=> b!465283 (= res!278137 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8500))))

(declare-fun b!465284 () Bool)

(declare-fun e!271896 () Bool)

(declare-fun mapRes!20800 () Bool)

(assert (=> b!465284 (= e!271896 (and e!271897 mapRes!20800))))

(declare-fun condMapEmpty!20800 () Bool)

(declare-fun mapDefault!20800 () ValueCell!6030)

(assert (=> b!465284 (= condMapEmpty!20800 (= (arr!14070 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6030)) mapDefault!20800)))))

(declare-fun mapIsEmpty!20800 () Bool)

(assert (=> mapIsEmpty!20800 mapRes!20800))

(declare-fun res!278139 () Bool)

(assert (=> start!41666 (=> (not res!278139) (not e!271894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41666 (= res!278139 (validMask!0 mask!1365))))

(assert (=> start!41666 e!271894))

(assert (=> start!41666 tp_is_empty!12747))

(assert (=> start!41666 tp!39957))

(assert (=> start!41666 true))

(declare-fun array_inv!10166 (array!29277) Bool)

(assert (=> start!41666 (array_inv!10166 _keys!1025)))

(declare-fun array_inv!10167 (array!29279) Bool)

(assert (=> start!41666 (and (array_inv!10167 _values!833) e!271896)))

(declare-fun b!465285 () Bool)

(declare-fun res!278138 () Bool)

(assert (=> b!465285 (=> (not res!278138) (not e!271894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29277 (_ BitVec 32)) Bool)

(assert (=> b!465285 (= res!278138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20800 () Bool)

(declare-fun tp!39958 () Bool)

(declare-fun e!271895 () Bool)

(assert (=> mapNonEmpty!20800 (= mapRes!20800 (and tp!39958 e!271895))))

(declare-fun mapKey!20800 () (_ BitVec 32))

(declare-fun mapRest!20800 () (Array (_ BitVec 32) ValueCell!6030))

(declare-fun mapValue!20800 () ValueCell!6030)

(assert (=> mapNonEmpty!20800 (= (arr!14070 _values!833) (store mapRest!20800 mapKey!20800 mapValue!20800))))

(declare-fun b!465286 () Bool)

(declare-fun res!278136 () Bool)

(assert (=> b!465286 (=> (not res!278136) (not e!271894))))

(assert (=> b!465286 (= res!278136 (and (= (size!14422 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14421 _keys!1025) (size!14422 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465287 () Bool)

(assert (=> b!465287 (= e!271895 tp_is_empty!12747)))

(assert (= (and start!41666 res!278139) b!465286))

(assert (= (and b!465286 res!278136) b!465285))

(assert (= (and b!465285 res!278138) b!465283))

(assert (= (and b!465283 res!278137) b!465282))

(assert (= (and b!465284 condMapEmpty!20800) mapIsEmpty!20800))

(assert (= (and b!465284 (not condMapEmpty!20800)) mapNonEmpty!20800))

(get-info :version)

(assert (= (and mapNonEmpty!20800 ((_ is ValueCellFull!6030) mapValue!20800)) b!465287))

(assert (= (and b!465284 ((_ is ValueCellFull!6030) mapDefault!20800)) b!465281))

(assert (= start!41666 b!465284))

(declare-fun m!447539 () Bool)

(assert (=> start!41666 m!447539))

(declare-fun m!447541 () Bool)

(assert (=> start!41666 m!447541))

(declare-fun m!447543 () Bool)

(assert (=> start!41666 m!447543))

(declare-fun m!447545 () Bool)

(assert (=> b!465282 m!447545))

(declare-fun m!447547 () Bool)

(assert (=> b!465282 m!447547))

(declare-fun m!447549 () Bool)

(assert (=> b!465282 m!447549))

(declare-fun m!447551 () Bool)

(assert (=> b!465285 m!447551))

(declare-fun m!447553 () Bool)

(assert (=> b!465283 m!447553))

(declare-fun m!447555 () Bool)

(assert (=> mapNonEmpty!20800 m!447555))

(check-sat (not b!465283) tp_is_empty!12747 (not b!465282) (not mapNonEmpty!20800) (not start!41666) b_and!19667 (not b_next!11319) (not b!465285))
(check-sat b_and!19667 (not b_next!11319))
(get-model)

(declare-fun b!465317 () Bool)

(declare-fun e!271919 () Bool)

(declare-fun call!30231 () Bool)

(assert (=> b!465317 (= e!271919 call!30231)))

(declare-fun b!465318 () Bool)

(declare-fun e!271920 () Bool)

(assert (=> b!465318 (= e!271920 e!271919)))

(declare-fun c!56677 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!465318 (= c!56677 (validKeyInArray!0 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30228 () Bool)

(assert (=> bm!30228 (= call!30231 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!465319 () Bool)

(declare-fun e!271921 () Bool)

(assert (=> b!465319 (= e!271919 e!271921)))

(declare-fun lt!210099 () (_ BitVec 64))

(assert (=> b!465319 (= lt!210099 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210097 () Unit!13520)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29277 (_ BitVec 64) (_ BitVec 32)) Unit!13520)

(assert (=> b!465319 (= lt!210097 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!210099 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!465319 (arrayContainsKey!0 _keys!1025 lt!210099 #b00000000000000000000000000000000)))

(declare-fun lt!210098 () Unit!13520)

(assert (=> b!465319 (= lt!210098 lt!210097)))

(declare-fun res!278156 () Bool)

(declare-datatypes ((SeekEntryResult!3545 0))(
  ( (MissingZero!3545 (index!16359 (_ BitVec 32))) (Found!3545 (index!16360 (_ BitVec 32))) (Intermediate!3545 (undefined!4357 Bool) (index!16361 (_ BitVec 32)) (x!43500 (_ BitVec 32))) (Undefined!3545) (MissingVacant!3545 (index!16362 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29277 (_ BitVec 32)) SeekEntryResult!3545)

(assert (=> b!465319 (= res!278156 (= (seekEntryOrOpen!0 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3545 #b00000000000000000000000000000000)))))

(assert (=> b!465319 (=> (not res!278156) (not e!271921))))

(declare-fun d!75089 () Bool)

(declare-fun res!278157 () Bool)

(assert (=> d!75089 (=> res!278157 e!271920)))

(assert (=> d!75089 (= res!278157 (bvsge #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(assert (=> d!75089 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!271920)))

(declare-fun b!465320 () Bool)

(assert (=> b!465320 (= e!271921 call!30231)))

(assert (= (and d!75089 (not res!278157)) b!465318))

(assert (= (and b!465318 c!56677) b!465319))

(assert (= (and b!465318 (not c!56677)) b!465317))

(assert (= (and b!465319 res!278156) b!465320))

(assert (= (or b!465320 b!465317) bm!30228))

(declare-fun m!447575 () Bool)

(assert (=> b!465318 m!447575))

(assert (=> b!465318 m!447575))

(declare-fun m!447577 () Bool)

(assert (=> b!465318 m!447577))

(declare-fun m!447579 () Bool)

(assert (=> bm!30228 m!447579))

(assert (=> b!465319 m!447575))

(declare-fun m!447581 () Bool)

(assert (=> b!465319 m!447581))

(declare-fun m!447583 () Bool)

(assert (=> b!465319 m!447583))

(assert (=> b!465319 m!447575))

(declare-fun m!447585 () Bool)

(assert (=> b!465319 m!447585))

(assert (=> b!465285 d!75089))

(declare-fun d!75091 () Bool)

(assert (=> d!75091 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41666 d!75091))

(declare-fun d!75093 () Bool)

(assert (=> d!75093 (= (array_inv!10166 _keys!1025) (bvsge (size!14421 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41666 d!75093))

(declare-fun d!75095 () Bool)

(assert (=> d!75095 (= (array_inv!10167 _values!833) (bvsge (size!14422 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41666 d!75095))

(declare-fun b!465331 () Bool)

(declare-fun e!271931 () Bool)

(declare-fun contains!2522 (List!8503 (_ BitVec 64)) Bool)

(assert (=> b!465331 (= e!271931 (contains!2522 Nil!8500 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30231 () Bool)

(declare-fun call!30234 () Bool)

(declare-fun c!56680 () Bool)

(assert (=> bm!30231 (= call!30234 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56680 (Cons!8499 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000) Nil!8500) Nil!8500)))))

(declare-fun b!465332 () Bool)

(declare-fun e!271930 () Bool)

(declare-fun e!271933 () Bool)

(assert (=> b!465332 (= e!271930 e!271933)))

(declare-fun res!278164 () Bool)

(assert (=> b!465332 (=> (not res!278164) (not e!271933))))

(assert (=> b!465332 (= res!278164 (not e!271931))))

(declare-fun res!278165 () Bool)

(assert (=> b!465332 (=> (not res!278165) (not e!271931))))

(assert (=> b!465332 (= res!278165 (validKeyInArray!0 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465333 () Bool)

(declare-fun e!271932 () Bool)

(assert (=> b!465333 (= e!271932 call!30234)))

(declare-fun b!465334 () Bool)

(assert (=> b!465334 (= e!271933 e!271932)))

(assert (=> b!465334 (= c!56680 (validKeyInArray!0 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465335 () Bool)

(assert (=> b!465335 (= e!271932 call!30234)))

(declare-fun d!75097 () Bool)

(declare-fun res!278166 () Bool)

(assert (=> d!75097 (=> res!278166 e!271930)))

(assert (=> d!75097 (= res!278166 (bvsge #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(assert (=> d!75097 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8500) e!271930)))

(assert (= (and d!75097 (not res!278166)) b!465332))

(assert (= (and b!465332 res!278165) b!465331))

(assert (= (and b!465332 res!278164) b!465334))

(assert (= (and b!465334 c!56680) b!465335))

(assert (= (and b!465334 (not c!56680)) b!465333))

(assert (= (or b!465335 b!465333) bm!30231))

(assert (=> b!465331 m!447575))

(assert (=> b!465331 m!447575))

(declare-fun m!447587 () Bool)

(assert (=> b!465331 m!447587))

(assert (=> bm!30231 m!447575))

(declare-fun m!447589 () Bool)

(assert (=> bm!30231 m!447589))

(assert (=> b!465332 m!447575))

(assert (=> b!465332 m!447575))

(assert (=> b!465332 m!447577))

(assert (=> b!465334 m!447575))

(assert (=> b!465334 m!447575))

(assert (=> b!465334 m!447577))

(assert (=> b!465283 d!75097))

(declare-fun d!75099 () Bool)

(assert (=> d!75099 (= (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210102 () Unit!13520)

(declare-fun choose!1338 (array!29277 array!29279 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18101 V!18101 V!18101 V!18101 (_ BitVec 32) Int) Unit!13520)

(assert (=> d!75099 (= lt!210102 (choose!1338 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75099 (validMask!0 mask!1365)))

(assert (=> d!75099 (= (lemmaNoChangeToArrayThenSameMapNoExtras!36 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210102)))

(declare-fun bs!14722 () Bool)

(assert (= bs!14722 d!75099))

(assert (=> bs!14722 m!447549))

(assert (=> bs!14722 m!447547))

(declare-fun m!447591 () Bool)

(assert (=> bs!14722 m!447591))

(assert (=> bs!14722 m!447539))

(assert (=> b!465282 d!75099))

(declare-fun b!465360 () Bool)

(declare-fun e!271948 () Bool)

(declare-fun e!271952 () Bool)

(assert (=> b!465360 (= e!271948 e!271952)))

(assert (=> b!465360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(declare-fun res!278177 () Bool)

(declare-fun lt!210118 () ListLongMap!7321)

(declare-fun contains!2523 (ListLongMap!7321 (_ BitVec 64)) Bool)

(assert (=> b!465360 (= res!278177 (contains!2523 lt!210118 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465360 (=> (not res!278177) (not e!271952))))

(declare-fun b!465361 () Bool)

(declare-fun e!271949 () Bool)

(assert (=> b!465361 (= e!271949 (validKeyInArray!0 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465361 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!465362 () Bool)

(declare-fun e!271951 () ListLongMap!7321)

(declare-fun call!30237 () ListLongMap!7321)

(assert (=> b!465362 (= e!271951 call!30237)))

(declare-fun b!465363 () Bool)

(declare-fun e!271950 () Bool)

(declare-fun isEmpty!568 (ListLongMap!7321) Bool)

(assert (=> b!465363 (= e!271950 (isEmpty!568 lt!210118))))

(declare-fun bm!30234 () Bool)

(assert (=> bm!30234 (= call!30237 (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!465364 () Bool)

(declare-fun res!278176 () Bool)

(declare-fun e!271954 () Bool)

(assert (=> b!465364 (=> (not res!278176) (not e!271954))))

(assert (=> b!465364 (= res!278176 (not (contains!2523 lt!210118 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!465365 () Bool)

(assert (=> b!465365 (= e!271954 e!271948)))

(declare-fun c!56691 () Bool)

(assert (=> b!465365 (= c!56691 e!271949)))

(declare-fun res!278178 () Bool)

(assert (=> b!465365 (=> (not res!278178) (not e!271949))))

(assert (=> b!465365 (= res!278178 (bvslt #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(declare-fun d!75101 () Bool)

(assert (=> d!75101 e!271954))

(declare-fun res!278175 () Bool)

(assert (=> d!75101 (=> (not res!278175) (not e!271954))))

(assert (=> d!75101 (= res!278175 (not (contains!2523 lt!210118 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!271953 () ListLongMap!7321)

(assert (=> d!75101 (= lt!210118 e!271953)))

(declare-fun c!56692 () Bool)

(assert (=> d!75101 (= c!56692 (bvsge #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(assert (=> d!75101 (validMask!0 mask!1365)))

(assert (=> d!75101 (= (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210118)))

(declare-fun b!465366 () Bool)

(assert (=> b!465366 (= e!271953 (ListLongMap!7322 Nil!8499))))

(declare-fun b!465367 () Bool)

(assert (=> b!465367 (= e!271953 e!271951)))

(declare-fun c!56690 () Bool)

(assert (=> b!465367 (= c!56690 (validKeyInArray!0 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465368 () Bool)

(declare-fun lt!210123 () Unit!13520)

(declare-fun lt!210120 () Unit!13520)

(assert (=> b!465368 (= lt!210123 lt!210120)))

(declare-fun lt!210119 () (_ BitVec 64))

(declare-fun lt!210117 () (_ BitVec 64))

(declare-fun lt!210122 () V!18101)

(declare-fun lt!210121 () ListLongMap!7321)

(declare-fun +!1638 (ListLongMap!7321 tuple2!8408) ListLongMap!7321)

(assert (=> b!465368 (not (contains!2523 (+!1638 lt!210121 (tuple2!8409 lt!210117 lt!210122)) lt!210119))))

(declare-fun addStillNotContains!154 (ListLongMap!7321 (_ BitVec 64) V!18101 (_ BitVec 64)) Unit!13520)

(assert (=> b!465368 (= lt!210120 (addStillNotContains!154 lt!210121 lt!210117 lt!210122 lt!210119))))

(assert (=> b!465368 (= lt!210119 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6906 (ValueCell!6030 V!18101) V!18101)

(declare-fun dynLambda!914 (Int (_ BitVec 64)) V!18101)

(assert (=> b!465368 (= lt!210122 (get!6906 (select (arr!14070 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!465368 (= lt!210117 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!465368 (= lt!210121 call!30237)))

(assert (=> b!465368 (= e!271951 (+!1638 call!30237 (tuple2!8409 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000) (get!6906 (select (arr!14070 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!465369 () Bool)

(assert (=> b!465369 (= e!271948 e!271950)))

(declare-fun c!56689 () Bool)

(assert (=> b!465369 (= c!56689 (bvslt #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(declare-fun b!465370 () Bool)

(assert (=> b!465370 (= e!271950 (= lt!210118 (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!465371 () Bool)

(assert (=> b!465371 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(assert (=> b!465371 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14422 _values!833)))))

(declare-fun apply!321 (ListLongMap!7321 (_ BitVec 64)) V!18101)

(assert (=> b!465371 (= e!271952 (= (apply!321 lt!210118 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)) (get!6906 (select (arr!14070 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!75101 c!56692) b!465366))

(assert (= (and d!75101 (not c!56692)) b!465367))

(assert (= (and b!465367 c!56690) b!465368))

(assert (= (and b!465367 (not c!56690)) b!465362))

(assert (= (or b!465368 b!465362) bm!30234))

(assert (= (and d!75101 res!278175) b!465364))

(assert (= (and b!465364 res!278176) b!465365))

(assert (= (and b!465365 res!278178) b!465361))

(assert (= (and b!465365 c!56691) b!465360))

(assert (= (and b!465365 (not c!56691)) b!465369))

(assert (= (and b!465360 res!278177) b!465371))

(assert (= (and b!465369 c!56689) b!465370))

(assert (= (and b!465369 (not c!56689)) b!465363))

(declare-fun b_lambda!9989 () Bool)

(assert (=> (not b_lambda!9989) (not b!465368)))

(declare-fun t!14454 () Bool)

(declare-fun tb!3907 () Bool)

(assert (=> (and start!41666 (= defaultEntry!841 defaultEntry!841) t!14454) tb!3907))

(declare-fun result!7379 () Bool)

(assert (=> tb!3907 (= result!7379 tp_is_empty!12747)))

(assert (=> b!465368 t!14454))

(declare-fun b_and!19671 () Bool)

(assert (= b_and!19667 (and (=> t!14454 result!7379) b_and!19671)))

(declare-fun b_lambda!9991 () Bool)

(assert (=> (not b_lambda!9991) (not b!465371)))

(assert (=> b!465371 t!14454))

(declare-fun b_and!19673 () Bool)

(assert (= b_and!19671 (and (=> t!14454 result!7379) b_and!19673)))

(declare-fun m!447593 () Bool)

(assert (=> b!465364 m!447593))

(declare-fun m!447595 () Bool)

(assert (=> bm!30234 m!447595))

(assert (=> b!465367 m!447575))

(assert (=> b!465367 m!447575))

(assert (=> b!465367 m!447577))

(declare-fun m!447597 () Bool)

(assert (=> b!465368 m!447597))

(declare-fun m!447599 () Bool)

(assert (=> b!465368 m!447599))

(assert (=> b!465368 m!447597))

(declare-fun m!447601 () Bool)

(assert (=> b!465368 m!447601))

(declare-fun m!447603 () Bool)

(assert (=> b!465368 m!447603))

(assert (=> b!465368 m!447575))

(declare-fun m!447605 () Bool)

(assert (=> b!465368 m!447605))

(declare-fun m!447607 () Bool)

(assert (=> b!465368 m!447607))

(assert (=> b!465368 m!447599))

(assert (=> b!465368 m!447607))

(declare-fun m!447609 () Bool)

(assert (=> b!465368 m!447609))

(declare-fun m!447611 () Bool)

(assert (=> b!465363 m!447611))

(assert (=> b!465371 m!447599))

(assert (=> b!465371 m!447575))

(declare-fun m!447613 () Bool)

(assert (=> b!465371 m!447613))

(assert (=> b!465371 m!447575))

(assert (=> b!465371 m!447607))

(assert (=> b!465371 m!447599))

(assert (=> b!465371 m!447607))

(assert (=> b!465371 m!447609))

(declare-fun m!447615 () Bool)

(assert (=> d!75101 m!447615))

(assert (=> d!75101 m!447539))

(assert (=> b!465361 m!447575))

(assert (=> b!465361 m!447575))

(assert (=> b!465361 m!447577))

(assert (=> b!465370 m!447595))

(assert (=> b!465360 m!447575))

(assert (=> b!465360 m!447575))

(declare-fun m!447617 () Bool)

(assert (=> b!465360 m!447617))

(assert (=> b!465282 d!75101))

(declare-fun b!465374 () Bool)

(declare-fun e!271955 () Bool)

(declare-fun e!271959 () Bool)

(assert (=> b!465374 (= e!271955 e!271959)))

(assert (=> b!465374 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(declare-fun res!278181 () Bool)

(declare-fun lt!210125 () ListLongMap!7321)

(assert (=> b!465374 (= res!278181 (contains!2523 lt!210125 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465374 (=> (not res!278181) (not e!271959))))

(declare-fun b!465375 () Bool)

(declare-fun e!271956 () Bool)

(assert (=> b!465375 (= e!271956 (validKeyInArray!0 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465375 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!465376 () Bool)

(declare-fun e!271958 () ListLongMap!7321)

(declare-fun call!30238 () ListLongMap!7321)

(assert (=> b!465376 (= e!271958 call!30238)))

(declare-fun b!465377 () Bool)

(declare-fun e!271957 () Bool)

(assert (=> b!465377 (= e!271957 (isEmpty!568 lt!210125))))

(declare-fun bm!30235 () Bool)

(assert (=> bm!30235 (= call!30238 (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!465378 () Bool)

(declare-fun res!278180 () Bool)

(declare-fun e!271961 () Bool)

(assert (=> b!465378 (=> (not res!278180) (not e!271961))))

(assert (=> b!465378 (= res!278180 (not (contains!2523 lt!210125 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!465379 () Bool)

(assert (=> b!465379 (= e!271961 e!271955)))

(declare-fun c!56695 () Bool)

(assert (=> b!465379 (= c!56695 e!271956)))

(declare-fun res!278182 () Bool)

(assert (=> b!465379 (=> (not res!278182) (not e!271956))))

(assert (=> b!465379 (= res!278182 (bvslt #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(declare-fun d!75103 () Bool)

(assert (=> d!75103 e!271961))

(declare-fun res!278179 () Bool)

(assert (=> d!75103 (=> (not res!278179) (not e!271961))))

(assert (=> d!75103 (= res!278179 (not (contains!2523 lt!210125 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!271960 () ListLongMap!7321)

(assert (=> d!75103 (= lt!210125 e!271960)))

(declare-fun c!56696 () Bool)

(assert (=> d!75103 (= c!56696 (bvsge #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(assert (=> d!75103 (validMask!0 mask!1365)))

(assert (=> d!75103 (= (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210125)))

(declare-fun b!465380 () Bool)

(assert (=> b!465380 (= e!271960 (ListLongMap!7322 Nil!8499))))

(declare-fun b!465381 () Bool)

(assert (=> b!465381 (= e!271960 e!271958)))

(declare-fun c!56694 () Bool)

(assert (=> b!465381 (= c!56694 (validKeyInArray!0 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465382 () Bool)

(declare-fun lt!210130 () Unit!13520)

(declare-fun lt!210127 () Unit!13520)

(assert (=> b!465382 (= lt!210130 lt!210127)))

(declare-fun lt!210124 () (_ BitVec 64))

(declare-fun lt!210128 () ListLongMap!7321)

(declare-fun lt!210126 () (_ BitVec 64))

(declare-fun lt!210129 () V!18101)

(assert (=> b!465382 (not (contains!2523 (+!1638 lt!210128 (tuple2!8409 lt!210124 lt!210129)) lt!210126))))

(assert (=> b!465382 (= lt!210127 (addStillNotContains!154 lt!210128 lt!210124 lt!210129 lt!210126))))

(assert (=> b!465382 (= lt!210126 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!465382 (= lt!210129 (get!6906 (select (arr!14070 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!465382 (= lt!210124 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!465382 (= lt!210128 call!30238)))

(assert (=> b!465382 (= e!271958 (+!1638 call!30238 (tuple2!8409 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000) (get!6906 (select (arr!14070 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!465383 () Bool)

(assert (=> b!465383 (= e!271955 e!271957)))

(declare-fun c!56693 () Bool)

(assert (=> b!465383 (= c!56693 (bvslt #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(declare-fun b!465384 () Bool)

(assert (=> b!465384 (= e!271957 (= lt!210125 (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!465385 () Bool)

(assert (=> b!465385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14421 _keys!1025)))))

(assert (=> b!465385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14422 _values!833)))))

(assert (=> b!465385 (= e!271959 (= (apply!321 lt!210125 (select (arr!14069 _keys!1025) #b00000000000000000000000000000000)) (get!6906 (select (arr!14070 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!75103 c!56696) b!465380))

(assert (= (and d!75103 (not c!56696)) b!465381))

(assert (= (and b!465381 c!56694) b!465382))

(assert (= (and b!465381 (not c!56694)) b!465376))

(assert (= (or b!465382 b!465376) bm!30235))

(assert (= (and d!75103 res!278179) b!465378))

(assert (= (and b!465378 res!278180) b!465379))

(assert (= (and b!465379 res!278182) b!465375))

(assert (= (and b!465379 c!56695) b!465374))

(assert (= (and b!465379 (not c!56695)) b!465383))

(assert (= (and b!465374 res!278181) b!465385))

(assert (= (and b!465383 c!56693) b!465384))

(assert (= (and b!465383 (not c!56693)) b!465377))

(declare-fun b_lambda!9993 () Bool)

(assert (=> (not b_lambda!9993) (not b!465382)))

(assert (=> b!465382 t!14454))

(declare-fun b_and!19675 () Bool)

(assert (= b_and!19673 (and (=> t!14454 result!7379) b_and!19675)))

(declare-fun b_lambda!9995 () Bool)

(assert (=> (not b_lambda!9995) (not b!465385)))

(assert (=> b!465385 t!14454))

(declare-fun b_and!19677 () Bool)

(assert (= b_and!19675 (and (=> t!14454 result!7379) b_and!19677)))

(declare-fun m!447619 () Bool)

(assert (=> b!465378 m!447619))

(declare-fun m!447621 () Bool)

(assert (=> bm!30235 m!447621))

(assert (=> b!465381 m!447575))

(assert (=> b!465381 m!447575))

(assert (=> b!465381 m!447577))

(declare-fun m!447623 () Bool)

(assert (=> b!465382 m!447623))

(assert (=> b!465382 m!447599))

(assert (=> b!465382 m!447623))

(declare-fun m!447625 () Bool)

(assert (=> b!465382 m!447625))

(declare-fun m!447627 () Bool)

(assert (=> b!465382 m!447627))

(assert (=> b!465382 m!447575))

(declare-fun m!447629 () Bool)

(assert (=> b!465382 m!447629))

(assert (=> b!465382 m!447607))

(assert (=> b!465382 m!447599))

(assert (=> b!465382 m!447607))

(assert (=> b!465382 m!447609))

(declare-fun m!447631 () Bool)

(assert (=> b!465377 m!447631))

(assert (=> b!465385 m!447599))

(assert (=> b!465385 m!447575))

(declare-fun m!447633 () Bool)

(assert (=> b!465385 m!447633))

(assert (=> b!465385 m!447575))

(assert (=> b!465385 m!447607))

(assert (=> b!465385 m!447599))

(assert (=> b!465385 m!447607))

(assert (=> b!465385 m!447609))

(declare-fun m!447635 () Bool)

(assert (=> d!75103 m!447635))

(assert (=> d!75103 m!447539))

(assert (=> b!465375 m!447575))

(assert (=> b!465375 m!447575))

(assert (=> b!465375 m!447577))

(assert (=> b!465384 m!447621))

(assert (=> b!465374 m!447575))

(assert (=> b!465374 m!447575))

(declare-fun m!447637 () Bool)

(assert (=> b!465374 m!447637))

(assert (=> b!465282 d!75103))

(declare-fun condMapEmpty!20806 () Bool)

(declare-fun mapDefault!20806 () ValueCell!6030)

(assert (=> mapNonEmpty!20800 (= condMapEmpty!20806 (= mapRest!20800 ((as const (Array (_ BitVec 32) ValueCell!6030)) mapDefault!20806)))))

(declare-fun e!271967 () Bool)

(declare-fun mapRes!20806 () Bool)

(assert (=> mapNonEmpty!20800 (= tp!39958 (and e!271967 mapRes!20806))))

(declare-fun mapIsEmpty!20806 () Bool)

(assert (=> mapIsEmpty!20806 mapRes!20806))

(declare-fun b!465393 () Bool)

(assert (=> b!465393 (= e!271967 tp_is_empty!12747)))

(declare-fun b!465392 () Bool)

(declare-fun e!271966 () Bool)

(assert (=> b!465392 (= e!271966 tp_is_empty!12747)))

(declare-fun mapNonEmpty!20806 () Bool)

(declare-fun tp!39967 () Bool)

(assert (=> mapNonEmpty!20806 (= mapRes!20806 (and tp!39967 e!271966))))

(declare-fun mapValue!20806 () ValueCell!6030)

(declare-fun mapRest!20806 () (Array (_ BitVec 32) ValueCell!6030))

(declare-fun mapKey!20806 () (_ BitVec 32))

(assert (=> mapNonEmpty!20806 (= mapRest!20800 (store mapRest!20806 mapKey!20806 mapValue!20806))))

(assert (= (and mapNonEmpty!20800 condMapEmpty!20806) mapIsEmpty!20806))

(assert (= (and mapNonEmpty!20800 (not condMapEmpty!20806)) mapNonEmpty!20806))

(assert (= (and mapNonEmpty!20806 ((_ is ValueCellFull!6030) mapValue!20806)) b!465392))

(assert (= (and mapNonEmpty!20800 ((_ is ValueCellFull!6030) mapDefault!20806)) b!465393))

(declare-fun m!447639 () Bool)

(assert (=> mapNonEmpty!20806 m!447639))

(declare-fun b_lambda!9997 () Bool)

(assert (= b_lambda!9993 (or (and start!41666 b_free!11319) b_lambda!9997)))

(declare-fun b_lambda!9999 () Bool)

(assert (= b_lambda!9991 (or (and start!41666 b_free!11319) b_lambda!9999)))

(declare-fun b_lambda!10001 () Bool)

(assert (= b_lambda!9995 (or (and start!41666 b_free!11319) b_lambda!10001)))

(declare-fun b_lambda!10003 () Bool)

(assert (= b_lambda!9989 (or (and start!41666 b_free!11319) b_lambda!10003)))

(check-sat (not bm!30228) (not b!465370) (not b!465319) (not b!465318) (not b!465371) (not d!75101) (not b!465384) b_and!19677 (not b!465334) (not b_lambda!10001) (not b!465360) (not b!465378) (not b_lambda!10003) (not b!465331) (not d!75099) (not b!465375) (not b!465332) (not mapNonEmpty!20806) (not b!465364) (not d!75103) tp_is_empty!12747 (not b!465368) (not b!465361) (not b_lambda!9999) (not b_lambda!9997) (not b!465382) (not b!465385) (not b!465381) (not b_next!11319) (not bm!30231) (not b!465367) (not bm!30235) (not b!465377) (not bm!30234) (not b!465374) (not b!465363))
(check-sat b_and!19677 (not b_next!11319))
