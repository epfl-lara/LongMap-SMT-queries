; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33910 () Bool)

(assert start!33910)

(declare-fun b_free!7089 () Bool)

(declare-fun b_next!7089 () Bool)

(assert (=> start!33910 (= b_free!7089 (not b_next!7089))))

(declare-fun tp!24780 () Bool)

(declare-fun b_and!14275 () Bool)

(assert (=> start!33910 (= tp!24780 b_and!14275)))

(declare-fun b!337802 () Bool)

(declare-fun e!207270 () Bool)

(declare-fun tp_is_empty!7041 () Bool)

(assert (=> b!337802 (= e!207270 tp_is_empty!7041)))

(declare-fun b!337803 () Bool)

(declare-datatypes ((Unit!10477 0))(
  ( (Unit!10478) )
))
(declare-fun e!207267 () Unit!10477)

(declare-fun Unit!10479 () Unit!10477)

(assert (=> b!337803 (= e!207267 Unit!10479)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun lt!160513 () Unit!10477)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10365 0))(
  ( (V!10366 (val!3565 Int)) )
))
(declare-fun zeroValue!1467 () V!10365)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3177 0))(
  ( (ValueCellFull!3177 (v!5730 V!10365)) (EmptyCell!3177) )
))
(declare-datatypes ((array!17675 0))(
  ( (array!17676 (arr!8365 (Array (_ BitVec 32) ValueCell!3177)) (size!8717 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17675)

(declare-datatypes ((array!17677 0))(
  ( (array!17678 (arr!8366 (Array (_ BitVec 32) (_ BitVec 64))) (size!8718 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17677)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10365)

(declare-fun lemmaArrayContainsKeyThenInListMap!266 (array!17677 array!17675 (_ BitVec 32) (_ BitVec 32) V!10365 V!10365 (_ BitVec 64) (_ BitVec 32) Int) Unit!10477)

(declare-fun arrayScanForKey!0 (array!17677 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337803 (= lt!160513 (lemmaArrayContainsKeyThenInListMap!266 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337803 false))

(declare-fun b!337804 () Bool)

(declare-fun res!186641 () Bool)

(declare-fun e!207268 () Bool)

(assert (=> b!337804 (=> (not res!186641) (not e!207268))))

(declare-datatypes ((List!4792 0))(
  ( (Nil!4789) (Cons!4788 (h!5644 (_ BitVec 64)) (t!9886 List!4792)) )
))
(declare-fun arrayNoDuplicates!0 (array!17677 (_ BitVec 32) List!4792) Bool)

(assert (=> b!337804 (= res!186641 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4789))))

(declare-fun b!337805 () Bool)

(declare-fun res!186638 () Bool)

(assert (=> b!337805 (=> (not res!186638) (not e!207268))))

(assert (=> b!337805 (= res!186638 (and (= (size!8717 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8718 _keys!1895) (size!8717 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337806 () Bool)

(declare-fun res!186640 () Bool)

(assert (=> b!337806 (=> (not res!186640) (not e!207268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337806 (= res!186640 (validKeyInArray!0 k0!1348))))

(declare-fun b!337807 () Bool)

(declare-fun res!186639 () Bool)

(assert (=> b!337807 (=> (not res!186639) (not e!207268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17677 (_ BitVec 32)) Bool)

(assert (=> b!337807 (= res!186639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337808 () Bool)

(declare-fun e!207273 () Bool)

(assert (=> b!337808 (= e!207273 (bvsge #b00000000000000000000000000000000 (size!8718 _keys!1895)))))

(declare-fun lt!160511 () Unit!10477)

(assert (=> b!337808 (= lt!160511 e!207267)))

(declare-fun c!52317 () Bool)

(declare-fun arrayContainsKey!0 (array!17677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337808 (= c!52317 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337809 () Bool)

(declare-fun Unit!10480 () Unit!10477)

(assert (=> b!337809 (= e!207267 Unit!10480)))

(declare-fun mapIsEmpty!11967 () Bool)

(declare-fun mapRes!11967 () Bool)

(assert (=> mapIsEmpty!11967 mapRes!11967))

(declare-fun res!186636 () Bool)

(assert (=> start!33910 (=> (not res!186636) (not e!207268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33910 (= res!186636 (validMask!0 mask!2385))))

(assert (=> start!33910 e!207268))

(assert (=> start!33910 true))

(assert (=> start!33910 tp_is_empty!7041))

(assert (=> start!33910 tp!24780))

(declare-fun e!207272 () Bool)

(declare-fun array_inv!6208 (array!17675) Bool)

(assert (=> start!33910 (and (array_inv!6208 _values!1525) e!207272)))

(declare-fun array_inv!6209 (array!17677) Bool)

(assert (=> start!33910 (array_inv!6209 _keys!1895)))

(declare-fun mapNonEmpty!11967 () Bool)

(declare-fun tp!24779 () Bool)

(declare-fun e!207271 () Bool)

(assert (=> mapNonEmpty!11967 (= mapRes!11967 (and tp!24779 e!207271))))

(declare-fun mapValue!11967 () ValueCell!3177)

(declare-fun mapRest!11967 () (Array (_ BitVec 32) ValueCell!3177))

(declare-fun mapKey!11967 () (_ BitVec 32))

(assert (=> mapNonEmpty!11967 (= (arr!8365 _values!1525) (store mapRest!11967 mapKey!11967 mapValue!11967))))

(declare-fun b!337810 () Bool)

(declare-fun res!186635 () Bool)

(assert (=> b!337810 (=> (not res!186635) (not e!207268))))

(declare-datatypes ((tuple2!5176 0))(
  ( (tuple2!5177 (_1!2599 (_ BitVec 64)) (_2!2599 V!10365)) )
))
(declare-datatypes ((List!4793 0))(
  ( (Nil!4790) (Cons!4789 (h!5645 tuple2!5176) (t!9887 List!4793)) )
))
(declare-datatypes ((ListLongMap!4089 0))(
  ( (ListLongMap!4090 (toList!2060 List!4793)) )
))
(declare-fun contains!2107 (ListLongMap!4089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1581 (array!17677 array!17675 (_ BitVec 32) (_ BitVec 32) V!10365 V!10365 (_ BitVec 32) Int) ListLongMap!4089)

(assert (=> b!337810 (= res!186635 (not (contains!2107 (getCurrentListMap!1581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337811 () Bool)

(assert (=> b!337811 (= e!207271 tp_is_empty!7041)))

(declare-fun b!337812 () Bool)

(assert (=> b!337812 (= e!207268 e!207273)))

(declare-fun res!186637 () Bool)

(assert (=> b!337812 (=> (not res!186637) (not e!207273))))

(declare-datatypes ((SeekEntryResult!3230 0))(
  ( (MissingZero!3230 (index!15099 (_ BitVec 32))) (Found!3230 (index!15100 (_ BitVec 32))) (Intermediate!3230 (undefined!4042 Bool) (index!15101 (_ BitVec 32)) (x!33666 (_ BitVec 32))) (Undefined!3230) (MissingVacant!3230 (index!15102 (_ BitVec 32))) )
))
(declare-fun lt!160512 () SeekEntryResult!3230)

(get-info :version)

(assert (=> b!337812 (= res!186637 (and (not ((_ is Found!3230) lt!160512)) ((_ is MissingZero!3230) lt!160512)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17677 (_ BitVec 32)) SeekEntryResult!3230)

(assert (=> b!337812 (= lt!160512 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337813 () Bool)

(assert (=> b!337813 (= e!207272 (and e!207270 mapRes!11967))))

(declare-fun condMapEmpty!11967 () Bool)

(declare-fun mapDefault!11967 () ValueCell!3177)

(assert (=> b!337813 (= condMapEmpty!11967 (= (arr!8365 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3177)) mapDefault!11967)))))

(assert (= (and start!33910 res!186636) b!337805))

(assert (= (and b!337805 res!186638) b!337807))

(assert (= (and b!337807 res!186639) b!337804))

(assert (= (and b!337804 res!186641) b!337806))

(assert (= (and b!337806 res!186640) b!337810))

(assert (= (and b!337810 res!186635) b!337812))

(assert (= (and b!337812 res!186637) b!337808))

(assert (= (and b!337808 c!52317) b!337803))

(assert (= (and b!337808 (not c!52317)) b!337809))

(assert (= (and b!337813 condMapEmpty!11967) mapIsEmpty!11967))

(assert (= (and b!337813 (not condMapEmpty!11967)) mapNonEmpty!11967))

(assert (= (and mapNonEmpty!11967 ((_ is ValueCellFull!3177) mapValue!11967)) b!337811))

(assert (= (and b!337813 ((_ is ValueCellFull!3177) mapDefault!11967)) b!337802))

(assert (= start!33910 b!337813))

(declare-fun m!341227 () Bool)

(assert (=> b!337803 m!341227))

(assert (=> b!337803 m!341227))

(declare-fun m!341229 () Bool)

(assert (=> b!337803 m!341229))

(declare-fun m!341231 () Bool)

(assert (=> b!337812 m!341231))

(declare-fun m!341233 () Bool)

(assert (=> b!337807 m!341233))

(declare-fun m!341235 () Bool)

(assert (=> b!337808 m!341235))

(declare-fun m!341237 () Bool)

(assert (=> b!337806 m!341237))

(declare-fun m!341239 () Bool)

(assert (=> start!33910 m!341239))

(declare-fun m!341241 () Bool)

(assert (=> start!33910 m!341241))

(declare-fun m!341243 () Bool)

(assert (=> start!33910 m!341243))

(declare-fun m!341245 () Bool)

(assert (=> b!337810 m!341245))

(assert (=> b!337810 m!341245))

(declare-fun m!341247 () Bool)

(assert (=> b!337810 m!341247))

(declare-fun m!341249 () Bool)

(assert (=> mapNonEmpty!11967 m!341249))

(declare-fun m!341251 () Bool)

(assert (=> b!337804 m!341251))

(check-sat (not b!337804) (not b!337808) (not b!337803) (not start!33910) (not b!337812) tp_is_empty!7041 (not mapNonEmpty!11967) (not b!337807) b_and!14275 (not b_next!7089) (not b!337810) (not b!337806))
(check-sat b_and!14275 (not b_next!7089))
(get-model)

(declare-fun d!70741 () Bool)

(assert (=> d!70741 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!337806 d!70741))

(declare-fun d!70743 () Bool)

(declare-fun e!207299 () Bool)

(assert (=> d!70743 e!207299))

(declare-fun res!186665 () Bool)

(assert (=> d!70743 (=> res!186665 e!207299)))

(declare-fun lt!160532 () Bool)

(assert (=> d!70743 (= res!186665 (not lt!160532))))

(declare-fun lt!160531 () Bool)

(assert (=> d!70743 (= lt!160532 lt!160531)))

(declare-fun lt!160534 () Unit!10477)

(declare-fun e!207300 () Unit!10477)

(assert (=> d!70743 (= lt!160534 e!207300)))

(declare-fun c!52323 () Bool)

(assert (=> d!70743 (= c!52323 lt!160531)))

(declare-fun containsKey!319 (List!4793 (_ BitVec 64)) Bool)

(assert (=> d!70743 (= lt!160531 (containsKey!319 (toList!2060 (getCurrentListMap!1581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70743 (= (contains!2107 (getCurrentListMap!1581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160532)))

(declare-fun b!337856 () Bool)

(declare-fun lt!160533 () Unit!10477)

(assert (=> b!337856 (= e!207300 lt!160533)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!267 (List!4793 (_ BitVec 64)) Unit!10477)

(assert (=> b!337856 (= lt!160533 (lemmaContainsKeyImpliesGetValueByKeyDefined!267 (toList!2060 (getCurrentListMap!1581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!333 0))(
  ( (Some!332 (v!5732 V!10365)) (None!331) )
))
(declare-fun isDefined!268 (Option!333) Bool)

(declare-fun getValueByKey!327 (List!4793 (_ BitVec 64)) Option!333)

(assert (=> b!337856 (isDefined!268 (getValueByKey!327 (toList!2060 (getCurrentListMap!1581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!337857 () Bool)

(declare-fun Unit!10485 () Unit!10477)

(assert (=> b!337857 (= e!207300 Unit!10485)))

(declare-fun b!337858 () Bool)

(assert (=> b!337858 (= e!207299 (isDefined!268 (getValueByKey!327 (toList!2060 (getCurrentListMap!1581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70743 c!52323) b!337856))

(assert (= (and d!70743 (not c!52323)) b!337857))

(assert (= (and d!70743 (not res!186665)) b!337858))

(declare-fun m!341279 () Bool)

(assert (=> d!70743 m!341279))

(declare-fun m!341281 () Bool)

(assert (=> b!337856 m!341281))

(declare-fun m!341283 () Bool)

(assert (=> b!337856 m!341283))

(assert (=> b!337856 m!341283))

(declare-fun m!341285 () Bool)

(assert (=> b!337856 m!341285))

(assert (=> b!337858 m!341283))

(assert (=> b!337858 m!341283))

(assert (=> b!337858 m!341285))

(assert (=> b!337810 d!70743))

(declare-fun lt!160587 () ListLongMap!4089)

(declare-fun e!207333 () Bool)

(declare-fun b!337901 () Bool)

(declare-fun apply!269 (ListLongMap!4089 (_ BitVec 64)) V!10365)

(declare-fun get!4561 (ValueCell!3177 V!10365) V!10365)

(declare-fun dynLambda!612 (Int (_ BitVec 64)) V!10365)

(assert (=> b!337901 (= e!207333 (= (apply!269 lt!160587 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000)) (get!4561 (select (arr!8365 _values!1525) #b00000000000000000000000000000000) (dynLambda!612 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!337901 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8717 _values!1525)))))

(assert (=> b!337901 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8718 _keys!1895)))))

(declare-fun b!337902 () Bool)

(declare-fun res!186691 () Bool)

(declare-fun e!207332 () Bool)

(assert (=> b!337902 (=> (not res!186691) (not e!207332))))

(declare-fun e!207336 () Bool)

(assert (=> b!337902 (= res!186691 e!207336)))

(declare-fun res!186688 () Bool)

(assert (=> b!337902 (=> res!186688 e!207336)))

(declare-fun e!207335 () Bool)

(assert (=> b!337902 (= res!186688 (not e!207335))))

(declare-fun res!186692 () Bool)

(assert (=> b!337902 (=> (not res!186692) (not e!207335))))

(assert (=> b!337902 (= res!186692 (bvslt #b00000000000000000000000000000000 (size!8718 _keys!1895)))))

(declare-fun b!337903 () Bool)

(assert (=> b!337903 (= e!207336 e!207333)))

(declare-fun res!186685 () Bool)

(assert (=> b!337903 (=> (not res!186685) (not e!207333))))

(assert (=> b!337903 (= res!186685 (contains!2107 lt!160587 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!337903 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8718 _keys!1895)))))

(declare-fun b!337904 () Bool)

(declare-fun e!207337 () Bool)

(declare-fun e!207339 () Bool)

(assert (=> b!337904 (= e!207337 e!207339)))

(declare-fun res!186689 () Bool)

(declare-fun call!26395 () Bool)

(assert (=> b!337904 (= res!186689 call!26395)))

(assert (=> b!337904 (=> (not res!186689) (not e!207339))))

(declare-fun call!26394 () ListLongMap!4089)

(declare-fun bm!26389 () Bool)

(declare-fun call!26396 () ListLongMap!4089)

(declare-fun c!52337 () Bool)

(declare-fun call!26397 () ListLongMap!4089)

(declare-fun c!52339 () Bool)

(declare-fun call!26398 () ListLongMap!4089)

(declare-fun +!718 (ListLongMap!4089 tuple2!5176) ListLongMap!4089)

(assert (=> bm!26389 (= call!26394 (+!718 (ite c!52337 call!26397 (ite c!52339 call!26396 call!26398)) (ite (or c!52337 c!52339) (tuple2!5177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!337905 () Bool)

(declare-fun e!207329 () Bool)

(assert (=> b!337905 (= e!207329 (validKeyInArray!0 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26390 () Bool)

(declare-fun call!26392 () Bool)

(assert (=> bm!26390 (= call!26392 (contains!2107 lt!160587 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26391 () Bool)

(declare-fun call!26393 () ListLongMap!4089)

(assert (=> bm!26391 (= call!26393 call!26394)))

(declare-fun b!337906 () Bool)

(declare-fun c!52341 () Bool)

(assert (=> b!337906 (= c!52341 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!207328 () ListLongMap!4089)

(declare-fun e!207338 () ListLongMap!4089)

(assert (=> b!337906 (= e!207328 e!207338)))

(declare-fun bm!26392 () Bool)

(assert (=> bm!26392 (= call!26395 (contains!2107 lt!160587 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!337907 () Bool)

(assert (=> b!337907 (= e!207338 call!26398)))

(declare-fun b!337908 () Bool)

(declare-fun e!207327 () Bool)

(declare-fun e!207334 () Bool)

(assert (=> b!337908 (= e!207327 e!207334)))

(declare-fun res!186686 () Bool)

(assert (=> b!337908 (= res!186686 call!26392)))

(assert (=> b!337908 (=> (not res!186686) (not e!207334))))

(declare-fun b!337909 () Bool)

(declare-fun e!207330 () Unit!10477)

(declare-fun Unit!10486 () Unit!10477)

(assert (=> b!337909 (= e!207330 Unit!10486)))

(declare-fun b!337910 () Bool)

(assert (=> b!337910 (= e!207334 (= (apply!269 lt!160587 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!337911 () Bool)

(assert (=> b!337911 (= e!207328 call!26393)))

(declare-fun bm!26393 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!591 (array!17677 array!17675 (_ BitVec 32) (_ BitVec 32) V!10365 V!10365 (_ BitVec 32) Int) ListLongMap!4089)

(assert (=> bm!26393 (= call!26397 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!337912 () Bool)

(assert (=> b!337912 (= e!207339 (= (apply!269 lt!160587 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!337913 () Bool)

(assert (=> b!337913 (= e!207338 call!26393)))

(declare-fun b!337914 () Bool)

(assert (=> b!337914 (= e!207332 e!207327)))

(declare-fun c!52336 () Bool)

(assert (=> b!337914 (= c!52336 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!337915 () Bool)

(declare-fun e!207331 () ListLongMap!4089)

(assert (=> b!337915 (= e!207331 (+!718 call!26394 (tuple2!5177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!337916 () Bool)

(assert (=> b!337916 (= e!207331 e!207328)))

(assert (=> b!337916 (= c!52339 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!337917 () Bool)

(assert (=> b!337917 (= e!207335 (validKeyInArray!0 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26394 () Bool)

(assert (=> bm!26394 (= call!26396 call!26397)))

(declare-fun b!337918 () Bool)

(assert (=> b!337918 (= e!207337 (not call!26395))))

(declare-fun b!337919 () Bool)

(assert (=> b!337919 (= e!207327 (not call!26392))))

(declare-fun b!337920 () Bool)

(declare-fun res!186690 () Bool)

(assert (=> b!337920 (=> (not res!186690) (not e!207332))))

(assert (=> b!337920 (= res!186690 e!207337)))

(declare-fun c!52340 () Bool)

(assert (=> b!337920 (= c!52340 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!337921 () Bool)

(declare-fun lt!160585 () Unit!10477)

(assert (=> b!337921 (= e!207330 lt!160585)))

(declare-fun lt!160596 () ListLongMap!4089)

(assert (=> b!337921 (= lt!160596 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160588 () (_ BitVec 64))

(assert (=> b!337921 (= lt!160588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160586 () (_ BitVec 64))

(assert (=> b!337921 (= lt!160586 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160582 () Unit!10477)

(declare-fun addStillContains!245 (ListLongMap!4089 (_ BitVec 64) V!10365 (_ BitVec 64)) Unit!10477)

(assert (=> b!337921 (= lt!160582 (addStillContains!245 lt!160596 lt!160588 zeroValue!1467 lt!160586))))

(assert (=> b!337921 (contains!2107 (+!718 lt!160596 (tuple2!5177 lt!160588 zeroValue!1467)) lt!160586)))

(declare-fun lt!160579 () Unit!10477)

(assert (=> b!337921 (= lt!160579 lt!160582)))

(declare-fun lt!160589 () ListLongMap!4089)

(assert (=> b!337921 (= lt!160589 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160594 () (_ BitVec 64))

(assert (=> b!337921 (= lt!160594 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160600 () (_ BitVec 64))

(assert (=> b!337921 (= lt!160600 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160581 () Unit!10477)

(declare-fun addApplyDifferent!245 (ListLongMap!4089 (_ BitVec 64) V!10365 (_ BitVec 64)) Unit!10477)

(assert (=> b!337921 (= lt!160581 (addApplyDifferent!245 lt!160589 lt!160594 minValue!1467 lt!160600))))

(assert (=> b!337921 (= (apply!269 (+!718 lt!160589 (tuple2!5177 lt!160594 minValue!1467)) lt!160600) (apply!269 lt!160589 lt!160600))))

(declare-fun lt!160599 () Unit!10477)

(assert (=> b!337921 (= lt!160599 lt!160581)))

(declare-fun lt!160584 () ListLongMap!4089)

(assert (=> b!337921 (= lt!160584 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160583 () (_ BitVec 64))

(assert (=> b!337921 (= lt!160583 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160592 () (_ BitVec 64))

(assert (=> b!337921 (= lt!160592 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160595 () Unit!10477)

(assert (=> b!337921 (= lt!160595 (addApplyDifferent!245 lt!160584 lt!160583 zeroValue!1467 lt!160592))))

(assert (=> b!337921 (= (apply!269 (+!718 lt!160584 (tuple2!5177 lt!160583 zeroValue!1467)) lt!160592) (apply!269 lt!160584 lt!160592))))

(declare-fun lt!160580 () Unit!10477)

(assert (=> b!337921 (= lt!160580 lt!160595)))

(declare-fun lt!160598 () ListLongMap!4089)

(assert (=> b!337921 (= lt!160598 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160597 () (_ BitVec 64))

(assert (=> b!337921 (= lt!160597 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160590 () (_ BitVec 64))

(assert (=> b!337921 (= lt!160590 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!337921 (= lt!160585 (addApplyDifferent!245 lt!160598 lt!160597 minValue!1467 lt!160590))))

(assert (=> b!337921 (= (apply!269 (+!718 lt!160598 (tuple2!5177 lt!160597 minValue!1467)) lt!160590) (apply!269 lt!160598 lt!160590))))

(declare-fun d!70745 () Bool)

(assert (=> d!70745 e!207332))

(declare-fun res!186687 () Bool)

(assert (=> d!70745 (=> (not res!186687) (not e!207332))))

(assert (=> d!70745 (= res!186687 (or (bvsge #b00000000000000000000000000000000 (size!8718 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8718 _keys!1895)))))))

(declare-fun lt!160591 () ListLongMap!4089)

(assert (=> d!70745 (= lt!160587 lt!160591)))

(declare-fun lt!160593 () Unit!10477)

(assert (=> d!70745 (= lt!160593 e!207330)))

(declare-fun c!52338 () Bool)

(assert (=> d!70745 (= c!52338 e!207329)))

(declare-fun res!186684 () Bool)

(assert (=> d!70745 (=> (not res!186684) (not e!207329))))

(assert (=> d!70745 (= res!186684 (bvslt #b00000000000000000000000000000000 (size!8718 _keys!1895)))))

(assert (=> d!70745 (= lt!160591 e!207331)))

(assert (=> d!70745 (= c!52337 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70745 (validMask!0 mask!2385)))

(assert (=> d!70745 (= (getCurrentListMap!1581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160587)))

(declare-fun bm!26395 () Bool)

(assert (=> bm!26395 (= call!26398 call!26396)))

(assert (= (and d!70745 c!52337) b!337915))

(assert (= (and d!70745 (not c!52337)) b!337916))

(assert (= (and b!337916 c!52339) b!337911))

(assert (= (and b!337916 (not c!52339)) b!337906))

(assert (= (and b!337906 c!52341) b!337913))

(assert (= (and b!337906 (not c!52341)) b!337907))

(assert (= (or b!337913 b!337907) bm!26395))

(assert (= (or b!337911 bm!26395) bm!26394))

(assert (= (or b!337911 b!337913) bm!26391))

(assert (= (or b!337915 bm!26394) bm!26393))

(assert (= (or b!337915 bm!26391) bm!26389))

(assert (= (and d!70745 res!186684) b!337905))

(assert (= (and d!70745 c!52338) b!337921))

(assert (= (and d!70745 (not c!52338)) b!337909))

(assert (= (and d!70745 res!186687) b!337902))

(assert (= (and b!337902 res!186692) b!337917))

(assert (= (and b!337902 (not res!186688)) b!337903))

(assert (= (and b!337903 res!186685) b!337901))

(assert (= (and b!337902 res!186691) b!337920))

(assert (= (and b!337920 c!52340) b!337904))

(assert (= (and b!337920 (not c!52340)) b!337918))

(assert (= (and b!337904 res!186689) b!337912))

(assert (= (or b!337904 b!337918) bm!26392))

(assert (= (and b!337920 res!186690) b!337914))

(assert (= (and b!337914 c!52336) b!337908))

(assert (= (and b!337914 (not c!52336)) b!337919))

(assert (= (and b!337908 res!186686) b!337910))

(assert (= (or b!337908 b!337919) bm!26390))

(declare-fun b_lambda!8415 () Bool)

(assert (=> (not b_lambda!8415) (not b!337901)))

(declare-fun t!9891 () Bool)

(declare-fun tb!3053 () Bool)

(assert (=> (and start!33910 (= defaultEntry!1528 defaultEntry!1528) t!9891) tb!3053))

(declare-fun result!5489 () Bool)

(assert (=> tb!3053 (= result!5489 tp_is_empty!7041)))

(assert (=> b!337901 t!9891))

(declare-fun b_and!14279 () Bool)

(assert (= b_and!14275 (and (=> t!9891 result!5489) b_and!14279)))

(declare-fun m!341287 () Bool)

(assert (=> bm!26392 m!341287))

(declare-fun m!341289 () Bool)

(assert (=> b!337915 m!341289))

(declare-fun m!341291 () Bool)

(assert (=> bm!26389 m!341291))

(declare-fun m!341293 () Bool)

(assert (=> b!337917 m!341293))

(assert (=> b!337917 m!341293))

(declare-fun m!341295 () Bool)

(assert (=> b!337917 m!341295))

(assert (=> d!70745 m!341239))

(declare-fun m!341297 () Bool)

(assert (=> bm!26390 m!341297))

(declare-fun m!341299 () Bool)

(assert (=> b!337912 m!341299))

(declare-fun m!341301 () Bool)

(assert (=> b!337901 m!341301))

(assert (=> b!337901 m!341293))

(declare-fun m!341303 () Bool)

(assert (=> b!337901 m!341303))

(assert (=> b!337901 m!341293))

(declare-fun m!341305 () Bool)

(assert (=> b!337901 m!341305))

(assert (=> b!337901 m!341301))

(declare-fun m!341307 () Bool)

(assert (=> b!337901 m!341307))

(assert (=> b!337901 m!341305))

(assert (=> b!337905 m!341293))

(assert (=> b!337905 m!341293))

(assert (=> b!337905 m!341295))

(declare-fun m!341309 () Bool)

(assert (=> b!337921 m!341309))

(declare-fun m!341311 () Bool)

(assert (=> b!337921 m!341311))

(declare-fun m!341313 () Bool)

(assert (=> b!337921 m!341313))

(declare-fun m!341315 () Bool)

(assert (=> b!337921 m!341315))

(assert (=> b!337921 m!341309))

(declare-fun m!341317 () Bool)

(assert (=> b!337921 m!341317))

(declare-fun m!341319 () Bool)

(assert (=> b!337921 m!341319))

(declare-fun m!341321 () Bool)

(assert (=> b!337921 m!341321))

(declare-fun m!341323 () Bool)

(assert (=> b!337921 m!341323))

(declare-fun m!341325 () Bool)

(assert (=> b!337921 m!341325))

(declare-fun m!341327 () Bool)

(assert (=> b!337921 m!341327))

(assert (=> b!337921 m!341323))

(declare-fun m!341329 () Bool)

(assert (=> b!337921 m!341329))

(assert (=> b!337921 m!341329))

(declare-fun m!341331 () Bool)

(assert (=> b!337921 m!341331))

(assert (=> b!337921 m!341319))

(declare-fun m!341333 () Bool)

(assert (=> b!337921 m!341333))

(declare-fun m!341335 () Bool)

(assert (=> b!337921 m!341335))

(assert (=> b!337921 m!341293))

(declare-fun m!341337 () Bool)

(assert (=> b!337921 m!341337))

(declare-fun m!341339 () Bool)

(assert (=> b!337921 m!341339))

(declare-fun m!341341 () Bool)

(assert (=> b!337910 m!341341))

(assert (=> b!337903 m!341293))

(assert (=> b!337903 m!341293))

(declare-fun m!341343 () Bool)

(assert (=> b!337903 m!341343))

(assert (=> bm!26393 m!341337))

(assert (=> b!337810 d!70745))

(declare-fun d!70747 () Bool)

(assert (=> d!70747 (contains!2107 (getCurrentListMap!1581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!160603 () Unit!10477)

(declare-fun choose!1298 (array!17677 array!17675 (_ BitVec 32) (_ BitVec 32) V!10365 V!10365 (_ BitVec 64) (_ BitVec 32) Int) Unit!10477)

(assert (=> d!70747 (= lt!160603 (choose!1298 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70747 (validMask!0 mask!2385)))

(assert (=> d!70747 (= (lemmaArrayContainsKeyThenInListMap!266 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!160603)))

(declare-fun bs!11639 () Bool)

(assert (= bs!11639 d!70747))

(assert (=> bs!11639 m!341245))

(assert (=> bs!11639 m!341245))

(assert (=> bs!11639 m!341247))

(assert (=> bs!11639 m!341227))

(declare-fun m!341345 () Bool)

(assert (=> bs!11639 m!341345))

(assert (=> bs!11639 m!341239))

(assert (=> b!337803 d!70747))

(declare-fun d!70749 () Bool)

(declare-fun lt!160606 () (_ BitVec 32))

(assert (=> d!70749 (and (or (bvslt lt!160606 #b00000000000000000000000000000000) (bvsge lt!160606 (size!8718 _keys!1895)) (and (bvsge lt!160606 #b00000000000000000000000000000000) (bvslt lt!160606 (size!8718 _keys!1895)))) (bvsge lt!160606 #b00000000000000000000000000000000) (bvslt lt!160606 (size!8718 _keys!1895)) (= (select (arr!8366 _keys!1895) lt!160606) k0!1348))))

(declare-fun e!207342 () (_ BitVec 32))

(assert (=> d!70749 (= lt!160606 e!207342)))

(declare-fun c!52344 () Bool)

(assert (=> d!70749 (= c!52344 (= (select (arr!8366 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70749 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8718 _keys!1895)) (bvslt (size!8718 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70749 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!160606)))

(declare-fun b!337928 () Bool)

(assert (=> b!337928 (= e!207342 #b00000000000000000000000000000000)))

(declare-fun b!337929 () Bool)

(assert (=> b!337929 (= e!207342 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70749 c!52344) b!337928))

(assert (= (and d!70749 (not c!52344)) b!337929))

(declare-fun m!341347 () Bool)

(assert (=> d!70749 m!341347))

(assert (=> d!70749 m!341293))

(declare-fun m!341349 () Bool)

(assert (=> b!337929 m!341349))

(assert (=> b!337803 d!70749))

(declare-fun b!337938 () Bool)

(declare-fun e!207351 () Bool)

(declare-fun e!207350 () Bool)

(assert (=> b!337938 (= e!207351 e!207350)))

(declare-fun lt!160615 () (_ BitVec 64))

(assert (=> b!337938 (= lt!160615 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160614 () Unit!10477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17677 (_ BitVec 64) (_ BitVec 32)) Unit!10477)

(assert (=> b!337938 (= lt!160614 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160615 #b00000000000000000000000000000000))))

(assert (=> b!337938 (arrayContainsKey!0 _keys!1895 lt!160615 #b00000000000000000000000000000000)))

(declare-fun lt!160613 () Unit!10477)

(assert (=> b!337938 (= lt!160613 lt!160614)))

(declare-fun res!186697 () Bool)

(assert (=> b!337938 (= res!186697 (= (seekEntryOrOpen!0 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3230 #b00000000000000000000000000000000)))))

(assert (=> b!337938 (=> (not res!186697) (not e!207350))))

(declare-fun b!337939 () Bool)

(declare-fun e!207349 () Bool)

(assert (=> b!337939 (= e!207349 e!207351)))

(declare-fun c!52347 () Bool)

(assert (=> b!337939 (= c!52347 (validKeyInArray!0 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26398 () Bool)

(declare-fun call!26401 () Bool)

(assert (=> bm!26398 (= call!26401 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!337940 () Bool)

(assert (=> b!337940 (= e!207350 call!26401)))

(declare-fun d!70751 () Bool)

(declare-fun res!186698 () Bool)

(assert (=> d!70751 (=> res!186698 e!207349)))

(assert (=> d!70751 (= res!186698 (bvsge #b00000000000000000000000000000000 (size!8718 _keys!1895)))))

(assert (=> d!70751 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!207349)))

(declare-fun b!337941 () Bool)

(assert (=> b!337941 (= e!207351 call!26401)))

(assert (= (and d!70751 (not res!186698)) b!337939))

(assert (= (and b!337939 c!52347) b!337938))

(assert (= (and b!337939 (not c!52347)) b!337941))

(assert (= (and b!337938 res!186697) b!337940))

(assert (= (or b!337940 b!337941) bm!26398))

(assert (=> b!337938 m!341293))

(declare-fun m!341351 () Bool)

(assert (=> b!337938 m!341351))

(declare-fun m!341353 () Bool)

(assert (=> b!337938 m!341353))

(assert (=> b!337938 m!341293))

(declare-fun m!341355 () Bool)

(assert (=> b!337938 m!341355))

(assert (=> b!337939 m!341293))

(assert (=> b!337939 m!341293))

(assert (=> b!337939 m!341295))

(declare-fun m!341357 () Bool)

(assert (=> bm!26398 m!341357))

(assert (=> b!337807 d!70751))

(declare-fun d!70753 () Bool)

(declare-fun res!186703 () Bool)

(declare-fun e!207356 () Bool)

(assert (=> d!70753 (=> res!186703 e!207356)))

(assert (=> d!70753 (= res!186703 (= (select (arr!8366 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70753 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!207356)))

(declare-fun b!337946 () Bool)

(declare-fun e!207357 () Bool)

(assert (=> b!337946 (= e!207356 e!207357)))

(declare-fun res!186704 () Bool)

(assert (=> b!337946 (=> (not res!186704) (not e!207357))))

(assert (=> b!337946 (= res!186704 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8718 _keys!1895)))))

(declare-fun b!337947 () Bool)

(assert (=> b!337947 (= e!207357 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70753 (not res!186703)) b!337946))

(assert (= (and b!337946 res!186704) b!337947))

(assert (=> d!70753 m!341293))

(declare-fun m!341359 () Bool)

(assert (=> b!337947 m!341359))

(assert (=> b!337808 d!70753))

(declare-fun b!337960 () Bool)

(declare-fun e!207364 () SeekEntryResult!3230)

(assert (=> b!337960 (= e!207364 Undefined!3230)))

(declare-fun b!337961 () Bool)

(declare-fun e!207365 () SeekEntryResult!3230)

(declare-fun lt!160624 () SeekEntryResult!3230)

(assert (=> b!337961 (= e!207365 (MissingZero!3230 (index!15101 lt!160624)))))

(declare-fun b!337962 () Bool)

(declare-fun c!52356 () Bool)

(declare-fun lt!160622 () (_ BitVec 64))

(assert (=> b!337962 (= c!52356 (= lt!160622 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!207366 () SeekEntryResult!3230)

(assert (=> b!337962 (= e!207366 e!207365)))

(declare-fun b!337963 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17677 (_ BitVec 32)) SeekEntryResult!3230)

(assert (=> b!337963 (= e!207365 (seekKeyOrZeroReturnVacant!0 (x!33666 lt!160624) (index!15101 lt!160624) (index!15101 lt!160624) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337964 () Bool)

(assert (=> b!337964 (= e!207364 e!207366)))

(assert (=> b!337964 (= lt!160622 (select (arr!8366 _keys!1895) (index!15101 lt!160624)))))

(declare-fun c!52355 () Bool)

(assert (=> b!337964 (= c!52355 (= lt!160622 k0!1348))))

(declare-fun b!337965 () Bool)

(assert (=> b!337965 (= e!207366 (Found!3230 (index!15101 lt!160624)))))

(declare-fun d!70755 () Bool)

(declare-fun lt!160623 () SeekEntryResult!3230)

(assert (=> d!70755 (and (or ((_ is Undefined!3230) lt!160623) (not ((_ is Found!3230) lt!160623)) (and (bvsge (index!15100 lt!160623) #b00000000000000000000000000000000) (bvslt (index!15100 lt!160623) (size!8718 _keys!1895)))) (or ((_ is Undefined!3230) lt!160623) ((_ is Found!3230) lt!160623) (not ((_ is MissingZero!3230) lt!160623)) (and (bvsge (index!15099 lt!160623) #b00000000000000000000000000000000) (bvslt (index!15099 lt!160623) (size!8718 _keys!1895)))) (or ((_ is Undefined!3230) lt!160623) ((_ is Found!3230) lt!160623) ((_ is MissingZero!3230) lt!160623) (not ((_ is MissingVacant!3230) lt!160623)) (and (bvsge (index!15102 lt!160623) #b00000000000000000000000000000000) (bvslt (index!15102 lt!160623) (size!8718 _keys!1895)))) (or ((_ is Undefined!3230) lt!160623) (ite ((_ is Found!3230) lt!160623) (= (select (arr!8366 _keys!1895) (index!15100 lt!160623)) k0!1348) (ite ((_ is MissingZero!3230) lt!160623) (= (select (arr!8366 _keys!1895) (index!15099 lt!160623)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3230) lt!160623) (= (select (arr!8366 _keys!1895) (index!15102 lt!160623)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70755 (= lt!160623 e!207364)))

(declare-fun c!52354 () Bool)

(assert (=> d!70755 (= c!52354 (and ((_ is Intermediate!3230) lt!160624) (undefined!4042 lt!160624)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17677 (_ BitVec 32)) SeekEntryResult!3230)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70755 (= lt!160624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70755 (validMask!0 mask!2385)))

(assert (=> d!70755 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160623)))

(assert (= (and d!70755 c!52354) b!337960))

(assert (= (and d!70755 (not c!52354)) b!337964))

(assert (= (and b!337964 c!52355) b!337965))

(assert (= (and b!337964 (not c!52355)) b!337962))

(assert (= (and b!337962 c!52356) b!337961))

(assert (= (and b!337962 (not c!52356)) b!337963))

(declare-fun m!341361 () Bool)

(assert (=> b!337963 m!341361))

(declare-fun m!341363 () Bool)

(assert (=> b!337964 m!341363))

(declare-fun m!341365 () Bool)

(assert (=> d!70755 m!341365))

(assert (=> d!70755 m!341239))

(declare-fun m!341367 () Bool)

(assert (=> d!70755 m!341367))

(declare-fun m!341369 () Bool)

(assert (=> d!70755 m!341369))

(declare-fun m!341371 () Bool)

(assert (=> d!70755 m!341371))

(assert (=> d!70755 m!341369))

(declare-fun m!341373 () Bool)

(assert (=> d!70755 m!341373))

(assert (=> b!337812 d!70755))

(declare-fun b!337976 () Bool)

(declare-fun e!207376 () Bool)

(declare-fun e!207377 () Bool)

(assert (=> b!337976 (= e!207376 e!207377)))

(declare-fun c!52359 () Bool)

(assert (=> b!337976 (= c!52359 (validKeyInArray!0 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!337977 () Bool)

(declare-fun e!207378 () Bool)

(declare-fun contains!2109 (List!4792 (_ BitVec 64)) Bool)

(assert (=> b!337977 (= e!207378 (contains!2109 Nil!4789 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!337978 () Bool)

(declare-fun e!207375 () Bool)

(assert (=> b!337978 (= e!207375 e!207376)))

(declare-fun res!186711 () Bool)

(assert (=> b!337978 (=> (not res!186711) (not e!207376))))

(assert (=> b!337978 (= res!186711 (not e!207378))))

(declare-fun res!186712 () Bool)

(assert (=> b!337978 (=> (not res!186712) (not e!207378))))

(assert (=> b!337978 (= res!186712 (validKeyInArray!0 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70757 () Bool)

(declare-fun res!186713 () Bool)

(assert (=> d!70757 (=> res!186713 e!207375)))

(assert (=> d!70757 (= res!186713 (bvsge #b00000000000000000000000000000000 (size!8718 _keys!1895)))))

(assert (=> d!70757 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4789) e!207375)))

(declare-fun b!337979 () Bool)

(declare-fun call!26404 () Bool)

(assert (=> b!337979 (= e!207377 call!26404)))

(declare-fun bm!26401 () Bool)

(assert (=> bm!26401 (= call!26404 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52359 (Cons!4788 (select (arr!8366 _keys!1895) #b00000000000000000000000000000000) Nil!4789) Nil!4789)))))

(declare-fun b!337980 () Bool)

(assert (=> b!337980 (= e!207377 call!26404)))

(assert (= (and d!70757 (not res!186713)) b!337978))

(assert (= (and b!337978 res!186712) b!337977))

(assert (= (and b!337978 res!186711) b!337976))

(assert (= (and b!337976 c!52359) b!337980))

(assert (= (and b!337976 (not c!52359)) b!337979))

(assert (= (or b!337980 b!337979) bm!26401))

(assert (=> b!337976 m!341293))

(assert (=> b!337976 m!341293))

(assert (=> b!337976 m!341295))

(assert (=> b!337977 m!341293))

(assert (=> b!337977 m!341293))

(declare-fun m!341375 () Bool)

(assert (=> b!337977 m!341375))

(assert (=> b!337978 m!341293))

(assert (=> b!337978 m!341293))

(assert (=> b!337978 m!341295))

(assert (=> bm!26401 m!341293))

(declare-fun m!341377 () Bool)

(assert (=> bm!26401 m!341377))

(assert (=> b!337804 d!70757))

(declare-fun d!70759 () Bool)

(assert (=> d!70759 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33910 d!70759))

(declare-fun d!70761 () Bool)

(assert (=> d!70761 (= (array_inv!6208 _values!1525) (bvsge (size!8717 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33910 d!70761))

(declare-fun d!70763 () Bool)

(assert (=> d!70763 (= (array_inv!6209 _keys!1895) (bvsge (size!8718 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33910 d!70763))

(declare-fun mapIsEmpty!11973 () Bool)

(declare-fun mapRes!11973 () Bool)

(assert (=> mapIsEmpty!11973 mapRes!11973))

(declare-fun mapNonEmpty!11973 () Bool)

(declare-fun tp!24789 () Bool)

(declare-fun e!207384 () Bool)

(assert (=> mapNonEmpty!11973 (= mapRes!11973 (and tp!24789 e!207384))))

(declare-fun mapKey!11973 () (_ BitVec 32))

(declare-fun mapRest!11973 () (Array (_ BitVec 32) ValueCell!3177))

(declare-fun mapValue!11973 () ValueCell!3177)

(assert (=> mapNonEmpty!11973 (= mapRest!11967 (store mapRest!11973 mapKey!11973 mapValue!11973))))

(declare-fun b!337987 () Bool)

(assert (=> b!337987 (= e!207384 tp_is_empty!7041)))

(declare-fun b!337988 () Bool)

(declare-fun e!207383 () Bool)

(assert (=> b!337988 (= e!207383 tp_is_empty!7041)))

(declare-fun condMapEmpty!11973 () Bool)

(declare-fun mapDefault!11973 () ValueCell!3177)

(assert (=> mapNonEmpty!11967 (= condMapEmpty!11973 (= mapRest!11967 ((as const (Array (_ BitVec 32) ValueCell!3177)) mapDefault!11973)))))

(assert (=> mapNonEmpty!11967 (= tp!24779 (and e!207383 mapRes!11973))))

(assert (= (and mapNonEmpty!11967 condMapEmpty!11973) mapIsEmpty!11973))

(assert (= (and mapNonEmpty!11967 (not condMapEmpty!11973)) mapNonEmpty!11973))

(assert (= (and mapNonEmpty!11973 ((_ is ValueCellFull!3177) mapValue!11973)) b!337987))

(assert (= (and mapNonEmpty!11967 ((_ is ValueCellFull!3177) mapDefault!11973)) b!337988))

(declare-fun m!341379 () Bool)

(assert (=> mapNonEmpty!11973 m!341379))

(declare-fun b_lambda!8417 () Bool)

(assert (= b_lambda!8415 (or (and start!33910 b_free!7089) b_lambda!8417)))

(check-sat (not b!337910) (not b!337939) b_and!14279 (not bm!26389) (not b!337903) (not b!337938) (not b!337976) tp_is_empty!7041 (not b!337901) (not b!337963) (not bm!26390) (not bm!26393) (not bm!26398) (not b!337905) (not b!337929) (not mapNonEmpty!11973) (not b_lambda!8417) (not b!337917) (not bm!26392) (not b_next!7089) (not d!70755) (not b!337947) (not b!337978) (not d!70747) (not b!337858) (not bm!26401) (not b!337921) (not d!70743) (not b!337977) (not b!337915) (not b!337856) (not d!70745) (not b!337912))
(check-sat b_and!14279 (not b_next!7089))
