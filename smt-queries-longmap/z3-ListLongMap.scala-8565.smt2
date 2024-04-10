; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104588 () Bool)

(assert start!104588)

(declare-fun b!1247296 () Bool)

(declare-fun e!707555 () Bool)

(declare-fun tp_is_empty!31329 () Bool)

(assert (=> b!1247296 (= e!707555 tp_is_empty!31329)))

(declare-fun mapNonEmpty!48745 () Bool)

(declare-fun mapRes!48745 () Bool)

(declare-fun tp!92846 () Bool)

(assert (=> mapNonEmpty!48745 (= mapRes!48745 (and tp!92846 e!707555))))

(declare-datatypes ((V!47137 0))(
  ( (V!47138 (val!15727 Int)) )
))
(declare-datatypes ((ValueCell!14901 0))(
  ( (ValueCellFull!14901 (v!18422 V!47137)) (EmptyCell!14901) )
))
(declare-fun mapValue!48745 () ValueCell!14901)

(declare-fun mapRest!48745 () (Array (_ BitVec 32) ValueCell!14901))

(declare-datatypes ((array!80352 0))(
  ( (array!80353 (arr!38746 (Array (_ BitVec 32) ValueCell!14901)) (size!39282 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80352)

(declare-fun mapKey!48745 () (_ BitVec 32))

(assert (=> mapNonEmpty!48745 (= (arr!38746 _values!914) (store mapRest!48745 mapKey!48745 mapValue!48745))))

(declare-fun b!1247297 () Bool)

(declare-fun e!707553 () Bool)

(declare-fun e!707552 () Bool)

(assert (=> b!1247297 (= e!707553 (and e!707552 mapRes!48745))))

(declare-fun condMapEmpty!48745 () Bool)

(declare-fun mapDefault!48745 () ValueCell!14901)

(assert (=> b!1247297 (= condMapEmpty!48745 (= (arr!38746 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14901)) mapDefault!48745)))))

(declare-fun b!1247298 () Bool)

(declare-fun res!832291 () Bool)

(declare-fun e!707550 () Bool)

(assert (=> b!1247298 (=> (not res!832291) (not e!707550))))

(declare-datatypes ((array!80354 0))(
  ( (array!80355 (arr!38747 (Array (_ BitVec 32) (_ BitVec 64))) (size!39283 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80354)

(assert (=> b!1247298 (= res!832291 (and (bvsle #b00000000000000000000000000000000 (size!39283 _keys!1118)) (bvslt (size!39283 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun b!1247299 () Bool)

(declare-fun res!832287 () Bool)

(assert (=> b!1247299 (=> (not res!832287) (not e!707550))))

(declare-datatypes ((List!27522 0))(
  ( (Nil!27519) (Cons!27518 (h!28727 (_ BitVec 64)) (t!40991 List!27522)) )
))
(declare-fun noDuplicate!2040 (List!27522) Bool)

(assert (=> b!1247299 (= res!832287 (noDuplicate!2040 Nil!27519))))

(declare-fun mapIsEmpty!48745 () Bool)

(assert (=> mapIsEmpty!48745 mapRes!48745))

(declare-fun b!1247300 () Bool)

(declare-fun e!707551 () Bool)

(declare-fun contains!7466 (List!27522 (_ BitVec 64)) Bool)

(assert (=> b!1247300 (= e!707551 (contains!7466 Nil!27519 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247301 () Bool)

(declare-fun res!832288 () Bool)

(assert (=> b!1247301 (=> (not res!832288) (not e!707550))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80354 (_ BitVec 32)) Bool)

(assert (=> b!1247301 (= res!832288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247302 () Bool)

(assert (=> b!1247302 (= e!707552 tp_is_empty!31329)))

(declare-fun b!1247303 () Bool)

(assert (=> b!1247303 (= e!707550 e!707551)))

(declare-fun res!832289 () Bool)

(assert (=> b!1247303 (=> res!832289 e!707551)))

(assert (=> b!1247303 (= res!832289 (contains!7466 Nil!27519 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!832286 () Bool)

(assert (=> start!104588 (=> (not res!832286) (not e!707550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104588 (= res!832286 (validMask!0 mask!1466))))

(assert (=> start!104588 e!707550))

(assert (=> start!104588 true))

(declare-fun array_inv!29589 (array!80354) Bool)

(assert (=> start!104588 (array_inv!29589 _keys!1118)))

(declare-fun array_inv!29590 (array!80352) Bool)

(assert (=> start!104588 (and (array_inv!29590 _values!914) e!707553)))

(declare-fun b!1247295 () Bool)

(declare-fun res!832290 () Bool)

(assert (=> b!1247295 (=> (not res!832290) (not e!707550))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247295 (= res!832290 (and (= (size!39282 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39283 _keys!1118) (size!39282 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104588 res!832286) b!1247295))

(assert (= (and b!1247295 res!832290) b!1247301))

(assert (= (and b!1247301 res!832288) b!1247298))

(assert (= (and b!1247298 res!832291) b!1247299))

(assert (= (and b!1247299 res!832287) b!1247303))

(assert (= (and b!1247303 (not res!832289)) b!1247300))

(assert (= (and b!1247297 condMapEmpty!48745) mapIsEmpty!48745))

(assert (= (and b!1247297 (not condMapEmpty!48745)) mapNonEmpty!48745))

(get-info :version)

(assert (= (and mapNonEmpty!48745 ((_ is ValueCellFull!14901) mapValue!48745)) b!1247296))

(assert (= (and b!1247297 ((_ is ValueCellFull!14901) mapDefault!48745)) b!1247302))

(assert (= start!104588 b!1247297))

(declare-fun m!1148847 () Bool)

(assert (=> b!1247299 m!1148847))

(declare-fun m!1148849 () Bool)

(assert (=> b!1247303 m!1148849))

(declare-fun m!1148851 () Bool)

(assert (=> b!1247301 m!1148851))

(declare-fun m!1148853 () Bool)

(assert (=> start!104588 m!1148853))

(declare-fun m!1148855 () Bool)

(assert (=> start!104588 m!1148855))

(declare-fun m!1148857 () Bool)

(assert (=> start!104588 m!1148857))

(declare-fun m!1148859 () Bool)

(assert (=> b!1247300 m!1148859))

(declare-fun m!1148861 () Bool)

(assert (=> mapNonEmpty!48745 m!1148861))

(check-sat (not mapNonEmpty!48745) (not b!1247299) tp_is_empty!31329 (not b!1247301) (not start!104588) (not b!1247300) (not b!1247303))
(check-sat)
(get-model)

(declare-fun d!137753 () Bool)

(declare-fun res!832314 () Bool)

(declare-fun e!707578 () Bool)

(assert (=> d!137753 (=> res!832314 e!707578)))

(assert (=> d!137753 (= res!832314 ((_ is Nil!27519) Nil!27519))))

(assert (=> d!137753 (= (noDuplicate!2040 Nil!27519) e!707578)))

(declare-fun b!1247335 () Bool)

(declare-fun e!707579 () Bool)

(assert (=> b!1247335 (= e!707578 e!707579)))

(declare-fun res!832315 () Bool)

(assert (=> b!1247335 (=> (not res!832315) (not e!707579))))

(assert (=> b!1247335 (= res!832315 (not (contains!7466 (t!40991 Nil!27519) (h!28727 Nil!27519))))))

(declare-fun b!1247336 () Bool)

(assert (=> b!1247336 (= e!707579 (noDuplicate!2040 (t!40991 Nil!27519)))))

(assert (= (and d!137753 (not res!832314)) b!1247335))

(assert (= (and b!1247335 res!832315) b!1247336))

(declare-fun m!1148879 () Bool)

(assert (=> b!1247335 m!1148879))

(declare-fun m!1148881 () Bool)

(assert (=> b!1247336 m!1148881))

(assert (=> b!1247299 d!137753))

(declare-fun d!137755 () Bool)

(declare-fun lt!563238 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!633 (List!27522) (InoxSet (_ BitVec 64)))

(assert (=> d!137755 (= lt!563238 (select (content!633 Nil!27519) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707585 () Bool)

(assert (=> d!137755 (= lt!563238 e!707585)))

(declare-fun res!832321 () Bool)

(assert (=> d!137755 (=> (not res!832321) (not e!707585))))

(assert (=> d!137755 (= res!832321 ((_ is Cons!27518) Nil!27519))))

(assert (=> d!137755 (= (contains!7466 Nil!27519 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563238)))

(declare-fun b!1247341 () Bool)

(declare-fun e!707584 () Bool)

(assert (=> b!1247341 (= e!707585 e!707584)))

(declare-fun res!832320 () Bool)

(assert (=> b!1247341 (=> res!832320 e!707584)))

(assert (=> b!1247341 (= res!832320 (= (h!28727 Nil!27519) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247342 () Bool)

(assert (=> b!1247342 (= e!707584 (contains!7466 (t!40991 Nil!27519) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137755 res!832321) b!1247341))

(assert (= (and b!1247341 (not res!832320)) b!1247342))

(declare-fun m!1148883 () Bool)

(assert (=> d!137755 m!1148883))

(declare-fun m!1148885 () Bool)

(assert (=> d!137755 m!1148885))

(declare-fun m!1148887 () Bool)

(assert (=> b!1247342 m!1148887))

(assert (=> b!1247303 d!137755))

(declare-fun d!137757 () Bool)

(declare-fun lt!563239 () Bool)

(assert (=> d!137757 (= lt!563239 (select (content!633 Nil!27519) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707587 () Bool)

(assert (=> d!137757 (= lt!563239 e!707587)))

(declare-fun res!832323 () Bool)

(assert (=> d!137757 (=> (not res!832323) (not e!707587))))

(assert (=> d!137757 (= res!832323 ((_ is Cons!27518) Nil!27519))))

(assert (=> d!137757 (= (contains!7466 Nil!27519 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563239)))

(declare-fun b!1247343 () Bool)

(declare-fun e!707586 () Bool)

(assert (=> b!1247343 (= e!707587 e!707586)))

(declare-fun res!832322 () Bool)

(assert (=> b!1247343 (=> res!832322 e!707586)))

(assert (=> b!1247343 (= res!832322 (= (h!28727 Nil!27519) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247344 () Bool)

(assert (=> b!1247344 (= e!707586 (contains!7466 (t!40991 Nil!27519) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137757 res!832323) b!1247343))

(assert (= (and b!1247343 (not res!832322)) b!1247344))

(assert (=> d!137757 m!1148883))

(declare-fun m!1148889 () Bool)

(assert (=> d!137757 m!1148889))

(declare-fun m!1148891 () Bool)

(assert (=> b!1247344 m!1148891))

(assert (=> b!1247300 d!137757))

(declare-fun d!137759 () Bool)

(assert (=> d!137759 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104588 d!137759))

(declare-fun d!137761 () Bool)

(assert (=> d!137761 (= (array_inv!29589 _keys!1118) (bvsge (size!39283 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104588 d!137761))

(declare-fun d!137763 () Bool)

(assert (=> d!137763 (= (array_inv!29590 _values!914) (bvsge (size!39282 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104588 d!137763))

(declare-fun b!1247353 () Bool)

(declare-fun e!707595 () Bool)

(declare-fun call!61563 () Bool)

(assert (=> b!1247353 (= e!707595 call!61563)))

(declare-fun bm!61560 () Bool)

(assert (=> bm!61560 (= call!61563 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1247354 () Bool)

(declare-fun e!707596 () Bool)

(assert (=> b!1247354 (= e!707596 e!707595)))

(declare-fun c!122100 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247354 (= c!122100 (validKeyInArray!0 (select (arr!38747 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1247355 () Bool)

(declare-fun e!707594 () Bool)

(assert (=> b!1247355 (= e!707595 e!707594)))

(declare-fun lt!563246 () (_ BitVec 64))

(assert (=> b!1247355 (= lt!563246 (select (arr!38747 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41471 0))(
  ( (Unit!41472) )
))
(declare-fun lt!563248 () Unit!41471)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80354 (_ BitVec 64) (_ BitVec 32)) Unit!41471)

(assert (=> b!1247355 (= lt!563248 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563246 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1247355 (arrayContainsKey!0 _keys!1118 lt!563246 #b00000000000000000000000000000000)))

(declare-fun lt!563247 () Unit!41471)

(assert (=> b!1247355 (= lt!563247 lt!563248)))

(declare-fun res!832328 () Bool)

(declare-datatypes ((SeekEntryResult!9955 0))(
  ( (MissingZero!9955 (index!42191 (_ BitVec 32))) (Found!9955 (index!42192 (_ BitVec 32))) (Intermediate!9955 (undefined!10767 Bool) (index!42193 (_ BitVec 32)) (x!109606 (_ BitVec 32))) (Undefined!9955) (MissingVacant!9955 (index!42194 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80354 (_ BitVec 32)) SeekEntryResult!9955)

(assert (=> b!1247355 (= res!832328 (= (seekEntryOrOpen!0 (select (arr!38747 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9955 #b00000000000000000000000000000000)))))

(assert (=> b!1247355 (=> (not res!832328) (not e!707594))))

(declare-fun b!1247356 () Bool)

(assert (=> b!1247356 (= e!707594 call!61563)))

(declare-fun d!137765 () Bool)

(declare-fun res!832329 () Bool)

(assert (=> d!137765 (=> res!832329 e!707596)))

(assert (=> d!137765 (= res!832329 (bvsge #b00000000000000000000000000000000 (size!39283 _keys!1118)))))

(assert (=> d!137765 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!707596)))

(assert (= (and d!137765 (not res!832329)) b!1247354))

(assert (= (and b!1247354 c!122100) b!1247355))

(assert (= (and b!1247354 (not c!122100)) b!1247353))

(assert (= (and b!1247355 res!832328) b!1247356))

(assert (= (or b!1247356 b!1247353) bm!61560))

(declare-fun m!1148893 () Bool)

(assert (=> bm!61560 m!1148893))

(declare-fun m!1148895 () Bool)

(assert (=> b!1247354 m!1148895))

(assert (=> b!1247354 m!1148895))

(declare-fun m!1148897 () Bool)

(assert (=> b!1247354 m!1148897))

(assert (=> b!1247355 m!1148895))

(declare-fun m!1148899 () Bool)

(assert (=> b!1247355 m!1148899))

(declare-fun m!1148901 () Bool)

(assert (=> b!1247355 m!1148901))

(assert (=> b!1247355 m!1148895))

(declare-fun m!1148903 () Bool)

(assert (=> b!1247355 m!1148903))

(assert (=> b!1247301 d!137765))

(declare-fun mapIsEmpty!48751 () Bool)

(declare-fun mapRes!48751 () Bool)

(assert (=> mapIsEmpty!48751 mapRes!48751))

(declare-fun b!1247364 () Bool)

(declare-fun e!707601 () Bool)

(assert (=> b!1247364 (= e!707601 tp_is_empty!31329)))

(declare-fun b!1247363 () Bool)

(declare-fun e!707602 () Bool)

(assert (=> b!1247363 (= e!707602 tp_is_empty!31329)))

(declare-fun mapNonEmpty!48751 () Bool)

(declare-fun tp!92852 () Bool)

(assert (=> mapNonEmpty!48751 (= mapRes!48751 (and tp!92852 e!707602))))

(declare-fun mapValue!48751 () ValueCell!14901)

(declare-fun mapKey!48751 () (_ BitVec 32))

(declare-fun mapRest!48751 () (Array (_ BitVec 32) ValueCell!14901))

(assert (=> mapNonEmpty!48751 (= mapRest!48745 (store mapRest!48751 mapKey!48751 mapValue!48751))))

(declare-fun condMapEmpty!48751 () Bool)

(declare-fun mapDefault!48751 () ValueCell!14901)

(assert (=> mapNonEmpty!48745 (= condMapEmpty!48751 (= mapRest!48745 ((as const (Array (_ BitVec 32) ValueCell!14901)) mapDefault!48751)))))

(assert (=> mapNonEmpty!48745 (= tp!92846 (and e!707601 mapRes!48751))))

(assert (= (and mapNonEmpty!48745 condMapEmpty!48751) mapIsEmpty!48751))

(assert (= (and mapNonEmpty!48745 (not condMapEmpty!48751)) mapNonEmpty!48751))

(assert (= (and mapNonEmpty!48751 ((_ is ValueCellFull!14901) mapValue!48751)) b!1247363))

(assert (= (and mapNonEmpty!48745 ((_ is ValueCellFull!14901) mapDefault!48751)) b!1247364))

(declare-fun m!1148905 () Bool)

(assert (=> mapNonEmpty!48751 m!1148905))

(check-sat (not b!1247342) (not mapNonEmpty!48751) (not d!137757) (not b!1247336) (not b!1247344) (not b!1247354) (not bm!61560) tp_is_empty!31329 (not d!137755) (not b!1247355) (not b!1247335))
(check-sat)
