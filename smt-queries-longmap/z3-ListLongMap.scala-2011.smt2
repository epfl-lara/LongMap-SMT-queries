; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35070 () Bool)

(assert start!35070)

(declare-fun b_free!7737 () Bool)

(declare-fun b_next!7737 () Bool)

(assert (=> start!35070 (= b_free!7737 (not b_next!7737))))

(declare-fun tp!26792 () Bool)

(declare-fun b_and!14969 () Bool)

(assert (=> start!35070 (= tp!26792 b_and!14969)))

(declare-fun b!351548 () Bool)

(declare-fun res!194959 () Bool)

(declare-fun e!215283 () Bool)

(assert (=> b!351548 (=> (not res!194959) (not e!215283))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11229 0))(
  ( (V!11230 (val!3889 Int)) )
))
(declare-fun zeroValue!1467 () V!11229)

(declare-datatypes ((ValueCell!3501 0))(
  ( (ValueCellFull!3501 (v!6077 V!11229)) (EmptyCell!3501) )
))
(declare-datatypes ((array!18967 0))(
  ( (array!18968 (arr!8988 (Array (_ BitVec 32) ValueCell!3501)) (size!9340 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18967)

(declare-datatypes ((array!18969 0))(
  ( (array!18970 (arr!8989 (Array (_ BitVec 32) (_ BitVec 64))) (size!9341 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18969)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11229)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5608 0))(
  ( (tuple2!5609 (_1!2815 (_ BitVec 64)) (_2!2815 V!11229)) )
))
(declare-datatypes ((List!5228 0))(
  ( (Nil!5225) (Cons!5224 (h!6080 tuple2!5608) (t!10368 List!5228)) )
))
(declare-datatypes ((ListLongMap!4521 0))(
  ( (ListLongMap!4522 (toList!2276 List!5228)) )
))
(declare-fun contains!2346 (ListLongMap!4521 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1797 (array!18969 array!18967 (_ BitVec 32) (_ BitVec 32) V!11229 V!11229 (_ BitVec 32) Int) ListLongMap!4521)

(assert (=> b!351548 (= res!194959 (not (contains!2346 (getCurrentListMap!1797 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351549 () Bool)

(declare-fun res!194958 () Bool)

(declare-fun e!215285 () Bool)

(assert (=> b!351549 (=> (not res!194958) (not e!215285))))

(declare-fun arrayContainsKey!0 (array!18969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351549 (= res!194958 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351550 () Bool)

(assert (=> b!351550 (= e!215283 e!215285)))

(declare-fun res!194955 () Bool)

(assert (=> b!351550 (=> (not res!194955) (not e!215285))))

(declare-datatypes ((SeekEntryResult!3458 0))(
  ( (MissingZero!3458 (index!16011 (_ BitVec 32))) (Found!3458 (index!16012 (_ BitVec 32))) (Intermediate!3458 (undefined!4270 Bool) (index!16013 (_ BitVec 32)) (x!34988 (_ BitVec 32))) (Undefined!3458) (MissingVacant!3458 (index!16014 (_ BitVec 32))) )
))
(declare-fun lt!164856 () SeekEntryResult!3458)

(get-info :version)

(assert (=> b!351550 (= res!194955 (and (not ((_ is Found!3458) lt!164856)) (not ((_ is MissingZero!3458) lt!164856)) ((_ is MissingVacant!3458) lt!164856)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18969 (_ BitVec 32)) SeekEntryResult!3458)

(assert (=> b!351550 (= lt!164856 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351551 () Bool)

(declare-fun e!215284 () Bool)

(assert (=> b!351551 (= e!215285 e!215284)))

(declare-fun res!194956 () Bool)

(assert (=> b!351551 (=> (not res!194956) (not e!215284))))

(declare-fun lt!164857 () (_ BitVec 32))

(assert (=> b!351551 (= res!194956 (and (bvsge lt!164857 #b00000000000000000000000000000000) (bvslt lt!164857 (size!9341 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18969 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351551 (= lt!164857 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351552 () Bool)

(declare-fun res!194961 () Bool)

(assert (=> b!351552 (=> (not res!194961) (not e!215283))))

(declare-datatypes ((List!5229 0))(
  ( (Nil!5226) (Cons!5225 (h!6081 (_ BitVec 64)) (t!10369 List!5229)) )
))
(declare-fun arrayNoDuplicates!0 (array!18969 (_ BitVec 32) List!5229) Bool)

(assert (=> b!351552 (= res!194961 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5226))))

(declare-fun mapNonEmpty!13008 () Bool)

(declare-fun mapRes!13008 () Bool)

(declare-fun tp!26793 () Bool)

(declare-fun e!215286 () Bool)

(assert (=> mapNonEmpty!13008 (= mapRes!13008 (and tp!26793 e!215286))))

(declare-fun mapRest!13008 () (Array (_ BitVec 32) ValueCell!3501))

(declare-fun mapValue!13008 () ValueCell!3501)

(declare-fun mapKey!13008 () (_ BitVec 32))

(assert (=> mapNonEmpty!13008 (= (arr!8988 _values!1525) (store mapRest!13008 mapKey!13008 mapValue!13008))))

(declare-fun b!351553 () Bool)

(declare-fun res!194953 () Bool)

(assert (=> b!351553 (=> (not res!194953) (not e!215283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351553 (= res!194953 (validKeyInArray!0 k0!1348))))

(declare-fun b!351554 () Bool)

(declare-fun e!215282 () Bool)

(declare-fun e!215287 () Bool)

(assert (=> b!351554 (= e!215282 (and e!215287 mapRes!13008))))

(declare-fun condMapEmpty!13008 () Bool)

(declare-fun mapDefault!13008 () ValueCell!3501)

(assert (=> b!351554 (= condMapEmpty!13008 (= (arr!8988 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3501)) mapDefault!13008)))))

(declare-fun b!351555 () Bool)

(declare-fun tp_is_empty!7689 () Bool)

(assert (=> b!351555 (= e!215286 tp_is_empty!7689)))

(declare-fun b!351556 () Bool)

(assert (=> b!351556 (= e!215284 (not (arrayContainsKey!0 _keys!1895 k0!1348 lt!164857)))))

(declare-fun b!351557 () Bool)

(declare-fun res!194954 () Bool)

(assert (=> b!351557 (=> (not res!194954) (not e!215283))))

(assert (=> b!351557 (= res!194954 (and (= (size!9340 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9341 _keys!1895) (size!9340 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351558 () Bool)

(assert (=> b!351558 (= e!215287 tp_is_empty!7689)))

(declare-fun b!351559 () Bool)

(declare-fun res!194960 () Bool)

(assert (=> b!351559 (=> (not res!194960) (not e!215283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18969 (_ BitVec 32)) Bool)

(assert (=> b!351559 (= res!194960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!13008 () Bool)

(assert (=> mapIsEmpty!13008 mapRes!13008))

(declare-fun res!194957 () Bool)

(assert (=> start!35070 (=> (not res!194957) (not e!215283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35070 (= res!194957 (validMask!0 mask!2385))))

(assert (=> start!35070 e!215283))

(assert (=> start!35070 true))

(assert (=> start!35070 tp_is_empty!7689))

(assert (=> start!35070 tp!26792))

(declare-fun array_inv!6630 (array!18967) Bool)

(assert (=> start!35070 (and (array_inv!6630 _values!1525) e!215282)))

(declare-fun array_inv!6631 (array!18969) Bool)

(assert (=> start!35070 (array_inv!6631 _keys!1895)))

(assert (= (and start!35070 res!194957) b!351557))

(assert (= (and b!351557 res!194954) b!351559))

(assert (= (and b!351559 res!194960) b!351552))

(assert (= (and b!351552 res!194961) b!351553))

(assert (= (and b!351553 res!194953) b!351548))

(assert (= (and b!351548 res!194959) b!351550))

(assert (= (and b!351550 res!194955) b!351549))

(assert (= (and b!351549 res!194958) b!351551))

(assert (= (and b!351551 res!194956) b!351556))

(assert (= (and b!351554 condMapEmpty!13008) mapIsEmpty!13008))

(assert (= (and b!351554 (not condMapEmpty!13008)) mapNonEmpty!13008))

(assert (= (and mapNonEmpty!13008 ((_ is ValueCellFull!3501) mapValue!13008)) b!351555))

(assert (= (and b!351554 ((_ is ValueCellFull!3501) mapDefault!13008)) b!351558))

(assert (= start!35070 b!351554))

(declare-fun m!351439 () Bool)

(assert (=> b!351551 m!351439))

(declare-fun m!351441 () Bool)

(assert (=> mapNonEmpty!13008 m!351441))

(declare-fun m!351443 () Bool)

(assert (=> b!351552 m!351443))

(declare-fun m!351445 () Bool)

(assert (=> b!351559 m!351445))

(declare-fun m!351447 () Bool)

(assert (=> start!35070 m!351447))

(declare-fun m!351449 () Bool)

(assert (=> start!35070 m!351449))

(declare-fun m!351451 () Bool)

(assert (=> start!35070 m!351451))

(declare-fun m!351453 () Bool)

(assert (=> b!351556 m!351453))

(declare-fun m!351455 () Bool)

(assert (=> b!351550 m!351455))

(declare-fun m!351457 () Bool)

(assert (=> b!351549 m!351457))

(declare-fun m!351459 () Bool)

(assert (=> b!351553 m!351459))

(declare-fun m!351461 () Bool)

(assert (=> b!351548 m!351461))

(assert (=> b!351548 m!351461))

(declare-fun m!351463 () Bool)

(assert (=> b!351548 m!351463))

(check-sat (not start!35070) tp_is_empty!7689 (not b!351552) (not mapNonEmpty!13008) (not b_next!7737) (not b!351549) (not b!351553) b_and!14969 (not b!351550) (not b!351548) (not b!351559) (not b!351551) (not b!351556))
(check-sat b_and!14969 (not b_next!7737))
(get-model)

(declare-fun d!71473 () Bool)

(assert (=> d!71473 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351553 d!71473))

(declare-fun b!351608 () Bool)

(declare-fun c!53466 () Bool)

(declare-fun lt!164871 () (_ BitVec 64))

(assert (=> b!351608 (= c!53466 (= lt!164871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!215315 () SeekEntryResult!3458)

(declare-fun e!215316 () SeekEntryResult!3458)

(assert (=> b!351608 (= e!215315 e!215316)))

(declare-fun b!351609 () Bool)

(declare-fun e!215317 () SeekEntryResult!3458)

(assert (=> b!351609 (= e!215317 Undefined!3458)))

(declare-fun d!71475 () Bool)

(declare-fun lt!164872 () SeekEntryResult!3458)

(assert (=> d!71475 (and (or ((_ is Undefined!3458) lt!164872) (not ((_ is Found!3458) lt!164872)) (and (bvsge (index!16012 lt!164872) #b00000000000000000000000000000000) (bvslt (index!16012 lt!164872) (size!9341 _keys!1895)))) (or ((_ is Undefined!3458) lt!164872) ((_ is Found!3458) lt!164872) (not ((_ is MissingZero!3458) lt!164872)) (and (bvsge (index!16011 lt!164872) #b00000000000000000000000000000000) (bvslt (index!16011 lt!164872) (size!9341 _keys!1895)))) (or ((_ is Undefined!3458) lt!164872) ((_ is Found!3458) lt!164872) ((_ is MissingZero!3458) lt!164872) (not ((_ is MissingVacant!3458) lt!164872)) (and (bvsge (index!16014 lt!164872) #b00000000000000000000000000000000) (bvslt (index!16014 lt!164872) (size!9341 _keys!1895)))) (or ((_ is Undefined!3458) lt!164872) (ite ((_ is Found!3458) lt!164872) (= (select (arr!8989 _keys!1895) (index!16012 lt!164872)) k0!1348) (ite ((_ is MissingZero!3458) lt!164872) (= (select (arr!8989 _keys!1895) (index!16011 lt!164872)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3458) lt!164872) (= (select (arr!8989 _keys!1895) (index!16014 lt!164872)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71475 (= lt!164872 e!215317)))

(declare-fun c!53464 () Bool)

(declare-fun lt!164870 () SeekEntryResult!3458)

(assert (=> d!71475 (= c!53464 (and ((_ is Intermediate!3458) lt!164870) (undefined!4270 lt!164870)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18969 (_ BitVec 32)) SeekEntryResult!3458)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71475 (= lt!164870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71475 (validMask!0 mask!2385)))

(assert (=> d!71475 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164872)))

(declare-fun b!351610 () Bool)

(assert (=> b!351610 (= e!215317 e!215315)))

(assert (=> b!351610 (= lt!164871 (select (arr!8989 _keys!1895) (index!16013 lt!164870)))))

(declare-fun c!53465 () Bool)

(assert (=> b!351610 (= c!53465 (= lt!164871 k0!1348))))

(declare-fun b!351611 () Bool)

(assert (=> b!351611 (= e!215316 (MissingZero!3458 (index!16013 lt!164870)))))

(declare-fun b!351612 () Bool)

(assert (=> b!351612 (= e!215315 (Found!3458 (index!16013 lt!164870)))))

(declare-fun b!351613 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18969 (_ BitVec 32)) SeekEntryResult!3458)

(assert (=> b!351613 (= e!215316 (seekKeyOrZeroReturnVacant!0 (x!34988 lt!164870) (index!16013 lt!164870) (index!16013 lt!164870) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!71475 c!53464) b!351609))

(assert (= (and d!71475 (not c!53464)) b!351610))

(assert (= (and b!351610 c!53465) b!351612))

(assert (= (and b!351610 (not c!53465)) b!351608))

(assert (= (and b!351608 c!53466) b!351611))

(assert (= (and b!351608 (not c!53466)) b!351613))

(declare-fun m!351491 () Bool)

(assert (=> d!71475 m!351491))

(declare-fun m!351493 () Bool)

(assert (=> d!71475 m!351493))

(declare-fun m!351495 () Bool)

(assert (=> d!71475 m!351495))

(declare-fun m!351497 () Bool)

(assert (=> d!71475 m!351497))

(declare-fun m!351499 () Bool)

(assert (=> d!71475 m!351499))

(assert (=> d!71475 m!351447))

(assert (=> d!71475 m!351495))

(declare-fun m!351501 () Bool)

(assert (=> b!351610 m!351501))

(declare-fun m!351503 () Bool)

(assert (=> b!351613 m!351503))

(assert (=> b!351550 d!71475))

(declare-fun b!351622 () Bool)

(declare-fun e!215325 () Bool)

(declare-fun call!27010 () Bool)

(assert (=> b!351622 (= e!215325 call!27010)))

(declare-fun b!351623 () Bool)

(declare-fun e!215324 () Bool)

(assert (=> b!351623 (= e!215324 call!27010)))

(declare-fun d!71477 () Bool)

(declare-fun res!194994 () Bool)

(declare-fun e!215326 () Bool)

(assert (=> d!71477 (=> res!194994 e!215326)))

(assert (=> d!71477 (= res!194994 (bvsge #b00000000000000000000000000000000 (size!9341 _keys!1895)))))

(assert (=> d!71477 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215326)))

(declare-fun b!351624 () Bool)

(assert (=> b!351624 (= e!215324 e!215325)))

(declare-fun lt!164879 () (_ BitVec 64))

(assert (=> b!351624 (= lt!164879 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10864 0))(
  ( (Unit!10865) )
))
(declare-fun lt!164881 () Unit!10864)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18969 (_ BitVec 64) (_ BitVec 32)) Unit!10864)

(assert (=> b!351624 (= lt!164881 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164879 #b00000000000000000000000000000000))))

(assert (=> b!351624 (arrayContainsKey!0 _keys!1895 lt!164879 #b00000000000000000000000000000000)))

(declare-fun lt!164880 () Unit!10864)

(assert (=> b!351624 (= lt!164880 lt!164881)))

(declare-fun res!194993 () Bool)

(assert (=> b!351624 (= res!194993 (= (seekEntryOrOpen!0 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3458 #b00000000000000000000000000000000)))))

(assert (=> b!351624 (=> (not res!194993) (not e!215325))))

(declare-fun bm!27007 () Bool)

(assert (=> bm!27007 (= call!27010 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!351625 () Bool)

(assert (=> b!351625 (= e!215326 e!215324)))

(declare-fun c!53469 () Bool)

(assert (=> b!351625 (= c!53469 (validKeyInArray!0 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71477 (not res!194994)) b!351625))

(assert (= (and b!351625 c!53469) b!351624))

(assert (= (and b!351625 (not c!53469)) b!351623))

(assert (= (and b!351624 res!194993) b!351622))

(assert (= (or b!351622 b!351623) bm!27007))

(declare-fun m!351505 () Bool)

(assert (=> b!351624 m!351505))

(declare-fun m!351507 () Bool)

(assert (=> b!351624 m!351507))

(declare-fun m!351509 () Bool)

(assert (=> b!351624 m!351509))

(assert (=> b!351624 m!351505))

(declare-fun m!351511 () Bool)

(assert (=> b!351624 m!351511))

(declare-fun m!351513 () Bool)

(assert (=> bm!27007 m!351513))

(assert (=> b!351625 m!351505))

(assert (=> b!351625 m!351505))

(declare-fun m!351515 () Bool)

(assert (=> b!351625 m!351515))

(assert (=> b!351559 d!71477))

(declare-fun d!71479 () Bool)

(declare-fun res!194999 () Bool)

(declare-fun e!215331 () Bool)

(assert (=> d!71479 (=> res!194999 e!215331)))

(assert (=> d!71479 (= res!194999 (= (select (arr!8989 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71479 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215331)))

(declare-fun b!351630 () Bool)

(declare-fun e!215332 () Bool)

(assert (=> b!351630 (= e!215331 e!215332)))

(declare-fun res!195000 () Bool)

(assert (=> b!351630 (=> (not res!195000) (not e!215332))))

(assert (=> b!351630 (= res!195000 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9341 _keys!1895)))))

(declare-fun b!351631 () Bool)

(assert (=> b!351631 (= e!215332 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71479 (not res!194999)) b!351630))

(assert (= (and b!351630 res!195000) b!351631))

(assert (=> d!71479 m!351505))

(declare-fun m!351517 () Bool)

(assert (=> b!351631 m!351517))

(assert (=> b!351549 d!71479))

(declare-fun d!71481 () Bool)

(declare-fun res!195001 () Bool)

(declare-fun e!215333 () Bool)

(assert (=> d!71481 (=> res!195001 e!215333)))

(assert (=> d!71481 (= res!195001 (= (select (arr!8989 _keys!1895) lt!164857) k0!1348))))

(assert (=> d!71481 (= (arrayContainsKey!0 _keys!1895 k0!1348 lt!164857) e!215333)))

(declare-fun b!351632 () Bool)

(declare-fun e!215334 () Bool)

(assert (=> b!351632 (= e!215333 e!215334)))

(declare-fun res!195002 () Bool)

(assert (=> b!351632 (=> (not res!195002) (not e!215334))))

(assert (=> b!351632 (= res!195002 (bvslt (bvadd lt!164857 #b00000000000000000000000000000001) (size!9341 _keys!1895)))))

(declare-fun b!351633 () Bool)

(assert (=> b!351633 (= e!215334 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd lt!164857 #b00000000000000000000000000000001)))))

(assert (= (and d!71481 (not res!195001)) b!351632))

(assert (= (and b!351632 res!195002) b!351633))

(declare-fun m!351519 () Bool)

(assert (=> d!71481 m!351519))

(declare-fun m!351521 () Bool)

(assert (=> b!351633 m!351521))

(assert (=> b!351556 d!71481))

(declare-fun d!71483 () Bool)

(declare-fun e!215339 () Bool)

(assert (=> d!71483 e!215339))

(declare-fun res!195005 () Bool)

(assert (=> d!71483 (=> res!195005 e!215339)))

(declare-fun lt!164891 () Bool)

(assert (=> d!71483 (= res!195005 (not lt!164891))))

(declare-fun lt!164893 () Bool)

(assert (=> d!71483 (= lt!164891 lt!164893)))

(declare-fun lt!164890 () Unit!10864)

(declare-fun e!215340 () Unit!10864)

(assert (=> d!71483 (= lt!164890 e!215340)))

(declare-fun c!53472 () Bool)

(assert (=> d!71483 (= c!53472 lt!164893)))

(declare-fun containsKey!342 (List!5228 (_ BitVec 64)) Bool)

(assert (=> d!71483 (= lt!164893 (containsKey!342 (toList!2276 (getCurrentListMap!1797 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71483 (= (contains!2346 (getCurrentListMap!1797 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164891)))

(declare-fun b!351640 () Bool)

(declare-fun lt!164892 () Unit!10864)

(assert (=> b!351640 (= e!215340 lt!164892)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!290 (List!5228 (_ BitVec 64)) Unit!10864)

(assert (=> b!351640 (= lt!164892 (lemmaContainsKeyImpliesGetValueByKeyDefined!290 (toList!2276 (getCurrentListMap!1797 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!356 0))(
  ( (Some!355 (v!6079 V!11229)) (None!354) )
))
(declare-fun isDefined!291 (Option!356) Bool)

(declare-fun getValueByKey!350 (List!5228 (_ BitVec 64)) Option!356)

(assert (=> b!351640 (isDefined!291 (getValueByKey!350 (toList!2276 (getCurrentListMap!1797 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!351641 () Bool)

(declare-fun Unit!10866 () Unit!10864)

(assert (=> b!351641 (= e!215340 Unit!10866)))

(declare-fun b!351642 () Bool)

(assert (=> b!351642 (= e!215339 (isDefined!291 (getValueByKey!350 (toList!2276 (getCurrentListMap!1797 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71483 c!53472) b!351640))

(assert (= (and d!71483 (not c!53472)) b!351641))

(assert (= (and d!71483 (not res!195005)) b!351642))

(declare-fun m!351523 () Bool)

(assert (=> d!71483 m!351523))

(declare-fun m!351525 () Bool)

(assert (=> b!351640 m!351525))

(declare-fun m!351527 () Bool)

(assert (=> b!351640 m!351527))

(assert (=> b!351640 m!351527))

(declare-fun m!351529 () Bool)

(assert (=> b!351640 m!351529))

(assert (=> b!351642 m!351527))

(assert (=> b!351642 m!351527))

(assert (=> b!351642 m!351529))

(assert (=> b!351548 d!71483))

(declare-fun bm!27022 () Bool)

(declare-fun call!27031 () Bool)

(declare-fun lt!164939 () ListLongMap!4521)

(assert (=> bm!27022 (= call!27031 (contains!2346 lt!164939 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!351685 () Bool)

(declare-fun e!215367 () Bool)

(declare-fun e!215378 () Bool)

(assert (=> b!351685 (= e!215367 e!215378)))

(declare-fun res!195027 () Bool)

(assert (=> b!351685 (= res!195027 call!27031)))

(assert (=> b!351685 (=> (not res!195027) (not e!215378))))

(declare-fun b!351686 () Bool)

(declare-fun e!215369 () Bool)

(declare-fun apply!292 (ListLongMap!4521 (_ BitVec 64)) V!11229)

(assert (=> b!351686 (= e!215369 (= (apply!292 lt!164939 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!351687 () Bool)

(declare-fun e!215377 () Bool)

(assert (=> b!351687 (= e!215377 e!215369)))

(declare-fun res!195030 () Bool)

(declare-fun call!27028 () Bool)

(assert (=> b!351687 (= res!195030 call!27028)))

(assert (=> b!351687 (=> (not res!195030) (not e!215369))))

(declare-fun b!351688 () Bool)

(declare-fun e!215370 () ListLongMap!4521)

(declare-fun e!215376 () ListLongMap!4521)

(assert (=> b!351688 (= e!215370 e!215376)))

(declare-fun c!53487 () Bool)

(assert (=> b!351688 (= c!53487 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27023 () Bool)

(declare-fun call!27025 () ListLongMap!4521)

(declare-fun call!27029 () ListLongMap!4521)

(assert (=> bm!27023 (= call!27025 call!27029)))

(declare-fun bm!27024 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!614 (array!18969 array!18967 (_ BitVec 32) (_ BitVec 32) V!11229 V!11229 (_ BitVec 32) Int) ListLongMap!4521)

(assert (=> bm!27024 (= call!27029 (getCurrentListMapNoExtraKeys!614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!27025 () Bool)

(assert (=> bm!27025 (= call!27028 (contains!2346 lt!164939 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!351689 () Bool)

(declare-fun e!215371 () Bool)

(assert (=> b!351689 (= e!215371 (validKeyInArray!0 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351690 () Bool)

(declare-fun e!215375 () Bool)

(assert (=> b!351690 (= e!215375 e!215377)))

(declare-fun c!53488 () Bool)

(assert (=> b!351690 (= c!53488 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!351691 () Bool)

(declare-fun e!215373 () Unit!10864)

(declare-fun Unit!10867 () Unit!10864)

(assert (=> b!351691 (= e!215373 Unit!10867)))

(declare-fun d!71485 () Bool)

(assert (=> d!71485 e!215375))

(declare-fun res!195025 () Bool)

(assert (=> d!71485 (=> (not res!195025) (not e!215375))))

(assert (=> d!71485 (= res!195025 (or (bvsge #b00000000000000000000000000000000 (size!9341 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9341 _keys!1895)))))))

(declare-fun lt!164944 () ListLongMap!4521)

(assert (=> d!71485 (= lt!164939 lt!164944)))

(declare-fun lt!164959 () Unit!10864)

(assert (=> d!71485 (= lt!164959 e!215373)))

(declare-fun c!53485 () Bool)

(assert (=> d!71485 (= c!53485 e!215371)))

(declare-fun res!195029 () Bool)

(assert (=> d!71485 (=> (not res!195029) (not e!215371))))

(assert (=> d!71485 (= res!195029 (bvslt #b00000000000000000000000000000000 (size!9341 _keys!1895)))))

(assert (=> d!71485 (= lt!164944 e!215370)))

(declare-fun c!53490 () Bool)

(assert (=> d!71485 (= c!53490 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71485 (validMask!0 mask!2385)))

(assert (=> d!71485 (= (getCurrentListMap!1797 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164939)))

(declare-fun b!351692 () Bool)

(assert (=> b!351692 (= e!215378 (= (apply!292 lt!164939 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!351693 () Bool)

(declare-fun call!27030 () ListLongMap!4521)

(declare-fun +!741 (ListLongMap!4521 tuple2!5608) ListLongMap!4521)

(assert (=> b!351693 (= e!215370 (+!741 call!27030 (tuple2!5609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!351694 () Bool)

(declare-fun call!27027 () ListLongMap!4521)

(assert (=> b!351694 (= e!215376 call!27027)))

(declare-fun b!351695 () Bool)

(declare-fun lt!164956 () Unit!10864)

(assert (=> b!351695 (= e!215373 lt!164956)))

(declare-fun lt!164948 () ListLongMap!4521)

(assert (=> b!351695 (= lt!164948 (getCurrentListMapNoExtraKeys!614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164958 () (_ BitVec 64))

(assert (=> b!351695 (= lt!164958 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164950 () (_ BitVec 64))

(assert (=> b!351695 (= lt!164950 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164955 () Unit!10864)

(declare-fun addStillContains!268 (ListLongMap!4521 (_ BitVec 64) V!11229 (_ BitVec 64)) Unit!10864)

(assert (=> b!351695 (= lt!164955 (addStillContains!268 lt!164948 lt!164958 zeroValue!1467 lt!164950))))

(assert (=> b!351695 (contains!2346 (+!741 lt!164948 (tuple2!5609 lt!164958 zeroValue!1467)) lt!164950)))

(declare-fun lt!164943 () Unit!10864)

(assert (=> b!351695 (= lt!164943 lt!164955)))

(declare-fun lt!164954 () ListLongMap!4521)

(assert (=> b!351695 (= lt!164954 (getCurrentListMapNoExtraKeys!614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164953 () (_ BitVec 64))

(assert (=> b!351695 (= lt!164953 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164947 () (_ BitVec 64))

(assert (=> b!351695 (= lt!164947 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164945 () Unit!10864)

(declare-fun addApplyDifferent!268 (ListLongMap!4521 (_ BitVec 64) V!11229 (_ BitVec 64)) Unit!10864)

(assert (=> b!351695 (= lt!164945 (addApplyDifferent!268 lt!164954 lt!164953 minValue!1467 lt!164947))))

(assert (=> b!351695 (= (apply!292 (+!741 lt!164954 (tuple2!5609 lt!164953 minValue!1467)) lt!164947) (apply!292 lt!164954 lt!164947))))

(declare-fun lt!164949 () Unit!10864)

(assert (=> b!351695 (= lt!164949 lt!164945)))

(declare-fun lt!164946 () ListLongMap!4521)

(assert (=> b!351695 (= lt!164946 (getCurrentListMapNoExtraKeys!614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164942 () (_ BitVec 64))

(assert (=> b!351695 (= lt!164942 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164952 () (_ BitVec 64))

(assert (=> b!351695 (= lt!164952 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164957 () Unit!10864)

(assert (=> b!351695 (= lt!164957 (addApplyDifferent!268 lt!164946 lt!164942 zeroValue!1467 lt!164952))))

(assert (=> b!351695 (= (apply!292 (+!741 lt!164946 (tuple2!5609 lt!164942 zeroValue!1467)) lt!164952) (apply!292 lt!164946 lt!164952))))

(declare-fun lt!164951 () Unit!10864)

(assert (=> b!351695 (= lt!164951 lt!164957)))

(declare-fun lt!164941 () ListLongMap!4521)

(assert (=> b!351695 (= lt!164941 (getCurrentListMapNoExtraKeys!614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164940 () (_ BitVec 64))

(assert (=> b!351695 (= lt!164940 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164938 () (_ BitVec 64))

(assert (=> b!351695 (= lt!164938 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!351695 (= lt!164956 (addApplyDifferent!268 lt!164941 lt!164940 minValue!1467 lt!164938))))

(assert (=> b!351695 (= (apply!292 (+!741 lt!164941 (tuple2!5609 lt!164940 minValue!1467)) lt!164938) (apply!292 lt!164941 lt!164938))))

(declare-fun b!351696 () Bool)

(declare-fun e!215374 () Bool)

(assert (=> b!351696 (= e!215374 (validKeyInArray!0 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351697 () Bool)

(declare-fun e!215372 () ListLongMap!4521)

(declare-fun call!27026 () ListLongMap!4521)

(assert (=> b!351697 (= e!215372 call!27026)))

(declare-fun b!351698 () Bool)

(declare-fun e!215368 () Bool)

(declare-fun e!215379 () Bool)

(assert (=> b!351698 (= e!215368 e!215379)))

(declare-fun res!195026 () Bool)

(assert (=> b!351698 (=> (not res!195026) (not e!215379))))

(assert (=> b!351698 (= res!195026 (contains!2346 lt!164939 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!351698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9341 _keys!1895)))))

(declare-fun bm!27026 () Bool)

(assert (=> bm!27026 (= call!27027 call!27030)))

(declare-fun b!351699 () Bool)

(declare-fun c!53489 () Bool)

(assert (=> b!351699 (= c!53489 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!351699 (= e!215376 e!215372)))

(declare-fun b!351700 () Bool)

(declare-fun res!195032 () Bool)

(assert (=> b!351700 (=> (not res!195032) (not e!215375))))

(assert (=> b!351700 (= res!195032 e!215368)))

(declare-fun res!195028 () Bool)

(assert (=> b!351700 (=> res!195028 e!215368)))

(assert (=> b!351700 (= res!195028 (not e!215374))))

(declare-fun res!195024 () Bool)

(assert (=> b!351700 (=> (not res!195024) (not e!215374))))

(assert (=> b!351700 (= res!195024 (bvslt #b00000000000000000000000000000000 (size!9341 _keys!1895)))))

(declare-fun bm!27027 () Bool)

(assert (=> bm!27027 (= call!27026 call!27025)))

(declare-fun b!351701 () Bool)

(declare-fun res!195031 () Bool)

(assert (=> b!351701 (=> (not res!195031) (not e!215375))))

(assert (=> b!351701 (= res!195031 e!215367)))

(declare-fun c!53486 () Bool)

(assert (=> b!351701 (= c!53486 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!351702 () Bool)

(declare-fun get!4800 (ValueCell!3501 V!11229) V!11229)

(declare-fun dynLambda!635 (Int (_ BitVec 64)) V!11229)

(assert (=> b!351702 (= e!215379 (= (apply!292 lt!164939 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000)) (get!4800 (select (arr!8988 _values!1525) #b00000000000000000000000000000000) (dynLambda!635 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351702 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9340 _values!1525)))))

(assert (=> b!351702 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9341 _keys!1895)))))

(declare-fun b!351703 () Bool)

(assert (=> b!351703 (= e!215367 (not call!27031))))

(declare-fun b!351704 () Bool)

(assert (=> b!351704 (= e!215372 call!27027)))

(declare-fun b!351705 () Bool)

(assert (=> b!351705 (= e!215377 (not call!27028))))

(declare-fun bm!27028 () Bool)

(assert (=> bm!27028 (= call!27030 (+!741 (ite c!53490 call!27029 (ite c!53487 call!27025 call!27026)) (ite (or c!53490 c!53487) (tuple2!5609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(assert (= (and d!71485 c!53490) b!351693))

(assert (= (and d!71485 (not c!53490)) b!351688))

(assert (= (and b!351688 c!53487) b!351694))

(assert (= (and b!351688 (not c!53487)) b!351699))

(assert (= (and b!351699 c!53489) b!351704))

(assert (= (and b!351699 (not c!53489)) b!351697))

(assert (= (or b!351704 b!351697) bm!27027))

(assert (= (or b!351694 bm!27027) bm!27023))

(assert (= (or b!351694 b!351704) bm!27026))

(assert (= (or b!351693 bm!27023) bm!27024))

(assert (= (or b!351693 bm!27026) bm!27028))

(assert (= (and d!71485 res!195029) b!351689))

(assert (= (and d!71485 c!53485) b!351695))

(assert (= (and d!71485 (not c!53485)) b!351691))

(assert (= (and d!71485 res!195025) b!351700))

(assert (= (and b!351700 res!195024) b!351696))

(assert (= (and b!351700 (not res!195028)) b!351698))

(assert (= (and b!351698 res!195026) b!351702))

(assert (= (and b!351700 res!195032) b!351701))

(assert (= (and b!351701 c!53486) b!351685))

(assert (= (and b!351701 (not c!53486)) b!351703))

(assert (= (and b!351685 res!195027) b!351692))

(assert (= (or b!351685 b!351703) bm!27022))

(assert (= (and b!351701 res!195031) b!351690))

(assert (= (and b!351690 c!53488) b!351687))

(assert (= (and b!351690 (not c!53488)) b!351705))

(assert (= (and b!351687 res!195030) b!351686))

(assert (= (or b!351687 b!351705) bm!27025))

(declare-fun b_lambda!8507 () Bool)

(assert (=> (not b_lambda!8507) (not b!351702)))

(declare-fun t!10371 () Bool)

(declare-fun tb!3099 () Bool)

(assert (=> (and start!35070 (= defaultEntry!1528 defaultEntry!1528) t!10371) tb!3099))

(declare-fun result!5627 () Bool)

(assert (=> tb!3099 (= result!5627 tp_is_empty!7689)))

(assert (=> b!351702 t!10371))

(declare-fun b_and!14973 () Bool)

(assert (= b_and!14969 (and (=> t!10371 result!5627) b_and!14973)))

(declare-fun m!351531 () Bool)

(assert (=> bm!27028 m!351531))

(assert (=> b!351698 m!351505))

(assert (=> b!351698 m!351505))

(declare-fun m!351533 () Bool)

(assert (=> b!351698 m!351533))

(declare-fun m!351535 () Bool)

(assert (=> b!351692 m!351535))

(assert (=> b!351702 m!351505))

(declare-fun m!351537 () Bool)

(assert (=> b!351702 m!351537))

(declare-fun m!351539 () Bool)

(assert (=> b!351702 m!351539))

(assert (=> b!351702 m!351539))

(declare-fun m!351541 () Bool)

(assert (=> b!351702 m!351541))

(declare-fun m!351543 () Bool)

(assert (=> b!351702 m!351543))

(assert (=> b!351702 m!351505))

(assert (=> b!351702 m!351541))

(declare-fun m!351545 () Bool)

(assert (=> bm!27024 m!351545))

(declare-fun m!351547 () Bool)

(assert (=> b!351693 m!351547))

(assert (=> b!351689 m!351505))

(assert (=> b!351689 m!351505))

(assert (=> b!351689 m!351515))

(declare-fun m!351549 () Bool)

(assert (=> bm!27022 m!351549))

(assert (=> d!71485 m!351447))

(declare-fun m!351551 () Bool)

(assert (=> b!351695 m!351551))

(declare-fun m!351553 () Bool)

(assert (=> b!351695 m!351553))

(declare-fun m!351555 () Bool)

(assert (=> b!351695 m!351555))

(declare-fun m!351557 () Bool)

(assert (=> b!351695 m!351557))

(assert (=> b!351695 m!351557))

(declare-fun m!351559 () Bool)

(assert (=> b!351695 m!351559))

(declare-fun m!351561 () Bool)

(assert (=> b!351695 m!351561))

(declare-fun m!351563 () Bool)

(assert (=> b!351695 m!351563))

(declare-fun m!351565 () Bool)

(assert (=> b!351695 m!351565))

(assert (=> b!351695 m!351505))

(assert (=> b!351695 m!351551))

(declare-fun m!351567 () Bool)

(assert (=> b!351695 m!351567))

(declare-fun m!351569 () Bool)

(assert (=> b!351695 m!351569))

(declare-fun m!351571 () Bool)

(assert (=> b!351695 m!351571))

(declare-fun m!351573 () Bool)

(assert (=> b!351695 m!351573))

(assert (=> b!351695 m!351545))

(assert (=> b!351695 m!351561))

(declare-fun m!351575 () Bool)

(assert (=> b!351695 m!351575))

(declare-fun m!351577 () Bool)

(assert (=> b!351695 m!351577))

(assert (=> b!351695 m!351573))

(declare-fun m!351579 () Bool)

(assert (=> b!351695 m!351579))

(assert (=> b!351696 m!351505))

(assert (=> b!351696 m!351505))

(assert (=> b!351696 m!351515))

(declare-fun m!351581 () Bool)

(assert (=> b!351686 m!351581))

(declare-fun m!351583 () Bool)

(assert (=> bm!27025 m!351583))

(assert (=> b!351548 d!71485))

(declare-fun d!71487 () Bool)

(declare-fun lt!164962 () (_ BitVec 32))

(assert (=> d!71487 (and (or (bvslt lt!164962 #b00000000000000000000000000000000) (bvsge lt!164962 (size!9341 _keys!1895)) (and (bvsge lt!164962 #b00000000000000000000000000000000) (bvslt lt!164962 (size!9341 _keys!1895)))) (bvsge lt!164962 #b00000000000000000000000000000000) (bvslt lt!164962 (size!9341 _keys!1895)) (= (select (arr!8989 _keys!1895) lt!164962) k0!1348))))

(declare-fun e!215382 () (_ BitVec 32))

(assert (=> d!71487 (= lt!164962 e!215382)))

(declare-fun c!53493 () Bool)

(assert (=> d!71487 (= c!53493 (= (select (arr!8989 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71487 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9341 _keys!1895)) (bvslt (size!9341 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71487 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164962)))

(declare-fun b!351712 () Bool)

(assert (=> b!351712 (= e!215382 #b00000000000000000000000000000000)))

(declare-fun b!351713 () Bool)

(assert (=> b!351713 (= e!215382 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71487 c!53493) b!351712))

(assert (= (and d!71487 (not c!53493)) b!351713))

(declare-fun m!351585 () Bool)

(assert (=> d!71487 m!351585))

(assert (=> d!71487 m!351505))

(declare-fun m!351587 () Bool)

(assert (=> b!351713 m!351587))

(assert (=> b!351551 d!71487))

(declare-fun d!71489 () Bool)

(assert (=> d!71489 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35070 d!71489))

(declare-fun d!71491 () Bool)

(assert (=> d!71491 (= (array_inv!6630 _values!1525) (bvsge (size!9340 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35070 d!71491))

(declare-fun d!71493 () Bool)

(assert (=> d!71493 (= (array_inv!6631 _keys!1895) (bvsge (size!9341 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35070 d!71493))

(declare-fun b!351724 () Bool)

(declare-fun e!215394 () Bool)

(declare-fun contains!2347 (List!5229 (_ BitVec 64)) Bool)

(assert (=> b!351724 (= e!215394 (contains!2347 Nil!5226 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351725 () Bool)

(declare-fun e!215391 () Bool)

(declare-fun call!27034 () Bool)

(assert (=> b!351725 (= e!215391 call!27034)))

(declare-fun b!351726 () Bool)

(declare-fun e!215393 () Bool)

(assert (=> b!351726 (= e!215393 e!215391)))

(declare-fun c!53496 () Bool)

(assert (=> b!351726 (= c!53496 (validKeyInArray!0 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27031 () Bool)

(assert (=> bm!27031 (= call!27034 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53496 (Cons!5225 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000) Nil!5226) Nil!5226)))))

(declare-fun d!71495 () Bool)

(declare-fun res!195039 () Bool)

(declare-fun e!215392 () Bool)

(assert (=> d!71495 (=> res!195039 e!215392)))

(assert (=> d!71495 (= res!195039 (bvsge #b00000000000000000000000000000000 (size!9341 _keys!1895)))))

(assert (=> d!71495 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5226) e!215392)))

(declare-fun b!351727 () Bool)

(assert (=> b!351727 (= e!215391 call!27034)))

(declare-fun b!351728 () Bool)

(assert (=> b!351728 (= e!215392 e!215393)))

(declare-fun res!195040 () Bool)

(assert (=> b!351728 (=> (not res!195040) (not e!215393))))

(assert (=> b!351728 (= res!195040 (not e!215394))))

(declare-fun res!195041 () Bool)

(assert (=> b!351728 (=> (not res!195041) (not e!215394))))

(assert (=> b!351728 (= res!195041 (validKeyInArray!0 (select (arr!8989 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71495 (not res!195039)) b!351728))

(assert (= (and b!351728 res!195041) b!351724))

(assert (= (and b!351728 res!195040) b!351726))

(assert (= (and b!351726 c!53496) b!351725))

(assert (= (and b!351726 (not c!53496)) b!351727))

(assert (= (or b!351725 b!351727) bm!27031))

(assert (=> b!351724 m!351505))

(assert (=> b!351724 m!351505))

(declare-fun m!351589 () Bool)

(assert (=> b!351724 m!351589))

(assert (=> b!351726 m!351505))

(assert (=> b!351726 m!351505))

(assert (=> b!351726 m!351515))

(assert (=> bm!27031 m!351505))

(declare-fun m!351591 () Bool)

(assert (=> bm!27031 m!351591))

(assert (=> b!351728 m!351505))

(assert (=> b!351728 m!351505))

(assert (=> b!351728 m!351515))

(assert (=> b!351552 d!71495))

(declare-fun condMapEmpty!13014 () Bool)

(declare-fun mapDefault!13014 () ValueCell!3501)

(assert (=> mapNonEmpty!13008 (= condMapEmpty!13014 (= mapRest!13008 ((as const (Array (_ BitVec 32) ValueCell!3501)) mapDefault!13014)))))

(declare-fun e!215399 () Bool)

(declare-fun mapRes!13014 () Bool)

(assert (=> mapNonEmpty!13008 (= tp!26793 (and e!215399 mapRes!13014))))

(declare-fun mapIsEmpty!13014 () Bool)

(assert (=> mapIsEmpty!13014 mapRes!13014))

(declare-fun b!351736 () Bool)

(assert (=> b!351736 (= e!215399 tp_is_empty!7689)))

(declare-fun b!351735 () Bool)

(declare-fun e!215400 () Bool)

(assert (=> b!351735 (= e!215400 tp_is_empty!7689)))

(declare-fun mapNonEmpty!13014 () Bool)

(declare-fun tp!26802 () Bool)

(assert (=> mapNonEmpty!13014 (= mapRes!13014 (and tp!26802 e!215400))))

(declare-fun mapKey!13014 () (_ BitVec 32))

(declare-fun mapValue!13014 () ValueCell!3501)

(declare-fun mapRest!13014 () (Array (_ BitVec 32) ValueCell!3501))

(assert (=> mapNonEmpty!13014 (= mapRest!13008 (store mapRest!13014 mapKey!13014 mapValue!13014))))

(assert (= (and mapNonEmpty!13008 condMapEmpty!13014) mapIsEmpty!13014))

(assert (= (and mapNonEmpty!13008 (not condMapEmpty!13014)) mapNonEmpty!13014))

(assert (= (and mapNonEmpty!13014 ((_ is ValueCellFull!3501) mapValue!13014)) b!351735))

(assert (= (and mapNonEmpty!13008 ((_ is ValueCellFull!3501) mapDefault!13014)) b!351736))

(declare-fun m!351593 () Bool)

(assert (=> mapNonEmpty!13014 m!351593))

(declare-fun b_lambda!8509 () Bool)

(assert (= b_lambda!8507 (or (and start!35070 b_free!7737) b_lambda!8509)))

(check-sat (not mapNonEmpty!13014) (not b!351724) (not b!351695) (not bm!27022) (not bm!27024) (not d!71485) (not b!351642) (not bm!27031) (not b!351686) (not b!351625) (not b!351633) (not b!351631) (not b!351624) (not b!351726) (not bm!27007) (not bm!27028) (not d!71483) (not b!351689) (not b!351693) (not b!351640) (not b!351713) tp_is_empty!7689 (not bm!27025) (not b!351698) (not b!351728) (not b!351692) (not b!351613) (not b!351696) (not b!351702) (not b_next!7737) b_and!14973 (not b_lambda!8509) (not d!71475))
(check-sat b_and!14973 (not b_next!7737))
