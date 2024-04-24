; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34642 () Bool)

(assert start!34642)

(declare-fun b_free!7483 () Bool)

(declare-fun b_next!7483 () Bool)

(assert (=> start!34642 (= b_free!7483 (not b_next!7483))))

(declare-fun tp!26009 () Bool)

(declare-fun b_and!14715 () Bool)

(assert (=> start!34642 (= tp!26009 b_and!14715)))

(declare-fun mapIsEmpty!12606 () Bool)

(declare-fun mapRes!12606 () Bool)

(assert (=> mapIsEmpty!12606 mapRes!12606))

(declare-fun b!346217 () Bool)

(declare-fun e!212198 () Bool)

(declare-fun tp_is_empty!7435 () Bool)

(assert (=> b!346217 (= e!212198 tp_is_empty!7435)))

(declare-fun b!346218 () Bool)

(declare-fun e!212195 () Bool)

(declare-datatypes ((SeekEntryResult!3323 0))(
  ( (MissingZero!3323 (index!15471 (_ BitVec 32))) (Found!3323 (index!15472 (_ BitVec 32))) (Intermediate!3323 (undefined!4135 Bool) (index!15473 (_ BitVec 32)) (x!34444 (_ BitVec 32))) (Undefined!3323) (MissingVacant!3323 (index!15474 (_ BitVec 32))) )
))
(declare-fun lt!163297 () SeekEntryResult!3323)

(declare-datatypes ((array!18456 0))(
  ( (array!18457 (arr!8739 (Array (_ BitVec 32) (_ BitVec 64))) (size!9091 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18456)

(assert (=> b!346218 (= e!212195 (and (bvsge (index!15472 lt!163297) #b00000000000000000000000000000000) (bvslt (index!15472 lt!163297) (size!9091 _keys!1895)) (bvsge (size!9091 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!346219 () Bool)

(declare-fun res!191527 () Bool)

(declare-fun e!212197 () Bool)

(assert (=> b!346219 (=> (not res!191527) (not e!212197))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18456 (_ BitVec 32)) Bool)

(assert (=> b!346219 (= res!191527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346220 () Bool)

(declare-fun e!212193 () Bool)

(declare-fun e!212196 () Bool)

(assert (=> b!346220 (= e!212193 (and e!212196 mapRes!12606))))

(declare-fun condMapEmpty!12606 () Bool)

(declare-datatypes ((V!10891 0))(
  ( (V!10892 (val!3762 Int)) )
))
(declare-datatypes ((ValueCell!3374 0))(
  ( (ValueCellFull!3374 (v!5944 V!10891)) (EmptyCell!3374) )
))
(declare-datatypes ((array!18458 0))(
  ( (array!18459 (arr!8740 (Array (_ BitVec 32) ValueCell!3374)) (size!9092 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18458)

(declare-fun mapDefault!12606 () ValueCell!3374)

(assert (=> b!346220 (= condMapEmpty!12606 (= (arr!8740 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3374)) mapDefault!12606)))))

(declare-fun res!191531 () Bool)

(assert (=> start!34642 (=> (not res!191531) (not e!212197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34642 (= res!191531 (validMask!0 mask!2385))))

(assert (=> start!34642 e!212197))

(assert (=> start!34642 true))

(assert (=> start!34642 tp_is_empty!7435))

(assert (=> start!34642 tp!26009))

(declare-fun array_inv!6458 (array!18458) Bool)

(assert (=> start!34642 (and (array_inv!6458 _values!1525) e!212193)))

(declare-fun array_inv!6459 (array!18456) Bool)

(assert (=> start!34642 (array_inv!6459 _keys!1895)))

(declare-fun b!346221 () Bool)

(declare-fun res!191533 () Bool)

(assert (=> b!346221 (=> (not res!191533) (not e!212197))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346221 (= res!191533 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12606 () Bool)

(declare-fun tp!26010 () Bool)

(assert (=> mapNonEmpty!12606 (= mapRes!12606 (and tp!26010 e!212198))))

(declare-fun mapValue!12606 () ValueCell!3374)

(declare-fun mapRest!12606 () (Array (_ BitVec 32) ValueCell!3374))

(declare-fun mapKey!12606 () (_ BitVec 32))

(assert (=> mapNonEmpty!12606 (= (arr!8740 _values!1525) (store mapRest!12606 mapKey!12606 mapValue!12606))))

(declare-fun b!346222 () Bool)

(declare-fun res!191530 () Bool)

(assert (=> b!346222 (=> (not res!191530) (not e!212195))))

(declare-fun arrayContainsKey!0 (array!18456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346222 (= res!191530 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15472 lt!163297)))))

(declare-fun b!346223 () Bool)

(assert (=> b!346223 (= e!212196 tp_is_empty!7435)))

(declare-fun b!346224 () Bool)

(assert (=> b!346224 (= e!212197 e!212195)))

(declare-fun res!191529 () Bool)

(assert (=> b!346224 (=> (not res!191529) (not e!212195))))

(get-info :version)

(assert (=> b!346224 (= res!191529 (and ((_ is Found!3323) lt!163297) (= (select (arr!8739 _keys!1895) (index!15472 lt!163297)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18456 (_ BitVec 32)) SeekEntryResult!3323)

(assert (=> b!346224 (= lt!163297 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346225 () Bool)

(declare-fun res!191528 () Bool)

(assert (=> b!346225 (=> (not res!191528) (not e!212197))))

(declare-datatypes ((List!4966 0))(
  ( (Nil!4963) (Cons!4962 (h!5818 (_ BitVec 64)) (t!10084 List!4966)) )
))
(declare-fun arrayNoDuplicates!0 (array!18456 (_ BitVec 32) List!4966) Bool)

(assert (=> b!346225 (= res!191528 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4963))))

(declare-fun b!346226 () Bool)

(declare-fun res!191534 () Bool)

(assert (=> b!346226 (=> (not res!191534) (not e!212197))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346226 (= res!191534 (and (= (size!9092 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9091 _keys!1895) (size!9092 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346227 () Bool)

(declare-fun res!191532 () Bool)

(assert (=> b!346227 (=> (not res!191532) (not e!212197))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10891)

(declare-fun zeroValue!1467 () V!10891)

(declare-datatypes ((tuple2!5360 0))(
  ( (tuple2!5361 (_1!2691 (_ BitVec 64)) (_2!2691 V!10891)) )
))
(declare-datatypes ((List!4967 0))(
  ( (Nil!4964) (Cons!4963 (h!5819 tuple2!5360) (t!10085 List!4967)) )
))
(declare-datatypes ((ListLongMap!4275 0))(
  ( (ListLongMap!4276 (toList!2153 List!4967)) )
))
(declare-fun contains!2235 (ListLongMap!4275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1682 (array!18456 array!18458 (_ BitVec 32) (_ BitVec 32) V!10891 V!10891 (_ BitVec 32) Int) ListLongMap!4275)

(assert (=> b!346227 (= res!191532 (not (contains!2235 (getCurrentListMap!1682 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34642 res!191531) b!346226))

(assert (= (and b!346226 res!191534) b!346219))

(assert (= (and b!346219 res!191527) b!346225))

(assert (= (and b!346225 res!191528) b!346221))

(assert (= (and b!346221 res!191533) b!346227))

(assert (= (and b!346227 res!191532) b!346224))

(assert (= (and b!346224 res!191529) b!346222))

(assert (= (and b!346222 res!191530) b!346218))

(assert (= (and b!346220 condMapEmpty!12606) mapIsEmpty!12606))

(assert (= (and b!346220 (not condMapEmpty!12606)) mapNonEmpty!12606))

(assert (= (and mapNonEmpty!12606 ((_ is ValueCellFull!3374) mapValue!12606)) b!346217))

(assert (= (and b!346220 ((_ is ValueCellFull!3374) mapDefault!12606)) b!346223))

(assert (= start!34642 b!346220))

(declare-fun m!347639 () Bool)

(assert (=> b!346221 m!347639))

(declare-fun m!347641 () Bool)

(assert (=> b!346219 m!347641))

(declare-fun m!347643 () Bool)

(assert (=> b!346222 m!347643))

(declare-fun m!347645 () Bool)

(assert (=> b!346227 m!347645))

(assert (=> b!346227 m!347645))

(declare-fun m!347647 () Bool)

(assert (=> b!346227 m!347647))

(declare-fun m!347649 () Bool)

(assert (=> start!34642 m!347649))

(declare-fun m!347651 () Bool)

(assert (=> start!34642 m!347651))

(declare-fun m!347653 () Bool)

(assert (=> start!34642 m!347653))

(declare-fun m!347655 () Bool)

(assert (=> mapNonEmpty!12606 m!347655))

(declare-fun m!347657 () Bool)

(assert (=> b!346225 m!347657))

(declare-fun m!347659 () Bool)

(assert (=> b!346224 m!347659))

(declare-fun m!347661 () Bool)

(assert (=> b!346224 m!347661))

(check-sat b_and!14715 (not b!346227) (not b!346219) (not mapNonEmpty!12606) (not b!346225) (not b!346221) (not b!346224) (not b_next!7483) tp_is_empty!7435 (not b!346222) (not start!34642))
(check-sat b_and!14715 (not b_next!7483))
(get-model)

(declare-fun d!71253 () Bool)

(declare-fun res!191587 () Bool)

(declare-fun e!212239 () Bool)

(assert (=> d!71253 (=> res!191587 e!212239)))

(assert (=> d!71253 (= res!191587 (= (select (arr!8739 _keys!1895) (index!15472 lt!163297)) k0!1348))))

(assert (=> d!71253 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15472 lt!163297)) e!212239)))

(declare-fun b!346298 () Bool)

(declare-fun e!212240 () Bool)

(assert (=> b!346298 (= e!212239 e!212240)))

(declare-fun res!191588 () Bool)

(assert (=> b!346298 (=> (not res!191588) (not e!212240))))

(assert (=> b!346298 (= res!191588 (bvslt (bvadd (index!15472 lt!163297) #b00000000000000000000000000000001) (size!9091 _keys!1895)))))

(declare-fun b!346299 () Bool)

(assert (=> b!346299 (= e!212240 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15472 lt!163297) #b00000000000000000000000000000001)))))

(assert (= (and d!71253 (not res!191587)) b!346298))

(assert (= (and b!346298 res!191588) b!346299))

(assert (=> d!71253 m!347659))

(declare-fun m!347711 () Bool)

(assert (=> b!346299 m!347711))

(assert (=> b!346222 d!71253))

(declare-fun d!71255 () Bool)

(declare-fun e!212246 () Bool)

(assert (=> d!71255 e!212246))

(declare-fun res!191591 () Bool)

(assert (=> d!71255 (=> res!191591 e!212246)))

(declare-fun lt!163315 () Bool)

(assert (=> d!71255 (= res!191591 (not lt!163315))))

(declare-fun lt!163313 () Bool)

(assert (=> d!71255 (= lt!163315 lt!163313)))

(declare-datatypes ((Unit!10717 0))(
  ( (Unit!10718) )
))
(declare-fun lt!163314 () Unit!10717)

(declare-fun e!212245 () Unit!10717)

(assert (=> d!71255 (= lt!163314 e!212245)))

(declare-fun c!53114 () Bool)

(assert (=> d!71255 (= c!53114 lt!163313)))

(declare-fun containsKey!335 (List!4967 (_ BitVec 64)) Bool)

(assert (=> d!71255 (= lt!163313 (containsKey!335 (toList!2153 (getCurrentListMap!1682 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71255 (= (contains!2235 (getCurrentListMap!1682 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163315)))

(declare-fun b!346306 () Bool)

(declare-fun lt!163312 () Unit!10717)

(assert (=> b!346306 (= e!212245 lt!163312)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!283 (List!4967 (_ BitVec 64)) Unit!10717)

(assert (=> b!346306 (= lt!163312 (lemmaContainsKeyImpliesGetValueByKeyDefined!283 (toList!2153 (getCurrentListMap!1682 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!350 0))(
  ( (Some!349 (v!5947 V!10891)) (None!348) )
))
(declare-fun isDefined!284 (Option!350) Bool)

(declare-fun getValueByKey!344 (List!4967 (_ BitVec 64)) Option!350)

(assert (=> b!346306 (isDefined!284 (getValueByKey!344 (toList!2153 (getCurrentListMap!1682 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!346307 () Bool)

(declare-fun Unit!10719 () Unit!10717)

(assert (=> b!346307 (= e!212245 Unit!10719)))

(declare-fun b!346308 () Bool)

(assert (=> b!346308 (= e!212246 (isDefined!284 (getValueByKey!344 (toList!2153 (getCurrentListMap!1682 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71255 c!53114) b!346306))

(assert (= (and d!71255 (not c!53114)) b!346307))

(assert (= (and d!71255 (not res!191591)) b!346308))

(declare-fun m!347713 () Bool)

(assert (=> d!71255 m!347713))

(declare-fun m!347715 () Bool)

(assert (=> b!346306 m!347715))

(declare-fun m!347717 () Bool)

(assert (=> b!346306 m!347717))

(assert (=> b!346306 m!347717))

(declare-fun m!347719 () Bool)

(assert (=> b!346306 m!347719))

(assert (=> b!346308 m!347717))

(assert (=> b!346308 m!347717))

(assert (=> b!346308 m!347719))

(assert (=> b!346227 d!71255))

(declare-fun bm!26807 () Bool)

(declare-fun call!26813 () ListLongMap!4275)

(declare-fun getCurrentListMapNoExtraKeys!601 (array!18456 array!18458 (_ BitVec 32) (_ BitVec 32) V!10891 V!10891 (_ BitVec 32) Int) ListLongMap!4275)

(assert (=> bm!26807 (= call!26813 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!346351 () Bool)

(declare-fun e!212274 () ListLongMap!4275)

(declare-fun call!26811 () ListLongMap!4275)

(assert (=> b!346351 (= e!212274 call!26811)))

(declare-fun b!346352 () Bool)

(declare-fun e!212277 () Bool)

(declare-fun call!26810 () Bool)

(assert (=> b!346352 (= e!212277 (not call!26810))))

(declare-fun bm!26808 () Bool)

(declare-fun lt!163364 () ListLongMap!4275)

(assert (=> bm!26808 (= call!26810 (contains!2235 lt!163364 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!346353 () Bool)

(declare-fun e!212276 () Bool)

(declare-fun apply!285 (ListLongMap!4275 (_ BitVec 64)) V!10891)

(declare-fun get!4715 (ValueCell!3374 V!10891) V!10891)

(declare-fun dynLambda!628 (Int (_ BitVec 64)) V!10891)

(assert (=> b!346353 (= e!212276 (= (apply!285 lt!163364 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)) (get!4715 (select (arr!8740 _values!1525) #b00000000000000000000000000000000) (dynLambda!628 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!346353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9092 _values!1525)))))

(assert (=> b!346353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(declare-fun b!346354 () Bool)

(declare-fun e!212284 () Bool)

(declare-fun call!26814 () Bool)

(assert (=> b!346354 (= e!212284 (not call!26814))))

(declare-fun b!346355 () Bool)

(declare-fun e!212282 () ListLongMap!4275)

(assert (=> b!346355 (= e!212282 call!26811)))

(declare-fun c!53130 () Bool)

(declare-fun call!26816 () ListLongMap!4275)

(declare-fun c!53128 () Bool)

(declare-fun bm!26809 () Bool)

(declare-fun call!26815 () ListLongMap!4275)

(declare-fun call!26812 () ListLongMap!4275)

(declare-fun +!736 (ListLongMap!4275 tuple2!5360) ListLongMap!4275)

(assert (=> bm!26809 (= call!26816 (+!736 (ite c!53128 call!26813 (ite c!53130 call!26812 call!26815)) (ite (or c!53128 c!53130) (tuple2!5361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!346356 () Bool)

(declare-fun e!212280 () Bool)

(assert (=> b!346356 (= e!212280 (validKeyInArray!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346358 () Bool)

(declare-fun e!212273 () Bool)

(assert (=> b!346358 (= e!212273 e!212277)))

(declare-fun c!53129 () Bool)

(assert (=> b!346358 (= c!53129 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!346359 () Bool)

(declare-fun res!191613 () Bool)

(assert (=> b!346359 (=> (not res!191613) (not e!212273))))

(assert (=> b!346359 (= res!191613 e!212284)))

(declare-fun c!53132 () Bool)

(assert (=> b!346359 (= c!53132 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!346360 () Bool)

(declare-fun e!212285 () Unit!10717)

(declare-fun Unit!10720 () Unit!10717)

(assert (=> b!346360 (= e!212285 Unit!10720)))

(declare-fun bm!26810 () Bool)

(assert (=> bm!26810 (= call!26812 call!26813)))

(declare-fun b!346361 () Bool)

(declare-fun e!212279 () Bool)

(assert (=> b!346361 (= e!212277 e!212279)))

(declare-fun res!191614 () Bool)

(assert (=> b!346361 (= res!191614 call!26810)))

(assert (=> b!346361 (=> (not res!191614) (not e!212279))))

(declare-fun b!346362 () Bool)

(declare-fun lt!163372 () Unit!10717)

(assert (=> b!346362 (= e!212285 lt!163372)))

(declare-fun lt!163376 () ListLongMap!4275)

(assert (=> b!346362 (= lt!163376 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163374 () (_ BitVec 64))

(assert (=> b!346362 (= lt!163374 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163378 () (_ BitVec 64))

(assert (=> b!346362 (= lt!163378 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163360 () Unit!10717)

(declare-fun addStillContains!261 (ListLongMap!4275 (_ BitVec 64) V!10891 (_ BitVec 64)) Unit!10717)

(assert (=> b!346362 (= lt!163360 (addStillContains!261 lt!163376 lt!163374 zeroValue!1467 lt!163378))))

(assert (=> b!346362 (contains!2235 (+!736 lt!163376 (tuple2!5361 lt!163374 zeroValue!1467)) lt!163378)))

(declare-fun lt!163379 () Unit!10717)

(assert (=> b!346362 (= lt!163379 lt!163360)))

(declare-fun lt!163362 () ListLongMap!4275)

(assert (=> b!346362 (= lt!163362 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163375 () (_ BitVec 64))

(assert (=> b!346362 (= lt!163375 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163373 () (_ BitVec 64))

(assert (=> b!346362 (= lt!163373 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163361 () Unit!10717)

(declare-fun addApplyDifferent!261 (ListLongMap!4275 (_ BitVec 64) V!10891 (_ BitVec 64)) Unit!10717)

(assert (=> b!346362 (= lt!163361 (addApplyDifferent!261 lt!163362 lt!163375 minValue!1467 lt!163373))))

(assert (=> b!346362 (= (apply!285 (+!736 lt!163362 (tuple2!5361 lt!163375 minValue!1467)) lt!163373) (apply!285 lt!163362 lt!163373))))

(declare-fun lt!163381 () Unit!10717)

(assert (=> b!346362 (= lt!163381 lt!163361)))

(declare-fun lt!163377 () ListLongMap!4275)

(assert (=> b!346362 (= lt!163377 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163371 () (_ BitVec 64))

(assert (=> b!346362 (= lt!163371 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163369 () (_ BitVec 64))

(assert (=> b!346362 (= lt!163369 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163380 () Unit!10717)

(assert (=> b!346362 (= lt!163380 (addApplyDifferent!261 lt!163377 lt!163371 zeroValue!1467 lt!163369))))

(assert (=> b!346362 (= (apply!285 (+!736 lt!163377 (tuple2!5361 lt!163371 zeroValue!1467)) lt!163369) (apply!285 lt!163377 lt!163369))))

(declare-fun lt!163368 () Unit!10717)

(assert (=> b!346362 (= lt!163368 lt!163380)))

(declare-fun lt!163367 () ListLongMap!4275)

(assert (=> b!346362 (= lt!163367 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163366 () (_ BitVec 64))

(assert (=> b!346362 (= lt!163366 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163370 () (_ BitVec 64))

(assert (=> b!346362 (= lt!163370 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!346362 (= lt!163372 (addApplyDifferent!261 lt!163367 lt!163366 minValue!1467 lt!163370))))

(assert (=> b!346362 (= (apply!285 (+!736 lt!163367 (tuple2!5361 lt!163366 minValue!1467)) lt!163370) (apply!285 lt!163367 lt!163370))))

(declare-fun b!346363 () Bool)

(declare-fun e!212283 () Bool)

(assert (=> b!346363 (= e!212283 (validKeyInArray!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346364 () Bool)

(declare-fun e!212281 () Bool)

(assert (=> b!346364 (= e!212284 e!212281)))

(declare-fun res!191612 () Bool)

(assert (=> b!346364 (= res!191612 call!26814)))

(assert (=> b!346364 (=> (not res!191612) (not e!212281))))

(declare-fun b!346365 () Bool)

(declare-fun e!212278 () ListLongMap!4275)

(assert (=> b!346365 (= e!212278 e!212282)))

(assert (=> b!346365 (= c!53130 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!346366 () Bool)

(declare-fun res!191611 () Bool)

(assert (=> b!346366 (=> (not res!191611) (not e!212273))))

(declare-fun e!212275 () Bool)

(assert (=> b!346366 (= res!191611 e!212275)))

(declare-fun res!191615 () Bool)

(assert (=> b!346366 (=> res!191615 e!212275)))

(assert (=> b!346366 (= res!191615 (not e!212280))))

(declare-fun res!191618 () Bool)

(assert (=> b!346366 (=> (not res!191618) (not e!212280))))

(assert (=> b!346366 (= res!191618 (bvslt #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(declare-fun bm!26811 () Bool)

(assert (=> bm!26811 (= call!26815 call!26812)))

(declare-fun b!346367 () Bool)

(assert (=> b!346367 (= e!212275 e!212276)))

(declare-fun res!191610 () Bool)

(assert (=> b!346367 (=> (not res!191610) (not e!212276))))

(assert (=> b!346367 (= res!191610 (contains!2235 lt!163364 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!346367 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(declare-fun b!346368 () Bool)

(declare-fun c!53127 () Bool)

(assert (=> b!346368 (= c!53127 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!346368 (= e!212282 e!212274)))

(declare-fun bm!26812 () Bool)

(assert (=> bm!26812 (= call!26811 call!26816)))

(declare-fun b!346369 () Bool)

(assert (=> b!346369 (= e!212274 call!26815)))

(declare-fun bm!26813 () Bool)

(assert (=> bm!26813 (= call!26814 (contains!2235 lt!163364 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!71257 () Bool)

(assert (=> d!71257 e!212273))

(declare-fun res!191617 () Bool)

(assert (=> d!71257 (=> (not res!191617) (not e!212273))))

(assert (=> d!71257 (= res!191617 (or (bvsge #b00000000000000000000000000000000 (size!9091 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9091 _keys!1895)))))))

(declare-fun lt!163365 () ListLongMap!4275)

(assert (=> d!71257 (= lt!163364 lt!163365)))

(declare-fun lt!163363 () Unit!10717)

(assert (=> d!71257 (= lt!163363 e!212285)))

(declare-fun c!53131 () Bool)

(assert (=> d!71257 (= c!53131 e!212283)))

(declare-fun res!191616 () Bool)

(assert (=> d!71257 (=> (not res!191616) (not e!212283))))

(assert (=> d!71257 (= res!191616 (bvslt #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(assert (=> d!71257 (= lt!163365 e!212278)))

(assert (=> d!71257 (= c!53128 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71257 (validMask!0 mask!2385)))

(assert (=> d!71257 (= (getCurrentListMap!1682 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163364)))

(declare-fun b!346357 () Bool)

(assert (=> b!346357 (= e!212279 (= (apply!285 lt!163364 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!346370 () Bool)

(assert (=> b!346370 (= e!212278 (+!736 call!26816 (tuple2!5361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!346371 () Bool)

(assert (=> b!346371 (= e!212281 (= (apply!285 lt!163364 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(assert (= (and d!71257 c!53128) b!346370))

(assert (= (and d!71257 (not c!53128)) b!346365))

(assert (= (and b!346365 c!53130) b!346355))

(assert (= (and b!346365 (not c!53130)) b!346368))

(assert (= (and b!346368 c!53127) b!346351))

(assert (= (and b!346368 (not c!53127)) b!346369))

(assert (= (or b!346351 b!346369) bm!26811))

(assert (= (or b!346355 bm!26811) bm!26810))

(assert (= (or b!346355 b!346351) bm!26812))

(assert (= (or b!346370 bm!26810) bm!26807))

(assert (= (or b!346370 bm!26812) bm!26809))

(assert (= (and d!71257 res!191616) b!346363))

(assert (= (and d!71257 c!53131) b!346362))

(assert (= (and d!71257 (not c!53131)) b!346360))

(assert (= (and d!71257 res!191617) b!346366))

(assert (= (and b!346366 res!191618) b!346356))

(assert (= (and b!346366 (not res!191615)) b!346367))

(assert (= (and b!346367 res!191610) b!346353))

(assert (= (and b!346366 res!191611) b!346359))

(assert (= (and b!346359 c!53132) b!346364))

(assert (= (and b!346359 (not c!53132)) b!346354))

(assert (= (and b!346364 res!191612) b!346371))

(assert (= (or b!346364 b!346354) bm!26813))

(assert (= (and b!346359 res!191613) b!346358))

(assert (= (and b!346358 c!53129) b!346361))

(assert (= (and b!346358 (not c!53129)) b!346352))

(assert (= (and b!346361 res!191614) b!346357))

(assert (= (or b!346361 b!346352) bm!26808))

(declare-fun b_lambda!8501 () Bool)

(assert (=> (not b_lambda!8501) (not b!346353)))

(declare-fun t!10090 () Bool)

(declare-fun tb!3077 () Bool)

(assert (=> (and start!34642 (= defaultEntry!1528 defaultEntry!1528) t!10090) tb!3077))

(declare-fun result!5577 () Bool)

(assert (=> tb!3077 (= result!5577 tp_is_empty!7435)))

(assert (=> b!346353 t!10090))

(declare-fun b_and!14721 () Bool)

(assert (= b_and!14715 (and (=> t!10090 result!5577) b_and!14721)))

(declare-fun m!347721 () Bool)

(assert (=> b!346356 m!347721))

(assert (=> b!346356 m!347721))

(declare-fun m!347723 () Bool)

(assert (=> b!346356 m!347723))

(declare-fun m!347725 () Bool)

(assert (=> b!346370 m!347725))

(declare-fun m!347727 () Bool)

(assert (=> bm!26809 m!347727))

(declare-fun m!347729 () Bool)

(assert (=> b!346353 m!347729))

(assert (=> b!346353 m!347721))

(declare-fun m!347731 () Bool)

(assert (=> b!346353 m!347731))

(assert (=> b!346353 m!347731))

(assert (=> b!346353 m!347729))

(declare-fun m!347733 () Bool)

(assert (=> b!346353 m!347733))

(assert (=> b!346353 m!347721))

(declare-fun m!347735 () Bool)

(assert (=> b!346353 m!347735))

(declare-fun m!347737 () Bool)

(assert (=> bm!26813 m!347737))

(declare-fun m!347739 () Bool)

(assert (=> b!346357 m!347739))

(declare-fun m!347741 () Bool)

(assert (=> bm!26808 m!347741))

(assert (=> b!346363 m!347721))

(assert (=> b!346363 m!347721))

(assert (=> b!346363 m!347723))

(declare-fun m!347743 () Bool)

(assert (=> bm!26807 m!347743))

(assert (=> b!346362 m!347743))

(declare-fun m!347745 () Bool)

(assert (=> b!346362 m!347745))

(declare-fun m!347747 () Bool)

(assert (=> b!346362 m!347747))

(declare-fun m!347749 () Bool)

(assert (=> b!346362 m!347749))

(declare-fun m!347751 () Bool)

(assert (=> b!346362 m!347751))

(declare-fun m!347753 () Bool)

(assert (=> b!346362 m!347753))

(declare-fun m!347755 () Bool)

(assert (=> b!346362 m!347755))

(declare-fun m!347757 () Bool)

(assert (=> b!346362 m!347757))

(assert (=> b!346362 m!347745))

(declare-fun m!347759 () Bool)

(assert (=> b!346362 m!347759))

(assert (=> b!346362 m!347753))

(declare-fun m!347761 () Bool)

(assert (=> b!346362 m!347761))

(declare-fun m!347763 () Bool)

(assert (=> b!346362 m!347763))

(declare-fun m!347765 () Bool)

(assert (=> b!346362 m!347765))

(assert (=> b!346362 m!347721))

(declare-fun m!347767 () Bool)

(assert (=> b!346362 m!347767))

(declare-fun m!347769 () Bool)

(assert (=> b!346362 m!347769))

(assert (=> b!346362 m!347765))

(declare-fun m!347771 () Bool)

(assert (=> b!346362 m!347771))

(assert (=> b!346362 m!347755))

(declare-fun m!347773 () Bool)

(assert (=> b!346362 m!347773))

(declare-fun m!347775 () Bool)

(assert (=> b!346371 m!347775))

(assert (=> b!346367 m!347721))

(assert (=> b!346367 m!347721))

(declare-fun m!347777 () Bool)

(assert (=> b!346367 m!347777))

(assert (=> d!71257 m!347649))

(assert (=> b!346227 d!71257))

(declare-fun d!71259 () Bool)

(assert (=> d!71259 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!346221 d!71259))

(declare-fun b!346384 () Bool)

(declare-fun e!212297 () Bool)

(declare-fun e!212295 () Bool)

(assert (=> b!346384 (= e!212297 e!212295)))

(declare-fun c!53135 () Bool)

(assert (=> b!346384 (= c!53135 (validKeyInArray!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26816 () Bool)

(declare-fun call!26819 () Bool)

(assert (=> bm!26816 (= call!26819 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53135 (Cons!4962 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000) Nil!4963) Nil!4963)))))

(declare-fun b!346385 () Bool)

(declare-fun e!212296 () Bool)

(declare-fun contains!2237 (List!4966 (_ BitVec 64)) Bool)

(assert (=> b!346385 (= e!212296 (contains!2237 Nil!4963 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346386 () Bool)

(assert (=> b!346386 (= e!212295 call!26819)))

(declare-fun d!71261 () Bool)

(declare-fun res!191625 () Bool)

(declare-fun e!212294 () Bool)

(assert (=> d!71261 (=> res!191625 e!212294)))

(assert (=> d!71261 (= res!191625 (bvsge #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(assert (=> d!71261 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4963) e!212294)))

(declare-fun b!346387 () Bool)

(assert (=> b!346387 (= e!212294 e!212297)))

(declare-fun res!191627 () Bool)

(assert (=> b!346387 (=> (not res!191627) (not e!212297))))

(assert (=> b!346387 (= res!191627 (not e!212296))))

(declare-fun res!191626 () Bool)

(assert (=> b!346387 (=> (not res!191626) (not e!212296))))

(assert (=> b!346387 (= res!191626 (validKeyInArray!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346388 () Bool)

(assert (=> b!346388 (= e!212295 call!26819)))

(assert (= (and d!71261 (not res!191625)) b!346387))

(assert (= (and b!346387 res!191626) b!346385))

(assert (= (and b!346387 res!191627) b!346384))

(assert (= (and b!346384 c!53135) b!346386))

(assert (= (and b!346384 (not c!53135)) b!346388))

(assert (= (or b!346386 b!346388) bm!26816))

(assert (=> b!346384 m!347721))

(assert (=> b!346384 m!347721))

(assert (=> b!346384 m!347723))

(assert (=> bm!26816 m!347721))

(declare-fun m!347779 () Bool)

(assert (=> bm!26816 m!347779))

(assert (=> b!346385 m!347721))

(assert (=> b!346385 m!347721))

(declare-fun m!347781 () Bool)

(assert (=> b!346385 m!347781))

(assert (=> b!346387 m!347721))

(assert (=> b!346387 m!347721))

(assert (=> b!346387 m!347723))

(assert (=> b!346225 d!71261))

(declare-fun b!346401 () Bool)

(declare-fun e!212306 () SeekEntryResult!3323)

(declare-fun lt!163389 () SeekEntryResult!3323)

(assert (=> b!346401 (= e!212306 (MissingZero!3323 (index!15473 lt!163389)))))

(declare-fun d!71263 () Bool)

(declare-fun lt!163390 () SeekEntryResult!3323)

(assert (=> d!71263 (and (or ((_ is Undefined!3323) lt!163390) (not ((_ is Found!3323) lt!163390)) (and (bvsge (index!15472 lt!163390) #b00000000000000000000000000000000) (bvslt (index!15472 lt!163390) (size!9091 _keys!1895)))) (or ((_ is Undefined!3323) lt!163390) ((_ is Found!3323) lt!163390) (not ((_ is MissingZero!3323) lt!163390)) (and (bvsge (index!15471 lt!163390) #b00000000000000000000000000000000) (bvslt (index!15471 lt!163390) (size!9091 _keys!1895)))) (or ((_ is Undefined!3323) lt!163390) ((_ is Found!3323) lt!163390) ((_ is MissingZero!3323) lt!163390) (not ((_ is MissingVacant!3323) lt!163390)) (and (bvsge (index!15474 lt!163390) #b00000000000000000000000000000000) (bvslt (index!15474 lt!163390) (size!9091 _keys!1895)))) (or ((_ is Undefined!3323) lt!163390) (ite ((_ is Found!3323) lt!163390) (= (select (arr!8739 _keys!1895) (index!15472 lt!163390)) k0!1348) (ite ((_ is MissingZero!3323) lt!163390) (= (select (arr!8739 _keys!1895) (index!15471 lt!163390)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3323) lt!163390) (= (select (arr!8739 _keys!1895) (index!15474 lt!163390)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!212305 () SeekEntryResult!3323)

(assert (=> d!71263 (= lt!163390 e!212305)))

(declare-fun c!53143 () Bool)

(assert (=> d!71263 (= c!53143 (and ((_ is Intermediate!3323) lt!163389) (undefined!4135 lt!163389)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18456 (_ BitVec 32)) SeekEntryResult!3323)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71263 (= lt!163389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71263 (validMask!0 mask!2385)))

(assert (=> d!71263 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163390)))

(declare-fun b!346402 () Bool)

(declare-fun e!212304 () SeekEntryResult!3323)

(assert (=> b!346402 (= e!212304 (Found!3323 (index!15473 lt!163389)))))

(declare-fun b!346403 () Bool)

(assert (=> b!346403 (= e!212305 e!212304)))

(declare-fun lt!163388 () (_ BitVec 64))

(assert (=> b!346403 (= lt!163388 (select (arr!8739 _keys!1895) (index!15473 lt!163389)))))

(declare-fun c!53144 () Bool)

(assert (=> b!346403 (= c!53144 (= lt!163388 k0!1348))))

(declare-fun b!346404 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18456 (_ BitVec 32)) SeekEntryResult!3323)

(assert (=> b!346404 (= e!212306 (seekKeyOrZeroReturnVacant!0 (x!34444 lt!163389) (index!15473 lt!163389) (index!15473 lt!163389) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346405 () Bool)

(declare-fun c!53142 () Bool)

(assert (=> b!346405 (= c!53142 (= lt!163388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!346405 (= e!212304 e!212306)))

(declare-fun b!346406 () Bool)

(assert (=> b!346406 (= e!212305 Undefined!3323)))

(assert (= (and d!71263 c!53143) b!346406))

(assert (= (and d!71263 (not c!53143)) b!346403))

(assert (= (and b!346403 c!53144) b!346402))

(assert (= (and b!346403 (not c!53144)) b!346405))

(assert (= (and b!346405 c!53142) b!346401))

(assert (= (and b!346405 (not c!53142)) b!346404))

(declare-fun m!347783 () Bool)

(assert (=> d!71263 m!347783))

(declare-fun m!347785 () Bool)

(assert (=> d!71263 m!347785))

(declare-fun m!347787 () Bool)

(assert (=> d!71263 m!347787))

(assert (=> d!71263 m!347787))

(declare-fun m!347789 () Bool)

(assert (=> d!71263 m!347789))

(assert (=> d!71263 m!347649))

(declare-fun m!347791 () Bool)

(assert (=> d!71263 m!347791))

(declare-fun m!347793 () Bool)

(assert (=> b!346403 m!347793))

(declare-fun m!347795 () Bool)

(assert (=> b!346404 m!347795))

(assert (=> b!346224 d!71263))

(declare-fun bm!26819 () Bool)

(declare-fun call!26822 () Bool)

(assert (=> bm!26819 (= call!26822 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!346415 () Bool)

(declare-fun e!212315 () Bool)

(declare-fun e!212314 () Bool)

(assert (=> b!346415 (= e!212315 e!212314)))

(declare-fun lt!163398 () (_ BitVec 64))

(assert (=> b!346415 (= lt!163398 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163399 () Unit!10717)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18456 (_ BitVec 64) (_ BitVec 32)) Unit!10717)

(assert (=> b!346415 (= lt!163399 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163398 #b00000000000000000000000000000000))))

(assert (=> b!346415 (arrayContainsKey!0 _keys!1895 lt!163398 #b00000000000000000000000000000000)))

(declare-fun lt!163397 () Unit!10717)

(assert (=> b!346415 (= lt!163397 lt!163399)))

(declare-fun res!191633 () Bool)

(assert (=> b!346415 (= res!191633 (= (seekEntryOrOpen!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3323 #b00000000000000000000000000000000)))))

(assert (=> b!346415 (=> (not res!191633) (not e!212314))))

(declare-fun b!346416 () Bool)

(assert (=> b!346416 (= e!212315 call!26822)))

(declare-fun b!346417 () Bool)

(declare-fun e!212313 () Bool)

(assert (=> b!346417 (= e!212313 e!212315)))

(declare-fun c!53147 () Bool)

(assert (=> b!346417 (= c!53147 (validKeyInArray!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71265 () Bool)

(declare-fun res!191632 () Bool)

(assert (=> d!71265 (=> res!191632 e!212313)))

(assert (=> d!71265 (= res!191632 (bvsge #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(assert (=> d!71265 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!212313)))

(declare-fun b!346418 () Bool)

(assert (=> b!346418 (= e!212314 call!26822)))

(assert (= (and d!71265 (not res!191632)) b!346417))

(assert (= (and b!346417 c!53147) b!346415))

(assert (= (and b!346417 (not c!53147)) b!346416))

(assert (= (and b!346415 res!191633) b!346418))

(assert (= (or b!346418 b!346416) bm!26819))

(declare-fun m!347797 () Bool)

(assert (=> bm!26819 m!347797))

(assert (=> b!346415 m!347721))

(declare-fun m!347799 () Bool)

(assert (=> b!346415 m!347799))

(declare-fun m!347801 () Bool)

(assert (=> b!346415 m!347801))

(assert (=> b!346415 m!347721))

(declare-fun m!347803 () Bool)

(assert (=> b!346415 m!347803))

(assert (=> b!346417 m!347721))

(assert (=> b!346417 m!347721))

(assert (=> b!346417 m!347723))

(assert (=> b!346219 d!71265))

(declare-fun d!71267 () Bool)

(assert (=> d!71267 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34642 d!71267))

(declare-fun d!71269 () Bool)

(assert (=> d!71269 (= (array_inv!6458 _values!1525) (bvsge (size!9092 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34642 d!71269))

(declare-fun d!71271 () Bool)

(assert (=> d!71271 (= (array_inv!6459 _keys!1895) (bvsge (size!9091 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34642 d!71271))

(declare-fun condMapEmpty!12615 () Bool)

(declare-fun mapDefault!12615 () ValueCell!3374)

(assert (=> mapNonEmpty!12606 (= condMapEmpty!12615 (= mapRest!12606 ((as const (Array (_ BitVec 32) ValueCell!3374)) mapDefault!12615)))))

(declare-fun e!212321 () Bool)

(declare-fun mapRes!12615 () Bool)

(assert (=> mapNonEmpty!12606 (= tp!26010 (and e!212321 mapRes!12615))))

(declare-fun mapNonEmpty!12615 () Bool)

(declare-fun tp!26025 () Bool)

(declare-fun e!212320 () Bool)

(assert (=> mapNonEmpty!12615 (= mapRes!12615 (and tp!26025 e!212320))))

(declare-fun mapValue!12615 () ValueCell!3374)

(declare-fun mapKey!12615 () (_ BitVec 32))

(declare-fun mapRest!12615 () (Array (_ BitVec 32) ValueCell!3374))

(assert (=> mapNonEmpty!12615 (= mapRest!12606 (store mapRest!12615 mapKey!12615 mapValue!12615))))

(declare-fun mapIsEmpty!12615 () Bool)

(assert (=> mapIsEmpty!12615 mapRes!12615))

(declare-fun b!346426 () Bool)

(assert (=> b!346426 (= e!212321 tp_is_empty!7435)))

(declare-fun b!346425 () Bool)

(assert (=> b!346425 (= e!212320 tp_is_empty!7435)))

(assert (= (and mapNonEmpty!12606 condMapEmpty!12615) mapIsEmpty!12615))

(assert (= (and mapNonEmpty!12606 (not condMapEmpty!12615)) mapNonEmpty!12615))

(assert (= (and mapNonEmpty!12615 ((_ is ValueCellFull!3374) mapValue!12615)) b!346425))

(assert (= (and mapNonEmpty!12606 ((_ is ValueCellFull!3374) mapDefault!12615)) b!346426))

(declare-fun m!347805 () Bool)

(assert (=> mapNonEmpty!12615 m!347805))

(declare-fun b_lambda!8503 () Bool)

(assert (= b_lambda!8501 (or (and start!34642 b_free!7483) b_lambda!8503)))

(check-sat (not mapNonEmpty!12615) (not b!346384) (not b!346385) (not bm!26816) (not bm!26813) (not b!346362) (not d!71255) (not b!346415) (not b!346367) (not b!346363) (not d!71257) (not b!346356) (not b!346387) (not b!346308) (not b!346404) (not b_next!7483) tp_is_empty!7435 (not d!71263) (not bm!26809) b_and!14721 (not b!346357) (not bm!26808) (not b_lambda!8503) (not b!346299) (not b!346306) (not bm!26819) (not bm!26807) (not b!346417) (not b!346353) (not b!346370) (not b!346371))
(check-sat b_and!14721 (not b_next!7483))
