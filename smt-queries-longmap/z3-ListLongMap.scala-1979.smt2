; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34722 () Bool)

(assert start!34722)

(declare-fun b_free!7543 () Bool)

(declare-fun b_next!7543 () Bool)

(assert (=> start!34722 (= b_free!7543 (not b_next!7543))))

(declare-fun tp!26192 () Bool)

(declare-fun b_and!14777 () Bool)

(assert (=> start!34722 (= tp!26192 b_and!14777)))

(declare-fun b!347322 () Bool)

(declare-fun e!212811 () Bool)

(declare-fun e!212815 () Bool)

(assert (=> b!347322 (= e!212811 e!212815)))

(declare-fun res!192284 () Bool)

(assert (=> b!347322 (=> (not res!192284) (not e!212815))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18572 0))(
  ( (array!18573 (arr!8796 (Array (_ BitVec 32) (_ BitVec 64))) (size!9148 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18572)

(declare-datatypes ((SeekEntryResult!3348 0))(
  ( (MissingZero!3348 (index!15571 (_ BitVec 32))) (Found!3348 (index!15572 (_ BitVec 32))) (Intermediate!3348 (undefined!4160 Bool) (index!15573 (_ BitVec 32)) (x!34559 (_ BitVec 32))) (Undefined!3348) (MissingVacant!3348 (index!15574 (_ BitVec 32))) )
))
(declare-fun lt!163558 () SeekEntryResult!3348)

(get-info :version)

(assert (=> b!347322 (= res!192284 (and ((_ is Found!3348) lt!163558) (= (select (arr!8796 _keys!1895) (index!15572 lt!163558)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18572 (_ BitVec 32)) SeekEntryResult!3348)

(assert (=> b!347322 (= lt!163558 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!192286 () Bool)

(assert (=> start!34722 (=> (not res!192286) (not e!212811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34722 (= res!192286 (validMask!0 mask!2385))))

(assert (=> start!34722 e!212811))

(assert (=> start!34722 true))

(declare-fun tp_is_empty!7495 () Bool)

(assert (=> start!34722 tp_is_empty!7495))

(assert (=> start!34722 tp!26192))

(declare-datatypes ((V!10971 0))(
  ( (V!10972 (val!3792 Int)) )
))
(declare-datatypes ((ValueCell!3404 0))(
  ( (ValueCellFull!3404 (v!5975 V!10971)) (EmptyCell!3404) )
))
(declare-datatypes ((array!18574 0))(
  ( (array!18575 (arr!8797 (Array (_ BitVec 32) ValueCell!3404)) (size!9149 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18574)

(declare-fun e!212813 () Bool)

(declare-fun array_inv!6500 (array!18574) Bool)

(assert (=> start!34722 (and (array_inv!6500 _values!1525) e!212813)))

(declare-fun array_inv!6501 (array!18572) Bool)

(assert (=> start!34722 (array_inv!6501 _keys!1895)))

(declare-fun b!347323 () Bool)

(assert (=> b!347323 (= e!212815 (not (and (bvsge (index!15572 lt!163558) #b00000000000000000000000000000000) (bvslt (index!15572 lt!163558) (size!9148 _keys!1895)))))))

(declare-fun arrayContainsKey!0 (array!18572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347323 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10753 0))(
  ( (Unit!10754) )
))
(declare-fun lt!163557 () Unit!10753)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18572 (_ BitVec 64) (_ BitVec 32)) Unit!10753)

(assert (=> b!347323 (= lt!163557 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15572 lt!163558)))))

(declare-fun b!347324 () Bool)

(declare-fun e!212814 () Bool)

(declare-fun mapRes!12699 () Bool)

(assert (=> b!347324 (= e!212813 (and e!212814 mapRes!12699))))

(declare-fun condMapEmpty!12699 () Bool)

(declare-fun mapDefault!12699 () ValueCell!3404)

(assert (=> b!347324 (= condMapEmpty!12699 (= (arr!8797 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3404)) mapDefault!12699)))))

(declare-fun b!347325 () Bool)

(declare-fun res!192287 () Bool)

(assert (=> b!347325 (=> (not res!192287) (not e!212815))))

(assert (=> b!347325 (= res!192287 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15572 lt!163558)))))

(declare-fun b!347326 () Bool)

(declare-fun res!192282 () Bool)

(assert (=> b!347326 (=> (not res!192282) (not e!212811))))

(declare-fun zeroValue!1467 () V!10971)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10971)

(declare-datatypes ((tuple2!5400 0))(
  ( (tuple2!5401 (_1!2711 (_ BitVec 64)) (_2!2711 V!10971)) )
))
(declare-datatypes ((List!5006 0))(
  ( (Nil!5003) (Cons!5002 (h!5858 tuple2!5400) (t!10126 List!5006)) )
))
(declare-datatypes ((ListLongMap!4315 0))(
  ( (ListLongMap!4316 (toList!2173 List!5006)) )
))
(declare-fun contains!2256 (ListLongMap!4315 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1702 (array!18572 array!18574 (_ BitVec 32) (_ BitVec 32) V!10971 V!10971 (_ BitVec 32) Int) ListLongMap!4315)

(assert (=> b!347326 (= res!192282 (not (contains!2256 (getCurrentListMap!1702 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!347327 () Bool)

(declare-fun res!192283 () Bool)

(assert (=> b!347327 (=> (not res!192283) (not e!212811))))

(declare-datatypes ((List!5007 0))(
  ( (Nil!5004) (Cons!5003 (h!5859 (_ BitVec 64)) (t!10127 List!5007)) )
))
(declare-fun arrayNoDuplicates!0 (array!18572 (_ BitVec 32) List!5007) Bool)

(assert (=> b!347327 (= res!192283 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5004))))

(declare-fun mapNonEmpty!12699 () Bool)

(declare-fun tp!26193 () Bool)

(declare-fun e!212812 () Bool)

(assert (=> mapNonEmpty!12699 (= mapRes!12699 (and tp!26193 e!212812))))

(declare-fun mapValue!12699 () ValueCell!3404)

(declare-fun mapKey!12699 () (_ BitVec 32))

(declare-fun mapRest!12699 () (Array (_ BitVec 32) ValueCell!3404))

(assert (=> mapNonEmpty!12699 (= (arr!8797 _values!1525) (store mapRest!12699 mapKey!12699 mapValue!12699))))

(declare-fun b!347328 () Bool)

(assert (=> b!347328 (= e!212812 tp_is_empty!7495)))

(declare-fun b!347329 () Bool)

(declare-fun res!192285 () Bool)

(assert (=> b!347329 (=> (not res!192285) (not e!212811))))

(assert (=> b!347329 (= res!192285 (and (= (size!9149 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9148 _keys!1895) (size!9149 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347330 () Bool)

(assert (=> b!347330 (= e!212814 tp_is_empty!7495)))

(declare-fun b!347331 () Bool)

(declare-fun res!192281 () Bool)

(assert (=> b!347331 (=> (not res!192281) (not e!212811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18572 (_ BitVec 32)) Bool)

(assert (=> b!347331 (= res!192281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347332 () Bool)

(declare-fun res!192280 () Bool)

(assert (=> b!347332 (=> (not res!192280) (not e!212811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347332 (= res!192280 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12699 () Bool)

(assert (=> mapIsEmpty!12699 mapRes!12699))

(assert (= (and start!34722 res!192286) b!347329))

(assert (= (and b!347329 res!192285) b!347331))

(assert (= (and b!347331 res!192281) b!347327))

(assert (= (and b!347327 res!192283) b!347332))

(assert (= (and b!347332 res!192280) b!347326))

(assert (= (and b!347326 res!192282) b!347322))

(assert (= (and b!347322 res!192284) b!347325))

(assert (= (and b!347325 res!192287) b!347323))

(assert (= (and b!347324 condMapEmpty!12699) mapIsEmpty!12699))

(assert (= (and b!347324 (not condMapEmpty!12699)) mapNonEmpty!12699))

(assert (= (and mapNonEmpty!12699 ((_ is ValueCellFull!3404) mapValue!12699)) b!347328))

(assert (= (and b!347324 ((_ is ValueCellFull!3404) mapDefault!12699)) b!347330))

(assert (= start!34722 b!347324))

(declare-fun m!348539 () Bool)

(assert (=> b!347331 m!348539))

(declare-fun m!348541 () Bool)

(assert (=> b!347322 m!348541))

(declare-fun m!348543 () Bool)

(assert (=> b!347322 m!348543))

(declare-fun m!348545 () Bool)

(assert (=> start!34722 m!348545))

(declare-fun m!348547 () Bool)

(assert (=> start!34722 m!348547))

(declare-fun m!348549 () Bool)

(assert (=> start!34722 m!348549))

(declare-fun m!348551 () Bool)

(assert (=> b!347323 m!348551))

(declare-fun m!348553 () Bool)

(assert (=> b!347323 m!348553))

(declare-fun m!348555 () Bool)

(assert (=> b!347326 m!348555))

(assert (=> b!347326 m!348555))

(declare-fun m!348557 () Bool)

(assert (=> b!347326 m!348557))

(declare-fun m!348559 () Bool)

(assert (=> mapNonEmpty!12699 m!348559))

(declare-fun m!348561 () Bool)

(assert (=> b!347332 m!348561))

(declare-fun m!348563 () Bool)

(assert (=> b!347325 m!348563))

(declare-fun m!348565 () Bool)

(assert (=> b!347327 m!348565))

(check-sat (not b!347322) (not mapNonEmpty!12699) (not b!347325) b_and!14777 (not b!347326) (not start!34722) (not b_next!7543) (not b!347331) (not b!347332) tp_is_empty!7495 (not b!347327) (not b!347323))
(check-sat b_and!14777 (not b_next!7543))
(get-model)

(declare-fun d!71293 () Bool)

(declare-fun res!192340 () Bool)

(declare-fun e!212857 () Bool)

(assert (=> d!71293 (=> res!192340 e!212857)))

(assert (=> d!71293 (= res!192340 (= (select (arr!8796 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71293 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!212857)))

(declare-fun b!347403 () Bool)

(declare-fun e!212858 () Bool)

(assert (=> b!347403 (= e!212857 e!212858)))

(declare-fun res!192341 () Bool)

(assert (=> b!347403 (=> (not res!192341) (not e!212858))))

(assert (=> b!347403 (= res!192341 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9148 _keys!1895)))))

(declare-fun b!347404 () Bool)

(assert (=> b!347404 (= e!212858 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71293 (not res!192340)) b!347403))

(assert (= (and b!347403 res!192341) b!347404))

(declare-fun m!348623 () Bool)

(assert (=> d!71293 m!348623))

(declare-fun m!348625 () Bool)

(assert (=> b!347404 m!348625))

(assert (=> b!347323 d!71293))

(declare-fun d!71295 () Bool)

(assert (=> d!71295 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163573 () Unit!10753)

(declare-fun choose!13 (array!18572 (_ BitVec 64) (_ BitVec 32)) Unit!10753)

(assert (=> d!71295 (= lt!163573 (choose!13 _keys!1895 k0!1348 (index!15572 lt!163558)))))

(assert (=> d!71295 (bvsge (index!15572 lt!163558) #b00000000000000000000000000000000)))

(assert (=> d!71295 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15572 lt!163558)) lt!163573)))

(declare-fun bs!11891 () Bool)

(assert (= bs!11891 d!71295))

(assert (=> bs!11891 m!348551))

(declare-fun m!348627 () Bool)

(assert (=> bs!11891 m!348627))

(assert (=> b!347323 d!71295))

(declare-fun d!71297 () Bool)

(assert (=> d!71297 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!347332 d!71297))

(declare-fun d!71299 () Bool)

(assert (=> d!71299 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34722 d!71299))

(declare-fun d!71301 () Bool)

(assert (=> d!71301 (= (array_inv!6500 _values!1525) (bvsge (size!9149 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34722 d!71301))

(declare-fun d!71303 () Bool)

(assert (=> d!71303 (= (array_inv!6501 _keys!1895) (bvsge (size!9148 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34722 d!71303))

(declare-fun b!347417 () Bool)

(declare-fun e!212865 () SeekEntryResult!3348)

(declare-fun e!212866 () SeekEntryResult!3348)

(assert (=> b!347417 (= e!212865 e!212866)))

(declare-fun lt!163582 () (_ BitVec 64))

(declare-fun lt!163581 () SeekEntryResult!3348)

(assert (=> b!347417 (= lt!163582 (select (arr!8796 _keys!1895) (index!15573 lt!163581)))))

(declare-fun c!53154 () Bool)

(assert (=> b!347417 (= c!53154 (= lt!163582 k0!1348))))

(declare-fun b!347418 () Bool)

(assert (=> b!347418 (= e!212865 Undefined!3348)))

(declare-fun d!71305 () Bool)

(declare-fun lt!163580 () SeekEntryResult!3348)

(assert (=> d!71305 (and (or ((_ is Undefined!3348) lt!163580) (not ((_ is Found!3348) lt!163580)) (and (bvsge (index!15572 lt!163580) #b00000000000000000000000000000000) (bvslt (index!15572 lt!163580) (size!9148 _keys!1895)))) (or ((_ is Undefined!3348) lt!163580) ((_ is Found!3348) lt!163580) (not ((_ is MissingZero!3348) lt!163580)) (and (bvsge (index!15571 lt!163580) #b00000000000000000000000000000000) (bvslt (index!15571 lt!163580) (size!9148 _keys!1895)))) (or ((_ is Undefined!3348) lt!163580) ((_ is Found!3348) lt!163580) ((_ is MissingZero!3348) lt!163580) (not ((_ is MissingVacant!3348) lt!163580)) (and (bvsge (index!15574 lt!163580) #b00000000000000000000000000000000) (bvslt (index!15574 lt!163580) (size!9148 _keys!1895)))) (or ((_ is Undefined!3348) lt!163580) (ite ((_ is Found!3348) lt!163580) (= (select (arr!8796 _keys!1895) (index!15572 lt!163580)) k0!1348) (ite ((_ is MissingZero!3348) lt!163580) (= (select (arr!8796 _keys!1895) (index!15571 lt!163580)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3348) lt!163580) (= (select (arr!8796 _keys!1895) (index!15574 lt!163580)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71305 (= lt!163580 e!212865)))

(declare-fun c!53156 () Bool)

(assert (=> d!71305 (= c!53156 (and ((_ is Intermediate!3348) lt!163581) (undefined!4160 lt!163581)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18572 (_ BitVec 32)) SeekEntryResult!3348)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71305 (= lt!163581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71305 (validMask!0 mask!2385)))

(assert (=> d!71305 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163580)))

(declare-fun b!347419 () Bool)

(declare-fun c!53155 () Bool)

(assert (=> b!347419 (= c!53155 (= lt!163582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!212867 () SeekEntryResult!3348)

(assert (=> b!347419 (= e!212866 e!212867)))

(declare-fun b!347420 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18572 (_ BitVec 32)) SeekEntryResult!3348)

(assert (=> b!347420 (= e!212867 (seekKeyOrZeroReturnVacant!0 (x!34559 lt!163581) (index!15573 lt!163581) (index!15573 lt!163581) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347421 () Bool)

(assert (=> b!347421 (= e!212867 (MissingZero!3348 (index!15573 lt!163581)))))

(declare-fun b!347422 () Bool)

(assert (=> b!347422 (= e!212866 (Found!3348 (index!15573 lt!163581)))))

(assert (= (and d!71305 c!53156) b!347418))

(assert (= (and d!71305 (not c!53156)) b!347417))

(assert (= (and b!347417 c!53154) b!347422))

(assert (= (and b!347417 (not c!53154)) b!347419))

(assert (= (and b!347419 c!53155) b!347421))

(assert (= (and b!347419 (not c!53155)) b!347420))

(declare-fun m!348629 () Bool)

(assert (=> b!347417 m!348629))

(declare-fun m!348631 () Bool)

(assert (=> d!71305 m!348631))

(declare-fun m!348633 () Bool)

(assert (=> d!71305 m!348633))

(declare-fun m!348635 () Bool)

(assert (=> d!71305 m!348635))

(assert (=> d!71305 m!348545))

(declare-fun m!348637 () Bool)

(assert (=> d!71305 m!348637))

(assert (=> d!71305 m!348633))

(declare-fun m!348639 () Bool)

(assert (=> d!71305 m!348639))

(declare-fun m!348641 () Bool)

(assert (=> b!347420 m!348641))

(assert (=> b!347322 d!71305))

(declare-fun bm!26822 () Bool)

(declare-fun call!26825 () Bool)

(declare-fun c!53159 () Bool)

(assert (=> bm!26822 (= call!26825 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53159 (Cons!5003 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000) Nil!5004) Nil!5004)))))

(declare-fun b!347433 () Bool)

(declare-fun e!212878 () Bool)

(assert (=> b!347433 (= e!212878 call!26825)))

(declare-fun b!347435 () Bool)

(assert (=> b!347435 (= e!212878 call!26825)))

(declare-fun b!347436 () Bool)

(declare-fun e!212877 () Bool)

(declare-fun contains!2259 (List!5007 (_ BitVec 64)) Bool)

(assert (=> b!347436 (= e!212877 (contains!2259 Nil!5004 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!347437 () Bool)

(declare-fun e!212879 () Bool)

(declare-fun e!212876 () Bool)

(assert (=> b!347437 (= e!212879 e!212876)))

(declare-fun res!192348 () Bool)

(assert (=> b!347437 (=> (not res!192348) (not e!212876))))

(assert (=> b!347437 (= res!192348 (not e!212877))))

(declare-fun res!192350 () Bool)

(assert (=> b!347437 (=> (not res!192350) (not e!212877))))

(assert (=> b!347437 (= res!192350 (validKeyInArray!0 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!347434 () Bool)

(assert (=> b!347434 (= e!212876 e!212878)))

(assert (=> b!347434 (= c!53159 (validKeyInArray!0 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71307 () Bool)

(declare-fun res!192349 () Bool)

(assert (=> d!71307 (=> res!192349 e!212879)))

(assert (=> d!71307 (= res!192349 (bvsge #b00000000000000000000000000000000 (size!9148 _keys!1895)))))

(assert (=> d!71307 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5004) e!212879)))

(assert (= (and d!71307 (not res!192349)) b!347437))

(assert (= (and b!347437 res!192350) b!347436))

(assert (= (and b!347437 res!192348) b!347434))

(assert (= (and b!347434 c!53159) b!347435))

(assert (= (and b!347434 (not c!53159)) b!347433))

(assert (= (or b!347435 b!347433) bm!26822))

(assert (=> bm!26822 m!348623))

(declare-fun m!348643 () Bool)

(assert (=> bm!26822 m!348643))

(assert (=> b!347436 m!348623))

(assert (=> b!347436 m!348623))

(declare-fun m!348645 () Bool)

(assert (=> b!347436 m!348645))

(assert (=> b!347437 m!348623))

(assert (=> b!347437 m!348623))

(declare-fun m!348647 () Bool)

(assert (=> b!347437 m!348647))

(assert (=> b!347434 m!348623))

(assert (=> b!347434 m!348623))

(assert (=> b!347434 m!348647))

(assert (=> b!347327 d!71307))

(declare-fun b!347446 () Bool)

(declare-fun e!212888 () Bool)

(declare-fun e!212887 () Bool)

(assert (=> b!347446 (= e!212888 e!212887)))

(declare-fun lt!163589 () (_ BitVec 64))

(assert (=> b!347446 (= lt!163589 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163590 () Unit!10753)

(assert (=> b!347446 (= lt!163590 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163589 #b00000000000000000000000000000000))))

(assert (=> b!347446 (arrayContainsKey!0 _keys!1895 lt!163589 #b00000000000000000000000000000000)))

(declare-fun lt!163591 () Unit!10753)

(assert (=> b!347446 (= lt!163591 lt!163590)))

(declare-fun res!192356 () Bool)

(assert (=> b!347446 (= res!192356 (= (seekEntryOrOpen!0 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3348 #b00000000000000000000000000000000)))))

(assert (=> b!347446 (=> (not res!192356) (not e!212887))))

(declare-fun d!71309 () Bool)

(declare-fun res!192355 () Bool)

(declare-fun e!212886 () Bool)

(assert (=> d!71309 (=> res!192355 e!212886)))

(assert (=> d!71309 (= res!192355 (bvsge #b00000000000000000000000000000000 (size!9148 _keys!1895)))))

(assert (=> d!71309 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!212886)))

(declare-fun b!347447 () Bool)

(declare-fun call!26828 () Bool)

(assert (=> b!347447 (= e!212888 call!26828)))

(declare-fun bm!26825 () Bool)

(assert (=> bm!26825 (= call!26828 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!347448 () Bool)

(assert (=> b!347448 (= e!212887 call!26828)))

(declare-fun b!347449 () Bool)

(assert (=> b!347449 (= e!212886 e!212888)))

(declare-fun c!53162 () Bool)

(assert (=> b!347449 (= c!53162 (validKeyInArray!0 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71309 (not res!192355)) b!347449))

(assert (= (and b!347449 c!53162) b!347446))

(assert (= (and b!347449 (not c!53162)) b!347447))

(assert (= (and b!347446 res!192356) b!347448))

(assert (= (or b!347448 b!347447) bm!26825))

(assert (=> b!347446 m!348623))

(declare-fun m!348649 () Bool)

(assert (=> b!347446 m!348649))

(declare-fun m!348651 () Bool)

(assert (=> b!347446 m!348651))

(assert (=> b!347446 m!348623))

(declare-fun m!348653 () Bool)

(assert (=> b!347446 m!348653))

(declare-fun m!348655 () Bool)

(assert (=> bm!26825 m!348655))

(assert (=> b!347449 m!348623))

(assert (=> b!347449 m!348623))

(assert (=> b!347449 m!348647))

(assert (=> b!347331 d!71309))

(declare-fun d!71311 () Bool)

(declare-fun e!212894 () Bool)

(assert (=> d!71311 e!212894))

(declare-fun res!192359 () Bool)

(assert (=> d!71311 (=> res!192359 e!212894)))

(declare-fun lt!163600 () Bool)

(assert (=> d!71311 (= res!192359 (not lt!163600))))

(declare-fun lt!163603 () Bool)

(assert (=> d!71311 (= lt!163600 lt!163603)))

(declare-fun lt!163601 () Unit!10753)

(declare-fun e!212893 () Unit!10753)

(assert (=> d!71311 (= lt!163601 e!212893)))

(declare-fun c!53165 () Bool)

(assert (=> d!71311 (= c!53165 lt!163603)))

(declare-fun containsKey!336 (List!5006 (_ BitVec 64)) Bool)

(assert (=> d!71311 (= lt!163603 (containsKey!336 (toList!2173 (getCurrentListMap!1702 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71311 (= (contains!2256 (getCurrentListMap!1702 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163600)))

(declare-fun b!347456 () Bool)

(declare-fun lt!163602 () Unit!10753)

(assert (=> b!347456 (= e!212893 lt!163602)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!284 (List!5006 (_ BitVec 64)) Unit!10753)

(assert (=> b!347456 (= lt!163602 (lemmaContainsKeyImpliesGetValueByKeyDefined!284 (toList!2173 (getCurrentListMap!1702 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!351 0))(
  ( (Some!350 (v!5978 V!10971)) (None!349) )
))
(declare-fun isDefined!285 (Option!351) Bool)

(declare-fun getValueByKey!345 (List!5006 (_ BitVec 64)) Option!351)

(assert (=> b!347456 (isDefined!285 (getValueByKey!345 (toList!2173 (getCurrentListMap!1702 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!347457 () Bool)

(declare-fun Unit!10757 () Unit!10753)

(assert (=> b!347457 (= e!212893 Unit!10757)))

(declare-fun b!347458 () Bool)

(assert (=> b!347458 (= e!212894 (isDefined!285 (getValueByKey!345 (toList!2173 (getCurrentListMap!1702 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71311 c!53165) b!347456))

(assert (= (and d!71311 (not c!53165)) b!347457))

(assert (= (and d!71311 (not res!192359)) b!347458))

(declare-fun m!348657 () Bool)

(assert (=> d!71311 m!348657))

(declare-fun m!348659 () Bool)

(assert (=> b!347456 m!348659))

(declare-fun m!348661 () Bool)

(assert (=> b!347456 m!348661))

(assert (=> b!347456 m!348661))

(declare-fun m!348663 () Bool)

(assert (=> b!347456 m!348663))

(assert (=> b!347458 m!348661))

(assert (=> b!347458 m!348661))

(assert (=> b!347458 m!348663))

(assert (=> b!347326 d!71311))

(declare-fun b!347501 () Bool)

(declare-fun e!212932 () Unit!10753)

(declare-fun Unit!10758 () Unit!10753)

(assert (=> b!347501 (= e!212932 Unit!10758)))

(declare-fun d!71313 () Bool)

(declare-fun e!212923 () Bool)

(assert (=> d!71313 e!212923))

(declare-fun res!192379 () Bool)

(assert (=> d!71313 (=> (not res!192379) (not e!212923))))

(assert (=> d!71313 (= res!192379 (or (bvsge #b00000000000000000000000000000000 (size!9148 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9148 _keys!1895)))))))

(declare-fun lt!163667 () ListLongMap!4315)

(declare-fun lt!163655 () ListLongMap!4315)

(assert (=> d!71313 (= lt!163667 lt!163655)))

(declare-fun lt!163663 () Unit!10753)

(assert (=> d!71313 (= lt!163663 e!212932)))

(declare-fun c!53178 () Bool)

(declare-fun e!212927 () Bool)

(assert (=> d!71313 (= c!53178 e!212927)))

(declare-fun res!192384 () Bool)

(assert (=> d!71313 (=> (not res!192384) (not e!212927))))

(assert (=> d!71313 (= res!192384 (bvslt #b00000000000000000000000000000000 (size!9148 _keys!1895)))))

(declare-fun e!212924 () ListLongMap!4315)

(assert (=> d!71313 (= lt!163655 e!212924)))

(declare-fun c!53183 () Bool)

(assert (=> d!71313 (= c!53183 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71313 (validMask!0 mask!2385)))

(assert (=> d!71313 (= (getCurrentListMap!1702 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163667)))

(declare-fun b!347502 () Bool)

(declare-fun e!212929 () Bool)

(declare-fun e!212921 () Bool)

(assert (=> b!347502 (= e!212929 e!212921)))

(declare-fun res!192385 () Bool)

(declare-fun call!26845 () Bool)

(assert (=> b!347502 (= res!192385 call!26845)))

(assert (=> b!347502 (=> (not res!192385) (not e!212921))))

(declare-fun b!347503 () Bool)

(assert (=> b!347503 (= e!212929 (not call!26845))))

(declare-fun bm!26840 () Bool)

(declare-fun call!26843 () ListLongMap!4315)

(declare-fun call!26847 () ListLongMap!4315)

(assert (=> bm!26840 (= call!26843 call!26847)))

(declare-fun b!347504 () Bool)

(declare-fun apply!286 (ListLongMap!4315 (_ BitVec 64)) V!10971)

(assert (=> b!347504 (= e!212921 (= (apply!286 lt!163667 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!347505 () Bool)

(declare-fun e!212922 () ListLongMap!4315)

(declare-fun call!26848 () ListLongMap!4315)

(assert (=> b!347505 (= e!212922 call!26848)))

(declare-fun b!347506 () Bool)

(assert (=> b!347506 (= e!212927 (validKeyInArray!0 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!347507 () Bool)

(declare-fun lt!163669 () Unit!10753)

(assert (=> b!347507 (= e!212932 lt!163669)))

(declare-fun lt!163665 () ListLongMap!4315)

(declare-fun getCurrentListMapNoExtraKeys!602 (array!18572 array!18574 (_ BitVec 32) (_ BitVec 32) V!10971 V!10971 (_ BitVec 32) Int) ListLongMap!4315)

(assert (=> b!347507 (= lt!163665 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163653 () (_ BitVec 64))

(assert (=> b!347507 (= lt!163653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163666 () (_ BitVec 64))

(assert (=> b!347507 (= lt!163666 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163658 () Unit!10753)

(declare-fun addStillContains!262 (ListLongMap!4315 (_ BitVec 64) V!10971 (_ BitVec 64)) Unit!10753)

(assert (=> b!347507 (= lt!163658 (addStillContains!262 lt!163665 lt!163653 zeroValue!1467 lt!163666))))

(declare-fun +!737 (ListLongMap!4315 tuple2!5400) ListLongMap!4315)

(assert (=> b!347507 (contains!2256 (+!737 lt!163665 (tuple2!5401 lt!163653 zeroValue!1467)) lt!163666)))

(declare-fun lt!163659 () Unit!10753)

(assert (=> b!347507 (= lt!163659 lt!163658)))

(declare-fun lt!163650 () ListLongMap!4315)

(assert (=> b!347507 (= lt!163650 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163660 () (_ BitVec 64))

(assert (=> b!347507 (= lt!163660 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163648 () (_ BitVec 64))

(assert (=> b!347507 (= lt!163648 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163654 () Unit!10753)

(declare-fun addApplyDifferent!262 (ListLongMap!4315 (_ BitVec 64) V!10971 (_ BitVec 64)) Unit!10753)

(assert (=> b!347507 (= lt!163654 (addApplyDifferent!262 lt!163650 lt!163660 minValue!1467 lt!163648))))

(assert (=> b!347507 (= (apply!286 (+!737 lt!163650 (tuple2!5401 lt!163660 minValue!1467)) lt!163648) (apply!286 lt!163650 lt!163648))))

(declare-fun lt!163662 () Unit!10753)

(assert (=> b!347507 (= lt!163662 lt!163654)))

(declare-fun lt!163664 () ListLongMap!4315)

(assert (=> b!347507 (= lt!163664 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163657 () (_ BitVec 64))

(assert (=> b!347507 (= lt!163657 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163649 () (_ BitVec 64))

(assert (=> b!347507 (= lt!163649 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163651 () Unit!10753)

(assert (=> b!347507 (= lt!163651 (addApplyDifferent!262 lt!163664 lt!163657 zeroValue!1467 lt!163649))))

(assert (=> b!347507 (= (apply!286 (+!737 lt!163664 (tuple2!5401 lt!163657 zeroValue!1467)) lt!163649) (apply!286 lt!163664 lt!163649))))

(declare-fun lt!163668 () Unit!10753)

(assert (=> b!347507 (= lt!163668 lt!163651)))

(declare-fun lt!163661 () ListLongMap!4315)

(assert (=> b!347507 (= lt!163661 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163656 () (_ BitVec 64))

(assert (=> b!347507 (= lt!163656 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163652 () (_ BitVec 64))

(assert (=> b!347507 (= lt!163652 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!347507 (= lt!163669 (addApplyDifferent!262 lt!163661 lt!163656 minValue!1467 lt!163652))))

(assert (=> b!347507 (= (apply!286 (+!737 lt!163661 (tuple2!5401 lt!163656 minValue!1467)) lt!163652) (apply!286 lt!163661 lt!163652))))

(declare-fun bm!26841 () Bool)

(assert (=> bm!26841 (= call!26848 call!26843)))

(declare-fun b!347508 () Bool)

(declare-fun call!26846 () ListLongMap!4315)

(assert (=> b!347508 (= e!212924 (+!737 call!26846 (tuple2!5401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26842 () Bool)

(declare-fun c!53181 () Bool)

(assert (=> bm!26842 (= call!26846 (+!737 (ite c!53183 call!26847 (ite c!53181 call!26843 call!26848)) (ite (or c!53183 c!53181) (tuple2!5401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!347509 () Bool)

(declare-fun res!192386 () Bool)

(assert (=> b!347509 (=> (not res!192386) (not e!212923))))

(declare-fun e!212928 () Bool)

(assert (=> b!347509 (= res!192386 e!212928)))

(declare-fun res!192378 () Bool)

(assert (=> b!347509 (=> res!192378 e!212928)))

(declare-fun e!212931 () Bool)

(assert (=> b!347509 (= res!192378 (not e!212931))))

(declare-fun res!192383 () Bool)

(assert (=> b!347509 (=> (not res!192383) (not e!212931))))

(assert (=> b!347509 (= res!192383 (bvslt #b00000000000000000000000000000000 (size!9148 _keys!1895)))))

(declare-fun b!347510 () Bool)

(assert (=> b!347510 (= e!212923 e!212929)))

(declare-fun c!53182 () Bool)

(assert (=> b!347510 (= c!53182 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!347511 () Bool)

(declare-fun e!212926 () ListLongMap!4315)

(assert (=> b!347511 (= e!212924 e!212926)))

(assert (=> b!347511 (= c!53181 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!347512 () Bool)

(assert (=> b!347512 (= e!212931 (validKeyInArray!0 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!347513 () Bool)

(declare-fun e!212930 () Bool)

(assert (=> b!347513 (= e!212928 e!212930)))

(declare-fun res!192381 () Bool)

(assert (=> b!347513 (=> (not res!192381) (not e!212930))))

(assert (=> b!347513 (= res!192381 (contains!2256 lt!163667 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!347513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9148 _keys!1895)))))

(declare-fun b!347514 () Bool)

(declare-fun e!212925 () Bool)

(declare-fun call!26849 () Bool)

(assert (=> b!347514 (= e!212925 (not call!26849))))

(declare-fun bm!26843 () Bool)

(assert (=> bm!26843 (= call!26847 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347515 () Bool)

(declare-fun e!212933 () Bool)

(assert (=> b!347515 (= e!212933 (= (apply!286 lt!163667 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!347516 () Bool)

(declare-fun c!53179 () Bool)

(assert (=> b!347516 (= c!53179 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!347516 (= e!212926 e!212922)))

(declare-fun b!347517 () Bool)

(declare-fun call!26844 () ListLongMap!4315)

(assert (=> b!347517 (= e!212922 call!26844)))

(declare-fun bm!26844 () Bool)

(assert (=> bm!26844 (= call!26844 call!26846)))

(declare-fun bm!26845 () Bool)

(assert (=> bm!26845 (= call!26845 (contains!2256 lt!163667 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26846 () Bool)

(assert (=> bm!26846 (= call!26849 (contains!2256 lt!163667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!347518 () Bool)

(assert (=> b!347518 (= e!212925 e!212933)))

(declare-fun res!192382 () Bool)

(assert (=> b!347518 (= res!192382 call!26849)))

(assert (=> b!347518 (=> (not res!192382) (not e!212933))))

(declare-fun b!347519 () Bool)

(declare-fun get!4736 (ValueCell!3404 V!10971) V!10971)

(declare-fun dynLambda!629 (Int (_ BitVec 64)) V!10971)

(assert (=> b!347519 (= e!212930 (= (apply!286 lt!163667 (select (arr!8796 _keys!1895) #b00000000000000000000000000000000)) (get!4736 (select (arr!8797 _values!1525) #b00000000000000000000000000000000) (dynLambda!629 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!347519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9149 _values!1525)))))

(assert (=> b!347519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9148 _keys!1895)))))

(declare-fun b!347520 () Bool)

(assert (=> b!347520 (= e!212926 call!26844)))

(declare-fun b!347521 () Bool)

(declare-fun res!192380 () Bool)

(assert (=> b!347521 (=> (not res!192380) (not e!212923))))

(assert (=> b!347521 (= res!192380 e!212925)))

(declare-fun c!53180 () Bool)

(assert (=> b!347521 (= c!53180 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!71313 c!53183) b!347508))

(assert (= (and d!71313 (not c!53183)) b!347511))

(assert (= (and b!347511 c!53181) b!347520))

(assert (= (and b!347511 (not c!53181)) b!347516))

(assert (= (and b!347516 c!53179) b!347517))

(assert (= (and b!347516 (not c!53179)) b!347505))

(assert (= (or b!347517 b!347505) bm!26841))

(assert (= (or b!347520 bm!26841) bm!26840))

(assert (= (or b!347520 b!347517) bm!26844))

(assert (= (or b!347508 bm!26840) bm!26843))

(assert (= (or b!347508 bm!26844) bm!26842))

(assert (= (and d!71313 res!192384) b!347506))

(assert (= (and d!71313 c!53178) b!347507))

(assert (= (and d!71313 (not c!53178)) b!347501))

(assert (= (and d!71313 res!192379) b!347509))

(assert (= (and b!347509 res!192383) b!347512))

(assert (= (and b!347509 (not res!192378)) b!347513))

(assert (= (and b!347513 res!192381) b!347519))

(assert (= (and b!347509 res!192386) b!347521))

(assert (= (and b!347521 c!53180) b!347518))

(assert (= (and b!347521 (not c!53180)) b!347514))

(assert (= (and b!347518 res!192382) b!347515))

(assert (= (or b!347518 b!347514) bm!26846))

(assert (= (and b!347521 res!192380) b!347510))

(assert (= (and b!347510 c!53182) b!347502))

(assert (= (and b!347510 (not c!53182)) b!347503))

(assert (= (and b!347502 res!192385) b!347504))

(assert (= (or b!347502 b!347503) bm!26845))

(declare-fun b_lambda!8505 () Bool)

(assert (=> (not b_lambda!8505) (not b!347519)))

(declare-fun t!10133 () Bool)

(declare-fun tb!3079 () Bool)

(assert (=> (and start!34722 (= defaultEntry!1528 defaultEntry!1528) t!10133) tb!3079))

(declare-fun result!5583 () Bool)

(assert (=> tb!3079 (= result!5583 tp_is_empty!7495)))

(assert (=> b!347519 t!10133))

(declare-fun b_and!14783 () Bool)

(assert (= b_and!14777 (and (=> t!10133 result!5583) b_and!14783)))

(assert (=> b!347506 m!348623))

(assert (=> b!347506 m!348623))

(assert (=> b!347506 m!348647))

(declare-fun m!348665 () Bool)

(assert (=> bm!26842 m!348665))

(declare-fun m!348667 () Bool)

(assert (=> b!347519 m!348667))

(declare-fun m!348669 () Bool)

(assert (=> b!347519 m!348669))

(declare-fun m!348671 () Bool)

(assert (=> b!347519 m!348671))

(assert (=> b!347519 m!348667))

(assert (=> b!347519 m!348669))

(assert (=> b!347519 m!348623))

(assert (=> b!347519 m!348623))

(declare-fun m!348673 () Bool)

(assert (=> b!347519 m!348673))

(declare-fun m!348675 () Bool)

(assert (=> b!347515 m!348675))

(declare-fun m!348677 () Bool)

(assert (=> bm!26843 m!348677))

(declare-fun m!348679 () Bool)

(assert (=> bm!26845 m!348679))

(declare-fun m!348681 () Bool)

(assert (=> b!347507 m!348681))

(declare-fun m!348683 () Bool)

(assert (=> b!347507 m!348683))

(declare-fun m!348685 () Bool)

(assert (=> b!347507 m!348685))

(assert (=> b!347507 m!348623))

(declare-fun m!348687 () Bool)

(assert (=> b!347507 m!348687))

(declare-fun m!348689 () Bool)

(assert (=> b!347507 m!348689))

(declare-fun m!348691 () Bool)

(assert (=> b!347507 m!348691))

(declare-fun m!348693 () Bool)

(assert (=> b!347507 m!348693))

(declare-fun m!348695 () Bool)

(assert (=> b!347507 m!348695))

(declare-fun m!348697 () Bool)

(assert (=> b!347507 m!348697))

(assert (=> b!347507 m!348677))

(declare-fun m!348699 () Bool)

(assert (=> b!347507 m!348699))

(assert (=> b!347507 m!348683))

(declare-fun m!348701 () Bool)

(assert (=> b!347507 m!348701))

(declare-fun m!348703 () Bool)

(assert (=> b!347507 m!348703))

(declare-fun m!348705 () Bool)

(assert (=> b!347507 m!348705))

(declare-fun m!348707 () Bool)

(assert (=> b!347507 m!348707))

(assert (=> b!347507 m!348681))

(declare-fun m!348709 () Bool)

(assert (=> b!347507 m!348709))

(assert (=> b!347507 m!348689))

(assert (=> b!347507 m!348703))

(assert (=> d!71313 m!348545))

(declare-fun m!348711 () Bool)

(assert (=> b!347508 m!348711))

(assert (=> b!347512 m!348623))

(assert (=> b!347512 m!348623))

(assert (=> b!347512 m!348647))

(declare-fun m!348713 () Bool)

(assert (=> b!347504 m!348713))

(assert (=> b!347513 m!348623))

(assert (=> b!347513 m!348623))

(declare-fun m!348715 () Bool)

(assert (=> b!347513 m!348715))

(declare-fun m!348717 () Bool)

(assert (=> bm!26846 m!348717))

(assert (=> b!347326 d!71313))

(declare-fun d!71315 () Bool)

(declare-fun res!192387 () Bool)

(declare-fun e!212934 () Bool)

(assert (=> d!71315 (=> res!192387 e!212934)))

(assert (=> d!71315 (= res!192387 (= (select (arr!8796 _keys!1895) (index!15572 lt!163558)) k0!1348))))

(assert (=> d!71315 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15572 lt!163558)) e!212934)))

(declare-fun b!347524 () Bool)

(declare-fun e!212935 () Bool)

(assert (=> b!347524 (= e!212934 e!212935)))

(declare-fun res!192388 () Bool)

(assert (=> b!347524 (=> (not res!192388) (not e!212935))))

(assert (=> b!347524 (= res!192388 (bvslt (bvadd (index!15572 lt!163558) #b00000000000000000000000000000001) (size!9148 _keys!1895)))))

(declare-fun b!347525 () Bool)

(assert (=> b!347525 (= e!212935 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15572 lt!163558) #b00000000000000000000000000000001)))))

(assert (= (and d!71315 (not res!192387)) b!347524))

(assert (= (and b!347524 res!192388) b!347525))

(assert (=> d!71315 m!348541))

(declare-fun m!348719 () Bool)

(assert (=> b!347525 m!348719))

(assert (=> b!347325 d!71315))

(declare-fun condMapEmpty!12708 () Bool)

(declare-fun mapDefault!12708 () ValueCell!3404)

(assert (=> mapNonEmpty!12699 (= condMapEmpty!12708 (= mapRest!12699 ((as const (Array (_ BitVec 32) ValueCell!3404)) mapDefault!12708)))))

(declare-fun e!212940 () Bool)

(declare-fun mapRes!12708 () Bool)

(assert (=> mapNonEmpty!12699 (= tp!26193 (and e!212940 mapRes!12708))))

(declare-fun mapNonEmpty!12708 () Bool)

(declare-fun tp!26208 () Bool)

(declare-fun e!212941 () Bool)

(assert (=> mapNonEmpty!12708 (= mapRes!12708 (and tp!26208 e!212941))))

(declare-fun mapValue!12708 () ValueCell!3404)

(declare-fun mapRest!12708 () (Array (_ BitVec 32) ValueCell!3404))

(declare-fun mapKey!12708 () (_ BitVec 32))

(assert (=> mapNonEmpty!12708 (= mapRest!12699 (store mapRest!12708 mapKey!12708 mapValue!12708))))

(declare-fun b!347533 () Bool)

(assert (=> b!347533 (= e!212940 tp_is_empty!7495)))

(declare-fun mapIsEmpty!12708 () Bool)

(assert (=> mapIsEmpty!12708 mapRes!12708))

(declare-fun b!347532 () Bool)

(assert (=> b!347532 (= e!212941 tp_is_empty!7495)))

(assert (= (and mapNonEmpty!12699 condMapEmpty!12708) mapIsEmpty!12708))

(assert (= (and mapNonEmpty!12699 (not condMapEmpty!12708)) mapNonEmpty!12708))

(assert (= (and mapNonEmpty!12708 ((_ is ValueCellFull!3404) mapValue!12708)) b!347532))

(assert (= (and mapNonEmpty!12699 ((_ is ValueCellFull!3404) mapDefault!12708)) b!347533))

(declare-fun m!348721 () Bool)

(assert (=> mapNonEmpty!12708 m!348721))

(declare-fun b_lambda!8507 () Bool)

(assert (= b_lambda!8505 (or (and start!34722 b_free!7543) b_lambda!8507)))

(check-sat (not b_next!7543) (not bm!26825) (not b_lambda!8507) (not b!347449) (not bm!26822) (not b!347437) (not d!71311) (not bm!26846) (not b!347434) (not b!347512) (not b!347458) (not b!347506) (not b!347456) (not bm!26842) (not b!347519) (not bm!26845) (not b!347504) (not d!71295) tp_is_empty!7495 (not b!347436) (not b!347446) (not mapNonEmpty!12708) (not b!347525) (not d!71313) (not b!347513) (not b!347404) (not b!347507) b_and!14783 (not b!347508) (not d!71305) (not b!347515) (not bm!26843) (not b!347420))
(check-sat b_and!14783 (not b_next!7543))
