; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78234 () Bool)

(assert start!78234)

(declare-fun b_free!16725 () Bool)

(declare-fun b_next!16725 () Bool)

(assert (=> start!78234 (= b_free!16725 (not b_next!16725))))

(declare-fun tp!58452 () Bool)

(declare-fun b_and!27301 () Bool)

(assert (=> start!78234 (= tp!58452 b_and!27301)))

(declare-fun b!913133 () Bool)

(declare-fun res!615984 () Bool)

(declare-fun e!512175 () Bool)

(assert (=> b!913133 (=> (not res!615984) (not e!512175))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913133 (= res!615984 (inRange!0 i!717 mask!1756))))

(declare-fun b!913134 () Bool)

(declare-fun res!615989 () Bool)

(assert (=> b!913134 (=> (not res!615989) (not e!512175))))

(declare-datatypes ((array!54276 0))(
  ( (array!54277 (arr!26092 (Array (_ BitVec 32) (_ BitVec 64))) (size!26551 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54276)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!913134 (= res!615989 (and (= (select (arr!26092 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913135 () Bool)

(declare-fun e!512174 () Bool)

(declare-fun tp_is_empty!19143 () Bool)

(assert (=> b!913135 (= e!512174 tp_is_empty!19143)))

(declare-fun b!913136 () Bool)

(assert (=> b!913136 (= e!512175 (not (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26551 _keys!1386)))))))

(declare-fun arrayContainsKey!0 (array!54276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913136 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!30489 0))(
  ( (V!30490 (val!9622 Int)) )
))
(declare-datatypes ((ValueCell!9090 0))(
  ( (ValueCellFull!9090 (v!12133 V!30489)) (EmptyCell!9090) )
))
(declare-datatypes ((array!54278 0))(
  ( (array!54279 (arr!26093 (Array (_ BitVec 32) ValueCell!9090)) (size!26552 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54278)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30489)

(declare-datatypes ((Unit!30910 0))(
  ( (Unit!30911) )
))
(declare-fun lt!410738 () Unit!30910)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30489)

(declare-fun lemmaKeyInListMapIsInArray!280 (array!54276 array!54278 (_ BitVec 32) (_ BitVec 32) V!30489 V!30489 (_ BitVec 64) Int) Unit!30910)

(assert (=> b!913136 (= lt!410738 (lemmaKeyInListMapIsInArray!280 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913137 () Bool)

(declare-fun e!512176 () Bool)

(assert (=> b!913137 (= e!512176 tp_is_empty!19143)))

(declare-fun b!913138 () Bool)

(declare-fun res!615990 () Bool)

(assert (=> b!913138 (=> (not res!615990) (not e!512175))))

(assert (=> b!913138 (= res!615990 (and (= (size!26552 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26551 _keys!1386) (size!26552 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!615988 () Bool)

(assert (=> start!78234 (=> (not res!615988) (not e!512175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78234 (= res!615988 (validMask!0 mask!1756))))

(assert (=> start!78234 e!512175))

(declare-fun e!512178 () Bool)

(declare-fun array_inv!20380 (array!54278) Bool)

(assert (=> start!78234 (and (array_inv!20380 _values!1152) e!512178)))

(assert (=> start!78234 tp!58452))

(assert (=> start!78234 true))

(assert (=> start!78234 tp_is_empty!19143))

(declare-fun array_inv!20381 (array!54276) Bool)

(assert (=> start!78234 (array_inv!20381 _keys!1386)))

(declare-fun mapIsEmpty!30442 () Bool)

(declare-fun mapRes!30442 () Bool)

(assert (=> mapIsEmpty!30442 mapRes!30442))

(declare-fun b!913139 () Bool)

(declare-fun res!615987 () Bool)

(assert (=> b!913139 (=> (not res!615987) (not e!512175))))

(declare-datatypes ((List!18328 0))(
  ( (Nil!18325) (Cons!18324 (h!19470 (_ BitVec 64)) (t!25917 List!18328)) )
))
(declare-fun arrayNoDuplicates!0 (array!54276 (_ BitVec 32) List!18328) Bool)

(assert (=> b!913139 (= res!615987 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18325))))

(declare-fun b!913140 () Bool)

(declare-fun res!615985 () Bool)

(assert (=> b!913140 (=> (not res!615985) (not e!512175))))

(declare-datatypes ((tuple2!12540 0))(
  ( (tuple2!12541 (_1!6281 (_ BitVec 64)) (_2!6281 V!30489)) )
))
(declare-datatypes ((List!18329 0))(
  ( (Nil!18326) (Cons!18325 (h!19471 tuple2!12540) (t!25918 List!18329)) )
))
(declare-datatypes ((ListLongMap!11237 0))(
  ( (ListLongMap!11238 (toList!5634 List!18329)) )
))
(declare-fun contains!4680 (ListLongMap!11237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2896 (array!54276 array!54278 (_ BitVec 32) (_ BitVec 32) V!30489 V!30489 (_ BitVec 32) Int) ListLongMap!11237)

(assert (=> b!913140 (= res!615985 (contains!4680 (getCurrentListMap!2896 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30442 () Bool)

(declare-fun tp!58451 () Bool)

(assert (=> mapNonEmpty!30442 (= mapRes!30442 (and tp!58451 e!512174))))

(declare-fun mapRest!30442 () (Array (_ BitVec 32) ValueCell!9090))

(declare-fun mapValue!30442 () ValueCell!9090)

(declare-fun mapKey!30442 () (_ BitVec 32))

(assert (=> mapNonEmpty!30442 (= (arr!26093 _values!1152) (store mapRest!30442 mapKey!30442 mapValue!30442))))

(declare-fun b!913141 () Bool)

(assert (=> b!913141 (= e!512178 (and e!512176 mapRes!30442))))

(declare-fun condMapEmpty!30442 () Bool)

(declare-fun mapDefault!30442 () ValueCell!9090)

(assert (=> b!913141 (= condMapEmpty!30442 (= (arr!26093 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9090)) mapDefault!30442)))))

(declare-fun b!913142 () Bool)

(declare-fun res!615986 () Bool)

(assert (=> b!913142 (=> (not res!615986) (not e!512175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54276 (_ BitVec 32)) Bool)

(assert (=> b!913142 (= res!615986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78234 res!615988) b!913138))

(assert (= (and b!913138 res!615990) b!913142))

(assert (= (and b!913142 res!615986) b!913139))

(assert (= (and b!913139 res!615987) b!913140))

(assert (= (and b!913140 res!615985) b!913133))

(assert (= (and b!913133 res!615984) b!913134))

(assert (= (and b!913134 res!615989) b!913136))

(assert (= (and b!913141 condMapEmpty!30442) mapIsEmpty!30442))

(assert (= (and b!913141 (not condMapEmpty!30442)) mapNonEmpty!30442))

(get-info :version)

(assert (= (and mapNonEmpty!30442 ((_ is ValueCellFull!9090) mapValue!30442)) b!913135))

(assert (= (and b!913141 ((_ is ValueCellFull!9090) mapDefault!30442)) b!913137))

(assert (= start!78234 b!913141))

(declare-fun m!847499 () Bool)

(assert (=> b!913134 m!847499))

(declare-fun m!847501 () Bool)

(assert (=> mapNonEmpty!30442 m!847501))

(declare-fun m!847503 () Bool)

(assert (=> b!913140 m!847503))

(assert (=> b!913140 m!847503))

(declare-fun m!847505 () Bool)

(assert (=> b!913140 m!847505))

(declare-fun m!847507 () Bool)

(assert (=> start!78234 m!847507))

(declare-fun m!847509 () Bool)

(assert (=> start!78234 m!847509))

(declare-fun m!847511 () Bool)

(assert (=> start!78234 m!847511))

(declare-fun m!847513 () Bool)

(assert (=> b!913139 m!847513))

(declare-fun m!847515 () Bool)

(assert (=> b!913133 m!847515))

(declare-fun m!847517 () Bool)

(assert (=> b!913142 m!847517))

(declare-fun m!847519 () Bool)

(assert (=> b!913136 m!847519))

(declare-fun m!847521 () Bool)

(assert (=> b!913136 m!847521))

(check-sat (not b!913140) (not start!78234) (not b!913139) (not mapNonEmpty!30442) (not b!913142) (not b_next!16725) tp_is_empty!19143 (not b!913133) b_and!27301 (not b!913136))
(check-sat b_and!27301 (not b_next!16725))
(get-model)

(declare-fun b!913183 () Bool)

(declare-fun e!512205 () Bool)

(declare-fun contains!4682 (List!18328 (_ BitVec 64)) Bool)

(assert (=> b!913183 (= e!512205 (contains!4682 Nil!18325 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112315 () Bool)

(declare-fun res!616019 () Bool)

(declare-fun e!512203 () Bool)

(assert (=> d!112315 (=> res!616019 e!512203)))

(assert (=> d!112315 (= res!616019 (bvsge #b00000000000000000000000000000000 (size!26551 _keys!1386)))))

(assert (=> d!112315 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18325) e!512203)))

(declare-fun b!913184 () Bool)

(declare-fun e!512204 () Bool)

(declare-fun e!512202 () Bool)

(assert (=> b!913184 (= e!512204 e!512202)))

(declare-fun c!95802 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!913184 (= c!95802 (validKeyInArray!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913185 () Bool)

(declare-fun call!40397 () Bool)

(assert (=> b!913185 (= e!512202 call!40397)))

(declare-fun bm!40394 () Bool)

(assert (=> bm!40394 (= call!40397 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95802 (Cons!18324 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000) Nil!18325) Nil!18325)))))

(declare-fun b!913186 () Bool)

(assert (=> b!913186 (= e!512202 call!40397)))

(declare-fun b!913187 () Bool)

(assert (=> b!913187 (= e!512203 e!512204)))

(declare-fun res!616020 () Bool)

(assert (=> b!913187 (=> (not res!616020) (not e!512204))))

(assert (=> b!913187 (= res!616020 (not e!512205))))

(declare-fun res!616018 () Bool)

(assert (=> b!913187 (=> (not res!616018) (not e!512205))))

(assert (=> b!913187 (= res!616018 (validKeyInArray!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112315 (not res!616019)) b!913187))

(assert (= (and b!913187 res!616018) b!913183))

(assert (= (and b!913187 res!616020) b!913184))

(assert (= (and b!913184 c!95802) b!913186))

(assert (= (and b!913184 (not c!95802)) b!913185))

(assert (= (or b!913186 b!913185) bm!40394))

(declare-fun m!847547 () Bool)

(assert (=> b!913183 m!847547))

(assert (=> b!913183 m!847547))

(declare-fun m!847549 () Bool)

(assert (=> b!913183 m!847549))

(assert (=> b!913184 m!847547))

(assert (=> b!913184 m!847547))

(declare-fun m!847551 () Bool)

(assert (=> b!913184 m!847551))

(assert (=> bm!40394 m!847547))

(declare-fun m!847553 () Bool)

(assert (=> bm!40394 m!847553))

(assert (=> b!913187 m!847547))

(assert (=> b!913187 m!847547))

(assert (=> b!913187 m!847551))

(assert (=> b!913139 d!112315))

(declare-fun d!112317 () Bool)

(assert (=> d!112317 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78234 d!112317))

(declare-fun d!112319 () Bool)

(assert (=> d!112319 (= (array_inv!20380 _values!1152) (bvsge (size!26552 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78234 d!112319))

(declare-fun d!112321 () Bool)

(assert (=> d!112321 (= (array_inv!20381 _keys!1386) (bvsge (size!26551 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78234 d!112321))

(declare-fun b!913196 () Bool)

(declare-fun e!512213 () Bool)

(declare-fun call!40400 () Bool)

(assert (=> b!913196 (= e!512213 call!40400)))

(declare-fun b!913197 () Bool)

(declare-fun e!512214 () Bool)

(assert (=> b!913197 (= e!512213 e!512214)))

(declare-fun lt!410748 () (_ BitVec 64))

(assert (=> b!913197 (= lt!410748 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410750 () Unit!30910)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54276 (_ BitVec 64) (_ BitVec 32)) Unit!30910)

(assert (=> b!913197 (= lt!410750 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410748 #b00000000000000000000000000000000))))

(assert (=> b!913197 (arrayContainsKey!0 _keys!1386 lt!410748 #b00000000000000000000000000000000)))

(declare-fun lt!410749 () Unit!30910)

(assert (=> b!913197 (= lt!410749 lt!410750)))

(declare-fun res!616025 () Bool)

(declare-datatypes ((SeekEntryResult!8968 0))(
  ( (MissingZero!8968 (index!38243 (_ BitVec 32))) (Found!8968 (index!38244 (_ BitVec 32))) (Intermediate!8968 (undefined!9780 Bool) (index!38245 (_ BitVec 32)) (x!78119 (_ BitVec 32))) (Undefined!8968) (MissingVacant!8968 (index!38246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54276 (_ BitVec 32)) SeekEntryResult!8968)

(assert (=> b!913197 (= res!616025 (= (seekEntryOrOpen!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8968 #b00000000000000000000000000000000)))))

(assert (=> b!913197 (=> (not res!616025) (not e!512214))))

(declare-fun b!913198 () Bool)

(declare-fun e!512212 () Bool)

(assert (=> b!913198 (= e!512212 e!512213)))

(declare-fun c!95805 () Bool)

(assert (=> b!913198 (= c!95805 (validKeyInArray!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40397 () Bool)

(assert (=> bm!40397 (= call!40400 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!913199 () Bool)

(assert (=> b!913199 (= e!512214 call!40400)))

(declare-fun d!112323 () Bool)

(declare-fun res!616026 () Bool)

(assert (=> d!112323 (=> res!616026 e!512212)))

(assert (=> d!112323 (= res!616026 (bvsge #b00000000000000000000000000000000 (size!26551 _keys!1386)))))

(assert (=> d!112323 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!512212)))

(assert (= (and d!112323 (not res!616026)) b!913198))

(assert (= (and b!913198 c!95805) b!913197))

(assert (= (and b!913198 (not c!95805)) b!913196))

(assert (= (and b!913197 res!616025) b!913199))

(assert (= (or b!913199 b!913196) bm!40397))

(assert (=> b!913197 m!847547))

(declare-fun m!847555 () Bool)

(assert (=> b!913197 m!847555))

(declare-fun m!847557 () Bool)

(assert (=> b!913197 m!847557))

(assert (=> b!913197 m!847547))

(declare-fun m!847559 () Bool)

(assert (=> b!913197 m!847559))

(assert (=> b!913198 m!847547))

(assert (=> b!913198 m!847547))

(assert (=> b!913198 m!847551))

(declare-fun m!847561 () Bool)

(assert (=> bm!40397 m!847561))

(assert (=> b!913142 d!112323))

(declare-fun d!112325 () Bool)

(assert (=> d!112325 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!913133 d!112325))

(declare-fun d!112327 () Bool)

(declare-fun res!616031 () Bool)

(declare-fun e!512219 () Bool)

(assert (=> d!112327 (=> res!616031 e!512219)))

(assert (=> d!112327 (= res!616031 (= (select (arr!26092 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112327 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!512219)))

(declare-fun b!913204 () Bool)

(declare-fun e!512220 () Bool)

(assert (=> b!913204 (= e!512219 e!512220)))

(declare-fun res!616032 () Bool)

(assert (=> b!913204 (=> (not res!616032) (not e!512220))))

(assert (=> b!913204 (= res!616032 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26551 _keys!1386)))))

(declare-fun b!913205 () Bool)

(assert (=> b!913205 (= e!512220 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112327 (not res!616031)) b!913204))

(assert (= (and b!913204 res!616032) b!913205))

(assert (=> d!112327 m!847547))

(declare-fun m!847563 () Bool)

(assert (=> b!913205 m!847563))

(assert (=> b!913136 d!112327))

(declare-fun d!112329 () Bool)

(declare-fun e!512223 () Bool)

(assert (=> d!112329 e!512223))

(declare-fun c!95808 () Bool)

(assert (=> d!112329 (= c!95808 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!410753 () Unit!30910)

(declare-fun choose!1530 (array!54276 array!54278 (_ BitVec 32) (_ BitVec 32) V!30489 V!30489 (_ BitVec 64) Int) Unit!30910)

(assert (=> d!112329 (= lt!410753 (choose!1530 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112329 (validMask!0 mask!1756)))

(assert (=> d!112329 (= (lemmaKeyInListMapIsInArray!280 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!410753)))

(declare-fun b!913210 () Bool)

(assert (=> b!913210 (= e!512223 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!913211 () Bool)

(assert (=> b!913211 (= e!512223 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112329 c!95808) b!913210))

(assert (= (and d!112329 (not c!95808)) b!913211))

(declare-fun m!847565 () Bool)

(assert (=> d!112329 m!847565))

(assert (=> d!112329 m!847507))

(assert (=> b!913210 m!847519))

(assert (=> b!913136 d!112329))

(declare-fun d!112331 () Bool)

(declare-fun e!512229 () Bool)

(assert (=> d!112331 e!512229))

(declare-fun res!616035 () Bool)

(assert (=> d!112331 (=> res!616035 e!512229)))

(declare-fun lt!410765 () Bool)

(assert (=> d!112331 (= res!616035 (not lt!410765))))

(declare-fun lt!410763 () Bool)

(assert (=> d!112331 (= lt!410765 lt!410763)))

(declare-fun lt!410762 () Unit!30910)

(declare-fun e!512228 () Unit!30910)

(assert (=> d!112331 (= lt!410762 e!512228)))

(declare-fun c!95811 () Bool)

(assert (=> d!112331 (= c!95811 lt!410763)))

(declare-fun containsKey!441 (List!18329 (_ BitVec 64)) Bool)

(assert (=> d!112331 (= lt!410763 (containsKey!441 (toList!5634 (getCurrentListMap!2896 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112331 (= (contains!4680 (getCurrentListMap!2896 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410765)))

(declare-fun b!913218 () Bool)

(declare-fun lt!410764 () Unit!30910)

(assert (=> b!913218 (= e!512228 lt!410764)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!337 (List!18329 (_ BitVec 64)) Unit!30910)

(assert (=> b!913218 (= lt!410764 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5634 (getCurrentListMap!2896 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!480 0))(
  ( (Some!479 (v!12135 V!30489)) (None!478) )
))
(declare-fun isDefined!346 (Option!480) Bool)

(declare-fun getValueByKey!474 (List!18329 (_ BitVec 64)) Option!480)

(assert (=> b!913218 (isDefined!346 (getValueByKey!474 (toList!5634 (getCurrentListMap!2896 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!913219 () Bool)

(declare-fun Unit!30914 () Unit!30910)

(assert (=> b!913219 (= e!512228 Unit!30914)))

(declare-fun b!913220 () Bool)

(assert (=> b!913220 (= e!512229 (isDefined!346 (getValueByKey!474 (toList!5634 (getCurrentListMap!2896 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112331 c!95811) b!913218))

(assert (= (and d!112331 (not c!95811)) b!913219))

(assert (= (and d!112331 (not res!616035)) b!913220))

(declare-fun m!847567 () Bool)

(assert (=> d!112331 m!847567))

(declare-fun m!847569 () Bool)

(assert (=> b!913218 m!847569))

(declare-fun m!847571 () Bool)

(assert (=> b!913218 m!847571))

(assert (=> b!913218 m!847571))

(declare-fun m!847573 () Bool)

(assert (=> b!913218 m!847573))

(assert (=> b!913220 m!847571))

(assert (=> b!913220 m!847571))

(assert (=> b!913220 m!847573))

(assert (=> b!913140 d!112331))

(declare-fun b!913263 () Bool)

(declare-fun e!512262 () Bool)

(declare-fun e!512258 () Bool)

(assert (=> b!913263 (= e!512262 e!512258)))

(declare-fun res!616055 () Bool)

(declare-fun call!40417 () Bool)

(assert (=> b!913263 (= res!616055 call!40417)))

(assert (=> b!913263 (=> (not res!616055) (not e!512258))))

(declare-fun bm!40412 () Bool)

(declare-fun call!40418 () ListLongMap!11237)

(declare-fun call!40421 () ListLongMap!11237)

(assert (=> bm!40412 (= call!40418 call!40421)))

(declare-fun b!913264 () Bool)

(declare-fun res!616058 () Bool)

(declare-fun e!512264 () Bool)

(assert (=> b!913264 (=> (not res!616058) (not e!512264))))

(assert (=> b!913264 (= res!616058 e!512262)))

(declare-fun c!95824 () Bool)

(assert (=> b!913264 (= c!95824 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!913265 () Bool)

(declare-fun e!512267 () Bool)

(declare-fun e!512263 () Bool)

(assert (=> b!913265 (= e!512267 e!512263)))

(declare-fun res!616054 () Bool)

(declare-fun call!40416 () Bool)

(assert (=> b!913265 (= res!616054 call!40416)))

(assert (=> b!913265 (=> (not res!616054) (not e!512263))))

(declare-fun b!913266 () Bool)

(declare-fun e!512256 () ListLongMap!11237)

(declare-fun e!512268 () ListLongMap!11237)

(assert (=> b!913266 (= e!512256 e!512268)))

(declare-fun c!95829 () Bool)

(assert (=> b!913266 (= c!95829 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913267 () Bool)

(declare-fun e!512261 () Unit!30910)

(declare-fun lt!410830 () Unit!30910)

(assert (=> b!913267 (= e!512261 lt!410830)))

(declare-fun lt!410817 () ListLongMap!11237)

(declare-fun getCurrentListMapNoExtraKeys!3294 (array!54276 array!54278 (_ BitVec 32) (_ BitVec 32) V!30489 V!30489 (_ BitVec 32) Int) ListLongMap!11237)

(assert (=> b!913267 (= lt!410817 (getCurrentListMapNoExtraKeys!3294 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410831 () (_ BitVec 64))

(assert (=> b!913267 (= lt!410831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410827 () (_ BitVec 64))

(assert (=> b!913267 (= lt!410827 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410822 () Unit!30910)

(declare-fun addStillContains!348 (ListLongMap!11237 (_ BitVec 64) V!30489 (_ BitVec 64)) Unit!30910)

(assert (=> b!913267 (= lt!410822 (addStillContains!348 lt!410817 lt!410831 zeroValue!1094 lt!410827))))

(declare-fun +!2607 (ListLongMap!11237 tuple2!12540) ListLongMap!11237)

(assert (=> b!913267 (contains!4680 (+!2607 lt!410817 (tuple2!12541 lt!410831 zeroValue!1094)) lt!410827)))

(declare-fun lt!410819 () Unit!30910)

(assert (=> b!913267 (= lt!410819 lt!410822)))

(declare-fun lt!410813 () ListLongMap!11237)

(assert (=> b!913267 (= lt!410813 (getCurrentListMapNoExtraKeys!3294 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410814 () (_ BitVec 64))

(assert (=> b!913267 (= lt!410814 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410828 () (_ BitVec 64))

(assert (=> b!913267 (= lt!410828 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410825 () Unit!30910)

(declare-fun addApplyDifferent!348 (ListLongMap!11237 (_ BitVec 64) V!30489 (_ BitVec 64)) Unit!30910)

(assert (=> b!913267 (= lt!410825 (addApplyDifferent!348 lt!410813 lt!410814 minValue!1094 lt!410828))))

(declare-fun apply!515 (ListLongMap!11237 (_ BitVec 64)) V!30489)

(assert (=> b!913267 (= (apply!515 (+!2607 lt!410813 (tuple2!12541 lt!410814 minValue!1094)) lt!410828) (apply!515 lt!410813 lt!410828))))

(declare-fun lt!410823 () Unit!30910)

(assert (=> b!913267 (= lt!410823 lt!410825)))

(declare-fun lt!410812 () ListLongMap!11237)

(assert (=> b!913267 (= lt!410812 (getCurrentListMapNoExtraKeys!3294 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410818 () (_ BitVec 64))

(assert (=> b!913267 (= lt!410818 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410821 () (_ BitVec 64))

(assert (=> b!913267 (= lt!410821 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410829 () Unit!30910)

(assert (=> b!913267 (= lt!410829 (addApplyDifferent!348 lt!410812 lt!410818 zeroValue!1094 lt!410821))))

(assert (=> b!913267 (= (apply!515 (+!2607 lt!410812 (tuple2!12541 lt!410818 zeroValue!1094)) lt!410821) (apply!515 lt!410812 lt!410821))))

(declare-fun lt!410826 () Unit!30910)

(assert (=> b!913267 (= lt!410826 lt!410829)))

(declare-fun lt!410816 () ListLongMap!11237)

(assert (=> b!913267 (= lt!410816 (getCurrentListMapNoExtraKeys!3294 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410824 () (_ BitVec 64))

(assert (=> b!913267 (= lt!410824 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410815 () (_ BitVec 64))

(assert (=> b!913267 (= lt!410815 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!913267 (= lt!410830 (addApplyDifferent!348 lt!410816 lt!410824 minValue!1094 lt!410815))))

(assert (=> b!913267 (= (apply!515 (+!2607 lt!410816 (tuple2!12541 lt!410824 minValue!1094)) lt!410815) (apply!515 lt!410816 lt!410815))))

(declare-fun b!913268 () Bool)

(declare-fun e!512259 () ListLongMap!11237)

(assert (=> b!913268 (= e!512259 call!40418)))

(declare-fun bm!40413 () Bool)

(declare-fun lt!410810 () ListLongMap!11237)

(assert (=> bm!40413 (= call!40416 (contains!4680 lt!410810 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40414 () Bool)

(declare-fun call!40415 () ListLongMap!11237)

(assert (=> bm!40414 (= call!40421 call!40415)))

(declare-fun b!913269 () Bool)

(declare-fun call!40420 () ListLongMap!11237)

(assert (=> b!913269 (= e!512259 call!40420)))

(declare-fun b!913270 () Bool)

(declare-fun e!512265 () Bool)

(declare-fun e!512266 () Bool)

(assert (=> b!913270 (= e!512265 e!512266)))

(declare-fun res!616056 () Bool)

(assert (=> b!913270 (=> (not res!616056) (not e!512266))))

(assert (=> b!913270 (= res!616056 (contains!4680 lt!410810 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913270 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26551 _keys!1386)))))

(declare-fun bm!40415 () Bool)

(assert (=> bm!40415 (= call!40415 (getCurrentListMapNoExtraKeys!3294 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!913271 () Bool)

(assert (=> b!913271 (= e!512258 (= (apply!515 lt!410810 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun bm!40416 () Bool)

(declare-fun call!40419 () ListLongMap!11237)

(declare-fun c!95828 () Bool)

(assert (=> bm!40416 (= call!40419 (+!2607 (ite c!95828 call!40415 (ite c!95829 call!40421 call!40418)) (ite (or c!95828 c!95829) (tuple2!12541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12541 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!913272 () Bool)

(declare-fun c!95826 () Bool)

(assert (=> b!913272 (= c!95826 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!913272 (= e!512268 e!512259)))

(declare-fun b!913273 () Bool)

(declare-fun Unit!30915 () Unit!30910)

(assert (=> b!913273 (= e!512261 Unit!30915)))

(declare-fun bm!40417 () Bool)

(assert (=> bm!40417 (= call!40417 (contains!4680 lt!410810 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40418 () Bool)

(assert (=> bm!40418 (= call!40420 call!40419)))

(declare-fun b!913274 () Bool)

(assert (=> b!913274 (= e!512263 (= (apply!515 lt!410810 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!913275 () Bool)

(declare-fun e!512257 () Bool)

(assert (=> b!913275 (= e!512257 (validKeyInArray!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913276 () Bool)

(declare-fun get!13696 (ValueCell!9090 V!30489) V!30489)

(declare-fun dynLambda!1391 (Int (_ BitVec 64)) V!30489)

(assert (=> b!913276 (= e!512266 (= (apply!515 lt!410810 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)) (get!13696 (select (arr!26093 _values!1152) #b00000000000000000000000000000000) (dynLambda!1391 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26552 _values!1152)))))

(assert (=> b!913276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26551 _keys!1386)))))

(declare-fun b!913277 () Bool)

(assert (=> b!913277 (= e!512264 e!512267)))

(declare-fun c!95827 () Bool)

(assert (=> b!913277 (= c!95827 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!112333 () Bool)

(assert (=> d!112333 e!512264))

(declare-fun res!616060 () Bool)

(assert (=> d!112333 (=> (not res!616060) (not e!512264))))

(assert (=> d!112333 (= res!616060 (or (bvsge #b00000000000000000000000000000000 (size!26551 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26551 _keys!1386)))))))

(declare-fun lt!410820 () ListLongMap!11237)

(assert (=> d!112333 (= lt!410810 lt!410820)))

(declare-fun lt!410811 () Unit!30910)

(assert (=> d!112333 (= lt!410811 e!512261)))

(declare-fun c!95825 () Bool)

(declare-fun e!512260 () Bool)

(assert (=> d!112333 (= c!95825 e!512260)))

(declare-fun res!616061 () Bool)

(assert (=> d!112333 (=> (not res!616061) (not e!512260))))

(assert (=> d!112333 (= res!616061 (bvslt #b00000000000000000000000000000000 (size!26551 _keys!1386)))))

(assert (=> d!112333 (= lt!410820 e!512256)))

(assert (=> d!112333 (= c!95828 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112333 (validMask!0 mask!1756)))

(assert (=> d!112333 (= (getCurrentListMap!2896 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410810)))

(declare-fun b!913278 () Bool)

(assert (=> b!913278 (= e!512262 (not call!40417))))

(declare-fun b!913279 () Bool)

(assert (=> b!913279 (= e!512267 (not call!40416))))

(declare-fun b!913280 () Bool)

(assert (=> b!913280 (= e!512256 (+!2607 call!40419 (tuple2!12541 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!913281 () Bool)

(assert (=> b!913281 (= e!512260 (validKeyInArray!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913282 () Bool)

(assert (=> b!913282 (= e!512268 call!40420)))

(declare-fun b!913283 () Bool)

(declare-fun res!616059 () Bool)

(assert (=> b!913283 (=> (not res!616059) (not e!512264))))

(assert (=> b!913283 (= res!616059 e!512265)))

(declare-fun res!616057 () Bool)

(assert (=> b!913283 (=> res!616057 e!512265)))

(assert (=> b!913283 (= res!616057 (not e!512257))))

(declare-fun res!616062 () Bool)

(assert (=> b!913283 (=> (not res!616062) (not e!512257))))

(assert (=> b!913283 (= res!616062 (bvslt #b00000000000000000000000000000000 (size!26551 _keys!1386)))))

(assert (= (and d!112333 c!95828) b!913280))

(assert (= (and d!112333 (not c!95828)) b!913266))

(assert (= (and b!913266 c!95829) b!913282))

(assert (= (and b!913266 (not c!95829)) b!913272))

(assert (= (and b!913272 c!95826) b!913269))

(assert (= (and b!913272 (not c!95826)) b!913268))

(assert (= (or b!913269 b!913268) bm!40412))

(assert (= (or b!913282 bm!40412) bm!40414))

(assert (= (or b!913282 b!913269) bm!40418))

(assert (= (or b!913280 bm!40414) bm!40415))

(assert (= (or b!913280 bm!40418) bm!40416))

(assert (= (and d!112333 res!616061) b!913281))

(assert (= (and d!112333 c!95825) b!913267))

(assert (= (and d!112333 (not c!95825)) b!913273))

(assert (= (and d!112333 res!616060) b!913283))

(assert (= (and b!913283 res!616062) b!913275))

(assert (= (and b!913283 (not res!616057)) b!913270))

(assert (= (and b!913270 res!616056) b!913276))

(assert (= (and b!913283 res!616059) b!913264))

(assert (= (and b!913264 c!95824) b!913263))

(assert (= (and b!913264 (not c!95824)) b!913278))

(assert (= (and b!913263 res!616055) b!913271))

(assert (= (or b!913263 b!913278) bm!40417))

(assert (= (and b!913264 res!616058) b!913277))

(assert (= (and b!913277 c!95827) b!913265))

(assert (= (and b!913277 (not c!95827)) b!913279))

(assert (= (and b!913265 res!616054) b!913274))

(assert (= (or b!913265 b!913279) bm!40413))

(declare-fun b_lambda!13311 () Bool)

(assert (=> (not b_lambda!13311) (not b!913276)))

(declare-fun t!25922 () Bool)

(declare-fun tb!5441 () Bool)

(assert (=> (and start!78234 (= defaultEntry!1160 defaultEntry!1160) t!25922) tb!5441))

(declare-fun result!10687 () Bool)

(assert (=> tb!5441 (= result!10687 tp_is_empty!19143)))

(assert (=> b!913276 t!25922))

(declare-fun b_and!27305 () Bool)

(assert (= b_and!27301 (and (=> t!25922 result!10687) b_and!27305)))

(declare-fun m!847575 () Bool)

(assert (=> b!913271 m!847575))

(assert (=> b!913270 m!847547))

(assert (=> b!913270 m!847547))

(declare-fun m!847577 () Bool)

(assert (=> b!913270 m!847577))

(declare-fun m!847579 () Bool)

(assert (=> bm!40416 m!847579))

(assert (=> d!112333 m!847507))

(assert (=> b!913281 m!847547))

(assert (=> b!913281 m!847547))

(assert (=> b!913281 m!847551))

(declare-fun m!847581 () Bool)

(assert (=> b!913274 m!847581))

(declare-fun m!847583 () Bool)

(assert (=> b!913276 m!847583))

(declare-fun m!847585 () Bool)

(assert (=> b!913276 m!847585))

(declare-fun m!847587 () Bool)

(assert (=> b!913276 m!847587))

(assert (=> b!913276 m!847583))

(assert (=> b!913276 m!847547))

(assert (=> b!913276 m!847547))

(declare-fun m!847589 () Bool)

(assert (=> b!913276 m!847589))

(assert (=> b!913276 m!847585))

(declare-fun m!847591 () Bool)

(assert (=> b!913267 m!847591))

(declare-fun m!847593 () Bool)

(assert (=> b!913267 m!847593))

(declare-fun m!847595 () Bool)

(assert (=> b!913267 m!847595))

(declare-fun m!847597 () Bool)

(assert (=> b!913267 m!847597))

(declare-fun m!847599 () Bool)

(assert (=> b!913267 m!847599))

(declare-fun m!847601 () Bool)

(assert (=> b!913267 m!847601))

(assert (=> b!913267 m!847547))

(declare-fun m!847603 () Bool)

(assert (=> b!913267 m!847603))

(declare-fun m!847605 () Bool)

(assert (=> b!913267 m!847605))

(declare-fun m!847607 () Bool)

(assert (=> b!913267 m!847607))

(declare-fun m!847609 () Bool)

(assert (=> b!913267 m!847609))

(assert (=> b!913267 m!847595))

(declare-fun m!847611 () Bool)

(assert (=> b!913267 m!847611))

(declare-fun m!847613 () Bool)

(assert (=> b!913267 m!847613))

(declare-fun m!847615 () Bool)

(assert (=> b!913267 m!847615))

(declare-fun m!847617 () Bool)

(assert (=> b!913267 m!847617))

(declare-fun m!847619 () Bool)

(assert (=> b!913267 m!847619))

(assert (=> b!913267 m!847605))

(declare-fun m!847621 () Bool)

(assert (=> b!913267 m!847621))

(assert (=> b!913267 m!847615))

(assert (=> b!913267 m!847591))

(declare-fun m!847623 () Bool)

(assert (=> bm!40417 m!847623))

(assert (=> b!913275 m!847547))

(assert (=> b!913275 m!847547))

(assert (=> b!913275 m!847551))

(assert (=> bm!40415 m!847609))

(declare-fun m!847625 () Bool)

(assert (=> b!913280 m!847625))

(declare-fun m!847627 () Bool)

(assert (=> bm!40413 m!847627))

(assert (=> b!913140 d!112333))

(declare-fun condMapEmpty!30448 () Bool)

(declare-fun mapDefault!30448 () ValueCell!9090)

(assert (=> mapNonEmpty!30442 (= condMapEmpty!30448 (= mapRest!30442 ((as const (Array (_ BitVec 32) ValueCell!9090)) mapDefault!30448)))))

(declare-fun e!512273 () Bool)

(declare-fun mapRes!30448 () Bool)

(assert (=> mapNonEmpty!30442 (= tp!58451 (and e!512273 mapRes!30448))))

(declare-fun mapNonEmpty!30448 () Bool)

(declare-fun tp!58461 () Bool)

(declare-fun e!512274 () Bool)

(assert (=> mapNonEmpty!30448 (= mapRes!30448 (and tp!58461 e!512274))))

(declare-fun mapKey!30448 () (_ BitVec 32))

(declare-fun mapValue!30448 () ValueCell!9090)

(declare-fun mapRest!30448 () (Array (_ BitVec 32) ValueCell!9090))

(assert (=> mapNonEmpty!30448 (= mapRest!30442 (store mapRest!30448 mapKey!30448 mapValue!30448))))

(declare-fun b!913292 () Bool)

(assert (=> b!913292 (= e!512274 tp_is_empty!19143)))

(declare-fun b!913293 () Bool)

(assert (=> b!913293 (= e!512273 tp_is_empty!19143)))

(declare-fun mapIsEmpty!30448 () Bool)

(assert (=> mapIsEmpty!30448 mapRes!30448))

(assert (= (and mapNonEmpty!30442 condMapEmpty!30448) mapIsEmpty!30448))

(assert (= (and mapNonEmpty!30442 (not condMapEmpty!30448)) mapNonEmpty!30448))

(assert (= (and mapNonEmpty!30448 ((_ is ValueCellFull!9090) mapValue!30448)) b!913292))

(assert (= (and mapNonEmpty!30442 ((_ is ValueCellFull!9090) mapDefault!30448)) b!913293))

(declare-fun m!847629 () Bool)

(assert (=> mapNonEmpty!30448 m!847629))

(declare-fun b_lambda!13313 () Bool)

(assert (= b_lambda!13311 (or (and start!78234 b_free!16725) b_lambda!13313)))

(check-sat (not b!913197) (not b!913210) (not bm!40416) (not b!913270) (not b!913198) (not b!913274) (not b!913280) (not b!913183) b_and!27305 (not b!913220) (not b!913184) (not b_lambda!13313) tp_is_empty!19143 (not b!913276) (not b!913275) (not bm!40413) (not d!112333) (not b!913218) (not mapNonEmpty!30448) (not b!913267) (not bm!40397) (not b!913205) (not bm!40394) (not d!112329) (not b!913187) (not bm!40417) (not b_next!16725) (not b!913271) (not bm!40415) (not d!112331) (not b!913281))
(check-sat b_and!27305 (not b_next!16725))
