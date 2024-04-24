; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33520 () Bool)

(assert start!33520)

(declare-fun b_free!6823 () Bool)

(declare-fun b_next!6823 () Bool)

(assert (=> start!33520 (= b_free!6823 (not b_next!6823))))

(declare-fun tp!23964 () Bool)

(declare-fun b_and!14011 () Bool)

(assert (=> start!33520 (= tp!23964 b_and!14011)))

(declare-fun b!332772 () Bool)

(declare-fun e!204342 () Bool)

(declare-fun tp_is_empty!6775 () Bool)

(assert (=> b!332772 (= e!204342 tp_is_empty!6775)))

(declare-fun b!332773 () Bool)

(declare-fun e!204340 () Bool)

(declare-fun e!204343 () Bool)

(declare-fun mapRes!11550 () Bool)

(assert (=> b!332773 (= e!204340 (and e!204343 mapRes!11550))))

(declare-fun condMapEmpty!11550 () Bool)

(declare-datatypes ((V!10011 0))(
  ( (V!10012 (val!3432 Int)) )
))
(declare-datatypes ((ValueCell!3044 0))(
  ( (ValueCellFull!3044 (v!5592 V!10011)) (EmptyCell!3044) )
))
(declare-datatypes ((array!17142 0))(
  ( (array!17143 (arr!8104 (Array (_ BitVec 32) ValueCell!3044)) (size!8456 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17142)

(declare-fun mapDefault!11550 () ValueCell!3044)

(assert (=> b!332773 (= condMapEmpty!11550 (= (arr!8104 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3044)) mapDefault!11550)))))

(declare-fun mapNonEmpty!11550 () Bool)

(declare-fun tp!23963 () Bool)

(assert (=> mapNonEmpty!11550 (= mapRes!11550 (and tp!23963 e!204342))))

(declare-fun mapValue!11550 () ValueCell!3044)

(declare-fun mapKey!11550 () (_ BitVec 32))

(declare-fun mapRest!11550 () (Array (_ BitVec 32) ValueCell!3044))

(assert (=> mapNonEmpty!11550 (= (arr!8104 _values!1525) (store mapRest!11550 mapKey!11550 mapValue!11550))))

(declare-datatypes ((SeekEntryResult!3097 0))(
  ( (MissingZero!3097 (index!14567 (_ BitVec 32))) (Found!3097 (index!14568 (_ BitVec 32))) (Intermediate!3097 (undefined!3909 Bool) (index!14569 (_ BitVec 32)) (x!33118 (_ BitVec 32))) (Undefined!3097) (MissingVacant!3097 (index!14570 (_ BitVec 32))) )
))
(declare-fun lt!159067 () SeekEntryResult!3097)

(declare-datatypes ((array!17144 0))(
  ( (array!17145 (arr!8105 (Array (_ BitVec 32) (_ BitVec 64))) (size!8457 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17144)

(declare-fun e!204344 () Bool)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun b!332774 () Bool)

(get-info :version)

(assert (=> b!332774 (= e!204344 (and ((_ is Found!3097) lt!159067) (= (select (arr!8105 _keys!1895) (index!14568 lt!159067)) k0!1348) (bvslt (index!14568 lt!159067) #b00000000000000000000000000000000)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17144 (_ BitVec 32)) SeekEntryResult!3097)

(assert (=> b!332774 (= lt!159067 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!332775 () Bool)

(declare-fun res!183377 () Bool)

(assert (=> b!332775 (=> (not res!183377) (not e!204344))))

(declare-datatypes ((List!4524 0))(
  ( (Nil!4521) (Cons!4520 (h!5376 (_ BitVec 64)) (t!9598 List!4524)) )
))
(declare-fun arrayNoDuplicates!0 (array!17144 (_ BitVec 32) List!4524) Bool)

(assert (=> b!332775 (= res!183377 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4521))))

(declare-fun b!332776 () Bool)

(declare-fun res!183376 () Bool)

(assert (=> b!332776 (=> (not res!183376) (not e!204344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332776 (= res!183376 (validKeyInArray!0 k0!1348))))

(declare-fun b!332777 () Bool)

(declare-fun res!183374 () Bool)

(assert (=> b!332777 (=> (not res!183374) (not e!204344))))

(declare-fun zeroValue!1467 () V!10011)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10011)

(declare-datatypes ((tuple2!4908 0))(
  ( (tuple2!4909 (_1!2465 (_ BitVec 64)) (_2!2465 V!10011)) )
))
(declare-datatypes ((List!4525 0))(
  ( (Nil!4522) (Cons!4521 (h!5377 tuple2!4908) (t!9599 List!4525)) )
))
(declare-datatypes ((ListLongMap!3823 0))(
  ( (ListLongMap!3824 (toList!1927 List!4525)) )
))
(declare-fun contains!1987 (ListLongMap!3823 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1459 (array!17144 array!17142 (_ BitVec 32) (_ BitVec 32) V!10011 V!10011 (_ BitVec 32) Int) ListLongMap!3823)

(assert (=> b!332777 (= res!183374 (not (contains!1987 (getCurrentListMap!1459 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!332778 () Bool)

(assert (=> b!332778 (= e!204343 tp_is_empty!6775)))

(declare-fun res!183375 () Bool)

(assert (=> start!33520 (=> (not res!183375) (not e!204344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33520 (= res!183375 (validMask!0 mask!2385))))

(assert (=> start!33520 e!204344))

(assert (=> start!33520 true))

(assert (=> start!33520 tp_is_empty!6775))

(assert (=> start!33520 tp!23964))

(declare-fun array_inv!6030 (array!17142) Bool)

(assert (=> start!33520 (and (array_inv!6030 _values!1525) e!204340)))

(declare-fun array_inv!6031 (array!17144) Bool)

(assert (=> start!33520 (array_inv!6031 _keys!1895)))

(declare-fun mapIsEmpty!11550 () Bool)

(assert (=> mapIsEmpty!11550 mapRes!11550))

(declare-fun b!332779 () Bool)

(declare-fun res!183372 () Bool)

(assert (=> b!332779 (=> (not res!183372) (not e!204344))))

(assert (=> b!332779 (= res!183372 (and (= (size!8456 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8457 _keys!1895) (size!8456 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332780 () Bool)

(declare-fun res!183373 () Bool)

(assert (=> b!332780 (=> (not res!183373) (not e!204344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17144 (_ BitVec 32)) Bool)

(assert (=> b!332780 (= res!183373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33520 res!183375) b!332779))

(assert (= (and b!332779 res!183372) b!332780))

(assert (= (and b!332780 res!183373) b!332775))

(assert (= (and b!332775 res!183377) b!332776))

(assert (= (and b!332776 res!183376) b!332777))

(assert (= (and b!332777 res!183374) b!332774))

(assert (= (and b!332773 condMapEmpty!11550) mapIsEmpty!11550))

(assert (= (and b!332773 (not condMapEmpty!11550)) mapNonEmpty!11550))

(assert (= (and mapNonEmpty!11550 ((_ is ValueCellFull!3044) mapValue!11550)) b!332772))

(assert (= (and b!332773 ((_ is ValueCellFull!3044) mapDefault!11550)) b!332778))

(assert (= start!33520 b!332773))

(declare-fun m!337445 () Bool)

(assert (=> mapNonEmpty!11550 m!337445))

(declare-fun m!337447 () Bool)

(assert (=> b!332777 m!337447))

(assert (=> b!332777 m!337447))

(declare-fun m!337449 () Bool)

(assert (=> b!332777 m!337449))

(declare-fun m!337451 () Bool)

(assert (=> b!332774 m!337451))

(declare-fun m!337453 () Bool)

(assert (=> b!332774 m!337453))

(declare-fun m!337455 () Bool)

(assert (=> start!33520 m!337455))

(declare-fun m!337457 () Bool)

(assert (=> start!33520 m!337457))

(declare-fun m!337459 () Bool)

(assert (=> start!33520 m!337459))

(declare-fun m!337461 () Bool)

(assert (=> b!332776 m!337461))

(declare-fun m!337463 () Bool)

(assert (=> b!332775 m!337463))

(declare-fun m!337465 () Bool)

(assert (=> b!332780 m!337465))

(check-sat (not b!332775) (not b!332777) (not mapNonEmpty!11550) (not b!332780) (not b!332774) (not b_next!6823) (not b!332776) (not start!33520) b_and!14011 tp_is_empty!6775)
(check-sat b_and!14011 (not b_next!6823))
(get-model)

(declare-fun b!332845 () Bool)

(declare-fun e!204386 () Bool)

(declare-fun call!26204 () Bool)

(assert (=> b!332845 (= e!204386 call!26204)))

(declare-fun d!70571 () Bool)

(declare-fun res!183420 () Bool)

(declare-fun e!204385 () Bool)

(assert (=> d!70571 (=> res!183420 e!204385)))

(assert (=> d!70571 (= res!183420 (bvsge #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(assert (=> d!70571 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4521) e!204385)))

(declare-fun b!332846 () Bool)

(declare-fun e!204383 () Bool)

(assert (=> b!332846 (= e!204383 e!204386)))

(declare-fun c!52064 () Bool)

(assert (=> b!332846 (= c!52064 (validKeyInArray!0 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26201 () Bool)

(assert (=> bm!26201 (= call!26204 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52064 (Cons!4520 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000) Nil!4521) Nil!4521)))))

(declare-fun b!332847 () Bool)

(assert (=> b!332847 (= e!204386 call!26204)))

(declare-fun b!332848 () Bool)

(declare-fun e!204384 () Bool)

(declare-fun contains!1990 (List!4524 (_ BitVec 64)) Bool)

(assert (=> b!332848 (= e!204384 (contains!1990 Nil!4521 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332849 () Bool)

(assert (=> b!332849 (= e!204385 e!204383)))

(declare-fun res!183422 () Bool)

(assert (=> b!332849 (=> (not res!183422) (not e!204383))))

(assert (=> b!332849 (= res!183422 (not e!204384))))

(declare-fun res!183421 () Bool)

(assert (=> b!332849 (=> (not res!183421) (not e!204384))))

(assert (=> b!332849 (= res!183421 (validKeyInArray!0 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70571 (not res!183420)) b!332849))

(assert (= (and b!332849 res!183421) b!332848))

(assert (= (and b!332849 res!183422) b!332846))

(assert (= (and b!332846 c!52064) b!332845))

(assert (= (and b!332846 (not c!52064)) b!332847))

(assert (= (or b!332845 b!332847) bm!26201))

(declare-fun m!337511 () Bool)

(assert (=> b!332846 m!337511))

(assert (=> b!332846 m!337511))

(declare-fun m!337513 () Bool)

(assert (=> b!332846 m!337513))

(assert (=> bm!26201 m!337511))

(declare-fun m!337515 () Bool)

(assert (=> bm!26201 m!337515))

(assert (=> b!332848 m!337511))

(assert (=> b!332848 m!337511))

(declare-fun m!337517 () Bool)

(assert (=> b!332848 m!337517))

(assert (=> b!332849 m!337511))

(assert (=> b!332849 m!337511))

(assert (=> b!332849 m!337513))

(assert (=> b!332775 d!70571))

(declare-fun d!70573 () Bool)

(assert (=> d!70573 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33520 d!70573))

(declare-fun d!70575 () Bool)

(assert (=> d!70575 (= (array_inv!6030 _values!1525) (bvsge (size!8456 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33520 d!70575))

(declare-fun d!70577 () Bool)

(assert (=> d!70577 (= (array_inv!6031 _keys!1895) (bvsge (size!8457 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33520 d!70577))

(declare-fun d!70579 () Bool)

(declare-fun res!183427 () Bool)

(declare-fun e!204394 () Bool)

(assert (=> d!70579 (=> res!183427 e!204394)))

(assert (=> d!70579 (= res!183427 (bvsge #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(assert (=> d!70579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!204394)))

(declare-fun b!332858 () Bool)

(declare-fun e!204393 () Bool)

(declare-fun call!26207 () Bool)

(assert (=> b!332858 (= e!204393 call!26207)))

(declare-fun bm!26204 () Bool)

(assert (=> bm!26204 (= call!26207 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!332859 () Bool)

(declare-fun e!204395 () Bool)

(assert (=> b!332859 (= e!204393 e!204395)))

(declare-fun lt!159080 () (_ BitVec 64))

(assert (=> b!332859 (= lt!159080 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10337 0))(
  ( (Unit!10338) )
))
(declare-fun lt!159082 () Unit!10337)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17144 (_ BitVec 64) (_ BitVec 32)) Unit!10337)

(assert (=> b!332859 (= lt!159082 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159080 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!332859 (arrayContainsKey!0 _keys!1895 lt!159080 #b00000000000000000000000000000000)))

(declare-fun lt!159081 () Unit!10337)

(assert (=> b!332859 (= lt!159081 lt!159082)))

(declare-fun res!183428 () Bool)

(assert (=> b!332859 (= res!183428 (= (seekEntryOrOpen!0 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3097 #b00000000000000000000000000000000)))))

(assert (=> b!332859 (=> (not res!183428) (not e!204395))))

(declare-fun b!332860 () Bool)

(assert (=> b!332860 (= e!204395 call!26207)))

(declare-fun b!332861 () Bool)

(assert (=> b!332861 (= e!204394 e!204393)))

(declare-fun c!52067 () Bool)

(assert (=> b!332861 (= c!52067 (validKeyInArray!0 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70579 (not res!183427)) b!332861))

(assert (= (and b!332861 c!52067) b!332859))

(assert (= (and b!332861 (not c!52067)) b!332858))

(assert (= (and b!332859 res!183428) b!332860))

(assert (= (or b!332860 b!332858) bm!26204))

(declare-fun m!337519 () Bool)

(assert (=> bm!26204 m!337519))

(assert (=> b!332859 m!337511))

(declare-fun m!337521 () Bool)

(assert (=> b!332859 m!337521))

(declare-fun m!337523 () Bool)

(assert (=> b!332859 m!337523))

(assert (=> b!332859 m!337511))

(declare-fun m!337525 () Bool)

(assert (=> b!332859 m!337525))

(assert (=> b!332861 m!337511))

(assert (=> b!332861 m!337511))

(assert (=> b!332861 m!337513))

(assert (=> b!332780 d!70579))

(declare-fun d!70581 () Bool)

(assert (=> d!70581 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332776 d!70581))

(declare-fun d!70583 () Bool)

(declare-fun e!204400 () Bool)

(assert (=> d!70583 e!204400))

(declare-fun res!183431 () Bool)

(assert (=> d!70583 (=> res!183431 e!204400)))

(declare-fun lt!159093 () Bool)

(assert (=> d!70583 (= res!183431 (not lt!159093))))

(declare-fun lt!159091 () Bool)

(assert (=> d!70583 (= lt!159093 lt!159091)))

(declare-fun lt!159094 () Unit!10337)

(declare-fun e!204401 () Unit!10337)

(assert (=> d!70583 (= lt!159094 e!204401)))

(declare-fun c!52070 () Bool)

(assert (=> d!70583 (= c!52070 lt!159091)))

(declare-fun containsKey!313 (List!4525 (_ BitVec 64)) Bool)

(assert (=> d!70583 (= lt!159091 (containsKey!313 (toList!1927 (getCurrentListMap!1459 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70583 (= (contains!1987 (getCurrentListMap!1459 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159093)))

(declare-fun b!332868 () Bool)

(declare-fun lt!159092 () Unit!10337)

(assert (=> b!332868 (= e!204401 lt!159092)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!261 (List!4525 (_ BitVec 64)) Unit!10337)

(assert (=> b!332868 (= lt!159092 (lemmaContainsKeyImpliesGetValueByKeyDefined!261 (toList!1927 (getCurrentListMap!1459 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!328 0))(
  ( (Some!327 (v!5595 V!10011)) (None!326) )
))
(declare-fun isDefined!262 (Option!328) Bool)

(declare-fun getValueByKey!322 (List!4525 (_ BitVec 64)) Option!328)

(assert (=> b!332868 (isDefined!262 (getValueByKey!322 (toList!1927 (getCurrentListMap!1459 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!332869 () Bool)

(declare-fun Unit!10339 () Unit!10337)

(assert (=> b!332869 (= e!204401 Unit!10339)))

(declare-fun b!332870 () Bool)

(assert (=> b!332870 (= e!204400 (isDefined!262 (getValueByKey!322 (toList!1927 (getCurrentListMap!1459 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70583 c!52070) b!332868))

(assert (= (and d!70583 (not c!52070)) b!332869))

(assert (= (and d!70583 (not res!183431)) b!332870))

(declare-fun m!337527 () Bool)

(assert (=> d!70583 m!337527))

(declare-fun m!337529 () Bool)

(assert (=> b!332868 m!337529))

(declare-fun m!337531 () Bool)

(assert (=> b!332868 m!337531))

(assert (=> b!332868 m!337531))

(declare-fun m!337533 () Bool)

(assert (=> b!332868 m!337533))

(assert (=> b!332870 m!337531))

(assert (=> b!332870 m!337531))

(assert (=> b!332870 m!337533))

(assert (=> b!332777 d!70583))

(declare-fun b!332913 () Bool)

(declare-fun e!204434 () Bool)

(declare-fun e!204439 () Bool)

(assert (=> b!332913 (= e!204434 e!204439)))

(declare-fun res!183457 () Bool)

(assert (=> b!332913 (=> (not res!183457) (not e!204439))))

(declare-fun lt!159143 () ListLongMap!3823)

(assert (=> b!332913 (= res!183457 (contains!1987 lt!159143 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!332913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(declare-fun b!332914 () Bool)

(declare-fun e!204437 () Bool)

(assert (=> b!332914 (= e!204437 (validKeyInArray!0 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332915 () Bool)

(declare-fun e!204428 () Bool)

(declare-fun call!26227 () Bool)

(assert (=> b!332915 (= e!204428 (not call!26227))))

(declare-fun b!332916 () Bool)

(declare-fun e!204429 () Bool)

(assert (=> b!332916 (= e!204429 (validKeyInArray!0 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332917 () Bool)

(declare-fun e!204435 () Unit!10337)

(declare-fun lt!159145 () Unit!10337)

(assert (=> b!332917 (= e!204435 lt!159145)))

(declare-fun lt!159150 () ListLongMap!3823)

(declare-fun getCurrentListMapNoExtraKeys!579 (array!17144 array!17142 (_ BitVec 32) (_ BitVec 32) V!10011 V!10011 (_ BitVec 32) Int) ListLongMap!3823)

(assert (=> b!332917 (= lt!159150 (getCurrentListMapNoExtraKeys!579 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159153 () (_ BitVec 64))

(assert (=> b!332917 (= lt!159153 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159159 () (_ BitVec 64))

(assert (=> b!332917 (= lt!159159 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159158 () Unit!10337)

(declare-fun addStillContains!239 (ListLongMap!3823 (_ BitVec 64) V!10011 (_ BitVec 64)) Unit!10337)

(assert (=> b!332917 (= lt!159158 (addStillContains!239 lt!159150 lt!159153 zeroValue!1467 lt!159159))))

(declare-fun +!714 (ListLongMap!3823 tuple2!4908) ListLongMap!3823)

(assert (=> b!332917 (contains!1987 (+!714 lt!159150 (tuple2!4909 lt!159153 zeroValue!1467)) lt!159159)))

(declare-fun lt!159144 () Unit!10337)

(assert (=> b!332917 (= lt!159144 lt!159158)))

(declare-fun lt!159156 () ListLongMap!3823)

(assert (=> b!332917 (= lt!159156 (getCurrentListMapNoExtraKeys!579 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159148 () (_ BitVec 64))

(assert (=> b!332917 (= lt!159148 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159142 () (_ BitVec 64))

(assert (=> b!332917 (= lt!159142 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159155 () Unit!10337)

(declare-fun addApplyDifferent!239 (ListLongMap!3823 (_ BitVec 64) V!10011 (_ BitVec 64)) Unit!10337)

(assert (=> b!332917 (= lt!159155 (addApplyDifferent!239 lt!159156 lt!159148 minValue!1467 lt!159142))))

(declare-fun apply!263 (ListLongMap!3823 (_ BitVec 64)) V!10011)

(assert (=> b!332917 (= (apply!263 (+!714 lt!159156 (tuple2!4909 lt!159148 minValue!1467)) lt!159142) (apply!263 lt!159156 lt!159142))))

(declare-fun lt!159160 () Unit!10337)

(assert (=> b!332917 (= lt!159160 lt!159155)))

(declare-fun lt!159147 () ListLongMap!3823)

(assert (=> b!332917 (= lt!159147 (getCurrentListMapNoExtraKeys!579 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159149 () (_ BitVec 64))

(assert (=> b!332917 (= lt!159149 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159146 () (_ BitVec 64))

(assert (=> b!332917 (= lt!159146 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159141 () Unit!10337)

(assert (=> b!332917 (= lt!159141 (addApplyDifferent!239 lt!159147 lt!159149 zeroValue!1467 lt!159146))))

(assert (=> b!332917 (= (apply!263 (+!714 lt!159147 (tuple2!4909 lt!159149 zeroValue!1467)) lt!159146) (apply!263 lt!159147 lt!159146))))

(declare-fun lt!159151 () Unit!10337)

(assert (=> b!332917 (= lt!159151 lt!159141)))

(declare-fun lt!159140 () ListLongMap!3823)

(assert (=> b!332917 (= lt!159140 (getCurrentListMapNoExtraKeys!579 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159154 () (_ BitVec 64))

(assert (=> b!332917 (= lt!159154 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159139 () (_ BitVec 64))

(assert (=> b!332917 (= lt!159139 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!332917 (= lt!159145 (addApplyDifferent!239 lt!159140 lt!159154 minValue!1467 lt!159139))))

(assert (=> b!332917 (= (apply!263 (+!714 lt!159140 (tuple2!4909 lt!159154 minValue!1467)) lt!159139) (apply!263 lt!159140 lt!159139))))

(declare-fun b!332918 () Bool)

(declare-fun e!204438 () ListLongMap!3823)

(declare-fun call!26222 () ListLongMap!3823)

(assert (=> b!332918 (= e!204438 (+!714 call!26222 (tuple2!4909 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!332919 () Bool)

(declare-fun e!204433 () ListLongMap!3823)

(declare-fun call!26224 () ListLongMap!3823)

(assert (=> b!332919 (= e!204433 call!26224)))

(declare-fun bm!26219 () Bool)

(declare-fun call!26228 () ListLongMap!3823)

(assert (=> bm!26219 (= call!26224 call!26228)))

(declare-fun d!70585 () Bool)

(declare-fun e!204431 () Bool)

(assert (=> d!70585 e!204431))

(declare-fun res!183452 () Bool)

(assert (=> d!70585 (=> (not res!183452) (not e!204431))))

(assert (=> d!70585 (= res!183452 (or (bvsge #b00000000000000000000000000000000 (size!8457 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8457 _keys!1895)))))))

(declare-fun lt!159157 () ListLongMap!3823)

(assert (=> d!70585 (= lt!159143 lt!159157)))

(declare-fun lt!159152 () Unit!10337)

(assert (=> d!70585 (= lt!159152 e!204435)))

(declare-fun c!52086 () Bool)

(assert (=> d!70585 (= c!52086 e!204429)))

(declare-fun res!183458 () Bool)

(assert (=> d!70585 (=> (not res!183458) (not e!204429))))

(assert (=> d!70585 (= res!183458 (bvslt #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(assert (=> d!70585 (= lt!159157 e!204438)))

(declare-fun c!52084 () Bool)

(assert (=> d!70585 (= c!52084 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70585 (validMask!0 mask!2385)))

(assert (=> d!70585 (= (getCurrentListMap!1459 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!159143)))

(declare-fun b!332920 () Bool)

(declare-fun e!204432 () Bool)

(declare-fun call!26226 () Bool)

(assert (=> b!332920 (= e!204432 (not call!26226))))

(declare-fun b!332921 () Bool)

(declare-fun e!204436 () ListLongMap!3823)

(assert (=> b!332921 (= e!204438 e!204436)))

(declare-fun c!52083 () Bool)

(assert (=> b!332921 (= c!52083 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26220 () Bool)

(assert (=> bm!26220 (= call!26227 (contains!1987 lt!159143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!332922 () Bool)

(assert (=> b!332922 (= e!204431 e!204432)))

(declare-fun c!52085 () Bool)

(assert (=> b!332922 (= c!52085 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26221 () Bool)

(declare-fun call!26223 () ListLongMap!3823)

(assert (=> bm!26221 (= call!26222 (+!714 (ite c!52084 call!26223 (ite c!52083 call!26228 call!26224)) (ite (or c!52084 c!52083) (tuple2!4909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!4909 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26222 () Bool)

(assert (=> bm!26222 (= call!26226 (contains!1987 lt!159143 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!332923 () Bool)

(declare-fun get!4473 (ValueCell!3044 V!10011) V!10011)

(declare-fun dynLambda!606 (Int (_ BitVec 64)) V!10011)

(assert (=> b!332923 (= e!204439 (= (apply!263 lt!159143 (select (arr!8105 _keys!1895) #b00000000000000000000000000000000)) (get!4473 (select (arr!8104 _values!1525) #b00000000000000000000000000000000) (dynLambda!606 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332923 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8456 _values!1525)))))

(assert (=> b!332923 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(declare-fun b!332924 () Bool)

(declare-fun Unit!10340 () Unit!10337)

(assert (=> b!332924 (= e!204435 Unit!10340)))

(declare-fun bm!26223 () Bool)

(assert (=> bm!26223 (= call!26223 (getCurrentListMapNoExtraKeys!579 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26224 () Bool)

(declare-fun call!26225 () ListLongMap!3823)

(assert (=> bm!26224 (= call!26225 call!26222)))

(declare-fun b!332925 () Bool)

(declare-fun e!204430 () Bool)

(assert (=> b!332925 (= e!204432 e!204430)))

(declare-fun res!183450 () Bool)

(assert (=> b!332925 (= res!183450 call!26226)))

(assert (=> b!332925 (=> (not res!183450) (not e!204430))))

(declare-fun b!332926 () Bool)

(declare-fun res!183453 () Bool)

(assert (=> b!332926 (=> (not res!183453) (not e!204431))))

(assert (=> b!332926 (= res!183453 e!204434)))

(declare-fun res!183456 () Bool)

(assert (=> b!332926 (=> res!183456 e!204434)))

(assert (=> b!332926 (= res!183456 (not e!204437))))

(declare-fun res!183455 () Bool)

(assert (=> b!332926 (=> (not res!183455) (not e!204437))))

(assert (=> b!332926 (= res!183455 (bvslt #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(declare-fun b!332927 () Bool)

(declare-fun e!204440 () Bool)

(assert (=> b!332927 (= e!204440 (= (apply!263 lt!159143 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!332928 () Bool)

(assert (=> b!332928 (= e!204428 e!204440)))

(declare-fun res!183451 () Bool)

(assert (=> b!332928 (= res!183451 call!26227)))

(assert (=> b!332928 (=> (not res!183451) (not e!204440))))

(declare-fun b!332929 () Bool)

(declare-fun c!52087 () Bool)

(assert (=> b!332929 (= c!52087 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!332929 (= e!204436 e!204433)))

(declare-fun b!332930 () Bool)

(assert (=> b!332930 (= e!204430 (= (apply!263 lt!159143 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26225 () Bool)

(assert (=> bm!26225 (= call!26228 call!26223)))

(declare-fun b!332931 () Bool)

(declare-fun res!183454 () Bool)

(assert (=> b!332931 (=> (not res!183454) (not e!204431))))

(assert (=> b!332931 (= res!183454 e!204428)))

(declare-fun c!52088 () Bool)

(assert (=> b!332931 (= c!52088 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!332932 () Bool)

(assert (=> b!332932 (= e!204436 call!26225)))

(declare-fun b!332933 () Bool)

(assert (=> b!332933 (= e!204433 call!26225)))

(assert (= (and d!70585 c!52084) b!332918))

(assert (= (and d!70585 (not c!52084)) b!332921))

(assert (= (and b!332921 c!52083) b!332932))

(assert (= (and b!332921 (not c!52083)) b!332929))

(assert (= (and b!332929 c!52087) b!332933))

(assert (= (and b!332929 (not c!52087)) b!332919))

(assert (= (or b!332933 b!332919) bm!26219))

(assert (= (or b!332932 bm!26219) bm!26225))

(assert (= (or b!332932 b!332933) bm!26224))

(assert (= (or b!332918 bm!26225) bm!26223))

(assert (= (or b!332918 bm!26224) bm!26221))

(assert (= (and d!70585 res!183458) b!332916))

(assert (= (and d!70585 c!52086) b!332917))

(assert (= (and d!70585 (not c!52086)) b!332924))

(assert (= (and d!70585 res!183452) b!332926))

(assert (= (and b!332926 res!183455) b!332914))

(assert (= (and b!332926 (not res!183456)) b!332913))

(assert (= (and b!332913 res!183457) b!332923))

(assert (= (and b!332926 res!183453) b!332931))

(assert (= (and b!332931 c!52088) b!332928))

(assert (= (and b!332931 (not c!52088)) b!332915))

(assert (= (and b!332928 res!183451) b!332927))

(assert (= (or b!332928 b!332915) bm!26220))

(assert (= (and b!332931 res!183454) b!332922))

(assert (= (and b!332922 c!52085) b!332925))

(assert (= (and b!332922 (not c!52085)) b!332920))

(assert (= (and b!332925 res!183450) b!332930))

(assert (= (or b!332925 b!332920) bm!26222))

(declare-fun b_lambda!8413 () Bool)

(assert (=> (not b_lambda!8413) (not b!332923)))

(declare-fun t!9604 () Bool)

(declare-fun tb!3033 () Bool)

(assert (=> (and start!33520 (= defaultEntry!1528 defaultEntry!1528) t!9604) tb!3033))

(declare-fun result!5445 () Bool)

(assert (=> tb!3033 (= result!5445 tp_is_empty!6775)))

(assert (=> b!332923 t!9604))

(declare-fun b_and!14017 () Bool)

(assert (= b_and!14011 (and (=> t!9604 result!5445) b_and!14017)))

(declare-fun m!337535 () Bool)

(assert (=> bm!26221 m!337535))

(declare-fun m!337537 () Bool)

(assert (=> b!332930 m!337537))

(declare-fun m!337539 () Bool)

(assert (=> bm!26220 m!337539))

(assert (=> b!332916 m!337511))

(assert (=> b!332916 m!337511))

(assert (=> b!332916 m!337513))

(declare-fun m!337541 () Bool)

(assert (=> b!332927 m!337541))

(assert (=> b!332914 m!337511))

(assert (=> b!332914 m!337511))

(assert (=> b!332914 m!337513))

(assert (=> d!70585 m!337455))

(declare-fun m!337543 () Bool)

(assert (=> b!332917 m!337543))

(declare-fun m!337545 () Bool)

(assert (=> b!332917 m!337545))

(declare-fun m!337547 () Bool)

(assert (=> b!332917 m!337547))

(declare-fun m!337549 () Bool)

(assert (=> b!332917 m!337549))

(declare-fun m!337551 () Bool)

(assert (=> b!332917 m!337551))

(assert (=> b!332917 m!337543))

(declare-fun m!337553 () Bool)

(assert (=> b!332917 m!337553))

(declare-fun m!337555 () Bool)

(assert (=> b!332917 m!337555))

(declare-fun m!337557 () Bool)

(assert (=> b!332917 m!337557))

(declare-fun m!337559 () Bool)

(assert (=> b!332917 m!337559))

(declare-fun m!337561 () Bool)

(assert (=> b!332917 m!337561))

(declare-fun m!337563 () Bool)

(assert (=> b!332917 m!337563))

(declare-fun m!337565 () Bool)

(assert (=> b!332917 m!337565))

(declare-fun m!337567 () Bool)

(assert (=> b!332917 m!337567))

(assert (=> b!332917 m!337559))

(assert (=> b!332917 m!337567))

(declare-fun m!337569 () Bool)

(assert (=> b!332917 m!337569))

(assert (=> b!332917 m!337565))

(declare-fun m!337571 () Bool)

(assert (=> b!332917 m!337571))

(declare-fun m!337573 () Bool)

(assert (=> b!332917 m!337573))

(assert (=> b!332917 m!337511))

(declare-fun m!337575 () Bool)

(assert (=> b!332918 m!337575))

(declare-fun m!337577 () Bool)

(assert (=> bm!26222 m!337577))

(assert (=> bm!26223 m!337549))

(declare-fun m!337579 () Bool)

(assert (=> b!332923 m!337579))

(assert (=> b!332923 m!337511))

(declare-fun m!337581 () Bool)

(assert (=> b!332923 m!337581))

(declare-fun m!337583 () Bool)

(assert (=> b!332923 m!337583))

(assert (=> b!332923 m!337579))

(declare-fun m!337585 () Bool)

(assert (=> b!332923 m!337585))

(assert (=> b!332923 m!337583))

(assert (=> b!332923 m!337511))

(assert (=> b!332913 m!337511))

(assert (=> b!332913 m!337511))

(declare-fun m!337587 () Bool)

(assert (=> b!332913 m!337587))

(assert (=> b!332777 d!70585))

(declare-fun d!70587 () Bool)

(declare-fun lt!159168 () SeekEntryResult!3097)

(assert (=> d!70587 (and (or ((_ is Undefined!3097) lt!159168) (not ((_ is Found!3097) lt!159168)) (and (bvsge (index!14568 lt!159168) #b00000000000000000000000000000000) (bvslt (index!14568 lt!159168) (size!8457 _keys!1895)))) (or ((_ is Undefined!3097) lt!159168) ((_ is Found!3097) lt!159168) (not ((_ is MissingZero!3097) lt!159168)) (and (bvsge (index!14567 lt!159168) #b00000000000000000000000000000000) (bvslt (index!14567 lt!159168) (size!8457 _keys!1895)))) (or ((_ is Undefined!3097) lt!159168) ((_ is Found!3097) lt!159168) ((_ is MissingZero!3097) lt!159168) (not ((_ is MissingVacant!3097) lt!159168)) (and (bvsge (index!14570 lt!159168) #b00000000000000000000000000000000) (bvslt (index!14570 lt!159168) (size!8457 _keys!1895)))) (or ((_ is Undefined!3097) lt!159168) (ite ((_ is Found!3097) lt!159168) (= (select (arr!8105 _keys!1895) (index!14568 lt!159168)) k0!1348) (ite ((_ is MissingZero!3097) lt!159168) (= (select (arr!8105 _keys!1895) (index!14567 lt!159168)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3097) lt!159168) (= (select (arr!8105 _keys!1895) (index!14570 lt!159168)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!204447 () SeekEntryResult!3097)

(assert (=> d!70587 (= lt!159168 e!204447)))

(declare-fun c!52097 () Bool)

(declare-fun lt!159169 () SeekEntryResult!3097)

(assert (=> d!70587 (= c!52097 (and ((_ is Intermediate!3097) lt!159169) (undefined!3909 lt!159169)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17144 (_ BitVec 32)) SeekEntryResult!3097)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70587 (= lt!159169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70587 (validMask!0 mask!2385)))

(assert (=> d!70587 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!159168)))

(declare-fun b!332948 () Bool)

(declare-fun e!204449 () SeekEntryResult!3097)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17144 (_ BitVec 32)) SeekEntryResult!3097)

(assert (=> b!332948 (= e!204449 (seekKeyOrZeroReturnVacant!0 (x!33118 lt!159169) (index!14569 lt!159169) (index!14569 lt!159169) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!332949 () Bool)

(assert (=> b!332949 (= e!204447 Undefined!3097)))

(declare-fun b!332950 () Bool)

(declare-fun c!52095 () Bool)

(declare-fun lt!159167 () (_ BitVec 64))

(assert (=> b!332950 (= c!52095 (= lt!159167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!204448 () SeekEntryResult!3097)

(assert (=> b!332950 (= e!204448 e!204449)))

(declare-fun b!332951 () Bool)

(assert (=> b!332951 (= e!204449 (MissingZero!3097 (index!14569 lt!159169)))))

(declare-fun b!332952 () Bool)

(assert (=> b!332952 (= e!204448 (Found!3097 (index!14569 lt!159169)))))

(declare-fun b!332953 () Bool)

(assert (=> b!332953 (= e!204447 e!204448)))

(assert (=> b!332953 (= lt!159167 (select (arr!8105 _keys!1895) (index!14569 lt!159169)))))

(declare-fun c!52096 () Bool)

(assert (=> b!332953 (= c!52096 (= lt!159167 k0!1348))))

(assert (= (and d!70587 c!52097) b!332949))

(assert (= (and d!70587 (not c!52097)) b!332953))

(assert (= (and b!332953 c!52096) b!332952))

(assert (= (and b!332953 (not c!52096)) b!332950))

(assert (= (and b!332950 c!52095) b!332951))

(assert (= (and b!332950 (not c!52095)) b!332948))

(declare-fun m!337589 () Bool)

(assert (=> d!70587 m!337589))

(declare-fun m!337591 () Bool)

(assert (=> d!70587 m!337591))

(declare-fun m!337593 () Bool)

(assert (=> d!70587 m!337593))

(declare-fun m!337595 () Bool)

(assert (=> d!70587 m!337595))

(assert (=> d!70587 m!337589))

(assert (=> d!70587 m!337455))

(declare-fun m!337597 () Bool)

(assert (=> d!70587 m!337597))

(declare-fun m!337599 () Bool)

(assert (=> b!332948 m!337599))

(declare-fun m!337601 () Bool)

(assert (=> b!332953 m!337601))

(assert (=> b!332774 d!70587))

(declare-fun mapNonEmpty!11559 () Bool)

(declare-fun mapRes!11559 () Bool)

(declare-fun tp!23979 () Bool)

(declare-fun e!204454 () Bool)

(assert (=> mapNonEmpty!11559 (= mapRes!11559 (and tp!23979 e!204454))))

(declare-fun mapKey!11559 () (_ BitVec 32))

(declare-fun mapRest!11559 () (Array (_ BitVec 32) ValueCell!3044))

(declare-fun mapValue!11559 () ValueCell!3044)

(assert (=> mapNonEmpty!11559 (= mapRest!11550 (store mapRest!11559 mapKey!11559 mapValue!11559))))

(declare-fun mapIsEmpty!11559 () Bool)

(assert (=> mapIsEmpty!11559 mapRes!11559))

(declare-fun b!332960 () Bool)

(assert (=> b!332960 (= e!204454 tp_is_empty!6775)))

(declare-fun b!332961 () Bool)

(declare-fun e!204455 () Bool)

(assert (=> b!332961 (= e!204455 tp_is_empty!6775)))

(declare-fun condMapEmpty!11559 () Bool)

(declare-fun mapDefault!11559 () ValueCell!3044)

(assert (=> mapNonEmpty!11550 (= condMapEmpty!11559 (= mapRest!11550 ((as const (Array (_ BitVec 32) ValueCell!3044)) mapDefault!11559)))))

(assert (=> mapNonEmpty!11550 (= tp!23963 (and e!204455 mapRes!11559))))

(assert (= (and mapNonEmpty!11550 condMapEmpty!11559) mapIsEmpty!11559))

(assert (= (and mapNonEmpty!11550 (not condMapEmpty!11559)) mapNonEmpty!11559))

(assert (= (and mapNonEmpty!11559 ((_ is ValueCellFull!3044) mapValue!11559)) b!332960))

(assert (= (and mapNonEmpty!11550 ((_ is ValueCellFull!3044) mapDefault!11559)) b!332961))

(declare-fun m!337603 () Bool)

(assert (=> mapNonEmpty!11559 m!337603))

(declare-fun b_lambda!8415 () Bool)

(assert (= b_lambda!8413 (or (and start!33520 b_free!6823) b_lambda!8415)))

(check-sat (not mapNonEmpty!11559) (not b!332930) (not b!332849) (not b!332927) (not b_next!6823) (not bm!26201) (not bm!26204) (not b!332870) (not d!70585) (not b!332859) (not bm!26223) (not b!332917) (not b_lambda!8415) (not d!70583) (not b!332861) (not b!332948) (not b!332913) (not b!332918) (not b!332914) tp_is_empty!6775 b_and!14017 (not b!332923) (not b!332846) (not bm!26221) (not b!332848) (not b!332916) (not bm!26222) (not bm!26220) (not d!70587) (not b!332868))
(check-sat b_and!14017 (not b_next!6823))
