; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35148 () Bool)

(assert start!35148)

(declare-fun b_free!7767 () Bool)

(declare-fun b_next!7767 () Bool)

(assert (=> start!35148 (= b_free!7767 (not b_next!7767))))

(declare-fun tp!26889 () Bool)

(declare-fun b_and!15003 () Bool)

(assert (=> start!35148 (= tp!26889 b_and!15003)))

(declare-fun res!195421 () Bool)

(declare-fun e!215800 () Bool)

(assert (=> start!35148 (=> (not res!195421) (not e!215800))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35148 (= res!195421 (validMask!0 mask!2385))))

(assert (=> start!35148 e!215800))

(assert (=> start!35148 true))

(declare-fun tp_is_empty!7719 () Bool)

(assert (=> start!35148 tp_is_empty!7719))

(assert (=> start!35148 tp!26889))

(declare-datatypes ((V!11269 0))(
  ( (V!11270 (val!3904 Int)) )
))
(declare-datatypes ((ValueCell!3516 0))(
  ( (ValueCellFull!3516 (v!6094 V!11269)) (EmptyCell!3516) )
))
(declare-datatypes ((array!19027 0))(
  ( (array!19028 (arr!9016 (Array (_ BitVec 32) ValueCell!3516)) (size!9368 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19027)

(declare-fun e!215802 () Bool)

(declare-fun array_inv!6646 (array!19027) Bool)

(assert (=> start!35148 (and (array_inv!6646 _values!1525) e!215802)))

(declare-datatypes ((array!19029 0))(
  ( (array!19030 (arr!9017 (Array (_ BitVec 32) (_ BitVec 64))) (size!9369 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19029)

(declare-fun array_inv!6647 (array!19029) Bool)

(assert (=> start!35148 (array_inv!6647 _keys!1895)))

(declare-fun b!352397 () Bool)

(declare-datatypes ((Unit!10899 0))(
  ( (Unit!10900) )
))
(declare-fun e!215798 () Unit!10899)

(declare-fun Unit!10901 () Unit!10899)

(assert (=> b!352397 (= e!215798 Unit!10901)))

(declare-fun b!352398 () Bool)

(declare-fun res!195420 () Bool)

(assert (=> b!352398 (=> (not res!195420) (not e!215800))))

(declare-datatypes ((List!5248 0))(
  ( (Nil!5245) (Cons!5244 (h!6100 (_ BitVec 64)) (t!10392 List!5248)) )
))
(declare-fun arrayNoDuplicates!0 (array!19029 (_ BitVec 32) List!5248) Bool)

(assert (=> b!352398 (= res!195420 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5245))))

(declare-fun b!352399 () Bool)

(declare-fun res!195424 () Bool)

(assert (=> b!352399 (=> (not res!195424) (not e!215800))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352399 (= res!195424 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!13059 () Bool)

(declare-fun mapRes!13059 () Bool)

(declare-fun tp!26888 () Bool)

(declare-fun e!215801 () Bool)

(assert (=> mapNonEmpty!13059 (= mapRes!13059 (and tp!26888 e!215801))))

(declare-fun mapRest!13059 () (Array (_ BitVec 32) ValueCell!3516))

(declare-fun mapValue!13059 () ValueCell!3516)

(declare-fun mapKey!13059 () (_ BitVec 32))

(assert (=> mapNonEmpty!13059 (= (arr!9016 _values!1525) (store mapRest!13059 mapKey!13059 mapValue!13059))))

(declare-fun b!352400 () Bool)

(declare-fun e!215796 () Bool)

(declare-fun e!215795 () Bool)

(assert (=> b!352400 (= e!215796 e!215795)))

(declare-fun res!195418 () Bool)

(declare-datatypes ((SeekEntryResult!3468 0))(
  ( (MissingZero!3468 (index!16051 (_ BitVec 32))) (Found!3468 (index!16052 (_ BitVec 32))) (Intermediate!3468 (undefined!4280 Bool) (index!16053 (_ BitVec 32)) (x!35058 (_ BitVec 32))) (Undefined!3468) (MissingVacant!3468 (index!16054 (_ BitVec 32))) )
))
(declare-fun lt!165203 () SeekEntryResult!3468)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!352400 (= res!195418 (not (inRange!0 (index!16054 lt!165203) mask!2385)))))

(assert (=> b!352400 (=> res!195418 e!215795)))

(declare-fun b!352401 () Bool)

(declare-fun e!215793 () Bool)

(assert (=> b!352401 (= e!215793 tp_is_empty!7719)))

(declare-fun b!352402 () Bool)

(declare-fun e!215797 () Bool)

(assert (=> b!352402 (= e!215800 e!215797)))

(declare-fun res!195422 () Bool)

(assert (=> b!352402 (=> (not res!195422) (not e!215797))))

(get-info :version)

(assert (=> b!352402 (= res!195422 (and (not ((_ is Found!3468) lt!165203)) (not ((_ is MissingZero!3468) lt!165203)) ((_ is MissingVacant!3468) lt!165203)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19029 (_ BitVec 32)) SeekEntryResult!3468)

(assert (=> b!352402 (= lt!165203 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352403 () Bool)

(assert (=> b!352403 (= e!215796 (not ((_ is Undefined!3468) lt!165203)))))

(declare-fun b!352404 () Bool)

(declare-fun e!215799 () Bool)

(assert (=> b!352404 (= e!215797 e!215799)))

(declare-fun res!195419 () Bool)

(assert (=> b!352404 (=> (not res!195419) (not e!215799))))

(declare-fun lt!165204 () Bool)

(assert (=> b!352404 (= res!195419 (not lt!165204))))

(declare-fun lt!165202 () Unit!10899)

(assert (=> b!352404 (= lt!165202 e!215798)))

(declare-fun c!53574 () Bool)

(assert (=> b!352404 (= c!53574 lt!165204)))

(declare-fun arrayContainsKey!0 (array!19029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!352404 (= lt!165204 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!352405 () Bool)

(declare-fun res!195417 () Bool)

(assert (=> b!352405 (=> (not res!195417) (not e!215800))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!352405 (= res!195417 (and (= (size!9368 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9369 _keys!1895) (size!9368 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13059 () Bool)

(assert (=> mapIsEmpty!13059 mapRes!13059))

(declare-fun b!352406 () Bool)

(assert (=> b!352406 (= e!215795 (not (= (select (arr!9017 _keys!1895) (index!16054 lt!165203)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!352407 () Bool)

(assert (=> b!352407 (= e!215802 (and e!215793 mapRes!13059))))

(declare-fun condMapEmpty!13059 () Bool)

(declare-fun mapDefault!13059 () ValueCell!3516)

(assert (=> b!352407 (= condMapEmpty!13059 (= (arr!9016 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3516)) mapDefault!13059)))))

(declare-fun b!352408 () Bool)

(declare-fun res!195425 () Bool)

(assert (=> b!352408 (=> (not res!195425) (not e!215800))))

(declare-fun zeroValue!1467 () V!11269)

(declare-fun minValue!1467 () V!11269)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5628 0))(
  ( (tuple2!5629 (_1!2825 (_ BitVec 64)) (_2!2825 V!11269)) )
))
(declare-datatypes ((List!5249 0))(
  ( (Nil!5246) (Cons!5245 (h!6101 tuple2!5628) (t!10393 List!5249)) )
))
(declare-datatypes ((ListLongMap!4541 0))(
  ( (ListLongMap!4542 (toList!2286 List!5249)) )
))
(declare-fun contains!2358 (ListLongMap!4541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1807 (array!19029 array!19027 (_ BitVec 32) (_ BitVec 32) V!11269 V!11269 (_ BitVec 32) Int) ListLongMap!4541)

(assert (=> b!352408 (= res!195425 (not (contains!2358 (getCurrentListMap!1807 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352409 () Bool)

(assert (=> b!352409 (= e!215801 tp_is_empty!7719)))

(declare-fun b!352410 () Bool)

(assert (=> b!352410 (= e!215799 e!215796)))

(declare-fun c!53573 () Bool)

(assert (=> b!352410 (= c!53573 ((_ is MissingVacant!3468) lt!165203))))

(declare-fun b!352411 () Bool)

(declare-fun res!195423 () Bool)

(assert (=> b!352411 (=> (not res!195423) (not e!215800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19029 (_ BitVec 32)) Bool)

(assert (=> b!352411 (= res!195423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352412 () Bool)

(declare-fun Unit!10902 () Unit!10899)

(assert (=> b!352412 (= e!215798 Unit!10902)))

(declare-fun lt!165205 () Unit!10899)

(declare-fun lemmaArrayContainsKeyThenInListMap!335 (array!19029 array!19027 (_ BitVec 32) (_ BitVec 32) V!11269 V!11269 (_ BitVec 64) (_ BitVec 32) Int) Unit!10899)

(declare-fun arrayScanForKey!0 (array!19029 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!352412 (= lt!165205 (lemmaArrayContainsKeyThenInListMap!335 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!352412 false))

(assert (= (and start!35148 res!195421) b!352405))

(assert (= (and b!352405 res!195417) b!352411))

(assert (= (and b!352411 res!195423) b!352398))

(assert (= (and b!352398 res!195420) b!352399))

(assert (= (and b!352399 res!195424) b!352408))

(assert (= (and b!352408 res!195425) b!352402))

(assert (= (and b!352402 res!195422) b!352404))

(assert (= (and b!352404 c!53574) b!352412))

(assert (= (and b!352404 (not c!53574)) b!352397))

(assert (= (and b!352404 res!195419) b!352410))

(assert (= (and b!352410 c!53573) b!352400))

(assert (= (and b!352410 (not c!53573)) b!352403))

(assert (= (and b!352400 (not res!195418)) b!352406))

(assert (= (and b!352407 condMapEmpty!13059) mapIsEmpty!13059))

(assert (= (and b!352407 (not condMapEmpty!13059)) mapNonEmpty!13059))

(assert (= (and mapNonEmpty!13059 ((_ is ValueCellFull!3516) mapValue!13059)) b!352409))

(assert (= (and b!352407 ((_ is ValueCellFull!3516) mapDefault!13059)) b!352401))

(assert (= start!35148 b!352407))

(declare-fun m!352045 () Bool)

(assert (=> b!352406 m!352045))

(declare-fun m!352047 () Bool)

(assert (=> b!352412 m!352047))

(assert (=> b!352412 m!352047))

(declare-fun m!352049 () Bool)

(assert (=> b!352412 m!352049))

(declare-fun m!352051 () Bool)

(assert (=> b!352411 m!352051))

(declare-fun m!352053 () Bool)

(assert (=> b!352400 m!352053))

(declare-fun m!352055 () Bool)

(assert (=> b!352408 m!352055))

(assert (=> b!352408 m!352055))

(declare-fun m!352057 () Bool)

(assert (=> b!352408 m!352057))

(declare-fun m!352059 () Bool)

(assert (=> b!352398 m!352059))

(declare-fun m!352061 () Bool)

(assert (=> b!352404 m!352061))

(declare-fun m!352063 () Bool)

(assert (=> b!352402 m!352063))

(declare-fun m!352065 () Bool)

(assert (=> start!35148 m!352065))

(declare-fun m!352067 () Bool)

(assert (=> start!35148 m!352067))

(declare-fun m!352069 () Bool)

(assert (=> start!35148 m!352069))

(declare-fun m!352071 () Bool)

(assert (=> b!352399 m!352071))

(declare-fun m!352073 () Bool)

(assert (=> mapNonEmpty!13059 m!352073))

(check-sat tp_is_empty!7719 (not mapNonEmpty!13059) (not b!352404) (not start!35148) (not b!352412) b_and!15003 (not b!352398) (not b_next!7767) (not b!352399) (not b!352402) (not b!352400) (not b!352408) (not b!352411))
(check-sat b_and!15003 (not b_next!7767))
(get-model)

(declare-fun b!352469 () Bool)

(declare-fun e!215840 () Bool)

(declare-fun call!27064 () Bool)

(assert (=> b!352469 (= e!215840 call!27064)))

(declare-fun b!352470 () Bool)

(declare-fun e!215841 () Bool)

(assert (=> b!352470 (= e!215841 call!27064)))

(declare-fun bm!27061 () Bool)

(assert (=> bm!27061 (= call!27064 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!352471 () Bool)

(assert (=> b!352471 (= e!215841 e!215840)))

(declare-fun lt!165225 () (_ BitVec 64))

(assert (=> b!352471 (= lt!165225 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165226 () Unit!10899)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19029 (_ BitVec 64) (_ BitVec 32)) Unit!10899)

(assert (=> b!352471 (= lt!165226 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!165225 #b00000000000000000000000000000000))))

(assert (=> b!352471 (arrayContainsKey!0 _keys!1895 lt!165225 #b00000000000000000000000000000000)))

(declare-fun lt!165224 () Unit!10899)

(assert (=> b!352471 (= lt!165224 lt!165226)))

(declare-fun res!195457 () Bool)

(assert (=> b!352471 (= res!195457 (= (seekEntryOrOpen!0 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3468 #b00000000000000000000000000000000)))))

(assert (=> b!352471 (=> (not res!195457) (not e!215840))))

(declare-fun b!352472 () Bool)

(declare-fun e!215839 () Bool)

(assert (=> b!352472 (= e!215839 e!215841)))

(declare-fun c!53583 () Bool)

(assert (=> b!352472 (= c!53583 (validKeyInArray!0 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71533 () Bool)

(declare-fun res!195458 () Bool)

(assert (=> d!71533 (=> res!195458 e!215839)))

(assert (=> d!71533 (= res!195458 (bvsge #b00000000000000000000000000000000 (size!9369 _keys!1895)))))

(assert (=> d!71533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215839)))

(assert (= (and d!71533 (not res!195458)) b!352472))

(assert (= (and b!352472 c!53583) b!352471))

(assert (= (and b!352472 (not c!53583)) b!352470))

(assert (= (and b!352471 res!195457) b!352469))

(assert (= (or b!352469 b!352470) bm!27061))

(declare-fun m!352105 () Bool)

(assert (=> bm!27061 m!352105))

(declare-fun m!352107 () Bool)

(assert (=> b!352471 m!352107))

(declare-fun m!352109 () Bool)

(assert (=> b!352471 m!352109))

(declare-fun m!352111 () Bool)

(assert (=> b!352471 m!352111))

(assert (=> b!352471 m!352107))

(declare-fun m!352113 () Bool)

(assert (=> b!352471 m!352113))

(assert (=> b!352472 m!352107))

(assert (=> b!352472 m!352107))

(declare-fun m!352115 () Bool)

(assert (=> b!352472 m!352115))

(assert (=> b!352411 d!71533))

(declare-fun d!71535 () Bool)

(assert (=> d!71535 (= (inRange!0 (index!16054 lt!165203) mask!2385) (and (bvsge (index!16054 lt!165203) #b00000000000000000000000000000000) (bvslt (index!16054 lt!165203) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!352400 d!71535))

(declare-fun d!71537 () Bool)

(declare-fun res!195463 () Bool)

(declare-fun e!215846 () Bool)

(assert (=> d!71537 (=> res!195463 e!215846)))

(assert (=> d!71537 (= res!195463 (= (select (arr!9017 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71537 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215846)))

(declare-fun b!352477 () Bool)

(declare-fun e!215847 () Bool)

(assert (=> b!352477 (= e!215846 e!215847)))

(declare-fun res!195464 () Bool)

(assert (=> b!352477 (=> (not res!195464) (not e!215847))))

(assert (=> b!352477 (= res!195464 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9369 _keys!1895)))))

(declare-fun b!352478 () Bool)

(assert (=> b!352478 (= e!215847 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71537 (not res!195463)) b!352477))

(assert (= (and b!352477 res!195464) b!352478))

(assert (=> d!71537 m!352107))

(declare-fun m!352117 () Bool)

(assert (=> b!352478 m!352117))

(assert (=> b!352404 d!71537))

(declare-fun d!71539 () Bool)

(declare-fun e!215853 () Bool)

(assert (=> d!71539 e!215853))

(declare-fun res!195467 () Bool)

(assert (=> d!71539 (=> res!195467 e!215853)))

(declare-fun lt!165237 () Bool)

(assert (=> d!71539 (= res!195467 (not lt!165237))))

(declare-fun lt!165235 () Bool)

(assert (=> d!71539 (= lt!165237 lt!165235)))

(declare-fun lt!165238 () Unit!10899)

(declare-fun e!215852 () Unit!10899)

(assert (=> d!71539 (= lt!165238 e!215852)))

(declare-fun c!53586 () Bool)

(assert (=> d!71539 (= c!53586 lt!165235)))

(declare-fun containsKey!344 (List!5249 (_ BitVec 64)) Bool)

(assert (=> d!71539 (= lt!165235 (containsKey!344 (toList!2286 (getCurrentListMap!1807 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71539 (= (contains!2358 (getCurrentListMap!1807 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!165237)))

(declare-fun b!352485 () Bool)

(declare-fun lt!165236 () Unit!10899)

(assert (=> b!352485 (= e!215852 lt!165236)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!292 (List!5249 (_ BitVec 64)) Unit!10899)

(assert (=> b!352485 (= lt!165236 (lemmaContainsKeyImpliesGetValueByKeyDefined!292 (toList!2286 (getCurrentListMap!1807 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!358 0))(
  ( (Some!357 (v!6096 V!11269)) (None!356) )
))
(declare-fun isDefined!293 (Option!358) Bool)

(declare-fun getValueByKey!352 (List!5249 (_ BitVec 64)) Option!358)

(assert (=> b!352485 (isDefined!293 (getValueByKey!352 (toList!2286 (getCurrentListMap!1807 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!352486 () Bool)

(declare-fun Unit!10906 () Unit!10899)

(assert (=> b!352486 (= e!215852 Unit!10906)))

(declare-fun b!352487 () Bool)

(assert (=> b!352487 (= e!215853 (isDefined!293 (getValueByKey!352 (toList!2286 (getCurrentListMap!1807 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71539 c!53586) b!352485))

(assert (= (and d!71539 (not c!53586)) b!352486))

(assert (= (and d!71539 (not res!195467)) b!352487))

(declare-fun m!352119 () Bool)

(assert (=> d!71539 m!352119))

(declare-fun m!352121 () Bool)

(assert (=> b!352485 m!352121))

(declare-fun m!352123 () Bool)

(assert (=> b!352485 m!352123))

(assert (=> b!352485 m!352123))

(declare-fun m!352125 () Bool)

(assert (=> b!352485 m!352125))

(assert (=> b!352487 m!352123))

(assert (=> b!352487 m!352123))

(assert (=> b!352487 m!352125))

(assert (=> b!352408 d!71539))

(declare-fun b!352530 () Bool)

(declare-fun e!215886 () ListLongMap!4541)

(declare-fun call!27083 () ListLongMap!4541)

(declare-fun +!743 (ListLongMap!4541 tuple2!5628) ListLongMap!4541)

(assert (=> b!352530 (= e!215886 (+!743 call!27083 (tuple2!5629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!352531 () Bool)

(declare-fun c!53601 () Bool)

(assert (=> b!352531 (= c!53601 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!215882 () ListLongMap!4541)

(declare-fun e!215880 () ListLongMap!4541)

(assert (=> b!352531 (= e!215882 e!215880)))

(declare-fun b!352532 () Bool)

(declare-fun call!27082 () ListLongMap!4541)

(assert (=> b!352532 (= e!215882 call!27082)))

(declare-fun b!352533 () Bool)

(declare-fun e!215883 () Bool)

(assert (=> b!352533 (= e!215883 (validKeyInArray!0 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71541 () Bool)

(declare-fun e!215892 () Bool)

(assert (=> d!71541 e!215892))

(declare-fun res!195494 () Bool)

(assert (=> d!71541 (=> (not res!195494) (not e!215892))))

(assert (=> d!71541 (= res!195494 (or (bvsge #b00000000000000000000000000000000 (size!9369 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9369 _keys!1895)))))))

(declare-fun lt!165286 () ListLongMap!4541)

(declare-fun lt!165295 () ListLongMap!4541)

(assert (=> d!71541 (= lt!165286 lt!165295)))

(declare-fun lt!165292 () Unit!10899)

(declare-fun e!215884 () Unit!10899)

(assert (=> d!71541 (= lt!165292 e!215884)))

(declare-fun c!53603 () Bool)

(declare-fun e!215888 () Bool)

(assert (=> d!71541 (= c!53603 e!215888)))

(declare-fun res!195490 () Bool)

(assert (=> d!71541 (=> (not res!195490) (not e!215888))))

(assert (=> d!71541 (= res!195490 (bvslt #b00000000000000000000000000000000 (size!9369 _keys!1895)))))

(assert (=> d!71541 (= lt!165295 e!215886)))

(declare-fun c!53599 () Bool)

(assert (=> d!71541 (= c!53599 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71541 (validMask!0 mask!2385)))

(assert (=> d!71541 (= (getCurrentListMap!1807 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!165286)))

(declare-fun bm!27076 () Bool)

(declare-fun call!27085 () ListLongMap!4541)

(declare-fun call!27084 () ListLongMap!4541)

(assert (=> bm!27076 (= call!27085 call!27084)))

(declare-fun e!215887 () Bool)

(declare-fun b!352534 () Bool)

(declare-fun apply!294 (ListLongMap!4541 (_ BitVec 64)) V!11269)

(declare-fun get!4812 (ValueCell!3516 V!11269) V!11269)

(declare-fun dynLambda!637 (Int (_ BitVec 64)) V!11269)

(assert (=> b!352534 (= e!215887 (= (apply!294 lt!165286 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000)) (get!4812 (select (arr!9016 _values!1525) #b00000000000000000000000000000000) (dynLambda!637 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9368 _values!1525)))))

(assert (=> b!352534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9369 _keys!1895)))))

(declare-fun b!352535 () Bool)

(declare-fun e!215881 () Bool)

(declare-fun e!215885 () Bool)

(assert (=> b!352535 (= e!215881 e!215885)))

(declare-fun res!195492 () Bool)

(declare-fun call!27080 () Bool)

(assert (=> b!352535 (= res!195492 call!27080)))

(assert (=> b!352535 (=> (not res!195492) (not e!215885))))

(declare-fun b!352536 () Bool)

(declare-fun res!195486 () Bool)

(assert (=> b!352536 (=> (not res!195486) (not e!215892))))

(declare-fun e!215889 () Bool)

(assert (=> b!352536 (= res!195486 e!215889)))

(declare-fun res!195487 () Bool)

(assert (=> b!352536 (=> res!195487 e!215889)))

(assert (=> b!352536 (= res!195487 (not e!215883))))

(declare-fun res!195491 () Bool)

(assert (=> b!352536 (=> (not res!195491) (not e!215883))))

(assert (=> b!352536 (= res!195491 (bvslt #b00000000000000000000000000000000 (size!9369 _keys!1895)))))

(declare-fun b!352537 () Bool)

(assert (=> b!352537 (= e!215886 e!215882)))

(declare-fun c!53600 () Bool)

(assert (=> b!352537 (= c!53600 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!27081 () ListLongMap!4541)

(declare-fun bm!27077 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!616 (array!19029 array!19027 (_ BitVec 32) (_ BitVec 32) V!11269 V!11269 (_ BitVec 32) Int) ListLongMap!4541)

(assert (=> bm!27077 (= call!27081 (getCurrentListMapNoExtraKeys!616 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!27078 () Bool)

(assert (=> bm!27078 (= call!27083 (+!743 (ite c!53599 call!27081 (ite c!53600 call!27084 call!27085)) (ite (or c!53599 c!53600) (tuple2!5629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!352538 () Bool)

(declare-fun Unit!10907 () Unit!10899)

(assert (=> b!352538 (= e!215884 Unit!10907)))

(declare-fun b!352539 () Bool)

(declare-fun e!215890 () Bool)

(declare-fun call!27079 () Bool)

(assert (=> b!352539 (= e!215890 (not call!27079))))

(declare-fun b!352540 () Bool)

(assert (=> b!352540 (= e!215885 (= (apply!294 lt!165286 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!27079 () Bool)

(assert (=> bm!27079 (= call!27082 call!27083)))

(declare-fun b!352541 () Bool)

(declare-fun e!215891 () Bool)

(assert (=> b!352541 (= e!215891 (= (apply!294 lt!165286 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!352542 () Bool)

(declare-fun res!195493 () Bool)

(assert (=> b!352542 (=> (not res!195493) (not e!215892))))

(assert (=> b!352542 (= res!195493 e!215881)))

(declare-fun c!53604 () Bool)

(assert (=> b!352542 (= c!53604 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27080 () Bool)

(assert (=> bm!27080 (= call!27080 (contains!2358 lt!165286 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!352543 () Bool)

(assert (=> b!352543 (= e!215880 call!27082)))

(declare-fun b!352544 () Bool)

(assert (=> b!352544 (= e!215880 call!27085)))

(declare-fun b!352545 () Bool)

(declare-fun lt!165285 () Unit!10899)

(assert (=> b!352545 (= e!215884 lt!165285)))

(declare-fun lt!165299 () ListLongMap!4541)

(assert (=> b!352545 (= lt!165299 (getCurrentListMapNoExtraKeys!616 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165296 () (_ BitVec 64))

(assert (=> b!352545 (= lt!165296 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165288 () (_ BitVec 64))

(assert (=> b!352545 (= lt!165288 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165297 () Unit!10899)

(declare-fun addStillContains!270 (ListLongMap!4541 (_ BitVec 64) V!11269 (_ BitVec 64)) Unit!10899)

(assert (=> b!352545 (= lt!165297 (addStillContains!270 lt!165299 lt!165296 zeroValue!1467 lt!165288))))

(assert (=> b!352545 (contains!2358 (+!743 lt!165299 (tuple2!5629 lt!165296 zeroValue!1467)) lt!165288)))

(declare-fun lt!165284 () Unit!10899)

(assert (=> b!352545 (= lt!165284 lt!165297)))

(declare-fun lt!165302 () ListLongMap!4541)

(assert (=> b!352545 (= lt!165302 (getCurrentListMapNoExtraKeys!616 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165303 () (_ BitVec 64))

(assert (=> b!352545 (= lt!165303 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165289 () (_ BitVec 64))

(assert (=> b!352545 (= lt!165289 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165300 () Unit!10899)

(declare-fun addApplyDifferent!270 (ListLongMap!4541 (_ BitVec 64) V!11269 (_ BitVec 64)) Unit!10899)

(assert (=> b!352545 (= lt!165300 (addApplyDifferent!270 lt!165302 lt!165303 minValue!1467 lt!165289))))

(assert (=> b!352545 (= (apply!294 (+!743 lt!165302 (tuple2!5629 lt!165303 minValue!1467)) lt!165289) (apply!294 lt!165302 lt!165289))))

(declare-fun lt!165298 () Unit!10899)

(assert (=> b!352545 (= lt!165298 lt!165300)))

(declare-fun lt!165283 () ListLongMap!4541)

(assert (=> b!352545 (= lt!165283 (getCurrentListMapNoExtraKeys!616 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165293 () (_ BitVec 64))

(assert (=> b!352545 (= lt!165293 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165287 () (_ BitVec 64))

(assert (=> b!352545 (= lt!165287 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165304 () Unit!10899)

(assert (=> b!352545 (= lt!165304 (addApplyDifferent!270 lt!165283 lt!165293 zeroValue!1467 lt!165287))))

(assert (=> b!352545 (= (apply!294 (+!743 lt!165283 (tuple2!5629 lt!165293 zeroValue!1467)) lt!165287) (apply!294 lt!165283 lt!165287))))

(declare-fun lt!165301 () Unit!10899)

(assert (=> b!352545 (= lt!165301 lt!165304)))

(declare-fun lt!165294 () ListLongMap!4541)

(assert (=> b!352545 (= lt!165294 (getCurrentListMapNoExtraKeys!616 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165290 () (_ BitVec 64))

(assert (=> b!352545 (= lt!165290 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165291 () (_ BitVec 64))

(assert (=> b!352545 (= lt!165291 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!352545 (= lt!165285 (addApplyDifferent!270 lt!165294 lt!165290 minValue!1467 lt!165291))))

(assert (=> b!352545 (= (apply!294 (+!743 lt!165294 (tuple2!5629 lt!165290 minValue!1467)) lt!165291) (apply!294 lt!165294 lt!165291))))

(declare-fun b!352546 () Bool)

(assert (=> b!352546 (= e!215892 e!215890)))

(declare-fun c!53602 () Bool)

(assert (=> b!352546 (= c!53602 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!352547 () Bool)

(assert (=> b!352547 (= e!215890 e!215891)))

(declare-fun res!195488 () Bool)

(assert (=> b!352547 (= res!195488 call!27079)))

(assert (=> b!352547 (=> (not res!195488) (not e!215891))))

(declare-fun b!352548 () Bool)

(assert (=> b!352548 (= e!215881 (not call!27080))))

(declare-fun b!352549 () Bool)

(assert (=> b!352549 (= e!215888 (validKeyInArray!0 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27081 () Bool)

(assert (=> bm!27081 (= call!27084 call!27081)))

(declare-fun bm!27082 () Bool)

(assert (=> bm!27082 (= call!27079 (contains!2358 lt!165286 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!352550 () Bool)

(assert (=> b!352550 (= e!215889 e!215887)))

(declare-fun res!195489 () Bool)

(assert (=> b!352550 (=> (not res!195489) (not e!215887))))

(assert (=> b!352550 (= res!195489 (contains!2358 lt!165286 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!352550 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9369 _keys!1895)))))

(assert (= (and d!71541 c!53599) b!352530))

(assert (= (and d!71541 (not c!53599)) b!352537))

(assert (= (and b!352537 c!53600) b!352532))

(assert (= (and b!352537 (not c!53600)) b!352531))

(assert (= (and b!352531 c!53601) b!352543))

(assert (= (and b!352531 (not c!53601)) b!352544))

(assert (= (or b!352543 b!352544) bm!27076))

(assert (= (or b!352532 bm!27076) bm!27081))

(assert (= (or b!352532 b!352543) bm!27079))

(assert (= (or b!352530 bm!27081) bm!27077))

(assert (= (or b!352530 bm!27079) bm!27078))

(assert (= (and d!71541 res!195490) b!352549))

(assert (= (and d!71541 c!53603) b!352545))

(assert (= (and d!71541 (not c!53603)) b!352538))

(assert (= (and d!71541 res!195494) b!352536))

(assert (= (and b!352536 res!195491) b!352533))

(assert (= (and b!352536 (not res!195487)) b!352550))

(assert (= (and b!352550 res!195489) b!352534))

(assert (= (and b!352536 res!195486) b!352542))

(assert (= (and b!352542 c!53604) b!352535))

(assert (= (and b!352542 (not c!53604)) b!352548))

(assert (= (and b!352535 res!195492) b!352540))

(assert (= (or b!352535 b!352548) bm!27080))

(assert (= (and b!352542 res!195493) b!352546))

(assert (= (and b!352546 c!53602) b!352547))

(assert (= (and b!352546 (not c!53602)) b!352539))

(assert (= (and b!352547 res!195488) b!352541))

(assert (= (or b!352547 b!352539) bm!27082))

(declare-fun b_lambda!8515 () Bool)

(assert (=> (not b_lambda!8515) (not b!352534)))

(declare-fun t!10395 () Bool)

(declare-fun tb!3103 () Bool)

(assert (=> (and start!35148 (= defaultEntry!1528 defaultEntry!1528) t!10395) tb!3103))

(declare-fun result!5639 () Bool)

(assert (=> tb!3103 (= result!5639 tp_is_empty!7719)))

(assert (=> b!352534 t!10395))

(declare-fun b_and!15007 () Bool)

(assert (= b_and!15003 (and (=> t!10395 result!5639) b_and!15007)))

(assert (=> d!71541 m!352065))

(declare-fun m!352127 () Bool)

(assert (=> b!352540 m!352127))

(assert (=> b!352550 m!352107))

(assert (=> b!352550 m!352107))

(declare-fun m!352129 () Bool)

(assert (=> b!352550 m!352129))

(declare-fun m!352131 () Bool)

(assert (=> bm!27080 m!352131))

(declare-fun m!352133 () Bool)

(assert (=> b!352541 m!352133))

(declare-fun m!352135 () Bool)

(assert (=> bm!27077 m!352135))

(declare-fun m!352137 () Bool)

(assert (=> bm!27082 m!352137))

(assert (=> b!352533 m!352107))

(assert (=> b!352533 m!352107))

(assert (=> b!352533 m!352115))

(assert (=> b!352549 m!352107))

(assert (=> b!352549 m!352107))

(assert (=> b!352549 m!352115))

(declare-fun m!352139 () Bool)

(assert (=> b!352545 m!352139))

(declare-fun m!352141 () Bool)

(assert (=> b!352545 m!352141))

(assert (=> b!352545 m!352139))

(declare-fun m!352143 () Bool)

(assert (=> b!352545 m!352143))

(declare-fun m!352145 () Bool)

(assert (=> b!352545 m!352145))

(declare-fun m!352147 () Bool)

(assert (=> b!352545 m!352147))

(declare-fun m!352149 () Bool)

(assert (=> b!352545 m!352149))

(assert (=> b!352545 m!352143))

(declare-fun m!352151 () Bool)

(assert (=> b!352545 m!352151))

(declare-fun m!352153 () Bool)

(assert (=> b!352545 m!352153))

(declare-fun m!352155 () Bool)

(assert (=> b!352545 m!352155))

(assert (=> b!352545 m!352135))

(declare-fun m!352157 () Bool)

(assert (=> b!352545 m!352157))

(declare-fun m!352159 () Bool)

(assert (=> b!352545 m!352159))

(assert (=> b!352545 m!352107))

(declare-fun m!352161 () Bool)

(assert (=> b!352545 m!352161))

(assert (=> b!352545 m!352149))

(declare-fun m!352163 () Bool)

(assert (=> b!352545 m!352163))

(declare-fun m!352165 () Bool)

(assert (=> b!352545 m!352165))

(declare-fun m!352167 () Bool)

(assert (=> b!352545 m!352167))

(assert (=> b!352545 m!352153))

(declare-fun m!352169 () Bool)

(assert (=> bm!27078 m!352169))

(declare-fun m!352171 () Bool)

(assert (=> b!352530 m!352171))

(declare-fun m!352173 () Bool)

(assert (=> b!352534 m!352173))

(declare-fun m!352175 () Bool)

(assert (=> b!352534 m!352175))

(declare-fun m!352177 () Bool)

(assert (=> b!352534 m!352177))

(assert (=> b!352534 m!352175))

(assert (=> b!352534 m!352107))

(declare-fun m!352179 () Bool)

(assert (=> b!352534 m!352179))

(assert (=> b!352534 m!352173))

(assert (=> b!352534 m!352107))

(assert (=> b!352408 d!71541))

(declare-fun d!71543 () Bool)

(assert (=> d!71543 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352399 d!71543))

(declare-fun d!71545 () Bool)

(assert (=> d!71545 (contains!2358 (getCurrentListMap!1807 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!165307 () Unit!10899)

(declare-fun choose!1309 (array!19029 array!19027 (_ BitVec 32) (_ BitVec 32) V!11269 V!11269 (_ BitVec 64) (_ BitVec 32) Int) Unit!10899)

(assert (=> d!71545 (= lt!165307 (choose!1309 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71545 (validMask!0 mask!2385)))

(assert (=> d!71545 (= (lemmaArrayContainsKeyThenInListMap!335 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!165307)))

(declare-fun bs!11990 () Bool)

(assert (= bs!11990 d!71545))

(assert (=> bs!11990 m!352055))

(assert (=> bs!11990 m!352055))

(assert (=> bs!11990 m!352057))

(assert (=> bs!11990 m!352047))

(declare-fun m!352181 () Bool)

(assert (=> bs!11990 m!352181))

(assert (=> bs!11990 m!352065))

(assert (=> b!352412 d!71545))

(declare-fun d!71547 () Bool)

(declare-fun lt!165310 () (_ BitVec 32))

(assert (=> d!71547 (and (or (bvslt lt!165310 #b00000000000000000000000000000000) (bvsge lt!165310 (size!9369 _keys!1895)) (and (bvsge lt!165310 #b00000000000000000000000000000000) (bvslt lt!165310 (size!9369 _keys!1895)))) (bvsge lt!165310 #b00000000000000000000000000000000) (bvslt lt!165310 (size!9369 _keys!1895)) (= (select (arr!9017 _keys!1895) lt!165310) k0!1348))))

(declare-fun e!215895 () (_ BitVec 32))

(assert (=> d!71547 (= lt!165310 e!215895)))

(declare-fun c!53607 () Bool)

(assert (=> d!71547 (= c!53607 (= (select (arr!9017 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71547 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9369 _keys!1895)) (bvslt (size!9369 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71547 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!165310)))

(declare-fun b!352557 () Bool)

(assert (=> b!352557 (= e!215895 #b00000000000000000000000000000000)))

(declare-fun b!352558 () Bool)

(assert (=> b!352558 (= e!215895 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71547 c!53607) b!352557))

(assert (= (and d!71547 (not c!53607)) b!352558))

(declare-fun m!352183 () Bool)

(assert (=> d!71547 m!352183))

(assert (=> d!71547 m!352107))

(declare-fun m!352185 () Bool)

(assert (=> b!352558 m!352185))

(assert (=> b!352412 d!71547))

(declare-fun b!352569 () Bool)

(declare-fun e!215904 () Bool)

(declare-fun call!27088 () Bool)

(assert (=> b!352569 (= e!215904 call!27088)))

(declare-fun b!352570 () Bool)

(declare-fun e!215905 () Bool)

(assert (=> b!352570 (= e!215905 e!215904)))

(declare-fun c!53610 () Bool)

(assert (=> b!352570 (= c!53610 (validKeyInArray!0 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352571 () Bool)

(declare-fun e!215906 () Bool)

(declare-fun contains!2359 (List!5248 (_ BitVec 64)) Bool)

(assert (=> b!352571 (= e!215906 (contains!2359 Nil!5245 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352572 () Bool)

(declare-fun e!215907 () Bool)

(assert (=> b!352572 (= e!215907 e!215905)))

(declare-fun res!195501 () Bool)

(assert (=> b!352572 (=> (not res!195501) (not e!215905))))

(assert (=> b!352572 (= res!195501 (not e!215906))))

(declare-fun res!195503 () Bool)

(assert (=> b!352572 (=> (not res!195503) (not e!215906))))

(assert (=> b!352572 (= res!195503 (validKeyInArray!0 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71549 () Bool)

(declare-fun res!195502 () Bool)

(assert (=> d!71549 (=> res!195502 e!215907)))

(assert (=> d!71549 (= res!195502 (bvsge #b00000000000000000000000000000000 (size!9369 _keys!1895)))))

(assert (=> d!71549 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5245) e!215907)))

(declare-fun b!352573 () Bool)

(assert (=> b!352573 (= e!215904 call!27088)))

(declare-fun bm!27085 () Bool)

(assert (=> bm!27085 (= call!27088 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53610 (Cons!5244 (select (arr!9017 _keys!1895) #b00000000000000000000000000000000) Nil!5245) Nil!5245)))))

(assert (= (and d!71549 (not res!195502)) b!352572))

(assert (= (and b!352572 res!195503) b!352571))

(assert (= (and b!352572 res!195501) b!352570))

(assert (= (and b!352570 c!53610) b!352569))

(assert (= (and b!352570 (not c!53610)) b!352573))

(assert (= (or b!352569 b!352573) bm!27085))

(assert (=> b!352570 m!352107))

(assert (=> b!352570 m!352107))

(assert (=> b!352570 m!352115))

(assert (=> b!352571 m!352107))

(assert (=> b!352571 m!352107))

(declare-fun m!352187 () Bool)

(assert (=> b!352571 m!352187))

(assert (=> b!352572 m!352107))

(assert (=> b!352572 m!352107))

(assert (=> b!352572 m!352115))

(assert (=> bm!27085 m!352107))

(declare-fun m!352189 () Bool)

(assert (=> bm!27085 m!352189))

(assert (=> b!352398 d!71549))

(declare-fun b!352586 () Bool)

(declare-fun e!215915 () SeekEntryResult!3468)

(declare-fun lt!165318 () SeekEntryResult!3468)

(assert (=> b!352586 (= e!215915 (MissingZero!3468 (index!16053 lt!165318)))))

(declare-fun d!71551 () Bool)

(declare-fun lt!165319 () SeekEntryResult!3468)

(assert (=> d!71551 (and (or ((_ is Undefined!3468) lt!165319) (not ((_ is Found!3468) lt!165319)) (and (bvsge (index!16052 lt!165319) #b00000000000000000000000000000000) (bvslt (index!16052 lt!165319) (size!9369 _keys!1895)))) (or ((_ is Undefined!3468) lt!165319) ((_ is Found!3468) lt!165319) (not ((_ is MissingZero!3468) lt!165319)) (and (bvsge (index!16051 lt!165319) #b00000000000000000000000000000000) (bvslt (index!16051 lt!165319) (size!9369 _keys!1895)))) (or ((_ is Undefined!3468) lt!165319) ((_ is Found!3468) lt!165319) ((_ is MissingZero!3468) lt!165319) (not ((_ is MissingVacant!3468) lt!165319)) (and (bvsge (index!16054 lt!165319) #b00000000000000000000000000000000) (bvslt (index!16054 lt!165319) (size!9369 _keys!1895)))) (or ((_ is Undefined!3468) lt!165319) (ite ((_ is Found!3468) lt!165319) (= (select (arr!9017 _keys!1895) (index!16052 lt!165319)) k0!1348) (ite ((_ is MissingZero!3468) lt!165319) (= (select (arr!9017 _keys!1895) (index!16051 lt!165319)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3468) lt!165319) (= (select (arr!9017 _keys!1895) (index!16054 lt!165319)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!215916 () SeekEntryResult!3468)

(assert (=> d!71551 (= lt!165319 e!215916)))

(declare-fun c!53617 () Bool)

(assert (=> d!71551 (= c!53617 (and ((_ is Intermediate!3468) lt!165318) (undefined!4280 lt!165318)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19029 (_ BitVec 32)) SeekEntryResult!3468)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71551 (= lt!165318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71551 (validMask!0 mask!2385)))

(assert (=> d!71551 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!165319)))

(declare-fun b!352587 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19029 (_ BitVec 32)) SeekEntryResult!3468)

(assert (=> b!352587 (= e!215915 (seekKeyOrZeroReturnVacant!0 (x!35058 lt!165318) (index!16053 lt!165318) (index!16053 lt!165318) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352588 () Bool)

(declare-fun e!215914 () SeekEntryResult!3468)

(assert (=> b!352588 (= e!215916 e!215914)))

(declare-fun lt!165317 () (_ BitVec 64))

(assert (=> b!352588 (= lt!165317 (select (arr!9017 _keys!1895) (index!16053 lt!165318)))))

(declare-fun c!53619 () Bool)

(assert (=> b!352588 (= c!53619 (= lt!165317 k0!1348))))

(declare-fun b!352589 () Bool)

(assert (=> b!352589 (= e!215916 Undefined!3468)))

(declare-fun b!352590 () Bool)

(declare-fun c!53618 () Bool)

(assert (=> b!352590 (= c!53618 (= lt!165317 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!352590 (= e!215914 e!215915)))

(declare-fun b!352591 () Bool)

(assert (=> b!352591 (= e!215914 (Found!3468 (index!16053 lt!165318)))))

(assert (= (and d!71551 c!53617) b!352589))

(assert (= (and d!71551 (not c!53617)) b!352588))

(assert (= (and b!352588 c!53619) b!352591))

(assert (= (and b!352588 (not c!53619)) b!352590))

(assert (= (and b!352590 c!53618) b!352586))

(assert (= (and b!352590 (not c!53618)) b!352587))

(declare-fun m!352191 () Bool)

(assert (=> d!71551 m!352191))

(declare-fun m!352193 () Bool)

(assert (=> d!71551 m!352193))

(declare-fun m!352195 () Bool)

(assert (=> d!71551 m!352195))

(declare-fun m!352197 () Bool)

(assert (=> d!71551 m!352197))

(assert (=> d!71551 m!352065))

(assert (=> d!71551 m!352195))

(declare-fun m!352199 () Bool)

(assert (=> d!71551 m!352199))

(declare-fun m!352201 () Bool)

(assert (=> b!352587 m!352201))

(declare-fun m!352203 () Bool)

(assert (=> b!352588 m!352203))

(assert (=> b!352402 d!71551))

(declare-fun d!71553 () Bool)

(assert (=> d!71553 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35148 d!71553))

(declare-fun d!71555 () Bool)

(assert (=> d!71555 (= (array_inv!6646 _values!1525) (bvsge (size!9368 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35148 d!71555))

(declare-fun d!71557 () Bool)

(assert (=> d!71557 (= (array_inv!6647 _keys!1895) (bvsge (size!9369 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35148 d!71557))

(declare-fun condMapEmpty!13065 () Bool)

(declare-fun mapDefault!13065 () ValueCell!3516)

(assert (=> mapNonEmpty!13059 (= condMapEmpty!13065 (= mapRest!13059 ((as const (Array (_ BitVec 32) ValueCell!3516)) mapDefault!13065)))))

(declare-fun e!215921 () Bool)

(declare-fun mapRes!13065 () Bool)

(assert (=> mapNonEmpty!13059 (= tp!26888 (and e!215921 mapRes!13065))))

(declare-fun b!352598 () Bool)

(declare-fun e!215922 () Bool)

(assert (=> b!352598 (= e!215922 tp_is_empty!7719)))

(declare-fun mapIsEmpty!13065 () Bool)

(assert (=> mapIsEmpty!13065 mapRes!13065))

(declare-fun mapNonEmpty!13065 () Bool)

(declare-fun tp!26898 () Bool)

(assert (=> mapNonEmpty!13065 (= mapRes!13065 (and tp!26898 e!215922))))

(declare-fun mapValue!13065 () ValueCell!3516)

(declare-fun mapRest!13065 () (Array (_ BitVec 32) ValueCell!3516))

(declare-fun mapKey!13065 () (_ BitVec 32))

(assert (=> mapNonEmpty!13065 (= mapRest!13059 (store mapRest!13065 mapKey!13065 mapValue!13065))))

(declare-fun b!352599 () Bool)

(assert (=> b!352599 (= e!215921 tp_is_empty!7719)))

(assert (= (and mapNonEmpty!13059 condMapEmpty!13065) mapIsEmpty!13065))

(assert (= (and mapNonEmpty!13059 (not condMapEmpty!13065)) mapNonEmpty!13065))

(assert (= (and mapNonEmpty!13065 ((_ is ValueCellFull!3516) mapValue!13065)) b!352598))

(assert (= (and mapNonEmpty!13059 ((_ is ValueCellFull!3516) mapDefault!13065)) b!352599))

(declare-fun m!352205 () Bool)

(assert (=> mapNonEmpty!13065 m!352205))

(declare-fun b_lambda!8517 () Bool)

(assert (= b_lambda!8515 (or (and start!35148 b_free!7767) b_lambda!8517)))

(check-sat (not b!352549) (not d!71545) (not d!71539) (not b!352533) (not b_next!7767) (not bm!27077) (not b!352545) tp_is_empty!7719 (not b!352485) (not b!352558) (not d!71551) (not bm!27082) (not b!352478) (not bm!27085) (not mapNonEmpty!13065) (not b!352472) (not bm!27078) (not b!352541) (not b!352550) (not b!352570) b_and!15007 (not b!352487) (not b!352534) (not b!352587) (not b!352571) (not b!352540) (not b!352572) (not b!352530) (not b!352471) (not b_lambda!8517) (not bm!27080) (not d!71541) (not bm!27061))
(check-sat b_and!15007 (not b_next!7767))
