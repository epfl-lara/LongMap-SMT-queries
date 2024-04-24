; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7386 () Bool)

(assert start!7386)

(declare-fun b!47304 () Bool)

(declare-fun e!30282 () Bool)

(declare-fun tp_is_empty!2029 () Bool)

(assert (=> b!47304 (= e!30282 tp_is_empty!2029)))

(declare-fun res!27529 () Bool)

(declare-fun e!30283 () Bool)

(assert (=> start!7386 (=> (not res!27529) (not e!30283))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7386 (= res!27529 (validMask!0 mask!2458))))

(assert (=> start!7386 e!30283))

(assert (=> start!7386 true))

(declare-datatypes ((V!2439 0))(
  ( (V!2440 (val!1053 Int)) )
))
(declare-datatypes ((ValueCell!725 0))(
  ( (ValueCellFull!725 (v!2114 V!2439)) (EmptyCell!725) )
))
(declare-datatypes ((array!3110 0))(
  ( (array!3111 (arr!1490 (Array (_ BitVec 32) ValueCell!725)) (size!1712 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3110)

(declare-fun e!30285 () Bool)

(declare-fun array_inv!886 (array!3110) Bool)

(assert (=> start!7386 (and (array_inv!886 _values!1550) e!30285)))

(declare-datatypes ((array!3112 0))(
  ( (array!3113 (arr!1491 (Array (_ BitVec 32) (_ BitVec 64))) (size!1713 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3112)

(declare-fun array_inv!887 (array!3112) Bool)

(assert (=> start!7386 (array_inv!887 _keys!1940)))

(declare-fun b!47305 () Bool)

(declare-fun mapRes!2084 () Bool)

(assert (=> b!47305 (= e!30285 (and e!30282 mapRes!2084))))

(declare-fun condMapEmpty!2084 () Bool)

(declare-fun mapDefault!2084 () ValueCell!725)

(assert (=> b!47305 (= condMapEmpty!2084 (= (arr!1490 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!725)) mapDefault!2084)))))

(declare-fun mapNonEmpty!2084 () Bool)

(declare-fun tp!6233 () Bool)

(declare-fun e!30284 () Bool)

(assert (=> mapNonEmpty!2084 (= mapRes!2084 (and tp!6233 e!30284))))

(declare-fun mapKey!2084 () (_ BitVec 32))

(declare-fun mapValue!2084 () ValueCell!725)

(declare-fun mapRest!2084 () (Array (_ BitVec 32) ValueCell!725))

(assert (=> mapNonEmpty!2084 (= (arr!1490 _values!1550) (store mapRest!2084 mapKey!2084 mapValue!2084))))

(declare-fun b!47306 () Bool)

(declare-fun res!27526 () Bool)

(assert (=> b!47306 (=> (not res!27526) (not e!30283))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47306 (= res!27526 (and (= (size!1712 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1713 _keys!1940) (size!1712 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47307 () Bool)

(declare-fun res!27527 () Bool)

(assert (=> b!47307 (=> (not res!27527) (not e!30283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3112 (_ BitVec 32)) Bool)

(assert (=> b!47307 (= res!27527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47308 () Bool)

(declare-fun e!30281 () Bool)

(declare-datatypes ((List!1243 0))(
  ( (Nil!1240) (Cons!1239 (h!1819 (_ BitVec 64)) (t!4271 List!1243)) )
))
(declare-fun contains!575 (List!1243 (_ BitVec 64)) Bool)

(assert (=> b!47308 (= e!30281 (contains!575 Nil!1240 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47309 () Bool)

(assert (=> b!47309 (= e!30283 e!30281)))

(declare-fun res!27525 () Bool)

(assert (=> b!47309 (=> res!27525 e!30281)))

(assert (=> b!47309 (= res!27525 (contains!575 Nil!1240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!2084 () Bool)

(assert (=> mapIsEmpty!2084 mapRes!2084))

(declare-fun b!47310 () Bool)

(declare-fun res!27530 () Bool)

(assert (=> b!47310 (=> (not res!27530) (not e!30283))))

(assert (=> b!47310 (= res!27530 (and (bvsle #b00000000000000000000000000000000 (size!1713 _keys!1940)) (bvslt (size!1713 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun b!47311 () Bool)

(declare-fun res!27528 () Bool)

(assert (=> b!47311 (=> (not res!27528) (not e!30283))))

(declare-fun noDuplicate!34 (List!1243) Bool)

(assert (=> b!47311 (= res!27528 (noDuplicate!34 Nil!1240))))

(declare-fun b!47312 () Bool)

(assert (=> b!47312 (= e!30284 tp_is_empty!2029)))

(assert (= (and start!7386 res!27529) b!47306))

(assert (= (and b!47306 res!27526) b!47307))

(assert (= (and b!47307 res!27527) b!47310))

(assert (= (and b!47310 res!27530) b!47311))

(assert (= (and b!47311 res!27528) b!47309))

(assert (= (and b!47309 (not res!27525)) b!47308))

(assert (= (and b!47305 condMapEmpty!2084) mapIsEmpty!2084))

(assert (= (and b!47305 (not condMapEmpty!2084)) mapNonEmpty!2084))

(get-info :version)

(assert (= (and mapNonEmpty!2084 ((_ is ValueCellFull!725) mapValue!2084)) b!47312))

(assert (= (and b!47305 ((_ is ValueCellFull!725) mapDefault!2084)) b!47304))

(assert (= start!7386 b!47305))

(declare-fun m!41477 () Bool)

(assert (=> b!47309 m!41477))

(declare-fun m!41479 () Bool)

(assert (=> start!7386 m!41479))

(declare-fun m!41481 () Bool)

(assert (=> start!7386 m!41481))

(declare-fun m!41483 () Bool)

(assert (=> start!7386 m!41483))

(declare-fun m!41485 () Bool)

(assert (=> b!47311 m!41485))

(declare-fun m!41487 () Bool)

(assert (=> b!47307 m!41487))

(declare-fun m!41489 () Bool)

(assert (=> b!47308 m!41489))

(declare-fun m!41491 () Bool)

(assert (=> mapNonEmpty!2084 m!41491))

(check-sat (not b!47308) (not start!7386) tp_is_empty!2029 (not b!47307) (not b!47311) (not mapNonEmpty!2084) (not b!47309))
(check-sat)
(get-model)

(declare-fun b!47375 () Bool)

(declare-fun e!30329 () Bool)

(declare-fun call!3707 () Bool)

(assert (=> b!47375 (= e!30329 call!3707)))

(declare-fun b!47376 () Bool)

(declare-fun e!30330 () Bool)

(assert (=> b!47376 (= e!30330 e!30329)))

(declare-fun lt!20372 () (_ BitVec 64))

(assert (=> b!47376 (= lt!20372 (select (arr!1491 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1344 0))(
  ( (Unit!1345) )
))
(declare-fun lt!20371 () Unit!1344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3112 (_ BitVec 64) (_ BitVec 32)) Unit!1344)

(assert (=> b!47376 (= lt!20371 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20372 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47376 (arrayContainsKey!0 _keys!1940 lt!20372 #b00000000000000000000000000000000)))

(declare-fun lt!20373 () Unit!1344)

(assert (=> b!47376 (= lt!20373 lt!20371)))

(declare-fun res!27572 () Bool)

(declare-datatypes ((SeekEntryResult!202 0))(
  ( (MissingZero!202 (index!2930 (_ BitVec 32))) (Found!202 (index!2931 (_ BitVec 32))) (Intermediate!202 (undefined!1014 Bool) (index!2932 (_ BitVec 32)) (x!8742 (_ BitVec 32))) (Undefined!202) (MissingVacant!202 (index!2933 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3112 (_ BitVec 32)) SeekEntryResult!202)

(assert (=> b!47376 (= res!27572 (= (seekEntryOrOpen!0 (select (arr!1491 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!202 #b00000000000000000000000000000000)))))

(assert (=> b!47376 (=> (not res!27572) (not e!30329))))

(declare-fun d!9435 () Bool)

(declare-fun res!27571 () Bool)

(declare-fun e!30331 () Bool)

(assert (=> d!9435 (=> res!27571 e!30331)))

(assert (=> d!9435 (= res!27571 (bvsge #b00000000000000000000000000000000 (size!1713 _keys!1940)))))

(assert (=> d!9435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30331)))

(declare-fun bm!3704 () Bool)

(assert (=> bm!3704 (= call!3707 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(declare-fun b!47377 () Bool)

(assert (=> b!47377 (= e!30330 call!3707)))

(declare-fun b!47378 () Bool)

(assert (=> b!47378 (= e!30331 e!30330)))

(declare-fun c!6392 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47378 (= c!6392 (validKeyInArray!0 (select (arr!1491 _keys!1940) #b00000000000000000000000000000000)))))

(assert (= (and d!9435 (not res!27571)) b!47378))

(assert (= (and b!47378 c!6392) b!47376))

(assert (= (and b!47378 (not c!6392)) b!47377))

(assert (= (and b!47376 res!27572) b!47375))

(assert (= (or b!47375 b!47377) bm!3704))

(declare-fun m!41525 () Bool)

(assert (=> b!47376 m!41525))

(declare-fun m!41527 () Bool)

(assert (=> b!47376 m!41527))

(declare-fun m!41529 () Bool)

(assert (=> b!47376 m!41529))

(assert (=> b!47376 m!41525))

(declare-fun m!41531 () Bool)

(assert (=> b!47376 m!41531))

(declare-fun m!41533 () Bool)

(assert (=> bm!3704 m!41533))

(assert (=> b!47378 m!41525))

(assert (=> b!47378 m!41525))

(declare-fun m!41535 () Bool)

(assert (=> b!47378 m!41535))

(assert (=> b!47307 d!9435))

(declare-fun d!9437 () Bool)

(declare-fun lt!20376 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!46 (List!1243) (InoxSet (_ BitVec 64)))

(assert (=> d!9437 (= lt!20376 (select (content!46 Nil!1240) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30336 () Bool)

(assert (=> d!9437 (= lt!20376 e!30336)))

(declare-fun res!27578 () Bool)

(assert (=> d!9437 (=> (not res!27578) (not e!30336))))

(assert (=> d!9437 (= res!27578 ((_ is Cons!1239) Nil!1240))))

(assert (=> d!9437 (= (contains!575 Nil!1240 #b1000000000000000000000000000000000000000000000000000000000000000) lt!20376)))

(declare-fun b!47383 () Bool)

(declare-fun e!30337 () Bool)

(assert (=> b!47383 (= e!30336 e!30337)))

(declare-fun res!27577 () Bool)

(assert (=> b!47383 (=> res!27577 e!30337)))

(assert (=> b!47383 (= res!27577 (= (h!1819 Nil!1240) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47384 () Bool)

(assert (=> b!47384 (= e!30337 (contains!575 (t!4271 Nil!1240) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!9437 res!27578) b!47383))

(assert (= (and b!47383 (not res!27577)) b!47384))

(declare-fun m!41537 () Bool)

(assert (=> d!9437 m!41537))

(declare-fun m!41539 () Bool)

(assert (=> d!9437 m!41539))

(declare-fun m!41541 () Bool)

(assert (=> b!47384 m!41541))

(assert (=> b!47308 d!9437))

(declare-fun d!9439 () Bool)

(declare-fun res!27583 () Bool)

(declare-fun e!30342 () Bool)

(assert (=> d!9439 (=> res!27583 e!30342)))

(assert (=> d!9439 (= res!27583 ((_ is Nil!1240) Nil!1240))))

(assert (=> d!9439 (= (noDuplicate!34 Nil!1240) e!30342)))

(declare-fun b!47389 () Bool)

(declare-fun e!30343 () Bool)

(assert (=> b!47389 (= e!30342 e!30343)))

(declare-fun res!27584 () Bool)

(assert (=> b!47389 (=> (not res!27584) (not e!30343))))

(assert (=> b!47389 (= res!27584 (not (contains!575 (t!4271 Nil!1240) (h!1819 Nil!1240))))))

(declare-fun b!47390 () Bool)

(assert (=> b!47390 (= e!30343 (noDuplicate!34 (t!4271 Nil!1240)))))

(assert (= (and d!9439 (not res!27583)) b!47389))

(assert (= (and b!47389 res!27584) b!47390))

(declare-fun m!41543 () Bool)

(assert (=> b!47389 m!41543))

(declare-fun m!41545 () Bool)

(assert (=> b!47390 m!41545))

(assert (=> b!47311 d!9439))

(declare-fun d!9441 () Bool)

(assert (=> d!9441 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7386 d!9441))

(declare-fun d!9443 () Bool)

(assert (=> d!9443 (= (array_inv!886 _values!1550) (bvsge (size!1712 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7386 d!9443))

(declare-fun d!9445 () Bool)

(assert (=> d!9445 (= (array_inv!887 _keys!1940) (bvsge (size!1713 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7386 d!9445))

(declare-fun d!9447 () Bool)

(declare-fun lt!20377 () Bool)

(assert (=> d!9447 (= lt!20377 (select (content!46 Nil!1240) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30344 () Bool)

(assert (=> d!9447 (= lt!20377 e!30344)))

(declare-fun res!27586 () Bool)

(assert (=> d!9447 (=> (not res!27586) (not e!30344))))

(assert (=> d!9447 (= res!27586 ((_ is Cons!1239) Nil!1240))))

(assert (=> d!9447 (= (contains!575 Nil!1240 #b0000000000000000000000000000000000000000000000000000000000000000) lt!20377)))

(declare-fun b!47391 () Bool)

(declare-fun e!30345 () Bool)

(assert (=> b!47391 (= e!30344 e!30345)))

(declare-fun res!27585 () Bool)

(assert (=> b!47391 (=> res!27585 e!30345)))

(assert (=> b!47391 (= res!27585 (= (h!1819 Nil!1240) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47392 () Bool)

(assert (=> b!47392 (= e!30345 (contains!575 (t!4271 Nil!1240) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!9447 res!27586) b!47391))

(assert (= (and b!47391 (not res!27585)) b!47392))

(assert (=> d!9447 m!41537))

(declare-fun m!41547 () Bool)

(assert (=> d!9447 m!41547))

(declare-fun m!41549 () Bool)

(assert (=> b!47392 m!41549))

(assert (=> b!47309 d!9447))

(declare-fun mapIsEmpty!2093 () Bool)

(declare-fun mapRes!2093 () Bool)

(assert (=> mapIsEmpty!2093 mapRes!2093))

(declare-fun mapNonEmpty!2093 () Bool)

(declare-fun tp!6242 () Bool)

(declare-fun e!30350 () Bool)

(assert (=> mapNonEmpty!2093 (= mapRes!2093 (and tp!6242 e!30350))))

(declare-fun mapRest!2093 () (Array (_ BitVec 32) ValueCell!725))

(declare-fun mapValue!2093 () ValueCell!725)

(declare-fun mapKey!2093 () (_ BitVec 32))

(assert (=> mapNonEmpty!2093 (= mapRest!2084 (store mapRest!2093 mapKey!2093 mapValue!2093))))

(declare-fun b!47400 () Bool)

(declare-fun e!30351 () Bool)

(assert (=> b!47400 (= e!30351 tp_is_empty!2029)))

(declare-fun condMapEmpty!2093 () Bool)

(declare-fun mapDefault!2093 () ValueCell!725)

(assert (=> mapNonEmpty!2084 (= condMapEmpty!2093 (= mapRest!2084 ((as const (Array (_ BitVec 32) ValueCell!725)) mapDefault!2093)))))

(assert (=> mapNonEmpty!2084 (= tp!6233 (and e!30351 mapRes!2093))))

(declare-fun b!47399 () Bool)

(assert (=> b!47399 (= e!30350 tp_is_empty!2029)))

(assert (= (and mapNonEmpty!2084 condMapEmpty!2093) mapIsEmpty!2093))

(assert (= (and mapNonEmpty!2084 (not condMapEmpty!2093)) mapNonEmpty!2093))

(assert (= (and mapNonEmpty!2093 ((_ is ValueCellFull!725) mapValue!2093)) b!47399))

(assert (= (and mapNonEmpty!2084 ((_ is ValueCellFull!725) mapDefault!2093)) b!47400))

(declare-fun m!41551 () Bool)

(assert (=> mapNonEmpty!2093 m!41551))

(check-sat (not b!47384) (not b!47389) (not b!47376) (not bm!3704) (not d!9447) (not b!47378) (not d!9437) (not b!47390) (not mapNonEmpty!2093) tp_is_empty!2029 (not b!47392))
(check-sat)
