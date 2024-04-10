; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17382 () Bool)

(assert start!17382)

(declare-fun b!174483 () Bool)

(declare-fun b_free!4317 () Bool)

(declare-fun b_next!4317 () Bool)

(assert (=> b!174483 (= b_free!4317 (not b_next!4317))))

(declare-fun tp!15619 () Bool)

(declare-fun b_and!10783 () Bool)

(assert (=> b!174483 (= tp!15619 b_and!10783)))

(declare-fun b!174480 () Bool)

(declare-fun e!115220 () Bool)

(declare-fun e!115221 () Bool)

(declare-fun mapRes!6965 () Bool)

(assert (=> b!174480 (= e!115220 (and e!115221 mapRes!6965))))

(declare-fun condMapEmpty!6965 () Bool)

(declare-datatypes ((V!5099 0))(
  ( (V!5100 (val!2089 Int)) )
))
(declare-datatypes ((ValueCell!1701 0))(
  ( (ValueCellFull!1701 (v!3960 V!5099)) (EmptyCell!1701) )
))
(declare-datatypes ((array!7311 0))(
  ( (array!7312 (arr!3473 (Array (_ BitVec 32) (_ BitVec 64))) (size!3773 (_ BitVec 32))) )
))
(declare-datatypes ((array!7313 0))(
  ( (array!7314 (arr!3474 (Array (_ BitVec 32) ValueCell!1701)) (size!3774 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2310 0))(
  ( (LongMapFixedSize!2311 (defaultEntry!3605 Int) (mask!8482 (_ BitVec 32)) (extraKeys!3342 (_ BitVec 32)) (zeroValue!3446 V!5099) (minValue!3446 V!5099) (_size!1204 (_ BitVec 32)) (_keys!5448 array!7311) (_values!3588 array!7313) (_vacant!1204 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2310)

(declare-fun mapDefault!6965 () ValueCell!1701)

(assert (=> b!174480 (= condMapEmpty!6965 (= (arr!3474 (_values!3588 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1701)) mapDefault!6965)))))

(declare-fun b!174481 () Bool)

(declare-fun res!82758 () Bool)

(declare-fun e!115222 () Bool)

(assert (=> b!174481 (=> (not res!82758) (not e!115222))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!174481 (= res!82758 (not (= key!828 (bvneg key!828))))))

(declare-fun b!174482 () Bool)

(declare-fun res!82760 () Bool)

(assert (=> b!174482 (=> (not res!82760) (not e!115222))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!544 0))(
  ( (MissingZero!544 (index!4344 (_ BitVec 32))) (Found!544 (index!4345 (_ BitVec 32))) (Intermediate!544 (undefined!1356 Bool) (index!4346 (_ BitVec 32)) (x!19214 (_ BitVec 32))) (Undefined!544) (MissingVacant!544 (index!4347 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7311 (_ BitVec 32)) SeekEntryResult!544)

(assert (=> b!174482 (= res!82760 ((_ is Undefined!544) (seekEntryOrOpen!0 key!828 (_keys!5448 thiss!1248) (mask!8482 thiss!1248))))))

(declare-fun tp_is_empty!4089 () Bool)

(declare-fun e!115219 () Bool)

(declare-fun array_inv!2223 (array!7311) Bool)

(declare-fun array_inv!2224 (array!7313) Bool)

(assert (=> b!174483 (= e!115219 (and tp!15619 tp_is_empty!4089 (array_inv!2223 (_keys!5448 thiss!1248)) (array_inv!2224 (_values!3588 thiss!1248)) e!115220))))

(declare-fun b!174484 () Bool)

(declare-fun e!115223 () Bool)

(assert (=> b!174484 (= e!115223 tp_is_empty!4089)))

(declare-fun res!82761 () Bool)

(assert (=> start!17382 (=> (not res!82761) (not e!115222))))

(declare-fun valid!976 (LongMapFixedSize!2310) Bool)

(assert (=> start!17382 (= res!82761 (valid!976 thiss!1248))))

(assert (=> start!17382 e!115222))

(assert (=> start!17382 e!115219))

(assert (=> start!17382 true))

(declare-fun b!174485 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!174485 (= e!115222 (not (validMask!0 (mask!8482 thiss!1248))))))

(declare-fun mapNonEmpty!6965 () Bool)

(declare-fun tp!15620 () Bool)

(assert (=> mapNonEmpty!6965 (= mapRes!6965 (and tp!15620 e!115223))))

(declare-fun mapRest!6965 () (Array (_ BitVec 32) ValueCell!1701))

(declare-fun mapValue!6965 () ValueCell!1701)

(declare-fun mapKey!6965 () (_ BitVec 32))

(assert (=> mapNonEmpty!6965 (= (arr!3474 (_values!3588 thiss!1248)) (store mapRest!6965 mapKey!6965 mapValue!6965))))

(declare-fun b!174486 () Bool)

(assert (=> b!174486 (= e!115221 tp_is_empty!4089)))

(declare-fun mapIsEmpty!6965 () Bool)

(assert (=> mapIsEmpty!6965 mapRes!6965))

(declare-fun b!174487 () Bool)

(declare-fun res!82759 () Bool)

(assert (=> b!174487 (=> (not res!82759) (not e!115222))))

(declare-datatypes ((tuple2!3246 0))(
  ( (tuple2!3247 (_1!1634 (_ BitVec 64)) (_2!1634 V!5099)) )
))
(declare-datatypes ((List!2210 0))(
  ( (Nil!2207) (Cons!2206 (h!2823 tuple2!3246) (t!7022 List!2210)) )
))
(declare-datatypes ((ListLongMap!2173 0))(
  ( (ListLongMap!2174 (toList!1102 List!2210)) )
))
(declare-fun contains!1158 (ListLongMap!2173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!754 (array!7311 array!7313 (_ BitVec 32) (_ BitVec 32) V!5099 V!5099 (_ BitVec 32) Int) ListLongMap!2173)

(assert (=> b!174487 (= res!82759 (contains!1158 (getCurrentListMap!754 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248)) key!828))))

(assert (= (and start!17382 res!82761) b!174481))

(assert (= (and b!174481 res!82758) b!174482))

(assert (= (and b!174482 res!82760) b!174487))

(assert (= (and b!174487 res!82759) b!174485))

(assert (= (and b!174480 condMapEmpty!6965) mapIsEmpty!6965))

(assert (= (and b!174480 (not condMapEmpty!6965)) mapNonEmpty!6965))

(assert (= (and mapNonEmpty!6965 ((_ is ValueCellFull!1701) mapValue!6965)) b!174484))

(assert (= (and b!174480 ((_ is ValueCellFull!1701) mapDefault!6965)) b!174486))

(assert (= b!174483 b!174480))

(assert (= start!17382 b!174483))

(declare-fun m!203529 () Bool)

(assert (=> b!174487 m!203529))

(assert (=> b!174487 m!203529))

(declare-fun m!203531 () Bool)

(assert (=> b!174487 m!203531))

(declare-fun m!203533 () Bool)

(assert (=> start!17382 m!203533))

(declare-fun m!203535 () Bool)

(assert (=> b!174485 m!203535))

(declare-fun m!203537 () Bool)

(assert (=> mapNonEmpty!6965 m!203537))

(declare-fun m!203539 () Bool)

(assert (=> b!174482 m!203539))

(declare-fun m!203541 () Bool)

(assert (=> b!174483 m!203541))

(declare-fun m!203543 () Bool)

(assert (=> b!174483 m!203543))

(check-sat tp_is_empty!4089 (not mapNonEmpty!6965) (not b!174483) (not b!174482) (not b!174487) (not b_next!4317) (not start!17382) (not b!174485) b_and!10783)
(check-sat b_and!10783 (not b_next!4317))
(get-model)

(declare-fun d!53277 () Bool)

(assert (=> d!53277 (= (array_inv!2223 (_keys!5448 thiss!1248)) (bvsge (size!3773 (_keys!5448 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174483 d!53277))

(declare-fun d!53279 () Bool)

(assert (=> d!53279 (= (array_inv!2224 (_values!3588 thiss!1248)) (bvsge (size!3774 (_values!3588 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174483 d!53279))

(declare-fun d!53281 () Bool)

(declare-fun res!82780 () Bool)

(declare-fun e!115245 () Bool)

(assert (=> d!53281 (=> (not res!82780) (not e!115245))))

(declare-fun simpleValid!145 (LongMapFixedSize!2310) Bool)

(assert (=> d!53281 (= res!82780 (simpleValid!145 thiss!1248))))

(assert (=> d!53281 (= (valid!976 thiss!1248) e!115245)))

(declare-fun b!174518 () Bool)

(declare-fun res!82781 () Bool)

(assert (=> b!174518 (=> (not res!82781) (not e!115245))))

(declare-fun arrayCountValidKeys!0 (array!7311 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!174518 (= res!82781 (= (arrayCountValidKeys!0 (_keys!5448 thiss!1248) #b00000000000000000000000000000000 (size!3773 (_keys!5448 thiss!1248))) (_size!1204 thiss!1248)))))

(declare-fun b!174519 () Bool)

(declare-fun res!82782 () Bool)

(assert (=> b!174519 (=> (not res!82782) (not e!115245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7311 (_ BitVec 32)) Bool)

(assert (=> b!174519 (= res!82782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5448 thiss!1248) (mask!8482 thiss!1248)))))

(declare-fun b!174520 () Bool)

(declare-datatypes ((List!2212 0))(
  ( (Nil!2209) (Cons!2208 (h!2825 (_ BitVec 64)) (t!7026 List!2212)) )
))
(declare-fun arrayNoDuplicates!0 (array!7311 (_ BitVec 32) List!2212) Bool)

(assert (=> b!174520 (= e!115245 (arrayNoDuplicates!0 (_keys!5448 thiss!1248) #b00000000000000000000000000000000 Nil!2209))))

(assert (= (and d!53281 res!82780) b!174518))

(assert (= (and b!174518 res!82781) b!174519))

(assert (= (and b!174519 res!82782) b!174520))

(declare-fun m!203561 () Bool)

(assert (=> d!53281 m!203561))

(declare-fun m!203563 () Bool)

(assert (=> b!174518 m!203563))

(declare-fun m!203565 () Bool)

(assert (=> b!174519 m!203565))

(declare-fun m!203567 () Bool)

(assert (=> b!174520 m!203567))

(assert (=> start!17382 d!53281))

(declare-fun d!53283 () Bool)

(declare-fun e!115251 () Bool)

(assert (=> d!53283 e!115251))

(declare-fun res!82785 () Bool)

(assert (=> d!53283 (=> res!82785 e!115251)))

(declare-fun lt!86328 () Bool)

(assert (=> d!53283 (= res!82785 (not lt!86328))))

(declare-fun lt!86329 () Bool)

(assert (=> d!53283 (= lt!86328 lt!86329)))

(declare-datatypes ((Unit!5364 0))(
  ( (Unit!5365) )
))
(declare-fun lt!86327 () Unit!5364)

(declare-fun e!115250 () Unit!5364)

(assert (=> d!53283 (= lt!86327 e!115250)))

(declare-fun c!31230 () Bool)

(assert (=> d!53283 (= c!31230 lt!86329)))

(declare-fun containsKey!190 (List!2210 (_ BitVec 64)) Bool)

(assert (=> d!53283 (= lt!86329 (containsKey!190 (toList!1102 (getCurrentListMap!754 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248))) key!828))))

(assert (=> d!53283 (= (contains!1158 (getCurrentListMap!754 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248)) key!828) lt!86328)))

(declare-fun b!174527 () Bool)

(declare-fun lt!86326 () Unit!5364)

(assert (=> b!174527 (= e!115250 lt!86326)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!138 (List!2210 (_ BitVec 64)) Unit!5364)

(assert (=> b!174527 (= lt!86326 (lemmaContainsKeyImpliesGetValueByKeyDefined!138 (toList!1102 (getCurrentListMap!754 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248))) key!828))))

(declare-datatypes ((Option!192 0))(
  ( (Some!191 (v!3962 V!5099)) (None!190) )
))
(declare-fun isDefined!139 (Option!192) Bool)

(declare-fun getValueByKey!186 (List!2210 (_ BitVec 64)) Option!192)

(assert (=> b!174527 (isDefined!139 (getValueByKey!186 (toList!1102 (getCurrentListMap!754 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248))) key!828))))

(declare-fun b!174528 () Bool)

(declare-fun Unit!5366 () Unit!5364)

(assert (=> b!174528 (= e!115250 Unit!5366)))

(declare-fun b!174529 () Bool)

(assert (=> b!174529 (= e!115251 (isDefined!139 (getValueByKey!186 (toList!1102 (getCurrentListMap!754 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248))) key!828)))))

(assert (= (and d!53283 c!31230) b!174527))

(assert (= (and d!53283 (not c!31230)) b!174528))

(assert (= (and d!53283 (not res!82785)) b!174529))

(declare-fun m!203569 () Bool)

(assert (=> d!53283 m!203569))

(declare-fun m!203571 () Bool)

(assert (=> b!174527 m!203571))

(declare-fun m!203573 () Bool)

(assert (=> b!174527 m!203573))

(assert (=> b!174527 m!203573))

(declare-fun m!203575 () Bool)

(assert (=> b!174527 m!203575))

(assert (=> b!174529 m!203573))

(assert (=> b!174529 m!203573))

(assert (=> b!174529 m!203575))

(assert (=> b!174487 d!53283))

(declare-fun b!174572 () Bool)

(declare-fun e!115281 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!174572 (= e!115281 (validKeyInArray!0 (select (arr!3473 (_keys!5448 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174573 () Bool)

(declare-fun e!115283 () Bool)

(declare-fun call!17688 () Bool)

(assert (=> b!174573 (= e!115283 (not call!17688))))

(declare-fun b!174574 () Bool)

(declare-fun e!115279 () ListLongMap!2173)

(declare-fun call!17692 () ListLongMap!2173)

(assert (=> b!174574 (= e!115279 call!17692)))

(declare-fun bm!17683 () Bool)

(declare-fun call!17687 () ListLongMap!2173)

(declare-fun getCurrentListMapNoExtraKeys!164 (array!7311 array!7313 (_ BitVec 32) (_ BitVec 32) V!5099 V!5099 (_ BitVec 32) Int) ListLongMap!2173)

(assert (=> bm!17683 (= call!17687 (getCurrentListMapNoExtraKeys!164 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248)))))

(declare-fun b!174575 () Bool)

(declare-fun e!115287 () Bool)

(declare-fun call!17690 () Bool)

(assert (=> b!174575 (= e!115287 (not call!17690))))

(declare-fun call!17691 () ListLongMap!2173)

(declare-fun c!31248 () Bool)

(declare-fun c!31245 () Bool)

(declare-fun call!17689 () ListLongMap!2173)

(declare-fun bm!17684 () Bool)

(declare-fun call!17686 () ListLongMap!2173)

(declare-fun +!248 (ListLongMap!2173 tuple2!3246) ListLongMap!2173)

(assert (=> bm!17684 (= call!17691 (+!248 (ite c!31248 call!17687 (ite c!31245 call!17689 call!17686)) (ite (or c!31248 c!31245) (tuple2!3247 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3446 thiss!1248)) (tuple2!3247 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3446 thiss!1248)))))))

(declare-fun b!174576 () Bool)

(declare-fun e!115284 () Unit!5364)

(declare-fun Unit!5367 () Unit!5364)

(assert (=> b!174576 (= e!115284 Unit!5367)))

(declare-fun bm!17685 () Bool)

(assert (=> bm!17685 (= call!17689 call!17687)))

(declare-fun b!174577 () Bool)

(declare-fun res!82806 () Bool)

(declare-fun e!115290 () Bool)

(assert (=> b!174577 (=> (not res!82806) (not e!115290))))

(assert (=> b!174577 (= res!82806 e!115283)))

(declare-fun c!31244 () Bool)

(assert (=> b!174577 (= c!31244 (not (= (bvand (extraKeys!3342 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!17686 () Bool)

(assert (=> bm!17686 (= call!17686 call!17689)))

(declare-fun b!174578 () Bool)

(declare-fun e!115289 () ListLongMap!2173)

(declare-fun e!115278 () ListLongMap!2173)

(assert (=> b!174578 (= e!115289 e!115278)))

(assert (=> b!174578 (= c!31245 (and (not (= (bvand (extraKeys!3342 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3342 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!174579 () Bool)

(declare-fun e!115285 () Bool)

(assert (=> b!174579 (= e!115283 e!115285)))

(declare-fun res!82809 () Bool)

(assert (=> b!174579 (= res!82809 call!17688)))

(assert (=> b!174579 (=> (not res!82809) (not e!115285))))

(declare-fun b!174580 () Bool)

(declare-fun lt!86391 () Unit!5364)

(assert (=> b!174580 (= e!115284 lt!86391)))

(declare-fun lt!86393 () ListLongMap!2173)

(assert (=> b!174580 (= lt!86393 (getCurrentListMapNoExtraKeys!164 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248)))))

(declare-fun lt!86392 () (_ BitVec 64))

(assert (=> b!174580 (= lt!86392 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86376 () (_ BitVec 64))

(assert (=> b!174580 (= lt!86376 (select (arr!3473 (_keys!5448 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86387 () Unit!5364)

(declare-fun addStillContains!107 (ListLongMap!2173 (_ BitVec 64) V!5099 (_ BitVec 64)) Unit!5364)

(assert (=> b!174580 (= lt!86387 (addStillContains!107 lt!86393 lt!86392 (zeroValue!3446 thiss!1248) lt!86376))))

(assert (=> b!174580 (contains!1158 (+!248 lt!86393 (tuple2!3247 lt!86392 (zeroValue!3446 thiss!1248))) lt!86376)))

(declare-fun lt!86378 () Unit!5364)

(assert (=> b!174580 (= lt!86378 lt!86387)))

(declare-fun lt!86386 () ListLongMap!2173)

(assert (=> b!174580 (= lt!86386 (getCurrentListMapNoExtraKeys!164 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248)))))

(declare-fun lt!86383 () (_ BitVec 64))

(assert (=> b!174580 (= lt!86383 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86388 () (_ BitVec 64))

(assert (=> b!174580 (= lt!86388 (select (arr!3473 (_keys!5448 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86390 () Unit!5364)

(declare-fun addApplyDifferent!107 (ListLongMap!2173 (_ BitVec 64) V!5099 (_ BitVec 64)) Unit!5364)

(assert (=> b!174580 (= lt!86390 (addApplyDifferent!107 lt!86386 lt!86383 (minValue!3446 thiss!1248) lt!86388))))

(declare-fun apply!131 (ListLongMap!2173 (_ BitVec 64)) V!5099)

(assert (=> b!174580 (= (apply!131 (+!248 lt!86386 (tuple2!3247 lt!86383 (minValue!3446 thiss!1248))) lt!86388) (apply!131 lt!86386 lt!86388))))

(declare-fun lt!86377 () Unit!5364)

(assert (=> b!174580 (= lt!86377 lt!86390)))

(declare-fun lt!86379 () ListLongMap!2173)

(assert (=> b!174580 (= lt!86379 (getCurrentListMapNoExtraKeys!164 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248)))))

(declare-fun lt!86384 () (_ BitVec 64))

(assert (=> b!174580 (= lt!86384 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86381 () (_ BitVec 64))

(assert (=> b!174580 (= lt!86381 (select (arr!3473 (_keys!5448 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86395 () Unit!5364)

(assert (=> b!174580 (= lt!86395 (addApplyDifferent!107 lt!86379 lt!86384 (zeroValue!3446 thiss!1248) lt!86381))))

(assert (=> b!174580 (= (apply!131 (+!248 lt!86379 (tuple2!3247 lt!86384 (zeroValue!3446 thiss!1248))) lt!86381) (apply!131 lt!86379 lt!86381))))

(declare-fun lt!86374 () Unit!5364)

(assert (=> b!174580 (= lt!86374 lt!86395)))

(declare-fun lt!86380 () ListLongMap!2173)

(assert (=> b!174580 (= lt!86380 (getCurrentListMapNoExtraKeys!164 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248)))))

(declare-fun lt!86389 () (_ BitVec 64))

(assert (=> b!174580 (= lt!86389 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86375 () (_ BitVec 64))

(assert (=> b!174580 (= lt!86375 (select (arr!3473 (_keys!5448 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174580 (= lt!86391 (addApplyDifferent!107 lt!86380 lt!86389 (minValue!3446 thiss!1248) lt!86375))))

(assert (=> b!174580 (= (apply!131 (+!248 lt!86380 (tuple2!3247 lt!86389 (minValue!3446 thiss!1248))) lt!86375) (apply!131 lt!86380 lt!86375))))

(declare-fun b!174581 () Bool)

(declare-fun e!115282 () Bool)

(assert (=> b!174581 (= e!115282 (validKeyInArray!0 (select (arr!3473 (_keys!5448 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17687 () Bool)

(assert (=> bm!17687 (= call!17692 call!17691)))

(declare-fun bm!17688 () Bool)

(declare-fun lt!86382 () ListLongMap!2173)

(assert (=> bm!17688 (= call!17690 (contains!1158 lt!86382 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174582 () Bool)

(declare-fun e!115280 () Bool)

(assert (=> b!174582 (= e!115280 (= (apply!131 lt!86382 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3446 thiss!1248)))))

(declare-fun b!174583 () Bool)

(declare-fun e!115286 () Bool)

(declare-fun get!1974 (ValueCell!1701 V!5099) V!5099)

(declare-fun dynLambda!474 (Int (_ BitVec 64)) V!5099)

(assert (=> b!174583 (= e!115286 (= (apply!131 lt!86382 (select (arr!3473 (_keys!5448 thiss!1248)) #b00000000000000000000000000000000)) (get!1974 (select (arr!3474 (_values!3588 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!474 (defaultEntry!3605 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!174583 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3774 (_values!3588 thiss!1248))))))

(assert (=> b!174583 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3773 (_keys!5448 thiss!1248))))))

(declare-fun b!174584 () Bool)

(assert (=> b!174584 (= e!115279 call!17686)))

(declare-fun d!53285 () Bool)

(assert (=> d!53285 e!115290))

(declare-fun res!82805 () Bool)

(assert (=> d!53285 (=> (not res!82805) (not e!115290))))

(assert (=> d!53285 (= res!82805 (or (bvsge #b00000000000000000000000000000000 (size!3773 (_keys!5448 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3773 (_keys!5448 thiss!1248))))))))

(declare-fun lt!86385 () ListLongMap!2173)

(assert (=> d!53285 (= lt!86382 lt!86385)))

(declare-fun lt!86394 () Unit!5364)

(assert (=> d!53285 (= lt!86394 e!115284)))

(declare-fun c!31246 () Bool)

(assert (=> d!53285 (= c!31246 e!115281)))

(declare-fun res!82807 () Bool)

(assert (=> d!53285 (=> (not res!82807) (not e!115281))))

(assert (=> d!53285 (= res!82807 (bvslt #b00000000000000000000000000000000 (size!3773 (_keys!5448 thiss!1248))))))

(assert (=> d!53285 (= lt!86385 e!115289)))

(assert (=> d!53285 (= c!31248 (and (not (= (bvand (extraKeys!3342 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3342 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53285 (validMask!0 (mask!8482 thiss!1248))))

(assert (=> d!53285 (= (getCurrentListMap!754 (_keys!5448 thiss!1248) (_values!3588 thiss!1248) (mask!8482 thiss!1248) (extraKeys!3342 thiss!1248) (zeroValue!3446 thiss!1248) (minValue!3446 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3605 thiss!1248)) lt!86382)))

(declare-fun b!174585 () Bool)

(assert (=> b!174585 (= e!115278 call!17692)))

(declare-fun b!174586 () Bool)

(assert (=> b!174586 (= e!115289 (+!248 call!17691 (tuple2!3247 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3446 thiss!1248))))))

(declare-fun b!174587 () Bool)

(declare-fun e!115288 () Bool)

(assert (=> b!174587 (= e!115288 e!115286)))

(declare-fun res!82808 () Bool)

(assert (=> b!174587 (=> (not res!82808) (not e!115286))))

(assert (=> b!174587 (= res!82808 (contains!1158 lt!86382 (select (arr!3473 (_keys!5448 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174587 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3773 (_keys!5448 thiss!1248))))))

(declare-fun bm!17689 () Bool)

(assert (=> bm!17689 (= call!17688 (contains!1158 lt!86382 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174588 () Bool)

(assert (=> b!174588 (= e!115285 (= (apply!131 lt!86382 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3446 thiss!1248)))))

(declare-fun b!174589 () Bool)

(assert (=> b!174589 (= e!115287 e!115280)))

(declare-fun res!82811 () Bool)

(assert (=> b!174589 (= res!82811 call!17690)))

(assert (=> b!174589 (=> (not res!82811) (not e!115280))))

(declare-fun b!174590 () Bool)

(assert (=> b!174590 (= e!115290 e!115287)))

(declare-fun c!31247 () Bool)

(assert (=> b!174590 (= c!31247 (not (= (bvand (extraKeys!3342 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!174591 () Bool)

(declare-fun res!82804 () Bool)

(assert (=> b!174591 (=> (not res!82804) (not e!115290))))

(assert (=> b!174591 (= res!82804 e!115288)))

(declare-fun res!82810 () Bool)

(assert (=> b!174591 (=> res!82810 e!115288)))

(assert (=> b!174591 (= res!82810 (not e!115282))))

(declare-fun res!82812 () Bool)

(assert (=> b!174591 (=> (not res!82812) (not e!115282))))

(assert (=> b!174591 (= res!82812 (bvslt #b00000000000000000000000000000000 (size!3773 (_keys!5448 thiss!1248))))))

(declare-fun b!174592 () Bool)

(declare-fun c!31243 () Bool)

(assert (=> b!174592 (= c!31243 (and (not (= (bvand (extraKeys!3342 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3342 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!174592 (= e!115278 e!115279)))

(assert (= (and d!53285 c!31248) b!174586))

(assert (= (and d!53285 (not c!31248)) b!174578))

(assert (= (and b!174578 c!31245) b!174585))

(assert (= (and b!174578 (not c!31245)) b!174592))

(assert (= (and b!174592 c!31243) b!174574))

(assert (= (and b!174592 (not c!31243)) b!174584))

(assert (= (or b!174574 b!174584) bm!17686))

(assert (= (or b!174585 bm!17686) bm!17685))

(assert (= (or b!174585 b!174574) bm!17687))

(assert (= (or b!174586 bm!17685) bm!17683))

(assert (= (or b!174586 bm!17687) bm!17684))

(assert (= (and d!53285 res!82807) b!174572))

(assert (= (and d!53285 c!31246) b!174580))

(assert (= (and d!53285 (not c!31246)) b!174576))

(assert (= (and d!53285 res!82805) b!174591))

(assert (= (and b!174591 res!82812) b!174581))

(assert (= (and b!174591 (not res!82810)) b!174587))

(assert (= (and b!174587 res!82808) b!174583))

(assert (= (and b!174591 res!82804) b!174577))

(assert (= (and b!174577 c!31244) b!174579))

(assert (= (and b!174577 (not c!31244)) b!174573))

(assert (= (and b!174579 res!82809) b!174588))

(assert (= (or b!174579 b!174573) bm!17689))

(assert (= (and b!174577 res!82806) b!174590))

(assert (= (and b!174590 c!31247) b!174589))

(assert (= (and b!174590 (not c!31247)) b!174575))

(assert (= (and b!174589 res!82811) b!174582))

(assert (= (or b!174589 b!174575) bm!17688))

(declare-fun b_lambda!6983 () Bool)

(assert (=> (not b_lambda!6983) (not b!174583)))

(declare-fun t!7025 () Bool)

(declare-fun tb!2773 () Bool)

(assert (=> (and b!174483 (= (defaultEntry!3605 thiss!1248) (defaultEntry!3605 thiss!1248)) t!7025) tb!2773))

(declare-fun result!4593 () Bool)

(assert (=> tb!2773 (= result!4593 tp_is_empty!4089)))

(assert (=> b!174583 t!7025))

(declare-fun b_and!10787 () Bool)

(assert (= b_and!10783 (and (=> t!7025 result!4593) b_and!10787)))

(declare-fun m!203577 () Bool)

(assert (=> b!174587 m!203577))

(assert (=> b!174587 m!203577))

(declare-fun m!203579 () Bool)

(assert (=> b!174587 m!203579))

(assert (=> b!174581 m!203577))

(assert (=> b!174581 m!203577))

(declare-fun m!203581 () Bool)

(assert (=> b!174581 m!203581))

(declare-fun m!203583 () Bool)

(assert (=> bm!17683 m!203583))

(declare-fun m!203585 () Bool)

(assert (=> b!174588 m!203585))

(declare-fun m!203587 () Bool)

(assert (=> bm!17689 m!203587))

(declare-fun m!203589 () Bool)

(assert (=> b!174583 m!203589))

(assert (=> b!174583 m!203589))

(declare-fun m!203591 () Bool)

(assert (=> b!174583 m!203591))

(declare-fun m!203593 () Bool)

(assert (=> b!174583 m!203593))

(assert (=> b!174583 m!203577))

(assert (=> b!174583 m!203577))

(declare-fun m!203595 () Bool)

(assert (=> b!174583 m!203595))

(assert (=> b!174583 m!203591))

(assert (=> d!53285 m!203535))

(assert (=> b!174572 m!203577))

(assert (=> b!174572 m!203577))

(assert (=> b!174572 m!203581))

(declare-fun m!203597 () Bool)

(assert (=> bm!17684 m!203597))

(declare-fun m!203599 () Bool)

(assert (=> bm!17688 m!203599))

(declare-fun m!203601 () Bool)

(assert (=> b!174580 m!203601))

(declare-fun m!203603 () Bool)

(assert (=> b!174580 m!203603))

(declare-fun m!203605 () Bool)

(assert (=> b!174580 m!203605))

(assert (=> b!174580 m!203603))

(assert (=> b!174580 m!203583))

(declare-fun m!203607 () Bool)

(assert (=> b!174580 m!203607))

(declare-fun m!203609 () Bool)

(assert (=> b!174580 m!203609))

(declare-fun m!203611 () Bool)

(assert (=> b!174580 m!203611))

(declare-fun m!203613 () Bool)

(assert (=> b!174580 m!203613))

(declare-fun m!203615 () Bool)

(assert (=> b!174580 m!203615))

(assert (=> b!174580 m!203577))

(declare-fun m!203617 () Bool)

(assert (=> b!174580 m!203617))

(declare-fun m!203619 () Bool)

(assert (=> b!174580 m!203619))

(declare-fun m!203621 () Bool)

(assert (=> b!174580 m!203621))

(assert (=> b!174580 m!203613))

(declare-fun m!203623 () Bool)

(assert (=> b!174580 m!203623))

(declare-fun m!203625 () Bool)

(assert (=> b!174580 m!203625))

(declare-fun m!203627 () Bool)

(assert (=> b!174580 m!203627))

(assert (=> b!174580 m!203607))

(declare-fun m!203629 () Bool)

(assert (=> b!174580 m!203629))

(assert (=> b!174580 m!203625))

(declare-fun m!203631 () Bool)

(assert (=> b!174586 m!203631))

(declare-fun m!203633 () Bool)

(assert (=> b!174582 m!203633))

(assert (=> b!174487 d!53285))

(declare-fun d!53287 () Bool)

(assert (=> d!53287 (= (validMask!0 (mask!8482 thiss!1248)) (and (or (= (mask!8482 thiss!1248) #b00000000000000000000000000000111) (= (mask!8482 thiss!1248) #b00000000000000000000000000001111) (= (mask!8482 thiss!1248) #b00000000000000000000000000011111) (= (mask!8482 thiss!1248) #b00000000000000000000000000111111) (= (mask!8482 thiss!1248) #b00000000000000000000000001111111) (= (mask!8482 thiss!1248) #b00000000000000000000000011111111) (= (mask!8482 thiss!1248) #b00000000000000000000000111111111) (= (mask!8482 thiss!1248) #b00000000000000000000001111111111) (= (mask!8482 thiss!1248) #b00000000000000000000011111111111) (= (mask!8482 thiss!1248) #b00000000000000000000111111111111) (= (mask!8482 thiss!1248) #b00000000000000000001111111111111) (= (mask!8482 thiss!1248) #b00000000000000000011111111111111) (= (mask!8482 thiss!1248) #b00000000000000000111111111111111) (= (mask!8482 thiss!1248) #b00000000000000001111111111111111) (= (mask!8482 thiss!1248) #b00000000000000011111111111111111) (= (mask!8482 thiss!1248) #b00000000000000111111111111111111) (= (mask!8482 thiss!1248) #b00000000000001111111111111111111) (= (mask!8482 thiss!1248) #b00000000000011111111111111111111) (= (mask!8482 thiss!1248) #b00000000000111111111111111111111) (= (mask!8482 thiss!1248) #b00000000001111111111111111111111) (= (mask!8482 thiss!1248) #b00000000011111111111111111111111) (= (mask!8482 thiss!1248) #b00000000111111111111111111111111) (= (mask!8482 thiss!1248) #b00000001111111111111111111111111) (= (mask!8482 thiss!1248) #b00000011111111111111111111111111) (= (mask!8482 thiss!1248) #b00000111111111111111111111111111) (= (mask!8482 thiss!1248) #b00001111111111111111111111111111) (= (mask!8482 thiss!1248) #b00011111111111111111111111111111) (= (mask!8482 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8482 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!174485 d!53287))

(declare-fun b!174607 () Bool)

(declare-fun e!115299 () SeekEntryResult!544)

(assert (=> b!174607 (= e!115299 Undefined!544)))

(declare-fun b!174608 () Bool)

(declare-fun e!115297 () SeekEntryResult!544)

(declare-fun lt!86403 () SeekEntryResult!544)

(assert (=> b!174608 (= e!115297 (Found!544 (index!4346 lt!86403)))))

(declare-fun b!174609 () Bool)

(declare-fun e!115298 () SeekEntryResult!544)

(assert (=> b!174609 (= e!115298 (MissingZero!544 (index!4346 lt!86403)))))

(declare-fun b!174610 () Bool)

(assert (=> b!174610 (= e!115299 e!115297)))

(declare-fun lt!86404 () (_ BitVec 64))

(assert (=> b!174610 (= lt!86404 (select (arr!3473 (_keys!5448 thiss!1248)) (index!4346 lt!86403)))))

(declare-fun c!31256 () Bool)

(assert (=> b!174610 (= c!31256 (= lt!86404 key!828))))

(declare-fun b!174611 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7311 (_ BitVec 32)) SeekEntryResult!544)

(assert (=> b!174611 (= e!115298 (seekKeyOrZeroReturnVacant!0 (x!19214 lt!86403) (index!4346 lt!86403) (index!4346 lt!86403) key!828 (_keys!5448 thiss!1248) (mask!8482 thiss!1248)))))

(declare-fun d!53289 () Bool)

(declare-fun lt!86402 () SeekEntryResult!544)

(assert (=> d!53289 (and (or ((_ is Undefined!544) lt!86402) (not ((_ is Found!544) lt!86402)) (and (bvsge (index!4345 lt!86402) #b00000000000000000000000000000000) (bvslt (index!4345 lt!86402) (size!3773 (_keys!5448 thiss!1248))))) (or ((_ is Undefined!544) lt!86402) ((_ is Found!544) lt!86402) (not ((_ is MissingZero!544) lt!86402)) (and (bvsge (index!4344 lt!86402) #b00000000000000000000000000000000) (bvslt (index!4344 lt!86402) (size!3773 (_keys!5448 thiss!1248))))) (or ((_ is Undefined!544) lt!86402) ((_ is Found!544) lt!86402) ((_ is MissingZero!544) lt!86402) (not ((_ is MissingVacant!544) lt!86402)) (and (bvsge (index!4347 lt!86402) #b00000000000000000000000000000000) (bvslt (index!4347 lt!86402) (size!3773 (_keys!5448 thiss!1248))))) (or ((_ is Undefined!544) lt!86402) (ite ((_ is Found!544) lt!86402) (= (select (arr!3473 (_keys!5448 thiss!1248)) (index!4345 lt!86402)) key!828) (ite ((_ is MissingZero!544) lt!86402) (= (select (arr!3473 (_keys!5448 thiss!1248)) (index!4344 lt!86402)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!544) lt!86402) (= (select (arr!3473 (_keys!5448 thiss!1248)) (index!4347 lt!86402)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53289 (= lt!86402 e!115299)))

(declare-fun c!31257 () Bool)

(assert (=> d!53289 (= c!31257 (and ((_ is Intermediate!544) lt!86403) (undefined!1356 lt!86403)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7311 (_ BitVec 32)) SeekEntryResult!544)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53289 (= lt!86403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8482 thiss!1248)) key!828 (_keys!5448 thiss!1248) (mask!8482 thiss!1248)))))

(assert (=> d!53289 (validMask!0 (mask!8482 thiss!1248))))

(assert (=> d!53289 (= (seekEntryOrOpen!0 key!828 (_keys!5448 thiss!1248) (mask!8482 thiss!1248)) lt!86402)))

(declare-fun b!174612 () Bool)

(declare-fun c!31255 () Bool)

(assert (=> b!174612 (= c!31255 (= lt!86404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174612 (= e!115297 e!115298)))

(assert (= (and d!53289 c!31257) b!174607))

(assert (= (and d!53289 (not c!31257)) b!174610))

(assert (= (and b!174610 c!31256) b!174608))

(assert (= (and b!174610 (not c!31256)) b!174612))

(assert (= (and b!174612 c!31255) b!174609))

(assert (= (and b!174612 (not c!31255)) b!174611))

(declare-fun m!203635 () Bool)

(assert (=> b!174610 m!203635))

(declare-fun m!203637 () Bool)

(assert (=> b!174611 m!203637))

(declare-fun m!203639 () Bool)

(assert (=> d!53289 m!203639))

(declare-fun m!203641 () Bool)

(assert (=> d!53289 m!203641))

(assert (=> d!53289 m!203535))

(declare-fun m!203643 () Bool)

(assert (=> d!53289 m!203643))

(declare-fun m!203645 () Bool)

(assert (=> d!53289 m!203645))

(declare-fun m!203647 () Bool)

(assert (=> d!53289 m!203647))

(assert (=> d!53289 m!203645))

(assert (=> b!174482 d!53289))

(declare-fun mapIsEmpty!6971 () Bool)

(declare-fun mapRes!6971 () Bool)

(assert (=> mapIsEmpty!6971 mapRes!6971))

(declare-fun b!174620 () Bool)

(declare-fun e!115305 () Bool)

(assert (=> b!174620 (= e!115305 tp_is_empty!4089)))

(declare-fun b!174619 () Bool)

(declare-fun e!115304 () Bool)

(assert (=> b!174619 (= e!115304 tp_is_empty!4089)))

(declare-fun condMapEmpty!6971 () Bool)

(declare-fun mapDefault!6971 () ValueCell!1701)

(assert (=> mapNonEmpty!6965 (= condMapEmpty!6971 (= mapRest!6965 ((as const (Array (_ BitVec 32) ValueCell!1701)) mapDefault!6971)))))

(assert (=> mapNonEmpty!6965 (= tp!15620 (and e!115305 mapRes!6971))))

(declare-fun mapNonEmpty!6971 () Bool)

(declare-fun tp!15629 () Bool)

(assert (=> mapNonEmpty!6971 (= mapRes!6971 (and tp!15629 e!115304))))

(declare-fun mapRest!6971 () (Array (_ BitVec 32) ValueCell!1701))

(declare-fun mapValue!6971 () ValueCell!1701)

(declare-fun mapKey!6971 () (_ BitVec 32))

(assert (=> mapNonEmpty!6971 (= mapRest!6965 (store mapRest!6971 mapKey!6971 mapValue!6971))))

(assert (= (and mapNonEmpty!6965 condMapEmpty!6971) mapIsEmpty!6971))

(assert (= (and mapNonEmpty!6965 (not condMapEmpty!6971)) mapNonEmpty!6971))

(assert (= (and mapNonEmpty!6971 ((_ is ValueCellFull!1701) mapValue!6971)) b!174619))

(assert (= (and mapNonEmpty!6965 ((_ is ValueCellFull!1701) mapDefault!6971)) b!174620))

(declare-fun m!203649 () Bool)

(assert (=> mapNonEmpty!6971 m!203649))

(declare-fun b_lambda!6985 () Bool)

(assert (= b_lambda!6983 (or (and b!174483 b_free!4317) b_lambda!6985)))

(check-sat (not b!174586) (not b!174572) (not b!174588) (not b_lambda!6985) (not bm!17689) (not b!174529) (not b!174581) (not bm!17684) (not b_next!4317) (not b!174527) (not b!174582) (not bm!17683) (not b!174587) (not d!53289) tp_is_empty!4089 (not bm!17688) (not b!174519) (not d!53285) (not b!174580) (not b!174520) (not d!53281) b_and!10787 (not b!174583) (not mapNonEmpty!6971) (not b!174518) (not b!174611) (not d!53283))
(check-sat b_and!10787 (not b_next!4317))
