; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74952 () Bool)

(assert start!74952)

(declare-fun b_free!15471 () Bool)

(declare-fun b_next!15471 () Bool)

(assert (=> start!74952 (= b_free!15471 (not b_next!15471))))

(declare-fun tp!54116 () Bool)

(declare-fun b_and!25641 () Bool)

(assert (=> start!74952 (= tp!54116 b_and!25641)))

(declare-fun b!884283 () Bool)

(declare-datatypes ((Unit!30198 0))(
  ( (Unit!30199) )
))
(declare-fun e!492114 () Unit!30198)

(declare-fun Unit!30200 () Unit!30198)

(assert (=> b!884283 (= e!492114 Unit!30200)))

(declare-fun lt!400537 () Unit!30198)

(declare-datatypes ((array!51556 0))(
  ( (array!51557 (arr!24797 (Array (_ BitVec 32) (_ BitVec 64))) (size!25237 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51556)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51556 (_ BitVec 32) (_ BitVec 32)) Unit!30198)

(assert (=> b!884283 (= lt!400537 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17615 0))(
  ( (Nil!17612) (Cons!17611 (h!18742 (_ BitVec 64)) (t!24888 List!17615)) )
))
(declare-fun arrayNoDuplicates!0 (array!51556 (_ BitVec 32) List!17615) Bool)

(assert (=> b!884283 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17612)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!400543 () Unit!30198)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51556 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30198)

(assert (=> b!884283 (= lt!400543 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884283 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400544 () Unit!30198)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51556 (_ BitVec 64) (_ BitVec 32) List!17615) Unit!30198)

(assert (=> b!884283 (= lt!400544 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17612))))

(assert (=> b!884283 false))

(declare-fun mapIsEmpty!28209 () Bool)

(declare-fun mapRes!28209 () Bool)

(assert (=> mapIsEmpty!28209 mapRes!28209))

(declare-fun b!884284 () Bool)

(declare-fun e!492110 () Bool)

(declare-fun e!492108 () Bool)

(assert (=> b!884284 (= e!492110 e!492108)))

(declare-fun res!600741 () Bool)

(assert (=> b!884284 (=> res!600741 e!492108)))

(assert (=> b!884284 (= res!600741 (= k0!854 (select (arr!24797 _keys!868) from!1053)))))

(assert (=> b!884284 (not (= (select (arr!24797 _keys!868) from!1053) k0!854))))

(declare-fun lt!400545 () Unit!30198)

(assert (=> b!884284 (= lt!400545 e!492114)))

(declare-fun c!93112 () Bool)

(assert (=> b!884284 (= c!93112 (= (select (arr!24797 _keys!868) from!1053) k0!854))))

(declare-datatypes ((V!28667 0))(
  ( (V!28668 (val!8905 Int)) )
))
(declare-datatypes ((tuple2!11808 0))(
  ( (tuple2!11809 (_1!5915 (_ BitVec 64)) (_2!5915 V!28667)) )
))
(declare-datatypes ((List!17616 0))(
  ( (Nil!17613) (Cons!17612 (h!18743 tuple2!11808) (t!24889 List!17616)) )
))
(declare-datatypes ((ListLongMap!10577 0))(
  ( (ListLongMap!10578 (toList!5304 List!17616)) )
))
(declare-fun lt!400535 () ListLongMap!10577)

(declare-fun lt!400539 () ListLongMap!10577)

(assert (=> b!884284 (= lt!400535 lt!400539)))

(declare-fun lt!400546 () ListLongMap!10577)

(declare-fun lt!400548 () tuple2!11808)

(declare-fun +!2573 (ListLongMap!10577 tuple2!11808) ListLongMap!10577)

(assert (=> b!884284 (= lt!400539 (+!2573 lt!400546 lt!400548))))

(declare-fun lt!400542 () V!28667)

(assert (=> b!884284 (= lt!400548 (tuple2!11809 (select (arr!24797 _keys!868) from!1053) lt!400542))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8418 0))(
  ( (ValueCellFull!8418 (v!11374 V!28667)) (EmptyCell!8418) )
))
(declare-datatypes ((array!51558 0))(
  ( (array!51559 (arr!24798 (Array (_ BitVec 32) ValueCell!8418)) (size!25238 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51558)

(declare-fun get!13072 (ValueCell!8418 V!28667) V!28667)

(declare-fun dynLambda!1283 (Int (_ BitVec 64)) V!28667)

(assert (=> b!884284 (= lt!400542 (get!13072 (select (arr!24798 _values!688) from!1053) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884285 () Bool)

(declare-fun e!492111 () Bool)

(assert (=> b!884285 (= e!492111 (not e!492110))))

(declare-fun res!600745 () Bool)

(assert (=> b!884285 (=> res!600745 e!492110)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884285 (= res!600745 (not (validKeyInArray!0 (select (arr!24797 _keys!868) from!1053))))))

(declare-fun lt!400547 () ListLongMap!10577)

(assert (=> b!884285 (= lt!400547 lt!400546)))

(declare-fun lt!400538 () ListLongMap!10577)

(declare-fun lt!400541 () tuple2!11808)

(assert (=> b!884285 (= lt!400546 (+!2573 lt!400538 lt!400541))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28667)

(declare-fun zeroValue!654 () V!28667)

(declare-fun lt!400550 () array!51558)

(declare-fun getCurrentListMapNoExtraKeys!3263 (array!51556 array!51558 (_ BitVec 32) (_ BitVec 32) V!28667 V!28667 (_ BitVec 32) Int) ListLongMap!10577)

(assert (=> b!884285 (= lt!400547 (getCurrentListMapNoExtraKeys!3263 _keys!868 lt!400550 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!28667)

(assert (=> b!884285 (= lt!400541 (tuple2!11809 k0!854 v!557))))

(assert (=> b!884285 (= lt!400538 (getCurrentListMapNoExtraKeys!3263 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400536 () Unit!30198)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!756 (array!51556 array!51558 (_ BitVec 32) (_ BitVec 32) V!28667 V!28667 (_ BitVec 32) (_ BitVec 64) V!28667 (_ BitVec 32) Int) Unit!30198)

(assert (=> b!884285 (= lt!400536 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!756 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400549 () ListLongMap!10577)

(declare-fun b!884286 () Bool)

(assert (=> b!884286 (= e!492108 (= lt!400535 (+!2573 lt!400549 lt!400541)))))

(assert (=> b!884286 (= lt!400539 (+!2573 (+!2573 lt!400538 lt!400548) lt!400541))))

(declare-fun lt!400540 () Unit!30198)

(declare-fun addCommutativeForDiffKeys!556 (ListLongMap!10577 (_ BitVec 64) V!28667 (_ BitVec 64) V!28667) Unit!30198)

(assert (=> b!884286 (= lt!400540 (addCommutativeForDiffKeys!556 lt!400538 k0!854 v!557 (select (arr!24797 _keys!868) from!1053) lt!400542))))

(declare-fun b!884287 () Bool)

(declare-fun res!600737 () Bool)

(declare-fun e!492107 () Bool)

(assert (=> b!884287 (=> (not res!600737) (not e!492107))))

(assert (=> b!884287 (= res!600737 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17612))))

(declare-fun b!884288 () Bool)

(declare-fun Unit!30201 () Unit!30198)

(assert (=> b!884288 (= e!492114 Unit!30201)))

(declare-fun b!884289 () Bool)

(assert (=> b!884289 (= e!492107 e!492111)))

(declare-fun res!600742 () Bool)

(assert (=> b!884289 (=> (not res!600742) (not e!492111))))

(assert (=> b!884289 (= res!600742 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!884289 (= lt!400535 (getCurrentListMapNoExtraKeys!3263 _keys!868 lt!400550 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884289 (= lt!400550 (array!51559 (store (arr!24798 _values!688) i!612 (ValueCellFull!8418 v!557)) (size!25238 _values!688)))))

(assert (=> b!884289 (= lt!400549 (getCurrentListMapNoExtraKeys!3263 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884290 () Bool)

(declare-fun res!600739 () Bool)

(assert (=> b!884290 (=> (not res!600739) (not e!492107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884290 (= res!600739 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!28209 () Bool)

(declare-fun tp!54115 () Bool)

(declare-fun e!492106 () Bool)

(assert (=> mapNonEmpty!28209 (= mapRes!28209 (and tp!54115 e!492106))))

(declare-fun mapRest!28209 () (Array (_ BitVec 32) ValueCell!8418))

(declare-fun mapKey!28209 () (_ BitVec 32))

(declare-fun mapValue!28209 () ValueCell!8418)

(assert (=> mapNonEmpty!28209 (= (arr!24798 _values!688) (store mapRest!28209 mapKey!28209 mapValue!28209))))

(declare-fun res!600738 () Bool)

(assert (=> start!74952 (=> (not res!600738) (not e!492107))))

(assert (=> start!74952 (= res!600738 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25237 _keys!868))))))

(assert (=> start!74952 e!492107))

(declare-fun tp_is_empty!17715 () Bool)

(assert (=> start!74952 tp_is_empty!17715))

(assert (=> start!74952 true))

(assert (=> start!74952 tp!54116))

(declare-fun array_inv!19522 (array!51556) Bool)

(assert (=> start!74952 (array_inv!19522 _keys!868)))

(declare-fun e!492113 () Bool)

(declare-fun array_inv!19523 (array!51558) Bool)

(assert (=> start!74952 (and (array_inv!19523 _values!688) e!492113)))

(declare-fun b!884291 () Bool)

(declare-fun res!600744 () Bool)

(assert (=> b!884291 (=> (not res!600744) (not e!492107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51556 (_ BitVec 32)) Bool)

(assert (=> b!884291 (= res!600744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884292 () Bool)

(declare-fun res!600743 () Bool)

(assert (=> b!884292 (=> (not res!600743) (not e!492107))))

(assert (=> b!884292 (= res!600743 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25237 _keys!868))))))

(declare-fun b!884293 () Bool)

(declare-fun e!492112 () Bool)

(assert (=> b!884293 (= e!492112 tp_is_empty!17715)))

(declare-fun b!884294 () Bool)

(assert (=> b!884294 (= e!492106 tp_is_empty!17715)))

(declare-fun b!884295 () Bool)

(assert (=> b!884295 (= e!492113 (and e!492112 mapRes!28209))))

(declare-fun condMapEmpty!28209 () Bool)

(declare-fun mapDefault!28209 () ValueCell!8418)

(assert (=> b!884295 (= condMapEmpty!28209 (= (arr!24798 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8418)) mapDefault!28209)))))

(declare-fun b!884296 () Bool)

(declare-fun res!600747 () Bool)

(assert (=> b!884296 (=> (not res!600747) (not e!492107))))

(assert (=> b!884296 (= res!600747 (and (= (select (arr!24797 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!884297 () Bool)

(declare-fun res!600740 () Bool)

(assert (=> b!884297 (=> (not res!600740) (not e!492107))))

(assert (=> b!884297 (= res!600740 (and (= (size!25238 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25237 _keys!868) (size!25238 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884298 () Bool)

(declare-fun res!600746 () Bool)

(assert (=> b!884298 (=> (not res!600746) (not e!492107))))

(assert (=> b!884298 (= res!600746 (validKeyInArray!0 k0!854))))

(assert (= (and start!74952 res!600738) b!884290))

(assert (= (and b!884290 res!600739) b!884297))

(assert (= (and b!884297 res!600740) b!884291))

(assert (= (and b!884291 res!600744) b!884287))

(assert (= (and b!884287 res!600737) b!884292))

(assert (= (and b!884292 res!600743) b!884298))

(assert (= (and b!884298 res!600746) b!884296))

(assert (= (and b!884296 res!600747) b!884289))

(assert (= (and b!884289 res!600742) b!884285))

(assert (= (and b!884285 (not res!600745)) b!884284))

(assert (= (and b!884284 c!93112) b!884283))

(assert (= (and b!884284 (not c!93112)) b!884288))

(assert (= (and b!884284 (not res!600741)) b!884286))

(assert (= (and b!884295 condMapEmpty!28209) mapIsEmpty!28209))

(assert (= (and b!884295 (not condMapEmpty!28209)) mapNonEmpty!28209))

(get-info :version)

(assert (= (and mapNonEmpty!28209 ((_ is ValueCellFull!8418) mapValue!28209)) b!884294))

(assert (= (and b!884295 ((_ is ValueCellFull!8418) mapDefault!28209)) b!884293))

(assert (= start!74952 b!884295))

(declare-fun b_lambda!12749 () Bool)

(assert (=> (not b_lambda!12749) (not b!884284)))

(declare-fun t!24887 () Bool)

(declare-fun tb!5129 () Bool)

(assert (=> (and start!74952 (= defaultEntry!696 defaultEntry!696) t!24887) tb!5129))

(declare-fun result!9893 () Bool)

(assert (=> tb!5129 (= result!9893 tp_is_empty!17715)))

(assert (=> b!884284 t!24887))

(declare-fun b_and!25643 () Bool)

(assert (= b_and!25641 (and (=> t!24887 result!9893) b_and!25643)))

(declare-fun m!824453 () Bool)

(assert (=> b!884291 m!824453))

(declare-fun m!824455 () Bool)

(assert (=> b!884286 m!824455))

(declare-fun m!824457 () Bool)

(assert (=> b!884286 m!824457))

(declare-fun m!824459 () Bool)

(assert (=> b!884286 m!824459))

(assert (=> b!884286 m!824455))

(declare-fun m!824461 () Bool)

(assert (=> b!884286 m!824461))

(assert (=> b!884286 m!824461))

(declare-fun m!824463 () Bool)

(assert (=> b!884286 m!824463))

(declare-fun m!824465 () Bool)

(assert (=> b!884285 m!824465))

(assert (=> b!884285 m!824461))

(declare-fun m!824467 () Bool)

(assert (=> b!884285 m!824467))

(declare-fun m!824469 () Bool)

(assert (=> b!884285 m!824469))

(declare-fun m!824471 () Bool)

(assert (=> b!884285 m!824471))

(assert (=> b!884285 m!824461))

(declare-fun m!824473 () Bool)

(assert (=> b!884285 m!824473))

(declare-fun m!824475 () Bool)

(assert (=> b!884290 m!824475))

(declare-fun m!824477 () Bool)

(assert (=> b!884287 m!824477))

(declare-fun m!824479 () Bool)

(assert (=> start!74952 m!824479))

(declare-fun m!824481 () Bool)

(assert (=> start!74952 m!824481))

(declare-fun m!824483 () Bool)

(assert (=> b!884284 m!824483))

(declare-fun m!824485 () Bool)

(assert (=> b!884284 m!824485))

(declare-fun m!824487 () Bool)

(assert (=> b!884284 m!824487))

(declare-fun m!824489 () Bool)

(assert (=> b!884284 m!824489))

(assert (=> b!884284 m!824485))

(assert (=> b!884284 m!824461))

(assert (=> b!884284 m!824487))

(declare-fun m!824491 () Bool)

(assert (=> mapNonEmpty!28209 m!824491))

(declare-fun m!824493 () Bool)

(assert (=> b!884296 m!824493))

(declare-fun m!824495 () Bool)

(assert (=> b!884283 m!824495))

(declare-fun m!824497 () Bool)

(assert (=> b!884283 m!824497))

(declare-fun m!824499 () Bool)

(assert (=> b!884283 m!824499))

(declare-fun m!824501 () Bool)

(assert (=> b!884283 m!824501))

(declare-fun m!824503 () Bool)

(assert (=> b!884283 m!824503))

(declare-fun m!824505 () Bool)

(assert (=> b!884289 m!824505))

(declare-fun m!824507 () Bool)

(assert (=> b!884289 m!824507))

(declare-fun m!824509 () Bool)

(assert (=> b!884289 m!824509))

(declare-fun m!824511 () Bool)

(assert (=> b!884298 m!824511))

(check-sat b_and!25643 (not b!884287) tp_is_empty!17715 (not b!884289) (not b!884283) (not b!884284) (not b!884290) (not b!884298) (not b_lambda!12749) (not b!884285) (not b!884291) (not b!884286) (not mapNonEmpty!28209) (not b_next!15471) (not start!74952))
(check-sat b_and!25643 (not b_next!15471))
(get-model)

(declare-fun b_lambda!12753 () Bool)

(assert (= b_lambda!12749 (or (and start!74952 b_free!15471) b_lambda!12753)))

(check-sat b_and!25643 (not b!884287) tp_is_empty!17715 (not b!884289) (not b!884283) (not b!884284) (not b!884290) (not b!884298) (not b_lambda!12753) (not b!884285) (not b!884291) (not b!884286) (not mapNonEmpty!28209) (not b_next!15471) (not start!74952))
(check-sat b_and!25643 (not b_next!15471))
(get-model)

(declare-fun b!884375 () Bool)

(declare-fun e!492156 () Bool)

(declare-fun e!492161 () Bool)

(assert (=> b!884375 (= e!492156 e!492161)))

(assert (=> b!884375 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25237 _keys!868)))))

(declare-fun lt!400619 () ListLongMap!10577)

(declare-fun res!600789 () Bool)

(declare-fun contains!4278 (ListLongMap!10577 (_ BitVec 64)) Bool)

(assert (=> b!884375 (= res!600789 (contains!4278 lt!400619 (select (arr!24797 _keys!868) from!1053)))))

(assert (=> b!884375 (=> (not res!600789) (not e!492161))))

(declare-fun b!884376 () Bool)

(declare-fun e!492162 () ListLongMap!10577)

(assert (=> b!884376 (= e!492162 (ListLongMap!10578 Nil!17613))))

(declare-fun d!109207 () Bool)

(declare-fun e!492159 () Bool)

(assert (=> d!109207 e!492159))

(declare-fun res!600790 () Bool)

(assert (=> d!109207 (=> (not res!600790) (not e!492159))))

(assert (=> d!109207 (= res!600790 (not (contains!4278 lt!400619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109207 (= lt!400619 e!492162)))

(declare-fun c!93126 () Bool)

(assert (=> d!109207 (= c!93126 (bvsge from!1053 (size!25237 _keys!868)))))

(assert (=> d!109207 (validMask!0 mask!1196)))

(assert (=> d!109207 (= (getCurrentListMapNoExtraKeys!3263 _keys!868 lt!400550 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!400619)))

(declare-fun b!884377 () Bool)

(declare-fun e!492160 () Bool)

(declare-fun isEmpty!672 (ListLongMap!10577) Bool)

(assert (=> b!884377 (= e!492160 (isEmpty!672 lt!400619))))

(declare-fun b!884378 () Bool)

(declare-fun lt!400614 () Unit!30198)

(declare-fun lt!400613 () Unit!30198)

(assert (=> b!884378 (= lt!400614 lt!400613)))

(declare-fun lt!400617 () ListLongMap!10577)

(declare-fun lt!400618 () (_ BitVec 64))

(declare-fun lt!400615 () V!28667)

(declare-fun lt!400616 () (_ BitVec 64))

(assert (=> b!884378 (not (contains!4278 (+!2573 lt!400617 (tuple2!11809 lt!400618 lt!400615)) lt!400616))))

(declare-fun addStillNotContains!210 (ListLongMap!10577 (_ BitVec 64) V!28667 (_ BitVec 64)) Unit!30198)

(assert (=> b!884378 (= lt!400613 (addStillNotContains!210 lt!400617 lt!400618 lt!400615 lt!400616))))

(assert (=> b!884378 (= lt!400616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884378 (= lt!400615 (get!13072 (select (arr!24798 lt!400550) from!1053) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884378 (= lt!400618 (select (arr!24797 _keys!868) from!1053))))

(declare-fun call!38988 () ListLongMap!10577)

(assert (=> b!884378 (= lt!400617 call!38988)))

(declare-fun e!492157 () ListLongMap!10577)

(assert (=> b!884378 (= e!492157 (+!2573 call!38988 (tuple2!11809 (select (arr!24797 _keys!868) from!1053) (get!13072 (select (arr!24798 lt!400550) from!1053) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884379 () Bool)

(assert (=> b!884379 (= e!492159 e!492156)))

(declare-fun c!93124 () Bool)

(declare-fun e!492158 () Bool)

(assert (=> b!884379 (= c!93124 e!492158)))

(declare-fun res!600792 () Bool)

(assert (=> b!884379 (=> (not res!600792) (not e!492158))))

(assert (=> b!884379 (= res!600792 (bvslt from!1053 (size!25237 _keys!868)))))

(declare-fun b!884380 () Bool)

(assert (=> b!884380 (= e!492162 e!492157)))

(declare-fun c!93125 () Bool)

(assert (=> b!884380 (= c!93125 (validKeyInArray!0 (select (arr!24797 _keys!868) from!1053)))))

(declare-fun b!884381 () Bool)

(assert (=> b!884381 (= e!492158 (validKeyInArray!0 (select (arr!24797 _keys!868) from!1053)))))

(assert (=> b!884381 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!884382 () Bool)

(assert (=> b!884382 (= e!492157 call!38988)))

(declare-fun b!884383 () Bool)

(assert (=> b!884383 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25237 _keys!868)))))

(assert (=> b!884383 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25238 lt!400550)))))

(declare-fun apply!385 (ListLongMap!10577 (_ BitVec 64)) V!28667)

(assert (=> b!884383 (= e!492161 (= (apply!385 lt!400619 (select (arr!24797 _keys!868) from!1053)) (get!13072 (select (arr!24798 lt!400550) from!1053) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884384 () Bool)

(assert (=> b!884384 (= e!492160 (= lt!400619 (getCurrentListMapNoExtraKeys!3263 _keys!868 lt!400550 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884385 () Bool)

(assert (=> b!884385 (= e!492156 e!492160)))

(declare-fun c!93127 () Bool)

(assert (=> b!884385 (= c!93127 (bvslt from!1053 (size!25237 _keys!868)))))

(declare-fun bm!38985 () Bool)

(assert (=> bm!38985 (= call!38988 (getCurrentListMapNoExtraKeys!3263 _keys!868 lt!400550 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884386 () Bool)

(declare-fun res!600791 () Bool)

(assert (=> b!884386 (=> (not res!600791) (not e!492159))))

(assert (=> b!884386 (= res!600791 (not (contains!4278 lt!400619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109207 c!93126) b!884376))

(assert (= (and d!109207 (not c!93126)) b!884380))

(assert (= (and b!884380 c!93125) b!884378))

(assert (= (and b!884380 (not c!93125)) b!884382))

(assert (= (or b!884378 b!884382) bm!38985))

(assert (= (and d!109207 res!600790) b!884386))

(assert (= (and b!884386 res!600791) b!884379))

(assert (= (and b!884379 res!600792) b!884381))

(assert (= (and b!884379 c!93124) b!884375))

(assert (= (and b!884379 (not c!93124)) b!884385))

(assert (= (and b!884375 res!600789) b!884383))

(assert (= (and b!884385 c!93127) b!884384))

(assert (= (and b!884385 (not c!93127)) b!884377))

(declare-fun b_lambda!12755 () Bool)

(assert (=> (not b_lambda!12755) (not b!884378)))

(assert (=> b!884378 t!24887))

(declare-fun b_and!25649 () Bool)

(assert (= b_and!25643 (and (=> t!24887 result!9893) b_and!25649)))

(declare-fun b_lambda!12757 () Bool)

(assert (=> (not b_lambda!12757) (not b!884383)))

(assert (=> b!884383 t!24887))

(declare-fun b_and!25651 () Bool)

(assert (= b_and!25649 (and (=> t!24887 result!9893) b_and!25651)))

(declare-fun m!824573 () Bool)

(assert (=> b!884378 m!824573))

(declare-fun m!824575 () Bool)

(assert (=> b!884378 m!824575))

(assert (=> b!884378 m!824461))

(declare-fun m!824577 () Bool)

(assert (=> b!884378 m!824577))

(declare-fun m!824579 () Bool)

(assert (=> b!884378 m!824579))

(assert (=> b!884378 m!824577))

(assert (=> b!884378 m!824573))

(assert (=> b!884378 m!824487))

(declare-fun m!824581 () Bool)

(assert (=> b!884378 m!824581))

(assert (=> b!884378 m!824487))

(declare-fun m!824583 () Bool)

(assert (=> b!884378 m!824583))

(declare-fun m!824585 () Bool)

(assert (=> b!884386 m!824585))

(assert (=> b!884380 m!824461))

(assert (=> b!884380 m!824461))

(assert (=> b!884380 m!824467))

(declare-fun m!824587 () Bool)

(assert (=> d!109207 m!824587))

(assert (=> d!109207 m!824475))

(assert (=> b!884375 m!824461))

(assert (=> b!884375 m!824461))

(declare-fun m!824589 () Bool)

(assert (=> b!884375 m!824589))

(declare-fun m!824591 () Bool)

(assert (=> b!884384 m!824591))

(assert (=> b!884383 m!824573))

(assert (=> b!884383 m!824461))

(assert (=> b!884383 m!824461))

(declare-fun m!824593 () Bool)

(assert (=> b!884383 m!824593))

(assert (=> b!884383 m!824573))

(assert (=> b!884383 m!824487))

(assert (=> b!884383 m!824581))

(assert (=> b!884383 m!824487))

(assert (=> b!884381 m!824461))

(assert (=> b!884381 m!824461))

(assert (=> b!884381 m!824467))

(declare-fun m!824595 () Bool)

(assert (=> b!884377 m!824595))

(assert (=> bm!38985 m!824591))

(assert (=> b!884289 d!109207))

(declare-fun b!884387 () Bool)

(declare-fun e!492163 () Bool)

(declare-fun e!492168 () Bool)

(assert (=> b!884387 (= e!492163 e!492168)))

(assert (=> b!884387 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25237 _keys!868)))))

(declare-fun lt!400626 () ListLongMap!10577)

(declare-fun res!600793 () Bool)

(assert (=> b!884387 (= res!600793 (contains!4278 lt!400626 (select (arr!24797 _keys!868) from!1053)))))

(assert (=> b!884387 (=> (not res!600793) (not e!492168))))

(declare-fun b!884388 () Bool)

(declare-fun e!492169 () ListLongMap!10577)

(assert (=> b!884388 (= e!492169 (ListLongMap!10578 Nil!17613))))

(declare-fun d!109209 () Bool)

(declare-fun e!492166 () Bool)

(assert (=> d!109209 e!492166))

(declare-fun res!600794 () Bool)

(assert (=> d!109209 (=> (not res!600794) (not e!492166))))

(assert (=> d!109209 (= res!600794 (not (contains!4278 lt!400626 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109209 (= lt!400626 e!492169)))

(declare-fun c!93130 () Bool)

(assert (=> d!109209 (= c!93130 (bvsge from!1053 (size!25237 _keys!868)))))

(assert (=> d!109209 (validMask!0 mask!1196)))

(assert (=> d!109209 (= (getCurrentListMapNoExtraKeys!3263 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!400626)))

(declare-fun b!884389 () Bool)

(declare-fun e!492167 () Bool)

(assert (=> b!884389 (= e!492167 (isEmpty!672 lt!400626))))

(declare-fun b!884390 () Bool)

(declare-fun lt!400621 () Unit!30198)

(declare-fun lt!400620 () Unit!30198)

(assert (=> b!884390 (= lt!400621 lt!400620)))

(declare-fun lt!400624 () ListLongMap!10577)

(declare-fun lt!400622 () V!28667)

(declare-fun lt!400623 () (_ BitVec 64))

(declare-fun lt!400625 () (_ BitVec 64))

(assert (=> b!884390 (not (contains!4278 (+!2573 lt!400624 (tuple2!11809 lt!400625 lt!400622)) lt!400623))))

(assert (=> b!884390 (= lt!400620 (addStillNotContains!210 lt!400624 lt!400625 lt!400622 lt!400623))))

(assert (=> b!884390 (= lt!400623 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884390 (= lt!400622 (get!13072 (select (arr!24798 _values!688) from!1053) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884390 (= lt!400625 (select (arr!24797 _keys!868) from!1053))))

(declare-fun call!38989 () ListLongMap!10577)

(assert (=> b!884390 (= lt!400624 call!38989)))

(declare-fun e!492164 () ListLongMap!10577)

(assert (=> b!884390 (= e!492164 (+!2573 call!38989 (tuple2!11809 (select (arr!24797 _keys!868) from!1053) (get!13072 (select (arr!24798 _values!688) from!1053) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884391 () Bool)

(assert (=> b!884391 (= e!492166 e!492163)))

(declare-fun c!93128 () Bool)

(declare-fun e!492165 () Bool)

(assert (=> b!884391 (= c!93128 e!492165)))

(declare-fun res!600796 () Bool)

(assert (=> b!884391 (=> (not res!600796) (not e!492165))))

(assert (=> b!884391 (= res!600796 (bvslt from!1053 (size!25237 _keys!868)))))

(declare-fun b!884392 () Bool)

(assert (=> b!884392 (= e!492169 e!492164)))

(declare-fun c!93129 () Bool)

(assert (=> b!884392 (= c!93129 (validKeyInArray!0 (select (arr!24797 _keys!868) from!1053)))))

(declare-fun b!884393 () Bool)

(assert (=> b!884393 (= e!492165 (validKeyInArray!0 (select (arr!24797 _keys!868) from!1053)))))

(assert (=> b!884393 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!884394 () Bool)

(assert (=> b!884394 (= e!492164 call!38989)))

(declare-fun b!884395 () Bool)

(assert (=> b!884395 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25237 _keys!868)))))

(assert (=> b!884395 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25238 _values!688)))))

(assert (=> b!884395 (= e!492168 (= (apply!385 lt!400626 (select (arr!24797 _keys!868) from!1053)) (get!13072 (select (arr!24798 _values!688) from!1053) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884396 () Bool)

(assert (=> b!884396 (= e!492167 (= lt!400626 (getCurrentListMapNoExtraKeys!3263 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884397 () Bool)

(assert (=> b!884397 (= e!492163 e!492167)))

(declare-fun c!93131 () Bool)

(assert (=> b!884397 (= c!93131 (bvslt from!1053 (size!25237 _keys!868)))))

(declare-fun bm!38986 () Bool)

(assert (=> bm!38986 (= call!38989 (getCurrentListMapNoExtraKeys!3263 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884398 () Bool)

(declare-fun res!600795 () Bool)

(assert (=> b!884398 (=> (not res!600795) (not e!492166))))

(assert (=> b!884398 (= res!600795 (not (contains!4278 lt!400626 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109209 c!93130) b!884388))

(assert (= (and d!109209 (not c!93130)) b!884392))

(assert (= (and b!884392 c!93129) b!884390))

(assert (= (and b!884392 (not c!93129)) b!884394))

(assert (= (or b!884390 b!884394) bm!38986))

(assert (= (and d!109209 res!600794) b!884398))

(assert (= (and b!884398 res!600795) b!884391))

(assert (= (and b!884391 res!600796) b!884393))

(assert (= (and b!884391 c!93128) b!884387))

(assert (= (and b!884391 (not c!93128)) b!884397))

(assert (= (and b!884387 res!600793) b!884395))

(assert (= (and b!884397 c!93131) b!884396))

(assert (= (and b!884397 (not c!93131)) b!884389))

(declare-fun b_lambda!12759 () Bool)

(assert (=> (not b_lambda!12759) (not b!884390)))

(assert (=> b!884390 t!24887))

(declare-fun b_and!25653 () Bool)

(assert (= b_and!25651 (and (=> t!24887 result!9893) b_and!25653)))

(declare-fun b_lambda!12761 () Bool)

(assert (=> (not b_lambda!12761) (not b!884395)))

(assert (=> b!884395 t!24887))

(declare-fun b_and!25655 () Bool)

(assert (= b_and!25653 (and (=> t!24887 result!9893) b_and!25655)))

(assert (=> b!884390 m!824485))

(declare-fun m!824597 () Bool)

(assert (=> b!884390 m!824597))

(assert (=> b!884390 m!824461))

(declare-fun m!824599 () Bool)

(assert (=> b!884390 m!824599))

(declare-fun m!824601 () Bool)

(assert (=> b!884390 m!824601))

(assert (=> b!884390 m!824599))

(assert (=> b!884390 m!824485))

(assert (=> b!884390 m!824487))

(assert (=> b!884390 m!824489))

(assert (=> b!884390 m!824487))

(declare-fun m!824603 () Bool)

(assert (=> b!884390 m!824603))

(declare-fun m!824605 () Bool)

(assert (=> b!884398 m!824605))

(assert (=> b!884392 m!824461))

(assert (=> b!884392 m!824461))

(assert (=> b!884392 m!824467))

(declare-fun m!824607 () Bool)

(assert (=> d!109209 m!824607))

(assert (=> d!109209 m!824475))

(assert (=> b!884387 m!824461))

(assert (=> b!884387 m!824461))

(declare-fun m!824609 () Bool)

(assert (=> b!884387 m!824609))

(declare-fun m!824611 () Bool)

(assert (=> b!884396 m!824611))

(assert (=> b!884395 m!824485))

(assert (=> b!884395 m!824461))

(assert (=> b!884395 m!824461))

(declare-fun m!824613 () Bool)

(assert (=> b!884395 m!824613))

(assert (=> b!884395 m!824485))

(assert (=> b!884395 m!824487))

(assert (=> b!884395 m!824489))

(assert (=> b!884395 m!824487))

(assert (=> b!884393 m!824461))

(assert (=> b!884393 m!824461))

(assert (=> b!884393 m!824467))

(declare-fun m!824615 () Bool)

(assert (=> b!884389 m!824615))

(assert (=> bm!38986 m!824611))

(assert (=> b!884289 d!109209))

(declare-fun d!109211 () Bool)

(declare-fun e!492172 () Bool)

(assert (=> d!109211 e!492172))

(declare-fun res!600801 () Bool)

(assert (=> d!109211 (=> (not res!600801) (not e!492172))))

(declare-fun lt!400638 () ListLongMap!10577)

(assert (=> d!109211 (= res!600801 (contains!4278 lt!400638 (_1!5915 lt!400548)))))

(declare-fun lt!400636 () List!17616)

(assert (=> d!109211 (= lt!400638 (ListLongMap!10578 lt!400636))))

(declare-fun lt!400635 () Unit!30198)

(declare-fun lt!400637 () Unit!30198)

(assert (=> d!109211 (= lt!400635 lt!400637)))

(declare-datatypes ((Option!433 0))(
  ( (Some!432 (v!11379 V!28667)) (None!431) )
))
(declare-fun getValueByKey!427 (List!17616 (_ BitVec 64)) Option!433)

(assert (=> d!109211 (= (getValueByKey!427 lt!400636 (_1!5915 lt!400548)) (Some!432 (_2!5915 lt!400548)))))

(declare-fun lemmaContainsTupThenGetReturnValue!241 (List!17616 (_ BitVec 64) V!28667) Unit!30198)

(assert (=> d!109211 (= lt!400637 (lemmaContainsTupThenGetReturnValue!241 lt!400636 (_1!5915 lt!400548) (_2!5915 lt!400548)))))

(declare-fun insertStrictlySorted!280 (List!17616 (_ BitVec 64) V!28667) List!17616)

(assert (=> d!109211 (= lt!400636 (insertStrictlySorted!280 (toList!5304 lt!400546) (_1!5915 lt!400548) (_2!5915 lt!400548)))))

(assert (=> d!109211 (= (+!2573 lt!400546 lt!400548) lt!400638)))

(declare-fun b!884403 () Bool)

(declare-fun res!600802 () Bool)

(assert (=> b!884403 (=> (not res!600802) (not e!492172))))

(assert (=> b!884403 (= res!600802 (= (getValueByKey!427 (toList!5304 lt!400638) (_1!5915 lt!400548)) (Some!432 (_2!5915 lt!400548))))))

(declare-fun b!884404 () Bool)

(declare-fun contains!4279 (List!17616 tuple2!11808) Bool)

(assert (=> b!884404 (= e!492172 (contains!4279 (toList!5304 lt!400638) lt!400548))))

(assert (= (and d!109211 res!600801) b!884403))

(assert (= (and b!884403 res!600802) b!884404))

(declare-fun m!824617 () Bool)

(assert (=> d!109211 m!824617))

(declare-fun m!824619 () Bool)

(assert (=> d!109211 m!824619))

(declare-fun m!824621 () Bool)

(assert (=> d!109211 m!824621))

(declare-fun m!824623 () Bool)

(assert (=> d!109211 m!824623))

(declare-fun m!824625 () Bool)

(assert (=> b!884403 m!824625))

(declare-fun m!824627 () Bool)

(assert (=> b!884404 m!824627))

(assert (=> b!884284 d!109211))

(declare-fun d!109213 () Bool)

(declare-fun c!93134 () Bool)

(assert (=> d!109213 (= c!93134 ((_ is ValueCellFull!8418) (select (arr!24798 _values!688) from!1053)))))

(declare-fun e!492175 () V!28667)

(assert (=> d!109213 (= (get!13072 (select (arr!24798 _values!688) from!1053) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!492175)))

(declare-fun b!884409 () Bool)

(declare-fun get!13074 (ValueCell!8418 V!28667) V!28667)

(assert (=> b!884409 (= e!492175 (get!13074 (select (arr!24798 _values!688) from!1053) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884410 () Bool)

(declare-fun get!13075 (ValueCell!8418 V!28667) V!28667)

(assert (=> b!884410 (= e!492175 (get!13075 (select (arr!24798 _values!688) from!1053) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109213 c!93134) b!884409))

(assert (= (and d!109213 (not c!93134)) b!884410))

(assert (=> b!884409 m!824485))

(assert (=> b!884409 m!824487))

(declare-fun m!824629 () Bool)

(assert (=> b!884409 m!824629))

(assert (=> b!884410 m!824485))

(assert (=> b!884410 m!824487))

(declare-fun m!824631 () Bool)

(assert (=> b!884410 m!824631))

(assert (=> b!884284 d!109213))

(declare-fun d!109215 () Bool)

(assert (=> d!109215 (= (array_inv!19522 _keys!868) (bvsge (size!25237 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74952 d!109215))

(declare-fun d!109217 () Bool)

(assert (=> d!109217 (= (array_inv!19523 _values!688) (bvsge (size!25238 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74952 d!109217))

(declare-fun d!109219 () Bool)

(assert (=> d!109219 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!884290 d!109219))

(declare-fun d!109221 () Bool)

(assert (=> d!109221 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!884298 d!109221))

(declare-fun b!884419 () Bool)

(declare-fun e!492182 () Bool)

(declare-fun call!38992 () Bool)

(assert (=> b!884419 (= e!492182 call!38992)))

(declare-fun bm!38989 () Bool)

(assert (=> bm!38989 (= call!38992 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!109223 () Bool)

(declare-fun res!600808 () Bool)

(declare-fun e!492184 () Bool)

(assert (=> d!109223 (=> res!600808 e!492184)))

(assert (=> d!109223 (= res!600808 (bvsge #b00000000000000000000000000000000 (size!25237 _keys!868)))))

(assert (=> d!109223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!492184)))

(declare-fun b!884420 () Bool)

(declare-fun e!492183 () Bool)

(assert (=> b!884420 (= e!492183 e!492182)))

(declare-fun lt!400647 () (_ BitVec 64))

(assert (=> b!884420 (= lt!400647 (select (arr!24797 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!400646 () Unit!30198)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51556 (_ BitVec 64) (_ BitVec 32)) Unit!30198)

(assert (=> b!884420 (= lt!400646 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!400647 #b00000000000000000000000000000000))))

(assert (=> b!884420 (arrayContainsKey!0 _keys!868 lt!400647 #b00000000000000000000000000000000)))

(declare-fun lt!400645 () Unit!30198)

(assert (=> b!884420 (= lt!400645 lt!400646)))

(declare-fun res!600807 () Bool)

(declare-datatypes ((SeekEntryResult!8761 0))(
  ( (MissingZero!8761 (index!37415 (_ BitVec 32))) (Found!8761 (index!37416 (_ BitVec 32))) (Intermediate!8761 (undefined!9573 Bool) (index!37417 (_ BitVec 32)) (x!74976 (_ BitVec 32))) (Undefined!8761) (MissingVacant!8761 (index!37418 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51556 (_ BitVec 32)) SeekEntryResult!8761)

(assert (=> b!884420 (= res!600807 (= (seekEntryOrOpen!0 (select (arr!24797 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8761 #b00000000000000000000000000000000)))))

(assert (=> b!884420 (=> (not res!600807) (not e!492182))))

(declare-fun b!884421 () Bool)

(assert (=> b!884421 (= e!492183 call!38992)))

(declare-fun b!884422 () Bool)

(assert (=> b!884422 (= e!492184 e!492183)))

(declare-fun c!93137 () Bool)

(assert (=> b!884422 (= c!93137 (validKeyInArray!0 (select (arr!24797 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!109223 (not res!600808)) b!884422))

(assert (= (and b!884422 c!93137) b!884420))

(assert (= (and b!884422 (not c!93137)) b!884421))

(assert (= (and b!884420 res!600807) b!884419))

(assert (= (or b!884419 b!884421) bm!38989))

(declare-fun m!824633 () Bool)

(assert (=> bm!38989 m!824633))

(declare-fun m!824635 () Bool)

(assert (=> b!884420 m!824635))

(declare-fun m!824637 () Bool)

(assert (=> b!884420 m!824637))

(declare-fun m!824639 () Bool)

(assert (=> b!884420 m!824639))

(assert (=> b!884420 m!824635))

(declare-fun m!824641 () Bool)

(assert (=> b!884420 m!824641))

(assert (=> b!884422 m!824635))

(assert (=> b!884422 m!824635))

(declare-fun m!824643 () Bool)

(assert (=> b!884422 m!824643))

(assert (=> b!884291 d!109223))

(declare-fun bm!38992 () Bool)

(declare-fun call!38995 () Bool)

(declare-fun c!93140 () Bool)

(assert (=> bm!38992 (= call!38995 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93140 (Cons!17611 (select (arr!24797 _keys!868) #b00000000000000000000000000000000) Nil!17612) Nil!17612)))))

(declare-fun b!884433 () Bool)

(declare-fun e!492194 () Bool)

(assert (=> b!884433 (= e!492194 call!38995)))

(declare-fun b!884434 () Bool)

(declare-fun e!492196 () Bool)

(declare-fun contains!4280 (List!17615 (_ BitVec 64)) Bool)

(assert (=> b!884434 (= e!492196 (contains!4280 Nil!17612 (select (arr!24797 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!884435 () Bool)

(declare-fun e!492195 () Bool)

(declare-fun e!492193 () Bool)

(assert (=> b!884435 (= e!492195 e!492193)))

(declare-fun res!600815 () Bool)

(assert (=> b!884435 (=> (not res!600815) (not e!492193))))

(assert (=> b!884435 (= res!600815 (not e!492196))))

(declare-fun res!600817 () Bool)

(assert (=> b!884435 (=> (not res!600817) (not e!492196))))

(assert (=> b!884435 (= res!600817 (validKeyInArray!0 (select (arr!24797 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!109225 () Bool)

(declare-fun res!600816 () Bool)

(assert (=> d!109225 (=> res!600816 e!492195)))

(assert (=> d!109225 (= res!600816 (bvsge #b00000000000000000000000000000000 (size!25237 _keys!868)))))

(assert (=> d!109225 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17612) e!492195)))

(declare-fun b!884436 () Bool)

(assert (=> b!884436 (= e!492194 call!38995)))

(declare-fun b!884437 () Bool)

(assert (=> b!884437 (= e!492193 e!492194)))

(assert (=> b!884437 (= c!93140 (validKeyInArray!0 (select (arr!24797 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!109225 (not res!600816)) b!884435))

(assert (= (and b!884435 res!600817) b!884434))

(assert (= (and b!884435 res!600815) b!884437))

(assert (= (and b!884437 c!93140) b!884433))

(assert (= (and b!884437 (not c!93140)) b!884436))

(assert (= (or b!884433 b!884436) bm!38992))

(assert (=> bm!38992 m!824635))

(declare-fun m!824645 () Bool)

(assert (=> bm!38992 m!824645))

(assert (=> b!884434 m!824635))

(assert (=> b!884434 m!824635))

(declare-fun m!824647 () Bool)

(assert (=> b!884434 m!824647))

(assert (=> b!884435 m!824635))

(assert (=> b!884435 m!824635))

(assert (=> b!884435 m!824643))

(assert (=> b!884437 m!824635))

(assert (=> b!884437 m!824635))

(assert (=> b!884437 m!824643))

(assert (=> b!884287 d!109225))

(declare-fun d!109227 () Bool)

(assert (=> d!109227 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17612)))

(declare-fun lt!400650 () Unit!30198)

(declare-fun choose!39 (array!51556 (_ BitVec 32) (_ BitVec 32)) Unit!30198)

(assert (=> d!109227 (= lt!400650 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109227 (bvslt (size!25237 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109227 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!400650)))

(declare-fun bs!24782 () Bool)

(assert (= bs!24782 d!109227))

(assert (=> bs!24782 m!824495))

(declare-fun m!824649 () Bool)

(assert (=> bs!24782 m!824649))

(assert (=> b!884283 d!109227))

(declare-fun d!109229 () Bool)

(assert (=> d!109229 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400653 () Unit!30198)

(declare-fun choose!114 (array!51556 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30198)

(assert (=> d!109229 (= lt!400653 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!109229 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!109229 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!400653)))

(declare-fun bs!24783 () Bool)

(assert (= bs!24783 d!109229))

(assert (=> bs!24783 m!824503))

(declare-fun m!824651 () Bool)

(assert (=> bs!24783 m!824651))

(assert (=> b!884283 d!109229))

(declare-fun d!109231 () Bool)

(assert (=> d!109231 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25237 _keys!868)) (not (= (select (arr!24797 _keys!868) from!1053) k0!854)))))

(declare-fun lt!400656 () Unit!30198)

(declare-fun choose!21 (array!51556 (_ BitVec 64) (_ BitVec 32) List!17615) Unit!30198)

(assert (=> d!109231 (= lt!400656 (choose!21 _keys!868 k0!854 from!1053 Nil!17612))))

(assert (=> d!109231 (bvslt (size!25237 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109231 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17612) lt!400656)))

(declare-fun bs!24784 () Bool)

(assert (= bs!24784 d!109231))

(assert (=> bs!24784 m!824461))

(declare-fun m!824653 () Bool)

(assert (=> bs!24784 m!824653))

(assert (=> b!884283 d!109231))

(declare-fun d!109233 () Bool)

(declare-fun res!600822 () Bool)

(declare-fun e!492201 () Bool)

(assert (=> d!109233 (=> res!600822 e!492201)))

(assert (=> d!109233 (= res!600822 (= (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!109233 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!492201)))

(declare-fun b!884442 () Bool)

(declare-fun e!492202 () Bool)

(assert (=> b!884442 (= e!492201 e!492202)))

(declare-fun res!600823 () Bool)

(assert (=> b!884442 (=> (not res!600823) (not e!492202))))

(assert (=> b!884442 (= res!600823 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25237 _keys!868)))))

(declare-fun b!884443 () Bool)

(assert (=> b!884443 (= e!492202 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!109233 (not res!600822)) b!884442))

(assert (= (and b!884442 res!600823) b!884443))

(declare-fun m!824655 () Bool)

(assert (=> d!109233 m!824655))

(declare-fun m!824657 () Bool)

(assert (=> b!884443 m!824657))

(assert (=> b!884283 d!109233))

(declare-fun bm!38993 () Bool)

(declare-fun call!38996 () Bool)

(declare-fun c!93141 () Bool)

(assert (=> bm!38993 (= call!38996 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!93141 (Cons!17611 (select (arr!24797 _keys!868) from!1053) Nil!17612) Nil!17612)))))

(declare-fun b!884444 () Bool)

(declare-fun e!492204 () Bool)

(assert (=> b!884444 (= e!492204 call!38996)))

(declare-fun b!884445 () Bool)

(declare-fun e!492206 () Bool)

(assert (=> b!884445 (= e!492206 (contains!4280 Nil!17612 (select (arr!24797 _keys!868) from!1053)))))

(declare-fun b!884446 () Bool)

(declare-fun e!492205 () Bool)

(declare-fun e!492203 () Bool)

(assert (=> b!884446 (= e!492205 e!492203)))

(declare-fun res!600824 () Bool)

(assert (=> b!884446 (=> (not res!600824) (not e!492203))))

(assert (=> b!884446 (= res!600824 (not e!492206))))

(declare-fun res!600826 () Bool)

(assert (=> b!884446 (=> (not res!600826) (not e!492206))))

(assert (=> b!884446 (= res!600826 (validKeyInArray!0 (select (arr!24797 _keys!868) from!1053)))))

(declare-fun d!109235 () Bool)

(declare-fun res!600825 () Bool)

(assert (=> d!109235 (=> res!600825 e!492205)))

(assert (=> d!109235 (= res!600825 (bvsge from!1053 (size!25237 _keys!868)))))

(assert (=> d!109235 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17612) e!492205)))

(declare-fun b!884447 () Bool)

(assert (=> b!884447 (= e!492204 call!38996)))

(declare-fun b!884448 () Bool)

(assert (=> b!884448 (= e!492203 e!492204)))

(assert (=> b!884448 (= c!93141 (validKeyInArray!0 (select (arr!24797 _keys!868) from!1053)))))

(assert (= (and d!109235 (not res!600825)) b!884446))

(assert (= (and b!884446 res!600826) b!884445))

(assert (= (and b!884446 res!600824) b!884448))

(assert (= (and b!884448 c!93141) b!884444))

(assert (= (and b!884448 (not c!93141)) b!884447))

(assert (= (or b!884444 b!884447) bm!38993))

(assert (=> bm!38993 m!824461))

(declare-fun m!824659 () Bool)

(assert (=> bm!38993 m!824659))

(assert (=> b!884445 m!824461))

(assert (=> b!884445 m!824461))

(declare-fun m!824661 () Bool)

(assert (=> b!884445 m!824661))

(assert (=> b!884446 m!824461))

(assert (=> b!884446 m!824461))

(assert (=> b!884446 m!824467))

(assert (=> b!884448 m!824461))

(assert (=> b!884448 m!824461))

(assert (=> b!884448 m!824467))

(assert (=> b!884283 d!109235))

(declare-fun b!884449 () Bool)

(declare-fun e!492207 () Bool)

(declare-fun e!492212 () Bool)

(assert (=> b!884449 (= e!492207 e!492212)))

(assert (=> b!884449 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25237 _keys!868)))))

(declare-fun res!600827 () Bool)

(declare-fun lt!400663 () ListLongMap!10577)

(assert (=> b!884449 (= res!600827 (contains!4278 lt!400663 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884449 (=> (not res!600827) (not e!492212))))

(declare-fun b!884450 () Bool)

(declare-fun e!492213 () ListLongMap!10577)

(assert (=> b!884450 (= e!492213 (ListLongMap!10578 Nil!17613))))

(declare-fun d!109237 () Bool)

(declare-fun e!492210 () Bool)

(assert (=> d!109237 e!492210))

(declare-fun res!600828 () Bool)

(assert (=> d!109237 (=> (not res!600828) (not e!492210))))

(assert (=> d!109237 (= res!600828 (not (contains!4278 lt!400663 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109237 (= lt!400663 e!492213)))

(declare-fun c!93144 () Bool)

(assert (=> d!109237 (= c!93144 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25237 _keys!868)))))

(assert (=> d!109237 (validMask!0 mask!1196)))

(assert (=> d!109237 (= (getCurrentListMapNoExtraKeys!3263 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400663)))

(declare-fun b!884451 () Bool)

(declare-fun e!492211 () Bool)

(assert (=> b!884451 (= e!492211 (isEmpty!672 lt!400663))))

(declare-fun b!884452 () Bool)

(declare-fun lt!400658 () Unit!30198)

(declare-fun lt!400657 () Unit!30198)

(assert (=> b!884452 (= lt!400658 lt!400657)))

(declare-fun lt!400660 () (_ BitVec 64))

(declare-fun lt!400659 () V!28667)

(declare-fun lt!400661 () ListLongMap!10577)

(declare-fun lt!400662 () (_ BitVec 64))

(assert (=> b!884452 (not (contains!4278 (+!2573 lt!400661 (tuple2!11809 lt!400662 lt!400659)) lt!400660))))

(assert (=> b!884452 (= lt!400657 (addStillNotContains!210 lt!400661 lt!400662 lt!400659 lt!400660))))

(assert (=> b!884452 (= lt!400660 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884452 (= lt!400659 (get!13072 (select (arr!24798 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884452 (= lt!400662 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38997 () ListLongMap!10577)

(assert (=> b!884452 (= lt!400661 call!38997)))

(declare-fun e!492208 () ListLongMap!10577)

(assert (=> b!884452 (= e!492208 (+!2573 call!38997 (tuple2!11809 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13072 (select (arr!24798 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884453 () Bool)

(assert (=> b!884453 (= e!492210 e!492207)))

(declare-fun c!93142 () Bool)

(declare-fun e!492209 () Bool)

(assert (=> b!884453 (= c!93142 e!492209)))

(declare-fun res!600830 () Bool)

(assert (=> b!884453 (=> (not res!600830) (not e!492209))))

(assert (=> b!884453 (= res!600830 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25237 _keys!868)))))

(declare-fun b!884454 () Bool)

(assert (=> b!884454 (= e!492213 e!492208)))

(declare-fun c!93143 () Bool)

(assert (=> b!884454 (= c!93143 (validKeyInArray!0 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!884455 () Bool)

(assert (=> b!884455 (= e!492209 (validKeyInArray!0 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884455 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!884456 () Bool)

(assert (=> b!884456 (= e!492208 call!38997)))

(declare-fun b!884457 () Bool)

(assert (=> b!884457 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25237 _keys!868)))))

(assert (=> b!884457 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25238 _values!688)))))

(assert (=> b!884457 (= e!492212 (= (apply!385 lt!400663 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13072 (select (arr!24798 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884458 () Bool)

(assert (=> b!884458 (= e!492211 (= lt!400663 (getCurrentListMapNoExtraKeys!3263 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884459 () Bool)

(assert (=> b!884459 (= e!492207 e!492211)))

(declare-fun c!93145 () Bool)

(assert (=> b!884459 (= c!93145 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25237 _keys!868)))))

(declare-fun bm!38994 () Bool)

(assert (=> bm!38994 (= call!38997 (getCurrentListMapNoExtraKeys!3263 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884460 () Bool)

(declare-fun res!600829 () Bool)

(assert (=> b!884460 (=> (not res!600829) (not e!492210))))

(assert (=> b!884460 (= res!600829 (not (contains!4278 lt!400663 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109237 c!93144) b!884450))

(assert (= (and d!109237 (not c!93144)) b!884454))

(assert (= (and b!884454 c!93143) b!884452))

(assert (= (and b!884454 (not c!93143)) b!884456))

(assert (= (or b!884452 b!884456) bm!38994))

(assert (= (and d!109237 res!600828) b!884460))

(assert (= (and b!884460 res!600829) b!884453))

(assert (= (and b!884453 res!600830) b!884455))

(assert (= (and b!884453 c!93142) b!884449))

(assert (= (and b!884453 (not c!93142)) b!884459))

(assert (= (and b!884449 res!600827) b!884457))

(assert (= (and b!884459 c!93145) b!884458))

(assert (= (and b!884459 (not c!93145)) b!884451))

(declare-fun b_lambda!12763 () Bool)

(assert (=> (not b_lambda!12763) (not b!884452)))

(assert (=> b!884452 t!24887))

(declare-fun b_and!25657 () Bool)

(assert (= b_and!25655 (and (=> t!24887 result!9893) b_and!25657)))

(declare-fun b_lambda!12765 () Bool)

(assert (=> (not b_lambda!12765) (not b!884457)))

(assert (=> b!884457 t!24887))

(declare-fun b_and!25659 () Bool)

(assert (= b_and!25657 (and (=> t!24887 result!9893) b_and!25659)))

(declare-fun m!824663 () Bool)

(assert (=> b!884452 m!824663))

(declare-fun m!824665 () Bool)

(assert (=> b!884452 m!824665))

(assert (=> b!884452 m!824655))

(declare-fun m!824667 () Bool)

(assert (=> b!884452 m!824667))

(declare-fun m!824669 () Bool)

(assert (=> b!884452 m!824669))

(assert (=> b!884452 m!824667))

(assert (=> b!884452 m!824663))

(assert (=> b!884452 m!824487))

(declare-fun m!824671 () Bool)

(assert (=> b!884452 m!824671))

(assert (=> b!884452 m!824487))

(declare-fun m!824673 () Bool)

(assert (=> b!884452 m!824673))

(declare-fun m!824675 () Bool)

(assert (=> b!884460 m!824675))

(assert (=> b!884454 m!824655))

(assert (=> b!884454 m!824655))

(declare-fun m!824677 () Bool)

(assert (=> b!884454 m!824677))

(declare-fun m!824679 () Bool)

(assert (=> d!109237 m!824679))

(assert (=> d!109237 m!824475))

(assert (=> b!884449 m!824655))

(assert (=> b!884449 m!824655))

(declare-fun m!824681 () Bool)

(assert (=> b!884449 m!824681))

(declare-fun m!824683 () Bool)

(assert (=> b!884458 m!824683))

(assert (=> b!884457 m!824663))

(assert (=> b!884457 m!824655))

(assert (=> b!884457 m!824655))

(declare-fun m!824685 () Bool)

(assert (=> b!884457 m!824685))

(assert (=> b!884457 m!824663))

(assert (=> b!884457 m!824487))

(assert (=> b!884457 m!824671))

(assert (=> b!884457 m!824487))

(assert (=> b!884455 m!824655))

(assert (=> b!884455 m!824655))

(assert (=> b!884455 m!824677))

(declare-fun m!824687 () Bool)

(assert (=> b!884451 m!824687))

(assert (=> bm!38994 m!824683))

(assert (=> b!884285 d!109237))

(declare-fun b!884461 () Bool)

(declare-fun e!492214 () Bool)

(declare-fun e!492219 () Bool)

(assert (=> b!884461 (= e!492214 e!492219)))

(assert (=> b!884461 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25237 _keys!868)))))

(declare-fun lt!400670 () ListLongMap!10577)

(declare-fun res!600831 () Bool)

(assert (=> b!884461 (= res!600831 (contains!4278 lt!400670 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884461 (=> (not res!600831) (not e!492219))))

(declare-fun b!884462 () Bool)

(declare-fun e!492220 () ListLongMap!10577)

(assert (=> b!884462 (= e!492220 (ListLongMap!10578 Nil!17613))))

(declare-fun d!109239 () Bool)

(declare-fun e!492217 () Bool)

(assert (=> d!109239 e!492217))

(declare-fun res!600832 () Bool)

(assert (=> d!109239 (=> (not res!600832) (not e!492217))))

(assert (=> d!109239 (= res!600832 (not (contains!4278 lt!400670 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109239 (= lt!400670 e!492220)))

(declare-fun c!93148 () Bool)

(assert (=> d!109239 (= c!93148 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25237 _keys!868)))))

(assert (=> d!109239 (validMask!0 mask!1196)))

(assert (=> d!109239 (= (getCurrentListMapNoExtraKeys!3263 _keys!868 lt!400550 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400670)))

(declare-fun b!884463 () Bool)

(declare-fun e!492218 () Bool)

(assert (=> b!884463 (= e!492218 (isEmpty!672 lt!400670))))

(declare-fun b!884464 () Bool)

(declare-fun lt!400665 () Unit!30198)

(declare-fun lt!400664 () Unit!30198)

(assert (=> b!884464 (= lt!400665 lt!400664)))

(declare-fun lt!400669 () (_ BitVec 64))

(declare-fun lt!400668 () ListLongMap!10577)

(declare-fun lt!400667 () (_ BitVec 64))

(declare-fun lt!400666 () V!28667)

(assert (=> b!884464 (not (contains!4278 (+!2573 lt!400668 (tuple2!11809 lt!400669 lt!400666)) lt!400667))))

(assert (=> b!884464 (= lt!400664 (addStillNotContains!210 lt!400668 lt!400669 lt!400666 lt!400667))))

(assert (=> b!884464 (= lt!400667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884464 (= lt!400666 (get!13072 (select (arr!24798 lt!400550) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884464 (= lt!400669 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38998 () ListLongMap!10577)

(assert (=> b!884464 (= lt!400668 call!38998)))

(declare-fun e!492215 () ListLongMap!10577)

(assert (=> b!884464 (= e!492215 (+!2573 call!38998 (tuple2!11809 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13072 (select (arr!24798 lt!400550) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884465 () Bool)

(assert (=> b!884465 (= e!492217 e!492214)))

(declare-fun c!93146 () Bool)

(declare-fun e!492216 () Bool)

(assert (=> b!884465 (= c!93146 e!492216)))

(declare-fun res!600834 () Bool)

(assert (=> b!884465 (=> (not res!600834) (not e!492216))))

(assert (=> b!884465 (= res!600834 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25237 _keys!868)))))

(declare-fun b!884466 () Bool)

(assert (=> b!884466 (= e!492220 e!492215)))

(declare-fun c!93147 () Bool)

(assert (=> b!884466 (= c!93147 (validKeyInArray!0 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!884467 () Bool)

(assert (=> b!884467 (= e!492216 (validKeyInArray!0 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884467 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!884468 () Bool)

(assert (=> b!884468 (= e!492215 call!38998)))

(declare-fun b!884469 () Bool)

(assert (=> b!884469 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25237 _keys!868)))))

(assert (=> b!884469 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25238 lt!400550)))))

(assert (=> b!884469 (= e!492219 (= (apply!385 lt!400670 (select (arr!24797 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13072 (select (arr!24798 lt!400550) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884470 () Bool)

(assert (=> b!884470 (= e!492218 (= lt!400670 (getCurrentListMapNoExtraKeys!3263 _keys!868 lt!400550 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884471 () Bool)

(assert (=> b!884471 (= e!492214 e!492218)))

(declare-fun c!93149 () Bool)

(assert (=> b!884471 (= c!93149 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25237 _keys!868)))))

(declare-fun bm!38995 () Bool)

(assert (=> bm!38995 (= call!38998 (getCurrentListMapNoExtraKeys!3263 _keys!868 lt!400550 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884472 () Bool)

(declare-fun res!600833 () Bool)

(assert (=> b!884472 (=> (not res!600833) (not e!492217))))

(assert (=> b!884472 (= res!600833 (not (contains!4278 lt!400670 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109239 c!93148) b!884462))

(assert (= (and d!109239 (not c!93148)) b!884466))

(assert (= (and b!884466 c!93147) b!884464))

(assert (= (and b!884466 (not c!93147)) b!884468))

(assert (= (or b!884464 b!884468) bm!38995))

(assert (= (and d!109239 res!600832) b!884472))

(assert (= (and b!884472 res!600833) b!884465))

(assert (= (and b!884465 res!600834) b!884467))

(assert (= (and b!884465 c!93146) b!884461))

(assert (= (and b!884465 (not c!93146)) b!884471))

(assert (= (and b!884461 res!600831) b!884469))

(assert (= (and b!884471 c!93149) b!884470))

(assert (= (and b!884471 (not c!93149)) b!884463))

(declare-fun b_lambda!12767 () Bool)

(assert (=> (not b_lambda!12767) (not b!884464)))

(assert (=> b!884464 t!24887))

(declare-fun b_and!25661 () Bool)

(assert (= b_and!25659 (and (=> t!24887 result!9893) b_and!25661)))

(declare-fun b_lambda!12769 () Bool)

(assert (=> (not b_lambda!12769) (not b!884469)))

(assert (=> b!884469 t!24887))

(declare-fun b_and!25663 () Bool)

(assert (= b_and!25661 (and (=> t!24887 result!9893) b_and!25663)))

(declare-fun m!824689 () Bool)

(assert (=> b!884464 m!824689))

(declare-fun m!824691 () Bool)

(assert (=> b!884464 m!824691))

(assert (=> b!884464 m!824655))

(declare-fun m!824693 () Bool)

(assert (=> b!884464 m!824693))

(declare-fun m!824695 () Bool)

(assert (=> b!884464 m!824695))

(assert (=> b!884464 m!824693))

(assert (=> b!884464 m!824689))

(assert (=> b!884464 m!824487))

(declare-fun m!824697 () Bool)

(assert (=> b!884464 m!824697))

(assert (=> b!884464 m!824487))

(declare-fun m!824699 () Bool)

(assert (=> b!884464 m!824699))

(declare-fun m!824701 () Bool)

(assert (=> b!884472 m!824701))

(assert (=> b!884466 m!824655))

(assert (=> b!884466 m!824655))

(assert (=> b!884466 m!824677))

(declare-fun m!824703 () Bool)

(assert (=> d!109239 m!824703))

(assert (=> d!109239 m!824475))

(assert (=> b!884461 m!824655))

(assert (=> b!884461 m!824655))

(declare-fun m!824705 () Bool)

(assert (=> b!884461 m!824705))

(declare-fun m!824707 () Bool)

(assert (=> b!884470 m!824707))

(assert (=> b!884469 m!824689))

(assert (=> b!884469 m!824655))

(assert (=> b!884469 m!824655))

(declare-fun m!824709 () Bool)

(assert (=> b!884469 m!824709))

(assert (=> b!884469 m!824689))

(assert (=> b!884469 m!824487))

(assert (=> b!884469 m!824697))

(assert (=> b!884469 m!824487))

(assert (=> b!884467 m!824655))

(assert (=> b!884467 m!824655))

(assert (=> b!884467 m!824677))

(declare-fun m!824711 () Bool)

(assert (=> b!884463 m!824711))

(assert (=> bm!38995 m!824707))

(assert (=> b!884285 d!109239))

(declare-fun d!109241 () Bool)

(assert (=> d!109241 (= (validKeyInArray!0 (select (arr!24797 _keys!868) from!1053)) (and (not (= (select (arr!24797 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24797 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!884285 d!109241))

(declare-fun b!884479 () Bool)

(declare-fun e!492225 () Bool)

(declare-fun call!39004 () ListLongMap!10577)

(declare-fun call!39003 () ListLongMap!10577)

(assert (=> b!884479 (= e!492225 (= call!39004 call!39003))))

(declare-fun b!884480 () Bool)

(declare-fun e!492226 () Bool)

(assert (=> b!884480 (= e!492226 e!492225)))

(declare-fun c!93152 () Bool)

(assert (=> b!884480 (= c!93152 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun d!109243 () Bool)

(assert (=> d!109243 e!492226))

(declare-fun res!600837 () Bool)

(assert (=> d!109243 (=> (not res!600837) (not e!492226))))

(assert (=> d!109243 (= res!600837 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25238 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25238 _values!688))))))))

(declare-fun lt!400673 () Unit!30198)

(declare-fun choose!1441 (array!51556 array!51558 (_ BitVec 32) (_ BitVec 32) V!28667 V!28667 (_ BitVec 32) (_ BitVec 64) V!28667 (_ BitVec 32) Int) Unit!30198)

(assert (=> d!109243 (= lt!400673 (choose!1441 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109243 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25237 _keys!868)))))

(assert (=> d!109243 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!756 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400673)))

(declare-fun bm!39000 () Bool)

(assert (=> bm!39000 (= call!39003 (getCurrentListMapNoExtraKeys!3263 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884481 () Bool)

(assert (=> b!884481 (= e!492225 (= call!39004 (+!2573 call!39003 (tuple2!11809 k0!854 v!557))))))

(declare-fun bm!39001 () Bool)

(assert (=> bm!39001 (= call!39004 (getCurrentListMapNoExtraKeys!3263 _keys!868 (array!51559 (store (arr!24798 _values!688) i!612 (ValueCellFull!8418 v!557)) (size!25238 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!109243 res!600837) b!884480))

(assert (= (and b!884480 c!93152) b!884481))

(assert (= (and b!884480 (not c!93152)) b!884479))

(assert (= (or b!884481 b!884479) bm!39000))

(assert (= (or b!884481 b!884479) bm!39001))

(declare-fun m!824713 () Bool)

(assert (=> d!109243 m!824713))

(assert (=> bm!39000 m!824465))

(declare-fun m!824715 () Bool)

(assert (=> b!884481 m!824715))

(assert (=> bm!39001 m!824507))

(declare-fun m!824717 () Bool)

(assert (=> bm!39001 m!824717))

(assert (=> b!884285 d!109243))

(declare-fun d!109245 () Bool)

(declare-fun e!492227 () Bool)

(assert (=> d!109245 e!492227))

(declare-fun res!600838 () Bool)

(assert (=> d!109245 (=> (not res!600838) (not e!492227))))

(declare-fun lt!400677 () ListLongMap!10577)

(assert (=> d!109245 (= res!600838 (contains!4278 lt!400677 (_1!5915 lt!400541)))))

(declare-fun lt!400675 () List!17616)

(assert (=> d!109245 (= lt!400677 (ListLongMap!10578 lt!400675))))

(declare-fun lt!400674 () Unit!30198)

(declare-fun lt!400676 () Unit!30198)

(assert (=> d!109245 (= lt!400674 lt!400676)))

(assert (=> d!109245 (= (getValueByKey!427 lt!400675 (_1!5915 lt!400541)) (Some!432 (_2!5915 lt!400541)))))

(assert (=> d!109245 (= lt!400676 (lemmaContainsTupThenGetReturnValue!241 lt!400675 (_1!5915 lt!400541) (_2!5915 lt!400541)))))

(assert (=> d!109245 (= lt!400675 (insertStrictlySorted!280 (toList!5304 lt!400538) (_1!5915 lt!400541) (_2!5915 lt!400541)))))

(assert (=> d!109245 (= (+!2573 lt!400538 lt!400541) lt!400677)))

(declare-fun b!884482 () Bool)

(declare-fun res!600839 () Bool)

(assert (=> b!884482 (=> (not res!600839) (not e!492227))))

(assert (=> b!884482 (= res!600839 (= (getValueByKey!427 (toList!5304 lt!400677) (_1!5915 lt!400541)) (Some!432 (_2!5915 lt!400541))))))

(declare-fun b!884483 () Bool)

(assert (=> b!884483 (= e!492227 (contains!4279 (toList!5304 lt!400677) lt!400541))))

(assert (= (and d!109245 res!600838) b!884482))

(assert (= (and b!884482 res!600839) b!884483))

(declare-fun m!824719 () Bool)

(assert (=> d!109245 m!824719))

(declare-fun m!824721 () Bool)

(assert (=> d!109245 m!824721))

(declare-fun m!824723 () Bool)

(assert (=> d!109245 m!824723))

(declare-fun m!824725 () Bool)

(assert (=> d!109245 m!824725))

(declare-fun m!824727 () Bool)

(assert (=> b!884482 m!824727))

(declare-fun m!824729 () Bool)

(assert (=> b!884483 m!824729))

(assert (=> b!884285 d!109245))

(declare-fun d!109247 () Bool)

(declare-fun e!492228 () Bool)

(assert (=> d!109247 e!492228))

(declare-fun res!600840 () Bool)

(assert (=> d!109247 (=> (not res!600840) (not e!492228))))

(declare-fun lt!400681 () ListLongMap!10577)

(assert (=> d!109247 (= res!600840 (contains!4278 lt!400681 (_1!5915 lt!400541)))))

(declare-fun lt!400679 () List!17616)

(assert (=> d!109247 (= lt!400681 (ListLongMap!10578 lt!400679))))

(declare-fun lt!400678 () Unit!30198)

(declare-fun lt!400680 () Unit!30198)

(assert (=> d!109247 (= lt!400678 lt!400680)))

(assert (=> d!109247 (= (getValueByKey!427 lt!400679 (_1!5915 lt!400541)) (Some!432 (_2!5915 lt!400541)))))

(assert (=> d!109247 (= lt!400680 (lemmaContainsTupThenGetReturnValue!241 lt!400679 (_1!5915 lt!400541) (_2!5915 lt!400541)))))

(assert (=> d!109247 (= lt!400679 (insertStrictlySorted!280 (toList!5304 lt!400549) (_1!5915 lt!400541) (_2!5915 lt!400541)))))

(assert (=> d!109247 (= (+!2573 lt!400549 lt!400541) lt!400681)))

(declare-fun b!884484 () Bool)

(declare-fun res!600841 () Bool)

(assert (=> b!884484 (=> (not res!600841) (not e!492228))))

(assert (=> b!884484 (= res!600841 (= (getValueByKey!427 (toList!5304 lt!400681) (_1!5915 lt!400541)) (Some!432 (_2!5915 lt!400541))))))

(declare-fun b!884485 () Bool)

(assert (=> b!884485 (= e!492228 (contains!4279 (toList!5304 lt!400681) lt!400541))))

(assert (= (and d!109247 res!600840) b!884484))

(assert (= (and b!884484 res!600841) b!884485))

(declare-fun m!824731 () Bool)

(assert (=> d!109247 m!824731))

(declare-fun m!824733 () Bool)

(assert (=> d!109247 m!824733))

(declare-fun m!824735 () Bool)

(assert (=> d!109247 m!824735))

(declare-fun m!824737 () Bool)

(assert (=> d!109247 m!824737))

(declare-fun m!824739 () Bool)

(assert (=> b!884484 m!824739))

(declare-fun m!824741 () Bool)

(assert (=> b!884485 m!824741))

(assert (=> b!884286 d!109247))

(declare-fun d!109249 () Bool)

(declare-fun e!492229 () Bool)

(assert (=> d!109249 e!492229))

(declare-fun res!600842 () Bool)

(assert (=> d!109249 (=> (not res!600842) (not e!492229))))

(declare-fun lt!400685 () ListLongMap!10577)

(assert (=> d!109249 (= res!600842 (contains!4278 lt!400685 (_1!5915 lt!400541)))))

(declare-fun lt!400683 () List!17616)

(assert (=> d!109249 (= lt!400685 (ListLongMap!10578 lt!400683))))

(declare-fun lt!400682 () Unit!30198)

(declare-fun lt!400684 () Unit!30198)

(assert (=> d!109249 (= lt!400682 lt!400684)))

(assert (=> d!109249 (= (getValueByKey!427 lt!400683 (_1!5915 lt!400541)) (Some!432 (_2!5915 lt!400541)))))

(assert (=> d!109249 (= lt!400684 (lemmaContainsTupThenGetReturnValue!241 lt!400683 (_1!5915 lt!400541) (_2!5915 lt!400541)))))

(assert (=> d!109249 (= lt!400683 (insertStrictlySorted!280 (toList!5304 (+!2573 lt!400538 lt!400548)) (_1!5915 lt!400541) (_2!5915 lt!400541)))))

(assert (=> d!109249 (= (+!2573 (+!2573 lt!400538 lt!400548) lt!400541) lt!400685)))

(declare-fun b!884486 () Bool)

(declare-fun res!600843 () Bool)

(assert (=> b!884486 (=> (not res!600843) (not e!492229))))

(assert (=> b!884486 (= res!600843 (= (getValueByKey!427 (toList!5304 lt!400685) (_1!5915 lt!400541)) (Some!432 (_2!5915 lt!400541))))))

(declare-fun b!884487 () Bool)

(assert (=> b!884487 (= e!492229 (contains!4279 (toList!5304 lt!400685) lt!400541))))

(assert (= (and d!109249 res!600842) b!884486))

(assert (= (and b!884486 res!600843) b!884487))

(declare-fun m!824743 () Bool)

(assert (=> d!109249 m!824743))

(declare-fun m!824745 () Bool)

(assert (=> d!109249 m!824745))

(declare-fun m!824747 () Bool)

(assert (=> d!109249 m!824747))

(declare-fun m!824749 () Bool)

(assert (=> d!109249 m!824749))

(declare-fun m!824751 () Bool)

(assert (=> b!884486 m!824751))

(declare-fun m!824753 () Bool)

(assert (=> b!884487 m!824753))

(assert (=> b!884286 d!109249))

(declare-fun d!109251 () Bool)

(declare-fun e!492230 () Bool)

(assert (=> d!109251 e!492230))

(declare-fun res!600844 () Bool)

(assert (=> d!109251 (=> (not res!600844) (not e!492230))))

(declare-fun lt!400689 () ListLongMap!10577)

(assert (=> d!109251 (= res!600844 (contains!4278 lt!400689 (_1!5915 lt!400548)))))

(declare-fun lt!400687 () List!17616)

(assert (=> d!109251 (= lt!400689 (ListLongMap!10578 lt!400687))))

(declare-fun lt!400686 () Unit!30198)

(declare-fun lt!400688 () Unit!30198)

(assert (=> d!109251 (= lt!400686 lt!400688)))

(assert (=> d!109251 (= (getValueByKey!427 lt!400687 (_1!5915 lt!400548)) (Some!432 (_2!5915 lt!400548)))))

(assert (=> d!109251 (= lt!400688 (lemmaContainsTupThenGetReturnValue!241 lt!400687 (_1!5915 lt!400548) (_2!5915 lt!400548)))))

(assert (=> d!109251 (= lt!400687 (insertStrictlySorted!280 (toList!5304 lt!400538) (_1!5915 lt!400548) (_2!5915 lt!400548)))))

(assert (=> d!109251 (= (+!2573 lt!400538 lt!400548) lt!400689)))

(declare-fun b!884488 () Bool)

(declare-fun res!600845 () Bool)

(assert (=> b!884488 (=> (not res!600845) (not e!492230))))

(assert (=> b!884488 (= res!600845 (= (getValueByKey!427 (toList!5304 lt!400689) (_1!5915 lt!400548)) (Some!432 (_2!5915 lt!400548))))))

(declare-fun b!884489 () Bool)

(assert (=> b!884489 (= e!492230 (contains!4279 (toList!5304 lt!400689) lt!400548))))

(assert (= (and d!109251 res!600844) b!884488))

(assert (= (and b!884488 res!600845) b!884489))

(declare-fun m!824755 () Bool)

(assert (=> d!109251 m!824755))

(declare-fun m!824757 () Bool)

(assert (=> d!109251 m!824757))

(declare-fun m!824759 () Bool)

(assert (=> d!109251 m!824759))

(declare-fun m!824761 () Bool)

(assert (=> d!109251 m!824761))

(declare-fun m!824763 () Bool)

(assert (=> b!884488 m!824763))

(declare-fun m!824765 () Bool)

(assert (=> b!884489 m!824765))

(assert (=> b!884286 d!109251))

(declare-fun d!109253 () Bool)

(assert (=> d!109253 (= (+!2573 (+!2573 lt!400538 (tuple2!11809 k0!854 v!557)) (tuple2!11809 (select (arr!24797 _keys!868) from!1053) lt!400542)) (+!2573 (+!2573 lt!400538 (tuple2!11809 (select (arr!24797 _keys!868) from!1053) lt!400542)) (tuple2!11809 k0!854 v!557)))))

(declare-fun lt!400692 () Unit!30198)

(declare-fun choose!1442 (ListLongMap!10577 (_ BitVec 64) V!28667 (_ BitVec 64) V!28667) Unit!30198)

(assert (=> d!109253 (= lt!400692 (choose!1442 lt!400538 k0!854 v!557 (select (arr!24797 _keys!868) from!1053) lt!400542))))

(assert (=> d!109253 (not (= k0!854 (select (arr!24797 _keys!868) from!1053)))))

(assert (=> d!109253 (= (addCommutativeForDiffKeys!556 lt!400538 k0!854 v!557 (select (arr!24797 _keys!868) from!1053) lt!400542) lt!400692)))

(declare-fun bs!24785 () Bool)

(assert (= bs!24785 d!109253))

(declare-fun m!824767 () Bool)

(assert (=> bs!24785 m!824767))

(declare-fun m!824769 () Bool)

(assert (=> bs!24785 m!824769))

(declare-fun m!824771 () Bool)

(assert (=> bs!24785 m!824771))

(declare-fun m!824773 () Bool)

(assert (=> bs!24785 m!824773))

(assert (=> bs!24785 m!824771))

(assert (=> bs!24785 m!824767))

(assert (=> bs!24785 m!824461))

(declare-fun m!824775 () Bool)

(assert (=> bs!24785 m!824775))

(assert (=> b!884286 d!109253))

(declare-fun mapIsEmpty!28215 () Bool)

(declare-fun mapRes!28215 () Bool)

(assert (=> mapIsEmpty!28215 mapRes!28215))

(declare-fun mapNonEmpty!28215 () Bool)

(declare-fun tp!54125 () Bool)

(declare-fun e!492236 () Bool)

(assert (=> mapNonEmpty!28215 (= mapRes!28215 (and tp!54125 e!492236))))

(declare-fun mapValue!28215 () ValueCell!8418)

(declare-fun mapRest!28215 () (Array (_ BitVec 32) ValueCell!8418))

(declare-fun mapKey!28215 () (_ BitVec 32))

(assert (=> mapNonEmpty!28215 (= mapRest!28209 (store mapRest!28215 mapKey!28215 mapValue!28215))))

(declare-fun b!884496 () Bool)

(assert (=> b!884496 (= e!492236 tp_is_empty!17715)))

(declare-fun condMapEmpty!28215 () Bool)

(declare-fun mapDefault!28215 () ValueCell!8418)

(assert (=> mapNonEmpty!28209 (= condMapEmpty!28215 (= mapRest!28209 ((as const (Array (_ BitVec 32) ValueCell!8418)) mapDefault!28215)))))

(declare-fun e!492235 () Bool)

(assert (=> mapNonEmpty!28209 (= tp!54115 (and e!492235 mapRes!28215))))

(declare-fun b!884497 () Bool)

(assert (=> b!884497 (= e!492235 tp_is_empty!17715)))

(assert (= (and mapNonEmpty!28209 condMapEmpty!28215) mapIsEmpty!28215))

(assert (= (and mapNonEmpty!28209 (not condMapEmpty!28215)) mapNonEmpty!28215))

(assert (= (and mapNonEmpty!28215 ((_ is ValueCellFull!8418) mapValue!28215)) b!884496))

(assert (= (and mapNonEmpty!28209 ((_ is ValueCellFull!8418) mapDefault!28215)) b!884497))

(declare-fun m!824777 () Bool)

(assert (=> mapNonEmpty!28215 m!824777))

(declare-fun b_lambda!12771 () Bool)

(assert (= b_lambda!12763 (or (and start!74952 b_free!15471) b_lambda!12771)))

(declare-fun b_lambda!12773 () Bool)

(assert (= b_lambda!12755 (or (and start!74952 b_free!15471) b_lambda!12773)))

(declare-fun b_lambda!12775 () Bool)

(assert (= b_lambda!12761 (or (and start!74952 b_free!15471) b_lambda!12775)))

(declare-fun b_lambda!12777 () Bool)

(assert (= b_lambda!12769 (or (and start!74952 b_free!15471) b_lambda!12777)))

(declare-fun b_lambda!12779 () Bool)

(assert (= b_lambda!12757 (or (and start!74952 b_free!15471) b_lambda!12779)))

(declare-fun b_lambda!12781 () Bool)

(assert (= b_lambda!12767 (or (and start!74952 b_free!15471) b_lambda!12781)))

(declare-fun b_lambda!12783 () Bool)

(assert (= b_lambda!12759 (or (and start!74952 b_free!15471) b_lambda!12783)))

(declare-fun b_lambda!12785 () Bool)

(assert (= b_lambda!12765 (or (and start!74952 b_free!15471) b_lambda!12785)))

(check-sat (not b!884378) (not bm!39000) (not b!884472) (not bm!38994) (not b_lambda!12783) (not b!884434) (not bm!38989) (not b!884377) (not b!884458) (not b!884469) (not b_lambda!12781) (not b!884485) (not b_next!15471) (not b!884392) (not b_lambda!12775) (not b!884488) (not d!109237) (not mapNonEmpty!28215) (not b!884380) (not b!884460) (not b!884393) (not bm!38992) (not b!884457) (not b!884455) (not d!109229) (not b!884437) (not b!884435) (not b_lambda!12777) (not bm!38993) (not b!884464) (not b_lambda!12785) (not b!884420) (not d!109211) (not d!109253) (not b!884448) tp_is_empty!17715 (not b!884404) (not b!884470) (not b!884383) (not b!884398) (not b!884484) (not b!884384) (not b!884452) (not b!884422) (not d!109231) (not b!884481) (not b!884454) (not bm!38985) (not d!109247) (not d!109251) (not b!884463) (not d!109209) (not b!884461) (not b!884487) (not b!884482) (not bm!39001) (not b!884410) (not b!884386) (not bm!38986) (not d!109239) (not d!109245) (not d!109227) (not b!884483) (not b!884403) (not b!884489) (not b!884390) (not b_lambda!12753) (not d!109207) (not b!884486) b_and!25663 (not b!884387) (not d!109243) (not b_lambda!12779) (not b!884396) (not bm!38995) (not b_lambda!12771) (not b!884389) (not b!884446) (not d!109249) (not b_lambda!12773) (not b!884409) (not b!884445) (not b!884375) (not b!884467) (not b!884443) (not b!884451) (not b!884395) (not b!884449) (not b!884381) (not b!884466))
(check-sat b_and!25663 (not b_next!15471))
