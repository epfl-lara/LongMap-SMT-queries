; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35982 () Bool)

(assert start!35982)

(declare-fun b!361284 () Bool)

(declare-fun e!221257 () Bool)

(declare-fun from!1924 () (_ BitVec 32))

(declare-datatypes ((array!20311 0))(
  ( (array!20312 (arr!9643 (Array (_ BitVec 32) (_ BitVec 64))) (size!9996 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20311)

(assert (=> b!361284 (= e!221257 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!9996 _keys!1541)) (bvsge (size!9996 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361285 () Bool)

(declare-fun res!201002 () Bool)

(assert (=> b!361285 (=> (not res!201002) (not e!221257))))

(declare-datatypes ((List!5478 0))(
  ( (Nil!5475) (Cons!5474 (h!6330 (_ BitVec 64)) (t!10619 List!5478)) )
))
(declare-fun arrayNoDuplicates!0 (array!20311 (_ BitVec 32) List!5478) Bool)

(assert (=> b!361285 (= res!201002 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5475))))

(declare-fun b!361286 () Bool)

(declare-fun e!221260 () Bool)

(declare-fun e!221256 () Bool)

(declare-fun mapRes!14109 () Bool)

(assert (=> b!361286 (= e!221260 (and e!221256 mapRes!14109))))

(declare-fun condMapEmpty!14109 () Bool)

(declare-datatypes ((V!12163 0))(
  ( (V!12164 (val!4239 Int)) )
))
(declare-datatypes ((ValueCell!3851 0))(
  ( (ValueCellFull!3851 (v!6428 V!12163)) (EmptyCell!3851) )
))
(declare-datatypes ((array!20313 0))(
  ( (array!20314 (arr!9644 (Array (_ BitVec 32) ValueCell!3851)) (size!9997 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20313)

(declare-fun mapDefault!14109 () ValueCell!3851)

(assert (=> b!361286 (= condMapEmpty!14109 (= (arr!9644 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3851)) mapDefault!14109)))))

(declare-fun b!361287 () Bool)

(declare-fun tp_is_empty!8389 () Bool)

(assert (=> b!361287 (= e!221256 tp_is_empty!8389)))

(declare-fun b!361288 () Bool)

(declare-fun res!201001 () Bool)

(assert (=> b!361288 (=> (not res!201001) (not e!221257))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20311 (_ BitVec 32)) Bool)

(assert (=> b!361288 (= res!201001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361289 () Bool)

(declare-fun e!221258 () Bool)

(assert (=> b!361289 (= e!221258 tp_is_empty!8389)))

(declare-fun b!361290 () Bool)

(declare-fun res!201000 () Bool)

(assert (=> b!361290 (=> (not res!201000) (not e!221257))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361290 (= res!201000 (and (= (size!9997 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9996 _keys!1541) (size!9997 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14109 () Bool)

(declare-fun tp!28185 () Bool)

(assert (=> mapNonEmpty!14109 (= mapRes!14109 (and tp!28185 e!221258))))

(declare-fun mapKey!14109 () (_ BitVec 32))

(declare-fun mapRest!14109 () (Array (_ BitVec 32) ValueCell!3851))

(declare-fun mapValue!14109 () ValueCell!3851)

(assert (=> mapNonEmpty!14109 (= (arr!9644 _values!1277) (store mapRest!14109 mapKey!14109 mapValue!14109))))

(declare-fun res!200999 () Bool)

(assert (=> start!35982 (=> (not res!200999) (not e!221257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35982 (= res!200999 (validMask!0 mask!1943))))

(assert (=> start!35982 e!221257))

(assert (=> start!35982 true))

(declare-fun array_inv!7106 (array!20311) Bool)

(assert (=> start!35982 (array_inv!7106 _keys!1541)))

(declare-fun array_inv!7107 (array!20313) Bool)

(assert (=> start!35982 (and (array_inv!7107 _values!1277) e!221260)))

(declare-fun mapIsEmpty!14109 () Bool)

(assert (=> mapIsEmpty!14109 mapRes!14109))

(assert (= (and start!35982 res!200999) b!361290))

(assert (= (and b!361290 res!201000) b!361288))

(assert (= (and b!361288 res!201001) b!361285))

(assert (= (and b!361285 res!201002) b!361284))

(assert (= (and b!361286 condMapEmpty!14109) mapIsEmpty!14109))

(assert (= (and b!361286 (not condMapEmpty!14109)) mapNonEmpty!14109))

(get-info :version)

(assert (= (and mapNonEmpty!14109 ((_ is ValueCellFull!3851) mapValue!14109)) b!361289))

(assert (= (and b!361286 ((_ is ValueCellFull!3851) mapDefault!14109)) b!361287))

(assert (= start!35982 b!361286))

(declare-fun m!357615 () Bool)

(assert (=> b!361285 m!357615))

(declare-fun m!357617 () Bool)

(assert (=> b!361288 m!357617))

(declare-fun m!357619 () Bool)

(assert (=> mapNonEmpty!14109 m!357619))

(declare-fun m!357621 () Bool)

(assert (=> start!35982 m!357621))

(declare-fun m!357623 () Bool)

(assert (=> start!35982 m!357623))

(declare-fun m!357625 () Bool)

(assert (=> start!35982 m!357625))

(check-sat tp_is_empty!8389 (not b!361288) (not b!361285) (not mapNonEmpty!14109) (not start!35982))
(check-sat)
(get-model)

(declare-fun b!361343 () Bool)

(declare-fun e!221300 () Bool)

(declare-fun contains!2416 (List!5478 (_ BitVec 64)) Bool)

(assert (=> b!361343 (= e!221300 (contains!2416 Nil!5475 (select (arr!9643 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71735 () Bool)

(declare-fun res!201033 () Bool)

(declare-fun e!221299 () Bool)

(assert (=> d!71735 (=> res!201033 e!221299)))

(assert (=> d!71735 (= res!201033 (bvsge #b00000000000000000000000000000000 (size!9996 _keys!1541)))))

(assert (=> d!71735 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5475) e!221299)))

(declare-fun b!361344 () Bool)

(declare-fun e!221301 () Bool)

(declare-fun call!27155 () Bool)

(assert (=> b!361344 (= e!221301 call!27155)))

(declare-fun bm!27152 () Bool)

(declare-fun c!53657 () Bool)

(assert (=> bm!27152 (= call!27155 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53657 (Cons!5474 (select (arr!9643 _keys!1541) #b00000000000000000000000000000000) Nil!5475) Nil!5475)))))

(declare-fun b!361345 () Bool)

(declare-fun e!221302 () Bool)

(assert (=> b!361345 (= e!221299 e!221302)))

(declare-fun res!201035 () Bool)

(assert (=> b!361345 (=> (not res!201035) (not e!221302))))

(assert (=> b!361345 (= res!201035 (not e!221300))))

(declare-fun res!201034 () Bool)

(assert (=> b!361345 (=> (not res!201034) (not e!221300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361345 (= res!201034 (validKeyInArray!0 (select (arr!9643 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361346 () Bool)

(assert (=> b!361346 (= e!221301 call!27155)))

(declare-fun b!361347 () Bool)

(assert (=> b!361347 (= e!221302 e!221301)))

(assert (=> b!361347 (= c!53657 (validKeyInArray!0 (select (arr!9643 _keys!1541) #b00000000000000000000000000000000)))))

(assert (= (and d!71735 (not res!201033)) b!361345))

(assert (= (and b!361345 res!201034) b!361343))

(assert (= (and b!361345 res!201035) b!361347))

(assert (= (and b!361347 c!53657) b!361344))

(assert (= (and b!361347 (not c!53657)) b!361346))

(assert (= (or b!361344 b!361346) bm!27152))

(declare-fun m!357651 () Bool)

(assert (=> b!361343 m!357651))

(assert (=> b!361343 m!357651))

(declare-fun m!357653 () Bool)

(assert (=> b!361343 m!357653))

(assert (=> bm!27152 m!357651))

(declare-fun m!357655 () Bool)

(assert (=> bm!27152 m!357655))

(assert (=> b!361345 m!357651))

(assert (=> b!361345 m!357651))

(declare-fun m!357657 () Bool)

(assert (=> b!361345 m!357657))

(assert (=> b!361347 m!357651))

(assert (=> b!361347 m!357651))

(assert (=> b!361347 m!357657))

(assert (=> b!361285 d!71735))

(declare-fun d!71737 () Bool)

(assert (=> d!71737 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35982 d!71737))

(declare-fun d!71739 () Bool)

(assert (=> d!71739 (= (array_inv!7106 _keys!1541) (bvsge (size!9996 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35982 d!71739))

(declare-fun d!71741 () Bool)

(assert (=> d!71741 (= (array_inv!7107 _values!1277) (bvsge (size!9997 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35982 d!71741))

(declare-fun bm!27155 () Bool)

(declare-fun call!27158 () Bool)

(assert (=> bm!27155 (= call!27158 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361356 () Bool)

(declare-fun e!221311 () Bool)

(assert (=> b!361356 (= e!221311 call!27158)))

(declare-fun b!361357 () Bool)

(declare-fun e!221310 () Bool)

(assert (=> b!361357 (= e!221310 e!221311)))

(declare-fun c!53660 () Bool)

(assert (=> b!361357 (= c!53660 (validKeyInArray!0 (select (arr!9643 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71743 () Bool)

(declare-fun res!201041 () Bool)

(assert (=> d!71743 (=> res!201041 e!221310)))

(assert (=> d!71743 (= res!201041 (bvsge #b00000000000000000000000000000000 (size!9996 _keys!1541)))))

(assert (=> d!71743 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221310)))

(declare-fun b!361358 () Bool)

(declare-fun e!221309 () Bool)

(assert (=> b!361358 (= e!221311 e!221309)))

(declare-fun lt!166347 () (_ BitVec 64))

(assert (=> b!361358 (= lt!166347 (select (arr!9643 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11094 0))(
  ( (Unit!11095) )
))
(declare-fun lt!166349 () Unit!11094)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20311 (_ BitVec 64) (_ BitVec 32)) Unit!11094)

(assert (=> b!361358 (= lt!166349 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166347 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361358 (arrayContainsKey!0 _keys!1541 lt!166347 #b00000000000000000000000000000000)))

(declare-fun lt!166348 () Unit!11094)

(assert (=> b!361358 (= lt!166348 lt!166349)))

(declare-fun res!201040 () Bool)

(declare-datatypes ((SeekEntryResult!3491 0))(
  ( (MissingZero!3491 (index!16143 (_ BitVec 32))) (Found!3491 (index!16144 (_ BitVec 32))) (Intermediate!3491 (undefined!4303 Bool) (index!16145 (_ BitVec 32)) (x!36028 (_ BitVec 32))) (Undefined!3491) (MissingVacant!3491 (index!16146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20311 (_ BitVec 32)) SeekEntryResult!3491)

(assert (=> b!361358 (= res!201040 (= (seekEntryOrOpen!0 (select (arr!9643 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3491 #b00000000000000000000000000000000)))))

(assert (=> b!361358 (=> (not res!201040) (not e!221309))))

(declare-fun b!361359 () Bool)

(assert (=> b!361359 (= e!221309 call!27158)))

(assert (= (and d!71743 (not res!201041)) b!361357))

(assert (= (and b!361357 c!53660) b!361358))

(assert (= (and b!361357 (not c!53660)) b!361356))

(assert (= (and b!361358 res!201040) b!361359))

(assert (= (or b!361359 b!361356) bm!27155))

(declare-fun m!357659 () Bool)

(assert (=> bm!27155 m!357659))

(assert (=> b!361357 m!357651))

(assert (=> b!361357 m!357651))

(assert (=> b!361357 m!357657))

(assert (=> b!361358 m!357651))

(declare-fun m!357661 () Bool)

(assert (=> b!361358 m!357661))

(declare-fun m!357663 () Bool)

(assert (=> b!361358 m!357663))

(assert (=> b!361358 m!357651))

(declare-fun m!357665 () Bool)

(assert (=> b!361358 m!357665))

(assert (=> b!361288 d!71743))

(declare-fun mapNonEmpty!14118 () Bool)

(declare-fun mapRes!14118 () Bool)

(declare-fun tp!28194 () Bool)

(declare-fun e!221317 () Bool)

(assert (=> mapNonEmpty!14118 (= mapRes!14118 (and tp!28194 e!221317))))

(declare-fun mapRest!14118 () (Array (_ BitVec 32) ValueCell!3851))

(declare-fun mapKey!14118 () (_ BitVec 32))

(declare-fun mapValue!14118 () ValueCell!3851)

(assert (=> mapNonEmpty!14118 (= mapRest!14109 (store mapRest!14118 mapKey!14118 mapValue!14118))))

(declare-fun b!361367 () Bool)

(declare-fun e!221316 () Bool)

(assert (=> b!361367 (= e!221316 tp_is_empty!8389)))

(declare-fun mapIsEmpty!14118 () Bool)

(assert (=> mapIsEmpty!14118 mapRes!14118))

(declare-fun condMapEmpty!14118 () Bool)

(declare-fun mapDefault!14118 () ValueCell!3851)

(assert (=> mapNonEmpty!14109 (= condMapEmpty!14118 (= mapRest!14109 ((as const (Array (_ BitVec 32) ValueCell!3851)) mapDefault!14118)))))

(assert (=> mapNonEmpty!14109 (= tp!28185 (and e!221316 mapRes!14118))))

(declare-fun b!361366 () Bool)

(assert (=> b!361366 (= e!221317 tp_is_empty!8389)))

(assert (= (and mapNonEmpty!14109 condMapEmpty!14118) mapIsEmpty!14118))

(assert (= (and mapNonEmpty!14109 (not condMapEmpty!14118)) mapNonEmpty!14118))

(assert (= (and mapNonEmpty!14118 ((_ is ValueCellFull!3851) mapValue!14118)) b!361366))

(assert (= (and mapNonEmpty!14109 ((_ is ValueCellFull!3851) mapDefault!14118)) b!361367))

(declare-fun m!357667 () Bool)

(assert (=> mapNonEmpty!14118 m!357667))

(check-sat (not b!361357) (not bm!27152) (not mapNonEmpty!14118) (not b!361345) (not b!361347) (not bm!27155) tp_is_empty!8389 (not b!361343) (not b!361358))
(check-sat)
