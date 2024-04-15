; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41718 () Bool)

(assert start!41718)

(declare-fun b_free!11371 () Bool)

(declare-fun b_next!11371 () Bool)

(assert (=> start!41718 (= b_free!11371 (not b_next!11371))))

(declare-fun tp!40117 () Bool)

(declare-fun b_and!19701 () Bool)

(assert (=> start!41718 (= tp!40117 b_and!19701)))

(declare-fun b!465717 () Bool)

(declare-fun e!272240 () Bool)

(declare-datatypes ((array!29375 0))(
  ( (array!29376 (arr!14117 (Array (_ BitVec 32) (_ BitVec 64))) (size!14470 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29375)

(assert (=> b!465717 (= e!272240 (bvsle #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun b!465718 () Bool)

(declare-fun res!278431 () Bool)

(declare-fun e!272242 () Bool)

(assert (=> b!465718 (=> (not res!278431) (not e!272242))))

(declare-datatypes ((List!8575 0))(
  ( (Nil!8572) (Cons!8571 (h!9427 (_ BitVec 64)) (t!14516 List!8575)) )
))
(declare-fun arrayNoDuplicates!0 (array!29375 (_ BitVec 32) List!8575) Bool)

(assert (=> b!465718 (= res!278431 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8572))))

(declare-fun b!465719 () Bool)

(declare-fun res!278428 () Bool)

(assert (=> b!465719 (=> (not res!278428) (not e!272242))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29375 (_ BitVec 32)) Bool)

(assert (=> b!465719 (= res!278428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465720 () Bool)

(declare-fun e!272243 () Bool)

(declare-fun tp_is_empty!12799 () Bool)

(assert (=> b!465720 (= e!272243 tp_is_empty!12799)))

(declare-fun res!278427 () Bool)

(assert (=> start!41718 (=> (not res!278427) (not e!272242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41718 (= res!278427 (validMask!0 mask!1365))))

(assert (=> start!41718 e!272242))

(assert (=> start!41718 tp_is_empty!12799))

(assert (=> start!41718 tp!40117))

(assert (=> start!41718 true))

(declare-fun array_inv!10276 (array!29375) Bool)

(assert (=> start!41718 (array_inv!10276 _keys!1025)))

(declare-datatypes ((V!18171 0))(
  ( (V!18172 (val!6444 Int)) )
))
(declare-datatypes ((ValueCell!6056 0))(
  ( (ValueCellFull!6056 (v!8725 V!18171)) (EmptyCell!6056) )
))
(declare-datatypes ((array!29377 0))(
  ( (array!29378 (arr!14118 (Array (_ BitVec 32) ValueCell!6056)) (size!14471 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29377)

(declare-fun e!272241 () Bool)

(declare-fun array_inv!10277 (array!29377) Bool)

(assert (=> start!41718 (and (array_inv!10277 _values!833) e!272241)))

(declare-fun b!465721 () Bool)

(declare-fun res!278429 () Bool)

(assert (=> b!465721 (=> res!278429 e!272240)))

(declare-fun minValueBefore!38 () V!18171)

(declare-fun zeroValue!794 () V!18171)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18171)

(declare-datatypes ((tuple2!8492 0))(
  ( (tuple2!8493 (_1!4257 (_ BitVec 64)) (_2!4257 V!18171)) )
))
(declare-datatypes ((List!8576 0))(
  ( (Nil!8573) (Cons!8572 (h!9428 tuple2!8492) (t!14517 List!8576)) )
))
(declare-datatypes ((ListLongMap!7395 0))(
  ( (ListLongMap!7396 (toList!3713 List!8576)) )
))
(declare-fun +!1686 (ListLongMap!7395 tuple2!8492) ListLongMap!7395)

(declare-fun getCurrentListMap!2105 (array!29375 array!29377 (_ BitVec 32) (_ BitVec 32) V!18171 V!18171 (_ BitVec 32) Int) ListLongMap!7395)

(assert (=> b!465721 (= res!278429 (not (= (+!1686 (getCurrentListMap!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))))

(declare-fun b!465722 () Bool)

(assert (=> b!465722 (= e!272242 (not e!272240))))

(declare-fun res!278430 () Bool)

(assert (=> b!465722 (=> res!278430 e!272240)))

(assert (=> b!465722 (= res!278430 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210264 () ListLongMap!7395)

(declare-fun lt!210265 () ListLongMap!7395)

(assert (=> b!465722 (= lt!210264 lt!210265)))

(declare-datatypes ((Unit!13534 0))(
  ( (Unit!13535) )
))
(declare-fun lt!210263 () Unit!13534)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!58 (array!29375 array!29377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18171 V!18171 V!18171 V!18171 (_ BitVec 32) Int) Unit!13534)

(assert (=> b!465722 (= lt!210263 (lemmaNoChangeToArrayThenSameMapNoExtras!58 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1901 (array!29375 array!29377 (_ BitVec 32) (_ BitVec 32) V!18171 V!18171 (_ BitVec 32) Int) ListLongMap!7395)

(assert (=> b!465722 (= lt!210265 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465722 (= lt!210264 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465723 () Bool)

(declare-fun e!272239 () Bool)

(declare-fun mapRes!20881 () Bool)

(assert (=> b!465723 (= e!272241 (and e!272239 mapRes!20881))))

(declare-fun condMapEmpty!20881 () Bool)

(declare-fun mapDefault!20881 () ValueCell!6056)

(assert (=> b!465723 (= condMapEmpty!20881 (= (arr!14118 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6056)) mapDefault!20881)))))

(declare-fun b!465724 () Bool)

(assert (=> b!465724 (= e!272239 tp_is_empty!12799)))

(declare-fun b!465725 () Bool)

(declare-fun res!278426 () Bool)

(assert (=> b!465725 (=> (not res!278426) (not e!272242))))

(assert (=> b!465725 (= res!278426 (and (= (size!14471 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14470 _keys!1025) (size!14471 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20881 () Bool)

(assert (=> mapIsEmpty!20881 mapRes!20881))

(declare-fun mapNonEmpty!20881 () Bool)

(declare-fun tp!40116 () Bool)

(assert (=> mapNonEmpty!20881 (= mapRes!20881 (and tp!40116 e!272243))))

(declare-fun mapRest!20881 () (Array (_ BitVec 32) ValueCell!6056))

(declare-fun mapKey!20881 () (_ BitVec 32))

(declare-fun mapValue!20881 () ValueCell!6056)

(assert (=> mapNonEmpty!20881 (= (arr!14118 _values!833) (store mapRest!20881 mapKey!20881 mapValue!20881))))

(assert (= (and start!41718 res!278427) b!465725))

(assert (= (and b!465725 res!278426) b!465719))

(assert (= (and b!465719 res!278428) b!465718))

(assert (= (and b!465718 res!278431) b!465722))

(assert (= (and b!465722 (not res!278430)) b!465721))

(assert (= (and b!465721 (not res!278429)) b!465717))

(assert (= (and b!465723 condMapEmpty!20881) mapIsEmpty!20881))

(assert (= (and b!465723 (not condMapEmpty!20881)) mapNonEmpty!20881))

(get-info :version)

(assert (= (and mapNonEmpty!20881 ((_ is ValueCellFull!6056) mapValue!20881)) b!465720))

(assert (= (and b!465723 ((_ is ValueCellFull!6056) mapDefault!20881)) b!465724))

(assert (= start!41718 b!465723))

(declare-fun m!447483 () Bool)

(assert (=> mapNonEmpty!20881 m!447483))

(declare-fun m!447485 () Bool)

(assert (=> b!465719 m!447485))

(declare-fun m!447487 () Bool)

(assert (=> b!465721 m!447487))

(assert (=> b!465721 m!447487))

(declare-fun m!447489 () Bool)

(assert (=> b!465721 m!447489))

(declare-fun m!447491 () Bool)

(assert (=> b!465721 m!447491))

(declare-fun m!447493 () Bool)

(assert (=> b!465722 m!447493))

(declare-fun m!447495 () Bool)

(assert (=> b!465722 m!447495))

(declare-fun m!447497 () Bool)

(assert (=> b!465722 m!447497))

(declare-fun m!447499 () Bool)

(assert (=> b!465718 m!447499))

(declare-fun m!447501 () Bool)

(assert (=> start!41718 m!447501))

(declare-fun m!447503 () Bool)

(assert (=> start!41718 m!447503))

(declare-fun m!447505 () Bool)

(assert (=> start!41718 m!447505))

(check-sat b_and!19701 (not b_next!11371) (not b!465721) (not start!41718) (not mapNonEmpty!20881) (not b!465718) tp_is_empty!12799 (not b!465722) (not b!465719))
(check-sat b_and!19701 (not b_next!11371))
(get-model)

(declare-fun b!465788 () Bool)

(declare-fun e!272288 () Bool)

(declare-fun call!30216 () Bool)

(assert (=> b!465788 (= e!272288 call!30216)))

(declare-fun b!465789 () Bool)

(declare-fun e!272286 () Bool)

(assert (=> b!465789 (= e!272286 call!30216)))

(declare-fun b!465790 () Bool)

(declare-fun e!272287 () Bool)

(assert (=> b!465790 (= e!272287 e!272286)))

(declare-fun c!56628 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!465790 (= c!56628 (validKeyInArray!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30213 () Bool)

(assert (=> bm!30213 (= call!30216 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!465791 () Bool)

(assert (=> b!465791 (= e!272286 e!272288)))

(declare-fun lt!210291 () (_ BitVec 64))

(assert (=> b!465791 (= lt!210291 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210290 () Unit!13534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29375 (_ BitVec 64) (_ BitVec 32)) Unit!13534)

(assert (=> b!465791 (= lt!210290 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!210291 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!465791 (arrayContainsKey!0 _keys!1025 lt!210291 #b00000000000000000000000000000000)))

(declare-fun lt!210292 () Unit!13534)

(assert (=> b!465791 (= lt!210292 lt!210290)))

(declare-fun res!278473 () Bool)

(declare-datatypes ((SeekEntryResult!3541 0))(
  ( (MissingZero!3541 (index!16343 (_ BitVec 32))) (Found!3541 (index!16344 (_ BitVec 32))) (Intermediate!3541 (undefined!4353 Bool) (index!16345 (_ BitVec 32)) (x!43574 (_ BitVec 32))) (Undefined!3541) (MissingVacant!3541 (index!16346 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29375 (_ BitVec 32)) SeekEntryResult!3541)

(assert (=> b!465791 (= res!278473 (= (seekEntryOrOpen!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3541 #b00000000000000000000000000000000)))))

(assert (=> b!465791 (=> (not res!278473) (not e!272288))))

(declare-fun d!74919 () Bool)

(declare-fun res!278472 () Bool)

(assert (=> d!74919 (=> res!278472 e!272287)))

(assert (=> d!74919 (= res!278472 (bvsge #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(assert (=> d!74919 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!272287)))

(assert (= (and d!74919 (not res!278472)) b!465790))

(assert (= (and b!465790 c!56628) b!465791))

(assert (= (and b!465790 (not c!56628)) b!465789))

(assert (= (and b!465791 res!278473) b!465788))

(assert (= (or b!465788 b!465789) bm!30213))

(declare-fun m!447555 () Bool)

(assert (=> b!465790 m!447555))

(assert (=> b!465790 m!447555))

(declare-fun m!447557 () Bool)

(assert (=> b!465790 m!447557))

(declare-fun m!447559 () Bool)

(assert (=> bm!30213 m!447559))

(assert (=> b!465791 m!447555))

(declare-fun m!447561 () Bool)

(assert (=> b!465791 m!447561))

(declare-fun m!447563 () Bool)

(assert (=> b!465791 m!447563))

(assert (=> b!465791 m!447555))

(declare-fun m!447565 () Bool)

(assert (=> b!465791 m!447565))

(assert (=> b!465719 d!74919))

(declare-fun d!74921 () Bool)

(assert (=> d!74921 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41718 d!74921))

(declare-fun d!74923 () Bool)

(assert (=> d!74923 (= (array_inv!10276 _keys!1025) (bvsge (size!14470 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41718 d!74923))

(declare-fun d!74925 () Bool)

(assert (=> d!74925 (= (array_inv!10277 _values!833) (bvsge (size!14471 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41718 d!74925))

(declare-fun d!74927 () Bool)

(assert (=> d!74927 (= (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210295 () Unit!13534)

(declare-fun choose!1346 (array!29375 array!29377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18171 V!18171 V!18171 V!18171 (_ BitVec 32) Int) Unit!13534)

(assert (=> d!74927 (= lt!210295 (choose!1346 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!74927 (validMask!0 mask!1365)))

(assert (=> d!74927 (= (lemmaNoChangeToArrayThenSameMapNoExtras!58 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210295)))

(declare-fun bs!14720 () Bool)

(assert (= bs!14720 d!74927))

(assert (=> bs!14720 m!447497))

(assert (=> bs!14720 m!447495))

(declare-fun m!447567 () Bool)

(assert (=> bs!14720 m!447567))

(assert (=> bs!14720 m!447501))

(assert (=> b!465722 d!74927))

(declare-fun bm!30216 () Bool)

(declare-fun call!30219 () ListLongMap!7395)

(assert (=> bm!30216 (= call!30219 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!465816 () Bool)

(declare-fun e!272303 () Bool)

(declare-fun lt!210315 () ListLongMap!7395)

(declare-fun isEmpty!573 (ListLongMap!7395) Bool)

(assert (=> b!465816 (= e!272303 (isEmpty!573 lt!210315))))

(declare-fun b!465817 () Bool)

(assert (=> b!465817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(assert (=> b!465817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _values!833)))))

(declare-fun e!272304 () Bool)

(declare-fun apply!322 (ListLongMap!7395 (_ BitVec 64)) V!18171)

(declare-fun get!6931 (ValueCell!6056 V!18171) V!18171)

(declare-fun dynLambda!918 (Int (_ BitVec 64)) V!18171)

(assert (=> b!465817 (= e!272304 (= (apply!322 lt!210315 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)) (get!6931 (select (arr!14118 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!465818 () Bool)

(declare-fun res!278484 () Bool)

(declare-fun e!272309 () Bool)

(assert (=> b!465818 (=> (not res!278484) (not e!272309))))

(declare-fun contains!2515 (ListLongMap!7395 (_ BitVec 64)) Bool)

(assert (=> b!465818 (= res!278484 (not (contains!2515 lt!210315 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!465819 () Bool)

(declare-fun e!272308 () Bool)

(assert (=> b!465819 (= e!272308 e!272304)))

(assert (=> b!465819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun res!278485 () Bool)

(assert (=> b!465819 (= res!278485 (contains!2515 lt!210315 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465819 (=> (not res!278485) (not e!272304))))

(declare-fun b!465820 () Bool)

(declare-fun e!272305 () ListLongMap!7395)

(assert (=> b!465820 (= e!272305 call!30219)))

(declare-fun d!74929 () Bool)

(assert (=> d!74929 e!272309))

(declare-fun res!278482 () Bool)

(assert (=> d!74929 (=> (not res!278482) (not e!272309))))

(assert (=> d!74929 (= res!278482 (not (contains!2515 lt!210315 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!272307 () ListLongMap!7395)

(assert (=> d!74929 (= lt!210315 e!272307)))

(declare-fun c!56639 () Bool)

(assert (=> d!74929 (= c!56639 (bvsge #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(assert (=> d!74929 (validMask!0 mask!1365)))

(assert (=> d!74929 (= (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210315)))

(declare-fun b!465821 () Bool)

(declare-fun lt!210310 () Unit!13534)

(declare-fun lt!210311 () Unit!13534)

(assert (=> b!465821 (= lt!210310 lt!210311)))

(declare-fun lt!210312 () (_ BitVec 64))

(declare-fun lt!210313 () ListLongMap!7395)

(declare-fun lt!210316 () (_ BitVec 64))

(declare-fun lt!210314 () V!18171)

(assert (=> b!465821 (not (contains!2515 (+!1686 lt!210313 (tuple2!8493 lt!210312 lt!210314)) lt!210316))))

(declare-fun addStillNotContains!156 (ListLongMap!7395 (_ BitVec 64) V!18171 (_ BitVec 64)) Unit!13534)

(assert (=> b!465821 (= lt!210311 (addStillNotContains!156 lt!210313 lt!210312 lt!210314 lt!210316))))

(assert (=> b!465821 (= lt!210316 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!465821 (= lt!210314 (get!6931 (select (arr!14118 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!465821 (= lt!210312 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!465821 (= lt!210313 call!30219)))

(assert (=> b!465821 (= e!272305 (+!1686 call!30219 (tuple2!8493 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000) (get!6931 (select (arr!14118 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!465822 () Bool)

(assert (=> b!465822 (= e!272308 e!272303)))

(declare-fun c!56637 () Bool)

(assert (=> b!465822 (= c!56637 (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun b!465823 () Bool)

(assert (=> b!465823 (= e!272307 e!272305)))

(declare-fun c!56640 () Bool)

(assert (=> b!465823 (= c!56640 (validKeyInArray!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465824 () Bool)

(assert (=> b!465824 (= e!272309 e!272308)))

(declare-fun c!56638 () Bool)

(declare-fun e!272306 () Bool)

(assert (=> b!465824 (= c!56638 e!272306)))

(declare-fun res!278483 () Bool)

(assert (=> b!465824 (=> (not res!278483) (not e!272306))))

(assert (=> b!465824 (= res!278483 (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun b!465825 () Bool)

(assert (=> b!465825 (= e!272303 (= lt!210315 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!465826 () Bool)

(assert (=> b!465826 (= e!272307 (ListLongMap!7396 Nil!8573))))

(declare-fun b!465827 () Bool)

(assert (=> b!465827 (= e!272306 (validKeyInArray!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465827 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!74929 c!56639) b!465826))

(assert (= (and d!74929 (not c!56639)) b!465823))

(assert (= (and b!465823 c!56640) b!465821))

(assert (= (and b!465823 (not c!56640)) b!465820))

(assert (= (or b!465821 b!465820) bm!30216))

(assert (= (and d!74929 res!278482) b!465818))

(assert (= (and b!465818 res!278484) b!465824))

(assert (= (and b!465824 res!278483) b!465827))

(assert (= (and b!465824 c!56638) b!465819))

(assert (= (and b!465824 (not c!56638)) b!465822))

(assert (= (and b!465819 res!278485) b!465817))

(assert (= (and b!465822 c!56637) b!465825))

(assert (= (and b!465822 (not c!56637)) b!465816))

(declare-fun b_lambda!9987 () Bool)

(assert (=> (not b_lambda!9987) (not b!465817)))

(declare-fun t!14521 () Bool)

(declare-fun tb!3901 () Bool)

(assert (=> (and start!41718 (= defaultEntry!841 defaultEntry!841) t!14521) tb!3901))

(declare-fun result!7377 () Bool)

(assert (=> tb!3901 (= result!7377 tp_is_empty!12799)))

(assert (=> b!465817 t!14521))

(declare-fun b_and!19707 () Bool)

(assert (= b_and!19701 (and (=> t!14521 result!7377) b_and!19707)))

(declare-fun b_lambda!9989 () Bool)

(assert (=> (not b_lambda!9989) (not b!465821)))

(assert (=> b!465821 t!14521))

(declare-fun b_and!19709 () Bool)

(assert (= b_and!19707 (and (=> t!14521 result!7377) b_and!19709)))

(declare-fun m!447569 () Bool)

(assert (=> b!465818 m!447569))

(declare-fun m!447571 () Bool)

(assert (=> bm!30216 m!447571))

(assert (=> b!465827 m!447555))

(assert (=> b!465827 m!447555))

(assert (=> b!465827 m!447557))

(assert (=> b!465825 m!447571))

(assert (=> b!465817 m!447555))

(declare-fun m!447573 () Bool)

(assert (=> b!465817 m!447573))

(assert (=> b!465817 m!447555))

(declare-fun m!447575 () Bool)

(assert (=> b!465817 m!447575))

(declare-fun m!447577 () Bool)

(assert (=> b!465817 m!447577))

(assert (=> b!465817 m!447575))

(assert (=> b!465817 m!447577))

(declare-fun m!447579 () Bool)

(assert (=> b!465817 m!447579))

(assert (=> b!465819 m!447555))

(assert (=> b!465819 m!447555))

(declare-fun m!447581 () Bool)

(assert (=> b!465819 m!447581))

(declare-fun m!447583 () Bool)

(assert (=> d!74929 m!447583))

(assert (=> d!74929 m!447501))

(declare-fun m!447585 () Bool)

(assert (=> b!465821 m!447585))

(declare-fun m!447587 () Bool)

(assert (=> b!465821 m!447587))

(declare-fun m!447589 () Bool)

(assert (=> b!465821 m!447589))

(assert (=> b!465821 m!447555))

(assert (=> b!465821 m!447575))

(assert (=> b!465821 m!447577))

(assert (=> b!465821 m!447575))

(assert (=> b!465821 m!447577))

(assert (=> b!465821 m!447579))

(declare-fun m!447591 () Bool)

(assert (=> b!465821 m!447591))

(assert (=> b!465821 m!447585))

(assert (=> b!465823 m!447555))

(assert (=> b!465823 m!447555))

(assert (=> b!465823 m!447557))

(declare-fun m!447593 () Bool)

(assert (=> b!465816 m!447593))

(assert (=> b!465722 d!74929))

(declare-fun call!30220 () ListLongMap!7395)

(declare-fun bm!30217 () Bool)

(assert (=> bm!30217 (= call!30220 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!465830 () Bool)

(declare-fun e!272310 () Bool)

(declare-fun lt!210322 () ListLongMap!7395)

(assert (=> b!465830 (= e!272310 (isEmpty!573 lt!210322))))

(declare-fun b!465831 () Bool)

(assert (=> b!465831 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(assert (=> b!465831 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _values!833)))))

(declare-fun e!272311 () Bool)

(assert (=> b!465831 (= e!272311 (= (apply!322 lt!210322 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)) (get!6931 (select (arr!14118 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!465832 () Bool)

(declare-fun res!278488 () Bool)

(declare-fun e!272316 () Bool)

(assert (=> b!465832 (=> (not res!278488) (not e!272316))))

(assert (=> b!465832 (= res!278488 (not (contains!2515 lt!210322 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!465833 () Bool)

(declare-fun e!272315 () Bool)

(assert (=> b!465833 (= e!272315 e!272311)))

(assert (=> b!465833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun res!278489 () Bool)

(assert (=> b!465833 (= res!278489 (contains!2515 lt!210322 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465833 (=> (not res!278489) (not e!272311))))

(declare-fun b!465834 () Bool)

(declare-fun e!272312 () ListLongMap!7395)

(assert (=> b!465834 (= e!272312 call!30220)))

(declare-fun d!74931 () Bool)

(assert (=> d!74931 e!272316))

(declare-fun res!278486 () Bool)

(assert (=> d!74931 (=> (not res!278486) (not e!272316))))

(assert (=> d!74931 (= res!278486 (not (contains!2515 lt!210322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!272314 () ListLongMap!7395)

(assert (=> d!74931 (= lt!210322 e!272314)))

(declare-fun c!56643 () Bool)

(assert (=> d!74931 (= c!56643 (bvsge #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(assert (=> d!74931 (validMask!0 mask!1365)))

(assert (=> d!74931 (= (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210322)))

(declare-fun b!465835 () Bool)

(declare-fun lt!210317 () Unit!13534)

(declare-fun lt!210318 () Unit!13534)

(assert (=> b!465835 (= lt!210317 lt!210318)))

(declare-fun lt!210320 () ListLongMap!7395)

(declare-fun lt!210323 () (_ BitVec 64))

(declare-fun lt!210319 () (_ BitVec 64))

(declare-fun lt!210321 () V!18171)

(assert (=> b!465835 (not (contains!2515 (+!1686 lt!210320 (tuple2!8493 lt!210319 lt!210321)) lt!210323))))

(assert (=> b!465835 (= lt!210318 (addStillNotContains!156 lt!210320 lt!210319 lt!210321 lt!210323))))

(assert (=> b!465835 (= lt!210323 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!465835 (= lt!210321 (get!6931 (select (arr!14118 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!465835 (= lt!210319 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!465835 (= lt!210320 call!30220)))

(assert (=> b!465835 (= e!272312 (+!1686 call!30220 (tuple2!8493 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000) (get!6931 (select (arr!14118 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!465836 () Bool)

(assert (=> b!465836 (= e!272315 e!272310)))

(declare-fun c!56641 () Bool)

(assert (=> b!465836 (= c!56641 (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun b!465837 () Bool)

(assert (=> b!465837 (= e!272314 e!272312)))

(declare-fun c!56644 () Bool)

(assert (=> b!465837 (= c!56644 (validKeyInArray!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465838 () Bool)

(assert (=> b!465838 (= e!272316 e!272315)))

(declare-fun c!56642 () Bool)

(declare-fun e!272313 () Bool)

(assert (=> b!465838 (= c!56642 e!272313)))

(declare-fun res!278487 () Bool)

(assert (=> b!465838 (=> (not res!278487) (not e!272313))))

(assert (=> b!465838 (= res!278487 (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun b!465839 () Bool)

(assert (=> b!465839 (= e!272310 (= lt!210322 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!465840 () Bool)

(assert (=> b!465840 (= e!272314 (ListLongMap!7396 Nil!8573))))

(declare-fun b!465841 () Bool)

(assert (=> b!465841 (= e!272313 (validKeyInArray!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465841 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!74931 c!56643) b!465840))

(assert (= (and d!74931 (not c!56643)) b!465837))

(assert (= (and b!465837 c!56644) b!465835))

(assert (= (and b!465837 (not c!56644)) b!465834))

(assert (= (or b!465835 b!465834) bm!30217))

(assert (= (and d!74931 res!278486) b!465832))

(assert (= (and b!465832 res!278488) b!465838))

(assert (= (and b!465838 res!278487) b!465841))

(assert (= (and b!465838 c!56642) b!465833))

(assert (= (and b!465838 (not c!56642)) b!465836))

(assert (= (and b!465833 res!278489) b!465831))

(assert (= (and b!465836 c!56641) b!465839))

(assert (= (and b!465836 (not c!56641)) b!465830))

(declare-fun b_lambda!9991 () Bool)

(assert (=> (not b_lambda!9991) (not b!465831)))

(assert (=> b!465831 t!14521))

(declare-fun b_and!19711 () Bool)

(assert (= b_and!19709 (and (=> t!14521 result!7377) b_and!19711)))

(declare-fun b_lambda!9993 () Bool)

(assert (=> (not b_lambda!9993) (not b!465835)))

(assert (=> b!465835 t!14521))

(declare-fun b_and!19713 () Bool)

(assert (= b_and!19711 (and (=> t!14521 result!7377) b_and!19713)))

(declare-fun m!447595 () Bool)

(assert (=> b!465832 m!447595))

(declare-fun m!447597 () Bool)

(assert (=> bm!30217 m!447597))

(assert (=> b!465841 m!447555))

(assert (=> b!465841 m!447555))

(assert (=> b!465841 m!447557))

(assert (=> b!465839 m!447597))

(assert (=> b!465831 m!447555))

(declare-fun m!447599 () Bool)

(assert (=> b!465831 m!447599))

(assert (=> b!465831 m!447555))

(assert (=> b!465831 m!447575))

(assert (=> b!465831 m!447577))

(assert (=> b!465831 m!447575))

(assert (=> b!465831 m!447577))

(assert (=> b!465831 m!447579))

(assert (=> b!465833 m!447555))

(assert (=> b!465833 m!447555))

(declare-fun m!447601 () Bool)

(assert (=> b!465833 m!447601))

(declare-fun m!447603 () Bool)

(assert (=> d!74931 m!447603))

(assert (=> d!74931 m!447501))

(declare-fun m!447605 () Bool)

(assert (=> b!465835 m!447605))

(declare-fun m!447607 () Bool)

(assert (=> b!465835 m!447607))

(declare-fun m!447609 () Bool)

(assert (=> b!465835 m!447609))

(assert (=> b!465835 m!447555))

(assert (=> b!465835 m!447575))

(assert (=> b!465835 m!447577))

(assert (=> b!465835 m!447575))

(assert (=> b!465835 m!447577))

(assert (=> b!465835 m!447579))

(declare-fun m!447611 () Bool)

(assert (=> b!465835 m!447611))

(assert (=> b!465835 m!447605))

(assert (=> b!465837 m!447555))

(assert (=> b!465837 m!447555))

(assert (=> b!465837 m!447557))

(declare-fun m!447613 () Bool)

(assert (=> b!465830 m!447613))

(assert (=> b!465722 d!74931))

(declare-fun d!74933 () Bool)

(declare-fun e!272319 () Bool)

(assert (=> d!74933 e!272319))

(declare-fun res!278494 () Bool)

(assert (=> d!74933 (=> (not res!278494) (not e!272319))))

(declare-fun lt!210332 () ListLongMap!7395)

(assert (=> d!74933 (= res!278494 (contains!2515 lt!210332 (_1!4257 (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!210333 () List!8576)

(assert (=> d!74933 (= lt!210332 (ListLongMap!7396 lt!210333))))

(declare-fun lt!210335 () Unit!13534)

(declare-fun lt!210334 () Unit!13534)

(assert (=> d!74933 (= lt!210335 lt!210334)))

(declare-datatypes ((Option!380 0))(
  ( (Some!379 (v!8728 V!18171)) (None!378) )
))
(declare-fun getValueByKey!374 (List!8576 (_ BitVec 64)) Option!380)

(assert (=> d!74933 (= (getValueByKey!374 lt!210333 (_1!4257 (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!379 (_2!4257 (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!199 (List!8576 (_ BitVec 64) V!18171) Unit!13534)

(assert (=> d!74933 (= lt!210334 (lemmaContainsTupThenGetReturnValue!199 lt!210333 (_1!4257 (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4257 (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!202 (List!8576 (_ BitVec 64) V!18171) List!8576)

(assert (=> d!74933 (= lt!210333 (insertStrictlySorted!202 (toList!3713 (getCurrentListMap!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4257 (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4257 (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!74933 (= (+!1686 (getCurrentListMap!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!210332)))

(declare-fun b!465846 () Bool)

(declare-fun res!278495 () Bool)

(assert (=> b!465846 (=> (not res!278495) (not e!272319))))

(assert (=> b!465846 (= res!278495 (= (getValueByKey!374 (toList!3713 lt!210332) (_1!4257 (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!379 (_2!4257 (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!465847 () Bool)

(declare-fun contains!2516 (List!8576 tuple2!8492) Bool)

(assert (=> b!465847 (= e!272319 (contains!2516 (toList!3713 lt!210332) (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!74933 res!278494) b!465846))

(assert (= (and b!465846 res!278495) b!465847))

(declare-fun m!447615 () Bool)

(assert (=> d!74933 m!447615))

(declare-fun m!447617 () Bool)

(assert (=> d!74933 m!447617))

(declare-fun m!447619 () Bool)

(assert (=> d!74933 m!447619))

(declare-fun m!447621 () Bool)

(assert (=> d!74933 m!447621))

(declare-fun m!447623 () Bool)

(assert (=> b!465846 m!447623))

(declare-fun m!447625 () Bool)

(assert (=> b!465847 m!447625))

(assert (=> b!465721 d!74933))

(declare-fun b!465890 () Bool)

(declare-fun e!272353 () ListLongMap!7395)

(declare-fun call!30236 () ListLongMap!7395)

(assert (=> b!465890 (= e!272353 call!30236)))

(declare-fun b!465891 () Bool)

(declare-fun e!272351 () Bool)

(declare-fun lt!210401 () ListLongMap!7395)

(assert (=> b!465891 (= e!272351 (= (apply!322 lt!210401 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!465892 () Bool)

(declare-fun call!30238 () ListLongMap!7395)

(assert (=> b!465892 (= e!272353 call!30238)))

(declare-fun b!465893 () Bool)

(declare-fun e!272354 () Bool)

(declare-fun call!30239 () Bool)

(assert (=> b!465893 (= e!272354 (not call!30239))))

(declare-fun b!465894 () Bool)

(declare-fun e!272355 () Bool)

(declare-fun e!272356 () Bool)

(assert (=> b!465894 (= e!272355 e!272356)))

(declare-fun c!56661 () Bool)

(assert (=> b!465894 (= c!56661 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!465895 () Bool)

(declare-fun e!272348 () Unit!13534)

(declare-fun lt!210400 () Unit!13534)

(assert (=> b!465895 (= e!272348 lt!210400)))

(declare-fun lt!210397 () ListLongMap!7395)

(assert (=> b!465895 (= lt!210397 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210382 () (_ BitVec 64))

(assert (=> b!465895 (= lt!210382 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210396 () (_ BitVec 64))

(assert (=> b!465895 (= lt!210396 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210392 () Unit!13534)

(declare-fun addStillContains!285 (ListLongMap!7395 (_ BitVec 64) V!18171 (_ BitVec 64)) Unit!13534)

(assert (=> b!465895 (= lt!210392 (addStillContains!285 lt!210397 lt!210382 zeroValue!794 lt!210396))))

(assert (=> b!465895 (contains!2515 (+!1686 lt!210397 (tuple2!8493 lt!210382 zeroValue!794)) lt!210396)))

(declare-fun lt!210388 () Unit!13534)

(assert (=> b!465895 (= lt!210388 lt!210392)))

(declare-fun lt!210399 () ListLongMap!7395)

(assert (=> b!465895 (= lt!210399 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210389 () (_ BitVec 64))

(assert (=> b!465895 (= lt!210389 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210390 () (_ BitVec 64))

(assert (=> b!465895 (= lt!210390 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210391 () Unit!13534)

(declare-fun addApplyDifferent!285 (ListLongMap!7395 (_ BitVec 64) V!18171 (_ BitVec 64)) Unit!13534)

(assert (=> b!465895 (= lt!210391 (addApplyDifferent!285 lt!210399 lt!210389 minValueBefore!38 lt!210390))))

(assert (=> b!465895 (= (apply!322 (+!1686 lt!210399 (tuple2!8493 lt!210389 minValueBefore!38)) lt!210390) (apply!322 lt!210399 lt!210390))))

(declare-fun lt!210381 () Unit!13534)

(assert (=> b!465895 (= lt!210381 lt!210391)))

(declare-fun lt!210384 () ListLongMap!7395)

(assert (=> b!465895 (= lt!210384 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210393 () (_ BitVec 64))

(assert (=> b!465895 (= lt!210393 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210398 () (_ BitVec 64))

(assert (=> b!465895 (= lt!210398 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210387 () Unit!13534)

(assert (=> b!465895 (= lt!210387 (addApplyDifferent!285 lt!210384 lt!210393 zeroValue!794 lt!210398))))

(assert (=> b!465895 (= (apply!322 (+!1686 lt!210384 (tuple2!8493 lt!210393 zeroValue!794)) lt!210398) (apply!322 lt!210384 lt!210398))))

(declare-fun lt!210380 () Unit!13534)

(assert (=> b!465895 (= lt!210380 lt!210387)))

(declare-fun lt!210385 () ListLongMap!7395)

(assert (=> b!465895 (= lt!210385 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210383 () (_ BitVec 64))

(assert (=> b!465895 (= lt!210383 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210386 () (_ BitVec 64))

(assert (=> b!465895 (= lt!210386 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!465895 (= lt!210400 (addApplyDifferent!285 lt!210385 lt!210383 minValueBefore!38 lt!210386))))

(assert (=> b!465895 (= (apply!322 (+!1686 lt!210385 (tuple2!8493 lt!210383 minValueBefore!38)) lt!210386) (apply!322 lt!210385 lt!210386))))

(declare-fun bm!30232 () Bool)

(declare-fun call!30237 () Bool)

(assert (=> bm!30232 (= call!30237 (contains!2515 lt!210401 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!465896 () Bool)

(declare-fun e!272350 () Bool)

(assert (=> b!465896 (= e!272350 (= (apply!322 lt!210401 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun bm!30233 () Bool)

(declare-fun c!56660 () Bool)

(declare-fun c!56662 () Bool)

(declare-fun call!30241 () ListLongMap!7395)

(declare-fun call!30240 () ListLongMap!7395)

(declare-fun call!30235 () ListLongMap!7395)

(assert (=> bm!30233 (= call!30240 (+!1686 (ite c!56660 call!30241 (ite c!56662 call!30235 call!30236)) (ite (or c!56660 c!56662) (tuple2!8493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!465897 () Bool)

(declare-fun e!272347 () Bool)

(assert (=> b!465897 (= e!272347 (validKeyInArray!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465898 () Bool)

(declare-fun res!278516 () Bool)

(assert (=> b!465898 (=> (not res!278516) (not e!272355))))

(declare-fun e!272346 () Bool)

(assert (=> b!465898 (= res!278516 e!272346)))

(declare-fun res!278518 () Bool)

(assert (=> b!465898 (=> res!278518 e!272346)))

(assert (=> b!465898 (= res!278518 (not e!272347))))

(declare-fun res!278517 () Bool)

(assert (=> b!465898 (=> (not res!278517) (not e!272347))))

(assert (=> b!465898 (= res!278517 (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun e!272352 () Bool)

(declare-fun b!465899 () Bool)

(assert (=> b!465899 (= e!272352 (= (apply!322 lt!210401 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)) (get!6931 (select (arr!14118 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!465899 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _values!833)))))

(assert (=> b!465899 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun b!465900 () Bool)

(declare-fun e!272349 () Bool)

(assert (=> b!465900 (= e!272349 (validKeyInArray!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30234 () Bool)

(assert (=> bm!30234 (= call!30236 call!30235)))

(declare-fun b!465901 () Bool)

(declare-fun c!56658 () Bool)

(assert (=> b!465901 (= c!56658 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!272357 () ListLongMap!7395)

(assert (=> b!465901 (= e!272357 e!272353)))

(declare-fun bm!30236 () Bool)

(assert (=> bm!30236 (= call!30238 call!30240)))

(declare-fun b!465902 () Bool)

(assert (=> b!465902 (= e!272354 e!272350)))

(declare-fun res!278519 () Bool)

(assert (=> b!465902 (= res!278519 call!30239)))

(assert (=> b!465902 (=> (not res!278519) (not e!272350))))

(declare-fun b!465903 () Bool)

(assert (=> b!465903 (= e!272356 e!272351)))

(declare-fun res!278515 () Bool)

(assert (=> b!465903 (= res!278515 call!30237)))

(assert (=> b!465903 (=> (not res!278515) (not e!272351))))

(declare-fun b!465904 () Bool)

(declare-fun e!272358 () ListLongMap!7395)

(assert (=> b!465904 (= e!272358 (+!1686 call!30240 (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!465905 () Bool)

(assert (=> b!465905 (= e!272356 (not call!30237))))

(declare-fun bm!30237 () Bool)

(assert (=> bm!30237 (= call!30241 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465906 () Bool)

(assert (=> b!465906 (= e!272358 e!272357)))

(assert (=> b!465906 (= c!56662 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!465907 () Bool)

(declare-fun Unit!13536 () Unit!13534)

(assert (=> b!465907 (= e!272348 Unit!13536)))

(declare-fun b!465908 () Bool)

(assert (=> b!465908 (= e!272346 e!272352)))

(declare-fun res!278522 () Bool)

(assert (=> b!465908 (=> (not res!278522) (not e!272352))))

(assert (=> b!465908 (= res!278522 (contains!2515 lt!210401 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun b!465909 () Bool)

(declare-fun res!278520 () Bool)

(assert (=> b!465909 (=> (not res!278520) (not e!272355))))

(assert (=> b!465909 (= res!278520 e!272354)))

(declare-fun c!56659 () Bool)

(assert (=> b!465909 (= c!56659 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30238 () Bool)

(assert (=> bm!30238 (= call!30235 call!30241)))

(declare-fun b!465910 () Bool)

(assert (=> b!465910 (= e!272357 call!30238)))

(declare-fun d!74935 () Bool)

(assert (=> d!74935 e!272355))

(declare-fun res!278514 () Bool)

(assert (=> d!74935 (=> (not res!278514) (not e!272355))))

(assert (=> d!74935 (= res!278514 (or (bvsge #b00000000000000000000000000000000 (size!14470 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))))

(declare-fun lt!210394 () ListLongMap!7395)

(assert (=> d!74935 (= lt!210401 lt!210394)))

(declare-fun lt!210395 () Unit!13534)

(assert (=> d!74935 (= lt!210395 e!272348)))

(declare-fun c!56657 () Bool)

(assert (=> d!74935 (= c!56657 e!272349)))

(declare-fun res!278521 () Bool)

(assert (=> d!74935 (=> (not res!278521) (not e!272349))))

(assert (=> d!74935 (= res!278521 (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(assert (=> d!74935 (= lt!210394 e!272358)))

(assert (=> d!74935 (= c!56660 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!74935 (validMask!0 mask!1365)))

(assert (=> d!74935 (= (getCurrentListMap!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210401)))

(declare-fun bm!30235 () Bool)

(assert (=> bm!30235 (= call!30239 (contains!2515 lt!210401 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!74935 c!56660) b!465904))

(assert (= (and d!74935 (not c!56660)) b!465906))

(assert (= (and b!465906 c!56662) b!465910))

(assert (= (and b!465906 (not c!56662)) b!465901))

(assert (= (and b!465901 c!56658) b!465892))

(assert (= (and b!465901 (not c!56658)) b!465890))

(assert (= (or b!465892 b!465890) bm!30234))

(assert (= (or b!465910 bm!30234) bm!30238))

(assert (= (or b!465910 b!465892) bm!30236))

(assert (= (or b!465904 bm!30238) bm!30237))

(assert (= (or b!465904 bm!30236) bm!30233))

(assert (= (and d!74935 res!278521) b!465900))

(assert (= (and d!74935 c!56657) b!465895))

(assert (= (and d!74935 (not c!56657)) b!465907))

(assert (= (and d!74935 res!278514) b!465898))

(assert (= (and b!465898 res!278517) b!465897))

(assert (= (and b!465898 (not res!278518)) b!465908))

(assert (= (and b!465908 res!278522) b!465899))

(assert (= (and b!465898 res!278516) b!465909))

(assert (= (and b!465909 c!56659) b!465902))

(assert (= (and b!465909 (not c!56659)) b!465893))

(assert (= (and b!465902 res!278519) b!465896))

(assert (= (or b!465902 b!465893) bm!30235))

(assert (= (and b!465909 res!278520) b!465894))

(assert (= (and b!465894 c!56661) b!465903))

(assert (= (and b!465894 (not c!56661)) b!465905))

(assert (= (and b!465903 res!278515) b!465891))

(assert (= (or b!465903 b!465905) bm!30232))

(declare-fun b_lambda!9995 () Bool)

(assert (=> (not b_lambda!9995) (not b!465899)))

(assert (=> b!465899 t!14521))

(declare-fun b_and!19715 () Bool)

(assert (= b_and!19713 (and (=> t!14521 result!7377) b_and!19715)))

(declare-fun m!447627 () Bool)

(assert (=> b!465904 m!447627))

(assert (=> b!465908 m!447555))

(assert (=> b!465908 m!447555))

(declare-fun m!447629 () Bool)

(assert (=> b!465908 m!447629))

(assert (=> b!465897 m!447555))

(assert (=> b!465897 m!447555))

(assert (=> b!465897 m!447557))

(declare-fun m!447631 () Bool)

(assert (=> b!465895 m!447631))

(declare-fun m!447633 () Bool)

(assert (=> b!465895 m!447633))

(declare-fun m!447635 () Bool)

(assert (=> b!465895 m!447635))

(declare-fun m!447637 () Bool)

(assert (=> b!465895 m!447637))

(declare-fun m!447639 () Bool)

(assert (=> b!465895 m!447639))

(declare-fun m!447641 () Bool)

(assert (=> b!465895 m!447641))

(declare-fun m!447643 () Bool)

(assert (=> b!465895 m!447643))

(declare-fun m!447645 () Bool)

(assert (=> b!465895 m!447645))

(assert (=> b!465895 m!447641))

(declare-fun m!447647 () Bool)

(assert (=> b!465895 m!447647))

(declare-fun m!447649 () Bool)

(assert (=> b!465895 m!447649))

(declare-fun m!447651 () Bool)

(assert (=> b!465895 m!447651))

(declare-fun m!447653 () Bool)

(assert (=> b!465895 m!447653))

(declare-fun m!447655 () Bool)

(assert (=> b!465895 m!447655))

(assert (=> b!465895 m!447555))

(assert (=> b!465895 m!447635))

(declare-fun m!447657 () Bool)

(assert (=> b!465895 m!447657))

(assert (=> b!465895 m!447497))

(assert (=> b!465895 m!447631))

(declare-fun m!447659 () Bool)

(assert (=> b!465895 m!447659))

(assert (=> b!465895 m!447643))

(assert (=> b!465899 m!447555))

(declare-fun m!447661 () Bool)

(assert (=> b!465899 m!447661))

(assert (=> b!465899 m!447575))

(assert (=> b!465899 m!447577))

(assert (=> b!465899 m!447579))

(assert (=> b!465899 m!447577))

(assert (=> b!465899 m!447555))

(assert (=> b!465899 m!447575))

(assert (=> bm!30237 m!447497))

(assert (=> d!74935 m!447501))

(declare-fun m!447663 () Bool)

(assert (=> bm!30235 m!447663))

(declare-fun m!447665 () Bool)

(assert (=> bm!30232 m!447665))

(declare-fun m!447667 () Bool)

(assert (=> bm!30233 m!447667))

(assert (=> b!465900 m!447555))

(assert (=> b!465900 m!447555))

(assert (=> b!465900 m!447557))

(declare-fun m!447669 () Bool)

(assert (=> b!465891 m!447669))

(declare-fun m!447671 () Bool)

(assert (=> b!465896 m!447671))

(assert (=> b!465721 d!74935))

(declare-fun b!465911 () Bool)

(declare-fun e!272366 () ListLongMap!7395)

(declare-fun call!30243 () ListLongMap!7395)

(assert (=> b!465911 (= e!272366 call!30243)))

(declare-fun b!465912 () Bool)

(declare-fun e!272364 () Bool)

(declare-fun lt!210423 () ListLongMap!7395)

(assert (=> b!465912 (= e!272364 (= (apply!322 lt!210423 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!465913 () Bool)

(declare-fun call!30245 () ListLongMap!7395)

(assert (=> b!465913 (= e!272366 call!30245)))

(declare-fun b!465914 () Bool)

(declare-fun e!272367 () Bool)

(declare-fun call!30246 () Bool)

(assert (=> b!465914 (= e!272367 (not call!30246))))

(declare-fun b!465915 () Bool)

(declare-fun e!272368 () Bool)

(declare-fun e!272369 () Bool)

(assert (=> b!465915 (= e!272368 e!272369)))

(declare-fun c!56667 () Bool)

(assert (=> b!465915 (= c!56667 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!465916 () Bool)

(declare-fun e!272361 () Unit!13534)

(declare-fun lt!210422 () Unit!13534)

(assert (=> b!465916 (= e!272361 lt!210422)))

(declare-fun lt!210419 () ListLongMap!7395)

(assert (=> b!465916 (= lt!210419 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210404 () (_ BitVec 64))

(assert (=> b!465916 (= lt!210404 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210418 () (_ BitVec 64))

(assert (=> b!465916 (= lt!210418 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210414 () Unit!13534)

(assert (=> b!465916 (= lt!210414 (addStillContains!285 lt!210419 lt!210404 zeroValue!794 lt!210418))))

(assert (=> b!465916 (contains!2515 (+!1686 lt!210419 (tuple2!8493 lt!210404 zeroValue!794)) lt!210418)))

(declare-fun lt!210410 () Unit!13534)

(assert (=> b!465916 (= lt!210410 lt!210414)))

(declare-fun lt!210421 () ListLongMap!7395)

(assert (=> b!465916 (= lt!210421 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210411 () (_ BitVec 64))

(assert (=> b!465916 (= lt!210411 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210412 () (_ BitVec 64))

(assert (=> b!465916 (= lt!210412 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210413 () Unit!13534)

(assert (=> b!465916 (= lt!210413 (addApplyDifferent!285 lt!210421 lt!210411 minValueAfter!38 lt!210412))))

(assert (=> b!465916 (= (apply!322 (+!1686 lt!210421 (tuple2!8493 lt!210411 minValueAfter!38)) lt!210412) (apply!322 lt!210421 lt!210412))))

(declare-fun lt!210403 () Unit!13534)

(assert (=> b!465916 (= lt!210403 lt!210413)))

(declare-fun lt!210406 () ListLongMap!7395)

(assert (=> b!465916 (= lt!210406 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210415 () (_ BitVec 64))

(assert (=> b!465916 (= lt!210415 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210420 () (_ BitVec 64))

(assert (=> b!465916 (= lt!210420 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210409 () Unit!13534)

(assert (=> b!465916 (= lt!210409 (addApplyDifferent!285 lt!210406 lt!210415 zeroValue!794 lt!210420))))

(assert (=> b!465916 (= (apply!322 (+!1686 lt!210406 (tuple2!8493 lt!210415 zeroValue!794)) lt!210420) (apply!322 lt!210406 lt!210420))))

(declare-fun lt!210402 () Unit!13534)

(assert (=> b!465916 (= lt!210402 lt!210409)))

(declare-fun lt!210407 () ListLongMap!7395)

(assert (=> b!465916 (= lt!210407 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210405 () (_ BitVec 64))

(assert (=> b!465916 (= lt!210405 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210408 () (_ BitVec 64))

(assert (=> b!465916 (= lt!210408 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!465916 (= lt!210422 (addApplyDifferent!285 lt!210407 lt!210405 minValueAfter!38 lt!210408))))

(assert (=> b!465916 (= (apply!322 (+!1686 lt!210407 (tuple2!8493 lt!210405 minValueAfter!38)) lt!210408) (apply!322 lt!210407 lt!210408))))

(declare-fun bm!30239 () Bool)

(declare-fun call!30244 () Bool)

(assert (=> bm!30239 (= call!30244 (contains!2515 lt!210423 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!465917 () Bool)

(declare-fun e!272363 () Bool)

(assert (=> b!465917 (= e!272363 (= (apply!322 lt!210423 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun call!30248 () ListLongMap!7395)

(declare-fun call!30247 () ListLongMap!7395)

(declare-fun call!30242 () ListLongMap!7395)

(declare-fun bm!30240 () Bool)

(declare-fun c!56666 () Bool)

(declare-fun c!56668 () Bool)

(assert (=> bm!30240 (= call!30247 (+!1686 (ite c!56666 call!30248 (ite c!56668 call!30242 call!30243)) (ite (or c!56666 c!56668) (tuple2!8493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!465918 () Bool)

(declare-fun e!272360 () Bool)

(assert (=> b!465918 (= e!272360 (validKeyInArray!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465919 () Bool)

(declare-fun res!278525 () Bool)

(assert (=> b!465919 (=> (not res!278525) (not e!272368))))

(declare-fun e!272359 () Bool)

(assert (=> b!465919 (= res!278525 e!272359)))

(declare-fun res!278527 () Bool)

(assert (=> b!465919 (=> res!278527 e!272359)))

(assert (=> b!465919 (= res!278527 (not e!272360))))

(declare-fun res!278526 () Bool)

(assert (=> b!465919 (=> (not res!278526) (not e!272360))))

(assert (=> b!465919 (= res!278526 (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun e!272365 () Bool)

(declare-fun b!465920 () Bool)

(assert (=> b!465920 (= e!272365 (= (apply!322 lt!210423 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)) (get!6931 (select (arr!14118 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!465920 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14471 _values!833)))))

(assert (=> b!465920 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun b!465921 () Bool)

(declare-fun e!272362 () Bool)

(assert (=> b!465921 (= e!272362 (validKeyInArray!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30241 () Bool)

(assert (=> bm!30241 (= call!30243 call!30242)))

(declare-fun b!465922 () Bool)

(declare-fun c!56664 () Bool)

(assert (=> b!465922 (= c!56664 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!272370 () ListLongMap!7395)

(assert (=> b!465922 (= e!272370 e!272366)))

(declare-fun bm!30243 () Bool)

(assert (=> bm!30243 (= call!30245 call!30247)))

(declare-fun b!465923 () Bool)

(assert (=> b!465923 (= e!272367 e!272363)))

(declare-fun res!278528 () Bool)

(assert (=> b!465923 (= res!278528 call!30246)))

(assert (=> b!465923 (=> (not res!278528) (not e!272363))))

(declare-fun b!465924 () Bool)

(assert (=> b!465924 (= e!272369 e!272364)))

(declare-fun res!278524 () Bool)

(assert (=> b!465924 (= res!278524 call!30244)))

(assert (=> b!465924 (=> (not res!278524) (not e!272364))))

(declare-fun b!465925 () Bool)

(declare-fun e!272371 () ListLongMap!7395)

(assert (=> b!465925 (= e!272371 (+!1686 call!30247 (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465926 () Bool)

(assert (=> b!465926 (= e!272369 (not call!30244))))

(declare-fun bm!30244 () Bool)

(assert (=> bm!30244 (= call!30248 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465927 () Bool)

(assert (=> b!465927 (= e!272371 e!272370)))

(assert (=> b!465927 (= c!56668 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!465928 () Bool)

(declare-fun Unit!13537 () Unit!13534)

(assert (=> b!465928 (= e!272361 Unit!13537)))

(declare-fun b!465929 () Bool)

(assert (=> b!465929 (= e!272359 e!272365)))

(declare-fun res!278531 () Bool)

(assert (=> b!465929 (=> (not res!278531) (not e!272365))))

(assert (=> b!465929 (= res!278531 (contains!2515 lt!210423 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(declare-fun b!465930 () Bool)

(declare-fun res!278529 () Bool)

(assert (=> b!465930 (=> (not res!278529) (not e!272368))))

(assert (=> b!465930 (= res!278529 e!272367)))

(declare-fun c!56665 () Bool)

(assert (=> b!465930 (= c!56665 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30245 () Bool)

(assert (=> bm!30245 (= call!30242 call!30248)))

(declare-fun b!465931 () Bool)

(assert (=> b!465931 (= e!272370 call!30245)))

(declare-fun d!74937 () Bool)

(assert (=> d!74937 e!272368))

(declare-fun res!278523 () Bool)

(assert (=> d!74937 (=> (not res!278523) (not e!272368))))

(assert (=> d!74937 (= res!278523 (or (bvsge #b00000000000000000000000000000000 (size!14470 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))))

(declare-fun lt!210416 () ListLongMap!7395)

(assert (=> d!74937 (= lt!210423 lt!210416)))

(declare-fun lt!210417 () Unit!13534)

(assert (=> d!74937 (= lt!210417 e!272361)))

(declare-fun c!56663 () Bool)

(assert (=> d!74937 (= c!56663 e!272362)))

(declare-fun res!278530 () Bool)

(assert (=> d!74937 (=> (not res!278530) (not e!272362))))

(assert (=> d!74937 (= res!278530 (bvslt #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(assert (=> d!74937 (= lt!210416 e!272371)))

(assert (=> d!74937 (= c!56666 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!74937 (validMask!0 mask!1365)))

(assert (=> d!74937 (= (getCurrentListMap!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210423)))

(declare-fun bm!30242 () Bool)

(assert (=> bm!30242 (= call!30246 (contains!2515 lt!210423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!74937 c!56666) b!465925))

(assert (= (and d!74937 (not c!56666)) b!465927))

(assert (= (and b!465927 c!56668) b!465931))

(assert (= (and b!465927 (not c!56668)) b!465922))

(assert (= (and b!465922 c!56664) b!465913))

(assert (= (and b!465922 (not c!56664)) b!465911))

(assert (= (or b!465913 b!465911) bm!30241))

(assert (= (or b!465931 bm!30241) bm!30245))

(assert (= (or b!465931 b!465913) bm!30243))

(assert (= (or b!465925 bm!30245) bm!30244))

(assert (= (or b!465925 bm!30243) bm!30240))

(assert (= (and d!74937 res!278530) b!465921))

(assert (= (and d!74937 c!56663) b!465916))

(assert (= (and d!74937 (not c!56663)) b!465928))

(assert (= (and d!74937 res!278523) b!465919))

(assert (= (and b!465919 res!278526) b!465918))

(assert (= (and b!465919 (not res!278527)) b!465929))

(assert (= (and b!465929 res!278531) b!465920))

(assert (= (and b!465919 res!278525) b!465930))

(assert (= (and b!465930 c!56665) b!465923))

(assert (= (and b!465930 (not c!56665)) b!465914))

(assert (= (and b!465923 res!278528) b!465917))

(assert (= (or b!465923 b!465914) bm!30242))

(assert (= (and b!465930 res!278529) b!465915))

(assert (= (and b!465915 c!56667) b!465924))

(assert (= (and b!465915 (not c!56667)) b!465926))

(assert (= (and b!465924 res!278524) b!465912))

(assert (= (or b!465924 b!465926) bm!30239))

(declare-fun b_lambda!9997 () Bool)

(assert (=> (not b_lambda!9997) (not b!465920)))

(assert (=> b!465920 t!14521))

(declare-fun b_and!19717 () Bool)

(assert (= b_and!19715 (and (=> t!14521 result!7377) b_and!19717)))

(declare-fun m!447673 () Bool)

(assert (=> b!465925 m!447673))

(assert (=> b!465929 m!447555))

(assert (=> b!465929 m!447555))

(declare-fun m!447675 () Bool)

(assert (=> b!465929 m!447675))

(assert (=> b!465918 m!447555))

(assert (=> b!465918 m!447555))

(assert (=> b!465918 m!447557))

(declare-fun m!447677 () Bool)

(assert (=> b!465916 m!447677))

(declare-fun m!447679 () Bool)

(assert (=> b!465916 m!447679))

(declare-fun m!447681 () Bool)

(assert (=> b!465916 m!447681))

(declare-fun m!447683 () Bool)

(assert (=> b!465916 m!447683))

(declare-fun m!447685 () Bool)

(assert (=> b!465916 m!447685))

(declare-fun m!447687 () Bool)

(assert (=> b!465916 m!447687))

(declare-fun m!447689 () Bool)

(assert (=> b!465916 m!447689))

(declare-fun m!447691 () Bool)

(assert (=> b!465916 m!447691))

(assert (=> b!465916 m!447687))

(declare-fun m!447693 () Bool)

(assert (=> b!465916 m!447693))

(declare-fun m!447695 () Bool)

(assert (=> b!465916 m!447695))

(declare-fun m!447697 () Bool)

(assert (=> b!465916 m!447697))

(declare-fun m!447699 () Bool)

(assert (=> b!465916 m!447699))

(declare-fun m!447701 () Bool)

(assert (=> b!465916 m!447701))

(assert (=> b!465916 m!447555))

(assert (=> b!465916 m!447681))

(declare-fun m!447703 () Bool)

(assert (=> b!465916 m!447703))

(assert (=> b!465916 m!447495))

(assert (=> b!465916 m!447677))

(declare-fun m!447705 () Bool)

(assert (=> b!465916 m!447705))

(assert (=> b!465916 m!447689))

(assert (=> b!465920 m!447555))

(declare-fun m!447707 () Bool)

(assert (=> b!465920 m!447707))

(assert (=> b!465920 m!447575))

(assert (=> b!465920 m!447577))

(assert (=> b!465920 m!447579))

(assert (=> b!465920 m!447577))

(assert (=> b!465920 m!447555))

(assert (=> b!465920 m!447575))

(assert (=> bm!30244 m!447495))

(assert (=> d!74937 m!447501))

(declare-fun m!447709 () Bool)

(assert (=> bm!30242 m!447709))

(declare-fun m!447711 () Bool)

(assert (=> bm!30239 m!447711))

(declare-fun m!447713 () Bool)

(assert (=> bm!30240 m!447713))

(assert (=> b!465921 m!447555))

(assert (=> b!465921 m!447555))

(assert (=> b!465921 m!447557))

(declare-fun m!447715 () Bool)

(assert (=> b!465912 m!447715))

(declare-fun m!447717 () Bool)

(assert (=> b!465917 m!447717))

(assert (=> b!465721 d!74937))

(declare-fun b!465942 () Bool)

(declare-fun e!272382 () Bool)

(declare-fun e!272381 () Bool)

(assert (=> b!465942 (= e!272382 e!272381)))

(declare-fun res!278540 () Bool)

(assert (=> b!465942 (=> (not res!278540) (not e!272381))))

(declare-fun e!272380 () Bool)

(assert (=> b!465942 (= res!278540 (not e!272380))))

(declare-fun res!278539 () Bool)

(assert (=> b!465942 (=> (not res!278539) (not e!272380))))

(assert (=> b!465942 (= res!278539 (validKeyInArray!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465943 () Bool)

(declare-fun e!272383 () Bool)

(declare-fun call!30251 () Bool)

(assert (=> b!465943 (= e!272383 call!30251)))

(declare-fun bm!30248 () Bool)

(declare-fun c!56671 () Bool)

(assert (=> bm!30248 (= call!30251 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56671 (Cons!8571 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000) Nil!8572) Nil!8572)))))

(declare-fun b!465944 () Bool)

(assert (=> b!465944 (= e!272383 call!30251)))

(declare-fun b!465945 () Bool)

(declare-fun contains!2517 (List!8575 (_ BitVec 64)) Bool)

(assert (=> b!465945 (= e!272380 (contains!2517 Nil!8572 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!74939 () Bool)

(declare-fun res!278538 () Bool)

(assert (=> d!74939 (=> res!278538 e!272382)))

(assert (=> d!74939 (= res!278538 (bvsge #b00000000000000000000000000000000 (size!14470 _keys!1025)))))

(assert (=> d!74939 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8572) e!272382)))

(declare-fun b!465946 () Bool)

(assert (=> b!465946 (= e!272381 e!272383)))

(assert (=> b!465946 (= c!56671 (validKeyInArray!0 (select (arr!14117 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!74939 (not res!278538)) b!465942))

(assert (= (and b!465942 res!278539) b!465945))

(assert (= (and b!465942 res!278540) b!465946))

(assert (= (and b!465946 c!56671) b!465943))

(assert (= (and b!465946 (not c!56671)) b!465944))

(assert (= (or b!465943 b!465944) bm!30248))

(assert (=> b!465942 m!447555))

(assert (=> b!465942 m!447555))

(assert (=> b!465942 m!447557))

(assert (=> bm!30248 m!447555))

(declare-fun m!447719 () Bool)

(assert (=> bm!30248 m!447719))

(assert (=> b!465945 m!447555))

(assert (=> b!465945 m!447555))

(declare-fun m!447721 () Bool)

(assert (=> b!465945 m!447721))

(assert (=> b!465946 m!447555))

(assert (=> b!465946 m!447555))

(assert (=> b!465946 m!447557))

(assert (=> b!465718 d!74939))

(declare-fun mapNonEmpty!20890 () Bool)

(declare-fun mapRes!20890 () Bool)

(declare-fun tp!40132 () Bool)

(declare-fun e!272388 () Bool)

(assert (=> mapNonEmpty!20890 (= mapRes!20890 (and tp!40132 e!272388))))

(declare-fun mapRest!20890 () (Array (_ BitVec 32) ValueCell!6056))

(declare-fun mapKey!20890 () (_ BitVec 32))

(declare-fun mapValue!20890 () ValueCell!6056)

(assert (=> mapNonEmpty!20890 (= mapRest!20881 (store mapRest!20890 mapKey!20890 mapValue!20890))))

(declare-fun b!465953 () Bool)

(assert (=> b!465953 (= e!272388 tp_is_empty!12799)))

(declare-fun b!465954 () Bool)

(declare-fun e!272389 () Bool)

(assert (=> b!465954 (= e!272389 tp_is_empty!12799)))

(declare-fun condMapEmpty!20890 () Bool)

(declare-fun mapDefault!20890 () ValueCell!6056)

(assert (=> mapNonEmpty!20881 (= condMapEmpty!20890 (= mapRest!20881 ((as const (Array (_ BitVec 32) ValueCell!6056)) mapDefault!20890)))))

(assert (=> mapNonEmpty!20881 (= tp!40116 (and e!272389 mapRes!20890))))

(declare-fun mapIsEmpty!20890 () Bool)

(assert (=> mapIsEmpty!20890 mapRes!20890))

(assert (= (and mapNonEmpty!20881 condMapEmpty!20890) mapIsEmpty!20890))

(assert (= (and mapNonEmpty!20881 (not condMapEmpty!20890)) mapNonEmpty!20890))

(assert (= (and mapNonEmpty!20890 ((_ is ValueCellFull!6056) mapValue!20890)) b!465953))

(assert (= (and mapNonEmpty!20881 ((_ is ValueCellFull!6056) mapDefault!20890)) b!465954))

(declare-fun m!447723 () Bool)

(assert (=> mapNonEmpty!20890 m!447723))

(declare-fun b_lambda!9999 () Bool)

(assert (= b_lambda!9995 (or (and start!41718 b_free!11371) b_lambda!9999)))

(declare-fun b_lambda!10001 () Bool)

(assert (= b_lambda!9991 (or (and start!41718 b_free!11371) b_lambda!10001)))

(declare-fun b_lambda!10003 () Bool)

(assert (= b_lambda!9987 (or (and start!41718 b_free!11371) b_lambda!10003)))

(declare-fun b_lambda!10005 () Bool)

(assert (= b_lambda!9993 (or (and start!41718 b_free!11371) b_lambda!10005)))

(declare-fun b_lambda!10007 () Bool)

(assert (= b_lambda!9989 (or (and start!41718 b_free!11371) b_lambda!10007)))

(declare-fun b_lambda!10009 () Bool)

(assert (= b_lambda!9997 (or (and start!41718 b_free!11371) b_lambda!10009)))

(check-sat (not bm!30217) (not b!465916) (not b_lambda!10005) (not b!465929) (not b_lambda!10009) (not b!465827) (not b!465832) (not d!74937) (not b!465841) (not b!465899) (not bm!30239) (not b!465816) (not b!465895) (not b_lambda!10007) (not b_lambda!10001) (not b!465917) (not b!465823) (not b!465837) (not b!465908) (not b!465830) (not b!465818) (not b!465819) (not b!465896) (not b!465920) (not b_next!11371) (not b!465946) (not b!465918) b_and!19717 (not b!465847) (not b!465904) (not b!465846) (not b!465833) (not b!465942) (not b!465791) (not bm!30242) (not b_lambda!9999) (not b!465897) (not b_lambda!10003) (not d!74933) (not b!465921) (not b!465831) (not mapNonEmpty!20890) (not d!74935) (not bm!30232) (not bm!30213) (not bm!30216) (not d!74929) (not bm!30233) (not b!465912) (not bm!30248) (not b!465900) (not b!465790) (not bm!30235) (not b!465945) (not bm!30244) tp_is_empty!12799 (not d!74927) (not bm!30240) (not bm!30237) (not b!465891) (not b!465839) (not b!465825) (not d!74931) (not b!465821) (not b!465817) (not b!465925) (not b!465835))
(check-sat b_and!19717 (not b_next!11371))
