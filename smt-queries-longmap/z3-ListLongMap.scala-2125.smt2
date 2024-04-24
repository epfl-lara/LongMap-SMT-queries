; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35952 () Bool)

(assert start!35952)

(declare-fun b!361287 () Bool)

(declare-fun res!201004 () Bool)

(declare-fun e!221231 () Bool)

(assert (=> b!361287 (=> (not res!201004) (not e!221231))))

(declare-datatypes ((array!20278 0))(
  ( (array!20279 (arr!9627 (Array (_ BitVec 32) (_ BitVec 64))) (size!9979 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20278)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20278 (_ BitVec 32)) Bool)

(assert (=> b!361287 (= res!201004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361288 () Bool)

(declare-fun e!221228 () Bool)

(assert (=> b!361288 (= e!221231 e!221228)))

(declare-fun res!201006 () Bool)

(assert (=> b!361288 (=> res!201006 e!221228)))

(declare-datatypes ((List!5415 0))(
  ( (Nil!5412) (Cons!5411 (h!6267 (_ BitVec 64)) (t!10557 List!5415)) )
))
(declare-fun contains!2405 (List!5415 (_ BitVec 64)) Bool)

(assert (=> b!361288 (= res!201006 (contains!2405 Nil!5412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361289 () Bool)

(declare-fun e!221230 () Bool)

(declare-fun e!221229 () Bool)

(declare-fun mapRes!14079 () Bool)

(assert (=> b!361289 (= e!221230 (and e!221229 mapRes!14079))))

(declare-fun condMapEmpty!14079 () Bool)

(declare-datatypes ((V!12139 0))(
  ( (V!12140 (val!4230 Int)) )
))
(declare-datatypes ((ValueCell!3842 0))(
  ( (ValueCellFull!3842 (v!6425 V!12139)) (EmptyCell!3842) )
))
(declare-datatypes ((array!20280 0))(
  ( (array!20281 (arr!9628 (Array (_ BitVec 32) ValueCell!3842)) (size!9980 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20280)

(declare-fun mapDefault!14079 () ValueCell!3842)

(assert (=> b!361289 (= condMapEmpty!14079 (= (arr!9628 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3842)) mapDefault!14079)))))

(declare-fun res!201002 () Bool)

(assert (=> start!35952 (=> (not res!201002) (not e!221231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35952 (= res!201002 (validMask!0 mask!1943))))

(assert (=> start!35952 e!221231))

(assert (=> start!35952 true))

(declare-fun array_inv!7110 (array!20280) Bool)

(assert (=> start!35952 (and (array_inv!7110 _values!1277) e!221230)))

(declare-fun array_inv!7111 (array!20278) Bool)

(assert (=> start!35952 (array_inv!7111 _keys!1541)))

(declare-fun b!361290 () Bool)

(declare-fun res!201005 () Bool)

(assert (=> b!361290 (=> (not res!201005) (not e!221231))))

(declare-fun noDuplicate!186 (List!5415) Bool)

(assert (=> b!361290 (= res!201005 (noDuplicate!186 Nil!5412))))

(declare-fun b!361291 () Bool)

(assert (=> b!361291 (= e!221228 (contains!2405 Nil!5412 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361292 () Bool)

(declare-fun e!221227 () Bool)

(declare-fun tp_is_empty!8371 () Bool)

(assert (=> b!361292 (= e!221227 tp_is_empty!8371)))

(declare-fun b!361293 () Bool)

(declare-fun res!201001 () Bool)

(assert (=> b!361293 (=> (not res!201001) (not e!221231))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361293 (= res!201001 (and (= (size!9980 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9979 _keys!1541) (size!9980 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361294 () Bool)

(declare-fun res!201003 () Bool)

(assert (=> b!361294 (=> (not res!201003) (not e!221231))))

(assert (=> b!361294 (= res!201003 (and (bvsle #b00000000000000000000000000000000 (size!9979 _keys!1541)) (bvslt (size!9979 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!14079 () Bool)

(declare-fun tp!28155 () Bool)

(assert (=> mapNonEmpty!14079 (= mapRes!14079 (and tp!28155 e!221227))))

(declare-fun mapValue!14079 () ValueCell!3842)

(declare-fun mapRest!14079 () (Array (_ BitVec 32) ValueCell!3842))

(declare-fun mapKey!14079 () (_ BitVec 32))

(assert (=> mapNonEmpty!14079 (= (arr!9628 _values!1277) (store mapRest!14079 mapKey!14079 mapValue!14079))))

(declare-fun mapIsEmpty!14079 () Bool)

(assert (=> mapIsEmpty!14079 mapRes!14079))

(declare-fun b!361295 () Bool)

(assert (=> b!361295 (= e!221229 tp_is_empty!8371)))

(assert (= (and start!35952 res!201002) b!361293))

(assert (= (and b!361293 res!201001) b!361287))

(assert (= (and b!361287 res!201004) b!361294))

(assert (= (and b!361294 res!201003) b!361290))

(assert (= (and b!361290 res!201005) b!361288))

(assert (= (and b!361288 (not res!201006)) b!361291))

(assert (= (and b!361289 condMapEmpty!14079) mapIsEmpty!14079))

(assert (= (and b!361289 (not condMapEmpty!14079)) mapNonEmpty!14079))

(get-info :version)

(assert (= (and mapNonEmpty!14079 ((_ is ValueCellFull!3842) mapValue!14079)) b!361292))

(assert (= (and b!361289 ((_ is ValueCellFull!3842) mapDefault!14079)) b!361295))

(assert (= start!35952 b!361289))

(declare-fun m!358421 () Bool)

(assert (=> mapNonEmpty!14079 m!358421))

(declare-fun m!358423 () Bool)

(assert (=> b!361287 m!358423))

(declare-fun m!358425 () Bool)

(assert (=> b!361290 m!358425))

(declare-fun m!358427 () Bool)

(assert (=> b!361288 m!358427))

(declare-fun m!358429 () Bool)

(assert (=> b!361291 m!358429))

(declare-fun m!358431 () Bool)

(assert (=> start!35952 m!358431))

(declare-fun m!358433 () Bool)

(assert (=> start!35952 m!358433))

(declare-fun m!358435 () Bool)

(assert (=> start!35952 m!358435))

(check-sat (not b!361291) tp_is_empty!8371 (not b!361290) (not b!361288) (not mapNonEmpty!14079) (not b!361287) (not start!35952))
(check-sat)
(get-model)

(declare-fun b!361358 () Bool)

(declare-fun e!221276 () Bool)

(declare-fun call!27164 () Bool)

(assert (=> b!361358 (= e!221276 call!27164)))

(declare-fun b!361359 () Bool)

(declare-fun e!221277 () Bool)

(assert (=> b!361359 (= e!221277 call!27164)))

(declare-fun b!361360 () Bool)

(assert (=> b!361360 (= e!221277 e!221276)))

(declare-fun lt!166569 () (_ BitVec 64))

(assert (=> b!361360 (= lt!166569 (select (arr!9627 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11103 0))(
  ( (Unit!11104) )
))
(declare-fun lt!166570 () Unit!11103)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20278 (_ BitVec 64) (_ BitVec 32)) Unit!11103)

(assert (=> b!361360 (= lt!166570 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166569 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361360 (arrayContainsKey!0 _keys!1541 lt!166569 #b00000000000000000000000000000000)))

(declare-fun lt!166571 () Unit!11103)

(assert (=> b!361360 (= lt!166571 lt!166570)))

(declare-fun res!201048 () Bool)

(declare-datatypes ((SeekEntryResult!3444 0))(
  ( (MissingZero!3444 (index!15955 (_ BitVec 32))) (Found!3444 (index!15956 (_ BitVec 32))) (Intermediate!3444 (undefined!4256 Bool) (index!15957 (_ BitVec 32)) (x!35957 (_ BitVec 32))) (Undefined!3444) (MissingVacant!3444 (index!15958 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20278 (_ BitVec 32)) SeekEntryResult!3444)

(assert (=> b!361360 (= res!201048 (= (seekEntryOrOpen!0 (select (arr!9627 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3444 #b00000000000000000000000000000000)))))

(assert (=> b!361360 (=> (not res!201048) (not e!221276))))

(declare-fun d!71949 () Bool)

(declare-fun res!201047 () Bool)

(declare-fun e!221275 () Bool)

(assert (=> d!71949 (=> res!201047 e!221275)))

(assert (=> d!71949 (= res!201047 (bvsge #b00000000000000000000000000000000 (size!9979 _keys!1541)))))

(assert (=> d!71949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221275)))

(declare-fun bm!27161 () Bool)

(assert (=> bm!27161 (= call!27164 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361361 () Bool)

(assert (=> b!361361 (= e!221275 e!221277)))

(declare-fun c!53702 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361361 (= c!53702 (validKeyInArray!0 (select (arr!9627 _keys!1541) #b00000000000000000000000000000000)))))

(assert (= (and d!71949 (not res!201047)) b!361361))

(assert (= (and b!361361 c!53702) b!361360))

(assert (= (and b!361361 (not c!53702)) b!361359))

(assert (= (and b!361360 res!201048) b!361358))

(assert (= (or b!361358 b!361359) bm!27161))

(declare-fun m!358469 () Bool)

(assert (=> b!361360 m!358469))

(declare-fun m!358471 () Bool)

(assert (=> b!361360 m!358471))

(declare-fun m!358473 () Bool)

(assert (=> b!361360 m!358473))

(assert (=> b!361360 m!358469))

(declare-fun m!358475 () Bool)

(assert (=> b!361360 m!358475))

(declare-fun m!358477 () Bool)

(assert (=> bm!27161 m!358477))

(assert (=> b!361361 m!358469))

(assert (=> b!361361 m!358469))

(declare-fun m!358479 () Bool)

(assert (=> b!361361 m!358479))

(assert (=> b!361287 d!71949))

(declare-fun d!71951 () Bool)

(declare-fun lt!166574 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!200 (List!5415) (InoxSet (_ BitVec 64)))

(assert (=> d!71951 (= lt!166574 (select (content!200 Nil!5412) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!221283 () Bool)

(assert (=> d!71951 (= lt!166574 e!221283)))

(declare-fun res!201053 () Bool)

(assert (=> d!71951 (=> (not res!201053) (not e!221283))))

(assert (=> d!71951 (= res!201053 ((_ is Cons!5411) Nil!5412))))

(assert (=> d!71951 (= (contains!2405 Nil!5412 #b1000000000000000000000000000000000000000000000000000000000000000) lt!166574)))

(declare-fun b!361366 () Bool)

(declare-fun e!221282 () Bool)

(assert (=> b!361366 (= e!221283 e!221282)))

(declare-fun res!201054 () Bool)

(assert (=> b!361366 (=> res!201054 e!221282)))

(assert (=> b!361366 (= res!201054 (= (h!6267 Nil!5412) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361367 () Bool)

(assert (=> b!361367 (= e!221282 (contains!2405 (t!10557 Nil!5412) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71951 res!201053) b!361366))

(assert (= (and b!361366 (not res!201054)) b!361367))

(declare-fun m!358481 () Bool)

(assert (=> d!71951 m!358481))

(declare-fun m!358483 () Bool)

(assert (=> d!71951 m!358483))

(declare-fun m!358485 () Bool)

(assert (=> b!361367 m!358485))

(assert (=> b!361291 d!71951))

(declare-fun d!71953 () Bool)

(declare-fun res!201059 () Bool)

(declare-fun e!221288 () Bool)

(assert (=> d!71953 (=> res!201059 e!221288)))

(assert (=> d!71953 (= res!201059 ((_ is Nil!5412) Nil!5412))))

(assert (=> d!71953 (= (noDuplicate!186 Nil!5412) e!221288)))

(declare-fun b!361372 () Bool)

(declare-fun e!221289 () Bool)

(assert (=> b!361372 (= e!221288 e!221289)))

(declare-fun res!201060 () Bool)

(assert (=> b!361372 (=> (not res!201060) (not e!221289))))

(assert (=> b!361372 (= res!201060 (not (contains!2405 (t!10557 Nil!5412) (h!6267 Nil!5412))))))

(declare-fun b!361373 () Bool)

(assert (=> b!361373 (= e!221289 (noDuplicate!186 (t!10557 Nil!5412)))))

(assert (= (and d!71953 (not res!201059)) b!361372))

(assert (= (and b!361372 res!201060) b!361373))

(declare-fun m!358487 () Bool)

(assert (=> b!361372 m!358487))

(declare-fun m!358489 () Bool)

(assert (=> b!361373 m!358489))

(assert (=> b!361290 d!71953))

(declare-fun d!71955 () Bool)

(assert (=> d!71955 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35952 d!71955))

(declare-fun d!71957 () Bool)

(assert (=> d!71957 (= (array_inv!7110 _values!1277) (bvsge (size!9980 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35952 d!71957))

(declare-fun d!71959 () Bool)

(assert (=> d!71959 (= (array_inv!7111 _keys!1541) (bvsge (size!9979 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35952 d!71959))

(declare-fun d!71961 () Bool)

(declare-fun lt!166575 () Bool)

(assert (=> d!71961 (= lt!166575 (select (content!200 Nil!5412) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!221291 () Bool)

(assert (=> d!71961 (= lt!166575 e!221291)))

(declare-fun res!201061 () Bool)

(assert (=> d!71961 (=> (not res!201061) (not e!221291))))

(assert (=> d!71961 (= res!201061 ((_ is Cons!5411) Nil!5412))))

(assert (=> d!71961 (= (contains!2405 Nil!5412 #b0000000000000000000000000000000000000000000000000000000000000000) lt!166575)))

(declare-fun b!361374 () Bool)

(declare-fun e!221290 () Bool)

(assert (=> b!361374 (= e!221291 e!221290)))

(declare-fun res!201062 () Bool)

(assert (=> b!361374 (=> res!201062 e!221290)))

(assert (=> b!361374 (= res!201062 (= (h!6267 Nil!5412) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361375 () Bool)

(assert (=> b!361375 (= e!221290 (contains!2405 (t!10557 Nil!5412) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71961 res!201061) b!361374))

(assert (= (and b!361374 (not res!201062)) b!361375))

(assert (=> d!71961 m!358481))

(declare-fun m!358491 () Bool)

(assert (=> d!71961 m!358491))

(declare-fun m!358493 () Bool)

(assert (=> b!361375 m!358493))

(assert (=> b!361288 d!71961))

(declare-fun condMapEmpty!14088 () Bool)

(declare-fun mapDefault!14088 () ValueCell!3842)

(assert (=> mapNonEmpty!14079 (= condMapEmpty!14088 (= mapRest!14079 ((as const (Array (_ BitVec 32) ValueCell!3842)) mapDefault!14088)))))

(declare-fun e!221296 () Bool)

(declare-fun mapRes!14088 () Bool)

(assert (=> mapNonEmpty!14079 (= tp!28155 (and e!221296 mapRes!14088))))

(declare-fun b!361382 () Bool)

(declare-fun e!221297 () Bool)

(assert (=> b!361382 (= e!221297 tp_is_empty!8371)))

(declare-fun b!361383 () Bool)

(assert (=> b!361383 (= e!221296 tp_is_empty!8371)))

(declare-fun mapNonEmpty!14088 () Bool)

(declare-fun tp!28164 () Bool)

(assert (=> mapNonEmpty!14088 (= mapRes!14088 (and tp!28164 e!221297))))

(declare-fun mapValue!14088 () ValueCell!3842)

(declare-fun mapRest!14088 () (Array (_ BitVec 32) ValueCell!3842))

(declare-fun mapKey!14088 () (_ BitVec 32))

(assert (=> mapNonEmpty!14088 (= mapRest!14079 (store mapRest!14088 mapKey!14088 mapValue!14088))))

(declare-fun mapIsEmpty!14088 () Bool)

(assert (=> mapIsEmpty!14088 mapRes!14088))

(assert (= (and mapNonEmpty!14079 condMapEmpty!14088) mapIsEmpty!14088))

(assert (= (and mapNonEmpty!14079 (not condMapEmpty!14088)) mapNonEmpty!14088))

(assert (= (and mapNonEmpty!14088 ((_ is ValueCellFull!3842) mapValue!14088)) b!361382))

(assert (= (and mapNonEmpty!14079 ((_ is ValueCellFull!3842) mapDefault!14088)) b!361383))

(declare-fun m!358495 () Bool)

(assert (=> mapNonEmpty!14088 m!358495))

(check-sat (not d!71951) (not b!361360) (not b!361367) (not bm!27161) (not b!361375) (not b!361361) (not d!71961) tp_is_empty!8371 (not b!361372) (not mapNonEmpty!14088) (not b!361373))
(check-sat)
