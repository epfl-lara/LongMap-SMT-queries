; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34224 () Bool)

(assert start!34224)

(declare-fun b_free!7261 () Bool)

(declare-fun b_next!7261 () Bool)

(assert (=> start!34224 (= b_free!7261 (not b_next!7261))))

(declare-fun tp!25316 () Bool)

(declare-fun b_and!14435 () Bool)

(assert (=> start!34224 (= tp!25316 b_and!14435)))

(declare-fun res!188766 () Bool)

(declare-fun e!209346 () Bool)

(assert (=> start!34224 (=> (not res!188766) (not e!209346))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34224 (= res!188766 (validMask!0 mask!2385))))

(assert (=> start!34224 e!209346))

(assert (=> start!34224 true))

(declare-fun tp_is_empty!7213 () Bool)

(assert (=> start!34224 tp_is_empty!7213))

(assert (=> start!34224 tp!25316))

(declare-datatypes ((V!10595 0))(
  ( (V!10596 (val!3651 Int)) )
))
(declare-datatypes ((ValueCell!3263 0))(
  ( (ValueCellFull!3263 (v!5817 V!10595)) (EmptyCell!3263) )
))
(declare-datatypes ((array!18001 0))(
  ( (array!18002 (arr!8521 (Array (_ BitVec 32) ValueCell!3263)) (size!8874 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18001)

(declare-fun e!209349 () Bool)

(declare-fun array_inv!6338 (array!18001) Bool)

(assert (=> start!34224 (and (array_inv!6338 _values!1525) e!209349)))

(declare-datatypes ((array!18003 0))(
  ( (array!18004 (arr!8522 (Array (_ BitVec 32) (_ BitVec 64))) (size!8875 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18003)

(declare-fun array_inv!6339 (array!18003) Bool)

(assert (=> start!34224 (array_inv!6339 _keys!1895)))

(declare-fun b!341386 () Bool)

(declare-fun e!209345 () Bool)

(assert (=> b!341386 (= e!209346 e!209345)))

(declare-fun res!188769 () Bool)

(assert (=> b!341386 (=> (not res!188769) (not e!209345))))

(declare-datatypes ((SeekEntryResult!3283 0))(
  ( (MissingZero!3283 (index!15311 (_ BitVec 32))) (Found!3283 (index!15312 (_ BitVec 32))) (Intermediate!3283 (undefined!4095 Bool) (index!15313 (_ BitVec 32)) (x!34016 (_ BitVec 32))) (Undefined!3283) (MissingVacant!3283 (index!15314 (_ BitVec 32))) )
))
(declare-fun lt!161586 () SeekEntryResult!3283)

(get-info :version)

(assert (=> b!341386 (= res!188769 (and (not ((_ is Found!3283) lt!161586)) (not ((_ is MissingZero!3283) lt!161586)) ((_ is MissingVacant!3283) lt!161586)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18003 (_ BitVec 32)) SeekEntryResult!3283)

(assert (=> b!341386 (= lt!161586 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341387 () Bool)

(declare-fun res!188765 () Bool)

(assert (=> b!341387 (=> (not res!188765) (not e!209346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341387 (= res!188765 (validKeyInArray!0 k0!1348))))

(declare-fun b!341388 () Bool)

(assert (=> b!341388 (= e!209345 (bvsge #b00000000000000000000000000000000 (size!8875 _keys!1895)))))

(declare-datatypes ((Unit!10580 0))(
  ( (Unit!10581) )
))
(declare-fun lt!161585 () Unit!10580)

(declare-fun e!209347 () Unit!10580)

(assert (=> b!341388 (= lt!161585 e!209347)))

(declare-fun c!52622 () Bool)

(declare-fun arrayContainsKey!0 (array!18003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341388 (= c!52622 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341389 () Bool)

(declare-fun e!209344 () Bool)

(assert (=> b!341389 (= e!209344 tp_is_empty!7213)))

(declare-fun b!341390 () Bool)

(declare-fun res!188767 () Bool)

(assert (=> b!341390 (=> (not res!188767) (not e!209346))))

(declare-fun zeroValue!1467 () V!10595)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10595)

(declare-datatypes ((tuple2!5238 0))(
  ( (tuple2!5239 (_1!2630 (_ BitVec 64)) (_2!2630 V!10595)) )
))
(declare-datatypes ((List!4862 0))(
  ( (Nil!4859) (Cons!4858 (h!5714 tuple2!5238) (t!9961 List!4862)) )
))
(declare-datatypes ((ListLongMap!4141 0))(
  ( (ListLongMap!4142 (toList!2086 List!4862)) )
))
(declare-fun contains!2151 (ListLongMap!4141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1592 (array!18003 array!18001 (_ BitVec 32) (_ BitVec 32) V!10595 V!10595 (_ BitVec 32) Int) ListLongMap!4141)

(assert (=> b!341390 (= res!188767 (not (contains!2151 (getCurrentListMap!1592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341391 () Bool)

(declare-fun e!209350 () Bool)

(assert (=> b!341391 (= e!209350 tp_is_empty!7213)))

(declare-fun b!341392 () Bool)

(declare-fun res!188768 () Bool)

(assert (=> b!341392 (=> (not res!188768) (not e!209346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18003 (_ BitVec 32)) Bool)

(assert (=> b!341392 (= res!188768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341393 () Bool)

(declare-fun res!188771 () Bool)

(assert (=> b!341393 (=> (not res!188771) (not e!209346))))

(assert (=> b!341393 (= res!188771 (and (= (size!8874 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8875 _keys!1895) (size!8874 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12246 () Bool)

(declare-fun mapRes!12246 () Bool)

(declare-fun tp!25317 () Bool)

(assert (=> mapNonEmpty!12246 (= mapRes!12246 (and tp!25317 e!209344))))

(declare-fun mapValue!12246 () ValueCell!3263)

(declare-fun mapRest!12246 () (Array (_ BitVec 32) ValueCell!3263))

(declare-fun mapKey!12246 () (_ BitVec 32))

(assert (=> mapNonEmpty!12246 (= (arr!8521 _values!1525) (store mapRest!12246 mapKey!12246 mapValue!12246))))

(declare-fun b!341394 () Bool)

(assert (=> b!341394 (= e!209349 (and e!209350 mapRes!12246))))

(declare-fun condMapEmpty!12246 () Bool)

(declare-fun mapDefault!12246 () ValueCell!3263)

(assert (=> b!341394 (= condMapEmpty!12246 (= (arr!8521 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3263)) mapDefault!12246)))))

(declare-fun b!341395 () Bool)

(declare-fun res!188770 () Bool)

(assert (=> b!341395 (=> (not res!188770) (not e!209346))))

(declare-datatypes ((List!4863 0))(
  ( (Nil!4860) (Cons!4859 (h!5715 (_ BitVec 64)) (t!9962 List!4863)) )
))
(declare-fun arrayNoDuplicates!0 (array!18003 (_ BitVec 32) List!4863) Bool)

(assert (=> b!341395 (= res!188770 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4860))))

(declare-fun b!341396 () Bool)

(declare-fun Unit!10582 () Unit!10580)

(assert (=> b!341396 (= e!209347 Unit!10582)))

(declare-fun lt!161584 () Unit!10580)

(declare-fun lemmaArrayContainsKeyThenInListMap!290 (array!18003 array!18001 (_ BitVec 32) (_ BitVec 32) V!10595 V!10595 (_ BitVec 64) (_ BitVec 32) Int) Unit!10580)

(declare-fun arrayScanForKey!0 (array!18003 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341396 (= lt!161584 (lemmaArrayContainsKeyThenInListMap!290 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341396 false))

(declare-fun b!341397 () Bool)

(declare-fun Unit!10583 () Unit!10580)

(assert (=> b!341397 (= e!209347 Unit!10583)))

(declare-fun mapIsEmpty!12246 () Bool)

(assert (=> mapIsEmpty!12246 mapRes!12246))

(assert (= (and start!34224 res!188766) b!341393))

(assert (= (and b!341393 res!188771) b!341392))

(assert (= (and b!341392 res!188768) b!341395))

(assert (= (and b!341395 res!188770) b!341387))

(assert (= (and b!341387 res!188765) b!341390))

(assert (= (and b!341390 res!188767) b!341386))

(assert (= (and b!341386 res!188769) b!341388))

(assert (= (and b!341388 c!52622) b!341396))

(assert (= (and b!341388 (not c!52622)) b!341397))

(assert (= (and b!341394 condMapEmpty!12246) mapIsEmpty!12246))

(assert (= (and b!341394 (not condMapEmpty!12246)) mapNonEmpty!12246))

(assert (= (and mapNonEmpty!12246 ((_ is ValueCellFull!3263) mapValue!12246)) b!341389))

(assert (= (and b!341394 ((_ is ValueCellFull!3263) mapDefault!12246)) b!341391))

(assert (= start!34224 b!341394))

(declare-fun m!343299 () Bool)

(assert (=> b!341396 m!343299))

(assert (=> b!341396 m!343299))

(declare-fun m!343301 () Bool)

(assert (=> b!341396 m!343301))

(declare-fun m!343303 () Bool)

(assert (=> b!341392 m!343303))

(declare-fun m!343305 () Bool)

(assert (=> b!341387 m!343305))

(declare-fun m!343307 () Bool)

(assert (=> mapNonEmpty!12246 m!343307))

(declare-fun m!343309 () Bool)

(assert (=> start!34224 m!343309))

(declare-fun m!343311 () Bool)

(assert (=> start!34224 m!343311))

(declare-fun m!343313 () Bool)

(assert (=> start!34224 m!343313))

(declare-fun m!343315 () Bool)

(assert (=> b!341390 m!343315))

(assert (=> b!341390 m!343315))

(declare-fun m!343317 () Bool)

(assert (=> b!341390 m!343317))

(declare-fun m!343319 () Bool)

(assert (=> b!341395 m!343319))

(declare-fun m!343321 () Bool)

(assert (=> b!341388 m!343321))

(declare-fun m!343323 () Bool)

(assert (=> b!341386 m!343323))

(check-sat (not b_next!7261) (not b!341386) (not b!341387) (not b!341392) (not b!341390) (not b!341388) (not b!341395) (not start!34224) (not b!341396) tp_is_empty!7213 (not mapNonEmpty!12246) b_and!14435)
(check-sat b_and!14435 (not b_next!7261))
(get-model)

(declare-fun d!70749 () Bool)

(assert (=> d!70749 (contains!2151 (getCurrentListMap!1592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!161607 () Unit!10580)

(declare-fun choose!1309 (array!18003 array!18001 (_ BitVec 32) (_ BitVec 32) V!10595 V!10595 (_ BitVec 64) (_ BitVec 32) Int) Unit!10580)

(assert (=> d!70749 (= lt!161607 (choose!1309 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70749 (validMask!0 mask!2385)))

(assert (=> d!70749 (= (lemmaArrayContainsKeyThenInListMap!290 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!161607)))

(declare-fun bs!11700 () Bool)

(assert (= bs!11700 d!70749))

(assert (=> bs!11700 m!343315))

(assert (=> bs!11700 m!343315))

(assert (=> bs!11700 m!343317))

(assert (=> bs!11700 m!343299))

(declare-fun m!343377 () Bool)

(assert (=> bs!11700 m!343377))

(assert (=> bs!11700 m!343309))

(assert (=> b!341396 d!70749))

(declare-fun d!70751 () Bool)

(declare-fun lt!161610 () (_ BitVec 32))

(assert (=> d!70751 (and (or (bvslt lt!161610 #b00000000000000000000000000000000) (bvsge lt!161610 (size!8875 _keys!1895)) (and (bvsge lt!161610 #b00000000000000000000000000000000) (bvslt lt!161610 (size!8875 _keys!1895)))) (bvsge lt!161610 #b00000000000000000000000000000000) (bvslt lt!161610 (size!8875 _keys!1895)) (= (select (arr!8522 _keys!1895) lt!161610) k0!1348))))

(declare-fun e!209395 () (_ BitVec 32))

(assert (=> d!70751 (= lt!161610 e!209395)))

(declare-fun c!52631 () Bool)

(assert (=> d!70751 (= c!52631 (= (select (arr!8522 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70751 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8875 _keys!1895)) (bvslt (size!8875 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70751 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!161610)))

(declare-fun b!341474 () Bool)

(assert (=> b!341474 (= e!209395 #b00000000000000000000000000000000)))

(declare-fun b!341475 () Bool)

(assert (=> b!341475 (= e!209395 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70751 c!52631) b!341474))

(assert (= (and d!70751 (not c!52631)) b!341475))

(declare-fun m!343379 () Bool)

(assert (=> d!70751 m!343379))

(declare-fun m!343381 () Bool)

(assert (=> d!70751 m!343381))

(declare-fun m!343383 () Bool)

(assert (=> b!341475 m!343383))

(assert (=> b!341396 d!70751))

(declare-fun d!70753 () Bool)

(declare-fun res!188818 () Bool)

(declare-fun e!209403 () Bool)

(assert (=> d!70753 (=> res!188818 e!209403)))

(assert (=> d!70753 (= res!188818 (bvsge #b00000000000000000000000000000000 (size!8875 _keys!1895)))))

(assert (=> d!70753 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!209403)))

(declare-fun b!341484 () Bool)

(declare-fun e!209402 () Bool)

(declare-fun e!209404 () Bool)

(assert (=> b!341484 (= e!209402 e!209404)))

(declare-fun lt!161617 () (_ BitVec 64))

(assert (=> b!341484 (= lt!161617 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161619 () Unit!10580)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18003 (_ BitVec 64) (_ BitVec 32)) Unit!10580)

(assert (=> b!341484 (= lt!161619 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161617 #b00000000000000000000000000000000))))

(assert (=> b!341484 (arrayContainsKey!0 _keys!1895 lt!161617 #b00000000000000000000000000000000)))

(declare-fun lt!161618 () Unit!10580)

(assert (=> b!341484 (= lt!161618 lt!161619)))

(declare-fun res!188819 () Bool)

(assert (=> b!341484 (= res!188819 (= (seekEntryOrOpen!0 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3283 #b00000000000000000000000000000000)))))

(assert (=> b!341484 (=> (not res!188819) (not e!209404))))

(declare-fun b!341485 () Bool)

(assert (=> b!341485 (= e!209403 e!209402)))

(declare-fun c!52634 () Bool)

(assert (=> b!341485 (= c!52634 (validKeyInArray!0 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26540 () Bool)

(declare-fun call!26543 () Bool)

(assert (=> bm!26540 (= call!26543 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!341486 () Bool)

(assert (=> b!341486 (= e!209404 call!26543)))

(declare-fun b!341487 () Bool)

(assert (=> b!341487 (= e!209402 call!26543)))

(assert (= (and d!70753 (not res!188818)) b!341485))

(assert (= (and b!341485 c!52634) b!341484))

(assert (= (and b!341485 (not c!52634)) b!341487))

(assert (= (and b!341484 res!188819) b!341486))

(assert (= (or b!341486 b!341487) bm!26540))

(assert (=> b!341484 m!343381))

(declare-fun m!343385 () Bool)

(assert (=> b!341484 m!343385))

(declare-fun m!343387 () Bool)

(assert (=> b!341484 m!343387))

(assert (=> b!341484 m!343381))

(declare-fun m!343389 () Bool)

(assert (=> b!341484 m!343389))

(assert (=> b!341485 m!343381))

(assert (=> b!341485 m!343381))

(declare-fun m!343391 () Bool)

(assert (=> b!341485 m!343391))

(declare-fun m!343393 () Bool)

(assert (=> bm!26540 m!343393))

(assert (=> b!341392 d!70753))

(declare-fun d!70755 () Bool)

(assert (=> d!70755 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!341387 d!70755))

(declare-fun b!341498 () Bool)

(declare-fun e!209415 () Bool)

(declare-fun contains!2154 (List!4863 (_ BitVec 64)) Bool)

(assert (=> b!341498 (= e!209415 (contains!2154 Nil!4860 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26543 () Bool)

(declare-fun call!26546 () Bool)

(declare-fun c!52637 () Bool)

(assert (=> bm!26543 (= call!26546 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52637 (Cons!4859 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000) Nil!4860) Nil!4860)))))

(declare-fun b!341499 () Bool)

(declare-fun e!209413 () Bool)

(declare-fun e!209416 () Bool)

(assert (=> b!341499 (= e!209413 e!209416)))

(declare-fun res!188826 () Bool)

(assert (=> b!341499 (=> (not res!188826) (not e!209416))))

(assert (=> b!341499 (= res!188826 (not e!209415))))

(declare-fun res!188828 () Bool)

(assert (=> b!341499 (=> (not res!188828) (not e!209415))))

(assert (=> b!341499 (= res!188828 (validKeyInArray!0 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70757 () Bool)

(declare-fun res!188827 () Bool)

(assert (=> d!70757 (=> res!188827 e!209413)))

(assert (=> d!70757 (= res!188827 (bvsge #b00000000000000000000000000000000 (size!8875 _keys!1895)))))

(assert (=> d!70757 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4860) e!209413)))

(declare-fun b!341500 () Bool)

(declare-fun e!209414 () Bool)

(assert (=> b!341500 (= e!209414 call!26546)))

(declare-fun b!341501 () Bool)

(assert (=> b!341501 (= e!209416 e!209414)))

(assert (=> b!341501 (= c!52637 (validKeyInArray!0 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341502 () Bool)

(assert (=> b!341502 (= e!209414 call!26546)))

(assert (= (and d!70757 (not res!188827)) b!341499))

(assert (= (and b!341499 res!188828) b!341498))

(assert (= (and b!341499 res!188826) b!341501))

(assert (= (and b!341501 c!52637) b!341502))

(assert (= (and b!341501 (not c!52637)) b!341500))

(assert (= (or b!341502 b!341500) bm!26543))

(assert (=> b!341498 m!343381))

(assert (=> b!341498 m!343381))

(declare-fun m!343395 () Bool)

(assert (=> b!341498 m!343395))

(assert (=> bm!26543 m!343381))

(declare-fun m!343397 () Bool)

(assert (=> bm!26543 m!343397))

(assert (=> b!341499 m!343381))

(assert (=> b!341499 m!343381))

(assert (=> b!341499 m!343391))

(assert (=> b!341501 m!343381))

(assert (=> b!341501 m!343381))

(assert (=> b!341501 m!343391))

(assert (=> b!341395 d!70757))

(declare-fun b!341516 () Bool)

(declare-fun e!209424 () SeekEntryResult!3283)

(declare-fun lt!161628 () SeekEntryResult!3283)

(assert (=> b!341516 (= e!209424 (MissingZero!3283 (index!15313 lt!161628)))))

(declare-fun b!341517 () Bool)

(declare-fun e!209425 () SeekEntryResult!3283)

(assert (=> b!341517 (= e!209425 (Found!3283 (index!15313 lt!161628)))))

(declare-fun b!341518 () Bool)

(declare-fun e!209423 () SeekEntryResult!3283)

(assert (=> b!341518 (= e!209423 Undefined!3283)))

(declare-fun d!70759 () Bool)

(declare-fun lt!161626 () SeekEntryResult!3283)

(assert (=> d!70759 (and (or ((_ is Undefined!3283) lt!161626) (not ((_ is Found!3283) lt!161626)) (and (bvsge (index!15312 lt!161626) #b00000000000000000000000000000000) (bvslt (index!15312 lt!161626) (size!8875 _keys!1895)))) (or ((_ is Undefined!3283) lt!161626) ((_ is Found!3283) lt!161626) (not ((_ is MissingZero!3283) lt!161626)) (and (bvsge (index!15311 lt!161626) #b00000000000000000000000000000000) (bvslt (index!15311 lt!161626) (size!8875 _keys!1895)))) (or ((_ is Undefined!3283) lt!161626) ((_ is Found!3283) lt!161626) ((_ is MissingZero!3283) lt!161626) (not ((_ is MissingVacant!3283) lt!161626)) (and (bvsge (index!15314 lt!161626) #b00000000000000000000000000000000) (bvslt (index!15314 lt!161626) (size!8875 _keys!1895)))) (or ((_ is Undefined!3283) lt!161626) (ite ((_ is Found!3283) lt!161626) (= (select (arr!8522 _keys!1895) (index!15312 lt!161626)) k0!1348) (ite ((_ is MissingZero!3283) lt!161626) (= (select (arr!8522 _keys!1895) (index!15311 lt!161626)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3283) lt!161626) (= (select (arr!8522 _keys!1895) (index!15314 lt!161626)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70759 (= lt!161626 e!209423)))

(declare-fun c!52646 () Bool)

(assert (=> d!70759 (= c!52646 (and ((_ is Intermediate!3283) lt!161628) (undefined!4095 lt!161628)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18003 (_ BitVec 32)) SeekEntryResult!3283)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70759 (= lt!161628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70759 (validMask!0 mask!2385)))

(assert (=> d!70759 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161626)))

(declare-fun b!341515 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18003 (_ BitVec 32)) SeekEntryResult!3283)

(assert (=> b!341515 (= e!209424 (seekKeyOrZeroReturnVacant!0 (x!34016 lt!161628) (index!15313 lt!161628) (index!15313 lt!161628) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341519 () Bool)

(assert (=> b!341519 (= e!209423 e!209425)))

(declare-fun lt!161627 () (_ BitVec 64))

(assert (=> b!341519 (= lt!161627 (select (arr!8522 _keys!1895) (index!15313 lt!161628)))))

(declare-fun c!52645 () Bool)

(assert (=> b!341519 (= c!52645 (= lt!161627 k0!1348))))

(declare-fun b!341520 () Bool)

(declare-fun c!52644 () Bool)

(assert (=> b!341520 (= c!52644 (= lt!161627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!341520 (= e!209425 e!209424)))

(assert (= (and d!70759 c!52646) b!341518))

(assert (= (and d!70759 (not c!52646)) b!341519))

(assert (= (and b!341519 c!52645) b!341517))

(assert (= (and b!341519 (not c!52645)) b!341520))

(assert (= (and b!341520 c!52644) b!341516))

(assert (= (and b!341520 (not c!52644)) b!341515))

(declare-fun m!343399 () Bool)

(assert (=> d!70759 m!343399))

(declare-fun m!343401 () Bool)

(assert (=> d!70759 m!343401))

(declare-fun m!343403 () Bool)

(assert (=> d!70759 m!343403))

(declare-fun m!343405 () Bool)

(assert (=> d!70759 m!343405))

(declare-fun m!343407 () Bool)

(assert (=> d!70759 m!343407))

(assert (=> d!70759 m!343309))

(assert (=> d!70759 m!343405))

(declare-fun m!343409 () Bool)

(assert (=> b!341515 m!343409))

(declare-fun m!343411 () Bool)

(assert (=> b!341519 m!343411))

(assert (=> b!341386 d!70759))

(declare-fun d!70761 () Bool)

(assert (=> d!70761 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34224 d!70761))

(declare-fun d!70763 () Bool)

(assert (=> d!70763 (= (array_inv!6338 _values!1525) (bvsge (size!8874 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34224 d!70763))

(declare-fun d!70765 () Bool)

(assert (=> d!70765 (= (array_inv!6339 _keys!1895) (bvsge (size!8875 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34224 d!70765))

(declare-fun d!70767 () Bool)

(declare-fun e!209430 () Bool)

(assert (=> d!70767 e!209430))

(declare-fun res!188831 () Bool)

(assert (=> d!70767 (=> res!188831 e!209430)))

(declare-fun lt!161637 () Bool)

(assert (=> d!70767 (= res!188831 (not lt!161637))))

(declare-fun lt!161640 () Bool)

(assert (=> d!70767 (= lt!161637 lt!161640)))

(declare-fun lt!161638 () Unit!10580)

(declare-fun e!209431 () Unit!10580)

(assert (=> d!70767 (= lt!161638 e!209431)))

(declare-fun c!52649 () Bool)

(assert (=> d!70767 (= c!52649 lt!161640)))

(declare-fun containsKey!324 (List!4862 (_ BitVec 64)) Bool)

(assert (=> d!70767 (= lt!161640 (containsKey!324 (toList!2086 (getCurrentListMap!1592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70767 (= (contains!2151 (getCurrentListMap!1592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161637)))

(declare-fun b!341527 () Bool)

(declare-fun lt!161639 () Unit!10580)

(assert (=> b!341527 (= e!209431 lt!161639)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!273 (List!4862 (_ BitVec 64)) Unit!10580)

(assert (=> b!341527 (= lt!161639 (lemmaContainsKeyImpliesGetValueByKeyDefined!273 (toList!2086 (getCurrentListMap!1592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!338 0))(
  ( (Some!337 (v!5820 V!10595)) (None!336) )
))
(declare-fun isDefined!274 (Option!338) Bool)

(declare-fun getValueByKey!332 (List!4862 (_ BitVec 64)) Option!338)

(assert (=> b!341527 (isDefined!274 (getValueByKey!332 (toList!2086 (getCurrentListMap!1592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!341528 () Bool)

(declare-fun Unit!10589 () Unit!10580)

(assert (=> b!341528 (= e!209431 Unit!10589)))

(declare-fun b!341529 () Bool)

(assert (=> b!341529 (= e!209430 (isDefined!274 (getValueByKey!332 (toList!2086 (getCurrentListMap!1592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70767 c!52649) b!341527))

(assert (= (and d!70767 (not c!52649)) b!341528))

(assert (= (and d!70767 (not res!188831)) b!341529))

(declare-fun m!343413 () Bool)

(assert (=> d!70767 m!343413))

(declare-fun m!343415 () Bool)

(assert (=> b!341527 m!343415))

(declare-fun m!343417 () Bool)

(assert (=> b!341527 m!343417))

(assert (=> b!341527 m!343417))

(declare-fun m!343419 () Bool)

(assert (=> b!341527 m!343419))

(assert (=> b!341529 m!343417))

(assert (=> b!341529 m!343417))

(assert (=> b!341529 m!343419))

(assert (=> b!341390 d!70767))

(declare-fun b!341572 () Bool)

(declare-fun e!209467 () ListLongMap!4141)

(declare-fun call!26566 () ListLongMap!4141)

(declare-fun +!729 (ListLongMap!4141 tuple2!5238) ListLongMap!4141)

(assert (=> b!341572 (= e!209467 (+!729 call!26566 (tuple2!5239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!341573 () Bool)

(declare-fun c!52663 () Bool)

(assert (=> b!341573 (= c!52663 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!209460 () ListLongMap!4141)

(declare-fun e!209459 () ListLongMap!4141)

(assert (=> b!341573 (= e!209460 e!209459)))

(declare-fun b!341575 () Bool)

(declare-fun e!209463 () Bool)

(declare-fun e!209464 () Bool)

(assert (=> b!341575 (= e!209463 e!209464)))

(declare-fun res!188857 () Bool)

(assert (=> b!341575 (=> (not res!188857) (not e!209464))))

(declare-fun lt!161692 () ListLongMap!4141)

(assert (=> b!341575 (= res!188857 (contains!2151 lt!161692 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!341575 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8875 _keys!1895)))))

(declare-fun bm!26558 () Bool)

(declare-fun call!26565 () ListLongMap!4141)

(assert (=> bm!26558 (= call!26565 call!26566)))

(declare-fun b!341576 () Bool)

(declare-fun e!209469 () Unit!10580)

(declare-fun Unit!10590 () Unit!10580)

(assert (=> b!341576 (= e!209469 Unit!10590)))

(declare-fun b!341577 () Bool)

(declare-fun e!209458 () Bool)

(declare-fun e!209462 () Bool)

(assert (=> b!341577 (= e!209458 e!209462)))

(declare-fun res!188855 () Bool)

(declare-fun call!26567 () Bool)

(assert (=> b!341577 (= res!188855 call!26567)))

(assert (=> b!341577 (=> (not res!188855) (not e!209462))))

(declare-fun b!341578 () Bool)

(assert (=> b!341578 (= e!209458 (not call!26567))))

(declare-fun bm!26559 () Bool)

(declare-fun call!26562 () Bool)

(assert (=> bm!26559 (= call!26562 (contains!2151 lt!161692 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!341579 () Bool)

(declare-fun res!188852 () Bool)

(declare-fun e!209465 () Bool)

(assert (=> b!341579 (=> (not res!188852) (not e!209465))))

(assert (=> b!341579 (= res!188852 e!209458)))

(declare-fun c!52666 () Bool)

(assert (=> b!341579 (= c!52666 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!341580 () Bool)

(declare-fun e!209461 () Bool)

(assert (=> b!341580 (= e!209461 (validKeyInArray!0 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341581 () Bool)

(declare-fun res!188856 () Bool)

(assert (=> b!341581 (=> (not res!188856) (not e!209465))))

(assert (=> b!341581 (= res!188856 e!209463)))

(declare-fun res!188850 () Bool)

(assert (=> b!341581 (=> res!188850 e!209463)))

(declare-fun e!209470 () Bool)

(assert (=> b!341581 (= res!188850 (not e!209470))))

(declare-fun res!188854 () Bool)

(assert (=> b!341581 (=> (not res!188854) (not e!209470))))

(assert (=> b!341581 (= res!188854 (bvslt #b00000000000000000000000000000000 (size!8875 _keys!1895)))))

(declare-fun b!341582 () Bool)

(declare-fun e!209468 () Bool)

(declare-fun apply!276 (ListLongMap!4141 (_ BitVec 64)) V!10595)

(assert (=> b!341582 (= e!209468 (= (apply!276 lt!161692 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!341583 () Bool)

(assert (=> b!341583 (= e!209459 call!26565)))

(declare-fun bm!26560 () Bool)

(declare-fun call!26563 () ListLongMap!4141)

(declare-fun call!26561 () ListLongMap!4141)

(assert (=> bm!26560 (= call!26563 call!26561)))

(declare-fun b!341584 () Bool)

(assert (=> b!341584 (= e!209467 e!209460)))

(declare-fun c!52662 () Bool)

(assert (=> b!341584 (= c!52662 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!341585 () Bool)

(declare-fun e!209466 () Bool)

(assert (=> b!341585 (= e!209466 (not call!26562))))

(declare-fun bm!26561 () Bool)

(assert (=> bm!26561 (= call!26567 (contains!2151 lt!161692 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!341574 () Bool)

(assert (=> b!341574 (= e!209462 (= (apply!276 lt!161692 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun d!70769 () Bool)

(assert (=> d!70769 e!209465))

(declare-fun res!188858 () Bool)

(assert (=> d!70769 (=> (not res!188858) (not e!209465))))

(assert (=> d!70769 (= res!188858 (or (bvsge #b00000000000000000000000000000000 (size!8875 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8875 _keys!1895)))))))

(declare-fun lt!161690 () ListLongMap!4141)

(assert (=> d!70769 (= lt!161692 lt!161690)))

(declare-fun lt!161704 () Unit!10580)

(assert (=> d!70769 (= lt!161704 e!209469)))

(declare-fun c!52665 () Bool)

(assert (=> d!70769 (= c!52665 e!209461)))

(declare-fun res!188853 () Bool)

(assert (=> d!70769 (=> (not res!188853) (not e!209461))))

(assert (=> d!70769 (= res!188853 (bvslt #b00000000000000000000000000000000 (size!8875 _keys!1895)))))

(assert (=> d!70769 (= lt!161690 e!209467)))

(declare-fun c!52664 () Bool)

(assert (=> d!70769 (= c!52664 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70769 (validMask!0 mask!2385)))

(assert (=> d!70769 (= (getCurrentListMap!1592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161692)))

(declare-fun bm!26562 () Bool)

(declare-fun call!26564 () ListLongMap!4141)

(assert (=> bm!26562 (= call!26566 (+!729 (ite c!52664 call!26564 (ite c!52662 call!26561 call!26563)) (ite (or c!52664 c!52662) (tuple2!5239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!341586 () Bool)

(declare-fun get!4620 (ValueCell!3263 V!10595) V!10595)

(declare-fun dynLambda!610 (Int (_ BitVec 64)) V!10595)

(assert (=> b!341586 (= e!209464 (= (apply!276 lt!161692 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000)) (get!4620 (select (arr!8521 _values!1525) #b00000000000000000000000000000000) (dynLambda!610 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!341586 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8874 _values!1525)))))

(assert (=> b!341586 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8875 _keys!1895)))))

(declare-fun b!341587 () Bool)

(declare-fun lt!161685 () Unit!10580)

(assert (=> b!341587 (= e!209469 lt!161685)))

(declare-fun lt!161689 () ListLongMap!4141)

(declare-fun getCurrentListMapNoExtraKeys!592 (array!18003 array!18001 (_ BitVec 32) (_ BitVec 32) V!10595 V!10595 (_ BitVec 32) Int) ListLongMap!4141)

(assert (=> b!341587 (= lt!161689 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161691 () (_ BitVec 64))

(assert (=> b!341587 (= lt!161691 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161696 () (_ BitVec 64))

(assert (=> b!341587 (= lt!161696 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161694 () Unit!10580)

(declare-fun addStillContains!252 (ListLongMap!4141 (_ BitVec 64) V!10595 (_ BitVec 64)) Unit!10580)

(assert (=> b!341587 (= lt!161694 (addStillContains!252 lt!161689 lt!161691 zeroValue!1467 lt!161696))))

(assert (=> b!341587 (contains!2151 (+!729 lt!161689 (tuple2!5239 lt!161691 zeroValue!1467)) lt!161696)))

(declare-fun lt!161698 () Unit!10580)

(assert (=> b!341587 (= lt!161698 lt!161694)))

(declare-fun lt!161700 () ListLongMap!4141)

(assert (=> b!341587 (= lt!161700 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161688 () (_ BitVec 64))

(assert (=> b!341587 (= lt!161688 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161697 () (_ BitVec 64))

(assert (=> b!341587 (= lt!161697 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161701 () Unit!10580)

(declare-fun addApplyDifferent!252 (ListLongMap!4141 (_ BitVec 64) V!10595 (_ BitVec 64)) Unit!10580)

(assert (=> b!341587 (= lt!161701 (addApplyDifferent!252 lt!161700 lt!161688 minValue!1467 lt!161697))))

(assert (=> b!341587 (= (apply!276 (+!729 lt!161700 (tuple2!5239 lt!161688 minValue!1467)) lt!161697) (apply!276 lt!161700 lt!161697))))

(declare-fun lt!161706 () Unit!10580)

(assert (=> b!341587 (= lt!161706 lt!161701)))

(declare-fun lt!161705 () ListLongMap!4141)

(assert (=> b!341587 (= lt!161705 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161702 () (_ BitVec 64))

(assert (=> b!341587 (= lt!161702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161693 () (_ BitVec 64))

(assert (=> b!341587 (= lt!161693 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161686 () Unit!10580)

(assert (=> b!341587 (= lt!161686 (addApplyDifferent!252 lt!161705 lt!161702 zeroValue!1467 lt!161693))))

(assert (=> b!341587 (= (apply!276 (+!729 lt!161705 (tuple2!5239 lt!161702 zeroValue!1467)) lt!161693) (apply!276 lt!161705 lt!161693))))

(declare-fun lt!161695 () Unit!10580)

(assert (=> b!341587 (= lt!161695 lt!161686)))

(declare-fun lt!161699 () ListLongMap!4141)

(assert (=> b!341587 (= lt!161699 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161703 () (_ BitVec 64))

(assert (=> b!341587 (= lt!161703 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161687 () (_ BitVec 64))

(assert (=> b!341587 (= lt!161687 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!341587 (= lt!161685 (addApplyDifferent!252 lt!161699 lt!161703 minValue!1467 lt!161687))))

(assert (=> b!341587 (= (apply!276 (+!729 lt!161699 (tuple2!5239 lt!161703 minValue!1467)) lt!161687) (apply!276 lt!161699 lt!161687))))

(declare-fun b!341588 () Bool)

(assert (=> b!341588 (= e!209466 e!209468)))

(declare-fun res!188851 () Bool)

(assert (=> b!341588 (= res!188851 call!26562)))

(assert (=> b!341588 (=> (not res!188851) (not e!209468))))

(declare-fun b!341589 () Bool)

(assert (=> b!341589 (= e!209459 call!26563)))

(declare-fun bm!26563 () Bool)

(assert (=> bm!26563 (= call!26561 call!26564)))

(declare-fun b!341590 () Bool)

(assert (=> b!341590 (= e!209465 e!209466)))

(declare-fun c!52667 () Bool)

(assert (=> b!341590 (= c!52667 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!341591 () Bool)

(assert (=> b!341591 (= e!209460 call!26565)))

(declare-fun bm!26564 () Bool)

(assert (=> bm!26564 (= call!26564 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!341592 () Bool)

(assert (=> b!341592 (= e!209470 (validKeyInArray!0 (select (arr!8522 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70769 c!52664) b!341572))

(assert (= (and d!70769 (not c!52664)) b!341584))

(assert (= (and b!341584 c!52662) b!341591))

(assert (= (and b!341584 (not c!52662)) b!341573))

(assert (= (and b!341573 c!52663) b!341583))

(assert (= (and b!341573 (not c!52663)) b!341589))

(assert (= (or b!341583 b!341589) bm!26560))

(assert (= (or b!341591 bm!26560) bm!26563))

(assert (= (or b!341591 b!341583) bm!26558))

(assert (= (or b!341572 bm!26563) bm!26564))

(assert (= (or b!341572 bm!26558) bm!26562))

(assert (= (and d!70769 res!188853) b!341580))

(assert (= (and d!70769 c!52665) b!341587))

(assert (= (and d!70769 (not c!52665)) b!341576))

(assert (= (and d!70769 res!188858) b!341581))

(assert (= (and b!341581 res!188854) b!341592))

(assert (= (and b!341581 (not res!188850)) b!341575))

(assert (= (and b!341575 res!188857) b!341586))

(assert (= (and b!341581 res!188856) b!341579))

(assert (= (and b!341579 c!52666) b!341577))

(assert (= (and b!341579 (not c!52666)) b!341578))

(assert (= (and b!341577 res!188855) b!341574))

(assert (= (or b!341577 b!341578) bm!26561))

(assert (= (and b!341579 res!188852) b!341590))

(assert (= (and b!341590 c!52667) b!341588))

(assert (= (and b!341590 (not c!52667)) b!341585))

(assert (= (and b!341588 res!188851) b!341582))

(assert (= (or b!341588 b!341585) bm!26559))

(declare-fun b_lambda!8425 () Bool)

(assert (=> (not b_lambda!8425) (not b!341586)))

(declare-fun t!9967 () Bool)

(declare-fun tb!3059 () Bool)

(assert (=> (and start!34224 (= defaultEntry!1528 defaultEntry!1528) t!9967) tb!3059))

(declare-fun result!5523 () Bool)

(assert (=> tb!3059 (= result!5523 tp_is_empty!7213)))

(assert (=> b!341586 t!9967))

(declare-fun b_and!14441 () Bool)

(assert (= b_and!14435 (and (=> t!9967 result!5523) b_and!14441)))

(declare-fun m!343421 () Bool)

(assert (=> b!341586 m!343421))

(assert (=> b!341586 m!343381))

(declare-fun m!343423 () Bool)

(assert (=> b!341586 m!343423))

(assert (=> b!341586 m!343423))

(assert (=> b!341586 m!343421))

(declare-fun m!343425 () Bool)

(assert (=> b!341586 m!343425))

(assert (=> b!341586 m!343381))

(declare-fun m!343427 () Bool)

(assert (=> b!341586 m!343427))

(declare-fun m!343429 () Bool)

(assert (=> bm!26564 m!343429))

(declare-fun m!343431 () Bool)

(assert (=> bm!26562 m!343431))

(declare-fun m!343433 () Bool)

(assert (=> bm!26561 m!343433))

(assert (=> b!341575 m!343381))

(assert (=> b!341575 m!343381))

(declare-fun m!343435 () Bool)

(assert (=> b!341575 m!343435))

(declare-fun m!343437 () Bool)

(assert (=> b!341574 m!343437))

(assert (=> d!70769 m!343309))

(declare-fun m!343439 () Bool)

(assert (=> bm!26559 m!343439))

(declare-fun m!343441 () Bool)

(assert (=> b!341587 m!343441))

(assert (=> b!341587 m!343381))

(declare-fun m!343443 () Bool)

(assert (=> b!341587 m!343443))

(declare-fun m!343445 () Bool)

(assert (=> b!341587 m!343445))

(assert (=> b!341587 m!343429))

(declare-fun m!343447 () Bool)

(assert (=> b!341587 m!343447))

(declare-fun m!343449 () Bool)

(assert (=> b!341587 m!343449))

(declare-fun m!343451 () Bool)

(assert (=> b!341587 m!343451))

(declare-fun m!343453 () Bool)

(assert (=> b!341587 m!343453))

(declare-fun m!343455 () Bool)

(assert (=> b!341587 m!343455))

(declare-fun m!343457 () Bool)

(assert (=> b!341587 m!343457))

(declare-fun m!343459 () Bool)

(assert (=> b!341587 m!343459))

(assert (=> b!341587 m!343447))

(assert (=> b!341587 m!343453))

(declare-fun m!343461 () Bool)

(assert (=> b!341587 m!343461))

(declare-fun m!343463 () Bool)

(assert (=> b!341587 m!343463))

(declare-fun m!343465 () Bool)

(assert (=> b!341587 m!343465))

(declare-fun m!343467 () Bool)

(assert (=> b!341587 m!343467))

(assert (=> b!341587 m!343465))

(assert (=> b!341587 m!343443))

(declare-fun m!343469 () Bool)

(assert (=> b!341587 m!343469))

(assert (=> b!341580 m!343381))

(assert (=> b!341580 m!343381))

(assert (=> b!341580 m!343391))

(assert (=> b!341592 m!343381))

(assert (=> b!341592 m!343381))

(assert (=> b!341592 m!343391))

(declare-fun m!343471 () Bool)

(assert (=> b!341582 m!343471))

(declare-fun m!343473 () Bool)

(assert (=> b!341572 m!343473))

(assert (=> b!341390 d!70769))

(declare-fun d!70771 () Bool)

(declare-fun res!188863 () Bool)

(declare-fun e!209475 () Bool)

(assert (=> d!70771 (=> res!188863 e!209475)))

(assert (=> d!70771 (= res!188863 (= (select (arr!8522 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70771 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!209475)))

(declare-fun b!341599 () Bool)

(declare-fun e!209476 () Bool)

(assert (=> b!341599 (= e!209475 e!209476)))

(declare-fun res!188864 () Bool)

(assert (=> b!341599 (=> (not res!188864) (not e!209476))))

(assert (=> b!341599 (= res!188864 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8875 _keys!1895)))))

(declare-fun b!341600 () Bool)

(assert (=> b!341600 (= e!209476 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70771 (not res!188863)) b!341599))

(assert (= (and b!341599 res!188864) b!341600))

(assert (=> d!70771 m!343381))

(declare-fun m!343475 () Bool)

(assert (=> b!341600 m!343475))

(assert (=> b!341388 d!70771))

(declare-fun condMapEmpty!12255 () Bool)

(declare-fun mapDefault!12255 () ValueCell!3263)

(assert (=> mapNonEmpty!12246 (= condMapEmpty!12255 (= mapRest!12246 ((as const (Array (_ BitVec 32) ValueCell!3263)) mapDefault!12255)))))

(declare-fun e!209481 () Bool)

(declare-fun mapRes!12255 () Bool)

(assert (=> mapNonEmpty!12246 (= tp!25317 (and e!209481 mapRes!12255))))

(declare-fun b!341607 () Bool)

(declare-fun e!209482 () Bool)

(assert (=> b!341607 (= e!209482 tp_is_empty!7213)))

(declare-fun mapIsEmpty!12255 () Bool)

(assert (=> mapIsEmpty!12255 mapRes!12255))

(declare-fun mapNonEmpty!12255 () Bool)

(declare-fun tp!25332 () Bool)

(assert (=> mapNonEmpty!12255 (= mapRes!12255 (and tp!25332 e!209482))))

(declare-fun mapValue!12255 () ValueCell!3263)

(declare-fun mapKey!12255 () (_ BitVec 32))

(declare-fun mapRest!12255 () (Array (_ BitVec 32) ValueCell!3263))

(assert (=> mapNonEmpty!12255 (= mapRest!12246 (store mapRest!12255 mapKey!12255 mapValue!12255))))

(declare-fun b!341608 () Bool)

(assert (=> b!341608 (= e!209481 tp_is_empty!7213)))

(assert (= (and mapNonEmpty!12246 condMapEmpty!12255) mapIsEmpty!12255))

(assert (= (and mapNonEmpty!12246 (not condMapEmpty!12255)) mapNonEmpty!12255))

(assert (= (and mapNonEmpty!12255 ((_ is ValueCellFull!3263) mapValue!12255)) b!341607))

(assert (= (and mapNonEmpty!12246 ((_ is ValueCellFull!3263) mapDefault!12255)) b!341608))

(declare-fun m!343477 () Bool)

(assert (=> mapNonEmpty!12255 m!343477))

(declare-fun b_lambda!8427 () Bool)

(assert (= b_lambda!8425 (or (and start!34224 b_free!7261) b_lambda!8427)))

(check-sat (not bm!26540) (not b_lambda!8427) (not b!341475) (not b!341586) (not d!70767) (not b!341485) (not d!70769) tp_is_empty!7213 (not b!341498) (not b!341600) (not b!341484) (not b_next!7261) (not bm!26562) (not d!70749) (not b!341501) (not b!341587) (not bm!26561) (not b!341572) (not bm!26543) (not mapNonEmpty!12255) (not b!341592) (not bm!26559) (not b!341575) (not d!70759) (not b!341529) (not b!341499) (not bm!26564) (not b!341515) (not b!341574) (not b!341580) (not b!341527) b_and!14441 (not b!341582))
(check-sat b_and!14441 (not b_next!7261))
