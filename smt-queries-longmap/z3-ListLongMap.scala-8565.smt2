; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104582 () Bool)

(assert start!104582)

(declare-fun b!1247186 () Bool)

(declare-fun e!707491 () Bool)

(declare-fun tp_is_empty!31327 () Bool)

(assert (=> b!1247186 (= e!707491 tp_is_empty!31327)))

(declare-fun b!1247187 () Bool)

(declare-fun res!832231 () Bool)

(declare-fun e!707489 () Bool)

(assert (=> b!1247187 (=> (not res!832231) (not e!707489))))

(declare-datatypes ((array!80269 0))(
  ( (array!80270 (arr!38705 (Array (_ BitVec 32) (_ BitVec 64))) (size!39243 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80269)

(assert (=> b!1247187 (= res!832231 (and (bvsle #b00000000000000000000000000000000 (size!39243 _keys!1118)) (bvslt (size!39243 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!48742 () Bool)

(declare-fun mapRes!48742 () Bool)

(declare-fun tp!92843 () Bool)

(assert (=> mapNonEmpty!48742 (= mapRes!48742 (and tp!92843 e!707491))))

(declare-fun mapKey!48742 () (_ BitVec 32))

(declare-datatypes ((V!47135 0))(
  ( (V!47136 (val!15726 Int)) )
))
(declare-datatypes ((ValueCell!14900 0))(
  ( (ValueCellFull!14900 (v!18420 V!47135)) (EmptyCell!14900) )
))
(declare-fun mapValue!48742 () ValueCell!14900)

(declare-fun mapRest!48742 () (Array (_ BitVec 32) ValueCell!14900))

(declare-datatypes ((array!80271 0))(
  ( (array!80272 (arr!38706 (Array (_ BitVec 32) ValueCell!14900)) (size!39244 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80271)

(assert (=> mapNonEmpty!48742 (= (arr!38706 _values!914) (store mapRest!48742 mapKey!48742 mapValue!48742))))

(declare-fun b!1247188 () Bool)

(declare-fun res!832233 () Bool)

(assert (=> b!1247188 (=> (not res!832233) (not e!707489))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80269 (_ BitVec 32)) Bool)

(assert (=> b!1247188 (= res!832233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247189 () Bool)

(declare-fun e!707487 () Bool)

(declare-datatypes ((List!27585 0))(
  ( (Nil!27582) (Cons!27581 (h!28790 (_ BitVec 64)) (t!41045 List!27585)) )
))
(declare-fun contains!7438 (List!27585 (_ BitVec 64)) Bool)

(assert (=> b!1247189 (= e!707487 (contains!7438 Nil!27582 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247190 () Bool)

(declare-fun res!832232 () Bool)

(assert (=> b!1247190 (=> (not res!832232) (not e!707489))))

(declare-fun noDuplicate!2059 (List!27585) Bool)

(assert (=> b!1247190 (= res!832232 (noDuplicate!2059 Nil!27582))))

(declare-fun b!1247191 () Bool)

(declare-fun res!832229 () Bool)

(assert (=> b!1247191 (=> (not res!832229) (not e!707489))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247191 (= res!832229 (and (= (size!39244 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39243 _keys!1118) (size!39244 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48742 () Bool)

(assert (=> mapIsEmpty!48742 mapRes!48742))

(declare-fun b!1247193 () Bool)

(assert (=> b!1247193 (= e!707489 e!707487)))

(declare-fun res!832230 () Bool)

(assert (=> b!1247193 (=> res!832230 e!707487)))

(assert (=> b!1247193 (= res!832230 (contains!7438 Nil!27582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247194 () Bool)

(declare-fun e!707492 () Bool)

(assert (=> b!1247194 (= e!707492 tp_is_empty!31327)))

(declare-fun res!832228 () Bool)

(assert (=> start!104582 (=> (not res!832228) (not e!707489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104582 (= res!832228 (validMask!0 mask!1466))))

(assert (=> start!104582 e!707489))

(assert (=> start!104582 true))

(declare-fun array_inv!29679 (array!80269) Bool)

(assert (=> start!104582 (array_inv!29679 _keys!1118)))

(declare-fun e!707490 () Bool)

(declare-fun array_inv!29680 (array!80271) Bool)

(assert (=> start!104582 (and (array_inv!29680 _values!914) e!707490)))

(declare-fun b!1247192 () Bool)

(assert (=> b!1247192 (= e!707490 (and e!707492 mapRes!48742))))

(declare-fun condMapEmpty!48742 () Bool)

(declare-fun mapDefault!48742 () ValueCell!14900)

(assert (=> b!1247192 (= condMapEmpty!48742 (= (arr!38706 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14900)) mapDefault!48742)))))

(assert (= (and start!104582 res!832228) b!1247191))

(assert (= (and b!1247191 res!832229) b!1247188))

(assert (= (and b!1247188 res!832233) b!1247187))

(assert (= (and b!1247187 res!832231) b!1247190))

(assert (= (and b!1247190 res!832232) b!1247193))

(assert (= (and b!1247193 (not res!832230)) b!1247189))

(assert (= (and b!1247192 condMapEmpty!48742) mapIsEmpty!48742))

(assert (= (and b!1247192 (not condMapEmpty!48742)) mapNonEmpty!48742))

(get-info :version)

(assert (= (and mapNonEmpty!48742 ((_ is ValueCellFull!14900) mapValue!48742)) b!1247186))

(assert (= (and b!1247192 ((_ is ValueCellFull!14900) mapDefault!48742)) b!1247194))

(assert (= start!104582 b!1247192))

(declare-fun m!1148311 () Bool)

(assert (=> b!1247188 m!1148311))

(declare-fun m!1148313 () Bool)

(assert (=> b!1247189 m!1148313))

(declare-fun m!1148315 () Bool)

(assert (=> mapNonEmpty!48742 m!1148315))

(declare-fun m!1148317 () Bool)

(assert (=> start!104582 m!1148317))

(declare-fun m!1148319 () Bool)

(assert (=> start!104582 m!1148319))

(declare-fun m!1148321 () Bool)

(assert (=> start!104582 m!1148321))

(declare-fun m!1148323 () Bool)

(assert (=> b!1247190 m!1148323))

(declare-fun m!1148325 () Bool)

(assert (=> b!1247193 m!1148325))

(check-sat (not b!1247193) (not b!1247190) tp_is_empty!31327 (not b!1247188) (not mapNonEmpty!48742) (not start!104582) (not b!1247189))
(check-sat)
(get-model)

(declare-fun d!137621 () Bool)

(declare-fun lt!563059 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!631 (List!27585) (InoxSet (_ BitVec 64)))

(assert (=> d!137621 (= lt!563059 (select (content!631 Nil!27582) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707533 () Bool)

(assert (=> d!137621 (= lt!563059 e!707533)))

(declare-fun res!832274 () Bool)

(assert (=> d!137621 (=> (not res!832274) (not e!707533))))

(assert (=> d!137621 (= res!832274 ((_ is Cons!27581) Nil!27582))))

(assert (=> d!137621 (= (contains!7438 Nil!27582 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563059)))

(declare-fun b!1247253 () Bool)

(declare-fun e!707534 () Bool)

(assert (=> b!1247253 (= e!707533 e!707534)))

(declare-fun res!832275 () Bool)

(assert (=> b!1247253 (=> res!832275 e!707534)))

(assert (=> b!1247253 (= res!832275 (= (h!28790 Nil!27582) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247254 () Bool)

(assert (=> b!1247254 (= e!707534 (contains!7438 (t!41045 Nil!27582) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137621 res!832274) b!1247253))

(assert (= (and b!1247253 (not res!832275)) b!1247254))

(declare-fun m!1148359 () Bool)

(assert (=> d!137621 m!1148359))

(declare-fun m!1148361 () Bool)

(assert (=> d!137621 m!1148361))

(declare-fun m!1148363 () Bool)

(assert (=> b!1247254 m!1148363))

(assert (=> b!1247193 d!137621))

(declare-fun bm!61541 () Bool)

(declare-fun call!61544 () Bool)

(assert (=> bm!61541 (= call!61544 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1247263 () Bool)

(declare-fun e!707541 () Bool)

(assert (=> b!1247263 (= e!707541 call!61544)))

(declare-fun b!1247265 () Bool)

(declare-fun e!707543 () Bool)

(assert (=> b!1247265 (= e!707543 e!707541)))

(declare-fun lt!563066 () (_ BitVec 64))

(assert (=> b!1247265 (= lt!563066 (select (arr!38705 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41316 0))(
  ( (Unit!41317) )
))
(declare-fun lt!563068 () Unit!41316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80269 (_ BitVec 64) (_ BitVec 32)) Unit!41316)

(assert (=> b!1247265 (= lt!563068 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563066 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1247265 (arrayContainsKey!0 _keys!1118 lt!563066 #b00000000000000000000000000000000)))

(declare-fun lt!563067 () Unit!41316)

(assert (=> b!1247265 (= lt!563067 lt!563068)))

(declare-fun res!832281 () Bool)

(declare-datatypes ((SeekEntryResult!9954 0))(
  ( (MissingZero!9954 (index!42187 (_ BitVec 32))) (Found!9954 (index!42188 (_ BitVec 32))) (Intermediate!9954 (undefined!10766 Bool) (index!42189 (_ BitVec 32)) (x!109602 (_ BitVec 32))) (Undefined!9954) (MissingVacant!9954 (index!42190 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80269 (_ BitVec 32)) SeekEntryResult!9954)

(assert (=> b!1247265 (= res!832281 (= (seekEntryOrOpen!0 (select (arr!38705 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9954 #b00000000000000000000000000000000)))))

(assert (=> b!1247265 (=> (not res!832281) (not e!707541))))

(declare-fun b!1247266 () Bool)

(declare-fun e!707542 () Bool)

(assert (=> b!1247266 (= e!707542 e!707543)))

(declare-fun c!122082 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247266 (= c!122082 (validKeyInArray!0 (select (arr!38705 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!137623 () Bool)

(declare-fun res!832280 () Bool)

(assert (=> d!137623 (=> res!832280 e!707542)))

(assert (=> d!137623 (= res!832280 (bvsge #b00000000000000000000000000000000 (size!39243 _keys!1118)))))

(assert (=> d!137623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!707542)))

(declare-fun b!1247264 () Bool)

(assert (=> b!1247264 (= e!707543 call!61544)))

(assert (= (and d!137623 (not res!832280)) b!1247266))

(assert (= (and b!1247266 c!122082) b!1247265))

(assert (= (and b!1247266 (not c!122082)) b!1247264))

(assert (= (and b!1247265 res!832281) b!1247263))

(assert (= (or b!1247263 b!1247264) bm!61541))

(declare-fun m!1148365 () Bool)

(assert (=> bm!61541 m!1148365))

(declare-fun m!1148367 () Bool)

(assert (=> b!1247265 m!1148367))

(declare-fun m!1148369 () Bool)

(assert (=> b!1247265 m!1148369))

(declare-fun m!1148371 () Bool)

(assert (=> b!1247265 m!1148371))

(assert (=> b!1247265 m!1148367))

(declare-fun m!1148373 () Bool)

(assert (=> b!1247265 m!1148373))

(assert (=> b!1247266 m!1148367))

(assert (=> b!1247266 m!1148367))

(declare-fun m!1148375 () Bool)

(assert (=> b!1247266 m!1148375))

(assert (=> b!1247188 d!137623))

(declare-fun d!137625 () Bool)

(declare-fun res!832286 () Bool)

(declare-fun e!707548 () Bool)

(assert (=> d!137625 (=> res!832286 e!707548)))

(assert (=> d!137625 (= res!832286 ((_ is Nil!27582) Nil!27582))))

(assert (=> d!137625 (= (noDuplicate!2059 Nil!27582) e!707548)))

(declare-fun b!1247271 () Bool)

(declare-fun e!707549 () Bool)

(assert (=> b!1247271 (= e!707548 e!707549)))

(declare-fun res!832287 () Bool)

(assert (=> b!1247271 (=> (not res!832287) (not e!707549))))

(assert (=> b!1247271 (= res!832287 (not (contains!7438 (t!41045 Nil!27582) (h!28790 Nil!27582))))))

(declare-fun b!1247272 () Bool)

(assert (=> b!1247272 (= e!707549 (noDuplicate!2059 (t!41045 Nil!27582)))))

(assert (= (and d!137625 (not res!832286)) b!1247271))

(assert (= (and b!1247271 res!832287) b!1247272))

(declare-fun m!1148377 () Bool)

(assert (=> b!1247271 m!1148377))

(declare-fun m!1148379 () Bool)

(assert (=> b!1247272 m!1148379))

(assert (=> b!1247190 d!137625))

(declare-fun d!137627 () Bool)

(assert (=> d!137627 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104582 d!137627))

(declare-fun d!137629 () Bool)

(assert (=> d!137629 (= (array_inv!29679 _keys!1118) (bvsge (size!39243 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104582 d!137629))

(declare-fun d!137631 () Bool)

(assert (=> d!137631 (= (array_inv!29680 _values!914) (bvsge (size!39244 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104582 d!137631))

(declare-fun d!137633 () Bool)

(declare-fun lt!563069 () Bool)

(assert (=> d!137633 (= lt!563069 (select (content!631 Nil!27582) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707550 () Bool)

(assert (=> d!137633 (= lt!563069 e!707550)))

(declare-fun res!832288 () Bool)

(assert (=> d!137633 (=> (not res!832288) (not e!707550))))

(assert (=> d!137633 (= res!832288 ((_ is Cons!27581) Nil!27582))))

(assert (=> d!137633 (= (contains!7438 Nil!27582 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563069)))

(declare-fun b!1247273 () Bool)

(declare-fun e!707551 () Bool)

(assert (=> b!1247273 (= e!707550 e!707551)))

(declare-fun res!832289 () Bool)

(assert (=> b!1247273 (=> res!832289 e!707551)))

(assert (=> b!1247273 (= res!832289 (= (h!28790 Nil!27582) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247274 () Bool)

(assert (=> b!1247274 (= e!707551 (contains!7438 (t!41045 Nil!27582) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137633 res!832288) b!1247273))

(assert (= (and b!1247273 (not res!832289)) b!1247274))

(assert (=> d!137633 m!1148359))

(declare-fun m!1148381 () Bool)

(assert (=> d!137633 m!1148381))

(declare-fun m!1148383 () Bool)

(assert (=> b!1247274 m!1148383))

(assert (=> b!1247189 d!137633))

(declare-fun b!1247282 () Bool)

(declare-fun e!707556 () Bool)

(assert (=> b!1247282 (= e!707556 tp_is_empty!31327)))

(declare-fun condMapEmpty!48751 () Bool)

(declare-fun mapDefault!48751 () ValueCell!14900)

(assert (=> mapNonEmpty!48742 (= condMapEmpty!48751 (= mapRest!48742 ((as const (Array (_ BitVec 32) ValueCell!14900)) mapDefault!48751)))))

(declare-fun mapRes!48751 () Bool)

(assert (=> mapNonEmpty!48742 (= tp!92843 (and e!707556 mapRes!48751))))

(declare-fun mapNonEmpty!48751 () Bool)

(declare-fun tp!92852 () Bool)

(declare-fun e!707557 () Bool)

(assert (=> mapNonEmpty!48751 (= mapRes!48751 (and tp!92852 e!707557))))

(declare-fun mapRest!48751 () (Array (_ BitVec 32) ValueCell!14900))

(declare-fun mapValue!48751 () ValueCell!14900)

(declare-fun mapKey!48751 () (_ BitVec 32))

(assert (=> mapNonEmpty!48751 (= mapRest!48742 (store mapRest!48751 mapKey!48751 mapValue!48751))))

(declare-fun b!1247281 () Bool)

(assert (=> b!1247281 (= e!707557 tp_is_empty!31327)))

(declare-fun mapIsEmpty!48751 () Bool)

(assert (=> mapIsEmpty!48751 mapRes!48751))

(assert (= (and mapNonEmpty!48742 condMapEmpty!48751) mapIsEmpty!48751))

(assert (= (and mapNonEmpty!48742 (not condMapEmpty!48751)) mapNonEmpty!48751))

(assert (= (and mapNonEmpty!48751 ((_ is ValueCellFull!14900) mapValue!48751)) b!1247281))

(assert (= (and mapNonEmpty!48742 ((_ is ValueCellFull!14900) mapDefault!48751)) b!1247282))

(declare-fun m!1148385 () Bool)

(assert (=> mapNonEmpty!48751 m!1148385))

(check-sat (not b!1247265) (not b!1247274) (not d!137633) (not d!137621) (not b!1247266) (not mapNonEmpty!48751) (not b!1247271) (not bm!61541) (not b!1247254) (not b!1247272) tp_is_empty!31327)
(check-sat)
