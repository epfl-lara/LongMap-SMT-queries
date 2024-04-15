; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!680 () Bool)

(assert start!680)

(declare-fun b_free!133 () Bool)

(declare-fun b_next!133 () Bool)

(assert (=> start!680 (= b_free!133 (not b_next!133))))

(declare-fun tp!619 () Bool)

(declare-fun b_and!273 () Bool)

(assert (=> start!680 (= tp!619 b_and!273)))

(declare-fun mapNonEmpty!278 () Bool)

(declare-fun mapRes!278 () Bool)

(declare-fun tp!620 () Bool)

(declare-fun e!2400 () Bool)

(assert (=> mapNonEmpty!278 (= mapRes!278 (and tp!620 e!2400))))

(declare-datatypes ((V!459 0))(
  ( (V!460 (val!111 Int)) )
))
(declare-datatypes ((ValueCell!89 0))(
  ( (ValueCellFull!89 (v!1199 V!459)) (EmptyCell!89) )
))
(declare-datatypes ((array!347 0))(
  ( (array!348 (arr!165 (Array (_ BitVec 32) ValueCell!89)) (size!227 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!347)

(declare-fun mapRest!278 () (Array (_ BitVec 32) ValueCell!89))

(declare-fun mapKey!278 () (_ BitVec 32))

(declare-fun mapValue!278 () ValueCell!89)

(assert (=> mapNonEmpty!278 (= (arr!165 _values!1492) (store mapRest!278 mapKey!278 mapValue!278))))

(declare-fun b!4531 () Bool)

(declare-fun e!2399 () Bool)

(declare-fun e!2402 () Bool)

(assert (=> b!4531 (= e!2399 (and e!2402 mapRes!278))))

(declare-fun condMapEmpty!278 () Bool)

(declare-fun mapDefault!278 () ValueCell!89)

(assert (=> b!4531 (= condMapEmpty!278 (= (arr!165 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!89)) mapDefault!278)))))

(declare-fun b!4532 () Bool)

(declare-fun tp_is_empty!211 () Bool)

(assert (=> b!4532 (= e!2402 tp_is_empty!211)))

(declare-fun mapIsEmpty!278 () Bool)

(assert (=> mapIsEmpty!278 mapRes!278))

(declare-fun res!5768 () Bool)

(declare-fun e!2397 () Bool)

(assert (=> start!680 (=> (not res!5768) (not e!2397))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!680 (= res!5768 (validMask!0 mask!2250))))

(assert (=> start!680 e!2397))

(assert (=> start!680 tp!619))

(assert (=> start!680 true))

(declare-fun array_inv!115 (array!347) Bool)

(assert (=> start!680 (and (array_inv!115 _values!1492) e!2399)))

(assert (=> start!680 tp_is_empty!211))

(declare-datatypes ((array!349 0))(
  ( (array!350 (arr!166 (Array (_ BitVec 32) (_ BitVec 64))) (size!228 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!349)

(declare-fun array_inv!116 (array!349) Bool)

(assert (=> start!680 (array_inv!116 _keys!1806)))

(declare-fun b!4533 () Bool)

(declare-fun res!5771 () Bool)

(assert (=> b!4533 (=> (not res!5771) (not e!2397))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4533 (= res!5771 (validKeyInArray!0 k0!1278))))

(declare-fun b!4534 () Bool)

(declare-fun res!5769 () Bool)

(assert (=> b!4534 (=> (not res!5769) (not e!2397))))

(declare-datatypes ((List!105 0))(
  ( (Nil!102) (Cons!101 (h!667 (_ BitVec 64)) (t!2234 List!105)) )
))
(declare-fun arrayNoDuplicates!0 (array!349 (_ BitVec 32) List!105) Bool)

(assert (=> b!4534 (= res!5769 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!102))))

(declare-fun b!4535 () Bool)

(declare-fun res!5770 () Bool)

(assert (=> b!4535 (=> (not res!5770) (not e!2397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!349 (_ BitVec 32)) Bool)

(assert (=> b!4535 (= res!5770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4536 () Bool)

(declare-fun e!2398 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4536 (= e!2398 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4537 () Bool)

(assert (=> b!4537 (= e!2400 tp_is_empty!211)))

(declare-fun b!4538 () Bool)

(declare-fun res!5773 () Bool)

(assert (=> b!4538 (=> (not res!5773) (not e!2397))))

(assert (=> b!4538 (= res!5773 (and (= (size!227 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!228 _keys!1806) (size!227 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4539 () Bool)

(declare-fun res!5772 () Bool)

(assert (=> b!4539 (=> (not res!5772) (not e!2397))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!459)

(declare-fun zeroValue!1434 () V!459)

(declare-datatypes ((tuple2!98 0))(
  ( (tuple2!99 (_1!49 (_ BitVec 64)) (_2!49 V!459)) )
))
(declare-datatypes ((List!106 0))(
  ( (Nil!103) (Cons!102 (h!668 tuple2!98) (t!2235 List!106)) )
))
(declare-datatypes ((ListLongMap!103 0))(
  ( (ListLongMap!104 (toList!67 List!106)) )
))
(declare-fun contains!38 (ListLongMap!103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!26 (array!349 array!347 (_ BitVec 32) (_ BitVec 32) V!459 V!459 (_ BitVec 32) Int) ListLongMap!103)

(assert (=> b!4539 (= res!5772 (contains!38 (getCurrentListMap!26 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4540 () Bool)

(declare-fun arrayContainsKey!0 (array!349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4540 (= e!2398 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4541 () Bool)

(assert (=> b!4541 (= e!2397 (not (or (bvsge #b00000000000000000000000000000000 (size!228 _keys!1806)) (bvslt (size!228 _keys!1806) #b01111111111111111111111111111111))))))

(assert (=> b!4541 e!2398))

(declare-fun c!242 () Bool)

(assert (=> b!4541 (= c!242 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!41 0))(
  ( (Unit!42) )
))
(declare-fun lt!690 () Unit!41)

(declare-fun lemmaKeyInListMapIsInArray!9 (array!349 array!347 (_ BitVec 32) (_ BitVec 32) V!459 V!459 (_ BitVec 64) Int) Unit!41)

(assert (=> b!4541 (= lt!690 (lemmaKeyInListMapIsInArray!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (= (and start!680 res!5768) b!4538))

(assert (= (and b!4538 res!5773) b!4535))

(assert (= (and b!4535 res!5770) b!4534))

(assert (= (and b!4534 res!5769) b!4539))

(assert (= (and b!4539 res!5772) b!4533))

(assert (= (and b!4533 res!5771) b!4541))

(assert (= (and b!4541 c!242) b!4540))

(assert (= (and b!4541 (not c!242)) b!4536))

(assert (= (and b!4531 condMapEmpty!278) mapIsEmpty!278))

(assert (= (and b!4531 (not condMapEmpty!278)) mapNonEmpty!278))

(get-info :version)

(assert (= (and mapNonEmpty!278 ((_ is ValueCellFull!89) mapValue!278)) b!4537))

(assert (= (and b!4531 ((_ is ValueCellFull!89) mapDefault!278)) b!4532))

(assert (= start!680 b!4531))

(declare-fun m!2423 () Bool)

(assert (=> b!4535 m!2423))

(declare-fun m!2425 () Bool)

(assert (=> b!4541 m!2425))

(declare-fun m!2427 () Bool)

(assert (=> b!4534 m!2427))

(declare-fun m!2429 () Bool)

(assert (=> mapNonEmpty!278 m!2429))

(declare-fun m!2431 () Bool)

(assert (=> b!4539 m!2431))

(assert (=> b!4539 m!2431))

(declare-fun m!2433 () Bool)

(assert (=> b!4539 m!2433))

(declare-fun m!2435 () Bool)

(assert (=> b!4540 m!2435))

(declare-fun m!2437 () Bool)

(assert (=> start!680 m!2437))

(declare-fun m!2439 () Bool)

(assert (=> start!680 m!2439))

(declare-fun m!2441 () Bool)

(assert (=> start!680 m!2441))

(declare-fun m!2443 () Bool)

(assert (=> b!4533 m!2443))

(check-sat (not b!4541) tp_is_empty!211 (not b!4534) (not b!4533) (not b!4540) (not b!4535) b_and!273 (not start!680) (not mapNonEmpty!278) (not b_next!133) (not b!4539))
(check-sat b_and!273 (not b_next!133))
(get-model)

(declare-fun d!691 () Bool)

(declare-fun e!2441 () Bool)

(assert (=> d!691 e!2441))

(declare-fun c!251 () Bool)

(assert (=> d!691 (= c!251 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!699 () Unit!41)

(declare-fun choose!135 (array!349 array!347 (_ BitVec 32) (_ BitVec 32) V!459 V!459 (_ BitVec 64) Int) Unit!41)

(assert (=> d!691 (= lt!699 (choose!135 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!691 (validMask!0 mask!2250)))

(assert (=> d!691 (= (lemmaKeyInListMapIsInArray!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!699)))

(declare-fun b!4612 () Bool)

(assert (=> b!4612 (= e!2441 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4613 () Bool)

(assert (=> b!4613 (= e!2441 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!691 c!251) b!4612))

(assert (= (and d!691 (not c!251)) b!4613))

(declare-fun m!2489 () Bool)

(assert (=> d!691 m!2489))

(assert (=> d!691 m!2437))

(assert (=> b!4612 m!2435))

(assert (=> b!4541 d!691))

(declare-fun b!4622 () Bool)

(declare-fun e!2449 () Bool)

(declare-fun call!77 () Bool)

(assert (=> b!4622 (= e!2449 call!77)))

(declare-fun b!4624 () Bool)

(declare-fun e!2448 () Bool)

(assert (=> b!4624 (= e!2448 call!77)))

(declare-fun b!4625 () Bool)

(assert (=> b!4625 (= e!2449 e!2448)))

(declare-fun lt!706 () (_ BitVec 64))

(assert (=> b!4625 (= lt!706 (select (arr!166 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!707 () Unit!41)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!349 (_ BitVec 64) (_ BitVec 32)) Unit!41)

(assert (=> b!4625 (= lt!707 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!706 #b00000000000000000000000000000000))))

(assert (=> b!4625 (arrayContainsKey!0 _keys!1806 lt!706 #b00000000000000000000000000000000)))

(declare-fun lt!708 () Unit!41)

(assert (=> b!4625 (= lt!708 lt!707)))

(declare-fun res!5815 () Bool)

(declare-datatypes ((SeekEntryResult!11 0))(
  ( (MissingZero!11 (index!2163 (_ BitVec 32))) (Found!11 (index!2164 (_ BitVec 32))) (Intermediate!11 (undefined!823 Bool) (index!2165 (_ BitVec 32)) (x!2385 (_ BitVec 32))) (Undefined!11) (MissingVacant!11 (index!2166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!349 (_ BitVec 32)) SeekEntryResult!11)

(assert (=> b!4625 (= res!5815 (= (seekEntryOrOpen!0 (select (arr!166 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!11 #b00000000000000000000000000000000)))))

(assert (=> b!4625 (=> (not res!5815) (not e!2448))))

(declare-fun bm!74 () Bool)

(assert (=> bm!74 (= call!77 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!4623 () Bool)

(declare-fun e!2450 () Bool)

(assert (=> b!4623 (= e!2450 e!2449)))

(declare-fun c!254 () Bool)

(assert (=> b!4623 (= c!254 (validKeyInArray!0 (select (arr!166 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!693 () Bool)

(declare-fun res!5814 () Bool)

(assert (=> d!693 (=> res!5814 e!2450)))

(assert (=> d!693 (= res!5814 (bvsge #b00000000000000000000000000000000 (size!228 _keys!1806)))))

(assert (=> d!693 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!2450)))

(assert (= (and d!693 (not res!5814)) b!4623))

(assert (= (and b!4623 c!254) b!4625))

(assert (= (and b!4623 (not c!254)) b!4622))

(assert (= (and b!4625 res!5815) b!4624))

(assert (= (or b!4624 b!4622) bm!74))

(declare-fun m!2491 () Bool)

(assert (=> b!4625 m!2491))

(declare-fun m!2493 () Bool)

(assert (=> b!4625 m!2493))

(declare-fun m!2495 () Bool)

(assert (=> b!4625 m!2495))

(assert (=> b!4625 m!2491))

(declare-fun m!2497 () Bool)

(assert (=> b!4625 m!2497))

(declare-fun m!2499 () Bool)

(assert (=> bm!74 m!2499))

(assert (=> b!4623 m!2491))

(assert (=> b!4623 m!2491))

(declare-fun m!2501 () Bool)

(assert (=> b!4623 m!2501))

(assert (=> b!4535 d!693))

(declare-fun d!695 () Bool)

(assert (=> d!695 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!680 d!695))

(declare-fun d!697 () Bool)

(assert (=> d!697 (= (array_inv!115 _values!1492) (bvsge (size!227 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!680 d!697))

(declare-fun d!699 () Bool)

(assert (=> d!699 (= (array_inv!116 _keys!1806) (bvsge (size!228 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!680 d!699))

(declare-fun d!701 () Bool)

(assert (=> d!701 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!4533 d!701))

(declare-fun d!703 () Bool)

(declare-fun res!5820 () Bool)

(declare-fun e!2455 () Bool)

(assert (=> d!703 (=> res!5820 e!2455)))

(assert (=> d!703 (= res!5820 (= (select (arr!166 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!703 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!2455)))

(declare-fun b!4630 () Bool)

(declare-fun e!2456 () Bool)

(assert (=> b!4630 (= e!2455 e!2456)))

(declare-fun res!5821 () Bool)

(assert (=> b!4630 (=> (not res!5821) (not e!2456))))

(assert (=> b!4630 (= res!5821 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!228 _keys!1806)))))

(declare-fun b!4631 () Bool)

(assert (=> b!4631 (= e!2456 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!703 (not res!5820)) b!4630))

(assert (= (and b!4630 res!5821) b!4631))

(assert (=> d!703 m!2491))

(declare-fun m!2503 () Bool)

(assert (=> b!4631 m!2503))

(assert (=> b!4540 d!703))

(declare-fun d!705 () Bool)

(declare-fun e!2462 () Bool)

(assert (=> d!705 e!2462))

(declare-fun res!5824 () Bool)

(assert (=> d!705 (=> res!5824 e!2462)))

(declare-fun lt!720 () Bool)

(assert (=> d!705 (= res!5824 (not lt!720))))

(declare-fun lt!719 () Bool)

(assert (=> d!705 (= lt!720 lt!719)))

(declare-fun lt!717 () Unit!41)

(declare-fun e!2461 () Unit!41)

(assert (=> d!705 (= lt!717 e!2461)))

(declare-fun c!257 () Bool)

(assert (=> d!705 (= c!257 lt!719)))

(declare-fun containsKey!2 (List!106 (_ BitVec 64)) Bool)

(assert (=> d!705 (= lt!719 (containsKey!2 (toList!67 (getCurrentListMap!26 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!705 (= (contains!38 (getCurrentListMap!26 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!720)))

(declare-fun b!4638 () Bool)

(declare-fun lt!718 () Unit!41)

(assert (=> b!4638 (= e!2461 lt!718)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!2 (List!106 (_ BitVec 64)) Unit!41)

(assert (=> b!4638 (= lt!718 (lemmaContainsKeyImpliesGetValueByKeyDefined!2 (toList!67 (getCurrentListMap!26 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!14 0))(
  ( (Some!13 (v!1202 V!459)) (None!12) )
))
(declare-fun isDefined!3 (Option!14) Bool)

(declare-fun getValueByKey!8 (List!106 (_ BitVec 64)) Option!14)

(assert (=> b!4638 (isDefined!3 (getValueByKey!8 (toList!67 (getCurrentListMap!26 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!4639 () Bool)

(declare-fun Unit!45 () Unit!41)

(assert (=> b!4639 (= e!2461 Unit!45)))

(declare-fun b!4640 () Bool)

(assert (=> b!4640 (= e!2462 (isDefined!3 (getValueByKey!8 (toList!67 (getCurrentListMap!26 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!705 c!257) b!4638))

(assert (= (and d!705 (not c!257)) b!4639))

(assert (= (and d!705 (not res!5824)) b!4640))

(declare-fun m!2505 () Bool)

(assert (=> d!705 m!2505))

(declare-fun m!2507 () Bool)

(assert (=> b!4638 m!2507))

(declare-fun m!2509 () Bool)

(assert (=> b!4638 m!2509))

(assert (=> b!4638 m!2509))

(declare-fun m!2511 () Bool)

(assert (=> b!4638 m!2511))

(assert (=> b!4640 m!2509))

(assert (=> b!4640 m!2509))

(assert (=> b!4640 m!2511))

(assert (=> b!4539 d!705))

(declare-fun e!2493 () Bool)

(declare-fun lt!778 () ListLongMap!103)

(declare-fun b!4683 () Bool)

(declare-fun apply!18 (ListLongMap!103 (_ BitVec 64)) V!459)

(declare-fun get!90 (ValueCell!89 V!459) V!459)

(declare-fun dynLambda!40 (Int (_ BitVec 64)) V!459)

(assert (=> b!4683 (= e!2493 (= (apply!18 lt!778 (select (arr!166 _keys!1806) #b00000000000000000000000000000000)) (get!90 (select (arr!165 _values!1492) #b00000000000000000000000000000000) (dynLambda!40 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!4683 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!227 _values!1492)))))

(assert (=> b!4683 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!228 _keys!1806)))))

(declare-fun b!4684 () Bool)

(declare-fun e!2489 () ListLongMap!103)

(declare-fun call!93 () ListLongMap!103)

(assert (=> b!4684 (= e!2489 call!93)))

(declare-fun d!707 () Bool)

(declare-fun e!2497 () Bool)

(assert (=> d!707 e!2497))

(declare-fun res!5845 () Bool)

(assert (=> d!707 (=> (not res!5845) (not e!2497))))

(assert (=> d!707 (= res!5845 (or (bvsge #b00000000000000000000000000000000 (size!228 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!228 _keys!1806)))))))

(declare-fun lt!767 () ListLongMap!103)

(assert (=> d!707 (= lt!778 lt!767)))

(declare-fun lt!777 () Unit!41)

(declare-fun e!2492 () Unit!41)

(assert (=> d!707 (= lt!777 e!2492)))

(declare-fun c!272 () Bool)

(declare-fun e!2499 () Bool)

(assert (=> d!707 (= c!272 e!2499)))

(declare-fun res!5849 () Bool)

(assert (=> d!707 (=> (not res!5849) (not e!2499))))

(assert (=> d!707 (= res!5849 (bvslt #b00000000000000000000000000000000 (size!228 _keys!1806)))))

(declare-fun e!2494 () ListLongMap!103)

(assert (=> d!707 (= lt!767 e!2494)))

(declare-fun c!275 () Bool)

(assert (=> d!707 (= c!275 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!707 (validMask!0 mask!2250)))

(assert (=> d!707 (= (getCurrentListMap!26 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!778)))

(declare-fun b!4685 () Bool)

(declare-fun Unit!46 () Unit!41)

(assert (=> b!4685 (= e!2492 Unit!46)))

(declare-fun b!4686 () Bool)

(declare-fun res!5843 () Bool)

(assert (=> b!4686 (=> (not res!5843) (not e!2497))))

(declare-fun e!2491 () Bool)

(assert (=> b!4686 (= res!5843 e!2491)))

(declare-fun c!274 () Bool)

(assert (=> b!4686 (= c!274 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!4687 () Bool)

(declare-fun res!5846 () Bool)

(assert (=> b!4687 (=> (not res!5846) (not e!2497))))

(declare-fun e!2501 () Bool)

(assert (=> b!4687 (= res!5846 e!2501)))

(declare-fun res!5844 () Bool)

(assert (=> b!4687 (=> res!5844 e!2501)))

(declare-fun e!2490 () Bool)

(assert (=> b!4687 (= res!5844 (not e!2490))))

(declare-fun res!5851 () Bool)

(assert (=> b!4687 (=> (not res!5851) (not e!2490))))

(assert (=> b!4687 (= res!5851 (bvslt #b00000000000000000000000000000000 (size!228 _keys!1806)))))

(declare-fun b!4688 () Bool)

(declare-fun e!2498 () Bool)

(assert (=> b!4688 (= e!2498 (= (apply!18 lt!778 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun bm!89 () Bool)

(declare-fun call!95 () Bool)

(assert (=> bm!89 (= call!95 (contains!38 lt!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!90 () Bool)

(declare-fun call!94 () ListLongMap!103)

(declare-fun call!97 () ListLongMap!103)

(assert (=> bm!90 (= call!94 call!97)))

(declare-fun b!4689 () Bool)

(declare-fun e!2496 () ListLongMap!103)

(assert (=> b!4689 (= e!2494 e!2496)))

(declare-fun c!271 () Bool)

(assert (=> b!4689 (= c!271 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!91 () Bool)

(declare-fun call!98 () ListLongMap!103)

(assert (=> bm!91 (= call!93 call!98)))

(declare-fun bm!92 () Bool)

(declare-fun call!96 () Bool)

(assert (=> bm!92 (= call!96 (contains!38 lt!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!4690 () Bool)

(declare-fun lt!776 () Unit!41)

(assert (=> b!4690 (= e!2492 lt!776)))

(declare-fun lt!782 () ListLongMap!103)

(declare-fun getCurrentListMapNoExtraKeys!2 (array!349 array!347 (_ BitVec 32) (_ BitVec 32) V!459 V!459 (_ BitVec 32) Int) ListLongMap!103)

(assert (=> b!4690 (= lt!782 (getCurrentListMapNoExtraKeys!2 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!786 () (_ BitVec 64))

(assert (=> b!4690 (= lt!786 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!766 () (_ BitVec 64))

(assert (=> b!4690 (= lt!766 (select (arr!166 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!783 () Unit!41)

(declare-fun addStillContains!3 (ListLongMap!103 (_ BitVec 64) V!459 (_ BitVec 64)) Unit!41)

(assert (=> b!4690 (= lt!783 (addStillContains!3 lt!782 lt!786 zeroValue!1434 lt!766))))

(declare-fun +!5 (ListLongMap!103 tuple2!98) ListLongMap!103)

(assert (=> b!4690 (contains!38 (+!5 lt!782 (tuple2!99 lt!786 zeroValue!1434)) lt!766)))

(declare-fun lt!765 () Unit!41)

(assert (=> b!4690 (= lt!765 lt!783)))

(declare-fun lt!773 () ListLongMap!103)

(assert (=> b!4690 (= lt!773 (getCurrentListMapNoExtraKeys!2 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!772 () (_ BitVec 64))

(assert (=> b!4690 (= lt!772 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!779 () (_ BitVec 64))

(assert (=> b!4690 (= lt!779 (select (arr!166 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!784 () Unit!41)

(declare-fun addApplyDifferent!3 (ListLongMap!103 (_ BitVec 64) V!459 (_ BitVec 64)) Unit!41)

(assert (=> b!4690 (= lt!784 (addApplyDifferent!3 lt!773 lt!772 minValue!1434 lt!779))))

(assert (=> b!4690 (= (apply!18 (+!5 lt!773 (tuple2!99 lt!772 minValue!1434)) lt!779) (apply!18 lt!773 lt!779))))

(declare-fun lt!769 () Unit!41)

(assert (=> b!4690 (= lt!769 lt!784)))

(declare-fun lt!781 () ListLongMap!103)

(assert (=> b!4690 (= lt!781 (getCurrentListMapNoExtraKeys!2 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!785 () (_ BitVec 64))

(assert (=> b!4690 (= lt!785 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!774 () (_ BitVec 64))

(assert (=> b!4690 (= lt!774 (select (arr!166 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!768 () Unit!41)

(assert (=> b!4690 (= lt!768 (addApplyDifferent!3 lt!781 lt!785 zeroValue!1434 lt!774))))

(assert (=> b!4690 (= (apply!18 (+!5 lt!781 (tuple2!99 lt!785 zeroValue!1434)) lt!774) (apply!18 lt!781 lt!774))))

(declare-fun lt!780 () Unit!41)

(assert (=> b!4690 (= lt!780 lt!768)))

(declare-fun lt!770 () ListLongMap!103)

(assert (=> b!4690 (= lt!770 (getCurrentListMapNoExtraKeys!2 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!775 () (_ BitVec 64))

(assert (=> b!4690 (= lt!775 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!771 () (_ BitVec 64))

(assert (=> b!4690 (= lt!771 (select (arr!166 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!4690 (= lt!776 (addApplyDifferent!3 lt!770 lt!775 minValue!1434 lt!771))))

(assert (=> b!4690 (= (apply!18 (+!5 lt!770 (tuple2!99 lt!775 minValue!1434)) lt!771) (apply!18 lt!770 lt!771))))

(declare-fun b!4691 () Bool)

(assert (=> b!4691 (= e!2490 (validKeyInArray!0 (select (arr!166 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4692 () Bool)

(declare-fun c!273 () Bool)

(assert (=> b!4692 (= c!273 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!4692 (= e!2496 e!2489)))

(declare-fun b!4693 () Bool)

(assert (=> b!4693 (= e!2496 call!94)))

(declare-fun b!4694 () Bool)

(declare-fun e!2495 () Bool)

(declare-fun e!2500 () Bool)

(assert (=> b!4694 (= e!2495 e!2500)))

(declare-fun res!5847 () Bool)

(assert (=> b!4694 (= res!5847 call!95)))

(assert (=> b!4694 (=> (not res!5847) (not e!2500))))

(declare-fun b!4695 () Bool)

(assert (=> b!4695 (= e!2489 call!94)))

(declare-fun bm!93 () Bool)

(declare-fun call!92 () ListLongMap!103)

(assert (=> bm!93 (= call!98 call!92)))

(declare-fun b!4696 () Bool)

(assert (=> b!4696 (= e!2497 e!2495)))

(declare-fun c!270 () Bool)

(assert (=> b!4696 (= c!270 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!4697 () Bool)

(assert (=> b!4697 (= e!2491 (not call!96))))

(declare-fun b!4698 () Bool)

(assert (=> b!4698 (= e!2501 e!2493)))

(declare-fun res!5850 () Bool)

(assert (=> b!4698 (=> (not res!5850) (not e!2493))))

(assert (=> b!4698 (= res!5850 (contains!38 lt!778 (select (arr!166 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!4698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!228 _keys!1806)))))

(declare-fun bm!94 () Bool)

(assert (=> bm!94 (= call!92 (getCurrentListMapNoExtraKeys!2 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!4699 () Bool)

(assert (=> b!4699 (= e!2499 (validKeyInArray!0 (select (arr!166 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4700 () Bool)

(assert (=> b!4700 (= e!2494 (+!5 call!97 (tuple2!99 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!4701 () Bool)

(assert (=> b!4701 (= e!2495 (not call!95))))

(declare-fun b!4702 () Bool)

(assert (=> b!4702 (= e!2491 e!2498)))

(declare-fun res!5848 () Bool)

(assert (=> b!4702 (= res!5848 call!96)))

(assert (=> b!4702 (=> (not res!5848) (not e!2498))))

(declare-fun b!4703 () Bool)

(assert (=> b!4703 (= e!2500 (= (apply!18 lt!778 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun bm!95 () Bool)

(assert (=> bm!95 (= call!97 (+!5 (ite c!275 call!92 (ite c!271 call!98 call!93)) (ite (or c!275 c!271) (tuple2!99 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!99 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(assert (= (and d!707 c!275) b!4700))

(assert (= (and d!707 (not c!275)) b!4689))

(assert (= (and b!4689 c!271) b!4693))

(assert (= (and b!4689 (not c!271)) b!4692))

(assert (= (and b!4692 c!273) b!4695))

(assert (= (and b!4692 (not c!273)) b!4684))

(assert (= (or b!4695 b!4684) bm!91))

(assert (= (or b!4693 bm!91) bm!93))

(assert (= (or b!4693 b!4695) bm!90))

(assert (= (or b!4700 bm!93) bm!94))

(assert (= (or b!4700 bm!90) bm!95))

(assert (= (and d!707 res!5849) b!4699))

(assert (= (and d!707 c!272) b!4690))

(assert (= (and d!707 (not c!272)) b!4685))

(assert (= (and d!707 res!5845) b!4687))

(assert (= (and b!4687 res!5851) b!4691))

(assert (= (and b!4687 (not res!5844)) b!4698))

(assert (= (and b!4698 res!5850) b!4683))

(assert (= (and b!4687 res!5846) b!4686))

(assert (= (and b!4686 c!274) b!4702))

(assert (= (and b!4686 (not c!274)) b!4697))

(assert (= (and b!4702 res!5848) b!4688))

(assert (= (or b!4702 b!4697) bm!92))

(assert (= (and b!4686 res!5843) b!4696))

(assert (= (and b!4696 c!270) b!4694))

(assert (= (and b!4696 (not c!270)) b!4701))

(assert (= (and b!4694 res!5847) b!4703))

(assert (= (or b!4694 b!4701) bm!89))

(declare-fun b_lambda!323 () Bool)

(assert (=> (not b_lambda!323) (not b!4683)))

(declare-fun t!2239 () Bool)

(declare-fun tb!129 () Bool)

(assert (=> (and start!680 (= defaultEntry!1495 defaultEntry!1495) t!2239) tb!129))

(declare-fun result!189 () Bool)

(assert (=> tb!129 (= result!189 tp_is_empty!211)))

(assert (=> b!4683 t!2239))

(declare-fun b_and!279 () Bool)

(assert (= b_and!273 (and (=> t!2239 result!189) b_and!279)))

(declare-fun m!2513 () Bool)

(assert (=> b!4690 m!2513))

(declare-fun m!2515 () Bool)

(assert (=> b!4690 m!2515))

(declare-fun m!2517 () Bool)

(assert (=> b!4690 m!2517))

(declare-fun m!2519 () Bool)

(assert (=> b!4690 m!2519))

(declare-fun m!2521 () Bool)

(assert (=> b!4690 m!2521))

(declare-fun m!2523 () Bool)

(assert (=> b!4690 m!2523))

(declare-fun m!2525 () Bool)

(assert (=> b!4690 m!2525))

(declare-fun m!2527 () Bool)

(assert (=> b!4690 m!2527))

(assert (=> b!4690 m!2513))

(declare-fun m!2529 () Bool)

(assert (=> b!4690 m!2529))

(declare-fun m!2531 () Bool)

(assert (=> b!4690 m!2531))

(declare-fun m!2533 () Bool)

(assert (=> b!4690 m!2533))

(assert (=> b!4690 m!2523))

(declare-fun m!2535 () Bool)

(assert (=> b!4690 m!2535))

(declare-fun m!2537 () Bool)

(assert (=> b!4690 m!2537))

(declare-fun m!2539 () Bool)

(assert (=> b!4690 m!2539))

(declare-fun m!2541 () Bool)

(assert (=> b!4690 m!2541))

(assert (=> b!4690 m!2519))

(declare-fun m!2543 () Bool)

(assert (=> b!4690 m!2543))

(assert (=> b!4690 m!2539))

(assert (=> b!4690 m!2491))

(declare-fun m!2545 () Bool)

(assert (=> b!4688 m!2545))

(assert (=> d!707 m!2437))

(declare-fun m!2547 () Bool)

(assert (=> bm!95 m!2547))

(declare-fun m!2549 () Bool)

(assert (=> bm!92 m!2549))

(assert (=> b!4691 m!2491))

(assert (=> b!4691 m!2491))

(assert (=> b!4691 m!2501))

(declare-fun m!2551 () Bool)

(assert (=> bm!89 m!2551))

(assert (=> b!4698 m!2491))

(assert (=> b!4698 m!2491))

(declare-fun m!2553 () Bool)

(assert (=> b!4698 m!2553))

(assert (=> b!4699 m!2491))

(assert (=> b!4699 m!2491))

(assert (=> b!4699 m!2501))

(declare-fun m!2555 () Bool)

(assert (=> b!4700 m!2555))

(declare-fun m!2557 () Bool)

(assert (=> b!4683 m!2557))

(assert (=> b!4683 m!2491))

(declare-fun m!2559 () Bool)

(assert (=> b!4683 m!2559))

(assert (=> b!4683 m!2491))

(declare-fun m!2561 () Bool)

(assert (=> b!4683 m!2561))

(assert (=> b!4683 m!2557))

(assert (=> b!4683 m!2561))

(declare-fun m!2563 () Bool)

(assert (=> b!4683 m!2563))

(declare-fun m!2565 () Bool)

(assert (=> b!4703 m!2565))

(assert (=> bm!94 m!2537))

(assert (=> b!4539 d!707))

(declare-fun b!4716 () Bool)

(declare-fun e!2513 () Bool)

(declare-fun call!101 () Bool)

(assert (=> b!4716 (= e!2513 call!101)))

(declare-fun b!4717 () Bool)

(declare-fun e!2511 () Bool)

(declare-fun contains!40 (List!105 (_ BitVec 64)) Bool)

(assert (=> b!4717 (= e!2511 (contains!40 Nil!102 (select (arr!166 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!709 () Bool)

(declare-fun res!5858 () Bool)

(declare-fun e!2510 () Bool)

(assert (=> d!709 (=> res!5858 e!2510)))

(assert (=> d!709 (= res!5858 (bvsge #b00000000000000000000000000000000 (size!228 _keys!1806)))))

(assert (=> d!709 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!102) e!2510)))

(declare-fun b!4718 () Bool)

(assert (=> b!4718 (= e!2513 call!101)))

(declare-fun bm!98 () Bool)

(declare-fun c!278 () Bool)

(assert (=> bm!98 (= call!101 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!278 (Cons!101 (select (arr!166 _keys!1806) #b00000000000000000000000000000000) Nil!102) Nil!102)))))

(declare-fun b!4719 () Bool)

(declare-fun e!2512 () Bool)

(assert (=> b!4719 (= e!2510 e!2512)))

(declare-fun res!5859 () Bool)

(assert (=> b!4719 (=> (not res!5859) (not e!2512))))

(assert (=> b!4719 (= res!5859 (not e!2511))))

(declare-fun res!5860 () Bool)

(assert (=> b!4719 (=> (not res!5860) (not e!2511))))

(assert (=> b!4719 (= res!5860 (validKeyInArray!0 (select (arr!166 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4720 () Bool)

(assert (=> b!4720 (= e!2512 e!2513)))

(assert (=> b!4720 (= c!278 (validKeyInArray!0 (select (arr!166 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!709 (not res!5858)) b!4719))

(assert (= (and b!4719 res!5860) b!4717))

(assert (= (and b!4719 res!5859) b!4720))

(assert (= (and b!4720 c!278) b!4716))

(assert (= (and b!4720 (not c!278)) b!4718))

(assert (= (or b!4716 b!4718) bm!98))

(assert (=> b!4717 m!2491))

(assert (=> b!4717 m!2491))

(declare-fun m!2567 () Bool)

(assert (=> b!4717 m!2567))

(assert (=> bm!98 m!2491))

(declare-fun m!2569 () Bool)

(assert (=> bm!98 m!2569))

(assert (=> b!4719 m!2491))

(assert (=> b!4719 m!2491))

(assert (=> b!4719 m!2501))

(assert (=> b!4720 m!2491))

(assert (=> b!4720 m!2491))

(assert (=> b!4720 m!2501))

(assert (=> b!4534 d!709))

(declare-fun mapNonEmpty!287 () Bool)

(declare-fun mapRes!287 () Bool)

(declare-fun tp!635 () Bool)

(declare-fun e!2518 () Bool)

(assert (=> mapNonEmpty!287 (= mapRes!287 (and tp!635 e!2518))))

(declare-fun mapRest!287 () (Array (_ BitVec 32) ValueCell!89))

(declare-fun mapKey!287 () (_ BitVec 32))

(declare-fun mapValue!287 () ValueCell!89)

(assert (=> mapNonEmpty!287 (= mapRest!278 (store mapRest!287 mapKey!287 mapValue!287))))

(declare-fun b!4727 () Bool)

(assert (=> b!4727 (= e!2518 tp_is_empty!211)))

(declare-fun mapIsEmpty!287 () Bool)

(assert (=> mapIsEmpty!287 mapRes!287))

(declare-fun condMapEmpty!287 () Bool)

(declare-fun mapDefault!287 () ValueCell!89)

(assert (=> mapNonEmpty!278 (= condMapEmpty!287 (= mapRest!278 ((as const (Array (_ BitVec 32) ValueCell!89)) mapDefault!287)))))

(declare-fun e!2519 () Bool)

(assert (=> mapNonEmpty!278 (= tp!620 (and e!2519 mapRes!287))))

(declare-fun b!4728 () Bool)

(assert (=> b!4728 (= e!2519 tp_is_empty!211)))

(assert (= (and mapNonEmpty!278 condMapEmpty!287) mapIsEmpty!287))

(assert (= (and mapNonEmpty!278 (not condMapEmpty!287)) mapNonEmpty!287))

(assert (= (and mapNonEmpty!287 ((_ is ValueCellFull!89) mapValue!287)) b!4727))

(assert (= (and mapNonEmpty!278 ((_ is ValueCellFull!89) mapDefault!287)) b!4728))

(declare-fun m!2571 () Bool)

(assert (=> mapNonEmpty!287 m!2571))

(declare-fun b_lambda!325 () Bool)

(assert (= b_lambda!323 (or (and start!680 b_free!133) b_lambda!325)))

(check-sat (not bm!95) (not bm!89) (not d!707) tp_is_empty!211 (not b!4688) (not b!4638) b_and!279 (not b!4719) (not bm!98) (not b!4698) (not b!4717) (not b!4700) (not d!705) (not b!4720) (not b!4612) (not bm!92) (not b!4640) (not b!4631) (not b!4623) (not b!4625) (not bm!74) (not b!4691) (not b!4703) (not b_next!133) (not d!691) (not b!4690) (not b!4683) (not bm!94) (not b_lambda!325) (not b!4699) (not mapNonEmpty!287))
(check-sat b_and!279 (not b_next!133))
