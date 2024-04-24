; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106204 () Bool)

(assert start!106204)

(declare-fun b_free!27469 () Bool)

(declare-fun b_next!27469 () Bool)

(assert (=> start!106204 (= b_free!27469 (not b_next!27469))))

(declare-fun tp!95947 () Bool)

(declare-fun b_and!45409 () Bool)

(assert (=> start!106204 (= tp!95947 b_and!45409)))

(declare-fun e!719260 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!48527 0))(
  ( (V!48528 (val!16248 Int)) )
))
(declare-fun zeroValue!871 () V!48527)

(declare-datatypes ((array!82405 0))(
  ( (array!82406 (arr!39748 (Array (_ BitVec 32) (_ BitVec 64))) (size!40285 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82405)

(declare-datatypes ((ValueCell!15422 0))(
  ( (ValueCellFull!15422 (v!18950 V!48527)) (EmptyCell!15422) )
))
(declare-datatypes ((array!82407 0))(
  ( (array!82408 (arr!39749 (Array (_ BitVec 32) ValueCell!15422)) (size!40286 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82407)

(declare-fun minValueBefore!43 () V!48527)

(declare-datatypes ((tuple2!21042 0))(
  ( (tuple2!21043 (_1!10532 (_ BitVec 64)) (_2!10532 V!48527)) )
))
(declare-datatypes ((List!28265 0))(
  ( (Nil!28262) (Cons!28261 (h!29479 tuple2!21042) (t!41762 List!28265)) )
))
(declare-datatypes ((ListLongMap!18923 0))(
  ( (ListLongMap!18924 (toList!9477 List!28265)) )
))
(declare-fun lt!572531 () ListLongMap!18923)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun b!1263426 () Bool)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMap!4630 (array!82405 array!82407 (_ BitVec 32) (_ BitVec 32) V!48527 V!48527 (_ BitVec 32) Int) ListLongMap!18923)

(declare-fun +!4289 (ListLongMap!18923 tuple2!21042) ListLongMap!18923)

(assert (=> b!1263426 (= e!719260 (= (getCurrentListMap!4630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4289 lt!572531 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun minValueAfter!43 () V!48527)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!572529 () ListLongMap!18923)

(assert (=> b!1263426 (= lt!572529 (getCurrentListMap!4630 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!841420 () Bool)

(declare-fun e!719258 () Bool)

(assert (=> start!106204 (=> (not res!841420) (not e!719258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106204 (= res!841420 (validMask!0 mask!1466))))

(assert (=> start!106204 e!719258))

(assert (=> start!106204 true))

(assert (=> start!106204 tp!95947))

(declare-fun tp_is_empty!32371 () Bool)

(assert (=> start!106204 tp_is_empty!32371))

(declare-fun array_inv!30411 (array!82405) Bool)

(assert (=> start!106204 (array_inv!30411 _keys!1118)))

(declare-fun e!719256 () Bool)

(declare-fun array_inv!30412 (array!82407) Bool)

(assert (=> start!106204 (and (array_inv!30412 _values!914) e!719256)))

(declare-fun b!1263427 () Bool)

(declare-fun e!719255 () Bool)

(assert (=> b!1263427 (= e!719255 tp_is_empty!32371)))

(declare-fun b!1263428 () Bool)

(declare-fun res!841418 () Bool)

(assert (=> b!1263428 (=> (not res!841418) (not e!719258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82405 (_ BitVec 32)) Bool)

(assert (=> b!1263428 (= res!841418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1263429 () Bool)

(declare-fun e!719259 () Bool)

(declare-fun mapRes!50368 () Bool)

(assert (=> b!1263429 (= e!719256 (and e!719259 mapRes!50368))))

(declare-fun condMapEmpty!50368 () Bool)

(declare-fun mapDefault!50368 () ValueCell!15422)

(assert (=> b!1263429 (= condMapEmpty!50368 (= (arr!39749 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15422)) mapDefault!50368)))))

(declare-fun b!1263430 () Bool)

(assert (=> b!1263430 (= e!719259 tp_is_empty!32371)))

(declare-fun b!1263431 () Bool)

(declare-fun res!841421 () Bool)

(assert (=> b!1263431 (=> (not res!841421) (not e!719258))))

(declare-datatypes ((List!28266 0))(
  ( (Nil!28263) (Cons!28262 (h!29480 (_ BitVec 64)) (t!41763 List!28266)) )
))
(declare-fun arrayNoDuplicates!0 (array!82405 (_ BitVec 32) List!28266) Bool)

(assert (=> b!1263431 (= res!841421 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28263))))

(declare-fun mapNonEmpty!50368 () Bool)

(declare-fun tp!95948 () Bool)

(assert (=> mapNonEmpty!50368 (= mapRes!50368 (and tp!95948 e!719255))))

(declare-fun mapRest!50368 () (Array (_ BitVec 32) ValueCell!15422))

(declare-fun mapKey!50368 () (_ BitVec 32))

(declare-fun mapValue!50368 () ValueCell!15422)

(assert (=> mapNonEmpty!50368 (= (arr!39749 _values!914) (store mapRest!50368 mapKey!50368 mapValue!50368))))

(declare-fun b!1263432 () Bool)

(declare-fun res!841419 () Bool)

(assert (=> b!1263432 (=> (not res!841419) (not e!719258))))

(assert (=> b!1263432 (= res!841419 (and (= (size!40286 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40285 _keys!1118) (size!40286 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50368 () Bool)

(assert (=> mapIsEmpty!50368 mapRes!50368))

(declare-fun b!1263433 () Bool)

(assert (=> b!1263433 (= e!719258 (not e!719260))))

(declare-fun res!841417 () Bool)

(assert (=> b!1263433 (=> res!841417 e!719260)))

(assert (=> b!1263433 (= res!841417 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!572528 () ListLongMap!18923)

(assert (=> b!1263433 (= lt!572531 lt!572528)))

(declare-datatypes ((Unit!42051 0))(
  ( (Unit!42052) )
))
(declare-fun lt!572530 () Unit!42051)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1172 (array!82405 array!82407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48527 V!48527 V!48527 V!48527 (_ BitVec 32) Int) Unit!42051)

(assert (=> b!1263433 (= lt!572530 (lemmaNoChangeToArrayThenSameMapNoExtras!1172 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5882 (array!82405 array!82407 (_ BitVec 32) (_ BitVec 32) V!48527 V!48527 (_ BitVec 32) Int) ListLongMap!18923)

(assert (=> b!1263433 (= lt!572528 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263433 (= lt!572531 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!106204 res!841420) b!1263432))

(assert (= (and b!1263432 res!841419) b!1263428))

(assert (= (and b!1263428 res!841418) b!1263431))

(assert (= (and b!1263431 res!841421) b!1263433))

(assert (= (and b!1263433 (not res!841417)) b!1263426))

(assert (= (and b!1263429 condMapEmpty!50368) mapIsEmpty!50368))

(assert (= (and b!1263429 (not condMapEmpty!50368)) mapNonEmpty!50368))

(get-info :version)

(assert (= (and mapNonEmpty!50368 ((_ is ValueCellFull!15422) mapValue!50368)) b!1263427))

(assert (= (and b!1263429 ((_ is ValueCellFull!15422) mapDefault!50368)) b!1263430))

(assert (= start!106204 b!1263429))

(declare-fun m!1164263 () Bool)

(assert (=> mapNonEmpty!50368 m!1164263))

(declare-fun m!1164265 () Bool)

(assert (=> b!1263428 m!1164265))

(declare-fun m!1164267 () Bool)

(assert (=> b!1263431 m!1164267))

(declare-fun m!1164269 () Bool)

(assert (=> start!106204 m!1164269))

(declare-fun m!1164271 () Bool)

(assert (=> start!106204 m!1164271))

(declare-fun m!1164273 () Bool)

(assert (=> start!106204 m!1164273))

(declare-fun m!1164275 () Bool)

(assert (=> b!1263433 m!1164275))

(declare-fun m!1164277 () Bool)

(assert (=> b!1263433 m!1164277))

(declare-fun m!1164279 () Bool)

(assert (=> b!1263433 m!1164279))

(declare-fun m!1164281 () Bool)

(assert (=> b!1263426 m!1164281))

(declare-fun m!1164283 () Bool)

(assert (=> b!1263426 m!1164283))

(declare-fun m!1164285 () Bool)

(assert (=> b!1263426 m!1164285))

(check-sat (not b!1263431) (not start!106204) tp_is_empty!32371 (not b!1263433) (not b!1263428) (not mapNonEmpty!50368) (not b!1263426) (not b_next!27469) b_and!45409)
(check-sat b_and!45409 (not b_next!27469))
(get-model)

(declare-fun b!1263490 () Bool)

(declare-fun e!719303 () Bool)

(declare-fun e!719305 () Bool)

(assert (=> b!1263490 (= e!719303 e!719305)))

(declare-fun c!123165 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263490 (= c!123165 (validKeyInArray!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263491 () Bool)

(declare-fun e!719304 () Bool)

(declare-fun call!62103 () Bool)

(assert (=> b!1263491 (= e!719304 call!62103)))

(declare-fun b!1263492 () Bool)

(assert (=> b!1263492 (= e!719305 e!719304)))

(declare-fun lt!572562 () (_ BitVec 64))

(assert (=> b!1263492 (= lt!572562 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572563 () Unit!42051)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82405 (_ BitVec 64) (_ BitVec 32)) Unit!42051)

(assert (=> b!1263492 (= lt!572563 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572562 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263492 (arrayContainsKey!0 _keys!1118 lt!572562 #b00000000000000000000000000000000)))

(declare-fun lt!572564 () Unit!42051)

(assert (=> b!1263492 (= lt!572564 lt!572563)))

(declare-fun res!841456 () Bool)

(declare-datatypes ((SeekEntryResult!9931 0))(
  ( (MissingZero!9931 (index!42095 (_ BitVec 32))) (Found!9931 (index!42096 (_ BitVec 32))) (Intermediate!9931 (undefined!10743 Bool) (index!42097 (_ BitVec 32)) (x!111207 (_ BitVec 32))) (Undefined!9931) (MissingVacant!9931 (index!42098 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82405 (_ BitVec 32)) SeekEntryResult!9931)

(assert (=> b!1263492 (= res!841456 (= (seekEntryOrOpen!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9931 #b00000000000000000000000000000000)))))

(assert (=> b!1263492 (=> (not res!841456) (not e!719304))))

(declare-fun d!138961 () Bool)

(declare-fun res!841457 () Bool)

(assert (=> d!138961 (=> res!841457 e!719303)))

(assert (=> d!138961 (= res!841457 (bvsge #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(assert (=> d!138961 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719303)))

(declare-fun b!1263493 () Bool)

(assert (=> b!1263493 (= e!719305 call!62103)))

(declare-fun bm!62100 () Bool)

(assert (=> bm!62100 (= call!62103 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138961 (not res!841457)) b!1263490))

(assert (= (and b!1263490 c!123165) b!1263492))

(assert (= (and b!1263490 (not c!123165)) b!1263493))

(assert (= (and b!1263492 res!841456) b!1263491))

(assert (= (or b!1263491 b!1263493) bm!62100))

(declare-fun m!1164335 () Bool)

(assert (=> b!1263490 m!1164335))

(assert (=> b!1263490 m!1164335))

(declare-fun m!1164337 () Bool)

(assert (=> b!1263490 m!1164337))

(assert (=> b!1263492 m!1164335))

(declare-fun m!1164339 () Bool)

(assert (=> b!1263492 m!1164339))

(declare-fun m!1164341 () Bool)

(assert (=> b!1263492 m!1164341))

(assert (=> b!1263492 m!1164335))

(declare-fun m!1164343 () Bool)

(assert (=> b!1263492 m!1164343))

(declare-fun m!1164345 () Bool)

(assert (=> bm!62100 m!1164345))

(assert (=> b!1263428 d!138961))

(declare-fun d!138963 () Bool)

(assert (=> d!138963 (= (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572567 () Unit!42051)

(declare-fun choose!1875 (array!82405 array!82407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48527 V!48527 V!48527 V!48527 (_ BitVec 32) Int) Unit!42051)

(assert (=> d!138963 (= lt!572567 (choose!1875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138963 (validMask!0 mask!1466)))

(assert (=> d!138963 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1172 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572567)))

(declare-fun bs!35738 () Bool)

(assert (= bs!35738 d!138963))

(assert (=> bs!35738 m!1164279))

(assert (=> bs!35738 m!1164277))

(declare-fun m!1164347 () Bool)

(assert (=> bs!35738 m!1164347))

(assert (=> bs!35738 m!1164269))

(assert (=> b!1263433 d!138963))

(declare-fun b!1263518 () Bool)

(declare-fun e!719325 () ListLongMap!18923)

(assert (=> b!1263518 (= e!719325 (ListLongMap!18924 Nil!28262))))

(declare-fun b!1263519 () Bool)

(declare-fun res!841467 () Bool)

(declare-fun e!719322 () Bool)

(assert (=> b!1263519 (=> (not res!841467) (not e!719322))))

(declare-fun lt!572585 () ListLongMap!18923)

(declare-fun contains!7615 (ListLongMap!18923 (_ BitVec 64)) Bool)

(assert (=> b!1263519 (= res!841467 (not (contains!7615 lt!572585 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263520 () Bool)

(declare-fun e!719323 () Bool)

(assert (=> b!1263520 (= e!719323 (validKeyInArray!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263520 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun e!719326 () Bool)

(declare-fun b!1263521 () Bool)

(assert (=> b!1263521 (= e!719326 (= lt!572585 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263522 () Bool)

(declare-fun e!719320 () Bool)

(assert (=> b!1263522 (= e!719322 e!719320)))

(declare-fun c!123177 () Bool)

(assert (=> b!1263522 (= c!123177 e!719323)))

(declare-fun res!841468 () Bool)

(assert (=> b!1263522 (=> (not res!841468) (not e!719323))))

(assert (=> b!1263522 (= res!841468 (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun b!1263523 () Bool)

(declare-fun e!719321 () Bool)

(assert (=> b!1263523 (= e!719320 e!719321)))

(assert (=> b!1263523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun res!841469 () Bool)

(assert (=> b!1263523 (= res!841469 (contains!7615 lt!572585 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263523 (=> (not res!841469) (not e!719321))))

(declare-fun b!1263524 () Bool)

(declare-fun lt!572582 () Unit!42051)

(declare-fun lt!572587 () Unit!42051)

(assert (=> b!1263524 (= lt!572582 lt!572587)))

(declare-fun lt!572584 () V!48527)

(declare-fun lt!572588 () (_ BitVec 64))

(declare-fun lt!572586 () (_ BitVec 64))

(declare-fun lt!572583 () ListLongMap!18923)

(assert (=> b!1263524 (not (contains!7615 (+!4289 lt!572583 (tuple2!21043 lt!572588 lt!572584)) lt!572586))))

(declare-fun addStillNotContains!327 (ListLongMap!18923 (_ BitVec 64) V!48527 (_ BitVec 64)) Unit!42051)

(assert (=> b!1263524 (= lt!572587 (addStillNotContains!327 lt!572583 lt!572588 lt!572584 lt!572586))))

(assert (=> b!1263524 (= lt!572586 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20323 (ValueCell!15422 V!48527) V!48527)

(declare-fun dynLambda!3458 (Int (_ BitVec 64)) V!48527)

(assert (=> b!1263524 (= lt!572584 (get!20323 (select (arr!39749 _values!914) #b00000000000000000000000000000000) (dynLambda!3458 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263524 (= lt!572588 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62106 () ListLongMap!18923)

(assert (=> b!1263524 (= lt!572583 call!62106)))

(declare-fun e!719324 () ListLongMap!18923)

(assert (=> b!1263524 (= e!719324 (+!4289 call!62106 (tuple2!21043 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000) (get!20323 (select (arr!39749 _values!914) #b00000000000000000000000000000000) (dynLambda!3458 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263525 () Bool)

(assert (=> b!1263525 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(assert (=> b!1263525 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40286 _values!914)))))

(declare-fun apply!1006 (ListLongMap!18923 (_ BitVec 64)) V!48527)

(assert (=> b!1263525 (= e!719321 (= (apply!1006 lt!572585 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)) (get!20323 (select (arr!39749 _values!914) #b00000000000000000000000000000000) (dynLambda!3458 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263526 () Bool)

(assert (=> b!1263526 (= e!719320 e!719326)))

(declare-fun c!123175 () Bool)

(assert (=> b!1263526 (= c!123175 (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun b!1263527 () Bool)

(assert (=> b!1263527 (= e!719324 call!62106)))

(declare-fun d!138965 () Bool)

(assert (=> d!138965 e!719322))

(declare-fun res!841466 () Bool)

(assert (=> d!138965 (=> (not res!841466) (not e!719322))))

(assert (=> d!138965 (= res!841466 (not (contains!7615 lt!572585 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138965 (= lt!572585 e!719325)))

(declare-fun c!123174 () Bool)

(assert (=> d!138965 (= c!123174 (bvsge #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(assert (=> d!138965 (validMask!0 mask!1466)))

(assert (=> d!138965 (= (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572585)))

(declare-fun b!1263528 () Bool)

(assert (=> b!1263528 (= e!719325 e!719324)))

(declare-fun c!123176 () Bool)

(assert (=> b!1263528 (= c!123176 (validKeyInArray!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62103 () Bool)

(assert (=> bm!62103 (= call!62106 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263529 () Bool)

(declare-fun isEmpty!1043 (ListLongMap!18923) Bool)

(assert (=> b!1263529 (= e!719326 (isEmpty!1043 lt!572585))))

(assert (= (and d!138965 c!123174) b!1263518))

(assert (= (and d!138965 (not c!123174)) b!1263528))

(assert (= (and b!1263528 c!123176) b!1263524))

(assert (= (and b!1263528 (not c!123176)) b!1263527))

(assert (= (or b!1263524 b!1263527) bm!62103))

(assert (= (and d!138965 res!841466) b!1263519))

(assert (= (and b!1263519 res!841467) b!1263522))

(assert (= (and b!1263522 res!841468) b!1263520))

(assert (= (and b!1263522 c!123177) b!1263523))

(assert (= (and b!1263522 (not c!123177)) b!1263526))

(assert (= (and b!1263523 res!841469) b!1263525))

(assert (= (and b!1263526 c!123175) b!1263521))

(assert (= (and b!1263526 (not c!123175)) b!1263529))

(declare-fun b_lambda!22845 () Bool)

(assert (=> (not b_lambda!22845) (not b!1263524)))

(declare-fun t!41767 () Bool)

(declare-fun tb!11313 () Bool)

(assert (=> (and start!106204 (= defaultEntry!922 defaultEntry!922) t!41767) tb!11313))

(declare-fun result!23363 () Bool)

(assert (=> tb!11313 (= result!23363 tp_is_empty!32371)))

(assert (=> b!1263524 t!41767))

(declare-fun b_and!45415 () Bool)

(assert (= b_and!45409 (and (=> t!41767 result!23363) b_and!45415)))

(declare-fun b_lambda!22847 () Bool)

(assert (=> (not b_lambda!22847) (not b!1263525)))

(assert (=> b!1263525 t!41767))

(declare-fun b_and!45417 () Bool)

(assert (= b_and!45415 (and (=> t!41767 result!23363) b_and!45417)))

(declare-fun m!1164349 () Bool)

(assert (=> b!1263519 m!1164349))

(declare-fun m!1164351 () Bool)

(assert (=> b!1263521 m!1164351))

(declare-fun m!1164353 () Bool)

(assert (=> b!1263529 m!1164353))

(assert (=> b!1263528 m!1164335))

(assert (=> b!1263528 m!1164335))

(assert (=> b!1263528 m!1164337))

(declare-fun m!1164355 () Bool)

(assert (=> d!138965 m!1164355))

(assert (=> d!138965 m!1164269))

(assert (=> b!1263520 m!1164335))

(assert (=> b!1263520 m!1164335))

(assert (=> b!1263520 m!1164337))

(declare-fun m!1164357 () Bool)

(assert (=> b!1263524 m!1164357))

(declare-fun m!1164359 () Bool)

(assert (=> b!1263524 m!1164359))

(assert (=> b!1263524 m!1164357))

(declare-fun m!1164361 () Bool)

(assert (=> b!1263524 m!1164361))

(declare-fun m!1164363 () Bool)

(assert (=> b!1263524 m!1164363))

(declare-fun m!1164365 () Bool)

(assert (=> b!1263524 m!1164365))

(assert (=> b!1263524 m!1164359))

(assert (=> b!1263524 m!1164335))

(assert (=> b!1263524 m!1164363))

(declare-fun m!1164367 () Bool)

(assert (=> b!1263524 m!1164367))

(declare-fun m!1164369 () Bool)

(assert (=> b!1263524 m!1164369))

(assert (=> b!1263525 m!1164359))

(assert (=> b!1263525 m!1164357))

(assert (=> b!1263525 m!1164361))

(assert (=> b!1263525 m!1164359))

(assert (=> b!1263525 m!1164335))

(assert (=> b!1263525 m!1164335))

(declare-fun m!1164371 () Bool)

(assert (=> b!1263525 m!1164371))

(assert (=> b!1263525 m!1164357))

(assert (=> b!1263523 m!1164335))

(assert (=> b!1263523 m!1164335))

(declare-fun m!1164373 () Bool)

(assert (=> b!1263523 m!1164373))

(assert (=> bm!62103 m!1164351))

(assert (=> b!1263433 d!138965))

(declare-fun b!1263532 () Bool)

(declare-fun e!719332 () ListLongMap!18923)

(assert (=> b!1263532 (= e!719332 (ListLongMap!18924 Nil!28262))))

(declare-fun b!1263533 () Bool)

(declare-fun res!841471 () Bool)

(declare-fun e!719329 () Bool)

(assert (=> b!1263533 (=> (not res!841471) (not e!719329))))

(declare-fun lt!572592 () ListLongMap!18923)

(assert (=> b!1263533 (= res!841471 (not (contains!7615 lt!572592 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263534 () Bool)

(declare-fun e!719330 () Bool)

(assert (=> b!1263534 (= e!719330 (validKeyInArray!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263534 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun e!719333 () Bool)

(declare-fun b!1263535 () Bool)

(assert (=> b!1263535 (= e!719333 (= lt!572592 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263536 () Bool)

(declare-fun e!719327 () Bool)

(assert (=> b!1263536 (= e!719329 e!719327)))

(declare-fun c!123181 () Bool)

(assert (=> b!1263536 (= c!123181 e!719330)))

(declare-fun res!841472 () Bool)

(assert (=> b!1263536 (=> (not res!841472) (not e!719330))))

(assert (=> b!1263536 (= res!841472 (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun b!1263537 () Bool)

(declare-fun e!719328 () Bool)

(assert (=> b!1263537 (= e!719327 e!719328)))

(assert (=> b!1263537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun res!841473 () Bool)

(assert (=> b!1263537 (= res!841473 (contains!7615 lt!572592 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263537 (=> (not res!841473) (not e!719328))))

(declare-fun b!1263538 () Bool)

(declare-fun lt!572589 () Unit!42051)

(declare-fun lt!572594 () Unit!42051)

(assert (=> b!1263538 (= lt!572589 lt!572594)))

(declare-fun lt!572590 () ListLongMap!18923)

(declare-fun lt!572593 () (_ BitVec 64))

(declare-fun lt!572591 () V!48527)

(declare-fun lt!572595 () (_ BitVec 64))

(assert (=> b!1263538 (not (contains!7615 (+!4289 lt!572590 (tuple2!21043 lt!572595 lt!572591)) lt!572593))))

(assert (=> b!1263538 (= lt!572594 (addStillNotContains!327 lt!572590 lt!572595 lt!572591 lt!572593))))

(assert (=> b!1263538 (= lt!572593 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263538 (= lt!572591 (get!20323 (select (arr!39749 _values!914) #b00000000000000000000000000000000) (dynLambda!3458 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263538 (= lt!572595 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62107 () ListLongMap!18923)

(assert (=> b!1263538 (= lt!572590 call!62107)))

(declare-fun e!719331 () ListLongMap!18923)

(assert (=> b!1263538 (= e!719331 (+!4289 call!62107 (tuple2!21043 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000) (get!20323 (select (arr!39749 _values!914) #b00000000000000000000000000000000) (dynLambda!3458 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263539 () Bool)

(assert (=> b!1263539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(assert (=> b!1263539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40286 _values!914)))))

(assert (=> b!1263539 (= e!719328 (= (apply!1006 lt!572592 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)) (get!20323 (select (arr!39749 _values!914) #b00000000000000000000000000000000) (dynLambda!3458 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263540 () Bool)

(assert (=> b!1263540 (= e!719327 e!719333)))

(declare-fun c!123179 () Bool)

(assert (=> b!1263540 (= c!123179 (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun b!1263541 () Bool)

(assert (=> b!1263541 (= e!719331 call!62107)))

(declare-fun d!138967 () Bool)

(assert (=> d!138967 e!719329))

(declare-fun res!841470 () Bool)

(assert (=> d!138967 (=> (not res!841470) (not e!719329))))

(assert (=> d!138967 (= res!841470 (not (contains!7615 lt!572592 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138967 (= lt!572592 e!719332)))

(declare-fun c!123178 () Bool)

(assert (=> d!138967 (= c!123178 (bvsge #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(assert (=> d!138967 (validMask!0 mask!1466)))

(assert (=> d!138967 (= (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572592)))

(declare-fun b!1263542 () Bool)

(assert (=> b!1263542 (= e!719332 e!719331)))

(declare-fun c!123180 () Bool)

(assert (=> b!1263542 (= c!123180 (validKeyInArray!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62104 () Bool)

(assert (=> bm!62104 (= call!62107 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263543 () Bool)

(assert (=> b!1263543 (= e!719333 (isEmpty!1043 lt!572592))))

(assert (= (and d!138967 c!123178) b!1263532))

(assert (= (and d!138967 (not c!123178)) b!1263542))

(assert (= (and b!1263542 c!123180) b!1263538))

(assert (= (and b!1263542 (not c!123180)) b!1263541))

(assert (= (or b!1263538 b!1263541) bm!62104))

(assert (= (and d!138967 res!841470) b!1263533))

(assert (= (and b!1263533 res!841471) b!1263536))

(assert (= (and b!1263536 res!841472) b!1263534))

(assert (= (and b!1263536 c!123181) b!1263537))

(assert (= (and b!1263536 (not c!123181)) b!1263540))

(assert (= (and b!1263537 res!841473) b!1263539))

(assert (= (and b!1263540 c!123179) b!1263535))

(assert (= (and b!1263540 (not c!123179)) b!1263543))

(declare-fun b_lambda!22849 () Bool)

(assert (=> (not b_lambda!22849) (not b!1263538)))

(assert (=> b!1263538 t!41767))

(declare-fun b_and!45419 () Bool)

(assert (= b_and!45417 (and (=> t!41767 result!23363) b_and!45419)))

(declare-fun b_lambda!22851 () Bool)

(assert (=> (not b_lambda!22851) (not b!1263539)))

(assert (=> b!1263539 t!41767))

(declare-fun b_and!45421 () Bool)

(assert (= b_and!45419 (and (=> t!41767 result!23363) b_and!45421)))

(declare-fun m!1164375 () Bool)

(assert (=> b!1263533 m!1164375))

(declare-fun m!1164377 () Bool)

(assert (=> b!1263535 m!1164377))

(declare-fun m!1164379 () Bool)

(assert (=> b!1263543 m!1164379))

(assert (=> b!1263542 m!1164335))

(assert (=> b!1263542 m!1164335))

(assert (=> b!1263542 m!1164337))

(declare-fun m!1164381 () Bool)

(assert (=> d!138967 m!1164381))

(assert (=> d!138967 m!1164269))

(assert (=> b!1263534 m!1164335))

(assert (=> b!1263534 m!1164335))

(assert (=> b!1263534 m!1164337))

(assert (=> b!1263538 m!1164357))

(assert (=> b!1263538 m!1164359))

(assert (=> b!1263538 m!1164357))

(assert (=> b!1263538 m!1164361))

(declare-fun m!1164383 () Bool)

(assert (=> b!1263538 m!1164383))

(declare-fun m!1164385 () Bool)

(assert (=> b!1263538 m!1164385))

(assert (=> b!1263538 m!1164359))

(assert (=> b!1263538 m!1164335))

(assert (=> b!1263538 m!1164383))

(declare-fun m!1164387 () Bool)

(assert (=> b!1263538 m!1164387))

(declare-fun m!1164389 () Bool)

(assert (=> b!1263538 m!1164389))

(assert (=> b!1263539 m!1164359))

(assert (=> b!1263539 m!1164357))

(assert (=> b!1263539 m!1164361))

(assert (=> b!1263539 m!1164359))

(assert (=> b!1263539 m!1164335))

(assert (=> b!1263539 m!1164335))

(declare-fun m!1164391 () Bool)

(assert (=> b!1263539 m!1164391))

(assert (=> b!1263539 m!1164357))

(assert (=> b!1263537 m!1164335))

(assert (=> b!1263537 m!1164335))

(declare-fun m!1164393 () Bool)

(assert (=> b!1263537 m!1164393))

(assert (=> bm!62104 m!1164377))

(assert (=> b!1263433 d!138967))

(declare-fun d!138969 () Bool)

(assert (=> d!138969 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106204 d!138969))

(declare-fun d!138971 () Bool)

(assert (=> d!138971 (= (array_inv!30411 _keys!1118) (bvsge (size!40285 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106204 d!138971))

(declare-fun d!138973 () Bool)

(assert (=> d!138973 (= (array_inv!30412 _values!914) (bvsge (size!40286 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106204 d!138973))

(declare-fun b!1263554 () Bool)

(declare-fun e!719342 () Bool)

(declare-fun call!62110 () Bool)

(assert (=> b!1263554 (= e!719342 call!62110)))

(declare-fun bm!62107 () Bool)

(declare-fun c!123184 () Bool)

(assert (=> bm!62107 (= call!62110 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123184 (Cons!28262 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000) Nil!28263) Nil!28263)))))

(declare-fun b!1263555 () Bool)

(assert (=> b!1263555 (= e!719342 call!62110)))

(declare-fun b!1263556 () Bool)

(declare-fun e!719345 () Bool)

(declare-fun e!719344 () Bool)

(assert (=> b!1263556 (= e!719345 e!719344)))

(declare-fun res!841480 () Bool)

(assert (=> b!1263556 (=> (not res!841480) (not e!719344))))

(declare-fun e!719343 () Bool)

(assert (=> b!1263556 (= res!841480 (not e!719343))))

(declare-fun res!841482 () Bool)

(assert (=> b!1263556 (=> (not res!841482) (not e!719343))))

(assert (=> b!1263556 (= res!841482 (validKeyInArray!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263557 () Bool)

(assert (=> b!1263557 (= e!719344 e!719342)))

(assert (=> b!1263557 (= c!123184 (validKeyInArray!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263558 () Bool)

(declare-fun contains!7616 (List!28266 (_ BitVec 64)) Bool)

(assert (=> b!1263558 (= e!719343 (contains!7616 Nil!28263 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138975 () Bool)

(declare-fun res!841481 () Bool)

(assert (=> d!138975 (=> res!841481 e!719345)))

(assert (=> d!138975 (= res!841481 (bvsge #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(assert (=> d!138975 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28263) e!719345)))

(assert (= (and d!138975 (not res!841481)) b!1263556))

(assert (= (and b!1263556 res!841482) b!1263558))

(assert (= (and b!1263556 res!841480) b!1263557))

(assert (= (and b!1263557 c!123184) b!1263555))

(assert (= (and b!1263557 (not c!123184)) b!1263554))

(assert (= (or b!1263555 b!1263554) bm!62107))

(assert (=> bm!62107 m!1164335))

(declare-fun m!1164395 () Bool)

(assert (=> bm!62107 m!1164395))

(assert (=> b!1263556 m!1164335))

(assert (=> b!1263556 m!1164335))

(assert (=> b!1263556 m!1164337))

(assert (=> b!1263557 m!1164335))

(assert (=> b!1263557 m!1164335))

(assert (=> b!1263557 m!1164337))

(assert (=> b!1263558 m!1164335))

(assert (=> b!1263558 m!1164335))

(declare-fun m!1164397 () Bool)

(assert (=> b!1263558 m!1164397))

(assert (=> b!1263431 d!138975))

(declare-fun b!1263601 () Bool)

(declare-fun e!719372 () Unit!42051)

(declare-fun lt!572660 () Unit!42051)

(assert (=> b!1263601 (= e!719372 lt!572660)))

(declare-fun lt!572648 () ListLongMap!18923)

(assert (=> b!1263601 (= lt!572648 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572647 () (_ BitVec 64))

(assert (=> b!1263601 (= lt!572647 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572642 () (_ BitVec 64))

(assert (=> b!1263601 (= lt!572642 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572643 () Unit!42051)

(declare-fun addStillContains!1095 (ListLongMap!18923 (_ BitVec 64) V!48527 (_ BitVec 64)) Unit!42051)

(assert (=> b!1263601 (= lt!572643 (addStillContains!1095 lt!572648 lt!572647 zeroValue!871 lt!572642))))

(assert (=> b!1263601 (contains!7615 (+!4289 lt!572648 (tuple2!21043 lt!572647 zeroValue!871)) lt!572642)))

(declare-fun lt!572653 () Unit!42051)

(assert (=> b!1263601 (= lt!572653 lt!572643)))

(declare-fun lt!572651 () ListLongMap!18923)

(assert (=> b!1263601 (= lt!572651 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572655 () (_ BitVec 64))

(assert (=> b!1263601 (= lt!572655 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572650 () (_ BitVec 64))

(assert (=> b!1263601 (= lt!572650 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572646 () Unit!42051)

(declare-fun addApplyDifferent!537 (ListLongMap!18923 (_ BitVec 64) V!48527 (_ BitVec 64)) Unit!42051)

(assert (=> b!1263601 (= lt!572646 (addApplyDifferent!537 lt!572651 lt!572655 minValueBefore!43 lt!572650))))

(assert (=> b!1263601 (= (apply!1006 (+!4289 lt!572651 (tuple2!21043 lt!572655 minValueBefore!43)) lt!572650) (apply!1006 lt!572651 lt!572650))))

(declare-fun lt!572654 () Unit!42051)

(assert (=> b!1263601 (= lt!572654 lt!572646)))

(declare-fun lt!572649 () ListLongMap!18923)

(assert (=> b!1263601 (= lt!572649 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572644 () (_ BitVec 64))

(assert (=> b!1263601 (= lt!572644 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572658 () (_ BitVec 64))

(assert (=> b!1263601 (= lt!572658 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572661 () Unit!42051)

(assert (=> b!1263601 (= lt!572661 (addApplyDifferent!537 lt!572649 lt!572644 zeroValue!871 lt!572658))))

(assert (=> b!1263601 (= (apply!1006 (+!4289 lt!572649 (tuple2!21043 lt!572644 zeroValue!871)) lt!572658) (apply!1006 lt!572649 lt!572658))))

(declare-fun lt!572657 () Unit!42051)

(assert (=> b!1263601 (= lt!572657 lt!572661)))

(declare-fun lt!572656 () ListLongMap!18923)

(assert (=> b!1263601 (= lt!572656 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572659 () (_ BitVec 64))

(assert (=> b!1263601 (= lt!572659 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572645 () (_ BitVec 64))

(assert (=> b!1263601 (= lt!572645 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263601 (= lt!572660 (addApplyDifferent!537 lt!572656 lt!572659 minValueBefore!43 lt!572645))))

(assert (=> b!1263601 (= (apply!1006 (+!4289 lt!572656 (tuple2!21043 lt!572659 minValueBefore!43)) lt!572645) (apply!1006 lt!572656 lt!572645))))

(declare-fun c!123199 () Bool)

(declare-fun call!62126 () ListLongMap!18923)

(declare-fun c!123201 () Bool)

(declare-fun call!62128 () ListLongMap!18923)

(declare-fun bm!62122 () Bool)

(declare-fun call!62129 () ListLongMap!18923)

(declare-fun call!62130 () ListLongMap!18923)

(assert (=> bm!62122 (= call!62130 (+!4289 (ite c!123201 call!62126 (ite c!123199 call!62129 call!62128)) (ite (or c!123201 c!123199) (tuple2!21043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1263602 () Bool)

(declare-fun e!719384 () Bool)

(declare-fun e!719382 () Bool)

(assert (=> b!1263602 (= e!719384 e!719382)))

(declare-fun res!841505 () Bool)

(declare-fun call!62127 () Bool)

(assert (=> b!1263602 (= res!841505 call!62127)))

(assert (=> b!1263602 (=> (not res!841505) (not e!719382))))

(declare-fun b!1263603 () Bool)

(declare-fun Unit!42053 () Unit!42051)

(assert (=> b!1263603 (= e!719372 Unit!42053)))

(declare-fun bm!62123 () Bool)

(assert (=> bm!62123 (= call!62128 call!62129)))

(declare-fun bm!62124 () Bool)

(assert (=> bm!62124 (= call!62129 call!62126)))

(declare-fun b!1263605 () Bool)

(declare-fun e!719380 () ListLongMap!18923)

(assert (=> b!1263605 (= e!719380 call!62128)))

(declare-fun b!1263606 () Bool)

(declare-fun call!62131 () ListLongMap!18923)

(assert (=> b!1263606 (= e!719380 call!62131)))

(declare-fun b!1263607 () Bool)

(declare-fun e!719379 () Bool)

(declare-fun e!719377 () Bool)

(assert (=> b!1263607 (= e!719379 e!719377)))

(declare-fun res!841502 () Bool)

(assert (=> b!1263607 (=> (not res!841502) (not e!719377))))

(declare-fun lt!572641 () ListLongMap!18923)

(assert (=> b!1263607 (= res!841502 (contains!7615 lt!572641 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263607 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun bm!62125 () Bool)

(assert (=> bm!62125 (= call!62131 call!62130)))

(declare-fun bm!62126 () Bool)

(assert (=> bm!62126 (= call!62126 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263608 () Bool)

(declare-fun e!719383 () Bool)

(declare-fun call!62125 () Bool)

(assert (=> b!1263608 (= e!719383 (not call!62125))))

(declare-fun b!1263609 () Bool)

(declare-fun e!719374 () Bool)

(assert (=> b!1263609 (= e!719383 e!719374)))

(declare-fun res!841509 () Bool)

(assert (=> b!1263609 (= res!841509 call!62125)))

(assert (=> b!1263609 (=> (not res!841509) (not e!719374))))

(declare-fun b!1263610 () Bool)

(declare-fun e!719376 () ListLongMap!18923)

(declare-fun e!719373 () ListLongMap!18923)

(assert (=> b!1263610 (= e!719376 e!719373)))

(assert (=> b!1263610 (= c!123199 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263604 () Bool)

(assert (=> b!1263604 (= e!719377 (= (apply!1006 lt!572641 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)) (get!20323 (select (arr!39749 _values!914) #b00000000000000000000000000000000) (dynLambda!3458 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40286 _values!914)))))

(assert (=> b!1263604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun d!138977 () Bool)

(declare-fun e!719378 () Bool)

(assert (=> d!138977 e!719378))

(declare-fun res!841504 () Bool)

(assert (=> d!138977 (=> (not res!841504) (not e!719378))))

(assert (=> d!138977 (= res!841504 (or (bvsge #b00000000000000000000000000000000 (size!40285 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))))

(declare-fun lt!572640 () ListLongMap!18923)

(assert (=> d!138977 (= lt!572641 lt!572640)))

(declare-fun lt!572652 () Unit!42051)

(assert (=> d!138977 (= lt!572652 e!719372)))

(declare-fun c!123198 () Bool)

(declare-fun e!719381 () Bool)

(assert (=> d!138977 (= c!123198 e!719381)))

(declare-fun res!841501 () Bool)

(assert (=> d!138977 (=> (not res!841501) (not e!719381))))

(assert (=> d!138977 (= res!841501 (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(assert (=> d!138977 (= lt!572640 e!719376)))

(assert (=> d!138977 (= c!123201 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138977 (validMask!0 mask!1466)))

(assert (=> d!138977 (= (getCurrentListMap!4630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572641)))

(declare-fun b!1263611 () Bool)

(assert (=> b!1263611 (= e!719381 (validKeyInArray!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263612 () Bool)

(declare-fun res!841506 () Bool)

(assert (=> b!1263612 (=> (not res!841506) (not e!719378))))

(assert (=> b!1263612 (= res!841506 e!719383)))

(declare-fun c!123202 () Bool)

(assert (=> b!1263612 (= c!123202 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1263613 () Bool)

(declare-fun res!841503 () Bool)

(assert (=> b!1263613 (=> (not res!841503) (not e!719378))))

(assert (=> b!1263613 (= res!841503 e!719379)))

(declare-fun res!841508 () Bool)

(assert (=> b!1263613 (=> res!841508 e!719379)))

(declare-fun e!719375 () Bool)

(assert (=> b!1263613 (= res!841508 (not e!719375))))

(declare-fun res!841507 () Bool)

(assert (=> b!1263613 (=> (not res!841507) (not e!719375))))

(assert (=> b!1263613 (= res!841507 (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun b!1263614 () Bool)

(assert (=> b!1263614 (= e!719374 (= (apply!1006 lt!572641 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1263615 () Bool)

(assert (=> b!1263615 (= e!719376 (+!4289 call!62130 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1263616 () Bool)

(assert (=> b!1263616 (= e!719384 (not call!62127))))

(declare-fun bm!62127 () Bool)

(assert (=> bm!62127 (= call!62127 (contains!7615 lt!572641 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62128 () Bool)

(assert (=> bm!62128 (= call!62125 (contains!7615 lt!572641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263617 () Bool)

(assert (=> b!1263617 (= e!719373 call!62131)))

(declare-fun b!1263618 () Bool)

(assert (=> b!1263618 (= e!719382 (= (apply!1006 lt!572641 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1263619 () Bool)

(assert (=> b!1263619 (= e!719378 e!719384)))

(declare-fun c!123197 () Bool)

(assert (=> b!1263619 (= c!123197 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263620 () Bool)

(declare-fun c!123200 () Bool)

(assert (=> b!1263620 (= c!123200 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263620 (= e!719373 e!719380)))

(declare-fun b!1263621 () Bool)

(assert (=> b!1263621 (= e!719375 (validKeyInArray!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138977 c!123201) b!1263615))

(assert (= (and d!138977 (not c!123201)) b!1263610))

(assert (= (and b!1263610 c!123199) b!1263617))

(assert (= (and b!1263610 (not c!123199)) b!1263620))

(assert (= (and b!1263620 c!123200) b!1263606))

(assert (= (and b!1263620 (not c!123200)) b!1263605))

(assert (= (or b!1263606 b!1263605) bm!62123))

(assert (= (or b!1263617 bm!62123) bm!62124))

(assert (= (or b!1263617 b!1263606) bm!62125))

(assert (= (or b!1263615 bm!62124) bm!62126))

(assert (= (or b!1263615 bm!62125) bm!62122))

(assert (= (and d!138977 res!841501) b!1263611))

(assert (= (and d!138977 c!123198) b!1263601))

(assert (= (and d!138977 (not c!123198)) b!1263603))

(assert (= (and d!138977 res!841504) b!1263613))

(assert (= (and b!1263613 res!841507) b!1263621))

(assert (= (and b!1263613 (not res!841508)) b!1263607))

(assert (= (and b!1263607 res!841502) b!1263604))

(assert (= (and b!1263613 res!841503) b!1263612))

(assert (= (and b!1263612 c!123202) b!1263609))

(assert (= (and b!1263612 (not c!123202)) b!1263608))

(assert (= (and b!1263609 res!841509) b!1263614))

(assert (= (or b!1263609 b!1263608) bm!62128))

(assert (= (and b!1263612 res!841506) b!1263619))

(assert (= (and b!1263619 c!123197) b!1263602))

(assert (= (and b!1263619 (not c!123197)) b!1263616))

(assert (= (and b!1263602 res!841505) b!1263618))

(assert (= (or b!1263602 b!1263616) bm!62127))

(declare-fun b_lambda!22853 () Bool)

(assert (=> (not b_lambda!22853) (not b!1263604)))

(assert (=> b!1263604 t!41767))

(declare-fun b_and!45423 () Bool)

(assert (= b_and!45421 (and (=> t!41767 result!23363) b_and!45423)))

(declare-fun m!1164399 () Bool)

(assert (=> b!1263615 m!1164399))

(declare-fun m!1164401 () Bool)

(assert (=> bm!62127 m!1164401))

(assert (=> b!1263611 m!1164335))

(assert (=> b!1263611 m!1164335))

(assert (=> b!1263611 m!1164337))

(declare-fun m!1164403 () Bool)

(assert (=> bm!62128 m!1164403))

(declare-fun m!1164405 () Bool)

(assert (=> b!1263614 m!1164405))

(assert (=> d!138977 m!1164269))

(declare-fun m!1164407 () Bool)

(assert (=> bm!62122 m!1164407))

(declare-fun m!1164409 () Bool)

(assert (=> b!1263618 m!1164409))

(assert (=> b!1263621 m!1164335))

(assert (=> b!1263621 m!1164335))

(assert (=> b!1263621 m!1164337))

(declare-fun m!1164411 () Bool)

(assert (=> b!1263601 m!1164411))

(declare-fun m!1164413 () Bool)

(assert (=> b!1263601 m!1164413))

(declare-fun m!1164415 () Bool)

(assert (=> b!1263601 m!1164415))

(assert (=> b!1263601 m!1164279))

(declare-fun m!1164417 () Bool)

(assert (=> b!1263601 m!1164417))

(declare-fun m!1164419 () Bool)

(assert (=> b!1263601 m!1164419))

(declare-fun m!1164421 () Bool)

(assert (=> b!1263601 m!1164421))

(declare-fun m!1164423 () Bool)

(assert (=> b!1263601 m!1164423))

(declare-fun m!1164425 () Bool)

(assert (=> b!1263601 m!1164425))

(declare-fun m!1164427 () Bool)

(assert (=> b!1263601 m!1164427))

(declare-fun m!1164429 () Bool)

(assert (=> b!1263601 m!1164429))

(declare-fun m!1164431 () Bool)

(assert (=> b!1263601 m!1164431))

(assert (=> b!1263601 m!1164423))

(declare-fun m!1164433 () Bool)

(assert (=> b!1263601 m!1164433))

(assert (=> b!1263601 m!1164413))

(assert (=> b!1263601 m!1164433))

(declare-fun m!1164435 () Bool)

(assert (=> b!1263601 m!1164435))

(assert (=> b!1263601 m!1164335))

(declare-fun m!1164437 () Bool)

(assert (=> b!1263601 m!1164437))

(assert (=> b!1263601 m!1164429))

(declare-fun m!1164439 () Bool)

(assert (=> b!1263601 m!1164439))

(assert (=> bm!62126 m!1164279))

(assert (=> b!1263607 m!1164335))

(assert (=> b!1263607 m!1164335))

(declare-fun m!1164441 () Bool)

(assert (=> b!1263607 m!1164441))

(assert (=> b!1263604 m!1164359))

(assert (=> b!1263604 m!1164357))

(assert (=> b!1263604 m!1164361))

(assert (=> b!1263604 m!1164335))

(declare-fun m!1164443 () Bool)

(assert (=> b!1263604 m!1164443))

(assert (=> b!1263604 m!1164359))

(assert (=> b!1263604 m!1164357))

(assert (=> b!1263604 m!1164335))

(assert (=> b!1263426 d!138977))

(declare-fun d!138979 () Bool)

(declare-fun e!719387 () Bool)

(assert (=> d!138979 e!719387))

(declare-fun res!841515 () Bool)

(assert (=> d!138979 (=> (not res!841515) (not e!719387))))

(declare-fun lt!572673 () ListLongMap!18923)

(assert (=> d!138979 (= res!841515 (contains!7615 lt!572673 (_1!10532 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572672 () List!28265)

(assert (=> d!138979 (= lt!572673 (ListLongMap!18924 lt!572672))))

(declare-fun lt!572670 () Unit!42051)

(declare-fun lt!572671 () Unit!42051)

(assert (=> d!138979 (= lt!572670 lt!572671)))

(declare-datatypes ((Option!709 0))(
  ( (Some!708 (v!18953 V!48527)) (None!707) )
))
(declare-fun getValueByKey!658 (List!28265 (_ BitVec 64)) Option!709)

(assert (=> d!138979 (= (getValueByKey!658 lt!572672 (_1!10532 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!708 (_2!10532 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!334 (List!28265 (_ BitVec 64) V!48527) Unit!42051)

(assert (=> d!138979 (= lt!572671 (lemmaContainsTupThenGetReturnValue!334 lt!572672 (_1!10532 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10532 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!448 (List!28265 (_ BitVec 64) V!48527) List!28265)

(assert (=> d!138979 (= lt!572672 (insertStrictlySorted!448 (toList!9477 lt!572531) (_1!10532 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10532 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138979 (= (+!4289 lt!572531 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!572673)))

(declare-fun b!1263626 () Bool)

(declare-fun res!841514 () Bool)

(assert (=> b!1263626 (=> (not res!841514) (not e!719387))))

(assert (=> b!1263626 (= res!841514 (= (getValueByKey!658 (toList!9477 lt!572673) (_1!10532 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!708 (_2!10532 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1263627 () Bool)

(declare-fun contains!7617 (List!28265 tuple2!21042) Bool)

(assert (=> b!1263627 (= e!719387 (contains!7617 (toList!9477 lt!572673) (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138979 res!841515) b!1263626))

(assert (= (and b!1263626 res!841514) b!1263627))

(declare-fun m!1164445 () Bool)

(assert (=> d!138979 m!1164445))

(declare-fun m!1164447 () Bool)

(assert (=> d!138979 m!1164447))

(declare-fun m!1164449 () Bool)

(assert (=> d!138979 m!1164449))

(declare-fun m!1164451 () Bool)

(assert (=> d!138979 m!1164451))

(declare-fun m!1164453 () Bool)

(assert (=> b!1263626 m!1164453))

(declare-fun m!1164455 () Bool)

(assert (=> b!1263627 m!1164455))

(assert (=> b!1263426 d!138979))

(declare-fun b!1263628 () Bool)

(declare-fun e!719388 () Unit!42051)

(declare-fun lt!572694 () Unit!42051)

(assert (=> b!1263628 (= e!719388 lt!572694)))

(declare-fun lt!572682 () ListLongMap!18923)

(assert (=> b!1263628 (= lt!572682 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572681 () (_ BitVec 64))

(assert (=> b!1263628 (= lt!572681 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572676 () (_ BitVec 64))

(assert (=> b!1263628 (= lt!572676 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572677 () Unit!42051)

(assert (=> b!1263628 (= lt!572677 (addStillContains!1095 lt!572682 lt!572681 zeroValue!871 lt!572676))))

(assert (=> b!1263628 (contains!7615 (+!4289 lt!572682 (tuple2!21043 lt!572681 zeroValue!871)) lt!572676)))

(declare-fun lt!572687 () Unit!42051)

(assert (=> b!1263628 (= lt!572687 lt!572677)))

(declare-fun lt!572685 () ListLongMap!18923)

(assert (=> b!1263628 (= lt!572685 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572689 () (_ BitVec 64))

(assert (=> b!1263628 (= lt!572689 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572684 () (_ BitVec 64))

(assert (=> b!1263628 (= lt!572684 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572680 () Unit!42051)

(assert (=> b!1263628 (= lt!572680 (addApplyDifferent!537 lt!572685 lt!572689 minValueAfter!43 lt!572684))))

(assert (=> b!1263628 (= (apply!1006 (+!4289 lt!572685 (tuple2!21043 lt!572689 minValueAfter!43)) lt!572684) (apply!1006 lt!572685 lt!572684))))

(declare-fun lt!572688 () Unit!42051)

(assert (=> b!1263628 (= lt!572688 lt!572680)))

(declare-fun lt!572683 () ListLongMap!18923)

(assert (=> b!1263628 (= lt!572683 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572678 () (_ BitVec 64))

(assert (=> b!1263628 (= lt!572678 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572692 () (_ BitVec 64))

(assert (=> b!1263628 (= lt!572692 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572695 () Unit!42051)

(assert (=> b!1263628 (= lt!572695 (addApplyDifferent!537 lt!572683 lt!572678 zeroValue!871 lt!572692))))

(assert (=> b!1263628 (= (apply!1006 (+!4289 lt!572683 (tuple2!21043 lt!572678 zeroValue!871)) lt!572692) (apply!1006 lt!572683 lt!572692))))

(declare-fun lt!572691 () Unit!42051)

(assert (=> b!1263628 (= lt!572691 lt!572695)))

(declare-fun lt!572690 () ListLongMap!18923)

(assert (=> b!1263628 (= lt!572690 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572693 () (_ BitVec 64))

(assert (=> b!1263628 (= lt!572693 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572679 () (_ BitVec 64))

(assert (=> b!1263628 (= lt!572679 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263628 (= lt!572694 (addApplyDifferent!537 lt!572690 lt!572693 minValueAfter!43 lt!572679))))

(assert (=> b!1263628 (= (apply!1006 (+!4289 lt!572690 (tuple2!21043 lt!572693 minValueAfter!43)) lt!572679) (apply!1006 lt!572690 lt!572679))))

(declare-fun call!62136 () ListLongMap!18923)

(declare-fun call!62137 () ListLongMap!18923)

(declare-fun call!62133 () ListLongMap!18923)

(declare-fun bm!62129 () Bool)

(declare-fun c!123207 () Bool)

(declare-fun call!62135 () ListLongMap!18923)

(declare-fun c!123205 () Bool)

(assert (=> bm!62129 (= call!62137 (+!4289 (ite c!123207 call!62133 (ite c!123205 call!62136 call!62135)) (ite (or c!123207 c!123205) (tuple2!21043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1263629 () Bool)

(declare-fun e!719400 () Bool)

(declare-fun e!719398 () Bool)

(assert (=> b!1263629 (= e!719400 e!719398)))

(declare-fun res!841520 () Bool)

(declare-fun call!62134 () Bool)

(assert (=> b!1263629 (= res!841520 call!62134)))

(assert (=> b!1263629 (=> (not res!841520) (not e!719398))))

(declare-fun b!1263630 () Bool)

(declare-fun Unit!42054 () Unit!42051)

(assert (=> b!1263630 (= e!719388 Unit!42054)))

(declare-fun bm!62130 () Bool)

(assert (=> bm!62130 (= call!62135 call!62136)))

(declare-fun bm!62131 () Bool)

(assert (=> bm!62131 (= call!62136 call!62133)))

(declare-fun b!1263632 () Bool)

(declare-fun e!719396 () ListLongMap!18923)

(assert (=> b!1263632 (= e!719396 call!62135)))

(declare-fun b!1263633 () Bool)

(declare-fun call!62138 () ListLongMap!18923)

(assert (=> b!1263633 (= e!719396 call!62138)))

(declare-fun b!1263634 () Bool)

(declare-fun e!719395 () Bool)

(declare-fun e!719393 () Bool)

(assert (=> b!1263634 (= e!719395 e!719393)))

(declare-fun res!841517 () Bool)

(assert (=> b!1263634 (=> (not res!841517) (not e!719393))))

(declare-fun lt!572675 () ListLongMap!18923)

(assert (=> b!1263634 (= res!841517 (contains!7615 lt!572675 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263634 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun bm!62132 () Bool)

(assert (=> bm!62132 (= call!62138 call!62137)))

(declare-fun bm!62133 () Bool)

(assert (=> bm!62133 (= call!62133 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263635 () Bool)

(declare-fun e!719399 () Bool)

(declare-fun call!62132 () Bool)

(assert (=> b!1263635 (= e!719399 (not call!62132))))

(declare-fun b!1263636 () Bool)

(declare-fun e!719390 () Bool)

(assert (=> b!1263636 (= e!719399 e!719390)))

(declare-fun res!841524 () Bool)

(assert (=> b!1263636 (= res!841524 call!62132)))

(assert (=> b!1263636 (=> (not res!841524) (not e!719390))))

(declare-fun b!1263637 () Bool)

(declare-fun e!719392 () ListLongMap!18923)

(declare-fun e!719389 () ListLongMap!18923)

(assert (=> b!1263637 (= e!719392 e!719389)))

(assert (=> b!1263637 (= c!123205 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263631 () Bool)

(assert (=> b!1263631 (= e!719393 (= (apply!1006 lt!572675 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)) (get!20323 (select (arr!39749 _values!914) #b00000000000000000000000000000000) (dynLambda!3458 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40286 _values!914)))))

(assert (=> b!1263631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun d!138981 () Bool)

(declare-fun e!719394 () Bool)

(assert (=> d!138981 e!719394))

(declare-fun res!841519 () Bool)

(assert (=> d!138981 (=> (not res!841519) (not e!719394))))

(assert (=> d!138981 (= res!841519 (or (bvsge #b00000000000000000000000000000000 (size!40285 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))))

(declare-fun lt!572674 () ListLongMap!18923)

(assert (=> d!138981 (= lt!572675 lt!572674)))

(declare-fun lt!572686 () Unit!42051)

(assert (=> d!138981 (= lt!572686 e!719388)))

(declare-fun c!123204 () Bool)

(declare-fun e!719397 () Bool)

(assert (=> d!138981 (= c!123204 e!719397)))

(declare-fun res!841516 () Bool)

(assert (=> d!138981 (=> (not res!841516) (not e!719397))))

(assert (=> d!138981 (= res!841516 (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(assert (=> d!138981 (= lt!572674 e!719392)))

(assert (=> d!138981 (= c!123207 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138981 (validMask!0 mask!1466)))

(assert (=> d!138981 (= (getCurrentListMap!4630 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572675)))

(declare-fun b!1263638 () Bool)

(assert (=> b!1263638 (= e!719397 (validKeyInArray!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263639 () Bool)

(declare-fun res!841521 () Bool)

(assert (=> b!1263639 (=> (not res!841521) (not e!719394))))

(assert (=> b!1263639 (= res!841521 e!719399)))

(declare-fun c!123208 () Bool)

(assert (=> b!1263639 (= c!123208 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1263640 () Bool)

(declare-fun res!841518 () Bool)

(assert (=> b!1263640 (=> (not res!841518) (not e!719394))))

(assert (=> b!1263640 (= res!841518 e!719395)))

(declare-fun res!841523 () Bool)

(assert (=> b!1263640 (=> res!841523 e!719395)))

(declare-fun e!719391 () Bool)

(assert (=> b!1263640 (= res!841523 (not e!719391))))

(declare-fun res!841522 () Bool)

(assert (=> b!1263640 (=> (not res!841522) (not e!719391))))

(assert (=> b!1263640 (= res!841522 (bvslt #b00000000000000000000000000000000 (size!40285 _keys!1118)))))

(declare-fun b!1263641 () Bool)

(assert (=> b!1263641 (= e!719390 (= (apply!1006 lt!572675 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1263642 () Bool)

(assert (=> b!1263642 (= e!719392 (+!4289 call!62137 (tuple2!21043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1263643 () Bool)

(assert (=> b!1263643 (= e!719400 (not call!62134))))

(declare-fun bm!62134 () Bool)

(assert (=> bm!62134 (= call!62134 (contains!7615 lt!572675 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62135 () Bool)

(assert (=> bm!62135 (= call!62132 (contains!7615 lt!572675 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263644 () Bool)

(assert (=> b!1263644 (= e!719389 call!62138)))

(declare-fun b!1263645 () Bool)

(assert (=> b!1263645 (= e!719398 (= (apply!1006 lt!572675 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1263646 () Bool)

(assert (=> b!1263646 (= e!719394 e!719400)))

(declare-fun c!123203 () Bool)

(assert (=> b!1263646 (= c!123203 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263647 () Bool)

(declare-fun c!123206 () Bool)

(assert (=> b!1263647 (= c!123206 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263647 (= e!719389 e!719396)))

(declare-fun b!1263648 () Bool)

(assert (=> b!1263648 (= e!719391 (validKeyInArray!0 (select (arr!39748 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138981 c!123207) b!1263642))

(assert (= (and d!138981 (not c!123207)) b!1263637))

(assert (= (and b!1263637 c!123205) b!1263644))

(assert (= (and b!1263637 (not c!123205)) b!1263647))

(assert (= (and b!1263647 c!123206) b!1263633))

(assert (= (and b!1263647 (not c!123206)) b!1263632))

(assert (= (or b!1263633 b!1263632) bm!62130))

(assert (= (or b!1263644 bm!62130) bm!62131))

(assert (= (or b!1263644 b!1263633) bm!62132))

(assert (= (or b!1263642 bm!62131) bm!62133))

(assert (= (or b!1263642 bm!62132) bm!62129))

(assert (= (and d!138981 res!841516) b!1263638))

(assert (= (and d!138981 c!123204) b!1263628))

(assert (= (and d!138981 (not c!123204)) b!1263630))

(assert (= (and d!138981 res!841519) b!1263640))

(assert (= (and b!1263640 res!841522) b!1263648))

(assert (= (and b!1263640 (not res!841523)) b!1263634))

(assert (= (and b!1263634 res!841517) b!1263631))

(assert (= (and b!1263640 res!841518) b!1263639))

(assert (= (and b!1263639 c!123208) b!1263636))

(assert (= (and b!1263639 (not c!123208)) b!1263635))

(assert (= (and b!1263636 res!841524) b!1263641))

(assert (= (or b!1263636 b!1263635) bm!62135))

(assert (= (and b!1263639 res!841521) b!1263646))

(assert (= (and b!1263646 c!123203) b!1263629))

(assert (= (and b!1263646 (not c!123203)) b!1263643))

(assert (= (and b!1263629 res!841520) b!1263645))

(assert (= (or b!1263629 b!1263643) bm!62134))

(declare-fun b_lambda!22855 () Bool)

(assert (=> (not b_lambda!22855) (not b!1263631)))

(assert (=> b!1263631 t!41767))

(declare-fun b_and!45425 () Bool)

(assert (= b_and!45423 (and (=> t!41767 result!23363) b_and!45425)))

(declare-fun m!1164457 () Bool)

(assert (=> b!1263642 m!1164457))

(declare-fun m!1164459 () Bool)

(assert (=> bm!62134 m!1164459))

(assert (=> b!1263638 m!1164335))

(assert (=> b!1263638 m!1164335))

(assert (=> b!1263638 m!1164337))

(declare-fun m!1164461 () Bool)

(assert (=> bm!62135 m!1164461))

(declare-fun m!1164463 () Bool)

(assert (=> b!1263641 m!1164463))

(assert (=> d!138981 m!1164269))

(declare-fun m!1164465 () Bool)

(assert (=> bm!62129 m!1164465))

(declare-fun m!1164467 () Bool)

(assert (=> b!1263645 m!1164467))

(assert (=> b!1263648 m!1164335))

(assert (=> b!1263648 m!1164335))

(assert (=> b!1263648 m!1164337))

(declare-fun m!1164469 () Bool)

(assert (=> b!1263628 m!1164469))

(declare-fun m!1164471 () Bool)

(assert (=> b!1263628 m!1164471))

(declare-fun m!1164473 () Bool)

(assert (=> b!1263628 m!1164473))

(assert (=> b!1263628 m!1164277))

(declare-fun m!1164475 () Bool)

(assert (=> b!1263628 m!1164475))

(declare-fun m!1164477 () Bool)

(assert (=> b!1263628 m!1164477))

(declare-fun m!1164479 () Bool)

(assert (=> b!1263628 m!1164479))

(declare-fun m!1164481 () Bool)

(assert (=> b!1263628 m!1164481))

(declare-fun m!1164483 () Bool)

(assert (=> b!1263628 m!1164483))

(declare-fun m!1164485 () Bool)

(assert (=> b!1263628 m!1164485))

(declare-fun m!1164487 () Bool)

(assert (=> b!1263628 m!1164487))

(declare-fun m!1164489 () Bool)

(assert (=> b!1263628 m!1164489))

(assert (=> b!1263628 m!1164481))

(declare-fun m!1164491 () Bool)

(assert (=> b!1263628 m!1164491))

(assert (=> b!1263628 m!1164471))

(assert (=> b!1263628 m!1164491))

(declare-fun m!1164493 () Bool)

(assert (=> b!1263628 m!1164493))

(assert (=> b!1263628 m!1164335))

(declare-fun m!1164495 () Bool)

(assert (=> b!1263628 m!1164495))

(assert (=> b!1263628 m!1164487))

(declare-fun m!1164497 () Bool)

(assert (=> b!1263628 m!1164497))

(assert (=> bm!62133 m!1164277))

(assert (=> b!1263634 m!1164335))

(assert (=> b!1263634 m!1164335))

(declare-fun m!1164499 () Bool)

(assert (=> b!1263634 m!1164499))

(assert (=> b!1263631 m!1164359))

(assert (=> b!1263631 m!1164357))

(assert (=> b!1263631 m!1164361))

(assert (=> b!1263631 m!1164335))

(declare-fun m!1164501 () Bool)

(assert (=> b!1263631 m!1164501))

(assert (=> b!1263631 m!1164359))

(assert (=> b!1263631 m!1164357))

(assert (=> b!1263631 m!1164335))

(assert (=> b!1263426 d!138981))

(declare-fun b!1263656 () Bool)

(declare-fun e!719405 () Bool)

(assert (=> b!1263656 (= e!719405 tp_is_empty!32371)))

(declare-fun mapNonEmpty!50377 () Bool)

(declare-fun mapRes!50377 () Bool)

(declare-fun tp!95963 () Bool)

(declare-fun e!719406 () Bool)

(assert (=> mapNonEmpty!50377 (= mapRes!50377 (and tp!95963 e!719406))))

(declare-fun mapKey!50377 () (_ BitVec 32))

(declare-fun mapValue!50377 () ValueCell!15422)

(declare-fun mapRest!50377 () (Array (_ BitVec 32) ValueCell!15422))

(assert (=> mapNonEmpty!50377 (= mapRest!50368 (store mapRest!50377 mapKey!50377 mapValue!50377))))

(declare-fun mapIsEmpty!50377 () Bool)

(assert (=> mapIsEmpty!50377 mapRes!50377))

(declare-fun b!1263655 () Bool)

(assert (=> b!1263655 (= e!719406 tp_is_empty!32371)))

(declare-fun condMapEmpty!50377 () Bool)

(declare-fun mapDefault!50377 () ValueCell!15422)

(assert (=> mapNonEmpty!50368 (= condMapEmpty!50377 (= mapRest!50368 ((as const (Array (_ BitVec 32) ValueCell!15422)) mapDefault!50377)))))

(assert (=> mapNonEmpty!50368 (= tp!95948 (and e!719405 mapRes!50377))))

(assert (= (and mapNonEmpty!50368 condMapEmpty!50377) mapIsEmpty!50377))

(assert (= (and mapNonEmpty!50368 (not condMapEmpty!50377)) mapNonEmpty!50377))

(assert (= (and mapNonEmpty!50377 ((_ is ValueCellFull!15422) mapValue!50377)) b!1263655))

(assert (= (and mapNonEmpty!50368 ((_ is ValueCellFull!15422) mapDefault!50377)) b!1263656))

(declare-fun m!1164503 () Bool)

(assert (=> mapNonEmpty!50377 m!1164503))

(declare-fun b_lambda!22857 () Bool)

(assert (= b_lambda!22855 (or (and start!106204 b_free!27469) b_lambda!22857)))

(declare-fun b_lambda!22859 () Bool)

(assert (= b_lambda!22851 (or (and start!106204 b_free!27469) b_lambda!22859)))

(declare-fun b_lambda!22861 () Bool)

(assert (= b_lambda!22845 (or (and start!106204 b_free!27469) b_lambda!22861)))

(declare-fun b_lambda!22863 () Bool)

(assert (= b_lambda!22853 (or (and start!106204 b_free!27469) b_lambda!22863)))

(declare-fun b_lambda!22865 () Bool)

(assert (= b_lambda!22847 (or (and start!106204 b_free!27469) b_lambda!22865)))

(declare-fun b_lambda!22867 () Bool)

(assert (= b_lambda!22849 (or (and start!106204 b_free!27469) b_lambda!22867)))

(check-sat (not b!1263538) (not bm!62133) (not d!138977) (not b!1263535) (not bm!62127) (not b!1263611) (not b_lambda!22865) (not b!1263641) (not b!1263519) (not bm!62128) (not b!1263528) (not bm!62129) (not bm!62126) (not b_lambda!22859) (not b!1263627) (not bm!62103) (not b!1263628) (not b!1263492) tp_is_empty!32371 (not b!1263648) (not b!1263626) (not b!1263533) (not bm!62104) (not b!1263634) (not d!138981) (not b!1263523) (not b!1263490) (not b!1263529) (not b!1263638) (not b!1263525) (not b!1263614) (not b!1263615) (not b_lambda!22867) (not b!1263642) (not mapNonEmpty!50377) (not bm!62135) (not b!1263601) (not b_next!27469) (not b!1263621) (not d!138963) (not b!1263558) (not bm!62122) (not b!1263542) (not b!1263607) (not b!1263556) (not b_lambda!22863) (not d!138965) (not d!138979) (not b!1263543) (not b!1263631) (not b!1263645) (not d!138967) (not b!1263539) (not bm!62134) (not bm!62100) (not b!1263521) (not b!1263618) (not b!1263524) b_and!45425 (not b!1263537) (not bm!62107) (not b!1263557) (not b_lambda!22857) (not b_lambda!22861) (not b!1263604) (not b!1263520) (not b!1263534))
(check-sat b_and!45425 (not b_next!27469))
