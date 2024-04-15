; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104712 () Bool)

(assert start!104712)

(declare-fun b_free!26533 () Bool)

(declare-fun b_next!26533 () Bool)

(assert (=> start!104712 (= b_free!26533 (not b_next!26533))))

(declare-fun tp!93085 () Bool)

(declare-fun b_and!44279 () Bool)

(assert (=> start!104712 (= tp!93085 b_and!44279)))

(declare-fun b!1248331 () Bool)

(declare-fun e!708360 () Bool)

(declare-fun tp_is_empty!31435 () Bool)

(assert (=> b!1248331 (= e!708360 tp_is_empty!31435)))

(declare-fun res!832854 () Bool)

(declare-fun e!708364 () Bool)

(assert (=> start!104712 (=> (not res!832854) (not e!708364))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104712 (= res!832854 (validMask!0 mask!1466))))

(assert (=> start!104712 e!708364))

(assert (=> start!104712 true))

(assert (=> start!104712 tp!93085))

(assert (=> start!104712 tp_is_empty!31435))

(declare-datatypes ((array!80475 0))(
  ( (array!80476 (arr!38806 (Array (_ BitVec 32) (_ BitVec 64))) (size!39344 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80475)

(declare-fun array_inv!29751 (array!80475) Bool)

(assert (=> start!104712 (array_inv!29751 _keys!1118)))

(declare-datatypes ((V!47279 0))(
  ( (V!47280 (val!15780 Int)) )
))
(declare-datatypes ((ValueCell!14954 0))(
  ( (ValueCellFull!14954 (v!18475 V!47279)) (EmptyCell!14954) )
))
(declare-datatypes ((array!80477 0))(
  ( (array!80478 (arr!38807 (Array (_ BitVec 32) ValueCell!14954)) (size!39345 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80477)

(declare-fun e!708362 () Bool)

(declare-fun array_inv!29752 (array!80477) Bool)

(assert (=> start!104712 (and (array_inv!29752 _values!914) e!708362)))

(declare-fun b!1248332 () Bool)

(declare-fun mapRes!48910 () Bool)

(assert (=> b!1248332 (= e!708362 (and e!708360 mapRes!48910))))

(declare-fun condMapEmpty!48910 () Bool)

(declare-fun mapDefault!48910 () ValueCell!14954)

(assert (=> b!1248332 (= condMapEmpty!48910 (= (arr!38807 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14954)) mapDefault!48910)))))

(declare-fun b!1248333 () Bool)

(assert (=> b!1248333 (= e!708364 (bvsgt #b00000000000000000000000000000000 (size!39344 _keys!1118)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47279)

(declare-datatypes ((tuple2!20406 0))(
  ( (tuple2!20407 (_1!10214 (_ BitVec 64)) (_2!10214 V!47279)) )
))
(declare-datatypes ((List!27635 0))(
  ( (Nil!27632) (Cons!27631 (h!28840 tuple2!20406) (t!41095 List!27635)) )
))
(declare-datatypes ((ListLongMap!18279 0))(
  ( (ListLongMap!18280 (toList!9155 List!27635)) )
))
(declare-fun lt!563225 () ListLongMap!18279)

(declare-fun minValueBefore!43 () V!47279)

(declare-fun getCurrentListMapNoExtraKeys!5572 (array!80475 array!80477 (_ BitVec 32) (_ BitVec 32) V!47279 V!47279 (_ BitVec 32) Int) ListLongMap!18279)

(assert (=> b!1248333 (= lt!563225 (getCurrentListMapNoExtraKeys!5572 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248334 () Bool)

(declare-fun res!832853 () Bool)

(assert (=> b!1248334 (=> (not res!832853) (not e!708364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80475 (_ BitVec 32)) Bool)

(assert (=> b!1248334 (= res!832853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248335 () Bool)

(declare-fun res!832855 () Bool)

(assert (=> b!1248335 (=> (not res!832855) (not e!708364))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248335 (= res!832855 (and (= (size!39345 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39344 _keys!1118) (size!39345 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248336 () Bool)

(declare-fun res!832856 () Bool)

(assert (=> b!1248336 (=> (not res!832856) (not e!708364))))

(declare-datatypes ((List!27636 0))(
  ( (Nil!27633) (Cons!27632 (h!28841 (_ BitVec 64)) (t!41096 List!27636)) )
))
(declare-fun arrayNoDuplicates!0 (array!80475 (_ BitVec 32) List!27636) Bool)

(assert (=> b!1248336 (= res!832856 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27633))))

(declare-fun mapIsEmpty!48910 () Bool)

(assert (=> mapIsEmpty!48910 mapRes!48910))

(declare-fun b!1248337 () Bool)

(declare-fun e!708361 () Bool)

(assert (=> b!1248337 (= e!708361 tp_is_empty!31435)))

(declare-fun mapNonEmpty!48910 () Bool)

(declare-fun tp!93086 () Bool)

(assert (=> mapNonEmpty!48910 (= mapRes!48910 (and tp!93086 e!708361))))

(declare-fun mapRest!48910 () (Array (_ BitVec 32) ValueCell!14954))

(declare-fun mapKey!48910 () (_ BitVec 32))

(declare-fun mapValue!48910 () ValueCell!14954)

(assert (=> mapNonEmpty!48910 (= (arr!38807 _values!914) (store mapRest!48910 mapKey!48910 mapValue!48910))))

(assert (= (and start!104712 res!832854) b!1248335))

(assert (= (and b!1248335 res!832855) b!1248334))

(assert (= (and b!1248334 res!832853) b!1248336))

(assert (= (and b!1248336 res!832856) b!1248333))

(assert (= (and b!1248332 condMapEmpty!48910) mapIsEmpty!48910))

(assert (= (and b!1248332 (not condMapEmpty!48910)) mapNonEmpty!48910))

(get-info :version)

(assert (= (and mapNonEmpty!48910 ((_ is ValueCellFull!14954) mapValue!48910)) b!1248337))

(assert (= (and b!1248332 ((_ is ValueCellFull!14954) mapDefault!48910)) b!1248331))

(assert (= start!104712 b!1248332))

(declare-fun m!1149065 () Bool)

(assert (=> b!1248336 m!1149065))

(declare-fun m!1149067 () Bool)

(assert (=> mapNonEmpty!48910 m!1149067))

(declare-fun m!1149069 () Bool)

(assert (=> b!1248334 m!1149069))

(declare-fun m!1149071 () Bool)

(assert (=> start!104712 m!1149071))

(declare-fun m!1149073 () Bool)

(assert (=> start!104712 m!1149073))

(declare-fun m!1149075 () Bool)

(assert (=> start!104712 m!1149075))

(declare-fun m!1149077 () Bool)

(assert (=> b!1248333 m!1149077))

(check-sat (not b!1248334) (not b!1248333) (not b!1248336) b_and!44279 (not start!104712) tp_is_empty!31435 (not b_next!26533) (not mapNonEmpty!48910))
(check-sat b_and!44279 (not b_next!26533))
(get-model)

(declare-fun d!137681 () Bool)

(assert (=> d!137681 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104712 d!137681))

(declare-fun d!137683 () Bool)

(assert (=> d!137683 (= (array_inv!29751 _keys!1118) (bvsge (size!39344 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104712 d!137683))

(declare-fun d!137685 () Bool)

(assert (=> d!137685 (= (array_inv!29752 _values!914) (bvsge (size!39345 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104712 d!137685))

(declare-fun b!1248390 () Bool)

(declare-fun e!708406 () Bool)

(declare-fun call!61553 () Bool)

(assert (=> b!1248390 (= e!708406 call!61553)))

(declare-fun b!1248391 () Bool)

(declare-fun e!708403 () Bool)

(declare-fun e!708405 () Bool)

(assert (=> b!1248391 (= e!708403 e!708405)))

(declare-fun res!832889 () Bool)

(assert (=> b!1248391 (=> (not res!832889) (not e!708405))))

(declare-fun e!708404 () Bool)

(assert (=> b!1248391 (= res!832889 (not e!708404))))

(declare-fun res!832888 () Bool)

(assert (=> b!1248391 (=> (not res!832888) (not e!708404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1248391 (= res!832888 (validKeyInArray!0 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1248392 () Bool)

(declare-fun contains!7442 (List!27636 (_ BitVec 64)) Bool)

(assert (=> b!1248392 (= e!708404 (contains!7442 Nil!27633 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1248393 () Bool)

(assert (=> b!1248393 (= e!708406 call!61553)))

(declare-fun d!137687 () Bool)

(declare-fun res!832887 () Bool)

(assert (=> d!137687 (=> res!832887 e!708403)))

(assert (=> d!137687 (= res!832887 (bvsge #b00000000000000000000000000000000 (size!39344 _keys!1118)))))

(assert (=> d!137687 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27633) e!708403)))

(declare-fun bm!61550 () Bool)

(declare-fun c!122091 () Bool)

(assert (=> bm!61550 (= call!61553 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122091 (Cons!27632 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000) Nil!27633) Nil!27633)))))

(declare-fun b!1248394 () Bool)

(assert (=> b!1248394 (= e!708405 e!708406)))

(assert (=> b!1248394 (= c!122091 (validKeyInArray!0 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!137687 (not res!832887)) b!1248391))

(assert (= (and b!1248391 res!832888) b!1248392))

(assert (= (and b!1248391 res!832889) b!1248394))

(assert (= (and b!1248394 c!122091) b!1248390))

(assert (= (and b!1248394 (not c!122091)) b!1248393))

(assert (= (or b!1248390 b!1248393) bm!61550))

(declare-fun m!1149107 () Bool)

(assert (=> b!1248391 m!1149107))

(assert (=> b!1248391 m!1149107))

(declare-fun m!1149109 () Bool)

(assert (=> b!1248391 m!1149109))

(assert (=> b!1248392 m!1149107))

(assert (=> b!1248392 m!1149107))

(declare-fun m!1149111 () Bool)

(assert (=> b!1248392 m!1149111))

(assert (=> bm!61550 m!1149107))

(declare-fun m!1149113 () Bool)

(assert (=> bm!61550 m!1149113))

(assert (=> b!1248394 m!1149107))

(assert (=> b!1248394 m!1149107))

(assert (=> b!1248394 m!1149109))

(assert (=> b!1248336 d!137687))

(declare-fun b!1248419 () Bool)

(declare-fun e!708427 () Bool)

(declare-fun lt!563251 () ListLongMap!18279)

(declare-fun isEmpty!1027 (ListLongMap!18279) Bool)

(assert (=> b!1248419 (= e!708427 (isEmpty!1027 lt!563251))))

(declare-fun bm!61553 () Bool)

(declare-fun call!61556 () ListLongMap!18279)

(assert (=> bm!61553 (= call!61556 (getCurrentListMapNoExtraKeys!5572 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1248421 () Bool)

(declare-fun e!708424 () ListLongMap!18279)

(assert (=> b!1248421 (= e!708424 (ListLongMap!18280 Nil!27632))))

(declare-fun b!1248422 () Bool)

(declare-fun e!708423 () ListLongMap!18279)

(assert (=> b!1248422 (= e!708423 call!61556)))

(declare-fun b!1248423 () Bool)

(assert (=> b!1248423 (= e!708427 (= lt!563251 (getCurrentListMapNoExtraKeys!5572 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1248424 () Bool)

(assert (=> b!1248424 (= e!708424 e!708423)))

(declare-fun c!122100 () Bool)

(assert (=> b!1248424 (= c!122100 (validKeyInArray!0 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1248425 () Bool)

(declare-fun e!708421 () Bool)

(assert (=> b!1248425 (= e!708421 e!708427)))

(declare-fun c!122102 () Bool)

(assert (=> b!1248425 (= c!122102 (bvslt #b00000000000000000000000000000000 (size!39344 _keys!1118)))))

(declare-fun b!1248426 () Bool)

(declare-datatypes ((Unit!41320 0))(
  ( (Unit!41321) )
))
(declare-fun lt!563252 () Unit!41320)

(declare-fun lt!563246 () Unit!41320)

(assert (=> b!1248426 (= lt!563252 lt!563246)))

(declare-fun lt!563250 () (_ BitVec 64))

(declare-fun lt!563249 () V!47279)

(declare-fun lt!563248 () (_ BitVec 64))

(declare-fun lt!563247 () ListLongMap!18279)

(declare-fun contains!7443 (ListLongMap!18279 (_ BitVec 64)) Bool)

(declare-fun +!4183 (ListLongMap!18279 tuple2!20406) ListLongMap!18279)

(assert (=> b!1248426 (not (contains!7443 (+!4183 lt!563247 (tuple2!20407 lt!563250 lt!563249)) lt!563248))))

(declare-fun addStillNotContains!308 (ListLongMap!18279 (_ BitVec 64) V!47279 (_ BitVec 64)) Unit!41320)

(assert (=> b!1248426 (= lt!563246 (addStillNotContains!308 lt!563247 lt!563250 lt!563249 lt!563248))))

(assert (=> b!1248426 (= lt!563248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19943 (ValueCell!14954 V!47279) V!47279)

(declare-fun dynLambda!3402 (Int (_ BitVec 64)) V!47279)

(assert (=> b!1248426 (= lt!563249 (get!19943 (select (arr!38807 _values!914) #b00000000000000000000000000000000) (dynLambda!3402 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1248426 (= lt!563250 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1248426 (= lt!563247 call!61556)))

(assert (=> b!1248426 (= e!708423 (+!4183 call!61556 (tuple2!20407 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000) (get!19943 (select (arr!38807 _values!914) #b00000000000000000000000000000000) (dynLambda!3402 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1248427 () Bool)

(assert (=> b!1248427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39344 _keys!1118)))))

(assert (=> b!1248427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39345 _values!914)))))

(declare-fun e!708425 () Bool)

(declare-fun apply!972 (ListLongMap!18279 (_ BitVec 64)) V!47279)

(assert (=> b!1248427 (= e!708425 (= (apply!972 lt!563251 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000)) (get!19943 (select (arr!38807 _values!914) #b00000000000000000000000000000000) (dynLambda!3402 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1248428 () Bool)

(declare-fun e!708422 () Bool)

(assert (=> b!1248428 (= e!708422 (validKeyInArray!0 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1248428 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1248420 () Bool)

(assert (=> b!1248420 (= e!708421 e!708425)))

(assert (=> b!1248420 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39344 _keys!1118)))))

(declare-fun res!832899 () Bool)

(assert (=> b!1248420 (= res!832899 (contains!7443 lt!563251 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1248420 (=> (not res!832899) (not e!708425))))

(declare-fun d!137689 () Bool)

(declare-fun e!708426 () Bool)

(assert (=> d!137689 e!708426))

(declare-fun res!832900 () Bool)

(assert (=> d!137689 (=> (not res!832900) (not e!708426))))

(assert (=> d!137689 (= res!832900 (not (contains!7443 lt!563251 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137689 (= lt!563251 e!708424)))

(declare-fun c!122103 () Bool)

(assert (=> d!137689 (= c!122103 (bvsge #b00000000000000000000000000000000 (size!39344 _keys!1118)))))

(assert (=> d!137689 (validMask!0 mask!1466)))

(assert (=> d!137689 (= (getCurrentListMapNoExtraKeys!5572 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!563251)))

(declare-fun b!1248429 () Bool)

(declare-fun res!832898 () Bool)

(assert (=> b!1248429 (=> (not res!832898) (not e!708426))))

(assert (=> b!1248429 (= res!832898 (not (contains!7443 lt!563251 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1248430 () Bool)

(assert (=> b!1248430 (= e!708426 e!708421)))

(declare-fun c!122101 () Bool)

(assert (=> b!1248430 (= c!122101 e!708422)))

(declare-fun res!832901 () Bool)

(assert (=> b!1248430 (=> (not res!832901) (not e!708422))))

(assert (=> b!1248430 (= res!832901 (bvslt #b00000000000000000000000000000000 (size!39344 _keys!1118)))))

(assert (= (and d!137689 c!122103) b!1248421))

(assert (= (and d!137689 (not c!122103)) b!1248424))

(assert (= (and b!1248424 c!122100) b!1248426))

(assert (= (and b!1248424 (not c!122100)) b!1248422))

(assert (= (or b!1248426 b!1248422) bm!61553))

(assert (= (and d!137689 res!832900) b!1248429))

(assert (= (and b!1248429 res!832898) b!1248430))

(assert (= (and b!1248430 res!832901) b!1248428))

(assert (= (and b!1248430 c!122101) b!1248420))

(assert (= (and b!1248430 (not c!122101)) b!1248425))

(assert (= (and b!1248420 res!832899) b!1248427))

(assert (= (and b!1248425 c!122102) b!1248423))

(assert (= (and b!1248425 (not c!122102)) b!1248419))

(declare-fun b_lambda!22493 () Bool)

(assert (=> (not b_lambda!22493) (not b!1248426)))

(declare-fun t!41100 () Bool)

(declare-fun tb!11277 () Bool)

(assert (=> (and start!104712 (= defaultEntry!922 defaultEntry!922) t!41100) tb!11277))

(declare-fun result!23255 () Bool)

(assert (=> tb!11277 (= result!23255 tp_is_empty!31435)))

(assert (=> b!1248426 t!41100))

(declare-fun b_and!44285 () Bool)

(assert (= b_and!44279 (and (=> t!41100 result!23255) b_and!44285)))

(declare-fun b_lambda!22495 () Bool)

(assert (=> (not b_lambda!22495) (not b!1248427)))

(assert (=> b!1248427 t!41100))

(declare-fun b_and!44287 () Bool)

(assert (= b_and!44285 (and (=> t!41100 result!23255) b_and!44287)))

(declare-fun m!1149115 () Bool)

(assert (=> b!1248419 m!1149115))

(declare-fun m!1149117 () Bool)

(assert (=> d!137689 m!1149117))

(assert (=> d!137689 m!1149071))

(assert (=> b!1248428 m!1149107))

(assert (=> b!1248428 m!1149107))

(assert (=> b!1248428 m!1149109))

(assert (=> b!1248424 m!1149107))

(assert (=> b!1248424 m!1149107))

(assert (=> b!1248424 m!1149109))

(declare-fun m!1149119 () Bool)

(assert (=> b!1248427 m!1149119))

(assert (=> b!1248427 m!1149107))

(declare-fun m!1149121 () Bool)

(assert (=> b!1248427 m!1149121))

(declare-fun m!1149123 () Bool)

(assert (=> b!1248427 m!1149123))

(assert (=> b!1248427 m!1149119))

(declare-fun m!1149125 () Bool)

(assert (=> b!1248427 m!1149125))

(assert (=> b!1248427 m!1149107))

(assert (=> b!1248427 m!1149123))

(declare-fun m!1149127 () Bool)

(assert (=> b!1248426 m!1149127))

(assert (=> b!1248426 m!1149119))

(declare-fun m!1149129 () Bool)

(assert (=> b!1248426 m!1149129))

(assert (=> b!1248426 m!1149123))

(assert (=> b!1248426 m!1149119))

(assert (=> b!1248426 m!1149125))

(assert (=> b!1248426 m!1149127))

(declare-fun m!1149131 () Bool)

(assert (=> b!1248426 m!1149131))

(declare-fun m!1149133 () Bool)

(assert (=> b!1248426 m!1149133))

(assert (=> b!1248426 m!1149107))

(assert (=> b!1248426 m!1149123))

(assert (=> b!1248420 m!1149107))

(assert (=> b!1248420 m!1149107))

(declare-fun m!1149135 () Bool)

(assert (=> b!1248420 m!1149135))

(declare-fun m!1149137 () Bool)

(assert (=> bm!61553 m!1149137))

(assert (=> b!1248423 m!1149137))

(declare-fun m!1149139 () Bool)

(assert (=> b!1248429 m!1149139))

(assert (=> b!1248333 d!137689))

(declare-fun b!1248441 () Bool)

(declare-fun e!708435 () Bool)

(declare-fun e!708436 () Bool)

(assert (=> b!1248441 (= e!708435 e!708436)))

(declare-fun c!122106 () Bool)

(assert (=> b!1248441 (= c!122106 (validKeyInArray!0 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61556 () Bool)

(declare-fun call!61559 () Bool)

(assert (=> bm!61556 (= call!61559 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1248443 () Bool)

(declare-fun e!708434 () Bool)

(assert (=> b!1248443 (= e!708436 e!708434)))

(declare-fun lt!563260 () (_ BitVec 64))

(assert (=> b!1248443 (= lt!563260 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!563259 () Unit!41320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80475 (_ BitVec 64) (_ BitVec 32)) Unit!41320)

(assert (=> b!1248443 (= lt!563259 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563260 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1248443 (arrayContainsKey!0 _keys!1118 lt!563260 #b00000000000000000000000000000000)))

(declare-fun lt!563261 () Unit!41320)

(assert (=> b!1248443 (= lt!563261 lt!563259)))

(declare-fun res!832907 () Bool)

(declare-datatypes ((SeekEntryResult!9956 0))(
  ( (MissingZero!9956 (index!42195 (_ BitVec 32))) (Found!9956 (index!42196 (_ BitVec 32))) (Intermediate!9956 (undefined!10768 Bool) (index!42197 (_ BitVec 32)) (x!109761 (_ BitVec 32))) (Undefined!9956) (MissingVacant!9956 (index!42198 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80475 (_ BitVec 32)) SeekEntryResult!9956)

(assert (=> b!1248443 (= res!832907 (= (seekEntryOrOpen!0 (select (arr!38806 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9956 #b00000000000000000000000000000000)))))

(assert (=> b!1248443 (=> (not res!832907) (not e!708434))))

(declare-fun b!1248444 () Bool)

(assert (=> b!1248444 (= e!708434 call!61559)))

(declare-fun b!1248442 () Bool)

(assert (=> b!1248442 (= e!708436 call!61559)))

(declare-fun d!137691 () Bool)

(declare-fun res!832906 () Bool)

(assert (=> d!137691 (=> res!832906 e!708435)))

(assert (=> d!137691 (= res!832906 (bvsge #b00000000000000000000000000000000 (size!39344 _keys!1118)))))

(assert (=> d!137691 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!708435)))

(assert (= (and d!137691 (not res!832906)) b!1248441))

(assert (= (and b!1248441 c!122106) b!1248443))

(assert (= (and b!1248441 (not c!122106)) b!1248442))

(assert (= (and b!1248443 res!832907) b!1248444))

(assert (= (or b!1248444 b!1248442) bm!61556))

(assert (=> b!1248441 m!1149107))

(assert (=> b!1248441 m!1149107))

(assert (=> b!1248441 m!1149109))

(declare-fun m!1149141 () Bool)

(assert (=> bm!61556 m!1149141))

(assert (=> b!1248443 m!1149107))

(declare-fun m!1149143 () Bool)

(assert (=> b!1248443 m!1149143))

(declare-fun m!1149145 () Bool)

(assert (=> b!1248443 m!1149145))

(assert (=> b!1248443 m!1149107))

(declare-fun m!1149147 () Bool)

(assert (=> b!1248443 m!1149147))

(assert (=> b!1248334 d!137691))

(declare-fun b!1248452 () Bool)

(declare-fun e!708442 () Bool)

(assert (=> b!1248452 (= e!708442 tp_is_empty!31435)))

(declare-fun b!1248451 () Bool)

(declare-fun e!708441 () Bool)

(assert (=> b!1248451 (= e!708441 tp_is_empty!31435)))

(declare-fun mapIsEmpty!48919 () Bool)

(declare-fun mapRes!48919 () Bool)

(assert (=> mapIsEmpty!48919 mapRes!48919))

(declare-fun mapNonEmpty!48919 () Bool)

(declare-fun tp!93101 () Bool)

(assert (=> mapNonEmpty!48919 (= mapRes!48919 (and tp!93101 e!708441))))

(declare-fun mapValue!48919 () ValueCell!14954)

(declare-fun mapRest!48919 () (Array (_ BitVec 32) ValueCell!14954))

(declare-fun mapKey!48919 () (_ BitVec 32))

(assert (=> mapNonEmpty!48919 (= mapRest!48910 (store mapRest!48919 mapKey!48919 mapValue!48919))))

(declare-fun condMapEmpty!48919 () Bool)

(declare-fun mapDefault!48919 () ValueCell!14954)

(assert (=> mapNonEmpty!48910 (= condMapEmpty!48919 (= mapRest!48910 ((as const (Array (_ BitVec 32) ValueCell!14954)) mapDefault!48919)))))

(assert (=> mapNonEmpty!48910 (= tp!93086 (and e!708442 mapRes!48919))))

(assert (= (and mapNonEmpty!48910 condMapEmpty!48919) mapIsEmpty!48919))

(assert (= (and mapNonEmpty!48910 (not condMapEmpty!48919)) mapNonEmpty!48919))

(assert (= (and mapNonEmpty!48919 ((_ is ValueCellFull!14954) mapValue!48919)) b!1248451))

(assert (= (and mapNonEmpty!48910 ((_ is ValueCellFull!14954) mapDefault!48919)) b!1248452))

(declare-fun m!1149149 () Bool)

(assert (=> mapNonEmpty!48919 m!1149149))

(declare-fun b_lambda!22497 () Bool)

(assert (= b_lambda!22495 (or (and start!104712 b_free!26533) b_lambda!22497)))

(declare-fun b_lambda!22499 () Bool)

(assert (= b_lambda!22493 (or (and start!104712 b_free!26533) b_lambda!22499)))

(check-sat (not b_lambda!22497) (not b!1248394) b_and!44287 (not b!1248443) (not b!1248420) (not b!1248426) (not b!1248391) (not bm!61556) (not mapNonEmpty!48919) (not b_next!26533) (not bm!61553) (not b!1248424) (not b!1248419) (not b!1248429) (not bm!61550) (not d!137689) (not b!1248427) tp_is_empty!31435 (not b!1248428) (not b!1248392) (not b!1248423) (not b_lambda!22499) (not b!1248441))
(check-sat b_and!44287 (not b_next!26533))
