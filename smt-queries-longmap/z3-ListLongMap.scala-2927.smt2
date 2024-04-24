; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41718 () Bool)

(assert start!41718)

(declare-fun b_free!11371 () Bool)

(declare-fun b_next!11371 () Bool)

(assert (=> start!41718 (= b_free!11371 (not b_next!11371))))

(declare-fun tp!40117 () Bool)

(declare-fun b_and!19737 () Bool)

(assert (=> start!41718 (= tp!40117 b_and!19737)))

(declare-fun b!465927 () Bool)

(declare-fun res!278550 () Bool)

(declare-fun e!272378 () Bool)

(assert (=> b!465927 (=> res!278550 e!272378)))

(declare-datatypes ((V!18171 0))(
  ( (V!18172 (val!6444 Int)) )
))
(declare-fun minValueBefore!38 () V!18171)

(declare-fun zeroValue!794 () V!18171)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29380 0))(
  ( (array!29381 (arr!14119 (Array (_ BitVec 32) (_ BitVec 64))) (size!14471 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29380)

(declare-datatypes ((ValueCell!6056 0))(
  ( (ValueCellFull!6056 (v!8732 V!18171)) (EmptyCell!6056) )
))
(declare-datatypes ((array!29382 0))(
  ( (array!29383 (arr!14120 (Array (_ BitVec 32) ValueCell!6056)) (size!14472 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29382)

(declare-fun minValueAfter!38 () V!18171)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8386 0))(
  ( (tuple2!8387 (_1!4204 (_ BitVec 64)) (_2!4204 V!18171)) )
))
(declare-datatypes ((List!8470 0))(
  ( (Nil!8467) (Cons!8466 (h!9322 tuple2!8386) (t!14412 List!8470)) )
))
(declare-datatypes ((ListLongMap!7301 0))(
  ( (ListLongMap!7302 (toList!3666 List!8470)) )
))
(declare-fun +!1664 (ListLongMap!7301 tuple2!8386) ListLongMap!7301)

(declare-fun getCurrentListMap!2115 (array!29380 array!29382 (_ BitVec 32) (_ BitVec 32) V!18171 V!18171 (_ BitVec 32) Int) ListLongMap!7301)

(assert (=> b!465927 (= res!278550 (not (= (+!1664 (getCurrentListMap!2115 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2115 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))))

(declare-fun b!465928 () Bool)

(declare-fun e!272373 () Bool)

(assert (=> b!465928 (= e!272373 (not e!272378))))

(declare-fun res!278551 () Bool)

(assert (=> b!465928 (=> res!278551 e!272378)))

(assert (=> b!465928 (= res!278551 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210511 () ListLongMap!7301)

(declare-fun lt!210510 () ListLongMap!7301)

(assert (=> b!465928 (= lt!210511 lt!210510)))

(declare-datatypes ((Unit!13546 0))(
  ( (Unit!13547) )
))
(declare-fun lt!210509 () Unit!13546)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!51 (array!29380 array!29382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18171 V!18171 V!18171 V!18171 (_ BitVec 32) Int) Unit!13546)

(assert (=> b!465928 (= lt!210509 (lemmaNoChangeToArrayThenSameMapNoExtras!51 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1891 (array!29380 array!29382 (_ BitVec 32) (_ BitVec 32) V!18171 V!18171 (_ BitVec 32) Int) ListLongMap!7301)

(assert (=> b!465928 (= lt!210510 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465928 (= lt!210511 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465929 () Bool)

(assert (=> b!465929 (= e!272378 (bvsle #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun mapNonEmpty!20881 () Bool)

(declare-fun mapRes!20881 () Bool)

(declare-fun tp!40116 () Bool)

(declare-fun e!272376 () Bool)

(assert (=> mapNonEmpty!20881 (= mapRes!20881 (and tp!40116 e!272376))))

(declare-fun mapRest!20881 () (Array (_ BitVec 32) ValueCell!6056))

(declare-fun mapValue!20881 () ValueCell!6056)

(declare-fun mapKey!20881 () (_ BitVec 32))

(assert (=> mapNonEmpty!20881 (= (arr!14120 _values!833) (store mapRest!20881 mapKey!20881 mapValue!20881))))

(declare-fun mapIsEmpty!20881 () Bool)

(assert (=> mapIsEmpty!20881 mapRes!20881))

(declare-fun b!465930 () Bool)

(declare-fun tp_is_empty!12799 () Bool)

(assert (=> b!465930 (= e!272376 tp_is_empty!12799)))

(declare-fun b!465931 () Bool)

(declare-fun e!272374 () Bool)

(assert (=> b!465931 (= e!272374 tp_is_empty!12799)))

(declare-fun b!465932 () Bool)

(declare-fun e!272375 () Bool)

(assert (=> b!465932 (= e!272375 (and e!272374 mapRes!20881))))

(declare-fun condMapEmpty!20881 () Bool)

(declare-fun mapDefault!20881 () ValueCell!6056)

(assert (=> b!465932 (= condMapEmpty!20881 (= (arr!14120 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6056)) mapDefault!20881)))))

(declare-fun b!465933 () Bool)

(declare-fun res!278553 () Bool)

(assert (=> b!465933 (=> (not res!278553) (not e!272373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29380 (_ BitVec 32)) Bool)

(assert (=> b!465933 (= res!278553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!278548 () Bool)

(assert (=> start!41718 (=> (not res!278548) (not e!272373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41718 (= res!278548 (validMask!0 mask!1365))))

(assert (=> start!41718 e!272373))

(assert (=> start!41718 tp_is_empty!12799))

(assert (=> start!41718 tp!40117))

(assert (=> start!41718 true))

(declare-fun array_inv!10280 (array!29380) Bool)

(assert (=> start!41718 (array_inv!10280 _keys!1025)))

(declare-fun array_inv!10281 (array!29382) Bool)

(assert (=> start!41718 (and (array_inv!10281 _values!833) e!272375)))

(declare-fun b!465934 () Bool)

(declare-fun res!278552 () Bool)

(assert (=> b!465934 (=> (not res!278552) (not e!272373))))

(assert (=> b!465934 (= res!278552 (and (= (size!14472 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14471 _keys!1025) (size!14472 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465935 () Bool)

(declare-fun res!278549 () Bool)

(assert (=> b!465935 (=> (not res!278549) (not e!272373))))

(declare-datatypes ((List!8471 0))(
  ( (Nil!8468) (Cons!8467 (h!9323 (_ BitVec 64)) (t!14413 List!8471)) )
))
(declare-fun arrayNoDuplicates!0 (array!29380 (_ BitVec 32) List!8471) Bool)

(assert (=> b!465935 (= res!278549 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8468))))

(assert (= (and start!41718 res!278548) b!465934))

(assert (= (and b!465934 res!278552) b!465933))

(assert (= (and b!465933 res!278553) b!465935))

(assert (= (and b!465935 res!278549) b!465928))

(assert (= (and b!465928 (not res!278551)) b!465927))

(assert (= (and b!465927 (not res!278550)) b!465929))

(assert (= (and b!465932 condMapEmpty!20881) mapIsEmpty!20881))

(assert (= (and b!465932 (not condMapEmpty!20881)) mapNonEmpty!20881))

(get-info :version)

(assert (= (and mapNonEmpty!20881 ((_ is ValueCellFull!6056) mapValue!20881)) b!465930))

(assert (= (and b!465932 ((_ is ValueCellFull!6056) mapDefault!20881)) b!465931))

(assert (= start!41718 b!465932))

(declare-fun m!448399 () Bool)

(assert (=> b!465933 m!448399))

(declare-fun m!448401 () Bool)

(assert (=> b!465935 m!448401))

(declare-fun m!448403 () Bool)

(assert (=> start!41718 m!448403))

(declare-fun m!448405 () Bool)

(assert (=> start!41718 m!448405))

(declare-fun m!448407 () Bool)

(assert (=> start!41718 m!448407))

(declare-fun m!448409 () Bool)

(assert (=> b!465928 m!448409))

(declare-fun m!448411 () Bool)

(assert (=> b!465928 m!448411))

(declare-fun m!448413 () Bool)

(assert (=> b!465928 m!448413))

(declare-fun m!448415 () Bool)

(assert (=> mapNonEmpty!20881 m!448415))

(declare-fun m!448417 () Bool)

(assert (=> b!465927 m!448417))

(assert (=> b!465927 m!448417))

(declare-fun m!448419 () Bool)

(assert (=> b!465927 m!448419))

(declare-fun m!448421 () Bool)

(assert (=> b!465927 m!448421))

(check-sat b_and!19737 (not b!465935) (not mapNonEmpty!20881) (not b!465928) tp_is_empty!12799 (not start!41718) (not b_next!11371) (not b!465933) (not b!465927))
(check-sat b_and!19737 (not b_next!11371))
(get-model)

(declare-fun b!466000 () Bool)

(declare-fun e!272423 () Bool)

(declare-fun contains!2505 (List!8471 (_ BitVec 64)) Bool)

(assert (=> b!466000 (= e!272423 (contains!2505 Nil!8468 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466001 () Bool)

(declare-fun e!272425 () Bool)

(declare-fun call!30227 () Bool)

(assert (=> b!466001 (= e!272425 call!30227)))

(declare-fun b!466002 () Bool)

(declare-fun e!272426 () Bool)

(assert (=> b!466002 (= e!272426 e!272425)))

(declare-fun c!56672 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!466002 (= c!56672 (validKeyInArray!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466003 () Bool)

(assert (=> b!466003 (= e!272425 call!30227)))

(declare-fun b!466004 () Bool)

(declare-fun e!272424 () Bool)

(assert (=> b!466004 (= e!272424 e!272426)))

(declare-fun res!278598 () Bool)

(assert (=> b!466004 (=> (not res!278598) (not e!272426))))

(assert (=> b!466004 (= res!278598 (not e!272423))))

(declare-fun res!278597 () Bool)

(assert (=> b!466004 (=> (not res!278597) (not e!272423))))

(assert (=> b!466004 (= res!278597 (validKeyInArray!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75151 () Bool)

(declare-fun res!278596 () Bool)

(assert (=> d!75151 (=> res!278596 e!272424)))

(assert (=> d!75151 (= res!278596 (bvsge #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(assert (=> d!75151 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8468) e!272424)))

(declare-fun bm!30224 () Bool)

(assert (=> bm!30224 (= call!30227 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56672 (Cons!8467 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000) Nil!8468) Nil!8468)))))

(assert (= (and d!75151 (not res!278596)) b!466004))

(assert (= (and b!466004 res!278597) b!466000))

(assert (= (and b!466004 res!278598) b!466002))

(assert (= (and b!466002 c!56672) b!466001))

(assert (= (and b!466002 (not c!56672)) b!466003))

(assert (= (or b!466001 b!466003) bm!30224))

(declare-fun m!448471 () Bool)

(assert (=> b!466000 m!448471))

(assert (=> b!466000 m!448471))

(declare-fun m!448473 () Bool)

(assert (=> b!466000 m!448473))

(assert (=> b!466002 m!448471))

(assert (=> b!466002 m!448471))

(declare-fun m!448475 () Bool)

(assert (=> b!466002 m!448475))

(assert (=> b!466004 m!448471))

(assert (=> b!466004 m!448471))

(assert (=> b!466004 m!448475))

(assert (=> bm!30224 m!448471))

(declare-fun m!448477 () Bool)

(assert (=> bm!30224 m!448477))

(assert (=> b!465935 d!75151))

(declare-fun d!75153 () Bool)

(assert (=> d!75153 (= (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210532 () Unit!13546)

(declare-fun choose!1346 (array!29380 array!29382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18171 V!18171 V!18171 V!18171 (_ BitVec 32) Int) Unit!13546)

(assert (=> d!75153 (= lt!210532 (choose!1346 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75153 (validMask!0 mask!1365)))

(assert (=> d!75153 (= (lemmaNoChangeToArrayThenSameMapNoExtras!51 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210532)))

(declare-fun bs!14766 () Bool)

(assert (= bs!14766 d!75153))

(assert (=> bs!14766 m!448413))

(assert (=> bs!14766 m!448411))

(declare-fun m!448479 () Bool)

(assert (=> bs!14766 m!448479))

(assert (=> bs!14766 m!448403))

(assert (=> b!465928 d!75153))

(declare-fun b!466029 () Bool)

(assert (=> b!466029 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(assert (=> b!466029 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14472 _values!833)))))

(declare-fun lt!210550 () ListLongMap!7301)

(declare-fun e!272444 () Bool)

(declare-fun apply!322 (ListLongMap!7301 (_ BitVec 64)) V!18171)

(declare-fun get!6928 (ValueCell!6056 V!18171) V!18171)

(declare-fun dynLambda!912 (Int (_ BitVec 64)) V!18171)

(assert (=> b!466029 (= e!272444 (= (apply!322 lt!210550 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)) (get!6928 (select (arr!14120 _values!833) #b00000000000000000000000000000000) (dynLambda!912 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!466030 () Bool)

(declare-fun e!272446 () Bool)

(assert (=> b!466030 (= e!272446 e!272444)))

(assert (=> b!466030 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun res!278610 () Bool)

(declare-fun contains!2506 (ListLongMap!7301 (_ BitVec 64)) Bool)

(assert (=> b!466030 (= res!278610 (contains!2506 lt!210550 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466030 (=> (not res!278610) (not e!272444))))

(declare-fun b!466031 () Bool)

(declare-fun e!272443 () Bool)

(declare-fun isEmpty!575 (ListLongMap!7301) Bool)

(assert (=> b!466031 (= e!272443 (isEmpty!575 lt!210550))))

(declare-fun b!466032 () Bool)

(declare-fun e!272445 () ListLongMap!7301)

(assert (=> b!466032 (= e!272445 (ListLongMap!7302 Nil!8467))))

(declare-fun b!466033 () Bool)

(declare-fun lt!210549 () Unit!13546)

(declare-fun lt!210552 () Unit!13546)

(assert (=> b!466033 (= lt!210549 lt!210552)))

(declare-fun lt!210551 () V!18171)

(declare-fun lt!210547 () (_ BitVec 64))

(declare-fun lt!210548 () ListLongMap!7301)

(declare-fun lt!210553 () (_ BitVec 64))

(assert (=> b!466033 (not (contains!2506 (+!1664 lt!210548 (tuple2!8387 lt!210553 lt!210551)) lt!210547))))

(declare-fun addStillNotContains!157 (ListLongMap!7301 (_ BitVec 64) V!18171 (_ BitVec 64)) Unit!13546)

(assert (=> b!466033 (= lt!210552 (addStillNotContains!157 lt!210548 lt!210553 lt!210551 lt!210547))))

(assert (=> b!466033 (= lt!210547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!466033 (= lt!210551 (get!6928 (select (arr!14120 _values!833) #b00000000000000000000000000000000) (dynLambda!912 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!466033 (= lt!210553 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30230 () ListLongMap!7301)

(assert (=> b!466033 (= lt!210548 call!30230)))

(declare-fun e!272447 () ListLongMap!7301)

(assert (=> b!466033 (= e!272447 (+!1664 call!30230 (tuple2!8387 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000) (get!6928 (select (arr!14120 _values!833) #b00000000000000000000000000000000) (dynLambda!912 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!466034 () Bool)

(assert (=> b!466034 (= e!272445 e!272447)))

(declare-fun c!56683 () Bool)

(assert (=> b!466034 (= c!56683 (validKeyInArray!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466035 () Bool)

(assert (=> b!466035 (= e!272443 (= lt!210550 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!466036 () Bool)

(declare-fun e!272442 () Bool)

(assert (=> b!466036 (= e!272442 (validKeyInArray!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466036 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!466037 () Bool)

(assert (=> b!466037 (= e!272447 call!30230)))

(declare-fun bm!30227 () Bool)

(assert (=> bm!30227 (= call!30230 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!466038 () Bool)

(assert (=> b!466038 (= e!272446 e!272443)))

(declare-fun c!56684 () Bool)

(assert (=> b!466038 (= c!56684 (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun b!466039 () Bool)

(declare-fun e!272441 () Bool)

(assert (=> b!466039 (= e!272441 e!272446)))

(declare-fun c!56681 () Bool)

(assert (=> b!466039 (= c!56681 e!272442)))

(declare-fun res!278609 () Bool)

(assert (=> b!466039 (=> (not res!278609) (not e!272442))))

(assert (=> b!466039 (= res!278609 (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun d!75155 () Bool)

(assert (=> d!75155 e!272441))

(declare-fun res!278607 () Bool)

(assert (=> d!75155 (=> (not res!278607) (not e!272441))))

(assert (=> d!75155 (= res!278607 (not (contains!2506 lt!210550 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75155 (= lt!210550 e!272445)))

(declare-fun c!56682 () Bool)

(assert (=> d!75155 (= c!56682 (bvsge #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(assert (=> d!75155 (validMask!0 mask!1365)))

(assert (=> d!75155 (= (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210550)))

(declare-fun b!466040 () Bool)

(declare-fun res!278608 () Bool)

(assert (=> b!466040 (=> (not res!278608) (not e!272441))))

(assert (=> b!466040 (= res!278608 (not (contains!2506 lt!210550 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!75155 c!56682) b!466032))

(assert (= (and d!75155 (not c!56682)) b!466034))

(assert (= (and b!466034 c!56683) b!466033))

(assert (= (and b!466034 (not c!56683)) b!466037))

(assert (= (or b!466033 b!466037) bm!30227))

(assert (= (and d!75155 res!278607) b!466040))

(assert (= (and b!466040 res!278608) b!466039))

(assert (= (and b!466039 res!278609) b!466036))

(assert (= (and b!466039 c!56681) b!466030))

(assert (= (and b!466039 (not c!56681)) b!466038))

(assert (= (and b!466030 res!278610) b!466029))

(assert (= (and b!466038 c!56684) b!466035))

(assert (= (and b!466038 (not c!56684)) b!466031))

(declare-fun b_lambda!10019 () Bool)

(assert (=> (not b_lambda!10019) (not b!466029)))

(declare-fun t!14418 () Bool)

(declare-fun tb!3901 () Bool)

(assert (=> (and start!41718 (= defaultEntry!841 defaultEntry!841) t!14418) tb!3901))

(declare-fun result!7377 () Bool)

(assert (=> tb!3901 (= result!7377 tp_is_empty!12799)))

(assert (=> b!466029 t!14418))

(declare-fun b_and!19743 () Bool)

(assert (= b_and!19737 (and (=> t!14418 result!7377) b_and!19743)))

(declare-fun b_lambda!10021 () Bool)

(assert (=> (not b_lambda!10021) (not b!466033)))

(assert (=> b!466033 t!14418))

(declare-fun b_and!19745 () Bool)

(assert (= b_and!19743 (and (=> t!14418 result!7377) b_and!19745)))

(assert (=> b!466030 m!448471))

(assert (=> b!466030 m!448471))

(declare-fun m!448481 () Bool)

(assert (=> b!466030 m!448481))

(declare-fun m!448483 () Bool)

(assert (=> bm!30227 m!448483))

(assert (=> b!466035 m!448483))

(declare-fun m!448485 () Bool)

(assert (=> d!75155 m!448485))

(assert (=> d!75155 m!448403))

(declare-fun m!448487 () Bool)

(assert (=> b!466029 m!448487))

(declare-fun m!448489 () Bool)

(assert (=> b!466029 m!448489))

(assert (=> b!466029 m!448487))

(assert (=> b!466029 m!448489))

(declare-fun m!448491 () Bool)

(assert (=> b!466029 m!448491))

(assert (=> b!466029 m!448471))

(assert (=> b!466029 m!448471))

(declare-fun m!448493 () Bool)

(assert (=> b!466029 m!448493))

(declare-fun m!448495 () Bool)

(assert (=> b!466040 m!448495))

(declare-fun m!448497 () Bool)

(assert (=> b!466033 m!448497))

(assert (=> b!466033 m!448487))

(declare-fun m!448499 () Bool)

(assert (=> b!466033 m!448499))

(declare-fun m!448501 () Bool)

(assert (=> b!466033 m!448501))

(assert (=> b!466033 m!448471))

(assert (=> b!466033 m!448487))

(assert (=> b!466033 m!448489))

(assert (=> b!466033 m!448491))

(assert (=> b!466033 m!448499))

(declare-fun m!448503 () Bool)

(assert (=> b!466033 m!448503))

(assert (=> b!466033 m!448489))

(declare-fun m!448505 () Bool)

(assert (=> b!466031 m!448505))

(assert (=> b!466036 m!448471))

(assert (=> b!466036 m!448471))

(assert (=> b!466036 m!448475))

(assert (=> b!466034 m!448471))

(assert (=> b!466034 m!448471))

(assert (=> b!466034 m!448475))

(assert (=> b!465928 d!75155))

(declare-fun b!466043 () Bool)

(assert (=> b!466043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(assert (=> b!466043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14472 _values!833)))))

(declare-fun lt!210557 () ListLongMap!7301)

(declare-fun e!272451 () Bool)

(assert (=> b!466043 (= e!272451 (= (apply!322 lt!210557 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)) (get!6928 (select (arr!14120 _values!833) #b00000000000000000000000000000000) (dynLambda!912 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!466044 () Bool)

(declare-fun e!272453 () Bool)

(assert (=> b!466044 (= e!272453 e!272451)))

(assert (=> b!466044 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun res!278614 () Bool)

(assert (=> b!466044 (= res!278614 (contains!2506 lt!210557 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466044 (=> (not res!278614) (not e!272451))))

(declare-fun b!466045 () Bool)

(declare-fun e!272450 () Bool)

(assert (=> b!466045 (= e!272450 (isEmpty!575 lt!210557))))

(declare-fun b!466046 () Bool)

(declare-fun e!272452 () ListLongMap!7301)

(assert (=> b!466046 (= e!272452 (ListLongMap!7302 Nil!8467))))

(declare-fun b!466047 () Bool)

(declare-fun lt!210556 () Unit!13546)

(declare-fun lt!210559 () Unit!13546)

(assert (=> b!466047 (= lt!210556 lt!210559)))

(declare-fun lt!210555 () ListLongMap!7301)

(declare-fun lt!210560 () (_ BitVec 64))

(declare-fun lt!210554 () (_ BitVec 64))

(declare-fun lt!210558 () V!18171)

(assert (=> b!466047 (not (contains!2506 (+!1664 lt!210555 (tuple2!8387 lt!210560 lt!210558)) lt!210554))))

(assert (=> b!466047 (= lt!210559 (addStillNotContains!157 lt!210555 lt!210560 lt!210558 lt!210554))))

(assert (=> b!466047 (= lt!210554 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!466047 (= lt!210558 (get!6928 (select (arr!14120 _values!833) #b00000000000000000000000000000000) (dynLambda!912 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!466047 (= lt!210560 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30231 () ListLongMap!7301)

(assert (=> b!466047 (= lt!210555 call!30231)))

(declare-fun e!272454 () ListLongMap!7301)

(assert (=> b!466047 (= e!272454 (+!1664 call!30231 (tuple2!8387 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000) (get!6928 (select (arr!14120 _values!833) #b00000000000000000000000000000000) (dynLambda!912 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!466048 () Bool)

(assert (=> b!466048 (= e!272452 e!272454)))

(declare-fun c!56687 () Bool)

(assert (=> b!466048 (= c!56687 (validKeyInArray!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466049 () Bool)

(assert (=> b!466049 (= e!272450 (= lt!210557 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!466050 () Bool)

(declare-fun e!272449 () Bool)

(assert (=> b!466050 (= e!272449 (validKeyInArray!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466050 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!466051 () Bool)

(assert (=> b!466051 (= e!272454 call!30231)))

(declare-fun bm!30228 () Bool)

(assert (=> bm!30228 (= call!30231 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!466052 () Bool)

(assert (=> b!466052 (= e!272453 e!272450)))

(declare-fun c!56688 () Bool)

(assert (=> b!466052 (= c!56688 (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun b!466053 () Bool)

(declare-fun e!272448 () Bool)

(assert (=> b!466053 (= e!272448 e!272453)))

(declare-fun c!56685 () Bool)

(assert (=> b!466053 (= c!56685 e!272449)))

(declare-fun res!278613 () Bool)

(assert (=> b!466053 (=> (not res!278613) (not e!272449))))

(assert (=> b!466053 (= res!278613 (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun d!75157 () Bool)

(assert (=> d!75157 e!272448))

(declare-fun res!278611 () Bool)

(assert (=> d!75157 (=> (not res!278611) (not e!272448))))

(assert (=> d!75157 (= res!278611 (not (contains!2506 lt!210557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75157 (= lt!210557 e!272452)))

(declare-fun c!56686 () Bool)

(assert (=> d!75157 (= c!56686 (bvsge #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(assert (=> d!75157 (validMask!0 mask!1365)))

(assert (=> d!75157 (= (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210557)))

(declare-fun b!466054 () Bool)

(declare-fun res!278612 () Bool)

(assert (=> b!466054 (=> (not res!278612) (not e!272448))))

(assert (=> b!466054 (= res!278612 (not (contains!2506 lt!210557 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!75157 c!56686) b!466046))

(assert (= (and d!75157 (not c!56686)) b!466048))

(assert (= (and b!466048 c!56687) b!466047))

(assert (= (and b!466048 (not c!56687)) b!466051))

(assert (= (or b!466047 b!466051) bm!30228))

(assert (= (and d!75157 res!278611) b!466054))

(assert (= (and b!466054 res!278612) b!466053))

(assert (= (and b!466053 res!278613) b!466050))

(assert (= (and b!466053 c!56685) b!466044))

(assert (= (and b!466053 (not c!56685)) b!466052))

(assert (= (and b!466044 res!278614) b!466043))

(assert (= (and b!466052 c!56688) b!466049))

(assert (= (and b!466052 (not c!56688)) b!466045))

(declare-fun b_lambda!10023 () Bool)

(assert (=> (not b_lambda!10023) (not b!466043)))

(assert (=> b!466043 t!14418))

(declare-fun b_and!19747 () Bool)

(assert (= b_and!19745 (and (=> t!14418 result!7377) b_and!19747)))

(declare-fun b_lambda!10025 () Bool)

(assert (=> (not b_lambda!10025) (not b!466047)))

(assert (=> b!466047 t!14418))

(declare-fun b_and!19749 () Bool)

(assert (= b_and!19747 (and (=> t!14418 result!7377) b_and!19749)))

(assert (=> b!466044 m!448471))

(assert (=> b!466044 m!448471))

(declare-fun m!448507 () Bool)

(assert (=> b!466044 m!448507))

(declare-fun m!448509 () Bool)

(assert (=> bm!30228 m!448509))

(assert (=> b!466049 m!448509))

(declare-fun m!448511 () Bool)

(assert (=> d!75157 m!448511))

(assert (=> d!75157 m!448403))

(assert (=> b!466043 m!448487))

(assert (=> b!466043 m!448489))

(assert (=> b!466043 m!448487))

(assert (=> b!466043 m!448489))

(assert (=> b!466043 m!448491))

(assert (=> b!466043 m!448471))

(assert (=> b!466043 m!448471))

(declare-fun m!448513 () Bool)

(assert (=> b!466043 m!448513))

(declare-fun m!448515 () Bool)

(assert (=> b!466054 m!448515))

(declare-fun m!448517 () Bool)

(assert (=> b!466047 m!448517))

(assert (=> b!466047 m!448487))

(declare-fun m!448519 () Bool)

(assert (=> b!466047 m!448519))

(declare-fun m!448521 () Bool)

(assert (=> b!466047 m!448521))

(assert (=> b!466047 m!448471))

(assert (=> b!466047 m!448487))

(assert (=> b!466047 m!448489))

(assert (=> b!466047 m!448491))

(assert (=> b!466047 m!448519))

(declare-fun m!448523 () Bool)

(assert (=> b!466047 m!448523))

(assert (=> b!466047 m!448489))

(declare-fun m!448525 () Bool)

(assert (=> b!466045 m!448525))

(assert (=> b!466050 m!448471))

(assert (=> b!466050 m!448471))

(assert (=> b!466050 m!448475))

(assert (=> b!466048 m!448471))

(assert (=> b!466048 m!448471))

(assert (=> b!466048 m!448475))

(assert (=> b!465928 d!75157))

(declare-fun d!75159 () Bool)

(declare-fun e!272457 () Bool)

(assert (=> d!75159 e!272457))

(declare-fun res!278619 () Bool)

(assert (=> d!75159 (=> (not res!278619) (not e!272457))))

(declare-fun lt!210571 () ListLongMap!7301)

(assert (=> d!75159 (= res!278619 (contains!2506 lt!210571 (_1!4204 (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!210572 () List!8470)

(assert (=> d!75159 (= lt!210571 (ListLongMap!7302 lt!210572))))

(declare-fun lt!210570 () Unit!13546)

(declare-fun lt!210569 () Unit!13546)

(assert (=> d!75159 (= lt!210570 lt!210569)))

(declare-datatypes ((Option!383 0))(
  ( (Some!382 (v!8735 V!18171)) (None!381) )
))
(declare-fun getValueByKey!377 (List!8470 (_ BitVec 64)) Option!383)

(assert (=> d!75159 (= (getValueByKey!377 lt!210572 (_1!4204 (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!382 (_2!4204 (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!199 (List!8470 (_ BitVec 64) V!18171) Unit!13546)

(assert (=> d!75159 (= lt!210569 (lemmaContainsTupThenGetReturnValue!199 lt!210572 (_1!4204 (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4204 (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!202 (List!8470 (_ BitVec 64) V!18171) List!8470)

(assert (=> d!75159 (= lt!210572 (insertStrictlySorted!202 (toList!3666 (getCurrentListMap!2115 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4204 (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4204 (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!75159 (= (+!1664 (getCurrentListMap!2115 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!210571)))

(declare-fun b!466059 () Bool)

(declare-fun res!278620 () Bool)

(assert (=> b!466059 (=> (not res!278620) (not e!272457))))

(assert (=> b!466059 (= res!278620 (= (getValueByKey!377 (toList!3666 lt!210571) (_1!4204 (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!382 (_2!4204 (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!466060 () Bool)

(declare-fun contains!2507 (List!8470 tuple2!8386) Bool)

(assert (=> b!466060 (= e!272457 (contains!2507 (toList!3666 lt!210571) (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75159 res!278619) b!466059))

(assert (= (and b!466059 res!278620) b!466060))

(declare-fun m!448527 () Bool)

(assert (=> d!75159 m!448527))

(declare-fun m!448529 () Bool)

(assert (=> d!75159 m!448529))

(declare-fun m!448531 () Bool)

(assert (=> d!75159 m!448531))

(declare-fun m!448533 () Bool)

(assert (=> d!75159 m!448533))

(declare-fun m!448535 () Bool)

(assert (=> b!466059 m!448535))

(declare-fun m!448537 () Bool)

(assert (=> b!466060 m!448537))

(assert (=> b!465927 d!75159))

(declare-fun b!466103 () Bool)

(declare-fun e!272485 () ListLongMap!7301)

(declare-fun call!30246 () ListLongMap!7301)

(assert (=> b!466103 (= e!272485 call!30246)))

(declare-fun bm!30243 () Bool)

(declare-fun call!30251 () Bool)

(declare-fun lt!210623 () ListLongMap!7301)

(assert (=> bm!30243 (= call!30251 (contains!2506 lt!210623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!272493 () Bool)

(declare-fun b!466104 () Bool)

(assert (=> b!466104 (= e!272493 (= (apply!322 lt!210623 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)) (get!6928 (select (arr!14120 _values!833) #b00000000000000000000000000000000) (dynLambda!912 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!466104 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14472 _values!833)))))

(assert (=> b!466104 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun b!466105 () Bool)

(declare-fun call!30249 () ListLongMap!7301)

(assert (=> b!466105 (= e!272485 call!30249)))

(declare-fun b!466106 () Bool)

(declare-fun c!56706 () Bool)

(assert (=> b!466106 (= c!56706 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!272486 () ListLongMap!7301)

(assert (=> b!466106 (= e!272486 e!272485)))

(declare-fun b!466107 () Bool)

(assert (=> b!466107 (= e!272486 call!30249)))

(declare-fun bm!30244 () Bool)

(declare-fun call!30250 () Bool)

(assert (=> bm!30244 (= call!30250 (contains!2506 lt!210623 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!466108 () Bool)

(declare-fun e!272484 () ListLongMap!7301)

(declare-fun call!30248 () ListLongMap!7301)

(assert (=> b!466108 (= e!272484 (+!1664 call!30248 (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun call!30247 () ListLongMap!7301)

(declare-fun bm!30245 () Bool)

(assert (=> bm!30245 (= call!30247 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466109 () Bool)

(declare-fun e!272489 () Unit!13546)

(declare-fun Unit!13550 () Unit!13546)

(assert (=> b!466109 (= e!272489 Unit!13550)))

(declare-fun b!466110 () Bool)

(declare-fun e!272487 () Bool)

(assert (=> b!466110 (= e!272487 (validKeyInArray!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466111 () Bool)

(assert (=> b!466111 (= e!272484 e!272486)))

(declare-fun c!56705 () Bool)

(assert (=> b!466111 (= c!56705 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466112 () Bool)

(declare-fun e!272490 () Bool)

(assert (=> b!466112 (= e!272490 (= (apply!322 lt!210623 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun d!75161 () Bool)

(declare-fun e!272491 () Bool)

(assert (=> d!75161 e!272491))

(declare-fun res!278647 () Bool)

(assert (=> d!75161 (=> (not res!278647) (not e!272491))))

(assert (=> d!75161 (= res!278647 (or (bvsge #b00000000000000000000000000000000 (size!14471 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))))

(declare-fun lt!210635 () ListLongMap!7301)

(assert (=> d!75161 (= lt!210623 lt!210635)))

(declare-fun lt!210634 () Unit!13546)

(assert (=> d!75161 (= lt!210634 e!272489)))

(declare-fun c!56701 () Bool)

(assert (=> d!75161 (= c!56701 e!272487)))

(declare-fun res!278641 () Bool)

(assert (=> d!75161 (=> (not res!278641) (not e!272487))))

(assert (=> d!75161 (= res!278641 (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(assert (=> d!75161 (= lt!210635 e!272484)))

(declare-fun c!56704 () Bool)

(assert (=> d!75161 (= c!56704 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75161 (validMask!0 mask!1365)))

(assert (=> d!75161 (= (getCurrentListMap!2115 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210623)))

(declare-fun b!466113 () Bool)

(declare-fun e!272496 () Bool)

(assert (=> b!466113 (= e!272496 e!272493)))

(declare-fun res!278646 () Bool)

(assert (=> b!466113 (=> (not res!278646) (not e!272493))))

(assert (=> b!466113 (= res!278646 (contains!2506 lt!210623 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466113 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun b!466114 () Bool)

(declare-fun e!272492 () Bool)

(declare-fun e!272495 () Bool)

(assert (=> b!466114 (= e!272492 e!272495)))

(declare-fun res!278639 () Bool)

(assert (=> b!466114 (= res!278639 call!30250)))

(assert (=> b!466114 (=> (not res!278639) (not e!272495))))

(declare-fun b!466115 () Bool)

(declare-fun res!278642 () Bool)

(assert (=> b!466115 (=> (not res!278642) (not e!272491))))

(assert (=> b!466115 (= res!278642 e!272496)))

(declare-fun res!278644 () Bool)

(assert (=> b!466115 (=> res!278644 e!272496)))

(declare-fun e!272494 () Bool)

(assert (=> b!466115 (= res!278644 (not e!272494))))

(declare-fun res!278640 () Bool)

(assert (=> b!466115 (=> (not res!278640) (not e!272494))))

(assert (=> b!466115 (= res!278640 (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun b!466116 () Bool)

(assert (=> b!466116 (= e!272495 (= (apply!322 lt!210623 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!466117 () Bool)

(assert (=> b!466117 (= e!272492 (not call!30250))))

(declare-fun b!466118 () Bool)

(declare-fun e!272488 () Bool)

(assert (=> b!466118 (= e!272488 e!272490)))

(declare-fun res!278645 () Bool)

(assert (=> b!466118 (= res!278645 call!30251)))

(assert (=> b!466118 (=> (not res!278645) (not e!272490))))

(declare-fun b!466119 () Bool)

(declare-fun res!278643 () Bool)

(assert (=> b!466119 (=> (not res!278643) (not e!272491))))

(assert (=> b!466119 (= res!278643 e!272488)))

(declare-fun c!56702 () Bool)

(assert (=> b!466119 (= c!56702 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!466120 () Bool)

(assert (=> b!466120 (= e!272488 (not call!30251))))

(declare-fun bm!30246 () Bool)

(declare-fun call!30252 () ListLongMap!7301)

(assert (=> bm!30246 (= call!30252 call!30247)))

(declare-fun b!466121 () Bool)

(assert (=> b!466121 (= e!272491 e!272492)))

(declare-fun c!56703 () Bool)

(assert (=> b!466121 (= c!56703 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466122 () Bool)

(assert (=> b!466122 (= e!272494 (validKeyInArray!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30247 () Bool)

(assert (=> bm!30247 (= call!30248 (+!1664 (ite c!56704 call!30247 (ite c!56705 call!30252 call!30246)) (ite (or c!56704 c!56705) (tuple2!8387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun bm!30248 () Bool)

(assert (=> bm!30248 (= call!30249 call!30248)))

(declare-fun bm!30249 () Bool)

(assert (=> bm!30249 (= call!30246 call!30252)))

(declare-fun b!466123 () Bool)

(declare-fun lt!210631 () Unit!13546)

(assert (=> b!466123 (= e!272489 lt!210631)))

(declare-fun lt!210630 () ListLongMap!7301)

(assert (=> b!466123 (= lt!210630 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210633 () (_ BitVec 64))

(assert (=> b!466123 (= lt!210633 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210622 () (_ BitVec 64))

(assert (=> b!466123 (= lt!210622 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210618 () Unit!13546)

(declare-fun addStillContains!285 (ListLongMap!7301 (_ BitVec 64) V!18171 (_ BitVec 64)) Unit!13546)

(assert (=> b!466123 (= lt!210618 (addStillContains!285 lt!210630 lt!210633 zeroValue!794 lt!210622))))

(assert (=> b!466123 (contains!2506 (+!1664 lt!210630 (tuple2!8387 lt!210633 zeroValue!794)) lt!210622)))

(declare-fun lt!210629 () Unit!13546)

(assert (=> b!466123 (= lt!210629 lt!210618)))

(declare-fun lt!210624 () ListLongMap!7301)

(assert (=> b!466123 (= lt!210624 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210638 () (_ BitVec 64))

(assert (=> b!466123 (= lt!210638 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210621 () (_ BitVec 64))

(assert (=> b!466123 (= lt!210621 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210628 () Unit!13546)

(declare-fun addApplyDifferent!285 (ListLongMap!7301 (_ BitVec 64) V!18171 (_ BitVec 64)) Unit!13546)

(assert (=> b!466123 (= lt!210628 (addApplyDifferent!285 lt!210624 lt!210638 minValueBefore!38 lt!210621))))

(assert (=> b!466123 (= (apply!322 (+!1664 lt!210624 (tuple2!8387 lt!210638 minValueBefore!38)) lt!210621) (apply!322 lt!210624 lt!210621))))

(declare-fun lt!210619 () Unit!13546)

(assert (=> b!466123 (= lt!210619 lt!210628)))

(declare-fun lt!210626 () ListLongMap!7301)

(assert (=> b!466123 (= lt!210626 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210617 () (_ BitVec 64))

(assert (=> b!466123 (= lt!210617 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210632 () (_ BitVec 64))

(assert (=> b!466123 (= lt!210632 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210625 () Unit!13546)

(assert (=> b!466123 (= lt!210625 (addApplyDifferent!285 lt!210626 lt!210617 zeroValue!794 lt!210632))))

(assert (=> b!466123 (= (apply!322 (+!1664 lt!210626 (tuple2!8387 lt!210617 zeroValue!794)) lt!210632) (apply!322 lt!210626 lt!210632))))

(declare-fun lt!210636 () Unit!13546)

(assert (=> b!466123 (= lt!210636 lt!210625)))

(declare-fun lt!210627 () ListLongMap!7301)

(assert (=> b!466123 (= lt!210627 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210637 () (_ BitVec 64))

(assert (=> b!466123 (= lt!210637 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210620 () (_ BitVec 64))

(assert (=> b!466123 (= lt!210620 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!466123 (= lt!210631 (addApplyDifferent!285 lt!210627 lt!210637 minValueBefore!38 lt!210620))))

(assert (=> b!466123 (= (apply!322 (+!1664 lt!210627 (tuple2!8387 lt!210637 minValueBefore!38)) lt!210620) (apply!322 lt!210627 lt!210620))))

(assert (= (and d!75161 c!56704) b!466108))

(assert (= (and d!75161 (not c!56704)) b!466111))

(assert (= (and b!466111 c!56705) b!466107))

(assert (= (and b!466111 (not c!56705)) b!466106))

(assert (= (and b!466106 c!56706) b!466105))

(assert (= (and b!466106 (not c!56706)) b!466103))

(assert (= (or b!466105 b!466103) bm!30249))

(assert (= (or b!466107 bm!30249) bm!30246))

(assert (= (or b!466107 b!466105) bm!30248))

(assert (= (or b!466108 bm!30246) bm!30245))

(assert (= (or b!466108 bm!30248) bm!30247))

(assert (= (and d!75161 res!278641) b!466110))

(assert (= (and d!75161 c!56701) b!466123))

(assert (= (and d!75161 (not c!56701)) b!466109))

(assert (= (and d!75161 res!278647) b!466115))

(assert (= (and b!466115 res!278640) b!466122))

(assert (= (and b!466115 (not res!278644)) b!466113))

(assert (= (and b!466113 res!278646) b!466104))

(assert (= (and b!466115 res!278642) b!466119))

(assert (= (and b!466119 c!56702) b!466118))

(assert (= (and b!466119 (not c!56702)) b!466120))

(assert (= (and b!466118 res!278645) b!466112))

(assert (= (or b!466118 b!466120) bm!30243))

(assert (= (and b!466119 res!278643) b!466121))

(assert (= (and b!466121 c!56703) b!466114))

(assert (= (and b!466121 (not c!56703)) b!466117))

(assert (= (and b!466114 res!278639) b!466116))

(assert (= (or b!466114 b!466117) bm!30244))

(declare-fun b_lambda!10027 () Bool)

(assert (=> (not b_lambda!10027) (not b!466104)))

(assert (=> b!466104 t!14418))

(declare-fun b_and!19751 () Bool)

(assert (= b_and!19749 (and (=> t!14418 result!7377) b_and!19751)))

(assert (=> b!466122 m!448471))

(assert (=> b!466122 m!448471))

(assert (=> b!466122 m!448475))

(declare-fun m!448539 () Bool)

(assert (=> bm!30243 m!448539))

(declare-fun m!448541 () Bool)

(assert (=> b!466116 m!448541))

(declare-fun m!448543 () Bool)

(assert (=> b!466123 m!448543))

(declare-fun m!448545 () Bool)

(assert (=> b!466123 m!448545))

(declare-fun m!448547 () Bool)

(assert (=> b!466123 m!448547))

(declare-fun m!448549 () Bool)

(assert (=> b!466123 m!448549))

(declare-fun m!448551 () Bool)

(assert (=> b!466123 m!448551))

(declare-fun m!448553 () Bool)

(assert (=> b!466123 m!448553))

(assert (=> b!466123 m!448471))

(declare-fun m!448555 () Bool)

(assert (=> b!466123 m!448555))

(declare-fun m!448557 () Bool)

(assert (=> b!466123 m!448557))

(declare-fun m!448559 () Bool)

(assert (=> b!466123 m!448559))

(declare-fun m!448561 () Bool)

(assert (=> b!466123 m!448561))

(assert (=> b!466123 m!448413))

(assert (=> b!466123 m!448557))

(declare-fun m!448563 () Bool)

(assert (=> b!466123 m!448563))

(assert (=> b!466123 m!448549))

(declare-fun m!448565 () Bool)

(assert (=> b!466123 m!448565))

(assert (=> b!466123 m!448563))

(declare-fun m!448567 () Bool)

(assert (=> b!466123 m!448567))

(declare-fun m!448569 () Bool)

(assert (=> b!466123 m!448569))

(assert (=> b!466123 m!448569))

(declare-fun m!448571 () Bool)

(assert (=> b!466123 m!448571))

(declare-fun m!448573 () Bool)

(assert (=> bm!30244 m!448573))

(assert (=> b!466110 m!448471))

(assert (=> b!466110 m!448471))

(assert (=> b!466110 m!448475))

(declare-fun m!448575 () Bool)

(assert (=> bm!30247 m!448575))

(assert (=> d!75161 m!448403))

(declare-fun m!448577 () Bool)

(assert (=> b!466108 m!448577))

(assert (=> b!466104 m!448487))

(assert (=> b!466104 m!448489))

(assert (=> b!466104 m!448471))

(declare-fun m!448579 () Bool)

(assert (=> b!466104 m!448579))

(assert (=> b!466104 m!448471))

(assert (=> b!466104 m!448487))

(assert (=> b!466104 m!448489))

(assert (=> b!466104 m!448491))

(assert (=> b!466113 m!448471))

(assert (=> b!466113 m!448471))

(declare-fun m!448581 () Bool)

(assert (=> b!466113 m!448581))

(declare-fun m!448583 () Bool)

(assert (=> b!466112 m!448583))

(assert (=> bm!30245 m!448413))

(assert (=> b!465927 d!75161))

(declare-fun b!466124 () Bool)

(declare-fun e!272498 () ListLongMap!7301)

(declare-fun call!30253 () ListLongMap!7301)

(assert (=> b!466124 (= e!272498 call!30253)))

(declare-fun bm!30250 () Bool)

(declare-fun call!30258 () Bool)

(declare-fun lt!210645 () ListLongMap!7301)

(assert (=> bm!30250 (= call!30258 (contains!2506 lt!210645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!466125 () Bool)

(declare-fun e!272506 () Bool)

(assert (=> b!466125 (= e!272506 (= (apply!322 lt!210645 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)) (get!6928 (select (arr!14120 _values!833) #b00000000000000000000000000000000) (dynLambda!912 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!466125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14472 _values!833)))))

(assert (=> b!466125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun b!466126 () Bool)

(declare-fun call!30256 () ListLongMap!7301)

(assert (=> b!466126 (= e!272498 call!30256)))

(declare-fun b!466127 () Bool)

(declare-fun c!56712 () Bool)

(assert (=> b!466127 (= c!56712 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!272499 () ListLongMap!7301)

(assert (=> b!466127 (= e!272499 e!272498)))

(declare-fun b!466128 () Bool)

(assert (=> b!466128 (= e!272499 call!30256)))

(declare-fun bm!30251 () Bool)

(declare-fun call!30257 () Bool)

(assert (=> bm!30251 (= call!30257 (contains!2506 lt!210645 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!466129 () Bool)

(declare-fun e!272497 () ListLongMap!7301)

(declare-fun call!30255 () ListLongMap!7301)

(assert (=> b!466129 (= e!272497 (+!1664 call!30255 (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun bm!30252 () Bool)

(declare-fun call!30254 () ListLongMap!7301)

(assert (=> bm!30252 (= call!30254 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466130 () Bool)

(declare-fun e!272502 () Unit!13546)

(declare-fun Unit!13551 () Unit!13546)

(assert (=> b!466130 (= e!272502 Unit!13551)))

(declare-fun b!466131 () Bool)

(declare-fun e!272500 () Bool)

(assert (=> b!466131 (= e!272500 (validKeyInArray!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466132 () Bool)

(assert (=> b!466132 (= e!272497 e!272499)))

(declare-fun c!56711 () Bool)

(assert (=> b!466132 (= c!56711 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466133 () Bool)

(declare-fun e!272503 () Bool)

(assert (=> b!466133 (= e!272503 (= (apply!322 lt!210645 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun d!75163 () Bool)

(declare-fun e!272504 () Bool)

(assert (=> d!75163 e!272504))

(declare-fun res!278656 () Bool)

(assert (=> d!75163 (=> (not res!278656) (not e!272504))))

(assert (=> d!75163 (= res!278656 (or (bvsge #b00000000000000000000000000000000 (size!14471 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))))

(declare-fun lt!210657 () ListLongMap!7301)

(assert (=> d!75163 (= lt!210645 lt!210657)))

(declare-fun lt!210656 () Unit!13546)

(assert (=> d!75163 (= lt!210656 e!272502)))

(declare-fun c!56707 () Bool)

(assert (=> d!75163 (= c!56707 e!272500)))

(declare-fun res!278650 () Bool)

(assert (=> d!75163 (=> (not res!278650) (not e!272500))))

(assert (=> d!75163 (= res!278650 (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(assert (=> d!75163 (= lt!210657 e!272497)))

(declare-fun c!56710 () Bool)

(assert (=> d!75163 (= c!56710 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75163 (validMask!0 mask!1365)))

(assert (=> d!75163 (= (getCurrentListMap!2115 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210645)))

(declare-fun b!466134 () Bool)

(declare-fun e!272509 () Bool)

(assert (=> b!466134 (= e!272509 e!272506)))

(declare-fun res!278655 () Bool)

(assert (=> b!466134 (=> (not res!278655) (not e!272506))))

(assert (=> b!466134 (= res!278655 (contains!2506 lt!210645 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun b!466135 () Bool)

(declare-fun e!272505 () Bool)

(declare-fun e!272508 () Bool)

(assert (=> b!466135 (= e!272505 e!272508)))

(declare-fun res!278648 () Bool)

(assert (=> b!466135 (= res!278648 call!30257)))

(assert (=> b!466135 (=> (not res!278648) (not e!272508))))

(declare-fun b!466136 () Bool)

(declare-fun res!278651 () Bool)

(assert (=> b!466136 (=> (not res!278651) (not e!272504))))

(assert (=> b!466136 (= res!278651 e!272509)))

(declare-fun res!278653 () Bool)

(assert (=> b!466136 (=> res!278653 e!272509)))

(declare-fun e!272507 () Bool)

(assert (=> b!466136 (= res!278653 (not e!272507))))

(declare-fun res!278649 () Bool)

(assert (=> b!466136 (=> (not res!278649) (not e!272507))))

(assert (=> b!466136 (= res!278649 (bvslt #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun b!466137 () Bool)

(assert (=> b!466137 (= e!272508 (= (apply!322 lt!210645 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!466138 () Bool)

(assert (=> b!466138 (= e!272505 (not call!30257))))

(declare-fun b!466139 () Bool)

(declare-fun e!272501 () Bool)

(assert (=> b!466139 (= e!272501 e!272503)))

(declare-fun res!278654 () Bool)

(assert (=> b!466139 (= res!278654 call!30258)))

(assert (=> b!466139 (=> (not res!278654) (not e!272503))))

(declare-fun b!466140 () Bool)

(declare-fun res!278652 () Bool)

(assert (=> b!466140 (=> (not res!278652) (not e!272504))))

(assert (=> b!466140 (= res!278652 e!272501)))

(declare-fun c!56708 () Bool)

(assert (=> b!466140 (= c!56708 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!466141 () Bool)

(assert (=> b!466141 (= e!272501 (not call!30258))))

(declare-fun bm!30253 () Bool)

(declare-fun call!30259 () ListLongMap!7301)

(assert (=> bm!30253 (= call!30259 call!30254)))

(declare-fun b!466142 () Bool)

(assert (=> b!466142 (= e!272504 e!272505)))

(declare-fun c!56709 () Bool)

(assert (=> b!466142 (= c!56709 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466143 () Bool)

(assert (=> b!466143 (= e!272507 (validKeyInArray!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30254 () Bool)

(assert (=> bm!30254 (= call!30255 (+!1664 (ite c!56710 call!30254 (ite c!56711 call!30259 call!30253)) (ite (or c!56710 c!56711) (tuple2!8387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8387 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun bm!30255 () Bool)

(assert (=> bm!30255 (= call!30256 call!30255)))

(declare-fun bm!30256 () Bool)

(assert (=> bm!30256 (= call!30253 call!30259)))

(declare-fun b!466144 () Bool)

(declare-fun lt!210653 () Unit!13546)

(assert (=> b!466144 (= e!272502 lt!210653)))

(declare-fun lt!210652 () ListLongMap!7301)

(assert (=> b!466144 (= lt!210652 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210655 () (_ BitVec 64))

(assert (=> b!466144 (= lt!210655 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210644 () (_ BitVec 64))

(assert (=> b!466144 (= lt!210644 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210640 () Unit!13546)

(assert (=> b!466144 (= lt!210640 (addStillContains!285 lt!210652 lt!210655 zeroValue!794 lt!210644))))

(assert (=> b!466144 (contains!2506 (+!1664 lt!210652 (tuple2!8387 lt!210655 zeroValue!794)) lt!210644)))

(declare-fun lt!210651 () Unit!13546)

(assert (=> b!466144 (= lt!210651 lt!210640)))

(declare-fun lt!210646 () ListLongMap!7301)

(assert (=> b!466144 (= lt!210646 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210660 () (_ BitVec 64))

(assert (=> b!466144 (= lt!210660 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210643 () (_ BitVec 64))

(assert (=> b!466144 (= lt!210643 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210650 () Unit!13546)

(assert (=> b!466144 (= lt!210650 (addApplyDifferent!285 lt!210646 lt!210660 minValueAfter!38 lt!210643))))

(assert (=> b!466144 (= (apply!322 (+!1664 lt!210646 (tuple2!8387 lt!210660 minValueAfter!38)) lt!210643) (apply!322 lt!210646 lt!210643))))

(declare-fun lt!210641 () Unit!13546)

(assert (=> b!466144 (= lt!210641 lt!210650)))

(declare-fun lt!210648 () ListLongMap!7301)

(assert (=> b!466144 (= lt!210648 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210639 () (_ BitVec 64))

(assert (=> b!466144 (= lt!210639 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210654 () (_ BitVec 64))

(assert (=> b!466144 (= lt!210654 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210647 () Unit!13546)

(assert (=> b!466144 (= lt!210647 (addApplyDifferent!285 lt!210648 lt!210639 zeroValue!794 lt!210654))))

(assert (=> b!466144 (= (apply!322 (+!1664 lt!210648 (tuple2!8387 lt!210639 zeroValue!794)) lt!210654) (apply!322 lt!210648 lt!210654))))

(declare-fun lt!210658 () Unit!13546)

(assert (=> b!466144 (= lt!210658 lt!210647)))

(declare-fun lt!210649 () ListLongMap!7301)

(assert (=> b!466144 (= lt!210649 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210659 () (_ BitVec 64))

(assert (=> b!466144 (= lt!210659 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210642 () (_ BitVec 64))

(assert (=> b!466144 (= lt!210642 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!466144 (= lt!210653 (addApplyDifferent!285 lt!210649 lt!210659 minValueAfter!38 lt!210642))))

(assert (=> b!466144 (= (apply!322 (+!1664 lt!210649 (tuple2!8387 lt!210659 minValueAfter!38)) lt!210642) (apply!322 lt!210649 lt!210642))))

(assert (= (and d!75163 c!56710) b!466129))

(assert (= (and d!75163 (not c!56710)) b!466132))

(assert (= (and b!466132 c!56711) b!466128))

(assert (= (and b!466132 (not c!56711)) b!466127))

(assert (= (and b!466127 c!56712) b!466126))

(assert (= (and b!466127 (not c!56712)) b!466124))

(assert (= (or b!466126 b!466124) bm!30256))

(assert (= (or b!466128 bm!30256) bm!30253))

(assert (= (or b!466128 b!466126) bm!30255))

(assert (= (or b!466129 bm!30253) bm!30252))

(assert (= (or b!466129 bm!30255) bm!30254))

(assert (= (and d!75163 res!278650) b!466131))

(assert (= (and d!75163 c!56707) b!466144))

(assert (= (and d!75163 (not c!56707)) b!466130))

(assert (= (and d!75163 res!278656) b!466136))

(assert (= (and b!466136 res!278649) b!466143))

(assert (= (and b!466136 (not res!278653)) b!466134))

(assert (= (and b!466134 res!278655) b!466125))

(assert (= (and b!466136 res!278651) b!466140))

(assert (= (and b!466140 c!56708) b!466139))

(assert (= (and b!466140 (not c!56708)) b!466141))

(assert (= (and b!466139 res!278654) b!466133))

(assert (= (or b!466139 b!466141) bm!30250))

(assert (= (and b!466140 res!278652) b!466142))

(assert (= (and b!466142 c!56709) b!466135))

(assert (= (and b!466142 (not c!56709)) b!466138))

(assert (= (and b!466135 res!278648) b!466137))

(assert (= (or b!466135 b!466138) bm!30251))

(declare-fun b_lambda!10029 () Bool)

(assert (=> (not b_lambda!10029) (not b!466125)))

(assert (=> b!466125 t!14418))

(declare-fun b_and!19753 () Bool)

(assert (= b_and!19751 (and (=> t!14418 result!7377) b_and!19753)))

(assert (=> b!466143 m!448471))

(assert (=> b!466143 m!448471))

(assert (=> b!466143 m!448475))

(declare-fun m!448585 () Bool)

(assert (=> bm!30250 m!448585))

(declare-fun m!448587 () Bool)

(assert (=> b!466137 m!448587))

(declare-fun m!448589 () Bool)

(assert (=> b!466144 m!448589))

(declare-fun m!448591 () Bool)

(assert (=> b!466144 m!448591))

(declare-fun m!448593 () Bool)

(assert (=> b!466144 m!448593))

(declare-fun m!448595 () Bool)

(assert (=> b!466144 m!448595))

(declare-fun m!448597 () Bool)

(assert (=> b!466144 m!448597))

(declare-fun m!448599 () Bool)

(assert (=> b!466144 m!448599))

(assert (=> b!466144 m!448471))

(declare-fun m!448601 () Bool)

(assert (=> b!466144 m!448601))

(declare-fun m!448603 () Bool)

(assert (=> b!466144 m!448603))

(declare-fun m!448605 () Bool)

(assert (=> b!466144 m!448605))

(declare-fun m!448607 () Bool)

(assert (=> b!466144 m!448607))

(assert (=> b!466144 m!448411))

(assert (=> b!466144 m!448603))

(declare-fun m!448609 () Bool)

(assert (=> b!466144 m!448609))

(assert (=> b!466144 m!448595))

(declare-fun m!448611 () Bool)

(assert (=> b!466144 m!448611))

(assert (=> b!466144 m!448609))

(declare-fun m!448613 () Bool)

(assert (=> b!466144 m!448613))

(declare-fun m!448615 () Bool)

(assert (=> b!466144 m!448615))

(assert (=> b!466144 m!448615))

(declare-fun m!448617 () Bool)

(assert (=> b!466144 m!448617))

(declare-fun m!448619 () Bool)

(assert (=> bm!30251 m!448619))

(assert (=> b!466131 m!448471))

(assert (=> b!466131 m!448471))

(assert (=> b!466131 m!448475))

(declare-fun m!448621 () Bool)

(assert (=> bm!30254 m!448621))

(assert (=> d!75163 m!448403))

(declare-fun m!448623 () Bool)

(assert (=> b!466129 m!448623))

(assert (=> b!466125 m!448487))

(assert (=> b!466125 m!448489))

(assert (=> b!466125 m!448471))

(declare-fun m!448625 () Bool)

(assert (=> b!466125 m!448625))

(assert (=> b!466125 m!448471))

(assert (=> b!466125 m!448487))

(assert (=> b!466125 m!448489))

(assert (=> b!466125 m!448491))

(assert (=> b!466134 m!448471))

(assert (=> b!466134 m!448471))

(declare-fun m!448627 () Bool)

(assert (=> b!466134 m!448627))

(declare-fun m!448629 () Bool)

(assert (=> b!466133 m!448629))

(assert (=> bm!30252 m!448411))

(assert (=> b!465927 d!75163))

(declare-fun d!75165 () Bool)

(assert (=> d!75165 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41718 d!75165))

(declare-fun d!75167 () Bool)

(assert (=> d!75167 (= (array_inv!10280 _keys!1025) (bvsge (size!14471 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41718 d!75167))

(declare-fun d!75169 () Bool)

(assert (=> d!75169 (= (array_inv!10281 _values!833) (bvsge (size!14472 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41718 d!75169))

(declare-fun d!75171 () Bool)

(declare-fun res!278661 () Bool)

(declare-fun e!272516 () Bool)

(assert (=> d!75171 (=> res!278661 e!272516)))

(assert (=> d!75171 (= res!278661 (bvsge #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(assert (=> d!75171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!272516)))

(declare-fun b!466153 () Bool)

(declare-fun e!272517 () Bool)

(declare-fun e!272518 () Bool)

(assert (=> b!466153 (= e!272517 e!272518)))

(declare-fun lt!210669 () (_ BitVec 64))

(assert (=> b!466153 (= lt!210669 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210668 () Unit!13546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29380 (_ BitVec 64) (_ BitVec 32)) Unit!13546)

(assert (=> b!466153 (= lt!210668 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!210669 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!466153 (arrayContainsKey!0 _keys!1025 lt!210669 #b00000000000000000000000000000000)))

(declare-fun lt!210667 () Unit!13546)

(assert (=> b!466153 (= lt!210667 lt!210668)))

(declare-fun res!278662 () Bool)

(declare-datatypes ((SeekEntryResult!3495 0))(
  ( (MissingZero!3495 (index!16159 (_ BitVec 32))) (Found!3495 (index!16160 (_ BitVec 32))) (Intermediate!3495 (undefined!4307 Bool) (index!16161 (_ BitVec 32)) (x!43530 (_ BitVec 32))) (Undefined!3495) (MissingVacant!3495 (index!16162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29380 (_ BitVec 32)) SeekEntryResult!3495)

(assert (=> b!466153 (= res!278662 (= (seekEntryOrOpen!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3495 #b00000000000000000000000000000000)))))

(assert (=> b!466153 (=> (not res!278662) (not e!272518))))

(declare-fun bm!30259 () Bool)

(declare-fun call!30262 () Bool)

(assert (=> bm!30259 (= call!30262 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!466154 () Bool)

(assert (=> b!466154 (= e!272517 call!30262)))

(declare-fun b!466155 () Bool)

(assert (=> b!466155 (= e!272518 call!30262)))

(declare-fun b!466156 () Bool)

(assert (=> b!466156 (= e!272516 e!272517)))

(declare-fun c!56715 () Bool)

(assert (=> b!466156 (= c!56715 (validKeyInArray!0 (select (arr!14119 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75171 (not res!278661)) b!466156))

(assert (= (and b!466156 c!56715) b!466153))

(assert (= (and b!466156 (not c!56715)) b!466154))

(assert (= (and b!466153 res!278662) b!466155))

(assert (= (or b!466155 b!466154) bm!30259))

(assert (=> b!466153 m!448471))

(declare-fun m!448631 () Bool)

(assert (=> b!466153 m!448631))

(declare-fun m!448633 () Bool)

(assert (=> b!466153 m!448633))

(assert (=> b!466153 m!448471))

(declare-fun m!448635 () Bool)

(assert (=> b!466153 m!448635))

(declare-fun m!448637 () Bool)

(assert (=> bm!30259 m!448637))

(assert (=> b!466156 m!448471))

(assert (=> b!466156 m!448471))

(assert (=> b!466156 m!448475))

(assert (=> b!465933 d!75171))

(declare-fun mapNonEmpty!20890 () Bool)

(declare-fun mapRes!20890 () Bool)

(declare-fun tp!40132 () Bool)

(declare-fun e!272523 () Bool)

(assert (=> mapNonEmpty!20890 (= mapRes!20890 (and tp!40132 e!272523))))

(declare-fun mapKey!20890 () (_ BitVec 32))

(declare-fun mapRest!20890 () (Array (_ BitVec 32) ValueCell!6056))

(declare-fun mapValue!20890 () ValueCell!6056)

(assert (=> mapNonEmpty!20890 (= mapRest!20881 (store mapRest!20890 mapKey!20890 mapValue!20890))))

(declare-fun mapIsEmpty!20890 () Bool)

(assert (=> mapIsEmpty!20890 mapRes!20890))

(declare-fun b!466163 () Bool)

(assert (=> b!466163 (= e!272523 tp_is_empty!12799)))

(declare-fun b!466164 () Bool)

(declare-fun e!272524 () Bool)

(assert (=> b!466164 (= e!272524 tp_is_empty!12799)))

(declare-fun condMapEmpty!20890 () Bool)

(declare-fun mapDefault!20890 () ValueCell!6056)

(assert (=> mapNonEmpty!20881 (= condMapEmpty!20890 (= mapRest!20881 ((as const (Array (_ BitVec 32) ValueCell!6056)) mapDefault!20890)))))

(assert (=> mapNonEmpty!20881 (= tp!40116 (and e!272524 mapRes!20890))))

(assert (= (and mapNonEmpty!20881 condMapEmpty!20890) mapIsEmpty!20890))

(assert (= (and mapNonEmpty!20881 (not condMapEmpty!20890)) mapNonEmpty!20890))

(assert (= (and mapNonEmpty!20890 ((_ is ValueCellFull!6056) mapValue!20890)) b!466163))

(assert (= (and mapNonEmpty!20881 ((_ is ValueCellFull!6056) mapDefault!20890)) b!466164))

(declare-fun m!448639 () Bool)

(assert (=> mapNonEmpty!20890 m!448639))

(declare-fun b_lambda!10031 () Bool)

(assert (= b_lambda!10025 (or (and start!41718 b_free!11371) b_lambda!10031)))

(declare-fun b_lambda!10033 () Bool)

(assert (= b_lambda!10027 (or (and start!41718 b_free!11371) b_lambda!10033)))

(declare-fun b_lambda!10035 () Bool)

(assert (= b_lambda!10023 (or (and start!41718 b_free!11371) b_lambda!10035)))

(declare-fun b_lambda!10037 () Bool)

(assert (= b_lambda!10021 (or (and start!41718 b_free!11371) b_lambda!10037)))

(declare-fun b_lambda!10039 () Bool)

(assert (= b_lambda!10019 (or (and start!41718 b_free!11371) b_lambda!10039)))

(declare-fun b_lambda!10041 () Bool)

(assert (= b_lambda!10029 (or (and start!41718 b_free!11371) b_lambda!10041)))

(check-sat (not bm!30224) (not d!75155) (not b!466116) (not d!75161) (not b!466125) (not bm!30252) (not b!466156) (not d!75153) (not b_lambda!10035) (not b!466040) (not b!466123) (not bm!30251) (not bm!30244) (not b!466113) (not b!466043) (not b!466054) (not b!466060) (not b!466108) (not bm!30227) (not b!466050) (not b!466033) (not b!466034) (not b!466035) (not b!466129) (not d!75159) (not bm!30243) (not b!466045) (not mapNonEmpty!20890) (not b!466143) (not b!466131) (not b_lambda!10039) (not b!466153) (not b!466002) (not b!466047) (not b_lambda!10031) (not b!466134) (not b!466104) (not b!466144) (not b!466029) (not bm!30228) (not b!466000) (not d!75157) (not b!466031) (not b!466110) (not bm!30259) b_and!19753 (not b!466137) (not b_lambda!10033) (not d!75163) (not bm!30245) (not b!466004) tp_is_empty!12799 (not b!466112) (not bm!30250) (not b!466044) (not b!466122) (not bm!30254) (not bm!30247) (not b!466059) (not b!466049) (not b_lambda!10041) (not b_lambda!10037) (not b!466048) (not b!466036) (not b!466030) (not b_next!11371) (not b!466133))
(check-sat b_and!19753 (not b_next!11371))
