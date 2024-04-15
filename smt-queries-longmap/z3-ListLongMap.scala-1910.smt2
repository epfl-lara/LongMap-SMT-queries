; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33984 () Bool)

(assert start!33984)

(declare-fun b_free!7129 () Bool)

(declare-fun b_next!7129 () Bool)

(assert (=> start!33984 (= b_free!7129 (not b_next!7129))))

(declare-fun tp!24906 () Bool)

(declare-fun b_and!14293 () Bool)

(assert (=> start!33984 (= tp!24906 b_and!14293)))

(declare-fun b!338529 () Bool)

(declare-fun res!187038 () Bool)

(declare-fun e!207699 () Bool)

(assert (=> b!338529 (=> (not res!187038) (not e!207699))))

(declare-datatypes ((array!17737 0))(
  ( (array!17738 (arr!8394 (Array (_ BitVec 32) (_ BitVec 64))) (size!8747 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17737)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17737 (_ BitVec 32)) Bool)

(assert (=> b!338529 (= res!187038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338531 () Bool)

(declare-fun e!207694 () Bool)

(assert (=> b!338531 (= e!207699 e!207694)))

(declare-fun res!187034 () Bool)

(assert (=> b!338531 (=> (not res!187034) (not e!207694))))

(declare-datatypes ((SeekEntryResult!3239 0))(
  ( (MissingZero!3239 (index!15135 (_ BitVec 32))) (Found!3239 (index!15136 (_ BitVec 32))) (Intermediate!3239 (undefined!4051 Bool) (index!15137 (_ BitVec 32)) (x!33746 (_ BitVec 32))) (Undefined!3239) (MissingVacant!3239 (index!15138 (_ BitVec 32))) )
))
(declare-fun lt!160673 () SeekEntryResult!3239)

(get-info :version)

(assert (=> b!338531 (= res!187034 (and (not ((_ is Found!3239) lt!160673)) ((_ is MissingZero!3239) lt!160673)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17737 (_ BitVec 32)) SeekEntryResult!3239)

(assert (=> b!338531 (= lt!160673 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12033 () Bool)

(declare-fun mapRes!12033 () Bool)

(assert (=> mapIsEmpty!12033 mapRes!12033))

(declare-fun mapNonEmpty!12033 () Bool)

(declare-fun tp!24905 () Bool)

(declare-fun e!207695 () Bool)

(assert (=> mapNonEmpty!12033 (= mapRes!12033 (and tp!24905 e!207695))))

(declare-fun mapKey!12033 () (_ BitVec 32))

(declare-datatypes ((V!10419 0))(
  ( (V!10420 (val!3585 Int)) )
))
(declare-datatypes ((ValueCell!3197 0))(
  ( (ValueCellFull!3197 (v!5746 V!10419)) (EmptyCell!3197) )
))
(declare-fun mapValue!12033 () ValueCell!3197)

(declare-fun mapRest!12033 () (Array (_ BitVec 32) ValueCell!3197))

(declare-datatypes ((array!17739 0))(
  ( (array!17740 (arr!8395 (Array (_ BitVec 32) ValueCell!3197)) (size!8748 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17739)

(assert (=> mapNonEmpty!12033 (= (arr!8395 _values!1525) (store mapRest!12033 mapKey!12033 mapValue!12033))))

(declare-fun b!338532 () Bool)

(declare-fun res!187033 () Bool)

(assert (=> b!338532 (=> (not res!187033) (not e!207699))))

(declare-fun zeroValue!1467 () V!10419)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10419)

(declare-datatypes ((tuple2!5148 0))(
  ( (tuple2!5149 (_1!2585 (_ BitVec 64)) (_2!2585 V!10419)) )
))
(declare-datatypes ((List!4776 0))(
  ( (Nil!4773) (Cons!4772 (h!5628 tuple2!5148) (t!9865 List!4776)) )
))
(declare-datatypes ((ListLongMap!4051 0))(
  ( (ListLongMap!4052 (toList!2041 List!4776)) )
))
(declare-fun contains!2101 (ListLongMap!4051 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1547 (array!17737 array!17739 (_ BitVec 32) (_ BitVec 32) V!10419 V!10419 (_ BitVec 32) Int) ListLongMap!4051)

(assert (=> b!338532 (= res!187033 (not (contains!2101 (getCurrentListMap!1547 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338533 () Bool)

(declare-fun tp_is_empty!7081 () Bool)

(assert (=> b!338533 (= e!207695 tp_is_empty!7081)))

(declare-fun b!338534 () Bool)

(declare-fun res!187036 () Bool)

(assert (=> b!338534 (=> (not res!187036) (not e!207699))))

(declare-datatypes ((List!4777 0))(
  ( (Nil!4774) (Cons!4773 (h!5629 (_ BitVec 64)) (t!9866 List!4777)) )
))
(declare-fun arrayNoDuplicates!0 (array!17737 (_ BitVec 32) List!4777) Bool)

(assert (=> b!338534 (= res!187036 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4774))))

(declare-fun b!338535 () Bool)

(declare-fun e!207693 () Bool)

(assert (=> b!338535 (= e!207693 tp_is_empty!7081)))

(declare-fun b!338536 () Bool)

(declare-fun res!187032 () Bool)

(assert (=> b!338536 (=> (not res!187032) (not e!207699))))

(assert (=> b!338536 (= res!187032 (and (= (size!8748 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8747 _keys!1895) (size!8748 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338530 () Bool)

(declare-fun e!207700 () Bool)

(assert (=> b!338530 (= e!207700 (and e!207693 mapRes!12033))))

(declare-fun condMapEmpty!12033 () Bool)

(declare-fun mapDefault!12033 () ValueCell!3197)

(assert (=> b!338530 (= condMapEmpty!12033 (= (arr!8395 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3197)) mapDefault!12033)))))

(declare-fun res!187040 () Bool)

(assert (=> start!33984 (=> (not res!187040) (not e!207699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33984 (= res!187040 (validMask!0 mask!2385))))

(assert (=> start!33984 e!207699))

(assert (=> start!33984 true))

(assert (=> start!33984 tp_is_empty!7081))

(assert (=> start!33984 tp!24906))

(declare-fun array_inv!6254 (array!17739) Bool)

(assert (=> start!33984 (and (array_inv!6254 _values!1525) e!207700)))

(declare-fun array_inv!6255 (array!17737) Bool)

(assert (=> start!33984 (array_inv!6255 _keys!1895)))

(declare-fun b!338537 () Bool)

(declare-fun e!207697 () Bool)

(assert (=> b!338537 (= e!207694 e!207697)))

(declare-fun res!187035 () Bool)

(assert (=> b!338537 (=> (not res!187035) (not e!207697))))

(declare-fun lt!160672 () Bool)

(assert (=> b!338537 (= res!187035 (not lt!160672))))

(declare-datatypes ((Unit!10516 0))(
  ( (Unit!10517) )
))
(declare-fun lt!160671 () Unit!10516)

(declare-fun e!207696 () Unit!10516)

(assert (=> b!338537 (= lt!160671 e!207696)))

(declare-fun c!52382 () Bool)

(assert (=> b!338537 (= c!52382 lt!160672)))

(declare-fun arrayContainsKey!0 (array!17737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338537 (= lt!160672 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!338538 () Bool)

(declare-fun res!187039 () Bool)

(assert (=> b!338538 (=> (not res!187039) (not e!207697))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!338538 (= res!187039 (inRange!0 (index!15135 lt!160673) mask!2385))))

(declare-fun b!338539 () Bool)

(declare-fun Unit!10518 () Unit!10516)

(assert (=> b!338539 (= e!207696 Unit!10518)))

(declare-fun lt!160674 () Unit!10516)

(declare-fun lemmaArrayContainsKeyThenInListMap!280 (array!17737 array!17739 (_ BitVec 32) (_ BitVec 32) V!10419 V!10419 (_ BitVec 64) (_ BitVec 32) Int) Unit!10516)

(declare-fun arrayScanForKey!0 (array!17737 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338539 (= lt!160674 (lemmaArrayContainsKeyThenInListMap!280 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338539 false))

(declare-fun b!338540 () Bool)

(assert (=> b!338540 (= e!207697 (and (= (select (arr!8394 _keys!1895) (index!15135 lt!160673)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!8747 _keys!1895))))))

(declare-fun b!338541 () Bool)

(declare-fun res!187037 () Bool)

(assert (=> b!338541 (=> (not res!187037) (not e!207699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338541 (= res!187037 (validKeyInArray!0 k0!1348))))

(declare-fun b!338542 () Bool)

(declare-fun Unit!10519 () Unit!10516)

(assert (=> b!338542 (= e!207696 Unit!10519)))

(assert (= (and start!33984 res!187040) b!338536))

(assert (= (and b!338536 res!187032) b!338529))

(assert (= (and b!338529 res!187038) b!338534))

(assert (= (and b!338534 res!187036) b!338541))

(assert (= (and b!338541 res!187037) b!338532))

(assert (= (and b!338532 res!187033) b!338531))

(assert (= (and b!338531 res!187034) b!338537))

(assert (= (and b!338537 c!52382) b!338539))

(assert (= (and b!338537 (not c!52382)) b!338542))

(assert (= (and b!338537 res!187035) b!338538))

(assert (= (and b!338538 res!187039) b!338540))

(assert (= (and b!338530 condMapEmpty!12033) mapIsEmpty!12033))

(assert (= (and b!338530 (not condMapEmpty!12033)) mapNonEmpty!12033))

(assert (= (and mapNonEmpty!12033 ((_ is ValueCellFull!3197) mapValue!12033)) b!338533))

(assert (= (and b!338530 ((_ is ValueCellFull!3197) mapDefault!12033)) b!338535))

(assert (= start!33984 b!338530))

(declare-fun m!341221 () Bool)

(assert (=> b!338540 m!341221))

(declare-fun m!341223 () Bool)

(assert (=> mapNonEmpty!12033 m!341223))

(declare-fun m!341225 () Bool)

(assert (=> start!33984 m!341225))

(declare-fun m!341227 () Bool)

(assert (=> start!33984 m!341227))

(declare-fun m!341229 () Bool)

(assert (=> start!33984 m!341229))

(declare-fun m!341231 () Bool)

(assert (=> b!338538 m!341231))

(declare-fun m!341233 () Bool)

(assert (=> b!338531 m!341233))

(declare-fun m!341235 () Bool)

(assert (=> b!338534 m!341235))

(declare-fun m!341237 () Bool)

(assert (=> b!338539 m!341237))

(assert (=> b!338539 m!341237))

(declare-fun m!341239 () Bool)

(assert (=> b!338539 m!341239))

(declare-fun m!341241 () Bool)

(assert (=> b!338529 m!341241))

(declare-fun m!341243 () Bool)

(assert (=> b!338541 m!341243))

(declare-fun m!341245 () Bool)

(assert (=> b!338537 m!341245))

(declare-fun m!341247 () Bool)

(assert (=> b!338532 m!341247))

(assert (=> b!338532 m!341247))

(declare-fun m!341249 () Bool)

(assert (=> b!338532 m!341249))

(check-sat (not b_next!7129) tp_is_empty!7081 b_and!14293 (not b!338541) (not b!338534) (not b!338532) (not b!338537) (not b!338539) (not start!33984) (not b!338538) (not b!338529) (not mapNonEmpty!12033) (not b!338531))
(check-sat b_and!14293 (not b_next!7129))
(get-model)

(declare-fun d!70597 () Bool)

(assert (=> d!70597 (= (inRange!0 (index!15135 lt!160673) mask!2385) (and (bvsge (index!15135 lt!160673) #b00000000000000000000000000000000) (bvslt (index!15135 lt!160673) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!338538 d!70597))

(declare-fun b!338635 () Bool)

(declare-fun e!207757 () Bool)

(declare-fun e!207756 () Bool)

(assert (=> b!338635 (= e!207757 e!207756)))

(declare-fun lt!160706 () (_ BitVec 64))

(assert (=> b!338635 (= lt!160706 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160707 () Unit!10516)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17737 (_ BitVec 64) (_ BitVec 32)) Unit!10516)

(assert (=> b!338635 (= lt!160707 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160706 #b00000000000000000000000000000000))))

(assert (=> b!338635 (arrayContainsKey!0 _keys!1895 lt!160706 #b00000000000000000000000000000000)))

(declare-fun lt!160705 () Unit!10516)

(assert (=> b!338635 (= lt!160705 lt!160707)))

(declare-fun res!187100 () Bool)

(assert (=> b!338635 (= res!187100 (= (seekEntryOrOpen!0 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3239 #b00000000000000000000000000000000)))))

(assert (=> b!338635 (=> (not res!187100) (not e!207756))))

(declare-fun b!338636 () Bool)

(declare-fun call!26408 () Bool)

(assert (=> b!338636 (= e!207757 call!26408)))

(declare-fun b!338637 () Bool)

(assert (=> b!338637 (= e!207756 call!26408)))

(declare-fun bm!26405 () Bool)

(assert (=> bm!26405 (= call!26408 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70599 () Bool)

(declare-fun res!187099 () Bool)

(declare-fun e!207755 () Bool)

(assert (=> d!70599 (=> res!187099 e!207755)))

(assert (=> d!70599 (= res!187099 (bvsge #b00000000000000000000000000000000 (size!8747 _keys!1895)))))

(assert (=> d!70599 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!207755)))

(declare-fun b!338638 () Bool)

(assert (=> b!338638 (= e!207755 e!207757)))

(declare-fun c!52391 () Bool)

(assert (=> b!338638 (= c!52391 (validKeyInArray!0 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70599 (not res!187099)) b!338638))

(assert (= (and b!338638 c!52391) b!338635))

(assert (= (and b!338638 (not c!52391)) b!338636))

(assert (= (and b!338635 res!187100) b!338637))

(assert (= (or b!338637 b!338636) bm!26405))

(declare-fun m!341311 () Bool)

(assert (=> b!338635 m!341311))

(declare-fun m!341313 () Bool)

(assert (=> b!338635 m!341313))

(declare-fun m!341315 () Bool)

(assert (=> b!338635 m!341315))

(assert (=> b!338635 m!341311))

(declare-fun m!341317 () Bool)

(assert (=> b!338635 m!341317))

(declare-fun m!341319 () Bool)

(assert (=> bm!26405 m!341319))

(assert (=> b!338638 m!341311))

(assert (=> b!338638 m!341311))

(declare-fun m!341321 () Bool)

(assert (=> b!338638 m!341321))

(assert (=> b!338529 d!70599))

(declare-fun d!70601 () Bool)

(declare-fun e!207762 () Bool)

(assert (=> d!70601 e!207762))

(declare-fun res!187103 () Bool)

(assert (=> d!70601 (=> res!187103 e!207762)))

(declare-fun lt!160719 () Bool)

(assert (=> d!70601 (= res!187103 (not lt!160719))))

(declare-fun lt!160716 () Bool)

(assert (=> d!70601 (= lt!160719 lt!160716)))

(declare-fun lt!160717 () Unit!10516)

(declare-fun e!207763 () Unit!10516)

(assert (=> d!70601 (= lt!160717 e!207763)))

(declare-fun c!52394 () Bool)

(assert (=> d!70601 (= c!52394 lt!160716)))

(declare-fun containsKey!319 (List!4776 (_ BitVec 64)) Bool)

(assert (=> d!70601 (= lt!160716 (containsKey!319 (toList!2041 (getCurrentListMap!1547 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70601 (= (contains!2101 (getCurrentListMap!1547 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160719)))

(declare-fun b!338645 () Bool)

(declare-fun lt!160718 () Unit!10516)

(assert (=> b!338645 (= e!207763 lt!160718)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!268 (List!4776 (_ BitVec 64)) Unit!10516)

(assert (=> b!338645 (= lt!160718 (lemmaContainsKeyImpliesGetValueByKeyDefined!268 (toList!2041 (getCurrentListMap!1547 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!333 0))(
  ( (Some!332 (v!5749 V!10419)) (None!331) )
))
(declare-fun isDefined!269 (Option!333) Bool)

(declare-fun getValueByKey!327 (List!4776 (_ BitVec 64)) Option!333)

(assert (=> b!338645 (isDefined!269 (getValueByKey!327 (toList!2041 (getCurrentListMap!1547 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!338646 () Bool)

(declare-fun Unit!10526 () Unit!10516)

(assert (=> b!338646 (= e!207763 Unit!10526)))

(declare-fun b!338647 () Bool)

(assert (=> b!338647 (= e!207762 (isDefined!269 (getValueByKey!327 (toList!2041 (getCurrentListMap!1547 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70601 c!52394) b!338645))

(assert (= (and d!70601 (not c!52394)) b!338646))

(assert (= (and d!70601 (not res!187103)) b!338647))

(declare-fun m!341323 () Bool)

(assert (=> d!70601 m!341323))

(declare-fun m!341325 () Bool)

(assert (=> b!338645 m!341325))

(declare-fun m!341327 () Bool)

(assert (=> b!338645 m!341327))

(assert (=> b!338645 m!341327))

(declare-fun m!341329 () Bool)

(assert (=> b!338645 m!341329))

(assert (=> b!338647 m!341327))

(assert (=> b!338647 m!341327))

(assert (=> b!338647 m!341329))

(assert (=> b!338532 d!70601))

(declare-fun bm!26420 () Bool)

(declare-fun call!26429 () ListLongMap!4051)

(declare-fun call!26426 () ListLongMap!4051)

(assert (=> bm!26420 (= call!26429 call!26426)))

(declare-fun b!338690 () Bool)

(declare-fun e!207798 () Bool)

(declare-fun lt!160773 () ListLongMap!4051)

(declare-fun apply!271 (ListLongMap!4051 (_ BitVec 64)) V!10419)

(assert (=> b!338690 (= e!207798 (= (apply!271 lt!160773 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!338691 () Bool)

(declare-fun e!207791 () ListLongMap!4051)

(declare-fun call!26423 () ListLongMap!4051)

(declare-fun +!724 (ListLongMap!4051 tuple2!5148) ListLongMap!4051)

(assert (=> b!338691 (= e!207791 (+!724 call!26423 (tuple2!5149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!338692 () Bool)

(declare-fun e!207801 () Bool)

(assert (=> b!338692 (= e!207801 (= (apply!271 lt!160773 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!338693 () Bool)

(declare-fun e!207795 () Bool)

(declare-fun call!26427 () Bool)

(assert (=> b!338693 (= e!207795 (not call!26427))))

(declare-fun call!26424 () ListLongMap!4051)

(declare-fun bm!26421 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!587 (array!17737 array!17739 (_ BitVec 32) (_ BitVec 32) V!10419 V!10419 (_ BitVec 32) Int) ListLongMap!4051)

(assert (=> bm!26421 (= call!26424 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!338694 () Bool)

(declare-fun c!52410 () Bool)

(assert (=> b!338694 (= c!52410 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!207790 () ListLongMap!4051)

(declare-fun e!207800 () ListLongMap!4051)

(assert (=> b!338694 (= e!207790 e!207800)))

(declare-fun b!338695 () Bool)

(declare-fun e!207793 () Bool)

(declare-fun get!4571 (ValueCell!3197 V!10419) V!10419)

(declare-fun dynLambda!605 (Int (_ BitVec 64)) V!10419)

(assert (=> b!338695 (= e!207793 (= (apply!271 lt!160773 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000)) (get!4571 (select (arr!8395 _values!1525) #b00000000000000000000000000000000) (dynLambda!605 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!338695 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8748 _values!1525)))))

(assert (=> b!338695 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8747 _keys!1895)))))

(declare-fun b!338696 () Bool)

(declare-fun e!207794 () Bool)

(assert (=> b!338696 (= e!207794 e!207795)))

(declare-fun c!52408 () Bool)

(assert (=> b!338696 (= c!52408 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!338697 () Bool)

(declare-fun e!207802 () Bool)

(assert (=> b!338697 (= e!207802 e!207793)))

(declare-fun res!187130 () Bool)

(assert (=> b!338697 (=> (not res!187130) (not e!207793))))

(assert (=> b!338697 (= res!187130 (contains!2101 lt!160773 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!338697 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8747 _keys!1895)))))

(declare-fun bm!26422 () Bool)

(declare-fun call!26425 () Bool)

(assert (=> bm!26422 (= call!26425 (contains!2101 lt!160773 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!338698 () Bool)

(declare-fun e!207792 () Bool)

(assert (=> b!338698 (= e!207792 (validKeyInArray!0 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338699 () Bool)

(declare-fun call!26428 () ListLongMap!4051)

(assert (=> b!338699 (= e!207800 call!26428)))

(declare-fun d!70603 () Bool)

(assert (=> d!70603 e!207794))

(declare-fun res!187129 () Bool)

(assert (=> d!70603 (=> (not res!187129) (not e!207794))))

(assert (=> d!70603 (= res!187129 (or (bvsge #b00000000000000000000000000000000 (size!8747 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8747 _keys!1895)))))))

(declare-fun lt!160776 () ListLongMap!4051)

(assert (=> d!70603 (= lt!160773 lt!160776)))

(declare-fun lt!160783 () Unit!10516)

(declare-fun e!207796 () Unit!10516)

(assert (=> d!70603 (= lt!160783 e!207796)))

(declare-fun c!52411 () Bool)

(assert (=> d!70603 (= c!52411 e!207792)))

(declare-fun res!187127 () Bool)

(assert (=> d!70603 (=> (not res!187127) (not e!207792))))

(assert (=> d!70603 (= res!187127 (bvslt #b00000000000000000000000000000000 (size!8747 _keys!1895)))))

(assert (=> d!70603 (= lt!160776 e!207791)))

(declare-fun c!52412 () Bool)

(assert (=> d!70603 (= c!52412 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70603 (validMask!0 mask!2385)))

(assert (=> d!70603 (= (getCurrentListMap!1547 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160773)))

(declare-fun bm!26423 () Bool)

(assert (=> bm!26423 (= call!26426 call!26424)))

(declare-fun b!338700 () Bool)

(assert (=> b!338700 (= e!207790 call!26428)))

(declare-fun b!338701 () Bool)

(assert (=> b!338701 (= e!207800 call!26429)))

(declare-fun b!338702 () Bool)

(assert (=> b!338702 (= e!207795 e!207798)))

(declare-fun res!187126 () Bool)

(assert (=> b!338702 (= res!187126 call!26427)))

(assert (=> b!338702 (=> (not res!187126) (not e!207798))))

(declare-fun b!338703 () Bool)

(declare-fun res!187123 () Bool)

(assert (=> b!338703 (=> (not res!187123) (not e!207794))))

(assert (=> b!338703 (= res!187123 e!207802)))

(declare-fun res!187124 () Bool)

(assert (=> b!338703 (=> res!187124 e!207802)))

(declare-fun e!207797 () Bool)

(assert (=> b!338703 (= res!187124 (not e!207797))))

(declare-fun res!187125 () Bool)

(assert (=> b!338703 (=> (not res!187125) (not e!207797))))

(assert (=> b!338703 (= res!187125 (bvslt #b00000000000000000000000000000000 (size!8747 _keys!1895)))))

(declare-fun b!338704 () Bool)

(declare-fun e!207799 () Bool)

(assert (=> b!338704 (= e!207799 e!207801)))

(declare-fun res!187122 () Bool)

(assert (=> b!338704 (= res!187122 call!26425)))

(assert (=> b!338704 (=> (not res!187122) (not e!207801))))

(declare-fun b!338705 () Bool)

(declare-fun lt!160774 () Unit!10516)

(assert (=> b!338705 (= e!207796 lt!160774)))

(declare-fun lt!160764 () ListLongMap!4051)

(assert (=> b!338705 (= lt!160764 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160772 () (_ BitVec 64))

(assert (=> b!338705 (= lt!160772 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160780 () (_ BitVec 64))

(assert (=> b!338705 (= lt!160780 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160775 () Unit!10516)

(declare-fun addStillContains!247 (ListLongMap!4051 (_ BitVec 64) V!10419 (_ BitVec 64)) Unit!10516)

(assert (=> b!338705 (= lt!160775 (addStillContains!247 lt!160764 lt!160772 zeroValue!1467 lt!160780))))

(assert (=> b!338705 (contains!2101 (+!724 lt!160764 (tuple2!5149 lt!160772 zeroValue!1467)) lt!160780)))

(declare-fun lt!160765 () Unit!10516)

(assert (=> b!338705 (= lt!160765 lt!160775)))

(declare-fun lt!160779 () ListLongMap!4051)

(assert (=> b!338705 (= lt!160779 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160767 () (_ BitVec 64))

(assert (=> b!338705 (= lt!160767 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160778 () (_ BitVec 64))

(assert (=> b!338705 (= lt!160778 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160770 () Unit!10516)

(declare-fun addApplyDifferent!247 (ListLongMap!4051 (_ BitVec 64) V!10419 (_ BitVec 64)) Unit!10516)

(assert (=> b!338705 (= lt!160770 (addApplyDifferent!247 lt!160779 lt!160767 minValue!1467 lt!160778))))

(assert (=> b!338705 (= (apply!271 (+!724 lt!160779 (tuple2!5149 lt!160767 minValue!1467)) lt!160778) (apply!271 lt!160779 lt!160778))))

(declare-fun lt!160785 () Unit!10516)

(assert (=> b!338705 (= lt!160785 lt!160770)))

(declare-fun lt!160782 () ListLongMap!4051)

(assert (=> b!338705 (= lt!160782 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160766 () (_ BitVec 64))

(assert (=> b!338705 (= lt!160766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160771 () (_ BitVec 64))

(assert (=> b!338705 (= lt!160771 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160784 () Unit!10516)

(assert (=> b!338705 (= lt!160784 (addApplyDifferent!247 lt!160782 lt!160766 zeroValue!1467 lt!160771))))

(assert (=> b!338705 (= (apply!271 (+!724 lt!160782 (tuple2!5149 lt!160766 zeroValue!1467)) lt!160771) (apply!271 lt!160782 lt!160771))))

(declare-fun lt!160769 () Unit!10516)

(assert (=> b!338705 (= lt!160769 lt!160784)))

(declare-fun lt!160781 () ListLongMap!4051)

(assert (=> b!338705 (= lt!160781 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160768 () (_ BitVec 64))

(assert (=> b!338705 (= lt!160768 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160777 () (_ BitVec 64))

(assert (=> b!338705 (= lt!160777 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!338705 (= lt!160774 (addApplyDifferent!247 lt!160781 lt!160768 minValue!1467 lt!160777))))

(assert (=> b!338705 (= (apply!271 (+!724 lt!160781 (tuple2!5149 lt!160768 minValue!1467)) lt!160777) (apply!271 lt!160781 lt!160777))))

(declare-fun bm!26424 () Bool)

(assert (=> bm!26424 (= call!26427 (contains!2101 lt!160773 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!338706 () Bool)

(declare-fun Unit!10527 () Unit!10516)

(assert (=> b!338706 (= e!207796 Unit!10527)))

(declare-fun b!338707 () Bool)

(assert (=> b!338707 (= e!207797 (validKeyInArray!0 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun c!52407 () Bool)

(declare-fun bm!26425 () Bool)

(assert (=> bm!26425 (= call!26423 (+!724 (ite c!52412 call!26424 (ite c!52407 call!26426 call!26429)) (ite (or c!52412 c!52407) (tuple2!5149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!338708 () Bool)

(assert (=> b!338708 (= e!207799 (not call!26425))))

(declare-fun b!338709 () Bool)

(assert (=> b!338709 (= e!207791 e!207790)))

(assert (=> b!338709 (= c!52407 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26426 () Bool)

(assert (=> bm!26426 (= call!26428 call!26423)))

(declare-fun b!338710 () Bool)

(declare-fun res!187128 () Bool)

(assert (=> b!338710 (=> (not res!187128) (not e!207794))))

(assert (=> b!338710 (= res!187128 e!207799)))

(declare-fun c!52409 () Bool)

(assert (=> b!338710 (= c!52409 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!70603 c!52412) b!338691))

(assert (= (and d!70603 (not c!52412)) b!338709))

(assert (= (and b!338709 c!52407) b!338700))

(assert (= (and b!338709 (not c!52407)) b!338694))

(assert (= (and b!338694 c!52410) b!338699))

(assert (= (and b!338694 (not c!52410)) b!338701))

(assert (= (or b!338699 b!338701) bm!26420))

(assert (= (or b!338700 bm!26420) bm!26423))

(assert (= (or b!338700 b!338699) bm!26426))

(assert (= (or b!338691 bm!26423) bm!26421))

(assert (= (or b!338691 bm!26426) bm!26425))

(assert (= (and d!70603 res!187127) b!338698))

(assert (= (and d!70603 c!52411) b!338705))

(assert (= (and d!70603 (not c!52411)) b!338706))

(assert (= (and d!70603 res!187129) b!338703))

(assert (= (and b!338703 res!187125) b!338707))

(assert (= (and b!338703 (not res!187124)) b!338697))

(assert (= (and b!338697 res!187130) b!338695))

(assert (= (and b!338703 res!187123) b!338710))

(assert (= (and b!338710 c!52409) b!338704))

(assert (= (and b!338710 (not c!52409)) b!338708))

(assert (= (and b!338704 res!187122) b!338692))

(assert (= (or b!338704 b!338708) bm!26422))

(assert (= (and b!338710 res!187128) b!338696))

(assert (= (and b!338696 c!52408) b!338702))

(assert (= (and b!338696 (not c!52408)) b!338693))

(assert (= (and b!338702 res!187126) b!338690))

(assert (= (or b!338702 b!338693) bm!26424))

(declare-fun b_lambda!8405 () Bool)

(assert (=> (not b_lambda!8405) (not b!338695)))

(declare-fun t!9870 () Bool)

(declare-fun tb!3049 () Bool)

(assert (=> (and start!33984 (= defaultEntry!1528 defaultEntry!1528) t!9870) tb!3049))

(declare-fun result!5493 () Bool)

(assert (=> tb!3049 (= result!5493 tp_is_empty!7081)))

(assert (=> b!338695 t!9870))

(declare-fun b_and!14299 () Bool)

(assert (= b_and!14293 (and (=> t!9870 result!5493) b_and!14299)))

(assert (=> d!70603 m!341225))

(assert (=> b!338707 m!341311))

(assert (=> b!338707 m!341311))

(assert (=> b!338707 m!341321))

(declare-fun m!341331 () Bool)

(assert (=> b!338705 m!341331))

(declare-fun m!341333 () Bool)

(assert (=> b!338705 m!341333))

(declare-fun m!341335 () Bool)

(assert (=> b!338705 m!341335))

(assert (=> b!338705 m!341311))

(declare-fun m!341337 () Bool)

(assert (=> b!338705 m!341337))

(declare-fun m!341339 () Bool)

(assert (=> b!338705 m!341339))

(declare-fun m!341341 () Bool)

(assert (=> b!338705 m!341341))

(assert (=> b!338705 m!341335))

(declare-fun m!341343 () Bool)

(assert (=> b!338705 m!341343))

(declare-fun m!341345 () Bool)

(assert (=> b!338705 m!341345))

(declare-fun m!341347 () Bool)

(assert (=> b!338705 m!341347))

(assert (=> b!338705 m!341331))

(declare-fun m!341349 () Bool)

(assert (=> b!338705 m!341349))

(declare-fun m!341351 () Bool)

(assert (=> b!338705 m!341351))

(declare-fun m!341353 () Bool)

(assert (=> b!338705 m!341353))

(assert (=> b!338705 m!341337))

(declare-fun m!341355 () Bool)

(assert (=> b!338705 m!341355))

(declare-fun m!341357 () Bool)

(assert (=> b!338705 m!341357))

(assert (=> b!338705 m!341355))

(declare-fun m!341359 () Bool)

(assert (=> b!338705 m!341359))

(declare-fun m!341361 () Bool)

(assert (=> b!338705 m!341361))

(declare-fun m!341363 () Bool)

(assert (=> bm!26422 m!341363))

(declare-fun m!341365 () Bool)

(assert (=> b!338692 m!341365))

(assert (=> b!338697 m!341311))

(assert (=> b!338697 m!341311))

(declare-fun m!341367 () Bool)

(assert (=> b!338697 m!341367))

(declare-fun m!341369 () Bool)

(assert (=> b!338691 m!341369))

(declare-fun m!341371 () Bool)

(assert (=> bm!26424 m!341371))

(assert (=> b!338698 m!341311))

(assert (=> b!338698 m!341311))

(assert (=> b!338698 m!341321))

(assert (=> b!338695 m!341311))

(declare-fun m!341373 () Bool)

(assert (=> b!338695 m!341373))

(declare-fun m!341375 () Bool)

(assert (=> b!338695 m!341375))

(assert (=> b!338695 m!341373))

(declare-fun m!341377 () Bool)

(assert (=> b!338695 m!341377))

(assert (=> b!338695 m!341375))

(assert (=> b!338695 m!341311))

(declare-fun m!341379 () Bool)

(assert (=> b!338695 m!341379))

(declare-fun m!341381 () Bool)

(assert (=> bm!26425 m!341381))

(assert (=> bm!26421 m!341361))

(declare-fun m!341383 () Bool)

(assert (=> b!338690 m!341383))

(assert (=> b!338532 d!70603))

(declare-fun d!70605 () Bool)

(declare-fun res!187135 () Bool)

(declare-fun e!207807 () Bool)

(assert (=> d!70605 (=> res!187135 e!207807)))

(assert (=> d!70605 (= res!187135 (= (select (arr!8394 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70605 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!207807)))

(declare-fun b!338717 () Bool)

(declare-fun e!207808 () Bool)

(assert (=> b!338717 (= e!207807 e!207808)))

(declare-fun res!187136 () Bool)

(assert (=> b!338717 (=> (not res!187136) (not e!207808))))

(assert (=> b!338717 (= res!187136 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8747 _keys!1895)))))

(declare-fun b!338718 () Bool)

(assert (=> b!338718 (= e!207808 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70605 (not res!187135)) b!338717))

(assert (= (and b!338717 res!187136) b!338718))

(assert (=> d!70605 m!341311))

(declare-fun m!341385 () Bool)

(assert (=> b!338718 m!341385))

(assert (=> b!338537 d!70605))

(declare-fun d!70607 () Bool)

(assert (=> d!70607 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33984 d!70607))

(declare-fun d!70609 () Bool)

(assert (=> d!70609 (= (array_inv!6254 _values!1525) (bvsge (size!8748 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33984 d!70609))

(declare-fun d!70611 () Bool)

(assert (=> d!70611 (= (array_inv!6255 _keys!1895) (bvsge (size!8747 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33984 d!70611))

(declare-fun d!70613 () Bool)

(assert (=> d!70613 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!338541 d!70613))

(declare-fun b!338729 () Bool)

(declare-fun e!207817 () Bool)

(declare-fun contains!2104 (List!4777 (_ BitVec 64)) Bool)

(assert (=> b!338729 (= e!207817 (contains!2104 Nil!4774 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70615 () Bool)

(declare-fun res!187145 () Bool)

(declare-fun e!207820 () Bool)

(assert (=> d!70615 (=> res!187145 e!207820)))

(assert (=> d!70615 (= res!187145 (bvsge #b00000000000000000000000000000000 (size!8747 _keys!1895)))))

(assert (=> d!70615 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4774) e!207820)))

(declare-fun bm!26429 () Bool)

(declare-fun call!26432 () Bool)

(declare-fun c!52415 () Bool)

(assert (=> bm!26429 (= call!26432 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52415 (Cons!4773 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000) Nil!4774) Nil!4774)))))

(declare-fun b!338730 () Bool)

(declare-fun e!207818 () Bool)

(assert (=> b!338730 (= e!207820 e!207818)))

(declare-fun res!187144 () Bool)

(assert (=> b!338730 (=> (not res!187144) (not e!207818))))

(assert (=> b!338730 (= res!187144 (not e!207817))))

(declare-fun res!187143 () Bool)

(assert (=> b!338730 (=> (not res!187143) (not e!207817))))

(assert (=> b!338730 (= res!187143 (validKeyInArray!0 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338731 () Bool)

(declare-fun e!207819 () Bool)

(assert (=> b!338731 (= e!207818 e!207819)))

(assert (=> b!338731 (= c!52415 (validKeyInArray!0 (select (arr!8394 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338732 () Bool)

(assert (=> b!338732 (= e!207819 call!26432)))

(declare-fun b!338733 () Bool)

(assert (=> b!338733 (= e!207819 call!26432)))

(assert (= (and d!70615 (not res!187145)) b!338730))

(assert (= (and b!338730 res!187143) b!338729))

(assert (= (and b!338730 res!187144) b!338731))

(assert (= (and b!338731 c!52415) b!338733))

(assert (= (and b!338731 (not c!52415)) b!338732))

(assert (= (or b!338733 b!338732) bm!26429))

(assert (=> b!338729 m!341311))

(assert (=> b!338729 m!341311))

(declare-fun m!341387 () Bool)

(assert (=> b!338729 m!341387))

(assert (=> bm!26429 m!341311))

(declare-fun m!341389 () Bool)

(assert (=> bm!26429 m!341389))

(assert (=> b!338730 m!341311))

(assert (=> b!338730 m!341311))

(assert (=> b!338730 m!341321))

(assert (=> b!338731 m!341311))

(assert (=> b!338731 m!341311))

(assert (=> b!338731 m!341321))

(assert (=> b!338534 d!70615))

(declare-fun d!70617 () Bool)

(assert (=> d!70617 (contains!2101 (getCurrentListMap!1547 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!160788 () Unit!10516)

(declare-fun choose!1307 (array!17737 array!17739 (_ BitVec 32) (_ BitVec 32) V!10419 V!10419 (_ BitVec 64) (_ BitVec 32) Int) Unit!10516)

(assert (=> d!70617 (= lt!160788 (choose!1307 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70617 (validMask!0 mask!2385)))

(assert (=> d!70617 (= (lemmaArrayContainsKeyThenInListMap!280 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!160788)))

(declare-fun bs!11632 () Bool)

(assert (= bs!11632 d!70617))

(assert (=> bs!11632 m!341247))

(assert (=> bs!11632 m!341247))

(assert (=> bs!11632 m!341249))

(assert (=> bs!11632 m!341237))

(declare-fun m!341391 () Bool)

(assert (=> bs!11632 m!341391))

(assert (=> bs!11632 m!341225))

(assert (=> b!338539 d!70617))

(declare-fun d!70619 () Bool)

(declare-fun lt!160791 () (_ BitVec 32))

(assert (=> d!70619 (and (or (bvslt lt!160791 #b00000000000000000000000000000000) (bvsge lt!160791 (size!8747 _keys!1895)) (and (bvsge lt!160791 #b00000000000000000000000000000000) (bvslt lt!160791 (size!8747 _keys!1895)))) (bvsge lt!160791 #b00000000000000000000000000000000) (bvslt lt!160791 (size!8747 _keys!1895)) (= (select (arr!8394 _keys!1895) lt!160791) k0!1348))))

(declare-fun e!207823 () (_ BitVec 32))

(assert (=> d!70619 (= lt!160791 e!207823)))

(declare-fun c!52418 () Bool)

(assert (=> d!70619 (= c!52418 (= (select (arr!8394 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70619 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8747 _keys!1895)) (bvslt (size!8747 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70619 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!160791)))

(declare-fun b!338738 () Bool)

(assert (=> b!338738 (= e!207823 #b00000000000000000000000000000000)))

(declare-fun b!338739 () Bool)

(assert (=> b!338739 (= e!207823 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70619 c!52418) b!338738))

(assert (= (and d!70619 (not c!52418)) b!338739))

(declare-fun m!341393 () Bool)

(assert (=> d!70619 m!341393))

(assert (=> d!70619 m!341311))

(declare-fun m!341395 () Bool)

(assert (=> b!338739 m!341395))

(assert (=> b!338539 d!70619))

(declare-fun d!70621 () Bool)

(declare-fun lt!160798 () SeekEntryResult!3239)

(assert (=> d!70621 (and (or ((_ is Undefined!3239) lt!160798) (not ((_ is Found!3239) lt!160798)) (and (bvsge (index!15136 lt!160798) #b00000000000000000000000000000000) (bvslt (index!15136 lt!160798) (size!8747 _keys!1895)))) (or ((_ is Undefined!3239) lt!160798) ((_ is Found!3239) lt!160798) (not ((_ is MissingZero!3239) lt!160798)) (and (bvsge (index!15135 lt!160798) #b00000000000000000000000000000000) (bvslt (index!15135 lt!160798) (size!8747 _keys!1895)))) (or ((_ is Undefined!3239) lt!160798) ((_ is Found!3239) lt!160798) ((_ is MissingZero!3239) lt!160798) (not ((_ is MissingVacant!3239) lt!160798)) (and (bvsge (index!15138 lt!160798) #b00000000000000000000000000000000) (bvslt (index!15138 lt!160798) (size!8747 _keys!1895)))) (or ((_ is Undefined!3239) lt!160798) (ite ((_ is Found!3239) lt!160798) (= (select (arr!8394 _keys!1895) (index!15136 lt!160798)) k0!1348) (ite ((_ is MissingZero!3239) lt!160798) (= (select (arr!8394 _keys!1895) (index!15135 lt!160798)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3239) lt!160798) (= (select (arr!8394 _keys!1895) (index!15138 lt!160798)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!207830 () SeekEntryResult!3239)

(assert (=> d!70621 (= lt!160798 e!207830)))

(declare-fun c!52427 () Bool)

(declare-fun lt!160800 () SeekEntryResult!3239)

(assert (=> d!70621 (= c!52427 (and ((_ is Intermediate!3239) lt!160800) (undefined!4051 lt!160800)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17737 (_ BitVec 32)) SeekEntryResult!3239)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70621 (= lt!160800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70621 (validMask!0 mask!2385)))

(assert (=> d!70621 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160798)))

(declare-fun b!338752 () Bool)

(declare-fun e!207831 () SeekEntryResult!3239)

(assert (=> b!338752 (= e!207831 (Found!3239 (index!15137 lt!160800)))))

(declare-fun e!207832 () SeekEntryResult!3239)

(declare-fun b!338753 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17737 (_ BitVec 32)) SeekEntryResult!3239)

(assert (=> b!338753 (= e!207832 (seekKeyOrZeroReturnVacant!0 (x!33746 lt!160800) (index!15137 lt!160800) (index!15137 lt!160800) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338754 () Bool)

(assert (=> b!338754 (= e!207832 (MissingZero!3239 (index!15137 lt!160800)))))

(declare-fun b!338755 () Bool)

(declare-fun c!52426 () Bool)

(declare-fun lt!160799 () (_ BitVec 64))

(assert (=> b!338755 (= c!52426 (= lt!160799 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!338755 (= e!207831 e!207832)))

(declare-fun b!338756 () Bool)

(assert (=> b!338756 (= e!207830 e!207831)))

(assert (=> b!338756 (= lt!160799 (select (arr!8394 _keys!1895) (index!15137 lt!160800)))))

(declare-fun c!52425 () Bool)

(assert (=> b!338756 (= c!52425 (= lt!160799 k0!1348))))

(declare-fun b!338757 () Bool)

(assert (=> b!338757 (= e!207830 Undefined!3239)))

(assert (= (and d!70621 c!52427) b!338757))

(assert (= (and d!70621 (not c!52427)) b!338756))

(assert (= (and b!338756 c!52425) b!338752))

(assert (= (and b!338756 (not c!52425)) b!338755))

(assert (= (and b!338755 c!52426) b!338754))

(assert (= (and b!338755 (not c!52426)) b!338753))

(assert (=> d!70621 m!341225))

(declare-fun m!341397 () Bool)

(assert (=> d!70621 m!341397))

(declare-fun m!341399 () Bool)

(assert (=> d!70621 m!341399))

(declare-fun m!341401 () Bool)

(assert (=> d!70621 m!341401))

(assert (=> d!70621 m!341399))

(declare-fun m!341403 () Bool)

(assert (=> d!70621 m!341403))

(declare-fun m!341405 () Bool)

(assert (=> d!70621 m!341405))

(declare-fun m!341407 () Bool)

(assert (=> b!338753 m!341407))

(declare-fun m!341409 () Bool)

(assert (=> b!338756 m!341409))

(assert (=> b!338531 d!70621))

(declare-fun condMapEmpty!12042 () Bool)

(declare-fun mapDefault!12042 () ValueCell!3197)

(assert (=> mapNonEmpty!12033 (= condMapEmpty!12042 (= mapRest!12033 ((as const (Array (_ BitVec 32) ValueCell!3197)) mapDefault!12042)))))

(declare-fun e!207838 () Bool)

(declare-fun mapRes!12042 () Bool)

(assert (=> mapNonEmpty!12033 (= tp!24905 (and e!207838 mapRes!12042))))

(declare-fun mapIsEmpty!12042 () Bool)

(assert (=> mapIsEmpty!12042 mapRes!12042))

(declare-fun b!338764 () Bool)

(declare-fun e!207837 () Bool)

(assert (=> b!338764 (= e!207837 tp_is_empty!7081)))

(declare-fun mapNonEmpty!12042 () Bool)

(declare-fun tp!24921 () Bool)

(assert (=> mapNonEmpty!12042 (= mapRes!12042 (and tp!24921 e!207837))))

(declare-fun mapValue!12042 () ValueCell!3197)

(declare-fun mapKey!12042 () (_ BitVec 32))

(declare-fun mapRest!12042 () (Array (_ BitVec 32) ValueCell!3197))

(assert (=> mapNonEmpty!12042 (= mapRest!12033 (store mapRest!12042 mapKey!12042 mapValue!12042))))

(declare-fun b!338765 () Bool)

(assert (=> b!338765 (= e!207838 tp_is_empty!7081)))

(assert (= (and mapNonEmpty!12033 condMapEmpty!12042) mapIsEmpty!12042))

(assert (= (and mapNonEmpty!12033 (not condMapEmpty!12042)) mapNonEmpty!12042))

(assert (= (and mapNonEmpty!12042 ((_ is ValueCellFull!3197) mapValue!12042)) b!338764))

(assert (= (and mapNonEmpty!12033 ((_ is ValueCellFull!3197) mapDefault!12042)) b!338765))

(declare-fun m!341411 () Bool)

(assert (=> mapNonEmpty!12042 m!341411))

(declare-fun b_lambda!8407 () Bool)

(assert (= b_lambda!8405 (or (and start!33984 b_free!7129) b_lambda!8407)))

(check-sat (not bm!26429) tp_is_empty!7081 (not d!70617) (not b!338705) (not b_lambda!8407) (not d!70603) (not b!338692) (not b!338635) (not d!70621) (not d!70601) (not b!338638) (not b!338731) (not bm!26424) (not bm!26421) (not b!338697) (not b_next!7129) (not b!338707) (not b!338647) (not b!338729) (not bm!26422) (not b!338690) (not b!338739) (not bm!26425) (not b!338695) b_and!14299 (not b!338691) (not bm!26405) (not b!338698) (not b!338718) (not mapNonEmpty!12042) (not b!338730) (not b!338645) (not b!338753))
(check-sat b_and!14299 (not b_next!7129))
