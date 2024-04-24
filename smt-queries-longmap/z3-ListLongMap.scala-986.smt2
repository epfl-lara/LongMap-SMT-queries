; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21282 () Bool)

(assert start!21282)

(declare-fun b!214295 () Bool)

(declare-fun b_free!5665 () Bool)

(declare-fun b_next!5665 () Bool)

(assert (=> b!214295 (= b_free!5665 (not b_next!5665))))

(declare-fun tp!20079 () Bool)

(declare-fun b_and!12569 () Bool)

(assert (=> b!214295 (= tp!20079 b_and!12569)))

(declare-fun b!214294 () Bool)

(declare-fun e!139355 () Bool)

(declare-datatypes ((V!7017 0))(
  ( (V!7018 (val!2808 Int)) )
))
(declare-datatypes ((ValueCell!2420 0))(
  ( (ValueCellFull!2420 (v!4827 V!7017)) (EmptyCell!2420) )
))
(declare-datatypes ((array!10261 0))(
  ( (array!10262 (arr!4867 (Array (_ BitVec 32) ValueCell!2420)) (size!5193 (_ BitVec 32))) )
))
(declare-datatypes ((array!10263 0))(
  ( (array!10264 (arr!4868 (Array (_ BitVec 32) (_ BitVec 64))) (size!5194 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2740 0))(
  ( (LongMapFixedSize!2741 (defaultEntry!4020 Int) (mask!9675 (_ BitVec 32)) (extraKeys!3757 (_ BitVec 32)) (zeroValue!3861 V!7017) (minValue!3861 V!7017) (_size!1419 (_ BitVec 32)) (_keys!6037 array!10263) (_values!4003 array!10261) (_vacant!1419 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2740)

(assert (=> b!214294 (= e!139355 (and (bvsge (mask!9675 thiss!1504) #b00000000000000000000000000000000) (not (= (size!5194 (_keys!6037 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9675 thiss!1504))))))))

(declare-fun tp_is_empty!5527 () Bool)

(declare-fun e!139356 () Bool)

(declare-fun e!139352 () Bool)

(declare-fun array_inv!3195 (array!10263) Bool)

(declare-fun array_inv!3196 (array!10261) Bool)

(assert (=> b!214295 (= e!139356 (and tp!20079 tp_is_empty!5527 (array_inv!3195 (_keys!6037 thiss!1504)) (array_inv!3196 (_values!4003 thiss!1504)) e!139352))))

(declare-fun mapNonEmpty!9402 () Bool)

(declare-fun mapRes!9402 () Bool)

(declare-fun tp!20078 () Bool)

(declare-fun e!139353 () Bool)

(assert (=> mapNonEmpty!9402 (= mapRes!9402 (and tp!20078 e!139353))))

(declare-fun mapValue!9402 () ValueCell!2420)

(declare-fun mapRest!9402 () (Array (_ BitVec 32) ValueCell!2420))

(declare-fun mapKey!9402 () (_ BitVec 32))

(assert (=> mapNonEmpty!9402 (= (arr!4867 (_values!4003 thiss!1504)) (store mapRest!9402 mapKey!9402 mapValue!9402))))

(declare-fun b!214297 () Bool)

(declare-fun res!104907 () Bool)

(assert (=> b!214297 (=> (not res!104907) (not e!139355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214297 (= res!104907 (validMask!0 (mask!9675 thiss!1504)))))

(declare-fun res!104908 () Bool)

(assert (=> start!21282 (=> (not res!104908) (not e!139355))))

(declare-fun valid!1143 (LongMapFixedSize!2740) Bool)

(assert (=> start!21282 (= res!104908 (valid!1143 thiss!1504))))

(assert (=> start!21282 e!139355))

(assert (=> start!21282 e!139356))

(assert (=> start!21282 true))

(declare-fun b!214296 () Bool)

(declare-fun e!139357 () Bool)

(assert (=> b!214296 (= e!139357 tp_is_empty!5527)))

(declare-fun b!214298 () Bool)

(declare-fun res!104906 () Bool)

(assert (=> b!214298 (=> (not res!104906) (not e!139355))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214298 (= res!104906 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214299 () Bool)

(assert (=> b!214299 (= e!139353 tp_is_empty!5527)))

(declare-fun mapIsEmpty!9402 () Bool)

(assert (=> mapIsEmpty!9402 mapRes!9402))

(declare-fun b!214300 () Bool)

(assert (=> b!214300 (= e!139352 (and e!139357 mapRes!9402))))

(declare-fun condMapEmpty!9402 () Bool)

(declare-fun mapDefault!9402 () ValueCell!2420)

(assert (=> b!214300 (= condMapEmpty!9402 (= (arr!4867 (_values!4003 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2420)) mapDefault!9402)))))

(assert (= (and start!21282 res!104908) b!214298))

(assert (= (and b!214298 res!104906) b!214297))

(assert (= (and b!214297 res!104907) b!214294))

(assert (= (and b!214300 condMapEmpty!9402) mapIsEmpty!9402))

(assert (= (and b!214300 (not condMapEmpty!9402)) mapNonEmpty!9402))

(get-info :version)

(assert (= (and mapNonEmpty!9402 ((_ is ValueCellFull!2420) mapValue!9402)) b!214299))

(assert (= (and b!214300 ((_ is ValueCellFull!2420) mapDefault!9402)) b!214296))

(assert (= b!214295 b!214300))

(assert (= start!21282 b!214295))

(declare-fun m!242203 () Bool)

(assert (=> b!214295 m!242203))

(declare-fun m!242205 () Bool)

(assert (=> b!214295 m!242205))

(declare-fun m!242207 () Bool)

(assert (=> mapNonEmpty!9402 m!242207))

(declare-fun m!242209 () Bool)

(assert (=> b!214297 m!242209))

(declare-fun m!242211 () Bool)

(assert (=> start!21282 m!242211))

(check-sat (not b_next!5665) tp_is_empty!5527 (not b!214297) (not mapNonEmpty!9402) (not start!21282) (not b!214295) b_and!12569)
(check-sat b_and!12569 (not b_next!5665))
(get-model)

(declare-fun d!58363 () Bool)

(assert (=> d!58363 (= (validMask!0 (mask!9675 thiss!1504)) (and (or (= (mask!9675 thiss!1504) #b00000000000000000000000000000111) (= (mask!9675 thiss!1504) #b00000000000000000000000000001111) (= (mask!9675 thiss!1504) #b00000000000000000000000000011111) (= (mask!9675 thiss!1504) #b00000000000000000000000000111111) (= (mask!9675 thiss!1504) #b00000000000000000000000001111111) (= (mask!9675 thiss!1504) #b00000000000000000000000011111111) (= (mask!9675 thiss!1504) #b00000000000000000000000111111111) (= (mask!9675 thiss!1504) #b00000000000000000000001111111111) (= (mask!9675 thiss!1504) #b00000000000000000000011111111111) (= (mask!9675 thiss!1504) #b00000000000000000000111111111111) (= (mask!9675 thiss!1504) #b00000000000000000001111111111111) (= (mask!9675 thiss!1504) #b00000000000000000011111111111111) (= (mask!9675 thiss!1504) #b00000000000000000111111111111111) (= (mask!9675 thiss!1504) #b00000000000000001111111111111111) (= (mask!9675 thiss!1504) #b00000000000000011111111111111111) (= (mask!9675 thiss!1504) #b00000000000000111111111111111111) (= (mask!9675 thiss!1504) #b00000000000001111111111111111111) (= (mask!9675 thiss!1504) #b00000000000011111111111111111111) (= (mask!9675 thiss!1504) #b00000000000111111111111111111111) (= (mask!9675 thiss!1504) #b00000000001111111111111111111111) (= (mask!9675 thiss!1504) #b00000000011111111111111111111111) (= (mask!9675 thiss!1504) #b00000000111111111111111111111111) (= (mask!9675 thiss!1504) #b00000001111111111111111111111111) (= (mask!9675 thiss!1504) #b00000011111111111111111111111111) (= (mask!9675 thiss!1504) #b00000111111111111111111111111111) (= (mask!9675 thiss!1504) #b00001111111111111111111111111111) (= (mask!9675 thiss!1504) #b00011111111111111111111111111111) (= (mask!9675 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9675 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214297 d!58363))

(declare-fun d!58365 () Bool)

(assert (=> d!58365 (= (array_inv!3195 (_keys!6037 thiss!1504)) (bvsge (size!5194 (_keys!6037 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214295 d!58365))

(declare-fun d!58367 () Bool)

(assert (=> d!58367 (= (array_inv!3196 (_values!4003 thiss!1504)) (bvsge (size!5193 (_values!4003 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214295 d!58367))

(declare-fun d!58369 () Bool)

(declare-fun res!104933 () Bool)

(declare-fun e!139396 () Bool)

(assert (=> d!58369 (=> (not res!104933) (not e!139396))))

(declare-fun simpleValid!209 (LongMapFixedSize!2740) Bool)

(assert (=> d!58369 (= res!104933 (simpleValid!209 thiss!1504))))

(assert (=> d!58369 (= (valid!1143 thiss!1504) e!139396)))

(declare-fun b!214349 () Bool)

(declare-fun res!104934 () Bool)

(assert (=> b!214349 (=> (not res!104934) (not e!139396))))

(declare-fun arrayCountValidKeys!0 (array!10263 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214349 (= res!104934 (= (arrayCountValidKeys!0 (_keys!6037 thiss!1504) #b00000000000000000000000000000000 (size!5194 (_keys!6037 thiss!1504))) (_size!1419 thiss!1504)))))

(declare-fun b!214350 () Bool)

(declare-fun res!104935 () Bool)

(assert (=> b!214350 (=> (not res!104935) (not e!139396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10263 (_ BitVec 32)) Bool)

(assert (=> b!214350 (= res!104935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6037 thiss!1504) (mask!9675 thiss!1504)))))

(declare-fun b!214351 () Bool)

(declare-datatypes ((List!3063 0))(
  ( (Nil!3060) (Cons!3059 (h!3701 (_ BitVec 64)) (t!8010 List!3063)) )
))
(declare-fun arrayNoDuplicates!0 (array!10263 (_ BitVec 32) List!3063) Bool)

(assert (=> b!214351 (= e!139396 (arrayNoDuplicates!0 (_keys!6037 thiss!1504) #b00000000000000000000000000000000 Nil!3060))))

(assert (= (and d!58369 res!104933) b!214349))

(assert (= (and b!214349 res!104934) b!214350))

(assert (= (and b!214350 res!104935) b!214351))

(declare-fun m!242233 () Bool)

(assert (=> d!58369 m!242233))

(declare-fun m!242235 () Bool)

(assert (=> b!214349 m!242235))

(declare-fun m!242237 () Bool)

(assert (=> b!214350 m!242237))

(declare-fun m!242239 () Bool)

(assert (=> b!214351 m!242239))

(assert (=> start!21282 d!58369))

(declare-fun mapIsEmpty!9411 () Bool)

(declare-fun mapRes!9411 () Bool)

(assert (=> mapIsEmpty!9411 mapRes!9411))

(declare-fun b!214359 () Bool)

(declare-fun e!139401 () Bool)

(assert (=> b!214359 (= e!139401 tp_is_empty!5527)))

(declare-fun b!214358 () Bool)

(declare-fun e!139402 () Bool)

(assert (=> b!214358 (= e!139402 tp_is_empty!5527)))

(declare-fun condMapEmpty!9411 () Bool)

(declare-fun mapDefault!9411 () ValueCell!2420)

(assert (=> mapNonEmpty!9402 (= condMapEmpty!9411 (= mapRest!9402 ((as const (Array (_ BitVec 32) ValueCell!2420)) mapDefault!9411)))))

(assert (=> mapNonEmpty!9402 (= tp!20078 (and e!139401 mapRes!9411))))

(declare-fun mapNonEmpty!9411 () Bool)

(declare-fun tp!20094 () Bool)

(assert (=> mapNonEmpty!9411 (= mapRes!9411 (and tp!20094 e!139402))))

(declare-fun mapKey!9411 () (_ BitVec 32))

(declare-fun mapValue!9411 () ValueCell!2420)

(declare-fun mapRest!9411 () (Array (_ BitVec 32) ValueCell!2420))

(assert (=> mapNonEmpty!9411 (= mapRest!9402 (store mapRest!9411 mapKey!9411 mapValue!9411))))

(assert (= (and mapNonEmpty!9402 condMapEmpty!9411) mapIsEmpty!9411))

(assert (= (and mapNonEmpty!9402 (not condMapEmpty!9411)) mapNonEmpty!9411))

(assert (= (and mapNonEmpty!9411 ((_ is ValueCellFull!2420) mapValue!9411)) b!214358))

(assert (= (and mapNonEmpty!9402 ((_ is ValueCellFull!2420) mapDefault!9411)) b!214359))

(declare-fun m!242241 () Bool)

(assert (=> mapNonEmpty!9411 m!242241))

(check-sat (not b!214350) (not b_next!5665) tp_is_empty!5527 (not b!214351) (not b!214349) (not mapNonEmpty!9411) b_and!12569 (not d!58369))
(check-sat b_and!12569 (not b_next!5665))
(get-model)

(declare-fun b!214371 () Bool)

(declare-fun e!139405 () Bool)

(assert (=> b!214371 (= e!139405 (and (bvsge (extraKeys!3757 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3757 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1419 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!214369 () Bool)

(declare-fun res!104945 () Bool)

(assert (=> b!214369 (=> (not res!104945) (not e!139405))))

(declare-fun size!5199 (LongMapFixedSize!2740) (_ BitVec 32))

(assert (=> b!214369 (= res!104945 (bvsge (size!5199 thiss!1504) (_size!1419 thiss!1504)))))

(declare-fun b!214368 () Bool)

(declare-fun res!104946 () Bool)

(assert (=> b!214368 (=> (not res!104946) (not e!139405))))

(assert (=> b!214368 (= res!104946 (and (= (size!5193 (_values!4003 thiss!1504)) (bvadd (mask!9675 thiss!1504) #b00000000000000000000000000000001)) (= (size!5194 (_keys!6037 thiss!1504)) (size!5193 (_values!4003 thiss!1504))) (bvsge (_size!1419 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1419 thiss!1504) (bvadd (mask!9675 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!58371 () Bool)

(declare-fun res!104947 () Bool)

(assert (=> d!58371 (=> (not res!104947) (not e!139405))))

(assert (=> d!58371 (= res!104947 (validMask!0 (mask!9675 thiss!1504)))))

(assert (=> d!58371 (= (simpleValid!209 thiss!1504) e!139405)))

(declare-fun b!214370 () Bool)

(declare-fun res!104944 () Bool)

(assert (=> b!214370 (=> (not res!104944) (not e!139405))))

(assert (=> b!214370 (= res!104944 (= (size!5199 thiss!1504) (bvadd (_size!1419 thiss!1504) (bvsdiv (bvadd (extraKeys!3757 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!58371 res!104947) b!214368))

(assert (= (and b!214368 res!104946) b!214369))

(assert (= (and b!214369 res!104945) b!214370))

(assert (= (and b!214370 res!104944) b!214371))

(declare-fun m!242243 () Bool)

(assert (=> b!214369 m!242243))

(assert (=> d!58371 m!242209))

(assert (=> b!214370 m!242243))

(assert (=> d!58369 d!58371))

(declare-fun b!214380 () Bool)

(declare-fun e!139411 () (_ BitVec 32))

(declare-fun e!139410 () (_ BitVec 32))

(assert (=> b!214380 (= e!139411 e!139410)))

(declare-fun c!36053 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214380 (= c!36053 (validKeyInArray!0 (select (arr!4868 (_keys!6037 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58373 () Bool)

(declare-fun lt!110840 () (_ BitVec 32))

(assert (=> d!58373 (and (bvsge lt!110840 #b00000000000000000000000000000000) (bvsle lt!110840 (bvsub (size!5194 (_keys!6037 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58373 (= lt!110840 e!139411)))

(declare-fun c!36054 () Bool)

(assert (=> d!58373 (= c!36054 (bvsge #b00000000000000000000000000000000 (size!5194 (_keys!6037 thiss!1504))))))

(assert (=> d!58373 (and (bvsle #b00000000000000000000000000000000 (size!5194 (_keys!6037 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5194 (_keys!6037 thiss!1504)) (size!5194 (_keys!6037 thiss!1504))))))

(assert (=> d!58373 (= (arrayCountValidKeys!0 (_keys!6037 thiss!1504) #b00000000000000000000000000000000 (size!5194 (_keys!6037 thiss!1504))) lt!110840)))

(declare-fun b!214381 () Bool)

(assert (=> b!214381 (= e!139411 #b00000000000000000000000000000000)))

(declare-fun b!214382 () Bool)

(declare-fun call!20304 () (_ BitVec 32))

(assert (=> b!214382 (= e!139410 call!20304)))

(declare-fun b!214383 () Bool)

(assert (=> b!214383 (= e!139410 (bvadd #b00000000000000000000000000000001 call!20304))))

(declare-fun bm!20301 () Bool)

(assert (=> bm!20301 (= call!20304 (arrayCountValidKeys!0 (_keys!6037 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5194 (_keys!6037 thiss!1504))))))

(assert (= (and d!58373 c!36054) b!214381))

(assert (= (and d!58373 (not c!36054)) b!214380))

(assert (= (and b!214380 c!36053) b!214383))

(assert (= (and b!214380 (not c!36053)) b!214382))

(assert (= (or b!214383 b!214382) bm!20301))

(declare-fun m!242245 () Bool)

(assert (=> b!214380 m!242245))

(assert (=> b!214380 m!242245))

(declare-fun m!242247 () Bool)

(assert (=> b!214380 m!242247))

(declare-fun m!242249 () Bool)

(assert (=> bm!20301 m!242249))

(assert (=> b!214349 d!58373))

(declare-fun b!214392 () Bool)

(declare-fun e!139420 () Bool)

(declare-fun e!139419 () Bool)

(assert (=> b!214392 (= e!139420 e!139419)))

(declare-fun lt!110847 () (_ BitVec 64))

(assert (=> b!214392 (= lt!110847 (select (arr!4868 (_keys!6037 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6476 0))(
  ( (Unit!6477) )
))
(declare-fun lt!110848 () Unit!6476)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10263 (_ BitVec 64) (_ BitVec 32)) Unit!6476)

(assert (=> b!214392 (= lt!110848 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6037 thiss!1504) lt!110847 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!214392 (arrayContainsKey!0 (_keys!6037 thiss!1504) lt!110847 #b00000000000000000000000000000000)))

(declare-fun lt!110849 () Unit!6476)

(assert (=> b!214392 (= lt!110849 lt!110848)))

(declare-fun res!104953 () Bool)

(declare-datatypes ((SeekEntryResult!706 0))(
  ( (MissingZero!706 (index!4994 (_ BitVec 32))) (Found!706 (index!4995 (_ BitVec 32))) (Intermediate!706 (undefined!1518 Bool) (index!4996 (_ BitVec 32)) (x!22325 (_ BitVec 32))) (Undefined!706) (MissingVacant!706 (index!4997 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10263 (_ BitVec 32)) SeekEntryResult!706)

(assert (=> b!214392 (= res!104953 (= (seekEntryOrOpen!0 (select (arr!4868 (_keys!6037 thiss!1504)) #b00000000000000000000000000000000) (_keys!6037 thiss!1504) (mask!9675 thiss!1504)) (Found!706 #b00000000000000000000000000000000)))))

(assert (=> b!214392 (=> (not res!104953) (not e!139419))))

(declare-fun bm!20304 () Bool)

(declare-fun call!20307 () Bool)

(assert (=> bm!20304 (= call!20307 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6037 thiss!1504) (mask!9675 thiss!1504)))))

(declare-fun b!214393 () Bool)

(assert (=> b!214393 (= e!139419 call!20307)))

(declare-fun b!214394 () Bool)

(declare-fun e!139418 () Bool)

(assert (=> b!214394 (= e!139418 e!139420)))

(declare-fun c!36057 () Bool)

(assert (=> b!214394 (= c!36057 (validKeyInArray!0 (select (arr!4868 (_keys!6037 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58375 () Bool)

(declare-fun res!104952 () Bool)

(assert (=> d!58375 (=> res!104952 e!139418)))

(assert (=> d!58375 (= res!104952 (bvsge #b00000000000000000000000000000000 (size!5194 (_keys!6037 thiss!1504))))))

(assert (=> d!58375 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6037 thiss!1504) (mask!9675 thiss!1504)) e!139418)))

(declare-fun b!214395 () Bool)

(assert (=> b!214395 (= e!139420 call!20307)))

(assert (= (and d!58375 (not res!104952)) b!214394))

(assert (= (and b!214394 c!36057) b!214392))

(assert (= (and b!214394 (not c!36057)) b!214395))

(assert (= (and b!214392 res!104953) b!214393))

(assert (= (or b!214393 b!214395) bm!20304))

(assert (=> b!214392 m!242245))

(declare-fun m!242251 () Bool)

(assert (=> b!214392 m!242251))

(declare-fun m!242253 () Bool)

(assert (=> b!214392 m!242253))

(assert (=> b!214392 m!242245))

(declare-fun m!242255 () Bool)

(assert (=> b!214392 m!242255))

(declare-fun m!242257 () Bool)

(assert (=> bm!20304 m!242257))

(assert (=> b!214394 m!242245))

(assert (=> b!214394 m!242245))

(assert (=> b!214394 m!242247))

(assert (=> b!214350 d!58375))

(declare-fun b!214406 () Bool)

(declare-fun e!139432 () Bool)

(declare-fun e!139430 () Bool)

(assert (=> b!214406 (= e!139432 e!139430)))

(declare-fun c!36060 () Bool)

(assert (=> b!214406 (= c!36060 (validKeyInArray!0 (select (arr!4868 (_keys!6037 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214407 () Bool)

(declare-fun call!20310 () Bool)

(assert (=> b!214407 (= e!139430 call!20310)))

(declare-fun b!214409 () Bool)

(declare-fun e!139431 () Bool)

(declare-fun contains!1409 (List!3063 (_ BitVec 64)) Bool)

(assert (=> b!214409 (= e!139431 (contains!1409 Nil!3060 (select (arr!4868 (_keys!6037 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20307 () Bool)

(assert (=> bm!20307 (= call!20310 (arrayNoDuplicates!0 (_keys!6037 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36060 (Cons!3059 (select (arr!4868 (_keys!6037 thiss!1504)) #b00000000000000000000000000000000) Nil!3060) Nil!3060)))))

(declare-fun b!214410 () Bool)

(declare-fun e!139429 () Bool)

(assert (=> b!214410 (= e!139429 e!139432)))

(declare-fun res!104962 () Bool)

(assert (=> b!214410 (=> (not res!104962) (not e!139432))))

(assert (=> b!214410 (= res!104962 (not e!139431))))

(declare-fun res!104961 () Bool)

(assert (=> b!214410 (=> (not res!104961) (not e!139431))))

(assert (=> b!214410 (= res!104961 (validKeyInArray!0 (select (arr!4868 (_keys!6037 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58377 () Bool)

(declare-fun res!104960 () Bool)

(assert (=> d!58377 (=> res!104960 e!139429)))

(assert (=> d!58377 (= res!104960 (bvsge #b00000000000000000000000000000000 (size!5194 (_keys!6037 thiss!1504))))))

(assert (=> d!58377 (= (arrayNoDuplicates!0 (_keys!6037 thiss!1504) #b00000000000000000000000000000000 Nil!3060) e!139429)))

(declare-fun b!214408 () Bool)

(assert (=> b!214408 (= e!139430 call!20310)))

(assert (= (and d!58377 (not res!104960)) b!214410))

(assert (= (and b!214410 res!104961) b!214409))

(assert (= (and b!214410 res!104962) b!214406))

(assert (= (and b!214406 c!36060) b!214408))

(assert (= (and b!214406 (not c!36060)) b!214407))

(assert (= (or b!214408 b!214407) bm!20307))

(assert (=> b!214406 m!242245))

(assert (=> b!214406 m!242245))

(assert (=> b!214406 m!242247))

(assert (=> b!214409 m!242245))

(assert (=> b!214409 m!242245))

(declare-fun m!242259 () Bool)

(assert (=> b!214409 m!242259))

(assert (=> bm!20307 m!242245))

(declare-fun m!242261 () Bool)

(assert (=> bm!20307 m!242261))

(assert (=> b!214410 m!242245))

(assert (=> b!214410 m!242245))

(assert (=> b!214410 m!242247))

(assert (=> b!214351 d!58377))

(declare-fun mapIsEmpty!9412 () Bool)

(declare-fun mapRes!9412 () Bool)

(assert (=> mapIsEmpty!9412 mapRes!9412))

(declare-fun b!214412 () Bool)

(declare-fun e!139433 () Bool)

(assert (=> b!214412 (= e!139433 tp_is_empty!5527)))

(declare-fun b!214411 () Bool)

(declare-fun e!139434 () Bool)

(assert (=> b!214411 (= e!139434 tp_is_empty!5527)))

(declare-fun condMapEmpty!9412 () Bool)

(declare-fun mapDefault!9412 () ValueCell!2420)

(assert (=> mapNonEmpty!9411 (= condMapEmpty!9412 (= mapRest!9411 ((as const (Array (_ BitVec 32) ValueCell!2420)) mapDefault!9412)))))

(assert (=> mapNonEmpty!9411 (= tp!20094 (and e!139433 mapRes!9412))))

(declare-fun mapNonEmpty!9412 () Bool)

(declare-fun tp!20095 () Bool)

(assert (=> mapNonEmpty!9412 (= mapRes!9412 (and tp!20095 e!139434))))

(declare-fun mapRest!9412 () (Array (_ BitVec 32) ValueCell!2420))

(declare-fun mapValue!9412 () ValueCell!2420)

(declare-fun mapKey!9412 () (_ BitVec 32))

(assert (=> mapNonEmpty!9412 (= mapRest!9411 (store mapRest!9412 mapKey!9412 mapValue!9412))))

(assert (= (and mapNonEmpty!9411 condMapEmpty!9412) mapIsEmpty!9412))

(assert (= (and mapNonEmpty!9411 (not condMapEmpty!9412)) mapNonEmpty!9412))

(assert (= (and mapNonEmpty!9412 ((_ is ValueCellFull!2420) mapValue!9412)) b!214411))

(assert (= (and mapNonEmpty!9411 ((_ is ValueCellFull!2420) mapDefault!9412)) b!214412))

(declare-fun m!242263 () Bool)

(assert (=> mapNonEmpty!9412 m!242263))

(check-sat (not bm!20301) (not b!214392) (not b_next!5665) tp_is_empty!5527 (not bm!20307) (not b!214410) (not b!214380) (not d!58371) (not b!214409) b_and!12569 (not b!214369) (not mapNonEmpty!9412) (not b!214406) (not b!214394) (not b!214370) (not bm!20304))
(check-sat b_and!12569 (not b_next!5665))
