; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106000 () Bool)

(assert start!106000)

(declare-fun b_free!27475 () Bool)

(declare-fun b_next!27475 () Bool)

(assert (=> start!106000 (= b_free!27475 (not b_next!27475))))

(declare-fun tp!95969 () Bool)

(declare-fun b_and!45407 () Bool)

(assert (=> start!106000 (= tp!95969 b_and!45407)))

(declare-fun b!1262290 () Bool)

(declare-fun e!718538 () Bool)

(declare-fun e!718534 () Bool)

(assert (=> b!1262290 (= e!718538 (not e!718534))))

(declare-fun res!840984 () Bool)

(assert (=> b!1262290 (=> res!840984 e!718534)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262290 (= res!840984 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!718532 () Bool)

(assert (=> b!1262290 e!718532))

(declare-fun res!840981 () Bool)

(assert (=> b!1262290 (=> (not res!840981) (not e!718532))))

(declare-datatypes ((V!48535 0))(
  ( (V!48536 (val!16251 Int)) )
))
(declare-datatypes ((tuple2!21110 0))(
  ( (tuple2!21111 (_1!10566 (_ BitVec 64)) (_2!10566 V!48535)) )
))
(declare-datatypes ((List!28312 0))(
  ( (Nil!28309) (Cons!28308 (h!29517 tuple2!21110) (t!41810 List!28312)) )
))
(declare-datatypes ((ListLongMap!18983 0))(
  ( (ListLongMap!18984 (toList!9507 List!28312)) )
))
(declare-fun lt!572041 () ListLongMap!18983)

(declare-fun lt!572040 () ListLongMap!18983)

(assert (=> b!1262290 (= res!840981 (= lt!572041 lt!572040))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41925 0))(
  ( (Unit!41926) )
))
(declare-fun lt!572039 () Unit!41925)

(declare-fun minValueAfter!43 () V!48535)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48535)

(declare-datatypes ((array!82295 0))(
  ( (array!82296 (arr!39697 (Array (_ BitVec 32) (_ BitVec 64))) (size!40235 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82295)

(declare-fun minValueBefore!43 () V!48535)

(declare-datatypes ((ValueCell!15425 0))(
  ( (ValueCellFull!15425 (v!18957 V!48535)) (EmptyCell!15425) )
))
(declare-datatypes ((array!82297 0))(
  ( (array!82298 (arr!39698 (Array (_ BitVec 32) ValueCell!15425)) (size!40236 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82297)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1175 (array!82295 array!82297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48535 V!48535 V!48535 V!48535 (_ BitVec 32) Int) Unit!41925)

(assert (=> b!1262290 (= lt!572039 (lemmaNoChangeToArrayThenSameMapNoExtras!1175 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5875 (array!82295 array!82297 (_ BitVec 32) (_ BitVec 32) V!48535 V!48535 (_ BitVec 32) Int) ListLongMap!18983)

(assert (=> b!1262290 (= lt!572040 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262290 (= lt!572041 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262291 () Bool)

(declare-fun e!718537 () Bool)

(assert (=> b!1262291 (= e!718532 e!718537)))

(declare-fun res!840980 () Bool)

(assert (=> b!1262291 (=> res!840980 e!718537)))

(assert (=> b!1262291 (= res!840980 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262292 () Bool)

(declare-fun res!840979 () Bool)

(assert (=> b!1262292 (=> (not res!840979) (not e!718538))))

(assert (=> b!1262292 (= res!840979 (and (= (size!40236 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40235 _keys!1118) (size!40236 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262293 () Bool)

(declare-fun getCurrentListMap!4563 (array!82295 array!82297 (_ BitVec 32) (_ BitVec 32) V!48535 V!48535 (_ BitVec 32) Int) ListLongMap!18983)

(assert (=> b!1262293 (= e!718534 (= (getCurrentListMap!4563 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572040))))

(declare-fun mapIsEmpty!50380 () Bool)

(declare-fun mapRes!50380 () Bool)

(assert (=> mapIsEmpty!50380 mapRes!50380))

(declare-fun b!1262295 () Bool)

(declare-fun e!718536 () Bool)

(declare-fun tp_is_empty!32377 () Bool)

(assert (=> b!1262295 (= e!718536 tp_is_empty!32377)))

(declare-fun b!1262296 () Bool)

(declare-fun e!718535 () Bool)

(assert (=> b!1262296 (= e!718535 tp_is_empty!32377)))

(declare-fun mapNonEmpty!50380 () Bool)

(declare-fun tp!95968 () Bool)

(assert (=> mapNonEmpty!50380 (= mapRes!50380 (and tp!95968 e!718536))))

(declare-fun mapRest!50380 () (Array (_ BitVec 32) ValueCell!15425))

(declare-fun mapKey!50380 () (_ BitVec 32))

(declare-fun mapValue!50380 () ValueCell!15425)

(assert (=> mapNonEmpty!50380 (= (arr!39698 _values!914) (store mapRest!50380 mapKey!50380 mapValue!50380))))

(declare-fun b!1262297 () Bool)

(declare-fun res!840983 () Bool)

(assert (=> b!1262297 (=> (not res!840983) (not e!718538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82295 (_ BitVec 32)) Bool)

(assert (=> b!1262297 (= res!840983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262298 () Bool)

(declare-fun e!718533 () Bool)

(assert (=> b!1262298 (= e!718533 (and e!718535 mapRes!50380))))

(declare-fun condMapEmpty!50380 () Bool)

(declare-fun mapDefault!50380 () ValueCell!15425)

(assert (=> b!1262298 (= condMapEmpty!50380 (= (arr!39698 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15425)) mapDefault!50380)))))

(declare-fun b!1262299 () Bool)

(declare-fun res!840982 () Bool)

(assert (=> b!1262299 (=> (not res!840982) (not e!718538))))

(declare-datatypes ((List!28313 0))(
  ( (Nil!28310) (Cons!28309 (h!29518 (_ BitVec 64)) (t!41811 List!28313)) )
))
(declare-fun arrayNoDuplicates!0 (array!82295 (_ BitVec 32) List!28313) Bool)

(assert (=> b!1262299 (= res!840982 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28310))))

(declare-fun b!1262294 () Bool)

(declare-fun +!4281 (ListLongMap!18983 tuple2!21110) ListLongMap!18983)

(assert (=> b!1262294 (= e!718537 (= (getCurrentListMap!4563 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4281 lt!572041 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun res!840985 () Bool)

(assert (=> start!106000 (=> (not res!840985) (not e!718538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106000 (= res!840985 (validMask!0 mask!1466))))

(assert (=> start!106000 e!718538))

(assert (=> start!106000 true))

(assert (=> start!106000 tp!95969))

(assert (=> start!106000 tp_is_empty!32377))

(declare-fun array_inv!30369 (array!82295) Bool)

(assert (=> start!106000 (array_inv!30369 _keys!1118)))

(declare-fun array_inv!30370 (array!82297) Bool)

(assert (=> start!106000 (and (array_inv!30370 _values!914) e!718533)))

(assert (= (and start!106000 res!840985) b!1262292))

(assert (= (and b!1262292 res!840979) b!1262297))

(assert (= (and b!1262297 res!840983) b!1262299))

(assert (= (and b!1262299 res!840982) b!1262290))

(assert (= (and b!1262290 res!840981) b!1262291))

(assert (= (and b!1262291 (not res!840980)) b!1262294))

(assert (= (and b!1262290 (not res!840984)) b!1262293))

(assert (= (and b!1262298 condMapEmpty!50380) mapIsEmpty!50380))

(assert (= (and b!1262298 (not condMapEmpty!50380)) mapNonEmpty!50380))

(get-info :version)

(assert (= (and mapNonEmpty!50380 ((_ is ValueCellFull!15425) mapValue!50380)) b!1262295))

(assert (= (and b!1262298 ((_ is ValueCellFull!15425) mapDefault!50380)) b!1262296))

(assert (= start!106000 b!1262298))

(declare-fun m!1162373 () Bool)

(assert (=> start!106000 m!1162373))

(declare-fun m!1162375 () Bool)

(assert (=> start!106000 m!1162375))

(declare-fun m!1162377 () Bool)

(assert (=> start!106000 m!1162377))

(declare-fun m!1162379 () Bool)

(assert (=> b!1262297 m!1162379))

(declare-fun m!1162381 () Bool)

(assert (=> mapNonEmpty!50380 m!1162381))

(declare-fun m!1162383 () Bool)

(assert (=> b!1262294 m!1162383))

(declare-fun m!1162385 () Bool)

(assert (=> b!1262294 m!1162385))

(declare-fun m!1162387 () Bool)

(assert (=> b!1262299 m!1162387))

(declare-fun m!1162389 () Bool)

(assert (=> b!1262293 m!1162389))

(declare-fun m!1162391 () Bool)

(assert (=> b!1262290 m!1162391))

(declare-fun m!1162393 () Bool)

(assert (=> b!1262290 m!1162393))

(declare-fun m!1162395 () Bool)

(assert (=> b!1262290 m!1162395))

(check-sat (not b!1262294) tp_is_empty!32377 (not b!1262293) (not b!1262290) (not start!106000) (not mapNonEmpty!50380) (not b!1262297) (not b!1262299) (not b_next!27475) b_and!45407)
(check-sat b_and!45407 (not b_next!27475))
(get-model)

(declare-fun d!138405 () Bool)

(assert (=> d!138405 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106000 d!138405))

(declare-fun d!138407 () Bool)

(assert (=> d!138407 (= (array_inv!30369 _keys!1118) (bvsge (size!40235 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106000 d!138407))

(declare-fun d!138409 () Bool)

(assert (=> d!138409 (= (array_inv!30370 _values!914) (bvsge (size!40236 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106000 d!138409))

(declare-fun d!138411 () Bool)

(declare-fun res!841036 () Bool)

(declare-fun e!718596 () Bool)

(assert (=> d!138411 (=> res!841036 e!718596)))

(assert (=> d!138411 (= res!841036 (bvsge #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(assert (=> d!138411 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28310) e!718596)))

(declare-fun b!1262370 () Bool)

(declare-fun e!718595 () Bool)

(assert (=> b!1262370 (= e!718596 e!718595)))

(declare-fun res!841034 () Bool)

(assert (=> b!1262370 (=> (not res!841034) (not e!718595))))

(declare-fun e!718597 () Bool)

(assert (=> b!1262370 (= res!841034 (not e!718597))))

(declare-fun res!841035 () Bool)

(assert (=> b!1262370 (=> (not res!841035) (not e!718597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1262370 (= res!841035 (validKeyInArray!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262371 () Bool)

(declare-fun e!718598 () Bool)

(assert (=> b!1262371 (= e!718595 e!718598)))

(declare-fun c!122793 () Bool)

(assert (=> b!1262371 (= c!122793 (validKeyInArray!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62054 () Bool)

(declare-fun call!62057 () Bool)

(assert (=> bm!62054 (= call!62057 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122793 (Cons!28309 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000) Nil!28310) Nil!28310)))))

(declare-fun b!1262372 () Bool)

(declare-fun contains!7562 (List!28313 (_ BitVec 64)) Bool)

(assert (=> b!1262372 (= e!718597 (contains!7562 Nil!28310 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262373 () Bool)

(assert (=> b!1262373 (= e!718598 call!62057)))

(declare-fun b!1262374 () Bool)

(assert (=> b!1262374 (= e!718598 call!62057)))

(assert (= (and d!138411 (not res!841036)) b!1262370))

(assert (= (and b!1262370 res!841035) b!1262372))

(assert (= (and b!1262370 res!841034) b!1262371))

(assert (= (and b!1262371 c!122793) b!1262374))

(assert (= (and b!1262371 (not c!122793)) b!1262373))

(assert (= (or b!1262374 b!1262373) bm!62054))

(declare-fun m!1162445 () Bool)

(assert (=> b!1262370 m!1162445))

(assert (=> b!1262370 m!1162445))

(declare-fun m!1162447 () Bool)

(assert (=> b!1262370 m!1162447))

(assert (=> b!1262371 m!1162445))

(assert (=> b!1262371 m!1162445))

(assert (=> b!1262371 m!1162447))

(assert (=> bm!62054 m!1162445))

(declare-fun m!1162449 () Bool)

(assert (=> bm!62054 m!1162449))

(assert (=> b!1262372 m!1162445))

(assert (=> b!1262372 m!1162445))

(declare-fun m!1162451 () Bool)

(assert (=> b!1262372 m!1162451))

(assert (=> b!1262299 d!138411))

(declare-fun d!138413 () Bool)

(assert (=> d!138413 (= (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572062 () Unit!41925)

(declare-fun choose!1881 (array!82295 array!82297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48535 V!48535 V!48535 V!48535 (_ BitVec 32) Int) Unit!41925)

(assert (=> d!138413 (= lt!572062 (choose!1881 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138413 (validMask!0 mask!1466)))

(assert (=> d!138413 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1175 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572062)))

(declare-fun bs!35698 () Bool)

(assert (= bs!35698 d!138413))

(assert (=> bs!35698 m!1162395))

(assert (=> bs!35698 m!1162393))

(declare-fun m!1162453 () Bool)

(assert (=> bs!35698 m!1162453))

(assert (=> bs!35698 m!1162373))

(assert (=> b!1262290 d!138413))

(declare-fun b!1262399 () Bool)

(declare-fun e!718614 () Bool)

(assert (=> b!1262399 (= e!718614 (validKeyInArray!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262399 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262400 () Bool)

(declare-fun e!718615 () Bool)

(declare-fun e!718618 () Bool)

(assert (=> b!1262400 (= e!718615 e!718618)))

(declare-fun c!122805 () Bool)

(assert (=> b!1262400 (= c!122805 e!718614)))

(declare-fun res!841047 () Bool)

(assert (=> b!1262400 (=> (not res!841047) (not e!718614))))

(assert (=> b!1262400 (= res!841047 (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun b!1262401 () Bool)

(declare-fun e!718613 () ListLongMap!18983)

(declare-fun e!718617 () ListLongMap!18983)

(assert (=> b!1262401 (= e!718613 e!718617)))

(declare-fun c!122802 () Bool)

(assert (=> b!1262401 (= c!122802 (validKeyInArray!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138415 () Bool)

(assert (=> d!138415 e!718615))

(declare-fun res!841048 () Bool)

(assert (=> d!138415 (=> (not res!841048) (not e!718615))))

(declare-fun lt!572082 () ListLongMap!18983)

(declare-fun contains!7563 (ListLongMap!18983 (_ BitVec 64)) Bool)

(assert (=> d!138415 (= res!841048 (not (contains!7563 lt!572082 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138415 (= lt!572082 e!718613)))

(declare-fun c!122804 () Bool)

(assert (=> d!138415 (= c!122804 (bvsge #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(assert (=> d!138415 (validMask!0 mask!1466)))

(assert (=> d!138415 (= (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572082)))

(declare-fun b!1262402 () Bool)

(assert (=> b!1262402 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(assert (=> b!1262402 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40236 _values!914)))))

(declare-fun e!718619 () Bool)

(declare-fun apply!991 (ListLongMap!18983 (_ BitVec 64)) V!48535)

(declare-fun get!20276 (ValueCell!15425 V!48535) V!48535)

(declare-fun dynLambda!3421 (Int (_ BitVec 64)) V!48535)

(assert (=> b!1262402 (= e!718619 (= (apply!991 lt!572082 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)) (get!20276 (select (arr!39698 _values!914) #b00000000000000000000000000000000) (dynLambda!3421 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262403 () Bool)

(declare-fun res!841046 () Bool)

(assert (=> b!1262403 (=> (not res!841046) (not e!718615))))

(assert (=> b!1262403 (= res!841046 (not (contains!7563 lt!572082 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1262404 () Bool)

(assert (=> b!1262404 (= e!718613 (ListLongMap!18984 Nil!28309))))

(declare-fun b!1262405 () Bool)

(declare-fun e!718616 () Bool)

(declare-fun isEmpty!1046 (ListLongMap!18983) Bool)

(assert (=> b!1262405 (= e!718616 (isEmpty!1046 lt!572082))))

(declare-fun b!1262406 () Bool)

(assert (=> b!1262406 (= e!718618 e!718616)))

(declare-fun c!122803 () Bool)

(assert (=> b!1262406 (= c!122803 (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun b!1262407 () Bool)

(declare-fun call!62060 () ListLongMap!18983)

(assert (=> b!1262407 (= e!718617 call!62060)))

(declare-fun b!1262408 () Bool)

(declare-fun lt!572079 () Unit!41925)

(declare-fun lt!572080 () Unit!41925)

(assert (=> b!1262408 (= lt!572079 lt!572080)))

(declare-fun lt!572077 () (_ BitVec 64))

(declare-fun lt!572078 () V!48535)

(declare-fun lt!572081 () (_ BitVec 64))

(declare-fun lt!572083 () ListLongMap!18983)

(assert (=> b!1262408 (not (contains!7563 (+!4281 lt!572083 (tuple2!21111 lt!572081 lt!572078)) lt!572077))))

(declare-fun addStillNotContains!327 (ListLongMap!18983 (_ BitVec 64) V!48535 (_ BitVec 64)) Unit!41925)

(assert (=> b!1262408 (= lt!572080 (addStillNotContains!327 lt!572083 lt!572081 lt!572078 lt!572077))))

(assert (=> b!1262408 (= lt!572077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262408 (= lt!572078 (get!20276 (select (arr!39698 _values!914) #b00000000000000000000000000000000) (dynLambda!3421 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262408 (= lt!572081 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262408 (= lt!572083 call!62060)))

(assert (=> b!1262408 (= e!718617 (+!4281 call!62060 (tuple2!21111 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000) (get!20276 (select (arr!39698 _values!914) #b00000000000000000000000000000000) (dynLambda!3421 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262409 () Bool)

(assert (=> b!1262409 (= e!718616 (= lt!572082 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262410 () Bool)

(assert (=> b!1262410 (= e!718618 e!718619)))

(assert (=> b!1262410 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun res!841045 () Bool)

(assert (=> b!1262410 (= res!841045 (contains!7563 lt!572082 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262410 (=> (not res!841045) (not e!718619))))

(declare-fun bm!62057 () Bool)

(assert (=> bm!62057 (= call!62060 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!138415 c!122804) b!1262404))

(assert (= (and d!138415 (not c!122804)) b!1262401))

(assert (= (and b!1262401 c!122802) b!1262408))

(assert (= (and b!1262401 (not c!122802)) b!1262407))

(assert (= (or b!1262408 b!1262407) bm!62057))

(assert (= (and d!138415 res!841048) b!1262403))

(assert (= (and b!1262403 res!841046) b!1262400))

(assert (= (and b!1262400 res!841047) b!1262399))

(assert (= (and b!1262400 c!122805) b!1262410))

(assert (= (and b!1262400 (not c!122805)) b!1262406))

(assert (= (and b!1262410 res!841045) b!1262402))

(assert (= (and b!1262406 c!122803) b!1262409))

(assert (= (and b!1262406 (not c!122803)) b!1262405))

(declare-fun b_lambda!22865 () Bool)

(assert (=> (not b_lambda!22865) (not b!1262402)))

(declare-fun t!41816 () Bool)

(declare-fun tb!11315 () Bool)

(assert (=> (and start!106000 (= defaultEntry!922 defaultEntry!922) t!41816) tb!11315))

(declare-fun result!23369 () Bool)

(assert (=> tb!11315 (= result!23369 tp_is_empty!32377)))

(assert (=> b!1262402 t!41816))

(declare-fun b_and!45413 () Bool)

(assert (= b_and!45407 (and (=> t!41816 result!23369) b_and!45413)))

(declare-fun b_lambda!22867 () Bool)

(assert (=> (not b_lambda!22867) (not b!1262408)))

(assert (=> b!1262408 t!41816))

(declare-fun b_and!45415 () Bool)

(assert (= b_and!45413 (and (=> t!41816 result!23369) b_and!45415)))

(declare-fun m!1162455 () Bool)

(assert (=> b!1262408 m!1162455))

(declare-fun m!1162457 () Bool)

(assert (=> b!1262408 m!1162457))

(declare-fun m!1162459 () Bool)

(assert (=> b!1262408 m!1162459))

(assert (=> b!1262408 m!1162457))

(declare-fun m!1162461 () Bool)

(assert (=> b!1262408 m!1162461))

(assert (=> b!1262408 m!1162455))

(assert (=> b!1262408 m!1162461))

(declare-fun m!1162463 () Bool)

(assert (=> b!1262408 m!1162463))

(declare-fun m!1162465 () Bool)

(assert (=> b!1262408 m!1162465))

(declare-fun m!1162467 () Bool)

(assert (=> b!1262408 m!1162467))

(assert (=> b!1262408 m!1162445))

(declare-fun m!1162469 () Bool)

(assert (=> b!1262405 m!1162469))

(assert (=> b!1262410 m!1162445))

(assert (=> b!1262410 m!1162445))

(declare-fun m!1162471 () Bool)

(assert (=> b!1262410 m!1162471))

(assert (=> b!1262402 m!1162455))

(assert (=> b!1262402 m!1162457))

(assert (=> b!1262402 m!1162459))

(assert (=> b!1262402 m!1162457))

(assert (=> b!1262402 m!1162455))

(assert (=> b!1262402 m!1162445))

(declare-fun m!1162473 () Bool)

(assert (=> b!1262402 m!1162473))

(assert (=> b!1262402 m!1162445))

(declare-fun m!1162475 () Bool)

(assert (=> d!138415 m!1162475))

(assert (=> d!138415 m!1162373))

(assert (=> b!1262399 m!1162445))

(assert (=> b!1262399 m!1162445))

(assert (=> b!1262399 m!1162447))

(assert (=> b!1262401 m!1162445))

(assert (=> b!1262401 m!1162445))

(assert (=> b!1262401 m!1162447))

(declare-fun m!1162477 () Bool)

(assert (=> bm!62057 m!1162477))

(assert (=> b!1262409 m!1162477))

(declare-fun m!1162479 () Bool)

(assert (=> b!1262403 m!1162479))

(assert (=> b!1262290 d!138415))

(declare-fun b!1262413 () Bool)

(declare-fun e!718621 () Bool)

(assert (=> b!1262413 (= e!718621 (validKeyInArray!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262413 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262414 () Bool)

(declare-fun e!718622 () Bool)

(declare-fun e!718625 () Bool)

(assert (=> b!1262414 (= e!718622 e!718625)))

(declare-fun c!122809 () Bool)

(assert (=> b!1262414 (= c!122809 e!718621)))

(declare-fun res!841051 () Bool)

(assert (=> b!1262414 (=> (not res!841051) (not e!718621))))

(assert (=> b!1262414 (= res!841051 (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun b!1262415 () Bool)

(declare-fun e!718620 () ListLongMap!18983)

(declare-fun e!718624 () ListLongMap!18983)

(assert (=> b!1262415 (= e!718620 e!718624)))

(declare-fun c!122806 () Bool)

(assert (=> b!1262415 (= c!122806 (validKeyInArray!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138417 () Bool)

(assert (=> d!138417 e!718622))

(declare-fun res!841052 () Bool)

(assert (=> d!138417 (=> (not res!841052) (not e!718622))))

(declare-fun lt!572089 () ListLongMap!18983)

(assert (=> d!138417 (= res!841052 (not (contains!7563 lt!572089 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138417 (= lt!572089 e!718620)))

(declare-fun c!122808 () Bool)

(assert (=> d!138417 (= c!122808 (bvsge #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(assert (=> d!138417 (validMask!0 mask!1466)))

(assert (=> d!138417 (= (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572089)))

(declare-fun b!1262416 () Bool)

(assert (=> b!1262416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(assert (=> b!1262416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40236 _values!914)))))

(declare-fun e!718626 () Bool)

(assert (=> b!1262416 (= e!718626 (= (apply!991 lt!572089 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)) (get!20276 (select (arr!39698 _values!914) #b00000000000000000000000000000000) (dynLambda!3421 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262417 () Bool)

(declare-fun res!841050 () Bool)

(assert (=> b!1262417 (=> (not res!841050) (not e!718622))))

(assert (=> b!1262417 (= res!841050 (not (contains!7563 lt!572089 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1262418 () Bool)

(assert (=> b!1262418 (= e!718620 (ListLongMap!18984 Nil!28309))))

(declare-fun b!1262419 () Bool)

(declare-fun e!718623 () Bool)

(assert (=> b!1262419 (= e!718623 (isEmpty!1046 lt!572089))))

(declare-fun b!1262420 () Bool)

(assert (=> b!1262420 (= e!718625 e!718623)))

(declare-fun c!122807 () Bool)

(assert (=> b!1262420 (= c!122807 (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun b!1262421 () Bool)

(declare-fun call!62061 () ListLongMap!18983)

(assert (=> b!1262421 (= e!718624 call!62061)))

(declare-fun b!1262422 () Bool)

(declare-fun lt!572086 () Unit!41925)

(declare-fun lt!572087 () Unit!41925)

(assert (=> b!1262422 (= lt!572086 lt!572087)))

(declare-fun lt!572090 () ListLongMap!18983)

(declare-fun lt!572084 () (_ BitVec 64))

(declare-fun lt!572085 () V!48535)

(declare-fun lt!572088 () (_ BitVec 64))

(assert (=> b!1262422 (not (contains!7563 (+!4281 lt!572090 (tuple2!21111 lt!572088 lt!572085)) lt!572084))))

(assert (=> b!1262422 (= lt!572087 (addStillNotContains!327 lt!572090 lt!572088 lt!572085 lt!572084))))

(assert (=> b!1262422 (= lt!572084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262422 (= lt!572085 (get!20276 (select (arr!39698 _values!914) #b00000000000000000000000000000000) (dynLambda!3421 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262422 (= lt!572088 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262422 (= lt!572090 call!62061)))

(assert (=> b!1262422 (= e!718624 (+!4281 call!62061 (tuple2!21111 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000) (get!20276 (select (arr!39698 _values!914) #b00000000000000000000000000000000) (dynLambda!3421 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262423 () Bool)

(assert (=> b!1262423 (= e!718623 (= lt!572089 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262424 () Bool)

(assert (=> b!1262424 (= e!718625 e!718626)))

(assert (=> b!1262424 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun res!841049 () Bool)

(assert (=> b!1262424 (= res!841049 (contains!7563 lt!572089 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262424 (=> (not res!841049) (not e!718626))))

(declare-fun bm!62058 () Bool)

(assert (=> bm!62058 (= call!62061 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!138417 c!122808) b!1262418))

(assert (= (and d!138417 (not c!122808)) b!1262415))

(assert (= (and b!1262415 c!122806) b!1262422))

(assert (= (and b!1262415 (not c!122806)) b!1262421))

(assert (= (or b!1262422 b!1262421) bm!62058))

(assert (= (and d!138417 res!841052) b!1262417))

(assert (= (and b!1262417 res!841050) b!1262414))

(assert (= (and b!1262414 res!841051) b!1262413))

(assert (= (and b!1262414 c!122809) b!1262424))

(assert (= (and b!1262414 (not c!122809)) b!1262420))

(assert (= (and b!1262424 res!841049) b!1262416))

(assert (= (and b!1262420 c!122807) b!1262423))

(assert (= (and b!1262420 (not c!122807)) b!1262419))

(declare-fun b_lambda!22869 () Bool)

(assert (=> (not b_lambda!22869) (not b!1262416)))

(assert (=> b!1262416 t!41816))

(declare-fun b_and!45417 () Bool)

(assert (= b_and!45415 (and (=> t!41816 result!23369) b_and!45417)))

(declare-fun b_lambda!22871 () Bool)

(assert (=> (not b_lambda!22871) (not b!1262422)))

(assert (=> b!1262422 t!41816))

(declare-fun b_and!45419 () Bool)

(assert (= b_and!45417 (and (=> t!41816 result!23369) b_and!45419)))

(assert (=> b!1262422 m!1162455))

(assert (=> b!1262422 m!1162457))

(assert (=> b!1262422 m!1162459))

(assert (=> b!1262422 m!1162457))

(declare-fun m!1162481 () Bool)

(assert (=> b!1262422 m!1162481))

(assert (=> b!1262422 m!1162455))

(assert (=> b!1262422 m!1162481))

(declare-fun m!1162483 () Bool)

(assert (=> b!1262422 m!1162483))

(declare-fun m!1162485 () Bool)

(assert (=> b!1262422 m!1162485))

(declare-fun m!1162487 () Bool)

(assert (=> b!1262422 m!1162487))

(assert (=> b!1262422 m!1162445))

(declare-fun m!1162489 () Bool)

(assert (=> b!1262419 m!1162489))

(assert (=> b!1262424 m!1162445))

(assert (=> b!1262424 m!1162445))

(declare-fun m!1162491 () Bool)

(assert (=> b!1262424 m!1162491))

(assert (=> b!1262416 m!1162455))

(assert (=> b!1262416 m!1162457))

(assert (=> b!1262416 m!1162459))

(assert (=> b!1262416 m!1162457))

(assert (=> b!1262416 m!1162455))

(assert (=> b!1262416 m!1162445))

(declare-fun m!1162493 () Bool)

(assert (=> b!1262416 m!1162493))

(assert (=> b!1262416 m!1162445))

(declare-fun m!1162495 () Bool)

(assert (=> d!138417 m!1162495))

(assert (=> d!138417 m!1162373))

(assert (=> b!1262413 m!1162445))

(assert (=> b!1262413 m!1162445))

(assert (=> b!1262413 m!1162447))

(assert (=> b!1262415 m!1162445))

(assert (=> b!1262415 m!1162445))

(assert (=> b!1262415 m!1162447))

(declare-fun m!1162497 () Bool)

(assert (=> bm!62058 m!1162497))

(assert (=> b!1262423 m!1162497))

(declare-fun m!1162499 () Bool)

(assert (=> b!1262417 m!1162499))

(assert (=> b!1262290 d!138417))

(declare-fun b!1262467 () Bool)

(declare-fun e!718658 () Bool)

(declare-fun e!718664 () Bool)

(assert (=> b!1262467 (= e!718658 e!718664)))

(declare-fun res!841071 () Bool)

(declare-fun call!62079 () Bool)

(assert (=> b!1262467 (= res!841071 call!62079)))

(assert (=> b!1262467 (=> (not res!841071) (not e!718664))))

(declare-fun b!1262468 () Bool)

(declare-fun e!718657 () Bool)

(assert (=> b!1262468 (= e!718657 (validKeyInArray!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262469 () Bool)

(declare-fun e!718653 () Bool)

(declare-fun lt!572143 () ListLongMap!18983)

(assert (=> b!1262469 (= e!718653 (= (apply!991 lt!572143 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!62073 () Bool)

(declare-fun call!62076 () ListLongMap!18983)

(declare-fun call!62078 () ListLongMap!18983)

(assert (=> bm!62073 (= call!62076 call!62078)))

(declare-fun bm!62074 () Bool)

(assert (=> bm!62074 (= call!62079 (contains!7563 lt!572143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!122822 () Bool)

(declare-fun bm!62075 () Bool)

(declare-fun call!62077 () ListLongMap!18983)

(declare-fun call!62081 () ListLongMap!18983)

(declare-fun c!122827 () Bool)

(assert (=> bm!62075 (= call!62077 (+!4281 (ite c!122822 call!62078 (ite c!122827 call!62076 call!62081)) (ite (or c!122822 c!122827) (tuple2!21111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1262470 () Bool)

(declare-fun e!718654 () ListLongMap!18983)

(declare-fun call!62082 () ListLongMap!18983)

(assert (=> b!1262470 (= e!718654 call!62082)))

(declare-fun b!1262471 () Bool)

(declare-fun e!718656 () Bool)

(assert (=> b!1262471 (= e!718656 e!718653)))

(declare-fun res!841079 () Bool)

(declare-fun call!62080 () Bool)

(assert (=> b!1262471 (= res!841079 call!62080)))

(assert (=> b!1262471 (=> (not res!841079) (not e!718653))))

(declare-fun d!138419 () Bool)

(declare-fun e!718662 () Bool)

(assert (=> d!138419 e!718662))

(declare-fun res!841078 () Bool)

(assert (=> d!138419 (=> (not res!841078) (not e!718662))))

(assert (=> d!138419 (= res!841078 (or (bvsge #b00000000000000000000000000000000 (size!40235 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))))

(declare-fun lt!572142 () ListLongMap!18983)

(assert (=> d!138419 (= lt!572143 lt!572142)))

(declare-fun lt!572151 () Unit!41925)

(declare-fun e!718660 () Unit!41925)

(assert (=> d!138419 (= lt!572151 e!718660)))

(declare-fun c!122824 () Bool)

(assert (=> d!138419 (= c!122824 e!718657)))

(declare-fun res!841072 () Bool)

(assert (=> d!138419 (=> (not res!841072) (not e!718657))))

(assert (=> d!138419 (= res!841072 (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun e!718655 () ListLongMap!18983)

(assert (=> d!138419 (= lt!572142 e!718655)))

(assert (=> d!138419 (= c!122822 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138419 (validMask!0 mask!1466)))

(assert (=> d!138419 (= (getCurrentListMap!4563 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572143)))

(declare-fun b!1262472 () Bool)

(declare-fun e!718659 () ListLongMap!18983)

(assert (=> b!1262472 (= e!718659 call!62081)))

(declare-fun b!1262473 () Bool)

(assert (=> b!1262473 (= e!718662 e!718656)))

(declare-fun c!122826 () Bool)

(assert (=> b!1262473 (= c!122826 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62076 () Bool)

(assert (=> bm!62076 (= call!62080 (contains!7563 lt!572143 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262474 () Bool)

(assert (=> b!1262474 (= e!718664 (= (apply!991 lt!572143 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1262475 () Bool)

(assert (=> b!1262475 (= e!718656 (not call!62080))))

(declare-fun b!1262476 () Bool)

(assert (=> b!1262476 (= e!718655 (+!4281 call!62077 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!62077 () Bool)

(assert (=> bm!62077 (= call!62078 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262477 () Bool)

(declare-fun e!718661 () Bool)

(declare-fun e!718663 () Bool)

(assert (=> b!1262477 (= e!718661 e!718663)))

(declare-fun res!841076 () Bool)

(assert (=> b!1262477 (=> (not res!841076) (not e!718663))))

(assert (=> b!1262477 (= res!841076 (contains!7563 lt!572143 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun bm!62078 () Bool)

(assert (=> bm!62078 (= call!62081 call!62076)))

(declare-fun b!1262478 () Bool)

(assert (=> b!1262478 (= e!718655 e!718654)))

(assert (=> b!1262478 (= c!122827 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262479 () Bool)

(declare-fun e!718665 () Bool)

(assert (=> b!1262479 (= e!718665 (validKeyInArray!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62079 () Bool)

(assert (=> bm!62079 (= call!62082 call!62077)))

(declare-fun b!1262480 () Bool)

(assert (=> b!1262480 (= e!718658 (not call!62079))))

(declare-fun b!1262481 () Bool)

(declare-fun res!841073 () Bool)

(assert (=> b!1262481 (=> (not res!841073) (not e!718662))))

(assert (=> b!1262481 (= res!841073 e!718661)))

(declare-fun res!841075 () Bool)

(assert (=> b!1262481 (=> res!841075 e!718661)))

(assert (=> b!1262481 (= res!841075 (not e!718665))))

(declare-fun res!841074 () Bool)

(assert (=> b!1262481 (=> (not res!841074) (not e!718665))))

(assert (=> b!1262481 (= res!841074 (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun b!1262482 () Bool)

(assert (=> b!1262482 (= e!718663 (= (apply!991 lt!572143 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)) (get!20276 (select (arr!39698 _values!914) #b00000000000000000000000000000000) (dynLambda!3421 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262482 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40236 _values!914)))))

(assert (=> b!1262482 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun b!1262483 () Bool)

(declare-fun lt!572139 () Unit!41925)

(assert (=> b!1262483 (= e!718660 lt!572139)))

(declare-fun lt!572147 () ListLongMap!18983)

(assert (=> b!1262483 (= lt!572147 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572138 () (_ BitVec 64))

(assert (=> b!1262483 (= lt!572138 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572144 () (_ BitVec 64))

(assert (=> b!1262483 (= lt!572144 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572155 () Unit!41925)

(declare-fun addStillContains!1088 (ListLongMap!18983 (_ BitVec 64) V!48535 (_ BitVec 64)) Unit!41925)

(assert (=> b!1262483 (= lt!572155 (addStillContains!1088 lt!572147 lt!572138 zeroValue!871 lt!572144))))

(assert (=> b!1262483 (contains!7563 (+!4281 lt!572147 (tuple2!21111 lt!572138 zeroValue!871)) lt!572144)))

(declare-fun lt!572140 () Unit!41925)

(assert (=> b!1262483 (= lt!572140 lt!572155)))

(declare-fun lt!572136 () ListLongMap!18983)

(assert (=> b!1262483 (= lt!572136 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572141 () (_ BitVec 64))

(assert (=> b!1262483 (= lt!572141 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572149 () (_ BitVec 64))

(assert (=> b!1262483 (= lt!572149 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572154 () Unit!41925)

(declare-fun addApplyDifferent!531 (ListLongMap!18983 (_ BitVec 64) V!48535 (_ BitVec 64)) Unit!41925)

(assert (=> b!1262483 (= lt!572154 (addApplyDifferent!531 lt!572136 lt!572141 minValueBefore!43 lt!572149))))

(assert (=> b!1262483 (= (apply!991 (+!4281 lt!572136 (tuple2!21111 lt!572141 minValueBefore!43)) lt!572149) (apply!991 lt!572136 lt!572149))))

(declare-fun lt!572152 () Unit!41925)

(assert (=> b!1262483 (= lt!572152 lt!572154)))

(declare-fun lt!572146 () ListLongMap!18983)

(assert (=> b!1262483 (= lt!572146 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572135 () (_ BitVec 64))

(assert (=> b!1262483 (= lt!572135 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572137 () (_ BitVec 64))

(assert (=> b!1262483 (= lt!572137 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572153 () Unit!41925)

(assert (=> b!1262483 (= lt!572153 (addApplyDifferent!531 lt!572146 lt!572135 zeroValue!871 lt!572137))))

(assert (=> b!1262483 (= (apply!991 (+!4281 lt!572146 (tuple2!21111 lt!572135 zeroValue!871)) lt!572137) (apply!991 lt!572146 lt!572137))))

(declare-fun lt!572150 () Unit!41925)

(assert (=> b!1262483 (= lt!572150 lt!572153)))

(declare-fun lt!572148 () ListLongMap!18983)

(assert (=> b!1262483 (= lt!572148 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572145 () (_ BitVec 64))

(assert (=> b!1262483 (= lt!572145 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572156 () (_ BitVec 64))

(assert (=> b!1262483 (= lt!572156 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262483 (= lt!572139 (addApplyDifferent!531 lt!572148 lt!572145 minValueBefore!43 lt!572156))))

(assert (=> b!1262483 (= (apply!991 (+!4281 lt!572148 (tuple2!21111 lt!572145 minValueBefore!43)) lt!572156) (apply!991 lt!572148 lt!572156))))

(declare-fun b!1262484 () Bool)

(declare-fun res!841077 () Bool)

(assert (=> b!1262484 (=> (not res!841077) (not e!718662))))

(assert (=> b!1262484 (= res!841077 e!718658)))

(declare-fun c!122823 () Bool)

(assert (=> b!1262484 (= c!122823 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1262485 () Bool)

(declare-fun Unit!41929 () Unit!41925)

(assert (=> b!1262485 (= e!718660 Unit!41929)))

(declare-fun b!1262486 () Bool)

(assert (=> b!1262486 (= e!718659 call!62082)))

(declare-fun b!1262487 () Bool)

(declare-fun c!122825 () Bool)

(assert (=> b!1262487 (= c!122825 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1262487 (= e!718654 e!718659)))

(assert (= (and d!138419 c!122822) b!1262476))

(assert (= (and d!138419 (not c!122822)) b!1262478))

(assert (= (and b!1262478 c!122827) b!1262470))

(assert (= (and b!1262478 (not c!122827)) b!1262487))

(assert (= (and b!1262487 c!122825) b!1262486))

(assert (= (and b!1262487 (not c!122825)) b!1262472))

(assert (= (or b!1262486 b!1262472) bm!62078))

(assert (= (or b!1262470 bm!62078) bm!62073))

(assert (= (or b!1262470 b!1262486) bm!62079))

(assert (= (or b!1262476 bm!62073) bm!62077))

(assert (= (or b!1262476 bm!62079) bm!62075))

(assert (= (and d!138419 res!841072) b!1262468))

(assert (= (and d!138419 c!122824) b!1262483))

(assert (= (and d!138419 (not c!122824)) b!1262485))

(assert (= (and d!138419 res!841078) b!1262481))

(assert (= (and b!1262481 res!841074) b!1262479))

(assert (= (and b!1262481 (not res!841075)) b!1262477))

(assert (= (and b!1262477 res!841076) b!1262482))

(assert (= (and b!1262481 res!841073) b!1262484))

(assert (= (and b!1262484 c!122823) b!1262467))

(assert (= (and b!1262484 (not c!122823)) b!1262480))

(assert (= (and b!1262467 res!841071) b!1262474))

(assert (= (or b!1262467 b!1262480) bm!62074))

(assert (= (and b!1262484 res!841077) b!1262473))

(assert (= (and b!1262473 c!122826) b!1262471))

(assert (= (and b!1262473 (not c!122826)) b!1262475))

(assert (= (and b!1262471 res!841079) b!1262469))

(assert (= (or b!1262471 b!1262475) bm!62076))

(declare-fun b_lambda!22873 () Bool)

(assert (=> (not b_lambda!22873) (not b!1262482)))

(assert (=> b!1262482 t!41816))

(declare-fun b_and!45421 () Bool)

(assert (= b_and!45419 (and (=> t!41816 result!23369) b_and!45421)))

(assert (=> b!1262479 m!1162445))

(assert (=> b!1262479 m!1162445))

(assert (=> b!1262479 m!1162447))

(declare-fun m!1162501 () Bool)

(assert (=> bm!62075 m!1162501))

(assert (=> bm!62077 m!1162395))

(declare-fun m!1162503 () Bool)

(assert (=> b!1262474 m!1162503))

(declare-fun m!1162505 () Bool)

(assert (=> bm!62074 m!1162505))

(declare-fun m!1162507 () Bool)

(assert (=> bm!62076 m!1162507))

(assert (=> d!138419 m!1162373))

(declare-fun m!1162509 () Bool)

(assert (=> b!1262483 m!1162509))

(declare-fun m!1162511 () Bool)

(assert (=> b!1262483 m!1162511))

(declare-fun m!1162513 () Bool)

(assert (=> b!1262483 m!1162513))

(declare-fun m!1162515 () Bool)

(assert (=> b!1262483 m!1162515))

(assert (=> b!1262483 m!1162511))

(declare-fun m!1162517 () Bool)

(assert (=> b!1262483 m!1162517))

(declare-fun m!1162519 () Bool)

(assert (=> b!1262483 m!1162519))

(declare-fun m!1162521 () Bool)

(assert (=> b!1262483 m!1162521))

(assert (=> b!1262483 m!1162395))

(declare-fun m!1162523 () Bool)

(assert (=> b!1262483 m!1162523))

(declare-fun m!1162525 () Bool)

(assert (=> b!1262483 m!1162525))

(assert (=> b!1262483 m!1162509))

(declare-fun m!1162527 () Bool)

(assert (=> b!1262483 m!1162527))

(declare-fun m!1162529 () Bool)

(assert (=> b!1262483 m!1162529))

(declare-fun m!1162531 () Bool)

(assert (=> b!1262483 m!1162531))

(assert (=> b!1262483 m!1162525))

(declare-fun m!1162533 () Bool)

(assert (=> b!1262483 m!1162533))

(declare-fun m!1162535 () Bool)

(assert (=> b!1262483 m!1162535))

(assert (=> b!1262483 m!1162513))

(declare-fun m!1162537 () Bool)

(assert (=> b!1262483 m!1162537))

(assert (=> b!1262483 m!1162445))

(declare-fun m!1162539 () Bool)

(assert (=> b!1262476 m!1162539))

(declare-fun m!1162541 () Bool)

(assert (=> b!1262469 m!1162541))

(assert (=> b!1262477 m!1162445))

(assert (=> b!1262477 m!1162445))

(declare-fun m!1162543 () Bool)

(assert (=> b!1262477 m!1162543))

(assert (=> b!1262482 m!1162457))

(assert (=> b!1262482 m!1162455))

(assert (=> b!1262482 m!1162455))

(assert (=> b!1262482 m!1162457))

(assert (=> b!1262482 m!1162459))

(assert (=> b!1262482 m!1162445))

(assert (=> b!1262482 m!1162445))

(declare-fun m!1162545 () Bool)

(assert (=> b!1262482 m!1162545))

(assert (=> b!1262468 m!1162445))

(assert (=> b!1262468 m!1162445))

(assert (=> b!1262468 m!1162447))

(assert (=> b!1262294 d!138419))

(declare-fun d!138421 () Bool)

(declare-fun e!718668 () Bool)

(assert (=> d!138421 e!718668))

(declare-fun res!841084 () Bool)

(assert (=> d!138421 (=> (not res!841084) (not e!718668))))

(declare-fun lt!572168 () ListLongMap!18983)

(assert (=> d!138421 (= res!841084 (contains!7563 lt!572168 (_1!10566 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572165 () List!28312)

(assert (=> d!138421 (= lt!572168 (ListLongMap!18984 lt!572165))))

(declare-fun lt!572166 () Unit!41925)

(declare-fun lt!572167 () Unit!41925)

(assert (=> d!138421 (= lt!572166 lt!572167)))

(declare-datatypes ((Option!716 0))(
  ( (Some!715 (v!18960 V!48535)) (None!714) )
))
(declare-fun getValueByKey!665 (List!28312 (_ BitVec 64)) Option!716)

(assert (=> d!138421 (= (getValueByKey!665 lt!572165 (_1!10566 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!715 (_2!10566 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!335 (List!28312 (_ BitVec 64) V!48535) Unit!41925)

(assert (=> d!138421 (= lt!572167 (lemmaContainsTupThenGetReturnValue!335 lt!572165 (_1!10566 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10566 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!449 (List!28312 (_ BitVec 64) V!48535) List!28312)

(assert (=> d!138421 (= lt!572165 (insertStrictlySorted!449 (toList!9507 lt!572041) (_1!10566 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10566 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138421 (= (+!4281 lt!572041 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!572168)))

(declare-fun b!1262492 () Bool)

(declare-fun res!841085 () Bool)

(assert (=> b!1262492 (=> (not res!841085) (not e!718668))))

(assert (=> b!1262492 (= res!841085 (= (getValueByKey!665 (toList!9507 lt!572168) (_1!10566 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!715 (_2!10566 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1262493 () Bool)

(declare-fun contains!7564 (List!28312 tuple2!21110) Bool)

(assert (=> b!1262493 (= e!718668 (contains!7564 (toList!9507 lt!572168) (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138421 res!841084) b!1262492))

(assert (= (and b!1262492 res!841085) b!1262493))

(declare-fun m!1162547 () Bool)

(assert (=> d!138421 m!1162547))

(declare-fun m!1162549 () Bool)

(assert (=> d!138421 m!1162549))

(declare-fun m!1162551 () Bool)

(assert (=> d!138421 m!1162551))

(declare-fun m!1162553 () Bool)

(assert (=> d!138421 m!1162553))

(declare-fun m!1162555 () Bool)

(assert (=> b!1262492 m!1162555))

(declare-fun m!1162557 () Bool)

(assert (=> b!1262493 m!1162557))

(assert (=> b!1262294 d!138421))

(declare-fun bm!62082 () Bool)

(declare-fun call!62085 () Bool)

(assert (=> bm!62082 (= call!62085 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1262502 () Bool)

(declare-fun e!718677 () Bool)

(assert (=> b!1262502 (= e!718677 call!62085)))

(declare-fun b!1262503 () Bool)

(declare-fun e!718675 () Bool)

(assert (=> b!1262503 (= e!718675 e!718677)))

(declare-fun c!122830 () Bool)

(assert (=> b!1262503 (= c!122830 (validKeyInArray!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262504 () Bool)

(declare-fun e!718676 () Bool)

(assert (=> b!1262504 (= e!718676 call!62085)))

(declare-fun b!1262505 () Bool)

(assert (=> b!1262505 (= e!718677 e!718676)))

(declare-fun lt!572175 () (_ BitVec 64))

(assert (=> b!1262505 (= lt!572175 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572176 () Unit!41925)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82295 (_ BitVec 64) (_ BitVec 32)) Unit!41925)

(assert (=> b!1262505 (= lt!572176 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572175 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1262505 (arrayContainsKey!0 _keys!1118 lt!572175 #b00000000000000000000000000000000)))

(declare-fun lt!572177 () Unit!41925)

(assert (=> b!1262505 (= lt!572177 lt!572176)))

(declare-fun res!841091 () Bool)

(declare-datatypes ((SeekEntryResult!9975 0))(
  ( (MissingZero!9975 (index!42271 (_ BitVec 32))) (Found!9975 (index!42272 (_ BitVec 32))) (Intermediate!9975 (undefined!10787 Bool) (index!42273 (_ BitVec 32)) (x!111245 (_ BitVec 32))) (Undefined!9975) (MissingVacant!9975 (index!42274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82295 (_ BitVec 32)) SeekEntryResult!9975)

(assert (=> b!1262505 (= res!841091 (= (seekEntryOrOpen!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9975 #b00000000000000000000000000000000)))))

(assert (=> b!1262505 (=> (not res!841091) (not e!718676))))

(declare-fun d!138423 () Bool)

(declare-fun res!841090 () Bool)

(assert (=> d!138423 (=> res!841090 e!718675)))

(assert (=> d!138423 (= res!841090 (bvsge #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(assert (=> d!138423 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718675)))

(assert (= (and d!138423 (not res!841090)) b!1262503))

(assert (= (and b!1262503 c!122830) b!1262505))

(assert (= (and b!1262503 (not c!122830)) b!1262502))

(assert (= (and b!1262505 res!841091) b!1262504))

(assert (= (or b!1262504 b!1262502) bm!62082))

(declare-fun m!1162559 () Bool)

(assert (=> bm!62082 m!1162559))

(assert (=> b!1262503 m!1162445))

(assert (=> b!1262503 m!1162445))

(assert (=> b!1262503 m!1162447))

(assert (=> b!1262505 m!1162445))

(declare-fun m!1162561 () Bool)

(assert (=> b!1262505 m!1162561))

(declare-fun m!1162563 () Bool)

(assert (=> b!1262505 m!1162563))

(assert (=> b!1262505 m!1162445))

(declare-fun m!1162565 () Bool)

(assert (=> b!1262505 m!1162565))

(assert (=> b!1262297 d!138423))

(declare-fun b!1262506 () Bool)

(declare-fun e!718683 () Bool)

(declare-fun e!718689 () Bool)

(assert (=> b!1262506 (= e!718683 e!718689)))

(declare-fun res!841092 () Bool)

(declare-fun call!62089 () Bool)

(assert (=> b!1262506 (= res!841092 call!62089)))

(assert (=> b!1262506 (=> (not res!841092) (not e!718689))))

(declare-fun b!1262507 () Bool)

(declare-fun e!718682 () Bool)

(assert (=> b!1262507 (= e!718682 (validKeyInArray!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262508 () Bool)

(declare-fun e!718678 () Bool)

(declare-fun lt!572186 () ListLongMap!18983)

(assert (=> b!1262508 (= e!718678 (= (apply!991 lt!572186 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun bm!62083 () Bool)

(declare-fun call!62086 () ListLongMap!18983)

(declare-fun call!62088 () ListLongMap!18983)

(assert (=> bm!62083 (= call!62086 call!62088)))

(declare-fun bm!62084 () Bool)

(assert (=> bm!62084 (= call!62089 (contains!7563 lt!572186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!122836 () Bool)

(declare-fun call!62087 () ListLongMap!18983)

(declare-fun c!122831 () Bool)

(declare-fun bm!62085 () Bool)

(declare-fun call!62091 () ListLongMap!18983)

(assert (=> bm!62085 (= call!62087 (+!4281 (ite c!122831 call!62088 (ite c!122836 call!62086 call!62091)) (ite (or c!122831 c!122836) (tuple2!21111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1262509 () Bool)

(declare-fun e!718679 () ListLongMap!18983)

(declare-fun call!62092 () ListLongMap!18983)

(assert (=> b!1262509 (= e!718679 call!62092)))

(declare-fun b!1262510 () Bool)

(declare-fun e!718681 () Bool)

(assert (=> b!1262510 (= e!718681 e!718678)))

(declare-fun res!841100 () Bool)

(declare-fun call!62090 () Bool)

(assert (=> b!1262510 (= res!841100 call!62090)))

(assert (=> b!1262510 (=> (not res!841100) (not e!718678))))

(declare-fun d!138425 () Bool)

(declare-fun e!718687 () Bool)

(assert (=> d!138425 e!718687))

(declare-fun res!841099 () Bool)

(assert (=> d!138425 (=> (not res!841099) (not e!718687))))

(assert (=> d!138425 (= res!841099 (or (bvsge #b00000000000000000000000000000000 (size!40235 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))))

(declare-fun lt!572185 () ListLongMap!18983)

(assert (=> d!138425 (= lt!572186 lt!572185)))

(declare-fun lt!572194 () Unit!41925)

(declare-fun e!718685 () Unit!41925)

(assert (=> d!138425 (= lt!572194 e!718685)))

(declare-fun c!122833 () Bool)

(assert (=> d!138425 (= c!122833 e!718682)))

(declare-fun res!841093 () Bool)

(assert (=> d!138425 (=> (not res!841093) (not e!718682))))

(assert (=> d!138425 (= res!841093 (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun e!718680 () ListLongMap!18983)

(assert (=> d!138425 (= lt!572185 e!718680)))

(assert (=> d!138425 (= c!122831 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138425 (validMask!0 mask!1466)))

(assert (=> d!138425 (= (getCurrentListMap!4563 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572186)))

(declare-fun b!1262511 () Bool)

(declare-fun e!718684 () ListLongMap!18983)

(assert (=> b!1262511 (= e!718684 call!62091)))

(declare-fun b!1262512 () Bool)

(assert (=> b!1262512 (= e!718687 e!718681)))

(declare-fun c!122835 () Bool)

(assert (=> b!1262512 (= c!122835 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62086 () Bool)

(assert (=> bm!62086 (= call!62090 (contains!7563 lt!572186 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262513 () Bool)

(assert (=> b!1262513 (= e!718689 (= (apply!991 lt!572186 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1262514 () Bool)

(assert (=> b!1262514 (= e!718681 (not call!62090))))

(declare-fun b!1262515 () Bool)

(assert (=> b!1262515 (= e!718680 (+!4281 call!62087 (tuple2!21111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun bm!62087 () Bool)

(assert (=> bm!62087 (= call!62088 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262516 () Bool)

(declare-fun e!718686 () Bool)

(declare-fun e!718688 () Bool)

(assert (=> b!1262516 (= e!718686 e!718688)))

(declare-fun res!841097 () Bool)

(assert (=> b!1262516 (=> (not res!841097) (not e!718688))))

(assert (=> b!1262516 (= res!841097 (contains!7563 lt!572186 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262516 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun bm!62088 () Bool)

(assert (=> bm!62088 (= call!62091 call!62086)))

(declare-fun b!1262517 () Bool)

(assert (=> b!1262517 (= e!718680 e!718679)))

(assert (=> b!1262517 (= c!122836 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262518 () Bool)

(declare-fun e!718690 () Bool)

(assert (=> b!1262518 (= e!718690 (validKeyInArray!0 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62089 () Bool)

(assert (=> bm!62089 (= call!62092 call!62087)))

(declare-fun b!1262519 () Bool)

(assert (=> b!1262519 (= e!718683 (not call!62089))))

(declare-fun b!1262520 () Bool)

(declare-fun res!841094 () Bool)

(assert (=> b!1262520 (=> (not res!841094) (not e!718687))))

(assert (=> b!1262520 (= res!841094 e!718686)))

(declare-fun res!841096 () Bool)

(assert (=> b!1262520 (=> res!841096 e!718686)))

(assert (=> b!1262520 (= res!841096 (not e!718690))))

(declare-fun res!841095 () Bool)

(assert (=> b!1262520 (=> (not res!841095) (not e!718690))))

(assert (=> b!1262520 (= res!841095 (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun b!1262521 () Bool)

(assert (=> b!1262521 (= e!718688 (= (apply!991 lt!572186 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000)) (get!20276 (select (arr!39698 _values!914) #b00000000000000000000000000000000) (dynLambda!3421 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262521 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40236 _values!914)))))

(assert (=> b!1262521 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40235 _keys!1118)))))

(declare-fun b!1262522 () Bool)

(declare-fun lt!572182 () Unit!41925)

(assert (=> b!1262522 (= e!718685 lt!572182)))

(declare-fun lt!572190 () ListLongMap!18983)

(assert (=> b!1262522 (= lt!572190 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572181 () (_ BitVec 64))

(assert (=> b!1262522 (= lt!572181 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572187 () (_ BitVec 64))

(assert (=> b!1262522 (= lt!572187 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572198 () Unit!41925)

(assert (=> b!1262522 (= lt!572198 (addStillContains!1088 lt!572190 lt!572181 zeroValue!871 lt!572187))))

(assert (=> b!1262522 (contains!7563 (+!4281 lt!572190 (tuple2!21111 lt!572181 zeroValue!871)) lt!572187)))

(declare-fun lt!572183 () Unit!41925)

(assert (=> b!1262522 (= lt!572183 lt!572198)))

(declare-fun lt!572179 () ListLongMap!18983)

(assert (=> b!1262522 (= lt!572179 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572184 () (_ BitVec 64))

(assert (=> b!1262522 (= lt!572184 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572192 () (_ BitVec 64))

(assert (=> b!1262522 (= lt!572192 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572197 () Unit!41925)

(assert (=> b!1262522 (= lt!572197 (addApplyDifferent!531 lt!572179 lt!572184 minValueAfter!43 lt!572192))))

(assert (=> b!1262522 (= (apply!991 (+!4281 lt!572179 (tuple2!21111 lt!572184 minValueAfter!43)) lt!572192) (apply!991 lt!572179 lt!572192))))

(declare-fun lt!572195 () Unit!41925)

(assert (=> b!1262522 (= lt!572195 lt!572197)))

(declare-fun lt!572189 () ListLongMap!18983)

(assert (=> b!1262522 (= lt!572189 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572178 () (_ BitVec 64))

(assert (=> b!1262522 (= lt!572178 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572180 () (_ BitVec 64))

(assert (=> b!1262522 (= lt!572180 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572196 () Unit!41925)

(assert (=> b!1262522 (= lt!572196 (addApplyDifferent!531 lt!572189 lt!572178 zeroValue!871 lt!572180))))

(assert (=> b!1262522 (= (apply!991 (+!4281 lt!572189 (tuple2!21111 lt!572178 zeroValue!871)) lt!572180) (apply!991 lt!572189 lt!572180))))

(declare-fun lt!572193 () Unit!41925)

(assert (=> b!1262522 (= lt!572193 lt!572196)))

(declare-fun lt!572191 () ListLongMap!18983)

(assert (=> b!1262522 (= lt!572191 (getCurrentListMapNoExtraKeys!5875 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572188 () (_ BitVec 64))

(assert (=> b!1262522 (= lt!572188 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572199 () (_ BitVec 64))

(assert (=> b!1262522 (= lt!572199 (select (arr!39697 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262522 (= lt!572182 (addApplyDifferent!531 lt!572191 lt!572188 minValueAfter!43 lt!572199))))

(assert (=> b!1262522 (= (apply!991 (+!4281 lt!572191 (tuple2!21111 lt!572188 minValueAfter!43)) lt!572199) (apply!991 lt!572191 lt!572199))))

(declare-fun b!1262523 () Bool)

(declare-fun res!841098 () Bool)

(assert (=> b!1262523 (=> (not res!841098) (not e!718687))))

(assert (=> b!1262523 (= res!841098 e!718683)))

(declare-fun c!122832 () Bool)

(assert (=> b!1262523 (= c!122832 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1262524 () Bool)

(declare-fun Unit!41930 () Unit!41925)

(assert (=> b!1262524 (= e!718685 Unit!41930)))

(declare-fun b!1262525 () Bool)

(assert (=> b!1262525 (= e!718684 call!62092)))

(declare-fun b!1262526 () Bool)

(declare-fun c!122834 () Bool)

(assert (=> b!1262526 (= c!122834 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1262526 (= e!718679 e!718684)))

(assert (= (and d!138425 c!122831) b!1262515))

(assert (= (and d!138425 (not c!122831)) b!1262517))

(assert (= (and b!1262517 c!122836) b!1262509))

(assert (= (and b!1262517 (not c!122836)) b!1262526))

(assert (= (and b!1262526 c!122834) b!1262525))

(assert (= (and b!1262526 (not c!122834)) b!1262511))

(assert (= (or b!1262525 b!1262511) bm!62088))

(assert (= (or b!1262509 bm!62088) bm!62083))

(assert (= (or b!1262509 b!1262525) bm!62089))

(assert (= (or b!1262515 bm!62083) bm!62087))

(assert (= (or b!1262515 bm!62089) bm!62085))

(assert (= (and d!138425 res!841093) b!1262507))

(assert (= (and d!138425 c!122833) b!1262522))

(assert (= (and d!138425 (not c!122833)) b!1262524))

(assert (= (and d!138425 res!841099) b!1262520))

(assert (= (and b!1262520 res!841095) b!1262518))

(assert (= (and b!1262520 (not res!841096)) b!1262516))

(assert (= (and b!1262516 res!841097) b!1262521))

(assert (= (and b!1262520 res!841094) b!1262523))

(assert (= (and b!1262523 c!122832) b!1262506))

(assert (= (and b!1262523 (not c!122832)) b!1262519))

(assert (= (and b!1262506 res!841092) b!1262513))

(assert (= (or b!1262506 b!1262519) bm!62084))

(assert (= (and b!1262523 res!841098) b!1262512))

(assert (= (and b!1262512 c!122835) b!1262510))

(assert (= (and b!1262512 (not c!122835)) b!1262514))

(assert (= (and b!1262510 res!841100) b!1262508))

(assert (= (or b!1262510 b!1262514) bm!62086))

(declare-fun b_lambda!22875 () Bool)

(assert (=> (not b_lambda!22875) (not b!1262521)))

(assert (=> b!1262521 t!41816))

(declare-fun b_and!45423 () Bool)

(assert (= b_and!45421 (and (=> t!41816 result!23369) b_and!45423)))

(assert (=> b!1262518 m!1162445))

(assert (=> b!1262518 m!1162445))

(assert (=> b!1262518 m!1162447))

(declare-fun m!1162567 () Bool)

(assert (=> bm!62085 m!1162567))

(assert (=> bm!62087 m!1162393))

(declare-fun m!1162569 () Bool)

(assert (=> b!1262513 m!1162569))

(declare-fun m!1162571 () Bool)

(assert (=> bm!62084 m!1162571))

(declare-fun m!1162573 () Bool)

(assert (=> bm!62086 m!1162573))

(assert (=> d!138425 m!1162373))

(declare-fun m!1162575 () Bool)

(assert (=> b!1262522 m!1162575))

(declare-fun m!1162577 () Bool)

(assert (=> b!1262522 m!1162577))

(declare-fun m!1162579 () Bool)

(assert (=> b!1262522 m!1162579))

(declare-fun m!1162581 () Bool)

(assert (=> b!1262522 m!1162581))

(assert (=> b!1262522 m!1162577))

(declare-fun m!1162583 () Bool)

(assert (=> b!1262522 m!1162583))

(declare-fun m!1162585 () Bool)

(assert (=> b!1262522 m!1162585))

(declare-fun m!1162587 () Bool)

(assert (=> b!1262522 m!1162587))

(assert (=> b!1262522 m!1162393))

(declare-fun m!1162589 () Bool)

(assert (=> b!1262522 m!1162589))

(declare-fun m!1162591 () Bool)

(assert (=> b!1262522 m!1162591))

(assert (=> b!1262522 m!1162575))

(declare-fun m!1162593 () Bool)

(assert (=> b!1262522 m!1162593))

(declare-fun m!1162595 () Bool)

(assert (=> b!1262522 m!1162595))

(declare-fun m!1162597 () Bool)

(assert (=> b!1262522 m!1162597))

(assert (=> b!1262522 m!1162591))

(declare-fun m!1162599 () Bool)

(assert (=> b!1262522 m!1162599))

(declare-fun m!1162601 () Bool)

(assert (=> b!1262522 m!1162601))

(assert (=> b!1262522 m!1162579))

(declare-fun m!1162603 () Bool)

(assert (=> b!1262522 m!1162603))

(assert (=> b!1262522 m!1162445))

(declare-fun m!1162605 () Bool)

(assert (=> b!1262515 m!1162605))

(declare-fun m!1162607 () Bool)

(assert (=> b!1262508 m!1162607))

(assert (=> b!1262516 m!1162445))

(assert (=> b!1262516 m!1162445))

(declare-fun m!1162609 () Bool)

(assert (=> b!1262516 m!1162609))

(assert (=> b!1262521 m!1162457))

(assert (=> b!1262521 m!1162455))

(assert (=> b!1262521 m!1162455))

(assert (=> b!1262521 m!1162457))

(assert (=> b!1262521 m!1162459))

(assert (=> b!1262521 m!1162445))

(assert (=> b!1262521 m!1162445))

(declare-fun m!1162611 () Bool)

(assert (=> b!1262521 m!1162611))

(assert (=> b!1262507 m!1162445))

(assert (=> b!1262507 m!1162445))

(assert (=> b!1262507 m!1162447))

(assert (=> b!1262293 d!138425))

(declare-fun condMapEmpty!50389 () Bool)

(declare-fun mapDefault!50389 () ValueCell!15425)

(assert (=> mapNonEmpty!50380 (= condMapEmpty!50389 (= mapRest!50380 ((as const (Array (_ BitVec 32) ValueCell!15425)) mapDefault!50389)))))

(declare-fun e!718695 () Bool)

(declare-fun mapRes!50389 () Bool)

(assert (=> mapNonEmpty!50380 (= tp!95968 (and e!718695 mapRes!50389))))

(declare-fun b!1262534 () Bool)

(assert (=> b!1262534 (= e!718695 tp_is_empty!32377)))

(declare-fun mapNonEmpty!50389 () Bool)

(declare-fun tp!95984 () Bool)

(declare-fun e!718696 () Bool)

(assert (=> mapNonEmpty!50389 (= mapRes!50389 (and tp!95984 e!718696))))

(declare-fun mapKey!50389 () (_ BitVec 32))

(declare-fun mapRest!50389 () (Array (_ BitVec 32) ValueCell!15425))

(declare-fun mapValue!50389 () ValueCell!15425)

(assert (=> mapNonEmpty!50389 (= mapRest!50380 (store mapRest!50389 mapKey!50389 mapValue!50389))))

(declare-fun b!1262533 () Bool)

(assert (=> b!1262533 (= e!718696 tp_is_empty!32377)))

(declare-fun mapIsEmpty!50389 () Bool)

(assert (=> mapIsEmpty!50389 mapRes!50389))

(assert (= (and mapNonEmpty!50380 condMapEmpty!50389) mapIsEmpty!50389))

(assert (= (and mapNonEmpty!50380 (not condMapEmpty!50389)) mapNonEmpty!50389))

(assert (= (and mapNonEmpty!50389 ((_ is ValueCellFull!15425) mapValue!50389)) b!1262533))

(assert (= (and mapNonEmpty!50380 ((_ is ValueCellFull!15425) mapDefault!50389)) b!1262534))

(declare-fun m!1162613 () Bool)

(assert (=> mapNonEmpty!50389 m!1162613))

(declare-fun b_lambda!22877 () Bool)

(assert (= b_lambda!22865 (or (and start!106000 b_free!27475) b_lambda!22877)))

(declare-fun b_lambda!22879 () Bool)

(assert (= b_lambda!22869 (or (and start!106000 b_free!27475) b_lambda!22879)))

(declare-fun b_lambda!22881 () Bool)

(assert (= b_lambda!22867 (or (and start!106000 b_free!27475) b_lambda!22881)))

(declare-fun b_lambda!22883 () Bool)

(assert (= b_lambda!22875 (or (and start!106000 b_free!27475) b_lambda!22883)))

(declare-fun b_lambda!22885 () Bool)

(assert (= b_lambda!22871 (or (and start!106000 b_free!27475) b_lambda!22885)))

(declare-fun b_lambda!22887 () Bool)

(assert (= b_lambda!22873 (or (and start!106000 b_free!27475) b_lambda!22887)))

(check-sat (not b!1262370) (not b!1262515) (not bm!62077) (not d!138421) (not b!1262505) (not bm!62074) (not b_lambda!22883) (not b!1262468) (not b_lambda!22887) (not b!1262415) (not b!1262410) (not bm!62084) tp_is_empty!32377 (not mapNonEmpty!50389) (not b!1262413) (not bm!62082) (not b!1262492) (not b!1262399) (not b!1262402) (not b!1262474) (not bm!62076) (not b!1262479) (not b!1262417) (not b!1262419) (not b!1262476) (not d!138419) b_and!45423 (not bm!62086) (not b_next!27475) (not b!1262409) (not b!1262503) (not b!1262416) (not bm!62057) (not b!1262493) (not b!1262403) (not d!138413) (not b!1262408) (not bm!62075) (not d!138415) (not d!138417) (not b!1262513) (not d!138425) (not b!1262477) (not b!1262482) (not b!1262372) (not b!1262518) (not b!1262371) (not bm!62087) (not b!1262507) (not b!1262508) (not b_lambda!22881) (not b!1262422) (not b!1262516) (not bm!62085) (not bm!62058) (not b!1262424) (not b!1262521) (not b!1262483) (not bm!62054) (not b!1262469) (not b!1262401) (not b!1262522) (not b_lambda!22877) (not b_lambda!22879) (not b!1262405) (not b_lambda!22885) (not b!1262423))
(check-sat b_and!45423 (not b_next!27475))
