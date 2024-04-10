; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42232 () Bool)

(assert start!42232)

(declare-fun b_free!11751 () Bool)

(declare-fun b_next!11751 () Bool)

(assert (=> start!42232 (= b_free!11751 (not b_next!11751))))

(declare-fun tp!41278 () Bool)

(declare-fun b_and!20181 () Bool)

(assert (=> start!42232 (= tp!41278 b_and!20181)))

(declare-fun b!471351 () Bool)

(declare-fun e!276243 () Bool)

(declare-fun tp_is_empty!13179 () Bool)

(assert (=> b!471351 (= e!276243 tp_is_empty!13179)))

(declare-fun b!471352 () Bool)

(declare-fun res!281603 () Bool)

(declare-fun e!276241 () Bool)

(assert (=> b!471352 (=> (not res!281603) (not e!276241))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30119 0))(
  ( (array!30120 (arr!14482 (Array (_ BitVec 32) (_ BitVec 64))) (size!14834 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30119)

(declare-datatypes ((V!18677 0))(
  ( (V!18678 (val!6634 Int)) )
))
(declare-datatypes ((ValueCell!6246 0))(
  ( (ValueCellFull!6246 (v!8925 V!18677)) (EmptyCell!6246) )
))
(declare-datatypes ((array!30121 0))(
  ( (array!30122 (arr!14483 (Array (_ BitVec 32) ValueCell!6246)) (size!14835 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30121)

(assert (=> b!471352 (= res!281603 (and (= (size!14835 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14834 _keys!1025) (size!14835 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!281602 () Bool)

(assert (=> start!42232 (=> (not res!281602) (not e!276241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42232 (= res!281602 (validMask!0 mask!1365))))

(assert (=> start!42232 e!276241))

(assert (=> start!42232 tp_is_empty!13179))

(assert (=> start!42232 tp!41278))

(assert (=> start!42232 true))

(declare-fun array_inv!10444 (array!30119) Bool)

(assert (=> start!42232 (array_inv!10444 _keys!1025)))

(declare-fun e!276242 () Bool)

(declare-fun array_inv!10445 (array!30121) Bool)

(assert (=> start!42232 (and (array_inv!10445 _values!833) e!276242)))

(declare-fun b!471353 () Bool)

(declare-fun res!281604 () Bool)

(assert (=> b!471353 (=> (not res!281604) (not e!276241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30119 (_ BitVec 32)) Bool)

(assert (=> b!471353 (= res!281604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471354 () Bool)

(declare-fun res!281605 () Bool)

(assert (=> b!471354 (=> (not res!281605) (not e!276241))))

(declare-datatypes ((List!8815 0))(
  ( (Nil!8812) (Cons!8811 (h!9667 (_ BitVec 64)) (t!14779 List!8815)) )
))
(declare-fun arrayNoDuplicates!0 (array!30119 (_ BitVec 32) List!8815) Bool)

(assert (=> b!471354 (= res!281605 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8812))))

(declare-fun b!471355 () Bool)

(declare-fun e!276244 () Bool)

(assert (=> b!471355 (= e!276244 tp_is_empty!13179)))

(declare-fun mapIsEmpty!21472 () Bool)

(declare-fun mapRes!21472 () Bool)

(assert (=> mapIsEmpty!21472 mapRes!21472))

(declare-fun mapNonEmpty!21472 () Bool)

(declare-fun tp!41277 () Bool)

(assert (=> mapNonEmpty!21472 (= mapRes!21472 (and tp!41277 e!276243))))

(declare-fun mapValue!21472 () ValueCell!6246)

(declare-fun mapKey!21472 () (_ BitVec 32))

(declare-fun mapRest!21472 () (Array (_ BitVec 32) ValueCell!6246))

(assert (=> mapNonEmpty!21472 (= (arr!14483 _values!833) (store mapRest!21472 mapKey!21472 mapValue!21472))))

(declare-fun b!471356 () Bool)

(assert (=> b!471356 (= e!276241 (not (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14834 _keys!1025)))))))

(declare-datatypes ((tuple2!8734 0))(
  ( (tuple2!8735 (_1!4378 (_ BitVec 64)) (_2!4378 V!18677)) )
))
(declare-datatypes ((List!8816 0))(
  ( (Nil!8813) (Cons!8812 (h!9668 tuple2!8734) (t!14780 List!8816)) )
))
(declare-datatypes ((ListLongMap!7647 0))(
  ( (ListLongMap!7648 (toList!3839 List!8816)) )
))
(declare-fun lt!213850 () ListLongMap!7647)

(declare-fun lt!213849 () ListLongMap!7647)

(assert (=> b!471356 (= lt!213850 lt!213849)))

(declare-fun minValueBefore!38 () V!18677)

(declare-fun zeroValue!794 () V!18677)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13837 0))(
  ( (Unit!13838) )
))
(declare-fun lt!213848 () Unit!13837)

(declare-fun minValueAfter!38 () V!18677)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!182 (array!30119 array!30121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18677 V!18677 V!18677 V!18677 (_ BitVec 32) Int) Unit!13837)

(assert (=> b!471356 (= lt!213848 (lemmaNoChangeToArrayThenSameMapNoExtras!182 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2002 (array!30119 array!30121 (_ BitVec 32) (_ BitVec 32) V!18677 V!18677 (_ BitVec 32) Int) ListLongMap!7647)

(assert (=> b!471356 (= lt!213849 (getCurrentListMapNoExtraKeys!2002 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471356 (= lt!213850 (getCurrentListMapNoExtraKeys!2002 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471357 () Bool)

(assert (=> b!471357 (= e!276242 (and e!276244 mapRes!21472))))

(declare-fun condMapEmpty!21472 () Bool)

(declare-fun mapDefault!21472 () ValueCell!6246)

(assert (=> b!471357 (= condMapEmpty!21472 (= (arr!14483 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6246)) mapDefault!21472)))))

(assert (= (and start!42232 res!281602) b!471352))

(assert (= (and b!471352 res!281603) b!471353))

(assert (= (and b!471353 res!281604) b!471354))

(assert (= (and b!471354 res!281605) b!471356))

(assert (= (and b!471357 condMapEmpty!21472) mapIsEmpty!21472))

(assert (= (and b!471357 (not condMapEmpty!21472)) mapNonEmpty!21472))

(get-info :version)

(assert (= (and mapNonEmpty!21472 ((_ is ValueCellFull!6246) mapValue!21472)) b!471351))

(assert (= (and b!471357 ((_ is ValueCellFull!6246) mapDefault!21472)) b!471355))

(assert (= start!42232 b!471357))

(declare-fun m!453503 () Bool)

(assert (=> mapNonEmpty!21472 m!453503))

(declare-fun m!453505 () Bool)

(assert (=> b!471356 m!453505))

(declare-fun m!453507 () Bool)

(assert (=> b!471356 m!453507))

(declare-fun m!453509 () Bool)

(assert (=> b!471356 m!453509))

(declare-fun m!453511 () Bool)

(assert (=> b!471354 m!453511))

(declare-fun m!453513 () Bool)

(assert (=> b!471353 m!453513))

(declare-fun m!453515 () Bool)

(assert (=> start!42232 m!453515))

(declare-fun m!453517 () Bool)

(assert (=> start!42232 m!453517))

(declare-fun m!453519 () Bool)

(assert (=> start!42232 m!453519))

(check-sat (not b!471353) (not b!471354) (not b_next!11751) tp_is_empty!13179 b_and!20181 (not b!471356) (not start!42232) (not mapNonEmpty!21472))
(check-sat b_and!20181 (not b_next!11751))
(get-model)

(declare-fun b!471387 () Bool)

(declare-fun e!276269 () Bool)

(declare-fun e!276268 () Bool)

(assert (=> b!471387 (= e!276269 e!276268)))

(declare-fun lt!213868 () (_ BitVec 64))

(assert (=> b!471387 (= lt!213868 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213866 () Unit!13837)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30119 (_ BitVec 64) (_ BitVec 32)) Unit!13837)

(assert (=> b!471387 (= lt!213866 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!213868 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!471387 (arrayContainsKey!0 _keys!1025 lt!213868 #b00000000000000000000000000000000)))

(declare-fun lt!213867 () Unit!13837)

(assert (=> b!471387 (= lt!213867 lt!213866)))

(declare-fun res!281622 () Bool)

(declare-datatypes ((SeekEntryResult!3553 0))(
  ( (MissingZero!3553 (index!16391 (_ BitVec 32))) (Found!3553 (index!16392 (_ BitVec 32))) (Intermediate!3553 (undefined!4365 Bool) (index!16393 (_ BitVec 32)) (x!44172 (_ BitVec 32))) (Undefined!3553) (MissingVacant!3553 (index!16394 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30119 (_ BitVec 32)) SeekEntryResult!3553)

(assert (=> b!471387 (= res!281622 (= (seekEntryOrOpen!0 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3553 #b00000000000000000000000000000000)))))

(assert (=> b!471387 (=> (not res!281622) (not e!276268))))

(declare-fun bm!30441 () Bool)

(declare-fun call!30444 () Bool)

(assert (=> bm!30441 (= call!30444 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!75399 () Bool)

(declare-fun res!281623 () Bool)

(declare-fun e!276267 () Bool)

(assert (=> d!75399 (=> res!281623 e!276267)))

(assert (=> d!75399 (= res!281623 (bvsge #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(assert (=> d!75399 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!276267)))

(declare-fun b!471388 () Bool)

(assert (=> b!471388 (= e!276268 call!30444)))

(declare-fun b!471389 () Bool)

(assert (=> b!471389 (= e!276269 call!30444)))

(declare-fun b!471390 () Bool)

(assert (=> b!471390 (= e!276267 e!276269)))

(declare-fun c!56967 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!471390 (= c!56967 (validKeyInArray!0 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75399 (not res!281623)) b!471390))

(assert (= (and b!471390 c!56967) b!471387))

(assert (= (and b!471390 (not c!56967)) b!471389))

(assert (= (and b!471387 res!281622) b!471388))

(assert (= (or b!471388 b!471389) bm!30441))

(declare-fun m!453539 () Bool)

(assert (=> b!471387 m!453539))

(declare-fun m!453541 () Bool)

(assert (=> b!471387 m!453541))

(declare-fun m!453543 () Bool)

(assert (=> b!471387 m!453543))

(assert (=> b!471387 m!453539))

(declare-fun m!453545 () Bool)

(assert (=> b!471387 m!453545))

(declare-fun m!453547 () Bool)

(assert (=> bm!30441 m!453547))

(assert (=> b!471390 m!453539))

(assert (=> b!471390 m!453539))

(declare-fun m!453549 () Bool)

(assert (=> b!471390 m!453549))

(assert (=> b!471353 d!75399))

(declare-fun d!75401 () Bool)

(assert (=> d!75401 (= (getCurrentListMapNoExtraKeys!2002 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2002 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213871 () Unit!13837)

(declare-fun choose!1348 (array!30119 array!30121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18677 V!18677 V!18677 V!18677 (_ BitVec 32) Int) Unit!13837)

(assert (=> d!75401 (= lt!213871 (choose!1348 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75401 (validMask!0 mask!1365)))

(assert (=> d!75401 (= (lemmaNoChangeToArrayThenSameMapNoExtras!182 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213871)))

(declare-fun bs!14948 () Bool)

(assert (= bs!14948 d!75401))

(assert (=> bs!14948 m!453509))

(assert (=> bs!14948 m!453507))

(declare-fun m!453551 () Bool)

(assert (=> bs!14948 m!453551))

(assert (=> bs!14948 m!453515))

(assert (=> b!471356 d!75401))

(declare-fun b!471415 () Bool)

(declare-fun e!276285 () Bool)

(declare-fun lt!213890 () ListLongMap!7647)

(declare-fun isEmpty!576 (ListLongMap!7647) Bool)

(assert (=> b!471415 (= e!276285 (isEmpty!576 lt!213890))))

(declare-fun b!471416 () Bool)

(declare-fun e!276290 () Bool)

(declare-fun e!276288 () Bool)

(assert (=> b!471416 (= e!276290 e!276288)))

(assert (=> b!471416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(declare-fun res!281632 () Bool)

(declare-fun contains!2542 (ListLongMap!7647 (_ BitVec 64)) Bool)

(assert (=> b!471416 (= res!281632 (contains!2542 lt!213890 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471416 (=> (not res!281632) (not e!276288))))

(declare-fun b!471417 () Bool)

(assert (=> b!471417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(assert (=> b!471417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14835 _values!833)))))

(declare-fun apply!329 (ListLongMap!7647 (_ BitVec 64)) V!18677)

(declare-fun get!7058 (ValueCell!6246 V!18677) V!18677)

(declare-fun dynLambda!922 (Int (_ BitVec 64)) V!18677)

(assert (=> b!471417 (= e!276288 (= (apply!329 lt!213890 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)) (get!7058 (select (arr!14483 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!471418 () Bool)

(assert (=> b!471418 (= e!276290 e!276285)))

(declare-fun c!56976 () Bool)

(assert (=> b!471418 (= c!56976 (bvslt #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(declare-fun b!471419 () Bool)

(declare-fun e!276286 () ListLongMap!7647)

(declare-fun e!276289 () ListLongMap!7647)

(assert (=> b!471419 (= e!276286 e!276289)))

(declare-fun c!56977 () Bool)

(assert (=> b!471419 (= c!56977 (validKeyInArray!0 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471420 () Bool)

(declare-fun e!276287 () Bool)

(assert (=> b!471420 (= e!276287 e!276290)))

(declare-fun c!56978 () Bool)

(declare-fun e!276284 () Bool)

(assert (=> b!471420 (= c!56978 e!276284)))

(declare-fun res!281635 () Bool)

(assert (=> b!471420 (=> (not res!281635) (not e!276284))))

(assert (=> b!471420 (= res!281635 (bvslt #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(declare-fun b!471421 () Bool)

(declare-fun res!281634 () Bool)

(assert (=> b!471421 (=> (not res!281634) (not e!276287))))

(assert (=> b!471421 (= res!281634 (not (contains!2542 lt!213890 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!30444 () Bool)

(declare-fun call!30447 () ListLongMap!7647)

(assert (=> bm!30444 (= call!30447 (getCurrentListMapNoExtraKeys!2002 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun d!75403 () Bool)

(assert (=> d!75403 e!276287))

(declare-fun res!281633 () Bool)

(assert (=> d!75403 (=> (not res!281633) (not e!276287))))

(assert (=> d!75403 (= res!281633 (not (contains!2542 lt!213890 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75403 (= lt!213890 e!276286)))

(declare-fun c!56979 () Bool)

(assert (=> d!75403 (= c!56979 (bvsge #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(assert (=> d!75403 (validMask!0 mask!1365)))

(assert (=> d!75403 (= (getCurrentListMapNoExtraKeys!2002 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213890)))

(declare-fun b!471422 () Bool)

(assert (=> b!471422 (= e!276284 (validKeyInArray!0 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471422 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!471423 () Bool)

(assert (=> b!471423 (= e!276289 call!30447)))

(declare-fun b!471424 () Bool)

(assert (=> b!471424 (= e!276286 (ListLongMap!7648 Nil!8813))))

(declare-fun b!471425 () Bool)

(declare-fun lt!213888 () Unit!13837)

(declare-fun lt!213891 () Unit!13837)

(assert (=> b!471425 (= lt!213888 lt!213891)))

(declare-fun lt!213889 () (_ BitVec 64))

(declare-fun lt!213887 () ListLongMap!7647)

(declare-fun lt!213886 () (_ BitVec 64))

(declare-fun lt!213892 () V!18677)

(declare-fun +!1715 (ListLongMap!7647 tuple2!8734) ListLongMap!7647)

(assert (=> b!471425 (not (contains!2542 (+!1715 lt!213887 (tuple2!8735 lt!213889 lt!213892)) lt!213886))))

(declare-fun addStillNotContains!162 (ListLongMap!7647 (_ BitVec 64) V!18677 (_ BitVec 64)) Unit!13837)

(assert (=> b!471425 (= lt!213891 (addStillNotContains!162 lt!213887 lt!213889 lt!213892 lt!213886))))

(assert (=> b!471425 (= lt!213886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!471425 (= lt!213892 (get!7058 (select (arr!14483 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!471425 (= lt!213889 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!471425 (= lt!213887 call!30447)))

(assert (=> b!471425 (= e!276289 (+!1715 call!30447 (tuple2!8735 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000) (get!7058 (select (arr!14483 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!471426 () Bool)

(assert (=> b!471426 (= e!276285 (= lt!213890 (getCurrentListMapNoExtraKeys!2002 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(assert (= (and d!75403 c!56979) b!471424))

(assert (= (and d!75403 (not c!56979)) b!471419))

(assert (= (and b!471419 c!56977) b!471425))

(assert (= (and b!471419 (not c!56977)) b!471423))

(assert (= (or b!471425 b!471423) bm!30444))

(assert (= (and d!75403 res!281633) b!471421))

(assert (= (and b!471421 res!281634) b!471420))

(assert (= (and b!471420 res!281635) b!471422))

(assert (= (and b!471420 c!56978) b!471416))

(assert (= (and b!471420 (not c!56978)) b!471418))

(assert (= (and b!471416 res!281632) b!471417))

(assert (= (and b!471418 c!56976) b!471426))

(assert (= (and b!471418 (not c!56976)) b!471415))

(declare-fun b_lambda!10153 () Bool)

(assert (=> (not b_lambda!10153) (not b!471417)))

(declare-fun t!14783 () Bool)

(declare-fun tb!3923 () Bool)

(assert (=> (and start!42232 (= defaultEntry!841 defaultEntry!841) t!14783) tb!3923))

(declare-fun result!7427 () Bool)

(assert (=> tb!3923 (= result!7427 tp_is_empty!13179)))

(assert (=> b!471417 t!14783))

(declare-fun b_and!20185 () Bool)

(assert (= b_and!20181 (and (=> t!14783 result!7427) b_and!20185)))

(declare-fun b_lambda!10155 () Bool)

(assert (=> (not b_lambda!10155) (not b!471425)))

(assert (=> b!471425 t!14783))

(declare-fun b_and!20187 () Bool)

(assert (= b_and!20185 (and (=> t!14783 result!7427) b_and!20187)))

(assert (=> b!471419 m!453539))

(assert (=> b!471419 m!453539))

(assert (=> b!471419 m!453549))

(declare-fun m!453553 () Bool)

(assert (=> b!471426 m!453553))

(assert (=> b!471422 m!453539))

(assert (=> b!471422 m!453539))

(assert (=> b!471422 m!453549))

(declare-fun m!453555 () Bool)

(assert (=> d!75403 m!453555))

(assert (=> d!75403 m!453515))

(assert (=> b!471416 m!453539))

(assert (=> b!471416 m!453539))

(declare-fun m!453557 () Bool)

(assert (=> b!471416 m!453557))

(assert (=> bm!30444 m!453553))

(declare-fun m!453559 () Bool)

(assert (=> b!471425 m!453559))

(declare-fun m!453561 () Bool)

(assert (=> b!471425 m!453561))

(declare-fun m!453563 () Bool)

(assert (=> b!471425 m!453563))

(declare-fun m!453565 () Bool)

(assert (=> b!471425 m!453565))

(declare-fun m!453567 () Bool)

(assert (=> b!471425 m!453567))

(assert (=> b!471425 m!453565))

(declare-fun m!453569 () Bool)

(assert (=> b!471425 m!453569))

(assert (=> b!471425 m!453539))

(assert (=> b!471425 m!453567))

(assert (=> b!471425 m!453559))

(declare-fun m!453571 () Bool)

(assert (=> b!471425 m!453571))

(assert (=> b!471417 m!453539))

(declare-fun m!453573 () Bool)

(assert (=> b!471417 m!453573))

(assert (=> b!471417 m!453565))

(assert (=> b!471417 m!453567))

(assert (=> b!471417 m!453565))

(assert (=> b!471417 m!453569))

(assert (=> b!471417 m!453539))

(assert (=> b!471417 m!453567))

(declare-fun m!453575 () Bool)

(assert (=> b!471421 m!453575))

(declare-fun m!453577 () Bool)

(assert (=> b!471415 m!453577))

(assert (=> b!471356 d!75403))

(declare-fun b!471429 () Bool)

(declare-fun e!276292 () Bool)

(declare-fun lt!213897 () ListLongMap!7647)

(assert (=> b!471429 (= e!276292 (isEmpty!576 lt!213897))))

(declare-fun b!471430 () Bool)

(declare-fun e!276297 () Bool)

(declare-fun e!276295 () Bool)

(assert (=> b!471430 (= e!276297 e!276295)))

(assert (=> b!471430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(declare-fun res!281636 () Bool)

(assert (=> b!471430 (= res!281636 (contains!2542 lt!213897 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471430 (=> (not res!281636) (not e!276295))))

(declare-fun b!471431 () Bool)

(assert (=> b!471431 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(assert (=> b!471431 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14835 _values!833)))))

(assert (=> b!471431 (= e!276295 (= (apply!329 lt!213897 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)) (get!7058 (select (arr!14483 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!471432 () Bool)

(assert (=> b!471432 (= e!276297 e!276292)))

(declare-fun c!56980 () Bool)

(assert (=> b!471432 (= c!56980 (bvslt #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(declare-fun b!471433 () Bool)

(declare-fun e!276293 () ListLongMap!7647)

(declare-fun e!276296 () ListLongMap!7647)

(assert (=> b!471433 (= e!276293 e!276296)))

(declare-fun c!56981 () Bool)

(assert (=> b!471433 (= c!56981 (validKeyInArray!0 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471434 () Bool)

(declare-fun e!276294 () Bool)

(assert (=> b!471434 (= e!276294 e!276297)))

(declare-fun c!56982 () Bool)

(declare-fun e!276291 () Bool)

(assert (=> b!471434 (= c!56982 e!276291)))

(declare-fun res!281639 () Bool)

(assert (=> b!471434 (=> (not res!281639) (not e!276291))))

(assert (=> b!471434 (= res!281639 (bvslt #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(declare-fun b!471435 () Bool)

(declare-fun res!281638 () Bool)

(assert (=> b!471435 (=> (not res!281638) (not e!276294))))

(assert (=> b!471435 (= res!281638 (not (contains!2542 lt!213897 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!30445 () Bool)

(declare-fun call!30448 () ListLongMap!7647)

(assert (=> bm!30445 (= call!30448 (getCurrentListMapNoExtraKeys!2002 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun d!75405 () Bool)

(assert (=> d!75405 e!276294))

(declare-fun res!281637 () Bool)

(assert (=> d!75405 (=> (not res!281637) (not e!276294))))

(assert (=> d!75405 (= res!281637 (not (contains!2542 lt!213897 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75405 (= lt!213897 e!276293)))

(declare-fun c!56983 () Bool)

(assert (=> d!75405 (= c!56983 (bvsge #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(assert (=> d!75405 (validMask!0 mask!1365)))

(assert (=> d!75405 (= (getCurrentListMapNoExtraKeys!2002 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213897)))

(declare-fun b!471436 () Bool)

(assert (=> b!471436 (= e!276291 (validKeyInArray!0 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471436 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!471437 () Bool)

(assert (=> b!471437 (= e!276296 call!30448)))

(declare-fun b!471438 () Bool)

(assert (=> b!471438 (= e!276293 (ListLongMap!7648 Nil!8813))))

(declare-fun b!471439 () Bool)

(declare-fun lt!213895 () Unit!13837)

(declare-fun lt!213898 () Unit!13837)

(assert (=> b!471439 (= lt!213895 lt!213898)))

(declare-fun lt!213899 () V!18677)

(declare-fun lt!213893 () (_ BitVec 64))

(declare-fun lt!213896 () (_ BitVec 64))

(declare-fun lt!213894 () ListLongMap!7647)

(assert (=> b!471439 (not (contains!2542 (+!1715 lt!213894 (tuple2!8735 lt!213896 lt!213899)) lt!213893))))

(assert (=> b!471439 (= lt!213898 (addStillNotContains!162 lt!213894 lt!213896 lt!213899 lt!213893))))

(assert (=> b!471439 (= lt!213893 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!471439 (= lt!213899 (get!7058 (select (arr!14483 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!471439 (= lt!213896 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!471439 (= lt!213894 call!30448)))

(assert (=> b!471439 (= e!276296 (+!1715 call!30448 (tuple2!8735 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000) (get!7058 (select (arr!14483 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!471440 () Bool)

(assert (=> b!471440 (= e!276292 (= lt!213897 (getCurrentListMapNoExtraKeys!2002 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(assert (= (and d!75405 c!56983) b!471438))

(assert (= (and d!75405 (not c!56983)) b!471433))

(assert (= (and b!471433 c!56981) b!471439))

(assert (= (and b!471433 (not c!56981)) b!471437))

(assert (= (or b!471439 b!471437) bm!30445))

(assert (= (and d!75405 res!281637) b!471435))

(assert (= (and b!471435 res!281638) b!471434))

(assert (= (and b!471434 res!281639) b!471436))

(assert (= (and b!471434 c!56982) b!471430))

(assert (= (and b!471434 (not c!56982)) b!471432))

(assert (= (and b!471430 res!281636) b!471431))

(assert (= (and b!471432 c!56980) b!471440))

(assert (= (and b!471432 (not c!56980)) b!471429))

(declare-fun b_lambda!10157 () Bool)

(assert (=> (not b_lambda!10157) (not b!471431)))

(assert (=> b!471431 t!14783))

(declare-fun b_and!20189 () Bool)

(assert (= b_and!20187 (and (=> t!14783 result!7427) b_and!20189)))

(declare-fun b_lambda!10159 () Bool)

(assert (=> (not b_lambda!10159) (not b!471439)))

(assert (=> b!471439 t!14783))

(declare-fun b_and!20191 () Bool)

(assert (= b_and!20189 (and (=> t!14783 result!7427) b_and!20191)))

(assert (=> b!471433 m!453539))

(assert (=> b!471433 m!453539))

(assert (=> b!471433 m!453549))

(declare-fun m!453579 () Bool)

(assert (=> b!471440 m!453579))

(assert (=> b!471436 m!453539))

(assert (=> b!471436 m!453539))

(assert (=> b!471436 m!453549))

(declare-fun m!453581 () Bool)

(assert (=> d!75405 m!453581))

(assert (=> d!75405 m!453515))

(assert (=> b!471430 m!453539))

(assert (=> b!471430 m!453539))

(declare-fun m!453583 () Bool)

(assert (=> b!471430 m!453583))

(assert (=> bm!30445 m!453579))

(declare-fun m!453585 () Bool)

(assert (=> b!471439 m!453585))

(declare-fun m!453587 () Bool)

(assert (=> b!471439 m!453587))

(declare-fun m!453589 () Bool)

(assert (=> b!471439 m!453589))

(assert (=> b!471439 m!453565))

(assert (=> b!471439 m!453567))

(assert (=> b!471439 m!453565))

(assert (=> b!471439 m!453569))

(assert (=> b!471439 m!453539))

(assert (=> b!471439 m!453567))

(assert (=> b!471439 m!453585))

(declare-fun m!453591 () Bool)

(assert (=> b!471439 m!453591))

(assert (=> b!471431 m!453539))

(declare-fun m!453593 () Bool)

(assert (=> b!471431 m!453593))

(assert (=> b!471431 m!453565))

(assert (=> b!471431 m!453567))

(assert (=> b!471431 m!453565))

(assert (=> b!471431 m!453569))

(assert (=> b!471431 m!453539))

(assert (=> b!471431 m!453567))

(declare-fun m!453595 () Bool)

(assert (=> b!471435 m!453595))

(declare-fun m!453597 () Bool)

(assert (=> b!471429 m!453597))

(assert (=> b!471356 d!75405))

(declare-fun d!75407 () Bool)

(assert (=> d!75407 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42232 d!75407))

(declare-fun d!75409 () Bool)

(assert (=> d!75409 (= (array_inv!10444 _keys!1025) (bvsge (size!14834 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42232 d!75409))

(declare-fun d!75411 () Bool)

(assert (=> d!75411 (= (array_inv!10445 _values!833) (bvsge (size!14835 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42232 d!75411))

(declare-fun b!471451 () Bool)

(declare-fun e!276309 () Bool)

(declare-fun e!276306 () Bool)

(assert (=> b!471451 (= e!276309 e!276306)))

(declare-fun c!56986 () Bool)

(assert (=> b!471451 (= c!56986 (validKeyInArray!0 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471452 () Bool)

(declare-fun e!276308 () Bool)

(declare-fun contains!2543 (List!8815 (_ BitVec 64)) Bool)

(assert (=> b!471452 (= e!276308 (contains!2543 Nil!8812 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471453 () Bool)

(declare-fun e!276307 () Bool)

(assert (=> b!471453 (= e!276307 e!276309)))

(declare-fun res!281646 () Bool)

(assert (=> b!471453 (=> (not res!281646) (not e!276309))))

(assert (=> b!471453 (= res!281646 (not e!276308))))

(declare-fun res!281648 () Bool)

(assert (=> b!471453 (=> (not res!281648) (not e!276308))))

(assert (=> b!471453 (= res!281648 (validKeyInArray!0 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30448 () Bool)

(declare-fun call!30451 () Bool)

(assert (=> bm!30448 (= call!30451 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56986 (Cons!8811 (select (arr!14482 _keys!1025) #b00000000000000000000000000000000) Nil!8812) Nil!8812)))))

(declare-fun b!471454 () Bool)

(assert (=> b!471454 (= e!276306 call!30451)))

(declare-fun b!471455 () Bool)

(assert (=> b!471455 (= e!276306 call!30451)))

(declare-fun d!75413 () Bool)

(declare-fun res!281647 () Bool)

(assert (=> d!75413 (=> res!281647 e!276307)))

(assert (=> d!75413 (= res!281647 (bvsge #b00000000000000000000000000000000 (size!14834 _keys!1025)))))

(assert (=> d!75413 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8812) e!276307)))

(assert (= (and d!75413 (not res!281647)) b!471453))

(assert (= (and b!471453 res!281648) b!471452))

(assert (= (and b!471453 res!281646) b!471451))

(assert (= (and b!471451 c!56986) b!471454))

(assert (= (and b!471451 (not c!56986)) b!471455))

(assert (= (or b!471454 b!471455) bm!30448))

(assert (=> b!471451 m!453539))

(assert (=> b!471451 m!453539))

(assert (=> b!471451 m!453549))

(assert (=> b!471452 m!453539))

(assert (=> b!471452 m!453539))

(declare-fun m!453599 () Bool)

(assert (=> b!471452 m!453599))

(assert (=> b!471453 m!453539))

(assert (=> b!471453 m!453539))

(assert (=> b!471453 m!453549))

(assert (=> bm!30448 m!453539))

(declare-fun m!453601 () Bool)

(assert (=> bm!30448 m!453601))

(assert (=> b!471354 d!75413))

(declare-fun b!471462 () Bool)

(declare-fun e!276314 () Bool)

(assert (=> b!471462 (= e!276314 tp_is_empty!13179)))

(declare-fun b!471463 () Bool)

(declare-fun e!276315 () Bool)

(assert (=> b!471463 (= e!276315 tp_is_empty!13179)))

(declare-fun mapNonEmpty!21478 () Bool)

(declare-fun mapRes!21478 () Bool)

(declare-fun tp!41287 () Bool)

(assert (=> mapNonEmpty!21478 (= mapRes!21478 (and tp!41287 e!276314))))

(declare-fun mapRest!21478 () (Array (_ BitVec 32) ValueCell!6246))

(declare-fun mapKey!21478 () (_ BitVec 32))

(declare-fun mapValue!21478 () ValueCell!6246)

(assert (=> mapNonEmpty!21478 (= mapRest!21472 (store mapRest!21478 mapKey!21478 mapValue!21478))))

(declare-fun mapIsEmpty!21478 () Bool)

(assert (=> mapIsEmpty!21478 mapRes!21478))

(declare-fun condMapEmpty!21478 () Bool)

(declare-fun mapDefault!21478 () ValueCell!6246)

(assert (=> mapNonEmpty!21472 (= condMapEmpty!21478 (= mapRest!21472 ((as const (Array (_ BitVec 32) ValueCell!6246)) mapDefault!21478)))))

(assert (=> mapNonEmpty!21472 (= tp!41277 (and e!276315 mapRes!21478))))

(assert (= (and mapNonEmpty!21472 condMapEmpty!21478) mapIsEmpty!21478))

(assert (= (and mapNonEmpty!21472 (not condMapEmpty!21478)) mapNonEmpty!21478))

(assert (= (and mapNonEmpty!21478 ((_ is ValueCellFull!6246) mapValue!21478)) b!471462))

(assert (= (and mapNonEmpty!21472 ((_ is ValueCellFull!6246) mapDefault!21478)) b!471463))

(declare-fun m!453603 () Bool)

(assert (=> mapNonEmpty!21478 m!453603))

(declare-fun b_lambda!10161 () Bool)

(assert (= b_lambda!10159 (or (and start!42232 b_free!11751) b_lambda!10161)))

(declare-fun b_lambda!10163 () Bool)

(assert (= b_lambda!10157 (or (and start!42232 b_free!11751) b_lambda!10163)))

(declare-fun b_lambda!10165 () Bool)

(assert (= b_lambda!10155 (or (and start!42232 b_free!11751) b_lambda!10165)))

(declare-fun b_lambda!10167 () Bool)

(assert (= b_lambda!10153 (or (and start!42232 b_free!11751) b_lambda!10167)))

(check-sat (not b!471417) (not bm!30445) (not b!471415) b_and!20191 (not b_lambda!10165) (not b!471426) tp_is_empty!13179 (not b!471453) (not b!471419) (not b!471430) (not b_lambda!10167) (not b!471429) (not b!471421) (not b!471439) (not mapNonEmpty!21478) (not b_lambda!10161) (not b!471416) (not b!471390) (not d!75405) (not b!471425) (not d!75401) (not b!471452) (not b!471451) (not b!471387) (not b!471433) (not d!75403) (not bm!30441) (not b!471436) (not b_next!11751) (not b!471422) (not b_lambda!10163) (not bm!30448) (not b!471431) (not bm!30444) (not b!471435) (not b!471440))
(check-sat b_and!20191 (not b_next!11751))
