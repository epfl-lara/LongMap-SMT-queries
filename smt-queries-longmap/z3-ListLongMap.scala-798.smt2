; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19166 () Bool)

(assert start!19166)

(declare-fun b!188374 () Bool)

(declare-fun b_free!4627 () Bool)

(declare-fun b_next!4627 () Bool)

(assert (=> b!188374 (= b_free!4627 (not b_next!4627))))

(declare-fun tp!16705 () Bool)

(declare-fun b_and!11233 () Bool)

(assert (=> b!188374 (= tp!16705 b_and!11233)))

(declare-fun b!188372 () Bool)

(declare-fun res!89018 () Bool)

(declare-fun e!123967 () Bool)

(assert (=> b!188372 (=> (not res!89018) (not e!123967))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!188372 (= res!89018 (not (= key!828 (bvneg key!828))))))

(declare-fun b!188373 () Bool)

(declare-fun e!123964 () Bool)

(declare-fun tp_is_empty!4399 () Bool)

(assert (=> b!188373 (= e!123964 tp_is_empty!4399)))

(declare-fun e!123969 () Bool)

(declare-datatypes ((V!5513 0))(
  ( (V!5514 (val!2244 Int)) )
))
(declare-datatypes ((ValueCell!1856 0))(
  ( (ValueCellFull!1856 (v!4156 V!5513)) (EmptyCell!1856) )
))
(declare-datatypes ((array!8001 0))(
  ( (array!8002 (arr!3772 (Array (_ BitVec 32) (_ BitVec 64))) (size!4093 (_ BitVec 32))) )
))
(declare-datatypes ((array!8003 0))(
  ( (array!8004 (arr!3773 (Array (_ BitVec 32) ValueCell!1856)) (size!4094 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2620 0))(
  ( (LongMapFixedSize!2621 (defaultEntry!3845 Int) (mask!9013 (_ BitVec 32)) (extraKeys!3582 (_ BitVec 32)) (zeroValue!3686 V!5513) (minValue!3686 V!5513) (_size!1359 (_ BitVec 32)) (_keys!5805 array!8001) (_values!3828 array!8003) (_vacant!1359 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2620)

(declare-fun e!123973 () Bool)

(declare-fun array_inv!2441 (array!8001) Bool)

(declare-fun array_inv!2442 (array!8003) Bool)

(assert (=> b!188374 (= e!123969 (and tp!16705 tp_is_empty!4399 (array_inv!2441 (_keys!5805 thiss!1248)) (array_inv!2442 (_values!3828 thiss!1248)) e!123973))))

(declare-fun b!188375 () Bool)

(declare-fun e!123970 () Bool)

(assert (=> b!188375 (= e!123970 tp_is_empty!4399)))

(declare-fun b!188376 () Bool)

(declare-fun e!123965 () Bool)

(declare-datatypes ((List!2378 0))(
  ( (Nil!2375) (Cons!2374 (h!3011 (_ BitVec 64)) (t!7267 List!2378)) )
))
(declare-fun arrayNoDuplicates!0 (array!8001 (_ BitVec 32) List!2378) Bool)

(assert (=> b!188376 (= e!123965 (not (arrayNoDuplicates!0 (_keys!5805 thiss!1248) #b00000000000000000000000000000000 Nil!2375)))))

(declare-fun b!188377 () Bool)

(declare-datatypes ((Unit!5644 0))(
  ( (Unit!5645) )
))
(declare-fun e!123966 () Unit!5644)

(declare-fun Unit!5646 () Unit!5644)

(assert (=> b!188377 (= e!123966 Unit!5646)))

(declare-fun lt!93134 () Unit!5644)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!152 (array!8001 array!8003 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 64) Int) Unit!5644)

(assert (=> b!188377 (= lt!93134 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!152 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)))))

(assert (=> b!188377 false))

(declare-fun b!188378 () Bool)

(declare-fun e!123968 () Bool)

(declare-datatypes ((SeekEntryResult!658 0))(
  ( (MissingZero!658 (index!4802 (_ BitVec 32))) (Found!658 (index!4803 (_ BitVec 32))) (Intermediate!658 (undefined!1470 Bool) (index!4804 (_ BitVec 32)) (x!20361 (_ BitVec 32))) (Undefined!658) (MissingVacant!658 (index!4805 (_ BitVec 32))) )
))
(declare-fun lt!93136 () SeekEntryResult!658)

(assert (=> b!188378 (= e!123968 (= (select (arr!3772 (_keys!5805 thiss!1248)) (index!4803 lt!93136)) key!828))))

(declare-fun res!89022 () Bool)

(assert (=> start!19166 (=> (not res!89022) (not e!123967))))

(declare-fun valid!1096 (LongMapFixedSize!2620) Bool)

(assert (=> start!19166 (= res!89022 (valid!1096 thiss!1248))))

(assert (=> start!19166 e!123967))

(assert (=> start!19166 e!123969))

(assert (=> start!19166 true))

(declare-fun mapNonEmpty!7585 () Bool)

(declare-fun mapRes!7585 () Bool)

(declare-fun tp!16704 () Bool)

(assert (=> mapNonEmpty!7585 (= mapRes!7585 (and tp!16704 e!123970))))

(declare-fun mapValue!7585 () ValueCell!1856)

(declare-fun mapKey!7585 () (_ BitVec 32))

(declare-fun mapRest!7585 () (Array (_ BitVec 32) ValueCell!1856))

(assert (=> mapNonEmpty!7585 (= (arr!3773 (_values!3828 thiss!1248)) (store mapRest!7585 mapKey!7585 mapValue!7585))))

(declare-fun b!188379 () Bool)

(declare-fun e!123971 () Bool)

(assert (=> b!188379 (= e!123971 e!123965)))

(declare-fun res!89024 () Bool)

(assert (=> b!188379 (=> (not res!89024) (not e!123965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188379 (= res!89024 (validMask!0 (mask!9013 thiss!1248)))))

(declare-fun lt!93135 () Unit!5644)

(assert (=> b!188379 (= lt!93135 e!123966)))

(declare-fun c!33861 () Bool)

(declare-datatypes ((tuple2!3452 0))(
  ( (tuple2!3453 (_1!1737 (_ BitVec 64)) (_2!1737 V!5513)) )
))
(declare-datatypes ((List!2379 0))(
  ( (Nil!2376) (Cons!2375 (h!3012 tuple2!3452) (t!7268 List!2379)) )
))
(declare-datatypes ((ListLongMap!2361 0))(
  ( (ListLongMap!2362 (toList!1196 List!2379)) )
))
(declare-fun contains!1306 (ListLongMap!2361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!829 (array!8001 array!8003 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 32) Int) ListLongMap!2361)

(assert (=> b!188379 (= c!33861 (contains!1306 (getCurrentListMap!829 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)) key!828))))

(declare-fun b!188380 () Bool)

(declare-fun res!89021 () Bool)

(assert (=> b!188380 (=> (not res!89021) (not e!123965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8001 (_ BitVec 32)) Bool)

(assert (=> b!188380 (= res!89021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5805 thiss!1248) (mask!9013 thiss!1248)))))

(declare-fun b!188381 () Bool)

(assert (=> b!188381 (= e!123973 (and e!123964 mapRes!7585))))

(declare-fun condMapEmpty!7585 () Bool)

(declare-fun mapDefault!7585 () ValueCell!1856)

(assert (=> b!188381 (= condMapEmpty!7585 (= (arr!3773 (_values!3828 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1856)) mapDefault!7585)))))

(declare-fun b!188382 () Bool)

(declare-fun lt!93133 () Unit!5644)

(assert (=> b!188382 (= e!123966 lt!93133)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!154 (array!8001 array!8003 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 64) Int) Unit!5644)

(assert (=> b!188382 (= lt!93133 (lemmaInListMapThenSeekEntryOrOpenFindsIt!154 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)))))

(declare-fun res!89020 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188382 (= res!89020 (inRange!0 (index!4803 lt!93136) (mask!9013 thiss!1248)))))

(assert (=> b!188382 (=> (not res!89020) (not e!123968))))

(assert (=> b!188382 e!123968))

(declare-fun b!188383 () Bool)

(declare-fun res!89023 () Bool)

(assert (=> b!188383 (=> (not res!89023) (not e!123965))))

(assert (=> b!188383 (= res!89023 (and (= (size!4094 (_values!3828 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9013 thiss!1248))) (= (size!4093 (_keys!5805 thiss!1248)) (size!4094 (_values!3828 thiss!1248))) (bvsge (mask!9013 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3582 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3582 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!188384 () Bool)

(assert (=> b!188384 (= e!123967 e!123971)))

(declare-fun res!89019 () Bool)

(assert (=> b!188384 (=> (not res!89019) (not e!123971))))

(get-info :version)

(assert (=> b!188384 (= res!89019 (and (not ((_ is Undefined!658) lt!93136)) (not ((_ is MissingVacant!658) lt!93136)) (not ((_ is MissingZero!658) lt!93136)) ((_ is Found!658) lt!93136)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8001 (_ BitVec 32)) SeekEntryResult!658)

(assert (=> b!188384 (= lt!93136 (seekEntryOrOpen!0 key!828 (_keys!5805 thiss!1248) (mask!9013 thiss!1248)))))

(declare-fun mapIsEmpty!7585 () Bool)

(assert (=> mapIsEmpty!7585 mapRes!7585))

(assert (= (and start!19166 res!89022) b!188372))

(assert (= (and b!188372 res!89018) b!188384))

(assert (= (and b!188384 res!89019) b!188379))

(assert (= (and b!188379 c!33861) b!188382))

(assert (= (and b!188379 (not c!33861)) b!188377))

(assert (= (and b!188382 res!89020) b!188378))

(assert (= (and b!188379 res!89024) b!188383))

(assert (= (and b!188383 res!89023) b!188380))

(assert (= (and b!188380 res!89021) b!188376))

(assert (= (and b!188381 condMapEmpty!7585) mapIsEmpty!7585))

(assert (= (and b!188381 (not condMapEmpty!7585)) mapNonEmpty!7585))

(assert (= (and mapNonEmpty!7585 ((_ is ValueCellFull!1856) mapValue!7585)) b!188375))

(assert (= (and b!188381 ((_ is ValueCellFull!1856) mapDefault!7585)) b!188373))

(assert (= b!188374 b!188381))

(assert (= start!19166 b!188374))

(declare-fun m!214535 () Bool)

(assert (=> b!188382 m!214535))

(declare-fun m!214537 () Bool)

(assert (=> b!188382 m!214537))

(declare-fun m!214539 () Bool)

(assert (=> b!188374 m!214539))

(declare-fun m!214541 () Bool)

(assert (=> b!188374 m!214541))

(declare-fun m!214543 () Bool)

(assert (=> start!19166 m!214543))

(declare-fun m!214545 () Bool)

(assert (=> b!188378 m!214545))

(declare-fun m!214547 () Bool)

(assert (=> b!188380 m!214547))

(declare-fun m!214549 () Bool)

(assert (=> b!188377 m!214549))

(declare-fun m!214551 () Bool)

(assert (=> b!188379 m!214551))

(declare-fun m!214553 () Bool)

(assert (=> b!188379 m!214553))

(assert (=> b!188379 m!214553))

(declare-fun m!214555 () Bool)

(assert (=> b!188379 m!214555))

(declare-fun m!214557 () Bool)

(assert (=> b!188384 m!214557))

(declare-fun m!214559 () Bool)

(assert (=> b!188376 m!214559))

(declare-fun m!214561 () Bool)

(assert (=> mapNonEmpty!7585 m!214561))

(check-sat (not b_next!4627) (not b!188380) (not b!188382) (not b!188379) (not b!188377) (not mapNonEmpty!7585) b_and!11233 tp_is_empty!4399 (not b!188384) (not start!19166) (not b!188374) (not b!188376))
(check-sat b_and!11233 (not b_next!4627))
(get-model)

(declare-fun d!55487 () Bool)

(assert (=> d!55487 (= (array_inv!2441 (_keys!5805 thiss!1248)) (bvsge (size!4093 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188374 d!55487))

(declare-fun d!55489 () Bool)

(assert (=> d!55489 (= (array_inv!2442 (_values!3828 thiss!1248)) (bvsge (size!4094 (_values!3828 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188374 d!55489))

(declare-fun d!55491 () Bool)

(declare-fun res!89071 () Bool)

(declare-fun e!124042 () Bool)

(assert (=> d!55491 (=> res!89071 e!124042)))

(assert (=> d!55491 (= res!89071 (bvsge #b00000000000000000000000000000000 (size!4093 (_keys!5805 thiss!1248))))))

(assert (=> d!55491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5805 thiss!1248) (mask!9013 thiss!1248)) e!124042)))

(declare-fun bm!18979 () Bool)

(declare-fun call!18982 () Bool)

(assert (=> bm!18979 (= call!18982 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5805 thiss!1248) (mask!9013 thiss!1248)))))

(declare-fun b!188471 () Bool)

(declare-fun e!124041 () Bool)

(assert (=> b!188471 (= e!124041 call!18982)))

(declare-fun b!188472 () Bool)

(declare-fun e!124040 () Bool)

(assert (=> b!188472 (= e!124040 call!18982)))

(declare-fun b!188473 () Bool)

(assert (=> b!188473 (= e!124042 e!124041)))

(declare-fun c!33870 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!188473 (= c!33870 (validKeyInArray!0 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188474 () Bool)

(assert (=> b!188474 (= e!124041 e!124040)))

(declare-fun lt!93168 () (_ BitVec 64))

(assert (=> b!188474 (= lt!93168 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93167 () Unit!5644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8001 (_ BitVec 64) (_ BitVec 32)) Unit!5644)

(assert (=> b!188474 (= lt!93167 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5805 thiss!1248) lt!93168 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!188474 (arrayContainsKey!0 (_keys!5805 thiss!1248) lt!93168 #b00000000000000000000000000000000)))

(declare-fun lt!93169 () Unit!5644)

(assert (=> b!188474 (= lt!93169 lt!93167)))

(declare-fun res!89072 () Bool)

(assert (=> b!188474 (= res!89072 (= (seekEntryOrOpen!0 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000) (_keys!5805 thiss!1248) (mask!9013 thiss!1248)) (Found!658 #b00000000000000000000000000000000)))))

(assert (=> b!188474 (=> (not res!89072) (not e!124040))))

(assert (= (and d!55491 (not res!89071)) b!188473))

(assert (= (and b!188473 c!33870) b!188474))

(assert (= (and b!188473 (not c!33870)) b!188471))

(assert (= (and b!188474 res!89072) b!188472))

(assert (= (or b!188472 b!188471) bm!18979))

(declare-fun m!214619 () Bool)

(assert (=> bm!18979 m!214619))

(declare-fun m!214621 () Bool)

(assert (=> b!188473 m!214621))

(assert (=> b!188473 m!214621))

(declare-fun m!214623 () Bool)

(assert (=> b!188473 m!214623))

(assert (=> b!188474 m!214621))

(declare-fun m!214625 () Bool)

(assert (=> b!188474 m!214625))

(declare-fun m!214627 () Bool)

(assert (=> b!188474 m!214627))

(assert (=> b!188474 m!214621))

(declare-fun m!214629 () Bool)

(assert (=> b!188474 m!214629))

(assert (=> b!188380 d!55491))

(declare-fun d!55493 () Bool)

(assert (=> d!55493 (= (validMask!0 (mask!9013 thiss!1248)) (and (or (= (mask!9013 thiss!1248) #b00000000000000000000000000000111) (= (mask!9013 thiss!1248) #b00000000000000000000000000001111) (= (mask!9013 thiss!1248) #b00000000000000000000000000011111) (= (mask!9013 thiss!1248) #b00000000000000000000000000111111) (= (mask!9013 thiss!1248) #b00000000000000000000000001111111) (= (mask!9013 thiss!1248) #b00000000000000000000000011111111) (= (mask!9013 thiss!1248) #b00000000000000000000000111111111) (= (mask!9013 thiss!1248) #b00000000000000000000001111111111) (= (mask!9013 thiss!1248) #b00000000000000000000011111111111) (= (mask!9013 thiss!1248) #b00000000000000000000111111111111) (= (mask!9013 thiss!1248) #b00000000000000000001111111111111) (= (mask!9013 thiss!1248) #b00000000000000000011111111111111) (= (mask!9013 thiss!1248) #b00000000000000000111111111111111) (= (mask!9013 thiss!1248) #b00000000000000001111111111111111) (= (mask!9013 thiss!1248) #b00000000000000011111111111111111) (= (mask!9013 thiss!1248) #b00000000000000111111111111111111) (= (mask!9013 thiss!1248) #b00000000000001111111111111111111) (= (mask!9013 thiss!1248) #b00000000000011111111111111111111) (= (mask!9013 thiss!1248) #b00000000000111111111111111111111) (= (mask!9013 thiss!1248) #b00000000001111111111111111111111) (= (mask!9013 thiss!1248) #b00000000011111111111111111111111) (= (mask!9013 thiss!1248) #b00000000111111111111111111111111) (= (mask!9013 thiss!1248) #b00000001111111111111111111111111) (= (mask!9013 thiss!1248) #b00000011111111111111111111111111) (= (mask!9013 thiss!1248) #b00000111111111111111111111111111) (= (mask!9013 thiss!1248) #b00001111111111111111111111111111) (= (mask!9013 thiss!1248) #b00011111111111111111111111111111) (= (mask!9013 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9013 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!188379 d!55493))

(declare-fun d!55495 () Bool)

(declare-fun e!124047 () Bool)

(assert (=> d!55495 e!124047))

(declare-fun res!89075 () Bool)

(assert (=> d!55495 (=> res!89075 e!124047)))

(declare-fun lt!93181 () Bool)

(assert (=> d!55495 (= res!89075 (not lt!93181))))

(declare-fun lt!93180 () Bool)

(assert (=> d!55495 (= lt!93181 lt!93180)))

(declare-fun lt!93179 () Unit!5644)

(declare-fun e!124048 () Unit!5644)

(assert (=> d!55495 (= lt!93179 e!124048)))

(declare-fun c!33873 () Bool)

(assert (=> d!55495 (= c!33873 lt!93180)))

(declare-fun containsKey!233 (List!2379 (_ BitVec 64)) Bool)

(assert (=> d!55495 (= lt!93180 (containsKey!233 (toList!1196 (getCurrentListMap!829 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248))) key!828))))

(assert (=> d!55495 (= (contains!1306 (getCurrentListMap!829 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)) key!828) lt!93181)))

(declare-fun b!188481 () Bool)

(declare-fun lt!93178 () Unit!5644)

(assert (=> b!188481 (= e!124048 lt!93178)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!182 (List!2379 (_ BitVec 64)) Unit!5644)

(assert (=> b!188481 (= lt!93178 (lemmaContainsKeyImpliesGetValueByKeyDefined!182 (toList!1196 (getCurrentListMap!829 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248))) key!828))))

(declare-datatypes ((Option!235 0))(
  ( (Some!234 (v!4159 V!5513)) (None!233) )
))
(declare-fun isDefined!183 (Option!235) Bool)

(declare-fun getValueByKey!229 (List!2379 (_ BitVec 64)) Option!235)

(assert (=> b!188481 (isDefined!183 (getValueByKey!229 (toList!1196 (getCurrentListMap!829 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248))) key!828))))

(declare-fun b!188482 () Bool)

(declare-fun Unit!5650 () Unit!5644)

(assert (=> b!188482 (= e!124048 Unit!5650)))

(declare-fun b!188483 () Bool)

(assert (=> b!188483 (= e!124047 (isDefined!183 (getValueByKey!229 (toList!1196 (getCurrentListMap!829 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248))) key!828)))))

(assert (= (and d!55495 c!33873) b!188481))

(assert (= (and d!55495 (not c!33873)) b!188482))

(assert (= (and d!55495 (not res!89075)) b!188483))

(declare-fun m!214631 () Bool)

(assert (=> d!55495 m!214631))

(declare-fun m!214633 () Bool)

(assert (=> b!188481 m!214633))

(declare-fun m!214635 () Bool)

(assert (=> b!188481 m!214635))

(assert (=> b!188481 m!214635))

(declare-fun m!214637 () Bool)

(assert (=> b!188481 m!214637))

(assert (=> b!188483 m!214635))

(assert (=> b!188483 m!214635))

(assert (=> b!188483 m!214637))

(assert (=> b!188379 d!55495))

(declare-fun b!188526 () Bool)

(declare-fun e!124085 () ListLongMap!2361)

(declare-fun e!124076 () ListLongMap!2361)

(assert (=> b!188526 (= e!124085 e!124076)))

(declare-fun c!33891 () Bool)

(assert (=> b!188526 (= c!33891 (and (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!188527 () Bool)

(declare-fun res!89094 () Bool)

(declare-fun e!124077 () Bool)

(assert (=> b!188527 (=> (not res!89094) (not e!124077))))

(declare-fun e!124084 () Bool)

(assert (=> b!188527 (= res!89094 e!124084)))

(declare-fun res!89100 () Bool)

(assert (=> b!188527 (=> res!89100 e!124084)))

(declare-fun e!124086 () Bool)

(assert (=> b!188527 (= res!89100 (not e!124086))))

(declare-fun res!89095 () Bool)

(assert (=> b!188527 (=> (not res!89095) (not e!124086))))

(assert (=> b!188527 (= res!89095 (bvslt #b00000000000000000000000000000000 (size!4093 (_keys!5805 thiss!1248))))))

(declare-fun b!188528 () Bool)

(declare-fun e!124075 () Bool)

(declare-fun e!124083 () Bool)

(assert (=> b!188528 (= e!124075 e!124083)))

(declare-fun res!89099 () Bool)

(declare-fun call!19000 () Bool)

(assert (=> b!188528 (= res!89099 call!19000)))

(assert (=> b!188528 (=> (not res!89099) (not e!124083))))

(declare-fun b!188529 () Bool)

(declare-fun e!124078 () Bool)

(declare-fun lt!93245 () ListLongMap!2361)

(declare-fun apply!174 (ListLongMap!2361 (_ BitVec 64)) V!5513)

(assert (=> b!188529 (= e!124078 (= (apply!174 lt!93245 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3686 thiss!1248)))))

(declare-fun b!188530 () Bool)

(declare-fun e!124080 () Unit!5644)

(declare-fun lt!93226 () Unit!5644)

(assert (=> b!188530 (= e!124080 lt!93226)))

(declare-fun lt!93227 () ListLongMap!2361)

(declare-fun getCurrentListMapNoExtraKeys!195 (array!8001 array!8003 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 32) Int) ListLongMap!2361)

(assert (=> b!188530 (= lt!93227 (getCurrentListMapNoExtraKeys!195 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)))))

(declare-fun lt!93247 () (_ BitVec 64))

(assert (=> b!188530 (= lt!93247 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93242 () (_ BitVec 64))

(assert (=> b!188530 (= lt!93242 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93231 () Unit!5644)

(declare-fun addStillContains!150 (ListLongMap!2361 (_ BitVec 64) V!5513 (_ BitVec 64)) Unit!5644)

(assert (=> b!188530 (= lt!93231 (addStillContains!150 lt!93227 lt!93247 (zeroValue!3686 thiss!1248) lt!93242))))

(declare-fun +!291 (ListLongMap!2361 tuple2!3452) ListLongMap!2361)

(assert (=> b!188530 (contains!1306 (+!291 lt!93227 (tuple2!3453 lt!93247 (zeroValue!3686 thiss!1248))) lt!93242)))

(declare-fun lt!93238 () Unit!5644)

(assert (=> b!188530 (= lt!93238 lt!93231)))

(declare-fun lt!93230 () ListLongMap!2361)

(assert (=> b!188530 (= lt!93230 (getCurrentListMapNoExtraKeys!195 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)))))

(declare-fun lt!93232 () (_ BitVec 64))

(assert (=> b!188530 (= lt!93232 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93236 () (_ BitVec 64))

(assert (=> b!188530 (= lt!93236 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93229 () Unit!5644)

(declare-fun addApplyDifferent!150 (ListLongMap!2361 (_ BitVec 64) V!5513 (_ BitVec 64)) Unit!5644)

(assert (=> b!188530 (= lt!93229 (addApplyDifferent!150 lt!93230 lt!93232 (minValue!3686 thiss!1248) lt!93236))))

(assert (=> b!188530 (= (apply!174 (+!291 lt!93230 (tuple2!3453 lt!93232 (minValue!3686 thiss!1248))) lt!93236) (apply!174 lt!93230 lt!93236))))

(declare-fun lt!93243 () Unit!5644)

(assert (=> b!188530 (= lt!93243 lt!93229)))

(declare-fun lt!93234 () ListLongMap!2361)

(assert (=> b!188530 (= lt!93234 (getCurrentListMapNoExtraKeys!195 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)))))

(declare-fun lt!93233 () (_ BitVec 64))

(assert (=> b!188530 (= lt!93233 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93240 () (_ BitVec 64))

(assert (=> b!188530 (= lt!93240 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93246 () Unit!5644)

(assert (=> b!188530 (= lt!93246 (addApplyDifferent!150 lt!93234 lt!93233 (zeroValue!3686 thiss!1248) lt!93240))))

(assert (=> b!188530 (= (apply!174 (+!291 lt!93234 (tuple2!3453 lt!93233 (zeroValue!3686 thiss!1248))) lt!93240) (apply!174 lt!93234 lt!93240))))

(declare-fun lt!93244 () Unit!5644)

(assert (=> b!188530 (= lt!93244 lt!93246)))

(declare-fun lt!93235 () ListLongMap!2361)

(assert (=> b!188530 (= lt!93235 (getCurrentListMapNoExtraKeys!195 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)))))

(declare-fun lt!93228 () (_ BitVec 64))

(assert (=> b!188530 (= lt!93228 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93237 () (_ BitVec 64))

(assert (=> b!188530 (= lt!93237 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188530 (= lt!93226 (addApplyDifferent!150 lt!93235 lt!93228 (minValue!3686 thiss!1248) lt!93237))))

(assert (=> b!188530 (= (apply!174 (+!291 lt!93235 (tuple2!3453 lt!93228 (minValue!3686 thiss!1248))) lt!93237) (apply!174 lt!93235 lt!93237))))

(declare-fun b!188531 () Bool)

(declare-fun e!124081 () Bool)

(assert (=> b!188531 (= e!124081 (validKeyInArray!0 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188532 () Bool)

(declare-fun e!124079 () ListLongMap!2361)

(declare-fun call!18997 () ListLongMap!2361)

(assert (=> b!188532 (= e!124079 call!18997)))

(declare-fun b!188533 () Bool)

(assert (=> b!188533 (= e!124083 (= (apply!174 lt!93245 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3686 thiss!1248)))))

(declare-fun b!188534 () Bool)

(declare-fun e!124082 () Bool)

(declare-fun get!2175 (ValueCell!1856 V!5513) V!5513)

(declare-fun dynLambda!508 (Int (_ BitVec 64)) V!5513)

(assert (=> b!188534 (= e!124082 (= (apply!174 lt!93245 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000)) (get!2175 (select (arr!3773 (_values!3828 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!508 (defaultEntry!3845 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!188534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4094 (_values!3828 thiss!1248))))))

(assert (=> b!188534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4093 (_keys!5805 thiss!1248))))))

(declare-fun b!188535 () Bool)

(declare-fun call!18998 () ListLongMap!2361)

(assert (=> b!188535 (= e!124079 call!18998)))

(declare-fun b!188536 () Bool)

(declare-fun e!124087 () Bool)

(declare-fun call!19003 () Bool)

(assert (=> b!188536 (= e!124087 (not call!19003))))

(declare-fun b!188537 () Bool)

(declare-fun res!89096 () Bool)

(assert (=> b!188537 (=> (not res!89096) (not e!124077))))

(assert (=> b!188537 (= res!89096 e!124075)))

(declare-fun c!33886 () Bool)

(assert (=> b!188537 (= c!33886 (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!188538 () Bool)

(declare-fun c!33889 () Bool)

(assert (=> b!188538 (= c!33889 (and (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!188538 (= e!124076 e!124079)))

(declare-fun b!188539 () Bool)

(assert (=> b!188539 (= e!124076 call!18998)))

(declare-fun b!188540 () Bool)

(assert (=> b!188540 (= e!124077 e!124087)))

(declare-fun c!33890 () Bool)

(assert (=> b!188540 (= c!33890 (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!188541 () Bool)

(declare-fun Unit!5651 () Unit!5644)

(assert (=> b!188541 (= e!124080 Unit!5651)))

(declare-fun b!188542 () Bool)

(assert (=> b!188542 (= e!124087 e!124078)))

(declare-fun res!89098 () Bool)

(assert (=> b!188542 (= res!89098 call!19003)))

(assert (=> b!188542 (=> (not res!89098) (not e!124078))))

(declare-fun bm!18994 () Bool)

(assert (=> bm!18994 (= call!19003 (contains!1306 lt!93245 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18995 () Bool)

(declare-fun call!19001 () ListLongMap!2361)

(assert (=> bm!18995 (= call!18997 call!19001)))

(declare-fun d!55497 () Bool)

(assert (=> d!55497 e!124077))

(declare-fun res!89097 () Bool)

(assert (=> d!55497 (=> (not res!89097) (not e!124077))))

(assert (=> d!55497 (= res!89097 (or (bvsge #b00000000000000000000000000000000 (size!4093 (_keys!5805 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4093 (_keys!5805 thiss!1248))))))))

(declare-fun lt!93241 () ListLongMap!2361)

(assert (=> d!55497 (= lt!93245 lt!93241)))

(declare-fun lt!93239 () Unit!5644)

(assert (=> d!55497 (= lt!93239 e!124080)))

(declare-fun c!33888 () Bool)

(assert (=> d!55497 (= c!33888 e!124081)))

(declare-fun res!89102 () Bool)

(assert (=> d!55497 (=> (not res!89102) (not e!124081))))

(assert (=> d!55497 (= res!89102 (bvslt #b00000000000000000000000000000000 (size!4093 (_keys!5805 thiss!1248))))))

(assert (=> d!55497 (= lt!93241 e!124085)))

(declare-fun c!33887 () Bool)

(assert (=> d!55497 (= c!33887 (and (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55497 (validMask!0 (mask!9013 thiss!1248))))

(assert (=> d!55497 (= (getCurrentListMap!829 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)) lt!93245)))

(declare-fun call!19002 () ListLongMap!2361)

(declare-fun bm!18996 () Bool)

(declare-fun call!18999 () ListLongMap!2361)

(assert (=> bm!18996 (= call!19002 (+!291 (ite c!33887 call!18999 (ite c!33891 call!19001 call!18997)) (ite (or c!33887 c!33891) (tuple2!3453 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3686 thiss!1248)) (tuple2!3453 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3686 thiss!1248)))))))

(declare-fun bm!18997 () Bool)

(assert (=> bm!18997 (= call!19000 (contains!1306 lt!93245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18998 () Bool)

(assert (=> bm!18998 (= call!19001 call!18999)))

(declare-fun b!188543 () Bool)

(assert (=> b!188543 (= e!124086 (validKeyInArray!0 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188544 () Bool)

(assert (=> b!188544 (= e!124084 e!124082)))

(declare-fun res!89101 () Bool)

(assert (=> b!188544 (=> (not res!89101) (not e!124082))))

(assert (=> b!188544 (= res!89101 (contains!1306 lt!93245 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188544 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4093 (_keys!5805 thiss!1248))))))

(declare-fun bm!18999 () Bool)

(assert (=> bm!18999 (= call!18999 (getCurrentListMapNoExtraKeys!195 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)))))

(declare-fun bm!19000 () Bool)

(assert (=> bm!19000 (= call!18998 call!19002)))

(declare-fun b!188545 () Bool)

(assert (=> b!188545 (= e!124075 (not call!19000))))

(declare-fun b!188546 () Bool)

(assert (=> b!188546 (= e!124085 (+!291 call!19002 (tuple2!3453 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3686 thiss!1248))))))

(assert (= (and d!55497 c!33887) b!188546))

(assert (= (and d!55497 (not c!33887)) b!188526))

(assert (= (and b!188526 c!33891) b!188539))

(assert (= (and b!188526 (not c!33891)) b!188538))

(assert (= (and b!188538 c!33889) b!188535))

(assert (= (and b!188538 (not c!33889)) b!188532))

(assert (= (or b!188535 b!188532) bm!18995))

(assert (= (or b!188539 bm!18995) bm!18998))

(assert (= (or b!188539 b!188535) bm!19000))

(assert (= (or b!188546 bm!18998) bm!18999))

(assert (= (or b!188546 bm!19000) bm!18996))

(assert (= (and d!55497 res!89102) b!188531))

(assert (= (and d!55497 c!33888) b!188530))

(assert (= (and d!55497 (not c!33888)) b!188541))

(assert (= (and d!55497 res!89097) b!188527))

(assert (= (and b!188527 res!89095) b!188543))

(assert (= (and b!188527 (not res!89100)) b!188544))

(assert (= (and b!188544 res!89101) b!188534))

(assert (= (and b!188527 res!89094) b!188537))

(assert (= (and b!188537 c!33886) b!188528))

(assert (= (and b!188537 (not c!33886)) b!188545))

(assert (= (and b!188528 res!89099) b!188533))

(assert (= (or b!188528 b!188545) bm!18997))

(assert (= (and b!188537 res!89096) b!188540))

(assert (= (and b!188540 c!33890) b!188542))

(assert (= (and b!188540 (not c!33890)) b!188536))

(assert (= (and b!188542 res!89098) b!188529))

(assert (= (or b!188542 b!188536) bm!18994))

(declare-fun b_lambda!7297 () Bool)

(assert (=> (not b_lambda!7297) (not b!188534)))

(declare-fun t!7270 () Bool)

(declare-fun tb!2851 () Bool)

(assert (=> (and b!188374 (= (defaultEntry!3845 thiss!1248) (defaultEntry!3845 thiss!1248)) t!7270) tb!2851))

(declare-fun result!4847 () Bool)

(assert (=> tb!2851 (= result!4847 tp_is_empty!4399)))

(assert (=> b!188534 t!7270))

(declare-fun b_and!11239 () Bool)

(assert (= b_and!11233 (and (=> t!7270 result!4847) b_and!11239)))

(declare-fun m!214639 () Bool)

(assert (=> bm!18996 m!214639))

(declare-fun m!214641 () Bool)

(assert (=> bm!18994 m!214641))

(assert (=> b!188544 m!214621))

(assert (=> b!188544 m!214621))

(declare-fun m!214643 () Bool)

(assert (=> b!188544 m!214643))

(declare-fun m!214645 () Bool)

(assert (=> b!188530 m!214645))

(declare-fun m!214647 () Bool)

(assert (=> b!188530 m!214647))

(declare-fun m!214649 () Bool)

(assert (=> b!188530 m!214649))

(declare-fun m!214651 () Bool)

(assert (=> b!188530 m!214651))

(assert (=> b!188530 m!214621))

(declare-fun m!214653 () Bool)

(assert (=> b!188530 m!214653))

(assert (=> b!188530 m!214647))

(declare-fun m!214655 () Bool)

(assert (=> b!188530 m!214655))

(declare-fun m!214657 () Bool)

(assert (=> b!188530 m!214657))

(declare-fun m!214659 () Bool)

(assert (=> b!188530 m!214659))

(declare-fun m!214661 () Bool)

(assert (=> b!188530 m!214661))

(declare-fun m!214663 () Bool)

(assert (=> b!188530 m!214663))

(declare-fun m!214665 () Bool)

(assert (=> b!188530 m!214665))

(declare-fun m!214667 () Bool)

(assert (=> b!188530 m!214667))

(declare-fun m!214669 () Bool)

(assert (=> b!188530 m!214669))

(assert (=> b!188530 m!214667))

(assert (=> b!188530 m!214651))

(declare-fun m!214671 () Bool)

(assert (=> b!188530 m!214671))

(assert (=> b!188530 m!214661))

(declare-fun m!214673 () Bool)

(assert (=> b!188530 m!214673))

(declare-fun m!214675 () Bool)

(assert (=> b!188530 m!214675))

(assert (=> b!188543 m!214621))

(assert (=> b!188543 m!214621))

(assert (=> b!188543 m!214623))

(declare-fun m!214677 () Bool)

(assert (=> b!188546 m!214677))

(assert (=> bm!18999 m!214653))

(declare-fun m!214679 () Bool)

(assert (=> b!188529 m!214679))

(assert (=> d!55497 m!214551))

(declare-fun m!214681 () Bool)

(assert (=> b!188533 m!214681))

(assert (=> b!188531 m!214621))

(assert (=> b!188531 m!214621))

(assert (=> b!188531 m!214623))

(assert (=> b!188534 m!214621))

(declare-fun m!214683 () Bool)

(assert (=> b!188534 m!214683))

(declare-fun m!214685 () Bool)

(assert (=> b!188534 m!214685))

(assert (=> b!188534 m!214621))

(declare-fun m!214687 () Bool)

(assert (=> b!188534 m!214687))

(assert (=> b!188534 m!214685))

(assert (=> b!188534 m!214683))

(declare-fun m!214689 () Bool)

(assert (=> b!188534 m!214689))

(declare-fun m!214691 () Bool)

(assert (=> bm!18997 m!214691))

(assert (=> b!188379 d!55497))

(declare-fun b!188561 () Bool)

(declare-fun e!124096 () SeekEntryResult!658)

(declare-fun lt!93255 () SeekEntryResult!658)

(assert (=> b!188561 (= e!124096 (Found!658 (index!4804 lt!93255)))))

(declare-fun b!188562 () Bool)

(declare-fun e!124094 () SeekEntryResult!658)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8001 (_ BitVec 32)) SeekEntryResult!658)

(assert (=> b!188562 (= e!124094 (seekKeyOrZeroReturnVacant!0 (x!20361 lt!93255) (index!4804 lt!93255) (index!4804 lt!93255) key!828 (_keys!5805 thiss!1248) (mask!9013 thiss!1248)))))

(declare-fun b!188563 () Bool)

(assert (=> b!188563 (= e!124094 (MissingZero!658 (index!4804 lt!93255)))))

(declare-fun b!188564 () Bool)

(declare-fun c!33898 () Bool)

(declare-fun lt!93254 () (_ BitVec 64))

(assert (=> b!188564 (= c!33898 (= lt!93254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188564 (= e!124096 e!124094)))

(declare-fun b!188565 () Bool)

(declare-fun e!124095 () SeekEntryResult!658)

(assert (=> b!188565 (= e!124095 e!124096)))

(assert (=> b!188565 (= lt!93254 (select (arr!3772 (_keys!5805 thiss!1248)) (index!4804 lt!93255)))))

(declare-fun c!33900 () Bool)

(assert (=> b!188565 (= c!33900 (= lt!93254 key!828))))

(declare-fun b!188566 () Bool)

(assert (=> b!188566 (= e!124095 Undefined!658)))

(declare-fun d!55499 () Bool)

(declare-fun lt!93256 () SeekEntryResult!658)

(assert (=> d!55499 (and (or ((_ is Undefined!658) lt!93256) (not ((_ is Found!658) lt!93256)) (and (bvsge (index!4803 lt!93256) #b00000000000000000000000000000000) (bvslt (index!4803 lt!93256) (size!4093 (_keys!5805 thiss!1248))))) (or ((_ is Undefined!658) lt!93256) ((_ is Found!658) lt!93256) (not ((_ is MissingZero!658) lt!93256)) (and (bvsge (index!4802 lt!93256) #b00000000000000000000000000000000) (bvslt (index!4802 lt!93256) (size!4093 (_keys!5805 thiss!1248))))) (or ((_ is Undefined!658) lt!93256) ((_ is Found!658) lt!93256) ((_ is MissingZero!658) lt!93256) (not ((_ is MissingVacant!658) lt!93256)) (and (bvsge (index!4805 lt!93256) #b00000000000000000000000000000000) (bvslt (index!4805 lt!93256) (size!4093 (_keys!5805 thiss!1248))))) (or ((_ is Undefined!658) lt!93256) (ite ((_ is Found!658) lt!93256) (= (select (arr!3772 (_keys!5805 thiss!1248)) (index!4803 lt!93256)) key!828) (ite ((_ is MissingZero!658) lt!93256) (= (select (arr!3772 (_keys!5805 thiss!1248)) (index!4802 lt!93256)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!658) lt!93256) (= (select (arr!3772 (_keys!5805 thiss!1248)) (index!4805 lt!93256)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55499 (= lt!93256 e!124095)))

(declare-fun c!33899 () Bool)

(assert (=> d!55499 (= c!33899 (and ((_ is Intermediate!658) lt!93255) (undefined!1470 lt!93255)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8001 (_ BitVec 32)) SeekEntryResult!658)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55499 (= lt!93255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9013 thiss!1248)) key!828 (_keys!5805 thiss!1248) (mask!9013 thiss!1248)))))

(assert (=> d!55499 (validMask!0 (mask!9013 thiss!1248))))

(assert (=> d!55499 (= (seekEntryOrOpen!0 key!828 (_keys!5805 thiss!1248) (mask!9013 thiss!1248)) lt!93256)))

(assert (= (and d!55499 c!33899) b!188566))

(assert (= (and d!55499 (not c!33899)) b!188565))

(assert (= (and b!188565 c!33900) b!188561))

(assert (= (and b!188565 (not c!33900)) b!188564))

(assert (= (and b!188564 c!33898) b!188563))

(assert (= (and b!188564 (not c!33898)) b!188562))

(declare-fun m!214693 () Bool)

(assert (=> b!188562 m!214693))

(declare-fun m!214695 () Bool)

(assert (=> b!188565 m!214695))

(declare-fun m!214697 () Bool)

(assert (=> d!55499 m!214697))

(assert (=> d!55499 m!214551))

(declare-fun m!214699 () Bool)

(assert (=> d!55499 m!214699))

(declare-fun m!214701 () Bool)

(assert (=> d!55499 m!214701))

(declare-fun m!214703 () Bool)

(assert (=> d!55499 m!214703))

(declare-fun m!214705 () Bool)

(assert (=> d!55499 m!214705))

(assert (=> d!55499 m!214699))

(assert (=> b!188384 d!55499))

(declare-fun b!188583 () Bool)

(declare-fun e!124105 () Bool)

(declare-fun e!124107 () Bool)

(assert (=> b!188583 (= e!124105 e!124107)))

(declare-fun c!33906 () Bool)

(declare-fun lt!93261 () SeekEntryResult!658)

(assert (=> b!188583 (= c!33906 ((_ is MissingVacant!658) lt!93261))))

(declare-fun b!188584 () Bool)

(declare-fun e!124106 () Bool)

(assert (=> b!188584 (= e!124105 e!124106)))

(declare-fun res!89112 () Bool)

(declare-fun call!19008 () Bool)

(assert (=> b!188584 (= res!89112 call!19008)))

(assert (=> b!188584 (=> (not res!89112) (not e!124106))))

(declare-fun bm!19005 () Bool)

(declare-fun call!19009 () Bool)

(assert (=> bm!19005 (= call!19009 (arrayContainsKey!0 (_keys!5805 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun bm!19006 () Bool)

(declare-fun c!33905 () Bool)

(assert (=> bm!19006 (= call!19008 (inRange!0 (ite c!33905 (index!4802 lt!93261) (index!4805 lt!93261)) (mask!9013 thiss!1248)))))

(declare-fun b!188585 () Bool)

(declare-fun e!124108 () Bool)

(assert (=> b!188585 (= e!124108 (not call!19009))))

(declare-fun b!188586 () Bool)

(assert (=> b!188586 (= e!124107 ((_ is Undefined!658) lt!93261))))

(declare-fun b!188588 () Bool)

(assert (=> b!188588 (and (bvsge (index!4802 lt!93261) #b00000000000000000000000000000000) (bvslt (index!4802 lt!93261) (size!4093 (_keys!5805 thiss!1248))))))

(declare-fun res!89114 () Bool)

(assert (=> b!188588 (= res!89114 (= (select (arr!3772 (_keys!5805 thiss!1248)) (index!4802 lt!93261)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188588 (=> (not res!89114) (not e!124106))))

(declare-fun b!188589 () Bool)

(declare-fun res!89111 () Bool)

(assert (=> b!188589 (=> (not res!89111) (not e!124108))))

(assert (=> b!188589 (= res!89111 (= (select (arr!3772 (_keys!5805 thiss!1248)) (index!4805 lt!93261)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188589 (and (bvsge (index!4805 lt!93261) #b00000000000000000000000000000000) (bvslt (index!4805 lt!93261) (size!4093 (_keys!5805 thiss!1248))))))

(declare-fun b!188590 () Bool)

(declare-fun res!89113 () Bool)

(assert (=> b!188590 (=> (not res!89113) (not e!124108))))

(assert (=> b!188590 (= res!89113 call!19008)))

(assert (=> b!188590 (= e!124107 e!124108)))

(declare-fun b!188587 () Bool)

(assert (=> b!188587 (= e!124106 (not call!19009))))

(declare-fun d!55501 () Bool)

(assert (=> d!55501 e!124105))

(assert (=> d!55501 (= c!33905 ((_ is MissingZero!658) lt!93261))))

(assert (=> d!55501 (= lt!93261 (seekEntryOrOpen!0 key!828 (_keys!5805 thiss!1248) (mask!9013 thiss!1248)))))

(declare-fun lt!93262 () Unit!5644)

(declare-fun choose!1015 (array!8001 array!8003 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 64) Int) Unit!5644)

(assert (=> d!55501 (= lt!93262 (choose!1015 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)))))

(assert (=> d!55501 (validMask!0 (mask!9013 thiss!1248))))

(assert (=> d!55501 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!152 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)) lt!93262)))

(assert (= (and d!55501 c!33905) b!188584))

(assert (= (and d!55501 (not c!33905)) b!188583))

(assert (= (and b!188584 res!89112) b!188588))

(assert (= (and b!188588 res!89114) b!188587))

(assert (= (and b!188583 c!33906) b!188590))

(assert (= (and b!188583 (not c!33906)) b!188586))

(assert (= (and b!188590 res!89113) b!188589))

(assert (= (and b!188589 res!89111) b!188585))

(assert (= (or b!188584 b!188590) bm!19006))

(assert (= (or b!188587 b!188585) bm!19005))

(declare-fun m!214707 () Bool)

(assert (=> bm!19005 m!214707))

(assert (=> d!55501 m!214557))

(declare-fun m!214709 () Bool)

(assert (=> d!55501 m!214709))

(assert (=> d!55501 m!214551))

(declare-fun m!214711 () Bool)

(assert (=> b!188589 m!214711))

(declare-fun m!214713 () Bool)

(assert (=> bm!19006 m!214713))

(declare-fun m!214715 () Bool)

(assert (=> b!188588 m!214715))

(assert (=> b!188377 d!55501))

(declare-fun d!55503 () Bool)

(declare-fun e!124111 () Bool)

(assert (=> d!55503 e!124111))

(declare-fun res!89120 () Bool)

(assert (=> d!55503 (=> (not res!89120) (not e!124111))))

(declare-fun lt!93268 () SeekEntryResult!658)

(assert (=> d!55503 (= res!89120 ((_ is Found!658) lt!93268))))

(assert (=> d!55503 (= lt!93268 (seekEntryOrOpen!0 key!828 (_keys!5805 thiss!1248) (mask!9013 thiss!1248)))))

(declare-fun lt!93267 () Unit!5644)

(declare-fun choose!1016 (array!8001 array!8003 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 64) Int) Unit!5644)

(assert (=> d!55503 (= lt!93267 (choose!1016 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)))))

(assert (=> d!55503 (validMask!0 (mask!9013 thiss!1248))))

(assert (=> d!55503 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!154 (_keys!5805 thiss!1248) (_values!3828 thiss!1248) (mask!9013 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)) lt!93267)))

(declare-fun b!188595 () Bool)

(declare-fun res!89119 () Bool)

(assert (=> b!188595 (=> (not res!89119) (not e!124111))))

(assert (=> b!188595 (= res!89119 (inRange!0 (index!4803 lt!93268) (mask!9013 thiss!1248)))))

(declare-fun b!188596 () Bool)

(assert (=> b!188596 (= e!124111 (= (select (arr!3772 (_keys!5805 thiss!1248)) (index!4803 lt!93268)) key!828))))

(assert (=> b!188596 (and (bvsge (index!4803 lt!93268) #b00000000000000000000000000000000) (bvslt (index!4803 lt!93268) (size!4093 (_keys!5805 thiss!1248))))))

(assert (= (and d!55503 res!89120) b!188595))

(assert (= (and b!188595 res!89119) b!188596))

(assert (=> d!55503 m!214557))

(declare-fun m!214717 () Bool)

(assert (=> d!55503 m!214717))

(assert (=> d!55503 m!214551))

(declare-fun m!214719 () Bool)

(assert (=> b!188595 m!214719))

(declare-fun m!214721 () Bool)

(assert (=> b!188596 m!214721))

(assert (=> b!188382 d!55503))

(declare-fun d!55505 () Bool)

(assert (=> d!55505 (= (inRange!0 (index!4803 lt!93136) (mask!9013 thiss!1248)) (and (bvsge (index!4803 lt!93136) #b00000000000000000000000000000000) (bvslt (index!4803 lt!93136) (bvadd (mask!9013 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!188382 d!55505))

(declare-fun d!55507 () Bool)

(declare-fun res!89128 () Bool)

(declare-fun e!124122 () Bool)

(assert (=> d!55507 (=> res!89128 e!124122)))

(assert (=> d!55507 (= res!89128 (bvsge #b00000000000000000000000000000000 (size!4093 (_keys!5805 thiss!1248))))))

(assert (=> d!55507 (= (arrayNoDuplicates!0 (_keys!5805 thiss!1248) #b00000000000000000000000000000000 Nil!2375) e!124122)))

(declare-fun b!188607 () Bool)

(declare-fun e!124121 () Bool)

(declare-fun contains!1307 (List!2378 (_ BitVec 64)) Bool)

(assert (=> b!188607 (= e!124121 (contains!1307 Nil!2375 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188608 () Bool)

(declare-fun e!124120 () Bool)

(declare-fun e!124123 () Bool)

(assert (=> b!188608 (= e!124120 e!124123)))

(declare-fun c!33909 () Bool)

(assert (=> b!188608 (= c!33909 (validKeyInArray!0 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188609 () Bool)

(declare-fun call!19012 () Bool)

(assert (=> b!188609 (= e!124123 call!19012)))

(declare-fun b!188610 () Bool)

(assert (=> b!188610 (= e!124122 e!124120)))

(declare-fun res!89127 () Bool)

(assert (=> b!188610 (=> (not res!89127) (not e!124120))))

(assert (=> b!188610 (= res!89127 (not e!124121))))

(declare-fun res!89129 () Bool)

(assert (=> b!188610 (=> (not res!89129) (not e!124121))))

(assert (=> b!188610 (= res!89129 (validKeyInArray!0 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19009 () Bool)

(assert (=> bm!19009 (= call!19012 (arrayNoDuplicates!0 (_keys!5805 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33909 (Cons!2374 (select (arr!3772 (_keys!5805 thiss!1248)) #b00000000000000000000000000000000) Nil!2375) Nil!2375)))))

(declare-fun b!188611 () Bool)

(assert (=> b!188611 (= e!124123 call!19012)))

(assert (= (and d!55507 (not res!89128)) b!188610))

(assert (= (and b!188610 res!89129) b!188607))

(assert (= (and b!188610 res!89127) b!188608))

(assert (= (and b!188608 c!33909) b!188611))

(assert (= (and b!188608 (not c!33909)) b!188609))

(assert (= (or b!188611 b!188609) bm!19009))

(assert (=> b!188607 m!214621))

(assert (=> b!188607 m!214621))

(declare-fun m!214723 () Bool)

(assert (=> b!188607 m!214723))

(assert (=> b!188608 m!214621))

(assert (=> b!188608 m!214621))

(assert (=> b!188608 m!214623))

(assert (=> b!188610 m!214621))

(assert (=> b!188610 m!214621))

(assert (=> b!188610 m!214623))

(assert (=> bm!19009 m!214621))

(declare-fun m!214725 () Bool)

(assert (=> bm!19009 m!214725))

(assert (=> b!188376 d!55507))

(declare-fun d!55509 () Bool)

(declare-fun res!89136 () Bool)

(declare-fun e!124126 () Bool)

(assert (=> d!55509 (=> (not res!89136) (not e!124126))))

(declare-fun simpleValid!190 (LongMapFixedSize!2620) Bool)

(assert (=> d!55509 (= res!89136 (simpleValid!190 thiss!1248))))

(assert (=> d!55509 (= (valid!1096 thiss!1248) e!124126)))

(declare-fun b!188618 () Bool)

(declare-fun res!89137 () Bool)

(assert (=> b!188618 (=> (not res!89137) (not e!124126))))

(declare-fun arrayCountValidKeys!0 (array!8001 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!188618 (= res!89137 (= (arrayCountValidKeys!0 (_keys!5805 thiss!1248) #b00000000000000000000000000000000 (size!4093 (_keys!5805 thiss!1248))) (_size!1359 thiss!1248)))))

(declare-fun b!188619 () Bool)

(declare-fun res!89138 () Bool)

(assert (=> b!188619 (=> (not res!89138) (not e!124126))))

(assert (=> b!188619 (= res!89138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5805 thiss!1248) (mask!9013 thiss!1248)))))

(declare-fun b!188620 () Bool)

(assert (=> b!188620 (= e!124126 (arrayNoDuplicates!0 (_keys!5805 thiss!1248) #b00000000000000000000000000000000 Nil!2375))))

(assert (= (and d!55509 res!89136) b!188618))

(assert (= (and b!188618 res!89137) b!188619))

(assert (= (and b!188619 res!89138) b!188620))

(declare-fun m!214727 () Bool)

(assert (=> d!55509 m!214727))

(declare-fun m!214729 () Bool)

(assert (=> b!188618 m!214729))

(assert (=> b!188619 m!214547))

(assert (=> b!188620 m!214559))

(assert (=> start!19166 d!55509))

(declare-fun condMapEmpty!7594 () Bool)

(declare-fun mapDefault!7594 () ValueCell!1856)

(assert (=> mapNonEmpty!7585 (= condMapEmpty!7594 (= mapRest!7585 ((as const (Array (_ BitVec 32) ValueCell!1856)) mapDefault!7594)))))

(declare-fun e!124132 () Bool)

(declare-fun mapRes!7594 () Bool)

(assert (=> mapNonEmpty!7585 (= tp!16704 (and e!124132 mapRes!7594))))

(declare-fun mapNonEmpty!7594 () Bool)

(declare-fun tp!16720 () Bool)

(declare-fun e!124131 () Bool)

(assert (=> mapNonEmpty!7594 (= mapRes!7594 (and tp!16720 e!124131))))

(declare-fun mapValue!7594 () ValueCell!1856)

(declare-fun mapKey!7594 () (_ BitVec 32))

(declare-fun mapRest!7594 () (Array (_ BitVec 32) ValueCell!1856))

(assert (=> mapNonEmpty!7594 (= mapRest!7585 (store mapRest!7594 mapKey!7594 mapValue!7594))))

(declare-fun b!188628 () Bool)

(assert (=> b!188628 (= e!124132 tp_is_empty!4399)))

(declare-fun mapIsEmpty!7594 () Bool)

(assert (=> mapIsEmpty!7594 mapRes!7594))

(declare-fun b!188627 () Bool)

(assert (=> b!188627 (= e!124131 tp_is_empty!4399)))

(assert (= (and mapNonEmpty!7585 condMapEmpty!7594) mapIsEmpty!7594))

(assert (= (and mapNonEmpty!7585 (not condMapEmpty!7594)) mapNonEmpty!7594))

(assert (= (and mapNonEmpty!7594 ((_ is ValueCellFull!1856) mapValue!7594)) b!188627))

(assert (= (and mapNonEmpty!7585 ((_ is ValueCellFull!1856) mapDefault!7594)) b!188628))

(declare-fun m!214731 () Bool)

(assert (=> mapNonEmpty!7594 m!214731))

(declare-fun b_lambda!7299 () Bool)

(assert (= b_lambda!7297 (or (and b!188374 b_free!4627) b_lambda!7299)))

(check-sat (not b_lambda!7299) (not b_next!4627) (not b!188595) (not b!188531) (not b!188529) (not d!55509) (not bm!18979) (not b!188474) (not b!188481) (not bm!19006) (not b!188544) (not bm!18994) (not bm!18996) tp_is_empty!4399 (not b!188562) (not b!188546) (not bm!19005) (not b!188534) (not b!188473) (not b!188533) (not bm!18999) (not bm!18997) (not b!188610) (not d!55499) (not mapNonEmpty!7594) (not d!55501) (not b!188483) (not b!188618) (not b!188530) (not bm!19009) (not b!188608) (not b!188620) (not b!188619) (not b!188607) (not d!55503) (not d!55497) (not b!188543) b_and!11239 (not d!55495))
(check-sat b_and!11239 (not b_next!4627))
