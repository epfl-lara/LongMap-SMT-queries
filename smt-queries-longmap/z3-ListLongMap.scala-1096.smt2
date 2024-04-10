; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22504 () Bool)

(assert start!22504)

(declare-fun b!235292 () Bool)

(declare-fun b_free!6327 () Bool)

(declare-fun b_next!6327 () Bool)

(assert (=> b!235292 (= b_free!6327 (not b_next!6327))))

(declare-fun tp!22148 () Bool)

(declare-fun b_and!13255 () Bool)

(assert (=> b!235292 (= tp!22148 b_and!13255)))

(declare-fun e!152815 () Bool)

(declare-fun tp_is_empty!6189 () Bool)

(declare-datatypes ((V!7899 0))(
  ( (V!7900 (val!3139 Int)) )
))
(declare-datatypes ((ValueCell!2751 0))(
  ( (ValueCellFull!2751 (v!5166 V!7899)) (EmptyCell!2751) )
))
(declare-datatypes ((array!11635 0))(
  ( (array!11636 (arr!5530 (Array (_ BitVec 32) ValueCell!2751)) (size!5867 (_ BitVec 32))) )
))
(declare-datatypes ((array!11637 0))(
  ( (array!11638 (arr!5531 (Array (_ BitVec 32) (_ BitVec 64))) (size!5868 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3402 0))(
  ( (LongMapFixedSize!3403 (defaultEntry!4371 Int) (mask!10338 (_ BitVec 32)) (extraKeys!4108 (_ BitVec 32)) (zeroValue!4212 V!7899) (minValue!4212 V!7899) (_size!1750 (_ BitVec 32)) (_keys!6445 array!11637) (_values!4354 array!11635) (_vacant!1750 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3402)

(declare-fun e!152811 () Bool)

(declare-fun array_inv!3647 (array!11637) Bool)

(declare-fun array_inv!3648 (array!11635) Bool)

(assert (=> b!235292 (= e!152811 (and tp!22148 tp_is_empty!6189 (array_inv!3647 (_keys!6445 thiss!1504)) (array_inv!3648 (_values!4354 thiss!1504)) e!152815))))

(declare-fun b!235294 () Bool)

(declare-fun e!152814 () Bool)

(declare-fun e!152813 () Bool)

(assert (=> b!235294 (= e!152814 e!152813)))

(declare-fun res!115382 () Bool)

(assert (=> b!235294 (=> (not res!115382) (not e!152813))))

(declare-datatypes ((SeekEntryResult!987 0))(
  ( (MissingZero!987 (index!6118 (_ BitVec 32))) (Found!987 (index!6119 (_ BitVec 32))) (Intermediate!987 (undefined!1799 Bool) (index!6120 (_ BitVec 32)) (x!23773 (_ BitVec 32))) (Undefined!987) (MissingVacant!987 (index!6121 (_ BitVec 32))) )
))
(declare-fun lt!119032 () SeekEntryResult!987)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235294 (= res!115382 (or (= lt!119032 (MissingZero!987 index!297)) (= lt!119032 (MissingVacant!987 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11637 (_ BitVec 32)) SeekEntryResult!987)

(assert (=> b!235294 (= lt!119032 (seekEntryOrOpen!0 key!932 (_keys!6445 thiss!1504) (mask!10338 thiss!1504)))))

(declare-fun mapNonEmpty!10478 () Bool)

(declare-fun mapRes!10478 () Bool)

(declare-fun tp!22147 () Bool)

(declare-fun e!152810 () Bool)

(assert (=> mapNonEmpty!10478 (= mapRes!10478 (and tp!22147 e!152810))))

(declare-fun mapKey!10478 () (_ BitVec 32))

(declare-fun mapValue!10478 () ValueCell!2751)

(declare-fun mapRest!10478 () (Array (_ BitVec 32) ValueCell!2751))

(assert (=> mapNonEmpty!10478 (= (arr!5530 (_values!4354 thiss!1504)) (store mapRest!10478 mapKey!10478 mapValue!10478))))

(declare-fun b!235295 () Bool)

(declare-fun e!152812 () Bool)

(assert (=> b!235295 (= e!152812 tp_is_empty!6189)))

(declare-fun b!235296 () Bool)

(assert (=> b!235296 (= e!152815 (and e!152812 mapRes!10478))))

(declare-fun condMapEmpty!10478 () Bool)

(declare-fun mapDefault!10478 () ValueCell!2751)

(assert (=> b!235296 (= condMapEmpty!10478 (= (arr!5530 (_values!4354 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2751)) mapDefault!10478)))))

(declare-fun b!235297 () Bool)

(declare-fun res!115384 () Bool)

(assert (=> b!235297 (=> (not res!115384) (not e!152813))))

(declare-datatypes ((tuple2!4626 0))(
  ( (tuple2!4627 (_1!2324 (_ BitVec 64)) (_2!2324 V!7899)) )
))
(declare-datatypes ((List!3534 0))(
  ( (Nil!3531) (Cons!3530 (h!4182 tuple2!4626) (t!8507 List!3534)) )
))
(declare-datatypes ((ListLongMap!3539 0))(
  ( (ListLongMap!3540 (toList!1785 List!3534)) )
))
(declare-fun contains!1661 (ListLongMap!3539 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1313 (array!11637 array!11635 (_ BitVec 32) (_ BitVec 32) V!7899 V!7899 (_ BitVec 32) Int) ListLongMap!3539)

(assert (=> b!235297 (= res!115384 (contains!1661 (getCurrentListMap!1313 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504)) key!932))))

(declare-fun b!235298 () Bool)

(declare-datatypes ((List!3535 0))(
  ( (Nil!3532) (Cons!3531 (h!4183 (_ BitVec 64)) (t!8508 List!3535)) )
))
(declare-fun arrayNoDuplicates!0 (array!11637 (_ BitVec 32) List!3535) Bool)

(assert (=> b!235298 (= e!152813 (not (arrayNoDuplicates!0 (_keys!6445 thiss!1504) #b00000000000000000000000000000000 Nil!3532)))))

(declare-fun b!235299 () Bool)

(declare-fun res!115383 () Bool)

(assert (=> b!235299 (=> (not res!115383) (not e!152813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11637 (_ BitVec 32)) Bool)

(assert (=> b!235299 (= res!115383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6445 thiss!1504) (mask!10338 thiss!1504)))))

(declare-fun mapIsEmpty!10478 () Bool)

(assert (=> mapIsEmpty!10478 mapRes!10478))

(declare-fun res!115385 () Bool)

(assert (=> start!22504 (=> (not res!115385) (not e!152814))))

(declare-fun valid!1343 (LongMapFixedSize!3402) Bool)

(assert (=> start!22504 (= res!115385 (valid!1343 thiss!1504))))

(assert (=> start!22504 e!152814))

(assert (=> start!22504 e!152811))

(assert (=> start!22504 true))

(declare-fun b!235293 () Bool)

(declare-fun res!115381 () Bool)

(assert (=> b!235293 (=> (not res!115381) (not e!152813))))

(assert (=> b!235293 (= res!115381 (and (= (size!5867 (_values!4354 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10338 thiss!1504))) (= (size!5868 (_keys!6445 thiss!1504)) (size!5867 (_values!4354 thiss!1504))) (bvsge (mask!10338 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4108 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4108 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!235300 () Bool)

(assert (=> b!235300 (= e!152810 tp_is_empty!6189)))

(declare-fun b!235301 () Bool)

(declare-fun res!115386 () Bool)

(assert (=> b!235301 (=> (not res!115386) (not e!152814))))

(assert (=> b!235301 (= res!115386 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235302 () Bool)

(declare-fun res!115380 () Bool)

(assert (=> b!235302 (=> (not res!115380) (not e!152813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235302 (= res!115380 (validMask!0 (mask!10338 thiss!1504)))))

(assert (= (and start!22504 res!115385) b!235301))

(assert (= (and b!235301 res!115386) b!235294))

(assert (= (and b!235294 res!115382) b!235297))

(assert (= (and b!235297 res!115384) b!235302))

(assert (= (and b!235302 res!115380) b!235293))

(assert (= (and b!235293 res!115381) b!235299))

(assert (= (and b!235299 res!115383) b!235298))

(assert (= (and b!235296 condMapEmpty!10478) mapIsEmpty!10478))

(assert (= (and b!235296 (not condMapEmpty!10478)) mapNonEmpty!10478))

(get-info :version)

(assert (= (and mapNonEmpty!10478 ((_ is ValueCellFull!2751) mapValue!10478)) b!235300))

(assert (= (and b!235296 ((_ is ValueCellFull!2751) mapDefault!10478)) b!235295))

(assert (= b!235292 b!235296))

(assert (= start!22504 b!235292))

(declare-fun m!256455 () Bool)

(assert (=> b!235298 m!256455))

(declare-fun m!256457 () Bool)

(assert (=> start!22504 m!256457))

(declare-fun m!256459 () Bool)

(assert (=> mapNonEmpty!10478 m!256459))

(declare-fun m!256461 () Bool)

(assert (=> b!235302 m!256461))

(declare-fun m!256463 () Bool)

(assert (=> b!235292 m!256463))

(declare-fun m!256465 () Bool)

(assert (=> b!235292 m!256465))

(declare-fun m!256467 () Bool)

(assert (=> b!235297 m!256467))

(assert (=> b!235297 m!256467))

(declare-fun m!256469 () Bool)

(assert (=> b!235297 m!256469))

(declare-fun m!256471 () Bool)

(assert (=> b!235294 m!256471))

(declare-fun m!256473 () Bool)

(assert (=> b!235299 m!256473))

(check-sat (not mapNonEmpty!10478) (not b!235299) (not b!235294) (not start!22504) (not b_next!6327) b_and!13255 (not b!235298) (not b!235302) (not b!235292) tp_is_empty!6189 (not b!235297))
(check-sat b_and!13255 (not b_next!6327))
(get-model)

(declare-fun b!235346 () Bool)

(declare-fun e!152848 () Bool)

(declare-fun call!21879 () Bool)

(assert (=> b!235346 (= e!152848 call!21879)))

(declare-fun bm!21876 () Bool)

(declare-fun c!39211 () Bool)

(assert (=> bm!21876 (= call!21879 (arrayNoDuplicates!0 (_keys!6445 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39211 (Cons!3531 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000) Nil!3532) Nil!3532)))))

(declare-fun b!235347 () Bool)

(declare-fun e!152847 () Bool)

(assert (=> b!235347 (= e!152847 e!152848)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!235347 (= c!39211 (validKeyInArray!0 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235348 () Bool)

(declare-fun e!152846 () Bool)

(assert (=> b!235348 (= e!152846 e!152847)))

(declare-fun res!115415 () Bool)

(assert (=> b!235348 (=> (not res!115415) (not e!152847))))

(declare-fun e!152845 () Bool)

(assert (=> b!235348 (= res!115415 (not e!152845))))

(declare-fun res!115414 () Bool)

(assert (=> b!235348 (=> (not res!115414) (not e!152845))))

(assert (=> b!235348 (= res!115414 (validKeyInArray!0 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59273 () Bool)

(declare-fun res!115416 () Bool)

(assert (=> d!59273 (=> res!115416 e!152846)))

(assert (=> d!59273 (= res!115416 (bvsge #b00000000000000000000000000000000 (size!5868 (_keys!6445 thiss!1504))))))

(assert (=> d!59273 (= (arrayNoDuplicates!0 (_keys!6445 thiss!1504) #b00000000000000000000000000000000 Nil!3532) e!152846)))

(declare-fun b!235349 () Bool)

(declare-fun contains!1663 (List!3535 (_ BitVec 64)) Bool)

(assert (=> b!235349 (= e!152845 (contains!1663 Nil!3532 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235350 () Bool)

(assert (=> b!235350 (= e!152848 call!21879)))

(assert (= (and d!59273 (not res!115416)) b!235348))

(assert (= (and b!235348 res!115414) b!235349))

(assert (= (and b!235348 res!115415) b!235347))

(assert (= (and b!235347 c!39211) b!235346))

(assert (= (and b!235347 (not c!39211)) b!235350))

(assert (= (or b!235346 b!235350) bm!21876))

(declare-fun m!256495 () Bool)

(assert (=> bm!21876 m!256495))

(declare-fun m!256497 () Bool)

(assert (=> bm!21876 m!256497))

(assert (=> b!235347 m!256495))

(assert (=> b!235347 m!256495))

(declare-fun m!256499 () Bool)

(assert (=> b!235347 m!256499))

(assert (=> b!235348 m!256495))

(assert (=> b!235348 m!256495))

(assert (=> b!235348 m!256499))

(assert (=> b!235349 m!256495))

(assert (=> b!235349 m!256495))

(declare-fun m!256501 () Bool)

(assert (=> b!235349 m!256501))

(assert (=> b!235298 d!59273))

(declare-fun b!235363 () Bool)

(declare-fun e!152857 () SeekEntryResult!987)

(declare-fun e!152855 () SeekEntryResult!987)

(assert (=> b!235363 (= e!152857 e!152855)))

(declare-fun lt!119044 () (_ BitVec 64))

(declare-fun lt!119042 () SeekEntryResult!987)

(assert (=> b!235363 (= lt!119044 (select (arr!5531 (_keys!6445 thiss!1504)) (index!6120 lt!119042)))))

(declare-fun c!39220 () Bool)

(assert (=> b!235363 (= c!39220 (= lt!119044 key!932))))

(declare-fun b!235364 () Bool)

(declare-fun e!152856 () SeekEntryResult!987)

(assert (=> b!235364 (= e!152856 (MissingZero!987 (index!6120 lt!119042)))))

(declare-fun b!235365 () Bool)

(declare-fun c!39219 () Bool)

(assert (=> b!235365 (= c!39219 (= lt!119044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!235365 (= e!152855 e!152856)))

(declare-fun d!59275 () Bool)

(declare-fun lt!119043 () SeekEntryResult!987)

(assert (=> d!59275 (and (or ((_ is Undefined!987) lt!119043) (not ((_ is Found!987) lt!119043)) (and (bvsge (index!6119 lt!119043) #b00000000000000000000000000000000) (bvslt (index!6119 lt!119043) (size!5868 (_keys!6445 thiss!1504))))) (or ((_ is Undefined!987) lt!119043) ((_ is Found!987) lt!119043) (not ((_ is MissingZero!987) lt!119043)) (and (bvsge (index!6118 lt!119043) #b00000000000000000000000000000000) (bvslt (index!6118 lt!119043) (size!5868 (_keys!6445 thiss!1504))))) (or ((_ is Undefined!987) lt!119043) ((_ is Found!987) lt!119043) ((_ is MissingZero!987) lt!119043) (not ((_ is MissingVacant!987) lt!119043)) (and (bvsge (index!6121 lt!119043) #b00000000000000000000000000000000) (bvslt (index!6121 lt!119043) (size!5868 (_keys!6445 thiss!1504))))) (or ((_ is Undefined!987) lt!119043) (ite ((_ is Found!987) lt!119043) (= (select (arr!5531 (_keys!6445 thiss!1504)) (index!6119 lt!119043)) key!932) (ite ((_ is MissingZero!987) lt!119043) (= (select (arr!5531 (_keys!6445 thiss!1504)) (index!6118 lt!119043)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!987) lt!119043) (= (select (arr!5531 (_keys!6445 thiss!1504)) (index!6121 lt!119043)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59275 (= lt!119043 e!152857)))

(declare-fun c!39218 () Bool)

(assert (=> d!59275 (= c!39218 (and ((_ is Intermediate!987) lt!119042) (undefined!1799 lt!119042)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11637 (_ BitVec 32)) SeekEntryResult!987)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59275 (= lt!119042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10338 thiss!1504)) key!932 (_keys!6445 thiss!1504) (mask!10338 thiss!1504)))))

(assert (=> d!59275 (validMask!0 (mask!10338 thiss!1504))))

(assert (=> d!59275 (= (seekEntryOrOpen!0 key!932 (_keys!6445 thiss!1504) (mask!10338 thiss!1504)) lt!119043)))

(declare-fun b!235366 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11637 (_ BitVec 32)) SeekEntryResult!987)

(assert (=> b!235366 (= e!152856 (seekKeyOrZeroReturnVacant!0 (x!23773 lt!119042) (index!6120 lt!119042) (index!6120 lt!119042) key!932 (_keys!6445 thiss!1504) (mask!10338 thiss!1504)))))

(declare-fun b!235367 () Bool)

(assert (=> b!235367 (= e!152857 Undefined!987)))

(declare-fun b!235368 () Bool)

(assert (=> b!235368 (= e!152855 (Found!987 (index!6120 lt!119042)))))

(assert (= (and d!59275 c!39218) b!235367))

(assert (= (and d!59275 (not c!39218)) b!235363))

(assert (= (and b!235363 c!39220) b!235368))

(assert (= (and b!235363 (not c!39220)) b!235365))

(assert (= (and b!235365 c!39219) b!235364))

(assert (= (and b!235365 (not c!39219)) b!235366))

(declare-fun m!256503 () Bool)

(assert (=> b!235363 m!256503))

(declare-fun m!256505 () Bool)

(assert (=> d!59275 m!256505))

(declare-fun m!256507 () Bool)

(assert (=> d!59275 m!256507))

(declare-fun m!256509 () Bool)

(assert (=> d!59275 m!256509))

(declare-fun m!256511 () Bool)

(assert (=> d!59275 m!256511))

(assert (=> d!59275 m!256461))

(assert (=> d!59275 m!256511))

(declare-fun m!256513 () Bool)

(assert (=> d!59275 m!256513))

(declare-fun m!256515 () Bool)

(assert (=> b!235366 m!256515))

(assert (=> b!235294 d!59275))

(declare-fun b!235377 () Bool)

(declare-fun e!152864 () Bool)

(declare-fun e!152866 () Bool)

(assert (=> b!235377 (= e!152864 e!152866)))

(declare-fun lt!119051 () (_ BitVec 64))

(assert (=> b!235377 (= lt!119051 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!7254 0))(
  ( (Unit!7255) )
))
(declare-fun lt!119052 () Unit!7254)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11637 (_ BitVec 64) (_ BitVec 32)) Unit!7254)

(assert (=> b!235377 (= lt!119052 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6445 thiss!1504) lt!119051 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!235377 (arrayContainsKey!0 (_keys!6445 thiss!1504) lt!119051 #b00000000000000000000000000000000)))

(declare-fun lt!119053 () Unit!7254)

(assert (=> b!235377 (= lt!119053 lt!119052)))

(declare-fun res!115422 () Bool)

(assert (=> b!235377 (= res!115422 (= (seekEntryOrOpen!0 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000) (_keys!6445 thiss!1504) (mask!10338 thiss!1504)) (Found!987 #b00000000000000000000000000000000)))))

(assert (=> b!235377 (=> (not res!115422) (not e!152866))))

(declare-fun b!235378 () Bool)

(declare-fun call!21882 () Bool)

(assert (=> b!235378 (= e!152866 call!21882)))

(declare-fun b!235379 () Bool)

(assert (=> b!235379 (= e!152864 call!21882)))

(declare-fun d!59277 () Bool)

(declare-fun res!115421 () Bool)

(declare-fun e!152865 () Bool)

(assert (=> d!59277 (=> res!115421 e!152865)))

(assert (=> d!59277 (= res!115421 (bvsge #b00000000000000000000000000000000 (size!5868 (_keys!6445 thiss!1504))))))

(assert (=> d!59277 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6445 thiss!1504) (mask!10338 thiss!1504)) e!152865)))

(declare-fun b!235380 () Bool)

(assert (=> b!235380 (= e!152865 e!152864)))

(declare-fun c!39223 () Bool)

(assert (=> b!235380 (= c!39223 (validKeyInArray!0 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21879 () Bool)

(assert (=> bm!21879 (= call!21882 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6445 thiss!1504) (mask!10338 thiss!1504)))))

(assert (= (and d!59277 (not res!115421)) b!235380))

(assert (= (and b!235380 c!39223) b!235377))

(assert (= (and b!235380 (not c!39223)) b!235379))

(assert (= (and b!235377 res!115422) b!235378))

(assert (= (or b!235378 b!235379) bm!21879))

(assert (=> b!235377 m!256495))

(declare-fun m!256517 () Bool)

(assert (=> b!235377 m!256517))

(declare-fun m!256519 () Bool)

(assert (=> b!235377 m!256519))

(assert (=> b!235377 m!256495))

(declare-fun m!256521 () Bool)

(assert (=> b!235377 m!256521))

(assert (=> b!235380 m!256495))

(assert (=> b!235380 m!256495))

(assert (=> b!235380 m!256499))

(declare-fun m!256523 () Bool)

(assert (=> bm!21879 m!256523))

(assert (=> b!235299 d!59277))

(declare-fun d!59279 () Bool)

(declare-fun e!152871 () Bool)

(assert (=> d!59279 e!152871))

(declare-fun res!115425 () Bool)

(assert (=> d!59279 (=> res!115425 e!152871)))

(declare-fun lt!119064 () Bool)

(assert (=> d!59279 (= res!115425 (not lt!119064))))

(declare-fun lt!119062 () Bool)

(assert (=> d!59279 (= lt!119064 lt!119062)))

(declare-fun lt!119063 () Unit!7254)

(declare-fun e!152872 () Unit!7254)

(assert (=> d!59279 (= lt!119063 e!152872)))

(declare-fun c!39226 () Bool)

(assert (=> d!59279 (= c!39226 lt!119062)))

(declare-fun containsKey!260 (List!3534 (_ BitVec 64)) Bool)

(assert (=> d!59279 (= lt!119062 (containsKey!260 (toList!1785 (getCurrentListMap!1313 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504))) key!932))))

(assert (=> d!59279 (= (contains!1661 (getCurrentListMap!1313 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504)) key!932) lt!119064)))

(declare-fun b!235387 () Bool)

(declare-fun lt!119065 () Unit!7254)

(assert (=> b!235387 (= e!152872 lt!119065)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!208 (List!3534 (_ BitVec 64)) Unit!7254)

(assert (=> b!235387 (= lt!119065 (lemmaContainsKeyImpliesGetValueByKeyDefined!208 (toList!1785 (getCurrentListMap!1313 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504))) key!932))))

(declare-datatypes ((Option!274 0))(
  ( (Some!273 (v!5168 V!7899)) (None!272) )
))
(declare-fun isDefined!209 (Option!274) Bool)

(declare-fun getValueByKey!268 (List!3534 (_ BitVec 64)) Option!274)

(assert (=> b!235387 (isDefined!209 (getValueByKey!268 (toList!1785 (getCurrentListMap!1313 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504))) key!932))))

(declare-fun b!235388 () Bool)

(declare-fun Unit!7256 () Unit!7254)

(assert (=> b!235388 (= e!152872 Unit!7256)))

(declare-fun b!235389 () Bool)

(assert (=> b!235389 (= e!152871 (isDefined!209 (getValueByKey!268 (toList!1785 (getCurrentListMap!1313 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504))) key!932)))))

(assert (= (and d!59279 c!39226) b!235387))

(assert (= (and d!59279 (not c!39226)) b!235388))

(assert (= (and d!59279 (not res!115425)) b!235389))

(declare-fun m!256525 () Bool)

(assert (=> d!59279 m!256525))

(declare-fun m!256527 () Bool)

(assert (=> b!235387 m!256527))

(declare-fun m!256529 () Bool)

(assert (=> b!235387 m!256529))

(assert (=> b!235387 m!256529))

(declare-fun m!256531 () Bool)

(assert (=> b!235387 m!256531))

(assert (=> b!235389 m!256529))

(assert (=> b!235389 m!256529))

(assert (=> b!235389 m!256531))

(assert (=> b!235297 d!59279))

(declare-fun b!235432 () Bool)

(declare-fun e!152902 () ListLongMap!3539)

(declare-fun call!21901 () ListLongMap!3539)

(assert (=> b!235432 (= e!152902 call!21901)))

(declare-fun b!235433 () Bool)

(declare-fun e!152907 () ListLongMap!3539)

(declare-fun call!21900 () ListLongMap!3539)

(declare-fun +!637 (ListLongMap!3539 tuple2!4626) ListLongMap!3539)

(assert (=> b!235433 (= e!152907 (+!637 call!21900 (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4212 thiss!1504))))))

(declare-fun b!235434 () Bool)

(declare-fun e!152903 () Bool)

(declare-fun call!21902 () Bool)

(assert (=> b!235434 (= e!152903 (not call!21902))))

(declare-fun call!21903 () ListLongMap!3539)

(declare-fun call!21898 () ListLongMap!3539)

(declare-fun c!39239 () Bool)

(declare-fun bm!21894 () Bool)

(declare-fun call!21897 () ListLongMap!3539)

(declare-fun c!39244 () Bool)

(assert (=> bm!21894 (= call!21900 (+!637 (ite c!39239 call!21897 (ite c!39244 call!21898 call!21903)) (ite (or c!39239 c!39244) (tuple2!4627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4212 thiss!1504)) (tuple2!4627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4212 thiss!1504)))))))

(declare-fun b!235435 () Bool)

(declare-fun e!152900 () Unit!7254)

(declare-fun lt!119127 () Unit!7254)

(assert (=> b!235435 (= e!152900 lt!119127)))

(declare-fun lt!119124 () ListLongMap!3539)

(declare-fun getCurrentListMapNoExtraKeys!532 (array!11637 array!11635 (_ BitVec 32) (_ BitVec 32) V!7899 V!7899 (_ BitVec 32) Int) ListLongMap!3539)

(assert (=> b!235435 (= lt!119124 (getCurrentListMapNoExtraKeys!532 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504)))))

(declare-fun lt!119116 () (_ BitVec 64))

(assert (=> b!235435 (= lt!119116 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119113 () (_ BitVec 64))

(assert (=> b!235435 (= lt!119113 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119118 () Unit!7254)

(declare-fun addStillContains!186 (ListLongMap!3539 (_ BitVec 64) V!7899 (_ BitVec 64)) Unit!7254)

(assert (=> b!235435 (= lt!119118 (addStillContains!186 lt!119124 lt!119116 (zeroValue!4212 thiss!1504) lt!119113))))

(assert (=> b!235435 (contains!1661 (+!637 lt!119124 (tuple2!4627 lt!119116 (zeroValue!4212 thiss!1504))) lt!119113)))

(declare-fun lt!119110 () Unit!7254)

(assert (=> b!235435 (= lt!119110 lt!119118)))

(declare-fun lt!119131 () ListLongMap!3539)

(assert (=> b!235435 (= lt!119131 (getCurrentListMapNoExtraKeys!532 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504)))))

(declare-fun lt!119119 () (_ BitVec 64))

(assert (=> b!235435 (= lt!119119 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119111 () (_ BitVec 64))

(assert (=> b!235435 (= lt!119111 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119114 () Unit!7254)

(declare-fun addApplyDifferent!186 (ListLongMap!3539 (_ BitVec 64) V!7899 (_ BitVec 64)) Unit!7254)

(assert (=> b!235435 (= lt!119114 (addApplyDifferent!186 lt!119131 lt!119119 (minValue!4212 thiss!1504) lt!119111))))

(declare-fun apply!210 (ListLongMap!3539 (_ BitVec 64)) V!7899)

(assert (=> b!235435 (= (apply!210 (+!637 lt!119131 (tuple2!4627 lt!119119 (minValue!4212 thiss!1504))) lt!119111) (apply!210 lt!119131 lt!119111))))

(declare-fun lt!119121 () Unit!7254)

(assert (=> b!235435 (= lt!119121 lt!119114)))

(declare-fun lt!119129 () ListLongMap!3539)

(assert (=> b!235435 (= lt!119129 (getCurrentListMapNoExtraKeys!532 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504)))))

(declare-fun lt!119112 () (_ BitVec 64))

(assert (=> b!235435 (= lt!119112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119130 () (_ BitVec 64))

(assert (=> b!235435 (= lt!119130 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119123 () Unit!7254)

(assert (=> b!235435 (= lt!119123 (addApplyDifferent!186 lt!119129 lt!119112 (zeroValue!4212 thiss!1504) lt!119130))))

(assert (=> b!235435 (= (apply!210 (+!637 lt!119129 (tuple2!4627 lt!119112 (zeroValue!4212 thiss!1504))) lt!119130) (apply!210 lt!119129 lt!119130))))

(declare-fun lt!119126 () Unit!7254)

(assert (=> b!235435 (= lt!119126 lt!119123)))

(declare-fun lt!119115 () ListLongMap!3539)

(assert (=> b!235435 (= lt!119115 (getCurrentListMapNoExtraKeys!532 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504)))))

(declare-fun lt!119117 () (_ BitVec 64))

(assert (=> b!235435 (= lt!119117 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119122 () (_ BitVec 64))

(assert (=> b!235435 (= lt!119122 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235435 (= lt!119127 (addApplyDifferent!186 lt!119115 lt!119117 (minValue!4212 thiss!1504) lt!119122))))

(assert (=> b!235435 (= (apply!210 (+!637 lt!119115 (tuple2!4627 lt!119117 (minValue!4212 thiss!1504))) lt!119122) (apply!210 lt!119115 lt!119122))))

(declare-fun b!235436 () Bool)

(declare-fun Unit!7257 () Unit!7254)

(assert (=> b!235436 (= e!152900 Unit!7257)))

(declare-fun b!235437 () Bool)

(declare-fun e!152910 () Bool)

(declare-fun e!152908 () Bool)

(assert (=> b!235437 (= e!152910 e!152908)))

(declare-fun res!115452 () Bool)

(assert (=> b!235437 (=> (not res!115452) (not e!152908))))

(declare-fun lt!119128 () ListLongMap!3539)

(assert (=> b!235437 (= res!115452 (contains!1661 lt!119128 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!235437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5868 (_keys!6445 thiss!1504))))))

(declare-fun b!235438 () Bool)

(declare-fun res!115446 () Bool)

(declare-fun e!152911 () Bool)

(assert (=> b!235438 (=> (not res!115446) (not e!152911))))

(assert (=> b!235438 (= res!115446 e!152910)))

(declare-fun res!115448 () Bool)

(assert (=> b!235438 (=> res!115448 e!152910)))

(declare-fun e!152901 () Bool)

(assert (=> b!235438 (= res!115448 (not e!152901))))

(declare-fun res!115447 () Bool)

(assert (=> b!235438 (=> (not res!115447) (not e!152901))))

(assert (=> b!235438 (= res!115447 (bvslt #b00000000000000000000000000000000 (size!5868 (_keys!6445 thiss!1504))))))

(declare-fun b!235439 () Bool)

(declare-fun get!2843 (ValueCell!2751 V!7899) V!7899)

(declare-fun dynLambda!553 (Int (_ BitVec 64)) V!7899)

(assert (=> b!235439 (= e!152908 (= (apply!210 lt!119128 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000)) (get!2843 (select (arr!5530 (_values!4354 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!553 (defaultEntry!4371 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235439 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5867 (_values!4354 thiss!1504))))))

(assert (=> b!235439 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5868 (_keys!6445 thiss!1504))))))

(declare-fun bm!21895 () Bool)

(assert (=> bm!21895 (= call!21902 (contains!1661 lt!119128 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!59281 () Bool)

(assert (=> d!59281 e!152911))

(declare-fun res!115449 () Bool)

(assert (=> d!59281 (=> (not res!115449) (not e!152911))))

(assert (=> d!59281 (= res!115449 (or (bvsge #b00000000000000000000000000000000 (size!5868 (_keys!6445 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5868 (_keys!6445 thiss!1504))))))))

(declare-fun lt!119125 () ListLongMap!3539)

(assert (=> d!59281 (= lt!119128 lt!119125)))

(declare-fun lt!119120 () Unit!7254)

(assert (=> d!59281 (= lt!119120 e!152900)))

(declare-fun c!39242 () Bool)

(declare-fun e!152904 () Bool)

(assert (=> d!59281 (= c!39242 e!152904)))

(declare-fun res!115451 () Bool)

(assert (=> d!59281 (=> (not res!115451) (not e!152904))))

(assert (=> d!59281 (= res!115451 (bvslt #b00000000000000000000000000000000 (size!5868 (_keys!6445 thiss!1504))))))

(assert (=> d!59281 (= lt!119125 e!152907)))

(assert (=> d!59281 (= c!39239 (and (not (= (bvand (extraKeys!4108 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4108 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59281 (validMask!0 (mask!10338 thiss!1504))))

(assert (=> d!59281 (= (getCurrentListMap!1313 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504)) lt!119128)))

(declare-fun b!235440 () Bool)

(declare-fun e!152905 () ListLongMap!3539)

(assert (=> b!235440 (= e!152905 call!21901)))

(declare-fun b!235441 () Bool)

(assert (=> b!235441 (= e!152901 (validKeyInArray!0 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235442 () Bool)

(declare-fun res!115450 () Bool)

(assert (=> b!235442 (=> (not res!115450) (not e!152911))))

(declare-fun e!152906 () Bool)

(assert (=> b!235442 (= res!115450 e!152906)))

(declare-fun c!39241 () Bool)

(assert (=> b!235442 (= c!39241 (not (= (bvand (extraKeys!4108 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!21896 () Bool)

(assert (=> bm!21896 (= call!21901 call!21900)))

(declare-fun b!235443 () Bool)

(declare-fun e!152899 () Bool)

(assert (=> b!235443 (= e!152899 (= (apply!210 lt!119128 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4212 thiss!1504)))))

(declare-fun b!235444 () Bool)

(declare-fun c!39240 () Bool)

(assert (=> b!235444 (= c!39240 (and (not (= (bvand (extraKeys!4108 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4108 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!235444 (= e!152905 e!152902)))

(declare-fun bm!21897 () Bool)

(assert (=> bm!21897 (= call!21897 (getCurrentListMapNoExtraKeys!532 (_keys!6445 thiss!1504) (_values!4354 thiss!1504) (mask!10338 thiss!1504) (extraKeys!4108 thiss!1504) (zeroValue!4212 thiss!1504) (minValue!4212 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4371 thiss!1504)))))

(declare-fun b!235445 () Bool)

(assert (=> b!235445 (= e!152907 e!152905)))

(assert (=> b!235445 (= c!39244 (and (not (= (bvand (extraKeys!4108 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4108 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235446 () Bool)

(assert (=> b!235446 (= e!152906 e!152899)))

(declare-fun res!115445 () Bool)

(declare-fun call!21899 () Bool)

(assert (=> b!235446 (= res!115445 call!21899)))

(assert (=> b!235446 (=> (not res!115445) (not e!152899))))

(declare-fun b!235447 () Bool)

(declare-fun e!152909 () Bool)

(assert (=> b!235447 (= e!152909 (= (apply!210 lt!119128 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4212 thiss!1504)))))

(declare-fun b!235448 () Bool)

(assert (=> b!235448 (= e!152902 call!21903)))

(declare-fun b!235449 () Bool)

(assert (=> b!235449 (= e!152903 e!152909)))

(declare-fun res!115444 () Bool)

(assert (=> b!235449 (= res!115444 call!21902)))

(assert (=> b!235449 (=> (not res!115444) (not e!152909))))

(declare-fun b!235450 () Bool)

(assert (=> b!235450 (= e!152906 (not call!21899))))

(declare-fun b!235451 () Bool)

(assert (=> b!235451 (= e!152904 (validKeyInArray!0 (select (arr!5531 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235452 () Bool)

(assert (=> b!235452 (= e!152911 e!152903)))

(declare-fun c!39243 () Bool)

(assert (=> b!235452 (= c!39243 (not (= (bvand (extraKeys!4108 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21898 () Bool)

(assert (=> bm!21898 (= call!21899 (contains!1661 lt!119128 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21899 () Bool)

(assert (=> bm!21899 (= call!21898 call!21897)))

(declare-fun bm!21900 () Bool)

(assert (=> bm!21900 (= call!21903 call!21898)))

(assert (= (and d!59281 c!39239) b!235433))

(assert (= (and d!59281 (not c!39239)) b!235445))

(assert (= (and b!235445 c!39244) b!235440))

(assert (= (and b!235445 (not c!39244)) b!235444))

(assert (= (and b!235444 c!39240) b!235432))

(assert (= (and b!235444 (not c!39240)) b!235448))

(assert (= (or b!235432 b!235448) bm!21900))

(assert (= (or b!235440 bm!21900) bm!21899))

(assert (= (or b!235440 b!235432) bm!21896))

(assert (= (or b!235433 bm!21899) bm!21897))

(assert (= (or b!235433 bm!21896) bm!21894))

(assert (= (and d!59281 res!115451) b!235451))

(assert (= (and d!59281 c!39242) b!235435))

(assert (= (and d!59281 (not c!39242)) b!235436))

(assert (= (and d!59281 res!115449) b!235438))

(assert (= (and b!235438 res!115447) b!235441))

(assert (= (and b!235438 (not res!115448)) b!235437))

(assert (= (and b!235437 res!115452) b!235439))

(assert (= (and b!235438 res!115446) b!235442))

(assert (= (and b!235442 c!39241) b!235446))

(assert (= (and b!235442 (not c!39241)) b!235450))

(assert (= (and b!235446 res!115445) b!235443))

(assert (= (or b!235446 b!235450) bm!21898))

(assert (= (and b!235442 res!115450) b!235452))

(assert (= (and b!235452 c!39243) b!235449))

(assert (= (and b!235452 (not c!39243)) b!235434))

(assert (= (and b!235449 res!115444) b!235447))

(assert (= (or b!235449 b!235434) bm!21895))

(declare-fun b_lambda!7903 () Bool)

(assert (=> (not b_lambda!7903) (not b!235439)))

(declare-fun t!8512 () Bool)

(declare-fun tb!2933 () Bool)

(assert (=> (and b!235292 (= (defaultEntry!4371 thiss!1504) (defaultEntry!4371 thiss!1504)) t!8512) tb!2933))

(declare-fun result!5121 () Bool)

(assert (=> tb!2933 (= result!5121 tp_is_empty!6189)))

(assert (=> b!235439 t!8512))

(declare-fun b_and!13259 () Bool)

(assert (= b_and!13255 (and (=> t!8512 result!5121) b_and!13259)))

(declare-fun m!256533 () Bool)

(assert (=> bm!21898 m!256533))

(declare-fun m!256535 () Bool)

(assert (=> bm!21894 m!256535))

(declare-fun m!256537 () Bool)

(assert (=> b!235443 m!256537))

(declare-fun m!256539 () Bool)

(assert (=> b!235433 m!256539))

(assert (=> b!235439 m!256495))

(declare-fun m!256541 () Bool)

(assert (=> b!235439 m!256541))

(declare-fun m!256543 () Bool)

(assert (=> b!235439 m!256543))

(declare-fun m!256545 () Bool)

(assert (=> b!235439 m!256545))

(assert (=> b!235439 m!256543))

(assert (=> b!235439 m!256495))

(declare-fun m!256547 () Bool)

(assert (=> b!235439 m!256547))

(assert (=> b!235439 m!256541))

(declare-fun m!256549 () Bool)

(assert (=> b!235447 m!256549))

(declare-fun m!256551 () Bool)

(assert (=> bm!21897 m!256551))

(assert (=> b!235451 m!256495))

(assert (=> b!235451 m!256495))

(assert (=> b!235451 m!256499))

(declare-fun m!256553 () Bool)

(assert (=> bm!21895 m!256553))

(assert (=> b!235437 m!256495))

(assert (=> b!235437 m!256495))

(declare-fun m!256555 () Bool)

(assert (=> b!235437 m!256555))

(assert (=> b!235441 m!256495))

(assert (=> b!235441 m!256495))

(assert (=> b!235441 m!256499))

(declare-fun m!256557 () Bool)

(assert (=> b!235435 m!256557))

(declare-fun m!256559 () Bool)

(assert (=> b!235435 m!256559))

(assert (=> b!235435 m!256557))

(declare-fun m!256561 () Bool)

(assert (=> b!235435 m!256561))

(declare-fun m!256563 () Bool)

(assert (=> b!235435 m!256563))

(declare-fun m!256565 () Bool)

(assert (=> b!235435 m!256565))

(declare-fun m!256567 () Bool)

(assert (=> b!235435 m!256567))

(declare-fun m!256569 () Bool)

(assert (=> b!235435 m!256569))

(assert (=> b!235435 m!256551))

(declare-fun m!256571 () Bool)

(assert (=> b!235435 m!256571))

(assert (=> b!235435 m!256569))

(declare-fun m!256573 () Bool)

(assert (=> b!235435 m!256573))

(declare-fun m!256575 () Bool)

(assert (=> b!235435 m!256575))

(declare-fun m!256577 () Bool)

(assert (=> b!235435 m!256577))

(assert (=> b!235435 m!256563))

(declare-fun m!256579 () Bool)

(assert (=> b!235435 m!256579))

(declare-fun m!256581 () Bool)

(assert (=> b!235435 m!256581))

(assert (=> b!235435 m!256495))

(declare-fun m!256583 () Bool)

(assert (=> b!235435 m!256583))

(declare-fun m!256585 () Bool)

(assert (=> b!235435 m!256585))

(assert (=> b!235435 m!256583))

(assert (=> d!59281 m!256461))

(assert (=> b!235297 d!59281))

(declare-fun d!59283 () Bool)

(assert (=> d!59283 (= (validMask!0 (mask!10338 thiss!1504)) (and (or (= (mask!10338 thiss!1504) #b00000000000000000000000000000111) (= (mask!10338 thiss!1504) #b00000000000000000000000000001111) (= (mask!10338 thiss!1504) #b00000000000000000000000000011111) (= (mask!10338 thiss!1504) #b00000000000000000000000000111111) (= (mask!10338 thiss!1504) #b00000000000000000000000001111111) (= (mask!10338 thiss!1504) #b00000000000000000000000011111111) (= (mask!10338 thiss!1504) #b00000000000000000000000111111111) (= (mask!10338 thiss!1504) #b00000000000000000000001111111111) (= (mask!10338 thiss!1504) #b00000000000000000000011111111111) (= (mask!10338 thiss!1504) #b00000000000000000000111111111111) (= (mask!10338 thiss!1504) #b00000000000000000001111111111111) (= (mask!10338 thiss!1504) #b00000000000000000011111111111111) (= (mask!10338 thiss!1504) #b00000000000000000111111111111111) (= (mask!10338 thiss!1504) #b00000000000000001111111111111111) (= (mask!10338 thiss!1504) #b00000000000000011111111111111111) (= (mask!10338 thiss!1504) #b00000000000000111111111111111111) (= (mask!10338 thiss!1504) #b00000000000001111111111111111111) (= (mask!10338 thiss!1504) #b00000000000011111111111111111111) (= (mask!10338 thiss!1504) #b00000000000111111111111111111111) (= (mask!10338 thiss!1504) #b00000000001111111111111111111111) (= (mask!10338 thiss!1504) #b00000000011111111111111111111111) (= (mask!10338 thiss!1504) #b00000000111111111111111111111111) (= (mask!10338 thiss!1504) #b00000001111111111111111111111111) (= (mask!10338 thiss!1504) #b00000011111111111111111111111111) (= (mask!10338 thiss!1504) #b00000111111111111111111111111111) (= (mask!10338 thiss!1504) #b00001111111111111111111111111111) (= (mask!10338 thiss!1504) #b00011111111111111111111111111111) (= (mask!10338 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10338 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235302 d!59283))

(declare-fun d!59285 () Bool)

(assert (=> d!59285 (= (array_inv!3647 (_keys!6445 thiss!1504)) (bvsge (size!5868 (_keys!6445 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235292 d!59285))

(declare-fun d!59287 () Bool)

(assert (=> d!59287 (= (array_inv!3648 (_values!4354 thiss!1504)) (bvsge (size!5867 (_values!4354 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235292 d!59287))

(declare-fun d!59289 () Bool)

(declare-fun res!115459 () Bool)

(declare-fun e!152914 () Bool)

(assert (=> d!59289 (=> (not res!115459) (not e!152914))))

(declare-fun simpleValid!233 (LongMapFixedSize!3402) Bool)

(assert (=> d!59289 (= res!115459 (simpleValid!233 thiss!1504))))

(assert (=> d!59289 (= (valid!1343 thiss!1504) e!152914)))

(declare-fun b!235461 () Bool)

(declare-fun res!115460 () Bool)

(assert (=> b!235461 (=> (not res!115460) (not e!152914))))

(declare-fun arrayCountValidKeys!0 (array!11637 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!235461 (= res!115460 (= (arrayCountValidKeys!0 (_keys!6445 thiss!1504) #b00000000000000000000000000000000 (size!5868 (_keys!6445 thiss!1504))) (_size!1750 thiss!1504)))))

(declare-fun b!235462 () Bool)

(declare-fun res!115461 () Bool)

(assert (=> b!235462 (=> (not res!115461) (not e!152914))))

(assert (=> b!235462 (= res!115461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6445 thiss!1504) (mask!10338 thiss!1504)))))

(declare-fun b!235463 () Bool)

(assert (=> b!235463 (= e!152914 (arrayNoDuplicates!0 (_keys!6445 thiss!1504) #b00000000000000000000000000000000 Nil!3532))))

(assert (= (and d!59289 res!115459) b!235461))

(assert (= (and b!235461 res!115460) b!235462))

(assert (= (and b!235462 res!115461) b!235463))

(declare-fun m!256587 () Bool)

(assert (=> d!59289 m!256587))

(declare-fun m!256589 () Bool)

(assert (=> b!235461 m!256589))

(assert (=> b!235462 m!256473))

(assert (=> b!235463 m!256455))

(assert (=> start!22504 d!59289))

(declare-fun b!235470 () Bool)

(declare-fun e!152920 () Bool)

(assert (=> b!235470 (= e!152920 tp_is_empty!6189)))

(declare-fun mapIsEmpty!10484 () Bool)

(declare-fun mapRes!10484 () Bool)

(assert (=> mapIsEmpty!10484 mapRes!10484))

(declare-fun b!235471 () Bool)

(declare-fun e!152919 () Bool)

(assert (=> b!235471 (= e!152919 tp_is_empty!6189)))

(declare-fun condMapEmpty!10484 () Bool)

(declare-fun mapDefault!10484 () ValueCell!2751)

(assert (=> mapNonEmpty!10478 (= condMapEmpty!10484 (= mapRest!10478 ((as const (Array (_ BitVec 32) ValueCell!2751)) mapDefault!10484)))))

(assert (=> mapNonEmpty!10478 (= tp!22147 (and e!152919 mapRes!10484))))

(declare-fun mapNonEmpty!10484 () Bool)

(declare-fun tp!22157 () Bool)

(assert (=> mapNonEmpty!10484 (= mapRes!10484 (and tp!22157 e!152920))))

(declare-fun mapKey!10484 () (_ BitVec 32))

(declare-fun mapValue!10484 () ValueCell!2751)

(declare-fun mapRest!10484 () (Array (_ BitVec 32) ValueCell!2751))

(assert (=> mapNonEmpty!10484 (= mapRest!10478 (store mapRest!10484 mapKey!10484 mapValue!10484))))

(assert (= (and mapNonEmpty!10478 condMapEmpty!10484) mapIsEmpty!10484))

(assert (= (and mapNonEmpty!10478 (not condMapEmpty!10484)) mapNonEmpty!10484))

(assert (= (and mapNonEmpty!10484 ((_ is ValueCellFull!2751) mapValue!10484)) b!235470))

(assert (= (and mapNonEmpty!10478 ((_ is ValueCellFull!2751) mapDefault!10484)) b!235471))

(declare-fun m!256591 () Bool)

(assert (=> mapNonEmpty!10484 m!256591))

(declare-fun b_lambda!7905 () Bool)

(assert (= b_lambda!7903 (or (and b!235292 b_free!6327) b_lambda!7905)))

(check-sat (not b!235443) (not b!235441) tp_is_empty!6189 (not b!235447) (not b!235461) (not b_next!6327) (not bm!21879) (not b!235463) (not bm!21895) (not bm!21897) (not mapNonEmpty!10484) (not d!59275) (not b!235377) (not bm!21898) (not b!235433) (not b!235435) (not b!235462) (not b!235439) (not d!59281) (not b!235389) (not b!235387) (not b!235348) (not d!59279) (not b!235347) (not bm!21894) (not bm!21876) (not b!235349) (not b_lambda!7905) (not b!235380) (not d!59289) b_and!13259 (not b!235437) (not b!235366) (not b!235451))
(check-sat b_and!13259 (not b_next!6327))
