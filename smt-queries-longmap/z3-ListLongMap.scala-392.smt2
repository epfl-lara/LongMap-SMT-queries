; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7382 () Bool)

(assert start!7382)

(declare-fun mapIsEmpty!2084 () Bool)

(declare-fun mapRes!2084 () Bool)

(assert (=> mapIsEmpty!2084 mapRes!2084))

(declare-fun b!47295 () Bool)

(declare-fun e!30278 () Bool)

(declare-fun tp_is_empty!2029 () Bool)

(assert (=> b!47295 (= e!30278 tp_is_empty!2029)))

(declare-fun b!47296 () Bool)

(declare-fun e!30279 () Bool)

(declare-datatypes ((List!1251 0))(
  ( (Nil!1248) (Cons!1247 (h!1827 (_ BitVec 64)) (t!4278 List!1251)) )
))
(declare-fun contains!582 (List!1251 (_ BitVec 64)) Bool)

(assert (=> b!47296 (= e!30279 (contains!582 Nil!1248 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47297 () Bool)

(declare-fun res!27534 () Bool)

(declare-fun e!30277 () Bool)

(assert (=> b!47297 (=> (not res!27534) (not e!30277))))

(declare-datatypes ((array!3100 0))(
  ( (array!3101 (arr!1485 (Array (_ BitVec 32) (_ BitVec 64))) (size!1708 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3100)

(assert (=> b!47297 (= res!27534 (and (bvsle #b00000000000000000000000000000000 (size!1708 _keys!1940)) (bvslt (size!1708 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!2084 () Bool)

(declare-fun tp!6233 () Bool)

(declare-fun e!30276 () Bool)

(assert (=> mapNonEmpty!2084 (= mapRes!2084 (and tp!6233 e!30276))))

(declare-datatypes ((V!2439 0))(
  ( (V!2440 (val!1053 Int)) )
))
(declare-datatypes ((ValueCell!725 0))(
  ( (ValueCellFull!725 (v!2111 V!2439)) (EmptyCell!725) )
))
(declare-fun mapValue!2084 () ValueCell!725)

(declare-fun mapRest!2084 () (Array (_ BitVec 32) ValueCell!725))

(declare-fun mapKey!2084 () (_ BitVec 32))

(declare-datatypes ((array!3102 0))(
  ( (array!3103 (arr!1486 (Array (_ BitVec 32) ValueCell!725)) (size!1709 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3102)

(assert (=> mapNonEmpty!2084 (= (arr!1486 _values!1550) (store mapRest!2084 mapKey!2084 mapValue!2084))))

(declare-fun b!47299 () Bool)

(declare-fun res!27535 () Bool)

(assert (=> b!47299 (=> (not res!27535) (not e!30277))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3100 (_ BitVec 32)) Bool)

(assert (=> b!47299 (= res!27535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47300 () Bool)

(assert (=> b!47300 (= e!30277 e!30279)))

(declare-fun res!27531 () Bool)

(assert (=> b!47300 (=> res!27531 e!30279)))

(assert (=> b!47300 (= res!27531 (contains!582 Nil!1248 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47301 () Bool)

(declare-fun res!27532 () Bool)

(assert (=> b!47301 (=> (not res!27532) (not e!30277))))

(declare-fun noDuplicate!37 (List!1251) Bool)

(assert (=> b!47301 (= res!27532 (noDuplicate!37 Nil!1248))))

(declare-fun b!47302 () Bool)

(assert (=> b!47302 (= e!30276 tp_is_empty!2029)))

(declare-fun b!47303 () Bool)

(declare-fun res!27533 () Bool)

(assert (=> b!47303 (=> (not res!27533) (not e!30277))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47303 (= res!27533 (and (= (size!1709 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1708 _keys!1940) (size!1709 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47298 () Bool)

(declare-fun e!30275 () Bool)

(assert (=> b!47298 (= e!30275 (and e!30278 mapRes!2084))))

(declare-fun condMapEmpty!2084 () Bool)

(declare-fun mapDefault!2084 () ValueCell!725)

(assert (=> b!47298 (= condMapEmpty!2084 (= (arr!1486 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!725)) mapDefault!2084)))))

(declare-fun res!27530 () Bool)

(assert (=> start!7382 (=> (not res!27530) (not e!30277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7382 (= res!27530 (validMask!0 mask!2458))))

(assert (=> start!7382 e!30277))

(assert (=> start!7382 true))

(declare-fun array_inv!898 (array!3102) Bool)

(assert (=> start!7382 (and (array_inv!898 _values!1550) e!30275)))

(declare-fun array_inv!899 (array!3100) Bool)

(assert (=> start!7382 (array_inv!899 _keys!1940)))

(assert (= (and start!7382 res!27530) b!47303))

(assert (= (and b!47303 res!27533) b!47299))

(assert (= (and b!47299 res!27535) b!47297))

(assert (= (and b!47297 res!27534) b!47301))

(assert (= (and b!47301 res!27532) b!47300))

(assert (= (and b!47300 (not res!27531)) b!47296))

(assert (= (and b!47298 condMapEmpty!2084) mapIsEmpty!2084))

(assert (= (and b!47298 (not condMapEmpty!2084)) mapNonEmpty!2084))

(get-info :version)

(assert (= (and mapNonEmpty!2084 ((_ is ValueCellFull!725) mapValue!2084)) b!47302))

(assert (= (and b!47298 ((_ is ValueCellFull!725) mapDefault!2084)) b!47295))

(assert (= start!7382 b!47298))

(declare-fun m!41519 () Bool)

(assert (=> b!47300 m!41519))

(declare-fun m!41521 () Bool)

(assert (=> b!47299 m!41521))

(declare-fun m!41523 () Bool)

(assert (=> b!47296 m!41523))

(declare-fun m!41525 () Bool)

(assert (=> start!7382 m!41525))

(declare-fun m!41527 () Bool)

(assert (=> start!7382 m!41527))

(declare-fun m!41529 () Bool)

(assert (=> start!7382 m!41529))

(declare-fun m!41531 () Bool)

(assert (=> mapNonEmpty!2084 m!41531))

(declare-fun m!41533 () Bool)

(assert (=> b!47301 m!41533))

(check-sat (not b!47300) (not b!47296) (not b!47299) tp_is_empty!2029 (not start!7382) (not mapNonEmpty!2084) (not b!47301))
(check-sat)
(get-model)

(declare-fun b!47366 () Bool)

(declare-fun e!30324 () Bool)

(declare-fun call!3720 () Bool)

(assert (=> b!47366 (= e!30324 call!3720)))

(declare-fun b!47367 () Bool)

(declare-fun e!30325 () Bool)

(assert (=> b!47367 (= e!30325 e!30324)))

(declare-fun c!6385 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47367 (= c!6385 (validKeyInArray!0 (select (arr!1485 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun bm!3717 () Bool)

(assert (=> bm!3717 (= call!3720 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(declare-fun d!9421 () Bool)

(declare-fun res!27577 () Bool)

(assert (=> d!9421 (=> res!27577 e!30325)))

(assert (=> d!9421 (= res!27577 (bvsge #b00000000000000000000000000000000 (size!1708 _keys!1940)))))

(assert (=> d!9421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30325)))

(declare-fun b!47368 () Bool)

(declare-fun e!30323 () Bool)

(assert (=> b!47368 (= e!30323 call!3720)))

(declare-fun b!47369 () Bool)

(assert (=> b!47369 (= e!30324 e!30323)))

(declare-fun lt!20398 () (_ BitVec 64))

(assert (=> b!47369 (= lt!20398 (select (arr!1485 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1338 0))(
  ( (Unit!1339) )
))
(declare-fun lt!20400 () Unit!1338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3100 (_ BitVec 64) (_ BitVec 32)) Unit!1338)

(assert (=> b!47369 (= lt!20400 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20398 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47369 (arrayContainsKey!0 _keys!1940 lt!20398 #b00000000000000000000000000000000)))

(declare-fun lt!20399 () Unit!1338)

(assert (=> b!47369 (= lt!20399 lt!20400)))

(declare-fun res!27576 () Bool)

(declare-datatypes ((SeekEntryResult!211 0))(
  ( (MissingZero!211 (index!2966 (_ BitVec 32))) (Found!211 (index!2967 (_ BitVec 32))) (Intermediate!211 (undefined!1023 Bool) (index!2968 (_ BitVec 32)) (x!8750 (_ BitVec 32))) (Undefined!211) (MissingVacant!211 (index!2969 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3100 (_ BitVec 32)) SeekEntryResult!211)

(assert (=> b!47369 (= res!27576 (= (seekEntryOrOpen!0 (select (arr!1485 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!211 #b00000000000000000000000000000000)))))

(assert (=> b!47369 (=> (not res!27576) (not e!30323))))

(assert (= (and d!9421 (not res!27577)) b!47367))

(assert (= (and b!47367 c!6385) b!47369))

(assert (= (and b!47367 (not c!6385)) b!47366))

(assert (= (and b!47369 res!27576) b!47368))

(assert (= (or b!47368 b!47366) bm!3717))

(declare-fun m!41567 () Bool)

(assert (=> b!47367 m!41567))

(assert (=> b!47367 m!41567))

(declare-fun m!41569 () Bool)

(assert (=> b!47367 m!41569))

(declare-fun m!41571 () Bool)

(assert (=> bm!3717 m!41571))

(assert (=> b!47369 m!41567))

(declare-fun m!41573 () Bool)

(assert (=> b!47369 m!41573))

(declare-fun m!41575 () Bool)

(assert (=> b!47369 m!41575))

(assert (=> b!47369 m!41567))

(declare-fun m!41577 () Bool)

(assert (=> b!47369 m!41577))

(assert (=> b!47299 d!9421))

(declare-fun d!9423 () Bool)

(assert (=> d!9423 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7382 d!9423))

(declare-fun d!9425 () Bool)

(assert (=> d!9425 (= (array_inv!898 _values!1550) (bvsge (size!1709 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7382 d!9425))

(declare-fun d!9427 () Bool)

(assert (=> d!9427 (= (array_inv!899 _keys!1940) (bvsge (size!1708 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7382 d!9427))

(declare-fun d!9429 () Bool)

(declare-fun lt!20403 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!45 (List!1251) (InoxSet (_ BitVec 64)))

(assert (=> d!9429 (= lt!20403 (select (content!45 Nil!1248) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30331 () Bool)

(assert (=> d!9429 (= lt!20403 e!30331)))

(declare-fun res!27583 () Bool)

(assert (=> d!9429 (=> (not res!27583) (not e!30331))))

(assert (=> d!9429 (= res!27583 ((_ is Cons!1247) Nil!1248))))

(assert (=> d!9429 (= (contains!582 Nil!1248 #b1000000000000000000000000000000000000000000000000000000000000000) lt!20403)))

(declare-fun b!47374 () Bool)

(declare-fun e!30330 () Bool)

(assert (=> b!47374 (= e!30331 e!30330)))

(declare-fun res!27582 () Bool)

(assert (=> b!47374 (=> res!27582 e!30330)))

(assert (=> b!47374 (= res!27582 (= (h!1827 Nil!1248) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47375 () Bool)

(assert (=> b!47375 (= e!30330 (contains!582 (t!4278 Nil!1248) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!9429 res!27583) b!47374))

(assert (= (and b!47374 (not res!27582)) b!47375))

(declare-fun m!41579 () Bool)

(assert (=> d!9429 m!41579))

(declare-fun m!41581 () Bool)

(assert (=> d!9429 m!41581))

(declare-fun m!41583 () Bool)

(assert (=> b!47375 m!41583))

(assert (=> b!47296 d!9429))

(declare-fun d!9431 () Bool)

(declare-fun lt!20404 () Bool)

(assert (=> d!9431 (= lt!20404 (select (content!45 Nil!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30333 () Bool)

(assert (=> d!9431 (= lt!20404 e!30333)))

(declare-fun res!27585 () Bool)

(assert (=> d!9431 (=> (not res!27585) (not e!30333))))

(assert (=> d!9431 (= res!27585 ((_ is Cons!1247) Nil!1248))))

(assert (=> d!9431 (= (contains!582 Nil!1248 #b0000000000000000000000000000000000000000000000000000000000000000) lt!20404)))

(declare-fun b!47376 () Bool)

(declare-fun e!30332 () Bool)

(assert (=> b!47376 (= e!30333 e!30332)))

(declare-fun res!27584 () Bool)

(assert (=> b!47376 (=> res!27584 e!30332)))

(assert (=> b!47376 (= res!27584 (= (h!1827 Nil!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47377 () Bool)

(assert (=> b!47377 (= e!30332 (contains!582 (t!4278 Nil!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!9431 res!27585) b!47376))

(assert (= (and b!47376 (not res!27584)) b!47377))

(assert (=> d!9431 m!41579))

(declare-fun m!41585 () Bool)

(assert (=> d!9431 m!41585))

(declare-fun m!41587 () Bool)

(assert (=> b!47377 m!41587))

(assert (=> b!47300 d!9431))

(declare-fun d!9433 () Bool)

(declare-fun res!27590 () Bool)

(declare-fun e!30338 () Bool)

(assert (=> d!9433 (=> res!27590 e!30338)))

(assert (=> d!9433 (= res!27590 ((_ is Nil!1248) Nil!1248))))

(assert (=> d!9433 (= (noDuplicate!37 Nil!1248) e!30338)))

(declare-fun b!47382 () Bool)

(declare-fun e!30339 () Bool)

(assert (=> b!47382 (= e!30338 e!30339)))

(declare-fun res!27591 () Bool)

(assert (=> b!47382 (=> (not res!27591) (not e!30339))))

(assert (=> b!47382 (= res!27591 (not (contains!582 (t!4278 Nil!1248) (h!1827 Nil!1248))))))

(declare-fun b!47383 () Bool)

(assert (=> b!47383 (= e!30339 (noDuplicate!37 (t!4278 Nil!1248)))))

(assert (= (and d!9433 (not res!27590)) b!47382))

(assert (= (and b!47382 res!27591) b!47383))

(declare-fun m!41589 () Bool)

(assert (=> b!47382 m!41589))

(declare-fun m!41591 () Bool)

(assert (=> b!47383 m!41591))

(assert (=> b!47301 d!9433))

(declare-fun b!47390 () Bool)

(declare-fun e!30345 () Bool)

(assert (=> b!47390 (= e!30345 tp_is_empty!2029)))

(declare-fun mapNonEmpty!2093 () Bool)

(declare-fun mapRes!2093 () Bool)

(declare-fun tp!6242 () Bool)

(assert (=> mapNonEmpty!2093 (= mapRes!2093 (and tp!6242 e!30345))))

(declare-fun mapRest!2093 () (Array (_ BitVec 32) ValueCell!725))

(declare-fun mapValue!2093 () ValueCell!725)

(declare-fun mapKey!2093 () (_ BitVec 32))

(assert (=> mapNonEmpty!2093 (= mapRest!2084 (store mapRest!2093 mapKey!2093 mapValue!2093))))

(declare-fun condMapEmpty!2093 () Bool)

(declare-fun mapDefault!2093 () ValueCell!725)

(assert (=> mapNonEmpty!2084 (= condMapEmpty!2093 (= mapRest!2084 ((as const (Array (_ BitVec 32) ValueCell!725)) mapDefault!2093)))))

(declare-fun e!30344 () Bool)

(assert (=> mapNonEmpty!2084 (= tp!6233 (and e!30344 mapRes!2093))))

(declare-fun b!47391 () Bool)

(assert (=> b!47391 (= e!30344 tp_is_empty!2029)))

(declare-fun mapIsEmpty!2093 () Bool)

(assert (=> mapIsEmpty!2093 mapRes!2093))

(assert (= (and mapNonEmpty!2084 condMapEmpty!2093) mapIsEmpty!2093))

(assert (= (and mapNonEmpty!2084 (not condMapEmpty!2093)) mapNonEmpty!2093))

(assert (= (and mapNonEmpty!2093 ((_ is ValueCellFull!725) mapValue!2093)) b!47390))

(assert (= (and mapNonEmpty!2084 ((_ is ValueCellFull!725) mapDefault!2093)) b!47391))

(declare-fun m!41593 () Bool)

(assert (=> mapNonEmpty!2093 m!41593))

(check-sat (not b!47377) (not b!47375) (not d!9429) (not b!47382) (not b!47383) (not mapNonEmpty!2093) (not bm!3717) (not b!47369) (not d!9431) (not b!47367) tp_is_empty!2029)
(check-sat)
