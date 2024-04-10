; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34738 () Bool)

(assert start!34738)

(declare-fun b_free!7545 () Bool)

(declare-fun b_next!7545 () Bool)

(assert (=> start!34738 (= b_free!7545 (not b_next!7545))))

(declare-fun tp!26199 () Bool)

(declare-fun b_and!14765 () Bool)

(assert (=> start!34738 (= tp!26199 b_and!14765)))

(declare-fun b!347408 () Bool)

(declare-fun res!192312 () Bool)

(declare-fun e!212868 () Bool)

(assert (=> b!347408 (=> (not res!192312) (not e!212868))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18585 0))(
  ( (array!18586 (arr!8803 (Array (_ BitVec 32) (_ BitVec 64))) (size!9155 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18585)

(declare-datatypes ((SeekEntryResult!3397 0))(
  ( (MissingZero!3397 (index!15767 (_ BitVec 32))) (Found!3397 (index!15768 (_ BitVec 32))) (Intermediate!3397 (undefined!4209 Bool) (index!15769 (_ BitVec 32)) (x!34611 (_ BitVec 32))) (Undefined!3397) (MissingVacant!3397 (index!15770 (_ BitVec 32))) )
))
(declare-fun lt!163545 () SeekEntryResult!3397)

(declare-fun arrayContainsKey!0 (array!18585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347408 (= res!192312 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15768 lt!163545)))))

(declare-fun b!347409 () Bool)

(declare-fun res!192309 () Bool)

(declare-fun e!212863 () Bool)

(assert (=> b!347409 (=> (not res!192309) (not e!212863))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10973 0))(
  ( (V!10974 (val!3793 Int)) )
))
(declare-datatypes ((ValueCell!3405 0))(
  ( (ValueCellFull!3405 (v!5975 V!10973)) (EmptyCell!3405) )
))
(declare-datatypes ((array!18587 0))(
  ( (array!18588 (arr!8804 (Array (_ BitVec 32) ValueCell!3405)) (size!9156 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18587)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347409 (= res!192309 (and (= (size!9156 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9155 _keys!1895) (size!9156 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347411 () Bool)

(declare-fun res!192308 () Bool)

(assert (=> b!347411 (=> (not res!192308) (not e!212863))))

(declare-datatypes ((List!5112 0))(
  ( (Nil!5109) (Cons!5108 (h!5964 (_ BitVec 64)) (t!10240 List!5112)) )
))
(declare-fun arrayNoDuplicates!0 (array!18585 (_ BitVec 32) List!5112) Bool)

(assert (=> b!347411 (= res!192308 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5109))))

(declare-fun b!347412 () Bool)

(declare-fun e!212867 () Bool)

(declare-fun tp_is_empty!7497 () Bool)

(assert (=> b!347412 (= e!212867 tp_is_empty!7497)))

(declare-fun b!347413 () Bool)

(declare-fun e!212866 () Bool)

(declare-fun mapRes!12702 () Bool)

(assert (=> b!347413 (= e!212866 (and e!212867 mapRes!12702))))

(declare-fun condMapEmpty!12702 () Bool)

(declare-fun mapDefault!12702 () ValueCell!3405)

(assert (=> b!347413 (= condMapEmpty!12702 (= (arr!8804 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3405)) mapDefault!12702)))))

(declare-fun b!347414 () Bool)

(declare-fun res!192311 () Bool)

(assert (=> b!347414 (=> (not res!192311) (not e!212863))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10973)

(declare-fun zeroValue!1467 () V!10973)

(declare-datatypes ((tuple2!5490 0))(
  ( (tuple2!5491 (_1!2756 (_ BitVec 64)) (_2!2756 V!10973)) )
))
(declare-datatypes ((List!5113 0))(
  ( (Nil!5110) (Cons!5109 (h!5965 tuple2!5490) (t!10241 List!5113)) )
))
(declare-datatypes ((ListLongMap!4403 0))(
  ( (ListLongMap!4404 (toList!2217 List!5113)) )
))
(declare-fun contains!2281 (ListLongMap!4403 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1738 (array!18585 array!18587 (_ BitVec 32) (_ BitVec 32) V!10973 V!10973 (_ BitVec 32) Int) ListLongMap!4403)

(assert (=> b!347414 (= res!192311 (not (contains!2281 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!347415 () Bool)

(assert (=> b!347415 (= e!212863 e!212868)))

(declare-fun res!192307 () Bool)

(assert (=> b!347415 (=> (not res!192307) (not e!212868))))

(get-info :version)

(assert (=> b!347415 (= res!192307 (and ((_ is Found!3397) lt!163545) (= (select (arr!8803 _keys!1895) (index!15768 lt!163545)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18585 (_ BitVec 32)) SeekEntryResult!3397)

(assert (=> b!347415 (= lt!163545 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347416 () Bool)

(assert (=> b!347416 (= e!212868 (not (and (bvsge (index!15768 lt!163545) #b00000000000000000000000000000000) (bvslt (index!15768 lt!163545) (size!9155 _keys!1895)))))))

(assert (=> b!347416 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10787 0))(
  ( (Unit!10788) )
))
(declare-fun lt!163546 () Unit!10787)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18585 (_ BitVec 64) (_ BitVec 32)) Unit!10787)

(assert (=> b!347416 (= lt!163546 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15768 lt!163545)))))

(declare-fun mapIsEmpty!12702 () Bool)

(assert (=> mapIsEmpty!12702 mapRes!12702))

(declare-fun b!347417 () Bool)

(declare-fun res!192310 () Bool)

(assert (=> b!347417 (=> (not res!192310) (not e!212863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18585 (_ BitVec 32)) Bool)

(assert (=> b!347417 (= res!192310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347410 () Bool)

(declare-fun e!212865 () Bool)

(assert (=> b!347410 (= e!212865 tp_is_empty!7497)))

(declare-fun res!192313 () Bool)

(assert (=> start!34738 (=> (not res!192313) (not e!212863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34738 (= res!192313 (validMask!0 mask!2385))))

(assert (=> start!34738 e!212863))

(assert (=> start!34738 true))

(assert (=> start!34738 tp_is_empty!7497))

(assert (=> start!34738 tp!26199))

(declare-fun array_inv!6520 (array!18587) Bool)

(assert (=> start!34738 (and (array_inv!6520 _values!1525) e!212866)))

(declare-fun array_inv!6521 (array!18585) Bool)

(assert (=> start!34738 (array_inv!6521 _keys!1895)))

(declare-fun b!347418 () Bool)

(declare-fun res!192314 () Bool)

(assert (=> b!347418 (=> (not res!192314) (not e!212863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347418 (= res!192314 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12702 () Bool)

(declare-fun tp!26198 () Bool)

(assert (=> mapNonEmpty!12702 (= mapRes!12702 (and tp!26198 e!212865))))

(declare-fun mapKey!12702 () (_ BitVec 32))

(declare-fun mapValue!12702 () ValueCell!3405)

(declare-fun mapRest!12702 () (Array (_ BitVec 32) ValueCell!3405))

(assert (=> mapNonEmpty!12702 (= (arr!8804 _values!1525) (store mapRest!12702 mapKey!12702 mapValue!12702))))

(assert (= (and start!34738 res!192313) b!347409))

(assert (= (and b!347409 res!192309) b!347417))

(assert (= (and b!347417 res!192310) b!347411))

(assert (= (and b!347411 res!192308) b!347418))

(assert (= (and b!347418 res!192314) b!347414))

(assert (= (and b!347414 res!192311) b!347415))

(assert (= (and b!347415 res!192307) b!347408))

(assert (= (and b!347408 res!192312) b!347416))

(assert (= (and b!347413 condMapEmpty!12702) mapIsEmpty!12702))

(assert (= (and b!347413 (not condMapEmpty!12702)) mapNonEmpty!12702))

(assert (= (and mapNonEmpty!12702 ((_ is ValueCellFull!3405) mapValue!12702)) b!347410))

(assert (= (and b!347413 ((_ is ValueCellFull!3405) mapDefault!12702)) b!347412))

(assert (= start!34738 b!347413))

(declare-fun m!348343 () Bool)

(assert (=> b!347415 m!348343))

(declare-fun m!348345 () Bool)

(assert (=> b!347415 m!348345))

(declare-fun m!348347 () Bool)

(assert (=> b!347414 m!348347))

(assert (=> b!347414 m!348347))

(declare-fun m!348349 () Bool)

(assert (=> b!347414 m!348349))

(declare-fun m!348351 () Bool)

(assert (=> b!347418 m!348351))

(declare-fun m!348353 () Bool)

(assert (=> b!347411 m!348353))

(declare-fun m!348355 () Bool)

(assert (=> mapNonEmpty!12702 m!348355))

(declare-fun m!348357 () Bool)

(assert (=> start!34738 m!348357))

(declare-fun m!348359 () Bool)

(assert (=> start!34738 m!348359))

(declare-fun m!348361 () Bool)

(assert (=> start!34738 m!348361))

(declare-fun m!348363 () Bool)

(assert (=> b!347417 m!348363))

(declare-fun m!348365 () Bool)

(assert (=> b!347408 m!348365))

(declare-fun m!348367 () Bool)

(assert (=> b!347416 m!348367))

(declare-fun m!348369 () Bool)

(assert (=> b!347416 m!348369))

(check-sat (not mapNonEmpty!12702) (not b!347416) (not start!34738) (not b!347417) tp_is_empty!7497 (not b!347408) b_and!14765 (not b!347414) (not b!347415) (not b!347418) (not b_next!7545) (not b!347411))
(check-sat b_and!14765 (not b_next!7545))
(get-model)

(declare-fun b!347462 () Bool)

(declare-fun e!212898 () Bool)

(declare-fun call!26839 () Bool)

(assert (=> b!347462 (= e!212898 call!26839)))

(declare-fun b!347463 () Bool)

(assert (=> b!347463 (= e!212898 call!26839)))

(declare-fun b!347464 () Bool)

(declare-fun e!212897 () Bool)

(assert (=> b!347464 (= e!212897 e!212898)))

(declare-fun c!53175 () Bool)

(assert (=> b!347464 (= c!53175 (validKeyInArray!0 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!347465 () Bool)

(declare-fun e!212895 () Bool)

(declare-fun contains!2282 (List!5112 (_ BitVec 64)) Bool)

(assert (=> b!347465 (= e!212895 (contains!2282 Nil!5109 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26836 () Bool)

(assert (=> bm!26836 (= call!26839 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53175 (Cons!5108 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000) Nil!5109) Nil!5109)))))

(declare-fun d!71265 () Bool)

(declare-fun res!192345 () Bool)

(declare-fun e!212896 () Bool)

(assert (=> d!71265 (=> res!192345 e!212896)))

(assert (=> d!71265 (= res!192345 (bvsge #b00000000000000000000000000000000 (size!9155 _keys!1895)))))

(assert (=> d!71265 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5109) e!212896)))

(declare-fun b!347466 () Bool)

(assert (=> b!347466 (= e!212896 e!212897)))

(declare-fun res!192347 () Bool)

(assert (=> b!347466 (=> (not res!192347) (not e!212897))))

(assert (=> b!347466 (= res!192347 (not e!212895))))

(declare-fun res!192346 () Bool)

(assert (=> b!347466 (=> (not res!192346) (not e!212895))))

(assert (=> b!347466 (= res!192346 (validKeyInArray!0 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71265 (not res!192345)) b!347466))

(assert (= (and b!347466 res!192346) b!347465))

(assert (= (and b!347466 res!192347) b!347464))

(assert (= (and b!347464 c!53175) b!347462))

(assert (= (and b!347464 (not c!53175)) b!347463))

(assert (= (or b!347462 b!347463) bm!26836))

(declare-fun m!348399 () Bool)

(assert (=> b!347464 m!348399))

(assert (=> b!347464 m!348399))

(declare-fun m!348401 () Bool)

(assert (=> b!347464 m!348401))

(assert (=> b!347465 m!348399))

(assert (=> b!347465 m!348399))

(declare-fun m!348403 () Bool)

(assert (=> b!347465 m!348403))

(assert (=> bm!26836 m!348399))

(declare-fun m!348405 () Bool)

(assert (=> bm!26836 m!348405))

(assert (=> b!347466 m!348399))

(assert (=> b!347466 m!348399))

(assert (=> b!347466 m!348401))

(assert (=> b!347411 d!71265))

(declare-fun d!71267 () Bool)

(declare-fun res!192352 () Bool)

(declare-fun e!212903 () Bool)

(assert (=> d!71267 (=> res!192352 e!212903)))

(assert (=> d!71267 (= res!192352 (= (select (arr!8803 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71267 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!212903)))

(declare-fun b!347471 () Bool)

(declare-fun e!212904 () Bool)

(assert (=> b!347471 (= e!212903 e!212904)))

(declare-fun res!192353 () Bool)

(assert (=> b!347471 (=> (not res!192353) (not e!212904))))

(assert (=> b!347471 (= res!192353 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9155 _keys!1895)))))

(declare-fun b!347472 () Bool)

(assert (=> b!347472 (= e!212904 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71267 (not res!192352)) b!347471))

(assert (= (and b!347471 res!192353) b!347472))

(assert (=> d!71267 m!348399))

(declare-fun m!348407 () Bool)

(assert (=> b!347472 m!348407))

(assert (=> b!347416 d!71267))

(declare-fun d!71269 () Bool)

(assert (=> d!71269 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163555 () Unit!10787)

(declare-fun choose!13 (array!18585 (_ BitVec 64) (_ BitVec 32)) Unit!10787)

(assert (=> d!71269 (= lt!163555 (choose!13 _keys!1895 k0!1348 (index!15768 lt!163545)))))

(assert (=> d!71269 (bvsge (index!15768 lt!163545) #b00000000000000000000000000000000)))

(assert (=> d!71269 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15768 lt!163545)) lt!163555)))

(declare-fun bs!11875 () Bool)

(assert (= bs!11875 d!71269))

(assert (=> bs!11875 m!348367))

(declare-fun m!348409 () Bool)

(assert (=> bs!11875 m!348409))

(assert (=> b!347416 d!71269))

(declare-fun b!347485 () Bool)

(declare-fun e!212911 () SeekEntryResult!3397)

(declare-fun e!212913 () SeekEntryResult!3397)

(assert (=> b!347485 (= e!212911 e!212913)))

(declare-fun lt!163564 () (_ BitVec 64))

(declare-fun lt!163563 () SeekEntryResult!3397)

(assert (=> b!347485 (= lt!163564 (select (arr!8803 _keys!1895) (index!15769 lt!163563)))))

(declare-fun c!53183 () Bool)

(assert (=> b!347485 (= c!53183 (= lt!163564 k0!1348))))

(declare-fun b!347486 () Bool)

(declare-fun c!53182 () Bool)

(assert (=> b!347486 (= c!53182 (= lt!163564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!212912 () SeekEntryResult!3397)

(assert (=> b!347486 (= e!212913 e!212912)))

(declare-fun b!347487 () Bool)

(assert (=> b!347487 (= e!212913 (Found!3397 (index!15769 lt!163563)))))

(declare-fun b!347488 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18585 (_ BitVec 32)) SeekEntryResult!3397)

(assert (=> b!347488 (= e!212912 (seekKeyOrZeroReturnVacant!0 (x!34611 lt!163563) (index!15769 lt!163563) (index!15769 lt!163563) k0!1348 _keys!1895 mask!2385))))

(declare-fun d!71271 () Bool)

(declare-fun lt!163562 () SeekEntryResult!3397)

(assert (=> d!71271 (and (or ((_ is Undefined!3397) lt!163562) (not ((_ is Found!3397) lt!163562)) (and (bvsge (index!15768 lt!163562) #b00000000000000000000000000000000) (bvslt (index!15768 lt!163562) (size!9155 _keys!1895)))) (or ((_ is Undefined!3397) lt!163562) ((_ is Found!3397) lt!163562) (not ((_ is MissingZero!3397) lt!163562)) (and (bvsge (index!15767 lt!163562) #b00000000000000000000000000000000) (bvslt (index!15767 lt!163562) (size!9155 _keys!1895)))) (or ((_ is Undefined!3397) lt!163562) ((_ is Found!3397) lt!163562) ((_ is MissingZero!3397) lt!163562) (not ((_ is MissingVacant!3397) lt!163562)) (and (bvsge (index!15770 lt!163562) #b00000000000000000000000000000000) (bvslt (index!15770 lt!163562) (size!9155 _keys!1895)))) (or ((_ is Undefined!3397) lt!163562) (ite ((_ is Found!3397) lt!163562) (= (select (arr!8803 _keys!1895) (index!15768 lt!163562)) k0!1348) (ite ((_ is MissingZero!3397) lt!163562) (= (select (arr!8803 _keys!1895) (index!15767 lt!163562)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3397) lt!163562) (= (select (arr!8803 _keys!1895) (index!15770 lt!163562)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71271 (= lt!163562 e!212911)))

(declare-fun c!53184 () Bool)

(assert (=> d!71271 (= c!53184 (and ((_ is Intermediate!3397) lt!163563) (undefined!4209 lt!163563)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18585 (_ BitVec 32)) SeekEntryResult!3397)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71271 (= lt!163563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71271 (validMask!0 mask!2385)))

(assert (=> d!71271 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163562)))

(declare-fun b!347489 () Bool)

(assert (=> b!347489 (= e!212911 Undefined!3397)))

(declare-fun b!347490 () Bool)

(assert (=> b!347490 (= e!212912 (MissingZero!3397 (index!15769 lt!163563)))))

(assert (= (and d!71271 c!53184) b!347489))

(assert (= (and d!71271 (not c!53184)) b!347485))

(assert (= (and b!347485 c!53183) b!347487))

(assert (= (and b!347485 (not c!53183)) b!347486))

(assert (= (and b!347486 c!53182) b!347490))

(assert (= (and b!347486 (not c!53182)) b!347488))

(declare-fun m!348411 () Bool)

(assert (=> b!347485 m!348411))

(declare-fun m!348413 () Bool)

(assert (=> b!347488 m!348413))

(declare-fun m!348415 () Bool)

(assert (=> d!71271 m!348415))

(declare-fun m!348417 () Bool)

(assert (=> d!71271 m!348417))

(assert (=> d!71271 m!348415))

(declare-fun m!348419 () Bool)

(assert (=> d!71271 m!348419))

(declare-fun m!348421 () Bool)

(assert (=> d!71271 m!348421))

(declare-fun m!348423 () Bool)

(assert (=> d!71271 m!348423))

(assert (=> d!71271 m!348357))

(assert (=> b!347415 d!71271))

(declare-fun d!71273 () Bool)

(assert (=> d!71273 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!347418 d!71273))

(declare-fun d!71275 () Bool)

(assert (=> d!71275 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34738 d!71275))

(declare-fun d!71277 () Bool)

(assert (=> d!71277 (= (array_inv!6520 _values!1525) (bvsge (size!9156 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34738 d!71277))

(declare-fun d!71279 () Bool)

(assert (=> d!71279 (= (array_inv!6521 _keys!1895) (bvsge (size!9155 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34738 d!71279))

(declare-fun d!71281 () Bool)

(declare-fun res!192354 () Bool)

(declare-fun e!212914 () Bool)

(assert (=> d!71281 (=> res!192354 e!212914)))

(assert (=> d!71281 (= res!192354 (= (select (arr!8803 _keys!1895) (index!15768 lt!163545)) k0!1348))))

(assert (=> d!71281 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15768 lt!163545)) e!212914)))

(declare-fun b!347491 () Bool)

(declare-fun e!212915 () Bool)

(assert (=> b!347491 (= e!212914 e!212915)))

(declare-fun res!192355 () Bool)

(assert (=> b!347491 (=> (not res!192355) (not e!212915))))

(assert (=> b!347491 (= res!192355 (bvslt (bvadd (index!15768 lt!163545) #b00000000000000000000000000000001) (size!9155 _keys!1895)))))

(declare-fun b!347492 () Bool)

(assert (=> b!347492 (= e!212915 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15768 lt!163545) #b00000000000000000000000000000001)))))

(assert (= (and d!71281 (not res!192354)) b!347491))

(assert (= (and b!347491 res!192355) b!347492))

(assert (=> d!71281 m!348343))

(declare-fun m!348425 () Bool)

(assert (=> b!347492 m!348425))

(assert (=> b!347408 d!71281))

(declare-fun d!71283 () Bool)

(declare-fun e!212920 () Bool)

(assert (=> d!71283 e!212920))

(declare-fun res!192358 () Bool)

(assert (=> d!71283 (=> res!192358 e!212920)))

(declare-fun lt!163573 () Bool)

(assert (=> d!71283 (= res!192358 (not lt!163573))))

(declare-fun lt!163574 () Bool)

(assert (=> d!71283 (= lt!163573 lt!163574)))

(declare-fun lt!163575 () Unit!10787)

(declare-fun e!212921 () Unit!10787)

(assert (=> d!71283 (= lt!163575 e!212921)))

(declare-fun c!53187 () Bool)

(assert (=> d!71283 (= c!53187 lt!163574)))

(declare-fun containsKey!336 (List!5113 (_ BitVec 64)) Bool)

(assert (=> d!71283 (= lt!163574 (containsKey!336 (toList!2217 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71283 (= (contains!2281 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163573)))

(declare-fun b!347499 () Bool)

(declare-fun lt!163576 () Unit!10787)

(assert (=> b!347499 (= e!212921 lt!163576)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!284 (List!5113 (_ BitVec 64)) Unit!10787)

(assert (=> b!347499 (= lt!163576 (lemmaContainsKeyImpliesGetValueByKeyDefined!284 (toList!2217 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!350 0))(
  ( (Some!349 (v!5977 V!10973)) (None!348) )
))
(declare-fun isDefined!285 (Option!350) Bool)

(declare-fun getValueByKey!344 (List!5113 (_ BitVec 64)) Option!350)

(assert (=> b!347499 (isDefined!285 (getValueByKey!344 (toList!2217 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!347500 () Bool)

(declare-fun Unit!10789 () Unit!10787)

(assert (=> b!347500 (= e!212921 Unit!10789)))

(declare-fun b!347501 () Bool)

(assert (=> b!347501 (= e!212920 (isDefined!285 (getValueByKey!344 (toList!2217 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71283 c!53187) b!347499))

(assert (= (and d!71283 (not c!53187)) b!347500))

(assert (= (and d!71283 (not res!192358)) b!347501))

(declare-fun m!348427 () Bool)

(assert (=> d!71283 m!348427))

(declare-fun m!348429 () Bool)

(assert (=> b!347499 m!348429))

(declare-fun m!348431 () Bool)

(assert (=> b!347499 m!348431))

(assert (=> b!347499 m!348431))

(declare-fun m!348433 () Bool)

(assert (=> b!347499 m!348433))

(assert (=> b!347501 m!348431))

(assert (=> b!347501 m!348431))

(assert (=> b!347501 m!348433))

(assert (=> b!347414 d!71283))

(declare-fun bm!26851 () Bool)

(declare-fun call!26856 () ListLongMap!4403)

(declare-fun call!26857 () ListLongMap!4403)

(assert (=> bm!26851 (= call!26856 call!26857)))

(declare-fun bm!26852 () Bool)

(declare-fun call!26854 () ListLongMap!4403)

(declare-fun getCurrentListMapNoExtraKeys!608 (array!18585 array!18587 (_ BitVec 32) (_ BitVec 32) V!10973 V!10973 (_ BitVec 32) Int) ListLongMap!4403)

(assert (=> bm!26852 (= call!26854 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347544 () Bool)

(declare-fun e!212951 () Bool)

(declare-fun lt!163628 () ListLongMap!4403)

(declare-fun apply!286 (ListLongMap!4403 (_ BitVec 64)) V!10973)

(assert (=> b!347544 (= e!212951 (= (apply!286 lt!163628 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!347545 () Bool)

(declare-fun e!212952 () Bool)

(declare-fun call!26858 () Bool)

(assert (=> b!347545 (= e!212952 (not call!26858))))

(declare-fun b!347546 () Bool)

(declare-fun e!212960 () Bool)

(assert (=> b!347546 (= e!212960 (validKeyInArray!0 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!347548 () Bool)

(declare-fun e!212953 () Unit!10787)

(declare-fun lt!163625 () Unit!10787)

(assert (=> b!347548 (= e!212953 lt!163625)))

(declare-fun lt!163631 () ListLongMap!4403)

(assert (=> b!347548 (= lt!163631 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163641 () (_ BitVec 64))

(assert (=> b!347548 (= lt!163641 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163622 () (_ BitVec 64))

(assert (=> b!347548 (= lt!163622 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163633 () Unit!10787)

(declare-fun addStillContains!262 (ListLongMap!4403 (_ BitVec 64) V!10973 (_ BitVec 64)) Unit!10787)

(assert (=> b!347548 (= lt!163633 (addStillContains!262 lt!163631 lt!163641 zeroValue!1467 lt!163622))))

(declare-fun +!735 (ListLongMap!4403 tuple2!5490) ListLongMap!4403)

(assert (=> b!347548 (contains!2281 (+!735 lt!163631 (tuple2!5491 lt!163641 zeroValue!1467)) lt!163622)))

(declare-fun lt!163636 () Unit!10787)

(assert (=> b!347548 (= lt!163636 lt!163633)))

(declare-fun lt!163632 () ListLongMap!4403)

(assert (=> b!347548 (= lt!163632 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163629 () (_ BitVec 64))

(assert (=> b!347548 (= lt!163629 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163639 () (_ BitVec 64))

(assert (=> b!347548 (= lt!163639 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163627 () Unit!10787)

(declare-fun addApplyDifferent!262 (ListLongMap!4403 (_ BitVec 64) V!10973 (_ BitVec 64)) Unit!10787)

(assert (=> b!347548 (= lt!163627 (addApplyDifferent!262 lt!163632 lt!163629 minValue!1467 lt!163639))))

(assert (=> b!347548 (= (apply!286 (+!735 lt!163632 (tuple2!5491 lt!163629 minValue!1467)) lt!163639) (apply!286 lt!163632 lt!163639))))

(declare-fun lt!163626 () Unit!10787)

(assert (=> b!347548 (= lt!163626 lt!163627)))

(declare-fun lt!163621 () ListLongMap!4403)

(assert (=> b!347548 (= lt!163621 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163640 () (_ BitVec 64))

(assert (=> b!347548 (= lt!163640 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163634 () (_ BitVec 64))

(assert (=> b!347548 (= lt!163634 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163637 () Unit!10787)

(assert (=> b!347548 (= lt!163637 (addApplyDifferent!262 lt!163621 lt!163640 zeroValue!1467 lt!163634))))

(assert (=> b!347548 (= (apply!286 (+!735 lt!163621 (tuple2!5491 lt!163640 zeroValue!1467)) lt!163634) (apply!286 lt!163621 lt!163634))))

(declare-fun lt!163623 () Unit!10787)

(assert (=> b!347548 (= lt!163623 lt!163637)))

(declare-fun lt!163642 () ListLongMap!4403)

(assert (=> b!347548 (= lt!163642 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163624 () (_ BitVec 64))

(assert (=> b!347548 (= lt!163624 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163635 () (_ BitVec 64))

(assert (=> b!347548 (= lt!163635 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!347548 (= lt!163625 (addApplyDifferent!262 lt!163642 lt!163624 minValue!1467 lt!163635))))

(assert (=> b!347548 (= (apply!286 (+!735 lt!163642 (tuple2!5491 lt!163624 minValue!1467)) lt!163635) (apply!286 lt!163642 lt!163635))))

(declare-fun bm!26853 () Bool)

(declare-fun call!26860 () ListLongMap!4403)

(declare-fun call!26855 () ListLongMap!4403)

(assert (=> bm!26853 (= call!26860 call!26855)))

(declare-fun b!347549 () Bool)

(declare-fun e!212950 () Bool)

(declare-fun call!26859 () Bool)

(assert (=> b!347549 (= e!212950 (not call!26859))))

(declare-fun b!347550 () Bool)

(declare-fun res!192385 () Bool)

(declare-fun e!212948 () Bool)

(assert (=> b!347550 (=> (not res!192385) (not e!212948))))

(declare-fun e!212958 () Bool)

(assert (=> b!347550 (= res!192385 e!212958)))

(declare-fun res!192383 () Bool)

(assert (=> b!347550 (=> res!192383 e!212958)))

(assert (=> b!347550 (= res!192383 (not e!212960))))

(declare-fun res!192380 () Bool)

(assert (=> b!347550 (=> (not res!192380) (not e!212960))))

(assert (=> b!347550 (= res!192380 (bvslt #b00000000000000000000000000000000 (size!9155 _keys!1895)))))

(declare-fun b!347551 () Bool)

(declare-fun c!53205 () Bool)

(assert (=> b!347551 (= c!53205 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!212957 () ListLongMap!4403)

(declare-fun e!212954 () ListLongMap!4403)

(assert (=> b!347551 (= e!212957 e!212954)))

(declare-fun b!347552 () Bool)

(declare-fun e!212956 () Bool)

(assert (=> b!347552 (= e!212956 (= (apply!286 lt!163628 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun c!53200 () Bool)

(declare-fun bm!26854 () Bool)

(declare-fun c!53202 () Bool)

(assert (=> bm!26854 (= call!26857 (+!735 (ite c!53202 call!26854 (ite c!53200 call!26855 call!26860)) (ite (or c!53202 c!53200) (tuple2!5491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!347553 () Bool)

(assert (=> b!347553 (= e!212950 e!212956)))

(declare-fun res!192384 () Bool)

(assert (=> b!347553 (= res!192384 call!26859)))

(assert (=> b!347553 (=> (not res!192384) (not e!212956))))

(declare-fun b!347554 () Bool)

(declare-fun e!212955 () Bool)

(assert (=> b!347554 (= e!212955 (validKeyInArray!0 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!347555 () Bool)

(assert (=> b!347555 (= e!212954 call!26856)))

(declare-fun b!347556 () Bool)

(declare-fun Unit!10790 () Unit!10787)

(assert (=> b!347556 (= e!212953 Unit!10790)))

(declare-fun b!347557 () Bool)

(declare-fun e!212949 () ListLongMap!4403)

(assert (=> b!347557 (= e!212949 (+!735 call!26857 (tuple2!5491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!347558 () Bool)

(assert (=> b!347558 (= e!212949 e!212957)))

(assert (=> b!347558 (= c!53200 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26855 () Bool)

(assert (=> bm!26855 (= call!26858 (contains!2281 lt!163628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!71285 () Bool)

(assert (=> d!71285 e!212948))

(declare-fun res!192378 () Bool)

(assert (=> d!71285 (=> (not res!192378) (not e!212948))))

(assert (=> d!71285 (= res!192378 (or (bvsge #b00000000000000000000000000000000 (size!9155 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9155 _keys!1895)))))))

(declare-fun lt!163638 () ListLongMap!4403)

(assert (=> d!71285 (= lt!163628 lt!163638)))

(declare-fun lt!163630 () Unit!10787)

(assert (=> d!71285 (= lt!163630 e!212953)))

(declare-fun c!53201 () Bool)

(assert (=> d!71285 (= c!53201 e!212955)))

(declare-fun res!192377 () Bool)

(assert (=> d!71285 (=> (not res!192377) (not e!212955))))

(assert (=> d!71285 (= res!192377 (bvslt #b00000000000000000000000000000000 (size!9155 _keys!1895)))))

(assert (=> d!71285 (= lt!163638 e!212949)))

(assert (=> d!71285 (= c!53202 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71285 (validMask!0 mask!2385)))

(assert (=> d!71285 (= (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163628)))

(declare-fun b!347547 () Bool)

(assert (=> b!347547 (= e!212957 call!26856)))

(declare-fun b!347559 () Bool)

(declare-fun res!192382 () Bool)

(assert (=> b!347559 (=> (not res!192382) (not e!212948))))

(assert (=> b!347559 (= res!192382 e!212952)))

(declare-fun c!53203 () Bool)

(assert (=> b!347559 (= c!53203 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!347560 () Bool)

(assert (=> b!347560 (= e!212954 call!26860)))

(declare-fun b!347561 () Bool)

(assert (=> b!347561 (= e!212948 e!212950)))

(declare-fun c!53204 () Bool)

(assert (=> b!347561 (= c!53204 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26856 () Bool)

(assert (=> bm!26856 (= call!26859 (contains!2281 lt!163628 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!212959 () Bool)

(declare-fun b!347562 () Bool)

(declare-fun get!4730 (ValueCell!3405 V!10973) V!10973)

(declare-fun dynLambda!629 (Int (_ BitVec 64)) V!10973)

(assert (=> b!347562 (= e!212959 (= (apply!286 lt!163628 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000)) (get!4730 (select (arr!8804 _values!1525) #b00000000000000000000000000000000) (dynLambda!629 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!347562 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9156 _values!1525)))))

(assert (=> b!347562 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9155 _keys!1895)))))

(declare-fun b!347563 () Bool)

(assert (=> b!347563 (= e!212958 e!212959)))

(declare-fun res!192381 () Bool)

(assert (=> b!347563 (=> (not res!192381) (not e!212959))))

(assert (=> b!347563 (= res!192381 (contains!2281 lt!163628 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!347563 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9155 _keys!1895)))))

(declare-fun b!347564 () Bool)

(assert (=> b!347564 (= e!212952 e!212951)))

(declare-fun res!192379 () Bool)

(assert (=> b!347564 (= res!192379 call!26858)))

(assert (=> b!347564 (=> (not res!192379) (not e!212951))))

(declare-fun bm!26857 () Bool)

(assert (=> bm!26857 (= call!26855 call!26854)))

(assert (= (and d!71285 c!53202) b!347557))

(assert (= (and d!71285 (not c!53202)) b!347558))

(assert (= (and b!347558 c!53200) b!347547))

(assert (= (and b!347558 (not c!53200)) b!347551))

(assert (= (and b!347551 c!53205) b!347555))

(assert (= (and b!347551 (not c!53205)) b!347560))

(assert (= (or b!347555 b!347560) bm!26853))

(assert (= (or b!347547 bm!26853) bm!26857))

(assert (= (or b!347547 b!347555) bm!26851))

(assert (= (or b!347557 bm!26857) bm!26852))

(assert (= (or b!347557 bm!26851) bm!26854))

(assert (= (and d!71285 res!192377) b!347554))

(assert (= (and d!71285 c!53201) b!347548))

(assert (= (and d!71285 (not c!53201)) b!347556))

(assert (= (and d!71285 res!192378) b!347550))

(assert (= (and b!347550 res!192380) b!347546))

(assert (= (and b!347550 (not res!192383)) b!347563))

(assert (= (and b!347563 res!192381) b!347562))

(assert (= (and b!347550 res!192385) b!347559))

(assert (= (and b!347559 c!53203) b!347564))

(assert (= (and b!347559 (not c!53203)) b!347545))

(assert (= (and b!347564 res!192379) b!347544))

(assert (= (or b!347564 b!347545) bm!26855))

(assert (= (and b!347559 res!192382) b!347561))

(assert (= (and b!347561 c!53204) b!347553))

(assert (= (and b!347561 (not c!53204)) b!347549))

(assert (= (and b!347553 res!192384) b!347552))

(assert (= (or b!347553 b!347549) bm!26856))

(declare-fun b_lambda!8483 () Bool)

(assert (=> (not b_lambda!8483) (not b!347562)))

(declare-fun t!10244 () Bool)

(declare-fun tb!3087 () Bool)

(assert (=> (and start!34738 (= defaultEntry!1528 defaultEntry!1528) t!10244) tb!3087))

(declare-fun result!5591 () Bool)

(assert (=> tb!3087 (= result!5591 tp_is_empty!7497)))

(assert (=> b!347562 t!10244))

(declare-fun b_and!14769 () Bool)

(assert (= b_and!14765 (and (=> t!10244 result!5591) b_and!14769)))

(assert (=> b!347546 m!348399))

(assert (=> b!347546 m!348399))

(assert (=> b!347546 m!348401))

(declare-fun m!348435 () Bool)

(assert (=> bm!26852 m!348435))

(assert (=> b!347563 m!348399))

(assert (=> b!347563 m!348399))

(declare-fun m!348437 () Bool)

(assert (=> b!347563 m!348437))

(declare-fun m!348439 () Bool)

(assert (=> bm!26855 m!348439))

(declare-fun m!348441 () Bool)

(assert (=> b!347548 m!348441))

(declare-fun m!348443 () Bool)

(assert (=> b!347548 m!348443))

(declare-fun m!348445 () Bool)

(assert (=> b!347548 m!348445))

(declare-fun m!348447 () Bool)

(assert (=> b!347548 m!348447))

(declare-fun m!348449 () Bool)

(assert (=> b!347548 m!348449))

(declare-fun m!348451 () Bool)

(assert (=> b!347548 m!348451))

(declare-fun m!348453 () Bool)

(assert (=> b!347548 m!348453))

(declare-fun m!348455 () Bool)

(assert (=> b!347548 m!348455))

(declare-fun m!348457 () Bool)

(assert (=> b!347548 m!348457))

(assert (=> b!347548 m!348399))

(declare-fun m!348459 () Bool)

(assert (=> b!347548 m!348459))

(assert (=> b!347548 m!348435))

(assert (=> b!347548 m!348451))

(declare-fun m!348461 () Bool)

(assert (=> b!347548 m!348461))

(assert (=> b!347548 m!348461))

(declare-fun m!348463 () Bool)

(assert (=> b!347548 m!348463))

(declare-fun m!348465 () Bool)

(assert (=> b!347548 m!348465))

(assert (=> b!347548 m!348457))

(declare-fun m!348467 () Bool)

(assert (=> b!347548 m!348467))

(assert (=> b!347548 m!348441))

(declare-fun m!348469 () Bool)

(assert (=> b!347548 m!348469))

(declare-fun m!348471 () Bool)

(assert (=> b!347557 m!348471))

(assert (=> d!71285 m!348357))

(declare-fun m!348473 () Bool)

(assert (=> bm!26854 m!348473))

(declare-fun m!348475 () Bool)

(assert (=> bm!26856 m!348475))

(assert (=> b!347554 m!348399))

(assert (=> b!347554 m!348399))

(assert (=> b!347554 m!348401))

(declare-fun m!348477 () Bool)

(assert (=> b!347552 m!348477))

(declare-fun m!348479 () Bool)

(assert (=> b!347562 m!348479))

(declare-fun m!348481 () Bool)

(assert (=> b!347562 m!348481))

(assert (=> b!347562 m!348399))

(declare-fun m!348483 () Bool)

(assert (=> b!347562 m!348483))

(assert (=> b!347562 m!348481))

(assert (=> b!347562 m!348479))

(declare-fun m!348485 () Bool)

(assert (=> b!347562 m!348485))

(assert (=> b!347562 m!348399))

(declare-fun m!348487 () Bool)

(assert (=> b!347544 m!348487))

(assert (=> b!347414 d!71285))

(declare-fun b!347575 () Bool)

(declare-fun e!212969 () Bool)

(declare-fun e!212968 () Bool)

(assert (=> b!347575 (= e!212969 e!212968)))

(declare-fun c!53208 () Bool)

(assert (=> b!347575 (= c!53208 (validKeyInArray!0 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!347576 () Bool)

(declare-fun e!212967 () Bool)

(declare-fun call!26863 () Bool)

(assert (=> b!347576 (= e!212967 call!26863)))

(declare-fun b!347577 () Bool)

(assert (=> b!347577 (= e!212968 e!212967)))

(declare-fun lt!163650 () (_ BitVec 64))

(assert (=> b!347577 (= lt!163650 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163651 () Unit!10787)

(assert (=> b!347577 (= lt!163651 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163650 #b00000000000000000000000000000000))))

(assert (=> b!347577 (arrayContainsKey!0 _keys!1895 lt!163650 #b00000000000000000000000000000000)))

(declare-fun lt!163649 () Unit!10787)

(assert (=> b!347577 (= lt!163649 lt!163651)))

(declare-fun res!192390 () Bool)

(assert (=> b!347577 (= res!192390 (= (seekEntryOrOpen!0 (select (arr!8803 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3397 #b00000000000000000000000000000000)))))

(assert (=> b!347577 (=> (not res!192390) (not e!212967))))

(declare-fun bm!26860 () Bool)

(assert (=> bm!26860 (= call!26863 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!347578 () Bool)

(assert (=> b!347578 (= e!212968 call!26863)))

(declare-fun d!71287 () Bool)

(declare-fun res!192391 () Bool)

(assert (=> d!71287 (=> res!192391 e!212969)))

(assert (=> d!71287 (= res!192391 (bvsge #b00000000000000000000000000000000 (size!9155 _keys!1895)))))

(assert (=> d!71287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!212969)))

(assert (= (and d!71287 (not res!192391)) b!347575))

(assert (= (and b!347575 c!53208) b!347577))

(assert (= (and b!347575 (not c!53208)) b!347578))

(assert (= (and b!347577 res!192390) b!347576))

(assert (= (or b!347576 b!347578) bm!26860))

(assert (=> b!347575 m!348399))

(assert (=> b!347575 m!348399))

(assert (=> b!347575 m!348401))

(assert (=> b!347577 m!348399))

(declare-fun m!348489 () Bool)

(assert (=> b!347577 m!348489))

(declare-fun m!348491 () Bool)

(assert (=> b!347577 m!348491))

(assert (=> b!347577 m!348399))

(declare-fun m!348493 () Bool)

(assert (=> b!347577 m!348493))

(declare-fun m!348495 () Bool)

(assert (=> bm!26860 m!348495))

(assert (=> b!347417 d!71287))

(declare-fun mapIsEmpty!12708 () Bool)

(declare-fun mapRes!12708 () Bool)

(assert (=> mapIsEmpty!12708 mapRes!12708))

(declare-fun b!347586 () Bool)

(declare-fun e!212975 () Bool)

(assert (=> b!347586 (= e!212975 tp_is_empty!7497)))

(declare-fun condMapEmpty!12708 () Bool)

(declare-fun mapDefault!12708 () ValueCell!3405)

(assert (=> mapNonEmpty!12702 (= condMapEmpty!12708 (= mapRest!12702 ((as const (Array (_ BitVec 32) ValueCell!3405)) mapDefault!12708)))))

(assert (=> mapNonEmpty!12702 (= tp!26198 (and e!212975 mapRes!12708))))

(declare-fun mapNonEmpty!12708 () Bool)

(declare-fun tp!26208 () Bool)

(declare-fun e!212974 () Bool)

(assert (=> mapNonEmpty!12708 (= mapRes!12708 (and tp!26208 e!212974))))

(declare-fun mapKey!12708 () (_ BitVec 32))

(declare-fun mapRest!12708 () (Array (_ BitVec 32) ValueCell!3405))

(declare-fun mapValue!12708 () ValueCell!3405)

(assert (=> mapNonEmpty!12708 (= mapRest!12702 (store mapRest!12708 mapKey!12708 mapValue!12708))))

(declare-fun b!347585 () Bool)

(assert (=> b!347585 (= e!212974 tp_is_empty!7497)))

(assert (= (and mapNonEmpty!12702 condMapEmpty!12708) mapIsEmpty!12708))

(assert (= (and mapNonEmpty!12702 (not condMapEmpty!12708)) mapNonEmpty!12708))

(assert (= (and mapNonEmpty!12708 ((_ is ValueCellFull!3405) mapValue!12708)) b!347585))

(assert (= (and mapNonEmpty!12702 ((_ is ValueCellFull!3405) mapDefault!12708)) b!347586))

(declare-fun m!348497 () Bool)

(assert (=> mapNonEmpty!12708 m!348497))

(declare-fun b_lambda!8485 () Bool)

(assert (= b_lambda!8483 (or (and start!34738 b_free!7545) b_lambda!8485)))

(check-sat (not b!347488) (not b!347501) (not b!347554) (not b!347546) (not b!347552) (not bm!26852) (not bm!26836) (not b!347557) (not b!347577) (not b!347492) (not b!347544) (not b!347466) (not b!347465) (not b!347562) (not bm!26855) (not b!347563) (not mapNonEmpty!12708) (not bm!26860) (not b!347472) (not d!71285) (not b!347499) (not b!347575) (not bm!26856) (not d!71283) (not d!71269) tp_is_empty!7497 (not b!347464) (not b_lambda!8485) (not b_next!7545) (not b!347548) b_and!14769 (not d!71271) (not bm!26854))
(check-sat b_and!14769 (not b_next!7545))
