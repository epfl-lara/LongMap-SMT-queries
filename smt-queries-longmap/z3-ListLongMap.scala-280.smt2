; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4536 () Bool)

(assert start!4536)

(declare-fun b_free!1267 () Bool)

(declare-fun b_next!1267 () Bool)

(assert (=> start!4536 (= b_free!1267 (not b_next!1267))))

(declare-fun tp!5244 () Bool)

(declare-fun b_and!2087 () Bool)

(assert (=> start!4536 (= tp!5244 b_and!2087)))

(declare-fun b!35444 () Bool)

(declare-fun e!22384 () Bool)

(declare-fun e!22386 () Bool)

(declare-fun mapRes!1984 () Bool)

(assert (=> b!35444 (= e!22384 (and e!22386 mapRes!1984))))

(declare-fun condMapEmpty!1984 () Bool)

(declare-datatypes ((V!1987 0))(
  ( (V!1988 (val!837 Int)) )
))
(declare-datatypes ((ValueCell!611 0))(
  ( (ValueCellFull!611 (v!1933 V!1987)) (EmptyCell!611) )
))
(declare-datatypes ((array!2431 0))(
  ( (array!2432 (arr!1161 (Array (_ BitVec 32) ValueCell!611)) (size!1262 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2431)

(declare-fun mapDefault!1984 () ValueCell!611)

(assert (=> b!35444 (= condMapEmpty!1984 (= (arr!1161 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!611)) mapDefault!1984)))))

(declare-fun b!35445 () Bool)

(declare-fun e!22383 () Bool)

(declare-fun tp_is_empty!1621 () Bool)

(assert (=> b!35445 (= e!22383 tp_is_empty!1621)))

(declare-fun b!35446 () Bool)

(declare-fun res!21520 () Bool)

(declare-fun e!22385 () Bool)

(assert (=> b!35446 (=> (not res!21520) (not e!22385))))

(declare-datatypes ((array!2433 0))(
  ( (array!2434 (arr!1162 (Array (_ BitVec 32) (_ BitVec 64))) (size!1263 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2433)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2433 (_ BitVec 32)) Bool)

(assert (=> b!35446 (= res!21520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35447 () Bool)

(declare-fun e!22381 () Bool)

(declare-fun e!22382 () Bool)

(assert (=> b!35447 (= e!22381 e!22382)))

(declare-fun res!21517 () Bool)

(assert (=> b!35447 (=> (not res!21517) (not e!22382))))

(declare-datatypes ((SeekEntryResult!166 0))(
  ( (MissingZero!166 (index!2786 (_ BitVec 32))) (Found!166 (index!2787 (_ BitVec 32))) (Intermediate!166 (undefined!978 Bool) (index!2788 (_ BitVec 32)) (x!7028 (_ BitVec 32))) (Undefined!166) (MissingVacant!166 (index!2789 (_ BitVec 32))) )
))
(declare-fun lt!13057 () SeekEntryResult!166)

(get-info :version)

(assert (=> b!35447 (= res!21517 ((_ is Found!166) lt!13057))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2433 (_ BitVec 32)) SeekEntryResult!166)

(assert (=> b!35447 (= lt!13057 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35448 () Bool)

(assert (=> b!35448 (= e!22382 (not false))))

(declare-datatypes ((tuple2!1344 0))(
  ( (tuple2!1345 (_1!683 (_ BitVec 64)) (_2!683 V!1987)) )
))
(declare-datatypes ((List!928 0))(
  ( (Nil!925) (Cons!924 (h!1491 tuple2!1344) (t!3630 List!928)) )
))
(declare-datatypes ((ListLongMap!909 0))(
  ( (ListLongMap!910 (toList!470 List!928)) )
))
(declare-fun lt!13056 () ListLongMap!909)

(declare-fun contains!419 (ListLongMap!909 (_ BitVec 64)) Bool)

(assert (=> b!35448 (contains!419 lt!13056 (select (arr!1162 _keys!1833) (index!2787 lt!13057)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!784 0))(
  ( (Unit!785) )
))
(declare-fun lt!13058 () Unit!784)

(declare-fun zeroValue!1443 () V!1987)

(declare-fun minValue!1443 () V!1987)

(declare-fun lemmaValidKeyInArrayIsInListMap!68 (array!2433 array!2431 (_ BitVec 32) (_ BitVec 32) V!1987 V!1987 (_ BitVec 32) Int) Unit!784)

(assert (=> b!35448 (= lt!13058 (lemmaValidKeyInArrayIsInListMap!68 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2787 lt!13057) defaultEntry!1504))))

(declare-fun mapNonEmpty!1984 () Bool)

(declare-fun tp!5245 () Bool)

(assert (=> mapNonEmpty!1984 (= mapRes!1984 (and tp!5245 e!22383))))

(declare-fun mapValue!1984 () ValueCell!611)

(declare-fun mapKey!1984 () (_ BitVec 32))

(declare-fun mapRest!1984 () (Array (_ BitVec 32) ValueCell!611))

(assert (=> mapNonEmpty!1984 (= (arr!1161 _values!1501) (store mapRest!1984 mapKey!1984 mapValue!1984))))

(declare-fun b!35449 () Bool)

(assert (=> b!35449 (= e!22385 e!22381)))

(declare-fun res!21523 () Bool)

(assert (=> b!35449 (=> (not res!21523) (not e!22381))))

(assert (=> b!35449 (= res!21523 (not (contains!419 lt!13056 k0!1304)))))

(declare-fun getCurrentListMap!289 (array!2433 array!2431 (_ BitVec 32) (_ BitVec 32) V!1987 V!1987 (_ BitVec 32) Int) ListLongMap!909)

(assert (=> b!35449 (= lt!13056 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35450 () Bool)

(declare-fun res!21522 () Bool)

(assert (=> b!35450 (=> (not res!21522) (not e!22385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35450 (= res!21522 (validKeyInArray!0 k0!1304))))

(declare-fun res!21516 () Bool)

(assert (=> start!4536 (=> (not res!21516) (not e!22385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4536 (= res!21516 (validMask!0 mask!2294))))

(assert (=> start!4536 e!22385))

(assert (=> start!4536 true))

(assert (=> start!4536 tp!5244))

(declare-fun array_inv!819 (array!2431) Bool)

(assert (=> start!4536 (and (array_inv!819 _values!1501) e!22384)))

(declare-fun array_inv!820 (array!2433) Bool)

(assert (=> start!4536 (array_inv!820 _keys!1833)))

(assert (=> start!4536 tp_is_empty!1621))

(declare-fun b!35451 () Bool)

(declare-fun res!21521 () Bool)

(assert (=> b!35451 (=> (not res!21521) (not e!22385))))

(declare-datatypes ((List!929 0))(
  ( (Nil!926) (Cons!925 (h!1492 (_ BitVec 64)) (t!3631 List!929)) )
))
(declare-fun arrayNoDuplicates!0 (array!2433 (_ BitVec 32) List!929) Bool)

(assert (=> b!35451 (= res!21521 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!926))))

(declare-fun mapIsEmpty!1984 () Bool)

(assert (=> mapIsEmpty!1984 mapRes!1984))

(declare-fun b!35452 () Bool)

(declare-fun res!21518 () Bool)

(assert (=> b!35452 (=> (not res!21518) (not e!22385))))

(assert (=> b!35452 (= res!21518 (and (= (size!1262 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1263 _keys!1833) (size!1262 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!35453 () Bool)

(assert (=> b!35453 (= e!22386 tp_is_empty!1621)))

(declare-fun b!35454 () Bool)

(declare-fun res!21519 () Bool)

(assert (=> b!35454 (=> (not res!21519) (not e!22381))))

(declare-fun arrayContainsKey!0 (array!2433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35454 (= res!21519 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(assert (= (and start!4536 res!21516) b!35452))

(assert (= (and b!35452 res!21518) b!35446))

(assert (= (and b!35446 res!21520) b!35451))

(assert (= (and b!35451 res!21521) b!35450))

(assert (= (and b!35450 res!21522) b!35449))

(assert (= (and b!35449 res!21523) b!35454))

(assert (= (and b!35454 res!21519) b!35447))

(assert (= (and b!35447 res!21517) b!35448))

(assert (= (and b!35444 condMapEmpty!1984) mapIsEmpty!1984))

(assert (= (and b!35444 (not condMapEmpty!1984)) mapNonEmpty!1984))

(assert (= (and mapNonEmpty!1984 ((_ is ValueCellFull!611) mapValue!1984)) b!35445))

(assert (= (and b!35444 ((_ is ValueCellFull!611) mapDefault!1984)) b!35453))

(assert (= start!4536 b!35444))

(declare-fun m!28467 () Bool)

(assert (=> b!35449 m!28467))

(declare-fun m!28469 () Bool)

(assert (=> b!35449 m!28469))

(declare-fun m!28471 () Bool)

(assert (=> mapNonEmpty!1984 m!28471))

(declare-fun m!28473 () Bool)

(assert (=> b!35454 m!28473))

(declare-fun m!28475 () Bool)

(assert (=> start!4536 m!28475))

(declare-fun m!28477 () Bool)

(assert (=> start!4536 m!28477))

(declare-fun m!28479 () Bool)

(assert (=> start!4536 m!28479))

(declare-fun m!28481 () Bool)

(assert (=> b!35448 m!28481))

(assert (=> b!35448 m!28481))

(declare-fun m!28483 () Bool)

(assert (=> b!35448 m!28483))

(declare-fun m!28485 () Bool)

(assert (=> b!35448 m!28485))

(declare-fun m!28487 () Bool)

(assert (=> b!35446 m!28487))

(declare-fun m!28489 () Bool)

(assert (=> b!35450 m!28489))

(declare-fun m!28491 () Bool)

(assert (=> b!35447 m!28491))

(declare-fun m!28493 () Bool)

(assert (=> b!35451 m!28493))

(check-sat (not mapNonEmpty!1984) (not b_next!1267) (not b!35451) tp_is_empty!1621 (not b!35447) (not b!35446) (not b!35449) (not b!35454) (not start!4536) (not b!35448) b_and!2087 (not b!35450))
(check-sat b_and!2087 (not b_next!1267))
(get-model)

(declare-fun d!5283 () Bool)

(declare-fun e!22433 () Bool)

(assert (=> d!5283 e!22433))

(declare-fun res!21574 () Bool)

(assert (=> d!5283 (=> res!21574 e!22433)))

(declare-fun lt!13088 () Bool)

(assert (=> d!5283 (= res!21574 (not lt!13088))))

(declare-fun lt!13085 () Bool)

(assert (=> d!5283 (= lt!13088 lt!13085)))

(declare-fun lt!13087 () Unit!784)

(declare-fun e!22434 () Unit!784)

(assert (=> d!5283 (= lt!13087 e!22434)))

(declare-fun c!4022 () Bool)

(assert (=> d!5283 (= c!4022 lt!13085)))

(declare-fun containsKey!36 (List!928 (_ BitVec 64)) Bool)

(assert (=> d!5283 (= lt!13085 (containsKey!36 (toList!470 lt!13056) (select (arr!1162 _keys!1833) (index!2787 lt!13057))))))

(assert (=> d!5283 (= (contains!419 lt!13056 (select (arr!1162 _keys!1833) (index!2787 lt!13057))) lt!13088)))

(declare-fun b!35527 () Bool)

(declare-fun lt!13086 () Unit!784)

(assert (=> b!35527 (= e!22434 lt!13086)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!33 (List!928 (_ BitVec 64)) Unit!784)

(assert (=> b!35527 (= lt!13086 (lemmaContainsKeyImpliesGetValueByKeyDefined!33 (toList!470 lt!13056) (select (arr!1162 _keys!1833) (index!2787 lt!13057))))))

(declare-datatypes ((Option!78 0))(
  ( (Some!77 (v!1936 V!1987)) (None!76) )
))
(declare-fun isDefined!34 (Option!78) Bool)

(declare-fun getValueByKey!72 (List!928 (_ BitVec 64)) Option!78)

(assert (=> b!35527 (isDefined!34 (getValueByKey!72 (toList!470 lt!13056) (select (arr!1162 _keys!1833) (index!2787 lt!13057))))))

(declare-fun b!35528 () Bool)

(declare-fun Unit!788 () Unit!784)

(assert (=> b!35528 (= e!22434 Unit!788)))

(declare-fun b!35529 () Bool)

(assert (=> b!35529 (= e!22433 (isDefined!34 (getValueByKey!72 (toList!470 lt!13056) (select (arr!1162 _keys!1833) (index!2787 lt!13057)))))))

(assert (= (and d!5283 c!4022) b!35527))

(assert (= (and d!5283 (not c!4022)) b!35528))

(assert (= (and d!5283 (not res!21574)) b!35529))

(assert (=> d!5283 m!28481))

(declare-fun m!28551 () Bool)

(assert (=> d!5283 m!28551))

(assert (=> b!35527 m!28481))

(declare-fun m!28553 () Bool)

(assert (=> b!35527 m!28553))

(assert (=> b!35527 m!28481))

(declare-fun m!28555 () Bool)

(assert (=> b!35527 m!28555))

(assert (=> b!35527 m!28555))

(declare-fun m!28557 () Bool)

(assert (=> b!35527 m!28557))

(assert (=> b!35529 m!28481))

(assert (=> b!35529 m!28555))

(assert (=> b!35529 m!28555))

(assert (=> b!35529 m!28557))

(assert (=> b!35448 d!5283))

(declare-fun d!5285 () Bool)

(declare-fun e!22437 () Bool)

(assert (=> d!5285 e!22437))

(declare-fun res!21577 () Bool)

(assert (=> d!5285 (=> (not res!21577) (not e!22437))))

(assert (=> d!5285 (= res!21577 (and (bvsge (index!2787 lt!13057) #b00000000000000000000000000000000) (bvslt (index!2787 lt!13057) (size!1263 _keys!1833))))))

(declare-fun lt!13091 () Unit!784)

(declare-fun choose!220 (array!2433 array!2431 (_ BitVec 32) (_ BitVec 32) V!1987 V!1987 (_ BitVec 32) Int) Unit!784)

(assert (=> d!5285 (= lt!13091 (choose!220 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2787 lt!13057) defaultEntry!1504))))

(assert (=> d!5285 (validMask!0 mask!2294)))

(assert (=> d!5285 (= (lemmaValidKeyInArrayIsInListMap!68 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2787 lt!13057) defaultEntry!1504) lt!13091)))

(declare-fun b!35532 () Bool)

(assert (=> b!35532 (= e!22437 (contains!419 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1162 _keys!1833) (index!2787 lt!13057))))))

(assert (= (and d!5285 res!21577) b!35532))

(declare-fun m!28559 () Bool)

(assert (=> d!5285 m!28559))

(assert (=> d!5285 m!28475))

(assert (=> b!35532 m!28469))

(assert (=> b!35532 m!28481))

(assert (=> b!35532 m!28469))

(assert (=> b!35532 m!28481))

(declare-fun m!28561 () Bool)

(assert (=> b!35532 m!28561))

(assert (=> b!35448 d!5285))

(declare-fun d!5287 () Bool)

(assert (=> d!5287 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4536 d!5287))

(declare-fun d!5289 () Bool)

(assert (=> d!5289 (= (array_inv!819 _values!1501) (bvsge (size!1262 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4536 d!5289))

(declare-fun d!5291 () Bool)

(assert (=> d!5291 (= (array_inv!820 _keys!1833) (bvsge (size!1263 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4536 d!5291))

(declare-fun d!5293 () Bool)

(declare-fun res!21582 () Bool)

(declare-fun e!22442 () Bool)

(assert (=> d!5293 (=> res!21582 e!22442)))

(assert (=> d!5293 (= res!21582 (= (select (arr!1162 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5293 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22442)))

(declare-fun b!35537 () Bool)

(declare-fun e!22443 () Bool)

(assert (=> b!35537 (= e!22442 e!22443)))

(declare-fun res!21583 () Bool)

(assert (=> b!35537 (=> (not res!21583) (not e!22443))))

(assert (=> b!35537 (= res!21583 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1263 _keys!1833)))))

(declare-fun b!35538 () Bool)

(assert (=> b!35538 (= e!22443 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5293 (not res!21582)) b!35537))

(assert (= (and b!35537 res!21583) b!35538))

(declare-fun m!28563 () Bool)

(assert (=> d!5293 m!28563))

(declare-fun m!28565 () Bool)

(assert (=> b!35538 m!28565))

(assert (=> b!35454 d!5293))

(declare-fun d!5295 () Bool)

(assert (=> d!5295 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35450 d!5295))

(declare-fun d!5297 () Bool)

(declare-fun e!22444 () Bool)

(assert (=> d!5297 e!22444))

(declare-fun res!21584 () Bool)

(assert (=> d!5297 (=> res!21584 e!22444)))

(declare-fun lt!13095 () Bool)

(assert (=> d!5297 (= res!21584 (not lt!13095))))

(declare-fun lt!13092 () Bool)

(assert (=> d!5297 (= lt!13095 lt!13092)))

(declare-fun lt!13094 () Unit!784)

(declare-fun e!22445 () Unit!784)

(assert (=> d!5297 (= lt!13094 e!22445)))

(declare-fun c!4023 () Bool)

(assert (=> d!5297 (= c!4023 lt!13092)))

(assert (=> d!5297 (= lt!13092 (containsKey!36 (toList!470 lt!13056) k0!1304))))

(assert (=> d!5297 (= (contains!419 lt!13056 k0!1304) lt!13095)))

(declare-fun b!35539 () Bool)

(declare-fun lt!13093 () Unit!784)

(assert (=> b!35539 (= e!22445 lt!13093)))

(assert (=> b!35539 (= lt!13093 (lemmaContainsKeyImpliesGetValueByKeyDefined!33 (toList!470 lt!13056) k0!1304))))

(assert (=> b!35539 (isDefined!34 (getValueByKey!72 (toList!470 lt!13056) k0!1304))))

(declare-fun b!35540 () Bool)

(declare-fun Unit!789 () Unit!784)

(assert (=> b!35540 (= e!22445 Unit!789)))

(declare-fun b!35541 () Bool)

(assert (=> b!35541 (= e!22444 (isDefined!34 (getValueByKey!72 (toList!470 lt!13056) k0!1304)))))

(assert (= (and d!5297 c!4023) b!35539))

(assert (= (and d!5297 (not c!4023)) b!35540))

(assert (= (and d!5297 (not res!21584)) b!35541))

(declare-fun m!28567 () Bool)

(assert (=> d!5297 m!28567))

(declare-fun m!28569 () Bool)

(assert (=> b!35539 m!28569))

(declare-fun m!28571 () Bool)

(assert (=> b!35539 m!28571))

(assert (=> b!35539 m!28571))

(declare-fun m!28573 () Bool)

(assert (=> b!35539 m!28573))

(assert (=> b!35541 m!28571))

(assert (=> b!35541 m!28571))

(assert (=> b!35541 m!28573))

(assert (=> b!35449 d!5297))

(declare-fun bm!2817 () Bool)

(declare-fun call!2826 () Bool)

(declare-fun lt!13152 () ListLongMap!909)

(assert (=> bm!2817 (= call!2826 (contains!419 lt!13152 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35584 () Bool)

(declare-fun e!22481 () ListLongMap!909)

(declare-fun e!22484 () ListLongMap!909)

(assert (=> b!35584 (= e!22481 e!22484)))

(declare-fun c!4036 () Bool)

(assert (=> b!35584 (= c!4036 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35585 () Bool)

(declare-fun e!22483 () Bool)

(declare-fun call!2821 () Bool)

(assert (=> b!35585 (= e!22483 (not call!2821))))

(declare-fun call!2822 () ListLongMap!909)

(declare-fun bm!2818 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!28 (array!2433 array!2431 (_ BitVec 32) (_ BitVec 32) V!1987 V!1987 (_ BitVec 32) Int) ListLongMap!909)

(assert (=> bm!2818 (= call!2822 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35586 () Bool)

(declare-fun res!21609 () Bool)

(declare-fun e!22480 () Bool)

(assert (=> b!35586 (=> (not res!21609) (not e!22480))))

(declare-fun e!22475 () Bool)

(assert (=> b!35586 (= res!21609 e!22475)))

(declare-fun res!21611 () Bool)

(assert (=> b!35586 (=> res!21611 e!22475)))

(declare-fun e!22472 () Bool)

(assert (=> b!35586 (= res!21611 (not e!22472))))

(declare-fun res!21604 () Bool)

(assert (=> b!35586 (=> (not res!21604) (not e!22472))))

(assert (=> b!35586 (= res!21604 (bvslt #b00000000000000000000000000000000 (size!1263 _keys!1833)))))

(declare-fun b!35587 () Bool)

(declare-fun e!22482 () Bool)

(declare-fun apply!41 (ListLongMap!909 (_ BitVec 64)) V!1987)

(declare-fun get!606 (ValueCell!611 V!1987) V!1987)

(declare-fun dynLambda!157 (Int (_ BitVec 64)) V!1987)

(assert (=> b!35587 (= e!22482 (= (apply!41 lt!13152 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000)) (get!606 (select (arr!1161 _values!1501) #b00000000000000000000000000000000) (dynLambda!157 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35587 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1262 _values!1501)))))

(assert (=> b!35587 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1263 _keys!1833)))))

(declare-fun d!5299 () Bool)

(assert (=> d!5299 e!22480))

(declare-fun res!21610 () Bool)

(assert (=> d!5299 (=> (not res!21610) (not e!22480))))

(assert (=> d!5299 (= res!21610 (or (bvsge #b00000000000000000000000000000000 (size!1263 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1263 _keys!1833)))))))

(declare-fun lt!13148 () ListLongMap!909)

(assert (=> d!5299 (= lt!13152 lt!13148)))

(declare-fun lt!13153 () Unit!784)

(declare-fun e!22476 () Unit!784)

(assert (=> d!5299 (= lt!13153 e!22476)))

(declare-fun c!4041 () Bool)

(declare-fun e!22474 () Bool)

(assert (=> d!5299 (= c!4041 e!22474)))

(declare-fun res!21605 () Bool)

(assert (=> d!5299 (=> (not res!21605) (not e!22474))))

(assert (=> d!5299 (= res!21605 (bvslt #b00000000000000000000000000000000 (size!1263 _keys!1833)))))

(assert (=> d!5299 (= lt!13148 e!22481)))

(declare-fun c!4039 () Bool)

(assert (=> d!5299 (= c!4039 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5299 (validMask!0 mask!2294)))

(assert (=> d!5299 (= (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!13152)))

(declare-fun b!35588 () Bool)

(declare-fun e!22477 () Bool)

(assert (=> b!35588 (= e!22477 (= (apply!41 lt!13152 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!35589 () Bool)

(assert (=> b!35589 (= e!22474 (validKeyInArray!0 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35590 () Bool)

(declare-fun call!2825 () ListLongMap!909)

(declare-fun +!59 (ListLongMap!909 tuple2!1344) ListLongMap!909)

(assert (=> b!35590 (= e!22481 (+!59 call!2825 (tuple2!1345 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!35591 () Bool)

(assert (=> b!35591 (= e!22472 (validKeyInArray!0 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35592 () Bool)

(declare-fun Unit!790 () Unit!784)

(assert (=> b!35592 (= e!22476 Unit!790)))

(declare-fun b!35593 () Bool)

(declare-fun e!22479 () Bool)

(assert (=> b!35593 (= e!22480 e!22479)))

(declare-fun c!4037 () Bool)

(assert (=> b!35593 (= c!4037 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35594 () Bool)

(declare-fun e!22478 () ListLongMap!909)

(declare-fun call!2820 () ListLongMap!909)

(assert (=> b!35594 (= e!22478 call!2820)))

(declare-fun b!35595 () Bool)

(declare-fun call!2823 () ListLongMap!909)

(assert (=> b!35595 (= e!22484 call!2823)))

(declare-fun b!35596 () Bool)

(assert (=> b!35596 (= e!22478 call!2823)))

(declare-fun b!35597 () Bool)

(assert (=> b!35597 (= e!22475 e!22482)))

(declare-fun res!21606 () Bool)

(assert (=> b!35597 (=> (not res!21606) (not e!22482))))

(assert (=> b!35597 (= res!21606 (contains!419 lt!13152 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35597 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1263 _keys!1833)))))

(declare-fun b!35598 () Bool)

(declare-fun c!4040 () Bool)

(assert (=> b!35598 (= c!4040 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!35598 (= e!22484 e!22478)))

(declare-fun bm!2819 () Bool)

(declare-fun call!2824 () ListLongMap!909)

(assert (=> bm!2819 (= call!2824 call!2822)))

(declare-fun b!35599 () Bool)

(declare-fun res!21607 () Bool)

(assert (=> b!35599 (=> (not res!21607) (not e!22480))))

(assert (=> b!35599 (= res!21607 e!22483)))

(declare-fun c!4038 () Bool)

(assert (=> b!35599 (= c!4038 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!35600 () Bool)

(declare-fun e!22473 () Bool)

(assert (=> b!35600 (= e!22483 e!22473)))

(declare-fun res!21608 () Bool)

(assert (=> b!35600 (= res!21608 call!2821)))

(assert (=> b!35600 (=> (not res!21608) (not e!22473))))

(declare-fun b!35601 () Bool)

(assert (=> b!35601 (= e!22479 e!22477)))

(declare-fun res!21603 () Bool)

(assert (=> b!35601 (= res!21603 call!2826)))

(assert (=> b!35601 (=> (not res!21603) (not e!22477))))

(declare-fun bm!2820 () Bool)

(assert (=> bm!2820 (= call!2821 (contains!419 lt!13152 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2821 () Bool)

(assert (=> bm!2821 (= call!2823 call!2825)))

(declare-fun b!35602 () Bool)

(declare-fun lt!13151 () Unit!784)

(assert (=> b!35602 (= e!22476 lt!13151)))

(declare-fun lt!13144 () ListLongMap!909)

(assert (=> b!35602 (= lt!13144 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13155 () (_ BitVec 64))

(assert (=> b!35602 (= lt!13155 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13157 () (_ BitVec 64))

(assert (=> b!35602 (= lt!13157 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13142 () Unit!784)

(declare-fun addStillContains!26 (ListLongMap!909 (_ BitVec 64) V!1987 (_ BitVec 64)) Unit!784)

(assert (=> b!35602 (= lt!13142 (addStillContains!26 lt!13144 lt!13155 zeroValue!1443 lt!13157))))

(assert (=> b!35602 (contains!419 (+!59 lt!13144 (tuple2!1345 lt!13155 zeroValue!1443)) lt!13157)))

(declare-fun lt!13150 () Unit!784)

(assert (=> b!35602 (= lt!13150 lt!13142)))

(declare-fun lt!13145 () ListLongMap!909)

(assert (=> b!35602 (= lt!13145 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13156 () (_ BitVec 64))

(assert (=> b!35602 (= lt!13156 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13161 () (_ BitVec 64))

(assert (=> b!35602 (= lt!13161 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13159 () Unit!784)

(declare-fun addApplyDifferent!26 (ListLongMap!909 (_ BitVec 64) V!1987 (_ BitVec 64)) Unit!784)

(assert (=> b!35602 (= lt!13159 (addApplyDifferent!26 lt!13145 lt!13156 minValue!1443 lt!13161))))

(assert (=> b!35602 (= (apply!41 (+!59 lt!13145 (tuple2!1345 lt!13156 minValue!1443)) lt!13161) (apply!41 lt!13145 lt!13161))))

(declare-fun lt!13154 () Unit!784)

(assert (=> b!35602 (= lt!13154 lt!13159)))

(declare-fun lt!13160 () ListLongMap!909)

(assert (=> b!35602 (= lt!13160 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13143 () (_ BitVec 64))

(assert (=> b!35602 (= lt!13143 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13146 () (_ BitVec 64))

(assert (=> b!35602 (= lt!13146 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13149 () Unit!784)

(assert (=> b!35602 (= lt!13149 (addApplyDifferent!26 lt!13160 lt!13143 zeroValue!1443 lt!13146))))

(assert (=> b!35602 (= (apply!41 (+!59 lt!13160 (tuple2!1345 lt!13143 zeroValue!1443)) lt!13146) (apply!41 lt!13160 lt!13146))))

(declare-fun lt!13141 () Unit!784)

(assert (=> b!35602 (= lt!13141 lt!13149)))

(declare-fun lt!13158 () ListLongMap!909)

(assert (=> b!35602 (= lt!13158 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13147 () (_ BitVec 64))

(assert (=> b!35602 (= lt!13147 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13140 () (_ BitVec 64))

(assert (=> b!35602 (= lt!13140 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35602 (= lt!13151 (addApplyDifferent!26 lt!13158 lt!13147 minValue!1443 lt!13140))))

(assert (=> b!35602 (= (apply!41 (+!59 lt!13158 (tuple2!1345 lt!13147 minValue!1443)) lt!13140) (apply!41 lt!13158 lt!13140))))

(declare-fun bm!2822 () Bool)

(assert (=> bm!2822 (= call!2820 call!2824)))

(declare-fun bm!2823 () Bool)

(assert (=> bm!2823 (= call!2825 (+!59 (ite c!4039 call!2822 (ite c!4036 call!2824 call!2820)) (ite (or c!4039 c!4036) (tuple2!1345 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1345 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!35603 () Bool)

(assert (=> b!35603 (= e!22473 (= (apply!41 lt!13152 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!35604 () Bool)

(assert (=> b!35604 (= e!22479 (not call!2826))))

(assert (= (and d!5299 c!4039) b!35590))

(assert (= (and d!5299 (not c!4039)) b!35584))

(assert (= (and b!35584 c!4036) b!35595))

(assert (= (and b!35584 (not c!4036)) b!35598))

(assert (= (and b!35598 c!4040) b!35596))

(assert (= (and b!35598 (not c!4040)) b!35594))

(assert (= (or b!35596 b!35594) bm!2822))

(assert (= (or b!35595 bm!2822) bm!2819))

(assert (= (or b!35595 b!35596) bm!2821))

(assert (= (or b!35590 bm!2819) bm!2818))

(assert (= (or b!35590 bm!2821) bm!2823))

(assert (= (and d!5299 res!21605) b!35589))

(assert (= (and d!5299 c!4041) b!35602))

(assert (= (and d!5299 (not c!4041)) b!35592))

(assert (= (and d!5299 res!21610) b!35586))

(assert (= (and b!35586 res!21604) b!35591))

(assert (= (and b!35586 (not res!21611)) b!35597))

(assert (= (and b!35597 res!21606) b!35587))

(assert (= (and b!35586 res!21609) b!35599))

(assert (= (and b!35599 c!4038) b!35600))

(assert (= (and b!35599 (not c!4038)) b!35585))

(assert (= (and b!35600 res!21608) b!35603))

(assert (= (or b!35600 b!35585) bm!2820))

(assert (= (and b!35599 res!21607) b!35593))

(assert (= (and b!35593 c!4037) b!35601))

(assert (= (and b!35593 (not c!4037)) b!35604))

(assert (= (and b!35601 res!21603) b!35588))

(assert (= (or b!35601 b!35604) bm!2817))

(declare-fun b_lambda!1715 () Bool)

(assert (=> (not b_lambda!1715) (not b!35587)))

(declare-fun t!3637 () Bool)

(declare-fun tb!691 () Bool)

(assert (=> (and start!4536 (= defaultEntry!1504 defaultEntry!1504) t!3637) tb!691))

(declare-fun result!1195 () Bool)

(assert (=> tb!691 (= result!1195 tp_is_empty!1621)))

(assert (=> b!35587 t!3637))

(declare-fun b_and!2093 () Bool)

(assert (= b_and!2087 (and (=> t!3637 result!1195) b_and!2093)))

(declare-fun m!28575 () Bool)

(assert (=> bm!2817 m!28575))

(assert (=> b!35591 m!28563))

(assert (=> b!35591 m!28563))

(declare-fun m!28577 () Bool)

(assert (=> b!35591 m!28577))

(assert (=> b!35589 m!28563))

(assert (=> b!35589 m!28563))

(assert (=> b!35589 m!28577))

(assert (=> b!35597 m!28563))

(assert (=> b!35597 m!28563))

(declare-fun m!28579 () Bool)

(assert (=> b!35597 m!28579))

(declare-fun m!28581 () Bool)

(assert (=> b!35590 m!28581))

(declare-fun m!28583 () Bool)

(assert (=> bm!2818 m!28583))

(declare-fun m!28585 () Bool)

(assert (=> bm!2820 m!28585))

(declare-fun m!28587 () Bool)

(assert (=> b!35602 m!28587))

(declare-fun m!28589 () Bool)

(assert (=> b!35602 m!28589))

(declare-fun m!28591 () Bool)

(assert (=> b!35602 m!28591))

(assert (=> b!35602 m!28591))

(declare-fun m!28593 () Bool)

(assert (=> b!35602 m!28593))

(assert (=> b!35602 m!28583))

(declare-fun m!28595 () Bool)

(assert (=> b!35602 m!28595))

(declare-fun m!28597 () Bool)

(assert (=> b!35602 m!28597))

(declare-fun m!28599 () Bool)

(assert (=> b!35602 m!28599))

(declare-fun m!28601 () Bool)

(assert (=> b!35602 m!28601))

(assert (=> b!35602 m!28595))

(declare-fun m!28603 () Bool)

(assert (=> b!35602 m!28603))

(declare-fun m!28605 () Bool)

(assert (=> b!35602 m!28605))

(declare-fun m!28607 () Bool)

(assert (=> b!35602 m!28607))

(assert (=> b!35602 m!28599))

(declare-fun m!28609 () Bool)

(assert (=> b!35602 m!28609))

(declare-fun m!28611 () Bool)

(assert (=> b!35602 m!28611))

(assert (=> b!35602 m!28563))

(declare-fun m!28613 () Bool)

(assert (=> b!35602 m!28613))

(declare-fun m!28615 () Bool)

(assert (=> b!35602 m!28615))

(assert (=> b!35602 m!28613))

(declare-fun m!28617 () Bool)

(assert (=> b!35587 m!28617))

(assert (=> b!35587 m!28563))

(assert (=> b!35587 m!28563))

(declare-fun m!28619 () Bool)

(assert (=> b!35587 m!28619))

(declare-fun m!28621 () Bool)

(assert (=> b!35587 m!28621))

(assert (=> b!35587 m!28617))

(assert (=> b!35587 m!28621))

(declare-fun m!28623 () Bool)

(assert (=> b!35587 m!28623))

(declare-fun m!28625 () Bool)

(assert (=> b!35603 m!28625))

(declare-fun m!28627 () Bool)

(assert (=> b!35588 m!28627))

(assert (=> d!5299 m!28475))

(declare-fun m!28629 () Bool)

(assert (=> bm!2823 m!28629))

(assert (=> b!35449 d!5299))

(declare-fun b!35617 () Bool)

(declare-fun e!22493 () Bool)

(declare-fun contains!422 (List!929 (_ BitVec 64)) Bool)

(assert (=> b!35617 (= e!22493 (contains!422 Nil!926 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35618 () Bool)

(declare-fun e!22496 () Bool)

(declare-fun call!2829 () Bool)

(assert (=> b!35618 (= e!22496 call!2829)))

(declare-fun bm!2826 () Bool)

(declare-fun c!4044 () Bool)

(assert (=> bm!2826 (= call!2829 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4044 (Cons!925 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000) Nil!926) Nil!926)))))

(declare-fun b!35619 () Bool)

(assert (=> b!35619 (= e!22496 call!2829)))

(declare-fun d!5301 () Bool)

(declare-fun res!21620 () Bool)

(declare-fun e!22495 () Bool)

(assert (=> d!5301 (=> res!21620 e!22495)))

(assert (=> d!5301 (= res!21620 (bvsge #b00000000000000000000000000000000 (size!1263 _keys!1833)))))

(assert (=> d!5301 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!926) e!22495)))

(declare-fun b!35620 () Bool)

(declare-fun e!22494 () Bool)

(assert (=> b!35620 (= e!22495 e!22494)))

(declare-fun res!21618 () Bool)

(assert (=> b!35620 (=> (not res!21618) (not e!22494))))

(assert (=> b!35620 (= res!21618 (not e!22493))))

(declare-fun res!21619 () Bool)

(assert (=> b!35620 (=> (not res!21619) (not e!22493))))

(assert (=> b!35620 (= res!21619 (validKeyInArray!0 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35621 () Bool)

(assert (=> b!35621 (= e!22494 e!22496)))

(assert (=> b!35621 (= c!4044 (validKeyInArray!0 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5301 (not res!21620)) b!35620))

(assert (= (and b!35620 res!21619) b!35617))

(assert (= (and b!35620 res!21618) b!35621))

(assert (= (and b!35621 c!4044) b!35619))

(assert (= (and b!35621 (not c!4044)) b!35618))

(assert (= (or b!35619 b!35618) bm!2826))

(assert (=> b!35617 m!28563))

(assert (=> b!35617 m!28563))

(declare-fun m!28631 () Bool)

(assert (=> b!35617 m!28631))

(assert (=> bm!2826 m!28563))

(declare-fun m!28633 () Bool)

(assert (=> bm!2826 m!28633))

(assert (=> b!35620 m!28563))

(assert (=> b!35620 m!28563))

(assert (=> b!35620 m!28577))

(assert (=> b!35621 m!28563))

(assert (=> b!35621 m!28563))

(assert (=> b!35621 m!28577))

(assert (=> b!35451 d!5301))

(declare-fun b!35634 () Bool)

(declare-fun e!22505 () SeekEntryResult!166)

(assert (=> b!35634 (= e!22505 Undefined!166)))

(declare-fun d!5303 () Bool)

(declare-fun lt!13173 () SeekEntryResult!166)

(assert (=> d!5303 (and (or ((_ is MissingVacant!166) lt!13173) (not ((_ is Found!166) lt!13173)) (and (bvsge (index!2787 lt!13173) #b00000000000000000000000000000000) (bvslt (index!2787 lt!13173) (size!1263 _keys!1833)))) (not ((_ is MissingVacant!166) lt!13173)) (or (not ((_ is Found!166) lt!13173)) (= (select (arr!1162 _keys!1833) (index!2787 lt!13173)) k0!1304)))))

(assert (=> d!5303 (= lt!13173 e!22505)))

(declare-fun c!4053 () Bool)

(declare-fun lt!13170 () SeekEntryResult!166)

(assert (=> d!5303 (= c!4053 (and ((_ is Intermediate!166) lt!13170) (undefined!978 lt!13170)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2433 (_ BitVec 32)) SeekEntryResult!166)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5303 (= lt!13170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5303 (validMask!0 mask!2294)))

(assert (=> d!5303 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!13173)))

(declare-fun b!35635 () Bool)

(declare-fun e!22503 () SeekEntryResult!166)

(assert (=> b!35635 (= e!22505 e!22503)))

(declare-fun lt!13172 () (_ BitVec 64))

(assert (=> b!35635 (= lt!13172 (select (arr!1162 _keys!1833) (index!2788 lt!13170)))))

(declare-fun c!4052 () Bool)

(assert (=> b!35635 (= c!4052 (= lt!13172 k0!1304))))

(declare-fun b!35636 () Bool)

(declare-fun c!4051 () Bool)

(assert (=> b!35636 (= c!4051 (= lt!13172 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22504 () SeekEntryResult!166)

(assert (=> b!35636 (= e!22503 e!22504)))

(declare-fun b!35637 () Bool)

(assert (=> b!35637 (= e!22504 (MissingZero!166 (index!2788 lt!13170)))))

(declare-fun b!35638 () Bool)

(assert (=> b!35638 (= e!22503 (Found!166 (index!2788 lt!13170)))))

(declare-fun b!35639 () Bool)

(declare-fun lt!13171 () SeekEntryResult!166)

(assert (=> b!35639 (= e!22504 (ite ((_ is MissingVacant!166) lt!13171) (MissingZero!166 (index!2789 lt!13171)) lt!13171))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2433 (_ BitVec 32)) SeekEntryResult!166)

(assert (=> b!35639 (= lt!13171 (seekKeyOrZeroReturnVacant!0 (x!7028 lt!13170) (index!2788 lt!13170) (index!2788 lt!13170) k0!1304 _keys!1833 mask!2294))))

(assert (= (and d!5303 c!4053) b!35634))

(assert (= (and d!5303 (not c!4053)) b!35635))

(assert (= (and b!35635 c!4052) b!35638))

(assert (= (and b!35635 (not c!4052)) b!35636))

(assert (= (and b!35636 c!4051) b!35637))

(assert (= (and b!35636 (not c!4051)) b!35639))

(declare-fun m!28635 () Bool)

(assert (=> d!5303 m!28635))

(declare-fun m!28637 () Bool)

(assert (=> d!5303 m!28637))

(assert (=> d!5303 m!28637))

(declare-fun m!28639 () Bool)

(assert (=> d!5303 m!28639))

(assert (=> d!5303 m!28475))

(declare-fun m!28641 () Bool)

(assert (=> b!35635 m!28641))

(declare-fun m!28643 () Bool)

(assert (=> b!35639 m!28643))

(assert (=> b!35447 d!5303))

(declare-fun b!35648 () Bool)

(declare-fun e!22514 () Bool)

(declare-fun e!22513 () Bool)

(assert (=> b!35648 (= e!22514 e!22513)))

(declare-fun lt!13182 () (_ BitVec 64))

(assert (=> b!35648 (= lt!13182 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13180 () Unit!784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2433 (_ BitVec 64) (_ BitVec 32)) Unit!784)

(assert (=> b!35648 (= lt!13180 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13182 #b00000000000000000000000000000000))))

(assert (=> b!35648 (arrayContainsKey!0 _keys!1833 lt!13182 #b00000000000000000000000000000000)))

(declare-fun lt!13181 () Unit!784)

(assert (=> b!35648 (= lt!13181 lt!13180)))

(declare-fun res!21626 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2433 (_ BitVec 32)) SeekEntryResult!166)

(assert (=> b!35648 (= res!21626 (= (seekEntryOrOpen!0 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!166 #b00000000000000000000000000000000)))))

(assert (=> b!35648 (=> (not res!21626) (not e!22513))))

(declare-fun b!35649 () Bool)

(declare-fun call!2832 () Bool)

(assert (=> b!35649 (= e!22513 call!2832)))

(declare-fun bm!2829 () Bool)

(assert (=> bm!2829 (= call!2832 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!35650 () Bool)

(assert (=> b!35650 (= e!22514 call!2832)))

(declare-fun d!5305 () Bool)

(declare-fun res!21625 () Bool)

(declare-fun e!22512 () Bool)

(assert (=> d!5305 (=> res!21625 e!22512)))

(assert (=> d!5305 (= res!21625 (bvsge #b00000000000000000000000000000000 (size!1263 _keys!1833)))))

(assert (=> d!5305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22512)))

(declare-fun b!35651 () Bool)

(assert (=> b!35651 (= e!22512 e!22514)))

(declare-fun c!4056 () Bool)

(assert (=> b!35651 (= c!4056 (validKeyInArray!0 (select (arr!1162 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5305 (not res!21625)) b!35651))

(assert (= (and b!35651 c!4056) b!35648))

(assert (= (and b!35651 (not c!4056)) b!35650))

(assert (= (and b!35648 res!21626) b!35649))

(assert (= (or b!35649 b!35650) bm!2829))

(assert (=> b!35648 m!28563))

(declare-fun m!28645 () Bool)

(assert (=> b!35648 m!28645))

(declare-fun m!28647 () Bool)

(assert (=> b!35648 m!28647))

(assert (=> b!35648 m!28563))

(declare-fun m!28649 () Bool)

(assert (=> b!35648 m!28649))

(declare-fun m!28651 () Bool)

(assert (=> bm!2829 m!28651))

(assert (=> b!35651 m!28563))

(assert (=> b!35651 m!28563))

(assert (=> b!35651 m!28577))

(assert (=> b!35446 d!5305))

(declare-fun mapNonEmpty!1993 () Bool)

(declare-fun mapRes!1993 () Bool)

(declare-fun tp!5260 () Bool)

(declare-fun e!22519 () Bool)

(assert (=> mapNonEmpty!1993 (= mapRes!1993 (and tp!5260 e!22519))))

(declare-fun mapValue!1993 () ValueCell!611)

(declare-fun mapRest!1993 () (Array (_ BitVec 32) ValueCell!611))

(declare-fun mapKey!1993 () (_ BitVec 32))

(assert (=> mapNonEmpty!1993 (= mapRest!1984 (store mapRest!1993 mapKey!1993 mapValue!1993))))

(declare-fun b!35658 () Bool)

(assert (=> b!35658 (= e!22519 tp_is_empty!1621)))

(declare-fun condMapEmpty!1993 () Bool)

(declare-fun mapDefault!1993 () ValueCell!611)

(assert (=> mapNonEmpty!1984 (= condMapEmpty!1993 (= mapRest!1984 ((as const (Array (_ BitVec 32) ValueCell!611)) mapDefault!1993)))))

(declare-fun e!22520 () Bool)

(assert (=> mapNonEmpty!1984 (= tp!5245 (and e!22520 mapRes!1993))))

(declare-fun b!35659 () Bool)

(assert (=> b!35659 (= e!22520 tp_is_empty!1621)))

(declare-fun mapIsEmpty!1993 () Bool)

(assert (=> mapIsEmpty!1993 mapRes!1993))

(assert (= (and mapNonEmpty!1984 condMapEmpty!1993) mapIsEmpty!1993))

(assert (= (and mapNonEmpty!1984 (not condMapEmpty!1993)) mapNonEmpty!1993))

(assert (= (and mapNonEmpty!1993 ((_ is ValueCellFull!611) mapValue!1993)) b!35658))

(assert (= (and mapNonEmpty!1984 ((_ is ValueCellFull!611) mapDefault!1993)) b!35659))

(declare-fun m!28653 () Bool)

(assert (=> mapNonEmpty!1993 m!28653))

(declare-fun b_lambda!1717 () Bool)

(assert (= b_lambda!1715 (or (and start!4536 b_free!1267) b_lambda!1717)))

(check-sat (not b!35541) (not b_next!1267) (not b!35639) (not bm!2829) (not b!35602) (not d!5299) (not b!35590) (not b!35527) tp_is_empty!1621 (not bm!2826) (not bm!2823) (not b!35539) (not b!35587) (not b!35589) (not b!35532) (not bm!2818) (not b_lambda!1717) b_and!2093 (not d!5297) (not b!35620) (not b!35591) (not d!5285) (not b!35621) (not b!35538) (not d!5283) (not b!35617) (not b!35603) (not b!35648) (not b!35597) (not b!35529) (not bm!2817) (not mapNonEmpty!1993) (not d!5303) (not bm!2820) (not b!35588) (not b!35651))
(check-sat b_and!2093 (not b_next!1267))
